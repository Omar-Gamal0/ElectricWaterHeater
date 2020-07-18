<<<<<<< HEAD
#include "Main.h"

void Initialization(void){
  TRISD=0;             // Setting all PORT D pins directions as output
  TRISA.B2 = 1;        // Setting PORT A pin2 (Analog channel 2) as input
  TRISA.B4 = 0;        // Setting PORT A pin4 (Selection Display 3) pin as output
  TRISA.B5 = 0;        // Setting PORT A pin5 (Selection Display 4) pin as output

  TRISB.B0 = 1;        // Setting PORT B pin0 (External interrupt) as input
  TRISB.B2 = 1;        // Setting PORT B pin2 (Up Button) as input
  TRISB.B1 = 1;        // Setting PORT B pin1 (Down Button) as input
  TRISB.B7 = 0;        // Setting PORT B pin7 (Heating state LED) as output

  TRISC.B5 = 0;        // Setting PORT C pin5 (the heater) pin as output
  TRISC.B2 = 0;        // Setting PORT C pin2 (the fan) pin as output
  PORTC.B5 = 0;        // Setting PORT C pin5 (the heater) pin as LOW (Making sure the heater is off)
  PORTC.B2 = 0;        // Setting PORT C pin2 (the fan) pin as LOW (Making sure the fan is off)

  PORTB.B7 = 0;        // Setting PORT B pin7 (Heating state LED) pin as LOW

  PORTD=0;             // Setting all PORT D pins values as LOW
  PORTA=0;             // Setting all PORT A pins values as LOW

}

void Off_State(void){
  Wait();              // Calling the wait function
  PORTD=0;             // Setting all PORT D pins values as LOW
  PORTA=0;             // Setting all PORT A pins values as LOW
}




void Init_Timer0(void){
  INTCON.GIE=1;        // Enabling Global Interrupt
  INTCON.PEIE=1;       // Enabling all unmasked peripheral interrupts
  INTCON.TMR0IE=1;     // Enabling Timer0 Overflow Interrupt
  OPTION_REG.PSA=0;    // Assigning Prescaler to the Timer0 module
  OPTION_REG.PS2=1;    // Setting the Prescaler rate
  OPTION_REG.PS1=1;    // Setting the Prescaler rate
  OPTION_REG.PS0=1;    // Setting the Prescaler rate
  TMR0=100;            // Setting Timer0 Module Register value with a value that gives overflow interrupt after 10ms
=======
#include "Main.h"

void Initialization(void){
  TRISD=0;             // Setting all PORT D pins directions as output
  TRISA.B2 = 1;        // Setting PORT A pin2 (Analog channel 2) as input
  TRISA.B4 = 0;        // Setting PORT A pin4 (Selection Display 3) pin as output
  TRISA.B5 = 0;        // Setting PORT A pin5 (Selection Display 4) pin as output

  TRISB.B0 = 1;        // Setting PORT B pin0 (External interrupt) as input
  TRISB.B2 = 1;        // Setting PORT B pin2 (Up Button) as input
  TRISB.B1 = 1;        // Setting PORT B pin1 (Down Button) as input
  TRISB.B7 = 0;        // Setting PORT B pin7 (Heating state LED) as output

  TRISC.B5 = 0;        // Setting PORT C pin5 (the heater) pin as output
  TRISC.B2 = 0;        // Setting PORT C pin2 (the fan) pin as output
  PORTC.B5 = 0;        // Setting PORT C pin5 (the heater) pin as LOW (Making sure the heater is off)
  PORTC.B2 = 0;        // Setting PORT C pin2 (the fan) pin as LOW (Making sure the fan is off)

  PORTB.B7 = 0;        // Setting PORT B pin7 (Heating state LED) pin as LOW

  PORTD=0;             // Setting all PORT D pins values as LOW
  PORTA=0;             // Setting all PORT A pins values as LOW

}

void Off_State(void){
  Wait();              // Calling the wait function
  PORTD=0;             // Setting all PORT D pins values as LOW
  PORTA=0;             // Setting all PORT A pins values as LOW
}




void Init_Timer0(void){
  INTCON.GIE=1;        // Enabling Global Interrupt
  INTCON.PEIE=1;       // Enabling all unmasked peripheral interrupts
  INTCON.TMR0IE=1;     // Enabling Timer0 Overflow Interrupt
  OPTION_REG.PSA=0;    // Assigning Prescaler to the Timer0 module
  OPTION_REG.PS2=1;    // Setting the Prescaler rate
  OPTION_REG.PS1=1;    // Setting the Prescaler rate
  OPTION_REG.PS0=1;    // Setting the Prescaler rate
  TMR0=100;            // Setting Timer0 Module Register value with a value that gives overflow interrupt after 10ms
>>>>>>> fb2327c20e9b5f5d914b13cb41c499f79a1633aa
}