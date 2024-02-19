
build/karnix_hub12.elf:     file format elf32-littleriscv


Disassembly of section ._vector:

80000000 <crtStart>:
80000000:	80000137          	lui	sp,0x80000
80000004:	0b010113          	addi	sp,sp,176 # 800000b0 <_ram_heap_end+0xfffe80b0>
80000008:	000100e7          	jalr	sp
8000000c:	00000013          	nop
	...

80000020 <trap_entry>:
80000020:	fe112e23          	sw	ra,-4(sp)
80000024:	fe512c23          	sw	t0,-8(sp)
80000028:	fe612a23          	sw	t1,-12(sp)
8000002c:	fe712823          	sw	t2,-16(sp)
80000030:	fea12623          	sw	a0,-20(sp)
80000034:	feb12423          	sw	a1,-24(sp)
80000038:	fec12223          	sw	a2,-28(sp)
8000003c:	fed12023          	sw	a3,-32(sp)
80000040:	fce12e23          	sw	a4,-36(sp)
80000044:	fcf12c23          	sw	a5,-40(sp)
80000048:	fd012a23          	sw	a6,-44(sp)
8000004c:	fd112823          	sw	a7,-48(sp)
80000050:	fdc12623          	sw	t3,-52(sp)
80000054:	fdd12423          	sw	t4,-56(sp)
80000058:	fde12223          	sw	t5,-60(sp)
8000005c:	fdf12023          	sw	t6,-64(sp)
80000060:	fc010113          	addi	sp,sp,-64
80000064:	3dd030ef          	jal	ra,80003c40 <irqCallback>
80000068:	03c12083          	lw	ra,60(sp)
8000006c:	03812283          	lw	t0,56(sp)
80000070:	03412303          	lw	t1,52(sp)
80000074:	03012383          	lw	t2,48(sp)
80000078:	02c12503          	lw	a0,44(sp)
8000007c:	02812583          	lw	a1,40(sp)
80000080:	02412603          	lw	a2,36(sp)
80000084:	02012683          	lw	a3,32(sp)
80000088:	01c12703          	lw	a4,28(sp)
8000008c:	01812783          	lw	a5,24(sp)
80000090:	01412803          	lw	a6,20(sp)
80000094:	01012883          	lw	a7,16(sp)
80000098:	00c12e03          	lw	t3,12(sp)
8000009c:	00812e83          	lw	t4,8(sp)
800000a0:	00412f03          	lw	t5,4(sp)
800000a4:	00012f83          	lw	t6,0(sp)
800000a8:	04010113          	addi	sp,sp,64
800000ac:	30200073          	mret

800000b0 <crtInit>:
800000b0:	00004197          	auipc	gp,0x4
800000b4:	9c018193          	addi	gp,gp,-1600 # 80003a70 <__global_pointer$>
800000b8:	00012117          	auipc	sp,0x12
800000bc:	4e810113          	addi	sp,sp,1256 # 800125a0 <_stack_start>

800000c0 <bss_init>:
800000c0:	86018513          	addi	a0,gp,-1952 # 800032d0 <t2>
800000c4:	c7018593          	addi	a1,gp,-912 # 800036e0 <_bss_end>

800000c8 <bss_loop>:
800000c8:	00b50863          	beq	a0,a1,800000d8 <bss_done>
800000cc:	00052023          	sw	zero,0(a0)
800000d0:	00450513          	addi	a0,a0,4
800000d4:	ff5ff06f          	j	800000c8 <bss_loop>

800000d8 <bss_done>:
800000d8:	00011517          	auipc	a0,0x11
800000dc:	4c050513          	addi	a0,a0,1216 # 80011598 <_ctors_end>
800000e0:	ffc10113          	addi	sp,sp,-4

800000e4 <ctors_loop>:
800000e4:	00011597          	auipc	a1,0x11
800000e8:	4b458593          	addi	a1,a1,1204 # 80011598 <_ctors_end>
800000ec:	00b50e63          	beq	a0,a1,80000108 <ctors_done>
800000f0:	00052683          	lw	a3,0(a0)
800000f4:	00450513          	addi	a0,a0,4
800000f8:	00a12023          	sw	a0,0(sp)
800000fc:	000680e7          	jalr	a3
80000100:	00012503          	lw	a0,0(sp)
80000104:	fe1ff06f          	j	800000e4 <ctors_loop>

80000108 <ctors_done>:
80000108:	00410113          	addi	sp,sp,4
8000010c:	00001537          	lui	a0,0x1
80000110:	88050513          	addi	a0,a0,-1920 # 880 <CUSTOM1+0x855>
80000114:	30451073          	csrw	mie,a0
80000118:	00002537          	lui	a0,0x2
8000011c:	80850513          	addi	a0,a0,-2040 # 1808 <_stack_size+0x808>
80000120:	30051073          	csrw	mstatus,a0
80000124:	3f90d0ef          	jal	ra,8000dd1c <end>

80000128 <infinitLoop>:
80000128:	0000006f          	j	80000128 <infinitLoop>
	...

Disassembly of section .memory:

80003744 <crc16>:
80003744:	000107b7          	lui	a5,0x10
80003748:	ffffa6b7          	lui	a3,0xffffa
8000374c:	00000713          	li	a4,0
80003750:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xefff>
80003754:	00168693          	addi	a3,a3,1 # ffffa001 <_ram_heap_end+0x7ffe2001>
80003758:	00b74663          	blt	a4,a1,80003764 <crc16+0x20>
8000375c:	00078513          	mv	a0,a5
80003760:	00008067          	ret
80003764:	00e50633          	add	a2,a0,a4
80003768:	00064603          	lbu	a2,0(a2)
8000376c:	00c7c7b3          	xor	a5,a5,a2
80003770:	00800613          	li	a2,8
80003774:	0017f813          	andi	a6,a5,1
80003778:	0017d793          	srli	a5,a5,0x1
8000377c:	00080863          	beqz	a6,8000378c <crc16+0x48>
80003780:	00d7c7b3          	xor	a5,a5,a3
80003784:	01079793          	slli	a5,a5,0x10
80003788:	0107d793          	srli	a5,a5,0x10
8000378c:	fff60613          	addi	a2,a2,-1
80003790:	fe0612e3          	bnez	a2,80003774 <crc16+0x30>
80003794:	00170713          	addi	a4,a4,1
80003798:	fc1ff06f          	j	80003758 <crc16+0x14>

8000379c <add_crc>:
8000379c:	ff010113          	addi	sp,sp,-16
800037a0:	00812423          	sw	s0,8(sp)
800037a4:	00912223          	sw	s1,4(sp)
800037a8:	00112623          	sw	ra,12(sp)
800037ac:	00050413          	mv	s0,a0
800037b0:	00058493          	mv	s1,a1
800037b4:	f91ff0ef          	jal	ra,80003744 <crc16>
800037b8:	009405b3          	add	a1,s0,s1
800037bc:	00a58023          	sb	a0,0(a1)
800037c0:	00855513          	srli	a0,a0,0x8
800037c4:	00a580a3          	sb	a0,1(a1)
800037c8:	00c12083          	lw	ra,12(sp)
800037cc:	00812403          	lw	s0,8(sp)
800037d0:	00412483          	lw	s1,4(sp)
800037d4:	01010113          	addi	sp,sp,16
800037d8:	00008067          	ret

800037dc <println>:
800037dc:	ff010113          	addi	sp,sp,-16
800037e0:	00112623          	sw	ra,12(sp)
800037e4:	531020ef          	jal	ra,80006514 <print_uart0>
800037e8:	00c12083          	lw	ra,12(sp)
800037ec:	80003537          	lui	a0,0x80003
800037f0:	8e850513          	addi	a0,a0,-1816 # 800028e8 <_ram_heap_end+0xfffea8e8>
800037f4:	01010113          	addi	sp,sp,16
800037f8:	51d0206f          	j	80006514 <print_uart0>

800037fc <to_hex_nibble>:
800037fc:	00f57513          	andi	a0,a0,15
80003800:	00900793          	li	a5,9
80003804:	00a7f663          	bgeu	a5,a0,80003810 <to_hex_nibble+0x14>
80003808:	03750513          	addi	a0,a0,55
8000380c:	00008067          	ret
80003810:	03050513          	addi	a0,a0,48
80003814:	00008067          	ret

80003818 <to_hex>:
80003818:	fd010113          	addi	sp,sp,-48
8000381c:	02812423          	sw	s0,40(sp)
80003820:	02912223          	sw	s1,36(sp)
80003824:	03212023          	sw	s2,32(sp)
80003828:	01312e23          	sw	s3,28(sp)
8000382c:	02112623          	sw	ra,44(sp)
80003830:	00050913          	mv	s2,a0
80003834:	00050493          	mv	s1,a0
80003838:	01c00413          	li	s0,28
8000383c:	ffc00993          	li	s3,-4
80003840:	0085d533          	srl	a0,a1,s0
80003844:	0ff57513          	andi	a0,a0,255
80003848:	00b12623          	sw	a1,12(sp)
8000384c:	fb1ff0ef          	jal	ra,800037fc <to_hex_nibble>
80003850:	00a48023          	sb	a0,0(s1)
80003854:	ffc40413          	addi	s0,s0,-4
80003858:	00148493          	addi	s1,s1,1
8000385c:	00c12583          	lw	a1,12(sp)
80003860:	ff3410e3          	bne	s0,s3,80003840 <to_hex+0x28>
80003864:	02c12083          	lw	ra,44(sp)
80003868:	02812403          	lw	s0,40(sp)
8000386c:	00090423          	sb	zero,8(s2)
80003870:	02412483          	lw	s1,36(sp)
80003874:	02012903          	lw	s2,32(sp)
80003878:	01c12983          	lw	s3,28(sp)
8000387c:	03010113          	addi	sp,sp,48
80003880:	00008067          	ret

80003884 <process_and_wait>:
80003884:	fd010113          	addi	sp,sp,-48
80003888:	02812423          	sw	s0,40(sp)
8000388c:	02912223          	sw	s1,36(sp)
80003890:	01412c23          	sw	s4,24(sp)
80003894:	01512a23          	sw	s5,20(sp)
80003898:	01612823          	sw	s6,16(sp)
8000389c:	01712623          	sw	s7,12(sp)
800038a0:	02112623          	sw	ra,44(sp)
800038a4:	03212023          	sw	s2,32(sp)
800038a8:	01312e23          	sw	s3,28(sp)
800038ac:	f00b07b7          	lui	a5,0xf00b0
800038b0:	0007a903          	lw	s2,0(a5) # f00b0000 <_ram_heap_end+0x70098000>
800038b4:	0047a983          	lw	s3,4(a5)
800038b8:	00050a93          	mv	s5,a0
800038bc:	f00b0b37          	lui	s6,0xf00b0
800038c0:	000b2783          	lw	a5,0(s6) # f00b0000 <_ram_heap_end+0x70098000>
800038c4:	004b2803          	lw	a6,4(s6)
800038c8:	412786b3          	sub	a3,a5,s2
800038cc:	00d7b733          	sltu	a4,a5,a3
800038d0:	413807b3          	sub	a5,a6,s3
800038d4:	04e79663          	bne	a5,a4,80003920 <process_and_wait+0x9c>
800038d8:	0556f463          	bgeu	a3,s5,80003920 <process_and_wait+0x9c>
800038dc:	8801a783          	lw	a5,-1920(gp) # 800032f0 <events_modbus_rtu_poll>
800038e0:	00078663          	beqz	a5,800038ec <process_and_wait+0x68>
800038e4:	420000ef          	jal	ra,80003d04 <modbus_rtu_poll>
800038e8:	8801a023          	sw	zero,-1920(gp) # 800032f0 <events_modbus_rtu_poll>
800038ec:	87c1a783          	lw	a5,-1924(gp) # 800032ec <events_modbus_rtu_rx>
800038f0:	00078663          	beqz	a5,800038fc <process_and_wait+0x78>
800038f4:	4d4000ef          	jal	ra,80003dc8 <modbus_rtu_rx>
800038f8:	8801a023          	sw	zero,-1920(gp) # 800032f0 <events_modbus_rtu_poll>
800038fc:	8881a783          	lw	a5,-1912(gp) # 800032f8 <events_mac_poll>
80003900:	00078663          	beqz	a5,8000390c <process_and_wait+0x88>
80003904:	501010ef          	jal	ra,80005604 <mac_poll>
80003908:	8801a423          	sw	zero,-1912(gp) # 800032f8 <events_mac_poll>
8000390c:	8841a783          	lw	a5,-1916(gp) # 800032f4 <events_mac_rx>
80003910:	fa0788e3          	beqz	a5,800038c0 <process_and_wait+0x3c>
80003914:	221010ef          	jal	ra,80005334 <mac_rx>
80003918:	8801a223          	sw	zero,-1916(gp) # 800032f4 <events_mac_rx>
8000391c:	fa5ff06f          	j	800038c0 <process_and_wait+0x3c>
80003920:	02c12083          	lw	ra,44(sp)
80003924:	02812403          	lw	s0,40(sp)
80003928:	02412483          	lw	s1,36(sp)
8000392c:	02012903          	lw	s2,32(sp)
80003930:	01c12983          	lw	s3,28(sp)
80003934:	01812a03          	lw	s4,24(sp)
80003938:	01412a83          	lw	s5,20(sp)
8000393c:	01012b03          	lw	s6,16(sp)
80003940:	00c12b83          	lw	s7,12(sp)
80003944:	03010113          	addi	sp,sp,48
80003948:	00008067          	ret

8000394c <sram_test_write_random_ints>:
8000394c:	80002537          	lui	a0,0x80002
80003950:	fe010113          	addi	sp,sp,-32
80003954:	00080637          	lui	a2,0x80
80003958:	900005b7          	lui	a1,0x90000
8000395c:	02450513          	addi	a0,a0,36 # 80002024 <_ram_heap_end+0xfffea024>
80003960:	00812c23          	sw	s0,24(sp)
80003964:	00112e23          	sw	ra,28(sp)
80003968:	00912a23          	sw	s1,20(sp)
8000396c:	01212823          	sw	s2,16(sp)
80003970:	01312623          	sw	s3,12(sp)
80003974:	01412423          	sw	s4,8(sp)
80003978:	01512223          	sw	s5,4(sp)
8000397c:	5d40b0ef          	jal	ra,8000ef50 <iprintf>
80003980:	deadc7b7          	lui	a5,0xdeadc
80003984:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac3eef>
80003988:	90000737          	lui	a4,0x90000
8000398c:	00078413          	mv	s0,a5
80003990:	900806b7          	lui	a3,0x90080
80003994:	00f72023          	sw	a5,0(a4) # 90000000 <_ram_heap_end+0xffe8000>
80003998:	00470713          	addi	a4,a4,4
8000399c:	008787b3          	add	a5,a5,s0
800039a0:	fed71ae3          	bne	a4,a3,80003994 <sram_test_write_random_ints+0x48>
800039a4:	80002537          	lui	a0,0x80002
800039a8:	00080637          	lui	a2,0x80
800039ac:	900005b7          	lui	a1,0x90000
800039b0:	05050513          	addi	a0,a0,80 # 80002050 <_ram_heap_end+0xfffea050>
800039b4:	59c0b0ef          	jal	ra,8000ef50 <iprintf>
800039b8:	00000913          	li	s2,0
800039bc:	900004b7          	lui	s1,0x90000
800039c0:	80002ab7          	lui	s5,0x80002
800039c4:	00040a13          	mv	s4,s0
800039c8:	900809b7          	lui	s3,0x90080
800039cc:	0004a783          	lw	a5,0(s1) # 90000000 <_ram_heap_end+0xffe8000>
800039d0:	00878e63          	beq	a5,s0,800039ec <sram_test_write_random_ints+0xa0>
800039d4:	0004a683          	lw	a3,0(s1)
800039d8:	00040613          	mv	a2,s0
800039dc:	00048593          	mv	a1,s1
800039e0:	07ca8513          	addi	a0,s5,124 # 8000207c <_ram_heap_end+0xfffea07c>
800039e4:	56c0b0ef          	jal	ra,8000ef50 <iprintf>
800039e8:	00190913          	addi	s2,s2,1
800039ec:	00448493          	addi	s1,s1,4
800039f0:	01440433          	add	s0,s0,s4
800039f4:	fd349ce3          	bne	s1,s3,800039cc <sram_test_write_random_ints+0x80>
800039f8:	80002537          	lui	a0,0x80002
800039fc:	00090593          	mv	a1,s2
80003a00:	0b050513          	addi	a0,a0,176 # 800020b0 <_ram_heap_end+0xfffea0b0>
80003a04:	54c0b0ef          	jal	ra,8000ef50 <iprintf>
80003a08:	01c12083          	lw	ra,28(sp)
80003a0c:	01812403          	lw	s0,24(sp)
80003a10:	00090513          	mv	a0,s2
80003a14:	01412483          	lw	s1,20(sp)
80003a18:	01012903          	lw	s2,16(sp)
80003a1c:	00c12983          	lw	s3,12(sp)
80003a20:	00812a03          	lw	s4,8(sp)
80003a24:	00412a83          	lw	s5,4(sp)
80003a28:	02010113          	addi	sp,sp,32
80003a2c:	00008067          	ret

80003a30 <timerInterrupt>:
80003a30:	00008067          	ret

80003a34 <externalInterrupt>:
80003a34:	ff010113          	addi	sp,sp,-16
80003a38:	00112623          	sw	ra,12(sp)
80003a3c:	00812423          	sw	s0,8(sp)
80003a40:	f00607b7          	lui	a5,0xf0060
80003a44:	0047a783          	lw	a5,4(a5) # f0060004 <_ram_heap_end+0x70048004>
80003a48:	0017f793          	andi	a5,a5,1
80003a4c:	02078c63          	beqz	a5,80003a84 <__global_pointer$+0x14>
80003a50:	f0000737          	lui	a4,0xf0000
80003a54:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
80003a58:	02a00593          	li	a1,42
80003a5c:	0027e793          	ori	a5,a5,2
80003a60:	00f72223          	sw	a5,4(a4)
80003a64:	f0010737          	lui	a4,0xf0010
80003a68:	00472783          	lw	a5,4(a4) # f0010004 <_ram_heap_end+0x6fff8004>
80003a6c:	0187d793          	srli	a5,a5,0x18
80003a70:	14079863          	bnez	a5,80003bc0 <__global_pointer$+0x150>
80003a74:	f0060737          	lui	a4,0xf0060
80003a78:	00472783          	lw	a5,4(a4) # f0060004 <_ram_heap_end+0x70048004>
80003a7c:	ffe7f793          	andi	a5,a5,-2
80003a80:	00f72223          	sw	a5,4(a4)
80003a84:	f00607b7          	lui	a5,0xf0060
80003a88:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x70048004>
80003a8c:	00277713          	andi	a4,a4,2
80003a90:	00070e63          	beqz	a4,80003aac <__global_pointer$+0x3c>
80003a94:	87c1a703          	lw	a4,-1924(gp) # 800032ec <events_modbus_rtu_rx>
80003a98:	00170713          	addi	a4,a4,1
80003a9c:	86e1ae23          	sw	a4,-1924(gp) # 800032ec <events_modbus_rtu_rx>
80003aa0:	0047a703          	lw	a4,4(a5)
80003aa4:	ffd77713          	andi	a4,a4,-3
80003aa8:	00e7a223          	sw	a4,4(a5)
80003aac:	f00607b7          	lui	a5,0xf0060
80003ab0:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x70048004>
80003ab4:	00477713          	andi	a4,a4,4
80003ab8:	00070e63          	beqz	a4,80003ad4 <__global_pointer$+0x64>
80003abc:	8841a703          	lw	a4,-1916(gp) # 800032f4 <events_mac_rx>
80003ac0:	00170713          	addi	a4,a4,1
80003ac4:	88e1a223          	sw	a4,-1916(gp) # 800032f4 <events_mac_rx>
80003ac8:	0047a703          	lw	a4,4(a5)
80003acc:	ffb77713          	andi	a4,a4,-5
80003ad0:	00e7a223          	sw	a4,4(a5)
80003ad4:	f00607b7          	lui	a5,0xf0060
80003ad8:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x70048004>
80003adc:	00877713          	andi	a4,a4,8
80003ae0:	02070c63          	beqz	a4,80003b18 <__global_pointer$+0xa8>
80003ae4:	f0020737          	lui	a4,0xf0020
80003ae8:	000186b7          	lui	a3,0x18
80003aec:	00072623          	sw	zero,12(a4) # f002000c <_ram_heap_end+0x7000800c>
80003af0:	6a068693          	addi	a3,a3,1696 # 186a0 <_stack_size+0x176a0>
80003af4:	00d72823          	sw	a3,16(a4)
80003af8:	00100693          	li	a3,1
80003afc:	00d72023          	sw	a3,0(a4)
80003b00:	8881a703          	lw	a4,-1912(gp) # 800032f8 <events_mac_poll>
80003b04:	00170713          	addi	a4,a4,1
80003b08:	88e1a423          	sw	a4,-1912(gp) # 800032f8 <events_mac_poll>
80003b0c:	0047a703          	lw	a4,4(a5)
80003b10:	ff777713          	andi	a4,a4,-9
80003b14:	00e7a223          	sw	a4,4(a5)
80003b18:	f00607b7          	lui	a5,0xf0060
80003b1c:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x70048004>
80003b20:	01077713          	andi	a4,a4,16
80003b24:	02070c63          	beqz	a4,80003b5c <__global_pointer$+0xec>
80003b28:	f0021737          	lui	a4,0xf0021
80003b2c:	0000c6b7          	lui	a3,0xc
80003b30:	00072623          	sw	zero,12(a4) # f002100c <_ram_heap_end+0x7000900c>
80003b34:	35068693          	addi	a3,a3,848 # c350 <_stack_size+0xb350>
80003b38:	00d72823          	sw	a3,16(a4)
80003b3c:	00100693          	li	a3,1
80003b40:	00d72023          	sw	a3,0(a4)
80003b44:	8801a703          	lw	a4,-1920(gp) # 800032f0 <events_modbus_rtu_poll>
80003b48:	00170713          	addi	a4,a4,1
80003b4c:	88e1a023          	sw	a4,-1920(gp) # 800032f0 <events_modbus_rtu_poll>
80003b50:	0047a703          	lw	a4,4(a5)
80003b54:	fef77713          	andi	a4,a4,-17
80003b58:	00e7a223          	sw	a4,4(a5)
80003b5c:	f00607b7          	lui	a5,0xf0060
80003b60:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x70048004>
80003b64:	02077713          	andi	a4,a4,32
80003b68:	00070863          	beqz	a4,80003b78 <__global_pointer$+0x108>
80003b6c:	0047a703          	lw	a4,4(a5)
80003b70:	fdf77713          	andi	a4,a4,-33
80003b74:	00e7a223          	sw	a4,4(a5)
80003b78:	f0060437          	lui	s0,0xf0060
80003b7c:	00442783          	lw	a5,4(s0) # f0060004 <_ram_heap_end+0x70048004>
80003b80:	0407f793          	andi	a5,a5,64
80003b84:	02078663          	beqz	a5,80003bb0 <__global_pointer$+0x140>
80003b88:	8781a783          	lw	a5,-1928(gp) # 800032e8 <audiodac0_irqs>
80003b8c:	00178793          	addi	a5,a5,1
80003b90:	86f1ac23          	sw	a5,-1928(gp) # 800032e8 <audiodac0_irqs>
80003b94:	4e4020ef          	jal	ra,80006078 <audiodac0_isr>
80003b98:	8741a783          	lw	a5,-1932(gp) # 800032e4 <audiodac0_samples_sent>
80003b9c:	00f50533          	add	a0,a0,a5
80003ba0:	86a1aa23          	sw	a0,-1932(gp) # 800032e4 <audiodac0_samples_sent>
80003ba4:	00442783          	lw	a5,4(s0)
80003ba8:	fbf7f793          	andi	a5,a5,-65
80003bac:	00f42223          	sw	a5,4(s0)
80003bb0:	00c12083          	lw	ra,12(sp)
80003bb4:	00812403          	lw	s0,8(sp)
80003bb8:	01010113          	addi	sp,sp,16
80003bbc:	00008067          	ret
80003bc0:	00072783          	lw	a5,0(a4)
80003bc4:	0ff7f513          	andi	a0,a5,255
80003bc8:	0ff7f693          	andi	a3,a5,255
80003bcc:	00472783          	lw	a5,4(a4)
80003bd0:	0107d793          	srli	a5,a5,0x10
80003bd4:	0ff7f793          	andi	a5,a5,255
80003bd8:	fe078ae3          	beqz	a5,80003bcc <__global_pointer$+0x15c>
80003bdc:	00d72023          	sw	a3,0(a4)
80003be0:	00b51a63          	bne	a0,a1,80003bf4 <__global_pointer$+0x184>
80003be4:	88c1a783          	lw	a5,-1908(gp) # 800032fc <uart_config_reset_counter>
80003be8:	00178793          	addi	a5,a5,1
80003bec:	88f1a623          	sw	a5,-1908(gp) # 800032fc <uart_config_reset_counter>
80003bf0:	e79ff06f          	j	80003a68 <externalInterrupt+0x34>
80003bf4:	8801a623          	sw	zero,-1908(gp) # 800032fc <uart_config_reset_counter>
80003bf8:	e71ff06f          	j	80003a68 <externalInterrupt+0x34>

80003bfc <crash>:
80003bfc:	ff010113          	addi	sp,sp,-16
80003c00:	00812423          	sw	s0,8(sp)
80003c04:	00050593          	mv	a1,a0
80003c08:	92418513          	addi	a0,gp,-1756 # 80003394 <crash_str>
80003c0c:	00112623          	sw	ra,12(sp)
80003c10:	c09ff0ef          	jal	ra,80003818 <to_hex>
80003c14:	80002537          	lui	a0,0x80002
80003c18:	38450513          	addi	a0,a0,900 # 80002384 <_ram_heap_end+0xfffea384>
80003c1c:	0f9020ef          	jal	ra,80006514 <print_uart0>
80003c20:	92418513          	addi	a0,gp,-1756 # 80003394 <crash_str>
80003c24:	0f1020ef          	jal	ra,80006514 <print_uart0>
80003c28:	00812403          	lw	s0,8(sp)
80003c2c:	00c12083          	lw	ra,12(sp)
80003c30:	80003537          	lui	a0,0x80003
80003c34:	8e850513          	addi	a0,a0,-1816 # 800028e8 <_ram_heap_end+0xfffea8e8>
80003c38:	01010113          	addi	sp,sp,16
80003c3c:	0d90206f          	j	80006514 <print_uart0>

80003c40 <irqCallback>:
80003c40:	89c1a783          	lw	a5,-1892(gp) # 8000330c <reg_irq_counter>
80003c44:	00178793          	addi	a5,a5,1
80003c48:	88f1ae23          	sw	a5,-1892(gp) # 8000330c <reg_irq_counter>
80003c4c:	342027f3          	csrr	a5,mcause
80003c50:	0207d263          	bgez	a5,80003c74 <irqCallback+0x34>
80003c54:	00f7f793          	andi	a5,a5,15
80003c58:	00700713          	li	a4,7
80003c5c:	02e78063          	beq	a5,a4,80003c7c <irqCallback+0x3c>
80003c60:	00b00713          	li	a4,11
80003c64:	00e79463          	bne	a5,a4,80003c6c <irqCallback+0x2c>
80003c68:	dcdff06f          	j	80003a34 <externalInterrupt>
80003c6c:	00200513          	li	a0,2
80003c70:	f8dff06f          	j	80003bfc <crash>
80003c74:	00100513          	li	a0,1
80003c78:	ff9ff06f          	j	80003c70 <irqCallback+0x30>
80003c7c:	00008067          	ret

80003c80 <modbus_rtu_init>:
80003c80:	fe010113          	addi	sp,sp,-32
80003c84:	00112e23          	sw	ra,28(sp)
80003c88:	00812c23          	sw	s0,24(sp)
80003c8c:	f0011437          	lui	s0,0xf0011
80003c90:	00842783          	lw	a5,8(s0) # f0011008 <_ram_heap_end+0x6fff9008>
80003c94:	9cc1a583          	lw	a1,-1588(gp) # 8000343c <active_config+0x18>
80003c98:	037a1537          	lui	a0,0x37a1
80003c9c:	74850513          	addi	a0,a0,1864 # 37a1748 <_stack_size+0x37a0748>
80003ca0:	00f12623          	sw	a5,12(sp)
80003ca4:	7cd090ef          	jal	ra,8000dc70 <__udivsi3>
80003ca8:	00500593          	li	a1,5
80003cac:	7c5090ef          	jal	ra,8000dc70 <__udivsi3>
80003cb0:	fff50713          	addi	a4,a0,-1
80003cb4:	00e42423          	sw	a4,8(s0)
80003cb8:	00600693          	li	a3,6
80003cbc:	00d42623          	sw	a3,12(s0)
80003cc0:	00c12783          	lw	a5,12(sp)
80003cc4:	80002537          	lui	a0,0x80002
80003cc8:	00000693          	li	a3,0
80003ccc:	00000613          	li	a2,0
80003cd0:	00700593          	li	a1,7
80003cd4:	39450513          	addi	a0,a0,916 # 80002394 <_ram_heap_end+0xfffea394>
80003cd8:	2780b0ef          	jal	ra,8000ef50 <iprintf>
80003cdc:	f00b07b7          	lui	a5,0xf00b0
80003ce0:	0007a603          	lw	a2,0(a5) # f00b0000 <_ram_heap_end+0x70098000>
80003ce4:	0047a683          	lw	a3,4(a5)
80003ce8:	8ac1a023          	sw	a2,-1888(gp) # 80003310 <modbus_rtu_rx_timestamp>
80003cec:	01c12083          	lw	ra,28(sp)
80003cf0:	01812403          	lw	s0,24(sp)
80003cf4:	8ad1a223          	sw	a3,-1884(gp) # 80003314 <modbus_rtu_rx_timestamp+0x4>
80003cf8:	8a01a423          	sw	zero,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003cfc:	02010113          	addi	sp,sp,32
80003d00:	00008067          	ret

80003d04 <modbus_rtu_poll>:
80003d04:	ef010113          	addi	sp,sp,-272
80003d08:	10812423          	sw	s0,264(sp)
80003d0c:	8a81a783          	lw	a5,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003d10:	10112623          	sw	ra,268(sp)
80003d14:	10912223          	sw	s1,260(sp)
80003d18:	08078e63          	beqz	a5,80003db4 <modbus_rtu_poll+0xb0>
80003d1c:	f00b07b7          	lui	a5,0xf00b0
80003d20:	0047a803          	lw	a6,4(a5) # f00b0004 <_ram_heap_end+0x70098004>
80003d24:	0007a783          	lw	a5,0(a5)
80003d28:	8a01a503          	lw	a0,-1888(gp) # 80003310 <modbus_rtu_rx_timestamp>
80003d2c:	8a41a583          	lw	a1,-1884(gp) # 80003314 <modbus_rtu_rx_timestamp+0x4>
80003d30:	40a786b3          	sub	a3,a5,a0
80003d34:	00d7b733          	sltu	a4,a5,a3
80003d38:	40b807b3          	sub	a5,a6,a1
80003d3c:	00e79863          	bne	a5,a4,80003d4c <modbus_rtu_poll+0x48>
80003d40:	000027b7          	lui	a5,0x2
80003d44:	70f78793          	addi	a5,a5,1807 # 270f <_stack_size+0x170f>
80003d48:	06d7f663          	bgeu	a5,a3,80003db4 <modbus_rtu_poll+0xb0>
80003d4c:	8a81a483          	lw	s1,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003d50:	08000793          	li	a5,128
80003d54:	00048613          	mv	a2,s1
80003d58:	0097f463          	bgeu	a5,s1,80003d60 <modbus_rtu_poll+0x5c>
80003d5c:	08000613          	li	a2,128
80003d60:	93418593          	addi	a1,gp,-1740 # 800033a4 <modbus_rtu_rx_buf>
80003d64:	00010513          	mv	a0,sp
80003d68:	5a90a0ef          	jal	ra,8000eb10 <memcpy>
80003d6c:	08010613          	addi	a2,sp,128
80003d70:	00048593          	mv	a1,s1
80003d74:	00010513          	mv	a0,sp
80003d78:	8a01a423          	sw	zero,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003d7c:	65d000ef          	jal	ra,80004bd8 <modbus_recv>
80003d80:	02050a63          	beqz	a0,80003db4 <modbus_rtu_poll+0xb0>
80003d84:	00000713          	li	a4,0
80003d88:	f00116b7          	lui	a3,0xf0011
80003d8c:	08010793          	addi	a5,sp,128
80003d90:	00e787b3          	add	a5,a5,a4
80003d94:	0007c603          	lbu	a2,0(a5)
80003d98:	0046a783          	lw	a5,4(a3) # f0011004 <_ram_heap_end+0x6fff9004>
80003d9c:	0107d793          	srli	a5,a5,0x10
80003da0:	0ff7f793          	andi	a5,a5,255
80003da4:	fe078ae3          	beqz	a5,80003d98 <modbus_rtu_poll+0x94>
80003da8:	00c6a023          	sw	a2,0(a3)
80003dac:	00170713          	addi	a4,a4,1
80003db0:	fce51ee3          	bne	a0,a4,80003d8c <modbus_rtu_poll+0x88>
80003db4:	10c12083          	lw	ra,268(sp)
80003db8:	10812403          	lw	s0,264(sp)
80003dbc:	10412483          	lw	s1,260(sp)
80003dc0:	11010113          	addi	sp,sp,272
80003dc4:	00008067          	ret

80003dc8 <modbus_rtu_rx>:
80003dc8:	ff010113          	addi	sp,sp,-16
80003dcc:	00812423          	sw	s0,8(sp)
80003dd0:	00912223          	sw	s1,4(sp)
80003dd4:	00112623          	sw	ra,12(sp)
80003dd8:	f00117b7          	lui	a5,0xf0011
80003ddc:	0007a683          	lw	a3,0(a5) # f0011000 <_ram_heap_end+0x6fff9000>
80003de0:	8a81a603          	lw	a2,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003de4:	0ff6f693          	andi	a3,a3,255
80003de8:	00160793          	addi	a5,a2,1 # 80001 <_stack_size+0x7f001>
80003dec:	8af1a423          	sw	a5,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003df0:	93418713          	addi	a4,gp,-1740 # 800033a4 <modbus_rtu_rx_buf>
80003df4:	00c70733          	add	a4,a4,a2
80003df8:	00d70023          	sb	a3,0(a4)
80003dfc:	8a81a683          	lw	a3,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003e00:	07f00713          	li	a4,127
80003e04:	93418493          	addi	s1,gp,-1740 # 800033a4 <modbus_rtu_rx_buf>
80003e08:	00d77463          	bgeu	a4,a3,80003e10 <modbus_rtu_rx+0x48>
80003e0c:	8a01a423          	sw	zero,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003e10:	f0011737          	lui	a4,0xf0011
80003e14:	00472783          	lw	a5,4(a4) # f0011004 <_ram_heap_end+0x6fff9004>
80003e18:	0187d793          	srli	a5,a5,0x18
80003e1c:	02079663          	bnez	a5,80003e48 <modbus_rtu_rx+0x80>
80003e20:	f00b07b7          	lui	a5,0xf00b0
80003e24:	0007a603          	lw	a2,0(a5) # f00b0000 <_ram_heap_end+0x70098000>
80003e28:	0047a683          	lw	a3,4(a5)
80003e2c:	00c12083          	lw	ra,12(sp)
80003e30:	00812403          	lw	s0,8(sp)
80003e34:	8ac1a023          	sw	a2,-1888(gp) # 80003310 <modbus_rtu_rx_timestamp>
80003e38:	8ad1a223          	sw	a3,-1884(gp) # 80003314 <modbus_rtu_rx_timestamp+0x4>
80003e3c:	00412483          	lw	s1,4(sp)
80003e40:	01010113          	addi	sp,sp,16
80003e44:	00008067          	ret
80003e48:	00472583          	lw	a1,4(a4)
80003e4c:	8a81a603          	lw	a2,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003e50:	80002537          	lui	a0,0x80002
80003e54:	0185d593          	srli	a1,a1,0x18
80003e58:	3f450513          	addi	a0,a0,1012 # 800023f4 <_ram_heap_end+0xfffea3f4>
80003e5c:	0f40b0ef          	jal	ra,8000ef50 <iprintf>
80003e60:	f00116b7          	lui	a3,0xf0011
80003e64:	07f00613          	li	a2,127
80003e68:	0046a783          	lw	a5,4(a3) # f0011004 <_ram_heap_end+0x6fff9004>
80003e6c:	0187d793          	srli	a5,a5,0x18
80003e70:	fa0788e3          	beqz	a5,80003e20 <modbus_rtu_rx+0x58>
80003e74:	0006a703          	lw	a4,0(a3)
80003e78:	8a81a783          	lw	a5,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003e7c:	0ff77713          	andi	a4,a4,255
80003e80:	00178593          	addi	a1,a5,1
80003e84:	8ab1a423          	sw	a1,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003e88:	00f487b3          	add	a5,s1,a5
80003e8c:	00e78023          	sb	a4,0(a5)
80003e90:	8a81a783          	lw	a5,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003e94:	fcf67ae3          	bgeu	a2,a5,80003e68 <modbus_rtu_rx+0xa0>
80003e98:	8a01a423          	sw	zero,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003e9c:	fcdff06f          	j	80003e68 <modbus_rtu_rx+0xa0>

80003ea0 <config_load>:
80003ea0:	0c050863          	beqz	a0,80003f70 <config_load+0xd0>
80003ea4:	fe010113          	addi	sp,sp,-32
80003ea8:	00812c23          	sw	s0,24(sp)
80003eac:	00912a23          	sw	s1,20(sp)
80003eb0:	01212823          	sw	s2,16(sp)
80003eb4:	01312623          	sw	s3,12(sp)
80003eb8:	00112e23          	sw	ra,28(sp)
80003ebc:	00050413          	mv	s0,a0
80003ec0:	00050913          	mv	s2,a0
80003ec4:	00000493          	li	s1,0
80003ec8:	02000993          	li	s3,32
80003ecc:	00090713          	mv	a4,s2
80003ed0:	00400693          	li	a3,4
80003ed4:	00048613          	mv	a2,s1
80003ed8:	05000593          	li	a1,80
80003edc:	f0090537          	lui	a0,0xf0090
80003ee0:	3fc000ef          	jal	ra,800042dc <eeprom_read_page>
80003ee4:	00400793          	li	a5,4
80003ee8:	02f50a63          	beq	a0,a5,80003f1c <config_load+0x7c>
80003eec:	80002537          	lui	a0,0x80002
80003ef0:	00400593          	li	a1,4
80003ef4:	42c50513          	addi	a0,a0,1068 # 8000242c <_ram_heap_end+0xfffea42c>
80003ef8:	0580b0ef          	jal	ra,8000ef50 <iprintf>
80003efc:	ffe00513          	li	a0,-2
80003f00:	01c12083          	lw	ra,28(sp)
80003f04:	01812403          	lw	s0,24(sp)
80003f08:	01412483          	lw	s1,20(sp)
80003f0c:	01012903          	lw	s2,16(sp)
80003f10:	00c12983          	lw	s3,12(sp)
80003f14:	02010113          	addi	sp,sp,32
80003f18:	00008067          	ret
80003f1c:	00448493          	addi	s1,s1,4
80003f20:	0ff4f493          	andi	s1,s1,255
80003f24:	00490913          	addi	s2,s2,4
80003f28:	fb3492e3          	bne	s1,s3,80003ecc <config_load+0x2c>
80003f2c:	01e00593          	li	a1,30
80003f30:	00040513          	mv	a0,s0
80003f34:	811ff0ef          	jal	ra,80003744 <crc16>
80003f38:	01e45603          	lhu	a2,30(s0)
80003f3c:	00050593          	mv	a1,a0
80003f40:	00a60c63          	beq	a2,a0,80003f58 <config_load+0xb8>
80003f44:	80002537          	lui	a0,0x80002
80003f48:	46050513          	addi	a0,a0,1120 # 80002460 <_ram_heap_end+0xfffea460>
80003f4c:	0040b0ef          	jal	ra,8000ef50 <iprintf>
80003f50:	ffd00513          	li	a0,-3
80003f54:	fadff06f          	j	80003f00 <config_load+0x60>
80003f58:	80002537          	lui	a0,0x80002
80003f5c:	02000593          	li	a1,32
80003f60:	49450513          	addi	a0,a0,1172 # 80002494 <_ram_heap_end+0xfffea494>
80003f64:	7ed0a0ef          	jal	ra,8000ef50 <iprintf>
80003f68:	00000513          	li	a0,0
80003f6c:	f95ff06f          	j	80003f00 <config_load+0x60>
80003f70:	fff00513          	li	a0,-1
80003f74:	00008067          	ret

80003f78 <config_save>:
80003f78:	fe010113          	addi	sp,sp,-32
80003f7c:	00912a23          	sw	s1,20(sp)
80003f80:	00112e23          	sw	ra,28(sp)
80003f84:	00812c23          	sw	s0,24(sp)
80003f88:	01212823          	sw	s2,16(sp)
80003f8c:	01312623          	sw	s3,12(sp)
80003f90:	01412423          	sw	s4,8(sp)
80003f94:	01512223          	sw	s5,4(sp)
80003f98:	fff00493          	li	s1,-1
80003f9c:	06050063          	beqz	a0,80003ffc <config_save+0x84>
80003fa0:	01e00593          	li	a1,30
80003fa4:	00050413          	mv	s0,a0
80003fa8:	f9cff0ef          	jal	ra,80003744 <crc16>
80003fac:	00a41f23          	sh	a0,30(s0)
80003fb0:	00000913          	li	s2,0
80003fb4:	00000993          	li	s3,0
80003fb8:	00800a93          	li	s5,8
80003fbc:	01240733          	add	a4,s0,s2
80003fc0:	00400693          	li	a3,4
80003fc4:	0ff97613          	andi	a2,s2,255
80003fc8:	05000593          	li	a1,80
80003fcc:	f0090537          	lui	a0,0xf0090
80003fd0:	0b8000ef          	jal	ra,80004088 <eeprom_write_page>
80003fd4:	00400793          	li	a5,4
80003fd8:	04f50663          	beq	a0,a5,80004024 <config_save+0xac>
80003fdc:	80002537          	lui	a0,0x80002
80003fe0:	00090713          	mv	a4,s2
80003fe4:	00098693          	mv	a3,s3
80003fe8:	00400613          	li	a2,4
80003fec:	05000593          	li	a1,80
80003ff0:	4cc50513          	addi	a0,a0,1228 # 800024cc <_ram_heap_end+0xfffea4cc>
80003ff4:	75d0a0ef          	jal	ra,8000ef50 <iprintf>
80003ff8:	ffe00493          	li	s1,-2
80003ffc:	01c12083          	lw	ra,28(sp)
80004000:	01812403          	lw	s0,24(sp)
80004004:	00048513          	mv	a0,s1
80004008:	01012903          	lw	s2,16(sp)
8000400c:	01412483          	lw	s1,20(sp)
80004010:	00c12983          	lw	s3,12(sp)
80004014:	00812a03          	lw	s4,8(sp)
80004018:	00412a83          	lw	s5,4(sp)
8000401c:	02010113          	addi	sp,sp,32
80004020:	00008067          	ret
80004024:	00a00a13          	li	s4,10
80004028:	05000593          	li	a1,80
8000402c:	f0090537          	lui	a0,0xf0090
80004030:	228000ef          	jal	ra,80004258 <eeprom_poll>
80004034:	00050493          	mv	s1,a0
80004038:	02050663          	beqz	a0,80004064 <config_save+0xec>
8000403c:	3e800513          	li	a0,1000
80004040:	fffa0a13          	addi	s4,s4,-1
80004044:	4a0020ef          	jal	ra,800064e4 <delay_us>
80004048:	fe0a10e3          	bnez	s4,80004028 <config_save+0xb0>
8000404c:	80002537          	lui	a0,0x80002
80004050:	05000593          	li	a1,80
80004054:	54c50513          	addi	a0,a0,1356 # 8000254c <_ram_heap_end+0xfffea54c>
80004058:	6f90a0ef          	jal	ra,8000ef50 <iprintf>
8000405c:	ffd00493          	li	s1,-3
80004060:	f9dff06f          	j	80003ffc <config_save+0x84>
80004064:	00198993          	addi	s3,s3,1 # 90080001 <_ram_heap_end+0x10068001>
80004068:	00490913          	addi	s2,s2,4
8000406c:	f55998e3          	bne	s3,s5,80003fbc <config_save+0x44>
80004070:	01e45603          	lhu	a2,30(s0)
80004074:	80002537          	lui	a0,0x80002
80004078:	02000593          	li	a1,32
8000407c:	51450513          	addi	a0,a0,1300 # 80002514 <_ram_heap_end+0xfffea514>
80004080:	6d10a0ef          	jal	ra,8000ef50 <iprintf>
80004084:	f79ff06f          	j	80003ffc <config_save+0x84>

80004088 <eeprom_write_page>:
80004088:	fe010113          	addi	sp,sp,-32
8000408c:	00812c23          	sw	s0,24(sp)
80004090:	00912a23          	sw	s1,20(sp)
80004094:	01212823          	sw	s2,16(sp)
80004098:	01412423          	sw	s4,8(sp)
8000409c:	01512223          	sw	s5,4(sp)
800040a0:	00112e23          	sw	ra,28(sp)
800040a4:	01312623          	sw	s3,12(sp)
800040a8:	01612023          	sw	s6,0(sp)
800040ac:	01500793          	li	a5,21
800040b0:	00159593          	slli	a1,a1,0x1
800040b4:	00f52623          	sw	a5,12(a0)
800040b8:	00018937          	lui	s2,0x18
800040bc:	00b52023          	sw	a1,0(a0)
800040c0:	6a090593          	addi	a1,s2,1696 # 186a0 <_stack_size+0x176a0>
800040c4:	00050413          	mv	s0,a0
800040c8:	00060493          	mv	s1,a2
800040cc:	00068a13          	mv	s4,a3
800040d0:	00070a93          	mv	s5,a4
800040d4:	35c020ef          	jal	ra,80006430 <i2c_wait_for_busy>
800040d8:	04051663          	bnez	a0,80004124 <eeprom_write_page+0x9c>
800040dc:	00042623          	sw	zero,12(s0)
800040e0:	00100613          	li	a2,1
800040e4:	80002537          	lui	a0,0x80002
800040e8:	00040593          	mv	a1,s0
800040ec:	57c50513          	addi	a0,a0,1404 # 8000257c <_ram_heap_end+0xfffea57c>
800040f0:	6610a0ef          	jal	ra,8000ef50 <iprintf>
800040f4:	fff00493          	li	s1,-1
800040f8:	01c12083          	lw	ra,28(sp)
800040fc:	01812403          	lw	s0,24(sp)
80004100:	00048513          	mv	a0,s1
80004104:	01012903          	lw	s2,16(sp)
80004108:	01412483          	lw	s1,20(sp)
8000410c:	00c12983          	lw	s3,12(sp)
80004110:	00812a03          	lw	s4,8(sp)
80004114:	00412a83          	lw	s5,4(sp)
80004118:	00012b03          	lw	s6,0(sp)
8000411c:	02010113          	addi	sp,sp,32
80004120:	00008067          	ret
80004124:	6a090593          	addi	a1,s2,1696
80004128:	00040513          	mv	a0,s0
8000412c:	330020ef          	jal	ra,8000645c <i2c_wait_for_release>
80004130:	00051863          	bnez	a0,80004140 <eeprom_write_page+0xb8>
80004134:	00042623          	sw	zero,12(s0)
80004138:	00200613          	li	a2,2
8000413c:	fa9ff06f          	j	800040e4 <eeprom_write_page+0x5c>
80004140:	00c42783          	lw	a5,12(s0)
80004144:	0407f793          	andi	a5,a5,64
80004148:	00078e63          	beqz	a5,80004164 <eeprom_write_page+0xdc>
8000414c:	00042623          	sw	zero,12(s0)
80004150:	00100613          	li	a2,1
80004154:	80002537          	lui	a0,0x80002
80004158:	00040593          	mv	a1,s0
8000415c:	5ac50513          	addi	a0,a0,1452 # 800025ac <_ram_heap_end+0xfffea5ac>
80004160:	f91ff06f          	j	800040f0 <eeprom_write_page+0x68>
80004164:	00200513          	li	a0,2
80004168:	37c020ef          	jal	ra,800064e4 <delay_us>
8000416c:	01100793          	li	a5,17
80004170:	00f42623          	sw	a5,12(s0)
80004174:	00942023          	sw	s1,0(s0)
80004178:	6a090593          	addi	a1,s2,1696
8000417c:	00040513          	mv	a0,s0
80004180:	2b0020ef          	jal	ra,80006430 <i2c_wait_for_busy>
80004184:	00051863          	bnez	a0,80004194 <eeprom_write_page+0x10c>
80004188:	00042623          	sw	zero,12(s0)
8000418c:	00300613          	li	a2,3
80004190:	f55ff06f          	j	800040e4 <eeprom_write_page+0x5c>
80004194:	6a090593          	addi	a1,s2,1696
80004198:	00040513          	mv	a0,s0
8000419c:	2c0020ef          	jal	ra,8000645c <i2c_wait_for_release>
800041a0:	00051863          	bnez	a0,800041b0 <eeprom_write_page+0x128>
800041a4:	00042623          	sw	zero,12(s0)
800041a8:	00400613          	li	a2,4
800041ac:	f39ff06f          	j	800040e4 <eeprom_write_page+0x5c>
800041b0:	00c42783          	lw	a5,12(s0)
800041b4:	00000993          	li	s3,0
800041b8:	0407f793          	andi	a5,a5,64
800041bc:	04079a63          	bnez	a5,80004210 <eeprom_write_page+0x188>
800041c0:	000a0493          	mv	s1,s4
800041c4:	fffa0b13          	addi	s6,s4,-1
800041c8:	6a090913          	addi	s2,s2,1696
800041cc:	f349d6e3          	bge	s3,s4,800040f8 <eeprom_write_page+0x70>
800041d0:	00200513          	li	a0,2
800041d4:	310020ef          	jal	ra,800064e4 <delay_us>
800041d8:	01100793          	li	a5,17
800041dc:	013b1463          	bne	s6,s3,800041e4 <eeprom_write_page+0x15c>
800041e0:	01900793          	li	a5,25
800041e4:	013a8733          	add	a4,s5,s3
800041e8:	00074703          	lbu	a4,0(a4)
800041ec:	00f42623          	sw	a5,12(s0)
800041f0:	00090593          	mv	a1,s2
800041f4:	00e42023          	sw	a4,0(s0)
800041f8:	00040513          	mv	a0,s0
800041fc:	234020ef          	jal	ra,80006430 <i2c_wait_for_busy>
80004200:	00051e63          	bnez	a0,8000421c <eeprom_write_page+0x194>
80004204:	00042623          	sw	zero,12(s0)
80004208:	00500613          	li	a2,5
8000420c:	ed9ff06f          	j	800040e4 <eeprom_write_page+0x5c>
80004210:	00042623          	sw	zero,12(s0)
80004214:	00200613          	li	a2,2
80004218:	f3dff06f          	j	80004154 <eeprom_write_page+0xcc>
8000421c:	00090593          	mv	a1,s2
80004220:	00040513          	mv	a0,s0
80004224:	238020ef          	jal	ra,8000645c <i2c_wait_for_release>
80004228:	00051863          	bnez	a0,80004238 <eeprom_write_page+0x1b0>
8000422c:	00042623          	sw	zero,12(s0)
80004230:	00600613          	li	a2,6
80004234:	eb1ff06f          	j	800040e4 <eeprom_write_page+0x5c>
80004238:	00c42783          	lw	a5,12(s0)
8000423c:	0407f793          	andi	a5,a5,64
80004240:	00078863          	beqz	a5,80004250 <eeprom_write_page+0x1c8>
80004244:	00042623          	sw	zero,12(s0)
80004248:	00300613          	li	a2,3
8000424c:	f09ff06f          	j	80004154 <eeprom_write_page+0xcc>
80004250:	00198993          	addi	s3,s3,1
80004254:	f79ff06f          	j	800041cc <eeprom_write_page+0x144>

80004258 <eeprom_poll>:
80004258:	ff010113          	addi	sp,sp,-16
8000425c:	00812423          	sw	s0,8(sp)
80004260:	00912223          	sw	s1,4(sp)
80004264:	00112623          	sw	ra,12(sp)
80004268:	01d00793          	li	a5,29
8000426c:	00159593          	slli	a1,a1,0x1
80004270:	00f52623          	sw	a5,12(a0)
80004274:	000184b7          	lui	s1,0x18
80004278:	00b52023          	sw	a1,0(a0)
8000427c:	6a048593          	addi	a1,s1,1696 # 186a0 <_stack_size+0x176a0>
80004280:	00050413          	mv	s0,a0
80004284:	1ac020ef          	jal	ra,80006430 <i2c_wait_for_busy>
80004288:	00100613          	li	a2,1
8000428c:	00050c63          	beqz	a0,800042a4 <eeprom_poll+0x4c>
80004290:	6a048593          	addi	a1,s1,1696
80004294:	00040513          	mv	a0,s0
80004298:	1c4020ef          	jal	ra,8000645c <i2c_wait_for_release>
8000429c:	02051863          	bnez	a0,800042cc <eeprom_poll+0x74>
800042a0:	00200613          	li	a2,2
800042a4:	80002537          	lui	a0,0x80002
800042a8:	00040593          	mv	a1,s0
800042ac:	5dc50513          	addi	a0,a0,1500 # 800025dc <_ram_heap_end+0xfffea5dc>
800042b0:	4a10a0ef          	jal	ra,8000ef50 <iprintf>
800042b4:	fff00513          	li	a0,-1
800042b8:	00c12083          	lw	ra,12(sp)
800042bc:	00812403          	lw	s0,8(sp)
800042c0:	00412483          	lw	s1,4(sp)
800042c4:	01010113          	addi	sp,sp,16
800042c8:	00008067          	ret
800042cc:	00c42503          	lw	a0,12(s0)
800042d0:	00655513          	srli	a0,a0,0x6
800042d4:	00157513          	andi	a0,a0,1
800042d8:	fe1ff06f          	j	800042b8 <eeprom_poll+0x60>

800042dc <eeprom_read_page>:
800042dc:	fd010113          	addi	sp,sp,-48
800042e0:	02812423          	sw	s0,40(sp)
800042e4:	02912223          	sw	s1,36(sp)
800042e8:	03212023          	sw	s2,32(sp)
800042ec:	01312e23          	sw	s3,28(sp)
800042f0:	01412c23          	sw	s4,24(sp)
800042f4:	01512a23          	sw	s5,20(sp)
800042f8:	01612823          	sw	s6,16(sp)
800042fc:	02112623          	sw	ra,44(sp)
80004300:	01712623          	sw	s7,12(sp)
80004304:	01500993          	li	s3,21
80004308:	00159493          	slli	s1,a1,0x1
8000430c:	01352623          	sw	s3,12(a0)
80004310:	00018937          	lui	s2,0x18
80004314:	00952023          	sw	s1,0(a0)
80004318:	6a090593          	addi	a1,s2,1696 # 186a0 <_stack_size+0x176a0>
8000431c:	00050413          	mv	s0,a0
80004320:	00060b13          	mv	s6,a2
80004324:	00068a13          	mv	s4,a3
80004328:	00070a93          	mv	s5,a4
8000432c:	104020ef          	jal	ra,80006430 <i2c_wait_for_busy>
80004330:	00051e63          	bnez	a0,8000434c <eeprom_read_page+0x70>
80004334:	00042623          	sw	zero,12(s0)
80004338:	00100613          	li	a2,1
8000433c:	80002537          	lui	a0,0x80002
80004340:	00040593          	mv	a1,s0
80004344:	60450513          	addi	a0,a0,1540 # 80002604 <_ram_heap_end+0xfffea604>
80004348:	0400006f          	j	80004388 <eeprom_read_page+0xac>
8000434c:	6a090593          	addi	a1,s2,1696
80004350:	00040513          	mv	a0,s0
80004354:	108020ef          	jal	ra,8000645c <i2c_wait_for_release>
80004358:	00051863          	bnez	a0,80004368 <eeprom_read_page+0x8c>
8000435c:	00042623          	sw	zero,12(s0)
80004360:	00200613          	li	a2,2
80004364:	fd9ff06f          	j	8000433c <eeprom_read_page+0x60>
80004368:	00c42783          	lw	a5,12(s0)
8000436c:	0407f793          	andi	a5,a5,64
80004370:	04078863          	beqz	a5,800043c0 <eeprom_read_page+0xe4>
80004374:	00042623          	sw	zero,12(s0)
80004378:	00100613          	li	a2,1
8000437c:	80002537          	lui	a0,0x80002
80004380:	00040593          	mv	a1,s0
80004384:	63450513          	addi	a0,a0,1588 # 80002634 <_ram_heap_end+0xfffea634>
80004388:	3c90a0ef          	jal	ra,8000ef50 <iprintf>
8000438c:	fff00493          	li	s1,-1
80004390:	02c12083          	lw	ra,44(sp)
80004394:	02812403          	lw	s0,40(sp)
80004398:	00048513          	mv	a0,s1
8000439c:	02012903          	lw	s2,32(sp)
800043a0:	02412483          	lw	s1,36(sp)
800043a4:	01c12983          	lw	s3,28(sp)
800043a8:	01812a03          	lw	s4,24(sp)
800043ac:	01412a83          	lw	s5,20(sp)
800043b0:	01012b03          	lw	s6,16(sp)
800043b4:	00c12b83          	lw	s7,12(sp)
800043b8:	03010113          	addi	sp,sp,48
800043bc:	00008067          	ret
800043c0:	00200513          	li	a0,2
800043c4:	120020ef          	jal	ra,800064e4 <delay_us>
800043c8:	01900793          	li	a5,25
800043cc:	00f42623          	sw	a5,12(s0)
800043d0:	01642023          	sw	s6,0(s0)
800043d4:	6a090593          	addi	a1,s2,1696
800043d8:	00040513          	mv	a0,s0
800043dc:	054020ef          	jal	ra,80006430 <i2c_wait_for_busy>
800043e0:	00051863          	bnez	a0,800043f0 <eeprom_read_page+0x114>
800043e4:	00042623          	sw	zero,12(s0)
800043e8:	00300613          	li	a2,3
800043ec:	f51ff06f          	j	8000433c <eeprom_read_page+0x60>
800043f0:	6a090593          	addi	a1,s2,1696
800043f4:	00040513          	mv	a0,s0
800043f8:	064020ef          	jal	ra,8000645c <i2c_wait_for_release>
800043fc:	00051863          	bnez	a0,8000440c <eeprom_read_page+0x130>
80004400:	00042623          	sw	zero,12(s0)
80004404:	00400613          	li	a2,4
80004408:	f35ff06f          	j	8000433c <eeprom_read_page+0x60>
8000440c:	00c42783          	lw	a5,12(s0)
80004410:	0407f793          	andi	a5,a5,64
80004414:	00078863          	beqz	a5,80004424 <eeprom_read_page+0x148>
80004418:	00042623          	sw	zero,12(s0)
8000441c:	00200613          	li	a2,2
80004420:	f5dff06f          	j	8000437c <eeprom_read_page+0xa0>
80004424:	00200513          	li	a0,2
80004428:	0bc020ef          	jal	ra,800064e4 <delay_us>
8000442c:	0014e493          	ori	s1,s1,1
80004430:	01342623          	sw	s3,12(s0)
80004434:	00942023          	sw	s1,0(s0)
80004438:	6a090593          	addi	a1,s2,1696
8000443c:	00040513          	mv	a0,s0
80004440:	7f1010ef          	jal	ra,80006430 <i2c_wait_for_busy>
80004444:	00051863          	bnez	a0,80004454 <eeprom_read_page+0x178>
80004448:	00042623          	sw	zero,12(s0)
8000444c:	00500613          	li	a2,5
80004450:	eedff06f          	j	8000433c <eeprom_read_page+0x60>
80004454:	6a090593          	addi	a1,s2,1696
80004458:	00040513          	mv	a0,s0
8000445c:	000020ef          	jal	ra,8000645c <i2c_wait_for_release>
80004460:	00051863          	bnez	a0,80004470 <eeprom_read_page+0x194>
80004464:	00042623          	sw	zero,12(s0)
80004468:	00600613          	li	a2,6
8000446c:	ed1ff06f          	j	8000433c <eeprom_read_page+0x60>
80004470:	00c42783          	lw	a5,12(s0)
80004474:	00000993          	li	s3,0
80004478:	0407f793          	andi	a5,a5,64
8000447c:	04079863          	bnez	a5,800044cc <eeprom_read_page+0x1f0>
80004480:	000a0493          	mv	s1,s4
80004484:	fffa0b13          	addi	s6,s4,-1
80004488:	0ff00b93          	li	s7,255
8000448c:	6a090913          	addi	s2,s2,1696
80004490:	f149d0e3          	bge	s3,s4,80004390 <eeprom_read_page+0xb4>
80004494:	00200513          	li	a0,2
80004498:	04c020ef          	jal	ra,800064e4 <delay_us>
8000449c:	02100793          	li	a5,33
800044a0:	013b1463          	bne	s6,s3,800044a8 <eeprom_read_page+0x1cc>
800044a4:	00900793          	li	a5,9
800044a8:	00f42623          	sw	a5,12(s0)
800044ac:	01742023          	sw	s7,0(s0)
800044b0:	00090593          	mv	a1,s2
800044b4:	00040513          	mv	a0,s0
800044b8:	779010ef          	jal	ra,80006430 <i2c_wait_for_busy>
800044bc:	00051e63          	bnez	a0,800044d8 <eeprom_read_page+0x1fc>
800044c0:	00042623          	sw	zero,12(s0)
800044c4:	00700613          	li	a2,7
800044c8:	e75ff06f          	j	8000433c <eeprom_read_page+0x60>
800044cc:	00042623          	sw	zero,12(s0)
800044d0:	00300613          	li	a2,3
800044d4:	ea9ff06f          	j	8000437c <eeprom_read_page+0xa0>
800044d8:	00090593          	mv	a1,s2
800044dc:	00040513          	mv	a0,s0
800044e0:	77d010ef          	jal	ra,8000645c <i2c_wait_for_release>
800044e4:	00051863          	bnez	a0,800044f4 <eeprom_read_page+0x218>
800044e8:	00042623          	sw	zero,12(s0)
800044ec:	00800613          	li	a2,8
800044f0:	e4dff06f          	j	8000433c <eeprom_read_page+0x60>
800044f4:	00442703          	lw	a4,4(s0)
800044f8:	013a87b3          	add	a5,s5,s3
800044fc:	00198993          	addi	s3,s3,1
80004500:	00e78023          	sb	a4,0(a5)
80004504:	f8dff06f          	j	80004490 <eeprom_read_page+0x1b4>

80004508 <eeprom_probe>:
80004508:	fe010113          	addi	sp,sp,-32
8000450c:	00912a23          	sw	s1,20(sp)
80004510:	00050493          	mv	s1,a0
80004514:	80002537          	lui	a0,0x80002
80004518:	05000593          	li	a1,80
8000451c:	66050513          	addi	a0,a0,1632 # 80002660 <_ram_heap_end+0xfffea660>
80004520:	00112e23          	sw	ra,28(sp)
80004524:	01212823          	sw	s2,16(sp)
80004528:	00812c23          	sw	s0,24(sp)
8000452c:	2250a0ef          	jal	ra,8000ef50 <iprintf>
80004530:	deadc7b7          	lui	a5,0xdeadc
80004534:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac3eef>
80004538:	00c10713          	addi	a4,sp,12
8000453c:	00400693          	li	a3,4
80004540:	07c00613          	li	a2,124
80004544:	05000593          	li	a1,80
80004548:	00048513          	mv	a0,s1
8000454c:	00f12623          	sw	a5,12(sp)
80004550:	b39ff0ef          	jal	ra,80004088 <eeprom_write_page>
80004554:	00400793          	li	a5,4
80004558:	00a00913          	li	s2,10
8000455c:	00f50c63          	beq	a0,a5,80004574 <eeprom_probe+0x6c>
80004560:	80002537          	lui	a0,0x80002
80004564:	05000593          	li	a1,80
80004568:	67c50513          	addi	a0,a0,1660 # 8000267c <_ram_heap_end+0xfffea67c>
8000456c:	1e50a0ef          	jal	ra,8000ef50 <iprintf>
80004570:	0580006f          	j	800045c8 <eeprom_probe+0xc0>
80004574:	05000593          	li	a1,80
80004578:	00048513          	mv	a0,s1
8000457c:	cddff0ef          	jal	ra,80004258 <eeprom_poll>
80004580:	00050413          	mv	s0,a0
80004584:	06050a63          	beqz	a0,800045f8 <eeprom_probe+0xf0>
80004588:	3e800513          	li	a0,1000
8000458c:	fff90913          	addi	s2,s2,-1
80004590:	755010ef          	jal	ra,800064e4 <delay_us>
80004594:	fe0910e3          	bnez	s2,80004574 <eeprom_probe+0x6c>
80004598:	80002537          	lui	a0,0x80002
8000459c:	05000593          	li	a1,80
800045a0:	72050513          	addi	a0,a0,1824 # 80002720 <_ram_heap_end+0xfffea720>
800045a4:	fc9ff06f          	j	8000456c <eeprom_probe+0x64>
800045a8:	00c12603          	lw	a2,12(sp)
800045ac:	deadc7b7          	lui	a5,0xdeadc
800045b0:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac3eef>
800045b4:	05000593          	li	a1,80
800045b8:	00f60c63          	beq	a2,a5,800045d0 <eeprom_probe+0xc8>
800045bc:	80002537          	lui	a0,0x80002
800045c0:	6d450513          	addi	a0,a0,1748 # 800026d4 <_ram_heap_end+0xfffea6d4>
800045c4:	18d0a0ef          	jal	ra,8000ef50 <iprintf>
800045c8:	fff00413          	li	s0,-1
800045cc:	0100006f          	j	800045dc <eeprom_probe+0xd4>
800045d0:	80002537          	lui	a0,0x80002
800045d4:	70850513          	addi	a0,a0,1800 # 80002708 <_ram_heap_end+0xfffea708>
800045d8:	1790a0ef          	jal	ra,8000ef50 <iprintf>
800045dc:	00040513          	mv	a0,s0
800045e0:	01c12083          	lw	ra,28(sp)
800045e4:	01812403          	lw	s0,24(sp)
800045e8:	01412483          	lw	s1,20(sp)
800045ec:	01012903          	lw	s2,16(sp)
800045f0:	02010113          	addi	sp,sp,32
800045f4:	00008067          	ret
800045f8:	00c10713          	addi	a4,sp,12
800045fc:	00400693          	li	a3,4
80004600:	07c00613          	li	a2,124
80004604:	05000593          	li	a1,80
80004608:	00048513          	mv	a0,s1
8000460c:	00012623          	sw	zero,12(sp)
80004610:	ccdff0ef          	jal	ra,800042dc <eeprom_read_page>
80004614:	00400793          	li	a5,4
80004618:	f8f508e3          	beq	a0,a5,800045a8 <eeprom_probe+0xa0>
8000461c:	80002537          	lui	a0,0x80002
80004620:	05000593          	li	a1,80
80004624:	6a850513          	addi	a0,a0,1704 # 800026a8 <_ram_heap_end+0xfffea6a8>
80004628:	f45ff06f          	j	8000456c <eeprom_probe+0x64>

8000462c <modbus_error>:
8000462c:	ff010113          	addi	sp,sp,-16
80004630:	00812423          	sw	s0,8(sp)
80004634:	00912223          	sw	s1,4(sp)
80004638:	01212023          	sw	s2,0(sp)
8000463c:	00060413          	mv	s0,a2
80004640:	00058913          	mv	s2,a1
80004644:	00058613          	mv	a2,a1
80004648:	00050493          	mv	s1,a0
8000464c:	00050593          	mv	a1,a0
80004650:	80002537          	lui	a0,0x80002
80004654:	79450513          	addi	a0,a0,1940 # 80002794 <_ram_heap_end+0xfffea794>
80004658:	00112623          	sw	ra,12(sp)
8000465c:	0f50a0ef          	jal	ra,8000ef50 <iprintf>
80004660:	9c81c783          	lbu	a5,-1592(gp) # 80003438 <active_config+0x14>
80004664:	f804e493          	ori	s1,s1,-128
80004668:	009400a3          	sb	s1,1(s0)
8000466c:	01240123          	sb	s2,2(s0)
80004670:	00040513          	mv	a0,s0
80004674:	00f40023          	sb	a5,0(s0)
80004678:	00300593          	li	a1,3
8000467c:	920ff0ef          	jal	ra,8000379c <add_crc>
80004680:	00c12083          	lw	ra,12(sp)
80004684:	00812403          	lw	s0,8(sp)
80004688:	00412483          	lw	s1,4(sp)
8000468c:	00012903          	lw	s2,0(sp)
80004690:	00500513          	li	a0,5
80004694:	01010113          	addi	sp,sp,16
80004698:	00008067          	ret

8000469c <modbus_store_reg>:
8000469c:	fd010113          	addi	sp,sp,-48
800046a0:	fd850793          	addi	a5,a0,-40
800046a4:	02812423          	sw	s0,40(sp)
800046a8:	02912223          	sw	s1,36(sp)
800046ac:	02112623          	sw	ra,44(sp)
800046b0:	03212023          	sw	s2,32(sp)
800046b4:	03010413          	addi	s0,sp,48
800046b8:	01079793          	slli	a5,a5,0x10
800046bc:	0107d793          	srli	a5,a5,0x10
800046c0:	00900713          	li	a4,9
800046c4:	00058493          	mv	s1,a1
800046c8:	02f76063          	bltu	a4,a5,800046e8 <modbus_store_reg+0x4c>
800046cc:	8901a783          	lw	a5,-1904(gp) # 80003300 <reg_config_write>
800046d0:	00079c63          	bnez	a5,800046e8 <modbus_store_reg+0x4c>
800046d4:	80002537          	lui	a0,0x80002
800046d8:	7b850513          	addi	a0,a0,1976 # 800027b8 <_ram_heap_end+0xfffea7b8>
800046dc:	0750a0ef          	jal	ra,8000ef50 <iprintf>
800046e0:	ffe00913          	li	s2,-2
800046e4:	0380006f          	j	8000471c <modbus_store_reg+0x80>
800046e8:	02f00793          	li	a5,47
800046ec:	4af50c63          	beq	a0,a5,80004ba4 <modbus_store_reg+0x508>
800046f0:	0aa7e863          	bltu	a5,a0,800047a0 <modbus_store_reg+0x104>
800046f4:	02a00793          	li	a5,42
800046f8:	44f50663          	beq	a0,a5,80004b44 <modbus_store_reg+0x4a8>
800046fc:	04a7e063          	bltu	a5,a0,8000473c <modbus_store_reg+0xa0>
80004700:	02000793          	li	a5,32
80004704:	2ef50e63          	beq	a0,a5,80004a00 <modbus_store_reg+0x364>
80004708:	02900793          	li	a5,41
8000470c:	40f50263          	beq	a0,a5,80004b10 <modbus_store_reg+0x474>
80004710:	01400793          	li	a5,20
80004714:	24f50063          	beq	a0,a5,80004954 <modbus_store_reg+0x2b8>
80004718:	fff00913          	li	s2,-1
8000471c:	fd040113          	addi	sp,s0,-48
80004720:	02c12083          	lw	ra,44(sp)
80004724:	00090513          	mv	a0,s2
80004728:	02812403          	lw	s0,40(sp)
8000472c:	02412483          	lw	s1,36(sp)
80004730:	02012903          	lw	s2,32(sp)
80004734:	03010113          	addi	sp,sp,48
80004738:	00008067          	ret
8000473c:	02c00793          	li	a5,44
80004740:	36f50463          	beq	a0,a5,80004aa8 <modbus_store_reg+0x40c>
80004744:	42f56863          	bltu	a0,a5,80004b74 <modbus_store_reg+0x4d8>
80004748:	02d00793          	li	a5,45
8000474c:	fcf516e3          	bne	a0,a5,80004718 <modbus_store_reg+0x7c>
80004750:	fd040513          	addi	a0,s0,-48
80004754:	f4cff0ef          	jal	ra,80003ea0 <config_load>
80004758:	00055c63          	bgez	a0,80004770 <modbus_store_reg+0xd4>
8000475c:	800035b7          	lui	a1,0x80003
80004760:	02000613          	li	a2,32
80004764:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004768:	fd040513          	addi	a0,s0,-48
8000476c:	3a40a0ef          	jal	ra,8000eb10 <memcpy>
80004770:	0004c783          	lbu	a5,0(s1)
80004774:	0014c703          	lbu	a4,1(s1)
80004778:	01879793          	slli	a5,a5,0x18
8000477c:	01071713          	slli	a4,a4,0x10
80004780:	00e7e7b3          	or	a5,a5,a4
80004784:	0034c703          	lbu	a4,3(s1)
80004788:	00e7e7b3          	or	a5,a5,a4
8000478c:	0024c703          	lbu	a4,2(s1)
80004790:	00871713          	slli	a4,a4,0x8
80004794:	00e7e7b3          	or	a5,a5,a4
80004798:	fef42423          	sw	a5,-24(s0)
8000479c:	3340006f          	j	80004ad0 <modbus_store_reg+0x434>
800047a0:	03300793          	li	a5,51
800047a4:	0ef50863          	beq	a0,a5,80004894 <modbus_store_reg+0x1f8>
800047a8:	0aa7e863          	bltu	a5,a0,80004858 <modbus_store_reg+0x1bc>
800047ac:	03100793          	li	a5,49
800047b0:	32f50a63          	beq	a0,a5,80004ae4 <modbus_store_reg+0x448>
800047b4:	2aa7f663          	bgeu	a5,a0,80004a60 <modbus_store_reg+0x3c4>
800047b8:	0014c783          	lbu	a5,1(s1)
800047bc:	0004c503          	lbu	a0,0(s1)
800047c0:	0024c583          	lbu	a1,2(s1)
800047c4:	00879793          	slli	a5,a5,0x8
800047c8:	00a7e7b3          	or	a5,a5,a0
800047cc:	00879513          	slli	a0,a5,0x8
800047d0:	0087d793          	srli	a5,a5,0x8
800047d4:	00f567b3          	or	a5,a0,a5
800047d8:	01079513          	slli	a0,a5,0x10
800047dc:	0034c783          	lbu	a5,3(s1)
800047e0:	0044c703          	lbu	a4,4(s1)
800047e4:	01055513          	srli	a0,a0,0x10
800047e8:	00879793          	slli	a5,a5,0x8
800047ec:	00b7e7b3          	or	a5,a5,a1
800047f0:	00879593          	slli	a1,a5,0x8
800047f4:	0087d793          	srli	a5,a5,0x8
800047f8:	00f5e7b3          	or	a5,a1,a5
800047fc:	01079593          	slli	a1,a5,0x10
80004800:	0054c783          	lbu	a5,5(s1)
80004804:	0105d593          	srli	a1,a1,0x10
80004808:	ffd00913          	li	s2,-3
8000480c:	00879793          	slli	a5,a5,0x8
80004810:	00e7e7b3          	or	a5,a5,a4
80004814:	00879713          	slli	a4,a5,0x8
80004818:	0087d793          	srli	a5,a5,0x8
8000481c:	00f767b3          	or	a5,a4,a5
80004820:	01079793          	slli	a5,a5,0x10
80004824:	0107d793          	srli	a5,a5,0x10
80004828:	ffa60713          	addi	a4,a2,-6
8000482c:	ee0608e3          	beqz	a2,8000471c <modbus_store_reg+0x80>
80004830:	800036b7          	lui	a3,0x80003
80004834:	2706a603          	lw	a2,624(a3) # 80003270 <_ram_heap_end+0xfffeb270>
80004838:	00648693          	addi	a3,s1,6
8000483c:	1a079863          	bnez	a5,800049ec <modbus_store_reg+0x350>
80004840:	800007b7          	lui	a5,0x80000
80004844:	00800893          	li	a7,8
80004848:	00600813          	li	a6,6
8000484c:	13478793          	addi	a5,a5,308 # 80000134 <_ram_heap_end+0xfffe8134>
80004850:	2dc010ef          	jal	ra,80005b2c <hub_print>
80004854:	0500006f          	j	800048a4 <modbus_store_reg+0x208>
80004858:	03c00793          	li	a5,60
8000485c:	04f50863          	beq	a0,a5,800048ac <modbus_store_reg+0x210>
80004860:	00a7ee63          	bltu	a5,a0,8000487c <modbus_store_reg+0x1e0>
80004864:	03400793          	li	a5,52
80004868:	eaf518e3          	bne	a0,a5,80004718 <modbus_store_reg+0x7c>
8000486c:	0034c703          	lbu	a4,3(s1)
80004870:	800037b7          	lui	a5,0x80003
80004874:	26e7a823          	sw	a4,624(a5) # 80003270 <_ram_heap_end+0xfffeb270>
80004878:	02c0006f          	j	800048a4 <modbus_store_reg+0x208>
8000487c:	07e00793          	li	a5,126
80004880:	1af50863          	beq	a0,a5,80004a30 <modbus_store_reg+0x394>
80004884:	07f00793          	li	a5,127
80004888:	e8f518e3          	bne	a0,a5,80004718 <modbus_store_reg+0x7c>
8000488c:	5cd010ef          	jal	ra,80006658 <hard_reboot>
80004890:	0140006f          	j	800048a4 <modbus_store_reg+0x208>
80004894:	8c81a603          	lw	a2,-1848(gp) # 80003338 <hub_frame_size>
80004898:	00000593          	li	a1,0
8000489c:	f0050537          	lui	a0,0xf0050
800048a0:	4c1080ef          	jal	ra,8000d560 <memset>
800048a4:	00000913          	li	s2,0
800048a8:	e75ff06f          	j	8000471c <modbus_store_reg+0x80>
800048ac:	00165593          	srli	a1,a2,0x1
800048b0:	00159793          	slli	a5,a1,0x1
800048b4:	00f78793          	addi	a5,a5,15
800048b8:	0047d793          	srli	a5,a5,0x4
800048bc:	00479793          	slli	a5,a5,0x4
800048c0:	00010913          	mv	s2,sp
800048c4:	40f10133          	sub	sp,sp,a5
800048c8:	00010513          	mv	a0,sp
800048cc:	00048693          	mv	a3,s1
800048d0:	00000713          	li	a4,0
800048d4:	04b74c63          	blt	a4,a1,8000492c <modbus_store_reg+0x290>
800048d8:	00000613          	li	a2,0
800048dc:	095010ef          	jal	ra,80006170 <audiodac0_submit_buffer>
800048e0:	8d41a603          	lw	a2,-1836(gp) # 80003344 <audiodac0_tx_ring_buffer_playback_ptr>
800048e4:	8d01a683          	lw	a3,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
800048e8:	40c687b3          	sub	a5,a3,a2
800048ec:	00c6da63          	bge	a3,a2,80004900 <modbus_store_reg+0x264>
800048f0:	8d81a783          	lw	a5,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
800048f4:	40c787b3          	sub	a5,a5,a2
800048f8:	00d787b3          	add	a5,a5,a3
800048fc:	fff78793          	addi	a5,a5,-1
80004900:	4087d693          	srai	a3,a5,0x8
80004904:	00d48023          	sb	a3,0(s1)
80004908:	00f480a3          	sb	a5,1(s1)
8000490c:	8d81a783          	lw	a5,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
80004910:	4087d793          	srai	a5,a5,0x8
80004914:	00f48123          	sb	a5,2(s1)
80004918:	8d81a783          	lw	a5,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
8000491c:	00f481a3          	sb	a5,3(s1)
80004920:	00090113          	mv	sp,s2
80004924:	00400913          	li	s2,4
80004928:	df5ff06f          	j	8000471c <modbus_store_reg+0x80>
8000492c:	0006c783          	lbu	a5,0(a3)
80004930:	0016c803          	lbu	a6,1(a3)
80004934:	00171613          	slli	a2,a4,0x1
80004938:	00879793          	slli	a5,a5,0x8
8000493c:	00c50633          	add	a2,a0,a2
80004940:	0107e7b3          	or	a5,a5,a6
80004944:	00f61023          	sh	a5,0(a2)
80004948:	00170713          	addi	a4,a4,1
8000494c:	00268693          	addi	a3,a3,2
80004950:	f85ff06f          	j	800048d4 <modbus_store_reg+0x238>
80004954:	0014c703          	lbu	a4,1(s1)
80004958:	0004c783          	lbu	a5,0(s1)
8000495c:	40000593          	li	a1,1024
80004960:	00871713          	slli	a4,a4,0x8
80004964:	00f76733          	or	a4,a4,a5
80004968:	00871793          	slli	a5,a4,0x8
8000496c:	00875713          	srli	a4,a4,0x8
80004970:	00e7e7b3          	or	a5,a5,a4
80004974:	00001737          	lui	a4,0x1
80004978:	01079793          	slli	a5,a5,0x10
8000497c:	00270713          	addi	a4,a4,2 # 1002 <_stack_size+0x2>
80004980:	0107d793          	srli	a5,a5,0x10
80004984:	00c76c63          	bltu	a4,a2,8000499c <modbus_store_reg+0x300>
80004988:	ffe60613          	addi	a2,a2,-2
8000498c:	41f65593          	srai	a1,a2,0x1f
80004990:	0035f593          	andi	a1,a1,3
80004994:	00c585b3          	add	a1,a1,a2
80004998:	4025d593          	srai	a1,a1,0x2
8000499c:	00259593          	slli	a1,a1,0x2
800049a0:	00b485b3          	add	a1,s1,a1
800049a4:	f0050537          	lui	a0,0xf0050
800049a8:	00478613          	addi	a2,a5,4
800049ac:	eeb48ce3          	beq	s1,a1,800048a4 <modbus_store_reg+0x208>
800049b0:	0054c703          	lbu	a4,5(s1)
800049b4:	0044c683          	lbu	a3,4(s1)
800049b8:	00f507b3          	add	a5,a0,a5
800049bc:	01871713          	slli	a4,a4,0x18
800049c0:	01069693          	slli	a3,a3,0x10
800049c4:	00d76733          	or	a4,a4,a3
800049c8:	0024c683          	lbu	a3,2(s1)
800049cc:	00448493          	addi	s1,s1,4
800049d0:	00d76733          	or	a4,a4,a3
800049d4:	fff4c683          	lbu	a3,-1(s1)
800049d8:	00869693          	slli	a3,a3,0x8
800049dc:	00d76733          	or	a4,a4,a3
800049e0:	00e7a023          	sw	a4,0(a5)
800049e4:	00060793          	mv	a5,a2
800049e8:	fc1ff06f          	j	800049a8 <modbus_store_reg+0x30c>
800049ec:	800007b7          	lui	a5,0x80000
800049f0:	01000893          	li	a7,16
800049f4:	00c00813          	li	a6,12
800049f8:	73478793          	addi	a5,a5,1844 # 80000734 <_ram_heap_end+0xfffe8734>
800049fc:	e55ff06f          	j	80004850 <modbus_store_reg+0x1b4>
80004a00:	0004c783          	lbu	a5,0(s1)
80004a04:	0014c703          	lbu	a4,1(s1)
80004a08:	01879793          	slli	a5,a5,0x18
80004a0c:	01071713          	slli	a4,a4,0x10
80004a10:	00e7e7b3          	or	a5,a5,a4
80004a14:	0034c703          	lbu	a4,3(s1)
80004a18:	00e7e7b3          	or	a5,a5,a4
80004a1c:	0024c703          	lbu	a4,2(s1)
80004a20:	00871713          	slli	a4,a4,0x8
80004a24:	00e7e7b3          	or	a5,a5,a4
80004a28:	88f1aa23          	sw	a5,-1900(gp) # 80003304 <reg_scratch>
80004a2c:	e79ff06f          	j	800048a4 <modbus_store_reg+0x208>
80004a30:	0004c783          	lbu	a5,0(s1)
80004a34:	0014c703          	lbu	a4,1(s1)
80004a38:	01879793          	slli	a5,a5,0x18
80004a3c:	01071713          	slli	a4,a4,0x10
80004a40:	00e7e7b3          	or	a5,a5,a4
80004a44:	0034c703          	lbu	a4,3(s1)
80004a48:	00e7e7b3          	or	a5,a5,a4
80004a4c:	0024c703          	lbu	a4,2(s1)
80004a50:	00871713          	slli	a4,a4,0x8
80004a54:	00e7e7b3          	or	a5,a5,a4
80004a58:	88f1a823          	sw	a5,-1904(gp) # 80003300 <reg_config_write>
80004a5c:	e49ff06f          	j	800048a4 <modbus_store_reg+0x208>
80004a60:	0034c503          	lbu	a0,3(s1)
80004a64:	49d000ef          	jal	ra,80005700 <hub_init>
80004a68:	00050913          	mv	s2,a0
80004a6c:	c6051ae3          	bnez	a0,800046e0 <modbus_store_reg+0x44>
80004a70:	fd040513          	addi	a0,s0,-48
80004a74:	c2cff0ef          	jal	ra,80003ea0 <config_load>
80004a78:	00055c63          	bgez	a0,80004a90 <modbus_store_reg+0x3f4>
80004a7c:	800035b7          	lui	a1,0x80003
80004a80:	02000613          	li	a2,32
80004a84:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004a88:	fd040513          	addi	a0,s0,-48
80004a8c:	0840a0ef          	jal	ra,8000eb10 <memcpy>
80004a90:	0034c783          	lbu	a5,3(s1)
80004a94:	fd040513          	addi	a0,s0,-48
80004a98:	fef401a3          	sb	a5,-29(s0)
80004a9c:	cdcff0ef          	jal	ra,80003f78 <config_save>
80004aa0:	c6055ee3          	bgez	a0,8000471c <modbus_store_reg+0x80>
80004aa4:	c3dff06f          	j	800046e0 <modbus_store_reg+0x44>
80004aa8:	fd040513          	addi	a0,s0,-48
80004aac:	bf4ff0ef          	jal	ra,80003ea0 <config_load>
80004ab0:	00055c63          	bgez	a0,80004ac8 <modbus_store_reg+0x42c>
80004ab4:	800035b7          	lui	a1,0x80003
80004ab8:	02000613          	li	a2,32
80004abc:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004ac0:	fd040513          	addi	a0,s0,-48
80004ac4:	04c0a0ef          	jal	ra,8000eb10 <memcpy>
80004ac8:	0034c783          	lbu	a5,3(s1)
80004acc:	fef40223          	sb	a5,-28(s0)
80004ad0:	fd040513          	addi	a0,s0,-48
80004ad4:	ca4ff0ef          	jal	ra,80003f78 <config_save>
80004ad8:	41f55513          	srai	a0,a0,0x1f
80004adc:	ffe57913          	andi	s2,a0,-2
80004ae0:	c3dff06f          	j	8000471c <modbus_store_reg+0x80>
80004ae4:	fd040513          	addi	a0,s0,-48
80004ae8:	bb8ff0ef          	jal	ra,80003ea0 <config_load>
80004aec:	00055c63          	bgez	a0,80004b04 <modbus_store_reg+0x468>
80004af0:	800035b7          	lui	a1,0x80003
80004af4:	02000613          	li	a2,32
80004af8:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004afc:	fd040513          	addi	a0,s0,-48
80004b00:	0100a0ef          	jal	ra,8000eb10 <memcpy>
80004b04:	0034c783          	lbu	a5,3(s1)
80004b08:	fcf40e23          	sb	a5,-36(s0)
80004b0c:	fc5ff06f          	j	80004ad0 <modbus_store_reg+0x434>
80004b10:	fd040513          	addi	a0,s0,-48
80004b14:	b8cff0ef          	jal	ra,80003ea0 <config_load>
80004b18:	00055c63          	bgez	a0,80004b30 <modbus_store_reg+0x494>
80004b1c:	800035b7          	lui	a1,0x80003
80004b20:	02000613          	li	a2,32
80004b24:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004b28:	fd040513          	addi	a0,s0,-48
80004b2c:	7e5090ef          	jal	ra,8000eb10 <memcpy>
80004b30:	00400613          	li	a2,4
80004b34:	00348593          	addi	a1,s1,3
80004b38:	fd040513          	addi	a0,s0,-48
80004b3c:	351010ef          	jal	ra,8000668c <memcpy_rev>
80004b40:	f91ff06f          	j	80004ad0 <modbus_store_reg+0x434>
80004b44:	fd040513          	addi	a0,s0,-48
80004b48:	b58ff0ef          	jal	ra,80003ea0 <config_load>
80004b4c:	00055c63          	bgez	a0,80004b64 <modbus_store_reg+0x4c8>
80004b50:	800035b7          	lui	a1,0x80003
80004b54:	02000613          	li	a2,32
80004b58:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004b5c:	fd040513          	addi	a0,s0,-48
80004b60:	7b1090ef          	jal	ra,8000eb10 <memcpy>
80004b64:	00400613          	li	a2,4
80004b68:	00348593          	addi	a1,s1,3
80004b6c:	fd440513          	addi	a0,s0,-44
80004b70:	fcdff06f          	j	80004b3c <modbus_store_reg+0x4a0>
80004b74:	fd040513          	addi	a0,s0,-48
80004b78:	b28ff0ef          	jal	ra,80003ea0 <config_load>
80004b7c:	00055c63          	bgez	a0,80004b94 <modbus_store_reg+0x4f8>
80004b80:	800035b7          	lui	a1,0x80003
80004b84:	02000613          	li	a2,32
80004b88:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004b8c:	fd040513          	addi	a0,s0,-48
80004b90:	781090ef          	jal	ra,8000eb10 <memcpy>
80004b94:	00400613          	li	a2,4
80004b98:	00348593          	addi	a1,s1,3
80004b9c:	fd840513          	addi	a0,s0,-40
80004ba0:	f9dff06f          	j	80004b3c <modbus_store_reg+0x4a0>
80004ba4:	fd040513          	addi	a0,s0,-48
80004ba8:	af8ff0ef          	jal	ra,80003ea0 <config_load>
80004bac:	00055c63          	bgez	a0,80004bc4 <modbus_store_reg+0x528>
80004bb0:	800035b7          	lui	a1,0x80003
80004bb4:	02000613          	li	a2,32
80004bb8:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004bbc:	fd040513          	addi	a0,s0,-48
80004bc0:	751090ef          	jal	ra,8000eb10 <memcpy>
80004bc4:	00600613          	li	a2,6
80004bc8:	00048593          	mv	a1,s1
80004bcc:	fdd40513          	addi	a0,s0,-35
80004bd0:	741090ef          	jal	ra,8000eb10 <memcpy>
80004bd4:	efdff06f          	j	80004ad0 <modbus_store_reg+0x434>

80004bd8 <modbus_recv>:
80004bd8:	fb010113          	addi	sp,sp,-80
80004bdc:	04812423          	sw	s0,72(sp)
80004be0:	04112623          	sw	ra,76(sp)
80004be4:	04912223          	sw	s1,68(sp)
80004be8:	05212023          	sw	s2,64(sp)
80004bec:	03312e23          	sw	s3,60(sp)
80004bf0:	03412c23          	sw	s4,56(sp)
80004bf4:	03512a23          	sw	s5,52(sp)
80004bf8:	03612823          	sw	s6,48(sp)
80004bfc:	03712623          	sw	s7,44(sp)
80004c00:	03812423          	sw	s8,40(sp)
80004c04:	fff00413          	li	s0,-1
80004c08:	10050a63          	beqz	a0,80004d1c <modbus_recv+0x144>
80004c0c:	10060863          	beqz	a2,80004d1c <modbus_recv+0x144>
80004c10:	00400793          	li	a5,4
80004c14:	10b7d463          	bge	a5,a1,80004d1c <modbus_recv+0x144>
80004c18:	01059a93          	slli	s5,a1,0x10
80004c1c:	010ada93          	srli	s5,s5,0x10
80004c20:	00058413          	mv	s0,a1
80004c24:	ffea8593          	addi	a1,s5,-2
80004c28:	01059593          	slli	a1,a1,0x10
80004c2c:	00050a13          	mv	s4,a0
80004c30:	0105d593          	srli	a1,a1,0x10
80004c34:	00060493          	mv	s1,a2
80004c38:	008a0433          	add	s0,s4,s0
80004c3c:	b09fe0ef          	jal	ra,80003744 <crc16>
80004c40:	fff44603          	lbu	a2,-1(s0)
80004c44:	ffe44783          	lbu	a5,-2(s0)
80004c48:	00050593          	mv	a1,a0
80004c4c:	00861613          	slli	a2,a2,0x8
80004c50:	00f66633          	or	a2,a2,a5
80004c54:	42c51663          	bne	a0,a2,80005080 <modbus_recv+0x4a8>
80004c58:	9b418713          	addi	a4,gp,-1612 # 80003424 <active_config>
80004c5c:	000a4583          	lbu	a1,0(s4)
80004c60:	01474603          	lbu	a2,20(a4)
80004c64:	001a4903          	lbu	s2,1(s4)
80004c68:	9b418b13          	addi	s6,gp,-1612 # 80003424 <active_config>
80004c6c:	00c58863          	beq	a1,a2,80004c7c <modbus_recv+0xa4>
80004c70:	3e059e63          	bnez	a1,8000506c <modbus_recv+0x494>
80004c74:	01100793          	li	a5,17
80004c78:	3ef91a63          	bne	s2,a5,8000506c <modbus_recv+0x494>
80004c7c:	002a4403          	lbu	s0,2(s4)
80004c80:	003a4783          	lbu	a5,3(s4)
80004c84:	08000613          	li	a2,128
80004c88:	00841413          	slli	s0,s0,0x8
80004c8c:	00000593          	li	a1,0
80004c90:	00048513          	mv	a0,s1
80004c94:	00f46433          	or	s0,s0,a5
80004c98:	004a4983          	lbu	s3,4(s4)
80004c9c:	005a4c03          	lbu	s8,5(s4)
80004ca0:	0c1080ef          	jal	ra,8000d560 <memset>
80004ca4:	014b4783          	lbu	a5,20(s6)
80004ca8:	01041413          	slli	s0,s0,0x10
80004cac:	41045413          	srai	s0,s0,0x10
80004cb0:	00f48023          	sb	a5,0(s1)
80004cb4:	fff90793          	addi	a5,s2,-1
80004cb8:	01041b93          	slli	s7,s0,0x10
80004cbc:	012480a3          	sb	s2,1(s1)
80004cc0:	0ff7f793          	andi	a5,a5,255
80004cc4:	01000713          	li	a4,16
80004cc8:	010bdb93          	srli	s7,s7,0x10
80004ccc:	38f76a63          	bltu	a4,a5,80005060 <modbus_recv+0x488>
80004cd0:	80002737          	lui	a4,0x80002
80004cd4:	00279793          	slli	a5,a5,0x2
80004cd8:	75070713          	addi	a4,a4,1872 # 80002750 <_ram_heap_end+0xfffea750>
80004cdc:	00e787b3          	add	a5,a5,a4
80004ce0:	0007a783          	lw	a5,0(a5)
80004ce4:	00078067          	jr	a5
80004ce8:	800026b7          	lui	a3,0x80002
80004cec:	800035b7          	lui	a1,0x80003
80004cf0:	7f868693          	addi	a3,a3,2040 # 800027f8 <_ram_heap_end+0xfffea7f8>
80004cf4:	14d00613          	li	a2,333
80004cf8:	80458593          	addi	a1,a1,-2044 # 80002804 <_ram_heap_end+0xfffea804>
80004cfc:	00348513          	addi	a0,s1,3
80004d00:	63c0a0ef          	jal	ra,8000f33c <siprintf>
80004d04:	02800793          	li	a5,40
80004d08:	00f48123          	sb	a5,2(s1)
80004d0c:	02b00593          	li	a1,43
80004d10:	00048513          	mv	a0,s1
80004d14:	a89fe0ef          	jal	ra,8000379c <add_crc>
80004d18:	02d00413          	li	s0,45
80004d1c:	00040513          	mv	a0,s0
80004d20:	04c12083          	lw	ra,76(sp)
80004d24:	04812403          	lw	s0,72(sp)
80004d28:	04412483          	lw	s1,68(sp)
80004d2c:	04012903          	lw	s2,64(sp)
80004d30:	03c12983          	lw	s3,60(sp)
80004d34:	03812a03          	lw	s4,56(sp)
80004d38:	03412a83          	lw	s5,52(sp)
80004d3c:	03012b03          	lw	s6,48(sp)
80004d40:	02c12b83          	lw	s7,44(sp)
80004d44:	02812c03          	lw	s8,40(sp)
80004d48:	05010113          	addi	sp,sp,80
80004d4c:	00008067          	ret
80004d50:	00899993          	slli	s3,s3,0x8
80004d54:	0189e9b3          	or	s3,s3,s8
80004d58:	01099993          	slli	s3,s3,0x10
80004d5c:	4109d993          	srai	s3,s3,0x10
80004d60:	00100793          	li	a5,1
80004d64:	00048613          	mv	a2,s1
80004d68:	2af99463          	bne	s3,a5,80005010 <modbus_recv+0x438>
80004d6c:	02c00793          	li	a5,44
80004d70:	20f40c63          	beq	s0,a5,80004f88 <modbus_recv+0x3b0>
80004d74:	0887c063          	blt	a5,s0,80004df4 <modbus_recv+0x21c>
80004d78:	02000793          	li	a5,32
80004d7c:	14f40e63          	beq	s0,a5,80004ed8 <modbus_recv+0x300>
80004d80:	0287c663          	blt	a5,s0,80004dac <modbus_recv+0x1d4>
80004d84:	01e00793          	li	a5,30
80004d88:	0ef40e63          	beq	s0,a5,80004e84 <modbus_recv+0x2ac>
80004d8c:	01f00793          	li	a5,31
80004d90:	12f40e63          	beq	s0,a5,80004ecc <modbus_recv+0x2f4>
80004d94:	00048613          	mv	a2,s1
80004d98:	00200593          	li	a1,2
80004d9c:	00090513          	mv	a0,s2
80004da0:	88dff0ef          	jal	ra,8000462c <modbus_error>
80004da4:	00050413          	mv	s0,a0
80004da8:	0f00006f          	j	80004e98 <modbus_recv+0x2c0>
80004dac:	02a00793          	li	a5,42
80004db0:	14f40863          	beq	s0,a5,80004f00 <modbus_recv+0x328>
80004db4:	1687cc63          	blt	a5,s0,80004f2c <modbus_recv+0x354>
80004db8:	02900793          	li	a5,41
80004dbc:	fcf41ce3          	bne	s0,a5,80004d94 <modbus_recv+0x1bc>
80004dc0:	00010513          	mv	a0,sp
80004dc4:	8dcff0ef          	jal	ra,80003ea0 <config_load>
80004dc8:	00055c63          	bgez	a0,80004de0 <modbus_recv+0x208>
80004dcc:	800035b7          	lui	a1,0x80003
80004dd0:	02000613          	li	a2,32
80004dd4:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004dd8:	00010513          	mv	a0,sp
80004ddc:	535090ef          	jal	ra,8000eb10 <memcpy>
80004de0:	00400613          	li	a2,4
80004de4:	00010593          	mv	a1,sp
80004de8:	00348513          	addi	a0,s1,3
80004dec:	525090ef          	jal	ra,8000eb10 <memcpy>
80004df0:	0a40006f          	j	80004e94 <modbus_recv+0x2bc>
80004df4:	03000793          	li	a5,48
80004df8:	16f40063          	beq	s0,a5,80004f58 <modbus_recv+0x380>
80004dfc:	0487c463          	blt	a5,s0,80004e44 <modbus_recv+0x26c>
80004e00:	02d00793          	li	a5,45
80004e04:	1af40663          	beq	s0,a5,80004fb0 <modbus_recv+0x3d8>
80004e08:	02f00793          	li	a5,47
80004e0c:	f8f414e3          	bne	s0,a5,80004d94 <modbus_recv+0x1bc>
80004e10:	00010513          	mv	a0,sp
80004e14:	88cff0ef          	jal	ra,80003ea0 <config_load>
80004e18:	00055c63          	bgez	a0,80004e30 <modbus_recv+0x258>
80004e1c:	800035b7          	lui	a1,0x80003
80004e20:	02000613          	li	a2,32
80004e24:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004e28:	00010513          	mv	a0,sp
80004e2c:	4e5090ef          	jal	ra,8000eb10 <memcpy>
80004e30:	00600613          	li	a2,6
80004e34:	00d10593          	addi	a1,sp,13
80004e38:	00348513          	addi	a0,s1,3
80004e3c:	4d5090ef          	jal	ra,8000eb10 <memcpy>
80004e40:	1400006f          	j	80004f80 <modbus_recv+0x3a8>
80004e44:	03400793          	li	a5,52
80004e48:	0af40463          	beq	s0,a5,80004ef0 <modbus_recv+0x318>
80004e4c:	07e00793          	li	a5,126
80004e50:	08f40a63          	beq	s0,a5,80004ee4 <modbus_recv+0x30c>
80004e54:	03100793          	li	a5,49
80004e58:	f2f41ee3          	bne	s0,a5,80004d94 <modbus_recv+0x1bc>
80004e5c:	00010513          	mv	a0,sp
80004e60:	840ff0ef          	jal	ra,80003ea0 <config_load>
80004e64:	00055c63          	bgez	a0,80004e7c <modbus_recv+0x2a4>
80004e68:	800035b7          	lui	a1,0x80003
80004e6c:	02000613          	li	a2,32
80004e70:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004e74:	00010513          	mv	a0,sp
80004e78:	499090ef          	jal	ra,8000eb10 <memcpy>
80004e7c:	00c14783          	lbu	a5,12(sp)
80004e80:	0fc0006f          	j	80004f7c <modbus_recv+0x3a4>
80004e84:	00400613          	li	a2,4
80004e88:	89b18593          	addi	a1,gp,-1893 # 8000330b <reg_sys_counter+0x3>
80004e8c:	00348513          	addi	a0,s1,3
80004e90:	7fc010ef          	jal	ra,8000668c <memcpy_rev>
80004e94:	00400413          	li	s0,4
80004e98:	00340593          	addi	a1,s0,3
80004e9c:	01059593          	slli	a1,a1,0x10
80004ea0:	00848123          	sb	s0,2(s1)
80004ea4:	0105d593          	srli	a1,a1,0x10
80004ea8:	00048513          	mv	a0,s1
80004eac:	8f1fe0ef          	jal	ra,8000379c <add_crc>
80004eb0:	00540413          	addi	s0,s0,5
80004eb4:	e60414e3          	bnez	s0,80004d1c <modbus_recv+0x144>
80004eb8:	80003537          	lui	a0,0x80003
80004ebc:	00090593          	mv	a1,s2
80004ec0:	82450513          	addi	a0,a0,-2012 # 80002824 <_ram_heap_end+0xfffea824>
80004ec4:	08c0a0ef          	jal	ra,8000ef50 <iprintf>
80004ec8:	e55ff06f          	j	80004d1c <modbus_recv+0x144>
80004ecc:	00400613          	li	a2,4
80004ed0:	89f18593          	addi	a1,gp,-1889 # 8000330f <reg_irq_counter+0x3>
80004ed4:	fb9ff06f          	j	80004e8c <modbus_recv+0x2b4>
80004ed8:	00400613          	li	a2,4
80004edc:	89718593          	addi	a1,gp,-1897 # 80003307 <reg_scratch+0x3>
80004ee0:	fadff06f          	j	80004e8c <modbus_recv+0x2b4>
80004ee4:	00400613          	li	a2,4
80004ee8:	89318593          	addi	a1,gp,-1901 # 80003303 <reg_config_write+0x3>
80004eec:	fa1ff06f          	j	80004e8c <modbus_recv+0x2b4>
80004ef0:	800035b7          	lui	a1,0x80003
80004ef4:	00400613          	li	a2,4
80004ef8:	27358593          	addi	a1,a1,627 # 80003273 <_ram_heap_end+0xfffeb273>
80004efc:	f91ff06f          	j	80004e8c <modbus_recv+0x2b4>
80004f00:	00010513          	mv	a0,sp
80004f04:	f9dfe0ef          	jal	ra,80003ea0 <config_load>
80004f08:	00055c63          	bgez	a0,80004f20 <modbus_recv+0x348>
80004f0c:	800035b7          	lui	a1,0x80003
80004f10:	02000613          	li	a2,32
80004f14:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004f18:	00010513          	mv	a0,sp
80004f1c:	3f5090ef          	jal	ra,8000eb10 <memcpy>
80004f20:	00400613          	li	a2,4
80004f24:	00410593          	addi	a1,sp,4
80004f28:	ec1ff06f          	j	80004de8 <modbus_recv+0x210>
80004f2c:	00010513          	mv	a0,sp
80004f30:	f71fe0ef          	jal	ra,80003ea0 <config_load>
80004f34:	00055c63          	bgez	a0,80004f4c <modbus_recv+0x374>
80004f38:	800035b7          	lui	a1,0x80003
80004f3c:	02000613          	li	a2,32
80004f40:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004f44:	00010513          	mv	a0,sp
80004f48:	3c9090ef          	jal	ra,8000eb10 <memcpy>
80004f4c:	00400613          	li	a2,4
80004f50:	00810593          	addi	a1,sp,8
80004f54:	e95ff06f          	j	80004de8 <modbus_recv+0x210>
80004f58:	00010513          	mv	a0,sp
80004f5c:	f45fe0ef          	jal	ra,80003ea0 <config_load>
80004f60:	00055c63          	bgez	a0,80004f78 <modbus_recv+0x3a0>
80004f64:	800035b7          	lui	a1,0x80003
80004f68:	02000613          	li	a2,32
80004f6c:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004f70:	00010513          	mv	a0,sp
80004f74:	39d090ef          	jal	ra,8000eb10 <memcpy>
80004f78:	01314783          	lbu	a5,19(sp)
80004f7c:	00f48323          	sb	a5,6(s1)
80004f80:	00600413          	li	s0,6
80004f84:	f15ff06f          	j	80004e98 <modbus_recv+0x2c0>
80004f88:	00010513          	mv	a0,sp
80004f8c:	f15fe0ef          	jal	ra,80003ea0 <config_load>
80004f90:	00055c63          	bgez	a0,80004fa8 <modbus_recv+0x3d0>
80004f94:	800035b7          	lui	a1,0x80003
80004f98:	02000613          	li	a2,32
80004f9c:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004fa0:	00010513          	mv	a0,sp
80004fa4:	36d090ef          	jal	ra,8000eb10 <memcpy>
80004fa8:	01414783          	lbu	a5,20(sp)
80004fac:	fd1ff06f          	j	80004f7c <modbus_recv+0x3a4>
80004fb0:	00010513          	mv	a0,sp
80004fb4:	eedfe0ef          	jal	ra,80003ea0 <config_load>
80004fb8:	00055c63          	bgez	a0,80004fd0 <modbus_recv+0x3f8>
80004fbc:	800035b7          	lui	a1,0x80003
80004fc0:	02000613          	li	a2,32
80004fc4:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004fc8:	00010513          	mv	a0,sp
80004fcc:	345090ef          	jal	ra,8000eb10 <memcpy>
80004fd0:	00400613          	li	a2,4
80004fd4:	01b10593          	addi	a1,sp,27
80004fd8:	e61ff06f          	j	80004e38 <modbus_recv+0x260>
80004fdc:	ff7a8613          	addi	a2,s5,-9
80004fe0:	007a0993          	addi	s3,s4,7
80004fe4:	01061613          	slli	a2,a2,0x10
80004fe8:	01065613          	srli	a2,a2,0x10
80004fec:	00098593          	mv	a1,s3
80004ff0:	000b8513          	mv	a0,s7
80004ff4:	ea8ff0ef          	jal	ra,8000469c <modbus_store_reg>
80004ff8:	00050413          	mv	s0,a0
80004ffc:	02055463          	bgez	a0,80005024 <modbus_recv+0x44c>
80005000:	ffe00793          	li	a5,-2
80005004:	00048613          	mv	a2,s1
80005008:	00700593          	li	a1,7
8000500c:	00f50463          	beq	a0,a5,80005014 <modbus_recv+0x43c>
80005010:	00300593          	li	a1,3
80005014:	00090513          	mv	a0,s2
80005018:	e14ff0ef          	jal	ra,8000462c <modbus_error>
8000501c:	00050413          	mv	s0,a0
80005020:	e95ff06f          	j	80004eb4 <modbus_recv+0x2dc>
80005024:	00400613          	li	a2,4
80005028:	002a0593          	addi	a1,s4,2
8000502c:	00248513          	addi	a0,s1,2
80005030:	2e1090ef          	jal	ra,8000eb10 <memcpy>
80005034:	00040613          	mv	a2,s0
80005038:	00098593          	mv	a1,s3
8000503c:	00648513          	addi	a0,s1,6
80005040:	2d1090ef          	jal	ra,8000eb10 <memcpy>
80005044:	00640593          	addi	a1,s0,6
80005048:	01059593          	slli	a1,a1,0x10
8000504c:	0105d593          	srli	a1,a1,0x10
80005050:	00048513          	mv	a0,s1
80005054:	f48fe0ef          	jal	ra,8000379c <add_crc>
80005058:	00840413          	addi	s0,s0,8
8000505c:	cc1ff06f          	j	80004d1c <modbus_recv+0x144>
80005060:	00048613          	mv	a2,s1
80005064:	00100593          	li	a1,1
80005068:	fadff06f          	j	80005014 <modbus_recv+0x43c>
8000506c:	80003537          	lui	a0,0x80003
80005070:	85450513          	addi	a0,a0,-1964 # 80002854 <_ram_heap_end+0xfffea854>
80005074:	6dd090ef          	jal	ra,8000ef50 <iprintf>
80005078:	00000413          	li	s0,0
8000507c:	ca1ff06f          	j	80004d1c <modbus_recv+0x144>
80005080:	80003537          	lui	a0,0x80003
80005084:	89450513          	addi	a0,a0,-1900 # 80002894 <_ram_heap_end+0xfffea894>
80005088:	fedff06f          	j	80005074 <modbus_recv+0x49c>

8000508c <mac_init>:
8000508c:	ff010113          	addi	sp,sp,-16
80005090:	00112623          	sw	ra,12(sp)
80005094:	00812423          	sw	s0,8(sp)
80005098:	02051263          	bnez	a0,800050bc <mac_init+0x30>
8000509c:	80003537          	lui	a0,0x80003
800050a0:	8cc50513          	addi	a0,a0,-1844 # 800028cc <_ram_heap_end+0xfffea8cc>
800050a4:	6ad090ef          	jal	ra,8000ef50 <iprintf>
800050a8:	ff000513          	li	a0,-16
800050ac:	00c12083          	lw	ra,12(sp)
800050b0:	00812403          	lw	s0,8(sp)
800050b4:	01010113          	addi	sp,sp,16
800050b8:	00008067          	ret
800050bc:	800035b7          	lui	a1,0x80003
800050c0:	00050413          	mv	s0,a0
800050c4:	00500613          	li	a2,5
800050c8:	8ec58593          	addi	a1,a1,-1812 # 800028ec <_ram_heap_end+0xfffea8ec>
800050cc:	03650513          	addi	a0,a0,54
800050d0:	241090ef          	jal	ra,8000eb10 <memcpy>
800050d4:	8000c7b7          	lui	a5,0x8000c
800050d8:	d4078793          	addi	a5,a5,-704 # 8000bd40 <_ram_heap_end+0xffff3d40>
800050dc:	00f42a23          	sw	a5,20(s0)
800050e0:	800057b7          	lui	a5,0x80005
800050e4:	14078793          	addi	a5,a5,320 # 80005140 <_ram_heap_end+0xfffed140>
800050e8:	00f42c23          	sw	a5,24(s0)
800050ec:	00600613          	li	a2,6
800050f0:	9c118593          	addi	a1,gp,-1599 # 80003431 <active_config+0xd>
800050f4:	02e40513          	addi	a0,s0,46
800050f8:	219090ef          	jal	ra,8000eb10 <memcpy>
800050fc:	5dc00793          	li	a5,1500
80005100:	02f41623          	sh	a5,44(s0)
80005104:	000017b7          	lui	a5,0x1
80005108:	e0678793          	addi	a5,a5,-506 # e06 <CUSTOM1+0xddb>
8000510c:	02f41a23          	sh	a5,52(s0)
80005110:	00002537          	lui	a0,0x2
80005114:	01100793          	li	a5,17
80005118:	f0070437          	lui	s0,0xf0070
8000511c:	00f42023          	sw	a5,0(s0) # f0070000 <_ram_heap_end+0x70058000>
80005120:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1710>
80005124:	3c0010ef          	jal	ra,800064e4 <delay_us>
80005128:	80003537          	lui	a0,0x80003
8000512c:	00042023          	sw	zero,0(s0)
80005130:	8f450513          	addi	a0,a0,-1804 # 800028f4 <_ram_heap_end+0xfffea8f4>
80005134:	61d090ef          	jal	ra,8000ef50 <iprintf>
80005138:	00000513          	li	a0,0
8000513c:	f71ff06f          	j	800050ac <mac_init+0x20>

80005140 <mac_tx_packet>:
80005140:	00050463          	beqz	a0,80005148 <mac_tx_packet+0x8>
80005144:	00059e63          	bnez	a1,80005160 <mac_tx_packet+0x20>
80005148:	f0000737          	lui	a4,0xf0000
8000514c:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
80005150:	ff000513          	li	a0,-16
80005154:	0027e793          	ori	a5,a5,2
80005158:	00f72223          	sw	a5,4(a4)
8000515c:	00008067          	ret
80005160:	ff010113          	addi	sp,sp,-16
80005164:	00812423          	sw	s0,8(sp)
80005168:	00058413          	mv	s0,a1
8000516c:	00040513          	mv	a0,s0
80005170:	ffe00593          	li	a1,-2
80005174:	00112623          	sw	ra,12(sp)
80005178:	75c020ef          	jal	ra,800078d4 <pbuf_header>
8000517c:	00040713          	mv	a4,s0
80005180:	00000793          	li	a5,0
80005184:	00a75683          	lhu	a3,10(a4)
80005188:	00072703          	lw	a4,0(a4)
8000518c:	00d787b3          	add	a5,a5,a3
80005190:	fe071ae3          	bnez	a4,80005184 <mac_tx_packet+0x44>
80005194:	00379793          	slli	a5,a5,0x3
80005198:	f00706b7          	lui	a3,0xf0070
8000519c:	0006a703          	lw	a4,0(a3) # f0070000 <_ram_heap_end+0x70058000>
800051a0:	00277713          	andi	a4,a4,2
800051a4:	fe070ce3          	beqz	a4,8000519c <mac_tx_packet+0x5c>
800051a8:	f0070737          	lui	a4,0xf0070
800051ac:	01472683          	lw	a3,20(a4) # f0070014 <_ram_heap_end+0x70058014>
800051b0:	fe068ee3          	beqz	a3,800051ac <mac_tx_packet+0x6c>
800051b4:	00f72823          	sw	a5,16(a4)
800051b8:	00040693          	mv	a3,s0
800051bc:	00000713          	li	a4,0
800051c0:	00000793          	li	a5,0
800051c4:	00300893          	li	a7,3
800051c8:	f0070837          	lui	a6,0xf0070
800051cc:	0046a603          	lw	a2,4(a3)
800051d0:	00a6d583          	lhu	a1,10(a3)
800051d4:	00b605b3          	add	a1,a2,a1
800051d8:	04c59863          	bne	a1,a2,80005228 <mac_tx_packet+0xe8>
800051dc:	0006a683          	lw	a3,0(a3)
800051e0:	fe0696e3          	bnez	a3,800051cc <mac_tx_packet+0x8c>
800051e4:	00078a63          	beqz	a5,800051f8 <mac_tx_packet+0xb8>
800051e8:	f00707b7          	lui	a5,0xf0070
800051ec:	0147a683          	lw	a3,20(a5) # f0070014 <_ram_heap_end+0x70058014>
800051f0:	fe068ee3          	beqz	a3,800051ec <mac_tx_packet+0xac>
800051f4:	00e7a823          	sw	a4,16(a5)
800051f8:	00040513          	mv	a0,s0
800051fc:	00200593          	li	a1,2
80005200:	6d4020ef          	jal	ra,800078d4 <pbuf_header>
80005204:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
80005208:	0007a703          	lw	a4,0(a5)
8000520c:	00000513          	li	a0,0
80005210:	00170713          	addi	a4,a4,1
80005214:	00e7a023          	sw	a4,0(a5)
80005218:	00c12083          	lw	ra,12(sp)
8000521c:	00812403          	lw	s0,8(sp)
80005220:	01010113          	addi	sp,sp,16
80005224:	00008067          	ret
80005228:	00064503          	lbu	a0,0(a2)
8000522c:	00379313          	slli	t1,a5,0x3
80005230:	00651533          	sll	a0,a0,t1
80005234:	00a76733          	or	a4,a4,a0
80005238:	01179a63          	bne	a5,a7,8000524c <mac_tx_packet+0x10c>
8000523c:	01482503          	lw	a0,20(a6) # f0070014 <_ram_heap_end+0x70058014>
80005240:	fe050ee3          	beqz	a0,8000523c <mac_tx_packet+0xfc>
80005244:	00e82823          	sw	a4,16(a6)
80005248:	00000713          	li	a4,0
8000524c:	00178793          	addi	a5,a5,1
80005250:	0037f793          	andi	a5,a5,3
80005254:	00160613          	addi	a2,a2,1
80005258:	f81ff06f          	j	800051d8 <mac_tx_packet+0x98>

8000525c <sys_now>:
8000525c:	ff010113          	addi	sp,sp,-16
80005260:	00112623          	sw	ra,12(sp)
80005264:	f00b07b7          	lui	a5,0xf00b0
80005268:	0007a503          	lw	a0,0(a5) # f00b0000 <_ram_heap_end+0x70098000>
8000526c:	0047a583          	lw	a1,4(a5)
80005270:	3e800613          	li	a2,1000
80005274:	00000693          	li	a3,0
80005278:	3f8080ef          	jal	ra,8000d670 <__udivdi3>
8000527c:	00c12083          	lw	ra,12(sp)
80005280:	01010113          	addi	sp,sp,16
80005284:	00008067          	ret

80005288 <sys_arch_protect>:
80005288:	00008067          	ret

8000528c <sys_arch_unprotect>:
8000528c:	00008067          	ret

80005290 <mac_lwip_init>:
80005290:	ff010113          	addi	sp,sp,-16
80005294:	00112623          	sw	ra,12(sp)
80005298:	00812423          	sw	s0,8(sp)
8000529c:	00912223          	sw	s1,4(sp)
800052a0:	410010ef          	jal	ra,800066b0 <lwip_init>
800052a4:	fb9ff0ef          	jal	ra,8000525c <sys_now>
800052a8:	8aa1aa23          	sw	a0,-1868(gp) # 80003324 <ts_ipreass>
800052ac:	8aa1ae23          	sw	a0,-1860(gp) # 8000332c <ts_etharp>
800052b0:	8000d837          	lui	a6,0x8000d
800052b4:	800057b7          	lui	a5,0x80005
800052b8:	32480813          	addi	a6,a6,804 # 8000d324 <_ram_heap_end+0xffff5324>
800052bc:	08c78793          	addi	a5,a5,140 # 8000508c <_ram_heap_end+0xfffed08c>
800052c0:	00000713          	li	a4,0
800052c4:	9b818693          	addi	a3,gp,-1608 # 80003428 <active_config+0x4>
800052c8:	9bc18613          	addi	a2,gp,-1604 # 8000342c <active_config+0x8>
800052cc:	9b418593          	addi	a1,gp,-1612 # 80003424 <active_config>
800052d0:	9d418513          	addi	a0,gp,-1580 # 80003444 <default_netif>
800052d4:	7a1010ef          	jal	ra,80007274 <netif_add>
800052d8:	02051663          	bnez	a0,80005304 <mac_lwip_init+0x74>
800052dc:	80003537          	lui	a0,0x80003
800052e0:	90850513          	addi	a0,a0,-1784 # 80002908 <_ram_heap_end+0xfffea908>
800052e4:	46d090ef          	jal	ra,8000ef50 <iprintf>
800052e8:	fff00493          	li	s1,-1
800052ec:	00c12083          	lw	ra,12(sp)
800052f0:	00812403          	lw	s0,8(sp)
800052f4:	00048513          	mv	a0,s1
800052f8:	00412483          	lw	s1,4(sp)
800052fc:	01010113          	addi	sp,sp,16
80005300:	00008067          	ret
80005304:	9d418513          	addi	a0,gp,-1580 # 80003444 <default_netif>
80005308:	0a4020ef          	jal	ra,800073ac <netif_set_default>
8000530c:	9d418513          	addi	a0,gp,-1580 # 80003444 <default_netif>
80005310:	9b418493          	addi	s1,gp,-1612 # 80003424 <active_config>
80005314:	0a0020ef          	jal	ra,800073b4 <netif_set_up>
80005318:	00c4c783          	lbu	a5,12(s1)
8000531c:	00000493          	li	s1,0
80005320:	0017f793          	andi	a5,a5,1
80005324:	fc0784e3          	beqz	a5,800052ec <mac_lwip_init+0x5c>
80005328:	9d418513          	addi	a0,gp,-1580 # 80003444 <default_netif>
8000532c:	2ad050ef          	jal	ra,8000add8 <dhcp_start>
80005330:	fbdff06f          	j	800052ec <mac_lwip_init+0x5c>

80005334 <mac_rx>:
80005334:	fc010113          	addi	sp,sp,-64
80005338:	02912a23          	sw	s1,52(sp)
8000533c:	03512223          	sw	s5,36(sp)
80005340:	01712e23          	sw	s7,28(sp)
80005344:	00001bb7          	lui	s7,0x1
80005348:	03312623          	sw	s3,44(sp)
8000534c:	01812c23          	sw	s8,24(sp)
80005350:	01912a23          	sw	s9,20(sp)
80005354:	02112e23          	sw	ra,60(sp)
80005358:	02812c23          	sw	s0,56(sp)
8000535c:	03212823          	sw	s2,48(sp)
80005360:	03412423          	sw	s4,40(sp)
80005364:	03612023          	sw	s6,32(sp)
80005368:	01a12823          	sw	s10,16(sp)
8000536c:	00000993          	li	s3,0
80005370:	800b8b93          	addi	s7,s7,-2048 # 800 <CUSTOM1+0x7d5>
80005374:	a2c18493          	addi	s1,gp,-1492 # 8000349c <lwip_stats>
80005378:	9d418a93          	addi	s5,gp,-1580 # 80003444 <default_netif>
8000537c:	80003c37          	lui	s8,0x80003
80005380:	80003cb7          	lui	s9,0x80003
80005384:	f0070937          	lui	s2,0xf0070
80005388:	00092783          	lw	a5,0(s2) # f0070000 <_ram_heap_end+0x70058000>
8000538c:	0207f793          	andi	a5,a5,32
80005390:	04078663          	beqz	a5,800053dc <mac_rx+0xa8>
80005394:	02092683          	lw	a3,32(s2)
80005398:	00768413          	addi	s0,a3,7
8000539c:	00345413          	srli	s0,s0,0x3
800053a0:	068bfa63          	bgeu	s7,s0,80005414 <mac_rx+0xe0>
800053a4:	80003537          	lui	a0,0x80003
800053a8:	00068613          	mv	a2,a3
800053ac:	00040593          	mv	a1,s0
800053b0:	92c50513          	addi	a0,a0,-1748 # 8000292c <_ram_heap_end+0xfffea92c>
800053b4:	39d090ef          	jal	ra,8000ef50 <iprintf>
800053b8:	80c1a783          	lw	a5,-2036(gp) # 8000327c <_impure_ptr>
800053bc:	0087a503          	lw	a0,8(a5)
800053c0:	18c090ef          	jal	ra,8000e54c <fflush>
800053c4:	01100793          	li	a5,17
800053c8:	00002537          	lui	a0,0x2
800053cc:	00f92023          	sw	a5,0(s2)
800053d0:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1710>
800053d4:	110010ef          	jal	ra,800064e4 <delay_us>
800053d8:	00092023          	sw	zero,0(s2)
800053dc:	03c12083          	lw	ra,60(sp)
800053e0:	03812403          	lw	s0,56(sp)
800053e4:	03412483          	lw	s1,52(sp)
800053e8:	03012903          	lw	s2,48(sp)
800053ec:	02c12983          	lw	s3,44(sp)
800053f0:	02812a03          	lw	s4,40(sp)
800053f4:	02412a83          	lw	s5,36(sp)
800053f8:	02012b03          	lw	s6,32(sp)
800053fc:	01c12b83          	lw	s7,28(sp)
80005400:	01812c03          	lw	s8,24(sp)
80005404:	01412c83          	lw	s9,20(sp)
80005408:	01012d03          	lw	s10,16(sp)
8000540c:	04010113          	addi	sp,sp,64
80005410:	00008067          	ret
80005414:	00240d13          	addi	s10,s0,2
80005418:	010d1d13          	slli	s10,s10,0x10
8000541c:	010d5d13          	srli	s10,s10,0x10
80005420:	18200613          	li	a2,386
80005424:	000d0593          	mv	a1,s10
80005428:	00000513          	li	a0,0
8000542c:	00d12623          	sw	a3,12(sp)
80005430:	5a0020ef          	jal	ra,800079d0 <pbuf_alloc>
80005434:	00050913          	mv	s2,a0
80005438:	00c12683          	lw	a3,12(sp)
8000543c:	0a051663          	bnez	a0,800054e8 <mac_rx+0x1b4>
80005440:	f0000737          	lui	a4,0xf0000
80005444:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
80005448:	80003537          	lui	a0,0x80003
8000544c:	00040613          	mv	a2,s0
80005450:	0027e793          	ori	a5,a5,2
80005454:	00f72223          	sw	a5,4(a4)
80005458:	01f68713          	addi	a4,a3,31
8000545c:	00575713          	srli	a4,a4,0x5
80005460:	000d0593          	mv	a1,s10
80005464:	96850513          	addi	a0,a0,-1688 # 80002968 <_ram_heap_end+0xfffea968>
80005468:	2e9090ef          	jal	ra,8000ef50 <iprintf>
8000546c:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
80005470:	0187a703          	lw	a4,24(a5)
80005474:	00170713          	addi	a4,a4,1
80005478:	00e7ac23          	sw	a4,24(a5)
8000547c:	00c7a703          	lw	a4,12(a5)
80005480:	00170713          	addi	a4,a4,1
80005484:	00e7a623          	sw	a4,12(a5)
80005488:	f0070737          	lui	a4,0xf0070
8000548c:	04804263          	bgtz	s0,800054d0 <mac_rx+0x19c>
80005490:	03812403          	lw	s0,56(sp)
80005494:	03c12083          	lw	ra,60(sp)
80005498:	03412483          	lw	s1,52(sp)
8000549c:	03012903          	lw	s2,48(sp)
800054a0:	02c12983          	lw	s3,44(sp)
800054a4:	02812a03          	lw	s4,40(sp)
800054a8:	02412a83          	lw	s5,36(sp)
800054ac:	02012b03          	lw	s6,32(sp)
800054b0:	01c12b83          	lw	s7,28(sp)
800054b4:	01812c03          	lw	s8,24(sp)
800054b8:	01412c83          	lw	s9,20(sp)
800054bc:	01012d03          	lw	s10,16(sp)
800054c0:	80003537          	lui	a0,0x80003
800054c4:	9b450513          	addi	a0,a0,-1612 # 800029b4 <_ram_heap_end+0xfffea9b4>
800054c8:	04010113          	addi	sp,sp,64
800054cc:	2850906f          	j	8000ef50 <iprintf>
800054d0:	00072783          	lw	a5,0(a4) # f0070000 <_ram_heap_end+0x70058000>
800054d4:	0207f793          	andi	a5,a5,32
800054d8:	fe078ce3          	beqz	a5,800054d0 <mac_rx+0x19c>
800054dc:	02072783          	lw	a5,32(a4)
800054e0:	ffc40413          	addi	s0,s0,-4
800054e4:	fa9ff06f          	j	8000548c <mac_rx+0x158>
800054e8:	ffe00593          	li	a1,-2
800054ec:	3e8020ef          	jal	ra,800078d4 <pbuf_header>
800054f0:	00000713          	li	a4,0
800054f4:	00000793          	li	a5,0
800054f8:	f0070637          	lui	a2,0xf0070
800054fc:	04041a63          	bnez	s0,80005550 <mac_rx+0x21c>
80005500:	00200593          	li	a1,2
80005504:	00090513          	mv	a0,s2
80005508:	00492a03          	lw	s4,4(s2)
8000550c:	3c8020ef          	jal	ra,800078d4 <pbuf_header>
80005510:	0044a783          	lw	a5,4(s1)
80005514:	000a8593          	mv	a1,s5
80005518:	00090513          	mv	a0,s2
8000551c:	00178793          	addi	a5,a5,1
80005520:	00f4a223          	sw	a5,4(s1)
80005524:	010aa783          	lw	a5,16(s5)
80005528:	000780e7          	jalr	a5
8000552c:	00050593          	mv	a1,a0
80005530:	08050463          	beqz	a0,800055b8 <mac_rx+0x284>
80005534:	f0000737          	lui	a4,0xf0000
80005538:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
8000553c:	9f8c0513          	addi	a0,s8,-1544 # 800029f8 <_ram_heap_end+0xfffea9f8>
80005540:	0027e793          	ori	a5,a5,2
80005544:	00f72223          	sw	a5,4(a4)
80005548:	209090ef          	jal	ra,8000ef50 <iprintf>
8000554c:	06c0006f          	j	800055b8 <mac_rx+0x284>
80005550:	08099063          	bnez	s3,800055d0 <mac_rx+0x29c>
80005554:	06078863          	beqz	a5,800055c4 <mac_rx+0x290>
80005558:	0007a783          	lw	a5,0(a5)
8000555c:	06079663          	bnez	a5,800055c8 <mac_rx+0x294>
80005560:	f0000737          	lui	a4,0xf0000
80005564:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
80005568:	9d0c8513          	addi	a0,s9,-1584 # 800029d0 <_ram_heap_end+0xfffea9d0>
8000556c:	0027e793          	ori	a5,a5,2
80005570:	00f72223          	sw	a5,4(a4)
80005574:	7a1000ef          	jal	ra,80006514 <print_uart0>
80005578:	0184a783          	lw	a5,24(s1)
8000557c:	f0070737          	lui	a4,0xf0070
80005580:	00178793          	addi	a5,a5,1
80005584:	00f4ac23          	sw	a5,24(s1)
80005588:	00c4a783          	lw	a5,12(s1)
8000558c:	00178793          	addi	a5,a5,1
80005590:	00f4a623          	sw	a5,12(s1)
80005594:	00072783          	lw	a5,0(a4) # f0070000 <_ram_heap_end+0x70058000>
80005598:	0207f793          	andi	a5,a5,32
8000559c:	fe078ce3          	beqz	a5,80005594 <mac_rx+0x260>
800055a0:	02072783          	lw	a5,32(a4)
800055a4:	ffc40413          	addi	s0,s0,-4
800055a8:	fe8046e3          	bgtz	s0,80005594 <mac_rx+0x260>
800055ac:	00200593          	li	a1,2
800055b0:	00090513          	mv	a0,s2
800055b4:	320020ef          	jal	ra,800078d4 <pbuf_header>
800055b8:	00090513          	mv	a0,s2
800055bc:	340020ef          	jal	ra,800078fc <pbuf_free>
800055c0:	dc5ff06f          	j	80005384 <mac_rx+0x50>
800055c4:	00090793          	mv	a5,s2
800055c8:	00a7d983          	lhu	s3,10(a5)
800055cc:	0047aa03          	lw	s4,4(a5)
800055d0:	00071a63          	bnez	a4,800055e4 <mac_rx+0x2b0>
800055d4:	00062683          	lw	a3,0(a2) # f0070000 <_ram_heap_end+0x70058000>
800055d8:	0206f693          	andi	a3,a3,32
800055dc:	fe068ce3          	beqz	a3,800055d4 <mac_rx+0x2a0>
800055e0:	02062b03          	lw	s6,32(a2)
800055e4:	00170713          	addi	a4,a4,1
800055e8:	016a0023          	sb	s6,0(s4)
800055ec:	00377713          	andi	a4,a4,3
800055f0:	008b5b13          	srli	s6,s6,0x8
800055f4:	fff40413          	addi	s0,s0,-1
800055f8:	001a0a13          	addi	s4,s4,1
800055fc:	fff98993          	addi	s3,s3,-1
80005600:	efdff06f          	j	800054fc <mac_rx+0x1c8>

80005604 <mac_poll>:
80005604:	ff010113          	addi	sp,sp,-16
80005608:	00812423          	sw	s0,8(sp)
8000560c:	00112623          	sw	ra,12(sp)
80005610:	00912223          	sw	s1,4(sp)
80005614:	c49ff0ef          	jal	ra,8000525c <sys_now>
80005618:	8bc1a683          	lw	a3,-1860(gp) # 8000332c <ts_etharp>
8000561c:	00050413          	mv	s0,a0
80005620:	00a6f663          	bgeu	a3,a0,8000562c <mac_poll+0x28>
80005624:	8b41a683          	lw	a3,-1868(gp) # 80003324 <ts_ipreass>
80005628:	02a6e063          	bltu	a3,a0,80005648 <mac_poll+0x44>
8000562c:	8a81aa23          	sw	s0,-1868(gp) # 80003324 <ts_ipreass>
80005630:	8a81ae23          	sw	s0,-1860(gp) # 8000332c <ts_etharp>
80005634:	00c12083          	lw	ra,12(sp)
80005638:	00812403          	lw	s0,8(sp)
8000563c:	00412483          	lw	s1,4(sp)
80005640:	01010113          	addi	sp,sp,16
80005644:	00008067          	ret
80005648:	8b01a783          	lw	a5,-1872(gp) # 80003320 <ts_dhcp_fine>
8000564c:	1f300713          	li	a4,499
80005650:	40f507b3          	sub	a5,a0,a5
80005654:	00f77663          	bgeu	a4,a5,80005660 <mac_poll+0x5c>
80005658:	329050ef          	jal	ra,8000b180 <dhcp_fine_tmr>
8000565c:	8a81a823          	sw	s0,-1872(gp) # 80003320 <ts_dhcp_fine>
80005660:	8ac1a703          	lw	a4,-1876(gp) # 8000331c <ts_dhcp_coarse>
80005664:	0000f7b7          	lui	a5,0xf
80005668:	a5f78793          	addi	a5,a5,-1441 # ea5f <_stack_size+0xda5f>
8000566c:	40e40733          	sub	a4,s0,a4
80005670:	00e7f663          	bgeu	a5,a4,8000567c <mac_poll+0x78>
80005674:	049050ef          	jal	ra,8000aebc <dhcp_coarse_tmr>
80005678:	8a81a623          	sw	s0,-1876(gp) # 8000331c <ts_dhcp_coarse>
8000567c:	f00607b7          	lui	a5,0xf0060
80005680:	0087a783          	lw	a5,8(a5) # f0060008 <_ram_heap_end+0x70048008>
80005684:	0047f793          	andi	a5,a5,4
80005688:	fa0786e3          	beqz	a5,80005634 <mac_poll+0x30>
8000568c:	00812403          	lw	s0,8(sp)
80005690:	00c12083          	lw	ra,12(sp)
80005694:	00412483          	lw	s1,4(sp)
80005698:	01010113          	addi	sp,sp,16
8000569c:	c99ff06f          	j	80005334 <mac_rx>

800056a0 <mac_print_stats>:
800056a0:	ee010113          	addi	sp,sp,-288
800056a4:	9d818513          	addi	a0,gp,-1576 # 80003448 <default_netif+0x4>
800056a8:	10112e23          	sw	ra,284(sp)
800056ac:	46d070ef          	jal	ra,8000d318 <ip4addr_ntoa>
800056b0:	a2c18713          	addi	a4,gp,-1492 # 8000349c <lwip_stats>
800056b4:	01072783          	lw	a5,16(a4)
800056b8:	80003637          	lui	a2,0x80003
800056bc:	00050693          	mv	a3,a0
800056c0:	00f12223          	sw	a5,4(sp)
800056c4:	01472783          	lw	a5,20(a4)
800056c8:	a2460613          	addi	a2,a2,-1500 # 80002a24 <_ram_heap_end+0xfffeaa24>
800056cc:	10000593          	li	a1,256
800056d0:	00f12023          	sw	a5,0(sp)
800056d4:	00c72883          	lw	a7,12(a4)
800056d8:	02872803          	lw	a6,40(a4)
800056dc:	00072783          	lw	a5,0(a4)
800056e0:	00472703          	lw	a4,4(a4)
800056e4:	01010513          	addi	a0,sp,16
800056e8:	339090ef          	jal	ra,8000f220 <sniprintf>
800056ec:	01010513          	addi	a0,sp,16
800056f0:	625000ef          	jal	ra,80006514 <print_uart0>
800056f4:	11c12083          	lw	ra,284(sp)
800056f8:	12010113          	addi	sp,sp,288
800056fc:	00008067          	ret

80005700 <hub_init>:
80005700:	fe010113          	addi	sp,sp,-32
80005704:	00912a23          	sw	s1,20(sp)
80005708:	800034b7          	lui	s1,0x80003
8000570c:	2004c783          	lbu	a5,512(s1) # 80003200 <_ram_heap_end+0xfffeb200>
80005710:	00112e23          	sw	ra,28(sp)
80005714:	00812c23          	sw	s0,24(sp)
80005718:	01212823          	sw	s2,16(sp)
8000571c:	01312623          	sw	s3,12(sp)
80005720:	01412423          	sw	s4,8(sp)
80005724:	01512223          	sw	s5,4(sp)
80005728:	01612023          	sw	s6,0(sp)
8000572c:	20048493          	addi	s1,s1,512
80005730:	04f50063          	beq	a0,a5,80005770 <hub_init+0x70>
80005734:	0054c703          	lbu	a4,5(s1)
80005738:	fff00793          	li	a5,-1
8000573c:	00100a13          	li	s4,1
80005740:	02e50a63          	beq	a0,a4,80005774 <hub_init+0x74>
80005744:	01c12083          	lw	ra,28(sp)
80005748:	01812403          	lw	s0,24(sp)
8000574c:	01412483          	lw	s1,20(sp)
80005750:	01012903          	lw	s2,16(sp)
80005754:	00c12983          	lw	s3,12(sp)
80005758:	00812a03          	lw	s4,8(sp)
8000575c:	00412a83          	lw	s5,4(sp)
80005760:	00012b03          	lw	s6,0(sp)
80005764:	00078513          	mv	a0,a5
80005768:	02010113          	addi	sp,sp,32
8000576c:	00008067          	ret
80005770:	00000a13          	li	s4,0
80005774:	002a1993          	slli	s3,s4,0x2
80005778:	014987b3          	add	a5,s3,s4
8000577c:	00f487b3          	add	a5,s1,a5
80005780:	0017c403          	lbu	s0,1(a5)
80005784:	0027c903          	lbu	s2,2(a5)
80005788:	0037ca83          	lbu	s5,3(a5)
8000578c:	00040513          	mv	a0,s0
80005790:	00090593          	mv	a1,s2
80005794:	0047cb03          	lbu	s6,4(a5)
80005798:	4ac080ef          	jal	ra,8000dc44 <__mulsi3>
8000579c:	000a8593          	mv	a1,s5
800057a0:	4a4080ef          	jal	ra,8000dc44 <__mulsi3>
800057a4:	000b0593          	mv	a1,s6
800057a8:	49c080ef          	jal	ra,8000dc44 <__mulsi3>
800057ac:	40355513          	srai	a0,a0,0x3
800057b0:	8ca1a423          	sw	a0,-1848(gp) # 80003338 <hub_frame_size>
800057b4:	8c81a223          	sw	s0,-1852(gp) # 80003334 <hub_frame_width>
800057b8:	000a8593          	mv	a1,s5
800057bc:	00090513          	mv	a0,s2
800057c0:	484080ef          	jal	ra,8000dc44 <__mulsi3>
800057c4:	8ca1a023          	sw	a0,-1856(gp) # 80003330 <hub_frame_height>
800057c8:	f00547b7          	lui	a5,0xf0054
800057cc:	0007a023          	sw	zero,0(a5) # f0054000 <_ram_heap_end+0x7003c000>
800057d0:	000b0593          	mv	a1,s6
800057d4:	00040513          	mv	a0,s0
800057d8:	46c080ef          	jal	ra,8000dc44 <__mulsi3>
800057dc:	000a8593          	mv	a1,s5
800057e0:	464080ef          	jal	ra,8000dc44 <__mulsi3>
800057e4:	00000693          	li	a3,0
800057e8:	00000713          	li	a4,0
800057ec:	f0050637          	lui	a2,0xf0050
800057f0:	000015b7          	lui	a1,0x1
800057f4:	03274e63          	blt	a4,s2,80005830 <hub_init+0x130>
800057f8:	014989b3          	add	s3,s3,s4
800057fc:	013484b3          	add	s1,s1,s3
80005800:	0004c783          	lbu	a5,0(s1)
80005804:	01041413          	slli	s0,s0,0x10
80005808:	01891913          	slli	s2,s2,0x18
8000580c:	01246433          	or	s0,s0,s2
80005810:	00f46433          	or	s0,s0,a5
80005814:	000107b7          	lui	a5,0x10
80005818:	f8078793          	addi	a5,a5,-128 # ff80 <_stack_size+0xef80>
8000581c:	00f46433          	or	s0,s0,a5
80005820:	f00547b7          	lui	a5,0xf0054
80005824:	0087a023          	sw	s0,0(a5) # f0054000 <_ram_heap_end+0x7003c000>
80005828:	00000793          	li	a5,0
8000582c:	f19ff06f          	j	80005744 <hub_init+0x44>
80005830:	00b707b3          	add	a5,a4,a1
80005834:	00279793          	slli	a5,a5,0x2
80005838:	4036d813          	srai	a6,a3,0x3
8000583c:	00f607b3          	add	a5,a2,a5
80005840:	0107a223          	sw	a6,4(a5)
80005844:	00170713          	addi	a4,a4,1
80005848:	00a686b3          	add	a3,a3,a0
8000584c:	fa9ff06f          	j	800057f4 <hub_init+0xf4>

80005850 <hub_print_char>:
80005850:	f9010113          	addi	sp,sp,-112
80005854:	05812423          	sw	s8,72(sp)
80005858:	00078c13          	mv	s8,a5
8000585c:	07812783          	lw	a5,120(sp)
80005860:	06912223          	sw	s1,100(sp)
80005864:	05312e23          	sw	s3,92(sp)
80005868:	41f7d493          	srai	s1,a5,0x1f
8000586c:	0074f493          	andi	s1,s1,7
80005870:	00f484b3          	add	s1,s1,a5
80005874:	05412c23          	sw	s4,88(sp)
80005878:	02a12023          	sw	a0,32(sp)
8000587c:	06112623          	sw	ra,108(sp)
80005880:	06812423          	sw	s0,104(sp)
80005884:	07212023          	sw	s2,96(sp)
80005888:	05512a23          	sw	s5,84(sp)
8000588c:	05612823          	sw	s6,80(sp)
80005890:	05712623          	sw	s7,76(sp)
80005894:	05912223          	sw	s9,68(sp)
80005898:	05a12023          	sw	s10,64(sp)
8000589c:	03b12e23          	sw	s11,60(sp)
800058a0:	02c12223          	sw	a2,36(sp)
800058a4:	02e12423          	sw	a4,40(sp)
800058a8:	03012623          	sw	a6,44(sp)
800058ac:	0077f793          	andi	a5,a5,7
800058b0:	00058513          	mv	a0,a1
800058b4:	00068993          	mv	s3,a3
800058b8:	00088a13          	mv	s4,a7
800058bc:	4034d493          	srai	s1,s1,0x3
800058c0:	00078463          	beqz	a5,800058c8 <hub_print_char+0x78>
800058c4:	00148493          	addi	s1,s1,1
800058c8:	07412583          	lw	a1,116(sp)
800058cc:	00000b93          	li	s7,0
800058d0:	374080ef          	jal	ra,8000dc44 <__mulsi3>
800058d4:	00048593          	mv	a1,s1
800058d8:	36c080ef          	jal	ra,8000dc44 <__mulsi3>
800058dc:	07012a83          	lw	s5,112(sp)
800058e0:	003c1793          	slli	a5,s8,0x3
800058e4:	00098593          	mv	a1,s3
800058e8:	00aa8ab3          	add	s5,s5,a0
800058ec:	000c0513          	mv	a0,s8
800058f0:	00f12e23          	sw	a5,28(sp)
800058f4:	350080ef          	jal	ra,8000dc44 <__mulsi3>
800058f8:	00a12823          	sw	a0,16(sp)
800058fc:	049bc063          	blt	s7,s1,8000593c <hub_print_char+0xec>
80005900:	06c12083          	lw	ra,108(sp)
80005904:	06812403          	lw	s0,104(sp)
80005908:	06412483          	lw	s1,100(sp)
8000590c:	06012903          	lw	s2,96(sp)
80005910:	05c12983          	lw	s3,92(sp)
80005914:	05812a03          	lw	s4,88(sp)
80005918:	05412a83          	lw	s5,84(sp)
8000591c:	05012b03          	lw	s6,80(sp)
80005920:	04c12b83          	lw	s7,76(sp)
80005924:	04812c03          	lw	s8,72(sp)
80005928:	04412c83          	lw	s9,68(sp)
8000592c:	04012d03          	lw	s10,64(sp)
80005930:	03c12d83          	lw	s11,60(sp)
80005934:	07010113          	addi	sp,sp,112
80005938:	00008067          	ret
8000593c:	07812703          	lw	a4,120(sp)
80005940:	003b9793          	slli	a5,s7,0x3
80005944:	40f707b3          	sub	a5,a4,a5
80005948:	00f12623          	sw	a5,12(sp)
8000594c:	00c12703          	lw	a4,12(sp)
80005950:	00800793          	li	a5,8
80005954:	00e7d463          	bge	a5,a4,8000595c <hub_print_char+0x10c>
80005958:	00f12623          	sw	a5,12(sp)
8000595c:	02412b03          	lw	s6,36(sp)
80005960:	00000c93          	li	s9,0
80005964:	07412783          	lw	a5,116(sp)
80005968:	02fcc263          	blt	s9,a5,8000598c <hub_print_char+0x13c>
8000596c:	00fa8ab3          	add	s5,s5,a5
80005970:	01c12703          	lw	a4,28(sp)
80005974:	01012783          	lw	a5,16(sp)
80005978:	001b8b93          	addi	s7,s7,1
8000597c:	00898993          	addi	s3,s3,8
80005980:	00e787b3          	add	a5,a5,a4
80005984:	00f12823          	sw	a5,16(sp)
80005988:	f75ff06f          	j	800058fc <hub_print_char+0xac>
8000598c:	020b4863          	bltz	s6,800059bc <hub_print_char+0x16c>
80005990:	038b5663          	bge	s6,s8,800059bc <hub_print_char+0x16c>
80005994:	019a87b3          	add	a5,s5,s9
80005998:	0007c783          	lbu	a5,0(a5)
8000599c:	00000d13          	li	s10,0
800059a0:	00f12c23          	sw	a5,24(sp)
800059a4:	01012783          	lw	a5,16(sp)
800059a8:	00fb0db3          	add	s11,s6,a5
800059ac:	00100793          	li	a5,1
800059b0:	00f12423          	sw	a5,8(sp)
800059b4:	00c12783          	lw	a5,12(sp)
800059b8:	00fd4863          	blt	s10,a5,800059c8 <hub_print_char+0x178>
800059bc:	001b0b13          	addi	s6,s6,1
800059c0:	001c8c93          	addi	s9,s9,1
800059c4:	fa1ff06f          	j	80005964 <hub_print_char+0x114>
800059c8:	013d07b3          	add	a5,s10,s3
800059cc:	0407ca63          	bltz	a5,80005a20 <hub_print_char+0x1d0>
800059d0:	02c12703          	lw	a4,44(sp)
800059d4:	04e7d663          	bge	a5,a4,80005a20 <hub_print_char+0x1d0>
800059d8:	00c00793          	li	a5,12
800059dc:	06fa0063          	beq	s4,a5,80005a3c <hub_print_char+0x1ec>
800059e0:	04b00793          	li	a5,75
800059e4:	08fa0a63          	beq	s4,a5,80005a78 <hub_print_char+0x228>
800059e8:	01412783          	lw	a5,20(sp)
800059ec:	00279913          	slli	s2,a5,0x2
800059f0:	02012783          	lw	a5,32(sp)
800059f4:	01278933          	add	s2,a5,s2
800059f8:	00092503          	lw	a0,0(s2)
800059fc:	441070ef          	jal	ra,8000d63c <__bswapsi2>
80005a00:	01812783          	lw	a5,24(sp)
80005a04:	00812703          	lw	a4,8(sp)
80005a08:	00e7f7b3          	and	a5,a5,a4
80005a0c:	10078263          	beqz	a5,80005b10 <hub_print_char+0x2c0>
80005a10:	00c00793          	li	a5,12
80005a14:	0afa0663          	beq	s4,a5,80005ac0 <hub_print_char+0x270>
80005a18:	04b00793          	li	a5,75
80005a1c:	0afa0a63          	beq	s4,a5,80005ad0 <hub_print_char+0x280>
80005a20:	00812783          	lw	a5,8(sp)
80005a24:	001d0d13          	addi	s10,s10,1
80005a28:	018d8db3          	add	s11,s11,s8
80005a2c:	00179793          	slli	a5,a5,0x1
80005a30:	0ff7f793          	andi	a5,a5,255
80005a34:	00f12423          	sw	a5,8(sp)
80005a38:	f7dff06f          	j	800059b4 <hub_print_char+0x164>
80005a3c:	41fdd793          	srai	a5,s11,0x1f
80005a40:	01f7f793          	andi	a5,a5,31
80005a44:	01b787b3          	add	a5,a5,s11
80005a48:	4057d793          	srai	a5,a5,0x5
80005a4c:	00f12a23          	sw	a5,20(sp)
80005a50:	800007b7          	lui	a5,0x80000
80005a54:	01f78793          	addi	a5,a5,31 # 8000001f <_ram_heap_end+0xfffe801f>
80005a58:	00fdf433          	and	s0,s11,a5
80005a5c:	00045863          	bgez	s0,80005a6c <hub_print_char+0x21c>
80005a60:	fff40413          	addi	s0,s0,-1
80005a64:	fe046413          	ori	s0,s0,-32
80005a68:	00140413          	addi	s0,s0,1
80005a6c:	800007b7          	lui	a5,0x80000
80005a70:	0087d433          	srl	s0,a5,s0
80005a74:	f75ff06f          	j	800059e8 <hub_print_char+0x198>
80005a78:	41fdd793          	srai	a5,s11,0x1f
80005a7c:	0037f793          	andi	a5,a5,3
80005a80:	01b787b3          	add	a5,a5,s11
80005a84:	4027d793          	srai	a5,a5,0x2
80005a88:	00f12a23          	sw	a5,20(sp)
80005a8c:	800007b7          	lui	a5,0x80000
80005a90:	00378793          	addi	a5,a5,3 # 80000003 <_ram_heap_end+0xfffe8003>
80005a94:	00fdf433          	and	s0,s11,a5
80005a98:	00045863          	bgez	s0,80005aa8 <hub_print_char+0x258>
80005a9c:	fff40413          	addi	s0,s0,-1
80005aa0:	ffc46413          	ori	s0,s0,-4
80005aa4:	00140413          	addi	s0,s0,1
80005aa8:	00300793          	li	a5,3
80005aac:	40878433          	sub	s0,a5,s0
80005ab0:	00341413          	slli	s0,s0,0x3
80005ab4:	0ff00793          	li	a5,255
80005ab8:	00879433          	sll	s0,a5,s0
80005abc:	f2dff06f          	j	800059e8 <hub_print_char+0x198>
80005ac0:	00a46533          	or	a0,s0,a0
80005ac4:	379070ef          	jal	ra,8000d63c <__bswapsi2>
80005ac8:	00a92023          	sw	a0,0(s2)
80005acc:	f55ff06f          	j	80005a20 <hub_print_char+0x1d0>
80005ad0:	fff44793          	not	a5,s0
80005ad4:	00a7f533          	and	a0,a5,a0
80005ad8:	800007b7          	lui	a5,0x80000
80005adc:	00378793          	addi	a5,a5,3 # 80000003 <_ram_heap_end+0xfffe8003>
80005ae0:	00fdf7b3          	and	a5,s11,a5
80005ae4:	0007d863          	bgez	a5,80005af4 <hub_print_char+0x2a4>
80005ae8:	fff78793          	addi	a5,a5,-1
80005aec:	ffc7e793          	ori	a5,a5,-4
80005af0:	00178793          	addi	a5,a5,1
80005af4:	00300713          	li	a4,3
80005af8:	40f707b3          	sub	a5,a4,a5
80005afc:	02812703          	lw	a4,40(sp)
80005b00:	00379793          	slli	a5,a5,0x3
80005b04:	00f717b3          	sll	a5,a4,a5
80005b08:	00a7e533          	or	a0,a5,a0
80005b0c:	fb9ff06f          	j	80005ac4 <hub_print_char+0x274>
80005b10:	00c00793          	li	a5,12
80005b14:	00fa0663          	beq	s4,a5,80005b20 <hub_print_char+0x2d0>
80005b18:	04b00793          	li	a5,75
80005b1c:	f0fa12e3          	bne	s4,a5,80005a20 <hub_print_char+0x1d0>
80005b20:	fff44793          	not	a5,s0
80005b24:	00a7f533          	and	a0,a5,a0
80005b28:	f9dff06f          	j	80005ac4 <hub_print_char+0x274>

80005b2c <hub_print>:
80005b2c:	fb010113          	addi	sp,sp,-80
80005b30:	04812423          	sw	s0,72(sp)
80005b34:	04912223          	sw	s1,68(sp)
80005b38:	05212023          	sw	s2,64(sp)
80005b3c:	03312e23          	sw	s3,60(sp)
80005b40:	03412c23          	sw	s4,56(sp)
80005b44:	03512a23          	sw	s5,52(sp)
80005b48:	03612823          	sw	s6,48(sp)
80005b4c:	03712623          	sw	s7,44(sp)
80005b50:	03812423          	sw	s8,40(sp)
80005b54:	03912223          	sw	s9,36(sp)
80005b58:	03a12023          	sw	s10,32(sp)
80005b5c:	01b12e23          	sw	s11,28(sp)
80005b60:	04112623          	sw	ra,76(sp)
80005b64:	00058a13          	mv	s4,a1
80005b68:	00068a93          	mv	s5,a3
80005b6c:	00070993          	mv	s3,a4
80005b70:	00078b13          	mv	s6,a5
80005b74:	00080913          	mv	s2,a6
80005b78:	00088b93          	mv	s7,a7
80005b7c:	00050493          	mv	s1,a0
80005b80:	00000413          	li	s0,0
80005b84:	f0054c37          	lui	s8,0xf0054
80005b88:	0ff67d93          	andi	s11,a2,255
80005b8c:	05344063          	blt	s0,s3,80005bcc <hub_print+0xa0>
80005b90:	04c12083          	lw	ra,76(sp)
80005b94:	04812403          	lw	s0,72(sp)
80005b98:	04412483          	lw	s1,68(sp)
80005b9c:	04012903          	lw	s2,64(sp)
80005ba0:	03c12983          	lw	s3,60(sp)
80005ba4:	03812a03          	lw	s4,56(sp)
80005ba8:	03412a83          	lw	s5,52(sp)
80005bac:	03012b03          	lw	s6,48(sp)
80005bb0:	02c12b83          	lw	s7,44(sp)
80005bb4:	02812c03          	lw	s8,40(sp)
80005bb8:	02412c83          	lw	s9,36(sp)
80005bbc:	02012d03          	lw	s10,32(sp)
80005bc0:	01c12d83          	lw	s11,28(sp)
80005bc4:	05010113          	addi	sp,sp,80
80005bc8:	00008067          	ret
80005bcc:	000c2883          	lw	a7,0(s8) # f0054000 <_ram_heap_end+0x7003c000>
80005bd0:	008a85b3          	add	a1,s5,s0
80005bd4:	01712423          	sw	s7,8(sp)
80005bd8:	01212223          	sw	s2,4(sp)
80005bdc:	01612023          	sw	s6,0(sp)
80005be0:	8c01a803          	lw	a6,-1856(gp) # 80003330 <hub_frame_height>
80005be4:	8c41a783          	lw	a5,-1852(gp) # 80003334 <hub_frame_width>
80005be8:	0005c583          	lbu	a1,0(a1) # 1000 <_stack_size>
80005bec:	00048613          	mv	a2,s1
80005bf0:	07f8f893          	andi	a7,a7,127
80005bf4:	000d8713          	mv	a4,s11
80005bf8:	000a0693          	mv	a3,s4
80005bfc:	f0050537          	lui	a0,0xf0050
80005c00:	c51ff0ef          	jal	ra,80005850 <hub_print_char>
80005c04:	00140413          	addi	s0,s0,1
80005c08:	012484b3          	add	s1,s1,s2
80005c0c:	f81ff06f          	j	80005b8c <hub_print+0x60>

80005c10 <modbus_udp_init>:
80005c10:	ff010113          	addi	sp,sp,-16
80005c14:	02e00513          	li	a0,46
80005c18:	00912223          	sw	s1,4(sp)
80005c1c:	00112623          	sw	ra,12(sp)
80005c20:	00812423          	sw	s0,8(sp)
80005c24:	125030ef          	jal	ra,80009548 <udp_new_ip_type>
80005c28:	8ca1a623          	sw	a0,-1844(gp) # 8000333c <modbus_udp_pcb>
80005c2c:	02051663          	bnez	a0,80005c58 <modbus_udp_init+0x48>
80005c30:	80003537          	lui	a0,0x80003
80005c34:	a8050513          	addi	a0,a0,-1408 # 80002a80 <_ram_heap_end+0xfffeaa80>
80005c38:	318090ef          	jal	ra,8000ef50 <iprintf>
80005c3c:	fff00413          	li	s0,-1
80005c40:	00040513          	mv	a0,s0
80005c44:	00c12083          	lw	ra,12(sp)
80005c48:	00812403          	lw	s0,8(sp)
80005c4c:	00412483          	lw	s1,4(sp)
80005c50:	01010113          	addi	sp,sp,16
80005c54:	00008067          	ret
80005c58:	7d100613          	li	a2,2001
80005c5c:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
80005c60:	358030ef          	jal	ra,80008fb8 <udp_bind>
80005c64:	00050413          	mv	s0,a0
80005c68:	00050e63          	beqz	a0,80005c84 <modbus_udp_init+0x74>
80005c6c:	80003537          	lui	a0,0x80003
80005c70:	ab050513          	addi	a0,a0,-1360 # 80002ab0 <_ram_heap_end+0xfffeaab0>
80005c74:	2dc090ef          	jal	ra,8000ef50 <iprintf>
80005c78:	8cc1a503          	lw	a0,-1844(gp) # 8000333c <modbus_udp_pcb>
80005c7c:	039030ef          	jal	ra,800094b4 <udp_remove>
80005c80:	fc1ff06f          	j	80005c40 <modbus_udp_init+0x30>
80005c84:	8cc1a503          	lw	a0,-1844(gp) # 8000333c <modbus_udp_pcb>
80005c88:	800065b7          	lui	a1,0x80006
80005c8c:	00000613          	li	a2,0
80005c90:	e0058593          	addi	a1,a1,-512 # 80005e00 <_ram_heap_end+0xfffede00>
80005c94:	011030ef          	jal	ra,800094a4 <udp_recv>
80005c98:	80003537          	lui	a0,0x80003
80005c9c:	adc50513          	addi	a0,a0,-1316 # 80002adc <_ram_heap_end+0xfffeaadc>
80005ca0:	2b0090ef          	jal	ra,8000ef50 <iprintf>
80005ca4:	f9dff06f          	j	80005c40 <modbus_udp_init+0x30>

80005ca8 <modbus_udp_send>:
80005ca8:	fe010113          	addi	sp,sp,-32
80005cac:	01212823          	sw	s2,16(sp)
80005cb0:	00168913          	addi	s2,a3,1
80005cb4:	01412423          	sw	s4,8(sp)
80005cb8:	00058a13          	mv	s4,a1
80005cbc:	01091593          	slli	a1,s2,0x10
80005cc0:	01312623          	sw	s3,12(sp)
80005cc4:	01512223          	sw	s5,4(sp)
80005cc8:	00050993          	mv	s3,a0
80005ccc:	00060a93          	mv	s5,a2
80005cd0:	0105d593          	srli	a1,a1,0x10
80005cd4:	28000613          	li	a2,640
80005cd8:	03800513          	li	a0,56
80005cdc:	00912a23          	sw	s1,20(sp)
80005ce0:	00112e23          	sw	ra,28(sp)
80005ce4:	00812c23          	sw	s0,24(sp)
80005ce8:	00068493          	mv	s1,a3
80005cec:	4e5010ef          	jal	ra,800079d0 <pbuf_alloc>
80005cf0:	04051063          	bnez	a0,80005d30 <modbus_udp_send+0x88>
80005cf4:	f0000737          	lui	a4,0xf0000
80005cf8:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
80005cfc:	80003537          	lui	a0,0x80003
80005d00:	af850513          	addi	a0,a0,-1288 # 80002af8 <_ram_heap_end+0xfffeaaf8>
80005d04:	ffd7f793          	andi	a5,a5,-3
80005d08:	00f72223          	sw	a5,4(a4)
80005d0c:	01812403          	lw	s0,24(sp)
80005d10:	01c12083          	lw	ra,28(sp)
80005d14:	01412483          	lw	s1,20(sp)
80005d18:	01012903          	lw	s2,16(sp)
80005d1c:	00c12983          	lw	s3,12(sp)
80005d20:	00812a03          	lw	s4,8(sp)
80005d24:	00412a83          	lw	s5,4(sp)
80005d28:	02010113          	addi	sp,sp,32
80005d2c:	2240906f          	j	8000ef50 <iprintf>
80005d30:	00452783          	lw	a5,4(a0)
80005d34:	00050413          	mv	s0,a0
80005d38:	00078663          	beqz	a5,80005d44 <modbus_udp_send+0x9c>
80005d3c:	00a55703          	lhu	a4,10(a0)
80005d40:	05277463          	bgeu	a4,s2,80005d88 <modbus_udp_send+0xe0>
80005d44:	f0000737          	lui	a4,0xf0000
80005d48:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
80005d4c:	80003537          	lui	a0,0x80003
80005d50:	b2850513          	addi	a0,a0,-1240 # 80002b28 <_ram_heap_end+0xfffeab28>
80005d54:	ffd7f793          	andi	a5,a5,-3
80005d58:	00f72223          	sw	a5,4(a4)
80005d5c:	00a45603          	lhu	a2,10(s0)
80005d60:	00442583          	lw	a1,4(s0)
80005d64:	01812403          	lw	s0,24(sp)
80005d68:	01c12083          	lw	ra,28(sp)
80005d6c:	01412483          	lw	s1,20(sp)
80005d70:	01012903          	lw	s2,16(sp)
80005d74:	00c12983          	lw	s3,12(sp)
80005d78:	00812a03          	lw	s4,8(sp)
80005d7c:	00412a83          	lw	s5,4(sp)
80005d80:	02010113          	addi	sp,sp,32
80005d84:	1cc0906f          	j	8000ef50 <iprintf>
80005d88:	00048613          	mv	a2,s1
80005d8c:	000a8593          	mv	a1,s5
80005d90:	00078513          	mv	a0,a5
80005d94:	57d080ef          	jal	ra,8000eb10 <memcpy>
80005d98:	009507b3          	add	a5,a0,s1
80005d9c:	00078023          	sb	zero,0(a5)
80005da0:	8cc1a503          	lw	a0,-1844(gp) # 8000333c <modbus_udp_pcb>
80005da4:	00040593          	mv	a1,s0
80005da8:	000a0693          	mv	a3,s4
80005dac:	00098613          	mv	a2,s3
80005db0:	538030ef          	jal	ra,800092e8 <udp_sendto>
80005db4:	00050593          	mv	a1,a0
80005db8:	02050063          	beqz	a0,80005dd8 <modbus_udp_send+0x130>
80005dbc:	f0000737          	lui	a4,0xf0000
80005dc0:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
80005dc4:	80003537          	lui	a0,0x80003
80005dc8:	b6050513          	addi	a0,a0,-1184 # 80002b60 <_ram_heap_end+0xfffeab60>
80005dcc:	ffd7f793          	andi	a5,a5,-3
80005dd0:	00f72223          	sw	a5,4(a4)
80005dd4:	17c090ef          	jal	ra,8000ef50 <iprintf>
80005dd8:	00040513          	mv	a0,s0
80005ddc:	01812403          	lw	s0,24(sp)
80005de0:	01c12083          	lw	ra,28(sp)
80005de4:	01412483          	lw	s1,20(sp)
80005de8:	01012903          	lw	s2,16(sp)
80005dec:	00c12983          	lw	s3,12(sp)
80005df0:	00812a03          	lw	s4,8(sp)
80005df4:	00412a83          	lw	s5,4(sp)
80005df8:	02010113          	addi	sp,sp,32
80005dfc:	3010106f          	j	800078fc <pbuf_free>

80005e00 <modbus_udp_recv>:
80005e00:	f6010113          	addi	sp,sp,-160
80005e04:	08812c23          	sw	s0,152(sp)
80005e08:	00060413          	mv	s0,a2
80005e0c:	00a45583          	lhu	a1,10(s0)
80005e10:	00442503          	lw	a0,4(s0)
80005e14:	01010613          	addi	a2,sp,16
80005e18:	00e12623          	sw	a4,12(sp)
80005e1c:	08112e23          	sw	ra,156(sp)
80005e20:	08912a23          	sw	s1,148(sp)
80005e24:	00068493          	mv	s1,a3
80005e28:	db1fe0ef          	jal	ra,80004bd8 <modbus_recv>
80005e2c:	00a12423          	sw	a0,8(sp)
80005e30:	00040513          	mv	a0,s0
80005e34:	2c9010ef          	jal	ra,800078fc <pbuf_free>
80005e38:	00812683          	lw	a3,8(sp)
80005e3c:	00c12703          	lw	a4,12(sp)
80005e40:	00068a63          	beqz	a3,80005e54 <modbus_udp_recv+0x54>
80005e44:	01010613          	addi	a2,sp,16
80005e48:	00070593          	mv	a1,a4
80005e4c:	00048513          	mv	a0,s1
80005e50:	e59ff0ef          	jal	ra,80005ca8 <modbus_udp_send>
80005e54:	09c12083          	lw	ra,156(sp)
80005e58:	09812403          	lw	s0,152(sp)
80005e5c:	09412483          	lw	s1,148(sp)
80005e60:	0a010113          	addi	sp,sp,160
80005e64:	00008067          	ret

80005e68 <plic_print_stats>:
80005e68:	f7010113          	addi	sp,sp,-144
80005e6c:	08112623          	sw	ra,140(sp)
80005e70:	f00605b7          	lui	a1,0xf0060
80005e74:	0005a603          	lw	a2,0(a1) # f0060000 <_ram_heap_end+0x70048000>
80005e78:	0045a683          	lw	a3,4(a1)
80005e7c:	00c5a703          	lw	a4,12(a1)
80005e80:	0085a783          	lw	a5,8(a1)
80005e84:	0105a803          	lw	a6,16(a1)
80005e88:	800035b7          	lui	a1,0x80003
80005e8c:	b9858593          	addi	a1,a1,-1128 # 80002b98 <_ram_heap_end+0xfffeab98>
80005e90:	00010513          	mv	a0,sp
80005e94:	4a8090ef          	jal	ra,8000f33c <siprintf>
80005e98:	00010513          	mv	a0,sp
80005e9c:	678000ef          	jal	ra,80006514 <print_uart0>
80005ea0:	08c12083          	lw	ra,140(sp)
80005ea4:	09010113          	addi	sp,sp,144
80005ea8:	00008067          	ret

80005eac <audiodac0_stop_playback>:
80005eac:	f00c0737          	lui	a4,0xf00c0
80005eb0:	00472783          	lw	a5,4(a4) # f00c0004 <_ram_heap_end+0x700a8004>
80005eb4:	ffa7f793          	andi	a5,a5,-6
80005eb8:	00f72223          	sw	a5,4(a4)
80005ebc:	00008067          	ret

80005ec0 <audiodac_init>:
80005ec0:	ff010113          	addi	sp,sp,-16
80005ec4:	00812423          	sw	s0,8(sp)
80005ec8:	00050413          	mv	s0,a0
80005ecc:	037a1537          	lui	a0,0x37a1
80005ed0:	00559593          	slli	a1,a1,0x5
80005ed4:	74850513          	addi	a0,a0,1864 # 37a1748 <_stack_size+0x37a0748>
80005ed8:	00112623          	sw	ra,12(sp)
80005edc:	58d070ef          	jal	ra,8000dc68 <__divsi3>
80005ee0:	00200793          	li	a5,2
80005ee4:	00f42423          	sw	a5,8(s0)
80005ee8:	00a42623          	sw	a0,12(s0)
80005eec:	01000793          	li	a5,16
80005ef0:	00f42823          	sw	a5,16(s0)
80005ef4:	00f42a23          	sw	a5,20(s0)
80005ef8:	11000737          	lui	a4,0x11000
80005efc:	00f42c23          	sw	a5,24(s0)
80005f00:	00170713          	addi	a4,a4,1 # 11000001 <_stack_size+0x10fff001>
80005f04:	00e42023          	sw	a4,0(s0)
80005f08:	000087b7          	lui	a5,0x8
80005f0c:	00f42023          	sw	a5,0(s0)
80005f10:	100007b7          	lui	a5,0x10000
80005f14:	00178793          	addi	a5,a5,1 # 10000001 <_stack_size+0xffff001>
80005f18:	00f42023          	sw	a5,0(s0)
80005f1c:	00e42023          	sw	a4,0(s0)
80005f20:	0000c6b7          	lui	a3,0xc
80005f24:	00d42023          	sw	a3,0(s0)
80005f28:	00f42023          	sw	a5,0(s0)
80005f2c:	00e42023          	sw	a4,0(s0)
80005f30:	0000a737          	lui	a4,0xa
80005f34:	00e42023          	sw	a4,0(s0)
80005f38:	00f42023          	sw	a5,0(s0)
80005f3c:	00812403          	lw	s0,8(sp)
80005f40:	00c12083          	lw	ra,12(sp)
80005f44:	00050593          	mv	a1,a0
80005f48:	80003537          	lui	a0,0x80003
80005f4c:	be850513          	addi	a0,a0,-1048 # 80002be8 <_ram_heap_end+0xfffeabe8>
80005f50:	01010113          	addi	sp,sp,16
80005f54:	7fd0806f          	j	8000ef50 <iprintf>

80005f58 <audiodac_wait_tx_avail>:
80005f58:	00000793          	li	a5,0
80005f5c:	00000713          	li	a4,0
80005f60:	00c74a63          	blt	a4,a2,80005f74 <audiodac_wait_tx_avail+0x1c>
80005f64:	00c71463          	bne	a4,a2,80005f6c <audiodac_wait_tx_avail+0x14>
80005f68:	00000793          	li	a5,0
80005f6c:	00078513          	mv	a0,a5
80005f70:	00008067          	ret
80005f74:	00452783          	lw	a5,4(a0)
80005f78:	0107d793          	srli	a5,a5,0x10
80005f7c:	feb7d8e3          	bge	a5,a1,80005f6c <audiodac_wait_tx_avail+0x14>
80005f80:	00170713          	addi	a4,a4,1 # a001 <_stack_size+0x9001>
80005f84:	fddff06f          	j	80005f60 <audiodac_wait_tx_avail+0x8>

80005f88 <audiodac_xmit>:
80005f88:	fc010113          	addi	sp,sp,-64
80005f8c:	03312623          	sw	s3,44(sp)
80005f90:	03412423          	sw	s4,40(sp)
80005f94:	110009b7          	lui	s3,0x11000
80005f98:	10000a37          	lui	s4,0x10000
80005f9c:	02812c23          	sw	s0,56(sp)
80005fa0:	02912a23          	sw	s1,52(sp)
80005fa4:	03212823          	sw	s2,48(sp)
80005fa8:	03512223          	sw	s5,36(sp)
80005fac:	03612023          	sw	s6,32(sp)
80005fb0:	01712e23          	sw	s7,28(sp)
80005fb4:	02112e23          	sw	ra,60(sp)
80005fb8:	00050413          	mv	s0,a0
80005fbc:	00058913          	mv	s2,a1
80005fc0:	00000493          	li	s1,0
80005fc4:	00200a93          	li	s5,2
80005fc8:	00198993          	addi	s3,s3,1 # 11000001 <_stack_size+0x10fff001>
80005fcc:	00008b37          	lui	s6,0x8
80005fd0:	00002bb7          	lui	s7,0x2
80005fd4:	001a0a13          	addi	s4,s4,1 # 10000001 <_stack_size+0xffff001>
80005fd8:	02c04a63          	bgtz	a2,8000600c <audiodac_xmit+0x84>
80005fdc:	03c12083          	lw	ra,60(sp)
80005fe0:	03812403          	lw	s0,56(sp)
80005fe4:	00048513          	mv	a0,s1
80005fe8:	03012903          	lw	s2,48(sp)
80005fec:	03412483          	lw	s1,52(sp)
80005ff0:	02c12983          	lw	s3,44(sp)
80005ff4:	02812a03          	lw	s4,40(sp)
80005ff8:	02412a83          	lw	s5,36(sp)
80005ffc:	02012b03          	lw	s6,32(sp)
80006000:	01c12b83          	lw	s7,28(sp)
80006004:	04010113          	addi	sp,sp,64
80006008:	00008067          	ret
8000600c:	00442503          	lw	a0,4(s0)
80006010:	00c12623          	sw	a2,12(sp)
80006014:	01055513          	srli	a0,a0,0x10
80006018:	fcaaf2e3          	bgeu	s5,a0,80005fdc <audiodac_xmit+0x54>
8000601c:	00300593          	li	a1,3
80006020:	449070ef          	jal	ra,8000dc68 <__divsi3>
80006024:	00c12603          	lw	a2,12(sp)
80006028:	00000713          	li	a4,0
8000602c:	40e607b3          	sub	a5,a2,a4
80006030:	00e485b3          	add	a1,s1,a4
80006034:	00050693          	mv	a3,a0
80006038:	00a7d463          	bge	a5,a0,80006040 <audiodac_xmit+0xb8>
8000603c:	00078693          	mv	a3,a5
80006040:	00d74863          	blt	a4,a3,80006050 <audiodac_xmit+0xc8>
80006044:	00058493          	mv	s1,a1
80006048:	00078613          	mv	a2,a5
8000604c:	f8dff06f          	j	80005fd8 <audiodac_xmit+0x50>
80006050:	01342023          	sw	s3,0(s0)
80006054:	00290913          	addi	s2,s2,2
80006058:	ffe91783          	lh	a5,-2(s2)
8000605c:	00170713          	addi	a4,a4,1
80006060:	016787b3          	add	a5,a5,s6
80006064:	0047d793          	srli	a5,a5,0x4
80006068:	0177e7b3          	or	a5,a5,s7
8000606c:	00f42023          	sw	a5,0(s0)
80006070:	01442023          	sw	s4,0(s0)
80006074:	fb9ff06f          	j	8000602c <audiodac_xmit+0xa4>

80006078 <audiodac0_isr>:
80006078:	fe010113          	addi	sp,sp,-32
8000607c:	00112e23          	sw	ra,28(sp)
80006080:	00812c23          	sw	s0,24(sp)
80006084:	00912a23          	sw	s1,20(sp)
80006088:	01212823          	sw	s2,16(sp)
8000608c:	01312623          	sw	s3,12(sp)
80006090:	f00c07b7          	lui	a5,0xf00c0
80006094:	0047a783          	lw	a5,4(a5) # f00c0004 <_ram_heap_end+0x700a8004>
80006098:	1007f793          	andi	a5,a5,256
8000609c:	00078863          	beqz	a5,800060ac <audiodac0_isr+0x34>
800060a0:	80003537          	lui	a0,0x80003
800060a4:	c0850513          	addi	a0,a0,-1016 # 80002c08 <_ram_heap_end+0xfffeac08>
800060a8:	46c000ef          	jal	ra,80006514 <print_uart0>
800060ac:	8d01a403          	lw	s0,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
800060b0:	8d41a483          	lw	s1,-1836(gp) # 80003344 <audiodac0_tx_ring_buffer_playback_ptr>
800060b4:	04941263          	bne	s0,s1,800060f8 <audiodac0_isr+0x80>
800060b8:	80003537          	lui	a0,0x80003
800060bc:	c2c50513          	addi	a0,a0,-980 # 80002c2c <_ram_heap_end+0xfffeac2c>
800060c0:	454000ef          	jal	ra,80006514 <print_uart0>
800060c4:	00000413          	li	s0,0
800060c8:	f00c0737          	lui	a4,0xf00c0
800060cc:	00472783          	lw	a5,4(a4) # f00c0004 <_ram_heap_end+0x700a8004>
800060d0:	00040513          	mv	a0,s0
800060d4:	aff7f793          	andi	a5,a5,-1281
800060d8:	00f72223          	sw	a5,4(a4)
800060dc:	01c12083          	lw	ra,28(sp)
800060e0:	01812403          	lw	s0,24(sp)
800060e4:	01412483          	lw	s1,20(sp)
800060e8:	01012903          	lw	s2,16(sp)
800060ec:	00c12983          	lw	s3,12(sp)
800060f0:	02010113          	addi	sp,sp,32
800060f4:	00008067          	ret
800060f8:	f00c07b7          	lui	a5,0xf00c0
800060fc:	0047a983          	lw	s3,4(a5) # f00c0004 <_ram_heap_end+0x700a8004>
80006100:	00300593          	li	a1,3
80006104:	0109d993          	srli	s3,s3,0x10
80006108:	00098513          	mv	a0,s3
8000610c:	35d070ef          	jal	ra,8000dc68 <__divsi3>
80006110:	00200793          	li	a5,2
80006114:	0137e863          	bltu	a5,s3,80006124 <audiodac0_isr+0xac>
80006118:	80003537          	lui	a0,0x80003
8000611c:	c5450513          	addi	a0,a0,-940 # 80002c54 <_ram_heap_end+0xfffeac54>
80006120:	fa1ff06f          	j	800060c0 <audiodac0_isr+0x48>
80006124:	40940633          	sub	a2,s0,s1
80006128:	0084c663          	blt	s1,s0,80006134 <audiodac0_isr+0xbc>
8000612c:	8d81a603          	lw	a2,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
80006130:	40960633          	sub	a2,a2,s1
80006134:	00c55463          	bge	a0,a2,8000613c <audiodac0_isr+0xc4>
80006138:	00050613          	mv	a2,a0
8000613c:	8dc1a583          	lw	a1,-1828(gp) # 8000334c <audiodac0_tx_ring_buffer>
80006140:	00149493          	slli	s1,s1,0x1
80006144:	3e800693          	li	a3,1000
80006148:	009585b3          	add	a1,a1,s1
8000614c:	f00c0537          	lui	a0,0xf00c0
80006150:	e39ff0ef          	jal	ra,80005f88 <audiodac_xmit>
80006154:	00050413          	mv	s0,a0
80006158:	8d41a503          	lw	a0,-1836(gp) # 80003344 <audiodac0_tx_ring_buffer_playback_ptr>
8000615c:	8d81a583          	lw	a1,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
80006160:	00a40533          	add	a0,s0,a0
80006164:	389070ef          	jal	ra,8000dcec <__modsi3>
80006168:	8ca1aa23          	sw	a0,-1836(gp) # 80003344 <audiodac0_tx_ring_buffer_playback_ptr>
8000616c:	f5dff06f          	j	800060c8 <audiodac0_isr+0x50>

80006170 <audiodac0_submit_buffer>:
80006170:	fd010113          	addi	sp,sp,-48
80006174:	03212023          	sw	s2,32(sp)
80006178:	8dc1a783          	lw	a5,-1828(gp) # 8000334c <audiodac0_tx_ring_buffer>
8000617c:	01312e23          	sw	s3,28(sp)
80006180:	01712623          	sw	s7,12(sp)
80006184:	02112623          	sw	ra,44(sp)
80006188:	02812423          	sw	s0,40(sp)
8000618c:	02912223          	sw	s1,36(sp)
80006190:	01412c23          	sw	s4,24(sp)
80006194:	01512a23          	sw	s5,20(sp)
80006198:	01612823          	sw	s6,16(sp)
8000619c:	01812423          	sw	s8,8(sp)
800061a0:	00050b93          	mv	s7,a0
800061a4:	8d81a683          	lw	a3,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
800061a8:	00078663          	beqz	a5,800061b4 <audiodac0_submit_buffer+0x44>
800061ac:	00050463          	beqz	a0,800061b4 <audiodac0_submit_buffer+0x44>
800061b0:	04069863          	bnez	a3,80006200 <audiodac0_submit_buffer+0x90>
800061b4:	80003537          	lui	a0,0x80003
800061b8:	000b8613          	mv	a2,s7
800061bc:	00068593          	mv	a1,a3
800061c0:	c7850513          	addi	a0,a0,-904 # 80002c78 <_ram_heap_end+0xfffeac78>
800061c4:	58d080ef          	jal	ra,8000ef50 <iprintf>
800061c8:	00000413          	li	s0,0
800061cc:	00040513          	mv	a0,s0
800061d0:	02c12083          	lw	ra,44(sp)
800061d4:	02812403          	lw	s0,40(sp)
800061d8:	02412483          	lw	s1,36(sp)
800061dc:	02012903          	lw	s2,32(sp)
800061e0:	01c12983          	lw	s3,28(sp)
800061e4:	01812a03          	lw	s4,24(sp)
800061e8:	01412a83          	lw	s5,20(sp)
800061ec:	01012b03          	lw	s6,16(sp)
800061f0:	00c12b83          	lw	s7,12(sp)
800061f4:	00812c03          	lw	s8,8(sp)
800061f8:	03010113          	addi	sp,sp,48
800061fc:	00008067          	ret
80006200:	8d41a703          	lw	a4,-1836(gp) # 80003344 <audiodac0_tx_ring_buffer_playback_ptr>
80006204:	8d01a783          	lw	a5,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
80006208:	fff70693          	addi	a3,a4,-1
8000620c:	00f69a63          	bne	a3,a5,80006220 <audiodac0_submit_buffer+0xb0>
80006210:	80003537          	lui	a0,0x80003
80006214:	cf050513          	addi	a0,a0,-784 # 80002cf0 <_ram_heap_end+0xfffeacf0>
80006218:	2fc000ef          	jal	ra,80006514 <print_uart0>
8000621c:	fadff06f          	j	800061c8 <audiodac0_submit_buffer+0x58>
80006220:	00058493          	mv	s1,a1
80006224:	00060a13          	mv	s4,a2
80006228:	00f71863          	bne	a4,a5,80006238 <audiodac0_submit_buffer+0xc8>
8000622c:	80003537          	lui	a0,0x80003
80006230:	d2450513          	addi	a0,a0,-732 # 80002d24 <_ram_heap_end+0xfffead24>
80006234:	2e0000ef          	jal	ra,80006514 <print_uart0>
80006238:	000a1463          	bnez	s4,80006240 <audiodac0_submit_buffer+0xd0>
8000623c:	30047073          	csrci	mstatus,8
80006240:	8d01a403          	lw	s0,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
80006244:	8d41a783          	lw	a5,-1836(gp) # 80003344 <audiodac0_tx_ring_buffer_playback_ptr>
80006248:	10f44663          	blt	s0,a5,80006354 <audiodac0_submit_buffer+0x1e4>
8000624c:	8d81a783          	lw	a5,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
80006250:	40878433          	sub	s0,a5,s0
80006254:	0084d463          	bge	s1,s0,8000625c <audiodac0_submit_buffer+0xec>
80006258:	00048413          	mv	s0,s1
8000625c:	408484b3          	sub	s1,s1,s0
80006260:	00000793          	li	a5,0
80006264:	000a1663          	bnez	s4,80006270 <audiodac0_submit_buffer+0x100>
80006268:	30046073          	csrsi	mstatus,8
8000626c:	000a0793          	mv	a5,s4
80006270:	8d01a503          	lw	a0,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
80006274:	0887ca63          	blt	a5,s0,80006308 <audiodac0_submit_buffer+0x198>
80006278:	00040793          	mv	a5,s0
8000627c:	00045463          	bgez	s0,80006284 <audiodac0_submit_buffer+0x114>
80006280:	00000793          	li	a5,0
80006284:	00179c13          	slli	s8,a5,0x1
80006288:	000a1463          	bnez	s4,80006290 <audiodac0_submit_buffer+0x120>
8000628c:	30047073          	csrci	mstatus,8
80006290:	8d81a583          	lw	a1,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
80006294:	00a40533          	add	a0,s0,a0
80006298:	255070ef          	jal	ra,8000dcec <__modsi3>
8000629c:	8ca1a823          	sw	a0,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
800062a0:	02048e63          	beqz	s1,800062dc <audiodac0_submit_buffer+0x16c>
800062a4:	8d41a783          	lw	a5,-1836(gp) # 80003344 <audiodac0_tx_ring_buffer_playback_ptr>
800062a8:	00f4d463          	bge	s1,a5,800062b0 <audiodac0_submit_buffer+0x140>
800062ac:	00048793          	mv	a5,s1
800062b0:	00000713          	li	a4,0
800062b4:	000a1663          	bnez	s4,800062c0 <audiodac0_submit_buffer+0x150>
800062b8:	30046073          	csrsi	mstatus,8
800062bc:	000a0713          	mv	a4,s4
800062c0:	06f74863          	blt	a4,a5,80006330 <audiodac0_submit_buffer+0x1c0>
800062c4:	000a1463          	bnez	s4,800062cc <audiodac0_submit_buffer+0x15c>
800062c8:	30047073          	csrci	mstatus,8
800062cc:	8d01a703          	lw	a4,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
800062d0:	00f40433          	add	s0,s0,a5
800062d4:	00f70733          	add	a4,a4,a5
800062d8:	8ce1a823          	sw	a4,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
800062dc:	f00c07b7          	lui	a5,0xf00c0
800062e0:	0047a783          	lw	a5,4(a5) # f00c0004 <_ram_heap_end+0x700a8004>
800062e4:	1007f793          	andi	a5,a5,256
800062e8:	00078a63          	beqz	a5,800062fc <audiodac0_submit_buffer+0x18c>
800062ec:	80003537          	lui	a0,0x80003
800062f0:	d5850513          	addi	a0,a0,-680 # 80002d58 <_ram_heap_end+0xfffead58>
800062f4:	220000ef          	jal	ra,80006514 <print_uart0>
800062f8:	d81ff0ef          	jal	ra,80006078 <audiodac0_isr>
800062fc:	ec0a18e3          	bnez	s4,800061cc <audiodac0_submit_buffer+0x5c>
80006300:	30046073          	csrsi	mstatus,8
80006304:	ec9ff06f          	j	800061cc <audiodac0_submit_buffer+0x5c>
80006308:	00179713          	slli	a4,a5,0x1
8000630c:	00eb8733          	add	a4,s7,a4
80006310:	00071683          	lh	a3,0(a4)
80006314:	8dc1a703          	lw	a4,-1828(gp) # 8000334c <audiodac0_tx_ring_buffer>
80006318:	00a78533          	add	a0,a5,a0
8000631c:	00151513          	slli	a0,a0,0x1
80006320:	00a70533          	add	a0,a4,a0
80006324:	00d51023          	sh	a3,0(a0)
80006328:	00178793          	addi	a5,a5,1
8000632c:	f45ff06f          	j	80006270 <audiodac0_submit_buffer+0x100>
80006330:	00171593          	slli	a1,a4,0x1
80006334:	00bc0633          	add	a2,s8,a1
80006338:	8dc1a683          	lw	a3,-1828(gp) # 8000334c <audiodac0_tx_ring_buffer>
8000633c:	00cb8633          	add	a2,s7,a2
80006340:	00061603          	lh	a2,0(a2) # f0050000 <_ram_heap_end+0x70038000>
80006344:	00b686b3          	add	a3,a3,a1
80006348:	00170713          	addi	a4,a4,1
8000634c:	00c69023          	sh	a2,0(a3) # c000 <_stack_size+0xb000>
80006350:	f71ff06f          	j	800062c0 <audiodac0_submit_buffer+0x150>
80006354:	40878433          	sub	s0,a5,s0
80006358:	fff40413          	addi	s0,s0,-1
8000635c:	0084d463          	bge	s1,s0,80006364 <audiodac0_submit_buffer+0x1f4>
80006360:	00048413          	mv	s0,s1
80006364:	00000713          	li	a4,0
80006368:	000a1663          	bnez	s4,80006374 <audiodac0_submit_buffer+0x204>
8000636c:	30046073          	csrsi	mstatus,8
80006370:	000a0713          	mv	a4,s4
80006374:	8d01a783          	lw	a5,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
80006378:	00874c63          	blt	a4,s0,80006390 <audiodac0_submit_buffer+0x220>
8000637c:	000a1463          	bnez	s4,80006384 <audiodac0_submit_buffer+0x214>
80006380:	30047073          	csrci	mstatus,8
80006384:	00f407b3          	add	a5,s0,a5
80006388:	8cf1a823          	sw	a5,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
8000638c:	f51ff06f          	j	800062dc <audiodac0_submit_buffer+0x16c>
80006390:	00171693          	slli	a3,a4,0x1
80006394:	00db86b3          	add	a3,s7,a3
80006398:	00069603          	lh	a2,0(a3)
8000639c:	8dc1a683          	lw	a3,-1828(gp) # 8000334c <audiodac0_tx_ring_buffer>
800063a0:	00f707b3          	add	a5,a4,a5
800063a4:	00179793          	slli	a5,a5,0x1
800063a8:	00f687b3          	add	a5,a3,a5
800063ac:	00c79023          	sh	a2,0(a5)
800063b0:	00170713          	addi	a4,a4,1
800063b4:	fc1ff06f          	j	80006374 <audiodac0_submit_buffer+0x204>

800063b8 <audiodac0_start_playback>:
800063b8:	06050463          	beqz	a0,80006420 <audiodac0_start_playback+0x68>
800063bc:	06b05263          	blez	a1,80006420 <audiodac0_start_playback+0x68>
800063c0:	ff010113          	addi	sp,sp,-16
800063c4:	00112623          	sw	ra,12(sp)
800063c8:	00812423          	sw	s0,8(sp)
800063cc:	30047073          	csrci	mstatus,8
800063d0:	f00c0437          	lui	s0,0xf00c0
800063d4:	00442783          	lw	a5,4(s0) # f00c0004 <_ram_heap_end+0x700a8004>
800063d8:	ffa7f793          	andi	a5,a5,-6
800063dc:	00f42223          	sw	a5,4(s0)
800063e0:	8ca1ae23          	sw	a0,-1828(gp) # 8000334c <audiodac0_tx_ring_buffer>
800063e4:	8c01a823          	sw	zero,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
800063e8:	8c01aa23          	sw	zero,-1836(gp) # 80003344 <audiodac0_tx_ring_buffer_playback_ptr>
800063ec:	8cb1ac23          	sw	a1,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
800063f0:	c89ff0ef          	jal	ra,80006078 <audiodac0_isr>
800063f4:	00442783          	lw	a5,4(s0)
800063f8:	80003537          	lui	a0,0x80003
800063fc:	d8450513          	addi	a0,a0,-636 # 80002d84 <_ram_heap_end+0xfffead84>
80006400:	0057e793          	ori	a5,a5,5
80006404:	00f42223          	sw	a5,4(s0)
80006408:	349080ef          	jal	ra,8000ef50 <iprintf>
8000640c:	30046073          	csrsi	mstatus,8
80006410:	00c12083          	lw	ra,12(sp)
80006414:	00812403          	lw	s0,8(sp)
80006418:	01010113          	addi	sp,sp,16
8000641c:	00008067          	ret
80006420:	00008067          	ret

80006424 <i2c_init>:
80006424:	24700793          	li	a5,583
80006428:	00f52423          	sw	a5,8(a0)
8000642c:	00008067          	ret

80006430 <i2c_wait_for_busy>:
80006430:	00000793          	li	a5,0
80006434:	00b7c663          	blt	a5,a1,80006440 <i2c_wait_for_busy+0x10>
80006438:	00000513          	li	a0,0
8000643c:	00008067          	ret
80006440:	00c52703          	lw	a4,12(a0)
80006444:	00277713          	andi	a4,a4,2
80006448:	00071663          	bnez	a4,80006454 <i2c_wait_for_busy+0x24>
8000644c:	00178793          	addi	a5,a5,1
80006450:	fe5ff06f          	j	80006434 <i2c_wait_for_busy+0x4>
80006454:	00100513          	li	a0,1
80006458:	00008067          	ret

8000645c <i2c_wait_for_release>:
8000645c:	00000793          	li	a5,0
80006460:	00b7c663          	blt	a5,a1,8000646c <i2c_wait_for_release+0x10>
80006464:	00000513          	li	a0,0
80006468:	00008067          	ret
8000646c:	00c52703          	lw	a4,12(a0)
80006470:	00277713          	andi	a4,a4,2
80006474:	00070663          	beqz	a4,80006480 <i2c_wait_for_release+0x24>
80006478:	00178793          	addi	a5,a5,1
8000647c:	fe5ff06f          	j	80006460 <i2c_wait_for_release+0x4>
80006480:	00100513          	li	a0,1
80006484:	00008067          	ret

80006488 <__malloc_lock>:
80006488:	00008067          	ret

8000648c <__malloc_unlock>:
8000648c:	00008067          	ret

80006490 <init_sbrk>:
80006490:	02051463          	bnez	a0,800064b8 <init_sbrk+0x28>
80006494:	80012737          	lui	a4,0x80012
80006498:	5a070713          	addi	a4,a4,1440 # 800125a0 <_ram_heap_end+0xffffa5a0>
8000649c:	8ee1a223          	sw	a4,-1820(gp) # 80003354 <heap_start>
800064a0:	80018737          	lui	a4,0x80018
800064a4:	00070713          	mv	a4,a4
800064a8:	8ee1a023          	sw	a4,-1824(gp) # 80003350 <heap_end>
800064ac:	8e41a703          	lw	a4,-1820(gp) # 80003354 <heap_start>
800064b0:	8ee1a423          	sw	a4,-1816(gp) # 80003358 <sbrk_heap_end>
800064b4:	00008067          	ret
800064b8:	00259593          	slli	a1,a1,0x2
800064bc:	8ea1a223          	sw	a0,-1820(gp) # 80003354 <heap_start>
800064c0:	00b50533          	add	a0,a0,a1
800064c4:	8ea1a023          	sw	a0,-1824(gp) # 80003350 <heap_end>
800064c8:	fe5ff06f          	j	800064ac <init_sbrk+0x1c>

800064cc <delay>:
800064cc:	00000793          	li	a5,0
800064d0:	00a79463          	bne	a5,a0,800064d8 <delay+0xc>
800064d4:	00008067          	ret
800064d8:	00060613          	mv	a2,a2
800064dc:	00178793          	addi	a5,a5,1
800064e0:	ff1ff06f          	j	800064d0 <delay+0x4>

800064e4 <delay_us>:
800064e4:	f00b07b7          	lui	a5,0xf00b0
800064e8:	0007a803          	lw	a6,0(a5) # f00b0000 <_ram_heap_end+0x70098000>
800064ec:	0047a883          	lw	a7,4(a5)
800064f0:	f00b0637          	lui	a2,0xf00b0
800064f4:	00062303          	lw	t1,0(a2) # f00b0000 <_ram_heap_end+0x70098000>
800064f8:	00462383          	lw	t2,4(a2)
800064fc:	410306b3          	sub	a3,t1,a6
80006500:	00d33733          	sltu	a4,t1,a3
80006504:	411387b3          	sub	a5,t2,a7
80006508:	00e79463          	bne	a5,a4,80006510 <delay_us+0x2c>
8000650c:	fea6e4e3          	bltu	a3,a0,800064f4 <delay_us+0x10>
80006510:	00008067          	ret

80006514 <print_uart0>:
80006514:	f00106b7          	lui	a3,0xf0010
80006518:	00054703          	lbu	a4,0(a0)
8000651c:	00071463          	bnez	a4,80006524 <print_uart0+0x10>
80006520:	00008067          	ret
80006524:	0046a783          	lw	a5,4(a3) # f0010004 <_ram_heap_end+0x6fff8004>
80006528:	0107d793          	srli	a5,a5,0x10
8000652c:	0ff7f793          	andi	a5,a5,255
80006530:	fe078ae3          	beqz	a5,80006524 <print_uart0+0x10>
80006534:	00e6a023          	sw	a4,0(a3)
80006538:	00150513          	addi	a0,a0,1
8000653c:	fddff06f          	j	80006518 <print_uart0+0x4>

80006540 <_sbrk>:
80006540:	8e81a783          	lw	a5,-1816(gp) # 80003358 <sbrk_heap_end>
80006544:	02079063          	bnez	a5,80006564 <_sbrk+0x24>
80006548:	800127b7          	lui	a5,0x80012
8000654c:	5a078793          	addi	a5,a5,1440 # 800125a0 <_ram_heap_end+0xffffa5a0>
80006550:	8ef1a223          	sw	a5,-1820(gp) # 80003354 <heap_start>
80006554:	80018737          	lui	a4,0x80018
80006558:	00070713          	mv	a4,a4
8000655c:	8ee1a023          	sw	a4,-1824(gp) # 80003350 <heap_end>
80006560:	8ef1a423          	sw	a5,-1816(gp) # 80003358 <sbrk_heap_end>
80006564:	8e81a683          	lw	a3,-1816(gp) # 80003358 <sbrk_heap_end>
80006568:	8e01a703          	lw	a4,-1824(gp) # 80003350 <heap_end>
8000656c:	00a687b3          	add	a5,a3,a0
80006570:	04e7e063          	bltu	a5,a4,800065b0 <_sbrk+0x70>
80006574:	f7010113          	addi	sp,sp,-144
80006578:	80003637          	lui	a2,0x80003
8000657c:	00050793          	mv	a5,a0
80006580:	da860613          	addi	a2,a2,-600 # 80002da8 <_ram_heap_end+0xfffeada8>
80006584:	08000593          	li	a1,128
80006588:	00010513          	mv	a0,sp
8000658c:	08112623          	sw	ra,140(sp)
80006590:	491080ef          	jal	ra,8000f220 <sniprintf>
80006594:	00010513          	mv	a0,sp
80006598:	f7dff0ef          	jal	ra,80006514 <print_uart0>
8000659c:	08c12083          	lw	ra,140(sp)
800065a0:	fff00693          	li	a3,-1
800065a4:	00068513          	mv	a0,a3
800065a8:	09010113          	addi	sp,sp,144
800065ac:	00008067          	ret
800065b0:	8ef1a423          	sw	a5,-1816(gp) # 80003358 <sbrk_heap_end>
800065b4:	00068513          	mv	a0,a3
800065b8:	00008067          	ret

800065bc <print_uart1>:
800065bc:	f00116b7          	lui	a3,0xf0011
800065c0:	00054703          	lbu	a4,0(a0)
800065c4:	00071463          	bnez	a4,800065cc <print_uart1+0x10>
800065c8:	00008067          	ret
800065cc:	0046a783          	lw	a5,4(a3) # f0011004 <_ram_heap_end+0x6fff9004>
800065d0:	0107d793          	srli	a5,a5,0x10
800065d4:	0ff7f793          	andi	a5,a5,255
800065d8:	fe078ae3          	beqz	a5,800065cc <print_uart1+0x10>
800065dc:	00e6a023          	sw	a4,0(a3)
800065e0:	00150513          	addi	a0,a0,1
800065e4:	fddff06f          	j	800065c0 <print_uart1+0x4>

800065e8 <_write>:
800065e8:	00c586b3          	add	a3,a1,a2
800065ec:	f0010737          	lui	a4,0xf0010
800065f0:	00d59663          	bne	a1,a3,800065fc <_write+0x14>
800065f4:	00060513          	mv	a0,a2
800065f8:	00008067          	ret
800065fc:	00158593          	addi	a1,a1,1
80006600:	fff5c503          	lbu	a0,-1(a1)
80006604:	00472783          	lw	a5,4(a4) # f0010004 <_ram_heap_end+0x6fff8004>
80006608:	0107d793          	srli	a5,a5,0x10
8000660c:	0ff7f793          	andi	a5,a5,255
80006610:	fe078ae3          	beqz	a5,80006604 <_write+0x1c>
80006614:	00a72023          	sw	a0,0(a4)
80006618:	fd9ff06f          	j	800065f0 <_write+0x8>

8000661c <_read>:
8000661c:	00100513          	li	a0,1
80006620:	00008067          	ret

80006624 <_close>:
80006624:	fff00513          	li	a0,-1
80006628:	00008067          	ret

8000662c <_lseek>:
8000662c:	00000513          	li	a0,0
80006630:	00008067          	ret

80006634 <_isatty>:
80006634:	00100513          	li	a0,1
80006638:	00008067          	ret

8000663c <_fstat>:
8000663c:	000027b7          	lui	a5,0x2
80006640:	00f5a223          	sw	a5,4(a1)
80006644:	00000513          	li	a0,0
80006648:	00008067          	ret

8000664c <_kill>:
8000664c:	00008067          	ret

80006650 <_getpid>:
80006650:	fff00513          	li	a0,-1
80006654:	00008067          	ret

80006658 <hard_reboot>:
80006658:	80003537          	lui	a0,0x80003
8000665c:	ff010113          	addi	sp,sp,-16
80006660:	dec50513          	addi	a0,a0,-532 # 80002dec <_ram_heap_end+0xfffeadec>
80006664:	00112623          	sw	ra,12(sp)
80006668:	eadff0ef          	jal	ra,80006514 <print_uart0>
8000666c:	3e800513          	li	a0,1000
80006670:	e75ff0ef          	jal	ra,800064e4 <delay_us>
80006674:	f00a07b7          	lui	a5,0xf00a0
80006678:	00100713          	li	a4,1
8000667c:	00e7a423          	sw	a4,8(a5) # f00a0008 <_ram_heap_end+0x70088008>
80006680:	00c12083          	lw	ra,12(sp)
80006684:	01010113          	addi	sp,sp,16
80006688:	00008067          	ret

8000668c <memcpy_rev>:
8000668c:	00000793          	li	a5,0
80006690:	00f61463          	bne	a2,a5,80006698 <memcpy_rev+0xc>
80006694:	00008067          	ret
80006698:	40f58733          	sub	a4,a1,a5
8000669c:	00074683          	lbu	a3,0(a4)
800066a0:	00f50733          	add	a4,a0,a5
800066a4:	00178793          	addi	a5,a5,1
800066a8:	00d70023          	sb	a3,0(a4)
800066ac:	fe5ff06f          	j	80006690 <memcpy_rev+0x4>

800066b0 <lwip_init>:
800066b0:	ff010113          	addi	sp,sp,-16
800066b4:	00112623          	sw	ra,12(sp)
800066b8:	340020ef          	jal	ra,800089f8 <stats_init>
800066bc:	015000ef          	jal	ra,80006ed0 <mem_init>
800066c0:	141000ef          	jal	ra,80007000 <memp_init>
800066c4:	27d000ef          	jal	ra,80007140 <netif_init>
800066c8:	618020ef          	jal	ra,80008ce0 <udp_init>
800066cc:	00c12083          	lw	ra,12(sp)
800066d0:	01010113          	addi	sp,sp,16
800066d4:	4500206f          	j	80008b24 <sys_timeouts_init>

800066d8 <lwip_htons>:
800066d8:	00851793          	slli	a5,a0,0x8
800066dc:	00855513          	srli	a0,a0,0x8
800066e0:	00a7e533          	or	a0,a5,a0
800066e4:	01051513          	slli	a0,a0,0x10
800066e8:	01055513          	srli	a0,a0,0x10
800066ec:	00008067          	ret

800066f0 <lwip_htonl>:
800066f0:	01855713          	srli	a4,a0,0x18
800066f4:	01851793          	slli	a5,a0,0x18
800066f8:	00e7e7b3          	or	a5,a5,a4
800066fc:	00ff06b7          	lui	a3,0xff0
80006700:	00851713          	slli	a4,a0,0x8
80006704:	00d77733          	and	a4,a4,a3
80006708:	00e7e7b3          	or	a5,a5,a4
8000670c:	00010737          	lui	a4,0x10
80006710:	f0070713          	addi	a4,a4,-256 # ff00 <_stack_size+0xef00>
80006714:	00855513          	srli	a0,a0,0x8
80006718:	00e57533          	and	a0,a0,a4
8000671c:	00a7e533          	or	a0,a5,a0
80006720:	00008067          	ret

80006724 <lwip_strnstr>:
80006724:	fe010113          	addi	sp,sp,-32
80006728:	00812c23          	sw	s0,24(sp)
8000672c:	00050413          	mv	s0,a0
80006730:	00058513          	mv	a0,a1
80006734:	00912a23          	sw	s1,20(sp)
80006738:	01312623          	sw	s3,12(sp)
8000673c:	00112e23          	sw	ra,28(sp)
80006740:	01212823          	sw	s2,16(sp)
80006744:	00058993          	mv	s3,a1
80006748:	00060493          	mv	s1,a2
8000674c:	5a1080ef          	jal	ra,8000f4ec <strlen>
80006750:	02050063          	beqz	a0,80006770 <lwip_strnstr+0x4c>
80006754:	00050913          	mv	s2,a0
80006758:	009404b3          	add	s1,s0,s1
8000675c:	00044783          	lbu	a5,0(s0)
80006760:	00078663          	beqz	a5,8000676c <lwip_strnstr+0x48>
80006764:	01240733          	add	a4,s0,s2
80006768:	02e4f463          	bgeu	s1,a4,80006790 <lwip_strnstr+0x6c>
8000676c:	00000413          	li	s0,0
80006770:	00040513          	mv	a0,s0
80006774:	01c12083          	lw	ra,28(sp)
80006778:	01812403          	lw	s0,24(sp)
8000677c:	01412483          	lw	s1,20(sp)
80006780:	01012903          	lw	s2,16(sp)
80006784:	00c12983          	lw	s3,12(sp)
80006788:	02010113          	addi	sp,sp,32
8000678c:	00008067          	ret
80006790:	0009c703          	lbu	a4,0(s3)
80006794:	00f71c63          	bne	a4,a5,800067ac <lwip_strnstr+0x88>
80006798:	00090613          	mv	a2,s2
8000679c:	00098593          	mv	a1,s3
800067a0:	00040513          	mv	a0,s0
800067a4:	565080ef          	jal	ra,8000f508 <strncmp>
800067a8:	fc0504e3          	beqz	a0,80006770 <lwip_strnstr+0x4c>
800067ac:	00140413          	addi	s0,s0,1
800067b0:	fadff06f          	j	8000675c <lwip_strnstr+0x38>

800067b4 <lwip_stricmp>:
800067b4:	01900813          	li	a6,25
800067b8:	00150513          	addi	a0,a0,1
800067bc:	00158593          	addi	a1,a1,1
800067c0:	fff54703          	lbu	a4,-1(a0)
800067c4:	fff5c783          	lbu	a5,-1(a1)
800067c8:	00f70e63          	beq	a4,a5,800067e4 <lwip_stricmp+0x30>
800067cc:	02076613          	ori	a2,a4,32
800067d0:	f9f60693          	addi	a3,a2,-97
800067d4:	0ff6f693          	andi	a3,a3,255
800067d8:	00d86c63          	bltu	a6,a3,800067f0 <lwip_stricmp+0x3c>
800067dc:	0207e793          	ori	a5,a5,32
800067e0:	00f61863          	bne	a2,a5,800067f0 <lwip_stricmp+0x3c>
800067e4:	fc071ae3          	bnez	a4,800067b8 <lwip_stricmp+0x4>
800067e8:	00000513          	li	a0,0
800067ec:	00008067          	ret
800067f0:	00100513          	li	a0,1
800067f4:	00008067          	ret

800067f8 <lwip_strnicmp>:
800067f8:	fff60613          	addi	a2,a2,-1
800067fc:	00000793          	li	a5,0
80006800:	01900313          	li	t1,25
80006804:	00f50733          	add	a4,a0,a5
80006808:	00074683          	lbu	a3,0(a4)
8000680c:	00f58733          	add	a4,a1,a5
80006810:	00074703          	lbu	a4,0(a4)
80006814:	00e68e63          	beq	a3,a4,80006830 <lwip_strnicmp+0x38>
80006818:	0206e893          	ori	a7,a3,32
8000681c:	f9f88813          	addi	a6,a7,-97
80006820:	0ff87813          	andi	a6,a6,255
80006824:	03036063          	bltu	t1,a6,80006844 <lwip_strnicmp+0x4c>
80006828:	02076713          	ori	a4,a4,32
8000682c:	00e89c63          	bne	a7,a4,80006844 <lwip_strnicmp+0x4c>
80006830:	00f60663          	beq	a2,a5,8000683c <lwip_strnicmp+0x44>
80006834:	00178793          	addi	a5,a5,1
80006838:	fc0696e3          	bnez	a3,80006804 <lwip_strnicmp+0xc>
8000683c:	00000513          	li	a0,0
80006840:	00008067          	ret
80006844:	00100513          	li	a0,1
80006848:	00008067          	ret

8000684c <lwip_itoa>:
8000684c:	fe010113          	addi	sp,sp,-32
80006850:	01212823          	sw	s2,16(sp)
80006854:	01412423          	sw	s4,8(sp)
80006858:	00112e23          	sw	ra,28(sp)
8000685c:	00812c23          	sw	s0,24(sp)
80006860:	00912a23          	sw	s1,20(sp)
80006864:	01312623          	sw	s3,12(sp)
80006868:	00100793          	li	a5,1
8000686c:	00050913          	mv	s2,a0
80006870:	00058a13          	mv	s4,a1
80006874:	02b7e663          	bltu	a5,a1,800068a0 <lwip_itoa+0x54>
80006878:	00f59463          	bne	a1,a5,80006880 <lwip_itoa+0x34>
8000687c:	00090023          	sb	zero,0(s2)
80006880:	01c12083          	lw	ra,28(sp)
80006884:	01812403          	lw	s0,24(sp)
80006888:	01412483          	lw	s1,20(sp)
8000688c:	01012903          	lw	s2,16(sp)
80006890:	00c12983          	lw	s3,12(sp)
80006894:	00812a03          	lw	s4,8(sp)
80006898:	02010113          	addi	sp,sp,32
8000689c:	00008067          	ret
800068a0:	00050993          	mv	s3,a0
800068a4:	00065863          	bgez	a2,800068b4 <lwip_itoa+0x68>
800068a8:	02d00793          	li	a5,45
800068ac:	00150993          	addi	s3,a0,1
800068b0:	00f50023          	sb	a5,0(a0)
800068b4:	41f65793          	srai	a5,a2,0x1f
800068b8:	fffa0413          	addi	s0,s4,-1
800068bc:	00890433          	add	s0,s2,s0
800068c0:	00c7c4b3          	xor	s1,a5,a2
800068c4:	40f484b3          	sub	s1,s1,a5
800068c8:	00040023          	sb	zero,0(s0)
800068cc:	04048263          	beqz	s1,80006910 <lwip_itoa+0xc4>
800068d0:	fa89f6e3          	bgeu	s3,s0,8000687c <lwip_itoa+0x30>
800068d4:	00a00593          	li	a1,10
800068d8:	00048513          	mv	a0,s1
800068dc:	410070ef          	jal	ra,8000dcec <__modsi3>
800068e0:	03050513          	addi	a0,a0,48
800068e4:	fff40413          	addi	s0,s0,-1
800068e8:	00a40023          	sb	a0,0(s0)
800068ec:	00a00593          	li	a1,10
800068f0:	00048513          	mv	a0,s1
800068f4:	374070ef          	jal	ra,8000dc68 <__divsi3>
800068f8:	00050493          	mv	s1,a0
800068fc:	fd1ff06f          	j	800068cc <lwip_itoa+0x80>
80006900:	03000793          	li	a5,48
80006904:	00f98023          	sb	a5,0(s3)
80006908:	000980a3          	sb	zero,1(s3)
8000690c:	f75ff06f          	j	80006880 <lwip_itoa+0x34>
80006910:	00044783          	lbu	a5,0(s0)
80006914:	fe0786e3          	beqz	a5,80006900 <lwip_itoa+0xb4>
80006918:	01490633          	add	a2,s2,s4
8000691c:	40860633          	sub	a2,a2,s0
80006920:	00040593          	mv	a1,s0
80006924:	01812403          	lw	s0,24(sp)
80006928:	01c12083          	lw	ra,28(sp)
8000692c:	01412483          	lw	s1,20(sp)
80006930:	01012903          	lw	s2,16(sp)
80006934:	00812a03          	lw	s4,8(sp)
80006938:	00098513          	mv	a0,s3
8000693c:	00c12983          	lw	s3,12(sp)
80006940:	02010113          	addi	sp,sp,32
80006944:	2a40806f          	j	8000ebe8 <memmove>

80006948 <lwip_standard_chksum>:
80006948:	ff010113          	addi	sp,sp,-16
8000694c:	00011723          	sh	zero,14(sp)
80006950:	00157693          	andi	a3,a0,1
80006954:	00068c63          	beqz	a3,8000696c <lwip_standard_chksum+0x24>
80006958:	00b05a63          	blez	a1,8000696c <lwip_standard_chksum+0x24>
8000695c:	00054783          	lbu	a5,0(a0)
80006960:	fff58593          	addi	a1,a1,-1
80006964:	00150513          	addi	a0,a0,1
80006968:	00f107a3          	sb	a5,15(sp)
8000696c:	00000793          	li	a5,0
80006970:	00100713          	li	a4,1
80006974:	06b74063          	blt	a4,a1,800069d4 <lwip_standard_chksum+0x8c>
80006978:	00e59663          	bne	a1,a4,80006984 <lwip_standard_chksum+0x3c>
8000697c:	00054703          	lbu	a4,0(a0)
80006980:	00e10723          	sb	a4,14(sp)
80006984:	00e15503          	lhu	a0,14(sp)
80006988:	00010737          	lui	a4,0x10
8000698c:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xefff>
80006990:	00f50533          	add	a0,a0,a5
80006994:	01055793          	srli	a5,a0,0x10
80006998:	00e57533          	and	a0,a0,a4
8000699c:	00a787b3          	add	a5,a5,a0
800069a0:	0107d513          	srli	a0,a5,0x10
800069a4:	00e7f7b3          	and	a5,a5,a4
800069a8:	00f50533          	add	a0,a0,a5
800069ac:	00068c63          	beqz	a3,800069c4 <lwip_standard_chksum+0x7c>
800069b0:	00851793          	slli	a5,a0,0x8
800069b4:	00855513          	srli	a0,a0,0x8
800069b8:	00e7f733          	and	a4,a5,a4
800069bc:	0ff57513          	andi	a0,a0,255
800069c0:	00a76533          	or	a0,a4,a0
800069c4:	01051513          	slli	a0,a0,0x10
800069c8:	01055513          	srli	a0,a0,0x10
800069cc:	01010113          	addi	sp,sp,16
800069d0:	00008067          	ret
800069d4:	00250513          	addi	a0,a0,2
800069d8:	ffe55603          	lhu	a2,-2(a0)
800069dc:	ffe58593          	addi	a1,a1,-2
800069e0:	00c787b3          	add	a5,a5,a2
800069e4:	f91ff06f          	j	80006974 <lwip_standard_chksum+0x2c>

800069e8 <inet_chksum_pseudo>:
800069e8:	fe010113          	addi	sp,sp,-32
800069ec:	00812c23          	sw	s0,24(sp)
800069f0:	00912a23          	sw	s1,20(sp)
800069f4:	01212823          	sw	s2,16(sp)
800069f8:	01312623          	sw	s3,12(sp)
800069fc:	01412423          	sw	s4,8(sp)
80006a00:	01512223          	sw	s5,4(sp)
80006a04:	00112e23          	sw	ra,28(sp)
80006a08:	00072703          	lw	a4,0(a4)
80006a0c:	0006a683          	lw	a3,0(a3) # ff0000 <_stack_size+0xfef000>
80006a10:	000107b7          	lui	a5,0x10
80006a14:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xefff>
80006a18:	00f77433          	and	s0,a4,a5
80006a1c:	01075713          	srli	a4,a4,0x10
80006a20:	00e40433          	add	s0,s0,a4
80006a24:	00f6f733          	and	a4,a3,a5
80006a28:	00e40433          	add	s0,s0,a4
80006a2c:	0106d693          	srli	a3,a3,0x10
80006a30:	008686b3          	add	a3,a3,s0
80006a34:	0106d413          	srli	s0,a3,0x10
80006a38:	00f6f6b3          	and	a3,a3,a5
80006a3c:	00d406b3          	add	a3,s0,a3
80006a40:	0106d413          	srli	s0,a3,0x10
80006a44:	00f6f6b3          	and	a3,a3,a5
80006a48:	00050993          	mv	s3,a0
80006a4c:	00058a13          	mv	s4,a1
80006a50:	00060913          	mv	s2,a2
80006a54:	00d40433          	add	s0,s0,a3
80006a58:	00000a93          	li	s5,0
80006a5c:	00078493          	mv	s1,a5
80006a60:	08099863          	bnez	s3,80006af0 <inet_chksum_pseudo+0x108>
80006a64:	020a8063          	beqz	s5,80006a84 <inet_chksum_pseudo+0x9c>
80006a68:	00010737          	lui	a4,0x10
80006a6c:	00841793          	slli	a5,s0,0x8
80006a70:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xefff>
80006a74:	00845413          	srli	s0,s0,0x8
80006a78:	00e7f7b3          	and	a5,a5,a4
80006a7c:	0ff47413          	andi	s0,s0,255
80006a80:	0087e433          	or	s0,a5,s0
80006a84:	000a0513          	mv	a0,s4
80006a88:	c51ff0ef          	jal	ra,800066d8 <lwip_htons>
80006a8c:	00050493          	mv	s1,a0
80006a90:	00090513          	mv	a0,s2
80006a94:	c45ff0ef          	jal	ra,800066d8 <lwip_htons>
80006a98:	00a48533          	add	a0,s1,a0
80006a9c:	000107b7          	lui	a5,0x10
80006aa0:	00850433          	add	s0,a0,s0
80006aa4:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xefff>
80006aa8:	01045513          	srli	a0,s0,0x10
80006aac:	00f47433          	and	s0,s0,a5
80006ab0:	00850433          	add	s0,a0,s0
80006ab4:	01045513          	srli	a0,s0,0x10
80006ab8:	00f47433          	and	s0,s0,a5
80006abc:	00850433          	add	s0,a0,s0
80006ac0:	fff44513          	not	a0,s0
80006ac4:	01c12083          	lw	ra,28(sp)
80006ac8:	01812403          	lw	s0,24(sp)
80006acc:	01051513          	slli	a0,a0,0x10
80006ad0:	01412483          	lw	s1,20(sp)
80006ad4:	01012903          	lw	s2,16(sp)
80006ad8:	00c12983          	lw	s3,12(sp)
80006adc:	00812a03          	lw	s4,8(sp)
80006ae0:	00412a83          	lw	s5,4(sp)
80006ae4:	01055513          	srli	a0,a0,0x10
80006ae8:	02010113          	addi	sp,sp,32
80006aec:	00008067          	ret
80006af0:	00a9d583          	lhu	a1,10(s3)
80006af4:	0049a503          	lw	a0,4(s3)
80006af8:	e51ff0ef          	jal	ra,80006948 <lwip_standard_chksum>
80006afc:	00850433          	add	s0,a0,s0
80006b00:	01045793          	srli	a5,s0,0x10
80006b04:	00947433          	and	s0,s0,s1
80006b08:	00878433          	add	s0,a5,s0
80006b0c:	00a9d783          	lhu	a5,10(s3)
80006b10:	0017f793          	andi	a5,a5,1
80006b14:	00078e63          	beqz	a5,80006b30 <inet_chksum_pseudo+0x148>
80006b18:	00841793          	slli	a5,s0,0x8
80006b1c:	00845413          	srli	s0,s0,0x8
80006b20:	0097f7b3          	and	a5,a5,s1
80006b24:	0ff47413          	andi	s0,s0,255
80006b28:	001aca93          	xori	s5,s5,1
80006b2c:	0087e433          	or	s0,a5,s0
80006b30:	0009a983          	lw	s3,0(s3)
80006b34:	f2dff06f          	j	80006a60 <inet_chksum_pseudo+0x78>

80006b38 <ip_chksum_pseudo>:
80006b38:	eb1ff06f          	j	800069e8 <inet_chksum_pseudo>

80006b3c <inet_chksum_pseudo_partial>:
80006b3c:	fd010113          	addi	sp,sp,-48
80006b40:	02812423          	sw	s0,40(sp)
80006b44:	02912223          	sw	s1,36(sp)
80006b48:	03212023          	sw	s2,32(sp)
80006b4c:	01412c23          	sw	s4,24(sp)
80006b50:	01512a23          	sw	s5,20(sp)
80006b54:	01612823          	sw	s6,16(sp)
80006b58:	02112623          	sw	ra,44(sp)
80006b5c:	01312e23          	sw	s3,28(sp)
80006b60:	00060913          	mv	s2,a2
80006b64:	0007a603          	lw	a2,0(a5)
80006b68:	00072703          	lw	a4,0(a4)
80006b6c:	000107b7          	lui	a5,0x10
80006b70:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xefff>
80006b74:	00f67433          	and	s0,a2,a5
80006b78:	01065613          	srli	a2,a2,0x10
80006b7c:	00c40433          	add	s0,s0,a2
80006b80:	00f77633          	and	a2,a4,a5
80006b84:	00c40433          	add	s0,s0,a2
80006b88:	01075713          	srli	a4,a4,0x10
80006b8c:	00870733          	add	a4,a4,s0
80006b90:	01075413          	srli	s0,a4,0x10
80006b94:	00f77733          	and	a4,a4,a5
80006b98:	00e40733          	add	a4,s0,a4
80006b9c:	01075413          	srli	s0,a4,0x10
80006ba0:	00f77733          	and	a4,a4,a5
80006ba4:	00050a13          	mv	s4,a0
80006ba8:	00058a93          	mv	s5,a1
80006bac:	00e40433          	add	s0,s0,a4
80006bb0:	00000b13          	li	s6,0
80006bb4:	00078493          	mv	s1,a5
80006bb8:	060a1c63          	bnez	s4,80006c30 <inet_chksum_pseudo_partial+0xf4>
80006bbc:	0e0b1663          	bnez	s6,80006ca8 <inet_chksum_pseudo_partial+0x16c>
80006bc0:	000a8513          	mv	a0,s5
80006bc4:	b15ff0ef          	jal	ra,800066d8 <lwip_htons>
80006bc8:	00050493          	mv	s1,a0
80006bcc:	00090513          	mv	a0,s2
80006bd0:	b09ff0ef          	jal	ra,800066d8 <lwip_htons>
80006bd4:	00a48533          	add	a0,s1,a0
80006bd8:	000107b7          	lui	a5,0x10
80006bdc:	00850433          	add	s0,a0,s0
80006be0:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xefff>
80006be4:	01045513          	srli	a0,s0,0x10
80006be8:	00f47433          	and	s0,s0,a5
80006bec:	00850433          	add	s0,a0,s0
80006bf0:	01045513          	srli	a0,s0,0x10
80006bf4:	00f47433          	and	s0,s0,a5
80006bf8:	00850433          	add	s0,a0,s0
80006bfc:	fff44513          	not	a0,s0
80006c00:	02c12083          	lw	ra,44(sp)
80006c04:	02812403          	lw	s0,40(sp)
80006c08:	01051513          	slli	a0,a0,0x10
80006c0c:	02412483          	lw	s1,36(sp)
80006c10:	02012903          	lw	s2,32(sp)
80006c14:	01c12983          	lw	s3,28(sp)
80006c18:	01812a03          	lw	s4,24(sp)
80006c1c:	01412a83          	lw	s5,20(sp)
80006c20:	01012b03          	lw	s6,16(sp)
80006c24:	01055513          	srli	a0,a0,0x10
80006c28:	03010113          	addi	sp,sp,48
80006c2c:	00008067          	ret
80006c30:	f80686e3          	beqz	a3,80006bbc <inet_chksum_pseudo_partial+0x80>
80006c34:	00aa5783          	lhu	a5,10(s4)
80006c38:	00078993          	mv	s3,a5
80006c3c:	00f6f463          	bgeu	a3,a5,80006c44 <inet_chksum_pseudo_partial+0x108>
80006c40:	00068993          	mv	s3,a3
80006c44:	01099993          	slli	s3,s3,0x10
80006c48:	004a2503          	lw	a0,4(s4)
80006c4c:	0109d993          	srli	s3,s3,0x10
80006c50:	00098593          	mv	a1,s3
80006c54:	00d12623          	sw	a3,12(sp)
80006c58:	cf1ff0ef          	jal	ra,80006948 <lwip_standard_chksum>
80006c5c:	00850433          	add	s0,a0,s0
80006c60:	01045793          	srli	a5,s0,0x10
80006c64:	00c12683          	lw	a3,12(sp)
80006c68:	00947433          	and	s0,s0,s1
80006c6c:	00878433          	add	s0,a5,s0
80006c70:	00aa5783          	lhu	a5,10(s4)
80006c74:	413689b3          	sub	s3,a3,s3
80006c78:	01099693          	slli	a3,s3,0x10
80006c7c:	0017f793          	andi	a5,a5,1
80006c80:	0106d693          	srli	a3,a3,0x10
80006c84:	00078e63          	beqz	a5,80006ca0 <inet_chksum_pseudo_partial+0x164>
80006c88:	00841793          	slli	a5,s0,0x8
80006c8c:	00845413          	srli	s0,s0,0x8
80006c90:	0097f7b3          	and	a5,a5,s1
80006c94:	0ff47413          	andi	s0,s0,255
80006c98:	001b4b13          	xori	s6,s6,1
80006c9c:	0087e433          	or	s0,a5,s0
80006ca0:	000a2a03          	lw	s4,0(s4)
80006ca4:	f15ff06f          	j	80006bb8 <inet_chksum_pseudo_partial+0x7c>
80006ca8:	00010737          	lui	a4,0x10
80006cac:	00841793          	slli	a5,s0,0x8
80006cb0:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xefff>
80006cb4:	00845413          	srli	s0,s0,0x8
80006cb8:	00e7f7b3          	and	a5,a5,a4
80006cbc:	0ff47413          	andi	s0,s0,255
80006cc0:	0087e433          	or	s0,a5,s0
80006cc4:	efdff06f          	j	80006bc0 <inet_chksum_pseudo_partial+0x84>

80006cc8 <ip_chksum_pseudo_partial>:
80006cc8:	e75ff06f          	j	80006b3c <inet_chksum_pseudo_partial>

80006ccc <inet_chksum>:
80006ccc:	ff010113          	addi	sp,sp,-16
80006cd0:	00112623          	sw	ra,12(sp)
80006cd4:	c75ff0ef          	jal	ra,80006948 <lwip_standard_chksum>
80006cd8:	00c12083          	lw	ra,12(sp)
80006cdc:	fff54513          	not	a0,a0
80006ce0:	01051513          	slli	a0,a0,0x10
80006ce4:	01055513          	srli	a0,a0,0x10
80006ce8:	01010113          	addi	sp,sp,16
80006cec:	00008067          	ret

80006cf0 <inet_chksum_pbuf>:
80006cf0:	fe010113          	addi	sp,sp,-32
80006cf4:	01212823          	sw	s2,16(sp)
80006cf8:	00010937          	lui	s2,0x10
80006cfc:	00812c23          	sw	s0,24(sp)
80006d00:	00912a23          	sw	s1,20(sp)
80006d04:	01312623          	sw	s3,12(sp)
80006d08:	00112e23          	sw	ra,28(sp)
80006d0c:	00050493          	mv	s1,a0
80006d10:	00000993          	li	s3,0
80006d14:	00000413          	li	s0,0
80006d18:	fff90913          	addi	s2,s2,-1 # ffff <_stack_size+0xefff>
80006d1c:	04049663          	bnez	s1,80006d68 <inet_chksum_pbuf+0x78>
80006d20:	02098063          	beqz	s3,80006d40 <inet_chksum_pbuf+0x50>
80006d24:	00010737          	lui	a4,0x10
80006d28:	00841793          	slli	a5,s0,0x8
80006d2c:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xefff>
80006d30:	00845413          	srli	s0,s0,0x8
80006d34:	00e7f7b3          	and	a5,a5,a4
80006d38:	0ff47413          	andi	s0,s0,255
80006d3c:	0087e433          	or	s0,a5,s0
80006d40:	fff44513          	not	a0,s0
80006d44:	01c12083          	lw	ra,28(sp)
80006d48:	01812403          	lw	s0,24(sp)
80006d4c:	01051513          	slli	a0,a0,0x10
80006d50:	01412483          	lw	s1,20(sp)
80006d54:	01012903          	lw	s2,16(sp)
80006d58:	00c12983          	lw	s3,12(sp)
80006d5c:	01055513          	srli	a0,a0,0x10
80006d60:	02010113          	addi	sp,sp,32
80006d64:	00008067          	ret
80006d68:	00a4d583          	lhu	a1,10(s1)
80006d6c:	0044a503          	lw	a0,4(s1)
80006d70:	bd9ff0ef          	jal	ra,80006948 <lwip_standard_chksum>
80006d74:	00850433          	add	s0,a0,s0
80006d78:	01045793          	srli	a5,s0,0x10
80006d7c:	01247433          	and	s0,s0,s2
80006d80:	00878433          	add	s0,a5,s0
80006d84:	00a4d783          	lhu	a5,10(s1)
80006d88:	0017f793          	andi	a5,a5,1
80006d8c:	00078e63          	beqz	a5,80006da8 <inet_chksum_pbuf+0xb8>
80006d90:	00841793          	slli	a5,s0,0x8
80006d94:	00845413          	srli	s0,s0,0x8
80006d98:	0127f7b3          	and	a5,a5,s2
80006d9c:	0ff47413          	andi	s0,s0,255
80006da0:	0019c993          	xori	s3,s3,1
80006da4:	0087e433          	or	s0,a5,s0
80006da8:	0004a483          	lw	s1,0(s1)
80006dac:	f71ff06f          	j	80006d1c <inet_chksum_pbuf+0x2c>

80006db0 <mem_overflow_check_raw>:
80006db0:	f5010113          	addi	sp,sp,-176
80006db4:	0a812423          	sw	s0,168(sp)
80006db8:	0a912223          	sw	s1,164(sp)
80006dbc:	0b212023          	sw	s2,160(sp)
80006dc0:	09312e23          	sw	s3,156(sp)
80006dc4:	09412c23          	sw	s4,152(sp)
80006dc8:	09512a23          	sw	s5,148(sp)
80006dcc:	09612823          	sw	s6,144(sp)
80006dd0:	09712623          	sw	s7,140(sp)
80006dd4:	0a112623          	sw	ra,172(sp)
80006dd8:	00050493          	mv	s1,a0
80006ddc:	00058a93          	mv	s5,a1
80006de0:	00060913          	mv	s2,a2
80006de4:	00068993          	mv	s3,a3
80006de8:	00000413          	li	s0,0
80006dec:	0cd00b13          	li	s6,205
80006df0:	80003bb7          	lui	s7,0x80003
80006df4:	01000a13          	li	s4,16
80006df8:	008a87b3          	add	a5,s5,s0
80006dfc:	00f487b3          	add	a5,s1,a5
80006e00:	0007c783          	lbu	a5,0(a5)
80006e04:	01678e63          	beq	a5,s6,80006e20 <mem_overflow_check_raw+0x70>
80006e08:	00098713          	mv	a4,s3
80006e0c:	00090693          	mv	a3,s2
80006e10:	e08b8613          	addi	a2,s7,-504 # 80002e08 <_ram_heap_end+0xfffeae08>
80006e14:	08000593          	li	a1,128
80006e18:	00010513          	mv	a0,sp
80006e1c:	404080ef          	jal	ra,8000f220 <sniprintf>
80006e20:	00140413          	addi	s0,s0,1
80006e24:	fd441ae3          	bne	s0,s4,80006df8 <mem_overflow_check_raw+0x48>
80006e28:	ff048413          	addi	s0,s1,-16
80006e2c:	0cd00a13          	li	s4,205
80006e30:	80003ab7          	lui	s5,0x80003
80006e34:	00044783          	lbu	a5,0(s0)
80006e38:	01478e63          	beq	a5,s4,80006e54 <mem_overflow_check_raw+0xa4>
80006e3c:	00098713          	mv	a4,s3
80006e40:	00090693          	mv	a3,s2
80006e44:	e28a8613          	addi	a2,s5,-472 # 80002e28 <_ram_heap_end+0xfffeae28>
80006e48:	08000593          	li	a1,128
80006e4c:	00010513          	mv	a0,sp
80006e50:	3d0080ef          	jal	ra,8000f220 <sniprintf>
80006e54:	00140413          	addi	s0,s0,1
80006e58:	fc849ee3          	bne	s1,s0,80006e34 <mem_overflow_check_raw+0x84>
80006e5c:	0ac12083          	lw	ra,172(sp)
80006e60:	0a812403          	lw	s0,168(sp)
80006e64:	0a412483          	lw	s1,164(sp)
80006e68:	0a012903          	lw	s2,160(sp)
80006e6c:	09c12983          	lw	s3,156(sp)
80006e70:	09812a03          	lw	s4,152(sp)
80006e74:	09412a83          	lw	s5,148(sp)
80006e78:	09012b03          	lw	s6,144(sp)
80006e7c:	08c12b83          	lw	s7,140(sp)
80006e80:	0b010113          	addi	sp,sp,176
80006e84:	00008067          	ret

80006e88 <mem_overflow_init_raw>:
80006e88:	ff010113          	addi	sp,sp,-16
80006e8c:	00812423          	sw	s0,8(sp)
80006e90:	00912223          	sw	s1,4(sp)
80006e94:	00050413          	mv	s0,a0
80006e98:	00058493          	mv	s1,a1
80006e9c:	01000613          	li	a2,16
80006ea0:	0cd00593          	li	a1,205
80006ea4:	ff050513          	addi	a0,a0,-16
80006ea8:	00112623          	sw	ra,12(sp)
80006eac:	6b4060ef          	jal	ra,8000d560 <memset>
80006eb0:	00940533          	add	a0,s0,s1
80006eb4:	00812403          	lw	s0,8(sp)
80006eb8:	00c12083          	lw	ra,12(sp)
80006ebc:	00412483          	lw	s1,4(sp)
80006ec0:	01000613          	li	a2,16
80006ec4:	0cd00593          	li	a1,205
80006ec8:	01010113          	addi	sp,sp,16
80006ecc:	6940606f          	j	8000d560 <memset>

80006ed0 <mem_init>:
80006ed0:	00008067          	ret

80006ed4 <mem_trim>:
80006ed4:	00008067          	ret

80006ed8 <lwip_malloc>:
80006ed8:	ff010113          	addi	sp,sp,-16
80006edc:	00812423          	sw	s0,8(sp)
80006ee0:	00112623          	sw	ra,12(sp)
80006ee4:	3dd070ef          	jal	ra,8000eac0 <malloc>
80006ee8:	00050413          	mv	s0,a0
80006eec:	00051663          	bnez	a0,80006ef8 <lwip_malloc+0x20>
80006ef0:	b98fe0ef          	jal	ra,80005288 <sys_arch_protect>
80006ef4:	b98fe0ef          	jal	ra,8000528c <sys_arch_unprotect>
80006ef8:	00040513          	mv	a0,s0
80006efc:	00c12083          	lw	ra,12(sp)
80006f00:	00812403          	lw	s0,8(sp)
80006f04:	01010113          	addi	sp,sp,16
80006f08:	00008067          	ret

80006f0c <lwip_free>:
80006f0c:	3c50706f          	j	8000ead0 <free>

80006f10 <lwip_calloc>:
80006f10:	39c0706f          	j	8000e2ac <calloc>

80006f14 <do_memp_free_pool>:
80006f14:	ff010113          	addi	sp,sp,-16
80006f18:	00112623          	sw	ra,12(sp)
80006f1c:	00812423          	sw	s0,8(sp)
80006f20:	00912223          	sw	s1,4(sp)
80006f24:	01212023          	sw	s2,0(sp)
80006f28:	00058413          	mv	s0,a1
80006f2c:	00050493          	mv	s1,a0
80006f30:	b58fe0ef          	jal	ra,80005288 <sys_arch_protect>
80006f34:	0004a683          	lw	a3,0(s1)
80006f38:	0044d583          	lhu	a1,4(s1)
80006f3c:	80003637          	lui	a2,0x80003
80006f40:	00050913          	mv	s2,a0
80006f44:	e6060613          	addi	a2,a2,-416 # 80002e60 <_ram_heap_end+0xfffeae60>
80006f48:	00040513          	mv	a0,s0
80006f4c:	e65ff0ef          	jal	ra,80006db0 <mem_overflow_check_raw>
80006f50:	00090513          	mv	a0,s2
80006f54:	b38fe0ef          	jal	ra,8000528c <sys_arch_unprotect>
80006f58:	fe440513          	addi	a0,s0,-28
80006f5c:	00812403          	lw	s0,8(sp)
80006f60:	00c12083          	lw	ra,12(sp)
80006f64:	00412483          	lw	s1,4(sp)
80006f68:	00012903          	lw	s2,0(sp)
80006f6c:	01010113          	addi	sp,sp,16
80006f70:	f9dff06f          	j	80006f0c <lwip_free>

80006f74 <do_memp_malloc_pool_fn>:
80006f74:	fe010113          	addi	sp,sp,-32
80006f78:	00812c23          	sw	s0,24(sp)
80006f7c:	00912a23          	sw	s1,20(sp)
80006f80:	00112e23          	sw	ra,28(sp)
80006f84:	01212823          	sw	s2,16(sp)
80006f88:	00050493          	mv	s1,a0
80006f8c:	00455503          	lhu	a0,4(a0)
80006f90:	00b12623          	sw	a1,12(sp)
80006f94:	00c12423          	sw	a2,8(sp)
80006f98:	00350513          	addi	a0,a0,3
80006f9c:	ffc57513          	andi	a0,a0,-4
80006fa0:	02c50513          	addi	a0,a0,44
80006fa4:	f35ff0ef          	jal	ra,80006ed8 <lwip_malloc>
80006fa8:	00050413          	mv	s0,a0
80006fac:	adcfe0ef          	jal	ra,80005288 <sys_arch_protect>
80006fb0:	02040663          	beqz	s0,80006fdc <do_memp_malloc_pool_fn+0x68>
80006fb4:	00c12583          	lw	a1,12(sp)
80006fb8:	00812603          	lw	a2,8(sp)
80006fbc:	01c40413          	addi	s0,s0,28
80006fc0:	feb42423          	sw	a1,-24(s0)
80006fc4:	fec42623          	sw	a2,-20(s0)
80006fc8:	0044d583          	lhu	a1,4(s1)
80006fcc:	00050913          	mv	s2,a0
80006fd0:	00040513          	mv	a0,s0
80006fd4:	eb5ff0ef          	jal	ra,80006e88 <mem_overflow_init_raw>
80006fd8:	00090513          	mv	a0,s2
80006fdc:	ab0fe0ef          	jal	ra,8000528c <sys_arch_unprotect>
80006fe0:	00040513          	mv	a0,s0
80006fe4:	01c12083          	lw	ra,28(sp)
80006fe8:	01812403          	lw	s0,24(sp)
80006fec:	01412483          	lw	s1,20(sp)
80006ff0:	01012903          	lw	s2,16(sp)
80006ff4:	02010113          	addi	sp,sp,32
80006ff8:	00008067          	ret

80006ffc <memp_init_pool>:
80006ffc:	00008067          	ret

80007000 <memp_init>:
80007000:	00008067          	ret

80007004 <memp_malloc_pool_fn>:
80007004:	00050463          	beqz	a0,8000700c <memp_malloc_pool_fn+0x8>
80007008:	f6dff06f          	j	80006f74 <do_memp_malloc_pool_fn>
8000700c:	00008067          	ret

80007010 <memp_malloc_fn>:
80007010:	00500793          	li	a5,5
80007014:	00a7ee63          	bltu	a5,a0,80007030 <memp_malloc_fn+0x20>
80007018:	00251793          	slli	a5,a0,0x2
8000701c:	80003537          	lui	a0,0x80003
80007020:	e4850513          	addi	a0,a0,-440 # 80002e48 <_ram_heap_end+0xfffeae48>
80007024:	00f50533          	add	a0,a0,a5
80007028:	00052503          	lw	a0,0(a0)
8000702c:	f49ff06f          	j	80006f74 <do_memp_malloc_pool_fn>
80007030:	00000513          	li	a0,0
80007034:	00008067          	ret

80007038 <memp_free_pool>:
80007038:	00050663          	beqz	a0,80007044 <memp_free_pool+0xc>
8000703c:	00058463          	beqz	a1,80007044 <memp_free_pool+0xc>
80007040:	ed5ff06f          	j	80006f14 <do_memp_free_pool>
80007044:	00008067          	ret

80007048 <memp_free>:
80007048:	00500713          	li	a4,5
8000704c:	02a76063          	bltu	a4,a0,8000706c <memp_free+0x24>
80007050:	00058e63          	beqz	a1,8000706c <memp_free+0x24>
80007054:	00251793          	slli	a5,a0,0x2
80007058:	80003537          	lui	a0,0x80003
8000705c:	e4850513          	addi	a0,a0,-440 # 80002e48 <_ram_heap_end+0xfffeae48>
80007060:	00f50533          	add	a0,a0,a5
80007064:	00052503          	lw	a0,0(a0)
80007068:	eadff06f          	j	80006f14 <do_memp_free_pool>
8000706c:	00008067          	ret

80007070 <netif_null_output_ip4>:
80007070:	ff400513          	li	a0,-12
80007074:	00008067          	ret

80007078 <netif_issue_reports>:
80007078:	03554783          	lbu	a5,53(a0)
8000707c:	00500693          	li	a3,5
80007080:	0057f613          	andi	a2,a5,5
80007084:	02d61263          	bne	a2,a3,800070a8 <netif_issue_reports+0x30>
80007088:	0015f593          	andi	a1,a1,1
8000708c:	00058e63          	beqz	a1,800070a8 <netif_issue_reports+0x30>
80007090:	00452683          	lw	a3,4(a0)
80007094:	00068a63          	beqz	a3,800070a8 <netif_issue_reports+0x30>
80007098:	0087f793          	andi	a5,a5,8
8000709c:	00078663          	beqz	a5,800070a8 <netif_issue_reports+0x30>
800070a0:	00450593          	addi	a1,a0,4
800070a4:	0e50406f          	j	8000b988 <etharp_request>
800070a8:	00008067          	ret

800070ac <netif_do_set_ipaddr>:
800070ac:	00452783          	lw	a5,4(a0)
800070b0:	0005a703          	lw	a4,0(a1)
800070b4:	08f70263          	beq	a4,a5,80007138 <netif_do_set_ipaddr+0x8c>
800070b8:	fe010113          	addi	sp,sp,-32
800070bc:	00f62023          	sw	a5,0(a2)
800070c0:	00812c23          	sw	s0,24(sp)
800070c4:	01212823          	sw	s2,16(sp)
800070c8:	00050413          	mv	s0,a0
800070cc:	00058913          	mv	s2,a1
800070d0:	00060513          	mv	a0,a2
800070d4:	00c10593          	addi	a1,sp,12
800070d8:	00112e23          	sw	ra,28(sp)
800070dc:	00e12623          	sw	a4,12(sp)
800070e0:	00912a23          	sw	s1,20(sp)
800070e4:	00060493          	mv	s1,a2
800070e8:	464020ef          	jal	ra,8000954c <udp_netif_ip_addr_changed>
800070ec:	00c10593          	addi	a1,sp,12
800070f0:	00048513          	mv	a0,s1
800070f4:	0c5010ef          	jal	ra,800089b8 <raw_netif_ip_addr_changed>
800070f8:	00092783          	lw	a5,0(s2)
800070fc:	00100593          	li	a1,1
80007100:	00040513          	mv	a0,s0
80007104:	00f42223          	sw	a5,4(s0)
80007108:	f71ff0ef          	jal	ra,80007078 <netif_issue_reports>
8000710c:	01c42783          	lw	a5,28(s0)
80007110:	00078663          	beqz	a5,8000711c <netif_do_set_ipaddr+0x70>
80007114:	00040513          	mv	a0,s0
80007118:	000780e7          	jalr	a5
8000711c:	01c12083          	lw	ra,28(sp)
80007120:	01812403          	lw	s0,24(sp)
80007124:	01412483          	lw	s1,20(sp)
80007128:	01012903          	lw	s2,16(sp)
8000712c:	00100513          	li	a0,1
80007130:	02010113          	addi	sp,sp,32
80007134:	00008067          	ret
80007138:	00000513          	li	a0,0
8000713c:	00008067          	ret

80007140 <netif_init>:
80007140:	00008067          	ret

80007144 <netif_input>:
80007144:	0355c783          	lbu	a5,53(a1)
80007148:	0187f793          	andi	a5,a5,24
8000714c:	00078463          	beqz	a5,80007154 <netif_input+0x10>
80007150:	1d40606f          	j	8000d324 <ethernet_input>
80007154:	6300506f          	j	8000c784 <ip4_input>

80007158 <netif_set_ipaddr>:
80007158:	02050463          	beqz	a0,80007180 <netif_set_ipaddr+0x28>
8000715c:	fe010113          	addi	sp,sp,-32
80007160:	00112e23          	sw	ra,28(sp)
80007164:	00059463          	bnez	a1,8000716c <netif_set_ipaddr+0x14>
80007168:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
8000716c:	00c10613          	addi	a2,sp,12
80007170:	f3dff0ef          	jal	ra,800070ac <netif_do_set_ipaddr>
80007174:	01c12083          	lw	ra,28(sp)
80007178:	02010113          	addi	sp,sp,32
8000717c:	00008067          	ret
80007180:	00008067          	ret

80007184 <netif_set_netmask>:
80007184:	00050e63          	beqz	a0,800071a0 <netif_set_netmask+0x1c>
80007188:	00059463          	bnez	a1,80007190 <netif_set_netmask+0xc>
8000718c:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
80007190:	0005a783          	lw	a5,0(a1)
80007194:	00852703          	lw	a4,8(a0)
80007198:	00e78463          	beq	a5,a4,800071a0 <netif_set_netmask+0x1c>
8000719c:	00f52423          	sw	a5,8(a0)
800071a0:	00008067          	ret

800071a4 <netif_set_gw>:
800071a4:	00050e63          	beqz	a0,800071c0 <netif_set_gw+0x1c>
800071a8:	00059463          	bnez	a1,800071b0 <netif_set_gw+0xc>
800071ac:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
800071b0:	0005a783          	lw	a5,0(a1)
800071b4:	00c52703          	lw	a4,12(a0)
800071b8:	00e78463          	beq	a5,a4,800071c0 <netif_set_gw+0x1c>
800071bc:	00f52623          	sw	a5,12(a0)
800071c0:	00008067          	ret

800071c4 <netif_set_addr>:
800071c4:	fd010113          	addi	sp,sp,-48
800071c8:	02812423          	sw	s0,40(sp)
800071cc:	02912223          	sw	s1,36(sp)
800071d0:	03212023          	sw	s2,32(sp)
800071d4:	02112623          	sw	ra,44(sp)
800071d8:	00050493          	mv	s1,a0
800071dc:	00060913          	mv	s2,a2
800071e0:	00058413          	mv	s0,a1
800071e4:	00059463          	bnez	a1,800071ec <netif_set_addr+0x28>
800071e8:	84818413          	addi	s0,gp,-1976 # 800032b8 <ip_addr_any>
800071ec:	00091463          	bnez	s2,800071f4 <netif_set_addr+0x30>
800071f0:	84818913          	addi	s2,gp,-1976 # 800032b8 <ip_addr_any>
800071f4:	00069463          	bnez	a3,800071fc <netif_set_addr+0x38>
800071f8:	84818693          	addi	a3,gp,-1976 # 800032b8 <ip_addr_any>
800071fc:	00042783          	lw	a5,0(s0)
80007200:	00078663          	beqz	a5,8000720c <netif_set_addr+0x48>
80007204:	00000793          	li	a5,0
80007208:	0200006f          	j	80007228 <netif_set_addr+0x64>
8000720c:	01c10613          	addi	a2,sp,28
80007210:	00040593          	mv	a1,s0
80007214:	00048513          	mv	a0,s1
80007218:	00d12623          	sw	a3,12(sp)
8000721c:	e91ff0ef          	jal	ra,800070ac <netif_do_set_ipaddr>
80007220:	00c12683          	lw	a3,12(sp)
80007224:	00100793          	li	a5,1
80007228:	00092703          	lw	a4,0(s2)
8000722c:	0084a603          	lw	a2,8(s1)
80007230:	00c70463          	beq	a4,a2,80007238 <netif_set_addr+0x74>
80007234:	00e4a423          	sw	a4,8(s1)
80007238:	0006a703          	lw	a4,0(a3)
8000723c:	00c4a683          	lw	a3,12(s1)
80007240:	00d70463          	beq	a4,a3,80007248 <netif_set_addr+0x84>
80007244:	00e4a623          	sw	a4,12(s1)
80007248:	00079a63          	bnez	a5,8000725c <netif_set_addr+0x98>
8000724c:	01c10613          	addi	a2,sp,28
80007250:	00040593          	mv	a1,s0
80007254:	00048513          	mv	a0,s1
80007258:	e55ff0ef          	jal	ra,800070ac <netif_do_set_ipaddr>
8000725c:	02c12083          	lw	ra,44(sp)
80007260:	02812403          	lw	s0,40(sp)
80007264:	02412483          	lw	s1,36(sp)
80007268:	02012903          	lw	s2,32(sp)
8000726c:	03010113          	addi	sp,sp,48
80007270:	00008067          	ret

80007274 <netif_add>:
80007274:	fe010113          	addi	sp,sp,-32
80007278:	00112e23          	sw	ra,28(sp)
8000727c:	00812c23          	sw	s0,24(sp)
80007280:	00912a23          	sw	s1,20(sp)
80007284:	02051063          	bnez	a0,800072a4 <netif_add+0x30>
80007288:	00000413          	li	s0,0
8000728c:	00040513          	mv	a0,s0
80007290:	01c12083          	lw	ra,28(sp)
80007294:	01812403          	lw	s0,24(sp)
80007298:	01412483          	lw	s1,20(sp)
8000729c:	02010113          	addi	sp,sp,32
800072a0:	00008067          	ret
800072a4:	fe0782e3          	beqz	a5,80007288 <netif_add+0x14>
800072a8:	00050413          	mv	s0,a0
800072ac:	00059463          	bnez	a1,800072b4 <netif_add+0x40>
800072b0:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
800072b4:	00061463          	bnez	a2,800072bc <netif_add+0x48>
800072b8:	84818613          	addi	a2,gp,-1976 # 800032b8 <ip_addr_any>
800072bc:	00069463          	bnez	a3,800072c4 <netif_add+0x50>
800072c0:	84818693          	addi	a3,gp,-1976 # 800032b8 <ip_addr_any>
800072c4:	02e42223          	sw	a4,36(s0)
800072c8:	8ec1c703          	lbu	a4,-1812(gp) # 8000335c <netif_num>
800072cc:	80007537          	lui	a0,0x80007
800072d0:	07050513          	addi	a0,a0,112 # 80007070 <_ram_heap_end+0xfffef070>
800072d4:	00a42a23          	sw	a0,20(s0)
800072d8:	00042223          	sw	zero,4(s0)
800072dc:	00040513          	mv	a0,s0
800072e0:	00042423          	sw	zero,8(s0)
800072e4:	00042623          	sw	zero,12(s0)
800072e8:	02041623          	sh	zero,44(s0)
800072ec:	02040aa3          	sb	zero,53(s0)
800072f0:	02040423          	sb	zero,40(s0)
800072f4:	020404a3          	sb	zero,41(s0)
800072f8:	02040523          	sb	zero,42(s0)
800072fc:	020405a3          	sb	zero,43(s0)
80007300:	00042e23          	sw	zero,28(s0)
80007304:	02042023          	sw	zero,32(s0)
80007308:	02e40c23          	sb	a4,56(s0)
8000730c:	01042823          	sw	a6,16(s0)
80007310:	02042e23          	sw	zero,60(s0)
80007314:	00f12623          	sw	a5,12(sp)
80007318:	eadff0ef          	jal	ra,800071c4 <netif_set_addr>
8000731c:	00c12783          	lw	a5,12(sp)
80007320:	00040513          	mv	a0,s0
80007324:	000780e7          	jalr	a5
80007328:	f60510e3          	bnez	a0,80007288 <netif_add+0x14>
8000732c:	8f41a603          	lw	a2,-1804(gp) # 80003364 <netif_list>
80007330:	00078713          	mv	a4,a5
80007334:	0ff00593          	li	a1,255
80007338:	03844783          	lbu	a5,56(s0)
8000733c:	00b79463          	bne	a5,a1,80007344 <netif_add+0xd0>
80007340:	02040c23          	sb	zero,56(s0)
80007344:	03844783          	lbu	a5,56(s0)
80007348:	00060693          	mv	a3,a2
8000734c:	02069463          	bnez	a3,80007374 <netif_add+0x100>
80007350:	0fe00593          	li	a1,254
80007354:	00000693          	li	a3,0
80007358:	00b78663          	beq	a5,a1,80007364 <netif_add+0xf0>
8000735c:	00178793          	addi	a5,a5,1
80007360:	0ff7f693          	andi	a3,a5,255
80007364:	00c42023          	sw	a2,0(s0)
80007368:	8ed18623          	sb	a3,-1812(gp) # 8000335c <netif_num>
8000736c:	8e81aa23          	sw	s0,-1804(gp) # 80003364 <netif_list>
80007370:	f1dff06f          	j	8000728c <netif_add+0x18>
80007374:	0386c503          	lbu	a0,56(a3)
80007378:	00f51863          	bne	a0,a5,80007388 <netif_add+0x114>
8000737c:	00178793          	addi	a5,a5,1
80007380:	02f40c23          	sb	a5,56(s0)
80007384:	fb5ff06f          	j	80007338 <netif_add+0xc4>
80007388:	0006a683          	lw	a3,0(a3)
8000738c:	fc1ff06f          	j	8000734c <netif_add+0xd8>

80007390 <netif_add_noaddr>:
80007390:	00068813          	mv	a6,a3
80007394:	00060793          	mv	a5,a2
80007398:	00058713          	mv	a4,a1
8000739c:	00000693          	li	a3,0
800073a0:	00000613          	li	a2,0
800073a4:	00000593          	li	a1,0
800073a8:	ecdff06f          	j	80007274 <netif_add>

800073ac <netif_set_default>:
800073ac:	8ea1a823          	sw	a0,-1808(gp) # 80003360 <netif_default>
800073b0:	00008067          	ret

800073b4 <netif_set_up>:
800073b4:	04050e63          	beqz	a0,80007410 <netif_set_up+0x5c>
800073b8:	ff010113          	addi	sp,sp,-16
800073bc:	00812423          	sw	s0,8(sp)
800073c0:	00112623          	sw	ra,12(sp)
800073c4:	03554783          	lbu	a5,53(a0)
800073c8:	00050413          	mv	s0,a0
800073cc:	0017f713          	andi	a4,a5,1
800073d0:	02071863          	bnez	a4,80007400 <netif_set_up+0x4c>
800073d4:	0017e793          	ori	a5,a5,1
800073d8:	02f50aa3          	sb	a5,53(a0)
800073dc:	01c52783          	lw	a5,28(a0)
800073e0:	00078463          	beqz	a5,800073e8 <netif_set_up+0x34>
800073e4:	000780e7          	jalr	a5
800073e8:	00040513          	mv	a0,s0
800073ec:	00812403          	lw	s0,8(sp)
800073f0:	00c12083          	lw	ra,12(sp)
800073f4:	00300593          	li	a1,3
800073f8:	01010113          	addi	sp,sp,16
800073fc:	c7dff06f          	j	80007078 <netif_issue_reports>
80007400:	00c12083          	lw	ra,12(sp)
80007404:	00812403          	lw	s0,8(sp)
80007408:	01010113          	addi	sp,sp,16
8000740c:	00008067          	ret
80007410:	00008067          	ret

80007414 <netif_set_down>:
80007414:	06050063          	beqz	a0,80007474 <netif_set_down+0x60>
80007418:	ff010113          	addi	sp,sp,-16
8000741c:	00812423          	sw	s0,8(sp)
80007420:	00112623          	sw	ra,12(sp)
80007424:	03554783          	lbu	a5,53(a0)
80007428:	00050413          	mv	s0,a0
8000742c:	0017f713          	andi	a4,a5,1
80007430:	02070a63          	beqz	a4,80007464 <netif_set_down+0x50>
80007434:	ffe7f713          	andi	a4,a5,-2
80007438:	02e50aa3          	sb	a4,53(a0)
8000743c:	0087f793          	andi	a5,a5,8
80007440:	00078463          	beqz	a5,80007448 <netif_set_down+0x34>
80007444:	1cc040ef          	jal	ra,8000b610 <etharp_cleanup_netif>
80007448:	01c42303          	lw	t1,28(s0)
8000744c:	00030c63          	beqz	t1,80007464 <netif_set_down+0x50>
80007450:	00040513          	mv	a0,s0
80007454:	00812403          	lw	s0,8(sp)
80007458:	00c12083          	lw	ra,12(sp)
8000745c:	01010113          	addi	sp,sp,16
80007460:	00030067          	jr	t1
80007464:	00c12083          	lw	ra,12(sp)
80007468:	00812403          	lw	s0,8(sp)
8000746c:	01010113          	addi	sp,sp,16
80007470:	00008067          	ret
80007474:	00008067          	ret

80007478 <netif_remove>:
80007478:	08050e63          	beqz	a0,80007514 <netif_remove+0x9c>
8000747c:	ff010113          	addi	sp,sp,-16
80007480:	00812423          	sw	s0,8(sp)
80007484:	00112623          	sw	ra,12(sp)
80007488:	00912223          	sw	s1,4(sp)
8000748c:	00452783          	lw	a5,4(a0)
80007490:	00050413          	mv	s0,a0
80007494:	02078063          	beqz	a5,800074b4 <netif_remove+0x3c>
80007498:	00450493          	addi	s1,a0,4
8000749c:	00000593          	li	a1,0
800074a0:	00048513          	mv	a0,s1
800074a4:	0a8020ef          	jal	ra,8000954c <udp_netif_ip_addr_changed>
800074a8:	00000593          	li	a1,0
800074ac:	00048513          	mv	a0,s1
800074b0:	508010ef          	jal	ra,800089b8 <raw_netif_ip_addr_changed>
800074b4:	03544783          	lbu	a5,53(s0)
800074b8:	0017f793          	andi	a5,a5,1
800074bc:	00078663          	beqz	a5,800074c8 <netif_remove+0x50>
800074c0:	00040513          	mv	a0,s0
800074c4:	f51ff0ef          	jal	ra,80007414 <netif_set_down>
800074c8:	8f01a703          	lw	a4,-1808(gp) # 80003360 <netif_default>
800074cc:	00871463          	bne	a4,s0,800074d4 <netif_remove+0x5c>
800074d0:	8e01a823          	sw	zero,-1808(gp) # 80003360 <netif_default>
800074d4:	8f41a783          	lw	a5,-1804(gp) # 80003364 <netif_list>
800074d8:	02879263          	bne	a5,s0,800074fc <netif_remove+0x84>
800074dc:	00042783          	lw	a5,0(s0)
800074e0:	8ef1aa23          	sw	a5,-1804(gp) # 80003364 <netif_list>
800074e4:	00c12083          	lw	ra,12(sp)
800074e8:	00812403          	lw	s0,8(sp)
800074ec:	00412483          	lw	s1,4(sp)
800074f0:	01010113          	addi	sp,sp,16
800074f4:	00008067          	ret
800074f8:	00070793          	mv	a5,a4
800074fc:	fe0784e3          	beqz	a5,800074e4 <netif_remove+0x6c>
80007500:	0007a703          	lw	a4,0(a5)
80007504:	fe871ae3          	bne	a4,s0,800074f8 <netif_remove+0x80>
80007508:	00042703          	lw	a4,0(s0)
8000750c:	00e7a023          	sw	a4,0(a5)
80007510:	fd5ff06f          	j	800074e4 <netif_remove+0x6c>
80007514:	00008067          	ret

80007518 <netif_set_status_callback>:
80007518:	00050463          	beqz	a0,80007520 <netif_set_status_callback+0x8>
8000751c:	00b52e23          	sw	a1,28(a0)
80007520:	00008067          	ret

80007524 <netif_set_link_up>:
80007524:	06050263          	beqz	a0,80007588 <netif_set_link_up+0x64>
80007528:	ff010113          	addi	sp,sp,-16
8000752c:	00812423          	sw	s0,8(sp)
80007530:	00112623          	sw	ra,12(sp)
80007534:	03554783          	lbu	a5,53(a0)
80007538:	00050413          	mv	s0,a0
8000753c:	0047f713          	andi	a4,a5,4
80007540:	02071c63          	bnez	a4,80007578 <netif_set_link_up+0x54>
80007544:	0047e793          	ori	a5,a5,4
80007548:	02f50aa3          	sb	a5,53(a0)
8000754c:	3c8030ef          	jal	ra,8000a914 <dhcp_network_changed>
80007550:	00300593          	li	a1,3
80007554:	00040513          	mv	a0,s0
80007558:	b21ff0ef          	jal	ra,80007078 <netif_issue_reports>
8000755c:	02042303          	lw	t1,32(s0)
80007560:	00030c63          	beqz	t1,80007578 <netif_set_link_up+0x54>
80007564:	00040513          	mv	a0,s0
80007568:	00812403          	lw	s0,8(sp)
8000756c:	00c12083          	lw	ra,12(sp)
80007570:	01010113          	addi	sp,sp,16
80007574:	00030067          	jr	t1
80007578:	00c12083          	lw	ra,12(sp)
8000757c:	00812403          	lw	s0,8(sp)
80007580:	01010113          	addi	sp,sp,16
80007584:	00008067          	ret
80007588:	00008067          	ret

8000758c <netif_set_link_down>:
8000758c:	02050263          	beqz	a0,800075b0 <netif_set_link_down+0x24>
80007590:	03554703          	lbu	a4,53(a0)
80007594:	00477693          	andi	a3,a4,4
80007598:	00068c63          	beqz	a3,800075b0 <netif_set_link_down+0x24>
8000759c:	02052303          	lw	t1,32(a0)
800075a0:	ffb77713          	andi	a4,a4,-5
800075a4:	02e50aa3          	sb	a4,53(a0)
800075a8:	00030463          	beqz	t1,800075b0 <netif_set_link_down+0x24>
800075ac:	00030067          	jr	t1
800075b0:	00008067          	ret

800075b4 <netif_set_link_callback>:
800075b4:	00050463          	beqz	a0,800075bc <netif_set_link_callback+0x8>
800075b8:	02b52023          	sw	a1,32(a0)
800075bc:	00008067          	ret

800075c0 <netif_get_by_index>:
800075c0:	00000793          	li	a5,0
800075c4:	00050663          	beqz	a0,800075d0 <netif_get_by_index+0x10>
800075c8:	8f41a783          	lw	a5,-1804(gp) # 80003364 <netif_list>
800075cc:	00079663          	bnez	a5,800075d8 <netif_get_by_index+0x18>
800075d0:	00078513          	mv	a0,a5
800075d4:	00008067          	ret
800075d8:	0387c703          	lbu	a4,56(a5)
800075dc:	00170713          	addi	a4,a4,1
800075e0:	0ff77713          	andi	a4,a4,255
800075e4:	fea706e3          	beq	a4,a0,800075d0 <netif_get_by_index+0x10>
800075e8:	0007a783          	lw	a5,0(a5)
800075ec:	fe1ff06f          	j	800075cc <netif_get_by_index+0xc>

800075f0 <netif_index_to_name>:
800075f0:	ff010113          	addi	sp,sp,-16
800075f4:	00812423          	sw	s0,8(sp)
800075f8:	00912223          	sw	s1,4(sp)
800075fc:	00112623          	sw	ra,12(sp)
80007600:	00050493          	mv	s1,a0
80007604:	00058413          	mv	s0,a1
80007608:	fb9ff0ef          	jal	ra,800075c0 <netif_get_by_index>
8000760c:	02050463          	beqz	a0,80007634 <netif_index_to_name+0x44>
80007610:	03654783          	lbu	a5,54(a0)
80007614:	fff48613          	addi	a2,s1,-1
80007618:	00400593          	li	a1,4
8000761c:	00f40023          	sb	a5,0(s0)
80007620:	03754783          	lbu	a5,55(a0)
80007624:	00240513          	addi	a0,s0,2
80007628:	00f400a3          	sb	a5,1(s0)
8000762c:	a20ff0ef          	jal	ra,8000684c <lwip_itoa>
80007630:	00040513          	mv	a0,s0
80007634:	00c12083          	lw	ra,12(sp)
80007638:	00812403          	lw	s0,8(sp)
8000763c:	00412483          	lw	s1,4(sp)
80007640:	01010113          	addi	sp,sp,16
80007644:	00008067          	ret

80007648 <netif_find>:
80007648:	00051663          	bnez	a0,80007654 <netif_find+0xc>
8000764c:	00000513          	li	a0,0
80007650:	00008067          	ret
80007654:	ff010113          	addi	sp,sp,-16
80007658:	00812423          	sw	s0,8(sp)
8000765c:	00050413          	mv	s0,a0
80007660:	00250513          	addi	a0,a0,2
80007664:	00112623          	sw	ra,12(sp)
80007668:	42d060ef          	jal	ra,8000e294 <atoi>
8000766c:	0ff57793          	andi	a5,a0,255
80007670:	8f41a503          	lw	a0,-1804(gp) # 80003364 <netif_list>
80007674:	00051c63          	bnez	a0,8000768c <netif_find+0x44>
80007678:	00000513          	li	a0,0
8000767c:	00c12083          	lw	ra,12(sp)
80007680:	00812403          	lw	s0,8(sp)
80007684:	01010113          	addi	sp,sp,16
80007688:	00008067          	ret
8000768c:	03854703          	lbu	a4,56(a0)
80007690:	00f71e63          	bne	a4,a5,800076ac <netif_find+0x64>
80007694:	00044683          	lbu	a3,0(s0)
80007698:	03654703          	lbu	a4,54(a0)
8000769c:	00e69863          	bne	a3,a4,800076ac <netif_find+0x64>
800076a0:	00144683          	lbu	a3,1(s0)
800076a4:	03754703          	lbu	a4,55(a0)
800076a8:	fce68ae3          	beq	a3,a4,8000767c <netif_find+0x34>
800076ac:	00052503          	lw	a0,0(a0)
800076b0:	fc5ff06f          	j	80007674 <netif_find+0x2c>

800076b4 <netif_name_to_index>:
800076b4:	ff010113          	addi	sp,sp,-16
800076b8:	00112623          	sw	ra,12(sp)
800076bc:	f8dff0ef          	jal	ra,80007648 <netif_find>
800076c0:	00050e63          	beqz	a0,800076dc <netif_name_to_index+0x28>
800076c4:	03854503          	lbu	a0,56(a0)
800076c8:	00150513          	addi	a0,a0,1
800076cc:	0ff57513          	andi	a0,a0,255
800076d0:	00c12083          	lw	ra,12(sp)
800076d4:	01010113          	addi	sp,sp,16
800076d8:	00008067          	ret
800076dc:	00000513          	li	a0,0
800076e0:	ff1ff06f          	j	800076d0 <netif_name_to_index+0x1c>

800076e4 <pbuf_skip_const>:
800076e4:	00050663          	beqz	a0,800076f0 <pbuf_skip_const+0xc>
800076e8:	00a55783          	lhu	a5,10(a0)
800076ec:	00f5f863          	bgeu	a1,a5,800076fc <pbuf_skip_const+0x18>
800076f0:	00060463          	beqz	a2,800076f8 <pbuf_skip_const+0x14>
800076f4:	00b61023          	sh	a1,0(a2)
800076f8:	00008067          	ret
800076fc:	40f585b3          	sub	a1,a1,a5
80007700:	01059593          	slli	a1,a1,0x10
80007704:	0105d593          	srli	a1,a1,0x10
80007708:	00052503          	lw	a0,0(a0)
8000770c:	fd9ff06f          	j	800076e4 <pbuf_skip_const>

80007710 <pbuf_add_header_impl>:
80007710:	00050793          	mv	a5,a0
80007714:	08050263          	beqz	a0,80007798 <pbuf_add_header_impl+0x88>
80007718:	00010737          	lui	a4,0x10
8000771c:	00100513          	li	a0,1
80007720:	06e5fe63          	bgeu	a1,a4,8000779c <pbuf_add_header_impl+0x8c>
80007724:	00000513          	li	a0,0
80007728:	06058a63          	beqz	a1,8000779c <pbuf_add_header_impl+0x8c>
8000772c:	0087d703          	lhu	a4,8(a5)
80007730:	01059693          	slli	a3,a1,0x10
80007734:	0106d693          	srli	a3,a3,0x10
80007738:	00e68733          	add	a4,a3,a4
8000773c:	01071713          	slli	a4,a4,0x10
80007740:	01075713          	srli	a4,a4,0x10
80007744:	00100513          	li	a0,1
80007748:	04d76a63          	bltu	a4,a3,8000779c <pbuf_add_header_impl+0x8c>
8000774c:	00c78503          	lb	a0,12(a5)
80007750:	00055e63          	bgez	a0,8000776c <pbuf_add_header_impl+0x5c>
80007754:	0047a603          	lw	a2,4(a5)
80007758:	00100513          	li	a0,1
8000775c:	40b605b3          	sub	a1,a2,a1
80007760:	01078613          	addi	a2,a5,16
80007764:	00c5fc63          	bgeu	a1,a2,8000777c <pbuf_add_header_impl+0x6c>
80007768:	00008067          	ret
8000776c:	00100513          	li	a0,1
80007770:	02060663          	beqz	a2,8000779c <pbuf_add_header_impl+0x8c>
80007774:	0047a603          	lw	a2,4(a5)
80007778:	40b605b3          	sub	a1,a2,a1
8000777c:	00a7d603          	lhu	a2,10(a5)
80007780:	00b7a223          	sw	a1,4(a5)
80007784:	00e79423          	sh	a4,8(a5)
80007788:	00c686b3          	add	a3,a3,a2
8000778c:	00d79523          	sh	a3,10(a5)
80007790:	00000513          	li	a0,0
80007794:	00008067          	ret
80007798:	00100513          	li	a0,1
8000779c:	00008067          	ret

800077a0 <pbuf_alloc_reference>:
800077a0:	ff010113          	addi	sp,sp,-16
800077a4:	00812423          	sw	s0,8(sp)
800077a8:	00058413          	mv	s0,a1
800077ac:	800035b7          	lui	a1,0x80003
800077b0:	00912223          	sw	s1,4(sp)
800077b4:	01212023          	sw	s2,0(sp)
800077b8:	00060493          	mv	s1,a2
800077bc:	00050913          	mv	s2,a0
800077c0:	14c00613          	li	a2,332
800077c4:	eac58593          	addi	a1,a1,-340 # 80002eac <_ram_heap_end+0xfffeaeac>
800077c8:	00400513          	li	a0,4
800077cc:	00112623          	sw	ra,12(sp)
800077d0:	841ff0ef          	jal	ra,80007010 <memp_malloc_fn>
800077d4:	02050263          	beqz	a0,800077f8 <pbuf_alloc_reference+0x58>
800077d8:	00100793          	li	a5,1
800077dc:	00052023          	sw	zero,0(a0)
800077e0:	01252223          	sw	s2,4(a0)
800077e4:	00851423          	sh	s0,8(a0)
800077e8:	00851523          	sh	s0,10(a0)
800077ec:	00950623          	sb	s1,12(a0)
800077f0:	000506a3          	sb	zero,13(a0)
800077f4:	00f51723          	sh	a5,14(a0)
800077f8:	00c12083          	lw	ra,12(sp)
800077fc:	00812403          	lw	s0,8(sp)
80007800:	00412483          	lw	s1,4(sp)
80007804:	00012903          	lw	s2,0(sp)
80007808:	01010113          	addi	sp,sp,16
8000780c:	00008067          	ret

80007810 <pbuf_alloced_custom>:
80007810:	01051513          	slli	a0,a0,0x10
80007814:	01055513          	srli	a0,a0,0x10
80007818:	00350513          	addi	a0,a0,3
8000781c:	ffc57513          	andi	a0,a0,-4
80007820:	00a58833          	add	a6,a1,a0
80007824:	0307ec63          	bltu	a5,a6,8000785c <pbuf_alloced_custom+0x4c>
80007828:	00070463          	beqz	a4,80007830 <pbuf_alloced_custom+0x20>
8000782c:	00a70733          	add	a4,a4,a0
80007830:	00200793          	li	a5,2
80007834:	00f686a3          	sb	a5,13(a3)
80007838:	00100793          	li	a5,1
8000783c:	00068513          	mv	a0,a3
80007840:	0006a023          	sw	zero,0(a3)
80007844:	00e6a223          	sw	a4,4(a3)
80007848:	00b69423          	sh	a1,8(a3)
8000784c:	00b69523          	sh	a1,10(a3)
80007850:	00c68623          	sb	a2,12(a3)
80007854:	00f69723          	sh	a5,14(a3)
80007858:	00008067          	ret
8000785c:	00000513          	li	a0,0
80007860:	00008067          	ret

80007864 <pbuf_add_header>:
80007864:	00000613          	li	a2,0
80007868:	ea9ff06f          	j	80007710 <pbuf_add_header_impl>

8000786c <pbuf_add_header_force>:
8000786c:	00100613          	li	a2,1
80007870:	ea1ff06f          	j	80007710 <pbuf_add_header_impl>

80007874 <pbuf_remove_header>:
80007874:	00050793          	mv	a5,a0
80007878:	04050a63          	beqz	a0,800078cc <pbuf_remove_header+0x58>
8000787c:	00010737          	lui	a4,0x10
80007880:	00100513          	li	a0,1
80007884:	04e5f663          	bgeu	a1,a4,800078d0 <pbuf_remove_header+0x5c>
80007888:	00000513          	li	a0,0
8000788c:	04058263          	beqz	a1,800078d0 <pbuf_remove_header+0x5c>
80007890:	00a7d703          	lhu	a4,10(a5)
80007894:	01059693          	slli	a3,a1,0x10
80007898:	0106d693          	srli	a3,a3,0x10
8000789c:	00100513          	li	a0,1
800078a0:	02d76863          	bltu	a4,a3,800078d0 <pbuf_remove_header+0x5c>
800078a4:	40d70733          	sub	a4,a4,a3
800078a8:	0047a603          	lw	a2,4(a5)
800078ac:	00e79523          	sh	a4,10(a5)
800078b0:	0087d703          	lhu	a4,8(a5)
800078b4:	00b605b3          	add	a1,a2,a1
800078b8:	00b7a223          	sw	a1,4(a5)
800078bc:	40d70733          	sub	a4,a4,a3
800078c0:	00e79423          	sh	a4,8(a5)
800078c4:	00000513          	li	a0,0
800078c8:	00008067          	ret
800078cc:	00100513          	li	a0,1
800078d0:	00008067          	ret

800078d4 <pbuf_header>:
800078d4:	0005d663          	bgez	a1,800078e0 <pbuf_header+0xc>
800078d8:	40b005b3          	neg	a1,a1
800078dc:	f99ff06f          	j	80007874 <pbuf_remove_header>
800078e0:	00000613          	li	a2,0
800078e4:	e2dff06f          	j	80007710 <pbuf_add_header_impl>

800078e8 <pbuf_header_force>:
800078e8:	0005d663          	bgez	a1,800078f4 <pbuf_header_force+0xc>
800078ec:	40b005b3          	neg	a1,a1
800078f0:	f85ff06f          	j	80007874 <pbuf_remove_header>
800078f4:	00100613          	li	a2,1
800078f8:	e19ff06f          	j	80007710 <pbuf_add_header_impl>

800078fc <pbuf_free>:
800078fc:	fd010113          	addi	sp,sp,-48
80007900:	02812423          	sw	s0,40(sp)
80007904:	02112623          	sw	ra,44(sp)
80007908:	02912223          	sw	s1,36(sp)
8000790c:	03212023          	sw	s2,32(sp)
80007910:	01312e23          	sw	s3,28(sp)
80007914:	00000413          	li	s0,0
80007918:	06050463          	beqz	a0,80007980 <pbuf_free+0x84>
8000791c:	00050593          	mv	a1,a0
80007920:	00000413          	li	s0,0
80007924:	00200913          	li	s2,2
80007928:	00100993          	li	s3,1
8000792c:	00b12623          	sw	a1,12(sp)
80007930:	959fd0ef          	jal	ra,80005288 <sys_arch_protect>
80007934:	00c12583          	lw	a1,12(sp)
80007938:	00e5c483          	lbu	s1,14(a1)
8000793c:	fff48493          	addi	s1,s1,-1
80007940:	0ff4f493          	andi	s1,s1,255
80007944:	00958723          	sb	s1,14(a1)
80007948:	945fd0ef          	jal	ra,8000528c <sys_arch_unprotect>
8000794c:	02049a63          	bnez	s1,80007980 <pbuf_free+0x84>
80007950:	00c12583          	lw	a1,12(sp)
80007954:	00d5c783          	lbu	a5,13(a1)
80007958:	0005a483          	lw	s1,0(a1)
8000795c:	0027f793          	andi	a5,a5,2
80007960:	04078063          	beqz	a5,800079a0 <pbuf_free+0xa4>
80007964:	0105a783          	lw	a5,16(a1)
80007968:	00058513          	mv	a0,a1
8000796c:	000780e7          	jalr	a5
80007970:	00140413          	addi	s0,s0,1
80007974:	0ff47413          	andi	s0,s0,255
80007978:	00048593          	mv	a1,s1
8000797c:	fa0498e3          	bnez	s1,8000792c <pbuf_free+0x30>
80007980:	00040513          	mv	a0,s0
80007984:	02c12083          	lw	ra,44(sp)
80007988:	02812403          	lw	s0,40(sp)
8000798c:	02412483          	lw	s1,36(sp)
80007990:	02012903          	lw	s2,32(sp)
80007994:	01c12983          	lw	s3,28(sp)
80007998:	03010113          	addi	sp,sp,48
8000799c:	00008067          	ret
800079a0:	00c5c783          	lbu	a5,12(a1)
800079a4:	00500513          	li	a0,5
800079a8:	00f7f793          	andi	a5,a5,15
800079ac:	01278663          	beq	a5,s2,800079b8 <pbuf_free+0xbc>
800079b0:	01379863          	bne	a5,s3,800079c0 <pbuf_free+0xc4>
800079b4:	00400513          	li	a0,4
800079b8:	e90ff0ef          	jal	ra,80007048 <memp_free>
800079bc:	fb5ff06f          	j	80007970 <pbuf_free+0x74>
800079c0:	fa0798e3          	bnez	a5,80007970 <pbuf_free+0x74>
800079c4:	00058513          	mv	a0,a1
800079c8:	d44ff0ef          	jal	ra,80006f0c <lwip_free>
800079cc:	fa5ff06f          	j	80007970 <pbuf_free+0x74>

800079d0 <pbuf_alloc>:
800079d0:	fe010113          	addi	sp,sp,-32
800079d4:	01212823          	sw	s2,16(sp)
800079d8:	00112e23          	sw	ra,28(sp)
800079dc:	00812c23          	sw	s0,24(sp)
800079e0:	00912a23          	sw	s1,20(sp)
800079e4:	01312623          	sw	s3,12(sp)
800079e8:	01412423          	sw	s4,8(sp)
800079ec:	01512223          	sw	s5,4(sp)
800079f0:	01612023          	sw	s6,0(sp)
800079f4:	04100793          	li	a5,65
800079f8:	00058913          	mv	s2,a1
800079fc:	0cf60263          	beq	a2,a5,80007ac0 <pbuf_alloc+0xf0>
80007a00:	02c7ee63          	bltu	a5,a2,80007a3c <pbuf_alloc+0x6c>
80007a04:	00100793          	li	a5,1
80007a08:	0af60c63          	beq	a2,a5,80007ac0 <pbuf_alloc+0xf0>
80007a0c:	00000493          	li	s1,0
80007a10:	01c12083          	lw	ra,28(sp)
80007a14:	01812403          	lw	s0,24(sp)
80007a18:	00048513          	mv	a0,s1
80007a1c:	01012903          	lw	s2,16(sp)
80007a20:	01412483          	lw	s1,20(sp)
80007a24:	00c12983          	lw	s3,12(sp)
80007a28:	00812a03          	lw	s4,8(sp)
80007a2c:	00412a83          	lw	s5,4(sp)
80007a30:	00012b03          	lw	s6,0(sp)
80007a34:	02010113          	addi	sp,sp,32
80007a38:	00008067          	ret
80007a3c:	01051413          	slli	s0,a0,0x10
80007a40:	18200793          	li	a5,386
80007a44:	01045413          	srli	s0,s0,0x10
80007a48:	0af60463          	beq	a2,a5,80007af0 <pbuf_alloc+0x120>
80007a4c:	28000793          	li	a5,640
80007a50:	faf61ee3          	bne	a2,a5,80007a0c <pbuf_alloc+0x3c>
80007a54:	00340413          	addi	s0,s0,3
80007a58:	00358793          	addi	a5,a1,3
80007a5c:	ffc47413          	andi	s0,s0,-4
80007a60:	ffc7f793          	andi	a5,a5,-4
80007a64:	00f40433          	add	s0,s0,a5
80007a68:	01041413          	slli	s0,s0,0x10
80007a6c:	01045413          	srli	s0,s0,0x10
80007a70:	00050993          	mv	s3,a0
80007a74:	01040513          	addi	a0,s0,16
80007a78:	f8f46ae3          	bltu	s0,a5,80007a0c <pbuf_alloc+0x3c>
80007a7c:	f8f568e3          	bltu	a0,a5,80007a0c <pbuf_alloc+0x3c>
80007a80:	c58ff0ef          	jal	ra,80006ed8 <lwip_malloc>
80007a84:	00050493          	mv	s1,a0
80007a88:	f80504e3          	beqz	a0,80007a10 <pbuf_alloc+0x40>
80007a8c:	01099993          	slli	s3,s3,0x10
80007a90:	0109d993          	srli	s3,s3,0x10
80007a94:	013509b3          	add	s3,a0,s3
80007a98:	01398993          	addi	s3,s3,19
80007a9c:	000107b7          	lui	a5,0x10
80007aa0:	ffc9f993          	andi	s3,s3,-4
80007aa4:	08078793          	addi	a5,a5,128 # 10080 <_stack_size+0xf080>
80007aa8:	00052023          	sw	zero,0(a0)
80007aac:	01352223          	sw	s3,4(a0)
80007ab0:	01251423          	sh	s2,8(a0)
80007ab4:	01251523          	sh	s2,10(a0)
80007ab8:	00f52623          	sw	a5,12(a0)
80007abc:	f55ff06f          	j	80007a10 <pbuf_alloc+0x40>
80007ac0:	01812403          	lw	s0,24(sp)
80007ac4:	01c12083          	lw	ra,28(sp)
80007ac8:	01412483          	lw	s1,20(sp)
80007acc:	00c12983          	lw	s3,12(sp)
80007ad0:	00812a03          	lw	s4,8(sp)
80007ad4:	00412a83          	lw	s5,4(sp)
80007ad8:	00012b03          	lw	s6,0(sp)
80007adc:	00090593          	mv	a1,s2
80007ae0:	01012903          	lw	s2,16(sp)
80007ae4:	00000513          	li	a0,0
80007ae8:	02010113          	addi	sp,sp,32
80007aec:	cb5ff06f          	j	800077a0 <pbuf_alloc_reference>
80007af0:	000109b7          	lui	s3,0x10
80007af4:	00000a13          	li	s4,0
80007af8:	00000493          	li	s1,0
80007afc:	80003ab7          	lui	s5,0x80003
80007b00:	5ec00b13          	li	s6,1516
80007b04:	08298993          	addi	s3,s3,130 # 10082 <_stack_size+0xf082>
80007b08:	0f300613          	li	a2,243
80007b0c:	eaca8593          	addi	a1,s5,-340 # 80002eac <_ram_heap_end+0xfffeaeac>
80007b10:	00500513          	li	a0,5
80007b14:	cfcff0ef          	jal	ra,80007010 <memp_malloc_fn>
80007b18:	00051a63          	bnez	a0,80007b2c <pbuf_alloc+0x15c>
80007b1c:	ee0488e3          	beqz	s1,80007a0c <pbuf_alloc+0x3c>
80007b20:	00048513          	mv	a0,s1
80007b24:	dd9ff0ef          	jal	ra,800078fc <pbuf_free>
80007b28:	ee5ff06f          	j	80007a0c <pbuf_alloc+0x3c>
80007b2c:	00340793          	addi	a5,s0,3
80007b30:	ffc7f793          	andi	a5,a5,-4
80007b34:	40fb07b3          	sub	a5,s6,a5
80007b38:	00078713          	mv	a4,a5
80007b3c:	01079793          	slli	a5,a5,0x10
80007b40:	0107d793          	srli	a5,a5,0x10
80007b44:	00f97463          	bgeu	s2,a5,80007b4c <pbuf_alloc+0x17c>
80007b48:	00090713          	mv	a4,s2
80007b4c:	00850433          	add	s0,a0,s0
80007b50:	01340413          	addi	s0,s0,19
80007b54:	ffc47413          	andi	s0,s0,-4
80007b58:	01071793          	slli	a5,a4,0x10
80007b5c:	00052023          	sw	zero,0(a0)
80007b60:	00852223          	sw	s0,4(a0)
80007b64:	01251423          	sh	s2,8(a0)
80007b68:	00e51523          	sh	a4,10(a0)
80007b6c:	01352623          	sw	s3,12(a0)
80007b70:	0107d793          	srli	a5,a5,0x10
80007b74:	02048263          	beqz	s1,80007b98 <pbuf_alloc+0x1c8>
80007b78:	00aa2023          	sw	a0,0(s4)
80007b7c:	40f90933          	sub	s2,s2,a5
80007b80:	01091913          	slli	s2,s2,0x10
80007b84:	01095913          	srli	s2,s2,0x10
80007b88:	00000413          	li	s0,0
80007b8c:	00050a13          	mv	s4,a0
80007b90:	f6091ce3          	bnez	s2,80007b08 <pbuf_alloc+0x138>
80007b94:	e7dff06f          	j	80007a10 <pbuf_alloc+0x40>
80007b98:	00050493          	mv	s1,a0
80007b9c:	fe1ff06f          	j	80007b7c <pbuf_alloc+0x1ac>

80007ba0 <pbuf_realloc>:
80007ba0:	00855783          	lhu	a5,8(a0)
80007ba4:	0af5f463          	bgeu	a1,a5,80007c4c <pbuf_realloc+0xac>
80007ba8:	ff010113          	addi	sp,sp,-16
80007bac:	00812423          	sw	s0,8(sp)
80007bb0:	00912223          	sw	s1,4(sp)
80007bb4:	00112623          	sw	ra,12(sp)
80007bb8:	00050413          	mv	s0,a0
80007bbc:	00058493          	mv	s1,a1
80007bc0:	40f587b3          	sub	a5,a1,a5
80007bc4:	00a45583          	lhu	a1,10(s0)
80007bc8:	0695e263          	bltu	a1,s1,80007c2c <pbuf_realloc+0x8c>
80007bcc:	00c44783          	lbu	a5,12(s0)
80007bd0:	00f7f793          	andi	a5,a5,15
80007bd4:	02079663          	bnez	a5,80007c00 <pbuf_realloc+0x60>
80007bd8:	02958463          	beq	a1,s1,80007c00 <pbuf_realloc+0x60>
80007bdc:	00d44783          	lbu	a5,13(s0)
80007be0:	0027f793          	andi	a5,a5,2
80007be4:	00079e63          	bnez	a5,80007c00 <pbuf_realloc+0x60>
80007be8:	00442583          	lw	a1,4(s0)
80007bec:	00040513          	mv	a0,s0
80007bf0:	408585b3          	sub	a1,a1,s0
80007bf4:	009585b3          	add	a1,a1,s1
80007bf8:	adcff0ef          	jal	ra,80006ed4 <mem_trim>
80007bfc:	00050413          	mv	s0,a0
80007c00:	00042503          	lw	a0,0(s0)
80007c04:	00941523          	sh	s1,10(s0)
80007c08:	00941423          	sh	s1,8(s0)
80007c0c:	00050463          	beqz	a0,80007c14 <pbuf_realloc+0x74>
80007c10:	cedff0ef          	jal	ra,800078fc <pbuf_free>
80007c14:	00042023          	sw	zero,0(s0)
80007c18:	00c12083          	lw	ra,12(sp)
80007c1c:	00812403          	lw	s0,8(sp)
80007c20:	00412483          	lw	s1,4(sp)
80007c24:	01010113          	addi	sp,sp,16
80007c28:	00008067          	ret
80007c2c:	00845703          	lhu	a4,8(s0)
80007c30:	40b484b3          	sub	s1,s1,a1
80007c34:	01049493          	slli	s1,s1,0x10
80007c38:	00e78733          	add	a4,a5,a4
80007c3c:	00e41423          	sh	a4,8(s0)
80007c40:	0104d493          	srli	s1,s1,0x10
80007c44:	00042403          	lw	s0,0(s0)
80007c48:	f7dff06f          	j	80007bc4 <pbuf_realloc+0x24>
80007c4c:	00008067          	ret

80007c50 <pbuf_free_header>:
80007c50:	fe010113          	addi	sp,sp,-32
80007c54:	00812c23          	sw	s0,24(sp)
80007c58:	00112e23          	sw	ra,28(sp)
80007c5c:	00912a23          	sw	s1,20(sp)
80007c60:	00050413          	mv	s0,a0
80007c64:	04058263          	beqz	a1,80007ca8 <pbuf_free_header+0x58>
80007c68:	04040063          	beqz	s0,80007ca8 <pbuf_free_header+0x58>
80007c6c:	00a45783          	lhu	a5,10(s0)
80007c70:	02f5e863          	bltu	a1,a5,80007ca0 <pbuf_free_header+0x50>
80007c74:	40f585b3          	sub	a1,a1,a5
80007c78:	00042483          	lw	s1,0(s0)
80007c7c:	01059593          	slli	a1,a1,0x10
80007c80:	0105d593          	srli	a1,a1,0x10
80007c84:	00042023          	sw	zero,0(s0)
80007c88:	00040513          	mv	a0,s0
80007c8c:	00b12623          	sw	a1,12(sp)
80007c90:	c6dff0ef          	jal	ra,800078fc <pbuf_free>
80007c94:	00048413          	mv	s0,s1
80007c98:	00c12583          	lw	a1,12(sp)
80007c9c:	fc9ff06f          	j	80007c64 <pbuf_free_header+0x14>
80007ca0:	00040513          	mv	a0,s0
80007ca4:	bd1ff0ef          	jal	ra,80007874 <pbuf_remove_header>
80007ca8:	00040513          	mv	a0,s0
80007cac:	01c12083          	lw	ra,28(sp)
80007cb0:	01812403          	lw	s0,24(sp)
80007cb4:	01412483          	lw	s1,20(sp)
80007cb8:	02010113          	addi	sp,sp,32
80007cbc:	00008067          	ret

80007cc0 <pbuf_clen>:
80007cc0:	00000793          	li	a5,0
80007cc4:	00051663          	bnez	a0,80007cd0 <pbuf_clen+0x10>
80007cc8:	00078513          	mv	a0,a5
80007ccc:	00008067          	ret
80007cd0:	00178793          	addi	a5,a5,1
80007cd4:	01079793          	slli	a5,a5,0x10
80007cd8:	0107d793          	srli	a5,a5,0x10
80007cdc:	00052503          	lw	a0,0(a0)
80007ce0:	fe5ff06f          	j	80007cc4 <pbuf_clen+0x4>

80007ce4 <pbuf_ref>:
80007ce4:	02050a63          	beqz	a0,80007d18 <pbuf_ref+0x34>
80007ce8:	ff010113          	addi	sp,sp,-16
80007cec:	00812423          	sw	s0,8(sp)
80007cf0:	00112623          	sw	ra,12(sp)
80007cf4:	00050413          	mv	s0,a0
80007cf8:	d90fd0ef          	jal	ra,80005288 <sys_arch_protect>
80007cfc:	00e44783          	lbu	a5,14(s0)
80007d00:	00178793          	addi	a5,a5,1
80007d04:	00f40723          	sb	a5,14(s0)
80007d08:	00812403          	lw	s0,8(sp)
80007d0c:	00c12083          	lw	ra,12(sp)
80007d10:	01010113          	addi	sp,sp,16
80007d14:	d78fd06f          	j	8000528c <sys_arch_unprotect>
80007d18:	00008067          	ret

80007d1c <pbuf_cat>:
80007d1c:	02050a63          	beqz	a0,80007d50 <pbuf_cat+0x34>
80007d20:	00059663          	bnez	a1,80007d2c <pbuf_cat+0x10>
80007d24:	00008067          	ret
80007d28:	00070513          	mv	a0,a4
80007d2c:	00855783          	lhu	a5,8(a0)
80007d30:	0085d683          	lhu	a3,8(a1)
80007d34:	00052703          	lw	a4,0(a0)
80007d38:	00d787b3          	add	a5,a5,a3
80007d3c:	01079793          	slli	a5,a5,0x10
80007d40:	0107d793          	srli	a5,a5,0x10
80007d44:	00f51423          	sh	a5,8(a0)
80007d48:	fe0710e3          	bnez	a4,80007d28 <pbuf_cat+0xc>
80007d4c:	00b52023          	sw	a1,0(a0)
80007d50:	00008067          	ret

80007d54 <pbuf_chain>:
80007d54:	ff010113          	addi	sp,sp,-16
80007d58:	00812423          	sw	s0,8(sp)
80007d5c:	00112623          	sw	ra,12(sp)
80007d60:	00058413          	mv	s0,a1
80007d64:	fb9ff0ef          	jal	ra,80007d1c <pbuf_cat>
80007d68:	00040513          	mv	a0,s0
80007d6c:	00812403          	lw	s0,8(sp)
80007d70:	00c12083          	lw	ra,12(sp)
80007d74:	01010113          	addi	sp,sp,16
80007d78:	f6dff06f          	j	80007ce4 <pbuf_ref>

80007d7c <pbuf_dechain>:
80007d7c:	ff010113          	addi	sp,sp,-16
80007d80:	00112623          	sw	ra,12(sp)
80007d84:	00812423          	sw	s0,8(sp)
80007d88:	00052403          	lw	s0,0(a0)
80007d8c:	02040663          	beqz	s0,80007db8 <pbuf_dechain+0x3c>
80007d90:	00855783          	lhu	a5,8(a0)
80007d94:	00a55703          	lhu	a4,10(a0)
80007d98:	40e787b3          	sub	a5,a5,a4
80007d9c:	00f41423          	sh	a5,8(s0)
80007da0:	00a55783          	lhu	a5,10(a0)
80007da4:	00052023          	sw	zero,0(a0)
80007da8:	00f51423          	sh	a5,8(a0)
80007dac:	00040513          	mv	a0,s0
80007db0:	b4dff0ef          	jal	ra,800078fc <pbuf_free>
80007db4:	00050463          	beqz	a0,80007dbc <pbuf_dechain+0x40>
80007db8:	00000413          	li	s0,0
80007dbc:	00040513          	mv	a0,s0
80007dc0:	00c12083          	lw	ra,12(sp)
80007dc4:	00812403          	lw	s0,8(sp)
80007dc8:	01010113          	addi	sp,sp,16
80007dcc:	00008067          	ret

80007dd0 <pbuf_copy>:
80007dd0:	10050463          	beqz	a0,80007ed8 <pbuf_copy+0x108>
80007dd4:	fe010113          	addi	sp,sp,-32
80007dd8:	00812c23          	sw	s0,24(sp)
80007ddc:	00112e23          	sw	ra,28(sp)
80007de0:	00912a23          	sw	s1,20(sp)
80007de4:	01212823          	sw	s2,16(sp)
80007de8:	01312623          	sw	s3,12(sp)
80007dec:	01412423          	sw	s4,8(sp)
80007df0:	00058413          	mv	s0,a1
80007df4:	06058e63          	beqz	a1,80007e70 <pbuf_copy+0xa0>
80007df8:	00855703          	lhu	a4,8(a0)
80007dfc:	0085d783          	lhu	a5,8(a1)
80007e00:	00050493          	mv	s1,a0
80007e04:	06f76663          	bltu	a4,a5,80007e70 <pbuf_copy+0xa0>
80007e08:	00000a13          	li	s4,0
80007e0c:	00000993          	li	s3,0
80007e10:	00a4d903          	lhu	s2,10(s1)
80007e14:	00a45783          	lhu	a5,10(s0)
80007e18:	41390933          	sub	s2,s2,s3
80007e1c:	414787b3          	sub	a5,a5,s4
80007e20:	0127f463          	bgeu	a5,s2,80007e28 <pbuf_copy+0x58>
80007e24:	00078913          	mv	s2,a5
80007e28:	0044a503          	lw	a0,4(s1)
80007e2c:	00442583          	lw	a1,4(s0)
80007e30:	00090613          	mv	a2,s2
80007e34:	01350533          	add	a0,a0,s3
80007e38:	014585b3          	add	a1,a1,s4
80007e3c:	4d5060ef          	jal	ra,8000eb10 <memcpy>
80007e40:	00a45703          	lhu	a4,10(s0)
80007e44:	012a0a33          	add	s4,s4,s2
80007e48:	012989b3          	add	s3,s3,s2
80007e4c:	00a4d783          	lhu	a5,10(s1)
80007e50:	00ea6663          	bltu	s4,a4,80007e5c <pbuf_copy+0x8c>
80007e54:	00042403          	lw	s0,0(s0)
80007e58:	00000a13          	li	s4,0
80007e5c:	02f99e63          	bne	s3,a5,80007e98 <pbuf_copy+0xc8>
80007e60:	0004a483          	lw	s1,0(s1)
80007e64:	02049863          	bnez	s1,80007e94 <pbuf_copy+0xc4>
80007e68:	00000513          	li	a0,0
80007e6c:	00040463          	beqz	s0,80007e74 <pbuf_copy+0xa4>
80007e70:	ff000513          	li	a0,-16
80007e74:	01c12083          	lw	ra,28(sp)
80007e78:	01812403          	lw	s0,24(sp)
80007e7c:	01412483          	lw	s1,20(sp)
80007e80:	01012903          	lw	s2,16(sp)
80007e84:	00c12983          	lw	s3,12(sp)
80007e88:	00812a03          	lw	s4,8(sp)
80007e8c:	02010113          	addi	sp,sp,32
80007e90:	00008067          	ret
80007e94:	00000993          	li	s3,0
80007e98:	00040c63          	beqz	s0,80007eb0 <pbuf_copy+0xe0>
80007e9c:	00a45703          	lhu	a4,10(s0)
80007ea0:	00845783          	lhu	a5,8(s0)
80007ea4:	00f71663          	bne	a4,a5,80007eb0 <pbuf_copy+0xe0>
80007ea8:	00042783          	lw	a5,0(s0)
80007eac:	02079263          	bnez	a5,80007ed0 <pbuf_copy+0x100>
80007eb0:	00a4d703          	lhu	a4,10(s1)
80007eb4:	0084d783          	lhu	a5,8(s1)
80007eb8:	00f71663          	bne	a4,a5,80007ec4 <pbuf_copy+0xf4>
80007ebc:	0004a783          	lw	a5,0(s1)
80007ec0:	00079863          	bnez	a5,80007ed0 <pbuf_copy+0x100>
80007ec4:	f40416e3          	bnez	s0,80007e10 <pbuf_copy+0x40>
80007ec8:	00000513          	li	a0,0
80007ecc:	fa9ff06f          	j	80007e74 <pbuf_copy+0xa4>
80007ed0:	ffa00513          	li	a0,-6
80007ed4:	fa1ff06f          	j	80007e74 <pbuf_copy+0xa4>
80007ed8:	ff000513          	li	a0,-16
80007edc:	00008067          	ret

80007ee0 <pbuf_copy_partial>:
80007ee0:	fe010113          	addi	sp,sp,-32
80007ee4:	00812c23          	sw	s0,24(sp)
80007ee8:	00112e23          	sw	ra,28(sp)
80007eec:	00912a23          	sw	s1,20(sp)
80007ef0:	01212823          	sw	s2,16(sp)
80007ef4:	01312623          	sw	s3,12(sp)
80007ef8:	01412423          	sw	s4,8(sp)
80007efc:	00000413          	li	s0,0
80007f00:	02050063          	beqz	a0,80007f20 <pbuf_copy_partial+0x40>
80007f04:	00058a13          	mv	s4,a1
80007f08:	00000413          	li	s0,0
80007f0c:	00058a63          	beqz	a1,80007f20 <pbuf_copy_partial+0x40>
80007f10:	00050913          	mv	s2,a0
80007f14:	00060493          	mv	s1,a2
80007f18:	00048463          	beqz	s1,80007f20 <pbuf_copy_partial+0x40>
80007f1c:	02091463          	bnez	s2,80007f44 <pbuf_copy_partial+0x64>
80007f20:	00040513          	mv	a0,s0
80007f24:	01c12083          	lw	ra,28(sp)
80007f28:	01812403          	lw	s0,24(sp)
80007f2c:	01412483          	lw	s1,20(sp)
80007f30:	01012903          	lw	s2,16(sp)
80007f34:	00c12983          	lw	s3,12(sp)
80007f38:	00812a03          	lw	s4,8(sp)
80007f3c:	02010113          	addi	sp,sp,32
80007f40:	00008067          	ret
80007f44:	00a95583          	lhu	a1,10(s2)
80007f48:	00068e63          	beqz	a3,80007f64 <pbuf_copy_partial+0x84>
80007f4c:	00b6ec63          	bltu	a3,a1,80007f64 <pbuf_copy_partial+0x84>
80007f50:	40b686b3          	sub	a3,a3,a1
80007f54:	01069693          	slli	a3,a3,0x10
80007f58:	0106d693          	srli	a3,a3,0x10
80007f5c:	00092903          	lw	s2,0(s2)
80007f60:	fb9ff06f          	j	80007f18 <pbuf_copy_partial+0x38>
80007f64:	40d585b3          	sub	a1,a1,a3
80007f68:	01059593          	slli	a1,a1,0x10
80007f6c:	0105d593          	srli	a1,a1,0x10
80007f70:	00058993          	mv	s3,a1
80007f74:	00b4f463          	bgeu	s1,a1,80007f7c <pbuf_copy_partial+0x9c>
80007f78:	00048993          	mv	s3,s1
80007f7c:	00492583          	lw	a1,4(s2)
80007f80:	01099993          	slli	s3,s3,0x10
80007f84:	0109d993          	srli	s3,s3,0x10
80007f88:	00d585b3          	add	a1,a1,a3
80007f8c:	008a0533          	add	a0,s4,s0
80007f90:	00098613          	mv	a2,s3
80007f94:	01340433          	add	s0,s0,s3
80007f98:	413484b3          	sub	s1,s1,s3
80007f9c:	375060ef          	jal	ra,8000eb10 <memcpy>
80007fa0:	01041413          	slli	s0,s0,0x10
80007fa4:	01049493          	slli	s1,s1,0x10
80007fa8:	01045413          	srli	s0,s0,0x10
80007fac:	0104d493          	srli	s1,s1,0x10
80007fb0:	00000693          	li	a3,0
80007fb4:	fa9ff06f          	j	80007f5c <pbuf_copy_partial+0x7c>

80007fb8 <pbuf_get_contiguous>:
80007fb8:	fe010113          	addi	sp,sp,-32
80007fbc:	00112e23          	sw	ra,28(sp)
80007fc0:	00812c23          	sw	s0,24(sp)
80007fc4:	00912a23          	sw	s1,20(sp)
80007fc8:	02051063          	bnez	a0,80007fe8 <pbuf_get_contiguous+0x30>
80007fcc:	00000413          	li	s0,0
80007fd0:	00040513          	mv	a0,s0
80007fd4:	01c12083          	lw	ra,28(sp)
80007fd8:	01812403          	lw	s0,24(sp)
80007fdc:	01412483          	lw	s1,20(sp)
80007fe0:	02010113          	addi	sp,sp,32
80007fe4:	00008067          	ret
80007fe8:	00058413          	mv	s0,a1
80007fec:	fe0580e3          	beqz	a1,80007fcc <pbuf_get_contiguous+0x14>
80007ff0:	00068493          	mv	s1,a3
80007ff4:	fcd66ce3          	bltu	a2,a3,80007fcc <pbuf_get_contiguous+0x14>
80007ff8:	00e10613          	addi	a2,sp,14
80007ffc:	00070593          	mv	a1,a4
80008000:	ee4ff0ef          	jal	ra,800076e4 <pbuf_skip_const>
80008004:	fc0504e3          	beqz	a0,80007fcc <pbuf_get_contiguous+0x14>
80008008:	00e15683          	lhu	a3,14(sp)
8000800c:	00a55603          	lhu	a2,10(a0)
80008010:	00968733          	add	a4,a3,s1
80008014:	00e64863          	blt	a2,a4,80008024 <pbuf_get_contiguous+0x6c>
80008018:	00452403          	lw	s0,4(a0)
8000801c:	00d40433          	add	s0,s0,a3
80008020:	fb1ff06f          	j	80007fd0 <pbuf_get_contiguous+0x18>
80008024:	00048613          	mv	a2,s1
80008028:	00040593          	mv	a1,s0
8000802c:	eb5ff0ef          	jal	ra,80007ee0 <pbuf_copy_partial>
80008030:	fa9500e3          	beq	a0,s1,80007fd0 <pbuf_get_contiguous+0x18>
80008034:	f99ff06f          	j	80007fcc <pbuf_get_contiguous+0x14>

80008038 <pbuf_skip>:
80008038:	eacff06f          	j	800076e4 <pbuf_skip_const>

8000803c <pbuf_take>:
8000803c:	08050c63          	beqz	a0,800080d4 <pbuf_take+0x98>
80008040:	fe010113          	addi	sp,sp,-32
80008044:	00912a23          	sw	s1,20(sp)
80008048:	01412423          	sw	s4,8(sp)
8000804c:	00112e23          	sw	ra,28(sp)
80008050:	00812c23          	sw	s0,24(sp)
80008054:	01212823          	sw	s2,16(sp)
80008058:	01312623          	sw	s3,12(sp)
8000805c:	00050493          	mv	s1,a0
80008060:	00058a13          	mv	s4,a1
80008064:	ff000513          	li	a0,-16
80008068:	00058c63          	beqz	a1,80008080 <pbuf_take+0x44>
8000806c:	0084d783          	lhu	a5,8(s1)
80008070:	00060413          	mv	s0,a2
80008074:	fff00513          	li	a0,-1
80008078:	00000993          	li	s3,0
8000807c:	04c7f663          	bgeu	a5,a2,800080c8 <pbuf_take+0x8c>
80008080:	01c12083          	lw	ra,28(sp)
80008084:	01812403          	lw	s0,24(sp)
80008088:	01412483          	lw	s1,20(sp)
8000808c:	01012903          	lw	s2,16(sp)
80008090:	00c12983          	lw	s3,12(sp)
80008094:	00812a03          	lw	s4,8(sp)
80008098:	02010113          	addi	sp,sp,32
8000809c:	00008067          	ret
800080a0:	00a4d903          	lhu	s2,10(s1)
800080a4:	01247463          	bgeu	s0,s2,800080ac <pbuf_take+0x70>
800080a8:	00040913          	mv	s2,s0
800080ac:	0044a503          	lw	a0,4(s1)
800080b0:	013a05b3          	add	a1,s4,s3
800080b4:	00090613          	mv	a2,s2
800080b8:	259060ef          	jal	ra,8000eb10 <memcpy>
800080bc:	0004a483          	lw	s1,0(s1)
800080c0:	41240433          	sub	s0,s0,s2
800080c4:	012989b3          	add	s3,s3,s2
800080c8:	fc041ce3          	bnez	s0,800080a0 <pbuf_take+0x64>
800080cc:	00000513          	li	a0,0
800080d0:	fb1ff06f          	j	80008080 <pbuf_take+0x44>
800080d4:	ff000513          	li	a0,-16
800080d8:	00008067          	ret

800080dc <pbuf_take_at>:
800080dc:	fd010113          	addi	sp,sp,-48
800080e0:	02812423          	sw	s0,40(sp)
800080e4:	01312e23          	sw	s3,28(sp)
800080e8:	00060413          	mv	s0,a2
800080ec:	00058993          	mv	s3,a1
800080f0:	00e10613          	addi	a2,sp,14
800080f4:	00068593          	mv	a1,a3
800080f8:	02112623          	sw	ra,44(sp)
800080fc:	02912223          	sw	s1,36(sp)
80008100:	03212023          	sw	s2,32(sp)
80008104:	de0ff0ef          	jal	ra,800076e4 <pbuf_skip_const>
80008108:	08050263          	beqz	a0,8000818c <pbuf_take_at+0xb0>
8000810c:	00e15703          	lhu	a4,14(sp)
80008110:	00855683          	lhu	a3,8(a0)
80008114:	00050493          	mv	s1,a0
80008118:	008707b3          	add	a5,a4,s0
8000811c:	fff00513          	li	a0,-1
80008120:	04f6c863          	blt	a3,a5,80008170 <pbuf_take_at+0x94>
80008124:	00a4d783          	lhu	a5,10(s1)
80008128:	00040913          	mv	s2,s0
8000812c:	40e787b3          	sub	a5,a5,a4
80008130:	0087d663          	bge	a5,s0,8000813c <pbuf_take_at+0x60>
80008134:	01079913          	slli	s2,a5,0x10
80008138:	01095913          	srli	s2,s2,0x10
8000813c:	0044a503          	lw	a0,4(s1)
80008140:	00090613          	mv	a2,s2
80008144:	00098593          	mv	a1,s3
80008148:	00e50533          	add	a0,a0,a4
8000814c:	1c5060ef          	jal	ra,8000eb10 <memcpy>
80008150:	41240633          	sub	a2,s0,s2
80008154:	01061613          	slli	a2,a2,0x10
80008158:	01065613          	srli	a2,a2,0x10
8000815c:	00000513          	li	a0,0
80008160:	00060863          	beqz	a2,80008170 <pbuf_take_at+0x94>
80008164:	0004a503          	lw	a0,0(s1)
80008168:	012985b3          	add	a1,s3,s2
8000816c:	ed1ff0ef          	jal	ra,8000803c <pbuf_take>
80008170:	02c12083          	lw	ra,44(sp)
80008174:	02812403          	lw	s0,40(sp)
80008178:	02412483          	lw	s1,36(sp)
8000817c:	02012903          	lw	s2,32(sp)
80008180:	01c12983          	lw	s3,28(sp)
80008184:	03010113          	addi	sp,sp,48
80008188:	00008067          	ret
8000818c:	fff00513          	li	a0,-1
80008190:	fe1ff06f          	j	80008170 <pbuf_take_at+0x94>

80008194 <pbuf_clone>:
80008194:	ff010113          	addi	sp,sp,-16
80008198:	00912223          	sw	s1,4(sp)
8000819c:	00060493          	mv	s1,a2
800081a0:	00058613          	mv	a2,a1
800081a4:	0084d583          	lhu	a1,8(s1)
800081a8:	00812423          	sw	s0,8(sp)
800081ac:	00112623          	sw	ra,12(sp)
800081b0:	821ff0ef          	jal	ra,800079d0 <pbuf_alloc>
800081b4:	00050413          	mv	s0,a0
800081b8:	00050663          	beqz	a0,800081c4 <pbuf_clone+0x30>
800081bc:	00048593          	mv	a1,s1
800081c0:	c11ff0ef          	jal	ra,80007dd0 <pbuf_copy>
800081c4:	00040513          	mv	a0,s0
800081c8:	00c12083          	lw	ra,12(sp)
800081cc:	00812403          	lw	s0,8(sp)
800081d0:	00412483          	lw	s1,4(sp)
800081d4:	01010113          	addi	sp,sp,16
800081d8:	00008067          	ret

800081dc <pbuf_coalesce>:
800081dc:	ff010113          	addi	sp,sp,-16
800081e0:	00812423          	sw	s0,8(sp)
800081e4:	00112623          	sw	ra,12(sp)
800081e8:	00912223          	sw	s1,4(sp)
800081ec:	00052783          	lw	a5,0(a0)
800081f0:	00050413          	mv	s0,a0
800081f4:	02079063          	bnez	a5,80008214 <pbuf_coalesce+0x38>
800081f8:	00040493          	mv	s1,s0
800081fc:	00c12083          	lw	ra,12(sp)
80008200:	00812403          	lw	s0,8(sp)
80008204:	00048513          	mv	a0,s1
80008208:	00412483          	lw	s1,4(sp)
8000820c:	01010113          	addi	sp,sp,16
80008210:	00008067          	ret
80008214:	00058513          	mv	a0,a1
80008218:	00040613          	mv	a2,s0
8000821c:	28000593          	li	a1,640
80008220:	f75ff0ef          	jal	ra,80008194 <pbuf_clone>
80008224:	00050493          	mv	s1,a0
80008228:	fc0508e3          	beqz	a0,800081f8 <pbuf_coalesce+0x1c>
8000822c:	00040513          	mv	a0,s0
80008230:	eccff0ef          	jal	ra,800078fc <pbuf_free>
80008234:	fc9ff06f          	j	800081fc <pbuf_coalesce+0x20>

80008238 <pbuf_try_get_at>:
80008238:	fe010113          	addi	sp,sp,-32
8000823c:	00e10613          	addi	a2,sp,14
80008240:	00112e23          	sw	ra,28(sp)
80008244:	ca0ff0ef          	jal	ra,800076e4 <pbuf_skip_const>
80008248:	fff00793          	li	a5,-1
8000824c:	02050063          	beqz	a0,8000826c <pbuf_try_get_at+0x34>
80008250:	00e15703          	lhu	a4,14(sp)
80008254:	00a55683          	lhu	a3,10(a0)
80008258:	fff00793          	li	a5,-1
8000825c:	00d77863          	bgeu	a4,a3,8000826c <pbuf_try_get_at+0x34>
80008260:	00452783          	lw	a5,4(a0)
80008264:	00e787b3          	add	a5,a5,a4
80008268:	0007c783          	lbu	a5,0(a5)
8000826c:	01c12083          	lw	ra,28(sp)
80008270:	00078513          	mv	a0,a5
80008274:	02010113          	addi	sp,sp,32
80008278:	00008067          	ret

8000827c <pbuf_get_at>:
8000827c:	ff010113          	addi	sp,sp,-16
80008280:	00112623          	sw	ra,12(sp)
80008284:	fb5ff0ef          	jal	ra,80008238 <pbuf_try_get_at>
80008288:	00055463          	bgez	a0,80008290 <pbuf_get_at+0x14>
8000828c:	00000513          	li	a0,0
80008290:	00c12083          	lw	ra,12(sp)
80008294:	0ff57513          	andi	a0,a0,255
80008298:	01010113          	addi	sp,sp,16
8000829c:	00008067          	ret

800082a0 <pbuf_put_at>:
800082a0:	fe010113          	addi	sp,sp,-32
800082a4:	00812c23          	sw	s0,24(sp)
800082a8:	00060413          	mv	s0,a2
800082ac:	00e10613          	addi	a2,sp,14
800082b0:	00112e23          	sw	ra,28(sp)
800082b4:	c30ff0ef          	jal	ra,800076e4 <pbuf_skip_const>
800082b8:	00050e63          	beqz	a0,800082d4 <pbuf_put_at+0x34>
800082bc:	00e15703          	lhu	a4,14(sp)
800082c0:	00a55783          	lhu	a5,10(a0)
800082c4:	00f77863          	bgeu	a4,a5,800082d4 <pbuf_put_at+0x34>
800082c8:	00452783          	lw	a5,4(a0)
800082cc:	00e787b3          	add	a5,a5,a4
800082d0:	00878023          	sb	s0,0(a5)
800082d4:	01c12083          	lw	ra,28(sp)
800082d8:	01812403          	lw	s0,24(sp)
800082dc:	02010113          	addi	sp,sp,32
800082e0:	00008067          	ret

800082e4 <pbuf_memcmp>:
800082e4:	00855703          	lhu	a4,8(a0)
800082e8:	00d587b3          	add	a5,a1,a3
800082ec:	00f75863          	bge	a4,a5,800082fc <pbuf_memcmp+0x18>
800082f0:	00010537          	lui	a0,0x10
800082f4:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xefff>
800082f8:	00008067          	ret
800082fc:	fd010113          	addi	sp,sp,-48
80008300:	02812423          	sw	s0,40(sp)
80008304:	02912223          	sw	s1,36(sp)
80008308:	02112623          	sw	ra,44(sp)
8000830c:	03212023          	sw	s2,32(sp)
80008310:	01312e23          	sw	s3,28(sp)
80008314:	00050493          	mv	s1,a0
80008318:	00058413          	mv	s0,a1
8000831c:	00a4d783          	lhu	a5,10(s1)
80008320:	00f46c63          	bltu	s0,a5,80008338 <pbuf_memcmp+0x54>
80008324:	0004a483          	lw	s1,0(s1)
80008328:	40f40433          	sub	s0,s0,a5
8000832c:	01041413          	slli	s0,s0,0x10
80008330:	01045413          	srli	s0,s0,0x10
80008334:	fe0494e3          	bnez	s1,8000831c <pbuf_memcmp+0x38>
80008338:	00000993          	li	s3,0
8000833c:	01099913          	slli	s2,s3,0x10
80008340:	01095913          	srli	s2,s2,0x10
80008344:	00d96663          	bltu	s2,a3,80008350 <pbuf_memcmp+0x6c>
80008348:	00000513          	li	a0,0
8000834c:	0580006f          	j	800083a4 <pbuf_memcmp+0xc0>
80008350:	008905b3          	add	a1,s2,s0
80008354:	01059593          	slli	a1,a1,0x10
80008358:	0105d593          	srli	a1,a1,0x10
8000835c:	00048513          	mv	a0,s1
80008360:	00d12623          	sw	a3,12(sp)
80008364:	00c12423          	sw	a2,8(sp)
80008368:	f15ff0ef          	jal	ra,8000827c <pbuf_get_at>
8000836c:	00812603          	lw	a2,8(sp)
80008370:	00198993          	addi	s3,s3,1
80008374:	00c12683          	lw	a3,12(sp)
80008378:	013607b3          	add	a5,a2,s3
8000837c:	fff7c783          	lbu	a5,-1(a5)
80008380:	faa78ee3          	beq	a5,a0,8000833c <pbuf_memcmp+0x58>
80008384:	000107b7          	lui	a5,0x10
80008388:	ffe78793          	addi	a5,a5,-2 # fffe <_stack_size+0xeffe>
8000838c:	00090513          	mv	a0,s2
80008390:	0127f463          	bgeu	a5,s2,80008398 <pbuf_memcmp+0xb4>
80008394:	ffe00513          	li	a0,-2
80008398:	00150513          	addi	a0,a0,1
8000839c:	01051513          	slli	a0,a0,0x10
800083a0:	01055513          	srli	a0,a0,0x10
800083a4:	02c12083          	lw	ra,44(sp)
800083a8:	02812403          	lw	s0,40(sp)
800083ac:	02412483          	lw	s1,36(sp)
800083b0:	02012903          	lw	s2,32(sp)
800083b4:	01c12983          	lw	s3,28(sp)
800083b8:	03010113          	addi	sp,sp,48
800083bc:	00008067          	ret

800083c0 <pbuf_memfind>:
800083c0:	fe010113          	addi	sp,sp,-32
800083c4:	00112e23          	sw	ra,28(sp)
800083c8:	00812c23          	sw	s0,24(sp)
800083cc:	00912a23          	sw	s1,20(sp)
800083d0:	01212823          	sw	s2,16(sp)
800083d4:	01312623          	sw	s3,12(sp)
800083d8:	01412423          	sw	s4,8(sp)
800083dc:	00855783          	lhu	a5,8(a0)
800083e0:	00d60733          	add	a4,a2,a3
800083e4:	02e7c263          	blt	a5,a4,80008408 <pbuf_memfind+0x48>
800083e8:	40c787b3          	sub	a5,a5,a2
800083ec:	01079493          	slli	s1,a5,0x10
800083f0:	00050993          	mv	s3,a0
800083f4:	00058a13          	mv	s4,a1
800083f8:	00060913          	mv	s2,a2
800083fc:	00068413          	mv	s0,a3
80008400:	0104d493          	srli	s1,s1,0x10
80008404:	0284f863          	bgeu	s1,s0,80008434 <pbuf_memfind+0x74>
80008408:	00010437          	lui	s0,0x10
8000840c:	fff40413          	addi	s0,s0,-1 # ffff <_stack_size+0xefff>
80008410:	00040513          	mv	a0,s0
80008414:	01c12083          	lw	ra,28(sp)
80008418:	01812403          	lw	s0,24(sp)
8000841c:	01412483          	lw	s1,20(sp)
80008420:	01012903          	lw	s2,16(sp)
80008424:	00c12983          	lw	s3,12(sp)
80008428:	00812a03          	lw	s4,8(sp)
8000842c:	02010113          	addi	sp,sp,32
80008430:	00008067          	ret
80008434:	00090693          	mv	a3,s2
80008438:	000a0613          	mv	a2,s4
8000843c:	00040593          	mv	a1,s0
80008440:	00098513          	mv	a0,s3
80008444:	ea1ff0ef          	jal	ra,800082e4 <pbuf_memcmp>
80008448:	fc0504e3          	beqz	a0,80008410 <pbuf_memfind+0x50>
8000844c:	00140413          	addi	s0,s0,1
80008450:	01041413          	slli	s0,s0,0x10
80008454:	01045413          	srli	s0,s0,0x10
80008458:	fadff06f          	j	80008404 <pbuf_memfind+0x44>

8000845c <pbuf_strstr>:
8000845c:	fe010113          	addi	sp,sp,-32
80008460:	00812c23          	sw	s0,24(sp)
80008464:	01212823          	sw	s2,16(sp)
80008468:	00112e23          	sw	ra,28(sp)
8000846c:	00010937          	lui	s2,0x10
80008470:	00912a23          	sw	s1,20(sp)
80008474:	fff90413          	addi	s0,s2,-1 # ffff <_stack_size+0xefff>
80008478:	04058c63          	beqz	a1,800084d0 <pbuf_strstr+0x74>
8000847c:	0005c783          	lbu	a5,0(a1)
80008480:	04078863          	beqz	a5,800084d0 <pbuf_strstr+0x74>
80008484:	00855783          	lhu	a5,8(a0)
80008488:	04878663          	beq	a5,s0,800084d4 <pbuf_strstr+0x78>
8000848c:	00050493          	mv	s1,a0
80008490:	00058513          	mv	a0,a1
80008494:	00b12623          	sw	a1,12(sp)
80008498:	ffe90913          	addi	s2,s2,-2
8000849c:	050070ef          	jal	ra,8000f4ec <strlen>
800084a0:	02a96863          	bltu	s2,a0,800084d0 <pbuf_strstr+0x74>
800084a4:	01812403          	lw	s0,24(sp)
800084a8:	01051613          	slli	a2,a0,0x10
800084ac:	00c12583          	lw	a1,12(sp)
800084b0:	01c12083          	lw	ra,28(sp)
800084b4:	01012903          	lw	s2,16(sp)
800084b8:	00048513          	mv	a0,s1
800084bc:	01412483          	lw	s1,20(sp)
800084c0:	00000693          	li	a3,0
800084c4:	01065613          	srli	a2,a2,0x10
800084c8:	02010113          	addi	sp,sp,32
800084cc:	ef5ff06f          	j	800083c0 <pbuf_memfind>
800084d0:	00040793          	mv	a5,s0
800084d4:	01c12083          	lw	ra,28(sp)
800084d8:	01812403          	lw	s0,24(sp)
800084dc:	01412483          	lw	s1,20(sp)
800084e0:	01012903          	lw	s2,16(sp)
800084e4:	00078513          	mv	a0,a5
800084e8:	02010113          	addi	sp,sp,32
800084ec:	00008067          	ret

800084f0 <raw_input>:
800084f0:	fd010113          	addi	sp,sp,-48
800084f4:	02912223          	sw	s1,36(sp)
800084f8:	a1418793          	addi	a5,gp,-1516 # 80003484 <ip_data>
800084fc:	02812423          	sw	s0,40(sp)
80008500:	03212023          	sw	s2,32(sp)
80008504:	01312e23          	sw	s3,28(sp)
80008508:	01412c23          	sw	s4,24(sp)
8000850c:	01512a23          	sw	s5,20(sp)
80008510:	01612823          	sw	s6,16(sp)
80008514:	01712623          	sw	s7,12(sp)
80008518:	02112623          	sw	ra,44(sp)
8000851c:	00050a13          	mv	s4,a0
80008520:	0007a583          	lw	a1,0(a5)
80008524:	0147a503          	lw	a0,20(a5)
80008528:	00000993          	li	s3,0
8000852c:	a1418493          	addi	s1,gp,-1516 # 80003484 <ip_data>
80008530:	179040ef          	jal	ra,8000cea8 <ip4_addr_isbroadcast_u32>
80008534:	004a2783          	lw	a5,4(s4)
80008538:	00050b13          	mv	s6,a0
8000853c:	0097ca83          	lbu	s5,9(a5)
80008540:	8f81a403          	lw	s0,-1800(gp) # 80003368 <raw_pcbs>
80008544:	00000513          	li	a0,0
80008548:	00078913          	mv	s2,a5
8000854c:	08040a63          	beqz	s0,800085e0 <raw_input+0xf0>
80008550:	01444783          	lbu	a5,20(s0)
80008554:	0d579463          	bne	a5,s5,8000861c <raw_input+0x12c>
80008558:	00844703          	lbu	a4,8(s0)
8000855c:	00070c63          	beqz	a4,80008574 <raw_input+0x84>
80008560:	0044a783          	lw	a5,4(s1)
80008564:	0387c783          	lbu	a5,56(a5)
80008568:	00178793          	addi	a5,a5,1
8000856c:	0ff7f793          	andi	a5,a5,255
80008570:	0af71663          	bne	a4,a5,8000861c <raw_input+0x12c>
80008574:	080b0c63          	beqz	s6,8000860c <raw_input+0x11c>
80008578:	00944783          	lbu	a5,9(s0)
8000857c:	0207f793          	andi	a5,a5,32
80008580:	08078e63          	beqz	a5,8000861c <raw_input+0x12c>
80008584:	00042783          	lw	a5,0(s0)
80008588:	08079a63          	bnez	a5,8000861c <raw_input+0x12c>
8000858c:	01544783          	lbu	a5,21(s0)
80008590:	0017f793          	andi	a5,a5,1
80008594:	00078863          	beqz	a5,800085a4 <raw_input+0xb4>
80008598:	00442703          	lw	a4,4(s0)
8000859c:	0104a783          	lw	a5,16(s1)
800085a0:	06f71e63          	bne	a4,a5,8000861c <raw_input+0x12c>
800085a4:	01842783          	lw	a5,24(s0)
800085a8:	06078a63          	beqz	a5,8000861c <raw_input+0x12c>
800085ac:	01c42503          	lw	a0,28(s0)
800085b0:	a2418693          	addi	a3,gp,-1500 # 80003494 <ip_data+0x10>
800085b4:	000a0613          	mv	a2,s4
800085b8:	00040593          	mv	a1,s0
800085bc:	000780e7          	jalr	a5
800085c0:	06050463          	beqz	a0,80008628 <raw_input+0x138>
800085c4:	00100513          	li	a0,1
800085c8:	00098c63          	beqz	s3,800085e0 <raw_input+0xf0>
800085cc:	01042783          	lw	a5,16(s0)
800085d0:	00f9a823          	sw	a5,16(s3)
800085d4:	8f81a783          	lw	a5,-1800(gp) # 80003368 <raw_pcbs>
800085d8:	8e81ac23          	sw	s0,-1800(gp) # 80003368 <raw_pcbs>
800085dc:	00f42823          	sw	a5,16(s0)
800085e0:	02c12083          	lw	ra,44(sp)
800085e4:	02812403          	lw	s0,40(sp)
800085e8:	02412483          	lw	s1,36(sp)
800085ec:	02012903          	lw	s2,32(sp)
800085f0:	01c12983          	lw	s3,28(sp)
800085f4:	01812a03          	lw	s4,24(sp)
800085f8:	01412a83          	lw	s5,20(sp)
800085fc:	01012b03          	lw	s6,16(sp)
80008600:	00c12b83          	lw	s7,12(sp)
80008604:	03010113          	addi	sp,sp,48
80008608:	00008067          	ret
8000860c:	00042783          	lw	a5,0(s0)
80008610:	f6078ee3          	beqz	a5,8000858c <raw_input+0x9c>
80008614:	0144a703          	lw	a4,20(s1)
80008618:	f6e78ae3          	beq	a5,a4,8000858c <raw_input+0x9c>
8000861c:	00040993          	mv	s3,s0
80008620:	01042403          	lw	s0,16(s0)
80008624:	f29ff06f          	j	8000854c <raw_input+0x5c>
80008628:	00200513          	li	a0,2
8000862c:	ff1ff06f          	j	8000861c <raw_input+0x12c>

80008630 <raw_bind>:
80008630:	ffa00793          	li	a5,-6
80008634:	00050a63          	beqz	a0,80008648 <raw_bind+0x18>
80008638:	00058863          	beqz	a1,80008648 <raw_bind+0x18>
8000863c:	0005a783          	lw	a5,0(a1)
80008640:	00f52023          	sw	a5,0(a0)
80008644:	00000793          	li	a5,0
80008648:	00078513          	mv	a0,a5
8000864c:	00008067          	ret

80008650 <raw_bind_netif>:
80008650:	00000793          	li	a5,0
80008654:	00058863          	beqz	a1,80008664 <raw_bind_netif+0x14>
80008658:	0385c783          	lbu	a5,56(a1)
8000865c:	00178793          	addi	a5,a5,1
80008660:	0ff7f793          	andi	a5,a5,255
80008664:	00f50423          	sb	a5,8(a0)
80008668:	00008067          	ret

8000866c <raw_connect>:
8000866c:	00050793          	mv	a5,a0
80008670:	ffa00513          	li	a0,-6
80008674:	02078263          	beqz	a5,80008698 <raw_connect+0x2c>
80008678:	02058063          	beqz	a1,80008698 <raw_connect+0x2c>
8000867c:	0005a703          	lw	a4,0(a1)
80008680:	00000513          	li	a0,0
80008684:	00e7a223          	sw	a4,4(a5)
80008688:	0157c703          	lbu	a4,21(a5)
8000868c:	00176713          	ori	a4,a4,1
80008690:	00e78aa3          	sb	a4,21(a5)
80008694:	00008067          	ret
80008698:	00008067          	ret

8000869c <raw_disconnect>:
8000869c:	01554783          	lbu	a5,21(a0)
800086a0:	00052223          	sw	zero,4(a0)
800086a4:	00050423          	sb	zero,8(a0)
800086a8:	ffe7f793          	andi	a5,a5,-2
800086ac:	00f50aa3          	sb	a5,21(a0)
800086b0:	00008067          	ret

800086b4 <raw_recv>:
800086b4:	00b52c23          	sw	a1,24(a0)
800086b8:	00c52e23          	sw	a2,28(a0)
800086bc:	00008067          	ret

800086c0 <raw_sendto_if_src>:
800086c0:	fe010113          	addi	sp,sp,-32
800086c4:	00112e23          	sw	ra,28(sp)
800086c8:	00812c23          	sw	s0,24(sp)
800086cc:	00912a23          	sw	s1,20(sp)
800086d0:	01212823          	sw	s2,16(sp)
800086d4:	01312623          	sw	s3,12(sp)
800086d8:	01412423          	sw	s4,8(sp)
800086dc:	01512223          	sw	s5,4(sp)
800086e0:	00051663          	bnez	a0,800086ec <raw_sendto_if_src+0x2c>
800086e4:	ffa00493          	li	s1,-6
800086e8:	06c0006f          	j	80008754 <raw_sendto_if_src+0x94>
800086ec:	fe060ce3          	beqz	a2,800086e4 <raw_sendto_if_src+0x24>
800086f0:	fe068ae3          	beqz	a3,800086e4 <raw_sendto_if_src+0x24>
800086f4:	fe0708e3          	beqz	a4,800086e4 <raw_sendto_if_src+0x24>
800086f8:	01554783          	lbu	a5,21(a0)
800086fc:	00070a13          	mv	s4,a4
80008700:	00068913          	mv	s2,a3
80008704:	0027f793          	andi	a5,a5,2
80008708:	00060a93          	mv	s5,a2
8000870c:	00058413          	mv	s0,a1
80008710:	00050493          	mv	s1,a0
80008714:	06078463          	beqz	a5,8000877c <raw_sendto_if_src+0xbc>
80008718:	00a5d703          	lhu	a4,10(a1)
8000871c:	01300793          	li	a5,19
80008720:	fce7f2e3          	bgeu	a5,a4,800086e4 <raw_sendto_if_src+0x24>
80008724:	00c50493          	addi	s1,a0,12
80008728:	0296ae23          	sw	s1,60(a3)
8000872c:	00068813          	mv	a6,a3
80008730:	00000793          	li	a5,0
80008734:	00000713          	li	a4,0
80008738:	00000693          	li	a3,0
8000873c:	00000613          	li	a2,0
80008740:	000a0593          	mv	a1,s4
80008744:	00040513          	mv	a0,s0
80008748:	634040ef          	jal	ra,8000cd7c <ip4_output_if>
8000874c:	00050493          	mv	s1,a0
80008750:	02092e23          	sw	zero,60(s2)
80008754:	01c12083          	lw	ra,28(sp)
80008758:	01812403          	lw	s0,24(sp)
8000875c:	00048513          	mv	a0,s1
80008760:	01012903          	lw	s2,16(sp)
80008764:	01412483          	lw	s1,20(sp)
80008768:	00c12983          	lw	s3,12(sp)
8000876c:	00812a03          	lw	s4,8(sp)
80008770:	00412a83          	lw	s5,4(sp)
80008774:	02010113          	addi	sp,sp,32
80008778:	00008067          	ret
8000877c:	0085d703          	lhu	a4,8(a1)
80008780:	000107b7          	lui	a5,0x10
80008784:	feb78793          	addi	a5,a5,-21 # ffeb <_stack_size+0xefeb>
80008788:	00e7f663          	bgeu	a5,a4,80008794 <raw_sendto_if_src+0xd4>
8000878c:	fff00493          	li	s1,-1
80008790:	fc5ff06f          	j	80008754 <raw_sendto_if_src+0x94>
80008794:	01400593          	li	a1,20
80008798:	00040513          	mv	a0,s0
8000879c:	8c8ff0ef          	jal	ra,80007864 <pbuf_add_header>
800087a0:	04050c63          	beqz	a0,800087f8 <raw_sendto_if_src+0x138>
800087a4:	28000613          	li	a2,640
800087a8:	00000593          	li	a1,0
800087ac:	02400513          	li	a0,36
800087b0:	a20ff0ef          	jal	ra,800079d0 <pbuf_alloc>
800087b4:	00050993          	mv	s3,a0
800087b8:	fc050ae3          	beqz	a0,8000878c <raw_sendto_if_src+0xcc>
800087bc:	00845783          	lhu	a5,8(s0)
800087c0:	00078663          	beqz	a5,800087cc <raw_sendto_if_src+0x10c>
800087c4:	00040593          	mv	a1,s0
800087c8:	d8cff0ef          	jal	ra,80007d54 <pbuf_chain>
800087cc:	0094c783          	lbu	a5,9(s1)
800087d0:	0207f793          	andi	a5,a5,32
800087d4:	02079e63          	bnez	a5,80008810 <raw_sendto_if_src+0x150>
800087d8:	000aa503          	lw	a0,0(s5)
800087dc:	00090593          	mv	a1,s2
800087e0:	6c8040ef          	jal	ra,8000cea8 <ip4_addr_isbroadcast_u32>
800087e4:	02050663          	beqz	a0,80008810 <raw_sendto_if_src+0x150>
800087e8:	ef340ee3          	beq	s0,s3,800086e4 <raw_sendto_if_src+0x24>
800087ec:	00098513          	mv	a0,s3
800087f0:	90cff0ef          	jal	ra,800078fc <pbuf_free>
800087f4:	ef1ff06f          	j	800086e4 <raw_sendto_if_src+0x24>
800087f8:	01400593          	li	a1,20
800087fc:	00040513          	mv	a0,s0
80008800:	874ff0ef          	jal	ra,80007874 <pbuf_remove_header>
80008804:	f80514e3          	bnez	a0,8000878c <raw_sendto_if_src+0xcc>
80008808:	00040993          	mv	s3,s0
8000880c:	fc1ff06f          	j	800087cc <raw_sendto_if_src+0x10c>
80008810:	00c48793          	addi	a5,s1,12
80008814:	00b4c683          	lbu	a3,11(s1)
80008818:	02f92e23          	sw	a5,60(s2)
8000881c:	0144c783          	lbu	a5,20(s1)
80008820:	00a4c703          	lbu	a4,10(s1)
80008824:	00090813          	mv	a6,s2
80008828:	000a8613          	mv	a2,s5
8000882c:	000a0593          	mv	a1,s4
80008830:	00098513          	mv	a0,s3
80008834:	548040ef          	jal	ra,8000cd7c <ip4_output_if>
80008838:	02092e23          	sw	zero,60(s2)
8000883c:	00050493          	mv	s1,a0
80008840:	f1340ae3          	beq	s0,s3,80008754 <raw_sendto_if_src+0x94>
80008844:	00098513          	mv	a0,s3
80008848:	8b4ff0ef          	jal	ra,800078fc <pbuf_free>
8000884c:	f09ff06f          	j	80008754 <raw_sendto_if_src+0x94>

80008850 <raw_sendto>:
80008850:	08050663          	beqz	a0,800088dc <raw_sendto+0x8c>
80008854:	08060463          	beqz	a2,800088dc <raw_sendto+0x8c>
80008858:	ff010113          	addi	sp,sp,-16
8000885c:	00812423          	sw	s0,8(sp)
80008860:	00912223          	sw	s1,4(sp)
80008864:	01212023          	sw	s2,0(sp)
80008868:	00112623          	sw	ra,12(sp)
8000886c:	00050413          	mv	s0,a0
80008870:	00854503          	lbu	a0,8(a0)
80008874:	00060493          	mv	s1,a2
80008878:	00058913          	mv	s2,a1
8000887c:	04050663          	beqz	a0,800088c8 <raw_sendto+0x78>
80008880:	d41fe0ef          	jal	ra,800075c0 <netif_get_by_index>
80008884:	06050063          	beqz	a0,800088e4 <raw_sendto+0x94>
80008888:	00042783          	lw	a5,0(s0)
8000888c:	04078463          	beqz	a5,800088d4 <raw_sendto+0x84>
80008890:	0f07f793          	andi	a5,a5,240
80008894:	0e000713          	li	a4,224
80008898:	02e78e63          	beq	a5,a4,800088d4 <raw_sendto+0x84>
8000889c:	00040713          	mv	a4,s0
800088a0:	00050693          	mv	a3,a0
800088a4:	00040513          	mv	a0,s0
800088a8:	00812403          	lw	s0,8(sp)
800088ac:	00c12083          	lw	ra,12(sp)
800088b0:	00048613          	mv	a2,s1
800088b4:	00090593          	mv	a1,s2
800088b8:	00412483          	lw	s1,4(sp)
800088bc:	00012903          	lw	s2,0(sp)
800088c0:	01010113          	addi	sp,sp,16
800088c4:	dfdff06f          	j	800086c0 <raw_sendto_if_src>
800088c8:	00060513          	mv	a0,a2
800088cc:	619030ef          	jal	ra,8000c6e4 <ip4_route>
800088d0:	fb5ff06f          	j	80008884 <raw_sendto+0x34>
800088d4:	00450713          	addi	a4,a0,4
800088d8:	fc9ff06f          	j	800088a0 <raw_sendto+0x50>
800088dc:	ffa00513          	li	a0,-6
800088e0:	00008067          	ret
800088e4:	00c12083          	lw	ra,12(sp)
800088e8:	00812403          	lw	s0,8(sp)
800088ec:	00412483          	lw	s1,4(sp)
800088f0:	00012903          	lw	s2,0(sp)
800088f4:	ffc00513          	li	a0,-4
800088f8:	01010113          	addi	sp,sp,16
800088fc:	00008067          	ret

80008900 <raw_send>:
80008900:	00450613          	addi	a2,a0,4
80008904:	f4dff06f          	j	80008850 <raw_sendto>

80008908 <raw_remove>:
80008908:	8f81a783          	lw	a5,-1800(gp) # 80003368 <raw_pcbs>
8000890c:	00050593          	mv	a1,a0
80008910:	00a79c63          	bne	a5,a0,80008928 <raw_remove+0x20>
80008914:	01052783          	lw	a5,16(a0)
80008918:	8ef1ac23          	sw	a5,-1800(gp) # 80003368 <raw_pcbs>
8000891c:	00000513          	li	a0,0
80008920:	f28fe06f          	j	80007048 <memp_free>
80008924:	00070793          	mv	a5,a4
80008928:	fe078ae3          	beqz	a5,8000891c <raw_remove+0x14>
8000892c:	0107a703          	lw	a4,16(a5)
80008930:	fe0706e3          	beqz	a4,8000891c <raw_remove+0x14>
80008934:	feb718e3          	bne	a4,a1,80008924 <raw_remove+0x1c>
80008938:	0105a703          	lw	a4,16(a1)
8000893c:	00e7a823          	sw	a4,16(a5)
80008940:	fddff06f          	j	8000891c <raw_remove+0x14>

80008944 <raw_new>:
80008944:	ff010113          	addi	sp,sp,-16
80008948:	800035b7          	lui	a1,0x80003
8000894c:	00912223          	sw	s1,4(sp)
80008950:	25a00613          	li	a2,602
80008954:	00050493          	mv	s1,a0
80008958:	ec458593          	addi	a1,a1,-316 # 80002ec4 <_ram_heap_end+0xfffeaec4>
8000895c:	00000513          	li	a0,0
80008960:	00812423          	sw	s0,8(sp)
80008964:	00112623          	sw	ra,12(sp)
80008968:	ea8fe0ef          	jal	ra,80007010 <memp_malloc_fn>
8000896c:	00050413          	mv	s0,a0
80008970:	02050463          	beqz	a0,80008998 <raw_new+0x54>
80008974:	02000613          	li	a2,32
80008978:	00000593          	li	a1,0
8000897c:	3e5040ef          	jal	ra,8000d560 <memset>
80008980:	fff00793          	li	a5,-1
80008984:	00f405a3          	sb	a5,11(s0)
80008988:	8f81a703          	lw	a4,-1800(gp) # 80003368 <raw_pcbs>
8000898c:	00940a23          	sb	s1,20(s0)
80008990:	8e81ac23          	sw	s0,-1800(gp) # 80003368 <raw_pcbs>
80008994:	00e42823          	sw	a4,16(s0)
80008998:	00040513          	mv	a0,s0
8000899c:	00c12083          	lw	ra,12(sp)
800089a0:	00812403          	lw	s0,8(sp)
800089a4:	00412483          	lw	s1,4(sp)
800089a8:	01010113          	addi	sp,sp,16
800089ac:	00008067          	ret

800089b0 <raw_new_ip_type>:
800089b0:	00058513          	mv	a0,a1
800089b4:	f91ff06f          	j	80008944 <raw_new>

800089b8 <raw_netif_ip_addr_changed>:
800089b8:	02050063          	beqz	a0,800089d8 <raw_netif_ip_addr_changed+0x20>
800089bc:	00052783          	lw	a5,0(a0)
800089c0:	00078c63          	beqz	a5,800089d8 <raw_netif_ip_addr_changed+0x20>
800089c4:	00058a63          	beqz	a1,800089d8 <raw_netif_ip_addr_changed+0x20>
800089c8:	0005a783          	lw	a5,0(a1)
800089cc:	00078663          	beqz	a5,800089d8 <raw_netif_ip_addr_changed+0x20>
800089d0:	8f81a783          	lw	a5,-1800(gp) # 80003368 <raw_pcbs>
800089d4:	00079463          	bnez	a5,800089dc <raw_netif_ip_addr_changed+0x24>
800089d8:	00008067          	ret
800089dc:	0007a683          	lw	a3,0(a5)
800089e0:	00052703          	lw	a4,0(a0)
800089e4:	00e69663          	bne	a3,a4,800089f0 <raw_netif_ip_addr_changed+0x38>
800089e8:	0005a703          	lw	a4,0(a1)
800089ec:	00e7a023          	sw	a4,0(a5)
800089f0:	0107a783          	lw	a5,16(a5)
800089f4:	fe1ff06f          	j	800089d4 <raw_netif_ip_addr_changed+0x1c>

800089f8 <stats_init>:
800089f8:	00008067          	ret

800089fc <sys_timeout_abs>:
800089fc:	ff010113          	addi	sp,sp,-16
80008a00:	01212023          	sw	s2,0(sp)
80008a04:	00058913          	mv	s2,a1
80008a08:	800035b7          	lui	a1,0x80003
80008a0c:	00812423          	sw	s0,8(sp)
80008a10:	00912223          	sw	s1,4(sp)
80008a14:	00050413          	mv	s0,a0
80008a18:	00060493          	mv	s1,a2
80008a1c:	ef058593          	addi	a1,a1,-272 # 80002ef0 <_ram_heap_end+0xfffeaef0>
80008a20:	0bc00613          	li	a2,188
80008a24:	00300513          	li	a0,3
80008a28:	00112623          	sw	ra,12(sp)
80008a2c:	de4fe0ef          	jal	ra,80007010 <memp_malloc_fn>
80008a30:	02050063          	beqz	a0,80008a50 <sys_timeout_abs+0x54>
80008a34:	9001a783          	lw	a5,-1792(gp) # 80003370 <next_timeout>
80008a38:	00052023          	sw	zero,0(a0)
80008a3c:	01252423          	sw	s2,8(a0)
80008a40:	00952623          	sw	s1,12(a0)
80008a44:	00852223          	sw	s0,4(a0)
80008a48:	02079063          	bnez	a5,80008a68 <sys_timeout_abs+0x6c>
80008a4c:	90a1a023          	sw	a0,-1792(gp) # 80003370 <next_timeout>
80008a50:	00c12083          	lw	ra,12(sp)
80008a54:	00812403          	lw	s0,8(sp)
80008a58:	00412483          	lw	s1,4(sp)
80008a5c:	00012903          	lw	s2,0(sp)
80008a60:	01010113          	addi	sp,sp,16
80008a64:	00008067          	ret
80008a68:	0047a683          	lw	a3,4(a5)
80008a6c:	40d406b3          	sub	a3,s0,a3
80008a70:	0006d863          	bgez	a3,80008a80 <sys_timeout_abs+0x84>
80008a74:	00f52023          	sw	a5,0(a0)
80008a78:	fd5ff06f          	j	80008a4c <sys_timeout_abs+0x50>
80008a7c:	00070793          	mv	a5,a4
80008a80:	0007a703          	lw	a4,0(a5)
80008a84:	00070863          	beqz	a4,80008a94 <sys_timeout_abs+0x98>
80008a88:	00472683          	lw	a3,4(a4) # 10004 <_stack_size+0xf004>
80008a8c:	40d406b3          	sub	a3,s0,a3
80008a90:	fe06d6e3          	bgez	a3,80008a7c <sys_timeout_abs+0x80>
80008a94:	00e52023          	sw	a4,0(a0)
80008a98:	00a7a023          	sw	a0,0(a5)
80008a9c:	fb5ff06f          	j	80008a50 <sys_timeout_abs+0x54>

80008aa0 <lwip_cyclic_timer>:
80008aa0:	fe010113          	addi	sp,sp,-32
80008aa4:	00112e23          	sw	ra,28(sp)
80008aa8:	00452783          	lw	a5,4(a0)
80008aac:	00a12623          	sw	a0,12(sp)
80008ab0:	000780e7          	jalr	a5
80008ab4:	fa8fc0ef          	jal	ra,8000525c <sys_now>
80008ab8:	00c12603          	lw	a2,12(sp)
80008abc:	8fc1a783          	lw	a5,-1796(gp) # 8000336c <current_timeout_due_time>
80008ac0:	00062703          	lw	a4,0(a2)
80008ac4:	800095b7          	lui	a1,0x80009
80008ac8:	aa058593          	addi	a1,a1,-1376 # 80008aa0 <_ram_heap_end+0xffff0aa0>
80008acc:	00f707b3          	add	a5,a4,a5
80008ad0:	40a786b3          	sub	a3,a5,a0
80008ad4:	00a70533          	add	a0,a4,a0
80008ad8:	0006c463          	bltz	a3,80008ae0 <lwip_cyclic_timer+0x40>
80008adc:	00078513          	mv	a0,a5
80008ae0:	01c12083          	lw	ra,28(sp)
80008ae4:	02010113          	addi	sp,sp,32
80008ae8:	f15ff06f          	j	800089fc <sys_timeout_abs>

80008aec <sys_timeout>:
80008aec:	fe010113          	addi	sp,sp,-32
80008af0:	00812c23          	sw	s0,24(sp)
80008af4:	00112e23          	sw	ra,28(sp)
80008af8:	00050413          	mv	s0,a0
80008afc:	00b12623          	sw	a1,12(sp)
80008b00:	00c12423          	sw	a2,8(sp)
80008b04:	f58fc0ef          	jal	ra,8000525c <sys_now>
80008b08:	00850533          	add	a0,a0,s0
80008b0c:	01812403          	lw	s0,24(sp)
80008b10:	00812603          	lw	a2,8(sp)
80008b14:	00c12583          	lw	a1,12(sp)
80008b18:	01c12083          	lw	ra,28(sp)
80008b1c:	02010113          	addi	sp,sp,32
80008b20:	eddff06f          	j	800089fc <sys_timeout_abs>

80008b24 <sys_timeouts_init>:
80008b24:	ff010113          	addi	sp,sp,-16
80008b28:	00812423          	sw	s0,8(sp)
80008b2c:	80003637          	lui	a2,0x80003
80008b30:	80009437          	lui	s0,0x80009
80008b34:	00912223          	sw	s1,4(sp)
80008b38:	aa040593          	addi	a1,s0,-1376 # 80008aa0 <_ram_heap_end+0xffff0aa0>
80008b3c:	ed860493          	addi	s1,a2,-296 # 80002ed8 <_ram_heap_end+0xfffeaed8>
80008b40:	3e800513          	li	a0,1000
80008b44:	ed860613          	addi	a2,a2,-296
80008b48:	00112623          	sw	ra,12(sp)
80008b4c:	fa1ff0ef          	jal	ra,80008aec <sys_timeout>
80008b50:	0000f537          	lui	a0,0xf
80008b54:	00848613          	addi	a2,s1,8
80008b58:	aa040593          	addi	a1,s0,-1376
80008b5c:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xda60>
80008b60:	f8dff0ef          	jal	ra,80008aec <sys_timeout>
80008b64:	aa040593          	addi	a1,s0,-1376
80008b68:	00812403          	lw	s0,8(sp)
80008b6c:	00c12083          	lw	ra,12(sp)
80008b70:	01048613          	addi	a2,s1,16
80008b74:	00412483          	lw	s1,4(sp)
80008b78:	1f400513          	li	a0,500
80008b7c:	01010113          	addi	sp,sp,16
80008b80:	f6dff06f          	j	80008aec <sys_timeout>

80008b84 <sys_untimeout>:
80008b84:	9001a783          	lw	a5,-1792(gp) # 80003370 <next_timeout>
80008b88:	00070693          	mv	a3,a4
80008b8c:	00000613          	li	a2,0
80008b90:	00079e63          	bnez	a5,80008bac <sys_untimeout+0x28>
80008b94:	00008067          	ret
80008b98:	00e62023          	sw	a4,0(a2)
80008b9c:	02c0006f          	j	80008bc8 <sys_untimeout+0x44>
80008ba0:	00078613          	mv	a2,a5
80008ba4:	fe0708e3          	beqz	a4,80008b94 <sys_untimeout+0x10>
80008ba8:	00070793          	mv	a5,a4
80008bac:	0087a803          	lw	a6,8(a5)
80008bb0:	0007a703          	lw	a4,0(a5)
80008bb4:	fea816e3          	bne	a6,a0,80008ba0 <sys_untimeout+0x1c>
80008bb8:	00c7a803          	lw	a6,12(a5)
80008bbc:	feb812e3          	bne	a6,a1,80008ba0 <sys_untimeout+0x1c>
80008bc0:	fc061ce3          	bnez	a2,80008b98 <sys_untimeout+0x14>
80008bc4:	90e1a023          	sw	a4,-1792(gp) # 80003370 <next_timeout>
80008bc8:	00078593          	mv	a1,a5
80008bcc:	00300513          	li	a0,3
80008bd0:	c78fe06f          	j	80007048 <memp_free>

80008bd4 <sys_check_timeouts>:
80008bd4:	fe010113          	addi	sp,sp,-32
80008bd8:	00912a23          	sw	s1,20(sp)
80008bdc:	01312623          	sw	s3,12(sp)
80008be0:	01412423          	sw	s4,8(sp)
80008be4:	00112e23          	sw	ra,28(sp)
80008be8:	00812c23          	sw	s0,24(sp)
80008bec:	01212823          	sw	s2,16(sp)
80008bf0:	e6cfc0ef          	jal	ra,8000525c <sys_now>
80008bf4:	00050993          	mv	s3,a0
80008bf8:	9001a583          	lw	a1,-1792(gp) # 80003370 <next_timeout>
80008bfc:	02058e63          	beqz	a1,80008c38 <sys_check_timeouts+0x64>
80008c00:	0045a783          	lw	a5,4(a1)
80008c04:	40f98733          	sub	a4,s3,a5
80008c08:	02074863          	bltz	a4,80008c38 <sys_check_timeouts+0x64>
80008c0c:	0005a703          	lw	a4,0(a1)
80008c10:	0085a403          	lw	s0,8(a1)
80008c14:	00300513          	li	a0,3
80008c18:	90e1a023          	sw	a4,-1792(gp) # 80003370 <next_timeout>
80008c1c:	00c5a903          	lw	s2,12(a1)
80008c20:	8ef1ae23          	sw	a5,-1796(gp) # 8000336c <current_timeout_due_time>
80008c24:	c24fe0ef          	jal	ra,80007048 <memp_free>
80008c28:	fc0408e3          	beqz	s0,80008bf8 <sys_check_timeouts+0x24>
80008c2c:	00090513          	mv	a0,s2
80008c30:	000400e7          	jalr	s0
80008c34:	fc5ff06f          	j	80008bf8 <sys_check_timeouts+0x24>
80008c38:	01c12083          	lw	ra,28(sp)
80008c3c:	01812403          	lw	s0,24(sp)
80008c40:	01412483          	lw	s1,20(sp)
80008c44:	01012903          	lw	s2,16(sp)
80008c48:	00c12983          	lw	s3,12(sp)
80008c4c:	00812a03          	lw	s4,8(sp)
80008c50:	02010113          	addi	sp,sp,32
80008c54:	00008067          	ret

80008c58 <sys_restart_timeouts>:
80008c58:	ff010113          	addi	sp,sp,-16
80008c5c:	00812423          	sw	s0,8(sp)
80008c60:	9001a783          	lw	a5,-1792(gp) # 80003370 <next_timeout>
80008c64:	00112623          	sw	ra,12(sp)
80008c68:	02078463          	beqz	a5,80008c90 <sys_restart_timeouts+0x38>
80008c6c:	df0fc0ef          	jal	ra,8000525c <sys_now>
80008c70:	9001a783          	lw	a5,-1792(gp) # 80003370 <next_timeout>
80008c74:	0047a703          	lw	a4,4(a5)
80008c78:	40e50533          	sub	a0,a0,a4
80008c7c:	0047a703          	lw	a4,4(a5)
80008c80:	00a70733          	add	a4,a4,a0
80008c84:	00e7a223          	sw	a4,4(a5)
80008c88:	0007a783          	lw	a5,0(a5)
80008c8c:	fe0798e3          	bnez	a5,80008c7c <sys_restart_timeouts+0x24>
80008c90:	00c12083          	lw	ra,12(sp)
80008c94:	00812403          	lw	s0,8(sp)
80008c98:	01010113          	addi	sp,sp,16
80008c9c:	00008067          	ret

80008ca0 <sys_timeouts_sleeptime>:
80008ca0:	ff010113          	addi	sp,sp,-16
80008ca4:	00812423          	sw	s0,8(sp)
80008ca8:	9001a783          	lw	a5,-1792(gp) # 80003370 <next_timeout>
80008cac:	00112623          	sw	ra,12(sp)
80008cb0:	fff00513          	li	a0,-1
80008cb4:	00078e63          	beqz	a5,80008cd0 <sys_timeouts_sleeptime+0x30>
80008cb8:	da4fc0ef          	jal	ra,8000525c <sys_now>
80008cbc:	9001a783          	lw	a5,-1792(gp) # 80003370 <next_timeout>
80008cc0:	0047a783          	lw	a5,4(a5)
80008cc4:	40a78533          	sub	a0,a5,a0
80008cc8:	00055463          	bgez	a0,80008cd0 <sys_timeouts_sleeptime+0x30>
80008ccc:	00000513          	li	a0,0
80008cd0:	00c12083          	lw	ra,12(sp)
80008cd4:	00812403          	lw	s0,8(sp)
80008cd8:	01010113          	addi	sp,sp,16
80008cdc:	00008067          	ret

80008ce0 <udp_init>:
80008ce0:	00008067          	ret

80008ce4 <udp_input>:
80008ce4:	fd010113          	addi	sp,sp,-48
80008ce8:	02812423          	sw	s0,40(sp)
80008cec:	02112623          	sw	ra,44(sp)
80008cf0:	02912223          	sw	s1,36(sp)
80008cf4:	03212023          	sw	s2,32(sp)
80008cf8:	01312e23          	sw	s3,28(sp)
80008cfc:	01412c23          	sw	s4,24(sp)
80008d00:	01512a23          	sw	s5,20(sp)
80008d04:	01612823          	sw	s6,16(sp)
80008d08:	01712623          	sw	s7,12(sp)
80008d0c:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
80008d10:	0f47a703          	lw	a4,244(a5)
80008d14:	00170713          	addi	a4,a4,1
80008d18:	0ee7aa23          	sw	a4,244(a5)
80008d1c:	00a55683          	lhu	a3,10(a0)
80008d20:	00700713          	li	a4,7
80008d24:	04d76463          	bltu	a4,a3,80008d6c <udp_input+0x88>
80008d28:	1047a703          	lw	a4,260(a5)
80008d2c:	00170713          	addi	a4,a4,1
80008d30:	10e7a223          	sw	a4,260(a5)
80008d34:	0fc7a703          	lw	a4,252(a5)
80008d38:	00170713          	addi	a4,a4,1
80008d3c:	0ee7ae23          	sw	a4,252(a5)
80008d40:	02812403          	lw	s0,40(sp)
80008d44:	02c12083          	lw	ra,44(sp)
80008d48:	02412483          	lw	s1,36(sp)
80008d4c:	02012903          	lw	s2,32(sp)
80008d50:	01c12983          	lw	s3,28(sp)
80008d54:	01812a03          	lw	s4,24(sp)
80008d58:	01412a83          	lw	s5,20(sp)
80008d5c:	01012b03          	lw	s6,16(sp)
80008d60:	00c12b83          	lw	s7,12(sp)
80008d64:	03010113          	addi	sp,sp,48
80008d68:	b95fe06f          	j	800078fc <pbuf_free>
80008d6c:	a1418913          	addi	s2,gp,-1516 # 80003484 <ip_data>
80008d70:	00452983          	lw	s3,4(a0)
80008d74:	00050493          	mv	s1,a0
80008d78:	00058b93          	mv	s7,a1
80008d7c:	01492503          	lw	a0,20(s2)
80008d80:	00092583          	lw	a1,0(s2)
80008d84:	a2c18413          	addi	s0,gp,-1492 # 8000349c <lwip_stats>
80008d88:	a1418a13          	addi	s4,gp,-1516 # 80003484 <ip_data>
80008d8c:	11c040ef          	jal	ra,8000cea8 <ip4_addr_isbroadcast_u32>
80008d90:	0019c783          	lbu	a5,1(s3)
80008d94:	00050a93          	mv	s5,a0
80008d98:	0009c503          	lbu	a0,0(s3)
80008d9c:	00879793          	slli	a5,a5,0x8
80008da0:	00a7e533          	or	a0,a5,a0
80008da4:	935fd0ef          	jal	ra,800066d8 <lwip_htons>
80008da8:	0039c783          	lbu	a5,3(s3)
80008dac:	00050b13          	mv	s6,a0
80008db0:	0029c503          	lbu	a0,2(s3)
80008db4:	00879793          	slli	a5,a5,0x8
80008db8:	00a7e533          	or	a0,a5,a0
80008dbc:	91dfd0ef          	jal	ra,800066d8 <lwip_htons>
80008dc0:	9041a803          	lw	a6,-1788(gp) # 80003374 <udp_pcbs>
80008dc4:	00492303          	lw	t1,4(s2)
80008dc8:	01492683          	lw	a3,20(s2)
80008dcc:	01092e03          	lw	t3,16(s2)
80008dd0:	00080793          	mv	a5,a6
80008dd4:	00000913          	li	s2,0
80008dd8:	00000593          	li	a1,0
80008ddc:	fff00893          	li	a7,-1
80008de0:	00079c63          	bnez	a5,80008df8 <udp_input+0x114>
80008de4:	0a091e63          	bnez	s2,80008ea0 <udp_input+0x1bc>
80008de8:	004ba783          	lw	a5,4(s7)
80008dec:	0ad78a63          	beq	a5,a3,80008ea0 <udp_input+0x1bc>
80008df0:	00048513          	mv	a0,s1
80008df4:	f4dff06f          	j	80008d40 <udp_input+0x5c>
80008df8:	0167d703          	lhu	a4,22(a5)
80008dfc:	0ea71e63          	bne	a4,a0,80008ef8 <udp_input+0x214>
80008e00:	0087ce83          	lbu	t4,8(a5)
80008e04:	000e8a63          	beqz	t4,80008e18 <udp_input+0x134>
80008e08:	03834703          	lbu	a4,56(t1)
80008e0c:	00170713          	addi	a4,a4,1
80008e10:	0ff77713          	andi	a4,a4,255
80008e14:	0eee9263          	bne	t4,a4,80008ef8 <udp_input+0x214>
80008e18:	0c0a8a63          	beqz	s5,80008eec <udp_input+0x208>
80008e1c:	0097c703          	lbu	a4,9(a5)
80008e20:	02077713          	andi	a4,a4,32
80008e24:	0c070a63          	beqz	a4,80008ef8 <udp_input+0x214>
80008e28:	0007a703          	lw	a4,0(a5)
80008e2c:	00070c63          	beqz	a4,80008e44 <udp_input+0x160>
80008e30:	01168a63          	beq	a3,a7,80008e44 <udp_input+0x160>
80008e34:	008bae83          	lw	t4,8(s7)
80008e38:	00d74733          	xor	a4,a4,a3
80008e3c:	01d77733          	and	a4,a4,t4
80008e40:	0a071c63          	bnez	a4,80008ef8 <udp_input+0x214>
80008e44:	0147c703          	lbu	a4,20(a5)
80008e48:	00477713          	andi	a4,a4,4
80008e4c:	02071463          	bnez	a4,80008e74 <udp_input+0x190>
80008e50:	02090063          	beqz	s2,80008e70 <udp_input+0x18c>
80008e54:	020a8063          	beqz	s5,80008e74 <udp_input+0x190>
80008e58:	01169e63          	bne	a3,a7,80008e74 <udp_input+0x190>
80008e5c:	004ba703          	lw	a4,4(s7)
80008e60:	00092e83          	lw	t4,0(s2)
80008e64:	00ee8863          	beq	t4,a4,80008e74 <udp_input+0x190>
80008e68:	0007ae83          	lw	t4,0(a5)
80008e6c:	01d71463          	bne	a4,t4,80008e74 <udp_input+0x190>
80008e70:	00078913          	mv	s2,a5
80008e74:	0187d703          	lhu	a4,24(a5)
80008e78:	09671063          	bne	a4,s6,80008ef8 <udp_input+0x214>
80008e7c:	0047a703          	lw	a4,4(a5)
80008e80:	00070463          	beqz	a4,80008e88 <udp_input+0x1a4>
80008e84:	07c71a63          	bne	a4,t3,80008ef8 <udp_input+0x214>
80008e88:	06058e63          	beqz	a1,80008f04 <udp_input+0x220>
80008e8c:	0107a703          	lw	a4,16(a5)
80008e90:	90f1a223          	sw	a5,-1788(gp) # 80003374 <udp_pcbs>
80008e94:	00e5a823          	sw	a4,16(a1)
80008e98:	0107a823          	sw	a6,16(a5)
80008e9c:	00078913          	mv	s2,a5
80008ea0:	0079c783          	lbu	a5,7(s3)
80008ea4:	0069c703          	lbu	a4,6(s3)
80008ea8:	00879793          	slli	a5,a5,0x8
80008eac:	00e7e7b3          	or	a5,a5,a4
80008eb0:	06078263          	beqz	a5,80008f14 <udp_input+0x230>
80008eb4:	0084d603          	lhu	a2,8(s1)
80008eb8:	a2818713          	addi	a4,gp,-1496 # 80003498 <ip_data+0x14>
80008ebc:	a2418693          	addi	a3,gp,-1500 # 80003494 <ip_data+0x10>
80008ec0:	01100593          	li	a1,17
80008ec4:	00048513          	mv	a0,s1
80008ec8:	c71fd0ef          	jal	ra,80006b38 <ip_chksum_pseudo>
80008ecc:	04050463          	beqz	a0,80008f14 <udp_input+0x230>
80008ed0:	10042783          	lw	a5,256(s0)
80008ed4:	00178793          	addi	a5,a5,1
80008ed8:	10f42023          	sw	a5,256(s0)
80008edc:	0fc42783          	lw	a5,252(s0)
80008ee0:	00178793          	addi	a5,a5,1
80008ee4:	0ef42e23          	sw	a5,252(s0)
80008ee8:	f09ff06f          	j	80008df0 <udp_input+0x10c>
80008eec:	0007a703          	lw	a4,0(a5)
80008ef0:	f4070ae3          	beqz	a4,80008e44 <udp_input+0x160>
80008ef4:	f4d708e3          	beq	a4,a3,80008e44 <udp_input+0x160>
80008ef8:	00078593          	mv	a1,a5
80008efc:	0107a783          	lw	a5,16(a5)
80008f00:	ee1ff06f          	j	80008de0 <udp_input+0xfc>
80008f04:	11c42703          	lw	a4,284(s0)
80008f08:	00170713          	addi	a4,a4,1
80008f0c:	10e42e23          	sw	a4,284(s0)
80008f10:	f8dff06f          	j	80008e9c <udp_input+0x1b8>
80008f14:	00800593          	li	a1,8
80008f18:	00048513          	mv	a0,s1
80008f1c:	959fe0ef          	jal	ra,80007874 <pbuf_remove_header>
80008f20:	fa051ee3          	bnez	a0,80008edc <udp_input+0x1f8>
80008f24:	04090663          	beqz	s2,80008f70 <udp_input+0x28c>
80008f28:	01c92303          	lw	t1,28(s2)
80008f2c:	ec0302e3          	beqz	t1,80008df0 <udp_input+0x10c>
80008f30:	02812403          	lw	s0,40(sp)
80008f34:	02092503          	lw	a0,32(s2)
80008f38:	02c12083          	lw	ra,44(sp)
80008f3c:	01c12983          	lw	s3,28(sp)
80008f40:	01812a03          	lw	s4,24(sp)
80008f44:	01412a83          	lw	s5,20(sp)
80008f48:	00c12b83          	lw	s7,12(sp)
80008f4c:	000b0713          	mv	a4,s6
80008f50:	00048613          	mv	a2,s1
80008f54:	01012b03          	lw	s6,16(sp)
80008f58:	02412483          	lw	s1,36(sp)
80008f5c:	00090593          	mv	a1,s2
80008f60:	02012903          	lw	s2,32(sp)
80008f64:	a2418693          	addi	a3,gp,-1500 # 80003494 <ip_data+0x10>
80008f68:	03010113          	addi	sp,sp,48
80008f6c:	00030067          	jr	t1
80008f70:	020a9c63          	bnez	s5,80008fa8 <udp_input+0x2c4>
80008f74:	014a2783          	lw	a5,20(s4)
80008f78:	0e000713          	li	a4,224
80008f7c:	0f07f793          	andi	a5,a5,240
80008f80:	02e78463          	beq	a5,a4,80008fa8 <udp_input+0x2c4>
80008f84:	00ca5583          	lhu	a1,12(s4)
80008f88:	00048513          	mv	a0,s1
80008f8c:	00858593          	addi	a1,a1,8
80008f90:	01059593          	slli	a1,a1,0x10
80008f94:	4105d593          	srai	a1,a1,0x10
80008f98:	951fe0ef          	jal	ra,800078e8 <pbuf_header_force>
80008f9c:	00300593          	li	a1,3
80008fa0:	00048513          	mv	a0,s1
80008fa4:	264030ef          	jal	ra,8000c208 <icmp_dest_unreach>
80008fa8:	11042783          	lw	a5,272(s0)
80008fac:	00178793          	addi	a5,a5,1
80008fb0:	10f42823          	sw	a5,272(s0)
80008fb4:	f29ff06f          	j	80008edc <udp_input+0x1f8>

80008fb8 <udp_bind>:
80008fb8:	00059463          	bnez	a1,80008fc0 <udp_bind+0x8>
80008fbc:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
80008fc0:	ff000793          	li	a5,-16
80008fc4:	0a050463          	beqz	a0,8000906c <udp_bind+0xb4>
80008fc8:	9041a783          	lw	a5,-1788(gp) # 80003374 <udp_pcbs>
80008fcc:	00078693          	mv	a3,a5
80008fd0:	06069063          	bnez	a3,80009030 <udp_bind+0x78>
80008fd4:	00000e13          	li	t3,0
80008fd8:	0c061463          	bnez	a2,800090a0 <udp_bind+0xe8>
80008fdc:	800036b7          	lui	a3,0x80003
80008fe0:	2746d603          	lhu	a2,628(a3) # 80003274 <_ram_heap_end+0xfffeb274>
80008fe4:	00010337          	lui	t1,0x10
80008fe8:	00004837          	lui	a6,0x4
80008fec:	fff30313          	addi	t1,t1,-1 # ffff <_stack_size+0xefff>
80008ff0:	04660a63          	beq	a2,t1,80009044 <udp_bind+0x8c>
80008ff4:	00160613          	addi	a2,a2,1
80008ff8:	01061613          	slli	a2,a2,0x10
80008ffc:	01065613          	srli	a2,a2,0x10
80009000:	00078893          	mv	a7,a5
80009004:	04089463          	bnez	a7,8000904c <udp_bind+0x94>
80009008:	26c69a23          	sh	a2,628(a3)
8000900c:	0005a783          	lw	a5,0(a1)
80009010:	00c51b23          	sh	a2,22(a0)
80009014:	00f52023          	sw	a5,0(a0)
80009018:	000e1863          	bnez	t3,80009028 <udp_bind+0x70>
8000901c:	9041a783          	lw	a5,-1788(gp) # 80003374 <udp_pcbs>
80009020:	90a1a223          	sw	a0,-1788(gp) # 80003374 <udp_pcbs>
80009024:	00f52823          	sw	a5,16(a0)
80009028:	00000793          	li	a5,0
8000902c:	0400006f          	j	8000906c <udp_bind+0xb4>
80009030:	00a68663          	beq	a3,a0,8000903c <udp_bind+0x84>
80009034:	0106a683          	lw	a3,16(a3)
80009038:	f99ff06f          	j	80008fd0 <udp_bind+0x18>
8000903c:	00100e13          	li	t3,1
80009040:	f99ff06f          	j	80008fd8 <udp_bind+0x20>
80009044:	0000c637          	lui	a2,0xc
80009048:	fb9ff06f          	j	80009000 <udp_bind+0x48>
8000904c:	0168de83          	lhu	t4,22(a7)
80009050:	02ce9263          	bne	t4,a2,80009074 <udp_bind+0xbc>
80009054:	fff80813          	addi	a6,a6,-1 # 3fff <_stack_size+0x2fff>
80009058:	01081813          	slli	a6,a6,0x10
8000905c:	01085813          	srli	a6,a6,0x10
80009060:	f80818e3          	bnez	a6,80008ff0 <udp_bind+0x38>
80009064:	26c69a23          	sh	a2,628(a3)
80009068:	ff800793          	li	a5,-8
8000906c:	00078513          	mv	a0,a5
80009070:	00008067          	ret
80009074:	0108a883          	lw	a7,16(a7)
80009078:	f8dff06f          	j	80009004 <udp_bind+0x4c>
8000907c:	02a78063          	beq	a5,a0,8000909c <udp_bind+0xe4>
80009080:	0167d683          	lhu	a3,22(a5)
80009084:	00c69c63          	bne	a3,a2,8000909c <udp_bind+0xe4>
80009088:	0005a803          	lw	a6,0(a1)
8000908c:	0007a683          	lw	a3,0(a5)
80009090:	fd068ce3          	beq	a3,a6,80009068 <udp_bind+0xb0>
80009094:	fc080ae3          	beqz	a6,80009068 <udp_bind+0xb0>
80009098:	fc0688e3          	beqz	a3,80009068 <udp_bind+0xb0>
8000909c:	0107a783          	lw	a5,16(a5)
800090a0:	fc079ee3          	bnez	a5,8000907c <udp_bind+0xc4>
800090a4:	f69ff06f          	j	8000900c <udp_bind+0x54>

800090a8 <udp_sendto_if_src>:
800090a8:	fd010113          	addi	sp,sp,-48
800090ac:	02912223          	sw	s1,36(sp)
800090b0:	02112623          	sw	ra,44(sp)
800090b4:	02812423          	sw	s0,40(sp)
800090b8:	03212023          	sw	s2,32(sp)
800090bc:	01312e23          	sw	s3,28(sp)
800090c0:	01412c23          	sw	s4,24(sp)
800090c4:	01512a23          	sw	s5,20(sp)
800090c8:	01612823          	sw	s6,16(sp)
800090cc:	01712623          	sw	s7,12(sp)
800090d0:	ff000493          	li	s1,-16
800090d4:	08050263          	beqz	a0,80009158 <udp_sendto_if_src+0xb0>
800090d8:	08058063          	beqz	a1,80009158 <udp_sendto_if_src+0xb0>
800090dc:	06060e63          	beqz	a2,80009158 <udp_sendto_if_src+0xb0>
800090e0:	06078c63          	beqz	a5,80009158 <udp_sendto_if_src+0xb0>
800090e4:	06070a63          	beqz	a4,80009158 <udp_sendto_if_src+0xb0>
800090e8:	00078b13          	mv	s6,a5
800090ec:	00954783          	lbu	a5,9(a0)
800090f0:	00070a13          	mv	s4,a4
800090f4:	00068b93          	mv	s7,a3
800090f8:	0207f793          	andi	a5,a5,32
800090fc:	00060a93          	mv	s5,a2
80009100:	00058993          	mv	s3,a1
80009104:	00050413          	mv	s0,a0
80009108:	02078e63          	beqz	a5,80009144 <udp_sendto_if_src+0x9c>
8000910c:	01645783          	lhu	a5,22(s0)
80009110:	00079e63          	bnez	a5,8000912c <udp_sendto_if_src+0x84>
80009114:	00000613          	li	a2,0
80009118:	00040593          	mv	a1,s0
8000911c:	00040513          	mv	a0,s0
80009120:	e99ff0ef          	jal	ra,80008fb8 <udp_bind>
80009124:	00050493          	mv	s1,a0
80009128:	02051863          	bnez	a0,80009158 <udp_sendto_if_src+0xb0>
8000912c:	0089d703          	lhu	a4,8(s3)
80009130:	000107b7          	lui	a5,0x10
80009134:	ff778793          	addi	a5,a5,-9 # fff7 <_stack_size+0xeff7>
80009138:	04e7f863          	bgeu	a5,a4,80009188 <udp_sendto_if_src+0xe0>
8000913c:	fff00493          	li	s1,-1
80009140:	0180006f          	j	80009158 <udp_sendto_if_src+0xb0>
80009144:	00062503          	lw	a0,0(a2) # c000 <_stack_size+0xb000>
80009148:	00070593          	mv	a1,a4
8000914c:	ffa00493          	li	s1,-6
80009150:	559030ef          	jal	ra,8000cea8 <ip4_addr_isbroadcast_u32>
80009154:	fa050ce3          	beqz	a0,8000910c <udp_sendto_if_src+0x64>
80009158:	02c12083          	lw	ra,44(sp)
8000915c:	02812403          	lw	s0,40(sp)
80009160:	00048513          	mv	a0,s1
80009164:	02012903          	lw	s2,32(sp)
80009168:	02412483          	lw	s1,36(sp)
8000916c:	01c12983          	lw	s3,28(sp)
80009170:	01812a03          	lw	s4,24(sp)
80009174:	01412a83          	lw	s5,20(sp)
80009178:	01012b03          	lw	s6,16(sp)
8000917c:	00c12b83          	lw	s7,12(sp)
80009180:	03010113          	addi	sp,sp,48
80009184:	00008067          	ret
80009188:	00800593          	li	a1,8
8000918c:	00098513          	mv	a0,s3
80009190:	ed4fe0ef          	jal	ra,80007864 <pbuf_add_header>
80009194:	10050063          	beqz	a0,80009294 <udp_sendto_if_src+0x1ec>
80009198:	28000613          	li	a2,640
8000919c:	00800593          	li	a1,8
800091a0:	02400513          	li	a0,36
800091a4:	82dfe0ef          	jal	ra,800079d0 <pbuf_alloc>
800091a8:	00050913          	mv	s2,a0
800091ac:	f80508e3          	beqz	a0,8000913c <udp_sendto_if_src+0x94>
800091b0:	0089d783          	lhu	a5,8(s3)
800091b4:	00078663          	beqz	a5,800091c0 <udp_sendto_if_src+0x118>
800091b8:	00098593          	mv	a1,s3
800091bc:	b99fe0ef          	jal	ra,80007d54 <pbuf_chain>
800091c0:	01645503          	lhu	a0,22(s0)
800091c4:	00492483          	lw	s1,4(s2)
800091c8:	d10fd0ef          	jal	ra,800066d8 <lwip_htons>
800091cc:	00a48023          	sb	a0,0(s1)
800091d0:	00855513          	srli	a0,a0,0x8
800091d4:	00a480a3          	sb	a0,1(s1)
800091d8:	000b8513          	mv	a0,s7
800091dc:	cfcfd0ef          	jal	ra,800066d8 <lwip_htons>
800091e0:	00a48123          	sb	a0,2(s1)
800091e4:	00855513          	srli	a0,a0,0x8
800091e8:	00a481a3          	sb	a0,3(s1)
800091ec:	00048323          	sb	zero,6(s1)
800091f0:	000483a3          	sb	zero,7(s1)
800091f4:	00895503          	lhu	a0,8(s2)
800091f8:	ce0fd0ef          	jal	ra,800066d8 <lwip_htons>
800091fc:	00a48223          	sb	a0,4(s1)
80009200:	00855513          	srli	a0,a0,0x8
80009204:	00a482a3          	sb	a0,5(s1)
80009208:	01444783          	lbu	a5,20(s0)
8000920c:	0017f793          	andi	a5,a5,1
80009210:	02079a63          	bnez	a5,80009244 <udp_sendto_if_src+0x19c>
80009214:	00895603          	lhu	a2,8(s2)
80009218:	000a8713          	mv	a4,s5
8000921c:	000b0693          	mv	a3,s6
80009220:	01100593          	li	a1,17
80009224:	00090513          	mv	a0,s2
80009228:	911fd0ef          	jal	ra,80006b38 <ip_chksum_pseudo>
8000922c:	00051663          	bnez	a0,80009238 <udp_sendto_if_src+0x190>
80009230:	00010537          	lui	a0,0x10
80009234:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xefff>
80009238:	00a48323          	sb	a0,6(s1)
8000923c:	00855513          	srli	a0,a0,0x8
80009240:	00a483a3          	sb	a0,7(s1)
80009244:	00c40793          	addi	a5,s0,12
80009248:	00b44683          	lbu	a3,11(s0)
8000924c:	02fa2e23          	sw	a5,60(s4)
80009250:	00a44703          	lbu	a4,10(s0)
80009254:	000a0813          	mv	a6,s4
80009258:	01100793          	li	a5,17
8000925c:	000a8613          	mv	a2,s5
80009260:	000b0593          	mv	a1,s6
80009264:	00090513          	mv	a0,s2
80009268:	0d1030ef          	jal	ra,8000cb38 <ip4_output_if_src>
8000926c:	020a2e23          	sw	zero,60(s4)
80009270:	00050493          	mv	s1,a0
80009274:	01390663          	beq	s2,s3,80009280 <udp_sendto_if_src+0x1d8>
80009278:	00090513          	mv	a0,s2
8000927c:	e80fe0ef          	jal	ra,800078fc <pbuf_free>
80009280:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
80009284:	0f07a703          	lw	a4,240(a5)
80009288:	00170713          	addi	a4,a4,1
8000928c:	0ee7a823          	sw	a4,240(a5)
80009290:	ec9ff06f          	j	80009158 <udp_sendto_if_src+0xb0>
80009294:	00098913          	mv	s2,s3
80009298:	f29ff06f          	j	800091c0 <udp_sendto_if_src+0x118>

8000929c <udp_sendto_if>:
8000929c:	02050e63          	beqz	a0,800092d8 <udp_sendto_if+0x3c>
800092a0:	02058c63          	beqz	a1,800092d8 <udp_sendto_if+0x3c>
800092a4:	02060a63          	beqz	a2,800092d8 <udp_sendto_if+0x3c>
800092a8:	02070863          	beqz	a4,800092d8 <udp_sendto_if+0x3c>
800092ac:	00052783          	lw	a5,0(a0)
800092b0:	00078863          	beqz	a5,800092c0 <udp_sendto_if+0x24>
800092b4:	0f07f813          	andi	a6,a5,240
800092b8:	0e000893          	li	a7,224
800092bc:	01181663          	bne	a6,a7,800092c8 <udp_sendto_if+0x2c>
800092c0:	00470793          	addi	a5,a4,4
800092c4:	de5ff06f          	j	800090a8 <udp_sendto_if_src>
800092c8:	00472803          	lw	a6,4(a4)
800092cc:	01079a63          	bne	a5,a6,800092e0 <udp_sendto_if+0x44>
800092d0:	00050793          	mv	a5,a0
800092d4:	ff1ff06f          	j	800092c4 <udp_sendto_if+0x28>
800092d8:	ff000513          	li	a0,-16
800092dc:	00008067          	ret
800092e0:	ffc00513          	li	a0,-4
800092e4:	00008067          	ret

800092e8 <udp_sendto>:
800092e8:	0a050863          	beqz	a0,80009398 <udp_sendto+0xb0>
800092ec:	0a058663          	beqz	a1,80009398 <udp_sendto+0xb0>
800092f0:	0a060463          	beqz	a2,80009398 <udp_sendto+0xb0>
800092f4:	fe010113          	addi	sp,sp,-32
800092f8:	00812c23          	sw	s0,24(sp)
800092fc:	00912a23          	sw	s1,20(sp)
80009300:	01212823          	sw	s2,16(sp)
80009304:	01312623          	sw	s3,12(sp)
80009308:	00112e23          	sw	ra,28(sp)
8000930c:	00050413          	mv	s0,a0
80009310:	00854503          	lbu	a0,8(a0)
80009314:	00068993          	mv	s3,a3
80009318:	00060493          	mv	s1,a2
8000931c:	00058913          	mv	s2,a1
80009320:	02050e63          	beqz	a0,8000935c <udp_sendto+0x74>
80009324:	a9cfe0ef          	jal	ra,800075c0 <netif_get_by_index>
80009328:	04051063          	bnez	a0,80009368 <udp_sendto+0x80>
8000932c:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
80009330:	10c7a703          	lw	a4,268(a5)
80009334:	ffc00513          	li	a0,-4
80009338:	00170713          	addi	a4,a4,1
8000933c:	10e7a623          	sw	a4,268(a5)
80009340:	01c12083          	lw	ra,28(sp)
80009344:	01812403          	lw	s0,24(sp)
80009348:	01412483          	lw	s1,20(sp)
8000934c:	01012903          	lw	s2,16(sp)
80009350:	00c12983          	lw	s3,12(sp)
80009354:	02010113          	addi	sp,sp,32
80009358:	00008067          	ret
8000935c:	00060513          	mv	a0,a2
80009360:	384030ef          	jal	ra,8000c6e4 <ip4_route>
80009364:	fc5ff06f          	j	80009328 <udp_sendto+0x40>
80009368:	00050713          	mv	a4,a0
8000936c:	00040513          	mv	a0,s0
80009370:	01812403          	lw	s0,24(sp)
80009374:	01c12083          	lw	ra,28(sp)
80009378:	00098693          	mv	a3,s3
8000937c:	00048613          	mv	a2,s1
80009380:	00c12983          	lw	s3,12(sp)
80009384:	01412483          	lw	s1,20(sp)
80009388:	00090593          	mv	a1,s2
8000938c:	01012903          	lw	s2,16(sp)
80009390:	02010113          	addi	sp,sp,32
80009394:	f09ff06f          	j	8000929c <udp_sendto_if>
80009398:	ff000513          	li	a0,-16
8000939c:	00008067          	ret

800093a0 <udp_send>:
800093a0:	00050a63          	beqz	a0,800093b4 <udp_send+0x14>
800093a4:	00058863          	beqz	a1,800093b4 <udp_send+0x14>
800093a8:	01855683          	lhu	a3,24(a0)
800093ac:	00450613          	addi	a2,a0,4
800093b0:	f39ff06f          	j	800092e8 <udp_sendto>
800093b4:	ff000513          	li	a0,-16
800093b8:	00008067          	ret

800093bc <udp_bind_netif>:
800093bc:	00000793          	li	a5,0
800093c0:	00058863          	beqz	a1,800093d0 <udp_bind_netif+0x14>
800093c4:	0385c783          	lbu	a5,56(a1)
800093c8:	00178793          	addi	a5,a5,1
800093cc:	0ff7f793          	andi	a5,a5,255
800093d0:	00f50423          	sb	a5,8(a0)
800093d4:	00008067          	ret

800093d8 <udp_connect>:
800093d8:	ff000793          	li	a5,-16
800093dc:	0a050063          	beqz	a0,8000947c <udp_connect+0xa4>
800093e0:	08058e63          	beqz	a1,8000947c <udp_connect+0xa4>
800093e4:	ff010113          	addi	sp,sp,-16
800093e8:	00812423          	sw	s0,8(sp)
800093ec:	00912223          	sw	s1,4(sp)
800093f0:	01212023          	sw	s2,0(sp)
800093f4:	00112623          	sw	ra,12(sp)
800093f8:	01655783          	lhu	a5,22(a0)
800093fc:	00050413          	mv	s0,a0
80009400:	00060913          	mv	s2,a2
80009404:	00058493          	mv	s1,a1
80009408:	02078c63          	beqz	a5,80009440 <udp_connect+0x68>
8000940c:	0004a783          	lw	a5,0(s1)
80009410:	01241c23          	sh	s2,24(s0)
80009414:	00f42223          	sw	a5,4(s0)
80009418:	01444783          	lbu	a5,20(s0)
8000941c:	0047e793          	ori	a5,a5,4
80009420:	00f40a23          	sb	a5,20(s0)
80009424:	9041a683          	lw	a3,-1788(gp) # 80003374 <udp_pcbs>
80009428:	00068713          	mv	a4,a3
8000942c:	04071263          	bnez	a4,80009470 <udp_connect+0x98>
80009430:	00d42823          	sw	a3,16(s0)
80009434:	9081a223          	sw	s0,-1788(gp) # 80003374 <udp_pcbs>
80009438:	00000793          	li	a5,0
8000943c:	0180006f          	j	80009454 <udp_connect+0x7c>
80009440:	00000613          	li	a2,0
80009444:	00050593          	mv	a1,a0
80009448:	b71ff0ef          	jal	ra,80008fb8 <udp_bind>
8000944c:	00050793          	mv	a5,a0
80009450:	fa050ee3          	beqz	a0,8000940c <udp_connect+0x34>
80009454:	00c12083          	lw	ra,12(sp)
80009458:	00812403          	lw	s0,8(sp)
8000945c:	00412483          	lw	s1,4(sp)
80009460:	00012903          	lw	s2,0(sp)
80009464:	00078513          	mv	a0,a5
80009468:	01010113          	addi	sp,sp,16
8000946c:	00008067          	ret
80009470:	fc8704e3          	beq	a4,s0,80009438 <udp_connect+0x60>
80009474:	01072703          	lw	a4,16(a4)
80009478:	fb5ff06f          	j	8000942c <udp_connect+0x54>
8000947c:	00078513          	mv	a0,a5
80009480:	00008067          	ret

80009484 <udp_disconnect>:
80009484:	00050e63          	beqz	a0,800094a0 <udp_disconnect+0x1c>
80009488:	01454783          	lbu	a5,20(a0)
8000948c:	00052223          	sw	zero,4(a0)
80009490:	00051c23          	sh	zero,24(a0)
80009494:	ffb7f793          	andi	a5,a5,-5
80009498:	00050423          	sb	zero,8(a0)
8000949c:	00f50a23          	sb	a5,20(a0)
800094a0:	00008067          	ret

800094a4 <udp_recv>:
800094a4:	00050663          	beqz	a0,800094b0 <udp_recv+0xc>
800094a8:	00b52e23          	sw	a1,28(a0)
800094ac:	02c52023          	sw	a2,32(a0)
800094b0:	00008067          	ret

800094b4 <udp_remove>:
800094b4:	00050593          	mv	a1,a0
800094b8:	02050e63          	beqz	a0,800094f4 <udp_remove+0x40>
800094bc:	9041a783          	lw	a5,-1788(gp) # 80003374 <udp_pcbs>
800094c0:	00a79c63          	bne	a5,a0,800094d8 <udp_remove+0x24>
800094c4:	01052783          	lw	a5,16(a0)
800094c8:	90f1a223          	sw	a5,-1788(gp) # 80003374 <udp_pcbs>
800094cc:	00100513          	li	a0,1
800094d0:	b79fd06f          	j	80007048 <memp_free>
800094d4:	00070793          	mv	a5,a4
800094d8:	fe078ae3          	beqz	a5,800094cc <udp_remove+0x18>
800094dc:	0107a703          	lw	a4,16(a5)
800094e0:	fe0706e3          	beqz	a4,800094cc <udp_remove+0x18>
800094e4:	feb718e3          	bne	a4,a1,800094d4 <udp_remove+0x20>
800094e8:	0105a703          	lw	a4,16(a1)
800094ec:	00e7a823          	sw	a4,16(a5)
800094f0:	fddff06f          	j	800094cc <udp_remove+0x18>
800094f4:	00008067          	ret

800094f8 <udp_new>:
800094f8:	800035b7          	lui	a1,0x80003
800094fc:	ff010113          	addi	sp,sp,-16
80009500:	4c800613          	li	a2,1224
80009504:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xfffeaf0c>
80009508:	00100513          	li	a0,1
8000950c:	00812423          	sw	s0,8(sp)
80009510:	00112623          	sw	ra,12(sp)
80009514:	afdfd0ef          	jal	ra,80007010 <memp_malloc_fn>
80009518:	00050413          	mv	s0,a0
8000951c:	00050c63          	beqz	a0,80009534 <udp_new+0x3c>
80009520:	02400613          	li	a2,36
80009524:	00000593          	li	a1,0
80009528:	038040ef          	jal	ra,8000d560 <memset>
8000952c:	fff00793          	li	a5,-1
80009530:	00f405a3          	sb	a5,11(s0)
80009534:	00040513          	mv	a0,s0
80009538:	00c12083          	lw	ra,12(sp)
8000953c:	00812403          	lw	s0,8(sp)
80009540:	01010113          	addi	sp,sp,16
80009544:	00008067          	ret

80009548 <udp_new_ip_type>:
80009548:	fb1ff06f          	j	800094f8 <udp_new>

8000954c <udp_netif_ip_addr_changed>:
8000954c:	02050063          	beqz	a0,8000956c <udp_netif_ip_addr_changed+0x20>
80009550:	00052783          	lw	a5,0(a0)
80009554:	00078c63          	beqz	a5,8000956c <udp_netif_ip_addr_changed+0x20>
80009558:	00058a63          	beqz	a1,8000956c <udp_netif_ip_addr_changed+0x20>
8000955c:	0005a783          	lw	a5,0(a1)
80009560:	00078663          	beqz	a5,8000956c <udp_netif_ip_addr_changed+0x20>
80009564:	9041a783          	lw	a5,-1788(gp) # 80003374 <udp_pcbs>
80009568:	00079463          	bnez	a5,80009570 <udp_netif_ip_addr_changed+0x24>
8000956c:	00008067          	ret
80009570:	0007a683          	lw	a3,0(a5)
80009574:	00052703          	lw	a4,0(a0)
80009578:	00e69663          	bne	a3,a4,80009584 <udp_netif_ip_addr_changed+0x38>
8000957c:	0005a703          	lw	a4,0(a1)
80009580:	00e7a023          	sw	a4,0(a5)
80009584:	0107a783          	lw	a5,16(a5)
80009588:	fe1ff06f          	j	80009568 <udp_netif_ip_addr_changed+0x1c>

8000958c <dhcp_set_state>:
8000958c:	00554783          	lbu	a5,5(a0)
80009590:	00b78863          	beq	a5,a1,800095a0 <dhcp_set_state+0x14>
80009594:	00b502a3          	sb	a1,5(a0)
80009598:	00050323          	sb	zero,6(a0)
8000959c:	00051423          	sh	zero,8(a0)
800095a0:	00008067          	ret

800095a4 <dhcp_option_short>:
800095a4:	00a587b3          	add	a5,a1,a0
800095a8:	00865713          	srli	a4,a2,0x8
800095ac:	00e78023          	sb	a4,0(a5)
800095b0:	00150793          	addi	a5,a0,1
800095b4:	01079793          	slli	a5,a5,0x10
800095b8:	0107d793          	srli	a5,a5,0x10
800095bc:	00250513          	addi	a0,a0,2
800095c0:	00f585b3          	add	a1,a1,a5
800095c4:	01051513          	slli	a0,a0,0x10
800095c8:	00c58023          	sb	a2,0(a1)
800095cc:	01055513          	srli	a0,a0,0x10
800095d0:	00008067          	ret

800095d4 <dhcp_option_long>:
800095d4:	00a587b3          	add	a5,a1,a0
800095d8:	01865713          	srli	a4,a2,0x18
800095dc:	00e78023          	sb	a4,0(a5)
800095e0:	00150793          	addi	a5,a0,1
800095e4:	01079793          	slli	a5,a5,0x10
800095e8:	0107d793          	srli	a5,a5,0x10
800095ec:	00f587b3          	add	a5,a1,a5
800095f0:	01065713          	srli	a4,a2,0x10
800095f4:	00e78023          	sb	a4,0(a5)
800095f8:	00250793          	addi	a5,a0,2
800095fc:	01079793          	slli	a5,a5,0x10
80009600:	0107d793          	srli	a5,a5,0x10
80009604:	00f587b3          	add	a5,a1,a5
80009608:	00865713          	srli	a4,a2,0x8
8000960c:	00e78023          	sb	a4,0(a5)
80009610:	00350793          	addi	a5,a0,3
80009614:	01079793          	slli	a5,a5,0x10
80009618:	0107d793          	srli	a5,a5,0x10
8000961c:	00450513          	addi	a0,a0,4
80009620:	00f585b3          	add	a1,a1,a5
80009624:	01051513          	slli	a0,a0,0x10
80009628:	00c58023          	sb	a2,0(a1)
8000962c:	01055513          	srli	a0,a0,0x10
80009630:	00008067          	ret

80009634 <dhcp_create_msg>:
80009634:	fe010113          	addi	sp,sp,-32
80009638:	00112e23          	sw	ra,28(sp)
8000963c:	00812c23          	sw	s0,24(sp)
80009640:	00912a23          	sw	s1,20(sp)
80009644:	01212823          	sw	s2,16(sp)
80009648:	01312623          	sw	s3,12(sp)
8000964c:	01412423          	sw	s4,8(sp)
80009650:	01512223          	sw	s5,4(sp)
80009654:	01612023          	sw	s6,0(sp)
80009658:	02051a63          	bnez	a0,8000968c <dhcp_create_msg+0x58>
8000965c:	00000a93          	li	s5,0
80009660:	01c12083          	lw	ra,28(sp)
80009664:	01812403          	lw	s0,24(sp)
80009668:	000a8513          	mv	a0,s5
8000966c:	01412483          	lw	s1,20(sp)
80009670:	01012903          	lw	s2,16(sp)
80009674:	00c12983          	lw	s3,12(sp)
80009678:	00812a03          	lw	s4,8(sp)
8000967c:	00412a83          	lw	s5,4(sp)
80009680:	00012b03          	lw	s6,0(sp)
80009684:	02010113          	addi	sp,sp,32
80009688:	00008067          	ret
8000968c:	fc0588e3          	beqz	a1,8000965c <dhcp_create_msg+0x28>
80009690:	00060913          	mv	s2,a2
80009694:	00058993          	mv	s3,a1
80009698:	00050493          	mv	s1,a0
8000969c:	28000613          	li	a2,640
800096a0:	13400593          	li	a1,308
800096a4:	03800513          	li	a0,56
800096a8:	00068a13          	mv	s4,a3
800096ac:	b24fe0ef          	jal	ra,800079d0 <pbuf_alloc>
800096b0:	00050a93          	mv	s5,a0
800096b4:	fa0504e3          	beqz	a0,8000965c <dhcp_create_msg+0x28>
800096b8:	00300793          	li	a5,3
800096bc:	00f91663          	bne	s2,a5,800096c8 <dhcp_create_msg+0x94>
800096c0:	0059c783          	lbu	a5,5(s3)
800096c4:	03279063          	bne	a5,s2,800096e4 <dhcp_create_msg+0xb0>
800096c8:	0069c703          	lbu	a4,6(s3)
800096cc:	00071863          	bnez	a4,800096dc <dhcp_create_msg+0xa8>
800096d0:	8081a703          	lw	a4,-2040(gp) # 80003278 <xid.4813>
800096d4:	00170713          	addi	a4,a4,1
800096d8:	80e1a423          	sw	a4,-2040(gp) # 80003278 <xid.4813>
800096dc:	8081a783          	lw	a5,-2040(gp) # 80003278 <xid.4813>
800096e0:	00f9a023          	sw	a5,0(s3)
800096e4:	004aa403          	lw	s0,4(s5)
800096e8:	13400613          	li	a2,308
800096ec:	00000593          	li	a1,0
800096f0:	00100b13          	li	s6,1
800096f4:	00040513          	mv	a0,s0
800096f8:	669030ef          	jal	ra,8000d560 <memset>
800096fc:	01640023          	sb	s6,0(s0)
80009700:	016400a3          	sb	s6,1(s0)
80009704:	0344c783          	lbu	a5,52(s1)
80009708:	00f40123          	sb	a5,2(s0)
8000970c:	0009a503          	lw	a0,0(s3)
80009710:	fe1fc0ef          	jal	ra,800066f0 <lwip_htonl>
80009714:	00855793          	srli	a5,a0,0x8
80009718:	00a40223          	sb	a0,4(s0)
8000971c:	00f402a3          	sb	a5,5(s0)
80009720:	01055793          	srli	a5,a0,0x10
80009724:	01855513          	srli	a0,a0,0x18
80009728:	00f40323          	sb	a5,6(s0)
8000972c:	00a403a3          	sb	a0,7(s0)
80009730:	00400793          	li	a5,4
80009734:	02f90463          	beq	s2,a5,8000975c <dhcp_create_msg+0x128>
80009738:	ff990793          	addi	a5,s2,-7
8000973c:	0ff7f793          	andi	a5,a5,255
80009740:	00fb7e63          	bgeu	s6,a5,8000975c <dhcp_create_msg+0x128>
80009744:	00300793          	li	a5,3
80009748:	02f91a63          	bne	s2,a5,8000977c <dhcp_create_msg+0x148>
8000974c:	0059c783          	lbu	a5,5(s3)
80009750:	ffc78793          	addi	a5,a5,-4
80009754:	0ff7f793          	andi	a5,a5,255
80009758:	02fb6263          	bltu	s6,a5,8000977c <dhcp_create_msg+0x148>
8000975c:	0044a783          	lw	a5,4(s1)
80009760:	0087d713          	srli	a4,a5,0x8
80009764:	00f40623          	sb	a5,12(s0)
80009768:	00e406a3          	sb	a4,13(s0)
8000976c:	0107d713          	srli	a4,a5,0x10
80009770:	0187d793          	srli	a5,a5,0x18
80009774:	00e40723          	sb	a4,14(s0)
80009778:	00f407a3          	sb	a5,15(s0)
8000977c:	02e48793          	addi	a5,s1,46
80009780:	01c40713          	addi	a4,s0,28
80009784:	03448493          	addi	s1,s1,52
80009788:	0007c683          	lbu	a3,0(a5)
8000978c:	00178793          	addi	a5,a5,1
80009790:	00170713          	addi	a4,a4,1
80009794:	fed70fa3          	sb	a3,-1(a4)
80009798:	fe9798e3          	bne	a5,s1,80009788 <dhcp_create_msg+0x154>
8000979c:	06300793          	li	a5,99
800097a0:	0ef40623          	sb	a5,236(s0)
800097a4:	f8200713          	li	a4,-126
800097a8:	0ef407a3          	sb	a5,239(s0)
800097ac:	03500793          	li	a5,53
800097b0:	0ee406a3          	sb	a4,237(s0)
800097b4:	0ef40823          	sb	a5,240(s0)
800097b8:	05300713          	li	a4,83
800097bc:	00100793          	li	a5,1
800097c0:	0ef408a3          	sb	a5,241(s0)
800097c4:	0ee40723          	sb	a4,238(s0)
800097c8:	0f240923          	sb	s2,242(s0)
800097cc:	00300793          	li	a5,3
800097d0:	00fa1023          	sh	a5,0(s4)
800097d4:	e8dff06f          	j	80009660 <dhcp_create_msg+0x2c>

800097d8 <dhcp_option_trailer>:
800097d8:	00150793          	addi	a5,a0,1
800097dc:	01079793          	slli	a5,a5,0x10
800097e0:	00a58733          	add	a4,a1,a0
800097e4:	0107d793          	srli	a5,a5,0x10
800097e8:	fff00693          	li	a3,-1
800097ec:	00d70023          	sb	a3,0(a4)
800097f0:	00f585b3          	add	a1,a1,a5
800097f4:	04300713          	li	a4,67
800097f8:	00f77c63          	bgeu	a4,a5,80009810 <dhcp_option_trailer+0x38>
800097fc:	0f078593          	addi	a1,a5,240
80009800:	01059593          	slli	a1,a1,0x10
80009804:	0105d593          	srli	a1,a1,0x10
80009808:	00060513          	mv	a0,a2
8000980c:	b94fe06f          	j	80007ba0 <pbuf_realloc>
80009810:	00178793          	addi	a5,a5,1
80009814:	01079793          	slli	a5,a5,0x10
80009818:	00058023          	sb	zero,0(a1)
8000981c:	0107d793          	srli	a5,a5,0x10
80009820:	00158593          	addi	a1,a1,1
80009824:	fd5ff06f          	j	800097f8 <dhcp_option_trailer+0x20>

80009828 <dhcp_reboot>:
80009828:	fd010113          	addi	sp,sp,-48
8000982c:	02112623          	sw	ra,44(sp)
80009830:	02812423          	sw	s0,40(sp)
80009834:	03212023          	sw	s2,32(sp)
80009838:	02912223          	sw	s1,36(sp)
8000983c:	01312e23          	sw	s3,28(sp)
80009840:	01412c23          	sw	s4,24(sp)
80009844:	02852483          	lw	s1,40(a0)
80009848:	00050913          	mv	s2,a0
8000984c:	00300593          	li	a1,3
80009850:	00048513          	mv	a0,s1
80009854:	d39ff0ef          	jal	ra,8000958c <dhcp_set_state>
80009858:	00e10693          	addi	a3,sp,14
8000985c:	00300613          	li	a2,3
80009860:	00048593          	mv	a1,s1
80009864:	00090513          	mv	a0,s2
80009868:	dcdff0ef          	jal	ra,80009634 <dhcp_create_msg>
8000986c:	fff00413          	li	s0,-1
80009870:	14050663          	beqz	a0,800099bc <dhcp_reboot+0x194>
80009874:	00452403          	lw	s0,4(a0)
80009878:	00e15783          	lhu	a5,14(sp)
8000987c:	00050993          	mv	s3,a0
80009880:	0f040413          	addi	s0,s0,240
80009884:	00f40733          	add	a4,s0,a5
80009888:	00278513          	addi	a0,a5,2
8000988c:	00178793          	addi	a5,a5,1
80009890:	01079793          	slli	a5,a5,0x10
80009894:	03900693          	li	a3,57
80009898:	0107d793          	srli	a5,a5,0x10
8000989c:	00d70023          	sb	a3,0(a4)
800098a0:	00f407b3          	add	a5,s0,a5
800098a4:	00200713          	li	a4,2
800098a8:	01051513          	slli	a0,a0,0x10
800098ac:	00e78023          	sb	a4,0(a5)
800098b0:	00040593          	mv	a1,s0
800098b4:	24000613          	li	a2,576
800098b8:	01055513          	srli	a0,a0,0x10
800098bc:	00a11723          	sh	a0,14(sp)
800098c0:	ce5ff0ef          	jal	ra,800095a4 <dhcp_option_short>
800098c4:	00a407b3          	add	a5,s0,a0
800098c8:	00250a13          	addi	s4,a0,2
800098cc:	00150513          	addi	a0,a0,1
800098d0:	01051513          	slli	a0,a0,0x10
800098d4:	03200713          	li	a4,50
800098d8:	01055513          	srli	a0,a0,0x10
800098dc:	00e78023          	sb	a4,0(a5)
800098e0:	00a40533          	add	a0,s0,a0
800098e4:	00400793          	li	a5,4
800098e8:	00f50023          	sb	a5,0(a0)
800098ec:	01c4a503          	lw	a0,28(s1)
800098f0:	010a1a13          	slli	s4,s4,0x10
800098f4:	010a5a13          	srli	s4,s4,0x10
800098f8:	01411723          	sh	s4,14(sp)
800098fc:	df5fc0ef          	jal	ra,800066f0 <lwip_htonl>
80009900:	00050613          	mv	a2,a0
80009904:	00040593          	mv	a1,s0
80009908:	000a0513          	mv	a0,s4
8000990c:	cc9ff0ef          	jal	ra,800095d4 <dhcp_option_long>
80009910:	00a40733          	add	a4,s0,a0
80009914:	03700693          	li	a3,55
80009918:	00d70023          	sb	a3,0(a4)
8000991c:	00150713          	addi	a4,a0,1
80009920:	01071713          	slli	a4,a4,0x10
80009924:	01075713          	srli	a4,a4,0x10
80009928:	00300693          	li	a3,3
8000992c:	00e40733          	add	a4,s0,a4
80009930:	00d70023          	sb	a3,0(a4)
80009934:	00250713          	addi	a4,a0,2
80009938:	01071713          	slli	a4,a4,0x10
8000993c:	01075713          	srli	a4,a4,0x10
80009940:	00e40733          	add	a4,s0,a4
80009944:	00100613          	li	a2,1
80009948:	00c70023          	sb	a2,0(a4)
8000994c:	00050793          	mv	a5,a0
80009950:	00350713          	addi	a4,a0,3
80009954:	01071713          	slli	a4,a4,0x10
80009958:	00478793          	addi	a5,a5,4
8000995c:	01075713          	srli	a4,a4,0x10
80009960:	01079793          	slli	a5,a5,0x10
80009964:	00e40733          	add	a4,s0,a4
80009968:	00550513          	addi	a0,a0,5
8000996c:	0107d793          	srli	a5,a5,0x10
80009970:	00d70023          	sb	a3,0(a4)
80009974:	00f407b3          	add	a5,s0,a5
80009978:	01c00713          	li	a4,28
8000997c:	01051513          	slli	a0,a0,0x10
80009980:	00e78023          	sb	a4,0(a5)
80009984:	01055513          	srli	a0,a0,0x10
80009988:	00040593          	mv	a1,s0
8000998c:	00098613          	mv	a2,s3
80009990:	00a11723          	sh	a0,14(sp)
80009994:	e45ff0ef          	jal	ra,800097d8 <dhcp_option_trailer>
80009998:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000999c:	00090713          	mv	a4,s2
800099a0:	04300693          	li	a3,67
800099a4:	84418613          	addi	a2,gp,-1980 # 800032b4 <ip_addr_broadcast>
800099a8:	00098593          	mv	a1,s3
800099ac:	8f1ff0ef          	jal	ra,8000929c <udp_sendto_if>
800099b0:	00050413          	mv	s0,a0
800099b4:	00098513          	mv	a0,s3
800099b8:	f45fd0ef          	jal	ra,800078fc <pbuf_free>
800099bc:	0064c783          	lbu	a5,6(s1)
800099c0:	0ff00713          	li	a4,255
800099c4:	00e78663          	beq	a5,a4,800099d0 <dhcp_reboot+0x1a8>
800099c8:	00178793          	addi	a5,a5,1
800099cc:	00f48323          	sb	a5,6(s1)
800099d0:	0064c503          	lbu	a0,6(s1)
800099d4:	00900793          	li	a5,9
800099d8:	04a7ea63          	bltu	a5,a0,80009a2c <dhcp_reboot+0x204>
800099dc:	00551793          	slli	a5,a0,0x5
800099e0:	40a787b3          	sub	a5,a5,a0
800099e4:	00279793          	slli	a5,a5,0x2
800099e8:	00f50533          	add	a0,a0,a5
800099ec:	00351513          	slli	a0,a0,0x3
800099f0:	01051513          	slli	a0,a0,0x10
800099f4:	01055513          	srli	a0,a0,0x10
800099f8:	1f400593          	li	a1,500
800099fc:	1f350513          	addi	a0,a0,499
80009a00:	268040ef          	jal	ra,8000dc68 <__divsi3>
80009a04:	00a49423          	sh	a0,8(s1)
80009a08:	02c12083          	lw	ra,44(sp)
80009a0c:	00040513          	mv	a0,s0
80009a10:	02812403          	lw	s0,40(sp)
80009a14:	02412483          	lw	s1,36(sp)
80009a18:	02012903          	lw	s2,32(sp)
80009a1c:	01c12983          	lw	s3,28(sp)
80009a20:	01812a03          	lw	s4,24(sp)
80009a24:	03010113          	addi	sp,sp,48
80009a28:	00008067          	ret
80009a2c:	00002537          	lui	a0,0x2
80009a30:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1710>
80009a34:	fc5ff06f          	j	800099f8 <dhcp_reboot+0x1d0>

80009a38 <dhcp_select>:
80009a38:	fd010113          	addi	sp,sp,-48
80009a3c:	02812423          	sw	s0,40(sp)
80009a40:	02112623          	sw	ra,44(sp)
80009a44:	02912223          	sw	s1,36(sp)
80009a48:	03212023          	sw	s2,32(sp)
80009a4c:	01312e23          	sw	s3,28(sp)
80009a50:	01412c23          	sw	s4,24(sp)
80009a54:	01512a23          	sw	s5,20(sp)
80009a58:	ff000413          	li	s0,-16
80009a5c:	22050263          	beqz	a0,80009c80 <dhcp_select+0x248>
80009a60:	02852483          	lw	s1,40(a0)
80009a64:	ffa00413          	li	s0,-6
80009a68:	20048c63          	beqz	s1,80009c80 <dhcp_select+0x248>
80009a6c:	00050913          	mv	s2,a0
80009a70:	00100593          	li	a1,1
80009a74:	00048513          	mv	a0,s1
80009a78:	b15ff0ef          	jal	ra,8000958c <dhcp_set_state>
80009a7c:	00e10693          	addi	a3,sp,14
80009a80:	00300613          	li	a2,3
80009a84:	00048593          	mv	a1,s1
80009a88:	00090513          	mv	a0,s2
80009a8c:	ba9ff0ef          	jal	ra,80009634 <dhcp_create_msg>
80009a90:	00050993          	mv	s3,a0
80009a94:	fff00413          	li	s0,-1
80009a98:	18050a63          	beqz	a0,80009c2c <dhcp_select+0x1f4>
80009a9c:	00452403          	lw	s0,4(a0)
80009aa0:	00e15783          	lhu	a5,14(sp)
80009aa4:	03900693          	li	a3,57
80009aa8:	0f040413          	addi	s0,s0,240
80009aac:	00f40733          	add	a4,s0,a5
80009ab0:	00278513          	addi	a0,a5,2
80009ab4:	00178793          	addi	a5,a5,1
80009ab8:	01079793          	slli	a5,a5,0x10
80009abc:	0107d793          	srli	a5,a5,0x10
80009ac0:	00d70023          	sb	a3,0(a4)
80009ac4:	00f407b3          	add	a5,s0,a5
80009ac8:	00200713          	li	a4,2
80009acc:	00e78023          	sb	a4,0(a5)
80009ad0:	02c95603          	lhu	a2,44(s2)
80009ad4:	01051513          	slli	a0,a0,0x10
80009ad8:	00040593          	mv	a1,s0
80009adc:	01055513          	srli	a0,a0,0x10
80009ae0:	00a11723          	sh	a0,14(sp)
80009ae4:	ac1ff0ef          	jal	ra,800095a4 <dhcp_option_short>
80009ae8:	00a407b3          	add	a5,s0,a0
80009aec:	03200713          	li	a4,50
80009af0:	00e78023          	sb	a4,0(a5)
80009af4:	00150793          	addi	a5,a0,1
80009af8:	01079793          	slli	a5,a5,0x10
80009afc:	0107d793          	srli	a5,a5,0x10
80009b00:	00f407b3          	add	a5,s0,a5
80009b04:	00400a93          	li	s5,4
80009b08:	01578023          	sb	s5,0(a5)
80009b0c:	00250a13          	addi	s4,a0,2
80009b10:	01c4a503          	lw	a0,28(s1)
80009b14:	010a1a13          	slli	s4,s4,0x10
80009b18:	010a5a13          	srli	s4,s4,0x10
80009b1c:	01411723          	sh	s4,14(sp)
80009b20:	bd1fc0ef          	jal	ra,800066f0 <lwip_htonl>
80009b24:	00050613          	mv	a2,a0
80009b28:	00040593          	mv	a1,s0
80009b2c:	000a0513          	mv	a0,s4
80009b30:	aa5ff0ef          	jal	ra,800095d4 <dhcp_option_long>
80009b34:	00a407b3          	add	a5,s0,a0
80009b38:	03600713          	li	a4,54
80009b3c:	00e78023          	sb	a4,0(a5)
80009b40:	00150793          	addi	a5,a0,1
80009b44:	01079793          	slli	a5,a5,0x10
80009b48:	0107d793          	srli	a5,a5,0x10
80009b4c:	00f407b3          	add	a5,s0,a5
80009b50:	01578023          	sb	s5,0(a5)
80009b54:	00250a13          	addi	s4,a0,2
80009b58:	0184a503          	lw	a0,24(s1)
80009b5c:	010a1a13          	slli	s4,s4,0x10
80009b60:	010a5a13          	srli	s4,s4,0x10
80009b64:	01411723          	sh	s4,14(sp)
80009b68:	b89fc0ef          	jal	ra,800066f0 <lwip_htonl>
80009b6c:	00050613          	mv	a2,a0
80009b70:	00040593          	mv	a1,s0
80009b74:	000a0513          	mv	a0,s4
80009b78:	a5dff0ef          	jal	ra,800095d4 <dhcp_option_long>
80009b7c:	00a40733          	add	a4,s0,a0
80009b80:	03700693          	li	a3,55
80009b84:	00d70023          	sb	a3,0(a4)
80009b88:	00150713          	addi	a4,a0,1
80009b8c:	01071713          	slli	a4,a4,0x10
80009b90:	01075713          	srli	a4,a4,0x10
80009b94:	00300693          	li	a3,3
80009b98:	00e40733          	add	a4,s0,a4
80009b9c:	00d70023          	sb	a3,0(a4)
80009ba0:	00250713          	addi	a4,a0,2
80009ba4:	01071713          	slli	a4,a4,0x10
80009ba8:	01075713          	srli	a4,a4,0x10
80009bac:	00e40733          	add	a4,s0,a4
80009bb0:	00100613          	li	a2,1
80009bb4:	00c70023          	sb	a2,0(a4)
80009bb8:	00050793          	mv	a5,a0
80009bbc:	00350713          	addi	a4,a0,3
80009bc0:	01071713          	slli	a4,a4,0x10
80009bc4:	00478793          	addi	a5,a5,4
80009bc8:	01075713          	srli	a4,a4,0x10
80009bcc:	01079793          	slli	a5,a5,0x10
80009bd0:	00e40733          	add	a4,s0,a4
80009bd4:	00550513          	addi	a0,a0,5
80009bd8:	0107d793          	srli	a5,a5,0x10
80009bdc:	00d70023          	sb	a3,0(a4)
80009be0:	00f407b3          	add	a5,s0,a5
80009be4:	01c00713          	li	a4,28
80009be8:	01051513          	slli	a0,a0,0x10
80009bec:	00e78023          	sb	a4,0(a5)
80009bf0:	01055513          	srli	a0,a0,0x10
80009bf4:	00040593          	mv	a1,s0
80009bf8:	00098613          	mv	a2,s3
80009bfc:	00a11723          	sh	a0,14(sp)
80009c00:	bd9ff0ef          	jal	ra,800097d8 <dhcp_option_trailer>
80009c04:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
80009c08:	84818793          	addi	a5,gp,-1976 # 800032b8 <ip_addr_any>
80009c0c:	00090713          	mv	a4,s2
80009c10:	04300693          	li	a3,67
80009c14:	84418613          	addi	a2,gp,-1980 # 800032b4 <ip_addr_broadcast>
80009c18:	00098593          	mv	a1,s3
80009c1c:	c8cff0ef          	jal	ra,800090a8 <udp_sendto_if_src>
80009c20:	00050413          	mv	s0,a0
80009c24:	00098513          	mv	a0,s3
80009c28:	cd5fd0ef          	jal	ra,800078fc <pbuf_free>
80009c2c:	0064c783          	lbu	a5,6(s1)
80009c30:	0ff00713          	li	a4,255
80009c34:	00e78663          	beq	a5,a4,80009c40 <dhcp_select+0x208>
80009c38:	00178793          	addi	a5,a5,1
80009c3c:	00f48323          	sb	a5,6(s1)
80009c40:	0064c783          	lbu	a5,6(s1)
80009c44:	00500713          	li	a4,5
80009c48:	06f76063          	bltu	a4,a5,80009ca8 <dhcp_select+0x270>
80009c4c:	00100513          	li	a0,1
80009c50:	00f51533          	sll	a0,a0,a5
80009c54:	00551793          	slli	a5,a0,0x5
80009c58:	40a787b3          	sub	a5,a5,a0
80009c5c:	00279793          	slli	a5,a5,0x2
80009c60:	00f50533          	add	a0,a0,a5
80009c64:	00351513          	slli	a0,a0,0x3
80009c68:	01051513          	slli	a0,a0,0x10
80009c6c:	01055513          	srli	a0,a0,0x10
80009c70:	1f400593          	li	a1,500
80009c74:	1f350513          	addi	a0,a0,499
80009c78:	7f1030ef          	jal	ra,8000dc68 <__divsi3>
80009c7c:	00a49423          	sh	a0,8(s1)
80009c80:	00040513          	mv	a0,s0
80009c84:	02c12083          	lw	ra,44(sp)
80009c88:	02812403          	lw	s0,40(sp)
80009c8c:	02412483          	lw	s1,36(sp)
80009c90:	02012903          	lw	s2,32(sp)
80009c94:	01c12983          	lw	s3,28(sp)
80009c98:	01812a03          	lw	s4,24(sp)
80009c9c:	01412a83          	lw	s5,20(sp)
80009ca0:	03010113          	addi	sp,sp,48
80009ca4:	00008067          	ret
80009ca8:	0000f537          	lui	a0,0xf
80009cac:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xda60>
80009cb0:	fc1ff06f          	j	80009c70 <dhcp_select+0x238>

80009cb4 <dhcp_discover>:
80009cb4:	fd010113          	addi	sp,sp,-48
80009cb8:	01312e23          	sw	s3,28(sp)
80009cbc:	02112623          	sw	ra,44(sp)
80009cc0:	02812423          	sw	s0,40(sp)
80009cc4:	02912223          	sw	s1,36(sp)
80009cc8:	03212023          	sw	s2,32(sp)
80009ccc:	02852483          	lw	s1,40(a0)
80009cd0:	00050993          	mv	s3,a0
80009cd4:	00600593          	li	a1,6
80009cd8:	00048513          	mv	a0,s1
80009cdc:	0004ae23          	sw	zero,28(s1)
80009ce0:	8adff0ef          	jal	ra,8000958c <dhcp_set_state>
80009ce4:	00e10693          	addi	a3,sp,14
80009ce8:	00100613          	li	a2,1
80009cec:	00048593          	mv	a1,s1
80009cf0:	00098513          	mv	a0,s3
80009cf4:	941ff0ef          	jal	ra,80009634 <dhcp_create_msg>
80009cf8:	10050063          	beqz	a0,80009df8 <dhcp_discover+0x144>
80009cfc:	00452403          	lw	s0,4(a0)
80009d00:	00e15783          	lhu	a5,14(sp)
80009d04:	00050913          	mv	s2,a0
80009d08:	0f040413          	addi	s0,s0,240
80009d0c:	00f40733          	add	a4,s0,a5
80009d10:	00278513          	addi	a0,a5,2
80009d14:	00178793          	addi	a5,a5,1
80009d18:	01079793          	slli	a5,a5,0x10
80009d1c:	03900693          	li	a3,57
80009d20:	0107d793          	srli	a5,a5,0x10
80009d24:	00d70023          	sb	a3,0(a4)
80009d28:	00f407b3          	add	a5,s0,a5
80009d2c:	00200713          	li	a4,2
80009d30:	00e78023          	sb	a4,0(a5)
80009d34:	02c9d603          	lhu	a2,44(s3)
80009d38:	01051513          	slli	a0,a0,0x10
80009d3c:	01055513          	srli	a0,a0,0x10
80009d40:	00040593          	mv	a1,s0
80009d44:	00a11723          	sh	a0,14(sp)
80009d48:	85dff0ef          	jal	ra,800095a4 <dhcp_option_short>
80009d4c:	00a40733          	add	a4,s0,a0
80009d50:	03700693          	li	a3,55
80009d54:	00d70023          	sb	a3,0(a4)
80009d58:	00150713          	addi	a4,a0,1
80009d5c:	01071713          	slli	a4,a4,0x10
80009d60:	01075713          	srli	a4,a4,0x10
80009d64:	00300613          	li	a2,3
80009d68:	00e40733          	add	a4,s0,a4
80009d6c:	00c70023          	sb	a2,0(a4)
80009d70:	00250713          	addi	a4,a0,2
80009d74:	01071713          	slli	a4,a4,0x10
80009d78:	01075713          	srli	a4,a4,0x10
80009d7c:	00e40733          	add	a4,s0,a4
80009d80:	00100693          	li	a3,1
80009d84:	00d70023          	sb	a3,0(a4)
80009d88:	00050793          	mv	a5,a0
80009d8c:	00350693          	addi	a3,a0,3
80009d90:	01069693          	slli	a3,a3,0x10
80009d94:	00478793          	addi	a5,a5,4
80009d98:	0106d693          	srli	a3,a3,0x10
80009d9c:	01079793          	slli	a5,a5,0x10
80009da0:	00d406b3          	add	a3,s0,a3
80009da4:	00550513          	addi	a0,a0,5
80009da8:	0107d793          	srli	a5,a5,0x10
80009dac:	00c68023          	sb	a2,0(a3)
80009db0:	00f407b3          	add	a5,s0,a5
80009db4:	01c00713          	li	a4,28
80009db8:	01051513          	slli	a0,a0,0x10
80009dbc:	00e78023          	sb	a4,0(a5)
80009dc0:	01055513          	srli	a0,a0,0x10
80009dc4:	00090613          	mv	a2,s2
80009dc8:	00040593          	mv	a1,s0
80009dcc:	00a11723          	sh	a0,14(sp)
80009dd0:	a09ff0ef          	jal	ra,800097d8 <dhcp_option_trailer>
80009dd4:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
80009dd8:	84818793          	addi	a5,gp,-1976 # 800032b8 <ip_addr_any>
80009ddc:	00098713          	mv	a4,s3
80009de0:	04300693          	li	a3,67
80009de4:	84418613          	addi	a2,gp,-1980 # 800032b4 <ip_addr_broadcast>
80009de8:	00090593          	mv	a1,s2
80009dec:	abcff0ef          	jal	ra,800090a8 <udp_sendto_if_src>
80009df0:	00090513          	mv	a0,s2
80009df4:	b09fd0ef          	jal	ra,800078fc <pbuf_free>
80009df8:	0064c783          	lbu	a5,6(s1)
80009dfc:	0ff00713          	li	a4,255
80009e00:	00e78663          	beq	a5,a4,80009e0c <dhcp_discover+0x158>
80009e04:	00178793          	addi	a5,a5,1
80009e08:	00f48323          	sb	a5,6(s1)
80009e0c:	0064c783          	lbu	a5,6(s1)
80009e10:	00500713          	li	a4,5
80009e14:	04f76c63          	bltu	a4,a5,80009e6c <dhcp_discover+0x1b8>
80009e18:	00100513          	li	a0,1
80009e1c:	00f51533          	sll	a0,a0,a5
80009e20:	00551793          	slli	a5,a0,0x5
80009e24:	40a787b3          	sub	a5,a5,a0
80009e28:	00279793          	slli	a5,a5,0x2
80009e2c:	00f50533          	add	a0,a0,a5
80009e30:	00351513          	slli	a0,a0,0x3
80009e34:	01051513          	slli	a0,a0,0x10
80009e38:	01055513          	srli	a0,a0,0x10
80009e3c:	1f400593          	li	a1,500
80009e40:	1f350513          	addi	a0,a0,499
80009e44:	625030ef          	jal	ra,8000dc68 <__divsi3>
80009e48:	00a49423          	sh	a0,8(s1)
80009e4c:	02c12083          	lw	ra,44(sp)
80009e50:	02812403          	lw	s0,40(sp)
80009e54:	02412483          	lw	s1,36(sp)
80009e58:	02012903          	lw	s2,32(sp)
80009e5c:	01c12983          	lw	s3,28(sp)
80009e60:	00000513          	li	a0,0
80009e64:	03010113          	addi	sp,sp,48
80009e68:	00008067          	ret
80009e6c:	0000f537          	lui	a0,0xf
80009e70:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xda60>
80009e74:	fc9ff06f          	j	80009e3c <dhcp_discover+0x188>

80009e78 <dhcp_check>:
80009e78:	ff010113          	addi	sp,sp,-16
80009e7c:	00112623          	sw	ra,12(sp)
80009e80:	00912223          	sw	s1,4(sp)
80009e84:	00812423          	sw	s0,8(sp)
80009e88:	02852403          	lw	s0,40(a0)
80009e8c:	00050493          	mv	s1,a0
80009e90:	00800593          	li	a1,8
80009e94:	00040513          	mv	a0,s0
80009e98:	ef4ff0ef          	jal	ra,8000958c <dhcp_set_state>
80009e9c:	00000613          	li	a2,0
80009ea0:	01c40593          	addi	a1,s0,28
80009ea4:	00048513          	mv	a0,s1
80009ea8:	4b5010ef          	jal	ra,8000bb5c <etharp_query>
80009eac:	00644783          	lbu	a5,6(s0)
80009eb0:	0ff00713          	li	a4,255
80009eb4:	00e78663          	beq	a5,a4,80009ec0 <dhcp_check+0x48>
80009eb8:	00178793          	addi	a5,a5,1
80009ebc:	00f40323          	sb	a5,6(s0)
80009ec0:	00100793          	li	a5,1
80009ec4:	00f41423          	sh	a5,8(s0)
80009ec8:	00c12083          	lw	ra,12(sp)
80009ecc:	00812403          	lw	s0,8(sp)
80009ed0:	00412483          	lw	s1,4(sp)
80009ed4:	01010113          	addi	sp,sp,16
80009ed8:	00008067          	ret

80009edc <dhcp_bind>:
80009edc:	1a050863          	beqz	a0,8000a08c <dhcp_bind+0x1b0>
80009ee0:	fe010113          	addi	sp,sp,-32
80009ee4:	00112e23          	sw	ra,28(sp)
80009ee8:	00812c23          	sw	s0,24(sp)
80009eec:	00912a23          	sw	s1,20(sp)
80009ef0:	02852403          	lw	s0,40(a0)
80009ef4:	10040a63          	beqz	s0,8000a008 <dhcp_bind+0x12c>
80009ef8:	00050493          	mv	s1,a0
80009efc:	02842503          	lw	a0,40(s0)
80009f00:	00041923          	sh	zero,18(s0)
80009f04:	fff00793          	li	a5,-1
80009f08:	02f50463          	beq	a0,a5,80009f30 <dhcp_bind+0x54>
80009f0c:	01e50513          	addi	a0,a0,30
80009f10:	003c07b7          	lui	a5,0x3c0
80009f14:	10f57463          	bgeu	a0,a5,8000a01c <dhcp_bind+0x140>
80009f18:	03c00593          	li	a1,60
80009f1c:	555030ef          	jal	ra,8000dc70 <__udivsi3>
80009f20:	01051793          	slli	a5,a0,0x10
80009f24:	0107d793          	srli	a5,a5,0x10
80009f28:	10050063          	beqz	a0,8000a028 <dhcp_bind+0x14c>
80009f2c:	00f41a23          	sh	a5,20(s0)
80009f30:	02c42503          	lw	a0,44(s0)
80009f34:	fff00793          	li	a5,-1
80009f38:	02f50863          	beq	a0,a5,80009f68 <dhcp_bind+0x8c>
80009f3c:	01e50513          	addi	a0,a0,30
80009f40:	003c07b7          	lui	a5,0x3c0
80009f44:	0ef57663          	bgeu	a0,a5,8000a030 <dhcp_bind+0x154>
80009f48:	03c00593          	li	a1,60
80009f4c:	525030ef          	jal	ra,8000dc70 <__udivsi3>
80009f50:	01051793          	slli	a5,a0,0x10
80009f54:	0107d793          	srli	a5,a5,0x10
80009f58:	0e050263          	beqz	a0,8000a03c <dhcp_bind+0x160>
80009f5c:	00f41523          	sh	a5,10(s0)
80009f60:	00a45783          	lhu	a5,10(s0)
80009f64:	00f41723          	sh	a5,14(s0)
80009f68:	03042503          	lw	a0,48(s0)
80009f6c:	fff00793          	li	a5,-1
80009f70:	02f50863          	beq	a0,a5,80009fa0 <dhcp_bind+0xc4>
80009f74:	01e50513          	addi	a0,a0,30
80009f78:	003c07b7          	lui	a5,0x3c0
80009f7c:	0cf57463          	bgeu	a0,a5,8000a044 <dhcp_bind+0x168>
80009f80:	03c00593          	li	a1,60
80009f84:	4ed030ef          	jal	ra,8000dc70 <__udivsi3>
80009f88:	01051793          	slli	a5,a0,0x10
80009f8c:	0107d793          	srli	a5,a5,0x10
80009f90:	0c050063          	beqz	a0,8000a050 <dhcp_bind+0x174>
80009f94:	00f41623          	sh	a5,12(s0)
80009f98:	00c45783          	lhu	a5,12(s0)
80009f9c:	00f41823          	sh	a5,16(s0)
80009fa0:	00c45783          	lhu	a5,12(s0)
80009fa4:	00a45703          	lhu	a4,10(s0)
80009fa8:	00f76663          	bltu	a4,a5,80009fb4 <dhcp_bind+0xd8>
80009fac:	00078463          	beqz	a5,80009fb4 <dhcp_bind+0xd8>
80009fb0:	00041523          	sh	zero,10(s0)
80009fb4:	00744783          	lbu	a5,7(s0)
80009fb8:	0a078063          	beqz	a5,8000a058 <dhcp_bind+0x17c>
80009fbc:	02042783          	lw	a5,32(s0)
80009fc0:	00f12423          	sw	a5,8(sp)
80009fc4:	02442783          	lw	a5,36(s0)
80009fc8:	00f12623          	sw	a5,12(sp)
80009fcc:	00079e63          	bnez	a5,80009fe8 <dhcp_bind+0x10c>
80009fd0:	00812703          	lw	a4,8(sp)
80009fd4:	01c42783          	lw	a5,28(s0)
80009fd8:	00e7f7b3          	and	a5,a5,a4
80009fdc:	01000737          	lui	a4,0x1000
80009fe0:	00e7e7b3          	or	a5,a5,a4
80009fe4:	00f12623          	sw	a5,12(sp)
80009fe8:	00a00593          	li	a1,10
80009fec:	00040513          	mv	a0,s0
80009ff0:	d9cff0ef          	jal	ra,8000958c <dhcp_set_state>
80009ff4:	00c10693          	addi	a3,sp,12
80009ff8:	00810613          	addi	a2,sp,8
80009ffc:	01c40593          	addi	a1,s0,28
8000a000:	00048513          	mv	a0,s1
8000a004:	9c0fd0ef          	jal	ra,800071c4 <netif_set_addr>
8000a008:	01c12083          	lw	ra,28(sp)
8000a00c:	01812403          	lw	s0,24(sp)
8000a010:	01412483          	lw	s1,20(sp)
8000a014:	02010113          	addi	sp,sp,32
8000a018:	00008067          	ret
8000a01c:	000107b7          	lui	a5,0x10
8000a020:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xefff>
8000a024:	f09ff06f          	j	80009f2c <dhcp_bind+0x50>
8000a028:	00100793          	li	a5,1
8000a02c:	f01ff06f          	j	80009f2c <dhcp_bind+0x50>
8000a030:	000107b7          	lui	a5,0x10
8000a034:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xefff>
8000a038:	f25ff06f          	j	80009f5c <dhcp_bind+0x80>
8000a03c:	00100793          	li	a5,1
8000a040:	f1dff06f          	j	80009f5c <dhcp_bind+0x80>
8000a044:	000107b7          	lui	a5,0x10
8000a048:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xefff>
8000a04c:	f49ff06f          	j	80009f94 <dhcp_bind+0xb8>
8000a050:	00100793          	li	a5,1
8000a054:	f41ff06f          	j	80009f94 <dhcp_bind+0xb8>
8000a058:	01c44783          	lbu	a5,28(s0)
8000a05c:	01879713          	slli	a4,a5,0x18
8000a060:	41875713          	srai	a4,a4,0x18
8000a064:	00074663          	bltz	a4,8000a070 <dhcp_bind+0x194>
8000a068:	0ff00793          	li	a5,255
8000a06c:	f55ff06f          	j	80009fc0 <dhcp_bind+0xe4>
8000a070:	0bf00713          	li	a4,191
8000a074:	00f77863          	bgeu	a4,a5,8000a084 <dhcp_bind+0x1a8>
8000a078:	010007b7          	lui	a5,0x1000
8000a07c:	fff78793          	addi	a5,a5,-1 # ffffff <_stack_size+0xffefff>
8000a080:	f41ff06f          	j	80009fc0 <dhcp_bind+0xe4>
8000a084:	000107b7          	lui	a5,0x10
8000a088:	ff5ff06f          	j	8000a07c <dhcp_bind+0x1a0>
8000a08c:	00008067          	ret

8000a090 <dhcp_inc_pcb_refcount>:
8000a090:	ff010113          	addi	sp,sp,-16
8000a094:	00812423          	sw	s0,8(sp)
8000a098:	9081c783          	lbu	a5,-1784(gp) # 80003378 <dhcp_pcb_refcount>
8000a09c:	00112623          	sw	ra,12(sp)
8000a0a0:	00912223          	sw	s1,4(sp)
8000a0a4:	01212023          	sw	s2,0(sp)
8000a0a8:	04079863          	bnez	a5,8000a0f8 <dhcp_inc_pcb_refcount+0x68>
8000a0ac:	c4cff0ef          	jal	ra,800094f8 <udp_new>
8000a0b0:	90a1a623          	sw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000a0b4:	fff00713          	li	a4,-1
8000a0b8:	04050863          	beqz	a0,8000a108 <dhcp_inc_pcb_refcount+0x78>
8000a0bc:	00954703          	lbu	a4,9(a0)
8000a0c0:	04400613          	li	a2,68
8000a0c4:	02076713          	ori	a4,a4,32
8000a0c8:	00e504a3          	sb	a4,9(a0)
8000a0cc:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
8000a0d0:	ee9fe0ef          	jal	ra,80008fb8 <udp_bind>
8000a0d4:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000a0d8:	04300613          	li	a2,67
8000a0dc:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
8000a0e0:	af8ff0ef          	jal	ra,800093d8 <udp_connect>
8000a0e4:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000a0e8:	8000a5b7          	lui	a1,0x8000a
8000a0ec:	00000613          	li	a2,0
8000a0f0:	25058593          	addi	a1,a1,592 # 8000a250 <_ram_heap_end+0xffff2250>
8000a0f4:	bb0ff0ef          	jal	ra,800094a4 <udp_recv>
8000a0f8:	9081c783          	lbu	a5,-1784(gp) # 80003378 <dhcp_pcb_refcount>
8000a0fc:	00000713          	li	a4,0
8000a100:	00178793          	addi	a5,a5,1 # 10001 <_stack_size+0xf001>
8000a104:	90f18423          	sb	a5,-1784(gp) # 80003378 <dhcp_pcb_refcount>
8000a108:	00c12083          	lw	ra,12(sp)
8000a10c:	00812403          	lw	s0,8(sp)
8000a110:	00412483          	lw	s1,4(sp)
8000a114:	00012903          	lw	s2,0(sp)
8000a118:	00070513          	mv	a0,a4
8000a11c:	01010113          	addi	sp,sp,16
8000a120:	00008067          	ret

8000a124 <dhcp_handle_ack.isra.0>:
8000a124:	ff010113          	addi	sp,sp,-16
8000a128:	00912223          	sw	s1,4(sp)
8000a12c:	00812423          	sw	s0,8(sp)
8000a130:	00112623          	sw	ra,12(sp)
8000a134:	91018793          	addi	a5,gp,-1776 # 80003380 <dhcp_rx_options_given>
8000a138:	0037c783          	lbu	a5,3(a5)
8000a13c:	02052023          	sw	zero,32(a0)
8000a140:	02052223          	sw	zero,36(a0)
8000a144:	00050413          	mv	s0,a0
8000a148:	91018493          	addi	s1,gp,-1776 # 80003380 <dhcp_rx_options_given>
8000a14c:	00078663          	beqz	a5,8000a158 <dhcp_handle_ack.isra.0+0x34>
8000a150:	b581a783          	lw	a5,-1192(gp) # 800035c8 <dhcp_rx_options_val+0xc>
8000a154:	02f52423          	sw	a5,40(a0)
8000a158:	0044c783          	lbu	a5,4(s1)
8000a15c:	08078663          	beqz	a5,8000a1e8 <dhcp_handle_ack.isra.0+0xc4>
8000a160:	b5c1a783          	lw	a5,-1188(gp) # 800035cc <dhcp_rx_options_val+0x10>
8000a164:	02f42623          	sw	a5,44(s0)
8000a168:	0054c783          	lbu	a5,5(s1)
8000a16c:	08078463          	beqz	a5,8000a1f4 <dhcp_handle_ack.isra.0+0xd0>
8000a170:	b601a783          	lw	a5,-1184(gp) # 800035d0 <dhcp_rx_options_val+0x14>
8000a174:	02f42823          	sw	a5,48(s0)
8000a178:	0115c703          	lbu	a4,17(a1)
8000a17c:	0105c783          	lbu	a5,16(a1)
8000a180:	00871713          	slli	a4,a4,0x8
8000a184:	00f76733          	or	a4,a4,a5
8000a188:	0125c783          	lbu	a5,18(a1)
8000a18c:	01079793          	slli	a5,a5,0x10
8000a190:	00e7e733          	or	a4,a5,a4
8000a194:	0135c783          	lbu	a5,19(a1)
8000a198:	01879793          	slli	a5,a5,0x18
8000a19c:	00e7e7b3          	or	a5,a5,a4
8000a1a0:	00f42e23          	sw	a5,28(s0)
8000a1a4:	0064c783          	lbu	a5,6(s1)
8000a1a8:	06078063          	beqz	a5,8000a208 <dhcp_handle_ack.isra.0+0xe4>
8000a1ac:	b641a503          	lw	a0,-1180(gp) # 800035d4 <dhcp_rx_options_val+0x18>
8000a1b0:	d40fc0ef          	jal	ra,800066f0 <lwip_htonl>
8000a1b4:	00100793          	li	a5,1
8000a1b8:	02a42023          	sw	a0,32(s0)
8000a1bc:	00f403a3          	sb	a5,7(s0)
8000a1c0:	0074c783          	lbu	a5,7(s1)
8000a1c4:	00078863          	beqz	a5,8000a1d4 <dhcp_handle_ack.isra.0+0xb0>
8000a1c8:	b681a503          	lw	a0,-1176(gp) # 800035d8 <dhcp_rx_options_val+0x1c>
8000a1cc:	d24fc0ef          	jal	ra,800066f0 <lwip_htonl>
8000a1d0:	02a42223          	sw	a0,36(s0)
8000a1d4:	00c12083          	lw	ra,12(sp)
8000a1d8:	00812403          	lw	s0,8(sp)
8000a1dc:	00412483          	lw	s1,4(sp)
8000a1e0:	01010113          	addi	sp,sp,16
8000a1e4:	00008067          	ret
8000a1e8:	02842783          	lw	a5,40(s0)
8000a1ec:	0017d793          	srli	a5,a5,0x1
8000a1f0:	f75ff06f          	j	8000a164 <dhcp_handle_ack.isra.0+0x40>
8000a1f4:	02842703          	lw	a4,40(s0)
8000a1f8:	00371793          	slli	a5,a4,0x3
8000a1fc:	40e787b3          	sub	a5,a5,a4
8000a200:	0037d793          	srli	a5,a5,0x3
8000a204:	f71ff06f          	j	8000a174 <dhcp_handle_ack.isra.0+0x50>
8000a208:	000403a3          	sb	zero,7(s0)
8000a20c:	fb5ff06f          	j	8000a1c0 <dhcp_handle_ack.isra.0+0x9c>

8000a210 <dhcp_dec_pcb_refcount>:
8000a210:	9081c783          	lbu	a5,-1784(gp) # 80003378 <dhcp_pcb_refcount>
8000a214:	fff78793          	addi	a5,a5,-1
8000a218:	0ff7f793          	andi	a5,a5,255
8000a21c:	90f18423          	sb	a5,-1784(gp) # 80003378 <dhcp_pcb_refcount>
8000a220:	02079663          	bnez	a5,8000a24c <dhcp_dec_pcb_refcount+0x3c>
8000a224:	ff010113          	addi	sp,sp,-16
8000a228:	00812423          	sw	s0,8(sp)
8000a22c:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000a230:	00112623          	sw	ra,12(sp)
8000a234:	a80ff0ef          	jal	ra,800094b4 <udp_remove>
8000a238:	00c12083          	lw	ra,12(sp)
8000a23c:	9001a623          	sw	zero,-1780(gp) # 8000337c <dhcp_pcb>
8000a240:	00812403          	lw	s0,8(sp)
8000a244:	01010113          	addi	sp,sp,16
8000a248:	00008067          	ret
8000a24c:	00008067          	ret

8000a250 <dhcp_recv>:
8000a250:	fa010113          	addi	sp,sp,-96
8000a254:	05212823          	sw	s2,80(sp)
8000a258:	a181a903          	lw	s2,-1512(gp) # 80003488 <ip_data+0x4>
8000a25c:	05312623          	sw	s3,76(sp)
8000a260:	04112e23          	sw	ra,92(sp)
8000a264:	04812c23          	sw	s0,88(sp)
8000a268:	04912a23          	sw	s1,84(sp)
8000a26c:	05412423          	sw	s4,72(sp)
8000a270:	05512223          	sw	s5,68(sp)
8000a274:	05612023          	sw	s6,64(sp)
8000a278:	03712e23          	sw	s7,60(sp)
8000a27c:	03812c23          	sw	s8,56(sp)
8000a280:	03912a23          	sw	s9,52(sp)
8000a284:	03a12823          	sw	s10,48(sp)
8000a288:	03b12623          	sw	s11,44(sp)
8000a28c:	02892b83          	lw	s7,40(s2)
8000a290:	00060993          	mv	s3,a2
8000a294:	0e0b8663          	beqz	s7,8000a380 <dhcp_recv+0x130>
8000a298:	004bc783          	lbu	a5,4(s7)
8000a29c:	0e078263          	beqz	a5,8000a380 <dhcp_recv+0x130>
8000a2a0:	00a65703          	lhu	a4,10(a2)
8000a2a4:	02b00793          	li	a5,43
8000a2a8:	0ce7fc63          	bgeu	a5,a4,8000a380 <dhcp_recv+0x130>
8000a2ac:	00462783          	lw	a5,4(a2)
8000a2b0:	00200713          	li	a4,2
8000a2b4:	0007c683          	lbu	a3,0(a5)
8000a2b8:	0ce69463          	bne	a3,a4,8000a380 <dhcp_recv+0x130>
8000a2bc:	03494603          	lbu	a2,52(s2)
8000a2c0:	00000713          	li	a4,0
8000a2c4:	00600693          	li	a3,6
8000a2c8:	0ff77593          	andi	a1,a4,255
8000a2cc:	00c5f463          	bgeu	a1,a2,8000a2d4 <dhcp_recv+0x84>
8000a2d0:	08d71c63          	bne	a4,a3,8000a368 <dhcp_recv+0x118>
8000a2d4:	0057c503          	lbu	a0,5(a5)
8000a2d8:	0047c703          	lbu	a4,4(a5)
8000a2dc:	00851513          	slli	a0,a0,0x8
8000a2e0:	00e56533          	or	a0,a0,a4
8000a2e4:	0067c703          	lbu	a4,6(a5)
8000a2e8:	01071713          	slli	a4,a4,0x10
8000a2ec:	00a76733          	or	a4,a4,a0
8000a2f0:	0077c503          	lbu	a0,7(a5)
8000a2f4:	01851513          	slli	a0,a0,0x18
8000a2f8:	00e56533          	or	a0,a0,a4
8000a2fc:	bf4fc0ef          	jal	ra,800066f0 <lwip_htonl>
8000a300:	000ba783          	lw	a5,0(s7)
8000a304:	06f51e63          	bne	a0,a5,8000a380 <dhcp_recv+0x130>
8000a308:	91018793          	addi	a5,gp,-1776 # 80003380 <dhcp_rx_options_given>
8000a30c:	0007a223          	sw	zero,4(a5)
8000a310:	00a9d703          	lhu	a4,10(s3)
8000a314:	0007a023          	sw	zero,0(a5)
8000a318:	02b00793          	li	a5,43
8000a31c:	91018813          	addi	a6,gp,-1776 # 80003380 <dhcp_rx_options_given>
8000a320:	06e7f063          	bgeu	a5,a4,8000a380 <dhcp_recv+0x130>
8000a324:	00010ab7          	lui	s5,0x10
8000a328:	ffda8793          	addi	a5,s5,-3 # fffd <_stack_size+0xeffd>
8000a32c:	0089dd83          	lhu	s11,8(s3)
8000a330:	00f12423          	sw	a5,8(sp)
8000a334:	b4c18793          	addi	a5,gp,-1204 # 800035bc <dhcp_rx_options_val>
8000a338:	00000b13          	li	s6,0
8000a33c:	0f000d13          	li	s10,240
8000a340:	00f12223          	sw	a5,4(sp)
8000a344:	00098c13          	mv	s8,s3
8000a348:	00ac5783          	lhu	a5,10(s8)
8000a34c:	06fd7c63          	bgeu	s10,a5,8000a3c4 <dhcp_recv+0x174>
8000a350:	004c2783          	lw	a5,4(s8)
8000a354:	000d0413          	mv	s0,s10
8000a358:	00400a93          	li	s5,4
8000a35c:	00f12023          	sw	a5,0(sp)
8000a360:	00100a13          	li	s4,1
8000a364:	25c0006f          	j	8000a5c0 <dhcp_recv+0x370>
8000a368:	00e905b3          	add	a1,s2,a4
8000a36c:	00170713          	addi	a4,a4,1 # 1000001 <_stack_size+0xfff001>
8000a370:	00e78533          	add	a0,a5,a4
8000a374:	02e5c583          	lbu	a1,46(a1)
8000a378:	01b54503          	lbu	a0,27(a0)
8000a37c:	f4b506e3          	beq	a0,a1,8000a2c8 <dhcp_recv+0x78>
8000a380:	00098513          	mv	a0,s3
8000a384:	d78fd0ef          	jal	ra,800078fc <pbuf_free>
8000a388:	05c12083          	lw	ra,92(sp)
8000a38c:	05812403          	lw	s0,88(sp)
8000a390:	05412483          	lw	s1,84(sp)
8000a394:	05012903          	lw	s2,80(sp)
8000a398:	04c12983          	lw	s3,76(sp)
8000a39c:	04812a03          	lw	s4,72(sp)
8000a3a0:	04412a83          	lw	s5,68(sp)
8000a3a4:	04012b03          	lw	s6,64(sp)
8000a3a8:	03c12b83          	lw	s7,60(sp)
8000a3ac:	03812c03          	lw	s8,56(sp)
8000a3b0:	03412c83          	lw	s9,52(sp)
8000a3b4:	03012d03          	lw	s10,48(sp)
8000a3b8:	02c12d83          	lw	s11,44(sp)
8000a3bc:	06010113          	addi	sp,sp,96
8000a3c0:	00008067          	ret
8000a3c4:	000c2c03          	lw	s8,0(s8)
8000a3c8:	40fd0d33          	sub	s10,s10,a5
8000a3cc:	40fd8db3          	sub	s11,s11,a5
8000a3d0:	010d1d13          	slli	s10,s10,0x10
8000a3d4:	010d9d93          	slli	s11,s11,0x10
8000a3d8:	010d5d13          	srli	s10,s10,0x10
8000a3dc:	010ddd93          	srli	s11,s11,0x10
8000a3e0:	f60c14e3          	bnez	s8,8000a348 <dhcp_recv+0xf8>
8000a3e4:	f9dff06f          	j	8000a380 <dhcp_recv+0x130>
8000a3e8:	00240693          	addi	a3,s0,2
8000a3ec:	01069693          	slli	a3,a3,0x10
8000a3f0:	0106d693          	srli	a3,a3,0x10
8000a3f4:	f886e6e3          	bltu	a3,s0,8000a380 <dhcp_recv+0x130>
8000a3f8:	00ac5583          	lhu	a1,10(s8)
8000a3fc:	00140613          	addi	a2,s0,1
8000a400:	02b65c63          	bge	a2,a1,8000a438 <dhcp_recv+0x1e8>
8000a404:	00174703          	lbu	a4,1(a4)
8000a408:	03400593          	li	a1,52
8000a40c:	12b78263          	beq	a5,a1,8000a530 <dhcp_recv+0x2e0>
8000a410:	02f5ee63          	bltu	a1,a5,8000a44c <dhcp_recv+0x1fc>
8000a414:	07478263          	beq	a5,s4,8000a478 <dhcp_recv+0x228>
8000a418:	16078663          	beqz	a5,8000a584 <dhcp_recv+0x334>
8000a41c:	00300613          	li	a2,3
8000a420:	0ec78663          	beq	a5,a2,8000a50c <dhcp_recv+0x2bc>
8000a424:	03300613          	li	a2,51
8000a428:	0ec78a63          	beq	a5,a2,8000a51c <dhcp_recv+0x2cc>
8000a42c:	fff00493          	li	s1,-1
8000a430:	00000c93          	li	s9,0
8000a434:	0500006f          	j	8000a484 <dhcp_recv+0x234>
8000a438:	000c2703          	lw	a4,0(s8)
8000a43c:	32070263          	beqz	a4,8000a760 <dhcp_recv+0x510>
8000a440:	00472703          	lw	a4,4(a4)
8000a444:	00074703          	lbu	a4,0(a4)
8000a448:	fc1ff06f          	j	8000a408 <dhcp_recv+0x1b8>
8000a44c:	03600613          	li	a2,54
8000a450:	10c78863          	beq	a5,a2,8000a560 <dhcp_recv+0x310>
8000a454:	0ec7ec63          	bltu	a5,a2,8000a54c <dhcp_recv+0x2fc>
8000a458:	03a00613          	li	a2,58
8000a45c:	10c78c63          	beq	a5,a2,8000a574 <dhcp_recv+0x324>
8000a460:	03b00613          	li	a2,59
8000a464:	fcc794e3          	bne	a5,a2,8000a42c <dhcp_recv+0x1dc>
8000a468:	f1571ce3          	bne	a4,s5,8000a380 <dhcp_recv+0x130>
8000a46c:	00400c93          	li	s9,4
8000a470:	00500493          	li	s1,5
8000a474:	0100006f          	j	8000a484 <dhcp_recv+0x234>
8000a478:	f15714e3          	bne	a4,s5,8000a380 <dhcp_recv+0x130>
8000a47c:	00400c93          	li	s9,4
8000a480:	00600493          	li	s1,6
8000a484:	00812783          	lw	a5,8(sp)
8000a488:	00870433          	add	s0,a4,s0
8000a48c:	ee87cae3          	blt	a5,s0,8000a380 <dhcp_recv+0x130>
8000a490:	00e68733          	add	a4,a3,a4
8000a494:	01071413          	slli	s0,a4,0x10
8000a498:	01045413          	srli	s0,s0,0x10
8000a49c:	0e0c8863          	beqz	s9,8000a58c <dhcp_recv+0x33c>
8000a4a0:	009807b3          	add	a5,a6,s1
8000a4a4:	0007c783          	lbu	a5,0(a5)
8000a4a8:	00012e23          	sw	zero,28(sp)
8000a4ac:	0e079063          	bnez	a5,8000a58c <dhcp_recv+0x33c>
8000a4b0:	010c9793          	slli	a5,s9,0x10
8000a4b4:	0107d793          	srli	a5,a5,0x10
8000a4b8:	00078613          	mv	a2,a5
8000a4bc:	01c10593          	addi	a1,sp,28
8000a4c0:	000c0513          	mv	a0,s8
8000a4c4:	00f12623          	sw	a5,12(sp)
8000a4c8:	a19fd0ef          	jal	ra,80007ee0 <pbuf_copy_partial>
8000a4cc:	00c12783          	lw	a5,12(sp)
8000a4d0:	eaa798e3          	bne	a5,a0,8000a380 <dhcp_recv+0x130>
8000a4d4:	91018813          	addi	a6,gp,-1776 # 80003380 <dhcp_rx_options_given>
8000a4d8:	155c9a63          	bne	s9,s5,8000a62c <dhcp_recv+0x3dc>
8000a4dc:	01c12503          	lw	a0,28(sp)
8000a4e0:	a10fc0ef          	jal	ra,800066f0 <lwip_htonl>
8000a4e4:	00a12e23          	sw	a0,28(sp)
8000a4e8:	91018813          	addi	a6,gp,-1776 # 80003380 <dhcp_rx_options_given>
8000a4ec:	009807b3          	add	a5,a6,s1
8000a4f0:	01478023          	sb	s4,0(a5)
8000a4f4:	00412783          	lw	a5,4(sp)
8000a4f8:	00249493          	slli	s1,s1,0x2
8000a4fc:	009784b3          	add	s1,a5,s1
8000a500:	01c12783          	lw	a5,28(sp)
8000a504:	00f4a023          	sw	a5,0(s1)
8000a508:	0840006f          	j	8000a58c <dhcp_recv+0x33c>
8000a50c:	e6e7fae3          	bgeu	a5,a4,8000a380 <dhcp_recv+0x130>
8000a510:	00700493          	li	s1,7
8000a514:	00400c93          	li	s9,4
8000a518:	f6dff06f          	j	8000a484 <dhcp_recv+0x234>
8000a51c:	e75712e3          	bne	a4,s5,8000a380 <dhcp_recv+0x130>
8000a520:	00400c93          	li	s9,4
8000a524:	00300493          	li	s1,3
8000a528:	f5dff06f          	j	8000a484 <dhcp_recv+0x234>
8000a52c:	00000713          	li	a4,0
8000a530:	e54718e3          	bne	a4,s4,8000a380 <dhcp_recv+0x130>
8000a534:	0f000793          	li	a5,240
8000a538:	e4fd14e3          	bne	s10,a5,8000a380 <dhcp_recv+0x130>
8000a53c:	00100c93          	li	s9,1
8000a540:	00000493          	li	s1,0
8000a544:	f41ff06f          	j	8000a484 <dhcp_recv+0x234>
8000a548:	00000713          	li	a4,0
8000a54c:	e3471ae3          	bne	a4,s4,8000a380 <dhcp_recv+0x130>
8000a550:	00100c93          	li	s9,1
8000a554:	00100493          	li	s1,1
8000a558:	f2dff06f          	j	8000a484 <dhcp_recv+0x234>
8000a55c:	00000713          	li	a4,0
8000a560:	e35710e3          	bne	a4,s5,8000a380 <dhcp_recv+0x130>
8000a564:	00400c93          	li	s9,4
8000a568:	00200493          	li	s1,2
8000a56c:	f19ff06f          	j	8000a484 <dhcp_recv+0x234>
8000a570:	00000713          	li	a4,0
8000a574:	e15716e3          	bne	a4,s5,8000a380 <dhcp_recv+0x130>
8000a578:	00400c93          	li	s9,4
8000a57c:	00400493          	li	s1,4
8000a580:	f05ff06f          	j	8000a484 <dhcp_recv+0x234>
8000a584:	01061413          	slli	s0,a2,0x10
8000a588:	01045413          	srli	s0,s0,0x10
8000a58c:	00ac5783          	lhu	a5,10(s8)
8000a590:	02f46863          	bltu	s0,a5,8000a5c0 <dhcp_recv+0x370>
8000a594:	40f40433          	sub	s0,s0,a5
8000a598:	40fd8db3          	sub	s11,s11,a5
8000a59c:	01041413          	slli	s0,s0,0x10
8000a5a0:	010d9d93          	slli	s11,s11,0x10
8000a5a4:	01045413          	srli	s0,s0,0x10
8000a5a8:	010ddd93          	srli	s11,s11,0x10
8000a5ac:	ddb47ae3          	bgeu	s0,s11,8000a380 <dhcp_recv+0x130>
8000a5b0:	000c2c03          	lw	s8,0(s8)
8000a5b4:	dc0c06e3          	beqz	s8,8000a380 <dhcp_recv+0x130>
8000a5b8:	004c2783          	lw	a5,4(s8)
8000a5bc:	00f12023          	sw	a5,0(sp)
8000a5c0:	01b47c63          	bgeu	s0,s11,8000a5d8 <dhcp_recv+0x388>
8000a5c4:	00012783          	lw	a5,0(sp)
8000a5c8:	0ff00693          	li	a3,255
8000a5cc:	00878733          	add	a4,a5,s0
8000a5d0:	00074783          	lbu	a5,0(a4)
8000a5d4:	e0d79ae3          	bne	a5,a3,8000a3e8 <dhcp_recv+0x198>
8000a5d8:	00084783          	lbu	a5,0(a6)
8000a5dc:	06079063          	bnez	a5,8000a63c <dhcp_recv+0x3ec>
8000a5e0:	060b1c63          	bnez	s6,8000a658 <dhcp_recv+0x408>
8000a5e4:	00184783          	lbu	a5,1(a6)
8000a5e8:	d8078ce3          	beqz	a5,8000a380 <dhcp_recv+0x130>
8000a5ec:	b4c18793          	addi	a5,gp,-1204 # 800035bc <dhcp_rx_options_val>
8000a5f0:	0047c703          	lbu	a4,4(a5)
8000a5f4:	00500693          	li	a3,5
8000a5f8:	0049a583          	lw	a1,4(s3)
8000a5fc:	0ad71463          	bne	a4,a3,8000a6a4 <dhcp_recv+0x454>
8000a600:	005bc783          	lbu	a5,5(s7)
8000a604:	00100713          	li	a4,1
8000a608:	06e79c63          	bne	a5,a4,8000a680 <dhcp_recv+0x430>
8000a60c:	02892503          	lw	a0,40(s2)
8000a610:	b15ff0ef          	jal	ra,8000a124 <dhcp_handle_ack.isra.0>
8000a614:	03594783          	lbu	a5,53(s2)
8000a618:	00090513          	mv	a0,s2
8000a61c:	0087f793          	andi	a5,a5,8
8000a620:	06078e63          	beqz	a5,8000a69c <dhcp_recv+0x44c>
8000a624:	855ff0ef          	jal	ra,80009e78 <dhcp_check>
8000a628:	d59ff06f          	j	8000a380 <dhcp_recv+0x130>
8000a62c:	d54c9ae3          	bne	s9,s4,8000a380 <dhcp_recv+0x130>
8000a630:	01c14783          	lbu	a5,28(sp)
8000a634:	00f12e23          	sw	a5,28(sp)
8000a638:	eb5ff06f          	j	8000a4ec <dhcp_recv+0x29c>
8000a63c:	00412783          	lw	a5,4(sp)
8000a640:	00080023          	sb	zero,0(a6)
8000a644:	00100713          	li	a4,1
8000a648:	0007a783          	lw	a5,0(a5)
8000a64c:	02e78463          	beq	a5,a4,8000a674 <dhcp_recv+0x424>
8000a650:	00200713          	li	a4,2
8000a654:	00e79a63          	bne	a5,a4,8000a668 <dhcp_recv+0x418>
8000a658:	00000b13          	li	s6,0
8000a65c:	06c00d93          	li	s11,108
8000a660:	02c00d13          	li	s10,44
8000a664:	ce1ff06f          	j	8000a344 <dhcp_recv+0xf4>
8000a668:	00300713          	li	a4,3
8000a66c:	f6e79ae3          	bne	a5,a4,8000a5e0 <dhcp_recv+0x390>
8000a670:	00100b13          	li	s6,1
8000a674:	0ec00d93          	li	s11,236
8000a678:	06c00d13          	li	s10,108
8000a67c:	cc9ff06f          	j	8000a344 <dhcp_recv+0xf4>
8000a680:	ffd78793          	addi	a5,a5,-3
8000a684:	0ff7f793          	andi	a5,a5,255
8000a688:	00200713          	li	a4,2
8000a68c:	cef76ae3          	bltu	a4,a5,8000a380 <dhcp_recv+0x130>
8000a690:	02892503          	lw	a0,40(s2)
8000a694:	a91ff0ef          	jal	ra,8000a124 <dhcp_handle_ack.isra.0>
8000a698:	00090513          	mv	a0,s2
8000a69c:	841ff0ef          	jal	ra,80009edc <dhcp_bind>
8000a6a0:	ce1ff06f          	j	8000a380 <dhcp_recv+0x130>
8000a6a4:	00600693          	li	a3,6
8000a6a8:	04d71663          	bne	a4,a3,8000a6f4 <dhcp_recv+0x4a4>
8000a6ac:	005bc703          	lbu	a4,5(s7)
8000a6b0:	00200693          	li	a3,2
8000a6b4:	ffd70793          	addi	a5,a4,-3
8000a6b8:	0ff7f793          	andi	a5,a5,255
8000a6bc:	00f6f663          	bgeu	a3,a5,8000a6c8 <dhcp_recv+0x478>
8000a6c0:	00100793          	li	a5,1
8000a6c4:	caf71ee3          	bne	a4,a5,8000a380 <dhcp_recv+0x130>
8000a6c8:	02892503          	lw	a0,40(s2)
8000a6cc:	00c00593          	li	a1,12
8000a6d0:	ebdfe0ef          	jal	ra,8000958c <dhcp_set_state>
8000a6d4:	84818693          	addi	a3,gp,-1976 # 800032b8 <ip_addr_any>
8000a6d8:	84818613          	addi	a2,gp,-1976 # 800032b8 <ip_addr_any>
8000a6dc:	00090513          	mv	a0,s2
8000a6e0:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
8000a6e4:	ae1fc0ef          	jal	ra,800071c4 <netif_set_addr>
8000a6e8:	00090513          	mv	a0,s2
8000a6ec:	dc8ff0ef          	jal	ra,80009cb4 <dhcp_discover>
8000a6f0:	c91ff06f          	j	8000a380 <dhcp_recv+0x130>
8000a6f4:	00200613          	li	a2,2
8000a6f8:	c8c714e3          	bne	a4,a2,8000a380 <dhcp_recv+0x130>
8000a6fc:	005bc703          	lbu	a4,5(s7)
8000a700:	c8d710e3          	bne	a4,a3,8000a380 <dhcp_recv+0x130>
8000a704:	00284703          	lbu	a4,2(a6)
8000a708:	c6070ce3          	beqz	a4,8000a380 <dhcp_recv+0x130>
8000a70c:	02892403          	lw	s0,40(s2)
8000a710:	00b12023          	sw	a1,0(sp)
8000a714:	00041423          	sh	zero,8(s0)
8000a718:	0087a503          	lw	a0,8(a5)
8000a71c:	fd5fb0ef          	jal	ra,800066f0 <lwip_htonl>
8000a720:	00012583          	lw	a1,0(sp)
8000a724:	00a42c23          	sw	a0,24(s0)
8000a728:	00090513          	mv	a0,s2
8000a72c:	0115c703          	lbu	a4,17(a1)
8000a730:	0105c783          	lbu	a5,16(a1)
8000a734:	00871713          	slli	a4,a4,0x8
8000a738:	00f76733          	or	a4,a4,a5
8000a73c:	0125c783          	lbu	a5,18(a1)
8000a740:	01079793          	slli	a5,a5,0x10
8000a744:	00e7e733          	or	a4,a5,a4
8000a748:	0135c783          	lbu	a5,19(a1)
8000a74c:	01879793          	slli	a5,a5,0x18
8000a750:	00e7e7b3          	or	a5,a5,a4
8000a754:	00f42e23          	sw	a5,28(s0)
8000a758:	ae0ff0ef          	jal	ra,80009a38 <dhcp_select>
8000a75c:	c25ff06f          	j	8000a380 <dhcp_recv+0x130>
8000a760:	03400713          	li	a4,52
8000a764:	dce784e3          	beq	a5,a4,8000a52c <dhcp_recv+0x2dc>
8000a768:	02f76263          	bltu	a4,a5,8000a78c <dhcp_recv+0x53c>
8000a76c:	c1478ae3          	beq	a5,s4,8000a380 <dhcp_recv+0x130>
8000a770:	e0078ae3          	beqz	a5,8000a584 <dhcp_recv+0x334>
8000a774:	00300713          	li	a4,3
8000a778:	c0e784e3          	beq	a5,a4,8000a380 <dhcp_recv+0x130>
8000a77c:	03300713          	li	a4,51
8000a780:	c0e780e3          	beq	a5,a4,8000a380 <dhcp_recv+0x130>
8000a784:	00000713          	li	a4,0
8000a788:	ca5ff06f          	j	8000a42c <dhcp_recv+0x1dc>
8000a78c:	03600713          	li	a4,54
8000a790:	dce786e3          	beq	a5,a4,8000a55c <dhcp_recv+0x30c>
8000a794:	dae7eae3          	bltu	a5,a4,8000a548 <dhcp_recv+0x2f8>
8000a798:	03a00713          	li	a4,58
8000a79c:	dce78ae3          	beq	a5,a4,8000a570 <dhcp_recv+0x320>
8000a7a0:	03b00613          	li	a2,59
8000a7a4:	00000713          	li	a4,0
8000a7a8:	cbdff06f          	j	8000a464 <dhcp_recv+0x214>

8000a7ac <dhcp_set_struct>:
8000a7ac:	ff010113          	addi	sp,sp,-16
8000a7b0:	00058793          	mv	a5,a1
8000a7b4:	00812423          	sw	s0,8(sp)
8000a7b8:	03400613          	li	a2,52
8000a7bc:	00050413          	mv	s0,a0
8000a7c0:	00000593          	li	a1,0
8000a7c4:	00078513          	mv	a0,a5
8000a7c8:	00112623          	sw	ra,12(sp)
8000a7cc:	595020ef          	jal	ra,8000d560 <memset>
8000a7d0:	02a42423          	sw	a0,40(s0)
8000a7d4:	00c12083          	lw	ra,12(sp)
8000a7d8:	00812403          	lw	s0,8(sp)
8000a7dc:	01010113          	addi	sp,sp,16
8000a7e0:	00008067          	ret

8000a7e4 <dhcp_cleanup>:
8000a7e4:	02852783          	lw	a5,40(a0)
8000a7e8:	02078863          	beqz	a5,8000a818 <dhcp_cleanup+0x34>
8000a7ec:	ff010113          	addi	sp,sp,-16
8000a7f0:	00812423          	sw	s0,8(sp)
8000a7f4:	00050413          	mv	s0,a0
8000a7f8:	00078513          	mv	a0,a5
8000a7fc:	00112623          	sw	ra,12(sp)
8000a800:	f0cfc0ef          	jal	ra,80006f0c <lwip_free>
8000a804:	02042423          	sw	zero,40(s0)
8000a808:	00c12083          	lw	ra,12(sp)
8000a80c:	00812403          	lw	s0,8(sp)
8000a810:	01010113          	addi	sp,sp,16
8000a814:	00008067          	ret
8000a818:	00008067          	ret

8000a81c <dhcp_inform>:
8000a81c:	0e050a63          	beqz	a0,8000a910 <dhcp_inform+0xf4>
8000a820:	fb010113          	addi	sp,sp,-80
8000a824:	04812423          	sw	s0,72(sp)
8000a828:	04112623          	sw	ra,76(sp)
8000a82c:	04912223          	sw	s1,68(sp)
8000a830:	05212023          	sw	s2,64(sp)
8000a834:	00050413          	mv	s0,a0
8000a838:	859ff0ef          	jal	ra,8000a090 <dhcp_inc_pcb_refcount>
8000a83c:	0a051e63          	bnez	a0,8000a8f8 <dhcp_inform+0xdc>
8000a840:	03400613          	li	a2,52
8000a844:	00000593          	li	a1,0
8000a848:	00c10513          	addi	a0,sp,12
8000a84c:	515020ef          	jal	ra,8000d560 <memset>
8000a850:	00700593          	li	a1,7
8000a854:	00c10513          	addi	a0,sp,12
8000a858:	d35fe0ef          	jal	ra,8000958c <dhcp_set_state>
8000a85c:	00a10693          	addi	a3,sp,10
8000a860:	00800613          	li	a2,8
8000a864:	00c10593          	addi	a1,sp,12
8000a868:	00040513          	mv	a0,s0
8000a86c:	dc9fe0ef          	jal	ra,80009634 <dhcp_create_msg>
8000a870:	00050913          	mv	s2,a0
8000a874:	08050063          	beqz	a0,8000a8f4 <dhcp_inform+0xd8>
8000a878:	00452483          	lw	s1,4(a0)
8000a87c:	00a15783          	lhu	a5,10(sp)
8000a880:	03900693          	li	a3,57
8000a884:	0f048493          	addi	s1,s1,240
8000a888:	00f48733          	add	a4,s1,a5
8000a88c:	00278513          	addi	a0,a5,2
8000a890:	00178793          	addi	a5,a5,1
8000a894:	01079793          	slli	a5,a5,0x10
8000a898:	0107d793          	srli	a5,a5,0x10
8000a89c:	00d70023          	sb	a3,0(a4)
8000a8a0:	00f487b3          	add	a5,s1,a5
8000a8a4:	00200713          	li	a4,2
8000a8a8:	00e78023          	sb	a4,0(a5)
8000a8ac:	02c45603          	lhu	a2,44(s0)
8000a8b0:	01051513          	slli	a0,a0,0x10
8000a8b4:	01055513          	srli	a0,a0,0x10
8000a8b8:	00048593          	mv	a1,s1
8000a8bc:	00a11523          	sh	a0,10(sp)
8000a8c0:	ce5fe0ef          	jal	ra,800095a4 <dhcp_option_short>
8000a8c4:	00090613          	mv	a2,s2
8000a8c8:	00048593          	mv	a1,s1
8000a8cc:	00a11523          	sh	a0,10(sp)
8000a8d0:	f09fe0ef          	jal	ra,800097d8 <dhcp_option_trailer>
8000a8d4:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000a8d8:	00040713          	mv	a4,s0
8000a8dc:	04300693          	li	a3,67
8000a8e0:	84418613          	addi	a2,gp,-1980 # 800032b4 <ip_addr_broadcast>
8000a8e4:	00090593          	mv	a1,s2
8000a8e8:	9b5fe0ef          	jal	ra,8000929c <udp_sendto_if>
8000a8ec:	00090513          	mv	a0,s2
8000a8f0:	80cfd0ef          	jal	ra,800078fc <pbuf_free>
8000a8f4:	91dff0ef          	jal	ra,8000a210 <dhcp_dec_pcb_refcount>
8000a8f8:	04c12083          	lw	ra,76(sp)
8000a8fc:	04812403          	lw	s0,72(sp)
8000a900:	04412483          	lw	s1,68(sp)
8000a904:	04012903          	lw	s2,64(sp)
8000a908:	05010113          	addi	sp,sp,80
8000a90c:	00008067          	ret
8000a910:	00008067          	ret

8000a914 <dhcp_network_changed>:
8000a914:	02852783          	lw	a5,40(a0)
8000a918:	02078a63          	beqz	a5,8000a94c <dhcp_network_changed+0x38>
8000a91c:	0057c703          	lbu	a4,5(a5)
8000a920:	00500693          	li	a3,5
8000a924:	00e6ec63          	bltu	a3,a4,8000a93c <dhcp_network_changed+0x28>
8000a928:	00300693          	li	a3,3
8000a92c:	00d77c63          	bgeu	a4,a3,8000a944 <dhcp_network_changed+0x30>
8000a930:	00070e63          	beqz	a4,8000a94c <dhcp_network_changed+0x38>
8000a934:	00078323          	sb	zero,6(a5)
8000a938:	b7cff06f          	j	80009cb4 <dhcp_discover>
8000a93c:	00a00693          	li	a3,10
8000a940:	fed71ae3          	bne	a4,a3,8000a934 <dhcp_network_changed+0x20>
8000a944:	00078323          	sb	zero,6(a5)
8000a948:	ee1fe06f          	j	80009828 <dhcp_reboot>
8000a94c:	00008067          	ret

8000a950 <dhcp_arp_reply>:
8000a950:	12050a63          	beqz	a0,8000aa84 <dhcp_arp_reply+0x134>
8000a954:	fd010113          	addi	sp,sp,-48
8000a958:	02112623          	sw	ra,44(sp)
8000a95c:	02812423          	sw	s0,40(sp)
8000a960:	02912223          	sw	s1,36(sp)
8000a964:	03212023          	sw	s2,32(sp)
8000a968:	01312e23          	sw	s3,28(sp)
8000a96c:	01412c23          	sw	s4,24(sp)
8000a970:	02852403          	lw	s0,40(a0)
8000a974:	0e040863          	beqz	s0,8000aa64 <dhcp_arp_reply+0x114>
8000a978:	00544703          	lbu	a4,5(s0)
8000a97c:	00800793          	li	a5,8
8000a980:	0ef71263          	bne	a4,a5,8000aa64 <dhcp_arp_reply+0x114>
8000a984:	0005a703          	lw	a4,0(a1)
8000a988:	01c42783          	lw	a5,28(s0)
8000a98c:	0cf71c63          	bne	a4,a5,8000aa64 <dhcp_arp_reply+0x114>
8000a990:	00050a13          	mv	s4,a0
8000a994:	00c00593          	li	a1,12
8000a998:	00040513          	mv	a0,s0
8000a99c:	bf1fe0ef          	jal	ra,8000958c <dhcp_set_state>
8000a9a0:	00e10693          	addi	a3,sp,14
8000a9a4:	00400613          	li	a2,4
8000a9a8:	00040593          	mv	a1,s0
8000a9ac:	000a0513          	mv	a0,s4
8000a9b0:	c85fe0ef          	jal	ra,80009634 <dhcp_create_msg>
8000a9b4:	00050913          	mv	s2,a0
8000a9b8:	08050863          	beqz	a0,8000aa48 <dhcp_arp_reply+0xf8>
8000a9bc:	00452483          	lw	s1,4(a0)
8000a9c0:	00e15783          	lhu	a5,14(sp)
8000a9c4:	03200693          	li	a3,50
8000a9c8:	0f048493          	addi	s1,s1,240
8000a9cc:	00f48733          	add	a4,s1,a5
8000a9d0:	00278993          	addi	s3,a5,2
8000a9d4:	00178793          	addi	a5,a5,1
8000a9d8:	01079793          	slli	a5,a5,0x10
8000a9dc:	0107d793          	srli	a5,a5,0x10
8000a9e0:	00d70023          	sb	a3,0(a4)
8000a9e4:	00f487b3          	add	a5,s1,a5
8000a9e8:	00400713          	li	a4,4
8000a9ec:	00e78023          	sb	a4,0(a5)
8000a9f0:	01c42503          	lw	a0,28(s0)
8000a9f4:	01099993          	slli	s3,s3,0x10
8000a9f8:	0109d993          	srli	s3,s3,0x10
8000a9fc:	01311723          	sh	s3,14(sp)
8000aa00:	cf1fb0ef          	jal	ra,800066f0 <lwip_htonl>
8000aa04:	00050613          	mv	a2,a0
8000aa08:	00048593          	mv	a1,s1
8000aa0c:	00098513          	mv	a0,s3
8000aa10:	bc5fe0ef          	jal	ra,800095d4 <dhcp_option_long>
8000aa14:	00090613          	mv	a2,s2
8000aa18:	00048593          	mv	a1,s1
8000aa1c:	00a11723          	sh	a0,14(sp)
8000aa20:	db9fe0ef          	jal	ra,800097d8 <dhcp_option_trailer>
8000aa24:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000aa28:	84818793          	addi	a5,gp,-1976 # 800032b8 <ip_addr_any>
8000aa2c:	000a0713          	mv	a4,s4
8000aa30:	04300693          	li	a3,67
8000aa34:	84418613          	addi	a2,gp,-1980 # 800032b4 <ip_addr_broadcast>
8000aa38:	00090593          	mv	a1,s2
8000aa3c:	e6cfe0ef          	jal	ra,800090a8 <udp_sendto_if_src>
8000aa40:	00090513          	mv	a0,s2
8000aa44:	eb9fc0ef          	jal	ra,800078fc <pbuf_free>
8000aa48:	00644783          	lbu	a5,6(s0)
8000aa4c:	0ff00713          	li	a4,255
8000aa50:	00e78663          	beq	a5,a4,8000aa5c <dhcp_arp_reply+0x10c>
8000aa54:	00178793          	addi	a5,a5,1
8000aa58:	00f40323          	sb	a5,6(s0)
8000aa5c:	01400793          	li	a5,20
8000aa60:	00f41423          	sh	a5,8(s0)
8000aa64:	02c12083          	lw	ra,44(sp)
8000aa68:	02812403          	lw	s0,40(sp)
8000aa6c:	02412483          	lw	s1,36(sp)
8000aa70:	02012903          	lw	s2,32(sp)
8000aa74:	01c12983          	lw	s3,28(sp)
8000aa78:	01812a03          	lw	s4,24(sp)
8000aa7c:	03010113          	addi	sp,sp,48
8000aa80:	00008067          	ret
8000aa84:	00008067          	ret

8000aa88 <dhcp_renew>:
8000aa88:	fd010113          	addi	sp,sp,-48
8000aa8c:	02112623          	sw	ra,44(sp)
8000aa90:	02812423          	sw	s0,40(sp)
8000aa94:	01312e23          	sw	s3,28(sp)
8000aa98:	02912223          	sw	s1,36(sp)
8000aa9c:	03212023          	sw	s2,32(sp)
8000aaa0:	02852483          	lw	s1,40(a0)
8000aaa4:	00050993          	mv	s3,a0
8000aaa8:	00500593          	li	a1,5
8000aaac:	00048513          	mv	a0,s1
8000aab0:	addfe0ef          	jal	ra,8000958c <dhcp_set_state>
8000aab4:	00e10693          	addi	a3,sp,14
8000aab8:	00300613          	li	a2,3
8000aabc:	00048593          	mv	a1,s1
8000aac0:	00098513          	mv	a0,s3
8000aac4:	b71fe0ef          	jal	ra,80009634 <dhcp_create_msg>
8000aac8:	fff00413          	li	s0,-1
8000aacc:	10050063          	beqz	a0,8000abcc <dhcp_renew+0x144>
8000aad0:	00452403          	lw	s0,4(a0)
8000aad4:	00e15783          	lhu	a5,14(sp)
8000aad8:	00050913          	mv	s2,a0
8000aadc:	0f040413          	addi	s0,s0,240
8000aae0:	00f40733          	add	a4,s0,a5
8000aae4:	00278513          	addi	a0,a5,2
8000aae8:	00178793          	addi	a5,a5,1
8000aaec:	01079793          	slli	a5,a5,0x10
8000aaf0:	03900693          	li	a3,57
8000aaf4:	0107d793          	srli	a5,a5,0x10
8000aaf8:	00d70023          	sb	a3,0(a4)
8000aafc:	00f407b3          	add	a5,s0,a5
8000ab00:	00200713          	li	a4,2
8000ab04:	00e78023          	sb	a4,0(a5)
8000ab08:	02c9d603          	lhu	a2,44(s3)
8000ab0c:	01051513          	slli	a0,a0,0x10
8000ab10:	00040593          	mv	a1,s0
8000ab14:	01055513          	srli	a0,a0,0x10
8000ab18:	00a11723          	sh	a0,14(sp)
8000ab1c:	a89fe0ef          	jal	ra,800095a4 <dhcp_option_short>
8000ab20:	00a40733          	add	a4,s0,a0
8000ab24:	03700693          	li	a3,55
8000ab28:	00d70023          	sb	a3,0(a4)
8000ab2c:	00150713          	addi	a4,a0,1
8000ab30:	01071713          	slli	a4,a4,0x10
8000ab34:	01075713          	srli	a4,a4,0x10
8000ab38:	00e40733          	add	a4,s0,a4
8000ab3c:	00300613          	li	a2,3
8000ab40:	00c70023          	sb	a2,0(a4)
8000ab44:	00250713          	addi	a4,a0,2
8000ab48:	01071713          	slli	a4,a4,0x10
8000ab4c:	01075713          	srli	a4,a4,0x10
8000ab50:	00e40733          	add	a4,s0,a4
8000ab54:	00100693          	li	a3,1
8000ab58:	00d70023          	sb	a3,0(a4)
8000ab5c:	00050793          	mv	a5,a0
8000ab60:	00350693          	addi	a3,a0,3
8000ab64:	01069693          	slli	a3,a3,0x10
8000ab68:	00478793          	addi	a5,a5,4
8000ab6c:	0106d693          	srli	a3,a3,0x10
8000ab70:	01079793          	slli	a5,a5,0x10
8000ab74:	00d406b3          	add	a3,s0,a3
8000ab78:	00550513          	addi	a0,a0,5
8000ab7c:	0107d793          	srli	a5,a5,0x10
8000ab80:	00c68023          	sb	a2,0(a3)
8000ab84:	00f407b3          	add	a5,s0,a5
8000ab88:	01c00713          	li	a4,28
8000ab8c:	01051513          	slli	a0,a0,0x10
8000ab90:	00e78023          	sb	a4,0(a5)
8000ab94:	01055513          	srli	a0,a0,0x10
8000ab98:	00040593          	mv	a1,s0
8000ab9c:	00090613          	mv	a2,s2
8000aba0:	00a11723          	sh	a0,14(sp)
8000aba4:	c35fe0ef          	jal	ra,800097d8 <dhcp_option_trailer>
8000aba8:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000abac:	00098713          	mv	a4,s3
8000abb0:	04300693          	li	a3,67
8000abb4:	01848613          	addi	a2,s1,24
8000abb8:	00090593          	mv	a1,s2
8000abbc:	ee0fe0ef          	jal	ra,8000929c <udp_sendto_if>
8000abc0:	00050413          	mv	s0,a0
8000abc4:	00090513          	mv	a0,s2
8000abc8:	d35fc0ef          	jal	ra,800078fc <pbuf_free>
8000abcc:	0064c783          	lbu	a5,6(s1)
8000abd0:	0ff00713          	li	a4,255
8000abd4:	00e78663          	beq	a5,a4,8000abe0 <dhcp_renew+0x158>
8000abd8:	00178793          	addi	a5,a5,1
8000abdc:	00f48323          	sb	a5,6(s1)
8000abe0:	0064c503          	lbu	a0,6(s1)
8000abe4:	00900793          	li	a5,9
8000abe8:	04a7e863          	bltu	a5,a0,8000ac38 <dhcp_renew+0x1b0>
8000abec:	00551793          	slli	a5,a0,0x5
8000abf0:	40a787b3          	sub	a5,a5,a0
8000abf4:	00279793          	slli	a5,a5,0x2
8000abf8:	00f50533          	add	a0,a0,a5
8000abfc:	00451513          	slli	a0,a0,0x4
8000ac00:	01051513          	slli	a0,a0,0x10
8000ac04:	01055513          	srli	a0,a0,0x10
8000ac08:	1f400593          	li	a1,500
8000ac0c:	1f350513          	addi	a0,a0,499
8000ac10:	058030ef          	jal	ra,8000dc68 <__divsi3>
8000ac14:	00a49423          	sh	a0,8(s1)
8000ac18:	02c12083          	lw	ra,44(sp)
8000ac1c:	00040513          	mv	a0,s0
8000ac20:	02812403          	lw	s0,40(sp)
8000ac24:	02412483          	lw	s1,36(sp)
8000ac28:	02012903          	lw	s2,32(sp)
8000ac2c:	01c12983          	lw	s3,28(sp)
8000ac30:	03010113          	addi	sp,sp,48
8000ac34:	00008067          	ret
8000ac38:	00005537          	lui	a0,0x5
8000ac3c:	e2050513          	addi	a0,a0,-480 # 4e20 <_stack_size+0x3e20>
8000ac40:	fc9ff06f          	j	8000ac08 <dhcp_renew+0x180>

8000ac44 <dhcp_supplied_address>:
8000ac44:	02050863          	beqz	a0,8000ac74 <dhcp_supplied_address+0x30>
8000ac48:	02852783          	lw	a5,40(a0)
8000ac4c:	00000513          	li	a0,0
8000ac50:	02078463          	beqz	a5,8000ac78 <dhcp_supplied_address+0x34>
8000ac54:	0057c783          	lbu	a5,5(a5)
8000ac58:	00a00713          	li	a4,10
8000ac5c:	00100513          	li	a0,1
8000ac60:	00e78663          	beq	a5,a4,8000ac6c <dhcp_supplied_address+0x28>
8000ac64:	ffc78513          	addi	a0,a5,-4
8000ac68:	00253513          	sltiu	a0,a0,2
8000ac6c:	0ff57513          	andi	a0,a0,255
8000ac70:	00008067          	ret
8000ac74:	00000513          	li	a0,0
8000ac78:	00008067          	ret

8000ac7c <dhcp_release_and_stop>:
8000ac7c:	fd010113          	addi	sp,sp,-48
8000ac80:	02112623          	sw	ra,44(sp)
8000ac84:	02812423          	sw	s0,40(sp)
8000ac88:	02912223          	sw	s1,36(sp)
8000ac8c:	03212023          	sw	s2,32(sp)
8000ac90:	01312e23          	sw	s3,28(sp)
8000ac94:	01412c23          	sw	s4,24(sp)
8000ac98:	02852403          	lw	s0,40(a0)
8000ac9c:	10040e63          	beqz	s0,8000adb8 <dhcp_release_and_stop+0x13c>
8000aca0:	00544783          	lbu	a5,5(s0)
8000aca4:	10078a63          	beqz	a5,8000adb8 <dhcp_release_and_stop+0x13c>
8000aca8:	01842783          	lw	a5,24(s0)
8000acac:	00042e23          	sw	zero,28(s0)
8000acb0:	00042c23          	sw	zero,24(s0)
8000acb4:	02042023          	sw	zero,32(s0)
8000acb8:	02042223          	sw	zero,36(s0)
8000acbc:	02042823          	sw	zero,48(s0)
8000acc0:	02042623          	sw	zero,44(s0)
8000acc4:	02042423          	sw	zero,40(s0)
8000acc8:	00041723          	sh	zero,14(s0)
8000accc:	00042823          	sw	zero,16(s0)
8000acd0:	00041a23          	sh	zero,20(s0)
8000acd4:	00050493          	mv	s1,a0
8000acd8:	00f12623          	sw	a5,12(sp)
8000acdc:	f69ff0ef          	jal	ra,8000ac44 <dhcp_supplied_address>
8000ace0:	0a050463          	beqz	a0,8000ad88 <dhcp_release_and_stop+0x10c>
8000ace4:	00a10693          	addi	a3,sp,10
8000ace8:	00700613          	li	a2,7
8000acec:	00040593          	mv	a1,s0
8000acf0:	00048513          	mv	a0,s1
8000acf4:	941fe0ef          	jal	ra,80009634 <dhcp_create_msg>
8000acf8:	00050993          	mv	s3,a0
8000acfc:	08050663          	beqz	a0,8000ad88 <dhcp_release_and_stop+0x10c>
8000ad00:	00452903          	lw	s2,4(a0)
8000ad04:	00a15783          	lhu	a5,10(sp)
8000ad08:	03600693          	li	a3,54
8000ad0c:	0f090913          	addi	s2,s2,240
8000ad10:	00f90733          	add	a4,s2,a5
8000ad14:	00278a13          	addi	s4,a5,2
8000ad18:	00178793          	addi	a5,a5,1
8000ad1c:	01079793          	slli	a5,a5,0x10
8000ad20:	0107d793          	srli	a5,a5,0x10
8000ad24:	00d70023          	sb	a3,0(a4)
8000ad28:	00f907b3          	add	a5,s2,a5
8000ad2c:	00400713          	li	a4,4
8000ad30:	00e78023          	sb	a4,0(a5)
8000ad34:	00c12503          	lw	a0,12(sp)
8000ad38:	010a1a13          	slli	s4,s4,0x10
8000ad3c:	010a5a13          	srli	s4,s4,0x10
8000ad40:	01411523          	sh	s4,10(sp)
8000ad44:	9adfb0ef          	jal	ra,800066f0 <lwip_htonl>
8000ad48:	00050613          	mv	a2,a0
8000ad4c:	00090593          	mv	a1,s2
8000ad50:	000a0513          	mv	a0,s4
8000ad54:	881fe0ef          	jal	ra,800095d4 <dhcp_option_long>
8000ad58:	00098613          	mv	a2,s3
8000ad5c:	00090593          	mv	a1,s2
8000ad60:	00a11523          	sh	a0,10(sp)
8000ad64:	a75fe0ef          	jal	ra,800097d8 <dhcp_option_trailer>
8000ad68:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000ad6c:	00048713          	mv	a4,s1
8000ad70:	04300693          	li	a3,67
8000ad74:	00c10613          	addi	a2,sp,12
8000ad78:	00098593          	mv	a1,s3
8000ad7c:	d20fe0ef          	jal	ra,8000929c <udp_sendto_if>
8000ad80:	00098513          	mv	a0,s3
8000ad84:	b79fc0ef          	jal	ra,800078fc <pbuf_free>
8000ad88:	84818693          	addi	a3,gp,-1976 # 800032b8 <ip_addr_any>
8000ad8c:	84818613          	addi	a2,gp,-1976 # 800032b8 <ip_addr_any>
8000ad90:	00048513          	mv	a0,s1
8000ad94:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
8000ad98:	c2cfc0ef          	jal	ra,800071c4 <netif_set_addr>
8000ad9c:	00000593          	li	a1,0
8000ada0:	00040513          	mv	a0,s0
8000ada4:	fe8fe0ef          	jal	ra,8000958c <dhcp_set_state>
8000ada8:	00444783          	lbu	a5,4(s0)
8000adac:	00078663          	beqz	a5,8000adb8 <dhcp_release_and_stop+0x13c>
8000adb0:	c60ff0ef          	jal	ra,8000a210 <dhcp_dec_pcb_refcount>
8000adb4:	00040223          	sb	zero,4(s0)
8000adb8:	02c12083          	lw	ra,44(sp)
8000adbc:	02812403          	lw	s0,40(sp)
8000adc0:	02412483          	lw	s1,36(sp)
8000adc4:	02012903          	lw	s2,32(sp)
8000adc8:	01c12983          	lw	s3,28(sp)
8000adcc:	01812a03          	lw	s4,24(sp)
8000add0:	03010113          	addi	sp,sp,48
8000add4:	00008067          	ret

8000add8 <dhcp_start>:
8000add8:	ff010113          	addi	sp,sp,-16
8000addc:	00912223          	sw	s1,4(sp)
8000ade0:	00112623          	sw	ra,12(sp)
8000ade4:	00812423          	sw	s0,8(sp)
8000ade8:	01212023          	sw	s2,0(sp)
8000adec:	ff000493          	li	s1,-16
8000adf0:	08050263          	beqz	a0,8000ae74 <dhcp_start+0x9c>
8000adf4:	03554783          	lbu	a5,53(a0)
8000adf8:	ff000493          	li	s1,-16
8000adfc:	0017f793          	andi	a5,a5,1
8000ae00:	06078a63          	beqz	a5,8000ae74 <dhcp_start+0x9c>
8000ae04:	02c55703          	lhu	a4,44(a0)
8000ae08:	23f00793          	li	a5,575
8000ae0c:	02852903          	lw	s2,40(a0)
8000ae10:	00e7e663          	bltu	a5,a4,8000ae1c <dhcp_start+0x44>
8000ae14:	fff00493          	li	s1,-1
8000ae18:	05c0006f          	j	8000ae74 <dhcp_start+0x9c>
8000ae1c:	00050413          	mv	s0,a0
8000ae20:	06091863          	bnez	s2,8000ae90 <dhcp_start+0xb8>
8000ae24:	03400513          	li	a0,52
8000ae28:	8b0fc0ef          	jal	ra,80006ed8 <lwip_malloc>
8000ae2c:	00050913          	mv	s2,a0
8000ae30:	fe0502e3          	beqz	a0,8000ae14 <dhcp_start+0x3c>
8000ae34:	02a42423          	sw	a0,40(s0)
8000ae38:	03400613          	li	a2,52
8000ae3c:	00000593          	li	a1,0
8000ae40:	00090513          	mv	a0,s2
8000ae44:	71c020ef          	jal	ra,8000d560 <memset>
8000ae48:	a48ff0ef          	jal	ra,8000a090 <dhcp_inc_pcb_refcount>
8000ae4c:	00050493          	mv	s1,a0
8000ae50:	fc0512e3          	bnez	a0,8000ae14 <dhcp_start+0x3c>
8000ae54:	00100793          	li	a5,1
8000ae58:	00f90223          	sb	a5,4(s2)
8000ae5c:	03544783          	lbu	a5,53(s0)
8000ae60:	0047f793          	andi	a5,a5,4
8000ae64:	02079e63          	bnez	a5,8000aea0 <dhcp_start+0xc8>
8000ae68:	00200593          	li	a1,2
8000ae6c:	00090513          	mv	a0,s2
8000ae70:	f1cfe0ef          	jal	ra,8000958c <dhcp_set_state>
8000ae74:	00c12083          	lw	ra,12(sp)
8000ae78:	00812403          	lw	s0,8(sp)
8000ae7c:	00048513          	mv	a0,s1
8000ae80:	00012903          	lw	s2,0(sp)
8000ae84:	00412483          	lw	s1,4(sp)
8000ae88:	01010113          	addi	sp,sp,16
8000ae8c:	00008067          	ret
8000ae90:	00494783          	lbu	a5,4(s2)
8000ae94:	fa0782e3          	beqz	a5,8000ae38 <dhcp_start+0x60>
8000ae98:	b78ff0ef          	jal	ra,8000a210 <dhcp_dec_pcb_refcount>
8000ae9c:	f9dff06f          	j	8000ae38 <dhcp_start+0x60>
8000aea0:	00040513          	mv	a0,s0
8000aea4:	e11fe0ef          	jal	ra,80009cb4 <dhcp_discover>
8000aea8:	00050493          	mv	s1,a0
8000aeac:	fc0504e3          	beqz	a0,8000ae74 <dhcp_start+0x9c>
8000aeb0:	00040513          	mv	a0,s0
8000aeb4:	dc9ff0ef          	jal	ra,8000ac7c <dhcp_release_and_stop>
8000aeb8:	f5dff06f          	j	8000ae14 <dhcp_start+0x3c>

8000aebc <dhcp_coarse_tmr>:
8000aebc:	fc010113          	addi	sp,sp,-64
8000aec0:	02812c23          	sw	s0,56(sp)
8000aec4:	8f41a403          	lw	s0,-1804(gp) # 80003364 <netif_list>
8000aec8:	03312623          	sw	s3,44(sp)
8000aecc:	000029b7          	lui	s3,0x2
8000aed0:	03212823          	sw	s2,48(sp)
8000aed4:	03412423          	sw	s4,40(sp)
8000aed8:	03512223          	sw	s5,36(sp)
8000aedc:	03612023          	sw	s6,32(sp)
8000aee0:	01712e23          	sw	s7,28(sp)
8000aee4:	02112e23          	sw	ra,60(sp)
8000aee8:	02912a23          	sw	s1,52(sp)
8000aeec:	01812c23          	sw	s8,24(sp)
8000aef0:	01912a23          	sw	s9,20(sp)
8000aef4:	00100913          	li	s2,1
8000aef8:	00a00a13          	li	s4,10
8000aefc:	43200a93          	li	s5,1074
8000af00:	71098993          	addi	s3,s3,1808 # 2710 <_stack_size+0x1710>
8000af04:	02041c63          	bnez	s0,8000af3c <dhcp_coarse_tmr+0x80>
8000af08:	03c12083          	lw	ra,60(sp)
8000af0c:	03812403          	lw	s0,56(sp)
8000af10:	03412483          	lw	s1,52(sp)
8000af14:	03012903          	lw	s2,48(sp)
8000af18:	02c12983          	lw	s3,44(sp)
8000af1c:	02812a03          	lw	s4,40(sp)
8000af20:	02412a83          	lw	s5,36(sp)
8000af24:	02012b03          	lw	s6,32(sp)
8000af28:	01c12b83          	lw	s7,28(sp)
8000af2c:	01812c03          	lw	s8,24(sp)
8000af30:	01412c83          	lw	s9,20(sp)
8000af34:	04010113          	addi	sp,sp,64
8000af38:	00008067          	ret
8000af3c:	02842783          	lw	a5,40(s0)
8000af40:	02078e63          	beqz	a5,8000af7c <dhcp_coarse_tmr+0xc0>
8000af44:	0057c703          	lbu	a4,5(a5)
8000af48:	02070a63          	beqz	a4,8000af7c <dhcp_coarse_tmr+0xc0>
8000af4c:	0147d683          	lhu	a3,20(a5)
8000af50:	02068a63          	beqz	a3,8000af84 <dhcp_coarse_tmr+0xc8>
8000af54:	0127d703          	lhu	a4,18(a5)
8000af58:	00170713          	addi	a4,a4,1
8000af5c:	01071713          	slli	a4,a4,0x10
8000af60:	01075713          	srli	a4,a4,0x10
8000af64:	00e79923          	sh	a4,18(a5)
8000af68:	00e69e63          	bne	a3,a4,8000af84 <dhcp_coarse_tmr+0xc8>
8000af6c:	00040513          	mv	a0,s0
8000af70:	d0dff0ef          	jal	ra,8000ac7c <dhcp_release_and_stop>
8000af74:	00040513          	mv	a0,s0
8000af78:	e61ff0ef          	jal	ra,8000add8 <dhcp_start>
8000af7c:	00042403          	lw	s0,0(s0)
8000af80:	f85ff06f          	j	8000af04 <dhcp_coarse_tmr+0x48>
8000af84:	0107d703          	lhu	a4,16(a5)
8000af88:	1a070663          	beqz	a4,8000b134 <dhcp_coarse_tmr+0x278>
8000af8c:	fff70693          	addi	a3,a4,-1
8000af90:	00d79823          	sh	a3,16(a5)
8000af94:	1b271063          	bne	a4,s2,8000b134 <dhcp_coarse_tmr+0x278>
8000af98:	02842c03          	lw	s8,40(s0)
8000af9c:	005c4783          	lbu	a5,5(s8)
8000afa0:	fcfa6ee3          	bltu	s4,a5,8000af7c <dhcp_coarse_tmr+0xc0>
8000afa4:	00fad7b3          	srl	a5,s5,a5
8000afa8:	0017f793          	andi	a5,a5,1
8000afac:	fc0788e3          	beqz	a5,8000af7c <dhcp_coarse_tmr+0xc0>
8000afb0:	00400593          	li	a1,4
8000afb4:	000c0513          	mv	a0,s8
8000afb8:	dd4fe0ef          	jal	ra,8000958c <dhcp_set_state>
8000afbc:	00e10693          	addi	a3,sp,14
8000afc0:	00300613          	li	a2,3
8000afc4:	000c0593          	mv	a1,s8
8000afc8:	00040513          	mv	a0,s0
8000afcc:	e68fe0ef          	jal	ra,80009634 <dhcp_create_msg>
8000afd0:	00050c93          	mv	s9,a0
8000afd4:	0e050a63          	beqz	a0,8000b0c8 <dhcp_coarse_tmr+0x20c>
8000afd8:	00452483          	lw	s1,4(a0)
8000afdc:	00e15783          	lhu	a5,14(sp)
8000afe0:	03900693          	li	a3,57
8000afe4:	0f048493          	addi	s1,s1,240
8000afe8:	00f48733          	add	a4,s1,a5
8000afec:	00278513          	addi	a0,a5,2
8000aff0:	00178793          	addi	a5,a5,1
8000aff4:	01079793          	slli	a5,a5,0x10
8000aff8:	0107d793          	srli	a5,a5,0x10
8000affc:	00d70023          	sb	a3,0(a4)
8000b000:	00f487b3          	add	a5,s1,a5
8000b004:	00200713          	li	a4,2
8000b008:	00e78023          	sb	a4,0(a5)
8000b00c:	02c45603          	lhu	a2,44(s0)
8000b010:	01051513          	slli	a0,a0,0x10
8000b014:	01055513          	srli	a0,a0,0x10
8000b018:	00048593          	mv	a1,s1
8000b01c:	00a11723          	sh	a0,14(sp)
8000b020:	d84fe0ef          	jal	ra,800095a4 <dhcp_option_short>
8000b024:	00a48733          	add	a4,s1,a0
8000b028:	03700693          	li	a3,55
8000b02c:	00d70023          	sb	a3,0(a4)
8000b030:	00150713          	addi	a4,a0,1
8000b034:	01071713          	slli	a4,a4,0x10
8000b038:	01075713          	srli	a4,a4,0x10
8000b03c:	00300693          	li	a3,3
8000b040:	00e48733          	add	a4,s1,a4
8000b044:	00d70023          	sb	a3,0(a4)
8000b048:	00250713          	addi	a4,a0,2
8000b04c:	01071713          	slli	a4,a4,0x10
8000b050:	01075713          	srli	a4,a4,0x10
8000b054:	00e48733          	add	a4,s1,a4
8000b058:	01270023          	sb	s2,0(a4)
8000b05c:	00050793          	mv	a5,a0
8000b060:	00350713          	addi	a4,a0,3
8000b064:	01071713          	slli	a4,a4,0x10
8000b068:	00478793          	addi	a5,a5,4
8000b06c:	01075713          	srli	a4,a4,0x10
8000b070:	01079793          	slli	a5,a5,0x10
8000b074:	00e48733          	add	a4,s1,a4
8000b078:	00550513          	addi	a0,a0,5
8000b07c:	0107d793          	srli	a5,a5,0x10
8000b080:	00d70023          	sb	a3,0(a4)
8000b084:	00f487b3          	add	a5,s1,a5
8000b088:	01c00713          	li	a4,28
8000b08c:	01051513          	slli	a0,a0,0x10
8000b090:	00e78023          	sb	a4,0(a5)
8000b094:	01055513          	srli	a0,a0,0x10
8000b098:	000c8613          	mv	a2,s9
8000b09c:	00048593          	mv	a1,s1
8000b0a0:	00a11723          	sh	a0,14(sp)
8000b0a4:	f34fe0ef          	jal	ra,800097d8 <dhcp_option_trailer>
8000b0a8:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000b0ac:	00040713          	mv	a4,s0
8000b0b0:	04300693          	li	a3,67
8000b0b4:	84418613          	addi	a2,gp,-1980 # 800032b4 <ip_addr_broadcast>
8000b0b8:	000c8593          	mv	a1,s9
8000b0bc:	9e0fe0ef          	jal	ra,8000929c <udp_sendto_if>
8000b0c0:	000c8513          	mv	a0,s9
8000b0c4:	839fc0ef          	jal	ra,800078fc <pbuf_free>
8000b0c8:	006c4783          	lbu	a5,6(s8)
8000b0cc:	0ff00713          	li	a4,255
8000b0d0:	00e78663          	beq	a5,a4,8000b0dc <dhcp_coarse_tmr+0x220>
8000b0d4:	00178793          	addi	a5,a5,1
8000b0d8:	00fc0323          	sb	a5,6(s8)
8000b0dc:	006c4783          	lbu	a5,6(s8)
8000b0e0:	00900713          	li	a4,9
8000b0e4:	00098513          	mv	a0,s3
8000b0e8:	02f76063          	bltu	a4,a5,8000b108 <dhcp_coarse_tmr+0x24c>
8000b0ec:	00579513          	slli	a0,a5,0x5
8000b0f0:	40f50533          	sub	a0,a0,a5
8000b0f4:	00251513          	slli	a0,a0,0x2
8000b0f8:	00a787b3          	add	a5,a5,a0
8000b0fc:	00379793          	slli	a5,a5,0x3
8000b100:	01079513          	slli	a0,a5,0x10
8000b104:	01055513          	srli	a0,a0,0x10
8000b108:	1f400593          	li	a1,500
8000b10c:	1f350513          	addi	a0,a0,499
8000b110:	359020ef          	jal	ra,8000dc68 <__divsi3>
8000b114:	014c5783          	lhu	a5,20(s8)
8000b118:	012c5703          	lhu	a4,18(s8)
8000b11c:	00ac1423          	sh	a0,8(s8)
8000b120:	40e787b3          	sub	a5,a5,a4
8000b124:	e4f95ce3          	bge	s2,a5,8000af7c <dhcp_coarse_tmr+0xc0>
8000b128:	4017d793          	srai	a5,a5,0x1
8000b12c:	00fc1823          	sh	a5,16(s8)
8000b130:	e4dff06f          	j	8000af7c <dhcp_coarse_tmr+0xc0>
8000b134:	00e7d703          	lhu	a4,14(a5)
8000b138:	e40702e3          	beqz	a4,8000af7c <dhcp_coarse_tmr+0xc0>
8000b13c:	fff70693          	addi	a3,a4,-1
8000b140:	00d79723          	sh	a3,14(a5)
8000b144:	e3271ce3          	bne	a4,s2,8000af7c <dhcp_coarse_tmr+0xc0>
8000b148:	02842483          	lw	s1,40(s0)
8000b14c:	0054c783          	lbu	a5,5(s1)
8000b150:	0fb7f713          	andi	a4,a5,251
8000b154:	01270463          	beq	a4,s2,8000b15c <dhcp_coarse_tmr+0x2a0>
8000b158:	e34792e3          	bne	a5,s4,8000af7c <dhcp_coarse_tmr+0xc0>
8000b15c:	00040513          	mv	a0,s0
8000b160:	929ff0ef          	jal	ra,8000aa88 <dhcp_renew>
8000b164:	00c4d783          	lhu	a5,12(s1)
8000b168:	0124d703          	lhu	a4,18(s1)
8000b16c:	40e787b3          	sub	a5,a5,a4
8000b170:	e0f956e3          	bge	s2,a5,8000af7c <dhcp_coarse_tmr+0xc0>
8000b174:	4017d793          	srai	a5,a5,0x1
8000b178:	00f49723          	sh	a5,14(s1)
8000b17c:	e01ff06f          	j	8000af7c <dhcp_coarse_tmr+0xc0>

8000b180 <dhcp_fine_tmr>:
8000b180:	fe010113          	addi	sp,sp,-32
8000b184:	00812c23          	sw	s0,24(sp)
8000b188:	8f41a403          	lw	s0,-1804(gp) # 80003364 <netif_list>
8000b18c:	00912a23          	sw	s1,20(sp)
8000b190:	01212823          	sw	s2,16(sp)
8000b194:	01312623          	sw	s3,12(sp)
8000b198:	01412423          	sw	s4,8(sp)
8000b19c:	01512223          	sw	s5,4(sp)
8000b1a0:	01612023          	sw	s6,0(sp)
8000b1a4:	00112e23          	sw	ra,28(sp)
8000b1a8:	00100493          	li	s1,1
8000b1ac:	00c00913          	li	s2,12
8000b1b0:	00600993          	li	s3,6
8000b1b4:	00800a13          	li	s4,8
8000b1b8:	00300a93          	li	s5,3
8000b1bc:	00500b13          	li	s6,5
8000b1c0:	02041663          	bnez	s0,8000b1ec <dhcp_fine_tmr+0x6c>
8000b1c4:	01c12083          	lw	ra,28(sp)
8000b1c8:	01812403          	lw	s0,24(sp)
8000b1cc:	01412483          	lw	s1,20(sp)
8000b1d0:	01012903          	lw	s2,16(sp)
8000b1d4:	00c12983          	lw	s3,12(sp)
8000b1d8:	00812a03          	lw	s4,8(sp)
8000b1dc:	00412a83          	lw	s5,4(sp)
8000b1e0:	00012b03          	lw	s6,0(sp)
8000b1e4:	02010113          	addi	sp,sp,32
8000b1e8:	00008067          	ret
8000b1ec:	02842703          	lw	a4,40(s0)
8000b1f0:	00070a63          	beqz	a4,8000b204 <dhcp_fine_tmr+0x84>
8000b1f4:	00875783          	lhu	a5,8(a4)
8000b1f8:	00f4fa63          	bgeu	s1,a5,8000b20c <dhcp_fine_tmr+0x8c>
8000b1fc:	fff78793          	addi	a5,a5,-1
8000b200:	00f71423          	sh	a5,8(a4)
8000b204:	00042403          	lw	s0,0(s0)
8000b208:	fb9ff06f          	j	8000b1c0 <dhcp_fine_tmr+0x40>
8000b20c:	fe979ce3          	bne	a5,s1,8000b204 <dhcp_fine_tmr+0x84>
8000b210:	00071423          	sh	zero,8(a4)
8000b214:	02842703          	lw	a4,40(s0)
8000b218:	00574783          	lbu	a5,5(a4)
8000b21c:	01278463          	beq	a5,s2,8000b224 <dhcp_fine_tmr+0xa4>
8000b220:	01379863          	bne	a5,s3,8000b230 <dhcp_fine_tmr+0xb0>
8000b224:	00040513          	mv	a0,s0
8000b228:	a8dfe0ef          	jal	ra,80009cb4 <dhcp_discover>
8000b22c:	fd9ff06f          	j	8000b204 <dhcp_fine_tmr+0x84>
8000b230:	02979463          	bne	a5,s1,8000b258 <dhcp_fine_tmr+0xd8>
8000b234:	00674783          	lbu	a5,6(a4)
8000b238:	00040513          	mv	a0,s0
8000b23c:	00fb6663          	bltu	s6,a5,8000b248 <dhcp_fine_tmr+0xc8>
8000b240:	ff8fe0ef          	jal	ra,80009a38 <dhcp_select>
8000b244:	fc1ff06f          	j	8000b204 <dhcp_fine_tmr+0x84>
8000b248:	a35ff0ef          	jal	ra,8000ac7c <dhcp_release_and_stop>
8000b24c:	00040513          	mv	a0,s0
8000b250:	b89ff0ef          	jal	ra,8000add8 <dhcp_start>
8000b254:	fb1ff06f          	j	8000b204 <dhcp_fine_tmr+0x84>
8000b258:	03479063          	bne	a5,s4,8000b278 <dhcp_fine_tmr+0xf8>
8000b25c:	00674783          	lbu	a5,6(a4)
8000b260:	00040513          	mv	a0,s0
8000b264:	00f4e663          	bltu	s1,a5,8000b270 <dhcp_fine_tmr+0xf0>
8000b268:	c11fe0ef          	jal	ra,80009e78 <dhcp_check>
8000b26c:	f99ff06f          	j	8000b204 <dhcp_fine_tmr+0x84>
8000b270:	c6dfe0ef          	jal	ra,80009edc <dhcp_bind>
8000b274:	f91ff06f          	j	8000b204 <dhcp_fine_tmr+0x84>
8000b278:	f95796e3          	bne	a5,s5,8000b204 <dhcp_fine_tmr+0x84>
8000b27c:	00674783          	lbu	a5,6(a4)
8000b280:	00040513          	mv	a0,s0
8000b284:	faf4e2e3          	bltu	s1,a5,8000b228 <dhcp_fine_tmr+0xa8>
8000b288:	da0fe0ef          	jal	ra,80009828 <dhcp_reboot>
8000b28c:	f79ff06f          	j	8000b204 <dhcp_fine_tmr+0x84>

8000b290 <dhcp_release>:
8000b290:	ff010113          	addi	sp,sp,-16
8000b294:	00112623          	sw	ra,12(sp)
8000b298:	9e5ff0ef          	jal	ra,8000ac7c <dhcp_release_and_stop>
8000b29c:	00c12083          	lw	ra,12(sp)
8000b2a0:	00000513          	li	a0,0
8000b2a4:	01010113          	addi	sp,sp,16
8000b2a8:	00008067          	ret

8000b2ac <dhcp_stop>:
8000b2ac:	9d1ff06f          	j	8000ac7c <dhcp_release_and_stop>

8000b2b0 <etharp_free_entry>:
8000b2b0:	fe010113          	addi	sp,sp,-32
8000b2b4:	00912a23          	sw	s1,20(sp)
8000b2b8:	00151493          	slli	s1,a0,0x1
8000b2bc:	00a48733          	add	a4,s1,a0
8000b2c0:	01212823          	sw	s2,16(sp)
8000b2c4:	00371713          	slli	a4,a4,0x3
8000b2c8:	b6c18913          	addi	s2,gp,-1172 # 800035dc <arp_table>
8000b2cc:	00812c23          	sw	s0,24(sp)
8000b2d0:	01312623          	sw	s3,12(sp)
8000b2d4:	00112e23          	sw	ra,28(sp)
8000b2d8:	00e90933          	add	s2,s2,a4
8000b2dc:	00050993          	mv	s3,a0
8000b2e0:	00092503          	lw	a0,0(s2)
8000b2e4:	b6c18413          	addi	s0,gp,-1172 # 800035dc <arp_table>
8000b2e8:	00050663          	beqz	a0,8000b2f4 <etharp_free_entry+0x44>
8000b2ec:	e10fc0ef          	jal	ra,800078fc <pbuf_free>
8000b2f0:	00092023          	sw	zero,0(s2)
8000b2f4:	01348533          	add	a0,s1,s3
8000b2f8:	00351513          	slli	a0,a0,0x3
8000b2fc:	00a40533          	add	a0,s0,a0
8000b300:	00050a23          	sb	zero,20(a0)
8000b304:	00051923          	sh	zero,18(a0)
8000b308:	00052423          	sw	zero,8(a0)
8000b30c:	00052223          	sw	zero,4(a0)
8000b310:	00600613          	li	a2,6
8000b314:	84c18593          	addi	a1,gp,-1972 # 800032bc <ethzero>
8000b318:	00c50513          	addi	a0,a0,12
8000b31c:	7f4030ef          	jal	ra,8000eb10 <memcpy>
8000b320:	01c12083          	lw	ra,28(sp)
8000b324:	01812403          	lw	s0,24(sp)
8000b328:	01412483          	lw	s1,20(sp)
8000b32c:	01012903          	lw	s2,16(sp)
8000b330:	00c12983          	lw	s3,12(sp)
8000b334:	02010113          	addi	sp,sp,32
8000b338:	00008067          	ret

8000b33c <etharp_find_entry>:
8000b33c:	fe010113          	addi	sp,sp,-32
8000b340:	00812c23          	sw	s0,24(sp)
8000b344:	00912a23          	sw	s1,20(sp)
8000b348:	b6c18693          	addi	a3,gp,-1172 # 800035dc <arp_table>
8000b34c:	00112e23          	sw	ra,28(sp)
8000b350:	01212823          	sw	s2,16(sp)
8000b354:	01312623          	sw	s3,12(sp)
8000b358:	00000293          	li	t0,0
8000b35c:	00000f93          	li	t6,0
8000b360:	00000f13          	li	t5,0
8000b364:	00a00313          	li	t1,10
8000b368:	00000793          	li	a5,0
8000b36c:	00a00713          	li	a4,10
8000b370:	00a00893          	li	a7,10
8000b374:	00a00493          	li	s1,10
8000b378:	b6c18413          	addi	s0,gp,-1172 # 800035dc <arp_table>
8000b37c:	00a00e13          	li	t3,10
8000b380:	00100393          	li	t2,1
8000b384:	0146ce83          	lbu	t4,20(a3)
8000b388:	05c71263          	bne	a4,t3,8000b3cc <etharp_find_entry+0x90>
8000b38c:	100e8463          	beqz	t4,8000b494 <etharp_find_entry+0x158>
8000b390:	00050e63          	beqz	a0,8000b3ac <etharp_find_entry+0x70>
8000b394:	00052903          	lw	s2,0(a0)
8000b398:	0046a803          	lw	a6,4(a3)
8000b39c:	01091863          	bne	s2,a6,8000b3ac <etharp_find_entry+0x70>
8000b3a0:	0a060a63          	beqz	a2,8000b454 <etharp_find_entry+0x118>
8000b3a4:	0086a803          	lw	a6,8(a3)
8000b3a8:	0ac80663          	beq	a6,a2,8000b454 <etharp_find_entry+0x118>
8000b3ac:	0126d803          	lhu	a6,18(a3)
8000b3b0:	0c7e9a63          	bne	t4,t2,8000b484 <etharp_find_entry+0x148>
8000b3b4:	0006ae83          	lw	t4,0(a3)
8000b3b8:	0a0e8e63          	beqz	t4,8000b474 <etharp_find_entry+0x138>
8000b3bc:	01e86a63          	bltu	a6,t5,8000b3d0 <etharp_find_entry+0x94>
8000b3c0:	00080f13          	mv	t5,a6
8000b3c4:	00078313          	mv	t1,a5
8000b3c8:	0080006f          	j	8000b3d0 <etharp_find_entry+0x94>
8000b3cc:	fc0e92e3          	bnez	t4,8000b390 <etharp_find_entry+0x54>
8000b3d0:	00178793          	addi	a5,a5,1
8000b3d4:	01079813          	slli	a6,a5,0x10
8000b3d8:	01085813          	srli	a6,a6,0x10
8000b3dc:	01081793          	slli	a5,a6,0x10
8000b3e0:	01868693          	addi	a3,a3,24
8000b3e4:	4107d793          	srai	a5,a5,0x10
8000b3e8:	f9c81ee3          	bne	a6,t3,8000b384 <etharp_find_entry+0x48>
8000b3ec:	00100693          	li	a3,1
8000b3f0:	fff00793          	li	a5,-1
8000b3f4:	06d59063          	bne	a1,a3,8000b454 <etharp_find_entry+0x118>
8000b3f8:	00060993          	mv	s3,a2
8000b3fc:	00050913          	mv	s2,a0
8000b400:	03c71063          	bne	a4,t3,8000b420 <etharp_find_entry+0xe4>
8000b404:	08e89c63          	bne	a7,a4,8000b49c <etharp_find_entry+0x160>
8000b408:	01149663          	bne	s1,a7,8000b414 <etharp_find_entry+0xd8>
8000b40c:	04930463          	beq	t1,s1,8000b454 <etharp_find_entry+0x118>
8000b410:	00030493          	mv	s1,t1
8000b414:	00048513          	mv	a0,s1
8000b418:	e99ff0ef          	jal	ra,8000b2b0 <etharp_free_entry>
8000b41c:	00048713          	mv	a4,s1
8000b420:	00171793          	slli	a5,a4,0x1
8000b424:	00090c63          	beqz	s2,8000b43c <etharp_find_entry+0x100>
8000b428:	00092603          	lw	a2,0(s2)
8000b42c:	00e786b3          	add	a3,a5,a4
8000b430:	00369693          	slli	a3,a3,0x3
8000b434:	00d406b3          	add	a3,s0,a3
8000b438:	00c6a223          	sw	a2,4(a3)
8000b43c:	00e787b3          	add	a5,a5,a4
8000b440:	00379793          	slli	a5,a5,0x3
8000b444:	00f407b3          	add	a5,s0,a5
8000b448:	00079923          	sh	zero,18(a5)
8000b44c:	0137a423          	sw	s3,8(a5)
8000b450:	00070793          	mv	a5,a4
8000b454:	01c12083          	lw	ra,28(sp)
8000b458:	01812403          	lw	s0,24(sp)
8000b45c:	01412483          	lw	s1,20(sp)
8000b460:	01012903          	lw	s2,16(sp)
8000b464:	00c12983          	lw	s3,12(sp)
8000b468:	00078513          	mv	a0,a5
8000b46c:	02010113          	addi	sp,sp,32
8000b470:	00008067          	ret
8000b474:	f5f86ee3          	bltu	a6,t6,8000b3d0 <etharp_find_entry+0x94>
8000b478:	00080f93          	mv	t6,a6
8000b47c:	00078493          	mv	s1,a5
8000b480:	f51ff06f          	j	8000b3d0 <etharp_find_entry+0x94>
8000b484:	f45866e3          	bltu	a6,t0,8000b3d0 <etharp_find_entry+0x94>
8000b488:	00080293          	mv	t0,a6
8000b48c:	00078893          	mv	a7,a5
8000b490:	f41ff06f          	j	8000b3d0 <etharp_find_entry+0x94>
8000b494:	00078713          	mv	a4,a5
8000b498:	f39ff06f          	j	8000b3d0 <etharp_find_entry+0x94>
8000b49c:	00088493          	mv	s1,a7
8000b4a0:	f75ff06f          	j	8000b414 <etharp_find_entry+0xd8>

8000b4a4 <etharp_raw>:
8000b4a4:	fc010113          	addi	sp,sp,-64
8000b4a8:	03312623          	sw	s3,44(sp)
8000b4ac:	03412423          	sw	s4,40(sp)
8000b4b0:	03512223          	sw	s5,36(sp)
8000b4b4:	00050993          	mv	s3,a0
8000b4b8:	00058a13          	mv	s4,a1
8000b4bc:	00060a93          	mv	s5,a2
8000b4c0:	01c00593          	li	a1,28
8000b4c4:	28000613          	li	a2,640
8000b4c8:	01000513          	li	a0,16
8000b4cc:	02912a23          	sw	s1,52(sp)
8000b4d0:	03612023          	sw	s6,32(sp)
8000b4d4:	01712e23          	sw	s7,28(sp)
8000b4d8:	01812c23          	sw	s8,24(sp)
8000b4dc:	01912a23          	sw	s9,20(sp)
8000b4e0:	01112623          	sw	a7,12(sp)
8000b4e4:	02112e23          	sw	ra,60(sp)
8000b4e8:	02812c23          	sw	s0,56(sp)
8000b4ec:	03212823          	sw	s2,48(sp)
8000b4f0:	00068c93          	mv	s9,a3
8000b4f4:	00070b93          	mv	s7,a4
8000b4f8:	00078c13          	mv	s8,a5
8000b4fc:	00080b13          	mv	s6,a6
8000b500:	cd0fc0ef          	jal	ra,800079d0 <pbuf_alloc>
8000b504:	a2c18493          	addi	s1,gp,-1492 # 8000349c <lwip_stats>
8000b508:	00c12883          	lw	a7,12(sp)
8000b50c:	04051463          	bnez	a0,8000b554 <etharp_raw+0xb0>
8000b510:	0484a783          	lw	a5,72(s1)
8000b514:	fff00513          	li	a0,-1
8000b518:	00178793          	addi	a5,a5,1
8000b51c:	04f4a423          	sw	a5,72(s1)
8000b520:	03c12083          	lw	ra,60(sp)
8000b524:	03812403          	lw	s0,56(sp)
8000b528:	03412483          	lw	s1,52(sp)
8000b52c:	03012903          	lw	s2,48(sp)
8000b530:	02c12983          	lw	s3,44(sp)
8000b534:	02812a03          	lw	s4,40(sp)
8000b538:	02412a83          	lw	s5,36(sp)
8000b53c:	02012b03          	lw	s6,32(sp)
8000b540:	01c12b83          	lw	s7,28(sp)
8000b544:	01812c03          	lw	s8,24(sp)
8000b548:	01412c83          	lw	s9,20(sp)
8000b54c:	04010113          	addi	sp,sp,64
8000b550:	00008067          	ret
8000b554:	00452403          	lw	s0,4(a0)
8000b558:	00050913          	mv	s2,a0
8000b55c:	00088513          	mv	a0,a7
8000b560:	978fb0ef          	jal	ra,800066d8 <lwip_htons>
8000b564:	00a40323          	sb	a0,6(s0)
8000b568:	00855513          	srli	a0,a0,0x8
8000b56c:	00a403a3          	sb	a0,7(s0)
8000b570:	00600613          	li	a2,6
8000b574:	000c8593          	mv	a1,s9
8000b578:	00840513          	addi	a0,s0,8
8000b57c:	594030ef          	jal	ra,8000eb10 <memcpy>
8000b580:	00600613          	li	a2,6
8000b584:	000c0593          	mv	a1,s8
8000b588:	01240513          	addi	a0,s0,18
8000b58c:	584030ef          	jal	ra,8000eb10 <memcpy>
8000b590:	00400613          	li	a2,4
8000b594:	000b8593          	mv	a1,s7
8000b598:	00e40513          	addi	a0,s0,14
8000b59c:	574030ef          	jal	ra,8000eb10 <memcpy>
8000b5a0:	00400613          	li	a2,4
8000b5a4:	000b0593          	mv	a1,s6
8000b5a8:	01840513          	addi	a0,s0,24
8000b5ac:	564030ef          	jal	ra,8000eb10 <memcpy>
8000b5b0:	00100793          	li	a5,1
8000b5b4:	00f400a3          	sb	a5,1(s0)
8000b5b8:	00800793          	li	a5,8
8000b5bc:	00f40123          	sb	a5,2(s0)
8000b5c0:	00600793          	li	a5,6
8000b5c4:	00f40223          	sb	a5,4(s0)
8000b5c8:	00001737          	lui	a4,0x1
8000b5cc:	00400793          	li	a5,4
8000b5d0:	00f402a3          	sb	a5,5(s0)
8000b5d4:	80670713          	addi	a4,a4,-2042 # 806 <CUSTOM1+0x7db>
8000b5d8:	000a8693          	mv	a3,s5
8000b5dc:	000a0613          	mv	a2,s4
8000b5e0:	00090593          	mv	a1,s2
8000b5e4:	00040023          	sb	zero,0(s0)
8000b5e8:	000401a3          	sb	zero,3(s0)
8000b5ec:	00098513          	mv	a0,s3
8000b5f0:	695010ef          	jal	ra,8000d484 <ethernet_output>
8000b5f4:	0304a783          	lw	a5,48(s1)
8000b5f8:	00090513          	mv	a0,s2
8000b5fc:	00178793          	addi	a5,a5,1
8000b600:	02f4a823          	sw	a5,48(s1)
8000b604:	af8fc0ef          	jal	ra,800078fc <pbuf_free>
8000b608:	00000513          	li	a0,0
8000b60c:	f15ff06f          	j	8000b520 <etharp_raw+0x7c>

8000b610 <etharp_cleanup_netif>:
8000b610:	fe010113          	addi	sp,sp,-32
8000b614:	00812c23          	sw	s0,24(sp)
8000b618:	00912a23          	sw	s1,20(sp)
8000b61c:	01212823          	sw	s2,16(sp)
8000b620:	01312623          	sw	s3,12(sp)
8000b624:	00112e23          	sw	ra,28(sp)
8000b628:	00050993          	mv	s3,a0
8000b62c:	b6c18413          	addi	s0,gp,-1172 # 800035dc <arp_table>
8000b630:	00000493          	li	s1,0
8000b634:	00a00913          	li	s2,10
8000b638:	01444783          	lbu	a5,20(s0)
8000b63c:	00078a63          	beqz	a5,8000b650 <etharp_cleanup_netif+0x40>
8000b640:	00842783          	lw	a5,8(s0)
8000b644:	01379663          	bne	a5,s3,8000b650 <etharp_cleanup_netif+0x40>
8000b648:	00048513          	mv	a0,s1
8000b64c:	c65ff0ef          	jal	ra,8000b2b0 <etharp_free_entry>
8000b650:	00148493          	addi	s1,s1,1
8000b654:	01840413          	addi	s0,s0,24
8000b658:	ff2490e3          	bne	s1,s2,8000b638 <etharp_cleanup_netif+0x28>
8000b65c:	01c12083          	lw	ra,28(sp)
8000b660:	01812403          	lw	s0,24(sp)
8000b664:	01412483          	lw	s1,20(sp)
8000b668:	01012903          	lw	s2,16(sp)
8000b66c:	00c12983          	lw	s3,12(sp)
8000b670:	02010113          	addi	sp,sp,32
8000b674:	00008067          	ret

8000b678 <etharp_find_addr>:
8000b678:	fe010113          	addi	sp,sp,-32
8000b67c:	00058793          	mv	a5,a1
8000b680:	00812c23          	sw	s0,24(sp)
8000b684:	00200593          	li	a1,2
8000b688:	00060413          	mv	s0,a2
8000b68c:	00050613          	mv	a2,a0
8000b690:	00078513          	mv	a0,a5
8000b694:	00112e23          	sw	ra,28(sp)
8000b698:	00d12623          	sw	a3,12(sp)
8000b69c:	ca1ff0ef          	jal	ra,8000b33c <etharp_find_entry>
8000b6a0:	04054863          	bltz	a0,8000b6f0 <etharp_find_addr+0x78>
8000b6a4:	00151793          	slli	a5,a0,0x1
8000b6a8:	00a787b3          	add	a5,a5,a0
8000b6ac:	b6c18713          	addi	a4,gp,-1172 # 800035dc <arp_table>
8000b6b0:	00379793          	slli	a5,a5,0x3
8000b6b4:	00f70633          	add	a2,a4,a5
8000b6b8:	01464583          	lbu	a1,20(a2)
8000b6bc:	00100613          	li	a2,1
8000b6c0:	02b67863          	bgeu	a2,a1,8000b6f0 <etharp_find_addr+0x78>
8000b6c4:	00c78613          	addi	a2,a5,12
8000b6c8:	00c12683          	lw	a3,12(sp)
8000b6cc:	00c70633          	add	a2,a4,a2
8000b6d0:	00478793          	addi	a5,a5,4
8000b6d4:	00c42023          	sw	a2,0(s0)
8000b6d8:	00f707b3          	add	a5,a4,a5
8000b6dc:	00f6a023          	sw	a5,0(a3)
8000b6e0:	01c12083          	lw	ra,28(sp)
8000b6e4:	01812403          	lw	s0,24(sp)
8000b6e8:	02010113          	addi	sp,sp,32
8000b6ec:	00008067          	ret
8000b6f0:	fff00513          	li	a0,-1
8000b6f4:	fedff06f          	j	8000b6e0 <etharp_find_addr+0x68>

8000b6f8 <etharp_get_entry>:
8000b6f8:	00900793          	li	a5,9
8000b6fc:	04a7e863          	bltu	a5,a0,8000b74c <etharp_get_entry+0x54>
8000b700:	00151793          	slli	a5,a0,0x1
8000b704:	00a787b3          	add	a5,a5,a0
8000b708:	b6c18713          	addi	a4,gp,-1172 # 800035dc <arp_table>
8000b70c:	00379793          	slli	a5,a5,0x3
8000b710:	00f70833          	add	a6,a4,a5
8000b714:	01484303          	lbu	t1,20(a6)
8000b718:	00100893          	li	a7,1
8000b71c:	00000513          	li	a0,0
8000b720:	0268f863          	bgeu	a7,t1,8000b750 <etharp_get_entry+0x58>
8000b724:	00478513          	addi	a0,a5,4
8000b728:	00a70533          	add	a0,a4,a0
8000b72c:	00a5a023          	sw	a0,0(a1)
8000b730:	00882583          	lw	a1,8(a6)
8000b734:	00c78793          	addi	a5,a5,12
8000b738:	00f707b3          	add	a5,a4,a5
8000b73c:	00b62023          	sw	a1,0(a2)
8000b740:	00f6a023          	sw	a5,0(a3)
8000b744:	00100513          	li	a0,1
8000b748:	00008067          	ret
8000b74c:	00000513          	li	a0,0
8000b750:	00008067          	ret

8000b754 <etharp_input>:
8000b754:	22058863          	beqz	a1,8000b984 <etharp_input+0x230>
8000b758:	fc010113          	addi	sp,sp,-64
8000b75c:	02812c23          	sw	s0,56(sp)
8000b760:	03212823          	sw	s2,48(sp)
8000b764:	03312623          	sw	s3,44(sp)
8000b768:	02112e23          	sw	ra,60(sp)
8000b76c:	02912a23          	sw	s1,52(sp)
8000b770:	03412423          	sw	s4,40(sp)
8000b774:	03512223          	sw	s5,36(sp)
8000b778:	03612023          	sw	s6,32(sp)
8000b77c:	01712e23          	sw	s7,28(sp)
8000b780:	00452483          	lw	s1,4(a0)
8000b784:	00058413          	mv	s0,a1
8000b788:	0014c783          	lbu	a5,1(s1)
8000b78c:	0004c703          	lbu	a4,0(s1)
8000b790:	00050993          	mv	s3,a0
8000b794:	00879793          	slli	a5,a5,0x8
8000b798:	00e7e7b3          	or	a5,a5,a4
8000b79c:	10000713          	li	a4,256
8000b7a0:	a2c18913          	addi	s2,gp,-1492 # 8000349c <lwip_stats>
8000b7a4:	02e79a63          	bne	a5,a4,8000b7d8 <etharp_input+0x84>
8000b7a8:	0044c703          	lbu	a4,4(s1)
8000b7ac:	00600793          	li	a5,6
8000b7b0:	02f71463          	bne	a4,a5,8000b7d8 <etharp_input+0x84>
8000b7b4:	0054c703          	lbu	a4,5(s1)
8000b7b8:	00400793          	li	a5,4
8000b7bc:	00f71e63          	bne	a4,a5,8000b7d8 <etharp_input+0x84>
8000b7c0:	0034c783          	lbu	a5,3(s1)
8000b7c4:	0024c703          	lbu	a4,2(s1)
8000b7c8:	00879793          	slli	a5,a5,0x8
8000b7cc:	00e7e7b3          	or	a5,a5,a4
8000b7d0:	00800713          	li	a4,8
8000b7d4:	04e78863          	beq	a5,a4,8000b824 <etharp_input+0xd0>
8000b7d8:	05092783          	lw	a5,80(s2)
8000b7dc:	00178793          	addi	a5,a5,1
8000b7e0:	04f92823          	sw	a5,80(s2)
8000b7e4:	03c92783          	lw	a5,60(s2)
8000b7e8:	00178793          	addi	a5,a5,1
8000b7ec:	02f92e23          	sw	a5,60(s2)
8000b7f0:	00098513          	mv	a0,s3
8000b7f4:	908fc0ef          	jal	ra,800078fc <pbuf_free>
8000b7f8:	03c12083          	lw	ra,60(sp)
8000b7fc:	03812403          	lw	s0,56(sp)
8000b800:	03412483          	lw	s1,52(sp)
8000b804:	03012903          	lw	s2,48(sp)
8000b808:	02c12983          	lw	s3,44(sp)
8000b80c:	02812a03          	lw	s4,40(sp)
8000b810:	02412a83          	lw	s5,36(sp)
8000b814:	02012b03          	lw	s6,32(sp)
8000b818:	01c12b83          	lw	s7,28(sp)
8000b81c:	04010113          	addi	sp,sp,64
8000b820:	00008067          	ret
8000b824:	03492783          	lw	a5,52(s2)
8000b828:	00400613          	li	a2,4
8000b82c:	00e48593          	addi	a1,s1,14
8000b830:	00178793          	addi	a5,a5,1
8000b834:	00810513          	addi	a0,sp,8
8000b838:	02f92a23          	sw	a5,52(s2)
8000b83c:	2d4030ef          	jal	ra,8000eb10 <memcpy>
8000b840:	00400613          	li	a2,4
8000b844:	01848593          	addi	a1,s1,24
8000b848:	00c10513          	addi	a0,sp,12
8000b84c:	2c4030ef          	jal	ra,8000eb10 <memcpy>
8000b850:	00442783          	lw	a5,4(s0)
8000b854:	00848a13          	addi	s4,s1,8
8000b858:	00078663          	beqz	a5,8000b864 <etharp_input+0x110>
8000b85c:	00c12703          	lw	a4,12(sp)
8000b860:	0ce78e63          	beq	a5,a4,8000b93c <etharp_input+0x1e8>
8000b864:	00000a93          	li	s5,0
8000b868:	00200b13          	li	s6,2
8000b86c:	00812503          	lw	a0,8(sp)
8000b870:	08050e63          	beqz	a0,8000b90c <etharp_input+0x1b8>
8000b874:	00040593          	mv	a1,s0
8000b878:	630010ef          	jal	ra,8000cea8 <ip4_addr_isbroadcast_u32>
8000b87c:	08051863          	bnez	a0,8000b90c <etharp_input+0x1b8>
8000b880:	00812783          	lw	a5,8(sp)
8000b884:	0e000713          	li	a4,224
8000b888:	0f07f793          	andi	a5,a5,240
8000b88c:	08e78063          	beq	a5,a4,8000b90c <etharp_input+0x1b8>
8000b890:	00040613          	mv	a2,s0
8000b894:	000b0593          	mv	a1,s6
8000b898:	00810513          	addi	a0,sp,8
8000b89c:	aa1ff0ef          	jal	ra,8000b33c <etharp_find_entry>
8000b8a0:	06054663          	bltz	a0,8000b90c <etharp_input+0x1b8>
8000b8a4:	00151793          	slli	a5,a0,0x1
8000b8a8:	00a787b3          	add	a5,a5,a0
8000b8ac:	b6c18713          	addi	a4,gp,-1172 # 800035dc <arp_table>
8000b8b0:	00379793          	slli	a5,a5,0x3
8000b8b4:	00f70b33          	add	s6,a4,a5
8000b8b8:	00200693          	li	a3,2
8000b8bc:	00c78793          	addi	a5,a5,12
8000b8c0:	00db0a23          	sb	a3,20(s6) # 8014 <_stack_size+0x7014>
8000b8c4:	008b2423          	sw	s0,8(s6)
8000b8c8:	00600613          	li	a2,6
8000b8cc:	000a0593          	mv	a1,s4
8000b8d0:	00f70533          	add	a0,a4,a5
8000b8d4:	23c030ef          	jal	ra,8000eb10 <memcpy>
8000b8d8:	000b2b83          	lw	s7,0(s6)
8000b8dc:	000b1923          	sh	zero,18(s6)
8000b8e0:	020b8663          	beqz	s7,8000b90c <etharp_input+0x1b8>
8000b8e4:	00001737          	lui	a4,0x1
8000b8e8:	000b2023          	sw	zero,0(s6)
8000b8ec:	80070713          	addi	a4,a4,-2048 # 800 <CUSTOM1+0x7d5>
8000b8f0:	000a0693          	mv	a3,s4
8000b8f4:	02e40613          	addi	a2,s0,46
8000b8f8:	000b8593          	mv	a1,s7
8000b8fc:	00040513          	mv	a0,s0
8000b900:	385010ef          	jal	ra,8000d484 <ethernet_output>
8000b904:	000b8513          	mv	a0,s7
8000b908:	ff5fb0ef          	jal	ra,800078fc <pbuf_free>
8000b90c:	0074c783          	lbu	a5,7(s1)
8000b910:	0064c703          	lbu	a4,6(s1)
8000b914:	00879793          	slli	a5,a5,0x8
8000b918:	00e7e7b3          	or	a5,a5,a4
8000b91c:	10000713          	li	a4,256
8000b920:	02e78463          	beq	a5,a4,8000b948 <etharp_input+0x1f4>
8000b924:	20000713          	li	a4,512
8000b928:	04e78663          	beq	a5,a4,8000b974 <etharp_input+0x220>
8000b92c:	05892783          	lw	a5,88(s2)
8000b930:	00178793          	addi	a5,a5,1
8000b934:	04f92c23          	sw	a5,88(s2)
8000b938:	eb9ff06f          	j	8000b7f0 <etharp_input+0x9c>
8000b93c:	00100a93          	li	s5,1
8000b940:	00100b13          	li	s6,1
8000b944:	f29ff06f          	j	8000b86c <etharp_input+0x118>
8000b948:	ea0a84e3          	beqz	s5,8000b7f0 <etharp_input+0x9c>
8000b94c:	02e40693          	addi	a3,s0,46
8000b950:	00200893          	li	a7,2
8000b954:	00810813          	addi	a6,sp,8
8000b958:	000a0793          	mv	a5,s4
8000b95c:	00440713          	addi	a4,s0,4
8000b960:	000a0613          	mv	a2,s4
8000b964:	00068593          	mv	a1,a3
8000b968:	00040513          	mv	a0,s0
8000b96c:	b39ff0ef          	jal	ra,8000b4a4 <etharp_raw>
8000b970:	e81ff06f          	j	8000b7f0 <etharp_input+0x9c>
8000b974:	00810593          	addi	a1,sp,8
8000b978:	00040513          	mv	a0,s0
8000b97c:	fd5fe0ef          	jal	ra,8000a950 <dhcp_arp_reply>
8000b980:	e71ff06f          	j	8000b7f0 <etharp_input+0x9c>
8000b984:	00008067          	ret

8000b988 <etharp_request>:
8000b988:	02e50693          	addi	a3,a0,46
8000b98c:	00058813          	mv	a6,a1
8000b990:	00100893          	li	a7,1
8000b994:	84c18793          	addi	a5,gp,-1972 # 800032bc <ethzero>
8000b998:	00450713          	addi	a4,a0,4
8000b99c:	85418613          	addi	a2,gp,-1964 # 800032c4 <ethbroadcast>
8000b9a0:	00068593          	mv	a1,a3
8000b9a4:	b01ff06f          	j	8000b4a4 <etharp_raw>

8000b9a8 <etharp_tmr>:
8000b9a8:	fd010113          	addi	sp,sp,-48
8000b9ac:	02812423          	sw	s0,40(sp)
8000b9b0:	02912223          	sw	s1,36(sp)
8000b9b4:	03212023          	sw	s2,32(sp)
8000b9b8:	01312e23          	sw	s3,28(sp)
8000b9bc:	01412c23          	sw	s4,24(sp)
8000b9c0:	01512a23          	sw	s5,20(sp)
8000b9c4:	01612823          	sw	s6,16(sp)
8000b9c8:	01712623          	sw	s7,12(sp)
8000b9cc:	02112623          	sw	ra,44(sp)
8000b9d0:	b6c18413          	addi	s0,gp,-1172 # 800035dc <arp_table>
8000b9d4:	00000493          	li	s1,0
8000b9d8:	12b00a13          	li	s4,299
8000b9dc:	00100a93          	li	s5,1
8000b9e0:	00300b13          	li	s6,3
8000b9e4:	00400913          	li	s2,4
8000b9e8:	00200b93          	li	s7,2
8000b9ec:	00a00993          	li	s3,10
8000b9f0:	01444703          	lbu	a4,20(s0)
8000b9f4:	02070663          	beqz	a4,8000ba20 <etharp_tmr+0x78>
8000b9f8:	01245783          	lhu	a5,18(s0)
8000b9fc:	00178793          	addi	a5,a5,1
8000ba00:	01079793          	slli	a5,a5,0x10
8000ba04:	0107d793          	srli	a5,a5,0x10
8000ba08:	00f41923          	sh	a5,18(s0)
8000ba0c:	00fa6663          	bltu	s4,a5,8000ba18 <etharp_tmr+0x70>
8000ba10:	05571463          	bne	a4,s5,8000ba58 <etharp_tmr+0xb0>
8000ba14:	04f97e63          	bgeu	s2,a5,8000ba70 <etharp_tmr+0xc8>
8000ba18:	00048513          	mv	a0,s1
8000ba1c:	895ff0ef          	jal	ra,8000b2b0 <etharp_free_entry>
8000ba20:	00148493          	addi	s1,s1,1
8000ba24:	01840413          	addi	s0,s0,24
8000ba28:	fd3494e3          	bne	s1,s3,8000b9f0 <etharp_tmr+0x48>
8000ba2c:	02c12083          	lw	ra,44(sp)
8000ba30:	02812403          	lw	s0,40(sp)
8000ba34:	02412483          	lw	s1,36(sp)
8000ba38:	02012903          	lw	s2,32(sp)
8000ba3c:	01c12983          	lw	s3,28(sp)
8000ba40:	01812a03          	lw	s4,24(sp)
8000ba44:	01412a83          	lw	s5,20(sp)
8000ba48:	01012b03          	lw	s6,16(sp)
8000ba4c:	00c12b83          	lw	s7,12(sp)
8000ba50:	03010113          	addi	sp,sp,48
8000ba54:	00008067          	ret
8000ba58:	01671663          	bne	a4,s6,8000ba64 <etharp_tmr+0xbc>
8000ba5c:	01240a23          	sb	s2,20(s0)
8000ba60:	fc1ff06f          	j	8000ba20 <etharp_tmr+0x78>
8000ba64:	fb271ee3          	bne	a4,s2,8000ba20 <etharp_tmr+0x78>
8000ba68:	01740a23          	sb	s7,20(s0)
8000ba6c:	fb5ff06f          	j	8000ba20 <etharp_tmr+0x78>
8000ba70:	00842503          	lw	a0,8(s0)
8000ba74:	00440593          	addi	a1,s0,4
8000ba78:	f11ff0ef          	jal	ra,8000b988 <etharp_request>
8000ba7c:	fa5ff06f          	j	8000ba20 <etharp_tmr+0x78>

8000ba80 <etharp_output_to_arp_index>:
8000ba80:	fe010113          	addi	sp,sp,-32
8000ba84:	01412423          	sw	s4,8(sp)
8000ba88:	00058a13          	mv	s4,a1
8000ba8c:	00161593          	slli	a1,a2,0x1
8000ba90:	00c58633          	add	a2,a1,a2
8000ba94:	00361613          	slli	a2,a2,0x3
8000ba98:	b6c18593          	addi	a1,gp,-1172 # 800035dc <arp_table>
8000ba9c:	00812c23          	sw	s0,24(sp)
8000baa0:	00912a23          	sw	s1,20(sp)
8000baa4:	01212823          	sw	s2,16(sp)
8000baa8:	01312623          	sw	s3,12(sp)
8000baac:	00112e23          	sw	ra,28(sp)
8000bab0:	00c584b3          	add	s1,a1,a2
8000bab4:	0144c703          	lbu	a4,20(s1)
8000bab8:	00c60413          	addi	s0,a2,12
8000babc:	00200793          	li	a5,2
8000bac0:	00050913          	mv	s2,a0
8000bac4:	00858433          	add	s0,a1,s0
8000bac8:	02e50993          	addi	s3,a0,46
8000bacc:	02f71463          	bne	a4,a5,8000baf4 <etharp_output_to_arp_index+0x74>
8000bad0:	0124d783          	lhu	a5,18(s1)
8000bad4:	11c00713          	li	a4,284
8000bad8:	04f77a63          	bgeu	a4,a5,8000bb2c <etharp_output_to_arp_index+0xac>
8000badc:	00460613          	addi	a2,a2,4
8000bae0:	00c585b3          	add	a1,a1,a2
8000bae4:	ea5ff0ef          	jal	ra,8000b988 <etharp_request>
8000bae8:	00051663          	bnez	a0,8000baf4 <etharp_output_to_arp_index+0x74>
8000baec:	00300793          	li	a5,3
8000baf0:	00f48a23          	sb	a5,20(s1)
8000baf4:	00040693          	mv	a3,s0
8000baf8:	01812403          	lw	s0,24(sp)
8000bafc:	01c12083          	lw	ra,28(sp)
8000bb00:	01412483          	lw	s1,20(sp)
8000bb04:	00098613          	mv	a2,s3
8000bb08:	000a0593          	mv	a1,s4
8000bb0c:	00c12983          	lw	s3,12(sp)
8000bb10:	00812a03          	lw	s4,8(sp)
8000bb14:	00090513          	mv	a0,s2
8000bb18:	01012903          	lw	s2,16(sp)
8000bb1c:	00001737          	lui	a4,0x1
8000bb20:	80070713          	addi	a4,a4,-2048 # 800 <CUSTOM1+0x7d5>
8000bb24:	02010113          	addi	sp,sp,32
8000bb28:	15d0106f          	j	8000d484 <ethernet_output>
8000bb2c:	10d00713          	li	a4,269
8000bb30:	fcf772e3          	bgeu	a4,a5,8000baf4 <etharp_output_to_arp_index+0x74>
8000bb34:	00460613          	addi	a2,a2,4
8000bb38:	00c58833          	add	a6,a1,a2
8000bb3c:	00100893          	li	a7,1
8000bb40:	84c18793          	addi	a5,gp,-1972 # 800032bc <ethzero>
8000bb44:	00450713          	addi	a4,a0,4
8000bb48:	00098693          	mv	a3,s3
8000bb4c:	00040613          	mv	a2,s0
8000bb50:	00098593          	mv	a1,s3
8000bb54:	951ff0ef          	jal	ra,8000b4a4 <etharp_raw>
8000bb58:	f91ff06f          	j	8000bae8 <etharp_output_to_arp_index+0x68>

8000bb5c <etharp_query>:
8000bb5c:	fe010113          	addi	sp,sp,-32
8000bb60:	01512223          	sw	s5,4(sp)
8000bb64:	00058a93          	mv	s5,a1
8000bb68:	00912a23          	sw	s1,20(sp)
8000bb6c:	00050593          	mv	a1,a0
8000bb70:	00050493          	mv	s1,a0
8000bb74:	000aa503          	lw	a0,0(s5)
8000bb78:	01312623          	sw	s3,12(sp)
8000bb7c:	00112e23          	sw	ra,28(sp)
8000bb80:	00812c23          	sw	s0,24(sp)
8000bb84:	01212823          	sw	s2,16(sp)
8000bb88:	01412423          	sw	s4,8(sp)
8000bb8c:	00060993          	mv	s3,a2
8000bb90:	318010ef          	jal	ra,8000cea8 <ip4_addr_isbroadcast_u32>
8000bb94:	16051a63          	bnez	a0,8000bd08 <etharp_query+0x1ac>
8000bb98:	000aa783          	lw	a5,0(s5)
8000bb9c:	0e000713          	li	a4,224
8000bba0:	0f07f693          	andi	a3,a5,240
8000bba4:	16e68263          	beq	a3,a4,8000bd08 <etharp_query+0x1ac>
8000bba8:	16078063          	beqz	a5,8000bd08 <etharp_query+0x1ac>
8000bbac:	00048613          	mv	a2,s1
8000bbb0:	00100593          	li	a1,1
8000bbb4:	000a8513          	mv	a0,s5
8000bbb8:	f84ff0ef          	jal	ra,8000b33c <etharp_find_entry>
8000bbbc:	02055e63          	bgez	a0,8000bbf8 <etharp_query+0x9c>
8000bbc0:	00098a63          	beqz	s3,8000bbd4 <etharp_query+0x78>
8000bbc4:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000bbc8:	0487a703          	lw	a4,72(a5)
8000bbcc:	00170713          	addi	a4,a4,1
8000bbd0:	04e7a423          	sw	a4,72(a5)
8000bbd4:	01c12083          	lw	ra,28(sp)
8000bbd8:	01812403          	lw	s0,24(sp)
8000bbdc:	01412483          	lw	s1,20(sp)
8000bbe0:	01012903          	lw	s2,16(sp)
8000bbe4:	00c12983          	lw	s3,12(sp)
8000bbe8:	00812a03          	lw	s4,8(sp)
8000bbec:	00412a83          	lw	s5,4(sp)
8000bbf0:	02010113          	addi	sp,sp,32
8000bbf4:	00008067          	ret
8000bbf8:	0ff57413          	andi	s0,a0,255
8000bbfc:	00141a13          	slli	s4,s0,0x1
8000bc00:	008a0733          	add	a4,s4,s0
8000bc04:	b6c18793          	addi	a5,gp,-1172 # 800035dc <arp_table>
8000bc08:	00371713          	slli	a4,a4,0x3
8000bc0c:	00e787b3          	add	a5,a5,a4
8000bc10:	0147c703          	lbu	a4,20(a5)
8000bc14:	b6c18913          	addi	s2,gp,-1172 # 800035dc <arp_table>
8000bc18:	08070663          	beqz	a4,8000bca4 <etharp_query+0x148>
8000bc1c:	fff00513          	li	a0,-1
8000bc20:	00099a63          	bnez	s3,8000bc34 <etharp_query+0xd8>
8000bc24:	000a8593          	mv	a1,s5
8000bc28:	00048513          	mv	a0,s1
8000bc2c:	d5dff0ef          	jal	ra,8000b988 <etharp_request>
8000bc30:	fa0982e3          	beqz	s3,8000bbd4 <etharp_query+0x78>
8000bc34:	008a07b3          	add	a5,s4,s0
8000bc38:	00379793          	slli	a5,a5,0x3
8000bc3c:	00f907b3          	add	a5,s2,a5
8000bc40:	0147c703          	lbu	a4,20(a5)
8000bc44:	00100793          	li	a5,1
8000bc48:	06e7f663          	bgeu	a5,a4,8000bcb4 <etharp_query+0x158>
8000bc4c:	00048863          	beqz	s1,8000bc5c <etharp_query+0x100>
8000bc50:	03c4a783          	lw	a5,60(s1)
8000bc54:	00078463          	beqz	a5,8000bc5c <etharp_query+0x100>
8000bc58:	00878023          	sb	s0,0(a5)
8000bc5c:	008a06b3          	add	a3,s4,s0
8000bc60:	00369693          	slli	a3,a3,0x3
8000bc64:	01812403          	lw	s0,24(sp)
8000bc68:	00c68693          	addi	a3,a3,12
8000bc6c:	01c12083          	lw	ra,28(sp)
8000bc70:	00812a03          	lw	s4,8(sp)
8000bc74:	00412a83          	lw	s5,4(sp)
8000bc78:	00d906b3          	add	a3,s2,a3
8000bc7c:	02e48613          	addi	a2,s1,46
8000bc80:	01012903          	lw	s2,16(sp)
8000bc84:	00098593          	mv	a1,s3
8000bc88:	00048513          	mv	a0,s1
8000bc8c:	00c12983          	lw	s3,12(sp)
8000bc90:	01412483          	lw	s1,20(sp)
8000bc94:	00001737          	lui	a4,0x1
8000bc98:	80070713          	addi	a4,a4,-2048 # 800 <CUSTOM1+0x7d5>
8000bc9c:	02010113          	addi	sp,sp,32
8000bca0:	7e40106f          	j	8000d484 <ethernet_output>
8000bca4:	00100713          	li	a4,1
8000bca8:	00e78a23          	sb	a4,20(a5)
8000bcac:	0097a423          	sw	s1,8(a5)
8000bcb0:	f75ff06f          	j	8000bc24 <etharp_query+0xc8>
8000bcb4:	f2f710e3          	bne	a4,a5,8000bbd4 <etharp_query+0x78>
8000bcb8:	00098793          	mv	a5,s3
8000bcbc:	00c7c703          	lbu	a4,12(a5)
8000bcc0:	04077713          	andi	a4,a4,64
8000bcc4:	04071663          	bnez	a4,8000bd10 <etharp_query+0x1b4>
8000bcc8:	0007a783          	lw	a5,0(a5)
8000bccc:	fe0798e3          	bnez	a5,8000bcbc <etharp_query+0x160>
8000bcd0:	00098513          	mv	a0,s3
8000bcd4:	810fc0ef          	jal	ra,80007ce4 <pbuf_ref>
8000bcd8:	008a07b3          	add	a5,s4,s0
8000bcdc:	00379793          	slli	a5,a5,0x3
8000bce0:	00f907b3          	add	a5,s2,a5
8000bce4:	0007a503          	lw	a0,0(a5)
8000bce8:	00050463          	beqz	a0,8000bcf0 <etharp_query+0x194>
8000bcec:	c11fb0ef          	jal	ra,800078fc <pbuf_free>
8000bcf0:	008a0433          	add	s0,s4,s0
8000bcf4:	00341413          	slli	s0,s0,0x3
8000bcf8:	00890433          	add	s0,s2,s0
8000bcfc:	01342023          	sw	s3,0(s0)
8000bd00:	00000513          	li	a0,0
8000bd04:	ed1ff06f          	j	8000bbd4 <etharp_query+0x78>
8000bd08:	ff000513          	li	a0,-16
8000bd0c:	ec9ff06f          	j	8000bbd4 <etharp_query+0x78>
8000bd10:	00098613          	mv	a2,s3
8000bd14:	28000593          	li	a1,640
8000bd18:	01000513          	li	a0,16
8000bd1c:	c78fc0ef          	jal	ra,80008194 <pbuf_clone>
8000bd20:	00050993          	mv	s3,a0
8000bd24:	fa051ae3          	bnez	a0,8000bcd8 <etharp_query+0x17c>
8000bd28:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000bd2c:	0487a703          	lw	a4,72(a5)
8000bd30:	fff00513          	li	a0,-1
8000bd34:	00170713          	addi	a4,a4,1
8000bd38:	04e7a423          	sw	a4,72(a5)
8000bd3c:	e99ff06f          	j	8000bbd4 <etharp_query+0x78>

8000bd40 <etharp_output>:
8000bd40:	fe010113          	addi	sp,sp,-32
8000bd44:	00812c23          	sw	s0,24(sp)
8000bd48:	00912a23          	sw	s1,20(sp)
8000bd4c:	01212823          	sw	s2,16(sp)
8000bd50:	00112e23          	sw	ra,28(sp)
8000bd54:	00050413          	mv	s0,a0
8000bd58:	00058913          	mv	s2,a1
8000bd5c:	00050593          	mv	a1,a0
8000bd60:	00062503          	lw	a0,0(a2)
8000bd64:	00060493          	mv	s1,a2
8000bd68:	140010ef          	jal	ra,8000cea8 <ip4_addr_isbroadcast_u32>
8000bd6c:	16051863          	bnez	a0,8000bedc <etharp_output+0x19c>
8000bd70:	0004a783          	lw	a5,0(s1)
8000bd74:	0e000713          	li	a4,224
8000bd78:	0f07f613          	andi	a2,a5,240
8000bd7c:	04e61863          	bne	a2,a4,8000bdcc <etharp_output+0x8c>
8000bd80:	00100793          	li	a5,1
8000bd84:	00f11423          	sh	a5,8(sp)
8000bd88:	05e00793          	li	a5,94
8000bd8c:	00f10523          	sb	a5,10(sp)
8000bd90:	0014c783          	lbu	a5,1(s1)
8000bd94:	00810693          	addi	a3,sp,8
8000bd98:	07f7f793          	andi	a5,a5,127
8000bd9c:	00f105a3          	sb	a5,11(sp)
8000bda0:	0024c783          	lbu	a5,2(s1)
8000bda4:	00f10623          	sb	a5,12(sp)
8000bda8:	0034c783          	lbu	a5,3(s1)
8000bdac:	00f106a3          	sb	a5,13(sp)
8000bdb0:	00001737          	lui	a4,0x1
8000bdb4:	80070713          	addi	a4,a4,-2048 # 800 <CUSTOM1+0x7d5>
8000bdb8:	02e40613          	addi	a2,s0,46
8000bdbc:	00090593          	mv	a1,s2
8000bdc0:	00040513          	mv	a0,s0
8000bdc4:	6c0010ef          	jal	ra,8000d484 <ethernet_output>
8000bdc8:	0a40006f          	j	8000be6c <etharp_output+0x12c>
8000bdcc:	00442703          	lw	a4,4(s0)
8000bdd0:	00842603          	lw	a2,8(s0)
8000bdd4:	00050693          	mv	a3,a0
8000bdd8:	00e7c733          	xor	a4,a5,a4
8000bddc:	00c77733          	and	a4,a4,a2
8000bde0:	02070463          	beqz	a4,8000be08 <etharp_output+0xc8>
8000bde4:	01079793          	slli	a5,a5,0x10
8000bde8:	00010737          	lui	a4,0x10
8000bdec:	0107d793          	srli	a5,a5,0x10
8000bdf0:	ea970713          	addi	a4,a4,-343 # fea9 <_stack_size+0xeea9>
8000bdf4:	00e78a63          	beq	a5,a4,8000be08 <etharp_output+0xc8>
8000bdf8:	00c42783          	lw	a5,12(s0)
8000bdfc:	ffc00513          	li	a0,-4
8000be00:	06078663          	beqz	a5,8000be6c <etharp_output+0x12c>
8000be04:	00c40493          	addi	s1,s0,12
8000be08:	03c42583          	lw	a1,60(s0)
8000be0c:	b6c18793          	addi	a5,gp,-1172 # 800035dc <arp_table>
8000be10:	06058a63          	beqz	a1,8000be84 <etharp_output+0x144>
8000be14:	0005c603          	lbu	a2,0(a1)
8000be18:	00900713          	li	a4,9
8000be1c:	06c76463          	bltu	a4,a2,8000be84 <etharp_output+0x144>
8000be20:	00161713          	slli	a4,a2,0x1
8000be24:	00c70733          	add	a4,a4,a2
8000be28:	00371713          	slli	a4,a4,0x3
8000be2c:	00e78733          	add	a4,a5,a4
8000be30:	01474803          	lbu	a6,20(a4)
8000be34:	00100513          	li	a0,1
8000be38:	05057663          	bgeu	a0,a6,8000be84 <etharp_output+0x144>
8000be3c:	00872503          	lw	a0,8(a4)
8000be40:	04851263          	bne	a0,s0,8000be84 <etharp_output+0x144>
8000be44:	0004a503          	lw	a0,0(s1)
8000be48:	00472703          	lw	a4,4(a4)
8000be4c:	02e51c63          	bne	a0,a4,8000be84 <etharp_output+0x144>
8000be50:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000be54:	05c7a703          	lw	a4,92(a5)
8000be58:	00170713          	addi	a4,a4,1
8000be5c:	04e7ae23          	sw	a4,92(a5)
8000be60:	00090593          	mv	a1,s2
8000be64:	00040513          	mv	a0,s0
8000be68:	c19ff0ef          	jal	ra,8000ba80 <etharp_output_to_arp_index>
8000be6c:	01c12083          	lw	ra,28(sp)
8000be70:	01812403          	lw	s0,24(sp)
8000be74:	01412483          	lw	s1,20(sp)
8000be78:	01012903          	lw	s2,16(sp)
8000be7c:	02010113          	addi	sp,sp,32
8000be80:	00008067          	ret
8000be84:	00100613          	li	a2,1
8000be88:	00a00713          	li	a4,10
8000be8c:	0147c503          	lbu	a0,20(a5)
8000be90:	02a67463          	bgeu	a2,a0,8000beb8 <etharp_output+0x178>
8000be94:	0087a503          	lw	a0,8(a5)
8000be98:	02851063          	bne	a0,s0,8000beb8 <etharp_output+0x178>
8000be9c:	0004a803          	lw	a6,0(s1)
8000bea0:	0047a503          	lw	a0,4(a5)
8000bea4:	00a81a63          	bne	a6,a0,8000beb8 <etharp_output+0x178>
8000bea8:	00058463          	beqz	a1,8000beb0 <etharp_output+0x170>
8000beac:	00d58023          	sb	a3,0(a1)
8000beb0:	00068613          	mv	a2,a3
8000beb4:	fadff06f          	j	8000be60 <etharp_output+0x120>
8000beb8:	00168693          	addi	a3,a3,1
8000bebc:	0ff6f693          	andi	a3,a3,255
8000bec0:	01878793          	addi	a5,a5,24
8000bec4:	fce694e3          	bne	a3,a4,8000be8c <etharp_output+0x14c>
8000bec8:	00090613          	mv	a2,s2
8000becc:	00048593          	mv	a1,s1
8000bed0:	00040513          	mv	a0,s0
8000bed4:	c89ff0ef          	jal	ra,8000bb5c <etharp_query>
8000bed8:	f95ff06f          	j	8000be6c <etharp_output+0x12c>
8000bedc:	85418693          	addi	a3,gp,-1964 # 800032c4 <ethbroadcast>
8000bee0:	ed1ff06f          	j	8000bdb0 <etharp_output+0x70>

8000bee4 <icmp_input>:
8000bee4:	fd010113          	addi	sp,sp,-48
8000bee8:	02912223          	sw	s1,36(sp)
8000beec:	02812423          	sw	s0,40(sp)
8000bef0:	01712623          	sw	s7,12(sp)
8000bef4:	02112623          	sw	ra,44(sp)
8000bef8:	03212023          	sw	s2,32(sp)
8000befc:	01312e23          	sw	s3,28(sp)
8000bf00:	01412c23          	sw	s4,24(sp)
8000bf04:	01512a23          	sw	s5,20(sp)
8000bf08:	01612823          	sw	s6,16(sp)
8000bf0c:	01812423          	sw	s8,8(sp)
8000bf10:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000bf14:	0c47a703          	lw	a4,196(a5)
8000bf18:	00050413          	mv	s0,a0
8000bf1c:	00170713          	addi	a4,a4,1
8000bf20:	0ce7a223          	sw	a4,196(a5)
8000bf24:	a1418713          	addi	a4,gp,-1516 # 80003484 <ip_data>
8000bf28:	00872c03          	lw	s8,8(a4)
8000bf2c:	01300713          	li	a4,19
8000bf30:	a2c18493          	addi	s1,gp,-1492 # 8000349c <lwip_stats>
8000bf34:	000c4a83          	lbu	s5,0(s8)
8000bf38:	00fafa93          	andi	s5,s5,15
8000bf3c:	002a9a93          	slli	s5,s5,0x2
8000bf40:	2b577863          	bgeu	a4,s5,8000c1f0 <icmp_input+0x30c>
8000bf44:	00a55683          	lhu	a3,10(a0)
8000bf48:	00300713          	li	a4,3
8000bf4c:	2ad77263          	bgeu	a4,a3,8000c1f0 <icmp_input+0x30c>
8000bf50:	00452703          	lw	a4,4(a0)
8000bf54:	00074703          	lbu	a4,0(a4)
8000bf58:	22070663          	beqz	a4,8000c184 <icmp_input+0x2a0>
8000bf5c:	00800693          	li	a3,8
8000bf60:	26d71a63          	bne	a4,a3,8000c1d4 <icmp_input+0x2f0>
8000bf64:	a1418b93          	addi	s7,gp,-1516 # 80003484 <ip_data>
8000bf68:	014ba503          	lw	a0,20(s7)
8000bf6c:	0e000793          	li	a5,224
8000bf70:	00058993          	mv	s3,a1
8000bf74:	0f057713          	andi	a4,a0,240
8000bf78:	00458913          	addi	s2,a1,4
8000bf7c:	00f70463          	beq	a4,a5,8000bf84 <icmp_input+0xa0>
8000bf80:	a2818913          	addi	s2,gp,-1496 # 80003498 <ip_data+0x14>
8000bf84:	000ba583          	lw	a1,0(s7)
8000bf88:	721000ef          	jal	ra,8000cea8 <ip4_addr_isbroadcast_u32>
8000bf8c:	00050463          	beqz	a0,8000bf94 <icmp_input+0xb0>
8000bf90:	00498913          	addi	s2,s3,4
8000bf94:	00845703          	lhu	a4,8(s0)
8000bf98:	00700793          	li	a5,7
8000bf9c:	24e7fa63          	bgeu	a5,a4,8000c1f0 <icmp_input+0x30c>
8000bfa0:	00040513          	mv	a0,s0
8000bfa4:	d4dfa0ef          	jal	ra,80006cf0 <inet_chksum_pbuf>
8000bfa8:	04050463          	beqz	a0,8000bff0 <icmp_input+0x10c>
8000bfac:	00040513          	mv	a0,s0
8000bfb0:	94dfb0ef          	jal	ra,800078fc <pbuf_free>
8000bfb4:	0d04a783          	lw	a5,208(s1)
8000bfb8:	00178793          	addi	a5,a5,1
8000bfbc:	0cf4a823          	sw	a5,208(s1)
8000bfc0:	02c12083          	lw	ra,44(sp)
8000bfc4:	02812403          	lw	s0,40(sp)
8000bfc8:	02412483          	lw	s1,36(sp)
8000bfcc:	02012903          	lw	s2,32(sp)
8000bfd0:	01c12983          	lw	s3,28(sp)
8000bfd4:	01812a03          	lw	s4,24(sp)
8000bfd8:	01412a83          	lw	s5,20(sp)
8000bfdc:	01012b03          	lw	s6,16(sp)
8000bfe0:	00c12b83          	lw	s7,12(sp)
8000bfe4:	00812c03          	lw	s8,8(sp)
8000bfe8:	03010113          	addi	sp,sp,48
8000bfec:	00008067          	ret
8000bff0:	010a8b13          	addi	s6,s5,16
8000bff4:	010a9a13          	slli	s4,s5,0x10
8000bff8:	000b0593          	mv	a1,s6
8000bffc:	00040513          	mv	a0,s0
8000c000:	010a5a13          	srli	s4,s4,0x10
8000c004:	861fb0ef          	jal	ra,80007864 <pbuf_add_header>
8000c008:	1a050863          	beqz	a0,8000c1b8 <icmp_input+0x2d4>
8000c00c:	00845783          	lhu	a5,8(s0)
8000c010:	014785b3          	add	a1,a5,s4
8000c014:	01059593          	slli	a1,a1,0x10
8000c018:	0105d593          	srli	a1,a1,0x10
8000c01c:	02f5e463          	bltu	a1,a5,8000c044 <icmp_input+0x160>
8000c020:	28000613          	li	a2,640
8000c024:	01000513          	li	a0,16
8000c028:	9a9fb0ef          	jal	ra,800079d0 <pbuf_alloc>
8000c02c:	00050b13          	mv	s6,a0
8000c030:	00050a63          	beqz	a0,8000c044 <icmp_input+0x160>
8000c034:	00a55703          	lhu	a4,10(a0)
8000c038:	008a8793          	addi	a5,s5,8
8000c03c:	02f77063          	bgeu	a4,a5,8000c05c <icmp_input+0x178>
8000c040:	8bdfb0ef          	jal	ra,800078fc <pbuf_free>
8000c044:	00040513          	mv	a0,s0
8000c048:	8b5fb0ef          	jal	ra,800078fc <pbuf_free>
8000c04c:	0e84a783          	lw	a5,232(s1)
8000c050:	00178793          	addi	a5,a5,1
8000c054:	0ef4a423          	sw	a5,232(s1)
8000c058:	f69ff06f          	j	8000bfc0 <icmp_input+0xdc>
8000c05c:	00452503          	lw	a0,4(a0)
8000c060:	000c0593          	mv	a1,s8
8000c064:	000a8613          	mv	a2,s5
8000c068:	2a9020ef          	jal	ra,8000eb10 <memcpy>
8000c06c:	000a8593          	mv	a1,s5
8000c070:	000b0513          	mv	a0,s6
8000c074:	801fb0ef          	jal	ra,80007874 <pbuf_remove_header>
8000c078:	00050663          	beqz	a0,8000c084 <icmp_input+0x1a0>
8000c07c:	000b0513          	mv	a0,s6
8000c080:	fc1ff06f          	j	8000c040 <icmp_input+0x15c>
8000c084:	00040593          	mv	a1,s0
8000c088:	000b0513          	mv	a0,s6
8000c08c:	d45fb0ef          	jal	ra,80007dd0 <pbuf_copy>
8000c090:	fe0516e3          	bnez	a0,8000c07c <icmp_input+0x198>
8000c094:	00040513          	mv	a0,s0
8000c098:	865fb0ef          	jal	ra,800078fc <pbuf_free>
8000c09c:	000b0413          	mv	s0,s6
8000c0a0:	000a8593          	mv	a1,s5
8000c0a4:	00040513          	mv	a0,s0
8000c0a8:	00442b03          	lw	s6,4(s0)
8000c0ac:	fb8fb0ef          	jal	ra,80007864 <pbuf_add_header>
8000c0b0:	0c051a63          	bnez	a0,8000c184 <icmp_input+0x2a0>
8000c0b4:	00092783          	lw	a5,0(s2)
8000c0b8:	00442a83          	lw	s5,4(s0)
8000c0bc:	0087d713          	srli	a4,a5,0x8
8000c0c0:	00fa8623          	sb	a5,12(s5)
8000c0c4:	00ea86a3          	sb	a4,13(s5)
8000c0c8:	0107d713          	srli	a4,a5,0x10
8000c0cc:	0187d793          	srli	a5,a5,0x18
8000c0d0:	00ea8723          	sb	a4,14(s5)
8000c0d4:	00fa87a3          	sb	a5,15(s5)
8000c0d8:	010ba783          	lw	a5,16(s7)
8000c0dc:	0087d713          	srli	a4,a5,0x8
8000c0e0:	00fa8823          	sb	a5,16(s5)
8000c0e4:	00ea88a3          	sb	a4,17(s5)
8000c0e8:	0107d713          	srli	a4,a5,0x10
8000c0ec:	0187d793          	srli	a5,a5,0x18
8000c0f0:	00ea8923          	sb	a4,18(s5)
8000c0f4:	00fa89a3          	sb	a5,19(s5)
8000c0f8:	003b4783          	lbu	a5,3(s6)
8000c0fc:	002b4703          	lbu	a4,2(s6)
8000c100:	000b0023          	sb	zero,0(s6)
8000c104:	00879793          	slli	a5,a5,0x8
8000c108:	00e7e7b3          	or	a5,a5,a4
8000c10c:	00010737          	lui	a4,0x10
8000c110:	ff770713          	addi	a4,a4,-9 # fff7 <_stack_size+0xeff7>
8000c114:	0af77c63          	bgeu	a4,a5,8000c1cc <icmp_input+0x2e8>
8000c118:	00978793          	addi	a5,a5,9
8000c11c:	01079793          	slli	a5,a5,0x10
8000c120:	0107d793          	srli	a5,a5,0x10
8000c124:	00fb0123          	sb	a5,2(s6)
8000c128:	0087d793          	srli	a5,a5,0x8
8000c12c:	00fb01a3          	sb	a5,3(s6)
8000c130:	fff00793          	li	a5,-1
8000c134:	00fa8423          	sb	a5,8(s5)
8000c138:	000a0593          	mv	a1,s4
8000c13c:	000a8523          	sb	zero,10(s5)
8000c140:	000a85a3          	sb	zero,11(s5)
8000c144:	000a8513          	mv	a0,s5
8000c148:	b85fa0ef          	jal	ra,80006ccc <inet_chksum>
8000c14c:	00aa8523          	sb	a0,10(s5)
8000c150:	00855513          	srli	a0,a0,0x8
8000c154:	00aa85a3          	sb	a0,11(s5)
8000c158:	0c04a783          	lw	a5,192(s1)
8000c15c:	00098813          	mv	a6,s3
8000c160:	00000713          	li	a4,0
8000c164:	00178793          	addi	a5,a5,1
8000c168:	0cf4a023          	sw	a5,192(s1)
8000c16c:	0ff00693          	li	a3,255
8000c170:	00100793          	li	a5,1
8000c174:	00000613          	li	a2,0
8000c178:	00090593          	mv	a1,s2
8000c17c:	00040513          	mv	a0,s0
8000c180:	3fd000ef          	jal	ra,8000cd7c <ip4_output_if>
8000c184:	00040513          	mv	a0,s0
8000c188:	02812403          	lw	s0,40(sp)
8000c18c:	02c12083          	lw	ra,44(sp)
8000c190:	02412483          	lw	s1,36(sp)
8000c194:	02012903          	lw	s2,32(sp)
8000c198:	01c12983          	lw	s3,28(sp)
8000c19c:	01812a03          	lw	s4,24(sp)
8000c1a0:	01412a83          	lw	s5,20(sp)
8000c1a4:	01012b03          	lw	s6,16(sp)
8000c1a8:	00c12b83          	lw	s7,12(sp)
8000c1ac:	00812c03          	lw	s8,8(sp)
8000c1b0:	03010113          	addi	sp,sp,48
8000c1b4:	f48fb06f          	j	800078fc <pbuf_free>
8000c1b8:	000b0593          	mv	a1,s6
8000c1bc:	00040513          	mv	a0,s0
8000c1c0:	eb4fb0ef          	jal	ra,80007874 <pbuf_remove_header>
8000c1c4:	ec050ee3          	beqz	a0,8000c0a0 <icmp_input+0x1bc>
8000c1c8:	e7dff06f          	j	8000c044 <icmp_input+0x160>
8000c1cc:	00878793          	addi	a5,a5,8
8000c1d0:	f4dff06f          	j	8000c11c <icmp_input+0x238>
8000c1d4:	0e07a703          	lw	a4,224(a5)
8000c1d8:	00170713          	addi	a4,a4,1
8000c1dc:	0ee7a023          	sw	a4,224(a5)
8000c1e0:	0cc7a703          	lw	a4,204(a5)
8000c1e4:	00170713          	addi	a4,a4,1
8000c1e8:	0ce7a623          	sw	a4,204(a5)
8000c1ec:	f99ff06f          	j	8000c184 <icmp_input+0x2a0>
8000c1f0:	00040513          	mv	a0,s0
8000c1f4:	f08fb0ef          	jal	ra,800078fc <pbuf_free>
8000c1f8:	0d44a783          	lw	a5,212(s1)
8000c1fc:	00178793          	addi	a5,a5,1
8000c200:	0cf4aa23          	sw	a5,212(s1)
8000c204:	dbdff06f          	j	8000bfc0 <icmp_input+0xdc>

8000c208 <icmp_dest_unreach>:
8000c208:	fc010113          	addi	sp,sp,-64
8000c20c:	03312623          	sw	s3,44(sp)
8000c210:	03412423          	sw	s4,40(sp)
8000c214:	00050993          	mv	s3,a0
8000c218:	00058a13          	mv	s4,a1
8000c21c:	28000613          	li	a2,640
8000c220:	02400593          	li	a1,36
8000c224:	02400513          	li	a0,36
8000c228:	02112e23          	sw	ra,60(sp)
8000c22c:	02812c23          	sw	s0,56(sp)
8000c230:	02912a23          	sw	s1,52(sp)
8000c234:	03212823          	sw	s2,48(sp)
8000c238:	f98fb0ef          	jal	ra,800079d0 <pbuf_alloc>
8000c23c:	0c050a63          	beqz	a0,8000c310 <icmp_dest_unreach+0x108>
8000c240:	00452403          	lw	s0,4(a0)
8000c244:	00300793          	li	a5,3
8000c248:	0049a903          	lw	s2,4(s3)
8000c24c:	00f40023          	sb	a5,0(s0)
8000c250:	014400a3          	sb	s4,1(s0)
8000c254:	00040223          	sb	zero,4(s0)
8000c258:	000402a3          	sb	zero,5(s0)
8000c25c:	00040323          	sb	zero,6(s0)
8000c260:	000403a3          	sb	zero,7(s0)
8000c264:	00050493          	mv	s1,a0
8000c268:	00452503          	lw	a0,4(a0)
8000c26c:	0049a583          	lw	a1,4(s3)
8000c270:	01c00613          	li	a2,28
8000c274:	00850513          	addi	a0,a0,8
8000c278:	099020ef          	jal	ra,8000eb10 <memcpy>
8000c27c:	00d94703          	lbu	a4,13(s2)
8000c280:	00c94783          	lbu	a5,12(s2)
8000c284:	01c10513          	addi	a0,sp,28
8000c288:	00871713          	slli	a4,a4,0x8
8000c28c:	00f76733          	or	a4,a4,a5
8000c290:	00e94783          	lbu	a5,14(s2)
8000c294:	01079793          	slli	a5,a5,0x10
8000c298:	00e7e733          	or	a4,a5,a4
8000c29c:	00f94783          	lbu	a5,15(s2)
8000c2a0:	01879793          	slli	a5,a5,0x18
8000c2a4:	00e7e7b3          	or	a5,a5,a4
8000c2a8:	00f12e23          	sw	a5,28(sp)
8000c2ac:	438000ef          	jal	ra,8000c6e4 <ip4_route>
8000c2b0:	00a12623          	sw	a0,12(sp)
8000c2b4:	04050a63          	beqz	a0,8000c308 <icmp_dest_unreach+0x100>
8000c2b8:	00040123          	sb	zero,2(s0)
8000c2bc:	000401a3          	sb	zero,3(s0)
8000c2c0:	00a4d583          	lhu	a1,10(s1)
8000c2c4:	00040513          	mv	a0,s0
8000c2c8:	a05fa0ef          	jal	ra,80006ccc <inet_chksum>
8000c2cc:	00a40123          	sb	a0,2(s0)
8000c2d0:	00855513          	srli	a0,a0,0x8
8000c2d4:	00a401a3          	sb	a0,3(s0)
8000c2d8:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000c2dc:	0c07a703          	lw	a4,192(a5)
8000c2e0:	00c12803          	lw	a6,12(sp)
8000c2e4:	0ff00693          	li	a3,255
8000c2e8:	00170713          	addi	a4,a4,1
8000c2ec:	0ce7a023          	sw	a4,192(a5)
8000c2f0:	01c10613          	addi	a2,sp,28
8000c2f4:	00100793          	li	a5,1
8000c2f8:	00000713          	li	a4,0
8000c2fc:	00000593          	li	a1,0
8000c300:	00048513          	mv	a0,s1
8000c304:	279000ef          	jal	ra,8000cd7c <ip4_output_if>
8000c308:	00048513          	mv	a0,s1
8000c30c:	df0fb0ef          	jal	ra,800078fc <pbuf_free>
8000c310:	03c12083          	lw	ra,60(sp)
8000c314:	03812403          	lw	s0,56(sp)
8000c318:	03412483          	lw	s1,52(sp)
8000c31c:	03012903          	lw	s2,48(sp)
8000c320:	02c12983          	lw	s3,44(sp)
8000c324:	02812a03          	lw	s4,40(sp)
8000c328:	04010113          	addi	sp,sp,64
8000c32c:	00008067          	ret

8000c330 <ipfrag_free_pbuf_custom>:
8000c330:	00050593          	mv	a1,a0
8000c334:	01452503          	lw	a0,20(a0)
8000c338:	02050463          	beqz	a0,8000c360 <ipfrag_free_pbuf_custom+0x30>
8000c33c:	fe010113          	addi	sp,sp,-32
8000c340:	00112e23          	sw	ra,28(sp)
8000c344:	00b12623          	sw	a1,12(sp)
8000c348:	db4fb0ef          	jal	ra,800078fc <pbuf_free>
8000c34c:	00c12583          	lw	a1,12(sp)
8000c350:	01c12083          	lw	ra,28(sp)
8000c354:	00200513          	li	a0,2
8000c358:	02010113          	addi	sp,sp,32
8000c35c:	cedfa06f          	j	80007048 <memp_free>
8000c360:	00200513          	li	a0,2
8000c364:	ff9ff06f          	j	8000c35c <ipfrag_free_pbuf_custom+0x2c>

8000c368 <ip4_frag>:
8000c368:	fa010113          	addi	sp,sp,-96
8000c36c:	04112e23          	sw	ra,92(sp)
8000c370:	04812c23          	sw	s0,88(sp)
8000c374:	04912a23          	sw	s1,84(sp)
8000c378:	05212823          	sw	s2,80(sp)
8000c37c:	05312623          	sw	s3,76(sp)
8000c380:	05412423          	sw	s4,72(sp)
8000c384:	05512223          	sw	s5,68(sp)
8000c388:	05612023          	sw	s6,64(sp)
8000c38c:	03712e23          	sw	s7,60(sp)
8000c390:	03812c23          	sw	s8,56(sp)
8000c394:	03912a23          	sw	s9,52(sp)
8000c398:	03a12823          	sw	s10,48(sp)
8000c39c:	03b12623          	sw	s11,44(sp)
8000c3a0:	02c5d783          	lhu	a5,44(a1)
8000c3a4:	00452c03          	lw	s8,4(a0)
8000c3a8:	00c12623          	sw	a2,12(sp)
8000c3ac:	fec78713          	addi	a4,a5,-20
8000c3b0:	41f75793          	srai	a5,a4,0x1f
8000c3b4:	0077f793          	andi	a5,a5,7
8000c3b8:	00e787b3          	add	a5,a5,a4
8000c3bc:	4037d793          	srai	a5,a5,0x3
8000c3c0:	01079793          	slli	a5,a5,0x10
8000c3c4:	0107d793          	srli	a5,a5,0x10
8000c3c8:	00f12223          	sw	a5,4(sp)
8000c3cc:	000c4783          	lbu	a5,0(s8)
8000c3d0:	01400713          	li	a4,20
8000c3d4:	00f7f793          	andi	a5,a5,15
8000c3d8:	00279793          	slli	a5,a5,0x2
8000c3dc:	2ae79663          	bne	a5,a4,8000c688 <ip4_frag+0x320>
8000c3e0:	00a55703          	lhu	a4,10(a0)
8000c3e4:	01300793          	li	a5,19
8000c3e8:	00050413          	mv	s0,a0
8000c3ec:	ffa00513          	li	a0,-6
8000c3f0:	06e7fc63          	bgeu	a5,a4,8000c468 <ip4_frag+0x100>
8000c3f4:	007c4783          	lbu	a5,7(s8)
8000c3f8:	006c4503          	lbu	a0,6(s8)
8000c3fc:	00058c93          	mv	s9,a1
8000c400:	00879793          	slli	a5,a5,0x8
8000c404:	00a7e533          	or	a0,a5,a0
8000c408:	ad0fa0ef          	jal	ra,800066d8 <lwip_htons>
8000c40c:	000027b7          	lui	a5,0x2
8000c410:	00f577b3          	and	a5,a0,a5
8000c414:	00f12423          	sw	a5,8(sp)
8000c418:	00412783          	lw	a5,4(sp)
8000c41c:	00845483          	lhu	s1,8(s0)
8000c420:	01351b93          	slli	s7,a0,0x13
8000c424:	00379793          	slli	a5,a5,0x3
8000c428:	01079793          	slli	a5,a5,0x10
8000c42c:	0107d793          	srli	a5,a5,0x10
8000c430:	fec48493          	addi	s1,s1,-20
8000c434:	00f12023          	sw	a5,0(sp)
8000c438:	00f11923          	sh	a5,18(sp)
8000c43c:	8000c7b7          	lui	a5,0x8000c
8000c440:	01049493          	slli	s1,s1,0x10
8000c444:	33078793          	addi	a5,a5,816 # 8000c330 <_ram_heap_end+0xffff4330>
8000c448:	013bdb93          	srli	s7,s7,0x13
8000c44c:	0104d493          	srli	s1,s1,0x10
8000c450:	01400a13          	li	s4,20
8000c454:	00000913          	li	s2,0
8000c458:	00f12a23          	sw	a5,20(sp)
8000c45c:	a2c18d13          	addi	s10,gp,-1492 # 8000349c <lwip_stats>
8000c460:	04049263          	bnez	s1,8000c4a4 <ip4_frag+0x13c>
8000c464:	00000513          	li	a0,0
8000c468:	05c12083          	lw	ra,92(sp)
8000c46c:	05812403          	lw	s0,88(sp)
8000c470:	05412483          	lw	s1,84(sp)
8000c474:	05012903          	lw	s2,80(sp)
8000c478:	04c12983          	lw	s3,76(sp)
8000c47c:	04812a03          	lw	s4,72(sp)
8000c480:	04412a83          	lw	s5,68(sp)
8000c484:	04012b03          	lw	s6,64(sp)
8000c488:	03c12b83          	lw	s7,60(sp)
8000c48c:	03812c03          	lw	s8,56(sp)
8000c490:	03412c83          	lw	s9,52(sp)
8000c494:	03012d03          	lw	s10,48(sp)
8000c498:	02c12d83          	lw	s11,44(sp)
8000c49c:	06010113          	addi	sp,sp,96
8000c4a0:	00008067          	ret
8000c4a4:	00012783          	lw	a5,0(sp)
8000c4a8:	01215a83          	lhu	s5,18(sp)
8000c4ac:	00f4f463          	bgeu	s1,a5,8000c4b4 <ip4_frag+0x14c>
8000c4b0:	00048a93          	mv	s5,s1
8000c4b4:	28000613          	li	a2,640
8000c4b8:	01400593          	li	a1,20
8000c4bc:	01000513          	li	a0,16
8000c4c0:	010a9a93          	slli	s5,s5,0x10
8000c4c4:	d0cfb0ef          	jal	ra,800079d0 <pbuf_alloc>
8000c4c8:	010ada93          	srli	s5,s5,0x10
8000c4cc:	00050b13          	mv	s6,a0
8000c4d0:	06050a63          	beqz	a0,8000c544 <ip4_frag+0x1dc>
8000c4d4:	00452503          	lw	a0,4(a0)
8000c4d8:	01400613          	li	a2,20
8000c4dc:	000c0593          	mv	a1,s8
8000c4e0:	630020ef          	jal	ra,8000eb10 <memcpy>
8000c4e4:	004b2983          	lw	s3,4(s6)
8000c4e8:	000a8d93          	mv	s11,s5
8000c4ec:	0c0d8c63          	beqz	s11,8000c5c4 <ip4_frag+0x25c>
8000c4f0:	00a45783          	lhu	a5,10(s0)
8000c4f4:	414787b3          	sub	a5,a5,s4
8000c4f8:	00078913          	mv	s2,a5
8000c4fc:	01079793          	slli	a5,a5,0x10
8000c500:	0107d793          	srli	a5,a5,0x10
8000c504:	00fdf463          	bgeu	s11,a5,8000c50c <ip4_frag+0x1a4>
8000c508:	000d8913          	mv	s2,s11
8000c50c:	01091913          	slli	s2,s2,0x10
8000c510:	01095913          	srli	s2,s2,0x10
8000c514:	00091863          	bnez	s2,8000c524 <ip4_frag+0x1bc>
8000c518:	00042403          	lw	s0,0(s0)
8000c51c:	00000a13          	li	s4,0
8000c520:	fcdff06f          	j	8000c4ec <ip4_frag+0x184>
8000c524:	800037b7          	lui	a5,0x80003
8000c528:	2bd00613          	li	a2,701
8000c52c:	f2078593          	addi	a1,a5,-224 # 80002f20 <_ram_heap_end+0xfffeaf20>
8000c530:	00200513          	li	a0,2
8000c534:	addfa0ef          	jal	ra,80007010 <memp_malloc_fn>
8000c538:	00051a63          	bnez	a0,8000c54c <ip4_frag+0x1e4>
8000c53c:	000b0513          	mv	a0,s6
8000c540:	bbcfb0ef          	jal	ra,800078fc <pbuf_free>
8000c544:	fff00513          	li	a0,-1
8000c548:	f21ff06f          	j	8000c468 <ip4_frag+0x100>
8000c54c:	00442703          	lw	a4,4(s0)
8000c550:	00050693          	mv	a3,a0
8000c554:	00a12c23          	sw	a0,24(sp)
8000c558:	00090793          	mv	a5,s2
8000c55c:	01470733          	add	a4,a4,s4
8000c560:	04100613          	li	a2,65
8000c564:	00090593          	mv	a1,s2
8000c568:	00000513          	li	a0,0
8000c56c:	aa4fb0ef          	jal	ra,80007810 <pbuf_alloced_custom>
8000c570:	01812883          	lw	a7,24(sp)
8000c574:	00051a63          	bnez	a0,8000c588 <ip4_frag+0x220>
8000c578:	00088593          	mv	a1,a7
8000c57c:	00200513          	li	a0,2
8000c580:	ac9fa0ef          	jal	ra,80007048 <memp_free>
8000c584:	fb9ff06f          	j	8000c53c <ip4_frag+0x1d4>
8000c588:	00a12c23          	sw	a0,24(sp)
8000c58c:	00040513          	mv	a0,s0
8000c590:	01112e23          	sw	a7,28(sp)
8000c594:	f50fb0ef          	jal	ra,80007ce4 <pbuf_ref>
8000c598:	01c12883          	lw	a7,28(sp)
8000c59c:	01412783          	lw	a5,20(sp)
8000c5a0:	01812583          	lw	a1,24(sp)
8000c5a4:	0088aa23          	sw	s0,20(a7)
8000c5a8:	00f8a823          	sw	a5,16(a7)
8000c5ac:	000b0513          	mv	a0,s6
8000c5b0:	f6cfb0ef          	jal	ra,80007d1c <pbuf_cat>
8000c5b4:	412d8833          	sub	a6,s11,s2
8000c5b8:	01081d93          	slli	s11,a6,0x10
8000c5bc:	010ddd93          	srli	s11,s11,0x10
8000c5c0:	f40d9ce3          	bnez	s11,8000c518 <ip4_frag+0x1b0>
8000c5c4:	02ccd783          	lhu	a5,44(s9)
8000c5c8:	01490a33          	add	s4,s2,s4
8000c5cc:	010a1a13          	slli	s4,s4,0x10
8000c5d0:	013b9513          	slli	a0,s7,0x13
8000c5d4:	fed78793          	addi	a5,a5,-19
8000c5d8:	010a5a13          	srli	s4,s4,0x10
8000c5dc:	01355513          	srli	a0,a0,0x13
8000c5e0:	00f4d663          	bge	s1,a5,8000c5ec <ip4_frag+0x284>
8000c5e4:	00812783          	lw	a5,8(sp)
8000c5e8:	00078663          	beqz	a5,8000c5f4 <ip4_frag+0x28c>
8000c5ec:	000027b7          	lui	a5,0x2
8000c5f0:	00f56533          	or	a0,a0,a5
8000c5f4:	8e4fa0ef          	jal	ra,800066d8 <lwip_htons>
8000c5f8:	00a98323          	sb	a0,6(s3)
8000c5fc:	00855513          	srli	a0,a0,0x8
8000c600:	00a983a3          	sb	a0,7(s3)
8000c604:	014a8513          	addi	a0,s5,20
8000c608:	01051513          	slli	a0,a0,0x10
8000c60c:	01055513          	srli	a0,a0,0x10
8000c610:	8c8fa0ef          	jal	ra,800066d8 <lwip_htons>
8000c614:	00a98123          	sb	a0,2(s3)
8000c618:	00855513          	srli	a0,a0,0x8
8000c61c:	00a981a3          	sb	a0,3(s3)
8000c620:	01400593          	li	a1,20
8000c624:	00098523          	sb	zero,10(s3)
8000c628:	000985a3          	sb	zero,11(s3)
8000c62c:	00098513          	mv	a0,s3
8000c630:	e9cfa0ef          	jal	ra,80006ccc <inet_chksum>
8000c634:	00a98523          	sb	a0,10(s3)
8000c638:	00855513          	srli	a0,a0,0x8
8000c63c:	00a985a3          	sb	a0,11(s3)
8000c640:	014ca783          	lw	a5,20(s9)
8000c644:	00c12603          	lw	a2,12(sp)
8000c648:	000b0593          	mv	a1,s6
8000c64c:	000c8513          	mv	a0,s9
8000c650:	000780e7          	jalr	a5 # 2000 <_stack_size+0x1000>
8000c654:	060d2783          	lw	a5,96(s10)
8000c658:	000b0513          	mv	a0,s6
8000c65c:	415484b3          	sub	s1,s1,s5
8000c660:	00178793          	addi	a5,a5,1
8000c664:	06fd2023          	sw	a5,96(s10)
8000c668:	a94fb0ef          	jal	ra,800078fc <pbuf_free>
8000c66c:	00412783          	lw	a5,4(sp)
8000c670:	01049493          	slli	s1,s1,0x10
8000c674:	0104d493          	srli	s1,s1,0x10
8000c678:	00fb8bb3          	add	s7,s7,a5
8000c67c:	010b9b93          	slli	s7,s7,0x10
8000c680:	010bdb93          	srli	s7,s7,0x10
8000c684:	dddff06f          	j	8000c460 <ip4_frag+0xf8>
8000c688:	ffa00513          	li	a0,-6
8000c68c:	dddff06f          	j	8000c468 <ip4_frag+0x100>

8000c690 <ip4_input_accept>:
8000c690:	03554783          	lbu	a5,53(a0)
8000c694:	0017f793          	andi	a5,a5,1
8000c698:	04078063          	beqz	a5,8000c6d8 <ip4_input_accept+0x48>
8000c69c:	00452703          	lw	a4,4(a0)
8000c6a0:	00050593          	mv	a1,a0
8000c6a4:	00000513          	li	a0,0
8000c6a8:	02070c63          	beqz	a4,8000c6e0 <ip4_input_accept+0x50>
8000c6ac:	a281a783          	lw	a5,-1496(gp) # 80003498 <ip_data+0x14>
8000c6b0:	00100513          	li	a0,1
8000c6b4:	02f70663          	beq	a4,a5,8000c6e0 <ip4_input_accept+0x50>
8000c6b8:	ff010113          	addi	sp,sp,-16
8000c6bc:	00078513          	mv	a0,a5
8000c6c0:	00112623          	sw	ra,12(sp)
8000c6c4:	7e4000ef          	jal	ra,8000cea8 <ip4_addr_isbroadcast_u32>
8000c6c8:	00c12083          	lw	ra,12(sp)
8000c6cc:	00a03533          	snez	a0,a0
8000c6d0:	01010113          	addi	sp,sp,16
8000c6d4:	00008067          	ret
8000c6d8:	00000513          	li	a0,0
8000c6dc:	00008067          	ret
8000c6e0:	00008067          	ret

8000c6e4 <ip4_route>:
8000c6e4:	8f41a783          	lw	a5,-1804(gp) # 80003364 <netif_list>
8000c6e8:	04079463          	bnez	a5,8000c730 <ip4_route+0x4c>
8000c6ec:	8f01a703          	lw	a4,-1808(gp) # 80003360 <netif_default>
8000c6f0:	02070463          	beqz	a4,8000c718 <ip4_route+0x34>
8000c6f4:	03574683          	lbu	a3,53(a4)
8000c6f8:	00500613          	li	a2,5
8000c6fc:	0056f693          	andi	a3,a3,5
8000c700:	00c69c63          	bne	a3,a2,8000c718 <ip4_route+0x34>
8000c704:	00472683          	lw	a3,4(a4)
8000c708:	00068863          	beqz	a3,8000c718 <ip4_route+0x34>
8000c70c:	00054603          	lbu	a2,0(a0)
8000c710:	07f00693          	li	a3,127
8000c714:	06d61463          	bne	a2,a3,8000c77c <ip4_route+0x98>
8000c718:	a2c18713          	addi	a4,gp,-1492 # 8000349c <lwip_stats>
8000c71c:	0ac72683          	lw	a3,172(a4)
8000c720:	00168693          	addi	a3,a3,1
8000c724:	0ad72623          	sw	a3,172(a4)
8000c728:	00078513          	mv	a0,a5
8000c72c:	00008067          	ret
8000c730:	0357c683          	lbu	a3,53(a5)
8000c734:	0016f713          	andi	a4,a3,1
8000c738:	02070e63          	beqz	a4,8000c774 <ip4_route+0x90>
8000c73c:	0026d713          	srli	a4,a3,0x2
8000c740:	00177713          	andi	a4,a4,1
8000c744:	02070863          	beqz	a4,8000c774 <ip4_route+0x90>
8000c748:	0047a703          	lw	a4,4(a5)
8000c74c:	02070463          	beqz	a4,8000c774 <ip4_route+0x90>
8000c750:	00052603          	lw	a2,0(a0)
8000c754:	0087a583          	lw	a1,8(a5)
8000c758:	00c74733          	xor	a4,a4,a2
8000c75c:	00b77733          	and	a4,a4,a1
8000c760:	fc0704e3          	beqz	a4,8000c728 <ip4_route+0x44>
8000c764:	0026f693          	andi	a3,a3,2
8000c768:	00069663          	bnez	a3,8000c774 <ip4_route+0x90>
8000c76c:	00c7a703          	lw	a4,12(a5)
8000c770:	fae60ce3          	beq	a2,a4,8000c728 <ip4_route+0x44>
8000c774:	0007a783          	lw	a5,0(a5)
8000c778:	f71ff06f          	j	8000c6e8 <ip4_route+0x4>
8000c77c:	00070793          	mv	a5,a4
8000c780:	fa9ff06f          	j	8000c728 <ip4_route+0x44>

8000c784 <ip4_input>:
8000c784:	fd010113          	addi	sp,sp,-48
8000c788:	02812423          	sw	s0,40(sp)
8000c78c:	03212023          	sw	s2,32(sp)
8000c790:	02112623          	sw	ra,44(sp)
8000c794:	02912223          	sw	s1,36(sp)
8000c798:	01312e23          	sw	s3,28(sp)
8000c79c:	01412c23          	sw	s4,24(sp)
8000c7a0:	01512a23          	sw	s5,20(sp)
8000c7a4:	01612823          	sw	s6,16(sp)
8000c7a8:	01712623          	sw	s7,12(sp)
8000c7ac:	01812423          	sw	s8,8(sp)
8000c7b0:	a2c18913          	addi	s2,gp,-1492 # 8000349c <lwip_stats>
8000c7b4:	09492783          	lw	a5,148(s2)
8000c7b8:	00178793          	addi	a5,a5,1
8000c7bc:	08f92a23          	sw	a5,148(s2)
8000c7c0:	00452483          	lw	s1,4(a0)
8000c7c4:	00400793          	li	a5,4
8000c7c8:	0004cb03          	lbu	s6,0(s1)
8000c7cc:	004b5713          	srli	a4,s6,0x4
8000c7d0:	04f70a63          	beq	a4,a5,8000c824 <ip4_input+0xa0>
8000c7d4:	928fb0ef          	jal	ra,800078fc <pbuf_free>
8000c7d8:	0b892783          	lw	a5,184(s2)
8000c7dc:	00178793          	addi	a5,a5,1
8000c7e0:	0af92c23          	sw	a5,184(s2)
8000c7e4:	09c92783          	lw	a5,156(s2)
8000c7e8:	00178793          	addi	a5,a5,1
8000c7ec:	08f92e23          	sw	a5,156(s2)
8000c7f0:	02c12083          	lw	ra,44(sp)
8000c7f4:	02812403          	lw	s0,40(sp)
8000c7f8:	02412483          	lw	s1,36(sp)
8000c7fc:	02012903          	lw	s2,32(sp)
8000c800:	01c12983          	lw	s3,28(sp)
8000c804:	01812a03          	lw	s4,24(sp)
8000c808:	01412a83          	lw	s5,20(sp)
8000c80c:	01012b03          	lw	s6,16(sp)
8000c810:	00c12b83          	lw	s7,12(sp)
8000c814:	00812c03          	lw	s8,8(sp)
8000c818:	00000513          	li	a0,0
8000c81c:	03010113          	addi	sp,sp,48
8000c820:	00008067          	ret
8000c824:	0034c783          	lbu	a5,3(s1)
8000c828:	00050993          	mv	s3,a0
8000c82c:	0024c503          	lbu	a0,2(s1)
8000c830:	00879793          	slli	a5,a5,0x8
8000c834:	00058a93          	mv	s5,a1
8000c838:	00a7e533          	or	a0,a5,a0
8000c83c:	e9df90ef          	jal	ra,800066d8 <lwip_htons>
8000c840:	00fb7b13          	andi	s6,s6,15
8000c844:	0089d783          	lhu	a5,8(s3)
8000c848:	002b1b13          	slli	s6,s6,0x2
8000c84c:	010b1913          	slli	s2,s6,0x10
8000c850:	a2c18413          	addi	s0,gp,-1492 # 8000349c <lwip_stats>
8000c854:	01095913          	srli	s2,s2,0x10
8000c858:	00050a13          	mv	s4,a0
8000c85c:	00f57863          	bgeu	a0,a5,8000c86c <ip4_input+0xe8>
8000c860:	00050593          	mv	a1,a0
8000c864:	00098513          	mv	a0,s3
8000c868:	b38fb0ef          	jal	ra,80007ba0 <pbuf_realloc>
8000c86c:	00a9d783          	lhu	a5,10(s3)
8000c870:	0127ea63          	bltu	a5,s2,8000c884 <ip4_input+0x100>
8000c874:	0089d783          	lhu	a5,8(s3)
8000c878:	0147e663          	bltu	a5,s4,8000c884 <ip4_input+0x100>
8000c87c:	01300793          	li	a5,19
8000c880:	0327e463          	bltu	a5,s2,8000c8a8 <ip4_input+0x124>
8000c884:	00098513          	mv	a0,s3
8000c888:	874fb0ef          	jal	ra,800078fc <pbuf_free>
8000c88c:	0a442783          	lw	a5,164(s0)
8000c890:	00178793          	addi	a5,a5,1
8000c894:	0af42223          	sw	a5,164(s0)
8000c898:	09c42783          	lw	a5,156(s0)
8000c89c:	00178793          	addi	a5,a5,1
8000c8a0:	08f42e23          	sw	a5,156(s0)
8000c8a4:	f4dff06f          	j	8000c7f0 <ip4_input+0x6c>
8000c8a8:	00090593          	mv	a1,s2
8000c8ac:	00048513          	mv	a0,s1
8000c8b0:	c1cfa0ef          	jal	ra,80006ccc <inet_chksum>
8000c8b4:	00050e63          	beqz	a0,8000c8d0 <ip4_input+0x14c>
8000c8b8:	00098513          	mv	a0,s3
8000c8bc:	840fb0ef          	jal	ra,800078fc <pbuf_free>
8000c8c0:	0a042783          	lw	a5,160(s0)
8000c8c4:	00178793          	addi	a5,a5,1
8000c8c8:	0af42023          	sw	a5,160(s0)
8000c8cc:	fcdff06f          	j	8000c898 <ip4_input+0x114>
8000c8d0:	0114c703          	lbu	a4,17(s1)
8000c8d4:	0104c783          	lbu	a5,16(s1)
8000c8d8:	00871713          	slli	a4,a4,0x8
8000c8dc:	00f76733          	or	a4,a4,a5
8000c8e0:	0124c783          	lbu	a5,18(s1)
8000c8e4:	a1418613          	addi	a2,gp,-1516 # 80003484 <ip_data>
8000c8e8:	a1418913          	addi	s2,gp,-1516 # 80003484 <ip_data>
8000c8ec:	01079793          	slli	a5,a5,0x10
8000c8f0:	00e7e733          	or	a4,a5,a4
8000c8f4:	0134c783          	lbu	a5,19(s1)
8000c8f8:	01879793          	slli	a5,a5,0x18
8000c8fc:	00e7e7b3          	or	a5,a5,a4
8000c900:	00f62a23          	sw	a5,20(a2)
8000c904:	00d4c683          	lbu	a3,13(s1)
8000c908:	00c4c703          	lbu	a4,12(s1)
8000c90c:	0f07f793          	andi	a5,a5,240
8000c910:	00869693          	slli	a3,a3,0x8
8000c914:	00e6e6b3          	or	a3,a3,a4
8000c918:	00e4c703          	lbu	a4,14(s1)
8000c91c:	01071713          	slli	a4,a4,0x10
8000c920:	00d766b3          	or	a3,a4,a3
8000c924:	00f4c703          	lbu	a4,15(s1)
8000c928:	01871713          	slli	a4,a4,0x18
8000c92c:	00d76733          	or	a4,a4,a3
8000c930:	00e62823          	sw	a4,16(a2)
8000c934:	0e000713          	li	a4,224
8000c938:	06e79063          	bne	a5,a4,8000c998 <ip4_input+0x214>
8000c93c:	035ac783          	lbu	a5,53(s5)
8000c940:	0017f793          	andi	a5,a5,1
8000c944:	00079c63          	bnez	a5,8000c95c <ip4_input+0x1d8>
8000c948:	0094c703          	lbu	a4,9(s1)
8000c94c:	01100793          	li	a5,17
8000c950:	08f70663          	beq	a4,a5,8000c9dc <ip4_input+0x258>
8000c954:	00000a13          	li	s4,0
8000c958:	0100006f          	j	8000c968 <ip4_input+0x1e4>
8000c95c:	004aa783          	lw	a5,4(s5)
8000c960:	fe0784e3          	beqz	a5,8000c948 <ip4_input+0x1c4>
8000c964:	000a8a13          	mv	s4,s5
8000c968:	01092503          	lw	a0,16(s2)
8000c96c:	08050a63          	beqz	a0,8000ca00 <ip4_input+0x27c>
8000c970:	000a8593          	mv	a1,s5
8000c974:	534000ef          	jal	ra,8000cea8 <ip4_addr_isbroadcast_u32>
8000c978:	00051a63          	bnez	a0,8000c98c <ip4_input+0x208>
8000c97c:	01092783          	lw	a5,16(s2)
8000c980:	0e000713          	li	a4,224
8000c984:	0f07f793          	andi	a5,a5,240
8000c988:	06e79c63          	bne	a5,a4,8000ca00 <ip4_input+0x27c>
8000c98c:	00098513          	mv	a0,s3
8000c990:	f6dfa0ef          	jal	ra,800078fc <pbuf_free>
8000c994:	f05ff06f          	j	8000c898 <ip4_input+0x114>
8000c998:	000a8513          	mv	a0,s5
8000c99c:	cf5ff0ef          	jal	ra,8000c690 <ip4_input_accept>
8000c9a0:	02051a63          	bnez	a0,8000c9d4 <ip4_input+0x250>
8000c9a4:	01494703          	lbu	a4,20(s2)
8000c9a8:	07f00793          	li	a5,127
8000c9ac:	f8f70ee3          	beq	a4,a5,8000c948 <ip4_input+0x1c4>
8000c9b0:	8f41aa03          	lw	s4,-1804(gp) # 80003364 <netif_list>
8000c9b4:	f80a0ae3          	beqz	s4,8000c948 <ip4_input+0x1c4>
8000c9b8:	015a1663          	bne	s4,s5,8000c9c4 <ip4_input+0x240>
8000c9bc:	000a2a03          	lw	s4,0(s4)
8000c9c0:	ff5ff06f          	j	8000c9b4 <ip4_input+0x230>
8000c9c4:	000a0513          	mv	a0,s4
8000c9c8:	cc9ff0ef          	jal	ra,8000c690 <ip4_input_accept>
8000c9cc:	fe0508e3          	beqz	a0,8000c9bc <ip4_input+0x238>
8000c9d0:	f99ff06f          	j	8000c968 <ip4_input+0x1e4>
8000c9d4:	f80a98e3          	bnez	s5,8000c964 <ip4_input+0x1e0>
8000c9d8:	f71ff06f          	j	8000c948 <ip4_input+0x1c4>
8000c9dc:	01648733          	add	a4,s1,s6
8000c9e0:	00374783          	lbu	a5,3(a4)
8000c9e4:	00274683          	lbu	a3,2(a4)
8000c9e8:	00004737          	lui	a4,0x4
8000c9ec:	00879793          	slli	a5,a5,0x8
8000c9f0:	00d7e7b3          	or	a5,a5,a3
8000c9f4:	40070713          	addi	a4,a4,1024 # 4400 <_stack_size+0x3400>
8000c9f8:	f4e79ee3          	bne	a5,a4,8000c954 <ip4_input+0x1d0>
8000c9fc:	000a8a13          	mv	s4,s5
8000ca00:	000a1e63          	bnez	s4,8000ca1c <ip4_input+0x298>
8000ca04:	09c42783          	lw	a5,156(s0)
8000ca08:	00098513          	mv	a0,s3
8000ca0c:	00178793          	addi	a5,a5,1
8000ca10:	08f42e23          	sw	a5,156(s0)
8000ca14:	ee9fa0ef          	jal	ra,800078fc <pbuf_free>
8000ca18:	dd9ff06f          	j	8000c7f0 <ip4_input+0x6c>
8000ca1c:	0064c783          	lbu	a5,6(s1)
8000ca20:	0074c703          	lbu	a4,7(s1)
8000ca24:	03f7f793          	andi	a5,a5,63
8000ca28:	00871713          	slli	a4,a4,0x8
8000ca2c:	00e7e7b3          	or	a5,a5,a4
8000ca30:	00078e63          	beqz	a5,8000ca4c <ip4_input+0x2c8>
8000ca34:	00098513          	mv	a0,s3
8000ca38:	ec5fa0ef          	jal	ra,800078fc <pbuf_free>
8000ca3c:	0b442783          	lw	a5,180(s0)
8000ca40:	00178793          	addi	a5,a5,1
8000ca44:	0af42a23          	sw	a5,180(s0)
8000ca48:	e51ff06f          	j	8000c898 <ip4_input+0x114>
8000ca4c:	01492023          	sw	s4,0(s2)
8000ca50:	01592223          	sw	s5,4(s2)
8000ca54:	00992423          	sw	s1,8(s2)
8000ca58:	0004c783          	lbu	a5,0(s1)
8000ca5c:	000a8593          	mv	a1,s5
8000ca60:	00098513          	mv	a0,s3
8000ca64:	00f7f793          	andi	a5,a5,15
8000ca68:	00279793          	slli	a5,a5,0x2
8000ca6c:	00f91623          	sh	a5,12(s2)
8000ca70:	00100c13          	li	s8,1
8000ca74:	a7dfb0ef          	jal	ra,800084f0 <raw_input>
8000ca78:	00050b93          	mv	s7,a0
8000ca7c:	03850663          	beq	a0,s8,8000caa8 <ip4_input+0x324>
8000ca80:	000b0593          	mv	a1,s6
8000ca84:	00098513          	mv	a0,s3
8000ca88:	dedfa0ef          	jal	ra,80007874 <pbuf_remove_header>
8000ca8c:	0094c783          	lbu	a5,9(s1)
8000ca90:	03878a63          	beq	a5,s8,8000cac4 <ip4_input+0x340>
8000ca94:	01100713          	li	a4,17
8000ca98:	02e79e63          	bne	a5,a4,8000cad4 <ip4_input+0x350>
8000ca9c:	000a8593          	mv	a1,s5
8000caa0:	00098513          	mv	a0,s3
8000caa4:	a40fc0ef          	jal	ra,80008ce4 <udp_input>
8000caa8:	00092023          	sw	zero,0(s2)
8000caac:	00092223          	sw	zero,4(s2)
8000cab0:	00092423          	sw	zero,8(s2)
8000cab4:	00091623          	sh	zero,12(s2)
8000cab8:	00092823          	sw	zero,16(s2)
8000cabc:	00092a23          	sw	zero,20(s2)
8000cac0:	d31ff06f          	j	8000c7f0 <ip4_input+0x6c>
8000cac4:	000a8593          	mv	a1,s5
8000cac8:	00098513          	mv	a0,s3
8000cacc:	c18ff0ef          	jal	ra,8000bee4 <icmp_input>
8000cad0:	fd9ff06f          	j	8000caa8 <ip4_input+0x324>
8000cad4:	00200793          	li	a5,2
8000cad8:	04fb8a63          	beq	s7,a5,8000cb2c <ip4_input+0x3a8>
8000cadc:	01492503          	lw	a0,20(s2)
8000cae0:	000a0593          	mv	a1,s4
8000cae4:	3c4000ef          	jal	ra,8000cea8 <ip4_addr_isbroadcast_u32>
8000cae8:	02051663          	bnez	a0,8000cb14 <ip4_input+0x390>
8000caec:	01492783          	lw	a5,20(s2)
8000caf0:	0e000713          	li	a4,224
8000caf4:	0f07f793          	andi	a5,a5,240
8000caf8:	00e78e63          	beq	a5,a4,8000cb14 <ip4_input+0x390>
8000cafc:	000b0593          	mv	a1,s6
8000cb00:	00098513          	mv	a0,s3
8000cb04:	de5fa0ef          	jal	ra,800078e8 <pbuf_header_force>
8000cb08:	00200593          	li	a1,2
8000cb0c:	00098513          	mv	a0,s3
8000cb10:	ef8ff0ef          	jal	ra,8000c208 <icmp_dest_unreach>
8000cb14:	0b042783          	lw	a5,176(s0)
8000cb18:	00178793          	addi	a5,a5,1
8000cb1c:	0af42823          	sw	a5,176(s0)
8000cb20:	09c42783          	lw	a5,156(s0)
8000cb24:	00178793          	addi	a5,a5,1
8000cb28:	08f42e23          	sw	a5,156(s0)
8000cb2c:	00098513          	mv	a0,s3
8000cb30:	dcdfa0ef          	jal	ra,800078fc <pbuf_free>
8000cb34:	f75ff06f          	j	8000caa8 <ip4_input+0x324>

8000cb38 <ip4_output_if_src>:
8000cb38:	fc010113          	addi	sp,sp,-64
8000cb3c:	03212823          	sw	s2,48(sp)
8000cb40:	03412423          	sw	s4,40(sp)
8000cb44:	03512223          	sw	s5,36(sp)
8000cb48:	02112e23          	sw	ra,60(sp)
8000cb4c:	02812c23          	sw	s0,56(sp)
8000cb50:	02912a23          	sw	s1,52(sp)
8000cb54:	03312623          	sw	s3,44(sp)
8000cb58:	03612023          	sw	s6,32(sp)
8000cb5c:	00d12623          	sw	a3,12(sp)
8000cb60:	00f12423          	sw	a5,8(sp)
8000cb64:	00c12223          	sw	a2,4(sp)
8000cb68:	00050913          	mv	s2,a0
8000cb6c:	00080a13          	mv	s4,a6
8000cb70:	a2c18a93          	addi	s5,gp,-1492 # 8000349c <lwip_stats>
8000cb74:	1a060863          	beqz	a2,8000cd24 <ip4_output_if_src+0x1ec>
8000cb78:	00058993          	mv	s3,a1
8000cb7c:	01400593          	li	a1,20
8000cb80:	00070493          	mv	s1,a4
8000cb84:	ce1fa0ef          	jal	ra,80007864 <pbuf_add_header>
8000cb88:	00412603          	lw	a2,4(sp)
8000cb8c:	00812783          	lw	a5,8(sp)
8000cb90:	00c12683          	lw	a3,12(sp)
8000cb94:	02050e63          	beqz	a0,8000cbd0 <ip4_output_if_src+0x98>
8000cb98:	0b8aa783          	lw	a5,184(s5)
8000cb9c:	ffe00513          	li	a0,-2
8000cba0:	00178793          	addi	a5,a5,1
8000cba4:	0afaac23          	sw	a5,184(s5)
8000cba8:	03c12083          	lw	ra,60(sp)
8000cbac:	03812403          	lw	s0,56(sp)
8000cbb0:	03412483          	lw	s1,52(sp)
8000cbb4:	03012903          	lw	s2,48(sp)
8000cbb8:	02c12983          	lw	s3,44(sp)
8000cbbc:	02812a03          	lw	s4,40(sp)
8000cbc0:	02412a83          	lw	s5,36(sp)
8000cbc4:	02012b03          	lw	s6,32(sp)
8000cbc8:	04010113          	addi	sp,sp,64
8000cbcc:	00008067          	ret
8000cbd0:	00492403          	lw	s0,4(s2)
8000cbd4:	00c12223          	sw	a2,4(sp)
8000cbd8:	00d40423          	sb	a3,8(s0)
8000cbdc:	00f404a3          	sb	a5,9(s0)
8000cbe0:	00869693          	slli	a3,a3,0x8
8000cbe4:	00f6e7b3          	or	a5,a3,a5
8000cbe8:	00062683          	lw	a3,0(a2)
8000cbec:	009400a3          	sb	s1,1(s0)
8000cbf0:	00849493          	slli	s1,s1,0x8
8000cbf4:	0086d593          	srli	a1,a3,0x8
8000cbf8:	00d40823          	sb	a3,16(s0)
8000cbfc:	00b408a3          	sb	a1,17(s0)
8000cc00:	0186d513          	srli	a0,a3,0x18
8000cc04:	0106d593          	srli	a1,a3,0x10
8000cc08:	01069693          	slli	a3,a3,0x10
8000cc0c:	0106d693          	srli	a3,a3,0x10
8000cc10:	00b686b3          	add	a3,a3,a1
8000cc14:	00a409a3          	sb	a0,19(s0)
8000cc18:	0454e493          	ori	s1,s1,69
8000cc1c:	04500513          	li	a0,69
8000cc20:	00b40923          	sb	a1,18(s0)
8000cc24:	00a40023          	sb	a0,0(s0)
8000cc28:	00d484b3          	add	s1,s1,a3
8000cc2c:	00879693          	slli	a3,a5,0x8
8000cc30:	4087d793          	srai	a5,a5,0x8
8000cc34:	00f6e7b3          	or	a5,a3,a5
8000cc38:	00895503          	lhu	a0,8(s2)
8000cc3c:	01079793          	slli	a5,a5,0x10
8000cc40:	0107d793          	srli	a5,a5,0x10
8000cc44:	00f484b3          	add	s1,s1,a5
8000cc48:	a91f90ef          	jal	ra,800066d8 <lwip_htons>
8000cc4c:	00855793          	srli	a5,a0,0x8
8000cc50:	00a40123          	sb	a0,2(s0)
8000cc54:	009504b3          	add	s1,a0,s1
8000cc58:	9181d503          	lhu	a0,-1768(gp) # 80003388 <ip_id>
8000cc5c:	00f401a3          	sb	a5,3(s0)
8000cc60:	00040323          	sb	zero,6(s0)
8000cc64:	000403a3          	sb	zero,7(s0)
8000cc68:	a71f90ef          	jal	ra,800066d8 <lwip_htons>
8000cc6c:	00855793          	srli	a5,a0,0x8
8000cc70:	00f402a3          	sb	a5,5(s0)
8000cc74:	9181d783          	lhu	a5,-1768(gp) # 80003388 <ip_id>
8000cc78:	00a40223          	sb	a0,4(s0)
8000cc7c:	00412603          	lw	a2,4(sp)
8000cc80:	00178793          	addi	a5,a5,1
8000cc84:	90f19c23          	sh	a5,-1768(gp) # 80003388 <ip_id>
8000cc88:	00950533          	add	a0,a0,s1
8000cc8c:	08099863          	bnez	s3,8000cd1c <ip4_output_if_src+0x1e4>
8000cc90:	8481a703          	lw	a4,-1976(gp) # 800032b8 <ip_addr_any>
8000cc94:	01875693          	srli	a3,a4,0x18
8000cc98:	00d407a3          	sb	a3,15(s0)
8000cc9c:	000106b7          	lui	a3,0x10
8000cca0:	00875793          	srli	a5,a4,0x8
8000cca4:	fff68693          	addi	a3,a3,-1 # ffff <_stack_size+0xefff>
8000cca8:	00e40623          	sb	a4,12(s0)
8000ccac:	00f406a3          	sb	a5,13(s0)
8000ccb0:	01075793          	srli	a5,a4,0x10
8000ccb4:	00d77733          	and	a4,a4,a3
8000ccb8:	00a70733          	add	a4,a4,a0
8000ccbc:	00e78733          	add	a4,a5,a4
8000ccc0:	00f40723          	sb	a5,14(s0)
8000ccc4:	01075793          	srli	a5,a4,0x10
8000ccc8:	00d77733          	and	a4,a4,a3
8000cccc:	00e78733          	add	a4,a5,a4
8000ccd0:	01075793          	srli	a5,a4,0x10
8000ccd4:	00e787b3          	add	a5,a5,a4
8000ccd8:	fff7c793          	not	a5,a5
8000ccdc:	01079793          	slli	a5,a5,0x10
8000cce0:	0107d793          	srli	a5,a5,0x10
8000cce4:	00f40523          	sb	a5,10(s0)
8000cce8:	0087d793          	srli	a5,a5,0x8
8000ccec:	00f405a3          	sb	a5,11(s0)
8000ccf0:	090aa783          	lw	a5,144(s5)
8000ccf4:	00178793          	addi	a5,a5,1
8000ccf8:	08faa823          	sw	a5,144(s5)
8000ccfc:	02ca5783          	lhu	a5,44(s4)
8000cd00:	06078463          	beqz	a5,8000cd68 <ip4_output_if_src+0x230>
8000cd04:	00895703          	lhu	a4,8(s2)
8000cd08:	06e7f063          	bgeu	a5,a4,8000cd68 <ip4_output_if_src+0x230>
8000cd0c:	000a0593          	mv	a1,s4
8000cd10:	00090513          	mv	a0,s2
8000cd14:	e54ff0ef          	jal	ra,8000c368 <ip4_frag>
8000cd18:	e91ff06f          	j	8000cba8 <ip4_output_if_src+0x70>
8000cd1c:	0009a703          	lw	a4,0(s3)
8000cd20:	f75ff06f          	j	8000cc94 <ip4_output_if_src+0x15c>
8000cd24:	00a55703          	lhu	a4,10(a0)
8000cd28:	01300793          	li	a5,19
8000cd2c:	e6e7f6e3          	bgeu	a5,a4,8000cb98 <ip4_output_if_src+0x60>
8000cd30:	00452683          	lw	a3,4(a0)
8000cd34:	01c10613          	addi	a2,sp,28
8000cd38:	0116c703          	lbu	a4,17(a3)
8000cd3c:	0106c783          	lbu	a5,16(a3)
8000cd40:	00871713          	slli	a4,a4,0x8
8000cd44:	00f76733          	or	a4,a4,a5
8000cd48:	0126c783          	lbu	a5,18(a3)
8000cd4c:	01079793          	slli	a5,a5,0x10
8000cd50:	00e7e733          	or	a4,a5,a4
8000cd54:	0136c783          	lbu	a5,19(a3)
8000cd58:	01879793          	slli	a5,a5,0x18
8000cd5c:	00e7e7b3          	or	a5,a5,a4
8000cd60:	00f12e23          	sw	a5,28(sp)
8000cd64:	f8dff06f          	j	8000ccf0 <ip4_output_if_src+0x1b8>
8000cd68:	014a2783          	lw	a5,20(s4)
8000cd6c:	00090593          	mv	a1,s2
8000cd70:	000a0513          	mv	a0,s4
8000cd74:	000780e7          	jalr	a5
8000cd78:	e31ff06f          	j	8000cba8 <ip4_output_if_src+0x70>

8000cd7c <ip4_output_if>:
8000cd7c:	00060a63          	beqz	a2,8000cd90 <ip4_output_if+0x14>
8000cd80:	00058663          	beqz	a1,8000cd8c <ip4_output_if+0x10>
8000cd84:	0005a883          	lw	a7,0(a1)
8000cd88:	00089463          	bnez	a7,8000cd90 <ip4_output_if+0x14>
8000cd8c:	00480593          	addi	a1,a6,4
8000cd90:	da9ff06f          	j	8000cb38 <ip4_output_if_src>

8000cd94 <ip4_output>:
8000cd94:	fd010113          	addi	sp,sp,-48
8000cd98:	02812423          	sw	s0,40(sp)
8000cd9c:	00050413          	mv	s0,a0
8000cda0:	00060513          	mv	a0,a2
8000cda4:	00b12e23          	sw	a1,28(sp)
8000cda8:	00d12c23          	sw	a3,24(sp)
8000cdac:	00e12a23          	sw	a4,20(sp)
8000cdb0:	00f12823          	sw	a5,16(sp)
8000cdb4:	00c12623          	sw	a2,12(sp)
8000cdb8:	02112623          	sw	ra,44(sp)
8000cdbc:	929ff0ef          	jal	ra,8000c6e4 <ip4_route>
8000cdc0:	00c12603          	lw	a2,12(sp)
8000cdc4:	01012783          	lw	a5,16(sp)
8000cdc8:	01412703          	lw	a4,20(sp)
8000cdcc:	01812683          	lw	a3,24(sp)
8000cdd0:	01c12583          	lw	a1,28(sp)
8000cdd4:	00050e63          	beqz	a0,8000cdf0 <ip4_output+0x5c>
8000cdd8:	00050813          	mv	a6,a0
8000cddc:	00040513          	mv	a0,s0
8000cde0:	02812403          	lw	s0,40(sp)
8000cde4:	02c12083          	lw	ra,44(sp)
8000cde8:	03010113          	addi	sp,sp,48
8000cdec:	f91ff06f          	j	8000cd7c <ip4_output_if>
8000cdf0:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000cdf4:	0ac7a703          	lw	a4,172(a5)
8000cdf8:	ffc00513          	li	a0,-4
8000cdfc:	00170713          	addi	a4,a4,1
8000ce00:	0ae7a623          	sw	a4,172(a5)
8000ce04:	02c12083          	lw	ra,44(sp)
8000ce08:	02812403          	lw	s0,40(sp)
8000ce0c:	03010113          	addi	sp,sp,48
8000ce10:	00008067          	ret

8000ce14 <ip4_output_hinted>:
8000ce14:	fd010113          	addi	sp,sp,-48
8000ce18:	02912223          	sw	s1,36(sp)
8000ce1c:	00050493          	mv	s1,a0
8000ce20:	00060513          	mv	a0,a2
8000ce24:	00b12e23          	sw	a1,28(sp)
8000ce28:	00d12c23          	sw	a3,24(sp)
8000ce2c:	00e12a23          	sw	a4,20(sp)
8000ce30:	00f12823          	sw	a5,16(sp)
8000ce34:	01012623          	sw	a6,12(sp)
8000ce38:	00c12423          	sw	a2,8(sp)
8000ce3c:	02112623          	sw	ra,44(sp)
8000ce40:	02812423          	sw	s0,40(sp)
8000ce44:	8a1ff0ef          	jal	ra,8000c6e4 <ip4_route>
8000ce48:	00812603          	lw	a2,8(sp)
8000ce4c:	00c12803          	lw	a6,12(sp)
8000ce50:	01012783          	lw	a5,16(sp)
8000ce54:	01412703          	lw	a4,20(sp)
8000ce58:	01812683          	lw	a3,24(sp)
8000ce5c:	01c12583          	lw	a1,28(sp)
8000ce60:	02051663          	bnez	a0,8000ce8c <ip4_output_hinted+0x78>
8000ce64:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000ce68:	0ac7a703          	lw	a4,172(a5)
8000ce6c:	ffc00513          	li	a0,-4
8000ce70:	00170713          	addi	a4,a4,1
8000ce74:	0ae7a623          	sw	a4,172(a5)
8000ce78:	02c12083          	lw	ra,44(sp)
8000ce7c:	02812403          	lw	s0,40(sp)
8000ce80:	02412483          	lw	s1,36(sp)
8000ce84:	03010113          	addi	sp,sp,48
8000ce88:	00008067          	ret
8000ce8c:	03052e23          	sw	a6,60(a0)
8000ce90:	00050413          	mv	s0,a0
8000ce94:	00050813          	mv	a6,a0
8000ce98:	00048513          	mv	a0,s1
8000ce9c:	ee1ff0ef          	jal	ra,8000cd7c <ip4_output_if>
8000cea0:	02042e23          	sw	zero,60(s0)
8000cea4:	fd5ff06f          	j	8000ce78 <ip4_output_hinted+0x64>

8000cea8 <ip4_addr_isbroadcast_u32>:
8000cea8:	fff50693          	addi	a3,a0,-1
8000ceac:	ffd00793          	li	a5,-3
8000ceb0:	00050713          	mv	a4,a0
8000ceb4:	04d7e063          	bltu	a5,a3,8000cef4 <ip4_addr_isbroadcast_u32+0x4c>
8000ceb8:	0355c783          	lbu	a5,53(a1)
8000cebc:	0027f513          	andi	a0,a5,2
8000cec0:	02050c63          	beqz	a0,8000cef8 <ip4_addr_isbroadcast_u32+0x50>
8000cec4:	0045a783          	lw	a5,4(a1)
8000cec8:	00000513          	li	a0,0
8000cecc:	02e78663          	beq	a5,a4,8000cef8 <ip4_addr_isbroadcast_u32+0x50>
8000ced0:	0085a683          	lw	a3,8(a1)
8000ced4:	00e7c7b3          	xor	a5,a5,a4
8000ced8:	00d7f7b3          	and	a5,a5,a3
8000cedc:	00079e63          	bnez	a5,8000cef8 <ip4_addr_isbroadcast_u32+0x50>
8000cee0:	fff6c693          	not	a3,a3
8000cee4:	00e6f533          	and	a0,a3,a4
8000cee8:	40d50533          	sub	a0,a0,a3
8000ceec:	00153513          	seqz	a0,a0
8000cef0:	00008067          	ret
8000cef4:	00100513          	li	a0,1
8000cef8:	00008067          	ret

8000cefc <ip4_addr_netmask_valid>:
8000cefc:	ff010113          	addi	sp,sp,-16
8000cf00:	00112623          	sw	ra,12(sp)
8000cf04:	fecf90ef          	jal	ra,800066f0 <lwip_htonl>
8000cf08:	02000713          	li	a4,32
8000cf0c:	800007b7          	lui	a5,0x80000
8000cf10:	00f576b3          	and	a3,a0,a5
8000cf14:	02068663          	beqz	a3,8000cf40 <ip4_addr_netmask_valid+0x44>
8000cf18:	fff70713          	addi	a4,a4,-1
8000cf1c:	0017d793          	srli	a5,a5,0x1
8000cf20:	fe0718e3          	bnez	a4,8000cf10 <ip4_addr_netmask_valid+0x14>
8000cf24:	00100513          	li	a0,1
8000cf28:	00c12083          	lw	ra,12(sp)
8000cf2c:	01010113          	addi	sp,sp,16
8000cf30:	00008067          	ret
8000cf34:	00a7f733          	and	a4,a5,a0
8000cf38:	00071863          	bnez	a4,8000cf48 <ip4_addr_netmask_valid+0x4c>
8000cf3c:	0017d793          	srli	a5,a5,0x1
8000cf40:	fe079ae3          	bnez	a5,8000cf34 <ip4_addr_netmask_valid+0x38>
8000cf44:	fe1ff06f          	j	8000cf24 <ip4_addr_netmask_valid+0x28>
8000cf48:	00000513          	li	a0,0
8000cf4c:	fddff06f          	j	8000cf28 <ip4_addr_netmask_valid+0x2c>

8000cf50 <ip4addr_aton>:
8000cf50:	fb010113          	addi	sp,sp,-80
8000cf54:	04812423          	sw	s0,72(sp)
8000cf58:	05212023          	sw	s2,64(sp)
8000cf5c:	03312e23          	sw	s3,60(sp)
8000cf60:	03512a23          	sw	s5,52(sp)
8000cf64:	03712623          	sw	s7,44(sp)
8000cf68:	03812423          	sw	s8,40(sp)
8000cf6c:	03912223          	sw	s9,36(sp)
8000cf70:	03a12023          	sw	s10,32(sp)
8000cf74:	01b12e23          	sw	s11,28(sp)
8000cf78:	04112623          	sw	ra,76(sp)
8000cf7c:	04912223          	sw	s1,68(sp)
8000cf80:	03412c23          	sw	s4,56(sp)
8000cf84:	03612823          	sw	s6,48(sp)
8000cf88:	00054483          	lbu	s1,0(a0)
8000cf8c:	00010913          	mv	s2,sp
8000cf90:	80003ab7          	lui	s5,0x80003
8000cf94:	00058993          	mv	s3,a1
8000cf98:	00090b93          	mv	s7,s2
8000cf9c:	f41a8a93          	addi	s5,s5,-191 # 80002f41 <_ram_heap_end+0xfffeaf41>
8000cfa0:	03000413          	li	s0,48
8000cfa4:	05800c13          	li	s8,88
8000cfa8:	01000c93          	li	s9,16
8000cfac:	00200d13          	li	s10,2
8000cfb0:	02e00d93          	li	s11,46
8000cfb4:	00c10713          	addi	a4,sp,12
8000cfb8:	015487b3          	add	a5,s1,s5
8000cfbc:	0007c783          	lbu	a5,0(a5) # 80000000 <_ram_heap_end+0xfffe8000>
8000cfc0:	0047f793          	andi	a5,a5,4
8000cfc4:	1c078a63          	beqz	a5,8000d198 <ip4addr_aton+0x248>
8000cfc8:	00a00b13          	li	s6,10
8000cfcc:	00849c63          	bne	s1,s0,8000cfe4 <ip4addr_aton+0x94>
8000cfd0:	00154483          	lbu	s1,1(a0)
8000cfd4:	0df4f793          	andi	a5,s1,223
8000cfd8:	05878463          	beq	a5,s8,8000d020 <ip4addr_aton+0xd0>
8000cfdc:	00150513          	addi	a0,a0,1
8000cfe0:	00800b13          	li	s6,8
8000cfe4:	00050a13          	mv	s4,a0
8000cfe8:	00000513          	li	a0,0
8000cfec:	009a87b3          	add	a5,s5,s1
8000cff0:	0007c783          	lbu	a5,0(a5)
8000cff4:	0047f693          	andi	a3,a5,4
8000cff8:	02068c63          	beqz	a3,8000d030 <ip4addr_aton+0xe0>
8000cffc:	00050593          	mv	a1,a0
8000d000:	000b0513          	mv	a0,s6
8000d004:	441000ef          	jal	ra,8000dc44 <__mulsi3>
8000d008:	00950533          	add	a0,a0,s1
8000d00c:	001a4483          	lbu	s1,1(s4)
8000d010:	fd050513          	addi	a0,a0,-48
8000d014:	00c10713          	addi	a4,sp,12
8000d018:	001a0a13          	addi	s4,s4,1
8000d01c:	fd1ff06f          	j	8000cfec <ip4addr_aton+0x9c>
8000d020:	00254483          	lbu	s1,2(a0)
8000d024:	01000b13          	li	s6,16
8000d028:	00250513          	addi	a0,a0,2
8000d02c:	fb9ff06f          	j	8000cfe4 <ip4addr_aton+0x94>
8000d030:	039b1a63          	bne	s6,s9,8000d064 <ip4addr_aton+0x114>
8000d034:	0447f693          	andi	a3,a5,68
8000d038:	02068663          	beqz	a3,8000d064 <ip4addr_aton+0x114>
8000d03c:	0037f793          	andi	a5,a5,3
8000d040:	00451513          	slli	a0,a0,0x4
8000d044:	00a48493          	addi	s1,s1,10
8000d048:	06100593          	li	a1,97
8000d04c:	01a78463          	beq	a5,s10,8000d054 <ip4addr_aton+0x104>
8000d050:	04100593          	li	a1,65
8000d054:	40b484b3          	sub	s1,s1,a1
8000d058:	00a4e533          	or	a0,s1,a0
8000d05c:	001a4483          	lbu	s1,1(s4)
8000d060:	fb9ff06f          	j	8000d018 <ip4addr_aton+0xc8>
8000d064:	01b49e63          	bne	s1,s11,8000d080 <ip4addr_aton+0x130>
8000d068:	12e90863          	beq	s2,a4,8000d198 <ip4addr_aton+0x248>
8000d06c:	00490913          	addi	s2,s2,4
8000d070:	fea92e23          	sw	a0,-4(s2)
8000d074:	001a4483          	lbu	s1,1(s4)
8000d078:	001a0513          	addi	a0,s4,1
8000d07c:	f3dff06f          	j	8000cfb8 <ip4addr_aton+0x68>
8000d080:	00048863          	beqz	s1,8000d090 <ip4addr_aton+0x140>
8000d084:	0087f793          	andi	a5,a5,8
8000d088:	00000413          	li	s0,0
8000d08c:	02078863          	beqz	a5,8000d0bc <ip4addr_aton+0x16c>
8000d090:	41790433          	sub	s0,s2,s7
8000d094:	40245413          	srai	s0,s0,0x2
8000d098:	00140413          	addi	s0,s0,1
8000d09c:	00200793          	li	a5,2
8000d0a0:	0af40263          	beq	s0,a5,8000d144 <ip4addr_aton+0x1f4>
8000d0a4:	0487cc63          	blt	a5,s0,8000d0fc <ip4addr_aton+0x1ac>
8000d0a8:	00040a63          	beqz	s0,8000d0bc <ip4addr_aton+0x16c>
8000d0ac:	00100413          	li	s0,1
8000d0b0:	00098663          	beqz	s3,8000d0bc <ip4addr_aton+0x16c>
8000d0b4:	e3cf90ef          	jal	ra,800066f0 <lwip_htonl>
8000d0b8:	00a9a023          	sw	a0,0(s3)
8000d0bc:	00040513          	mv	a0,s0
8000d0c0:	04c12083          	lw	ra,76(sp)
8000d0c4:	04812403          	lw	s0,72(sp)
8000d0c8:	04412483          	lw	s1,68(sp)
8000d0cc:	04012903          	lw	s2,64(sp)
8000d0d0:	03c12983          	lw	s3,60(sp)
8000d0d4:	03812a03          	lw	s4,56(sp)
8000d0d8:	03412a83          	lw	s5,52(sp)
8000d0dc:	03012b03          	lw	s6,48(sp)
8000d0e0:	02c12b83          	lw	s7,44(sp)
8000d0e4:	02812c03          	lw	s8,40(sp)
8000d0e8:	02412c83          	lw	s9,36(sp)
8000d0ec:	02012d03          	lw	s10,32(sp)
8000d0f0:	01c12d83          	lw	s11,28(sp)
8000d0f4:	05010113          	addi	sp,sp,80
8000d0f8:	00008067          	ret
8000d0fc:	00300793          	li	a5,3
8000d100:	06f40463          	beq	s0,a5,8000d168 <ip4addr_aton+0x218>
8000d104:	00400793          	li	a5,4
8000d108:	faf412e3          	bne	s0,a5,8000d0ac <ip4addr_aton+0x15c>
8000d10c:	0ff00613          	li	a2,255
8000d110:	00000413          	li	s0,0
8000d114:	faa664e3          	bltu	a2,a0,8000d0bc <ip4addr_aton+0x16c>
8000d118:	00012783          	lw	a5,0(sp)
8000d11c:	faf660e3          	bltu	a2,a5,8000d0bc <ip4addr_aton+0x16c>
8000d120:	00412683          	lw	a3,4(sp)
8000d124:	f8d66ce3          	bltu	a2,a3,8000d0bc <ip4addr_aton+0x16c>
8000d128:	00812703          	lw	a4,8(sp)
8000d12c:	f8e668e3          	bltu	a2,a4,8000d0bc <ip4addr_aton+0x16c>
8000d130:	01879793          	slli	a5,a5,0x18
8000d134:	01069693          	slli	a3,a3,0x10
8000d138:	00d7e7b3          	or	a5,a5,a3
8000d13c:	00871713          	slli	a4,a4,0x8
8000d140:	0500006f          	j	8000d190 <ip4addr_aton+0x240>
8000d144:	010007b7          	lui	a5,0x1000
8000d148:	00000413          	li	s0,0
8000d14c:	f6f578e3          	bgeu	a0,a5,8000d0bc <ip4addr_aton+0x16c>
8000d150:	00012783          	lw	a5,0(sp)
8000d154:	0ff00713          	li	a4,255
8000d158:	f6f762e3          	bltu	a4,a5,8000d0bc <ip4addr_aton+0x16c>
8000d15c:	01879793          	slli	a5,a5,0x18
8000d160:	00f56533          	or	a0,a0,a5
8000d164:	f49ff06f          	j	8000d0ac <ip4addr_aton+0x15c>
8000d168:	000107b7          	lui	a5,0x10
8000d16c:	00000413          	li	s0,0
8000d170:	f4f576e3          	bgeu	a0,a5,8000d0bc <ip4addr_aton+0x16c>
8000d174:	00012783          	lw	a5,0(sp)
8000d178:	0ff00693          	li	a3,255
8000d17c:	f4f6e0e3          	bltu	a3,a5,8000d0bc <ip4addr_aton+0x16c>
8000d180:	00412703          	lw	a4,4(sp)
8000d184:	f2e6ece3          	bltu	a3,a4,8000d0bc <ip4addr_aton+0x16c>
8000d188:	01879793          	slli	a5,a5,0x18
8000d18c:	01071713          	slli	a4,a4,0x10
8000d190:	00e7e7b3          	or	a5,a5,a4
8000d194:	fcdff06f          	j	8000d160 <ip4addr_aton+0x210>
8000d198:	00000413          	li	s0,0
8000d19c:	f21ff06f          	j	8000d0bc <ip4addr_aton+0x16c>

8000d1a0 <ipaddr_addr>:
8000d1a0:	fe010113          	addi	sp,sp,-32
8000d1a4:	00c10593          	addi	a1,sp,12
8000d1a8:	00112e23          	sw	ra,28(sp)
8000d1ac:	da5ff0ef          	jal	ra,8000cf50 <ip4addr_aton>
8000d1b0:	00050a63          	beqz	a0,8000d1c4 <ipaddr_addr+0x24>
8000d1b4:	00c12503          	lw	a0,12(sp)
8000d1b8:	01c12083          	lw	ra,28(sp)
8000d1bc:	02010113          	addi	sp,sp,32
8000d1c0:	00008067          	ret
8000d1c4:	fff00513          	li	a0,-1
8000d1c8:	ff1ff06f          	j	8000d1b8 <ipaddr_addr+0x18>

8000d1cc <ip4addr_ntoa_r>:
8000d1cc:	fb010113          	addi	sp,sp,-80
8000d1d0:	04912223          	sw	s1,68(sp)
8000d1d4:	05212023          	sw	s2,64(sp)
8000d1d8:	03312e23          	sw	s3,60(sp)
8000d1dc:	03612823          	sw	s6,48(sp)
8000d1e0:	03812423          	sw	s8,40(sp)
8000d1e4:	03912223          	sw	s9,36(sp)
8000d1e8:	03a12023          	sw	s10,32(sp)
8000d1ec:	04112623          	sw	ra,76(sp)
8000d1f0:	04812423          	sw	s0,72(sp)
8000d1f4:	03412c23          	sw	s4,56(sp)
8000d1f8:	03512a23          	sw	s5,52(sp)
8000d1fc:	03712623          	sw	s7,44(sp)
8000d200:	00052783          	lw	a5,0(a0)
8000d204:	00058493          	mv	s1,a1
8000d208:	00058b13          	mv	s6,a1
8000d20c:	00f12e23          	sw	a5,28(sp)
8000d210:	00000993          	li	s3,0
8000d214:	01c10913          	addi	s2,sp,28
8000d218:	00900c93          	li	s9,9
8000d21c:	0ff00d13          	li	s10,255
8000d220:	02e00c13          	li	s8,46
8000d224:	00094a03          	lbu	s4,0(s2)
8000d228:	00000413          	li	s0,0
8000d22c:	00a00593          	li	a1,10
8000d230:	000a0513          	mv	a0,s4
8000d234:	00c12623          	sw	a2,12(sp)
8000d238:	239000ef          	jal	ra,8000dc70 <__udivsi3>
8000d23c:	0ff57b93          	andi	s7,a0,255
8000d240:	00a00593          	li	a1,10
8000d244:	000a0513          	mv	a0,s4
8000d248:	271000ef          	jal	ra,8000dcb8 <__umodsi3>
8000d24c:	02010793          	addi	a5,sp,32
8000d250:	03050513          	addi	a0,a0,48
8000d254:	008787b3          	add	a5,a5,s0
8000d258:	00140a93          	addi	s5,s0,1
8000d25c:	fea78c23          	sb	a0,-8(a5) # fff8 <_stack_size+0xeff8>
8000d260:	0ffafa93          	andi	s5,s5,255
8000d264:	00c12603          	lw	a2,12(sp)
8000d268:	074ce863          	bltu	s9,s4,8000d2d8 <ip4addr_ntoa_r+0x10c>
8000d26c:	01790023          	sb	s7,0(s2)
8000d270:	00098713          	mv	a4,s3
8000d274:	000b0793          	mv	a5,s6
8000d278:	00198993          	addi	s3,s3,1
8000d27c:	07a41463          	bne	s0,s10,8000d2e4 <ip4addr_ntoa_r+0x118>
8000d280:	08c75863          	bge	a4,a2,8000d310 <ip4addr_ntoa_r+0x144>
8000d284:	01878023          	sb	s8,0(a5)
8000d288:	00190913          	addi	s2,s2,1
8000d28c:	02010713          	addi	a4,sp,32
8000d290:	00178b13          	addi	s6,a5,1
8000d294:	f8e918e3          	bne	s2,a4,8000d224 <ip4addr_ntoa_r+0x58>
8000d298:	00078023          	sb	zero,0(a5)
8000d29c:	00048513          	mv	a0,s1
8000d2a0:	04c12083          	lw	ra,76(sp)
8000d2a4:	04812403          	lw	s0,72(sp)
8000d2a8:	04412483          	lw	s1,68(sp)
8000d2ac:	04012903          	lw	s2,64(sp)
8000d2b0:	03c12983          	lw	s3,60(sp)
8000d2b4:	03812a03          	lw	s4,56(sp)
8000d2b8:	03412a83          	lw	s5,52(sp)
8000d2bc:	03012b03          	lw	s6,48(sp)
8000d2c0:	02c12b83          	lw	s7,44(sp)
8000d2c4:	02812c03          	lw	s8,40(sp)
8000d2c8:	02412c83          	lw	s9,36(sp)
8000d2cc:	02012d03          	lw	s10,32(sp)
8000d2d0:	05010113          	addi	sp,sp,80
8000d2d4:	00008067          	ret
8000d2d8:	000b8a13          	mv	s4,s7
8000d2dc:	000a8413          	mv	s0,s5
8000d2e0:	f4dff06f          	j	8000d22c <ip4addr_ntoa_r+0x60>
8000d2e4:	fff40693          	addi	a3,s0,-1
8000d2e8:	0ff6f693          	andi	a3,a3,255
8000d2ec:	02c75263          	bge	a4,a2,8000d310 <ip4addr_ntoa_r+0x144>
8000d2f0:	02010713          	addi	a4,sp,32
8000d2f4:	00870433          	add	s0,a4,s0
8000d2f8:	ff844703          	lbu	a4,-8(s0)
8000d2fc:	00178793          	addi	a5,a5,1
8000d300:	00068413          	mv	s0,a3
8000d304:	fee78fa3          	sb	a4,-1(a5)
8000d308:	00098713          	mv	a4,s3
8000d30c:	f6dff06f          	j	8000d278 <ip4addr_ntoa_r+0xac>
8000d310:	00000513          	li	a0,0
8000d314:	f8dff06f          	j	8000d2a0 <ip4addr_ntoa_r+0xd4>

8000d318 <ip4addr_ntoa>:
8000d318:	01000613          	li	a2,16
8000d31c:	c5c18593          	addi	a1,gp,-932 # 800036cc <str.4107>
8000d320:	eadff06f          	j	8000d1cc <ip4addr_ntoa_r>

8000d324 <ethernet_input>:
8000d324:	ff010113          	addi	sp,sp,-16
8000d328:	00812423          	sw	s0,8(sp)
8000d32c:	00112623          	sw	ra,12(sp)
8000d330:	00912223          	sw	s1,4(sp)
8000d334:	01212023          	sw	s2,0(sp)
8000d338:	00a55703          	lhu	a4,10(a0)
8000d33c:	01000793          	li	a5,16
8000d340:	00050413          	mv	s0,a0
8000d344:	00e7ec63          	bltu	a5,a4,8000d35c <ethernet_input+0x38>
8000d348:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000d34c:	0507a703          	lw	a4,80(a5)
8000d350:	00170713          	addi	a4,a4,1
8000d354:	04e7a823          	sw	a4,80(a5)
8000d358:	0a00006f          	j	8000d3f8 <ethernet_input+0xd4>
8000d35c:	00f54783          	lbu	a5,15(a0)
8000d360:	00058913          	mv	s2,a1
8000d364:	00079863          	bnez	a5,8000d374 <ethernet_input+0x50>
8000d368:	0385c783          	lbu	a5,56(a1)
8000d36c:	00178793          	addi	a5,a5,1
8000d370:	00f507a3          	sb	a5,15(a0)
8000d374:	00442503          	lw	a0,4(s0)
8000d378:	00f54483          	lbu	s1,15(a0)
8000d37c:	00e54783          	lbu	a5,14(a0)
8000d380:	00849493          	slli	s1,s1,0x8
8000d384:	00f4e4b3          	or	s1,s1,a5
8000d388:	00254783          	lbu	a5,2(a0)
8000d38c:	0017f713          	andi	a4,a5,1
8000d390:	02070663          	beqz	a4,8000d3bc <ethernet_input+0x98>
8000d394:	00100713          	li	a4,1
8000d398:	06e79c63          	bne	a5,a4,8000d410 <ethernet_input+0xec>
8000d39c:	00354783          	lbu	a5,3(a0)
8000d3a0:	00079e63          	bnez	a5,8000d3bc <ethernet_input+0x98>
8000d3a4:	00454703          	lbu	a4,4(a0)
8000d3a8:	05e00793          	li	a5,94
8000d3ac:	00f71863          	bne	a4,a5,8000d3bc <ethernet_input+0x98>
8000d3b0:	00d44783          	lbu	a5,13(s0)
8000d3b4:	0107e793          	ori	a5,a5,16
8000d3b8:	00f406a3          	sb	a5,13(s0)
8000d3bc:	00800793          	li	a5,8
8000d3c0:	06f48863          	beq	s1,a5,8000d430 <ethernet_input+0x10c>
8000d3c4:	60800793          	li	a5,1544
8000d3c8:	f8f490e3          	bne	s1,a5,8000d348 <ethernet_input+0x24>
8000d3cc:	03594783          	lbu	a5,53(s2)
8000d3d0:	0087f793          	andi	a5,a5,8
8000d3d4:	02078863          	beqz	a5,8000d404 <ethernet_input+0xe0>
8000d3d8:	01000593          	li	a1,16
8000d3dc:	00040513          	mv	a0,s0
8000d3e0:	c94fa0ef          	jal	ra,80007874 <pbuf_remove_header>
8000d3e4:	08050863          	beqz	a0,8000d474 <ethernet_input+0x150>
8000d3e8:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000d3ec:	0447a703          	lw	a4,68(a5)
8000d3f0:	00170713          	addi	a4,a4,1
8000d3f4:	04e7a223          	sw	a4,68(a5)
8000d3f8:	03c7a703          	lw	a4,60(a5)
8000d3fc:	00170713          	addi	a4,a4,1
8000d400:	02e7ae23          	sw	a4,60(a5)
8000d404:	00040513          	mv	a0,s0
8000d408:	cf4fa0ef          	jal	ra,800078fc <pbuf_free>
8000d40c:	04c0006f          	j	8000d458 <ethernet_input+0x134>
8000d410:	00600613          	li	a2,6
8000d414:	85418593          	addi	a1,gp,-1964 # 800032c4 <ethbroadcast>
8000d418:	00250513          	addi	a0,a0,2
8000d41c:	6c4010ef          	jal	ra,8000eae0 <memcmp>
8000d420:	f8051ee3          	bnez	a0,8000d3bc <ethernet_input+0x98>
8000d424:	00d44783          	lbu	a5,13(s0)
8000d428:	0087e793          	ori	a5,a5,8
8000d42c:	f8dff06f          	j	8000d3b8 <ethernet_input+0x94>
8000d430:	03594783          	lbu	a5,53(s2)
8000d434:	0087f793          	andi	a5,a5,8
8000d438:	fc0786e3          	beqz	a5,8000d404 <ethernet_input+0xe0>
8000d43c:	01000593          	li	a1,16
8000d440:	00040513          	mv	a0,s0
8000d444:	c30fa0ef          	jal	ra,80007874 <pbuf_remove_header>
8000d448:	fa051ee3          	bnez	a0,8000d404 <ethernet_input+0xe0>
8000d44c:	00090593          	mv	a1,s2
8000d450:	00040513          	mv	a0,s0
8000d454:	b30ff0ef          	jal	ra,8000c784 <ip4_input>
8000d458:	00c12083          	lw	ra,12(sp)
8000d45c:	00812403          	lw	s0,8(sp)
8000d460:	00412483          	lw	s1,4(sp)
8000d464:	00012903          	lw	s2,0(sp)
8000d468:	00000513          	li	a0,0
8000d46c:	01010113          	addi	sp,sp,16
8000d470:	00008067          	ret
8000d474:	00090593          	mv	a1,s2
8000d478:	00040513          	mv	a0,s0
8000d47c:	ad8fe0ef          	jal	ra,8000b754 <etharp_input>
8000d480:	fd9ff06f          	j	8000d458 <ethernet_input+0x134>

8000d484 <ethernet_output>:
8000d484:	fd010113          	addi	sp,sp,-48
8000d488:	01312e23          	sw	s3,28(sp)
8000d48c:	00050993          	mv	s3,a0
8000d490:	00070513          	mv	a0,a4
8000d494:	00d12623          	sw	a3,12(sp)
8000d498:	02112623          	sw	ra,44(sp)
8000d49c:	02912223          	sw	s1,36(sp)
8000d4a0:	03212023          	sw	s2,32(sp)
8000d4a4:	01412c23          	sw	s4,24(sp)
8000d4a8:	00058913          	mv	s2,a1
8000d4ac:	00060a13          	mv	s4,a2
8000d4b0:	02812423          	sw	s0,40(sp)
8000d4b4:	a24f90ef          	jal	ra,800066d8 <lwip_htons>
8000d4b8:	00050493          	mv	s1,a0
8000d4bc:	01000593          	li	a1,16
8000d4c0:	00090513          	mv	a0,s2
8000d4c4:	ba0fa0ef          	jal	ra,80007864 <pbuf_add_header>
8000d4c8:	00c12683          	lw	a3,12(sp)
8000d4cc:	06051063          	bnez	a0,8000d52c <ethernet_output+0xa8>
8000d4d0:	00492403          	lw	s0,4(s2)
8000d4d4:	00068593          	mv	a1,a3
8000d4d8:	00600613          	li	a2,6
8000d4dc:	00940723          	sb	s1,14(s0)
8000d4e0:	0084d493          	srli	s1,s1,0x8
8000d4e4:	009407a3          	sb	s1,15(s0)
8000d4e8:	00240513          	addi	a0,s0,2
8000d4ec:	624010ef          	jal	ra,8000eb10 <memcpy>
8000d4f0:	000a0593          	mv	a1,s4
8000d4f4:	00840513          	addi	a0,s0,8
8000d4f8:	00600613          	li	a2,6
8000d4fc:	614010ef          	jal	ra,8000eb10 <memcpy>
8000d500:	02812403          	lw	s0,40(sp)
8000d504:	0189a303          	lw	t1,24(s3)
8000d508:	02c12083          	lw	ra,44(sp)
8000d50c:	02412483          	lw	s1,36(sp)
8000d510:	01812a03          	lw	s4,24(sp)
8000d514:	00090593          	mv	a1,s2
8000d518:	00098513          	mv	a0,s3
8000d51c:	02012903          	lw	s2,32(sp)
8000d520:	01c12983          	lw	s3,28(sp)
8000d524:	03010113          	addi	sp,sp,48
8000d528:	00030067          	jr	t1
8000d52c:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000d530:	0147a703          	lw	a4,20(a5)
8000d534:	ffe00513          	li	a0,-2
8000d538:	00170713          	addi	a4,a4,1
8000d53c:	00e7aa23          	sw	a4,20(a5)
8000d540:	02c12083          	lw	ra,44(sp)
8000d544:	02812403          	lw	s0,40(sp)
8000d548:	02412483          	lw	s1,36(sp)
8000d54c:	02012903          	lw	s2,32(sp)
8000d550:	01c12983          	lw	s3,28(sp)
8000d554:	01812a03          	lw	s4,24(sp)
8000d558:	03010113          	addi	sp,sp,48
8000d55c:	00008067          	ret

8000d560 <memset>:
8000d560:	00f00313          	li	t1,15
8000d564:	00050713          	mv	a4,a0
8000d568:	02c37e63          	bgeu	t1,a2,8000d5a4 <memset+0x44>
8000d56c:	00f77793          	andi	a5,a4,15
8000d570:	0a079063          	bnez	a5,8000d610 <memset+0xb0>
8000d574:	08059263          	bnez	a1,8000d5f8 <memset+0x98>
8000d578:	ff067693          	andi	a3,a2,-16
8000d57c:	00f67613          	andi	a2,a2,15
8000d580:	00e686b3          	add	a3,a3,a4
8000d584:	00b72023          	sw	a1,0(a4)
8000d588:	00b72223          	sw	a1,4(a4)
8000d58c:	00b72423          	sw	a1,8(a4)
8000d590:	00b72623          	sw	a1,12(a4)
8000d594:	01070713          	addi	a4,a4,16
8000d598:	fed766e3          	bltu	a4,a3,8000d584 <memset+0x24>
8000d59c:	00061463          	bnez	a2,8000d5a4 <memset+0x44>
8000d5a0:	00008067          	ret
8000d5a4:	40c306b3          	sub	a3,t1,a2
8000d5a8:	00269693          	slli	a3,a3,0x2
8000d5ac:	00000297          	auipc	t0,0x0
8000d5b0:	005686b3          	add	a3,a3,t0
8000d5b4:	00c68067          	jr	12(a3)
8000d5b8:	00b70723          	sb	a1,14(a4)
8000d5bc:	00b706a3          	sb	a1,13(a4)
8000d5c0:	00b70623          	sb	a1,12(a4)
8000d5c4:	00b705a3          	sb	a1,11(a4)
8000d5c8:	00b70523          	sb	a1,10(a4)
8000d5cc:	00b704a3          	sb	a1,9(a4)
8000d5d0:	00b70423          	sb	a1,8(a4)
8000d5d4:	00b703a3          	sb	a1,7(a4)
8000d5d8:	00b70323          	sb	a1,6(a4)
8000d5dc:	00b702a3          	sb	a1,5(a4)
8000d5e0:	00b70223          	sb	a1,4(a4)
8000d5e4:	00b701a3          	sb	a1,3(a4)
8000d5e8:	00b70123          	sb	a1,2(a4)
8000d5ec:	00b700a3          	sb	a1,1(a4)
8000d5f0:	00b70023          	sb	a1,0(a4)
8000d5f4:	00008067          	ret
8000d5f8:	0ff5f593          	andi	a1,a1,255
8000d5fc:	00859693          	slli	a3,a1,0x8
8000d600:	00d5e5b3          	or	a1,a1,a3
8000d604:	01059693          	slli	a3,a1,0x10
8000d608:	00d5e5b3          	or	a1,a1,a3
8000d60c:	f6dff06f          	j	8000d578 <memset+0x18>
8000d610:	00279693          	slli	a3,a5,0x2
8000d614:	00000297          	auipc	t0,0x0
8000d618:	005686b3          	add	a3,a3,t0
8000d61c:	00008293          	mv	t0,ra
8000d620:	fa0680e7          	jalr	-96(a3)
8000d624:	00028093          	mv	ra,t0
8000d628:	ff078793          	addi	a5,a5,-16
8000d62c:	40f70733          	sub	a4,a4,a5
8000d630:	00f60633          	add	a2,a2,a5
8000d634:	f6c378e3          	bgeu	t1,a2,8000d5a4 <memset+0x44>
8000d638:	f3dff06f          	j	8000d574 <memset+0x14>

8000d63c <__bswapsi2>:
8000d63c:	01851713          	slli	a4,a0,0x18
8000d640:	01855793          	srli	a5,a0,0x18
8000d644:	000106b7          	lui	a3,0x10
8000d648:	00e7e7b3          	or	a5,a5,a4
8000d64c:	f0068693          	addi	a3,a3,-256 # ff00 <_stack_size+0xef00>
8000d650:	40855713          	srai	a4,a0,0x8
8000d654:	00d77733          	and	a4,a4,a3
8000d658:	00e7e7b3          	or	a5,a5,a4
8000d65c:	00851513          	slli	a0,a0,0x8
8000d660:	00ff0737          	lui	a4,0xff0
8000d664:	00e57533          	and	a0,a0,a4
8000d668:	00a7e533          	or	a0,a5,a0
8000d66c:	00008067          	ret

8000d670 <__udivdi3>:
8000d670:	fd010113          	addi	sp,sp,-48
8000d674:	02912223          	sw	s1,36(sp)
8000d678:	01612823          	sw	s6,16(sp)
8000d67c:	02112623          	sw	ra,44(sp)
8000d680:	02812423          	sw	s0,40(sp)
8000d684:	03212023          	sw	s2,32(sp)
8000d688:	01312e23          	sw	s3,28(sp)
8000d68c:	01412c23          	sw	s4,24(sp)
8000d690:	01512a23          	sw	s5,20(sp)
8000d694:	01712623          	sw	s7,12(sp)
8000d698:	01812423          	sw	s8,8(sp)
8000d69c:	01912223          	sw	s9,4(sp)
8000d6a0:	00050b13          	mv	s6,a0
8000d6a4:	00058493          	mv	s1,a1
8000d6a8:	38069c63          	bnez	a3,8000da40 <__udivdi3+0x3d0>
8000d6ac:	00060413          	mv	s0,a2
8000d6b0:	00050993          	mv	s3,a0
8000d6b4:	ffff6917          	auipc	s2,0xffff6
8000d6b8:	a2c90913          	addi	s2,s2,-1492 # 800030e0 <__clz_tab>
8000d6bc:	12c5f863          	bgeu	a1,a2,8000d7ec <__udivdi3+0x17c>
8000d6c0:	000107b7          	lui	a5,0x10
8000d6c4:	00058a93          	mv	s5,a1
8000d6c8:	10f67863          	bgeu	a2,a5,8000d7d8 <__udivdi3+0x168>
8000d6cc:	0ff00693          	li	a3,255
8000d6d0:	00c6b6b3          	sltu	a3,a3,a2
8000d6d4:	00369693          	slli	a3,a3,0x3
8000d6d8:	00d657b3          	srl	a5,a2,a3
8000d6dc:	00f90933          	add	s2,s2,a5
8000d6e0:	00094703          	lbu	a4,0(s2)
8000d6e4:	00d706b3          	add	a3,a4,a3
8000d6e8:	02000713          	li	a4,32
8000d6ec:	40d70733          	sub	a4,a4,a3
8000d6f0:	00070c63          	beqz	a4,8000d708 <__udivdi3+0x98>
8000d6f4:	00e494b3          	sll	s1,s1,a4
8000d6f8:	00db56b3          	srl	a3,s6,a3
8000d6fc:	00e61433          	sll	s0,a2,a4
8000d700:	0096eab3          	or	s5,a3,s1
8000d704:	00eb19b3          	sll	s3,s6,a4
8000d708:	01045b13          	srli	s6,s0,0x10
8000d70c:	000b0593          	mv	a1,s6
8000d710:	000a8513          	mv	a0,s5
8000d714:	5a4000ef          	jal	ra,8000dcb8 <__umodsi3>
8000d718:	00050913          	mv	s2,a0
8000d71c:	000b0593          	mv	a1,s6
8000d720:	01041b93          	slli	s7,s0,0x10
8000d724:	000a8513          	mv	a0,s5
8000d728:	548000ef          	jal	ra,8000dc70 <__udivsi3>
8000d72c:	010bdb93          	srli	s7,s7,0x10
8000d730:	00050493          	mv	s1,a0
8000d734:	00050593          	mv	a1,a0
8000d738:	000b8513          	mv	a0,s7
8000d73c:	508000ef          	jal	ra,8000dc44 <__mulsi3>
8000d740:	01091913          	slli	s2,s2,0x10
8000d744:	0109d713          	srli	a4,s3,0x10
8000d748:	00e96733          	or	a4,s2,a4
8000d74c:	00048a13          	mv	s4,s1
8000d750:	00a77e63          	bgeu	a4,a0,8000d76c <__udivdi3+0xfc>
8000d754:	00870733          	add	a4,a4,s0
8000d758:	fff48a13          	addi	s4,s1,-1
8000d75c:	00876863          	bltu	a4,s0,8000d76c <__udivdi3+0xfc>
8000d760:	00a77663          	bgeu	a4,a0,8000d76c <__udivdi3+0xfc>
8000d764:	ffe48a13          	addi	s4,s1,-2
8000d768:	00870733          	add	a4,a4,s0
8000d76c:	40a704b3          	sub	s1,a4,a0
8000d770:	000b0593          	mv	a1,s6
8000d774:	00048513          	mv	a0,s1
8000d778:	540000ef          	jal	ra,8000dcb8 <__umodsi3>
8000d77c:	00050913          	mv	s2,a0
8000d780:	000b0593          	mv	a1,s6
8000d784:	00048513          	mv	a0,s1
8000d788:	4e8000ef          	jal	ra,8000dc70 <__udivsi3>
8000d78c:	01099993          	slli	s3,s3,0x10
8000d790:	00050493          	mv	s1,a0
8000d794:	00050593          	mv	a1,a0
8000d798:	01091913          	slli	s2,s2,0x10
8000d79c:	000b8513          	mv	a0,s7
8000d7a0:	0109d993          	srli	s3,s3,0x10
8000d7a4:	4a0000ef          	jal	ra,8000dc44 <__mulsi3>
8000d7a8:	013969b3          	or	s3,s2,s3
8000d7ac:	00048613          	mv	a2,s1
8000d7b0:	00a9fc63          	bgeu	s3,a0,8000d7c8 <__udivdi3+0x158>
8000d7b4:	013409b3          	add	s3,s0,s3
8000d7b8:	fff48613          	addi	a2,s1,-1
8000d7bc:	0089e663          	bltu	s3,s0,8000d7c8 <__udivdi3+0x158>
8000d7c0:	00a9f463          	bgeu	s3,a0,8000d7c8 <__udivdi3+0x158>
8000d7c4:	ffe48613          	addi	a2,s1,-2
8000d7c8:	010a1793          	slli	a5,s4,0x10
8000d7cc:	00c7e7b3          	or	a5,a5,a2
8000d7d0:	00000a13          	li	s4,0
8000d7d4:	1300006f          	j	8000d904 <__udivdi3+0x294>
8000d7d8:	010007b7          	lui	a5,0x1000
8000d7dc:	01000693          	li	a3,16
8000d7e0:	eef66ce3          	bltu	a2,a5,8000d6d8 <__udivdi3+0x68>
8000d7e4:	01800693          	li	a3,24
8000d7e8:	ef1ff06f          	j	8000d6d8 <__udivdi3+0x68>
8000d7ec:	00068a13          	mv	s4,a3
8000d7f0:	00061a63          	bnez	a2,8000d804 <__udivdi3+0x194>
8000d7f4:	00000593          	li	a1,0
8000d7f8:	00100513          	li	a0,1
8000d7fc:	474000ef          	jal	ra,8000dc70 <__udivsi3>
8000d800:	00050413          	mv	s0,a0
8000d804:	000107b7          	lui	a5,0x10
8000d808:	12f47c63          	bgeu	s0,a5,8000d940 <__udivdi3+0x2d0>
8000d80c:	0ff00793          	li	a5,255
8000d810:	0087f463          	bgeu	a5,s0,8000d818 <__udivdi3+0x1a8>
8000d814:	00800a13          	li	s4,8
8000d818:	014457b3          	srl	a5,s0,s4
8000d81c:	00f90933          	add	s2,s2,a5
8000d820:	00094683          	lbu	a3,0(s2)
8000d824:	02000613          	li	a2,32
8000d828:	014686b3          	add	a3,a3,s4
8000d82c:	40d60633          	sub	a2,a2,a3
8000d830:	12061263          	bnez	a2,8000d954 <__udivdi3+0x2e4>
8000d834:	408484b3          	sub	s1,s1,s0
8000d838:	00100a13          	li	s4,1
8000d83c:	01045b13          	srli	s6,s0,0x10
8000d840:	000b0593          	mv	a1,s6
8000d844:	00048513          	mv	a0,s1
8000d848:	470000ef          	jal	ra,8000dcb8 <__umodsi3>
8000d84c:	00050913          	mv	s2,a0
8000d850:	000b0593          	mv	a1,s6
8000d854:	00048513          	mv	a0,s1
8000d858:	01041b93          	slli	s7,s0,0x10
8000d85c:	414000ef          	jal	ra,8000dc70 <__udivsi3>
8000d860:	010bdb93          	srli	s7,s7,0x10
8000d864:	00050493          	mv	s1,a0
8000d868:	00050593          	mv	a1,a0
8000d86c:	000b8513          	mv	a0,s7
8000d870:	3d4000ef          	jal	ra,8000dc44 <__mulsi3>
8000d874:	01091913          	slli	s2,s2,0x10
8000d878:	0109d713          	srli	a4,s3,0x10
8000d87c:	00e96733          	or	a4,s2,a4
8000d880:	00048a93          	mv	s5,s1
8000d884:	00a77e63          	bgeu	a4,a0,8000d8a0 <__udivdi3+0x230>
8000d888:	00870733          	add	a4,a4,s0
8000d88c:	fff48a93          	addi	s5,s1,-1
8000d890:	00876863          	bltu	a4,s0,8000d8a0 <__udivdi3+0x230>
8000d894:	00a77663          	bgeu	a4,a0,8000d8a0 <__udivdi3+0x230>
8000d898:	ffe48a93          	addi	s5,s1,-2
8000d89c:	00870733          	add	a4,a4,s0
8000d8a0:	40a704b3          	sub	s1,a4,a0
8000d8a4:	000b0593          	mv	a1,s6
8000d8a8:	00048513          	mv	a0,s1
8000d8ac:	40c000ef          	jal	ra,8000dcb8 <__umodsi3>
8000d8b0:	00050913          	mv	s2,a0
8000d8b4:	000b0593          	mv	a1,s6
8000d8b8:	00048513          	mv	a0,s1
8000d8bc:	3b4000ef          	jal	ra,8000dc70 <__udivsi3>
8000d8c0:	01099993          	slli	s3,s3,0x10
8000d8c4:	00050493          	mv	s1,a0
8000d8c8:	00050593          	mv	a1,a0
8000d8cc:	01091913          	slli	s2,s2,0x10
8000d8d0:	000b8513          	mv	a0,s7
8000d8d4:	0109d993          	srli	s3,s3,0x10
8000d8d8:	36c000ef          	jal	ra,8000dc44 <__mulsi3>
8000d8dc:	013969b3          	or	s3,s2,s3
8000d8e0:	00048613          	mv	a2,s1
8000d8e4:	00a9fc63          	bgeu	s3,a0,8000d8fc <__udivdi3+0x28c>
8000d8e8:	013409b3          	add	s3,s0,s3
8000d8ec:	fff48613          	addi	a2,s1,-1
8000d8f0:	0089e663          	bltu	s3,s0,8000d8fc <__udivdi3+0x28c>
8000d8f4:	00a9f463          	bgeu	s3,a0,8000d8fc <__udivdi3+0x28c>
8000d8f8:	ffe48613          	addi	a2,s1,-2
8000d8fc:	010a9793          	slli	a5,s5,0x10
8000d900:	00c7e7b3          	or	a5,a5,a2
8000d904:	00078513          	mv	a0,a5
8000d908:	000a0593          	mv	a1,s4
8000d90c:	02c12083          	lw	ra,44(sp)
8000d910:	02812403          	lw	s0,40(sp)
8000d914:	02412483          	lw	s1,36(sp)
8000d918:	02012903          	lw	s2,32(sp)
8000d91c:	01c12983          	lw	s3,28(sp)
8000d920:	01812a03          	lw	s4,24(sp)
8000d924:	01412a83          	lw	s5,20(sp)
8000d928:	01012b03          	lw	s6,16(sp)
8000d92c:	00c12b83          	lw	s7,12(sp)
8000d930:	00812c03          	lw	s8,8(sp)
8000d934:	00412c83          	lw	s9,4(sp)
8000d938:	03010113          	addi	sp,sp,48
8000d93c:	00008067          	ret
8000d940:	010007b7          	lui	a5,0x1000
8000d944:	01000a13          	li	s4,16
8000d948:	ecf468e3          	bltu	s0,a5,8000d818 <__udivdi3+0x1a8>
8000d94c:	01800a13          	li	s4,24
8000d950:	ec9ff06f          	j	8000d818 <__udivdi3+0x1a8>
8000d954:	00c41433          	sll	s0,s0,a2
8000d958:	00d4da33          	srl	s4,s1,a3
8000d95c:	00cb19b3          	sll	s3,s6,a2
8000d960:	00db56b3          	srl	a3,s6,a3
8000d964:	01045b13          	srli	s6,s0,0x10
8000d968:	00c494b3          	sll	s1,s1,a2
8000d96c:	000b0593          	mv	a1,s6
8000d970:	000a0513          	mv	a0,s4
8000d974:	0096eab3          	or	s5,a3,s1
8000d978:	340000ef          	jal	ra,8000dcb8 <__umodsi3>
8000d97c:	00050913          	mv	s2,a0
8000d980:	000b0593          	mv	a1,s6
8000d984:	000a0513          	mv	a0,s4
8000d988:	01041b93          	slli	s7,s0,0x10
8000d98c:	2e4000ef          	jal	ra,8000dc70 <__udivsi3>
8000d990:	010bdb93          	srli	s7,s7,0x10
8000d994:	00050493          	mv	s1,a0
8000d998:	00050593          	mv	a1,a0
8000d99c:	000b8513          	mv	a0,s7
8000d9a0:	2a4000ef          	jal	ra,8000dc44 <__mulsi3>
8000d9a4:	01091913          	slli	s2,s2,0x10
8000d9a8:	010ad713          	srli	a4,s5,0x10
8000d9ac:	00e96733          	or	a4,s2,a4
8000d9b0:	00048a13          	mv	s4,s1
8000d9b4:	00a77e63          	bgeu	a4,a0,8000d9d0 <__udivdi3+0x360>
8000d9b8:	00870733          	add	a4,a4,s0
8000d9bc:	fff48a13          	addi	s4,s1,-1
8000d9c0:	00876863          	bltu	a4,s0,8000d9d0 <__udivdi3+0x360>
8000d9c4:	00a77663          	bgeu	a4,a0,8000d9d0 <__udivdi3+0x360>
8000d9c8:	ffe48a13          	addi	s4,s1,-2
8000d9cc:	00870733          	add	a4,a4,s0
8000d9d0:	40a704b3          	sub	s1,a4,a0
8000d9d4:	000b0593          	mv	a1,s6
8000d9d8:	00048513          	mv	a0,s1
8000d9dc:	2dc000ef          	jal	ra,8000dcb8 <__umodsi3>
8000d9e0:	00050913          	mv	s2,a0
8000d9e4:	000b0593          	mv	a1,s6
8000d9e8:	00048513          	mv	a0,s1
8000d9ec:	284000ef          	jal	ra,8000dc70 <__udivsi3>
8000d9f0:	00050493          	mv	s1,a0
8000d9f4:	00050593          	mv	a1,a0
8000d9f8:	000b8513          	mv	a0,s7
8000d9fc:	248000ef          	jal	ra,8000dc44 <__mulsi3>
8000da00:	010a9693          	slli	a3,s5,0x10
8000da04:	01091913          	slli	s2,s2,0x10
8000da08:	0106d693          	srli	a3,a3,0x10
8000da0c:	00d967b3          	or	a5,s2,a3
8000da10:	00048713          	mv	a4,s1
8000da14:	00a7fe63          	bgeu	a5,a0,8000da30 <__udivdi3+0x3c0>
8000da18:	008787b3          	add	a5,a5,s0
8000da1c:	fff48713          	addi	a4,s1,-1
8000da20:	0087e863          	bltu	a5,s0,8000da30 <__udivdi3+0x3c0>
8000da24:	00a7f663          	bgeu	a5,a0,8000da30 <__udivdi3+0x3c0>
8000da28:	ffe48713          	addi	a4,s1,-2
8000da2c:	008787b3          	add	a5,a5,s0
8000da30:	010a1a13          	slli	s4,s4,0x10
8000da34:	40a784b3          	sub	s1,a5,a0
8000da38:	00ea6a33          	or	s4,s4,a4
8000da3c:	e01ff06f          	j	8000d83c <__udivdi3+0x1cc>
8000da40:	1ed5ec63          	bltu	a1,a3,8000dc38 <__udivdi3+0x5c8>
8000da44:	000107b7          	lui	a5,0x10
8000da48:	04f6f463          	bgeu	a3,a5,8000da90 <__udivdi3+0x420>
8000da4c:	0ff00593          	li	a1,255
8000da50:	00d5b533          	sltu	a0,a1,a3
8000da54:	00351513          	slli	a0,a0,0x3
8000da58:	00a6d733          	srl	a4,a3,a0
8000da5c:	ffff5797          	auipc	a5,0xffff5
8000da60:	68478793          	addi	a5,a5,1668 # 800030e0 <__clz_tab>
8000da64:	00e787b3          	add	a5,a5,a4
8000da68:	0007c583          	lbu	a1,0(a5)
8000da6c:	02000a13          	li	s4,32
8000da70:	00a585b3          	add	a1,a1,a0
8000da74:	40ba0a33          	sub	s4,s4,a1
8000da78:	020a1663          	bnez	s4,8000daa4 <__udivdi3+0x434>
8000da7c:	00100793          	li	a5,1
8000da80:	e896e2e3          	bltu	a3,s1,8000d904 <__udivdi3+0x294>
8000da84:	00cb3633          	sltu	a2,s6,a2
8000da88:	00164793          	xori	a5,a2,1
8000da8c:	e79ff06f          	j	8000d904 <__udivdi3+0x294>
8000da90:	010007b7          	lui	a5,0x1000
8000da94:	01000513          	li	a0,16
8000da98:	fcf6e0e3          	bltu	a3,a5,8000da58 <__udivdi3+0x3e8>
8000da9c:	01800513          	li	a0,24
8000daa0:	fb9ff06f          	j	8000da58 <__udivdi3+0x3e8>
8000daa4:	00b65ab3          	srl	s5,a2,a1
8000daa8:	014696b3          	sll	a3,a3,s4
8000daac:	00daeab3          	or	s5,s5,a3
8000dab0:	00b4d933          	srl	s2,s1,a1
8000dab4:	014497b3          	sll	a5,s1,s4
8000dab8:	00bb55b3          	srl	a1,s6,a1
8000dabc:	010adb93          	srli	s7,s5,0x10
8000dac0:	00f5e4b3          	or	s1,a1,a5
8000dac4:	00090513          	mv	a0,s2
8000dac8:	000b8593          	mv	a1,s7
8000dacc:	014619b3          	sll	s3,a2,s4
8000dad0:	1e8000ef          	jal	ra,8000dcb8 <__umodsi3>
8000dad4:	00050413          	mv	s0,a0
8000dad8:	000b8593          	mv	a1,s7
8000dadc:	00090513          	mv	a0,s2
8000dae0:	010a9c13          	slli	s8,s5,0x10
8000dae4:	18c000ef          	jal	ra,8000dc70 <__udivsi3>
8000dae8:	010c5c13          	srli	s8,s8,0x10
8000daec:	00050913          	mv	s2,a0
8000daf0:	00050593          	mv	a1,a0
8000daf4:	000c0513          	mv	a0,s8
8000daf8:	14c000ef          	jal	ra,8000dc44 <__mulsi3>
8000dafc:	01041413          	slli	s0,s0,0x10
8000db00:	0104d713          	srli	a4,s1,0x10
8000db04:	00e46733          	or	a4,s0,a4
8000db08:	00090c93          	mv	s9,s2
8000db0c:	00a77e63          	bgeu	a4,a0,8000db28 <__udivdi3+0x4b8>
8000db10:	01570733          	add	a4,a4,s5
8000db14:	fff90c93          	addi	s9,s2,-1
8000db18:	01576863          	bltu	a4,s5,8000db28 <__udivdi3+0x4b8>
8000db1c:	00a77663          	bgeu	a4,a0,8000db28 <__udivdi3+0x4b8>
8000db20:	ffe90c93          	addi	s9,s2,-2
8000db24:	01570733          	add	a4,a4,s5
8000db28:	40a70933          	sub	s2,a4,a0
8000db2c:	000b8593          	mv	a1,s7
8000db30:	00090513          	mv	a0,s2
8000db34:	184000ef          	jal	ra,8000dcb8 <__umodsi3>
8000db38:	00050413          	mv	s0,a0
8000db3c:	000b8593          	mv	a1,s7
8000db40:	00090513          	mv	a0,s2
8000db44:	12c000ef          	jal	ra,8000dc70 <__udivsi3>
8000db48:	00050913          	mv	s2,a0
8000db4c:	00050593          	mv	a1,a0
8000db50:	000c0513          	mv	a0,s8
8000db54:	0f0000ef          	jal	ra,8000dc44 <__mulsi3>
8000db58:	01049793          	slli	a5,s1,0x10
8000db5c:	01041413          	slli	s0,s0,0x10
8000db60:	0107d793          	srli	a5,a5,0x10
8000db64:	00f46733          	or	a4,s0,a5
8000db68:	00090613          	mv	a2,s2
8000db6c:	00a77e63          	bgeu	a4,a0,8000db88 <__udivdi3+0x518>
8000db70:	01570733          	add	a4,a4,s5
8000db74:	fff90613          	addi	a2,s2,-1
8000db78:	01576863          	bltu	a4,s5,8000db88 <__udivdi3+0x518>
8000db7c:	00a77663          	bgeu	a4,a0,8000db88 <__udivdi3+0x518>
8000db80:	ffe90613          	addi	a2,s2,-2
8000db84:	01570733          	add	a4,a4,s5
8000db88:	010c9793          	slli	a5,s9,0x10
8000db8c:	00010e37          	lui	t3,0x10
8000db90:	00c7e7b3          	or	a5,a5,a2
8000db94:	fffe0813          	addi	a6,t3,-1 # ffff <_stack_size+0xefff>
8000db98:	0107f333          	and	t1,a5,a6
8000db9c:	0109f833          	and	a6,s3,a6
8000dba0:	40a70733          	sub	a4,a4,a0
8000dba4:	0107de93          	srli	t4,a5,0x10
8000dba8:	0109d993          	srli	s3,s3,0x10
8000dbac:	00030513          	mv	a0,t1
8000dbb0:	00080593          	mv	a1,a6
8000dbb4:	090000ef          	jal	ra,8000dc44 <__mulsi3>
8000dbb8:	00050893          	mv	a7,a0
8000dbbc:	00098593          	mv	a1,s3
8000dbc0:	00030513          	mv	a0,t1
8000dbc4:	080000ef          	jal	ra,8000dc44 <__mulsi3>
8000dbc8:	00050313          	mv	t1,a0
8000dbcc:	00080593          	mv	a1,a6
8000dbd0:	000e8513          	mv	a0,t4
8000dbd4:	070000ef          	jal	ra,8000dc44 <__mulsi3>
8000dbd8:	00050813          	mv	a6,a0
8000dbdc:	00098593          	mv	a1,s3
8000dbe0:	000e8513          	mv	a0,t4
8000dbe4:	060000ef          	jal	ra,8000dc44 <__mulsi3>
8000dbe8:	0108d693          	srli	a3,a7,0x10
8000dbec:	01030333          	add	t1,t1,a6
8000dbf0:	006686b3          	add	a3,a3,t1
8000dbf4:	0106f463          	bgeu	a3,a6,8000dbfc <__udivdi3+0x58c>
8000dbf8:	01c50533          	add	a0,a0,t3
8000dbfc:	0106d613          	srli	a2,a3,0x10
8000dc00:	00a60533          	add	a0,a2,a0
8000dc04:	02a76663          	bltu	a4,a0,8000dc30 <__udivdi3+0x5c0>
8000dc08:	bca714e3          	bne	a4,a0,8000d7d0 <__udivdi3+0x160>
8000dc0c:	00010737          	lui	a4,0x10
8000dc10:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xefff>
8000dc14:	00e6f6b3          	and	a3,a3,a4
8000dc18:	01069693          	slli	a3,a3,0x10
8000dc1c:	00e8f8b3          	and	a7,a7,a4
8000dc20:	014b1633          	sll	a2,s6,s4
8000dc24:	011686b3          	add	a3,a3,a7
8000dc28:	00000a13          	li	s4,0
8000dc2c:	ccd67ce3          	bgeu	a2,a3,8000d904 <__udivdi3+0x294>
8000dc30:	fff78793          	addi	a5,a5,-1 # ffffff <_stack_size+0xffefff>
8000dc34:	b9dff06f          	j	8000d7d0 <__udivdi3+0x160>
8000dc38:	00000a13          	li	s4,0
8000dc3c:	00000793          	li	a5,0
8000dc40:	cc5ff06f          	j	8000d904 <__udivdi3+0x294>

8000dc44 <__mulsi3>:
8000dc44:	00050613          	mv	a2,a0
8000dc48:	00000513          	li	a0,0
8000dc4c:	0015f693          	andi	a3,a1,1
8000dc50:	00068463          	beqz	a3,8000dc58 <__mulsi3+0x14>
8000dc54:	00c50533          	add	a0,a0,a2
8000dc58:	0015d593          	srli	a1,a1,0x1
8000dc5c:	00161613          	slli	a2,a2,0x1
8000dc60:	fe0596e3          	bnez	a1,8000dc4c <__mulsi3+0x8>
8000dc64:	00008067          	ret

8000dc68 <__divsi3>:
8000dc68:	06054063          	bltz	a0,8000dcc8 <__umodsi3+0x10>
8000dc6c:	0605c663          	bltz	a1,8000dcd8 <__umodsi3+0x20>

8000dc70 <__udivsi3>:
8000dc70:	00058613          	mv	a2,a1
8000dc74:	00050593          	mv	a1,a0
8000dc78:	fff00513          	li	a0,-1
8000dc7c:	02060c63          	beqz	a2,8000dcb4 <__udivsi3+0x44>
8000dc80:	00100693          	li	a3,1
8000dc84:	00b67a63          	bgeu	a2,a1,8000dc98 <__udivsi3+0x28>
8000dc88:	00c05863          	blez	a2,8000dc98 <__udivsi3+0x28>
8000dc8c:	00161613          	slli	a2,a2,0x1
8000dc90:	00169693          	slli	a3,a3,0x1
8000dc94:	feb66ae3          	bltu	a2,a1,8000dc88 <__udivsi3+0x18>
8000dc98:	00000513          	li	a0,0
8000dc9c:	00c5e663          	bltu	a1,a2,8000dca8 <__udivsi3+0x38>
8000dca0:	40c585b3          	sub	a1,a1,a2
8000dca4:	00d56533          	or	a0,a0,a3
8000dca8:	0016d693          	srli	a3,a3,0x1
8000dcac:	00165613          	srli	a2,a2,0x1
8000dcb0:	fe0696e3          	bnez	a3,8000dc9c <__udivsi3+0x2c>
8000dcb4:	00008067          	ret

8000dcb8 <__umodsi3>:
8000dcb8:	00008293          	mv	t0,ra
8000dcbc:	fb5ff0ef          	jal	ra,8000dc70 <__udivsi3>
8000dcc0:	00058513          	mv	a0,a1
8000dcc4:	00028067          	jr	t0 # 8000d614 <memset+0xb4>
8000dcc8:	40a00533          	neg	a0,a0
8000dccc:	0005d863          	bgez	a1,8000dcdc <__umodsi3+0x24>
8000dcd0:	40b005b3          	neg	a1,a1
8000dcd4:	f9dff06f          	j	8000dc70 <__udivsi3>
8000dcd8:	40b005b3          	neg	a1,a1
8000dcdc:	00008293          	mv	t0,ra
8000dce0:	f91ff0ef          	jal	ra,8000dc70 <__udivsi3>
8000dce4:	40a00533          	neg	a0,a0
8000dce8:	00028067          	jr	t0

8000dcec <__modsi3>:
8000dcec:	00008293          	mv	t0,ra
8000dcf0:	0005ca63          	bltz	a1,8000dd04 <__modsi3+0x18>
8000dcf4:	00054c63          	bltz	a0,8000dd0c <__modsi3+0x20>
8000dcf8:	f79ff0ef          	jal	ra,8000dc70 <__udivsi3>
8000dcfc:	00058513          	mv	a0,a1
8000dd00:	00028067          	jr	t0
8000dd04:	40b005b3          	neg	a1,a1
8000dd08:	fe0558e3          	bgez	a0,8000dcf8 <__modsi3+0xc>
8000dd0c:	40a00533          	neg	a0,a0
8000dd10:	f61ff0ef          	jal	ra,8000dc70 <__udivsi3>
8000dd14:	40b00533          	neg	a0,a1
8000dd18:	00028067          	jr	t0

Disassembly of section .text.startup:

8000dd1c <main>:
8000dd1c:	fa010113          	addi	sp,sp,-96
8000dd20:	04112e23          	sw	ra,92(sp)
8000dd24:	04812c23          	sw	s0,88(sp)
8000dd28:	04912a23          	sw	s1,84(sp)
8000dd2c:	05212823          	sw	s2,80(sp)
8000dd30:	05312623          	sw	s3,76(sp)
8000dd34:	05412423          	sw	s4,72(sp)
8000dd38:	05512223          	sw	s5,68(sp)
8000dd3c:	05612023          	sw	s6,64(sp)
8000dd40:	03712e23          	sw	s7,60(sp)
8000dd44:	03812c23          	sw	s8,56(sp)
8000dd48:	30047073          	csrci	mstatus,8
8000dd4c:	00000593          	li	a1,0
8000dd50:	00000513          	li	a0,0
8000dd54:	f3cf80ef          	jal	ra,80006490 <init_sbrk>
8000dd58:	001e8537          	lui	a0,0x1e8
8000dd5c:	48050513          	addi	a0,a0,1152 # 1e8480 <_stack_size+0x1e7480>
8000dd60:	f84f80ef          	jal	ra,800064e4 <delay_us>
8000dd64:	8701a783          	lw	a5,-1936(gp) # 800032e0 <deadbeef>
8000dd68:	1c078c63          	beqz	a5,8000df40 <main+0x224>
8000dd6c:	80002537          	lui	a0,0x80002
8000dd70:	0c450513          	addi	a0,a0,196 # 800020c4 <_ram_heap_end+0xfffea0c4>
8000dd74:	fa0f80ef          	jal	ra,80006514 <print_uart0>
8000dd78:	8e1f80ef          	jal	ra,80006658 <hard_reboot>
8000dd7c:	80002537          	lui	a0,0x80002
8000dd80:	14e00593          	li	a1,334
8000dd84:	0ec50513          	addi	a0,a0,236 # 800020ec <_ram_heap_end+0xfffea0ec>
8000dd88:	1c8010ef          	jal	ra,8000ef50 <iprintf>
8000dd8c:	f0000737          	lui	a4,0xf0000
8000dd90:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
8000dd94:	80002537          	lui	a0,0x80002
8000dd98:	18050513          	addi	a0,a0,384 # 80002180 <_ram_heap_end+0xfffea180>
8000dd9c:	0027e793          	ori	a5,a5,2
8000dda0:	00f72223          	sw	a5,4(a4)
8000dda4:	1ac010ef          	jal	ra,8000ef50 <iprintf>
8000dda8:	ba5f50ef          	jal	ra,8000394c <sram_test_write_random_ints>
8000ddac:	80002437          	lui	s0,0x80002
8000ddb0:	1a051063          	bnez	a0,8000df50 <main+0x234>
8000ddb4:	80002537          	lui	a0,0x80002
8000ddb8:	19050513          	addi	a0,a0,400 # 80002190 <_ram_heap_end+0xfffea190>
8000ddbc:	194010ef          	jal	ra,8000ef50 <iprintf>
8000ddc0:	000805b7          	lui	a1,0x80
8000ddc4:	90000537          	lui	a0,0x90000
8000ddc8:	ec8f80ef          	jal	ra,80006490 <init_sbrk>
8000ddcc:	800025b7          	lui	a1,0x80002
8000ddd0:	1a458593          	addi	a1,a1,420 # 800021a4 <_ram_heap_end+0xfffea1a4>
8000ddd4:	1ac40513          	addi	a0,s0,428 # 800021ac <_ram_heap_end+0xfffea1ac>
8000ddd8:	178010ef          	jal	ra,8000ef50 <iprintf>
8000dddc:	f00547b7          	lui	a5,0xf0054
8000dde0:	0007a023          	sw	zero,0(a5) # f0054000 <_ram_heap_end+0x7003c000>
8000dde4:	f0000737          	lui	a4,0xf0000
8000dde8:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
8000ddec:	03a00613          	li	a2,58
8000ddf0:	00100693          	li	a3,1
8000ddf4:	ff77f793          	andi	a5,a5,-9
8000ddf8:	00f72223          	sw	a5,4(a4)
8000ddfc:	f00607b7          	lui	a5,0xf0060
8000de00:	07f00713          	li	a4,127
8000de04:	00e7a623          	sw	a4,12(a5) # f006000c <_ram_heap_end+0x7004800c>
8000de08:	0007a223          	sw	zero,4(a5)
8000de0c:	fff00713          	li	a4,-1
8000de10:	00e7a023          	sw	a4,0(a5)
8000de14:	f0010737          	lui	a4,0xf0010
8000de18:	00472783          	lw	a5,4(a4) # f0010004 <_ram_heap_end+0x6fff8004>
8000de1c:	f0090537          	lui	a0,0xf0090
8000de20:	0027e793          	ori	a5,a5,2
8000de24:	00f72223          	sw	a5,4(a4)
8000de28:	f0011737          	lui	a4,0xf0011
8000de2c:	00472783          	lw	a5,4(a4) # f0011004 <_ram_heap_end+0x6fff9004>
8000de30:	0027e793          	ori	a5,a5,2
8000de34:	00f72223          	sw	a5,4(a4)
8000de38:	f00207b7          	lui	a5,0xf0020
8000de3c:	0007a023          	sw	zero,0(a5) # f0020000 <_ram_heap_end+0x70008000>
8000de40:	00c7a223          	sw	a2,4(a5)
8000de44:	0007a423          	sw	zero,8(a5)
8000de48:	00018737          	lui	a4,0x18
8000de4c:	0007a623          	sw	zero,12(a5)
8000de50:	6a070713          	addi	a4,a4,1696 # 186a0 <_stack_size+0x176a0>
8000de54:	00e7a823          	sw	a4,16(a5)
8000de58:	00d7a023          	sw	a3,0(a5)
8000de5c:	f00217b7          	lui	a5,0xf0021
8000de60:	0007a023          	sw	zero,0(a5) # f0021000 <_ram_heap_end+0x70009000>
8000de64:	00c7a223          	sw	a2,4(a5)
8000de68:	0007a423          	sw	zero,8(a5)
8000de6c:	0000c737          	lui	a4,0xc
8000de70:	0007a623          	sw	zero,12(a5)
8000de74:	35070713          	addi	a4,a4,848 # c350 <_stack_size+0xb350>
8000de78:	00e7a823          	sw	a4,16(a5)
8000de7c:	00d7a023          	sw	a3,0(a5)
8000de80:	da4f80ef          	jal	ra,80006424 <i2c_init>
8000de84:	30046073          	csrsi	mstatus,8
8000de88:	80c1a783          	lw	a5,-2036(gp) # 8000327c <_impure_ptr>
8000de8c:	0007a937          	lui	s2,0x7a
8000de90:	0087a503          	lw	a0,8(a5)
8000de94:	00a00493          	li	s1,10
8000de98:	00200a93          	li	s5,2
8000de9c:	2b1000ef          	jal	ra,8000e94c <fpurge>
8000dea0:	80002537          	lui	a0,0x80002
8000dea4:	1c450513          	addi	a0,a0,452 # 800021c4 <_ram_heap_end+0xfffea1c4>
8000dea8:	0a8010ef          	jal	ra,8000ef50 <iprintf>
8000deac:	80c1a783          	lw	a5,-2036(gp) # 8000327c <_impure_ptr>
8000deb0:	000a0993          	mv	s3,s4
8000deb4:	f0000b37          	lui	s6,0xf0000
8000deb8:	0087a503          	lw	a0,8(a5)
8000debc:	12090913          	addi	s2,s2,288 # 7a120 <_stack_size+0x79120>
8000dec0:	68c000ef          	jal	ra,8000e54c <fflush>
8000dec4:	88c1a783          	lw	a5,-1908(gp) # 800032fc <uart_config_reset_counter>
8000dec8:	02fae863          	bltu	s5,a5,8000def8 <main+0x1dc>
8000decc:	000b2783          	lw	a5,0(s6) # f0000000 <_ram_heap_end+0x6ffe8000>
8000ded0:	0207d463          	bgez	a5,8000def8 <main+0x1dc>
8000ded4:	02e00513          	li	a0,46
8000ded8:	130010ef          	jal	ra,8000f008 <putchar>
8000dedc:	80c1a783          	lw	a5,-2036(gp) # 8000327c <_impure_ptr>
8000dee0:	fff48493          	addi	s1,s1,-1
8000dee4:	0087a503          	lw	a0,8(a5)
8000dee8:	664000ef          	jal	ra,8000e54c <fflush>
8000deec:	00090513          	mv	a0,s2
8000def0:	df4f80ef          	jal	ra,800064e4 <delay_us>
8000def4:	fc0498e3          	bnez	s1,8000dec4 <main+0x1a8>
8000def8:	80003537          	lui	a0,0x80003
8000defc:	8e850513          	addi	a0,a0,-1816 # 800028e8 <_ram_heap_end+0xfffea8e8>
8000df00:	050010ef          	jal	ra,8000ef50 <iprintf>
8000df04:	800034b7          	lui	s1,0x80003
8000df08:	02000613          	li	a2,32
8000df0c:	1e048593          	addi	a1,s1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
8000df10:	9b418513          	addi	a0,gp,-1612 # 80003424 <active_config>
8000df14:	3fd000ef          	jal	ra,8000eb10 <memcpy>
8000df18:	88c1a703          	lw	a4,-1908(gp) # 800032fc <uart_config_reset_counter>
8000df1c:	00200793          	li	a5,2
8000df20:	02e7fe63          	bgeu	a5,a4,8000df5c <main+0x240>
8000df24:	800025b7          	lui	a1,0x80002
8000df28:	8801a623          	sw	zero,-1908(gp) # 800032fc <uart_config_reset_counter>
8000df2c:	1e058593          	addi	a1,a1,480 # 800021e0 <_ram_heap_end+0xfffea1e0>
8000df30:	80002537          	lui	a0,0x80002
8000df34:	1f050513          	addi	a0,a0,496 # 800021f0 <_ram_heap_end+0xfffea1f0>
8000df38:	018010ef          	jal	ra,8000ef50 <iprintf>
8000df3c:	05c0006f          	j	8000df98 <main+0x27c>
8000df40:	deadc7b7          	lui	a5,0xdeadc
8000df44:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac3eef>
8000df48:	86f1a823          	sw	a5,-1936(gp) # 800032e0 <deadbeef>
8000df4c:	e31ff06f          	j	8000dd7c <main+0x60>
8000df50:	800025b7          	lui	a1,0x80002
8000df54:	1b858593          	addi	a1,a1,440 # 800021b8 <_ram_heap_end+0xfffea1b8>
8000df58:	e7dff06f          	j	8000ddd4 <main+0xb8>
8000df5c:	f00007b7          	lui	a5,0xf0000
8000df60:	0007a783          	lw	a5,0(a5) # f0000000 <_ram_heap_end+0x6ffe8000>
8000df64:	0007c863          	bltz	a5,8000df74 <main+0x258>
8000df68:	800025b7          	lui	a1,0x80002
8000df6c:	20c58593          	addi	a1,a1,524 # 8000220c <_ram_heap_end+0xfffea20c>
8000df70:	fc1ff06f          	j	8000df30 <main+0x214>
8000df74:	f0090537          	lui	a0,0xf0090
8000df78:	d90f60ef          	jal	ra,80004508 <eeprom_probe>
8000df7c:	2e051e63          	bnez	a0,8000e278 <main+0x55c>
8000df80:	9b418513          	addi	a0,gp,-1612 # 80003424 <active_config>
8000df84:	f1df50ef          	jal	ra,80003ea0 <config_load>
8000df88:	2c051a63          	bnez	a0,8000e25c <main+0x540>
8000df8c:	80002537          	lui	a0,0x80002
8000df90:	21850513          	addi	a0,a0,536 # 80002218 <_ram_heap_end+0xfffea218>
8000df94:	7bd000ef          	jal	ra,8000ef50 <iprintf>
8000df98:	30047073          	csrci	mstatus,8
8000df9c:	9b418413          	addi	s0,gp,-1612 # 80003424 <active_config>
8000dfa0:	01344503          	lbu	a0,19(s0)
8000dfa4:	f5cf70ef          	jal	ra,80005700 <hub_init>
8000dfa8:	ae8f70ef          	jal	ra,80005290 <mac_lwip_init>
8000dfac:	c65f70ef          	jal	ra,80005c10 <modbus_udp_init>
8000dfb0:	cd1f50ef          	jal	ra,80003c80 <modbus_rtu_init>
8000dfb4:	000045b7          	lui	a1,0x4
8000dfb8:	e8058593          	addi	a1,a1,-384 # 3e80 <_stack_size+0x2e80>
8000dfbc:	f00c0537          	lui	a0,0xf00c0
8000dfc0:	f01f70ef          	jal	ra,80005ec0 <audiodac_init>
8000dfc4:	80002537          	lui	a0,0x80002
8000dfc8:	25c50513          	addi	a0,a0,604 # 8000225c <_ram_heap_end+0xfffea25c>
8000dfcc:	785000ef          	jal	ra,8000ef50 <iprintf>
8000dfd0:	f0000737          	lui	a4,0xf0000
8000dfd4:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
8000dfd8:	ff87f793          	andi	a5,a5,-8
8000dfdc:	00f72223          	sw	a5,4(a4)
8000dfe0:	30046073          	csrsi	mstatus,8
8000dfe4:	80002537          	lui	a0,0x80002
8000dfe8:	27450513          	addi	a0,a0,628 # 80002274 <_ram_heap_end+0xfffea274>
8000dfec:	765000ef          	jal	ra,8000ef50 <iprintf>
8000dff0:	800004b7          	lui	s1,0x80000
8000dff4:	800026b7          	lui	a3,0x80002
8000dff8:	00800893          	li	a7,8
8000dffc:	00600813          	li	a6,6
8000e000:	13448793          	addi	a5,s1,308 # 80000134 <_ram_heap_end+0xfffe8134>
8000e004:	00500713          	li	a4,5
8000e008:	29868693          	addi	a3,a3,664 # 80002298 <_ram_heap_end+0xfffea298>
8000e00c:	03f00613          	li	a2,63
8000e010:	00000593          	li	a1,0
8000e014:	00600513          	li	a0,6
8000e018:	b15f70ef          	jal	ra,80005b2c <hub_print>
8000e01c:	01444603          	lbu	a2,20(s0)
8000e020:	800025b7          	lui	a1,0x80002
8000e024:	2a058593          	addi	a1,a1,672 # 800022a0 <_ram_heap_end+0xfffea2a0>
8000e028:	01010513          	addi	a0,sp,16
8000e02c:	310010ef          	jal	ra,8000f33c <siprintf>
8000e030:	00050713          	mv	a4,a0
8000e034:	00800893          	li	a7,8
8000e038:	00600813          	li	a6,6
8000e03c:	13448793          	addi	a5,s1,308
8000e040:	01010693          	addi	a3,sp,16
8000e044:	03f00613          	li	a2,63
8000e048:	00800593          	li	a1,8
8000e04c:	00000513          	li	a0,0
8000e050:	addf70ef          	jal	ra,80005b2c <hub_print>
8000e054:	001e8937          	lui	s2,0x1e8
8000e058:	48090513          	addi	a0,s2,1152 # 1e8480 <_stack_size+0x1e7480>
8000e05c:	829f50ef          	jal	ra,80003884 <process_and_wait>
8000e060:	800026b7          	lui	a3,0x80002
8000e064:	00800893          	li	a7,8
8000e068:	00600813          	li	a6,6
8000e06c:	13448793          	addi	a5,s1,308
8000e070:	00500713          	li	a4,5
8000e074:	2a468693          	addi	a3,a3,676 # 800022a4 <_ram_heap_end+0xfffea2a4>
8000e078:	03f00613          	li	a2,63
8000e07c:	00000593          	li	a1,0
8000e080:	00600513          	li	a0,6
8000e084:	aa9f70ef          	jal	ra,80005b2c <hub_print>
8000e088:	9d418413          	addi	s0,gp,-1580 # 80003444 <default_netif>
8000e08c:	00444603          	lbu	a2,4(s0)
8000e090:	800029b7          	lui	s3,0x80002
8000e094:	2ac98593          	addi	a1,s3,684 # 800022ac <_ram_heap_end+0xfffea2ac>
8000e098:	01010513          	addi	a0,sp,16
8000e09c:	2a0010ef          	jal	ra,8000f33c <siprintf>
8000e0a0:	00050713          	mv	a4,a0
8000e0a4:	00800893          	li	a7,8
8000e0a8:	00600813          	li	a6,6
8000e0ac:	13448793          	addi	a5,s1,308
8000e0b0:	01010693          	addi	a3,sp,16
8000e0b4:	03f00613          	li	a2,63
8000e0b8:	00800593          	li	a1,8
8000e0bc:	00000513          	li	a0,0
8000e0c0:	a6df70ef          	jal	ra,80005b2c <hub_print>
8000e0c4:	48090513          	addi	a0,s2,1152
8000e0c8:	fbcf50ef          	jal	ra,80003884 <process_and_wait>
8000e0cc:	00544603          	lbu	a2,5(s0)
8000e0d0:	2ac98593          	addi	a1,s3,684
8000e0d4:	01010513          	addi	a0,sp,16
8000e0d8:	264010ef          	jal	ra,8000f33c <siprintf>
8000e0dc:	00050713          	mv	a4,a0
8000e0e0:	00800893          	li	a7,8
8000e0e4:	00600813          	li	a6,6
8000e0e8:	13448793          	addi	a5,s1,308
8000e0ec:	01010693          	addi	a3,sp,16
8000e0f0:	03f00613          	li	a2,63
8000e0f4:	00800593          	li	a1,8
8000e0f8:	00000513          	li	a0,0
8000e0fc:	a31f70ef          	jal	ra,80005b2c <hub_print>
8000e100:	48090513          	addi	a0,s2,1152
8000e104:	f80f50ef          	jal	ra,80003884 <process_and_wait>
8000e108:	00644603          	lbu	a2,6(s0)
8000e10c:	2ac98593          	addi	a1,s3,684
8000e110:	01010513          	addi	a0,sp,16
8000e114:	228010ef          	jal	ra,8000f33c <siprintf>
8000e118:	00050713          	mv	a4,a0
8000e11c:	00800893          	li	a7,8
8000e120:	00600813          	li	a6,6
8000e124:	13448793          	addi	a5,s1,308
8000e128:	01010693          	addi	a3,sp,16
8000e12c:	03f00613          	li	a2,63
8000e130:	00800593          	li	a1,8
8000e134:	00000513          	li	a0,0
8000e138:	9f5f70ef          	jal	ra,80005b2c <hub_print>
8000e13c:	48090513          	addi	a0,s2,1152
8000e140:	f44f50ef          	jal	ra,80003884 <process_and_wait>
8000e144:	00744603          	lbu	a2,7(s0)
8000e148:	2ac98593          	addi	a1,s3,684
8000e14c:	01010513          	addi	a0,sp,16
8000e150:	1ec010ef          	jal	ra,8000f33c <siprintf>
8000e154:	00050713          	mv	a4,a0
8000e158:	00800893          	li	a7,8
8000e15c:	00600813          	li	a6,6
8000e160:	13448793          	addi	a5,s1,308
8000e164:	01010693          	addi	a3,sp,16
8000e168:	03f00613          	li	a2,63
8000e16c:	00800593          	li	a1,8
8000e170:	00000513          	li	a0,0
8000e174:	9b9f70ef          	jal	ra,80005b2c <hub_print>
8000e178:	48090513          	addi	a0,s2,1152
8000e17c:	f08f50ef          	jal	ra,80003884 <process_and_wait>
8000e180:	8c81a603          	lw	a2,-1848(gp) # 80003338 <hub_frame_size>
8000e184:	00000593          	li	a1,0
8000e188:	f0050537          	lui	a0,0xf0050
8000e18c:	bd4ff0ef          	jal	ra,8000d560 <memset>
8000e190:	0000f537          	lui	a0,0xf
8000e194:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xda60>
8000e198:	129000ef          	jal	ra,8000eac0 <malloc>
8000e19c:	0e050463          	beqz	a0,8000e284 <main+0x568>
8000e1a0:	000075b7          	lui	a1,0x7
8000e1a4:	53058593          	addi	a1,a1,1328 # 7530 <_stack_size+0x6530>
8000e1a8:	a10f80ef          	jal	ra,800063b8 <audiodac0_start_playback>
8000e1ac:	0007a4b7          	lui	s1,0x7a
8000e1b0:	12048493          	addi	s1,s1,288 # 7a120 <_stack_size+0x79120>
8000e1b4:	f0000937          	lui	s2,0xf0000
8000e1b8:	00492783          	lw	a5,4(s2) # f0000004 <_ram_heap_end+0x6ffe8004>
8000e1bc:	00048513          	mv	a0,s1
8000e1c0:	0017e793          	ori	a5,a5,1
8000e1c4:	00f92223          	sw	a5,4(s2)
8000e1c8:	ebcf50ef          	jal	ra,80003884 <process_and_wait>
8000e1cc:	00492783          	lw	a5,4(s2)
8000e1d0:	00048513          	mv	a0,s1
8000e1d4:	ffe7f793          	andi	a5,a5,-2
8000e1d8:	00f92223          	sw	a5,4(s2)
8000e1dc:	ea8f50ef          	jal	ra,80003884 <process_and_wait>
8000e1e0:	f00547b7          	lui	a5,0xf0054
8000e1e4:	0007a603          	lw	a2,0(a5) # f0054000 <_ram_heap_end+0x7003c000>
8000e1e8:	89c1a703          	lw	a4,-1892(gp) # 8000330c <reg_irq_counter>
8000e1ec:	8981a783          	lw	a5,-1896(gp) # 80003308 <reg_sys_counter>
8000e1f0:	8941a803          	lw	a6,-1900(gp) # 80003304 <reg_scratch>
8000e1f4:	8741a683          	lw	a3,-1932(gp) # 800032e4 <audiodac0_samples_sent>
8000e1f8:	8781a583          	lw	a1,-1928(gp) # 800032e8 <audiodac0_irqs>
8000e1fc:	8e81a883          	lw	a7,-1816(gp) # 80003358 <sbrk_heap_end>
8000e200:	00d12023          	sw	a3,0(sp)
8000e204:	8c81a683          	lw	a3,-1848(gp) # 80003338 <hub_frame_size>
8000e208:	80002537          	lui	a0,0x80002
8000e20c:	07f67613          	andi	a2,a2,127
8000e210:	00b12223          	sw	a1,4(sp)
8000e214:	2d850513          	addi	a0,a0,728 # 800022d8 <_ram_heap_end+0xfffea2d8>
8000e218:	14e00593          	li	a1,334
8000e21c:	535000ef          	jal	ra,8000ef50 <iprintf>
8000e220:	c49f70ef          	jal	ra,80005e68 <plic_print_stats>
8000e224:	c7cf70ef          	jal	ra,800056a0 <mac_print_stats>
8000e228:	8981a783          	lw	a5,-1896(gp) # 80003308 <reg_sys_counter>
8000e22c:	00178793          	addi	a5,a5,1
8000e230:	88f1ac23          	sw	a5,-1896(gp) # 80003308 <reg_sys_counter>
8000e234:	8901a703          	lw	a4,-1904(gp) # 80003300 <reg_config_write>
8000e238:	00070863          	beqz	a4,8000e248 <main+0x52c>
8000e23c:	8901a703          	lw	a4,-1904(gp) # 80003300 <reg_config_write>
8000e240:	fff70713          	addi	a4,a4,-1
8000e244:	88e1a823          	sw	a4,-1904(gp) # 80003300 <reg_config_write>
8000e248:	f0000737          	lui	a4,0xf0000
8000e24c:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
8000e250:	ffd7f793          	andi	a5,a5,-3
8000e254:	00f72223          	sw	a5,4(a4)
8000e258:	f5dff06f          	j	8000e1b4 <main+0x498>
8000e25c:	1e048593          	addi	a1,s1,480
8000e260:	02000613          	li	a2,32
8000e264:	9b418513          	addi	a0,gp,-1612 # 80003424 <active_config>
8000e268:	0a9000ef          	jal	ra,8000eb10 <memcpy>
8000e26c:	800025b7          	lui	a1,0x80002
8000e270:	23458593          	addi	a1,a1,564 # 80002234 <_ram_heap_end+0xfffea234>
8000e274:	cbdff06f          	j	8000df30 <main+0x214>
8000e278:	800025b7          	lui	a1,0x80002
8000e27c:	24858593          	addi	a1,a1,584 # 80002248 <_ram_heap_end+0xfffea248>
8000e280:	cb1ff06f          	j	8000df30 <main+0x214>
8000e284:	80002537          	lui	a0,0x80002
8000e288:	2b450513          	addi	a0,a0,692 # 800022b4 <_ram_heap_end+0xfffea2b4>
8000e28c:	4c5000ef          	jal	ra,8000ef50 <iprintf>
8000e290:	f1dff06f          	j	8000e1ac <main+0x490>

Disassembly of section .text.atoi:

8000e294 <atoi>:
8000e294:	00a00613          	li	a2,10
8000e298:	00000593          	li	a1,0
8000e29c:	4d00106f          	j	8000f76c <strtol>

Disassembly of section .text._atoi_r:

8000e2a0 <_atoi_r>:
8000e2a0:	00a00693          	li	a3,10
8000e2a4:	00000613          	li	a2,0
8000e2a8:	4a80106f          	j	8000f750 <_strtol_r>

Disassembly of section .text.calloc:

8000e2ac <calloc>:
8000e2ac:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000e2b0:	00058613          	mv	a2,a1
8000e2b4:	00050593          	mv	a1,a0
8000e2b8:	0007a503          	lw	a0,0(a5)
8000e2bc:	1890006f          	j	8000ec44 <_calloc_r>

Disassembly of section .text.__sflush_r:

8000e2c0 <__sflush_r>:
8000e2c0:	00c5d783          	lhu	a5,12(a1)
8000e2c4:	fe010113          	addi	sp,sp,-32
8000e2c8:	00812c23          	sw	s0,24(sp)
8000e2cc:	00912a23          	sw	s1,20(sp)
8000e2d0:	00112e23          	sw	ra,28(sp)
8000e2d4:	01212823          	sw	s2,16(sp)
8000e2d8:	01312623          	sw	s3,12(sp)
8000e2dc:	0087f713          	andi	a4,a5,8
8000e2e0:	00050493          	mv	s1,a0
8000e2e4:	00058413          	mv	s0,a1
8000e2e8:	14071e63          	bnez	a4,8000e444 <__sflush_r+0x184>
8000e2ec:	0045a703          	lw	a4,4(a1)
8000e2f0:	00e04a63          	bgtz	a4,8000e304 <__sflush_r+0x44>
8000e2f4:	0405a703          	lw	a4,64(a1)
8000e2f8:	00e04663          	bgtz	a4,8000e304 <__sflush_r+0x44>
8000e2fc:	00000513          	li	a0,0
8000e300:	11c0006f          	j	8000e41c <__sflush_r+0x15c>
8000e304:	02c42703          	lw	a4,44(s0)
8000e308:	fe070ae3          	beqz	a4,8000e2fc <__sflush_r+0x3c>
8000e30c:	0004a903          	lw	s2,0(s1)
8000e310:	01379693          	slli	a3,a5,0x13
8000e314:	0004a023          	sw	zero,0(s1)
8000e318:	0a06de63          	bgez	a3,8000e3d4 <__sflush_r+0x114>
8000e31c:	05442503          	lw	a0,84(s0)
8000e320:	00c45783          	lhu	a5,12(s0)
8000e324:	0047f793          	andi	a5,a5,4
8000e328:	00078e63          	beqz	a5,8000e344 <__sflush_r+0x84>
8000e32c:	00442783          	lw	a5,4(s0)
8000e330:	40f50533          	sub	a0,a0,a5
8000e334:	03442783          	lw	a5,52(s0)
8000e338:	00078663          	beqz	a5,8000e344 <__sflush_r+0x84>
8000e33c:	04042783          	lw	a5,64(s0)
8000e340:	40f50533          	sub	a0,a0,a5
8000e344:	02c42783          	lw	a5,44(s0)
8000e348:	02042583          	lw	a1,32(s0)
8000e34c:	00050613          	mv	a2,a0
8000e350:	00000693          	li	a3,0
8000e354:	00048513          	mv	a0,s1
8000e358:	000780e7          	jalr	a5
8000e35c:	fff00793          	li	a5,-1
8000e360:	00c45703          	lhu	a4,12(s0)
8000e364:	02f51263          	bne	a0,a5,8000e388 <__sflush_r+0xc8>
8000e368:	0004a683          	lw	a3,0(s1)
8000e36c:	01d00793          	li	a5,29
8000e370:	0cd7e463          	bltu	a5,a3,8000e438 <__sflush_r+0x178>
8000e374:	204007b7          	lui	a5,0x20400
8000e378:	00178793          	addi	a5,a5,1 # 20400001 <_stack_size+0x203ff001>
8000e37c:	00d7d7b3          	srl	a5,a5,a3
8000e380:	0017f793          	andi	a5,a5,1
8000e384:	0a078a63          	beqz	a5,8000e438 <__sflush_r+0x178>
8000e388:	01042783          	lw	a5,16(s0)
8000e38c:	00042223          	sw	zero,4(s0)
8000e390:	00f42023          	sw	a5,0(s0)
8000e394:	01371793          	slli	a5,a4,0x13
8000e398:	0007dc63          	bgez	a5,8000e3b0 <__sflush_r+0xf0>
8000e39c:	fff00793          	li	a5,-1
8000e3a0:	00f51663          	bne	a0,a5,8000e3ac <__sflush_r+0xec>
8000e3a4:	0004a783          	lw	a5,0(s1)
8000e3a8:	00079463          	bnez	a5,8000e3b0 <__sflush_r+0xf0>
8000e3ac:	04a42a23          	sw	a0,84(s0)
8000e3b0:	03442583          	lw	a1,52(s0)
8000e3b4:	0124a023          	sw	s2,0(s1)
8000e3b8:	f40582e3          	beqz	a1,8000e2fc <__sflush_r+0x3c>
8000e3bc:	04440793          	addi	a5,s0,68
8000e3c0:	00f58663          	beq	a1,a5,8000e3cc <__sflush_r+0x10c>
8000e3c4:	00048513          	mv	a0,s1
8000e3c8:	0d1000ef          	jal	ra,8000ec98 <_free_r>
8000e3cc:	02042a23          	sw	zero,52(s0)
8000e3d0:	f2dff06f          	j	8000e2fc <__sflush_r+0x3c>
8000e3d4:	02042583          	lw	a1,32(s0)
8000e3d8:	00100693          	li	a3,1
8000e3dc:	00000613          	li	a2,0
8000e3e0:	00048513          	mv	a0,s1
8000e3e4:	000700e7          	jalr	a4
8000e3e8:	fff00793          	li	a5,-1
8000e3ec:	f2f51ae3          	bne	a0,a5,8000e320 <__sflush_r+0x60>
8000e3f0:	0004a783          	lw	a5,0(s1)
8000e3f4:	f20786e3          	beqz	a5,8000e320 <__sflush_r+0x60>
8000e3f8:	01d00713          	li	a4,29
8000e3fc:	00e78663          	beq	a5,a4,8000e408 <__sflush_r+0x148>
8000e400:	01600713          	li	a4,22
8000e404:	00e79663          	bne	a5,a4,8000e410 <__sflush_r+0x150>
8000e408:	0124a023          	sw	s2,0(s1)
8000e40c:	ef1ff06f          	j	8000e2fc <__sflush_r+0x3c>
8000e410:	00c45783          	lhu	a5,12(s0)
8000e414:	0407e793          	ori	a5,a5,64
8000e418:	00f41623          	sh	a5,12(s0)
8000e41c:	01c12083          	lw	ra,28(sp)
8000e420:	01812403          	lw	s0,24(sp)
8000e424:	01412483          	lw	s1,20(sp)
8000e428:	01012903          	lw	s2,16(sp)
8000e42c:	00c12983          	lw	s3,12(sp)
8000e430:	02010113          	addi	sp,sp,32
8000e434:	00008067          	ret
8000e438:	04076713          	ori	a4,a4,64
8000e43c:	00e41623          	sh	a4,12(s0)
8000e440:	fddff06f          	j	8000e41c <__sflush_r+0x15c>
8000e444:	0105a983          	lw	s3,16(a1)
8000e448:	ea098ae3          	beqz	s3,8000e2fc <__sflush_r+0x3c>
8000e44c:	0005a903          	lw	s2,0(a1)
8000e450:	0037f793          	andi	a5,a5,3
8000e454:	0135a023          	sw	s3,0(a1)
8000e458:	41390933          	sub	s2,s2,s3
8000e45c:	00000713          	li	a4,0
8000e460:	00079463          	bnez	a5,8000e468 <__sflush_r+0x1a8>
8000e464:	0145a703          	lw	a4,20(a1)
8000e468:	00e42423          	sw	a4,8(s0)
8000e46c:	e92058e3          	blez	s2,8000e2fc <__sflush_r+0x3c>
8000e470:	02842783          	lw	a5,40(s0)
8000e474:	02042583          	lw	a1,32(s0)
8000e478:	00090693          	mv	a3,s2
8000e47c:	00098613          	mv	a2,s3
8000e480:	00048513          	mv	a0,s1
8000e484:	000780e7          	jalr	a5
8000e488:	00a04c63          	bgtz	a0,8000e4a0 <__sflush_r+0x1e0>
8000e48c:	00c45783          	lhu	a5,12(s0)
8000e490:	fff00513          	li	a0,-1
8000e494:	0407e793          	ori	a5,a5,64
8000e498:	00f41623          	sh	a5,12(s0)
8000e49c:	f81ff06f          	j	8000e41c <__sflush_r+0x15c>
8000e4a0:	00a989b3          	add	s3,s3,a0
8000e4a4:	40a90933          	sub	s2,s2,a0
8000e4a8:	fc5ff06f          	j	8000e46c <__sflush_r+0x1ac>

Disassembly of section .text._fflush_r:

8000e4ac <_fflush_r>:
8000e4ac:	0105a783          	lw	a5,16(a1)
8000e4b0:	08078a63          	beqz	a5,8000e544 <_fflush_r+0x98>
8000e4b4:	fe010113          	addi	sp,sp,-32
8000e4b8:	00812c23          	sw	s0,24(sp)
8000e4bc:	00112e23          	sw	ra,28(sp)
8000e4c0:	00050413          	mv	s0,a0
8000e4c4:	00050c63          	beqz	a0,8000e4dc <_fflush_r+0x30>
8000e4c8:	01852783          	lw	a5,24(a0)
8000e4cc:	00079863          	bnez	a5,8000e4dc <_fflush_r+0x30>
8000e4d0:	00b12623          	sw	a1,12(sp)
8000e4d4:	1c8000ef          	jal	ra,8000e69c <__sinit>
8000e4d8:	00c12583          	lw	a1,12(sp)
8000e4dc:	ffff5797          	auipc	a5,0xffff5
8000e4e0:	b8878793          	addi	a5,a5,-1144 # 80003064 <__sf_fake_stdin>
8000e4e4:	02f59263          	bne	a1,a5,8000e508 <_fflush_r+0x5c>
8000e4e8:	00442583          	lw	a1,4(s0)
8000e4ec:	00c59783          	lh	a5,12(a1)
8000e4f0:	04078063          	beqz	a5,8000e530 <_fflush_r+0x84>
8000e4f4:	00040513          	mv	a0,s0
8000e4f8:	01812403          	lw	s0,24(sp)
8000e4fc:	01c12083          	lw	ra,28(sp)
8000e500:	02010113          	addi	sp,sp,32
8000e504:	dbdff06f          	j	8000e2c0 <__sflush_r>
8000e508:	ffff5797          	auipc	a5,0xffff5
8000e50c:	b7c78793          	addi	a5,a5,-1156 # 80003084 <__sf_fake_stdout>
8000e510:	00f59663          	bne	a1,a5,8000e51c <_fflush_r+0x70>
8000e514:	00842583          	lw	a1,8(s0)
8000e518:	fd5ff06f          	j	8000e4ec <_fflush_r+0x40>
8000e51c:	ffff5797          	auipc	a5,0xffff5
8000e520:	b2878793          	addi	a5,a5,-1240 # 80003044 <__sf_fake_stderr>
8000e524:	fcf594e3          	bne	a1,a5,8000e4ec <_fflush_r+0x40>
8000e528:	00c42583          	lw	a1,12(s0)
8000e52c:	fc1ff06f          	j	8000e4ec <_fflush_r+0x40>
8000e530:	01c12083          	lw	ra,28(sp)
8000e534:	01812403          	lw	s0,24(sp)
8000e538:	00000513          	li	a0,0
8000e53c:	02010113          	addi	sp,sp,32
8000e540:	00008067          	ret
8000e544:	00000513          	li	a0,0
8000e548:	00008067          	ret

Disassembly of section .text.fflush:

8000e54c <fflush>:
8000e54c:	00050593          	mv	a1,a0
8000e550:	00051c63          	bnez	a0,8000e568 <fflush+0x1c>
8000e554:	c7018793          	addi	a5,gp,-912 # 800036e0 <_bss_end>
8000e558:	0007a503          	lw	a0,0(a5)
8000e55c:	00000597          	auipc	a1,0x0
8000e560:	f5058593          	addi	a1,a1,-176 # 8000e4ac <_fflush_r>
8000e564:	4a80006f          	j	8000ea0c <_fwalk_reent>
8000e568:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000e56c:	0007a503          	lw	a0,0(a5)
8000e570:	f3dff06f          	j	8000e4ac <_fflush_r>

Disassembly of section .text.__fp_lock:

8000e574 <__fp_lock>:
8000e574:	00000513          	li	a0,0
8000e578:	00008067          	ret

Disassembly of section .text.std:

8000e57c <std>:
8000e57c:	ff010113          	addi	sp,sp,-16
8000e580:	00812423          	sw	s0,8(sp)
8000e584:	00112623          	sw	ra,12(sp)
8000e588:	00050413          	mv	s0,a0
8000e58c:	00b51623          	sh	a1,12(a0)
8000e590:	00c51723          	sh	a2,14(a0)
8000e594:	00052023          	sw	zero,0(a0)
8000e598:	00052223          	sw	zero,4(a0)
8000e59c:	00052423          	sw	zero,8(a0)
8000e5a0:	06052223          	sw	zero,100(a0)
8000e5a4:	00052823          	sw	zero,16(a0)
8000e5a8:	00052a23          	sw	zero,20(a0)
8000e5ac:	00052c23          	sw	zero,24(a0)
8000e5b0:	00800613          	li	a2,8
8000e5b4:	00000593          	li	a1,0
8000e5b8:	05c50513          	addi	a0,a0,92
8000e5bc:	fa5fe0ef          	jal	ra,8000d560 <memset>
8000e5c0:	00001797          	auipc	a5,0x1
8000e5c4:	df078793          	addi	a5,a5,-528 # 8000f3b0 <__sread>
8000e5c8:	02f42223          	sw	a5,36(s0)
8000e5cc:	00001797          	auipc	a5,0x1
8000e5d0:	e3c78793          	addi	a5,a5,-452 # 8000f408 <__swrite>
8000e5d4:	02f42423          	sw	a5,40(s0)
8000e5d8:	00001797          	auipc	a5,0x1
8000e5dc:	eb478793          	addi	a5,a5,-332 # 8000f48c <__sseek>
8000e5e0:	02f42623          	sw	a5,44(s0)
8000e5e4:	00001797          	auipc	a5,0x1
8000e5e8:	f0078793          	addi	a5,a5,-256 # 8000f4e4 <__sclose>
8000e5ec:	02842023          	sw	s0,32(s0)
8000e5f0:	02f42823          	sw	a5,48(s0)
8000e5f4:	00c12083          	lw	ra,12(sp)
8000e5f8:	00812403          	lw	s0,8(sp)
8000e5fc:	01010113          	addi	sp,sp,16
8000e600:	00008067          	ret

Disassembly of section .text._cleanup_r:

8000e604 <_cleanup_r>:
8000e604:	00000597          	auipc	a1,0x0
8000e608:	ea858593          	addi	a1,a1,-344 # 8000e4ac <_fflush_r>
8000e60c:	4000006f          	j	8000ea0c <_fwalk_reent>

Disassembly of section .text.__fp_unlock:

8000e610 <__fp_unlock>:
8000e610:	00000513          	li	a0,0
8000e614:	00008067          	ret

Disassembly of section .text.__sfmoreglue:

8000e618 <__sfmoreglue>:
8000e618:	ff010113          	addi	sp,sp,-16
8000e61c:	fff58613          	addi	a2,a1,-1
8000e620:	00812423          	sw	s0,8(sp)
8000e624:	00161413          	slli	s0,a2,0x1
8000e628:	00c40433          	add	s0,s0,a2
8000e62c:	00241413          	slli	s0,s0,0x2
8000e630:	00c40433          	add	s0,s0,a2
8000e634:	00341413          	slli	s0,s0,0x3
8000e638:	01212023          	sw	s2,0(sp)
8000e63c:	00058913          	mv	s2,a1
8000e640:	07440593          	addi	a1,s0,116
8000e644:	00912223          	sw	s1,4(sp)
8000e648:	00112623          	sw	ra,12(sp)
8000e64c:	750000ef          	jal	ra,8000ed9c <_malloc_r>
8000e650:	00050493          	mv	s1,a0
8000e654:	02050063          	beqz	a0,8000e674 <__sfmoreglue+0x5c>
8000e658:	00052023          	sw	zero,0(a0)
8000e65c:	01252223          	sw	s2,4(a0)
8000e660:	00c50513          	addi	a0,a0,12
8000e664:	00a4a423          	sw	a0,8(s1)
8000e668:	06840613          	addi	a2,s0,104
8000e66c:	00000593          	li	a1,0
8000e670:	ef1fe0ef          	jal	ra,8000d560 <memset>
8000e674:	00c12083          	lw	ra,12(sp)
8000e678:	00812403          	lw	s0,8(sp)
8000e67c:	00048513          	mv	a0,s1
8000e680:	00012903          	lw	s2,0(sp)
8000e684:	00412483          	lw	s1,4(sp)
8000e688:	01010113          	addi	sp,sp,16
8000e68c:	00008067          	ret

Disassembly of section .text._cleanup:

8000e690 <_cleanup>:
8000e690:	c7018793          	addi	a5,gp,-912 # 800036e0 <_bss_end>
8000e694:	0007a503          	lw	a0,0(a5)
8000e698:	f6dff06f          	j	8000e604 <_cleanup_r>

Disassembly of section .text.__sinit:

8000e69c <__sinit>:
8000e69c:	01852783          	lw	a5,24(a0)
8000e6a0:	0a079463          	bnez	a5,8000e748 <__sinit+0xac>
8000e6a4:	ff010113          	addi	sp,sp,-16
8000e6a8:	00112623          	sw	ra,12(sp)
8000e6ac:	00812423          	sw	s0,8(sp)
8000e6b0:	00000797          	auipc	a5,0x0
8000e6b4:	f5478793          	addi	a5,a5,-172 # 8000e604 <_cleanup_r>
8000e6b8:	02f52423          	sw	a5,40(a0)
8000e6bc:	c7018793          	addi	a5,gp,-912 # 800036e0 <_bss_end>
8000e6c0:	0007a783          	lw	a5,0(a5)
8000e6c4:	04052423          	sw	zero,72(a0)
8000e6c8:	04052623          	sw	zero,76(a0)
8000e6cc:	04052823          	sw	zero,80(a0)
8000e6d0:	00f51663          	bne	a0,a5,8000e6dc <__sinit+0x40>
8000e6d4:	00100793          	li	a5,1
8000e6d8:	00f52c23          	sw	a5,24(a0)
8000e6dc:	00050413          	mv	s0,a0
8000e6e0:	06c000ef          	jal	ra,8000e74c <__sfp>
8000e6e4:	00a42223          	sw	a0,4(s0)
8000e6e8:	00040513          	mv	a0,s0
8000e6ec:	060000ef          	jal	ra,8000e74c <__sfp>
8000e6f0:	00a42423          	sw	a0,8(s0)
8000e6f4:	00040513          	mv	a0,s0
8000e6f8:	054000ef          	jal	ra,8000e74c <__sfp>
8000e6fc:	00a42623          	sw	a0,12(s0)
8000e700:	00442503          	lw	a0,4(s0)
8000e704:	00000613          	li	a2,0
8000e708:	00400593          	li	a1,4
8000e70c:	e71ff0ef          	jal	ra,8000e57c <std>
8000e710:	00842503          	lw	a0,8(s0)
8000e714:	00100613          	li	a2,1
8000e718:	00900593          	li	a1,9
8000e71c:	e61ff0ef          	jal	ra,8000e57c <std>
8000e720:	00c42503          	lw	a0,12(s0)
8000e724:	00200613          	li	a2,2
8000e728:	01200593          	li	a1,18
8000e72c:	e51ff0ef          	jal	ra,8000e57c <std>
8000e730:	00100793          	li	a5,1
8000e734:	00f42c23          	sw	a5,24(s0)
8000e738:	00c12083          	lw	ra,12(sp)
8000e73c:	00812403          	lw	s0,8(sp)
8000e740:	01010113          	addi	sp,sp,16
8000e744:	00008067          	ret
8000e748:	00008067          	ret

Disassembly of section .text.__sfp:

8000e74c <__sfp>:
8000e74c:	ff010113          	addi	sp,sp,-16
8000e750:	c7018793          	addi	a5,gp,-912 # 800036e0 <_bss_end>
8000e754:	00912223          	sw	s1,4(sp)
8000e758:	0007a483          	lw	s1,0(a5)
8000e75c:	01212023          	sw	s2,0(sp)
8000e760:	00112623          	sw	ra,12(sp)
8000e764:	0184a783          	lw	a5,24(s1)
8000e768:	00812423          	sw	s0,8(sp)
8000e76c:	00050913          	mv	s2,a0
8000e770:	00079663          	bnez	a5,8000e77c <__sfp+0x30>
8000e774:	00048513          	mv	a0,s1
8000e778:	f25ff0ef          	jal	ra,8000e69c <__sinit>
8000e77c:	04848493          	addi	s1,s1,72
8000e780:	0084a403          	lw	s0,8(s1)
8000e784:	0044a783          	lw	a5,4(s1)
8000e788:	fff78793          	addi	a5,a5,-1
8000e78c:	0007da63          	bgez	a5,8000e7a0 <__sfp+0x54>
8000e790:	0004a783          	lw	a5,0(s1)
8000e794:	08078063          	beqz	a5,8000e814 <__sfp+0xc8>
8000e798:	0004a483          	lw	s1,0(s1)
8000e79c:	fe5ff06f          	j	8000e780 <__sfp+0x34>
8000e7a0:	00c41703          	lh	a4,12(s0)
8000e7a4:	06071463          	bnez	a4,8000e80c <__sfp+0xc0>
8000e7a8:	ffff07b7          	lui	a5,0xffff0
8000e7ac:	00178793          	addi	a5,a5,1 # ffff0001 <_ram_heap_end+0x7ffd8001>
8000e7b0:	06042223          	sw	zero,100(s0)
8000e7b4:	00042023          	sw	zero,0(s0)
8000e7b8:	00042223          	sw	zero,4(s0)
8000e7bc:	00042423          	sw	zero,8(s0)
8000e7c0:	00f42623          	sw	a5,12(s0)
8000e7c4:	00042823          	sw	zero,16(s0)
8000e7c8:	00042a23          	sw	zero,20(s0)
8000e7cc:	00042c23          	sw	zero,24(s0)
8000e7d0:	00800613          	li	a2,8
8000e7d4:	00000593          	li	a1,0
8000e7d8:	05c40513          	addi	a0,s0,92
8000e7dc:	d85fe0ef          	jal	ra,8000d560 <memset>
8000e7e0:	02042a23          	sw	zero,52(s0)
8000e7e4:	02042c23          	sw	zero,56(s0)
8000e7e8:	04042423          	sw	zero,72(s0)
8000e7ec:	04042623          	sw	zero,76(s0)
8000e7f0:	00040513          	mv	a0,s0
8000e7f4:	00c12083          	lw	ra,12(sp)
8000e7f8:	00812403          	lw	s0,8(sp)
8000e7fc:	00412483          	lw	s1,4(sp)
8000e800:	00012903          	lw	s2,0(sp)
8000e804:	01010113          	addi	sp,sp,16
8000e808:	00008067          	ret
8000e80c:	06840413          	addi	s0,s0,104
8000e810:	f79ff06f          	j	8000e788 <__sfp+0x3c>
8000e814:	00400593          	li	a1,4
8000e818:	00090513          	mv	a0,s2
8000e81c:	dfdff0ef          	jal	ra,8000e618 <__sfmoreglue>
8000e820:	00a4a023          	sw	a0,0(s1)
8000e824:	00050413          	mv	s0,a0
8000e828:	f60518e3          	bnez	a0,8000e798 <__sfp+0x4c>
8000e82c:	00c00793          	li	a5,12
8000e830:	00f92023          	sw	a5,0(s2)
8000e834:	fbdff06f          	j	8000e7f0 <__sfp+0xa4>

Disassembly of section .text.__sfp_lock_acquire:

8000e838 <__sfp_lock_acquire>:
8000e838:	00008067          	ret

Disassembly of section .text.__sfp_lock_release:

8000e83c <__sfp_lock_release>:
8000e83c:	00008067          	ret

Disassembly of section .text.__sinit_lock_acquire:

8000e840 <__sinit_lock_acquire>:
8000e840:	00008067          	ret

Disassembly of section .text.__sinit_lock_release:

8000e844 <__sinit_lock_release>:
8000e844:	00008067          	ret

Disassembly of section .text.__fp_lock_all:

8000e848 <__fp_lock_all>:
8000e848:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000e84c:	0007a503          	lw	a0,0(a5)
8000e850:	00000597          	auipc	a1,0x0
8000e854:	d2458593          	addi	a1,a1,-732 # 8000e574 <__fp_lock>
8000e858:	1140006f          	j	8000e96c <_fwalk>

Disassembly of section .text.__fp_unlock_all:

8000e85c <__fp_unlock_all>:
8000e85c:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000e860:	0007a503          	lw	a0,0(a5)
8000e864:	00000597          	auipc	a1,0x0
8000e868:	dac58593          	addi	a1,a1,-596 # 8000e610 <__fp_unlock>
8000e86c:	1000006f          	j	8000e96c <_fwalk>

Disassembly of section .text._fpurge_r:

8000e870 <_fpurge_r>:
8000e870:	ff010113          	addi	sp,sp,-16
8000e874:	00812423          	sw	s0,8(sp)
8000e878:	00912223          	sw	s1,4(sp)
8000e87c:	00112623          	sw	ra,12(sp)
8000e880:	00050493          	mv	s1,a0
8000e884:	00058413          	mv	s0,a1
8000e888:	00050863          	beqz	a0,8000e898 <_fpurge_r+0x28>
8000e88c:	01852783          	lw	a5,24(a0)
8000e890:	00079463          	bnez	a5,8000e898 <_fpurge_r+0x28>
8000e894:	e09ff0ef          	jal	ra,8000e69c <__sinit>
8000e898:	ffff4797          	auipc	a5,0xffff4
8000e89c:	7cc78793          	addi	a5,a5,1996 # 80003064 <__sf_fake_stdin>
8000e8a0:	02f41863          	bne	s0,a5,8000e8d0 <_fpurge_r+0x60>
8000e8a4:	0044a403          	lw	s0,4(s1)
8000e8a8:	00c41783          	lh	a5,12(s0)
8000e8ac:	04079663          	bnez	a5,8000e8f8 <_fpurge_r+0x88>
8000e8b0:	00900793          	li	a5,9
8000e8b4:	00f4a023          	sw	a5,0(s1)
8000e8b8:	fff00513          	li	a0,-1
8000e8bc:	00c12083          	lw	ra,12(sp)
8000e8c0:	00812403          	lw	s0,8(sp)
8000e8c4:	00412483          	lw	s1,4(sp)
8000e8c8:	01010113          	addi	sp,sp,16
8000e8cc:	00008067          	ret
8000e8d0:	ffff4797          	auipc	a5,0xffff4
8000e8d4:	7b478793          	addi	a5,a5,1972 # 80003084 <__sf_fake_stdout>
8000e8d8:	00f41663          	bne	s0,a5,8000e8e4 <_fpurge_r+0x74>
8000e8dc:	0084a403          	lw	s0,8(s1)
8000e8e0:	fc9ff06f          	j	8000e8a8 <_fpurge_r+0x38>
8000e8e4:	ffff4797          	auipc	a5,0xffff4
8000e8e8:	76078793          	addi	a5,a5,1888 # 80003044 <__sf_fake_stderr>
8000e8ec:	faf41ee3          	bne	s0,a5,8000e8a8 <_fpurge_r+0x38>
8000e8f0:	00c4a403          	lw	s0,12(s1)
8000e8f4:	fb5ff06f          	j	8000e8a8 <_fpurge_r+0x38>
8000e8f8:	01042703          	lw	a4,16(s0)
8000e8fc:	00e42023          	sw	a4,0(s0)
8000e900:	0087f713          	andi	a4,a5,8
8000e904:	02071863          	bnez	a4,8000e934 <_fpurge_r+0xc4>
8000e908:	03442583          	lw	a1,52(s0)
8000e90c:	00042223          	sw	zero,4(s0)
8000e910:	00000513          	li	a0,0
8000e914:	fa0584e3          	beqz	a1,8000e8bc <_fpurge_r+0x4c>
8000e918:	04440793          	addi	a5,s0,68
8000e91c:	00f58663          	beq	a1,a5,8000e928 <_fpurge_r+0xb8>
8000e920:	00048513          	mv	a0,s1
8000e924:	374000ef          	jal	ra,8000ec98 <_free_r>
8000e928:	02042a23          	sw	zero,52(s0)
8000e92c:	00000513          	li	a0,0
8000e930:	f8dff06f          	j	8000e8bc <_fpurge_r+0x4c>
8000e934:	0037f793          	andi	a5,a5,3
8000e938:	00000713          	li	a4,0
8000e93c:	00079463          	bnez	a5,8000e944 <_fpurge_r+0xd4>
8000e940:	01442703          	lw	a4,20(s0)
8000e944:	00e42423          	sw	a4,8(s0)
8000e948:	fe5ff06f          	j	8000e92c <_fpurge_r+0xbc>

Disassembly of section .text.fpurge:

8000e94c <fpurge>:
8000e94c:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000e950:	00050593          	mv	a1,a0
8000e954:	0007a503          	lw	a0,0(a5)
8000e958:	f19ff06f          	j	8000e870 <_fpurge_r>

Disassembly of section .text.__fpurge:

8000e95c <__fpurge>:
8000e95c:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000e960:	00050593          	mv	a1,a0
8000e964:	0007a503          	lw	a0,0(a5)
8000e968:	f09ff06f          	j	8000e870 <_fpurge_r>

Disassembly of section .text._fwalk:

8000e96c <_fwalk>:
8000e96c:	fd010113          	addi	sp,sp,-48
8000e970:	02812423          	sw	s0,40(sp)
8000e974:	03212023          	sw	s2,32(sp)
8000e978:	01412c23          	sw	s4,24(sp)
8000e97c:	01512a23          	sw	s5,20(sp)
8000e980:	02112623          	sw	ra,44(sp)
8000e984:	02912223          	sw	s1,36(sp)
8000e988:	01312e23          	sw	s3,28(sp)
8000e98c:	04850413          	addi	s0,a0,72
8000e990:	00000913          	li	s2,0
8000e994:	00100a13          	li	s4,1
8000e998:	fff00a93          	li	s5,-1
8000e99c:	02041663          	bnez	s0,8000e9c8 <_fwalk+0x5c>
8000e9a0:	02c12083          	lw	ra,44(sp)
8000e9a4:	02812403          	lw	s0,40(sp)
8000e9a8:	00090513          	mv	a0,s2
8000e9ac:	02412483          	lw	s1,36(sp)
8000e9b0:	02012903          	lw	s2,32(sp)
8000e9b4:	01c12983          	lw	s3,28(sp)
8000e9b8:	01812a03          	lw	s4,24(sp)
8000e9bc:	01412a83          	lw	s5,20(sp)
8000e9c0:	03010113          	addi	sp,sp,48
8000e9c4:	00008067          	ret
8000e9c8:	00842483          	lw	s1,8(s0)
8000e9cc:	00442983          	lw	s3,4(s0)
8000e9d0:	fff98993          	addi	s3,s3,-1
8000e9d4:	0009d663          	bgez	s3,8000e9e0 <_fwalk+0x74>
8000e9d8:	00042403          	lw	s0,0(s0)
8000e9dc:	fc1ff06f          	j	8000e99c <_fwalk+0x30>
8000e9e0:	00c4d783          	lhu	a5,12(s1)
8000e9e4:	02fa7063          	bgeu	s4,a5,8000ea04 <_fwalk+0x98>
8000e9e8:	00e49783          	lh	a5,14(s1)
8000e9ec:	01578c63          	beq	a5,s5,8000ea04 <_fwalk+0x98>
8000e9f0:	00048513          	mv	a0,s1
8000e9f4:	00b12623          	sw	a1,12(sp)
8000e9f8:	000580e7          	jalr	a1
8000e9fc:	00c12583          	lw	a1,12(sp)
8000ea00:	00a96933          	or	s2,s2,a0
8000ea04:	06848493          	addi	s1,s1,104
8000ea08:	fc9ff06f          	j	8000e9d0 <_fwalk+0x64>

Disassembly of section .text._fwalk_reent:

8000ea0c <_fwalk_reent>:
8000ea0c:	fd010113          	addi	sp,sp,-48
8000ea10:	02812423          	sw	s0,40(sp)
8000ea14:	03212023          	sw	s2,32(sp)
8000ea18:	01412c23          	sw	s4,24(sp)
8000ea1c:	01512a23          	sw	s5,20(sp)
8000ea20:	01612823          	sw	s6,16(sp)
8000ea24:	01712623          	sw	s7,12(sp)
8000ea28:	02112623          	sw	ra,44(sp)
8000ea2c:	02912223          	sw	s1,36(sp)
8000ea30:	01312e23          	sw	s3,28(sp)
8000ea34:	00050a13          	mv	s4,a0
8000ea38:	00058a93          	mv	s5,a1
8000ea3c:	04850413          	addi	s0,a0,72
8000ea40:	00000913          	li	s2,0
8000ea44:	00100b13          	li	s6,1
8000ea48:	fff00b93          	li	s7,-1
8000ea4c:	02041a63          	bnez	s0,8000ea80 <_fwalk_reent+0x74>
8000ea50:	02c12083          	lw	ra,44(sp)
8000ea54:	02812403          	lw	s0,40(sp)
8000ea58:	00090513          	mv	a0,s2
8000ea5c:	02412483          	lw	s1,36(sp)
8000ea60:	02012903          	lw	s2,32(sp)
8000ea64:	01c12983          	lw	s3,28(sp)
8000ea68:	01812a03          	lw	s4,24(sp)
8000ea6c:	01412a83          	lw	s5,20(sp)
8000ea70:	01012b03          	lw	s6,16(sp)
8000ea74:	00c12b83          	lw	s7,12(sp)
8000ea78:	03010113          	addi	sp,sp,48
8000ea7c:	00008067          	ret
8000ea80:	00842483          	lw	s1,8(s0)
8000ea84:	00442983          	lw	s3,4(s0)
8000ea88:	fff98993          	addi	s3,s3,-1
8000ea8c:	0009d663          	bgez	s3,8000ea98 <_fwalk_reent+0x8c>
8000ea90:	00042403          	lw	s0,0(s0)
8000ea94:	fb9ff06f          	j	8000ea4c <_fwalk_reent+0x40>
8000ea98:	00c4d783          	lhu	a5,12(s1)
8000ea9c:	00fb7e63          	bgeu	s6,a5,8000eab8 <_fwalk_reent+0xac>
8000eaa0:	00e49783          	lh	a5,14(s1)
8000eaa4:	01778a63          	beq	a5,s7,8000eab8 <_fwalk_reent+0xac>
8000eaa8:	00048593          	mv	a1,s1
8000eaac:	000a0513          	mv	a0,s4
8000eab0:	000a80e7          	jalr	s5
8000eab4:	00a96933          	or	s2,s2,a0
8000eab8:	06848493          	addi	s1,s1,104
8000eabc:	fcdff06f          	j	8000ea88 <_fwalk_reent+0x7c>

Disassembly of section .text.malloc:

8000eac0 <malloc>:
8000eac0:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000eac4:	00050593          	mv	a1,a0
8000eac8:	0007a503          	lw	a0,0(a5)
8000eacc:	2d00006f          	j	8000ed9c <_malloc_r>

Disassembly of section .text.free:

8000ead0 <free>:
8000ead0:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000ead4:	00050593          	mv	a1,a0
8000ead8:	0007a503          	lw	a0,0(a5)
8000eadc:	1bc0006f          	j	8000ec98 <_free_r>

Disassembly of section .text.memcmp:

8000eae0 <memcmp>:
8000eae0:	00000713          	li	a4,0
8000eae4:	00e61663          	bne	a2,a4,8000eaf0 <memcmp+0x10>
8000eae8:	00000513          	li	a0,0
8000eaec:	00008067          	ret
8000eaf0:	00e507b3          	add	a5,a0,a4
8000eaf4:	00170713          	addi	a4,a4,1
8000eaf8:	00e586b3          	add	a3,a1,a4
8000eafc:	0007c783          	lbu	a5,0(a5)
8000eb00:	fff6c683          	lbu	a3,-1(a3)
8000eb04:	fed780e3          	beq	a5,a3,8000eae4 <memcmp+0x4>
8000eb08:	40d78533          	sub	a0,a5,a3
8000eb0c:	00008067          	ret

Disassembly of section .text.memcpy:

8000eb10 <memcpy>:
8000eb10:	00a5c7b3          	xor	a5,a1,a0
8000eb14:	0037f793          	andi	a5,a5,3
8000eb18:	00c50733          	add	a4,a0,a2
8000eb1c:	00079663          	bnez	a5,8000eb28 <memcpy+0x18>
8000eb20:	00300793          	li	a5,3
8000eb24:	02c7e263          	bltu	a5,a2,8000eb48 <memcpy+0x38>
8000eb28:	00050793          	mv	a5,a0
8000eb2c:	0ae57c63          	bgeu	a0,a4,8000ebe4 <memcpy+0xd4>
8000eb30:	0005c683          	lbu	a3,0(a1)
8000eb34:	00178793          	addi	a5,a5,1
8000eb38:	00158593          	addi	a1,a1,1
8000eb3c:	fed78fa3          	sb	a3,-1(a5)
8000eb40:	fee7e8e3          	bltu	a5,a4,8000eb30 <memcpy+0x20>
8000eb44:	00008067          	ret
8000eb48:	00357693          	andi	a3,a0,3
8000eb4c:	00050793          	mv	a5,a0
8000eb50:	00068e63          	beqz	a3,8000eb6c <memcpy+0x5c>
8000eb54:	0005c683          	lbu	a3,0(a1)
8000eb58:	00178793          	addi	a5,a5,1
8000eb5c:	00158593          	addi	a1,a1,1
8000eb60:	fed78fa3          	sb	a3,-1(a5)
8000eb64:	0037f693          	andi	a3,a5,3
8000eb68:	fe9ff06f          	j	8000eb50 <memcpy+0x40>
8000eb6c:	ffc77693          	andi	a3,a4,-4
8000eb70:	fe068613          	addi	a2,a3,-32
8000eb74:	06c7f463          	bgeu	a5,a2,8000ebdc <memcpy+0xcc>
8000eb78:	0005a383          	lw	t2,0(a1)
8000eb7c:	0045a283          	lw	t0,4(a1)
8000eb80:	0085af83          	lw	t6,8(a1)
8000eb84:	00c5af03          	lw	t5,12(a1)
8000eb88:	0105ae83          	lw	t4,16(a1)
8000eb8c:	0145ae03          	lw	t3,20(a1)
8000eb90:	0185a303          	lw	t1,24(a1)
8000eb94:	01c5a883          	lw	a7,28(a1)
8000eb98:	02458593          	addi	a1,a1,36
8000eb9c:	0077a023          	sw	t2,0(a5)
8000eba0:	ffc5a803          	lw	a6,-4(a1)
8000eba4:	0057a223          	sw	t0,4(a5)
8000eba8:	01f7a423          	sw	t6,8(a5)
8000ebac:	01e7a623          	sw	t5,12(a5)
8000ebb0:	01d7a823          	sw	t4,16(a5)
8000ebb4:	01c7aa23          	sw	t3,20(a5)
8000ebb8:	0067ac23          	sw	t1,24(a5)
8000ebbc:	0117ae23          	sw	a7,28(a5)
8000ebc0:	02478793          	addi	a5,a5,36
8000ebc4:	ff07ae23          	sw	a6,-4(a5)
8000ebc8:	fadff06f          	j	8000eb74 <memcpy+0x64>
8000ebcc:	0005a603          	lw	a2,0(a1)
8000ebd0:	00478793          	addi	a5,a5,4
8000ebd4:	00458593          	addi	a1,a1,4
8000ebd8:	fec7ae23          	sw	a2,-4(a5)
8000ebdc:	fed7e8e3          	bltu	a5,a3,8000ebcc <memcpy+0xbc>
8000ebe0:	f4e7e8e3          	bltu	a5,a4,8000eb30 <memcpy+0x20>
8000ebe4:	00008067          	ret

Disassembly of section .text.memmove:

8000ebe8 <memmove>:
8000ebe8:	04a5fa63          	bgeu	a1,a0,8000ec3c <memmove+0x54>
8000ebec:	00c586b3          	add	a3,a1,a2
8000ebf0:	04d57663          	bgeu	a0,a3,8000ec3c <memmove+0x54>
8000ebf4:	fff64593          	not	a1,a2
8000ebf8:	00000793          	li	a5,0
8000ebfc:	fff78793          	addi	a5,a5,-1
8000ec00:	00f59463          	bne	a1,a5,8000ec08 <memmove+0x20>
8000ec04:	00008067          	ret
8000ec08:	00f68733          	add	a4,a3,a5
8000ec0c:	00074803          	lbu	a6,0(a4)
8000ec10:	00c78733          	add	a4,a5,a2
8000ec14:	00e50733          	add	a4,a0,a4
8000ec18:	01070023          	sb	a6,0(a4)
8000ec1c:	fe1ff06f          	j	8000ebfc <memmove+0x14>
8000ec20:	00f58733          	add	a4,a1,a5
8000ec24:	00074683          	lbu	a3,0(a4)
8000ec28:	00f50733          	add	a4,a0,a5
8000ec2c:	00178793          	addi	a5,a5,1
8000ec30:	00d70023          	sb	a3,0(a4)
8000ec34:	fef616e3          	bne	a2,a5,8000ec20 <memmove+0x38>
8000ec38:	00008067          	ret
8000ec3c:	00000793          	li	a5,0
8000ec40:	ff5ff06f          	j	8000ec34 <memmove+0x4c>

Disassembly of section .text._calloc_r:

8000ec44 <_calloc_r>:
8000ec44:	fe010113          	addi	sp,sp,-32
8000ec48:	00812c23          	sw	s0,24(sp)
8000ec4c:	00050413          	mv	s0,a0
8000ec50:	00058513          	mv	a0,a1
8000ec54:	00060593          	mv	a1,a2
8000ec58:	00112e23          	sw	ra,28(sp)
8000ec5c:	fe9fe0ef          	jal	ra,8000dc44 <__mulsi3>
8000ec60:	00050593          	mv	a1,a0
8000ec64:	00a12623          	sw	a0,12(sp)
8000ec68:	00040513          	mv	a0,s0
8000ec6c:	130000ef          	jal	ra,8000ed9c <_malloc_r>
8000ec70:	00050413          	mv	s0,a0
8000ec74:	00050863          	beqz	a0,8000ec84 <_calloc_r+0x40>
8000ec78:	00c12603          	lw	a2,12(sp)
8000ec7c:	00000593          	li	a1,0
8000ec80:	8e1fe0ef          	jal	ra,8000d560 <memset>
8000ec84:	00040513          	mv	a0,s0
8000ec88:	01c12083          	lw	ra,28(sp)
8000ec8c:	01812403          	lw	s0,24(sp)
8000ec90:	02010113          	addi	sp,sp,32
8000ec94:	00008067          	ret

Disassembly of section .text._free_r:

8000ec98 <_free_r>:
8000ec98:	10058063          	beqz	a1,8000ed98 <_free_r+0x100>
8000ec9c:	ffc5a783          	lw	a5,-4(a1)
8000eca0:	ff010113          	addi	sp,sp,-16
8000eca4:	00812423          	sw	s0,8(sp)
8000eca8:	00112623          	sw	ra,12(sp)
8000ecac:	00912223          	sw	s1,4(sp)
8000ecb0:	ffc58413          	addi	s0,a1,-4
8000ecb4:	0007d463          	bgez	a5,8000ecbc <_free_r+0x24>
8000ecb8:	00f40433          	add	s0,s0,a5
8000ecbc:	00050493          	mv	s1,a0
8000ecc0:	fc8f70ef          	jal	ra,80006488 <__malloc_lock>
8000ecc4:	91c18793          	addi	a5,gp,-1764 # 8000338c <__malloc_free_list>
8000ecc8:	0007a783          	lw	a5,0(a5)
8000eccc:	02079263          	bnez	a5,8000ecf0 <_free_r+0x58>
8000ecd0:	00042223          	sw	zero,4(s0)
8000ecd4:	9081ae23          	sw	s0,-1764(gp) # 8000338c <__malloc_free_list>
8000ecd8:	00812403          	lw	s0,8(sp)
8000ecdc:	00c12083          	lw	ra,12(sp)
8000ece0:	00048513          	mv	a0,s1
8000ece4:	00412483          	lw	s1,4(sp)
8000ece8:	01010113          	addi	sp,sp,16
8000ecec:	fa0f706f          	j	8000648c <__malloc_unlock>
8000ecf0:	02f47663          	bgeu	s0,a5,8000ed1c <_free_r+0x84>
8000ecf4:	00042683          	lw	a3,0(s0)
8000ecf8:	00d40733          	add	a4,s0,a3
8000ecfc:	00e79a63          	bne	a5,a4,8000ed10 <_free_r+0x78>
8000ed00:	0007a703          	lw	a4,0(a5)
8000ed04:	0047a783          	lw	a5,4(a5)
8000ed08:	00d70733          	add	a4,a4,a3
8000ed0c:	00e42023          	sw	a4,0(s0)
8000ed10:	00f42223          	sw	a5,4(s0)
8000ed14:	fc1ff06f          	j	8000ecd4 <_free_r+0x3c>
8000ed18:	00070793          	mv	a5,a4
8000ed1c:	0047a703          	lw	a4,4(a5)
8000ed20:	00070463          	beqz	a4,8000ed28 <_free_r+0x90>
8000ed24:	fee47ae3          	bgeu	s0,a4,8000ed18 <_free_r+0x80>
8000ed28:	0007a683          	lw	a3,0(a5)
8000ed2c:	00d78633          	add	a2,a5,a3
8000ed30:	02861863          	bne	a2,s0,8000ed60 <_free_r+0xc8>
8000ed34:	00042603          	lw	a2,0(s0)
8000ed38:	00c686b3          	add	a3,a3,a2
8000ed3c:	00d7a023          	sw	a3,0(a5)
8000ed40:	00d78633          	add	a2,a5,a3
8000ed44:	f8c71ae3          	bne	a4,a2,8000ecd8 <_free_r+0x40>
8000ed48:	00072603          	lw	a2,0(a4)
8000ed4c:	00472703          	lw	a4,4(a4)
8000ed50:	00d606b3          	add	a3,a2,a3
8000ed54:	00d7a023          	sw	a3,0(a5)
8000ed58:	00e7a223          	sw	a4,4(a5)
8000ed5c:	f7dff06f          	j	8000ecd8 <_free_r+0x40>
8000ed60:	00c47863          	bgeu	s0,a2,8000ed70 <_free_r+0xd8>
8000ed64:	00c00793          	li	a5,12
8000ed68:	00f4a023          	sw	a5,0(s1)
8000ed6c:	f6dff06f          	j	8000ecd8 <_free_r+0x40>
8000ed70:	00042603          	lw	a2,0(s0)
8000ed74:	00c406b3          	add	a3,s0,a2
8000ed78:	00d71a63          	bne	a4,a3,8000ed8c <_free_r+0xf4>
8000ed7c:	00072683          	lw	a3,0(a4)
8000ed80:	00472703          	lw	a4,4(a4)
8000ed84:	00c686b3          	add	a3,a3,a2
8000ed88:	00d42023          	sw	a3,0(s0)
8000ed8c:	00e42223          	sw	a4,4(s0)
8000ed90:	0087a223          	sw	s0,4(a5)
8000ed94:	f45ff06f          	j	8000ecd8 <_free_r+0x40>
8000ed98:	00008067          	ret

Disassembly of section .text._malloc_r:

8000ed9c <_malloc_r>:
8000ed9c:	fe010113          	addi	sp,sp,-32
8000eda0:	00912a23          	sw	s1,20(sp)
8000eda4:	00358493          	addi	s1,a1,3
8000eda8:	ffc4f493          	andi	s1,s1,-4
8000edac:	00112e23          	sw	ra,28(sp)
8000edb0:	00812c23          	sw	s0,24(sp)
8000edb4:	01212823          	sw	s2,16(sp)
8000edb8:	01312623          	sw	s3,12(sp)
8000edbc:	00848493          	addi	s1,s1,8
8000edc0:	00c00793          	li	a5,12
8000edc4:	06f4f463          	bgeu	s1,a5,8000ee2c <_malloc_r+0x90>
8000edc8:	00c00493          	li	s1,12
8000edcc:	06b4e263          	bltu	s1,a1,8000ee30 <_malloc_r+0x94>
8000edd0:	00050913          	mv	s2,a0
8000edd4:	eb4f70ef          	jal	ra,80006488 <__malloc_lock>
8000edd8:	91c18793          	addi	a5,gp,-1764 # 8000338c <__malloc_free_list>
8000eddc:	0007a703          	lw	a4,0(a5)
8000ede0:	00070413          	mv	s0,a4
8000ede4:	06041a63          	bnez	s0,8000ee58 <_malloc_r+0xbc>
8000ede8:	92018793          	addi	a5,gp,-1760 # 80003390 <__malloc_sbrk_start>
8000edec:	0007a783          	lw	a5,0(a5)
8000edf0:	00079a63          	bnez	a5,8000ee04 <_malloc_r+0x68>
8000edf4:	00000593          	li	a1,0
8000edf8:	00090513          	mv	a0,s2
8000edfc:	330000ef          	jal	ra,8000f12c <_sbrk_r>
8000ee00:	92a1a023          	sw	a0,-1760(gp) # 80003390 <__malloc_sbrk_start>
8000ee04:	00048593          	mv	a1,s1
8000ee08:	00090513          	mv	a0,s2
8000ee0c:	320000ef          	jal	ra,8000f12c <_sbrk_r>
8000ee10:	fff00993          	li	s3,-1
8000ee14:	0b351a63          	bne	a0,s3,8000eec8 <_malloc_r+0x12c>
8000ee18:	00c00793          	li	a5,12
8000ee1c:	00f92023          	sw	a5,0(s2)
8000ee20:	00090513          	mv	a0,s2
8000ee24:	e68f70ef          	jal	ra,8000648c <__malloc_unlock>
8000ee28:	0100006f          	j	8000ee38 <_malloc_r+0x9c>
8000ee2c:	fa04d0e3          	bgez	s1,8000edcc <_malloc_r+0x30>
8000ee30:	00c00793          	li	a5,12
8000ee34:	00f52023          	sw	a5,0(a0)
8000ee38:	00000513          	li	a0,0
8000ee3c:	01c12083          	lw	ra,28(sp)
8000ee40:	01812403          	lw	s0,24(sp)
8000ee44:	01412483          	lw	s1,20(sp)
8000ee48:	01012903          	lw	s2,16(sp)
8000ee4c:	00c12983          	lw	s3,12(sp)
8000ee50:	02010113          	addi	sp,sp,32
8000ee54:	00008067          	ret
8000ee58:	00042783          	lw	a5,0(s0)
8000ee5c:	409787b3          	sub	a5,a5,s1
8000ee60:	0407ce63          	bltz	a5,8000eebc <_malloc_r+0x120>
8000ee64:	00b00693          	li	a3,11
8000ee68:	00f6fa63          	bgeu	a3,a5,8000ee7c <_malloc_r+0xe0>
8000ee6c:	00f42023          	sw	a5,0(s0)
8000ee70:	00f40433          	add	s0,s0,a5
8000ee74:	00942023          	sw	s1,0(s0)
8000ee78:	0100006f          	j	8000ee88 <_malloc_r+0xec>
8000ee7c:	00442783          	lw	a5,4(s0)
8000ee80:	02871a63          	bne	a4,s0,8000eeb4 <_malloc_r+0x118>
8000ee84:	90f1ae23          	sw	a5,-1764(gp) # 8000338c <__malloc_free_list>
8000ee88:	00090513          	mv	a0,s2
8000ee8c:	e00f70ef          	jal	ra,8000648c <__malloc_unlock>
8000ee90:	00b40513          	addi	a0,s0,11
8000ee94:	00440793          	addi	a5,s0,4
8000ee98:	ff857513          	andi	a0,a0,-8
8000ee9c:	40f50733          	sub	a4,a0,a5
8000eea0:	f8070ee3          	beqz	a4,8000ee3c <_malloc_r+0xa0>
8000eea4:	00e40433          	add	s0,s0,a4
8000eea8:	40a787b3          	sub	a5,a5,a0
8000eeac:	00f42023          	sw	a5,0(s0)
8000eeb0:	f8dff06f          	j	8000ee3c <_malloc_r+0xa0>
8000eeb4:	00f72223          	sw	a5,4(a4)
8000eeb8:	fd1ff06f          	j	8000ee88 <_malloc_r+0xec>
8000eebc:	00040713          	mv	a4,s0
8000eec0:	00442403          	lw	s0,4(s0)
8000eec4:	f21ff06f          	j	8000ede4 <_malloc_r+0x48>
8000eec8:	00350413          	addi	s0,a0,3
8000eecc:	ffc47413          	andi	s0,s0,-4
8000eed0:	fa8502e3          	beq	a0,s0,8000ee74 <_malloc_r+0xd8>
8000eed4:	40a405b3          	sub	a1,s0,a0
8000eed8:	00090513          	mv	a0,s2
8000eedc:	250000ef          	jal	ra,8000f12c <_sbrk_r>
8000eee0:	f9351ae3          	bne	a0,s3,8000ee74 <_malloc_r+0xd8>
8000eee4:	f35ff06f          	j	8000ee18 <_malloc_r+0x7c>

Disassembly of section .text._printf_r:

8000eee8 <_iprintf_r>:
8000eee8:	fb010113          	addi	sp,sp,-80
8000eeec:	02812423          	sw	s0,40(sp)
8000eef0:	02112623          	sw	ra,44(sp)
8000eef4:	02c12c23          	sw	a2,56(sp)
8000eef8:	02d12e23          	sw	a3,60(sp)
8000eefc:	04e12023          	sw	a4,64(sp)
8000ef00:	04f12223          	sw	a5,68(sp)
8000ef04:	05012423          	sw	a6,72(sp)
8000ef08:	05112623          	sw	a7,76(sp)
8000ef0c:	00050413          	mv	s0,a0
8000ef10:	00050c63          	beqz	a0,8000ef28 <_iprintf_r+0x40>
8000ef14:	01852783          	lw	a5,24(a0)
8000ef18:	00079863          	bnez	a5,8000ef28 <_iprintf_r+0x40>
8000ef1c:	00b12623          	sw	a1,12(sp)
8000ef20:	f7cff0ef          	jal	ra,8000e69c <__sinit>
8000ef24:	00c12583          	lw	a1,12(sp)
8000ef28:	00058613          	mv	a2,a1
8000ef2c:	00842583          	lw	a1,8(s0)
8000ef30:	03810693          	addi	a3,sp,56
8000ef34:	00040513          	mv	a0,s0
8000ef38:	00d12e23          	sw	a3,28(sp)
8000ef3c:	2b5010ef          	jal	ra,800109f0 <_vfiprintf_r>
8000ef40:	02c12083          	lw	ra,44(sp)
8000ef44:	02812403          	lw	s0,40(sp)
8000ef48:	05010113          	addi	sp,sp,80
8000ef4c:	00008067          	ret

Disassembly of section .text.printf:

8000ef50 <iprintf>:
8000ef50:	fc010113          	addi	sp,sp,-64
8000ef54:	02f12a23          	sw	a5,52(sp)
8000ef58:	02b12223          	sw	a1,36(sp)
8000ef5c:	02c12423          	sw	a2,40(sp)
8000ef60:	02d12623          	sw	a3,44(sp)
8000ef64:	02e12823          	sw	a4,48(sp)
8000ef68:	03012c23          	sw	a6,56(sp)
8000ef6c:	03112e23          	sw	a7,60(sp)
8000ef70:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000ef74:	00812c23          	sw	s0,24(sp)
8000ef78:	0007a403          	lw	s0,0(a5)
8000ef7c:	00912a23          	sw	s1,20(sp)
8000ef80:	00112e23          	sw	ra,28(sp)
8000ef84:	00050493          	mv	s1,a0
8000ef88:	00040a63          	beqz	s0,8000ef9c <iprintf+0x4c>
8000ef8c:	01842783          	lw	a5,24(s0)
8000ef90:	00079663          	bnez	a5,8000ef9c <iprintf+0x4c>
8000ef94:	00040513          	mv	a0,s0
8000ef98:	f04ff0ef          	jal	ra,8000e69c <__sinit>
8000ef9c:	00842583          	lw	a1,8(s0)
8000efa0:	02410693          	addi	a3,sp,36
8000efa4:	00048613          	mv	a2,s1
8000efa8:	00040513          	mv	a0,s0
8000efac:	00d12623          	sw	a3,12(sp)
8000efb0:	241010ef          	jal	ra,800109f0 <_vfiprintf_r>
8000efb4:	01c12083          	lw	ra,28(sp)
8000efb8:	01812403          	lw	s0,24(sp)
8000efbc:	01412483          	lw	s1,20(sp)
8000efc0:	04010113          	addi	sp,sp,64
8000efc4:	00008067          	ret

Disassembly of section .text._putchar_r:

8000efc8 <_putchar_r>:
8000efc8:	fe010113          	addi	sp,sp,-32
8000efcc:	00812c23          	sw	s0,24(sp)
8000efd0:	00112e23          	sw	ra,28(sp)
8000efd4:	00050413          	mv	s0,a0
8000efd8:	00050c63          	beqz	a0,8000eff0 <_putchar_r+0x28>
8000efdc:	01852783          	lw	a5,24(a0)
8000efe0:	00079863          	bnez	a5,8000eff0 <_putchar_r+0x28>
8000efe4:	00b12623          	sw	a1,12(sp)
8000efe8:	eb4ff0ef          	jal	ra,8000e69c <__sinit>
8000efec:	00c12583          	lw	a1,12(sp)
8000eff0:	00842603          	lw	a2,8(s0)
8000eff4:	00040513          	mv	a0,s0
8000eff8:	01812403          	lw	s0,24(sp)
8000effc:	01c12083          	lw	ra,28(sp)
8000f000:	02010113          	addi	sp,sp,32
8000f004:	0500006f          	j	8000f054 <_putc_r>

Disassembly of section .text.putchar:

8000f008 <putchar>:
8000f008:	fe010113          	addi	sp,sp,-32
8000f00c:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000f010:	00812c23          	sw	s0,24(sp)
8000f014:	0007a403          	lw	s0,0(a5)
8000f018:	00112e23          	sw	ra,28(sp)
8000f01c:	00050593          	mv	a1,a0
8000f020:	00040e63          	beqz	s0,8000f03c <putchar+0x34>
8000f024:	01842783          	lw	a5,24(s0)
8000f028:	00079a63          	bnez	a5,8000f03c <putchar+0x34>
8000f02c:	00a12623          	sw	a0,12(sp)
8000f030:	00040513          	mv	a0,s0
8000f034:	e68ff0ef          	jal	ra,8000e69c <__sinit>
8000f038:	00c12583          	lw	a1,12(sp)
8000f03c:	00842603          	lw	a2,8(s0)
8000f040:	00040513          	mv	a0,s0
8000f044:	01812403          	lw	s0,24(sp)
8000f048:	01c12083          	lw	ra,28(sp)
8000f04c:	02010113          	addi	sp,sp,32
8000f050:	0040006f          	j	8000f054 <_putc_r>

Disassembly of section .text._putc_r:

8000f054 <_putc_r>:
8000f054:	fe010113          	addi	sp,sp,-32
8000f058:	00812c23          	sw	s0,24(sp)
8000f05c:	00112e23          	sw	ra,28(sp)
8000f060:	00050413          	mv	s0,a0
8000f064:	02050063          	beqz	a0,8000f084 <_putc_r+0x30>
8000f068:	01852783          	lw	a5,24(a0)
8000f06c:	00079c63          	bnez	a5,8000f084 <_putc_r+0x30>
8000f070:	00c12623          	sw	a2,12(sp)
8000f074:	00b12423          	sw	a1,8(sp)
8000f078:	e24ff0ef          	jal	ra,8000e69c <__sinit>
8000f07c:	00c12603          	lw	a2,12(sp)
8000f080:	00812583          	lw	a1,8(sp)
8000f084:	ffff4797          	auipc	a5,0xffff4
8000f088:	fe078793          	addi	a5,a5,-32 # 80003064 <__sf_fake_stdin>
8000f08c:	04f61063          	bne	a2,a5,8000f0cc <_putc_r+0x78>
8000f090:	00442603          	lw	a2,4(s0)
8000f094:	00862783          	lw	a5,8(a2)
8000f098:	fff78793          	addi	a5,a5,-1
8000f09c:	00f62423          	sw	a5,8(a2)
8000f0a0:	0407da63          	bgez	a5,8000f0f4 <_putc_r+0xa0>
8000f0a4:	01862703          	lw	a4,24(a2)
8000f0a8:	00e7c863          	blt	a5,a4,8000f0b8 <_putc_r+0x64>
8000f0ac:	0ff5f793          	andi	a5,a1,255
8000f0b0:	00a00713          	li	a4,10
8000f0b4:	04e79063          	bne	a5,a4,8000f0f4 <_putc_r+0xa0>
8000f0b8:	00040513          	mv	a0,s0
8000f0bc:	01812403          	lw	s0,24(sp)
8000f0c0:	01c12083          	lw	ra,28(sp)
8000f0c4:	02010113          	addi	sp,sp,32
8000f0c8:	6bc0006f          	j	8000f784 <__swbuf_r>
8000f0cc:	ffff4797          	auipc	a5,0xffff4
8000f0d0:	fb878793          	addi	a5,a5,-72 # 80003084 <__sf_fake_stdout>
8000f0d4:	00f61663          	bne	a2,a5,8000f0e0 <_putc_r+0x8c>
8000f0d8:	00842603          	lw	a2,8(s0)
8000f0dc:	fb9ff06f          	j	8000f094 <_putc_r+0x40>
8000f0e0:	ffff4797          	auipc	a5,0xffff4
8000f0e4:	f6478793          	addi	a5,a5,-156 # 80003044 <__sf_fake_stderr>
8000f0e8:	faf616e3          	bne	a2,a5,8000f094 <_putc_r+0x40>
8000f0ec:	00c42603          	lw	a2,12(s0)
8000f0f0:	fa5ff06f          	j	8000f094 <_putc_r+0x40>
8000f0f4:	00062783          	lw	a5,0(a2)
8000f0f8:	0ff5f513          	andi	a0,a1,255
8000f0fc:	00178713          	addi	a4,a5,1
8000f100:	00e62023          	sw	a4,0(a2)
8000f104:	00b78023          	sb	a1,0(a5)
8000f108:	01c12083          	lw	ra,28(sp)
8000f10c:	01812403          	lw	s0,24(sp)
8000f110:	02010113          	addi	sp,sp,32
8000f114:	00008067          	ret

Disassembly of section .text.putc:

8000f118 <putc>:
8000f118:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000f11c:	00058613          	mv	a2,a1
8000f120:	00050593          	mv	a1,a0
8000f124:	0007a503          	lw	a0,0(a5)
8000f128:	f2dff06f          	j	8000f054 <_putc_r>

Disassembly of section .text._sbrk_r:

8000f12c <_sbrk_r>:
8000f12c:	ff010113          	addi	sp,sp,-16
8000f130:	00812423          	sw	s0,8(sp)
8000f134:	00050413          	mv	s0,a0
8000f138:	00058513          	mv	a0,a1
8000f13c:	c601a623          	sw	zero,-916(gp) # 800036dc <errno>
8000f140:	00112623          	sw	ra,12(sp)
8000f144:	bfcf70ef          	jal	ra,80006540 <_sbrk>
8000f148:	fff00793          	li	a5,-1
8000f14c:	00f51a63          	bne	a0,a5,8000f160 <_sbrk_r+0x34>
8000f150:	c6c18793          	addi	a5,gp,-916 # 800036dc <errno>
8000f154:	0007a783          	lw	a5,0(a5)
8000f158:	00078463          	beqz	a5,8000f160 <_sbrk_r+0x34>
8000f15c:	00f42023          	sw	a5,0(s0)
8000f160:	00c12083          	lw	ra,12(sp)
8000f164:	00812403          	lw	s0,8(sp)
8000f168:	01010113          	addi	sp,sp,16
8000f16c:	00008067          	ret

Disassembly of section .text._snprintf_r:

8000f170 <_sniprintf_r>:
8000f170:	f7010113          	addi	sp,sp,-144
8000f174:	06112e23          	sw	ra,124(sp)
8000f178:	06812c23          	sw	s0,120(sp)
8000f17c:	06912a23          	sw	s1,116(sp)
8000f180:	07212823          	sw	s2,112(sp)
8000f184:	08e12023          	sw	a4,128(sp)
8000f188:	08f12223          	sw	a5,132(sp)
8000f18c:	09012423          	sw	a6,136(sp)
8000f190:	09112623          	sw	a7,140(sp)
8000f194:	02065463          	bgez	a2,8000f1bc <_sniprintf_r+0x4c>
8000f198:	08b00793          	li	a5,139
8000f19c:	00f52023          	sw	a5,0(a0)
8000f1a0:	fff00513          	li	a0,-1
8000f1a4:	07c12083          	lw	ra,124(sp)
8000f1a8:	07812403          	lw	s0,120(sp)
8000f1ac:	07412483          	lw	s1,116(sp)
8000f1b0:	07012903          	lw	s2,112(sp)
8000f1b4:	09010113          	addi	sp,sp,144
8000f1b8:	00008067          	ret
8000f1bc:	20800793          	li	a5,520
8000f1c0:	00f11a23          	sh	a5,20(sp)
8000f1c4:	00b12423          	sw	a1,8(sp)
8000f1c8:	00b12c23          	sw	a1,24(sp)
8000f1cc:	00060413          	mv	s0,a2
8000f1d0:	00000793          	li	a5,0
8000f1d4:	00060463          	beqz	a2,8000f1dc <_sniprintf_r+0x6c>
8000f1d8:	fff60793          	addi	a5,a2,-1
8000f1dc:	fff00913          	li	s2,-1
8000f1e0:	00068613          	mv	a2,a3
8000f1e4:	00810593          	addi	a1,sp,8
8000f1e8:	08010693          	addi	a3,sp,128
8000f1ec:	00050493          	mv	s1,a0
8000f1f0:	00f12823          	sw	a5,16(sp)
8000f1f4:	00f12e23          	sw	a5,28(sp)
8000f1f8:	01211b23          	sh	s2,22(sp)
8000f1fc:	00d12223          	sw	a3,4(sp)
8000f200:	5cd000ef          	jal	ra,8000ffcc <_svfiprintf_r>
8000f204:	01255663          	bge	a0,s2,8000f210 <_sniprintf_r+0xa0>
8000f208:	08b00793          	li	a5,139
8000f20c:	00f4a023          	sw	a5,0(s1)
8000f210:	f8040ae3          	beqz	s0,8000f1a4 <_sniprintf_r+0x34>
8000f214:	00812783          	lw	a5,8(sp)
8000f218:	00078023          	sb	zero,0(a5)
8000f21c:	f89ff06f          	j	8000f1a4 <_sniprintf_r+0x34>

Disassembly of section .text.snprintf:

8000f220 <sniprintf>:
8000f220:	f6010113          	addi	sp,sp,-160
8000f224:	08f12a23          	sw	a5,148(sp)
8000f228:	06912a23          	sw	s1,116(sp)
8000f22c:	08d12623          	sw	a3,140(sp)
8000f230:	08e12823          	sw	a4,144(sp)
8000f234:	09012c23          	sw	a6,152(sp)
8000f238:	09112e23          	sw	a7,156(sp)
8000f23c:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000f240:	06112e23          	sw	ra,124(sp)
8000f244:	06812c23          	sw	s0,120(sp)
8000f248:	07212823          	sw	s2,112(sp)
8000f24c:	0007a483          	lw	s1,0(a5)
8000f250:	0205d463          	bgez	a1,8000f278 <sniprintf+0x58>
8000f254:	08b00793          	li	a5,139
8000f258:	00f4a023          	sw	a5,0(s1)
8000f25c:	fff00513          	li	a0,-1
8000f260:	07c12083          	lw	ra,124(sp)
8000f264:	07812403          	lw	s0,120(sp)
8000f268:	07412483          	lw	s1,116(sp)
8000f26c:	07012903          	lw	s2,112(sp)
8000f270:	0a010113          	addi	sp,sp,160
8000f274:	00008067          	ret
8000f278:	20800793          	li	a5,520
8000f27c:	00f11a23          	sh	a5,20(sp)
8000f280:	00a12423          	sw	a0,8(sp)
8000f284:	00a12c23          	sw	a0,24(sp)
8000f288:	00000793          	li	a5,0
8000f28c:	00058463          	beqz	a1,8000f294 <sniprintf+0x74>
8000f290:	fff58793          	addi	a5,a1,-1
8000f294:	fff00913          	li	s2,-1
8000f298:	00058413          	mv	s0,a1
8000f29c:	08c10693          	addi	a3,sp,140
8000f2a0:	00810593          	addi	a1,sp,8
8000f2a4:	00048513          	mv	a0,s1
8000f2a8:	00f12823          	sw	a5,16(sp)
8000f2ac:	00f12e23          	sw	a5,28(sp)
8000f2b0:	01211b23          	sh	s2,22(sp)
8000f2b4:	00d12223          	sw	a3,4(sp)
8000f2b8:	515000ef          	jal	ra,8000ffcc <_svfiprintf_r>
8000f2bc:	01255663          	bge	a0,s2,8000f2c8 <sniprintf+0xa8>
8000f2c0:	08b00793          	li	a5,139
8000f2c4:	00f4a023          	sw	a5,0(s1)
8000f2c8:	f8040ce3          	beqz	s0,8000f260 <sniprintf+0x40>
8000f2cc:	00812783          	lw	a5,8(sp)
8000f2d0:	00078023          	sb	zero,0(a5)
8000f2d4:	f8dff06f          	j	8000f260 <sniprintf+0x40>

Disassembly of section .text._sprintf_r:

8000f2d8 <_siprintf_r>:
8000f2d8:	f6010113          	addi	sp,sp,-160
8000f2dc:	08f12a23          	sw	a5,148(sp)
8000f2e0:	800007b7          	lui	a5,0x80000
8000f2e4:	fff7c793          	not	a5,a5
8000f2e8:	00f12e23          	sw	a5,28(sp)
8000f2ec:	00f12823          	sw	a5,16(sp)
8000f2f0:	ffff07b7          	lui	a5,0xffff0
8000f2f4:	08d12623          	sw	a3,140(sp)
8000f2f8:	00b12423          	sw	a1,8(sp)
8000f2fc:	00b12c23          	sw	a1,24(sp)
8000f300:	20878793          	addi	a5,a5,520 # ffff0208 <_ram_heap_end+0x7ffd8208>
8000f304:	08c10693          	addi	a3,sp,140
8000f308:	00810593          	addi	a1,sp,8
8000f30c:	06112e23          	sw	ra,124(sp)
8000f310:	00f12a23          	sw	a5,20(sp)
8000f314:	08e12823          	sw	a4,144(sp)
8000f318:	09012c23          	sw	a6,152(sp)
8000f31c:	09112e23          	sw	a7,156(sp)
8000f320:	00d12223          	sw	a3,4(sp)
8000f324:	4a9000ef          	jal	ra,8000ffcc <_svfiprintf_r>
8000f328:	00812783          	lw	a5,8(sp)
8000f32c:	00078023          	sb	zero,0(a5)
8000f330:	07c12083          	lw	ra,124(sp)
8000f334:	0a010113          	addi	sp,sp,160
8000f338:	00008067          	ret

Disassembly of section .text.sprintf:

8000f33c <siprintf>:
8000f33c:	f6010113          	addi	sp,sp,-160
8000f340:	08f12a23          	sw	a5,148(sp)
8000f344:	800007b7          	lui	a5,0x80000
8000f348:	fff7c793          	not	a5,a5
8000f34c:	00f12e23          	sw	a5,28(sp)
8000f350:	00f12823          	sw	a5,16(sp)
8000f354:	ffff07b7          	lui	a5,0xffff0
8000f358:	20878793          	addi	a5,a5,520 # ffff0208 <_ram_heap_end+0x7ffd8208>
8000f35c:	08c12423          	sw	a2,136(sp)
8000f360:	08d12623          	sw	a3,140(sp)
8000f364:	08e12823          	sw	a4,144(sp)
8000f368:	09012c23          	sw	a6,152(sp)
8000f36c:	09112e23          	sw	a7,156(sp)
8000f370:	00f12a23          	sw	a5,20(sp)
8000f374:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000f378:	00a12423          	sw	a0,8(sp)
8000f37c:	00a12c23          	sw	a0,24(sp)
8000f380:	0007a503          	lw	a0,0(a5)
8000f384:	08810693          	addi	a3,sp,136
8000f388:	00058613          	mv	a2,a1
8000f38c:	00810593          	addi	a1,sp,8
8000f390:	06112e23          	sw	ra,124(sp)
8000f394:	00d12223          	sw	a3,4(sp)
8000f398:	435000ef          	jal	ra,8000ffcc <_svfiprintf_r>
8000f39c:	00812783          	lw	a5,8(sp)
8000f3a0:	00078023          	sb	zero,0(a5)
8000f3a4:	07c12083          	lw	ra,124(sp)
8000f3a8:	0a010113          	addi	sp,sp,160
8000f3ac:	00008067          	ret

Disassembly of section .text.__sread:

8000f3b0 <__sread>:
8000f3b0:	ff010113          	addi	sp,sp,-16
8000f3b4:	00812423          	sw	s0,8(sp)
8000f3b8:	00058413          	mv	s0,a1
8000f3bc:	00e59583          	lh	a1,14(a1)
8000f3c0:	00112623          	sw	ra,12(sp)
8000f3c4:	219010ef          	jal	ra,80010ddc <_read_r>
8000f3c8:	02054063          	bltz	a0,8000f3e8 <__sread+0x38>
8000f3cc:	05442783          	lw	a5,84(s0)
8000f3d0:	00a787b3          	add	a5,a5,a0
8000f3d4:	04f42a23          	sw	a5,84(s0)
8000f3d8:	00c12083          	lw	ra,12(sp)
8000f3dc:	00812403          	lw	s0,8(sp)
8000f3e0:	01010113          	addi	sp,sp,16
8000f3e4:	00008067          	ret
8000f3e8:	00c45783          	lhu	a5,12(s0)
8000f3ec:	fffff737          	lui	a4,0xfffff
8000f3f0:	fff70713          	addi	a4,a4,-1 # ffffefff <_ram_heap_end+0x7ffe6fff>
8000f3f4:	00e7f7b3          	and	a5,a5,a4
8000f3f8:	00f41623          	sh	a5,12(s0)
8000f3fc:	fddff06f          	j	8000f3d8 <__sread+0x28>

Disassembly of section .text.__seofread:

8000f400 <__seofread>:
8000f400:	00000513          	li	a0,0
8000f404:	00008067          	ret

Disassembly of section .text.__swrite:

8000f408 <__swrite>:
8000f408:	00c5d783          	lhu	a5,12(a1)
8000f40c:	fe010113          	addi	sp,sp,-32
8000f410:	00812c23          	sw	s0,24(sp)
8000f414:	00912a23          	sw	s1,20(sp)
8000f418:	01212823          	sw	s2,16(sp)
8000f41c:	01312623          	sw	s3,12(sp)
8000f420:	00112e23          	sw	ra,28(sp)
8000f424:	1007f793          	andi	a5,a5,256
8000f428:	00050493          	mv	s1,a0
8000f42c:	00058413          	mv	s0,a1
8000f430:	00060913          	mv	s2,a2
8000f434:	00068993          	mv	s3,a3
8000f438:	00078a63          	beqz	a5,8000f44c <__swrite+0x44>
8000f43c:	00e59583          	lh	a1,14(a1)
8000f440:	00200693          	li	a3,2
8000f444:	00000613          	li	a2,0
8000f448:	694000ef          	jal	ra,8000fadc <_lseek_r>
8000f44c:	00c45783          	lhu	a5,12(s0)
8000f450:	fffff737          	lui	a4,0xfffff
8000f454:	fff70713          	addi	a4,a4,-1 # ffffefff <_ram_heap_end+0x7ffe6fff>
8000f458:	00e7f7b3          	and	a5,a5,a4
8000f45c:	00f41623          	sh	a5,12(s0)
8000f460:	00e41583          	lh	a1,14(s0)
8000f464:	01812403          	lw	s0,24(sp)
8000f468:	01c12083          	lw	ra,28(sp)
8000f46c:	00098693          	mv	a3,s3
8000f470:	00090613          	mv	a2,s2
8000f474:	00c12983          	lw	s3,12(sp)
8000f478:	01012903          	lw	s2,16(sp)
8000f47c:	00048513          	mv	a0,s1
8000f480:	01412483          	lw	s1,20(sp)
8000f484:	02010113          	addi	sp,sp,32
8000f488:	4480006f          	j	8000f8d0 <_write_r>

Disassembly of section .text.__sseek:

8000f48c <__sseek>:
8000f48c:	ff010113          	addi	sp,sp,-16
8000f490:	00812423          	sw	s0,8(sp)
8000f494:	00058413          	mv	s0,a1
8000f498:	00e59583          	lh	a1,14(a1)
8000f49c:	00112623          	sw	ra,12(sp)
8000f4a0:	63c000ef          	jal	ra,8000fadc <_lseek_r>
8000f4a4:	fff00793          	li	a5,-1
8000f4a8:	00c45703          	lhu	a4,12(s0)
8000f4ac:	02f51263          	bne	a0,a5,8000f4d0 <__sseek+0x44>
8000f4b0:	fffff7b7          	lui	a5,0xfffff
8000f4b4:	fff78793          	addi	a5,a5,-1 # ffffefff <_ram_heap_end+0x7ffe6fff>
8000f4b8:	00e7f7b3          	and	a5,a5,a4
8000f4bc:	00f41623          	sh	a5,12(s0)
8000f4c0:	00c12083          	lw	ra,12(sp)
8000f4c4:	00812403          	lw	s0,8(sp)
8000f4c8:	01010113          	addi	sp,sp,16
8000f4cc:	00008067          	ret
8000f4d0:	000017b7          	lui	a5,0x1
8000f4d4:	00f767b3          	or	a5,a4,a5
8000f4d8:	00f41623          	sh	a5,12(s0)
8000f4dc:	04a42a23          	sw	a0,84(s0)
8000f4e0:	fe1ff06f          	j	8000f4c0 <__sseek+0x34>

Disassembly of section .text.__sclose:

8000f4e4 <__sclose>:
8000f4e4:	00e59583          	lh	a1,14(a1)
8000f4e8:	5b00006f          	j	8000fa98 <_close_r>

Disassembly of section .text.strlen:

8000f4ec <strlen>:
8000f4ec:	00050793          	mv	a5,a0
8000f4f0:	00178793          	addi	a5,a5,1 # 1001 <_stack_size+0x1>
8000f4f4:	fff7c703          	lbu	a4,-1(a5)
8000f4f8:	fe071ce3          	bnez	a4,8000f4f0 <strlen+0x4>
8000f4fc:	40a78533          	sub	a0,a5,a0
8000f500:	fff50513          	addi	a0,a0,-1
8000f504:	00008067          	ret

Disassembly of section .text.strncmp:

8000f508 <strncmp>:
8000f508:	02060a63          	beqz	a2,8000f53c <strncmp+0x34>
8000f50c:	fff60613          	addi	a2,a2,-1
8000f510:	00000713          	li	a4,0
8000f514:	00e507b3          	add	a5,a0,a4
8000f518:	00e586b3          	add	a3,a1,a4
8000f51c:	0007c783          	lbu	a5,0(a5)
8000f520:	0006c683          	lbu	a3,0(a3)
8000f524:	00d79863          	bne	a5,a3,8000f534 <strncmp+0x2c>
8000f528:	00c70663          	beq	a4,a2,8000f534 <strncmp+0x2c>
8000f52c:	00170713          	addi	a4,a4,1
8000f530:	fe0792e3          	bnez	a5,8000f514 <strncmp+0xc>
8000f534:	40d78533          	sub	a0,a5,a3
8000f538:	00008067          	ret
8000f53c:	00000513          	li	a0,0
8000f540:	00008067          	ret

Disassembly of section .text._strtol_l.isra.0:

8000f544 <_strtol_l.isra.0>:
8000f544:	fc010113          	addi	sp,sp,-64
8000f548:	03212823          	sw	s2,48(sp)
8000f54c:	03512223          	sw	s5,36(sp)
8000f550:	03612023          	sw	s6,32(sp)
8000f554:	01812c23          	sw	s8,24(sp)
8000f558:	00068913          	mv	s2,a3
8000f55c:	02112e23          	sw	ra,60(sp)
8000f560:	02812c23          	sw	s0,56(sp)
8000f564:	02912a23          	sw	s1,52(sp)
8000f568:	03312623          	sw	s3,44(sp)
8000f56c:	03412423          	sw	s4,40(sp)
8000f570:	01712e23          	sw	s7,28(sp)
8000f574:	01912a23          	sw	s9,20(sp)
8000f578:	01a12823          	sw	s10,16(sp)
8000f57c:	01b12623          	sw	s11,12(sp)
8000f580:	00050a93          	mv	s5,a0
8000f584:	00058b13          	mv	s6,a1
8000f588:	00060c13          	mv	s8,a2
8000f58c:	00058793          	mv	a5,a1
8000f590:	ffff4697          	auipc	a3,0xffff4
8000f594:	9b168693          	addi	a3,a3,-1615 # 80002f41 <_ctype_+0x1>
8000f598:	00178493          	addi	s1,a5,1
8000f59c:	fff4c403          	lbu	s0,-1(s1)
8000f5a0:	00d40733          	add	a4,s0,a3
8000f5a4:	00074703          	lbu	a4,0(a4)
8000f5a8:	00877713          	andi	a4,a4,8
8000f5ac:	0c071863          	bnez	a4,8000f67c <_strtol_l.isra.0+0x138>
8000f5b0:	02d00713          	li	a4,45
8000f5b4:	0ce41863          	bne	s0,a4,8000f684 <_strtol_l.isra.0+0x140>
8000f5b8:	0004c403          	lbu	s0,0(s1)
8000f5bc:	00100a13          	li	s4,1
8000f5c0:	00278493          	addi	s1,a5,2
8000f5c4:	16090e63          	beqz	s2,8000f740 <_strtol_l.isra.0+0x1fc>
8000f5c8:	01000793          	li	a5,16
8000f5cc:	02f91463          	bne	s2,a5,8000f5f4 <_strtol_l.isra.0+0xb0>
8000f5d0:	03000793          	li	a5,48
8000f5d4:	02f41063          	bne	s0,a5,8000f5f4 <_strtol_l.isra.0+0xb0>
8000f5d8:	0004c783          	lbu	a5,0(s1)
8000f5dc:	05800713          	li	a4,88
8000f5e0:	0df7f793          	andi	a5,a5,223
8000f5e4:	14e79663          	bne	a5,a4,8000f730 <_strtol_l.isra.0+0x1ec>
8000f5e8:	0014c403          	lbu	s0,1(s1)
8000f5ec:	01000913          	li	s2,16
8000f5f0:	00248493          	addi	s1,s1,2
8000f5f4:	800009b7          	lui	s3,0x80000
8000f5f8:	000a1463          	bnez	s4,8000f600 <_strtol_l.isra.0+0xbc>
8000f5fc:	fff9c993          	not	s3,s3
8000f600:	00090593          	mv	a1,s2
8000f604:	00098513          	mv	a0,s3
8000f608:	eb0fe0ef          	jal	ra,8000dcb8 <__umodsi3>
8000f60c:	00050b93          	mv	s7,a0
8000f610:	00090593          	mv	a1,s2
8000f614:	00098513          	mv	a0,s3
8000f618:	e58fe0ef          	jal	ra,8000dc70 <__udivsi3>
8000f61c:	00050c93          	mv	s9,a0
8000f620:	00000713          	li	a4,0
8000f624:	00000513          	li	a0,0
8000f628:	00900d93          	li	s11,9
8000f62c:	01900d13          	li	s10,25
8000f630:	fff00693          	li	a3,-1
8000f634:	fd040793          	addi	a5,s0,-48
8000f638:	06fde463          	bltu	s11,a5,8000f6a0 <_strtol_l.isra.0+0x15c>
8000f63c:	00078413          	mv	s0,a5
8000f640:	09245063          	bge	s0,s2,8000f6c0 <_strtol_l.isra.0+0x17c>
8000f644:	02d70663          	beq	a4,a3,8000f670 <_strtol_l.isra.0+0x12c>
8000f648:	fff00713          	li	a4,-1
8000f64c:	02ace263          	bltu	s9,a0,8000f670 <_strtol_l.isra.0+0x12c>
8000f650:	00ac9463          	bne	s9,a0,8000f658 <_strtol_l.isra.0+0x114>
8000f654:	008bce63          	blt	s7,s0,8000f670 <_strtol_l.isra.0+0x12c>
8000f658:	00050593          	mv	a1,a0
8000f65c:	00090513          	mv	a0,s2
8000f660:	de4fe0ef          	jal	ra,8000dc44 <__mulsi3>
8000f664:	00a40533          	add	a0,s0,a0
8000f668:	00100713          	li	a4,1
8000f66c:	fff00693          	li	a3,-1
8000f670:	00148493          	addi	s1,s1,1
8000f674:	fff4c403          	lbu	s0,-1(s1)
8000f678:	fbdff06f          	j	8000f634 <_strtol_l.isra.0+0xf0>
8000f67c:	00048793          	mv	a5,s1
8000f680:	f19ff06f          	j	8000f598 <_strtol_l.isra.0+0x54>
8000f684:	02b00713          	li	a4,43
8000f688:	00e40663          	beq	s0,a4,8000f694 <_strtol_l.isra.0+0x150>
8000f68c:	00000a13          	li	s4,0
8000f690:	f35ff06f          	j	8000f5c4 <_strtol_l.isra.0+0x80>
8000f694:	0004c403          	lbu	s0,0(s1)
8000f698:	00278493          	addi	s1,a5,2
8000f69c:	ff1ff06f          	j	8000f68c <_strtol_l.isra.0+0x148>
8000f6a0:	fbf40793          	addi	a5,s0,-65
8000f6a4:	00fd6663          	bltu	s10,a5,8000f6b0 <_strtol_l.isra.0+0x16c>
8000f6a8:	fc940413          	addi	s0,s0,-55
8000f6ac:	f95ff06f          	j	8000f640 <_strtol_l.isra.0+0xfc>
8000f6b0:	f9f40793          	addi	a5,s0,-97
8000f6b4:	00fd6663          	bltu	s10,a5,8000f6c0 <_strtol_l.isra.0+0x17c>
8000f6b8:	fa940413          	addi	s0,s0,-87
8000f6bc:	f85ff06f          	j	8000f640 <_strtol_l.isra.0+0xfc>
8000f6c0:	fff00793          	li	a5,-1
8000f6c4:	04f71863          	bne	a4,a5,8000f714 <_strtol_l.isra.0+0x1d0>
8000f6c8:	02200793          	li	a5,34
8000f6cc:	00faa023          	sw	a5,0(s5)
8000f6d0:	00098513          	mv	a0,s3
8000f6d4:	040c1863          	bnez	s8,8000f724 <_strtol_l.isra.0+0x1e0>
8000f6d8:	03c12083          	lw	ra,60(sp)
8000f6dc:	03812403          	lw	s0,56(sp)
8000f6e0:	03412483          	lw	s1,52(sp)
8000f6e4:	03012903          	lw	s2,48(sp)
8000f6e8:	02c12983          	lw	s3,44(sp)
8000f6ec:	02812a03          	lw	s4,40(sp)
8000f6f0:	02412a83          	lw	s5,36(sp)
8000f6f4:	02012b03          	lw	s6,32(sp)
8000f6f8:	01c12b83          	lw	s7,28(sp)
8000f6fc:	01812c03          	lw	s8,24(sp)
8000f700:	01412c83          	lw	s9,20(sp)
8000f704:	01012d03          	lw	s10,16(sp)
8000f708:	00c12d83          	lw	s11,12(sp)
8000f70c:	04010113          	addi	sp,sp,64
8000f710:	00008067          	ret
8000f714:	000a0463          	beqz	s4,8000f71c <_strtol_l.isra.0+0x1d8>
8000f718:	40a00533          	neg	a0,a0
8000f71c:	fa0c0ee3          	beqz	s8,8000f6d8 <_strtol_l.isra.0+0x194>
8000f720:	00070463          	beqz	a4,8000f728 <_strtol_l.isra.0+0x1e4>
8000f724:	fff48b13          	addi	s6,s1,-1
8000f728:	016c2023          	sw	s6,0(s8)
8000f72c:	fadff06f          	j	8000f6d8 <_strtol_l.isra.0+0x194>
8000f730:	03000413          	li	s0,48
8000f734:	ec0910e3          	bnez	s2,8000f5f4 <_strtol_l.isra.0+0xb0>
8000f738:	00800913          	li	s2,8
8000f73c:	eb9ff06f          	j	8000f5f4 <_strtol_l.isra.0+0xb0>
8000f740:	03000793          	li	a5,48
8000f744:	e8f40ae3          	beq	s0,a5,8000f5d8 <_strtol_l.isra.0+0x94>
8000f748:	00a00913          	li	s2,10
8000f74c:	ea9ff06f          	j	8000f5f4 <_strtol_l.isra.0+0xb0>

Disassembly of section .text._strtol_r:

8000f750 <_strtol_r>:
8000f750:	df5ff06f          	j	8000f544 <_strtol_l.isra.0>

Disassembly of section .text.strtol_l:

8000f754 <strtol_l>:
8000f754:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000f758:	00060693          	mv	a3,a2
8000f75c:	00058613          	mv	a2,a1
8000f760:	00050593          	mv	a1,a0
8000f764:	0007a503          	lw	a0,0(a5)
8000f768:	dddff06f          	j	8000f544 <_strtol_l.isra.0>

Disassembly of section .text.strtol:

8000f76c <strtol>:
8000f76c:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000f770:	00060693          	mv	a3,a2
8000f774:	00058613          	mv	a2,a1
8000f778:	00050593          	mv	a1,a0
8000f77c:	0007a503          	lw	a0,0(a5)
8000f780:	dc5ff06f          	j	8000f544 <_strtol_l.isra.0>

Disassembly of section .text.__swbuf_r:

8000f784 <__swbuf_r>:
8000f784:	fe010113          	addi	sp,sp,-32
8000f788:	00812c23          	sw	s0,24(sp)
8000f78c:	00912a23          	sw	s1,20(sp)
8000f790:	01212823          	sw	s2,16(sp)
8000f794:	00112e23          	sw	ra,28(sp)
8000f798:	01312623          	sw	s3,12(sp)
8000f79c:	00050493          	mv	s1,a0
8000f7a0:	00058913          	mv	s2,a1
8000f7a4:	00060413          	mv	s0,a2
8000f7a8:	00050863          	beqz	a0,8000f7b8 <__swbuf_r+0x34>
8000f7ac:	01852783          	lw	a5,24(a0)
8000f7b0:	00079463          	bnez	a5,8000f7b8 <__swbuf_r+0x34>
8000f7b4:	ee9fe0ef          	jal	ra,8000e69c <__sinit>
8000f7b8:	ffff4797          	auipc	a5,0xffff4
8000f7bc:	8ac78793          	addi	a5,a5,-1876 # 80003064 <__sf_fake_stdin>
8000f7c0:	0af41e63          	bne	s0,a5,8000f87c <__swbuf_r+0xf8>
8000f7c4:	0044a403          	lw	s0,4(s1)
8000f7c8:	01842783          	lw	a5,24(s0)
8000f7cc:	00f42423          	sw	a5,8(s0)
8000f7d0:	00c45783          	lhu	a5,12(s0)
8000f7d4:	0087f793          	andi	a5,a5,8
8000f7d8:	0c078663          	beqz	a5,8000f8a4 <__swbuf_r+0x120>
8000f7dc:	01042783          	lw	a5,16(s0)
8000f7e0:	0c078263          	beqz	a5,8000f8a4 <__swbuf_r+0x120>
8000f7e4:	01042783          	lw	a5,16(s0)
8000f7e8:	00042503          	lw	a0,0(s0)
8000f7ec:	0ff97993          	andi	s3,s2,255
8000f7f0:	0ff97913          	andi	s2,s2,255
8000f7f4:	40f50533          	sub	a0,a0,a5
8000f7f8:	01442783          	lw	a5,20(s0)
8000f7fc:	00f54a63          	blt	a0,a5,8000f810 <__swbuf_r+0x8c>
8000f800:	00040593          	mv	a1,s0
8000f804:	00048513          	mv	a0,s1
8000f808:	ca5fe0ef          	jal	ra,8000e4ac <_fflush_r>
8000f80c:	0a051463          	bnez	a0,8000f8b4 <__swbuf_r+0x130>
8000f810:	00842783          	lw	a5,8(s0)
8000f814:	00150513          	addi	a0,a0,1
8000f818:	fff78793          	addi	a5,a5,-1
8000f81c:	00f42423          	sw	a5,8(s0)
8000f820:	00042783          	lw	a5,0(s0)
8000f824:	00178713          	addi	a4,a5,1
8000f828:	00e42023          	sw	a4,0(s0)
8000f82c:	01378023          	sb	s3,0(a5)
8000f830:	01442783          	lw	a5,20(s0)
8000f834:	00a78c63          	beq	a5,a0,8000f84c <__swbuf_r+0xc8>
8000f838:	00c45783          	lhu	a5,12(s0)
8000f83c:	0017f793          	andi	a5,a5,1
8000f840:	00078e63          	beqz	a5,8000f85c <__swbuf_r+0xd8>
8000f844:	00a00793          	li	a5,10
8000f848:	00f91a63          	bne	s2,a5,8000f85c <__swbuf_r+0xd8>
8000f84c:	00040593          	mv	a1,s0
8000f850:	00048513          	mv	a0,s1
8000f854:	c59fe0ef          	jal	ra,8000e4ac <_fflush_r>
8000f858:	04051e63          	bnez	a0,8000f8b4 <__swbuf_r+0x130>
8000f85c:	01c12083          	lw	ra,28(sp)
8000f860:	01812403          	lw	s0,24(sp)
8000f864:	00090513          	mv	a0,s2
8000f868:	01412483          	lw	s1,20(sp)
8000f86c:	01012903          	lw	s2,16(sp)
8000f870:	00c12983          	lw	s3,12(sp)
8000f874:	02010113          	addi	sp,sp,32
8000f878:	00008067          	ret
8000f87c:	ffff4797          	auipc	a5,0xffff4
8000f880:	80878793          	addi	a5,a5,-2040 # 80003084 <__sf_fake_stdout>
8000f884:	00f41663          	bne	s0,a5,8000f890 <__swbuf_r+0x10c>
8000f888:	0084a403          	lw	s0,8(s1)
8000f88c:	f3dff06f          	j	8000f7c8 <__swbuf_r+0x44>
8000f890:	ffff3797          	auipc	a5,0xffff3
8000f894:	7b478793          	addi	a5,a5,1972 # 80003044 <__sf_fake_stderr>
8000f898:	f2f418e3          	bne	s0,a5,8000f7c8 <__swbuf_r+0x44>
8000f89c:	00c4a403          	lw	s0,12(s1)
8000f8a0:	f29ff06f          	j	8000f7c8 <__swbuf_r+0x44>
8000f8a4:	00040593          	mv	a1,s0
8000f8a8:	00048513          	mv	a0,s1
8000f8ac:	070000ef          	jal	ra,8000f91c <__swsetup_r>
8000f8b0:	f2050ae3          	beqz	a0,8000f7e4 <__swbuf_r+0x60>
8000f8b4:	fff00913          	li	s2,-1
8000f8b8:	fa5ff06f          	j	8000f85c <__swbuf_r+0xd8>

Disassembly of section .text.__swbuf:

8000f8bc <__swbuf>:
8000f8bc:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000f8c0:	00058613          	mv	a2,a1
8000f8c4:	00050593          	mv	a1,a0
8000f8c8:	0007a503          	lw	a0,0(a5)
8000f8cc:	eb9ff06f          	j	8000f784 <__swbuf_r>

Disassembly of section .text._write_r:

8000f8d0 <_write_r>:
8000f8d0:	ff010113          	addi	sp,sp,-16
8000f8d4:	00812423          	sw	s0,8(sp)
8000f8d8:	00050413          	mv	s0,a0
8000f8dc:	00058513          	mv	a0,a1
8000f8e0:	00060593          	mv	a1,a2
8000f8e4:	00068613          	mv	a2,a3
8000f8e8:	c601a623          	sw	zero,-916(gp) # 800036dc <errno>
8000f8ec:	00112623          	sw	ra,12(sp)
8000f8f0:	cf9f60ef          	jal	ra,800065e8 <_write>
8000f8f4:	fff00793          	li	a5,-1
8000f8f8:	00f51a63          	bne	a0,a5,8000f90c <_write_r+0x3c>
8000f8fc:	c6c18793          	addi	a5,gp,-916 # 800036dc <errno>
8000f900:	0007a783          	lw	a5,0(a5)
8000f904:	00078463          	beqz	a5,8000f90c <_write_r+0x3c>
8000f908:	00f42023          	sw	a5,0(s0)
8000f90c:	00c12083          	lw	ra,12(sp)
8000f910:	00812403          	lw	s0,8(sp)
8000f914:	01010113          	addi	sp,sp,16
8000f918:	00008067          	ret

Disassembly of section .text.__swsetup_r:

8000f91c <__swsetup_r>:
8000f91c:	ff010113          	addi	sp,sp,-16
8000f920:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000f924:	00912223          	sw	s1,4(sp)
8000f928:	0007a483          	lw	s1,0(a5)
8000f92c:	00812423          	sw	s0,8(sp)
8000f930:	01212023          	sw	s2,0(sp)
8000f934:	00112623          	sw	ra,12(sp)
8000f938:	00050913          	mv	s2,a0
8000f93c:	00058413          	mv	s0,a1
8000f940:	00048a63          	beqz	s1,8000f954 <__swsetup_r+0x38>
8000f944:	0184a783          	lw	a5,24(s1)
8000f948:	00079663          	bnez	a5,8000f954 <__swsetup_r+0x38>
8000f94c:	00048513          	mv	a0,s1
8000f950:	d4dfe0ef          	jal	ra,8000e69c <__sinit>
8000f954:	ffff3797          	auipc	a5,0xffff3
8000f958:	71078793          	addi	a5,a5,1808 # 80003064 <__sf_fake_stdin>
8000f95c:	04f41863          	bne	s0,a5,8000f9ac <__swsetup_r+0x90>
8000f960:	0044a403          	lw	s0,4(s1)
8000f964:	00c41703          	lh	a4,12(s0)
8000f968:	01071793          	slli	a5,a4,0x10
8000f96c:	0107d793          	srli	a5,a5,0x10
8000f970:	0087f693          	andi	a3,a5,8
8000f974:	0a069463          	bnez	a3,8000fa1c <__swsetup_r+0x100>
8000f978:	0107f693          	andi	a3,a5,16
8000f97c:	04069c63          	bnez	a3,8000f9d4 <__swsetup_r+0xb8>
8000f980:	00900793          	li	a5,9
8000f984:	00f92023          	sw	a5,0(s2)
8000f988:	04076713          	ori	a4,a4,64
8000f98c:	00e41623          	sh	a4,12(s0)
8000f990:	fff00513          	li	a0,-1
8000f994:	00c12083          	lw	ra,12(sp)
8000f998:	00812403          	lw	s0,8(sp)
8000f99c:	00412483          	lw	s1,4(sp)
8000f9a0:	00012903          	lw	s2,0(sp)
8000f9a4:	01010113          	addi	sp,sp,16
8000f9a8:	00008067          	ret
8000f9ac:	ffff3797          	auipc	a5,0xffff3
8000f9b0:	6d878793          	addi	a5,a5,1752 # 80003084 <__sf_fake_stdout>
8000f9b4:	00f41663          	bne	s0,a5,8000f9c0 <__swsetup_r+0xa4>
8000f9b8:	0084a403          	lw	s0,8(s1)
8000f9bc:	fa9ff06f          	j	8000f964 <__swsetup_r+0x48>
8000f9c0:	ffff3797          	auipc	a5,0xffff3
8000f9c4:	68478793          	addi	a5,a5,1668 # 80003044 <__sf_fake_stderr>
8000f9c8:	f8f41ee3          	bne	s0,a5,8000f964 <__swsetup_r+0x48>
8000f9cc:	00c4a403          	lw	s0,12(s1)
8000f9d0:	f95ff06f          	j	8000f964 <__swsetup_r+0x48>
8000f9d4:	0047f793          	andi	a5,a5,4
8000f9d8:	02078c63          	beqz	a5,8000fa10 <__swsetup_r+0xf4>
8000f9dc:	03442583          	lw	a1,52(s0)
8000f9e0:	00058c63          	beqz	a1,8000f9f8 <__swsetup_r+0xdc>
8000f9e4:	04440793          	addi	a5,s0,68
8000f9e8:	00f58663          	beq	a1,a5,8000f9f4 <__swsetup_r+0xd8>
8000f9ec:	00090513          	mv	a0,s2
8000f9f0:	aa8ff0ef          	jal	ra,8000ec98 <_free_r>
8000f9f4:	02042a23          	sw	zero,52(s0)
8000f9f8:	00c45783          	lhu	a5,12(s0)
8000f9fc:	00042223          	sw	zero,4(s0)
8000fa00:	fdb7f793          	andi	a5,a5,-37
8000fa04:	00f41623          	sh	a5,12(s0)
8000fa08:	01042783          	lw	a5,16(s0)
8000fa0c:	00f42023          	sw	a5,0(s0)
8000fa10:	00c45783          	lhu	a5,12(s0)
8000fa14:	0087e793          	ori	a5,a5,8
8000fa18:	00f41623          	sh	a5,12(s0)
8000fa1c:	01042783          	lw	a5,16(s0)
8000fa20:	02079063          	bnez	a5,8000fa40 <__swsetup_r+0x124>
8000fa24:	00c45783          	lhu	a5,12(s0)
8000fa28:	20000713          	li	a4,512
8000fa2c:	2807f793          	andi	a5,a5,640
8000fa30:	00e78863          	beq	a5,a4,8000fa40 <__swsetup_r+0x124>
8000fa34:	00040593          	mv	a1,s0
8000fa38:	00090513          	mv	a0,s2
8000fa3c:	178000ef          	jal	ra,8000fbb4 <__smakebuf_r>
8000fa40:	00c45783          	lhu	a5,12(s0)
8000fa44:	0017f713          	andi	a4,a5,1
8000fa48:	02070c63          	beqz	a4,8000fa80 <__swsetup_r+0x164>
8000fa4c:	01442783          	lw	a5,20(s0)
8000fa50:	00042423          	sw	zero,8(s0)
8000fa54:	40f007b3          	neg	a5,a5
8000fa58:	00f42c23          	sw	a5,24(s0)
8000fa5c:	01042783          	lw	a5,16(s0)
8000fa60:	00000513          	li	a0,0
8000fa64:	f20798e3          	bnez	a5,8000f994 <__swsetup_r+0x78>
8000fa68:	00c41783          	lh	a5,12(s0)
8000fa6c:	0807f713          	andi	a4,a5,128
8000fa70:	f20702e3          	beqz	a4,8000f994 <__swsetup_r+0x78>
8000fa74:	0407e793          	ori	a5,a5,64
8000fa78:	00f41623          	sh	a5,12(s0)
8000fa7c:	f15ff06f          	j	8000f990 <__swsetup_r+0x74>
8000fa80:	0027f793          	andi	a5,a5,2
8000fa84:	00000713          	li	a4,0
8000fa88:	00079463          	bnez	a5,8000fa90 <__swsetup_r+0x174>
8000fa8c:	01442703          	lw	a4,20(s0)
8000fa90:	00e42423          	sw	a4,8(s0)
8000fa94:	fc9ff06f          	j	8000fa5c <__swsetup_r+0x140>

Disassembly of section .text._close_r:

8000fa98 <_close_r>:
8000fa98:	ff010113          	addi	sp,sp,-16
8000fa9c:	00812423          	sw	s0,8(sp)
8000faa0:	00050413          	mv	s0,a0
8000faa4:	00058513          	mv	a0,a1
8000faa8:	c601a623          	sw	zero,-916(gp) # 800036dc <errno>
8000faac:	00112623          	sw	ra,12(sp)
8000fab0:	b75f60ef          	jal	ra,80006624 <_close>
8000fab4:	fff00793          	li	a5,-1
8000fab8:	00f51a63          	bne	a0,a5,8000facc <_close_r+0x34>
8000fabc:	c6c18793          	addi	a5,gp,-916 # 800036dc <errno>
8000fac0:	0007a783          	lw	a5,0(a5)
8000fac4:	00078463          	beqz	a5,8000facc <_close_r+0x34>
8000fac8:	00f42023          	sw	a5,0(s0)
8000facc:	00c12083          	lw	ra,12(sp)
8000fad0:	00812403          	lw	s0,8(sp)
8000fad4:	01010113          	addi	sp,sp,16
8000fad8:	00008067          	ret

Disassembly of section .text._lseek_r:

8000fadc <_lseek_r>:
8000fadc:	ff010113          	addi	sp,sp,-16
8000fae0:	00812423          	sw	s0,8(sp)
8000fae4:	00050413          	mv	s0,a0
8000fae8:	00058513          	mv	a0,a1
8000faec:	00060593          	mv	a1,a2
8000faf0:	00068613          	mv	a2,a3
8000faf4:	c601a623          	sw	zero,-916(gp) # 800036dc <errno>
8000faf8:	00112623          	sw	ra,12(sp)
8000fafc:	b31f60ef          	jal	ra,8000662c <_lseek>
8000fb00:	fff00793          	li	a5,-1
8000fb04:	00f51a63          	bne	a0,a5,8000fb18 <_lseek_r+0x3c>
8000fb08:	c6c18793          	addi	a5,gp,-916 # 800036dc <errno>
8000fb0c:	0007a783          	lw	a5,0(a5)
8000fb10:	00078463          	beqz	a5,8000fb18 <_lseek_r+0x3c>
8000fb14:	00f42023          	sw	a5,0(s0)
8000fb18:	00c12083          	lw	ra,12(sp)
8000fb1c:	00812403          	lw	s0,8(sp)
8000fb20:	01010113          	addi	sp,sp,16
8000fb24:	00008067          	ret

Disassembly of section .text.__swhatbuf_r:

8000fb28 <__swhatbuf_r>:
8000fb28:	f8010113          	addi	sp,sp,-128
8000fb2c:	06912a23          	sw	s1,116(sp)
8000fb30:	00058493          	mv	s1,a1
8000fb34:	00e59583          	lh	a1,14(a1)
8000fb38:	06812c23          	sw	s0,120(sp)
8000fb3c:	06112e23          	sw	ra,124(sp)
8000fb40:	00060413          	mv	s0,a2
8000fb44:	0005de63          	bgez	a1,8000fb60 <__swhatbuf_r+0x38>
8000fb48:	00c4d783          	lhu	a5,12(s1)
8000fb4c:	0006a023          	sw	zero,0(a3)
8000fb50:	0807f793          	andi	a5,a5,128
8000fb54:	04079063          	bnez	a5,8000fb94 <__swhatbuf_r+0x6c>
8000fb58:	40000793          	li	a5,1024
8000fb5c:	03c0006f          	j	8000fb98 <__swhatbuf_r+0x70>
8000fb60:	01810613          	addi	a2,sp,24
8000fb64:	00d12623          	sw	a3,12(sp)
8000fb68:	46c010ef          	jal	ra,80010fd4 <_fstat_r>
8000fb6c:	00c12683          	lw	a3,12(sp)
8000fb70:	fc054ce3          	bltz	a0,8000fb48 <__swhatbuf_r+0x20>
8000fb74:	01c12703          	lw	a4,28(sp)
8000fb78:	0000f7b7          	lui	a5,0xf
8000fb7c:	00e7f7b3          	and	a5,a5,a4
8000fb80:	ffffe737          	lui	a4,0xffffe
8000fb84:	00e787b3          	add	a5,a5,a4
8000fb88:	0017b793          	seqz	a5,a5
8000fb8c:	00f6a023          	sw	a5,0(a3)
8000fb90:	fc9ff06f          	j	8000fb58 <__swhatbuf_r+0x30>
8000fb94:	04000793          	li	a5,64
8000fb98:	00f42023          	sw	a5,0(s0)
8000fb9c:	07c12083          	lw	ra,124(sp)
8000fba0:	07812403          	lw	s0,120(sp)
8000fba4:	07412483          	lw	s1,116(sp)
8000fba8:	00000513          	li	a0,0
8000fbac:	08010113          	addi	sp,sp,128
8000fbb0:	00008067          	ret

Disassembly of section .text.__smakebuf_r:

8000fbb4 <__smakebuf_r>:
8000fbb4:	00c5d783          	lhu	a5,12(a1)
8000fbb8:	fe010113          	addi	sp,sp,-32
8000fbbc:	00812c23          	sw	s0,24(sp)
8000fbc0:	00112e23          	sw	ra,28(sp)
8000fbc4:	00912a23          	sw	s1,20(sp)
8000fbc8:	01212823          	sw	s2,16(sp)
8000fbcc:	0027f793          	andi	a5,a5,2
8000fbd0:	00058413          	mv	s0,a1
8000fbd4:	02078863          	beqz	a5,8000fc04 <__smakebuf_r+0x50>
8000fbd8:	04740793          	addi	a5,s0,71
8000fbdc:	00f42023          	sw	a5,0(s0)
8000fbe0:	00f42823          	sw	a5,16(s0)
8000fbe4:	00100793          	li	a5,1
8000fbe8:	00f42a23          	sw	a5,20(s0)
8000fbec:	01c12083          	lw	ra,28(sp)
8000fbf0:	01812403          	lw	s0,24(sp)
8000fbf4:	01412483          	lw	s1,20(sp)
8000fbf8:	01012903          	lw	s2,16(sp)
8000fbfc:	02010113          	addi	sp,sp,32
8000fc00:	00008067          	ret
8000fc04:	00c10693          	addi	a3,sp,12
8000fc08:	00810613          	addi	a2,sp,8
8000fc0c:	00050493          	mv	s1,a0
8000fc10:	f19ff0ef          	jal	ra,8000fb28 <__swhatbuf_r>
8000fc14:	00812583          	lw	a1,8(sp)
8000fc18:	00050913          	mv	s2,a0
8000fc1c:	00048513          	mv	a0,s1
8000fc20:	97cff0ef          	jal	ra,8000ed9c <_malloc_r>
8000fc24:	02051063          	bnez	a0,8000fc44 <__smakebuf_r+0x90>
8000fc28:	00c41783          	lh	a5,12(s0)
8000fc2c:	2007f713          	andi	a4,a5,512
8000fc30:	fa071ee3          	bnez	a4,8000fbec <__smakebuf_r+0x38>
8000fc34:	ffc7f793          	andi	a5,a5,-4
8000fc38:	0027e793          	ori	a5,a5,2
8000fc3c:	00f41623          	sh	a5,12(s0)
8000fc40:	f99ff06f          	j	8000fbd8 <__smakebuf_r+0x24>
8000fc44:	fffff797          	auipc	a5,0xfffff
8000fc48:	9c078793          	addi	a5,a5,-1600 # 8000e604 <_cleanup_r>
8000fc4c:	02f4a423          	sw	a5,40(s1)
8000fc50:	00c45783          	lhu	a5,12(s0)
8000fc54:	00a42023          	sw	a0,0(s0)
8000fc58:	00a42823          	sw	a0,16(s0)
8000fc5c:	0807e793          	ori	a5,a5,128
8000fc60:	00f41623          	sh	a5,12(s0)
8000fc64:	00812783          	lw	a5,8(sp)
8000fc68:	00f42a23          	sw	a5,20(s0)
8000fc6c:	00c12783          	lw	a5,12(sp)
8000fc70:	02078263          	beqz	a5,8000fc94 <__smakebuf_r+0xe0>
8000fc74:	00e41583          	lh	a1,14(s0)
8000fc78:	00048513          	mv	a0,s1
8000fc7c:	001010ef          	jal	ra,8001147c <_isatty_r>
8000fc80:	00050a63          	beqz	a0,8000fc94 <__smakebuf_r+0xe0>
8000fc84:	00c45783          	lhu	a5,12(s0)
8000fc88:	ffc7f793          	andi	a5,a5,-4
8000fc8c:	0017e793          	ori	a5,a5,1
8000fc90:	00f41623          	sh	a5,12(s0)
8000fc94:	00c45783          	lhu	a5,12(s0)
8000fc98:	00f96933          	or	s2,s2,a5
8000fc9c:	01241623          	sh	s2,12(s0)
8000fca0:	f4dff06f          	j	8000fbec <__smakebuf_r+0x38>

Disassembly of section .text.__ssputs_r:

8000fca4 <__ssputs_r>:
8000fca4:	fe010113          	addi	sp,sp,-32
8000fca8:	01212823          	sw	s2,16(sp)
8000fcac:	0085a903          	lw	s2,8(a1)
8000fcb0:	00812c23          	sw	s0,24(sp)
8000fcb4:	01412423          	sw	s4,8(sp)
8000fcb8:	01612023          	sw	s6,0(sp)
8000fcbc:	00112e23          	sw	ra,28(sp)
8000fcc0:	00912a23          	sw	s1,20(sp)
8000fcc4:	01312623          	sw	s3,12(sp)
8000fcc8:	01512223          	sw	s5,4(sp)
8000fccc:	00058413          	mv	s0,a1
8000fcd0:	00060b13          	mv	s6,a2
8000fcd4:	00068a13          	mv	s4,a3
8000fcd8:	0f26e063          	bltu	a3,s2,8000fdb8 <__ssputs_r+0x114>
8000fcdc:	00c5d783          	lhu	a5,12(a1)
8000fce0:	4807f713          	andi	a4,a5,1152
8000fce4:	0c070863          	beqz	a4,8000fdb4 <__ssputs_r+0x110>
8000fce8:	00042483          	lw	s1,0(s0)
8000fcec:	01442703          	lw	a4,20(s0)
8000fcf0:	0105a583          	lw	a1,16(a1)
8000fcf4:	00050a93          	mv	s5,a0
8000fcf8:	40b489b3          	sub	s3,s1,a1
8000fcfc:	00171493          	slli	s1,a4,0x1
8000fd00:	00e48733          	add	a4,s1,a4
8000fd04:	01f75493          	srli	s1,a4,0x1f
8000fd08:	00e484b3          	add	s1,s1,a4
8000fd0c:	00168713          	addi	a4,a3,1
8000fd10:	4014d493          	srai	s1,s1,0x1
8000fd14:	01370733          	add	a4,a4,s3
8000fd18:	00e4f463          	bgeu	s1,a4,8000fd20 <__ssputs_r+0x7c>
8000fd1c:	00070493          	mv	s1,a4
8000fd20:	4007f793          	andi	a5,a5,1024
8000fd24:	0c078463          	beqz	a5,8000fdec <__ssputs_r+0x148>
8000fd28:	00048593          	mv	a1,s1
8000fd2c:	000a8513          	mv	a0,s5
8000fd30:	86cff0ef          	jal	ra,8000ed9c <_malloc_r>
8000fd34:	00050913          	mv	s2,a0
8000fd38:	04051263          	bnez	a0,8000fd7c <__ssputs_r+0xd8>
8000fd3c:	00c00793          	li	a5,12
8000fd40:	00faa023          	sw	a5,0(s5)
8000fd44:	00c45783          	lhu	a5,12(s0)
8000fd48:	fff00513          	li	a0,-1
8000fd4c:	0407e793          	ori	a5,a5,64
8000fd50:	00f41623          	sh	a5,12(s0)
8000fd54:	01c12083          	lw	ra,28(sp)
8000fd58:	01812403          	lw	s0,24(sp)
8000fd5c:	01412483          	lw	s1,20(sp)
8000fd60:	01012903          	lw	s2,16(sp)
8000fd64:	00c12983          	lw	s3,12(sp)
8000fd68:	00812a03          	lw	s4,8(sp)
8000fd6c:	00412a83          	lw	s5,4(sp)
8000fd70:	00012b03          	lw	s6,0(sp)
8000fd74:	02010113          	addi	sp,sp,32
8000fd78:	00008067          	ret
8000fd7c:	01042583          	lw	a1,16(s0)
8000fd80:	00098613          	mv	a2,s3
8000fd84:	d8dfe0ef          	jal	ra,8000eb10 <memcpy>
8000fd88:	00c45783          	lhu	a5,12(s0)
8000fd8c:	b7f7f793          	andi	a5,a5,-1153
8000fd90:	0807e793          	ori	a5,a5,128
8000fd94:	00f41623          	sh	a5,12(s0)
8000fd98:	01242823          	sw	s2,16(s0)
8000fd9c:	00942a23          	sw	s1,20(s0)
8000fda0:	01390933          	add	s2,s2,s3
8000fda4:	413484b3          	sub	s1,s1,s3
8000fda8:	01242023          	sw	s2,0(s0)
8000fdac:	00942423          	sw	s1,8(s0)
8000fdb0:	000a0913          	mv	s2,s4
8000fdb4:	012a7463          	bgeu	s4,s2,8000fdbc <__ssputs_r+0x118>
8000fdb8:	000a0913          	mv	s2,s4
8000fdbc:	00042503          	lw	a0,0(s0)
8000fdc0:	00090613          	mv	a2,s2
8000fdc4:	000b0593          	mv	a1,s6
8000fdc8:	e21fe0ef          	jal	ra,8000ebe8 <memmove>
8000fdcc:	00842783          	lw	a5,8(s0)
8000fdd0:	00000513          	li	a0,0
8000fdd4:	412787b3          	sub	a5,a5,s2
8000fdd8:	00f42423          	sw	a5,8(s0)
8000fddc:	00042783          	lw	a5,0(s0)
8000fde0:	01278933          	add	s2,a5,s2
8000fde4:	01242023          	sw	s2,0(s0)
8000fde8:	f6dff06f          	j	8000fd54 <__ssputs_r+0xb0>
8000fdec:	00048613          	mv	a2,s1
8000fdf0:	000a8513          	mv	a0,s5
8000fdf4:	6f0010ef          	jal	ra,800114e4 <_realloc_r>
8000fdf8:	00050913          	mv	s2,a0
8000fdfc:	f8051ee3          	bnez	a0,8000fd98 <__ssputs_r+0xf4>
8000fe00:	01042583          	lw	a1,16(s0)
8000fe04:	000a8513          	mv	a0,s5
8000fe08:	e91fe0ef          	jal	ra,8000ec98 <_free_r>
8000fe0c:	f31ff06f          	j	8000fd3c <__ssputs_r+0x98>

Disassembly of section .text.__ssprint_r:

8000fe10 <__ssprint_r>:
8000fe10:	00862783          	lw	a5,8(a2)
8000fe14:	fd010113          	addi	sp,sp,-48
8000fe18:	01312e23          	sw	s3,28(sp)
8000fe1c:	02112623          	sw	ra,44(sp)
8000fe20:	02812423          	sw	s0,40(sp)
8000fe24:	02912223          	sw	s1,36(sp)
8000fe28:	03212023          	sw	s2,32(sp)
8000fe2c:	01412c23          	sw	s4,24(sp)
8000fe30:	01512a23          	sw	s5,20(sp)
8000fe34:	01612823          	sw	s6,16(sp)
8000fe38:	01712623          	sw	s7,12(sp)
8000fe3c:	01812423          	sw	s8,8(sp)
8000fe40:	00060993          	mv	s3,a2
8000fe44:	12078663          	beqz	a5,8000ff70 <__ssprint_r+0x160>
8000fe48:	00062b03          	lw	s6,0(a2)
8000fe4c:	00050a93          	mv	s5,a0
8000fe50:	00058413          	mv	s0,a1
8000fe54:	00000b93          	li	s7,0
8000fe58:	00000913          	li	s2,0
8000fe5c:	08090663          	beqz	s2,8000fee8 <__ssprint_r+0xd8>
8000fe60:	00842a03          	lw	s4,8(s0)
8000fe64:	0d496663          	bltu	s2,s4,8000ff30 <__ssprint_r+0x120>
8000fe68:	00c45783          	lhu	a5,12(s0)
8000fe6c:	4807f713          	andi	a4,a5,1152
8000fe70:	0c070063          	beqz	a4,8000ff30 <__ssprint_r+0x120>
8000fe74:	00042483          	lw	s1,0(s0)
8000fe78:	01442703          	lw	a4,20(s0)
8000fe7c:	01042583          	lw	a1,16(s0)
8000fe80:	40b48c33          	sub	s8,s1,a1
8000fe84:	00171493          	slli	s1,a4,0x1
8000fe88:	00e48733          	add	a4,s1,a4
8000fe8c:	01f75493          	srli	s1,a4,0x1f
8000fe90:	00e484b3          	add	s1,s1,a4
8000fe94:	001c0713          	addi	a4,s8,1
8000fe98:	4014d493          	srai	s1,s1,0x1
8000fe9c:	01270733          	add	a4,a4,s2
8000fea0:	00e4f463          	bgeu	s1,a4,8000fea8 <__ssprint_r+0x98>
8000fea4:	00070493          	mv	s1,a4
8000fea8:	4007f793          	andi	a5,a5,1024
8000feac:	0e078e63          	beqz	a5,8000ffa8 <__ssprint_r+0x198>
8000feb0:	00048593          	mv	a1,s1
8000feb4:	000a8513          	mv	a0,s5
8000feb8:	ee5fe0ef          	jal	ra,8000ed9c <_malloc_r>
8000febc:	00050a13          	mv	s4,a0
8000fec0:	02051c63          	bnez	a0,8000fef8 <__ssprint_r+0xe8>
8000fec4:	00c00793          	li	a5,12
8000fec8:	00faa023          	sw	a5,0(s5)
8000fecc:	00c45783          	lhu	a5,12(s0)
8000fed0:	fff00513          	li	a0,-1
8000fed4:	0407e793          	ori	a5,a5,64
8000fed8:	00f41623          	sh	a5,12(s0)
8000fedc:	0009a423          	sw	zero,8(s3) # 80000008 <_ram_heap_end+0xfffe8008>
8000fee0:	0009a223          	sw	zero,4(s3)
8000fee4:	0940006f          	j	8000ff78 <__ssprint_r+0x168>
8000fee8:	000b2b83          	lw	s7,0(s6)
8000feec:	004b2903          	lw	s2,4(s6)
8000fef0:	008b0b13          	addi	s6,s6,8
8000fef4:	f69ff06f          	j	8000fe5c <__ssprint_r+0x4c>
8000fef8:	01042583          	lw	a1,16(s0)
8000fefc:	000c0613          	mv	a2,s8
8000ff00:	c11fe0ef          	jal	ra,8000eb10 <memcpy>
8000ff04:	00c45783          	lhu	a5,12(s0)
8000ff08:	b7f7f793          	andi	a5,a5,-1153
8000ff0c:	0807e793          	ori	a5,a5,128
8000ff10:	00f41623          	sh	a5,12(s0)
8000ff14:	01442823          	sw	s4,16(s0)
8000ff18:	00942a23          	sw	s1,20(s0)
8000ff1c:	018a0a33          	add	s4,s4,s8
8000ff20:	418484b3          	sub	s1,s1,s8
8000ff24:	01442023          	sw	s4,0(s0)
8000ff28:	00942423          	sw	s1,8(s0)
8000ff2c:	00090a13          	mv	s4,s2
8000ff30:	01497463          	bgeu	s2,s4,8000ff38 <__ssprint_r+0x128>
8000ff34:	00090a13          	mv	s4,s2
8000ff38:	00042503          	lw	a0,0(s0)
8000ff3c:	000a0613          	mv	a2,s4
8000ff40:	000b8593          	mv	a1,s7
8000ff44:	ca5fe0ef          	jal	ra,8000ebe8 <memmove>
8000ff48:	00842783          	lw	a5,8(s0)
8000ff4c:	414787b3          	sub	a5,a5,s4
8000ff50:	00f42423          	sw	a5,8(s0)
8000ff54:	00042783          	lw	a5,0(s0)
8000ff58:	01478a33          	add	s4,a5,s4
8000ff5c:	0089a783          	lw	a5,8(s3)
8000ff60:	01442023          	sw	s4,0(s0)
8000ff64:	41278933          	sub	s2,a5,s2
8000ff68:	0129a423          	sw	s2,8(s3)
8000ff6c:	f6091ee3          	bnez	s2,8000fee8 <__ssprint_r+0xd8>
8000ff70:	0009a223          	sw	zero,4(s3)
8000ff74:	00000513          	li	a0,0
8000ff78:	02c12083          	lw	ra,44(sp)
8000ff7c:	02812403          	lw	s0,40(sp)
8000ff80:	02412483          	lw	s1,36(sp)
8000ff84:	02012903          	lw	s2,32(sp)
8000ff88:	01c12983          	lw	s3,28(sp)
8000ff8c:	01812a03          	lw	s4,24(sp)
8000ff90:	01412a83          	lw	s5,20(sp)
8000ff94:	01012b03          	lw	s6,16(sp)
8000ff98:	00c12b83          	lw	s7,12(sp)
8000ff9c:	00812c03          	lw	s8,8(sp)
8000ffa0:	03010113          	addi	sp,sp,48
8000ffa4:	00008067          	ret
8000ffa8:	00048613          	mv	a2,s1
8000ffac:	000a8513          	mv	a0,s5
8000ffb0:	534010ef          	jal	ra,800114e4 <_realloc_r>
8000ffb4:	00050a13          	mv	s4,a0
8000ffb8:	f4051ee3          	bnez	a0,8000ff14 <__ssprint_r+0x104>
8000ffbc:	01042583          	lw	a1,16(s0)
8000ffc0:	000a8513          	mv	a0,s5
8000ffc4:	cd5fe0ef          	jal	ra,8000ec98 <_free_r>
8000ffc8:	efdff06f          	j	8000fec4 <__ssprint_r+0xb4>

Disassembly of section .text._svfprintf_r:

8000ffcc <_svfiprintf_r>:
8000ffcc:	00c5d783          	lhu	a5,12(a1)
8000ffd0:	f5010113          	addi	sp,sp,-176
8000ffd4:	0a912223          	sw	s1,164(sp)
8000ffd8:	0b212023          	sw	s2,160(sp)
8000ffdc:	09312e23          	sw	s3,156(sp)
8000ffe0:	0a112623          	sw	ra,172(sp)
8000ffe4:	0a812423          	sw	s0,168(sp)
8000ffe8:	09412c23          	sw	s4,152(sp)
8000ffec:	09512a23          	sw	s5,148(sp)
8000fff0:	09612823          	sw	s6,144(sp)
8000fff4:	09712623          	sw	s7,140(sp)
8000fff8:	09812423          	sw	s8,136(sp)
8000fffc:	09912223          	sw	s9,132(sp)
80010000:	0807f793          	andi	a5,a5,128
80010004:	00050993          	mv	s3,a0
80010008:	00058913          	mv	s2,a1
8001000c:	00060493          	mv	s1,a2
80010010:	06078863          	beqz	a5,80010080 <_svfiprintf_r+0xb4>
80010014:	0105a783          	lw	a5,16(a1)
80010018:	06079463          	bnez	a5,80010080 <_svfiprintf_r+0xb4>
8001001c:	04000593          	li	a1,64
80010020:	00d12623          	sw	a3,12(sp)
80010024:	d79fe0ef          	jal	ra,8000ed9c <_malloc_r>
80010028:	00a92023          	sw	a0,0(s2)
8001002c:	00a92823          	sw	a0,16(s2)
80010030:	00c12683          	lw	a3,12(sp)
80010034:	04051263          	bnez	a0,80010078 <_svfiprintf_r+0xac>
80010038:	00c00793          	li	a5,12
8001003c:	00f9a023          	sw	a5,0(s3)
80010040:	fff00513          	li	a0,-1
80010044:	0ac12083          	lw	ra,172(sp)
80010048:	0a812403          	lw	s0,168(sp)
8001004c:	0a412483          	lw	s1,164(sp)
80010050:	0a012903          	lw	s2,160(sp)
80010054:	09c12983          	lw	s3,156(sp)
80010058:	09812a03          	lw	s4,152(sp)
8001005c:	09412a83          	lw	s5,148(sp)
80010060:	09012b03          	lw	s6,144(sp)
80010064:	08c12b83          	lw	s7,140(sp)
80010068:	08812c03          	lw	s8,136(sp)
8001006c:	08412c83          	lw	s9,132(sp)
80010070:	0b010113          	addi	sp,sp,176
80010074:	00008067          	ret
80010078:	04000793          	li	a5,64
8001007c:	00f92a23          	sw	a5,20(s2)
80010080:	02000793          	li	a5,32
80010084:	02f10ca3          	sb	a5,57(sp)
80010088:	03000793          	li	a5,48
8001008c:	02012a23          	sw	zero,52(sp)
80010090:	02f10d23          	sb	a5,58(sp)
80010094:	00d12e23          	sw	a3,28(sp)
80010098:	02500b13          	li	s6,37
8001009c:	ffff3a97          	auipc	s5,0xffff3
800100a0:	008a8a93          	addi	s5,s5,8 # 800030a4 <__sf_fake_stdout+0x20>
800100a4:	00100b93          	li	s7,1
800100a8:	7fff0c17          	auipc	s8,0x7fff0
800100ac:	f58c0c13          	addi	s8,s8,-168 # 0 <_ram_heap_end+0x7ffe8000>
800100b0:	00048413          	mv	s0,s1
800100b4:	00044783          	lbu	a5,0(s0)
800100b8:	00078463          	beqz	a5,800100c0 <_svfiprintf_r+0xf4>
800100bc:	0d679663          	bne	a5,s6,80010188 <_svfiprintf_r+0x1bc>
800100c0:	40940cb3          	sub	s9,s0,s1
800100c4:	020c8663          	beqz	s9,800100f0 <_svfiprintf_r+0x124>
800100c8:	000c8693          	mv	a3,s9
800100cc:	00048613          	mv	a2,s1
800100d0:	00090593          	mv	a1,s2
800100d4:	00098513          	mv	a0,s3
800100d8:	bcdff0ef          	jal	ra,8000fca4 <__ssputs_r>
800100dc:	fff00793          	li	a5,-1
800100e0:	24f50e63          	beq	a0,a5,8001033c <_svfiprintf_r+0x370>
800100e4:	03412683          	lw	a3,52(sp)
800100e8:	019686b3          	add	a3,a3,s9
800100ec:	02d12a23          	sw	a3,52(sp)
800100f0:	00044783          	lbu	a5,0(s0)
800100f4:	24078463          	beqz	a5,8001033c <_svfiprintf_r+0x370>
800100f8:	fff00793          	li	a5,-1
800100fc:	00140493          	addi	s1,s0,1
80010100:	02012023          	sw	zero,32(sp)
80010104:	02012623          	sw	zero,44(sp)
80010108:	02f12223          	sw	a5,36(sp)
8001010c:	02012423          	sw	zero,40(sp)
80010110:	060101a3          	sb	zero,99(sp)
80010114:	06012c23          	sw	zero,120(sp)
80010118:	0004c583          	lbu	a1,0(s1)
8001011c:	00500613          	li	a2,5
80010120:	000a8513          	mv	a0,s5
80010124:	39c010ef          	jal	ra,800114c0 <memchr>
80010128:	00148413          	addi	s0,s1,1
8001012c:	02012783          	lw	a5,32(sp)
80010130:	06051063          	bnez	a0,80010190 <_svfiprintf_r+0x1c4>
80010134:	0107f713          	andi	a4,a5,16
80010138:	00070663          	beqz	a4,80010144 <_svfiprintf_r+0x178>
8001013c:	02000713          	li	a4,32
80010140:	06e101a3          	sb	a4,99(sp)
80010144:	0087f713          	andi	a4,a5,8
80010148:	00070663          	beqz	a4,80010154 <_svfiprintf_r+0x188>
8001014c:	02b00713          	li	a4,43
80010150:	06e101a3          	sb	a4,99(sp)
80010154:	0004c683          	lbu	a3,0(s1)
80010158:	02a00713          	li	a4,42
8001015c:	04e68663          	beq	a3,a4,800101a8 <_svfiprintf_r+0x1dc>
80010160:	02c12703          	lw	a4,44(sp)
80010164:	00048413          	mv	s0,s1
80010168:	00000793          	li	a5,0
8001016c:	00900613          	li	a2,9
80010170:	00044683          	lbu	a3,0(s0)
80010174:	00140593          	addi	a1,s0,1
80010178:	fd068693          	addi	a3,a3,-48
8001017c:	10d67a63          	bgeu	a2,a3,80010290 <_svfiprintf_r+0x2c4>
80010180:	02079e63          	bnez	a5,800101bc <_svfiprintf_r+0x1f0>
80010184:	0500006f          	j	800101d4 <_svfiprintf_r+0x208>
80010188:	00140413          	addi	s0,s0,1
8001018c:	f29ff06f          	j	800100b4 <_svfiprintf_r+0xe8>
80010190:	41550533          	sub	a0,a0,s5
80010194:	00ab9533          	sll	a0,s7,a0
80010198:	00a7e7b3          	or	a5,a5,a0
8001019c:	02f12023          	sw	a5,32(sp)
800101a0:	00040493          	mv	s1,s0
800101a4:	f75ff06f          	j	80010118 <_svfiprintf_r+0x14c>
800101a8:	01c12703          	lw	a4,28(sp)
800101ac:	00470693          	addi	a3,a4,4 # ffffe004 <_ram_heap_end+0x7ffe6004>
800101b0:	00072703          	lw	a4,0(a4)
800101b4:	00d12e23          	sw	a3,28(sp)
800101b8:	00074663          	bltz	a4,800101c4 <_svfiprintf_r+0x1f8>
800101bc:	02e12623          	sw	a4,44(sp)
800101c0:	0140006f          	j	800101d4 <_svfiprintf_r+0x208>
800101c4:	40e00733          	neg	a4,a4
800101c8:	0027e793          	ori	a5,a5,2
800101cc:	02e12623          	sw	a4,44(sp)
800101d0:	02f12023          	sw	a5,32(sp)
800101d4:	00044703          	lbu	a4,0(s0)
800101d8:	02e00793          	li	a5,46
800101dc:	02f71663          	bne	a4,a5,80010208 <_svfiprintf_r+0x23c>
800101e0:	00144703          	lbu	a4,1(s0)
800101e4:	02a00793          	li	a5,42
800101e8:	0cf71663          	bne	a4,a5,800102b4 <_svfiprintf_r+0x2e8>
800101ec:	01c12783          	lw	a5,28(sp)
800101f0:	00240413          	addi	s0,s0,2
800101f4:	00478713          	addi	a4,a5,4
800101f8:	0007a783          	lw	a5,0(a5)
800101fc:	00e12e23          	sw	a4,28(sp)
80010200:	0a07c663          	bltz	a5,800102ac <_svfiprintf_r+0x2e0>
80010204:	02f12223          	sw	a5,36(sp)
80010208:	00044583          	lbu	a1,0(s0)
8001020c:	00300613          	li	a2,3
80010210:	ffff3517          	auipc	a0,0xffff3
80010214:	e9c50513          	addi	a0,a0,-356 # 800030ac <__sf_fake_stdout+0x28>
80010218:	2a8010ef          	jal	ra,800114c0 <memchr>
8001021c:	02050463          	beqz	a0,80010244 <_svfiprintf_r+0x278>
80010220:	ffff3797          	auipc	a5,0xffff3
80010224:	e8c78793          	addi	a5,a5,-372 # 800030ac <__sf_fake_stdout+0x28>
80010228:	40f50533          	sub	a0,a0,a5
8001022c:	04000793          	li	a5,64
80010230:	00a797b3          	sll	a5,a5,a0
80010234:	02012503          	lw	a0,32(sp)
80010238:	00140413          	addi	s0,s0,1
8001023c:	00f56533          	or	a0,a0,a5
80010240:	02a12023          	sw	a0,32(sp)
80010244:	00044583          	lbu	a1,0(s0)
80010248:	00600613          	li	a2,6
8001024c:	ffff3517          	auipc	a0,0xffff3
80010250:	e6450513          	addi	a0,a0,-412 # 800030b0 <__sf_fake_stdout+0x2c>
80010254:	00140493          	addi	s1,s0,1
80010258:	02b10c23          	sb	a1,56(sp)
8001025c:	264010ef          	jal	ra,800114c0 <memchr>
80010260:	0e050a63          	beqz	a0,80010354 <_svfiprintf_r+0x388>
80010264:	0a0c1663          	bnez	s8,80010310 <_svfiprintf_r+0x344>
80010268:	02012703          	lw	a4,32(sp)
8001026c:	01c12783          	lw	a5,28(sp)
80010270:	10077713          	andi	a4,a4,256
80010274:	08070663          	beqz	a4,80010300 <_svfiprintf_r+0x334>
80010278:	00478793          	addi	a5,a5,4
8001027c:	00f12e23          	sw	a5,28(sp)
80010280:	03412783          	lw	a5,52(sp)
80010284:	014787b3          	add	a5,a5,s4
80010288:	02f12a23          	sw	a5,52(sp)
8001028c:	e25ff06f          	j	800100b0 <_svfiprintf_r+0xe4>
80010290:	00271793          	slli	a5,a4,0x2
80010294:	00e787b3          	add	a5,a5,a4
80010298:	00179793          	slli	a5,a5,0x1
8001029c:	00d78733          	add	a4,a5,a3
800102a0:	00058413          	mv	s0,a1
800102a4:	00100793          	li	a5,1
800102a8:	ec9ff06f          	j	80010170 <_svfiprintf_r+0x1a4>
800102ac:	fff00793          	li	a5,-1
800102b0:	f55ff06f          	j	80010204 <_svfiprintf_r+0x238>
800102b4:	00140413          	addi	s0,s0,1
800102b8:	02012223          	sw	zero,36(sp)
800102bc:	00000793          	li	a5,0
800102c0:	00000713          	li	a4,0
800102c4:	00900613          	li	a2,9
800102c8:	00044683          	lbu	a3,0(s0)
800102cc:	00140593          	addi	a1,s0,1
800102d0:	fd068693          	addi	a3,a3,-48
800102d4:	00d67863          	bgeu	a2,a3,800102e4 <_svfiprintf_r+0x318>
800102d8:	f20788e3          	beqz	a5,80010208 <_svfiprintf_r+0x23c>
800102dc:	02e12223          	sw	a4,36(sp)
800102e0:	f29ff06f          	j	80010208 <_svfiprintf_r+0x23c>
800102e4:	00271793          	slli	a5,a4,0x2
800102e8:	00e787b3          	add	a5,a5,a4
800102ec:	00179793          	slli	a5,a5,0x1
800102f0:	00d78733          	add	a4,a5,a3
800102f4:	00058413          	mv	s0,a1
800102f8:	00100793          	li	a5,1
800102fc:	fcdff06f          	j	800102c8 <_svfiprintf_r+0x2fc>
80010300:	00778793          	addi	a5,a5,7
80010304:	ff87f793          	andi	a5,a5,-8
80010308:	00878793          	addi	a5,a5,8
8001030c:	f71ff06f          	j	8001027c <_svfiprintf_r+0x2b0>
80010310:	01c10713          	addi	a4,sp,28
80010314:	00000697          	auipc	a3,0x0
80010318:	99068693          	addi	a3,a3,-1648 # 8000fca4 <__ssputs_r>
8001031c:	00090613          	mv	a2,s2
80010320:	02010593          	addi	a1,sp,32
80010324:	00098513          	mv	a0,s3
80010328:	00000097          	auipc	ra,0x0
8001032c:	000000e7          	jalr	zero # 0 <_ram_heap_size>
80010330:	fff00793          	li	a5,-1
80010334:	00050a13          	mv	s4,a0
80010338:	f4f514e3          	bne	a0,a5,80010280 <_svfiprintf_r+0x2b4>
8001033c:	00c95783          	lhu	a5,12(s2)
80010340:	fff00513          	li	a0,-1
80010344:	0407f793          	andi	a5,a5,64
80010348:	ce079ee3          	bnez	a5,80010044 <_svfiprintf_r+0x78>
8001034c:	03412503          	lw	a0,52(sp)
80010350:	cf5ff06f          	j	80010044 <_svfiprintf_r+0x78>
80010354:	01c10713          	addi	a4,sp,28
80010358:	00000697          	auipc	a3,0x0
8001035c:	94c68693          	addi	a3,a3,-1716 # 8000fca4 <__ssputs_r>
80010360:	00090613          	mv	a2,s2
80010364:	02010593          	addi	a1,sp,32
80010368:	00098513          	mv	a0,s3
8001036c:	1b8000ef          	jal	ra,80010524 <_printf_i>
80010370:	fc1ff06f          	j	80010330 <_svfiprintf_r+0x364>

Disassembly of section .text._printf_common:

80010374 <_printf_common>:
80010374:	fd010113          	addi	sp,sp,-48
80010378:	01512a23          	sw	s5,20(sp)
8001037c:	0105a783          	lw	a5,16(a1)
80010380:	00070a93          	mv	s5,a4
80010384:	0085a703          	lw	a4,8(a1)
80010388:	02812423          	sw	s0,40(sp)
8001038c:	02912223          	sw	s1,36(sp)
80010390:	01312e23          	sw	s3,28(sp)
80010394:	01412c23          	sw	s4,24(sp)
80010398:	02112623          	sw	ra,44(sp)
8001039c:	03212023          	sw	s2,32(sp)
800103a0:	01612823          	sw	s6,16(sp)
800103a4:	01712623          	sw	s7,12(sp)
800103a8:	00050993          	mv	s3,a0
800103ac:	00058413          	mv	s0,a1
800103b0:	00060493          	mv	s1,a2
800103b4:	00068a13          	mv	s4,a3
800103b8:	00e7d463          	bge	a5,a4,800103c0 <_printf_common+0x4c>
800103bc:	00070793          	mv	a5,a4
800103c0:	00f4a023          	sw	a5,0(s1)
800103c4:	04344703          	lbu	a4,67(s0)
800103c8:	00070663          	beqz	a4,800103d4 <_printf_common+0x60>
800103cc:	00178793          	addi	a5,a5,1
800103d0:	00f4a023          	sw	a5,0(s1)
800103d4:	00042783          	lw	a5,0(s0)
800103d8:	0207f793          	andi	a5,a5,32
800103dc:	00078863          	beqz	a5,800103ec <_printf_common+0x78>
800103e0:	0004a783          	lw	a5,0(s1)
800103e4:	00278793          	addi	a5,a5,2
800103e8:	00f4a023          	sw	a5,0(s1)
800103ec:	00042903          	lw	s2,0(s0)
800103f0:	00697913          	andi	s2,s2,6
800103f4:	00091e63          	bnez	s2,80010410 <_printf_common+0x9c>
800103f8:	01940b13          	addi	s6,s0,25
800103fc:	fff00b93          	li	s7,-1
80010400:	00c42783          	lw	a5,12(s0)
80010404:	0004a703          	lw	a4,0(s1)
80010408:	40e787b3          	sub	a5,a5,a4
8001040c:	08f94263          	blt	s2,a5,80010490 <_printf_common+0x11c>
80010410:	00042783          	lw	a5,0(s0)
80010414:	04344683          	lbu	a3,67(s0)
80010418:	0207f793          	andi	a5,a5,32
8001041c:	00d036b3          	snez	a3,a3
80010420:	0c079063          	bnez	a5,800104e0 <_printf_common+0x16c>
80010424:	04340613          	addi	a2,s0,67
80010428:	000a0593          	mv	a1,s4
8001042c:	00098513          	mv	a0,s3
80010430:	000a80e7          	jalr	s5
80010434:	fff00793          	li	a5,-1
80010438:	06f50863          	beq	a0,a5,800104a8 <_printf_common+0x134>
8001043c:	00042783          	lw	a5,0(s0)
80010440:	00400613          	li	a2,4
80010444:	0004a703          	lw	a4,0(s1)
80010448:	0067f793          	andi	a5,a5,6
8001044c:	00c42683          	lw	a3,12(s0)
80010450:	00000493          	li	s1,0
80010454:	00c79863          	bne	a5,a2,80010464 <_printf_common+0xf0>
80010458:	40e684b3          	sub	s1,a3,a4
8001045c:	0004d463          	bgez	s1,80010464 <_printf_common+0xf0>
80010460:	00000493          	li	s1,0
80010464:	00842783          	lw	a5,8(s0)
80010468:	01042703          	lw	a4,16(s0)
8001046c:	00f75663          	bge	a4,a5,80010478 <_printf_common+0x104>
80010470:	40e787b3          	sub	a5,a5,a4
80010474:	00f484b3          	add	s1,s1,a5
80010478:	00000913          	li	s2,0
8001047c:	01a40413          	addi	s0,s0,26
80010480:	fff00b13          	li	s6,-1
80010484:	09249063          	bne	s1,s2,80010504 <_printf_common+0x190>
80010488:	00000513          	li	a0,0
8001048c:	0200006f          	j	800104ac <_printf_common+0x138>
80010490:	00100693          	li	a3,1
80010494:	000b0613          	mv	a2,s6
80010498:	000a0593          	mv	a1,s4
8001049c:	00098513          	mv	a0,s3
800104a0:	000a80e7          	jalr	s5
800104a4:	03751a63          	bne	a0,s7,800104d8 <_printf_common+0x164>
800104a8:	fff00513          	li	a0,-1
800104ac:	02c12083          	lw	ra,44(sp)
800104b0:	02812403          	lw	s0,40(sp)
800104b4:	02412483          	lw	s1,36(sp)
800104b8:	02012903          	lw	s2,32(sp)
800104bc:	01c12983          	lw	s3,28(sp)
800104c0:	01812a03          	lw	s4,24(sp)
800104c4:	01412a83          	lw	s5,20(sp)
800104c8:	01012b03          	lw	s6,16(sp)
800104cc:	00c12b83          	lw	s7,12(sp)
800104d0:	03010113          	addi	sp,sp,48
800104d4:	00008067          	ret
800104d8:	00190913          	addi	s2,s2,1
800104dc:	f25ff06f          	j	80010400 <_printf_common+0x8c>
800104e0:	00d40733          	add	a4,s0,a3
800104e4:	03000613          	li	a2,48
800104e8:	04c701a3          	sb	a2,67(a4)
800104ec:	04544703          	lbu	a4,69(s0)
800104f0:	00168793          	addi	a5,a3,1
800104f4:	00f407b3          	add	a5,s0,a5
800104f8:	00268693          	addi	a3,a3,2
800104fc:	04e781a3          	sb	a4,67(a5)
80010500:	f25ff06f          	j	80010424 <_printf_common+0xb0>
80010504:	00100693          	li	a3,1
80010508:	00040613          	mv	a2,s0
8001050c:	000a0593          	mv	a1,s4
80010510:	00098513          	mv	a0,s3
80010514:	000a80e7          	jalr	s5
80010518:	f96508e3          	beq	a0,s6,800104a8 <_printf_common+0x134>
8001051c:	00190913          	addi	s2,s2,1
80010520:	f65ff06f          	j	80010484 <_printf_common+0x110>

Disassembly of section .text._printf_i:

80010524 <_printf_i>:
80010524:	fc010113          	addi	sp,sp,-64
80010528:	02812c23          	sw	s0,56(sp)
8001052c:	03312623          	sw	s3,44(sp)
80010530:	03512223          	sw	s5,36(sp)
80010534:	03612023          	sw	s6,32(sp)
80010538:	01712e23          	sw	s7,28(sp)
8001053c:	02112e23          	sw	ra,60(sp)
80010540:	02912a23          	sw	s1,52(sp)
80010544:	03212823          	sw	s2,48(sp)
80010548:	03412423          	sw	s4,40(sp)
8001054c:	01812c23          	sw	s8,24(sp)
80010550:	0185c783          	lbu	a5,24(a1)
80010554:	00068b93          	mv	s7,a3
80010558:	06e00693          	li	a3,110
8001055c:	00050a93          	mv	s5,a0
80010560:	00058413          	mv	s0,a1
80010564:	00060b13          	mv	s6,a2
80010568:	04358993          	addi	s3,a1,67
8001056c:	28d78c63          	beq	a5,a3,80010804 <_printf_i+0x2e0>
80010570:	06f6e863          	bltu	a3,a5,800105e0 <_printf_i+0xbc>
80010574:	06300693          	li	a3,99
80010578:	0ad78c63          	beq	a5,a3,80010630 <_printf_i+0x10c>
8001057c:	00f6ec63          	bltu	a3,a5,80010594 <_printf_i+0x70>
80010580:	2c078063          	beqz	a5,80010840 <_printf_i+0x31c>
80010584:	05800693          	li	a3,88
80010588:	12d78863          	beq	a5,a3,800106b8 <_printf_i+0x194>
8001058c:	04240c13          	addi	s8,s0,66
80010590:	0b40006f          	j	80010644 <_printf_i+0x120>
80010594:	06400693          	li	a3,100
80010598:	00d78663          	beq	a5,a3,800105a4 <_printf_i+0x80>
8001059c:	06900693          	li	a3,105
800105a0:	fed796e3          	bne	a5,a3,8001058c <_printf_i+0x68>
800105a4:	00042783          	lw	a5,0(s0)
800105a8:	00072603          	lw	a2,0(a4)
800105ac:	0807f593          	andi	a1,a5,128
800105b0:	00460693          	addi	a3,a2,4
800105b4:	08058e63          	beqz	a1,80010650 <_printf_i+0x12c>
800105b8:	00062483          	lw	s1,0(a2)
800105bc:	00d72023          	sw	a3,0(a4)
800105c0:	0004d863          	bgez	s1,800105d0 <_printf_i+0xac>
800105c4:	02d00793          	li	a5,45
800105c8:	409004b3          	neg	s1,s1
800105cc:	04f401a3          	sb	a5,67(s0)
800105d0:	ffff3a17          	auipc	s4,0xffff3
800105d4:	ae8a0a13          	addi	s4,s4,-1304 # 800030b8 <__sf_fake_stdout+0x34>
800105d8:	00a00913          	li	s2,10
800105dc:	12c0006f          	j	80010708 <_printf_i+0x1e4>
800105e0:	07300693          	li	a3,115
800105e4:	26d78463          	beq	a5,a3,8001084c <_printf_i+0x328>
800105e8:	02f6e263          	bltu	a3,a5,8001060c <_printf_i+0xe8>
800105ec:	06f00693          	li	a3,111
800105f0:	06d78e63          	beq	a5,a3,8001066c <_printf_i+0x148>
800105f4:	07000693          	li	a3,112
800105f8:	f8d79ae3          	bne	a5,a3,8001058c <_printf_i+0x68>
800105fc:	0005a783          	lw	a5,0(a1)
80010600:	0207e793          	ori	a5,a5,32
80010604:	00f5a023          	sw	a5,0(a1)
80010608:	0140006f          	j	8001061c <_printf_i+0xf8>
8001060c:	07500693          	li	a3,117
80010610:	04d78e63          	beq	a5,a3,8001066c <_printf_i+0x148>
80010614:	07800693          	li	a3,120
80010618:	f6d79ae3          	bne	a5,a3,8001058c <_printf_i+0x68>
8001061c:	07800793          	li	a5,120
80010620:	04f402a3          	sb	a5,69(s0)
80010624:	ffff3a17          	auipc	s4,0xffff3
80010628:	aa8a0a13          	addi	s4,s4,-1368 # 800030cc <__sf_fake_stdout+0x48>
8001062c:	0980006f          	j	800106c4 <_printf_i+0x1a0>
80010630:	00072783          	lw	a5,0(a4)
80010634:	04258c13          	addi	s8,a1,66
80010638:	00478693          	addi	a3,a5,4
8001063c:	0007a783          	lw	a5,0(a5)
80010640:	00d72023          	sw	a3,0(a4)
80010644:	04f40123          	sb	a5,66(s0)
80010648:	00100793          	li	a5,1
8001064c:	2300006f          	j	8001087c <_printf_i+0x358>
80010650:	00062483          	lw	s1,0(a2)
80010654:	0407f793          	andi	a5,a5,64
80010658:	00d72023          	sw	a3,0(a4)
8001065c:	f60782e3          	beqz	a5,800105c0 <_printf_i+0x9c>
80010660:	01049493          	slli	s1,s1,0x10
80010664:	4104d493          	srai	s1,s1,0x10
80010668:	f59ff06f          	j	800105c0 <_printf_i+0x9c>
8001066c:	00042603          	lw	a2,0(s0)
80010670:	00072683          	lw	a3,0(a4)
80010674:	08067513          	andi	a0,a2,128
80010678:	00468593          	addi	a1,a3,4
8001067c:	00050863          	beqz	a0,8001068c <_printf_i+0x168>
80010680:	00b72023          	sw	a1,0(a4)
80010684:	0006a483          	lw	s1,0(a3)
80010688:	0140006f          	j	8001069c <_printf_i+0x178>
8001068c:	04067613          	andi	a2,a2,64
80010690:	00b72023          	sw	a1,0(a4)
80010694:	fe0608e3          	beqz	a2,80010684 <_printf_i+0x160>
80010698:	0006d483          	lhu	s1,0(a3)
8001069c:	06f00713          	li	a4,111
800106a0:	ffff3a17          	auipc	s4,0xffff3
800106a4:	a18a0a13          	addi	s4,s4,-1512 # 800030b8 <__sf_fake_stdout+0x34>
800106a8:	00a00913          	li	s2,10
800106ac:	04e79c63          	bne	a5,a4,80010704 <_printf_i+0x1e0>
800106b0:	00800913          	li	s2,8
800106b4:	0500006f          	j	80010704 <_printf_i+0x1e0>
800106b8:	04f582a3          	sb	a5,69(a1)
800106bc:	ffff3a17          	auipc	s4,0xffff3
800106c0:	9fca0a13          	addi	s4,s4,-1540 # 800030b8 <__sf_fake_stdout+0x34>
800106c4:	00042783          	lw	a5,0(s0)
800106c8:	00072683          	lw	a3,0(a4)
800106cc:	0807f613          	andi	a2,a5,128
800106d0:	0006a483          	lw	s1,0(a3)
800106d4:	00468693          	addi	a3,a3,4
800106d8:	10060663          	beqz	a2,800107e4 <_printf_i+0x2c0>
800106dc:	00d72023          	sw	a3,0(a4)
800106e0:	0017f713          	andi	a4,a5,1
800106e4:	00070663          	beqz	a4,800106f0 <_printf_i+0x1cc>
800106e8:	0207e793          	ori	a5,a5,32
800106ec:	00f42023          	sw	a5,0(s0)
800106f0:	01000913          	li	s2,16
800106f4:	00049863          	bnez	s1,80010704 <_printf_i+0x1e0>
800106f8:	00042783          	lw	a5,0(s0)
800106fc:	fdf7f793          	andi	a5,a5,-33
80010700:	00f42023          	sw	a5,0(s0)
80010704:	040401a3          	sb	zero,67(s0)
80010708:	00442783          	lw	a5,4(s0)
8001070c:	00f42423          	sw	a5,8(s0)
80010710:	0007c863          	bltz	a5,80010720 <_printf_i+0x1fc>
80010714:	00042703          	lw	a4,0(s0)
80010718:	ffb77713          	andi	a4,a4,-5
8001071c:	00e42023          	sw	a4,0(s0)
80010720:	00049663          	bnez	s1,8001072c <_printf_i+0x208>
80010724:	00098c13          	mv	s8,s3
80010728:	02078a63          	beqz	a5,8001075c <_printf_i+0x238>
8001072c:	00098c13          	mv	s8,s3
80010730:	00090593          	mv	a1,s2
80010734:	00048513          	mv	a0,s1
80010738:	d80fd0ef          	jal	ra,8000dcb8 <__umodsi3>
8001073c:	00aa0533          	add	a0,s4,a0
80010740:	00054783          	lbu	a5,0(a0)
80010744:	fffc0c13          	addi	s8,s8,-1
80010748:	00090593          	mv	a1,s2
8001074c:	00fc0023          	sb	a5,0(s8)
80010750:	00048513          	mv	a0,s1
80010754:	d1cfd0ef          	jal	ra,8000dc70 <__udivsi3>
80010758:	0b24f263          	bgeu	s1,s2,800107fc <_printf_i+0x2d8>
8001075c:	00800793          	li	a5,8
80010760:	02f91463          	bne	s2,a5,80010788 <_printf_i+0x264>
80010764:	00042783          	lw	a5,0(s0)
80010768:	0017f793          	andi	a5,a5,1
8001076c:	00078e63          	beqz	a5,80010788 <_printf_i+0x264>
80010770:	00442703          	lw	a4,4(s0)
80010774:	01042783          	lw	a5,16(s0)
80010778:	00e7c863          	blt	a5,a4,80010788 <_printf_i+0x264>
8001077c:	03000793          	li	a5,48
80010780:	fefc0fa3          	sb	a5,-1(s8)
80010784:	fffc0c13          	addi	s8,s8,-1
80010788:	418989b3          	sub	s3,s3,s8
8001078c:	01342823          	sw	s3,16(s0)
80010790:	000b8713          	mv	a4,s7
80010794:	000b0693          	mv	a3,s6
80010798:	00c10613          	addi	a2,sp,12
8001079c:	00040593          	mv	a1,s0
800107a0:	000a8513          	mv	a0,s5
800107a4:	bd1ff0ef          	jal	ra,80010374 <_printf_common>
800107a8:	fff00493          	li	s1,-1
800107ac:	0c951e63          	bne	a0,s1,80010888 <_printf_i+0x364>
800107b0:	fff00513          	li	a0,-1
800107b4:	03c12083          	lw	ra,60(sp)
800107b8:	03812403          	lw	s0,56(sp)
800107bc:	03412483          	lw	s1,52(sp)
800107c0:	03012903          	lw	s2,48(sp)
800107c4:	02c12983          	lw	s3,44(sp)
800107c8:	02812a03          	lw	s4,40(sp)
800107cc:	02412a83          	lw	s5,36(sp)
800107d0:	02012b03          	lw	s6,32(sp)
800107d4:	01c12b83          	lw	s7,28(sp)
800107d8:	01812c03          	lw	s8,24(sp)
800107dc:	04010113          	addi	sp,sp,64
800107e0:	00008067          	ret
800107e4:	0407f613          	andi	a2,a5,64
800107e8:	00d72023          	sw	a3,0(a4)
800107ec:	ee060ae3          	beqz	a2,800106e0 <_printf_i+0x1bc>
800107f0:	01049493          	slli	s1,s1,0x10
800107f4:	0104d493          	srli	s1,s1,0x10
800107f8:	ee9ff06f          	j	800106e0 <_printf_i+0x1bc>
800107fc:	00050493          	mv	s1,a0
80010800:	f31ff06f          	j	80010730 <_printf_i+0x20c>
80010804:	0005a683          	lw	a3,0(a1)
80010808:	00072783          	lw	a5,0(a4)
8001080c:	0145a603          	lw	a2,20(a1)
80010810:	0806f513          	andi	a0,a3,128
80010814:	00478593          	addi	a1,a5,4
80010818:	00050a63          	beqz	a0,8001082c <_printf_i+0x308>
8001081c:	00b72023          	sw	a1,0(a4)
80010820:	0007a783          	lw	a5,0(a5)
80010824:	00c7a023          	sw	a2,0(a5)
80010828:	0180006f          	j	80010840 <_printf_i+0x31c>
8001082c:	00b72023          	sw	a1,0(a4)
80010830:	0406f693          	andi	a3,a3,64
80010834:	0007a783          	lw	a5,0(a5)
80010838:	fe0686e3          	beqz	a3,80010824 <_printf_i+0x300>
8001083c:	00c79023          	sh	a2,0(a5)
80010840:	00042823          	sw	zero,16(s0)
80010844:	00098c13          	mv	s8,s3
80010848:	f49ff06f          	j	80010790 <_printf_i+0x26c>
8001084c:	00072783          	lw	a5,0(a4)
80010850:	0045a603          	lw	a2,4(a1)
80010854:	00000593          	li	a1,0
80010858:	00478693          	addi	a3,a5,4
8001085c:	00d72023          	sw	a3,0(a4)
80010860:	0007ac03          	lw	s8,0(a5)
80010864:	000c0513          	mv	a0,s8
80010868:	459000ef          	jal	ra,800114c0 <memchr>
8001086c:	00050663          	beqz	a0,80010878 <_printf_i+0x354>
80010870:	41850533          	sub	a0,a0,s8
80010874:	00a42223          	sw	a0,4(s0)
80010878:	00442783          	lw	a5,4(s0)
8001087c:	00f42823          	sw	a5,16(s0)
80010880:	040401a3          	sb	zero,67(s0)
80010884:	f0dff06f          	j	80010790 <_printf_i+0x26c>
80010888:	01042683          	lw	a3,16(s0)
8001088c:	000c0613          	mv	a2,s8
80010890:	000b0593          	mv	a1,s6
80010894:	000a8513          	mv	a0,s5
80010898:	000b80e7          	jalr	s7
8001089c:	f0950ae3          	beq	a0,s1,800107b0 <_printf_i+0x28c>
800108a0:	00042783          	lw	a5,0(s0)
800108a4:	0027f793          	andi	a5,a5,2
800108a8:	04079463          	bnez	a5,800108f0 <_printf_i+0x3cc>
800108ac:	00c12783          	lw	a5,12(sp)
800108b0:	00c42503          	lw	a0,12(s0)
800108b4:	f0f550e3          	bge	a0,a5,800107b4 <_printf_i+0x290>
800108b8:	00078513          	mv	a0,a5
800108bc:	ef9ff06f          	j	800107b4 <_printf_i+0x290>
800108c0:	00100693          	li	a3,1
800108c4:	00090613          	mv	a2,s2
800108c8:	000b0593          	mv	a1,s6
800108cc:	000a8513          	mv	a0,s5
800108d0:	000b80e7          	jalr	s7
800108d4:	ed350ee3          	beq	a0,s3,800107b0 <_printf_i+0x28c>
800108d8:	00148493          	addi	s1,s1,1
800108dc:	00c42783          	lw	a5,12(s0)
800108e0:	00c12703          	lw	a4,12(sp)
800108e4:	40e787b3          	sub	a5,a5,a4
800108e8:	fcf4cce3          	blt	s1,a5,800108c0 <_printf_i+0x39c>
800108ec:	fc1ff06f          	j	800108ac <_printf_i+0x388>
800108f0:	00000493          	li	s1,0
800108f4:	01940913          	addi	s2,s0,25
800108f8:	fff00993          	li	s3,-1
800108fc:	fe1ff06f          	j	800108dc <_printf_i+0x3b8>

Disassembly of section .text.__sfputc_r:

80010900 <__sfputc_r>:
80010900:	00862783          	lw	a5,8(a2)
80010904:	fff78793          	addi	a5,a5,-1
80010908:	00f62423          	sw	a5,8(a2)
8001090c:	0007dc63          	bgez	a5,80010924 <__sfputc_r+0x24>
80010910:	01862703          	lw	a4,24(a2)
80010914:	00e7c663          	blt	a5,a4,80010920 <__sfputc_r+0x20>
80010918:	00a00793          	li	a5,10
8001091c:	00f59463          	bne	a1,a5,80010924 <__sfputc_r+0x24>
80010920:	e65fe06f          	j	8000f784 <__swbuf_r>
80010924:	00062783          	lw	a5,0(a2)
80010928:	00058513          	mv	a0,a1
8001092c:	00178713          	addi	a4,a5,1
80010930:	00e62023          	sw	a4,0(a2)
80010934:	00b78023          	sb	a1,0(a5)
80010938:	00008067          	ret

Disassembly of section .text.__sfputs_r:

8001093c <__sfputs_r>:
8001093c:	fe010113          	addi	sp,sp,-32
80010940:	00812c23          	sw	s0,24(sp)
80010944:	00912a23          	sw	s1,20(sp)
80010948:	01212823          	sw	s2,16(sp)
8001094c:	01312623          	sw	s3,12(sp)
80010950:	01412423          	sw	s4,8(sp)
80010954:	00112e23          	sw	ra,28(sp)
80010958:	00050913          	mv	s2,a0
8001095c:	00058993          	mv	s3,a1
80010960:	00060413          	mv	s0,a2
80010964:	00d604b3          	add	s1,a2,a3
80010968:	fff00a13          	li	s4,-1
8001096c:	00941663          	bne	s0,s1,80010978 <__sfputs_r+0x3c>
80010970:	00000513          	li	a0,0
80010974:	01c0006f          	j	80010990 <__sfputs_r+0x54>
80010978:	00044583          	lbu	a1,0(s0)
8001097c:	00098613          	mv	a2,s3
80010980:	00090513          	mv	a0,s2
80010984:	f7dff0ef          	jal	ra,80010900 <__sfputc_r>
80010988:	00140413          	addi	s0,s0,1
8001098c:	ff4510e3          	bne	a0,s4,8001096c <__sfputs_r+0x30>
80010990:	01c12083          	lw	ra,28(sp)
80010994:	01812403          	lw	s0,24(sp)
80010998:	01412483          	lw	s1,20(sp)
8001099c:	01012903          	lw	s2,16(sp)
800109a0:	00c12983          	lw	s3,12(sp)
800109a4:	00812a03          	lw	s4,8(sp)
800109a8:	02010113          	addi	sp,sp,32
800109ac:	00008067          	ret

Disassembly of section .text.__sprint_r:

800109b0 <__sprint_r>:
800109b0:	00862703          	lw	a4,8(a2)
800109b4:	ff010113          	addi	sp,sp,-16
800109b8:	00812423          	sw	s0,8(sp)
800109bc:	00112623          	sw	ra,12(sp)
800109c0:	00060413          	mv	s0,a2
800109c4:	00071e63          	bnez	a4,800109e0 <__sprint_r+0x30>
800109c8:	00062223          	sw	zero,4(a2)
800109cc:	00000513          	li	a0,0
800109d0:	00c12083          	lw	ra,12(sp)
800109d4:	00812403          	lw	s0,8(sp)
800109d8:	01010113          	addi	sp,sp,16
800109dc:	00008067          	ret
800109e0:	63c000ef          	jal	ra,8001101c <__sfvwrite_r>
800109e4:	00042423          	sw	zero,8(s0)
800109e8:	00042223          	sw	zero,4(s0)
800109ec:	fe5ff06f          	j	800109d0 <__sprint_r+0x20>

Disassembly of section .text._vfprintf_r:

800109f0 <_vfiprintf_r>:
800109f0:	f6010113          	addi	sp,sp,-160
800109f4:	08812c23          	sw	s0,152(sp)
800109f8:	08912a23          	sw	s1,148(sp)
800109fc:	09212823          	sw	s2,144(sp)
80010a00:	09312623          	sw	s3,140(sp)
80010a04:	08112e23          	sw	ra,156(sp)
80010a08:	09412423          	sw	s4,136(sp)
80010a0c:	09512223          	sw	s5,132(sp)
80010a10:	09612023          	sw	s6,128(sp)
80010a14:	07712e23          	sw	s7,124(sp)
80010a18:	07812c23          	sw	s8,120(sp)
80010a1c:	07912a23          	sw	s9,116(sp)
80010a20:	00050993          	mv	s3,a0
80010a24:	00058493          	mv	s1,a1
80010a28:	00060913          	mv	s2,a2
80010a2c:	00068413          	mv	s0,a3
80010a30:	00050863          	beqz	a0,80010a40 <_vfiprintf_r+0x50>
80010a34:	01852783          	lw	a5,24(a0)
80010a38:	00079463          	bnez	a5,80010a40 <_vfiprintf_r+0x50>
80010a3c:	c61fd0ef          	jal	ra,8000e69c <__sinit>
80010a40:	ffff2797          	auipc	a5,0xffff2
80010a44:	62478793          	addi	a5,a5,1572 # 80003064 <__sf_fake_stdin>
80010a48:	12f49263          	bne	s1,a5,80010b6c <_vfiprintf_r+0x17c>
80010a4c:	0049a483          	lw	s1,4(s3)
80010a50:	00c4d783          	lhu	a5,12(s1)
80010a54:	0087f793          	andi	a5,a5,8
80010a58:	12078e63          	beqz	a5,80010b94 <_vfiprintf_r+0x1a4>
80010a5c:	0104a783          	lw	a5,16(s1)
80010a60:	12078a63          	beqz	a5,80010b94 <_vfiprintf_r+0x1a4>
80010a64:	02000793          	li	a5,32
80010a68:	02f104a3          	sb	a5,41(sp)
80010a6c:	03000793          	li	a5,48
80010a70:	02012223          	sw	zero,36(sp)
80010a74:	02f10523          	sb	a5,42(sp)
80010a78:	00812623          	sw	s0,12(sp)
80010a7c:	02500b13          	li	s6,37
80010a80:	ffff2a97          	auipc	s5,0xffff2
80010a84:	624a8a93          	addi	s5,s5,1572 # 800030a4 <__sf_fake_stdout+0x20>
80010a88:	00100b93          	li	s7,1
80010a8c:	7ffefc17          	auipc	s8,0x7ffef
80010a90:	574c0c13          	addi	s8,s8,1396 # 0 <_ram_heap_end+0x7ffe8000>
80010a94:	00090413          	mv	s0,s2
80010a98:	00044783          	lbu	a5,0(s0)
80010a9c:	00078463          	beqz	a5,80010aa4 <_vfiprintf_r+0xb4>
80010aa0:	13679e63          	bne	a5,s6,80010bdc <_vfiprintf_r+0x1ec>
80010aa4:	41240cb3          	sub	s9,s0,s2
80010aa8:	020c8663          	beqz	s9,80010ad4 <_vfiprintf_r+0xe4>
80010aac:	000c8693          	mv	a3,s9
80010ab0:	00090613          	mv	a2,s2
80010ab4:	00048593          	mv	a1,s1
80010ab8:	00098513          	mv	a0,s3
80010abc:	e81ff0ef          	jal	ra,8001093c <__sfputs_r>
80010ac0:	fff00793          	li	a5,-1
80010ac4:	2cf50663          	beq	a0,a5,80010d90 <_vfiprintf_r+0x3a0>
80010ac8:	02412683          	lw	a3,36(sp)
80010acc:	019686b3          	add	a3,a3,s9
80010ad0:	02d12223          	sw	a3,36(sp)
80010ad4:	00044783          	lbu	a5,0(s0)
80010ad8:	2a078c63          	beqz	a5,80010d90 <_vfiprintf_r+0x3a0>
80010adc:	fff00793          	li	a5,-1
80010ae0:	00140913          	addi	s2,s0,1
80010ae4:	00012823          	sw	zero,16(sp)
80010ae8:	00012e23          	sw	zero,28(sp)
80010aec:	00f12a23          	sw	a5,20(sp)
80010af0:	00012c23          	sw	zero,24(sp)
80010af4:	040109a3          	sb	zero,83(sp)
80010af8:	06012423          	sw	zero,104(sp)
80010afc:	00094583          	lbu	a1,0(s2)
80010b00:	00500613          	li	a2,5
80010b04:	000a8513          	mv	a0,s5
80010b08:	1b9000ef          	jal	ra,800114c0 <memchr>
80010b0c:	00190413          	addi	s0,s2,1
80010b10:	01012783          	lw	a5,16(sp)
80010b14:	0c051863          	bnez	a0,80010be4 <_vfiprintf_r+0x1f4>
80010b18:	0107f713          	andi	a4,a5,16
80010b1c:	00070663          	beqz	a4,80010b28 <_vfiprintf_r+0x138>
80010b20:	02000713          	li	a4,32
80010b24:	04e109a3          	sb	a4,83(sp)
80010b28:	0087f713          	andi	a4,a5,8
80010b2c:	00070663          	beqz	a4,80010b38 <_vfiprintf_r+0x148>
80010b30:	02b00713          	li	a4,43
80010b34:	04e109a3          	sb	a4,83(sp)
80010b38:	00094683          	lbu	a3,0(s2)
80010b3c:	02a00713          	li	a4,42
80010b40:	0ae68e63          	beq	a3,a4,80010bfc <_vfiprintf_r+0x20c>
80010b44:	01c12703          	lw	a4,28(sp)
80010b48:	00090413          	mv	s0,s2
80010b4c:	00000793          	li	a5,0
80010b50:	00900613          	li	a2,9
80010b54:	00044683          	lbu	a3,0(s0)
80010b58:	00140593          	addi	a1,s0,1
80010b5c:	fd068693          	addi	a3,a3,-48
80010b60:	18d67263          	bgeu	a2,a3,80010ce4 <_vfiprintf_r+0x2f4>
80010b64:	0a079663          	bnez	a5,80010c10 <_vfiprintf_r+0x220>
80010b68:	0c00006f          	j	80010c28 <_vfiprintf_r+0x238>
80010b6c:	ffff2797          	auipc	a5,0xffff2
80010b70:	51878793          	addi	a5,a5,1304 # 80003084 <__sf_fake_stdout>
80010b74:	00f49663          	bne	s1,a5,80010b80 <_vfiprintf_r+0x190>
80010b78:	0089a483          	lw	s1,8(s3)
80010b7c:	ed5ff06f          	j	80010a50 <_vfiprintf_r+0x60>
80010b80:	ffff2797          	auipc	a5,0xffff2
80010b84:	4c478793          	addi	a5,a5,1220 # 80003044 <__sf_fake_stderr>
80010b88:	ecf494e3          	bne	s1,a5,80010a50 <_vfiprintf_r+0x60>
80010b8c:	00c9a483          	lw	s1,12(s3)
80010b90:	ec1ff06f          	j	80010a50 <_vfiprintf_r+0x60>
80010b94:	00048593          	mv	a1,s1
80010b98:	00098513          	mv	a0,s3
80010b9c:	d81fe0ef          	jal	ra,8000f91c <__swsetup_r>
80010ba0:	ec0502e3          	beqz	a0,80010a64 <_vfiprintf_r+0x74>
80010ba4:	fff00513          	li	a0,-1
80010ba8:	09c12083          	lw	ra,156(sp)
80010bac:	09812403          	lw	s0,152(sp)
80010bb0:	09412483          	lw	s1,148(sp)
80010bb4:	09012903          	lw	s2,144(sp)
80010bb8:	08c12983          	lw	s3,140(sp)
80010bbc:	08812a03          	lw	s4,136(sp)
80010bc0:	08412a83          	lw	s5,132(sp)
80010bc4:	08012b03          	lw	s6,128(sp)
80010bc8:	07c12b83          	lw	s7,124(sp)
80010bcc:	07812c03          	lw	s8,120(sp)
80010bd0:	07412c83          	lw	s9,116(sp)
80010bd4:	0a010113          	addi	sp,sp,160
80010bd8:	00008067          	ret
80010bdc:	00140413          	addi	s0,s0,1
80010be0:	eb9ff06f          	j	80010a98 <_vfiprintf_r+0xa8>
80010be4:	41550533          	sub	a0,a0,s5
80010be8:	00ab9533          	sll	a0,s7,a0
80010bec:	00a7e7b3          	or	a5,a5,a0
80010bf0:	00f12823          	sw	a5,16(sp)
80010bf4:	00040913          	mv	s2,s0
80010bf8:	f05ff06f          	j	80010afc <_vfiprintf_r+0x10c>
80010bfc:	00c12703          	lw	a4,12(sp)
80010c00:	00470693          	addi	a3,a4,4
80010c04:	00072703          	lw	a4,0(a4)
80010c08:	00d12623          	sw	a3,12(sp)
80010c0c:	00074663          	bltz	a4,80010c18 <_vfiprintf_r+0x228>
80010c10:	00e12e23          	sw	a4,28(sp)
80010c14:	0140006f          	j	80010c28 <_vfiprintf_r+0x238>
80010c18:	40e00733          	neg	a4,a4
80010c1c:	0027e793          	ori	a5,a5,2
80010c20:	00e12e23          	sw	a4,28(sp)
80010c24:	00f12823          	sw	a5,16(sp)
80010c28:	00044703          	lbu	a4,0(s0)
80010c2c:	02e00793          	li	a5,46
80010c30:	02f71663          	bne	a4,a5,80010c5c <_vfiprintf_r+0x26c>
80010c34:	00144703          	lbu	a4,1(s0)
80010c38:	02a00793          	li	a5,42
80010c3c:	0cf71663          	bne	a4,a5,80010d08 <_vfiprintf_r+0x318>
80010c40:	00c12783          	lw	a5,12(sp)
80010c44:	00240413          	addi	s0,s0,2
80010c48:	00478713          	addi	a4,a5,4
80010c4c:	0007a783          	lw	a5,0(a5)
80010c50:	00e12623          	sw	a4,12(sp)
80010c54:	0a07c663          	bltz	a5,80010d00 <_vfiprintf_r+0x310>
80010c58:	00f12a23          	sw	a5,20(sp)
80010c5c:	00044583          	lbu	a1,0(s0)
80010c60:	00300613          	li	a2,3
80010c64:	ffff2517          	auipc	a0,0xffff2
80010c68:	44850513          	addi	a0,a0,1096 # 800030ac <__sf_fake_stdout+0x28>
80010c6c:	055000ef          	jal	ra,800114c0 <memchr>
80010c70:	02050463          	beqz	a0,80010c98 <_vfiprintf_r+0x2a8>
80010c74:	ffff2797          	auipc	a5,0xffff2
80010c78:	43878793          	addi	a5,a5,1080 # 800030ac <__sf_fake_stdout+0x28>
80010c7c:	40f50533          	sub	a0,a0,a5
80010c80:	04000793          	li	a5,64
80010c84:	00a797b3          	sll	a5,a5,a0
80010c88:	01012503          	lw	a0,16(sp)
80010c8c:	00140413          	addi	s0,s0,1
80010c90:	00f56533          	or	a0,a0,a5
80010c94:	00a12823          	sw	a0,16(sp)
80010c98:	00044583          	lbu	a1,0(s0)
80010c9c:	00600613          	li	a2,6
80010ca0:	ffff2517          	auipc	a0,0xffff2
80010ca4:	41050513          	addi	a0,a0,1040 # 800030b0 <__sf_fake_stdout+0x2c>
80010ca8:	00140913          	addi	s2,s0,1
80010cac:	02b10423          	sb	a1,40(sp)
80010cb0:	011000ef          	jal	ra,800114c0 <memchr>
80010cb4:	0e050863          	beqz	a0,80010da4 <_vfiprintf_r+0x3b4>
80010cb8:	0a0c1663          	bnez	s8,80010d64 <_vfiprintf_r+0x374>
80010cbc:	01012703          	lw	a4,16(sp)
80010cc0:	00c12783          	lw	a5,12(sp)
80010cc4:	10077713          	andi	a4,a4,256
80010cc8:	08070663          	beqz	a4,80010d54 <_vfiprintf_r+0x364>
80010ccc:	00478793          	addi	a5,a5,4
80010cd0:	00f12623          	sw	a5,12(sp)
80010cd4:	02412783          	lw	a5,36(sp)
80010cd8:	014787b3          	add	a5,a5,s4
80010cdc:	02f12223          	sw	a5,36(sp)
80010ce0:	db5ff06f          	j	80010a94 <_vfiprintf_r+0xa4>
80010ce4:	00271793          	slli	a5,a4,0x2
80010ce8:	00e787b3          	add	a5,a5,a4
80010cec:	00179793          	slli	a5,a5,0x1
80010cf0:	00d78733          	add	a4,a5,a3
80010cf4:	00058413          	mv	s0,a1
80010cf8:	00100793          	li	a5,1
80010cfc:	e59ff06f          	j	80010b54 <_vfiprintf_r+0x164>
80010d00:	fff00793          	li	a5,-1
80010d04:	f55ff06f          	j	80010c58 <_vfiprintf_r+0x268>
80010d08:	00140413          	addi	s0,s0,1
80010d0c:	00012a23          	sw	zero,20(sp)
80010d10:	00000793          	li	a5,0
80010d14:	00000713          	li	a4,0
80010d18:	00900613          	li	a2,9
80010d1c:	00044683          	lbu	a3,0(s0)
80010d20:	00140593          	addi	a1,s0,1
80010d24:	fd068693          	addi	a3,a3,-48
80010d28:	00d67863          	bgeu	a2,a3,80010d38 <_vfiprintf_r+0x348>
80010d2c:	f20788e3          	beqz	a5,80010c5c <_vfiprintf_r+0x26c>
80010d30:	00e12a23          	sw	a4,20(sp)
80010d34:	f29ff06f          	j	80010c5c <_vfiprintf_r+0x26c>
80010d38:	00271793          	slli	a5,a4,0x2
80010d3c:	00e787b3          	add	a5,a5,a4
80010d40:	00179793          	slli	a5,a5,0x1
80010d44:	00d78733          	add	a4,a5,a3
80010d48:	00058413          	mv	s0,a1
80010d4c:	00100793          	li	a5,1
80010d50:	fcdff06f          	j	80010d1c <_vfiprintf_r+0x32c>
80010d54:	00778793          	addi	a5,a5,7
80010d58:	ff87f793          	andi	a5,a5,-8
80010d5c:	00878793          	addi	a5,a5,8
80010d60:	f71ff06f          	j	80010cd0 <_vfiprintf_r+0x2e0>
80010d64:	00c10713          	addi	a4,sp,12
80010d68:	00000697          	auipc	a3,0x0
80010d6c:	bd468693          	addi	a3,a3,-1068 # 8001093c <__sfputs_r>
80010d70:	00048613          	mv	a2,s1
80010d74:	01010593          	addi	a1,sp,16
80010d78:	00098513          	mv	a0,s3
80010d7c:	00000097          	auipc	ra,0x0
80010d80:	000000e7          	jalr	zero # 0 <_ram_heap_size>
80010d84:	fff00793          	li	a5,-1
80010d88:	00050a13          	mv	s4,a0
80010d8c:	f4f514e3          	bne	a0,a5,80010cd4 <_vfiprintf_r+0x2e4>
80010d90:	00c4d783          	lhu	a5,12(s1)
80010d94:	0407f793          	andi	a5,a5,64
80010d98:	e00796e3          	bnez	a5,80010ba4 <_vfiprintf_r+0x1b4>
80010d9c:	02412503          	lw	a0,36(sp)
80010da0:	e09ff06f          	j	80010ba8 <_vfiprintf_r+0x1b8>
80010da4:	00c10713          	addi	a4,sp,12
80010da8:	00000697          	auipc	a3,0x0
80010dac:	b9468693          	addi	a3,a3,-1132 # 8001093c <__sfputs_r>
80010db0:	00048613          	mv	a2,s1
80010db4:	01010593          	addi	a1,sp,16
80010db8:	00098513          	mv	a0,s3
80010dbc:	f68ff0ef          	jal	ra,80010524 <_printf_i>
80010dc0:	fc5ff06f          	j	80010d84 <_vfiprintf_r+0x394>

Disassembly of section .text.vfprintf:

80010dc4 <vfiprintf>:
80010dc4:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
80010dc8:	00060693          	mv	a3,a2
80010dcc:	00058613          	mv	a2,a1
80010dd0:	00050593          	mv	a1,a0
80010dd4:	0007a503          	lw	a0,0(a5)
80010dd8:	c19ff06f          	j	800109f0 <_vfiprintf_r>

Disassembly of section .text._read_r:

80010ddc <_read_r>:
80010ddc:	ff010113          	addi	sp,sp,-16
80010de0:	00812423          	sw	s0,8(sp)
80010de4:	00050413          	mv	s0,a0
80010de8:	00058513          	mv	a0,a1
80010dec:	00060593          	mv	a1,a2
80010df0:	00068613          	mv	a2,a3
80010df4:	c601a623          	sw	zero,-916(gp) # 800036dc <errno>
80010df8:	00112623          	sw	ra,12(sp)
80010dfc:	821f50ef          	jal	ra,8000661c <_read>
80010e00:	fff00793          	li	a5,-1
80010e04:	00f51a63          	bne	a0,a5,80010e18 <_read_r+0x3c>
80010e08:	c6c18793          	addi	a5,gp,-916 # 800036dc <errno>
80010e0c:	0007a783          	lw	a5,0(a5)
80010e10:	00078463          	beqz	a5,80010e18 <_read_r+0x3c>
80010e14:	00f42023          	sw	a5,0(s0)
80010e18:	00c12083          	lw	ra,12(sp)
80010e1c:	00812403          	lw	s0,8(sp)
80010e20:	01010113          	addi	sp,sp,16
80010e24:	00008067          	ret

Disassembly of section .text.cleanup_glue:

80010e28 <cleanup_glue>:
80010e28:	ff010113          	addi	sp,sp,-16
80010e2c:	00812423          	sw	s0,8(sp)
80010e30:	00058413          	mv	s0,a1
80010e34:	0005a583          	lw	a1,0(a1)
80010e38:	00912223          	sw	s1,4(sp)
80010e3c:	00112623          	sw	ra,12(sp)
80010e40:	00050493          	mv	s1,a0
80010e44:	00058463          	beqz	a1,80010e4c <cleanup_glue+0x24>
80010e48:	fe1ff0ef          	jal	ra,80010e28 <cleanup_glue>
80010e4c:	00040593          	mv	a1,s0
80010e50:	00812403          	lw	s0,8(sp)
80010e54:	00c12083          	lw	ra,12(sp)
80010e58:	00048513          	mv	a0,s1
80010e5c:	00412483          	lw	s1,4(sp)
80010e60:	01010113          	addi	sp,sp,16
80010e64:	e35fd06f          	j	8000ec98 <_free_r>

Disassembly of section .text._reclaim_reent:

80010e68 <_reclaim_reent>:
80010e68:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
80010e6c:	0007a783          	lw	a5,0(a5)
80010e70:	16a78063          	beq	a5,a0,80010fd0 <_reclaim_reent+0x168>
80010e74:	02452783          	lw	a5,36(a0)
80010e78:	fe010113          	addi	sp,sp,-32
80010e7c:	00812c23          	sw	s0,24(sp)
80010e80:	00112e23          	sw	ra,28(sp)
80010e84:	00912a23          	sw	s1,20(sp)
80010e88:	01212823          	sw	s2,16(sp)
80010e8c:	01312623          	sw	s3,12(sp)
80010e90:	00050413          	mv	s0,a0
80010e94:	02078463          	beqz	a5,80010ebc <_reclaim_reent+0x54>
80010e98:	00c7a783          	lw	a5,12(a5)
80010e9c:	00000493          	li	s1,0
80010ea0:	08000913          	li	s2,128
80010ea4:	0e079263          	bnez	a5,80010f88 <_reclaim_reent+0x120>
80010ea8:	02442783          	lw	a5,36(s0)
80010eac:	0007a583          	lw	a1,0(a5)
80010eb0:	00058663          	beqz	a1,80010ebc <_reclaim_reent+0x54>
80010eb4:	00040513          	mv	a0,s0
80010eb8:	de1fd0ef          	jal	ra,8000ec98 <_free_r>
80010ebc:	01442583          	lw	a1,20(s0)
80010ec0:	00058663          	beqz	a1,80010ecc <_reclaim_reent+0x64>
80010ec4:	00040513          	mv	a0,s0
80010ec8:	dd1fd0ef          	jal	ra,8000ec98 <_free_r>
80010ecc:	02442583          	lw	a1,36(s0)
80010ed0:	00058663          	beqz	a1,80010edc <_reclaim_reent+0x74>
80010ed4:	00040513          	mv	a0,s0
80010ed8:	dc1fd0ef          	jal	ra,8000ec98 <_free_r>
80010edc:	03842583          	lw	a1,56(s0)
80010ee0:	00058663          	beqz	a1,80010eec <_reclaim_reent+0x84>
80010ee4:	00040513          	mv	a0,s0
80010ee8:	db1fd0ef          	jal	ra,8000ec98 <_free_r>
80010eec:	03c42583          	lw	a1,60(s0)
80010ef0:	00058663          	beqz	a1,80010efc <_reclaim_reent+0x94>
80010ef4:	00040513          	mv	a0,s0
80010ef8:	da1fd0ef          	jal	ra,8000ec98 <_free_r>
80010efc:	04042583          	lw	a1,64(s0)
80010f00:	00058663          	beqz	a1,80010f0c <_reclaim_reent+0xa4>
80010f04:	00040513          	mv	a0,s0
80010f08:	d91fd0ef          	jal	ra,8000ec98 <_free_r>
80010f0c:	05c42583          	lw	a1,92(s0)
80010f10:	00058663          	beqz	a1,80010f1c <_reclaim_reent+0xb4>
80010f14:	00040513          	mv	a0,s0
80010f18:	d81fd0ef          	jal	ra,8000ec98 <_free_r>
80010f1c:	05842583          	lw	a1,88(s0)
80010f20:	00058663          	beqz	a1,80010f2c <_reclaim_reent+0xc4>
80010f24:	00040513          	mv	a0,s0
80010f28:	d71fd0ef          	jal	ra,8000ec98 <_free_r>
80010f2c:	03442583          	lw	a1,52(s0)
80010f30:	00058663          	beqz	a1,80010f3c <_reclaim_reent+0xd4>
80010f34:	00040513          	mv	a0,s0
80010f38:	d61fd0ef          	jal	ra,8000ec98 <_free_r>
80010f3c:	01842783          	lw	a5,24(s0)
80010f40:	06078a63          	beqz	a5,80010fb4 <_reclaim_reent+0x14c>
80010f44:	02842783          	lw	a5,40(s0)
80010f48:	00040513          	mv	a0,s0
80010f4c:	000780e7          	jalr	a5
80010f50:	04842583          	lw	a1,72(s0)
80010f54:	06058063          	beqz	a1,80010fb4 <_reclaim_reent+0x14c>
80010f58:	00040513          	mv	a0,s0
80010f5c:	01812403          	lw	s0,24(sp)
80010f60:	01c12083          	lw	ra,28(sp)
80010f64:	01412483          	lw	s1,20(sp)
80010f68:	01012903          	lw	s2,16(sp)
80010f6c:	00c12983          	lw	s3,12(sp)
80010f70:	02010113          	addi	sp,sp,32
80010f74:	eb5ff06f          	j	80010e28 <cleanup_glue>
80010f78:	009585b3          	add	a1,a1,s1
80010f7c:	0005a583          	lw	a1,0(a1)
80010f80:	02059063          	bnez	a1,80010fa0 <_reclaim_reent+0x138>
80010f84:	00448493          	addi	s1,s1,4
80010f88:	02442783          	lw	a5,36(s0)
80010f8c:	00c7a583          	lw	a1,12(a5)
80010f90:	ff2494e3          	bne	s1,s2,80010f78 <_reclaim_reent+0x110>
80010f94:	00040513          	mv	a0,s0
80010f98:	d01fd0ef          	jal	ra,8000ec98 <_free_r>
80010f9c:	f0dff06f          	j	80010ea8 <_reclaim_reent+0x40>
80010fa0:	0005a983          	lw	s3,0(a1)
80010fa4:	00040513          	mv	a0,s0
80010fa8:	cf1fd0ef          	jal	ra,8000ec98 <_free_r>
80010fac:	00098593          	mv	a1,s3
80010fb0:	fd1ff06f          	j	80010f80 <_reclaim_reent+0x118>
80010fb4:	01c12083          	lw	ra,28(sp)
80010fb8:	01812403          	lw	s0,24(sp)
80010fbc:	01412483          	lw	s1,20(sp)
80010fc0:	01012903          	lw	s2,16(sp)
80010fc4:	00c12983          	lw	s3,12(sp)
80010fc8:	02010113          	addi	sp,sp,32
80010fcc:	00008067          	ret
80010fd0:	00008067          	ret

Disassembly of section .text._fstat_r:

80010fd4 <_fstat_r>:
80010fd4:	ff010113          	addi	sp,sp,-16
80010fd8:	00812423          	sw	s0,8(sp)
80010fdc:	00050413          	mv	s0,a0
80010fe0:	00058513          	mv	a0,a1
80010fe4:	00060593          	mv	a1,a2
80010fe8:	c601a623          	sw	zero,-916(gp) # 800036dc <errno>
80010fec:	00112623          	sw	ra,12(sp)
80010ff0:	e4cf50ef          	jal	ra,8000663c <_fstat>
80010ff4:	fff00793          	li	a5,-1
80010ff8:	00f51a63          	bne	a0,a5,8001100c <_fstat_r+0x38>
80010ffc:	c6c18793          	addi	a5,gp,-916 # 800036dc <errno>
80011000:	0007a783          	lw	a5,0(a5)
80011004:	00078463          	beqz	a5,8001100c <_fstat_r+0x38>
80011008:	00f42023          	sw	a5,0(s0)
8001100c:	00c12083          	lw	ra,12(sp)
80011010:	00812403          	lw	s0,8(sp)
80011014:	01010113          	addi	sp,sp,16
80011018:	00008067          	ret

Disassembly of section .text.__sfvwrite_r:

8001101c <__sfvwrite_r>:
8001101c:	00862783          	lw	a5,8(a2)
80011020:	00079863          	bnez	a5,80011030 <__sfvwrite_r+0x14>
80011024:	00000793          	li	a5,0
80011028:	00078513          	mv	a0,a5
8001102c:	00008067          	ret
80011030:	00c5d783          	lhu	a5,12(a1)
80011034:	fc010113          	addi	sp,sp,-64
80011038:	02812c23          	sw	s0,56(sp)
8001103c:	03212823          	sw	s2,48(sp)
80011040:	03612023          	sw	s6,32(sp)
80011044:	02112e23          	sw	ra,60(sp)
80011048:	02912a23          	sw	s1,52(sp)
8001104c:	03312623          	sw	s3,44(sp)
80011050:	03412423          	sw	s4,40(sp)
80011054:	03512223          	sw	s5,36(sp)
80011058:	01712e23          	sw	s7,28(sp)
8001105c:	01812c23          	sw	s8,24(sp)
80011060:	01912a23          	sw	s9,20(sp)
80011064:	01a12823          	sw	s10,16(sp)
80011068:	01b12623          	sw	s11,12(sp)
8001106c:	0087f793          	andi	a5,a5,8
80011070:	00060b13          	mv	s6,a2
80011074:	00058413          	mv	s0,a1
80011078:	00050913          	mv	s2,a0
8001107c:	0e078263          	beqz	a5,80011160 <__sfvwrite_r+0x144>
80011080:	0105a783          	lw	a5,16(a1)
80011084:	0c078e63          	beqz	a5,80011160 <__sfvwrite_r+0x144>
80011088:	00c45783          	lhu	a5,12(s0)
8001108c:	000b2a03          	lw	s4,0(s6)
80011090:	0027f713          	andi	a4,a5,2
80011094:	16071a63          	bnez	a4,80011208 <__sfvwrite_r+0x1ec>
80011098:	0017f793          	andi	a5,a5,1
8001109c:	00000b93          	li	s7,0
800110a0:	20078a63          	beqz	a5,800112b4 <__sfvwrite_r+0x298>
800110a4:	00000513          	li	a0,0
800110a8:	00000a93          	li	s5,0
800110ac:	00000993          	li	s3,0
800110b0:	36098463          	beqz	s3,80011418 <__sfvwrite_r+0x3fc>
800110b4:	02051263          	bnez	a0,800110d8 <__sfvwrite_r+0xbc>
800110b8:	00098613          	mv	a2,s3
800110bc:	00a00593          	li	a1,10
800110c0:	000a8513          	mv	a0,s5
800110c4:	3fc000ef          	jal	ra,800114c0 <memchr>
800110c8:	00198b93          	addi	s7,s3,1
800110cc:	00050663          	beqz	a0,800110d8 <__sfvwrite_r+0xbc>
800110d0:	00150513          	addi	a0,a0,1
800110d4:	41550bb3          	sub	s7,a0,s5
800110d8:	000b8c13          	mv	s8,s7
800110dc:	0179f463          	bgeu	s3,s7,800110e4 <__sfvwrite_r+0xc8>
800110e0:	00098c13          	mv	s8,s3
800110e4:	00042503          	lw	a0,0(s0)
800110e8:	01042783          	lw	a5,16(s0)
800110ec:	01442683          	lw	a3,20(s0)
800110f0:	32a7fe63          	bgeu	a5,a0,8001142c <__sfvwrite_r+0x410>
800110f4:	00842483          	lw	s1,8(s0)
800110f8:	009684b3          	add	s1,a3,s1
800110fc:	3384d863          	bge	s1,s8,8001142c <__sfvwrite_r+0x410>
80011100:	000a8593          	mv	a1,s5
80011104:	00048613          	mv	a2,s1
80011108:	ae1fd0ef          	jal	ra,8000ebe8 <memmove>
8001110c:	00042783          	lw	a5,0(s0)
80011110:	00040593          	mv	a1,s0
80011114:	00090513          	mv	a0,s2
80011118:	009787b3          	add	a5,a5,s1
8001111c:	00f42023          	sw	a5,0(s0)
80011120:	b8cfd0ef          	jal	ra,8000e4ac <_fflush_r>
80011124:	16051e63          	bnez	a0,800112a0 <__sfvwrite_r+0x284>
80011128:	409b8bb3          	sub	s7,s7,s1
8001112c:	00100513          	li	a0,1
80011130:	000b9a63          	bnez	s7,80011144 <__sfvwrite_r+0x128>
80011134:	00040593          	mv	a1,s0
80011138:	00090513          	mv	a0,s2
8001113c:	b70fd0ef          	jal	ra,8000e4ac <_fflush_r>
80011140:	16051063          	bnez	a0,800112a0 <__sfvwrite_r+0x284>
80011144:	008b2783          	lw	a5,8(s6)
80011148:	009a8ab3          	add	s5,s5,s1
8001114c:	409989b3          	sub	s3,s3,s1
80011150:	409784b3          	sub	s1,a5,s1
80011154:	009b2423          	sw	s1,8(s6)
80011158:	f4049ce3          	bnez	s1,800110b0 <__sfvwrite_r+0x94>
8001115c:	0680006f          	j	800111c4 <__sfvwrite_r+0x1a8>
80011160:	00040593          	mv	a1,s0
80011164:	00090513          	mv	a0,s2
80011168:	fb4fe0ef          	jal	ra,8000f91c <__swsetup_r>
8001116c:	fff00793          	li	a5,-1
80011170:	f0050ce3          	beqz	a0,80011088 <__sfvwrite_r+0x6c>
80011174:	0540006f          	j	800111c8 <__sfvwrite_r+0x1ac>
80011178:	000a2983          	lw	s3,0(s4)
8001117c:	004a2483          	lw	s1,4(s4)
80011180:	008a0a13          	addi	s4,s4,8
80011184:	fe048ae3          	beqz	s1,80011178 <__sfvwrite_r+0x15c>
80011188:	00048693          	mv	a3,s1
8001118c:	009af463          	bgeu	s5,s1,80011194 <__sfvwrite_r+0x178>
80011190:	000a8693          	mv	a3,s5
80011194:	02842783          	lw	a5,40(s0)
80011198:	02042583          	lw	a1,32(s0)
8001119c:	00098613          	mv	a2,s3
800111a0:	00090513          	mv	a0,s2
800111a4:	000780e7          	jalr	a5
800111a8:	0ea05c63          	blez	a0,800112a0 <__sfvwrite_r+0x284>
800111ac:	008b2783          	lw	a5,8(s6)
800111b0:	00a989b3          	add	s3,s3,a0
800111b4:	40a484b3          	sub	s1,s1,a0
800111b8:	40a78533          	sub	a0,a5,a0
800111bc:	00ab2423          	sw	a0,8(s6)
800111c0:	fc0512e3          	bnez	a0,80011184 <__sfvwrite_r+0x168>
800111c4:	00000793          	li	a5,0
800111c8:	03c12083          	lw	ra,60(sp)
800111cc:	03812403          	lw	s0,56(sp)
800111d0:	03412483          	lw	s1,52(sp)
800111d4:	03012903          	lw	s2,48(sp)
800111d8:	02c12983          	lw	s3,44(sp)
800111dc:	02812a03          	lw	s4,40(sp)
800111e0:	02412a83          	lw	s5,36(sp)
800111e4:	02012b03          	lw	s6,32(sp)
800111e8:	01c12b83          	lw	s7,28(sp)
800111ec:	01812c03          	lw	s8,24(sp)
800111f0:	01412c83          	lw	s9,20(sp)
800111f4:	01012d03          	lw	s10,16(sp)
800111f8:	00c12d83          	lw	s11,12(sp)
800111fc:	00078513          	mv	a0,a5
80011200:	04010113          	addi	sp,sp,64
80011204:	00008067          	ret
80011208:	80000ab7          	lui	s5,0x80000
8001120c:	00000993          	li	s3,0
80011210:	00000493          	li	s1,0
80011214:	c00aca93          	xori	s5,s5,-1024
80011218:	f6dff06f          	j	80011184 <__sfvwrite_r+0x168>
8001121c:	000a2b83          	lw	s7,0(s4)
80011220:	004a2483          	lw	s1,4(s4)
80011224:	008a0a13          	addi	s4,s4,8
80011228:	fe048ae3          	beqz	s1,8001121c <__sfvwrite_r+0x200>
8001122c:	00c45783          	lhu	a5,12(s0)
80011230:	00842d83          	lw	s11,8(s0)
80011234:	00042503          	lw	a0,0(s0)
80011238:	2007f713          	andi	a4,a5,512
8001123c:	14070263          	beqz	a4,80011380 <__sfvwrite_r+0x364>
80011240:	0db4e063          	bltu	s1,s11,80011300 <__sfvwrite_r+0x2e4>
80011244:	4807f713          	andi	a4,a5,1152
80011248:	0a070c63          	beqz	a4,80011300 <__sfvwrite_r+0x2e4>
8001124c:	01442703          	lw	a4,20(s0)
80011250:	01042583          	lw	a1,16(s0)
80011254:	00171a93          	slli	s5,a4,0x1
80011258:	00ea8733          	add	a4,s5,a4
8001125c:	01f75a93          	srli	s5,a4,0x1f
80011260:	40b50d33          	sub	s10,a0,a1
80011264:	00ea8ab3          	add	s5,s5,a4
80011268:	001d0713          	addi	a4,s10,1
8001126c:	401ada93          	srai	s5,s5,0x1
80011270:	00970733          	add	a4,a4,s1
80011274:	00eaf463          	bgeu	s5,a4,8001127c <__sfvwrite_r+0x260>
80011278:	00070a93          	mv	s5,a4
8001127c:	4007f793          	andi	a5,a5,1024
80011280:	0c078863          	beqz	a5,80011350 <__sfvwrite_r+0x334>
80011284:	000a8593          	mv	a1,s5
80011288:	00090513          	mv	a0,s2
8001128c:	b11fd0ef          	jal	ra,8000ed9c <_malloc_r>
80011290:	00050993          	mv	s3,a0
80011294:	02051a63          	bnez	a0,800112c8 <__sfvwrite_r+0x2ac>
80011298:	00c00793          	li	a5,12
8001129c:	00f92023          	sw	a5,0(s2)
800112a0:	00c45783          	lhu	a5,12(s0)
800112a4:	0407e793          	ori	a5,a5,64
800112a8:	00f41623          	sh	a5,12(s0)
800112ac:	fff00793          	li	a5,-1
800112b0:	f19ff06f          	j	800111c8 <__sfvwrite_r+0x1ac>
800112b4:	80000c37          	lui	s8,0x80000
800112b8:	ffec4c93          	xori	s9,s8,-2
800112bc:	00000493          	li	s1,0
800112c0:	fffc4c13          	not	s8,s8
800112c4:	f65ff06f          	j	80011228 <__sfvwrite_r+0x20c>
800112c8:	01042583          	lw	a1,16(s0)
800112cc:	000d0613          	mv	a2,s10
800112d0:	841fd0ef          	jal	ra,8000eb10 <memcpy>
800112d4:	00c45783          	lhu	a5,12(s0)
800112d8:	b7f7f793          	andi	a5,a5,-1153
800112dc:	0807e793          	ori	a5,a5,128
800112e0:	00f41623          	sh	a5,12(s0)
800112e4:	01342823          	sw	s3,16(s0)
800112e8:	01542a23          	sw	s5,20(s0)
800112ec:	01a989b3          	add	s3,s3,s10
800112f0:	41aa8ab3          	sub	s5,s5,s10
800112f4:	01342023          	sw	s3,0(s0)
800112f8:	00048d93          	mv	s11,s1
800112fc:	01542423          	sw	s5,8(s0)
80011300:	00048993          	mv	s3,s1
80011304:	01b4f463          	bgeu	s1,s11,8001130c <__sfvwrite_r+0x2f0>
80011308:	00048d93          	mv	s11,s1
8001130c:	00042503          	lw	a0,0(s0)
80011310:	000d8613          	mv	a2,s11
80011314:	000b8593          	mv	a1,s7
80011318:	8d1fd0ef          	jal	ra,8000ebe8 <memmove>
8001131c:	00842783          	lw	a5,8(s0)
80011320:	41b787b3          	sub	a5,a5,s11
80011324:	00f42423          	sw	a5,8(s0)
80011328:	00042783          	lw	a5,0(s0)
8001132c:	01b78db3          	add	s11,a5,s11
80011330:	01b42023          	sw	s11,0(s0)
80011334:	008b2783          	lw	a5,8(s6)
80011338:	013b8bb3          	add	s7,s7,s3
8001133c:	413484b3          	sub	s1,s1,s3
80011340:	413789b3          	sub	s3,a5,s3
80011344:	013b2423          	sw	s3,8(s6)
80011348:	ee0990e3          	bnez	s3,80011228 <__sfvwrite_r+0x20c>
8001134c:	e79ff06f          	j	800111c4 <__sfvwrite_r+0x1a8>
80011350:	000a8613          	mv	a2,s5
80011354:	00090513          	mv	a0,s2
80011358:	18c000ef          	jal	ra,800114e4 <_realloc_r>
8001135c:	00050993          	mv	s3,a0
80011360:	f80512e3          	bnez	a0,800112e4 <__sfvwrite_r+0x2c8>
80011364:	01042583          	lw	a1,16(s0)
80011368:	00090513          	mv	a0,s2
8001136c:	92dfd0ef          	jal	ra,8000ec98 <_free_r>
80011370:	00c45783          	lhu	a5,12(s0)
80011374:	f7f7f793          	andi	a5,a5,-129
80011378:	00f41623          	sh	a5,12(s0)
8001137c:	f1dff06f          	j	80011298 <__sfvwrite_r+0x27c>
80011380:	01042783          	lw	a5,16(s0)
80011384:	00a7e663          	bltu	a5,a0,80011390 <__sfvwrite_r+0x374>
80011388:	01442983          	lw	s3,20(s0)
8001138c:	0534f663          	bgeu	s1,s3,800113d8 <__sfvwrite_r+0x3bc>
80011390:	000d8993          	mv	s3,s11
80011394:	01b4f463          	bgeu	s1,s11,8001139c <__sfvwrite_r+0x380>
80011398:	00048993          	mv	s3,s1
8001139c:	00098613          	mv	a2,s3
800113a0:	000b8593          	mv	a1,s7
800113a4:	845fd0ef          	jal	ra,8000ebe8 <memmove>
800113a8:	00842783          	lw	a5,8(s0)
800113ac:	00042703          	lw	a4,0(s0)
800113b0:	413787b3          	sub	a5,a5,s3
800113b4:	01370733          	add	a4,a4,s3
800113b8:	00f42423          	sw	a5,8(s0)
800113bc:	00e42023          	sw	a4,0(s0)
800113c0:	f6079ae3          	bnez	a5,80011334 <__sfvwrite_r+0x318>
800113c4:	00040593          	mv	a1,s0
800113c8:	00090513          	mv	a0,s2
800113cc:	8e0fd0ef          	jal	ra,8000e4ac <_fflush_r>
800113d0:	f60502e3          	beqz	a0,80011334 <__sfvwrite_r+0x318>
800113d4:	ecdff06f          	j	800112a0 <__sfvwrite_r+0x284>
800113d8:	00048513          	mv	a0,s1
800113dc:	009cf463          	bgeu	s9,s1,800113e4 <__sfvwrite_r+0x3c8>
800113e0:	000c0513          	mv	a0,s8
800113e4:	00098593          	mv	a1,s3
800113e8:	881fc0ef          	jal	ra,8000dc68 <__divsi3>
800113ec:	00098593          	mv	a1,s3
800113f0:	855fc0ef          	jal	ra,8000dc44 <__mulsi3>
800113f4:	02842783          	lw	a5,40(s0)
800113f8:	02042583          	lw	a1,32(s0)
800113fc:	00050693          	mv	a3,a0
80011400:	000b8613          	mv	a2,s7
80011404:	00090513          	mv	a0,s2
80011408:	000780e7          	jalr	a5
8001140c:	00050993          	mv	s3,a0
80011410:	f2a042e3          	bgtz	a0,80011334 <__sfvwrite_r+0x318>
80011414:	e8dff06f          	j	800112a0 <__sfvwrite_r+0x284>
80011418:	000a2a83          	lw	s5,0(s4)
8001141c:	004a2983          	lw	s3,4(s4)
80011420:	00000513          	li	a0,0
80011424:	008a0a13          	addi	s4,s4,8
80011428:	c89ff06f          	j	800110b0 <__sfvwrite_r+0x94>
8001142c:	02dc4263          	blt	s8,a3,80011450 <__sfvwrite_r+0x434>
80011430:	02842783          	lw	a5,40(s0)
80011434:	02042583          	lw	a1,32(s0)
80011438:	000a8613          	mv	a2,s5
8001143c:	00090513          	mv	a0,s2
80011440:	000780e7          	jalr	a5
80011444:	00050493          	mv	s1,a0
80011448:	cea040e3          	bgtz	a0,80011128 <__sfvwrite_r+0x10c>
8001144c:	e55ff06f          	j	800112a0 <__sfvwrite_r+0x284>
80011450:	000c0613          	mv	a2,s8
80011454:	000a8593          	mv	a1,s5
80011458:	f90fd0ef          	jal	ra,8000ebe8 <memmove>
8001145c:	00842783          	lw	a5,8(s0)
80011460:	000c0493          	mv	s1,s8
80011464:	418787b3          	sub	a5,a5,s8
80011468:	00f42423          	sw	a5,8(s0)
8001146c:	00042783          	lw	a5,0(s0)
80011470:	018787b3          	add	a5,a5,s8
80011474:	00f42023          	sw	a5,0(s0)
80011478:	cb1ff06f          	j	80011128 <__sfvwrite_r+0x10c>

Disassembly of section .text._isatty_r:

8001147c <_isatty_r>:
8001147c:	ff010113          	addi	sp,sp,-16
80011480:	00812423          	sw	s0,8(sp)
80011484:	00050413          	mv	s0,a0
80011488:	00058513          	mv	a0,a1
8001148c:	c601a623          	sw	zero,-916(gp) # 800036dc <errno>
80011490:	00112623          	sw	ra,12(sp)
80011494:	9a0f50ef          	jal	ra,80006634 <_isatty>
80011498:	fff00793          	li	a5,-1
8001149c:	00f51a63          	bne	a0,a5,800114b0 <_isatty_r+0x34>
800114a0:	c6c18793          	addi	a5,gp,-916 # 800036dc <errno>
800114a4:	0007a783          	lw	a5,0(a5)
800114a8:	00078463          	beqz	a5,800114b0 <_isatty_r+0x34>
800114ac:	00f42023          	sw	a5,0(s0)
800114b0:	00c12083          	lw	ra,12(sp)
800114b4:	00812403          	lw	s0,8(sp)
800114b8:	01010113          	addi	sp,sp,16
800114bc:	00008067          	ret

Disassembly of section .text.memchr:

800114c0 <memchr>:
800114c0:	0ff5f593          	andi	a1,a1,255
800114c4:	00c50633          	add	a2,a0,a2
800114c8:	00c51663          	bne	a0,a2,800114d4 <memchr+0x14>
800114cc:	00000513          	li	a0,0
800114d0:	00008067          	ret
800114d4:	00054783          	lbu	a5,0(a0)
800114d8:	feb78ce3          	beq	a5,a1,800114d0 <memchr+0x10>
800114dc:	00150513          	addi	a0,a0,1
800114e0:	fe9ff06f          	j	800114c8 <memchr+0x8>

Disassembly of section .text._realloc_r:

800114e4 <_realloc_r>:
800114e4:	00059663          	bnez	a1,800114f0 <_realloc_r+0xc>
800114e8:	00060593          	mv	a1,a2
800114ec:	8b1fd06f          	j	8000ed9c <_malloc_r>
800114f0:	fe010113          	addi	sp,sp,-32
800114f4:	00812c23          	sw	s0,24(sp)
800114f8:	00112e23          	sw	ra,28(sp)
800114fc:	00912a23          	sw	s1,20(sp)
80011500:	01212823          	sw	s2,16(sp)
80011504:	01312623          	sw	s3,12(sp)
80011508:	00060413          	mv	s0,a2
8001150c:	02061663          	bnez	a2,80011538 <_realloc_r+0x54>
80011510:	f88fd0ef          	jal	ra,8000ec98 <_free_r>
80011514:	00000913          	li	s2,0
80011518:	01c12083          	lw	ra,28(sp)
8001151c:	01812403          	lw	s0,24(sp)
80011520:	00090513          	mv	a0,s2
80011524:	01412483          	lw	s1,20(sp)
80011528:	01012903          	lw	s2,16(sp)
8001152c:	00c12983          	lw	s3,12(sp)
80011530:	02010113          	addi	sp,sp,32
80011534:	00008067          	ret
80011538:	00058493          	mv	s1,a1
8001153c:	00050993          	mv	s3,a0
80011540:	03c000ef          	jal	ra,8001157c <_malloc_usable_size_r>
80011544:	00048913          	mv	s2,s1
80011548:	fc8578e3          	bgeu	a0,s0,80011518 <_realloc_r+0x34>
8001154c:	00040593          	mv	a1,s0
80011550:	00098513          	mv	a0,s3
80011554:	849fd0ef          	jal	ra,8000ed9c <_malloc_r>
80011558:	00050913          	mv	s2,a0
8001155c:	fa050ee3          	beqz	a0,80011518 <_realloc_r+0x34>
80011560:	00048593          	mv	a1,s1
80011564:	00040613          	mv	a2,s0
80011568:	da8fd0ef          	jal	ra,8000eb10 <memcpy>
8001156c:	00048593          	mv	a1,s1
80011570:	00098513          	mv	a0,s3
80011574:	f24fd0ef          	jal	ra,8000ec98 <_free_r>
80011578:	fa1ff06f          	j	80011518 <_realloc_r+0x34>

Disassembly of section .text._malloc_usable_size_r:

8001157c <_malloc_usable_size_r>:
8001157c:	ffc5a783          	lw	a5,-4(a1)
80011580:	ffc78513          	addi	a0,a5,-4
80011584:	0007d863          	bgez	a5,80011594 <_malloc_usable_size_r+0x18>
80011588:	00a585b3          	add	a1,a1,a0
8001158c:	0005a783          	lw	a5,0(a1)
80011590:	00f50533          	add	a0,a0,a5
80011594:	00008067          	ret
