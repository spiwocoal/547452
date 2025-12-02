#include <stdbool.h>

#include <xc.h>

#include "bsp/pwm.h"
#include "usb_device.h"

#ifndef TMR2_PRESCALER
#define TMR2_PRESCALER 4
#endif

#if TMR2_PRESCALER == 1
#define TMR2_PRSC 0b00
#elif TMR2_PRESCALER == 4
#define TMR2_PRSC 0b01
#elif TMR2_PRESCALER == 16
#define TMR2_PRSC 0b10
#else
#error "TMR2 Prescaler value not valid"
#endif

#ifndef PER_FBITS
#define PER_FBITS 26
#endif

#define PWM_TRIS TRISCbits.TRISC1

#define PWM_MODE 0b1100;
#define CMP_INT_MODE 0b1010;

#define INPUT  1
#define OUTPUT 0

#define ENABLED 1
#define DISABLED 0

static duty_t duty_start, duty_end;
static uint32_t ramp_start, ramp_end;
static slope_t ramp_slope;
static int8_t slope_sign;

static bool ramp_en = false;

#define SLOPE_MIN 1;

void pwm_init(freq_t freq) {
    PR2 = freq2pr2(freq);
    
    CCPR2L = 0;
    CCP2CONbits.DC2B = 0;
    
    PWM_TRIS = OUTPUT;
    T2CONbits.T2CKPS = TMR2_PRSC;
    TMR2ON = ENABLED;
    CCP2CONbits.CCP2M = PWM_MODE;

    ramp_en = false;
}

void pwm_set_frequency(freq_t freq) {
    PR2 = freq2pr2(freq);
}

void pwm_set_dutycycle(duty_t duty, freq_t freq) {
    uint16_t ccpr = duty2ccpr(duty, freq);
    CCPR2L = (uint8_t)(ccpr >> 2);
    CCP2CONbits.DC2B = duty & 0b11;
}

void pwm_interp_dutycycle(duty_t start, duty_t end, time_t tspan, freq_t freq) {
    ramp_start = USBGet1msTickCount();
    ramp_end = ramp_start + tspan;
    
    ramp_slope = ((uint32_t)(end - start) << 6) / tspan;
    slope_sign = (end > start ? 1 : -1);
    if (ramp_slope == 0) ramp_slope = SLOPE_MIN;
    
    duty_start = start;
    duty_end = end;
    
    ramp_en = true;
}

uint8_t freq2pr2(freq_t freq) {
    return (uint8_t)((_XTAL_FREQ) / (freq * 4 * TMR2_PRESCALER)) - 1;
}

uint16_t duty2ccpr(duty_t duty, freq_t freq) {
    return (uint16_t)(((fptd)(duty) * ((_XTAL_FREQ / (freq * TMR2_PRESCALER)) - 1) / 100) >> 9);
}

duty_t PWMTasks(freq_t freq, duty_t duty) {
    uint32_t ms_now, elapsed;
    if (!ramp_en) {
        return duty;
    } else {
        ms_now = USBGet1msTickCount();
        elapsed = ms_now - ramp_start;
        if (ms_now > ramp_end) { 
            ramp_en = false;
            return duty;
        }
        if (slope_sign == 1) {
            duty = duty_start + (uint16_t)((ramp_slope * elapsed) >> 6);
        } else if (slope_sign == -1) {
            duty = duty_start - (uint16_t)((ramp_slope * elapsed) >> 6);
        }
        if ((slope_sign == 1 && duty > duty_end) || (slope_sign == -1 && duty < duty_end)) {
            duty = duty_end;
            ramp_en = false;
        }
        pwm_set_dutycycle(duty, freq);
        
        return duty;
    }
}
