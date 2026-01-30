#include "nfc_command.h"
#include "bsp_delay.h"
//#include "adc.h"
//#include "motor_driver.h"
uint8_t rfLen;
uint8_t engine_flag = 0;
uint8_t SWIO1 = 0;
uint8_t SWIO1_flag = 0;
int32_t RX_V;
int32_t RX_I;
int32_t RX_P;
extern void delay_1ms( uint32_t count );
static uint8_t g_buffer[512 + APDU_HEADER_SZ + 2];
static uint8_t fm411_cmd[256];
TRANSMIT_STRUCT g_tcb;
uint8_t Ntag_Block[64][4]= 
																	{{0x1D,0x77,0x17,0xF5},//Block 0
																	 {0xAF,0x64,0x00,0x00},//Block 1
																	 {0xCB,0xA2,0x00,0x00},//Block 2
																	 {0xE1,0x10,0x12,0x00},//Block 3   byte3很重要   如果是6F，nxp第二条指令就是读E0  block
																	 {0x03,0x0F,0xD1,0x01},//Block 4   
																	 {0x0B,0x55,0x01,0x68},//Block 5
																	 {0x75,0x61,0x77,0x65},//Block 6
																	 {0x69,0x2E,0x63,0x6F},//Block 7
																	 {0x6D,0xFE,0x00,0x00},//Block 8
																	 {0x00,0x00,0x00,0x00},//Block 9
																	 {0x00,0x00,0x00,0x00},//Block 10
																	 {0x00,0x00,0x00,0x00},//Block 11
																	 {0x00,0x00,0x00,0x00},//Block 12
																	 {0x00,0x00,0x00,0x00},//Block 13
																	 {0x00,0x00,0x00,0x00},//Block 14
																	 {0x00,0x00,0x00,0x00},//Block 15
																	 {0x00,0x00,0x00,0x00},//Block 16
																	 {0x00,0x00,0x00,0x00},//Block 17
																	 {0x00,0x00,0x00,0x00},//Block 18
																	 {0x00,0x00,0x00,0x00},//Block 19
																	 {0x00,0x00,0x00,0x00},//Block 20
																	 {0x00,0x00,0x00,0x00},//Block 21
																	 {0x00,0x00,0x00,0x00},//Block 22
																	 {0x00,0x00,0x00,0x00},//Block 23
																	 {0x00,0x00,0x00,0x00},//Block 24
																	 {0x00,0x00,0x00,0x00},//Block 25
																	 {0x00,0x00,0x00,0x00},//Block 26
																	 {0x00,0x00,0x00,0x00},//Block 27
																	 {0x00,0x00,0x00,0x00},//Block 28
																	 {0x00,0x00,0x00,0x00},//Block 29
																	 {0x00,0x00,0x00,0x00},//Block 30
																	 {0xB1,0xB2,0xB3,0xB4},//Block 31
																	 {0x00,0x00,0x00,0x00},//Block 32
																	 {0x00,0x00,0x00,0x00},//Block 33
																	 {0x00,0x00,0x00,0x00},//Block 34
																	 {0x00,0x00,0x00,0x00},//Block 35
																	 {0x00,0x00,0x00,0x00},//Block 36
																	 {0x00,0x00,0x00,0x00},//Block 37
																	 {0x00,0x00,0x00,0x00},//Block 38
																	 {0x00,0x00,0x00,0x00},//Block 39
																	 {0x00,0x00,0x00,0x00},//Block 40
																	 {0x00,0x00,0x00,0x00},//Block 41
																	 {0x00,0x00,0x00,0x00},//Block 42
																	 {0x00,0x00,0x00,0x00},//Block 43
																	 {0x00,0x00,0x00,0x00},//Block 44
																	 {0x00,0x00,0x00,0x00},//Block 45
																	 {0x00,0x00,0x00,0x00},//Block 46
																	 {0xC1,0xC2,0xC3,0xC4},//Block 47
																	 {0x00,0x00,0x00,0x00},//Block 48
																	 {0x00,0x00,0x00,0x00},//Block 49
																	 {0x00,0x00,0x00,0x00},//Block 50
																	 {0x00,0x00,0x00,0x00},//Block 51
																	 {0x00,0x00,0x00,0x00},//Block 52
																	 {0x00,0x00,0x00,0x00},//Block 53
																	 {0x00,0x00,0x00,0x00},//Block 54
																	 {0x00,0x00,0x00,0x00},//Block 55
																	 {0x00,0x00,0x00,0x00},//Block 56
																	 {0x00,0x00,0x00,0x00},//Block 57
																	 {0x00,0x00,0x00,0x00},//Block 58
																	 {0x00,0x00,0x00,0x00},//Block 59
																	 {0x00,0x00,0x00,0x00},//Block 60
																	 {0x00,0x00,0x00,0x00},//Block 61
																	 {0x00,0x00,0x00,0x00},//Block 62
																	 {0xD1,0xD2,0xD3,0xD3}};//Block 63

uint16_t uread2(uint8_t* src)
{
	if(!src)
		return 0;
	return ((src[0]<<8) | src[1]);
}
void  uwrite2(uint8_t* src, uint16_t data)
{
	if(!src)
		return ;
	src[0] = data>>8;
	src[1] = data&0xFF;
}
uint32_t uread4(uint8_t* src)
{
	if(!src)
		return 0;
	return ((src[0]<<24) | (src[1]<<16) | (src[2]<<8) | (src[3]));
}
void  uwrite4(uint8_t* src, uint32_t data)
{
	if(!src)
		return ;
	src[0] = (data>>24);
	src[1] = (data>>16)&0xFF;
	src[2] = (data>>8)&0xFF;
	src[3] = data&0xFF;
}

/**
	将二进制数据转换为HEX字符串

	\param bin 二进制数据输入缓冲区指针
	\param len 二进制数据长度
	\param hex 字符串接收缓冲区指针

	\return 返回HEX字符串指针
*/
char* bin2hex(uint8_t* bin, int len, char* hex)
{
	char* _hex = "0123456789ABCDEF";
	char* base = hex;
	
	while(len>0) {
		*hex++ = _hex[((*bin)>>4)&0x0F];
		*hex++ = _hex[(*bin)&0x0F];
		bin ++;
		len --;
	}
	*hex = 0;
	
	return base;
}

/**
	将hex字符串转换为二进制数据

	@param buf 输入的hex字符串
	@param len hex字符串长度
	@param bin 输出的二进制数据缓冲区指针

	@return 返回二进制数据的长度
*/
int hex2bin(char* buf, uint32_t len, uint8_t* bin)
{
	char  token0[] = "0123456789abcdef";
	char  token1[] = "0123456789ABCDEF";
	uint8_t* bp = bin;
	int i;
	
	while(len >= 2) {
		*bin = 0;
		for(i=0; i<16; i++) {
			if(*buf == token0[i] || *buf == token1[i]){
				*bin = (i<<4);
				break;
			}
		}
		buf++;
		for(i=0; i<16; i++) {
			if(*buf == token0[i] || *buf == token1[i]){
				*bin |= (i);
				break;
			}
		}
		buf++; bin++; 
		len-=2;

		if(*buf == 0) break;
	}
	
	return (bin-bp);
}
void table_init(void)
{
	g_tcb.ibuf = g_buffer + APDU_HEADER_SZ;
	g_tcb.obuf = g_buffer + 256 + APDU_HEADER_SZ;
}
extern uint32_t res_value[2];
void prog_task(device_fm11_t *dev)
{
	if(dev->irq_rxdone||dev->irq_data_in)
	{
		rfLen = dev_fm11_RFDataRx(dev,fm411_cmd);
        memcpy(fm411_cmd,(uint8_t*)res_value,4);
        dev_fm11_RFDataTx(dev,4, fm411_cmd);
//		if(fm411_cmd[0] == 0x50)
//		{
//			dev_fm11_WriteReg(dev,FM11_REG_RF_CFG, 0x02);

//		}
//		else if((fm411_cmd[0]== 0x30)&&(fm411_cmd[1]< 64)&&(rfLen < APDU_HEADER_SZ))//读块
//		{
//			uint8_t xbuf[16];
//			int offset = 0,xlen = 0;						
//			for(int block = fm411_cmd[1];block< (fm411_cmd[1]+ 4); block++)
//			{
//				if(block < 64)
//					memcpy(xbuf + (4*offset),Ntag_Block[block],4);	
//				else
//					memcpy(xbuf + (4*offset),Ntag_Block[block - 64],4);					
//				offset++;
//			}
//			xlen = 16;
//			dev_fm11_RFDataTx(dev,xlen, xbuf);
//		}

//		else if(rfLen >= APDU_HEADER_SZ)
//		{
//			//hex2bin((char*)fm411_cmd, rfLen, g_buffer);
//			memcpy(&g_tcb, fm411_cmd, APDU_HEADER_SZ);
//			memcpy(g_tcb.ibuf, fm411_cmd + APDU_HEADER_SZ, rfLen - APDU_HEADER_SZ);
//			cmd_process(dev,&g_tcb);
//		}
//		else
//		{
//			dev_fm11_RFDataTx(dev,rfLen, fm411_cmd);
//		}
		dev->irq_data_in = 0;
	}
//	if(SWIO1==1&&SWIO1_flag==0)
//	{
////		BAT_Discharging_IO_OFF;
////		LED_IO2_OFF;
//		sys_delay_ms(5);
//		LL_GPIO_SetPinMode(GPIOB, LL_GPIO_Pin0, LL_GPIO_PINxMODE_OUTPUT);     // PB0 SW_IO
//		SW_IO_L;
//		SWIO1_flag=1;
//    }
//	else if(SWIO1==0)
//	{
//		LL_GPIO_SetPinMode(GPIOB, LL_GPIO_Pin0, LL_GPIO_PINxMODE_INPUT);     // PB0 SW_IO;
//        SWIO1_flag=0;		
//	}
}
void CONFIG_RESPSW(uint8_t* resp,uint16_t rlen)
{
	g_tcb.olen = 0;
	if((resp)&&(rlen))
	{
		memcpy(g_tcb.obuf, resp, rlen);
		g_tcb.olen = rlen;
	}
}
void CONFIG_SW(uint16_t sw)
{
	uwrite2(g_tcb.obuf + g_tcb.olen, sw);
}
SW_t get_random(TRANSMIT_STRUCT* tcb)
{
	uint8_t delay_cnt = 10;
	uint16_t rand_sz = tcb->p3;
	uint16_t i = 0;
	JNE2(tcb->p1, tcb->p2, 0, SW_WRONG_P1P2);
	JG(tcb->p3, 16, SW_WRONG_LEN);
    if(rand_sz&0x03)
	{
		rand_sz += (4-rand_sz&0x03);
	}
	//RNG_init();
//	while(rand_sz > 0)
//	{
//		delay_cnt = 10;
//		while (delay_cnt-- > 0) 
//		{
//			if (LL_RNG_IsDataReady() || LL_RNG_IsActiveFlag_SFAIL()) 
//			{
//					if (LL_RNG_IsActiveFlag_SFAIL()) {
//							// 清空错误标志
//							LL_RNG_ClearFlag_SFAIL();
//							LL_RNG_GetRandomData();
//					} else {
//							break; // 获取成功
//					}
//			}
//			sys_delay_ms(1);
//		}
//		if(delay_cnt > 0)
//		{
//				uwrite4(tcb->obuf + i, LL_RNG_GetRandomData());
//				rand_sz -= 4;
//				i += 4;
//		}
//		else
//			return SW_OTHER;
//	}
	tcb->olen = tcb->p3;
	//RNG_deinit();
	return SW_OK;
}
SW_t get_adc(TRANSMIT_STRUCT* tcb)
{
	int32_t voltage_mV	= 0;
	uint32_t	temp_val = 0;
	uint32_t cnt=50;
	uint8_t		t;
	static uint8_t dis = 0;
	JNE(tcb->p2, 0, SW_WRONG_P1P2);
	JNE(tcb->p3, 0, SW_WRONG_LE);
	//adc_init();
	
	//LL_ADC_Enable( ADC );
    //LL_ADC_EnableChannel( ADC, LL_ADC_Channel_ECH8 );
	//voltage_mV = get_voltage( LL_ADC_Channel_ECH8 );
    for ( t = 0; t < cnt; t++ )
    {
        //temp_val += get_voltage( LL_ADC_Channel_ECH8 );
    }
	voltage_mV=temp_val/cnt;
    voltage_mV = 1500 + (dis%10)*100;
    dis++;
	//adc_deinit();
	uwrite4(tcb->obuf, voltage_mV*3);
	RX_V=voltage_mV*3;
	tcb->olen = 4;
	return SW_OK;
}
SW_t get_adc1(TRANSMIT_STRUCT* tcb)
{
	static int32_t voltage_mV	= 0;
	uint32_t	temp_val = 0;
	uint32_t cnt=50;
	uint8_t		t;
	static uint8_t dis = 0;
	JNE(tcb->p2, 0, SW_WRONG_P1P2);
	JNE(tcb->p3, 0, SW_WRONG_LE);
	//adc_init();
	//voltage_mV = get_voltage( LL_ADC_Channel_ECH1 );
	for ( t = 0; t < cnt; t++ )
    {
        //temp_val += get_voltage( LL_ADC_Channel_ECH1 );
    }
	voltage_mV=temp_val/cnt;
    voltage_mV=500+(dis%10)*100;
    dis++;
	//adc_deinit();
	uwrite4(tcb->obuf, voltage_mV*100/(50*18));
	RX_I=voltage_mV*100/(50*18);
	tcb->olen = 4;
	return SW_OK;
}
SW_t get_adc2(TRANSMIT_STRUCT* tcb)
{
	int32_t voltage_mV	= 0;
uint32_t	temp_val = 0;
	uint32_t cnt=50;
	uint8_t		t;
	JNE(tcb->p2, 0, SW_WRONG_P1P2);
	JNE(tcb->p3, 0, SW_WRONG_LE);
	//adc_init();
	//voltage_mV = get_voltage( LL_ADC_Channel_ECH4 );
	for ( t = 0; t < cnt; t++ )
    {
        //temp_val += get_voltage( LL_ADC_Channel_ECH4 );
    }
	voltage_mV=temp_val/cnt;
    voltage_mV = 2800;
	//adc_deinit();
	uwrite4(tcb->obuf, voltage_mV);
	tcb->olen = 4;
	return SW_OK;
}
SW_t get_adc3(TRANSMIT_STRUCT* tcb)
{
	int32_t voltage_mV	= 0;
    uint32_t	temp_val = 0;
	uint32_t cnt=50;
	uint8_t		t;
	JNE(tcb->p2, 0, SW_WRONG_P1P2);
	JNE(tcb->p3, 0, SW_WRONG_LE);
	//adc_init();
	//voltage_mV = get_voltage( LL_ADC_Channel_ECH11 );
	for ( t = 0; t < cnt; t++ )
    {
        //temp_val += get_voltage( LL_ADC_Channel_ECH11 );
    }
	voltage_mV=temp_val/cnt;
    voltage_mV = 1500;
	//adc_deinit();
	uwrite4(tcb->obuf, voltage_mV/100*124);
	tcb->olen = 4;
	return SW_OK;
}
void start_engine(uint16_t roll_time, uint16_t reroll_time, uint16_t stop_time)
{
	if(roll_time)
	{
		//MOTOR_ROLL_START;
		delay_ms(roll_time);
		//MOTOR_ROLL_STOP;
	}
	delay_ms(stop_time);
	if(reroll_time)
	{
		//MOTOR_REROLL_START;
		delay_ms(reroll_time);
		//MOTOR_REROLL_STOP;
	}
	//MOTOR_IO1_OFF;
	//MOTOR_IO2_OFF;
}
SW_t NFC_WLC(TRANSMIT_STRUCT* tcb)
{
	static uint16_t roll_time = 0, reroll_time = 0, stop_time = 0;
//	static char input = 1;
	JNE(tcb->p2, 0, SW_WRONG_P1P2);
	switch(tcb->p1)
	{
		case 0x05://
			JNE(tcb->p3, 0, SW_WRONG_LE);
		    //if(LL_GPIO_IsInputPinSet( GPIOC, LL_GPIO_Pin10 )==0)
			 {
			     //return SW_WRONG_CONDITION;
			 }
			 
			break;
        case 0x10://
			get_adc(tcb);
			if((RX_I)&&(RX_V))
			{
				//led_blink(RX_I * RX_V);
			}
			break;
		case 0x11://
			get_adc1(tcb);
		  if((RX_I)&&(RX_V))
			{
				//led_blink(RX_I * RX_V);
			}
			break;
		case 0x12://
			get_adc2(tcb);
			break;
		case 0x13://
			//LL_GPIO_SetPinMode(ADCVBAT_EN_PORT, ADCVBAT_EN_PIN, LL_GPIO_PINxMODE_OUTPUT);
		
			get_adc3(tcb);
		
		    //LL_GPIO_SetPinMode(ADCVBAT_EN_PORT, ADCVBAT_EN_PIN, LL_GPIO_PINxMODE_INPUT);     // PB07 ADCVBAT_EN_IO
	        //LL_GPIO_EnablePinOpenDrain(ADCVBAT_EN_PORT, ADCVBAT_EN_PIN); // Enable open-drain
	        //LL_GPIO_EnablePinPullUp(ADCVBAT_EN_PORT, ADCVBAT_EN_PIN);
			break;
//		case 0x20://配置电机正转、停止、反转时间
//			JNE(tcb->p3, 6, SW_WRONG_LE);
//		    roll_time = uread2(tcb->ibuf);
////			reroll_time = uread2(tcb->ibuf+2);
////			stop_time = uread2(tcb->ibuf+4);
//		    stop_time = uread2(tcb->ibuf+2);        //与文档一致 
//			reroll_time = uread2(tcb->ibuf+4);      //与文档一致
//			break;
//		case 0x21:
//			JNE(tcb->p3, 0, SW_WRONG_LE);
//		    start_engine(roll_time, reroll_time, stop_time);
//		break;
//		case 0x22://pull up IO1
//			JNE(tcb->p3, 0, SW_WRONG_LE);
////			MOTOR_IO1_ON;
//		    SWIO1 = 1; 
//		break;
//		case 0x23://pull down IO1
//			JNE(tcb->p3, 0, SW_WRONG_LE);
//			MOTOR_IO1_OFF;
//		    SWIO1 = 0; 
//		break;
//		case 0x24://pull up IO2
//			JNE(tcb->p3, 0, SW_WRONG_LE);
//			MOTOR_IO2_ON;
//		break;
//		case 0x25://pull down IO2
//			JNE(tcb->p3, 0, SW_WRONG_LE);
//			MOTOR_IO2_OFF;
//		break;
		case 0x26://pull up IO2
			JNE(tcb->p3, 0, SW_WRONG_LE);
		    //LL_GPIO_SetPinMode( SC_IO_PORT, SC_IO_PIN, LL_GPIO_PINxMODE_OUTPUT );
			//SC_IO_ON;
		break;
//		case 0x31://engine_flag
//			JNE(tcb->p3, 0, SW_WRONG_LE);
//			engine_flag=1;
//		break;
	}
	return SW_OK;
}
void cmd_process(device_fm11_t *dev,TRANSMIT_STRUCT *tcb)
{
	uint16_t sw = 0;
	g_tcb.olen = 0;
	switch(tcb->cla)
	{
		case 0x00:
		{
			switch(tcb->ins)
			{
				case 0x00:
					memcpy(&g_tcb, g_buffer+2, APDU_HEADER_SZ);
					memcpy(g_tcb.ibuf, g_buffer + 2 + APDU_HEADER_SZ, rfLen - APDU_HEADER_SZ - 2);
					cmd_process(dev,&g_tcb);
					break;
				case 0x84:
					sw = get_random(tcb);
					break;
				case 0xA4:
					sw = get_adc(tcb);
					break;
				case 0x4A:
					sw = NFC_WLC(tcb);
					break;
				default:
					sw = (SW_WRONG_INS);
				break;
			}
		}
		break;		
		default:
			sw = (SW_WRONG_CLA);
			break;
	}
	CONFIG_SW(sw);
	//bin2hex(g_tcb.obuf, g_tcb.olen+2, (char*) fm411_cmd);
	dev_fm11_RFDataTx(dev,tcb->olen+2, g_tcb.obuf);
}
