#include "Main.h"

// Saving the SSD sequence in an array to Display them correctly
char SSD[10]={0b00111111,0b00000110,0b01011011,0b01001111,0b01100110,0b01101101,0b01111101,0b00000111,0b01111111,0b01101111};

extern int SegNum;                 // Variable in which the value needed to be displayed on the SSD is to be saved
extern int TempSegNum;             // Variable in which a temporary value is to be saved while calculating the tens value of the displayed number on the SSD
extern int SegNum1;                // Variable in which the ones value of the SSD number is to be saved
extern int SegNum10;               // Variable in which the tens value of the SSD number is to be saved
extern char SegState;      // Flag variable in which the SSD state is to be saved
extern char SegBlink;         // Flag variable in which the SSD blinking state is to be saved

void Seg_State(void){
  if(SegState==SEG_WAIT1){           // Checking the condition to start the SSD ones diplay operation
    SegState = SEG_ONES;             // Changing the SSD state flag value to start to start the SSD ones diplay operation
  }
  else if(SegState==SEG_WAIT10){     // Checking the condition to start the SSD tens diplay operation
    SegState = SEG_TENS;             // Changing the SSD state flag value to start to start the SSD tens diplay operation
  } else{

  }
}

void _7Seg(void){
  if(SegState==SEG_ONES){       // Checking the condition to set the value of the ones SSD and turn it on (Determined in the ISR)
      SegState = SEG_WAIT10;    // Setting the temprature state flag to the tens waiting state
      SegNum1 = SegNum%10;      // calculating the ones value
      PORTD = SSD[SegNum1];     // Setting the SSD value to the ones value
      PORTA.B5=1;               // Turning on the ones SSD
      PORTA.B4=0;               // Turning off the tens SSD
    }

    else if(SegState==SEG_TENS){ // Checking the condition to set the value of the ones SSD and turn it on (Determined in the ISR)
      SegState = SEG_WAIT1;      // Setting the temprature state flag to the ones waiting state
      TempSegNum = SegNum/10;    // Calculating temporary
      SegNum10 = TempSegNum%10;  // calculating the tens value
      PORTD = SSD[SegNum10];     // Setting the SSD value to the tens value
      PORTA.B5=0;                // Turning off the ones SSD
      PORTA.B4=1;                // Turning on the tens SSD
    }
}
