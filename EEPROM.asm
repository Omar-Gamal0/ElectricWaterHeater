<<<<<<< HEAD

_EEPROMWriteVal:

;EEPROM.c,5 :: 		void EEPROMWriteVal(void){
;EEPROM.c,6 :: 		I2C1_Start();             // issue I2C start signal
	CALL       _I2C1_Start+0
;EEPROM.c,7 :: 		I2C1_Wr(0xA2);            // send byte via I2C  (device address + W)
	MOVLW      162
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,8 :: 		I2C1_Wr(0);               // send byte (address of EEPROM location)
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,9 :: 		I2C1_Wr(ReqTemp);             // send data (data to be written)
	MOVF       _ReqTemp+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,10 :: 		I2C1_Stop();              // issue I2C stop signal
	CALL       _I2C1_Stop+0
;EEPROM.c,11 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_EEPROMWriteVal0:
	DECFSZ     R13+0, 1
	GOTO       L_EEPROMWriteVal0
	DECFSZ     R12+0, 1
	GOTO       L_EEPROMWriteVal0
	DECFSZ     R11+0, 1
	GOTO       L_EEPROMWriteVal0
;EEPROM.c,12 :: 		}
L_end_EEPROMWriteVal:
	RETURN
; end of _EEPROMWriteVal

_EEPROMReadVal:

;EEPROM.c,14 :: 		void EEPROMReadVal(void){
;EEPROM.c,15 :: 		I2C1_Start();              // issue I2C start signal
	CALL       _I2C1_Start+0
;EEPROM.c,16 :: 		I2C1_Wr(0xA2);             // send byte via I2C  (device address + W)
	MOVLW      162
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,17 :: 		I2C1_Wr(0);                // send byte (data address)
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,18 :: 		I2C1_Start();     // issue I2C signal repeated start
	CALL       _I2C1_Start+0
;EEPROM.c,19 :: 		I2C1_Wr(0xA3);             // send byte (device address + R)
	MOVLW      163
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,20 :: 		EEPROM_Val = I2C1_Rd(0u);       // Read the data (NO acknowledge)
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _EEPROM_Val+0
	CLRF       _EEPROM_Val+1
;EEPROM.c,21 :: 		I2C1_Stop();               // issue I2C stop signal
	CALL       _I2C1_Stop+0
;EEPROM.c,22 :: 		}
L_end_EEPROMReadVal:
	RETURN
; end of _EEPROMReadVal
=======

_EEPROMWriteVal:

;EEPROM.c,5 :: 		void EEPROMWriteVal(void){
;EEPROM.c,6 :: 		I2C1_Start();             // issue I2C start signal
	CALL       _I2C1_Start+0
;EEPROM.c,7 :: 		I2C1_Wr(0xA2);            // send byte via I2C  (device address + W)
	MOVLW      162
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,8 :: 		I2C1_Wr(0);               // send byte (address of EEPROM location)
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,9 :: 		I2C1_Wr(ReqTemp);             // send data (data to be written)
	MOVF       _ReqTemp+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,10 :: 		I2C1_Stop();              // issue I2C stop signal
	CALL       _I2C1_Stop+0
;EEPROM.c,11 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_EEPROMWriteVal0:
	DECFSZ     R13+0, 1
	GOTO       L_EEPROMWriteVal0
	DECFSZ     R12+0, 1
	GOTO       L_EEPROMWriteVal0
	DECFSZ     R11+0, 1
	GOTO       L_EEPROMWriteVal0
;EEPROM.c,12 :: 		}
L_end_EEPROMWriteVal:
	RETURN
; end of _EEPROMWriteVal

_EEPROMReadVal:

;EEPROM.c,14 :: 		void EEPROMReadVal(void){
;EEPROM.c,15 :: 		I2C1_Start();              // issue I2C start signal
	CALL       _I2C1_Start+0
;EEPROM.c,16 :: 		I2C1_Wr(0xA2);             // send byte via I2C  (device address + W)
	MOVLW      162
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,17 :: 		I2C1_Wr(0);                // send byte (data address)
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,18 :: 		I2C1_Start();     // issue I2C signal repeated start
	CALL       _I2C1_Start+0
;EEPROM.c,19 :: 		I2C1_Wr(0xA3);             // send byte (device address + R)
	MOVLW      163
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;EEPROM.c,20 :: 		EEPROM_Val = I2C1_Rd(0u);       // Read the data (NO acknowledge)
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _EEPROM_Val+0
	CLRF       _EEPROM_Val+1
;EEPROM.c,21 :: 		I2C1_Stop();               // issue I2C stop signal
	CALL       _I2C1_Stop+0
;EEPROM.c,22 :: 		}
L_end_EEPROMReadVal:
	RETURN
; end of _EEPROMReadVal
>>>>>>> fb2327c20e9b5f5d914b13cb41c499f79a1633aa
