#line 1 "E:/Projects/Pic/WaterHeaterFinalV2/System.c"
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
#line 3 "E:/Projects/Pic/WaterHeaterFinalV2/System.c"
void Initialization(void){
 TRISD=0;
 TRISA.B2 = 1;
 TRISA.B4 = 0;
 TRISA.B5 = 0;

 TRISB.B0 = 1;
 TRISB.B2 = 1;
 TRISB.B1 = 1;
 TRISB.B7 = 0;

 TRISC.B5 = 0;
 TRISC.B2 = 0;
 PORTC.B5 = 0;
 PORTC.B2 = 0;

 PORTB.B7 = 0;

 PORTD=0;
 PORTA=0;

}

void Off_State(void){
 Wait();
 PORTD=0;
 PORTA=0;
}




void Init_Timer0(void){
 INTCON.GIE=1;
 INTCON.PEIE=1;
 INTCON.TMR0IE=1;
 OPTION_REG.PSA=0;
 OPTION_REG.PS2=1;
 OPTION_REG.PS1=1;
 OPTION_REG.PS0=1;
 TMR0=100;
}
