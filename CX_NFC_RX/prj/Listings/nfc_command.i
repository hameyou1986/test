# 1 "../app/nfc_command.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 358 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "../app/nfc_command.c" 2
# 1 "../app/nfc_command.h" 1


# 1 "../drv\\fm411_driver.h" 1


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
# 4 "../drv\\fm411_driver.h" 2
# 1 "../drv/i2c_bus_device.h" 1





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
# 5 "../drv\\fm411_driver.h" 2
# 69 "../drv\\fm411_driver.h"
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


uint8_t dev_fm11_WriteE2(device_fm11_t *dev, uint16_t adr,uint32_t len,uint8_t *wbuf);

uint8_t dev_fm11_ReadE2(device_fm11_t *dev,uint8_t *pBuffer, uint16_t ReadAddr, uint16_t NumByteToRead, uint32_t* nread);




uint8_t dev_fm11_WriteReg(device_fm11_t *dev,uint16_t addr, uint8_t data);
uint8_t dev_fm11_ReadReg(device_fm11_t *dev,uint16_t addr);

uint8_t dev_fm11_WriteFIFO(device_fm11_t *dev,uint8_t *pbuf, uint8_t NumByteToWrite);

uint8_t dev_fm11_get_irq(device_fm11_t *dev,uint16_t irq_reg);

uint8_t dev_fm11_irq_procee(device_fm11_t *dev,uint8_t irq_status);


uint32_t dev_fm11_RFDataRx(device_fm11_t *dev,uint8_t *rbuf);

void dev_fm11_RFDataTx(device_fm11_t *dev,uint32_t ilen,uint8_t *ibuf);
# 4 "../app/nfc_command.h" 2
# 1 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 1 3
# 53 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    typedef unsigned int size_t;
# 68 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    typedef __builtin_va_list __va_list;
# 87 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
typedef struct __fpos_t_struct {
    unsigned long long int __pos;





    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
# 108 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
typedef struct __FILE FILE;
# 119 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
struct __FILE {
    union {
        long __FILE_alignment;



        char __FILE_size[84];

    } __FILE_opaque;
};
# 138 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;
# 224 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int remove(const char * ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) int rename(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 243 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) FILE *tmpfile(void);






extern __attribute__((__nothrow__)) char *tmpnam(char * );
# 265 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fclose(FILE * ) __attribute__((__nonnull__(1)));
# 275 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fflush(FILE * );
# 285 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) FILE *fopen(const char * __restrict ,
                           const char * __restrict ) __attribute__((__nonnull__(1,2)));
# 329 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) FILE *freopen(const char * __restrict ,
                    const char * __restrict ,
                    FILE * __restrict ) __attribute__((__nonnull__(2,3)));
# 342 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) void setbuf(FILE * __restrict ,
                    char * __restrict ) __attribute__((__nonnull__(1)));






extern __attribute__((__nothrow__)) int setvbuf(FILE * __restrict ,
                   char * __restrict ,
                   int , size_t ) __attribute__((__nonnull__(1)));
# 370 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((__nothrow__)) int fprintf(FILE * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 393 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((__nothrow__)) int _fprintf(FILE * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));





#pragma __printf_args
extern __attribute__((__nothrow__)) int printf(const char * __restrict , ...) __attribute__((__nonnull__(1)));






#pragma __printf_args
extern __attribute__((__nothrow__)) int _printf(const char * __restrict , ...) __attribute__((__nonnull__(1)));





#pragma __printf_args
extern __attribute__((__nothrow__)) int sprintf(char * __restrict , const char * __restrict , ...) __attribute__((__nonnull__(1,2)));








#pragma __printf_args
extern __attribute__((__nothrow__)) int _sprintf(char * __restrict , const char * __restrict , ...) __attribute__((__nonnull__(1,2)));






#pragma __printf_args
extern __attribute__((__nothrow__)) int __ARM_snprintf(char * __restrict , size_t ,
                     const char * __restrict , ...) __attribute__((__nonnull__(3)));


#pragma __printf_args
extern __attribute__((__nothrow__)) int snprintf(char * __restrict , size_t ,
                     const char * __restrict , ...) __attribute__((__nonnull__(3)));
# 460 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((__nothrow__)) int _snprintf(char * __restrict , size_t ,
                      const char * __restrict , ...) __attribute__((__nonnull__(3)));





#pragma __scanf_args
extern __attribute__((__nothrow__)) int fscanf(FILE * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 503 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __scanf_args
extern __attribute__((__nothrow__)) int _fscanf(FILE * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));





#pragma __scanf_args
extern __attribute__((__nothrow__)) int scanf(const char * __restrict , ...) __attribute__((__nonnull__(1)));








#pragma __scanf_args
extern __attribute__((__nothrow__)) int _scanf(const char * __restrict , ...) __attribute__((__nonnull__(1)));





#pragma __scanf_args
extern __attribute__((__nothrow__)) int sscanf(const char * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 541 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __scanf_args
extern __attribute__((__nothrow__)) int _sscanf(const char * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));







extern __attribute__((__nothrow__)) int vfscanf(FILE * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) int vscanf(const char * __restrict , __va_list) __attribute__((__nonnull__(1)));
extern __attribute__((__nothrow__)) int vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));

extern __attribute__((__nothrow__)) int _vfscanf(FILE * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) int _vscanf(const char * __restrict , __va_list) __attribute__((__nonnull__(1)));
extern __attribute__((__nothrow__)) int _vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) int __ARM_vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));

extern __attribute__((__nothrow__)) int vprintf(const char * __restrict , __va_list ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) int _vprintf(const char * __restrict , __va_list ) __attribute__((__nonnull__(1)));





extern __attribute__((__nothrow__)) int vfprintf(FILE * __restrict ,
                    const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));
# 584 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int vsprintf(char * __restrict ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));
# 594 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int __ARM_vsnprintf(char * __restrict , size_t ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));

extern __attribute__((__nothrow__)) int vsnprintf(char * __restrict , size_t ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));
# 609 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int _vsprintf(char * __restrict ,
                      const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));





extern __attribute__((__nothrow__)) int _vfprintf(FILE * __restrict ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));





extern __attribute__((__nothrow__)) int _vsnprintf(char * __restrict , size_t ,
                      const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));
# 635 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((__nothrow__)) int __ARM_asprintf(char ** , const char * __restrict , ...) __attribute__((__nonnull__(2)));
extern __attribute__((__nothrow__)) int __ARM_vasprintf(char ** , const char * __restrict , __va_list ) __attribute__((__nonnull__(2)));
# 649 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fgetc(FILE * ) __attribute__((__nonnull__(1)));
# 659 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) char *fgets(char * __restrict , int ,
                    FILE * __restrict ) __attribute__((__nonnull__(1,3)));
# 673 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fputc(int , FILE * ) __attribute__((__nonnull__(2)));
# 683 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fputs(const char * __restrict , FILE * __restrict ) __attribute__((__nonnull__(1,2)));






extern __attribute__((__nothrow__)) int getc(FILE * ) __attribute__((__nonnull__(1)));
# 704 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    extern __attribute__((__nothrow__)) int (getchar)(void);
# 713 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) char *gets(char * ) __attribute__((__nonnull__(1)));
# 725 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int putc(int , FILE * ) __attribute__((__nonnull__(2)));
# 737 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    extern __attribute__((__nothrow__)) int (putchar)(int );






extern __attribute__((__nothrow__)) int puts(const char * ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) int ungetc(int , FILE * ) __attribute__((__nonnull__(2)));
# 778 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) size_t fread(void * __restrict ,
                    size_t , size_t , FILE * __restrict ) __attribute__((__nonnull__(1,4)));
# 794 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) size_t __fread_bytes_avail(void * __restrict ,
                    size_t , FILE * __restrict ) __attribute__((__nonnull__(1,3)));
# 810 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) size_t fwrite(const void * __restrict ,
                    size_t , size_t , FILE * __restrict ) __attribute__((__nonnull__(1,4)));
# 822 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fgetpos(FILE * __restrict , fpos_t * __restrict ) __attribute__((__nonnull__(1,2)));
# 833 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fseek(FILE * , long int , int ) __attribute__((__nonnull__(1)));
# 850 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fsetpos(FILE * __restrict , const fpos_t * __restrict ) __attribute__((__nonnull__(1,2)));
# 863 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) long int ftell(FILE * ) __attribute__((__nonnull__(1)));
# 877 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) void rewind(FILE * ) __attribute__((__nonnull__(1)));
# 886 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) void clearerr(FILE * ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) int feof(FILE * ) __attribute__((__nonnull__(1)));




extern __attribute__((__nothrow__)) int ferror(FILE * ) __attribute__((__nonnull__(1)));




extern __attribute__((__nothrow__)) void perror(const char * );
# 917 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int _fisatty(FILE * ) __attribute__((__nonnull__(1)));



extern __attribute__((__nothrow__)) void __use_no_semihosting_swi(void);
extern __attribute__((__nothrow__)) void __use_no_semihosting(void);
# 5 "../app/nfc_command.h" 2
# 1 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 1 3
# 58 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) void *memcpy(void * __restrict ,
                    const void * __restrict , size_t ) __attribute__((__nonnull__(1,2)));






extern __attribute__((__nothrow__)) void *memmove(void * ,
                    const void * , size_t ) __attribute__((__nonnull__(1,2)));
# 77 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strcpy(char * __restrict , const char * __restrict ) __attribute__((__nonnull__(1,2)));






extern __attribute__((__nothrow__)) char *strncpy(char * __restrict , const char * __restrict , size_t ) __attribute__((__nonnull__(1,2)));
# 93 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strcat(char * __restrict , const char * __restrict ) __attribute__((__nonnull__(1,2)));






extern __attribute__((__nothrow__)) char *strncat(char * __restrict , const char * __restrict , size_t ) __attribute__((__nonnull__(1,2)));
# 117 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) int memcmp(const void * , const void * , size_t ) __attribute__((__nonnull__(1,2)));







extern __attribute__((__nothrow__)) int strcmp(const char * , const char * ) __attribute__((__nonnull__(1,2)));






extern __attribute__((__nothrow__)) int strncmp(const char * , const char * , size_t ) __attribute__((__nonnull__(1,2)));
# 141 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) int strcasecmp(const char * , const char * ) __attribute__((__nonnull__(1,2)));







extern __attribute__((__nothrow__)) int strncasecmp(const char * , const char * , size_t ) __attribute__((__nonnull__(1,2)));
# 158 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) int strcoll(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 169 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) size_t strxfrm(char * __restrict , const char * __restrict , size_t ) __attribute__((__nonnull__(2)));
# 193 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) void *memchr(const void * , int , size_t ) __attribute__((__nonnull__(1)));
# 209 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strchr(const char * , int ) __attribute__((__nonnull__(1)));
# 218 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) size_t strcspn(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 232 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strpbrk(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 247 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strrchr(const char * , int ) __attribute__((__nonnull__(1)));
# 257 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) size_t strspn(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 270 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strstr(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 280 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strtok(char * __restrict , const char * __restrict ) __attribute__((__nonnull__(2)));
extern __attribute__((__nothrow__)) char *_strtok_r(char * , const char * , char ** ) __attribute__((__nonnull__(2,3)));
# 321 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) void *memset(void * , int , size_t ) __attribute__((__nonnull__(1)));





extern __attribute__((__nothrow__)) char *strerror(int );







extern __attribute__((__nothrow__)) size_t strlen(const char * ) __attribute__((__nonnull__(1)));






extern __attribute__((__nothrow__)) size_t strlcpy(char * , const char * , size_t ) __attribute__((__nonnull__(1,2)));
# 362 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) size_t strlcat(char * , const char * , size_t ) __attribute__((__nonnull__(1,2)));
# 388 "D:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) void _membitcpybl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitcpybb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitcpyhl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitcpyhb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitcpywl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitcpywb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovebl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovebb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovehl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovehb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovewl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovewb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
# 6 "../app/nfc_command.h" 2
typedef struct transmit_struct_t{
 uint8_t cla;
 uint8_t ins;
 uint8_t p1;
 uint8_t p2;
 uint32_t p3;
 uint8_t* ibuf;
 uint32_t ilen;
 uint8_t* obuf;
 uint32_t olen;
}TRANSMIT_STRUCT;

typedef enum {
 SW_AVAILABLE =0x6100,
 SW_EOD =0x6282,
 SW_VERIFCATION_FAILED =0x6300,
 SW_FILE_FILLED =0x6381,
 SW_COUNTER =0x63C0,
 SW_CHANGE_MEMORY_ERROR =0x6581,
 SW_WRONG_LEN =0x6700,
 SW_INVALID_STATE =0x6901,
 SW_INCOMPATIBLE_FILE =0x6981,
 SW_ACCESS_DENIED =0x6982,
 SW_AUTH_BLOCKED =0x6983,
 SW_REF_DATA_INVALID =0x6984,
 SW_WRONG_CONDITION =0x6985,
 SW_NOT_ALLOWED =0x6986,
 SW_WRONG_DATA =0x6A80,
 SW_NOT_SUPPORTED =0x6A81,
 SW_FILE_NOT_FOUND =0x6A82,
 SW_RECORD_NOT_FOUND =0x6A83,
 SW_FILE_TO_SHORT =0x6A84,
 SW_WRONG_P1P2 =0x6A86,
 SW_LC_INCONSISTEND_WITH_P1P2=0x6A87,
 SW_REF_DATA_NOT_FOUND =0x6A88,
 SW_FILE_EXISTS =0x6A89,
 SW_WRONG_REFERENCE =0x6B00,
 SW_WRONG_LE =0x6C00,
 SW_WRONG_INS =0x6D00,
 SW_WRONG_CLA =0x6E00,
 SW_OTHER =0x6F00,

 SW_ERASE_FLASH_ERROR =(SW_OTHER+1),
 SW_WRITE_FLASH_ERROR =(SW_OTHER+2),
 SW_CRC_CHECK_ERROR =(SW_OTHER+3),

 SW_OK =0x9000,
 SW_MAC_INVALID =0x9302,
 SW_APP_LOCKED =0x9303,
 SW_NO_MONEY =0x9401,
 SW_NO_MAC =0x9406,
} SW_t;
# 91 "../app/nfc_command.h"
void table_init(void);
void prog_task(device_fm11_t *dev);
void cmd_process(device_fm11_t *dev,TRANSMIT_STRUCT *tcb);
void CONFIG_RESPSW(uint8_t* resp,uint16_t rlen);
void CONFIG_SW(uint16_t sw);
# 2 "../app/nfc_command.c" 2
# 1 "../bsp\\bsp_delay.h" 1





void delay_us(uint16_t us);

void delay_ms(uint16_t ms);
# 3 "../app/nfc_command.c" 2


uint8_t rfLen;
uint8_t engine_flag = 0;
uint8_t SWIO1 = 0;
uint8_t SWIO1_flag = 0;
int32_t RX_V;
int32_t RX_I;
int32_t RX_P;
extern void delay_1ms( uint32_t count );
static uint8_t g_buffer[512 + (5) + 2];
static uint8_t fm411_cmd[256];
TRANSMIT_STRUCT g_tcb;
uint8_t Ntag_Block[64][4]=
                 {{0x1D,0x77,0x17,0xF5},
                  {0xAF,0x64,0x00,0x00},
                  {0xCB,0xA2,0x00,0x00},
                  {0xE1,0x10,0x12,0x00},
                  {0x03,0x0F,0xD1,0x01},
                  {0x0B,0x55,0x01,0x68},
                  {0x75,0x61,0x77,0x65},
                  {0x69,0x2E,0x63,0x6F},
                  {0x6D,0xFE,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0xB1,0xB2,0xB3,0xB4},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0xC1,0xC2,0xC3,0xC4},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0x00,0x00,0x00,0x00},
                  {0xD1,0xD2,0xD3,0xD3}};

uint16_t uread2(uint8_t* src)
{
 if(!src)
  return 0;
 return ((src[0]<<8) | src[1]);
}
void uwrite2(uint8_t* src, uint16_t data)
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
void uwrite4(uint8_t* src, uint32_t data)
{
 if(!src)
  return ;
 src[0] = (data>>24);
 src[1] = (data>>16)&0xFF;
 src[2] = (data>>8)&0xFF;
 src[3] = data&0xFF;
}
# 120 "../app/nfc_command.c"
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
# 145 "../app/nfc_command.c"
int hex2bin(char* buf, uint32_t len, uint8_t* bin)
{
 char token0[] = "0123456789abcdef";
 char token1[] = "0123456789ABCDEF";
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
 g_tcb.ibuf = g_buffer + (5);
 g_tcb.obuf = g_buffer + 256 + (5);
}
extern uint32_t res_value[2];
void prog_task(device_fm11_t *dev)
{
 if(dev->irq_rxdone||dev->irq_data_in)
 {
  rfLen = dev_fm11_RFDataRx(dev,fm411_cmd);
        memcpy(fm411_cmd,(uint8_t*)res_value,4);
        dev_fm11_RFDataTx(dev,4, fm411_cmd);
# 220 "../app/nfc_command.c"
  dev->irq_data_in = 0;
 }
# 236 "../app/nfc_command.c"
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
 do { if (((tcb->p1) != (tcb->p2)) && ((tcb->p1) != (0))) return (SW_WRONG_P1P2); } while (0);;
 do { if ((tcb->p3) > (16)) return (SW_WRONG_LEN); } while (0);;
    if(rand_sz&0x03)
 {
  rand_sz += (4-rand_sz&0x03);
 }
# 288 "../app/nfc_command.c"
 tcb->olen = tcb->p3;

 return SW_OK;
}
SW_t get_adc(TRANSMIT_STRUCT* tcb)
{
 int32_t voltage_mV = 0;
 uint32_t temp_val = 0;
 uint32_t cnt=50;
 uint8_t t;
 static uint8_t dis = 0;
 do { if ((tcb->p2) != (0)) return (SW_WRONG_P1P2); } while (0);;
 do { if ((tcb->p3) != (0)) return (SW_WRONG_LE); } while (0);;





    for ( t = 0; t < cnt; t++ )
    {

    }
 voltage_mV=temp_val/cnt;
    voltage_mV = 1500 + (dis%10)*100;
    dis++;

 uwrite4(tcb->obuf, voltage_mV*3);
 RX_V=voltage_mV*3;
 tcb->olen = 4;
 return SW_OK;
}
SW_t get_adc1(TRANSMIT_STRUCT* tcb)
{
 static int32_t voltage_mV = 0;
 uint32_t temp_val = 0;
 uint32_t cnt=50;
 uint8_t t;
 static uint8_t dis = 0;
 do { if ((tcb->p2) != (0)) return (SW_WRONG_P1P2); } while (0);;
 do { if ((tcb->p3) != (0)) return (SW_WRONG_LE); } while (0);;


 for ( t = 0; t < cnt; t++ )
    {

    }
 voltage_mV=temp_val/cnt;
    voltage_mV=500+(dis%10)*100;
    dis++;

 uwrite4(tcb->obuf, voltage_mV*100/(50*18));
 RX_I=voltage_mV*100/(50*18);
 tcb->olen = 4;
 return SW_OK;
}
SW_t get_adc2(TRANSMIT_STRUCT* tcb)
{
 int32_t voltage_mV = 0;
uint32_t temp_val = 0;
 uint32_t cnt=50;
 uint8_t t;
 do { if ((tcb->p2) != (0)) return (SW_WRONG_P1P2); } while (0);;
 do { if ((tcb->p3) != (0)) return (SW_WRONG_LE); } while (0);;


 for ( t = 0; t < cnt; t++ )
    {

    }
 voltage_mV=temp_val/cnt;
    voltage_mV = 2800;

 uwrite4(tcb->obuf, voltage_mV);
 tcb->olen = 4;
 return SW_OK;
}
SW_t get_adc3(TRANSMIT_STRUCT* tcb)
{
 int32_t voltage_mV = 0;
    uint32_t temp_val = 0;
 uint32_t cnt=50;
 uint8_t t;
 do { if ((tcb->p2) != (0)) return (SW_WRONG_P1P2); } while (0);;
 do { if ((tcb->p3) != (0)) return (SW_WRONG_LE); } while (0);;


 for ( t = 0; t < cnt; t++ )
    {

    }
 voltage_mV=temp_val/cnt;
    voltage_mV = 1500;

 uwrite4(tcb->obuf, voltage_mV/100*124);
 tcb->olen = 4;
 return SW_OK;
}
void start_engine(uint16_t roll_time, uint16_t reroll_time, uint16_t stop_time)
{
 if(roll_time)
 {

  delay_ms(roll_time);

 }
 delay_ms(stop_time);
 if(reroll_time)
 {

  delay_ms(reroll_time);

 }


}
SW_t NFC_WLC(TRANSMIT_STRUCT* tcb)
{
 static uint16_t roll_time = 0, reroll_time = 0, stop_time = 0;

 do { if ((tcb->p2) != (0)) return (SW_WRONG_P1P2); } while (0);;
 switch(tcb->p1)
 {
  case 0x05:
   do { if ((tcb->p3) != (0)) return (SW_WRONG_LE); } while (0);;

    {

    }

   break;
        case 0x10:
   get_adc(tcb);
   if((RX_I)&&(RX_V))
   {

   }
   break;
  case 0x11:
   get_adc1(tcb);
    if((RX_I)&&(RX_V))
   {

   }
   break;
  case 0x12:
   get_adc2(tcb);
   break;
  case 0x13:


   get_adc3(tcb);




   break;
# 474 "../app/nfc_command.c"
  case 0x26:
   do { if ((tcb->p3) != (0)) return (SW_WRONG_LE); } while (0);;


  break;




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
     memcpy(&g_tcb, g_buffer+2, (5));
     memcpy(g_tcb.ibuf, g_buffer + 2 + (5), rfLen - (5) - 2);
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

 dev_fm11_RFDataTx(dev,tcb->olen+2, g_tcb.obuf);
}
