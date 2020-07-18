<<<<<<< HEAD
#ifndef MAIN_H_
#define MAIN_H_

#define OFF_STATE 0               // System off state macro
#define ON_STATE 1                // System on state macro

#define ON_MODE_TEMP_SETTING 0    // Temprature setting mode (while the system is in On state)
#define ON_MODE_WORKING 1         // Temprature working mode (while the system is in On state)
#define MODE_HEATING 0            // Heating mode state macro
#define LED_ON 1                  // Heating mode blinking led On state
#define LED_OFF 0                 // Heating mode blinking led Off state
#define MODE_COOLING 1            // Cooling mode state macro
#define MODE_WAITING 2            // Waiting mode state macro
#define TIME_5_SEC 500            // 5 seconds count value macro
#define TIME_1_SEC 100            // 1 second count value macro

#define SEG_WAIT1 0               // SSD ones waiting state macro
#define SEG_WAIT10 100            // SSD tens waiting state macro
#define SEG_ONES 1                // SSD ones start display state macro
#define SEG_TENS 10               // SSD ones start display state macro
#define SEG_ON 1                  // blinking SSD state (SSD On) macro
#define SEG_OFF 0                 // blinking SSD state (SSD Off) macro

#define TEMP_COUNTER_MAX_VALUE 10        // Max value of the temprature time counter before resetting to 0 macro
#define TEMP_READ 0                      // Temprature start reading macro
#define TEMP_WAIT 1                      // Temprature wait (don't read) macro

/*
  Init_Timer0:-
    INPUT:- void
    OUTPUT:- Initializes the timer0 with prescalar value 256, enables the Global Interrupt, Timer0 overflow Interrupt & Sets Timer0 Module Register value with a value that gives overflow interrupt after 10ms
*/
void Init_Timer0(void);

/*
  Init_ExtInt:-
    INPUT:- void
    OUTPUT:- Initializes the external interrupt for the power button (PORTB pin0).
*/
void Init_ExtInt(void);

/*
  TempSettingMode:-
    INPUT:- void
    OUTPUT:- Checks if the Up or Down buttons are pressed to rise or lower the required temperature and changes the mode to working mode if the 2 buttons aren't pressed for 5 seconds
*/
void TempSettingMode(void);

/*
  WorkingMode:-
    INPUT:- void
    OUTPUT:- Checks if the Up or Down buttons are pressed to change the mode to temperature setting mode and if not, compares the current temperature (the average of the  last 10 measured temperatures) to the required temperature to control the heater or the fan to gain the required temperature
*/
void WorkingMode(void);

/*
  Heater:-
    INPUT:- void
    OUTPUT:- Turns On the Heater and turns off the Fan to raise the temperature
*/
void Heater(void);

/*
  Fan:-
    INPUT:- void
      OUTPUT:- Turns On the Fan and turns off the Heater to lower the temperature
*/
void Fan(void);

/*
  Wait:-
    INPUT:- void
    OUTPUT:- Turns Off the Heater and turns off the Fan to maintain the temperature
*/
void Wait(void);

/*
  Temp_Avg:-
    INPUT:- void
    OUTPUT:- Calculates the temperature average for the last 10 temperature readings and sets the SSD displayed value to this average value
*/
void Temp_Avg(void);

/*
  _7Seg:-
    INPUT:- void
    OUTPUT:- Displayed the SegNum variable value on the SSD
*/
void _7Seg(void);

/*
  Seg_State:-
    INPUT:- void
    OUTPUT:- Sets the value of the SSD state flag variable (SegState)
*/
void Seg_State(void);

/*
  TempStartRead:-
    INPUT:- void
    OUTPUT:- Sets the value of the Temperature start Reading state flag variable (TempReadFlag)
*/
void TempStartRead(void);

/*
  Initialization:-
    INPUT:- void
    OUTPUT:- Sets initial directions & values of needed ports & pins
*/
void Initialization(void);

/*
  Off_State:-
    INPUT:- void
    OUTPUT:- Sets the values of needed ports & pins to 0
*/
void Off_State(void);

/*
  EEPROMWriteVal:-
    INPUT:- void
    OUTPUT:- Value of required temperature being writen in the EEPROM
*/
void EEPROMWriteVal(void);

/*
  EEPROMReadVal:-
    INPUT:- void
    OUTPUT:- Writes the value of the last required temperature writen in the EEPROM in the EEPROM reading variable
*/
void EEPROMReadVal(void);


=======
#ifndef MAIN_H_
#define MAIN_H_

#define OFF_STATE 0               // System off state macro
#define ON_STATE 1                // System on state macro

#define ON_MODE_TEMP_SETTING 0    // Temprature setting mode (while the system is in On state)
#define ON_MODE_WORKING 1         // Temprature working mode (while the system is in On state)
#define MODE_HEATING 0            // Heating mode state macro
#define LED_ON 1                  // Heating mode blinking led On state
#define LED_OFF 0                 // Heating mode blinking led Off state
#define MODE_COOLING 1            // Cooling mode state macro
#define MODE_WAITING 2            // Waiting mode state macro
#define TIME_5_SEC 500            // 5 seconds count value macro
#define TIME_1_SEC 100            // 1 second count value macro

#define SEG_WAIT1 0               // SSD ones waiting state macro
#define SEG_WAIT10 100            // SSD tens waiting state macro
#define SEG_ONES 1                // SSD ones start display state macro
#define SEG_TENS 10               // SSD ones start display state macro
#define SEG_ON 1                  // blinking SSD state (SSD On) macro
#define SEG_OFF 0                 // blinking SSD state (SSD Off) macro

#define TEMP_COUNTER_MAX_VALUE 10        // Max value of the temprature time counter before resetting to 0 macro
#define TEMP_READ 0                      // Temprature start reading macro
#define TEMP_WAIT 1                      // Temprature wait (don't read) macro

/*
  Init_Timer0:-
    INPUT:- void
    OUTPUT:- Initializes the timer0 with prescalar value 256, enables the Global Interrupt, Timer0 overflow Interrupt & Sets Timer0 Module Register value with a value that gives overflow interrupt after 10ms
*/
void Init_Timer0(void);

/*
  Init_ExtInt:-
    INPUT:- void
    OUTPUT:- Initializes the external interrupt for the power button (PORTB pin0).
*/
void Init_ExtInt(void);

/*
  TempSettingMode:-
    INPUT:- void
    OUTPUT:- Checks if the Up or Down buttons are pressed to rise or lower the required temperature and changes the mode to working mode if the 2 buttons aren't pressed for 5 seconds
*/
void TempSettingMode(void);

/*
  WorkingMode:-
    INPUT:- void
    OUTPUT:- Checks if the Up or Down buttons are pressed to change the mode to temperature setting mode and if not, compares the current temperature (the average of the  last 10 measured temperatures) to the required temperature to control the heater or the fan to gain the required temperature
*/
void WorkingMode(void);

/*
  Heater:-
    INPUT:- void
    OUTPUT:- Turns On the Heater and turns off the Fan to raise the temperature
*/
void Heater(void);

/*
  Fan:-
    INPUT:- void
      OUTPUT:- Turns On the Fan and turns off the Heater to lower the temperature
*/
void Fan(void);

/*
  Wait:-
    INPUT:- void
    OUTPUT:- Turns Off the Heater and turns off the Fan to maintain the temperature
*/
void Wait(void);

/*
  Temp_Avg:-
    INPUT:- void
    OUTPUT:- Calculates the temperature average for the last 10 temperature readings and sets the SSD displayed value to this average value
*/
void Temp_Avg(void);

/*
  _7Seg:-
    INPUT:- void
    OUTPUT:- Displayed the SegNum variable value on the SSD
*/
void _7Seg(void);

/*
  Seg_State:-
    INPUT:- void
    OUTPUT:- Sets the value of the SSD state flag variable (SegState)
*/
void Seg_State(void);

/*
  TempStartRead:-
    INPUT:- void
    OUTPUT:- Sets the value of the Temperature start Reading state flag variable (TempReadFlag)
*/
void TempStartRead(void);

/*
  Initialization:-
    INPUT:- void
    OUTPUT:- Sets initial directions & values of needed ports & pins
*/
void Initialization(void);

/*
  Off_State:-
    INPUT:- void
    OUTPUT:- Sets the values of needed ports & pins to 0
*/
void Off_State(void);

/*
  EEPROMWriteVal:-
    INPUT:- void
    OUTPUT:- Value of required temperature being writen in the EEPROM
*/
void EEPROMWriteVal(void);

/*
  EEPROMReadVal:-
    INPUT:- void
    OUTPUT:- Writes the value of the last required temperature writen in the EEPROM in the EEPROM reading variable
*/
void EEPROMReadVal(void);


>>>>>>> fb2327c20e9b5f5d914b13cb41c499f79a1633aa
#endif