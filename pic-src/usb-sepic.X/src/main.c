/*
 * File:   main.c
 * Author: root
 *
 * Created on October 7, 2025, 1:00 PM
 */

#include "configuration_bits.h"

#include <xc.h>

#include "utils.h"

const uint32_t pwm_freq = (100000 << 8);

void main(void) {
    adc_init();
    pwm_init(pwm_freq);
    
    uint16_t duty_cycle;
    
    while(1) {
        duty_cycle = adc_read() * 3 / 4;
        pwm_set_duty_raw(duty_cycle);
    }
    
    return;
}