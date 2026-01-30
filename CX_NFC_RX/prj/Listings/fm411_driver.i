# 1 "../drv/fm411_driver.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 358 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "../drv/fm411_driver.c" 2
# 1 "../drv/fm411_driver.h" 1


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
# 4 "../drv/fm411_driver.h" 2
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
# 5 "../drv/fm411_driver.h" 2
# 69 "../drv/fm411_driver.h"
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
# 2 "../drv/fm411_driver.c" 2
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
# 3 "../drv/fm411_driver.c" 2
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
# 4 "../drv/fm411_driver.c" 2



extern void delay_ms( uint32_t count );






typedef enum {
    FAIL = 0U,
    SUCCESS = !FAIL
} ErrorStatus;


uint8_t dev_fm11_init(device_fm11_t *dev)
{
    int32_t ret= 0;
    uint8_t r_buf[16]={0};

    uint8_t w_buf[4] = {0x90, 0x80,0x11, 0xFE};
    uint32_t nread;

    ret = dev_fm11_ReadE2(dev,r_buf, (0x00), 16, &nread);
    if(ret != !SUCCESS)
        return ret;
    if(r_buf[7]==0x10)
    {
        ret = dev_fm11_WriteE2(dev,(0x0390), 4, w_buf);
        if(ret != !SUCCESS)
        return ret;
        dev_fm11_WriteReg(dev,(0xFFF4),0x77);
        dev_fm11_WriteReg(dev,(0xFFE6),0x55);
        dev->delay_us(2500);
        ret = dev_fm11_ReadE2(dev,r_buf, (0x0390), 4, &nread);
    }
    return SUCCESS;
}





uint8_t dev_fm11_sEE_WritePage(device_fm11_t *dev, uint8_t *pBuffer, uint16_t WriteAddr, uint8_t NumByteToWrite)
{
 uint8_t ret = 0;
    ret = i2c_bus_device_Write(dev->i2c_bus,dev->addr,WriteAddr,2,pBuffer,NumByteToWrite);
 return ret;
}
# 65 "../drv/fm411_driver.c"
uint8_t sEE_WritePage(uint8_t *pBuffer, uint16_t WriteAddr, uint8_t NumByteToWrite)
{
 int32_t ret = 0;
 uint32_t nwriten = 0;
 uint8_t addr[2+ NumByteToWrite];
 addr[0] = WriteAddr >> 8;
 addr[1] = WriteAddr & 0xFF;
 memcpy(addr+2, pBuffer, NumByteToWrite);



 return ret;
}


uint8_t dev_fm11_ReadE2(device_fm11_t *dev,uint8_t *pBuffer, uint16_t ReadAddr, uint16_t NumByteToRead, uint32_t* nread)
{
 uint8_t ret = 0;



    dev->fm11_csn_ctl(1);




    ret = i2c_bus_device_Read(dev->i2c_bus,dev->addr,ReadAddr,2,pBuffer,NumByteToRead);
    *nread = NumByteToRead;


    dev->fm11_csn_ctl(0);
  return ret;
}


uint8_t dev_fm11_WriteE2(device_fm11_t *dev, uint16_t adr,uint32_t len,uint8_t *wbuf)
{
    uint8_t ret = 0;
    uint8_t offset;


    dev->fm11_csn_ctl(1);

    dev->delay_us(500);

    if(adr < ((0x0010)) || adr >= (0x03FF))
    return 1;
    if(adr % (16))
    {
        offset = (16) - (adr % (16));
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
        if(len >= (16))
        {
            ret = dev_fm11_sEE_WritePage(dev,wbuf,adr,(16));
            if(ret != 0)
            return ret;
            adr += (16);
            wbuf += (16);
            len -= (16);
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
 uint32_t nread;
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
 return dev_fm11_sEE_WritePage(dev,pbuf, (0xFFF0), NumByteToWrite);

}


uint8_t dev_fm11_get_irq(device_fm11_t *dev,uint16_t irq_reg)
{
 return dev_fm11_ReadReg(dev, irq_reg);

}


uint8_t dev_fm11_irq_procee(device_fm11_t *dev,uint8_t irq_status)
{
 uint8_t ret = 0;

 if(irq_status & 0x80) dev_fm11_WriteReg(dev,(0xFFF5), 0x01);
 if(irq_status & 0x20) dev->irq_data_in = 1;
 if(irq_status & 0x10) dev->irq_rxdone = 1;
 if(irq_status & 0x08) dev->irq_txdone = 1;
 if(irq_status & 0x40) dev_fm11_WriteReg(dev,(0xFFF5), 0x01);
 if(irq_status & 0x02)
 {
  dev_fm11_ReadReg(dev,(0xFFF8));
 }
 if(irq_status & 0x01)
 {

  ret = dev_fm11_ReadReg(dev,(0xFFF9));

  if(ret & 0x04)
  {
  dev_fm11_WriteReg(dev,(0xFFF4),0x77);
  dev_fm11_WriteReg(dev,(0xFFE6),0x55);
  dev->delay_us(1500);
  }
 }
 return SUCCESS;
}

uint8_t dev_fm11_ReadFIFO(device_fm11_t *dev,uint8_t NumByteToRead,uint8_t *pbuf)
{
 uint32_t nread;
  if(dev_fm11_ReadE2(dev,pbuf, (0xFFF0), NumByteToRead, &nread))
  return SUCCESS;
  else
  return FAIL;
}
# 230 "../drv/fm411_driver.c"
uint32_t dev_fm11_RFDataRx(device_fm11_t *dev,uint8_t *rbuf)
{
  uint32_t rlen,temp;
 rlen = 0;
 temp = 0;
 do
 {
  if((dev_fm11_ReadReg(dev,(0xFFF2)) & 0x3F )>=24)
  {
   dev_fm11_ReadFIFO(dev,24,&rbuf[rlen]);
   rlen += 24;
  }

        if( ( ( dev_fm11_ReadReg(dev,(0xFFF2)) & 0x3F ) ==0 )&&(rlen == 0))
  {
            dev->irq_rxdone = 0;
   return 0;
  }
 }while(dev->irq_rxdone == 0);

 dev->irq_rxdone = 0;


 temp =(uint32_t)( dev_fm11_ReadReg(dev,(0xFFF2)) & 0x3F);

 dev_fm11_ReadFIFO(dev,temp,&rbuf[rlen]);
 rlen += temp;
# 266 "../drv/fm411_driver.c"
 if(rlen <= 2) return 0;
 rlen -= 2;
 return rlen;
}
# 278 "../drv/fm411_driver.c"
void dev_fm11_RFDataTx(device_fm11_t *dev,uint32_t ilen,uint8_t *ibuf)
{
 uint32_t slen;
 uint8_t *sbuf;

 slen = ilen;
 sbuf = ibuf;
{






}

 if(slen <= 32)
 {
  dev_fm11_WriteFIFO(dev,sbuf,slen);
  slen = 0;
 }
 else
 {
  dev_fm11_WriteFIFO(dev,sbuf,32);

  slen -= 32;
  sbuf += 32;
 }

 dev_fm11_WriteReg(dev,(0xFFF4),0x55);

 while(slen>0)
 {
  if((dev_fm11_ReadReg(dev,(0xFFF2)) & 0x3F )<=8)
  {
   if(slen<=24)
   {
    dev_fm11_WriteFIFO(dev,sbuf,slen);
    slen = 0;
   }
   else
   {
    dev_fm11_WriteFIFO(dev,sbuf,24);

    slen -= 24;
    sbuf += 24;
   }
  }

  dev_fm11_WriteReg(dev,(0xFFF4),0x55);
 }
 dev->irq_txdone = 0;
}
