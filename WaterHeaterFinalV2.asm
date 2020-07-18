
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;WaterHeaterFinalV2.c,28 :: 		void interrupt(){
;WaterHeaterFinalV2.c,29 :: 		if(INTCON.INTF==1){                     // Checks the external interrupt flag bit
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt0
;WaterHeaterFinalV2.c,30 :: 		INTCON.INTF = 0;                      // Resets External Interrupt Flag bit to 0
	BCF        INTCON+0, 1
;WaterHeaterFinalV2.c,31 :: 		if(OnOffState == OFF_STATE){          // Checks the condition to change the system state to on
	MOVF       _OnOffState+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt1
;WaterHeaterFinalV2.c,32 :: 		OnOffState = ON_STATE;              // changes the system state to on
	MOVLW      1
	MOVWF      _OnOffState+0
;WaterHeaterFinalV2.c,33 :: 		EEPROMReadVal();
	CALL       _EEPROMReadVal+0
;WaterHeaterFinalV2.c,34 :: 		if((EEPROM_Val <= 75)&&(EEPROM_Val >= 35)){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _EEPROM_Val+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt50
	MOVF       _EEPROM_Val+0, 0
	SUBLW      75
L__interrupt50:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt4
	MOVLW      128
	XORWF      _EEPROM_Val+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt51
	MOVLW      35
	SUBWF      _EEPROM_Val+0, 0
L__interrupt51:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt4
L__interrupt47:
;WaterHeaterFinalV2.c,35 :: 		ReqTemp = EEPROM_Val;
	MOVF       _EEPROM_Val+0, 0
	MOVWF      _ReqTemp+0
	MOVF       _EEPROM_Val+1, 0
	MOVWF      _ReqTemp+1
;WaterHeaterFinalV2.c,36 :: 		}else{
	GOTO       L_interrupt5
L_interrupt4:
;WaterHeaterFinalV2.c,37 :: 		ReqTemp = 60;
	MOVLW      60
	MOVWF      _ReqTemp+0
	MOVLW      0
	MOVWF      _ReqTemp+1
;WaterHeaterFinalV2.c,38 :: 		}
L_interrupt5:
;WaterHeaterFinalV2.c,39 :: 		}else if(OnOffState == ON_STATE){     // Checks the condition to change the system state to off
	GOTO       L_interrupt6
L_interrupt1:
	MOVF       _OnOffState+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt7
;WaterHeaterFinalV2.c,40 :: 		OnOffState = OFF_STATE;             // Changes the system state to off
	CLRF       _OnOffState+0
;WaterHeaterFinalV2.c,41 :: 		}else{
	GOTO       L_interrupt8
L_interrupt7:
;WaterHeaterFinalV2.c,43 :: 		}
L_interrupt8:
L_interrupt6:
;WaterHeaterFinalV2.c,44 :: 		}
L_interrupt0:
;WaterHeaterFinalV2.c,45 :: 		if (INTCON.TMR0IF==1){
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt9
;WaterHeaterFinalV2.c,46 :: 		TMR0=100;                                                           // Loading Timer0 Module Register with a value that gives overflow interrupt each 10ms
	MOVLW      100
	MOVWF      TMR0+0
;WaterHeaterFinalV2.c,47 :: 		INTCON.TMR0IF=0;                                                    // Resets TIMER0 Overflow Interrupt Flag bit to 0
	BCF        INTCON+0, 2
;WaterHeaterFinalV2.c,49 :: 		if((OnOffState == ON_STATE)&&(OnMode == ON_MODE_WORKING)){
	MOVF       _OnOffState+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt12
	MOVF       _OnMode+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt12
L__interrupt46:
;WaterHeaterFinalV2.c,50 :: 		Time_1_Sec++;                                     // Increases the time counter counting 1 second
	INCF       _Time_1_Sec+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Time_1_Sec+1, 1
;WaterHeaterFinalV2.c,51 :: 		WorkingMode();
	CALL       _WorkingMode+0
;WaterHeaterFinalV2.c,52 :: 		if(Time_1_Sec == TIME_1_SEC){                     // Checking if 1 second has passed
	MOVLW      0
	XORWF      _Time_1_Sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt52
	MOVLW      100
	XORWF      _Time_1_Sec+0, 0
L__interrupt52:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt13
;WaterHeaterFinalV2.c,53 :: 		Time_1_Sec = 0;                                   // Ressetting the 1 secondd counter value to 0
	CLRF       _Time_1_Sec+0
	CLRF       _Time_1_Sec+1
;WaterHeaterFinalV2.c,54 :: 		if(HeatingStateLED == LED_ON){                  // Checking if current Heating state LED is On state
	MOVF       _HeatingStateLED+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt14
;WaterHeaterFinalV2.c,55 :: 		HeatingStateLED = LED_OFF;                    // Setting Heating state LED to Off state
	CLRF       _HeatingStateLED+0
;WaterHeaterFinalV2.c,56 :: 		}else if(HeatingStateLED == LED_OFF){           // Checking if current Heating state LED is Off state
	GOTO       L_interrupt15
L_interrupt14:
	MOVF       _HeatingStateLED+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt16
;WaterHeaterFinalV2.c,57 :: 		HeatingStateLED = LED_ON;                     // Setting Heating state LED to On state
	MOVLW      1
	MOVWF      _HeatingStateLED+0
;WaterHeaterFinalV2.c,58 :: 		}else{
	GOTO       L_interrupt17
L_interrupt16:
;WaterHeaterFinalV2.c,60 :: 		}
L_interrupt17:
L_interrupt15:
;WaterHeaterFinalV2.c,61 :: 		}
L_interrupt13:
;WaterHeaterFinalV2.c,63 :: 		}
	GOTO       L_interrupt18
L_interrupt12:
;WaterHeaterFinalV2.c,65 :: 		else if((OnOffState == ON_STATE)&&(OnMode == ON_MODE_TEMP_SETTING)){
	MOVF       _OnOffState+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt21
	MOVF       _OnMode+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt21
L__interrupt45:
;WaterHeaterFinalV2.c,66 :: 		Time_5_Sec++;                // Increases the time counter counting 5 seconds
	INCF       _Time_5_Sec+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Time_5_Sec+1, 1
;WaterHeaterFinalV2.c,67 :: 		Time_1_Sec++;                // Increases the time counter counting 1 second
	INCF       _Time_1_Sec+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Time_1_Sec+1, 1
;WaterHeaterFinalV2.c,68 :: 		if(Time_5_Sec == TIME_5_SEC){                // Checking if 5 seconds have passed since last button being pressed
	MOVF       _Time_5_Sec+1, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt53
	MOVLW      244
	XORWF      _Time_5_Sec+0, 0
L__interrupt53:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt22
;WaterHeaterFinalV2.c,69 :: 		EEPROMWriteVal();
	CALL       _EEPROMWriteVal+0
;WaterHeaterFinalV2.c,70 :: 		Time_5_Sec = 0;                            // Resetting the time counter counting 5 seconds to 0
	CLRF       _Time_5_Sec+0
	CLRF       _Time_5_Sec+1
;WaterHeaterFinalV2.c,71 :: 		OnMode = ON_MODE_WORKING;                  // Changing operation mode to working mode (Ending the temprature setting mode)
	MOVLW      1
	MOVWF      _OnMode+0
;WaterHeaterFinalV2.c,72 :: 		}
L_interrupt22:
;WaterHeaterFinalV2.c,73 :: 		if(Time_1_Sec == TIME_1_SEC){                // Checking if 1 second has passed
	MOVLW      0
	XORWF      _Time_1_Sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt54
	MOVLW      100
	XORWF      _Time_1_Sec+0, 0
L__interrupt54:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt23
;WaterHeaterFinalV2.c,74 :: 		Time_1_Sec = 0;                            // Ressetting the 1 secondd counter value to 0
	CLRF       _Time_1_Sec+0
	CLRF       _Time_1_Sec+1
;WaterHeaterFinalV2.c,75 :: 		if(SegBlink == SEG_ON){                    // Checking if current blinking state of the SSD is On state
	MOVF       _SegBlink+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt24
;WaterHeaterFinalV2.c,76 :: 		SegBlink = SEG_OFF;                      // Setting blinking state of the SSD to Off state
	CLRF       _SegBlink+0
;WaterHeaterFinalV2.c,77 :: 		}else if(SegBlink == SEG_OFF){             // Checking if current blinking state of the SSD is Off state
	GOTO       L_interrupt25
L_interrupt24:
	MOVF       _SegBlink+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt26
;WaterHeaterFinalV2.c,78 :: 		SegBlink = SEG_ON;                       // Setting blinking state of the SSD to On state
	MOVLW      1
	MOVWF      _SegBlink+0
;WaterHeaterFinalV2.c,79 :: 		}else{
	GOTO       L_interrupt27
L_interrupt26:
;WaterHeaterFinalV2.c,81 :: 		}
L_interrupt27:
L_interrupt25:
;WaterHeaterFinalV2.c,82 :: 		}
L_interrupt23:
;WaterHeaterFinalV2.c,83 :: 		TempSettingMode();           // Calling the temprature setting function
	CALL       _TempSettingMode+0
;WaterHeaterFinalV2.c,84 :: 		}
	GOTO       L_interrupt28
L_interrupt21:
;WaterHeaterFinalV2.c,87 :: 		}
L_interrupt28:
L_interrupt18:
;WaterHeaterFinalV2.c,88 :: 		}
L_interrupt9:
;WaterHeaterFinalV2.c,90 :: 		}
L_end_interrupt:
L__interrupt49:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;WaterHeaterFinalV2.c,92 :: 		void main() {
;WaterHeaterFinalV2.c,93 :: 		Init_Timer0();        // Inintializing the Timer & Loading the register with a value that gives 10ms before the overflow
	CALL       _Init_Timer0+0
;WaterHeaterFinalV2.c,94 :: 		Init_ExtInt();        // Initializes the external interrupt for the power button (PORTB pin0).
	CALL       _Init_ExtInt+0
;WaterHeaterFinalV2.c,95 :: 		ADC_Init();           // Inintializing the ADC
	CALL       _ADC_Init+0
;WaterHeaterFinalV2.c,96 :: 		Initialization();     // Sets initial directions & values of needed ports & pins
	CALL       _Initialization+0
;WaterHeaterFinalV2.c,97 :: 		I2C1_Init(100000);    // initialize I2C communication
	MOVLW      40
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;WaterHeaterFinalV2.c,99 :: 		while(1){
L_main29:
;WaterHeaterFinalV2.c,101 :: 		if(OnOffState == ON_STATE){
	MOVF       _OnOffState+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main31
;WaterHeaterFinalV2.c,102 :: 		if(OnMode == ON_MODE_WORKING){
	MOVF       _OnMode+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main32
;WaterHeaterFinalV2.c,103 :: 		Temp_Avg(void);    // Calling the Temp_Avg function to calculate the average temprature
	CALL       _Temp_Avg+0
;WaterHeaterFinalV2.c,104 :: 		if((TempAvg+5) <= ReqTemp){
	MOVLW      5
	ADDWF      _TempAvg+0, 0
	MOVWF      R1+0
	MOVF       _TempAvg+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVLW      128
	XORWF      _ReqTemp+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVF       R1+0, 0
	SUBWF      _ReqTemp+0, 0
L__main56:
	BTFSS      STATUS+0, 0
	GOTO       L_main33
;WaterHeaterFinalV2.c,105 :: 		Working_Mode = MODE_HEATING;          // Sets the working mode to heating state (Fan is Off & Heater On)
	CLRF       _Working_Mode+0
;WaterHeaterFinalV2.c,106 :: 		}else if((TempAvg-5) >= ReqTemp){
	GOTO       L_main34
L_main33:
	MOVLW      5
	SUBWF      _TempAvg+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _TempAvg+1, 0
	MOVWF      R1+1
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ReqTemp+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main57
	MOVF       _ReqTemp+0, 0
	SUBWF      R1+0, 0
L__main57:
	BTFSS      STATUS+0, 0
	GOTO       L_main35
;WaterHeaterFinalV2.c,107 :: 		Working_Mode = MODE_COOLING;          // Sets the working mode to cooling state (Fan is On & Heater off)
	MOVLW      1
	MOVWF      _Working_Mode+0
;WaterHeaterFinalV2.c,108 :: 		}else{
	GOTO       L_main36
L_main35:
;WaterHeaterFinalV2.c,110 :: 		}
L_main36:
L_main34:
;WaterHeaterFinalV2.c,111 :: 		if(Working_Mode == MODE_HEATING){         // Checks the condition to start heating
	MOVF       _Working_Mode+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main37
;WaterHeaterFinalV2.c,112 :: 		Heater();                               // Calling the heater function
	CALL       _Heater+0
;WaterHeaterFinalV2.c,113 :: 		}
	GOTO       L_main38
L_main37:
;WaterHeaterFinalV2.c,114 :: 		else if(Working_Mode == MODE_COOLING){    // Checks the condition to start cooling
	MOVF       _Working_Mode+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main39
;WaterHeaterFinalV2.c,115 :: 		Fan();                                  // Calling the Fan function
	CALL       _Fan+0
;WaterHeaterFinalV2.c,116 :: 		}
	GOTO       L_main40
L_main39:
;WaterHeaterFinalV2.c,117 :: 		else if(Working_Mode == MODE_WAITING){    // Checks the condition to maintain temprature
	MOVF       _Working_Mode+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main41
;WaterHeaterFinalV2.c,118 :: 		Wait();                                 // Calling the wait function
	CALL       _Wait+0
;WaterHeaterFinalV2.c,119 :: 		}
L_main41:
L_main40:
L_main38:
;WaterHeaterFinalV2.c,121 :: 		}else if(OnMode == ON_MODE_TEMP_SETTING){ // Checks the condition to enter temprature setting mode
	GOTO       L_main42
L_main32:
	MOVF       _OnMode+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main43
;WaterHeaterFinalV2.c,122 :: 		PORTB.B7 = 0;                           // Sets Heating state LED to LOW
	BCF        PORTB+0, 7
;WaterHeaterFinalV2.c,123 :: 		PORTC.B5 = 0;                           // Setting PORT C pin5 (the heater) pin as LOW (Turning the heater is off)
	BCF        PORTC+0, 5
;WaterHeaterFinalV2.c,124 :: 		PORTC.B2 = 0;                           // Setting PORT C pin2 (the fan) pin as LOW (Turning the fan is off)
	BCF        PORTC+0, 2
;WaterHeaterFinalV2.c,125 :: 		}
L_main43:
L_main42:
;WaterHeaterFinalV2.c,127 :: 		}else{
	GOTO       L_main44
L_main31:
;WaterHeaterFinalV2.c,128 :: 		Off_State();                              // Calls the Off state function that sets value of Ports & pins to 0
	CALL       _Off_State+0
;WaterHeaterFinalV2.c,129 :: 		}
L_main44:
;WaterHeaterFinalV2.c,130 :: 		_7Seg(void);       // Calling the 7 Segment Display function to display the Average temprature
	CALL       __7Seg+0
;WaterHeaterFinalV2.c,131 :: 		}
	GOTO       L_main29
;WaterHeaterFinalV2.c,133 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
