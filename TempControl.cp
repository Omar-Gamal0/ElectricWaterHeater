#line 1 "E:/Projects/Pic/WaterHeaterFinalV2/TempControl.c"
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
#line 2 "E:/Projects/Pic/WaterHeaterFinalV2/TempControl.c"
extern char Working_Mode =  2 ;
extern int Time_1_Sec;
extern char HeatingStateLED =  1 ;
extern int TempAvg;
extern int ReqTemp;

void Heater(void){

 if(HeatingStateLED ==  1 ){
 PORTB.B7 = 1;
 }else if(HeatingStateLED ==  0 ){
 PORTB.B7 = 0;
 }else{

 }
 if(TempAvg < (ReqTemp + 5)){
 PORTC.B5 = 1;
 PORTC.B2 = 0;
 }else{
 Working_Mode =  2 ;
 }
}

void Fan(void){
 PORTB.B7 = 1;
 if(TempAvg > (ReqTemp - 5)){
 PORTC.B5 = 0;
 PORTC.B2 = 1;
 }else{
 Working_Mode =  2 ;
 }

}

void Wait(void){
 PORTB.B7 = 0;
 Time_1_Sec = 0;
 PORTC.B5 = 0;
 PORTC.B2 = 0;
}
