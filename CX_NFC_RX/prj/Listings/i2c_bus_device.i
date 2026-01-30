# 1 "../drv/i2c_bus_device.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 358 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "../drv/i2c_bus_device.c" 2
# 1 "../drv/i2c_bus_device.h" 1



# 1 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdint.h" 1 3
# 56 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdint.h" 3
typedef signed char int8_t;
typedef signed short int int16_t;
typedef signed int int32_t;
typedef signed long long int int64_t;


typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long int uint64_t;





typedef signed char int_least8_t;
typedef signed short int int_least16_t;
typedef signed int int_least32_t;
typedef signed long long int int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;
typedef unsigned long long int uint_least64_t;




typedef signed int int_fast8_t;
typedef signed int int_fast16_t;
typedef signed int int_fast32_t;
typedef signed long long int int_fast64_t;


typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef unsigned long long int uint_fast64_t;






typedef signed int intptr_t;
typedef unsigned int uintptr_t;



typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
# 5 "../drv/i2c_bus_device.h" 2

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
# 2 "../drv/i2c_bus_device.c" 2






void i2c_bus_device_init(i2c_bus_device *dev)
{
 if(dev->type==I2C_SW)
    {
        dev->sw.GPIO_Init();
        dev->sw.ClkCycle = 500000/dev->sw.Clk;
    }else
    {
        dev->hw.I2c_Init(dev->hw.Clk);
    }
}
# 29 "../drv/i2c_bus_device.c"
void i2c_bus_device_Start(i2c_bus_device *dev)
{
 if(dev->type==I2C_SW)
 {

  dev->sw.GPIO_PinCtl(PIN_SDA,PIN_HIGHT);
  dev->sw.GPIO_PinCtl(PIN_SCL,PIN_HIGHT);

  dev->sw.delay_us(dev->sw.ClkCycle);

  dev->sw.GPIO_PinCtl(PIN_SDA,PIN_LOW);
  dev->sw.delay_us(dev->sw.ClkCycle);





 }else
 {
  dev->hw.I2C_Start();
 }
}
# 60 "../drv/i2c_bus_device.c"
void i2c_bus_device_Stop(i2c_bus_device *dev)
{
 if(dev->type==I2C_SW)
 {

  dev->sw.GPIO_PinCtl(PIN_SDA,PIN_LOW);
  dev->sw.GPIO_PinCtl(PIN_SCL,PIN_HIGHT);
  dev->sw.delay_us(dev->sw.ClkCycle);
  dev->sw.GPIO_PinCtl(PIN_SDA,PIN_HIGHT);
  dev->sw.delay_us(dev->sw.ClkCycle);
 }else
 {
  dev->hw.I2C_Stop();
 }
}
# 84 "../drv/i2c_bus_device.c"
void i2c_bus_device_SendByte(i2c_bus_device *dev,uint8_t ucByte)
{
 uint8_t i;
 if(dev->type==I2C_SW)
 {

  for (i = 0; i < 8; i++)
  {
   dev->sw.GPIO_PinCtl(PIN_SCL,PIN_LOW);

   if (ucByte & 0x80)
   {
    dev->sw.GPIO_PinCtl(PIN_SDA,PIN_HIGHT);
   }
   else
   {
    dev->sw.GPIO_PinCtl(PIN_SDA,PIN_LOW);
   }
   dev->sw.delay_us(dev->sw.ClkCycle);
   dev->sw.GPIO_PinCtl(PIN_SCL,PIN_HIGHT);
   dev->sw.delay_us(dev->sw.ClkCycle);

   ucByte <<= 1;
  }
        dev->sw.GPIO_PinCtl(PIN_SCL,PIN_LOW);
  dev->sw.GPIO_PinCtl(PIN_SDA,PIN_HIGHT);
 }else
 {
  dev->hw.I2C_SendByte(ucByte);
 }
}
# 124 "../drv/i2c_bus_device.c"
uint8_t i2c_bus_device_ReadByte(i2c_bus_device *dev)
{
 uint8_t i;
 uint8_t value = 0;
 if(dev->type==I2C_SW)
 {

  for (i = 0; i < 8; i++)
  {
   value <<= 1;
   dev->sw.GPIO_PinCtl(PIN_SCL,PIN_HIGHT);
   dev->sw.delay_us(dev->sw.ClkCycle);
   if(dev->sw.GPIO_PinDirSet!=0)
   {
    dev->sw.GPIO_PinDirSet(PIN_SDA,PIN_INPUT);
   }

   if (dev->sw.GPIO_Read(PIN_SDA))
   {
    value++;
   }
   dev->sw.GPIO_PinCtl(PIN_SCL,PIN_LOW);
   dev->sw.delay_us(dev->sw.ClkCycle);
  }
 }else
 {
  value = dev->hw.I2C_ReadByte();
 }
 return value;
}
# 163 "../drv/i2c_bus_device.c"
uint8_t i2c_bus_device_WaitAck(i2c_bus_device *dev)
{
 uint8_t ack;
 if(dev->type==I2C_SW)
 {


  if(dev->sw.GPIO_PinDirSet!=0)
  {
   dev->sw.GPIO_PinDirSet(PIN_SDA,PIN_INPUT);
  }
  dev->sw.GPIO_PinCtl(PIN_SCL,PIN_HIGHT);
  dev->sw.delay_us(dev->sw.ClkCycle);
  if (dev->sw.GPIO_Read(PIN_SDA))
  {
   ack = 1;
  }
  else
  {
   ack = 0;
  }
  dev->sw.GPIO_PinCtl(PIN_SCL,PIN_LOW);
  dev->sw.delay_us(dev->sw.ClkCycle);
 }else
 {
  dev->hw.I2C_WaitAck();
 }
 return ack;
}
# 201 "../drv/i2c_bus_device.c"
void i2c_bus_device_Ack(i2c_bus_device *dev)
{
 if(dev->type==I2C_SW)
 {
  dev->sw.GPIO_PinCtl(PIN_SDA,PIN_LOW);

  dev->sw.GPIO_PinCtl(PIN_SCL,PIN_HIGHT);
  dev->sw.delay_us(dev->sw.ClkCycle);
  dev->sw.GPIO_PinCtl(PIN_SCL,PIN_LOW);
  dev->sw.delay_us(dev->sw.ClkCycle);
  dev->sw.GPIO_PinCtl(PIN_SDA,PIN_HIGHT);
 }else
 {
  dev->hw.I2C_Ack();
 }
}
# 226 "../drv/i2c_bus_device.c"
void i2c_bus_device_NAck(i2c_bus_device *dev)
{
 if(dev->type==I2C_SW)
 {
  dev->sw.GPIO_PinCtl(PIN_SDA,PIN_HIGHT);

  dev->sw.GPIO_PinCtl(PIN_SCL,PIN_HIGHT);
  dev->sw.delay_us(dev->sw.ClkCycle);
  dev->sw.GPIO_PinCtl(PIN_SCL,PIN_LOW);
  dev->sw.delay_us(dev->sw.ClkCycle);
 }else
 {
  dev->hw.I2C_NAck();
 }
}
# 249 "../drv/i2c_bus_device.c"
uint8_t i2c_bus_device_CheckDevice(i2c_bus_device *dev,uint8_t _Address)
{
 uint8_t ucAck=0;
    if(dev->sw.use_mutex)
    {
        dev->sw.lock(dev->sw.mutex_id);
    }
 if (dev->sw.GPIO_Read(PIN_SDA) && dev->sw.GPIO_Read(PIN_SCL))
 {
  i2c_bus_device_Start(dev);


  i2c_bus_device_SendByte(dev,(_Address<<1) | 0);
  ucAck = i2c_bus_device_WaitAck(dev);

  i2c_bus_device_Stop(dev);
        if(dev->sw.use_mutex)
        {
            dev->sw.unlock(dev->sw.mutex_id);
        }
  return ucAck;
 }
    i2c_bus_device_Stop(dev);
    if(dev->sw.use_mutex)
    {
        dev->sw.unlock(dev->sw.mutex_id);
    }
 return 1;
}



uint8_t i2c_bus_device_Read(i2c_bus_device *dev,uint8_t dev_addr,uint16_t reg_addr,uint8_t reg_addr_size,uint8_t *buf,uint8_t len)
{
    uint8_t ucAck=0;
    if(dev->sw.use_mutex)
    {
        dev->sw.lock(dev->sw.mutex_id);
    }
    if(reg_addr_size)
    {
        i2c_bus_device_Start(dev);

        i2c_bus_device_SendByte(dev,(dev_addr<<1) | 0);

        if(i2c_bus_device_WaitAck(dev))
        {
            ucAck=1;
            goto I2C_END;
        }


        if(reg_addr_size==2)
        {
            i2c_bus_device_SendByte(dev,(uint8_t)(reg_addr>>8));
            i2c_bus_device_WaitAck(dev);
        }

        i2c_bus_device_SendByte(dev,(uint8_t)reg_addr);
        if(i2c_bus_device_WaitAck(dev))
        {
            ucAck=2;
            goto I2C_END;
        }
    }
     i2c_bus_device_Start(dev);


    i2c_bus_device_SendByte(dev,(dev_addr<<1) | 1);

    if(i2c_bus_device_WaitAck(dev))
    {
        ucAck=3;
        goto I2C_END;
    }

    for(;len!=1;len--)
    {
        *buf++=i2c_bus_device_ReadByte(dev);
        i2c_bus_device_Ack(dev);
    }

    *buf=i2c_bus_device_ReadByte(dev);
    i2c_bus_device_NAck(dev);


I2C_END:

    i2c_bus_device_Stop(dev);
    if(dev->sw.use_mutex)
    {
        dev->sw.unlock(dev->sw.mutex_id);
    }
    return ucAck;

}

uint8_t i2c_bus_device_Write(i2c_bus_device *dev,uint8_t dev_addr,uint16_t reg_addr,uint8_t reg_addr_size,uint8_t *buf,uint8_t len)
{
    uint8_t ucAck=0;
    if(dev->sw.use_mutex)
    {
        dev->sw.lock(dev->sw.mutex_id);
    }
    i2c_bus_device_Start(dev);

    i2c_bus_device_SendByte(dev,(dev_addr<<1) | 0);

    if(i2c_bus_device_WaitAck(dev))
    {
        ucAck=1;
        goto I2C_END;
    }
    if(reg_addr_size)
    {
        if(reg_addr_size==2)
        {
            i2c_bus_device_SendByte(dev,(uint8_t)(reg_addr>>8));
            i2c_bus_device_WaitAck(dev);
        }

        i2c_bus_device_SendByte(dev,(uint8_t)reg_addr);
        if(i2c_bus_device_WaitAck(dev))
        {
            ucAck=2;
            goto I2C_END;
        }
    }
    for(;len!=0;len--)
    {
        i2c_bus_device_SendByte(dev,*buf++);
        i2c_bus_device_Ack(dev);
    }

 I2C_END:

    i2c_bus_device_Stop(dev);
    if(dev->sw.use_mutex)
    {
        dev->sw.unlock(dev->sw.mutex_id);
    }
    return ucAck;

}
