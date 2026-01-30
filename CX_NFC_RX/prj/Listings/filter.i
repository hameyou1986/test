# 1 "../app/filter.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 358 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "../app/filter.c" 2
# 1 "../app/filter.h" 1



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
# 5 "../app/filter.h" 2




typedef struct
{
    uint32_t buf[16];
    uint8_t index;
    uint32_t sum;
}avg16_filter_t;


void avg16_filter_init(avg16_filter_t *f);

uint32_t avg16_filter_update(avg16_filter_t *f, uint32_t input);
# 2 "../app/filter.c" 2



void avg16_filter_init(avg16_filter_t *f)
{
    f->index = 0;
    f->sum = 0;
    for (int i = 0; i < 16; i++)
    {
        f->buf[i] = 0;
    }
}


uint32_t avg16_filter_update(avg16_filter_t *f, uint32_t input)
{

    f->sum -= f->buf[f->index];


    f->buf[f->index] = input;
    f->sum += input;


    f->index++;
    if (f->index >= 16)
    {
        f->index = 0;
    }


    return (uint32_t)(f->sum >> 4);
}
