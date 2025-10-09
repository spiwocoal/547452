/*
 * File:   main.c
 * Author: root
 *
 * Created on October 7, 2025, 1:00 PM
 */

#include "configuration_bits.h"

#include <xc.h>

void main(void) {
    TRISBbits.RB3 = 0;
    LATBbits.LATB3 = 1;
    
    return;
}
