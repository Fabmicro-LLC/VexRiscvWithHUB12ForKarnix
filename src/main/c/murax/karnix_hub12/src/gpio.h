#ifndef GPIO_H_
#define GPIO_H_


typedef struct
{
  volatile uint32_t INPUT;
  volatile uint32_t OUTPUT;
  volatile uint32_t OUTPUT_ENABLE;
} Gpio_Reg;


#define	LED_R		1
#define	LED_G		0
#define	LED_B		2
#define	EEPROM_WP	3
#define	CONFIG_PIN	31	

#endif /* GPIO_H_ */


