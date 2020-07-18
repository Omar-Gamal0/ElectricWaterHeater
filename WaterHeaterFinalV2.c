#include "Main.h"

int EEPROM_Val = 0;             // Variable in which the value of the last required temprature writen in the EEPROM is to be saved

char OnOffState = OFF_STATE;    // Flag variable in which the system state(On/Off) is to be saved
char OnMode = ON_MODE_WORKING;  // Flag variable in which the system On mode (Temprature setting/working) is to be saved
char Working_Mode = MODE_WAITING; // Flag variable in which the working mode of the system is to be saved
int ReqTemp = 60;               // variable in which required temprature is to be saved
int ButtonsTCounter = 0;        // Counter variable which is to be used to count time to read the Up & Down buttons state every 100 ms
int Time_5_Sec = 0;             // Counter variable which is to be used to count 5 seconds to change the mode to working mode after 5 seconds without the Up & Down buttons being pressed
int Time_1_Sec = 0;             // Counter variable which is to be used to count 1 second

int SegNum = 0;                 // Variable in which the value needed to be displayed on the SSD is to be saved
int TempSegNum = 0;             // Variable in which a temporary value is to be saved while calculating the tens value of the displayed number on the SSD
int SegNum1 = 0;                // Variable in which the ones value of the SSD number is to be saved
int SegNum10 = 0;               // Variable in which the tens value of the SSD number is to be saved
char SegState = SEG_ONES ;      // Flag variable in which the SSD state is to be saved
char SegBlink = SEG_ON;         // Flag variable in which the SSD blinking state is to be saved
char HeatingStateLED = LED_ON;  // Flag variable in which the Heating state LED value is to be saved

int Temp_Array_Counter = 0;     // Counter variable which is to decide the current index of the temprature samples array
int Temp_Loop_Counter = 0;      // Counter variable which is to be used in the summing loop while calculating the average temprature
int TempSum = 0;                // Variable in which the sum of the temprature samples is to be saved
int TempAvg = 0;                // Variable in which the average of the temprature samples is to be saved
int TempTimeCounter = 0;        // Counter variable which is to be used to calculae time to start reading temprature value
char TempReadFlag = TEMP_READ;  // Flag variable in which the temprature reading state is to be saved

void interrupt(){
  if(INTCON.INTF==1){                     // Checks the external interrupt flag bit
    INTCON.INTF = 0;                      // Resets External Interrupt Flag bit to 0
    if(OnOffState == OFF_STATE){          // Checks the condition to change the system state to on
      OnOffState = ON_STATE;              // changes the system state to on
      EEPROMReadVal();
      if((EEPROM_Val <= 75)&&(EEPROM_Val >= 35)){
        ReqTemp = EEPROM_Val;
      }else{
        ReqTemp = 60;
      }
    }else if(OnOffState == ON_STATE){     // Checks the condition to change the system state to off
      OnOffState = OFF_STATE;             // Changes the system state to off
    }else{

    }
  }
  if (INTCON.TMR0IF==1){
    TMR0=100;                                                           // Loading Timer0 Module Register with a value that gives overflow interrupt each 10ms
    INTCON.TMR0IF=0;                                                    // Resets TIMER0 Overflow Interrupt Flag bit to 0

    if((OnOffState == ON_STATE)&&(OnMode == ON_MODE_WORKING)){
      Time_1_Sec++;                                     // Increases the time counter counting 1 second
      WorkingMode();
      if(Time_1_Sec == TIME_1_SEC){                     // Checking if 1 second has passed
      Time_1_Sec = 0;                                   // Ressetting the 1 secondd counter value to 0
        if(HeatingStateLED == LED_ON){                  // Checking if current Heating state LED is On state
          HeatingStateLED = LED_OFF;                    // Setting Heating state LED to Off state
        }else if(HeatingStateLED == LED_OFF){           // Checking if current Heating state LED is Off state
          HeatingStateLED = LED_ON;                     // Setting Heating state LED to On state
        }else{

        }
      }

    }

    else if((OnOffState == ON_STATE)&&(OnMode == ON_MODE_TEMP_SETTING)){
      Time_5_Sec++;                // Increases the time counter counting 5 seconds
      Time_1_Sec++;                // Increases the time counter counting 1 second
      if(Time_5_Sec == TIME_5_SEC){                // Checking if 5 seconds have passed since last button being pressed
      EEPROMWriteVal();
      Time_5_Sec = 0;                            // Resetting the time counter counting 5 seconds to 0
      OnMode = ON_MODE_WORKING;                  // Changing operation mode to working mode (Ending the temprature setting mode)
      }
      if(Time_1_Sec == TIME_1_SEC){                // Checking if 1 second has passed
        Time_1_Sec = 0;                            // Ressetting the 1 secondd counter value to 0
        if(SegBlink == SEG_ON){                    // Checking if current blinking state of the SSD is On state
          SegBlink = SEG_OFF;                      // Setting blinking state of the SSD to Off state
        }else if(SegBlink == SEG_OFF){             // Checking if current blinking state of the SSD is Off state
          SegBlink = SEG_ON;                       // Setting blinking state of the SSD to On state
        }else{

        }
      }
      TempSettingMode();           // Calling the temprature setting function
    }
    else{

    }
  }

}

void main() {
  Init_Timer0();        // Inintializing the Timer & Loading the register with a value that gives 10ms before the overflow
  Init_ExtInt();        // Initializes the external interrupt for the power button (PORTB pin0).
  ADC_Init();           // Inintializing the ADC
  Initialization();     // Sets initial directions & values of needed ports & pins
  I2C1_Init(100000);    // initialize I2C communication

  while(1){

    if(OnOffState == ON_STATE){
      if(OnMode == ON_MODE_WORKING){
        Temp_Avg(void);    // Calling the Temp_Avg function to calculate the average temprature
        if((TempAvg+5) <= ReqTemp){
          Working_Mode = MODE_HEATING;          // Sets the working mode to heating state (Fan is Off & Heater On)
        }else if((TempAvg-5) >= ReqTemp){
          Working_Mode = MODE_COOLING;          // Sets the working mode to cooling state (Fan is On & Heater off)
        }else{

        }
      if(Working_Mode == MODE_HEATING){         // Checks the condition to start heating
        Heater();                               // Calling the heater function
      }
      else if(Working_Mode == MODE_COOLING){    // Checks the condition to start cooling
        Fan();                                  // Calling the Fan function
      }
      else if(Working_Mode == MODE_WAITING){    // Checks the condition to maintain temprature
        Wait();                                 // Calling the wait function
      }

      }else if(OnMode == ON_MODE_TEMP_SETTING){ // Checks the condition to enter temprature setting mode
        PORTB.B7 = 0;                           // Sets Heating state LED to LOW
        PORTC.B5 = 0;                           // Setting PORT C pin5 (the heater) pin as LOW (Turning the heater is off)
        PORTC.B2 = 0;                           // Setting PORT C pin2 (the fan) pin as LOW (Turning the fan is off)
      }

    }else{
      Off_State();                              // Calls the Off state function that sets value of Ports & pins to 0
    }
    _7Seg(void);       // Calling the 7 Segment Display function to display the Average temprature
  }

}
