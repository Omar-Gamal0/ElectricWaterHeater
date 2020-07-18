<<<<<<< HEAD
#line 1 "E:/Projects/Pic/WaterHeaterFinalV2/WaterHeaterFinalV2.c"
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
#line 3 "E:/Projects/Pic/WaterHeaterFinalV2/WaterHeaterFinalV2.c"
int EEPROM_Val = 0;

char OnOffState =  0 ;
char OnMode =  1 ;
char Working_Mode =  2 ;
int ReqTemp = 60;
int ButtonsTCounter = 0;
int Time_5_Sec = 0;
int Time_1_Sec = 0;

int SegNum = 0;
int TempSegNum = 0;
int SegNum1 = 0;
int SegNum10 = 0;
char SegState =  1  ;
char SegBlink =  1 ;
char HeatingStateLED =  1 ;

int Temp_Array_Counter = 0;
int Temp_Loop_Counter = 0;
int TempSum = 0;
int TempAvg = 0;
int TempTimeCounter = 0;
char TempReadFlag =  0 ;

void interrupt(){
 if(INTCON.INTF==1){
 INTCON.INTF = 0;
 if(OnOffState ==  0 ){
 OnOffState =  1 ;
 EEPROMReadVal();
 if((EEPROM_Val <= 75)&&(EEPROM_Val >= 35)){
 ReqTemp = EEPROM_Val;
 }else{
 ReqTemp = 60;
 }
 }else if(OnOffState ==  1 ){
 OnOffState =  0 ;
 }else{

 }
 }
 if (INTCON.TMR0IF==1){
 TMR0=100;
 INTCON.TMR0IF=0;

 if((OnOffState ==  1 )&&(OnMode ==  1 )){
 Time_1_Sec++;
 WorkingMode();
 if(Time_1_Sec ==  100 ){
 Time_1_Sec = 0;
 if(HeatingStateLED ==  1 ){
 HeatingStateLED =  0 ;
 }else if(HeatingStateLED ==  0 ){
 HeatingStateLED =  1 ;
 }else{

 }
 }

 }

 else if((OnOffState ==  1 )&&(OnMode ==  0 )){
 Time_5_Sec++;
 Time_1_Sec++;
 if(Time_5_Sec ==  500 ){
 EEPROMWriteVal();
 Time_5_Sec = 0;
 OnMode =  1 ;
 }
 if(Time_1_Sec ==  100 ){
 Time_1_Sec = 0;
 if(SegBlink ==  1 ){
 SegBlink =  0 ;
 }else if(SegBlink ==  0 ){
 SegBlink =  1 ;
 }else{

 }
 }
 TempSettingMode();
 }
 else{

 }
 }

}

void main() {
 Init_Timer0();
 Init_ExtInt();
 ADC_Init();
 Initialization();
 I2C1_Init(100000);

 while(1){

 if(OnOffState ==  1 ){
 if(OnMode ==  1 ){
 Temp_Avg(void);
 if((TempAvg+5) <= ReqTemp){
 Working_Mode =  0 ;
 }else if((TempAvg-5) >= ReqTemp){
 Working_Mode =  1 ;
 }else{

 }
 if(Working_Mode ==  0 ){
 Heater();
 }
 else if(Working_Mode ==  1 ){
 Fan();
 }
 else if(Working_Mode ==  2 ){
 Wait();
 }

 }else if(OnMode ==  0 ){
 PORTB.B7 = 0;
 PORTC.B5 = 0;
 PORTC.B2 = 0;
 }

 }else{
 Off_State();
 }
 _7Seg(void);
 }

}
=======
#line 1 "E:/Projects/Pic/WaterHeaterFinalV2/WaterHeaterFinalV2.c"
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
#line 3 "E:/Projects/Pic/WaterHeaterFinalV2/WaterHeaterFinalV2.c"
int EEPROM_Val = 0;

char OnOffState =  0 ;
char OnMode =  1 ;
char Working_Mode =  2 ;
int ReqTemp = 60;
int ButtonsTCounter = 0;
int Time_5_Sec = 0;
int Time_1_Sec = 0;

int SegNum = 0;
int TempSegNum = 0;
int SegNum1 = 0;
int SegNum10 = 0;
char SegState =  1  ;
char SegBlink =  1 ;
char HeatingStateLED =  1 ;

int Temp_Array_Counter = 0;
int Temp_Loop_Counter = 0;
int TempSum = 0;
int TempAvg = 0;
int TempTimeCounter = 0;
char TempReadFlag =  0 ;

void interrupt(){
 if(INTCON.INTF==1){
 INTCON.INTF = 0;
 if(OnOffState ==  0 ){
 OnOffState =  1 ;
 EEPROMReadVal();
 if((EEPROM_Val <= 75)&&(EEPROM_Val >= 35)){
 ReqTemp = EEPROM_Val;
 }else{
 ReqTemp = 60;
 }
 }else if(OnOffState ==  1 ){
 OnOffState =  0 ;
 }else{

 }
 }
 if (INTCON.TMR0IF==1){
 TMR0=100;
 INTCON.TMR0IF=0;

 if((OnOffState ==  1 )&&(OnMode ==  1 )){
 Time_1_Sec++;
 WorkingMode();
 if(Time_1_Sec ==  100 ){
 Time_1_Sec = 0;
 if(HeatingStateLED ==  1 ){
 HeatingStateLED =  0 ;
 }else if(HeatingStateLED ==  0 ){
 HeatingStateLED =  1 ;
 }else{

 }
 }

 }

 else if((OnOffState ==  1 )&&(OnMode ==  0 )){
 Time_5_Sec++;
 Time_1_Sec++;
 if(Time_5_Sec ==  500 ){
 EEPROMWriteVal();
 Time_5_Sec = 0;
 OnMode =  1 ;
 }
 if(Time_1_Sec ==  100 ){
 Time_1_Sec = 0;
 if(SegBlink ==  1 ){
 SegBlink =  0 ;
 }else if(SegBlink ==  0 ){
 SegBlink =  1 ;
 }else{

 }
 }
 TempSettingMode();
 }
 else{

 }
 }

}

void main() {
 Init_Timer0();
 Init_ExtInt();
 ADC_Init();
 Initialization();
 I2C1_Init(100000);

 while(1){

 if(OnOffState ==  1 ){
 if(OnMode ==  1 ){
 Temp_Avg(void);
 if((TempAvg+5) <= ReqTemp){
 Working_Mode =  0 ;
 }else if((TempAvg-5) >= ReqTemp){
 Working_Mode =  1 ;
 }else{

 }
 if(Working_Mode ==  0 ){
 Heater();
 }
 else if(Working_Mode ==  1 ){
 Fan();
 }
 else if(Working_Mode ==  2 ){
 Wait();
 }

 }else if(OnMode ==  0 ){
 PORTB.B7 = 0;
 PORTC.B5 = 0;
 PORTC.B2 = 0;
 }

 }else{
 Off_State();
 }
 _7Seg(void);
 }

}
>>>>>>> fb2327c20e9b5f5d914b13cb41c499f79a1633aa
