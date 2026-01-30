#include "gd32c2x1.h"
#include "bsp_gpio.h"
#include <stddef.h>
enum{
    PUPD_NONE = 0,
    PUPD_PULLUP,
    PUPD_PULLDOWN,
};


enum {
    TRIG_RISING = 0,                                     /*!< EXTI rising edge trigger */
    TRIG_FALLING,                                        /*!< EXTI falling edge trigger */
    TRIG_BOTH,                                           /*!< EXTI rising and falling edge trigger */
};
typedef struct{
   uint32_t rcu_periph;
   uint32_t gpio_periph;
   uint32_t gpio_pin;
   uint8_t pupd;
   uint8_t trig_type;    
   uint8_t exti_port;
   uint8_t exti_pin;
   uint32_t exti_line;    
   uint8_t irqn;
   void (*irq_fun)(uint8_t);    
}gpio_int_cfg_t;


gpio_int_cfg_t  gpio_int_cfg[]={
    {RCU_GPIOA,GPIOA,GPIO_PIN_4,PUPD_PULLUP,TRIG_FALLING,EXTI_SOURCE_GPIOA,EXTI_SOURCE_PIN4,EXTI_4,EXTI4_IRQn,NULL},
};



void bsp_gpio_int_init(void)
{
    rcu_periph_clock_enable(RCU_SYSCFG);
    for(int i=0; i< sizeof(gpio_int_cfg)/sizeof(gpio_int_cfg_t);i++)
    {
        gpio_int_cfg_t *cfg = &gpio_int_cfg[i];
        /* enable the GPIO clock */
        rcu_periph_clock_enable(cfg->rcu_periph);
        uint32_t pull_up_down = cfg->pupd == PUPD_NONE ? GPIO_PUPD_NONE:cfg->pupd == PUPD_PULLUP ? GPIO_PUPD_PULLUP: GPIO_PUPD_PULLDOWN;         
        gpio_mode_set(cfg->gpio_periph, GPIO_MODE_INPUT, pull_up_down, cfg->gpio_pin);
        nvic_irq_enable(cfg->irqn, 0);
        syscfg_exti_line_config(cfg->exti_port,cfg->exti_pin);
        exti_trig_type_enum trig_type = cfg->trig_type == TRIG_RISING? EXTI_TRIG_RISING:cfg->trig_type == TRIG_FALLING ?EXTI_TRIG_FALLING : EXTI_TRIG_BOTH;
        exti_init(cfg->exti_line,EXTI_INTERRUPT,trig_type);
        exti_interrupt_flag_clear(cfg->exti_line);
    }
}




void EXTI4_IRQHandler(void)
{
    if(RESET != exti_interrupt_flag_get(EXTI_4)) 
    {
        exti_interrupt_flag_clear(EXTI_4);
        if(gpio_int_cfg[FM_IRQ].irq_fun)
        {
            gpio_int_cfg[FM_IRQ].irq_fun(0);
        }
    }    
}

void bsp_gpio_int_callback_reg(int irq, void (*irq_fun)(uint8_t))
{
    if(irq >= sizeof(gpio_int_cfg)/sizeof(gpio_int_cfg_t))
    {
        return;
    }
    gpio_int_cfg[irq].irq_fun = irq_fun;
}

