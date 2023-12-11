# HUB-12/HUB-75 adapter for Karnix ASB-254 board

This repository contains synthesizable RISC-V CPU core, SoC and C program which all run on Karnix ASB-254 board and turn it into HUB-12 or HUB-75 adapter for controlling appropriate LED matrixes over Modbus/UDP protocol.

The used RV32I core is [VexRiscrv](https://github.com/SpinalHDL/VexRiscv) together with Murax SoC] are written in [SpanalHDL](https://github.com/SpinalHDL/SpinalHDL) hardware description language, please check [SpinalHDL Documentation](https://spinalhdl.github.io/SpinalDoc-RTD/master/index.html) for more details.

## Dependencies

```sh
# JAVA JDK 8
sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-8-jdk -y
sudo update-alternatives --config java
sudo update-alternatives --config javac

# Install SBT - https://www.scala-sbt.org/
sudo apt-get update
sudo apt-get install sbt

# Verilator (for sim only)
sudo apt-get install git make autoconf g++ flex bison
git clone http://git.veripool.org/git/verilator   # Only first time
unsetenv VERILATOR_ROOT  # For csh; ignore error if on bash
unset VERILATOR_ROOT  # For bash
cd verilator
git pull        # Make sure we're up-to-date
git checkout v4.040
autoconf        # Create ./configure script
./configure
make
sudo make install
```

## RISC-V GCC Toolchain

A prebuild GCC toolchain can be found here:

https://www.sifive.com/software/  => Prebuilt RISC‑V GCC Toolchain and Emulator

Please install (unpack) it into ```/opt/riscv64``` directory, then edit ```src/main/c/murax/karnix_hub12/Makefile``` to make sure $RISCV_PATH and $RISCV_NAME both point to proper directory and compiler.

## CPU/SoC generation for Karnix ASB-254

To generate the corresponding RTL as a `VexRiscv.v` file, run the following commands in the root directory of this repository:

```sh
cd scripts/Murax/KarnixWithHUB12/
make generate 
```

It will take a while. Upon first start it will fetch all required Scala libraries.

## Synthesize bitstream for Karnix

```sh
cd scripts/Murax/KarnixWithHUB12/
make
```

It will compile C code first using GCC toolchain producing .HEX file which will then will be embedded into SoC as ROM.  The resulting bitstream file can be found in ```scripts/Murax/KarnixWithHUB12/bin/MuraxForKarnixWithHUB12TopLevel_25F.bit```, use [openFPGALoader](https://github.com/trabucayre/openFPGALoader) to flash it to NOR memory of the Karnix ASB-254 board:

```sh
openFPGALoader -f MuraxForKarnixWithHUB12TopLevel_25F.bit
```

Once flashing is completed and RESET is applied, the CPU will start executing ROM code, one of the LEDs will start blinking indicating main loop execution. If Ethernet is connected during start, the program will request IP address by DHCP and will respond to ICMP pings and Modbus/RTU requests. Details on supported Modbus/RTU commands to control HUB-12/75 LEDs are provided below.

## Briefly on VexRiscv Architecture

VexRiscv is implemented via a 5 stage in-order pipeline on which many optional and complementary plugins add functionalities to provide a functional RISC-V CPU. This approach is completely unconventional and only possible through meta hardware description languages (SpinalHDL, in the current case) but has proven its advantages via the VexRiscv implementation:

- You can swap/turn on/turn off parts of the CPU directly via the plugin system
- You can add new functionalities/instructions without having to modify any of the sources of the CPU
- It allows the CPU configuration to cover a very large spectrum of implementations without cooking spaghetti code
- It allows your codebase to truly produce a parametrized CPU design

If you generate the CPU without any plugin, it will only contain the definition of the 5 pipeline stages and their basic arbitration, but nothing else,
and everything else, including the program counter is added into the CPU via plugins.

## Briefly on Murax SoC

Murax is a very light SoC which can work without any external components:
- VexRiscv RV32I[M]
- JTAG debugger (Eclipse/GDB/openocd ready)
- 8 kB of on-chip ram
- Interrupt support
- APB bus for peripherals
- 32 GPIO pin
- one 16 bits prescaler, two 16 bits timers
- one UART with tx/rx fifo

Depending on the CPU configuration, on the ICE40 and ECP5 FPGAs with Yosys for synthesis, the full SoC has the following area/performance:
- RV32I interlocked stages => 51 Mhz, 2387 LC 0.45 DMIPS/Mhz
- RV32I bypassed stages    => 45 Mhz, 2718 LC 0.65 DMIPS/Mhz

Its implementation can be found here: `src/main/scala/vexriscv/demo/Murax.scala`.

