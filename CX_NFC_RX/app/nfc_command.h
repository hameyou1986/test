#ifndef NFC_COMMAND_H
#define  NFC_COMMAND_H
#include "fm411_driver.h"
#include <stdio.h>
#include <string.h>
typedef struct transmit_struct_t{
	uint8_t  cla;
	uint8_t  ins;
	uint8_t  p1;
	uint8_t  p2;
	uint32_t p3;
	uint8_t* ibuf;
	uint32_t ilen;
	uint8_t* obuf;
	uint32_t olen;
}TRANSMIT_STRUCT;
#define APDU_HEADER_SZ         (5)
typedef enum {
	SW_AVAILABLE				=0x6100,
	SW_EOD						=0x6282,	// Unused
	SW_VERIFCATION_FAILED		=0x6300,	// Unused
	SW_FILE_FILLED				=0x6381,	// Unused
	SW_COUNTER					=0x63C0,
	SW_CHANGE_MEMORY_ERROR		=0x6581,	// Unused
	SW_WRONG_LEN				=0x6700,
	SW_INVALID_STATE			=0x6901,	
	SW_INCOMPATIBLE_FILE		=0x6981,
	SW_ACCESS_DENIED			=0x6982,
	SW_AUTH_BLOCKED				=0x6983,
	SW_REF_DATA_INVALID			=0x6984,
	SW_WRONG_CONDITION			=0x6985,
	SW_NOT_ALLOWED				=0x6986,
	SW_WRONG_DATA				=0x6A80,
	SW_NOT_SUPPORTED			=0x6A81,	// Unused
	SW_FILE_NOT_FOUND			=0x6A82,
	SW_RECORD_NOT_FOUND			=0x6A83,
	SW_FILE_TO_SHORT			=0x6A84,
	SW_WRONG_P1P2				=0x6A86,
	SW_LC_INCONSISTEND_WITH_P1P2=0x6A87,	// Unused
	SW_REF_DATA_NOT_FOUND		=0x6A88,
	SW_FILE_EXISTS				=0x6A89,
	SW_WRONG_REFERENCE			=0x6B00,
	SW_WRONG_LE					=0x6C00,
	SW_WRONG_INS				=0x6D00,
	SW_WRONG_CLA				=0x6E00,
	SW_OTHER					=0x6F00,
	
	SW_ERASE_FLASH_ERROR 		=(SW_OTHER+1),
	SW_WRITE_FLASH_ERROR 		=(SW_OTHER+2),
	SW_CRC_CHECK_ERROR   		=(SW_OTHER+3),

	SW_OK						=0x9000,
	SW_MAC_INVALID				=0x9302,
	SW_APP_LOCKED				=0x9303,
	SW_NO_MONEY					=0x9401,
	SW_NO_MAC					=0x9406,
} SW_t;

#define JE(x, y, sw)    do { \
                            if ((x) == (y)) \
                                return (sw); \
                        } while (0);
#define JNE(x, y, sw)   do { \
                            if ((x) != (y)) \
                                return (sw); \
                        } while (0);
#define JNE2(x, v1, v2, sw) \
                        do { \
                            if (((x) != (v1)) && ((x) != (v2))) \
                                return (sw);\
                        } while (0);
#define JL(x, y, sw)    do { \
                            if ((x) < (y)) \
                                return (sw); \
                        } while (0);
#define JG(x, y, sw)    do { \
                            if ((x) > (y)) \
                                return (sw); \
                        } while (0);
#define JR(x, v1, v2, sw) \
                        do { \
                            if (((v1) <= (x)) && ((x) <= (v2))) \
                                return (sw);\
                        } while (0);
#define JR2(x, v1, v2, sw) \
                        do { \
                            if (((v1) > (x)) || ((x) > (v2))) \
                                return (sw);\
                        } while (0);
												
void table_init(void);
void prog_task(device_fm11_t *dev);
void cmd_process(device_fm11_t *dev,TRANSMIT_STRUCT *tcb);
void CONFIG_RESPSW(uint8_t* resp,uint16_t rlen);
void CONFIG_SW(uint16_t sw);
#endif// NFC_COMMAND_H
