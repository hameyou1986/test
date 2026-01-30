#include "i2c_bus_device.h"


#define I2C_WR	0		/* 写控制bit */
#define I2C_RD	1		/* 读控制bit */


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


/*
*********************************************************************************************************
*	函 数 名: DRV_I2C_Start
*	功能说明: CPU发起I2C总线启动信号
*	形    参:  无
*	返 回 值: 无
*********************************************************************************************************
*/
void i2c_bus_device_Start(i2c_bus_device *dev)
{
	if(dev->type==I2C_SW)
	{
		/* 当SCL高电平时，SDA出现一个下降沿表示I2C总线启动信号 */
		dev->sw.GPIO_PinCtl(PIN_SDA,PIN_HIGHT);
		dev->sw.GPIO_PinCtl(PIN_SCL,PIN_HIGHT);
		
		dev->sw.delay_us(dev->sw.ClkCycle);	

		dev->sw.GPIO_PinCtl(PIN_SDA,PIN_LOW);
		dev->sw.delay_us(dev->sw.ClkCycle);
		
//		dev->sw.GPIO_PinCtl(PIN_SCL,PIN_LOW);
//		dev->sw.delay_us(dev->sw.ClkCycle);
//		//释放总线 
//		dev->sw.GPIO_PinCtl(PIN_SDA,PIN_HIGHT); 
	}else
	{
		dev->hw.I2C_Start();
	}  	
}

/*
*********************************************************************************************************
*	函 数 名: DRV_I2C_Stop
*	功能说明: CPU发起I2C总线停止信号
*	形    参:  无
*	返 回 值: 无
*********************************************************************************************************
*/
void i2c_bus_device_Stop(i2c_bus_device *dev)
{
	if(dev->type==I2C_SW)
	{
		/* 当SCL高电平时，SDA出现一个上跳沿表示I2C总线停止信号 */
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

/*
*********************************************************************************************************
*	函 数 名: i2c_SendByte
*	功能说明: CPU向I2C总线设备发送8bit数据
*	形    参:  _ucByte ： 等待发送的字节
*	返 回 值: 无
*********************************************************************************************************
*/
void i2c_bus_device_SendByte(i2c_bus_device *dev,uint8_t ucByte)
{
	uint8_t i;
	if(dev->type==I2C_SW)
	{
		/* 先发送字节的高位bit7 */        
		for (i = 0; i < 8; i++)
		{		
			dev->sw.GPIO_PinCtl(PIN_SCL,PIN_LOW);
            //写入数据到总线            
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
			//dev->sw.GPIO_PinCtl(PIN_SCL,PIN_LOW);
			ucByte <<= 1;	/* 左移一个bit */
		}
        dev->sw.GPIO_PinCtl(PIN_SCL,PIN_LOW);
		dev->sw.GPIO_PinCtl(PIN_SDA,PIN_HIGHT); // 释放总线
	}else
	{
		dev->hw.I2C_SendByte(ucByte);		
	}
}

/*
*********************************************************************************************************
*	函 数 名: i2c_ReadByte
*	功能说明: CPU从I2C总线设备读取8bit数据
*	形    参:  无
*	返 回 值: 读到的数据
*********************************************************************************************************
*/
uint8_t i2c_bus_device_ReadByte(i2c_bus_device *dev)
{
	uint8_t i;
	uint8_t value = 0;
	if(dev->type==I2C_SW)
	{
		/* 读到第1个bit为数据的bit7 */
		for (i = 0; i < 8; i++)
		{
			value <<= 1;
			dev->sw.GPIO_PinCtl(PIN_SCL,PIN_HIGHT);
			dev->sw.delay_us(dev->sw.ClkCycle);
			if(dev->sw.GPIO_PinDirSet!=0)
			{
				dev->sw.GPIO_PinDirSet(PIN_SDA,PIN_INPUT);			
			}
			//切换方向，非必须
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

/*
*********************************************************************************************************
*	函 数 名: i2c_WaitAck
*	功能说明: CPU产生一个时钟，并读取器件的ACK应答信号
*	形    参:  无
*	返 回 值: 返回0表示正确应答，1表示无器件响应
*********************************************************************************************************
*/
uint8_t i2c_bus_device_WaitAck(i2c_bus_device *dev)
{
	uint8_t ack;
	if(dev->type==I2C_SW)
	{
		//dev->sw.delay_us(dev->sw.ClkCycle); //延时一个时钟
        //dev->sw.GPIO_PinCtl(PIN_SDA,PIN_HIGHT);//释放总线
		if(dev->sw.GPIO_PinDirSet!=0)
		{
			dev->sw.GPIO_PinDirSet(PIN_SDA,PIN_INPUT);			
		}
		dev->sw.GPIO_PinCtl(PIN_SCL,PIN_HIGHT);	/* CPU驱动SCL = 1, 此时器件会返回ACK应答 */
		dev->sw.delay_us(dev->sw.ClkCycle);
		if (dev->sw.GPIO_Read(PIN_SDA))	/* CPU读取SDA口线状态 */
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

/*
*********************************************************************************************************
*	函 数 名: i2c_Ack
*	功能说明: CPU产生一个ACK信号
*	形    参:  无
*	返 回 值: 无
*********************************************************************************************************
*/
void i2c_bus_device_Ack(i2c_bus_device *dev)
{
	if(dev->type==I2C_SW)
	{
		dev->sw.GPIO_PinCtl(PIN_SDA,PIN_LOW);	/* CPU驱动SDA = 0 */
		//dev->sw.delay_us(dev->sw.ClkCycle);
		dev->sw.GPIO_PinCtl(PIN_SCL,PIN_HIGHT);	/* CPU产生1个时钟 */
		dev->sw.delay_us(dev->sw.ClkCycle);
		dev->sw.GPIO_PinCtl(PIN_SCL,PIN_LOW);
		dev->sw.delay_us(dev->sw.ClkCycle);
		dev->sw.GPIO_PinCtl(PIN_SDA,PIN_HIGHT);	/* CPU释放SDA总线 */
	}else
	{
		dev->hw.I2C_Ack();		
	}
}

/*
*********************************************************************************************************
*	函 数 名: i2c_NAck
*	功能说明: CPU产生1个NACK信号
*	形    参:  无
*	返 回 值: 无
*********************************************************************************************************
*/
void i2c_bus_device_NAck(i2c_bus_device *dev)
{
	if(dev->type==I2C_SW)
	{
		dev->sw.GPIO_PinCtl(PIN_SDA,PIN_HIGHT);	/* CPU驱动SDA = 1 */
		//dev->sw.delay_us(dev->sw.ClkCycle);
		dev->sw.GPIO_PinCtl(PIN_SCL,PIN_HIGHT);	/* CPU产生1个时钟 */
		dev->sw.delay_us(dev->sw.ClkCycle);
		dev->sw.GPIO_PinCtl(PIN_SCL,PIN_LOW);
		dev->sw.delay_us(dev->sw.ClkCycle);
	}else
	{
		dev->hw.I2C_NAck();		
	}
}
/*
*********************************************************************************************************
*	函 数 名: i2c_CheckDevice
*	功能说明: 检测I2C总线设备，CPU向发送设备地址，然后读取设备应答来判断该设备是否存在
*	形    参:  _Address：设备的I2C总线地址
*	返 回 值: 返回值 0 表示正确， 返回1表示未探测到
*********************************************************************************************************
*/
uint8_t i2c_bus_device_CheckDevice(i2c_bus_device *dev,uint8_t _Address)
{
	uint8_t ucAck=0;
    if(dev->sw.use_mutex)
    {
        dev->sw.lock(dev->sw.mutex_id);
    }
	if (dev->sw.GPIO_Read(PIN_SDA) && dev->sw.GPIO_Read(PIN_SCL))
	{
		i2c_bus_device_Start(dev);		/* 发送启动信号 */

		/* 发送设备地址+读写控制bit（0 = w， 1 = r) bit7 先传 */
		i2c_bus_device_SendByte(dev,(_Address<<1) | I2C_WR);
		ucAck = i2c_bus_device_WaitAck(dev);	/* 检测设备的ACK应答 */

		i2c_bus_device_Stop(dev);			/* 发送停止信号 */
        if(dev->sw.use_mutex)
        {
            dev->sw.unlock(dev->sw.mutex_id);
        }
		return ucAck;
	}
    i2c_bus_device_Stop(dev);			/* 发送停止信号 */
    if(dev->sw.use_mutex)
    {
        dev->sw.unlock(dev->sw.mutex_id);
    }    
	return 1;	/* I2C总线异常 */
}



uint8_t i2c_bus_device_Read(i2c_bus_device *dev,uint8_t dev_addr,uint16_t reg_addr,uint8_t reg_addr_size,uint8_t *buf,uint8_t len)
{
    uint8_t ucAck=0;
    if(dev->sw.use_mutex)
    {
        dev->sw.lock(dev->sw.mutex_id);
    }    
    if(reg_addr_size) //内部地址为0，无需发送
    {
        i2c_bus_device_Start(dev);			/* 发送启动信号 */
        /* 发送设备地址+读写控制bit（0 = w， 1 = r) bit7 先传 */
        i2c_bus_device_SendByte(dev,(dev_addr<<1) | I2C_WR);
        
        if(i2c_bus_device_WaitAck(dev))	/* 检测设备的ACK应答 */
        {
            ucAck=1;
            goto I2C_END;
        }
        

        if(reg_addr_size==2)
        {
            i2c_bus_device_SendByte(dev,(uint8_t)(reg_addr>>8));
            i2c_bus_device_WaitAck(dev);	/* 检测设备的ACK应答 */  
        }
        
        i2c_bus_device_SendByte(dev,(uint8_t)reg_addr);
        if(i2c_bus_device_WaitAck(dev))	/* 检测设备的ACK应答 */
        {
            ucAck=2;
            goto I2C_END;
        }
    }
     i2c_bus_device_Start(dev);			/* 发送启动信号 */
     
     /* 发送设备地址+读写控制bit（0 = w， 1 = r) bit7 先传 */
    i2c_bus_device_SendByte(dev,(dev_addr<<1) | I2C_RD); 
    
    if(i2c_bus_device_WaitAck(dev))	/* 检测设备的ACK应答 */
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
    
    i2c_bus_device_Stop(dev);			/* 发送停止信号 */
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
    i2c_bus_device_Start(dev);			/* 发送启动信号 */
    /* 发送设备地址+读写控制bit（0 = w， 1 = r) bit7 先传 */
    i2c_bus_device_SendByte(dev,(dev_addr<<1) | I2C_WR);
    
    if(i2c_bus_device_WaitAck(dev))	/* 检测设备的ACK应答 */
    {
        ucAck=1;
        goto I2C_END;
    }
    if(reg_addr_size)
    {
        if(reg_addr_size==2)
        {
            i2c_bus_device_SendByte(dev,(uint8_t)(reg_addr>>8));
            i2c_bus_device_WaitAck(dev);	/* 检测设备的ACK应答 */  
        }
        
        i2c_bus_device_SendByte(dev,(uint8_t)reg_addr);
        if(i2c_bus_device_WaitAck(dev))	/* 检测设备的ACK应答 */
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
    
    i2c_bus_device_Stop(dev);			/* 发送停止信号 */
    if(dev->sw.use_mutex)
    {
        dev->sw.unlock(dev->sw.mutex_id);
    } 
    return ucAck;    
       
}
