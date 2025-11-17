/* Microchip Technology Inc. and its subsidiaries.  You may use this software 
 * and any derivatives exclusively with Microchip products. 
 * 
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".  NO WARRANTIES, WHETHER 
 * EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED 
 * WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A 
 * PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION 
 * WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION. 
 *
 * IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
 * INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
 * WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS 
 * BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.  TO THE 
 * FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS 
 * IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF 
 * ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *
 * MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE 
 * TERMS. 
 */

/* 
 * File:   
 * Author: 
 * Comments:
 * Revision history: 
 */

#ifndef PWM_H
#define	PWM_H

#include <stdint.h>

#define FPT_BITS  16
#define FPT_WBITS  7

typedef uint16_t fpt;
typedef uint32_t fptd;

#define FPT_FBITS  (FPT_BITS - FPT_WBITS)
#define FPT_FMASK  (((fpt)1 << FPT_FBITS) - 1)

#define fpt_xadd(A,B) ((A) + (B))
#define fpt_xsub(A,B) ((A) - (B))
#define fpt_xmul(A,B)                   \
  ((fpt)(((fptd)(A) * (fptd)(B)) >> FPT_FBITS))
#define fpt_xdiv(A,B)                   \
  ((fpt)(((fptd)(A) << FPT_FBITS) / (fptd)(B)))
#define fpt_fracpart(A) ((fpt)(A) & FPT_FMASK)

#define fpt_inv(A) ((fpt)((((fptd)1 << 31) / (fptd)A) >> (31 - FPT_FBITS)))
#define fptd_inv(A) ((fptd)(((fptd)1 << 31) / (fptf)A))

#ifndef _XTAL_FREQ
#define _XTAL_FREQ 48000000UL
#endif

typedef uint32_t freq_t;
typedef fpt duty_t;

void pwm_init(freq_t freq);
void pwm_set_frequency(freq_t freq);
void pwm_set_dutycycle(duty_t duty);

uint8_t freq2pr2(freq_t freq);

#endif	/* PWM_H */

