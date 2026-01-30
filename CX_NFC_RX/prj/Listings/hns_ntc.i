# 1 "../app/hns_ntc.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 358 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "../app/hns_ntc.c" 2
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
# 2 "../app/hns_ntc.c" 2
# 27 "../app/hns_ntc.c"
static int32_t ln_q16(int32_t x_q16)
{
    int32_t k = 0;


    while (x_q16 >= (2 << 16)) {
        x_q16 >>= 1;
        k++;
    }
    while (x_q16 < (1 << 16)) {
        x_q16 <<= 1;
        k--;
    }


    int32_t y = x_q16 - (1 << 16);
    int32_t y2 = (int64_t)y * y >> 16;
    int32_t y3 = (int64_t)y2 * y >> 16;


    int32_t ln_m = y - (y2 >> 1) + (y3 / 3);

    return ln_m + k * 45426;
}




uint32_t adc_to_ntc_resistance(uint16_t adc)
{
    if (adc == 0 || adc >= 4095) {
        return 0xFFFFFFFF;
    }

    return (uint32_t)((int64_t)2200 * adc / (4095 - adc));
}






int16_t hns_ntc_get_temp_c(uint32_t Rt_ohm)
{
    int32_t x_q16;
    int32_t ln_x;
    int32_t inv_T_q16;
    int32_t T_q16;


    x_q16 = ((int64_t)Rt_ohm << 16) / 1104;


    ln_x = ln_q16(x_q16);


    inv_T_q16 = (int64_t)ln_x << 16 / (4570 << 16);


    inv_T_q16 += ((int64_t)(1 << 16) << 16) / ((int32_t)(473.15 * 65536.0));


    T_q16 = ((int64_t)(1 << 16) << 16) / inv_T_q16;


    return (T_q16 - (int32_t)(273.15 * 65536.0)) >> 16;
}
# 103 "../app/hns_ntc.c"
uint32_t ntc_calc_resistance(uint16_t adc_ntc)
{
    if(adc_ntc == 4095) adc_ntc = 4094;
    return (uint32_t)(adc_ntc*4700 / (4095-adc_ntc));

}
