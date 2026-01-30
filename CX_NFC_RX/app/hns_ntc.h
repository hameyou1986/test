#ifndef _HNS_NTC_H_
#define _HNS_NTC_H_


#include <stdint.h>



uint32_t ntc_calc_resistance(uint16_t adc_ntc);

int16_t hns_ntc_get_temp_c(uint32_t Rt_ohm);


#endif