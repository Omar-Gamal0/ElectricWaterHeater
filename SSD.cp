#line 1 "E:/Projects/Pic/WaterHeaterFinalV2/SSD.c"
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
#line 4 "E:/Projects/Pic/WaterHeaterFinalV2/SSD.c"
char SSD[10]={0b00111111,0b00000110,0b01011011,0b01001111,0b01100110,0b01101101,0b01111101,0b00000111,0b01111111,0b01101111};

extern int SegNum;
extern int TempSegNum;
extern int SegNum1;
extern int SegNum10;
extern char SegState;
extern char SegBlink;

void Seg_State(void){
 if(SegState== 0 ){
 SegState =  1 ;
 }
 else if(SegState== 100 ){
 SegState =  10 ;
 } else{

 }
}

void _7Seg(void){
 if(SegState== 1 ){
 SegState =  100 ;
 SegNum1 = SegNum%10;
 PORTD = SSD[SegNum1];
 PORTA.B5=1;
 PORTA.B4=0;
 }

 else if(SegState== 10 ){
 SegState =  0 ;
 TempSegNum = SegNum/10;
 SegNum10 = TempSegNum%10;
 PORTD = SSD[SegNum10];
 PORTA.B5=0;
 PORTA.B4=1;
 }
}
