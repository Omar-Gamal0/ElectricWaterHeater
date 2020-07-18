<<<<<<< HEAD

_TempStartRead:

;Tempratue.c,21 :: 		void TempStartRead(void){
;Tempratue.c,22 :: 		TempTimeCounter++;                            // Increasing the temprature time counter value
	INCF       _TempTimeCounter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _TempTimeCounter+1, 1
;Tempratue.c,23 :: 		if(TempTimeCounter==TEMP_COUNTER_MAX_VALUE){  // Checking if the temprature time counter value has reached the maximum value needed to start the temprature reading operation
	MOVLW      0
	XORWF      _TempTimeCounter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TempStartRead8
	MOVLW      10
	XORWF      _TempTimeCounter+0, 0
L__TempStartRead8:
	BTFSS      STATUS+0, 2
	GOTO       L_TempStartRead0
;Tempratue.c,24 :: 		TempTimeCounter = 0;                        // Resettig  the temprature time counter value to 0
	CLRF       _TempTimeCounter+0
	CLRF       _TempTimeCounter+1
;Tempratue.c,25 :: 		TempReadFlag = TEMP_READ;                   // Changing the temprature read flag value to start reading state
	CLRF       _TempReadFlag+0
;Tempratue.c,26 :: 		}else{
	GOTO       L_TempStartRead1
L_TempStartRead0:
;Tempratue.c,28 :: 		}
L_TempStartRead1:
;Tempratue.c,29 :: 		}
L_end_TempStartRead:
	RETURN
; end of _TempStartRead

_Temp_Avg:

;Tempratue.c,31 :: 		void Temp_Avg(void){
;Tempratue.c,32 :: 		if(TempReadFlag == TEMP_READ){                                                // Checking the temprature start reading condition (Determined in the ISR)
	MOVF       _TempReadFlag+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Temp_Avg2
;Tempratue.c,33 :: 		TempReadFlag = TEMP_WAIT;                                                   // Resetting the temprature start reading flag
	MOVLW      1
	MOVWF      _TempReadFlag+0
;Tempratue.c,34 :: 		ADC_Val = ADC_Read(2);                                                      // Reading the analog value on channel 2
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _ADC_Val+0
	MOVF       R0+1, 0
	MOVWF      _ADC_Val+1
;Tempratue.c,35 :: 		TempADC_Val = ADC_Val * 4.89;                                               // Calculating the sample temprature value
	CALL       _int2double+0
	MOVLW      225
	MOVWF      R4+0
	MOVLW      122
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _TempADC_Val+0
	MOVF       R0+1, 0
	MOVWF      _TempADC_Val+1
;Tempratue.c,36 :: 		SampleADC_Val = TempADC_Val/10;                                             // Calculating the sample temprature value
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _SampleADC_Val+0
	MOVF       R0+1, 0
	MOVWF      _SampleADC_Val+1
;Tempratue.c,37 :: 		TempratureSamples[Temp_Array_Counter] = SampleADC_Val;                      // Saving the sample value in the Sample array
	MOVF       _Temp_Array_Counter+0, 0
	MOVWF      R2+0
	MOVF       _Temp_Array_Counter+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _TempratureSamples+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;Tempratue.c,38 :: 		TempSum = 0;                                                                // Resetting the summing value variable to 0
	CLRF       _TempSum+0
	CLRF       _TempSum+1
;Tempratue.c,39 :: 		for(Temp_Loop_Counter=0;Temp_Loop_Counter<10;Temp_Loop_Counter++ ){         // summing the values of the temprature samples
	CLRF       _Temp_Loop_Counter+0
	CLRF       _Temp_Loop_Counter+1
L_Temp_Avg3:
	MOVLW      128
	XORWF      _Temp_Loop_Counter+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Temp_Avg10
	MOVLW      10
	SUBWF      _Temp_Loop_Counter+0, 0
L__Temp_Avg10:
	BTFSC      STATUS+0, 0
	GOTO       L_Temp_Avg4
;Tempratue.c,40 :: 		TempSum += TempratureSamples[Temp_Loop_Counter];                          // summing the values of the temprature samples
	MOVF       _Temp_Loop_Counter+0, 0
	MOVWF      R0+0
	MOVF       _Temp_Loop_Counter+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _TempratureSamples+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ADDWF      _TempSum+0, 1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _TempSum+1, 1
;Tempratue.c,39 :: 		for(Temp_Loop_Counter=0;Temp_Loop_Counter<10;Temp_Loop_Counter++ ){         // summing the values of the temprature samples
	INCF       _Temp_Loop_Counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Temp_Loop_Counter+1, 1
;Tempratue.c,41 :: 		}
	GOTO       L_Temp_Avg3
L_Temp_Avg4:
;Tempratue.c,42 :: 		TempAvg = TempSum/10;           // Calculating the average of the 10 Samples
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _TempSum+0, 0
	MOVWF      R0+0
	MOVF       _TempSum+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _TempAvg+0
	MOVF       R0+1, 0
	MOVWF      _TempAvg+1
;Tempratue.c,43 :: 		SegNum = TempAvg;               // Changing the value of the Global variable of the displayed number on SSD to the average temprature value
	MOVF       R0+0, 0
	MOVWF      _SegNum+0
	MOVF       R0+1, 0
	MOVWF      _SegNum+1
;Tempratue.c,45 :: 		Temp_Array_Counter++;           // Increasing the variable determining which index of the array to save the temprature sample in it's corresponding index of the array
	INCF       _Temp_Array_Counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Temp_Array_Counter+1, 1
;Tempratue.c,47 :: 		if(Temp_Array_Counter == 10){   // Checking the condition of the array counter to be reset to 0
	MOVLW      0
	XORWF      _Temp_Array_Counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Temp_Avg11
	MOVLW      10
	XORWF      _Temp_Array_Counter+0, 0
L__Temp_Avg11:
	BTFSS      STATUS+0, 2
	GOTO       L_Temp_Avg6
;Tempratue.c,48 :: 		Temp_Array_Counter = 0;       // Resetting the temprature array counter to 0
	CLRF       _Temp_Array_Counter+0
	CLRF       _Temp_Array_Counter+1
;Tempratue.c,49 :: 		}
L_Temp_Avg6:
;Tempratue.c,50 :: 		}
L_Temp_Avg2:
;Tempratue.c,51 :: 		}
L_end_Temp_Avg:
	RETURN
; end of _Temp_Avg
=======

_TempStartRead:

;Tempratue.c,21 :: 		void TempStartRead(void){
;Tempratue.c,22 :: 		TempTimeCounter++;                            // Increasing the temprature time counter value
	INCF       _TempTimeCounter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _TempTimeCounter+1, 1
;Tempratue.c,23 :: 		if(TempTimeCounter==TEMP_COUNTER_MAX_VALUE){  // Checking if the temprature time counter value has reached the maximum value needed to start the temprature reading operation
	MOVLW      0
	XORWF      _TempTimeCounter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TempStartRead8
	MOVLW      10
	XORWF      _TempTimeCounter+0, 0
L__TempStartRead8:
	BTFSS      STATUS+0, 2
	GOTO       L_TempStartRead0
;Tempratue.c,24 :: 		TempTimeCounter = 0;                        // Resettig  the temprature time counter value to 0
	CLRF       _TempTimeCounter+0
	CLRF       _TempTimeCounter+1
;Tempratue.c,25 :: 		TempReadFlag = TEMP_READ;                   // Changing the temprature read flag value to start reading state
	CLRF       _TempReadFlag+0
;Tempratue.c,26 :: 		}else{
	GOTO       L_TempStartRead1
L_TempStartRead0:
;Tempratue.c,28 :: 		}
L_TempStartRead1:
;Tempratue.c,29 :: 		}
L_end_TempStartRead:
	RETURN
; end of _TempStartRead

_Temp_Avg:

;Tempratue.c,31 :: 		void Temp_Avg(void){
;Tempratue.c,32 :: 		if(TempReadFlag == TEMP_READ){                                                // Checking the temprature start reading condition (Determined in the ISR)
	MOVF       _TempReadFlag+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Temp_Avg2
;Tempratue.c,33 :: 		TempReadFlag = TEMP_WAIT;                                                   // Resetting the temprature start reading flag
	MOVLW      1
	MOVWF      _TempReadFlag+0
;Tempratue.c,34 :: 		ADC_Val = ADC_Read(2);                                                      // Reading the analog value on channel 2
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _ADC_Val+0
	MOVF       R0+1, 0
	MOVWF      _ADC_Val+1
;Tempratue.c,35 :: 		TempADC_Val = ADC_Val * 4.89;                                               // Calculating the sample temprature value
	CALL       _int2double+0
	MOVLW      225
	MOVWF      R4+0
	MOVLW      122
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _TempADC_Val+0
	MOVF       R0+1, 0
	MOVWF      _TempADC_Val+1
;Tempratue.c,36 :: 		SampleADC_Val = TempADC_Val/10;                                             // Calculating the sample temprature value
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _SampleADC_Val+0
	MOVF       R0+1, 0
	MOVWF      _SampleADC_Val+1
;Tempratue.c,37 :: 		TempratureSamples[Temp_Array_Counter] = SampleADC_Val;                      // Saving the sample value in the Sample array
	MOVF       _Temp_Array_Counter+0, 0
	MOVWF      R2+0
	MOVF       _Temp_Array_Counter+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _TempratureSamples+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;Tempratue.c,38 :: 		TempSum = 0;                                                                // Resetting the summing value variable to 0
	CLRF       _TempSum+0
	CLRF       _TempSum+1
;Tempratue.c,39 :: 		for(Temp_Loop_Counter=0;Temp_Loop_Counter<10;Temp_Loop_Counter++ ){         // summing the values of the temprature samples
	CLRF       _Temp_Loop_Counter+0
	CLRF       _Temp_Loop_Counter+1
L_Temp_Avg3:
	MOVLW      128
	XORWF      _Temp_Loop_Counter+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Temp_Avg10
	MOVLW      10
	SUBWF      _Temp_Loop_Counter+0, 0
L__Temp_Avg10:
	BTFSC      STATUS+0, 0
	GOTO       L_Temp_Avg4
;Tempratue.c,40 :: 		TempSum += TempratureSamples[Temp_Loop_Counter];                          // summing the values of the temprature samples
	MOVF       _Temp_Loop_Counter+0, 0
	MOVWF      R0+0
	MOVF       _Temp_Loop_Counter+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _TempratureSamples+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ADDWF      _TempSum+0, 1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _TempSum+1, 1
;Tempratue.c,39 :: 		for(Temp_Loop_Counter=0;Temp_Loop_Counter<10;Temp_Loop_Counter++ ){         // summing the values of the temprature samples
	INCF       _Temp_Loop_Counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Temp_Loop_Counter+1, 1
;Tempratue.c,41 :: 		}
	GOTO       L_Temp_Avg3
L_Temp_Avg4:
;Tempratue.c,42 :: 		TempAvg = TempSum/10;           // Calculating the average of the 10 Samples
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _TempSum+0, 0
	MOVWF      R0+0
	MOVF       _TempSum+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _TempAvg+0
	MOVF       R0+1, 0
	MOVWF      _TempAvg+1
;Tempratue.c,43 :: 		SegNum = TempAvg;               // Changing the value of the Global variable of the displayed number on SSD to the average temprature value
	MOVF       R0+0, 0
	MOVWF      _SegNum+0
	MOVF       R0+1, 0
	MOVWF      _SegNum+1
;Tempratue.c,45 :: 		Temp_Array_Counter++;           // Increasing the variable determining which index of the array to save the temprature sample in it's corresponding index of the array
	INCF       _Temp_Array_Counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Temp_Array_Counter+1, 1
;Tempratue.c,47 :: 		if(Temp_Array_Counter == 10){   // Checking the condition of the array counter to be reset to 0
	MOVLW      0
	XORWF      _Temp_Array_Counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Temp_Avg11
	MOVLW      10
	XORWF      _Temp_Array_Counter+0, 0
L__Temp_Avg11:
	BTFSS      STATUS+0, 2
	GOTO       L_Temp_Avg6
;Tempratue.c,48 :: 		Temp_Array_Counter = 0;       // Resetting the temprature array counter to 0
	CLRF       _Temp_Array_Counter+0
	CLRF       _Temp_Array_Counter+1
;Tempratue.c,49 :: 		}
L_Temp_Avg6:
;Tempratue.c,50 :: 		}
L_Temp_Avg2:
;Tempratue.c,51 :: 		}
L_end_Temp_Avg:
	RETURN
; end of _Temp_Avg
>>>>>>> fb2327c20e9b5f5d914b13cb41c499f79a1633aa
