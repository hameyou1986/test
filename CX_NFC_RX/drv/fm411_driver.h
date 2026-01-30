#ifndef FM11_DRIVER_H
#define FM11_DRIVER_H
#include "stdint.h"
#include "i2c_bus_device.h"

#define OFF 0
#define ON  1
//extern uint8_t irq_data_in;
//extern uint8_t irq_rxdone;
//extern uint8_t irq_txdone;



#define FM11_I2C_ADDR							(0x57)

/* FM11 reg for I2C */
#define FM11_REG_USER_CFG0							(0xFFE0)
#define FM11_REG_USER_CFG1							(0xFFE1)
#define FM11_REG_USER_CFG2							(0xFFE2)
#define FM11_REG_RESET_SILENCE					(0xFFE6)
#define FM11_REG_STATUS								(0xFFE7)
#define FM11_REG_VOUT_EN								(0xFFE9)
#define FM11_REG_VOUT_RES							(0xFFEA)
#define FM11_REG_FIFO_ACCESS						(0xFFF0)
#define FM11_REG_FIFO_CLR							(0xFFF1)
#define FM11_REG_FIFO_WORD_CNT					(0xFFF2)
#define FM11_REG_RF_STATUS							(0xFFF3)
#define FM11_REG_RF_TXEN								(0xFFF4)
#define FM11_REG_RF_CFG								(0xFFF5)
#define FM11_REG_RF_RATS								(0xFFF6)
#define FM11_REG_MAIN_IRQ							(0xFFF7)
#define FM11_REG_FIFO_IRQ							(0xFFF8)
#define FM11_REG_AUX_IRQ								(0xFFF9)
#define FM11_REG_MAIN_IRQ_MASK					(0xFFFA)
#define FM11_REG_FIFO_IRQ_MASK					(0xFFFB)
#define FM11_REG_AUX_IRQ_MASK					(0xFFFC)
/* FM11 EE for I2C */
#define FM11_EE_SN											(0x0000)
#define FM11_EE_CC											(0x000C)
#define FM11_EE_UD											(0x0010)
#define FM11_EE_USER_CFG								(0x0390)
#define FM11_EE_PICC										(0x03A0)
#define FM11_EE_ATS_TL									(0x03B0)
#define FM11_EE_ATS_T0									(0x03B1)
#define FM11_EE_VOUT_RES								(0x03B2)
#define FM11_EE_I2C_ADDR								(0x03B3)
#define FM11_EE_ATS_TA									(0x03B4)
#define FM11_EE_ATS_TB									(0x03B5)
#define FM11_EE_ATS_TC									(0x03B6)
#define FM11_EE_ATQA										(0x03BC)

#define FM11_UID_ADDR									(0x00)
#define MAIN_IRQ_RF_PWON 0x80 
#define MAIN_IRQ_ACTIVE 0x40
#define MAIN_IRQ_RX_START 0x20
#define MAIN_IRQ_RX_DONE 0x10
#define MAIN_IRQ_TX_DONE 0x08
#define MAIN_IRQ_ARBIT 0x04
#define MAIN_IRQ_FIFO 0x02
#define MAIN_IRQ_AUX 0x01
#define FIFO_IRQ_WL 0x08


#define  FM11_E2_BLOCK_SIZE  (16)
#define  FM11_E2_USER_ADDR   (FM11_EE_UD)
#define  FM11_E2_MANUF_ADDR  (0x03FF)


typedef struct{
    uint8_t FlagFirstFrame;
    uint8_t irq_data_in;
    uint8_t irq_rxdone;
    uint8_t irq_txdone;
    void (*fm11_csn_ctl)(uint8_t);
    void (*delay_us)(uint16_t);
    i2c_bus_device *i2c_bus;
    uint8_t addr;
    uint8_t uid[16];    
}device_fm11_t; 


uint8_t dev_fm11_init(device_fm11_t *dev);
//uint8_t sEE_WritePage(uint8_t *pBuffer, uint16_t WriteAddr, uint8_t NumByteToWrite);
//uint8_t FM11_WriteE2(uint16_t adr,uint32_t len,uint8_t *wbuf);
uint8_t dev_fm11_WriteE2(device_fm11_t *dev, uint16_t adr,uint32_t len,uint8_t *wbuf);
//uint8_t FM11_ReadE2(uint8_t *pBuffer, uint16_t ReadAddr, uint16_t NumByteToRead, uint32_t* nread);
uint8_t dev_fm11_ReadE2(device_fm11_t *dev,uint8_t *pBuffer, uint16_t ReadAddr, uint16_t NumByteToRead, uint32_t* nread);

//uint8_t FM11_ReadReg(uint16_t addr);
//uint8_t FM11_WriteReg(uint16_t addr, uint8_t data);

uint8_t dev_fm11_WriteReg(device_fm11_t *dev,uint16_t addr, uint8_t data);
uint8_t dev_fm11_ReadReg(device_fm11_t *dev,uint16_t addr);

uint8_t dev_fm11_WriteFIFO(device_fm11_t *dev,uint8_t *pbuf, uint8_t NumByteToWrite);
//uint8_t fm411_get_irq(uint16_t irq_reg);
uint8_t dev_fm11_get_irq(device_fm11_t *dev,uint16_t irq_reg);
//uint8_t fm411_irq_procee(uint8_t irq_status);
uint8_t dev_fm11_irq_procee(device_fm11_t *dev,uint8_t irq_status);

//uint32_t FM11_RFDataRx(uint8_t *rbuf);
uint32_t dev_fm11_RFDataRx(device_fm11_t *dev,uint8_t *rbuf);
//void FM11_RFDataTx(uint32_t ilen,uint8_t *ibuf);
void dev_fm11_RFDataTx(device_fm11_t *dev,uint32_t ilen,uint8_t *ibuf);
//void delay_us( uint32_t count );
#endif //FM11_DRIVER_H
