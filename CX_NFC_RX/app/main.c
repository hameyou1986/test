#include "gd32c2x1.h"
#include <stdio.h>
#include "bsp_i2c.h"
#include "bsp_gpio.h"
#include "bsp_adc.h"
//#include "fm411_driver.h"
#include "nfc_command.h"
void systick_config(void)
{
    /* setup systick timer for 1000Hz interrupts */
    if(SysTick_Config(SystemCoreClock / 1000U)) {
        /* capture error */
        while(1) {
        }
    }
    /* configure the systick handler priority */
    NVIC_SetPriority(SysTick_IRQn, 0x00U);
}
extern device_fm11_t dev_fm11;
 int main(void)
 {
    //systick_config();
    //bsp_i2c_init();
    bsp_gpio_int_init();     
    bsp_i2c_bus_init(); 
    fm11_dev_init();
    table_init(); 
    adc_init();     
    while(1)
    {
        adc_channel_sample();
        prog_task(&dev_fm11);   
        
    }
 }