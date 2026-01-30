#include "gd32c2x1.h"
#include "bsp_adc.h"
#include "filter.h"

#include "hns_ntc.h"



__IO uint32_t res_value[2];
float temperature;
float vref_value;

/* configure RCU peripheral */
void rcu_config(void);
/* configure ADC peripheral */
void adc_config(void);
/* ADC channel sample */
void adc_channel_sample(void);


/*!
    \brief      configure RCU peripheral
    \param[in]  none
    \param[out] none
    \retval     none
*/
void rcu_config(void)
{
    /* enable ADC clock */
    rcu_periph_clock_enable(RCU_ADC);
    /* config ADC clock */
    rcu_adc_clock_config(RCU_ADCSRC_CKSYS, RCU_ADCCK_DIV256);
}

/*!
    \brief      configure the ADC peripheral
    \param[in]  none
    \param[out] none
    \retval     none
*/

void adc_gpio_config(void)
{
    rcu_periph_clock_enable(RCU_GPIOA);
    
    gpio_mode_set(GPIOA, GPIO_MODE_ANALOG, GPIO_PUPD_NONE, GPIO_PIN_0);
    gpio_mode_set(GPIOA, GPIO_MODE_ANALOG, GPIO_PUPD_NONE, GPIO_PIN_1);
}
void adc_config(void)
{
    /* ADC continuous function enable */
    adc_special_function_config(ADC_CONTINUOUS_MODE, DISABLE);
    /* ADC scan function enable */
    adc_special_function_config(ADC_SCAN_MODE, ENABLE);
    /* ADC data alignment config */
    adc_data_alignment_config(ADC_DATAALIGN_RIGHT);
    /* ADC channel length config */
    adc_channel_length_config(ADC_INSERTED_CHANNEL, 2);

    /* ADC inserted channel config */
    //adc_inserted_channel_config(0U, ADC_CHANNEL_14, ADC_SAMPLETIME_160POINT5);
    adc_inserted_channel_config(0U, ADC_CHANNEL_0, ADC_SAMPLETIME_160POINT5);
    adc_inserted_channel_config(1U, ADC_CHANNEL_1, ADC_SAMPLETIME_160POINT5);

    /* ADC trigger config */
    adc_external_trigger_source_config(ADC_INSERTED_CHANNEL, ADC_EXTTRIG_INSERTED_NONE); 
    adc_external_trigger_config(ADC_INSERTED_CHANNEL, ENABLE);

    /* ADC temperature and Vrefint enable */
    adc_internal_channel_config(ADC_CHANNEL_INTERNAL_TEMPSENSOR, ENABLE);
    adc_internal_channel_config(ADC_CHANNEL_INTERNAL_VREFINT, ENABLE);

    /* enable ADC interface */
    adc_enable();
}

avg16_filter_t avg16_filter1,avg16_filter2;


/*!
    \brief      ADC channel sample
    \param[in]  none
    \param[out] none
    \retval     none
*/
void adc_channel_sample(void)
{
    uint16_t value[3];
    /* ADC software trigger enable */
    adc_software_trigger_enable(ADC_INSERTED_CHANNEL);

    /* wait for the end of conversion flag */
    while( (adc_flag_get(ADC_FLAG_EOIC) == RESET) || (adc_flag_get(ADC_FLAG_EOC) == RESET) );

    /* read ADC inserted data register:IDATA0 IDATA1 */
    value[0]=adc_inserted_data_read(ADC_INSERTED_CHANNEL_0);
    value[1]=adc_inserted_data_read(ADC_INSERTED_CHANNEL_1);
    //value[2]=adc_inserted_data_read(ADC_INSERTED_CHANNEL_2);
    
    /* clear the end of conversion flag */
    adc_flag_clear(ADC_FLAG_EOIC);
    adc_flag_clear(ADC_FLAG_EOC);
    
    uint32_t res1 = ntc_calc_resistance(value[0]);
    uint32_t res2 = ntc_calc_resistance(value[1]);
    
    //res_value[0]=avg16_filter_update(&avg16_filter1,res1);
    res_value[0]=hns_ntc_get_temp_c(avg16_filter_update(&avg16_filter1,res1));
    //res_value[1]=avg16_filter_update(&avg16_filter2,res2);
    
}

void adc_init(void)
{
    rcu_config();
    adc_gpio_config();
    adc_config();
    avg16_filter_init(&avg16_filter1);
    avg16_filter_init(&avg16_filter2);    
}