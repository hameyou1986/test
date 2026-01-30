#include "filter.h"


/* ??? */
void avg16_filter_init(avg16_filter_t *f)
{
    f->index = 0;
    f->sum   = 0;
    for (int i = 0; i < FILTER_SIZE; i++)
    {
        f->buf[i] = 0;
    }
}

/* ????????,???????? */
uint32_t avg16_filter_update(avg16_filter_t *f, uint32_t input)
{
    /* ??????? */
    f->sum -= f->buf[f->index];

    /* ????? */
    f->buf[f->index] = input;
    f->sum += input;

    /* ????(??) */
    f->index++;
    if (f->index >= FILTER_SIZE)
    {
        f->index = 0;
    }

    /* ???,16 = 2^4,??????? */
    return (uint32_t)(f->sum >> 4);
}
