<<<<<<< HEAD
#include "Main.h"
extern char Working_Mode = MODE_WAITING; // Flag variable in which the working mode of the system is to be saved
extern int Time_1_Sec;             // Counter variable which is to be used to count 1 second
extern char HeatingStateLED = LED_ON;  // Flag variable in which the Heating state LED value is to be saved
extern int TempAvg;                // Variable in which the average of the temprature samples is to be saved
extern int ReqTemp;               // variable in which required temprature is to be saved

void Heater(void){

  if(HeatingStateLED == LED_ON){                   // Checking if current blinking state of the SSD is On state
    PORTB.B7 = 1;                                  // Sets Heating state LED to HIGH
  }else if(HeatingStateLED == LED_OFF){            // Checking if current blinking state of the SSD is Off state
    PORTB.B7 = 0;                                  // Sets Heating state LED to LOW
  }else{

  }
  if(TempAvg < (ReqTemp + 5)){
    PORTC.B5 = 1;                     // Setting PORT C pin5 (the heater) pin as HIGH (Turning the heater is on)
    PORTC.B2 = 0;                     // Setting PORT C pin2 (the fan) pin as LOW (Turning the fan is off)
  }else{
    Working_Mode = MODE_WAITING;      // Sets the working mode to waiting state (both Fan & Heater are off)
  }
}

void Fan(void){
  PORTB.B7 = 1;                                  // Sets Heating state LED to HIGH
  if(TempAvg > (ReqTemp - 5)){
    PORTC.B5 = 0;                      // Setting PORT C pin5 (the heater) pin as LOW (Turning the heater is off)
    PORTC.B2 = 1;                      // Setting PORT C pin2 (the fan) pin as HIGH (Turning the fan is on)
  }else{
    Working_Mode = MODE_WAITING;       // Sets the working mode to waiting state (both Fan & Heater are off)
  }

}

void Wait(void){
  PORTB.B7 = 0;        // Sets Heating state LED to LOW
  Time_1_Sec = 0;      // Counter variable which is to be used to count 1 second
  PORTC.B5 = 0;        // Setting PORT C pin5 (the heater) pin as LOW (Turning the heater is off)
  PORTC.B2 = 0;        // Setting PORT C pin2 (the fan) pin as LOW (Turning the fan is off)
=======
#include "Main.h"
extern char Working_Mode = MODE_WAITING; // Flag variable in which the working mode of the system is to be saved
extern int Time_1_Sec;             // Counter variable which is to be used to count 1 second
extern char HeatingStateLED = LED_ON;  // Flag variable in which the Heating state LED value is to be saved
extern int TempAvg;                // Variable in which the average of the temprature samples is to be saved
extern int ReqTemp;               // variable in which required temprature is to be saved

void Heater(void){

  if(HeatingStateLED == LED_ON){                   // Checking if current blinking state of the SSD is On state
    PORTB.B7 = 1;                                  // Sets Heating state LED to HIGH
  }else if(HeatingStateLED == LED_OFF){            // Checking if current blinking state of the SSD is Off state
    PORTB.B7 = 0;                                  // Sets Heating state LED to LOW
  }else{

  }
  if(TempAvg < (ReqTemp + 5)){
    PORTC.B5 = 1;                     // Setting PORT C pin5 (the heater) pin as HIGH (Turning the heater is on)
    PORTC.B2 = 0;                     // Setting PORT C pin2 (the fan) pin as LOW (Turning the fan is off)
  }else{
    Working_Mode = MODE_WAITING;      // Sets the working mode to waiting state (both Fan & Heater are off)
  }
}

void Fan(void){
  PORTB.B7 = 1;                                  // Sets Heating state LED to HIGH
  if(TempAvg > (ReqTemp - 5)){
    PORTC.B5 = 0;                      // Setting PORT C pin5 (the heater) pin as LOW (Turning the heater is off)
    PORTC.B2 = 1;                      // Setting PORT C pin2 (the fan) pin as HIGH (Turning the fan is on)
  }else{
    Working_Mode = MODE_WAITING;       // Sets the working mode to waiting state (both Fan & Heater are off)
  }

}

void Wait(void){
  PORTB.B7 = 0;        // Sets Heating state LED to LOW
  Time_1_Sec = 0;      // Counter variable which is to be used to count 1 second
  PORTC.B5 = 0;        // Setting PORT C pin5 (the heater) pin as LOW (Turning the heater is off)
  PORTC.B2 = 0;        // Setting PORT C pin2 (the fan) pin as LOW (Turning the fan is off)
>>>>>>> fb2327c20e9b5f5d914b13cb41c499f79a1633aa
}