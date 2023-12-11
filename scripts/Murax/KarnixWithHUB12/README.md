This example is for 
[Olimex iCE40HX8K-EVB](https://www.olimex.com/Products/FPGA/iCE40/iCE40HX8K-EVB/open-source-hardware) board.

This board comes equipped with iCE40HX8K FPGA chip and a 512KB SRAM chip from Micron which has both BHE# and BLE# signals tied to ground.
It means that it's not possible to do per-byte writes to this SRAM chip without reading 16 bit word first, update it and write back. 
As a consequence you cannot use some of the standard C library string functions (like sprintrf(), etc) because they access string arrays byte by byte.

In this example I implement mostly two things:
 * a little bit more sophisticaited SRAM module (Sram.scala) that does the trick for per-byte writes.
 * a fix to Murax SoC arbiter and to some other VexRiscv internals to let Murax SoC run with I and D cache.

There's also simple sram_test application in ../../../src/main/c/murax/sram_test directory which can be used to do some SRAM testing, it also demonstrates how sprintf() fuction works. There's a simple memory performance measurement using MTIME as well.

The stuff here was NOT well tested, so be warned! :)

73!
Ruslan Zalata <rz@fabmicro.ru>
