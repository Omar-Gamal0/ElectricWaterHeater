<<<<<<< HEAD

_Seg_State:

;SSD.c,13 :: 		void Seg_State(void){
;SSD.c,14 :: 		if(SegState==SEG_WAIT1){           // Checking the condition to start the SSD ones diplay operation
	MOVF       _SegState+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Seg_State0
;SSD.c,15 :: 		SegState = SEG_ONES;             // Changing the SSD state flag value to start to start the SSD ones diplay operation
	MOVLW      1
	MOVWF      _SegState+0
;SSD.c,16 :: 		}
	GOTO       L_Seg_State1
L_Seg_State0:
;SSD.c,17 :: 		else if(SegState==SEG_WAIT10){     // Checking the condition to start the SSD tens diplay operation
	MOVF       _SegState+0, 0
	XORLW      100
	BTFSS      STATUS+0, 2
	GOTO       L_Seg_State2
;SSD.c,18 :: 		SegState = SEG_TENS;             // Changing the SSD state flag value to start to start the SSD tens diplay operation
	MOVLW      10
	MOVWF      _SegState+0
;SSD.c,19 :: 		} else{
	GOTO       L_Seg_State3
L_Seg_State2:
;SSD.c,21 :: 		}
L_Seg_State3:
L_Seg_State1:
;SSD.c,22 :: 		}
L_end_Seg_State:
	RETURN
; end of _Seg_State

__7Seg:

;SSD.c,24 :: 		void _7Seg(void){
;SSD.c,25 :: 		if(SegState==SEG_ONES){       // Checking the condition to set the value of the ones SSD and turn it on (Determined in the ISR)
	MOVF       _SegState+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__7Seg4
;SSD.c,26 :: 		SegState = SEG_WAIT10;    // Setting the temprature state flag to the tens waiting state
	MOVLW      100
	MOVWF      _SegState+0
;SSD.c,27 :: 		SegNum1 = SegNum%10;      // calculating the ones value
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _SegNum+0, 0
	MOVWF      R0+0
	MOVF       _SegNum+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _SegNum1+0
	MOVF       R0+1, 0
	MOVWF      _SegNum1+1
;SSD.c,28 :: 		PORTD = SSD[SegNum1];     // Setting the SSD value to the ones value
	MOVF       R0+0, 0
	ADDLW      _SSD+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;SSD.c,29 :: 		PORTA.B5=1;               // Turning on the ones SSD
	BSF        PORTA+0, 5
;SSD.c,30 :: 		PORTA.B4=0;               // Turning off the tens SSD
	BCF        PORTA+0, 4
;SSD.c,31 :: 		}
	GOTO       L__7Seg5
L__7Seg4:
;SSD.c,33 :: 		else if(SegState==SEG_TENS){ // Checking the condition to set the value of the ones SSD and turn it on (Determined in the ISR)
	MOVF       _SegState+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L__7Seg6
;SSD.c,34 :: 		SegState = SEG_WAIT1;      // Setting the temprature state flag to the ones waiting state
	CLRF       _SegState+0
;SSD.c,35 :: 		TempSegNum = SegNum/10;    // Calculating temporary
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _SegNum+0, 0
	MOVWF      R0+0
	MOVF       _SegNum+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _TempSegNum+0
	MOVF       R0+1, 0
	MOVWF      _TempSegNum+1
;SSD.c,36 :: 		SegNum10 = TempSegNum%10;  // calculating the tens value
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _SegNum10+0
	MOVF       R0+1, 0
	MOVWF      _SegNum10+1
;SSD.c,37 :: 		PORTD = SSD[SegNum10];     // Setting the SSD value to the tens value
	MOVF       R0+0, 0
	ADDLW      _SSD+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;SSD.c,38 :: 		PORTA.B5=0;                // Turning off the ones SSD
	BCF        PORTA+0, 5
;SSD.c,39 :: 		PORTA.B4=1;                // Turning on the tens SSD
	BSF        PORTA+0, 4
;SSD.c,40 :: 		}
L__7Seg6:
L__7Seg5:
;SSD.c,41 :: 		}
L_end__7Seg:
	RETURN
; end of __7Seg
=======

_Seg_State:

;SSD.c,13 :: 		void Seg_State(void){
;SSD.c,14 :: 		if(SegState==SEG_WAIT1){           // Checking the condition to start the SSD ones diplay operation
	MOVF       _SegState+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Seg_State0
;SSD.c,15 :: 		SegState = SEG_ONES;             // Changing the SSD state flag value to start to start the SSD ones diplay operation
	MOVLW      1
	MOVWF      _SegState+0
;SSD.c,16 :: 		}
	GOTO       L_Seg_State1
L_Seg_State0:
;SSD.c,17 :: 		else if(SegState==SEG_WAIT10){     // Checking the condition to start the SSD tens diplay operation
	MOVF       _SegState+0, 0
	XORLW      100
	BTFSS      STATUS+0, 2
	GOTO       L_Seg_State2
;SSD.c,18 :: 		SegState = SEG_TENS;             // Changing the SSD state flag value to start to start the SSD tens diplay operation
	MOVLW      10
	MOVWF      _SegState+0
;SSD.c,19 :: 		} else{
	GOTO       L_Seg_State3
L_Seg_State2:
;SSD.c,21 :: 		}
L_Seg_State3:
L_Seg_State1:
;SSD.c,22 :: 		}
L_end_Seg_State:
	RETURN
; end of _Seg_State

__7Seg:

;SSD.c,24 :: 		void _7Seg(void){
;SSD.c,25 :: 		if(SegState==SEG_ONES){       // Checking the condition to set the value of the ones SSD and turn it on (Determined in the ISR)
	MOVF       _SegState+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__7Seg4
;SSD.c,26 :: 		SegState = SEG_WAIT10;    // Setting the temprature state flag to the tens waiting state
	MOVLW      100
	MOVWF      _SegState+0
;SSD.c,27 :: 		SegNum1 = SegNum%10;      // calculating the ones value
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _SegNum+0, 0
	MOVWF      R0+0
	MOVF       _SegNum+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _SegNum1+0
	MOVF       R0+1, 0
	MOVWF      _SegNum1+1
;SSD.c,28 :: 		PORTD = SSD[SegNum1];     // Setting the SSD value to the ones value
	MOVF       R0+0, 0
	ADDLW      _SSD+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;SSD.c,29 :: 		PORTA.B5=1;               // Turning on the ones SSD
	BSF        PORTA+0, 5
;SSD.c,30 :: 		PORTA.B4=0;               // Turning off the tens SSD
	BCF        PORTA+0, 4
;SSD.c,31 :: 		}
	GOTO       L__7Seg5
L__7Seg4:
;SSD.c,33 :: 		else if(SegState==SEG_TENS){ // Checking the condition to set the value of the ones SSD and turn it on (Determined in the ISR)
	MOVF       _SegState+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L__7Seg6
;SSD.c,34 :: 		SegState = SEG_WAIT1;      // Setting the temprature state flag to the ones waiting state
	CLRF       _SegState+0
;SSD.c,35 :: 		TempSegNum = SegNum/10;    // Calculating temporary
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _SegNum+0, 0
	MOVWF      R0+0
	MOVF       _SegNum+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _TempSegNum+0
	MOVF       R0+1, 0
	MOVWF      _TempSegNum+1
;SSD.c,36 :: 		SegNum10 = TempSegNum%10;  // calculating the tens value
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _SegNum10+0
	MOVF       R0+1, 0
	MOVWF      _SegNum10+1
;SSD.c,37 :: 		PORTD = SSD[SegNum10];     // Setting the SSD value to the tens value
	MOVF       R0+0, 0
	ADDLW      _SSD+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;SSD.c,38 :: 		PORTA.B5=0;                // Turning off the ones SSD
	BCF        PORTA+0, 5
;SSD.c,39 :: 		PORTA.B4=1;                // Turning on the tens SSD
	BSF        PORTA+0, 4
;SSD.c,40 :: 		}
L__7Seg6:
L__7Seg5:
;SSD.c,41 :: 		}
L_end__7Seg:
	RETURN
; end of __7Seg
>>>>>>> fb2327c20e9b5f5d914b13cb41c499f79a1633aa
