<<<<<<< HEAD

_Init_ExtInt:

;Buttons.c,14 :: 		void Init_ExtInt(void){
;Buttons.c,15 :: 		INTCON.GIE=1;        // Enabling Global Interrupt
	BSF        INTCON+0, 7
;Buttons.c,16 :: 		TRISB.B0 = 1;        // Sets PORTB pin0 (external interrupt) as input
	BSF        TRISB+0, 0
;Buttons.c,17 :: 		INTCON.INTE = 1;     // Enabling external interrupt
	BSF        INTCON+0, 4
;Buttons.c,18 :: 		}
L_end_Init_ExtInt:
	RETURN
; end of _Init_ExtInt

_WorkingMode:

;Buttons.c,20 :: 		void WorkingMode(void){
;Buttons.c,21 :: 		ButtonsTCounter++;
	INCF       _ButtonsTCounter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _ButtonsTCounter+1, 1
;Buttons.c,22 :: 		Seg_State();                                // Calls the SSD state controlling function
	CALL       _Seg_State+0
;Buttons.c,23 :: 		TempStartRead();                            // Calls the temprature start reading function
	CALL       _TempStartRead+0
;Buttons.c,24 :: 		if(ButtonsTCounter==10){                    // Checks if 100 ms passed to start reading the state of the Up & Down buttons
	MOVLW      0
	XORWF      _ButtonsTCounter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__WorkingMode17
	MOVLW      10
	XORWF      _ButtonsTCounter+0, 0
L__WorkingMode17:
	BTFSS      STATUS+0, 2
	GOTO       L_WorkingMode0
;Buttons.c,25 :: 		if((PORTB.B2 == 0) || (PORTB.B1 == 0)){   // Checks if the Up or Down buttons are pressed
	BTFSS      PORTB+0, 2
	GOTO       L__WorkingMode14
	BTFSS      PORTB+0, 1
	GOTO       L__WorkingMode14
	GOTO       L_WorkingMode3
L__WorkingMode14:
;Buttons.c,26 :: 		OnMode = ON_MODE_TEMP_SETTING;          // Sets the Mode of the system to temprature setting mode
	CLRF       _OnMode+0
;Buttons.c,27 :: 		SegBlink = SEG_ON;                      // Setting blinking state of the SSD to On state
	MOVLW      1
	MOVWF      _SegBlink+0
;Buttons.c,28 :: 		Time_1_Sec = 0;                         // Ressetting the 1 secondd counter value to 0
	CLRF       _Time_1_Sec+0
	CLRF       _Time_1_Sec+1
;Buttons.c,29 :: 		}
L_WorkingMode3:
;Buttons.c,30 :: 		ButtonsTCounter = 0;                      // resets the counter variable that saves the time to check the states of the Up & Down buttons
	CLRF       _ButtonsTCounter+0
	CLRF       _ButtonsTCounter+1
;Buttons.c,31 :: 		}
L_WorkingMode0:
;Buttons.c,35 :: 		}
L_end_WorkingMode:
	RETURN
; end of _WorkingMode

_TempSettingMode:

;Buttons.c,37 :: 		void TempSettingMode(void){
;Buttons.c,38 :: 		ButtonsTCounter++;                           // Increases the time counter controlling checking buttons states
	INCF       _ButtonsTCounter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _ButtonsTCounter+1, 1
;Buttons.c,40 :: 		if(ButtonsTCounter==10){                     // Cheking if 100 ms passed (The condition to check buttons states)
	MOVLW      0
	XORWF      _ButtonsTCounter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TempSettingMode19
	MOVLW      10
	XORWF      _ButtonsTCounter+0, 0
L__TempSettingMode19:
	BTFSS      STATUS+0, 2
	GOTO       L_TempSettingMode4
;Buttons.c,41 :: 		if(PORTB.B2 == 0){                         // Cheking if Up button is pressed
	BTFSC      PORTB+0, 2
	GOTO       L_TempSettingMode5
;Buttons.c,42 :: 		SegBlink = SEG_ON;                       // Setting blinking state of the SSD to On state
	MOVLW      1
	MOVWF      _SegBlink+0
;Buttons.c,43 :: 		Time_1_Sec = 0;                          // Ressetting the 1 secondd counter value to 0
	CLRF       _Time_1_Sec+0
	CLRF       _Time_1_Sec+1
;Buttons.c,44 :: 		if(ReqTemp < 75){
	MOVLW      128
	XORWF      _ReqTemp+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TempSettingMode20
	MOVLW      75
	SUBWF      _ReqTemp+0, 0
L__TempSettingMode20:
	BTFSC      STATUS+0, 0
	GOTO       L_TempSettingMode6
;Buttons.c,45 :: 		ReqTemp += 5;                            // Increasing required temprature by 5 degrees
	MOVLW      5
	ADDWF      _ReqTemp+0, 1
	BTFSC      STATUS+0, 0
	INCF       _ReqTemp+1, 1
;Buttons.c,46 :: 		}
L_TempSettingMode6:
;Buttons.c,47 :: 		Time_5_Sec = 0;                          // Resetting the time counter counting 5 seconds to 0
	CLRF       _Time_5_Sec+0
	CLRF       _Time_5_Sec+1
;Buttons.c,48 :: 		}else if(PORTB.B1 == 0){                   // Cheking if Down button is pressed
	GOTO       L_TempSettingMode7
L_TempSettingMode5:
	BTFSC      PORTB+0, 1
	GOTO       L_TempSettingMode8
;Buttons.c,49 :: 		SegBlink = SEG_ON;                       // Setting blinking state of the SSD to On state
	MOVLW      1
	MOVWF      _SegBlink+0
;Buttons.c,50 :: 		Time_1_Sec = 0;                          // Ressetting the 1 secondd counter value to 0
	CLRF       _Time_1_Sec+0
	CLRF       _Time_1_Sec+1
;Buttons.c,51 :: 		if(ReqTemp > 35){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ReqTemp+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TempSettingMode21
	MOVF       _ReqTemp+0, 0
	SUBLW      35
L__TempSettingMode21:
	BTFSC      STATUS+0, 0
	GOTO       L_TempSettingMode9
;Buttons.c,52 :: 		ReqTemp -= 5;                            // Decreasing required temprature by 5 degrees
	MOVLW      5
	SUBWF      _ReqTemp+0, 1
	BTFSS      STATUS+0, 0
	DECF       _ReqTemp+1, 1
;Buttons.c,53 :: 		}
L_TempSettingMode9:
;Buttons.c,54 :: 		Time_5_Sec = 0;                          // Resetting the time counter counting 5 seconds to 0
	CLRF       _Time_5_Sec+0
	CLRF       _Time_5_Sec+1
;Buttons.c,55 :: 		}else{
	GOTO       L_TempSettingMode10
L_TempSettingMode8:
;Buttons.c,57 :: 		}
L_TempSettingMode10:
L_TempSettingMode7:
;Buttons.c,58 :: 		ButtonsTCounter = 0;                       // Resetting the time counter controlling checking buttons states
	CLRF       _ButtonsTCounter+0
	CLRF       _ButtonsTCounter+1
;Buttons.c,59 :: 		}
L_TempSettingMode4:
;Buttons.c,60 :: 		if(SegBlink == SEG_ON){                      // Checks if the current state of the SSD is On
	MOVF       _SegBlink+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TempSettingMode11
;Buttons.c,61 :: 		SegNum = ReqTemp;                          // Sets the number displayed on SSD to the current required temprature
	MOVF       _ReqTemp+0, 0
	MOVWF      _SegNum+0
	MOVF       _ReqTemp+1, 0
	MOVWF      _SegNum+1
;Buttons.c,62 :: 		Seg_State();                               // Calls the SSD state controlling function
	CALL       _Seg_State+0
;Buttons.c,63 :: 		}else if(SegBlink == SEG_OFF){               // Checks if the current state of the SSD is Off
	GOTO       L_TempSettingMode12
L_TempSettingMode11:
	MOVF       _SegBlink+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_TempSettingMode13
;Buttons.c,64 :: 		PORTD = 0;                                 // Resets values of all PORT D pins to 0
	CLRF       PORTD+0
;Buttons.c,65 :: 		PORTA.B5=0;                                // Turning off the ones SSD
	BCF        PORTA+0, 5
;Buttons.c,66 :: 		PORTA.B4=0;                                // Turning off the tens SSD
	BCF        PORTA+0, 4
;Buttons.c,67 :: 		}
L_TempSettingMode13:
L_TempSettingMode12:
;Buttons.c,69 :: 		}
L_end_TempSettingMode:
	RETURN
; end of _TempSettingMode
=======

_Init_ExtInt:

;Buttons.c,14 :: 		void Init_ExtInt(void){
;Buttons.c,15 :: 		INTCON.GIE=1;        // Enabling Global Interrupt
	BSF        INTCON+0, 7
;Buttons.c,16 :: 		TRISB.B0 = 1;        // Sets PORTB pin0 (external interrupt) as input
	BSF        TRISB+0, 0
;Buttons.c,17 :: 		INTCON.INTE = 1;     // Enabling external interrupt
	BSF        INTCON+0, 4
;Buttons.c,18 :: 		}
L_end_Init_ExtInt:
	RETURN
; end of _Init_ExtInt

_WorkingMode:

;Buttons.c,20 :: 		void WorkingMode(void){
;Buttons.c,21 :: 		ButtonsTCounter++;
	INCF       _ButtonsTCounter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _ButtonsTCounter+1, 1
;Buttons.c,22 :: 		Seg_State();                                // Calls the SSD state controlling function
	CALL       _Seg_State+0
;Buttons.c,23 :: 		TempStartRead();                            // Calls the temprature start reading function
	CALL       _TempStartRead+0
;Buttons.c,24 :: 		if(ButtonsTCounter==10){                    // Checks if 100 ms passed to start reading the state of the Up & Down buttons
	MOVLW      0
	XORWF      _ButtonsTCounter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__WorkingMode17
	MOVLW      10
	XORWF      _ButtonsTCounter+0, 0
L__WorkingMode17:
	BTFSS      STATUS+0, 2
	GOTO       L_WorkingMode0
;Buttons.c,25 :: 		if((PORTB.B2 == 0) || (PORTB.B1 == 0)){   // Checks if the Up or Down buttons are pressed
	BTFSS      PORTB+0, 2
	GOTO       L__WorkingMode14
	BTFSS      PORTB+0, 1
	GOTO       L__WorkingMode14
	GOTO       L_WorkingMode3
L__WorkingMode14:
;Buttons.c,26 :: 		OnMode = ON_MODE_TEMP_SETTING;          // Sets the Mode of the system to temprature setting mode
	CLRF       _OnMode+0
;Buttons.c,27 :: 		SegBlink = SEG_ON;                      // Setting blinking state of the SSD to On state
	MOVLW      1
	MOVWF      _SegBlink+0
;Buttons.c,28 :: 		Time_1_Sec = 0;                         // Ressetting the 1 secondd counter value to 0
	CLRF       _Time_1_Sec+0
	CLRF       _Time_1_Sec+1
;Buttons.c,29 :: 		}
L_WorkingMode3:
;Buttons.c,30 :: 		ButtonsTCounter = 0;                      // resets the counter variable that saves the time to check the states of the Up & Down buttons
	CLRF       _ButtonsTCounter+0
	CLRF       _ButtonsTCounter+1
;Buttons.c,31 :: 		}
L_WorkingMode0:
;Buttons.c,35 :: 		}
L_end_WorkingMode:
	RETURN
; end of _WorkingMode

_TempSettingMode:

;Buttons.c,37 :: 		void TempSettingMode(void){
;Buttons.c,38 :: 		ButtonsTCounter++;                           // Increases the time counter controlling checking buttons states
	INCF       _ButtonsTCounter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _ButtonsTCounter+1, 1
;Buttons.c,40 :: 		if(ButtonsTCounter==10){                     // Cheking if 100 ms passed (The condition to check buttons states)
	MOVLW      0
	XORWF      _ButtonsTCounter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TempSettingMode19
	MOVLW      10
	XORWF      _ButtonsTCounter+0, 0
L__TempSettingMode19:
	BTFSS      STATUS+0, 2
	GOTO       L_TempSettingMode4
;Buttons.c,41 :: 		if(PORTB.B2 == 0){                         // Cheking if Up button is pressed
	BTFSC      PORTB+0, 2
	GOTO       L_TempSettingMode5
;Buttons.c,42 :: 		SegBlink = SEG_ON;                       // Setting blinking state of the SSD to On state
	MOVLW      1
	MOVWF      _SegBlink+0
;Buttons.c,43 :: 		Time_1_Sec = 0;                          // Ressetting the 1 secondd counter value to 0
	CLRF       _Time_1_Sec+0
	CLRF       _Time_1_Sec+1
;Buttons.c,44 :: 		if(ReqTemp < 75){
	MOVLW      128
	XORWF      _ReqTemp+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TempSettingMode20
	MOVLW      75
	SUBWF      _ReqTemp+0, 0
L__TempSettingMode20:
	BTFSC      STATUS+0, 0
	GOTO       L_TempSettingMode6
;Buttons.c,45 :: 		ReqTemp += 5;                            // Increasing required temprature by 5 degrees
	MOVLW      5
	ADDWF      _ReqTemp+0, 1
	BTFSC      STATUS+0, 0
	INCF       _ReqTemp+1, 1
;Buttons.c,46 :: 		}
L_TempSettingMode6:
;Buttons.c,47 :: 		Time_5_Sec = 0;                          // Resetting the time counter counting 5 seconds to 0
	CLRF       _Time_5_Sec+0
	CLRF       _Time_5_Sec+1
;Buttons.c,48 :: 		}else if(PORTB.B1 == 0){                   // Cheking if Down button is pressed
	GOTO       L_TempSettingMode7
L_TempSettingMode5:
	BTFSC      PORTB+0, 1
	GOTO       L_TempSettingMode8
;Buttons.c,49 :: 		SegBlink = SEG_ON;                       // Setting blinking state of the SSD to On state
	MOVLW      1
	MOVWF      _SegBlink+0
;Buttons.c,50 :: 		Time_1_Sec = 0;                          // Ressetting the 1 secondd counter value to 0
	CLRF       _Time_1_Sec+0
	CLRF       _Time_1_Sec+1
;Buttons.c,51 :: 		if(ReqTemp > 35){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ReqTemp+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TempSettingMode21
	MOVF       _ReqTemp+0, 0
	SUBLW      35
L__TempSettingMode21:
	BTFSC      STATUS+0, 0
	GOTO       L_TempSettingMode9
;Buttons.c,52 :: 		ReqTemp -= 5;                            // Decreasing required temprature by 5 degrees
	MOVLW      5
	SUBWF      _ReqTemp+0, 1
	BTFSS      STATUS+0, 0
	DECF       _ReqTemp+1, 1
;Buttons.c,53 :: 		}
L_TempSettingMode9:
;Buttons.c,54 :: 		Time_5_Sec = 0;                          // Resetting the time counter counting 5 seconds to 0
	CLRF       _Time_5_Sec+0
	CLRF       _Time_5_Sec+1
;Buttons.c,55 :: 		}else{
	GOTO       L_TempSettingMode10
L_TempSettingMode8:
;Buttons.c,57 :: 		}
L_TempSettingMode10:
L_TempSettingMode7:
;Buttons.c,58 :: 		ButtonsTCounter = 0;                       // Resetting the time counter controlling checking buttons states
	CLRF       _ButtonsTCounter+0
	CLRF       _ButtonsTCounter+1
;Buttons.c,59 :: 		}
L_TempSettingMode4:
;Buttons.c,60 :: 		if(SegBlink == SEG_ON){                      // Checks if the current state of the SSD is On
	MOVF       _SegBlink+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TempSettingMode11
;Buttons.c,61 :: 		SegNum = ReqTemp;                          // Sets the number displayed on SSD to the current required temprature
	MOVF       _ReqTemp+0, 0
	MOVWF      _SegNum+0
	MOVF       _ReqTemp+1, 0
	MOVWF      _SegNum+1
;Buttons.c,62 :: 		Seg_State();                               // Calls the SSD state controlling function
	CALL       _Seg_State+0
;Buttons.c,63 :: 		}else if(SegBlink == SEG_OFF){               // Checks if the current state of the SSD is Off
	GOTO       L_TempSettingMode12
L_TempSettingMode11:
	MOVF       _SegBlink+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_TempSettingMode13
;Buttons.c,64 :: 		PORTD = 0;                                 // Resets values of all PORT D pins to 0
	CLRF       PORTD+0
;Buttons.c,65 :: 		PORTA.B5=0;                                // Turning off the ones SSD
	BCF        PORTA+0, 5
;Buttons.c,66 :: 		PORTA.B4=0;                                // Turning off the tens SSD
	BCF        PORTA+0, 4
;Buttons.c,67 :: 		}
L_TempSettingMode13:
L_TempSettingMode12:
;Buttons.c,69 :: 		}
L_end_TempSettingMode:
	RETURN
; end of _TempSettingMode
>>>>>>> fb2327c20e9b5f5d914b13cb41c499f79a1633aa
