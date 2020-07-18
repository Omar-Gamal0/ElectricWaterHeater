
_Initialization:

;System.c,3 :: 		void Initialization(void){
;System.c,4 :: 		TRISD=0;             // Setting all PORT D pins directions as output
	CLRF       TRISD+0
;System.c,5 :: 		TRISA.B2 = 1;        // Setting PORT A pin2 (Analog channel 2) as input
	BSF        TRISA+0, 2
;System.c,6 :: 		TRISA.B4 = 0;        // Setting PORT A pin4 (Selection Display 3) pin as output
	BCF        TRISA+0, 4
;System.c,7 :: 		TRISA.B5 = 0;        // Setting PORT A pin5 (Selection Display 4) pin as output
	BCF        TRISA+0, 5
;System.c,9 :: 		TRISB.B0 = 1;        // Setting PORT B pin0 (External interrupt) as input
	BSF        TRISB+0, 0
;System.c,10 :: 		TRISB.B2 = 1;        // Setting PORT B pin2 (Up Button) as input
	BSF        TRISB+0, 2
;System.c,11 :: 		TRISB.B1 = 1;        // Setting PORT B pin1 (Down Button) as input
	BSF        TRISB+0, 1
;System.c,12 :: 		TRISB.B7 = 0;        // Setting PORT B pin7 (Heating state LED) as output
	BCF        TRISB+0, 7
;System.c,14 :: 		TRISC.B5 = 0;        // Setting PORT C pin5 (the heater) pin as output
	BCF        TRISC+0, 5
;System.c,15 :: 		TRISC.B2 = 0;        // Setting PORT C pin2 (the fan) pin as output
	BCF        TRISC+0, 2
;System.c,16 :: 		PORTC.B5 = 0;        // Setting PORT C pin5 (the heater) pin as LOW (Making sure the heater is off)
	BCF        PORTC+0, 5
;System.c,17 :: 		PORTC.B2 = 0;        // Setting PORT C pin2 (the fan) pin as LOW (Making sure the fan is off)
	BCF        PORTC+0, 2
;System.c,19 :: 		PORTB.B7 = 0;        // Setting PORT B pin7 (Heating state LED) pin as LOW
	BCF        PORTB+0, 7
;System.c,21 :: 		PORTD=0;             // Setting all PORT D pins values as LOW
	CLRF       PORTD+0
;System.c,22 :: 		PORTA=0;             // Setting all PORT A pins values as LOW
	CLRF       PORTA+0
;System.c,24 :: 		}
L_end_Initialization:
	RETURN
; end of _Initialization

_Off_State:

;System.c,26 :: 		void Off_State(void){
;System.c,27 :: 		Wait();              // Calling the wait function
	CALL       _Wait+0
;System.c,28 :: 		PORTD=0;             // Setting all PORT D pins values as LOW
	CLRF       PORTD+0
;System.c,29 :: 		PORTA=0;             // Setting all PORT A pins values as LOW
	CLRF       PORTA+0
;System.c,30 :: 		}
L_end_Off_State:
	RETURN
; end of _Off_State

_Init_Timer0:

;System.c,35 :: 		void Init_Timer0(void){
;System.c,36 :: 		INTCON.GIE=1;        // Enabling Global Interrupt
	BSF        INTCON+0, 7
;System.c,37 :: 		INTCON.PEIE=1;       // Enabling all unmasked peripheral interrupts
	BSF        INTCON+0, 6
;System.c,38 :: 		INTCON.TMR0IE=1;     // Enabling Timer0 Overflow Interrupt
	BSF        INTCON+0, 5
;System.c,39 :: 		OPTION_REG.PSA=0;    // Assigning Prescaler to the Timer0 module
	BCF        OPTION_REG+0, 3
;System.c,40 :: 		OPTION_REG.PS2=1;    // Setting the Prescaler rate
	BSF        OPTION_REG+0, 2
;System.c,41 :: 		OPTION_REG.PS1=1;    // Setting the Prescaler rate
	BSF        OPTION_REG+0, 1
;System.c,42 :: 		OPTION_REG.PS0=1;    // Setting the Prescaler rate
	BSF        OPTION_REG+0, 0
;System.c,43 :: 		TMR0=100;            // Setting Timer0 Module Register value with a value that gives overflow interrupt after 10ms
	MOVLW      100
	MOVWF      TMR0+0
;System.c,44 :: 		}
L_end_Init_Timer0:
	RETURN
; end of _Init_Timer0
