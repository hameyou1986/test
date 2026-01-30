#include "fm411_driver.h"
#include <stdio.h>
#include <string.h>
//#include "misc.h"


extern void delay_ms( uint32_t count );

//uint8_t FlagFirstFrame = OFF;			//卡片首帧标识
//uint8_t irq_data_in = 0;		//非接数据接收终端标识
//uint8_t irq_rxdone = 0;
//uint8_t irq_txdone = 0;

typedef enum {
    FAIL	= 0U,
    SUCCESS = !FAIL
} ErrorStatus;


uint8_t dev_fm11_init(device_fm11_t *dev)
{
    int32_t ret= 0;
    uint8_t r_buf[16]={0};
    //		uint8_t w_buf[4] = {0x90, 0x80,0x01, 0xEE};
    uint8_t w_buf[4] = {0x90, 0x80,0x11, 0xFE};  //FM11082C V03
    uint32_t nread;

    ret = dev_fm11_ReadE2(dev,r_buf, FM11_UID_ADDR, 16, &nread);
    if(ret != !SUCCESS)
        return ret;
    if(r_buf[7]==0x10)
    {//FM11NT082D
        ret = dev_fm11_WriteE2(dev,FM11_EE_USER_CFG, 4, w_buf);
        if(ret != !SUCCESS)
        return ret;
        dev_fm11_WriteReg(dev,FM11_REG_RF_TXEN,0x77);//让切换模式字立马生效
        dev_fm11_WriteReg(dev,FM11_REG_RESET_SILENCE,0x55);//让切换模式字立马生效
        dev->delay_us(2500);//很重要，复位时间,必须保留
        ret = dev_fm11_ReadE2(dev,r_buf, FM11_EE_USER_CFG, 4, &nread);
    }
    return SUCCESS;
}





uint8_t dev_fm11_sEE_WritePage(device_fm11_t *dev, uint8_t *pBuffer, uint16_t WriteAddr, uint8_t NumByteToWrite)
{
	uint8_t ret = 0;   
    ret = i2c_bus_device_Write(dev->i2c_bus,dev->addr,WriteAddr,2,pBuffer,NumByteToWrite);
	return ret;
}

/**
  * @brief  Writes more than one byte to the EEPROM with a single WRITE cycle.
  * @note   The number of byte can't exceed the EEPROM page size.
  * @param  pBuffer : pointer to the buffer containing the data to be written to 
  *         the EEPROM.
  * @param  WriteAddr : EEPROM's internal address to write to.
  * @param  NumByteToWrite : variable holding number of bytes to 
  *         written to the EEPROM. 
  * @retval bool --zhangpei
  */
uint8_t sEE_WritePage(uint8_t *pBuffer, uint16_t WriteAddr, uint8_t NumByteToWrite)
{
	int32_t ret = 0;
	uint32_t nwriten = 0; 
	uint8_t addr[2+ NumByteToWrite];
	addr[0] = WriteAddr >> 8;
	addr[1] = WriteAddr & 0xFF;
	memcpy(addr+2, pBuffer, NumByteToWrite);
	//ret = I2C_master_write(FM11_I2C_ADDR, addr, 2+ NumByteToWrite, &nwriten, 0);
//	delay_ms(1);
	//delay_us(500);
	return ret;
}


uint8_t dev_fm11_ReadE2(device_fm11_t *dev,uint8_t *pBuffer, uint16_t ReadAddr, uint16_t NumByteToRead, uint32_t* nread)
{
	uint8_t ret = 0;
	
	//__disable_irq();
	//FM11_CS_ON;
    dev->fm11_csn_ctl(1);
	//delay_ms(1);
	//delay_us(1);
	//sys_delay_ms(1);
	//ret = I2C_master_write(FM11_I2C_ADDR, addr, 2, nread, 0);
    ret = i2c_bus_device_Read(dev->i2c_bus,dev->addr,ReadAddr,2,pBuffer,NumByteToRead);
    *nread = NumByteToRead;
    
	//ret = I2C_master_read(FM11_I2C_ADDR,  pBuffer, NumByteToRead, nread, 0);
    dev->fm11_csn_ctl(0);
  return ret;
}


uint8_t dev_fm11_WriteE2(device_fm11_t *dev, uint16_t adr,uint32_t len,uint8_t *wbuf)
{
    uint8_t ret = 0;
    uint8_t offset;
    // 	FM11_WriteE2Enable();
    //FM11_CS_ON;
    dev->fm11_csn_ctl(1);
    //delay_ms(1);
    dev->delay_us(500);
    //sys_delay_ms(1);
    if(adr < FM11_E2_USER_ADDR || adr >= FM11_E2_MANUF_ADDR)
    return 1;
    if(adr % FM11_E2_BLOCK_SIZE)
    {
        offset = FM11_E2_BLOCK_SIZE - (adr % FM11_E2_BLOCK_SIZE);
        if(len > offset)
        {
            ret = dev_fm11_sEE_WritePage(dev,wbuf,adr,offset);
            if(ret != 0)
            return ret;
            adr += offset;
            wbuf += offset;
            len -= offset;
        }
        else
        {
            ret = dev_fm11_sEE_WritePage(dev,wbuf,adr,len);
            if(ret != 0)
            return ret;
            len = 0;
        }
    }
    while(len)
    {
        if(len >= FM11_E2_BLOCK_SIZE)
        {
            ret = dev_fm11_sEE_WritePage(dev,wbuf,adr,FM11_E2_BLOCK_SIZE);
            if(ret != 0)
            return ret;
            adr += FM11_E2_BLOCK_SIZE;
            wbuf += FM11_E2_BLOCK_SIZE;
            len -= FM11_E2_BLOCK_SIZE;
        }
        else
        {
            ret = dev_fm11_sEE_WritePage(dev,wbuf,adr,len);
            if(ret != 0)
            return ret;
            len = 0;
        }
    }
    dev->fm11_csn_ctl(0);
    return ret;
}

uint8_t dev_fm11_ReadReg(device_fm11_t *dev,uint16_t addr)
{
	uint8_t reg_val;
	uint32_t  nread;
    if(!dev_fm11_ReadE2(dev, &reg_val, addr, 1, &nread)) 
	{	
	  return reg_val;
	}
    else 
	   return 0xFF;
}


uint8_t dev_fm11_WriteReg(device_fm11_t *dev,uint16_t addr, uint8_t data)
{
	return dev_fm11_sEE_WritePage(dev,&data, addr, 1);
}
uint8_t dev_fm11_WriteFIFO(device_fm11_t *dev,uint8_t *pbuf, uint8_t NumByteToWrite)
{
	return dev_fm11_sEE_WritePage(dev,pbuf, FM11_REG_FIFO_ACCESS, NumByteToWrite);

}


uint8_t dev_fm11_get_irq(device_fm11_t *dev,uint16_t irq_reg)
{
	return dev_fm11_ReadReg(dev, irq_reg);
    
}


uint8_t dev_fm11_irq_procee(device_fm11_t *dev,uint8_t irq_status)
{
	uint8_t ret = 0;
	//SEGGER_RTT_printf(0, "irq_status:%02X.\r\n",irq_status);
	if(irq_status & MAIN_IRQ_RF_PWON)    dev_fm11_WriteReg(dev,FM11_REG_RF_CFG, 0x01);//由软件处理halt
	if(irq_status & MAIN_IRQ_RX_START)	  dev->irq_data_in = 1;
	if(irq_status & MAIN_IRQ_RX_DONE)	  dev->irq_rxdone = 1;
	if(irq_status & MAIN_IRQ_TX_DONE)     dev->irq_txdone = 1;
	if(irq_status & MAIN_IRQ_ACTIVE)		  dev_fm11_WriteReg(dev,FM11_REG_RF_CFG, 0x01);
	if(irq_status & MAIN_IRQ_FIFO)
	{
		dev_fm11_ReadReg(dev,FM11_REG_FIFO_IRQ);	//读剩余中断寄存器，保证中断拉高	
	}
	if(irq_status & MAIN_IRQ_AUX)	
	{
		
		ret = dev_fm11_ReadReg(dev,FM11_REG_AUX_IRQ);
		//SEGGER_RTT_printf(0, "FM11_REG_AUX_IRQ:%02X.\r\n",ret);
		if(ret & 0x04)//必须加这个，目前手机发完数据后会紧接着HALT+SELECT,紧接着发3000    3000进不了fifo，会让手机认为没回发导致断场，所以这边强制复位一下。
		{
		dev_fm11_WriteReg(dev,FM11_REG_RF_TXEN,0x77);//让切换模式字立马生效
		dev_fm11_WriteReg(dev,FM11_REG_RESET_SILENCE,0x55);//让切换模式字立马生效
		dev->delay_us(1500);//很重要，复位时间
		}
	}
	return SUCCESS;
}
// Read FM327 FIFO
uint8_t dev_fm11_ReadFIFO(device_fm11_t *dev,uint8_t NumByteToRead,uint8_t *pbuf)
{
	uint32_t  nread;
  if(dev_fm11_ReadE2(dev,pbuf, FM11_REG_FIFO_ACCESS, NumByteToRead, &nread))
		return SUCCESS;
  else 
		return FAIL;
}

/*********************************************************************************************************
** 函数名称:	FM11_RFDataRx  中断方式，需要连接IRQ
** 函数功能:	写FIFO
** 输入参数:    rbuf:读取数据
** 输出参数:    无
** 返回值:      读取的数据长度
*********************************************************************************************************/
uint32_t dev_fm11_RFDataRx(device_fm11_t *dev,uint8_t *rbuf)
{
  uint32_t rlen,temp;
	rlen = 0;
	temp = 0;
	do
	{	
		if((dev_fm11_ReadReg(dev,FM11_REG_FIFO_WORD_CNT) & 0x3F )>=24)	//查fifo是否到24字节
		{
			dev_fm11_ReadFIFO(dev,24,&rbuf[rlen]);		//渐满之后读取24字节			
			rlen += 24;
		}
//		if( ( (FM11_ReadReg(FM11_REG_FIFO_WORD_CNT) & 0x3F ) ==0 )&&(rlen==0) && (irq_rxdone == 0))
        if( ( ( dev_fm11_ReadReg(dev,FM11_REG_FIFO_WORD_CNT) & 0x3F ) ==0 )&&(rlen == 0))				
		{
            dev->irq_rxdone = 0;			
			return 0;
		}
	}while(dev->irq_rxdone == 0);

	dev->irq_rxdone = 0;


	temp =(uint32_t)( dev_fm11_ReadReg(dev,FM11_REG_FIFO_WORD_CNT) & 0x3F);	//接收完全之后，查fifo有多少字节

	dev_fm11_ReadFIFO(dev,temp,&rbuf[rlen]);		//读最后的数据
	rlen += temp;
//	{
//	int i = 0;
//	SEGGER_RTT_printf(0, "receive cmd: ");
//	for(;i<rlen-1;i++)
//	{
//		SEGGER_RTT_printf(0, "%02X ",rbuf[i]);
//	}
//	SEGGER_RTT_printf(0, "%02X\n",rbuf[i]);
//	}
	if(rlen <= 2)			return 0;
	rlen -= 2;	//2字节crc校验
	return rlen;
}
/*********************************************************************************************************
** 函数名称:	FM11_RFDataTx
** 函数功能:	RF数据回发
** 输入参数:    ilen:回发数据长度
** 					*ibuf:回发的数据
** 输出参数:    无
** 返回值:      无
*********************************************************************************************************/
void dev_fm11_RFDataTx(device_fm11_t *dev,uint32_t ilen,uint8_t *ibuf)
{
	uint32_t slen;
	uint8_t *sbuf;
	
	slen = ilen;
	sbuf = ibuf;
{
	
//	int i = 0;
//	SEGGER_RTT_printf(0, "TX: ");
//	for(;i<ilen;i++)
//		SEGGER_RTT_printf(0, "%02X ",ibuf[i]);
//	SEGGER_RTT_printf(0, " TXEND \r\n");
}
    
	if(slen <= 32)
	{
		dev_fm11_WriteFIFO(dev,sbuf,slen);		//write fifo	有多少发多少
		slen = 0;
	}
	else
	{
		dev_fm11_WriteFIFO(dev,sbuf,32);			//write fifo	先发32字节进fifo
		
		slen -= 32;		//待发长度－32
		sbuf += 32;		//待发数据指针+32
	}
	
	dev_fm11_WriteReg(dev,FM11_REG_RF_TXEN,0x55);	//写0x55时触发非接触口回发数据

	while(slen>0)
	{		
		if((dev_fm11_ReadReg(dev,FM11_REG_FIFO_WORD_CNT) & 0x3F )<=8)
		{
			if(slen<=24)
			{
				dev_fm11_WriteFIFO(dev,sbuf,slen);			//write fifo	先发32字节进fifo
				slen = 0;				
			}
			else
			{
				dev_fm11_WriteFIFO(dev,sbuf,24);			//write fifo	先发32字节进fifo
				
				slen -= 24; 	//待发长度－24
				sbuf += 24; 	//待发数据指针+24
			}
		}
		
		dev_fm11_WriteReg(dev,FM11_REG_RF_TXEN,0x55);	//写0x55时触发非接触口回发数据
	}
	dev->irq_txdone = 0;
}
