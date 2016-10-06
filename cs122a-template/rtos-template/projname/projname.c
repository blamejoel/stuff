/*	[projname].c - [date]
 *	Name & E-mail: [name] - [email]
 *	CS Login: [netid]
 *	Partner(s) Name & E-mail:
 *	Lab Section: 022
 *	Assignment: Lab #[lab]  Exercise #[part]
 *	Exercise Description:
 *
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>
#include <avr/portpins.h>
#include <avr/pgmspace.h>

//FreeRTOS include files
#include "FreeRTOS.h"
#include "task.h"
#include "croutine.h"

enum LED0State {SM1_INIT,SM1_OFF,SM1_ON} _state;

void LEDS_Init(){
	_state = SM1_INIT;
}

void LEDS_Tick(){
	//Actions
	switch(_state){
		default:
            break;
	}
	//Transitions
	switch(_state){
		default:
			_state = SM1_INIT;
            break;
	}
}

void LedSecTask()
{
	LEDS_Init();
   for(;;)
   {
	LEDS_Tick();
	vTaskDelay(1000);
   }
}

void StartSecPulse(unsigned portBASE_TYPE Priority)
{
	xTaskCreate(LedSecTask, (signed portCHAR *)"LedSecTask", configMINIMAL_STACK_SIZE, NULL, Priority, NULL );
}

int main(void)
{
   DDRA = 0x00; PORTA=0xFF;
   DDRD = 0xFF;
   //Start Tasks
   StartSecPulse(1);
    //RunSchedular
   vTaskStartScheduler();

   return 0;
}
