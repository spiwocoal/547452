#include "utils.h"
#include <xc.h>

void adc_init(void) {
    ADCON1bits.VCFG = 0b00;
    ADCON1bits.PCFG = 0b1110;
    TRISAbits.RA0 = 1;
    
    ADCON0bits.CHS = 0;
    
    ADCON2bits.ADFM = 1;
    ADCON2bits.ACQT = 0b010;
    ADCON2bits.ADCS = 0b010;
    
    ADCON0bits.ADON = 1;
}

uint16_t adc_read(void) {
    ADCON0bits.GO = 1;
    while (ADCON0bits.NOT_DONE);
    return (ADRESH << 8u) + ADRESL;
}

// frecuencia (Hz) en punto fijo Q24.8
void pwm_init(uint32_t freq) {
    PR2 = frequency_convert(freq);
    
    // Inicializar duty-cycle en 0%
    CCPR2L = 0;
    CCP2CONbits.DC2B = 0;
    
    TRISCbits.RC1 = 0;
    T2CONbits.TMR2ON = 1;
    CCP2CONbits.CCP2M = 0b1111;
}

void pwm_set_frequency_raw(uint8_t freq) {
    PR2 = freq;
}

void pwm_set_duty_raw(uint16_t duty) {
    CCPR2L = (uint8_t)(duty >> 2);
    CCP2CONbits.DC2B = duty & 0b11;
}

// frecuencia (Hz) en punto fijo Q24.8
void pwm_set_frequency(uint32_t freq) {
    uint8_t raw_freq = frequency_convert(freq);
    pwm_set_frequency_raw(raw_freq);
}

// duty (%) en punto fijo Q7.9
void pwm_set_duty(uint16_t duty) {
    duty = duty_convert(duty);
    pwm_set_duty_raw(duty);
}

static uint8_t frequency_convert(uint32_t freq) {
    // PWM PERIOD = (PR2 + 1) * 4 * TOSC * TMR2_PRESCALER
    uint32_t period = ((uint32_t)1 << 31) / freq; // Periodo en Q9.23
    return (((period >> 2) * _XTAL_FREQ) >> 23) - 1;
}

// Mapear rango en punto fijo a 10 bits
static uint16_t duty_convert(uint16_t duty) {
    // PWM Duty Cycle = (CCPR2L:CCP2CON<5:4>) * Tosc * TMR2_PRESCALER
    return (uint16_t)((uint32_t)duty * out_duty_range / in_duty_range);
}

