#line 1 "E:/Projects/Pic/WaterHeaterFinalV2/Buttons.c"
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
#line 3 "E:/Projects/Pic/WaterHeaterFinalV2/Buttons.c"
extern char OnMode;

extern int ReqTemp;
extern int ButtonsTCounter;

extern int Time_5_Sec;
extern int Time_1_Sec;

extern int SegNum = 0;
extern char SegBlink;

void Init_ExtInt(void){
 INTCON.GIE=1;
 TRISB.B0 = 1;
 INTCON.INTE = 1;
}

void WorkingMode(void){
 ButtonsTCounter++;
 Seg_State();
 TempStartRead();
 if(ButtonsTCounter==10){
 if((PORTB.B2 == 0) || (PORTB.B1 == 0)){
 OnMode =  0 ;
 SegBlink =  1 ;
 Time_1_Sec = 0;
 }
 ButtonsTCounter = 0;
 }



}

void TempSettingMode(void){
 ButtonsTCounter++;

 if(ButtonsTCounter==10){
 if(PORTB.B2 == 0){
 SegBlink =  1 ;
 Time_1_Sec = 0;
 if(ReqTemp < 75){
 ReqTemp += 5;
 }
 Time_5_Sec = 0;
 }else if(PORTB.B1 == 0){
 SegBlink =  1 ;
 Time_1_Sec = 0;
 if(ReqTemp > 35){
 ReqTemp -= 5;
 }
 Time_5_Sec = 0;
 }else{

 }
 ButtonsTCounter = 0;
 }
 if(SegBlink ==  1 ){
 SegNum = ReqTemp;
 Seg_State();
 }else if(SegBlink ==  0 ){
 PORTD = 0;
 PORTA.B5=0;
 PORTA.B4=0;
 }

}
