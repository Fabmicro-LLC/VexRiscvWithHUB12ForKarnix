# Tool for remotely controlling HUB12/HUB75 displays based on Karnix running VexRiscvWithHUB12ForKarnix software

```hubcontrol_tool.pl``` is a tool designed to demonstrate how HUB12/HUB75 LED screens based on Karnix running VexRiscvWithHUB12ForKarnix software can be remotely controlled over Modbus/RTU or Modbus/UDP protocol. Currently following options are supported:

```
-host=s                 ### Use IP Host address of RS-485 converter
-port=o                 ### Use TCP/UDP port number of RS-485 converter
-port_type=s            ### Use network socket type: 'udp' or 'tcp'
-serial=s               ### Use Serial device name of RS-485 converter (use instead of -host/-port)
-baud=s                 ### Use Serial device baud rate
-version                ### Read version register: {Device, OS, Application}
-set_scratch=o          ### Set Scratch register
-get_scratch            ### Get Scratch register
-get_sys_count          ### Get Sys counter register
-get_irq_count          ### Get IRQ counter register
-addr=o                 ### Use this modbus address
-get_id                 ### Get device ID string
-set_modbus_addr=o      ### Configure Modbus address
-set_modbus_baud=o      ### Configure Modbus port baud rate (currently supported: 9600, 38400, 57600, 115200 and 250000)
-test                   ### Continous read of syscount reg
-reboot                 ### Reboot device
-text=s                 ### Show given text on the screen
-x=o                    ### Set X coordinate for text
-y=o                    ### Set Y coordinate for text
-font_id=o              ### Set font ID for text
-sleep_time=o           ### Sleep during  test
-set_config_write=o     ### Enables or Disables write operations to Config: set to 0xAABB to enable
-get_config_write       ### Get Config Write Enabled status
-get_ip_addr            ### Get configured IP address
-get_gw_addr            ### Get configured Gateway address
-get_netmask            ### Get configured Netmask
-get_mac_addr           ### Get configured MAC addr
-set_ip_addr=s          ### Set configured IP address
-set_gw_addr=s          ### Set configured Gateway address
-set_netmask=s          ### Set configured Netmask
-set_mac_addr=s         ### Set configured MAC addr
-set_color=o            ### Set current drawing color
-get_color              ### Get current drawing color
-set_hub_type=o         ### Set current HUB controller type (12 - for HUB12, 75 - for HUB75)
-get_hub_type           ### Get current HUB controller type
-set_options=o          ### Set misc configuration options
-get_options            ### Get misc configuration options
-demo_clock_hub12       ### Demo: clock on HUB12
-demo_clock_hub75       ### Demo: clock on HUB75
-demo_sprite_hub12      ### Demo: sprite on HUB12
-demo_filled_hub12      ### Demo: filled screen on HUB12
-demo_animation_hub12   ### Demo: animated bitmaps on HUB12
-demo_animation_hub75   ### Demo: animated bitmaps on HUB75
```

# Bad Apple video streaming demo for HUB75 implemented on Karnix 

## Prerequisite

Karnix ASB-254 board can be used to implement RISC-V soft-core that can run at 60MHz. It is also possible to implement HUB75 video adapter using FPGA fabric and use this set (Karnix board + HUB75 LED matrix) as a remotely controllable low resolution display. Karnix supports UART and FastEthernet interface on top of which Modbus/RTU and Modbus/UDP protocols can be implemented. The Perl5 script here in this directory provides demonstration of streaming video/audio data over Modbus to Karnix board running VexRiscvWithHUB12ForKarnix software.

## How to run

First, ```Device::Modbus``` Perl5 module has to be installed:

```
perl -MCPAN -e 'install Device::Modbus'
```

Once installed, run the demo:

```
perl hubcontrol_tool.pl -host 192.168.174.199 -port 2001 -addr 1 -demo_animation_hub75 bad_apple_80x40_25.bgr8.gz badapple-16000.pcm_s16le.gz
```

Where ```-host``` and ```-ports``` defines IP:port of the Karnix board, ```-addr``` defines Modbus device address (1 is default value). First file contains raw video data, second file contains audio PCM data.

## How it works ?

When **demo_animation_hub75** mode initiated, the script does the following:

1. Opens two binary files:
- bad_apple_80x40_25.bgr8.gz contains video frames in BGR8 pixel format, 80x40 pix, 25 FPS. Frame data follows one after another, there's no any containers/headers. File is gzippped to reduce space usage, as filename states.
- badapple-16000.pcm_s16le.gz contains audio samples in PCM S16LE format, mono, 16Khz. No containers, no headers. File is gzipped.

2. Initiates UDP connection to Karnix board at given host:port.

3. Iteratively reads data from audio and video files and sends them to Karnix incapsulated in Modbus requests.

4. Software running on Karnix responds with user data block describing internal ring buffer state (its size and current completeness) which is used to adjust data transmission speed to avoid breaks and data loss.

This demo was succesfully tested while streaming over FastEthernet (Modbus/UDP). Streaming over UART (Modbus/RTU) should be possible, but has not been tested yet.

