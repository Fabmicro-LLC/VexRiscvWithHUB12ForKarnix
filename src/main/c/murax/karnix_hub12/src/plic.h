#ifndef _PLIC_H_
#define _PLIC_H_

#include <stdio.h>
#include "soc.h"

typedef struct
{
  volatile uint32_t ENABLE;
  volatile uint32_t PENDING;
  volatile uint32_t IRQLINE;
  volatile uint32_t POLARITY;
  volatile uint32_t IRQLAST;
} PLIC_Reg;


#define	PLIC_IRQ_UART0	0x00000001
#define	PLIC_IRQ_UART1	0x00000002
#define	PLIC_IRQ_MAC	0x00000004
#define	PLIC_IRQ_TIMER0	0x00000008
#define	PLIC_IRQ_TIMER1	0x00000010
#define	PLIC_IRQ_I2C	0x00000020

static void plic_print_stats(void) {
	printf("PLIC: ENABLE = %p, PENDING = %p, POLARITY = %p, IRQLINE = %p, IRQLAST = %p\r\n", PLIC->ENABLE, PLIC->PENDING, PLIC->POLARITY, PLIC->IRQLINE, PLIC->IRQLAST);
}

#endif /* _PLIC_H_ */

