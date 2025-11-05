/*
 * File:   main.c
 * Author: root
 *
 * Created on October 7, 2025, 1:00 PM
 */

#include "configuration_bits.h"

#include <xc.h>
#include <stdint.h>

void adc_init(void);
uint16_t adc_read(void);

void pwm_init(uint32_t);

void pwm_set_frequency_raw(uint32_t);
void pwm_set_duty_raw(uint16_t);

void pwm_set_frequency(uint32_t);
void pwm_set_duty(uint16_t);

static uint16_t frequency_convert(uint32_t);
static uint16_t duty_convert(uint16_t);

static const uint32_t pwm_freq = (60000 << 8);

void main(void) {
    adc_init();
    pwm_init(pwm_freq);
    
    uint16_t duty_cycle;
    
    while(1) {
        duty_cycle = adc_read();
        pwm_set_duty_raw(duty_cycle);
    }
    
    return;
}

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
    return (ADRESH << 8) + ADRESL;
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

void pwm_set_frequency_raw(uint32_t freq) {
    PR2 = freq;
}

void pwm_set_duty_raw(uint16_t duty) {
    CCPR2L = duty >> 2;
    CCP2CONbits.DC2B = duty & 0b11;
}

// frecuencia (Hz) en punto fijo Q24.8
void pwm_set_frequency(uint32_t freq) {
    freq = frequency_convert(freq);
    pwm_set_frequency_raw(freq);
}

// duty (%) en punto fijo Q7.9
void pwm_set_duty(uint16_t duty) {
    duty = duty_convert(duty);
    pwm_set_duty_raw(duty);
}

static uint16_t frequency_convert(uint32_t freq) {
    // PWM PERIOD = (PR2 + 1) * 4 * TOSC * TMR2_PRESCALER
    uint32_t period = (1 << 31) / freq; // Periodo en Q9.23
    return ((period * _XTAL_FREQ) >> (23 + 2)) - 1;
}

static const uint16_t in_duty_range = 100 << 9;
static const uint16_t out_duty_range = 1 << 10;

// Mapear rango en punto fijo a 10 bits
static uint16_t duty_convert(uint16_t duty) {
    // PWM Duty Cycle = (CCPR2L:CCP2CON<5:4>) * Tosc * TMR2_PRESCALER
    return (uint32_t)duty * out_duty_range / in_duty_range;
}