/*
* main.c
*/
#define CHIP_6713
#include "dsk6713.h"
#include "dsk6713_led.h"
#include "dsk6713_flash.h"
void main(void)
{
 DSK6713_init();
 DSK6713_LED_init();
 while (1)
 {
 DSK6713_LED_toggle(2);
 DSK6713_waitusec(1000000);
 }
}
