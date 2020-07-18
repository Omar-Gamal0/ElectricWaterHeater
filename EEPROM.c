<<<<<<< HEAD
#include "Main.h"
extern int EEPROM_Val;             // Variable in which the value of the last required temprature writen in the EEPROM is to be saved
extern int ReqTemp;               // variable in which required temprature is to be saved

void EEPROMWriteVal(void){
  I2C1_Start();             // issue I2C start signal
  I2C1_Wr(0xA2);            // send byte via I2C  (device address + W)
  I2C1_Wr(0);               // send byte (address of EEPROM location)
  I2C1_Wr(ReqTemp);             // send data (data to be written)
  I2C1_Stop();              // issue I2C stop signal
  Delay_ms(100);
}

void EEPROMReadVal(void){
  I2C1_Start();              // issue I2C start signal
  I2C1_Wr(0xA2);             // send byte via I2C  (device address + W)
  I2C1_Wr(0);                // send byte (data address)
  I2C1_Start();     // issue I2C signal repeated start
  I2C1_Wr(0xA3);             // send byte (device address + R)
  EEPROM_Val = I2C1_Rd(0u);       // Read the data (NO acknowledge)
  I2C1_Stop();               // issue I2C stop signal
=======
#include "Main.h"
extern int EEPROM_Val;             // Variable in which the value of the last required temprature writen in the EEPROM is to be saved
extern int ReqTemp;               // variable in which required temprature is to be saved

void EEPROMWriteVal(void){
  I2C1_Start();             // issue I2C start signal
  I2C1_Wr(0xA2);            // send byte via I2C  (device address + W)
  I2C1_Wr(0);               // send byte (address of EEPROM location)
  I2C1_Wr(ReqTemp);             // send data (data to be written)
  I2C1_Stop();              // issue I2C stop signal
  Delay_ms(100);
}

void EEPROMReadVal(void){
  I2C1_Start();              // issue I2C start signal
  I2C1_Wr(0xA2);             // send byte via I2C  (device address + W)
  I2C1_Wr(0);                // send byte (data address)
  I2C1_Start();     // issue I2C signal repeated start
  I2C1_Wr(0xA3);             // send byte (device address + R)
  EEPROM_Val = I2C1_Rd(0u);       // Read the data (NO acknowledge)
  I2C1_Stop();               // issue I2C stop signal
>>>>>>> fb2327c20e9b5f5d914b13cb41c499f79a1633aa
}