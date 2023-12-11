#ifndef _MODBUS_RTU_H_
#define _MODBUS_RTU_H_

#include <stdint.h>

void modbus_rtu_init(void);
void modbus_rtu_isr(void);
void modbus_rtu_poll(void);

#endif //
