#include <stdio.h>
#include <string.h>
#include <sys/param.h>

// (Sistema Operativo)
#include "esp_err.h"
#include "esp_event_base.h"
#include "esp_interface.h"
#include "esp_netif_types.h"
#include "esp_wifi_default.h"
#include "esp_wifi_types_generic.h"
#include "freertos/FreeRTOS.h"      // Configuración básica 
#include "freertos/projdefs.h"
#include "freertos/task.h"          // Tareas (Hilos)
#include "freertos/timers.h"        // Temporizadores software
#include "freertos/event_groups.h"  // Sincronización (Banderas)
#include "freertos/queue.h"         // Colas de mensajes

//Wi-Fi y Sistema ESP32
#include "esp_system.h"     // Sistema base
#include "esp_wifi.h"       // Driver Wi-Fi
#include "esp_log.h"        // Logs (ESP_LOGI)
#include "esp_check.h"      // Macros de error
#include "esp_mac.h"        // Dirección MAC
#include "esp_netif.h"      // Interfaz de red
#include "esp_event.h"      // Loop de eventos
#include "lwip/ip4_addr.h"
#include "nvs_flash.h"      // Memoria No Volátil (Vital para Wi-Fi)

//LwIP
#include "lwip/inet.h"      // Formateo de IP (inet_addr)
#include "lwip/sockets.h"   // API de Sockets (socket, sendto)
#include "lwip/ip_addr.h"   // Estructuras de IP

//MDNS
#include "mdns.h"

//Wi-Fi EasyConnect
#include "esp_dpp.h"
#include "portmacro.h"
#include "qrcode.h"

//ADC
#include "esp_adc/adc_oneshot.h"
#include "esp_adc/adc_cali.h"
#include "esp_adc/adc_cali_scheme.h"
#include "esp_timer.h"

#include <driver/gpio.h>
#include <iot_button.h>
#include <button_gpio.h>

#ifdef CONFIG_ESP_DPP_BOOTSTRAPPING_KEY
#define SEPIC_DPP_BOOTSTRAPPING_KEY CONFIG_ESP_DPP_BOOTSTRAPPING_KEY
#else
#define SEPIC_DPP_BOOTSTRAPPING_KEY 0
#endif

#define CURVE_SEC256R1_PKEY_HEX_DIGITS     64

// AP y STA
#define SSID "Cecilia"
#define PASS "tomas2102"
#define PORT 4444

bool internet_conectado = false;
static const char *TAG = "WIFI_AP_STA";

#define ESP_AP_SSID "ESP32_Pelele_AP"
#define ESP_AP_PASS "12345678"
#define MAX_STA_CONN 4

wifi_config_t s_dpp_wifi_config;
static EventGroupHandle_t s_dpp_event_group;

static int s_retry_num = 0;

#define DPP_CONNECTED_BIT       BIT0
#define DPP_CONNECT_FAIL_BIT    BIT1
#define DPP_AUTH_FAIL_BIT       BIT2
#define WIFI_MAX_RETRY_NUM      3

// ADC GLOBALES
#define ADC_PIN ADC_CHANNEL_6
adc_oneshot_unit_handle_t adc1_handle;
int adc_raw;
float convertion_adc = 3.3 / 4095.0;

void start_mdns_service() {
    ESP_ERROR_CHECK(mdns_init());
    mdns_hostname_set("esp32-pelele");
    mdns_instance_name_set("Grupo 1 esp32");
    mdns_service_add(NULL, "_my_udp", "_udp", PORT, NULL, 0);
}

static void udp_stream_task(void *pvParameters) {
    char rx_buffer[128];
    char tx_buffer[128];

    struct sockaddr_in my_addr;
    my_addr.sin_addr.s_addr = htonl(INADDR_ANY); // Escucha en cualquier IP
    my_addr.sin_family = AF_INET;
    my_addr.sin_port = htons(PORT);

    int sock = socket(AF_INET, SOCK_DGRAM, IPPROTO_IP);
    if (sock < 0) {
        ESP_LOGE(TAG, "Error creando socket: errno %d", errno);
        vTaskDelete(NULL);
        return;
    }

    int err = bind(sock, (struct sockaddr *)&my_addr, sizeof(my_addr));
    if (err < 0) {
        ESP_LOGE(TAG, "Error binding: errno %d", errno);
        close(sock);
        vTaskDelete(NULL);
        return;
    }

    ESP_LOGI(TAG, "Esperando señal de inicio de la PC en puerto %d...", PORT);

    struct sockaddr_storage source_addr;
    socklen_t socklen = sizeof(source_addr);
    struct sockaddr_in target_addr;

    while (1) {
        // ESPERA EL START
        ESP_LOGI(TAG, "Esperando comando 'START'...");
        bool streaming = false;

        while (!streaming) {
            socklen = sizeof(source_addr);

            int len = recvfrom(sock, rx_buffer, sizeof(rx_buffer) - 1, 0,
                               (struct sockaddr *)&source_addr, &socklen);

            if (len > 0) {
                rx_buffer[len] = 0;
                if (strncmp(rx_buffer, "START", 5) == 0) {
                    memcpy(&target_addr, &source_addr,
                           sizeof(struct sockaddr_in));
                    ESP_LOGI(TAG, "START recibido. Enviando datos...");
                    streaming = true;
                }
            }
        }
        while (streaming) {

            int len = recvfrom(sock, rx_buffer, sizeof(rx_buffer) - 1,
                               MSG_DONTWAIT, NULL, NULL);

            if (len > 0) {
                rx_buffer[len] = 0;
                // SI se recibe END se detiene streaming
                if (strncmp(rx_buffer, "END", 3) == 0) {
                    ESP_LOGI(TAG,
                             "Comando END recibido. Deteniendo transmisión.");
                    streaming = false;
                    break;
                }
            }
            // Lectura del ADC
            int ret = (adc_oneshot_read(adc1_handle, ADC_PIN, &adc_raw));
            if (ret == ESP_OK) {
                float value = convertion_adc * adc_raw; //
                int64_t tiempo_us = esp_timer_get_time();

                sprintf(tx_buffer, "value:%.2f,timestamp:%lld", value,
                        tiempo_us);
                sendto(sock, tx_buffer, strlen(tx_buffer), 0,
                       (struct sockaddr *)&target_addr, sizeof(target_addr));
            }

            // Controlar la velocidad de muestreo
            vTaskDelay(pdMS_TO_TICKS(50));
        }
    }
    close(sock);
    vTaskDelete(NULL);
}

void init_adc() {
    adc_oneshot_unit_init_cfg_t init_config1 = {
        .unit_id = ADC_UNIT_1,
        .ulp_mode = ADC_ULP_MODE_DISABLE,
    };
    ESP_ERROR_CHECK(adc_oneshot_new_unit(&init_config1, &adc1_handle));

    adc_oneshot_chan_cfg_t config = {
        .bitwidth = ADC_BITWIDTH_12, // 12 bits de resolucion
        .atten = ADC_ATTEN_DB_12     // rango completo 3.3V
    };
    ESP_ERROR_CHECK(adc_oneshot_config_channel(adc1_handle, ADC_PIN, &config));
}

static void stored_config_erase(void *button_handle, void *usr_data) {
    ESP_LOGI(TAG, "Se mantuvo presionado el botón, borrando memoria NVS");
    nvs_flash_erase();
    esp_restart();
}

void init_button() {
    const button_config_t btn_cfg = {0};
    const button_gpio_config_t btn_gpio_cfg = {
        .gpio_num = 0,
        .active_level = 0,
    };

    button_handle_t gpio_btn = NULL;
    ESP_ERROR_CHECK(iot_button_new_gpio_device(&btn_cfg, &btn_gpio_cfg, &gpio_btn));
    if (gpio_btn == NULL) {
        ESP_LOGE(TAG, "Falló la creación del botón");
    }

    button_event_args_t args = {
        .long_press.press_time = 5000
    };

    iot_button_register_cb(gpio_btn, BUTTON_LONG_PRESS_START, &args, stored_config_erase, NULL);
}

static void wifi_event_handler(void *arg, esp_event_base_t event_base,
                               int32_t event_id, void *event_data) {
    // Eventos de la conexión STA
    if (event_base == WIFI_EVENT) {
        switch (event_id) {
            case WIFI_EVENT_STA_START:
                if (strlen((const char *)s_dpp_wifi_config.sta.ssid) > 0) {
                    ESP_ERROR_CHECK(esp_wifi_connect());
                } else {
                    ESP_ERROR_CHECK(esp_supp_dpp_start_listen());
                    ESP_LOGI(TAG, "Se empezó a escuchar por autenticación DPP");
                }
                break;
            case WIFI_EVENT_STA_DISCONNECTED:
                if (s_retry_num < WIFI_MAX_RETRY_NUM) {
                    esp_wifi_connect();
                    s_retry_num++;
                    ESP_LOGI(TAG, "Evento de desconexión, reintentando conectarse al AP (intento %d/%d)", s_retry_num, WIFI_MAX_RETRY_NUM);
                } else {
                    xEventGroupSetBits(s_dpp_event_group, DPP_CONNECT_FAIL_BIT);
                }
                break;
            case WIFI_EVENT_STA_CONNECTED:
                ESP_LOGI(TAG, "Conexión realizada con éxito al AP con SSID : %s", s_dpp_wifi_config.sta.ssid);
                break;
            case WIFI_EVENT_DPP_URI_READY:
                wifi_event_dpp_uri_ready_t *uri_data = event_data;
                if (uri_data != NULL) {
                    esp_qrcode_config_t cfg = ESP_QRCODE_CONFIG_DEFAULT();

                    ESP_LOGI(TAG, "Escanea el código QR para configurar el dispositivo:");
                    esp_qrcode_generate(&cfg, (const char *)uri_data->uri);
                }
                break;
            case WIFI_EVENT_DPP_CFG_RECVD:
                wifi_event_dpp_config_received_t *config = event_data;
                memcpy(&s_dpp_wifi_config, &config->wifi_cfg, sizeof(s_dpp_wifi_config));
                s_retry_num = 0;
                esp_wifi_set_config(ESP_IF_WIFI_STA, &s_dpp_wifi_config);
                esp_wifi_connect();
                break;
            case WIFI_EVENT_DPP_FAILED:
                wifi_event_dpp_failed_t *dpp_failure = event_data;
                if (s_retry_num < 5) {
                    ESP_LOGI(TAG, "DPP Auth falló (Motivo: %s), reintentando... (intento %d/%d)", esp_err_to_name(dpp_failure->failure_reason), s_retry_num, WIFI_MAX_RETRY_NUM);
                    ESP_ERROR_CHECK(esp_supp_dpp_start_listen());
                    s_retry_num++;
                } else {
                    xEventGroupSetBits(s_dpp_event_group, DPP_AUTH_FAIL_BIT);
                }
                break;
            default:
                break;
        }
    } else if (event_base == IP_EVENT && event_id == IP_EVENT_STA_GOT_IP) {
        ip_event_got_ip_t *event = (ip_event_got_ip_t *)event_data;
        ESP_LOGI(TAG, "Conectado a WIFI! IP en la red local es: " IPSTR,
                 IP2STR(&event->ip_info.ip));
        s_retry_num = 0;
        xEventGroupSetBits(s_dpp_event_group, DPP_CONNECTED_BIT);
    }

    // Eventos AP
    if (event_id == WIFI_EVENT_AP_STACONNECTED) {
        wifi_event_ap_staconnected_t *event =
            (wifi_event_ap_staconnected_t *)event_data;
        ESP_LOGI(TAG, "Dispositivo conectado a red AP. MAC:" MACSTR,
                 MAC2STR(event->mac));
    }
}

esp_err_t dpp_enrollee_boostrap(void) {
    esp_err_t ret;
    size_t pkey_len = strlen(SEPIC_DPP_BOOTSTRAPPING_KEY);
    char *key = NULL;

    if (pkey_len) {
        /* Currently only NIST P-256 curve is supported, add prefix/postfix accordingly */
        char prefix[] = "30310201010420";
        char postfix[] = "a00a06082a8648ce3d030107";

        if (pkey_len != CURVE_SEC256R1_PKEY_HEX_DIGITS) {
            ESP_LOGI(TAG, "Largo de clave privada inválido! El largo debe ser de 32 bytes (64 caracteres Hex), largo actual: %d", pkey_len);
            return ESP_FAIL;
        }

        key = malloc(sizeof(prefix) + pkey_len + sizeof(postfix));
        if (!key) {
            ESP_LOGI(TAG, "Failed to allocate for bootstrapping key");
            return ESP_ERR_NO_MEM;
        }
        sprintf(key, "%s%s%s", prefix, SEPIC_DPP_BOOTSTRAPPING_KEY, postfix);
    }

    ret = esp_supp_dpp_bootstrap_gen("6", DPP_BOOTSTRAP_QR_CODE, key, NULL);

    if (key)
        free(key);

    return ret;
}

void dpp_enrollee_init(void) {
    s_dpp_event_group = xEventGroupCreate();

    ESP_ERROR_CHECK(esp_netif_init());

    ESP_ERROR_CHECK(esp_event_loop_create_default());
    esp_netif_create_default_wifi_sta();

    ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, ESP_EVENT_ANY_ID, &wifi_event_handler, NULL));
    ESP_ERROR_CHECK(esp_event_handler_register(IP_EVENT, IP_EVENT_STA_GOT_IP, &wifi_event_handler, NULL));

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));

    ESP_ERROR_CHECK(esp_wifi_get_config(ESP_IF_WIFI_STA, &s_dpp_wifi_config));

    if (strlen((const char *)s_dpp_wifi_config.sta.ssid) > 0) {
        ESP_LOGI(TAG, "Utilizando configuración Wi-Fi guardada");
        ESP_LOGI(TAG, "SSID : %s", s_dpp_wifi_config.sta.ssid);
        ESP_LOGI(TAG, "PSWD : %s", s_dpp_wifi_config.sta.password);

        ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
        ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_STA, &s_dpp_wifi_config));
    } else {
        ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
        ESP_ERROR_CHECK(esp_supp_dpp_init(NULL));
        ESP_ERROR_CHECK(dpp_enrollee_boostrap());
    }
    ESP_ERROR_CHECK(esp_wifi_start());

    EventBits_t bits = xEventGroupWaitBits(s_dpp_event_group, DPP_CONNECTED_BIT | DPP_CONNECT_FAIL_BIT | DPP_AUTH_FAIL_BIT, pdFALSE, pdFALSE, portMAX_DELAY);

    if (bits & DPP_CONNECTED_BIT) {
    } else if (bits & DPP_CONNECT_FAIL_BIT) {
        ESP_LOGI(TAG, "Falló la conexión a\nSSID : %s\nPass: %s", s_dpp_wifi_config.sta.ssid, s_dpp_wifi_config.sta.password);
    } else if (bits & DPP_AUTH_FAIL_BIT) {
        ESP_LOGI(TAG, "Falló la autentificación DPP luego de %d intentos", s_retry_num);
    } else {
        ESP_LOGE(TAG, "Evento no esperado");
    }

    esp_supp_dpp_deinit();
    ESP_ERROR_CHECK(esp_event_handler_unregister(IP_EVENT, IP_EVENT_STA_GOT_IP, &wifi_event_handler));
    ESP_ERROR_CHECK(esp_event_handler_unregister(WIFI_EVENT, ESP_EVENT_ANY_ID, &wifi_event_handler));
    vEventGroupDelete(s_dpp_event_group);
}

void app_main(void) {
    // Iniciar NVS
    esp_err_t ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES ||
        ret == ESP_ERR_NVS_NEW_VERSION_FOUND) { // si no hay espacio o hay una
                                                // nueva version
        ESP_ERROR_CHECK(nvs_flash_erase());     // borra todo
        ret = nvs_flash_init();                 // inicia de nuevo
    }
    ESP_ERROR_CHECK(ret); // verifica que todo este bien

    // inicio del ADC
    dpp_enrollee_init();
    start_mdns_service();
    init_adc();
    init_button();
    ESP_LOGI(TAG, "SHAAAW");
    // FRERTOS crea una tarea siendo esta el envio de datos del ADC(pude haber
    // hecho una funcion que leyera pero ya lo tenai avanzado cuando lo pense)
    xTaskCreate(udp_stream_task, "udp_stream", 4096, NULL, 5, NULL);
}
