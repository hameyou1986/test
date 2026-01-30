#ifndef _BSP_GPIO_H_
#define _BSP_GPIO_H_

#include <stdint.h>


#define FM_IRQ    0

void bsp_gpio_int_init();

void bsp_gpio_int_callback_reg(int irq, void (*irq_fun)(uint8_t));







#endif