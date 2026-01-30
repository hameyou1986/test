#include "gd32c2x1.h"

#include "bsp_i2c.h"
#include <stdio.h>
#include "bsp_delay.h"
#include "fm411_driver.h"
#include "bsp_gpio.h"

#define I2C_SPEED       400000
#define I2C_PAGE_SIZE   8
#define I2CX            I2C0
#define RCU_GPIO_I2C    RCU_GPIOB
#define RCU_I2C         RCU_I2C1
#define I2C_SCL_PORT    GPIOB
#define I2C_SDA_PORT    GPIOB
#define I2C_SCL_PIN     GPIO_PIN_6
#define I2C_SDA_PIN     GPIO_PIN_7
#define I2C_GPIO_AF     GPIO_AF_6


#define RCU_GPIO_CSN    RCU_GPIOA
#define CSN_PORT        GPIOA
#define CSN_PIN         GPIO_PIN_3


#define FM11_CS_ON      gpio_bit_reset(CSN_PORT, CSN_PIN)      
#define FM11_CS_OFF     gpio_bit_set(CSN_PORT, CSN_PIN)

typedef enum {
    I2C_START = 0,
    I2C_SEND_ADDRESS,
    I2C_RESTART,
    I2C_RECEIVE_DATA,
    I2C_STOP,
} i2c_process_enum;

#define I2C_TIME_OUT   (uint32_t)(20000)
#define EEP_FIRST_PAGE 0x00
#define I2C_OK         0
#define I2C_FAIL       1

/*!
    \brief      configure the GPIO ports
    \param[in]  none
    \param[out] none
    \retval     none
*/
void gpio_config(void)
{
    /* enable GPIOB clock */
    rcu_periph_clock_enable(RCU_GPIO_I2C);
    rcu_periph_clock_enable(RCU_GPIO_CSN);
    /* enable I2C clock */
    rcu_periph_clock_enable(RCU_I2C);

    /* connect PB6 to I2C_SCL */
    gpio_af_set(I2C_SCL_PORT, I2C_GPIO_AF, I2C_SCL_PIN);
    /* connect PB7 to I2C_SDA */
    gpio_af_set(I2C_SDA_PORT, I2C_GPIO_AF, I2C_SDA_PIN);
    /* configure GPIO pins of I2C */
    gpio_mode_set(I2C_SCL_PORT, GPIO_MODE_AF, GPIO_PUPD_PULLUP, I2C_SCL_PIN);
    gpio_output_options_set(I2C_SCL_PORT, GPIO_OTYPE_OD, GPIO_OSPEED_LEVEL_1, I2C_SCL_PIN);
    gpio_mode_set(I2C_SDA_PORT, GPIO_MODE_AF, GPIO_PUPD_PULLUP, I2C_SDA_PIN);
    gpio_output_options_set(I2C_SDA_PORT, GPIO_OTYPE_OD, GPIO_OSPEED_LEVEL_1, I2C_SDA_PIN);
    
    
    gpio_mode_set(CSN_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, CSN_PIN);
    gpio_output_options_set(GPIOA, GPIO_OTYPE_PP, GPIO_OSPEED_LEVEL_1, CSN_PIN);
}

/*!
    \brief      configure the I2C interface
    \param[in]  none
    \param[out] none
    \retval     none
*/
void i2c_config(void)
{
    /* configure I2C timing */
    i2c_timing_config(I2CX, 0, 0x3, 0);
    i2c_master_clock_config(I2CX, 0x13, 0x36);
    /* enable I2C */
    i2c_enable(I2CX);
}

/*!
    \brief      reset I2C gpio configure
    \param[in]  none
    \param[out] none
    \retval     none
*/
void i2c_gpio_reset(void)
{
    /* reset PB6 and PB7 */
    gpio_mode_set(I2C_SCL_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, I2C_SCL_PIN);
    gpio_output_options_set(I2C_SCL_PORT, GPIO_OTYPE_PP, GPIO_OSPEED_LEVEL_1, I2C_SCL_PIN);
    gpio_mode_set(I2C_SDA_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, I2C_SDA_PIN);
    gpio_output_options_set(I2C_SDA_PORT, GPIO_OTYPE_PP, GPIO_OSPEED_LEVEL_1, I2C_SDA_PIN);
}

/*!
    \brief      reset i2c bus
    \param[in]  none
    \param[out] none
    \retval     none
*/
void i2c_bus_reset()
{
    /* configure SDA/SCL for GPIO */
    GPIO_BC(I2C_SCL_PORT) |= I2C_SCL_PIN;
    GPIO_BC(I2C_SDA_PORT) |= I2C_SDA_PIN;
    /* reset PA11 and PA12 */
    i2c_gpio_reset();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    /* stop signal */
    GPIO_BOP(I2C_SCL_PORT) |= I2C_SCL_PIN;
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    GPIO_BOP(I2C_SDA_PORT) |= I2C_SDA_PIN;
    /* connect PA11 to I2C_SCL */
    /* connect PA12 to I2C_SDA */
    gpio_mode_set(I2C_SCL_PORT, GPIO_MODE_AF, GPIO_PUPD_PULLUP, I2C_SCL_PIN);
    gpio_output_options_set(I2C_SCL_PORT, GPIO_OTYPE_OD, GPIO_OSPEED_LEVEL_1, I2C_SCL_PIN);
    gpio_mode_set(I2C_SDA_PORT, GPIO_MODE_AF, GPIO_PUPD_PULLUP, I2C_SDA_PIN);
    gpio_output_options_set(I2C_SDA_PORT, GPIO_OTYPE_OD, GPIO_OSPEED_LEVEL_1, I2C_SDA_PIN);
}


void i2c_device_read(uint32_t I2C,
                     uint8_t dev_address,      /* 8-bit address */
                     uint16_t reg_address,
                     uint8_t reg_addr_len,      /* 0 / 1 / 2 */
                     uint8_t *p_buffer,
                     uint8_t number_of_byte)    /* <=255 */
{
    uint32_t timeout = 0;
    uint8_t end_flag = 0;

    i2c_process_enum state = I2C_START;

    if (number_of_byte == 0 || number_of_byte > 255) {
        return; /* ?????? */
    }

    while (!end_flag) {
        switch (state) {

        /*--------------------------------------------------*/
        case I2C_START:
            I2C_STAT(I2C) |= I2C_STAT_TBE;

            /* ???(?????????) */
            i2c_master_addressing(I2C, dev_address, I2C_MASTER_TRANSMIT);

            if (reg_addr_len > 0) {
                i2c_transfer_byte_number_config(I2C, reg_addr_len);
                i2c_automatic_end_disable(I2C);
            }

            while (i2c_flag_get(I2C, I2C_FLAG_I2CBSY) &&
                   (timeout < I2C_TIME_OUT)) {
                timeout++;
            }

            if (timeout < I2C_TIME_OUT) {
                i2c_start_on_bus(I2C);
                timeout = 0;

                if (reg_addr_len == 0) {
                    state = I2C_RESTART;
                } else {
                    state = I2C_SEND_ADDRESS;
                }
            } else {
                i2c_bus_reset();
                timeout = 0;
            }
            break;

        /*--------------------------------------------------*/
        case I2C_SEND_ADDRESS:
            while ((!i2c_flag_get(I2C, I2C_FLAG_TBE)) &&
                   (timeout < I2C_TIME_OUT)) {
                timeout++;
            }

            if (timeout < I2C_TIME_OUT) {
                if (reg_addr_len == 1) {
                    i2c_data_transmit(I2C, (uint8_t)reg_address);
                } else {
                    i2c_data_transmit(I2C, (uint8_t)(reg_address >> 8));
                    while (!i2c_flag_get(I2C, I2C_FLAG_TBE));
                    i2c_data_transmit(I2C, (uint8_t)reg_address);
                }
                timeout = 0;
                state = I2C_RESTART;
            } else {
                timeout = 0;
                state = I2C_START;
            }
            break;

        /*--------------------------------------------------*/
        case I2C_RESTART:
            if (reg_addr_len > 0) {
                while ((!i2c_flag_get(I2C, I2C_FLAG_TC)) &&
                       (timeout < I2C_TIME_OUT)) {
                    timeout++;
                }
                if (timeout >= I2C_TIME_OUT) {
                    timeout = 0;
                    state = I2C_START;
                    break;
                }
            }

            /* ??? */
            i2c_master_addressing(I2C, dev_address, I2C_MASTER_RECEIVE);
            i2c_transfer_byte_number_config(I2C, number_of_byte);
            i2c_automatic_end_enable(I2C);
            i2c_start_on_bus(I2C);

            timeout = 0;
            state = I2C_RECEIVE_DATA;
            break;

        /*--------------------------------------------------*/
        case I2C_RECEIVE_DATA:
            while (number_of_byte) {
                if (i2c_flag_get(I2C, I2C_FLAG_RBNE)) {
                    *p_buffer++ = i2c_data_receive(I2C);
                    number_of_byte--;
                }
            }
            state = I2C_STOP;
            break;

        /*--------------------------------------------------*/
        case I2C_STOP:
            while ((!i2c_flag_get(I2C, I2C_FLAG_STPDET)) &&
                   (timeout < I2C_TIME_OUT)) {
                timeout++;
            }
            i2c_flag_clear(I2C, I2C_FLAG_STPDET);
            end_flag = 1;
            break;

        default:
            end_flag = 1;
            break;
        }
    }
}



void i2c_scan_bus(uint32_t I2Cx,
                  void (*found_cb)(uint8_t addr7))
{
    uint32_t timeout;
    uint8_t addr7;

    for (addr7 = 0; addr7 < 128; addr7++) {

        timeout = 0;

        /* ?????? */
        while (i2c_flag_get(I2Cx, I2C_FLAG_I2CBSY) &&
               (timeout < I2C_TIME_OUT)) {
            timeout++;
        }
        if (timeout >= I2C_TIME_OUT) {
            i2c_bus_reset();
            continue;
        }

        /* ??? */
        I2C_STAT(I2Cx) |= I2C_STAT_TBE;

        /* ?? 7bit ??(?) */
        i2c_master_addressing(I2Cx,
                              (addr7 << 1),
                              I2C_MASTER_TRANSMIT);

        /* 0 ????,?? STOP */
        i2c_transfer_byte_number_config(I2Cx, 0);
        i2c_automatic_end_enable(I2Cx);

        /* START */
        i2c_start_on_bus(I2Cx);

        timeout = 0;

        /* ?? STOP ? NACK */
        while (!(i2c_flag_get(I2Cx, I2C_FLAG_STPDET) ||
                 i2c_flag_get(I2Cx, I2C_FLAG_NACK)) &&
               (timeout < I2C_TIME_OUT)) {
            timeout++;
        }

        /* ???:ACK + STOP */
        if (i2c_flag_get(I2Cx, I2C_FLAG_STPDET)) {
            i2c_flag_clear(I2Cx, I2C_FLAG_STPDET);
            if (found_cb) {
                found_cb(addr7);
            }
        }

        /* ???:NACK */
        if (i2c_flag_get(I2Cx, I2C_FLAG_NACK)) {
            i2c_flag_clear(I2Cx, I2C_FLAG_NACK);
        }
    }
}

#define FM11_I2C_ADDR							(0x57)


void found_cb(uint8_t x)
{
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();    
}




void bsp_i2c_device_detect(void)
{
    i2c_scan_bus(I2CX,found_cb);
}


void bsp_i2c_init(void)
{
    gpio_config();
    i2c_config();
    delay_ms(100);
    FM11_CS_ON;
    delay_us(500);
    //bsp_i2c_device_detect();
    //FM11_CS_OFF;
    uint8_t buf[50];
    i2c_device_read(I2CX,FM11_I2C_ADDR,0x00,2,buf,2);
}


#include "i2c_bus_device.h"

void i2c_bus0_gpio_init(void)
{
    /* enable GPIOB clock */
    rcu_periph_clock_enable(RCU_GPIO_I2C);
    rcu_periph_clock_enable(RCU_GPIO_CSN);

    /* configure GPIO pins of I2C */
    gpio_mode_set(I2C_SCL_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, I2C_SCL_PIN);
    gpio_output_options_set(I2C_SCL_PORT, GPIO_OTYPE_PP, GPIO_OSPEED_LEVEL_1, I2C_SCL_PIN);
    gpio_mode_set(I2C_SDA_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_PULLUP, I2C_SDA_PIN);
    gpio_output_options_set(I2C_SDA_PORT, GPIO_OTYPE_OD, GPIO_OSPEED_LEVEL_1, I2C_SDA_PIN);
    
    
    gpio_mode_set(CSN_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, CSN_PIN);
    gpio_output_options_set(CSN_PORT, GPIO_OTYPE_PP, GPIO_OSPEED_LEVEL_1, CSN_PIN);
    
    

}
void i2c_bus0_gpio_pinCtl(pin_i2c_t pin,pin_i2c_level_t level)
{
    if(pin == PIN_SCL)
    {
        //I2C_BUS0_SCK_OUT = level;
        gpio_bit_write(I2C_SCL_PORT,I2C_SCL_PIN,(bit_status)level);
    }else
    {
        //I2C_BUS0_SDA_OUT = level;
        gpio_bit_write(I2C_SDA_PORT,I2C_SDA_PIN,(bit_status)level);
    }
}
uint8_t i2c_bus0_gpio_read(pin_i2c_t pin)
{
    if(pin == PIN_SCL)
    {
        return gpio_input_bit_get(I2C_SCL_PORT,I2C_SCL_PIN);
    }else
    {
        return gpio_input_bit_get(I2C_SDA_PORT,I2C_SDA_PIN);
    }
}


i2c_bus_device i2c_bus0;

void bsp_i2c_bus_init(void)
{
    uint8_t i =0;
    uint32_t start,end;
    i2c_bus0.type = I2C_SW;
    i2c_bus0.sw.use_mutex = 0;
    i2c_bus0.sw.Clk = 400000;
    i2c_bus0.sw.delay_us =delay_us;
    i2c_bus0.sw.GPIO_Init=i2c_bus0_gpio_init;
    i2c_bus0.sw.GPIO_PinCtl = i2c_bus0_gpio_pinCtl;
    i2c_bus0.sw.GPIO_PinDirSet =0;
    i2c_bus0.sw.GPIO_Read=i2c_bus0_gpio_read;
    i2c_bus_device_init(&i2c_bus0);
    //start = DWT_GetTick();
    //uart_print("scan i2c_bus0 start:%u\r\n",start);
    for(i=0;i<128;i++)
    {
        if(!i2c_bus_device_CheckDevice(&i2c_bus0,i))
        {
            //uart_print("find i2c_bus0 device addr: %02X\r\n",i);
            break;
        }
    }
}


device_fm11_t dev_fm11;

void fm11_csn_ctl(uint8_t en)
{
    if(en)
    {
        gpio_bit_write(I2C_SCL_PORT,I2C_SCL_PIN,RESET);
    }else
    {
        gpio_bit_write(I2C_SCL_PORT,I2C_SCL_PIN,SET);
    }
}

void fm11_irq_pro(uint8_t type)
{
    uint8_t main_irq_status = dev_fm11_get_irq(&dev_fm11,FM11_REG_MAIN_IRQ);
    dev_fm11_irq_procee(&dev_fm11,main_irq_status);
}


void fm11_dev_init(void)
{
    dev_fm11.addr = 0x57;
    dev_fm11.delay_us = delay_us;
    dev_fm11.i2c_bus = &i2c_bus0;
    dev_fm11.fm11_csn_ctl = fm11_csn_ctl;
    uint8_t res = dev_fm11_init(&dev_fm11);    
    if(!res)
    {
        while(1);
    }
    bsp_gpio_int_callback_reg(FM_IRQ,fm11_irq_pro);
}


