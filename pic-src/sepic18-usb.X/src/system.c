/*******************************************************************************
Copyright 2016 Microchip Technology Inc. (www.microchip.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

To request to license the code under the MLA license (www.microchip.com/mla_license), 
please contact mla_licensing@microchip.com
*******************************************************************************/

#include "system.h"
#include "usb.h"

/** CONFIGURATION Bits **********************************************/
#pragma config PLLDIV   = 5         // PLL Divide by 5 (20 MHz crystal)
#pragma config CPUDIV   = OSC1_PLL2 // Primary Oscillator /1, 96 Mhz PLL /2
#pragma config USBDIV   = 2         // Clock source from 96MHz PLL/2
#pragma config FOSC     = HSPLL_HS  // HS Oscillator, PLL enabled
#pragma config FCMEN    = OFF       // Fail-Safe Clock Monitor disabled
#pragma config IESO     = OFF       // Oscillator Switchover mode disabled
#pragma config PWRT     = OFF       // Power-up Timer disabled
#pragma config BOR      = ON        // Brown-out Reset enabled
#pragma config BORV     = 1         // BOR Voltage at 4.33V
#pragma config VREGEN   = ON        // USB Voltage Regulator enabled
#pragma config WDT      = OFF       // Watchdog Timer Disabled
#pragma config WDTPS    = 32768
#pragma config MCLRE    = ON        // MCLR pin enabled
#pragma config LPT1OSC  = OFF       // Timer-1 high power operation
#pragma config PBADEN   = OFF       // PORTB<4:0> configured as digital I/O
#pragma config CCP2MX   = ON        // CCP2 Output multiplexed with RC1
#pragma config STVREN   = ON        // Stack full/underflow reset enabled
#pragma config LVP      = OFF       // Single-Supply ICSP enabled
#pragma config ICPRT    = OFF       // ICPORT disabled
#pragma config XINST    = OFF       // Extended Instruction Set disabled
/**
 * Code protection disabled
 */
#pragma config CP0      = OFF
#pragma config CP1      = OFF
#pragma config CP2      = OFF
#pragma config CP3      = OFF
#pragma config CPB      = OFF
#pragma config CPD      = OFF
#pragma config WRT0     = OFF
#pragma config WRT1     = OFF
#pragma config WRT2     = OFF
#pragma config WRT3     = OFF
#pragma config WRTB     = OFF
#pragma config WRTC     = OFF
#pragma config WRTD     = OFF
#pragma config EBTR0    = OFF
#pragma config EBTR1    = OFF
#pragma config EBTR2    = OFF
#pragma config EBTR3    = OFF
#pragma config EBTRB    = OFF


/*********************************************************************
* Function: void SYSTEM_Initialize( SYSTEM_STATE state )
*
* Overview: Initializes the system.
*
* PreCondition: None
*
* Input:  SYSTEM_STATE - the state to initialize the system into
*
* Output: None
*
********************************************************************/
void SYSTEM_Initialize( SYSTEM_STATE state )
{
    switch(state)
    {
        case SYSTEM_STATE_USB_START:
            LED_Enable(LED_USB_DEVICE_STATE);
            break;
			
        case SYSTEM_STATE_USB_SUSPEND: 
            break;
            
        case SYSTEM_STATE_USB_RESUME:
            break;
    }
}

			
#if(__XC8_VERSION < 2000)
    #define INTERRUPT interrupt
#else
    #define INTERRUPT __interrupt()
#endif

void INTERRUPT SYS_InterruptHigh(void)
{
    #if defined(USB_INTERRUPT)
        USBDeviceTasks();
    #endif
}
