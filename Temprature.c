#include "Main.h"
int TempratureSamples[10]={0,0,0,0,0,0,0,0,0,0};   // Array to save the temprature samples in it

extern int ReqTemp;               // variable in which required temprature is to be saved
extern int Time_5_Sec;             // Counter variable which is to be used to count 5 seconds to change the mode to working mode after 5 seconds without the Up & Down buttons being pressed
extern int Time_1_Sec;             // Counter variable which is to be used to count 1 second

extern int Temp_Array_Counter;     // Counter variable which is to decide the current index of the temprature samples array
extern int Temp_Loop_Counter;      // Counter variable which is to be used in the summing loop while calculating the average temprature
extern int TempSum;                // Variable in which the sum of the temprature samples is to be saved
extern int TempAvg;                // Variable in which the average of the temprature samples is to be saved
extern int TempTimeCounter;        // Counter variable which is to be used to calculae time to start reading temprature value
extern char TempReadFlag;  // Flag variable in which the temprature reading state is to be saved

extern int SegNum;                 // Variable in which the value needed to be displayed on the SSD is to be saved

int ADC_Val = 0;                // Variable in which the ADC reading is to be saved
int TempADC_Val = 0;            // Variable in which a temporary value is to be saved while calculating temprature sample value
int SampleADC_Val = 0;          // Variable in which the temprature sample value is to be saved

void TempStartRead(void){
  TempTimeCounter++;                            // Increasing the temprature time counter value
  if(TempTimeCounter==TEMP_COUNTER_MAX_VALUE){  // Checking if the temprature time counter value has reached the maximum value needed to start the temprature reading operation
    TempTimeCounter = 0;                        // Resettig  the temprature time counter value to 0
    TempReadFlag = TEMP_READ;                   // Changing the temprature read flag value to start reading state
  }else{

  }
}

void Temp_Avg(void){
  if(TempReadFlag == TEMP_READ){                                                // Checking the temprature start reading condition (Determined in the ISR)
    TempReadFlag = TEMP_WAIT;                                                   // Resetting the temprature start reading flag
    ADC_Val = ADC_Read(2);                                                      // Reading the analog value on channel 2
    TempADC_Val = ADC_Val * 4.89;                                               // Calculating the sample temprature value
    SampleADC_Val = TempADC_Val/10;                                             // Calculating the sample temprature value
    TempratureSamples[Temp_Array_Counter] = SampleADC_Val;                      // Saving the sample value in the Sample array
    TempSum = 0;                                                                // Resetting the summing value variable to 0
    for(Temp_Loop_Counter=0;Temp_Loop_Counter<10;Temp_Loop_Counter++ ){         // summing the values of the temprature samples
      TempSum += TempratureSamples[Temp_Loop_Counter];                          // summing the values of the temprature samples
    }
    TempAvg = TempSum/10;           // Calculating the average of the 10 Samples
    SegNum = TempAvg;               // Changing the value of the Global variable of the displayed number on SSD to the average temprature value

    Temp_Array_Counter++;           // Increasing the variable determining which index of the array to save the temprature sample in it's corresponding index of the array

    if(Temp_Array_Counter == 10){   // Checking the condition of the array counter to be reset to 0
      Temp_Array_Counter = 0;       // Resetting the temprature array counter to 0
    }
  }
}
