<<<<<<< HEAD

_Heater:

;TempControl.c,8 :: 		void Heater(void){
;TempControl.c,10 :: 		if(HeatingStateLED == LED_ON){                   // Checking if current blinking state of the SSD is On state
	MOVF       _HeatingStateLED+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Heater0
;TempControl.c,11 :: 		PORTB.B7 = 1;                                  // Sets Heating state LED to HIGH
	BSF        PORTB+0, 7
;TempControl.c,12 :: 		}else if(HeatingStateLED == LED_OFF){            // Checking if current blinking state of the SSD is Off state
	GOTO       L_Heater1
L_Heater0:
	MOVF       _HeatingStateLED+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Heater2
;TempControl.c,13 :: 		PORTB.B7 = 0;                                  // Sets Heating state LED to LOW
	BCF        PORTB+0, 7
;TempControl.c,14 :: 		}else{
	GOTO       L_Heater3
L_Heater2:
;TempControl.c,16 :: 		}
L_Heater3:
L_Heater1:
;TempControl.c,17 :: 		if(TempAvg < (ReqTemp + 5)){
	MOVLW      5
	ADDWF      _ReqTemp+0, 0
	MOVWF      R1+0
	MOVF       _ReqTemp+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVLW      128
	XORWF      _TempAvg+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Heater9
	MOVF       R1+0, 0
	SUBWF      _TempAvg+0, 0
L__Heater9:
	BTFSC      STATUS+0, 0
	GOTO       L_Heater4
;TempControl.c,18 :: 		PORTC.B5 = 1;                     // Setting PORT C pin5 (the heater) pin as HIGH (Turning the heater is on)
	BSF        PORTC+0, 5
;TempControl.c,19 :: 		PORTC.B2 = 0;                     // Setting PORT C pin2 (the fan) pin as LOW (Turning the fan is off)
	BCF        PORTC+0, 2
;TempControl.c,20 :: 		}else{
	GOTO       L_Heater5
L_Heater4:
;TempControl.c,21 :: 		Working_Mode = MODE_WAITING;      // Sets the working mode to waiting state (both Fan & Heater are off)
	MOVLW      2
	MOVWF      _Working_Mode+0
;TempControl.c,22 :: 		}
L_Heater5:
;TempControl.c,23 :: 		}
L_end_Heater:
	RETURN
; end of _Heater

_Fan:

;TempControl.c,25 :: 		void Fan(void){
;TempControl.c,26 :: 		PORTB.B7 = 1;                                  // Sets Heating state LED to HIGH
	BSF        PORTB+0, 7
;TempControl.c,27 :: 		if(TempAvg > (ReqTemp - 5)){
	MOVLW      5
	SUBWF      _ReqTemp+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _ReqTemp+1, 0
	MOVWF      R1+1
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _TempAvg+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Fan11
	MOVF       _TempAvg+0, 0
	SUBWF      R1+0, 0
L__Fan11:
	BTFSC      STATUS+0, 0
	GOTO       L_Fan6
;TempControl.c,28 :: 		PORTC.B5 = 0;                      // Setting PORT C pin5 (the heater) pin as LOW (Turning the heater is off)
	BCF        PORTC+0, 5
;TempControl.c,29 :: 		PORTC.B2 = 1;                      // Setting PORT C pin2 (the fan) pin as HIGH (Turning the fan is on)
	BSF        PORTC+0, 2
;TempControl.c,30 :: 		}else{
	GOTO       L_Fan7
L_Fan6:
;TempControl.c,31 :: 		Working_Mode = MODE_WAITING;       // Sets the working mode to waiting state (both Fan & Heater are off)
	MOVLW      2
	MOVWF      _Working_Mode+0
;TempControl.c,32 :: 		}
L_Fan7:
;TempControl.c,34 :: 		}
L_end_Fan:
	RETURN
; end of _Fan

_Wait:

;TempControl.c,36 :: 		void Wait(void){
;TempControl.c,37 :: 		PORTB.B7 = 0;        // Sets Heating state LED to LOW
	BCF        PORTB+0, 7
;TempControl.c,38 :: 		Time_1_Sec = 0;      // Counter variable which is to be used to count 1 second
	CLRF       _Time_1_Sec+0
	CLRF       _Time_1_Sec+1
;TempControl.c,39 :: 		PORTC.B5 = 0;        // Setting PORT C pin5 (the heater) pin as LOW (Turning the heater is off)
	BCF        PORTC+0, 5
;TempControl.c,40 :: 		PORTC.B2 = 0;        // Setting PORT C pin2 (the fan) pin as LOW (Turning the fan is off)
	BCF        PORTC+0, 2
;TempControl.c,41 :: 		}
L_end_Wait:
	RETURN
; end of _Wait
=======

_Heater:

;TempControl.c,8 :: 		void Heater(void){
;TempControl.c,10 :: 		if(HeatingStateLED == LED_ON){                   // Checking if current blinking state of the SSD is On state
	MOVF       _HeatingStateLED+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Heater0
;TempControl.c,11 :: 		PORTB.B7 = 1;                                  // Sets Heating state LED to HIGH
	BSF        PORTB+0, 7
;TempControl.c,12 :: 		}else if(HeatingStateLED == LED_OFF){            // Checking if current blinking state of the SSD is Off state
	GOTO       L_Heater1
L_Heater0:
	MOVF       _HeatingStateLED+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Heater2
;TempControl.c,13 :: 		PORTB.B7 = 0;                                  // Sets Heating state LED to LOW
	BCF        PORTB+0, 7
;TempControl.c,14 :: 		}else{
	GOTO       L_Heater3
L_Heater2:
;TempControl.c,16 :: 		}
L_Heater3:
L_Heater1:
;TempControl.c,17 :: 		if(TempAvg < (ReqTemp + 5)){
	MOVLW      5
	ADDWF      _ReqTemp+0, 0
	MOVWF      R1+0
	MOVF       _ReqTemp+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVLW      128
	XORWF      _TempAvg+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Heater9
	MOVF       R1+0, 0
	SUBWF      _TempAvg+0, 0
L__Heater9:
	BTFSC      STATUS+0, 0
	GOTO       L_Heater4
;TempControl.c,18 :: 		PORTC.B5 = 1;                     // Setting PORT C pin5 (the heater) pin as HIGH (Turning the heater is on)
	BSF        PORTC+0, 5
;TempControl.c,19 :: 		PORTC.B2 = 0;                     // Setting PORT C pin2 (the fan) pin as LOW (Turning the fan is off)
	BCF        PORTC+0, 2
;TempControl.c,20 :: 		}else{
	GOTO       L_Heater5
L_Heater4:
;TempControl.c,21 :: 		Working_Mode = MODE_WAITING;      // Sets the working mode to waiting state (both Fan & Heater are off)
	MOVLW      2
	MOVWF      _Working_Mode+0
;TempControl.c,22 :: 		}
L_Heater5:
;TempControl.c,23 :: 		}
L_end_Heater:
	RETURN
; end of _Heater

_Fan:

;TempControl.c,25 :: 		void Fan(void){
;TempControl.c,26 :: 		PORTB.B7 = 1;                                  // Sets Heating state LED to HIGH
	BSF        PORTB+0, 7
;TempControl.c,27 :: 		if(TempAvg > (ReqTemp - 5)){
	MOVLW      5
	SUBWF      _ReqTemp+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _ReqTemp+1, 0
	MOVWF      R1+1
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _TempAvg+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Fan11
	MOVF       _TempAvg+0, 0
	SUBWF      R1+0, 0
L__Fan11:
	BTFSC      STATUS+0, 0
	GOTO       L_Fan6
;TempControl.c,28 :: 		PORTC.B5 = 0;                      // Setting PORT C pin5 (the heater) pin as LOW (Turning the heater is off)
	BCF        PORTC+0, 5
;TempControl.c,29 :: 		PORTC.B2 = 1;                      // Setting PORT C pin2 (the fan) pin as HIGH (Turning the fan is on)
	BSF        PORTC+0, 2
;TempControl.c,30 :: 		}else{
	GOTO       L_Fan7
L_Fan6:
;TempControl.c,31 :: 		Working_Mode = MODE_WAITING;       // Sets the working mode to waiting state (both Fan & Heater are off)
	MOVLW      2
	MOVWF      _Working_Mode+0
;TempControl.c,32 :: 		}
L_Fan7:
;TempControl.c,34 :: 		}
L_end_Fan:
	RETURN
; end of _Fan

_Wait:

;TempControl.c,36 :: 		void Wait(void){
;TempControl.c,37 :: 		PORTB.B7 = 0;        // Sets Heating state LED to LOW
	BCF        PORTB+0, 7
;TempControl.c,38 :: 		Time_1_Sec = 0;      // Counter variable which is to be used to count 1 second
	CLRF       _Time_1_Sec+0
	CLRF       _Time_1_Sec+1
;TempControl.c,39 :: 		PORTC.B5 = 0;        // Setting PORT C pin5 (the heater) pin as LOW (Turning the heater is off)
	BCF        PORTC+0, 5
;TempControl.c,40 :: 		PORTC.B2 = 0;        // Setting PORT C pin2 (the fan) pin as LOW (Turning the fan is off)
	BCF        PORTC+0, 2
;TempControl.c,41 :: 		}
L_end_Wait:
	RETURN
; end of _Wait
>>>>>>> fb2327c20e9b5f5d914b13cb41c499f79a1633aa
