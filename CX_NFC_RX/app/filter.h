#ifndef _FILTER_H_
#define _FILTER_H_

#include <stdint.h>


#define FILTER_SIZE 16 

typedef struct
{
    uint32_t buf[FILTER_SIZE];
    uint8_t  index;
    uint32_t sum;
}avg16_filter_t;


void avg16_filter_init(avg16_filter_t *f);

uint32_t avg16_filter_update(avg16_filter_t *f, uint32_t input);

#endif