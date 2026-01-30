#ifndef _I2C_BUS_DEVICE_H_
#define _I2C_BUS_DEVICE_H_

#include "stdint.h"

typedef enum{
    I2C_SW,
    I2C_HW,
}i2c_type_t;

typedef enum{
    PIN_SCL,
    PIN_SDA,
}pin_i2c_t;

typedef enum{
    PIN_LOW,
    PIN_HIGHT,
}pin_i2c_level_t;

typedef enum{
    PIN_INPUT,
    PIN_OUTPUT,
}pin_i2c_set_t;

typedef struct{
	i2c_type_t type;
	uint32_t Clk;
    uint8_t use_mutex;
    void **mutex_id;
    void (*lock)(void**);
    void (*unlock)(void**);
	uint16_t ClkCycle;
	void (*delay_us)(uint16_t us);
	void (*GPIO_Init)(void);
	void (*GPIO_Deinit)(void);
	void (*GPIO_PinCtl)(pin_i2c_t,pin_i2c_level_t);
	void (*GPIO_PinDirSet)(pin_i2c_t,pin_i2c_set_t);
	uint8_t (*GPIO_Read)(pin_i2c_t);
}dev_sw_i2c_t;

typedef struct{
	i2c_type_t type;
	uint32_t Clk;
    uint8_t use_mutex;
    void **mutex_id;
    void (*lock)(void **mutex);
    void (*unlock)(void **mutex);
	void (*I2c_Init)(uint32_t clk);
	void (*I2C_Start)(void);
	void (*I2C_Stop)(void);
	void (*I2C_SendByte)(uint8_t);
	uint8_t (*I2C_ReadByte)(void);
	uint8_t (*I2C_WaitAck)(void);	
	void (*I2C_Ack)(void);
	void (*I2C_NAck)(void);	
}dev_hw_i2c_t;

typedef union{
	i2c_type_t type;	
	dev_sw_i2c_t sw;
	dev_hw_i2c_t hw;
}i2c_bus_device;


void i2c_bus_device_init(i2c_bus_device *dev);

void i2c_bus_device_SendByte(i2c_bus_device *dev,uint8_t ucByte);

uint8_t i2c_bus_device_CheckDevice(i2c_bus_device *dev,uint8_t _Address);

uint8_t i2c_bus_device_Read(i2c_bus_device *dev,uint8_t dev_addr,uint16_t reg_addr,uint8_t reg_addr_size,uint8_t *buf,uint8_t len);

uint8_t i2c_bus_device_Write(i2c_bus_device *dev,uint8_t dev_addr,uint16_t reg_addr,uint8_t reg_addr_size,uint8_t *buf,uint8_t len);

#endif
