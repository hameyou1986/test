#include "bsp_delay.h"
#include "gd32c2x1.h"


void delay_loop(uint32_t cnt)
{
    __asm volatile (
        "1: subs %0, %0, #1 \n"
        "   bne 1b           \n"
        : "+r"(cnt)
        :
        : "cc"
    );
}

void delay_us(uint16_t us)
{
    for(int i=0; i< us;i++)
    {
        delay_loop(16/3);
    }
}

void delay_ms(uint16_t ms)
{
    for(int i=0; i< 1000;i++)
    {
        delay_us(1000);
    }
}


