<<<<<<< HEAD
#include "Main.h"

extern char OnMode;  // Flag variable in which the system On mode (Temprature setting/working) is to be saved

extern int ReqTemp;               // variable in which required temprature is to be saved
extern int ButtonsTCounter;        // Counter variable which is to be used to count time to read the Up & Down buttons state every 100 ms

extern int Time_5_Sec;             // Counter variable which is to be used to count 5 seconds to change the mode to working mode after 5 seconds without the Up & Down buttons being pressed
extern int Time_1_Sec;             // Counter variable which is to be used to count 1 second

extern int SegNum = 0;                 // Variable in which the value needed to be displayed on the SSD is to be saved
extern char SegBlink;         // Flag variable in which the SSD blinking state is to be saved

void Init_ExtInt(void){
  INTCON.GIE=1;        // Enabling Global Interrupt
  TRISB.B0 = 1;        // Sets PORTB pin0 (external interrupt) as input
  INTCON.INTE = 1;     // Enabling external interrupt
}

void WorkingMode(void){
  ButtonsTCounter++;
  Seg_State();                                // Calls the SSD state controlling function
  TempStartRead();                            // Calls the temprature start reading function
  if(ButtonsTCounter==10){                    // Checks if 100 ms passed to start reading the state of the Up & Down buttons
    if((PORTB.B2 == 0) || (PORTB.B1 == 0)){   // Checks if the Up or Down buttons are pressed
      OnMode = ON_MODE_TEMP_SETTING;          // Sets the Mode of the system to temprature setting mode
      SegBlink = SEG_ON;                      // Setting blinking state of the SSD to On state
      Time_1_Sec = 0;                         // Ressetting the 1 secondd counter value to 0
    }
    ButtonsTCounter = 0;                      // resets the counter variable that saves the time to check the states of the Up & Down buttons
  }



}

void TempSettingMode(void){
  ButtonsTCounter++;                           // Increases the time counter controlling checking buttons states

  if(ButtonsTCounter==10){                     // Cheking if 100 ms passed (The condition to check buttons states)
    if(PORTB.B2 == 0){                         // Cheking if Up button is pressed
      SegBlink = SEG_ON;                       // Setting blinking state of the SSD to On state
      Time_1_Sec = 0;                          // Ressetting the 1 secondd counter value to 0
      if(ReqTemp < 75){
      ReqTemp += 5;                            // Increasing required temprature by 5 degrees
      }
      Time_5_Sec = 0;                          // Resetting the time counter counting 5 seconds to 0
    }else if(PORTB.B1 == 0){                   // Cheking if Down button is pressed
      SegBlink = SEG_ON;                       // Setting blinking state of the SSD to On state
      Time_1_Sec = 0;                          // Ressetting the 1 secondd counter value to 0
      if(ReqTemp > 35){
      ReqTemp -= 5;                            // Decreasing required temprature by 5 degrees
      }
      Time_5_Sec = 0;                          // Resetting the time counter counting 5 seconds to 0
    }else{

    }
    ButtonsTCounter = 0;                       // Resetting the time counter controlling checking buttons states
  }
  if(SegBlink == SEG_ON){                      // Checks if the current state of the SSD is On
    SegNum = ReqTemp;                          // Sets the number displayed on SSD to the current required temprature
    Seg_State();                               // Calls the SSD state controlling function
  }else if(SegBlink == SEG_OFF){               // Checks if the current state of the SSD is Off
    PORTD = 0;                                 // Resets values of all PORT D pins to 0
    PORTA.B5=0;                                // Turning off the ones SSD
    PORTA.B4=0;                                // Turning off the tens SSD
  }

=======
#include "Main.h"

extern char OnMode;  // Flag variable in which the system On mode (Temprature setting/working) is to be saved

extern int ReqTemp;               // variable in which required temprature is to be saved
extern int ButtonsTCounter;        // Counter variable which is to be used to count time to read the Up & Down buttons state every 100 ms

extern int Time_5_Sec;             // Counter variable which is to be used to count 5 seconds to change the mode to working mode after 5 seconds without the Up & Down buttons being pressed
extern int Time_1_Sec;             // Counter variable which is to be used to count 1 second

extern int SegNum = 0;                 // Variable in which the value needed to be displayed on the SSD is to be saved
extern char SegBlink;         // Flag variable in which the SSD blinking state is to be saved

void Init_ExtInt(void){
  INTCON.GIE=1;        // Enabling Global Interrupt
  TRISB.B0 = 1;        // Sets PORTB pin0 (external interrupt) as input
  INTCON.INTE = 1;     // Enabling external interrupt
}

void WorkingMode(void){
  ButtonsTCounter++;
  Seg_State();                                // Calls the SSD state controlling function
  TempStartRead();                            // Calls the temprature start reading function
  if(ButtonsTCounter==10){                    // Checks if 100 ms passed to start reading the state of the Up & Down buttons
    if((PORTB.B2 == 0) || (PORTB.B1 == 0)){   // Checks if the Up or Down buttons are pressed
      OnMode = ON_MODE_TEMP_SETTING;          // Sets the Mode of the system to temprature setting mode
      SegBlink = SEG_ON;                      // Setting blinking state of the SSD to On state
      Time_1_Sec = 0;                         // Ressetting the 1 secondd counter value to 0
    }
    ButtonsTCounter = 0;                      // resets the counter variable that saves the time to check the states of the Up & Down buttons
  }



}

void TempSettingMode(void){
  ButtonsTCounter++;                           // Increases the time counter controlling checking buttons states

  if(ButtonsTCounter==10){                     // Cheking if 100 ms passed (The condition to check buttons states)
    if(PORTB.B2 == 0){                         // Cheking if Up button is pressed
      SegBlink = SEG_ON;                       // Setting blinking state of the SSD to On state
      Time_1_Sec = 0;                          // Ressetting the 1 secondd counter value to 0
      if(ReqTemp < 75){
      ReqTemp += 5;                            // Increasing required temprature by 5 degrees
      }
      Time_5_Sec = 0;                          // Resetting the time counter counting 5 seconds to 0
    }else if(PORTB.B1 == 0){                   // Cheking if Down button is pressed
      SegBlink = SEG_ON;                       // Setting blinking state of the SSD to On state
      Time_1_Sec = 0;                          // Ressetting the 1 secondd counter value to 0
      if(ReqTemp > 35){
      ReqTemp -= 5;                            // Decreasing required temprature by 5 degrees
      }
      Time_5_Sec = 0;                          // Resetting the time counter counting 5 seconds to 0
    }else{

    }
    ButtonsTCounter = 0;                       // Resetting the time counter controlling checking buttons states
  }
  if(SegBlink == SEG_ON){                      // Checks if the current state of the SSD is On
    SegNum = ReqTemp;                          // Sets the number displayed on SSD to the current required temprature
    Seg_State();                               // Calls the SSD state controlling function
  }else if(SegBlink == SEG_OFF){               // Checks if the current state of the SSD is Off
    PORTD = 0;                                 // Resets values of all PORT D pins to 0
    PORTA.B5=0;                                // Turning off the ones SSD
    PORTA.B4=0;                                // Turning off the tens SSD
  }

>>>>>>> fb2327c20e9b5f5d914b13cb41c499f79a1633aa
}