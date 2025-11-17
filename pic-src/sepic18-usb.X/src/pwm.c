#include <xc.h>

#include "pwm.h"

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

#define INPUT  1
#define OUTPUT 0

#define ENABLED 1
#define DISABLED 0

void pwm_init(freq_t freq) {
    PR2 = freq2pr2(freq);
    
    CCPR2L = 0;
    CCP2CONbits.DC2B = 0;
    
    PWM_TRIS = OUTPUT;
    T2CONbits.T2CKPS = TMR2_PRSC;
    TMR2ON = ENABLED;
    CCP2CONbits.CCP2M = 0xF;
}

void pwm_set_frequency(freq_t freq) {
    PR2 = freq2pr2(freq);
}

void pwm_set_dutycycle(duty_t duty) {
    uint16_t ccpr = duty2ccpr(duty);
    CCPR2L = (uint8_t)(ccpr >> 2);
    CCP2CONbits.DC2B = duty & 0b11;
}

void pwm_interp_dutycycle(duty_t start, duty_t end, time_t tspan) {
    
}

inline uint8_t freq2pr2(freq_t freq) {
    return (uint8_t)((_XTAL_FREQ) / (freq * 4 * TMR2_PRESCALER)) - 1;
}

inline uint16_t duty2ccpr(duty_t duty, freq_t freq) {
    return (uint16_t)(((fptd)(duty) * ((_XTAL_FREQ / (freq * TMR2_PRESCALER)) - 1) / 100) >> 9);
}