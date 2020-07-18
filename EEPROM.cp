<<<<<<< HEAD
#line 1 "E:/Projects/Pic/WaterHeaterFinalV2/EEPROM.c"
#line 1 "e:/projects/pic/waterheaterfinalv2/main.h"
#line 33 "e:/projects/pic/waterheaterfinalv2/main.h"
void Init_Timer0(void);
#line 40 "e:/projects/pic/waterheaterfinalv2/main.h"
void Init_ExtInt(void);
#line 47 "e:/projects/pic/waterheaterfinalv2/main.h"
void TempSettingMode(void);
#line 54 "e:/projects/pic/waterheaterfinalv2/main.h"
void WorkingMode(void);
#line 61 "e:/projects/pic/waterheaterfinalv2/main.h"
void Heater(void);
#line 68 "e:/projects/pic/waterheaterfinalv2/main.h"
void Fan(void);
#line 75 "e:/projects/pic/waterheaterfinalv2/main.h"
void Wait(void);
#line 82 "e:/projects/pic/waterheaterfinalv2/main.h"
void Temp_Avg(void);
#line 89 "e:/projects/pic/waterheaterfinalv2/main.h"
void _7Seg(void);
#line 96 "e:/projects/pic/waterheaterfinalv2/main.h"
void Seg_State(void);
#line 103 "e:/projects/pic/waterheaterfinalv2/main.h"
void TempStartRead(void);
#line 110 "e:/projects/pic/waterheaterfinalv2/main.h"
void Initialization(void);
#line 117 "e:/projects/pic/waterheaterfinalv2/main.h"
void Off_State(void);
#line 124 "e:/projects/pic/waterheaterfinalv2/main.h"
void EEPROMWriteVal(void);
#line 131 "e:/projects/pic/waterheaterfinalv2/main.h"
void EEPROMReadVal(void);
#line 2 "E:/Projects/Pic/WaterHeaterFinalV2/EEPROM.c"
extern int EEPROM_Val;
extern int ReqTemp;

void EEPROMWriteVal(void){
 I2C1_Start();
 I2C1_Wr(0xA2);
 I2C1_Wr(0);
 I2C1_Wr(ReqTemp);
 I2C1_Stop();
 Delay_ms(100);
}

void EEPROMReadVal(void){
 I2C1_Start();
 I2C1_Wr(0xA2);
 I2C1_Wr(0);
 I2C1_Start();
 I2C1_Wr(0xA3);
 EEPROM_Val = I2C1_Rd(0u);
 I2C1_Stop();
}
=======
#line 1 "E:/Projects/Pic/WaterHeaterFinalV2/EEPROM.c"
#line 1 "e:/projects/pic/waterheaterfinalv2/main.h"
#line 33 "e:/projects/pic/waterheaterfinalv2/main.h"
void Init_Timer0(void);
#line 40 "e:/projects/pic/waterheaterfinalv2/main.h"
void Init_ExtInt(void);
#line 47 "e:/projects/pic/waterheaterfinalv2/main.h"
void TempSettingMode(void);
#line 54 "e:/projects/pic/waterheaterfinalv2/main.h"
void WorkingMode(void);
#line 61 "e:/projects/pic/waterheaterfinalv2/main.h"
void Heater(void);
#line 68 "e:/projects/pic/waterheaterfinalv2/main.h"
void Fan(void);
#line 75 "e:/projects/pic/waterheaterfinalv2/main.h"
void Wait(void);
#line 82 "e:/projects/pic/waterheaterfinalv2/main.h"
void Temp_Avg(void);
#line 89 "e:/projects/pic/waterheaterfinalv2/main.h"
void _7Seg(void);
#line 96 "e:/projects/pic/waterheaterfinalv2/main.h"
void Seg_State(void);
#line 103 "e:/projects/pic/waterheaterfinalv2/main.h"
void TempStartRead(void);
#line 110 "e:/projects/pic/waterheaterfinalv2/main.h"
void Initialization(void);
#line 117 "e:/projects/pic/waterheaterfinalv2/main.h"
void Off_State(void);
#line 124 "e:/projects/pic/waterheaterfinalv2/main.h"
void EEPROMWriteVal(void);
#line 131 "e:/projects/pic/waterheaterfinalv2/main.h"
void EEPROMReadVal(void);
#line 2 "E:/Projects/Pic/WaterHeaterFinalV2/EEPROM.c"
extern int EEPROM_Val;
extern int ReqTemp;

void EEPROMWriteVal(void){
 I2C1_Start();
 I2C1_Wr(0xA2);
 I2C1_Wr(0);
 I2C1_Wr(ReqTemp);
 I2C1_Stop();
 Delay_ms(100);
}

void EEPROMReadVal(void){
 I2C1_Start();
 I2C1_Wr(0xA2);
 I2C1_Wr(0);
 I2C1_Start();
 I2C1_Wr(0xA3);
 EEPROM_Val = I2C1_Rd(0u);
 I2C1_Stop();
}
>>>>>>> fb2327c20e9b5f5d914b13cb41c499f79a1633aa
