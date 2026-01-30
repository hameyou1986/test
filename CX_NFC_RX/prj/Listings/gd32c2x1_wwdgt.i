# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Source/gd32c2x1_wwdgt.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 358 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Source/gd32c2x1_wwdgt.c" 2
# 35 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Source/gd32c2x1_wwdgt.c"
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_wwdgt.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_wwdgt.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 103 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h"
typedef enum IRQn {

    NonMaskableInt_IRQn = -14,
    HardFault_IRQn = -13,
    SVCall_IRQn = -5,
    PendSV_IRQn = -2,
    SysTick_IRQn = -1,

    WWDGT_IRQn = 0,
    TIMESTAMP_IRQn = 1,
    FMC_IRQn = 3,
    RCU_IRQn = 4,
    EXTI0_IRQn = 5,
    EXTI1_IRQn = 6,
    EXTI2_IRQn = 7,
    EXTI3_IRQn = 8,
    EXTI4_IRQn = 9,
    DMA_Channel0_IRQn = 10,
    DMA_Channel1_IRQn = 11,
    DMA_Channel2_IRQn = 12,
    ADC_IRQn = 13,
    USART0_IRQn = 14,
    USART1_IRQn = 15,
    USART2_IRQn = 16,
    I2C0_EV_IRQn = 17,
    I2C0_ER_IRQn = 18,
    I2C1_EV_IRQn = 19,
    I2C1_ER_IRQn = 20,
    SPI0_IRQn = 21,
    SPI1_IRQn = 22,
    RTC_Alarm_IRQn = 23,
    EXTI5_9_IRQn = 24,
    TIMER0_TRG_CMT_UP_BRK_IRQn = 25,
    TIMER0_Channel_IRQn = 26,
    TIMER2_IRQn = 27,
    TIMER13_IRQn = 28,
    TIMER15_IRQn = 29,
    TIMER16_IRQn = 30,
    EXTI10_15_IRQn = 31,
    DMAMUX_IRQn = 33,
    CMP0_IRQn = 34,
    CMP1_IRQn = 35,
    I2C0_WKUP_IRQn = 36,
    I2C1_WKUP_IRQn = 37,
    USART0_WKUP_IRQn = 38,
} IRQn_Type;



# 1 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 1
# 29 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3







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
# 37 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 2 3
# 65 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
# 1 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_version.h" 1 3
# 29 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_version.h" 3
# 66 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 2 3
# 117 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
# 1 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_compiler.h" 1 3
# 47 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_compiler.h" 3
# 1 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 1 3
# 31 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
# 64 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed)) T_UINT32 { uint32_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed, aligned(1))) T_UINT16_WRITE { uint16_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed, aligned(1))) T_UINT16_READ { uint16_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed, aligned(1))) T_UINT32_WRITE { uint32_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed, aligned(1))) T_UINT32_READ { uint32_t v; };
#pragma clang diagnostic pop
# 260 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __ROR(uint32_t op1, uint32_t op2)
{
  op2 %= 32U;
  if (op2 == 0U)
  {
    return op1;
  }
  return (op1 >> op2) | (op1 << (32U - op2));
}
# 295 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint8_t __CLZ(uint32_t value)
{
# 306 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
  if (value == 0U)
  {
    return 32U;
  }
  return __builtin_clz(value);
}
# 526 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline int32_t __SSAT(int32_t val, uint32_t sat)
{
  if ((sat >= 1U) && (sat <= 32U))
  {
    const int32_t max = (int32_t)((1U << (sat - 1U)) - 1U);
    const int32_t min = -1 - max ;
    if (val > max)
    {
      return max;
    }
    else if (val < min)
    {
      return min;
    }
  }
  return val;
}
# 551 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __USAT(int32_t val, uint32_t sat)
{
  if (sat <= 31U)
  {
    const uint32_t max = ((1U << sat) - 1U);
    if (val > (int32_t)max)
    {
      return max;
    }
    else if (val < 0)
    {
      return 0U;
    }
  }
  return (uint32_t)val;
}
# 584 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint8_t __LDAB(volatile uint8_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldab %0, %1" : "=r" (result) : "Q" (*ptr) : "memory" );
  return ((uint8_t) result);
}
# 599 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint16_t __LDAH(volatile uint16_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldah %0, %1" : "=r" (result) : "Q" (*ptr) : "memory" );
  return ((uint16_t) result);
}
# 614 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __LDA(volatile uint32_t *ptr)
{
  uint32_t result;

  __asm volatile ("lda %0, %1" : "=r" (result) : "Q" (*ptr) : "memory" );
  return(result);
}
# 629 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STLB(uint8_t value, volatile uint8_t *ptr)
{
  __asm volatile ("stlb %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) : "memory" );
}
# 641 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STLH(uint16_t value, volatile uint16_t *ptr)
{
  __asm volatile ("stlh %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) : "memory" );
}
# 653 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STL(uint32_t value, volatile uint32_t *ptr)
{
  __asm volatile ("stl %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) : "memory" );
}
# 737 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __enable_irq(void)
{
  __asm volatile ("cpsie i" : : : "memory");
}
# 750 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __disable_irq(void)
{
  __asm volatile ("cpsid i" : : : "memory");
}
# 762 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_CONTROL(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, control" : "=r" (result) );
  return(result);
}
# 792 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_CONTROL(uint32_t control)
{
  __asm volatile ("MSR control, %0" : : "r" (control) : "memory");
  __builtin_arm_isb(0xF);
}
# 818 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_IPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, ipsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_APSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, apsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_xPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, xpsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_PSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, psp" : "=r" (result) );
  return(result);
}
# 890 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PSP(uint32_t topOfProcStack)
{
  __asm volatile ("MSR psp, %0" : : "r" (topOfProcStack) : );
}
# 914 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_MSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, msp" : "=r" (result) );
  return(result);
}
# 944 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_MSP(uint32_t topOfMainStack)
{
  __asm volatile ("MSR msp, %0" : : "r" (topOfMainStack) : );
}
# 995 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_PRIMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, primask" : "=r" (result) );
  return(result);
}
# 1025 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PRIMASK(uint32_t priMask)
{
  __asm volatile ("MSR primask, %0" : : "r" (priMask) : "memory");
}
# 1208 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_PSPLIM(void)
{




  return 0U;





}
# 1256 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PSPLIM(uint32_t ProcStackPtrLimit)
{




  (void)ProcStackPtrLimit;



}
# 1300 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_MSPLIM(void)
{




  return 0U;





}
# 1347 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_MSPLIM(uint32_t MainStackPtrLimit)
{




  (void)MainStackPtrLimit;



}
# 48 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include/cmsis_compiler.h" 2 3
# 118 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 2 3
# 235 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
typedef union
{
  struct
  {
    uint32_t _reserved0:28;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} APSR_Type;
# 265 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:23;
  } b;
  uint32_t w;
} IPSR_Type;
# 283 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:15;
    uint32_t T:1;
    uint32_t _reserved1:3;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} xPSR_Type;
# 322 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
typedef union
{
  struct
  {
    uint32_t nPRIV:1;
    uint32_t SPSEL:1;
    uint32_t _reserved1:30;
  } b;
  uint32_t w;
} CONTROL_Type;
# 353 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
typedef struct
{
  volatile uint32_t ISER[16U];
        uint32_t RESERVED0[16U];
  volatile uint32_t ICER[16U];
        uint32_t RSERVED1[16U];
  volatile uint32_t ISPR[16U];
        uint32_t RESERVED2[16U];
  volatile uint32_t ICPR[16U];
        uint32_t RESERVED3[16U];
  volatile uint32_t IABR[16U];
        uint32_t RESERVED4[16U];
  volatile uint32_t ITNS[16U];
        uint32_t RESERVED5[16U];
  volatile uint32_t IPR[124U];
} NVIC_Type;
# 383 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
typedef struct
{
  volatile const uint32_t CPUID;
  volatile uint32_t ICSR;

  volatile uint32_t VTOR;



  volatile uint32_t AIRCR;
  volatile uint32_t SCR;
  volatile uint32_t CCR;
        uint32_t RESERVED1;
  volatile uint32_t SHPR[2U];
  volatile uint32_t SHCSR;
} SCB_Type;
# 560 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t LOAD;
  volatile uint32_t VAL;
  volatile const uint32_t CALIB;
} SysTick_Type;
# 612 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
typedef struct
{
  volatile uint32_t CTRL;
        uint32_t RESERVED0[6U];
  volatile const uint32_t PCSR;
  volatile uint32_t COMP0;
        uint32_t RESERVED1[1U];
  volatile uint32_t FUNCTION0;
        uint32_t RESERVED2[1U];
  volatile uint32_t COMP1;
        uint32_t RESERVED3[1U];
  volatile uint32_t FUNCTION1;
        uint32_t RESERVED4[1U];
  volatile uint32_t COMP2;
        uint32_t RESERVED5[1U];
  volatile uint32_t FUNCTION2;
        uint32_t RESERVED6[1U];
  volatile uint32_t COMP3;
        uint32_t RESERVED7[1U];
  volatile uint32_t FUNCTION3;
        uint32_t RESERVED8[1U];
  volatile uint32_t COMP4;
        uint32_t RESERVED9[1U];
  volatile uint32_t FUNCTION4;
        uint32_t RESERVED10[1U];
  volatile uint32_t COMP5;
        uint32_t RESERVED11[1U];
  volatile uint32_t FUNCTION5;
        uint32_t RESERVED12[1U];
  volatile uint32_t COMP6;
        uint32_t RESERVED13[1U];
  volatile uint32_t FUNCTION6;
        uint32_t RESERVED14[1U];
  volatile uint32_t COMP7;
        uint32_t RESERVED15[1U];
  volatile uint32_t FUNCTION7;
        uint32_t RESERVED16[1U];
  volatile uint32_t COMP8;
        uint32_t RESERVED17[1U];
  volatile uint32_t FUNCTION8;
        uint32_t RESERVED18[1U];
  volatile uint32_t COMP9;
        uint32_t RESERVED19[1U];
  volatile uint32_t FUNCTION9;
        uint32_t RESERVED20[1U];
  volatile uint32_t COMP10;
        uint32_t RESERVED21[1U];
  volatile uint32_t FUNCTION10;
        uint32_t RESERVED22[1U];
  volatile uint32_t COMP11;
        uint32_t RESERVED23[1U];
  volatile uint32_t FUNCTION11;
        uint32_t RESERVED24[1U];
  volatile uint32_t COMP12;
        uint32_t RESERVED25[1U];
  volatile uint32_t FUNCTION12;
        uint32_t RESERVED26[1U];
  volatile uint32_t COMP13;
        uint32_t RESERVED27[1U];
  volatile uint32_t FUNCTION13;
        uint32_t RESERVED28[1U];
  volatile uint32_t COMP14;
        uint32_t RESERVED29[1U];
  volatile uint32_t FUNCTION14;
        uint32_t RESERVED30[1U];
  volatile uint32_t COMP15;
        uint32_t RESERVED31[1U];
  volatile uint32_t FUNCTION15;
} DWT_Type;
# 727 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
typedef struct
{
  volatile const uint32_t SSPSR;
  volatile uint32_t CSPSR;
        uint32_t RESERVED0[2U];
  volatile uint32_t ACPR;
        uint32_t RESERVED1[55U];
  volatile uint32_t SPPR;
        uint32_t RESERVED2[131U];
  volatile const uint32_t FFSR;
  volatile uint32_t FFCR;
  volatile uint32_t PSCR;
        uint32_t RESERVED3[759U];
  volatile const uint32_t TRIGGER;
  volatile const uint32_t ITFTTD0;
  volatile uint32_t ITATBCTR2;
        uint32_t RESERVED4[1U];
  volatile const uint32_t ITATBCTR0;
  volatile const uint32_t ITFTTD1;
  volatile uint32_t ITCTRL;
        uint32_t RESERVED5[39U];
  volatile uint32_t CLAIMSET;
  volatile uint32_t CLAIMCLR;
        uint32_t RESERVED7[8U];
  volatile const uint32_t DEVID;
  volatile const uint32_t DEVTYPE;
} TPI_Type;
# 1066 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
typedef struct
{
  volatile uint32_t DHCSR;
  volatile uint32_t DCRSR;
  volatile uint32_t DCRDR;
  volatile uint32_t DEMCR;
        uint32_t RESERVED0[1U];
  volatile uint32_t DAUTHCTRL;
  volatile uint32_t DSCSR;
} CoreDebug_Type;
# 1167 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
typedef struct
{
  volatile uint32_t DHCSR;
  volatile uint32_t DCRSR;
  volatile uint32_t DCRDR;
  volatile uint32_t DEMCR;
        uint32_t RESERVED0[1U];
  volatile uint32_t DAUTHCTRL;
  volatile uint32_t DSCSR;
} DCB_Type;
# 1279 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
typedef struct
{
  volatile uint32_t DLAR;
  volatile const uint32_t DLSR;
  volatile const uint32_t DAUTHSTATUS;
  volatile const uint32_t DDEVARCH;
  volatile const uint32_t DDEVTYPE;
} DIB_Type;
# 1524 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline void __NVIC_EnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    __asm volatile("":::"memory");
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
    __asm volatile("":::"memory");
  }
}
# 1543 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline uint32_t __NVIC_GetEnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1562 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline void __NVIC_DisableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);
  }
}
# 1581 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline uint32_t __NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1600 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline void __NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1615 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline void __NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1632 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline uint32_t __NVIC_GetActive(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IABR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1721 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline void __NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IPR[( (((uint32_t)(int32_t)(IRQn)) >> 2UL) )] = ((uint32_t)(((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IPR[( (((uint32_t)(int32_t)(IRQn)) >> 2UL) )] & ~(0xFFUL << ( ((((uint32_t)(int32_t)(IRQn)) ) & 0x03UL) * 8UL))) |
       (((priority << (8U - 2U)) & (uint32_t)0xFFUL) << ( ((((uint32_t)(int32_t)(IRQn)) ) & 0x03UL) * 8UL)));
  }
  else
  {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHPR[( (((((uint32_t)(int32_t)(IRQn)) & 0x0FUL)-8UL) >> 2UL) )] = ((uint32_t)(((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHPR[( (((((uint32_t)(int32_t)(IRQn)) & 0x0FUL)-8UL) >> 2UL) )] & ~(0xFFUL << ( ((((uint32_t)(int32_t)(IRQn)) ) & 0x03UL) * 8UL))) |
       (((priority << (8U - 2U)) & (uint32_t)0xFFUL) << ( ((((uint32_t)(int32_t)(IRQn)) ) & 0x03UL) * 8UL)));
  }
}
# 1745 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline uint32_t __NVIC_GetPriority(IRQn_Type IRQn)
{

  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IPR[ ( (((uint32_t)(int32_t)(IRQn)) >> 2UL) )] >> ( ((((uint32_t)(int32_t)(IRQn)) ) & 0x03UL) * 8UL) ) & (uint32_t)0xFFUL) >> (8U - 2U)));
  }
  else
  {
    return((uint32_t)(((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHPR[( (((((uint32_t)(int32_t)(IRQn)) & 0x0FUL)-8UL) >> 2UL) )] >> ( ((((uint32_t)(int32_t)(IRQn)) ) & 0x03UL) * 8UL) ) & (uint32_t)0xFFUL) >> (8U - 2U)));
  }
}
# 1770 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(2U)) ? (uint32_t)(2U) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(2U)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(2U));

  return (
           ((PreemptPriority & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL)) << SubPriorityBits) |
           ((SubPriority & (uint32_t)((1UL << (SubPriorityBits )) - 1UL)))
         );
}
# 1797 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* const pPreemptPriority, uint32_t* const pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(2U)) ? (uint32_t)(2U) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(2U)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(2U));

  *pPreemptPriority = (Priority >> SubPriorityBits) & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL);
  *pSubPriority = (Priority ) & (uint32_t)((1UL << (SubPriorityBits )) - 1UL);
}
# 1821 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline void __NVIC_SetVector(IRQn_Type IRQn, uint32_t vector)
{

  uint32_t *vectors = (uint32_t *)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;



  vectors[(int32_t)IRQn + 16] = vector;
  __builtin_arm_dsb(0xF);
}
# 1841 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline uint32_t __NVIC_GetVector(IRQn_Type IRQn)
{

  uint32_t *vectors = (uint32_t *)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;



  return vectors[(int32_t)IRQn + 16];
}






__attribute__((__noreturn__)) static __inline void __NVIC_SystemReset(void)
{
  __builtin_arm_dsb(0xF);

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = ((0x5FAUL << 16U) |
                 (1UL << 2U));
  __builtin_arm_dsb(0xF);

  for(;;)
  {
    __builtin_arm_nop();
  }
}
# 2066 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline uint32_t SCB_GetFPUType(void)
{
    return 0U;
}
# 2127 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline void DCB_SetAuthCtrl(uint32_t value)
{
    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);
    ((DCB_Type *) (0xE000EDF0UL) )->DAUTHCTRL = value;
    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);
}







static __inline uint32_t DCB_GetAuthCtrl(void)
{
    return (((DCB_Type *) (0xE000EDF0UL) )->DAUTHCTRL);
}
# 2194 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline uint32_t DIB_GetAuthStatus(void)
{
    return (((DIB_Type *) (0xE000EFB0UL) )->DAUTHSTATUS);
}
# 2238 "D:/Users/121593/AppData/Local/Arm/Packs/ARM/CMSIS/5.8.0/CMSIS/Core/Include\\core_cm23.h" 3
static __inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1UL) > (0xFFFFFFUL ))
  {
    return (1UL);
  }

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD = (uint32_t)(ticks - 1UL);
  __NVIC_SetPriority (SysTick_IRQn, (1UL << 2U) - 1UL);
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL = 0UL;
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = (1UL << 2U) |
                   (1UL << 1U) |
                   (1UL );
  return (0UL);
}
# 152 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include/system_gd32c2x1.h" 1
# 49 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include/system_gd32c2x1.h"
extern uint32_t SystemCoreClock;



extern void SystemInit(void);

extern void SystemCoreClockUpdate(void);



extern uint32_t gd32c2x1_firmware_version_get(void);
# 153 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 2






typedef enum {DISABLE = 0, ENABLE = !DISABLE} EventStatus, ControlStatus;
typedef enum {RESET = 0, SET = !RESET} FlagStatus;
typedef enum {ERROR = 0, SUCCESS = !ERROR} ErrStatus;
# 212 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h"
# 1 "../app\\gd32c2x1_libopt.h" 1
# 38 "../app\\gd32c2x1_libopt.h"
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_adc.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_adc.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_adc.h" 2
# 349 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_adc.h"
void adc_deinit(void);

void adc_enable(void);

void adc_disable(void);



void adc_dma_mode_enable(void);

void adc_dma_mode_disable(void);



void adc_discontinuous_mode_config(uint8_t adc_sequence, uint8_t length);

void adc_special_function_config(uint32_t function, ControlStatus newvalue);

void adc_internal_channel_config(uint32_t internal_channel, ControlStatus newvalue);



void adc_data_alignment_config(uint32_t data_alignment);

void adc_channel_length_config(uint8_t adc_sequence, uint32_t length);

void adc_routine_channel_config(uint8_t rank, uint8_t adc_channel, uint32_t sample_time);

void adc_inserted_channel_config(uint8_t rank, uint8_t adc_channel, uint32_t sample_time);

void adc_inserted_channel_offset_config(uint8_t inserted_channel, uint16_t offset);



void adc_external_trigger_config(uint8_t adc_sequence, ControlStatus newvalue);

void adc_external_trigger_source_config(uint8_t adc_sequence, uint32_t external_trigger_source);

void adc_software_trigger_enable(uint8_t adc_sequence);



uint16_t adc_routine_data_read(void);

uint16_t adc_inserted_data_read(uint8_t inserted_channel);



void adc_watchdog0_single_channel_enable(uint8_t adc_channel);

void adc_watchdog0_sequence_channel_enable(uint8_t adc_sequence);

void adc_watchdog0_disable(void);

void adc_watchdog1_channel_config(uint32_t selection_channel, ControlStatus newvalue);

void adc_watchdog2_channel_config(uint32_t selection_channel, ControlStatus newvalue);

void adc_watchdog1_disable(void);

void adc_watchdog2_disable(void);

void adc_watchdog0_threshold_config( uint32_t low_threshold, uint32_t high_threshold);

void adc_watchdog1_threshold_config(uint32_t low_threshold, uint32_t high_threshold);

void adc_watchdog2_threshold_config(uint32_t low_threshold, uint32_t high_threshold);



void adc_resolution_config(uint32_t resolution);

void adc_oversample_mode_config(uint32_t mode, uint16_t shift, uint8_t ratio);

void adc_oversample_mode_enable(void);

void adc_oversample_mode_disable(void);



FlagStatus adc_flag_get(uint32_t flag);

void adc_flag_clear(uint32_t flag);

void adc_interrupt_enable(uint32_t interrupt);

void adc_interrupt_disable(uint32_t interrupt);

FlagStatus adc_interrupt_flag_get(uint32_t int_flag);

void adc_interrupt_flag_clear(uint32_t int_flag);
# 39 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_cmp.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_cmp.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_cmp.h" 2
# 63 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_cmp.h"
typedef enum{
    CMP0,
    CMP1
}cmp_enum;
# 113 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_cmp.h"
void cmp_deinit(cmp_enum cmp_periph);

void cmp_mode_init(cmp_enum cmp_periph, uint32_t operating_mode, uint32_t inverting_input, uint32_t output_hysteresis);

void cmp_output_init(cmp_enum cmp_periph, uint32_t output_polarity);

void cmp_blanking_init(cmp_enum cmp_periph,uint32_t blanking_source_selection);



void cmp_enable(cmp_enum cmp_periph);

void cmp_disable(cmp_enum cmp_periph);

void cmp_switch_enable(cmp_enum cmp_periph);

void cmp_switch_disable(cmp_enum cmp_periph);

void cmp_lock_enable(cmp_enum cmp_periph);

void cmp_voltage_scaler_enable(cmp_enum cmp_periph);

void cmp_voltage_scaler_disable(cmp_enum cmp_periph);

void cmp_scaler_bridge_enable(cmp_enum cmp_periph);

void cmp_scaler_bridge_disable(cmp_enum cmp_periph);



uint32_t cmp_output_level_get(cmp_enum cmp_periph);
# 40 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_crc.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_crc.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_crc.h" 2
# 91 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_crc.h"
void crc_deinit(void);

void crc_init_data_register_write(uint32_t init_data);

uint32_t crc_data_register_read(void);

uint8_t crc_free_data_register_read(void);

void crc_free_data_register_write(uint8_t free_data);

void crc_reverse_output_data_disable(void);

void crc_reverse_output_data_enable(void);

void crc_input_data_reverse_config(uint32_t data_reverse);

void crc_data_register_reset(void);


void crc_polynomial_size_set(uint32_t poly_size);

void crc_polynomial_set(uint32_t poly);


uint32_t crc_single_data_calculate(uint32_t sdata, uint8_t data_format);

uint32_t crc_block_data_calculate(void *array, uint32_t size, uint8_t data_format);
# 41 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_dbg.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_dbg.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_dbg.h" 2
# 81 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_dbg.h"
enum dbg_reg_idx {
    DBG_IDX_CTL0 = 0x04U,
    DBG_IDX_CTL1 = 0x08U,
};


typedef enum {
    DBG_FWDGT_HOLD = (((DBG_IDX_CTL0) << 6) | (8U)),
    DBG_WWDGT_HOLD = (((DBG_IDX_CTL0) << 6) | (9U)),
    DBG_TIMER0_HOLD = (((DBG_IDX_CTL0) << 6) | (11U)),
    DBG_TIMER2_HOLD = (((DBG_IDX_CTL0) << 6) | (12U)),
    DBG_TIMER13_HOLD = (((DBG_IDX_CTL0) << 6) | (13U)),
    DBG_I2C0_HOLD = (((DBG_IDX_CTL0) << 6) | (15U)),
    DBG_I2C1_HOLD = (((DBG_IDX_CTL0) << 6) | (16U)),
    DBG_TIMER15_HOLD = (((DBG_IDX_CTL0) << 6) | (20U)),
    DBG_TIMER16_HOLD = (((DBG_IDX_CTL0) << 6) | (21U)),
    DBG_RTC_HOLD = (((DBG_IDX_CTL1) << 6) | (10U)),
} dbg_periph_enum;



void dbg_deinit(void);

uint32_t dbg_id_get(void);


void dbg_low_power_enable(uint32_t dbg_low_power);

void dbg_low_power_disable(uint32_t dbg_low_power);


void dbg_periph_enable(dbg_periph_enum dbg_periph);

void dbg_periph_disable(dbg_periph_enum dbg_periph);
# 42 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_dma.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_dma.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_dma.h" 2
# 172 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_dma.h"
typedef enum {

    DMAMUX_INT_MUXCH0_SO = (((uint32_t)(0x00000000U) << 6) | (uint32_t)(8U)),
    DMAMUX_INT_MUXCH1_SO = (((uint32_t)(0x00000004U) << 6) | (uint32_t)(8U)),
    DMAMUX_INT_MUXCH2_SO = (((uint32_t)(0x00000008U) << 6) | (uint32_t)(8U)),
    DMAMUX_INT_GENCH0_TO = (((uint32_t)(0x00000100U) << 6) | (uint32_t)(8U)),
    DMAMUX_INT_GENCH1_TO = (((uint32_t)(0x00000104U) << 6) | (uint32_t)(8U)),
    DMAMUX_INT_GENCH2_TO = (((uint32_t)(0x00000108U) << 6) | (uint32_t)(8U)),
    DMAMUX_INT_GENCH3_TO = (((uint32_t)(0x0000010CU) << 6) | (uint32_t)(8U)),
} dmamux_interrupt_enum;


typedef enum {

    DMAMUX_FLAG_MUXCH0_SO = (((uint32_t)(0x00000080U) << 6) | (uint32_t)(0U)),
    DMAMUX_FLAG_MUXCH1_SO = (((uint32_t)(0x00000080U) << 6) | (uint32_t)(1U)),
    DMAMUX_FLAG_MUXCH2_SO = (((uint32_t)(0x00000080U) << 6) | (uint32_t)(2U)),
    DMAMUX_FLAG_GENCH0_TO = (((uint32_t)(0x00000140U) << 6) | (uint32_t)(0U)),
    DMAMUX_FLAG_GENCH1_TO = (((uint32_t)(0x00000140U) << 6) | (uint32_t)(1U)),
    DMAMUX_FLAG_GENCH2_TO = (((uint32_t)(0x00000140U) << 6) | (uint32_t)(2U)),
    DMAMUX_FLAG_GENCH3_TO = (((uint32_t)(0x00000140U) << 6) | (uint32_t)(3U)),
} dmamux_flag_enum;


typedef enum {

    DMAMUX_INT_FLAG_MUXCH0_SO = (((uint32_t)(0x00000000U) << 22) | (uint32_t)((8U) << 16) | (((uint32_t)(0x00000080U) << 6) | (uint32_t)(0U))),
    DMAMUX_INT_FLAG_MUXCH1_SO = (((uint32_t)(0x00000004U) << 22) | (uint32_t)((8U) << 16) | (((uint32_t)(0x00000080U) << 6) | (uint32_t)(1U))),
    DMAMUX_INT_FLAG_MUXCH2_SO = (((uint32_t)(0x00000008U) << 22) | (uint32_t)((8U) << 16) | (((uint32_t)(0x00000080U) << 6) | (uint32_t)(2U))),
    DMAMUX_INT_FLAG_GENCH0_TO = (((uint32_t)(0x00000100U) << 22) | (uint32_t)((8U) << 16) | (((uint32_t)(0x00000140U) << 6) | (uint32_t)(0U))),
    DMAMUX_INT_FLAG_GENCH1_TO = (((uint32_t)(0x00000104U) << 22) | (uint32_t)((8U) << 16) | (((uint32_t)(0x00000140U) << 6) | (uint32_t)(1U))),
    DMAMUX_INT_FLAG_GENCH2_TO = (((uint32_t)(0x00000108U) << 22) | (uint32_t)((8U) << 16) | (((uint32_t)(0x00000140U) << 6) | (uint32_t)(2U))),
    DMAMUX_INT_FLAG_GENCH3_TO = (((uint32_t)(0x0000010CU) << 22) | (uint32_t)((8U) << 16) | (((uint32_t)(0x00000140U) << 6) | (uint32_t)(3U))),
} dmamux_interrupt_flag_enum;


typedef enum {
    DMA_CH0 = 0U,
    DMA_CH1,
    DMA_CH2,
} dma_channel_enum;


typedef enum {
    DMAMUX_MUXCH0 = 0U,
    DMAMUX_MUXCH1,
    DMAMUX_MUXCH2,
} dmamux_multiplexer_channel_enum;


typedef enum {
    DMAMUX_GENCH0 = 0U,
    DMAMUX_GENCH1,
    DMAMUX_GENCH2,
    DMAMUX_GENCH3,
} dmamux_generator_channel_enum;


typedef struct {
    uint32_t periph_addr;
    uint32_t periph_width;
    uint32_t memory_addr;
    uint32_t memory_width;
    uint32_t number;
    uint32_t priority;
    uint8_t periph_inc;
    uint8_t memory_inc;
    uint8_t direction;
    uint32_t request;
} dma_parameter_struct;


typedef struct {
    uint32_t sync_id;
    uint32_t sync_polarity;
    uint32_t request_number;
} dmamux_sync_parameter_struct;


typedef struct {
    uint32_t trigger_id;
    uint32_t trigger_polarity;
    uint32_t request_number;
} dmamux_gen_parameter_struct;
# 452 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_dma.h"
void dma_deinit(dma_channel_enum channelx);

void dma_struct_para_init(dma_parameter_struct *init_struct);

void dma_init(dma_channel_enum channelx, dma_parameter_struct *init_struct);

void dma_circulation_enable(dma_channel_enum channelx);

void dma_circulation_disable(dma_channel_enum channelx);

void dma_memory_to_memory_enable(dma_channel_enum channelx);

void dma_memory_to_memory_disable(dma_channel_enum channelx);

void dma_channel_enable(dma_channel_enum channelx);

void dma_channel_disable(dma_channel_enum channelx);



void dma_periph_address_config(dma_channel_enum channelx, uint32_t address);

void dma_memory_address_config(dma_channel_enum channelx, uint32_t address);

void dma_transfer_number_config(dma_channel_enum channelx, uint32_t number);

uint32_t dma_transfer_number_get(dma_channel_enum channelx);

void dma_priority_config(dma_channel_enum channelx, uint32_t priority);

void dma_memory_width_config(dma_channel_enum channelx, uint32_t mwidth);

void dma_periph_width_config(dma_channel_enum channelx, uint32_t pwidth);

void dma_memory_increase_enable(dma_channel_enum channelx);

void dma_memory_increase_disable(dma_channel_enum channelx);

void dma_periph_increase_enable(dma_channel_enum channelx);

void dma_periph_increase_disable(dma_channel_enum channelx);

void dma_transfer_direction_config(dma_channel_enum channelx, uint32_t direction);



FlagStatus dma_flag_get(dma_channel_enum channelx, uint32_t flag);

void dma_flag_clear(dma_channel_enum channelx, uint32_t flag);

void dma_interrupt_enable(dma_channel_enum channelx, uint32_t source);

void dma_interrupt_disable(dma_channel_enum channelx, uint32_t source);

FlagStatus dma_interrupt_flag_get(dma_channel_enum channelx, uint32_t int_flag);

void dma_interrupt_flag_clear(dma_channel_enum channelx, uint32_t int_flag);




void dmamux_sync_struct_para_init(dmamux_sync_parameter_struct *init_struct);

void dmamux_synchronization_init(dmamux_multiplexer_channel_enum channelx,
                                 dmamux_sync_parameter_struct *init_struct);

void dmamux_synchronization_enable(dmamux_multiplexer_channel_enum channelx);

void dmamux_synchronization_disable(dmamux_multiplexer_channel_enum channelx);

void dmamux_event_generation_enable(dmamux_multiplexer_channel_enum channelx);

void dmamux_event_generation_disable(dmamux_multiplexer_channel_enum channelx);



void dmamux_gen_struct_para_init(dmamux_gen_parameter_struct *init_struct);

void dmamux_request_generator_init(dmamux_generator_channel_enum channelx,
                                   dmamux_gen_parameter_struct *init_struct);

void dmamux_request_generator_channel_enable(dmamux_generator_channel_enum channelx);

void dmamux_request_generator_channel_disable(dmamux_generator_channel_enum channelx);



void dmamux_synchronization_polarity_config(dmamux_multiplexer_channel_enum channelx,
                                            uint32_t polarity);

void dmamux_request_forward_number_config(dmamux_multiplexer_channel_enum channelx,
                                          uint32_t number);

void dmamux_sync_id_config(dmamux_multiplexer_channel_enum channelx, uint32_t id);

void dmamux_request_id_config(dmamux_multiplexer_channel_enum channelx, uint32_t id);

void dmamux_trigger_polarity_config(dmamux_generator_channel_enum channelx, uint32_t polarity);

void dmamux_request_generate_number_config(dmamux_generator_channel_enum channelx, uint32_t number);

void dmamux_trigger_id_config(dmamux_generator_channel_enum channelx, uint32_t id);



FlagStatus dmamux_flag_get(dmamux_flag_enum flag);

void dmamux_flag_clear(dmamux_flag_enum flag);

void dmamux_interrupt_enable(dmamux_interrupt_enum interrupt);

void dmamux_interrupt_disable(dmamux_interrupt_enum interrupt);

FlagStatus dmamux_interrupt_flag_get(dmamux_interrupt_flag_enum int_flag);

void dmamux_interrupt_flag_clear(dmamux_interrupt_flag_enum int_flag);
# 43 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_exti.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_exti.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_exti.h" 2
# 211 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_exti.h"
typedef enum {
    EXTI_0 = ((uint32_t)((uint32_t)0x01U<<(0))),
    EXTI_1 = ((uint32_t)((uint32_t)0x01U<<(1))),
    EXTI_2 = ((uint32_t)((uint32_t)0x01U<<(2))),
    EXTI_3 = ((uint32_t)((uint32_t)0x01U<<(3))),
    EXTI_4 = ((uint32_t)((uint32_t)0x01U<<(4))),
    EXTI_5 = ((uint32_t)((uint32_t)0x01U<<(5))),
    EXTI_6 = ((uint32_t)((uint32_t)0x01U<<(6))),
    EXTI_7 = ((uint32_t)((uint32_t)0x01U<<(7))),
    EXTI_8 = ((uint32_t)((uint32_t)0x01U<<(8))),
    EXTI_9 = ((uint32_t)((uint32_t)0x01U<<(9))),
    EXTI_10 = ((uint32_t)((uint32_t)0x01U<<(10))),
    EXTI_11 = ((uint32_t)((uint32_t)0x01U<<(11))),
    EXTI_12 = ((uint32_t)((uint32_t)0x01U<<(12))),
    EXTI_13 = ((uint32_t)((uint32_t)0x01U<<(13))),
    EXTI_14 = ((uint32_t)((uint32_t)0x01U<<(14))),
    EXTI_15 = ((uint32_t)((uint32_t)0x01U<<(15))),
    EXTI_16 = ((uint32_t)((uint32_t)0x01U<<(16))),
    EXTI_17 = ((uint32_t)((uint32_t)0x01U<<(17))),
    EXTI_18 = ((uint32_t)((uint32_t)0x01U<<(18))),
    EXTI_19 = ((uint32_t)((uint32_t)0x01U<<(19))),
    EXTI_20 = ((uint32_t)((uint32_t)0x01U<<(20))),
    EXTI_21 = ((uint32_t)((uint32_t)0x01U<<(21))),
    EXTI_22 = ((uint32_t)((uint32_t)0x01U<<(22))),
    EXTI_23 = ((uint32_t)((uint32_t)0x01U<<(23)))
} exti_line_enum;


typedef enum {
    EXTI_INTERRUPT = 0,
    EXTI_EVENT
} exti_mode_enum;


typedef enum {
    EXTI_TRIG_RISING = 0,
    EXTI_TRIG_FALLING,
    EXTI_TRIG_BOTH,
    EXTI_TRIG_NONE
} exti_trig_type_enum;





void exti_deinit(void);

void exti_init(exti_line_enum linex, exti_mode_enum mode, exti_trig_type_enum trig_type);

void exti_interrupt_enable(exti_line_enum linex);

void exti_interrupt_disable(exti_line_enum linex);

void exti_event_enable(exti_line_enum linex);

void exti_event_disable(exti_line_enum linex);

void exti_software_interrupt_enable(exti_line_enum linex);

void exti_software_interrupt_disable(exti_line_enum linex);



FlagStatus exti_flag_get(exti_line_enum linex);

void exti_flag_clear(exti_line_enum linex);

FlagStatus exti_interrupt_flag_get(exti_line_enum linex);

void exti_interrupt_flag_clear(exti_line_enum linex);
# 44 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_fmc.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_fmc.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_fmc.h" 2
# 305 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_fmc.h"
typedef enum {
    FMC_READY = 0,
    FMC_BUSY,
    FMC_OBERR,
    FMC_RPERR,
    FMC_FSTPERR,
    FMC_PGSERR,
    FMC_PGMERR,
    FMC_PGAERR,
    FMC_WPERR,
    FMC_PGERR,
    FMC_OPRERR,
    FMC_TOERR,
    FMC_OB_HSPC,
    FMC_UNDEFINEDERR
} fmc_state_enum;


typedef enum {
    OBCTL_USER_DATA_BORST_EN = ((uint32_t)((uint32_t)0x01U<<(8))) | 8U,
    OBCTL_USER_DATA_BORR_TH = ((0xFFFFFFFFUL << (uint8_t)(9)) & (0xFFFFFFFFUL >> (31U - (uint8_t)(10)))) | 9U,
    OBCTL_USER_DATA_BORF_TH = ((0xFFFFFFFFUL << (uint8_t)(11)) & (0xFFFFFFFFUL >> (31U - (uint8_t)(12)))) | 11U,
    OBCTL_USER_DATA_NRST_STDBY = ((uint32_t)((uint32_t)0x01U<<(14))) | 14U,
    OBCTL_USER_DATA_HXTAL_REMAP = ((uint32_t)((uint32_t)0x01U<<(21))) | 21U,
    OBCTL_USER_DATA_SRAM_ECC_EN = ((uint32_t)((uint32_t)0x01U<<(22))) | 22U,
    OBCTL_USER_DATA_NRST_DPSLP = ((uint32_t)((uint32_t)0x01U<<(13))) | 13U,
    OBCTL_USER_DATA_NFWDG_HW = ((uint32_t)((uint32_t)0x01U<<(16))) | 16U,
    OBCTL_USER_DATA_NWWDG_HW = ((uint32_t)((uint32_t)0x01U<<(19))) | 19U,
    OBCTL_USER_DATA_SWBT0 = ((uint32_t)((uint32_t)0x01U<<(24))) | 24U,
    OBCTL_USER_DATA_NBOOT1 = ((uint32_t)((uint32_t)0x01U<<(25))) | 25U,
    OBCTL_USER_DATA_NBOOT0 = ((uint32_t)((uint32_t)0x01U<<(26))) | 26U,
    OBCTL_USER_DATA_NRST_MDSEL = ((0xFFFFFFFFUL << (uint8_t)(27)) & (0xFFFFFFFFUL >> (31U - (uint8_t)(28)))) | 27U
} ob_user_data_extract_info_enum;
# 373 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_fmc.h"
void fmc_unlock(void);

void fmc_lock(void);

FlagStatus fmc_main_flash_empty_stat_get(void);

void fmc_main_flash_empty_stat_modify(uint32_t empty_check_status);

void fmc_wscnt_set(uint32_t wscnt);

void fmc_prefetch_enable(void);

void fmc_prefetch_disable(void);

void fmc_icache_enable(void);

void fmc_icache_disable(void);

void fmc_icache_reset(void);

fmc_state_enum fmc_page_erase(uint32_t page_number);

fmc_state_enum fmc_mass_erase(void);

fmc_state_enum fmc_doubleword_program(uint32_t address, uint64_t data);

fmc_state_enum fmc_fast_program(uint32_t address, uint32_t data_buf);

void fmc_debugger_enable(void);

void fmc_debugger_disable(void);

void fmc_scr_area_enable(void);



void ob_unlock(void);

void ob_lock(void);

void ob_reload(void);

fmc_state_enum ob_user_write(uint32_t ob_user, uint32_t ob_user_mask);

fmc_state_enum ob_security_protection_level_config(uint8_t ob_spc);

fmc_state_enum ob_dcrp_area_config(uint32_t dcrp_area, uint32_t dcrp_eren, uint32_t dcrp_start,
                                   uint32_t dcrp_end);

fmc_state_enum ob_write_protection_area_config(uint32_t wp_area, uint32_t wp_start,
                                               uint32_t wp_end);

fmc_state_enum ob_scr_area_config(uint32_t secure_size);

fmc_state_enum ob_boot_lock_config(uint32_t boot_config);

uint32_t ob_user_get(ob_user_data_extract_info_enum user_data_extract_info, uint8_t * ob_user_data);

uint8_t ob_security_protection_level_get(void);

uint32_t ob_dcrp_area_get(uint32_t dcrp_area, uint32_t *dcrp_erase_option,
                          uint32_t *dcrp_start, uint32_t *dcrp_end);

uint32_t ob_write_protection_area_get(uint32_t wp_area, uint32_t *wp_start,
                                      uint32_t *wp_end);

uint32_t ob_scr_area_get(uint32_t *scr_area_byte_cnt);

uint32_t ob_boot_lock_get(void);



FlagStatus fmc_flag_get(uint32_t flag);

void fmc_flag_clear(uint32_t flag);

void fmc_interrupt_enable(uint32_t interrupt);

void fmc_interrupt_disable(uint32_t interrupt);

FlagStatus fmc_interrupt_flag_get(uint32_t flag);

void fmc_interrupt_flag_clear(uint32_t flag);

fmc_state_enum fmc_state_get(void);

fmc_state_enum fmc_ready_wait(uint32_t timeout);
# 45 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_fwdgt.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_fwdgt.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 40 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_fwdgt.h" 2
# 103 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_fwdgt.h"
void fwdgt_write_enable(void);

void fwdgt_write_disable(void);

void fwdgt_enable(void);


ErrStatus fwdgt_prescaler_value_config(uint16_t prescaler_value);

ErrStatus fwdgt_reload_value_config(uint16_t reload_value);

ErrStatus fwdgt_window_value_config(uint16_t window_value);

void fwdgt_counter_reload(void);

ErrStatus fwdgt_config(uint16_t reload_value, uint8_t prescaler_div);


FlagStatus fwdgt_flag_get(uint16_t flag);
# 46 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_gpio.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_gpio.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_gpio.h" 2
# 280 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_gpio.h"
typedef FlagStatus bit_status;
# 359 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_gpio.h"
void gpio_deinit(uint32_t gpio_periph);

void gpio_mode_set(uint32_t gpio_periph, uint32_t mode, uint32_t pull_up_down, uint32_t pin);

void gpio_output_options_set(uint32_t gpio_periph, uint8_t otype, uint32_t speed, uint32_t pin);


void gpio_bit_set(uint32_t gpio_periph, uint32_t pin);

void gpio_bit_reset(uint32_t gpio_periph, uint32_t pin);

void gpio_bit_write(uint32_t gpio_periph, uint32_t pin, bit_status bit_value);

void gpio_port_write(uint32_t gpio_periph, uint16_t data);


FlagStatus gpio_input_bit_get(uint32_t gpio_periph, uint32_t pin);

uint16_t gpio_input_port_get(uint32_t gpio_periph);

FlagStatus gpio_output_bit_get(uint32_t gpio_periph, uint32_t pin);

uint16_t gpio_output_port_get(uint32_t gpio_periph);


void gpio_af_set(uint32_t gpio_periph, uint32_t alt_func_num, uint32_t pin);

void gpio_pin_lock(uint32_t gpio_periph, uint32_t pin);


void gpio_bit_toggle(uint32_t gpio_periph, uint32_t pin);

void gpio_port_toggle(uint32_t gpio_periph);
# 47 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_i2c.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_i2c.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_i2c.h" 2
# 176 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_i2c.h"
typedef enum {
    I2C_INT_FLAG_TI = (((uint32_t)(((uint32_t)0x00000018U)) << 22) | (uint32_t)((1U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(1U))),
    I2C_INT_FLAG_RBNE = (((uint32_t)(((uint32_t)0x00000018U)) << 22) | (uint32_t)((2U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(2U))),
    I2C_INT_FLAG_ADDSEND = (((uint32_t)(((uint32_t)0x00000018U)) << 22) | (uint32_t)((3U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(3U))),
    I2C_INT_FLAG_NACK = (((uint32_t)(((uint32_t)0x00000018U)) << 22) | (uint32_t)((4U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(4U))),
    I2C_INT_FLAG_STPDET = (((uint32_t)(((uint32_t)0x00000018U)) << 22) | (uint32_t)((5U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(5U))),
    I2C_INT_FLAG_TC = (((uint32_t)(((uint32_t)0x00000018U)) << 22) | (uint32_t)((6U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(6U))),
    I2C_INT_FLAG_TCR = (((uint32_t)(((uint32_t)0x00000018U)) << 22) | (uint32_t)((7U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(6U))),
    I2C_INT_FLAG_BERR = (((uint32_t)(((uint32_t)0x00000018U)) << 22) | (uint32_t)((8U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(7U))),
    I2C_INT_FLAG_LOSTARB = (((uint32_t)(((uint32_t)0x00000018U)) << 22) | (uint32_t)((9U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(7U))),
    I2C_INT_FLAG_OUERR = (((uint32_t)(((uint32_t)0x00000018U)) << 22) | (uint32_t)((10U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(7U))),
    I2C_INT_FLAG_PECERR = (((uint32_t)(((uint32_t)0x00000018U)) << 22) | (uint32_t)((11U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(7U))),
    I2C_INT_FLAG_TIMEOUT = (((uint32_t)(((uint32_t)0x00000018U)) << 22) | (uint32_t)((12U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(7U))),
    I2C_INT_FLAG_SMBALT = (((uint32_t)(((uint32_t)0x00000018U)) << 22) | (uint32_t)((13U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(7U)))
} i2c_interrupt_flag_enum;
# 275 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_i2c.h"
void i2c_deinit(uint32_t i2c_periph);

void i2c_timing_config(uint32_t i2c_periph, uint32_t psc, uint32_t scl_dely, uint32_t sda_dely);

void i2c_digital_noise_filter_config(uint32_t i2c_periph, uint32_t filter_length);

void i2c_analog_noise_filter_enable(uint32_t i2c_periph);

void i2c_analog_noise_filter_disable(uint32_t i2c_periph);

void i2c_master_clock_config(uint32_t i2c_periph, uint32_t sclh, uint32_t scll);

void i2c_master_addressing(uint32_t i2c_periph, uint32_t address, uint32_t trans_direction);



void i2c_address10_header_enable(uint32_t i2c_periph);

void i2c_address10_header_disable(uint32_t i2c_periph);

void i2c_address10_enable(uint32_t i2c_periph);

void i2c_address10_disable(uint32_t i2c_periph);

void i2c_automatic_end_enable(uint32_t i2c_periph);

void i2c_automatic_end_disable(uint32_t i2c_periph);

void i2c_slave_response_to_gcall_enable(uint32_t i2c_periph);

void i2c_slave_response_to_gcall_disable(uint32_t i2c_periph);

void i2c_stretch_scl_low_enable(uint32_t i2c_periph);

void i2c_stretch_scl_low_disable(uint32_t i2c_periph);

void i2c_address_config(uint32_t i2c_periph, uint32_t address, uint32_t addr_format);

void i2c_address_bit_compare_config(uint32_t i2c_periph, uint32_t compare_bits);

void i2c_address_disable(uint32_t i2c_periph);

void i2c_second_address_config(uint32_t i2c_periph, uint32_t address, uint32_t addr_mask);

void i2c_second_address_disable(uint32_t i2c_periph);

uint32_t i2c_received_address_get(uint32_t i2c_periph);

void i2c_slave_byte_control_enable(uint32_t i2c_periph);

void i2c_slave_byte_control_disable(uint32_t i2c_periph);

void i2c_nack_enable(uint32_t i2c_periph);

void i2c_wakeup_from_deepsleep_enable(uint32_t i2c_periph);

void i2c_wakeup_from_deepsleep_disable(uint32_t i2c_periph);

void i2c_enable(uint32_t i2c_periph);

void i2c_disable(uint32_t i2c_periph);

void i2c_start_on_bus(uint32_t i2c_periph);

void i2c_stop_on_bus(uint32_t i2c_periph);

void i2c_data_transmit(uint32_t i2c_periph, uint8_t data);

uint8_t i2c_data_receive(uint32_t i2c_periph);

void i2c_reload_enable(uint32_t i2c_periph);

void i2c_reload_disable(uint32_t i2c_periph);

void i2c_transfer_byte_number_config(uint32_t i2c_periph, uint8_t byte_number);

void i2c_dma_enable(uint32_t i2c_periph, uint8_t dma);

void i2c_dma_disable(uint32_t i2c_periph, uint8_t dma);

void i2c_pec_transfer(uint32_t i2c_periph);

void i2c_pec_enable(uint32_t i2c_periph);

void i2c_pec_disable(uint32_t i2c_periph);

uint32_t i2c_pec_value_get(uint32_t i2c_periph);

void i2c_smbus_alert_enable(uint32_t i2c_periph);

void i2c_smbus_alert_disable(uint32_t i2c_periph);

void i2c_smbus_default_addr_enable(uint32_t i2c_periph);

void i2c_smbus_default_addr_disable(uint32_t i2c_periph);

void i2c_smbus_host_addr_enable(uint32_t i2c_periph);

void i2c_smbus_host_addr_disable(uint32_t i2c_periph);

void i2c_extended_clock_timeout_enable(uint32_t i2c_periph);

void i2c_extended_clock_timeout_disable(uint32_t i2c_periph);

void i2c_clock_timeout_enable(uint32_t i2c_periph);

void i2c_clock_timeout_disable(uint32_t i2c_periph);

void i2c_bus_timeout_b_config(uint32_t i2c_periph, uint32_t timeout);

void i2c_bus_timeout_a_config(uint32_t i2c_periph, uint32_t timeout);

void i2c_idle_clock_timeout_config(uint32_t i2c_periph, uint32_t timeout);



FlagStatus i2c_flag_get(uint32_t i2c_periph, uint32_t flag);

void i2c_flag_clear(uint32_t i2c_periph, uint32_t flag);

void i2c_interrupt_enable(uint32_t i2c_periph, uint32_t interrupt);

void i2c_interrupt_disable(uint32_t i2c_periph, uint32_t interrupt);

FlagStatus i2c_interrupt_flag_get(uint32_t i2c_periph, i2c_interrupt_flag_enum int_flag);

void i2c_interrupt_flag_clear(uint32_t i2c_periph, i2c_interrupt_flag_enum int_flag);
# 48 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_misc.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_misc.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_misc.h" 2
# 66 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_misc.h"
void nvic_irq_enable(IRQn_Type nvic_irq, uint8_t nvic_irq_priority);

void nvic_irq_disable(IRQn_Type nvic_irq);

void nvic_vector_table_set(uint32_t nvic_vict_tab, uint32_t offset);

void nvic_system_reset(void);


void system_lowpower_set(uint8_t lowpower_mode);

void system_lowpower_reset(uint8_t lowpower_mode);


void systick_clksource_set(uint32_t systick_clksource);
# 49 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_pmu.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_pmu.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_pmu.h" 2
# 115 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_pmu.h"
void pmu_deinit(void);

void pmu_deepsleep_voltage_select(uint32_t dsv_n);

void pmu_low_power_ldo_enable(void);

void pmu_low_power_ldo_disable(void);

void pmu_to_sleepmode(uint8_t sleepmodecmd);

void pmu_to_deepsleepmode(uint8_t deepsleepmodecmd, uint8_t deepsleepmode);

void pmu_to_standbymode(void);

void pmu_wakeup_pin_enable(uint32_t wakeup_pin);

void pmu_wakeup_pin_disable(uint32_t wakeup_pin);



void pmu_backup_write_enable(void);

void pmu_backup_write_disable(void);


void pmu_eflash_run_power_config(ControlStatus state);

void pmu_eflash_deepsleep_power_config(ControlStatus state);


void pmu_eflash_wakeup_time_config(uint32_t wakeup_time);

void pmu_deepsleep_wait_time_config(uint32_t wait_time);



FlagStatus pmu_flag_get(uint32_t flag);

void pmu_flag_clear(uint32_t flag);
# 50 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_rcu.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_rcu.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_rcu.h" 2
# 270 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_rcu.h"
typedef enum {

    RCU_FMC = (((uint32_t)(0x30U)<<6) | (uint32_t)(4U)),
    RCU_CRC = (((uint32_t)(0x30U)<<6) | (uint32_t)(12U)),
    RCU_DMA = (((uint32_t)(0x30U)<<6) | (uint32_t)(21U)),
    RCU_DMAMUX = (((uint32_t)(0x30U)<<6) | (uint32_t)(23U)),


    RCU_GPIOA = (((uint32_t)(0x34U)<<6) | (uint32_t)(17U)),
    RCU_GPIOB = (((uint32_t)(0x34U)<<6) | (uint32_t)(18U)),
    RCU_GPIOC = (((uint32_t)(0x34U)<<6) | (uint32_t)(19U)),
    RCU_GPIOD = (((uint32_t)(0x34U)<<6) | (uint32_t)(20U)),
    RCU_GPIOF = (((uint32_t)(0x34U)<<6) | (uint32_t)(22U)),


    RCU_SYSCFG = (((uint32_t)(0x44U)<<6) | (uint32_t)(0U)),
    RCU_CMP = (((uint32_t)(0x44U)<<6) | (uint32_t)(1U)),
    RCU_WWDGT = (((uint32_t)(0x44U)<<6) | (uint32_t)(8U)),
    RCU_ADC = (((uint32_t)(0x44U)<<6) | (uint32_t)(9U)),
    RCU_TIMER0 = (((uint32_t)(0x44U)<<6) | (uint32_t)(10U)),
    RCU_TIMER2 = (((uint32_t)(0x44U)<<6) | (uint32_t)(11U)),
    RCU_SPI0 = (((uint32_t)(0x44U)<<6) | (uint32_t)(12U)),
    RCU_SPI1 = (((uint32_t)(0x44U)<<6) | (uint32_t)(13U)),
    RCU_USART0 = (((uint32_t)(0x44U)<<6) | (uint32_t)(14U)),
    RCU_USART1 = (((uint32_t)(0x44U)<<6) | (uint32_t)(15U)),
    RCU_TIMER13 = (((uint32_t)(0x44U)<<6) | (uint32_t)(16U)),
    RCU_TIMER15 = (((uint32_t)(0x44U)<<6) | (uint32_t)(17U)),
    RCU_TIMER16 = (((uint32_t)(0x44U)<<6) | (uint32_t)(18U)),
    RCU_USART2 = (((uint32_t)(0x44U)<<6) | (uint32_t)(19U)),
    RCU_I2C0 = (((uint32_t)(0x44U)<<6) | (uint32_t)(21U)),
    RCU_I2C1 = (((uint32_t)(0x44U)<<6) | (uint32_t)(22U)),
    RCU_DBGMCU = (((uint32_t)(0x44U)<<6) | (uint32_t)(27U)),
    RCU_PMU = (((uint32_t)(0x44U)<<6) | (uint32_t)(28U)),


    RCU_RTC = (((uint32_t)(0x70U)<<6) | (uint32_t)(15U))
} rcu_periph_enum;


typedef enum {

    RCU_SRAM_SLP = (((uint32_t)(0x50U)<<6) | (uint32_t)(2U)),
    RCU_FMC_SLP = (((uint32_t)(0x50U)<<6) | (uint32_t)(4U)),
    RCU_CRC_SLP = (((uint32_t)(0x50U)<<6) | (uint32_t)(12U)),
    RCU_DMA_SLP = (((uint32_t)(0x50U)<<6) | (uint32_t)(21U)),
    RCU_DMAMUX_SLP = (((uint32_t)(0x50U)<<6) | (uint32_t)(23U)),


    RCU_GPIOA_SLP = (((uint32_t)(0x54U)<<6) | (uint32_t)(17U)),
    RCU_GPIOB_SLP = (((uint32_t)(0x54U)<<6) | (uint32_t)(18U)),
    RCU_GPIOC_SLP = (((uint32_t)(0x54U)<<6) | (uint32_t)(19U)),
    RCU_GPIOD_SLP = (((uint32_t)(0x54U)<<6) | (uint32_t)(20U)),
    RCU_GPIOF_SLP = (((uint32_t)(0x54U)<<6) | (uint32_t)(22U)),


    RCU_SYSCFG_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(0U)),
    RCU_CMP_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(1U)),
    RCU_WWDGT_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(8U)),
    RCU_ADC_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(9U)),
    RCU_TIMER0_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(10U)),
    RCU_TIMER2_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(11U)),
    RCU_SPI0_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(12U)),
    RCU_SPI1_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(13U)),
    RCU_USART0_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(14U)),
    RCU_USART1_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(15U)),
    RCU_TIMER13_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(16U)),
    RCU_TIMER15_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(17U)),
    RCU_TIMER16_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(18U)),
    RCU_USART2_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(19U)),
    RCU_I2C0_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(21U)),
    RCU_I2C1_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(22U)),
    RCU_PMU_SLP = (((uint32_t)(0x64U)<<6) | (uint32_t)(28U)),
} rcu_periph_sleep_enum;


typedef enum {

    RCU_CRCRST = (((uint32_t)(0x10U)<<6) | (uint32_t)(12U)),
    RCU_DMARST = (((uint32_t)(0x10U)<<6) | (uint32_t)(21U)),
    RCU_DMAMUXRST = (((uint32_t)(0x10U)<<6) | (uint32_t)(23U)),


    RCU_GPIOARST = (((uint32_t)(0x14U)<<6) | (uint32_t)(17U)),
    RCU_GPIOBRST = (((uint32_t)(0x14U)<<6) | (uint32_t)(18U)),
    RCU_GPIOCRST = (((uint32_t)(0x14U)<<6) | (uint32_t)(19U)),
    RCU_GPIODRST = (((uint32_t)(0x14U)<<6) | (uint32_t)(20U)),
    RCU_GPIOFRST = (((uint32_t)(0x14U)<<6) | (uint32_t)(22U)),


    RCU_SYSCFGRST = (((uint32_t)(0x24U)<<6) | (uint32_t)(0U)),
    RCU_CMPRST = (((uint32_t)(0x24U)<<6) | (uint32_t)(1U)),
    RCU_WWDGTRST = (((uint32_t)(0x24U)<<6) | (uint32_t)(8U)),
    RCU_ADCRST = (((uint32_t)(0x24U)<<6) | (uint32_t)(9U)),
    RCU_TIMER0RST = (((uint32_t)(0x24U)<<6) | (uint32_t)(10U)),
    RCU_TIMER2RST = (((uint32_t)(0x24U)<<6) | (uint32_t)(11U)),
    RCU_SPI0RST = (((uint32_t)(0x24U)<<6) | (uint32_t)(12U)),
    RCU_SPI1RST = (((uint32_t)(0x24U)<<6) | (uint32_t)(13U)),
    RCU_USART0RST = (((uint32_t)(0x24U)<<6) | (uint32_t)(14U)),
    RCU_USART1RST = (((uint32_t)(0x24U)<<6) | (uint32_t)(15U)),
    RCU_TIMER13RST = (((uint32_t)(0x24U)<<6) | (uint32_t)(16U)),
    RCU_TIMER15RST = (((uint32_t)(0x24U)<<6) | (uint32_t)(17U)),
    RCU_TIMER16RST = (((uint32_t)(0x24U)<<6) | (uint32_t)(18U)),
    RCU_USART2RST = (((uint32_t)(0x24U)<<6) | (uint32_t)(19U)),
    RCU_I2C0RST = (((uint32_t)(0x24U)<<6) | (uint32_t)(21U)),
    RCU_I2C1RST = (((uint32_t)(0x24U)<<6) | (uint32_t)(22U)),
    RCU_PMURST = (((uint32_t)(0x24U)<<6) | (uint32_t)(28U)),
} rcu_periph_reset_enum;


typedef enum {

    RCU_FLAG_IRC32KSTB = (((uint32_t)(0x74U)<<6) | (uint32_t)(1U)),
    RCU_FLAG_LXTALSTB = (((uint32_t)(0x70U)<<6) | (uint32_t)(1U)),
    RCU_FLAG_IRC48MSTB = (((uint32_t)(0x00U)<<6) | (uint32_t)(1U)),
    RCU_FLAG_HXTALSTB = (((uint32_t)(0x00U)<<6) | (uint32_t)(17U)),


    RCU_FLAG_OBLRST = (((uint32_t)(0x74U)<<6) | (uint32_t)(23U)),
    RCU_FLAG_EPRST = (((uint32_t)(0x74U)<<6) | (uint32_t)(26U)),
    RCU_FLAG_PORRST = (((uint32_t)(0x74U)<<6) | (uint32_t)(27U)),
    RCU_FLAG_SWRST = (((uint32_t)(0x74U)<<6) | (uint32_t)(28U)),
    RCU_FLAG_FWDGTRST = (((uint32_t)(0x74U)<<6) | (uint32_t)(29U)),
    RCU_FLAG_WWDGTRST = (((uint32_t)(0x74U)<<6) | (uint32_t)(30U)),
    RCU_FLAG_LPRST = (((uint32_t)(0x74U)<<6) | (uint32_t)(31U)),

    RCU_FLAG_LCKCMD = (((uint32_t)(0x70U)<<6) | (uint32_t)(6U))
} rcu_flag_enum;


typedef enum {
    RCU_INT_FLAG_IRC32KSTB = (((uint32_t)(0x0CU)<<6) | (uint32_t)(0U)),
    RCU_INT_FLAG_LXTALSTB = (((uint32_t)(0x0CU)<<6) | (uint32_t)(1U)),
    RCU_INT_FLAG_IRC48MSTB = (((uint32_t)(0x0CU)<<6) | (uint32_t)(2U)),
    RCU_INT_FLAG_LXTALCKM = (((uint32_t)(0x0CU)<<6) | (uint32_t)(6U)),
    RCU_INT_FLAG_HXTALSTB = (((uint32_t)(0x0CU)<<6) | (uint32_t)(3U)),
    RCU_INT_FLAG_CKM = (((uint32_t)(0x0CU)<<6) | (uint32_t)(7U)),
} rcu_int_flag_enum;


typedef enum {
    RCU_INT_FLAG_IRC32KSTB_CLR = (((uint32_t)(0x0CU)<<6) | (uint32_t)(16U)),
    RCU_INT_FLAG_LXTALSTB_CLR = (((uint32_t)(0x0CU)<<6) | (uint32_t)(17U)),
    RCU_INT_FLAG_IRC48MSTB_CLR = (((uint32_t)(0x0CU)<<6) | (uint32_t)(18U)),
    RCU_INT_FLAG_LXTALCKM_CLR = (((uint32_t)(0x0CU)<<6) | (uint32_t)(22U)),
    RCU_INT_FLAG_HXTALSTB_CLR = (((uint32_t)(0x0CU)<<6) | (uint32_t)(19U)),
    RCU_INT_FLAG_CKM_CLR = (((uint32_t)(0x0CU)<<6) | (uint32_t)(23U)),
} rcu_int_flag_clear_enum;


typedef enum {
    RCU_INT_IRC32KSTB = (((uint32_t)(0x0CU)<<6) | (uint32_t)(8U)),
    RCU_INT_LXTALSTB = (((uint32_t)(0x0CU)<<6) | (uint32_t)(9U)),
    RCU_INT_IRC48MSTB = (((uint32_t)(0x0CU)<<6) | (uint32_t)(10U)),
    RCU_INT_HXTALSTB = (((uint32_t)(0x0CU)<<6) | (uint32_t)(11U)),
} rcu_int_enum;


typedef enum {
    RCU_HXTAL = (((uint32_t)(0x00U)<<6) | (uint32_t)(16U)),
    RCU_LXTAL = (((uint32_t)(0x70U)<<6) | (uint32_t)(0U)),
    RCU_IRC48M = (((uint32_t)(0x00U)<<6) | (uint32_t)(0U)),
    RCU_IRC32K = (((uint32_t)(0x74U)<<6) | (uint32_t)(0U)),
} rcu_osci_type_enum;


typedef enum {
    CK_SYS = 0U,
    CK_AHB,
    CK_APB,
    CK_ADC,
    CK_USART0,
    CK_I2C0,
    CK_I2C1,
    CK_I2C2,
    CK_USART1,
} rcu_clock_freq_enum;

typedef enum {
    IDX_USART0 = 0U,
    IDX_USART1
} usart_idx_enum;

typedef enum {
    IDX_I2C0 = 0U,
    IDX_I2C1,
} i2c_idx_enum;
# 616 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_rcu.h"
void rcu_deinit(void);

void rcu_periph_clock_enable(rcu_periph_enum periph);

void rcu_periph_clock_disable(rcu_periph_enum periph);

void rcu_periph_clock_sleep_enable(rcu_periph_sleep_enum periph);

void rcu_periph_clock_sleep_disable(rcu_periph_sleep_enum periph);

void rcu_periph_reset_enable(rcu_periph_reset_enum periph_reset);

void rcu_periph_reset_disable(rcu_periph_reset_enum periph_reset);

void rcu_bkp_reset_enable(void);

void rcu_bkp_reset_disable(void);



void rcu_system_clock_source_config(uint32_t ck_sys);

uint32_t rcu_system_clock_source_get(void);

void rcu_ahb_clock_config(uint32_t ck_ahb);

void rcu_apb_clock_config(uint32_t ck_apb);

void rcu_adc_clock_config(uint32_t adc_clock_source, uint32_t ck_adc);

void rcu_ckout0_config(uint32_t ckout0_src, uint32_t ckout0_div);

void rcu_ckout1_config(uint32_t ckout1_src, uint32_t ckout1_div);

void rcu_lsckout_enable(void);

void rcu_lsckout_disable(void);

void rcu_lsckout_config(uint32_t lsckout_src);


void rcu_usart_clock_config(usart_idx_enum usart_idx, uint32_t ck_usart);

void rcu_i2c_clock_config(i2c_idx_enum i2c_idx, uint32_t ck_i2c);

void rcu_i2s_clock_config(uint32_t ck_i2s);

void rcu_irc48mdiv_sys_clock_config(uint32_t ck_irc48mdiv_sys);

void rcu_irc48mdiv_per_clock_config(uint32_t ck_irc48mdiv_per) ;

void rcu_rtc_clock_config(uint32_t rtc_clock_source);

void rcu_lxtal_drive_capability_config(uint32_t lxtal_dricap);



ErrStatus rcu_osci_stab_wait(rcu_osci_type_enum osci);

void rcu_osci_on(rcu_osci_type_enum osci);

void rcu_osci_off(rcu_osci_type_enum osci);

void rcu_osci_bypass_mode_enable(rcu_osci_type_enum osci);

void rcu_osci_bypass_mode_disable(rcu_osci_type_enum osci);

void rcu_irc48m_adjust_value_set(uint8_t irc48m_adjval);

void rcu_lxtal_stab_reset_enable(void);

void rcu_lxtal_stab_reset_disable(void);



void rcu_hxtal_clock_monitor_enable(void);

void rcu_hxtal_clock_monitor_disable(void);

void rcu_lxtal_clock_monitor_enable(void);

void rcu_lxtal_clock_monitor_disable(void);



uint32_t rcu_clock_freq_get(rcu_clock_freq_enum clock);



FlagStatus rcu_flag_get(rcu_flag_enum flag);

void rcu_all_reset_flag_clear(void);

void rcu_interrupt_enable(rcu_int_enum stab_int);

void rcu_interrupt_disable(rcu_int_enum stab_int);

FlagStatus rcu_interrupt_flag_get(rcu_int_flag_enum int_flag);

void rcu_interrupt_flag_clear(rcu_int_flag_clear_enum int_flag_clear);
# 51 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_rtc.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_rtc.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_rtc.h" 2
# 190 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_rtc.h"
typedef struct {
    uint8_t year;
    uint8_t month;
    uint8_t date;
    uint8_t day_of_week;
    uint8_t hour;
    uint8_t minute;
    uint8_t second;
    uint16_t factor_asyn;
    uint16_t factor_syn;
    uint32_t am_pm;
    uint32_t display_format;
} rtc_parameter_struct;


typedef struct {
    uint32_t alarm_mask;
    uint32_t weekday_or_date;
    uint8_t alarm_day;
    uint8_t alarm_hour;
    uint8_t alarm_minute;
    uint8_t alarm_second;
    uint32_t am_pm;
} rtc_alarm_struct;


typedef struct {
    uint8_t timestamp_month;
    uint8_t timestamp_date;
    uint8_t timestamp_day;
    uint8_t timestamp_hour;
    uint8_t timestamp_minute;
    uint8_t timestamp_second;
    uint32_t am_pm;
} rtc_timestamp_struct;
# 403 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_rtc.h"
typedef enum {
    RTC_INT_TIMESTAMP = ((uint32_t)((uint32_t)((uint32_t)0x01U<<(15)))),
    RTC_INT_ALARM0 = ((uint32_t)((uint32_t)((uint32_t)0x01U<<(12)))),
} rtc_interrupt_flag_enum;


typedef enum {
    RTC_FLAG_ALARM0W = ((uint32_t)((uint32_t)((uint32_t)0x01U<<(0)))),
    RTC_FLAG_SOP = ((uint32_t)((uint32_t)((uint32_t)0x01U<<(3))) ),
    RTC_FLAG_YCM = ((uint32_t)((uint32_t)((uint32_t)0x01U<<(4))) ),
    RTC_FLAG_RSYN = ((uint32_t)((uint32_t)((uint32_t)0x01U<<(5))) ),
    RTC_FLAG_INIT = ((uint32_t)((uint32_t)((uint32_t)0x01U<<(6))) ),
    RTC_FLAG_SCP = ((uint32_t)((uint32_t)((uint32_t)0x01U<<(3))) ),
    RTC_FLAG_ALARM0 = ((uint32_t)((uint32_t)((uint32_t)0x01U<<(8))) ),
    RTC_FLAG_TS = ((uint32_t)((uint32_t)((uint32_t)0x01U<<(11))) ),
    RTC_FLAG_TSOVR = ((uint32_t)((uint32_t)((uint32_t)0x01U<<(12))) ),
} rtc_flag_enum;
# 431 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_rtc.h"
void rtc_bypass_shadow_enable(void);

void rtc_bypass_shadow_disable(void);

ErrStatus rtc_register_sync_wait(void);


void rtc_alarm_enable(void);

ErrStatus rtc_alarm_disable(void);


void rtc_alarm_config(rtc_alarm_struct *rtc_alarm_time);

void rtc_alarm_subsecond_config(uint32_t mask_subsecond, uint32_t subsecond);

void rtc_alarm_get(rtc_alarm_struct *rtc_alarm_time);

uint32_t rtc_alarm_subsecond_get(void);


ErrStatus rtc_init_mode_enter(void);

ErrStatus rtc_init(rtc_parameter_struct *rtc_initpara_struct);

void rtc_init_mode_exit(void);


void rtc_current_time_get(rtc_parameter_struct *rtc_initpara_struct);

uint32_t rtc_subsecond_get(void);


ErrStatus rtc_deinit(void);


void rtc_hour_adjust(uint32_t operation);

ErrStatus rtc_second_adjust(uint32_t add, uint32_t minus);


ErrStatus rtc_refclock_detection_enable(void);

ErrStatus rtc_refclock_detection_disable(void);


ErrStatus rtc_smooth_calibration_config(uint32_t window, uint32_t plus, uint32_t smooth_minus);



void rtc_timestamp_enable(uint32_t edge);

void rtc_timestamp_disable(void);

void rtc_timestamp_get(rtc_timestamp_struct *rtc_timestamp);

uint32_t rtc_timestamp_subsecond_get(void);

void rtc_calibration_output_config(uint32_t source);

void rtc_alarm_output_config(uint32_t alarm_output, uint32_t mode);

void rtc_output_pin_select(uint32_t outputpin);


void rtc_interrupt_enable(rtc_interrupt_flag_enum interrupt);

void rtc_interrupt_disable(rtc_interrupt_flag_enum interrupt);

FlagStatus rtc_flag_get(rtc_flag_enum flag);

void rtc_flag_clear(rtc_flag_enum flag_clear);
# 52 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_spi.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_spi.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_spi.h" 2
# 135 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_spi.h"
typedef struct {
    uint32_t device_mode;
    uint32_t trans_mode;
    uint32_t frame_size;
    uint32_t nss;
    uint32_t endian;
    uint32_t clock_polarity_phase;
    uint32_t prescale;
} spi_parameter_struct;
# 326 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_spi.h"
void spi_i2s_deinit(uint32_t spi_periph);

void spi_struct_para_init(spi_parameter_struct *spi_struct);

ErrStatus spi_init(uint32_t spi_periph, spi_parameter_struct *spi_struct);

void spi_enable(uint32_t spi_periph);

void spi_disable(uint32_t spi_periph);


void i2s_init(uint32_t spi_periph, uint32_t i2s_mode, uint32_t i2s_standard, uint32_t i2s_ckpl);

void i2s_psc_config(uint32_t spi_periph, uint32_t i2s_audiosample, uint32_t i2s_frameformat, uint32_t i2s_mckout);

void i2s_enable(uint32_t spi_periph);

void i2s_disable(uint32_t spi_periph);



void spi_nss_output_enable(uint32_t spi_periph);

void spi_nss_output_disable(uint32_t spi_periph);

void spi_nss_internal_high(uint32_t spi_periph);

void spi_nss_internal_low(uint32_t spi_periph);



void spi_dma_enable(uint32_t spi_periph, uint8_t dma);

void spi_dma_disable(uint32_t spi_periph, uint8_t dma);

void spi_transmit_odd_config(uint32_t spi_periph, uint16_t odd);

void spi_receive_odd_config(uint32_t spi_periph, uint16_t odd);

void spi_fifo_access_size_config(uint32_t spi_periph, uint16_t fifo_access_size);



ErrStatus spi_i2s_data_frame_format_config(uint32_t spi_periph, uint16_t frame_format);

void spi_bidirectional_transfer_config(uint32_t spi_periph, uint32_t transfer_direction);

void spi_i2s_data_transmit(uint32_t spi_periph, uint16_t data);

uint16_t spi_i2s_data_receive(uint32_t spi_periph);



void spi_crc_polynomial_set(uint32_t spi_periph, uint16_t crc_poly);

uint16_t spi_crc_polynomial_get(uint32_t spi_periph);

void spi_crc_length_set(uint32_t spi_periph, uint16_t crc_length);

void spi_crc_on(uint32_t spi_periph);

void spi_crc_off(uint32_t spi_periph);

void spi_crc_next(uint32_t spi_periph);

uint16_t spi_crc_get(uint32_t spi_periph, uint8_t crc);

void spi_crc_error_clear(uint32_t spi_periph);



void spi_ti_mode_enable(uint32_t spi_periph);

void spi_ti_mode_disable(uint32_t spi_periph);



void spi_nssp_mode_enable(uint32_t spi_periph);

void spi_nssp_mode_disable(uint32_t spi_periph);



void spi_quad_enable(uint32_t spi_periph);

void spi_quad_disable(uint32_t spi_periph);

void spi_quad_write_enable(uint32_t spi_periph);

void spi_quad_read_enable(uint32_t spi_periph);

void spi_quad_io23_output_enable(uint32_t spi_periph);

void spi_quad_io23_output_disable(uint32_t spi_periph);



void spi_i2s_format_error_clear(uint32_t spi_periph, uint32_t flag);

FlagStatus spi_i2s_flag_get(uint32_t spi_periph, uint32_t flag);

void spi_i2s_interrupt_enable(uint32_t spi_periph, uint8_t interrupt);

void spi_i2s_interrupt_disable(uint32_t spi_periph, uint8_t interrupt);

FlagStatus spi_i2s_interrupt_flag_get(uint32_t spi_periph, uint8_t interrupt);
# 53 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_syscfg.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_syscfg.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_syscfg.h" 2
# 278 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_syscfg.h"
void syscfg_deinit(void);


void syscfg_i2c_fast_mode_plus_enable(uint32_t syscfg_gpio);

void syscfg_i2c_fast_mode_plus_disable(uint32_t syscfg_gpio);


void syscfg_pin_remap_enable(uint32_t remap_pin);

void syscfg_pin_remap_disable(uint32_t remap_pin);


uint8_t syscfg_bootmode_get(void);


void syscfg_exti_line_config(uint8_t exti_port, uint8_t exti_pin);


void syscfg_lockup_enable(uint32_t lockup);


uint32_t syscfg_sram_ecc_single_correctable_bit_get(void);

uint32_t syscfg_sram_ecc_error_address_get(void);


void syscfg_irq_latency_set(uint32_t irq_latency);


void syscfg_interrupt_enable(uint32_t interrupt);

void syscfg_interrupt_disable(uint32_t interrupt);

FlagStatus syscfg_interrupt_flag_get(uint32_t flag);

void syscfg_interrupt_flag_clear(uint32_t flag);
# 54 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_timer.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_timer.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_timer.h" 2
# 285 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_timer.h"
typedef struct {
    uint16_t prescaler;
    uint16_t alignedmode;
    uint16_t counterdirection;
    uint32_t period;
    uint16_t clockdivision;
    uint16_t repetitioncounter;
} timer_parameter_struct;


typedef struct
{
    uint16_t runoffstate;
    uint16_t ideloffstate;
    uint16_t deadtime;
    uint16_t breakpolarity;
    uint16_t outputautostate;
    uint16_t protectmode;
    uint32_t break0state;
    uint32_t break0filter;
    uint32_t break0polarity;
    uint32_t break1state;
    uint32_t break1filter;
    uint32_t break1polarity;
}timer_break_parameter_struct;


typedef struct
{
    uint16_t outputstate;
    uint16_t outputnstate;
    uint16_t ocpolarity;
    uint16_t ocnpolarity;
    uint16_t ocidlestate;
    uint16_t ocnidlestate;
}timer_oc_parameter_struct;


typedef struct {
    uint16_t icpolarity;
    uint16_t icselection;
    uint16_t icprescaler;
    uint16_t icfilter;
} timer_ic_parameter_struct;
# 675 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_timer.h"
void timer_deinit(uint32_t timer_periph);

void timer_struct_para_init(timer_parameter_struct *initpara);

void timer_init(uint32_t timer_periph, timer_parameter_struct *initpara);

void timer_enable(uint32_t timer_periph);

void timer_disable(uint32_t timer_periph);

void timer_auto_reload_shadow_enable(uint32_t timer_periph);

void timer_auto_reload_shadow_disable(uint32_t timer_periph);

void timer_update_event_enable(uint32_t timer_periph);

void timer_update_event_disable(uint32_t timer_periph);

void timer_counter_alignment(uint32_t timer_periph, uint16_t aligned);

void timer_counter_up_direction(uint32_t timer_periph);

void timer_counter_down_direction(uint32_t timer_periph);


void timer_prescaler_config(uint32_t timer_periph, uint16_t prescaler, uint32_t pscreload);

void timer_repetition_value_config(uint32_t timer_periph, uint16_t repetition);

void timer_autoreload_value_config(uint32_t timer_periph, uint16_t autoreload);

void timer_counter_value_config(uint32_t timer_periph, uint16_t counter);

uint16_t timer_counter_read(uint32_t timer_periph);

uint16_t timer_prescaler_read(uint32_t timer_periph);

void timer_single_pulse_mode_config(uint32_t timer_periph, uint32_t spmode);

void timer_update_source_config(uint32_t timer_periph, uint32_t update);



void timer_dma_enable(uint32_t timer_periph, uint16_t dma);

void timer_dma_disable(uint32_t timer_periph, uint16_t dma);

void timer_channel_dma_request_source_select(uint32_t timer_periph, uint32_t dma_request);

void timer_dma_transfer_config(uint32_t timer_periph, uint32_t dma_baseaddr, uint32_t dma_lenth);

void timer_event_software_generate(uint32_t timer_periph, uint32_t event);



void timer_break_struct_para_init(timer_break_parameter_struct* breakpara);

void timer_break_config(uint32_t timer_periph, timer_break_parameter_struct* breakpara);

void timer_break_enable(uint32_t timer_periph, uint16_t break_num);

void timer_break_disable(uint32_t timer_periph, uint16_t break_num);

void timer_automatic_output_enable(uint32_t timer_periph);

void timer_automatic_output_disable(uint32_t timer_periph);

void timer_primary_output_config(uint32_t timer_periph, ControlStatus newvalue);

void timer_channel_control_shadow_config(uint32_t timer_periph, ControlStatus newvalue);

void timer_channel_control_shadow_update_config(uint32_t timer_periph, uint32_t ccuctl);



void timer_channel_output_struct_para_init(timer_oc_parameter_struct *ocpara);

void timer_channel_output_config(uint32_t timer_periph, uint16_t channel, timer_oc_parameter_struct *ocpara);

void timer_channel_output_mode_config(uint32_t timer_periph, uint16_t channel, uint32_t ocmode);

void timer_channel_combined_3_phase_pwm_config(uint32_t timer_periph, uint16_t channel, uint32_t state);

void timer_channel_output_pulse_value_config(uint32_t timer_periph, uint16_t channel, uint32_t pulse);

void timer_channel_output_shadow_config(uint32_t timer_periph, uint16_t channel, uint16_t ocshadow);

void timer_channel_output_fast_config(uint32_t timer_periph, uint16_t channel, uint16_t ocfast);

void timer_channel_output_clear_config(uint32_t timer_periph, uint16_t channel, uint16_t occlear);

void timer_channel_output_polarity_config(uint32_t timer_periph, uint16_t channel, uint16_t ocpolarity);

void timer_channel_complementary_output_polarity_config(uint32_t timer_periph, uint16_t channel, uint16_t ocnpolarity);

void timer_channel_output_state_config(uint32_t timer_periph, uint16_t channel, uint32_t state);

void timer_channel_complementary_output_state_config(uint32_t timer_periph, uint16_t channel, uint16_t ocnstate);



void timer_channel_input_struct_para_init(timer_ic_parameter_struct *icpara);

void timer_input_capture_config(uint32_t timer_periph, uint16_t channel, timer_ic_parameter_struct *icpara);

void timer_channel_input_capture_prescaler_config(uint32_t timer_periph, uint16_t channel, uint16_t prescaler);

uint16_t timer_channel_capture_value_register_read(uint32_t timer_periph, uint16_t channel);

void timer_input_pwm_capture_config(uint32_t timer_periph, uint16_t channel, timer_ic_parameter_struct *icpwm);

void timer_hall_mode_config(uint32_t timer_periph, uint32_t hallmode);



void timer_input_trigger_source_select(uint32_t timer_periph, uint32_t intrigger);

void timer_master_output_trigger_source_select(uint32_t timer_periph, uint32_t outtrigger);

void timer_slave_mode_select(uint32_t timer_periph, uint32_t slavemode);

void timer_master_slave_mode_config(uint32_t timer_periph, uint32_t masterslave);

void timer_external_trigger_config(uint32_t timer_periph, uint32_t extprescaler, uint32_t extpolarity, uint32_t extfilter);

void timer_quadrature_decoder_mode_config(uint32_t timer_periph, uint32_t decomode, uint16_t ic0polarity, uint16_t ic1polarity);

void timer_internal_clock_config(uint32_t timer_periph);

void timer_internal_trigger_as_external_clock_config(uint32_t timer_periph, uint32_t intrigger);

void timer_external_trigger_as_external_clock_config(uint32_t timer_periph, uint32_t extrigger, uint16_t extpolarity, uint32_t extfilter);

void timer_external_clock_mode0_config(uint32_t timer_periph, uint32_t extprescaler, uint32_t extpolarity, uint32_t extfilter);

void timer_external_clock_mode1_config(uint32_t timer_periph, uint32_t extprescaler, uint32_t extpolarity, uint32_t extfilter);

void timer_external_clock_mode1_disable(uint32_t timer_periph);

void timer_input_selection_config(uint32_t timer_periph, uint16_t channel, uint16_t insel);


void timer_write_chxval_register_config(uint32_t timer_periph, uint16_t ccsel);

void timer_output_value_selection_config(uint32_t timer_periph, uint16_t outsel);

void timer_break_external_source_config(uint32_t timer_periph, uint16_t break_num, ControlStatus newvalue);


void timer_break_external_polarity_config(uint32_t timer_periph, uint16_t break_num, uint16_t bkinpolarity);

void timer_eti_source_selection_config(uint32_t timer_periph, uint32_t eti_source);



FlagStatus timer_flag_get(uint32_t timer_periph, uint32_t flag);

void timer_flag_clear(uint32_t timer_periph, uint32_t flag);

void timer_interrupt_enable(uint32_t timer_periph, uint32_t interrupt);

void timer_interrupt_disable(uint32_t timer_periph, uint32_t interrupt);

FlagStatus timer_interrupt_flag_get(uint32_t timer_periph, uint32_t int_flag);

void timer_interrupt_flag_clear(uint32_t timer_periph, uint32_t int_flag);
# 55 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_usart.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_usart.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1.h" 1
# 39 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_usart.h" 2
# 219 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_usart.h"
typedef enum {

    USART_FLAG_REA = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(22U)),
    USART_FLAG_TEA = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(21U)),
    USART_FLAG_WU = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(20U)),
    USART_FLAG_RWU = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(19U)),
    USART_FLAG_SB = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(18U)),
    USART_FLAG_AM = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(17U)),
    USART_FLAG_BSY = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(16U)),
    USART_FLAG_ABDF = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(15U)),
    USART_FLAG_ABDE = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(14U)),
    USART_FLAG_EB = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(12U)),
    USART_FLAG_RT = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(11U)),
    USART_FLAG_CTS = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(10U)),
    USART_FLAG_CTSF = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(9U)),
    USART_FLAG_LBD = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(8U)),
    USART_FLAG_TBE = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(7U)),
    USART_FLAG_TC = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(6U)),
    USART_FLAG_RBNE = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(5U)),
    USART_FLAG_IDLE = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(4U)),
    USART_FLAG_ORERR = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(3U)),
    USART_FLAG_NERR = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(2U)),
    USART_FLAG_FERR = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(1U)),
    USART_FLAG_PERR = (((uint32_t)(((uint32_t)0x0000001CU)) << 6) | (uint32_t)(0U)),

    USART_FLAG_EPERR = (((uint32_t)(((uint32_t)0x000000C0U)) << 6) | (uint32_t)(8U)),

    USART_FLAG_RFFINT = (((uint32_t)(((uint32_t)0x000000D0U)) << 6) | (uint32_t)(15U)),
    USART_FLAG_RFF = (((uint32_t)(((uint32_t)0x000000D0U)) << 6) | (uint32_t)(11U)),
    USART_FLAG_RFE = (((uint32_t)(((uint32_t)0x000000D0U)) << 6) | (uint32_t)(10U))
} usart_flag_enum;


typedef enum {

    USART_INT_FLAG_EB = (((uint32_t)(((uint32_t)0x0000001CU)) << 22) | (uint32_t)((12U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(27U))),
    USART_INT_FLAG_RT = (((uint32_t)(((uint32_t)0x0000001CU)) << 22) | (uint32_t)((11U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(26U))),
    USART_INT_FLAG_AM = (((uint32_t)(((uint32_t)0x0000001CU)) << 22) | (uint32_t)((17U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(14U))),
    USART_INT_FLAG_PERR = (((uint32_t)(((uint32_t)0x0000001CU)) << 22) | (uint32_t)((0U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(8U))),
    USART_INT_FLAG_TBE = (((uint32_t)(((uint32_t)0x0000001CU)) << 22) | (uint32_t)((7U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(7U))),
    USART_INT_FLAG_TC = (((uint32_t)(((uint32_t)0x0000001CU)) << 22) | (uint32_t)((6U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(6U))),
    USART_INT_FLAG_RBNE = (((uint32_t)(((uint32_t)0x0000001CU)) << 22) | (uint32_t)((5U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(5U))),
    USART_INT_FLAG_RBNE_ORERR = (((uint32_t)(((uint32_t)0x0000001CU)) << 22) | (uint32_t)((3U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(5U))),
    USART_INT_FLAG_IDLE = (((uint32_t)(((uint32_t)0x0000001CU)) << 22) | (uint32_t)((4U) << 16) | (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(4U))),

    USART_INT_FLAG_LBD = (((uint32_t)(((uint32_t)0x0000001CU)) << 22) | (uint32_t)((8U) << 16) | (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(6U))),

    USART_INT_FLAG_WU = (((uint32_t)(((uint32_t)0x0000001CU)) << 22) | (uint32_t)((20U) << 16) | (((uint32_t)(((uint32_t)0x00000008U)) << 6) | (uint32_t)(22U))),
    USART_INT_FLAG_CTS = (((uint32_t)(((uint32_t)0x0000001CU)) << 22) | (uint32_t)((9U) << 16) | (((uint32_t)(((uint32_t)0x00000008U)) << 6) | (uint32_t)(10U))),
    USART_INT_FLAG_ERR_NERR = (((uint32_t)(((uint32_t)0x0000001CU)) << 22) | (uint32_t)((2U) << 16) | (((uint32_t)(((uint32_t)0x00000008U)) << 6) | (uint32_t)(0U))),
    USART_INT_FLAG_ERR_ORERR = (((uint32_t)(((uint32_t)0x0000001CU)) << 22) | (uint32_t)((3U) << 16) | (((uint32_t)(((uint32_t)0x00000008U)) << 6) | (uint32_t)(0U))),
    USART_INT_FLAG_ERR_FERR = (((uint32_t)(((uint32_t)0x0000001CU)) << 22) | (uint32_t)((1U) << 16) | (((uint32_t)(((uint32_t)0x00000008U)) << 6) | (uint32_t)(0U))),

    USART_INT_FLAG_RFF = (((uint32_t)(((uint32_t)0x000000D0U)) << 22) | (uint32_t)((15U) << 16) | (((uint32_t)(((uint32_t)0x000000D0U)) << 6) | (uint32_t)(9U)))
} usart_interrupt_flag_enum;


typedef enum {

    USART_INT_EB = (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(27U)),
    USART_INT_RT = (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(26U)),
    USART_INT_AM = (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(14U)),
    USART_INT_PERR = (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(8U)),
    USART_INT_TBE = (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(7U)),
    USART_INT_TC = (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(6U)),
    USART_INT_RBNE = (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(5U)),
    USART_INT_IDLE = (((uint32_t)(((uint32_t)0x00000000U)) << 6) | (uint32_t)(4U)),

    USART_INT_LBD = (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(6U)),

    USART_INT_WU = (((uint32_t)(((uint32_t)0x00000008U)) << 6) | (uint32_t)(22U)),
    USART_INT_CTS = (((uint32_t)(((uint32_t)0x00000008U)) << 6) | (uint32_t)(10U)),
    USART_INT_ERR = (((uint32_t)(((uint32_t)0x00000008U)) << 6) | (uint32_t)(0U)),

    USART_INT_RFF = (((uint32_t)(((uint32_t)0x000000D0U)) << 6) | (uint32_t)(9U))
} usart_interrupt_enum;


typedef enum {

    USART_DINV_ENABLE = 0,
    USART_DINV_DISABLE,

    USART_TXPIN_ENABLE,
    USART_TXPIN_DISABLE,

    USART_RXPIN_ENABLE,
    USART_RXPIN_DISABLE,

    USART_SWAP_ENABLE,
    USART_SWAP_DISABLE
} usart_invert_enum;
# 442 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_usart.h"
void usart_deinit(uint32_t usart_periph);

void usart_baudrate_set(uint32_t usart_periph, uint32_t baudval);

void usart_parity_config(uint32_t usart_periph, uint32_t paritycfg);

void usart_word_length_set(uint32_t usart_periph, uint32_t wlen);

void usart_stop_bit_set(uint32_t usart_periph, uint32_t stblen);

void usart_enable(uint32_t usart_periph);

void usart_disable(uint32_t usart_periph);

void usart_transmit_config(uint32_t usart_periph, uint32_t txconfig);

void usart_receive_config(uint32_t usart_periph, uint32_t rxconfig);



void usart_data_first_config(uint32_t usart_periph, uint32_t msbf);

void usart_invert_config(uint32_t usart_periph, usart_invert_enum invertpara);

void usart_overrun_enable(uint32_t usart_periph);

void usart_overrun_disable(uint32_t usart_periph);

void usart_oversample_config(uint32_t usart_periph, uint32_t oversamp);

void usart_sample_bit_config(uint32_t usart_periph, uint32_t osb);

void usart_receiver_timeout_enable(uint32_t usart_periph);

void usart_receiver_timeout_disable(uint32_t usart_periph);

void usart_receiver_timeout_threshold_config(uint32_t usart_periph, uint32_t rtimeout);

void usart_data_transmit(uint32_t usart_periph, uint16_t data);

uint16_t usart_data_receive(uint32_t usart_periph);

void usart_command_enable(uint32_t usart_periph, uint32_t cmdtype);



void usart_autobaud_detection_enable(uint32_t usart_periph);

void usart_autobaud_detection_disable(uint32_t usart_periph);

void usart_autobaud_detection_mode_config(uint32_t usart_periph, uint32_t abdmod);



void usart_address_config(uint32_t usart_periph, uint8_t addr);

void usart_address_detection_mode_config(uint32_t usart_periph, uint32_t addmod);

void usart_mute_mode_enable(uint32_t usart_periph);

void usart_mute_mode_disable(uint32_t usart_periph);

void usart_mute_mode_wakeup_config(uint32_t usart_periph, uint32_t wmethod);



void usart_lin_mode_enable(uint32_t usart_periph);

void usart_lin_mode_disable(uint32_t usart_periph);

void usart_lin_break_detection_length_config(uint32_t usart_periph, uint32_t lblen);



void usart_halfduplex_enable(uint32_t usart_periph);

void usart_halfduplex_disable(uint32_t usart_periph);



void usart_clock_enable(uint32_t usart_periph);

void usart_clock_disable(uint32_t usart_periph);

void usart_synchronous_clock_config(uint32_t usart_periph, uint32_t clen, uint32_t cph, uint32_t cpl);



void usart_guard_time_config(uint32_t usart_periph, uint8_t guat);

void usart_smartcard_mode_enable(uint32_t usart_periph);

void usart_smartcard_mode_disable(uint32_t usart_periph);

void usart_smartcard_mode_nack_enable(uint32_t usart_periph);

void usart_smartcard_mode_nack_disable(uint32_t usart_periph);

void usart_smartcard_mode_early_nack_enable(uint32_t usart_periph);

void usart_smartcard_mode_early_nack_disable(uint32_t usart_periph);

void usart_smartcard_autoretry_config(uint32_t usart_periph, uint8_t scrtnum);

void usart_block_length_config(uint32_t usart_periph, uint8_t bl);



void usart_irda_mode_enable(uint32_t usart_periph);

void usart_irda_mode_disable(uint32_t usart_periph);

void usart_prescaler_config(uint32_t usart_periph, uint8_t psc);

void usart_irda_lowpower_config(uint32_t usart_periph, uint32_t irlp);



void usart_hardware_flow_rts_config(uint32_t usart_periph, uint32_t rtsconfig);

void usart_hardware_flow_cts_config(uint32_t usart_periph, uint32_t ctsconfig);



void usart_hardware_flow_coherence_config(uint32_t usart_periph, uint32_t hcm);


void usart_rs485_driver_enable(uint32_t usart_periph);

void usart_rs485_driver_disable(uint32_t usart_periph);

void usart_driver_assertime_config(uint32_t usart_periph, uint8_t deatime);

void usart_driver_deassertime_config(uint32_t usart_periph, uint8_t dedtime);

void usart_depolarity_config(uint32_t usart_periph, uint32_t dep);



void usart_dma_receive_config(uint32_t usart_periph, uint32_t dmacmd);

void usart_dma_transmit_config(uint32_t usart_periph, uint32_t dmacmd);

void usart_reception_error_dma_disable(uint32_t usart_periph);

void usart_reception_error_dma_enable(uint32_t usart_periph);


void usart_wakeup_enable(uint32_t usart_periph);

void usart_wakeup_disable(uint32_t usart_periph);

void usart_wakeup_mode_config(uint32_t usart_periph, uint32_t wum);



void usart_receive_fifo_enable(uint32_t usart_periph);

void usart_receive_fifo_disable(uint32_t usart_periph);

uint8_t usart_receive_fifo_counter_number(uint32_t usart_periph);



FlagStatus usart_flag_get(uint32_t usart_periph, usart_flag_enum flag);

void usart_flag_clear(uint32_t usart_periph, usart_flag_enum flag);

void usart_interrupt_enable(uint32_t usart_periph, usart_interrupt_enum interrupt);

void usart_interrupt_disable(uint32_t usart_periph, usart_interrupt_enum interrupt);

FlagStatus usart_interrupt_flag_get(uint32_t usart_periph, usart_interrupt_flag_enum int_flag);

void usart_interrupt_flag_clear(uint32_t usart_periph, usart_interrupt_flag_enum int_flag);
# 56 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_wwdgt.h" 1
# 57 "../app\\gd32c2x1_libopt.h" 2
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1_err_report.h" 1
# 37 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1_err_report.h"
# 1 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include/gd32c2x1.h" 1
# 38 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1_err_report.h" 2
# 77 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include\\gd32c2x1_err_report.h"
typedef struct {

    uint16_t moduleid;

    uint16_t apiid;

    uint8_t errid;
} err_report_struct;

extern err_report_struct err_report_buffer[];

extern uint8_t err_report_buff_index;


void fw_debug_report_err(uint16_t moduleid, uint16_t apiid, uint8_t errid);
# 58 "../app\\gd32c2x1_libopt.h" 2
# 213 "../std/GD32C2x1_Firmware_Library/CMSIS/GD/GD32C2x1/Include/gd32c2x1.h" 2
# 40 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_wwdgt.h" 2
# 87 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Include\\gd32c2x1_wwdgt.h"
void wwdgt_deinit(void);

void wwdgt_enable(void);


void wwdgt_prescaler_value_config(uint32_t prescaler);

void wwdgt_window_value_config(uint16_t window);

void wwdgt_counter_update(uint16_t counter_value);

void wwdgt_config(uint16_t counter, uint16_t window, uint32_t prescaler);


FlagStatus wwdgt_flag_get(void);

void wwdgt_flag_clear(void);

void wwdgt_interrupt_enable(void);
# 36 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Source/gd32c2x1_wwdgt.c" 2
# 45 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Source/gd32c2x1_wwdgt.c"
void wwdgt_deinit(void)
{
    rcu_periph_reset_enable(RCU_WWDGTRST);
    rcu_periph_reset_disable(RCU_WWDGTRST);
}







void wwdgt_enable(void)
{
    (*(volatile uint32_t *)(uint32_t)(((((uint32_t)0x40000000U) + 0x00002C00U)) + 0x00000000U)) |= ((uint32_t)((uint32_t)0x01U<<(7)));
}
# 83 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Source/gd32c2x1_wwdgt.c"
void wwdgt_prescaler_value_config(uint32_t prescaler)
{
    uint32_t reg_cfg;


    reg_cfg = (*(volatile uint32_t *)(uint32_t)(((((uint32_t)0x40000000U) + 0x00002C00U)) + 0x00000004U)) & (~(((0xFFFFFFFFUL << (uint8_t)(7)) & (0xFFFFFFFFUL >> (31U - (uint8_t)(8)))) | ((0xFFFFFFFFUL << (uint8_t)(16)) & (0xFFFFFFFFUL >> (31U - (uint8_t)(17))))));

    reg_cfg |= (uint32_t)(prescaler & ((uint32_t)0x00030180U));
    (*(volatile uint32_t *)(uint32_t)(((((uint32_t)0x40000000U) + 0x00002C00U)) + 0x00000004U)) = (uint32_t)reg_cfg;
}







void wwdgt_window_value_config(uint16_t window)
{
    uint32_t reg_cfg;


    reg_cfg = (*(volatile uint32_t *)(uint32_t)(((((uint32_t)0x40000000U) + 0x00002C00U)) + 0x00000004U)) & (~((0xFFFFFFFFUL << (uint8_t)(0)) & (0xFFFFFFFFUL >> (31U - (uint8_t)(6)))));

    reg_cfg |= (uint32_t)(window & ((0xFFFFFFFFUL << (uint8_t)(0)) & (0xFFFFFFFFUL >> (31U - (uint8_t)(6)))));
    (*(volatile uint32_t *)(uint32_t)(((((uint32_t)0x40000000U) + 0x00002C00U)) + 0x00000004U)) = (uint32_t)reg_cfg;
}







void wwdgt_counter_update(uint16_t counter_value)
{
    (*(volatile uint32_t *)(uint32_t)(((((uint32_t)0x40000000U) + 0x00002C00U)) + 0x00000000U)) = (uint32_t)((((0xFFFFFFFFUL << (uint8_t)(0)) & (0xFFFFFFFFUL >> (31U - (uint8_t)(6)))) & ((uint32_t)(counter_value) << 0)));
}
# 145 "../std/GD32C2x1_Firmware_Library/GD32C2x1_standard_peripheral/Source/gd32c2x1_wwdgt.c"
void wwdgt_config(uint16_t counter, uint16_t window, uint32_t prescaler)
{
    (*(volatile uint32_t *)(uint32_t)(((((uint32_t)0x40000000U) + 0x00002C00U)) + 0x00000000U)) = (uint32_t)((((0xFFFFFFFFUL << (uint8_t)(0)) & (0xFFFFFFFFUL >> (31U - (uint8_t)(6)))) & ((uint32_t)(counter) << 0)));
    (*(volatile uint32_t *)(uint32_t)(((((uint32_t)0x40000000U) + 0x00002C00U)) + 0x00000004U)) = (uint32_t)((((0xFFFFFFFFUL << (uint8_t)(0)) & (0xFFFFFFFFUL >> (31U - (uint8_t)(6)))) & ((uint32_t)(window) << 0)) | (prescaler & ((uint32_t)0x00030180U)));
}







FlagStatus wwdgt_flag_get(void)
{
    FlagStatus wwdgt_flag = RESET;
    if((uint32_t)RESET != ((*(volatile uint32_t *)(uint32_t)(((((uint32_t)0x40000000U) + 0x00002C00U)) + 0x00000008U)) & ((uint32_t)((uint32_t)0x01U<<(0))))) {
        wwdgt_flag = SET;
    }
    return wwdgt_flag;
}







void wwdgt_flag_clear(void)
{
    (*(volatile uint32_t *)(uint32_t)(((((uint32_t)0x40000000U) + 0x00002C00U)) + 0x00000008U)) &= ~(uint32_t)(((uint32_t)((uint32_t)0x01U<<(0))));
}







void wwdgt_interrupt_enable(void)
{
    (*(volatile uint32_t *)(uint32_t)(((((uint32_t)0x40000000U) + 0x00002C00U)) + 0x00000004U)) |= ((uint32_t)((uint32_t)0x01U<<(9)));
}
