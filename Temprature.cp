<<<<<<< HEAD
#line 1 "E:/Projects/Pic/WaterHeaterFinalV2/Temprature.c"
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
#line 2 "E:/Projects/Pic/WaterHeaterFinalV2/Temprature.c"
int TempratureSamples[10]={0,0,0,0,0,0,0,0,0,0};

extern int ReqTemp;
extern int Time_5_Sec;
extern int Time_1_Sec;

extern int Temp_Array_Counter;
extern int Temp_Loop_Counter;
extern int TempSum;
extern int TempAvg;
extern int TempTimeCounter;
extern char TempReadFlag;

extern int SegNum;

int ADC_Val = 0;
int TempADC_Val = 0;
int SampleADC_Val = 0;

void TempStartRead(void){
 TempTimeCounter++;
 if(TempTimeCounter== 10 ){
 TempTimeCounter = 0;
 TempReadFlag =  0 ;
 }else{

 }
}

void Temp_Avg(void){
 if(TempReadFlag ==  0 ){
 TempReadFlag =  1 ;
 ADC_Val = ADC_Read(2);
 TempADC_Val = ADC_Val * 4.89;
 SampleADC_Val = TempADC_Val/10;
 TempratureSamples[Temp_Array_Counter] = SampleADC_Val;
 TempSum = 0;
 for(Temp_Loop_Counter=0;Temp_Loop_Counter<10;Temp_Loop_Counter++ ){
 TempSum += TempratureSamples[Temp_Loop_Counter];
 }
 TempAvg = TempSum/10;
 SegNum = TempAvg;

 Temp_Array_Counter++;

 if(Temp_Array_Counter == 10){
 Temp_Array_Counter = 0;
 }
 }
}
=======
#line 1 "E:/Projects/Pic/WaterHeaterFinalV2/Temprature.c"
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
#line 2 "E:/Projects/Pic/WaterHeaterFinalV2/Temprature.c"
int TempratureSamples[10]={0,0,0,0,0,0,0,0,0,0};

extern int ReqTemp;
extern int Time_5_Sec;
extern int Time_1_Sec;

extern int Temp_Array_Counter;
extern int Temp_Loop_Counter;
extern int TempSum;
extern int TempAvg;
extern int TempTimeCounter;
extern char TempReadFlag;

extern int SegNum;

int ADC_Val = 0;
int TempADC_Val = 0;
int SampleADC_Val = 0;

void TempStartRead(void){
 TempTimeCounter++;
 if(TempTimeCounter== 10 ){
 TempTimeCounter = 0;
 TempReadFlag =  0 ;
 }else{

 }
}

void Temp_Avg(void){
 if(TempReadFlag ==  0 ){
 TempReadFlag =  1 ;
 ADC_Val = ADC_Read(2);
 TempADC_Val = ADC_Val * 4.89;
 SampleADC_Val = TempADC_Val/10;
 TempratureSamples[Temp_Array_Counter] = SampleADC_Val;
 TempSum = 0;
 for(Temp_Loop_Counter=0;Temp_Loop_Counter<10;Temp_Loop_Counter++ ){
 TempSum += TempratureSamples[Temp_Loop_Counter];
 }
 TempAvg = TempSum/10;
 SegNum = TempAvg;

 Temp_Array_Counter++;

 if(Temp_Array_Counter == 10){
 Temp_Array_Counter = 0;
 }
 }
}
>>>>>>> fb2327c20e9b5f5d914b13cb41c499f79a1633aa
