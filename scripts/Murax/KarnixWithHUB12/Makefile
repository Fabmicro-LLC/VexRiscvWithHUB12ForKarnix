

VERILOG = ../../../MuraxForKarnixWithHUB12TopLevel.v

generate: ../../../MuraxForKarnixWithHUB12TopLevel_random.hexx
	(cd ../../..; sbt "runMain vexriscv.demo.MuraxForKarnixWithHUB12Verilog")

sim:
	(cd ../../..; sbt "runMain vexriscv.demo.MuraxForKarnixWithHUB12VerilogSim")

../../../MuraxForKarnixWithHUB12TopLevel_random.hexx:	
	ecpbram -g ../../../MuraxForKarnixWithHUB12TopLevel_random.hexx -w 32 -d 24576 # 96K RAM 
	#ecpbram -g ../../../MuraxForKarnixWithHUB12TopLevel_random.hexx -w 32 -d 21504  # 86K RAM 
	#ecpbram -g ../../../MuraxForKarnixWithHUB12TopLevel_random.hexx -w 32 -d 18432 # 72K RAM 
	#ecpbram -g ../../../MuraxForKarnixWithHUB12TopLevel_random.hexx -w 32 -d 17920 # 70K RAM
	#ecpbram -g ../../../MuraxForKarnixWithHUB12TopLevel_random.hexx -w 32 -d 16384 
	#ecpbram -g ../../../MuraxForKarnixWithHUB12TopLevel_random.hexx -w 32 -d 5120 
	./hexx2bin < ../../../MuraxForKarnixWithHUB12TopLevel_random.hexx > ../../../MuraxForKarnixWithHUB12TopLevel_random.bin
	objcopy -v -O ihex -I binary --set-start 0x80000000 --change-addresses 0x80000000 ../../../MuraxForKarnixWithHUB12TopLevel_random.bin ../../../MuraxForKarnixWithHUB12TopLevel_random.hex
	#sed 's/^:10/:00/' < ../../../MuraxForKarnixWithHUB12TopLevel_random.he > ../../../MuraxForKarnixWithHUB12TopLevel_random.hex

../../../MuraxForKarnixWithHUB12TopLevel.v :
	(cd ../../..; sbt "runMain vexriscv.demo.MuraxForKarnixWithHUB12Verilog")


../../../src/main/c/murax/karnix_hub12/build/karnix_hub12.hexx:
	(cd ../../../src/main/c/murax/karnix_hub12; $(MAKE))


../../../MuraxForKarnixWithHUB12TopLevel.v*.bin: ../../../src/main/c/murax/karnix_hub12/build/karnix_hub12.hexx


bin/MuraxForKarnixWithHUB12TopLevel.json : ${VERILOG} ../../../MuraxForKarnixWithHUB12TopLevel.v*.bin
	mkdir -p bin
	yosys -v2 -p "synth_ecp5 -abc2 -top MuraxForKarnixWithHUB12TopLevel -json bin/MuraxForKarnixWithHUB12TopLevel.json" ${VERILOG}
	#yosys -v2 -e ABC -p "synth_ecp5 -abc9 -top MuraxForKarnixWithHUB12TopLevel -json bin/MuraxForKarnixWithHUB12TopLevel.json" ${VERILOG}

bin/MuraxForKarnixWithHUB12TopLevel_random_25F.config : karnix_cabga256.lpf bin/MuraxForKarnixWithHUB12TopLevel.json
	nextpnr-ecp5 --seed 1133 --speed 6 --25k --lpf karnix_cabga256.lpf --placed-svg bin/MuraxForKarnixWithHUB12TopLevel_placed.svg --package CABGA256 --json bin/MuraxForKarnixWithHUB12TopLevel.json --textcfg $@ 

bin/MuraxForKarnixWithHUB12TopLevel_25F.config: bin/MuraxForKarnixWithHUB12TopLevel_random_25F.config ../../../src/main/c/murax/karnix_hub12/build/karnix_hub12.hexx ../../../MuraxForKarnixWithHUB12TopLevel_random.hexx
	ecpbram -v -i bin/MuraxForKarnixWithHUB12TopLevel_random_25F.config -o bin/MuraxForKarnixWithHUB12TopLevel_25F.config -f ../../../MuraxForKarnixWithHUB12TopLevel_random.hexx -t ../../../src/main/c/murax/karnix_hub12/build/karnix_hub12.hexx

bin/MuraxForKarnixWithHUB12TopLevel_25F.bit : bin/MuraxForKarnixWithHUB12TopLevel_25F.config
	ecppack --svf bin/MuraxForKarnixWithHUB12TopLevel_25F.svf  bin/MuraxForKarnixWithHUB12TopLevel_25F.config bin/MuraxForKarnixWithHUB12TopLevel_25F.bit

compile : bin/MuraxForKarnixWithHUB12TopLevel_25F.bit

prog_25F : bin/MuraxForKarnixWithHUB12TopLevel_25F.bit
	ecpprog bin/MuraxForKarnixWithHUB12TopLevel_25F.bit

clean :
	rm -f bin/* ../../../MuraxForKarnixWithHUB12TopLevel*

gdb:
	$(GDB) -b 115200 -ex "set debug remote 1" -ex "target remote /dev/ttyUSB0" ../../../src/main/c/murax/karnix_hub12/build/karnix_hub12.elf 


