/* 
 * File:   utils.h
 * Author: libvirt
 *
 * Created on November 11, 2025, 7:57 AM
 */

#ifndef UTILS_H
#define	UTILS_H

#ifdef	__cplusplus
extern "C" {
#endif
    
#define _XTAL_FREQ 48000000     // CPU Oscillator frequency

#include <stdint.h>

void adc_init(void);
uint16_t adc_read(void);

void pwm_init(uint32_t);

void pwm_set_frequency_raw(uint8_t);
void pwm_set_duty_raw(uint16_t);

void pwm_set_frequency(uint32_t);
void pwm_set_duty(uint16_t);

static uint8_t frequency_convert(uint32_t);
static uint16_t duty_convert(uint16_t);

static const uint16_t in_duty_range = 100u << 9;
static const uint16_t out_duty_range = 1u << 10;


#ifdef	__cplusplus
}
#endif

#endif	/* UTILS_H */

