#include "utils.h"
#include "soc.h"
#include "gpio.h"
#include "config.h"
#include "crc16.h"
//#include "aes.h"
#include "hub.h"
#include "modbus.h"

//#define MODBUS_DEBUG	1

uint32_t reg_hub_color = HUB_COLOR_WHITE;

uint32_t modbus_error(uint8_t f, uint8_t err_code, uint8_t *txbuf)
{
	printf("Request error, func: %d, err: %d\r\n", f, err_code);
	txbuf[0] = active_config.modbus_addr;
	txbuf[1] = f | 0x80;
	txbuf[2] = err_code;
	add_crc(txbuf, 3);
	return 3+2;
}


int modbus_store_reg(uint16_t reg, uint8_t *data, uint16_t data_len) {

	int ret = -1; // Wrong reg number is default error code

	if(reg >= 40 && reg < 50 && reg_config_write == 0) {
		printf("modbus_store_reg() config write not allowed! Unlock first!\r\n");
		return -2; // Config Write is not enabled
	}

	switch(reg) {

		case REG_CLEAR_TEXT: {
			memset((void*)HUB0->FB,  0, hub_frame_size);
			ret = 0;
		} break;

		case REG_FRAMEBUFFER: {
			int offset = data[0] << 8 | data[1];
			int words_to_copy = MIN(HUB_FRAMEBUFFER_SIZE, data_len - 2) / 4;

			// We can write only 32 bit words at a time to HUB frame buffer
			for(int i = 0; i < words_to_copy; i++)
				*(unsigned int*)(HUB0->FB + offset + i*4) = 
					data[2 + i * 4 + 3] << 24 |
					data[2 + i * 4 + 2] << 16 |
					data[2 + i * 4 + 1] << 8  |
					data[2 + i * 4 + 0] << 0;

			#ifdef MODBUS_DEBUG
			printf("REG_FRAMEBUFFER: data_len = %d, offset = %d, words_to_copy = %d\r\n",
				data_len, offset, words_to_copy);
			#endif

			ret = 0;
		} break;

		case REG_PRINT_TEXT: {
			int x = data[0] << 8 | data[1];
			int y = data[2] << 8 | data[3];
			int font_id = data[4] << 8 | data[5];
			int text_len = data_len - 6;
			if(data_len < 1) {
				ret = -3;
				break;
			}

			if(font_id == 0)
				hub_print(x, y, reg_hub_color, &(data[6]), text_len, font_6x8, 6, 8);
			else
				hub_print(x, y, reg_hub_color, &(data[6]), text_len, font_12x16, 12, 16);

			ret = 0;
		} break;
 
		case REG_SCRATCH: {
			reg_scratch = data[0] << 24 | data[1] << 16 | data[2] << 8 | data[3];
			ret = 0;
		} break;

		case REG_CONFIG_WRITE: {
			reg_config_write = data[0] << 24 | data[1] << 16 | data[2] << 8 | data[3];
			ret = 0;
		} break;

		case REG_COLOR: {
			reg_hub_color = data[3]; // only 8 bits are valid
			ret = 0;
		} break;

		case REG_REBOOT: {
			hard_reboot();
			ret = 0;
		} break;

		case REG_HUB_TYPE: {
			Config config;

			if(hub_init(data[3]) != 0)
				return -2;

			if(config_load(&config) < 0)
				config = default_config;

			config.hub_type = data[3];

			if(config_save(&config) < 0)
				ret = -2;	// Error writing to EEPROM
			else
				ret = 0;
		} break;

		case REG_MBUS_ADDR: {
			Config config;

			if(config_load(&config) < 0)
				config = default_config;

			config.modbus_addr = data[3];

			if(config_save(&config) < 0)
				ret = -2;	// Error writing to EEPROM
			else
				ret = 0;
		} break;

		case REG_CONFIG_OPTIONS: {
			Config config;

			if(config_load(&config) < 0)
				config = default_config;

			config.options = data[3];

			if(config_save(&config) < 0)
				ret = -2;	// Error writing to EEPROM
			else
				ret = 0;
		} break;

		case REG_MBUS_BAUD: {
			Config config;

			if(config_load(&config) < 0)
				config = default_config;

			uint8_t *p = (uint8_t*) &config.ip_addr;
			config.modbus_baud = (data[0] << 24) | (data[1] << 16) | (data[2] << 8) | data[3];

			if(config_save(&config) < 0)
				ret = -2;	// Error writing to EEPROM
			else
				ret = 0;
		} break;

		case REG_IP_ADDR: {
			Config config;

			if(config_load(&config) < 0)
				config = default_config;

			uint8_t *p = (uint8_t*) &config.ip_addr;
			memcpy_rev(p, &(data[3]), 4);

			if(config_save(&config) < 0)
				ret = -2;	// Error writing to EEPROM
			else
				ret = 0;
		
		} break;

		case REG_GW_ADDR: {
			Config config;

			if(config_load(&config) < 0)
				config = default_config;

			uint8_t *p = (uint8_t*) &config.gw_addr;
			memcpy_rev(p, &(data[3]), 4);

			if(config_save(&config) < 0)
				ret = -2;	// Error writing to EEPROM
			else
				ret = 0;
		
		} break;

		case REG_NETMASK: {
			Config config;

			if(config_load(&config) < 0)
				config = default_config;

			uint8_t *p = (uint8_t*) &config.netmask;
			memcpy_rev(p, &(data[3]), 4);

			if(config_save(&config) < 0)
				ret = -2;	// Error writing to EEPROM
			else
				ret = 0;
		
		} break;

		case REG_MAC_ADDR: {
			Config config;

			if(config_load(&config) < 0)
				config = default_config;

			uint8_t *p = (uint8_t*) &config.mac_addr;
			memcpy(p, data, 6);

			if(config_save(&config) < 0)
				ret = -2;	// Error writing to EEPROM
			else
				ret = 0;
		
		} break;

	}

	return ret;
}




int modbus_recv(uint8_t *rx_buf, int rx_len, uint8_t *tx_buf) {

	uint32_t tx_len = 0;


	if(rx_buf == NULL || tx_buf == NULL || rx_len < 5) {
		return -1;
	}

	uint16_t my_crc16 = crc16(rx_buf, rx_len - 2);
	uint16_t his_crc16 = (rx_buf[rx_len - 1] << 8) | (rx_buf[rx_len - 2]);

	if(my_crc16 == his_crc16) {

		uint8_t func = rx_buf[1];
		
		if(rx_buf[0] == active_config.modbus_addr || (rx_buf[0] == 0x00 && func == FUNC_ID)) {

			uint16_t reg_addr = (rx_buf[2] << 8) | rx_buf[3];
			uint16_t qty = (rx_buf[4] << 8) | rx_buf[5];

			memset(tx_buf, 0, MODBUS_TX_BUF_SIZE);

			tx_buf[0] = active_config.modbus_addr;
			tx_buf[1] = func;

			#ifdef MODBUS_DEBUG
			printf("modbus_recv() func = %d, reg = %d\r\n", func, reg_addr);
			for(int i = 0; i < rx_len; i++)
				printf("0x%02X ", rx_buf[i]);
			printf("\r\n");
			#endif

			switch(func) {
				case FUNC_ID:   {
					tx_len = sprintf(tx_buf+3, "HUB12/75: build %05d, date: %s", BUILD_NUMBER, __DATE__);
					tx_buf[2] = tx_len;
					add_crc(tx_buf, tx_len+3);
					tx_len += 3+2;
				} break;


				case FUNC_READ_COILS:
				case FUNC_READ_DISC_INPUT:
				case FUNC_READ_HOLD_REGS: {

					if(qty != 1) {
						tx_len = modbus_error(func, ERR_WRONG_ARGS, tx_buf);
						break;
					}


					switch(reg_addr) {
						case REG_SYS_COUNTER: {
							uint8_t* p = (uint8_t*)&reg_sys_counter;
							memcpy_rev(&(tx_buf[3]), &(p[3]), 4);
							tx_len += 4;
						} break;

						case REG_IRQ_COUNTER: {
							uint8_t* p = (uint8_t*)&reg_irq_counter;
							memcpy_rev(&(tx_buf[3]), &(p[3]), 4);
							tx_len += 4;
						} break;

						case REG_SCRATCH: {
							uint8_t* p = (uint8_t*)&reg_scratch;
							memcpy_rev(&(tx_buf[3]), &(p[3]), 4);
							tx_len += 4;
						} break;

						case REG_CONFIG_WRITE: {
							uint8_t* p = (uint8_t*)&reg_config_write;
							memcpy_rev(&(tx_buf[3]), &(p[3]), 4);
							tx_len += 4;
						} break;

						case REG_COLOR: {
							uint8_t* p = (uint8_t*)&reg_hub_color;
							memcpy_rev(&(tx_buf[3]), &(p[3]), 4);
							tx_len += 4;
						} break;

						case REG_IP_ADDR: {
							Config config;

							if(config_load(&config) < 0)
								config = default_config;

							uint8_t* p = (uint8_t*)&config.ip_addr;
							memcpy(&(tx_buf[3]), p, 4);
							tx_len += 4;
						} break;

						case REG_GW_ADDR: {
							Config config;

							if(config_load(&config) < 0)
								config = default_config;

							uint8_t* p = (uint8_t*)&config.gw_addr;
							memcpy(&(tx_buf[3]), p, 4);
							tx_len += 4;
						} break;

						case REG_NETMASK: {
							Config config;

							if(config_load(&config) < 0)
								config = default_config;

							uint8_t* p = (uint8_t*)&config.netmask;
							memcpy(&(tx_buf[3]), p, 4);
							tx_len += 4;
						} break;

						case REG_MAC_ADDR: {
							Config config;

							if(config_load(&config) < 0)
								config = default_config;

							uint8_t* p = (uint8_t*)&config.mac_addr;
							memcpy(&(tx_buf[3]), p, 6);
							tx_len += 6;
						} break;

						case REG_HUB_TYPE: {
							Config config;

							if(config_load(&config) < 0)
								config = default_config;

							tx_buf[6] = config.hub_type;
							tx_len += 6;
						} break;

						case REG_MBUS_ADDR: {
							Config config;

							if(config_load(&config) < 0)
								config = default_config;

							tx_buf[6] = config.modbus_addr;
							tx_len += 6;
						} break;

						case REG_CONFIG_OPTIONS: {
							Config config;

							if(config_load(&config) < 0)
								config = default_config;

							tx_buf[6] = config.options;
							tx_len += 6;
						} break;

						case REG_MBUS_BAUD: {
							Config config;

							if(config_load(&config) < 0)
								config = default_config;

							uint8_t* p = (uint8_t*)&config.modbus_baud;
							memcpy(&(tx_buf[3]), &(p[3]), 4);
							tx_len += 6;
						} break;


						default: {
							tx_len = modbus_error(func, ERR_ADDR_NOT_AVAILABLE, tx_buf);
						} break;
					}

					tx_buf[2] = tx_len; // num of data bytes in response PDU
					add_crc(tx_buf, tx_len+3);
					tx_len += 3+2; // packet size inclusing CRC

				} break; // FUNC_READ_HOLD_REGS 

				case FUNC_WRITE_ONE_HOLD_REG:
				case FUNC_WRITE_ONE_COIL_REG: {

					int rc = modbus_store_reg(reg_addr, &rx_buf[7], rx_len - 2 - 7);

					if(rc < 0) {
						if(rc == -2) 
							tx_len = modbus_error(func, ERR_SYS_ERROR, tx_buf);
						else
							tx_len = modbus_error(func, ERR_WRONG_ARGS, tx_buf);
					} else {
						memcpy(&(tx_buf[2]), &(rx_buf[2]), 4);
						add_crc(tx_buf, 6);
						tx_len = 6+2; // PDU size
					}

				} break; // FUNC_WRITE_ONE_COIL_REG

				case FUNC_WRITE_MANY_HOLD_REG:
				case FUNC_WRITE_MANY_COIL_REG: {

					int rc = modbus_store_reg(reg_addr, &rx_buf[7], rx_len - 2 - 7);

					if(rc < 0) {
						if(rc == -2) 
							tx_len = modbus_error(func, ERR_SYS_ERROR, tx_buf);
						else
							tx_len = modbus_error(func, ERR_WRONG_ARGS, tx_buf);
					} else {
						memcpy(&(tx_buf[2]), &(rx_buf[2]), 4);
						add_crc(tx_buf, 6);
						tx_len = 6+2; // PDU size
					}
					
				} break; // FUNC_WRITE_MANY_COIL_REG


				default: { // function not supported
					tx_len = modbus_error(func, ERR_FUNC_NOT_IMPLEMENTED, tx_buf);
				}



			} // switch(func)

			if(tx_len == 0) {
				printf("modbus_recv() no response for func = %d ???\r\n", func);
			}

		} else {
			printf("modbus_recv() Recvd dgram is not for us, addr: %d (ours: %d)\r\n", rx_buf[0], active_config.modbus_addr);
		}		

	} else {
		printf("modbus_recv() CRC16 ERROR: my = 0x%04X, his = 0x%04X\r\n", my_crc16, his_crc16);
	}


	return tx_len;
}


