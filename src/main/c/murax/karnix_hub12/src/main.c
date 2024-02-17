#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "lwip/netif.h"
#include "soc.h"
#include "riscv.h"
#include "plic.h"
#include "mac.h"
#include "i2c.h"
#include "uart.h"
#include "utils.h"
#include "modbus_udp.h"
#include "modbus_rtu.h"
#include "eeprom.h"
#include "config.h"
#include "hub.h"


/* Below is some linker specific stuff */
extern unsigned int   _stack_start; /* Set by linker.  */
extern unsigned int   _stack_size; /* Set by linker.  */
extern unsigned int   trap_entry;
extern unsigned int   heap_start; /* programmer defined heap start */
extern unsigned int   heap_end; /* programmer defined heap end */

#define SRAM_SIZE       (512*1024)
#define SRAM_ADDR_BEGIN 0x90000000
#define SRAM_ADDR_END   (0x90000000 + SRAM_SIZE)

extern struct netif default_netif;

void println(const char*str);

volatile uint32_t reg_irq_counter = 0;
volatile uint32_t reg_sys_counter = 0;
volatile uint32_t reg_scratch = 0;
volatile uint32_t reg_config_write = 0;

volatile uint32_t uart_config_reset_counter = 0;
volatile uint32_t events_mac_poll = 0;
volatile uint32_t events_mac_rx = 0;
volatile uint32_t events_modbus_rtu_poll = 0;
volatile uint32_t events_modbus_rtu_rx = 0;

volatile uint32_t audiodac0_irqs = 0;
volatile uint32_t audiodac0_samples_sent = 0;

uint32_t deadbeef = 0;		// If not zero - we are in soft-start mode

void println(const char*str){
	print_uart0(str);
	print_uart0("\r\n");
}

char to_hex_nibble(char n)
{
	n &= 0x0f;

	if(n > 0x09)
		return n + 'A' - 0x0A;
	else
		return n + '0';
}

void to_hex(char*s , unsigned int n)
{
	for(int i = 0; i < 8; i++) {
		s[i] = to_hex_nibble(n >> (28 - i*4));
	}
	s[8] = 0;
}


#define SINE_TABLE_SIZE	80

const short sine_table[SINE_TABLE_SIZE] = {0, 5125, 10125, 14876, 19260, 23170, 26509, 29196,
	31163, 32364, 32767,  32364, 31163, 29196, 26509, 23170, 19260, 14876, 10125,
	5125, 0, -5126, -10126,-14877, -19261, -23171, -26510, -29197, -31164, -32365,
	-32768, -32365, -31164, -29197, -26510, -23171, -19261, -14877, -10126, -5126,

	0, 5125, 10125, 14876, 19260, 23170, 26509, 29196,
	31163, 32364, 32767,  32364, 31163, 29196, 26509, 23170, 19260, 14876, 10125,
	5125, 0, -5126, -10126,-14877, -19261, -23171, -26510, -29197, -31164, -32365,
	-32768, -32365, -31164, -29197, -26510, -23171, -19261, -14877, -10126, -5126};

const short saw_table[40] = {-32768, -31130, -29492, -27854, -26216, -24578, -22940, -21302, -19664, -18026,
       			     -16388, -14750, -13112, -11474, -9836, -8189, -6560, -4922, -3284, -1646,
		     	     -8, 1630, 3268, 4906, 6544, 8182, 9820, 11458, 13096, 14734, 16372, 18010, 19648,
			     21286, 22924, 24562, 25200, 27838, 29476, 31114 };	     


volatile unsigned long long t1, t2;


void process_and_wait(uint32_t us) {

	unsigned long long t0, t;

	t0 = get_mtime();

	while(1) {
		t = get_mtime();

		if(t - t0 >=us)
			break;

		// Process events

		if(events_modbus_rtu_poll) {
			modbus_rtu_poll(); 
			events_modbus_rtu_poll = 0;
		}

		if(events_modbus_rtu_rx) {
			modbus_rtu_rx(); 
			events_modbus_rtu_poll = 0;
		}

		if(events_mac_poll) {
			mac_poll();
			events_mac_poll = 0;
		}

		if(events_mac_rx) {
			mac_rx();
			events_mac_rx = 0;
		}
	}
}


// Test SRAM by writing shorts

/*
int sram_test_write_shorts(void) {
	volatile unsigned short *mem;
	unsigned short fill;
	int fails = 0;

	fill = 0;
	mem = (unsigned short*) SRAM_ADDR_BEGIN;

	printf("Filling mem at: %p, size: %d bytes... ", mem, SRAM_SIZE);

	while((unsigned int)mem < SRAM_ADDR_END) {
		*mem++ = fill++;
	}
	printf("Done\r\n");

	fill = 0;
	mem = (unsigned short*) SRAM_ADDR_BEGIN;

	printf("Checking mem at: %p, size: %d bytes... ", mem, SRAM_SIZE);

	while((unsigned int)mem < SRAM_ADDR_END) {
		if(*mem != fill) {
			printf("\r\nMem check failed at: %p, expected: %p, got: %p\r\n", mem, fill, *mem);
			fails++;
		} else {
			//printf("\r\nMem check OK     at: %p, expected: %p, got: %p\r\n", mem, fill, *mem);
		}
		mem++;
		fill++;
	}

	if((unsigned int)mem == SRAM_ADDR_END)
		printf("Done! Mem fails = %d\r\n", fails);

	return fails;
}
*/

int sram_test_write_random_ints(void) {
	volatile unsigned int *mem;
	unsigned int fill;
	int fails = 0;

	fill = 0xdeadbeef;
	mem = (unsigned int*) SRAM_ADDR_BEGIN;

	printf("Filling SRAM at: %p, size: %d bytes...\r\n", mem, SRAM_SIZE);

	while((unsigned int)mem < SRAM_ADDR_END) {
		*mem++ = fill;
		fill += 0xdeadbeef; // generate pseudo-random data
	}

	fill = 0xdeadbeef;
	mem = (unsigned int*) SRAM_ADDR_BEGIN;

	printf("Checking SRAM at: %p, size: %d bytes...\r\n", mem, SRAM_SIZE);

	while((unsigned int)mem < SRAM_ADDR_END) {
		if(*mem != fill) {
			printf("SRAM check failed at: %p, expected: %p, got: %p\r\n", mem, fill, *mem);
			fails++;
		} else {
			//printf("\r\nMem check OK     at: %p, expected: %p, got: %p\r\n", mem, fill, *mem);
		}
		mem++;
		fill += 0xdeadbeef; // generate pseudo-random data
	}

	if((unsigned int)mem == SRAM_ADDR_END)
		printf("SRAM Fails: %d\r\n", fails);

	return fails++;
}


void main() {

	unsigned int n;
	char str[128];

	csr_clear(mstatus, MSTATUS_MIE); // Disable Machine interrupts during hardware init

	init_sbrk(NULL, 0); // Initialize heap for malloc to use on-chip RAM

	delay_us(2000000); // Allow user to connect to debug uart

	if(deadbeef != 0) {
		print("Soft-start, performing hard reset!\r\n");
		hard_reboot();
	} else {
		deadbeef = 0xdeadbeef;
	}

	// Below prints global linker variables without using libc
	// Can be usful for debugging heal allocation issues 

/*
	to_hex(str, (unsigned int)&_ram_heap_start);
	print("Heap start: ");
	print(str);
	print("\r\n");

	to_hex(str, (unsigned int)&_ram_heap_end);
	print("Heap end: ");
	print(str);
	print("\r\n");

	to_hex(str, (unsigned int)sbrk_heap_end);
	print("Sbrk heap_end: ");
	print(str);
	print("\r\n");

	to_hex(str, (unsigned int)&_stack_start);
	print("Stack start: ");
	print(str);
	print("\r\n");

	to_hex(str, (unsigned int)&_stack_size);
	print("Stack size: ");
	print(str);
	print("\r\n");
*/

	printf("\r\n"
		"HUB-12/HUB-75 driver for Karnix ASB-254. Build %05d, date/time: " __DATE__ " " __TIME__ "\r\n"
		"Copyright (C) 2021-2023 Fabmicro, LLC., Tyumen, Russia.\r\n\r\n",
		BUILD_NUMBER
	);

	GPIO->OUTPUT |= (1 << LED_R); // LED_R is ON - indicate we are not yet ready

	printf("Hardware init\r\n");

	// Test SRAM and initialize heap for malloc to use SRAM if tested OK
	if(sram_test_write_random_ints() == 0) {
		printf("Enabling SRAM...\r\n");
		init_sbrk((unsigned int*)SRAM_ADDR_BEGIN, SRAM_SIZE);
		printf("SRAM %s!\r\n", "enabled"); 
		// If this prints, we are running with new heap all right
		// Note, that some garbage can be printed along, that's ok!
	} else {
		printf("SRAM %s!\r\n", "disabled"); 
	}

	// Disable HUB controller
	HUB0->CONTROL = 0;

	// Enable writes to EEPROM
	GPIO->OUTPUT &= ~(1 << EEPROM_WP); 

	// Configure interrupt controller 
	PLIC->POLARITY = 0x0000007f; // Configure PLIC IRQ polarity for UART0, UART1, MAC, I2C and AUDIODAC0 to Active High 
	PLIC->PENDING = 0; // Clear all pending IRQs
	PLIC->ENABLE = 0xffffffff; // Configure PLIC to enable interrupts from all possible IRQ lines

	// Configure UART0 IRQ sources: bit(0) - TX interrupts, bit(1) - RX interrupts 
	UART0->STATUS = (UART0->STATUS | UART_STATUS_RX_IRQ_EN); // Allow only RX interrupts 

	// Configure UART1 IRQ sources: bit(0) - TX interrupts, bit(1) - RX interrupts 
	UART1->STATUS = (UART1->STATUS | UART_STATUS_RX_IRQ_EN); // Allow only RX interrupts 

	// Configure RISC-V IRQ stuff
	//csr_write(mtvec, ((unsigned long)&trap_entry)); // Set IRQ handling vector

	// Setup TIMER0 to 100 ms timer for Mac: 25 MHz / 25 / 10000
	timer_prescaler(TIMER0, SYSTEM_CLOCK_HZ / 1000000);
	timer_run(TIMER0, 100000);

	// Setup TIMER0 to 50 ms timer for Modbus: 25 MHz / 25 / 10000
	timer_prescaler(TIMER1, SYSTEM_CLOCK_HZ / 1000000);
	timer_run(TIMER1, 50000);


	// I2C and EEPROM
	i2c_init(I2C0);
	

	// Reset to Factory Defaults if "***" sequence received from UART0

	csr_set(mstatus, MSTATUS_MIE); // Enable Machine interrupts during user input 

	fpurge(stdout);
	printf("Press '*' to reset config");
	fflush(stdout);

	for(int i = 0; i < 10; i++) {
		if(uart_config_reset_counter > 2) // has user typed *** on the console ?
			break;

		if((GPIO->INPUT & (1 << CONFIG_PIN)) == 0) // is CONFIG pin tied to ground ?
			break;

		putchar('.');
		fflush(stdout);
		delay_us(500000);
	}

	printf("\r\n");

	active_config = default_config; 

	if(uart_config_reset_counter > 2) {
		uart_config_reset_counter = 0;
		printf("Defaults loaded by %s!\r\n", "user request");
 	} else if((GPIO->INPUT & (1 << CONFIG_PIN)) == 0) {
		printf("Defaults loaded by %s!\r\n", "CONFIG pin");
	} else {
		if(eeprom_probe(I2C0) == 0) {
			if(config_load(&active_config) == 0) {
				printf("Config loaded from EEPROM\r\n");
			} else {
				active_config = default_config;
				printf("Defaults loaded by %s!\r\n", "EEPROM CRC ERROR");
			}
		} else {
			printf("Defaults loaded by %s!\r\n", "EEPROM malfunction");
		}
	} 


	csr_clear(mstatus, MSTATUS_MIE); // Disable Machine interrupts during hardware init

	// Intialize and configure HUB controller
	hub_init(active_config.hub_type);

	// Configure network stuff 
	mac_lwip_init(); // Initiazlier MAC controller and LWIP stack, also add network interface

	// Init and bind Modbus/UDP module to UDP port
	modbus_udp_init();


	// Setup serial paramenters for Modbus/RTU module
	modbus_rtu_init();
	
	// AUDIO DAC
	audiodac_init(AUDIODAC0, 16000);

	printf("Hardware init done\r\n");

	GPIO->OUTPUT &= ~((1 << LED_R) | (1 << LED_G) | (1 << LED_B)); // GPIO LEDs are OFF -all things are done well 

	csr_set(mstatus, MSTATUS_MIE); // Enable Machine interrupts



	// Dispay current Modbus and IP settings
	if(1) {
		char txt[32];
		int len;

		printf("Displaying network settings...\r\n");

		hub_print(6, 0, HUB_COLOR_WHITE, "MBus:", 5, font_6x8, 6, 8);

		len = sprintf(txt, "%d ", active_config.modbus_addr);
		hub_print(0, 8, HUB_COLOR_WHITE, txt, len, font_6x8, 6, 8);

    		process_and_wait(2000000); 

		uint8_t *ip = (uint8_t*) &(default_netif.ip_addr);
		hub_print(6, 0, HUB_COLOR_WHITE, "IP4:", 5, font_6x8, 6, 8);

		len = sprintf(txt, "%d  ", ip[0]);
		hub_print(0, 8, HUB_COLOR_WHITE, txt, len, font_6x8, 6, 8);
    		process_and_wait(2000000); 

		len = sprintf(txt, "%d  ", ip[1]);
		hub_print(0, 8, HUB_COLOR_WHITE, txt, len, font_6x8, 6, 8);
    		process_and_wait(2000000); 

		len = sprintf(txt, "%d  ", ip[2]);
		hub_print(0, 8, HUB_COLOR_WHITE, txt, len, font_6x8, 6, 8);
    		process_and_wait(2000000); 

		len = sprintf(txt, "%d  ", ip[3]);
		hub_print(0, 8, HUB_COLOR_WHITE, txt, len, font_6x8, 6, 8);
    		process_and_wait(2000000); 
	}

	memset((void*)HUB0->FB,  0, hub_frame_size); 

	short *ring_buffer = (short *)malloc(30000*2);

	if(ring_buffer) {
		audiodac0_start_playback(ring_buffer, 30000);
	} else {
		printf("Failed to allocate ring_buffer!\r\n");
	}

	while(1) {
		int audio_idx = 0;

		GPIO->OUTPUT |= (1 << LED_G); // LED_G is ON

    		process_and_wait(500000); 

		GPIO->OUTPUT &= ~(1 << LED_G); // LED_G is OFF

    		process_and_wait(500000); 


		if(1) {
			printf("HUB12/75 adapter build %05d: mode = HUB%d, hub_fb_size = %d, irqs = %d, sys_cnt = %d, scratch = %p, sbrk_heap_end = %p, audiodac0_samples_sent = %d, audiodac0_irqs = %d\r\n",
				BUILD_NUMBER,
				(HUB0->CONTROL & HUB_MASK_TYPE),
				hub_frame_size, reg_irq_counter, reg_sys_counter, reg_scratch, sbrk_heap_end, audiodac0_samples_sent, audiodac0_irqs);

			plic_print_stats();

			mac_print_stats();

		}
	
		//sram_test_write_shorts();
		//sram_test_write_random_ints();

		if(0) {
			for(int i = 0; i < 30000 / SINE_TABLE_SIZE; i++) {

				short audio_buf[SINE_TABLE_SIZE];
				int a;

				for(int j = 0; j < SINE_TABLE_SIZE; j++) {
					audio_buf[j] = sine_table[audio_idx];
					//audio_buf[j] = saw_table[audio_idx];
					audio_idx++;
					audio_idx %= SINE_TABLE_SIZE;
				}

				if((a = audiodac0_submit_buffer(audio_buf, SINE_TABLE_SIZE, DAC_NOT_ISR)) != SINE_TABLE_SIZE) {
				       	//printf("main: audiodac0_submit_buffer partial: %d (%d), i = %d\r\n", a, SINE_TABLE_SIZE, i);
					break;
				}
			}
		}

		reg_sys_counter++;

		if(reg_config_write)
			reg_config_write--;

		GPIO->OUTPUT &= ~(1 << LED_R); // LED_G is OFF - clear error indicator

	}
}



void timerInterrupt(void) {
	// Not supported on this machine
}


void externalInterrupt(void){

	if(PLIC->PENDING & PLIC_IRQ_UART0) { // UART0 is pending
		GPIO->OUTPUT |= (1 << LED_R); // LED_R is ON
		//printf("UART0: ");
		while(uart_readOccupancy(UART0)) {
			char c = UART0->DATA;
			uart_write(UART0, c);
			if(c == '*') {
				uart_config_reset_counter ++;
			} else {
				uart_config_reset_counter = 0;
			}
		}
		PLIC->PENDING &= ~PLIC_IRQ_UART0;
	}

	if(PLIC->PENDING & PLIC_IRQ_UART1) { // UART1 is pending
		//printf("UART1: %02X (%c)\r\n", c, c);
		events_modbus_rtu_rx++;
		PLIC->PENDING &= ~PLIC_IRQ_UART1;
	}

	if(PLIC->PENDING & PLIC_IRQ_MAC) { // MAC is pending
		//print("MAC IRQ\r\n");
		events_mac_rx++;
		PLIC->PENDING &= ~PLIC_IRQ_MAC;
	}

	if(PLIC->PENDING & PLIC_IRQ_TIMER0) { // Timer0 (for MAC) 
		//printf("TIMER0 IRQ\r\n");
		timer_run(TIMER0, 100000); // 100 ms timer
		events_mac_poll++;
		PLIC->PENDING &= ~PLIC_IRQ_TIMER0;
	}

	if(PLIC->PENDING & PLIC_IRQ_TIMER1) { // Timer1 (for Modbus RTU) 
		//print("TIMER1 IRQ\r\n");
		timer_run(TIMER1, 50000); // 50 ms timer
		events_modbus_rtu_poll++;
		PLIC->PENDING &= ~PLIC_IRQ_TIMER1;
	}

	if(PLIC->PENDING & PLIC_IRQ_I2C) { // I2C xmit complete 
		//print("I2C IRQ\r\n");
		PLIC->PENDING &= ~PLIC_IRQ_I2C;
	}

	if(PLIC->PENDING & PLIC_IRQ_AUDIODAC0) { // MAC is pending
		//print("AUDIODAC IRQ\r\n");
		audiodac0_irqs++;
		audiodac0_samples_sent += audiodac0_isr();
		PLIC->PENDING &= ~PLIC_IRQ_AUDIODAC0;
	}

}


static char crash_str[16];

void crash(int cause) {
	

	to_hex(crash_str, cause);

	print("\r\n*** TRAP: ");
	print(crash_str);
	print("\r\n");

}

void irqCallback() {

	// Interrupts are already disabled by machine

	reg_irq_counter++;

	int32_t mcause = csr_read(mcause);
	int32_t interrupt = mcause < 0;    //Interrupt if true, exception if false
	int32_t cause     = mcause & 0xF;
	if(interrupt){
		switch(cause) {
			case CAUSE_MACHINE_TIMER: timerInterrupt(); break;
			case CAUSE_MACHINE_EXTERNAL: externalInterrupt(); break;
			default: crash(2); break;
		}
	} else {
		crash(1);
	}


	//if((reg_irq_counter & 0xff) == 0) { 
	//	printf("IRQ COUNTER: %d\r\n", reg_irq_counter);
	//}

	// Interrupt state will be restored by machine on MRET
}

