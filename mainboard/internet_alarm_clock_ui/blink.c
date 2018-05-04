//***************************************************************************************
//  MSP430 Blink the LED Demo - Software Toggle P1.0
//
//  Description; Toggle P1.0 by xor'ing P1.0 inside of a software loop.
//  ACLK = n/a, MCLK = SMCLK = default DCO
//
//                MSP430x5xx
//             -----------------
//         /|\|              XIN|-
//          | |                 |
//          --|RST          XOUT|-
//            |                 |
//            |             P1.0|-->LED
//
//  J. Stevenson
//  Texas Instruments, Inc
//  July 2011
//  Built with Code Composer Studio v5
//***************************************************************************************

#include <msp430.h>

#include "TI_USCI_I2C_master.h"

unsigned char timercounter;
unsigned char array[40] = { 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0xa, 0xb };
unsigned char store[40] = { 13, 13, 13, 13, 13, 13, 13, 0, 0, 0};

int main(void) {
	WDTCTL = WDTPW | WDTHOLD;		// Stop watchdog timer
	P1DIR |= 0x01;					// Set P1.0 to output direction

	_EINT(); //Enable interrupts

	  TI_USCI_I2C_transmitinit(0x50,0x12);  // init transmitting with USCI
	  while ( TI_USCI_I2C_notready() );         // wait for bus to be free
	  if ( TI_USCI_I2C_slave_present(0x50) )    // slave address may differ from
	  {                                         // initialization
	    TI_USCI_I2C_receiveinit(0x50,0x12);   // init receiving with USCI
	    while ( TI_USCI_I2C_notready() );         // wait for bus to be free
	    TI_USCI_I2C_receive(4,store);
	    while ( TI_USCI_I2C_notready() );         // wait for bus to be free

	    TI_USCI_I2C_transmitinit(0x50,0x12);  // init transmitting with
	    while ( TI_USCI_I2C_notready() );         // wait for bus to be free
	    TI_USCI_I2C_transmit(4,array);       // start transmitting
	  }
	
	return 0;
}
