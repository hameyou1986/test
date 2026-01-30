#include <stdint.h>

/* =========================
 *  定点与常量定义
 * ========================= */
#define Q16_ONE        (1 << 16)
#define LN2_Q16        45426          // ln(2) * 65536

/* =========================
 *  HNS NTC 规格参数
 * ========================= */
#define HNS_R200_OHM   1104           // R200 = 1.104kΩ
#define HNS_B_Q16      (4570 << 16)   // B100/200 = 4570
#define HNS_T200_Q16   ((int32_t)(473.15 * 65536.0))  // 200℃ = 473.15K

/* =========================
 *  ADC & 分压参数（按硬件改）
 * ========================= */
#define ADC_MAX        4095            // 12-bit ADC
#define R_PULL_OHM     2200            // 上拉电阻 2.2kΩ
                                     // NTC 接地

/* ============================================================
 *  ln(x) 定点近似
 *  输入 / 输出：Q16.16
 * ============================================================ */
static int32_t ln_q16(int32_t x_q16)
{
    int32_t k = 0;

    // 归一化到 [1,2)
    while (x_q16 >= (2 << 16)) {
        x_q16 >>= 1;
        k++;
    }
    while (x_q16 < (1 << 16)) {
        x_q16 <<= 1;
        k--;
    }

    // y = m - 1
    int32_t y  = x_q16 - (1 << 16);
    int32_t y2 = (int64_t)y * y >> 16;
    int32_t y3 = (int64_t)y2 * y >> 16;

    // ln(m) ≈ y - y?/2 + y?/3
    int32_t ln_m = y - (y2 >> 1) + (y3 / 3);

    return ln_m + k * LN2_Q16;
}

/* ============================================================
 *  ADC → NTC 电阻 (Ω)
 * ============================================================ */
uint32_t adc_to_ntc_resistance(uint16_t adc)
{
    if (adc == 0 || adc >= ADC_MAX) {
        return 0xFFFFFFFF; // 异常保护
    }

    return (uint32_t)((int64_t)R_PULL_OHM * adc / (ADC_MAX - adc));
}

/* ============================================================
 *  HNS NTC → 温度计算
 *  输入：Rt (Ω)
 *  输出：温度（℃，int16）
 * ============================================================ */
int16_t hns_ntc_get_temp_c(uint32_t Rt_ohm)
{
    int32_t x_q16;
    int32_t ln_x;
    int32_t inv_T_q16;
    int32_t T_q16;

    // x = Rt / R200
    x_q16 = ((int64_t)Rt_ohm << 16) / HNS_R200_OHM;

    // ln(Rt / R200)
    ln_x = ln_q16(x_q16);

    // ln(x) / B
    inv_T_q16 = (int64_t)ln_x << 16 / HNS_B_Q16;

    // + 1 / T200
    inv_T_q16 += ((int64_t)Q16_ONE << 16) / HNS_T200_Q16;

    // T = 1 / inv_T
    T_q16 = ((int64_t)Q16_ONE << 16) / inv_T_q16;

    // K → ℃
    return (T_q16 - (int32_t)(273.15 * 65536.0)) >> 16;
}


#define R_PULL 4700UL  // 上拉电阻

// 这里 VREFINT_mV 是芯片内部基准电压（固定值），只用于比值计算
#define VREFINT_mV 1200UL

// adc_ntc: NTC ADC 采样
// adc_vref: 内部参考 ADC 采样
uint32_t ntc_calc_resistance(uint16_t adc_ntc)
{   
    if(adc_ntc == 4095) adc_ntc = 4094;
    return (uint32_t)(adc_ntc*4700 / (4095-adc_ntc));

}
// uint32_t ntc_calc_resistance(uint16_t adc_ntc, uint16_t adc_ref)
// {
//     if (adc_ntc >= adc_ref - 1) return 0xFFFFFFFF; // 防溢出

//     // Rntc = Rref * ADC_ntc / (ADC_ref - ADC_ntc)
//     return (4700UL * adc_ntc) / (adc_ref - adc_ntc);
// }

///* ============================================================
// *  一步到位接口（最常用）
// * ============================================================ */
//int16_t hns_ntc_get_temp_from_adc(uint32_t Rt)
//{
//    return hns_ntc_get_temp_c(Rt);
//}


