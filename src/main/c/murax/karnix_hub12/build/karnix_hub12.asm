
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
80000064:	3d5030ef          	jal	ra,80003c38 <irqCallback>
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
800000bc:	4d810113          	addi	sp,sp,1240 # 80012590 <_stack_start>

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
800000dc:	4b850513          	addi	a0,a0,1208 # 80011590 <_ctors_end>
800000e0:	ffc10113          	addi	sp,sp,-4

800000e4 <ctors_loop>:
800000e4:	00011597          	auipc	a1,0x11
800000e8:	4ac58593          	addi	a1,a1,1196 # 80011590 <_ctors_end>
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
80000124:	3f10d0ef          	jal	ra,8000dd14 <end>

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
800037e4:	529020ef          	jal	ra,8000650c <print_uart0>
800037e8:	00c12083          	lw	ra,12(sp)
800037ec:	80003537          	lui	a0,0x80003
800037f0:	8e850513          	addi	a0,a0,-1816 # 800028e8 <_ram_heap_end+0xfffea8e8>
800037f4:	01010113          	addi	sp,sp,16
800037f8:	5150206f          	j	8000650c <print_uart0>

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
800038e4:	418000ef          	jal	ra,80003cfc <modbus_rtu_poll>
800038e8:	8801a023          	sw	zero,-1920(gp) # 800032f0 <events_modbus_rtu_poll>
800038ec:	87c1a783          	lw	a5,-1924(gp) # 800032ec <events_modbus_rtu_rx>
800038f0:	00078663          	beqz	a5,800038fc <process_and_wait+0x78>
800038f4:	4cc000ef          	jal	ra,80003dc0 <modbus_rtu_rx>
800038f8:	8801a023          	sw	zero,-1920(gp) # 800032f0 <events_modbus_rtu_poll>
800038fc:	8881a783          	lw	a5,-1912(gp) # 800032f8 <events_mac_poll>
80003900:	00078663          	beqz	a5,8000390c <process_and_wait+0x88>
80003904:	4f9010ef          	jal	ra,800055fc <mac_poll>
80003908:	8801a423          	sw	zero,-1912(gp) # 800032f8 <events_mac_poll>
8000390c:	8841a783          	lw	a5,-1916(gp) # 800032f4 <events_mac_rx>
80003910:	fa0788e3          	beqz	a5,800038c0 <process_and_wait+0x3c>
80003914:	219010ef          	jal	ra,8000532c <mac_rx>
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
80003960:	00112e23          	sw	ra,28(sp)
80003964:	00812c23          	sw	s0,24(sp)
80003968:	00912a23          	sw	s1,20(sp)
8000396c:	01212823          	sw	s2,16(sp)
80003970:	01312623          	sw	s3,12(sp)
80003974:	01412423          	sw	s4,8(sp)
80003978:	5d00b0ef          	jal	ra,8000ef48 <iprintf>
8000397c:	deadc7b7          	lui	a5,0xdeadc
80003980:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac3eef>
80003984:	90000737          	lui	a4,0x90000
80003988:	900806b7          	lui	a3,0x90080
8000398c:	00f72023          	sw	a5,0(a4) # 90000000 <_ram_heap_end+0xffe8000>
80003990:	00470713          	addi	a4,a4,4
80003994:	00179793          	slli	a5,a5,0x1
80003998:	fed71ae3          	bne	a4,a3,8000398c <sram_test_write_random_ints+0x40>
8000399c:	80002537          	lui	a0,0x80002
800039a0:	00080637          	lui	a2,0x80
800039a4:	900005b7          	lui	a1,0x90000
800039a8:	05050513          	addi	a0,a0,80 # 80002050 <_ram_heap_end+0xfffea050>
800039ac:	deadc4b7          	lui	s1,0xdeadc
800039b0:	5980b0ef          	jal	ra,8000ef48 <iprintf>
800039b4:	00000913          	li	s2,0
800039b8:	eef48493          	addi	s1,s1,-273 # deadbeef <_ram_heap_end+0x5eac3eef>
800039bc:	90000437          	lui	s0,0x90000
800039c0:	80002a37          	lui	s4,0x80002
800039c4:	900809b7          	lui	s3,0x90080
800039c8:	00042783          	lw	a5,0(s0) # 90000000 <_ram_heap_end+0xffe8000>
800039cc:	00978e63          	beq	a5,s1,800039e8 <sram_test_write_random_ints+0x9c>
800039d0:	00042683          	lw	a3,0(s0)
800039d4:	00048613          	mv	a2,s1
800039d8:	00040593          	mv	a1,s0
800039dc:	07ca0513          	addi	a0,s4,124 # 8000207c <_ram_heap_end+0xfffea07c>
800039e0:	5680b0ef          	jal	ra,8000ef48 <iprintf>
800039e4:	00190913          	addi	s2,s2,1
800039e8:	00440413          	addi	s0,s0,4
800039ec:	00149493          	slli	s1,s1,0x1
800039f0:	fd341ce3          	bne	s0,s3,800039c8 <sram_test_write_random_ints+0x7c>
800039f4:	80002537          	lui	a0,0x80002
800039f8:	00090593          	mv	a1,s2
800039fc:	0b050513          	addi	a0,a0,176 # 800020b0 <_ram_heap_end+0xfffea0b0>
80003a00:	5480b0ef          	jal	ra,8000ef48 <iprintf>
80003a04:	01c12083          	lw	ra,28(sp)
80003a08:	01812403          	lw	s0,24(sp)
80003a0c:	00090513          	mv	a0,s2
80003a10:	01412483          	lw	s1,20(sp)
80003a14:	01012903          	lw	s2,16(sp)
80003a18:	00c12983          	lw	s3,12(sp)
80003a1c:	00812a03          	lw	s4,8(sp)
80003a20:	02010113          	addi	sp,sp,32
80003a24:	00008067          	ret

80003a28 <timerInterrupt>:
80003a28:	00008067          	ret

80003a2c <externalInterrupt>:
80003a2c:	ff010113          	addi	sp,sp,-16
80003a30:	00112623          	sw	ra,12(sp)
80003a34:	00812423          	sw	s0,8(sp)
80003a38:	f00607b7          	lui	a5,0xf0060
80003a3c:	0047a783          	lw	a5,4(a5) # f0060004 <_ram_heap_end+0x70048004>
80003a40:	0017f793          	andi	a5,a5,1
80003a44:	02078c63          	beqz	a5,80003a7c <__global_pointer$+0xc>
80003a48:	f0000737          	lui	a4,0xf0000
80003a4c:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
80003a50:	02a00593          	li	a1,42
80003a54:	0027e793          	ori	a5,a5,2
80003a58:	00f72223          	sw	a5,4(a4)
80003a5c:	f0010737          	lui	a4,0xf0010
80003a60:	00472783          	lw	a5,4(a4) # f0010004 <_ram_heap_end+0x6fff8004>
80003a64:	0187d793          	srli	a5,a5,0x18
80003a68:	14079863          	bnez	a5,80003bb8 <__global_pointer$+0x148>
80003a6c:	f0060737          	lui	a4,0xf0060
80003a70:	00472783          	lw	a5,4(a4) # f0060004 <_ram_heap_end+0x70048004>
80003a74:	ffe7f793          	andi	a5,a5,-2
80003a78:	00f72223          	sw	a5,4(a4)
80003a7c:	f00607b7          	lui	a5,0xf0060
80003a80:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x70048004>
80003a84:	00277713          	andi	a4,a4,2
80003a88:	00070e63          	beqz	a4,80003aa4 <__global_pointer$+0x34>
80003a8c:	87c1a703          	lw	a4,-1924(gp) # 800032ec <events_modbus_rtu_rx>
80003a90:	00170713          	addi	a4,a4,1
80003a94:	86e1ae23          	sw	a4,-1924(gp) # 800032ec <events_modbus_rtu_rx>
80003a98:	0047a703          	lw	a4,4(a5)
80003a9c:	ffd77713          	andi	a4,a4,-3
80003aa0:	00e7a223          	sw	a4,4(a5)
80003aa4:	f00607b7          	lui	a5,0xf0060
80003aa8:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x70048004>
80003aac:	00477713          	andi	a4,a4,4
80003ab0:	00070e63          	beqz	a4,80003acc <__global_pointer$+0x5c>
80003ab4:	8841a703          	lw	a4,-1916(gp) # 800032f4 <events_mac_rx>
80003ab8:	00170713          	addi	a4,a4,1
80003abc:	88e1a223          	sw	a4,-1916(gp) # 800032f4 <events_mac_rx>
80003ac0:	0047a703          	lw	a4,4(a5)
80003ac4:	ffb77713          	andi	a4,a4,-5
80003ac8:	00e7a223          	sw	a4,4(a5)
80003acc:	f00607b7          	lui	a5,0xf0060
80003ad0:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x70048004>
80003ad4:	00877713          	andi	a4,a4,8
80003ad8:	02070c63          	beqz	a4,80003b10 <__global_pointer$+0xa0>
80003adc:	f0020737          	lui	a4,0xf0020
80003ae0:	000186b7          	lui	a3,0x18
80003ae4:	00072623          	sw	zero,12(a4) # f002000c <_ram_heap_end+0x7000800c>
80003ae8:	6a068693          	addi	a3,a3,1696 # 186a0 <_stack_size+0x176a0>
80003aec:	00d72823          	sw	a3,16(a4)
80003af0:	00100693          	li	a3,1
80003af4:	00d72023          	sw	a3,0(a4)
80003af8:	8881a703          	lw	a4,-1912(gp) # 800032f8 <events_mac_poll>
80003afc:	00170713          	addi	a4,a4,1
80003b00:	88e1a423          	sw	a4,-1912(gp) # 800032f8 <events_mac_poll>
80003b04:	0047a703          	lw	a4,4(a5)
80003b08:	ff777713          	andi	a4,a4,-9
80003b0c:	00e7a223          	sw	a4,4(a5)
80003b10:	f00607b7          	lui	a5,0xf0060
80003b14:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x70048004>
80003b18:	01077713          	andi	a4,a4,16
80003b1c:	02070c63          	beqz	a4,80003b54 <__global_pointer$+0xe4>
80003b20:	f0021737          	lui	a4,0xf0021
80003b24:	0000c6b7          	lui	a3,0xc
80003b28:	00072623          	sw	zero,12(a4) # f002100c <_ram_heap_end+0x7000900c>
80003b2c:	35068693          	addi	a3,a3,848 # c350 <_stack_size+0xb350>
80003b30:	00d72823          	sw	a3,16(a4)
80003b34:	00100693          	li	a3,1
80003b38:	00d72023          	sw	a3,0(a4)
80003b3c:	8801a703          	lw	a4,-1920(gp) # 800032f0 <events_modbus_rtu_poll>
80003b40:	00170713          	addi	a4,a4,1
80003b44:	88e1a023          	sw	a4,-1920(gp) # 800032f0 <events_modbus_rtu_poll>
80003b48:	0047a703          	lw	a4,4(a5)
80003b4c:	fef77713          	andi	a4,a4,-17
80003b50:	00e7a223          	sw	a4,4(a5)
80003b54:	f00607b7          	lui	a5,0xf0060
80003b58:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x70048004>
80003b5c:	02077713          	andi	a4,a4,32
80003b60:	00070863          	beqz	a4,80003b70 <__global_pointer$+0x100>
80003b64:	0047a703          	lw	a4,4(a5)
80003b68:	fdf77713          	andi	a4,a4,-33
80003b6c:	00e7a223          	sw	a4,4(a5)
80003b70:	f0060437          	lui	s0,0xf0060
80003b74:	00442783          	lw	a5,4(s0) # f0060004 <_ram_heap_end+0x70048004>
80003b78:	0407f793          	andi	a5,a5,64
80003b7c:	02078663          	beqz	a5,80003ba8 <__global_pointer$+0x138>
80003b80:	8781a783          	lw	a5,-1928(gp) # 800032e8 <audiodac0_irqs>
80003b84:	00178793          	addi	a5,a5,1
80003b88:	86f1ac23          	sw	a5,-1928(gp) # 800032e8 <audiodac0_irqs>
80003b8c:	4e4020ef          	jal	ra,80006070 <audiodac0_isr>
80003b90:	8741a783          	lw	a5,-1932(gp) # 800032e4 <audiodac0_samples_sent>
80003b94:	00f50533          	add	a0,a0,a5
80003b98:	86a1aa23          	sw	a0,-1932(gp) # 800032e4 <audiodac0_samples_sent>
80003b9c:	00442783          	lw	a5,4(s0)
80003ba0:	fbf7f793          	andi	a5,a5,-65
80003ba4:	00f42223          	sw	a5,4(s0)
80003ba8:	00c12083          	lw	ra,12(sp)
80003bac:	00812403          	lw	s0,8(sp)
80003bb0:	01010113          	addi	sp,sp,16
80003bb4:	00008067          	ret
80003bb8:	00072783          	lw	a5,0(a4)
80003bbc:	0ff7f513          	andi	a0,a5,255
80003bc0:	0ff7f693          	andi	a3,a5,255
80003bc4:	00472783          	lw	a5,4(a4)
80003bc8:	0107d793          	srli	a5,a5,0x10
80003bcc:	0ff7f793          	andi	a5,a5,255
80003bd0:	fe078ae3          	beqz	a5,80003bc4 <__global_pointer$+0x154>
80003bd4:	00d72023          	sw	a3,0(a4)
80003bd8:	00b51a63          	bne	a0,a1,80003bec <__global_pointer$+0x17c>
80003bdc:	88c1a783          	lw	a5,-1908(gp) # 800032fc <uart_config_reset_counter>
80003be0:	00178793          	addi	a5,a5,1
80003be4:	88f1a623          	sw	a5,-1908(gp) # 800032fc <uart_config_reset_counter>
80003be8:	e79ff06f          	j	80003a60 <externalInterrupt+0x34>
80003bec:	8801a623          	sw	zero,-1908(gp) # 800032fc <uart_config_reset_counter>
80003bf0:	e71ff06f          	j	80003a60 <externalInterrupt+0x34>

80003bf4 <crash>:
80003bf4:	ff010113          	addi	sp,sp,-16
80003bf8:	00812423          	sw	s0,8(sp)
80003bfc:	00050593          	mv	a1,a0
80003c00:	92418513          	addi	a0,gp,-1756 # 80003394 <crash_str>
80003c04:	00112623          	sw	ra,12(sp)
80003c08:	c11ff0ef          	jal	ra,80003818 <to_hex>
80003c0c:	80002537          	lui	a0,0x80002
80003c10:	38450513          	addi	a0,a0,900 # 80002384 <_ram_heap_end+0xfffea384>
80003c14:	0f9020ef          	jal	ra,8000650c <print_uart0>
80003c18:	92418513          	addi	a0,gp,-1756 # 80003394 <crash_str>
80003c1c:	0f1020ef          	jal	ra,8000650c <print_uart0>
80003c20:	00812403          	lw	s0,8(sp)
80003c24:	00c12083          	lw	ra,12(sp)
80003c28:	80003537          	lui	a0,0x80003
80003c2c:	8e850513          	addi	a0,a0,-1816 # 800028e8 <_ram_heap_end+0xfffea8e8>
80003c30:	01010113          	addi	sp,sp,16
80003c34:	0d90206f          	j	8000650c <print_uart0>

80003c38 <irqCallback>:
80003c38:	89c1a783          	lw	a5,-1892(gp) # 8000330c <reg_irq_counter>
80003c3c:	00178793          	addi	a5,a5,1
80003c40:	88f1ae23          	sw	a5,-1892(gp) # 8000330c <reg_irq_counter>
80003c44:	342027f3          	csrr	a5,mcause
80003c48:	0207d263          	bgez	a5,80003c6c <irqCallback+0x34>
80003c4c:	00f7f793          	andi	a5,a5,15
80003c50:	00700713          	li	a4,7
80003c54:	02e78063          	beq	a5,a4,80003c74 <irqCallback+0x3c>
80003c58:	00b00713          	li	a4,11
80003c5c:	00e79463          	bne	a5,a4,80003c64 <irqCallback+0x2c>
80003c60:	dcdff06f          	j	80003a2c <externalInterrupt>
80003c64:	00200513          	li	a0,2
80003c68:	f8dff06f          	j	80003bf4 <crash>
80003c6c:	00100513          	li	a0,1
80003c70:	ff9ff06f          	j	80003c68 <irqCallback+0x30>
80003c74:	00008067          	ret

80003c78 <modbus_rtu_init>:
80003c78:	fe010113          	addi	sp,sp,-32
80003c7c:	00112e23          	sw	ra,28(sp)
80003c80:	00812c23          	sw	s0,24(sp)
80003c84:	f0011437          	lui	s0,0xf0011
80003c88:	00842783          	lw	a5,8(s0) # f0011008 <_ram_heap_end+0x6fff9008>
80003c8c:	9cc1a583          	lw	a1,-1588(gp) # 8000343c <active_config+0x18>
80003c90:	03938537          	lui	a0,0x3938
80003c94:	70050513          	addi	a0,a0,1792 # 3938700 <_stack_size+0x3937700>
80003c98:	00f12623          	sw	a5,12(sp)
80003c9c:	7cd090ef          	jal	ra,8000dc68 <__udivsi3>
80003ca0:	00500593          	li	a1,5
80003ca4:	7c5090ef          	jal	ra,8000dc68 <__udivsi3>
80003ca8:	fff50713          	addi	a4,a0,-1
80003cac:	00e42423          	sw	a4,8(s0)
80003cb0:	00600693          	li	a3,6
80003cb4:	00d42623          	sw	a3,12(s0)
80003cb8:	00c12783          	lw	a5,12(sp)
80003cbc:	80002537          	lui	a0,0x80002
80003cc0:	00000693          	li	a3,0
80003cc4:	00000613          	li	a2,0
80003cc8:	00700593          	li	a1,7
80003ccc:	39450513          	addi	a0,a0,916 # 80002394 <_ram_heap_end+0xfffea394>
80003cd0:	2780b0ef          	jal	ra,8000ef48 <iprintf>
80003cd4:	f00b07b7          	lui	a5,0xf00b0
80003cd8:	0007a603          	lw	a2,0(a5) # f00b0000 <_ram_heap_end+0x70098000>
80003cdc:	0047a683          	lw	a3,4(a5)
80003ce0:	8ac1a023          	sw	a2,-1888(gp) # 80003310 <modbus_rtu_rx_timestamp>
80003ce4:	01c12083          	lw	ra,28(sp)
80003ce8:	01812403          	lw	s0,24(sp)
80003cec:	8ad1a223          	sw	a3,-1884(gp) # 80003314 <modbus_rtu_rx_timestamp+0x4>
80003cf0:	8a01a423          	sw	zero,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003cf4:	02010113          	addi	sp,sp,32
80003cf8:	00008067          	ret

80003cfc <modbus_rtu_poll>:
80003cfc:	ef010113          	addi	sp,sp,-272
80003d00:	10812423          	sw	s0,264(sp)
80003d04:	8a81a783          	lw	a5,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003d08:	10112623          	sw	ra,268(sp)
80003d0c:	10912223          	sw	s1,260(sp)
80003d10:	08078e63          	beqz	a5,80003dac <modbus_rtu_poll+0xb0>
80003d14:	f00b07b7          	lui	a5,0xf00b0
80003d18:	0047a803          	lw	a6,4(a5) # f00b0004 <_ram_heap_end+0x70098004>
80003d1c:	0007a783          	lw	a5,0(a5)
80003d20:	8a01a503          	lw	a0,-1888(gp) # 80003310 <modbus_rtu_rx_timestamp>
80003d24:	8a41a583          	lw	a1,-1884(gp) # 80003314 <modbus_rtu_rx_timestamp+0x4>
80003d28:	40a786b3          	sub	a3,a5,a0
80003d2c:	00d7b733          	sltu	a4,a5,a3
80003d30:	40b807b3          	sub	a5,a6,a1
80003d34:	00e79863          	bne	a5,a4,80003d44 <modbus_rtu_poll+0x48>
80003d38:	000027b7          	lui	a5,0x2
80003d3c:	70f78793          	addi	a5,a5,1807 # 270f <_stack_size+0x170f>
80003d40:	06d7f663          	bgeu	a5,a3,80003dac <modbus_rtu_poll+0xb0>
80003d44:	8a81a483          	lw	s1,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003d48:	08000793          	li	a5,128
80003d4c:	00048613          	mv	a2,s1
80003d50:	0097f463          	bgeu	a5,s1,80003d58 <modbus_rtu_poll+0x5c>
80003d54:	08000613          	li	a2,128
80003d58:	93418593          	addi	a1,gp,-1740 # 800033a4 <modbus_rtu_rx_buf>
80003d5c:	00010513          	mv	a0,sp
80003d60:	5a90a0ef          	jal	ra,8000eb08 <memcpy>
80003d64:	08010613          	addi	a2,sp,128
80003d68:	00048593          	mv	a1,s1
80003d6c:	00010513          	mv	a0,sp
80003d70:	8a01a423          	sw	zero,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003d74:	65d000ef          	jal	ra,80004bd0 <modbus_recv>
80003d78:	02050a63          	beqz	a0,80003dac <modbus_rtu_poll+0xb0>
80003d7c:	00000713          	li	a4,0
80003d80:	f00116b7          	lui	a3,0xf0011
80003d84:	08010793          	addi	a5,sp,128
80003d88:	00e787b3          	add	a5,a5,a4
80003d8c:	0007c603          	lbu	a2,0(a5)
80003d90:	0046a783          	lw	a5,4(a3) # f0011004 <_ram_heap_end+0x6fff9004>
80003d94:	0107d793          	srli	a5,a5,0x10
80003d98:	0ff7f793          	andi	a5,a5,255
80003d9c:	fe078ae3          	beqz	a5,80003d90 <modbus_rtu_poll+0x94>
80003da0:	00c6a023          	sw	a2,0(a3)
80003da4:	00170713          	addi	a4,a4,1
80003da8:	fce51ee3          	bne	a0,a4,80003d84 <modbus_rtu_poll+0x88>
80003dac:	10c12083          	lw	ra,268(sp)
80003db0:	10812403          	lw	s0,264(sp)
80003db4:	10412483          	lw	s1,260(sp)
80003db8:	11010113          	addi	sp,sp,272
80003dbc:	00008067          	ret

80003dc0 <modbus_rtu_rx>:
80003dc0:	ff010113          	addi	sp,sp,-16
80003dc4:	00812423          	sw	s0,8(sp)
80003dc8:	00912223          	sw	s1,4(sp)
80003dcc:	00112623          	sw	ra,12(sp)
80003dd0:	f00117b7          	lui	a5,0xf0011
80003dd4:	0007a683          	lw	a3,0(a5) # f0011000 <_ram_heap_end+0x6fff9000>
80003dd8:	8a81a603          	lw	a2,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003ddc:	0ff6f693          	andi	a3,a3,255
80003de0:	00160793          	addi	a5,a2,1 # 80001 <_stack_size+0x7f001>
80003de4:	8af1a423          	sw	a5,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003de8:	93418713          	addi	a4,gp,-1740 # 800033a4 <modbus_rtu_rx_buf>
80003dec:	00c70733          	add	a4,a4,a2
80003df0:	00d70023          	sb	a3,0(a4)
80003df4:	8a81a683          	lw	a3,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003df8:	07f00713          	li	a4,127
80003dfc:	93418493          	addi	s1,gp,-1740 # 800033a4 <modbus_rtu_rx_buf>
80003e00:	00d77463          	bgeu	a4,a3,80003e08 <modbus_rtu_rx+0x48>
80003e04:	8a01a423          	sw	zero,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003e08:	f0011737          	lui	a4,0xf0011
80003e0c:	00472783          	lw	a5,4(a4) # f0011004 <_ram_heap_end+0x6fff9004>
80003e10:	0187d793          	srli	a5,a5,0x18
80003e14:	02079663          	bnez	a5,80003e40 <modbus_rtu_rx+0x80>
80003e18:	f00b07b7          	lui	a5,0xf00b0
80003e1c:	0007a603          	lw	a2,0(a5) # f00b0000 <_ram_heap_end+0x70098000>
80003e20:	0047a683          	lw	a3,4(a5)
80003e24:	00c12083          	lw	ra,12(sp)
80003e28:	00812403          	lw	s0,8(sp)
80003e2c:	8ac1a023          	sw	a2,-1888(gp) # 80003310 <modbus_rtu_rx_timestamp>
80003e30:	8ad1a223          	sw	a3,-1884(gp) # 80003314 <modbus_rtu_rx_timestamp+0x4>
80003e34:	00412483          	lw	s1,4(sp)
80003e38:	01010113          	addi	sp,sp,16
80003e3c:	00008067          	ret
80003e40:	00472583          	lw	a1,4(a4)
80003e44:	8a81a603          	lw	a2,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003e48:	80002537          	lui	a0,0x80002
80003e4c:	0185d593          	srli	a1,a1,0x18
80003e50:	3f450513          	addi	a0,a0,1012 # 800023f4 <_ram_heap_end+0xfffea3f4>
80003e54:	0f40b0ef          	jal	ra,8000ef48 <iprintf>
80003e58:	f00116b7          	lui	a3,0xf0011
80003e5c:	07f00613          	li	a2,127
80003e60:	0046a783          	lw	a5,4(a3) # f0011004 <_ram_heap_end+0x6fff9004>
80003e64:	0187d793          	srli	a5,a5,0x18
80003e68:	fa0788e3          	beqz	a5,80003e18 <modbus_rtu_rx+0x58>
80003e6c:	0006a703          	lw	a4,0(a3)
80003e70:	8a81a783          	lw	a5,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003e74:	0ff77713          	andi	a4,a4,255
80003e78:	00178593          	addi	a1,a5,1
80003e7c:	8ab1a423          	sw	a1,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003e80:	00f487b3          	add	a5,s1,a5
80003e84:	00e78023          	sb	a4,0(a5)
80003e88:	8a81a783          	lw	a5,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003e8c:	fcf67ae3          	bgeu	a2,a5,80003e60 <modbus_rtu_rx+0xa0>
80003e90:	8a01a423          	sw	zero,-1880(gp) # 80003318 <modbus_rtu_rx_len>
80003e94:	fcdff06f          	j	80003e60 <modbus_rtu_rx+0xa0>

80003e98 <config_load>:
80003e98:	0c050863          	beqz	a0,80003f68 <config_load+0xd0>
80003e9c:	fe010113          	addi	sp,sp,-32
80003ea0:	00812c23          	sw	s0,24(sp)
80003ea4:	00912a23          	sw	s1,20(sp)
80003ea8:	01212823          	sw	s2,16(sp)
80003eac:	01312623          	sw	s3,12(sp)
80003eb0:	00112e23          	sw	ra,28(sp)
80003eb4:	00050413          	mv	s0,a0
80003eb8:	00050913          	mv	s2,a0
80003ebc:	00000493          	li	s1,0
80003ec0:	02000993          	li	s3,32
80003ec4:	00090713          	mv	a4,s2
80003ec8:	00400693          	li	a3,4
80003ecc:	00048613          	mv	a2,s1
80003ed0:	05000593          	li	a1,80
80003ed4:	f0090537          	lui	a0,0xf0090
80003ed8:	3fc000ef          	jal	ra,800042d4 <eeprom_read_page>
80003edc:	00400793          	li	a5,4
80003ee0:	02f50a63          	beq	a0,a5,80003f14 <config_load+0x7c>
80003ee4:	80002537          	lui	a0,0x80002
80003ee8:	00400593          	li	a1,4
80003eec:	42c50513          	addi	a0,a0,1068 # 8000242c <_ram_heap_end+0xfffea42c>
80003ef0:	0580b0ef          	jal	ra,8000ef48 <iprintf>
80003ef4:	ffe00513          	li	a0,-2
80003ef8:	01c12083          	lw	ra,28(sp)
80003efc:	01812403          	lw	s0,24(sp)
80003f00:	01412483          	lw	s1,20(sp)
80003f04:	01012903          	lw	s2,16(sp)
80003f08:	00c12983          	lw	s3,12(sp)
80003f0c:	02010113          	addi	sp,sp,32
80003f10:	00008067          	ret
80003f14:	00448493          	addi	s1,s1,4
80003f18:	0ff4f493          	andi	s1,s1,255
80003f1c:	00490913          	addi	s2,s2,4
80003f20:	fb3492e3          	bne	s1,s3,80003ec4 <config_load+0x2c>
80003f24:	01e00593          	li	a1,30
80003f28:	00040513          	mv	a0,s0
80003f2c:	819ff0ef          	jal	ra,80003744 <crc16>
80003f30:	01e45603          	lhu	a2,30(s0)
80003f34:	00050593          	mv	a1,a0
80003f38:	00a60c63          	beq	a2,a0,80003f50 <config_load+0xb8>
80003f3c:	80002537          	lui	a0,0x80002
80003f40:	46050513          	addi	a0,a0,1120 # 80002460 <_ram_heap_end+0xfffea460>
80003f44:	0040b0ef          	jal	ra,8000ef48 <iprintf>
80003f48:	ffd00513          	li	a0,-3
80003f4c:	fadff06f          	j	80003ef8 <config_load+0x60>
80003f50:	80002537          	lui	a0,0x80002
80003f54:	02000593          	li	a1,32
80003f58:	49450513          	addi	a0,a0,1172 # 80002494 <_ram_heap_end+0xfffea494>
80003f5c:	7ed0a0ef          	jal	ra,8000ef48 <iprintf>
80003f60:	00000513          	li	a0,0
80003f64:	f95ff06f          	j	80003ef8 <config_load+0x60>
80003f68:	fff00513          	li	a0,-1
80003f6c:	00008067          	ret

80003f70 <config_save>:
80003f70:	fe010113          	addi	sp,sp,-32
80003f74:	00912a23          	sw	s1,20(sp)
80003f78:	00112e23          	sw	ra,28(sp)
80003f7c:	00812c23          	sw	s0,24(sp)
80003f80:	01212823          	sw	s2,16(sp)
80003f84:	01312623          	sw	s3,12(sp)
80003f88:	01412423          	sw	s4,8(sp)
80003f8c:	01512223          	sw	s5,4(sp)
80003f90:	fff00493          	li	s1,-1
80003f94:	06050063          	beqz	a0,80003ff4 <config_save+0x84>
80003f98:	01e00593          	li	a1,30
80003f9c:	00050413          	mv	s0,a0
80003fa0:	fa4ff0ef          	jal	ra,80003744 <crc16>
80003fa4:	00a41f23          	sh	a0,30(s0)
80003fa8:	00000913          	li	s2,0
80003fac:	00000993          	li	s3,0
80003fb0:	00800a93          	li	s5,8
80003fb4:	01240733          	add	a4,s0,s2
80003fb8:	00400693          	li	a3,4
80003fbc:	0ff97613          	andi	a2,s2,255
80003fc0:	05000593          	li	a1,80
80003fc4:	f0090537          	lui	a0,0xf0090
80003fc8:	0b8000ef          	jal	ra,80004080 <eeprom_write_page>
80003fcc:	00400793          	li	a5,4
80003fd0:	04f50663          	beq	a0,a5,8000401c <config_save+0xac>
80003fd4:	80002537          	lui	a0,0x80002
80003fd8:	00090713          	mv	a4,s2
80003fdc:	00098693          	mv	a3,s3
80003fe0:	00400613          	li	a2,4
80003fe4:	05000593          	li	a1,80
80003fe8:	4cc50513          	addi	a0,a0,1228 # 800024cc <_ram_heap_end+0xfffea4cc>
80003fec:	75d0a0ef          	jal	ra,8000ef48 <iprintf>
80003ff0:	ffe00493          	li	s1,-2
80003ff4:	01c12083          	lw	ra,28(sp)
80003ff8:	01812403          	lw	s0,24(sp)
80003ffc:	00048513          	mv	a0,s1
80004000:	01012903          	lw	s2,16(sp)
80004004:	01412483          	lw	s1,20(sp)
80004008:	00c12983          	lw	s3,12(sp)
8000400c:	00812a03          	lw	s4,8(sp)
80004010:	00412a83          	lw	s5,4(sp)
80004014:	02010113          	addi	sp,sp,32
80004018:	00008067          	ret
8000401c:	00a00a13          	li	s4,10
80004020:	05000593          	li	a1,80
80004024:	f0090537          	lui	a0,0xf0090
80004028:	228000ef          	jal	ra,80004250 <eeprom_poll>
8000402c:	00050493          	mv	s1,a0
80004030:	02050663          	beqz	a0,8000405c <config_save+0xec>
80004034:	3e800513          	li	a0,1000
80004038:	fffa0a13          	addi	s4,s4,-1
8000403c:	4a0020ef          	jal	ra,800064dc <delay_us>
80004040:	fe0a10e3          	bnez	s4,80004020 <config_save+0xb0>
80004044:	80002537          	lui	a0,0x80002
80004048:	05000593          	li	a1,80
8000404c:	54c50513          	addi	a0,a0,1356 # 8000254c <_ram_heap_end+0xfffea54c>
80004050:	6f90a0ef          	jal	ra,8000ef48 <iprintf>
80004054:	ffd00493          	li	s1,-3
80004058:	f9dff06f          	j	80003ff4 <config_save+0x84>
8000405c:	00198993          	addi	s3,s3,1 # 90080001 <_ram_heap_end+0x10068001>
80004060:	00490913          	addi	s2,s2,4
80004064:	f55998e3          	bne	s3,s5,80003fb4 <config_save+0x44>
80004068:	01e45603          	lhu	a2,30(s0)
8000406c:	80002537          	lui	a0,0x80002
80004070:	02000593          	li	a1,32
80004074:	51450513          	addi	a0,a0,1300 # 80002514 <_ram_heap_end+0xfffea514>
80004078:	6d10a0ef          	jal	ra,8000ef48 <iprintf>
8000407c:	f79ff06f          	j	80003ff4 <config_save+0x84>

80004080 <eeprom_write_page>:
80004080:	fe010113          	addi	sp,sp,-32
80004084:	00812c23          	sw	s0,24(sp)
80004088:	00912a23          	sw	s1,20(sp)
8000408c:	01212823          	sw	s2,16(sp)
80004090:	01412423          	sw	s4,8(sp)
80004094:	01512223          	sw	s5,4(sp)
80004098:	00112e23          	sw	ra,28(sp)
8000409c:	01312623          	sw	s3,12(sp)
800040a0:	01612023          	sw	s6,0(sp)
800040a4:	01500793          	li	a5,21
800040a8:	00159593          	slli	a1,a1,0x1
800040ac:	00f52623          	sw	a5,12(a0)
800040b0:	00018937          	lui	s2,0x18
800040b4:	00b52023          	sw	a1,0(a0)
800040b8:	6a090593          	addi	a1,s2,1696 # 186a0 <_stack_size+0x176a0>
800040bc:	00050413          	mv	s0,a0
800040c0:	00060493          	mv	s1,a2
800040c4:	00068a13          	mv	s4,a3
800040c8:	00070a93          	mv	s5,a4
800040cc:	35c020ef          	jal	ra,80006428 <i2c_wait_for_busy>
800040d0:	04051663          	bnez	a0,8000411c <eeprom_write_page+0x9c>
800040d4:	00042623          	sw	zero,12(s0)
800040d8:	00100613          	li	a2,1
800040dc:	80002537          	lui	a0,0x80002
800040e0:	00040593          	mv	a1,s0
800040e4:	57c50513          	addi	a0,a0,1404 # 8000257c <_ram_heap_end+0xfffea57c>
800040e8:	6610a0ef          	jal	ra,8000ef48 <iprintf>
800040ec:	fff00493          	li	s1,-1
800040f0:	01c12083          	lw	ra,28(sp)
800040f4:	01812403          	lw	s0,24(sp)
800040f8:	00048513          	mv	a0,s1
800040fc:	01012903          	lw	s2,16(sp)
80004100:	01412483          	lw	s1,20(sp)
80004104:	00c12983          	lw	s3,12(sp)
80004108:	00812a03          	lw	s4,8(sp)
8000410c:	00412a83          	lw	s5,4(sp)
80004110:	00012b03          	lw	s6,0(sp)
80004114:	02010113          	addi	sp,sp,32
80004118:	00008067          	ret
8000411c:	6a090593          	addi	a1,s2,1696
80004120:	00040513          	mv	a0,s0
80004124:	330020ef          	jal	ra,80006454 <i2c_wait_for_release>
80004128:	00051863          	bnez	a0,80004138 <eeprom_write_page+0xb8>
8000412c:	00042623          	sw	zero,12(s0)
80004130:	00200613          	li	a2,2
80004134:	fa9ff06f          	j	800040dc <eeprom_write_page+0x5c>
80004138:	00c42783          	lw	a5,12(s0)
8000413c:	0407f793          	andi	a5,a5,64
80004140:	00078e63          	beqz	a5,8000415c <eeprom_write_page+0xdc>
80004144:	00042623          	sw	zero,12(s0)
80004148:	00100613          	li	a2,1
8000414c:	80002537          	lui	a0,0x80002
80004150:	00040593          	mv	a1,s0
80004154:	5ac50513          	addi	a0,a0,1452 # 800025ac <_ram_heap_end+0xfffea5ac>
80004158:	f91ff06f          	j	800040e8 <eeprom_write_page+0x68>
8000415c:	00200513          	li	a0,2
80004160:	37c020ef          	jal	ra,800064dc <delay_us>
80004164:	01100793          	li	a5,17
80004168:	00f42623          	sw	a5,12(s0)
8000416c:	00942023          	sw	s1,0(s0)
80004170:	6a090593          	addi	a1,s2,1696
80004174:	00040513          	mv	a0,s0
80004178:	2b0020ef          	jal	ra,80006428 <i2c_wait_for_busy>
8000417c:	00051863          	bnez	a0,8000418c <eeprom_write_page+0x10c>
80004180:	00042623          	sw	zero,12(s0)
80004184:	00300613          	li	a2,3
80004188:	f55ff06f          	j	800040dc <eeprom_write_page+0x5c>
8000418c:	6a090593          	addi	a1,s2,1696
80004190:	00040513          	mv	a0,s0
80004194:	2c0020ef          	jal	ra,80006454 <i2c_wait_for_release>
80004198:	00051863          	bnez	a0,800041a8 <eeprom_write_page+0x128>
8000419c:	00042623          	sw	zero,12(s0)
800041a0:	00400613          	li	a2,4
800041a4:	f39ff06f          	j	800040dc <eeprom_write_page+0x5c>
800041a8:	00c42783          	lw	a5,12(s0)
800041ac:	00000993          	li	s3,0
800041b0:	0407f793          	andi	a5,a5,64
800041b4:	04079a63          	bnez	a5,80004208 <eeprom_write_page+0x188>
800041b8:	000a0493          	mv	s1,s4
800041bc:	fffa0b13          	addi	s6,s4,-1
800041c0:	6a090913          	addi	s2,s2,1696
800041c4:	f349d6e3          	bge	s3,s4,800040f0 <eeprom_write_page+0x70>
800041c8:	00200513          	li	a0,2
800041cc:	310020ef          	jal	ra,800064dc <delay_us>
800041d0:	01100793          	li	a5,17
800041d4:	013b1463          	bne	s6,s3,800041dc <eeprom_write_page+0x15c>
800041d8:	01900793          	li	a5,25
800041dc:	013a8733          	add	a4,s5,s3
800041e0:	00074703          	lbu	a4,0(a4)
800041e4:	00f42623          	sw	a5,12(s0)
800041e8:	00090593          	mv	a1,s2
800041ec:	00e42023          	sw	a4,0(s0)
800041f0:	00040513          	mv	a0,s0
800041f4:	234020ef          	jal	ra,80006428 <i2c_wait_for_busy>
800041f8:	00051e63          	bnez	a0,80004214 <eeprom_write_page+0x194>
800041fc:	00042623          	sw	zero,12(s0)
80004200:	00500613          	li	a2,5
80004204:	ed9ff06f          	j	800040dc <eeprom_write_page+0x5c>
80004208:	00042623          	sw	zero,12(s0)
8000420c:	00200613          	li	a2,2
80004210:	f3dff06f          	j	8000414c <eeprom_write_page+0xcc>
80004214:	00090593          	mv	a1,s2
80004218:	00040513          	mv	a0,s0
8000421c:	238020ef          	jal	ra,80006454 <i2c_wait_for_release>
80004220:	00051863          	bnez	a0,80004230 <eeprom_write_page+0x1b0>
80004224:	00042623          	sw	zero,12(s0)
80004228:	00600613          	li	a2,6
8000422c:	eb1ff06f          	j	800040dc <eeprom_write_page+0x5c>
80004230:	00c42783          	lw	a5,12(s0)
80004234:	0407f793          	andi	a5,a5,64
80004238:	00078863          	beqz	a5,80004248 <eeprom_write_page+0x1c8>
8000423c:	00042623          	sw	zero,12(s0)
80004240:	00300613          	li	a2,3
80004244:	f09ff06f          	j	8000414c <eeprom_write_page+0xcc>
80004248:	00198993          	addi	s3,s3,1
8000424c:	f79ff06f          	j	800041c4 <eeprom_write_page+0x144>

80004250 <eeprom_poll>:
80004250:	ff010113          	addi	sp,sp,-16
80004254:	00812423          	sw	s0,8(sp)
80004258:	00912223          	sw	s1,4(sp)
8000425c:	00112623          	sw	ra,12(sp)
80004260:	01d00793          	li	a5,29
80004264:	00159593          	slli	a1,a1,0x1
80004268:	00f52623          	sw	a5,12(a0)
8000426c:	000184b7          	lui	s1,0x18
80004270:	00b52023          	sw	a1,0(a0)
80004274:	6a048593          	addi	a1,s1,1696 # 186a0 <_stack_size+0x176a0>
80004278:	00050413          	mv	s0,a0
8000427c:	1ac020ef          	jal	ra,80006428 <i2c_wait_for_busy>
80004280:	00100613          	li	a2,1
80004284:	00050c63          	beqz	a0,8000429c <eeprom_poll+0x4c>
80004288:	6a048593          	addi	a1,s1,1696
8000428c:	00040513          	mv	a0,s0
80004290:	1c4020ef          	jal	ra,80006454 <i2c_wait_for_release>
80004294:	02051863          	bnez	a0,800042c4 <eeprom_poll+0x74>
80004298:	00200613          	li	a2,2
8000429c:	80002537          	lui	a0,0x80002
800042a0:	00040593          	mv	a1,s0
800042a4:	5dc50513          	addi	a0,a0,1500 # 800025dc <_ram_heap_end+0xfffea5dc>
800042a8:	4a10a0ef          	jal	ra,8000ef48 <iprintf>
800042ac:	fff00513          	li	a0,-1
800042b0:	00c12083          	lw	ra,12(sp)
800042b4:	00812403          	lw	s0,8(sp)
800042b8:	00412483          	lw	s1,4(sp)
800042bc:	01010113          	addi	sp,sp,16
800042c0:	00008067          	ret
800042c4:	00c42503          	lw	a0,12(s0)
800042c8:	00655513          	srli	a0,a0,0x6
800042cc:	00157513          	andi	a0,a0,1
800042d0:	fe1ff06f          	j	800042b0 <eeprom_poll+0x60>

800042d4 <eeprom_read_page>:
800042d4:	fd010113          	addi	sp,sp,-48
800042d8:	02812423          	sw	s0,40(sp)
800042dc:	02912223          	sw	s1,36(sp)
800042e0:	03212023          	sw	s2,32(sp)
800042e4:	01312e23          	sw	s3,28(sp)
800042e8:	01412c23          	sw	s4,24(sp)
800042ec:	01512a23          	sw	s5,20(sp)
800042f0:	01612823          	sw	s6,16(sp)
800042f4:	02112623          	sw	ra,44(sp)
800042f8:	01712623          	sw	s7,12(sp)
800042fc:	01500993          	li	s3,21
80004300:	00159493          	slli	s1,a1,0x1
80004304:	01352623          	sw	s3,12(a0)
80004308:	00018937          	lui	s2,0x18
8000430c:	00952023          	sw	s1,0(a0)
80004310:	6a090593          	addi	a1,s2,1696 # 186a0 <_stack_size+0x176a0>
80004314:	00050413          	mv	s0,a0
80004318:	00060b13          	mv	s6,a2
8000431c:	00068a13          	mv	s4,a3
80004320:	00070a93          	mv	s5,a4
80004324:	104020ef          	jal	ra,80006428 <i2c_wait_for_busy>
80004328:	00051e63          	bnez	a0,80004344 <eeprom_read_page+0x70>
8000432c:	00042623          	sw	zero,12(s0)
80004330:	00100613          	li	a2,1
80004334:	80002537          	lui	a0,0x80002
80004338:	00040593          	mv	a1,s0
8000433c:	60450513          	addi	a0,a0,1540 # 80002604 <_ram_heap_end+0xfffea604>
80004340:	0400006f          	j	80004380 <eeprom_read_page+0xac>
80004344:	6a090593          	addi	a1,s2,1696
80004348:	00040513          	mv	a0,s0
8000434c:	108020ef          	jal	ra,80006454 <i2c_wait_for_release>
80004350:	00051863          	bnez	a0,80004360 <eeprom_read_page+0x8c>
80004354:	00042623          	sw	zero,12(s0)
80004358:	00200613          	li	a2,2
8000435c:	fd9ff06f          	j	80004334 <eeprom_read_page+0x60>
80004360:	00c42783          	lw	a5,12(s0)
80004364:	0407f793          	andi	a5,a5,64
80004368:	04078863          	beqz	a5,800043b8 <eeprom_read_page+0xe4>
8000436c:	00042623          	sw	zero,12(s0)
80004370:	00100613          	li	a2,1
80004374:	80002537          	lui	a0,0x80002
80004378:	00040593          	mv	a1,s0
8000437c:	63450513          	addi	a0,a0,1588 # 80002634 <_ram_heap_end+0xfffea634>
80004380:	3c90a0ef          	jal	ra,8000ef48 <iprintf>
80004384:	fff00493          	li	s1,-1
80004388:	02c12083          	lw	ra,44(sp)
8000438c:	02812403          	lw	s0,40(sp)
80004390:	00048513          	mv	a0,s1
80004394:	02012903          	lw	s2,32(sp)
80004398:	02412483          	lw	s1,36(sp)
8000439c:	01c12983          	lw	s3,28(sp)
800043a0:	01812a03          	lw	s4,24(sp)
800043a4:	01412a83          	lw	s5,20(sp)
800043a8:	01012b03          	lw	s6,16(sp)
800043ac:	00c12b83          	lw	s7,12(sp)
800043b0:	03010113          	addi	sp,sp,48
800043b4:	00008067          	ret
800043b8:	00200513          	li	a0,2
800043bc:	120020ef          	jal	ra,800064dc <delay_us>
800043c0:	01900793          	li	a5,25
800043c4:	00f42623          	sw	a5,12(s0)
800043c8:	01642023          	sw	s6,0(s0)
800043cc:	6a090593          	addi	a1,s2,1696
800043d0:	00040513          	mv	a0,s0
800043d4:	054020ef          	jal	ra,80006428 <i2c_wait_for_busy>
800043d8:	00051863          	bnez	a0,800043e8 <eeprom_read_page+0x114>
800043dc:	00042623          	sw	zero,12(s0)
800043e0:	00300613          	li	a2,3
800043e4:	f51ff06f          	j	80004334 <eeprom_read_page+0x60>
800043e8:	6a090593          	addi	a1,s2,1696
800043ec:	00040513          	mv	a0,s0
800043f0:	064020ef          	jal	ra,80006454 <i2c_wait_for_release>
800043f4:	00051863          	bnez	a0,80004404 <eeprom_read_page+0x130>
800043f8:	00042623          	sw	zero,12(s0)
800043fc:	00400613          	li	a2,4
80004400:	f35ff06f          	j	80004334 <eeprom_read_page+0x60>
80004404:	00c42783          	lw	a5,12(s0)
80004408:	0407f793          	andi	a5,a5,64
8000440c:	00078863          	beqz	a5,8000441c <eeprom_read_page+0x148>
80004410:	00042623          	sw	zero,12(s0)
80004414:	00200613          	li	a2,2
80004418:	f5dff06f          	j	80004374 <eeprom_read_page+0xa0>
8000441c:	00200513          	li	a0,2
80004420:	0bc020ef          	jal	ra,800064dc <delay_us>
80004424:	0014e493          	ori	s1,s1,1
80004428:	01342623          	sw	s3,12(s0)
8000442c:	00942023          	sw	s1,0(s0)
80004430:	6a090593          	addi	a1,s2,1696
80004434:	00040513          	mv	a0,s0
80004438:	7f1010ef          	jal	ra,80006428 <i2c_wait_for_busy>
8000443c:	00051863          	bnez	a0,8000444c <eeprom_read_page+0x178>
80004440:	00042623          	sw	zero,12(s0)
80004444:	00500613          	li	a2,5
80004448:	eedff06f          	j	80004334 <eeprom_read_page+0x60>
8000444c:	6a090593          	addi	a1,s2,1696
80004450:	00040513          	mv	a0,s0
80004454:	000020ef          	jal	ra,80006454 <i2c_wait_for_release>
80004458:	00051863          	bnez	a0,80004468 <eeprom_read_page+0x194>
8000445c:	00042623          	sw	zero,12(s0)
80004460:	00600613          	li	a2,6
80004464:	ed1ff06f          	j	80004334 <eeprom_read_page+0x60>
80004468:	00c42783          	lw	a5,12(s0)
8000446c:	00000993          	li	s3,0
80004470:	0407f793          	andi	a5,a5,64
80004474:	04079863          	bnez	a5,800044c4 <eeprom_read_page+0x1f0>
80004478:	000a0493          	mv	s1,s4
8000447c:	fffa0b13          	addi	s6,s4,-1
80004480:	0ff00b93          	li	s7,255
80004484:	6a090913          	addi	s2,s2,1696
80004488:	f149d0e3          	bge	s3,s4,80004388 <eeprom_read_page+0xb4>
8000448c:	00200513          	li	a0,2
80004490:	04c020ef          	jal	ra,800064dc <delay_us>
80004494:	02100793          	li	a5,33
80004498:	013b1463          	bne	s6,s3,800044a0 <eeprom_read_page+0x1cc>
8000449c:	00900793          	li	a5,9
800044a0:	00f42623          	sw	a5,12(s0)
800044a4:	01742023          	sw	s7,0(s0)
800044a8:	00090593          	mv	a1,s2
800044ac:	00040513          	mv	a0,s0
800044b0:	779010ef          	jal	ra,80006428 <i2c_wait_for_busy>
800044b4:	00051e63          	bnez	a0,800044d0 <eeprom_read_page+0x1fc>
800044b8:	00042623          	sw	zero,12(s0)
800044bc:	00700613          	li	a2,7
800044c0:	e75ff06f          	j	80004334 <eeprom_read_page+0x60>
800044c4:	00042623          	sw	zero,12(s0)
800044c8:	00300613          	li	a2,3
800044cc:	ea9ff06f          	j	80004374 <eeprom_read_page+0xa0>
800044d0:	00090593          	mv	a1,s2
800044d4:	00040513          	mv	a0,s0
800044d8:	77d010ef          	jal	ra,80006454 <i2c_wait_for_release>
800044dc:	00051863          	bnez	a0,800044ec <eeprom_read_page+0x218>
800044e0:	00042623          	sw	zero,12(s0)
800044e4:	00800613          	li	a2,8
800044e8:	e4dff06f          	j	80004334 <eeprom_read_page+0x60>
800044ec:	00442703          	lw	a4,4(s0)
800044f0:	013a87b3          	add	a5,s5,s3
800044f4:	00198993          	addi	s3,s3,1
800044f8:	00e78023          	sb	a4,0(a5)
800044fc:	f8dff06f          	j	80004488 <eeprom_read_page+0x1b4>

80004500 <eeprom_probe>:
80004500:	fe010113          	addi	sp,sp,-32
80004504:	00912a23          	sw	s1,20(sp)
80004508:	00050493          	mv	s1,a0
8000450c:	80002537          	lui	a0,0x80002
80004510:	05000593          	li	a1,80
80004514:	66050513          	addi	a0,a0,1632 # 80002660 <_ram_heap_end+0xfffea660>
80004518:	00112e23          	sw	ra,28(sp)
8000451c:	01212823          	sw	s2,16(sp)
80004520:	00812c23          	sw	s0,24(sp)
80004524:	2250a0ef          	jal	ra,8000ef48 <iprintf>
80004528:	deadc7b7          	lui	a5,0xdeadc
8000452c:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac3eef>
80004530:	00c10713          	addi	a4,sp,12
80004534:	00400693          	li	a3,4
80004538:	07c00613          	li	a2,124
8000453c:	05000593          	li	a1,80
80004540:	00048513          	mv	a0,s1
80004544:	00f12623          	sw	a5,12(sp)
80004548:	b39ff0ef          	jal	ra,80004080 <eeprom_write_page>
8000454c:	00400793          	li	a5,4
80004550:	00a00913          	li	s2,10
80004554:	00f50c63          	beq	a0,a5,8000456c <eeprom_probe+0x6c>
80004558:	80002537          	lui	a0,0x80002
8000455c:	05000593          	li	a1,80
80004560:	67c50513          	addi	a0,a0,1660 # 8000267c <_ram_heap_end+0xfffea67c>
80004564:	1e50a0ef          	jal	ra,8000ef48 <iprintf>
80004568:	0580006f          	j	800045c0 <eeprom_probe+0xc0>
8000456c:	05000593          	li	a1,80
80004570:	00048513          	mv	a0,s1
80004574:	cddff0ef          	jal	ra,80004250 <eeprom_poll>
80004578:	00050413          	mv	s0,a0
8000457c:	06050a63          	beqz	a0,800045f0 <eeprom_probe+0xf0>
80004580:	3e800513          	li	a0,1000
80004584:	fff90913          	addi	s2,s2,-1
80004588:	755010ef          	jal	ra,800064dc <delay_us>
8000458c:	fe0910e3          	bnez	s2,8000456c <eeprom_probe+0x6c>
80004590:	80002537          	lui	a0,0x80002
80004594:	05000593          	li	a1,80
80004598:	72050513          	addi	a0,a0,1824 # 80002720 <_ram_heap_end+0xfffea720>
8000459c:	fc9ff06f          	j	80004564 <eeprom_probe+0x64>
800045a0:	00c12603          	lw	a2,12(sp)
800045a4:	deadc7b7          	lui	a5,0xdeadc
800045a8:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac3eef>
800045ac:	05000593          	li	a1,80
800045b0:	00f60c63          	beq	a2,a5,800045c8 <eeprom_probe+0xc8>
800045b4:	80002537          	lui	a0,0x80002
800045b8:	6d450513          	addi	a0,a0,1748 # 800026d4 <_ram_heap_end+0xfffea6d4>
800045bc:	18d0a0ef          	jal	ra,8000ef48 <iprintf>
800045c0:	fff00413          	li	s0,-1
800045c4:	0100006f          	j	800045d4 <eeprom_probe+0xd4>
800045c8:	80002537          	lui	a0,0x80002
800045cc:	70850513          	addi	a0,a0,1800 # 80002708 <_ram_heap_end+0xfffea708>
800045d0:	1790a0ef          	jal	ra,8000ef48 <iprintf>
800045d4:	00040513          	mv	a0,s0
800045d8:	01c12083          	lw	ra,28(sp)
800045dc:	01812403          	lw	s0,24(sp)
800045e0:	01412483          	lw	s1,20(sp)
800045e4:	01012903          	lw	s2,16(sp)
800045e8:	02010113          	addi	sp,sp,32
800045ec:	00008067          	ret
800045f0:	00c10713          	addi	a4,sp,12
800045f4:	00400693          	li	a3,4
800045f8:	07c00613          	li	a2,124
800045fc:	05000593          	li	a1,80
80004600:	00048513          	mv	a0,s1
80004604:	00012623          	sw	zero,12(sp)
80004608:	ccdff0ef          	jal	ra,800042d4 <eeprom_read_page>
8000460c:	00400793          	li	a5,4
80004610:	f8f508e3          	beq	a0,a5,800045a0 <eeprom_probe+0xa0>
80004614:	80002537          	lui	a0,0x80002
80004618:	05000593          	li	a1,80
8000461c:	6a850513          	addi	a0,a0,1704 # 800026a8 <_ram_heap_end+0xfffea6a8>
80004620:	f45ff06f          	j	80004564 <eeprom_probe+0x64>

80004624 <modbus_error>:
80004624:	ff010113          	addi	sp,sp,-16
80004628:	00812423          	sw	s0,8(sp)
8000462c:	00912223          	sw	s1,4(sp)
80004630:	01212023          	sw	s2,0(sp)
80004634:	00060413          	mv	s0,a2
80004638:	00058913          	mv	s2,a1
8000463c:	00058613          	mv	a2,a1
80004640:	00050493          	mv	s1,a0
80004644:	00050593          	mv	a1,a0
80004648:	80002537          	lui	a0,0x80002
8000464c:	79450513          	addi	a0,a0,1940 # 80002794 <_ram_heap_end+0xfffea794>
80004650:	00112623          	sw	ra,12(sp)
80004654:	0f50a0ef          	jal	ra,8000ef48 <iprintf>
80004658:	9c81c783          	lbu	a5,-1592(gp) # 80003438 <active_config+0x14>
8000465c:	f804e493          	ori	s1,s1,-128
80004660:	009400a3          	sb	s1,1(s0)
80004664:	01240123          	sb	s2,2(s0)
80004668:	00040513          	mv	a0,s0
8000466c:	00f40023          	sb	a5,0(s0)
80004670:	00300593          	li	a1,3
80004674:	928ff0ef          	jal	ra,8000379c <add_crc>
80004678:	00c12083          	lw	ra,12(sp)
8000467c:	00812403          	lw	s0,8(sp)
80004680:	00412483          	lw	s1,4(sp)
80004684:	00012903          	lw	s2,0(sp)
80004688:	00500513          	li	a0,5
8000468c:	01010113          	addi	sp,sp,16
80004690:	00008067          	ret

80004694 <modbus_store_reg>:
80004694:	fd010113          	addi	sp,sp,-48
80004698:	fd850793          	addi	a5,a0,-40
8000469c:	02812423          	sw	s0,40(sp)
800046a0:	02912223          	sw	s1,36(sp)
800046a4:	02112623          	sw	ra,44(sp)
800046a8:	03212023          	sw	s2,32(sp)
800046ac:	03010413          	addi	s0,sp,48
800046b0:	01079793          	slli	a5,a5,0x10
800046b4:	0107d793          	srli	a5,a5,0x10
800046b8:	00900713          	li	a4,9
800046bc:	00058493          	mv	s1,a1
800046c0:	02f76063          	bltu	a4,a5,800046e0 <modbus_store_reg+0x4c>
800046c4:	8901a783          	lw	a5,-1904(gp) # 80003300 <reg_config_write>
800046c8:	00079c63          	bnez	a5,800046e0 <modbus_store_reg+0x4c>
800046cc:	80002537          	lui	a0,0x80002
800046d0:	7b850513          	addi	a0,a0,1976 # 800027b8 <_ram_heap_end+0xfffea7b8>
800046d4:	0750a0ef          	jal	ra,8000ef48 <iprintf>
800046d8:	ffe00913          	li	s2,-2
800046dc:	0380006f          	j	80004714 <modbus_store_reg+0x80>
800046e0:	02f00793          	li	a5,47
800046e4:	4af50c63          	beq	a0,a5,80004b9c <modbus_store_reg+0x508>
800046e8:	0aa7e863          	bltu	a5,a0,80004798 <modbus_store_reg+0x104>
800046ec:	02a00793          	li	a5,42
800046f0:	44f50663          	beq	a0,a5,80004b3c <modbus_store_reg+0x4a8>
800046f4:	04a7e063          	bltu	a5,a0,80004734 <modbus_store_reg+0xa0>
800046f8:	02000793          	li	a5,32
800046fc:	2ef50e63          	beq	a0,a5,800049f8 <modbus_store_reg+0x364>
80004700:	02900793          	li	a5,41
80004704:	40f50263          	beq	a0,a5,80004b08 <modbus_store_reg+0x474>
80004708:	01400793          	li	a5,20
8000470c:	24f50063          	beq	a0,a5,8000494c <modbus_store_reg+0x2b8>
80004710:	fff00913          	li	s2,-1
80004714:	fd040113          	addi	sp,s0,-48
80004718:	02c12083          	lw	ra,44(sp)
8000471c:	00090513          	mv	a0,s2
80004720:	02812403          	lw	s0,40(sp)
80004724:	02412483          	lw	s1,36(sp)
80004728:	02012903          	lw	s2,32(sp)
8000472c:	03010113          	addi	sp,sp,48
80004730:	00008067          	ret
80004734:	02c00793          	li	a5,44
80004738:	36f50463          	beq	a0,a5,80004aa0 <modbus_store_reg+0x40c>
8000473c:	42f56863          	bltu	a0,a5,80004b6c <modbus_store_reg+0x4d8>
80004740:	02d00793          	li	a5,45
80004744:	fcf516e3          	bne	a0,a5,80004710 <modbus_store_reg+0x7c>
80004748:	fd040513          	addi	a0,s0,-48
8000474c:	f4cff0ef          	jal	ra,80003e98 <config_load>
80004750:	00055c63          	bgez	a0,80004768 <modbus_store_reg+0xd4>
80004754:	800035b7          	lui	a1,0x80003
80004758:	02000613          	li	a2,32
8000475c:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004760:	fd040513          	addi	a0,s0,-48
80004764:	3a40a0ef          	jal	ra,8000eb08 <memcpy>
80004768:	0004c783          	lbu	a5,0(s1)
8000476c:	0014c703          	lbu	a4,1(s1)
80004770:	01879793          	slli	a5,a5,0x18
80004774:	01071713          	slli	a4,a4,0x10
80004778:	00e7e7b3          	or	a5,a5,a4
8000477c:	0034c703          	lbu	a4,3(s1)
80004780:	00e7e7b3          	or	a5,a5,a4
80004784:	0024c703          	lbu	a4,2(s1)
80004788:	00871713          	slli	a4,a4,0x8
8000478c:	00e7e7b3          	or	a5,a5,a4
80004790:	fef42423          	sw	a5,-24(s0)
80004794:	3340006f          	j	80004ac8 <modbus_store_reg+0x434>
80004798:	03300793          	li	a5,51
8000479c:	0ef50863          	beq	a0,a5,8000488c <modbus_store_reg+0x1f8>
800047a0:	0aa7e863          	bltu	a5,a0,80004850 <modbus_store_reg+0x1bc>
800047a4:	03100793          	li	a5,49
800047a8:	32f50a63          	beq	a0,a5,80004adc <modbus_store_reg+0x448>
800047ac:	2aa7f663          	bgeu	a5,a0,80004a58 <modbus_store_reg+0x3c4>
800047b0:	0014c783          	lbu	a5,1(s1)
800047b4:	0004c503          	lbu	a0,0(s1)
800047b8:	0024c583          	lbu	a1,2(s1)
800047bc:	00879793          	slli	a5,a5,0x8
800047c0:	00a7e7b3          	or	a5,a5,a0
800047c4:	00879513          	slli	a0,a5,0x8
800047c8:	0087d793          	srli	a5,a5,0x8
800047cc:	00f567b3          	or	a5,a0,a5
800047d0:	01079513          	slli	a0,a5,0x10
800047d4:	0034c783          	lbu	a5,3(s1)
800047d8:	0044c703          	lbu	a4,4(s1)
800047dc:	01055513          	srli	a0,a0,0x10
800047e0:	00879793          	slli	a5,a5,0x8
800047e4:	00b7e7b3          	or	a5,a5,a1
800047e8:	00879593          	slli	a1,a5,0x8
800047ec:	0087d793          	srli	a5,a5,0x8
800047f0:	00f5e7b3          	or	a5,a1,a5
800047f4:	01079593          	slli	a1,a5,0x10
800047f8:	0054c783          	lbu	a5,5(s1)
800047fc:	0105d593          	srli	a1,a1,0x10
80004800:	ffd00913          	li	s2,-3
80004804:	00879793          	slli	a5,a5,0x8
80004808:	00e7e7b3          	or	a5,a5,a4
8000480c:	00879713          	slli	a4,a5,0x8
80004810:	0087d793          	srli	a5,a5,0x8
80004814:	00f767b3          	or	a5,a4,a5
80004818:	01079793          	slli	a5,a5,0x10
8000481c:	0107d793          	srli	a5,a5,0x10
80004820:	ffa60713          	addi	a4,a2,-6
80004824:	ee0608e3          	beqz	a2,80004714 <modbus_store_reg+0x80>
80004828:	800036b7          	lui	a3,0x80003
8000482c:	2706a603          	lw	a2,624(a3) # 80003270 <_ram_heap_end+0xfffeb270>
80004830:	00648693          	addi	a3,s1,6
80004834:	1a079863          	bnez	a5,800049e4 <modbus_store_reg+0x350>
80004838:	800007b7          	lui	a5,0x80000
8000483c:	00800893          	li	a7,8
80004840:	00600813          	li	a6,6
80004844:	13478793          	addi	a5,a5,308 # 80000134 <_ram_heap_end+0xfffe8134>
80004848:	2dc010ef          	jal	ra,80005b24 <hub_print>
8000484c:	0500006f          	j	8000489c <modbus_store_reg+0x208>
80004850:	03c00793          	li	a5,60
80004854:	04f50863          	beq	a0,a5,800048a4 <modbus_store_reg+0x210>
80004858:	00a7ee63          	bltu	a5,a0,80004874 <modbus_store_reg+0x1e0>
8000485c:	03400793          	li	a5,52
80004860:	eaf518e3          	bne	a0,a5,80004710 <modbus_store_reg+0x7c>
80004864:	0034c703          	lbu	a4,3(s1)
80004868:	800037b7          	lui	a5,0x80003
8000486c:	26e7a823          	sw	a4,624(a5) # 80003270 <_ram_heap_end+0xfffeb270>
80004870:	02c0006f          	j	8000489c <modbus_store_reg+0x208>
80004874:	07e00793          	li	a5,126
80004878:	1af50863          	beq	a0,a5,80004a28 <modbus_store_reg+0x394>
8000487c:	07f00793          	li	a5,127
80004880:	e8f518e3          	bne	a0,a5,80004710 <modbus_store_reg+0x7c>
80004884:	5cd010ef          	jal	ra,80006650 <hard_reboot>
80004888:	0140006f          	j	8000489c <modbus_store_reg+0x208>
8000488c:	8c81a603          	lw	a2,-1848(gp) # 80003338 <hub_frame_size>
80004890:	00000593          	li	a1,0
80004894:	f0050537          	lui	a0,0xf0050
80004898:	4c1080ef          	jal	ra,8000d558 <memset>
8000489c:	00000913          	li	s2,0
800048a0:	e75ff06f          	j	80004714 <modbus_store_reg+0x80>
800048a4:	00165593          	srli	a1,a2,0x1
800048a8:	00159793          	slli	a5,a1,0x1
800048ac:	00f78793          	addi	a5,a5,15
800048b0:	0047d793          	srli	a5,a5,0x4
800048b4:	00479793          	slli	a5,a5,0x4
800048b8:	00010913          	mv	s2,sp
800048bc:	40f10133          	sub	sp,sp,a5
800048c0:	00010513          	mv	a0,sp
800048c4:	00048693          	mv	a3,s1
800048c8:	00000713          	li	a4,0
800048cc:	04b74c63          	blt	a4,a1,80004924 <modbus_store_reg+0x290>
800048d0:	00000613          	li	a2,0
800048d4:	095010ef          	jal	ra,80006168 <audiodac0_submit_buffer>
800048d8:	8d41a603          	lw	a2,-1836(gp) # 80003344 <audiodac0_tx_ring_buffer_playback_ptr>
800048dc:	8d01a683          	lw	a3,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
800048e0:	40c687b3          	sub	a5,a3,a2
800048e4:	00c6da63          	bge	a3,a2,800048f8 <modbus_store_reg+0x264>
800048e8:	8d81a783          	lw	a5,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
800048ec:	40c787b3          	sub	a5,a5,a2
800048f0:	00d787b3          	add	a5,a5,a3
800048f4:	fff78793          	addi	a5,a5,-1
800048f8:	4087d693          	srai	a3,a5,0x8
800048fc:	00d48023          	sb	a3,0(s1)
80004900:	00f480a3          	sb	a5,1(s1)
80004904:	8d81a783          	lw	a5,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
80004908:	4087d793          	srai	a5,a5,0x8
8000490c:	00f48123          	sb	a5,2(s1)
80004910:	8d81a783          	lw	a5,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
80004914:	00f481a3          	sb	a5,3(s1)
80004918:	00090113          	mv	sp,s2
8000491c:	00400913          	li	s2,4
80004920:	df5ff06f          	j	80004714 <modbus_store_reg+0x80>
80004924:	0006c783          	lbu	a5,0(a3)
80004928:	0016c803          	lbu	a6,1(a3)
8000492c:	00171613          	slli	a2,a4,0x1
80004930:	00879793          	slli	a5,a5,0x8
80004934:	00c50633          	add	a2,a0,a2
80004938:	0107e7b3          	or	a5,a5,a6
8000493c:	00f61023          	sh	a5,0(a2)
80004940:	00170713          	addi	a4,a4,1
80004944:	00268693          	addi	a3,a3,2
80004948:	f85ff06f          	j	800048cc <modbus_store_reg+0x238>
8000494c:	0014c703          	lbu	a4,1(s1)
80004950:	0004c783          	lbu	a5,0(s1)
80004954:	40000593          	li	a1,1024
80004958:	00871713          	slli	a4,a4,0x8
8000495c:	00f76733          	or	a4,a4,a5
80004960:	00871793          	slli	a5,a4,0x8
80004964:	00875713          	srli	a4,a4,0x8
80004968:	00e7e7b3          	or	a5,a5,a4
8000496c:	00001737          	lui	a4,0x1
80004970:	01079793          	slli	a5,a5,0x10
80004974:	00270713          	addi	a4,a4,2 # 1002 <_stack_size+0x2>
80004978:	0107d793          	srli	a5,a5,0x10
8000497c:	00c76c63          	bltu	a4,a2,80004994 <modbus_store_reg+0x300>
80004980:	ffe60613          	addi	a2,a2,-2
80004984:	41f65593          	srai	a1,a2,0x1f
80004988:	0035f593          	andi	a1,a1,3
8000498c:	00c585b3          	add	a1,a1,a2
80004990:	4025d593          	srai	a1,a1,0x2
80004994:	00259593          	slli	a1,a1,0x2
80004998:	00b485b3          	add	a1,s1,a1
8000499c:	f0050537          	lui	a0,0xf0050
800049a0:	00478613          	addi	a2,a5,4
800049a4:	eeb48ce3          	beq	s1,a1,8000489c <modbus_store_reg+0x208>
800049a8:	0054c703          	lbu	a4,5(s1)
800049ac:	0044c683          	lbu	a3,4(s1)
800049b0:	00f507b3          	add	a5,a0,a5
800049b4:	01871713          	slli	a4,a4,0x18
800049b8:	01069693          	slli	a3,a3,0x10
800049bc:	00d76733          	or	a4,a4,a3
800049c0:	0024c683          	lbu	a3,2(s1)
800049c4:	00448493          	addi	s1,s1,4
800049c8:	00d76733          	or	a4,a4,a3
800049cc:	fff4c683          	lbu	a3,-1(s1)
800049d0:	00869693          	slli	a3,a3,0x8
800049d4:	00d76733          	or	a4,a4,a3
800049d8:	00e7a023          	sw	a4,0(a5)
800049dc:	00060793          	mv	a5,a2
800049e0:	fc1ff06f          	j	800049a0 <modbus_store_reg+0x30c>
800049e4:	800007b7          	lui	a5,0x80000
800049e8:	01000893          	li	a7,16
800049ec:	00c00813          	li	a6,12
800049f0:	73478793          	addi	a5,a5,1844 # 80000734 <_ram_heap_end+0xfffe8734>
800049f4:	e55ff06f          	j	80004848 <modbus_store_reg+0x1b4>
800049f8:	0004c783          	lbu	a5,0(s1)
800049fc:	0014c703          	lbu	a4,1(s1)
80004a00:	01879793          	slli	a5,a5,0x18
80004a04:	01071713          	slli	a4,a4,0x10
80004a08:	00e7e7b3          	or	a5,a5,a4
80004a0c:	0034c703          	lbu	a4,3(s1)
80004a10:	00e7e7b3          	or	a5,a5,a4
80004a14:	0024c703          	lbu	a4,2(s1)
80004a18:	00871713          	slli	a4,a4,0x8
80004a1c:	00e7e7b3          	or	a5,a5,a4
80004a20:	88f1aa23          	sw	a5,-1900(gp) # 80003304 <reg_scratch>
80004a24:	e79ff06f          	j	8000489c <modbus_store_reg+0x208>
80004a28:	0004c783          	lbu	a5,0(s1)
80004a2c:	0014c703          	lbu	a4,1(s1)
80004a30:	01879793          	slli	a5,a5,0x18
80004a34:	01071713          	slli	a4,a4,0x10
80004a38:	00e7e7b3          	or	a5,a5,a4
80004a3c:	0034c703          	lbu	a4,3(s1)
80004a40:	00e7e7b3          	or	a5,a5,a4
80004a44:	0024c703          	lbu	a4,2(s1)
80004a48:	00871713          	slli	a4,a4,0x8
80004a4c:	00e7e7b3          	or	a5,a5,a4
80004a50:	88f1a823          	sw	a5,-1904(gp) # 80003300 <reg_config_write>
80004a54:	e49ff06f          	j	8000489c <modbus_store_reg+0x208>
80004a58:	0034c503          	lbu	a0,3(s1)
80004a5c:	49d000ef          	jal	ra,800056f8 <hub_init>
80004a60:	00050913          	mv	s2,a0
80004a64:	c6051ae3          	bnez	a0,800046d8 <modbus_store_reg+0x44>
80004a68:	fd040513          	addi	a0,s0,-48
80004a6c:	c2cff0ef          	jal	ra,80003e98 <config_load>
80004a70:	00055c63          	bgez	a0,80004a88 <modbus_store_reg+0x3f4>
80004a74:	800035b7          	lui	a1,0x80003
80004a78:	02000613          	li	a2,32
80004a7c:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004a80:	fd040513          	addi	a0,s0,-48
80004a84:	0840a0ef          	jal	ra,8000eb08 <memcpy>
80004a88:	0034c783          	lbu	a5,3(s1)
80004a8c:	fd040513          	addi	a0,s0,-48
80004a90:	fef401a3          	sb	a5,-29(s0)
80004a94:	cdcff0ef          	jal	ra,80003f70 <config_save>
80004a98:	c6055ee3          	bgez	a0,80004714 <modbus_store_reg+0x80>
80004a9c:	c3dff06f          	j	800046d8 <modbus_store_reg+0x44>
80004aa0:	fd040513          	addi	a0,s0,-48
80004aa4:	bf4ff0ef          	jal	ra,80003e98 <config_load>
80004aa8:	00055c63          	bgez	a0,80004ac0 <modbus_store_reg+0x42c>
80004aac:	800035b7          	lui	a1,0x80003
80004ab0:	02000613          	li	a2,32
80004ab4:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004ab8:	fd040513          	addi	a0,s0,-48
80004abc:	04c0a0ef          	jal	ra,8000eb08 <memcpy>
80004ac0:	0034c783          	lbu	a5,3(s1)
80004ac4:	fef40223          	sb	a5,-28(s0)
80004ac8:	fd040513          	addi	a0,s0,-48
80004acc:	ca4ff0ef          	jal	ra,80003f70 <config_save>
80004ad0:	41f55513          	srai	a0,a0,0x1f
80004ad4:	ffe57913          	andi	s2,a0,-2
80004ad8:	c3dff06f          	j	80004714 <modbus_store_reg+0x80>
80004adc:	fd040513          	addi	a0,s0,-48
80004ae0:	bb8ff0ef          	jal	ra,80003e98 <config_load>
80004ae4:	00055c63          	bgez	a0,80004afc <modbus_store_reg+0x468>
80004ae8:	800035b7          	lui	a1,0x80003
80004aec:	02000613          	li	a2,32
80004af0:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004af4:	fd040513          	addi	a0,s0,-48
80004af8:	0100a0ef          	jal	ra,8000eb08 <memcpy>
80004afc:	0034c783          	lbu	a5,3(s1)
80004b00:	fcf40e23          	sb	a5,-36(s0)
80004b04:	fc5ff06f          	j	80004ac8 <modbus_store_reg+0x434>
80004b08:	fd040513          	addi	a0,s0,-48
80004b0c:	b8cff0ef          	jal	ra,80003e98 <config_load>
80004b10:	00055c63          	bgez	a0,80004b28 <modbus_store_reg+0x494>
80004b14:	800035b7          	lui	a1,0x80003
80004b18:	02000613          	li	a2,32
80004b1c:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004b20:	fd040513          	addi	a0,s0,-48
80004b24:	7e5090ef          	jal	ra,8000eb08 <memcpy>
80004b28:	00400613          	li	a2,4
80004b2c:	00348593          	addi	a1,s1,3
80004b30:	fd040513          	addi	a0,s0,-48
80004b34:	351010ef          	jal	ra,80006684 <memcpy_rev>
80004b38:	f91ff06f          	j	80004ac8 <modbus_store_reg+0x434>
80004b3c:	fd040513          	addi	a0,s0,-48
80004b40:	b58ff0ef          	jal	ra,80003e98 <config_load>
80004b44:	00055c63          	bgez	a0,80004b5c <modbus_store_reg+0x4c8>
80004b48:	800035b7          	lui	a1,0x80003
80004b4c:	02000613          	li	a2,32
80004b50:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004b54:	fd040513          	addi	a0,s0,-48
80004b58:	7b1090ef          	jal	ra,8000eb08 <memcpy>
80004b5c:	00400613          	li	a2,4
80004b60:	00348593          	addi	a1,s1,3
80004b64:	fd440513          	addi	a0,s0,-44
80004b68:	fcdff06f          	j	80004b34 <modbus_store_reg+0x4a0>
80004b6c:	fd040513          	addi	a0,s0,-48
80004b70:	b28ff0ef          	jal	ra,80003e98 <config_load>
80004b74:	00055c63          	bgez	a0,80004b8c <modbus_store_reg+0x4f8>
80004b78:	800035b7          	lui	a1,0x80003
80004b7c:	02000613          	li	a2,32
80004b80:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004b84:	fd040513          	addi	a0,s0,-48
80004b88:	781090ef          	jal	ra,8000eb08 <memcpy>
80004b8c:	00400613          	li	a2,4
80004b90:	00348593          	addi	a1,s1,3
80004b94:	fd840513          	addi	a0,s0,-40
80004b98:	f9dff06f          	j	80004b34 <modbus_store_reg+0x4a0>
80004b9c:	fd040513          	addi	a0,s0,-48
80004ba0:	af8ff0ef          	jal	ra,80003e98 <config_load>
80004ba4:	00055c63          	bgez	a0,80004bbc <modbus_store_reg+0x528>
80004ba8:	800035b7          	lui	a1,0x80003
80004bac:	02000613          	li	a2,32
80004bb0:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004bb4:	fd040513          	addi	a0,s0,-48
80004bb8:	751090ef          	jal	ra,8000eb08 <memcpy>
80004bbc:	00600613          	li	a2,6
80004bc0:	00048593          	mv	a1,s1
80004bc4:	fdd40513          	addi	a0,s0,-35
80004bc8:	741090ef          	jal	ra,8000eb08 <memcpy>
80004bcc:	efdff06f          	j	80004ac8 <modbus_store_reg+0x434>

80004bd0 <modbus_recv>:
80004bd0:	fb010113          	addi	sp,sp,-80
80004bd4:	04812423          	sw	s0,72(sp)
80004bd8:	04112623          	sw	ra,76(sp)
80004bdc:	04912223          	sw	s1,68(sp)
80004be0:	05212023          	sw	s2,64(sp)
80004be4:	03312e23          	sw	s3,60(sp)
80004be8:	03412c23          	sw	s4,56(sp)
80004bec:	03512a23          	sw	s5,52(sp)
80004bf0:	03612823          	sw	s6,48(sp)
80004bf4:	03712623          	sw	s7,44(sp)
80004bf8:	03812423          	sw	s8,40(sp)
80004bfc:	fff00413          	li	s0,-1
80004c00:	10050a63          	beqz	a0,80004d14 <modbus_recv+0x144>
80004c04:	10060863          	beqz	a2,80004d14 <modbus_recv+0x144>
80004c08:	00400793          	li	a5,4
80004c0c:	10b7d463          	bge	a5,a1,80004d14 <modbus_recv+0x144>
80004c10:	01059a93          	slli	s5,a1,0x10
80004c14:	010ada93          	srli	s5,s5,0x10
80004c18:	00058413          	mv	s0,a1
80004c1c:	ffea8593          	addi	a1,s5,-2
80004c20:	01059593          	slli	a1,a1,0x10
80004c24:	00050a13          	mv	s4,a0
80004c28:	0105d593          	srli	a1,a1,0x10
80004c2c:	00060493          	mv	s1,a2
80004c30:	008a0433          	add	s0,s4,s0
80004c34:	b11fe0ef          	jal	ra,80003744 <crc16>
80004c38:	fff44603          	lbu	a2,-1(s0)
80004c3c:	ffe44783          	lbu	a5,-2(s0)
80004c40:	00050593          	mv	a1,a0
80004c44:	00861613          	slli	a2,a2,0x8
80004c48:	00f66633          	or	a2,a2,a5
80004c4c:	42c51663          	bne	a0,a2,80005078 <modbus_recv+0x4a8>
80004c50:	9b418713          	addi	a4,gp,-1612 # 80003424 <active_config>
80004c54:	000a4583          	lbu	a1,0(s4)
80004c58:	01474603          	lbu	a2,20(a4)
80004c5c:	001a4903          	lbu	s2,1(s4)
80004c60:	9b418b13          	addi	s6,gp,-1612 # 80003424 <active_config>
80004c64:	00c58863          	beq	a1,a2,80004c74 <modbus_recv+0xa4>
80004c68:	3e059e63          	bnez	a1,80005064 <modbus_recv+0x494>
80004c6c:	01100793          	li	a5,17
80004c70:	3ef91a63          	bne	s2,a5,80005064 <modbus_recv+0x494>
80004c74:	002a4403          	lbu	s0,2(s4)
80004c78:	003a4783          	lbu	a5,3(s4)
80004c7c:	08000613          	li	a2,128
80004c80:	00841413          	slli	s0,s0,0x8
80004c84:	00000593          	li	a1,0
80004c88:	00048513          	mv	a0,s1
80004c8c:	00f46433          	or	s0,s0,a5
80004c90:	004a4983          	lbu	s3,4(s4)
80004c94:	005a4c03          	lbu	s8,5(s4)
80004c98:	0c1080ef          	jal	ra,8000d558 <memset>
80004c9c:	014b4783          	lbu	a5,20(s6)
80004ca0:	01041413          	slli	s0,s0,0x10
80004ca4:	41045413          	srai	s0,s0,0x10
80004ca8:	00f48023          	sb	a5,0(s1)
80004cac:	fff90793          	addi	a5,s2,-1
80004cb0:	01041b93          	slli	s7,s0,0x10
80004cb4:	012480a3          	sb	s2,1(s1)
80004cb8:	0ff7f793          	andi	a5,a5,255
80004cbc:	01000713          	li	a4,16
80004cc0:	010bdb93          	srli	s7,s7,0x10
80004cc4:	38f76a63          	bltu	a4,a5,80005058 <modbus_recv+0x488>
80004cc8:	80002737          	lui	a4,0x80002
80004ccc:	00279793          	slli	a5,a5,0x2
80004cd0:	75070713          	addi	a4,a4,1872 # 80002750 <_ram_heap_end+0xfffea750>
80004cd4:	00e787b3          	add	a5,a5,a4
80004cd8:	0007a783          	lw	a5,0(a5)
80004cdc:	00078067          	jr	a5
80004ce0:	800026b7          	lui	a3,0x80002
80004ce4:	800035b7          	lui	a1,0x80003
80004ce8:	7f868693          	addi	a3,a3,2040 # 800027f8 <_ram_heap_end+0xfffea7f8>
80004cec:	14100613          	li	a2,321
80004cf0:	80458593          	addi	a1,a1,-2044 # 80002804 <_ram_heap_end+0xfffea804>
80004cf4:	00348513          	addi	a0,s1,3
80004cf8:	63c0a0ef          	jal	ra,8000f334 <siprintf>
80004cfc:	02800793          	li	a5,40
80004d00:	00f48123          	sb	a5,2(s1)
80004d04:	02b00593          	li	a1,43
80004d08:	00048513          	mv	a0,s1
80004d0c:	a91fe0ef          	jal	ra,8000379c <add_crc>
80004d10:	02d00413          	li	s0,45
80004d14:	00040513          	mv	a0,s0
80004d18:	04c12083          	lw	ra,76(sp)
80004d1c:	04812403          	lw	s0,72(sp)
80004d20:	04412483          	lw	s1,68(sp)
80004d24:	04012903          	lw	s2,64(sp)
80004d28:	03c12983          	lw	s3,60(sp)
80004d2c:	03812a03          	lw	s4,56(sp)
80004d30:	03412a83          	lw	s5,52(sp)
80004d34:	03012b03          	lw	s6,48(sp)
80004d38:	02c12b83          	lw	s7,44(sp)
80004d3c:	02812c03          	lw	s8,40(sp)
80004d40:	05010113          	addi	sp,sp,80
80004d44:	00008067          	ret
80004d48:	00899993          	slli	s3,s3,0x8
80004d4c:	0189e9b3          	or	s3,s3,s8
80004d50:	01099993          	slli	s3,s3,0x10
80004d54:	4109d993          	srai	s3,s3,0x10
80004d58:	00100793          	li	a5,1
80004d5c:	00048613          	mv	a2,s1
80004d60:	2af99463          	bne	s3,a5,80005008 <modbus_recv+0x438>
80004d64:	02c00793          	li	a5,44
80004d68:	20f40c63          	beq	s0,a5,80004f80 <modbus_recv+0x3b0>
80004d6c:	0887c063          	blt	a5,s0,80004dec <modbus_recv+0x21c>
80004d70:	02000793          	li	a5,32
80004d74:	14f40e63          	beq	s0,a5,80004ed0 <modbus_recv+0x300>
80004d78:	0287c663          	blt	a5,s0,80004da4 <modbus_recv+0x1d4>
80004d7c:	01e00793          	li	a5,30
80004d80:	0ef40e63          	beq	s0,a5,80004e7c <modbus_recv+0x2ac>
80004d84:	01f00793          	li	a5,31
80004d88:	12f40e63          	beq	s0,a5,80004ec4 <modbus_recv+0x2f4>
80004d8c:	00048613          	mv	a2,s1
80004d90:	00200593          	li	a1,2
80004d94:	00090513          	mv	a0,s2
80004d98:	88dff0ef          	jal	ra,80004624 <modbus_error>
80004d9c:	00050413          	mv	s0,a0
80004da0:	0f00006f          	j	80004e90 <modbus_recv+0x2c0>
80004da4:	02a00793          	li	a5,42
80004da8:	14f40863          	beq	s0,a5,80004ef8 <modbus_recv+0x328>
80004dac:	1687cc63          	blt	a5,s0,80004f24 <modbus_recv+0x354>
80004db0:	02900793          	li	a5,41
80004db4:	fcf41ce3          	bne	s0,a5,80004d8c <modbus_recv+0x1bc>
80004db8:	00010513          	mv	a0,sp
80004dbc:	8dcff0ef          	jal	ra,80003e98 <config_load>
80004dc0:	00055c63          	bgez	a0,80004dd8 <modbus_recv+0x208>
80004dc4:	800035b7          	lui	a1,0x80003
80004dc8:	02000613          	li	a2,32
80004dcc:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004dd0:	00010513          	mv	a0,sp
80004dd4:	535090ef          	jal	ra,8000eb08 <memcpy>
80004dd8:	00400613          	li	a2,4
80004ddc:	00010593          	mv	a1,sp
80004de0:	00348513          	addi	a0,s1,3
80004de4:	525090ef          	jal	ra,8000eb08 <memcpy>
80004de8:	0a40006f          	j	80004e8c <modbus_recv+0x2bc>
80004dec:	03000793          	li	a5,48
80004df0:	16f40063          	beq	s0,a5,80004f50 <modbus_recv+0x380>
80004df4:	0487c463          	blt	a5,s0,80004e3c <modbus_recv+0x26c>
80004df8:	02d00793          	li	a5,45
80004dfc:	1af40663          	beq	s0,a5,80004fa8 <modbus_recv+0x3d8>
80004e00:	02f00793          	li	a5,47
80004e04:	f8f414e3          	bne	s0,a5,80004d8c <modbus_recv+0x1bc>
80004e08:	00010513          	mv	a0,sp
80004e0c:	88cff0ef          	jal	ra,80003e98 <config_load>
80004e10:	00055c63          	bgez	a0,80004e28 <modbus_recv+0x258>
80004e14:	800035b7          	lui	a1,0x80003
80004e18:	02000613          	li	a2,32
80004e1c:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004e20:	00010513          	mv	a0,sp
80004e24:	4e5090ef          	jal	ra,8000eb08 <memcpy>
80004e28:	00600613          	li	a2,6
80004e2c:	00d10593          	addi	a1,sp,13
80004e30:	00348513          	addi	a0,s1,3
80004e34:	4d5090ef          	jal	ra,8000eb08 <memcpy>
80004e38:	1400006f          	j	80004f78 <modbus_recv+0x3a8>
80004e3c:	03400793          	li	a5,52
80004e40:	0af40463          	beq	s0,a5,80004ee8 <modbus_recv+0x318>
80004e44:	07e00793          	li	a5,126
80004e48:	08f40a63          	beq	s0,a5,80004edc <modbus_recv+0x30c>
80004e4c:	03100793          	li	a5,49
80004e50:	f2f41ee3          	bne	s0,a5,80004d8c <modbus_recv+0x1bc>
80004e54:	00010513          	mv	a0,sp
80004e58:	840ff0ef          	jal	ra,80003e98 <config_load>
80004e5c:	00055c63          	bgez	a0,80004e74 <modbus_recv+0x2a4>
80004e60:	800035b7          	lui	a1,0x80003
80004e64:	02000613          	li	a2,32
80004e68:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004e6c:	00010513          	mv	a0,sp
80004e70:	499090ef          	jal	ra,8000eb08 <memcpy>
80004e74:	00c14783          	lbu	a5,12(sp)
80004e78:	0fc0006f          	j	80004f74 <modbus_recv+0x3a4>
80004e7c:	00400613          	li	a2,4
80004e80:	89b18593          	addi	a1,gp,-1893 # 8000330b <reg_sys_counter+0x3>
80004e84:	00348513          	addi	a0,s1,3
80004e88:	7fc010ef          	jal	ra,80006684 <memcpy_rev>
80004e8c:	00400413          	li	s0,4
80004e90:	00340593          	addi	a1,s0,3
80004e94:	01059593          	slli	a1,a1,0x10
80004e98:	00848123          	sb	s0,2(s1)
80004e9c:	0105d593          	srli	a1,a1,0x10
80004ea0:	00048513          	mv	a0,s1
80004ea4:	8f9fe0ef          	jal	ra,8000379c <add_crc>
80004ea8:	00540413          	addi	s0,s0,5
80004eac:	e60414e3          	bnez	s0,80004d14 <modbus_recv+0x144>
80004eb0:	80003537          	lui	a0,0x80003
80004eb4:	00090593          	mv	a1,s2
80004eb8:	82450513          	addi	a0,a0,-2012 # 80002824 <_ram_heap_end+0xfffea824>
80004ebc:	08c0a0ef          	jal	ra,8000ef48 <iprintf>
80004ec0:	e55ff06f          	j	80004d14 <modbus_recv+0x144>
80004ec4:	00400613          	li	a2,4
80004ec8:	89f18593          	addi	a1,gp,-1889 # 8000330f <reg_irq_counter+0x3>
80004ecc:	fb9ff06f          	j	80004e84 <modbus_recv+0x2b4>
80004ed0:	00400613          	li	a2,4
80004ed4:	89718593          	addi	a1,gp,-1897 # 80003307 <reg_scratch+0x3>
80004ed8:	fadff06f          	j	80004e84 <modbus_recv+0x2b4>
80004edc:	00400613          	li	a2,4
80004ee0:	89318593          	addi	a1,gp,-1901 # 80003303 <reg_config_write+0x3>
80004ee4:	fa1ff06f          	j	80004e84 <modbus_recv+0x2b4>
80004ee8:	800035b7          	lui	a1,0x80003
80004eec:	00400613          	li	a2,4
80004ef0:	27358593          	addi	a1,a1,627 # 80003273 <_ram_heap_end+0xfffeb273>
80004ef4:	f91ff06f          	j	80004e84 <modbus_recv+0x2b4>
80004ef8:	00010513          	mv	a0,sp
80004efc:	f9dfe0ef          	jal	ra,80003e98 <config_load>
80004f00:	00055c63          	bgez	a0,80004f18 <modbus_recv+0x348>
80004f04:	800035b7          	lui	a1,0x80003
80004f08:	02000613          	li	a2,32
80004f0c:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004f10:	00010513          	mv	a0,sp
80004f14:	3f5090ef          	jal	ra,8000eb08 <memcpy>
80004f18:	00400613          	li	a2,4
80004f1c:	00410593          	addi	a1,sp,4
80004f20:	ec1ff06f          	j	80004de0 <modbus_recv+0x210>
80004f24:	00010513          	mv	a0,sp
80004f28:	f71fe0ef          	jal	ra,80003e98 <config_load>
80004f2c:	00055c63          	bgez	a0,80004f44 <modbus_recv+0x374>
80004f30:	800035b7          	lui	a1,0x80003
80004f34:	02000613          	li	a2,32
80004f38:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004f3c:	00010513          	mv	a0,sp
80004f40:	3c9090ef          	jal	ra,8000eb08 <memcpy>
80004f44:	00400613          	li	a2,4
80004f48:	00810593          	addi	a1,sp,8
80004f4c:	e95ff06f          	j	80004de0 <modbus_recv+0x210>
80004f50:	00010513          	mv	a0,sp
80004f54:	f45fe0ef          	jal	ra,80003e98 <config_load>
80004f58:	00055c63          	bgez	a0,80004f70 <modbus_recv+0x3a0>
80004f5c:	800035b7          	lui	a1,0x80003
80004f60:	02000613          	li	a2,32
80004f64:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004f68:	00010513          	mv	a0,sp
80004f6c:	39d090ef          	jal	ra,8000eb08 <memcpy>
80004f70:	01314783          	lbu	a5,19(sp)
80004f74:	00f48323          	sb	a5,6(s1)
80004f78:	00600413          	li	s0,6
80004f7c:	f15ff06f          	j	80004e90 <modbus_recv+0x2c0>
80004f80:	00010513          	mv	a0,sp
80004f84:	f15fe0ef          	jal	ra,80003e98 <config_load>
80004f88:	00055c63          	bgez	a0,80004fa0 <modbus_recv+0x3d0>
80004f8c:	800035b7          	lui	a1,0x80003
80004f90:	02000613          	li	a2,32
80004f94:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004f98:	00010513          	mv	a0,sp
80004f9c:	36d090ef          	jal	ra,8000eb08 <memcpy>
80004fa0:	01414783          	lbu	a5,20(sp)
80004fa4:	fd1ff06f          	j	80004f74 <modbus_recv+0x3a4>
80004fa8:	00010513          	mv	a0,sp
80004fac:	eedfe0ef          	jal	ra,80003e98 <config_load>
80004fb0:	00055c63          	bgez	a0,80004fc8 <modbus_recv+0x3f8>
80004fb4:	800035b7          	lui	a1,0x80003
80004fb8:	02000613          	li	a2,32
80004fbc:	1e058593          	addi	a1,a1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
80004fc0:	00010513          	mv	a0,sp
80004fc4:	345090ef          	jal	ra,8000eb08 <memcpy>
80004fc8:	00400613          	li	a2,4
80004fcc:	01b10593          	addi	a1,sp,27
80004fd0:	e61ff06f          	j	80004e30 <modbus_recv+0x260>
80004fd4:	ff7a8613          	addi	a2,s5,-9
80004fd8:	007a0993          	addi	s3,s4,7
80004fdc:	01061613          	slli	a2,a2,0x10
80004fe0:	01065613          	srli	a2,a2,0x10
80004fe4:	00098593          	mv	a1,s3
80004fe8:	000b8513          	mv	a0,s7
80004fec:	ea8ff0ef          	jal	ra,80004694 <modbus_store_reg>
80004ff0:	00050413          	mv	s0,a0
80004ff4:	02055463          	bgez	a0,8000501c <modbus_recv+0x44c>
80004ff8:	ffe00793          	li	a5,-2
80004ffc:	00048613          	mv	a2,s1
80005000:	00700593          	li	a1,7
80005004:	00f50463          	beq	a0,a5,8000500c <modbus_recv+0x43c>
80005008:	00300593          	li	a1,3
8000500c:	00090513          	mv	a0,s2
80005010:	e14ff0ef          	jal	ra,80004624 <modbus_error>
80005014:	00050413          	mv	s0,a0
80005018:	e95ff06f          	j	80004eac <modbus_recv+0x2dc>
8000501c:	00400613          	li	a2,4
80005020:	002a0593          	addi	a1,s4,2
80005024:	00248513          	addi	a0,s1,2
80005028:	2e1090ef          	jal	ra,8000eb08 <memcpy>
8000502c:	00040613          	mv	a2,s0
80005030:	00098593          	mv	a1,s3
80005034:	00648513          	addi	a0,s1,6
80005038:	2d1090ef          	jal	ra,8000eb08 <memcpy>
8000503c:	00640593          	addi	a1,s0,6
80005040:	01059593          	slli	a1,a1,0x10
80005044:	0105d593          	srli	a1,a1,0x10
80005048:	00048513          	mv	a0,s1
8000504c:	f50fe0ef          	jal	ra,8000379c <add_crc>
80005050:	00840413          	addi	s0,s0,8
80005054:	cc1ff06f          	j	80004d14 <modbus_recv+0x144>
80005058:	00048613          	mv	a2,s1
8000505c:	00100593          	li	a1,1
80005060:	fadff06f          	j	8000500c <modbus_recv+0x43c>
80005064:	80003537          	lui	a0,0x80003
80005068:	85450513          	addi	a0,a0,-1964 # 80002854 <_ram_heap_end+0xfffea854>
8000506c:	6dd090ef          	jal	ra,8000ef48 <iprintf>
80005070:	00000413          	li	s0,0
80005074:	ca1ff06f          	j	80004d14 <modbus_recv+0x144>
80005078:	80003537          	lui	a0,0x80003
8000507c:	89450513          	addi	a0,a0,-1900 # 80002894 <_ram_heap_end+0xfffea894>
80005080:	fedff06f          	j	8000506c <modbus_recv+0x49c>

80005084 <mac_init>:
80005084:	ff010113          	addi	sp,sp,-16
80005088:	00112623          	sw	ra,12(sp)
8000508c:	00812423          	sw	s0,8(sp)
80005090:	02051263          	bnez	a0,800050b4 <mac_init+0x30>
80005094:	80003537          	lui	a0,0x80003
80005098:	8cc50513          	addi	a0,a0,-1844 # 800028cc <_ram_heap_end+0xfffea8cc>
8000509c:	6ad090ef          	jal	ra,8000ef48 <iprintf>
800050a0:	ff000513          	li	a0,-16
800050a4:	00c12083          	lw	ra,12(sp)
800050a8:	00812403          	lw	s0,8(sp)
800050ac:	01010113          	addi	sp,sp,16
800050b0:	00008067          	ret
800050b4:	800035b7          	lui	a1,0x80003
800050b8:	00050413          	mv	s0,a0
800050bc:	00500613          	li	a2,5
800050c0:	8ec58593          	addi	a1,a1,-1812 # 800028ec <_ram_heap_end+0xfffea8ec>
800050c4:	03650513          	addi	a0,a0,54
800050c8:	241090ef          	jal	ra,8000eb08 <memcpy>
800050cc:	8000c7b7          	lui	a5,0x8000c
800050d0:	d3878793          	addi	a5,a5,-712 # 8000bd38 <_ram_heap_end+0xffff3d38>
800050d4:	00f42a23          	sw	a5,20(s0)
800050d8:	800057b7          	lui	a5,0x80005
800050dc:	13878793          	addi	a5,a5,312 # 80005138 <_ram_heap_end+0xfffed138>
800050e0:	00f42c23          	sw	a5,24(s0)
800050e4:	00600613          	li	a2,6
800050e8:	9c118593          	addi	a1,gp,-1599 # 80003431 <active_config+0xd>
800050ec:	02e40513          	addi	a0,s0,46
800050f0:	219090ef          	jal	ra,8000eb08 <memcpy>
800050f4:	5dc00793          	li	a5,1500
800050f8:	02f41623          	sh	a5,44(s0)
800050fc:	000017b7          	lui	a5,0x1
80005100:	e0678793          	addi	a5,a5,-506 # e06 <CUSTOM1+0xddb>
80005104:	02f41a23          	sh	a5,52(s0)
80005108:	00002537          	lui	a0,0x2
8000510c:	01100793          	li	a5,17
80005110:	f0070437          	lui	s0,0xf0070
80005114:	00f42023          	sw	a5,0(s0) # f0070000 <_ram_heap_end+0x70058000>
80005118:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1710>
8000511c:	3c0010ef          	jal	ra,800064dc <delay_us>
80005120:	80003537          	lui	a0,0x80003
80005124:	00042023          	sw	zero,0(s0)
80005128:	8f450513          	addi	a0,a0,-1804 # 800028f4 <_ram_heap_end+0xfffea8f4>
8000512c:	61d090ef          	jal	ra,8000ef48 <iprintf>
80005130:	00000513          	li	a0,0
80005134:	f71ff06f          	j	800050a4 <mac_init+0x20>

80005138 <mac_tx_packet>:
80005138:	00050463          	beqz	a0,80005140 <mac_tx_packet+0x8>
8000513c:	00059e63          	bnez	a1,80005158 <mac_tx_packet+0x20>
80005140:	f0000737          	lui	a4,0xf0000
80005144:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
80005148:	ff000513          	li	a0,-16
8000514c:	0027e793          	ori	a5,a5,2
80005150:	00f72223          	sw	a5,4(a4)
80005154:	00008067          	ret
80005158:	ff010113          	addi	sp,sp,-16
8000515c:	00812423          	sw	s0,8(sp)
80005160:	00058413          	mv	s0,a1
80005164:	00040513          	mv	a0,s0
80005168:	ffe00593          	li	a1,-2
8000516c:	00112623          	sw	ra,12(sp)
80005170:	75c020ef          	jal	ra,800078cc <pbuf_header>
80005174:	00040713          	mv	a4,s0
80005178:	00000793          	li	a5,0
8000517c:	00a75683          	lhu	a3,10(a4)
80005180:	00072703          	lw	a4,0(a4)
80005184:	00d787b3          	add	a5,a5,a3
80005188:	fe071ae3          	bnez	a4,8000517c <mac_tx_packet+0x44>
8000518c:	00379793          	slli	a5,a5,0x3
80005190:	f00706b7          	lui	a3,0xf0070
80005194:	0006a703          	lw	a4,0(a3) # f0070000 <_ram_heap_end+0x70058000>
80005198:	00277713          	andi	a4,a4,2
8000519c:	fe070ce3          	beqz	a4,80005194 <mac_tx_packet+0x5c>
800051a0:	f0070737          	lui	a4,0xf0070
800051a4:	01472683          	lw	a3,20(a4) # f0070014 <_ram_heap_end+0x70058014>
800051a8:	fe068ee3          	beqz	a3,800051a4 <mac_tx_packet+0x6c>
800051ac:	00f72823          	sw	a5,16(a4)
800051b0:	00040693          	mv	a3,s0
800051b4:	00000713          	li	a4,0
800051b8:	00000793          	li	a5,0
800051bc:	00300893          	li	a7,3
800051c0:	f0070837          	lui	a6,0xf0070
800051c4:	0046a603          	lw	a2,4(a3)
800051c8:	00a6d583          	lhu	a1,10(a3)
800051cc:	00b605b3          	add	a1,a2,a1
800051d0:	04c59863          	bne	a1,a2,80005220 <mac_tx_packet+0xe8>
800051d4:	0006a683          	lw	a3,0(a3)
800051d8:	fe0696e3          	bnez	a3,800051c4 <mac_tx_packet+0x8c>
800051dc:	00078a63          	beqz	a5,800051f0 <mac_tx_packet+0xb8>
800051e0:	f00707b7          	lui	a5,0xf0070
800051e4:	0147a683          	lw	a3,20(a5) # f0070014 <_ram_heap_end+0x70058014>
800051e8:	fe068ee3          	beqz	a3,800051e4 <mac_tx_packet+0xac>
800051ec:	00e7a823          	sw	a4,16(a5)
800051f0:	00040513          	mv	a0,s0
800051f4:	00200593          	li	a1,2
800051f8:	6d4020ef          	jal	ra,800078cc <pbuf_header>
800051fc:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
80005200:	0007a703          	lw	a4,0(a5)
80005204:	00000513          	li	a0,0
80005208:	00170713          	addi	a4,a4,1
8000520c:	00e7a023          	sw	a4,0(a5)
80005210:	00c12083          	lw	ra,12(sp)
80005214:	00812403          	lw	s0,8(sp)
80005218:	01010113          	addi	sp,sp,16
8000521c:	00008067          	ret
80005220:	00064503          	lbu	a0,0(a2)
80005224:	00379313          	slli	t1,a5,0x3
80005228:	00651533          	sll	a0,a0,t1
8000522c:	00a76733          	or	a4,a4,a0
80005230:	01179a63          	bne	a5,a7,80005244 <mac_tx_packet+0x10c>
80005234:	01482503          	lw	a0,20(a6) # f0070014 <_ram_heap_end+0x70058014>
80005238:	fe050ee3          	beqz	a0,80005234 <mac_tx_packet+0xfc>
8000523c:	00e82823          	sw	a4,16(a6)
80005240:	00000713          	li	a4,0
80005244:	00178793          	addi	a5,a5,1
80005248:	0037f793          	andi	a5,a5,3
8000524c:	00160613          	addi	a2,a2,1
80005250:	f81ff06f          	j	800051d0 <mac_tx_packet+0x98>

80005254 <sys_now>:
80005254:	ff010113          	addi	sp,sp,-16
80005258:	00112623          	sw	ra,12(sp)
8000525c:	f00b07b7          	lui	a5,0xf00b0
80005260:	0007a503          	lw	a0,0(a5) # f00b0000 <_ram_heap_end+0x70098000>
80005264:	0047a583          	lw	a1,4(a5)
80005268:	3e800613          	li	a2,1000
8000526c:	00000693          	li	a3,0
80005270:	3f8080ef          	jal	ra,8000d668 <__udivdi3>
80005274:	00c12083          	lw	ra,12(sp)
80005278:	01010113          	addi	sp,sp,16
8000527c:	00008067          	ret

80005280 <sys_arch_protect>:
80005280:	00008067          	ret

80005284 <sys_arch_unprotect>:
80005284:	00008067          	ret

80005288 <mac_lwip_init>:
80005288:	ff010113          	addi	sp,sp,-16
8000528c:	00112623          	sw	ra,12(sp)
80005290:	00812423          	sw	s0,8(sp)
80005294:	00912223          	sw	s1,4(sp)
80005298:	410010ef          	jal	ra,800066a8 <lwip_init>
8000529c:	fb9ff0ef          	jal	ra,80005254 <sys_now>
800052a0:	8aa1aa23          	sw	a0,-1868(gp) # 80003324 <ts_ipreass>
800052a4:	8aa1ae23          	sw	a0,-1860(gp) # 8000332c <ts_etharp>
800052a8:	8000d837          	lui	a6,0x8000d
800052ac:	800057b7          	lui	a5,0x80005
800052b0:	31c80813          	addi	a6,a6,796 # 8000d31c <_ram_heap_end+0xffff531c>
800052b4:	08478793          	addi	a5,a5,132 # 80005084 <_ram_heap_end+0xfffed084>
800052b8:	00000713          	li	a4,0
800052bc:	9b818693          	addi	a3,gp,-1608 # 80003428 <active_config+0x4>
800052c0:	9bc18613          	addi	a2,gp,-1604 # 8000342c <active_config+0x8>
800052c4:	9b418593          	addi	a1,gp,-1612 # 80003424 <active_config>
800052c8:	9d418513          	addi	a0,gp,-1580 # 80003444 <default_netif>
800052cc:	7a1010ef          	jal	ra,8000726c <netif_add>
800052d0:	02051663          	bnez	a0,800052fc <mac_lwip_init+0x74>
800052d4:	80003537          	lui	a0,0x80003
800052d8:	90850513          	addi	a0,a0,-1784 # 80002908 <_ram_heap_end+0xfffea908>
800052dc:	46d090ef          	jal	ra,8000ef48 <iprintf>
800052e0:	fff00493          	li	s1,-1
800052e4:	00c12083          	lw	ra,12(sp)
800052e8:	00812403          	lw	s0,8(sp)
800052ec:	00048513          	mv	a0,s1
800052f0:	00412483          	lw	s1,4(sp)
800052f4:	01010113          	addi	sp,sp,16
800052f8:	00008067          	ret
800052fc:	9d418513          	addi	a0,gp,-1580 # 80003444 <default_netif>
80005300:	0a4020ef          	jal	ra,800073a4 <netif_set_default>
80005304:	9d418513          	addi	a0,gp,-1580 # 80003444 <default_netif>
80005308:	9b418493          	addi	s1,gp,-1612 # 80003424 <active_config>
8000530c:	0a0020ef          	jal	ra,800073ac <netif_set_up>
80005310:	00c4c783          	lbu	a5,12(s1)
80005314:	00000493          	li	s1,0
80005318:	0017f793          	andi	a5,a5,1
8000531c:	fc0784e3          	beqz	a5,800052e4 <mac_lwip_init+0x5c>
80005320:	9d418513          	addi	a0,gp,-1580 # 80003444 <default_netif>
80005324:	2ad050ef          	jal	ra,8000add0 <dhcp_start>
80005328:	fbdff06f          	j	800052e4 <mac_lwip_init+0x5c>

8000532c <mac_rx>:
8000532c:	fc010113          	addi	sp,sp,-64
80005330:	02912a23          	sw	s1,52(sp)
80005334:	03512223          	sw	s5,36(sp)
80005338:	01712e23          	sw	s7,28(sp)
8000533c:	00001bb7          	lui	s7,0x1
80005340:	03312623          	sw	s3,44(sp)
80005344:	01812c23          	sw	s8,24(sp)
80005348:	01912a23          	sw	s9,20(sp)
8000534c:	02112e23          	sw	ra,60(sp)
80005350:	02812c23          	sw	s0,56(sp)
80005354:	03212823          	sw	s2,48(sp)
80005358:	03412423          	sw	s4,40(sp)
8000535c:	03612023          	sw	s6,32(sp)
80005360:	01a12823          	sw	s10,16(sp)
80005364:	00000993          	li	s3,0
80005368:	800b8b93          	addi	s7,s7,-2048 # 800 <CUSTOM1+0x7d5>
8000536c:	a2c18493          	addi	s1,gp,-1492 # 8000349c <lwip_stats>
80005370:	9d418a93          	addi	s5,gp,-1580 # 80003444 <default_netif>
80005374:	80003c37          	lui	s8,0x80003
80005378:	80003cb7          	lui	s9,0x80003
8000537c:	f0070937          	lui	s2,0xf0070
80005380:	00092783          	lw	a5,0(s2) # f0070000 <_ram_heap_end+0x70058000>
80005384:	0207f793          	andi	a5,a5,32
80005388:	04078663          	beqz	a5,800053d4 <mac_rx+0xa8>
8000538c:	02092683          	lw	a3,32(s2)
80005390:	00768413          	addi	s0,a3,7
80005394:	00345413          	srli	s0,s0,0x3
80005398:	068bfa63          	bgeu	s7,s0,8000540c <mac_rx+0xe0>
8000539c:	80003537          	lui	a0,0x80003
800053a0:	00068613          	mv	a2,a3
800053a4:	00040593          	mv	a1,s0
800053a8:	92c50513          	addi	a0,a0,-1748 # 8000292c <_ram_heap_end+0xfffea92c>
800053ac:	39d090ef          	jal	ra,8000ef48 <iprintf>
800053b0:	80c1a783          	lw	a5,-2036(gp) # 8000327c <_impure_ptr>
800053b4:	0087a503          	lw	a0,8(a5)
800053b8:	18c090ef          	jal	ra,8000e544 <fflush>
800053bc:	01100793          	li	a5,17
800053c0:	00002537          	lui	a0,0x2
800053c4:	00f92023          	sw	a5,0(s2)
800053c8:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1710>
800053cc:	110010ef          	jal	ra,800064dc <delay_us>
800053d0:	00092023          	sw	zero,0(s2)
800053d4:	03c12083          	lw	ra,60(sp)
800053d8:	03812403          	lw	s0,56(sp)
800053dc:	03412483          	lw	s1,52(sp)
800053e0:	03012903          	lw	s2,48(sp)
800053e4:	02c12983          	lw	s3,44(sp)
800053e8:	02812a03          	lw	s4,40(sp)
800053ec:	02412a83          	lw	s5,36(sp)
800053f0:	02012b03          	lw	s6,32(sp)
800053f4:	01c12b83          	lw	s7,28(sp)
800053f8:	01812c03          	lw	s8,24(sp)
800053fc:	01412c83          	lw	s9,20(sp)
80005400:	01012d03          	lw	s10,16(sp)
80005404:	04010113          	addi	sp,sp,64
80005408:	00008067          	ret
8000540c:	00240d13          	addi	s10,s0,2
80005410:	010d1d13          	slli	s10,s10,0x10
80005414:	010d5d13          	srli	s10,s10,0x10
80005418:	18200613          	li	a2,386
8000541c:	000d0593          	mv	a1,s10
80005420:	00000513          	li	a0,0
80005424:	00d12623          	sw	a3,12(sp)
80005428:	5a0020ef          	jal	ra,800079c8 <pbuf_alloc>
8000542c:	00050913          	mv	s2,a0
80005430:	00c12683          	lw	a3,12(sp)
80005434:	0a051663          	bnez	a0,800054e0 <mac_rx+0x1b4>
80005438:	f0000737          	lui	a4,0xf0000
8000543c:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
80005440:	80003537          	lui	a0,0x80003
80005444:	00040613          	mv	a2,s0
80005448:	0027e793          	ori	a5,a5,2
8000544c:	00f72223          	sw	a5,4(a4)
80005450:	01f68713          	addi	a4,a3,31
80005454:	00575713          	srli	a4,a4,0x5
80005458:	000d0593          	mv	a1,s10
8000545c:	96850513          	addi	a0,a0,-1688 # 80002968 <_ram_heap_end+0xfffea968>
80005460:	2e9090ef          	jal	ra,8000ef48 <iprintf>
80005464:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
80005468:	0187a703          	lw	a4,24(a5)
8000546c:	00170713          	addi	a4,a4,1
80005470:	00e7ac23          	sw	a4,24(a5)
80005474:	00c7a703          	lw	a4,12(a5)
80005478:	00170713          	addi	a4,a4,1
8000547c:	00e7a623          	sw	a4,12(a5)
80005480:	f0070737          	lui	a4,0xf0070
80005484:	04804263          	bgtz	s0,800054c8 <mac_rx+0x19c>
80005488:	03812403          	lw	s0,56(sp)
8000548c:	03c12083          	lw	ra,60(sp)
80005490:	03412483          	lw	s1,52(sp)
80005494:	03012903          	lw	s2,48(sp)
80005498:	02c12983          	lw	s3,44(sp)
8000549c:	02812a03          	lw	s4,40(sp)
800054a0:	02412a83          	lw	s5,36(sp)
800054a4:	02012b03          	lw	s6,32(sp)
800054a8:	01c12b83          	lw	s7,28(sp)
800054ac:	01812c03          	lw	s8,24(sp)
800054b0:	01412c83          	lw	s9,20(sp)
800054b4:	01012d03          	lw	s10,16(sp)
800054b8:	80003537          	lui	a0,0x80003
800054bc:	9b450513          	addi	a0,a0,-1612 # 800029b4 <_ram_heap_end+0xfffea9b4>
800054c0:	04010113          	addi	sp,sp,64
800054c4:	2850906f          	j	8000ef48 <iprintf>
800054c8:	00072783          	lw	a5,0(a4) # f0070000 <_ram_heap_end+0x70058000>
800054cc:	0207f793          	andi	a5,a5,32
800054d0:	fe078ce3          	beqz	a5,800054c8 <mac_rx+0x19c>
800054d4:	02072783          	lw	a5,32(a4)
800054d8:	ffc40413          	addi	s0,s0,-4
800054dc:	fa9ff06f          	j	80005484 <mac_rx+0x158>
800054e0:	ffe00593          	li	a1,-2
800054e4:	3e8020ef          	jal	ra,800078cc <pbuf_header>
800054e8:	00000713          	li	a4,0
800054ec:	00000793          	li	a5,0
800054f0:	f0070637          	lui	a2,0xf0070
800054f4:	04041a63          	bnez	s0,80005548 <mac_rx+0x21c>
800054f8:	00200593          	li	a1,2
800054fc:	00090513          	mv	a0,s2
80005500:	00492a03          	lw	s4,4(s2)
80005504:	3c8020ef          	jal	ra,800078cc <pbuf_header>
80005508:	0044a783          	lw	a5,4(s1)
8000550c:	000a8593          	mv	a1,s5
80005510:	00090513          	mv	a0,s2
80005514:	00178793          	addi	a5,a5,1
80005518:	00f4a223          	sw	a5,4(s1)
8000551c:	010aa783          	lw	a5,16(s5)
80005520:	000780e7          	jalr	a5
80005524:	00050593          	mv	a1,a0
80005528:	08050463          	beqz	a0,800055b0 <mac_rx+0x284>
8000552c:	f0000737          	lui	a4,0xf0000
80005530:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
80005534:	9f8c0513          	addi	a0,s8,-1544 # 800029f8 <_ram_heap_end+0xfffea9f8>
80005538:	0027e793          	ori	a5,a5,2
8000553c:	00f72223          	sw	a5,4(a4)
80005540:	209090ef          	jal	ra,8000ef48 <iprintf>
80005544:	06c0006f          	j	800055b0 <mac_rx+0x284>
80005548:	08099063          	bnez	s3,800055c8 <mac_rx+0x29c>
8000554c:	06078863          	beqz	a5,800055bc <mac_rx+0x290>
80005550:	0007a783          	lw	a5,0(a5)
80005554:	06079663          	bnez	a5,800055c0 <mac_rx+0x294>
80005558:	f0000737          	lui	a4,0xf0000
8000555c:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
80005560:	9d0c8513          	addi	a0,s9,-1584 # 800029d0 <_ram_heap_end+0xfffea9d0>
80005564:	0027e793          	ori	a5,a5,2
80005568:	00f72223          	sw	a5,4(a4)
8000556c:	7a1000ef          	jal	ra,8000650c <print_uart0>
80005570:	0184a783          	lw	a5,24(s1)
80005574:	f0070737          	lui	a4,0xf0070
80005578:	00178793          	addi	a5,a5,1
8000557c:	00f4ac23          	sw	a5,24(s1)
80005580:	00c4a783          	lw	a5,12(s1)
80005584:	00178793          	addi	a5,a5,1
80005588:	00f4a623          	sw	a5,12(s1)
8000558c:	00072783          	lw	a5,0(a4) # f0070000 <_ram_heap_end+0x70058000>
80005590:	0207f793          	andi	a5,a5,32
80005594:	fe078ce3          	beqz	a5,8000558c <mac_rx+0x260>
80005598:	02072783          	lw	a5,32(a4)
8000559c:	ffc40413          	addi	s0,s0,-4
800055a0:	fe8046e3          	bgtz	s0,8000558c <mac_rx+0x260>
800055a4:	00200593          	li	a1,2
800055a8:	00090513          	mv	a0,s2
800055ac:	320020ef          	jal	ra,800078cc <pbuf_header>
800055b0:	00090513          	mv	a0,s2
800055b4:	340020ef          	jal	ra,800078f4 <pbuf_free>
800055b8:	dc5ff06f          	j	8000537c <mac_rx+0x50>
800055bc:	00090793          	mv	a5,s2
800055c0:	00a7d983          	lhu	s3,10(a5)
800055c4:	0047aa03          	lw	s4,4(a5)
800055c8:	00071a63          	bnez	a4,800055dc <mac_rx+0x2b0>
800055cc:	00062683          	lw	a3,0(a2) # f0070000 <_ram_heap_end+0x70058000>
800055d0:	0206f693          	andi	a3,a3,32
800055d4:	fe068ce3          	beqz	a3,800055cc <mac_rx+0x2a0>
800055d8:	02062b03          	lw	s6,32(a2)
800055dc:	00170713          	addi	a4,a4,1
800055e0:	016a0023          	sb	s6,0(s4)
800055e4:	00377713          	andi	a4,a4,3
800055e8:	008b5b13          	srli	s6,s6,0x8
800055ec:	fff40413          	addi	s0,s0,-1
800055f0:	001a0a13          	addi	s4,s4,1
800055f4:	fff98993          	addi	s3,s3,-1
800055f8:	efdff06f          	j	800054f4 <mac_rx+0x1c8>

800055fc <mac_poll>:
800055fc:	ff010113          	addi	sp,sp,-16
80005600:	00812423          	sw	s0,8(sp)
80005604:	00112623          	sw	ra,12(sp)
80005608:	00912223          	sw	s1,4(sp)
8000560c:	c49ff0ef          	jal	ra,80005254 <sys_now>
80005610:	8bc1a683          	lw	a3,-1860(gp) # 8000332c <ts_etharp>
80005614:	00050413          	mv	s0,a0
80005618:	00a6f663          	bgeu	a3,a0,80005624 <mac_poll+0x28>
8000561c:	8b41a683          	lw	a3,-1868(gp) # 80003324 <ts_ipreass>
80005620:	02a6e063          	bltu	a3,a0,80005640 <mac_poll+0x44>
80005624:	8a81aa23          	sw	s0,-1868(gp) # 80003324 <ts_ipreass>
80005628:	8a81ae23          	sw	s0,-1860(gp) # 8000332c <ts_etharp>
8000562c:	00c12083          	lw	ra,12(sp)
80005630:	00812403          	lw	s0,8(sp)
80005634:	00412483          	lw	s1,4(sp)
80005638:	01010113          	addi	sp,sp,16
8000563c:	00008067          	ret
80005640:	8b01a783          	lw	a5,-1872(gp) # 80003320 <ts_dhcp_fine>
80005644:	1f300713          	li	a4,499
80005648:	40f507b3          	sub	a5,a0,a5
8000564c:	00f77663          	bgeu	a4,a5,80005658 <mac_poll+0x5c>
80005650:	329050ef          	jal	ra,8000b178 <dhcp_fine_tmr>
80005654:	8a81a823          	sw	s0,-1872(gp) # 80003320 <ts_dhcp_fine>
80005658:	8ac1a703          	lw	a4,-1876(gp) # 8000331c <ts_dhcp_coarse>
8000565c:	0000f7b7          	lui	a5,0xf
80005660:	a5f78793          	addi	a5,a5,-1441 # ea5f <_stack_size+0xda5f>
80005664:	40e40733          	sub	a4,s0,a4
80005668:	00e7f663          	bgeu	a5,a4,80005674 <mac_poll+0x78>
8000566c:	049050ef          	jal	ra,8000aeb4 <dhcp_coarse_tmr>
80005670:	8a81a623          	sw	s0,-1876(gp) # 8000331c <ts_dhcp_coarse>
80005674:	f00607b7          	lui	a5,0xf0060
80005678:	0087a783          	lw	a5,8(a5) # f0060008 <_ram_heap_end+0x70048008>
8000567c:	0047f793          	andi	a5,a5,4
80005680:	fa0786e3          	beqz	a5,8000562c <mac_poll+0x30>
80005684:	00812403          	lw	s0,8(sp)
80005688:	00c12083          	lw	ra,12(sp)
8000568c:	00412483          	lw	s1,4(sp)
80005690:	01010113          	addi	sp,sp,16
80005694:	c99ff06f          	j	8000532c <mac_rx>

80005698 <mac_print_stats>:
80005698:	ee010113          	addi	sp,sp,-288
8000569c:	9d818513          	addi	a0,gp,-1576 # 80003448 <default_netif+0x4>
800056a0:	10112e23          	sw	ra,284(sp)
800056a4:	46d070ef          	jal	ra,8000d310 <ip4addr_ntoa>
800056a8:	a2c18713          	addi	a4,gp,-1492 # 8000349c <lwip_stats>
800056ac:	01072783          	lw	a5,16(a4)
800056b0:	80003637          	lui	a2,0x80003
800056b4:	00050693          	mv	a3,a0
800056b8:	00f12223          	sw	a5,4(sp)
800056bc:	01472783          	lw	a5,20(a4)
800056c0:	a2460613          	addi	a2,a2,-1500 # 80002a24 <_ram_heap_end+0xfffeaa24>
800056c4:	10000593          	li	a1,256
800056c8:	00f12023          	sw	a5,0(sp)
800056cc:	00c72883          	lw	a7,12(a4)
800056d0:	02872803          	lw	a6,40(a4)
800056d4:	00072783          	lw	a5,0(a4)
800056d8:	00472703          	lw	a4,4(a4)
800056dc:	01010513          	addi	a0,sp,16
800056e0:	339090ef          	jal	ra,8000f218 <sniprintf>
800056e4:	01010513          	addi	a0,sp,16
800056e8:	625000ef          	jal	ra,8000650c <print_uart0>
800056ec:	11c12083          	lw	ra,284(sp)
800056f0:	12010113          	addi	sp,sp,288
800056f4:	00008067          	ret

800056f8 <hub_init>:
800056f8:	fe010113          	addi	sp,sp,-32
800056fc:	00912a23          	sw	s1,20(sp)
80005700:	800034b7          	lui	s1,0x80003
80005704:	2004c783          	lbu	a5,512(s1) # 80003200 <_ram_heap_end+0xfffeb200>
80005708:	00112e23          	sw	ra,28(sp)
8000570c:	00812c23          	sw	s0,24(sp)
80005710:	01212823          	sw	s2,16(sp)
80005714:	01312623          	sw	s3,12(sp)
80005718:	01412423          	sw	s4,8(sp)
8000571c:	01512223          	sw	s5,4(sp)
80005720:	01612023          	sw	s6,0(sp)
80005724:	20048493          	addi	s1,s1,512
80005728:	04f50063          	beq	a0,a5,80005768 <hub_init+0x70>
8000572c:	0054c703          	lbu	a4,5(s1)
80005730:	fff00793          	li	a5,-1
80005734:	00100a13          	li	s4,1
80005738:	02e50a63          	beq	a0,a4,8000576c <hub_init+0x74>
8000573c:	01c12083          	lw	ra,28(sp)
80005740:	01812403          	lw	s0,24(sp)
80005744:	01412483          	lw	s1,20(sp)
80005748:	01012903          	lw	s2,16(sp)
8000574c:	00c12983          	lw	s3,12(sp)
80005750:	00812a03          	lw	s4,8(sp)
80005754:	00412a83          	lw	s5,4(sp)
80005758:	00012b03          	lw	s6,0(sp)
8000575c:	00078513          	mv	a0,a5
80005760:	02010113          	addi	sp,sp,32
80005764:	00008067          	ret
80005768:	00000a13          	li	s4,0
8000576c:	002a1993          	slli	s3,s4,0x2
80005770:	014987b3          	add	a5,s3,s4
80005774:	00f487b3          	add	a5,s1,a5
80005778:	0017c403          	lbu	s0,1(a5)
8000577c:	0027c903          	lbu	s2,2(a5)
80005780:	0037ca83          	lbu	s5,3(a5)
80005784:	00040513          	mv	a0,s0
80005788:	00090593          	mv	a1,s2
8000578c:	0047cb03          	lbu	s6,4(a5)
80005790:	4ac080ef          	jal	ra,8000dc3c <__mulsi3>
80005794:	000a8593          	mv	a1,s5
80005798:	4a4080ef          	jal	ra,8000dc3c <__mulsi3>
8000579c:	000b0593          	mv	a1,s6
800057a0:	49c080ef          	jal	ra,8000dc3c <__mulsi3>
800057a4:	40355513          	srai	a0,a0,0x3
800057a8:	8ca1a423          	sw	a0,-1848(gp) # 80003338 <hub_frame_size>
800057ac:	8c81a223          	sw	s0,-1852(gp) # 80003334 <hub_frame_width>
800057b0:	000a8593          	mv	a1,s5
800057b4:	00090513          	mv	a0,s2
800057b8:	484080ef          	jal	ra,8000dc3c <__mulsi3>
800057bc:	8ca1a023          	sw	a0,-1856(gp) # 80003330 <hub_frame_height>
800057c0:	f00547b7          	lui	a5,0xf0054
800057c4:	0007a023          	sw	zero,0(a5) # f0054000 <_ram_heap_end+0x7003c000>
800057c8:	000b0593          	mv	a1,s6
800057cc:	00040513          	mv	a0,s0
800057d0:	46c080ef          	jal	ra,8000dc3c <__mulsi3>
800057d4:	000a8593          	mv	a1,s5
800057d8:	464080ef          	jal	ra,8000dc3c <__mulsi3>
800057dc:	00000693          	li	a3,0
800057e0:	00000713          	li	a4,0
800057e4:	f0050637          	lui	a2,0xf0050
800057e8:	000015b7          	lui	a1,0x1
800057ec:	03274e63          	blt	a4,s2,80005828 <hub_init+0x130>
800057f0:	014989b3          	add	s3,s3,s4
800057f4:	013484b3          	add	s1,s1,s3
800057f8:	0004c783          	lbu	a5,0(s1)
800057fc:	01041413          	slli	s0,s0,0x10
80005800:	01891913          	slli	s2,s2,0x18
80005804:	01246433          	or	s0,s0,s2
80005808:	00f46433          	or	s0,s0,a5
8000580c:	000107b7          	lui	a5,0x10
80005810:	f8078793          	addi	a5,a5,-128 # ff80 <_stack_size+0xef80>
80005814:	00f46433          	or	s0,s0,a5
80005818:	f00547b7          	lui	a5,0xf0054
8000581c:	0087a023          	sw	s0,0(a5) # f0054000 <_ram_heap_end+0x7003c000>
80005820:	00000793          	li	a5,0
80005824:	f19ff06f          	j	8000573c <hub_init+0x44>
80005828:	00b707b3          	add	a5,a4,a1
8000582c:	00279793          	slli	a5,a5,0x2
80005830:	4036d813          	srai	a6,a3,0x3
80005834:	00f607b3          	add	a5,a2,a5
80005838:	0107a223          	sw	a6,4(a5)
8000583c:	00170713          	addi	a4,a4,1
80005840:	00a686b3          	add	a3,a3,a0
80005844:	fa9ff06f          	j	800057ec <hub_init+0xf4>

80005848 <hub_print_char>:
80005848:	f9010113          	addi	sp,sp,-112
8000584c:	05812423          	sw	s8,72(sp)
80005850:	00078c13          	mv	s8,a5
80005854:	07812783          	lw	a5,120(sp)
80005858:	06912223          	sw	s1,100(sp)
8000585c:	05312e23          	sw	s3,92(sp)
80005860:	41f7d493          	srai	s1,a5,0x1f
80005864:	0074f493          	andi	s1,s1,7
80005868:	00f484b3          	add	s1,s1,a5
8000586c:	05412c23          	sw	s4,88(sp)
80005870:	02a12023          	sw	a0,32(sp)
80005874:	06112623          	sw	ra,108(sp)
80005878:	06812423          	sw	s0,104(sp)
8000587c:	07212023          	sw	s2,96(sp)
80005880:	05512a23          	sw	s5,84(sp)
80005884:	05612823          	sw	s6,80(sp)
80005888:	05712623          	sw	s7,76(sp)
8000588c:	05912223          	sw	s9,68(sp)
80005890:	05a12023          	sw	s10,64(sp)
80005894:	03b12e23          	sw	s11,60(sp)
80005898:	02c12223          	sw	a2,36(sp)
8000589c:	02e12423          	sw	a4,40(sp)
800058a0:	03012623          	sw	a6,44(sp)
800058a4:	0077f793          	andi	a5,a5,7
800058a8:	00058513          	mv	a0,a1
800058ac:	00068993          	mv	s3,a3
800058b0:	00088a13          	mv	s4,a7
800058b4:	4034d493          	srai	s1,s1,0x3
800058b8:	00078463          	beqz	a5,800058c0 <hub_print_char+0x78>
800058bc:	00148493          	addi	s1,s1,1
800058c0:	07412583          	lw	a1,116(sp)
800058c4:	00000b93          	li	s7,0
800058c8:	374080ef          	jal	ra,8000dc3c <__mulsi3>
800058cc:	00048593          	mv	a1,s1
800058d0:	36c080ef          	jal	ra,8000dc3c <__mulsi3>
800058d4:	07012a83          	lw	s5,112(sp)
800058d8:	003c1793          	slli	a5,s8,0x3
800058dc:	00098593          	mv	a1,s3
800058e0:	00aa8ab3          	add	s5,s5,a0
800058e4:	000c0513          	mv	a0,s8
800058e8:	00f12e23          	sw	a5,28(sp)
800058ec:	350080ef          	jal	ra,8000dc3c <__mulsi3>
800058f0:	00a12823          	sw	a0,16(sp)
800058f4:	049bc063          	blt	s7,s1,80005934 <hub_print_char+0xec>
800058f8:	06c12083          	lw	ra,108(sp)
800058fc:	06812403          	lw	s0,104(sp)
80005900:	06412483          	lw	s1,100(sp)
80005904:	06012903          	lw	s2,96(sp)
80005908:	05c12983          	lw	s3,92(sp)
8000590c:	05812a03          	lw	s4,88(sp)
80005910:	05412a83          	lw	s5,84(sp)
80005914:	05012b03          	lw	s6,80(sp)
80005918:	04c12b83          	lw	s7,76(sp)
8000591c:	04812c03          	lw	s8,72(sp)
80005920:	04412c83          	lw	s9,68(sp)
80005924:	04012d03          	lw	s10,64(sp)
80005928:	03c12d83          	lw	s11,60(sp)
8000592c:	07010113          	addi	sp,sp,112
80005930:	00008067          	ret
80005934:	07812703          	lw	a4,120(sp)
80005938:	003b9793          	slli	a5,s7,0x3
8000593c:	40f707b3          	sub	a5,a4,a5
80005940:	00f12623          	sw	a5,12(sp)
80005944:	00c12703          	lw	a4,12(sp)
80005948:	00800793          	li	a5,8
8000594c:	00e7d463          	bge	a5,a4,80005954 <hub_print_char+0x10c>
80005950:	00f12623          	sw	a5,12(sp)
80005954:	02412b03          	lw	s6,36(sp)
80005958:	00000c93          	li	s9,0
8000595c:	07412783          	lw	a5,116(sp)
80005960:	02fcc263          	blt	s9,a5,80005984 <hub_print_char+0x13c>
80005964:	00fa8ab3          	add	s5,s5,a5
80005968:	01c12703          	lw	a4,28(sp)
8000596c:	01012783          	lw	a5,16(sp)
80005970:	001b8b93          	addi	s7,s7,1
80005974:	00898993          	addi	s3,s3,8
80005978:	00e787b3          	add	a5,a5,a4
8000597c:	00f12823          	sw	a5,16(sp)
80005980:	f75ff06f          	j	800058f4 <hub_print_char+0xac>
80005984:	020b4863          	bltz	s6,800059b4 <hub_print_char+0x16c>
80005988:	038b5663          	bge	s6,s8,800059b4 <hub_print_char+0x16c>
8000598c:	019a87b3          	add	a5,s5,s9
80005990:	0007c783          	lbu	a5,0(a5)
80005994:	00000d13          	li	s10,0
80005998:	00f12c23          	sw	a5,24(sp)
8000599c:	01012783          	lw	a5,16(sp)
800059a0:	00fb0db3          	add	s11,s6,a5
800059a4:	00100793          	li	a5,1
800059a8:	00f12423          	sw	a5,8(sp)
800059ac:	00c12783          	lw	a5,12(sp)
800059b0:	00fd4863          	blt	s10,a5,800059c0 <hub_print_char+0x178>
800059b4:	001b0b13          	addi	s6,s6,1
800059b8:	001c8c93          	addi	s9,s9,1
800059bc:	fa1ff06f          	j	8000595c <hub_print_char+0x114>
800059c0:	013d07b3          	add	a5,s10,s3
800059c4:	0407ca63          	bltz	a5,80005a18 <hub_print_char+0x1d0>
800059c8:	02c12703          	lw	a4,44(sp)
800059cc:	04e7d663          	bge	a5,a4,80005a18 <hub_print_char+0x1d0>
800059d0:	00c00793          	li	a5,12
800059d4:	06fa0063          	beq	s4,a5,80005a34 <hub_print_char+0x1ec>
800059d8:	04b00793          	li	a5,75
800059dc:	08fa0a63          	beq	s4,a5,80005a70 <hub_print_char+0x228>
800059e0:	01412783          	lw	a5,20(sp)
800059e4:	00279913          	slli	s2,a5,0x2
800059e8:	02012783          	lw	a5,32(sp)
800059ec:	01278933          	add	s2,a5,s2
800059f0:	00092503          	lw	a0,0(s2)
800059f4:	441070ef          	jal	ra,8000d634 <__bswapsi2>
800059f8:	01812783          	lw	a5,24(sp)
800059fc:	00812703          	lw	a4,8(sp)
80005a00:	00e7f7b3          	and	a5,a5,a4
80005a04:	10078263          	beqz	a5,80005b08 <hub_print_char+0x2c0>
80005a08:	00c00793          	li	a5,12
80005a0c:	0afa0663          	beq	s4,a5,80005ab8 <hub_print_char+0x270>
80005a10:	04b00793          	li	a5,75
80005a14:	0afa0a63          	beq	s4,a5,80005ac8 <hub_print_char+0x280>
80005a18:	00812783          	lw	a5,8(sp)
80005a1c:	001d0d13          	addi	s10,s10,1
80005a20:	018d8db3          	add	s11,s11,s8
80005a24:	00179793          	slli	a5,a5,0x1
80005a28:	0ff7f793          	andi	a5,a5,255
80005a2c:	00f12423          	sw	a5,8(sp)
80005a30:	f7dff06f          	j	800059ac <hub_print_char+0x164>
80005a34:	41fdd793          	srai	a5,s11,0x1f
80005a38:	01f7f793          	andi	a5,a5,31
80005a3c:	01b787b3          	add	a5,a5,s11
80005a40:	4057d793          	srai	a5,a5,0x5
80005a44:	00f12a23          	sw	a5,20(sp)
80005a48:	800007b7          	lui	a5,0x80000
80005a4c:	01f78793          	addi	a5,a5,31 # 8000001f <_ram_heap_end+0xfffe801f>
80005a50:	00fdf433          	and	s0,s11,a5
80005a54:	00045863          	bgez	s0,80005a64 <hub_print_char+0x21c>
80005a58:	fff40413          	addi	s0,s0,-1
80005a5c:	fe046413          	ori	s0,s0,-32
80005a60:	00140413          	addi	s0,s0,1
80005a64:	800007b7          	lui	a5,0x80000
80005a68:	0087d433          	srl	s0,a5,s0
80005a6c:	f75ff06f          	j	800059e0 <hub_print_char+0x198>
80005a70:	41fdd793          	srai	a5,s11,0x1f
80005a74:	0037f793          	andi	a5,a5,3
80005a78:	01b787b3          	add	a5,a5,s11
80005a7c:	4027d793          	srai	a5,a5,0x2
80005a80:	00f12a23          	sw	a5,20(sp)
80005a84:	800007b7          	lui	a5,0x80000
80005a88:	00378793          	addi	a5,a5,3 # 80000003 <_ram_heap_end+0xfffe8003>
80005a8c:	00fdf433          	and	s0,s11,a5
80005a90:	00045863          	bgez	s0,80005aa0 <hub_print_char+0x258>
80005a94:	fff40413          	addi	s0,s0,-1
80005a98:	ffc46413          	ori	s0,s0,-4
80005a9c:	00140413          	addi	s0,s0,1
80005aa0:	00300793          	li	a5,3
80005aa4:	40878433          	sub	s0,a5,s0
80005aa8:	00341413          	slli	s0,s0,0x3
80005aac:	0ff00793          	li	a5,255
80005ab0:	00879433          	sll	s0,a5,s0
80005ab4:	f2dff06f          	j	800059e0 <hub_print_char+0x198>
80005ab8:	00a46533          	or	a0,s0,a0
80005abc:	379070ef          	jal	ra,8000d634 <__bswapsi2>
80005ac0:	00a92023          	sw	a0,0(s2)
80005ac4:	f55ff06f          	j	80005a18 <hub_print_char+0x1d0>
80005ac8:	fff44793          	not	a5,s0
80005acc:	00a7f533          	and	a0,a5,a0
80005ad0:	800007b7          	lui	a5,0x80000
80005ad4:	00378793          	addi	a5,a5,3 # 80000003 <_ram_heap_end+0xfffe8003>
80005ad8:	00fdf7b3          	and	a5,s11,a5
80005adc:	0007d863          	bgez	a5,80005aec <hub_print_char+0x2a4>
80005ae0:	fff78793          	addi	a5,a5,-1
80005ae4:	ffc7e793          	ori	a5,a5,-4
80005ae8:	00178793          	addi	a5,a5,1
80005aec:	00300713          	li	a4,3
80005af0:	40f707b3          	sub	a5,a4,a5
80005af4:	02812703          	lw	a4,40(sp)
80005af8:	00379793          	slli	a5,a5,0x3
80005afc:	00f717b3          	sll	a5,a4,a5
80005b00:	00a7e533          	or	a0,a5,a0
80005b04:	fb9ff06f          	j	80005abc <hub_print_char+0x274>
80005b08:	00c00793          	li	a5,12
80005b0c:	00fa0663          	beq	s4,a5,80005b18 <hub_print_char+0x2d0>
80005b10:	04b00793          	li	a5,75
80005b14:	f0fa12e3          	bne	s4,a5,80005a18 <hub_print_char+0x1d0>
80005b18:	fff44793          	not	a5,s0
80005b1c:	00a7f533          	and	a0,a5,a0
80005b20:	f9dff06f          	j	80005abc <hub_print_char+0x274>

80005b24 <hub_print>:
80005b24:	fb010113          	addi	sp,sp,-80
80005b28:	04812423          	sw	s0,72(sp)
80005b2c:	04912223          	sw	s1,68(sp)
80005b30:	05212023          	sw	s2,64(sp)
80005b34:	03312e23          	sw	s3,60(sp)
80005b38:	03412c23          	sw	s4,56(sp)
80005b3c:	03512a23          	sw	s5,52(sp)
80005b40:	03612823          	sw	s6,48(sp)
80005b44:	03712623          	sw	s7,44(sp)
80005b48:	03812423          	sw	s8,40(sp)
80005b4c:	03912223          	sw	s9,36(sp)
80005b50:	03a12023          	sw	s10,32(sp)
80005b54:	01b12e23          	sw	s11,28(sp)
80005b58:	04112623          	sw	ra,76(sp)
80005b5c:	00058a13          	mv	s4,a1
80005b60:	00068a93          	mv	s5,a3
80005b64:	00070993          	mv	s3,a4
80005b68:	00078b13          	mv	s6,a5
80005b6c:	00080913          	mv	s2,a6
80005b70:	00088b93          	mv	s7,a7
80005b74:	00050493          	mv	s1,a0
80005b78:	00000413          	li	s0,0
80005b7c:	f0054c37          	lui	s8,0xf0054
80005b80:	0ff67d93          	andi	s11,a2,255
80005b84:	05344063          	blt	s0,s3,80005bc4 <hub_print+0xa0>
80005b88:	04c12083          	lw	ra,76(sp)
80005b8c:	04812403          	lw	s0,72(sp)
80005b90:	04412483          	lw	s1,68(sp)
80005b94:	04012903          	lw	s2,64(sp)
80005b98:	03c12983          	lw	s3,60(sp)
80005b9c:	03812a03          	lw	s4,56(sp)
80005ba0:	03412a83          	lw	s5,52(sp)
80005ba4:	03012b03          	lw	s6,48(sp)
80005ba8:	02c12b83          	lw	s7,44(sp)
80005bac:	02812c03          	lw	s8,40(sp)
80005bb0:	02412c83          	lw	s9,36(sp)
80005bb4:	02012d03          	lw	s10,32(sp)
80005bb8:	01c12d83          	lw	s11,28(sp)
80005bbc:	05010113          	addi	sp,sp,80
80005bc0:	00008067          	ret
80005bc4:	000c2883          	lw	a7,0(s8) # f0054000 <_ram_heap_end+0x7003c000>
80005bc8:	008a85b3          	add	a1,s5,s0
80005bcc:	01712423          	sw	s7,8(sp)
80005bd0:	01212223          	sw	s2,4(sp)
80005bd4:	01612023          	sw	s6,0(sp)
80005bd8:	8c01a803          	lw	a6,-1856(gp) # 80003330 <hub_frame_height>
80005bdc:	8c41a783          	lw	a5,-1852(gp) # 80003334 <hub_frame_width>
80005be0:	0005c583          	lbu	a1,0(a1) # 1000 <_stack_size>
80005be4:	00048613          	mv	a2,s1
80005be8:	07f8f893          	andi	a7,a7,127
80005bec:	000d8713          	mv	a4,s11
80005bf0:	000a0693          	mv	a3,s4
80005bf4:	f0050537          	lui	a0,0xf0050
80005bf8:	c51ff0ef          	jal	ra,80005848 <hub_print_char>
80005bfc:	00140413          	addi	s0,s0,1
80005c00:	012484b3          	add	s1,s1,s2
80005c04:	f81ff06f          	j	80005b84 <hub_print+0x60>

80005c08 <modbus_udp_init>:
80005c08:	ff010113          	addi	sp,sp,-16
80005c0c:	02e00513          	li	a0,46
80005c10:	00912223          	sw	s1,4(sp)
80005c14:	00112623          	sw	ra,12(sp)
80005c18:	00812423          	sw	s0,8(sp)
80005c1c:	125030ef          	jal	ra,80009540 <udp_new_ip_type>
80005c20:	8ca1a623          	sw	a0,-1844(gp) # 8000333c <modbus_udp_pcb>
80005c24:	02051663          	bnez	a0,80005c50 <modbus_udp_init+0x48>
80005c28:	80003537          	lui	a0,0x80003
80005c2c:	a8050513          	addi	a0,a0,-1408 # 80002a80 <_ram_heap_end+0xfffeaa80>
80005c30:	318090ef          	jal	ra,8000ef48 <iprintf>
80005c34:	fff00413          	li	s0,-1
80005c38:	00040513          	mv	a0,s0
80005c3c:	00c12083          	lw	ra,12(sp)
80005c40:	00812403          	lw	s0,8(sp)
80005c44:	00412483          	lw	s1,4(sp)
80005c48:	01010113          	addi	sp,sp,16
80005c4c:	00008067          	ret
80005c50:	7d100613          	li	a2,2001
80005c54:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
80005c58:	358030ef          	jal	ra,80008fb0 <udp_bind>
80005c5c:	00050413          	mv	s0,a0
80005c60:	00050e63          	beqz	a0,80005c7c <modbus_udp_init+0x74>
80005c64:	80003537          	lui	a0,0x80003
80005c68:	ab050513          	addi	a0,a0,-1360 # 80002ab0 <_ram_heap_end+0xfffeaab0>
80005c6c:	2dc090ef          	jal	ra,8000ef48 <iprintf>
80005c70:	8cc1a503          	lw	a0,-1844(gp) # 8000333c <modbus_udp_pcb>
80005c74:	039030ef          	jal	ra,800094ac <udp_remove>
80005c78:	fc1ff06f          	j	80005c38 <modbus_udp_init+0x30>
80005c7c:	8cc1a503          	lw	a0,-1844(gp) # 8000333c <modbus_udp_pcb>
80005c80:	800065b7          	lui	a1,0x80006
80005c84:	00000613          	li	a2,0
80005c88:	df858593          	addi	a1,a1,-520 # 80005df8 <_ram_heap_end+0xfffeddf8>
80005c8c:	011030ef          	jal	ra,8000949c <udp_recv>
80005c90:	80003537          	lui	a0,0x80003
80005c94:	adc50513          	addi	a0,a0,-1316 # 80002adc <_ram_heap_end+0xfffeaadc>
80005c98:	2b0090ef          	jal	ra,8000ef48 <iprintf>
80005c9c:	f9dff06f          	j	80005c38 <modbus_udp_init+0x30>

80005ca0 <modbus_udp_send>:
80005ca0:	fe010113          	addi	sp,sp,-32
80005ca4:	01212823          	sw	s2,16(sp)
80005ca8:	00168913          	addi	s2,a3,1
80005cac:	01412423          	sw	s4,8(sp)
80005cb0:	00058a13          	mv	s4,a1
80005cb4:	01091593          	slli	a1,s2,0x10
80005cb8:	01312623          	sw	s3,12(sp)
80005cbc:	01512223          	sw	s5,4(sp)
80005cc0:	00050993          	mv	s3,a0
80005cc4:	00060a93          	mv	s5,a2
80005cc8:	0105d593          	srli	a1,a1,0x10
80005ccc:	28000613          	li	a2,640
80005cd0:	03800513          	li	a0,56
80005cd4:	00912a23          	sw	s1,20(sp)
80005cd8:	00112e23          	sw	ra,28(sp)
80005cdc:	00812c23          	sw	s0,24(sp)
80005ce0:	00068493          	mv	s1,a3
80005ce4:	4e5010ef          	jal	ra,800079c8 <pbuf_alloc>
80005ce8:	04051063          	bnez	a0,80005d28 <modbus_udp_send+0x88>
80005cec:	f0000737          	lui	a4,0xf0000
80005cf0:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
80005cf4:	80003537          	lui	a0,0x80003
80005cf8:	af850513          	addi	a0,a0,-1288 # 80002af8 <_ram_heap_end+0xfffeaaf8>
80005cfc:	ffd7f793          	andi	a5,a5,-3
80005d00:	00f72223          	sw	a5,4(a4)
80005d04:	01812403          	lw	s0,24(sp)
80005d08:	01c12083          	lw	ra,28(sp)
80005d0c:	01412483          	lw	s1,20(sp)
80005d10:	01012903          	lw	s2,16(sp)
80005d14:	00c12983          	lw	s3,12(sp)
80005d18:	00812a03          	lw	s4,8(sp)
80005d1c:	00412a83          	lw	s5,4(sp)
80005d20:	02010113          	addi	sp,sp,32
80005d24:	2240906f          	j	8000ef48 <iprintf>
80005d28:	00452783          	lw	a5,4(a0)
80005d2c:	00050413          	mv	s0,a0
80005d30:	00078663          	beqz	a5,80005d3c <modbus_udp_send+0x9c>
80005d34:	00a55703          	lhu	a4,10(a0)
80005d38:	05277463          	bgeu	a4,s2,80005d80 <modbus_udp_send+0xe0>
80005d3c:	f0000737          	lui	a4,0xf0000
80005d40:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
80005d44:	80003537          	lui	a0,0x80003
80005d48:	b2850513          	addi	a0,a0,-1240 # 80002b28 <_ram_heap_end+0xfffeab28>
80005d4c:	ffd7f793          	andi	a5,a5,-3
80005d50:	00f72223          	sw	a5,4(a4)
80005d54:	00a45603          	lhu	a2,10(s0)
80005d58:	00442583          	lw	a1,4(s0)
80005d5c:	01812403          	lw	s0,24(sp)
80005d60:	01c12083          	lw	ra,28(sp)
80005d64:	01412483          	lw	s1,20(sp)
80005d68:	01012903          	lw	s2,16(sp)
80005d6c:	00c12983          	lw	s3,12(sp)
80005d70:	00812a03          	lw	s4,8(sp)
80005d74:	00412a83          	lw	s5,4(sp)
80005d78:	02010113          	addi	sp,sp,32
80005d7c:	1cc0906f          	j	8000ef48 <iprintf>
80005d80:	00048613          	mv	a2,s1
80005d84:	000a8593          	mv	a1,s5
80005d88:	00078513          	mv	a0,a5
80005d8c:	57d080ef          	jal	ra,8000eb08 <memcpy>
80005d90:	009507b3          	add	a5,a0,s1
80005d94:	00078023          	sb	zero,0(a5)
80005d98:	8cc1a503          	lw	a0,-1844(gp) # 8000333c <modbus_udp_pcb>
80005d9c:	00040593          	mv	a1,s0
80005da0:	000a0693          	mv	a3,s4
80005da4:	00098613          	mv	a2,s3
80005da8:	538030ef          	jal	ra,800092e0 <udp_sendto>
80005dac:	00050593          	mv	a1,a0
80005db0:	02050063          	beqz	a0,80005dd0 <modbus_udp_send+0x130>
80005db4:	f0000737          	lui	a4,0xf0000
80005db8:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
80005dbc:	80003537          	lui	a0,0x80003
80005dc0:	b6050513          	addi	a0,a0,-1184 # 80002b60 <_ram_heap_end+0xfffeab60>
80005dc4:	ffd7f793          	andi	a5,a5,-3
80005dc8:	00f72223          	sw	a5,4(a4)
80005dcc:	17c090ef          	jal	ra,8000ef48 <iprintf>
80005dd0:	00040513          	mv	a0,s0
80005dd4:	01812403          	lw	s0,24(sp)
80005dd8:	01c12083          	lw	ra,28(sp)
80005ddc:	01412483          	lw	s1,20(sp)
80005de0:	01012903          	lw	s2,16(sp)
80005de4:	00c12983          	lw	s3,12(sp)
80005de8:	00812a03          	lw	s4,8(sp)
80005dec:	00412a83          	lw	s5,4(sp)
80005df0:	02010113          	addi	sp,sp,32
80005df4:	3010106f          	j	800078f4 <pbuf_free>

80005df8 <modbus_udp_recv>:
80005df8:	f6010113          	addi	sp,sp,-160
80005dfc:	08812c23          	sw	s0,152(sp)
80005e00:	00060413          	mv	s0,a2
80005e04:	00a45583          	lhu	a1,10(s0)
80005e08:	00442503          	lw	a0,4(s0)
80005e0c:	01010613          	addi	a2,sp,16
80005e10:	00e12623          	sw	a4,12(sp)
80005e14:	08112e23          	sw	ra,156(sp)
80005e18:	08912a23          	sw	s1,148(sp)
80005e1c:	00068493          	mv	s1,a3
80005e20:	db1fe0ef          	jal	ra,80004bd0 <modbus_recv>
80005e24:	00a12423          	sw	a0,8(sp)
80005e28:	00040513          	mv	a0,s0
80005e2c:	2c9010ef          	jal	ra,800078f4 <pbuf_free>
80005e30:	00812683          	lw	a3,8(sp)
80005e34:	00c12703          	lw	a4,12(sp)
80005e38:	00068a63          	beqz	a3,80005e4c <modbus_udp_recv+0x54>
80005e3c:	01010613          	addi	a2,sp,16
80005e40:	00070593          	mv	a1,a4
80005e44:	00048513          	mv	a0,s1
80005e48:	e59ff0ef          	jal	ra,80005ca0 <modbus_udp_send>
80005e4c:	09c12083          	lw	ra,156(sp)
80005e50:	09812403          	lw	s0,152(sp)
80005e54:	09412483          	lw	s1,148(sp)
80005e58:	0a010113          	addi	sp,sp,160
80005e5c:	00008067          	ret

80005e60 <plic_print_stats>:
80005e60:	f7010113          	addi	sp,sp,-144
80005e64:	08112623          	sw	ra,140(sp)
80005e68:	f00605b7          	lui	a1,0xf0060
80005e6c:	0005a603          	lw	a2,0(a1) # f0060000 <_ram_heap_end+0x70048000>
80005e70:	0045a683          	lw	a3,4(a1)
80005e74:	00c5a703          	lw	a4,12(a1)
80005e78:	0085a783          	lw	a5,8(a1)
80005e7c:	0105a803          	lw	a6,16(a1)
80005e80:	800035b7          	lui	a1,0x80003
80005e84:	b9858593          	addi	a1,a1,-1128 # 80002b98 <_ram_heap_end+0xfffeab98>
80005e88:	00010513          	mv	a0,sp
80005e8c:	4a8090ef          	jal	ra,8000f334 <siprintf>
80005e90:	00010513          	mv	a0,sp
80005e94:	678000ef          	jal	ra,8000650c <print_uart0>
80005e98:	08c12083          	lw	ra,140(sp)
80005e9c:	09010113          	addi	sp,sp,144
80005ea0:	00008067          	ret

80005ea4 <audiodac0_stop_playback>:
80005ea4:	f00c0737          	lui	a4,0xf00c0
80005ea8:	00472783          	lw	a5,4(a4) # f00c0004 <_ram_heap_end+0x700a8004>
80005eac:	ffa7f793          	andi	a5,a5,-6
80005eb0:	00f72223          	sw	a5,4(a4)
80005eb4:	00008067          	ret

80005eb8 <audiodac_init>:
80005eb8:	ff010113          	addi	sp,sp,-16
80005ebc:	00812423          	sw	s0,8(sp)
80005ec0:	00050413          	mv	s0,a0
80005ec4:	03938537          	lui	a0,0x3938
80005ec8:	00559593          	slli	a1,a1,0x5
80005ecc:	70050513          	addi	a0,a0,1792 # 3938700 <_stack_size+0x3937700>
80005ed0:	00112623          	sw	ra,12(sp)
80005ed4:	58d070ef          	jal	ra,8000dc60 <__divsi3>
80005ed8:	00200793          	li	a5,2
80005edc:	00f42423          	sw	a5,8(s0)
80005ee0:	00a42623          	sw	a0,12(s0)
80005ee4:	01000793          	li	a5,16
80005ee8:	00f42823          	sw	a5,16(s0)
80005eec:	00f42a23          	sw	a5,20(s0)
80005ef0:	11000737          	lui	a4,0x11000
80005ef4:	00f42c23          	sw	a5,24(s0)
80005ef8:	00170713          	addi	a4,a4,1 # 11000001 <_stack_size+0x10fff001>
80005efc:	00e42023          	sw	a4,0(s0)
80005f00:	000087b7          	lui	a5,0x8
80005f04:	00f42023          	sw	a5,0(s0)
80005f08:	100007b7          	lui	a5,0x10000
80005f0c:	00178793          	addi	a5,a5,1 # 10000001 <_stack_size+0xffff001>
80005f10:	00f42023          	sw	a5,0(s0)
80005f14:	00e42023          	sw	a4,0(s0)
80005f18:	0000c6b7          	lui	a3,0xc
80005f1c:	00d42023          	sw	a3,0(s0)
80005f20:	00f42023          	sw	a5,0(s0)
80005f24:	00e42023          	sw	a4,0(s0)
80005f28:	0000a737          	lui	a4,0xa
80005f2c:	00e42023          	sw	a4,0(s0)
80005f30:	00f42023          	sw	a5,0(s0)
80005f34:	00812403          	lw	s0,8(sp)
80005f38:	00c12083          	lw	ra,12(sp)
80005f3c:	00050593          	mv	a1,a0
80005f40:	80003537          	lui	a0,0x80003
80005f44:	be850513          	addi	a0,a0,-1048 # 80002be8 <_ram_heap_end+0xfffeabe8>
80005f48:	01010113          	addi	sp,sp,16
80005f4c:	7fd0806f          	j	8000ef48 <iprintf>

80005f50 <audiodac_wait_tx_avail>:
80005f50:	00000793          	li	a5,0
80005f54:	00000713          	li	a4,0
80005f58:	00c74a63          	blt	a4,a2,80005f6c <audiodac_wait_tx_avail+0x1c>
80005f5c:	00c71463          	bne	a4,a2,80005f64 <audiodac_wait_tx_avail+0x14>
80005f60:	00000793          	li	a5,0
80005f64:	00078513          	mv	a0,a5
80005f68:	00008067          	ret
80005f6c:	00452783          	lw	a5,4(a0)
80005f70:	0107d793          	srli	a5,a5,0x10
80005f74:	feb7d8e3          	bge	a5,a1,80005f64 <audiodac_wait_tx_avail+0x14>
80005f78:	00170713          	addi	a4,a4,1 # a001 <_stack_size+0x9001>
80005f7c:	fddff06f          	j	80005f58 <audiodac_wait_tx_avail+0x8>

80005f80 <audiodac_xmit>:
80005f80:	fc010113          	addi	sp,sp,-64
80005f84:	03312623          	sw	s3,44(sp)
80005f88:	03412423          	sw	s4,40(sp)
80005f8c:	110009b7          	lui	s3,0x11000
80005f90:	10000a37          	lui	s4,0x10000
80005f94:	02812c23          	sw	s0,56(sp)
80005f98:	02912a23          	sw	s1,52(sp)
80005f9c:	03212823          	sw	s2,48(sp)
80005fa0:	03512223          	sw	s5,36(sp)
80005fa4:	03612023          	sw	s6,32(sp)
80005fa8:	01712e23          	sw	s7,28(sp)
80005fac:	02112e23          	sw	ra,60(sp)
80005fb0:	00050413          	mv	s0,a0
80005fb4:	00058913          	mv	s2,a1
80005fb8:	00000493          	li	s1,0
80005fbc:	00200a93          	li	s5,2
80005fc0:	00198993          	addi	s3,s3,1 # 11000001 <_stack_size+0x10fff001>
80005fc4:	00008b37          	lui	s6,0x8
80005fc8:	00002bb7          	lui	s7,0x2
80005fcc:	001a0a13          	addi	s4,s4,1 # 10000001 <_stack_size+0xffff001>
80005fd0:	02c04a63          	bgtz	a2,80006004 <audiodac_xmit+0x84>
80005fd4:	03c12083          	lw	ra,60(sp)
80005fd8:	03812403          	lw	s0,56(sp)
80005fdc:	00048513          	mv	a0,s1
80005fe0:	03012903          	lw	s2,48(sp)
80005fe4:	03412483          	lw	s1,52(sp)
80005fe8:	02c12983          	lw	s3,44(sp)
80005fec:	02812a03          	lw	s4,40(sp)
80005ff0:	02412a83          	lw	s5,36(sp)
80005ff4:	02012b03          	lw	s6,32(sp)
80005ff8:	01c12b83          	lw	s7,28(sp)
80005ffc:	04010113          	addi	sp,sp,64
80006000:	00008067          	ret
80006004:	00442503          	lw	a0,4(s0)
80006008:	00c12623          	sw	a2,12(sp)
8000600c:	01055513          	srli	a0,a0,0x10
80006010:	fcaaf2e3          	bgeu	s5,a0,80005fd4 <audiodac_xmit+0x54>
80006014:	00300593          	li	a1,3
80006018:	449070ef          	jal	ra,8000dc60 <__divsi3>
8000601c:	00c12603          	lw	a2,12(sp)
80006020:	00000713          	li	a4,0
80006024:	40e607b3          	sub	a5,a2,a4
80006028:	00e485b3          	add	a1,s1,a4
8000602c:	00050693          	mv	a3,a0
80006030:	00a7d463          	bge	a5,a0,80006038 <audiodac_xmit+0xb8>
80006034:	00078693          	mv	a3,a5
80006038:	00d74863          	blt	a4,a3,80006048 <audiodac_xmit+0xc8>
8000603c:	00058493          	mv	s1,a1
80006040:	00078613          	mv	a2,a5
80006044:	f8dff06f          	j	80005fd0 <audiodac_xmit+0x50>
80006048:	01342023          	sw	s3,0(s0)
8000604c:	00290913          	addi	s2,s2,2
80006050:	ffe91783          	lh	a5,-2(s2)
80006054:	00170713          	addi	a4,a4,1
80006058:	016787b3          	add	a5,a5,s6
8000605c:	0047d793          	srli	a5,a5,0x4
80006060:	0177e7b3          	or	a5,a5,s7
80006064:	00f42023          	sw	a5,0(s0)
80006068:	01442023          	sw	s4,0(s0)
8000606c:	fb9ff06f          	j	80006024 <audiodac_xmit+0xa4>

80006070 <audiodac0_isr>:
80006070:	fe010113          	addi	sp,sp,-32
80006074:	00112e23          	sw	ra,28(sp)
80006078:	00812c23          	sw	s0,24(sp)
8000607c:	00912a23          	sw	s1,20(sp)
80006080:	01212823          	sw	s2,16(sp)
80006084:	01312623          	sw	s3,12(sp)
80006088:	f00c07b7          	lui	a5,0xf00c0
8000608c:	0047a783          	lw	a5,4(a5) # f00c0004 <_ram_heap_end+0x700a8004>
80006090:	1007f793          	andi	a5,a5,256
80006094:	00078863          	beqz	a5,800060a4 <audiodac0_isr+0x34>
80006098:	80003537          	lui	a0,0x80003
8000609c:	c0850513          	addi	a0,a0,-1016 # 80002c08 <_ram_heap_end+0xfffeac08>
800060a0:	46c000ef          	jal	ra,8000650c <print_uart0>
800060a4:	8d01a403          	lw	s0,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
800060a8:	8d41a483          	lw	s1,-1836(gp) # 80003344 <audiodac0_tx_ring_buffer_playback_ptr>
800060ac:	04941263          	bne	s0,s1,800060f0 <audiodac0_isr+0x80>
800060b0:	80003537          	lui	a0,0x80003
800060b4:	c2c50513          	addi	a0,a0,-980 # 80002c2c <_ram_heap_end+0xfffeac2c>
800060b8:	454000ef          	jal	ra,8000650c <print_uart0>
800060bc:	00000413          	li	s0,0
800060c0:	f00c0737          	lui	a4,0xf00c0
800060c4:	00472783          	lw	a5,4(a4) # f00c0004 <_ram_heap_end+0x700a8004>
800060c8:	00040513          	mv	a0,s0
800060cc:	aff7f793          	andi	a5,a5,-1281
800060d0:	00f72223          	sw	a5,4(a4)
800060d4:	01c12083          	lw	ra,28(sp)
800060d8:	01812403          	lw	s0,24(sp)
800060dc:	01412483          	lw	s1,20(sp)
800060e0:	01012903          	lw	s2,16(sp)
800060e4:	00c12983          	lw	s3,12(sp)
800060e8:	02010113          	addi	sp,sp,32
800060ec:	00008067          	ret
800060f0:	f00c07b7          	lui	a5,0xf00c0
800060f4:	0047a983          	lw	s3,4(a5) # f00c0004 <_ram_heap_end+0x700a8004>
800060f8:	00300593          	li	a1,3
800060fc:	0109d993          	srli	s3,s3,0x10
80006100:	00098513          	mv	a0,s3
80006104:	35d070ef          	jal	ra,8000dc60 <__divsi3>
80006108:	00200793          	li	a5,2
8000610c:	0137e863          	bltu	a5,s3,8000611c <audiodac0_isr+0xac>
80006110:	80003537          	lui	a0,0x80003
80006114:	c5450513          	addi	a0,a0,-940 # 80002c54 <_ram_heap_end+0xfffeac54>
80006118:	fa1ff06f          	j	800060b8 <audiodac0_isr+0x48>
8000611c:	40940633          	sub	a2,s0,s1
80006120:	0084c663          	blt	s1,s0,8000612c <audiodac0_isr+0xbc>
80006124:	8d81a603          	lw	a2,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
80006128:	40960633          	sub	a2,a2,s1
8000612c:	00c55463          	bge	a0,a2,80006134 <audiodac0_isr+0xc4>
80006130:	00050613          	mv	a2,a0
80006134:	8dc1a583          	lw	a1,-1828(gp) # 8000334c <audiodac0_tx_ring_buffer>
80006138:	00149493          	slli	s1,s1,0x1
8000613c:	3e800693          	li	a3,1000
80006140:	009585b3          	add	a1,a1,s1
80006144:	f00c0537          	lui	a0,0xf00c0
80006148:	e39ff0ef          	jal	ra,80005f80 <audiodac_xmit>
8000614c:	00050413          	mv	s0,a0
80006150:	8d41a503          	lw	a0,-1836(gp) # 80003344 <audiodac0_tx_ring_buffer_playback_ptr>
80006154:	8d81a583          	lw	a1,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
80006158:	00a40533          	add	a0,s0,a0
8000615c:	389070ef          	jal	ra,8000dce4 <__modsi3>
80006160:	8ca1aa23          	sw	a0,-1836(gp) # 80003344 <audiodac0_tx_ring_buffer_playback_ptr>
80006164:	f5dff06f          	j	800060c0 <audiodac0_isr+0x50>

80006168 <audiodac0_submit_buffer>:
80006168:	fd010113          	addi	sp,sp,-48
8000616c:	03212023          	sw	s2,32(sp)
80006170:	8dc1a783          	lw	a5,-1828(gp) # 8000334c <audiodac0_tx_ring_buffer>
80006174:	01312e23          	sw	s3,28(sp)
80006178:	01712623          	sw	s7,12(sp)
8000617c:	02112623          	sw	ra,44(sp)
80006180:	02812423          	sw	s0,40(sp)
80006184:	02912223          	sw	s1,36(sp)
80006188:	01412c23          	sw	s4,24(sp)
8000618c:	01512a23          	sw	s5,20(sp)
80006190:	01612823          	sw	s6,16(sp)
80006194:	01812423          	sw	s8,8(sp)
80006198:	00050b93          	mv	s7,a0
8000619c:	8d81a683          	lw	a3,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
800061a0:	00078663          	beqz	a5,800061ac <audiodac0_submit_buffer+0x44>
800061a4:	00050463          	beqz	a0,800061ac <audiodac0_submit_buffer+0x44>
800061a8:	04069863          	bnez	a3,800061f8 <audiodac0_submit_buffer+0x90>
800061ac:	80003537          	lui	a0,0x80003
800061b0:	000b8613          	mv	a2,s7
800061b4:	00068593          	mv	a1,a3
800061b8:	c7850513          	addi	a0,a0,-904 # 80002c78 <_ram_heap_end+0xfffeac78>
800061bc:	58d080ef          	jal	ra,8000ef48 <iprintf>
800061c0:	00000413          	li	s0,0
800061c4:	00040513          	mv	a0,s0
800061c8:	02c12083          	lw	ra,44(sp)
800061cc:	02812403          	lw	s0,40(sp)
800061d0:	02412483          	lw	s1,36(sp)
800061d4:	02012903          	lw	s2,32(sp)
800061d8:	01c12983          	lw	s3,28(sp)
800061dc:	01812a03          	lw	s4,24(sp)
800061e0:	01412a83          	lw	s5,20(sp)
800061e4:	01012b03          	lw	s6,16(sp)
800061e8:	00c12b83          	lw	s7,12(sp)
800061ec:	00812c03          	lw	s8,8(sp)
800061f0:	03010113          	addi	sp,sp,48
800061f4:	00008067          	ret
800061f8:	8d41a703          	lw	a4,-1836(gp) # 80003344 <audiodac0_tx_ring_buffer_playback_ptr>
800061fc:	8d01a783          	lw	a5,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
80006200:	fff70693          	addi	a3,a4,-1
80006204:	00f69a63          	bne	a3,a5,80006218 <audiodac0_submit_buffer+0xb0>
80006208:	80003537          	lui	a0,0x80003
8000620c:	cf050513          	addi	a0,a0,-784 # 80002cf0 <_ram_heap_end+0xfffeacf0>
80006210:	2fc000ef          	jal	ra,8000650c <print_uart0>
80006214:	fadff06f          	j	800061c0 <audiodac0_submit_buffer+0x58>
80006218:	00058493          	mv	s1,a1
8000621c:	00060a13          	mv	s4,a2
80006220:	00f71863          	bne	a4,a5,80006230 <audiodac0_submit_buffer+0xc8>
80006224:	80003537          	lui	a0,0x80003
80006228:	d2450513          	addi	a0,a0,-732 # 80002d24 <_ram_heap_end+0xfffead24>
8000622c:	2e0000ef          	jal	ra,8000650c <print_uart0>
80006230:	000a1463          	bnez	s4,80006238 <audiodac0_submit_buffer+0xd0>
80006234:	30047073          	csrci	mstatus,8
80006238:	8d01a403          	lw	s0,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
8000623c:	8d41a783          	lw	a5,-1836(gp) # 80003344 <audiodac0_tx_ring_buffer_playback_ptr>
80006240:	10f44663          	blt	s0,a5,8000634c <audiodac0_submit_buffer+0x1e4>
80006244:	8d81a783          	lw	a5,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
80006248:	40878433          	sub	s0,a5,s0
8000624c:	0084d463          	bge	s1,s0,80006254 <audiodac0_submit_buffer+0xec>
80006250:	00048413          	mv	s0,s1
80006254:	408484b3          	sub	s1,s1,s0
80006258:	00000793          	li	a5,0
8000625c:	000a1663          	bnez	s4,80006268 <audiodac0_submit_buffer+0x100>
80006260:	30046073          	csrsi	mstatus,8
80006264:	000a0793          	mv	a5,s4
80006268:	8d01a503          	lw	a0,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
8000626c:	0887ca63          	blt	a5,s0,80006300 <audiodac0_submit_buffer+0x198>
80006270:	00040793          	mv	a5,s0
80006274:	00045463          	bgez	s0,8000627c <audiodac0_submit_buffer+0x114>
80006278:	00000793          	li	a5,0
8000627c:	00179c13          	slli	s8,a5,0x1
80006280:	000a1463          	bnez	s4,80006288 <audiodac0_submit_buffer+0x120>
80006284:	30047073          	csrci	mstatus,8
80006288:	8d81a583          	lw	a1,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
8000628c:	00a40533          	add	a0,s0,a0
80006290:	255070ef          	jal	ra,8000dce4 <__modsi3>
80006294:	8ca1a823          	sw	a0,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
80006298:	02048e63          	beqz	s1,800062d4 <audiodac0_submit_buffer+0x16c>
8000629c:	8d41a783          	lw	a5,-1836(gp) # 80003344 <audiodac0_tx_ring_buffer_playback_ptr>
800062a0:	00f4d463          	bge	s1,a5,800062a8 <audiodac0_submit_buffer+0x140>
800062a4:	00048793          	mv	a5,s1
800062a8:	00000713          	li	a4,0
800062ac:	000a1663          	bnez	s4,800062b8 <audiodac0_submit_buffer+0x150>
800062b0:	30046073          	csrsi	mstatus,8
800062b4:	000a0713          	mv	a4,s4
800062b8:	06f74863          	blt	a4,a5,80006328 <audiodac0_submit_buffer+0x1c0>
800062bc:	000a1463          	bnez	s4,800062c4 <audiodac0_submit_buffer+0x15c>
800062c0:	30047073          	csrci	mstatus,8
800062c4:	8d01a703          	lw	a4,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
800062c8:	00f40433          	add	s0,s0,a5
800062cc:	00f70733          	add	a4,a4,a5
800062d0:	8ce1a823          	sw	a4,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
800062d4:	f00c07b7          	lui	a5,0xf00c0
800062d8:	0047a783          	lw	a5,4(a5) # f00c0004 <_ram_heap_end+0x700a8004>
800062dc:	1007f793          	andi	a5,a5,256
800062e0:	00078a63          	beqz	a5,800062f4 <audiodac0_submit_buffer+0x18c>
800062e4:	80003537          	lui	a0,0x80003
800062e8:	d5850513          	addi	a0,a0,-680 # 80002d58 <_ram_heap_end+0xfffead58>
800062ec:	220000ef          	jal	ra,8000650c <print_uart0>
800062f0:	d81ff0ef          	jal	ra,80006070 <audiodac0_isr>
800062f4:	ec0a18e3          	bnez	s4,800061c4 <audiodac0_submit_buffer+0x5c>
800062f8:	30046073          	csrsi	mstatus,8
800062fc:	ec9ff06f          	j	800061c4 <audiodac0_submit_buffer+0x5c>
80006300:	00179713          	slli	a4,a5,0x1
80006304:	00eb8733          	add	a4,s7,a4
80006308:	00071683          	lh	a3,0(a4)
8000630c:	8dc1a703          	lw	a4,-1828(gp) # 8000334c <audiodac0_tx_ring_buffer>
80006310:	00a78533          	add	a0,a5,a0
80006314:	00151513          	slli	a0,a0,0x1
80006318:	00a70533          	add	a0,a4,a0
8000631c:	00d51023          	sh	a3,0(a0)
80006320:	00178793          	addi	a5,a5,1
80006324:	f45ff06f          	j	80006268 <audiodac0_submit_buffer+0x100>
80006328:	00171593          	slli	a1,a4,0x1
8000632c:	00bc0633          	add	a2,s8,a1
80006330:	8dc1a683          	lw	a3,-1828(gp) # 8000334c <audiodac0_tx_ring_buffer>
80006334:	00cb8633          	add	a2,s7,a2
80006338:	00061603          	lh	a2,0(a2) # f0050000 <_ram_heap_end+0x70038000>
8000633c:	00b686b3          	add	a3,a3,a1
80006340:	00170713          	addi	a4,a4,1
80006344:	00c69023          	sh	a2,0(a3) # c000 <_stack_size+0xb000>
80006348:	f71ff06f          	j	800062b8 <audiodac0_submit_buffer+0x150>
8000634c:	40878433          	sub	s0,a5,s0
80006350:	fff40413          	addi	s0,s0,-1
80006354:	0084d463          	bge	s1,s0,8000635c <audiodac0_submit_buffer+0x1f4>
80006358:	00048413          	mv	s0,s1
8000635c:	00000713          	li	a4,0
80006360:	000a1663          	bnez	s4,8000636c <audiodac0_submit_buffer+0x204>
80006364:	30046073          	csrsi	mstatus,8
80006368:	000a0713          	mv	a4,s4
8000636c:	8d01a783          	lw	a5,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
80006370:	00874c63          	blt	a4,s0,80006388 <audiodac0_submit_buffer+0x220>
80006374:	000a1463          	bnez	s4,8000637c <audiodac0_submit_buffer+0x214>
80006378:	30047073          	csrci	mstatus,8
8000637c:	00f407b3          	add	a5,s0,a5
80006380:	8cf1a823          	sw	a5,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
80006384:	f51ff06f          	j	800062d4 <audiodac0_submit_buffer+0x16c>
80006388:	00171693          	slli	a3,a4,0x1
8000638c:	00db86b3          	add	a3,s7,a3
80006390:	00069603          	lh	a2,0(a3)
80006394:	8dc1a683          	lw	a3,-1828(gp) # 8000334c <audiodac0_tx_ring_buffer>
80006398:	00f707b3          	add	a5,a4,a5
8000639c:	00179793          	slli	a5,a5,0x1
800063a0:	00f687b3          	add	a5,a3,a5
800063a4:	00c79023          	sh	a2,0(a5)
800063a8:	00170713          	addi	a4,a4,1
800063ac:	fc1ff06f          	j	8000636c <audiodac0_submit_buffer+0x204>

800063b0 <audiodac0_start_playback>:
800063b0:	06050463          	beqz	a0,80006418 <audiodac0_start_playback+0x68>
800063b4:	06b05263          	blez	a1,80006418 <audiodac0_start_playback+0x68>
800063b8:	ff010113          	addi	sp,sp,-16
800063bc:	00112623          	sw	ra,12(sp)
800063c0:	00812423          	sw	s0,8(sp)
800063c4:	30047073          	csrci	mstatus,8
800063c8:	f00c0437          	lui	s0,0xf00c0
800063cc:	00442783          	lw	a5,4(s0) # f00c0004 <_ram_heap_end+0x700a8004>
800063d0:	ffa7f793          	andi	a5,a5,-6
800063d4:	00f42223          	sw	a5,4(s0)
800063d8:	8ca1ae23          	sw	a0,-1828(gp) # 8000334c <audiodac0_tx_ring_buffer>
800063dc:	8c01a823          	sw	zero,-1840(gp) # 80003340 <audiodac0_tx_ring_buffer_fill_ptr>
800063e0:	8c01aa23          	sw	zero,-1836(gp) # 80003344 <audiodac0_tx_ring_buffer_playback_ptr>
800063e4:	8cb1ac23          	sw	a1,-1832(gp) # 80003348 <audiodac0_tx_ring_buffer_size>
800063e8:	c89ff0ef          	jal	ra,80006070 <audiodac0_isr>
800063ec:	00442783          	lw	a5,4(s0)
800063f0:	80003537          	lui	a0,0x80003
800063f4:	d8450513          	addi	a0,a0,-636 # 80002d84 <_ram_heap_end+0xfffead84>
800063f8:	0057e793          	ori	a5,a5,5
800063fc:	00f42223          	sw	a5,4(s0)
80006400:	349080ef          	jal	ra,8000ef48 <iprintf>
80006404:	30046073          	csrsi	mstatus,8
80006408:	00c12083          	lw	ra,12(sp)
8000640c:	00812403          	lw	s0,8(sp)
80006410:	01010113          	addi	sp,sp,16
80006414:	00008067          	ret
80006418:	00008067          	ret

8000641c <i2c_init>:
8000641c:	25800793          	li	a5,600
80006420:	00f52423          	sw	a5,8(a0)
80006424:	00008067          	ret

80006428 <i2c_wait_for_busy>:
80006428:	00000793          	li	a5,0
8000642c:	00b7c663          	blt	a5,a1,80006438 <i2c_wait_for_busy+0x10>
80006430:	00000513          	li	a0,0
80006434:	00008067          	ret
80006438:	00c52703          	lw	a4,12(a0)
8000643c:	00277713          	andi	a4,a4,2
80006440:	00071663          	bnez	a4,8000644c <i2c_wait_for_busy+0x24>
80006444:	00178793          	addi	a5,a5,1
80006448:	fe5ff06f          	j	8000642c <i2c_wait_for_busy+0x4>
8000644c:	00100513          	li	a0,1
80006450:	00008067          	ret

80006454 <i2c_wait_for_release>:
80006454:	00000793          	li	a5,0
80006458:	00b7c663          	blt	a5,a1,80006464 <i2c_wait_for_release+0x10>
8000645c:	00000513          	li	a0,0
80006460:	00008067          	ret
80006464:	00c52703          	lw	a4,12(a0)
80006468:	00277713          	andi	a4,a4,2
8000646c:	00070663          	beqz	a4,80006478 <i2c_wait_for_release+0x24>
80006470:	00178793          	addi	a5,a5,1
80006474:	fe5ff06f          	j	80006458 <i2c_wait_for_release+0x4>
80006478:	00100513          	li	a0,1
8000647c:	00008067          	ret

80006480 <__malloc_lock>:
80006480:	00008067          	ret

80006484 <__malloc_unlock>:
80006484:	00008067          	ret

80006488 <init_sbrk>:
80006488:	02051463          	bnez	a0,800064b0 <init_sbrk+0x28>
8000648c:	80012737          	lui	a4,0x80012
80006490:	59070713          	addi	a4,a4,1424 # 80012590 <_ram_heap_end+0xffffa590>
80006494:	8ee1a223          	sw	a4,-1820(gp) # 80003354 <heap_start>
80006498:	80018737          	lui	a4,0x80018
8000649c:	00070713          	mv	a4,a4
800064a0:	8ee1a023          	sw	a4,-1824(gp) # 80003350 <heap_end>
800064a4:	8e41a703          	lw	a4,-1820(gp) # 80003354 <heap_start>
800064a8:	8ee1a423          	sw	a4,-1816(gp) # 80003358 <sbrk_heap_end>
800064ac:	00008067          	ret
800064b0:	00259593          	slli	a1,a1,0x2
800064b4:	8ea1a223          	sw	a0,-1820(gp) # 80003354 <heap_start>
800064b8:	00b50533          	add	a0,a0,a1
800064bc:	8ea1a023          	sw	a0,-1824(gp) # 80003350 <heap_end>
800064c0:	fe5ff06f          	j	800064a4 <init_sbrk+0x1c>

800064c4 <delay>:
800064c4:	00000793          	li	a5,0
800064c8:	00a79463          	bne	a5,a0,800064d0 <delay+0xc>
800064cc:	00008067          	ret
800064d0:	00060613          	mv	a2,a2
800064d4:	00178793          	addi	a5,a5,1
800064d8:	ff1ff06f          	j	800064c8 <delay+0x4>

800064dc <delay_us>:
800064dc:	f00b07b7          	lui	a5,0xf00b0
800064e0:	0007a803          	lw	a6,0(a5) # f00b0000 <_ram_heap_end+0x70098000>
800064e4:	0047a883          	lw	a7,4(a5)
800064e8:	f00b0637          	lui	a2,0xf00b0
800064ec:	00062303          	lw	t1,0(a2) # f00b0000 <_ram_heap_end+0x70098000>
800064f0:	00462383          	lw	t2,4(a2)
800064f4:	410306b3          	sub	a3,t1,a6
800064f8:	00d33733          	sltu	a4,t1,a3
800064fc:	411387b3          	sub	a5,t2,a7
80006500:	00e79463          	bne	a5,a4,80006508 <delay_us+0x2c>
80006504:	fea6e4e3          	bltu	a3,a0,800064ec <delay_us+0x10>
80006508:	00008067          	ret

8000650c <print_uart0>:
8000650c:	f00106b7          	lui	a3,0xf0010
80006510:	00054703          	lbu	a4,0(a0)
80006514:	00071463          	bnez	a4,8000651c <print_uart0+0x10>
80006518:	00008067          	ret
8000651c:	0046a783          	lw	a5,4(a3) # f0010004 <_ram_heap_end+0x6fff8004>
80006520:	0107d793          	srli	a5,a5,0x10
80006524:	0ff7f793          	andi	a5,a5,255
80006528:	fe078ae3          	beqz	a5,8000651c <print_uart0+0x10>
8000652c:	00e6a023          	sw	a4,0(a3)
80006530:	00150513          	addi	a0,a0,1
80006534:	fddff06f          	j	80006510 <print_uart0+0x4>

80006538 <_sbrk>:
80006538:	8e81a783          	lw	a5,-1816(gp) # 80003358 <sbrk_heap_end>
8000653c:	02079063          	bnez	a5,8000655c <_sbrk+0x24>
80006540:	800127b7          	lui	a5,0x80012
80006544:	59078793          	addi	a5,a5,1424 # 80012590 <_ram_heap_end+0xffffa590>
80006548:	8ef1a223          	sw	a5,-1820(gp) # 80003354 <heap_start>
8000654c:	80018737          	lui	a4,0x80018
80006550:	00070713          	mv	a4,a4
80006554:	8ee1a023          	sw	a4,-1824(gp) # 80003350 <heap_end>
80006558:	8ef1a423          	sw	a5,-1816(gp) # 80003358 <sbrk_heap_end>
8000655c:	8e81a683          	lw	a3,-1816(gp) # 80003358 <sbrk_heap_end>
80006560:	8e01a703          	lw	a4,-1824(gp) # 80003350 <heap_end>
80006564:	00a687b3          	add	a5,a3,a0
80006568:	04e7e063          	bltu	a5,a4,800065a8 <_sbrk+0x70>
8000656c:	f7010113          	addi	sp,sp,-144
80006570:	80003637          	lui	a2,0x80003
80006574:	00050793          	mv	a5,a0
80006578:	da860613          	addi	a2,a2,-600 # 80002da8 <_ram_heap_end+0xfffeada8>
8000657c:	08000593          	li	a1,128
80006580:	00010513          	mv	a0,sp
80006584:	08112623          	sw	ra,140(sp)
80006588:	491080ef          	jal	ra,8000f218 <sniprintf>
8000658c:	00010513          	mv	a0,sp
80006590:	f7dff0ef          	jal	ra,8000650c <print_uart0>
80006594:	08c12083          	lw	ra,140(sp)
80006598:	fff00693          	li	a3,-1
8000659c:	00068513          	mv	a0,a3
800065a0:	09010113          	addi	sp,sp,144
800065a4:	00008067          	ret
800065a8:	8ef1a423          	sw	a5,-1816(gp) # 80003358 <sbrk_heap_end>
800065ac:	00068513          	mv	a0,a3
800065b0:	00008067          	ret

800065b4 <print_uart1>:
800065b4:	f00116b7          	lui	a3,0xf0011
800065b8:	00054703          	lbu	a4,0(a0)
800065bc:	00071463          	bnez	a4,800065c4 <print_uart1+0x10>
800065c0:	00008067          	ret
800065c4:	0046a783          	lw	a5,4(a3) # f0011004 <_ram_heap_end+0x6fff9004>
800065c8:	0107d793          	srli	a5,a5,0x10
800065cc:	0ff7f793          	andi	a5,a5,255
800065d0:	fe078ae3          	beqz	a5,800065c4 <print_uart1+0x10>
800065d4:	00e6a023          	sw	a4,0(a3)
800065d8:	00150513          	addi	a0,a0,1
800065dc:	fddff06f          	j	800065b8 <print_uart1+0x4>

800065e0 <_write>:
800065e0:	00c586b3          	add	a3,a1,a2
800065e4:	f0010737          	lui	a4,0xf0010
800065e8:	00d59663          	bne	a1,a3,800065f4 <_write+0x14>
800065ec:	00060513          	mv	a0,a2
800065f0:	00008067          	ret
800065f4:	00158593          	addi	a1,a1,1
800065f8:	fff5c503          	lbu	a0,-1(a1)
800065fc:	00472783          	lw	a5,4(a4) # f0010004 <_ram_heap_end+0x6fff8004>
80006600:	0107d793          	srli	a5,a5,0x10
80006604:	0ff7f793          	andi	a5,a5,255
80006608:	fe078ae3          	beqz	a5,800065fc <_write+0x1c>
8000660c:	00a72023          	sw	a0,0(a4)
80006610:	fd9ff06f          	j	800065e8 <_write+0x8>

80006614 <_read>:
80006614:	00100513          	li	a0,1
80006618:	00008067          	ret

8000661c <_close>:
8000661c:	fff00513          	li	a0,-1
80006620:	00008067          	ret

80006624 <_lseek>:
80006624:	00000513          	li	a0,0
80006628:	00008067          	ret

8000662c <_isatty>:
8000662c:	00100513          	li	a0,1
80006630:	00008067          	ret

80006634 <_fstat>:
80006634:	000027b7          	lui	a5,0x2
80006638:	00f5a223          	sw	a5,4(a1)
8000663c:	00000513          	li	a0,0
80006640:	00008067          	ret

80006644 <_kill>:
80006644:	00008067          	ret

80006648 <_getpid>:
80006648:	fff00513          	li	a0,-1
8000664c:	00008067          	ret

80006650 <hard_reboot>:
80006650:	80003537          	lui	a0,0x80003
80006654:	ff010113          	addi	sp,sp,-16
80006658:	dec50513          	addi	a0,a0,-532 # 80002dec <_ram_heap_end+0xfffeadec>
8000665c:	00112623          	sw	ra,12(sp)
80006660:	eadff0ef          	jal	ra,8000650c <print_uart0>
80006664:	3e800513          	li	a0,1000
80006668:	e75ff0ef          	jal	ra,800064dc <delay_us>
8000666c:	f00a07b7          	lui	a5,0xf00a0
80006670:	00100713          	li	a4,1
80006674:	00e7a423          	sw	a4,8(a5) # f00a0008 <_ram_heap_end+0x70088008>
80006678:	00c12083          	lw	ra,12(sp)
8000667c:	01010113          	addi	sp,sp,16
80006680:	00008067          	ret

80006684 <memcpy_rev>:
80006684:	00000793          	li	a5,0
80006688:	00f61463          	bne	a2,a5,80006690 <memcpy_rev+0xc>
8000668c:	00008067          	ret
80006690:	40f58733          	sub	a4,a1,a5
80006694:	00074683          	lbu	a3,0(a4)
80006698:	00f50733          	add	a4,a0,a5
8000669c:	00178793          	addi	a5,a5,1
800066a0:	00d70023          	sb	a3,0(a4)
800066a4:	fe5ff06f          	j	80006688 <memcpy_rev+0x4>

800066a8 <lwip_init>:
800066a8:	ff010113          	addi	sp,sp,-16
800066ac:	00112623          	sw	ra,12(sp)
800066b0:	340020ef          	jal	ra,800089f0 <stats_init>
800066b4:	015000ef          	jal	ra,80006ec8 <mem_init>
800066b8:	141000ef          	jal	ra,80006ff8 <memp_init>
800066bc:	27d000ef          	jal	ra,80007138 <netif_init>
800066c0:	618020ef          	jal	ra,80008cd8 <udp_init>
800066c4:	00c12083          	lw	ra,12(sp)
800066c8:	01010113          	addi	sp,sp,16
800066cc:	4500206f          	j	80008b1c <sys_timeouts_init>

800066d0 <lwip_htons>:
800066d0:	00851793          	slli	a5,a0,0x8
800066d4:	00855513          	srli	a0,a0,0x8
800066d8:	00a7e533          	or	a0,a5,a0
800066dc:	01051513          	slli	a0,a0,0x10
800066e0:	01055513          	srli	a0,a0,0x10
800066e4:	00008067          	ret

800066e8 <lwip_htonl>:
800066e8:	01855713          	srli	a4,a0,0x18
800066ec:	01851793          	slli	a5,a0,0x18
800066f0:	00e7e7b3          	or	a5,a5,a4
800066f4:	00ff06b7          	lui	a3,0xff0
800066f8:	00851713          	slli	a4,a0,0x8
800066fc:	00d77733          	and	a4,a4,a3
80006700:	00e7e7b3          	or	a5,a5,a4
80006704:	00010737          	lui	a4,0x10
80006708:	f0070713          	addi	a4,a4,-256 # ff00 <_stack_size+0xef00>
8000670c:	00855513          	srli	a0,a0,0x8
80006710:	00e57533          	and	a0,a0,a4
80006714:	00a7e533          	or	a0,a5,a0
80006718:	00008067          	ret

8000671c <lwip_strnstr>:
8000671c:	fe010113          	addi	sp,sp,-32
80006720:	00812c23          	sw	s0,24(sp)
80006724:	00050413          	mv	s0,a0
80006728:	00058513          	mv	a0,a1
8000672c:	00912a23          	sw	s1,20(sp)
80006730:	01312623          	sw	s3,12(sp)
80006734:	00112e23          	sw	ra,28(sp)
80006738:	01212823          	sw	s2,16(sp)
8000673c:	00058993          	mv	s3,a1
80006740:	00060493          	mv	s1,a2
80006744:	5a1080ef          	jal	ra,8000f4e4 <strlen>
80006748:	02050063          	beqz	a0,80006768 <lwip_strnstr+0x4c>
8000674c:	00050913          	mv	s2,a0
80006750:	009404b3          	add	s1,s0,s1
80006754:	00044783          	lbu	a5,0(s0)
80006758:	00078663          	beqz	a5,80006764 <lwip_strnstr+0x48>
8000675c:	01240733          	add	a4,s0,s2
80006760:	02e4f463          	bgeu	s1,a4,80006788 <lwip_strnstr+0x6c>
80006764:	00000413          	li	s0,0
80006768:	00040513          	mv	a0,s0
8000676c:	01c12083          	lw	ra,28(sp)
80006770:	01812403          	lw	s0,24(sp)
80006774:	01412483          	lw	s1,20(sp)
80006778:	01012903          	lw	s2,16(sp)
8000677c:	00c12983          	lw	s3,12(sp)
80006780:	02010113          	addi	sp,sp,32
80006784:	00008067          	ret
80006788:	0009c703          	lbu	a4,0(s3)
8000678c:	00f71c63          	bne	a4,a5,800067a4 <lwip_strnstr+0x88>
80006790:	00090613          	mv	a2,s2
80006794:	00098593          	mv	a1,s3
80006798:	00040513          	mv	a0,s0
8000679c:	565080ef          	jal	ra,8000f500 <strncmp>
800067a0:	fc0504e3          	beqz	a0,80006768 <lwip_strnstr+0x4c>
800067a4:	00140413          	addi	s0,s0,1
800067a8:	fadff06f          	j	80006754 <lwip_strnstr+0x38>

800067ac <lwip_stricmp>:
800067ac:	01900813          	li	a6,25
800067b0:	00150513          	addi	a0,a0,1
800067b4:	00158593          	addi	a1,a1,1
800067b8:	fff54703          	lbu	a4,-1(a0)
800067bc:	fff5c783          	lbu	a5,-1(a1)
800067c0:	00f70e63          	beq	a4,a5,800067dc <lwip_stricmp+0x30>
800067c4:	02076613          	ori	a2,a4,32
800067c8:	f9f60693          	addi	a3,a2,-97
800067cc:	0ff6f693          	andi	a3,a3,255
800067d0:	00d86c63          	bltu	a6,a3,800067e8 <lwip_stricmp+0x3c>
800067d4:	0207e793          	ori	a5,a5,32
800067d8:	00f61863          	bne	a2,a5,800067e8 <lwip_stricmp+0x3c>
800067dc:	fc071ae3          	bnez	a4,800067b0 <lwip_stricmp+0x4>
800067e0:	00000513          	li	a0,0
800067e4:	00008067          	ret
800067e8:	00100513          	li	a0,1
800067ec:	00008067          	ret

800067f0 <lwip_strnicmp>:
800067f0:	fff60613          	addi	a2,a2,-1
800067f4:	00000793          	li	a5,0
800067f8:	01900313          	li	t1,25
800067fc:	00f50733          	add	a4,a0,a5
80006800:	00074683          	lbu	a3,0(a4)
80006804:	00f58733          	add	a4,a1,a5
80006808:	00074703          	lbu	a4,0(a4)
8000680c:	00e68e63          	beq	a3,a4,80006828 <lwip_strnicmp+0x38>
80006810:	0206e893          	ori	a7,a3,32
80006814:	f9f88813          	addi	a6,a7,-97
80006818:	0ff87813          	andi	a6,a6,255
8000681c:	03036063          	bltu	t1,a6,8000683c <lwip_strnicmp+0x4c>
80006820:	02076713          	ori	a4,a4,32
80006824:	00e89c63          	bne	a7,a4,8000683c <lwip_strnicmp+0x4c>
80006828:	00f60663          	beq	a2,a5,80006834 <lwip_strnicmp+0x44>
8000682c:	00178793          	addi	a5,a5,1
80006830:	fc0696e3          	bnez	a3,800067fc <lwip_strnicmp+0xc>
80006834:	00000513          	li	a0,0
80006838:	00008067          	ret
8000683c:	00100513          	li	a0,1
80006840:	00008067          	ret

80006844 <lwip_itoa>:
80006844:	fe010113          	addi	sp,sp,-32
80006848:	01212823          	sw	s2,16(sp)
8000684c:	01412423          	sw	s4,8(sp)
80006850:	00112e23          	sw	ra,28(sp)
80006854:	00812c23          	sw	s0,24(sp)
80006858:	00912a23          	sw	s1,20(sp)
8000685c:	01312623          	sw	s3,12(sp)
80006860:	00100793          	li	a5,1
80006864:	00050913          	mv	s2,a0
80006868:	00058a13          	mv	s4,a1
8000686c:	02b7e663          	bltu	a5,a1,80006898 <lwip_itoa+0x54>
80006870:	00f59463          	bne	a1,a5,80006878 <lwip_itoa+0x34>
80006874:	00090023          	sb	zero,0(s2)
80006878:	01c12083          	lw	ra,28(sp)
8000687c:	01812403          	lw	s0,24(sp)
80006880:	01412483          	lw	s1,20(sp)
80006884:	01012903          	lw	s2,16(sp)
80006888:	00c12983          	lw	s3,12(sp)
8000688c:	00812a03          	lw	s4,8(sp)
80006890:	02010113          	addi	sp,sp,32
80006894:	00008067          	ret
80006898:	00050993          	mv	s3,a0
8000689c:	00065863          	bgez	a2,800068ac <lwip_itoa+0x68>
800068a0:	02d00793          	li	a5,45
800068a4:	00150993          	addi	s3,a0,1
800068a8:	00f50023          	sb	a5,0(a0)
800068ac:	41f65793          	srai	a5,a2,0x1f
800068b0:	fffa0413          	addi	s0,s4,-1
800068b4:	00890433          	add	s0,s2,s0
800068b8:	00c7c4b3          	xor	s1,a5,a2
800068bc:	40f484b3          	sub	s1,s1,a5
800068c0:	00040023          	sb	zero,0(s0)
800068c4:	04048263          	beqz	s1,80006908 <lwip_itoa+0xc4>
800068c8:	fa89f6e3          	bgeu	s3,s0,80006874 <lwip_itoa+0x30>
800068cc:	00a00593          	li	a1,10
800068d0:	00048513          	mv	a0,s1
800068d4:	410070ef          	jal	ra,8000dce4 <__modsi3>
800068d8:	03050513          	addi	a0,a0,48
800068dc:	fff40413          	addi	s0,s0,-1
800068e0:	00a40023          	sb	a0,0(s0)
800068e4:	00a00593          	li	a1,10
800068e8:	00048513          	mv	a0,s1
800068ec:	374070ef          	jal	ra,8000dc60 <__divsi3>
800068f0:	00050493          	mv	s1,a0
800068f4:	fd1ff06f          	j	800068c4 <lwip_itoa+0x80>
800068f8:	03000793          	li	a5,48
800068fc:	00f98023          	sb	a5,0(s3)
80006900:	000980a3          	sb	zero,1(s3)
80006904:	f75ff06f          	j	80006878 <lwip_itoa+0x34>
80006908:	00044783          	lbu	a5,0(s0)
8000690c:	fe0786e3          	beqz	a5,800068f8 <lwip_itoa+0xb4>
80006910:	01490633          	add	a2,s2,s4
80006914:	40860633          	sub	a2,a2,s0
80006918:	00040593          	mv	a1,s0
8000691c:	01812403          	lw	s0,24(sp)
80006920:	01c12083          	lw	ra,28(sp)
80006924:	01412483          	lw	s1,20(sp)
80006928:	01012903          	lw	s2,16(sp)
8000692c:	00812a03          	lw	s4,8(sp)
80006930:	00098513          	mv	a0,s3
80006934:	00c12983          	lw	s3,12(sp)
80006938:	02010113          	addi	sp,sp,32
8000693c:	2a40806f          	j	8000ebe0 <memmove>

80006940 <lwip_standard_chksum>:
80006940:	ff010113          	addi	sp,sp,-16
80006944:	00011723          	sh	zero,14(sp)
80006948:	00157693          	andi	a3,a0,1
8000694c:	00068c63          	beqz	a3,80006964 <lwip_standard_chksum+0x24>
80006950:	00b05a63          	blez	a1,80006964 <lwip_standard_chksum+0x24>
80006954:	00054783          	lbu	a5,0(a0)
80006958:	fff58593          	addi	a1,a1,-1
8000695c:	00150513          	addi	a0,a0,1
80006960:	00f107a3          	sb	a5,15(sp)
80006964:	00000793          	li	a5,0
80006968:	00100713          	li	a4,1
8000696c:	06b74063          	blt	a4,a1,800069cc <lwip_standard_chksum+0x8c>
80006970:	00e59663          	bne	a1,a4,8000697c <lwip_standard_chksum+0x3c>
80006974:	00054703          	lbu	a4,0(a0)
80006978:	00e10723          	sb	a4,14(sp)
8000697c:	00e15503          	lhu	a0,14(sp)
80006980:	00010737          	lui	a4,0x10
80006984:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xefff>
80006988:	00f50533          	add	a0,a0,a5
8000698c:	01055793          	srli	a5,a0,0x10
80006990:	00e57533          	and	a0,a0,a4
80006994:	00a787b3          	add	a5,a5,a0
80006998:	0107d513          	srli	a0,a5,0x10
8000699c:	00e7f7b3          	and	a5,a5,a4
800069a0:	00f50533          	add	a0,a0,a5
800069a4:	00068c63          	beqz	a3,800069bc <lwip_standard_chksum+0x7c>
800069a8:	00851793          	slli	a5,a0,0x8
800069ac:	00855513          	srli	a0,a0,0x8
800069b0:	00e7f733          	and	a4,a5,a4
800069b4:	0ff57513          	andi	a0,a0,255
800069b8:	00a76533          	or	a0,a4,a0
800069bc:	01051513          	slli	a0,a0,0x10
800069c0:	01055513          	srli	a0,a0,0x10
800069c4:	01010113          	addi	sp,sp,16
800069c8:	00008067          	ret
800069cc:	00250513          	addi	a0,a0,2
800069d0:	ffe55603          	lhu	a2,-2(a0)
800069d4:	ffe58593          	addi	a1,a1,-2
800069d8:	00c787b3          	add	a5,a5,a2
800069dc:	f91ff06f          	j	8000696c <lwip_standard_chksum+0x2c>

800069e0 <inet_chksum_pseudo>:
800069e0:	fe010113          	addi	sp,sp,-32
800069e4:	00812c23          	sw	s0,24(sp)
800069e8:	00912a23          	sw	s1,20(sp)
800069ec:	01212823          	sw	s2,16(sp)
800069f0:	01312623          	sw	s3,12(sp)
800069f4:	01412423          	sw	s4,8(sp)
800069f8:	01512223          	sw	s5,4(sp)
800069fc:	00112e23          	sw	ra,28(sp)
80006a00:	00072703          	lw	a4,0(a4)
80006a04:	0006a683          	lw	a3,0(a3) # ff0000 <_stack_size+0xfef000>
80006a08:	000107b7          	lui	a5,0x10
80006a0c:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xefff>
80006a10:	00f77433          	and	s0,a4,a5
80006a14:	01075713          	srli	a4,a4,0x10
80006a18:	00e40433          	add	s0,s0,a4
80006a1c:	00f6f733          	and	a4,a3,a5
80006a20:	00e40433          	add	s0,s0,a4
80006a24:	0106d693          	srli	a3,a3,0x10
80006a28:	008686b3          	add	a3,a3,s0
80006a2c:	0106d413          	srli	s0,a3,0x10
80006a30:	00f6f6b3          	and	a3,a3,a5
80006a34:	00d406b3          	add	a3,s0,a3
80006a38:	0106d413          	srli	s0,a3,0x10
80006a3c:	00f6f6b3          	and	a3,a3,a5
80006a40:	00050993          	mv	s3,a0
80006a44:	00058a13          	mv	s4,a1
80006a48:	00060913          	mv	s2,a2
80006a4c:	00d40433          	add	s0,s0,a3
80006a50:	00000a93          	li	s5,0
80006a54:	00078493          	mv	s1,a5
80006a58:	08099863          	bnez	s3,80006ae8 <inet_chksum_pseudo+0x108>
80006a5c:	020a8063          	beqz	s5,80006a7c <inet_chksum_pseudo+0x9c>
80006a60:	00010737          	lui	a4,0x10
80006a64:	00841793          	slli	a5,s0,0x8
80006a68:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xefff>
80006a6c:	00845413          	srli	s0,s0,0x8
80006a70:	00e7f7b3          	and	a5,a5,a4
80006a74:	0ff47413          	andi	s0,s0,255
80006a78:	0087e433          	or	s0,a5,s0
80006a7c:	000a0513          	mv	a0,s4
80006a80:	c51ff0ef          	jal	ra,800066d0 <lwip_htons>
80006a84:	00050493          	mv	s1,a0
80006a88:	00090513          	mv	a0,s2
80006a8c:	c45ff0ef          	jal	ra,800066d0 <lwip_htons>
80006a90:	00a48533          	add	a0,s1,a0
80006a94:	000107b7          	lui	a5,0x10
80006a98:	00850433          	add	s0,a0,s0
80006a9c:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xefff>
80006aa0:	01045513          	srli	a0,s0,0x10
80006aa4:	00f47433          	and	s0,s0,a5
80006aa8:	00850433          	add	s0,a0,s0
80006aac:	01045513          	srli	a0,s0,0x10
80006ab0:	00f47433          	and	s0,s0,a5
80006ab4:	00850433          	add	s0,a0,s0
80006ab8:	fff44513          	not	a0,s0
80006abc:	01c12083          	lw	ra,28(sp)
80006ac0:	01812403          	lw	s0,24(sp)
80006ac4:	01051513          	slli	a0,a0,0x10
80006ac8:	01412483          	lw	s1,20(sp)
80006acc:	01012903          	lw	s2,16(sp)
80006ad0:	00c12983          	lw	s3,12(sp)
80006ad4:	00812a03          	lw	s4,8(sp)
80006ad8:	00412a83          	lw	s5,4(sp)
80006adc:	01055513          	srli	a0,a0,0x10
80006ae0:	02010113          	addi	sp,sp,32
80006ae4:	00008067          	ret
80006ae8:	00a9d583          	lhu	a1,10(s3)
80006aec:	0049a503          	lw	a0,4(s3)
80006af0:	e51ff0ef          	jal	ra,80006940 <lwip_standard_chksum>
80006af4:	00850433          	add	s0,a0,s0
80006af8:	01045793          	srli	a5,s0,0x10
80006afc:	00947433          	and	s0,s0,s1
80006b00:	00878433          	add	s0,a5,s0
80006b04:	00a9d783          	lhu	a5,10(s3)
80006b08:	0017f793          	andi	a5,a5,1
80006b0c:	00078e63          	beqz	a5,80006b28 <inet_chksum_pseudo+0x148>
80006b10:	00841793          	slli	a5,s0,0x8
80006b14:	00845413          	srli	s0,s0,0x8
80006b18:	0097f7b3          	and	a5,a5,s1
80006b1c:	0ff47413          	andi	s0,s0,255
80006b20:	001aca93          	xori	s5,s5,1
80006b24:	0087e433          	or	s0,a5,s0
80006b28:	0009a983          	lw	s3,0(s3)
80006b2c:	f2dff06f          	j	80006a58 <inet_chksum_pseudo+0x78>

80006b30 <ip_chksum_pseudo>:
80006b30:	eb1ff06f          	j	800069e0 <inet_chksum_pseudo>

80006b34 <inet_chksum_pseudo_partial>:
80006b34:	fd010113          	addi	sp,sp,-48
80006b38:	02812423          	sw	s0,40(sp)
80006b3c:	02912223          	sw	s1,36(sp)
80006b40:	03212023          	sw	s2,32(sp)
80006b44:	01412c23          	sw	s4,24(sp)
80006b48:	01512a23          	sw	s5,20(sp)
80006b4c:	01612823          	sw	s6,16(sp)
80006b50:	02112623          	sw	ra,44(sp)
80006b54:	01312e23          	sw	s3,28(sp)
80006b58:	00060913          	mv	s2,a2
80006b5c:	0007a603          	lw	a2,0(a5)
80006b60:	00072703          	lw	a4,0(a4)
80006b64:	000107b7          	lui	a5,0x10
80006b68:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xefff>
80006b6c:	00f67433          	and	s0,a2,a5
80006b70:	01065613          	srli	a2,a2,0x10
80006b74:	00c40433          	add	s0,s0,a2
80006b78:	00f77633          	and	a2,a4,a5
80006b7c:	00c40433          	add	s0,s0,a2
80006b80:	01075713          	srli	a4,a4,0x10
80006b84:	00870733          	add	a4,a4,s0
80006b88:	01075413          	srli	s0,a4,0x10
80006b8c:	00f77733          	and	a4,a4,a5
80006b90:	00e40733          	add	a4,s0,a4
80006b94:	01075413          	srli	s0,a4,0x10
80006b98:	00f77733          	and	a4,a4,a5
80006b9c:	00050a13          	mv	s4,a0
80006ba0:	00058a93          	mv	s5,a1
80006ba4:	00e40433          	add	s0,s0,a4
80006ba8:	00000b13          	li	s6,0
80006bac:	00078493          	mv	s1,a5
80006bb0:	060a1c63          	bnez	s4,80006c28 <inet_chksum_pseudo_partial+0xf4>
80006bb4:	0e0b1663          	bnez	s6,80006ca0 <inet_chksum_pseudo_partial+0x16c>
80006bb8:	000a8513          	mv	a0,s5
80006bbc:	b15ff0ef          	jal	ra,800066d0 <lwip_htons>
80006bc0:	00050493          	mv	s1,a0
80006bc4:	00090513          	mv	a0,s2
80006bc8:	b09ff0ef          	jal	ra,800066d0 <lwip_htons>
80006bcc:	00a48533          	add	a0,s1,a0
80006bd0:	000107b7          	lui	a5,0x10
80006bd4:	00850433          	add	s0,a0,s0
80006bd8:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xefff>
80006bdc:	01045513          	srli	a0,s0,0x10
80006be0:	00f47433          	and	s0,s0,a5
80006be4:	00850433          	add	s0,a0,s0
80006be8:	01045513          	srli	a0,s0,0x10
80006bec:	00f47433          	and	s0,s0,a5
80006bf0:	00850433          	add	s0,a0,s0
80006bf4:	fff44513          	not	a0,s0
80006bf8:	02c12083          	lw	ra,44(sp)
80006bfc:	02812403          	lw	s0,40(sp)
80006c00:	01051513          	slli	a0,a0,0x10
80006c04:	02412483          	lw	s1,36(sp)
80006c08:	02012903          	lw	s2,32(sp)
80006c0c:	01c12983          	lw	s3,28(sp)
80006c10:	01812a03          	lw	s4,24(sp)
80006c14:	01412a83          	lw	s5,20(sp)
80006c18:	01012b03          	lw	s6,16(sp)
80006c1c:	01055513          	srli	a0,a0,0x10
80006c20:	03010113          	addi	sp,sp,48
80006c24:	00008067          	ret
80006c28:	f80686e3          	beqz	a3,80006bb4 <inet_chksum_pseudo_partial+0x80>
80006c2c:	00aa5783          	lhu	a5,10(s4)
80006c30:	00078993          	mv	s3,a5
80006c34:	00f6f463          	bgeu	a3,a5,80006c3c <inet_chksum_pseudo_partial+0x108>
80006c38:	00068993          	mv	s3,a3
80006c3c:	01099993          	slli	s3,s3,0x10
80006c40:	004a2503          	lw	a0,4(s4)
80006c44:	0109d993          	srli	s3,s3,0x10
80006c48:	00098593          	mv	a1,s3
80006c4c:	00d12623          	sw	a3,12(sp)
80006c50:	cf1ff0ef          	jal	ra,80006940 <lwip_standard_chksum>
80006c54:	00850433          	add	s0,a0,s0
80006c58:	01045793          	srli	a5,s0,0x10
80006c5c:	00c12683          	lw	a3,12(sp)
80006c60:	00947433          	and	s0,s0,s1
80006c64:	00878433          	add	s0,a5,s0
80006c68:	00aa5783          	lhu	a5,10(s4)
80006c6c:	413689b3          	sub	s3,a3,s3
80006c70:	01099693          	slli	a3,s3,0x10
80006c74:	0017f793          	andi	a5,a5,1
80006c78:	0106d693          	srli	a3,a3,0x10
80006c7c:	00078e63          	beqz	a5,80006c98 <inet_chksum_pseudo_partial+0x164>
80006c80:	00841793          	slli	a5,s0,0x8
80006c84:	00845413          	srli	s0,s0,0x8
80006c88:	0097f7b3          	and	a5,a5,s1
80006c8c:	0ff47413          	andi	s0,s0,255
80006c90:	001b4b13          	xori	s6,s6,1
80006c94:	0087e433          	or	s0,a5,s0
80006c98:	000a2a03          	lw	s4,0(s4)
80006c9c:	f15ff06f          	j	80006bb0 <inet_chksum_pseudo_partial+0x7c>
80006ca0:	00010737          	lui	a4,0x10
80006ca4:	00841793          	slli	a5,s0,0x8
80006ca8:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xefff>
80006cac:	00845413          	srli	s0,s0,0x8
80006cb0:	00e7f7b3          	and	a5,a5,a4
80006cb4:	0ff47413          	andi	s0,s0,255
80006cb8:	0087e433          	or	s0,a5,s0
80006cbc:	efdff06f          	j	80006bb8 <inet_chksum_pseudo_partial+0x84>

80006cc0 <ip_chksum_pseudo_partial>:
80006cc0:	e75ff06f          	j	80006b34 <inet_chksum_pseudo_partial>

80006cc4 <inet_chksum>:
80006cc4:	ff010113          	addi	sp,sp,-16
80006cc8:	00112623          	sw	ra,12(sp)
80006ccc:	c75ff0ef          	jal	ra,80006940 <lwip_standard_chksum>
80006cd0:	00c12083          	lw	ra,12(sp)
80006cd4:	fff54513          	not	a0,a0
80006cd8:	01051513          	slli	a0,a0,0x10
80006cdc:	01055513          	srli	a0,a0,0x10
80006ce0:	01010113          	addi	sp,sp,16
80006ce4:	00008067          	ret

80006ce8 <inet_chksum_pbuf>:
80006ce8:	fe010113          	addi	sp,sp,-32
80006cec:	01212823          	sw	s2,16(sp)
80006cf0:	00010937          	lui	s2,0x10
80006cf4:	00812c23          	sw	s0,24(sp)
80006cf8:	00912a23          	sw	s1,20(sp)
80006cfc:	01312623          	sw	s3,12(sp)
80006d00:	00112e23          	sw	ra,28(sp)
80006d04:	00050493          	mv	s1,a0
80006d08:	00000993          	li	s3,0
80006d0c:	00000413          	li	s0,0
80006d10:	fff90913          	addi	s2,s2,-1 # ffff <_stack_size+0xefff>
80006d14:	04049663          	bnez	s1,80006d60 <inet_chksum_pbuf+0x78>
80006d18:	02098063          	beqz	s3,80006d38 <inet_chksum_pbuf+0x50>
80006d1c:	00010737          	lui	a4,0x10
80006d20:	00841793          	slli	a5,s0,0x8
80006d24:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xefff>
80006d28:	00845413          	srli	s0,s0,0x8
80006d2c:	00e7f7b3          	and	a5,a5,a4
80006d30:	0ff47413          	andi	s0,s0,255
80006d34:	0087e433          	or	s0,a5,s0
80006d38:	fff44513          	not	a0,s0
80006d3c:	01c12083          	lw	ra,28(sp)
80006d40:	01812403          	lw	s0,24(sp)
80006d44:	01051513          	slli	a0,a0,0x10
80006d48:	01412483          	lw	s1,20(sp)
80006d4c:	01012903          	lw	s2,16(sp)
80006d50:	00c12983          	lw	s3,12(sp)
80006d54:	01055513          	srli	a0,a0,0x10
80006d58:	02010113          	addi	sp,sp,32
80006d5c:	00008067          	ret
80006d60:	00a4d583          	lhu	a1,10(s1)
80006d64:	0044a503          	lw	a0,4(s1)
80006d68:	bd9ff0ef          	jal	ra,80006940 <lwip_standard_chksum>
80006d6c:	00850433          	add	s0,a0,s0
80006d70:	01045793          	srli	a5,s0,0x10
80006d74:	01247433          	and	s0,s0,s2
80006d78:	00878433          	add	s0,a5,s0
80006d7c:	00a4d783          	lhu	a5,10(s1)
80006d80:	0017f793          	andi	a5,a5,1
80006d84:	00078e63          	beqz	a5,80006da0 <inet_chksum_pbuf+0xb8>
80006d88:	00841793          	slli	a5,s0,0x8
80006d8c:	00845413          	srli	s0,s0,0x8
80006d90:	0127f7b3          	and	a5,a5,s2
80006d94:	0ff47413          	andi	s0,s0,255
80006d98:	0019c993          	xori	s3,s3,1
80006d9c:	0087e433          	or	s0,a5,s0
80006da0:	0004a483          	lw	s1,0(s1)
80006da4:	f71ff06f          	j	80006d14 <inet_chksum_pbuf+0x2c>

80006da8 <mem_overflow_check_raw>:
80006da8:	f5010113          	addi	sp,sp,-176
80006dac:	0a812423          	sw	s0,168(sp)
80006db0:	0a912223          	sw	s1,164(sp)
80006db4:	0b212023          	sw	s2,160(sp)
80006db8:	09312e23          	sw	s3,156(sp)
80006dbc:	09412c23          	sw	s4,152(sp)
80006dc0:	09512a23          	sw	s5,148(sp)
80006dc4:	09612823          	sw	s6,144(sp)
80006dc8:	09712623          	sw	s7,140(sp)
80006dcc:	0a112623          	sw	ra,172(sp)
80006dd0:	00050493          	mv	s1,a0
80006dd4:	00058a93          	mv	s5,a1
80006dd8:	00060913          	mv	s2,a2
80006ddc:	00068993          	mv	s3,a3
80006de0:	00000413          	li	s0,0
80006de4:	0cd00b13          	li	s6,205
80006de8:	80003bb7          	lui	s7,0x80003
80006dec:	01000a13          	li	s4,16
80006df0:	008a87b3          	add	a5,s5,s0
80006df4:	00f487b3          	add	a5,s1,a5
80006df8:	0007c783          	lbu	a5,0(a5)
80006dfc:	01678e63          	beq	a5,s6,80006e18 <mem_overflow_check_raw+0x70>
80006e00:	00098713          	mv	a4,s3
80006e04:	00090693          	mv	a3,s2
80006e08:	e08b8613          	addi	a2,s7,-504 # 80002e08 <_ram_heap_end+0xfffeae08>
80006e0c:	08000593          	li	a1,128
80006e10:	00010513          	mv	a0,sp
80006e14:	404080ef          	jal	ra,8000f218 <sniprintf>
80006e18:	00140413          	addi	s0,s0,1
80006e1c:	fd441ae3          	bne	s0,s4,80006df0 <mem_overflow_check_raw+0x48>
80006e20:	ff048413          	addi	s0,s1,-16
80006e24:	0cd00a13          	li	s4,205
80006e28:	80003ab7          	lui	s5,0x80003
80006e2c:	00044783          	lbu	a5,0(s0)
80006e30:	01478e63          	beq	a5,s4,80006e4c <mem_overflow_check_raw+0xa4>
80006e34:	00098713          	mv	a4,s3
80006e38:	00090693          	mv	a3,s2
80006e3c:	e28a8613          	addi	a2,s5,-472 # 80002e28 <_ram_heap_end+0xfffeae28>
80006e40:	08000593          	li	a1,128
80006e44:	00010513          	mv	a0,sp
80006e48:	3d0080ef          	jal	ra,8000f218 <sniprintf>
80006e4c:	00140413          	addi	s0,s0,1
80006e50:	fc849ee3          	bne	s1,s0,80006e2c <mem_overflow_check_raw+0x84>
80006e54:	0ac12083          	lw	ra,172(sp)
80006e58:	0a812403          	lw	s0,168(sp)
80006e5c:	0a412483          	lw	s1,164(sp)
80006e60:	0a012903          	lw	s2,160(sp)
80006e64:	09c12983          	lw	s3,156(sp)
80006e68:	09812a03          	lw	s4,152(sp)
80006e6c:	09412a83          	lw	s5,148(sp)
80006e70:	09012b03          	lw	s6,144(sp)
80006e74:	08c12b83          	lw	s7,140(sp)
80006e78:	0b010113          	addi	sp,sp,176
80006e7c:	00008067          	ret

80006e80 <mem_overflow_init_raw>:
80006e80:	ff010113          	addi	sp,sp,-16
80006e84:	00812423          	sw	s0,8(sp)
80006e88:	00912223          	sw	s1,4(sp)
80006e8c:	00050413          	mv	s0,a0
80006e90:	00058493          	mv	s1,a1
80006e94:	01000613          	li	a2,16
80006e98:	0cd00593          	li	a1,205
80006e9c:	ff050513          	addi	a0,a0,-16
80006ea0:	00112623          	sw	ra,12(sp)
80006ea4:	6b4060ef          	jal	ra,8000d558 <memset>
80006ea8:	00940533          	add	a0,s0,s1
80006eac:	00812403          	lw	s0,8(sp)
80006eb0:	00c12083          	lw	ra,12(sp)
80006eb4:	00412483          	lw	s1,4(sp)
80006eb8:	01000613          	li	a2,16
80006ebc:	0cd00593          	li	a1,205
80006ec0:	01010113          	addi	sp,sp,16
80006ec4:	6940606f          	j	8000d558 <memset>

80006ec8 <mem_init>:
80006ec8:	00008067          	ret

80006ecc <mem_trim>:
80006ecc:	00008067          	ret

80006ed0 <lwip_malloc>:
80006ed0:	ff010113          	addi	sp,sp,-16
80006ed4:	00812423          	sw	s0,8(sp)
80006ed8:	00112623          	sw	ra,12(sp)
80006edc:	3dd070ef          	jal	ra,8000eab8 <malloc>
80006ee0:	00050413          	mv	s0,a0
80006ee4:	00051663          	bnez	a0,80006ef0 <lwip_malloc+0x20>
80006ee8:	b98fe0ef          	jal	ra,80005280 <sys_arch_protect>
80006eec:	b98fe0ef          	jal	ra,80005284 <sys_arch_unprotect>
80006ef0:	00040513          	mv	a0,s0
80006ef4:	00c12083          	lw	ra,12(sp)
80006ef8:	00812403          	lw	s0,8(sp)
80006efc:	01010113          	addi	sp,sp,16
80006f00:	00008067          	ret

80006f04 <lwip_free>:
80006f04:	3c50706f          	j	8000eac8 <free>

80006f08 <lwip_calloc>:
80006f08:	39c0706f          	j	8000e2a4 <calloc>

80006f0c <do_memp_free_pool>:
80006f0c:	ff010113          	addi	sp,sp,-16
80006f10:	00112623          	sw	ra,12(sp)
80006f14:	00812423          	sw	s0,8(sp)
80006f18:	00912223          	sw	s1,4(sp)
80006f1c:	01212023          	sw	s2,0(sp)
80006f20:	00058413          	mv	s0,a1
80006f24:	00050493          	mv	s1,a0
80006f28:	b58fe0ef          	jal	ra,80005280 <sys_arch_protect>
80006f2c:	0004a683          	lw	a3,0(s1)
80006f30:	0044d583          	lhu	a1,4(s1)
80006f34:	80003637          	lui	a2,0x80003
80006f38:	00050913          	mv	s2,a0
80006f3c:	e6060613          	addi	a2,a2,-416 # 80002e60 <_ram_heap_end+0xfffeae60>
80006f40:	00040513          	mv	a0,s0
80006f44:	e65ff0ef          	jal	ra,80006da8 <mem_overflow_check_raw>
80006f48:	00090513          	mv	a0,s2
80006f4c:	b38fe0ef          	jal	ra,80005284 <sys_arch_unprotect>
80006f50:	fe440513          	addi	a0,s0,-28
80006f54:	00812403          	lw	s0,8(sp)
80006f58:	00c12083          	lw	ra,12(sp)
80006f5c:	00412483          	lw	s1,4(sp)
80006f60:	00012903          	lw	s2,0(sp)
80006f64:	01010113          	addi	sp,sp,16
80006f68:	f9dff06f          	j	80006f04 <lwip_free>

80006f6c <do_memp_malloc_pool_fn>:
80006f6c:	fe010113          	addi	sp,sp,-32
80006f70:	00812c23          	sw	s0,24(sp)
80006f74:	00912a23          	sw	s1,20(sp)
80006f78:	00112e23          	sw	ra,28(sp)
80006f7c:	01212823          	sw	s2,16(sp)
80006f80:	00050493          	mv	s1,a0
80006f84:	00455503          	lhu	a0,4(a0)
80006f88:	00b12623          	sw	a1,12(sp)
80006f8c:	00c12423          	sw	a2,8(sp)
80006f90:	00350513          	addi	a0,a0,3
80006f94:	ffc57513          	andi	a0,a0,-4
80006f98:	02c50513          	addi	a0,a0,44
80006f9c:	f35ff0ef          	jal	ra,80006ed0 <lwip_malloc>
80006fa0:	00050413          	mv	s0,a0
80006fa4:	adcfe0ef          	jal	ra,80005280 <sys_arch_protect>
80006fa8:	02040663          	beqz	s0,80006fd4 <do_memp_malloc_pool_fn+0x68>
80006fac:	00c12583          	lw	a1,12(sp)
80006fb0:	00812603          	lw	a2,8(sp)
80006fb4:	01c40413          	addi	s0,s0,28
80006fb8:	feb42423          	sw	a1,-24(s0)
80006fbc:	fec42623          	sw	a2,-20(s0)
80006fc0:	0044d583          	lhu	a1,4(s1)
80006fc4:	00050913          	mv	s2,a0
80006fc8:	00040513          	mv	a0,s0
80006fcc:	eb5ff0ef          	jal	ra,80006e80 <mem_overflow_init_raw>
80006fd0:	00090513          	mv	a0,s2
80006fd4:	ab0fe0ef          	jal	ra,80005284 <sys_arch_unprotect>
80006fd8:	00040513          	mv	a0,s0
80006fdc:	01c12083          	lw	ra,28(sp)
80006fe0:	01812403          	lw	s0,24(sp)
80006fe4:	01412483          	lw	s1,20(sp)
80006fe8:	01012903          	lw	s2,16(sp)
80006fec:	02010113          	addi	sp,sp,32
80006ff0:	00008067          	ret

80006ff4 <memp_init_pool>:
80006ff4:	00008067          	ret

80006ff8 <memp_init>:
80006ff8:	00008067          	ret

80006ffc <memp_malloc_pool_fn>:
80006ffc:	00050463          	beqz	a0,80007004 <memp_malloc_pool_fn+0x8>
80007000:	f6dff06f          	j	80006f6c <do_memp_malloc_pool_fn>
80007004:	00008067          	ret

80007008 <memp_malloc_fn>:
80007008:	00500793          	li	a5,5
8000700c:	00a7ee63          	bltu	a5,a0,80007028 <memp_malloc_fn+0x20>
80007010:	00251793          	slli	a5,a0,0x2
80007014:	80003537          	lui	a0,0x80003
80007018:	e4850513          	addi	a0,a0,-440 # 80002e48 <_ram_heap_end+0xfffeae48>
8000701c:	00f50533          	add	a0,a0,a5
80007020:	00052503          	lw	a0,0(a0)
80007024:	f49ff06f          	j	80006f6c <do_memp_malloc_pool_fn>
80007028:	00000513          	li	a0,0
8000702c:	00008067          	ret

80007030 <memp_free_pool>:
80007030:	00050663          	beqz	a0,8000703c <memp_free_pool+0xc>
80007034:	00058463          	beqz	a1,8000703c <memp_free_pool+0xc>
80007038:	ed5ff06f          	j	80006f0c <do_memp_free_pool>
8000703c:	00008067          	ret

80007040 <memp_free>:
80007040:	00500713          	li	a4,5
80007044:	02a76063          	bltu	a4,a0,80007064 <memp_free+0x24>
80007048:	00058e63          	beqz	a1,80007064 <memp_free+0x24>
8000704c:	00251793          	slli	a5,a0,0x2
80007050:	80003537          	lui	a0,0x80003
80007054:	e4850513          	addi	a0,a0,-440 # 80002e48 <_ram_heap_end+0xfffeae48>
80007058:	00f50533          	add	a0,a0,a5
8000705c:	00052503          	lw	a0,0(a0)
80007060:	eadff06f          	j	80006f0c <do_memp_free_pool>
80007064:	00008067          	ret

80007068 <netif_null_output_ip4>:
80007068:	ff400513          	li	a0,-12
8000706c:	00008067          	ret

80007070 <netif_issue_reports>:
80007070:	03554783          	lbu	a5,53(a0)
80007074:	00500693          	li	a3,5
80007078:	0057f613          	andi	a2,a5,5
8000707c:	02d61263          	bne	a2,a3,800070a0 <netif_issue_reports+0x30>
80007080:	0015f593          	andi	a1,a1,1
80007084:	00058e63          	beqz	a1,800070a0 <netif_issue_reports+0x30>
80007088:	00452683          	lw	a3,4(a0)
8000708c:	00068a63          	beqz	a3,800070a0 <netif_issue_reports+0x30>
80007090:	0087f793          	andi	a5,a5,8
80007094:	00078663          	beqz	a5,800070a0 <netif_issue_reports+0x30>
80007098:	00450593          	addi	a1,a0,4
8000709c:	0e50406f          	j	8000b980 <etharp_request>
800070a0:	00008067          	ret

800070a4 <netif_do_set_ipaddr>:
800070a4:	00452783          	lw	a5,4(a0)
800070a8:	0005a703          	lw	a4,0(a1)
800070ac:	08f70263          	beq	a4,a5,80007130 <netif_do_set_ipaddr+0x8c>
800070b0:	fe010113          	addi	sp,sp,-32
800070b4:	00f62023          	sw	a5,0(a2)
800070b8:	00812c23          	sw	s0,24(sp)
800070bc:	01212823          	sw	s2,16(sp)
800070c0:	00050413          	mv	s0,a0
800070c4:	00058913          	mv	s2,a1
800070c8:	00060513          	mv	a0,a2
800070cc:	00c10593          	addi	a1,sp,12
800070d0:	00112e23          	sw	ra,28(sp)
800070d4:	00e12623          	sw	a4,12(sp)
800070d8:	00912a23          	sw	s1,20(sp)
800070dc:	00060493          	mv	s1,a2
800070e0:	464020ef          	jal	ra,80009544 <udp_netif_ip_addr_changed>
800070e4:	00c10593          	addi	a1,sp,12
800070e8:	00048513          	mv	a0,s1
800070ec:	0c5010ef          	jal	ra,800089b0 <raw_netif_ip_addr_changed>
800070f0:	00092783          	lw	a5,0(s2)
800070f4:	00100593          	li	a1,1
800070f8:	00040513          	mv	a0,s0
800070fc:	00f42223          	sw	a5,4(s0)
80007100:	f71ff0ef          	jal	ra,80007070 <netif_issue_reports>
80007104:	01c42783          	lw	a5,28(s0)
80007108:	00078663          	beqz	a5,80007114 <netif_do_set_ipaddr+0x70>
8000710c:	00040513          	mv	a0,s0
80007110:	000780e7          	jalr	a5
80007114:	01c12083          	lw	ra,28(sp)
80007118:	01812403          	lw	s0,24(sp)
8000711c:	01412483          	lw	s1,20(sp)
80007120:	01012903          	lw	s2,16(sp)
80007124:	00100513          	li	a0,1
80007128:	02010113          	addi	sp,sp,32
8000712c:	00008067          	ret
80007130:	00000513          	li	a0,0
80007134:	00008067          	ret

80007138 <netif_init>:
80007138:	00008067          	ret

8000713c <netif_input>:
8000713c:	0355c783          	lbu	a5,53(a1)
80007140:	0187f793          	andi	a5,a5,24
80007144:	00078463          	beqz	a5,8000714c <netif_input+0x10>
80007148:	1d40606f          	j	8000d31c <ethernet_input>
8000714c:	6300506f          	j	8000c77c <ip4_input>

80007150 <netif_set_ipaddr>:
80007150:	02050463          	beqz	a0,80007178 <netif_set_ipaddr+0x28>
80007154:	fe010113          	addi	sp,sp,-32
80007158:	00112e23          	sw	ra,28(sp)
8000715c:	00059463          	bnez	a1,80007164 <netif_set_ipaddr+0x14>
80007160:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
80007164:	00c10613          	addi	a2,sp,12
80007168:	f3dff0ef          	jal	ra,800070a4 <netif_do_set_ipaddr>
8000716c:	01c12083          	lw	ra,28(sp)
80007170:	02010113          	addi	sp,sp,32
80007174:	00008067          	ret
80007178:	00008067          	ret

8000717c <netif_set_netmask>:
8000717c:	00050e63          	beqz	a0,80007198 <netif_set_netmask+0x1c>
80007180:	00059463          	bnez	a1,80007188 <netif_set_netmask+0xc>
80007184:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
80007188:	0005a783          	lw	a5,0(a1)
8000718c:	00852703          	lw	a4,8(a0)
80007190:	00e78463          	beq	a5,a4,80007198 <netif_set_netmask+0x1c>
80007194:	00f52423          	sw	a5,8(a0)
80007198:	00008067          	ret

8000719c <netif_set_gw>:
8000719c:	00050e63          	beqz	a0,800071b8 <netif_set_gw+0x1c>
800071a0:	00059463          	bnez	a1,800071a8 <netif_set_gw+0xc>
800071a4:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
800071a8:	0005a783          	lw	a5,0(a1)
800071ac:	00c52703          	lw	a4,12(a0)
800071b0:	00e78463          	beq	a5,a4,800071b8 <netif_set_gw+0x1c>
800071b4:	00f52623          	sw	a5,12(a0)
800071b8:	00008067          	ret

800071bc <netif_set_addr>:
800071bc:	fd010113          	addi	sp,sp,-48
800071c0:	02812423          	sw	s0,40(sp)
800071c4:	02912223          	sw	s1,36(sp)
800071c8:	03212023          	sw	s2,32(sp)
800071cc:	02112623          	sw	ra,44(sp)
800071d0:	00050493          	mv	s1,a0
800071d4:	00060913          	mv	s2,a2
800071d8:	00058413          	mv	s0,a1
800071dc:	00059463          	bnez	a1,800071e4 <netif_set_addr+0x28>
800071e0:	84818413          	addi	s0,gp,-1976 # 800032b8 <ip_addr_any>
800071e4:	00091463          	bnez	s2,800071ec <netif_set_addr+0x30>
800071e8:	84818913          	addi	s2,gp,-1976 # 800032b8 <ip_addr_any>
800071ec:	00069463          	bnez	a3,800071f4 <netif_set_addr+0x38>
800071f0:	84818693          	addi	a3,gp,-1976 # 800032b8 <ip_addr_any>
800071f4:	00042783          	lw	a5,0(s0)
800071f8:	00078663          	beqz	a5,80007204 <netif_set_addr+0x48>
800071fc:	00000793          	li	a5,0
80007200:	0200006f          	j	80007220 <netif_set_addr+0x64>
80007204:	01c10613          	addi	a2,sp,28
80007208:	00040593          	mv	a1,s0
8000720c:	00048513          	mv	a0,s1
80007210:	00d12623          	sw	a3,12(sp)
80007214:	e91ff0ef          	jal	ra,800070a4 <netif_do_set_ipaddr>
80007218:	00c12683          	lw	a3,12(sp)
8000721c:	00100793          	li	a5,1
80007220:	00092703          	lw	a4,0(s2)
80007224:	0084a603          	lw	a2,8(s1)
80007228:	00c70463          	beq	a4,a2,80007230 <netif_set_addr+0x74>
8000722c:	00e4a423          	sw	a4,8(s1)
80007230:	0006a703          	lw	a4,0(a3)
80007234:	00c4a683          	lw	a3,12(s1)
80007238:	00d70463          	beq	a4,a3,80007240 <netif_set_addr+0x84>
8000723c:	00e4a623          	sw	a4,12(s1)
80007240:	00079a63          	bnez	a5,80007254 <netif_set_addr+0x98>
80007244:	01c10613          	addi	a2,sp,28
80007248:	00040593          	mv	a1,s0
8000724c:	00048513          	mv	a0,s1
80007250:	e55ff0ef          	jal	ra,800070a4 <netif_do_set_ipaddr>
80007254:	02c12083          	lw	ra,44(sp)
80007258:	02812403          	lw	s0,40(sp)
8000725c:	02412483          	lw	s1,36(sp)
80007260:	02012903          	lw	s2,32(sp)
80007264:	03010113          	addi	sp,sp,48
80007268:	00008067          	ret

8000726c <netif_add>:
8000726c:	fe010113          	addi	sp,sp,-32
80007270:	00112e23          	sw	ra,28(sp)
80007274:	00812c23          	sw	s0,24(sp)
80007278:	00912a23          	sw	s1,20(sp)
8000727c:	02051063          	bnez	a0,8000729c <netif_add+0x30>
80007280:	00000413          	li	s0,0
80007284:	00040513          	mv	a0,s0
80007288:	01c12083          	lw	ra,28(sp)
8000728c:	01812403          	lw	s0,24(sp)
80007290:	01412483          	lw	s1,20(sp)
80007294:	02010113          	addi	sp,sp,32
80007298:	00008067          	ret
8000729c:	fe0782e3          	beqz	a5,80007280 <netif_add+0x14>
800072a0:	00050413          	mv	s0,a0
800072a4:	00059463          	bnez	a1,800072ac <netif_add+0x40>
800072a8:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
800072ac:	00061463          	bnez	a2,800072b4 <netif_add+0x48>
800072b0:	84818613          	addi	a2,gp,-1976 # 800032b8 <ip_addr_any>
800072b4:	00069463          	bnez	a3,800072bc <netif_add+0x50>
800072b8:	84818693          	addi	a3,gp,-1976 # 800032b8 <ip_addr_any>
800072bc:	02e42223          	sw	a4,36(s0)
800072c0:	8ec1c703          	lbu	a4,-1812(gp) # 8000335c <netif_num>
800072c4:	80007537          	lui	a0,0x80007
800072c8:	06850513          	addi	a0,a0,104 # 80007068 <_ram_heap_end+0xfffef068>
800072cc:	00a42a23          	sw	a0,20(s0)
800072d0:	00042223          	sw	zero,4(s0)
800072d4:	00040513          	mv	a0,s0
800072d8:	00042423          	sw	zero,8(s0)
800072dc:	00042623          	sw	zero,12(s0)
800072e0:	02041623          	sh	zero,44(s0)
800072e4:	02040aa3          	sb	zero,53(s0)
800072e8:	02040423          	sb	zero,40(s0)
800072ec:	020404a3          	sb	zero,41(s0)
800072f0:	02040523          	sb	zero,42(s0)
800072f4:	020405a3          	sb	zero,43(s0)
800072f8:	00042e23          	sw	zero,28(s0)
800072fc:	02042023          	sw	zero,32(s0)
80007300:	02e40c23          	sb	a4,56(s0)
80007304:	01042823          	sw	a6,16(s0)
80007308:	02042e23          	sw	zero,60(s0)
8000730c:	00f12623          	sw	a5,12(sp)
80007310:	eadff0ef          	jal	ra,800071bc <netif_set_addr>
80007314:	00c12783          	lw	a5,12(sp)
80007318:	00040513          	mv	a0,s0
8000731c:	000780e7          	jalr	a5
80007320:	f60510e3          	bnez	a0,80007280 <netif_add+0x14>
80007324:	8f41a603          	lw	a2,-1804(gp) # 80003364 <netif_list>
80007328:	00078713          	mv	a4,a5
8000732c:	0ff00593          	li	a1,255
80007330:	03844783          	lbu	a5,56(s0)
80007334:	00b79463          	bne	a5,a1,8000733c <netif_add+0xd0>
80007338:	02040c23          	sb	zero,56(s0)
8000733c:	03844783          	lbu	a5,56(s0)
80007340:	00060693          	mv	a3,a2
80007344:	02069463          	bnez	a3,8000736c <netif_add+0x100>
80007348:	0fe00593          	li	a1,254
8000734c:	00000693          	li	a3,0
80007350:	00b78663          	beq	a5,a1,8000735c <netif_add+0xf0>
80007354:	00178793          	addi	a5,a5,1
80007358:	0ff7f693          	andi	a3,a5,255
8000735c:	00c42023          	sw	a2,0(s0)
80007360:	8ed18623          	sb	a3,-1812(gp) # 8000335c <netif_num>
80007364:	8e81aa23          	sw	s0,-1804(gp) # 80003364 <netif_list>
80007368:	f1dff06f          	j	80007284 <netif_add+0x18>
8000736c:	0386c503          	lbu	a0,56(a3)
80007370:	00f51863          	bne	a0,a5,80007380 <netif_add+0x114>
80007374:	00178793          	addi	a5,a5,1
80007378:	02f40c23          	sb	a5,56(s0)
8000737c:	fb5ff06f          	j	80007330 <netif_add+0xc4>
80007380:	0006a683          	lw	a3,0(a3)
80007384:	fc1ff06f          	j	80007344 <netif_add+0xd8>

80007388 <netif_add_noaddr>:
80007388:	00068813          	mv	a6,a3
8000738c:	00060793          	mv	a5,a2
80007390:	00058713          	mv	a4,a1
80007394:	00000693          	li	a3,0
80007398:	00000613          	li	a2,0
8000739c:	00000593          	li	a1,0
800073a0:	ecdff06f          	j	8000726c <netif_add>

800073a4 <netif_set_default>:
800073a4:	8ea1a823          	sw	a0,-1808(gp) # 80003360 <netif_default>
800073a8:	00008067          	ret

800073ac <netif_set_up>:
800073ac:	04050e63          	beqz	a0,80007408 <netif_set_up+0x5c>
800073b0:	ff010113          	addi	sp,sp,-16
800073b4:	00812423          	sw	s0,8(sp)
800073b8:	00112623          	sw	ra,12(sp)
800073bc:	03554783          	lbu	a5,53(a0)
800073c0:	00050413          	mv	s0,a0
800073c4:	0017f713          	andi	a4,a5,1
800073c8:	02071863          	bnez	a4,800073f8 <netif_set_up+0x4c>
800073cc:	0017e793          	ori	a5,a5,1
800073d0:	02f50aa3          	sb	a5,53(a0)
800073d4:	01c52783          	lw	a5,28(a0)
800073d8:	00078463          	beqz	a5,800073e0 <netif_set_up+0x34>
800073dc:	000780e7          	jalr	a5
800073e0:	00040513          	mv	a0,s0
800073e4:	00812403          	lw	s0,8(sp)
800073e8:	00c12083          	lw	ra,12(sp)
800073ec:	00300593          	li	a1,3
800073f0:	01010113          	addi	sp,sp,16
800073f4:	c7dff06f          	j	80007070 <netif_issue_reports>
800073f8:	00c12083          	lw	ra,12(sp)
800073fc:	00812403          	lw	s0,8(sp)
80007400:	01010113          	addi	sp,sp,16
80007404:	00008067          	ret
80007408:	00008067          	ret

8000740c <netif_set_down>:
8000740c:	06050063          	beqz	a0,8000746c <netif_set_down+0x60>
80007410:	ff010113          	addi	sp,sp,-16
80007414:	00812423          	sw	s0,8(sp)
80007418:	00112623          	sw	ra,12(sp)
8000741c:	03554783          	lbu	a5,53(a0)
80007420:	00050413          	mv	s0,a0
80007424:	0017f713          	andi	a4,a5,1
80007428:	02070a63          	beqz	a4,8000745c <netif_set_down+0x50>
8000742c:	ffe7f713          	andi	a4,a5,-2
80007430:	02e50aa3          	sb	a4,53(a0)
80007434:	0087f793          	andi	a5,a5,8
80007438:	00078463          	beqz	a5,80007440 <netif_set_down+0x34>
8000743c:	1cc040ef          	jal	ra,8000b608 <etharp_cleanup_netif>
80007440:	01c42303          	lw	t1,28(s0)
80007444:	00030c63          	beqz	t1,8000745c <netif_set_down+0x50>
80007448:	00040513          	mv	a0,s0
8000744c:	00812403          	lw	s0,8(sp)
80007450:	00c12083          	lw	ra,12(sp)
80007454:	01010113          	addi	sp,sp,16
80007458:	00030067          	jr	t1
8000745c:	00c12083          	lw	ra,12(sp)
80007460:	00812403          	lw	s0,8(sp)
80007464:	01010113          	addi	sp,sp,16
80007468:	00008067          	ret
8000746c:	00008067          	ret

80007470 <netif_remove>:
80007470:	08050e63          	beqz	a0,8000750c <netif_remove+0x9c>
80007474:	ff010113          	addi	sp,sp,-16
80007478:	00812423          	sw	s0,8(sp)
8000747c:	00112623          	sw	ra,12(sp)
80007480:	00912223          	sw	s1,4(sp)
80007484:	00452783          	lw	a5,4(a0)
80007488:	00050413          	mv	s0,a0
8000748c:	02078063          	beqz	a5,800074ac <netif_remove+0x3c>
80007490:	00450493          	addi	s1,a0,4
80007494:	00000593          	li	a1,0
80007498:	00048513          	mv	a0,s1
8000749c:	0a8020ef          	jal	ra,80009544 <udp_netif_ip_addr_changed>
800074a0:	00000593          	li	a1,0
800074a4:	00048513          	mv	a0,s1
800074a8:	508010ef          	jal	ra,800089b0 <raw_netif_ip_addr_changed>
800074ac:	03544783          	lbu	a5,53(s0)
800074b0:	0017f793          	andi	a5,a5,1
800074b4:	00078663          	beqz	a5,800074c0 <netif_remove+0x50>
800074b8:	00040513          	mv	a0,s0
800074bc:	f51ff0ef          	jal	ra,8000740c <netif_set_down>
800074c0:	8f01a703          	lw	a4,-1808(gp) # 80003360 <netif_default>
800074c4:	00871463          	bne	a4,s0,800074cc <netif_remove+0x5c>
800074c8:	8e01a823          	sw	zero,-1808(gp) # 80003360 <netif_default>
800074cc:	8f41a783          	lw	a5,-1804(gp) # 80003364 <netif_list>
800074d0:	02879263          	bne	a5,s0,800074f4 <netif_remove+0x84>
800074d4:	00042783          	lw	a5,0(s0)
800074d8:	8ef1aa23          	sw	a5,-1804(gp) # 80003364 <netif_list>
800074dc:	00c12083          	lw	ra,12(sp)
800074e0:	00812403          	lw	s0,8(sp)
800074e4:	00412483          	lw	s1,4(sp)
800074e8:	01010113          	addi	sp,sp,16
800074ec:	00008067          	ret
800074f0:	00070793          	mv	a5,a4
800074f4:	fe0784e3          	beqz	a5,800074dc <netif_remove+0x6c>
800074f8:	0007a703          	lw	a4,0(a5)
800074fc:	fe871ae3          	bne	a4,s0,800074f0 <netif_remove+0x80>
80007500:	00042703          	lw	a4,0(s0)
80007504:	00e7a023          	sw	a4,0(a5)
80007508:	fd5ff06f          	j	800074dc <netif_remove+0x6c>
8000750c:	00008067          	ret

80007510 <netif_set_status_callback>:
80007510:	00050463          	beqz	a0,80007518 <netif_set_status_callback+0x8>
80007514:	00b52e23          	sw	a1,28(a0)
80007518:	00008067          	ret

8000751c <netif_set_link_up>:
8000751c:	06050263          	beqz	a0,80007580 <netif_set_link_up+0x64>
80007520:	ff010113          	addi	sp,sp,-16
80007524:	00812423          	sw	s0,8(sp)
80007528:	00112623          	sw	ra,12(sp)
8000752c:	03554783          	lbu	a5,53(a0)
80007530:	00050413          	mv	s0,a0
80007534:	0047f713          	andi	a4,a5,4
80007538:	02071c63          	bnez	a4,80007570 <netif_set_link_up+0x54>
8000753c:	0047e793          	ori	a5,a5,4
80007540:	02f50aa3          	sb	a5,53(a0)
80007544:	3c8030ef          	jal	ra,8000a90c <dhcp_network_changed>
80007548:	00300593          	li	a1,3
8000754c:	00040513          	mv	a0,s0
80007550:	b21ff0ef          	jal	ra,80007070 <netif_issue_reports>
80007554:	02042303          	lw	t1,32(s0)
80007558:	00030c63          	beqz	t1,80007570 <netif_set_link_up+0x54>
8000755c:	00040513          	mv	a0,s0
80007560:	00812403          	lw	s0,8(sp)
80007564:	00c12083          	lw	ra,12(sp)
80007568:	01010113          	addi	sp,sp,16
8000756c:	00030067          	jr	t1
80007570:	00c12083          	lw	ra,12(sp)
80007574:	00812403          	lw	s0,8(sp)
80007578:	01010113          	addi	sp,sp,16
8000757c:	00008067          	ret
80007580:	00008067          	ret

80007584 <netif_set_link_down>:
80007584:	02050263          	beqz	a0,800075a8 <netif_set_link_down+0x24>
80007588:	03554703          	lbu	a4,53(a0)
8000758c:	00477693          	andi	a3,a4,4
80007590:	00068c63          	beqz	a3,800075a8 <netif_set_link_down+0x24>
80007594:	02052303          	lw	t1,32(a0)
80007598:	ffb77713          	andi	a4,a4,-5
8000759c:	02e50aa3          	sb	a4,53(a0)
800075a0:	00030463          	beqz	t1,800075a8 <netif_set_link_down+0x24>
800075a4:	00030067          	jr	t1
800075a8:	00008067          	ret

800075ac <netif_set_link_callback>:
800075ac:	00050463          	beqz	a0,800075b4 <netif_set_link_callback+0x8>
800075b0:	02b52023          	sw	a1,32(a0)
800075b4:	00008067          	ret

800075b8 <netif_get_by_index>:
800075b8:	00000793          	li	a5,0
800075bc:	00050663          	beqz	a0,800075c8 <netif_get_by_index+0x10>
800075c0:	8f41a783          	lw	a5,-1804(gp) # 80003364 <netif_list>
800075c4:	00079663          	bnez	a5,800075d0 <netif_get_by_index+0x18>
800075c8:	00078513          	mv	a0,a5
800075cc:	00008067          	ret
800075d0:	0387c703          	lbu	a4,56(a5)
800075d4:	00170713          	addi	a4,a4,1
800075d8:	0ff77713          	andi	a4,a4,255
800075dc:	fea706e3          	beq	a4,a0,800075c8 <netif_get_by_index+0x10>
800075e0:	0007a783          	lw	a5,0(a5)
800075e4:	fe1ff06f          	j	800075c4 <netif_get_by_index+0xc>

800075e8 <netif_index_to_name>:
800075e8:	ff010113          	addi	sp,sp,-16
800075ec:	00812423          	sw	s0,8(sp)
800075f0:	00912223          	sw	s1,4(sp)
800075f4:	00112623          	sw	ra,12(sp)
800075f8:	00050493          	mv	s1,a0
800075fc:	00058413          	mv	s0,a1
80007600:	fb9ff0ef          	jal	ra,800075b8 <netif_get_by_index>
80007604:	02050463          	beqz	a0,8000762c <netif_index_to_name+0x44>
80007608:	03654783          	lbu	a5,54(a0)
8000760c:	fff48613          	addi	a2,s1,-1
80007610:	00400593          	li	a1,4
80007614:	00f40023          	sb	a5,0(s0)
80007618:	03754783          	lbu	a5,55(a0)
8000761c:	00240513          	addi	a0,s0,2
80007620:	00f400a3          	sb	a5,1(s0)
80007624:	a20ff0ef          	jal	ra,80006844 <lwip_itoa>
80007628:	00040513          	mv	a0,s0
8000762c:	00c12083          	lw	ra,12(sp)
80007630:	00812403          	lw	s0,8(sp)
80007634:	00412483          	lw	s1,4(sp)
80007638:	01010113          	addi	sp,sp,16
8000763c:	00008067          	ret

80007640 <netif_find>:
80007640:	00051663          	bnez	a0,8000764c <netif_find+0xc>
80007644:	00000513          	li	a0,0
80007648:	00008067          	ret
8000764c:	ff010113          	addi	sp,sp,-16
80007650:	00812423          	sw	s0,8(sp)
80007654:	00050413          	mv	s0,a0
80007658:	00250513          	addi	a0,a0,2
8000765c:	00112623          	sw	ra,12(sp)
80007660:	42d060ef          	jal	ra,8000e28c <atoi>
80007664:	0ff57793          	andi	a5,a0,255
80007668:	8f41a503          	lw	a0,-1804(gp) # 80003364 <netif_list>
8000766c:	00051c63          	bnez	a0,80007684 <netif_find+0x44>
80007670:	00000513          	li	a0,0
80007674:	00c12083          	lw	ra,12(sp)
80007678:	00812403          	lw	s0,8(sp)
8000767c:	01010113          	addi	sp,sp,16
80007680:	00008067          	ret
80007684:	03854703          	lbu	a4,56(a0)
80007688:	00f71e63          	bne	a4,a5,800076a4 <netif_find+0x64>
8000768c:	00044683          	lbu	a3,0(s0)
80007690:	03654703          	lbu	a4,54(a0)
80007694:	00e69863          	bne	a3,a4,800076a4 <netif_find+0x64>
80007698:	00144683          	lbu	a3,1(s0)
8000769c:	03754703          	lbu	a4,55(a0)
800076a0:	fce68ae3          	beq	a3,a4,80007674 <netif_find+0x34>
800076a4:	00052503          	lw	a0,0(a0)
800076a8:	fc5ff06f          	j	8000766c <netif_find+0x2c>

800076ac <netif_name_to_index>:
800076ac:	ff010113          	addi	sp,sp,-16
800076b0:	00112623          	sw	ra,12(sp)
800076b4:	f8dff0ef          	jal	ra,80007640 <netif_find>
800076b8:	00050e63          	beqz	a0,800076d4 <netif_name_to_index+0x28>
800076bc:	03854503          	lbu	a0,56(a0)
800076c0:	00150513          	addi	a0,a0,1
800076c4:	0ff57513          	andi	a0,a0,255
800076c8:	00c12083          	lw	ra,12(sp)
800076cc:	01010113          	addi	sp,sp,16
800076d0:	00008067          	ret
800076d4:	00000513          	li	a0,0
800076d8:	ff1ff06f          	j	800076c8 <netif_name_to_index+0x1c>

800076dc <pbuf_skip_const>:
800076dc:	00050663          	beqz	a0,800076e8 <pbuf_skip_const+0xc>
800076e0:	00a55783          	lhu	a5,10(a0)
800076e4:	00f5f863          	bgeu	a1,a5,800076f4 <pbuf_skip_const+0x18>
800076e8:	00060463          	beqz	a2,800076f0 <pbuf_skip_const+0x14>
800076ec:	00b61023          	sh	a1,0(a2)
800076f0:	00008067          	ret
800076f4:	40f585b3          	sub	a1,a1,a5
800076f8:	01059593          	slli	a1,a1,0x10
800076fc:	0105d593          	srli	a1,a1,0x10
80007700:	00052503          	lw	a0,0(a0)
80007704:	fd9ff06f          	j	800076dc <pbuf_skip_const>

80007708 <pbuf_add_header_impl>:
80007708:	00050793          	mv	a5,a0
8000770c:	08050263          	beqz	a0,80007790 <pbuf_add_header_impl+0x88>
80007710:	00010737          	lui	a4,0x10
80007714:	00100513          	li	a0,1
80007718:	06e5fe63          	bgeu	a1,a4,80007794 <pbuf_add_header_impl+0x8c>
8000771c:	00000513          	li	a0,0
80007720:	06058a63          	beqz	a1,80007794 <pbuf_add_header_impl+0x8c>
80007724:	0087d703          	lhu	a4,8(a5)
80007728:	01059693          	slli	a3,a1,0x10
8000772c:	0106d693          	srli	a3,a3,0x10
80007730:	00e68733          	add	a4,a3,a4
80007734:	01071713          	slli	a4,a4,0x10
80007738:	01075713          	srli	a4,a4,0x10
8000773c:	00100513          	li	a0,1
80007740:	04d76a63          	bltu	a4,a3,80007794 <pbuf_add_header_impl+0x8c>
80007744:	00c78503          	lb	a0,12(a5)
80007748:	00055e63          	bgez	a0,80007764 <pbuf_add_header_impl+0x5c>
8000774c:	0047a603          	lw	a2,4(a5)
80007750:	00100513          	li	a0,1
80007754:	40b605b3          	sub	a1,a2,a1
80007758:	01078613          	addi	a2,a5,16
8000775c:	00c5fc63          	bgeu	a1,a2,80007774 <pbuf_add_header_impl+0x6c>
80007760:	00008067          	ret
80007764:	00100513          	li	a0,1
80007768:	02060663          	beqz	a2,80007794 <pbuf_add_header_impl+0x8c>
8000776c:	0047a603          	lw	a2,4(a5)
80007770:	40b605b3          	sub	a1,a2,a1
80007774:	00a7d603          	lhu	a2,10(a5)
80007778:	00b7a223          	sw	a1,4(a5)
8000777c:	00e79423          	sh	a4,8(a5)
80007780:	00c686b3          	add	a3,a3,a2
80007784:	00d79523          	sh	a3,10(a5)
80007788:	00000513          	li	a0,0
8000778c:	00008067          	ret
80007790:	00100513          	li	a0,1
80007794:	00008067          	ret

80007798 <pbuf_alloc_reference>:
80007798:	ff010113          	addi	sp,sp,-16
8000779c:	00812423          	sw	s0,8(sp)
800077a0:	00058413          	mv	s0,a1
800077a4:	800035b7          	lui	a1,0x80003
800077a8:	00912223          	sw	s1,4(sp)
800077ac:	01212023          	sw	s2,0(sp)
800077b0:	00060493          	mv	s1,a2
800077b4:	00050913          	mv	s2,a0
800077b8:	14c00613          	li	a2,332
800077bc:	eac58593          	addi	a1,a1,-340 # 80002eac <_ram_heap_end+0xfffeaeac>
800077c0:	00400513          	li	a0,4
800077c4:	00112623          	sw	ra,12(sp)
800077c8:	841ff0ef          	jal	ra,80007008 <memp_malloc_fn>
800077cc:	02050263          	beqz	a0,800077f0 <pbuf_alloc_reference+0x58>
800077d0:	00100793          	li	a5,1
800077d4:	00052023          	sw	zero,0(a0)
800077d8:	01252223          	sw	s2,4(a0)
800077dc:	00851423          	sh	s0,8(a0)
800077e0:	00851523          	sh	s0,10(a0)
800077e4:	00950623          	sb	s1,12(a0)
800077e8:	000506a3          	sb	zero,13(a0)
800077ec:	00f51723          	sh	a5,14(a0)
800077f0:	00c12083          	lw	ra,12(sp)
800077f4:	00812403          	lw	s0,8(sp)
800077f8:	00412483          	lw	s1,4(sp)
800077fc:	00012903          	lw	s2,0(sp)
80007800:	01010113          	addi	sp,sp,16
80007804:	00008067          	ret

80007808 <pbuf_alloced_custom>:
80007808:	01051513          	slli	a0,a0,0x10
8000780c:	01055513          	srli	a0,a0,0x10
80007810:	00350513          	addi	a0,a0,3
80007814:	ffc57513          	andi	a0,a0,-4
80007818:	00a58833          	add	a6,a1,a0
8000781c:	0307ec63          	bltu	a5,a6,80007854 <pbuf_alloced_custom+0x4c>
80007820:	00070463          	beqz	a4,80007828 <pbuf_alloced_custom+0x20>
80007824:	00a70733          	add	a4,a4,a0
80007828:	00200793          	li	a5,2
8000782c:	00f686a3          	sb	a5,13(a3)
80007830:	00100793          	li	a5,1
80007834:	00068513          	mv	a0,a3
80007838:	0006a023          	sw	zero,0(a3)
8000783c:	00e6a223          	sw	a4,4(a3)
80007840:	00b69423          	sh	a1,8(a3)
80007844:	00b69523          	sh	a1,10(a3)
80007848:	00c68623          	sb	a2,12(a3)
8000784c:	00f69723          	sh	a5,14(a3)
80007850:	00008067          	ret
80007854:	00000513          	li	a0,0
80007858:	00008067          	ret

8000785c <pbuf_add_header>:
8000785c:	00000613          	li	a2,0
80007860:	ea9ff06f          	j	80007708 <pbuf_add_header_impl>

80007864 <pbuf_add_header_force>:
80007864:	00100613          	li	a2,1
80007868:	ea1ff06f          	j	80007708 <pbuf_add_header_impl>

8000786c <pbuf_remove_header>:
8000786c:	00050793          	mv	a5,a0
80007870:	04050a63          	beqz	a0,800078c4 <pbuf_remove_header+0x58>
80007874:	00010737          	lui	a4,0x10
80007878:	00100513          	li	a0,1
8000787c:	04e5f663          	bgeu	a1,a4,800078c8 <pbuf_remove_header+0x5c>
80007880:	00000513          	li	a0,0
80007884:	04058263          	beqz	a1,800078c8 <pbuf_remove_header+0x5c>
80007888:	00a7d703          	lhu	a4,10(a5)
8000788c:	01059693          	slli	a3,a1,0x10
80007890:	0106d693          	srli	a3,a3,0x10
80007894:	00100513          	li	a0,1
80007898:	02d76863          	bltu	a4,a3,800078c8 <pbuf_remove_header+0x5c>
8000789c:	40d70733          	sub	a4,a4,a3
800078a0:	0047a603          	lw	a2,4(a5)
800078a4:	00e79523          	sh	a4,10(a5)
800078a8:	0087d703          	lhu	a4,8(a5)
800078ac:	00b605b3          	add	a1,a2,a1
800078b0:	00b7a223          	sw	a1,4(a5)
800078b4:	40d70733          	sub	a4,a4,a3
800078b8:	00e79423          	sh	a4,8(a5)
800078bc:	00000513          	li	a0,0
800078c0:	00008067          	ret
800078c4:	00100513          	li	a0,1
800078c8:	00008067          	ret

800078cc <pbuf_header>:
800078cc:	0005d663          	bgez	a1,800078d8 <pbuf_header+0xc>
800078d0:	40b005b3          	neg	a1,a1
800078d4:	f99ff06f          	j	8000786c <pbuf_remove_header>
800078d8:	00000613          	li	a2,0
800078dc:	e2dff06f          	j	80007708 <pbuf_add_header_impl>

800078e0 <pbuf_header_force>:
800078e0:	0005d663          	bgez	a1,800078ec <pbuf_header_force+0xc>
800078e4:	40b005b3          	neg	a1,a1
800078e8:	f85ff06f          	j	8000786c <pbuf_remove_header>
800078ec:	00100613          	li	a2,1
800078f0:	e19ff06f          	j	80007708 <pbuf_add_header_impl>

800078f4 <pbuf_free>:
800078f4:	fd010113          	addi	sp,sp,-48
800078f8:	02812423          	sw	s0,40(sp)
800078fc:	02112623          	sw	ra,44(sp)
80007900:	02912223          	sw	s1,36(sp)
80007904:	03212023          	sw	s2,32(sp)
80007908:	01312e23          	sw	s3,28(sp)
8000790c:	00000413          	li	s0,0
80007910:	06050463          	beqz	a0,80007978 <pbuf_free+0x84>
80007914:	00050593          	mv	a1,a0
80007918:	00000413          	li	s0,0
8000791c:	00200913          	li	s2,2
80007920:	00100993          	li	s3,1
80007924:	00b12623          	sw	a1,12(sp)
80007928:	959fd0ef          	jal	ra,80005280 <sys_arch_protect>
8000792c:	00c12583          	lw	a1,12(sp)
80007930:	00e5c483          	lbu	s1,14(a1)
80007934:	fff48493          	addi	s1,s1,-1
80007938:	0ff4f493          	andi	s1,s1,255
8000793c:	00958723          	sb	s1,14(a1)
80007940:	945fd0ef          	jal	ra,80005284 <sys_arch_unprotect>
80007944:	02049a63          	bnez	s1,80007978 <pbuf_free+0x84>
80007948:	00c12583          	lw	a1,12(sp)
8000794c:	00d5c783          	lbu	a5,13(a1)
80007950:	0005a483          	lw	s1,0(a1)
80007954:	0027f793          	andi	a5,a5,2
80007958:	04078063          	beqz	a5,80007998 <pbuf_free+0xa4>
8000795c:	0105a783          	lw	a5,16(a1)
80007960:	00058513          	mv	a0,a1
80007964:	000780e7          	jalr	a5
80007968:	00140413          	addi	s0,s0,1
8000796c:	0ff47413          	andi	s0,s0,255
80007970:	00048593          	mv	a1,s1
80007974:	fa0498e3          	bnez	s1,80007924 <pbuf_free+0x30>
80007978:	00040513          	mv	a0,s0
8000797c:	02c12083          	lw	ra,44(sp)
80007980:	02812403          	lw	s0,40(sp)
80007984:	02412483          	lw	s1,36(sp)
80007988:	02012903          	lw	s2,32(sp)
8000798c:	01c12983          	lw	s3,28(sp)
80007990:	03010113          	addi	sp,sp,48
80007994:	00008067          	ret
80007998:	00c5c783          	lbu	a5,12(a1)
8000799c:	00500513          	li	a0,5
800079a0:	00f7f793          	andi	a5,a5,15
800079a4:	01278663          	beq	a5,s2,800079b0 <pbuf_free+0xbc>
800079a8:	01379863          	bne	a5,s3,800079b8 <pbuf_free+0xc4>
800079ac:	00400513          	li	a0,4
800079b0:	e90ff0ef          	jal	ra,80007040 <memp_free>
800079b4:	fb5ff06f          	j	80007968 <pbuf_free+0x74>
800079b8:	fa0798e3          	bnez	a5,80007968 <pbuf_free+0x74>
800079bc:	00058513          	mv	a0,a1
800079c0:	d44ff0ef          	jal	ra,80006f04 <lwip_free>
800079c4:	fa5ff06f          	j	80007968 <pbuf_free+0x74>

800079c8 <pbuf_alloc>:
800079c8:	fe010113          	addi	sp,sp,-32
800079cc:	01212823          	sw	s2,16(sp)
800079d0:	00112e23          	sw	ra,28(sp)
800079d4:	00812c23          	sw	s0,24(sp)
800079d8:	00912a23          	sw	s1,20(sp)
800079dc:	01312623          	sw	s3,12(sp)
800079e0:	01412423          	sw	s4,8(sp)
800079e4:	01512223          	sw	s5,4(sp)
800079e8:	01612023          	sw	s6,0(sp)
800079ec:	04100793          	li	a5,65
800079f0:	00058913          	mv	s2,a1
800079f4:	0cf60263          	beq	a2,a5,80007ab8 <pbuf_alloc+0xf0>
800079f8:	02c7ee63          	bltu	a5,a2,80007a34 <pbuf_alloc+0x6c>
800079fc:	00100793          	li	a5,1
80007a00:	0af60c63          	beq	a2,a5,80007ab8 <pbuf_alloc+0xf0>
80007a04:	00000493          	li	s1,0
80007a08:	01c12083          	lw	ra,28(sp)
80007a0c:	01812403          	lw	s0,24(sp)
80007a10:	00048513          	mv	a0,s1
80007a14:	01012903          	lw	s2,16(sp)
80007a18:	01412483          	lw	s1,20(sp)
80007a1c:	00c12983          	lw	s3,12(sp)
80007a20:	00812a03          	lw	s4,8(sp)
80007a24:	00412a83          	lw	s5,4(sp)
80007a28:	00012b03          	lw	s6,0(sp)
80007a2c:	02010113          	addi	sp,sp,32
80007a30:	00008067          	ret
80007a34:	01051413          	slli	s0,a0,0x10
80007a38:	18200793          	li	a5,386
80007a3c:	01045413          	srli	s0,s0,0x10
80007a40:	0af60463          	beq	a2,a5,80007ae8 <pbuf_alloc+0x120>
80007a44:	28000793          	li	a5,640
80007a48:	faf61ee3          	bne	a2,a5,80007a04 <pbuf_alloc+0x3c>
80007a4c:	00340413          	addi	s0,s0,3
80007a50:	00358793          	addi	a5,a1,3
80007a54:	ffc47413          	andi	s0,s0,-4
80007a58:	ffc7f793          	andi	a5,a5,-4
80007a5c:	00f40433          	add	s0,s0,a5
80007a60:	01041413          	slli	s0,s0,0x10
80007a64:	01045413          	srli	s0,s0,0x10
80007a68:	00050993          	mv	s3,a0
80007a6c:	01040513          	addi	a0,s0,16
80007a70:	f8f46ae3          	bltu	s0,a5,80007a04 <pbuf_alloc+0x3c>
80007a74:	f8f568e3          	bltu	a0,a5,80007a04 <pbuf_alloc+0x3c>
80007a78:	c58ff0ef          	jal	ra,80006ed0 <lwip_malloc>
80007a7c:	00050493          	mv	s1,a0
80007a80:	f80504e3          	beqz	a0,80007a08 <pbuf_alloc+0x40>
80007a84:	01099993          	slli	s3,s3,0x10
80007a88:	0109d993          	srli	s3,s3,0x10
80007a8c:	013509b3          	add	s3,a0,s3
80007a90:	01398993          	addi	s3,s3,19
80007a94:	000107b7          	lui	a5,0x10
80007a98:	ffc9f993          	andi	s3,s3,-4
80007a9c:	08078793          	addi	a5,a5,128 # 10080 <_stack_size+0xf080>
80007aa0:	00052023          	sw	zero,0(a0)
80007aa4:	01352223          	sw	s3,4(a0)
80007aa8:	01251423          	sh	s2,8(a0)
80007aac:	01251523          	sh	s2,10(a0)
80007ab0:	00f52623          	sw	a5,12(a0)
80007ab4:	f55ff06f          	j	80007a08 <pbuf_alloc+0x40>
80007ab8:	01812403          	lw	s0,24(sp)
80007abc:	01c12083          	lw	ra,28(sp)
80007ac0:	01412483          	lw	s1,20(sp)
80007ac4:	00c12983          	lw	s3,12(sp)
80007ac8:	00812a03          	lw	s4,8(sp)
80007acc:	00412a83          	lw	s5,4(sp)
80007ad0:	00012b03          	lw	s6,0(sp)
80007ad4:	00090593          	mv	a1,s2
80007ad8:	01012903          	lw	s2,16(sp)
80007adc:	00000513          	li	a0,0
80007ae0:	02010113          	addi	sp,sp,32
80007ae4:	cb5ff06f          	j	80007798 <pbuf_alloc_reference>
80007ae8:	000109b7          	lui	s3,0x10
80007aec:	00000a13          	li	s4,0
80007af0:	00000493          	li	s1,0
80007af4:	80003ab7          	lui	s5,0x80003
80007af8:	5ec00b13          	li	s6,1516
80007afc:	08298993          	addi	s3,s3,130 # 10082 <_stack_size+0xf082>
80007b00:	0f300613          	li	a2,243
80007b04:	eaca8593          	addi	a1,s5,-340 # 80002eac <_ram_heap_end+0xfffeaeac>
80007b08:	00500513          	li	a0,5
80007b0c:	cfcff0ef          	jal	ra,80007008 <memp_malloc_fn>
80007b10:	00051a63          	bnez	a0,80007b24 <pbuf_alloc+0x15c>
80007b14:	ee0488e3          	beqz	s1,80007a04 <pbuf_alloc+0x3c>
80007b18:	00048513          	mv	a0,s1
80007b1c:	dd9ff0ef          	jal	ra,800078f4 <pbuf_free>
80007b20:	ee5ff06f          	j	80007a04 <pbuf_alloc+0x3c>
80007b24:	00340793          	addi	a5,s0,3
80007b28:	ffc7f793          	andi	a5,a5,-4
80007b2c:	40fb07b3          	sub	a5,s6,a5
80007b30:	00078713          	mv	a4,a5
80007b34:	01079793          	slli	a5,a5,0x10
80007b38:	0107d793          	srli	a5,a5,0x10
80007b3c:	00f97463          	bgeu	s2,a5,80007b44 <pbuf_alloc+0x17c>
80007b40:	00090713          	mv	a4,s2
80007b44:	00850433          	add	s0,a0,s0
80007b48:	01340413          	addi	s0,s0,19
80007b4c:	ffc47413          	andi	s0,s0,-4
80007b50:	01071793          	slli	a5,a4,0x10
80007b54:	00052023          	sw	zero,0(a0)
80007b58:	00852223          	sw	s0,4(a0)
80007b5c:	01251423          	sh	s2,8(a0)
80007b60:	00e51523          	sh	a4,10(a0)
80007b64:	01352623          	sw	s3,12(a0)
80007b68:	0107d793          	srli	a5,a5,0x10
80007b6c:	02048263          	beqz	s1,80007b90 <pbuf_alloc+0x1c8>
80007b70:	00aa2023          	sw	a0,0(s4)
80007b74:	40f90933          	sub	s2,s2,a5
80007b78:	01091913          	slli	s2,s2,0x10
80007b7c:	01095913          	srli	s2,s2,0x10
80007b80:	00000413          	li	s0,0
80007b84:	00050a13          	mv	s4,a0
80007b88:	f6091ce3          	bnez	s2,80007b00 <pbuf_alloc+0x138>
80007b8c:	e7dff06f          	j	80007a08 <pbuf_alloc+0x40>
80007b90:	00050493          	mv	s1,a0
80007b94:	fe1ff06f          	j	80007b74 <pbuf_alloc+0x1ac>

80007b98 <pbuf_realloc>:
80007b98:	00855783          	lhu	a5,8(a0)
80007b9c:	0af5f463          	bgeu	a1,a5,80007c44 <pbuf_realloc+0xac>
80007ba0:	ff010113          	addi	sp,sp,-16
80007ba4:	00812423          	sw	s0,8(sp)
80007ba8:	00912223          	sw	s1,4(sp)
80007bac:	00112623          	sw	ra,12(sp)
80007bb0:	00050413          	mv	s0,a0
80007bb4:	00058493          	mv	s1,a1
80007bb8:	40f587b3          	sub	a5,a1,a5
80007bbc:	00a45583          	lhu	a1,10(s0)
80007bc0:	0695e263          	bltu	a1,s1,80007c24 <pbuf_realloc+0x8c>
80007bc4:	00c44783          	lbu	a5,12(s0)
80007bc8:	00f7f793          	andi	a5,a5,15
80007bcc:	02079663          	bnez	a5,80007bf8 <pbuf_realloc+0x60>
80007bd0:	02958463          	beq	a1,s1,80007bf8 <pbuf_realloc+0x60>
80007bd4:	00d44783          	lbu	a5,13(s0)
80007bd8:	0027f793          	andi	a5,a5,2
80007bdc:	00079e63          	bnez	a5,80007bf8 <pbuf_realloc+0x60>
80007be0:	00442583          	lw	a1,4(s0)
80007be4:	00040513          	mv	a0,s0
80007be8:	408585b3          	sub	a1,a1,s0
80007bec:	009585b3          	add	a1,a1,s1
80007bf0:	adcff0ef          	jal	ra,80006ecc <mem_trim>
80007bf4:	00050413          	mv	s0,a0
80007bf8:	00042503          	lw	a0,0(s0)
80007bfc:	00941523          	sh	s1,10(s0)
80007c00:	00941423          	sh	s1,8(s0)
80007c04:	00050463          	beqz	a0,80007c0c <pbuf_realloc+0x74>
80007c08:	cedff0ef          	jal	ra,800078f4 <pbuf_free>
80007c0c:	00042023          	sw	zero,0(s0)
80007c10:	00c12083          	lw	ra,12(sp)
80007c14:	00812403          	lw	s0,8(sp)
80007c18:	00412483          	lw	s1,4(sp)
80007c1c:	01010113          	addi	sp,sp,16
80007c20:	00008067          	ret
80007c24:	00845703          	lhu	a4,8(s0)
80007c28:	40b484b3          	sub	s1,s1,a1
80007c2c:	01049493          	slli	s1,s1,0x10
80007c30:	00e78733          	add	a4,a5,a4
80007c34:	00e41423          	sh	a4,8(s0)
80007c38:	0104d493          	srli	s1,s1,0x10
80007c3c:	00042403          	lw	s0,0(s0)
80007c40:	f7dff06f          	j	80007bbc <pbuf_realloc+0x24>
80007c44:	00008067          	ret

80007c48 <pbuf_free_header>:
80007c48:	fe010113          	addi	sp,sp,-32
80007c4c:	00812c23          	sw	s0,24(sp)
80007c50:	00112e23          	sw	ra,28(sp)
80007c54:	00912a23          	sw	s1,20(sp)
80007c58:	00050413          	mv	s0,a0
80007c5c:	04058263          	beqz	a1,80007ca0 <pbuf_free_header+0x58>
80007c60:	04040063          	beqz	s0,80007ca0 <pbuf_free_header+0x58>
80007c64:	00a45783          	lhu	a5,10(s0)
80007c68:	02f5e863          	bltu	a1,a5,80007c98 <pbuf_free_header+0x50>
80007c6c:	40f585b3          	sub	a1,a1,a5
80007c70:	00042483          	lw	s1,0(s0)
80007c74:	01059593          	slli	a1,a1,0x10
80007c78:	0105d593          	srli	a1,a1,0x10
80007c7c:	00042023          	sw	zero,0(s0)
80007c80:	00040513          	mv	a0,s0
80007c84:	00b12623          	sw	a1,12(sp)
80007c88:	c6dff0ef          	jal	ra,800078f4 <pbuf_free>
80007c8c:	00048413          	mv	s0,s1
80007c90:	00c12583          	lw	a1,12(sp)
80007c94:	fc9ff06f          	j	80007c5c <pbuf_free_header+0x14>
80007c98:	00040513          	mv	a0,s0
80007c9c:	bd1ff0ef          	jal	ra,8000786c <pbuf_remove_header>
80007ca0:	00040513          	mv	a0,s0
80007ca4:	01c12083          	lw	ra,28(sp)
80007ca8:	01812403          	lw	s0,24(sp)
80007cac:	01412483          	lw	s1,20(sp)
80007cb0:	02010113          	addi	sp,sp,32
80007cb4:	00008067          	ret

80007cb8 <pbuf_clen>:
80007cb8:	00000793          	li	a5,0
80007cbc:	00051663          	bnez	a0,80007cc8 <pbuf_clen+0x10>
80007cc0:	00078513          	mv	a0,a5
80007cc4:	00008067          	ret
80007cc8:	00178793          	addi	a5,a5,1
80007ccc:	01079793          	slli	a5,a5,0x10
80007cd0:	0107d793          	srli	a5,a5,0x10
80007cd4:	00052503          	lw	a0,0(a0)
80007cd8:	fe5ff06f          	j	80007cbc <pbuf_clen+0x4>

80007cdc <pbuf_ref>:
80007cdc:	02050a63          	beqz	a0,80007d10 <pbuf_ref+0x34>
80007ce0:	ff010113          	addi	sp,sp,-16
80007ce4:	00812423          	sw	s0,8(sp)
80007ce8:	00112623          	sw	ra,12(sp)
80007cec:	00050413          	mv	s0,a0
80007cf0:	d90fd0ef          	jal	ra,80005280 <sys_arch_protect>
80007cf4:	00e44783          	lbu	a5,14(s0)
80007cf8:	00178793          	addi	a5,a5,1
80007cfc:	00f40723          	sb	a5,14(s0)
80007d00:	00812403          	lw	s0,8(sp)
80007d04:	00c12083          	lw	ra,12(sp)
80007d08:	01010113          	addi	sp,sp,16
80007d0c:	d78fd06f          	j	80005284 <sys_arch_unprotect>
80007d10:	00008067          	ret

80007d14 <pbuf_cat>:
80007d14:	02050a63          	beqz	a0,80007d48 <pbuf_cat+0x34>
80007d18:	00059663          	bnez	a1,80007d24 <pbuf_cat+0x10>
80007d1c:	00008067          	ret
80007d20:	00070513          	mv	a0,a4
80007d24:	00855783          	lhu	a5,8(a0)
80007d28:	0085d683          	lhu	a3,8(a1)
80007d2c:	00052703          	lw	a4,0(a0)
80007d30:	00d787b3          	add	a5,a5,a3
80007d34:	01079793          	slli	a5,a5,0x10
80007d38:	0107d793          	srli	a5,a5,0x10
80007d3c:	00f51423          	sh	a5,8(a0)
80007d40:	fe0710e3          	bnez	a4,80007d20 <pbuf_cat+0xc>
80007d44:	00b52023          	sw	a1,0(a0)
80007d48:	00008067          	ret

80007d4c <pbuf_chain>:
80007d4c:	ff010113          	addi	sp,sp,-16
80007d50:	00812423          	sw	s0,8(sp)
80007d54:	00112623          	sw	ra,12(sp)
80007d58:	00058413          	mv	s0,a1
80007d5c:	fb9ff0ef          	jal	ra,80007d14 <pbuf_cat>
80007d60:	00040513          	mv	a0,s0
80007d64:	00812403          	lw	s0,8(sp)
80007d68:	00c12083          	lw	ra,12(sp)
80007d6c:	01010113          	addi	sp,sp,16
80007d70:	f6dff06f          	j	80007cdc <pbuf_ref>

80007d74 <pbuf_dechain>:
80007d74:	ff010113          	addi	sp,sp,-16
80007d78:	00112623          	sw	ra,12(sp)
80007d7c:	00812423          	sw	s0,8(sp)
80007d80:	00052403          	lw	s0,0(a0)
80007d84:	02040663          	beqz	s0,80007db0 <pbuf_dechain+0x3c>
80007d88:	00855783          	lhu	a5,8(a0)
80007d8c:	00a55703          	lhu	a4,10(a0)
80007d90:	40e787b3          	sub	a5,a5,a4
80007d94:	00f41423          	sh	a5,8(s0)
80007d98:	00a55783          	lhu	a5,10(a0)
80007d9c:	00052023          	sw	zero,0(a0)
80007da0:	00f51423          	sh	a5,8(a0)
80007da4:	00040513          	mv	a0,s0
80007da8:	b4dff0ef          	jal	ra,800078f4 <pbuf_free>
80007dac:	00050463          	beqz	a0,80007db4 <pbuf_dechain+0x40>
80007db0:	00000413          	li	s0,0
80007db4:	00040513          	mv	a0,s0
80007db8:	00c12083          	lw	ra,12(sp)
80007dbc:	00812403          	lw	s0,8(sp)
80007dc0:	01010113          	addi	sp,sp,16
80007dc4:	00008067          	ret

80007dc8 <pbuf_copy>:
80007dc8:	10050463          	beqz	a0,80007ed0 <pbuf_copy+0x108>
80007dcc:	fe010113          	addi	sp,sp,-32
80007dd0:	00812c23          	sw	s0,24(sp)
80007dd4:	00112e23          	sw	ra,28(sp)
80007dd8:	00912a23          	sw	s1,20(sp)
80007ddc:	01212823          	sw	s2,16(sp)
80007de0:	01312623          	sw	s3,12(sp)
80007de4:	01412423          	sw	s4,8(sp)
80007de8:	00058413          	mv	s0,a1
80007dec:	06058e63          	beqz	a1,80007e68 <pbuf_copy+0xa0>
80007df0:	00855703          	lhu	a4,8(a0)
80007df4:	0085d783          	lhu	a5,8(a1)
80007df8:	00050493          	mv	s1,a0
80007dfc:	06f76663          	bltu	a4,a5,80007e68 <pbuf_copy+0xa0>
80007e00:	00000a13          	li	s4,0
80007e04:	00000993          	li	s3,0
80007e08:	00a4d903          	lhu	s2,10(s1)
80007e0c:	00a45783          	lhu	a5,10(s0)
80007e10:	41390933          	sub	s2,s2,s3
80007e14:	414787b3          	sub	a5,a5,s4
80007e18:	0127f463          	bgeu	a5,s2,80007e20 <pbuf_copy+0x58>
80007e1c:	00078913          	mv	s2,a5
80007e20:	0044a503          	lw	a0,4(s1)
80007e24:	00442583          	lw	a1,4(s0)
80007e28:	00090613          	mv	a2,s2
80007e2c:	01350533          	add	a0,a0,s3
80007e30:	014585b3          	add	a1,a1,s4
80007e34:	4d5060ef          	jal	ra,8000eb08 <memcpy>
80007e38:	00a45703          	lhu	a4,10(s0)
80007e3c:	012a0a33          	add	s4,s4,s2
80007e40:	012989b3          	add	s3,s3,s2
80007e44:	00a4d783          	lhu	a5,10(s1)
80007e48:	00ea6663          	bltu	s4,a4,80007e54 <pbuf_copy+0x8c>
80007e4c:	00042403          	lw	s0,0(s0)
80007e50:	00000a13          	li	s4,0
80007e54:	02f99e63          	bne	s3,a5,80007e90 <pbuf_copy+0xc8>
80007e58:	0004a483          	lw	s1,0(s1)
80007e5c:	02049863          	bnez	s1,80007e8c <pbuf_copy+0xc4>
80007e60:	00000513          	li	a0,0
80007e64:	00040463          	beqz	s0,80007e6c <pbuf_copy+0xa4>
80007e68:	ff000513          	li	a0,-16
80007e6c:	01c12083          	lw	ra,28(sp)
80007e70:	01812403          	lw	s0,24(sp)
80007e74:	01412483          	lw	s1,20(sp)
80007e78:	01012903          	lw	s2,16(sp)
80007e7c:	00c12983          	lw	s3,12(sp)
80007e80:	00812a03          	lw	s4,8(sp)
80007e84:	02010113          	addi	sp,sp,32
80007e88:	00008067          	ret
80007e8c:	00000993          	li	s3,0
80007e90:	00040c63          	beqz	s0,80007ea8 <pbuf_copy+0xe0>
80007e94:	00a45703          	lhu	a4,10(s0)
80007e98:	00845783          	lhu	a5,8(s0)
80007e9c:	00f71663          	bne	a4,a5,80007ea8 <pbuf_copy+0xe0>
80007ea0:	00042783          	lw	a5,0(s0)
80007ea4:	02079263          	bnez	a5,80007ec8 <pbuf_copy+0x100>
80007ea8:	00a4d703          	lhu	a4,10(s1)
80007eac:	0084d783          	lhu	a5,8(s1)
80007eb0:	00f71663          	bne	a4,a5,80007ebc <pbuf_copy+0xf4>
80007eb4:	0004a783          	lw	a5,0(s1)
80007eb8:	00079863          	bnez	a5,80007ec8 <pbuf_copy+0x100>
80007ebc:	f40416e3          	bnez	s0,80007e08 <pbuf_copy+0x40>
80007ec0:	00000513          	li	a0,0
80007ec4:	fa9ff06f          	j	80007e6c <pbuf_copy+0xa4>
80007ec8:	ffa00513          	li	a0,-6
80007ecc:	fa1ff06f          	j	80007e6c <pbuf_copy+0xa4>
80007ed0:	ff000513          	li	a0,-16
80007ed4:	00008067          	ret

80007ed8 <pbuf_copy_partial>:
80007ed8:	fe010113          	addi	sp,sp,-32
80007edc:	00812c23          	sw	s0,24(sp)
80007ee0:	00112e23          	sw	ra,28(sp)
80007ee4:	00912a23          	sw	s1,20(sp)
80007ee8:	01212823          	sw	s2,16(sp)
80007eec:	01312623          	sw	s3,12(sp)
80007ef0:	01412423          	sw	s4,8(sp)
80007ef4:	00000413          	li	s0,0
80007ef8:	02050063          	beqz	a0,80007f18 <pbuf_copy_partial+0x40>
80007efc:	00058a13          	mv	s4,a1
80007f00:	00000413          	li	s0,0
80007f04:	00058a63          	beqz	a1,80007f18 <pbuf_copy_partial+0x40>
80007f08:	00050913          	mv	s2,a0
80007f0c:	00060493          	mv	s1,a2
80007f10:	00048463          	beqz	s1,80007f18 <pbuf_copy_partial+0x40>
80007f14:	02091463          	bnez	s2,80007f3c <pbuf_copy_partial+0x64>
80007f18:	00040513          	mv	a0,s0
80007f1c:	01c12083          	lw	ra,28(sp)
80007f20:	01812403          	lw	s0,24(sp)
80007f24:	01412483          	lw	s1,20(sp)
80007f28:	01012903          	lw	s2,16(sp)
80007f2c:	00c12983          	lw	s3,12(sp)
80007f30:	00812a03          	lw	s4,8(sp)
80007f34:	02010113          	addi	sp,sp,32
80007f38:	00008067          	ret
80007f3c:	00a95583          	lhu	a1,10(s2)
80007f40:	00068e63          	beqz	a3,80007f5c <pbuf_copy_partial+0x84>
80007f44:	00b6ec63          	bltu	a3,a1,80007f5c <pbuf_copy_partial+0x84>
80007f48:	40b686b3          	sub	a3,a3,a1
80007f4c:	01069693          	slli	a3,a3,0x10
80007f50:	0106d693          	srli	a3,a3,0x10
80007f54:	00092903          	lw	s2,0(s2)
80007f58:	fb9ff06f          	j	80007f10 <pbuf_copy_partial+0x38>
80007f5c:	40d585b3          	sub	a1,a1,a3
80007f60:	01059593          	slli	a1,a1,0x10
80007f64:	0105d593          	srli	a1,a1,0x10
80007f68:	00058993          	mv	s3,a1
80007f6c:	00b4f463          	bgeu	s1,a1,80007f74 <pbuf_copy_partial+0x9c>
80007f70:	00048993          	mv	s3,s1
80007f74:	00492583          	lw	a1,4(s2)
80007f78:	01099993          	slli	s3,s3,0x10
80007f7c:	0109d993          	srli	s3,s3,0x10
80007f80:	00d585b3          	add	a1,a1,a3
80007f84:	008a0533          	add	a0,s4,s0
80007f88:	00098613          	mv	a2,s3
80007f8c:	01340433          	add	s0,s0,s3
80007f90:	413484b3          	sub	s1,s1,s3
80007f94:	375060ef          	jal	ra,8000eb08 <memcpy>
80007f98:	01041413          	slli	s0,s0,0x10
80007f9c:	01049493          	slli	s1,s1,0x10
80007fa0:	01045413          	srli	s0,s0,0x10
80007fa4:	0104d493          	srli	s1,s1,0x10
80007fa8:	00000693          	li	a3,0
80007fac:	fa9ff06f          	j	80007f54 <pbuf_copy_partial+0x7c>

80007fb0 <pbuf_get_contiguous>:
80007fb0:	fe010113          	addi	sp,sp,-32
80007fb4:	00112e23          	sw	ra,28(sp)
80007fb8:	00812c23          	sw	s0,24(sp)
80007fbc:	00912a23          	sw	s1,20(sp)
80007fc0:	02051063          	bnez	a0,80007fe0 <pbuf_get_contiguous+0x30>
80007fc4:	00000413          	li	s0,0
80007fc8:	00040513          	mv	a0,s0
80007fcc:	01c12083          	lw	ra,28(sp)
80007fd0:	01812403          	lw	s0,24(sp)
80007fd4:	01412483          	lw	s1,20(sp)
80007fd8:	02010113          	addi	sp,sp,32
80007fdc:	00008067          	ret
80007fe0:	00058413          	mv	s0,a1
80007fe4:	fe0580e3          	beqz	a1,80007fc4 <pbuf_get_contiguous+0x14>
80007fe8:	00068493          	mv	s1,a3
80007fec:	fcd66ce3          	bltu	a2,a3,80007fc4 <pbuf_get_contiguous+0x14>
80007ff0:	00e10613          	addi	a2,sp,14
80007ff4:	00070593          	mv	a1,a4
80007ff8:	ee4ff0ef          	jal	ra,800076dc <pbuf_skip_const>
80007ffc:	fc0504e3          	beqz	a0,80007fc4 <pbuf_get_contiguous+0x14>
80008000:	00e15683          	lhu	a3,14(sp)
80008004:	00a55603          	lhu	a2,10(a0)
80008008:	00968733          	add	a4,a3,s1
8000800c:	00e64863          	blt	a2,a4,8000801c <pbuf_get_contiguous+0x6c>
80008010:	00452403          	lw	s0,4(a0)
80008014:	00d40433          	add	s0,s0,a3
80008018:	fb1ff06f          	j	80007fc8 <pbuf_get_contiguous+0x18>
8000801c:	00048613          	mv	a2,s1
80008020:	00040593          	mv	a1,s0
80008024:	eb5ff0ef          	jal	ra,80007ed8 <pbuf_copy_partial>
80008028:	fa9500e3          	beq	a0,s1,80007fc8 <pbuf_get_contiguous+0x18>
8000802c:	f99ff06f          	j	80007fc4 <pbuf_get_contiguous+0x14>

80008030 <pbuf_skip>:
80008030:	eacff06f          	j	800076dc <pbuf_skip_const>

80008034 <pbuf_take>:
80008034:	08050c63          	beqz	a0,800080cc <pbuf_take+0x98>
80008038:	fe010113          	addi	sp,sp,-32
8000803c:	00912a23          	sw	s1,20(sp)
80008040:	01412423          	sw	s4,8(sp)
80008044:	00112e23          	sw	ra,28(sp)
80008048:	00812c23          	sw	s0,24(sp)
8000804c:	01212823          	sw	s2,16(sp)
80008050:	01312623          	sw	s3,12(sp)
80008054:	00050493          	mv	s1,a0
80008058:	00058a13          	mv	s4,a1
8000805c:	ff000513          	li	a0,-16
80008060:	00058c63          	beqz	a1,80008078 <pbuf_take+0x44>
80008064:	0084d783          	lhu	a5,8(s1)
80008068:	00060413          	mv	s0,a2
8000806c:	fff00513          	li	a0,-1
80008070:	00000993          	li	s3,0
80008074:	04c7f663          	bgeu	a5,a2,800080c0 <pbuf_take+0x8c>
80008078:	01c12083          	lw	ra,28(sp)
8000807c:	01812403          	lw	s0,24(sp)
80008080:	01412483          	lw	s1,20(sp)
80008084:	01012903          	lw	s2,16(sp)
80008088:	00c12983          	lw	s3,12(sp)
8000808c:	00812a03          	lw	s4,8(sp)
80008090:	02010113          	addi	sp,sp,32
80008094:	00008067          	ret
80008098:	00a4d903          	lhu	s2,10(s1)
8000809c:	01247463          	bgeu	s0,s2,800080a4 <pbuf_take+0x70>
800080a0:	00040913          	mv	s2,s0
800080a4:	0044a503          	lw	a0,4(s1)
800080a8:	013a05b3          	add	a1,s4,s3
800080ac:	00090613          	mv	a2,s2
800080b0:	259060ef          	jal	ra,8000eb08 <memcpy>
800080b4:	0004a483          	lw	s1,0(s1)
800080b8:	41240433          	sub	s0,s0,s2
800080bc:	012989b3          	add	s3,s3,s2
800080c0:	fc041ce3          	bnez	s0,80008098 <pbuf_take+0x64>
800080c4:	00000513          	li	a0,0
800080c8:	fb1ff06f          	j	80008078 <pbuf_take+0x44>
800080cc:	ff000513          	li	a0,-16
800080d0:	00008067          	ret

800080d4 <pbuf_take_at>:
800080d4:	fd010113          	addi	sp,sp,-48
800080d8:	02812423          	sw	s0,40(sp)
800080dc:	01312e23          	sw	s3,28(sp)
800080e0:	00060413          	mv	s0,a2
800080e4:	00058993          	mv	s3,a1
800080e8:	00e10613          	addi	a2,sp,14
800080ec:	00068593          	mv	a1,a3
800080f0:	02112623          	sw	ra,44(sp)
800080f4:	02912223          	sw	s1,36(sp)
800080f8:	03212023          	sw	s2,32(sp)
800080fc:	de0ff0ef          	jal	ra,800076dc <pbuf_skip_const>
80008100:	08050263          	beqz	a0,80008184 <pbuf_take_at+0xb0>
80008104:	00e15703          	lhu	a4,14(sp)
80008108:	00855683          	lhu	a3,8(a0)
8000810c:	00050493          	mv	s1,a0
80008110:	008707b3          	add	a5,a4,s0
80008114:	fff00513          	li	a0,-1
80008118:	04f6c863          	blt	a3,a5,80008168 <pbuf_take_at+0x94>
8000811c:	00a4d783          	lhu	a5,10(s1)
80008120:	00040913          	mv	s2,s0
80008124:	40e787b3          	sub	a5,a5,a4
80008128:	0087d663          	bge	a5,s0,80008134 <pbuf_take_at+0x60>
8000812c:	01079913          	slli	s2,a5,0x10
80008130:	01095913          	srli	s2,s2,0x10
80008134:	0044a503          	lw	a0,4(s1)
80008138:	00090613          	mv	a2,s2
8000813c:	00098593          	mv	a1,s3
80008140:	00e50533          	add	a0,a0,a4
80008144:	1c5060ef          	jal	ra,8000eb08 <memcpy>
80008148:	41240633          	sub	a2,s0,s2
8000814c:	01061613          	slli	a2,a2,0x10
80008150:	01065613          	srli	a2,a2,0x10
80008154:	00000513          	li	a0,0
80008158:	00060863          	beqz	a2,80008168 <pbuf_take_at+0x94>
8000815c:	0004a503          	lw	a0,0(s1)
80008160:	012985b3          	add	a1,s3,s2
80008164:	ed1ff0ef          	jal	ra,80008034 <pbuf_take>
80008168:	02c12083          	lw	ra,44(sp)
8000816c:	02812403          	lw	s0,40(sp)
80008170:	02412483          	lw	s1,36(sp)
80008174:	02012903          	lw	s2,32(sp)
80008178:	01c12983          	lw	s3,28(sp)
8000817c:	03010113          	addi	sp,sp,48
80008180:	00008067          	ret
80008184:	fff00513          	li	a0,-1
80008188:	fe1ff06f          	j	80008168 <pbuf_take_at+0x94>

8000818c <pbuf_clone>:
8000818c:	ff010113          	addi	sp,sp,-16
80008190:	00912223          	sw	s1,4(sp)
80008194:	00060493          	mv	s1,a2
80008198:	00058613          	mv	a2,a1
8000819c:	0084d583          	lhu	a1,8(s1)
800081a0:	00812423          	sw	s0,8(sp)
800081a4:	00112623          	sw	ra,12(sp)
800081a8:	821ff0ef          	jal	ra,800079c8 <pbuf_alloc>
800081ac:	00050413          	mv	s0,a0
800081b0:	00050663          	beqz	a0,800081bc <pbuf_clone+0x30>
800081b4:	00048593          	mv	a1,s1
800081b8:	c11ff0ef          	jal	ra,80007dc8 <pbuf_copy>
800081bc:	00040513          	mv	a0,s0
800081c0:	00c12083          	lw	ra,12(sp)
800081c4:	00812403          	lw	s0,8(sp)
800081c8:	00412483          	lw	s1,4(sp)
800081cc:	01010113          	addi	sp,sp,16
800081d0:	00008067          	ret

800081d4 <pbuf_coalesce>:
800081d4:	ff010113          	addi	sp,sp,-16
800081d8:	00812423          	sw	s0,8(sp)
800081dc:	00112623          	sw	ra,12(sp)
800081e0:	00912223          	sw	s1,4(sp)
800081e4:	00052783          	lw	a5,0(a0)
800081e8:	00050413          	mv	s0,a0
800081ec:	02079063          	bnez	a5,8000820c <pbuf_coalesce+0x38>
800081f0:	00040493          	mv	s1,s0
800081f4:	00c12083          	lw	ra,12(sp)
800081f8:	00812403          	lw	s0,8(sp)
800081fc:	00048513          	mv	a0,s1
80008200:	00412483          	lw	s1,4(sp)
80008204:	01010113          	addi	sp,sp,16
80008208:	00008067          	ret
8000820c:	00058513          	mv	a0,a1
80008210:	00040613          	mv	a2,s0
80008214:	28000593          	li	a1,640
80008218:	f75ff0ef          	jal	ra,8000818c <pbuf_clone>
8000821c:	00050493          	mv	s1,a0
80008220:	fc0508e3          	beqz	a0,800081f0 <pbuf_coalesce+0x1c>
80008224:	00040513          	mv	a0,s0
80008228:	eccff0ef          	jal	ra,800078f4 <pbuf_free>
8000822c:	fc9ff06f          	j	800081f4 <pbuf_coalesce+0x20>

80008230 <pbuf_try_get_at>:
80008230:	fe010113          	addi	sp,sp,-32
80008234:	00e10613          	addi	a2,sp,14
80008238:	00112e23          	sw	ra,28(sp)
8000823c:	ca0ff0ef          	jal	ra,800076dc <pbuf_skip_const>
80008240:	fff00793          	li	a5,-1
80008244:	02050063          	beqz	a0,80008264 <pbuf_try_get_at+0x34>
80008248:	00e15703          	lhu	a4,14(sp)
8000824c:	00a55683          	lhu	a3,10(a0)
80008250:	fff00793          	li	a5,-1
80008254:	00d77863          	bgeu	a4,a3,80008264 <pbuf_try_get_at+0x34>
80008258:	00452783          	lw	a5,4(a0)
8000825c:	00e787b3          	add	a5,a5,a4
80008260:	0007c783          	lbu	a5,0(a5)
80008264:	01c12083          	lw	ra,28(sp)
80008268:	00078513          	mv	a0,a5
8000826c:	02010113          	addi	sp,sp,32
80008270:	00008067          	ret

80008274 <pbuf_get_at>:
80008274:	ff010113          	addi	sp,sp,-16
80008278:	00112623          	sw	ra,12(sp)
8000827c:	fb5ff0ef          	jal	ra,80008230 <pbuf_try_get_at>
80008280:	00055463          	bgez	a0,80008288 <pbuf_get_at+0x14>
80008284:	00000513          	li	a0,0
80008288:	00c12083          	lw	ra,12(sp)
8000828c:	0ff57513          	andi	a0,a0,255
80008290:	01010113          	addi	sp,sp,16
80008294:	00008067          	ret

80008298 <pbuf_put_at>:
80008298:	fe010113          	addi	sp,sp,-32
8000829c:	00812c23          	sw	s0,24(sp)
800082a0:	00060413          	mv	s0,a2
800082a4:	00e10613          	addi	a2,sp,14
800082a8:	00112e23          	sw	ra,28(sp)
800082ac:	c30ff0ef          	jal	ra,800076dc <pbuf_skip_const>
800082b0:	00050e63          	beqz	a0,800082cc <pbuf_put_at+0x34>
800082b4:	00e15703          	lhu	a4,14(sp)
800082b8:	00a55783          	lhu	a5,10(a0)
800082bc:	00f77863          	bgeu	a4,a5,800082cc <pbuf_put_at+0x34>
800082c0:	00452783          	lw	a5,4(a0)
800082c4:	00e787b3          	add	a5,a5,a4
800082c8:	00878023          	sb	s0,0(a5)
800082cc:	01c12083          	lw	ra,28(sp)
800082d0:	01812403          	lw	s0,24(sp)
800082d4:	02010113          	addi	sp,sp,32
800082d8:	00008067          	ret

800082dc <pbuf_memcmp>:
800082dc:	00855703          	lhu	a4,8(a0)
800082e0:	00d587b3          	add	a5,a1,a3
800082e4:	00f75863          	bge	a4,a5,800082f4 <pbuf_memcmp+0x18>
800082e8:	00010537          	lui	a0,0x10
800082ec:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xefff>
800082f0:	00008067          	ret
800082f4:	fd010113          	addi	sp,sp,-48
800082f8:	02812423          	sw	s0,40(sp)
800082fc:	02912223          	sw	s1,36(sp)
80008300:	02112623          	sw	ra,44(sp)
80008304:	03212023          	sw	s2,32(sp)
80008308:	01312e23          	sw	s3,28(sp)
8000830c:	00050493          	mv	s1,a0
80008310:	00058413          	mv	s0,a1
80008314:	00a4d783          	lhu	a5,10(s1)
80008318:	00f46c63          	bltu	s0,a5,80008330 <pbuf_memcmp+0x54>
8000831c:	0004a483          	lw	s1,0(s1)
80008320:	40f40433          	sub	s0,s0,a5
80008324:	01041413          	slli	s0,s0,0x10
80008328:	01045413          	srli	s0,s0,0x10
8000832c:	fe0494e3          	bnez	s1,80008314 <pbuf_memcmp+0x38>
80008330:	00000993          	li	s3,0
80008334:	01099913          	slli	s2,s3,0x10
80008338:	01095913          	srli	s2,s2,0x10
8000833c:	00d96663          	bltu	s2,a3,80008348 <pbuf_memcmp+0x6c>
80008340:	00000513          	li	a0,0
80008344:	0580006f          	j	8000839c <pbuf_memcmp+0xc0>
80008348:	008905b3          	add	a1,s2,s0
8000834c:	01059593          	slli	a1,a1,0x10
80008350:	0105d593          	srli	a1,a1,0x10
80008354:	00048513          	mv	a0,s1
80008358:	00d12623          	sw	a3,12(sp)
8000835c:	00c12423          	sw	a2,8(sp)
80008360:	f15ff0ef          	jal	ra,80008274 <pbuf_get_at>
80008364:	00812603          	lw	a2,8(sp)
80008368:	00198993          	addi	s3,s3,1
8000836c:	00c12683          	lw	a3,12(sp)
80008370:	013607b3          	add	a5,a2,s3
80008374:	fff7c783          	lbu	a5,-1(a5)
80008378:	faa78ee3          	beq	a5,a0,80008334 <pbuf_memcmp+0x58>
8000837c:	000107b7          	lui	a5,0x10
80008380:	ffe78793          	addi	a5,a5,-2 # fffe <_stack_size+0xeffe>
80008384:	00090513          	mv	a0,s2
80008388:	0127f463          	bgeu	a5,s2,80008390 <pbuf_memcmp+0xb4>
8000838c:	ffe00513          	li	a0,-2
80008390:	00150513          	addi	a0,a0,1
80008394:	01051513          	slli	a0,a0,0x10
80008398:	01055513          	srli	a0,a0,0x10
8000839c:	02c12083          	lw	ra,44(sp)
800083a0:	02812403          	lw	s0,40(sp)
800083a4:	02412483          	lw	s1,36(sp)
800083a8:	02012903          	lw	s2,32(sp)
800083ac:	01c12983          	lw	s3,28(sp)
800083b0:	03010113          	addi	sp,sp,48
800083b4:	00008067          	ret

800083b8 <pbuf_memfind>:
800083b8:	fe010113          	addi	sp,sp,-32
800083bc:	00112e23          	sw	ra,28(sp)
800083c0:	00812c23          	sw	s0,24(sp)
800083c4:	00912a23          	sw	s1,20(sp)
800083c8:	01212823          	sw	s2,16(sp)
800083cc:	01312623          	sw	s3,12(sp)
800083d0:	01412423          	sw	s4,8(sp)
800083d4:	00855783          	lhu	a5,8(a0)
800083d8:	00d60733          	add	a4,a2,a3
800083dc:	02e7c263          	blt	a5,a4,80008400 <pbuf_memfind+0x48>
800083e0:	40c787b3          	sub	a5,a5,a2
800083e4:	01079493          	slli	s1,a5,0x10
800083e8:	00050993          	mv	s3,a0
800083ec:	00058a13          	mv	s4,a1
800083f0:	00060913          	mv	s2,a2
800083f4:	00068413          	mv	s0,a3
800083f8:	0104d493          	srli	s1,s1,0x10
800083fc:	0284f863          	bgeu	s1,s0,8000842c <pbuf_memfind+0x74>
80008400:	00010437          	lui	s0,0x10
80008404:	fff40413          	addi	s0,s0,-1 # ffff <_stack_size+0xefff>
80008408:	00040513          	mv	a0,s0
8000840c:	01c12083          	lw	ra,28(sp)
80008410:	01812403          	lw	s0,24(sp)
80008414:	01412483          	lw	s1,20(sp)
80008418:	01012903          	lw	s2,16(sp)
8000841c:	00c12983          	lw	s3,12(sp)
80008420:	00812a03          	lw	s4,8(sp)
80008424:	02010113          	addi	sp,sp,32
80008428:	00008067          	ret
8000842c:	00090693          	mv	a3,s2
80008430:	000a0613          	mv	a2,s4
80008434:	00040593          	mv	a1,s0
80008438:	00098513          	mv	a0,s3
8000843c:	ea1ff0ef          	jal	ra,800082dc <pbuf_memcmp>
80008440:	fc0504e3          	beqz	a0,80008408 <pbuf_memfind+0x50>
80008444:	00140413          	addi	s0,s0,1
80008448:	01041413          	slli	s0,s0,0x10
8000844c:	01045413          	srli	s0,s0,0x10
80008450:	fadff06f          	j	800083fc <pbuf_memfind+0x44>

80008454 <pbuf_strstr>:
80008454:	fe010113          	addi	sp,sp,-32
80008458:	00812c23          	sw	s0,24(sp)
8000845c:	01212823          	sw	s2,16(sp)
80008460:	00112e23          	sw	ra,28(sp)
80008464:	00010937          	lui	s2,0x10
80008468:	00912a23          	sw	s1,20(sp)
8000846c:	fff90413          	addi	s0,s2,-1 # ffff <_stack_size+0xefff>
80008470:	04058c63          	beqz	a1,800084c8 <pbuf_strstr+0x74>
80008474:	0005c783          	lbu	a5,0(a1)
80008478:	04078863          	beqz	a5,800084c8 <pbuf_strstr+0x74>
8000847c:	00855783          	lhu	a5,8(a0)
80008480:	04878663          	beq	a5,s0,800084cc <pbuf_strstr+0x78>
80008484:	00050493          	mv	s1,a0
80008488:	00058513          	mv	a0,a1
8000848c:	00b12623          	sw	a1,12(sp)
80008490:	ffe90913          	addi	s2,s2,-2
80008494:	050070ef          	jal	ra,8000f4e4 <strlen>
80008498:	02a96863          	bltu	s2,a0,800084c8 <pbuf_strstr+0x74>
8000849c:	01812403          	lw	s0,24(sp)
800084a0:	01051613          	slli	a2,a0,0x10
800084a4:	00c12583          	lw	a1,12(sp)
800084a8:	01c12083          	lw	ra,28(sp)
800084ac:	01012903          	lw	s2,16(sp)
800084b0:	00048513          	mv	a0,s1
800084b4:	01412483          	lw	s1,20(sp)
800084b8:	00000693          	li	a3,0
800084bc:	01065613          	srli	a2,a2,0x10
800084c0:	02010113          	addi	sp,sp,32
800084c4:	ef5ff06f          	j	800083b8 <pbuf_memfind>
800084c8:	00040793          	mv	a5,s0
800084cc:	01c12083          	lw	ra,28(sp)
800084d0:	01812403          	lw	s0,24(sp)
800084d4:	01412483          	lw	s1,20(sp)
800084d8:	01012903          	lw	s2,16(sp)
800084dc:	00078513          	mv	a0,a5
800084e0:	02010113          	addi	sp,sp,32
800084e4:	00008067          	ret

800084e8 <raw_input>:
800084e8:	fd010113          	addi	sp,sp,-48
800084ec:	02912223          	sw	s1,36(sp)
800084f0:	a1418793          	addi	a5,gp,-1516 # 80003484 <ip_data>
800084f4:	02812423          	sw	s0,40(sp)
800084f8:	03212023          	sw	s2,32(sp)
800084fc:	01312e23          	sw	s3,28(sp)
80008500:	01412c23          	sw	s4,24(sp)
80008504:	01512a23          	sw	s5,20(sp)
80008508:	01612823          	sw	s6,16(sp)
8000850c:	01712623          	sw	s7,12(sp)
80008510:	02112623          	sw	ra,44(sp)
80008514:	00050a13          	mv	s4,a0
80008518:	0007a583          	lw	a1,0(a5)
8000851c:	0147a503          	lw	a0,20(a5)
80008520:	00000993          	li	s3,0
80008524:	a1418493          	addi	s1,gp,-1516 # 80003484 <ip_data>
80008528:	179040ef          	jal	ra,8000cea0 <ip4_addr_isbroadcast_u32>
8000852c:	004a2783          	lw	a5,4(s4)
80008530:	00050b13          	mv	s6,a0
80008534:	0097ca83          	lbu	s5,9(a5)
80008538:	8f81a403          	lw	s0,-1800(gp) # 80003368 <raw_pcbs>
8000853c:	00000513          	li	a0,0
80008540:	00078913          	mv	s2,a5
80008544:	08040a63          	beqz	s0,800085d8 <raw_input+0xf0>
80008548:	01444783          	lbu	a5,20(s0)
8000854c:	0d579463          	bne	a5,s5,80008614 <raw_input+0x12c>
80008550:	00844703          	lbu	a4,8(s0)
80008554:	00070c63          	beqz	a4,8000856c <raw_input+0x84>
80008558:	0044a783          	lw	a5,4(s1)
8000855c:	0387c783          	lbu	a5,56(a5)
80008560:	00178793          	addi	a5,a5,1
80008564:	0ff7f793          	andi	a5,a5,255
80008568:	0af71663          	bne	a4,a5,80008614 <raw_input+0x12c>
8000856c:	080b0c63          	beqz	s6,80008604 <raw_input+0x11c>
80008570:	00944783          	lbu	a5,9(s0)
80008574:	0207f793          	andi	a5,a5,32
80008578:	08078e63          	beqz	a5,80008614 <raw_input+0x12c>
8000857c:	00042783          	lw	a5,0(s0)
80008580:	08079a63          	bnez	a5,80008614 <raw_input+0x12c>
80008584:	01544783          	lbu	a5,21(s0)
80008588:	0017f793          	andi	a5,a5,1
8000858c:	00078863          	beqz	a5,8000859c <raw_input+0xb4>
80008590:	00442703          	lw	a4,4(s0)
80008594:	0104a783          	lw	a5,16(s1)
80008598:	06f71e63          	bne	a4,a5,80008614 <raw_input+0x12c>
8000859c:	01842783          	lw	a5,24(s0)
800085a0:	06078a63          	beqz	a5,80008614 <raw_input+0x12c>
800085a4:	01c42503          	lw	a0,28(s0)
800085a8:	a2418693          	addi	a3,gp,-1500 # 80003494 <ip_data+0x10>
800085ac:	000a0613          	mv	a2,s4
800085b0:	00040593          	mv	a1,s0
800085b4:	000780e7          	jalr	a5
800085b8:	06050463          	beqz	a0,80008620 <raw_input+0x138>
800085bc:	00100513          	li	a0,1
800085c0:	00098c63          	beqz	s3,800085d8 <raw_input+0xf0>
800085c4:	01042783          	lw	a5,16(s0)
800085c8:	00f9a823          	sw	a5,16(s3)
800085cc:	8f81a783          	lw	a5,-1800(gp) # 80003368 <raw_pcbs>
800085d0:	8e81ac23          	sw	s0,-1800(gp) # 80003368 <raw_pcbs>
800085d4:	00f42823          	sw	a5,16(s0)
800085d8:	02c12083          	lw	ra,44(sp)
800085dc:	02812403          	lw	s0,40(sp)
800085e0:	02412483          	lw	s1,36(sp)
800085e4:	02012903          	lw	s2,32(sp)
800085e8:	01c12983          	lw	s3,28(sp)
800085ec:	01812a03          	lw	s4,24(sp)
800085f0:	01412a83          	lw	s5,20(sp)
800085f4:	01012b03          	lw	s6,16(sp)
800085f8:	00c12b83          	lw	s7,12(sp)
800085fc:	03010113          	addi	sp,sp,48
80008600:	00008067          	ret
80008604:	00042783          	lw	a5,0(s0)
80008608:	f6078ee3          	beqz	a5,80008584 <raw_input+0x9c>
8000860c:	0144a703          	lw	a4,20(s1)
80008610:	f6e78ae3          	beq	a5,a4,80008584 <raw_input+0x9c>
80008614:	00040993          	mv	s3,s0
80008618:	01042403          	lw	s0,16(s0)
8000861c:	f29ff06f          	j	80008544 <raw_input+0x5c>
80008620:	00200513          	li	a0,2
80008624:	ff1ff06f          	j	80008614 <raw_input+0x12c>

80008628 <raw_bind>:
80008628:	ffa00793          	li	a5,-6
8000862c:	00050a63          	beqz	a0,80008640 <raw_bind+0x18>
80008630:	00058863          	beqz	a1,80008640 <raw_bind+0x18>
80008634:	0005a783          	lw	a5,0(a1)
80008638:	00f52023          	sw	a5,0(a0)
8000863c:	00000793          	li	a5,0
80008640:	00078513          	mv	a0,a5
80008644:	00008067          	ret

80008648 <raw_bind_netif>:
80008648:	00000793          	li	a5,0
8000864c:	00058863          	beqz	a1,8000865c <raw_bind_netif+0x14>
80008650:	0385c783          	lbu	a5,56(a1)
80008654:	00178793          	addi	a5,a5,1
80008658:	0ff7f793          	andi	a5,a5,255
8000865c:	00f50423          	sb	a5,8(a0)
80008660:	00008067          	ret

80008664 <raw_connect>:
80008664:	00050793          	mv	a5,a0
80008668:	ffa00513          	li	a0,-6
8000866c:	02078263          	beqz	a5,80008690 <raw_connect+0x2c>
80008670:	02058063          	beqz	a1,80008690 <raw_connect+0x2c>
80008674:	0005a703          	lw	a4,0(a1)
80008678:	00000513          	li	a0,0
8000867c:	00e7a223          	sw	a4,4(a5)
80008680:	0157c703          	lbu	a4,21(a5)
80008684:	00176713          	ori	a4,a4,1
80008688:	00e78aa3          	sb	a4,21(a5)
8000868c:	00008067          	ret
80008690:	00008067          	ret

80008694 <raw_disconnect>:
80008694:	01554783          	lbu	a5,21(a0)
80008698:	00052223          	sw	zero,4(a0)
8000869c:	00050423          	sb	zero,8(a0)
800086a0:	ffe7f793          	andi	a5,a5,-2
800086a4:	00f50aa3          	sb	a5,21(a0)
800086a8:	00008067          	ret

800086ac <raw_recv>:
800086ac:	00b52c23          	sw	a1,24(a0)
800086b0:	00c52e23          	sw	a2,28(a0)
800086b4:	00008067          	ret

800086b8 <raw_sendto_if_src>:
800086b8:	fe010113          	addi	sp,sp,-32
800086bc:	00112e23          	sw	ra,28(sp)
800086c0:	00812c23          	sw	s0,24(sp)
800086c4:	00912a23          	sw	s1,20(sp)
800086c8:	01212823          	sw	s2,16(sp)
800086cc:	01312623          	sw	s3,12(sp)
800086d0:	01412423          	sw	s4,8(sp)
800086d4:	01512223          	sw	s5,4(sp)
800086d8:	00051663          	bnez	a0,800086e4 <raw_sendto_if_src+0x2c>
800086dc:	ffa00493          	li	s1,-6
800086e0:	06c0006f          	j	8000874c <raw_sendto_if_src+0x94>
800086e4:	fe060ce3          	beqz	a2,800086dc <raw_sendto_if_src+0x24>
800086e8:	fe068ae3          	beqz	a3,800086dc <raw_sendto_if_src+0x24>
800086ec:	fe0708e3          	beqz	a4,800086dc <raw_sendto_if_src+0x24>
800086f0:	01554783          	lbu	a5,21(a0)
800086f4:	00070a13          	mv	s4,a4
800086f8:	00068913          	mv	s2,a3
800086fc:	0027f793          	andi	a5,a5,2
80008700:	00060a93          	mv	s5,a2
80008704:	00058413          	mv	s0,a1
80008708:	00050493          	mv	s1,a0
8000870c:	06078463          	beqz	a5,80008774 <raw_sendto_if_src+0xbc>
80008710:	00a5d703          	lhu	a4,10(a1)
80008714:	01300793          	li	a5,19
80008718:	fce7f2e3          	bgeu	a5,a4,800086dc <raw_sendto_if_src+0x24>
8000871c:	00c50493          	addi	s1,a0,12
80008720:	0296ae23          	sw	s1,60(a3)
80008724:	00068813          	mv	a6,a3
80008728:	00000793          	li	a5,0
8000872c:	00000713          	li	a4,0
80008730:	00000693          	li	a3,0
80008734:	00000613          	li	a2,0
80008738:	000a0593          	mv	a1,s4
8000873c:	00040513          	mv	a0,s0
80008740:	634040ef          	jal	ra,8000cd74 <ip4_output_if>
80008744:	00050493          	mv	s1,a0
80008748:	02092e23          	sw	zero,60(s2)
8000874c:	01c12083          	lw	ra,28(sp)
80008750:	01812403          	lw	s0,24(sp)
80008754:	00048513          	mv	a0,s1
80008758:	01012903          	lw	s2,16(sp)
8000875c:	01412483          	lw	s1,20(sp)
80008760:	00c12983          	lw	s3,12(sp)
80008764:	00812a03          	lw	s4,8(sp)
80008768:	00412a83          	lw	s5,4(sp)
8000876c:	02010113          	addi	sp,sp,32
80008770:	00008067          	ret
80008774:	0085d703          	lhu	a4,8(a1)
80008778:	000107b7          	lui	a5,0x10
8000877c:	feb78793          	addi	a5,a5,-21 # ffeb <_stack_size+0xefeb>
80008780:	00e7f663          	bgeu	a5,a4,8000878c <raw_sendto_if_src+0xd4>
80008784:	fff00493          	li	s1,-1
80008788:	fc5ff06f          	j	8000874c <raw_sendto_if_src+0x94>
8000878c:	01400593          	li	a1,20
80008790:	00040513          	mv	a0,s0
80008794:	8c8ff0ef          	jal	ra,8000785c <pbuf_add_header>
80008798:	04050c63          	beqz	a0,800087f0 <raw_sendto_if_src+0x138>
8000879c:	28000613          	li	a2,640
800087a0:	00000593          	li	a1,0
800087a4:	02400513          	li	a0,36
800087a8:	a20ff0ef          	jal	ra,800079c8 <pbuf_alloc>
800087ac:	00050993          	mv	s3,a0
800087b0:	fc050ae3          	beqz	a0,80008784 <raw_sendto_if_src+0xcc>
800087b4:	00845783          	lhu	a5,8(s0)
800087b8:	00078663          	beqz	a5,800087c4 <raw_sendto_if_src+0x10c>
800087bc:	00040593          	mv	a1,s0
800087c0:	d8cff0ef          	jal	ra,80007d4c <pbuf_chain>
800087c4:	0094c783          	lbu	a5,9(s1)
800087c8:	0207f793          	andi	a5,a5,32
800087cc:	02079e63          	bnez	a5,80008808 <raw_sendto_if_src+0x150>
800087d0:	000aa503          	lw	a0,0(s5)
800087d4:	00090593          	mv	a1,s2
800087d8:	6c8040ef          	jal	ra,8000cea0 <ip4_addr_isbroadcast_u32>
800087dc:	02050663          	beqz	a0,80008808 <raw_sendto_if_src+0x150>
800087e0:	ef340ee3          	beq	s0,s3,800086dc <raw_sendto_if_src+0x24>
800087e4:	00098513          	mv	a0,s3
800087e8:	90cff0ef          	jal	ra,800078f4 <pbuf_free>
800087ec:	ef1ff06f          	j	800086dc <raw_sendto_if_src+0x24>
800087f0:	01400593          	li	a1,20
800087f4:	00040513          	mv	a0,s0
800087f8:	874ff0ef          	jal	ra,8000786c <pbuf_remove_header>
800087fc:	f80514e3          	bnez	a0,80008784 <raw_sendto_if_src+0xcc>
80008800:	00040993          	mv	s3,s0
80008804:	fc1ff06f          	j	800087c4 <raw_sendto_if_src+0x10c>
80008808:	00c48793          	addi	a5,s1,12
8000880c:	00b4c683          	lbu	a3,11(s1)
80008810:	02f92e23          	sw	a5,60(s2)
80008814:	0144c783          	lbu	a5,20(s1)
80008818:	00a4c703          	lbu	a4,10(s1)
8000881c:	00090813          	mv	a6,s2
80008820:	000a8613          	mv	a2,s5
80008824:	000a0593          	mv	a1,s4
80008828:	00098513          	mv	a0,s3
8000882c:	548040ef          	jal	ra,8000cd74 <ip4_output_if>
80008830:	02092e23          	sw	zero,60(s2)
80008834:	00050493          	mv	s1,a0
80008838:	f1340ae3          	beq	s0,s3,8000874c <raw_sendto_if_src+0x94>
8000883c:	00098513          	mv	a0,s3
80008840:	8b4ff0ef          	jal	ra,800078f4 <pbuf_free>
80008844:	f09ff06f          	j	8000874c <raw_sendto_if_src+0x94>

80008848 <raw_sendto>:
80008848:	08050663          	beqz	a0,800088d4 <raw_sendto+0x8c>
8000884c:	08060463          	beqz	a2,800088d4 <raw_sendto+0x8c>
80008850:	ff010113          	addi	sp,sp,-16
80008854:	00812423          	sw	s0,8(sp)
80008858:	00912223          	sw	s1,4(sp)
8000885c:	01212023          	sw	s2,0(sp)
80008860:	00112623          	sw	ra,12(sp)
80008864:	00050413          	mv	s0,a0
80008868:	00854503          	lbu	a0,8(a0)
8000886c:	00060493          	mv	s1,a2
80008870:	00058913          	mv	s2,a1
80008874:	04050663          	beqz	a0,800088c0 <raw_sendto+0x78>
80008878:	d41fe0ef          	jal	ra,800075b8 <netif_get_by_index>
8000887c:	06050063          	beqz	a0,800088dc <raw_sendto+0x94>
80008880:	00042783          	lw	a5,0(s0)
80008884:	04078463          	beqz	a5,800088cc <raw_sendto+0x84>
80008888:	0f07f793          	andi	a5,a5,240
8000888c:	0e000713          	li	a4,224
80008890:	02e78e63          	beq	a5,a4,800088cc <raw_sendto+0x84>
80008894:	00040713          	mv	a4,s0
80008898:	00050693          	mv	a3,a0
8000889c:	00040513          	mv	a0,s0
800088a0:	00812403          	lw	s0,8(sp)
800088a4:	00c12083          	lw	ra,12(sp)
800088a8:	00048613          	mv	a2,s1
800088ac:	00090593          	mv	a1,s2
800088b0:	00412483          	lw	s1,4(sp)
800088b4:	00012903          	lw	s2,0(sp)
800088b8:	01010113          	addi	sp,sp,16
800088bc:	dfdff06f          	j	800086b8 <raw_sendto_if_src>
800088c0:	00060513          	mv	a0,a2
800088c4:	619030ef          	jal	ra,8000c6dc <ip4_route>
800088c8:	fb5ff06f          	j	8000887c <raw_sendto+0x34>
800088cc:	00450713          	addi	a4,a0,4
800088d0:	fc9ff06f          	j	80008898 <raw_sendto+0x50>
800088d4:	ffa00513          	li	a0,-6
800088d8:	00008067          	ret
800088dc:	00c12083          	lw	ra,12(sp)
800088e0:	00812403          	lw	s0,8(sp)
800088e4:	00412483          	lw	s1,4(sp)
800088e8:	00012903          	lw	s2,0(sp)
800088ec:	ffc00513          	li	a0,-4
800088f0:	01010113          	addi	sp,sp,16
800088f4:	00008067          	ret

800088f8 <raw_send>:
800088f8:	00450613          	addi	a2,a0,4
800088fc:	f4dff06f          	j	80008848 <raw_sendto>

80008900 <raw_remove>:
80008900:	8f81a783          	lw	a5,-1800(gp) # 80003368 <raw_pcbs>
80008904:	00050593          	mv	a1,a0
80008908:	00a79c63          	bne	a5,a0,80008920 <raw_remove+0x20>
8000890c:	01052783          	lw	a5,16(a0)
80008910:	8ef1ac23          	sw	a5,-1800(gp) # 80003368 <raw_pcbs>
80008914:	00000513          	li	a0,0
80008918:	f28fe06f          	j	80007040 <memp_free>
8000891c:	00070793          	mv	a5,a4
80008920:	fe078ae3          	beqz	a5,80008914 <raw_remove+0x14>
80008924:	0107a703          	lw	a4,16(a5)
80008928:	fe0706e3          	beqz	a4,80008914 <raw_remove+0x14>
8000892c:	feb718e3          	bne	a4,a1,8000891c <raw_remove+0x1c>
80008930:	0105a703          	lw	a4,16(a1)
80008934:	00e7a823          	sw	a4,16(a5)
80008938:	fddff06f          	j	80008914 <raw_remove+0x14>

8000893c <raw_new>:
8000893c:	ff010113          	addi	sp,sp,-16
80008940:	800035b7          	lui	a1,0x80003
80008944:	00912223          	sw	s1,4(sp)
80008948:	25a00613          	li	a2,602
8000894c:	00050493          	mv	s1,a0
80008950:	ec458593          	addi	a1,a1,-316 # 80002ec4 <_ram_heap_end+0xfffeaec4>
80008954:	00000513          	li	a0,0
80008958:	00812423          	sw	s0,8(sp)
8000895c:	00112623          	sw	ra,12(sp)
80008960:	ea8fe0ef          	jal	ra,80007008 <memp_malloc_fn>
80008964:	00050413          	mv	s0,a0
80008968:	02050463          	beqz	a0,80008990 <raw_new+0x54>
8000896c:	02000613          	li	a2,32
80008970:	00000593          	li	a1,0
80008974:	3e5040ef          	jal	ra,8000d558 <memset>
80008978:	fff00793          	li	a5,-1
8000897c:	00f405a3          	sb	a5,11(s0)
80008980:	8f81a703          	lw	a4,-1800(gp) # 80003368 <raw_pcbs>
80008984:	00940a23          	sb	s1,20(s0)
80008988:	8e81ac23          	sw	s0,-1800(gp) # 80003368 <raw_pcbs>
8000898c:	00e42823          	sw	a4,16(s0)
80008990:	00040513          	mv	a0,s0
80008994:	00c12083          	lw	ra,12(sp)
80008998:	00812403          	lw	s0,8(sp)
8000899c:	00412483          	lw	s1,4(sp)
800089a0:	01010113          	addi	sp,sp,16
800089a4:	00008067          	ret

800089a8 <raw_new_ip_type>:
800089a8:	00058513          	mv	a0,a1
800089ac:	f91ff06f          	j	8000893c <raw_new>

800089b0 <raw_netif_ip_addr_changed>:
800089b0:	02050063          	beqz	a0,800089d0 <raw_netif_ip_addr_changed+0x20>
800089b4:	00052783          	lw	a5,0(a0)
800089b8:	00078c63          	beqz	a5,800089d0 <raw_netif_ip_addr_changed+0x20>
800089bc:	00058a63          	beqz	a1,800089d0 <raw_netif_ip_addr_changed+0x20>
800089c0:	0005a783          	lw	a5,0(a1)
800089c4:	00078663          	beqz	a5,800089d0 <raw_netif_ip_addr_changed+0x20>
800089c8:	8f81a783          	lw	a5,-1800(gp) # 80003368 <raw_pcbs>
800089cc:	00079463          	bnez	a5,800089d4 <raw_netif_ip_addr_changed+0x24>
800089d0:	00008067          	ret
800089d4:	0007a683          	lw	a3,0(a5)
800089d8:	00052703          	lw	a4,0(a0)
800089dc:	00e69663          	bne	a3,a4,800089e8 <raw_netif_ip_addr_changed+0x38>
800089e0:	0005a703          	lw	a4,0(a1)
800089e4:	00e7a023          	sw	a4,0(a5)
800089e8:	0107a783          	lw	a5,16(a5)
800089ec:	fe1ff06f          	j	800089cc <raw_netif_ip_addr_changed+0x1c>

800089f0 <stats_init>:
800089f0:	00008067          	ret

800089f4 <sys_timeout_abs>:
800089f4:	ff010113          	addi	sp,sp,-16
800089f8:	01212023          	sw	s2,0(sp)
800089fc:	00058913          	mv	s2,a1
80008a00:	800035b7          	lui	a1,0x80003
80008a04:	00812423          	sw	s0,8(sp)
80008a08:	00912223          	sw	s1,4(sp)
80008a0c:	00050413          	mv	s0,a0
80008a10:	00060493          	mv	s1,a2
80008a14:	ef058593          	addi	a1,a1,-272 # 80002ef0 <_ram_heap_end+0xfffeaef0>
80008a18:	0bc00613          	li	a2,188
80008a1c:	00300513          	li	a0,3
80008a20:	00112623          	sw	ra,12(sp)
80008a24:	de4fe0ef          	jal	ra,80007008 <memp_malloc_fn>
80008a28:	02050063          	beqz	a0,80008a48 <sys_timeout_abs+0x54>
80008a2c:	9001a783          	lw	a5,-1792(gp) # 80003370 <next_timeout>
80008a30:	00052023          	sw	zero,0(a0)
80008a34:	01252423          	sw	s2,8(a0)
80008a38:	00952623          	sw	s1,12(a0)
80008a3c:	00852223          	sw	s0,4(a0)
80008a40:	02079063          	bnez	a5,80008a60 <sys_timeout_abs+0x6c>
80008a44:	90a1a023          	sw	a0,-1792(gp) # 80003370 <next_timeout>
80008a48:	00c12083          	lw	ra,12(sp)
80008a4c:	00812403          	lw	s0,8(sp)
80008a50:	00412483          	lw	s1,4(sp)
80008a54:	00012903          	lw	s2,0(sp)
80008a58:	01010113          	addi	sp,sp,16
80008a5c:	00008067          	ret
80008a60:	0047a683          	lw	a3,4(a5)
80008a64:	40d406b3          	sub	a3,s0,a3
80008a68:	0006d863          	bgez	a3,80008a78 <sys_timeout_abs+0x84>
80008a6c:	00f52023          	sw	a5,0(a0)
80008a70:	fd5ff06f          	j	80008a44 <sys_timeout_abs+0x50>
80008a74:	00070793          	mv	a5,a4
80008a78:	0007a703          	lw	a4,0(a5)
80008a7c:	00070863          	beqz	a4,80008a8c <sys_timeout_abs+0x98>
80008a80:	00472683          	lw	a3,4(a4) # 10004 <_stack_size+0xf004>
80008a84:	40d406b3          	sub	a3,s0,a3
80008a88:	fe06d6e3          	bgez	a3,80008a74 <sys_timeout_abs+0x80>
80008a8c:	00e52023          	sw	a4,0(a0)
80008a90:	00a7a023          	sw	a0,0(a5)
80008a94:	fb5ff06f          	j	80008a48 <sys_timeout_abs+0x54>

80008a98 <lwip_cyclic_timer>:
80008a98:	fe010113          	addi	sp,sp,-32
80008a9c:	00112e23          	sw	ra,28(sp)
80008aa0:	00452783          	lw	a5,4(a0)
80008aa4:	00a12623          	sw	a0,12(sp)
80008aa8:	000780e7          	jalr	a5
80008aac:	fa8fc0ef          	jal	ra,80005254 <sys_now>
80008ab0:	00c12603          	lw	a2,12(sp)
80008ab4:	8fc1a783          	lw	a5,-1796(gp) # 8000336c <current_timeout_due_time>
80008ab8:	00062703          	lw	a4,0(a2)
80008abc:	800095b7          	lui	a1,0x80009
80008ac0:	a9858593          	addi	a1,a1,-1384 # 80008a98 <_ram_heap_end+0xffff0a98>
80008ac4:	00f707b3          	add	a5,a4,a5
80008ac8:	40a786b3          	sub	a3,a5,a0
80008acc:	00a70533          	add	a0,a4,a0
80008ad0:	0006c463          	bltz	a3,80008ad8 <lwip_cyclic_timer+0x40>
80008ad4:	00078513          	mv	a0,a5
80008ad8:	01c12083          	lw	ra,28(sp)
80008adc:	02010113          	addi	sp,sp,32
80008ae0:	f15ff06f          	j	800089f4 <sys_timeout_abs>

80008ae4 <sys_timeout>:
80008ae4:	fe010113          	addi	sp,sp,-32
80008ae8:	00812c23          	sw	s0,24(sp)
80008aec:	00112e23          	sw	ra,28(sp)
80008af0:	00050413          	mv	s0,a0
80008af4:	00b12623          	sw	a1,12(sp)
80008af8:	00c12423          	sw	a2,8(sp)
80008afc:	f58fc0ef          	jal	ra,80005254 <sys_now>
80008b00:	00850533          	add	a0,a0,s0
80008b04:	01812403          	lw	s0,24(sp)
80008b08:	00812603          	lw	a2,8(sp)
80008b0c:	00c12583          	lw	a1,12(sp)
80008b10:	01c12083          	lw	ra,28(sp)
80008b14:	02010113          	addi	sp,sp,32
80008b18:	eddff06f          	j	800089f4 <sys_timeout_abs>

80008b1c <sys_timeouts_init>:
80008b1c:	ff010113          	addi	sp,sp,-16
80008b20:	00812423          	sw	s0,8(sp)
80008b24:	80003637          	lui	a2,0x80003
80008b28:	80009437          	lui	s0,0x80009
80008b2c:	00912223          	sw	s1,4(sp)
80008b30:	a9840593          	addi	a1,s0,-1384 # 80008a98 <_ram_heap_end+0xffff0a98>
80008b34:	ed860493          	addi	s1,a2,-296 # 80002ed8 <_ram_heap_end+0xfffeaed8>
80008b38:	3e800513          	li	a0,1000
80008b3c:	ed860613          	addi	a2,a2,-296
80008b40:	00112623          	sw	ra,12(sp)
80008b44:	fa1ff0ef          	jal	ra,80008ae4 <sys_timeout>
80008b48:	0000f537          	lui	a0,0xf
80008b4c:	00848613          	addi	a2,s1,8
80008b50:	a9840593          	addi	a1,s0,-1384
80008b54:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xda60>
80008b58:	f8dff0ef          	jal	ra,80008ae4 <sys_timeout>
80008b5c:	a9840593          	addi	a1,s0,-1384
80008b60:	00812403          	lw	s0,8(sp)
80008b64:	00c12083          	lw	ra,12(sp)
80008b68:	01048613          	addi	a2,s1,16
80008b6c:	00412483          	lw	s1,4(sp)
80008b70:	1f400513          	li	a0,500
80008b74:	01010113          	addi	sp,sp,16
80008b78:	f6dff06f          	j	80008ae4 <sys_timeout>

80008b7c <sys_untimeout>:
80008b7c:	9001a783          	lw	a5,-1792(gp) # 80003370 <next_timeout>
80008b80:	00070693          	mv	a3,a4
80008b84:	00000613          	li	a2,0
80008b88:	00079e63          	bnez	a5,80008ba4 <sys_untimeout+0x28>
80008b8c:	00008067          	ret
80008b90:	00e62023          	sw	a4,0(a2)
80008b94:	02c0006f          	j	80008bc0 <sys_untimeout+0x44>
80008b98:	00078613          	mv	a2,a5
80008b9c:	fe0708e3          	beqz	a4,80008b8c <sys_untimeout+0x10>
80008ba0:	00070793          	mv	a5,a4
80008ba4:	0087a803          	lw	a6,8(a5)
80008ba8:	0007a703          	lw	a4,0(a5)
80008bac:	fea816e3          	bne	a6,a0,80008b98 <sys_untimeout+0x1c>
80008bb0:	00c7a803          	lw	a6,12(a5)
80008bb4:	feb812e3          	bne	a6,a1,80008b98 <sys_untimeout+0x1c>
80008bb8:	fc061ce3          	bnez	a2,80008b90 <sys_untimeout+0x14>
80008bbc:	90e1a023          	sw	a4,-1792(gp) # 80003370 <next_timeout>
80008bc0:	00078593          	mv	a1,a5
80008bc4:	00300513          	li	a0,3
80008bc8:	c78fe06f          	j	80007040 <memp_free>

80008bcc <sys_check_timeouts>:
80008bcc:	fe010113          	addi	sp,sp,-32
80008bd0:	00912a23          	sw	s1,20(sp)
80008bd4:	01312623          	sw	s3,12(sp)
80008bd8:	01412423          	sw	s4,8(sp)
80008bdc:	00112e23          	sw	ra,28(sp)
80008be0:	00812c23          	sw	s0,24(sp)
80008be4:	01212823          	sw	s2,16(sp)
80008be8:	e6cfc0ef          	jal	ra,80005254 <sys_now>
80008bec:	00050993          	mv	s3,a0
80008bf0:	9001a583          	lw	a1,-1792(gp) # 80003370 <next_timeout>
80008bf4:	02058e63          	beqz	a1,80008c30 <sys_check_timeouts+0x64>
80008bf8:	0045a783          	lw	a5,4(a1)
80008bfc:	40f98733          	sub	a4,s3,a5
80008c00:	02074863          	bltz	a4,80008c30 <sys_check_timeouts+0x64>
80008c04:	0005a703          	lw	a4,0(a1)
80008c08:	0085a403          	lw	s0,8(a1)
80008c0c:	00300513          	li	a0,3
80008c10:	90e1a023          	sw	a4,-1792(gp) # 80003370 <next_timeout>
80008c14:	00c5a903          	lw	s2,12(a1)
80008c18:	8ef1ae23          	sw	a5,-1796(gp) # 8000336c <current_timeout_due_time>
80008c1c:	c24fe0ef          	jal	ra,80007040 <memp_free>
80008c20:	fc0408e3          	beqz	s0,80008bf0 <sys_check_timeouts+0x24>
80008c24:	00090513          	mv	a0,s2
80008c28:	000400e7          	jalr	s0
80008c2c:	fc5ff06f          	j	80008bf0 <sys_check_timeouts+0x24>
80008c30:	01c12083          	lw	ra,28(sp)
80008c34:	01812403          	lw	s0,24(sp)
80008c38:	01412483          	lw	s1,20(sp)
80008c3c:	01012903          	lw	s2,16(sp)
80008c40:	00c12983          	lw	s3,12(sp)
80008c44:	00812a03          	lw	s4,8(sp)
80008c48:	02010113          	addi	sp,sp,32
80008c4c:	00008067          	ret

80008c50 <sys_restart_timeouts>:
80008c50:	ff010113          	addi	sp,sp,-16
80008c54:	00812423          	sw	s0,8(sp)
80008c58:	9001a783          	lw	a5,-1792(gp) # 80003370 <next_timeout>
80008c5c:	00112623          	sw	ra,12(sp)
80008c60:	02078463          	beqz	a5,80008c88 <sys_restart_timeouts+0x38>
80008c64:	df0fc0ef          	jal	ra,80005254 <sys_now>
80008c68:	9001a783          	lw	a5,-1792(gp) # 80003370 <next_timeout>
80008c6c:	0047a703          	lw	a4,4(a5)
80008c70:	40e50533          	sub	a0,a0,a4
80008c74:	0047a703          	lw	a4,4(a5)
80008c78:	00a70733          	add	a4,a4,a0
80008c7c:	00e7a223          	sw	a4,4(a5)
80008c80:	0007a783          	lw	a5,0(a5)
80008c84:	fe0798e3          	bnez	a5,80008c74 <sys_restart_timeouts+0x24>
80008c88:	00c12083          	lw	ra,12(sp)
80008c8c:	00812403          	lw	s0,8(sp)
80008c90:	01010113          	addi	sp,sp,16
80008c94:	00008067          	ret

80008c98 <sys_timeouts_sleeptime>:
80008c98:	ff010113          	addi	sp,sp,-16
80008c9c:	00812423          	sw	s0,8(sp)
80008ca0:	9001a783          	lw	a5,-1792(gp) # 80003370 <next_timeout>
80008ca4:	00112623          	sw	ra,12(sp)
80008ca8:	fff00513          	li	a0,-1
80008cac:	00078e63          	beqz	a5,80008cc8 <sys_timeouts_sleeptime+0x30>
80008cb0:	da4fc0ef          	jal	ra,80005254 <sys_now>
80008cb4:	9001a783          	lw	a5,-1792(gp) # 80003370 <next_timeout>
80008cb8:	0047a783          	lw	a5,4(a5)
80008cbc:	40a78533          	sub	a0,a5,a0
80008cc0:	00055463          	bgez	a0,80008cc8 <sys_timeouts_sleeptime+0x30>
80008cc4:	00000513          	li	a0,0
80008cc8:	00c12083          	lw	ra,12(sp)
80008ccc:	00812403          	lw	s0,8(sp)
80008cd0:	01010113          	addi	sp,sp,16
80008cd4:	00008067          	ret

80008cd8 <udp_init>:
80008cd8:	00008067          	ret

80008cdc <udp_input>:
80008cdc:	fd010113          	addi	sp,sp,-48
80008ce0:	02812423          	sw	s0,40(sp)
80008ce4:	02112623          	sw	ra,44(sp)
80008ce8:	02912223          	sw	s1,36(sp)
80008cec:	03212023          	sw	s2,32(sp)
80008cf0:	01312e23          	sw	s3,28(sp)
80008cf4:	01412c23          	sw	s4,24(sp)
80008cf8:	01512a23          	sw	s5,20(sp)
80008cfc:	01612823          	sw	s6,16(sp)
80008d00:	01712623          	sw	s7,12(sp)
80008d04:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
80008d08:	0f47a703          	lw	a4,244(a5)
80008d0c:	00170713          	addi	a4,a4,1
80008d10:	0ee7aa23          	sw	a4,244(a5)
80008d14:	00a55683          	lhu	a3,10(a0)
80008d18:	00700713          	li	a4,7
80008d1c:	04d76463          	bltu	a4,a3,80008d64 <udp_input+0x88>
80008d20:	1047a703          	lw	a4,260(a5)
80008d24:	00170713          	addi	a4,a4,1
80008d28:	10e7a223          	sw	a4,260(a5)
80008d2c:	0fc7a703          	lw	a4,252(a5)
80008d30:	00170713          	addi	a4,a4,1
80008d34:	0ee7ae23          	sw	a4,252(a5)
80008d38:	02812403          	lw	s0,40(sp)
80008d3c:	02c12083          	lw	ra,44(sp)
80008d40:	02412483          	lw	s1,36(sp)
80008d44:	02012903          	lw	s2,32(sp)
80008d48:	01c12983          	lw	s3,28(sp)
80008d4c:	01812a03          	lw	s4,24(sp)
80008d50:	01412a83          	lw	s5,20(sp)
80008d54:	01012b03          	lw	s6,16(sp)
80008d58:	00c12b83          	lw	s7,12(sp)
80008d5c:	03010113          	addi	sp,sp,48
80008d60:	b95fe06f          	j	800078f4 <pbuf_free>
80008d64:	a1418913          	addi	s2,gp,-1516 # 80003484 <ip_data>
80008d68:	00452983          	lw	s3,4(a0)
80008d6c:	00050493          	mv	s1,a0
80008d70:	00058b93          	mv	s7,a1
80008d74:	01492503          	lw	a0,20(s2)
80008d78:	00092583          	lw	a1,0(s2)
80008d7c:	a2c18413          	addi	s0,gp,-1492 # 8000349c <lwip_stats>
80008d80:	a1418a13          	addi	s4,gp,-1516 # 80003484 <ip_data>
80008d84:	11c040ef          	jal	ra,8000cea0 <ip4_addr_isbroadcast_u32>
80008d88:	0019c783          	lbu	a5,1(s3)
80008d8c:	00050a93          	mv	s5,a0
80008d90:	0009c503          	lbu	a0,0(s3)
80008d94:	00879793          	slli	a5,a5,0x8
80008d98:	00a7e533          	or	a0,a5,a0
80008d9c:	935fd0ef          	jal	ra,800066d0 <lwip_htons>
80008da0:	0039c783          	lbu	a5,3(s3)
80008da4:	00050b13          	mv	s6,a0
80008da8:	0029c503          	lbu	a0,2(s3)
80008dac:	00879793          	slli	a5,a5,0x8
80008db0:	00a7e533          	or	a0,a5,a0
80008db4:	91dfd0ef          	jal	ra,800066d0 <lwip_htons>
80008db8:	9041a803          	lw	a6,-1788(gp) # 80003374 <udp_pcbs>
80008dbc:	00492303          	lw	t1,4(s2)
80008dc0:	01492683          	lw	a3,20(s2)
80008dc4:	01092e03          	lw	t3,16(s2)
80008dc8:	00080793          	mv	a5,a6
80008dcc:	00000913          	li	s2,0
80008dd0:	00000593          	li	a1,0
80008dd4:	fff00893          	li	a7,-1
80008dd8:	00079c63          	bnez	a5,80008df0 <udp_input+0x114>
80008ddc:	0a091e63          	bnez	s2,80008e98 <udp_input+0x1bc>
80008de0:	004ba783          	lw	a5,4(s7)
80008de4:	0ad78a63          	beq	a5,a3,80008e98 <udp_input+0x1bc>
80008de8:	00048513          	mv	a0,s1
80008dec:	f4dff06f          	j	80008d38 <udp_input+0x5c>
80008df0:	0167d703          	lhu	a4,22(a5)
80008df4:	0ea71e63          	bne	a4,a0,80008ef0 <udp_input+0x214>
80008df8:	0087ce83          	lbu	t4,8(a5)
80008dfc:	000e8a63          	beqz	t4,80008e10 <udp_input+0x134>
80008e00:	03834703          	lbu	a4,56(t1)
80008e04:	00170713          	addi	a4,a4,1
80008e08:	0ff77713          	andi	a4,a4,255
80008e0c:	0eee9263          	bne	t4,a4,80008ef0 <udp_input+0x214>
80008e10:	0c0a8a63          	beqz	s5,80008ee4 <udp_input+0x208>
80008e14:	0097c703          	lbu	a4,9(a5)
80008e18:	02077713          	andi	a4,a4,32
80008e1c:	0c070a63          	beqz	a4,80008ef0 <udp_input+0x214>
80008e20:	0007a703          	lw	a4,0(a5)
80008e24:	00070c63          	beqz	a4,80008e3c <udp_input+0x160>
80008e28:	01168a63          	beq	a3,a7,80008e3c <udp_input+0x160>
80008e2c:	008bae83          	lw	t4,8(s7)
80008e30:	00d74733          	xor	a4,a4,a3
80008e34:	01d77733          	and	a4,a4,t4
80008e38:	0a071c63          	bnez	a4,80008ef0 <udp_input+0x214>
80008e3c:	0147c703          	lbu	a4,20(a5)
80008e40:	00477713          	andi	a4,a4,4
80008e44:	02071463          	bnez	a4,80008e6c <udp_input+0x190>
80008e48:	02090063          	beqz	s2,80008e68 <udp_input+0x18c>
80008e4c:	020a8063          	beqz	s5,80008e6c <udp_input+0x190>
80008e50:	01169e63          	bne	a3,a7,80008e6c <udp_input+0x190>
80008e54:	004ba703          	lw	a4,4(s7)
80008e58:	00092e83          	lw	t4,0(s2)
80008e5c:	00ee8863          	beq	t4,a4,80008e6c <udp_input+0x190>
80008e60:	0007ae83          	lw	t4,0(a5)
80008e64:	01d71463          	bne	a4,t4,80008e6c <udp_input+0x190>
80008e68:	00078913          	mv	s2,a5
80008e6c:	0187d703          	lhu	a4,24(a5)
80008e70:	09671063          	bne	a4,s6,80008ef0 <udp_input+0x214>
80008e74:	0047a703          	lw	a4,4(a5)
80008e78:	00070463          	beqz	a4,80008e80 <udp_input+0x1a4>
80008e7c:	07c71a63          	bne	a4,t3,80008ef0 <udp_input+0x214>
80008e80:	06058e63          	beqz	a1,80008efc <udp_input+0x220>
80008e84:	0107a703          	lw	a4,16(a5)
80008e88:	90f1a223          	sw	a5,-1788(gp) # 80003374 <udp_pcbs>
80008e8c:	00e5a823          	sw	a4,16(a1)
80008e90:	0107a823          	sw	a6,16(a5)
80008e94:	00078913          	mv	s2,a5
80008e98:	0079c783          	lbu	a5,7(s3)
80008e9c:	0069c703          	lbu	a4,6(s3)
80008ea0:	00879793          	slli	a5,a5,0x8
80008ea4:	00e7e7b3          	or	a5,a5,a4
80008ea8:	06078263          	beqz	a5,80008f0c <udp_input+0x230>
80008eac:	0084d603          	lhu	a2,8(s1)
80008eb0:	a2818713          	addi	a4,gp,-1496 # 80003498 <ip_data+0x14>
80008eb4:	a2418693          	addi	a3,gp,-1500 # 80003494 <ip_data+0x10>
80008eb8:	01100593          	li	a1,17
80008ebc:	00048513          	mv	a0,s1
80008ec0:	c71fd0ef          	jal	ra,80006b30 <ip_chksum_pseudo>
80008ec4:	04050463          	beqz	a0,80008f0c <udp_input+0x230>
80008ec8:	10042783          	lw	a5,256(s0)
80008ecc:	00178793          	addi	a5,a5,1
80008ed0:	10f42023          	sw	a5,256(s0)
80008ed4:	0fc42783          	lw	a5,252(s0)
80008ed8:	00178793          	addi	a5,a5,1
80008edc:	0ef42e23          	sw	a5,252(s0)
80008ee0:	f09ff06f          	j	80008de8 <udp_input+0x10c>
80008ee4:	0007a703          	lw	a4,0(a5)
80008ee8:	f4070ae3          	beqz	a4,80008e3c <udp_input+0x160>
80008eec:	f4d708e3          	beq	a4,a3,80008e3c <udp_input+0x160>
80008ef0:	00078593          	mv	a1,a5
80008ef4:	0107a783          	lw	a5,16(a5)
80008ef8:	ee1ff06f          	j	80008dd8 <udp_input+0xfc>
80008efc:	11c42703          	lw	a4,284(s0)
80008f00:	00170713          	addi	a4,a4,1
80008f04:	10e42e23          	sw	a4,284(s0)
80008f08:	f8dff06f          	j	80008e94 <udp_input+0x1b8>
80008f0c:	00800593          	li	a1,8
80008f10:	00048513          	mv	a0,s1
80008f14:	959fe0ef          	jal	ra,8000786c <pbuf_remove_header>
80008f18:	fa051ee3          	bnez	a0,80008ed4 <udp_input+0x1f8>
80008f1c:	04090663          	beqz	s2,80008f68 <udp_input+0x28c>
80008f20:	01c92303          	lw	t1,28(s2)
80008f24:	ec0302e3          	beqz	t1,80008de8 <udp_input+0x10c>
80008f28:	02812403          	lw	s0,40(sp)
80008f2c:	02092503          	lw	a0,32(s2)
80008f30:	02c12083          	lw	ra,44(sp)
80008f34:	01c12983          	lw	s3,28(sp)
80008f38:	01812a03          	lw	s4,24(sp)
80008f3c:	01412a83          	lw	s5,20(sp)
80008f40:	00c12b83          	lw	s7,12(sp)
80008f44:	000b0713          	mv	a4,s6
80008f48:	00048613          	mv	a2,s1
80008f4c:	01012b03          	lw	s6,16(sp)
80008f50:	02412483          	lw	s1,36(sp)
80008f54:	00090593          	mv	a1,s2
80008f58:	02012903          	lw	s2,32(sp)
80008f5c:	a2418693          	addi	a3,gp,-1500 # 80003494 <ip_data+0x10>
80008f60:	03010113          	addi	sp,sp,48
80008f64:	00030067          	jr	t1
80008f68:	020a9c63          	bnez	s5,80008fa0 <udp_input+0x2c4>
80008f6c:	014a2783          	lw	a5,20(s4)
80008f70:	0e000713          	li	a4,224
80008f74:	0f07f793          	andi	a5,a5,240
80008f78:	02e78463          	beq	a5,a4,80008fa0 <udp_input+0x2c4>
80008f7c:	00ca5583          	lhu	a1,12(s4)
80008f80:	00048513          	mv	a0,s1
80008f84:	00858593          	addi	a1,a1,8
80008f88:	01059593          	slli	a1,a1,0x10
80008f8c:	4105d593          	srai	a1,a1,0x10
80008f90:	951fe0ef          	jal	ra,800078e0 <pbuf_header_force>
80008f94:	00300593          	li	a1,3
80008f98:	00048513          	mv	a0,s1
80008f9c:	264030ef          	jal	ra,8000c200 <icmp_dest_unreach>
80008fa0:	11042783          	lw	a5,272(s0)
80008fa4:	00178793          	addi	a5,a5,1
80008fa8:	10f42823          	sw	a5,272(s0)
80008fac:	f29ff06f          	j	80008ed4 <udp_input+0x1f8>

80008fb0 <udp_bind>:
80008fb0:	00059463          	bnez	a1,80008fb8 <udp_bind+0x8>
80008fb4:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
80008fb8:	ff000793          	li	a5,-16
80008fbc:	0a050463          	beqz	a0,80009064 <udp_bind+0xb4>
80008fc0:	9041a783          	lw	a5,-1788(gp) # 80003374 <udp_pcbs>
80008fc4:	00078693          	mv	a3,a5
80008fc8:	06069063          	bnez	a3,80009028 <udp_bind+0x78>
80008fcc:	00000e13          	li	t3,0
80008fd0:	0c061463          	bnez	a2,80009098 <udp_bind+0xe8>
80008fd4:	800036b7          	lui	a3,0x80003
80008fd8:	2746d603          	lhu	a2,628(a3) # 80003274 <_ram_heap_end+0xfffeb274>
80008fdc:	00010337          	lui	t1,0x10
80008fe0:	00004837          	lui	a6,0x4
80008fe4:	fff30313          	addi	t1,t1,-1 # ffff <_stack_size+0xefff>
80008fe8:	04660a63          	beq	a2,t1,8000903c <udp_bind+0x8c>
80008fec:	00160613          	addi	a2,a2,1
80008ff0:	01061613          	slli	a2,a2,0x10
80008ff4:	01065613          	srli	a2,a2,0x10
80008ff8:	00078893          	mv	a7,a5
80008ffc:	04089463          	bnez	a7,80009044 <udp_bind+0x94>
80009000:	26c69a23          	sh	a2,628(a3)
80009004:	0005a783          	lw	a5,0(a1)
80009008:	00c51b23          	sh	a2,22(a0)
8000900c:	00f52023          	sw	a5,0(a0)
80009010:	000e1863          	bnez	t3,80009020 <udp_bind+0x70>
80009014:	9041a783          	lw	a5,-1788(gp) # 80003374 <udp_pcbs>
80009018:	90a1a223          	sw	a0,-1788(gp) # 80003374 <udp_pcbs>
8000901c:	00f52823          	sw	a5,16(a0)
80009020:	00000793          	li	a5,0
80009024:	0400006f          	j	80009064 <udp_bind+0xb4>
80009028:	00a68663          	beq	a3,a0,80009034 <udp_bind+0x84>
8000902c:	0106a683          	lw	a3,16(a3)
80009030:	f99ff06f          	j	80008fc8 <udp_bind+0x18>
80009034:	00100e13          	li	t3,1
80009038:	f99ff06f          	j	80008fd0 <udp_bind+0x20>
8000903c:	0000c637          	lui	a2,0xc
80009040:	fb9ff06f          	j	80008ff8 <udp_bind+0x48>
80009044:	0168de83          	lhu	t4,22(a7)
80009048:	02ce9263          	bne	t4,a2,8000906c <udp_bind+0xbc>
8000904c:	fff80813          	addi	a6,a6,-1 # 3fff <_stack_size+0x2fff>
80009050:	01081813          	slli	a6,a6,0x10
80009054:	01085813          	srli	a6,a6,0x10
80009058:	f80818e3          	bnez	a6,80008fe8 <udp_bind+0x38>
8000905c:	26c69a23          	sh	a2,628(a3)
80009060:	ff800793          	li	a5,-8
80009064:	00078513          	mv	a0,a5
80009068:	00008067          	ret
8000906c:	0108a883          	lw	a7,16(a7)
80009070:	f8dff06f          	j	80008ffc <udp_bind+0x4c>
80009074:	02a78063          	beq	a5,a0,80009094 <udp_bind+0xe4>
80009078:	0167d683          	lhu	a3,22(a5)
8000907c:	00c69c63          	bne	a3,a2,80009094 <udp_bind+0xe4>
80009080:	0005a803          	lw	a6,0(a1)
80009084:	0007a683          	lw	a3,0(a5)
80009088:	fd068ce3          	beq	a3,a6,80009060 <udp_bind+0xb0>
8000908c:	fc080ae3          	beqz	a6,80009060 <udp_bind+0xb0>
80009090:	fc0688e3          	beqz	a3,80009060 <udp_bind+0xb0>
80009094:	0107a783          	lw	a5,16(a5)
80009098:	fc079ee3          	bnez	a5,80009074 <udp_bind+0xc4>
8000909c:	f69ff06f          	j	80009004 <udp_bind+0x54>

800090a0 <udp_sendto_if_src>:
800090a0:	fd010113          	addi	sp,sp,-48
800090a4:	02912223          	sw	s1,36(sp)
800090a8:	02112623          	sw	ra,44(sp)
800090ac:	02812423          	sw	s0,40(sp)
800090b0:	03212023          	sw	s2,32(sp)
800090b4:	01312e23          	sw	s3,28(sp)
800090b8:	01412c23          	sw	s4,24(sp)
800090bc:	01512a23          	sw	s5,20(sp)
800090c0:	01612823          	sw	s6,16(sp)
800090c4:	01712623          	sw	s7,12(sp)
800090c8:	ff000493          	li	s1,-16
800090cc:	08050263          	beqz	a0,80009150 <udp_sendto_if_src+0xb0>
800090d0:	08058063          	beqz	a1,80009150 <udp_sendto_if_src+0xb0>
800090d4:	06060e63          	beqz	a2,80009150 <udp_sendto_if_src+0xb0>
800090d8:	06078c63          	beqz	a5,80009150 <udp_sendto_if_src+0xb0>
800090dc:	06070a63          	beqz	a4,80009150 <udp_sendto_if_src+0xb0>
800090e0:	00078b13          	mv	s6,a5
800090e4:	00954783          	lbu	a5,9(a0)
800090e8:	00070a13          	mv	s4,a4
800090ec:	00068b93          	mv	s7,a3
800090f0:	0207f793          	andi	a5,a5,32
800090f4:	00060a93          	mv	s5,a2
800090f8:	00058993          	mv	s3,a1
800090fc:	00050413          	mv	s0,a0
80009100:	02078e63          	beqz	a5,8000913c <udp_sendto_if_src+0x9c>
80009104:	01645783          	lhu	a5,22(s0)
80009108:	00079e63          	bnez	a5,80009124 <udp_sendto_if_src+0x84>
8000910c:	00000613          	li	a2,0
80009110:	00040593          	mv	a1,s0
80009114:	00040513          	mv	a0,s0
80009118:	e99ff0ef          	jal	ra,80008fb0 <udp_bind>
8000911c:	00050493          	mv	s1,a0
80009120:	02051863          	bnez	a0,80009150 <udp_sendto_if_src+0xb0>
80009124:	0089d703          	lhu	a4,8(s3)
80009128:	000107b7          	lui	a5,0x10
8000912c:	ff778793          	addi	a5,a5,-9 # fff7 <_stack_size+0xeff7>
80009130:	04e7f863          	bgeu	a5,a4,80009180 <udp_sendto_if_src+0xe0>
80009134:	fff00493          	li	s1,-1
80009138:	0180006f          	j	80009150 <udp_sendto_if_src+0xb0>
8000913c:	00062503          	lw	a0,0(a2) # c000 <_stack_size+0xb000>
80009140:	00070593          	mv	a1,a4
80009144:	ffa00493          	li	s1,-6
80009148:	559030ef          	jal	ra,8000cea0 <ip4_addr_isbroadcast_u32>
8000914c:	fa050ce3          	beqz	a0,80009104 <udp_sendto_if_src+0x64>
80009150:	02c12083          	lw	ra,44(sp)
80009154:	02812403          	lw	s0,40(sp)
80009158:	00048513          	mv	a0,s1
8000915c:	02012903          	lw	s2,32(sp)
80009160:	02412483          	lw	s1,36(sp)
80009164:	01c12983          	lw	s3,28(sp)
80009168:	01812a03          	lw	s4,24(sp)
8000916c:	01412a83          	lw	s5,20(sp)
80009170:	01012b03          	lw	s6,16(sp)
80009174:	00c12b83          	lw	s7,12(sp)
80009178:	03010113          	addi	sp,sp,48
8000917c:	00008067          	ret
80009180:	00800593          	li	a1,8
80009184:	00098513          	mv	a0,s3
80009188:	ed4fe0ef          	jal	ra,8000785c <pbuf_add_header>
8000918c:	10050063          	beqz	a0,8000928c <udp_sendto_if_src+0x1ec>
80009190:	28000613          	li	a2,640
80009194:	00800593          	li	a1,8
80009198:	02400513          	li	a0,36
8000919c:	82dfe0ef          	jal	ra,800079c8 <pbuf_alloc>
800091a0:	00050913          	mv	s2,a0
800091a4:	f80508e3          	beqz	a0,80009134 <udp_sendto_if_src+0x94>
800091a8:	0089d783          	lhu	a5,8(s3)
800091ac:	00078663          	beqz	a5,800091b8 <udp_sendto_if_src+0x118>
800091b0:	00098593          	mv	a1,s3
800091b4:	b99fe0ef          	jal	ra,80007d4c <pbuf_chain>
800091b8:	01645503          	lhu	a0,22(s0)
800091bc:	00492483          	lw	s1,4(s2)
800091c0:	d10fd0ef          	jal	ra,800066d0 <lwip_htons>
800091c4:	00a48023          	sb	a0,0(s1)
800091c8:	00855513          	srli	a0,a0,0x8
800091cc:	00a480a3          	sb	a0,1(s1)
800091d0:	000b8513          	mv	a0,s7
800091d4:	cfcfd0ef          	jal	ra,800066d0 <lwip_htons>
800091d8:	00a48123          	sb	a0,2(s1)
800091dc:	00855513          	srli	a0,a0,0x8
800091e0:	00a481a3          	sb	a0,3(s1)
800091e4:	00048323          	sb	zero,6(s1)
800091e8:	000483a3          	sb	zero,7(s1)
800091ec:	00895503          	lhu	a0,8(s2)
800091f0:	ce0fd0ef          	jal	ra,800066d0 <lwip_htons>
800091f4:	00a48223          	sb	a0,4(s1)
800091f8:	00855513          	srli	a0,a0,0x8
800091fc:	00a482a3          	sb	a0,5(s1)
80009200:	01444783          	lbu	a5,20(s0)
80009204:	0017f793          	andi	a5,a5,1
80009208:	02079a63          	bnez	a5,8000923c <udp_sendto_if_src+0x19c>
8000920c:	00895603          	lhu	a2,8(s2)
80009210:	000a8713          	mv	a4,s5
80009214:	000b0693          	mv	a3,s6
80009218:	01100593          	li	a1,17
8000921c:	00090513          	mv	a0,s2
80009220:	911fd0ef          	jal	ra,80006b30 <ip_chksum_pseudo>
80009224:	00051663          	bnez	a0,80009230 <udp_sendto_if_src+0x190>
80009228:	00010537          	lui	a0,0x10
8000922c:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xefff>
80009230:	00a48323          	sb	a0,6(s1)
80009234:	00855513          	srli	a0,a0,0x8
80009238:	00a483a3          	sb	a0,7(s1)
8000923c:	00c40793          	addi	a5,s0,12
80009240:	00b44683          	lbu	a3,11(s0)
80009244:	02fa2e23          	sw	a5,60(s4)
80009248:	00a44703          	lbu	a4,10(s0)
8000924c:	000a0813          	mv	a6,s4
80009250:	01100793          	li	a5,17
80009254:	000a8613          	mv	a2,s5
80009258:	000b0593          	mv	a1,s6
8000925c:	00090513          	mv	a0,s2
80009260:	0d1030ef          	jal	ra,8000cb30 <ip4_output_if_src>
80009264:	020a2e23          	sw	zero,60(s4)
80009268:	00050493          	mv	s1,a0
8000926c:	01390663          	beq	s2,s3,80009278 <udp_sendto_if_src+0x1d8>
80009270:	00090513          	mv	a0,s2
80009274:	e80fe0ef          	jal	ra,800078f4 <pbuf_free>
80009278:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000927c:	0f07a703          	lw	a4,240(a5)
80009280:	00170713          	addi	a4,a4,1
80009284:	0ee7a823          	sw	a4,240(a5)
80009288:	ec9ff06f          	j	80009150 <udp_sendto_if_src+0xb0>
8000928c:	00098913          	mv	s2,s3
80009290:	f29ff06f          	j	800091b8 <udp_sendto_if_src+0x118>

80009294 <udp_sendto_if>:
80009294:	02050e63          	beqz	a0,800092d0 <udp_sendto_if+0x3c>
80009298:	02058c63          	beqz	a1,800092d0 <udp_sendto_if+0x3c>
8000929c:	02060a63          	beqz	a2,800092d0 <udp_sendto_if+0x3c>
800092a0:	02070863          	beqz	a4,800092d0 <udp_sendto_if+0x3c>
800092a4:	00052783          	lw	a5,0(a0)
800092a8:	00078863          	beqz	a5,800092b8 <udp_sendto_if+0x24>
800092ac:	0f07f813          	andi	a6,a5,240
800092b0:	0e000893          	li	a7,224
800092b4:	01181663          	bne	a6,a7,800092c0 <udp_sendto_if+0x2c>
800092b8:	00470793          	addi	a5,a4,4
800092bc:	de5ff06f          	j	800090a0 <udp_sendto_if_src>
800092c0:	00472803          	lw	a6,4(a4)
800092c4:	01079a63          	bne	a5,a6,800092d8 <udp_sendto_if+0x44>
800092c8:	00050793          	mv	a5,a0
800092cc:	ff1ff06f          	j	800092bc <udp_sendto_if+0x28>
800092d0:	ff000513          	li	a0,-16
800092d4:	00008067          	ret
800092d8:	ffc00513          	li	a0,-4
800092dc:	00008067          	ret

800092e0 <udp_sendto>:
800092e0:	0a050863          	beqz	a0,80009390 <udp_sendto+0xb0>
800092e4:	0a058663          	beqz	a1,80009390 <udp_sendto+0xb0>
800092e8:	0a060463          	beqz	a2,80009390 <udp_sendto+0xb0>
800092ec:	fe010113          	addi	sp,sp,-32
800092f0:	00812c23          	sw	s0,24(sp)
800092f4:	00912a23          	sw	s1,20(sp)
800092f8:	01212823          	sw	s2,16(sp)
800092fc:	01312623          	sw	s3,12(sp)
80009300:	00112e23          	sw	ra,28(sp)
80009304:	00050413          	mv	s0,a0
80009308:	00854503          	lbu	a0,8(a0)
8000930c:	00068993          	mv	s3,a3
80009310:	00060493          	mv	s1,a2
80009314:	00058913          	mv	s2,a1
80009318:	02050e63          	beqz	a0,80009354 <udp_sendto+0x74>
8000931c:	a9cfe0ef          	jal	ra,800075b8 <netif_get_by_index>
80009320:	04051063          	bnez	a0,80009360 <udp_sendto+0x80>
80009324:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
80009328:	10c7a703          	lw	a4,268(a5)
8000932c:	ffc00513          	li	a0,-4
80009330:	00170713          	addi	a4,a4,1
80009334:	10e7a623          	sw	a4,268(a5)
80009338:	01c12083          	lw	ra,28(sp)
8000933c:	01812403          	lw	s0,24(sp)
80009340:	01412483          	lw	s1,20(sp)
80009344:	01012903          	lw	s2,16(sp)
80009348:	00c12983          	lw	s3,12(sp)
8000934c:	02010113          	addi	sp,sp,32
80009350:	00008067          	ret
80009354:	00060513          	mv	a0,a2
80009358:	384030ef          	jal	ra,8000c6dc <ip4_route>
8000935c:	fc5ff06f          	j	80009320 <udp_sendto+0x40>
80009360:	00050713          	mv	a4,a0
80009364:	00040513          	mv	a0,s0
80009368:	01812403          	lw	s0,24(sp)
8000936c:	01c12083          	lw	ra,28(sp)
80009370:	00098693          	mv	a3,s3
80009374:	00048613          	mv	a2,s1
80009378:	00c12983          	lw	s3,12(sp)
8000937c:	01412483          	lw	s1,20(sp)
80009380:	00090593          	mv	a1,s2
80009384:	01012903          	lw	s2,16(sp)
80009388:	02010113          	addi	sp,sp,32
8000938c:	f09ff06f          	j	80009294 <udp_sendto_if>
80009390:	ff000513          	li	a0,-16
80009394:	00008067          	ret

80009398 <udp_send>:
80009398:	00050a63          	beqz	a0,800093ac <udp_send+0x14>
8000939c:	00058863          	beqz	a1,800093ac <udp_send+0x14>
800093a0:	01855683          	lhu	a3,24(a0)
800093a4:	00450613          	addi	a2,a0,4
800093a8:	f39ff06f          	j	800092e0 <udp_sendto>
800093ac:	ff000513          	li	a0,-16
800093b0:	00008067          	ret

800093b4 <udp_bind_netif>:
800093b4:	00000793          	li	a5,0
800093b8:	00058863          	beqz	a1,800093c8 <udp_bind_netif+0x14>
800093bc:	0385c783          	lbu	a5,56(a1)
800093c0:	00178793          	addi	a5,a5,1
800093c4:	0ff7f793          	andi	a5,a5,255
800093c8:	00f50423          	sb	a5,8(a0)
800093cc:	00008067          	ret

800093d0 <udp_connect>:
800093d0:	ff000793          	li	a5,-16
800093d4:	0a050063          	beqz	a0,80009474 <udp_connect+0xa4>
800093d8:	08058e63          	beqz	a1,80009474 <udp_connect+0xa4>
800093dc:	ff010113          	addi	sp,sp,-16
800093e0:	00812423          	sw	s0,8(sp)
800093e4:	00912223          	sw	s1,4(sp)
800093e8:	01212023          	sw	s2,0(sp)
800093ec:	00112623          	sw	ra,12(sp)
800093f0:	01655783          	lhu	a5,22(a0)
800093f4:	00050413          	mv	s0,a0
800093f8:	00060913          	mv	s2,a2
800093fc:	00058493          	mv	s1,a1
80009400:	02078c63          	beqz	a5,80009438 <udp_connect+0x68>
80009404:	0004a783          	lw	a5,0(s1)
80009408:	01241c23          	sh	s2,24(s0)
8000940c:	00f42223          	sw	a5,4(s0)
80009410:	01444783          	lbu	a5,20(s0)
80009414:	0047e793          	ori	a5,a5,4
80009418:	00f40a23          	sb	a5,20(s0)
8000941c:	9041a683          	lw	a3,-1788(gp) # 80003374 <udp_pcbs>
80009420:	00068713          	mv	a4,a3
80009424:	04071263          	bnez	a4,80009468 <udp_connect+0x98>
80009428:	00d42823          	sw	a3,16(s0)
8000942c:	9081a223          	sw	s0,-1788(gp) # 80003374 <udp_pcbs>
80009430:	00000793          	li	a5,0
80009434:	0180006f          	j	8000944c <udp_connect+0x7c>
80009438:	00000613          	li	a2,0
8000943c:	00050593          	mv	a1,a0
80009440:	b71ff0ef          	jal	ra,80008fb0 <udp_bind>
80009444:	00050793          	mv	a5,a0
80009448:	fa050ee3          	beqz	a0,80009404 <udp_connect+0x34>
8000944c:	00c12083          	lw	ra,12(sp)
80009450:	00812403          	lw	s0,8(sp)
80009454:	00412483          	lw	s1,4(sp)
80009458:	00012903          	lw	s2,0(sp)
8000945c:	00078513          	mv	a0,a5
80009460:	01010113          	addi	sp,sp,16
80009464:	00008067          	ret
80009468:	fc8704e3          	beq	a4,s0,80009430 <udp_connect+0x60>
8000946c:	01072703          	lw	a4,16(a4)
80009470:	fb5ff06f          	j	80009424 <udp_connect+0x54>
80009474:	00078513          	mv	a0,a5
80009478:	00008067          	ret

8000947c <udp_disconnect>:
8000947c:	00050e63          	beqz	a0,80009498 <udp_disconnect+0x1c>
80009480:	01454783          	lbu	a5,20(a0)
80009484:	00052223          	sw	zero,4(a0)
80009488:	00051c23          	sh	zero,24(a0)
8000948c:	ffb7f793          	andi	a5,a5,-5
80009490:	00050423          	sb	zero,8(a0)
80009494:	00f50a23          	sb	a5,20(a0)
80009498:	00008067          	ret

8000949c <udp_recv>:
8000949c:	00050663          	beqz	a0,800094a8 <udp_recv+0xc>
800094a0:	00b52e23          	sw	a1,28(a0)
800094a4:	02c52023          	sw	a2,32(a0)
800094a8:	00008067          	ret

800094ac <udp_remove>:
800094ac:	00050593          	mv	a1,a0
800094b0:	02050e63          	beqz	a0,800094ec <udp_remove+0x40>
800094b4:	9041a783          	lw	a5,-1788(gp) # 80003374 <udp_pcbs>
800094b8:	00a79c63          	bne	a5,a0,800094d0 <udp_remove+0x24>
800094bc:	01052783          	lw	a5,16(a0)
800094c0:	90f1a223          	sw	a5,-1788(gp) # 80003374 <udp_pcbs>
800094c4:	00100513          	li	a0,1
800094c8:	b79fd06f          	j	80007040 <memp_free>
800094cc:	00070793          	mv	a5,a4
800094d0:	fe078ae3          	beqz	a5,800094c4 <udp_remove+0x18>
800094d4:	0107a703          	lw	a4,16(a5)
800094d8:	fe0706e3          	beqz	a4,800094c4 <udp_remove+0x18>
800094dc:	feb718e3          	bne	a4,a1,800094cc <udp_remove+0x20>
800094e0:	0105a703          	lw	a4,16(a1)
800094e4:	00e7a823          	sw	a4,16(a5)
800094e8:	fddff06f          	j	800094c4 <udp_remove+0x18>
800094ec:	00008067          	ret

800094f0 <udp_new>:
800094f0:	800035b7          	lui	a1,0x80003
800094f4:	ff010113          	addi	sp,sp,-16
800094f8:	4c800613          	li	a2,1224
800094fc:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xfffeaf0c>
80009500:	00100513          	li	a0,1
80009504:	00812423          	sw	s0,8(sp)
80009508:	00112623          	sw	ra,12(sp)
8000950c:	afdfd0ef          	jal	ra,80007008 <memp_malloc_fn>
80009510:	00050413          	mv	s0,a0
80009514:	00050c63          	beqz	a0,8000952c <udp_new+0x3c>
80009518:	02400613          	li	a2,36
8000951c:	00000593          	li	a1,0
80009520:	038040ef          	jal	ra,8000d558 <memset>
80009524:	fff00793          	li	a5,-1
80009528:	00f405a3          	sb	a5,11(s0)
8000952c:	00040513          	mv	a0,s0
80009530:	00c12083          	lw	ra,12(sp)
80009534:	00812403          	lw	s0,8(sp)
80009538:	01010113          	addi	sp,sp,16
8000953c:	00008067          	ret

80009540 <udp_new_ip_type>:
80009540:	fb1ff06f          	j	800094f0 <udp_new>

80009544 <udp_netif_ip_addr_changed>:
80009544:	02050063          	beqz	a0,80009564 <udp_netif_ip_addr_changed+0x20>
80009548:	00052783          	lw	a5,0(a0)
8000954c:	00078c63          	beqz	a5,80009564 <udp_netif_ip_addr_changed+0x20>
80009550:	00058a63          	beqz	a1,80009564 <udp_netif_ip_addr_changed+0x20>
80009554:	0005a783          	lw	a5,0(a1)
80009558:	00078663          	beqz	a5,80009564 <udp_netif_ip_addr_changed+0x20>
8000955c:	9041a783          	lw	a5,-1788(gp) # 80003374 <udp_pcbs>
80009560:	00079463          	bnez	a5,80009568 <udp_netif_ip_addr_changed+0x24>
80009564:	00008067          	ret
80009568:	0007a683          	lw	a3,0(a5)
8000956c:	00052703          	lw	a4,0(a0)
80009570:	00e69663          	bne	a3,a4,8000957c <udp_netif_ip_addr_changed+0x38>
80009574:	0005a703          	lw	a4,0(a1)
80009578:	00e7a023          	sw	a4,0(a5)
8000957c:	0107a783          	lw	a5,16(a5)
80009580:	fe1ff06f          	j	80009560 <udp_netif_ip_addr_changed+0x1c>

80009584 <dhcp_set_state>:
80009584:	00554783          	lbu	a5,5(a0)
80009588:	00b78863          	beq	a5,a1,80009598 <dhcp_set_state+0x14>
8000958c:	00b502a3          	sb	a1,5(a0)
80009590:	00050323          	sb	zero,6(a0)
80009594:	00051423          	sh	zero,8(a0)
80009598:	00008067          	ret

8000959c <dhcp_option_short>:
8000959c:	00a587b3          	add	a5,a1,a0
800095a0:	00865713          	srli	a4,a2,0x8
800095a4:	00e78023          	sb	a4,0(a5)
800095a8:	00150793          	addi	a5,a0,1
800095ac:	01079793          	slli	a5,a5,0x10
800095b0:	0107d793          	srli	a5,a5,0x10
800095b4:	00250513          	addi	a0,a0,2
800095b8:	00f585b3          	add	a1,a1,a5
800095bc:	01051513          	slli	a0,a0,0x10
800095c0:	00c58023          	sb	a2,0(a1)
800095c4:	01055513          	srli	a0,a0,0x10
800095c8:	00008067          	ret

800095cc <dhcp_option_long>:
800095cc:	00a587b3          	add	a5,a1,a0
800095d0:	01865713          	srli	a4,a2,0x18
800095d4:	00e78023          	sb	a4,0(a5)
800095d8:	00150793          	addi	a5,a0,1
800095dc:	01079793          	slli	a5,a5,0x10
800095e0:	0107d793          	srli	a5,a5,0x10
800095e4:	00f587b3          	add	a5,a1,a5
800095e8:	01065713          	srli	a4,a2,0x10
800095ec:	00e78023          	sb	a4,0(a5)
800095f0:	00250793          	addi	a5,a0,2
800095f4:	01079793          	slli	a5,a5,0x10
800095f8:	0107d793          	srli	a5,a5,0x10
800095fc:	00f587b3          	add	a5,a1,a5
80009600:	00865713          	srli	a4,a2,0x8
80009604:	00e78023          	sb	a4,0(a5)
80009608:	00350793          	addi	a5,a0,3
8000960c:	01079793          	slli	a5,a5,0x10
80009610:	0107d793          	srli	a5,a5,0x10
80009614:	00450513          	addi	a0,a0,4
80009618:	00f585b3          	add	a1,a1,a5
8000961c:	01051513          	slli	a0,a0,0x10
80009620:	00c58023          	sb	a2,0(a1)
80009624:	01055513          	srli	a0,a0,0x10
80009628:	00008067          	ret

8000962c <dhcp_create_msg>:
8000962c:	fe010113          	addi	sp,sp,-32
80009630:	00112e23          	sw	ra,28(sp)
80009634:	00812c23          	sw	s0,24(sp)
80009638:	00912a23          	sw	s1,20(sp)
8000963c:	01212823          	sw	s2,16(sp)
80009640:	01312623          	sw	s3,12(sp)
80009644:	01412423          	sw	s4,8(sp)
80009648:	01512223          	sw	s5,4(sp)
8000964c:	01612023          	sw	s6,0(sp)
80009650:	02051a63          	bnez	a0,80009684 <dhcp_create_msg+0x58>
80009654:	00000a93          	li	s5,0
80009658:	01c12083          	lw	ra,28(sp)
8000965c:	01812403          	lw	s0,24(sp)
80009660:	000a8513          	mv	a0,s5
80009664:	01412483          	lw	s1,20(sp)
80009668:	01012903          	lw	s2,16(sp)
8000966c:	00c12983          	lw	s3,12(sp)
80009670:	00812a03          	lw	s4,8(sp)
80009674:	00412a83          	lw	s5,4(sp)
80009678:	00012b03          	lw	s6,0(sp)
8000967c:	02010113          	addi	sp,sp,32
80009680:	00008067          	ret
80009684:	fc0588e3          	beqz	a1,80009654 <dhcp_create_msg+0x28>
80009688:	00060913          	mv	s2,a2
8000968c:	00058993          	mv	s3,a1
80009690:	00050493          	mv	s1,a0
80009694:	28000613          	li	a2,640
80009698:	13400593          	li	a1,308
8000969c:	03800513          	li	a0,56
800096a0:	00068a13          	mv	s4,a3
800096a4:	b24fe0ef          	jal	ra,800079c8 <pbuf_alloc>
800096a8:	00050a93          	mv	s5,a0
800096ac:	fa0504e3          	beqz	a0,80009654 <dhcp_create_msg+0x28>
800096b0:	00300793          	li	a5,3
800096b4:	00f91663          	bne	s2,a5,800096c0 <dhcp_create_msg+0x94>
800096b8:	0059c783          	lbu	a5,5(s3)
800096bc:	03279063          	bne	a5,s2,800096dc <dhcp_create_msg+0xb0>
800096c0:	0069c703          	lbu	a4,6(s3)
800096c4:	00071863          	bnez	a4,800096d4 <dhcp_create_msg+0xa8>
800096c8:	8081a703          	lw	a4,-2040(gp) # 80003278 <xid.4813>
800096cc:	00170713          	addi	a4,a4,1
800096d0:	80e1a423          	sw	a4,-2040(gp) # 80003278 <xid.4813>
800096d4:	8081a783          	lw	a5,-2040(gp) # 80003278 <xid.4813>
800096d8:	00f9a023          	sw	a5,0(s3)
800096dc:	004aa403          	lw	s0,4(s5)
800096e0:	13400613          	li	a2,308
800096e4:	00000593          	li	a1,0
800096e8:	00100b13          	li	s6,1
800096ec:	00040513          	mv	a0,s0
800096f0:	669030ef          	jal	ra,8000d558 <memset>
800096f4:	01640023          	sb	s6,0(s0)
800096f8:	016400a3          	sb	s6,1(s0)
800096fc:	0344c783          	lbu	a5,52(s1)
80009700:	00f40123          	sb	a5,2(s0)
80009704:	0009a503          	lw	a0,0(s3)
80009708:	fe1fc0ef          	jal	ra,800066e8 <lwip_htonl>
8000970c:	00855793          	srli	a5,a0,0x8
80009710:	00a40223          	sb	a0,4(s0)
80009714:	00f402a3          	sb	a5,5(s0)
80009718:	01055793          	srli	a5,a0,0x10
8000971c:	01855513          	srli	a0,a0,0x18
80009720:	00f40323          	sb	a5,6(s0)
80009724:	00a403a3          	sb	a0,7(s0)
80009728:	00400793          	li	a5,4
8000972c:	02f90463          	beq	s2,a5,80009754 <dhcp_create_msg+0x128>
80009730:	ff990793          	addi	a5,s2,-7
80009734:	0ff7f793          	andi	a5,a5,255
80009738:	00fb7e63          	bgeu	s6,a5,80009754 <dhcp_create_msg+0x128>
8000973c:	00300793          	li	a5,3
80009740:	02f91a63          	bne	s2,a5,80009774 <dhcp_create_msg+0x148>
80009744:	0059c783          	lbu	a5,5(s3)
80009748:	ffc78793          	addi	a5,a5,-4
8000974c:	0ff7f793          	andi	a5,a5,255
80009750:	02fb6263          	bltu	s6,a5,80009774 <dhcp_create_msg+0x148>
80009754:	0044a783          	lw	a5,4(s1)
80009758:	0087d713          	srli	a4,a5,0x8
8000975c:	00f40623          	sb	a5,12(s0)
80009760:	00e406a3          	sb	a4,13(s0)
80009764:	0107d713          	srli	a4,a5,0x10
80009768:	0187d793          	srli	a5,a5,0x18
8000976c:	00e40723          	sb	a4,14(s0)
80009770:	00f407a3          	sb	a5,15(s0)
80009774:	02e48793          	addi	a5,s1,46
80009778:	01c40713          	addi	a4,s0,28
8000977c:	03448493          	addi	s1,s1,52
80009780:	0007c683          	lbu	a3,0(a5)
80009784:	00178793          	addi	a5,a5,1
80009788:	00170713          	addi	a4,a4,1
8000978c:	fed70fa3          	sb	a3,-1(a4)
80009790:	fe9798e3          	bne	a5,s1,80009780 <dhcp_create_msg+0x154>
80009794:	06300793          	li	a5,99
80009798:	0ef40623          	sb	a5,236(s0)
8000979c:	f8200713          	li	a4,-126
800097a0:	0ef407a3          	sb	a5,239(s0)
800097a4:	03500793          	li	a5,53
800097a8:	0ee406a3          	sb	a4,237(s0)
800097ac:	0ef40823          	sb	a5,240(s0)
800097b0:	05300713          	li	a4,83
800097b4:	00100793          	li	a5,1
800097b8:	0ef408a3          	sb	a5,241(s0)
800097bc:	0ee40723          	sb	a4,238(s0)
800097c0:	0f240923          	sb	s2,242(s0)
800097c4:	00300793          	li	a5,3
800097c8:	00fa1023          	sh	a5,0(s4)
800097cc:	e8dff06f          	j	80009658 <dhcp_create_msg+0x2c>

800097d0 <dhcp_option_trailer>:
800097d0:	00150793          	addi	a5,a0,1
800097d4:	01079793          	slli	a5,a5,0x10
800097d8:	00a58733          	add	a4,a1,a0
800097dc:	0107d793          	srli	a5,a5,0x10
800097e0:	fff00693          	li	a3,-1
800097e4:	00d70023          	sb	a3,0(a4)
800097e8:	00f585b3          	add	a1,a1,a5
800097ec:	04300713          	li	a4,67
800097f0:	00f77c63          	bgeu	a4,a5,80009808 <dhcp_option_trailer+0x38>
800097f4:	0f078593          	addi	a1,a5,240
800097f8:	01059593          	slli	a1,a1,0x10
800097fc:	0105d593          	srli	a1,a1,0x10
80009800:	00060513          	mv	a0,a2
80009804:	b94fe06f          	j	80007b98 <pbuf_realloc>
80009808:	00178793          	addi	a5,a5,1
8000980c:	01079793          	slli	a5,a5,0x10
80009810:	00058023          	sb	zero,0(a1)
80009814:	0107d793          	srli	a5,a5,0x10
80009818:	00158593          	addi	a1,a1,1
8000981c:	fd5ff06f          	j	800097f0 <dhcp_option_trailer+0x20>

80009820 <dhcp_reboot>:
80009820:	fd010113          	addi	sp,sp,-48
80009824:	02112623          	sw	ra,44(sp)
80009828:	02812423          	sw	s0,40(sp)
8000982c:	03212023          	sw	s2,32(sp)
80009830:	02912223          	sw	s1,36(sp)
80009834:	01312e23          	sw	s3,28(sp)
80009838:	01412c23          	sw	s4,24(sp)
8000983c:	02852483          	lw	s1,40(a0)
80009840:	00050913          	mv	s2,a0
80009844:	00300593          	li	a1,3
80009848:	00048513          	mv	a0,s1
8000984c:	d39ff0ef          	jal	ra,80009584 <dhcp_set_state>
80009850:	00e10693          	addi	a3,sp,14
80009854:	00300613          	li	a2,3
80009858:	00048593          	mv	a1,s1
8000985c:	00090513          	mv	a0,s2
80009860:	dcdff0ef          	jal	ra,8000962c <dhcp_create_msg>
80009864:	fff00413          	li	s0,-1
80009868:	14050663          	beqz	a0,800099b4 <dhcp_reboot+0x194>
8000986c:	00452403          	lw	s0,4(a0)
80009870:	00e15783          	lhu	a5,14(sp)
80009874:	00050993          	mv	s3,a0
80009878:	0f040413          	addi	s0,s0,240
8000987c:	00f40733          	add	a4,s0,a5
80009880:	00278513          	addi	a0,a5,2
80009884:	00178793          	addi	a5,a5,1
80009888:	01079793          	slli	a5,a5,0x10
8000988c:	03900693          	li	a3,57
80009890:	0107d793          	srli	a5,a5,0x10
80009894:	00d70023          	sb	a3,0(a4)
80009898:	00f407b3          	add	a5,s0,a5
8000989c:	00200713          	li	a4,2
800098a0:	01051513          	slli	a0,a0,0x10
800098a4:	00e78023          	sb	a4,0(a5)
800098a8:	00040593          	mv	a1,s0
800098ac:	24000613          	li	a2,576
800098b0:	01055513          	srli	a0,a0,0x10
800098b4:	00a11723          	sh	a0,14(sp)
800098b8:	ce5ff0ef          	jal	ra,8000959c <dhcp_option_short>
800098bc:	00a407b3          	add	a5,s0,a0
800098c0:	00250a13          	addi	s4,a0,2
800098c4:	00150513          	addi	a0,a0,1
800098c8:	01051513          	slli	a0,a0,0x10
800098cc:	03200713          	li	a4,50
800098d0:	01055513          	srli	a0,a0,0x10
800098d4:	00e78023          	sb	a4,0(a5)
800098d8:	00a40533          	add	a0,s0,a0
800098dc:	00400793          	li	a5,4
800098e0:	00f50023          	sb	a5,0(a0)
800098e4:	01c4a503          	lw	a0,28(s1)
800098e8:	010a1a13          	slli	s4,s4,0x10
800098ec:	010a5a13          	srli	s4,s4,0x10
800098f0:	01411723          	sh	s4,14(sp)
800098f4:	df5fc0ef          	jal	ra,800066e8 <lwip_htonl>
800098f8:	00050613          	mv	a2,a0
800098fc:	00040593          	mv	a1,s0
80009900:	000a0513          	mv	a0,s4
80009904:	cc9ff0ef          	jal	ra,800095cc <dhcp_option_long>
80009908:	00a40733          	add	a4,s0,a0
8000990c:	03700693          	li	a3,55
80009910:	00d70023          	sb	a3,0(a4)
80009914:	00150713          	addi	a4,a0,1
80009918:	01071713          	slli	a4,a4,0x10
8000991c:	01075713          	srli	a4,a4,0x10
80009920:	00300693          	li	a3,3
80009924:	00e40733          	add	a4,s0,a4
80009928:	00d70023          	sb	a3,0(a4)
8000992c:	00250713          	addi	a4,a0,2
80009930:	01071713          	slli	a4,a4,0x10
80009934:	01075713          	srli	a4,a4,0x10
80009938:	00e40733          	add	a4,s0,a4
8000993c:	00100613          	li	a2,1
80009940:	00c70023          	sb	a2,0(a4)
80009944:	00050793          	mv	a5,a0
80009948:	00350713          	addi	a4,a0,3
8000994c:	01071713          	slli	a4,a4,0x10
80009950:	00478793          	addi	a5,a5,4
80009954:	01075713          	srli	a4,a4,0x10
80009958:	01079793          	slli	a5,a5,0x10
8000995c:	00e40733          	add	a4,s0,a4
80009960:	00550513          	addi	a0,a0,5
80009964:	0107d793          	srli	a5,a5,0x10
80009968:	00d70023          	sb	a3,0(a4)
8000996c:	00f407b3          	add	a5,s0,a5
80009970:	01c00713          	li	a4,28
80009974:	01051513          	slli	a0,a0,0x10
80009978:	00e78023          	sb	a4,0(a5)
8000997c:	01055513          	srli	a0,a0,0x10
80009980:	00040593          	mv	a1,s0
80009984:	00098613          	mv	a2,s3
80009988:	00a11723          	sh	a0,14(sp)
8000998c:	e45ff0ef          	jal	ra,800097d0 <dhcp_option_trailer>
80009990:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
80009994:	00090713          	mv	a4,s2
80009998:	04300693          	li	a3,67
8000999c:	84418613          	addi	a2,gp,-1980 # 800032b4 <ip_addr_broadcast>
800099a0:	00098593          	mv	a1,s3
800099a4:	8f1ff0ef          	jal	ra,80009294 <udp_sendto_if>
800099a8:	00050413          	mv	s0,a0
800099ac:	00098513          	mv	a0,s3
800099b0:	f45fd0ef          	jal	ra,800078f4 <pbuf_free>
800099b4:	0064c783          	lbu	a5,6(s1)
800099b8:	0ff00713          	li	a4,255
800099bc:	00e78663          	beq	a5,a4,800099c8 <dhcp_reboot+0x1a8>
800099c0:	00178793          	addi	a5,a5,1
800099c4:	00f48323          	sb	a5,6(s1)
800099c8:	0064c503          	lbu	a0,6(s1)
800099cc:	00900793          	li	a5,9
800099d0:	04a7ea63          	bltu	a5,a0,80009a24 <dhcp_reboot+0x204>
800099d4:	00551793          	slli	a5,a0,0x5
800099d8:	40a787b3          	sub	a5,a5,a0
800099dc:	00279793          	slli	a5,a5,0x2
800099e0:	00f50533          	add	a0,a0,a5
800099e4:	00351513          	slli	a0,a0,0x3
800099e8:	01051513          	slli	a0,a0,0x10
800099ec:	01055513          	srli	a0,a0,0x10
800099f0:	1f400593          	li	a1,500
800099f4:	1f350513          	addi	a0,a0,499
800099f8:	268040ef          	jal	ra,8000dc60 <__divsi3>
800099fc:	00a49423          	sh	a0,8(s1)
80009a00:	02c12083          	lw	ra,44(sp)
80009a04:	00040513          	mv	a0,s0
80009a08:	02812403          	lw	s0,40(sp)
80009a0c:	02412483          	lw	s1,36(sp)
80009a10:	02012903          	lw	s2,32(sp)
80009a14:	01c12983          	lw	s3,28(sp)
80009a18:	01812a03          	lw	s4,24(sp)
80009a1c:	03010113          	addi	sp,sp,48
80009a20:	00008067          	ret
80009a24:	00002537          	lui	a0,0x2
80009a28:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1710>
80009a2c:	fc5ff06f          	j	800099f0 <dhcp_reboot+0x1d0>

80009a30 <dhcp_select>:
80009a30:	fd010113          	addi	sp,sp,-48
80009a34:	02812423          	sw	s0,40(sp)
80009a38:	02112623          	sw	ra,44(sp)
80009a3c:	02912223          	sw	s1,36(sp)
80009a40:	03212023          	sw	s2,32(sp)
80009a44:	01312e23          	sw	s3,28(sp)
80009a48:	01412c23          	sw	s4,24(sp)
80009a4c:	01512a23          	sw	s5,20(sp)
80009a50:	ff000413          	li	s0,-16
80009a54:	22050263          	beqz	a0,80009c78 <dhcp_select+0x248>
80009a58:	02852483          	lw	s1,40(a0)
80009a5c:	ffa00413          	li	s0,-6
80009a60:	20048c63          	beqz	s1,80009c78 <dhcp_select+0x248>
80009a64:	00050913          	mv	s2,a0
80009a68:	00100593          	li	a1,1
80009a6c:	00048513          	mv	a0,s1
80009a70:	b15ff0ef          	jal	ra,80009584 <dhcp_set_state>
80009a74:	00e10693          	addi	a3,sp,14
80009a78:	00300613          	li	a2,3
80009a7c:	00048593          	mv	a1,s1
80009a80:	00090513          	mv	a0,s2
80009a84:	ba9ff0ef          	jal	ra,8000962c <dhcp_create_msg>
80009a88:	00050993          	mv	s3,a0
80009a8c:	fff00413          	li	s0,-1
80009a90:	18050a63          	beqz	a0,80009c24 <dhcp_select+0x1f4>
80009a94:	00452403          	lw	s0,4(a0)
80009a98:	00e15783          	lhu	a5,14(sp)
80009a9c:	03900693          	li	a3,57
80009aa0:	0f040413          	addi	s0,s0,240
80009aa4:	00f40733          	add	a4,s0,a5
80009aa8:	00278513          	addi	a0,a5,2
80009aac:	00178793          	addi	a5,a5,1
80009ab0:	01079793          	slli	a5,a5,0x10
80009ab4:	0107d793          	srli	a5,a5,0x10
80009ab8:	00d70023          	sb	a3,0(a4)
80009abc:	00f407b3          	add	a5,s0,a5
80009ac0:	00200713          	li	a4,2
80009ac4:	00e78023          	sb	a4,0(a5)
80009ac8:	02c95603          	lhu	a2,44(s2)
80009acc:	01051513          	slli	a0,a0,0x10
80009ad0:	00040593          	mv	a1,s0
80009ad4:	01055513          	srli	a0,a0,0x10
80009ad8:	00a11723          	sh	a0,14(sp)
80009adc:	ac1ff0ef          	jal	ra,8000959c <dhcp_option_short>
80009ae0:	00a407b3          	add	a5,s0,a0
80009ae4:	03200713          	li	a4,50
80009ae8:	00e78023          	sb	a4,0(a5)
80009aec:	00150793          	addi	a5,a0,1
80009af0:	01079793          	slli	a5,a5,0x10
80009af4:	0107d793          	srli	a5,a5,0x10
80009af8:	00f407b3          	add	a5,s0,a5
80009afc:	00400a93          	li	s5,4
80009b00:	01578023          	sb	s5,0(a5)
80009b04:	00250a13          	addi	s4,a0,2
80009b08:	01c4a503          	lw	a0,28(s1)
80009b0c:	010a1a13          	slli	s4,s4,0x10
80009b10:	010a5a13          	srli	s4,s4,0x10
80009b14:	01411723          	sh	s4,14(sp)
80009b18:	bd1fc0ef          	jal	ra,800066e8 <lwip_htonl>
80009b1c:	00050613          	mv	a2,a0
80009b20:	00040593          	mv	a1,s0
80009b24:	000a0513          	mv	a0,s4
80009b28:	aa5ff0ef          	jal	ra,800095cc <dhcp_option_long>
80009b2c:	00a407b3          	add	a5,s0,a0
80009b30:	03600713          	li	a4,54
80009b34:	00e78023          	sb	a4,0(a5)
80009b38:	00150793          	addi	a5,a0,1
80009b3c:	01079793          	slli	a5,a5,0x10
80009b40:	0107d793          	srli	a5,a5,0x10
80009b44:	00f407b3          	add	a5,s0,a5
80009b48:	01578023          	sb	s5,0(a5)
80009b4c:	00250a13          	addi	s4,a0,2
80009b50:	0184a503          	lw	a0,24(s1)
80009b54:	010a1a13          	slli	s4,s4,0x10
80009b58:	010a5a13          	srli	s4,s4,0x10
80009b5c:	01411723          	sh	s4,14(sp)
80009b60:	b89fc0ef          	jal	ra,800066e8 <lwip_htonl>
80009b64:	00050613          	mv	a2,a0
80009b68:	00040593          	mv	a1,s0
80009b6c:	000a0513          	mv	a0,s4
80009b70:	a5dff0ef          	jal	ra,800095cc <dhcp_option_long>
80009b74:	00a40733          	add	a4,s0,a0
80009b78:	03700693          	li	a3,55
80009b7c:	00d70023          	sb	a3,0(a4)
80009b80:	00150713          	addi	a4,a0,1
80009b84:	01071713          	slli	a4,a4,0x10
80009b88:	01075713          	srli	a4,a4,0x10
80009b8c:	00300693          	li	a3,3
80009b90:	00e40733          	add	a4,s0,a4
80009b94:	00d70023          	sb	a3,0(a4)
80009b98:	00250713          	addi	a4,a0,2
80009b9c:	01071713          	slli	a4,a4,0x10
80009ba0:	01075713          	srli	a4,a4,0x10
80009ba4:	00e40733          	add	a4,s0,a4
80009ba8:	00100613          	li	a2,1
80009bac:	00c70023          	sb	a2,0(a4)
80009bb0:	00050793          	mv	a5,a0
80009bb4:	00350713          	addi	a4,a0,3
80009bb8:	01071713          	slli	a4,a4,0x10
80009bbc:	00478793          	addi	a5,a5,4
80009bc0:	01075713          	srli	a4,a4,0x10
80009bc4:	01079793          	slli	a5,a5,0x10
80009bc8:	00e40733          	add	a4,s0,a4
80009bcc:	00550513          	addi	a0,a0,5
80009bd0:	0107d793          	srli	a5,a5,0x10
80009bd4:	00d70023          	sb	a3,0(a4)
80009bd8:	00f407b3          	add	a5,s0,a5
80009bdc:	01c00713          	li	a4,28
80009be0:	01051513          	slli	a0,a0,0x10
80009be4:	00e78023          	sb	a4,0(a5)
80009be8:	01055513          	srli	a0,a0,0x10
80009bec:	00040593          	mv	a1,s0
80009bf0:	00098613          	mv	a2,s3
80009bf4:	00a11723          	sh	a0,14(sp)
80009bf8:	bd9ff0ef          	jal	ra,800097d0 <dhcp_option_trailer>
80009bfc:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
80009c00:	84818793          	addi	a5,gp,-1976 # 800032b8 <ip_addr_any>
80009c04:	00090713          	mv	a4,s2
80009c08:	04300693          	li	a3,67
80009c0c:	84418613          	addi	a2,gp,-1980 # 800032b4 <ip_addr_broadcast>
80009c10:	00098593          	mv	a1,s3
80009c14:	c8cff0ef          	jal	ra,800090a0 <udp_sendto_if_src>
80009c18:	00050413          	mv	s0,a0
80009c1c:	00098513          	mv	a0,s3
80009c20:	cd5fd0ef          	jal	ra,800078f4 <pbuf_free>
80009c24:	0064c783          	lbu	a5,6(s1)
80009c28:	0ff00713          	li	a4,255
80009c2c:	00e78663          	beq	a5,a4,80009c38 <dhcp_select+0x208>
80009c30:	00178793          	addi	a5,a5,1
80009c34:	00f48323          	sb	a5,6(s1)
80009c38:	0064c783          	lbu	a5,6(s1)
80009c3c:	00500713          	li	a4,5
80009c40:	06f76063          	bltu	a4,a5,80009ca0 <dhcp_select+0x270>
80009c44:	00100513          	li	a0,1
80009c48:	00f51533          	sll	a0,a0,a5
80009c4c:	00551793          	slli	a5,a0,0x5
80009c50:	40a787b3          	sub	a5,a5,a0
80009c54:	00279793          	slli	a5,a5,0x2
80009c58:	00f50533          	add	a0,a0,a5
80009c5c:	00351513          	slli	a0,a0,0x3
80009c60:	01051513          	slli	a0,a0,0x10
80009c64:	01055513          	srli	a0,a0,0x10
80009c68:	1f400593          	li	a1,500
80009c6c:	1f350513          	addi	a0,a0,499
80009c70:	7f1030ef          	jal	ra,8000dc60 <__divsi3>
80009c74:	00a49423          	sh	a0,8(s1)
80009c78:	00040513          	mv	a0,s0
80009c7c:	02c12083          	lw	ra,44(sp)
80009c80:	02812403          	lw	s0,40(sp)
80009c84:	02412483          	lw	s1,36(sp)
80009c88:	02012903          	lw	s2,32(sp)
80009c8c:	01c12983          	lw	s3,28(sp)
80009c90:	01812a03          	lw	s4,24(sp)
80009c94:	01412a83          	lw	s5,20(sp)
80009c98:	03010113          	addi	sp,sp,48
80009c9c:	00008067          	ret
80009ca0:	0000f537          	lui	a0,0xf
80009ca4:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xda60>
80009ca8:	fc1ff06f          	j	80009c68 <dhcp_select+0x238>

80009cac <dhcp_discover>:
80009cac:	fd010113          	addi	sp,sp,-48
80009cb0:	01312e23          	sw	s3,28(sp)
80009cb4:	02112623          	sw	ra,44(sp)
80009cb8:	02812423          	sw	s0,40(sp)
80009cbc:	02912223          	sw	s1,36(sp)
80009cc0:	03212023          	sw	s2,32(sp)
80009cc4:	02852483          	lw	s1,40(a0)
80009cc8:	00050993          	mv	s3,a0
80009ccc:	00600593          	li	a1,6
80009cd0:	00048513          	mv	a0,s1
80009cd4:	0004ae23          	sw	zero,28(s1)
80009cd8:	8adff0ef          	jal	ra,80009584 <dhcp_set_state>
80009cdc:	00e10693          	addi	a3,sp,14
80009ce0:	00100613          	li	a2,1
80009ce4:	00048593          	mv	a1,s1
80009ce8:	00098513          	mv	a0,s3
80009cec:	941ff0ef          	jal	ra,8000962c <dhcp_create_msg>
80009cf0:	10050063          	beqz	a0,80009df0 <dhcp_discover+0x144>
80009cf4:	00452403          	lw	s0,4(a0)
80009cf8:	00e15783          	lhu	a5,14(sp)
80009cfc:	00050913          	mv	s2,a0
80009d00:	0f040413          	addi	s0,s0,240
80009d04:	00f40733          	add	a4,s0,a5
80009d08:	00278513          	addi	a0,a5,2
80009d0c:	00178793          	addi	a5,a5,1
80009d10:	01079793          	slli	a5,a5,0x10
80009d14:	03900693          	li	a3,57
80009d18:	0107d793          	srli	a5,a5,0x10
80009d1c:	00d70023          	sb	a3,0(a4)
80009d20:	00f407b3          	add	a5,s0,a5
80009d24:	00200713          	li	a4,2
80009d28:	00e78023          	sb	a4,0(a5)
80009d2c:	02c9d603          	lhu	a2,44(s3)
80009d30:	01051513          	slli	a0,a0,0x10
80009d34:	01055513          	srli	a0,a0,0x10
80009d38:	00040593          	mv	a1,s0
80009d3c:	00a11723          	sh	a0,14(sp)
80009d40:	85dff0ef          	jal	ra,8000959c <dhcp_option_short>
80009d44:	00a40733          	add	a4,s0,a0
80009d48:	03700693          	li	a3,55
80009d4c:	00d70023          	sb	a3,0(a4)
80009d50:	00150713          	addi	a4,a0,1
80009d54:	01071713          	slli	a4,a4,0x10
80009d58:	01075713          	srli	a4,a4,0x10
80009d5c:	00300613          	li	a2,3
80009d60:	00e40733          	add	a4,s0,a4
80009d64:	00c70023          	sb	a2,0(a4)
80009d68:	00250713          	addi	a4,a0,2
80009d6c:	01071713          	slli	a4,a4,0x10
80009d70:	01075713          	srli	a4,a4,0x10
80009d74:	00e40733          	add	a4,s0,a4
80009d78:	00100693          	li	a3,1
80009d7c:	00d70023          	sb	a3,0(a4)
80009d80:	00050793          	mv	a5,a0
80009d84:	00350693          	addi	a3,a0,3
80009d88:	01069693          	slli	a3,a3,0x10
80009d8c:	00478793          	addi	a5,a5,4
80009d90:	0106d693          	srli	a3,a3,0x10
80009d94:	01079793          	slli	a5,a5,0x10
80009d98:	00d406b3          	add	a3,s0,a3
80009d9c:	00550513          	addi	a0,a0,5
80009da0:	0107d793          	srli	a5,a5,0x10
80009da4:	00c68023          	sb	a2,0(a3)
80009da8:	00f407b3          	add	a5,s0,a5
80009dac:	01c00713          	li	a4,28
80009db0:	01051513          	slli	a0,a0,0x10
80009db4:	00e78023          	sb	a4,0(a5)
80009db8:	01055513          	srli	a0,a0,0x10
80009dbc:	00090613          	mv	a2,s2
80009dc0:	00040593          	mv	a1,s0
80009dc4:	00a11723          	sh	a0,14(sp)
80009dc8:	a09ff0ef          	jal	ra,800097d0 <dhcp_option_trailer>
80009dcc:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
80009dd0:	84818793          	addi	a5,gp,-1976 # 800032b8 <ip_addr_any>
80009dd4:	00098713          	mv	a4,s3
80009dd8:	04300693          	li	a3,67
80009ddc:	84418613          	addi	a2,gp,-1980 # 800032b4 <ip_addr_broadcast>
80009de0:	00090593          	mv	a1,s2
80009de4:	abcff0ef          	jal	ra,800090a0 <udp_sendto_if_src>
80009de8:	00090513          	mv	a0,s2
80009dec:	b09fd0ef          	jal	ra,800078f4 <pbuf_free>
80009df0:	0064c783          	lbu	a5,6(s1)
80009df4:	0ff00713          	li	a4,255
80009df8:	00e78663          	beq	a5,a4,80009e04 <dhcp_discover+0x158>
80009dfc:	00178793          	addi	a5,a5,1
80009e00:	00f48323          	sb	a5,6(s1)
80009e04:	0064c783          	lbu	a5,6(s1)
80009e08:	00500713          	li	a4,5
80009e0c:	04f76c63          	bltu	a4,a5,80009e64 <dhcp_discover+0x1b8>
80009e10:	00100513          	li	a0,1
80009e14:	00f51533          	sll	a0,a0,a5
80009e18:	00551793          	slli	a5,a0,0x5
80009e1c:	40a787b3          	sub	a5,a5,a0
80009e20:	00279793          	slli	a5,a5,0x2
80009e24:	00f50533          	add	a0,a0,a5
80009e28:	00351513          	slli	a0,a0,0x3
80009e2c:	01051513          	slli	a0,a0,0x10
80009e30:	01055513          	srli	a0,a0,0x10
80009e34:	1f400593          	li	a1,500
80009e38:	1f350513          	addi	a0,a0,499
80009e3c:	625030ef          	jal	ra,8000dc60 <__divsi3>
80009e40:	00a49423          	sh	a0,8(s1)
80009e44:	02c12083          	lw	ra,44(sp)
80009e48:	02812403          	lw	s0,40(sp)
80009e4c:	02412483          	lw	s1,36(sp)
80009e50:	02012903          	lw	s2,32(sp)
80009e54:	01c12983          	lw	s3,28(sp)
80009e58:	00000513          	li	a0,0
80009e5c:	03010113          	addi	sp,sp,48
80009e60:	00008067          	ret
80009e64:	0000f537          	lui	a0,0xf
80009e68:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xda60>
80009e6c:	fc9ff06f          	j	80009e34 <dhcp_discover+0x188>

80009e70 <dhcp_check>:
80009e70:	ff010113          	addi	sp,sp,-16
80009e74:	00112623          	sw	ra,12(sp)
80009e78:	00912223          	sw	s1,4(sp)
80009e7c:	00812423          	sw	s0,8(sp)
80009e80:	02852403          	lw	s0,40(a0)
80009e84:	00050493          	mv	s1,a0
80009e88:	00800593          	li	a1,8
80009e8c:	00040513          	mv	a0,s0
80009e90:	ef4ff0ef          	jal	ra,80009584 <dhcp_set_state>
80009e94:	00000613          	li	a2,0
80009e98:	01c40593          	addi	a1,s0,28
80009e9c:	00048513          	mv	a0,s1
80009ea0:	4b5010ef          	jal	ra,8000bb54 <etharp_query>
80009ea4:	00644783          	lbu	a5,6(s0)
80009ea8:	0ff00713          	li	a4,255
80009eac:	00e78663          	beq	a5,a4,80009eb8 <dhcp_check+0x48>
80009eb0:	00178793          	addi	a5,a5,1
80009eb4:	00f40323          	sb	a5,6(s0)
80009eb8:	00100793          	li	a5,1
80009ebc:	00f41423          	sh	a5,8(s0)
80009ec0:	00c12083          	lw	ra,12(sp)
80009ec4:	00812403          	lw	s0,8(sp)
80009ec8:	00412483          	lw	s1,4(sp)
80009ecc:	01010113          	addi	sp,sp,16
80009ed0:	00008067          	ret

80009ed4 <dhcp_bind>:
80009ed4:	1a050863          	beqz	a0,8000a084 <dhcp_bind+0x1b0>
80009ed8:	fe010113          	addi	sp,sp,-32
80009edc:	00112e23          	sw	ra,28(sp)
80009ee0:	00812c23          	sw	s0,24(sp)
80009ee4:	00912a23          	sw	s1,20(sp)
80009ee8:	02852403          	lw	s0,40(a0)
80009eec:	10040a63          	beqz	s0,8000a000 <dhcp_bind+0x12c>
80009ef0:	00050493          	mv	s1,a0
80009ef4:	02842503          	lw	a0,40(s0)
80009ef8:	00041923          	sh	zero,18(s0)
80009efc:	fff00793          	li	a5,-1
80009f00:	02f50463          	beq	a0,a5,80009f28 <dhcp_bind+0x54>
80009f04:	01e50513          	addi	a0,a0,30
80009f08:	003c07b7          	lui	a5,0x3c0
80009f0c:	10f57463          	bgeu	a0,a5,8000a014 <dhcp_bind+0x140>
80009f10:	03c00593          	li	a1,60
80009f14:	555030ef          	jal	ra,8000dc68 <__udivsi3>
80009f18:	01051793          	slli	a5,a0,0x10
80009f1c:	0107d793          	srli	a5,a5,0x10
80009f20:	10050063          	beqz	a0,8000a020 <dhcp_bind+0x14c>
80009f24:	00f41a23          	sh	a5,20(s0)
80009f28:	02c42503          	lw	a0,44(s0)
80009f2c:	fff00793          	li	a5,-1
80009f30:	02f50863          	beq	a0,a5,80009f60 <dhcp_bind+0x8c>
80009f34:	01e50513          	addi	a0,a0,30
80009f38:	003c07b7          	lui	a5,0x3c0
80009f3c:	0ef57663          	bgeu	a0,a5,8000a028 <dhcp_bind+0x154>
80009f40:	03c00593          	li	a1,60
80009f44:	525030ef          	jal	ra,8000dc68 <__udivsi3>
80009f48:	01051793          	slli	a5,a0,0x10
80009f4c:	0107d793          	srli	a5,a5,0x10
80009f50:	0e050263          	beqz	a0,8000a034 <dhcp_bind+0x160>
80009f54:	00f41523          	sh	a5,10(s0)
80009f58:	00a45783          	lhu	a5,10(s0)
80009f5c:	00f41723          	sh	a5,14(s0)
80009f60:	03042503          	lw	a0,48(s0)
80009f64:	fff00793          	li	a5,-1
80009f68:	02f50863          	beq	a0,a5,80009f98 <dhcp_bind+0xc4>
80009f6c:	01e50513          	addi	a0,a0,30
80009f70:	003c07b7          	lui	a5,0x3c0
80009f74:	0cf57463          	bgeu	a0,a5,8000a03c <dhcp_bind+0x168>
80009f78:	03c00593          	li	a1,60
80009f7c:	4ed030ef          	jal	ra,8000dc68 <__udivsi3>
80009f80:	01051793          	slli	a5,a0,0x10
80009f84:	0107d793          	srli	a5,a5,0x10
80009f88:	0c050063          	beqz	a0,8000a048 <dhcp_bind+0x174>
80009f8c:	00f41623          	sh	a5,12(s0)
80009f90:	00c45783          	lhu	a5,12(s0)
80009f94:	00f41823          	sh	a5,16(s0)
80009f98:	00c45783          	lhu	a5,12(s0)
80009f9c:	00a45703          	lhu	a4,10(s0)
80009fa0:	00f76663          	bltu	a4,a5,80009fac <dhcp_bind+0xd8>
80009fa4:	00078463          	beqz	a5,80009fac <dhcp_bind+0xd8>
80009fa8:	00041523          	sh	zero,10(s0)
80009fac:	00744783          	lbu	a5,7(s0)
80009fb0:	0a078063          	beqz	a5,8000a050 <dhcp_bind+0x17c>
80009fb4:	02042783          	lw	a5,32(s0)
80009fb8:	00f12423          	sw	a5,8(sp)
80009fbc:	02442783          	lw	a5,36(s0)
80009fc0:	00f12623          	sw	a5,12(sp)
80009fc4:	00079e63          	bnez	a5,80009fe0 <dhcp_bind+0x10c>
80009fc8:	00812703          	lw	a4,8(sp)
80009fcc:	01c42783          	lw	a5,28(s0)
80009fd0:	00e7f7b3          	and	a5,a5,a4
80009fd4:	01000737          	lui	a4,0x1000
80009fd8:	00e7e7b3          	or	a5,a5,a4
80009fdc:	00f12623          	sw	a5,12(sp)
80009fe0:	00a00593          	li	a1,10
80009fe4:	00040513          	mv	a0,s0
80009fe8:	d9cff0ef          	jal	ra,80009584 <dhcp_set_state>
80009fec:	00c10693          	addi	a3,sp,12
80009ff0:	00810613          	addi	a2,sp,8
80009ff4:	01c40593          	addi	a1,s0,28
80009ff8:	00048513          	mv	a0,s1
80009ffc:	9c0fd0ef          	jal	ra,800071bc <netif_set_addr>
8000a000:	01c12083          	lw	ra,28(sp)
8000a004:	01812403          	lw	s0,24(sp)
8000a008:	01412483          	lw	s1,20(sp)
8000a00c:	02010113          	addi	sp,sp,32
8000a010:	00008067          	ret
8000a014:	000107b7          	lui	a5,0x10
8000a018:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xefff>
8000a01c:	f09ff06f          	j	80009f24 <dhcp_bind+0x50>
8000a020:	00100793          	li	a5,1
8000a024:	f01ff06f          	j	80009f24 <dhcp_bind+0x50>
8000a028:	000107b7          	lui	a5,0x10
8000a02c:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xefff>
8000a030:	f25ff06f          	j	80009f54 <dhcp_bind+0x80>
8000a034:	00100793          	li	a5,1
8000a038:	f1dff06f          	j	80009f54 <dhcp_bind+0x80>
8000a03c:	000107b7          	lui	a5,0x10
8000a040:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xefff>
8000a044:	f49ff06f          	j	80009f8c <dhcp_bind+0xb8>
8000a048:	00100793          	li	a5,1
8000a04c:	f41ff06f          	j	80009f8c <dhcp_bind+0xb8>
8000a050:	01c44783          	lbu	a5,28(s0)
8000a054:	01879713          	slli	a4,a5,0x18
8000a058:	41875713          	srai	a4,a4,0x18
8000a05c:	00074663          	bltz	a4,8000a068 <dhcp_bind+0x194>
8000a060:	0ff00793          	li	a5,255
8000a064:	f55ff06f          	j	80009fb8 <dhcp_bind+0xe4>
8000a068:	0bf00713          	li	a4,191
8000a06c:	00f77863          	bgeu	a4,a5,8000a07c <dhcp_bind+0x1a8>
8000a070:	010007b7          	lui	a5,0x1000
8000a074:	fff78793          	addi	a5,a5,-1 # ffffff <_stack_size+0xffefff>
8000a078:	f41ff06f          	j	80009fb8 <dhcp_bind+0xe4>
8000a07c:	000107b7          	lui	a5,0x10
8000a080:	ff5ff06f          	j	8000a074 <dhcp_bind+0x1a0>
8000a084:	00008067          	ret

8000a088 <dhcp_inc_pcb_refcount>:
8000a088:	ff010113          	addi	sp,sp,-16
8000a08c:	00812423          	sw	s0,8(sp)
8000a090:	9081c783          	lbu	a5,-1784(gp) # 80003378 <dhcp_pcb_refcount>
8000a094:	00112623          	sw	ra,12(sp)
8000a098:	00912223          	sw	s1,4(sp)
8000a09c:	01212023          	sw	s2,0(sp)
8000a0a0:	04079863          	bnez	a5,8000a0f0 <dhcp_inc_pcb_refcount+0x68>
8000a0a4:	c4cff0ef          	jal	ra,800094f0 <udp_new>
8000a0a8:	90a1a623          	sw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000a0ac:	fff00713          	li	a4,-1
8000a0b0:	04050863          	beqz	a0,8000a100 <dhcp_inc_pcb_refcount+0x78>
8000a0b4:	00954703          	lbu	a4,9(a0)
8000a0b8:	04400613          	li	a2,68
8000a0bc:	02076713          	ori	a4,a4,32
8000a0c0:	00e504a3          	sb	a4,9(a0)
8000a0c4:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
8000a0c8:	ee9fe0ef          	jal	ra,80008fb0 <udp_bind>
8000a0cc:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000a0d0:	04300613          	li	a2,67
8000a0d4:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
8000a0d8:	af8ff0ef          	jal	ra,800093d0 <udp_connect>
8000a0dc:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000a0e0:	8000a5b7          	lui	a1,0x8000a
8000a0e4:	00000613          	li	a2,0
8000a0e8:	24858593          	addi	a1,a1,584 # 8000a248 <_ram_heap_end+0xffff2248>
8000a0ec:	bb0ff0ef          	jal	ra,8000949c <udp_recv>
8000a0f0:	9081c783          	lbu	a5,-1784(gp) # 80003378 <dhcp_pcb_refcount>
8000a0f4:	00000713          	li	a4,0
8000a0f8:	00178793          	addi	a5,a5,1 # 10001 <_stack_size+0xf001>
8000a0fc:	90f18423          	sb	a5,-1784(gp) # 80003378 <dhcp_pcb_refcount>
8000a100:	00c12083          	lw	ra,12(sp)
8000a104:	00812403          	lw	s0,8(sp)
8000a108:	00412483          	lw	s1,4(sp)
8000a10c:	00012903          	lw	s2,0(sp)
8000a110:	00070513          	mv	a0,a4
8000a114:	01010113          	addi	sp,sp,16
8000a118:	00008067          	ret

8000a11c <dhcp_handle_ack.isra.0>:
8000a11c:	ff010113          	addi	sp,sp,-16
8000a120:	00912223          	sw	s1,4(sp)
8000a124:	00812423          	sw	s0,8(sp)
8000a128:	00112623          	sw	ra,12(sp)
8000a12c:	91018793          	addi	a5,gp,-1776 # 80003380 <dhcp_rx_options_given>
8000a130:	0037c783          	lbu	a5,3(a5)
8000a134:	02052023          	sw	zero,32(a0)
8000a138:	02052223          	sw	zero,36(a0)
8000a13c:	00050413          	mv	s0,a0
8000a140:	91018493          	addi	s1,gp,-1776 # 80003380 <dhcp_rx_options_given>
8000a144:	00078663          	beqz	a5,8000a150 <dhcp_handle_ack.isra.0+0x34>
8000a148:	b581a783          	lw	a5,-1192(gp) # 800035c8 <dhcp_rx_options_val+0xc>
8000a14c:	02f52423          	sw	a5,40(a0)
8000a150:	0044c783          	lbu	a5,4(s1)
8000a154:	08078663          	beqz	a5,8000a1e0 <dhcp_handle_ack.isra.0+0xc4>
8000a158:	b5c1a783          	lw	a5,-1188(gp) # 800035cc <dhcp_rx_options_val+0x10>
8000a15c:	02f42623          	sw	a5,44(s0)
8000a160:	0054c783          	lbu	a5,5(s1)
8000a164:	08078463          	beqz	a5,8000a1ec <dhcp_handle_ack.isra.0+0xd0>
8000a168:	b601a783          	lw	a5,-1184(gp) # 800035d0 <dhcp_rx_options_val+0x14>
8000a16c:	02f42823          	sw	a5,48(s0)
8000a170:	0115c703          	lbu	a4,17(a1)
8000a174:	0105c783          	lbu	a5,16(a1)
8000a178:	00871713          	slli	a4,a4,0x8
8000a17c:	00f76733          	or	a4,a4,a5
8000a180:	0125c783          	lbu	a5,18(a1)
8000a184:	01079793          	slli	a5,a5,0x10
8000a188:	00e7e733          	or	a4,a5,a4
8000a18c:	0135c783          	lbu	a5,19(a1)
8000a190:	01879793          	slli	a5,a5,0x18
8000a194:	00e7e7b3          	or	a5,a5,a4
8000a198:	00f42e23          	sw	a5,28(s0)
8000a19c:	0064c783          	lbu	a5,6(s1)
8000a1a0:	06078063          	beqz	a5,8000a200 <dhcp_handle_ack.isra.0+0xe4>
8000a1a4:	b641a503          	lw	a0,-1180(gp) # 800035d4 <dhcp_rx_options_val+0x18>
8000a1a8:	d40fc0ef          	jal	ra,800066e8 <lwip_htonl>
8000a1ac:	00100793          	li	a5,1
8000a1b0:	02a42023          	sw	a0,32(s0)
8000a1b4:	00f403a3          	sb	a5,7(s0)
8000a1b8:	0074c783          	lbu	a5,7(s1)
8000a1bc:	00078863          	beqz	a5,8000a1cc <dhcp_handle_ack.isra.0+0xb0>
8000a1c0:	b681a503          	lw	a0,-1176(gp) # 800035d8 <dhcp_rx_options_val+0x1c>
8000a1c4:	d24fc0ef          	jal	ra,800066e8 <lwip_htonl>
8000a1c8:	02a42223          	sw	a0,36(s0)
8000a1cc:	00c12083          	lw	ra,12(sp)
8000a1d0:	00812403          	lw	s0,8(sp)
8000a1d4:	00412483          	lw	s1,4(sp)
8000a1d8:	01010113          	addi	sp,sp,16
8000a1dc:	00008067          	ret
8000a1e0:	02842783          	lw	a5,40(s0)
8000a1e4:	0017d793          	srli	a5,a5,0x1
8000a1e8:	f75ff06f          	j	8000a15c <dhcp_handle_ack.isra.0+0x40>
8000a1ec:	02842703          	lw	a4,40(s0)
8000a1f0:	00371793          	slli	a5,a4,0x3
8000a1f4:	40e787b3          	sub	a5,a5,a4
8000a1f8:	0037d793          	srli	a5,a5,0x3
8000a1fc:	f71ff06f          	j	8000a16c <dhcp_handle_ack.isra.0+0x50>
8000a200:	000403a3          	sb	zero,7(s0)
8000a204:	fb5ff06f          	j	8000a1b8 <dhcp_handle_ack.isra.0+0x9c>

8000a208 <dhcp_dec_pcb_refcount>:
8000a208:	9081c783          	lbu	a5,-1784(gp) # 80003378 <dhcp_pcb_refcount>
8000a20c:	fff78793          	addi	a5,a5,-1
8000a210:	0ff7f793          	andi	a5,a5,255
8000a214:	90f18423          	sb	a5,-1784(gp) # 80003378 <dhcp_pcb_refcount>
8000a218:	02079663          	bnez	a5,8000a244 <dhcp_dec_pcb_refcount+0x3c>
8000a21c:	ff010113          	addi	sp,sp,-16
8000a220:	00812423          	sw	s0,8(sp)
8000a224:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000a228:	00112623          	sw	ra,12(sp)
8000a22c:	a80ff0ef          	jal	ra,800094ac <udp_remove>
8000a230:	00c12083          	lw	ra,12(sp)
8000a234:	9001a623          	sw	zero,-1780(gp) # 8000337c <dhcp_pcb>
8000a238:	00812403          	lw	s0,8(sp)
8000a23c:	01010113          	addi	sp,sp,16
8000a240:	00008067          	ret
8000a244:	00008067          	ret

8000a248 <dhcp_recv>:
8000a248:	fa010113          	addi	sp,sp,-96
8000a24c:	05212823          	sw	s2,80(sp)
8000a250:	a181a903          	lw	s2,-1512(gp) # 80003488 <ip_data+0x4>
8000a254:	05312623          	sw	s3,76(sp)
8000a258:	04112e23          	sw	ra,92(sp)
8000a25c:	04812c23          	sw	s0,88(sp)
8000a260:	04912a23          	sw	s1,84(sp)
8000a264:	05412423          	sw	s4,72(sp)
8000a268:	05512223          	sw	s5,68(sp)
8000a26c:	05612023          	sw	s6,64(sp)
8000a270:	03712e23          	sw	s7,60(sp)
8000a274:	03812c23          	sw	s8,56(sp)
8000a278:	03912a23          	sw	s9,52(sp)
8000a27c:	03a12823          	sw	s10,48(sp)
8000a280:	03b12623          	sw	s11,44(sp)
8000a284:	02892b83          	lw	s7,40(s2)
8000a288:	00060993          	mv	s3,a2
8000a28c:	0e0b8663          	beqz	s7,8000a378 <dhcp_recv+0x130>
8000a290:	004bc783          	lbu	a5,4(s7)
8000a294:	0e078263          	beqz	a5,8000a378 <dhcp_recv+0x130>
8000a298:	00a65703          	lhu	a4,10(a2)
8000a29c:	02b00793          	li	a5,43
8000a2a0:	0ce7fc63          	bgeu	a5,a4,8000a378 <dhcp_recv+0x130>
8000a2a4:	00462783          	lw	a5,4(a2)
8000a2a8:	00200713          	li	a4,2
8000a2ac:	0007c683          	lbu	a3,0(a5)
8000a2b0:	0ce69463          	bne	a3,a4,8000a378 <dhcp_recv+0x130>
8000a2b4:	03494603          	lbu	a2,52(s2)
8000a2b8:	00000713          	li	a4,0
8000a2bc:	00600693          	li	a3,6
8000a2c0:	0ff77593          	andi	a1,a4,255
8000a2c4:	00c5f463          	bgeu	a1,a2,8000a2cc <dhcp_recv+0x84>
8000a2c8:	08d71c63          	bne	a4,a3,8000a360 <dhcp_recv+0x118>
8000a2cc:	0057c503          	lbu	a0,5(a5)
8000a2d0:	0047c703          	lbu	a4,4(a5)
8000a2d4:	00851513          	slli	a0,a0,0x8
8000a2d8:	00e56533          	or	a0,a0,a4
8000a2dc:	0067c703          	lbu	a4,6(a5)
8000a2e0:	01071713          	slli	a4,a4,0x10
8000a2e4:	00a76733          	or	a4,a4,a0
8000a2e8:	0077c503          	lbu	a0,7(a5)
8000a2ec:	01851513          	slli	a0,a0,0x18
8000a2f0:	00e56533          	or	a0,a0,a4
8000a2f4:	bf4fc0ef          	jal	ra,800066e8 <lwip_htonl>
8000a2f8:	000ba783          	lw	a5,0(s7)
8000a2fc:	06f51e63          	bne	a0,a5,8000a378 <dhcp_recv+0x130>
8000a300:	91018793          	addi	a5,gp,-1776 # 80003380 <dhcp_rx_options_given>
8000a304:	0007a223          	sw	zero,4(a5)
8000a308:	00a9d703          	lhu	a4,10(s3)
8000a30c:	0007a023          	sw	zero,0(a5)
8000a310:	02b00793          	li	a5,43
8000a314:	91018813          	addi	a6,gp,-1776 # 80003380 <dhcp_rx_options_given>
8000a318:	06e7f063          	bgeu	a5,a4,8000a378 <dhcp_recv+0x130>
8000a31c:	00010ab7          	lui	s5,0x10
8000a320:	ffda8793          	addi	a5,s5,-3 # fffd <_stack_size+0xeffd>
8000a324:	0089dd83          	lhu	s11,8(s3)
8000a328:	00f12423          	sw	a5,8(sp)
8000a32c:	b4c18793          	addi	a5,gp,-1204 # 800035bc <dhcp_rx_options_val>
8000a330:	00000b13          	li	s6,0
8000a334:	0f000d13          	li	s10,240
8000a338:	00f12223          	sw	a5,4(sp)
8000a33c:	00098c13          	mv	s8,s3
8000a340:	00ac5783          	lhu	a5,10(s8)
8000a344:	06fd7c63          	bgeu	s10,a5,8000a3bc <dhcp_recv+0x174>
8000a348:	004c2783          	lw	a5,4(s8)
8000a34c:	000d0413          	mv	s0,s10
8000a350:	00400a93          	li	s5,4
8000a354:	00f12023          	sw	a5,0(sp)
8000a358:	00100a13          	li	s4,1
8000a35c:	25c0006f          	j	8000a5b8 <dhcp_recv+0x370>
8000a360:	00e905b3          	add	a1,s2,a4
8000a364:	00170713          	addi	a4,a4,1 # 1000001 <_stack_size+0xfff001>
8000a368:	00e78533          	add	a0,a5,a4
8000a36c:	02e5c583          	lbu	a1,46(a1)
8000a370:	01b54503          	lbu	a0,27(a0)
8000a374:	f4b506e3          	beq	a0,a1,8000a2c0 <dhcp_recv+0x78>
8000a378:	00098513          	mv	a0,s3
8000a37c:	d78fd0ef          	jal	ra,800078f4 <pbuf_free>
8000a380:	05c12083          	lw	ra,92(sp)
8000a384:	05812403          	lw	s0,88(sp)
8000a388:	05412483          	lw	s1,84(sp)
8000a38c:	05012903          	lw	s2,80(sp)
8000a390:	04c12983          	lw	s3,76(sp)
8000a394:	04812a03          	lw	s4,72(sp)
8000a398:	04412a83          	lw	s5,68(sp)
8000a39c:	04012b03          	lw	s6,64(sp)
8000a3a0:	03c12b83          	lw	s7,60(sp)
8000a3a4:	03812c03          	lw	s8,56(sp)
8000a3a8:	03412c83          	lw	s9,52(sp)
8000a3ac:	03012d03          	lw	s10,48(sp)
8000a3b0:	02c12d83          	lw	s11,44(sp)
8000a3b4:	06010113          	addi	sp,sp,96
8000a3b8:	00008067          	ret
8000a3bc:	000c2c03          	lw	s8,0(s8)
8000a3c0:	40fd0d33          	sub	s10,s10,a5
8000a3c4:	40fd8db3          	sub	s11,s11,a5
8000a3c8:	010d1d13          	slli	s10,s10,0x10
8000a3cc:	010d9d93          	slli	s11,s11,0x10
8000a3d0:	010d5d13          	srli	s10,s10,0x10
8000a3d4:	010ddd93          	srli	s11,s11,0x10
8000a3d8:	f60c14e3          	bnez	s8,8000a340 <dhcp_recv+0xf8>
8000a3dc:	f9dff06f          	j	8000a378 <dhcp_recv+0x130>
8000a3e0:	00240693          	addi	a3,s0,2
8000a3e4:	01069693          	slli	a3,a3,0x10
8000a3e8:	0106d693          	srli	a3,a3,0x10
8000a3ec:	f886e6e3          	bltu	a3,s0,8000a378 <dhcp_recv+0x130>
8000a3f0:	00ac5583          	lhu	a1,10(s8)
8000a3f4:	00140613          	addi	a2,s0,1
8000a3f8:	02b65c63          	bge	a2,a1,8000a430 <dhcp_recv+0x1e8>
8000a3fc:	00174703          	lbu	a4,1(a4)
8000a400:	03400593          	li	a1,52
8000a404:	12b78263          	beq	a5,a1,8000a528 <dhcp_recv+0x2e0>
8000a408:	02f5ee63          	bltu	a1,a5,8000a444 <dhcp_recv+0x1fc>
8000a40c:	07478263          	beq	a5,s4,8000a470 <dhcp_recv+0x228>
8000a410:	16078663          	beqz	a5,8000a57c <dhcp_recv+0x334>
8000a414:	00300613          	li	a2,3
8000a418:	0ec78663          	beq	a5,a2,8000a504 <dhcp_recv+0x2bc>
8000a41c:	03300613          	li	a2,51
8000a420:	0ec78a63          	beq	a5,a2,8000a514 <dhcp_recv+0x2cc>
8000a424:	fff00493          	li	s1,-1
8000a428:	00000c93          	li	s9,0
8000a42c:	0500006f          	j	8000a47c <dhcp_recv+0x234>
8000a430:	000c2703          	lw	a4,0(s8)
8000a434:	32070263          	beqz	a4,8000a758 <dhcp_recv+0x510>
8000a438:	00472703          	lw	a4,4(a4)
8000a43c:	00074703          	lbu	a4,0(a4)
8000a440:	fc1ff06f          	j	8000a400 <dhcp_recv+0x1b8>
8000a444:	03600613          	li	a2,54
8000a448:	10c78863          	beq	a5,a2,8000a558 <dhcp_recv+0x310>
8000a44c:	0ec7ec63          	bltu	a5,a2,8000a544 <dhcp_recv+0x2fc>
8000a450:	03a00613          	li	a2,58
8000a454:	10c78c63          	beq	a5,a2,8000a56c <dhcp_recv+0x324>
8000a458:	03b00613          	li	a2,59
8000a45c:	fcc794e3          	bne	a5,a2,8000a424 <dhcp_recv+0x1dc>
8000a460:	f1571ce3          	bne	a4,s5,8000a378 <dhcp_recv+0x130>
8000a464:	00400c93          	li	s9,4
8000a468:	00500493          	li	s1,5
8000a46c:	0100006f          	j	8000a47c <dhcp_recv+0x234>
8000a470:	f15714e3          	bne	a4,s5,8000a378 <dhcp_recv+0x130>
8000a474:	00400c93          	li	s9,4
8000a478:	00600493          	li	s1,6
8000a47c:	00812783          	lw	a5,8(sp)
8000a480:	00870433          	add	s0,a4,s0
8000a484:	ee87cae3          	blt	a5,s0,8000a378 <dhcp_recv+0x130>
8000a488:	00e68733          	add	a4,a3,a4
8000a48c:	01071413          	slli	s0,a4,0x10
8000a490:	01045413          	srli	s0,s0,0x10
8000a494:	0e0c8863          	beqz	s9,8000a584 <dhcp_recv+0x33c>
8000a498:	009807b3          	add	a5,a6,s1
8000a49c:	0007c783          	lbu	a5,0(a5)
8000a4a0:	00012e23          	sw	zero,28(sp)
8000a4a4:	0e079063          	bnez	a5,8000a584 <dhcp_recv+0x33c>
8000a4a8:	010c9793          	slli	a5,s9,0x10
8000a4ac:	0107d793          	srli	a5,a5,0x10
8000a4b0:	00078613          	mv	a2,a5
8000a4b4:	01c10593          	addi	a1,sp,28
8000a4b8:	000c0513          	mv	a0,s8
8000a4bc:	00f12623          	sw	a5,12(sp)
8000a4c0:	a19fd0ef          	jal	ra,80007ed8 <pbuf_copy_partial>
8000a4c4:	00c12783          	lw	a5,12(sp)
8000a4c8:	eaa798e3          	bne	a5,a0,8000a378 <dhcp_recv+0x130>
8000a4cc:	91018813          	addi	a6,gp,-1776 # 80003380 <dhcp_rx_options_given>
8000a4d0:	155c9a63          	bne	s9,s5,8000a624 <dhcp_recv+0x3dc>
8000a4d4:	01c12503          	lw	a0,28(sp)
8000a4d8:	a10fc0ef          	jal	ra,800066e8 <lwip_htonl>
8000a4dc:	00a12e23          	sw	a0,28(sp)
8000a4e0:	91018813          	addi	a6,gp,-1776 # 80003380 <dhcp_rx_options_given>
8000a4e4:	009807b3          	add	a5,a6,s1
8000a4e8:	01478023          	sb	s4,0(a5)
8000a4ec:	00412783          	lw	a5,4(sp)
8000a4f0:	00249493          	slli	s1,s1,0x2
8000a4f4:	009784b3          	add	s1,a5,s1
8000a4f8:	01c12783          	lw	a5,28(sp)
8000a4fc:	00f4a023          	sw	a5,0(s1)
8000a500:	0840006f          	j	8000a584 <dhcp_recv+0x33c>
8000a504:	e6e7fae3          	bgeu	a5,a4,8000a378 <dhcp_recv+0x130>
8000a508:	00700493          	li	s1,7
8000a50c:	00400c93          	li	s9,4
8000a510:	f6dff06f          	j	8000a47c <dhcp_recv+0x234>
8000a514:	e75712e3          	bne	a4,s5,8000a378 <dhcp_recv+0x130>
8000a518:	00400c93          	li	s9,4
8000a51c:	00300493          	li	s1,3
8000a520:	f5dff06f          	j	8000a47c <dhcp_recv+0x234>
8000a524:	00000713          	li	a4,0
8000a528:	e54718e3          	bne	a4,s4,8000a378 <dhcp_recv+0x130>
8000a52c:	0f000793          	li	a5,240
8000a530:	e4fd14e3          	bne	s10,a5,8000a378 <dhcp_recv+0x130>
8000a534:	00100c93          	li	s9,1
8000a538:	00000493          	li	s1,0
8000a53c:	f41ff06f          	j	8000a47c <dhcp_recv+0x234>
8000a540:	00000713          	li	a4,0
8000a544:	e3471ae3          	bne	a4,s4,8000a378 <dhcp_recv+0x130>
8000a548:	00100c93          	li	s9,1
8000a54c:	00100493          	li	s1,1
8000a550:	f2dff06f          	j	8000a47c <dhcp_recv+0x234>
8000a554:	00000713          	li	a4,0
8000a558:	e35710e3          	bne	a4,s5,8000a378 <dhcp_recv+0x130>
8000a55c:	00400c93          	li	s9,4
8000a560:	00200493          	li	s1,2
8000a564:	f19ff06f          	j	8000a47c <dhcp_recv+0x234>
8000a568:	00000713          	li	a4,0
8000a56c:	e15716e3          	bne	a4,s5,8000a378 <dhcp_recv+0x130>
8000a570:	00400c93          	li	s9,4
8000a574:	00400493          	li	s1,4
8000a578:	f05ff06f          	j	8000a47c <dhcp_recv+0x234>
8000a57c:	01061413          	slli	s0,a2,0x10
8000a580:	01045413          	srli	s0,s0,0x10
8000a584:	00ac5783          	lhu	a5,10(s8)
8000a588:	02f46863          	bltu	s0,a5,8000a5b8 <dhcp_recv+0x370>
8000a58c:	40f40433          	sub	s0,s0,a5
8000a590:	40fd8db3          	sub	s11,s11,a5
8000a594:	01041413          	slli	s0,s0,0x10
8000a598:	010d9d93          	slli	s11,s11,0x10
8000a59c:	01045413          	srli	s0,s0,0x10
8000a5a0:	010ddd93          	srli	s11,s11,0x10
8000a5a4:	ddb47ae3          	bgeu	s0,s11,8000a378 <dhcp_recv+0x130>
8000a5a8:	000c2c03          	lw	s8,0(s8)
8000a5ac:	dc0c06e3          	beqz	s8,8000a378 <dhcp_recv+0x130>
8000a5b0:	004c2783          	lw	a5,4(s8)
8000a5b4:	00f12023          	sw	a5,0(sp)
8000a5b8:	01b47c63          	bgeu	s0,s11,8000a5d0 <dhcp_recv+0x388>
8000a5bc:	00012783          	lw	a5,0(sp)
8000a5c0:	0ff00693          	li	a3,255
8000a5c4:	00878733          	add	a4,a5,s0
8000a5c8:	00074783          	lbu	a5,0(a4)
8000a5cc:	e0d79ae3          	bne	a5,a3,8000a3e0 <dhcp_recv+0x198>
8000a5d0:	00084783          	lbu	a5,0(a6)
8000a5d4:	06079063          	bnez	a5,8000a634 <dhcp_recv+0x3ec>
8000a5d8:	060b1c63          	bnez	s6,8000a650 <dhcp_recv+0x408>
8000a5dc:	00184783          	lbu	a5,1(a6)
8000a5e0:	d8078ce3          	beqz	a5,8000a378 <dhcp_recv+0x130>
8000a5e4:	b4c18793          	addi	a5,gp,-1204 # 800035bc <dhcp_rx_options_val>
8000a5e8:	0047c703          	lbu	a4,4(a5)
8000a5ec:	00500693          	li	a3,5
8000a5f0:	0049a583          	lw	a1,4(s3)
8000a5f4:	0ad71463          	bne	a4,a3,8000a69c <dhcp_recv+0x454>
8000a5f8:	005bc783          	lbu	a5,5(s7)
8000a5fc:	00100713          	li	a4,1
8000a600:	06e79c63          	bne	a5,a4,8000a678 <dhcp_recv+0x430>
8000a604:	02892503          	lw	a0,40(s2)
8000a608:	b15ff0ef          	jal	ra,8000a11c <dhcp_handle_ack.isra.0>
8000a60c:	03594783          	lbu	a5,53(s2)
8000a610:	00090513          	mv	a0,s2
8000a614:	0087f793          	andi	a5,a5,8
8000a618:	06078e63          	beqz	a5,8000a694 <dhcp_recv+0x44c>
8000a61c:	855ff0ef          	jal	ra,80009e70 <dhcp_check>
8000a620:	d59ff06f          	j	8000a378 <dhcp_recv+0x130>
8000a624:	d54c9ae3          	bne	s9,s4,8000a378 <dhcp_recv+0x130>
8000a628:	01c14783          	lbu	a5,28(sp)
8000a62c:	00f12e23          	sw	a5,28(sp)
8000a630:	eb5ff06f          	j	8000a4e4 <dhcp_recv+0x29c>
8000a634:	00412783          	lw	a5,4(sp)
8000a638:	00080023          	sb	zero,0(a6)
8000a63c:	00100713          	li	a4,1
8000a640:	0007a783          	lw	a5,0(a5)
8000a644:	02e78463          	beq	a5,a4,8000a66c <dhcp_recv+0x424>
8000a648:	00200713          	li	a4,2
8000a64c:	00e79a63          	bne	a5,a4,8000a660 <dhcp_recv+0x418>
8000a650:	00000b13          	li	s6,0
8000a654:	06c00d93          	li	s11,108
8000a658:	02c00d13          	li	s10,44
8000a65c:	ce1ff06f          	j	8000a33c <dhcp_recv+0xf4>
8000a660:	00300713          	li	a4,3
8000a664:	f6e79ae3          	bne	a5,a4,8000a5d8 <dhcp_recv+0x390>
8000a668:	00100b13          	li	s6,1
8000a66c:	0ec00d93          	li	s11,236
8000a670:	06c00d13          	li	s10,108
8000a674:	cc9ff06f          	j	8000a33c <dhcp_recv+0xf4>
8000a678:	ffd78793          	addi	a5,a5,-3
8000a67c:	0ff7f793          	andi	a5,a5,255
8000a680:	00200713          	li	a4,2
8000a684:	cef76ae3          	bltu	a4,a5,8000a378 <dhcp_recv+0x130>
8000a688:	02892503          	lw	a0,40(s2)
8000a68c:	a91ff0ef          	jal	ra,8000a11c <dhcp_handle_ack.isra.0>
8000a690:	00090513          	mv	a0,s2
8000a694:	841ff0ef          	jal	ra,80009ed4 <dhcp_bind>
8000a698:	ce1ff06f          	j	8000a378 <dhcp_recv+0x130>
8000a69c:	00600693          	li	a3,6
8000a6a0:	04d71663          	bne	a4,a3,8000a6ec <dhcp_recv+0x4a4>
8000a6a4:	005bc703          	lbu	a4,5(s7)
8000a6a8:	00200693          	li	a3,2
8000a6ac:	ffd70793          	addi	a5,a4,-3
8000a6b0:	0ff7f793          	andi	a5,a5,255
8000a6b4:	00f6f663          	bgeu	a3,a5,8000a6c0 <dhcp_recv+0x478>
8000a6b8:	00100793          	li	a5,1
8000a6bc:	caf71ee3          	bne	a4,a5,8000a378 <dhcp_recv+0x130>
8000a6c0:	02892503          	lw	a0,40(s2)
8000a6c4:	00c00593          	li	a1,12
8000a6c8:	ebdfe0ef          	jal	ra,80009584 <dhcp_set_state>
8000a6cc:	84818693          	addi	a3,gp,-1976 # 800032b8 <ip_addr_any>
8000a6d0:	84818613          	addi	a2,gp,-1976 # 800032b8 <ip_addr_any>
8000a6d4:	00090513          	mv	a0,s2
8000a6d8:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
8000a6dc:	ae1fc0ef          	jal	ra,800071bc <netif_set_addr>
8000a6e0:	00090513          	mv	a0,s2
8000a6e4:	dc8ff0ef          	jal	ra,80009cac <dhcp_discover>
8000a6e8:	c91ff06f          	j	8000a378 <dhcp_recv+0x130>
8000a6ec:	00200613          	li	a2,2
8000a6f0:	c8c714e3          	bne	a4,a2,8000a378 <dhcp_recv+0x130>
8000a6f4:	005bc703          	lbu	a4,5(s7)
8000a6f8:	c8d710e3          	bne	a4,a3,8000a378 <dhcp_recv+0x130>
8000a6fc:	00284703          	lbu	a4,2(a6)
8000a700:	c6070ce3          	beqz	a4,8000a378 <dhcp_recv+0x130>
8000a704:	02892403          	lw	s0,40(s2)
8000a708:	00b12023          	sw	a1,0(sp)
8000a70c:	00041423          	sh	zero,8(s0)
8000a710:	0087a503          	lw	a0,8(a5)
8000a714:	fd5fb0ef          	jal	ra,800066e8 <lwip_htonl>
8000a718:	00012583          	lw	a1,0(sp)
8000a71c:	00a42c23          	sw	a0,24(s0)
8000a720:	00090513          	mv	a0,s2
8000a724:	0115c703          	lbu	a4,17(a1)
8000a728:	0105c783          	lbu	a5,16(a1)
8000a72c:	00871713          	slli	a4,a4,0x8
8000a730:	00f76733          	or	a4,a4,a5
8000a734:	0125c783          	lbu	a5,18(a1)
8000a738:	01079793          	slli	a5,a5,0x10
8000a73c:	00e7e733          	or	a4,a5,a4
8000a740:	0135c783          	lbu	a5,19(a1)
8000a744:	01879793          	slli	a5,a5,0x18
8000a748:	00e7e7b3          	or	a5,a5,a4
8000a74c:	00f42e23          	sw	a5,28(s0)
8000a750:	ae0ff0ef          	jal	ra,80009a30 <dhcp_select>
8000a754:	c25ff06f          	j	8000a378 <dhcp_recv+0x130>
8000a758:	03400713          	li	a4,52
8000a75c:	dce784e3          	beq	a5,a4,8000a524 <dhcp_recv+0x2dc>
8000a760:	02f76263          	bltu	a4,a5,8000a784 <dhcp_recv+0x53c>
8000a764:	c1478ae3          	beq	a5,s4,8000a378 <dhcp_recv+0x130>
8000a768:	e0078ae3          	beqz	a5,8000a57c <dhcp_recv+0x334>
8000a76c:	00300713          	li	a4,3
8000a770:	c0e784e3          	beq	a5,a4,8000a378 <dhcp_recv+0x130>
8000a774:	03300713          	li	a4,51
8000a778:	c0e780e3          	beq	a5,a4,8000a378 <dhcp_recv+0x130>
8000a77c:	00000713          	li	a4,0
8000a780:	ca5ff06f          	j	8000a424 <dhcp_recv+0x1dc>
8000a784:	03600713          	li	a4,54
8000a788:	dce786e3          	beq	a5,a4,8000a554 <dhcp_recv+0x30c>
8000a78c:	dae7eae3          	bltu	a5,a4,8000a540 <dhcp_recv+0x2f8>
8000a790:	03a00713          	li	a4,58
8000a794:	dce78ae3          	beq	a5,a4,8000a568 <dhcp_recv+0x320>
8000a798:	03b00613          	li	a2,59
8000a79c:	00000713          	li	a4,0
8000a7a0:	cbdff06f          	j	8000a45c <dhcp_recv+0x214>

8000a7a4 <dhcp_set_struct>:
8000a7a4:	ff010113          	addi	sp,sp,-16
8000a7a8:	00058793          	mv	a5,a1
8000a7ac:	00812423          	sw	s0,8(sp)
8000a7b0:	03400613          	li	a2,52
8000a7b4:	00050413          	mv	s0,a0
8000a7b8:	00000593          	li	a1,0
8000a7bc:	00078513          	mv	a0,a5
8000a7c0:	00112623          	sw	ra,12(sp)
8000a7c4:	595020ef          	jal	ra,8000d558 <memset>
8000a7c8:	02a42423          	sw	a0,40(s0)
8000a7cc:	00c12083          	lw	ra,12(sp)
8000a7d0:	00812403          	lw	s0,8(sp)
8000a7d4:	01010113          	addi	sp,sp,16
8000a7d8:	00008067          	ret

8000a7dc <dhcp_cleanup>:
8000a7dc:	02852783          	lw	a5,40(a0)
8000a7e0:	02078863          	beqz	a5,8000a810 <dhcp_cleanup+0x34>
8000a7e4:	ff010113          	addi	sp,sp,-16
8000a7e8:	00812423          	sw	s0,8(sp)
8000a7ec:	00050413          	mv	s0,a0
8000a7f0:	00078513          	mv	a0,a5
8000a7f4:	00112623          	sw	ra,12(sp)
8000a7f8:	f0cfc0ef          	jal	ra,80006f04 <lwip_free>
8000a7fc:	02042423          	sw	zero,40(s0)
8000a800:	00c12083          	lw	ra,12(sp)
8000a804:	00812403          	lw	s0,8(sp)
8000a808:	01010113          	addi	sp,sp,16
8000a80c:	00008067          	ret
8000a810:	00008067          	ret

8000a814 <dhcp_inform>:
8000a814:	0e050a63          	beqz	a0,8000a908 <dhcp_inform+0xf4>
8000a818:	fb010113          	addi	sp,sp,-80
8000a81c:	04812423          	sw	s0,72(sp)
8000a820:	04112623          	sw	ra,76(sp)
8000a824:	04912223          	sw	s1,68(sp)
8000a828:	05212023          	sw	s2,64(sp)
8000a82c:	00050413          	mv	s0,a0
8000a830:	859ff0ef          	jal	ra,8000a088 <dhcp_inc_pcb_refcount>
8000a834:	0a051e63          	bnez	a0,8000a8f0 <dhcp_inform+0xdc>
8000a838:	03400613          	li	a2,52
8000a83c:	00000593          	li	a1,0
8000a840:	00c10513          	addi	a0,sp,12
8000a844:	515020ef          	jal	ra,8000d558 <memset>
8000a848:	00700593          	li	a1,7
8000a84c:	00c10513          	addi	a0,sp,12
8000a850:	d35fe0ef          	jal	ra,80009584 <dhcp_set_state>
8000a854:	00a10693          	addi	a3,sp,10
8000a858:	00800613          	li	a2,8
8000a85c:	00c10593          	addi	a1,sp,12
8000a860:	00040513          	mv	a0,s0
8000a864:	dc9fe0ef          	jal	ra,8000962c <dhcp_create_msg>
8000a868:	00050913          	mv	s2,a0
8000a86c:	08050063          	beqz	a0,8000a8ec <dhcp_inform+0xd8>
8000a870:	00452483          	lw	s1,4(a0)
8000a874:	00a15783          	lhu	a5,10(sp)
8000a878:	03900693          	li	a3,57
8000a87c:	0f048493          	addi	s1,s1,240
8000a880:	00f48733          	add	a4,s1,a5
8000a884:	00278513          	addi	a0,a5,2
8000a888:	00178793          	addi	a5,a5,1
8000a88c:	01079793          	slli	a5,a5,0x10
8000a890:	0107d793          	srli	a5,a5,0x10
8000a894:	00d70023          	sb	a3,0(a4)
8000a898:	00f487b3          	add	a5,s1,a5
8000a89c:	00200713          	li	a4,2
8000a8a0:	00e78023          	sb	a4,0(a5)
8000a8a4:	02c45603          	lhu	a2,44(s0)
8000a8a8:	01051513          	slli	a0,a0,0x10
8000a8ac:	01055513          	srli	a0,a0,0x10
8000a8b0:	00048593          	mv	a1,s1
8000a8b4:	00a11523          	sh	a0,10(sp)
8000a8b8:	ce5fe0ef          	jal	ra,8000959c <dhcp_option_short>
8000a8bc:	00090613          	mv	a2,s2
8000a8c0:	00048593          	mv	a1,s1
8000a8c4:	00a11523          	sh	a0,10(sp)
8000a8c8:	f09fe0ef          	jal	ra,800097d0 <dhcp_option_trailer>
8000a8cc:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000a8d0:	00040713          	mv	a4,s0
8000a8d4:	04300693          	li	a3,67
8000a8d8:	84418613          	addi	a2,gp,-1980 # 800032b4 <ip_addr_broadcast>
8000a8dc:	00090593          	mv	a1,s2
8000a8e0:	9b5fe0ef          	jal	ra,80009294 <udp_sendto_if>
8000a8e4:	00090513          	mv	a0,s2
8000a8e8:	80cfd0ef          	jal	ra,800078f4 <pbuf_free>
8000a8ec:	91dff0ef          	jal	ra,8000a208 <dhcp_dec_pcb_refcount>
8000a8f0:	04c12083          	lw	ra,76(sp)
8000a8f4:	04812403          	lw	s0,72(sp)
8000a8f8:	04412483          	lw	s1,68(sp)
8000a8fc:	04012903          	lw	s2,64(sp)
8000a900:	05010113          	addi	sp,sp,80
8000a904:	00008067          	ret
8000a908:	00008067          	ret

8000a90c <dhcp_network_changed>:
8000a90c:	02852783          	lw	a5,40(a0)
8000a910:	02078a63          	beqz	a5,8000a944 <dhcp_network_changed+0x38>
8000a914:	0057c703          	lbu	a4,5(a5)
8000a918:	00500693          	li	a3,5
8000a91c:	00e6ec63          	bltu	a3,a4,8000a934 <dhcp_network_changed+0x28>
8000a920:	00300693          	li	a3,3
8000a924:	00d77c63          	bgeu	a4,a3,8000a93c <dhcp_network_changed+0x30>
8000a928:	00070e63          	beqz	a4,8000a944 <dhcp_network_changed+0x38>
8000a92c:	00078323          	sb	zero,6(a5)
8000a930:	b7cff06f          	j	80009cac <dhcp_discover>
8000a934:	00a00693          	li	a3,10
8000a938:	fed71ae3          	bne	a4,a3,8000a92c <dhcp_network_changed+0x20>
8000a93c:	00078323          	sb	zero,6(a5)
8000a940:	ee1fe06f          	j	80009820 <dhcp_reboot>
8000a944:	00008067          	ret

8000a948 <dhcp_arp_reply>:
8000a948:	12050a63          	beqz	a0,8000aa7c <dhcp_arp_reply+0x134>
8000a94c:	fd010113          	addi	sp,sp,-48
8000a950:	02112623          	sw	ra,44(sp)
8000a954:	02812423          	sw	s0,40(sp)
8000a958:	02912223          	sw	s1,36(sp)
8000a95c:	03212023          	sw	s2,32(sp)
8000a960:	01312e23          	sw	s3,28(sp)
8000a964:	01412c23          	sw	s4,24(sp)
8000a968:	02852403          	lw	s0,40(a0)
8000a96c:	0e040863          	beqz	s0,8000aa5c <dhcp_arp_reply+0x114>
8000a970:	00544703          	lbu	a4,5(s0)
8000a974:	00800793          	li	a5,8
8000a978:	0ef71263          	bne	a4,a5,8000aa5c <dhcp_arp_reply+0x114>
8000a97c:	0005a703          	lw	a4,0(a1)
8000a980:	01c42783          	lw	a5,28(s0)
8000a984:	0cf71c63          	bne	a4,a5,8000aa5c <dhcp_arp_reply+0x114>
8000a988:	00050a13          	mv	s4,a0
8000a98c:	00c00593          	li	a1,12
8000a990:	00040513          	mv	a0,s0
8000a994:	bf1fe0ef          	jal	ra,80009584 <dhcp_set_state>
8000a998:	00e10693          	addi	a3,sp,14
8000a99c:	00400613          	li	a2,4
8000a9a0:	00040593          	mv	a1,s0
8000a9a4:	000a0513          	mv	a0,s4
8000a9a8:	c85fe0ef          	jal	ra,8000962c <dhcp_create_msg>
8000a9ac:	00050913          	mv	s2,a0
8000a9b0:	08050863          	beqz	a0,8000aa40 <dhcp_arp_reply+0xf8>
8000a9b4:	00452483          	lw	s1,4(a0)
8000a9b8:	00e15783          	lhu	a5,14(sp)
8000a9bc:	03200693          	li	a3,50
8000a9c0:	0f048493          	addi	s1,s1,240
8000a9c4:	00f48733          	add	a4,s1,a5
8000a9c8:	00278993          	addi	s3,a5,2
8000a9cc:	00178793          	addi	a5,a5,1
8000a9d0:	01079793          	slli	a5,a5,0x10
8000a9d4:	0107d793          	srli	a5,a5,0x10
8000a9d8:	00d70023          	sb	a3,0(a4)
8000a9dc:	00f487b3          	add	a5,s1,a5
8000a9e0:	00400713          	li	a4,4
8000a9e4:	00e78023          	sb	a4,0(a5)
8000a9e8:	01c42503          	lw	a0,28(s0)
8000a9ec:	01099993          	slli	s3,s3,0x10
8000a9f0:	0109d993          	srli	s3,s3,0x10
8000a9f4:	01311723          	sh	s3,14(sp)
8000a9f8:	cf1fb0ef          	jal	ra,800066e8 <lwip_htonl>
8000a9fc:	00050613          	mv	a2,a0
8000aa00:	00048593          	mv	a1,s1
8000aa04:	00098513          	mv	a0,s3
8000aa08:	bc5fe0ef          	jal	ra,800095cc <dhcp_option_long>
8000aa0c:	00090613          	mv	a2,s2
8000aa10:	00048593          	mv	a1,s1
8000aa14:	00a11723          	sh	a0,14(sp)
8000aa18:	db9fe0ef          	jal	ra,800097d0 <dhcp_option_trailer>
8000aa1c:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000aa20:	84818793          	addi	a5,gp,-1976 # 800032b8 <ip_addr_any>
8000aa24:	000a0713          	mv	a4,s4
8000aa28:	04300693          	li	a3,67
8000aa2c:	84418613          	addi	a2,gp,-1980 # 800032b4 <ip_addr_broadcast>
8000aa30:	00090593          	mv	a1,s2
8000aa34:	e6cfe0ef          	jal	ra,800090a0 <udp_sendto_if_src>
8000aa38:	00090513          	mv	a0,s2
8000aa3c:	eb9fc0ef          	jal	ra,800078f4 <pbuf_free>
8000aa40:	00644783          	lbu	a5,6(s0)
8000aa44:	0ff00713          	li	a4,255
8000aa48:	00e78663          	beq	a5,a4,8000aa54 <dhcp_arp_reply+0x10c>
8000aa4c:	00178793          	addi	a5,a5,1
8000aa50:	00f40323          	sb	a5,6(s0)
8000aa54:	01400793          	li	a5,20
8000aa58:	00f41423          	sh	a5,8(s0)
8000aa5c:	02c12083          	lw	ra,44(sp)
8000aa60:	02812403          	lw	s0,40(sp)
8000aa64:	02412483          	lw	s1,36(sp)
8000aa68:	02012903          	lw	s2,32(sp)
8000aa6c:	01c12983          	lw	s3,28(sp)
8000aa70:	01812a03          	lw	s4,24(sp)
8000aa74:	03010113          	addi	sp,sp,48
8000aa78:	00008067          	ret
8000aa7c:	00008067          	ret

8000aa80 <dhcp_renew>:
8000aa80:	fd010113          	addi	sp,sp,-48
8000aa84:	02112623          	sw	ra,44(sp)
8000aa88:	02812423          	sw	s0,40(sp)
8000aa8c:	01312e23          	sw	s3,28(sp)
8000aa90:	02912223          	sw	s1,36(sp)
8000aa94:	03212023          	sw	s2,32(sp)
8000aa98:	02852483          	lw	s1,40(a0)
8000aa9c:	00050993          	mv	s3,a0
8000aaa0:	00500593          	li	a1,5
8000aaa4:	00048513          	mv	a0,s1
8000aaa8:	addfe0ef          	jal	ra,80009584 <dhcp_set_state>
8000aaac:	00e10693          	addi	a3,sp,14
8000aab0:	00300613          	li	a2,3
8000aab4:	00048593          	mv	a1,s1
8000aab8:	00098513          	mv	a0,s3
8000aabc:	b71fe0ef          	jal	ra,8000962c <dhcp_create_msg>
8000aac0:	fff00413          	li	s0,-1
8000aac4:	10050063          	beqz	a0,8000abc4 <dhcp_renew+0x144>
8000aac8:	00452403          	lw	s0,4(a0)
8000aacc:	00e15783          	lhu	a5,14(sp)
8000aad0:	00050913          	mv	s2,a0
8000aad4:	0f040413          	addi	s0,s0,240
8000aad8:	00f40733          	add	a4,s0,a5
8000aadc:	00278513          	addi	a0,a5,2
8000aae0:	00178793          	addi	a5,a5,1
8000aae4:	01079793          	slli	a5,a5,0x10
8000aae8:	03900693          	li	a3,57
8000aaec:	0107d793          	srli	a5,a5,0x10
8000aaf0:	00d70023          	sb	a3,0(a4)
8000aaf4:	00f407b3          	add	a5,s0,a5
8000aaf8:	00200713          	li	a4,2
8000aafc:	00e78023          	sb	a4,0(a5)
8000ab00:	02c9d603          	lhu	a2,44(s3)
8000ab04:	01051513          	slli	a0,a0,0x10
8000ab08:	00040593          	mv	a1,s0
8000ab0c:	01055513          	srli	a0,a0,0x10
8000ab10:	00a11723          	sh	a0,14(sp)
8000ab14:	a89fe0ef          	jal	ra,8000959c <dhcp_option_short>
8000ab18:	00a40733          	add	a4,s0,a0
8000ab1c:	03700693          	li	a3,55
8000ab20:	00d70023          	sb	a3,0(a4)
8000ab24:	00150713          	addi	a4,a0,1
8000ab28:	01071713          	slli	a4,a4,0x10
8000ab2c:	01075713          	srli	a4,a4,0x10
8000ab30:	00e40733          	add	a4,s0,a4
8000ab34:	00300613          	li	a2,3
8000ab38:	00c70023          	sb	a2,0(a4)
8000ab3c:	00250713          	addi	a4,a0,2
8000ab40:	01071713          	slli	a4,a4,0x10
8000ab44:	01075713          	srli	a4,a4,0x10
8000ab48:	00e40733          	add	a4,s0,a4
8000ab4c:	00100693          	li	a3,1
8000ab50:	00d70023          	sb	a3,0(a4)
8000ab54:	00050793          	mv	a5,a0
8000ab58:	00350693          	addi	a3,a0,3
8000ab5c:	01069693          	slli	a3,a3,0x10
8000ab60:	00478793          	addi	a5,a5,4
8000ab64:	0106d693          	srli	a3,a3,0x10
8000ab68:	01079793          	slli	a5,a5,0x10
8000ab6c:	00d406b3          	add	a3,s0,a3
8000ab70:	00550513          	addi	a0,a0,5
8000ab74:	0107d793          	srli	a5,a5,0x10
8000ab78:	00c68023          	sb	a2,0(a3)
8000ab7c:	00f407b3          	add	a5,s0,a5
8000ab80:	01c00713          	li	a4,28
8000ab84:	01051513          	slli	a0,a0,0x10
8000ab88:	00e78023          	sb	a4,0(a5)
8000ab8c:	01055513          	srli	a0,a0,0x10
8000ab90:	00040593          	mv	a1,s0
8000ab94:	00090613          	mv	a2,s2
8000ab98:	00a11723          	sh	a0,14(sp)
8000ab9c:	c35fe0ef          	jal	ra,800097d0 <dhcp_option_trailer>
8000aba0:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000aba4:	00098713          	mv	a4,s3
8000aba8:	04300693          	li	a3,67
8000abac:	01848613          	addi	a2,s1,24
8000abb0:	00090593          	mv	a1,s2
8000abb4:	ee0fe0ef          	jal	ra,80009294 <udp_sendto_if>
8000abb8:	00050413          	mv	s0,a0
8000abbc:	00090513          	mv	a0,s2
8000abc0:	d35fc0ef          	jal	ra,800078f4 <pbuf_free>
8000abc4:	0064c783          	lbu	a5,6(s1)
8000abc8:	0ff00713          	li	a4,255
8000abcc:	00e78663          	beq	a5,a4,8000abd8 <dhcp_renew+0x158>
8000abd0:	00178793          	addi	a5,a5,1
8000abd4:	00f48323          	sb	a5,6(s1)
8000abd8:	0064c503          	lbu	a0,6(s1)
8000abdc:	00900793          	li	a5,9
8000abe0:	04a7e863          	bltu	a5,a0,8000ac30 <dhcp_renew+0x1b0>
8000abe4:	00551793          	slli	a5,a0,0x5
8000abe8:	40a787b3          	sub	a5,a5,a0
8000abec:	00279793          	slli	a5,a5,0x2
8000abf0:	00f50533          	add	a0,a0,a5
8000abf4:	00451513          	slli	a0,a0,0x4
8000abf8:	01051513          	slli	a0,a0,0x10
8000abfc:	01055513          	srli	a0,a0,0x10
8000ac00:	1f400593          	li	a1,500
8000ac04:	1f350513          	addi	a0,a0,499
8000ac08:	058030ef          	jal	ra,8000dc60 <__divsi3>
8000ac0c:	00a49423          	sh	a0,8(s1)
8000ac10:	02c12083          	lw	ra,44(sp)
8000ac14:	00040513          	mv	a0,s0
8000ac18:	02812403          	lw	s0,40(sp)
8000ac1c:	02412483          	lw	s1,36(sp)
8000ac20:	02012903          	lw	s2,32(sp)
8000ac24:	01c12983          	lw	s3,28(sp)
8000ac28:	03010113          	addi	sp,sp,48
8000ac2c:	00008067          	ret
8000ac30:	00005537          	lui	a0,0x5
8000ac34:	e2050513          	addi	a0,a0,-480 # 4e20 <_stack_size+0x3e20>
8000ac38:	fc9ff06f          	j	8000ac00 <dhcp_renew+0x180>

8000ac3c <dhcp_supplied_address>:
8000ac3c:	02050863          	beqz	a0,8000ac6c <dhcp_supplied_address+0x30>
8000ac40:	02852783          	lw	a5,40(a0)
8000ac44:	00000513          	li	a0,0
8000ac48:	02078463          	beqz	a5,8000ac70 <dhcp_supplied_address+0x34>
8000ac4c:	0057c783          	lbu	a5,5(a5)
8000ac50:	00a00713          	li	a4,10
8000ac54:	00100513          	li	a0,1
8000ac58:	00e78663          	beq	a5,a4,8000ac64 <dhcp_supplied_address+0x28>
8000ac5c:	ffc78513          	addi	a0,a5,-4
8000ac60:	00253513          	sltiu	a0,a0,2
8000ac64:	0ff57513          	andi	a0,a0,255
8000ac68:	00008067          	ret
8000ac6c:	00000513          	li	a0,0
8000ac70:	00008067          	ret

8000ac74 <dhcp_release_and_stop>:
8000ac74:	fd010113          	addi	sp,sp,-48
8000ac78:	02112623          	sw	ra,44(sp)
8000ac7c:	02812423          	sw	s0,40(sp)
8000ac80:	02912223          	sw	s1,36(sp)
8000ac84:	03212023          	sw	s2,32(sp)
8000ac88:	01312e23          	sw	s3,28(sp)
8000ac8c:	01412c23          	sw	s4,24(sp)
8000ac90:	02852403          	lw	s0,40(a0)
8000ac94:	10040e63          	beqz	s0,8000adb0 <dhcp_release_and_stop+0x13c>
8000ac98:	00544783          	lbu	a5,5(s0)
8000ac9c:	10078a63          	beqz	a5,8000adb0 <dhcp_release_and_stop+0x13c>
8000aca0:	01842783          	lw	a5,24(s0)
8000aca4:	00042e23          	sw	zero,28(s0)
8000aca8:	00042c23          	sw	zero,24(s0)
8000acac:	02042023          	sw	zero,32(s0)
8000acb0:	02042223          	sw	zero,36(s0)
8000acb4:	02042823          	sw	zero,48(s0)
8000acb8:	02042623          	sw	zero,44(s0)
8000acbc:	02042423          	sw	zero,40(s0)
8000acc0:	00041723          	sh	zero,14(s0)
8000acc4:	00042823          	sw	zero,16(s0)
8000acc8:	00041a23          	sh	zero,20(s0)
8000accc:	00050493          	mv	s1,a0
8000acd0:	00f12623          	sw	a5,12(sp)
8000acd4:	f69ff0ef          	jal	ra,8000ac3c <dhcp_supplied_address>
8000acd8:	0a050463          	beqz	a0,8000ad80 <dhcp_release_and_stop+0x10c>
8000acdc:	00a10693          	addi	a3,sp,10
8000ace0:	00700613          	li	a2,7
8000ace4:	00040593          	mv	a1,s0
8000ace8:	00048513          	mv	a0,s1
8000acec:	941fe0ef          	jal	ra,8000962c <dhcp_create_msg>
8000acf0:	00050993          	mv	s3,a0
8000acf4:	08050663          	beqz	a0,8000ad80 <dhcp_release_and_stop+0x10c>
8000acf8:	00452903          	lw	s2,4(a0)
8000acfc:	00a15783          	lhu	a5,10(sp)
8000ad00:	03600693          	li	a3,54
8000ad04:	0f090913          	addi	s2,s2,240
8000ad08:	00f90733          	add	a4,s2,a5
8000ad0c:	00278a13          	addi	s4,a5,2
8000ad10:	00178793          	addi	a5,a5,1
8000ad14:	01079793          	slli	a5,a5,0x10
8000ad18:	0107d793          	srli	a5,a5,0x10
8000ad1c:	00d70023          	sb	a3,0(a4)
8000ad20:	00f907b3          	add	a5,s2,a5
8000ad24:	00400713          	li	a4,4
8000ad28:	00e78023          	sb	a4,0(a5)
8000ad2c:	00c12503          	lw	a0,12(sp)
8000ad30:	010a1a13          	slli	s4,s4,0x10
8000ad34:	010a5a13          	srli	s4,s4,0x10
8000ad38:	01411523          	sh	s4,10(sp)
8000ad3c:	9adfb0ef          	jal	ra,800066e8 <lwip_htonl>
8000ad40:	00050613          	mv	a2,a0
8000ad44:	00090593          	mv	a1,s2
8000ad48:	000a0513          	mv	a0,s4
8000ad4c:	881fe0ef          	jal	ra,800095cc <dhcp_option_long>
8000ad50:	00098613          	mv	a2,s3
8000ad54:	00090593          	mv	a1,s2
8000ad58:	00a11523          	sh	a0,10(sp)
8000ad5c:	a75fe0ef          	jal	ra,800097d0 <dhcp_option_trailer>
8000ad60:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000ad64:	00048713          	mv	a4,s1
8000ad68:	04300693          	li	a3,67
8000ad6c:	00c10613          	addi	a2,sp,12
8000ad70:	00098593          	mv	a1,s3
8000ad74:	d20fe0ef          	jal	ra,80009294 <udp_sendto_if>
8000ad78:	00098513          	mv	a0,s3
8000ad7c:	b79fc0ef          	jal	ra,800078f4 <pbuf_free>
8000ad80:	84818693          	addi	a3,gp,-1976 # 800032b8 <ip_addr_any>
8000ad84:	84818613          	addi	a2,gp,-1976 # 800032b8 <ip_addr_any>
8000ad88:	00048513          	mv	a0,s1
8000ad8c:	84818593          	addi	a1,gp,-1976 # 800032b8 <ip_addr_any>
8000ad90:	c2cfc0ef          	jal	ra,800071bc <netif_set_addr>
8000ad94:	00000593          	li	a1,0
8000ad98:	00040513          	mv	a0,s0
8000ad9c:	fe8fe0ef          	jal	ra,80009584 <dhcp_set_state>
8000ada0:	00444783          	lbu	a5,4(s0)
8000ada4:	00078663          	beqz	a5,8000adb0 <dhcp_release_and_stop+0x13c>
8000ada8:	c60ff0ef          	jal	ra,8000a208 <dhcp_dec_pcb_refcount>
8000adac:	00040223          	sb	zero,4(s0)
8000adb0:	02c12083          	lw	ra,44(sp)
8000adb4:	02812403          	lw	s0,40(sp)
8000adb8:	02412483          	lw	s1,36(sp)
8000adbc:	02012903          	lw	s2,32(sp)
8000adc0:	01c12983          	lw	s3,28(sp)
8000adc4:	01812a03          	lw	s4,24(sp)
8000adc8:	03010113          	addi	sp,sp,48
8000adcc:	00008067          	ret

8000add0 <dhcp_start>:
8000add0:	ff010113          	addi	sp,sp,-16
8000add4:	00912223          	sw	s1,4(sp)
8000add8:	00112623          	sw	ra,12(sp)
8000addc:	00812423          	sw	s0,8(sp)
8000ade0:	01212023          	sw	s2,0(sp)
8000ade4:	ff000493          	li	s1,-16
8000ade8:	08050263          	beqz	a0,8000ae6c <dhcp_start+0x9c>
8000adec:	03554783          	lbu	a5,53(a0)
8000adf0:	ff000493          	li	s1,-16
8000adf4:	0017f793          	andi	a5,a5,1
8000adf8:	06078a63          	beqz	a5,8000ae6c <dhcp_start+0x9c>
8000adfc:	02c55703          	lhu	a4,44(a0)
8000ae00:	23f00793          	li	a5,575
8000ae04:	02852903          	lw	s2,40(a0)
8000ae08:	00e7e663          	bltu	a5,a4,8000ae14 <dhcp_start+0x44>
8000ae0c:	fff00493          	li	s1,-1
8000ae10:	05c0006f          	j	8000ae6c <dhcp_start+0x9c>
8000ae14:	00050413          	mv	s0,a0
8000ae18:	06091863          	bnez	s2,8000ae88 <dhcp_start+0xb8>
8000ae1c:	03400513          	li	a0,52
8000ae20:	8b0fc0ef          	jal	ra,80006ed0 <lwip_malloc>
8000ae24:	00050913          	mv	s2,a0
8000ae28:	fe0502e3          	beqz	a0,8000ae0c <dhcp_start+0x3c>
8000ae2c:	02a42423          	sw	a0,40(s0)
8000ae30:	03400613          	li	a2,52
8000ae34:	00000593          	li	a1,0
8000ae38:	00090513          	mv	a0,s2
8000ae3c:	71c020ef          	jal	ra,8000d558 <memset>
8000ae40:	a48ff0ef          	jal	ra,8000a088 <dhcp_inc_pcb_refcount>
8000ae44:	00050493          	mv	s1,a0
8000ae48:	fc0512e3          	bnez	a0,8000ae0c <dhcp_start+0x3c>
8000ae4c:	00100793          	li	a5,1
8000ae50:	00f90223          	sb	a5,4(s2)
8000ae54:	03544783          	lbu	a5,53(s0)
8000ae58:	0047f793          	andi	a5,a5,4
8000ae5c:	02079e63          	bnez	a5,8000ae98 <dhcp_start+0xc8>
8000ae60:	00200593          	li	a1,2
8000ae64:	00090513          	mv	a0,s2
8000ae68:	f1cfe0ef          	jal	ra,80009584 <dhcp_set_state>
8000ae6c:	00c12083          	lw	ra,12(sp)
8000ae70:	00812403          	lw	s0,8(sp)
8000ae74:	00048513          	mv	a0,s1
8000ae78:	00012903          	lw	s2,0(sp)
8000ae7c:	00412483          	lw	s1,4(sp)
8000ae80:	01010113          	addi	sp,sp,16
8000ae84:	00008067          	ret
8000ae88:	00494783          	lbu	a5,4(s2)
8000ae8c:	fa0782e3          	beqz	a5,8000ae30 <dhcp_start+0x60>
8000ae90:	b78ff0ef          	jal	ra,8000a208 <dhcp_dec_pcb_refcount>
8000ae94:	f9dff06f          	j	8000ae30 <dhcp_start+0x60>
8000ae98:	00040513          	mv	a0,s0
8000ae9c:	e11fe0ef          	jal	ra,80009cac <dhcp_discover>
8000aea0:	00050493          	mv	s1,a0
8000aea4:	fc0504e3          	beqz	a0,8000ae6c <dhcp_start+0x9c>
8000aea8:	00040513          	mv	a0,s0
8000aeac:	dc9ff0ef          	jal	ra,8000ac74 <dhcp_release_and_stop>
8000aeb0:	f5dff06f          	j	8000ae0c <dhcp_start+0x3c>

8000aeb4 <dhcp_coarse_tmr>:
8000aeb4:	fc010113          	addi	sp,sp,-64
8000aeb8:	02812c23          	sw	s0,56(sp)
8000aebc:	8f41a403          	lw	s0,-1804(gp) # 80003364 <netif_list>
8000aec0:	03312623          	sw	s3,44(sp)
8000aec4:	000029b7          	lui	s3,0x2
8000aec8:	03212823          	sw	s2,48(sp)
8000aecc:	03412423          	sw	s4,40(sp)
8000aed0:	03512223          	sw	s5,36(sp)
8000aed4:	03612023          	sw	s6,32(sp)
8000aed8:	01712e23          	sw	s7,28(sp)
8000aedc:	02112e23          	sw	ra,60(sp)
8000aee0:	02912a23          	sw	s1,52(sp)
8000aee4:	01812c23          	sw	s8,24(sp)
8000aee8:	01912a23          	sw	s9,20(sp)
8000aeec:	00100913          	li	s2,1
8000aef0:	00a00a13          	li	s4,10
8000aef4:	43200a93          	li	s5,1074
8000aef8:	71098993          	addi	s3,s3,1808 # 2710 <_stack_size+0x1710>
8000aefc:	02041c63          	bnez	s0,8000af34 <dhcp_coarse_tmr+0x80>
8000af00:	03c12083          	lw	ra,60(sp)
8000af04:	03812403          	lw	s0,56(sp)
8000af08:	03412483          	lw	s1,52(sp)
8000af0c:	03012903          	lw	s2,48(sp)
8000af10:	02c12983          	lw	s3,44(sp)
8000af14:	02812a03          	lw	s4,40(sp)
8000af18:	02412a83          	lw	s5,36(sp)
8000af1c:	02012b03          	lw	s6,32(sp)
8000af20:	01c12b83          	lw	s7,28(sp)
8000af24:	01812c03          	lw	s8,24(sp)
8000af28:	01412c83          	lw	s9,20(sp)
8000af2c:	04010113          	addi	sp,sp,64
8000af30:	00008067          	ret
8000af34:	02842783          	lw	a5,40(s0)
8000af38:	02078e63          	beqz	a5,8000af74 <dhcp_coarse_tmr+0xc0>
8000af3c:	0057c703          	lbu	a4,5(a5)
8000af40:	02070a63          	beqz	a4,8000af74 <dhcp_coarse_tmr+0xc0>
8000af44:	0147d683          	lhu	a3,20(a5)
8000af48:	02068a63          	beqz	a3,8000af7c <dhcp_coarse_tmr+0xc8>
8000af4c:	0127d703          	lhu	a4,18(a5)
8000af50:	00170713          	addi	a4,a4,1
8000af54:	01071713          	slli	a4,a4,0x10
8000af58:	01075713          	srli	a4,a4,0x10
8000af5c:	00e79923          	sh	a4,18(a5)
8000af60:	00e69e63          	bne	a3,a4,8000af7c <dhcp_coarse_tmr+0xc8>
8000af64:	00040513          	mv	a0,s0
8000af68:	d0dff0ef          	jal	ra,8000ac74 <dhcp_release_and_stop>
8000af6c:	00040513          	mv	a0,s0
8000af70:	e61ff0ef          	jal	ra,8000add0 <dhcp_start>
8000af74:	00042403          	lw	s0,0(s0)
8000af78:	f85ff06f          	j	8000aefc <dhcp_coarse_tmr+0x48>
8000af7c:	0107d703          	lhu	a4,16(a5)
8000af80:	1a070663          	beqz	a4,8000b12c <dhcp_coarse_tmr+0x278>
8000af84:	fff70693          	addi	a3,a4,-1
8000af88:	00d79823          	sh	a3,16(a5)
8000af8c:	1b271063          	bne	a4,s2,8000b12c <dhcp_coarse_tmr+0x278>
8000af90:	02842c03          	lw	s8,40(s0)
8000af94:	005c4783          	lbu	a5,5(s8)
8000af98:	fcfa6ee3          	bltu	s4,a5,8000af74 <dhcp_coarse_tmr+0xc0>
8000af9c:	00fad7b3          	srl	a5,s5,a5
8000afa0:	0017f793          	andi	a5,a5,1
8000afa4:	fc0788e3          	beqz	a5,8000af74 <dhcp_coarse_tmr+0xc0>
8000afa8:	00400593          	li	a1,4
8000afac:	000c0513          	mv	a0,s8
8000afb0:	dd4fe0ef          	jal	ra,80009584 <dhcp_set_state>
8000afb4:	00e10693          	addi	a3,sp,14
8000afb8:	00300613          	li	a2,3
8000afbc:	000c0593          	mv	a1,s8
8000afc0:	00040513          	mv	a0,s0
8000afc4:	e68fe0ef          	jal	ra,8000962c <dhcp_create_msg>
8000afc8:	00050c93          	mv	s9,a0
8000afcc:	0e050a63          	beqz	a0,8000b0c0 <dhcp_coarse_tmr+0x20c>
8000afd0:	00452483          	lw	s1,4(a0)
8000afd4:	00e15783          	lhu	a5,14(sp)
8000afd8:	03900693          	li	a3,57
8000afdc:	0f048493          	addi	s1,s1,240
8000afe0:	00f48733          	add	a4,s1,a5
8000afe4:	00278513          	addi	a0,a5,2
8000afe8:	00178793          	addi	a5,a5,1
8000afec:	01079793          	slli	a5,a5,0x10
8000aff0:	0107d793          	srli	a5,a5,0x10
8000aff4:	00d70023          	sb	a3,0(a4)
8000aff8:	00f487b3          	add	a5,s1,a5
8000affc:	00200713          	li	a4,2
8000b000:	00e78023          	sb	a4,0(a5)
8000b004:	02c45603          	lhu	a2,44(s0)
8000b008:	01051513          	slli	a0,a0,0x10
8000b00c:	01055513          	srli	a0,a0,0x10
8000b010:	00048593          	mv	a1,s1
8000b014:	00a11723          	sh	a0,14(sp)
8000b018:	d84fe0ef          	jal	ra,8000959c <dhcp_option_short>
8000b01c:	00a48733          	add	a4,s1,a0
8000b020:	03700693          	li	a3,55
8000b024:	00d70023          	sb	a3,0(a4)
8000b028:	00150713          	addi	a4,a0,1
8000b02c:	01071713          	slli	a4,a4,0x10
8000b030:	01075713          	srli	a4,a4,0x10
8000b034:	00300693          	li	a3,3
8000b038:	00e48733          	add	a4,s1,a4
8000b03c:	00d70023          	sb	a3,0(a4)
8000b040:	00250713          	addi	a4,a0,2
8000b044:	01071713          	slli	a4,a4,0x10
8000b048:	01075713          	srli	a4,a4,0x10
8000b04c:	00e48733          	add	a4,s1,a4
8000b050:	01270023          	sb	s2,0(a4)
8000b054:	00050793          	mv	a5,a0
8000b058:	00350713          	addi	a4,a0,3
8000b05c:	01071713          	slli	a4,a4,0x10
8000b060:	00478793          	addi	a5,a5,4
8000b064:	01075713          	srli	a4,a4,0x10
8000b068:	01079793          	slli	a5,a5,0x10
8000b06c:	00e48733          	add	a4,s1,a4
8000b070:	00550513          	addi	a0,a0,5
8000b074:	0107d793          	srli	a5,a5,0x10
8000b078:	00d70023          	sb	a3,0(a4)
8000b07c:	00f487b3          	add	a5,s1,a5
8000b080:	01c00713          	li	a4,28
8000b084:	01051513          	slli	a0,a0,0x10
8000b088:	00e78023          	sb	a4,0(a5)
8000b08c:	01055513          	srli	a0,a0,0x10
8000b090:	000c8613          	mv	a2,s9
8000b094:	00048593          	mv	a1,s1
8000b098:	00a11723          	sh	a0,14(sp)
8000b09c:	f34fe0ef          	jal	ra,800097d0 <dhcp_option_trailer>
8000b0a0:	90c1a503          	lw	a0,-1780(gp) # 8000337c <dhcp_pcb>
8000b0a4:	00040713          	mv	a4,s0
8000b0a8:	04300693          	li	a3,67
8000b0ac:	84418613          	addi	a2,gp,-1980 # 800032b4 <ip_addr_broadcast>
8000b0b0:	000c8593          	mv	a1,s9
8000b0b4:	9e0fe0ef          	jal	ra,80009294 <udp_sendto_if>
8000b0b8:	000c8513          	mv	a0,s9
8000b0bc:	839fc0ef          	jal	ra,800078f4 <pbuf_free>
8000b0c0:	006c4783          	lbu	a5,6(s8)
8000b0c4:	0ff00713          	li	a4,255
8000b0c8:	00e78663          	beq	a5,a4,8000b0d4 <dhcp_coarse_tmr+0x220>
8000b0cc:	00178793          	addi	a5,a5,1
8000b0d0:	00fc0323          	sb	a5,6(s8)
8000b0d4:	006c4783          	lbu	a5,6(s8)
8000b0d8:	00900713          	li	a4,9
8000b0dc:	00098513          	mv	a0,s3
8000b0e0:	02f76063          	bltu	a4,a5,8000b100 <dhcp_coarse_tmr+0x24c>
8000b0e4:	00579513          	slli	a0,a5,0x5
8000b0e8:	40f50533          	sub	a0,a0,a5
8000b0ec:	00251513          	slli	a0,a0,0x2
8000b0f0:	00a787b3          	add	a5,a5,a0
8000b0f4:	00379793          	slli	a5,a5,0x3
8000b0f8:	01079513          	slli	a0,a5,0x10
8000b0fc:	01055513          	srli	a0,a0,0x10
8000b100:	1f400593          	li	a1,500
8000b104:	1f350513          	addi	a0,a0,499
8000b108:	359020ef          	jal	ra,8000dc60 <__divsi3>
8000b10c:	014c5783          	lhu	a5,20(s8)
8000b110:	012c5703          	lhu	a4,18(s8)
8000b114:	00ac1423          	sh	a0,8(s8)
8000b118:	40e787b3          	sub	a5,a5,a4
8000b11c:	e4f95ce3          	bge	s2,a5,8000af74 <dhcp_coarse_tmr+0xc0>
8000b120:	4017d793          	srai	a5,a5,0x1
8000b124:	00fc1823          	sh	a5,16(s8)
8000b128:	e4dff06f          	j	8000af74 <dhcp_coarse_tmr+0xc0>
8000b12c:	00e7d703          	lhu	a4,14(a5)
8000b130:	e40702e3          	beqz	a4,8000af74 <dhcp_coarse_tmr+0xc0>
8000b134:	fff70693          	addi	a3,a4,-1
8000b138:	00d79723          	sh	a3,14(a5)
8000b13c:	e3271ce3          	bne	a4,s2,8000af74 <dhcp_coarse_tmr+0xc0>
8000b140:	02842483          	lw	s1,40(s0)
8000b144:	0054c783          	lbu	a5,5(s1)
8000b148:	0fb7f713          	andi	a4,a5,251
8000b14c:	01270463          	beq	a4,s2,8000b154 <dhcp_coarse_tmr+0x2a0>
8000b150:	e34792e3          	bne	a5,s4,8000af74 <dhcp_coarse_tmr+0xc0>
8000b154:	00040513          	mv	a0,s0
8000b158:	929ff0ef          	jal	ra,8000aa80 <dhcp_renew>
8000b15c:	00c4d783          	lhu	a5,12(s1)
8000b160:	0124d703          	lhu	a4,18(s1)
8000b164:	40e787b3          	sub	a5,a5,a4
8000b168:	e0f956e3          	bge	s2,a5,8000af74 <dhcp_coarse_tmr+0xc0>
8000b16c:	4017d793          	srai	a5,a5,0x1
8000b170:	00f49723          	sh	a5,14(s1)
8000b174:	e01ff06f          	j	8000af74 <dhcp_coarse_tmr+0xc0>

8000b178 <dhcp_fine_tmr>:
8000b178:	fe010113          	addi	sp,sp,-32
8000b17c:	00812c23          	sw	s0,24(sp)
8000b180:	8f41a403          	lw	s0,-1804(gp) # 80003364 <netif_list>
8000b184:	00912a23          	sw	s1,20(sp)
8000b188:	01212823          	sw	s2,16(sp)
8000b18c:	01312623          	sw	s3,12(sp)
8000b190:	01412423          	sw	s4,8(sp)
8000b194:	01512223          	sw	s5,4(sp)
8000b198:	01612023          	sw	s6,0(sp)
8000b19c:	00112e23          	sw	ra,28(sp)
8000b1a0:	00100493          	li	s1,1
8000b1a4:	00c00913          	li	s2,12
8000b1a8:	00600993          	li	s3,6
8000b1ac:	00800a13          	li	s4,8
8000b1b0:	00300a93          	li	s5,3
8000b1b4:	00500b13          	li	s6,5
8000b1b8:	02041663          	bnez	s0,8000b1e4 <dhcp_fine_tmr+0x6c>
8000b1bc:	01c12083          	lw	ra,28(sp)
8000b1c0:	01812403          	lw	s0,24(sp)
8000b1c4:	01412483          	lw	s1,20(sp)
8000b1c8:	01012903          	lw	s2,16(sp)
8000b1cc:	00c12983          	lw	s3,12(sp)
8000b1d0:	00812a03          	lw	s4,8(sp)
8000b1d4:	00412a83          	lw	s5,4(sp)
8000b1d8:	00012b03          	lw	s6,0(sp)
8000b1dc:	02010113          	addi	sp,sp,32
8000b1e0:	00008067          	ret
8000b1e4:	02842703          	lw	a4,40(s0)
8000b1e8:	00070a63          	beqz	a4,8000b1fc <dhcp_fine_tmr+0x84>
8000b1ec:	00875783          	lhu	a5,8(a4)
8000b1f0:	00f4fa63          	bgeu	s1,a5,8000b204 <dhcp_fine_tmr+0x8c>
8000b1f4:	fff78793          	addi	a5,a5,-1
8000b1f8:	00f71423          	sh	a5,8(a4)
8000b1fc:	00042403          	lw	s0,0(s0)
8000b200:	fb9ff06f          	j	8000b1b8 <dhcp_fine_tmr+0x40>
8000b204:	fe979ce3          	bne	a5,s1,8000b1fc <dhcp_fine_tmr+0x84>
8000b208:	00071423          	sh	zero,8(a4)
8000b20c:	02842703          	lw	a4,40(s0)
8000b210:	00574783          	lbu	a5,5(a4)
8000b214:	01278463          	beq	a5,s2,8000b21c <dhcp_fine_tmr+0xa4>
8000b218:	01379863          	bne	a5,s3,8000b228 <dhcp_fine_tmr+0xb0>
8000b21c:	00040513          	mv	a0,s0
8000b220:	a8dfe0ef          	jal	ra,80009cac <dhcp_discover>
8000b224:	fd9ff06f          	j	8000b1fc <dhcp_fine_tmr+0x84>
8000b228:	02979463          	bne	a5,s1,8000b250 <dhcp_fine_tmr+0xd8>
8000b22c:	00674783          	lbu	a5,6(a4)
8000b230:	00040513          	mv	a0,s0
8000b234:	00fb6663          	bltu	s6,a5,8000b240 <dhcp_fine_tmr+0xc8>
8000b238:	ff8fe0ef          	jal	ra,80009a30 <dhcp_select>
8000b23c:	fc1ff06f          	j	8000b1fc <dhcp_fine_tmr+0x84>
8000b240:	a35ff0ef          	jal	ra,8000ac74 <dhcp_release_and_stop>
8000b244:	00040513          	mv	a0,s0
8000b248:	b89ff0ef          	jal	ra,8000add0 <dhcp_start>
8000b24c:	fb1ff06f          	j	8000b1fc <dhcp_fine_tmr+0x84>
8000b250:	03479063          	bne	a5,s4,8000b270 <dhcp_fine_tmr+0xf8>
8000b254:	00674783          	lbu	a5,6(a4)
8000b258:	00040513          	mv	a0,s0
8000b25c:	00f4e663          	bltu	s1,a5,8000b268 <dhcp_fine_tmr+0xf0>
8000b260:	c11fe0ef          	jal	ra,80009e70 <dhcp_check>
8000b264:	f99ff06f          	j	8000b1fc <dhcp_fine_tmr+0x84>
8000b268:	c6dfe0ef          	jal	ra,80009ed4 <dhcp_bind>
8000b26c:	f91ff06f          	j	8000b1fc <dhcp_fine_tmr+0x84>
8000b270:	f95796e3          	bne	a5,s5,8000b1fc <dhcp_fine_tmr+0x84>
8000b274:	00674783          	lbu	a5,6(a4)
8000b278:	00040513          	mv	a0,s0
8000b27c:	faf4e2e3          	bltu	s1,a5,8000b220 <dhcp_fine_tmr+0xa8>
8000b280:	da0fe0ef          	jal	ra,80009820 <dhcp_reboot>
8000b284:	f79ff06f          	j	8000b1fc <dhcp_fine_tmr+0x84>

8000b288 <dhcp_release>:
8000b288:	ff010113          	addi	sp,sp,-16
8000b28c:	00112623          	sw	ra,12(sp)
8000b290:	9e5ff0ef          	jal	ra,8000ac74 <dhcp_release_and_stop>
8000b294:	00c12083          	lw	ra,12(sp)
8000b298:	00000513          	li	a0,0
8000b29c:	01010113          	addi	sp,sp,16
8000b2a0:	00008067          	ret

8000b2a4 <dhcp_stop>:
8000b2a4:	9d1ff06f          	j	8000ac74 <dhcp_release_and_stop>

8000b2a8 <etharp_free_entry>:
8000b2a8:	fe010113          	addi	sp,sp,-32
8000b2ac:	00912a23          	sw	s1,20(sp)
8000b2b0:	00151493          	slli	s1,a0,0x1
8000b2b4:	00a48733          	add	a4,s1,a0
8000b2b8:	01212823          	sw	s2,16(sp)
8000b2bc:	00371713          	slli	a4,a4,0x3
8000b2c0:	b6c18913          	addi	s2,gp,-1172 # 800035dc <arp_table>
8000b2c4:	00812c23          	sw	s0,24(sp)
8000b2c8:	01312623          	sw	s3,12(sp)
8000b2cc:	00112e23          	sw	ra,28(sp)
8000b2d0:	00e90933          	add	s2,s2,a4
8000b2d4:	00050993          	mv	s3,a0
8000b2d8:	00092503          	lw	a0,0(s2)
8000b2dc:	b6c18413          	addi	s0,gp,-1172 # 800035dc <arp_table>
8000b2e0:	00050663          	beqz	a0,8000b2ec <etharp_free_entry+0x44>
8000b2e4:	e10fc0ef          	jal	ra,800078f4 <pbuf_free>
8000b2e8:	00092023          	sw	zero,0(s2)
8000b2ec:	01348533          	add	a0,s1,s3
8000b2f0:	00351513          	slli	a0,a0,0x3
8000b2f4:	00a40533          	add	a0,s0,a0
8000b2f8:	00050a23          	sb	zero,20(a0)
8000b2fc:	00051923          	sh	zero,18(a0)
8000b300:	00052423          	sw	zero,8(a0)
8000b304:	00052223          	sw	zero,4(a0)
8000b308:	00600613          	li	a2,6
8000b30c:	84c18593          	addi	a1,gp,-1972 # 800032bc <ethzero>
8000b310:	00c50513          	addi	a0,a0,12
8000b314:	7f4030ef          	jal	ra,8000eb08 <memcpy>
8000b318:	01c12083          	lw	ra,28(sp)
8000b31c:	01812403          	lw	s0,24(sp)
8000b320:	01412483          	lw	s1,20(sp)
8000b324:	01012903          	lw	s2,16(sp)
8000b328:	00c12983          	lw	s3,12(sp)
8000b32c:	02010113          	addi	sp,sp,32
8000b330:	00008067          	ret

8000b334 <etharp_find_entry>:
8000b334:	fe010113          	addi	sp,sp,-32
8000b338:	00812c23          	sw	s0,24(sp)
8000b33c:	00912a23          	sw	s1,20(sp)
8000b340:	b6c18693          	addi	a3,gp,-1172 # 800035dc <arp_table>
8000b344:	00112e23          	sw	ra,28(sp)
8000b348:	01212823          	sw	s2,16(sp)
8000b34c:	01312623          	sw	s3,12(sp)
8000b350:	00000293          	li	t0,0
8000b354:	00000f93          	li	t6,0
8000b358:	00000f13          	li	t5,0
8000b35c:	00a00313          	li	t1,10
8000b360:	00000793          	li	a5,0
8000b364:	00a00713          	li	a4,10
8000b368:	00a00893          	li	a7,10
8000b36c:	00a00493          	li	s1,10
8000b370:	b6c18413          	addi	s0,gp,-1172 # 800035dc <arp_table>
8000b374:	00a00e13          	li	t3,10
8000b378:	00100393          	li	t2,1
8000b37c:	0146ce83          	lbu	t4,20(a3)
8000b380:	05c71263          	bne	a4,t3,8000b3c4 <etharp_find_entry+0x90>
8000b384:	100e8463          	beqz	t4,8000b48c <etharp_find_entry+0x158>
8000b388:	00050e63          	beqz	a0,8000b3a4 <etharp_find_entry+0x70>
8000b38c:	00052903          	lw	s2,0(a0)
8000b390:	0046a803          	lw	a6,4(a3)
8000b394:	01091863          	bne	s2,a6,8000b3a4 <etharp_find_entry+0x70>
8000b398:	0a060a63          	beqz	a2,8000b44c <etharp_find_entry+0x118>
8000b39c:	0086a803          	lw	a6,8(a3)
8000b3a0:	0ac80663          	beq	a6,a2,8000b44c <etharp_find_entry+0x118>
8000b3a4:	0126d803          	lhu	a6,18(a3)
8000b3a8:	0c7e9a63          	bne	t4,t2,8000b47c <etharp_find_entry+0x148>
8000b3ac:	0006ae83          	lw	t4,0(a3)
8000b3b0:	0a0e8e63          	beqz	t4,8000b46c <etharp_find_entry+0x138>
8000b3b4:	01e86a63          	bltu	a6,t5,8000b3c8 <etharp_find_entry+0x94>
8000b3b8:	00080f13          	mv	t5,a6
8000b3bc:	00078313          	mv	t1,a5
8000b3c0:	0080006f          	j	8000b3c8 <etharp_find_entry+0x94>
8000b3c4:	fc0e92e3          	bnez	t4,8000b388 <etharp_find_entry+0x54>
8000b3c8:	00178793          	addi	a5,a5,1
8000b3cc:	01079813          	slli	a6,a5,0x10
8000b3d0:	01085813          	srli	a6,a6,0x10
8000b3d4:	01081793          	slli	a5,a6,0x10
8000b3d8:	01868693          	addi	a3,a3,24
8000b3dc:	4107d793          	srai	a5,a5,0x10
8000b3e0:	f9c81ee3          	bne	a6,t3,8000b37c <etharp_find_entry+0x48>
8000b3e4:	00100693          	li	a3,1
8000b3e8:	fff00793          	li	a5,-1
8000b3ec:	06d59063          	bne	a1,a3,8000b44c <etharp_find_entry+0x118>
8000b3f0:	00060993          	mv	s3,a2
8000b3f4:	00050913          	mv	s2,a0
8000b3f8:	03c71063          	bne	a4,t3,8000b418 <etharp_find_entry+0xe4>
8000b3fc:	08e89c63          	bne	a7,a4,8000b494 <etharp_find_entry+0x160>
8000b400:	01149663          	bne	s1,a7,8000b40c <etharp_find_entry+0xd8>
8000b404:	04930463          	beq	t1,s1,8000b44c <etharp_find_entry+0x118>
8000b408:	00030493          	mv	s1,t1
8000b40c:	00048513          	mv	a0,s1
8000b410:	e99ff0ef          	jal	ra,8000b2a8 <etharp_free_entry>
8000b414:	00048713          	mv	a4,s1
8000b418:	00171793          	slli	a5,a4,0x1
8000b41c:	00090c63          	beqz	s2,8000b434 <etharp_find_entry+0x100>
8000b420:	00092603          	lw	a2,0(s2)
8000b424:	00e786b3          	add	a3,a5,a4
8000b428:	00369693          	slli	a3,a3,0x3
8000b42c:	00d406b3          	add	a3,s0,a3
8000b430:	00c6a223          	sw	a2,4(a3)
8000b434:	00e787b3          	add	a5,a5,a4
8000b438:	00379793          	slli	a5,a5,0x3
8000b43c:	00f407b3          	add	a5,s0,a5
8000b440:	00079923          	sh	zero,18(a5)
8000b444:	0137a423          	sw	s3,8(a5)
8000b448:	00070793          	mv	a5,a4
8000b44c:	01c12083          	lw	ra,28(sp)
8000b450:	01812403          	lw	s0,24(sp)
8000b454:	01412483          	lw	s1,20(sp)
8000b458:	01012903          	lw	s2,16(sp)
8000b45c:	00c12983          	lw	s3,12(sp)
8000b460:	00078513          	mv	a0,a5
8000b464:	02010113          	addi	sp,sp,32
8000b468:	00008067          	ret
8000b46c:	f5f86ee3          	bltu	a6,t6,8000b3c8 <etharp_find_entry+0x94>
8000b470:	00080f93          	mv	t6,a6
8000b474:	00078493          	mv	s1,a5
8000b478:	f51ff06f          	j	8000b3c8 <etharp_find_entry+0x94>
8000b47c:	f45866e3          	bltu	a6,t0,8000b3c8 <etharp_find_entry+0x94>
8000b480:	00080293          	mv	t0,a6
8000b484:	00078893          	mv	a7,a5
8000b488:	f41ff06f          	j	8000b3c8 <etharp_find_entry+0x94>
8000b48c:	00078713          	mv	a4,a5
8000b490:	f39ff06f          	j	8000b3c8 <etharp_find_entry+0x94>
8000b494:	00088493          	mv	s1,a7
8000b498:	f75ff06f          	j	8000b40c <etharp_find_entry+0xd8>

8000b49c <etharp_raw>:
8000b49c:	fc010113          	addi	sp,sp,-64
8000b4a0:	03312623          	sw	s3,44(sp)
8000b4a4:	03412423          	sw	s4,40(sp)
8000b4a8:	03512223          	sw	s5,36(sp)
8000b4ac:	00050993          	mv	s3,a0
8000b4b0:	00058a13          	mv	s4,a1
8000b4b4:	00060a93          	mv	s5,a2
8000b4b8:	01c00593          	li	a1,28
8000b4bc:	28000613          	li	a2,640
8000b4c0:	01000513          	li	a0,16
8000b4c4:	02912a23          	sw	s1,52(sp)
8000b4c8:	03612023          	sw	s6,32(sp)
8000b4cc:	01712e23          	sw	s7,28(sp)
8000b4d0:	01812c23          	sw	s8,24(sp)
8000b4d4:	01912a23          	sw	s9,20(sp)
8000b4d8:	01112623          	sw	a7,12(sp)
8000b4dc:	02112e23          	sw	ra,60(sp)
8000b4e0:	02812c23          	sw	s0,56(sp)
8000b4e4:	03212823          	sw	s2,48(sp)
8000b4e8:	00068c93          	mv	s9,a3
8000b4ec:	00070b93          	mv	s7,a4
8000b4f0:	00078c13          	mv	s8,a5
8000b4f4:	00080b13          	mv	s6,a6
8000b4f8:	cd0fc0ef          	jal	ra,800079c8 <pbuf_alloc>
8000b4fc:	a2c18493          	addi	s1,gp,-1492 # 8000349c <lwip_stats>
8000b500:	00c12883          	lw	a7,12(sp)
8000b504:	04051463          	bnez	a0,8000b54c <etharp_raw+0xb0>
8000b508:	0484a783          	lw	a5,72(s1)
8000b50c:	fff00513          	li	a0,-1
8000b510:	00178793          	addi	a5,a5,1
8000b514:	04f4a423          	sw	a5,72(s1)
8000b518:	03c12083          	lw	ra,60(sp)
8000b51c:	03812403          	lw	s0,56(sp)
8000b520:	03412483          	lw	s1,52(sp)
8000b524:	03012903          	lw	s2,48(sp)
8000b528:	02c12983          	lw	s3,44(sp)
8000b52c:	02812a03          	lw	s4,40(sp)
8000b530:	02412a83          	lw	s5,36(sp)
8000b534:	02012b03          	lw	s6,32(sp)
8000b538:	01c12b83          	lw	s7,28(sp)
8000b53c:	01812c03          	lw	s8,24(sp)
8000b540:	01412c83          	lw	s9,20(sp)
8000b544:	04010113          	addi	sp,sp,64
8000b548:	00008067          	ret
8000b54c:	00452403          	lw	s0,4(a0)
8000b550:	00050913          	mv	s2,a0
8000b554:	00088513          	mv	a0,a7
8000b558:	978fb0ef          	jal	ra,800066d0 <lwip_htons>
8000b55c:	00a40323          	sb	a0,6(s0)
8000b560:	00855513          	srli	a0,a0,0x8
8000b564:	00a403a3          	sb	a0,7(s0)
8000b568:	00600613          	li	a2,6
8000b56c:	000c8593          	mv	a1,s9
8000b570:	00840513          	addi	a0,s0,8
8000b574:	594030ef          	jal	ra,8000eb08 <memcpy>
8000b578:	00600613          	li	a2,6
8000b57c:	000c0593          	mv	a1,s8
8000b580:	01240513          	addi	a0,s0,18
8000b584:	584030ef          	jal	ra,8000eb08 <memcpy>
8000b588:	00400613          	li	a2,4
8000b58c:	000b8593          	mv	a1,s7
8000b590:	00e40513          	addi	a0,s0,14
8000b594:	574030ef          	jal	ra,8000eb08 <memcpy>
8000b598:	00400613          	li	a2,4
8000b59c:	000b0593          	mv	a1,s6
8000b5a0:	01840513          	addi	a0,s0,24
8000b5a4:	564030ef          	jal	ra,8000eb08 <memcpy>
8000b5a8:	00100793          	li	a5,1
8000b5ac:	00f400a3          	sb	a5,1(s0)
8000b5b0:	00800793          	li	a5,8
8000b5b4:	00f40123          	sb	a5,2(s0)
8000b5b8:	00600793          	li	a5,6
8000b5bc:	00f40223          	sb	a5,4(s0)
8000b5c0:	00001737          	lui	a4,0x1
8000b5c4:	00400793          	li	a5,4
8000b5c8:	00f402a3          	sb	a5,5(s0)
8000b5cc:	80670713          	addi	a4,a4,-2042 # 806 <CUSTOM1+0x7db>
8000b5d0:	000a8693          	mv	a3,s5
8000b5d4:	000a0613          	mv	a2,s4
8000b5d8:	00090593          	mv	a1,s2
8000b5dc:	00040023          	sb	zero,0(s0)
8000b5e0:	000401a3          	sb	zero,3(s0)
8000b5e4:	00098513          	mv	a0,s3
8000b5e8:	695010ef          	jal	ra,8000d47c <ethernet_output>
8000b5ec:	0304a783          	lw	a5,48(s1)
8000b5f0:	00090513          	mv	a0,s2
8000b5f4:	00178793          	addi	a5,a5,1
8000b5f8:	02f4a823          	sw	a5,48(s1)
8000b5fc:	af8fc0ef          	jal	ra,800078f4 <pbuf_free>
8000b600:	00000513          	li	a0,0
8000b604:	f15ff06f          	j	8000b518 <etharp_raw+0x7c>

8000b608 <etharp_cleanup_netif>:
8000b608:	fe010113          	addi	sp,sp,-32
8000b60c:	00812c23          	sw	s0,24(sp)
8000b610:	00912a23          	sw	s1,20(sp)
8000b614:	01212823          	sw	s2,16(sp)
8000b618:	01312623          	sw	s3,12(sp)
8000b61c:	00112e23          	sw	ra,28(sp)
8000b620:	00050993          	mv	s3,a0
8000b624:	b6c18413          	addi	s0,gp,-1172 # 800035dc <arp_table>
8000b628:	00000493          	li	s1,0
8000b62c:	00a00913          	li	s2,10
8000b630:	01444783          	lbu	a5,20(s0)
8000b634:	00078a63          	beqz	a5,8000b648 <etharp_cleanup_netif+0x40>
8000b638:	00842783          	lw	a5,8(s0)
8000b63c:	01379663          	bne	a5,s3,8000b648 <etharp_cleanup_netif+0x40>
8000b640:	00048513          	mv	a0,s1
8000b644:	c65ff0ef          	jal	ra,8000b2a8 <etharp_free_entry>
8000b648:	00148493          	addi	s1,s1,1
8000b64c:	01840413          	addi	s0,s0,24
8000b650:	ff2490e3          	bne	s1,s2,8000b630 <etharp_cleanup_netif+0x28>
8000b654:	01c12083          	lw	ra,28(sp)
8000b658:	01812403          	lw	s0,24(sp)
8000b65c:	01412483          	lw	s1,20(sp)
8000b660:	01012903          	lw	s2,16(sp)
8000b664:	00c12983          	lw	s3,12(sp)
8000b668:	02010113          	addi	sp,sp,32
8000b66c:	00008067          	ret

8000b670 <etharp_find_addr>:
8000b670:	fe010113          	addi	sp,sp,-32
8000b674:	00058793          	mv	a5,a1
8000b678:	00812c23          	sw	s0,24(sp)
8000b67c:	00200593          	li	a1,2
8000b680:	00060413          	mv	s0,a2
8000b684:	00050613          	mv	a2,a0
8000b688:	00078513          	mv	a0,a5
8000b68c:	00112e23          	sw	ra,28(sp)
8000b690:	00d12623          	sw	a3,12(sp)
8000b694:	ca1ff0ef          	jal	ra,8000b334 <etharp_find_entry>
8000b698:	04054863          	bltz	a0,8000b6e8 <etharp_find_addr+0x78>
8000b69c:	00151793          	slli	a5,a0,0x1
8000b6a0:	00a787b3          	add	a5,a5,a0
8000b6a4:	b6c18713          	addi	a4,gp,-1172 # 800035dc <arp_table>
8000b6a8:	00379793          	slli	a5,a5,0x3
8000b6ac:	00f70633          	add	a2,a4,a5
8000b6b0:	01464583          	lbu	a1,20(a2)
8000b6b4:	00100613          	li	a2,1
8000b6b8:	02b67863          	bgeu	a2,a1,8000b6e8 <etharp_find_addr+0x78>
8000b6bc:	00c78613          	addi	a2,a5,12
8000b6c0:	00c12683          	lw	a3,12(sp)
8000b6c4:	00c70633          	add	a2,a4,a2
8000b6c8:	00478793          	addi	a5,a5,4
8000b6cc:	00c42023          	sw	a2,0(s0)
8000b6d0:	00f707b3          	add	a5,a4,a5
8000b6d4:	00f6a023          	sw	a5,0(a3)
8000b6d8:	01c12083          	lw	ra,28(sp)
8000b6dc:	01812403          	lw	s0,24(sp)
8000b6e0:	02010113          	addi	sp,sp,32
8000b6e4:	00008067          	ret
8000b6e8:	fff00513          	li	a0,-1
8000b6ec:	fedff06f          	j	8000b6d8 <etharp_find_addr+0x68>

8000b6f0 <etharp_get_entry>:
8000b6f0:	00900793          	li	a5,9
8000b6f4:	04a7e863          	bltu	a5,a0,8000b744 <etharp_get_entry+0x54>
8000b6f8:	00151793          	slli	a5,a0,0x1
8000b6fc:	00a787b3          	add	a5,a5,a0
8000b700:	b6c18713          	addi	a4,gp,-1172 # 800035dc <arp_table>
8000b704:	00379793          	slli	a5,a5,0x3
8000b708:	00f70833          	add	a6,a4,a5
8000b70c:	01484303          	lbu	t1,20(a6)
8000b710:	00100893          	li	a7,1
8000b714:	00000513          	li	a0,0
8000b718:	0268f863          	bgeu	a7,t1,8000b748 <etharp_get_entry+0x58>
8000b71c:	00478513          	addi	a0,a5,4
8000b720:	00a70533          	add	a0,a4,a0
8000b724:	00a5a023          	sw	a0,0(a1)
8000b728:	00882583          	lw	a1,8(a6)
8000b72c:	00c78793          	addi	a5,a5,12
8000b730:	00f707b3          	add	a5,a4,a5
8000b734:	00b62023          	sw	a1,0(a2)
8000b738:	00f6a023          	sw	a5,0(a3)
8000b73c:	00100513          	li	a0,1
8000b740:	00008067          	ret
8000b744:	00000513          	li	a0,0
8000b748:	00008067          	ret

8000b74c <etharp_input>:
8000b74c:	22058863          	beqz	a1,8000b97c <etharp_input+0x230>
8000b750:	fc010113          	addi	sp,sp,-64
8000b754:	02812c23          	sw	s0,56(sp)
8000b758:	03212823          	sw	s2,48(sp)
8000b75c:	03312623          	sw	s3,44(sp)
8000b760:	02112e23          	sw	ra,60(sp)
8000b764:	02912a23          	sw	s1,52(sp)
8000b768:	03412423          	sw	s4,40(sp)
8000b76c:	03512223          	sw	s5,36(sp)
8000b770:	03612023          	sw	s6,32(sp)
8000b774:	01712e23          	sw	s7,28(sp)
8000b778:	00452483          	lw	s1,4(a0)
8000b77c:	00058413          	mv	s0,a1
8000b780:	0014c783          	lbu	a5,1(s1)
8000b784:	0004c703          	lbu	a4,0(s1)
8000b788:	00050993          	mv	s3,a0
8000b78c:	00879793          	slli	a5,a5,0x8
8000b790:	00e7e7b3          	or	a5,a5,a4
8000b794:	10000713          	li	a4,256
8000b798:	a2c18913          	addi	s2,gp,-1492 # 8000349c <lwip_stats>
8000b79c:	02e79a63          	bne	a5,a4,8000b7d0 <etharp_input+0x84>
8000b7a0:	0044c703          	lbu	a4,4(s1)
8000b7a4:	00600793          	li	a5,6
8000b7a8:	02f71463          	bne	a4,a5,8000b7d0 <etharp_input+0x84>
8000b7ac:	0054c703          	lbu	a4,5(s1)
8000b7b0:	00400793          	li	a5,4
8000b7b4:	00f71e63          	bne	a4,a5,8000b7d0 <etharp_input+0x84>
8000b7b8:	0034c783          	lbu	a5,3(s1)
8000b7bc:	0024c703          	lbu	a4,2(s1)
8000b7c0:	00879793          	slli	a5,a5,0x8
8000b7c4:	00e7e7b3          	or	a5,a5,a4
8000b7c8:	00800713          	li	a4,8
8000b7cc:	04e78863          	beq	a5,a4,8000b81c <etharp_input+0xd0>
8000b7d0:	05092783          	lw	a5,80(s2)
8000b7d4:	00178793          	addi	a5,a5,1
8000b7d8:	04f92823          	sw	a5,80(s2)
8000b7dc:	03c92783          	lw	a5,60(s2)
8000b7e0:	00178793          	addi	a5,a5,1
8000b7e4:	02f92e23          	sw	a5,60(s2)
8000b7e8:	00098513          	mv	a0,s3
8000b7ec:	908fc0ef          	jal	ra,800078f4 <pbuf_free>
8000b7f0:	03c12083          	lw	ra,60(sp)
8000b7f4:	03812403          	lw	s0,56(sp)
8000b7f8:	03412483          	lw	s1,52(sp)
8000b7fc:	03012903          	lw	s2,48(sp)
8000b800:	02c12983          	lw	s3,44(sp)
8000b804:	02812a03          	lw	s4,40(sp)
8000b808:	02412a83          	lw	s5,36(sp)
8000b80c:	02012b03          	lw	s6,32(sp)
8000b810:	01c12b83          	lw	s7,28(sp)
8000b814:	04010113          	addi	sp,sp,64
8000b818:	00008067          	ret
8000b81c:	03492783          	lw	a5,52(s2)
8000b820:	00400613          	li	a2,4
8000b824:	00e48593          	addi	a1,s1,14
8000b828:	00178793          	addi	a5,a5,1
8000b82c:	00810513          	addi	a0,sp,8
8000b830:	02f92a23          	sw	a5,52(s2)
8000b834:	2d4030ef          	jal	ra,8000eb08 <memcpy>
8000b838:	00400613          	li	a2,4
8000b83c:	01848593          	addi	a1,s1,24
8000b840:	00c10513          	addi	a0,sp,12
8000b844:	2c4030ef          	jal	ra,8000eb08 <memcpy>
8000b848:	00442783          	lw	a5,4(s0)
8000b84c:	00848a13          	addi	s4,s1,8
8000b850:	00078663          	beqz	a5,8000b85c <etharp_input+0x110>
8000b854:	00c12703          	lw	a4,12(sp)
8000b858:	0ce78e63          	beq	a5,a4,8000b934 <etharp_input+0x1e8>
8000b85c:	00000a93          	li	s5,0
8000b860:	00200b13          	li	s6,2
8000b864:	00812503          	lw	a0,8(sp)
8000b868:	08050e63          	beqz	a0,8000b904 <etharp_input+0x1b8>
8000b86c:	00040593          	mv	a1,s0
8000b870:	630010ef          	jal	ra,8000cea0 <ip4_addr_isbroadcast_u32>
8000b874:	08051863          	bnez	a0,8000b904 <etharp_input+0x1b8>
8000b878:	00812783          	lw	a5,8(sp)
8000b87c:	0e000713          	li	a4,224
8000b880:	0f07f793          	andi	a5,a5,240
8000b884:	08e78063          	beq	a5,a4,8000b904 <etharp_input+0x1b8>
8000b888:	00040613          	mv	a2,s0
8000b88c:	000b0593          	mv	a1,s6
8000b890:	00810513          	addi	a0,sp,8
8000b894:	aa1ff0ef          	jal	ra,8000b334 <etharp_find_entry>
8000b898:	06054663          	bltz	a0,8000b904 <etharp_input+0x1b8>
8000b89c:	00151793          	slli	a5,a0,0x1
8000b8a0:	00a787b3          	add	a5,a5,a0
8000b8a4:	b6c18713          	addi	a4,gp,-1172 # 800035dc <arp_table>
8000b8a8:	00379793          	slli	a5,a5,0x3
8000b8ac:	00f70b33          	add	s6,a4,a5
8000b8b0:	00200693          	li	a3,2
8000b8b4:	00c78793          	addi	a5,a5,12
8000b8b8:	00db0a23          	sb	a3,20(s6) # 8014 <_stack_size+0x7014>
8000b8bc:	008b2423          	sw	s0,8(s6)
8000b8c0:	00600613          	li	a2,6
8000b8c4:	000a0593          	mv	a1,s4
8000b8c8:	00f70533          	add	a0,a4,a5
8000b8cc:	23c030ef          	jal	ra,8000eb08 <memcpy>
8000b8d0:	000b2b83          	lw	s7,0(s6)
8000b8d4:	000b1923          	sh	zero,18(s6)
8000b8d8:	020b8663          	beqz	s7,8000b904 <etharp_input+0x1b8>
8000b8dc:	00001737          	lui	a4,0x1
8000b8e0:	000b2023          	sw	zero,0(s6)
8000b8e4:	80070713          	addi	a4,a4,-2048 # 800 <CUSTOM1+0x7d5>
8000b8e8:	000a0693          	mv	a3,s4
8000b8ec:	02e40613          	addi	a2,s0,46
8000b8f0:	000b8593          	mv	a1,s7
8000b8f4:	00040513          	mv	a0,s0
8000b8f8:	385010ef          	jal	ra,8000d47c <ethernet_output>
8000b8fc:	000b8513          	mv	a0,s7
8000b900:	ff5fb0ef          	jal	ra,800078f4 <pbuf_free>
8000b904:	0074c783          	lbu	a5,7(s1)
8000b908:	0064c703          	lbu	a4,6(s1)
8000b90c:	00879793          	slli	a5,a5,0x8
8000b910:	00e7e7b3          	or	a5,a5,a4
8000b914:	10000713          	li	a4,256
8000b918:	02e78463          	beq	a5,a4,8000b940 <etharp_input+0x1f4>
8000b91c:	20000713          	li	a4,512
8000b920:	04e78663          	beq	a5,a4,8000b96c <etharp_input+0x220>
8000b924:	05892783          	lw	a5,88(s2)
8000b928:	00178793          	addi	a5,a5,1
8000b92c:	04f92c23          	sw	a5,88(s2)
8000b930:	eb9ff06f          	j	8000b7e8 <etharp_input+0x9c>
8000b934:	00100a93          	li	s5,1
8000b938:	00100b13          	li	s6,1
8000b93c:	f29ff06f          	j	8000b864 <etharp_input+0x118>
8000b940:	ea0a84e3          	beqz	s5,8000b7e8 <etharp_input+0x9c>
8000b944:	02e40693          	addi	a3,s0,46
8000b948:	00200893          	li	a7,2
8000b94c:	00810813          	addi	a6,sp,8
8000b950:	000a0793          	mv	a5,s4
8000b954:	00440713          	addi	a4,s0,4
8000b958:	000a0613          	mv	a2,s4
8000b95c:	00068593          	mv	a1,a3
8000b960:	00040513          	mv	a0,s0
8000b964:	b39ff0ef          	jal	ra,8000b49c <etharp_raw>
8000b968:	e81ff06f          	j	8000b7e8 <etharp_input+0x9c>
8000b96c:	00810593          	addi	a1,sp,8
8000b970:	00040513          	mv	a0,s0
8000b974:	fd5fe0ef          	jal	ra,8000a948 <dhcp_arp_reply>
8000b978:	e71ff06f          	j	8000b7e8 <etharp_input+0x9c>
8000b97c:	00008067          	ret

8000b980 <etharp_request>:
8000b980:	02e50693          	addi	a3,a0,46
8000b984:	00058813          	mv	a6,a1
8000b988:	00100893          	li	a7,1
8000b98c:	84c18793          	addi	a5,gp,-1972 # 800032bc <ethzero>
8000b990:	00450713          	addi	a4,a0,4
8000b994:	85418613          	addi	a2,gp,-1964 # 800032c4 <ethbroadcast>
8000b998:	00068593          	mv	a1,a3
8000b99c:	b01ff06f          	j	8000b49c <etharp_raw>

8000b9a0 <etharp_tmr>:
8000b9a0:	fd010113          	addi	sp,sp,-48
8000b9a4:	02812423          	sw	s0,40(sp)
8000b9a8:	02912223          	sw	s1,36(sp)
8000b9ac:	03212023          	sw	s2,32(sp)
8000b9b0:	01312e23          	sw	s3,28(sp)
8000b9b4:	01412c23          	sw	s4,24(sp)
8000b9b8:	01512a23          	sw	s5,20(sp)
8000b9bc:	01612823          	sw	s6,16(sp)
8000b9c0:	01712623          	sw	s7,12(sp)
8000b9c4:	02112623          	sw	ra,44(sp)
8000b9c8:	b6c18413          	addi	s0,gp,-1172 # 800035dc <arp_table>
8000b9cc:	00000493          	li	s1,0
8000b9d0:	12b00a13          	li	s4,299
8000b9d4:	00100a93          	li	s5,1
8000b9d8:	00300b13          	li	s6,3
8000b9dc:	00400913          	li	s2,4
8000b9e0:	00200b93          	li	s7,2
8000b9e4:	00a00993          	li	s3,10
8000b9e8:	01444703          	lbu	a4,20(s0)
8000b9ec:	02070663          	beqz	a4,8000ba18 <etharp_tmr+0x78>
8000b9f0:	01245783          	lhu	a5,18(s0)
8000b9f4:	00178793          	addi	a5,a5,1
8000b9f8:	01079793          	slli	a5,a5,0x10
8000b9fc:	0107d793          	srli	a5,a5,0x10
8000ba00:	00f41923          	sh	a5,18(s0)
8000ba04:	00fa6663          	bltu	s4,a5,8000ba10 <etharp_tmr+0x70>
8000ba08:	05571463          	bne	a4,s5,8000ba50 <etharp_tmr+0xb0>
8000ba0c:	04f97e63          	bgeu	s2,a5,8000ba68 <etharp_tmr+0xc8>
8000ba10:	00048513          	mv	a0,s1
8000ba14:	895ff0ef          	jal	ra,8000b2a8 <etharp_free_entry>
8000ba18:	00148493          	addi	s1,s1,1
8000ba1c:	01840413          	addi	s0,s0,24
8000ba20:	fd3494e3          	bne	s1,s3,8000b9e8 <etharp_tmr+0x48>
8000ba24:	02c12083          	lw	ra,44(sp)
8000ba28:	02812403          	lw	s0,40(sp)
8000ba2c:	02412483          	lw	s1,36(sp)
8000ba30:	02012903          	lw	s2,32(sp)
8000ba34:	01c12983          	lw	s3,28(sp)
8000ba38:	01812a03          	lw	s4,24(sp)
8000ba3c:	01412a83          	lw	s5,20(sp)
8000ba40:	01012b03          	lw	s6,16(sp)
8000ba44:	00c12b83          	lw	s7,12(sp)
8000ba48:	03010113          	addi	sp,sp,48
8000ba4c:	00008067          	ret
8000ba50:	01671663          	bne	a4,s6,8000ba5c <etharp_tmr+0xbc>
8000ba54:	01240a23          	sb	s2,20(s0)
8000ba58:	fc1ff06f          	j	8000ba18 <etharp_tmr+0x78>
8000ba5c:	fb271ee3          	bne	a4,s2,8000ba18 <etharp_tmr+0x78>
8000ba60:	01740a23          	sb	s7,20(s0)
8000ba64:	fb5ff06f          	j	8000ba18 <etharp_tmr+0x78>
8000ba68:	00842503          	lw	a0,8(s0)
8000ba6c:	00440593          	addi	a1,s0,4
8000ba70:	f11ff0ef          	jal	ra,8000b980 <etharp_request>
8000ba74:	fa5ff06f          	j	8000ba18 <etharp_tmr+0x78>

8000ba78 <etharp_output_to_arp_index>:
8000ba78:	fe010113          	addi	sp,sp,-32
8000ba7c:	01412423          	sw	s4,8(sp)
8000ba80:	00058a13          	mv	s4,a1
8000ba84:	00161593          	slli	a1,a2,0x1
8000ba88:	00c58633          	add	a2,a1,a2
8000ba8c:	00361613          	slli	a2,a2,0x3
8000ba90:	b6c18593          	addi	a1,gp,-1172 # 800035dc <arp_table>
8000ba94:	00812c23          	sw	s0,24(sp)
8000ba98:	00912a23          	sw	s1,20(sp)
8000ba9c:	01212823          	sw	s2,16(sp)
8000baa0:	01312623          	sw	s3,12(sp)
8000baa4:	00112e23          	sw	ra,28(sp)
8000baa8:	00c584b3          	add	s1,a1,a2
8000baac:	0144c703          	lbu	a4,20(s1)
8000bab0:	00c60413          	addi	s0,a2,12
8000bab4:	00200793          	li	a5,2
8000bab8:	00050913          	mv	s2,a0
8000babc:	00858433          	add	s0,a1,s0
8000bac0:	02e50993          	addi	s3,a0,46
8000bac4:	02f71463          	bne	a4,a5,8000baec <etharp_output_to_arp_index+0x74>
8000bac8:	0124d783          	lhu	a5,18(s1)
8000bacc:	11c00713          	li	a4,284
8000bad0:	04f77a63          	bgeu	a4,a5,8000bb24 <etharp_output_to_arp_index+0xac>
8000bad4:	00460613          	addi	a2,a2,4
8000bad8:	00c585b3          	add	a1,a1,a2
8000badc:	ea5ff0ef          	jal	ra,8000b980 <etharp_request>
8000bae0:	00051663          	bnez	a0,8000baec <etharp_output_to_arp_index+0x74>
8000bae4:	00300793          	li	a5,3
8000bae8:	00f48a23          	sb	a5,20(s1)
8000baec:	00040693          	mv	a3,s0
8000baf0:	01812403          	lw	s0,24(sp)
8000baf4:	01c12083          	lw	ra,28(sp)
8000baf8:	01412483          	lw	s1,20(sp)
8000bafc:	00098613          	mv	a2,s3
8000bb00:	000a0593          	mv	a1,s4
8000bb04:	00c12983          	lw	s3,12(sp)
8000bb08:	00812a03          	lw	s4,8(sp)
8000bb0c:	00090513          	mv	a0,s2
8000bb10:	01012903          	lw	s2,16(sp)
8000bb14:	00001737          	lui	a4,0x1
8000bb18:	80070713          	addi	a4,a4,-2048 # 800 <CUSTOM1+0x7d5>
8000bb1c:	02010113          	addi	sp,sp,32
8000bb20:	15d0106f          	j	8000d47c <ethernet_output>
8000bb24:	10d00713          	li	a4,269
8000bb28:	fcf772e3          	bgeu	a4,a5,8000baec <etharp_output_to_arp_index+0x74>
8000bb2c:	00460613          	addi	a2,a2,4
8000bb30:	00c58833          	add	a6,a1,a2
8000bb34:	00100893          	li	a7,1
8000bb38:	84c18793          	addi	a5,gp,-1972 # 800032bc <ethzero>
8000bb3c:	00450713          	addi	a4,a0,4
8000bb40:	00098693          	mv	a3,s3
8000bb44:	00040613          	mv	a2,s0
8000bb48:	00098593          	mv	a1,s3
8000bb4c:	951ff0ef          	jal	ra,8000b49c <etharp_raw>
8000bb50:	f91ff06f          	j	8000bae0 <etharp_output_to_arp_index+0x68>

8000bb54 <etharp_query>:
8000bb54:	fe010113          	addi	sp,sp,-32
8000bb58:	01512223          	sw	s5,4(sp)
8000bb5c:	00058a93          	mv	s5,a1
8000bb60:	00912a23          	sw	s1,20(sp)
8000bb64:	00050593          	mv	a1,a0
8000bb68:	00050493          	mv	s1,a0
8000bb6c:	000aa503          	lw	a0,0(s5)
8000bb70:	01312623          	sw	s3,12(sp)
8000bb74:	00112e23          	sw	ra,28(sp)
8000bb78:	00812c23          	sw	s0,24(sp)
8000bb7c:	01212823          	sw	s2,16(sp)
8000bb80:	01412423          	sw	s4,8(sp)
8000bb84:	00060993          	mv	s3,a2
8000bb88:	318010ef          	jal	ra,8000cea0 <ip4_addr_isbroadcast_u32>
8000bb8c:	16051a63          	bnez	a0,8000bd00 <etharp_query+0x1ac>
8000bb90:	000aa783          	lw	a5,0(s5)
8000bb94:	0e000713          	li	a4,224
8000bb98:	0f07f693          	andi	a3,a5,240
8000bb9c:	16e68263          	beq	a3,a4,8000bd00 <etharp_query+0x1ac>
8000bba0:	16078063          	beqz	a5,8000bd00 <etharp_query+0x1ac>
8000bba4:	00048613          	mv	a2,s1
8000bba8:	00100593          	li	a1,1
8000bbac:	000a8513          	mv	a0,s5
8000bbb0:	f84ff0ef          	jal	ra,8000b334 <etharp_find_entry>
8000bbb4:	02055e63          	bgez	a0,8000bbf0 <etharp_query+0x9c>
8000bbb8:	00098a63          	beqz	s3,8000bbcc <etharp_query+0x78>
8000bbbc:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000bbc0:	0487a703          	lw	a4,72(a5)
8000bbc4:	00170713          	addi	a4,a4,1
8000bbc8:	04e7a423          	sw	a4,72(a5)
8000bbcc:	01c12083          	lw	ra,28(sp)
8000bbd0:	01812403          	lw	s0,24(sp)
8000bbd4:	01412483          	lw	s1,20(sp)
8000bbd8:	01012903          	lw	s2,16(sp)
8000bbdc:	00c12983          	lw	s3,12(sp)
8000bbe0:	00812a03          	lw	s4,8(sp)
8000bbe4:	00412a83          	lw	s5,4(sp)
8000bbe8:	02010113          	addi	sp,sp,32
8000bbec:	00008067          	ret
8000bbf0:	0ff57413          	andi	s0,a0,255
8000bbf4:	00141a13          	slli	s4,s0,0x1
8000bbf8:	008a0733          	add	a4,s4,s0
8000bbfc:	b6c18793          	addi	a5,gp,-1172 # 800035dc <arp_table>
8000bc00:	00371713          	slli	a4,a4,0x3
8000bc04:	00e787b3          	add	a5,a5,a4
8000bc08:	0147c703          	lbu	a4,20(a5)
8000bc0c:	b6c18913          	addi	s2,gp,-1172 # 800035dc <arp_table>
8000bc10:	08070663          	beqz	a4,8000bc9c <etharp_query+0x148>
8000bc14:	fff00513          	li	a0,-1
8000bc18:	00099a63          	bnez	s3,8000bc2c <etharp_query+0xd8>
8000bc1c:	000a8593          	mv	a1,s5
8000bc20:	00048513          	mv	a0,s1
8000bc24:	d5dff0ef          	jal	ra,8000b980 <etharp_request>
8000bc28:	fa0982e3          	beqz	s3,8000bbcc <etharp_query+0x78>
8000bc2c:	008a07b3          	add	a5,s4,s0
8000bc30:	00379793          	slli	a5,a5,0x3
8000bc34:	00f907b3          	add	a5,s2,a5
8000bc38:	0147c703          	lbu	a4,20(a5)
8000bc3c:	00100793          	li	a5,1
8000bc40:	06e7f663          	bgeu	a5,a4,8000bcac <etharp_query+0x158>
8000bc44:	00048863          	beqz	s1,8000bc54 <etharp_query+0x100>
8000bc48:	03c4a783          	lw	a5,60(s1)
8000bc4c:	00078463          	beqz	a5,8000bc54 <etharp_query+0x100>
8000bc50:	00878023          	sb	s0,0(a5)
8000bc54:	008a06b3          	add	a3,s4,s0
8000bc58:	00369693          	slli	a3,a3,0x3
8000bc5c:	01812403          	lw	s0,24(sp)
8000bc60:	00c68693          	addi	a3,a3,12
8000bc64:	01c12083          	lw	ra,28(sp)
8000bc68:	00812a03          	lw	s4,8(sp)
8000bc6c:	00412a83          	lw	s5,4(sp)
8000bc70:	00d906b3          	add	a3,s2,a3
8000bc74:	02e48613          	addi	a2,s1,46
8000bc78:	01012903          	lw	s2,16(sp)
8000bc7c:	00098593          	mv	a1,s3
8000bc80:	00048513          	mv	a0,s1
8000bc84:	00c12983          	lw	s3,12(sp)
8000bc88:	01412483          	lw	s1,20(sp)
8000bc8c:	00001737          	lui	a4,0x1
8000bc90:	80070713          	addi	a4,a4,-2048 # 800 <CUSTOM1+0x7d5>
8000bc94:	02010113          	addi	sp,sp,32
8000bc98:	7e40106f          	j	8000d47c <ethernet_output>
8000bc9c:	00100713          	li	a4,1
8000bca0:	00e78a23          	sb	a4,20(a5)
8000bca4:	0097a423          	sw	s1,8(a5)
8000bca8:	f75ff06f          	j	8000bc1c <etharp_query+0xc8>
8000bcac:	f2f710e3          	bne	a4,a5,8000bbcc <etharp_query+0x78>
8000bcb0:	00098793          	mv	a5,s3
8000bcb4:	00c7c703          	lbu	a4,12(a5)
8000bcb8:	04077713          	andi	a4,a4,64
8000bcbc:	04071663          	bnez	a4,8000bd08 <etharp_query+0x1b4>
8000bcc0:	0007a783          	lw	a5,0(a5)
8000bcc4:	fe0798e3          	bnez	a5,8000bcb4 <etharp_query+0x160>
8000bcc8:	00098513          	mv	a0,s3
8000bccc:	810fc0ef          	jal	ra,80007cdc <pbuf_ref>
8000bcd0:	008a07b3          	add	a5,s4,s0
8000bcd4:	00379793          	slli	a5,a5,0x3
8000bcd8:	00f907b3          	add	a5,s2,a5
8000bcdc:	0007a503          	lw	a0,0(a5)
8000bce0:	00050463          	beqz	a0,8000bce8 <etharp_query+0x194>
8000bce4:	c11fb0ef          	jal	ra,800078f4 <pbuf_free>
8000bce8:	008a0433          	add	s0,s4,s0
8000bcec:	00341413          	slli	s0,s0,0x3
8000bcf0:	00890433          	add	s0,s2,s0
8000bcf4:	01342023          	sw	s3,0(s0)
8000bcf8:	00000513          	li	a0,0
8000bcfc:	ed1ff06f          	j	8000bbcc <etharp_query+0x78>
8000bd00:	ff000513          	li	a0,-16
8000bd04:	ec9ff06f          	j	8000bbcc <etharp_query+0x78>
8000bd08:	00098613          	mv	a2,s3
8000bd0c:	28000593          	li	a1,640
8000bd10:	01000513          	li	a0,16
8000bd14:	c78fc0ef          	jal	ra,8000818c <pbuf_clone>
8000bd18:	00050993          	mv	s3,a0
8000bd1c:	fa051ae3          	bnez	a0,8000bcd0 <etharp_query+0x17c>
8000bd20:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000bd24:	0487a703          	lw	a4,72(a5)
8000bd28:	fff00513          	li	a0,-1
8000bd2c:	00170713          	addi	a4,a4,1
8000bd30:	04e7a423          	sw	a4,72(a5)
8000bd34:	e99ff06f          	j	8000bbcc <etharp_query+0x78>

8000bd38 <etharp_output>:
8000bd38:	fe010113          	addi	sp,sp,-32
8000bd3c:	00812c23          	sw	s0,24(sp)
8000bd40:	00912a23          	sw	s1,20(sp)
8000bd44:	01212823          	sw	s2,16(sp)
8000bd48:	00112e23          	sw	ra,28(sp)
8000bd4c:	00050413          	mv	s0,a0
8000bd50:	00058913          	mv	s2,a1
8000bd54:	00050593          	mv	a1,a0
8000bd58:	00062503          	lw	a0,0(a2)
8000bd5c:	00060493          	mv	s1,a2
8000bd60:	140010ef          	jal	ra,8000cea0 <ip4_addr_isbroadcast_u32>
8000bd64:	16051863          	bnez	a0,8000bed4 <etharp_output+0x19c>
8000bd68:	0004a783          	lw	a5,0(s1)
8000bd6c:	0e000713          	li	a4,224
8000bd70:	0f07f613          	andi	a2,a5,240
8000bd74:	04e61863          	bne	a2,a4,8000bdc4 <etharp_output+0x8c>
8000bd78:	00100793          	li	a5,1
8000bd7c:	00f11423          	sh	a5,8(sp)
8000bd80:	05e00793          	li	a5,94
8000bd84:	00f10523          	sb	a5,10(sp)
8000bd88:	0014c783          	lbu	a5,1(s1)
8000bd8c:	00810693          	addi	a3,sp,8
8000bd90:	07f7f793          	andi	a5,a5,127
8000bd94:	00f105a3          	sb	a5,11(sp)
8000bd98:	0024c783          	lbu	a5,2(s1)
8000bd9c:	00f10623          	sb	a5,12(sp)
8000bda0:	0034c783          	lbu	a5,3(s1)
8000bda4:	00f106a3          	sb	a5,13(sp)
8000bda8:	00001737          	lui	a4,0x1
8000bdac:	80070713          	addi	a4,a4,-2048 # 800 <CUSTOM1+0x7d5>
8000bdb0:	02e40613          	addi	a2,s0,46
8000bdb4:	00090593          	mv	a1,s2
8000bdb8:	00040513          	mv	a0,s0
8000bdbc:	6c0010ef          	jal	ra,8000d47c <ethernet_output>
8000bdc0:	0a40006f          	j	8000be64 <etharp_output+0x12c>
8000bdc4:	00442703          	lw	a4,4(s0)
8000bdc8:	00842603          	lw	a2,8(s0)
8000bdcc:	00050693          	mv	a3,a0
8000bdd0:	00e7c733          	xor	a4,a5,a4
8000bdd4:	00c77733          	and	a4,a4,a2
8000bdd8:	02070463          	beqz	a4,8000be00 <etharp_output+0xc8>
8000bddc:	01079793          	slli	a5,a5,0x10
8000bde0:	00010737          	lui	a4,0x10
8000bde4:	0107d793          	srli	a5,a5,0x10
8000bde8:	ea970713          	addi	a4,a4,-343 # fea9 <_stack_size+0xeea9>
8000bdec:	00e78a63          	beq	a5,a4,8000be00 <etharp_output+0xc8>
8000bdf0:	00c42783          	lw	a5,12(s0)
8000bdf4:	ffc00513          	li	a0,-4
8000bdf8:	06078663          	beqz	a5,8000be64 <etharp_output+0x12c>
8000bdfc:	00c40493          	addi	s1,s0,12
8000be00:	03c42583          	lw	a1,60(s0)
8000be04:	b6c18793          	addi	a5,gp,-1172 # 800035dc <arp_table>
8000be08:	06058a63          	beqz	a1,8000be7c <etharp_output+0x144>
8000be0c:	0005c603          	lbu	a2,0(a1)
8000be10:	00900713          	li	a4,9
8000be14:	06c76463          	bltu	a4,a2,8000be7c <etharp_output+0x144>
8000be18:	00161713          	slli	a4,a2,0x1
8000be1c:	00c70733          	add	a4,a4,a2
8000be20:	00371713          	slli	a4,a4,0x3
8000be24:	00e78733          	add	a4,a5,a4
8000be28:	01474803          	lbu	a6,20(a4)
8000be2c:	00100513          	li	a0,1
8000be30:	05057663          	bgeu	a0,a6,8000be7c <etharp_output+0x144>
8000be34:	00872503          	lw	a0,8(a4)
8000be38:	04851263          	bne	a0,s0,8000be7c <etharp_output+0x144>
8000be3c:	0004a503          	lw	a0,0(s1)
8000be40:	00472703          	lw	a4,4(a4)
8000be44:	02e51c63          	bne	a0,a4,8000be7c <etharp_output+0x144>
8000be48:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000be4c:	05c7a703          	lw	a4,92(a5)
8000be50:	00170713          	addi	a4,a4,1
8000be54:	04e7ae23          	sw	a4,92(a5)
8000be58:	00090593          	mv	a1,s2
8000be5c:	00040513          	mv	a0,s0
8000be60:	c19ff0ef          	jal	ra,8000ba78 <etharp_output_to_arp_index>
8000be64:	01c12083          	lw	ra,28(sp)
8000be68:	01812403          	lw	s0,24(sp)
8000be6c:	01412483          	lw	s1,20(sp)
8000be70:	01012903          	lw	s2,16(sp)
8000be74:	02010113          	addi	sp,sp,32
8000be78:	00008067          	ret
8000be7c:	00100613          	li	a2,1
8000be80:	00a00713          	li	a4,10
8000be84:	0147c503          	lbu	a0,20(a5)
8000be88:	02a67463          	bgeu	a2,a0,8000beb0 <etharp_output+0x178>
8000be8c:	0087a503          	lw	a0,8(a5)
8000be90:	02851063          	bne	a0,s0,8000beb0 <etharp_output+0x178>
8000be94:	0004a803          	lw	a6,0(s1)
8000be98:	0047a503          	lw	a0,4(a5)
8000be9c:	00a81a63          	bne	a6,a0,8000beb0 <etharp_output+0x178>
8000bea0:	00058463          	beqz	a1,8000bea8 <etharp_output+0x170>
8000bea4:	00d58023          	sb	a3,0(a1)
8000bea8:	00068613          	mv	a2,a3
8000beac:	fadff06f          	j	8000be58 <etharp_output+0x120>
8000beb0:	00168693          	addi	a3,a3,1
8000beb4:	0ff6f693          	andi	a3,a3,255
8000beb8:	01878793          	addi	a5,a5,24
8000bebc:	fce694e3          	bne	a3,a4,8000be84 <etharp_output+0x14c>
8000bec0:	00090613          	mv	a2,s2
8000bec4:	00048593          	mv	a1,s1
8000bec8:	00040513          	mv	a0,s0
8000becc:	c89ff0ef          	jal	ra,8000bb54 <etharp_query>
8000bed0:	f95ff06f          	j	8000be64 <etharp_output+0x12c>
8000bed4:	85418693          	addi	a3,gp,-1964 # 800032c4 <ethbroadcast>
8000bed8:	ed1ff06f          	j	8000bda8 <etharp_output+0x70>

8000bedc <icmp_input>:
8000bedc:	fd010113          	addi	sp,sp,-48
8000bee0:	02912223          	sw	s1,36(sp)
8000bee4:	02812423          	sw	s0,40(sp)
8000bee8:	01712623          	sw	s7,12(sp)
8000beec:	02112623          	sw	ra,44(sp)
8000bef0:	03212023          	sw	s2,32(sp)
8000bef4:	01312e23          	sw	s3,28(sp)
8000bef8:	01412c23          	sw	s4,24(sp)
8000befc:	01512a23          	sw	s5,20(sp)
8000bf00:	01612823          	sw	s6,16(sp)
8000bf04:	01812423          	sw	s8,8(sp)
8000bf08:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000bf0c:	0c47a703          	lw	a4,196(a5)
8000bf10:	00050413          	mv	s0,a0
8000bf14:	00170713          	addi	a4,a4,1
8000bf18:	0ce7a223          	sw	a4,196(a5)
8000bf1c:	a1418713          	addi	a4,gp,-1516 # 80003484 <ip_data>
8000bf20:	00872c03          	lw	s8,8(a4)
8000bf24:	01300713          	li	a4,19
8000bf28:	a2c18493          	addi	s1,gp,-1492 # 8000349c <lwip_stats>
8000bf2c:	000c4a83          	lbu	s5,0(s8)
8000bf30:	00fafa93          	andi	s5,s5,15
8000bf34:	002a9a93          	slli	s5,s5,0x2
8000bf38:	2b577863          	bgeu	a4,s5,8000c1e8 <icmp_input+0x30c>
8000bf3c:	00a55683          	lhu	a3,10(a0)
8000bf40:	00300713          	li	a4,3
8000bf44:	2ad77263          	bgeu	a4,a3,8000c1e8 <icmp_input+0x30c>
8000bf48:	00452703          	lw	a4,4(a0)
8000bf4c:	00074703          	lbu	a4,0(a4)
8000bf50:	22070663          	beqz	a4,8000c17c <icmp_input+0x2a0>
8000bf54:	00800693          	li	a3,8
8000bf58:	26d71a63          	bne	a4,a3,8000c1cc <icmp_input+0x2f0>
8000bf5c:	a1418b93          	addi	s7,gp,-1516 # 80003484 <ip_data>
8000bf60:	014ba503          	lw	a0,20(s7)
8000bf64:	0e000793          	li	a5,224
8000bf68:	00058993          	mv	s3,a1
8000bf6c:	0f057713          	andi	a4,a0,240
8000bf70:	00458913          	addi	s2,a1,4
8000bf74:	00f70463          	beq	a4,a5,8000bf7c <icmp_input+0xa0>
8000bf78:	a2818913          	addi	s2,gp,-1496 # 80003498 <ip_data+0x14>
8000bf7c:	000ba583          	lw	a1,0(s7)
8000bf80:	721000ef          	jal	ra,8000cea0 <ip4_addr_isbroadcast_u32>
8000bf84:	00050463          	beqz	a0,8000bf8c <icmp_input+0xb0>
8000bf88:	00498913          	addi	s2,s3,4
8000bf8c:	00845703          	lhu	a4,8(s0)
8000bf90:	00700793          	li	a5,7
8000bf94:	24e7fa63          	bgeu	a5,a4,8000c1e8 <icmp_input+0x30c>
8000bf98:	00040513          	mv	a0,s0
8000bf9c:	d4dfa0ef          	jal	ra,80006ce8 <inet_chksum_pbuf>
8000bfa0:	04050463          	beqz	a0,8000bfe8 <icmp_input+0x10c>
8000bfa4:	00040513          	mv	a0,s0
8000bfa8:	94dfb0ef          	jal	ra,800078f4 <pbuf_free>
8000bfac:	0d04a783          	lw	a5,208(s1)
8000bfb0:	00178793          	addi	a5,a5,1
8000bfb4:	0cf4a823          	sw	a5,208(s1)
8000bfb8:	02c12083          	lw	ra,44(sp)
8000bfbc:	02812403          	lw	s0,40(sp)
8000bfc0:	02412483          	lw	s1,36(sp)
8000bfc4:	02012903          	lw	s2,32(sp)
8000bfc8:	01c12983          	lw	s3,28(sp)
8000bfcc:	01812a03          	lw	s4,24(sp)
8000bfd0:	01412a83          	lw	s5,20(sp)
8000bfd4:	01012b03          	lw	s6,16(sp)
8000bfd8:	00c12b83          	lw	s7,12(sp)
8000bfdc:	00812c03          	lw	s8,8(sp)
8000bfe0:	03010113          	addi	sp,sp,48
8000bfe4:	00008067          	ret
8000bfe8:	010a8b13          	addi	s6,s5,16
8000bfec:	010a9a13          	slli	s4,s5,0x10
8000bff0:	000b0593          	mv	a1,s6
8000bff4:	00040513          	mv	a0,s0
8000bff8:	010a5a13          	srli	s4,s4,0x10
8000bffc:	861fb0ef          	jal	ra,8000785c <pbuf_add_header>
8000c000:	1a050863          	beqz	a0,8000c1b0 <icmp_input+0x2d4>
8000c004:	00845783          	lhu	a5,8(s0)
8000c008:	014785b3          	add	a1,a5,s4
8000c00c:	01059593          	slli	a1,a1,0x10
8000c010:	0105d593          	srli	a1,a1,0x10
8000c014:	02f5e463          	bltu	a1,a5,8000c03c <icmp_input+0x160>
8000c018:	28000613          	li	a2,640
8000c01c:	01000513          	li	a0,16
8000c020:	9a9fb0ef          	jal	ra,800079c8 <pbuf_alloc>
8000c024:	00050b13          	mv	s6,a0
8000c028:	00050a63          	beqz	a0,8000c03c <icmp_input+0x160>
8000c02c:	00a55703          	lhu	a4,10(a0)
8000c030:	008a8793          	addi	a5,s5,8
8000c034:	02f77063          	bgeu	a4,a5,8000c054 <icmp_input+0x178>
8000c038:	8bdfb0ef          	jal	ra,800078f4 <pbuf_free>
8000c03c:	00040513          	mv	a0,s0
8000c040:	8b5fb0ef          	jal	ra,800078f4 <pbuf_free>
8000c044:	0e84a783          	lw	a5,232(s1)
8000c048:	00178793          	addi	a5,a5,1
8000c04c:	0ef4a423          	sw	a5,232(s1)
8000c050:	f69ff06f          	j	8000bfb8 <icmp_input+0xdc>
8000c054:	00452503          	lw	a0,4(a0)
8000c058:	000c0593          	mv	a1,s8
8000c05c:	000a8613          	mv	a2,s5
8000c060:	2a9020ef          	jal	ra,8000eb08 <memcpy>
8000c064:	000a8593          	mv	a1,s5
8000c068:	000b0513          	mv	a0,s6
8000c06c:	801fb0ef          	jal	ra,8000786c <pbuf_remove_header>
8000c070:	00050663          	beqz	a0,8000c07c <icmp_input+0x1a0>
8000c074:	000b0513          	mv	a0,s6
8000c078:	fc1ff06f          	j	8000c038 <icmp_input+0x15c>
8000c07c:	00040593          	mv	a1,s0
8000c080:	000b0513          	mv	a0,s6
8000c084:	d45fb0ef          	jal	ra,80007dc8 <pbuf_copy>
8000c088:	fe0516e3          	bnez	a0,8000c074 <icmp_input+0x198>
8000c08c:	00040513          	mv	a0,s0
8000c090:	865fb0ef          	jal	ra,800078f4 <pbuf_free>
8000c094:	000b0413          	mv	s0,s6
8000c098:	000a8593          	mv	a1,s5
8000c09c:	00040513          	mv	a0,s0
8000c0a0:	00442b03          	lw	s6,4(s0)
8000c0a4:	fb8fb0ef          	jal	ra,8000785c <pbuf_add_header>
8000c0a8:	0c051a63          	bnez	a0,8000c17c <icmp_input+0x2a0>
8000c0ac:	00092783          	lw	a5,0(s2)
8000c0b0:	00442a83          	lw	s5,4(s0)
8000c0b4:	0087d713          	srli	a4,a5,0x8
8000c0b8:	00fa8623          	sb	a5,12(s5)
8000c0bc:	00ea86a3          	sb	a4,13(s5)
8000c0c0:	0107d713          	srli	a4,a5,0x10
8000c0c4:	0187d793          	srli	a5,a5,0x18
8000c0c8:	00ea8723          	sb	a4,14(s5)
8000c0cc:	00fa87a3          	sb	a5,15(s5)
8000c0d0:	010ba783          	lw	a5,16(s7)
8000c0d4:	0087d713          	srli	a4,a5,0x8
8000c0d8:	00fa8823          	sb	a5,16(s5)
8000c0dc:	00ea88a3          	sb	a4,17(s5)
8000c0e0:	0107d713          	srli	a4,a5,0x10
8000c0e4:	0187d793          	srli	a5,a5,0x18
8000c0e8:	00ea8923          	sb	a4,18(s5)
8000c0ec:	00fa89a3          	sb	a5,19(s5)
8000c0f0:	003b4783          	lbu	a5,3(s6)
8000c0f4:	002b4703          	lbu	a4,2(s6)
8000c0f8:	000b0023          	sb	zero,0(s6)
8000c0fc:	00879793          	slli	a5,a5,0x8
8000c100:	00e7e7b3          	or	a5,a5,a4
8000c104:	00010737          	lui	a4,0x10
8000c108:	ff770713          	addi	a4,a4,-9 # fff7 <_stack_size+0xeff7>
8000c10c:	0af77c63          	bgeu	a4,a5,8000c1c4 <icmp_input+0x2e8>
8000c110:	00978793          	addi	a5,a5,9
8000c114:	01079793          	slli	a5,a5,0x10
8000c118:	0107d793          	srli	a5,a5,0x10
8000c11c:	00fb0123          	sb	a5,2(s6)
8000c120:	0087d793          	srli	a5,a5,0x8
8000c124:	00fb01a3          	sb	a5,3(s6)
8000c128:	fff00793          	li	a5,-1
8000c12c:	00fa8423          	sb	a5,8(s5)
8000c130:	000a0593          	mv	a1,s4
8000c134:	000a8523          	sb	zero,10(s5)
8000c138:	000a85a3          	sb	zero,11(s5)
8000c13c:	000a8513          	mv	a0,s5
8000c140:	b85fa0ef          	jal	ra,80006cc4 <inet_chksum>
8000c144:	00aa8523          	sb	a0,10(s5)
8000c148:	00855513          	srli	a0,a0,0x8
8000c14c:	00aa85a3          	sb	a0,11(s5)
8000c150:	0c04a783          	lw	a5,192(s1)
8000c154:	00098813          	mv	a6,s3
8000c158:	00000713          	li	a4,0
8000c15c:	00178793          	addi	a5,a5,1
8000c160:	0cf4a023          	sw	a5,192(s1)
8000c164:	0ff00693          	li	a3,255
8000c168:	00100793          	li	a5,1
8000c16c:	00000613          	li	a2,0
8000c170:	00090593          	mv	a1,s2
8000c174:	00040513          	mv	a0,s0
8000c178:	3fd000ef          	jal	ra,8000cd74 <ip4_output_if>
8000c17c:	00040513          	mv	a0,s0
8000c180:	02812403          	lw	s0,40(sp)
8000c184:	02c12083          	lw	ra,44(sp)
8000c188:	02412483          	lw	s1,36(sp)
8000c18c:	02012903          	lw	s2,32(sp)
8000c190:	01c12983          	lw	s3,28(sp)
8000c194:	01812a03          	lw	s4,24(sp)
8000c198:	01412a83          	lw	s5,20(sp)
8000c19c:	01012b03          	lw	s6,16(sp)
8000c1a0:	00c12b83          	lw	s7,12(sp)
8000c1a4:	00812c03          	lw	s8,8(sp)
8000c1a8:	03010113          	addi	sp,sp,48
8000c1ac:	f48fb06f          	j	800078f4 <pbuf_free>
8000c1b0:	000b0593          	mv	a1,s6
8000c1b4:	00040513          	mv	a0,s0
8000c1b8:	eb4fb0ef          	jal	ra,8000786c <pbuf_remove_header>
8000c1bc:	ec050ee3          	beqz	a0,8000c098 <icmp_input+0x1bc>
8000c1c0:	e7dff06f          	j	8000c03c <icmp_input+0x160>
8000c1c4:	00878793          	addi	a5,a5,8
8000c1c8:	f4dff06f          	j	8000c114 <icmp_input+0x238>
8000c1cc:	0e07a703          	lw	a4,224(a5)
8000c1d0:	00170713          	addi	a4,a4,1
8000c1d4:	0ee7a023          	sw	a4,224(a5)
8000c1d8:	0cc7a703          	lw	a4,204(a5)
8000c1dc:	00170713          	addi	a4,a4,1
8000c1e0:	0ce7a623          	sw	a4,204(a5)
8000c1e4:	f99ff06f          	j	8000c17c <icmp_input+0x2a0>
8000c1e8:	00040513          	mv	a0,s0
8000c1ec:	f08fb0ef          	jal	ra,800078f4 <pbuf_free>
8000c1f0:	0d44a783          	lw	a5,212(s1)
8000c1f4:	00178793          	addi	a5,a5,1
8000c1f8:	0cf4aa23          	sw	a5,212(s1)
8000c1fc:	dbdff06f          	j	8000bfb8 <icmp_input+0xdc>

8000c200 <icmp_dest_unreach>:
8000c200:	fc010113          	addi	sp,sp,-64
8000c204:	03312623          	sw	s3,44(sp)
8000c208:	03412423          	sw	s4,40(sp)
8000c20c:	00050993          	mv	s3,a0
8000c210:	00058a13          	mv	s4,a1
8000c214:	28000613          	li	a2,640
8000c218:	02400593          	li	a1,36
8000c21c:	02400513          	li	a0,36
8000c220:	02112e23          	sw	ra,60(sp)
8000c224:	02812c23          	sw	s0,56(sp)
8000c228:	02912a23          	sw	s1,52(sp)
8000c22c:	03212823          	sw	s2,48(sp)
8000c230:	f98fb0ef          	jal	ra,800079c8 <pbuf_alloc>
8000c234:	0c050a63          	beqz	a0,8000c308 <icmp_dest_unreach+0x108>
8000c238:	00452403          	lw	s0,4(a0)
8000c23c:	00300793          	li	a5,3
8000c240:	0049a903          	lw	s2,4(s3)
8000c244:	00f40023          	sb	a5,0(s0)
8000c248:	014400a3          	sb	s4,1(s0)
8000c24c:	00040223          	sb	zero,4(s0)
8000c250:	000402a3          	sb	zero,5(s0)
8000c254:	00040323          	sb	zero,6(s0)
8000c258:	000403a3          	sb	zero,7(s0)
8000c25c:	00050493          	mv	s1,a0
8000c260:	00452503          	lw	a0,4(a0)
8000c264:	0049a583          	lw	a1,4(s3)
8000c268:	01c00613          	li	a2,28
8000c26c:	00850513          	addi	a0,a0,8
8000c270:	099020ef          	jal	ra,8000eb08 <memcpy>
8000c274:	00d94703          	lbu	a4,13(s2)
8000c278:	00c94783          	lbu	a5,12(s2)
8000c27c:	01c10513          	addi	a0,sp,28
8000c280:	00871713          	slli	a4,a4,0x8
8000c284:	00f76733          	or	a4,a4,a5
8000c288:	00e94783          	lbu	a5,14(s2)
8000c28c:	01079793          	slli	a5,a5,0x10
8000c290:	00e7e733          	or	a4,a5,a4
8000c294:	00f94783          	lbu	a5,15(s2)
8000c298:	01879793          	slli	a5,a5,0x18
8000c29c:	00e7e7b3          	or	a5,a5,a4
8000c2a0:	00f12e23          	sw	a5,28(sp)
8000c2a4:	438000ef          	jal	ra,8000c6dc <ip4_route>
8000c2a8:	00a12623          	sw	a0,12(sp)
8000c2ac:	04050a63          	beqz	a0,8000c300 <icmp_dest_unreach+0x100>
8000c2b0:	00040123          	sb	zero,2(s0)
8000c2b4:	000401a3          	sb	zero,3(s0)
8000c2b8:	00a4d583          	lhu	a1,10(s1)
8000c2bc:	00040513          	mv	a0,s0
8000c2c0:	a05fa0ef          	jal	ra,80006cc4 <inet_chksum>
8000c2c4:	00a40123          	sb	a0,2(s0)
8000c2c8:	00855513          	srli	a0,a0,0x8
8000c2cc:	00a401a3          	sb	a0,3(s0)
8000c2d0:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000c2d4:	0c07a703          	lw	a4,192(a5)
8000c2d8:	00c12803          	lw	a6,12(sp)
8000c2dc:	0ff00693          	li	a3,255
8000c2e0:	00170713          	addi	a4,a4,1
8000c2e4:	0ce7a023          	sw	a4,192(a5)
8000c2e8:	01c10613          	addi	a2,sp,28
8000c2ec:	00100793          	li	a5,1
8000c2f0:	00000713          	li	a4,0
8000c2f4:	00000593          	li	a1,0
8000c2f8:	00048513          	mv	a0,s1
8000c2fc:	279000ef          	jal	ra,8000cd74 <ip4_output_if>
8000c300:	00048513          	mv	a0,s1
8000c304:	df0fb0ef          	jal	ra,800078f4 <pbuf_free>
8000c308:	03c12083          	lw	ra,60(sp)
8000c30c:	03812403          	lw	s0,56(sp)
8000c310:	03412483          	lw	s1,52(sp)
8000c314:	03012903          	lw	s2,48(sp)
8000c318:	02c12983          	lw	s3,44(sp)
8000c31c:	02812a03          	lw	s4,40(sp)
8000c320:	04010113          	addi	sp,sp,64
8000c324:	00008067          	ret

8000c328 <ipfrag_free_pbuf_custom>:
8000c328:	00050593          	mv	a1,a0
8000c32c:	01452503          	lw	a0,20(a0)
8000c330:	02050463          	beqz	a0,8000c358 <ipfrag_free_pbuf_custom+0x30>
8000c334:	fe010113          	addi	sp,sp,-32
8000c338:	00112e23          	sw	ra,28(sp)
8000c33c:	00b12623          	sw	a1,12(sp)
8000c340:	db4fb0ef          	jal	ra,800078f4 <pbuf_free>
8000c344:	00c12583          	lw	a1,12(sp)
8000c348:	01c12083          	lw	ra,28(sp)
8000c34c:	00200513          	li	a0,2
8000c350:	02010113          	addi	sp,sp,32
8000c354:	cedfa06f          	j	80007040 <memp_free>
8000c358:	00200513          	li	a0,2
8000c35c:	ff9ff06f          	j	8000c354 <ipfrag_free_pbuf_custom+0x2c>

8000c360 <ip4_frag>:
8000c360:	fa010113          	addi	sp,sp,-96
8000c364:	04112e23          	sw	ra,92(sp)
8000c368:	04812c23          	sw	s0,88(sp)
8000c36c:	04912a23          	sw	s1,84(sp)
8000c370:	05212823          	sw	s2,80(sp)
8000c374:	05312623          	sw	s3,76(sp)
8000c378:	05412423          	sw	s4,72(sp)
8000c37c:	05512223          	sw	s5,68(sp)
8000c380:	05612023          	sw	s6,64(sp)
8000c384:	03712e23          	sw	s7,60(sp)
8000c388:	03812c23          	sw	s8,56(sp)
8000c38c:	03912a23          	sw	s9,52(sp)
8000c390:	03a12823          	sw	s10,48(sp)
8000c394:	03b12623          	sw	s11,44(sp)
8000c398:	02c5d783          	lhu	a5,44(a1)
8000c39c:	00452c03          	lw	s8,4(a0)
8000c3a0:	00c12623          	sw	a2,12(sp)
8000c3a4:	fec78713          	addi	a4,a5,-20
8000c3a8:	41f75793          	srai	a5,a4,0x1f
8000c3ac:	0077f793          	andi	a5,a5,7
8000c3b0:	00e787b3          	add	a5,a5,a4
8000c3b4:	4037d793          	srai	a5,a5,0x3
8000c3b8:	01079793          	slli	a5,a5,0x10
8000c3bc:	0107d793          	srli	a5,a5,0x10
8000c3c0:	00f12223          	sw	a5,4(sp)
8000c3c4:	000c4783          	lbu	a5,0(s8)
8000c3c8:	01400713          	li	a4,20
8000c3cc:	00f7f793          	andi	a5,a5,15
8000c3d0:	00279793          	slli	a5,a5,0x2
8000c3d4:	2ae79663          	bne	a5,a4,8000c680 <ip4_frag+0x320>
8000c3d8:	00a55703          	lhu	a4,10(a0)
8000c3dc:	01300793          	li	a5,19
8000c3e0:	00050413          	mv	s0,a0
8000c3e4:	ffa00513          	li	a0,-6
8000c3e8:	06e7fc63          	bgeu	a5,a4,8000c460 <ip4_frag+0x100>
8000c3ec:	007c4783          	lbu	a5,7(s8)
8000c3f0:	006c4503          	lbu	a0,6(s8)
8000c3f4:	00058c93          	mv	s9,a1
8000c3f8:	00879793          	slli	a5,a5,0x8
8000c3fc:	00a7e533          	or	a0,a5,a0
8000c400:	ad0fa0ef          	jal	ra,800066d0 <lwip_htons>
8000c404:	000027b7          	lui	a5,0x2
8000c408:	00f577b3          	and	a5,a0,a5
8000c40c:	00f12423          	sw	a5,8(sp)
8000c410:	00412783          	lw	a5,4(sp)
8000c414:	00845483          	lhu	s1,8(s0)
8000c418:	01351b93          	slli	s7,a0,0x13
8000c41c:	00379793          	slli	a5,a5,0x3
8000c420:	01079793          	slli	a5,a5,0x10
8000c424:	0107d793          	srli	a5,a5,0x10
8000c428:	fec48493          	addi	s1,s1,-20
8000c42c:	00f12023          	sw	a5,0(sp)
8000c430:	00f11923          	sh	a5,18(sp)
8000c434:	8000c7b7          	lui	a5,0x8000c
8000c438:	01049493          	slli	s1,s1,0x10
8000c43c:	32878793          	addi	a5,a5,808 # 8000c328 <_ram_heap_end+0xffff4328>
8000c440:	013bdb93          	srli	s7,s7,0x13
8000c444:	0104d493          	srli	s1,s1,0x10
8000c448:	01400a13          	li	s4,20
8000c44c:	00000913          	li	s2,0
8000c450:	00f12a23          	sw	a5,20(sp)
8000c454:	a2c18d13          	addi	s10,gp,-1492 # 8000349c <lwip_stats>
8000c458:	04049263          	bnez	s1,8000c49c <ip4_frag+0x13c>
8000c45c:	00000513          	li	a0,0
8000c460:	05c12083          	lw	ra,92(sp)
8000c464:	05812403          	lw	s0,88(sp)
8000c468:	05412483          	lw	s1,84(sp)
8000c46c:	05012903          	lw	s2,80(sp)
8000c470:	04c12983          	lw	s3,76(sp)
8000c474:	04812a03          	lw	s4,72(sp)
8000c478:	04412a83          	lw	s5,68(sp)
8000c47c:	04012b03          	lw	s6,64(sp)
8000c480:	03c12b83          	lw	s7,60(sp)
8000c484:	03812c03          	lw	s8,56(sp)
8000c488:	03412c83          	lw	s9,52(sp)
8000c48c:	03012d03          	lw	s10,48(sp)
8000c490:	02c12d83          	lw	s11,44(sp)
8000c494:	06010113          	addi	sp,sp,96
8000c498:	00008067          	ret
8000c49c:	00012783          	lw	a5,0(sp)
8000c4a0:	01215a83          	lhu	s5,18(sp)
8000c4a4:	00f4f463          	bgeu	s1,a5,8000c4ac <ip4_frag+0x14c>
8000c4a8:	00048a93          	mv	s5,s1
8000c4ac:	28000613          	li	a2,640
8000c4b0:	01400593          	li	a1,20
8000c4b4:	01000513          	li	a0,16
8000c4b8:	010a9a93          	slli	s5,s5,0x10
8000c4bc:	d0cfb0ef          	jal	ra,800079c8 <pbuf_alloc>
8000c4c0:	010ada93          	srli	s5,s5,0x10
8000c4c4:	00050b13          	mv	s6,a0
8000c4c8:	06050a63          	beqz	a0,8000c53c <ip4_frag+0x1dc>
8000c4cc:	00452503          	lw	a0,4(a0)
8000c4d0:	01400613          	li	a2,20
8000c4d4:	000c0593          	mv	a1,s8
8000c4d8:	630020ef          	jal	ra,8000eb08 <memcpy>
8000c4dc:	004b2983          	lw	s3,4(s6)
8000c4e0:	000a8d93          	mv	s11,s5
8000c4e4:	0c0d8c63          	beqz	s11,8000c5bc <ip4_frag+0x25c>
8000c4e8:	00a45783          	lhu	a5,10(s0)
8000c4ec:	414787b3          	sub	a5,a5,s4
8000c4f0:	00078913          	mv	s2,a5
8000c4f4:	01079793          	slli	a5,a5,0x10
8000c4f8:	0107d793          	srli	a5,a5,0x10
8000c4fc:	00fdf463          	bgeu	s11,a5,8000c504 <ip4_frag+0x1a4>
8000c500:	000d8913          	mv	s2,s11
8000c504:	01091913          	slli	s2,s2,0x10
8000c508:	01095913          	srli	s2,s2,0x10
8000c50c:	00091863          	bnez	s2,8000c51c <ip4_frag+0x1bc>
8000c510:	00042403          	lw	s0,0(s0)
8000c514:	00000a13          	li	s4,0
8000c518:	fcdff06f          	j	8000c4e4 <ip4_frag+0x184>
8000c51c:	800037b7          	lui	a5,0x80003
8000c520:	2bd00613          	li	a2,701
8000c524:	f2078593          	addi	a1,a5,-224 # 80002f20 <_ram_heap_end+0xfffeaf20>
8000c528:	00200513          	li	a0,2
8000c52c:	addfa0ef          	jal	ra,80007008 <memp_malloc_fn>
8000c530:	00051a63          	bnez	a0,8000c544 <ip4_frag+0x1e4>
8000c534:	000b0513          	mv	a0,s6
8000c538:	bbcfb0ef          	jal	ra,800078f4 <pbuf_free>
8000c53c:	fff00513          	li	a0,-1
8000c540:	f21ff06f          	j	8000c460 <ip4_frag+0x100>
8000c544:	00442703          	lw	a4,4(s0)
8000c548:	00050693          	mv	a3,a0
8000c54c:	00a12c23          	sw	a0,24(sp)
8000c550:	00090793          	mv	a5,s2
8000c554:	01470733          	add	a4,a4,s4
8000c558:	04100613          	li	a2,65
8000c55c:	00090593          	mv	a1,s2
8000c560:	00000513          	li	a0,0
8000c564:	aa4fb0ef          	jal	ra,80007808 <pbuf_alloced_custom>
8000c568:	01812883          	lw	a7,24(sp)
8000c56c:	00051a63          	bnez	a0,8000c580 <ip4_frag+0x220>
8000c570:	00088593          	mv	a1,a7
8000c574:	00200513          	li	a0,2
8000c578:	ac9fa0ef          	jal	ra,80007040 <memp_free>
8000c57c:	fb9ff06f          	j	8000c534 <ip4_frag+0x1d4>
8000c580:	00a12c23          	sw	a0,24(sp)
8000c584:	00040513          	mv	a0,s0
8000c588:	01112e23          	sw	a7,28(sp)
8000c58c:	f50fb0ef          	jal	ra,80007cdc <pbuf_ref>
8000c590:	01c12883          	lw	a7,28(sp)
8000c594:	01412783          	lw	a5,20(sp)
8000c598:	01812583          	lw	a1,24(sp)
8000c59c:	0088aa23          	sw	s0,20(a7)
8000c5a0:	00f8a823          	sw	a5,16(a7)
8000c5a4:	000b0513          	mv	a0,s6
8000c5a8:	f6cfb0ef          	jal	ra,80007d14 <pbuf_cat>
8000c5ac:	412d8833          	sub	a6,s11,s2
8000c5b0:	01081d93          	slli	s11,a6,0x10
8000c5b4:	010ddd93          	srli	s11,s11,0x10
8000c5b8:	f40d9ce3          	bnez	s11,8000c510 <ip4_frag+0x1b0>
8000c5bc:	02ccd783          	lhu	a5,44(s9)
8000c5c0:	01490a33          	add	s4,s2,s4
8000c5c4:	010a1a13          	slli	s4,s4,0x10
8000c5c8:	013b9513          	slli	a0,s7,0x13
8000c5cc:	fed78793          	addi	a5,a5,-19
8000c5d0:	010a5a13          	srli	s4,s4,0x10
8000c5d4:	01355513          	srli	a0,a0,0x13
8000c5d8:	00f4d663          	bge	s1,a5,8000c5e4 <ip4_frag+0x284>
8000c5dc:	00812783          	lw	a5,8(sp)
8000c5e0:	00078663          	beqz	a5,8000c5ec <ip4_frag+0x28c>
8000c5e4:	000027b7          	lui	a5,0x2
8000c5e8:	00f56533          	or	a0,a0,a5
8000c5ec:	8e4fa0ef          	jal	ra,800066d0 <lwip_htons>
8000c5f0:	00a98323          	sb	a0,6(s3)
8000c5f4:	00855513          	srli	a0,a0,0x8
8000c5f8:	00a983a3          	sb	a0,7(s3)
8000c5fc:	014a8513          	addi	a0,s5,20
8000c600:	01051513          	slli	a0,a0,0x10
8000c604:	01055513          	srli	a0,a0,0x10
8000c608:	8c8fa0ef          	jal	ra,800066d0 <lwip_htons>
8000c60c:	00a98123          	sb	a0,2(s3)
8000c610:	00855513          	srli	a0,a0,0x8
8000c614:	00a981a3          	sb	a0,3(s3)
8000c618:	01400593          	li	a1,20
8000c61c:	00098523          	sb	zero,10(s3)
8000c620:	000985a3          	sb	zero,11(s3)
8000c624:	00098513          	mv	a0,s3
8000c628:	e9cfa0ef          	jal	ra,80006cc4 <inet_chksum>
8000c62c:	00a98523          	sb	a0,10(s3)
8000c630:	00855513          	srli	a0,a0,0x8
8000c634:	00a985a3          	sb	a0,11(s3)
8000c638:	014ca783          	lw	a5,20(s9)
8000c63c:	00c12603          	lw	a2,12(sp)
8000c640:	000b0593          	mv	a1,s6
8000c644:	000c8513          	mv	a0,s9
8000c648:	000780e7          	jalr	a5 # 2000 <_stack_size+0x1000>
8000c64c:	060d2783          	lw	a5,96(s10)
8000c650:	000b0513          	mv	a0,s6
8000c654:	415484b3          	sub	s1,s1,s5
8000c658:	00178793          	addi	a5,a5,1
8000c65c:	06fd2023          	sw	a5,96(s10)
8000c660:	a94fb0ef          	jal	ra,800078f4 <pbuf_free>
8000c664:	00412783          	lw	a5,4(sp)
8000c668:	01049493          	slli	s1,s1,0x10
8000c66c:	0104d493          	srli	s1,s1,0x10
8000c670:	00fb8bb3          	add	s7,s7,a5
8000c674:	010b9b93          	slli	s7,s7,0x10
8000c678:	010bdb93          	srli	s7,s7,0x10
8000c67c:	dddff06f          	j	8000c458 <ip4_frag+0xf8>
8000c680:	ffa00513          	li	a0,-6
8000c684:	dddff06f          	j	8000c460 <ip4_frag+0x100>

8000c688 <ip4_input_accept>:
8000c688:	03554783          	lbu	a5,53(a0)
8000c68c:	0017f793          	andi	a5,a5,1
8000c690:	04078063          	beqz	a5,8000c6d0 <ip4_input_accept+0x48>
8000c694:	00452703          	lw	a4,4(a0)
8000c698:	00050593          	mv	a1,a0
8000c69c:	00000513          	li	a0,0
8000c6a0:	02070c63          	beqz	a4,8000c6d8 <ip4_input_accept+0x50>
8000c6a4:	a281a783          	lw	a5,-1496(gp) # 80003498 <ip_data+0x14>
8000c6a8:	00100513          	li	a0,1
8000c6ac:	02f70663          	beq	a4,a5,8000c6d8 <ip4_input_accept+0x50>
8000c6b0:	ff010113          	addi	sp,sp,-16
8000c6b4:	00078513          	mv	a0,a5
8000c6b8:	00112623          	sw	ra,12(sp)
8000c6bc:	7e4000ef          	jal	ra,8000cea0 <ip4_addr_isbroadcast_u32>
8000c6c0:	00c12083          	lw	ra,12(sp)
8000c6c4:	00a03533          	snez	a0,a0
8000c6c8:	01010113          	addi	sp,sp,16
8000c6cc:	00008067          	ret
8000c6d0:	00000513          	li	a0,0
8000c6d4:	00008067          	ret
8000c6d8:	00008067          	ret

8000c6dc <ip4_route>:
8000c6dc:	8f41a783          	lw	a5,-1804(gp) # 80003364 <netif_list>
8000c6e0:	04079463          	bnez	a5,8000c728 <ip4_route+0x4c>
8000c6e4:	8f01a703          	lw	a4,-1808(gp) # 80003360 <netif_default>
8000c6e8:	02070463          	beqz	a4,8000c710 <ip4_route+0x34>
8000c6ec:	03574683          	lbu	a3,53(a4)
8000c6f0:	00500613          	li	a2,5
8000c6f4:	0056f693          	andi	a3,a3,5
8000c6f8:	00c69c63          	bne	a3,a2,8000c710 <ip4_route+0x34>
8000c6fc:	00472683          	lw	a3,4(a4)
8000c700:	00068863          	beqz	a3,8000c710 <ip4_route+0x34>
8000c704:	00054603          	lbu	a2,0(a0)
8000c708:	07f00693          	li	a3,127
8000c70c:	06d61463          	bne	a2,a3,8000c774 <ip4_route+0x98>
8000c710:	a2c18713          	addi	a4,gp,-1492 # 8000349c <lwip_stats>
8000c714:	0ac72683          	lw	a3,172(a4)
8000c718:	00168693          	addi	a3,a3,1
8000c71c:	0ad72623          	sw	a3,172(a4)
8000c720:	00078513          	mv	a0,a5
8000c724:	00008067          	ret
8000c728:	0357c683          	lbu	a3,53(a5)
8000c72c:	0016f713          	andi	a4,a3,1
8000c730:	02070e63          	beqz	a4,8000c76c <ip4_route+0x90>
8000c734:	0026d713          	srli	a4,a3,0x2
8000c738:	00177713          	andi	a4,a4,1
8000c73c:	02070863          	beqz	a4,8000c76c <ip4_route+0x90>
8000c740:	0047a703          	lw	a4,4(a5)
8000c744:	02070463          	beqz	a4,8000c76c <ip4_route+0x90>
8000c748:	00052603          	lw	a2,0(a0)
8000c74c:	0087a583          	lw	a1,8(a5)
8000c750:	00c74733          	xor	a4,a4,a2
8000c754:	00b77733          	and	a4,a4,a1
8000c758:	fc0704e3          	beqz	a4,8000c720 <ip4_route+0x44>
8000c75c:	0026f693          	andi	a3,a3,2
8000c760:	00069663          	bnez	a3,8000c76c <ip4_route+0x90>
8000c764:	00c7a703          	lw	a4,12(a5)
8000c768:	fae60ce3          	beq	a2,a4,8000c720 <ip4_route+0x44>
8000c76c:	0007a783          	lw	a5,0(a5)
8000c770:	f71ff06f          	j	8000c6e0 <ip4_route+0x4>
8000c774:	00070793          	mv	a5,a4
8000c778:	fa9ff06f          	j	8000c720 <ip4_route+0x44>

8000c77c <ip4_input>:
8000c77c:	fd010113          	addi	sp,sp,-48
8000c780:	02812423          	sw	s0,40(sp)
8000c784:	03212023          	sw	s2,32(sp)
8000c788:	02112623          	sw	ra,44(sp)
8000c78c:	02912223          	sw	s1,36(sp)
8000c790:	01312e23          	sw	s3,28(sp)
8000c794:	01412c23          	sw	s4,24(sp)
8000c798:	01512a23          	sw	s5,20(sp)
8000c79c:	01612823          	sw	s6,16(sp)
8000c7a0:	01712623          	sw	s7,12(sp)
8000c7a4:	01812423          	sw	s8,8(sp)
8000c7a8:	a2c18913          	addi	s2,gp,-1492 # 8000349c <lwip_stats>
8000c7ac:	09492783          	lw	a5,148(s2)
8000c7b0:	00178793          	addi	a5,a5,1
8000c7b4:	08f92a23          	sw	a5,148(s2)
8000c7b8:	00452483          	lw	s1,4(a0)
8000c7bc:	00400793          	li	a5,4
8000c7c0:	0004cb03          	lbu	s6,0(s1)
8000c7c4:	004b5713          	srli	a4,s6,0x4
8000c7c8:	04f70a63          	beq	a4,a5,8000c81c <ip4_input+0xa0>
8000c7cc:	928fb0ef          	jal	ra,800078f4 <pbuf_free>
8000c7d0:	0b892783          	lw	a5,184(s2)
8000c7d4:	00178793          	addi	a5,a5,1
8000c7d8:	0af92c23          	sw	a5,184(s2)
8000c7dc:	09c92783          	lw	a5,156(s2)
8000c7e0:	00178793          	addi	a5,a5,1
8000c7e4:	08f92e23          	sw	a5,156(s2)
8000c7e8:	02c12083          	lw	ra,44(sp)
8000c7ec:	02812403          	lw	s0,40(sp)
8000c7f0:	02412483          	lw	s1,36(sp)
8000c7f4:	02012903          	lw	s2,32(sp)
8000c7f8:	01c12983          	lw	s3,28(sp)
8000c7fc:	01812a03          	lw	s4,24(sp)
8000c800:	01412a83          	lw	s5,20(sp)
8000c804:	01012b03          	lw	s6,16(sp)
8000c808:	00c12b83          	lw	s7,12(sp)
8000c80c:	00812c03          	lw	s8,8(sp)
8000c810:	00000513          	li	a0,0
8000c814:	03010113          	addi	sp,sp,48
8000c818:	00008067          	ret
8000c81c:	0034c783          	lbu	a5,3(s1)
8000c820:	00050993          	mv	s3,a0
8000c824:	0024c503          	lbu	a0,2(s1)
8000c828:	00879793          	slli	a5,a5,0x8
8000c82c:	00058a93          	mv	s5,a1
8000c830:	00a7e533          	or	a0,a5,a0
8000c834:	e9df90ef          	jal	ra,800066d0 <lwip_htons>
8000c838:	00fb7b13          	andi	s6,s6,15
8000c83c:	0089d783          	lhu	a5,8(s3)
8000c840:	002b1b13          	slli	s6,s6,0x2
8000c844:	010b1913          	slli	s2,s6,0x10
8000c848:	a2c18413          	addi	s0,gp,-1492 # 8000349c <lwip_stats>
8000c84c:	01095913          	srli	s2,s2,0x10
8000c850:	00050a13          	mv	s4,a0
8000c854:	00f57863          	bgeu	a0,a5,8000c864 <ip4_input+0xe8>
8000c858:	00050593          	mv	a1,a0
8000c85c:	00098513          	mv	a0,s3
8000c860:	b38fb0ef          	jal	ra,80007b98 <pbuf_realloc>
8000c864:	00a9d783          	lhu	a5,10(s3)
8000c868:	0127ea63          	bltu	a5,s2,8000c87c <ip4_input+0x100>
8000c86c:	0089d783          	lhu	a5,8(s3)
8000c870:	0147e663          	bltu	a5,s4,8000c87c <ip4_input+0x100>
8000c874:	01300793          	li	a5,19
8000c878:	0327e463          	bltu	a5,s2,8000c8a0 <ip4_input+0x124>
8000c87c:	00098513          	mv	a0,s3
8000c880:	874fb0ef          	jal	ra,800078f4 <pbuf_free>
8000c884:	0a442783          	lw	a5,164(s0)
8000c888:	00178793          	addi	a5,a5,1
8000c88c:	0af42223          	sw	a5,164(s0)
8000c890:	09c42783          	lw	a5,156(s0)
8000c894:	00178793          	addi	a5,a5,1
8000c898:	08f42e23          	sw	a5,156(s0)
8000c89c:	f4dff06f          	j	8000c7e8 <ip4_input+0x6c>
8000c8a0:	00090593          	mv	a1,s2
8000c8a4:	00048513          	mv	a0,s1
8000c8a8:	c1cfa0ef          	jal	ra,80006cc4 <inet_chksum>
8000c8ac:	00050e63          	beqz	a0,8000c8c8 <ip4_input+0x14c>
8000c8b0:	00098513          	mv	a0,s3
8000c8b4:	840fb0ef          	jal	ra,800078f4 <pbuf_free>
8000c8b8:	0a042783          	lw	a5,160(s0)
8000c8bc:	00178793          	addi	a5,a5,1
8000c8c0:	0af42023          	sw	a5,160(s0)
8000c8c4:	fcdff06f          	j	8000c890 <ip4_input+0x114>
8000c8c8:	0114c703          	lbu	a4,17(s1)
8000c8cc:	0104c783          	lbu	a5,16(s1)
8000c8d0:	00871713          	slli	a4,a4,0x8
8000c8d4:	00f76733          	or	a4,a4,a5
8000c8d8:	0124c783          	lbu	a5,18(s1)
8000c8dc:	a1418613          	addi	a2,gp,-1516 # 80003484 <ip_data>
8000c8e0:	a1418913          	addi	s2,gp,-1516 # 80003484 <ip_data>
8000c8e4:	01079793          	slli	a5,a5,0x10
8000c8e8:	00e7e733          	or	a4,a5,a4
8000c8ec:	0134c783          	lbu	a5,19(s1)
8000c8f0:	01879793          	slli	a5,a5,0x18
8000c8f4:	00e7e7b3          	or	a5,a5,a4
8000c8f8:	00f62a23          	sw	a5,20(a2)
8000c8fc:	00d4c683          	lbu	a3,13(s1)
8000c900:	00c4c703          	lbu	a4,12(s1)
8000c904:	0f07f793          	andi	a5,a5,240
8000c908:	00869693          	slli	a3,a3,0x8
8000c90c:	00e6e6b3          	or	a3,a3,a4
8000c910:	00e4c703          	lbu	a4,14(s1)
8000c914:	01071713          	slli	a4,a4,0x10
8000c918:	00d766b3          	or	a3,a4,a3
8000c91c:	00f4c703          	lbu	a4,15(s1)
8000c920:	01871713          	slli	a4,a4,0x18
8000c924:	00d76733          	or	a4,a4,a3
8000c928:	00e62823          	sw	a4,16(a2)
8000c92c:	0e000713          	li	a4,224
8000c930:	06e79063          	bne	a5,a4,8000c990 <ip4_input+0x214>
8000c934:	035ac783          	lbu	a5,53(s5)
8000c938:	0017f793          	andi	a5,a5,1
8000c93c:	00079c63          	bnez	a5,8000c954 <ip4_input+0x1d8>
8000c940:	0094c703          	lbu	a4,9(s1)
8000c944:	01100793          	li	a5,17
8000c948:	08f70663          	beq	a4,a5,8000c9d4 <ip4_input+0x258>
8000c94c:	00000a13          	li	s4,0
8000c950:	0100006f          	j	8000c960 <ip4_input+0x1e4>
8000c954:	004aa783          	lw	a5,4(s5)
8000c958:	fe0784e3          	beqz	a5,8000c940 <ip4_input+0x1c4>
8000c95c:	000a8a13          	mv	s4,s5
8000c960:	01092503          	lw	a0,16(s2)
8000c964:	08050a63          	beqz	a0,8000c9f8 <ip4_input+0x27c>
8000c968:	000a8593          	mv	a1,s5
8000c96c:	534000ef          	jal	ra,8000cea0 <ip4_addr_isbroadcast_u32>
8000c970:	00051a63          	bnez	a0,8000c984 <ip4_input+0x208>
8000c974:	01092783          	lw	a5,16(s2)
8000c978:	0e000713          	li	a4,224
8000c97c:	0f07f793          	andi	a5,a5,240
8000c980:	06e79c63          	bne	a5,a4,8000c9f8 <ip4_input+0x27c>
8000c984:	00098513          	mv	a0,s3
8000c988:	f6dfa0ef          	jal	ra,800078f4 <pbuf_free>
8000c98c:	f05ff06f          	j	8000c890 <ip4_input+0x114>
8000c990:	000a8513          	mv	a0,s5
8000c994:	cf5ff0ef          	jal	ra,8000c688 <ip4_input_accept>
8000c998:	02051a63          	bnez	a0,8000c9cc <ip4_input+0x250>
8000c99c:	01494703          	lbu	a4,20(s2)
8000c9a0:	07f00793          	li	a5,127
8000c9a4:	f8f70ee3          	beq	a4,a5,8000c940 <ip4_input+0x1c4>
8000c9a8:	8f41aa03          	lw	s4,-1804(gp) # 80003364 <netif_list>
8000c9ac:	f80a0ae3          	beqz	s4,8000c940 <ip4_input+0x1c4>
8000c9b0:	015a1663          	bne	s4,s5,8000c9bc <ip4_input+0x240>
8000c9b4:	000a2a03          	lw	s4,0(s4)
8000c9b8:	ff5ff06f          	j	8000c9ac <ip4_input+0x230>
8000c9bc:	000a0513          	mv	a0,s4
8000c9c0:	cc9ff0ef          	jal	ra,8000c688 <ip4_input_accept>
8000c9c4:	fe0508e3          	beqz	a0,8000c9b4 <ip4_input+0x238>
8000c9c8:	f99ff06f          	j	8000c960 <ip4_input+0x1e4>
8000c9cc:	f80a98e3          	bnez	s5,8000c95c <ip4_input+0x1e0>
8000c9d0:	f71ff06f          	j	8000c940 <ip4_input+0x1c4>
8000c9d4:	01648733          	add	a4,s1,s6
8000c9d8:	00374783          	lbu	a5,3(a4)
8000c9dc:	00274683          	lbu	a3,2(a4)
8000c9e0:	00004737          	lui	a4,0x4
8000c9e4:	00879793          	slli	a5,a5,0x8
8000c9e8:	00d7e7b3          	or	a5,a5,a3
8000c9ec:	40070713          	addi	a4,a4,1024 # 4400 <_stack_size+0x3400>
8000c9f0:	f4e79ee3          	bne	a5,a4,8000c94c <ip4_input+0x1d0>
8000c9f4:	000a8a13          	mv	s4,s5
8000c9f8:	000a1e63          	bnez	s4,8000ca14 <ip4_input+0x298>
8000c9fc:	09c42783          	lw	a5,156(s0)
8000ca00:	00098513          	mv	a0,s3
8000ca04:	00178793          	addi	a5,a5,1
8000ca08:	08f42e23          	sw	a5,156(s0)
8000ca0c:	ee9fa0ef          	jal	ra,800078f4 <pbuf_free>
8000ca10:	dd9ff06f          	j	8000c7e8 <ip4_input+0x6c>
8000ca14:	0064c783          	lbu	a5,6(s1)
8000ca18:	0074c703          	lbu	a4,7(s1)
8000ca1c:	03f7f793          	andi	a5,a5,63
8000ca20:	00871713          	slli	a4,a4,0x8
8000ca24:	00e7e7b3          	or	a5,a5,a4
8000ca28:	00078e63          	beqz	a5,8000ca44 <ip4_input+0x2c8>
8000ca2c:	00098513          	mv	a0,s3
8000ca30:	ec5fa0ef          	jal	ra,800078f4 <pbuf_free>
8000ca34:	0b442783          	lw	a5,180(s0)
8000ca38:	00178793          	addi	a5,a5,1
8000ca3c:	0af42a23          	sw	a5,180(s0)
8000ca40:	e51ff06f          	j	8000c890 <ip4_input+0x114>
8000ca44:	01492023          	sw	s4,0(s2)
8000ca48:	01592223          	sw	s5,4(s2)
8000ca4c:	00992423          	sw	s1,8(s2)
8000ca50:	0004c783          	lbu	a5,0(s1)
8000ca54:	000a8593          	mv	a1,s5
8000ca58:	00098513          	mv	a0,s3
8000ca5c:	00f7f793          	andi	a5,a5,15
8000ca60:	00279793          	slli	a5,a5,0x2
8000ca64:	00f91623          	sh	a5,12(s2)
8000ca68:	00100c13          	li	s8,1
8000ca6c:	a7dfb0ef          	jal	ra,800084e8 <raw_input>
8000ca70:	00050b93          	mv	s7,a0
8000ca74:	03850663          	beq	a0,s8,8000caa0 <ip4_input+0x324>
8000ca78:	000b0593          	mv	a1,s6
8000ca7c:	00098513          	mv	a0,s3
8000ca80:	dedfa0ef          	jal	ra,8000786c <pbuf_remove_header>
8000ca84:	0094c783          	lbu	a5,9(s1)
8000ca88:	03878a63          	beq	a5,s8,8000cabc <ip4_input+0x340>
8000ca8c:	01100713          	li	a4,17
8000ca90:	02e79e63          	bne	a5,a4,8000cacc <ip4_input+0x350>
8000ca94:	000a8593          	mv	a1,s5
8000ca98:	00098513          	mv	a0,s3
8000ca9c:	a40fc0ef          	jal	ra,80008cdc <udp_input>
8000caa0:	00092023          	sw	zero,0(s2)
8000caa4:	00092223          	sw	zero,4(s2)
8000caa8:	00092423          	sw	zero,8(s2)
8000caac:	00091623          	sh	zero,12(s2)
8000cab0:	00092823          	sw	zero,16(s2)
8000cab4:	00092a23          	sw	zero,20(s2)
8000cab8:	d31ff06f          	j	8000c7e8 <ip4_input+0x6c>
8000cabc:	000a8593          	mv	a1,s5
8000cac0:	00098513          	mv	a0,s3
8000cac4:	c18ff0ef          	jal	ra,8000bedc <icmp_input>
8000cac8:	fd9ff06f          	j	8000caa0 <ip4_input+0x324>
8000cacc:	00200793          	li	a5,2
8000cad0:	04fb8a63          	beq	s7,a5,8000cb24 <ip4_input+0x3a8>
8000cad4:	01492503          	lw	a0,20(s2)
8000cad8:	000a0593          	mv	a1,s4
8000cadc:	3c4000ef          	jal	ra,8000cea0 <ip4_addr_isbroadcast_u32>
8000cae0:	02051663          	bnez	a0,8000cb0c <ip4_input+0x390>
8000cae4:	01492783          	lw	a5,20(s2)
8000cae8:	0e000713          	li	a4,224
8000caec:	0f07f793          	andi	a5,a5,240
8000caf0:	00e78e63          	beq	a5,a4,8000cb0c <ip4_input+0x390>
8000caf4:	000b0593          	mv	a1,s6
8000caf8:	00098513          	mv	a0,s3
8000cafc:	de5fa0ef          	jal	ra,800078e0 <pbuf_header_force>
8000cb00:	00200593          	li	a1,2
8000cb04:	00098513          	mv	a0,s3
8000cb08:	ef8ff0ef          	jal	ra,8000c200 <icmp_dest_unreach>
8000cb0c:	0b042783          	lw	a5,176(s0)
8000cb10:	00178793          	addi	a5,a5,1
8000cb14:	0af42823          	sw	a5,176(s0)
8000cb18:	09c42783          	lw	a5,156(s0)
8000cb1c:	00178793          	addi	a5,a5,1
8000cb20:	08f42e23          	sw	a5,156(s0)
8000cb24:	00098513          	mv	a0,s3
8000cb28:	dcdfa0ef          	jal	ra,800078f4 <pbuf_free>
8000cb2c:	f75ff06f          	j	8000caa0 <ip4_input+0x324>

8000cb30 <ip4_output_if_src>:
8000cb30:	fc010113          	addi	sp,sp,-64
8000cb34:	03212823          	sw	s2,48(sp)
8000cb38:	03412423          	sw	s4,40(sp)
8000cb3c:	03512223          	sw	s5,36(sp)
8000cb40:	02112e23          	sw	ra,60(sp)
8000cb44:	02812c23          	sw	s0,56(sp)
8000cb48:	02912a23          	sw	s1,52(sp)
8000cb4c:	03312623          	sw	s3,44(sp)
8000cb50:	03612023          	sw	s6,32(sp)
8000cb54:	00d12623          	sw	a3,12(sp)
8000cb58:	00f12423          	sw	a5,8(sp)
8000cb5c:	00c12223          	sw	a2,4(sp)
8000cb60:	00050913          	mv	s2,a0
8000cb64:	00080a13          	mv	s4,a6
8000cb68:	a2c18a93          	addi	s5,gp,-1492 # 8000349c <lwip_stats>
8000cb6c:	1a060863          	beqz	a2,8000cd1c <ip4_output_if_src+0x1ec>
8000cb70:	00058993          	mv	s3,a1
8000cb74:	01400593          	li	a1,20
8000cb78:	00070493          	mv	s1,a4
8000cb7c:	ce1fa0ef          	jal	ra,8000785c <pbuf_add_header>
8000cb80:	00412603          	lw	a2,4(sp)
8000cb84:	00812783          	lw	a5,8(sp)
8000cb88:	00c12683          	lw	a3,12(sp)
8000cb8c:	02050e63          	beqz	a0,8000cbc8 <ip4_output_if_src+0x98>
8000cb90:	0b8aa783          	lw	a5,184(s5)
8000cb94:	ffe00513          	li	a0,-2
8000cb98:	00178793          	addi	a5,a5,1
8000cb9c:	0afaac23          	sw	a5,184(s5)
8000cba0:	03c12083          	lw	ra,60(sp)
8000cba4:	03812403          	lw	s0,56(sp)
8000cba8:	03412483          	lw	s1,52(sp)
8000cbac:	03012903          	lw	s2,48(sp)
8000cbb0:	02c12983          	lw	s3,44(sp)
8000cbb4:	02812a03          	lw	s4,40(sp)
8000cbb8:	02412a83          	lw	s5,36(sp)
8000cbbc:	02012b03          	lw	s6,32(sp)
8000cbc0:	04010113          	addi	sp,sp,64
8000cbc4:	00008067          	ret
8000cbc8:	00492403          	lw	s0,4(s2)
8000cbcc:	00c12223          	sw	a2,4(sp)
8000cbd0:	00d40423          	sb	a3,8(s0)
8000cbd4:	00f404a3          	sb	a5,9(s0)
8000cbd8:	00869693          	slli	a3,a3,0x8
8000cbdc:	00f6e7b3          	or	a5,a3,a5
8000cbe0:	00062683          	lw	a3,0(a2)
8000cbe4:	009400a3          	sb	s1,1(s0)
8000cbe8:	00849493          	slli	s1,s1,0x8
8000cbec:	0086d593          	srli	a1,a3,0x8
8000cbf0:	00d40823          	sb	a3,16(s0)
8000cbf4:	00b408a3          	sb	a1,17(s0)
8000cbf8:	0186d513          	srli	a0,a3,0x18
8000cbfc:	0106d593          	srli	a1,a3,0x10
8000cc00:	01069693          	slli	a3,a3,0x10
8000cc04:	0106d693          	srli	a3,a3,0x10
8000cc08:	00b686b3          	add	a3,a3,a1
8000cc0c:	00a409a3          	sb	a0,19(s0)
8000cc10:	0454e493          	ori	s1,s1,69
8000cc14:	04500513          	li	a0,69
8000cc18:	00b40923          	sb	a1,18(s0)
8000cc1c:	00a40023          	sb	a0,0(s0)
8000cc20:	00d484b3          	add	s1,s1,a3
8000cc24:	00879693          	slli	a3,a5,0x8
8000cc28:	4087d793          	srai	a5,a5,0x8
8000cc2c:	00f6e7b3          	or	a5,a3,a5
8000cc30:	00895503          	lhu	a0,8(s2)
8000cc34:	01079793          	slli	a5,a5,0x10
8000cc38:	0107d793          	srli	a5,a5,0x10
8000cc3c:	00f484b3          	add	s1,s1,a5
8000cc40:	a91f90ef          	jal	ra,800066d0 <lwip_htons>
8000cc44:	00855793          	srli	a5,a0,0x8
8000cc48:	00a40123          	sb	a0,2(s0)
8000cc4c:	009504b3          	add	s1,a0,s1
8000cc50:	9181d503          	lhu	a0,-1768(gp) # 80003388 <ip_id>
8000cc54:	00f401a3          	sb	a5,3(s0)
8000cc58:	00040323          	sb	zero,6(s0)
8000cc5c:	000403a3          	sb	zero,7(s0)
8000cc60:	a71f90ef          	jal	ra,800066d0 <lwip_htons>
8000cc64:	00855793          	srli	a5,a0,0x8
8000cc68:	00f402a3          	sb	a5,5(s0)
8000cc6c:	9181d783          	lhu	a5,-1768(gp) # 80003388 <ip_id>
8000cc70:	00a40223          	sb	a0,4(s0)
8000cc74:	00412603          	lw	a2,4(sp)
8000cc78:	00178793          	addi	a5,a5,1
8000cc7c:	90f19c23          	sh	a5,-1768(gp) # 80003388 <ip_id>
8000cc80:	00950533          	add	a0,a0,s1
8000cc84:	08099863          	bnez	s3,8000cd14 <ip4_output_if_src+0x1e4>
8000cc88:	8481a703          	lw	a4,-1976(gp) # 800032b8 <ip_addr_any>
8000cc8c:	01875693          	srli	a3,a4,0x18
8000cc90:	00d407a3          	sb	a3,15(s0)
8000cc94:	000106b7          	lui	a3,0x10
8000cc98:	00875793          	srli	a5,a4,0x8
8000cc9c:	fff68693          	addi	a3,a3,-1 # ffff <_stack_size+0xefff>
8000cca0:	00e40623          	sb	a4,12(s0)
8000cca4:	00f406a3          	sb	a5,13(s0)
8000cca8:	01075793          	srli	a5,a4,0x10
8000ccac:	00d77733          	and	a4,a4,a3
8000ccb0:	00a70733          	add	a4,a4,a0
8000ccb4:	00e78733          	add	a4,a5,a4
8000ccb8:	00f40723          	sb	a5,14(s0)
8000ccbc:	01075793          	srli	a5,a4,0x10
8000ccc0:	00d77733          	and	a4,a4,a3
8000ccc4:	00e78733          	add	a4,a5,a4
8000ccc8:	01075793          	srli	a5,a4,0x10
8000cccc:	00e787b3          	add	a5,a5,a4
8000ccd0:	fff7c793          	not	a5,a5
8000ccd4:	01079793          	slli	a5,a5,0x10
8000ccd8:	0107d793          	srli	a5,a5,0x10
8000ccdc:	00f40523          	sb	a5,10(s0)
8000cce0:	0087d793          	srli	a5,a5,0x8
8000cce4:	00f405a3          	sb	a5,11(s0)
8000cce8:	090aa783          	lw	a5,144(s5)
8000ccec:	00178793          	addi	a5,a5,1
8000ccf0:	08faa823          	sw	a5,144(s5)
8000ccf4:	02ca5783          	lhu	a5,44(s4)
8000ccf8:	06078463          	beqz	a5,8000cd60 <ip4_output_if_src+0x230>
8000ccfc:	00895703          	lhu	a4,8(s2)
8000cd00:	06e7f063          	bgeu	a5,a4,8000cd60 <ip4_output_if_src+0x230>
8000cd04:	000a0593          	mv	a1,s4
8000cd08:	00090513          	mv	a0,s2
8000cd0c:	e54ff0ef          	jal	ra,8000c360 <ip4_frag>
8000cd10:	e91ff06f          	j	8000cba0 <ip4_output_if_src+0x70>
8000cd14:	0009a703          	lw	a4,0(s3)
8000cd18:	f75ff06f          	j	8000cc8c <ip4_output_if_src+0x15c>
8000cd1c:	00a55703          	lhu	a4,10(a0)
8000cd20:	01300793          	li	a5,19
8000cd24:	e6e7f6e3          	bgeu	a5,a4,8000cb90 <ip4_output_if_src+0x60>
8000cd28:	00452683          	lw	a3,4(a0)
8000cd2c:	01c10613          	addi	a2,sp,28
8000cd30:	0116c703          	lbu	a4,17(a3)
8000cd34:	0106c783          	lbu	a5,16(a3)
8000cd38:	00871713          	slli	a4,a4,0x8
8000cd3c:	00f76733          	or	a4,a4,a5
8000cd40:	0126c783          	lbu	a5,18(a3)
8000cd44:	01079793          	slli	a5,a5,0x10
8000cd48:	00e7e733          	or	a4,a5,a4
8000cd4c:	0136c783          	lbu	a5,19(a3)
8000cd50:	01879793          	slli	a5,a5,0x18
8000cd54:	00e7e7b3          	or	a5,a5,a4
8000cd58:	00f12e23          	sw	a5,28(sp)
8000cd5c:	f8dff06f          	j	8000cce8 <ip4_output_if_src+0x1b8>
8000cd60:	014a2783          	lw	a5,20(s4)
8000cd64:	00090593          	mv	a1,s2
8000cd68:	000a0513          	mv	a0,s4
8000cd6c:	000780e7          	jalr	a5
8000cd70:	e31ff06f          	j	8000cba0 <ip4_output_if_src+0x70>

8000cd74 <ip4_output_if>:
8000cd74:	00060a63          	beqz	a2,8000cd88 <ip4_output_if+0x14>
8000cd78:	00058663          	beqz	a1,8000cd84 <ip4_output_if+0x10>
8000cd7c:	0005a883          	lw	a7,0(a1)
8000cd80:	00089463          	bnez	a7,8000cd88 <ip4_output_if+0x14>
8000cd84:	00480593          	addi	a1,a6,4
8000cd88:	da9ff06f          	j	8000cb30 <ip4_output_if_src>

8000cd8c <ip4_output>:
8000cd8c:	fd010113          	addi	sp,sp,-48
8000cd90:	02812423          	sw	s0,40(sp)
8000cd94:	00050413          	mv	s0,a0
8000cd98:	00060513          	mv	a0,a2
8000cd9c:	00b12e23          	sw	a1,28(sp)
8000cda0:	00d12c23          	sw	a3,24(sp)
8000cda4:	00e12a23          	sw	a4,20(sp)
8000cda8:	00f12823          	sw	a5,16(sp)
8000cdac:	00c12623          	sw	a2,12(sp)
8000cdb0:	02112623          	sw	ra,44(sp)
8000cdb4:	929ff0ef          	jal	ra,8000c6dc <ip4_route>
8000cdb8:	00c12603          	lw	a2,12(sp)
8000cdbc:	01012783          	lw	a5,16(sp)
8000cdc0:	01412703          	lw	a4,20(sp)
8000cdc4:	01812683          	lw	a3,24(sp)
8000cdc8:	01c12583          	lw	a1,28(sp)
8000cdcc:	00050e63          	beqz	a0,8000cde8 <ip4_output+0x5c>
8000cdd0:	00050813          	mv	a6,a0
8000cdd4:	00040513          	mv	a0,s0
8000cdd8:	02812403          	lw	s0,40(sp)
8000cddc:	02c12083          	lw	ra,44(sp)
8000cde0:	03010113          	addi	sp,sp,48
8000cde4:	f91ff06f          	j	8000cd74 <ip4_output_if>
8000cde8:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000cdec:	0ac7a703          	lw	a4,172(a5)
8000cdf0:	ffc00513          	li	a0,-4
8000cdf4:	00170713          	addi	a4,a4,1
8000cdf8:	0ae7a623          	sw	a4,172(a5)
8000cdfc:	02c12083          	lw	ra,44(sp)
8000ce00:	02812403          	lw	s0,40(sp)
8000ce04:	03010113          	addi	sp,sp,48
8000ce08:	00008067          	ret

8000ce0c <ip4_output_hinted>:
8000ce0c:	fd010113          	addi	sp,sp,-48
8000ce10:	02912223          	sw	s1,36(sp)
8000ce14:	00050493          	mv	s1,a0
8000ce18:	00060513          	mv	a0,a2
8000ce1c:	00b12e23          	sw	a1,28(sp)
8000ce20:	00d12c23          	sw	a3,24(sp)
8000ce24:	00e12a23          	sw	a4,20(sp)
8000ce28:	00f12823          	sw	a5,16(sp)
8000ce2c:	01012623          	sw	a6,12(sp)
8000ce30:	00c12423          	sw	a2,8(sp)
8000ce34:	02112623          	sw	ra,44(sp)
8000ce38:	02812423          	sw	s0,40(sp)
8000ce3c:	8a1ff0ef          	jal	ra,8000c6dc <ip4_route>
8000ce40:	00812603          	lw	a2,8(sp)
8000ce44:	00c12803          	lw	a6,12(sp)
8000ce48:	01012783          	lw	a5,16(sp)
8000ce4c:	01412703          	lw	a4,20(sp)
8000ce50:	01812683          	lw	a3,24(sp)
8000ce54:	01c12583          	lw	a1,28(sp)
8000ce58:	02051663          	bnez	a0,8000ce84 <ip4_output_hinted+0x78>
8000ce5c:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000ce60:	0ac7a703          	lw	a4,172(a5)
8000ce64:	ffc00513          	li	a0,-4
8000ce68:	00170713          	addi	a4,a4,1
8000ce6c:	0ae7a623          	sw	a4,172(a5)
8000ce70:	02c12083          	lw	ra,44(sp)
8000ce74:	02812403          	lw	s0,40(sp)
8000ce78:	02412483          	lw	s1,36(sp)
8000ce7c:	03010113          	addi	sp,sp,48
8000ce80:	00008067          	ret
8000ce84:	03052e23          	sw	a6,60(a0)
8000ce88:	00050413          	mv	s0,a0
8000ce8c:	00050813          	mv	a6,a0
8000ce90:	00048513          	mv	a0,s1
8000ce94:	ee1ff0ef          	jal	ra,8000cd74 <ip4_output_if>
8000ce98:	02042e23          	sw	zero,60(s0)
8000ce9c:	fd5ff06f          	j	8000ce70 <ip4_output_hinted+0x64>

8000cea0 <ip4_addr_isbroadcast_u32>:
8000cea0:	fff50693          	addi	a3,a0,-1
8000cea4:	ffd00793          	li	a5,-3
8000cea8:	00050713          	mv	a4,a0
8000ceac:	04d7e063          	bltu	a5,a3,8000ceec <ip4_addr_isbroadcast_u32+0x4c>
8000ceb0:	0355c783          	lbu	a5,53(a1)
8000ceb4:	0027f513          	andi	a0,a5,2
8000ceb8:	02050c63          	beqz	a0,8000cef0 <ip4_addr_isbroadcast_u32+0x50>
8000cebc:	0045a783          	lw	a5,4(a1)
8000cec0:	00000513          	li	a0,0
8000cec4:	02e78663          	beq	a5,a4,8000cef0 <ip4_addr_isbroadcast_u32+0x50>
8000cec8:	0085a683          	lw	a3,8(a1)
8000cecc:	00e7c7b3          	xor	a5,a5,a4
8000ced0:	00d7f7b3          	and	a5,a5,a3
8000ced4:	00079e63          	bnez	a5,8000cef0 <ip4_addr_isbroadcast_u32+0x50>
8000ced8:	fff6c693          	not	a3,a3
8000cedc:	00e6f533          	and	a0,a3,a4
8000cee0:	40d50533          	sub	a0,a0,a3
8000cee4:	00153513          	seqz	a0,a0
8000cee8:	00008067          	ret
8000ceec:	00100513          	li	a0,1
8000cef0:	00008067          	ret

8000cef4 <ip4_addr_netmask_valid>:
8000cef4:	ff010113          	addi	sp,sp,-16
8000cef8:	00112623          	sw	ra,12(sp)
8000cefc:	fecf90ef          	jal	ra,800066e8 <lwip_htonl>
8000cf00:	02000713          	li	a4,32
8000cf04:	800007b7          	lui	a5,0x80000
8000cf08:	00f576b3          	and	a3,a0,a5
8000cf0c:	02068663          	beqz	a3,8000cf38 <ip4_addr_netmask_valid+0x44>
8000cf10:	fff70713          	addi	a4,a4,-1
8000cf14:	0017d793          	srli	a5,a5,0x1
8000cf18:	fe0718e3          	bnez	a4,8000cf08 <ip4_addr_netmask_valid+0x14>
8000cf1c:	00100513          	li	a0,1
8000cf20:	00c12083          	lw	ra,12(sp)
8000cf24:	01010113          	addi	sp,sp,16
8000cf28:	00008067          	ret
8000cf2c:	00a7f733          	and	a4,a5,a0
8000cf30:	00071863          	bnez	a4,8000cf40 <ip4_addr_netmask_valid+0x4c>
8000cf34:	0017d793          	srli	a5,a5,0x1
8000cf38:	fe079ae3          	bnez	a5,8000cf2c <ip4_addr_netmask_valid+0x38>
8000cf3c:	fe1ff06f          	j	8000cf1c <ip4_addr_netmask_valid+0x28>
8000cf40:	00000513          	li	a0,0
8000cf44:	fddff06f          	j	8000cf20 <ip4_addr_netmask_valid+0x2c>

8000cf48 <ip4addr_aton>:
8000cf48:	fb010113          	addi	sp,sp,-80
8000cf4c:	04812423          	sw	s0,72(sp)
8000cf50:	05212023          	sw	s2,64(sp)
8000cf54:	03312e23          	sw	s3,60(sp)
8000cf58:	03512a23          	sw	s5,52(sp)
8000cf5c:	03712623          	sw	s7,44(sp)
8000cf60:	03812423          	sw	s8,40(sp)
8000cf64:	03912223          	sw	s9,36(sp)
8000cf68:	03a12023          	sw	s10,32(sp)
8000cf6c:	01b12e23          	sw	s11,28(sp)
8000cf70:	04112623          	sw	ra,76(sp)
8000cf74:	04912223          	sw	s1,68(sp)
8000cf78:	03412c23          	sw	s4,56(sp)
8000cf7c:	03612823          	sw	s6,48(sp)
8000cf80:	00054483          	lbu	s1,0(a0)
8000cf84:	00010913          	mv	s2,sp
8000cf88:	80003ab7          	lui	s5,0x80003
8000cf8c:	00058993          	mv	s3,a1
8000cf90:	00090b93          	mv	s7,s2
8000cf94:	f41a8a93          	addi	s5,s5,-191 # 80002f41 <_ram_heap_end+0xfffeaf41>
8000cf98:	03000413          	li	s0,48
8000cf9c:	05800c13          	li	s8,88
8000cfa0:	01000c93          	li	s9,16
8000cfa4:	00200d13          	li	s10,2
8000cfa8:	02e00d93          	li	s11,46
8000cfac:	00c10713          	addi	a4,sp,12
8000cfb0:	015487b3          	add	a5,s1,s5
8000cfb4:	0007c783          	lbu	a5,0(a5) # 80000000 <_ram_heap_end+0xfffe8000>
8000cfb8:	0047f793          	andi	a5,a5,4
8000cfbc:	1c078a63          	beqz	a5,8000d190 <ip4addr_aton+0x248>
8000cfc0:	00a00b13          	li	s6,10
8000cfc4:	00849c63          	bne	s1,s0,8000cfdc <ip4addr_aton+0x94>
8000cfc8:	00154483          	lbu	s1,1(a0)
8000cfcc:	0df4f793          	andi	a5,s1,223
8000cfd0:	05878463          	beq	a5,s8,8000d018 <ip4addr_aton+0xd0>
8000cfd4:	00150513          	addi	a0,a0,1
8000cfd8:	00800b13          	li	s6,8
8000cfdc:	00050a13          	mv	s4,a0
8000cfe0:	00000513          	li	a0,0
8000cfe4:	009a87b3          	add	a5,s5,s1
8000cfe8:	0007c783          	lbu	a5,0(a5)
8000cfec:	0047f693          	andi	a3,a5,4
8000cff0:	02068c63          	beqz	a3,8000d028 <ip4addr_aton+0xe0>
8000cff4:	00050593          	mv	a1,a0
8000cff8:	000b0513          	mv	a0,s6
8000cffc:	441000ef          	jal	ra,8000dc3c <__mulsi3>
8000d000:	00950533          	add	a0,a0,s1
8000d004:	001a4483          	lbu	s1,1(s4)
8000d008:	fd050513          	addi	a0,a0,-48
8000d00c:	00c10713          	addi	a4,sp,12
8000d010:	001a0a13          	addi	s4,s4,1
8000d014:	fd1ff06f          	j	8000cfe4 <ip4addr_aton+0x9c>
8000d018:	00254483          	lbu	s1,2(a0)
8000d01c:	01000b13          	li	s6,16
8000d020:	00250513          	addi	a0,a0,2
8000d024:	fb9ff06f          	j	8000cfdc <ip4addr_aton+0x94>
8000d028:	039b1a63          	bne	s6,s9,8000d05c <ip4addr_aton+0x114>
8000d02c:	0447f693          	andi	a3,a5,68
8000d030:	02068663          	beqz	a3,8000d05c <ip4addr_aton+0x114>
8000d034:	0037f793          	andi	a5,a5,3
8000d038:	00451513          	slli	a0,a0,0x4
8000d03c:	00a48493          	addi	s1,s1,10
8000d040:	06100593          	li	a1,97
8000d044:	01a78463          	beq	a5,s10,8000d04c <ip4addr_aton+0x104>
8000d048:	04100593          	li	a1,65
8000d04c:	40b484b3          	sub	s1,s1,a1
8000d050:	00a4e533          	or	a0,s1,a0
8000d054:	001a4483          	lbu	s1,1(s4)
8000d058:	fb9ff06f          	j	8000d010 <ip4addr_aton+0xc8>
8000d05c:	01b49e63          	bne	s1,s11,8000d078 <ip4addr_aton+0x130>
8000d060:	12e90863          	beq	s2,a4,8000d190 <ip4addr_aton+0x248>
8000d064:	00490913          	addi	s2,s2,4
8000d068:	fea92e23          	sw	a0,-4(s2)
8000d06c:	001a4483          	lbu	s1,1(s4)
8000d070:	001a0513          	addi	a0,s4,1
8000d074:	f3dff06f          	j	8000cfb0 <ip4addr_aton+0x68>
8000d078:	00048863          	beqz	s1,8000d088 <ip4addr_aton+0x140>
8000d07c:	0087f793          	andi	a5,a5,8
8000d080:	00000413          	li	s0,0
8000d084:	02078863          	beqz	a5,8000d0b4 <ip4addr_aton+0x16c>
8000d088:	41790433          	sub	s0,s2,s7
8000d08c:	40245413          	srai	s0,s0,0x2
8000d090:	00140413          	addi	s0,s0,1
8000d094:	00200793          	li	a5,2
8000d098:	0af40263          	beq	s0,a5,8000d13c <ip4addr_aton+0x1f4>
8000d09c:	0487cc63          	blt	a5,s0,8000d0f4 <ip4addr_aton+0x1ac>
8000d0a0:	00040a63          	beqz	s0,8000d0b4 <ip4addr_aton+0x16c>
8000d0a4:	00100413          	li	s0,1
8000d0a8:	00098663          	beqz	s3,8000d0b4 <ip4addr_aton+0x16c>
8000d0ac:	e3cf90ef          	jal	ra,800066e8 <lwip_htonl>
8000d0b0:	00a9a023          	sw	a0,0(s3)
8000d0b4:	00040513          	mv	a0,s0
8000d0b8:	04c12083          	lw	ra,76(sp)
8000d0bc:	04812403          	lw	s0,72(sp)
8000d0c0:	04412483          	lw	s1,68(sp)
8000d0c4:	04012903          	lw	s2,64(sp)
8000d0c8:	03c12983          	lw	s3,60(sp)
8000d0cc:	03812a03          	lw	s4,56(sp)
8000d0d0:	03412a83          	lw	s5,52(sp)
8000d0d4:	03012b03          	lw	s6,48(sp)
8000d0d8:	02c12b83          	lw	s7,44(sp)
8000d0dc:	02812c03          	lw	s8,40(sp)
8000d0e0:	02412c83          	lw	s9,36(sp)
8000d0e4:	02012d03          	lw	s10,32(sp)
8000d0e8:	01c12d83          	lw	s11,28(sp)
8000d0ec:	05010113          	addi	sp,sp,80
8000d0f0:	00008067          	ret
8000d0f4:	00300793          	li	a5,3
8000d0f8:	06f40463          	beq	s0,a5,8000d160 <ip4addr_aton+0x218>
8000d0fc:	00400793          	li	a5,4
8000d100:	faf412e3          	bne	s0,a5,8000d0a4 <ip4addr_aton+0x15c>
8000d104:	0ff00613          	li	a2,255
8000d108:	00000413          	li	s0,0
8000d10c:	faa664e3          	bltu	a2,a0,8000d0b4 <ip4addr_aton+0x16c>
8000d110:	00012783          	lw	a5,0(sp)
8000d114:	faf660e3          	bltu	a2,a5,8000d0b4 <ip4addr_aton+0x16c>
8000d118:	00412683          	lw	a3,4(sp)
8000d11c:	f8d66ce3          	bltu	a2,a3,8000d0b4 <ip4addr_aton+0x16c>
8000d120:	00812703          	lw	a4,8(sp)
8000d124:	f8e668e3          	bltu	a2,a4,8000d0b4 <ip4addr_aton+0x16c>
8000d128:	01879793          	slli	a5,a5,0x18
8000d12c:	01069693          	slli	a3,a3,0x10
8000d130:	00d7e7b3          	or	a5,a5,a3
8000d134:	00871713          	slli	a4,a4,0x8
8000d138:	0500006f          	j	8000d188 <ip4addr_aton+0x240>
8000d13c:	010007b7          	lui	a5,0x1000
8000d140:	00000413          	li	s0,0
8000d144:	f6f578e3          	bgeu	a0,a5,8000d0b4 <ip4addr_aton+0x16c>
8000d148:	00012783          	lw	a5,0(sp)
8000d14c:	0ff00713          	li	a4,255
8000d150:	f6f762e3          	bltu	a4,a5,8000d0b4 <ip4addr_aton+0x16c>
8000d154:	01879793          	slli	a5,a5,0x18
8000d158:	00f56533          	or	a0,a0,a5
8000d15c:	f49ff06f          	j	8000d0a4 <ip4addr_aton+0x15c>
8000d160:	000107b7          	lui	a5,0x10
8000d164:	00000413          	li	s0,0
8000d168:	f4f576e3          	bgeu	a0,a5,8000d0b4 <ip4addr_aton+0x16c>
8000d16c:	00012783          	lw	a5,0(sp)
8000d170:	0ff00693          	li	a3,255
8000d174:	f4f6e0e3          	bltu	a3,a5,8000d0b4 <ip4addr_aton+0x16c>
8000d178:	00412703          	lw	a4,4(sp)
8000d17c:	f2e6ece3          	bltu	a3,a4,8000d0b4 <ip4addr_aton+0x16c>
8000d180:	01879793          	slli	a5,a5,0x18
8000d184:	01071713          	slli	a4,a4,0x10
8000d188:	00e7e7b3          	or	a5,a5,a4
8000d18c:	fcdff06f          	j	8000d158 <ip4addr_aton+0x210>
8000d190:	00000413          	li	s0,0
8000d194:	f21ff06f          	j	8000d0b4 <ip4addr_aton+0x16c>

8000d198 <ipaddr_addr>:
8000d198:	fe010113          	addi	sp,sp,-32
8000d19c:	00c10593          	addi	a1,sp,12
8000d1a0:	00112e23          	sw	ra,28(sp)
8000d1a4:	da5ff0ef          	jal	ra,8000cf48 <ip4addr_aton>
8000d1a8:	00050a63          	beqz	a0,8000d1bc <ipaddr_addr+0x24>
8000d1ac:	00c12503          	lw	a0,12(sp)
8000d1b0:	01c12083          	lw	ra,28(sp)
8000d1b4:	02010113          	addi	sp,sp,32
8000d1b8:	00008067          	ret
8000d1bc:	fff00513          	li	a0,-1
8000d1c0:	ff1ff06f          	j	8000d1b0 <ipaddr_addr+0x18>

8000d1c4 <ip4addr_ntoa_r>:
8000d1c4:	fb010113          	addi	sp,sp,-80
8000d1c8:	04912223          	sw	s1,68(sp)
8000d1cc:	05212023          	sw	s2,64(sp)
8000d1d0:	03312e23          	sw	s3,60(sp)
8000d1d4:	03612823          	sw	s6,48(sp)
8000d1d8:	03812423          	sw	s8,40(sp)
8000d1dc:	03912223          	sw	s9,36(sp)
8000d1e0:	03a12023          	sw	s10,32(sp)
8000d1e4:	04112623          	sw	ra,76(sp)
8000d1e8:	04812423          	sw	s0,72(sp)
8000d1ec:	03412c23          	sw	s4,56(sp)
8000d1f0:	03512a23          	sw	s5,52(sp)
8000d1f4:	03712623          	sw	s7,44(sp)
8000d1f8:	00052783          	lw	a5,0(a0)
8000d1fc:	00058493          	mv	s1,a1
8000d200:	00058b13          	mv	s6,a1
8000d204:	00f12e23          	sw	a5,28(sp)
8000d208:	00000993          	li	s3,0
8000d20c:	01c10913          	addi	s2,sp,28
8000d210:	00900c93          	li	s9,9
8000d214:	0ff00d13          	li	s10,255
8000d218:	02e00c13          	li	s8,46
8000d21c:	00094a03          	lbu	s4,0(s2)
8000d220:	00000413          	li	s0,0
8000d224:	00a00593          	li	a1,10
8000d228:	000a0513          	mv	a0,s4
8000d22c:	00c12623          	sw	a2,12(sp)
8000d230:	239000ef          	jal	ra,8000dc68 <__udivsi3>
8000d234:	0ff57b93          	andi	s7,a0,255
8000d238:	00a00593          	li	a1,10
8000d23c:	000a0513          	mv	a0,s4
8000d240:	271000ef          	jal	ra,8000dcb0 <__umodsi3>
8000d244:	02010793          	addi	a5,sp,32
8000d248:	03050513          	addi	a0,a0,48
8000d24c:	008787b3          	add	a5,a5,s0
8000d250:	00140a93          	addi	s5,s0,1
8000d254:	fea78c23          	sb	a0,-8(a5) # fff8 <_stack_size+0xeff8>
8000d258:	0ffafa93          	andi	s5,s5,255
8000d25c:	00c12603          	lw	a2,12(sp)
8000d260:	074ce863          	bltu	s9,s4,8000d2d0 <ip4addr_ntoa_r+0x10c>
8000d264:	01790023          	sb	s7,0(s2)
8000d268:	00098713          	mv	a4,s3
8000d26c:	000b0793          	mv	a5,s6
8000d270:	00198993          	addi	s3,s3,1
8000d274:	07a41463          	bne	s0,s10,8000d2dc <ip4addr_ntoa_r+0x118>
8000d278:	08c75863          	bge	a4,a2,8000d308 <ip4addr_ntoa_r+0x144>
8000d27c:	01878023          	sb	s8,0(a5)
8000d280:	00190913          	addi	s2,s2,1
8000d284:	02010713          	addi	a4,sp,32
8000d288:	00178b13          	addi	s6,a5,1
8000d28c:	f8e918e3          	bne	s2,a4,8000d21c <ip4addr_ntoa_r+0x58>
8000d290:	00078023          	sb	zero,0(a5)
8000d294:	00048513          	mv	a0,s1
8000d298:	04c12083          	lw	ra,76(sp)
8000d29c:	04812403          	lw	s0,72(sp)
8000d2a0:	04412483          	lw	s1,68(sp)
8000d2a4:	04012903          	lw	s2,64(sp)
8000d2a8:	03c12983          	lw	s3,60(sp)
8000d2ac:	03812a03          	lw	s4,56(sp)
8000d2b0:	03412a83          	lw	s5,52(sp)
8000d2b4:	03012b03          	lw	s6,48(sp)
8000d2b8:	02c12b83          	lw	s7,44(sp)
8000d2bc:	02812c03          	lw	s8,40(sp)
8000d2c0:	02412c83          	lw	s9,36(sp)
8000d2c4:	02012d03          	lw	s10,32(sp)
8000d2c8:	05010113          	addi	sp,sp,80
8000d2cc:	00008067          	ret
8000d2d0:	000b8a13          	mv	s4,s7
8000d2d4:	000a8413          	mv	s0,s5
8000d2d8:	f4dff06f          	j	8000d224 <ip4addr_ntoa_r+0x60>
8000d2dc:	fff40693          	addi	a3,s0,-1
8000d2e0:	0ff6f693          	andi	a3,a3,255
8000d2e4:	02c75263          	bge	a4,a2,8000d308 <ip4addr_ntoa_r+0x144>
8000d2e8:	02010713          	addi	a4,sp,32
8000d2ec:	00870433          	add	s0,a4,s0
8000d2f0:	ff844703          	lbu	a4,-8(s0)
8000d2f4:	00178793          	addi	a5,a5,1
8000d2f8:	00068413          	mv	s0,a3
8000d2fc:	fee78fa3          	sb	a4,-1(a5)
8000d300:	00098713          	mv	a4,s3
8000d304:	f6dff06f          	j	8000d270 <ip4addr_ntoa_r+0xac>
8000d308:	00000513          	li	a0,0
8000d30c:	f8dff06f          	j	8000d298 <ip4addr_ntoa_r+0xd4>

8000d310 <ip4addr_ntoa>:
8000d310:	01000613          	li	a2,16
8000d314:	c5c18593          	addi	a1,gp,-932 # 800036cc <str.4107>
8000d318:	eadff06f          	j	8000d1c4 <ip4addr_ntoa_r>

8000d31c <ethernet_input>:
8000d31c:	ff010113          	addi	sp,sp,-16
8000d320:	00812423          	sw	s0,8(sp)
8000d324:	00112623          	sw	ra,12(sp)
8000d328:	00912223          	sw	s1,4(sp)
8000d32c:	01212023          	sw	s2,0(sp)
8000d330:	00a55703          	lhu	a4,10(a0)
8000d334:	01000793          	li	a5,16
8000d338:	00050413          	mv	s0,a0
8000d33c:	00e7ec63          	bltu	a5,a4,8000d354 <ethernet_input+0x38>
8000d340:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000d344:	0507a703          	lw	a4,80(a5)
8000d348:	00170713          	addi	a4,a4,1
8000d34c:	04e7a823          	sw	a4,80(a5)
8000d350:	0a00006f          	j	8000d3f0 <ethernet_input+0xd4>
8000d354:	00f54783          	lbu	a5,15(a0)
8000d358:	00058913          	mv	s2,a1
8000d35c:	00079863          	bnez	a5,8000d36c <ethernet_input+0x50>
8000d360:	0385c783          	lbu	a5,56(a1)
8000d364:	00178793          	addi	a5,a5,1
8000d368:	00f507a3          	sb	a5,15(a0)
8000d36c:	00442503          	lw	a0,4(s0)
8000d370:	00f54483          	lbu	s1,15(a0)
8000d374:	00e54783          	lbu	a5,14(a0)
8000d378:	00849493          	slli	s1,s1,0x8
8000d37c:	00f4e4b3          	or	s1,s1,a5
8000d380:	00254783          	lbu	a5,2(a0)
8000d384:	0017f713          	andi	a4,a5,1
8000d388:	02070663          	beqz	a4,8000d3b4 <ethernet_input+0x98>
8000d38c:	00100713          	li	a4,1
8000d390:	06e79c63          	bne	a5,a4,8000d408 <ethernet_input+0xec>
8000d394:	00354783          	lbu	a5,3(a0)
8000d398:	00079e63          	bnez	a5,8000d3b4 <ethernet_input+0x98>
8000d39c:	00454703          	lbu	a4,4(a0)
8000d3a0:	05e00793          	li	a5,94
8000d3a4:	00f71863          	bne	a4,a5,8000d3b4 <ethernet_input+0x98>
8000d3a8:	00d44783          	lbu	a5,13(s0)
8000d3ac:	0107e793          	ori	a5,a5,16
8000d3b0:	00f406a3          	sb	a5,13(s0)
8000d3b4:	00800793          	li	a5,8
8000d3b8:	06f48863          	beq	s1,a5,8000d428 <ethernet_input+0x10c>
8000d3bc:	60800793          	li	a5,1544
8000d3c0:	f8f490e3          	bne	s1,a5,8000d340 <ethernet_input+0x24>
8000d3c4:	03594783          	lbu	a5,53(s2)
8000d3c8:	0087f793          	andi	a5,a5,8
8000d3cc:	02078863          	beqz	a5,8000d3fc <ethernet_input+0xe0>
8000d3d0:	01000593          	li	a1,16
8000d3d4:	00040513          	mv	a0,s0
8000d3d8:	c94fa0ef          	jal	ra,8000786c <pbuf_remove_header>
8000d3dc:	08050863          	beqz	a0,8000d46c <ethernet_input+0x150>
8000d3e0:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000d3e4:	0447a703          	lw	a4,68(a5)
8000d3e8:	00170713          	addi	a4,a4,1
8000d3ec:	04e7a223          	sw	a4,68(a5)
8000d3f0:	03c7a703          	lw	a4,60(a5)
8000d3f4:	00170713          	addi	a4,a4,1
8000d3f8:	02e7ae23          	sw	a4,60(a5)
8000d3fc:	00040513          	mv	a0,s0
8000d400:	cf4fa0ef          	jal	ra,800078f4 <pbuf_free>
8000d404:	04c0006f          	j	8000d450 <ethernet_input+0x134>
8000d408:	00600613          	li	a2,6
8000d40c:	85418593          	addi	a1,gp,-1964 # 800032c4 <ethbroadcast>
8000d410:	00250513          	addi	a0,a0,2
8000d414:	6c4010ef          	jal	ra,8000ead8 <memcmp>
8000d418:	f8051ee3          	bnez	a0,8000d3b4 <ethernet_input+0x98>
8000d41c:	00d44783          	lbu	a5,13(s0)
8000d420:	0087e793          	ori	a5,a5,8
8000d424:	f8dff06f          	j	8000d3b0 <ethernet_input+0x94>
8000d428:	03594783          	lbu	a5,53(s2)
8000d42c:	0087f793          	andi	a5,a5,8
8000d430:	fc0786e3          	beqz	a5,8000d3fc <ethernet_input+0xe0>
8000d434:	01000593          	li	a1,16
8000d438:	00040513          	mv	a0,s0
8000d43c:	c30fa0ef          	jal	ra,8000786c <pbuf_remove_header>
8000d440:	fa051ee3          	bnez	a0,8000d3fc <ethernet_input+0xe0>
8000d444:	00090593          	mv	a1,s2
8000d448:	00040513          	mv	a0,s0
8000d44c:	b30ff0ef          	jal	ra,8000c77c <ip4_input>
8000d450:	00c12083          	lw	ra,12(sp)
8000d454:	00812403          	lw	s0,8(sp)
8000d458:	00412483          	lw	s1,4(sp)
8000d45c:	00012903          	lw	s2,0(sp)
8000d460:	00000513          	li	a0,0
8000d464:	01010113          	addi	sp,sp,16
8000d468:	00008067          	ret
8000d46c:	00090593          	mv	a1,s2
8000d470:	00040513          	mv	a0,s0
8000d474:	ad8fe0ef          	jal	ra,8000b74c <etharp_input>
8000d478:	fd9ff06f          	j	8000d450 <ethernet_input+0x134>

8000d47c <ethernet_output>:
8000d47c:	fd010113          	addi	sp,sp,-48
8000d480:	01312e23          	sw	s3,28(sp)
8000d484:	00050993          	mv	s3,a0
8000d488:	00070513          	mv	a0,a4
8000d48c:	00d12623          	sw	a3,12(sp)
8000d490:	02112623          	sw	ra,44(sp)
8000d494:	02912223          	sw	s1,36(sp)
8000d498:	03212023          	sw	s2,32(sp)
8000d49c:	01412c23          	sw	s4,24(sp)
8000d4a0:	00058913          	mv	s2,a1
8000d4a4:	00060a13          	mv	s4,a2
8000d4a8:	02812423          	sw	s0,40(sp)
8000d4ac:	a24f90ef          	jal	ra,800066d0 <lwip_htons>
8000d4b0:	00050493          	mv	s1,a0
8000d4b4:	01000593          	li	a1,16
8000d4b8:	00090513          	mv	a0,s2
8000d4bc:	ba0fa0ef          	jal	ra,8000785c <pbuf_add_header>
8000d4c0:	00c12683          	lw	a3,12(sp)
8000d4c4:	06051063          	bnez	a0,8000d524 <ethernet_output+0xa8>
8000d4c8:	00492403          	lw	s0,4(s2)
8000d4cc:	00068593          	mv	a1,a3
8000d4d0:	00600613          	li	a2,6
8000d4d4:	00940723          	sb	s1,14(s0)
8000d4d8:	0084d493          	srli	s1,s1,0x8
8000d4dc:	009407a3          	sb	s1,15(s0)
8000d4e0:	00240513          	addi	a0,s0,2
8000d4e4:	624010ef          	jal	ra,8000eb08 <memcpy>
8000d4e8:	000a0593          	mv	a1,s4
8000d4ec:	00840513          	addi	a0,s0,8
8000d4f0:	00600613          	li	a2,6
8000d4f4:	614010ef          	jal	ra,8000eb08 <memcpy>
8000d4f8:	02812403          	lw	s0,40(sp)
8000d4fc:	0189a303          	lw	t1,24(s3)
8000d500:	02c12083          	lw	ra,44(sp)
8000d504:	02412483          	lw	s1,36(sp)
8000d508:	01812a03          	lw	s4,24(sp)
8000d50c:	00090593          	mv	a1,s2
8000d510:	00098513          	mv	a0,s3
8000d514:	02012903          	lw	s2,32(sp)
8000d518:	01c12983          	lw	s3,28(sp)
8000d51c:	03010113          	addi	sp,sp,48
8000d520:	00030067          	jr	t1
8000d524:	a2c18793          	addi	a5,gp,-1492 # 8000349c <lwip_stats>
8000d528:	0147a703          	lw	a4,20(a5)
8000d52c:	ffe00513          	li	a0,-2
8000d530:	00170713          	addi	a4,a4,1
8000d534:	00e7aa23          	sw	a4,20(a5)
8000d538:	02c12083          	lw	ra,44(sp)
8000d53c:	02812403          	lw	s0,40(sp)
8000d540:	02412483          	lw	s1,36(sp)
8000d544:	02012903          	lw	s2,32(sp)
8000d548:	01c12983          	lw	s3,28(sp)
8000d54c:	01812a03          	lw	s4,24(sp)
8000d550:	03010113          	addi	sp,sp,48
8000d554:	00008067          	ret

8000d558 <memset>:
8000d558:	00f00313          	li	t1,15
8000d55c:	00050713          	mv	a4,a0
8000d560:	02c37e63          	bgeu	t1,a2,8000d59c <memset+0x44>
8000d564:	00f77793          	andi	a5,a4,15
8000d568:	0a079063          	bnez	a5,8000d608 <memset+0xb0>
8000d56c:	08059263          	bnez	a1,8000d5f0 <memset+0x98>
8000d570:	ff067693          	andi	a3,a2,-16
8000d574:	00f67613          	andi	a2,a2,15
8000d578:	00e686b3          	add	a3,a3,a4
8000d57c:	00b72023          	sw	a1,0(a4)
8000d580:	00b72223          	sw	a1,4(a4)
8000d584:	00b72423          	sw	a1,8(a4)
8000d588:	00b72623          	sw	a1,12(a4)
8000d58c:	01070713          	addi	a4,a4,16
8000d590:	fed766e3          	bltu	a4,a3,8000d57c <memset+0x24>
8000d594:	00061463          	bnez	a2,8000d59c <memset+0x44>
8000d598:	00008067          	ret
8000d59c:	40c306b3          	sub	a3,t1,a2
8000d5a0:	00269693          	slli	a3,a3,0x2
8000d5a4:	00000297          	auipc	t0,0x0
8000d5a8:	005686b3          	add	a3,a3,t0
8000d5ac:	00c68067          	jr	12(a3)
8000d5b0:	00b70723          	sb	a1,14(a4)
8000d5b4:	00b706a3          	sb	a1,13(a4)
8000d5b8:	00b70623          	sb	a1,12(a4)
8000d5bc:	00b705a3          	sb	a1,11(a4)
8000d5c0:	00b70523          	sb	a1,10(a4)
8000d5c4:	00b704a3          	sb	a1,9(a4)
8000d5c8:	00b70423          	sb	a1,8(a4)
8000d5cc:	00b703a3          	sb	a1,7(a4)
8000d5d0:	00b70323          	sb	a1,6(a4)
8000d5d4:	00b702a3          	sb	a1,5(a4)
8000d5d8:	00b70223          	sb	a1,4(a4)
8000d5dc:	00b701a3          	sb	a1,3(a4)
8000d5e0:	00b70123          	sb	a1,2(a4)
8000d5e4:	00b700a3          	sb	a1,1(a4)
8000d5e8:	00b70023          	sb	a1,0(a4)
8000d5ec:	00008067          	ret
8000d5f0:	0ff5f593          	andi	a1,a1,255
8000d5f4:	00859693          	slli	a3,a1,0x8
8000d5f8:	00d5e5b3          	or	a1,a1,a3
8000d5fc:	01059693          	slli	a3,a1,0x10
8000d600:	00d5e5b3          	or	a1,a1,a3
8000d604:	f6dff06f          	j	8000d570 <memset+0x18>
8000d608:	00279693          	slli	a3,a5,0x2
8000d60c:	00000297          	auipc	t0,0x0
8000d610:	005686b3          	add	a3,a3,t0
8000d614:	00008293          	mv	t0,ra
8000d618:	fa0680e7          	jalr	-96(a3)
8000d61c:	00028093          	mv	ra,t0
8000d620:	ff078793          	addi	a5,a5,-16
8000d624:	40f70733          	sub	a4,a4,a5
8000d628:	00f60633          	add	a2,a2,a5
8000d62c:	f6c378e3          	bgeu	t1,a2,8000d59c <memset+0x44>
8000d630:	f3dff06f          	j	8000d56c <memset+0x14>

8000d634 <__bswapsi2>:
8000d634:	01851713          	slli	a4,a0,0x18
8000d638:	01855793          	srli	a5,a0,0x18
8000d63c:	000106b7          	lui	a3,0x10
8000d640:	00e7e7b3          	or	a5,a5,a4
8000d644:	f0068693          	addi	a3,a3,-256 # ff00 <_stack_size+0xef00>
8000d648:	40855713          	srai	a4,a0,0x8
8000d64c:	00d77733          	and	a4,a4,a3
8000d650:	00e7e7b3          	or	a5,a5,a4
8000d654:	00851513          	slli	a0,a0,0x8
8000d658:	00ff0737          	lui	a4,0xff0
8000d65c:	00e57533          	and	a0,a0,a4
8000d660:	00a7e533          	or	a0,a5,a0
8000d664:	00008067          	ret

8000d668 <__udivdi3>:
8000d668:	fd010113          	addi	sp,sp,-48
8000d66c:	02912223          	sw	s1,36(sp)
8000d670:	01612823          	sw	s6,16(sp)
8000d674:	02112623          	sw	ra,44(sp)
8000d678:	02812423          	sw	s0,40(sp)
8000d67c:	03212023          	sw	s2,32(sp)
8000d680:	01312e23          	sw	s3,28(sp)
8000d684:	01412c23          	sw	s4,24(sp)
8000d688:	01512a23          	sw	s5,20(sp)
8000d68c:	01712623          	sw	s7,12(sp)
8000d690:	01812423          	sw	s8,8(sp)
8000d694:	01912223          	sw	s9,4(sp)
8000d698:	00050b13          	mv	s6,a0
8000d69c:	00058493          	mv	s1,a1
8000d6a0:	38069c63          	bnez	a3,8000da38 <__udivdi3+0x3d0>
8000d6a4:	00060413          	mv	s0,a2
8000d6a8:	00050993          	mv	s3,a0
8000d6ac:	ffff6917          	auipc	s2,0xffff6
8000d6b0:	a3490913          	addi	s2,s2,-1484 # 800030e0 <__clz_tab>
8000d6b4:	12c5f863          	bgeu	a1,a2,8000d7e4 <__udivdi3+0x17c>
8000d6b8:	000107b7          	lui	a5,0x10
8000d6bc:	00058a93          	mv	s5,a1
8000d6c0:	10f67863          	bgeu	a2,a5,8000d7d0 <__udivdi3+0x168>
8000d6c4:	0ff00693          	li	a3,255
8000d6c8:	00c6b6b3          	sltu	a3,a3,a2
8000d6cc:	00369693          	slli	a3,a3,0x3
8000d6d0:	00d657b3          	srl	a5,a2,a3
8000d6d4:	00f90933          	add	s2,s2,a5
8000d6d8:	00094703          	lbu	a4,0(s2)
8000d6dc:	00d706b3          	add	a3,a4,a3
8000d6e0:	02000713          	li	a4,32
8000d6e4:	40d70733          	sub	a4,a4,a3
8000d6e8:	00070c63          	beqz	a4,8000d700 <__udivdi3+0x98>
8000d6ec:	00e494b3          	sll	s1,s1,a4
8000d6f0:	00db56b3          	srl	a3,s6,a3
8000d6f4:	00e61433          	sll	s0,a2,a4
8000d6f8:	0096eab3          	or	s5,a3,s1
8000d6fc:	00eb19b3          	sll	s3,s6,a4
8000d700:	01045b13          	srli	s6,s0,0x10
8000d704:	000b0593          	mv	a1,s6
8000d708:	000a8513          	mv	a0,s5
8000d70c:	5a4000ef          	jal	ra,8000dcb0 <__umodsi3>
8000d710:	00050913          	mv	s2,a0
8000d714:	000b0593          	mv	a1,s6
8000d718:	01041b93          	slli	s7,s0,0x10
8000d71c:	000a8513          	mv	a0,s5
8000d720:	548000ef          	jal	ra,8000dc68 <__udivsi3>
8000d724:	010bdb93          	srli	s7,s7,0x10
8000d728:	00050493          	mv	s1,a0
8000d72c:	00050593          	mv	a1,a0
8000d730:	000b8513          	mv	a0,s7
8000d734:	508000ef          	jal	ra,8000dc3c <__mulsi3>
8000d738:	01091913          	slli	s2,s2,0x10
8000d73c:	0109d713          	srli	a4,s3,0x10
8000d740:	00e96733          	or	a4,s2,a4
8000d744:	00048a13          	mv	s4,s1
8000d748:	00a77e63          	bgeu	a4,a0,8000d764 <__udivdi3+0xfc>
8000d74c:	00870733          	add	a4,a4,s0
8000d750:	fff48a13          	addi	s4,s1,-1
8000d754:	00876863          	bltu	a4,s0,8000d764 <__udivdi3+0xfc>
8000d758:	00a77663          	bgeu	a4,a0,8000d764 <__udivdi3+0xfc>
8000d75c:	ffe48a13          	addi	s4,s1,-2
8000d760:	00870733          	add	a4,a4,s0
8000d764:	40a704b3          	sub	s1,a4,a0
8000d768:	000b0593          	mv	a1,s6
8000d76c:	00048513          	mv	a0,s1
8000d770:	540000ef          	jal	ra,8000dcb0 <__umodsi3>
8000d774:	00050913          	mv	s2,a0
8000d778:	000b0593          	mv	a1,s6
8000d77c:	00048513          	mv	a0,s1
8000d780:	4e8000ef          	jal	ra,8000dc68 <__udivsi3>
8000d784:	01099993          	slli	s3,s3,0x10
8000d788:	00050493          	mv	s1,a0
8000d78c:	00050593          	mv	a1,a0
8000d790:	01091913          	slli	s2,s2,0x10
8000d794:	000b8513          	mv	a0,s7
8000d798:	0109d993          	srli	s3,s3,0x10
8000d79c:	4a0000ef          	jal	ra,8000dc3c <__mulsi3>
8000d7a0:	013969b3          	or	s3,s2,s3
8000d7a4:	00048613          	mv	a2,s1
8000d7a8:	00a9fc63          	bgeu	s3,a0,8000d7c0 <__udivdi3+0x158>
8000d7ac:	013409b3          	add	s3,s0,s3
8000d7b0:	fff48613          	addi	a2,s1,-1
8000d7b4:	0089e663          	bltu	s3,s0,8000d7c0 <__udivdi3+0x158>
8000d7b8:	00a9f463          	bgeu	s3,a0,8000d7c0 <__udivdi3+0x158>
8000d7bc:	ffe48613          	addi	a2,s1,-2
8000d7c0:	010a1793          	slli	a5,s4,0x10
8000d7c4:	00c7e7b3          	or	a5,a5,a2
8000d7c8:	00000a13          	li	s4,0
8000d7cc:	1300006f          	j	8000d8fc <__udivdi3+0x294>
8000d7d0:	010007b7          	lui	a5,0x1000
8000d7d4:	01000693          	li	a3,16
8000d7d8:	eef66ce3          	bltu	a2,a5,8000d6d0 <__udivdi3+0x68>
8000d7dc:	01800693          	li	a3,24
8000d7e0:	ef1ff06f          	j	8000d6d0 <__udivdi3+0x68>
8000d7e4:	00068a13          	mv	s4,a3
8000d7e8:	00061a63          	bnez	a2,8000d7fc <__udivdi3+0x194>
8000d7ec:	00000593          	li	a1,0
8000d7f0:	00100513          	li	a0,1
8000d7f4:	474000ef          	jal	ra,8000dc68 <__udivsi3>
8000d7f8:	00050413          	mv	s0,a0
8000d7fc:	000107b7          	lui	a5,0x10
8000d800:	12f47c63          	bgeu	s0,a5,8000d938 <__udivdi3+0x2d0>
8000d804:	0ff00793          	li	a5,255
8000d808:	0087f463          	bgeu	a5,s0,8000d810 <__udivdi3+0x1a8>
8000d80c:	00800a13          	li	s4,8
8000d810:	014457b3          	srl	a5,s0,s4
8000d814:	00f90933          	add	s2,s2,a5
8000d818:	00094683          	lbu	a3,0(s2)
8000d81c:	02000613          	li	a2,32
8000d820:	014686b3          	add	a3,a3,s4
8000d824:	40d60633          	sub	a2,a2,a3
8000d828:	12061263          	bnez	a2,8000d94c <__udivdi3+0x2e4>
8000d82c:	408484b3          	sub	s1,s1,s0
8000d830:	00100a13          	li	s4,1
8000d834:	01045b13          	srli	s6,s0,0x10
8000d838:	000b0593          	mv	a1,s6
8000d83c:	00048513          	mv	a0,s1
8000d840:	470000ef          	jal	ra,8000dcb0 <__umodsi3>
8000d844:	00050913          	mv	s2,a0
8000d848:	000b0593          	mv	a1,s6
8000d84c:	00048513          	mv	a0,s1
8000d850:	01041b93          	slli	s7,s0,0x10
8000d854:	414000ef          	jal	ra,8000dc68 <__udivsi3>
8000d858:	010bdb93          	srli	s7,s7,0x10
8000d85c:	00050493          	mv	s1,a0
8000d860:	00050593          	mv	a1,a0
8000d864:	000b8513          	mv	a0,s7
8000d868:	3d4000ef          	jal	ra,8000dc3c <__mulsi3>
8000d86c:	01091913          	slli	s2,s2,0x10
8000d870:	0109d713          	srli	a4,s3,0x10
8000d874:	00e96733          	or	a4,s2,a4
8000d878:	00048a93          	mv	s5,s1
8000d87c:	00a77e63          	bgeu	a4,a0,8000d898 <__udivdi3+0x230>
8000d880:	00870733          	add	a4,a4,s0
8000d884:	fff48a93          	addi	s5,s1,-1
8000d888:	00876863          	bltu	a4,s0,8000d898 <__udivdi3+0x230>
8000d88c:	00a77663          	bgeu	a4,a0,8000d898 <__udivdi3+0x230>
8000d890:	ffe48a93          	addi	s5,s1,-2
8000d894:	00870733          	add	a4,a4,s0
8000d898:	40a704b3          	sub	s1,a4,a0
8000d89c:	000b0593          	mv	a1,s6
8000d8a0:	00048513          	mv	a0,s1
8000d8a4:	40c000ef          	jal	ra,8000dcb0 <__umodsi3>
8000d8a8:	00050913          	mv	s2,a0
8000d8ac:	000b0593          	mv	a1,s6
8000d8b0:	00048513          	mv	a0,s1
8000d8b4:	3b4000ef          	jal	ra,8000dc68 <__udivsi3>
8000d8b8:	01099993          	slli	s3,s3,0x10
8000d8bc:	00050493          	mv	s1,a0
8000d8c0:	00050593          	mv	a1,a0
8000d8c4:	01091913          	slli	s2,s2,0x10
8000d8c8:	000b8513          	mv	a0,s7
8000d8cc:	0109d993          	srli	s3,s3,0x10
8000d8d0:	36c000ef          	jal	ra,8000dc3c <__mulsi3>
8000d8d4:	013969b3          	or	s3,s2,s3
8000d8d8:	00048613          	mv	a2,s1
8000d8dc:	00a9fc63          	bgeu	s3,a0,8000d8f4 <__udivdi3+0x28c>
8000d8e0:	013409b3          	add	s3,s0,s3
8000d8e4:	fff48613          	addi	a2,s1,-1
8000d8e8:	0089e663          	bltu	s3,s0,8000d8f4 <__udivdi3+0x28c>
8000d8ec:	00a9f463          	bgeu	s3,a0,8000d8f4 <__udivdi3+0x28c>
8000d8f0:	ffe48613          	addi	a2,s1,-2
8000d8f4:	010a9793          	slli	a5,s5,0x10
8000d8f8:	00c7e7b3          	or	a5,a5,a2
8000d8fc:	00078513          	mv	a0,a5
8000d900:	000a0593          	mv	a1,s4
8000d904:	02c12083          	lw	ra,44(sp)
8000d908:	02812403          	lw	s0,40(sp)
8000d90c:	02412483          	lw	s1,36(sp)
8000d910:	02012903          	lw	s2,32(sp)
8000d914:	01c12983          	lw	s3,28(sp)
8000d918:	01812a03          	lw	s4,24(sp)
8000d91c:	01412a83          	lw	s5,20(sp)
8000d920:	01012b03          	lw	s6,16(sp)
8000d924:	00c12b83          	lw	s7,12(sp)
8000d928:	00812c03          	lw	s8,8(sp)
8000d92c:	00412c83          	lw	s9,4(sp)
8000d930:	03010113          	addi	sp,sp,48
8000d934:	00008067          	ret
8000d938:	010007b7          	lui	a5,0x1000
8000d93c:	01000a13          	li	s4,16
8000d940:	ecf468e3          	bltu	s0,a5,8000d810 <__udivdi3+0x1a8>
8000d944:	01800a13          	li	s4,24
8000d948:	ec9ff06f          	j	8000d810 <__udivdi3+0x1a8>
8000d94c:	00c41433          	sll	s0,s0,a2
8000d950:	00d4da33          	srl	s4,s1,a3
8000d954:	00cb19b3          	sll	s3,s6,a2
8000d958:	00db56b3          	srl	a3,s6,a3
8000d95c:	01045b13          	srli	s6,s0,0x10
8000d960:	00c494b3          	sll	s1,s1,a2
8000d964:	000b0593          	mv	a1,s6
8000d968:	000a0513          	mv	a0,s4
8000d96c:	0096eab3          	or	s5,a3,s1
8000d970:	340000ef          	jal	ra,8000dcb0 <__umodsi3>
8000d974:	00050913          	mv	s2,a0
8000d978:	000b0593          	mv	a1,s6
8000d97c:	000a0513          	mv	a0,s4
8000d980:	01041b93          	slli	s7,s0,0x10
8000d984:	2e4000ef          	jal	ra,8000dc68 <__udivsi3>
8000d988:	010bdb93          	srli	s7,s7,0x10
8000d98c:	00050493          	mv	s1,a0
8000d990:	00050593          	mv	a1,a0
8000d994:	000b8513          	mv	a0,s7
8000d998:	2a4000ef          	jal	ra,8000dc3c <__mulsi3>
8000d99c:	01091913          	slli	s2,s2,0x10
8000d9a0:	010ad713          	srli	a4,s5,0x10
8000d9a4:	00e96733          	or	a4,s2,a4
8000d9a8:	00048a13          	mv	s4,s1
8000d9ac:	00a77e63          	bgeu	a4,a0,8000d9c8 <__udivdi3+0x360>
8000d9b0:	00870733          	add	a4,a4,s0
8000d9b4:	fff48a13          	addi	s4,s1,-1
8000d9b8:	00876863          	bltu	a4,s0,8000d9c8 <__udivdi3+0x360>
8000d9bc:	00a77663          	bgeu	a4,a0,8000d9c8 <__udivdi3+0x360>
8000d9c0:	ffe48a13          	addi	s4,s1,-2
8000d9c4:	00870733          	add	a4,a4,s0
8000d9c8:	40a704b3          	sub	s1,a4,a0
8000d9cc:	000b0593          	mv	a1,s6
8000d9d0:	00048513          	mv	a0,s1
8000d9d4:	2dc000ef          	jal	ra,8000dcb0 <__umodsi3>
8000d9d8:	00050913          	mv	s2,a0
8000d9dc:	000b0593          	mv	a1,s6
8000d9e0:	00048513          	mv	a0,s1
8000d9e4:	284000ef          	jal	ra,8000dc68 <__udivsi3>
8000d9e8:	00050493          	mv	s1,a0
8000d9ec:	00050593          	mv	a1,a0
8000d9f0:	000b8513          	mv	a0,s7
8000d9f4:	248000ef          	jal	ra,8000dc3c <__mulsi3>
8000d9f8:	010a9693          	slli	a3,s5,0x10
8000d9fc:	01091913          	slli	s2,s2,0x10
8000da00:	0106d693          	srli	a3,a3,0x10
8000da04:	00d967b3          	or	a5,s2,a3
8000da08:	00048713          	mv	a4,s1
8000da0c:	00a7fe63          	bgeu	a5,a0,8000da28 <__udivdi3+0x3c0>
8000da10:	008787b3          	add	a5,a5,s0
8000da14:	fff48713          	addi	a4,s1,-1
8000da18:	0087e863          	bltu	a5,s0,8000da28 <__udivdi3+0x3c0>
8000da1c:	00a7f663          	bgeu	a5,a0,8000da28 <__udivdi3+0x3c0>
8000da20:	ffe48713          	addi	a4,s1,-2
8000da24:	008787b3          	add	a5,a5,s0
8000da28:	010a1a13          	slli	s4,s4,0x10
8000da2c:	40a784b3          	sub	s1,a5,a0
8000da30:	00ea6a33          	or	s4,s4,a4
8000da34:	e01ff06f          	j	8000d834 <__udivdi3+0x1cc>
8000da38:	1ed5ec63          	bltu	a1,a3,8000dc30 <__udivdi3+0x5c8>
8000da3c:	000107b7          	lui	a5,0x10
8000da40:	04f6f463          	bgeu	a3,a5,8000da88 <__udivdi3+0x420>
8000da44:	0ff00593          	li	a1,255
8000da48:	00d5b533          	sltu	a0,a1,a3
8000da4c:	00351513          	slli	a0,a0,0x3
8000da50:	00a6d733          	srl	a4,a3,a0
8000da54:	ffff5797          	auipc	a5,0xffff5
8000da58:	68c78793          	addi	a5,a5,1676 # 800030e0 <__clz_tab>
8000da5c:	00e787b3          	add	a5,a5,a4
8000da60:	0007c583          	lbu	a1,0(a5)
8000da64:	02000a13          	li	s4,32
8000da68:	00a585b3          	add	a1,a1,a0
8000da6c:	40ba0a33          	sub	s4,s4,a1
8000da70:	020a1663          	bnez	s4,8000da9c <__udivdi3+0x434>
8000da74:	00100793          	li	a5,1
8000da78:	e896e2e3          	bltu	a3,s1,8000d8fc <__udivdi3+0x294>
8000da7c:	00cb3633          	sltu	a2,s6,a2
8000da80:	00164793          	xori	a5,a2,1
8000da84:	e79ff06f          	j	8000d8fc <__udivdi3+0x294>
8000da88:	010007b7          	lui	a5,0x1000
8000da8c:	01000513          	li	a0,16
8000da90:	fcf6e0e3          	bltu	a3,a5,8000da50 <__udivdi3+0x3e8>
8000da94:	01800513          	li	a0,24
8000da98:	fb9ff06f          	j	8000da50 <__udivdi3+0x3e8>
8000da9c:	00b65ab3          	srl	s5,a2,a1
8000daa0:	014696b3          	sll	a3,a3,s4
8000daa4:	00daeab3          	or	s5,s5,a3
8000daa8:	00b4d933          	srl	s2,s1,a1
8000daac:	014497b3          	sll	a5,s1,s4
8000dab0:	00bb55b3          	srl	a1,s6,a1
8000dab4:	010adb93          	srli	s7,s5,0x10
8000dab8:	00f5e4b3          	or	s1,a1,a5
8000dabc:	00090513          	mv	a0,s2
8000dac0:	000b8593          	mv	a1,s7
8000dac4:	014619b3          	sll	s3,a2,s4
8000dac8:	1e8000ef          	jal	ra,8000dcb0 <__umodsi3>
8000dacc:	00050413          	mv	s0,a0
8000dad0:	000b8593          	mv	a1,s7
8000dad4:	00090513          	mv	a0,s2
8000dad8:	010a9c13          	slli	s8,s5,0x10
8000dadc:	18c000ef          	jal	ra,8000dc68 <__udivsi3>
8000dae0:	010c5c13          	srli	s8,s8,0x10
8000dae4:	00050913          	mv	s2,a0
8000dae8:	00050593          	mv	a1,a0
8000daec:	000c0513          	mv	a0,s8
8000daf0:	14c000ef          	jal	ra,8000dc3c <__mulsi3>
8000daf4:	01041413          	slli	s0,s0,0x10
8000daf8:	0104d713          	srli	a4,s1,0x10
8000dafc:	00e46733          	or	a4,s0,a4
8000db00:	00090c93          	mv	s9,s2
8000db04:	00a77e63          	bgeu	a4,a0,8000db20 <__udivdi3+0x4b8>
8000db08:	01570733          	add	a4,a4,s5
8000db0c:	fff90c93          	addi	s9,s2,-1
8000db10:	01576863          	bltu	a4,s5,8000db20 <__udivdi3+0x4b8>
8000db14:	00a77663          	bgeu	a4,a0,8000db20 <__udivdi3+0x4b8>
8000db18:	ffe90c93          	addi	s9,s2,-2
8000db1c:	01570733          	add	a4,a4,s5
8000db20:	40a70933          	sub	s2,a4,a0
8000db24:	000b8593          	mv	a1,s7
8000db28:	00090513          	mv	a0,s2
8000db2c:	184000ef          	jal	ra,8000dcb0 <__umodsi3>
8000db30:	00050413          	mv	s0,a0
8000db34:	000b8593          	mv	a1,s7
8000db38:	00090513          	mv	a0,s2
8000db3c:	12c000ef          	jal	ra,8000dc68 <__udivsi3>
8000db40:	00050913          	mv	s2,a0
8000db44:	00050593          	mv	a1,a0
8000db48:	000c0513          	mv	a0,s8
8000db4c:	0f0000ef          	jal	ra,8000dc3c <__mulsi3>
8000db50:	01049793          	slli	a5,s1,0x10
8000db54:	01041413          	slli	s0,s0,0x10
8000db58:	0107d793          	srli	a5,a5,0x10
8000db5c:	00f46733          	or	a4,s0,a5
8000db60:	00090613          	mv	a2,s2
8000db64:	00a77e63          	bgeu	a4,a0,8000db80 <__udivdi3+0x518>
8000db68:	01570733          	add	a4,a4,s5
8000db6c:	fff90613          	addi	a2,s2,-1
8000db70:	01576863          	bltu	a4,s5,8000db80 <__udivdi3+0x518>
8000db74:	00a77663          	bgeu	a4,a0,8000db80 <__udivdi3+0x518>
8000db78:	ffe90613          	addi	a2,s2,-2
8000db7c:	01570733          	add	a4,a4,s5
8000db80:	010c9793          	slli	a5,s9,0x10
8000db84:	00010e37          	lui	t3,0x10
8000db88:	00c7e7b3          	or	a5,a5,a2
8000db8c:	fffe0813          	addi	a6,t3,-1 # ffff <_stack_size+0xefff>
8000db90:	0107f333          	and	t1,a5,a6
8000db94:	0109f833          	and	a6,s3,a6
8000db98:	40a70733          	sub	a4,a4,a0
8000db9c:	0107de93          	srli	t4,a5,0x10
8000dba0:	0109d993          	srli	s3,s3,0x10
8000dba4:	00030513          	mv	a0,t1
8000dba8:	00080593          	mv	a1,a6
8000dbac:	090000ef          	jal	ra,8000dc3c <__mulsi3>
8000dbb0:	00050893          	mv	a7,a0
8000dbb4:	00098593          	mv	a1,s3
8000dbb8:	00030513          	mv	a0,t1
8000dbbc:	080000ef          	jal	ra,8000dc3c <__mulsi3>
8000dbc0:	00050313          	mv	t1,a0
8000dbc4:	00080593          	mv	a1,a6
8000dbc8:	000e8513          	mv	a0,t4
8000dbcc:	070000ef          	jal	ra,8000dc3c <__mulsi3>
8000dbd0:	00050813          	mv	a6,a0
8000dbd4:	00098593          	mv	a1,s3
8000dbd8:	000e8513          	mv	a0,t4
8000dbdc:	060000ef          	jal	ra,8000dc3c <__mulsi3>
8000dbe0:	0108d693          	srli	a3,a7,0x10
8000dbe4:	01030333          	add	t1,t1,a6
8000dbe8:	006686b3          	add	a3,a3,t1
8000dbec:	0106f463          	bgeu	a3,a6,8000dbf4 <__udivdi3+0x58c>
8000dbf0:	01c50533          	add	a0,a0,t3
8000dbf4:	0106d613          	srli	a2,a3,0x10
8000dbf8:	00a60533          	add	a0,a2,a0
8000dbfc:	02a76663          	bltu	a4,a0,8000dc28 <__udivdi3+0x5c0>
8000dc00:	bca714e3          	bne	a4,a0,8000d7c8 <__udivdi3+0x160>
8000dc04:	00010737          	lui	a4,0x10
8000dc08:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xefff>
8000dc0c:	00e6f6b3          	and	a3,a3,a4
8000dc10:	01069693          	slli	a3,a3,0x10
8000dc14:	00e8f8b3          	and	a7,a7,a4
8000dc18:	014b1633          	sll	a2,s6,s4
8000dc1c:	011686b3          	add	a3,a3,a7
8000dc20:	00000a13          	li	s4,0
8000dc24:	ccd67ce3          	bgeu	a2,a3,8000d8fc <__udivdi3+0x294>
8000dc28:	fff78793          	addi	a5,a5,-1 # ffffff <_stack_size+0xffefff>
8000dc2c:	b9dff06f          	j	8000d7c8 <__udivdi3+0x160>
8000dc30:	00000a13          	li	s4,0
8000dc34:	00000793          	li	a5,0
8000dc38:	cc5ff06f          	j	8000d8fc <__udivdi3+0x294>

8000dc3c <__mulsi3>:
8000dc3c:	00050613          	mv	a2,a0
8000dc40:	00000513          	li	a0,0
8000dc44:	0015f693          	andi	a3,a1,1
8000dc48:	00068463          	beqz	a3,8000dc50 <__mulsi3+0x14>
8000dc4c:	00c50533          	add	a0,a0,a2
8000dc50:	0015d593          	srli	a1,a1,0x1
8000dc54:	00161613          	slli	a2,a2,0x1
8000dc58:	fe0596e3          	bnez	a1,8000dc44 <__mulsi3+0x8>
8000dc5c:	00008067          	ret

8000dc60 <__divsi3>:
8000dc60:	06054063          	bltz	a0,8000dcc0 <__umodsi3+0x10>
8000dc64:	0605c663          	bltz	a1,8000dcd0 <__umodsi3+0x20>

8000dc68 <__udivsi3>:
8000dc68:	00058613          	mv	a2,a1
8000dc6c:	00050593          	mv	a1,a0
8000dc70:	fff00513          	li	a0,-1
8000dc74:	02060c63          	beqz	a2,8000dcac <__udivsi3+0x44>
8000dc78:	00100693          	li	a3,1
8000dc7c:	00b67a63          	bgeu	a2,a1,8000dc90 <__udivsi3+0x28>
8000dc80:	00c05863          	blez	a2,8000dc90 <__udivsi3+0x28>
8000dc84:	00161613          	slli	a2,a2,0x1
8000dc88:	00169693          	slli	a3,a3,0x1
8000dc8c:	feb66ae3          	bltu	a2,a1,8000dc80 <__udivsi3+0x18>
8000dc90:	00000513          	li	a0,0
8000dc94:	00c5e663          	bltu	a1,a2,8000dca0 <__udivsi3+0x38>
8000dc98:	40c585b3          	sub	a1,a1,a2
8000dc9c:	00d56533          	or	a0,a0,a3
8000dca0:	0016d693          	srli	a3,a3,0x1
8000dca4:	00165613          	srli	a2,a2,0x1
8000dca8:	fe0696e3          	bnez	a3,8000dc94 <__udivsi3+0x2c>
8000dcac:	00008067          	ret

8000dcb0 <__umodsi3>:
8000dcb0:	00008293          	mv	t0,ra
8000dcb4:	fb5ff0ef          	jal	ra,8000dc68 <__udivsi3>
8000dcb8:	00058513          	mv	a0,a1
8000dcbc:	00028067          	jr	t0 # 8000d60c <memset+0xb4>
8000dcc0:	40a00533          	neg	a0,a0
8000dcc4:	0005d863          	bgez	a1,8000dcd4 <__umodsi3+0x24>
8000dcc8:	40b005b3          	neg	a1,a1
8000dccc:	f9dff06f          	j	8000dc68 <__udivsi3>
8000dcd0:	40b005b3          	neg	a1,a1
8000dcd4:	00008293          	mv	t0,ra
8000dcd8:	f91ff0ef          	jal	ra,8000dc68 <__udivsi3>
8000dcdc:	40a00533          	neg	a0,a0
8000dce0:	00028067          	jr	t0

8000dce4 <__modsi3>:
8000dce4:	00008293          	mv	t0,ra
8000dce8:	0005ca63          	bltz	a1,8000dcfc <__modsi3+0x18>
8000dcec:	00054c63          	bltz	a0,8000dd04 <__modsi3+0x20>
8000dcf0:	f79ff0ef          	jal	ra,8000dc68 <__udivsi3>
8000dcf4:	00058513          	mv	a0,a1
8000dcf8:	00028067          	jr	t0
8000dcfc:	40b005b3          	neg	a1,a1
8000dd00:	fe0558e3          	bgez	a0,8000dcf0 <__modsi3+0xc>
8000dd04:	40a00533          	neg	a0,a0
8000dd08:	f61ff0ef          	jal	ra,8000dc68 <__udivsi3>
8000dd0c:	40b00533          	neg	a0,a1
8000dd10:	00028067          	jr	t0

Disassembly of section .text.startup:

8000dd14 <main>:
8000dd14:	fa010113          	addi	sp,sp,-96
8000dd18:	04112e23          	sw	ra,92(sp)
8000dd1c:	04812c23          	sw	s0,88(sp)
8000dd20:	04912a23          	sw	s1,84(sp)
8000dd24:	05212823          	sw	s2,80(sp)
8000dd28:	05312623          	sw	s3,76(sp)
8000dd2c:	05412423          	sw	s4,72(sp)
8000dd30:	05512223          	sw	s5,68(sp)
8000dd34:	05612023          	sw	s6,64(sp)
8000dd38:	03712e23          	sw	s7,60(sp)
8000dd3c:	03812c23          	sw	s8,56(sp)
8000dd40:	30047073          	csrci	mstatus,8
8000dd44:	00000593          	li	a1,0
8000dd48:	00000513          	li	a0,0
8000dd4c:	f3cf80ef          	jal	ra,80006488 <init_sbrk>
8000dd50:	001e8537          	lui	a0,0x1e8
8000dd54:	48050513          	addi	a0,a0,1152 # 1e8480 <_stack_size+0x1e7480>
8000dd58:	f84f80ef          	jal	ra,800064dc <delay_us>
8000dd5c:	8701a783          	lw	a5,-1936(gp) # 800032e0 <deadbeef>
8000dd60:	1c078c63          	beqz	a5,8000df38 <main+0x224>
8000dd64:	80002537          	lui	a0,0x80002
8000dd68:	0c450513          	addi	a0,a0,196 # 800020c4 <_ram_heap_end+0xfffea0c4>
8000dd6c:	fa0f80ef          	jal	ra,8000650c <print_uart0>
8000dd70:	8e1f80ef          	jal	ra,80006650 <hard_reboot>
8000dd74:	80002537          	lui	a0,0x80002
8000dd78:	14200593          	li	a1,322
8000dd7c:	0ec50513          	addi	a0,a0,236 # 800020ec <_ram_heap_end+0xfffea0ec>
8000dd80:	1c8010ef          	jal	ra,8000ef48 <iprintf>
8000dd84:	f0000737          	lui	a4,0xf0000
8000dd88:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
8000dd8c:	80002537          	lui	a0,0x80002
8000dd90:	18050513          	addi	a0,a0,384 # 80002180 <_ram_heap_end+0xfffea180>
8000dd94:	0027e793          	ori	a5,a5,2
8000dd98:	00f72223          	sw	a5,4(a4)
8000dd9c:	1ac010ef          	jal	ra,8000ef48 <iprintf>
8000dda0:	badf50ef          	jal	ra,8000394c <sram_test_write_random_ints>
8000dda4:	80002437          	lui	s0,0x80002
8000dda8:	1a051063          	bnez	a0,8000df48 <main+0x234>
8000ddac:	80002537          	lui	a0,0x80002
8000ddb0:	19050513          	addi	a0,a0,400 # 80002190 <_ram_heap_end+0xfffea190>
8000ddb4:	194010ef          	jal	ra,8000ef48 <iprintf>
8000ddb8:	000805b7          	lui	a1,0x80
8000ddbc:	90000537          	lui	a0,0x90000
8000ddc0:	ec8f80ef          	jal	ra,80006488 <init_sbrk>
8000ddc4:	800025b7          	lui	a1,0x80002
8000ddc8:	1a458593          	addi	a1,a1,420 # 800021a4 <_ram_heap_end+0xfffea1a4>
8000ddcc:	1ac40513          	addi	a0,s0,428 # 800021ac <_ram_heap_end+0xfffea1ac>
8000ddd0:	178010ef          	jal	ra,8000ef48 <iprintf>
8000ddd4:	f00547b7          	lui	a5,0xf0054
8000ddd8:	0007a023          	sw	zero,0(a5) # f0054000 <_ram_heap_end+0x7003c000>
8000dddc:	f0000737          	lui	a4,0xf0000
8000dde0:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
8000dde4:	03c00613          	li	a2,60
8000dde8:	00100693          	li	a3,1
8000ddec:	ff77f793          	andi	a5,a5,-9
8000ddf0:	00f72223          	sw	a5,4(a4)
8000ddf4:	f00607b7          	lui	a5,0xf0060
8000ddf8:	07f00713          	li	a4,127
8000ddfc:	00e7a623          	sw	a4,12(a5) # f006000c <_ram_heap_end+0x7004800c>
8000de00:	0007a223          	sw	zero,4(a5)
8000de04:	fff00713          	li	a4,-1
8000de08:	00e7a023          	sw	a4,0(a5)
8000de0c:	f0010737          	lui	a4,0xf0010
8000de10:	00472783          	lw	a5,4(a4) # f0010004 <_ram_heap_end+0x6fff8004>
8000de14:	f0090537          	lui	a0,0xf0090
8000de18:	0027e793          	ori	a5,a5,2
8000de1c:	00f72223          	sw	a5,4(a4)
8000de20:	f0011737          	lui	a4,0xf0011
8000de24:	00472783          	lw	a5,4(a4) # f0011004 <_ram_heap_end+0x6fff9004>
8000de28:	0027e793          	ori	a5,a5,2
8000de2c:	00f72223          	sw	a5,4(a4)
8000de30:	f00207b7          	lui	a5,0xf0020
8000de34:	0007a023          	sw	zero,0(a5) # f0020000 <_ram_heap_end+0x70008000>
8000de38:	00c7a223          	sw	a2,4(a5)
8000de3c:	0007a423          	sw	zero,8(a5)
8000de40:	00018737          	lui	a4,0x18
8000de44:	0007a623          	sw	zero,12(a5)
8000de48:	6a070713          	addi	a4,a4,1696 # 186a0 <_stack_size+0x176a0>
8000de4c:	00e7a823          	sw	a4,16(a5)
8000de50:	00d7a023          	sw	a3,0(a5)
8000de54:	f00217b7          	lui	a5,0xf0021
8000de58:	0007a023          	sw	zero,0(a5) # f0021000 <_ram_heap_end+0x70009000>
8000de5c:	00c7a223          	sw	a2,4(a5)
8000de60:	0007a423          	sw	zero,8(a5)
8000de64:	0000c737          	lui	a4,0xc
8000de68:	0007a623          	sw	zero,12(a5)
8000de6c:	35070713          	addi	a4,a4,848 # c350 <_stack_size+0xb350>
8000de70:	00e7a823          	sw	a4,16(a5)
8000de74:	00d7a023          	sw	a3,0(a5)
8000de78:	da4f80ef          	jal	ra,8000641c <i2c_init>
8000de7c:	30046073          	csrsi	mstatus,8
8000de80:	80c1a783          	lw	a5,-2036(gp) # 8000327c <_impure_ptr>
8000de84:	0007a937          	lui	s2,0x7a
8000de88:	0087a503          	lw	a0,8(a5)
8000de8c:	00a00493          	li	s1,10
8000de90:	00200a93          	li	s5,2
8000de94:	2b1000ef          	jal	ra,8000e944 <fpurge>
8000de98:	80002537          	lui	a0,0x80002
8000de9c:	1c450513          	addi	a0,a0,452 # 800021c4 <_ram_heap_end+0xfffea1c4>
8000dea0:	0a8010ef          	jal	ra,8000ef48 <iprintf>
8000dea4:	80c1a783          	lw	a5,-2036(gp) # 8000327c <_impure_ptr>
8000dea8:	000a0993          	mv	s3,s4
8000deac:	f0000b37          	lui	s6,0xf0000
8000deb0:	0087a503          	lw	a0,8(a5)
8000deb4:	12090913          	addi	s2,s2,288 # 7a120 <_stack_size+0x79120>
8000deb8:	68c000ef          	jal	ra,8000e544 <fflush>
8000debc:	88c1a783          	lw	a5,-1908(gp) # 800032fc <uart_config_reset_counter>
8000dec0:	02fae863          	bltu	s5,a5,8000def0 <main+0x1dc>
8000dec4:	000b2783          	lw	a5,0(s6) # f0000000 <_ram_heap_end+0x6ffe8000>
8000dec8:	0207d463          	bgez	a5,8000def0 <main+0x1dc>
8000decc:	02e00513          	li	a0,46
8000ded0:	130010ef          	jal	ra,8000f000 <putchar>
8000ded4:	80c1a783          	lw	a5,-2036(gp) # 8000327c <_impure_ptr>
8000ded8:	fff48493          	addi	s1,s1,-1
8000dedc:	0087a503          	lw	a0,8(a5)
8000dee0:	664000ef          	jal	ra,8000e544 <fflush>
8000dee4:	00090513          	mv	a0,s2
8000dee8:	df4f80ef          	jal	ra,800064dc <delay_us>
8000deec:	fc0498e3          	bnez	s1,8000debc <main+0x1a8>
8000def0:	80003537          	lui	a0,0x80003
8000def4:	8e850513          	addi	a0,a0,-1816 # 800028e8 <_ram_heap_end+0xfffea8e8>
8000def8:	050010ef          	jal	ra,8000ef48 <iprintf>
8000defc:	800034b7          	lui	s1,0x80003
8000df00:	02000613          	li	a2,32
8000df04:	1e048593          	addi	a1,s1,480 # 800031e0 <_ram_heap_end+0xfffeb1e0>
8000df08:	9b418513          	addi	a0,gp,-1612 # 80003424 <active_config>
8000df0c:	3fd000ef          	jal	ra,8000eb08 <memcpy>
8000df10:	88c1a703          	lw	a4,-1908(gp) # 800032fc <uart_config_reset_counter>
8000df14:	00200793          	li	a5,2
8000df18:	02e7fe63          	bgeu	a5,a4,8000df54 <main+0x240>
8000df1c:	800025b7          	lui	a1,0x80002
8000df20:	8801a623          	sw	zero,-1908(gp) # 800032fc <uart_config_reset_counter>
8000df24:	1e058593          	addi	a1,a1,480 # 800021e0 <_ram_heap_end+0xfffea1e0>
8000df28:	80002537          	lui	a0,0x80002
8000df2c:	1f050513          	addi	a0,a0,496 # 800021f0 <_ram_heap_end+0xfffea1f0>
8000df30:	018010ef          	jal	ra,8000ef48 <iprintf>
8000df34:	05c0006f          	j	8000df90 <main+0x27c>
8000df38:	deadc7b7          	lui	a5,0xdeadc
8000df3c:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac3eef>
8000df40:	86f1a823          	sw	a5,-1936(gp) # 800032e0 <deadbeef>
8000df44:	e31ff06f          	j	8000dd74 <main+0x60>
8000df48:	800025b7          	lui	a1,0x80002
8000df4c:	1b858593          	addi	a1,a1,440 # 800021b8 <_ram_heap_end+0xfffea1b8>
8000df50:	e7dff06f          	j	8000ddcc <main+0xb8>
8000df54:	f00007b7          	lui	a5,0xf0000
8000df58:	0007a783          	lw	a5,0(a5) # f0000000 <_ram_heap_end+0x6ffe8000>
8000df5c:	0007c863          	bltz	a5,8000df6c <main+0x258>
8000df60:	800025b7          	lui	a1,0x80002
8000df64:	20c58593          	addi	a1,a1,524 # 8000220c <_ram_heap_end+0xfffea20c>
8000df68:	fc1ff06f          	j	8000df28 <main+0x214>
8000df6c:	f0090537          	lui	a0,0xf0090
8000df70:	d90f60ef          	jal	ra,80004500 <eeprom_probe>
8000df74:	2e051e63          	bnez	a0,8000e270 <main+0x55c>
8000df78:	9b418513          	addi	a0,gp,-1612 # 80003424 <active_config>
8000df7c:	f1df50ef          	jal	ra,80003e98 <config_load>
8000df80:	2c051a63          	bnez	a0,8000e254 <main+0x540>
8000df84:	80002537          	lui	a0,0x80002
8000df88:	21850513          	addi	a0,a0,536 # 80002218 <_ram_heap_end+0xfffea218>
8000df8c:	7bd000ef          	jal	ra,8000ef48 <iprintf>
8000df90:	30047073          	csrci	mstatus,8
8000df94:	9b418413          	addi	s0,gp,-1612 # 80003424 <active_config>
8000df98:	01344503          	lbu	a0,19(s0)
8000df9c:	f5cf70ef          	jal	ra,800056f8 <hub_init>
8000dfa0:	ae8f70ef          	jal	ra,80005288 <mac_lwip_init>
8000dfa4:	c65f70ef          	jal	ra,80005c08 <modbus_udp_init>
8000dfa8:	cd1f50ef          	jal	ra,80003c78 <modbus_rtu_init>
8000dfac:	000045b7          	lui	a1,0x4
8000dfb0:	e8058593          	addi	a1,a1,-384 # 3e80 <_stack_size+0x2e80>
8000dfb4:	f00c0537          	lui	a0,0xf00c0
8000dfb8:	f01f70ef          	jal	ra,80005eb8 <audiodac_init>
8000dfbc:	80002537          	lui	a0,0x80002
8000dfc0:	25c50513          	addi	a0,a0,604 # 8000225c <_ram_heap_end+0xfffea25c>
8000dfc4:	785000ef          	jal	ra,8000ef48 <iprintf>
8000dfc8:	f0000737          	lui	a4,0xf0000
8000dfcc:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
8000dfd0:	ff87f793          	andi	a5,a5,-8
8000dfd4:	00f72223          	sw	a5,4(a4)
8000dfd8:	30046073          	csrsi	mstatus,8
8000dfdc:	80002537          	lui	a0,0x80002
8000dfe0:	27450513          	addi	a0,a0,628 # 80002274 <_ram_heap_end+0xfffea274>
8000dfe4:	765000ef          	jal	ra,8000ef48 <iprintf>
8000dfe8:	800004b7          	lui	s1,0x80000
8000dfec:	800026b7          	lui	a3,0x80002
8000dff0:	00800893          	li	a7,8
8000dff4:	00600813          	li	a6,6
8000dff8:	13448793          	addi	a5,s1,308 # 80000134 <_ram_heap_end+0xfffe8134>
8000dffc:	00500713          	li	a4,5
8000e000:	29868693          	addi	a3,a3,664 # 80002298 <_ram_heap_end+0xfffea298>
8000e004:	03f00613          	li	a2,63
8000e008:	00000593          	li	a1,0
8000e00c:	00600513          	li	a0,6
8000e010:	b15f70ef          	jal	ra,80005b24 <hub_print>
8000e014:	01444603          	lbu	a2,20(s0)
8000e018:	800025b7          	lui	a1,0x80002
8000e01c:	2a058593          	addi	a1,a1,672 # 800022a0 <_ram_heap_end+0xfffea2a0>
8000e020:	01010513          	addi	a0,sp,16
8000e024:	310010ef          	jal	ra,8000f334 <siprintf>
8000e028:	00050713          	mv	a4,a0
8000e02c:	00800893          	li	a7,8
8000e030:	00600813          	li	a6,6
8000e034:	13448793          	addi	a5,s1,308
8000e038:	01010693          	addi	a3,sp,16
8000e03c:	03f00613          	li	a2,63
8000e040:	00800593          	li	a1,8
8000e044:	00000513          	li	a0,0
8000e048:	addf70ef          	jal	ra,80005b24 <hub_print>
8000e04c:	001e8937          	lui	s2,0x1e8
8000e050:	48090513          	addi	a0,s2,1152 # 1e8480 <_stack_size+0x1e7480>
8000e054:	831f50ef          	jal	ra,80003884 <process_and_wait>
8000e058:	800026b7          	lui	a3,0x80002
8000e05c:	00800893          	li	a7,8
8000e060:	00600813          	li	a6,6
8000e064:	13448793          	addi	a5,s1,308
8000e068:	00500713          	li	a4,5
8000e06c:	2a468693          	addi	a3,a3,676 # 800022a4 <_ram_heap_end+0xfffea2a4>
8000e070:	03f00613          	li	a2,63
8000e074:	00000593          	li	a1,0
8000e078:	00600513          	li	a0,6
8000e07c:	aa9f70ef          	jal	ra,80005b24 <hub_print>
8000e080:	9d418413          	addi	s0,gp,-1580 # 80003444 <default_netif>
8000e084:	00444603          	lbu	a2,4(s0)
8000e088:	800029b7          	lui	s3,0x80002
8000e08c:	2ac98593          	addi	a1,s3,684 # 800022ac <_ram_heap_end+0xfffea2ac>
8000e090:	01010513          	addi	a0,sp,16
8000e094:	2a0010ef          	jal	ra,8000f334 <siprintf>
8000e098:	00050713          	mv	a4,a0
8000e09c:	00800893          	li	a7,8
8000e0a0:	00600813          	li	a6,6
8000e0a4:	13448793          	addi	a5,s1,308
8000e0a8:	01010693          	addi	a3,sp,16
8000e0ac:	03f00613          	li	a2,63
8000e0b0:	00800593          	li	a1,8
8000e0b4:	00000513          	li	a0,0
8000e0b8:	a6df70ef          	jal	ra,80005b24 <hub_print>
8000e0bc:	48090513          	addi	a0,s2,1152
8000e0c0:	fc4f50ef          	jal	ra,80003884 <process_and_wait>
8000e0c4:	00544603          	lbu	a2,5(s0)
8000e0c8:	2ac98593          	addi	a1,s3,684
8000e0cc:	01010513          	addi	a0,sp,16
8000e0d0:	264010ef          	jal	ra,8000f334 <siprintf>
8000e0d4:	00050713          	mv	a4,a0
8000e0d8:	00800893          	li	a7,8
8000e0dc:	00600813          	li	a6,6
8000e0e0:	13448793          	addi	a5,s1,308
8000e0e4:	01010693          	addi	a3,sp,16
8000e0e8:	03f00613          	li	a2,63
8000e0ec:	00800593          	li	a1,8
8000e0f0:	00000513          	li	a0,0
8000e0f4:	a31f70ef          	jal	ra,80005b24 <hub_print>
8000e0f8:	48090513          	addi	a0,s2,1152
8000e0fc:	f88f50ef          	jal	ra,80003884 <process_and_wait>
8000e100:	00644603          	lbu	a2,6(s0)
8000e104:	2ac98593          	addi	a1,s3,684
8000e108:	01010513          	addi	a0,sp,16
8000e10c:	228010ef          	jal	ra,8000f334 <siprintf>
8000e110:	00050713          	mv	a4,a0
8000e114:	00800893          	li	a7,8
8000e118:	00600813          	li	a6,6
8000e11c:	13448793          	addi	a5,s1,308
8000e120:	01010693          	addi	a3,sp,16
8000e124:	03f00613          	li	a2,63
8000e128:	00800593          	li	a1,8
8000e12c:	00000513          	li	a0,0
8000e130:	9f5f70ef          	jal	ra,80005b24 <hub_print>
8000e134:	48090513          	addi	a0,s2,1152
8000e138:	f4cf50ef          	jal	ra,80003884 <process_and_wait>
8000e13c:	00744603          	lbu	a2,7(s0)
8000e140:	2ac98593          	addi	a1,s3,684
8000e144:	01010513          	addi	a0,sp,16
8000e148:	1ec010ef          	jal	ra,8000f334 <siprintf>
8000e14c:	00050713          	mv	a4,a0
8000e150:	00800893          	li	a7,8
8000e154:	00600813          	li	a6,6
8000e158:	13448793          	addi	a5,s1,308
8000e15c:	01010693          	addi	a3,sp,16
8000e160:	03f00613          	li	a2,63
8000e164:	00800593          	li	a1,8
8000e168:	00000513          	li	a0,0
8000e16c:	9b9f70ef          	jal	ra,80005b24 <hub_print>
8000e170:	48090513          	addi	a0,s2,1152
8000e174:	f10f50ef          	jal	ra,80003884 <process_and_wait>
8000e178:	8c81a603          	lw	a2,-1848(gp) # 80003338 <hub_frame_size>
8000e17c:	00000593          	li	a1,0
8000e180:	f0050537          	lui	a0,0xf0050
8000e184:	bd4ff0ef          	jal	ra,8000d558 <memset>
8000e188:	0000f537          	lui	a0,0xf
8000e18c:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xda60>
8000e190:	129000ef          	jal	ra,8000eab8 <malloc>
8000e194:	0e050463          	beqz	a0,8000e27c <main+0x568>
8000e198:	000075b7          	lui	a1,0x7
8000e19c:	53058593          	addi	a1,a1,1328 # 7530 <_stack_size+0x6530>
8000e1a0:	a10f80ef          	jal	ra,800063b0 <audiodac0_start_playback>
8000e1a4:	0007a4b7          	lui	s1,0x7a
8000e1a8:	12048493          	addi	s1,s1,288 # 7a120 <_stack_size+0x79120>
8000e1ac:	f0000937          	lui	s2,0xf0000
8000e1b0:	00492783          	lw	a5,4(s2) # f0000004 <_ram_heap_end+0x6ffe8004>
8000e1b4:	00048513          	mv	a0,s1
8000e1b8:	0017e793          	ori	a5,a5,1
8000e1bc:	00f92223          	sw	a5,4(s2)
8000e1c0:	ec4f50ef          	jal	ra,80003884 <process_and_wait>
8000e1c4:	00492783          	lw	a5,4(s2)
8000e1c8:	00048513          	mv	a0,s1
8000e1cc:	ffe7f793          	andi	a5,a5,-2
8000e1d0:	00f92223          	sw	a5,4(s2)
8000e1d4:	eb0f50ef          	jal	ra,80003884 <process_and_wait>
8000e1d8:	f00547b7          	lui	a5,0xf0054
8000e1dc:	0007a603          	lw	a2,0(a5) # f0054000 <_ram_heap_end+0x7003c000>
8000e1e0:	89c1a703          	lw	a4,-1892(gp) # 8000330c <reg_irq_counter>
8000e1e4:	8981a783          	lw	a5,-1896(gp) # 80003308 <reg_sys_counter>
8000e1e8:	8941a803          	lw	a6,-1900(gp) # 80003304 <reg_scratch>
8000e1ec:	8741a683          	lw	a3,-1932(gp) # 800032e4 <audiodac0_samples_sent>
8000e1f0:	8781a583          	lw	a1,-1928(gp) # 800032e8 <audiodac0_irqs>
8000e1f4:	8e81a883          	lw	a7,-1816(gp) # 80003358 <sbrk_heap_end>
8000e1f8:	00d12023          	sw	a3,0(sp)
8000e1fc:	8c81a683          	lw	a3,-1848(gp) # 80003338 <hub_frame_size>
8000e200:	80002537          	lui	a0,0x80002
8000e204:	07f67613          	andi	a2,a2,127
8000e208:	00b12223          	sw	a1,4(sp)
8000e20c:	2d850513          	addi	a0,a0,728 # 800022d8 <_ram_heap_end+0xfffea2d8>
8000e210:	14200593          	li	a1,322
8000e214:	535000ef          	jal	ra,8000ef48 <iprintf>
8000e218:	c49f70ef          	jal	ra,80005e60 <plic_print_stats>
8000e21c:	c7cf70ef          	jal	ra,80005698 <mac_print_stats>
8000e220:	8981a783          	lw	a5,-1896(gp) # 80003308 <reg_sys_counter>
8000e224:	00178793          	addi	a5,a5,1
8000e228:	88f1ac23          	sw	a5,-1896(gp) # 80003308 <reg_sys_counter>
8000e22c:	8901a703          	lw	a4,-1904(gp) # 80003300 <reg_config_write>
8000e230:	00070863          	beqz	a4,8000e240 <main+0x52c>
8000e234:	8901a703          	lw	a4,-1904(gp) # 80003300 <reg_config_write>
8000e238:	fff70713          	addi	a4,a4,-1
8000e23c:	88e1a823          	sw	a4,-1904(gp) # 80003300 <reg_config_write>
8000e240:	f0000737          	lui	a4,0xf0000
8000e244:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffe8004>
8000e248:	ffd7f793          	andi	a5,a5,-3
8000e24c:	00f72223          	sw	a5,4(a4)
8000e250:	f5dff06f          	j	8000e1ac <main+0x498>
8000e254:	1e048593          	addi	a1,s1,480
8000e258:	02000613          	li	a2,32
8000e25c:	9b418513          	addi	a0,gp,-1612 # 80003424 <active_config>
8000e260:	0a9000ef          	jal	ra,8000eb08 <memcpy>
8000e264:	800025b7          	lui	a1,0x80002
8000e268:	23458593          	addi	a1,a1,564 # 80002234 <_ram_heap_end+0xfffea234>
8000e26c:	cbdff06f          	j	8000df28 <main+0x214>
8000e270:	800025b7          	lui	a1,0x80002
8000e274:	24858593          	addi	a1,a1,584 # 80002248 <_ram_heap_end+0xfffea248>
8000e278:	cb1ff06f          	j	8000df28 <main+0x214>
8000e27c:	80002537          	lui	a0,0x80002
8000e280:	2b450513          	addi	a0,a0,692 # 800022b4 <_ram_heap_end+0xfffea2b4>
8000e284:	4c5000ef          	jal	ra,8000ef48 <iprintf>
8000e288:	f1dff06f          	j	8000e1a4 <main+0x490>

Disassembly of section .text.atoi:

8000e28c <atoi>:
8000e28c:	00a00613          	li	a2,10
8000e290:	00000593          	li	a1,0
8000e294:	4d00106f          	j	8000f764 <strtol>

Disassembly of section .text._atoi_r:

8000e298 <_atoi_r>:
8000e298:	00a00693          	li	a3,10
8000e29c:	00000613          	li	a2,0
8000e2a0:	4a80106f          	j	8000f748 <_strtol_r>

Disassembly of section .text.calloc:

8000e2a4 <calloc>:
8000e2a4:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000e2a8:	00058613          	mv	a2,a1
8000e2ac:	00050593          	mv	a1,a0
8000e2b0:	0007a503          	lw	a0,0(a5)
8000e2b4:	1890006f          	j	8000ec3c <_calloc_r>

Disassembly of section .text.__sflush_r:

8000e2b8 <__sflush_r>:
8000e2b8:	00c5d783          	lhu	a5,12(a1)
8000e2bc:	fe010113          	addi	sp,sp,-32
8000e2c0:	00812c23          	sw	s0,24(sp)
8000e2c4:	00912a23          	sw	s1,20(sp)
8000e2c8:	00112e23          	sw	ra,28(sp)
8000e2cc:	01212823          	sw	s2,16(sp)
8000e2d0:	01312623          	sw	s3,12(sp)
8000e2d4:	0087f713          	andi	a4,a5,8
8000e2d8:	00050493          	mv	s1,a0
8000e2dc:	00058413          	mv	s0,a1
8000e2e0:	14071e63          	bnez	a4,8000e43c <__sflush_r+0x184>
8000e2e4:	0045a703          	lw	a4,4(a1)
8000e2e8:	00e04a63          	bgtz	a4,8000e2fc <__sflush_r+0x44>
8000e2ec:	0405a703          	lw	a4,64(a1)
8000e2f0:	00e04663          	bgtz	a4,8000e2fc <__sflush_r+0x44>
8000e2f4:	00000513          	li	a0,0
8000e2f8:	11c0006f          	j	8000e414 <__sflush_r+0x15c>
8000e2fc:	02c42703          	lw	a4,44(s0)
8000e300:	fe070ae3          	beqz	a4,8000e2f4 <__sflush_r+0x3c>
8000e304:	0004a903          	lw	s2,0(s1)
8000e308:	01379693          	slli	a3,a5,0x13
8000e30c:	0004a023          	sw	zero,0(s1)
8000e310:	0a06de63          	bgez	a3,8000e3cc <__sflush_r+0x114>
8000e314:	05442503          	lw	a0,84(s0)
8000e318:	00c45783          	lhu	a5,12(s0)
8000e31c:	0047f793          	andi	a5,a5,4
8000e320:	00078e63          	beqz	a5,8000e33c <__sflush_r+0x84>
8000e324:	00442783          	lw	a5,4(s0)
8000e328:	40f50533          	sub	a0,a0,a5
8000e32c:	03442783          	lw	a5,52(s0)
8000e330:	00078663          	beqz	a5,8000e33c <__sflush_r+0x84>
8000e334:	04042783          	lw	a5,64(s0)
8000e338:	40f50533          	sub	a0,a0,a5
8000e33c:	02c42783          	lw	a5,44(s0)
8000e340:	02042583          	lw	a1,32(s0)
8000e344:	00050613          	mv	a2,a0
8000e348:	00000693          	li	a3,0
8000e34c:	00048513          	mv	a0,s1
8000e350:	000780e7          	jalr	a5
8000e354:	fff00793          	li	a5,-1
8000e358:	00c45703          	lhu	a4,12(s0)
8000e35c:	02f51263          	bne	a0,a5,8000e380 <__sflush_r+0xc8>
8000e360:	0004a683          	lw	a3,0(s1)
8000e364:	01d00793          	li	a5,29
8000e368:	0cd7e463          	bltu	a5,a3,8000e430 <__sflush_r+0x178>
8000e36c:	204007b7          	lui	a5,0x20400
8000e370:	00178793          	addi	a5,a5,1 # 20400001 <_stack_size+0x203ff001>
8000e374:	00d7d7b3          	srl	a5,a5,a3
8000e378:	0017f793          	andi	a5,a5,1
8000e37c:	0a078a63          	beqz	a5,8000e430 <__sflush_r+0x178>
8000e380:	01042783          	lw	a5,16(s0)
8000e384:	00042223          	sw	zero,4(s0)
8000e388:	00f42023          	sw	a5,0(s0)
8000e38c:	01371793          	slli	a5,a4,0x13
8000e390:	0007dc63          	bgez	a5,8000e3a8 <__sflush_r+0xf0>
8000e394:	fff00793          	li	a5,-1
8000e398:	00f51663          	bne	a0,a5,8000e3a4 <__sflush_r+0xec>
8000e39c:	0004a783          	lw	a5,0(s1)
8000e3a0:	00079463          	bnez	a5,8000e3a8 <__sflush_r+0xf0>
8000e3a4:	04a42a23          	sw	a0,84(s0)
8000e3a8:	03442583          	lw	a1,52(s0)
8000e3ac:	0124a023          	sw	s2,0(s1)
8000e3b0:	f40582e3          	beqz	a1,8000e2f4 <__sflush_r+0x3c>
8000e3b4:	04440793          	addi	a5,s0,68
8000e3b8:	00f58663          	beq	a1,a5,8000e3c4 <__sflush_r+0x10c>
8000e3bc:	00048513          	mv	a0,s1
8000e3c0:	0d1000ef          	jal	ra,8000ec90 <_free_r>
8000e3c4:	02042a23          	sw	zero,52(s0)
8000e3c8:	f2dff06f          	j	8000e2f4 <__sflush_r+0x3c>
8000e3cc:	02042583          	lw	a1,32(s0)
8000e3d0:	00100693          	li	a3,1
8000e3d4:	00000613          	li	a2,0
8000e3d8:	00048513          	mv	a0,s1
8000e3dc:	000700e7          	jalr	a4
8000e3e0:	fff00793          	li	a5,-1
8000e3e4:	f2f51ae3          	bne	a0,a5,8000e318 <__sflush_r+0x60>
8000e3e8:	0004a783          	lw	a5,0(s1)
8000e3ec:	f20786e3          	beqz	a5,8000e318 <__sflush_r+0x60>
8000e3f0:	01d00713          	li	a4,29
8000e3f4:	00e78663          	beq	a5,a4,8000e400 <__sflush_r+0x148>
8000e3f8:	01600713          	li	a4,22
8000e3fc:	00e79663          	bne	a5,a4,8000e408 <__sflush_r+0x150>
8000e400:	0124a023          	sw	s2,0(s1)
8000e404:	ef1ff06f          	j	8000e2f4 <__sflush_r+0x3c>
8000e408:	00c45783          	lhu	a5,12(s0)
8000e40c:	0407e793          	ori	a5,a5,64
8000e410:	00f41623          	sh	a5,12(s0)
8000e414:	01c12083          	lw	ra,28(sp)
8000e418:	01812403          	lw	s0,24(sp)
8000e41c:	01412483          	lw	s1,20(sp)
8000e420:	01012903          	lw	s2,16(sp)
8000e424:	00c12983          	lw	s3,12(sp)
8000e428:	02010113          	addi	sp,sp,32
8000e42c:	00008067          	ret
8000e430:	04076713          	ori	a4,a4,64
8000e434:	00e41623          	sh	a4,12(s0)
8000e438:	fddff06f          	j	8000e414 <__sflush_r+0x15c>
8000e43c:	0105a983          	lw	s3,16(a1)
8000e440:	ea098ae3          	beqz	s3,8000e2f4 <__sflush_r+0x3c>
8000e444:	0005a903          	lw	s2,0(a1)
8000e448:	0037f793          	andi	a5,a5,3
8000e44c:	0135a023          	sw	s3,0(a1)
8000e450:	41390933          	sub	s2,s2,s3
8000e454:	00000713          	li	a4,0
8000e458:	00079463          	bnez	a5,8000e460 <__sflush_r+0x1a8>
8000e45c:	0145a703          	lw	a4,20(a1)
8000e460:	00e42423          	sw	a4,8(s0)
8000e464:	e92058e3          	blez	s2,8000e2f4 <__sflush_r+0x3c>
8000e468:	02842783          	lw	a5,40(s0)
8000e46c:	02042583          	lw	a1,32(s0)
8000e470:	00090693          	mv	a3,s2
8000e474:	00098613          	mv	a2,s3
8000e478:	00048513          	mv	a0,s1
8000e47c:	000780e7          	jalr	a5
8000e480:	00a04c63          	bgtz	a0,8000e498 <__sflush_r+0x1e0>
8000e484:	00c45783          	lhu	a5,12(s0)
8000e488:	fff00513          	li	a0,-1
8000e48c:	0407e793          	ori	a5,a5,64
8000e490:	00f41623          	sh	a5,12(s0)
8000e494:	f81ff06f          	j	8000e414 <__sflush_r+0x15c>
8000e498:	00a989b3          	add	s3,s3,a0
8000e49c:	40a90933          	sub	s2,s2,a0
8000e4a0:	fc5ff06f          	j	8000e464 <__sflush_r+0x1ac>

Disassembly of section .text._fflush_r:

8000e4a4 <_fflush_r>:
8000e4a4:	0105a783          	lw	a5,16(a1)
8000e4a8:	08078a63          	beqz	a5,8000e53c <_fflush_r+0x98>
8000e4ac:	fe010113          	addi	sp,sp,-32
8000e4b0:	00812c23          	sw	s0,24(sp)
8000e4b4:	00112e23          	sw	ra,28(sp)
8000e4b8:	00050413          	mv	s0,a0
8000e4bc:	00050c63          	beqz	a0,8000e4d4 <_fflush_r+0x30>
8000e4c0:	01852783          	lw	a5,24(a0)
8000e4c4:	00079863          	bnez	a5,8000e4d4 <_fflush_r+0x30>
8000e4c8:	00b12623          	sw	a1,12(sp)
8000e4cc:	1c8000ef          	jal	ra,8000e694 <__sinit>
8000e4d0:	00c12583          	lw	a1,12(sp)
8000e4d4:	ffff5797          	auipc	a5,0xffff5
8000e4d8:	b9078793          	addi	a5,a5,-1136 # 80003064 <__sf_fake_stdin>
8000e4dc:	02f59263          	bne	a1,a5,8000e500 <_fflush_r+0x5c>
8000e4e0:	00442583          	lw	a1,4(s0)
8000e4e4:	00c59783          	lh	a5,12(a1)
8000e4e8:	04078063          	beqz	a5,8000e528 <_fflush_r+0x84>
8000e4ec:	00040513          	mv	a0,s0
8000e4f0:	01812403          	lw	s0,24(sp)
8000e4f4:	01c12083          	lw	ra,28(sp)
8000e4f8:	02010113          	addi	sp,sp,32
8000e4fc:	dbdff06f          	j	8000e2b8 <__sflush_r>
8000e500:	ffff5797          	auipc	a5,0xffff5
8000e504:	b8478793          	addi	a5,a5,-1148 # 80003084 <__sf_fake_stdout>
8000e508:	00f59663          	bne	a1,a5,8000e514 <_fflush_r+0x70>
8000e50c:	00842583          	lw	a1,8(s0)
8000e510:	fd5ff06f          	j	8000e4e4 <_fflush_r+0x40>
8000e514:	ffff5797          	auipc	a5,0xffff5
8000e518:	b3078793          	addi	a5,a5,-1232 # 80003044 <__sf_fake_stderr>
8000e51c:	fcf594e3          	bne	a1,a5,8000e4e4 <_fflush_r+0x40>
8000e520:	00c42583          	lw	a1,12(s0)
8000e524:	fc1ff06f          	j	8000e4e4 <_fflush_r+0x40>
8000e528:	01c12083          	lw	ra,28(sp)
8000e52c:	01812403          	lw	s0,24(sp)
8000e530:	00000513          	li	a0,0
8000e534:	02010113          	addi	sp,sp,32
8000e538:	00008067          	ret
8000e53c:	00000513          	li	a0,0
8000e540:	00008067          	ret

Disassembly of section .text.fflush:

8000e544 <fflush>:
8000e544:	00050593          	mv	a1,a0
8000e548:	00051c63          	bnez	a0,8000e560 <fflush+0x1c>
8000e54c:	c7018793          	addi	a5,gp,-912 # 800036e0 <_bss_end>
8000e550:	0007a503          	lw	a0,0(a5)
8000e554:	00000597          	auipc	a1,0x0
8000e558:	f5058593          	addi	a1,a1,-176 # 8000e4a4 <_fflush_r>
8000e55c:	4a80006f          	j	8000ea04 <_fwalk_reent>
8000e560:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000e564:	0007a503          	lw	a0,0(a5)
8000e568:	f3dff06f          	j	8000e4a4 <_fflush_r>

Disassembly of section .text.__fp_lock:

8000e56c <__fp_lock>:
8000e56c:	00000513          	li	a0,0
8000e570:	00008067          	ret

Disassembly of section .text.std:

8000e574 <std>:
8000e574:	ff010113          	addi	sp,sp,-16
8000e578:	00812423          	sw	s0,8(sp)
8000e57c:	00112623          	sw	ra,12(sp)
8000e580:	00050413          	mv	s0,a0
8000e584:	00b51623          	sh	a1,12(a0)
8000e588:	00c51723          	sh	a2,14(a0)
8000e58c:	00052023          	sw	zero,0(a0)
8000e590:	00052223          	sw	zero,4(a0)
8000e594:	00052423          	sw	zero,8(a0)
8000e598:	06052223          	sw	zero,100(a0)
8000e59c:	00052823          	sw	zero,16(a0)
8000e5a0:	00052a23          	sw	zero,20(a0)
8000e5a4:	00052c23          	sw	zero,24(a0)
8000e5a8:	00800613          	li	a2,8
8000e5ac:	00000593          	li	a1,0
8000e5b0:	05c50513          	addi	a0,a0,92
8000e5b4:	fa5fe0ef          	jal	ra,8000d558 <memset>
8000e5b8:	00001797          	auipc	a5,0x1
8000e5bc:	df078793          	addi	a5,a5,-528 # 8000f3a8 <__sread>
8000e5c0:	02f42223          	sw	a5,36(s0)
8000e5c4:	00001797          	auipc	a5,0x1
8000e5c8:	e3c78793          	addi	a5,a5,-452 # 8000f400 <__swrite>
8000e5cc:	02f42423          	sw	a5,40(s0)
8000e5d0:	00001797          	auipc	a5,0x1
8000e5d4:	eb478793          	addi	a5,a5,-332 # 8000f484 <__sseek>
8000e5d8:	02f42623          	sw	a5,44(s0)
8000e5dc:	00001797          	auipc	a5,0x1
8000e5e0:	f0078793          	addi	a5,a5,-256 # 8000f4dc <__sclose>
8000e5e4:	02842023          	sw	s0,32(s0)
8000e5e8:	02f42823          	sw	a5,48(s0)
8000e5ec:	00c12083          	lw	ra,12(sp)
8000e5f0:	00812403          	lw	s0,8(sp)
8000e5f4:	01010113          	addi	sp,sp,16
8000e5f8:	00008067          	ret

Disassembly of section .text._cleanup_r:

8000e5fc <_cleanup_r>:
8000e5fc:	00000597          	auipc	a1,0x0
8000e600:	ea858593          	addi	a1,a1,-344 # 8000e4a4 <_fflush_r>
8000e604:	4000006f          	j	8000ea04 <_fwalk_reent>

Disassembly of section .text.__fp_unlock:

8000e608 <__fp_unlock>:
8000e608:	00000513          	li	a0,0
8000e60c:	00008067          	ret

Disassembly of section .text.__sfmoreglue:

8000e610 <__sfmoreglue>:
8000e610:	ff010113          	addi	sp,sp,-16
8000e614:	fff58613          	addi	a2,a1,-1
8000e618:	00812423          	sw	s0,8(sp)
8000e61c:	00161413          	slli	s0,a2,0x1
8000e620:	00c40433          	add	s0,s0,a2
8000e624:	00241413          	slli	s0,s0,0x2
8000e628:	00c40433          	add	s0,s0,a2
8000e62c:	00341413          	slli	s0,s0,0x3
8000e630:	01212023          	sw	s2,0(sp)
8000e634:	00058913          	mv	s2,a1
8000e638:	07440593          	addi	a1,s0,116
8000e63c:	00912223          	sw	s1,4(sp)
8000e640:	00112623          	sw	ra,12(sp)
8000e644:	750000ef          	jal	ra,8000ed94 <_malloc_r>
8000e648:	00050493          	mv	s1,a0
8000e64c:	02050063          	beqz	a0,8000e66c <__sfmoreglue+0x5c>
8000e650:	00052023          	sw	zero,0(a0)
8000e654:	01252223          	sw	s2,4(a0)
8000e658:	00c50513          	addi	a0,a0,12
8000e65c:	00a4a423          	sw	a0,8(s1)
8000e660:	06840613          	addi	a2,s0,104
8000e664:	00000593          	li	a1,0
8000e668:	ef1fe0ef          	jal	ra,8000d558 <memset>
8000e66c:	00c12083          	lw	ra,12(sp)
8000e670:	00812403          	lw	s0,8(sp)
8000e674:	00048513          	mv	a0,s1
8000e678:	00012903          	lw	s2,0(sp)
8000e67c:	00412483          	lw	s1,4(sp)
8000e680:	01010113          	addi	sp,sp,16
8000e684:	00008067          	ret

Disassembly of section .text._cleanup:

8000e688 <_cleanup>:
8000e688:	c7018793          	addi	a5,gp,-912 # 800036e0 <_bss_end>
8000e68c:	0007a503          	lw	a0,0(a5)
8000e690:	f6dff06f          	j	8000e5fc <_cleanup_r>

Disassembly of section .text.__sinit:

8000e694 <__sinit>:
8000e694:	01852783          	lw	a5,24(a0)
8000e698:	0a079463          	bnez	a5,8000e740 <__sinit+0xac>
8000e69c:	ff010113          	addi	sp,sp,-16
8000e6a0:	00112623          	sw	ra,12(sp)
8000e6a4:	00812423          	sw	s0,8(sp)
8000e6a8:	00000797          	auipc	a5,0x0
8000e6ac:	f5478793          	addi	a5,a5,-172 # 8000e5fc <_cleanup_r>
8000e6b0:	02f52423          	sw	a5,40(a0)
8000e6b4:	c7018793          	addi	a5,gp,-912 # 800036e0 <_bss_end>
8000e6b8:	0007a783          	lw	a5,0(a5)
8000e6bc:	04052423          	sw	zero,72(a0)
8000e6c0:	04052623          	sw	zero,76(a0)
8000e6c4:	04052823          	sw	zero,80(a0)
8000e6c8:	00f51663          	bne	a0,a5,8000e6d4 <__sinit+0x40>
8000e6cc:	00100793          	li	a5,1
8000e6d0:	00f52c23          	sw	a5,24(a0)
8000e6d4:	00050413          	mv	s0,a0
8000e6d8:	06c000ef          	jal	ra,8000e744 <__sfp>
8000e6dc:	00a42223          	sw	a0,4(s0)
8000e6e0:	00040513          	mv	a0,s0
8000e6e4:	060000ef          	jal	ra,8000e744 <__sfp>
8000e6e8:	00a42423          	sw	a0,8(s0)
8000e6ec:	00040513          	mv	a0,s0
8000e6f0:	054000ef          	jal	ra,8000e744 <__sfp>
8000e6f4:	00a42623          	sw	a0,12(s0)
8000e6f8:	00442503          	lw	a0,4(s0)
8000e6fc:	00000613          	li	a2,0
8000e700:	00400593          	li	a1,4
8000e704:	e71ff0ef          	jal	ra,8000e574 <std>
8000e708:	00842503          	lw	a0,8(s0)
8000e70c:	00100613          	li	a2,1
8000e710:	00900593          	li	a1,9
8000e714:	e61ff0ef          	jal	ra,8000e574 <std>
8000e718:	00c42503          	lw	a0,12(s0)
8000e71c:	00200613          	li	a2,2
8000e720:	01200593          	li	a1,18
8000e724:	e51ff0ef          	jal	ra,8000e574 <std>
8000e728:	00100793          	li	a5,1
8000e72c:	00f42c23          	sw	a5,24(s0)
8000e730:	00c12083          	lw	ra,12(sp)
8000e734:	00812403          	lw	s0,8(sp)
8000e738:	01010113          	addi	sp,sp,16
8000e73c:	00008067          	ret
8000e740:	00008067          	ret

Disassembly of section .text.__sfp:

8000e744 <__sfp>:
8000e744:	ff010113          	addi	sp,sp,-16
8000e748:	c7018793          	addi	a5,gp,-912 # 800036e0 <_bss_end>
8000e74c:	00912223          	sw	s1,4(sp)
8000e750:	0007a483          	lw	s1,0(a5)
8000e754:	01212023          	sw	s2,0(sp)
8000e758:	00112623          	sw	ra,12(sp)
8000e75c:	0184a783          	lw	a5,24(s1)
8000e760:	00812423          	sw	s0,8(sp)
8000e764:	00050913          	mv	s2,a0
8000e768:	00079663          	bnez	a5,8000e774 <__sfp+0x30>
8000e76c:	00048513          	mv	a0,s1
8000e770:	f25ff0ef          	jal	ra,8000e694 <__sinit>
8000e774:	04848493          	addi	s1,s1,72
8000e778:	0084a403          	lw	s0,8(s1)
8000e77c:	0044a783          	lw	a5,4(s1)
8000e780:	fff78793          	addi	a5,a5,-1
8000e784:	0007da63          	bgez	a5,8000e798 <__sfp+0x54>
8000e788:	0004a783          	lw	a5,0(s1)
8000e78c:	08078063          	beqz	a5,8000e80c <__sfp+0xc8>
8000e790:	0004a483          	lw	s1,0(s1)
8000e794:	fe5ff06f          	j	8000e778 <__sfp+0x34>
8000e798:	00c41703          	lh	a4,12(s0)
8000e79c:	06071463          	bnez	a4,8000e804 <__sfp+0xc0>
8000e7a0:	ffff07b7          	lui	a5,0xffff0
8000e7a4:	00178793          	addi	a5,a5,1 # ffff0001 <_ram_heap_end+0x7ffd8001>
8000e7a8:	06042223          	sw	zero,100(s0)
8000e7ac:	00042023          	sw	zero,0(s0)
8000e7b0:	00042223          	sw	zero,4(s0)
8000e7b4:	00042423          	sw	zero,8(s0)
8000e7b8:	00f42623          	sw	a5,12(s0)
8000e7bc:	00042823          	sw	zero,16(s0)
8000e7c0:	00042a23          	sw	zero,20(s0)
8000e7c4:	00042c23          	sw	zero,24(s0)
8000e7c8:	00800613          	li	a2,8
8000e7cc:	00000593          	li	a1,0
8000e7d0:	05c40513          	addi	a0,s0,92
8000e7d4:	d85fe0ef          	jal	ra,8000d558 <memset>
8000e7d8:	02042a23          	sw	zero,52(s0)
8000e7dc:	02042c23          	sw	zero,56(s0)
8000e7e0:	04042423          	sw	zero,72(s0)
8000e7e4:	04042623          	sw	zero,76(s0)
8000e7e8:	00040513          	mv	a0,s0
8000e7ec:	00c12083          	lw	ra,12(sp)
8000e7f0:	00812403          	lw	s0,8(sp)
8000e7f4:	00412483          	lw	s1,4(sp)
8000e7f8:	00012903          	lw	s2,0(sp)
8000e7fc:	01010113          	addi	sp,sp,16
8000e800:	00008067          	ret
8000e804:	06840413          	addi	s0,s0,104
8000e808:	f79ff06f          	j	8000e780 <__sfp+0x3c>
8000e80c:	00400593          	li	a1,4
8000e810:	00090513          	mv	a0,s2
8000e814:	dfdff0ef          	jal	ra,8000e610 <__sfmoreglue>
8000e818:	00a4a023          	sw	a0,0(s1)
8000e81c:	00050413          	mv	s0,a0
8000e820:	f60518e3          	bnez	a0,8000e790 <__sfp+0x4c>
8000e824:	00c00793          	li	a5,12
8000e828:	00f92023          	sw	a5,0(s2)
8000e82c:	fbdff06f          	j	8000e7e8 <__sfp+0xa4>

Disassembly of section .text.__sfp_lock_acquire:

8000e830 <__sfp_lock_acquire>:
8000e830:	00008067          	ret

Disassembly of section .text.__sfp_lock_release:

8000e834 <__sfp_lock_release>:
8000e834:	00008067          	ret

Disassembly of section .text.__sinit_lock_acquire:

8000e838 <__sinit_lock_acquire>:
8000e838:	00008067          	ret

Disassembly of section .text.__sinit_lock_release:

8000e83c <__sinit_lock_release>:
8000e83c:	00008067          	ret

Disassembly of section .text.__fp_lock_all:

8000e840 <__fp_lock_all>:
8000e840:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000e844:	0007a503          	lw	a0,0(a5)
8000e848:	00000597          	auipc	a1,0x0
8000e84c:	d2458593          	addi	a1,a1,-732 # 8000e56c <__fp_lock>
8000e850:	1140006f          	j	8000e964 <_fwalk>

Disassembly of section .text.__fp_unlock_all:

8000e854 <__fp_unlock_all>:
8000e854:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000e858:	0007a503          	lw	a0,0(a5)
8000e85c:	00000597          	auipc	a1,0x0
8000e860:	dac58593          	addi	a1,a1,-596 # 8000e608 <__fp_unlock>
8000e864:	1000006f          	j	8000e964 <_fwalk>

Disassembly of section .text._fpurge_r:

8000e868 <_fpurge_r>:
8000e868:	ff010113          	addi	sp,sp,-16
8000e86c:	00812423          	sw	s0,8(sp)
8000e870:	00912223          	sw	s1,4(sp)
8000e874:	00112623          	sw	ra,12(sp)
8000e878:	00050493          	mv	s1,a0
8000e87c:	00058413          	mv	s0,a1
8000e880:	00050863          	beqz	a0,8000e890 <_fpurge_r+0x28>
8000e884:	01852783          	lw	a5,24(a0)
8000e888:	00079463          	bnez	a5,8000e890 <_fpurge_r+0x28>
8000e88c:	e09ff0ef          	jal	ra,8000e694 <__sinit>
8000e890:	ffff4797          	auipc	a5,0xffff4
8000e894:	7d478793          	addi	a5,a5,2004 # 80003064 <__sf_fake_stdin>
8000e898:	02f41863          	bne	s0,a5,8000e8c8 <_fpurge_r+0x60>
8000e89c:	0044a403          	lw	s0,4(s1)
8000e8a0:	00c41783          	lh	a5,12(s0)
8000e8a4:	04079663          	bnez	a5,8000e8f0 <_fpurge_r+0x88>
8000e8a8:	00900793          	li	a5,9
8000e8ac:	00f4a023          	sw	a5,0(s1)
8000e8b0:	fff00513          	li	a0,-1
8000e8b4:	00c12083          	lw	ra,12(sp)
8000e8b8:	00812403          	lw	s0,8(sp)
8000e8bc:	00412483          	lw	s1,4(sp)
8000e8c0:	01010113          	addi	sp,sp,16
8000e8c4:	00008067          	ret
8000e8c8:	ffff4797          	auipc	a5,0xffff4
8000e8cc:	7bc78793          	addi	a5,a5,1980 # 80003084 <__sf_fake_stdout>
8000e8d0:	00f41663          	bne	s0,a5,8000e8dc <_fpurge_r+0x74>
8000e8d4:	0084a403          	lw	s0,8(s1)
8000e8d8:	fc9ff06f          	j	8000e8a0 <_fpurge_r+0x38>
8000e8dc:	ffff4797          	auipc	a5,0xffff4
8000e8e0:	76878793          	addi	a5,a5,1896 # 80003044 <__sf_fake_stderr>
8000e8e4:	faf41ee3          	bne	s0,a5,8000e8a0 <_fpurge_r+0x38>
8000e8e8:	00c4a403          	lw	s0,12(s1)
8000e8ec:	fb5ff06f          	j	8000e8a0 <_fpurge_r+0x38>
8000e8f0:	01042703          	lw	a4,16(s0)
8000e8f4:	00e42023          	sw	a4,0(s0)
8000e8f8:	0087f713          	andi	a4,a5,8
8000e8fc:	02071863          	bnez	a4,8000e92c <_fpurge_r+0xc4>
8000e900:	03442583          	lw	a1,52(s0)
8000e904:	00042223          	sw	zero,4(s0)
8000e908:	00000513          	li	a0,0
8000e90c:	fa0584e3          	beqz	a1,8000e8b4 <_fpurge_r+0x4c>
8000e910:	04440793          	addi	a5,s0,68
8000e914:	00f58663          	beq	a1,a5,8000e920 <_fpurge_r+0xb8>
8000e918:	00048513          	mv	a0,s1
8000e91c:	374000ef          	jal	ra,8000ec90 <_free_r>
8000e920:	02042a23          	sw	zero,52(s0)
8000e924:	00000513          	li	a0,0
8000e928:	f8dff06f          	j	8000e8b4 <_fpurge_r+0x4c>
8000e92c:	0037f793          	andi	a5,a5,3
8000e930:	00000713          	li	a4,0
8000e934:	00079463          	bnez	a5,8000e93c <_fpurge_r+0xd4>
8000e938:	01442703          	lw	a4,20(s0)
8000e93c:	00e42423          	sw	a4,8(s0)
8000e940:	fe5ff06f          	j	8000e924 <_fpurge_r+0xbc>

Disassembly of section .text.fpurge:

8000e944 <fpurge>:
8000e944:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000e948:	00050593          	mv	a1,a0
8000e94c:	0007a503          	lw	a0,0(a5)
8000e950:	f19ff06f          	j	8000e868 <_fpurge_r>

Disassembly of section .text.__fpurge:

8000e954 <__fpurge>:
8000e954:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000e958:	00050593          	mv	a1,a0
8000e95c:	0007a503          	lw	a0,0(a5)
8000e960:	f09ff06f          	j	8000e868 <_fpurge_r>

Disassembly of section .text._fwalk:

8000e964 <_fwalk>:
8000e964:	fd010113          	addi	sp,sp,-48
8000e968:	02812423          	sw	s0,40(sp)
8000e96c:	03212023          	sw	s2,32(sp)
8000e970:	01412c23          	sw	s4,24(sp)
8000e974:	01512a23          	sw	s5,20(sp)
8000e978:	02112623          	sw	ra,44(sp)
8000e97c:	02912223          	sw	s1,36(sp)
8000e980:	01312e23          	sw	s3,28(sp)
8000e984:	04850413          	addi	s0,a0,72
8000e988:	00000913          	li	s2,0
8000e98c:	00100a13          	li	s4,1
8000e990:	fff00a93          	li	s5,-1
8000e994:	02041663          	bnez	s0,8000e9c0 <_fwalk+0x5c>
8000e998:	02c12083          	lw	ra,44(sp)
8000e99c:	02812403          	lw	s0,40(sp)
8000e9a0:	00090513          	mv	a0,s2
8000e9a4:	02412483          	lw	s1,36(sp)
8000e9a8:	02012903          	lw	s2,32(sp)
8000e9ac:	01c12983          	lw	s3,28(sp)
8000e9b0:	01812a03          	lw	s4,24(sp)
8000e9b4:	01412a83          	lw	s5,20(sp)
8000e9b8:	03010113          	addi	sp,sp,48
8000e9bc:	00008067          	ret
8000e9c0:	00842483          	lw	s1,8(s0)
8000e9c4:	00442983          	lw	s3,4(s0)
8000e9c8:	fff98993          	addi	s3,s3,-1
8000e9cc:	0009d663          	bgez	s3,8000e9d8 <_fwalk+0x74>
8000e9d0:	00042403          	lw	s0,0(s0)
8000e9d4:	fc1ff06f          	j	8000e994 <_fwalk+0x30>
8000e9d8:	00c4d783          	lhu	a5,12(s1)
8000e9dc:	02fa7063          	bgeu	s4,a5,8000e9fc <_fwalk+0x98>
8000e9e0:	00e49783          	lh	a5,14(s1)
8000e9e4:	01578c63          	beq	a5,s5,8000e9fc <_fwalk+0x98>
8000e9e8:	00048513          	mv	a0,s1
8000e9ec:	00b12623          	sw	a1,12(sp)
8000e9f0:	000580e7          	jalr	a1
8000e9f4:	00c12583          	lw	a1,12(sp)
8000e9f8:	00a96933          	or	s2,s2,a0
8000e9fc:	06848493          	addi	s1,s1,104
8000ea00:	fc9ff06f          	j	8000e9c8 <_fwalk+0x64>

Disassembly of section .text._fwalk_reent:

8000ea04 <_fwalk_reent>:
8000ea04:	fd010113          	addi	sp,sp,-48
8000ea08:	02812423          	sw	s0,40(sp)
8000ea0c:	03212023          	sw	s2,32(sp)
8000ea10:	01412c23          	sw	s4,24(sp)
8000ea14:	01512a23          	sw	s5,20(sp)
8000ea18:	01612823          	sw	s6,16(sp)
8000ea1c:	01712623          	sw	s7,12(sp)
8000ea20:	02112623          	sw	ra,44(sp)
8000ea24:	02912223          	sw	s1,36(sp)
8000ea28:	01312e23          	sw	s3,28(sp)
8000ea2c:	00050a13          	mv	s4,a0
8000ea30:	00058a93          	mv	s5,a1
8000ea34:	04850413          	addi	s0,a0,72
8000ea38:	00000913          	li	s2,0
8000ea3c:	00100b13          	li	s6,1
8000ea40:	fff00b93          	li	s7,-1
8000ea44:	02041a63          	bnez	s0,8000ea78 <_fwalk_reent+0x74>
8000ea48:	02c12083          	lw	ra,44(sp)
8000ea4c:	02812403          	lw	s0,40(sp)
8000ea50:	00090513          	mv	a0,s2
8000ea54:	02412483          	lw	s1,36(sp)
8000ea58:	02012903          	lw	s2,32(sp)
8000ea5c:	01c12983          	lw	s3,28(sp)
8000ea60:	01812a03          	lw	s4,24(sp)
8000ea64:	01412a83          	lw	s5,20(sp)
8000ea68:	01012b03          	lw	s6,16(sp)
8000ea6c:	00c12b83          	lw	s7,12(sp)
8000ea70:	03010113          	addi	sp,sp,48
8000ea74:	00008067          	ret
8000ea78:	00842483          	lw	s1,8(s0)
8000ea7c:	00442983          	lw	s3,4(s0)
8000ea80:	fff98993          	addi	s3,s3,-1
8000ea84:	0009d663          	bgez	s3,8000ea90 <_fwalk_reent+0x8c>
8000ea88:	00042403          	lw	s0,0(s0)
8000ea8c:	fb9ff06f          	j	8000ea44 <_fwalk_reent+0x40>
8000ea90:	00c4d783          	lhu	a5,12(s1)
8000ea94:	00fb7e63          	bgeu	s6,a5,8000eab0 <_fwalk_reent+0xac>
8000ea98:	00e49783          	lh	a5,14(s1)
8000ea9c:	01778a63          	beq	a5,s7,8000eab0 <_fwalk_reent+0xac>
8000eaa0:	00048593          	mv	a1,s1
8000eaa4:	000a0513          	mv	a0,s4
8000eaa8:	000a80e7          	jalr	s5
8000eaac:	00a96933          	or	s2,s2,a0
8000eab0:	06848493          	addi	s1,s1,104
8000eab4:	fcdff06f          	j	8000ea80 <_fwalk_reent+0x7c>

Disassembly of section .text.malloc:

8000eab8 <malloc>:
8000eab8:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000eabc:	00050593          	mv	a1,a0
8000eac0:	0007a503          	lw	a0,0(a5)
8000eac4:	2d00006f          	j	8000ed94 <_malloc_r>

Disassembly of section .text.free:

8000eac8 <free>:
8000eac8:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000eacc:	00050593          	mv	a1,a0
8000ead0:	0007a503          	lw	a0,0(a5)
8000ead4:	1bc0006f          	j	8000ec90 <_free_r>

Disassembly of section .text.memcmp:

8000ead8 <memcmp>:
8000ead8:	00000713          	li	a4,0
8000eadc:	00e61663          	bne	a2,a4,8000eae8 <memcmp+0x10>
8000eae0:	00000513          	li	a0,0
8000eae4:	00008067          	ret
8000eae8:	00e507b3          	add	a5,a0,a4
8000eaec:	00170713          	addi	a4,a4,1
8000eaf0:	00e586b3          	add	a3,a1,a4
8000eaf4:	0007c783          	lbu	a5,0(a5)
8000eaf8:	fff6c683          	lbu	a3,-1(a3)
8000eafc:	fed780e3          	beq	a5,a3,8000eadc <memcmp+0x4>
8000eb00:	40d78533          	sub	a0,a5,a3
8000eb04:	00008067          	ret

Disassembly of section .text.memcpy:

8000eb08 <memcpy>:
8000eb08:	00a5c7b3          	xor	a5,a1,a0
8000eb0c:	0037f793          	andi	a5,a5,3
8000eb10:	00c50733          	add	a4,a0,a2
8000eb14:	00079663          	bnez	a5,8000eb20 <memcpy+0x18>
8000eb18:	00300793          	li	a5,3
8000eb1c:	02c7e263          	bltu	a5,a2,8000eb40 <memcpy+0x38>
8000eb20:	00050793          	mv	a5,a0
8000eb24:	0ae57c63          	bgeu	a0,a4,8000ebdc <memcpy+0xd4>
8000eb28:	0005c683          	lbu	a3,0(a1)
8000eb2c:	00178793          	addi	a5,a5,1
8000eb30:	00158593          	addi	a1,a1,1
8000eb34:	fed78fa3          	sb	a3,-1(a5)
8000eb38:	fee7e8e3          	bltu	a5,a4,8000eb28 <memcpy+0x20>
8000eb3c:	00008067          	ret
8000eb40:	00357693          	andi	a3,a0,3
8000eb44:	00050793          	mv	a5,a0
8000eb48:	00068e63          	beqz	a3,8000eb64 <memcpy+0x5c>
8000eb4c:	0005c683          	lbu	a3,0(a1)
8000eb50:	00178793          	addi	a5,a5,1
8000eb54:	00158593          	addi	a1,a1,1
8000eb58:	fed78fa3          	sb	a3,-1(a5)
8000eb5c:	0037f693          	andi	a3,a5,3
8000eb60:	fe9ff06f          	j	8000eb48 <memcpy+0x40>
8000eb64:	ffc77693          	andi	a3,a4,-4
8000eb68:	fe068613          	addi	a2,a3,-32
8000eb6c:	06c7f463          	bgeu	a5,a2,8000ebd4 <memcpy+0xcc>
8000eb70:	0005a383          	lw	t2,0(a1)
8000eb74:	0045a283          	lw	t0,4(a1)
8000eb78:	0085af83          	lw	t6,8(a1)
8000eb7c:	00c5af03          	lw	t5,12(a1)
8000eb80:	0105ae83          	lw	t4,16(a1)
8000eb84:	0145ae03          	lw	t3,20(a1)
8000eb88:	0185a303          	lw	t1,24(a1)
8000eb8c:	01c5a883          	lw	a7,28(a1)
8000eb90:	02458593          	addi	a1,a1,36
8000eb94:	0077a023          	sw	t2,0(a5)
8000eb98:	ffc5a803          	lw	a6,-4(a1)
8000eb9c:	0057a223          	sw	t0,4(a5)
8000eba0:	01f7a423          	sw	t6,8(a5)
8000eba4:	01e7a623          	sw	t5,12(a5)
8000eba8:	01d7a823          	sw	t4,16(a5)
8000ebac:	01c7aa23          	sw	t3,20(a5)
8000ebb0:	0067ac23          	sw	t1,24(a5)
8000ebb4:	0117ae23          	sw	a7,28(a5)
8000ebb8:	02478793          	addi	a5,a5,36
8000ebbc:	ff07ae23          	sw	a6,-4(a5)
8000ebc0:	fadff06f          	j	8000eb6c <memcpy+0x64>
8000ebc4:	0005a603          	lw	a2,0(a1)
8000ebc8:	00478793          	addi	a5,a5,4
8000ebcc:	00458593          	addi	a1,a1,4
8000ebd0:	fec7ae23          	sw	a2,-4(a5)
8000ebd4:	fed7e8e3          	bltu	a5,a3,8000ebc4 <memcpy+0xbc>
8000ebd8:	f4e7e8e3          	bltu	a5,a4,8000eb28 <memcpy+0x20>
8000ebdc:	00008067          	ret

Disassembly of section .text.memmove:

8000ebe0 <memmove>:
8000ebe0:	04a5fa63          	bgeu	a1,a0,8000ec34 <memmove+0x54>
8000ebe4:	00c586b3          	add	a3,a1,a2
8000ebe8:	04d57663          	bgeu	a0,a3,8000ec34 <memmove+0x54>
8000ebec:	fff64593          	not	a1,a2
8000ebf0:	00000793          	li	a5,0
8000ebf4:	fff78793          	addi	a5,a5,-1
8000ebf8:	00f59463          	bne	a1,a5,8000ec00 <memmove+0x20>
8000ebfc:	00008067          	ret
8000ec00:	00f68733          	add	a4,a3,a5
8000ec04:	00074803          	lbu	a6,0(a4)
8000ec08:	00c78733          	add	a4,a5,a2
8000ec0c:	00e50733          	add	a4,a0,a4
8000ec10:	01070023          	sb	a6,0(a4)
8000ec14:	fe1ff06f          	j	8000ebf4 <memmove+0x14>
8000ec18:	00f58733          	add	a4,a1,a5
8000ec1c:	00074683          	lbu	a3,0(a4)
8000ec20:	00f50733          	add	a4,a0,a5
8000ec24:	00178793          	addi	a5,a5,1
8000ec28:	00d70023          	sb	a3,0(a4)
8000ec2c:	fef616e3          	bne	a2,a5,8000ec18 <memmove+0x38>
8000ec30:	00008067          	ret
8000ec34:	00000793          	li	a5,0
8000ec38:	ff5ff06f          	j	8000ec2c <memmove+0x4c>

Disassembly of section .text._calloc_r:

8000ec3c <_calloc_r>:
8000ec3c:	fe010113          	addi	sp,sp,-32
8000ec40:	00812c23          	sw	s0,24(sp)
8000ec44:	00050413          	mv	s0,a0
8000ec48:	00058513          	mv	a0,a1
8000ec4c:	00060593          	mv	a1,a2
8000ec50:	00112e23          	sw	ra,28(sp)
8000ec54:	fe9fe0ef          	jal	ra,8000dc3c <__mulsi3>
8000ec58:	00050593          	mv	a1,a0
8000ec5c:	00a12623          	sw	a0,12(sp)
8000ec60:	00040513          	mv	a0,s0
8000ec64:	130000ef          	jal	ra,8000ed94 <_malloc_r>
8000ec68:	00050413          	mv	s0,a0
8000ec6c:	00050863          	beqz	a0,8000ec7c <_calloc_r+0x40>
8000ec70:	00c12603          	lw	a2,12(sp)
8000ec74:	00000593          	li	a1,0
8000ec78:	8e1fe0ef          	jal	ra,8000d558 <memset>
8000ec7c:	00040513          	mv	a0,s0
8000ec80:	01c12083          	lw	ra,28(sp)
8000ec84:	01812403          	lw	s0,24(sp)
8000ec88:	02010113          	addi	sp,sp,32
8000ec8c:	00008067          	ret

Disassembly of section .text._free_r:

8000ec90 <_free_r>:
8000ec90:	10058063          	beqz	a1,8000ed90 <_free_r+0x100>
8000ec94:	ffc5a783          	lw	a5,-4(a1)
8000ec98:	ff010113          	addi	sp,sp,-16
8000ec9c:	00812423          	sw	s0,8(sp)
8000eca0:	00112623          	sw	ra,12(sp)
8000eca4:	00912223          	sw	s1,4(sp)
8000eca8:	ffc58413          	addi	s0,a1,-4
8000ecac:	0007d463          	bgez	a5,8000ecb4 <_free_r+0x24>
8000ecb0:	00f40433          	add	s0,s0,a5
8000ecb4:	00050493          	mv	s1,a0
8000ecb8:	fc8f70ef          	jal	ra,80006480 <__malloc_lock>
8000ecbc:	91c18793          	addi	a5,gp,-1764 # 8000338c <__malloc_free_list>
8000ecc0:	0007a783          	lw	a5,0(a5)
8000ecc4:	02079263          	bnez	a5,8000ece8 <_free_r+0x58>
8000ecc8:	00042223          	sw	zero,4(s0)
8000eccc:	9081ae23          	sw	s0,-1764(gp) # 8000338c <__malloc_free_list>
8000ecd0:	00812403          	lw	s0,8(sp)
8000ecd4:	00c12083          	lw	ra,12(sp)
8000ecd8:	00048513          	mv	a0,s1
8000ecdc:	00412483          	lw	s1,4(sp)
8000ece0:	01010113          	addi	sp,sp,16
8000ece4:	fa0f706f          	j	80006484 <__malloc_unlock>
8000ece8:	02f47663          	bgeu	s0,a5,8000ed14 <_free_r+0x84>
8000ecec:	00042683          	lw	a3,0(s0)
8000ecf0:	00d40733          	add	a4,s0,a3
8000ecf4:	00e79a63          	bne	a5,a4,8000ed08 <_free_r+0x78>
8000ecf8:	0007a703          	lw	a4,0(a5)
8000ecfc:	0047a783          	lw	a5,4(a5)
8000ed00:	00d70733          	add	a4,a4,a3
8000ed04:	00e42023          	sw	a4,0(s0)
8000ed08:	00f42223          	sw	a5,4(s0)
8000ed0c:	fc1ff06f          	j	8000eccc <_free_r+0x3c>
8000ed10:	00070793          	mv	a5,a4
8000ed14:	0047a703          	lw	a4,4(a5)
8000ed18:	00070463          	beqz	a4,8000ed20 <_free_r+0x90>
8000ed1c:	fee47ae3          	bgeu	s0,a4,8000ed10 <_free_r+0x80>
8000ed20:	0007a683          	lw	a3,0(a5)
8000ed24:	00d78633          	add	a2,a5,a3
8000ed28:	02861863          	bne	a2,s0,8000ed58 <_free_r+0xc8>
8000ed2c:	00042603          	lw	a2,0(s0)
8000ed30:	00c686b3          	add	a3,a3,a2
8000ed34:	00d7a023          	sw	a3,0(a5)
8000ed38:	00d78633          	add	a2,a5,a3
8000ed3c:	f8c71ae3          	bne	a4,a2,8000ecd0 <_free_r+0x40>
8000ed40:	00072603          	lw	a2,0(a4)
8000ed44:	00472703          	lw	a4,4(a4)
8000ed48:	00d606b3          	add	a3,a2,a3
8000ed4c:	00d7a023          	sw	a3,0(a5)
8000ed50:	00e7a223          	sw	a4,4(a5)
8000ed54:	f7dff06f          	j	8000ecd0 <_free_r+0x40>
8000ed58:	00c47863          	bgeu	s0,a2,8000ed68 <_free_r+0xd8>
8000ed5c:	00c00793          	li	a5,12
8000ed60:	00f4a023          	sw	a5,0(s1)
8000ed64:	f6dff06f          	j	8000ecd0 <_free_r+0x40>
8000ed68:	00042603          	lw	a2,0(s0)
8000ed6c:	00c406b3          	add	a3,s0,a2
8000ed70:	00d71a63          	bne	a4,a3,8000ed84 <_free_r+0xf4>
8000ed74:	00072683          	lw	a3,0(a4)
8000ed78:	00472703          	lw	a4,4(a4)
8000ed7c:	00c686b3          	add	a3,a3,a2
8000ed80:	00d42023          	sw	a3,0(s0)
8000ed84:	00e42223          	sw	a4,4(s0)
8000ed88:	0087a223          	sw	s0,4(a5)
8000ed8c:	f45ff06f          	j	8000ecd0 <_free_r+0x40>
8000ed90:	00008067          	ret

Disassembly of section .text._malloc_r:

8000ed94 <_malloc_r>:
8000ed94:	fe010113          	addi	sp,sp,-32
8000ed98:	00912a23          	sw	s1,20(sp)
8000ed9c:	00358493          	addi	s1,a1,3
8000eda0:	ffc4f493          	andi	s1,s1,-4
8000eda4:	00112e23          	sw	ra,28(sp)
8000eda8:	00812c23          	sw	s0,24(sp)
8000edac:	01212823          	sw	s2,16(sp)
8000edb0:	01312623          	sw	s3,12(sp)
8000edb4:	00848493          	addi	s1,s1,8
8000edb8:	00c00793          	li	a5,12
8000edbc:	06f4f463          	bgeu	s1,a5,8000ee24 <_malloc_r+0x90>
8000edc0:	00c00493          	li	s1,12
8000edc4:	06b4e263          	bltu	s1,a1,8000ee28 <_malloc_r+0x94>
8000edc8:	00050913          	mv	s2,a0
8000edcc:	eb4f70ef          	jal	ra,80006480 <__malloc_lock>
8000edd0:	91c18793          	addi	a5,gp,-1764 # 8000338c <__malloc_free_list>
8000edd4:	0007a703          	lw	a4,0(a5)
8000edd8:	00070413          	mv	s0,a4
8000eddc:	06041a63          	bnez	s0,8000ee50 <_malloc_r+0xbc>
8000ede0:	92018793          	addi	a5,gp,-1760 # 80003390 <__malloc_sbrk_start>
8000ede4:	0007a783          	lw	a5,0(a5)
8000ede8:	00079a63          	bnez	a5,8000edfc <_malloc_r+0x68>
8000edec:	00000593          	li	a1,0
8000edf0:	00090513          	mv	a0,s2
8000edf4:	330000ef          	jal	ra,8000f124 <_sbrk_r>
8000edf8:	92a1a023          	sw	a0,-1760(gp) # 80003390 <__malloc_sbrk_start>
8000edfc:	00048593          	mv	a1,s1
8000ee00:	00090513          	mv	a0,s2
8000ee04:	320000ef          	jal	ra,8000f124 <_sbrk_r>
8000ee08:	fff00993          	li	s3,-1
8000ee0c:	0b351a63          	bne	a0,s3,8000eec0 <_malloc_r+0x12c>
8000ee10:	00c00793          	li	a5,12
8000ee14:	00f92023          	sw	a5,0(s2)
8000ee18:	00090513          	mv	a0,s2
8000ee1c:	e68f70ef          	jal	ra,80006484 <__malloc_unlock>
8000ee20:	0100006f          	j	8000ee30 <_malloc_r+0x9c>
8000ee24:	fa04d0e3          	bgez	s1,8000edc4 <_malloc_r+0x30>
8000ee28:	00c00793          	li	a5,12
8000ee2c:	00f52023          	sw	a5,0(a0)
8000ee30:	00000513          	li	a0,0
8000ee34:	01c12083          	lw	ra,28(sp)
8000ee38:	01812403          	lw	s0,24(sp)
8000ee3c:	01412483          	lw	s1,20(sp)
8000ee40:	01012903          	lw	s2,16(sp)
8000ee44:	00c12983          	lw	s3,12(sp)
8000ee48:	02010113          	addi	sp,sp,32
8000ee4c:	00008067          	ret
8000ee50:	00042783          	lw	a5,0(s0)
8000ee54:	409787b3          	sub	a5,a5,s1
8000ee58:	0407ce63          	bltz	a5,8000eeb4 <_malloc_r+0x120>
8000ee5c:	00b00693          	li	a3,11
8000ee60:	00f6fa63          	bgeu	a3,a5,8000ee74 <_malloc_r+0xe0>
8000ee64:	00f42023          	sw	a5,0(s0)
8000ee68:	00f40433          	add	s0,s0,a5
8000ee6c:	00942023          	sw	s1,0(s0)
8000ee70:	0100006f          	j	8000ee80 <_malloc_r+0xec>
8000ee74:	00442783          	lw	a5,4(s0)
8000ee78:	02871a63          	bne	a4,s0,8000eeac <_malloc_r+0x118>
8000ee7c:	90f1ae23          	sw	a5,-1764(gp) # 8000338c <__malloc_free_list>
8000ee80:	00090513          	mv	a0,s2
8000ee84:	e00f70ef          	jal	ra,80006484 <__malloc_unlock>
8000ee88:	00b40513          	addi	a0,s0,11
8000ee8c:	00440793          	addi	a5,s0,4
8000ee90:	ff857513          	andi	a0,a0,-8
8000ee94:	40f50733          	sub	a4,a0,a5
8000ee98:	f8070ee3          	beqz	a4,8000ee34 <_malloc_r+0xa0>
8000ee9c:	00e40433          	add	s0,s0,a4
8000eea0:	40a787b3          	sub	a5,a5,a0
8000eea4:	00f42023          	sw	a5,0(s0)
8000eea8:	f8dff06f          	j	8000ee34 <_malloc_r+0xa0>
8000eeac:	00f72223          	sw	a5,4(a4)
8000eeb0:	fd1ff06f          	j	8000ee80 <_malloc_r+0xec>
8000eeb4:	00040713          	mv	a4,s0
8000eeb8:	00442403          	lw	s0,4(s0)
8000eebc:	f21ff06f          	j	8000eddc <_malloc_r+0x48>
8000eec0:	00350413          	addi	s0,a0,3
8000eec4:	ffc47413          	andi	s0,s0,-4
8000eec8:	fa8502e3          	beq	a0,s0,8000ee6c <_malloc_r+0xd8>
8000eecc:	40a405b3          	sub	a1,s0,a0
8000eed0:	00090513          	mv	a0,s2
8000eed4:	250000ef          	jal	ra,8000f124 <_sbrk_r>
8000eed8:	f9351ae3          	bne	a0,s3,8000ee6c <_malloc_r+0xd8>
8000eedc:	f35ff06f          	j	8000ee10 <_malloc_r+0x7c>

Disassembly of section .text._printf_r:

8000eee0 <_iprintf_r>:
8000eee0:	fb010113          	addi	sp,sp,-80
8000eee4:	02812423          	sw	s0,40(sp)
8000eee8:	02112623          	sw	ra,44(sp)
8000eeec:	02c12c23          	sw	a2,56(sp)
8000eef0:	02d12e23          	sw	a3,60(sp)
8000eef4:	04e12023          	sw	a4,64(sp)
8000eef8:	04f12223          	sw	a5,68(sp)
8000eefc:	05012423          	sw	a6,72(sp)
8000ef00:	05112623          	sw	a7,76(sp)
8000ef04:	00050413          	mv	s0,a0
8000ef08:	00050c63          	beqz	a0,8000ef20 <_iprintf_r+0x40>
8000ef0c:	01852783          	lw	a5,24(a0)
8000ef10:	00079863          	bnez	a5,8000ef20 <_iprintf_r+0x40>
8000ef14:	00b12623          	sw	a1,12(sp)
8000ef18:	f7cff0ef          	jal	ra,8000e694 <__sinit>
8000ef1c:	00c12583          	lw	a1,12(sp)
8000ef20:	00058613          	mv	a2,a1
8000ef24:	00842583          	lw	a1,8(s0)
8000ef28:	03810693          	addi	a3,sp,56
8000ef2c:	00040513          	mv	a0,s0
8000ef30:	00d12e23          	sw	a3,28(sp)
8000ef34:	2b5010ef          	jal	ra,800109e8 <_vfiprintf_r>
8000ef38:	02c12083          	lw	ra,44(sp)
8000ef3c:	02812403          	lw	s0,40(sp)
8000ef40:	05010113          	addi	sp,sp,80
8000ef44:	00008067          	ret

Disassembly of section .text.printf:

8000ef48 <iprintf>:
8000ef48:	fc010113          	addi	sp,sp,-64
8000ef4c:	02f12a23          	sw	a5,52(sp)
8000ef50:	02b12223          	sw	a1,36(sp)
8000ef54:	02c12423          	sw	a2,40(sp)
8000ef58:	02d12623          	sw	a3,44(sp)
8000ef5c:	02e12823          	sw	a4,48(sp)
8000ef60:	03012c23          	sw	a6,56(sp)
8000ef64:	03112e23          	sw	a7,60(sp)
8000ef68:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000ef6c:	00812c23          	sw	s0,24(sp)
8000ef70:	0007a403          	lw	s0,0(a5)
8000ef74:	00912a23          	sw	s1,20(sp)
8000ef78:	00112e23          	sw	ra,28(sp)
8000ef7c:	00050493          	mv	s1,a0
8000ef80:	00040a63          	beqz	s0,8000ef94 <iprintf+0x4c>
8000ef84:	01842783          	lw	a5,24(s0)
8000ef88:	00079663          	bnez	a5,8000ef94 <iprintf+0x4c>
8000ef8c:	00040513          	mv	a0,s0
8000ef90:	f04ff0ef          	jal	ra,8000e694 <__sinit>
8000ef94:	00842583          	lw	a1,8(s0)
8000ef98:	02410693          	addi	a3,sp,36
8000ef9c:	00048613          	mv	a2,s1
8000efa0:	00040513          	mv	a0,s0
8000efa4:	00d12623          	sw	a3,12(sp)
8000efa8:	241010ef          	jal	ra,800109e8 <_vfiprintf_r>
8000efac:	01c12083          	lw	ra,28(sp)
8000efb0:	01812403          	lw	s0,24(sp)
8000efb4:	01412483          	lw	s1,20(sp)
8000efb8:	04010113          	addi	sp,sp,64
8000efbc:	00008067          	ret

Disassembly of section .text._putchar_r:

8000efc0 <_putchar_r>:
8000efc0:	fe010113          	addi	sp,sp,-32
8000efc4:	00812c23          	sw	s0,24(sp)
8000efc8:	00112e23          	sw	ra,28(sp)
8000efcc:	00050413          	mv	s0,a0
8000efd0:	00050c63          	beqz	a0,8000efe8 <_putchar_r+0x28>
8000efd4:	01852783          	lw	a5,24(a0)
8000efd8:	00079863          	bnez	a5,8000efe8 <_putchar_r+0x28>
8000efdc:	00b12623          	sw	a1,12(sp)
8000efe0:	eb4ff0ef          	jal	ra,8000e694 <__sinit>
8000efe4:	00c12583          	lw	a1,12(sp)
8000efe8:	00842603          	lw	a2,8(s0)
8000efec:	00040513          	mv	a0,s0
8000eff0:	01812403          	lw	s0,24(sp)
8000eff4:	01c12083          	lw	ra,28(sp)
8000eff8:	02010113          	addi	sp,sp,32
8000effc:	0500006f          	j	8000f04c <_putc_r>

Disassembly of section .text.putchar:

8000f000 <putchar>:
8000f000:	fe010113          	addi	sp,sp,-32
8000f004:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000f008:	00812c23          	sw	s0,24(sp)
8000f00c:	0007a403          	lw	s0,0(a5)
8000f010:	00112e23          	sw	ra,28(sp)
8000f014:	00050593          	mv	a1,a0
8000f018:	00040e63          	beqz	s0,8000f034 <putchar+0x34>
8000f01c:	01842783          	lw	a5,24(s0)
8000f020:	00079a63          	bnez	a5,8000f034 <putchar+0x34>
8000f024:	00a12623          	sw	a0,12(sp)
8000f028:	00040513          	mv	a0,s0
8000f02c:	e68ff0ef          	jal	ra,8000e694 <__sinit>
8000f030:	00c12583          	lw	a1,12(sp)
8000f034:	00842603          	lw	a2,8(s0)
8000f038:	00040513          	mv	a0,s0
8000f03c:	01812403          	lw	s0,24(sp)
8000f040:	01c12083          	lw	ra,28(sp)
8000f044:	02010113          	addi	sp,sp,32
8000f048:	0040006f          	j	8000f04c <_putc_r>

Disassembly of section .text._putc_r:

8000f04c <_putc_r>:
8000f04c:	fe010113          	addi	sp,sp,-32
8000f050:	00812c23          	sw	s0,24(sp)
8000f054:	00112e23          	sw	ra,28(sp)
8000f058:	00050413          	mv	s0,a0
8000f05c:	02050063          	beqz	a0,8000f07c <_putc_r+0x30>
8000f060:	01852783          	lw	a5,24(a0)
8000f064:	00079c63          	bnez	a5,8000f07c <_putc_r+0x30>
8000f068:	00c12623          	sw	a2,12(sp)
8000f06c:	00b12423          	sw	a1,8(sp)
8000f070:	e24ff0ef          	jal	ra,8000e694 <__sinit>
8000f074:	00c12603          	lw	a2,12(sp)
8000f078:	00812583          	lw	a1,8(sp)
8000f07c:	ffff4797          	auipc	a5,0xffff4
8000f080:	fe878793          	addi	a5,a5,-24 # 80003064 <__sf_fake_stdin>
8000f084:	04f61063          	bne	a2,a5,8000f0c4 <_putc_r+0x78>
8000f088:	00442603          	lw	a2,4(s0)
8000f08c:	00862783          	lw	a5,8(a2)
8000f090:	fff78793          	addi	a5,a5,-1
8000f094:	00f62423          	sw	a5,8(a2)
8000f098:	0407da63          	bgez	a5,8000f0ec <_putc_r+0xa0>
8000f09c:	01862703          	lw	a4,24(a2)
8000f0a0:	00e7c863          	blt	a5,a4,8000f0b0 <_putc_r+0x64>
8000f0a4:	0ff5f793          	andi	a5,a1,255
8000f0a8:	00a00713          	li	a4,10
8000f0ac:	04e79063          	bne	a5,a4,8000f0ec <_putc_r+0xa0>
8000f0b0:	00040513          	mv	a0,s0
8000f0b4:	01812403          	lw	s0,24(sp)
8000f0b8:	01c12083          	lw	ra,28(sp)
8000f0bc:	02010113          	addi	sp,sp,32
8000f0c0:	6bc0006f          	j	8000f77c <__swbuf_r>
8000f0c4:	ffff4797          	auipc	a5,0xffff4
8000f0c8:	fc078793          	addi	a5,a5,-64 # 80003084 <__sf_fake_stdout>
8000f0cc:	00f61663          	bne	a2,a5,8000f0d8 <_putc_r+0x8c>
8000f0d0:	00842603          	lw	a2,8(s0)
8000f0d4:	fb9ff06f          	j	8000f08c <_putc_r+0x40>
8000f0d8:	ffff4797          	auipc	a5,0xffff4
8000f0dc:	f6c78793          	addi	a5,a5,-148 # 80003044 <__sf_fake_stderr>
8000f0e0:	faf616e3          	bne	a2,a5,8000f08c <_putc_r+0x40>
8000f0e4:	00c42603          	lw	a2,12(s0)
8000f0e8:	fa5ff06f          	j	8000f08c <_putc_r+0x40>
8000f0ec:	00062783          	lw	a5,0(a2)
8000f0f0:	0ff5f513          	andi	a0,a1,255
8000f0f4:	00178713          	addi	a4,a5,1
8000f0f8:	00e62023          	sw	a4,0(a2)
8000f0fc:	00b78023          	sb	a1,0(a5)
8000f100:	01c12083          	lw	ra,28(sp)
8000f104:	01812403          	lw	s0,24(sp)
8000f108:	02010113          	addi	sp,sp,32
8000f10c:	00008067          	ret

Disassembly of section .text.putc:

8000f110 <putc>:
8000f110:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000f114:	00058613          	mv	a2,a1
8000f118:	00050593          	mv	a1,a0
8000f11c:	0007a503          	lw	a0,0(a5)
8000f120:	f2dff06f          	j	8000f04c <_putc_r>

Disassembly of section .text._sbrk_r:

8000f124 <_sbrk_r>:
8000f124:	ff010113          	addi	sp,sp,-16
8000f128:	00812423          	sw	s0,8(sp)
8000f12c:	00050413          	mv	s0,a0
8000f130:	00058513          	mv	a0,a1
8000f134:	c601a623          	sw	zero,-916(gp) # 800036dc <errno>
8000f138:	00112623          	sw	ra,12(sp)
8000f13c:	bfcf70ef          	jal	ra,80006538 <_sbrk>
8000f140:	fff00793          	li	a5,-1
8000f144:	00f51a63          	bne	a0,a5,8000f158 <_sbrk_r+0x34>
8000f148:	c6c18793          	addi	a5,gp,-916 # 800036dc <errno>
8000f14c:	0007a783          	lw	a5,0(a5)
8000f150:	00078463          	beqz	a5,8000f158 <_sbrk_r+0x34>
8000f154:	00f42023          	sw	a5,0(s0)
8000f158:	00c12083          	lw	ra,12(sp)
8000f15c:	00812403          	lw	s0,8(sp)
8000f160:	01010113          	addi	sp,sp,16
8000f164:	00008067          	ret

Disassembly of section .text._snprintf_r:

8000f168 <_sniprintf_r>:
8000f168:	f7010113          	addi	sp,sp,-144
8000f16c:	06112e23          	sw	ra,124(sp)
8000f170:	06812c23          	sw	s0,120(sp)
8000f174:	06912a23          	sw	s1,116(sp)
8000f178:	07212823          	sw	s2,112(sp)
8000f17c:	08e12023          	sw	a4,128(sp)
8000f180:	08f12223          	sw	a5,132(sp)
8000f184:	09012423          	sw	a6,136(sp)
8000f188:	09112623          	sw	a7,140(sp)
8000f18c:	02065463          	bgez	a2,8000f1b4 <_sniprintf_r+0x4c>
8000f190:	08b00793          	li	a5,139
8000f194:	00f52023          	sw	a5,0(a0)
8000f198:	fff00513          	li	a0,-1
8000f19c:	07c12083          	lw	ra,124(sp)
8000f1a0:	07812403          	lw	s0,120(sp)
8000f1a4:	07412483          	lw	s1,116(sp)
8000f1a8:	07012903          	lw	s2,112(sp)
8000f1ac:	09010113          	addi	sp,sp,144
8000f1b0:	00008067          	ret
8000f1b4:	20800793          	li	a5,520
8000f1b8:	00f11a23          	sh	a5,20(sp)
8000f1bc:	00b12423          	sw	a1,8(sp)
8000f1c0:	00b12c23          	sw	a1,24(sp)
8000f1c4:	00060413          	mv	s0,a2
8000f1c8:	00000793          	li	a5,0
8000f1cc:	00060463          	beqz	a2,8000f1d4 <_sniprintf_r+0x6c>
8000f1d0:	fff60793          	addi	a5,a2,-1
8000f1d4:	fff00913          	li	s2,-1
8000f1d8:	00068613          	mv	a2,a3
8000f1dc:	00810593          	addi	a1,sp,8
8000f1e0:	08010693          	addi	a3,sp,128
8000f1e4:	00050493          	mv	s1,a0
8000f1e8:	00f12823          	sw	a5,16(sp)
8000f1ec:	00f12e23          	sw	a5,28(sp)
8000f1f0:	01211b23          	sh	s2,22(sp)
8000f1f4:	00d12223          	sw	a3,4(sp)
8000f1f8:	5cd000ef          	jal	ra,8000ffc4 <_svfiprintf_r>
8000f1fc:	01255663          	bge	a0,s2,8000f208 <_sniprintf_r+0xa0>
8000f200:	08b00793          	li	a5,139
8000f204:	00f4a023          	sw	a5,0(s1)
8000f208:	f8040ae3          	beqz	s0,8000f19c <_sniprintf_r+0x34>
8000f20c:	00812783          	lw	a5,8(sp)
8000f210:	00078023          	sb	zero,0(a5)
8000f214:	f89ff06f          	j	8000f19c <_sniprintf_r+0x34>

Disassembly of section .text.snprintf:

8000f218 <sniprintf>:
8000f218:	f6010113          	addi	sp,sp,-160
8000f21c:	08f12a23          	sw	a5,148(sp)
8000f220:	06912a23          	sw	s1,116(sp)
8000f224:	08d12623          	sw	a3,140(sp)
8000f228:	08e12823          	sw	a4,144(sp)
8000f22c:	09012c23          	sw	a6,152(sp)
8000f230:	09112e23          	sw	a7,156(sp)
8000f234:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000f238:	06112e23          	sw	ra,124(sp)
8000f23c:	06812c23          	sw	s0,120(sp)
8000f240:	07212823          	sw	s2,112(sp)
8000f244:	0007a483          	lw	s1,0(a5)
8000f248:	0205d463          	bgez	a1,8000f270 <sniprintf+0x58>
8000f24c:	08b00793          	li	a5,139
8000f250:	00f4a023          	sw	a5,0(s1)
8000f254:	fff00513          	li	a0,-1
8000f258:	07c12083          	lw	ra,124(sp)
8000f25c:	07812403          	lw	s0,120(sp)
8000f260:	07412483          	lw	s1,116(sp)
8000f264:	07012903          	lw	s2,112(sp)
8000f268:	0a010113          	addi	sp,sp,160
8000f26c:	00008067          	ret
8000f270:	20800793          	li	a5,520
8000f274:	00f11a23          	sh	a5,20(sp)
8000f278:	00a12423          	sw	a0,8(sp)
8000f27c:	00a12c23          	sw	a0,24(sp)
8000f280:	00000793          	li	a5,0
8000f284:	00058463          	beqz	a1,8000f28c <sniprintf+0x74>
8000f288:	fff58793          	addi	a5,a1,-1
8000f28c:	fff00913          	li	s2,-1
8000f290:	00058413          	mv	s0,a1
8000f294:	08c10693          	addi	a3,sp,140
8000f298:	00810593          	addi	a1,sp,8
8000f29c:	00048513          	mv	a0,s1
8000f2a0:	00f12823          	sw	a5,16(sp)
8000f2a4:	00f12e23          	sw	a5,28(sp)
8000f2a8:	01211b23          	sh	s2,22(sp)
8000f2ac:	00d12223          	sw	a3,4(sp)
8000f2b0:	515000ef          	jal	ra,8000ffc4 <_svfiprintf_r>
8000f2b4:	01255663          	bge	a0,s2,8000f2c0 <sniprintf+0xa8>
8000f2b8:	08b00793          	li	a5,139
8000f2bc:	00f4a023          	sw	a5,0(s1)
8000f2c0:	f8040ce3          	beqz	s0,8000f258 <sniprintf+0x40>
8000f2c4:	00812783          	lw	a5,8(sp)
8000f2c8:	00078023          	sb	zero,0(a5)
8000f2cc:	f8dff06f          	j	8000f258 <sniprintf+0x40>

Disassembly of section .text._sprintf_r:

8000f2d0 <_siprintf_r>:
8000f2d0:	f6010113          	addi	sp,sp,-160
8000f2d4:	08f12a23          	sw	a5,148(sp)
8000f2d8:	800007b7          	lui	a5,0x80000
8000f2dc:	fff7c793          	not	a5,a5
8000f2e0:	00f12e23          	sw	a5,28(sp)
8000f2e4:	00f12823          	sw	a5,16(sp)
8000f2e8:	ffff07b7          	lui	a5,0xffff0
8000f2ec:	08d12623          	sw	a3,140(sp)
8000f2f0:	00b12423          	sw	a1,8(sp)
8000f2f4:	00b12c23          	sw	a1,24(sp)
8000f2f8:	20878793          	addi	a5,a5,520 # ffff0208 <_ram_heap_end+0x7ffd8208>
8000f2fc:	08c10693          	addi	a3,sp,140
8000f300:	00810593          	addi	a1,sp,8
8000f304:	06112e23          	sw	ra,124(sp)
8000f308:	00f12a23          	sw	a5,20(sp)
8000f30c:	08e12823          	sw	a4,144(sp)
8000f310:	09012c23          	sw	a6,152(sp)
8000f314:	09112e23          	sw	a7,156(sp)
8000f318:	00d12223          	sw	a3,4(sp)
8000f31c:	4a9000ef          	jal	ra,8000ffc4 <_svfiprintf_r>
8000f320:	00812783          	lw	a5,8(sp)
8000f324:	00078023          	sb	zero,0(a5)
8000f328:	07c12083          	lw	ra,124(sp)
8000f32c:	0a010113          	addi	sp,sp,160
8000f330:	00008067          	ret

Disassembly of section .text.sprintf:

8000f334 <siprintf>:
8000f334:	f6010113          	addi	sp,sp,-160
8000f338:	08f12a23          	sw	a5,148(sp)
8000f33c:	800007b7          	lui	a5,0x80000
8000f340:	fff7c793          	not	a5,a5
8000f344:	00f12e23          	sw	a5,28(sp)
8000f348:	00f12823          	sw	a5,16(sp)
8000f34c:	ffff07b7          	lui	a5,0xffff0
8000f350:	20878793          	addi	a5,a5,520 # ffff0208 <_ram_heap_end+0x7ffd8208>
8000f354:	08c12423          	sw	a2,136(sp)
8000f358:	08d12623          	sw	a3,140(sp)
8000f35c:	08e12823          	sw	a4,144(sp)
8000f360:	09012c23          	sw	a6,152(sp)
8000f364:	09112e23          	sw	a7,156(sp)
8000f368:	00f12a23          	sw	a5,20(sp)
8000f36c:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000f370:	00a12423          	sw	a0,8(sp)
8000f374:	00a12c23          	sw	a0,24(sp)
8000f378:	0007a503          	lw	a0,0(a5)
8000f37c:	08810693          	addi	a3,sp,136
8000f380:	00058613          	mv	a2,a1
8000f384:	00810593          	addi	a1,sp,8
8000f388:	06112e23          	sw	ra,124(sp)
8000f38c:	00d12223          	sw	a3,4(sp)
8000f390:	435000ef          	jal	ra,8000ffc4 <_svfiprintf_r>
8000f394:	00812783          	lw	a5,8(sp)
8000f398:	00078023          	sb	zero,0(a5)
8000f39c:	07c12083          	lw	ra,124(sp)
8000f3a0:	0a010113          	addi	sp,sp,160
8000f3a4:	00008067          	ret

Disassembly of section .text.__sread:

8000f3a8 <__sread>:
8000f3a8:	ff010113          	addi	sp,sp,-16
8000f3ac:	00812423          	sw	s0,8(sp)
8000f3b0:	00058413          	mv	s0,a1
8000f3b4:	00e59583          	lh	a1,14(a1)
8000f3b8:	00112623          	sw	ra,12(sp)
8000f3bc:	219010ef          	jal	ra,80010dd4 <_read_r>
8000f3c0:	02054063          	bltz	a0,8000f3e0 <__sread+0x38>
8000f3c4:	05442783          	lw	a5,84(s0)
8000f3c8:	00a787b3          	add	a5,a5,a0
8000f3cc:	04f42a23          	sw	a5,84(s0)
8000f3d0:	00c12083          	lw	ra,12(sp)
8000f3d4:	00812403          	lw	s0,8(sp)
8000f3d8:	01010113          	addi	sp,sp,16
8000f3dc:	00008067          	ret
8000f3e0:	00c45783          	lhu	a5,12(s0)
8000f3e4:	fffff737          	lui	a4,0xfffff
8000f3e8:	fff70713          	addi	a4,a4,-1 # ffffefff <_ram_heap_end+0x7ffe6fff>
8000f3ec:	00e7f7b3          	and	a5,a5,a4
8000f3f0:	00f41623          	sh	a5,12(s0)
8000f3f4:	fddff06f          	j	8000f3d0 <__sread+0x28>

Disassembly of section .text.__seofread:

8000f3f8 <__seofread>:
8000f3f8:	00000513          	li	a0,0
8000f3fc:	00008067          	ret

Disassembly of section .text.__swrite:

8000f400 <__swrite>:
8000f400:	00c5d783          	lhu	a5,12(a1)
8000f404:	fe010113          	addi	sp,sp,-32
8000f408:	00812c23          	sw	s0,24(sp)
8000f40c:	00912a23          	sw	s1,20(sp)
8000f410:	01212823          	sw	s2,16(sp)
8000f414:	01312623          	sw	s3,12(sp)
8000f418:	00112e23          	sw	ra,28(sp)
8000f41c:	1007f793          	andi	a5,a5,256
8000f420:	00050493          	mv	s1,a0
8000f424:	00058413          	mv	s0,a1
8000f428:	00060913          	mv	s2,a2
8000f42c:	00068993          	mv	s3,a3
8000f430:	00078a63          	beqz	a5,8000f444 <__swrite+0x44>
8000f434:	00e59583          	lh	a1,14(a1)
8000f438:	00200693          	li	a3,2
8000f43c:	00000613          	li	a2,0
8000f440:	694000ef          	jal	ra,8000fad4 <_lseek_r>
8000f444:	00c45783          	lhu	a5,12(s0)
8000f448:	fffff737          	lui	a4,0xfffff
8000f44c:	fff70713          	addi	a4,a4,-1 # ffffefff <_ram_heap_end+0x7ffe6fff>
8000f450:	00e7f7b3          	and	a5,a5,a4
8000f454:	00f41623          	sh	a5,12(s0)
8000f458:	00e41583          	lh	a1,14(s0)
8000f45c:	01812403          	lw	s0,24(sp)
8000f460:	01c12083          	lw	ra,28(sp)
8000f464:	00098693          	mv	a3,s3
8000f468:	00090613          	mv	a2,s2
8000f46c:	00c12983          	lw	s3,12(sp)
8000f470:	01012903          	lw	s2,16(sp)
8000f474:	00048513          	mv	a0,s1
8000f478:	01412483          	lw	s1,20(sp)
8000f47c:	02010113          	addi	sp,sp,32
8000f480:	4480006f          	j	8000f8c8 <_write_r>

Disassembly of section .text.__sseek:

8000f484 <__sseek>:
8000f484:	ff010113          	addi	sp,sp,-16
8000f488:	00812423          	sw	s0,8(sp)
8000f48c:	00058413          	mv	s0,a1
8000f490:	00e59583          	lh	a1,14(a1)
8000f494:	00112623          	sw	ra,12(sp)
8000f498:	63c000ef          	jal	ra,8000fad4 <_lseek_r>
8000f49c:	fff00793          	li	a5,-1
8000f4a0:	00c45703          	lhu	a4,12(s0)
8000f4a4:	02f51263          	bne	a0,a5,8000f4c8 <__sseek+0x44>
8000f4a8:	fffff7b7          	lui	a5,0xfffff
8000f4ac:	fff78793          	addi	a5,a5,-1 # ffffefff <_ram_heap_end+0x7ffe6fff>
8000f4b0:	00e7f7b3          	and	a5,a5,a4
8000f4b4:	00f41623          	sh	a5,12(s0)
8000f4b8:	00c12083          	lw	ra,12(sp)
8000f4bc:	00812403          	lw	s0,8(sp)
8000f4c0:	01010113          	addi	sp,sp,16
8000f4c4:	00008067          	ret
8000f4c8:	000017b7          	lui	a5,0x1
8000f4cc:	00f767b3          	or	a5,a4,a5
8000f4d0:	00f41623          	sh	a5,12(s0)
8000f4d4:	04a42a23          	sw	a0,84(s0)
8000f4d8:	fe1ff06f          	j	8000f4b8 <__sseek+0x34>

Disassembly of section .text.__sclose:

8000f4dc <__sclose>:
8000f4dc:	00e59583          	lh	a1,14(a1)
8000f4e0:	5b00006f          	j	8000fa90 <_close_r>

Disassembly of section .text.strlen:

8000f4e4 <strlen>:
8000f4e4:	00050793          	mv	a5,a0
8000f4e8:	00178793          	addi	a5,a5,1 # 1001 <_stack_size+0x1>
8000f4ec:	fff7c703          	lbu	a4,-1(a5)
8000f4f0:	fe071ce3          	bnez	a4,8000f4e8 <strlen+0x4>
8000f4f4:	40a78533          	sub	a0,a5,a0
8000f4f8:	fff50513          	addi	a0,a0,-1
8000f4fc:	00008067          	ret

Disassembly of section .text.strncmp:

8000f500 <strncmp>:
8000f500:	02060a63          	beqz	a2,8000f534 <strncmp+0x34>
8000f504:	fff60613          	addi	a2,a2,-1
8000f508:	00000713          	li	a4,0
8000f50c:	00e507b3          	add	a5,a0,a4
8000f510:	00e586b3          	add	a3,a1,a4
8000f514:	0007c783          	lbu	a5,0(a5)
8000f518:	0006c683          	lbu	a3,0(a3)
8000f51c:	00d79863          	bne	a5,a3,8000f52c <strncmp+0x2c>
8000f520:	00c70663          	beq	a4,a2,8000f52c <strncmp+0x2c>
8000f524:	00170713          	addi	a4,a4,1
8000f528:	fe0792e3          	bnez	a5,8000f50c <strncmp+0xc>
8000f52c:	40d78533          	sub	a0,a5,a3
8000f530:	00008067          	ret
8000f534:	00000513          	li	a0,0
8000f538:	00008067          	ret

Disassembly of section .text._strtol_l.isra.0:

8000f53c <_strtol_l.isra.0>:
8000f53c:	fc010113          	addi	sp,sp,-64
8000f540:	03212823          	sw	s2,48(sp)
8000f544:	03512223          	sw	s5,36(sp)
8000f548:	03612023          	sw	s6,32(sp)
8000f54c:	01812c23          	sw	s8,24(sp)
8000f550:	00068913          	mv	s2,a3
8000f554:	02112e23          	sw	ra,60(sp)
8000f558:	02812c23          	sw	s0,56(sp)
8000f55c:	02912a23          	sw	s1,52(sp)
8000f560:	03312623          	sw	s3,44(sp)
8000f564:	03412423          	sw	s4,40(sp)
8000f568:	01712e23          	sw	s7,28(sp)
8000f56c:	01912a23          	sw	s9,20(sp)
8000f570:	01a12823          	sw	s10,16(sp)
8000f574:	01b12623          	sw	s11,12(sp)
8000f578:	00050a93          	mv	s5,a0
8000f57c:	00058b13          	mv	s6,a1
8000f580:	00060c13          	mv	s8,a2
8000f584:	00058793          	mv	a5,a1
8000f588:	ffff4697          	auipc	a3,0xffff4
8000f58c:	9b968693          	addi	a3,a3,-1607 # 80002f41 <_ctype_+0x1>
8000f590:	00178493          	addi	s1,a5,1
8000f594:	fff4c403          	lbu	s0,-1(s1)
8000f598:	00d40733          	add	a4,s0,a3
8000f59c:	00074703          	lbu	a4,0(a4)
8000f5a0:	00877713          	andi	a4,a4,8
8000f5a4:	0c071863          	bnez	a4,8000f674 <_strtol_l.isra.0+0x138>
8000f5a8:	02d00713          	li	a4,45
8000f5ac:	0ce41863          	bne	s0,a4,8000f67c <_strtol_l.isra.0+0x140>
8000f5b0:	0004c403          	lbu	s0,0(s1)
8000f5b4:	00100a13          	li	s4,1
8000f5b8:	00278493          	addi	s1,a5,2
8000f5bc:	16090e63          	beqz	s2,8000f738 <_strtol_l.isra.0+0x1fc>
8000f5c0:	01000793          	li	a5,16
8000f5c4:	02f91463          	bne	s2,a5,8000f5ec <_strtol_l.isra.0+0xb0>
8000f5c8:	03000793          	li	a5,48
8000f5cc:	02f41063          	bne	s0,a5,8000f5ec <_strtol_l.isra.0+0xb0>
8000f5d0:	0004c783          	lbu	a5,0(s1)
8000f5d4:	05800713          	li	a4,88
8000f5d8:	0df7f793          	andi	a5,a5,223
8000f5dc:	14e79663          	bne	a5,a4,8000f728 <_strtol_l.isra.0+0x1ec>
8000f5e0:	0014c403          	lbu	s0,1(s1)
8000f5e4:	01000913          	li	s2,16
8000f5e8:	00248493          	addi	s1,s1,2
8000f5ec:	800009b7          	lui	s3,0x80000
8000f5f0:	000a1463          	bnez	s4,8000f5f8 <_strtol_l.isra.0+0xbc>
8000f5f4:	fff9c993          	not	s3,s3
8000f5f8:	00090593          	mv	a1,s2
8000f5fc:	00098513          	mv	a0,s3
8000f600:	eb0fe0ef          	jal	ra,8000dcb0 <__umodsi3>
8000f604:	00050b93          	mv	s7,a0
8000f608:	00090593          	mv	a1,s2
8000f60c:	00098513          	mv	a0,s3
8000f610:	e58fe0ef          	jal	ra,8000dc68 <__udivsi3>
8000f614:	00050c93          	mv	s9,a0
8000f618:	00000713          	li	a4,0
8000f61c:	00000513          	li	a0,0
8000f620:	00900d93          	li	s11,9
8000f624:	01900d13          	li	s10,25
8000f628:	fff00693          	li	a3,-1
8000f62c:	fd040793          	addi	a5,s0,-48
8000f630:	06fde463          	bltu	s11,a5,8000f698 <_strtol_l.isra.0+0x15c>
8000f634:	00078413          	mv	s0,a5
8000f638:	09245063          	bge	s0,s2,8000f6b8 <_strtol_l.isra.0+0x17c>
8000f63c:	02d70663          	beq	a4,a3,8000f668 <_strtol_l.isra.0+0x12c>
8000f640:	fff00713          	li	a4,-1
8000f644:	02ace263          	bltu	s9,a0,8000f668 <_strtol_l.isra.0+0x12c>
8000f648:	00ac9463          	bne	s9,a0,8000f650 <_strtol_l.isra.0+0x114>
8000f64c:	008bce63          	blt	s7,s0,8000f668 <_strtol_l.isra.0+0x12c>
8000f650:	00050593          	mv	a1,a0
8000f654:	00090513          	mv	a0,s2
8000f658:	de4fe0ef          	jal	ra,8000dc3c <__mulsi3>
8000f65c:	00a40533          	add	a0,s0,a0
8000f660:	00100713          	li	a4,1
8000f664:	fff00693          	li	a3,-1
8000f668:	00148493          	addi	s1,s1,1
8000f66c:	fff4c403          	lbu	s0,-1(s1)
8000f670:	fbdff06f          	j	8000f62c <_strtol_l.isra.0+0xf0>
8000f674:	00048793          	mv	a5,s1
8000f678:	f19ff06f          	j	8000f590 <_strtol_l.isra.0+0x54>
8000f67c:	02b00713          	li	a4,43
8000f680:	00e40663          	beq	s0,a4,8000f68c <_strtol_l.isra.0+0x150>
8000f684:	00000a13          	li	s4,0
8000f688:	f35ff06f          	j	8000f5bc <_strtol_l.isra.0+0x80>
8000f68c:	0004c403          	lbu	s0,0(s1)
8000f690:	00278493          	addi	s1,a5,2
8000f694:	ff1ff06f          	j	8000f684 <_strtol_l.isra.0+0x148>
8000f698:	fbf40793          	addi	a5,s0,-65
8000f69c:	00fd6663          	bltu	s10,a5,8000f6a8 <_strtol_l.isra.0+0x16c>
8000f6a0:	fc940413          	addi	s0,s0,-55
8000f6a4:	f95ff06f          	j	8000f638 <_strtol_l.isra.0+0xfc>
8000f6a8:	f9f40793          	addi	a5,s0,-97
8000f6ac:	00fd6663          	bltu	s10,a5,8000f6b8 <_strtol_l.isra.0+0x17c>
8000f6b0:	fa940413          	addi	s0,s0,-87
8000f6b4:	f85ff06f          	j	8000f638 <_strtol_l.isra.0+0xfc>
8000f6b8:	fff00793          	li	a5,-1
8000f6bc:	04f71863          	bne	a4,a5,8000f70c <_strtol_l.isra.0+0x1d0>
8000f6c0:	02200793          	li	a5,34
8000f6c4:	00faa023          	sw	a5,0(s5)
8000f6c8:	00098513          	mv	a0,s3
8000f6cc:	040c1863          	bnez	s8,8000f71c <_strtol_l.isra.0+0x1e0>
8000f6d0:	03c12083          	lw	ra,60(sp)
8000f6d4:	03812403          	lw	s0,56(sp)
8000f6d8:	03412483          	lw	s1,52(sp)
8000f6dc:	03012903          	lw	s2,48(sp)
8000f6e0:	02c12983          	lw	s3,44(sp)
8000f6e4:	02812a03          	lw	s4,40(sp)
8000f6e8:	02412a83          	lw	s5,36(sp)
8000f6ec:	02012b03          	lw	s6,32(sp)
8000f6f0:	01c12b83          	lw	s7,28(sp)
8000f6f4:	01812c03          	lw	s8,24(sp)
8000f6f8:	01412c83          	lw	s9,20(sp)
8000f6fc:	01012d03          	lw	s10,16(sp)
8000f700:	00c12d83          	lw	s11,12(sp)
8000f704:	04010113          	addi	sp,sp,64
8000f708:	00008067          	ret
8000f70c:	000a0463          	beqz	s4,8000f714 <_strtol_l.isra.0+0x1d8>
8000f710:	40a00533          	neg	a0,a0
8000f714:	fa0c0ee3          	beqz	s8,8000f6d0 <_strtol_l.isra.0+0x194>
8000f718:	00070463          	beqz	a4,8000f720 <_strtol_l.isra.0+0x1e4>
8000f71c:	fff48b13          	addi	s6,s1,-1
8000f720:	016c2023          	sw	s6,0(s8)
8000f724:	fadff06f          	j	8000f6d0 <_strtol_l.isra.0+0x194>
8000f728:	03000413          	li	s0,48
8000f72c:	ec0910e3          	bnez	s2,8000f5ec <_strtol_l.isra.0+0xb0>
8000f730:	00800913          	li	s2,8
8000f734:	eb9ff06f          	j	8000f5ec <_strtol_l.isra.0+0xb0>
8000f738:	03000793          	li	a5,48
8000f73c:	e8f40ae3          	beq	s0,a5,8000f5d0 <_strtol_l.isra.0+0x94>
8000f740:	00a00913          	li	s2,10
8000f744:	ea9ff06f          	j	8000f5ec <_strtol_l.isra.0+0xb0>

Disassembly of section .text._strtol_r:

8000f748 <_strtol_r>:
8000f748:	df5ff06f          	j	8000f53c <_strtol_l.isra.0>

Disassembly of section .text.strtol_l:

8000f74c <strtol_l>:
8000f74c:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000f750:	00060693          	mv	a3,a2
8000f754:	00058613          	mv	a2,a1
8000f758:	00050593          	mv	a1,a0
8000f75c:	0007a503          	lw	a0,0(a5)
8000f760:	dddff06f          	j	8000f53c <_strtol_l.isra.0>

Disassembly of section .text.strtol:

8000f764 <strtol>:
8000f764:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000f768:	00060693          	mv	a3,a2
8000f76c:	00058613          	mv	a2,a1
8000f770:	00050593          	mv	a1,a0
8000f774:	0007a503          	lw	a0,0(a5)
8000f778:	dc5ff06f          	j	8000f53c <_strtol_l.isra.0>

Disassembly of section .text.__swbuf_r:

8000f77c <__swbuf_r>:
8000f77c:	fe010113          	addi	sp,sp,-32
8000f780:	00812c23          	sw	s0,24(sp)
8000f784:	00912a23          	sw	s1,20(sp)
8000f788:	01212823          	sw	s2,16(sp)
8000f78c:	00112e23          	sw	ra,28(sp)
8000f790:	01312623          	sw	s3,12(sp)
8000f794:	00050493          	mv	s1,a0
8000f798:	00058913          	mv	s2,a1
8000f79c:	00060413          	mv	s0,a2
8000f7a0:	00050863          	beqz	a0,8000f7b0 <__swbuf_r+0x34>
8000f7a4:	01852783          	lw	a5,24(a0)
8000f7a8:	00079463          	bnez	a5,8000f7b0 <__swbuf_r+0x34>
8000f7ac:	ee9fe0ef          	jal	ra,8000e694 <__sinit>
8000f7b0:	ffff4797          	auipc	a5,0xffff4
8000f7b4:	8b478793          	addi	a5,a5,-1868 # 80003064 <__sf_fake_stdin>
8000f7b8:	0af41e63          	bne	s0,a5,8000f874 <__swbuf_r+0xf8>
8000f7bc:	0044a403          	lw	s0,4(s1)
8000f7c0:	01842783          	lw	a5,24(s0)
8000f7c4:	00f42423          	sw	a5,8(s0)
8000f7c8:	00c45783          	lhu	a5,12(s0)
8000f7cc:	0087f793          	andi	a5,a5,8
8000f7d0:	0c078663          	beqz	a5,8000f89c <__swbuf_r+0x120>
8000f7d4:	01042783          	lw	a5,16(s0)
8000f7d8:	0c078263          	beqz	a5,8000f89c <__swbuf_r+0x120>
8000f7dc:	01042783          	lw	a5,16(s0)
8000f7e0:	00042503          	lw	a0,0(s0)
8000f7e4:	0ff97993          	andi	s3,s2,255
8000f7e8:	0ff97913          	andi	s2,s2,255
8000f7ec:	40f50533          	sub	a0,a0,a5
8000f7f0:	01442783          	lw	a5,20(s0)
8000f7f4:	00f54a63          	blt	a0,a5,8000f808 <__swbuf_r+0x8c>
8000f7f8:	00040593          	mv	a1,s0
8000f7fc:	00048513          	mv	a0,s1
8000f800:	ca5fe0ef          	jal	ra,8000e4a4 <_fflush_r>
8000f804:	0a051463          	bnez	a0,8000f8ac <__swbuf_r+0x130>
8000f808:	00842783          	lw	a5,8(s0)
8000f80c:	00150513          	addi	a0,a0,1
8000f810:	fff78793          	addi	a5,a5,-1
8000f814:	00f42423          	sw	a5,8(s0)
8000f818:	00042783          	lw	a5,0(s0)
8000f81c:	00178713          	addi	a4,a5,1
8000f820:	00e42023          	sw	a4,0(s0)
8000f824:	01378023          	sb	s3,0(a5)
8000f828:	01442783          	lw	a5,20(s0)
8000f82c:	00a78c63          	beq	a5,a0,8000f844 <__swbuf_r+0xc8>
8000f830:	00c45783          	lhu	a5,12(s0)
8000f834:	0017f793          	andi	a5,a5,1
8000f838:	00078e63          	beqz	a5,8000f854 <__swbuf_r+0xd8>
8000f83c:	00a00793          	li	a5,10
8000f840:	00f91a63          	bne	s2,a5,8000f854 <__swbuf_r+0xd8>
8000f844:	00040593          	mv	a1,s0
8000f848:	00048513          	mv	a0,s1
8000f84c:	c59fe0ef          	jal	ra,8000e4a4 <_fflush_r>
8000f850:	04051e63          	bnez	a0,8000f8ac <__swbuf_r+0x130>
8000f854:	01c12083          	lw	ra,28(sp)
8000f858:	01812403          	lw	s0,24(sp)
8000f85c:	00090513          	mv	a0,s2
8000f860:	01412483          	lw	s1,20(sp)
8000f864:	01012903          	lw	s2,16(sp)
8000f868:	00c12983          	lw	s3,12(sp)
8000f86c:	02010113          	addi	sp,sp,32
8000f870:	00008067          	ret
8000f874:	ffff4797          	auipc	a5,0xffff4
8000f878:	81078793          	addi	a5,a5,-2032 # 80003084 <__sf_fake_stdout>
8000f87c:	00f41663          	bne	s0,a5,8000f888 <__swbuf_r+0x10c>
8000f880:	0084a403          	lw	s0,8(s1)
8000f884:	f3dff06f          	j	8000f7c0 <__swbuf_r+0x44>
8000f888:	ffff3797          	auipc	a5,0xffff3
8000f88c:	7bc78793          	addi	a5,a5,1980 # 80003044 <__sf_fake_stderr>
8000f890:	f2f418e3          	bne	s0,a5,8000f7c0 <__swbuf_r+0x44>
8000f894:	00c4a403          	lw	s0,12(s1)
8000f898:	f29ff06f          	j	8000f7c0 <__swbuf_r+0x44>
8000f89c:	00040593          	mv	a1,s0
8000f8a0:	00048513          	mv	a0,s1
8000f8a4:	070000ef          	jal	ra,8000f914 <__swsetup_r>
8000f8a8:	f2050ae3          	beqz	a0,8000f7dc <__swbuf_r+0x60>
8000f8ac:	fff00913          	li	s2,-1
8000f8b0:	fa5ff06f          	j	8000f854 <__swbuf_r+0xd8>

Disassembly of section .text.__swbuf:

8000f8b4 <__swbuf>:
8000f8b4:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000f8b8:	00058613          	mv	a2,a1
8000f8bc:	00050593          	mv	a1,a0
8000f8c0:	0007a503          	lw	a0,0(a5)
8000f8c4:	eb9ff06f          	j	8000f77c <__swbuf_r>

Disassembly of section .text._write_r:

8000f8c8 <_write_r>:
8000f8c8:	ff010113          	addi	sp,sp,-16
8000f8cc:	00812423          	sw	s0,8(sp)
8000f8d0:	00050413          	mv	s0,a0
8000f8d4:	00058513          	mv	a0,a1
8000f8d8:	00060593          	mv	a1,a2
8000f8dc:	00068613          	mv	a2,a3
8000f8e0:	c601a623          	sw	zero,-916(gp) # 800036dc <errno>
8000f8e4:	00112623          	sw	ra,12(sp)
8000f8e8:	cf9f60ef          	jal	ra,800065e0 <_write>
8000f8ec:	fff00793          	li	a5,-1
8000f8f0:	00f51a63          	bne	a0,a5,8000f904 <_write_r+0x3c>
8000f8f4:	c6c18793          	addi	a5,gp,-916 # 800036dc <errno>
8000f8f8:	0007a783          	lw	a5,0(a5)
8000f8fc:	00078463          	beqz	a5,8000f904 <_write_r+0x3c>
8000f900:	00f42023          	sw	a5,0(s0)
8000f904:	00c12083          	lw	ra,12(sp)
8000f908:	00812403          	lw	s0,8(sp)
8000f90c:	01010113          	addi	sp,sp,16
8000f910:	00008067          	ret

Disassembly of section .text.__swsetup_r:

8000f914 <__swsetup_r>:
8000f914:	ff010113          	addi	sp,sp,-16
8000f918:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
8000f91c:	00912223          	sw	s1,4(sp)
8000f920:	0007a483          	lw	s1,0(a5)
8000f924:	00812423          	sw	s0,8(sp)
8000f928:	01212023          	sw	s2,0(sp)
8000f92c:	00112623          	sw	ra,12(sp)
8000f930:	00050913          	mv	s2,a0
8000f934:	00058413          	mv	s0,a1
8000f938:	00048a63          	beqz	s1,8000f94c <__swsetup_r+0x38>
8000f93c:	0184a783          	lw	a5,24(s1)
8000f940:	00079663          	bnez	a5,8000f94c <__swsetup_r+0x38>
8000f944:	00048513          	mv	a0,s1
8000f948:	d4dfe0ef          	jal	ra,8000e694 <__sinit>
8000f94c:	ffff3797          	auipc	a5,0xffff3
8000f950:	71878793          	addi	a5,a5,1816 # 80003064 <__sf_fake_stdin>
8000f954:	04f41863          	bne	s0,a5,8000f9a4 <__swsetup_r+0x90>
8000f958:	0044a403          	lw	s0,4(s1)
8000f95c:	00c41703          	lh	a4,12(s0)
8000f960:	01071793          	slli	a5,a4,0x10
8000f964:	0107d793          	srli	a5,a5,0x10
8000f968:	0087f693          	andi	a3,a5,8
8000f96c:	0a069463          	bnez	a3,8000fa14 <__swsetup_r+0x100>
8000f970:	0107f693          	andi	a3,a5,16
8000f974:	04069c63          	bnez	a3,8000f9cc <__swsetup_r+0xb8>
8000f978:	00900793          	li	a5,9
8000f97c:	00f92023          	sw	a5,0(s2)
8000f980:	04076713          	ori	a4,a4,64
8000f984:	00e41623          	sh	a4,12(s0)
8000f988:	fff00513          	li	a0,-1
8000f98c:	00c12083          	lw	ra,12(sp)
8000f990:	00812403          	lw	s0,8(sp)
8000f994:	00412483          	lw	s1,4(sp)
8000f998:	00012903          	lw	s2,0(sp)
8000f99c:	01010113          	addi	sp,sp,16
8000f9a0:	00008067          	ret
8000f9a4:	ffff3797          	auipc	a5,0xffff3
8000f9a8:	6e078793          	addi	a5,a5,1760 # 80003084 <__sf_fake_stdout>
8000f9ac:	00f41663          	bne	s0,a5,8000f9b8 <__swsetup_r+0xa4>
8000f9b0:	0084a403          	lw	s0,8(s1)
8000f9b4:	fa9ff06f          	j	8000f95c <__swsetup_r+0x48>
8000f9b8:	ffff3797          	auipc	a5,0xffff3
8000f9bc:	68c78793          	addi	a5,a5,1676 # 80003044 <__sf_fake_stderr>
8000f9c0:	f8f41ee3          	bne	s0,a5,8000f95c <__swsetup_r+0x48>
8000f9c4:	00c4a403          	lw	s0,12(s1)
8000f9c8:	f95ff06f          	j	8000f95c <__swsetup_r+0x48>
8000f9cc:	0047f793          	andi	a5,a5,4
8000f9d0:	02078c63          	beqz	a5,8000fa08 <__swsetup_r+0xf4>
8000f9d4:	03442583          	lw	a1,52(s0)
8000f9d8:	00058c63          	beqz	a1,8000f9f0 <__swsetup_r+0xdc>
8000f9dc:	04440793          	addi	a5,s0,68
8000f9e0:	00f58663          	beq	a1,a5,8000f9ec <__swsetup_r+0xd8>
8000f9e4:	00090513          	mv	a0,s2
8000f9e8:	aa8ff0ef          	jal	ra,8000ec90 <_free_r>
8000f9ec:	02042a23          	sw	zero,52(s0)
8000f9f0:	00c45783          	lhu	a5,12(s0)
8000f9f4:	00042223          	sw	zero,4(s0)
8000f9f8:	fdb7f793          	andi	a5,a5,-37
8000f9fc:	00f41623          	sh	a5,12(s0)
8000fa00:	01042783          	lw	a5,16(s0)
8000fa04:	00f42023          	sw	a5,0(s0)
8000fa08:	00c45783          	lhu	a5,12(s0)
8000fa0c:	0087e793          	ori	a5,a5,8
8000fa10:	00f41623          	sh	a5,12(s0)
8000fa14:	01042783          	lw	a5,16(s0)
8000fa18:	02079063          	bnez	a5,8000fa38 <__swsetup_r+0x124>
8000fa1c:	00c45783          	lhu	a5,12(s0)
8000fa20:	20000713          	li	a4,512
8000fa24:	2807f793          	andi	a5,a5,640
8000fa28:	00e78863          	beq	a5,a4,8000fa38 <__swsetup_r+0x124>
8000fa2c:	00040593          	mv	a1,s0
8000fa30:	00090513          	mv	a0,s2
8000fa34:	178000ef          	jal	ra,8000fbac <__smakebuf_r>
8000fa38:	00c45783          	lhu	a5,12(s0)
8000fa3c:	0017f713          	andi	a4,a5,1
8000fa40:	02070c63          	beqz	a4,8000fa78 <__swsetup_r+0x164>
8000fa44:	01442783          	lw	a5,20(s0)
8000fa48:	00042423          	sw	zero,8(s0)
8000fa4c:	40f007b3          	neg	a5,a5
8000fa50:	00f42c23          	sw	a5,24(s0)
8000fa54:	01042783          	lw	a5,16(s0)
8000fa58:	00000513          	li	a0,0
8000fa5c:	f20798e3          	bnez	a5,8000f98c <__swsetup_r+0x78>
8000fa60:	00c41783          	lh	a5,12(s0)
8000fa64:	0807f713          	andi	a4,a5,128
8000fa68:	f20702e3          	beqz	a4,8000f98c <__swsetup_r+0x78>
8000fa6c:	0407e793          	ori	a5,a5,64
8000fa70:	00f41623          	sh	a5,12(s0)
8000fa74:	f15ff06f          	j	8000f988 <__swsetup_r+0x74>
8000fa78:	0027f793          	andi	a5,a5,2
8000fa7c:	00000713          	li	a4,0
8000fa80:	00079463          	bnez	a5,8000fa88 <__swsetup_r+0x174>
8000fa84:	01442703          	lw	a4,20(s0)
8000fa88:	00e42423          	sw	a4,8(s0)
8000fa8c:	fc9ff06f          	j	8000fa54 <__swsetup_r+0x140>

Disassembly of section .text._close_r:

8000fa90 <_close_r>:
8000fa90:	ff010113          	addi	sp,sp,-16
8000fa94:	00812423          	sw	s0,8(sp)
8000fa98:	00050413          	mv	s0,a0
8000fa9c:	00058513          	mv	a0,a1
8000faa0:	c601a623          	sw	zero,-916(gp) # 800036dc <errno>
8000faa4:	00112623          	sw	ra,12(sp)
8000faa8:	b75f60ef          	jal	ra,8000661c <_close>
8000faac:	fff00793          	li	a5,-1
8000fab0:	00f51a63          	bne	a0,a5,8000fac4 <_close_r+0x34>
8000fab4:	c6c18793          	addi	a5,gp,-916 # 800036dc <errno>
8000fab8:	0007a783          	lw	a5,0(a5)
8000fabc:	00078463          	beqz	a5,8000fac4 <_close_r+0x34>
8000fac0:	00f42023          	sw	a5,0(s0)
8000fac4:	00c12083          	lw	ra,12(sp)
8000fac8:	00812403          	lw	s0,8(sp)
8000facc:	01010113          	addi	sp,sp,16
8000fad0:	00008067          	ret

Disassembly of section .text._lseek_r:

8000fad4 <_lseek_r>:
8000fad4:	ff010113          	addi	sp,sp,-16
8000fad8:	00812423          	sw	s0,8(sp)
8000fadc:	00050413          	mv	s0,a0
8000fae0:	00058513          	mv	a0,a1
8000fae4:	00060593          	mv	a1,a2
8000fae8:	00068613          	mv	a2,a3
8000faec:	c601a623          	sw	zero,-916(gp) # 800036dc <errno>
8000faf0:	00112623          	sw	ra,12(sp)
8000faf4:	b31f60ef          	jal	ra,80006624 <_lseek>
8000faf8:	fff00793          	li	a5,-1
8000fafc:	00f51a63          	bne	a0,a5,8000fb10 <_lseek_r+0x3c>
8000fb00:	c6c18793          	addi	a5,gp,-916 # 800036dc <errno>
8000fb04:	0007a783          	lw	a5,0(a5)
8000fb08:	00078463          	beqz	a5,8000fb10 <_lseek_r+0x3c>
8000fb0c:	00f42023          	sw	a5,0(s0)
8000fb10:	00c12083          	lw	ra,12(sp)
8000fb14:	00812403          	lw	s0,8(sp)
8000fb18:	01010113          	addi	sp,sp,16
8000fb1c:	00008067          	ret

Disassembly of section .text.__swhatbuf_r:

8000fb20 <__swhatbuf_r>:
8000fb20:	f8010113          	addi	sp,sp,-128
8000fb24:	06912a23          	sw	s1,116(sp)
8000fb28:	00058493          	mv	s1,a1
8000fb2c:	00e59583          	lh	a1,14(a1)
8000fb30:	06812c23          	sw	s0,120(sp)
8000fb34:	06112e23          	sw	ra,124(sp)
8000fb38:	00060413          	mv	s0,a2
8000fb3c:	0005de63          	bgez	a1,8000fb58 <__swhatbuf_r+0x38>
8000fb40:	00c4d783          	lhu	a5,12(s1)
8000fb44:	0006a023          	sw	zero,0(a3)
8000fb48:	0807f793          	andi	a5,a5,128
8000fb4c:	04079063          	bnez	a5,8000fb8c <__swhatbuf_r+0x6c>
8000fb50:	40000793          	li	a5,1024
8000fb54:	03c0006f          	j	8000fb90 <__swhatbuf_r+0x70>
8000fb58:	01810613          	addi	a2,sp,24
8000fb5c:	00d12623          	sw	a3,12(sp)
8000fb60:	46c010ef          	jal	ra,80010fcc <_fstat_r>
8000fb64:	00c12683          	lw	a3,12(sp)
8000fb68:	fc054ce3          	bltz	a0,8000fb40 <__swhatbuf_r+0x20>
8000fb6c:	01c12703          	lw	a4,28(sp)
8000fb70:	0000f7b7          	lui	a5,0xf
8000fb74:	00e7f7b3          	and	a5,a5,a4
8000fb78:	ffffe737          	lui	a4,0xffffe
8000fb7c:	00e787b3          	add	a5,a5,a4
8000fb80:	0017b793          	seqz	a5,a5
8000fb84:	00f6a023          	sw	a5,0(a3)
8000fb88:	fc9ff06f          	j	8000fb50 <__swhatbuf_r+0x30>
8000fb8c:	04000793          	li	a5,64
8000fb90:	00f42023          	sw	a5,0(s0)
8000fb94:	07c12083          	lw	ra,124(sp)
8000fb98:	07812403          	lw	s0,120(sp)
8000fb9c:	07412483          	lw	s1,116(sp)
8000fba0:	00000513          	li	a0,0
8000fba4:	08010113          	addi	sp,sp,128
8000fba8:	00008067          	ret

Disassembly of section .text.__smakebuf_r:

8000fbac <__smakebuf_r>:
8000fbac:	00c5d783          	lhu	a5,12(a1)
8000fbb0:	fe010113          	addi	sp,sp,-32
8000fbb4:	00812c23          	sw	s0,24(sp)
8000fbb8:	00112e23          	sw	ra,28(sp)
8000fbbc:	00912a23          	sw	s1,20(sp)
8000fbc0:	01212823          	sw	s2,16(sp)
8000fbc4:	0027f793          	andi	a5,a5,2
8000fbc8:	00058413          	mv	s0,a1
8000fbcc:	02078863          	beqz	a5,8000fbfc <__smakebuf_r+0x50>
8000fbd0:	04740793          	addi	a5,s0,71
8000fbd4:	00f42023          	sw	a5,0(s0)
8000fbd8:	00f42823          	sw	a5,16(s0)
8000fbdc:	00100793          	li	a5,1
8000fbe0:	00f42a23          	sw	a5,20(s0)
8000fbe4:	01c12083          	lw	ra,28(sp)
8000fbe8:	01812403          	lw	s0,24(sp)
8000fbec:	01412483          	lw	s1,20(sp)
8000fbf0:	01012903          	lw	s2,16(sp)
8000fbf4:	02010113          	addi	sp,sp,32
8000fbf8:	00008067          	ret
8000fbfc:	00c10693          	addi	a3,sp,12
8000fc00:	00810613          	addi	a2,sp,8
8000fc04:	00050493          	mv	s1,a0
8000fc08:	f19ff0ef          	jal	ra,8000fb20 <__swhatbuf_r>
8000fc0c:	00812583          	lw	a1,8(sp)
8000fc10:	00050913          	mv	s2,a0
8000fc14:	00048513          	mv	a0,s1
8000fc18:	97cff0ef          	jal	ra,8000ed94 <_malloc_r>
8000fc1c:	02051063          	bnez	a0,8000fc3c <__smakebuf_r+0x90>
8000fc20:	00c41783          	lh	a5,12(s0)
8000fc24:	2007f713          	andi	a4,a5,512
8000fc28:	fa071ee3          	bnez	a4,8000fbe4 <__smakebuf_r+0x38>
8000fc2c:	ffc7f793          	andi	a5,a5,-4
8000fc30:	0027e793          	ori	a5,a5,2
8000fc34:	00f41623          	sh	a5,12(s0)
8000fc38:	f99ff06f          	j	8000fbd0 <__smakebuf_r+0x24>
8000fc3c:	fffff797          	auipc	a5,0xfffff
8000fc40:	9c078793          	addi	a5,a5,-1600 # 8000e5fc <_cleanup_r>
8000fc44:	02f4a423          	sw	a5,40(s1)
8000fc48:	00c45783          	lhu	a5,12(s0)
8000fc4c:	00a42023          	sw	a0,0(s0)
8000fc50:	00a42823          	sw	a0,16(s0)
8000fc54:	0807e793          	ori	a5,a5,128
8000fc58:	00f41623          	sh	a5,12(s0)
8000fc5c:	00812783          	lw	a5,8(sp)
8000fc60:	00f42a23          	sw	a5,20(s0)
8000fc64:	00c12783          	lw	a5,12(sp)
8000fc68:	02078263          	beqz	a5,8000fc8c <__smakebuf_r+0xe0>
8000fc6c:	00e41583          	lh	a1,14(s0)
8000fc70:	00048513          	mv	a0,s1
8000fc74:	001010ef          	jal	ra,80011474 <_isatty_r>
8000fc78:	00050a63          	beqz	a0,8000fc8c <__smakebuf_r+0xe0>
8000fc7c:	00c45783          	lhu	a5,12(s0)
8000fc80:	ffc7f793          	andi	a5,a5,-4
8000fc84:	0017e793          	ori	a5,a5,1
8000fc88:	00f41623          	sh	a5,12(s0)
8000fc8c:	00c45783          	lhu	a5,12(s0)
8000fc90:	00f96933          	or	s2,s2,a5
8000fc94:	01241623          	sh	s2,12(s0)
8000fc98:	f4dff06f          	j	8000fbe4 <__smakebuf_r+0x38>

Disassembly of section .text.__ssputs_r:

8000fc9c <__ssputs_r>:
8000fc9c:	fe010113          	addi	sp,sp,-32
8000fca0:	01212823          	sw	s2,16(sp)
8000fca4:	0085a903          	lw	s2,8(a1)
8000fca8:	00812c23          	sw	s0,24(sp)
8000fcac:	01412423          	sw	s4,8(sp)
8000fcb0:	01612023          	sw	s6,0(sp)
8000fcb4:	00112e23          	sw	ra,28(sp)
8000fcb8:	00912a23          	sw	s1,20(sp)
8000fcbc:	01312623          	sw	s3,12(sp)
8000fcc0:	01512223          	sw	s5,4(sp)
8000fcc4:	00058413          	mv	s0,a1
8000fcc8:	00060b13          	mv	s6,a2
8000fccc:	00068a13          	mv	s4,a3
8000fcd0:	0f26e063          	bltu	a3,s2,8000fdb0 <__ssputs_r+0x114>
8000fcd4:	00c5d783          	lhu	a5,12(a1)
8000fcd8:	4807f713          	andi	a4,a5,1152
8000fcdc:	0c070863          	beqz	a4,8000fdac <__ssputs_r+0x110>
8000fce0:	00042483          	lw	s1,0(s0)
8000fce4:	01442703          	lw	a4,20(s0)
8000fce8:	0105a583          	lw	a1,16(a1)
8000fcec:	00050a93          	mv	s5,a0
8000fcf0:	40b489b3          	sub	s3,s1,a1
8000fcf4:	00171493          	slli	s1,a4,0x1
8000fcf8:	00e48733          	add	a4,s1,a4
8000fcfc:	01f75493          	srli	s1,a4,0x1f
8000fd00:	00e484b3          	add	s1,s1,a4
8000fd04:	00168713          	addi	a4,a3,1
8000fd08:	4014d493          	srai	s1,s1,0x1
8000fd0c:	01370733          	add	a4,a4,s3
8000fd10:	00e4f463          	bgeu	s1,a4,8000fd18 <__ssputs_r+0x7c>
8000fd14:	00070493          	mv	s1,a4
8000fd18:	4007f793          	andi	a5,a5,1024
8000fd1c:	0c078463          	beqz	a5,8000fde4 <__ssputs_r+0x148>
8000fd20:	00048593          	mv	a1,s1
8000fd24:	000a8513          	mv	a0,s5
8000fd28:	86cff0ef          	jal	ra,8000ed94 <_malloc_r>
8000fd2c:	00050913          	mv	s2,a0
8000fd30:	04051263          	bnez	a0,8000fd74 <__ssputs_r+0xd8>
8000fd34:	00c00793          	li	a5,12
8000fd38:	00faa023          	sw	a5,0(s5)
8000fd3c:	00c45783          	lhu	a5,12(s0)
8000fd40:	fff00513          	li	a0,-1
8000fd44:	0407e793          	ori	a5,a5,64
8000fd48:	00f41623          	sh	a5,12(s0)
8000fd4c:	01c12083          	lw	ra,28(sp)
8000fd50:	01812403          	lw	s0,24(sp)
8000fd54:	01412483          	lw	s1,20(sp)
8000fd58:	01012903          	lw	s2,16(sp)
8000fd5c:	00c12983          	lw	s3,12(sp)
8000fd60:	00812a03          	lw	s4,8(sp)
8000fd64:	00412a83          	lw	s5,4(sp)
8000fd68:	00012b03          	lw	s6,0(sp)
8000fd6c:	02010113          	addi	sp,sp,32
8000fd70:	00008067          	ret
8000fd74:	01042583          	lw	a1,16(s0)
8000fd78:	00098613          	mv	a2,s3
8000fd7c:	d8dfe0ef          	jal	ra,8000eb08 <memcpy>
8000fd80:	00c45783          	lhu	a5,12(s0)
8000fd84:	b7f7f793          	andi	a5,a5,-1153
8000fd88:	0807e793          	ori	a5,a5,128
8000fd8c:	00f41623          	sh	a5,12(s0)
8000fd90:	01242823          	sw	s2,16(s0)
8000fd94:	00942a23          	sw	s1,20(s0)
8000fd98:	01390933          	add	s2,s2,s3
8000fd9c:	413484b3          	sub	s1,s1,s3
8000fda0:	01242023          	sw	s2,0(s0)
8000fda4:	00942423          	sw	s1,8(s0)
8000fda8:	000a0913          	mv	s2,s4
8000fdac:	012a7463          	bgeu	s4,s2,8000fdb4 <__ssputs_r+0x118>
8000fdb0:	000a0913          	mv	s2,s4
8000fdb4:	00042503          	lw	a0,0(s0)
8000fdb8:	00090613          	mv	a2,s2
8000fdbc:	000b0593          	mv	a1,s6
8000fdc0:	e21fe0ef          	jal	ra,8000ebe0 <memmove>
8000fdc4:	00842783          	lw	a5,8(s0)
8000fdc8:	00000513          	li	a0,0
8000fdcc:	412787b3          	sub	a5,a5,s2
8000fdd0:	00f42423          	sw	a5,8(s0)
8000fdd4:	00042783          	lw	a5,0(s0)
8000fdd8:	01278933          	add	s2,a5,s2
8000fddc:	01242023          	sw	s2,0(s0)
8000fde0:	f6dff06f          	j	8000fd4c <__ssputs_r+0xb0>
8000fde4:	00048613          	mv	a2,s1
8000fde8:	000a8513          	mv	a0,s5
8000fdec:	6f0010ef          	jal	ra,800114dc <_realloc_r>
8000fdf0:	00050913          	mv	s2,a0
8000fdf4:	f8051ee3          	bnez	a0,8000fd90 <__ssputs_r+0xf4>
8000fdf8:	01042583          	lw	a1,16(s0)
8000fdfc:	000a8513          	mv	a0,s5
8000fe00:	e91fe0ef          	jal	ra,8000ec90 <_free_r>
8000fe04:	f31ff06f          	j	8000fd34 <__ssputs_r+0x98>

Disassembly of section .text.__ssprint_r:

8000fe08 <__ssprint_r>:
8000fe08:	00862783          	lw	a5,8(a2)
8000fe0c:	fd010113          	addi	sp,sp,-48
8000fe10:	01312e23          	sw	s3,28(sp)
8000fe14:	02112623          	sw	ra,44(sp)
8000fe18:	02812423          	sw	s0,40(sp)
8000fe1c:	02912223          	sw	s1,36(sp)
8000fe20:	03212023          	sw	s2,32(sp)
8000fe24:	01412c23          	sw	s4,24(sp)
8000fe28:	01512a23          	sw	s5,20(sp)
8000fe2c:	01612823          	sw	s6,16(sp)
8000fe30:	01712623          	sw	s7,12(sp)
8000fe34:	01812423          	sw	s8,8(sp)
8000fe38:	00060993          	mv	s3,a2
8000fe3c:	12078663          	beqz	a5,8000ff68 <__ssprint_r+0x160>
8000fe40:	00062b03          	lw	s6,0(a2)
8000fe44:	00050a93          	mv	s5,a0
8000fe48:	00058413          	mv	s0,a1
8000fe4c:	00000b93          	li	s7,0
8000fe50:	00000913          	li	s2,0
8000fe54:	08090663          	beqz	s2,8000fee0 <__ssprint_r+0xd8>
8000fe58:	00842a03          	lw	s4,8(s0)
8000fe5c:	0d496663          	bltu	s2,s4,8000ff28 <__ssprint_r+0x120>
8000fe60:	00c45783          	lhu	a5,12(s0)
8000fe64:	4807f713          	andi	a4,a5,1152
8000fe68:	0c070063          	beqz	a4,8000ff28 <__ssprint_r+0x120>
8000fe6c:	00042483          	lw	s1,0(s0)
8000fe70:	01442703          	lw	a4,20(s0)
8000fe74:	01042583          	lw	a1,16(s0)
8000fe78:	40b48c33          	sub	s8,s1,a1
8000fe7c:	00171493          	slli	s1,a4,0x1
8000fe80:	00e48733          	add	a4,s1,a4
8000fe84:	01f75493          	srli	s1,a4,0x1f
8000fe88:	00e484b3          	add	s1,s1,a4
8000fe8c:	001c0713          	addi	a4,s8,1
8000fe90:	4014d493          	srai	s1,s1,0x1
8000fe94:	01270733          	add	a4,a4,s2
8000fe98:	00e4f463          	bgeu	s1,a4,8000fea0 <__ssprint_r+0x98>
8000fe9c:	00070493          	mv	s1,a4
8000fea0:	4007f793          	andi	a5,a5,1024
8000fea4:	0e078e63          	beqz	a5,8000ffa0 <__ssprint_r+0x198>
8000fea8:	00048593          	mv	a1,s1
8000feac:	000a8513          	mv	a0,s5
8000feb0:	ee5fe0ef          	jal	ra,8000ed94 <_malloc_r>
8000feb4:	00050a13          	mv	s4,a0
8000feb8:	02051c63          	bnez	a0,8000fef0 <__ssprint_r+0xe8>
8000febc:	00c00793          	li	a5,12
8000fec0:	00faa023          	sw	a5,0(s5)
8000fec4:	00c45783          	lhu	a5,12(s0)
8000fec8:	fff00513          	li	a0,-1
8000fecc:	0407e793          	ori	a5,a5,64
8000fed0:	00f41623          	sh	a5,12(s0)
8000fed4:	0009a423          	sw	zero,8(s3) # 80000008 <_ram_heap_end+0xfffe8008>
8000fed8:	0009a223          	sw	zero,4(s3)
8000fedc:	0940006f          	j	8000ff70 <__ssprint_r+0x168>
8000fee0:	000b2b83          	lw	s7,0(s6)
8000fee4:	004b2903          	lw	s2,4(s6)
8000fee8:	008b0b13          	addi	s6,s6,8
8000feec:	f69ff06f          	j	8000fe54 <__ssprint_r+0x4c>
8000fef0:	01042583          	lw	a1,16(s0)
8000fef4:	000c0613          	mv	a2,s8
8000fef8:	c11fe0ef          	jal	ra,8000eb08 <memcpy>
8000fefc:	00c45783          	lhu	a5,12(s0)
8000ff00:	b7f7f793          	andi	a5,a5,-1153
8000ff04:	0807e793          	ori	a5,a5,128
8000ff08:	00f41623          	sh	a5,12(s0)
8000ff0c:	01442823          	sw	s4,16(s0)
8000ff10:	00942a23          	sw	s1,20(s0)
8000ff14:	018a0a33          	add	s4,s4,s8
8000ff18:	418484b3          	sub	s1,s1,s8
8000ff1c:	01442023          	sw	s4,0(s0)
8000ff20:	00942423          	sw	s1,8(s0)
8000ff24:	00090a13          	mv	s4,s2
8000ff28:	01497463          	bgeu	s2,s4,8000ff30 <__ssprint_r+0x128>
8000ff2c:	00090a13          	mv	s4,s2
8000ff30:	00042503          	lw	a0,0(s0)
8000ff34:	000a0613          	mv	a2,s4
8000ff38:	000b8593          	mv	a1,s7
8000ff3c:	ca5fe0ef          	jal	ra,8000ebe0 <memmove>
8000ff40:	00842783          	lw	a5,8(s0)
8000ff44:	414787b3          	sub	a5,a5,s4
8000ff48:	00f42423          	sw	a5,8(s0)
8000ff4c:	00042783          	lw	a5,0(s0)
8000ff50:	01478a33          	add	s4,a5,s4
8000ff54:	0089a783          	lw	a5,8(s3)
8000ff58:	01442023          	sw	s4,0(s0)
8000ff5c:	41278933          	sub	s2,a5,s2
8000ff60:	0129a423          	sw	s2,8(s3)
8000ff64:	f6091ee3          	bnez	s2,8000fee0 <__ssprint_r+0xd8>
8000ff68:	0009a223          	sw	zero,4(s3)
8000ff6c:	00000513          	li	a0,0
8000ff70:	02c12083          	lw	ra,44(sp)
8000ff74:	02812403          	lw	s0,40(sp)
8000ff78:	02412483          	lw	s1,36(sp)
8000ff7c:	02012903          	lw	s2,32(sp)
8000ff80:	01c12983          	lw	s3,28(sp)
8000ff84:	01812a03          	lw	s4,24(sp)
8000ff88:	01412a83          	lw	s5,20(sp)
8000ff8c:	01012b03          	lw	s6,16(sp)
8000ff90:	00c12b83          	lw	s7,12(sp)
8000ff94:	00812c03          	lw	s8,8(sp)
8000ff98:	03010113          	addi	sp,sp,48
8000ff9c:	00008067          	ret
8000ffa0:	00048613          	mv	a2,s1
8000ffa4:	000a8513          	mv	a0,s5
8000ffa8:	534010ef          	jal	ra,800114dc <_realloc_r>
8000ffac:	00050a13          	mv	s4,a0
8000ffb0:	f4051ee3          	bnez	a0,8000ff0c <__ssprint_r+0x104>
8000ffb4:	01042583          	lw	a1,16(s0)
8000ffb8:	000a8513          	mv	a0,s5
8000ffbc:	cd5fe0ef          	jal	ra,8000ec90 <_free_r>
8000ffc0:	efdff06f          	j	8000febc <__ssprint_r+0xb4>

Disassembly of section .text._svfprintf_r:

8000ffc4 <_svfiprintf_r>:
8000ffc4:	00c5d783          	lhu	a5,12(a1)
8000ffc8:	f5010113          	addi	sp,sp,-176
8000ffcc:	0a912223          	sw	s1,164(sp)
8000ffd0:	0b212023          	sw	s2,160(sp)
8000ffd4:	09312e23          	sw	s3,156(sp)
8000ffd8:	0a112623          	sw	ra,172(sp)
8000ffdc:	0a812423          	sw	s0,168(sp)
8000ffe0:	09412c23          	sw	s4,152(sp)
8000ffe4:	09512a23          	sw	s5,148(sp)
8000ffe8:	09612823          	sw	s6,144(sp)
8000ffec:	09712623          	sw	s7,140(sp)
8000fff0:	09812423          	sw	s8,136(sp)
8000fff4:	09912223          	sw	s9,132(sp)
8000fff8:	0807f793          	andi	a5,a5,128
8000fffc:	00050993          	mv	s3,a0
80010000:	00058913          	mv	s2,a1
80010004:	00060493          	mv	s1,a2
80010008:	06078863          	beqz	a5,80010078 <_svfiprintf_r+0xb4>
8001000c:	0105a783          	lw	a5,16(a1)
80010010:	06079463          	bnez	a5,80010078 <_svfiprintf_r+0xb4>
80010014:	04000593          	li	a1,64
80010018:	00d12623          	sw	a3,12(sp)
8001001c:	d79fe0ef          	jal	ra,8000ed94 <_malloc_r>
80010020:	00a92023          	sw	a0,0(s2)
80010024:	00a92823          	sw	a0,16(s2)
80010028:	00c12683          	lw	a3,12(sp)
8001002c:	04051263          	bnez	a0,80010070 <_svfiprintf_r+0xac>
80010030:	00c00793          	li	a5,12
80010034:	00f9a023          	sw	a5,0(s3)
80010038:	fff00513          	li	a0,-1
8001003c:	0ac12083          	lw	ra,172(sp)
80010040:	0a812403          	lw	s0,168(sp)
80010044:	0a412483          	lw	s1,164(sp)
80010048:	0a012903          	lw	s2,160(sp)
8001004c:	09c12983          	lw	s3,156(sp)
80010050:	09812a03          	lw	s4,152(sp)
80010054:	09412a83          	lw	s5,148(sp)
80010058:	09012b03          	lw	s6,144(sp)
8001005c:	08c12b83          	lw	s7,140(sp)
80010060:	08812c03          	lw	s8,136(sp)
80010064:	08412c83          	lw	s9,132(sp)
80010068:	0b010113          	addi	sp,sp,176
8001006c:	00008067          	ret
80010070:	04000793          	li	a5,64
80010074:	00f92a23          	sw	a5,20(s2)
80010078:	02000793          	li	a5,32
8001007c:	02f10ca3          	sb	a5,57(sp)
80010080:	03000793          	li	a5,48
80010084:	02012a23          	sw	zero,52(sp)
80010088:	02f10d23          	sb	a5,58(sp)
8001008c:	00d12e23          	sw	a3,28(sp)
80010090:	02500b13          	li	s6,37
80010094:	ffff3a97          	auipc	s5,0xffff3
80010098:	010a8a93          	addi	s5,s5,16 # 800030a4 <__sf_fake_stdout+0x20>
8001009c:	00100b93          	li	s7,1
800100a0:	7fff0c17          	auipc	s8,0x7fff0
800100a4:	f60c0c13          	addi	s8,s8,-160 # 0 <_ram_heap_end+0x7ffe8000>
800100a8:	00048413          	mv	s0,s1
800100ac:	00044783          	lbu	a5,0(s0)
800100b0:	00078463          	beqz	a5,800100b8 <_svfiprintf_r+0xf4>
800100b4:	0d679663          	bne	a5,s6,80010180 <_svfiprintf_r+0x1bc>
800100b8:	40940cb3          	sub	s9,s0,s1
800100bc:	020c8663          	beqz	s9,800100e8 <_svfiprintf_r+0x124>
800100c0:	000c8693          	mv	a3,s9
800100c4:	00048613          	mv	a2,s1
800100c8:	00090593          	mv	a1,s2
800100cc:	00098513          	mv	a0,s3
800100d0:	bcdff0ef          	jal	ra,8000fc9c <__ssputs_r>
800100d4:	fff00793          	li	a5,-1
800100d8:	24f50e63          	beq	a0,a5,80010334 <_svfiprintf_r+0x370>
800100dc:	03412683          	lw	a3,52(sp)
800100e0:	019686b3          	add	a3,a3,s9
800100e4:	02d12a23          	sw	a3,52(sp)
800100e8:	00044783          	lbu	a5,0(s0)
800100ec:	24078463          	beqz	a5,80010334 <_svfiprintf_r+0x370>
800100f0:	fff00793          	li	a5,-1
800100f4:	00140493          	addi	s1,s0,1
800100f8:	02012023          	sw	zero,32(sp)
800100fc:	02012623          	sw	zero,44(sp)
80010100:	02f12223          	sw	a5,36(sp)
80010104:	02012423          	sw	zero,40(sp)
80010108:	060101a3          	sb	zero,99(sp)
8001010c:	06012c23          	sw	zero,120(sp)
80010110:	0004c583          	lbu	a1,0(s1)
80010114:	00500613          	li	a2,5
80010118:	000a8513          	mv	a0,s5
8001011c:	39c010ef          	jal	ra,800114b8 <memchr>
80010120:	00148413          	addi	s0,s1,1
80010124:	02012783          	lw	a5,32(sp)
80010128:	06051063          	bnez	a0,80010188 <_svfiprintf_r+0x1c4>
8001012c:	0107f713          	andi	a4,a5,16
80010130:	00070663          	beqz	a4,8001013c <_svfiprintf_r+0x178>
80010134:	02000713          	li	a4,32
80010138:	06e101a3          	sb	a4,99(sp)
8001013c:	0087f713          	andi	a4,a5,8
80010140:	00070663          	beqz	a4,8001014c <_svfiprintf_r+0x188>
80010144:	02b00713          	li	a4,43
80010148:	06e101a3          	sb	a4,99(sp)
8001014c:	0004c683          	lbu	a3,0(s1)
80010150:	02a00713          	li	a4,42
80010154:	04e68663          	beq	a3,a4,800101a0 <_svfiprintf_r+0x1dc>
80010158:	02c12703          	lw	a4,44(sp)
8001015c:	00048413          	mv	s0,s1
80010160:	00000793          	li	a5,0
80010164:	00900613          	li	a2,9
80010168:	00044683          	lbu	a3,0(s0)
8001016c:	00140593          	addi	a1,s0,1
80010170:	fd068693          	addi	a3,a3,-48
80010174:	10d67a63          	bgeu	a2,a3,80010288 <_svfiprintf_r+0x2c4>
80010178:	02079e63          	bnez	a5,800101b4 <_svfiprintf_r+0x1f0>
8001017c:	0500006f          	j	800101cc <_svfiprintf_r+0x208>
80010180:	00140413          	addi	s0,s0,1
80010184:	f29ff06f          	j	800100ac <_svfiprintf_r+0xe8>
80010188:	41550533          	sub	a0,a0,s5
8001018c:	00ab9533          	sll	a0,s7,a0
80010190:	00a7e7b3          	or	a5,a5,a0
80010194:	02f12023          	sw	a5,32(sp)
80010198:	00040493          	mv	s1,s0
8001019c:	f75ff06f          	j	80010110 <_svfiprintf_r+0x14c>
800101a0:	01c12703          	lw	a4,28(sp)
800101a4:	00470693          	addi	a3,a4,4 # ffffe004 <_ram_heap_end+0x7ffe6004>
800101a8:	00072703          	lw	a4,0(a4)
800101ac:	00d12e23          	sw	a3,28(sp)
800101b0:	00074663          	bltz	a4,800101bc <_svfiprintf_r+0x1f8>
800101b4:	02e12623          	sw	a4,44(sp)
800101b8:	0140006f          	j	800101cc <_svfiprintf_r+0x208>
800101bc:	40e00733          	neg	a4,a4
800101c0:	0027e793          	ori	a5,a5,2
800101c4:	02e12623          	sw	a4,44(sp)
800101c8:	02f12023          	sw	a5,32(sp)
800101cc:	00044703          	lbu	a4,0(s0)
800101d0:	02e00793          	li	a5,46
800101d4:	02f71663          	bne	a4,a5,80010200 <_svfiprintf_r+0x23c>
800101d8:	00144703          	lbu	a4,1(s0)
800101dc:	02a00793          	li	a5,42
800101e0:	0cf71663          	bne	a4,a5,800102ac <_svfiprintf_r+0x2e8>
800101e4:	01c12783          	lw	a5,28(sp)
800101e8:	00240413          	addi	s0,s0,2
800101ec:	00478713          	addi	a4,a5,4
800101f0:	0007a783          	lw	a5,0(a5)
800101f4:	00e12e23          	sw	a4,28(sp)
800101f8:	0a07c663          	bltz	a5,800102a4 <_svfiprintf_r+0x2e0>
800101fc:	02f12223          	sw	a5,36(sp)
80010200:	00044583          	lbu	a1,0(s0)
80010204:	00300613          	li	a2,3
80010208:	ffff3517          	auipc	a0,0xffff3
8001020c:	ea450513          	addi	a0,a0,-348 # 800030ac <__sf_fake_stdout+0x28>
80010210:	2a8010ef          	jal	ra,800114b8 <memchr>
80010214:	02050463          	beqz	a0,8001023c <_svfiprintf_r+0x278>
80010218:	ffff3797          	auipc	a5,0xffff3
8001021c:	e9478793          	addi	a5,a5,-364 # 800030ac <__sf_fake_stdout+0x28>
80010220:	40f50533          	sub	a0,a0,a5
80010224:	04000793          	li	a5,64
80010228:	00a797b3          	sll	a5,a5,a0
8001022c:	02012503          	lw	a0,32(sp)
80010230:	00140413          	addi	s0,s0,1
80010234:	00f56533          	or	a0,a0,a5
80010238:	02a12023          	sw	a0,32(sp)
8001023c:	00044583          	lbu	a1,0(s0)
80010240:	00600613          	li	a2,6
80010244:	ffff3517          	auipc	a0,0xffff3
80010248:	e6c50513          	addi	a0,a0,-404 # 800030b0 <__sf_fake_stdout+0x2c>
8001024c:	00140493          	addi	s1,s0,1
80010250:	02b10c23          	sb	a1,56(sp)
80010254:	264010ef          	jal	ra,800114b8 <memchr>
80010258:	0e050a63          	beqz	a0,8001034c <_svfiprintf_r+0x388>
8001025c:	0a0c1663          	bnez	s8,80010308 <_svfiprintf_r+0x344>
80010260:	02012703          	lw	a4,32(sp)
80010264:	01c12783          	lw	a5,28(sp)
80010268:	10077713          	andi	a4,a4,256
8001026c:	08070663          	beqz	a4,800102f8 <_svfiprintf_r+0x334>
80010270:	00478793          	addi	a5,a5,4
80010274:	00f12e23          	sw	a5,28(sp)
80010278:	03412783          	lw	a5,52(sp)
8001027c:	014787b3          	add	a5,a5,s4
80010280:	02f12a23          	sw	a5,52(sp)
80010284:	e25ff06f          	j	800100a8 <_svfiprintf_r+0xe4>
80010288:	00271793          	slli	a5,a4,0x2
8001028c:	00e787b3          	add	a5,a5,a4
80010290:	00179793          	slli	a5,a5,0x1
80010294:	00d78733          	add	a4,a5,a3
80010298:	00058413          	mv	s0,a1
8001029c:	00100793          	li	a5,1
800102a0:	ec9ff06f          	j	80010168 <_svfiprintf_r+0x1a4>
800102a4:	fff00793          	li	a5,-1
800102a8:	f55ff06f          	j	800101fc <_svfiprintf_r+0x238>
800102ac:	00140413          	addi	s0,s0,1
800102b0:	02012223          	sw	zero,36(sp)
800102b4:	00000793          	li	a5,0
800102b8:	00000713          	li	a4,0
800102bc:	00900613          	li	a2,9
800102c0:	00044683          	lbu	a3,0(s0)
800102c4:	00140593          	addi	a1,s0,1
800102c8:	fd068693          	addi	a3,a3,-48
800102cc:	00d67863          	bgeu	a2,a3,800102dc <_svfiprintf_r+0x318>
800102d0:	f20788e3          	beqz	a5,80010200 <_svfiprintf_r+0x23c>
800102d4:	02e12223          	sw	a4,36(sp)
800102d8:	f29ff06f          	j	80010200 <_svfiprintf_r+0x23c>
800102dc:	00271793          	slli	a5,a4,0x2
800102e0:	00e787b3          	add	a5,a5,a4
800102e4:	00179793          	slli	a5,a5,0x1
800102e8:	00d78733          	add	a4,a5,a3
800102ec:	00058413          	mv	s0,a1
800102f0:	00100793          	li	a5,1
800102f4:	fcdff06f          	j	800102c0 <_svfiprintf_r+0x2fc>
800102f8:	00778793          	addi	a5,a5,7
800102fc:	ff87f793          	andi	a5,a5,-8
80010300:	00878793          	addi	a5,a5,8
80010304:	f71ff06f          	j	80010274 <_svfiprintf_r+0x2b0>
80010308:	01c10713          	addi	a4,sp,28
8001030c:	00000697          	auipc	a3,0x0
80010310:	99068693          	addi	a3,a3,-1648 # 8000fc9c <__ssputs_r>
80010314:	00090613          	mv	a2,s2
80010318:	02010593          	addi	a1,sp,32
8001031c:	00098513          	mv	a0,s3
80010320:	00000097          	auipc	ra,0x0
80010324:	000000e7          	jalr	zero # 0 <_ram_heap_size>
80010328:	fff00793          	li	a5,-1
8001032c:	00050a13          	mv	s4,a0
80010330:	f4f514e3          	bne	a0,a5,80010278 <_svfiprintf_r+0x2b4>
80010334:	00c95783          	lhu	a5,12(s2)
80010338:	fff00513          	li	a0,-1
8001033c:	0407f793          	andi	a5,a5,64
80010340:	ce079ee3          	bnez	a5,8001003c <_svfiprintf_r+0x78>
80010344:	03412503          	lw	a0,52(sp)
80010348:	cf5ff06f          	j	8001003c <_svfiprintf_r+0x78>
8001034c:	01c10713          	addi	a4,sp,28
80010350:	00000697          	auipc	a3,0x0
80010354:	94c68693          	addi	a3,a3,-1716 # 8000fc9c <__ssputs_r>
80010358:	00090613          	mv	a2,s2
8001035c:	02010593          	addi	a1,sp,32
80010360:	00098513          	mv	a0,s3
80010364:	1b8000ef          	jal	ra,8001051c <_printf_i>
80010368:	fc1ff06f          	j	80010328 <_svfiprintf_r+0x364>

Disassembly of section .text._printf_common:

8001036c <_printf_common>:
8001036c:	fd010113          	addi	sp,sp,-48
80010370:	01512a23          	sw	s5,20(sp)
80010374:	0105a783          	lw	a5,16(a1)
80010378:	00070a93          	mv	s5,a4
8001037c:	0085a703          	lw	a4,8(a1)
80010380:	02812423          	sw	s0,40(sp)
80010384:	02912223          	sw	s1,36(sp)
80010388:	01312e23          	sw	s3,28(sp)
8001038c:	01412c23          	sw	s4,24(sp)
80010390:	02112623          	sw	ra,44(sp)
80010394:	03212023          	sw	s2,32(sp)
80010398:	01612823          	sw	s6,16(sp)
8001039c:	01712623          	sw	s7,12(sp)
800103a0:	00050993          	mv	s3,a0
800103a4:	00058413          	mv	s0,a1
800103a8:	00060493          	mv	s1,a2
800103ac:	00068a13          	mv	s4,a3
800103b0:	00e7d463          	bge	a5,a4,800103b8 <_printf_common+0x4c>
800103b4:	00070793          	mv	a5,a4
800103b8:	00f4a023          	sw	a5,0(s1)
800103bc:	04344703          	lbu	a4,67(s0)
800103c0:	00070663          	beqz	a4,800103cc <_printf_common+0x60>
800103c4:	00178793          	addi	a5,a5,1
800103c8:	00f4a023          	sw	a5,0(s1)
800103cc:	00042783          	lw	a5,0(s0)
800103d0:	0207f793          	andi	a5,a5,32
800103d4:	00078863          	beqz	a5,800103e4 <_printf_common+0x78>
800103d8:	0004a783          	lw	a5,0(s1)
800103dc:	00278793          	addi	a5,a5,2
800103e0:	00f4a023          	sw	a5,0(s1)
800103e4:	00042903          	lw	s2,0(s0)
800103e8:	00697913          	andi	s2,s2,6
800103ec:	00091e63          	bnez	s2,80010408 <_printf_common+0x9c>
800103f0:	01940b13          	addi	s6,s0,25
800103f4:	fff00b93          	li	s7,-1
800103f8:	00c42783          	lw	a5,12(s0)
800103fc:	0004a703          	lw	a4,0(s1)
80010400:	40e787b3          	sub	a5,a5,a4
80010404:	08f94263          	blt	s2,a5,80010488 <_printf_common+0x11c>
80010408:	00042783          	lw	a5,0(s0)
8001040c:	04344683          	lbu	a3,67(s0)
80010410:	0207f793          	andi	a5,a5,32
80010414:	00d036b3          	snez	a3,a3
80010418:	0c079063          	bnez	a5,800104d8 <_printf_common+0x16c>
8001041c:	04340613          	addi	a2,s0,67
80010420:	000a0593          	mv	a1,s4
80010424:	00098513          	mv	a0,s3
80010428:	000a80e7          	jalr	s5
8001042c:	fff00793          	li	a5,-1
80010430:	06f50863          	beq	a0,a5,800104a0 <_printf_common+0x134>
80010434:	00042783          	lw	a5,0(s0)
80010438:	00400613          	li	a2,4
8001043c:	0004a703          	lw	a4,0(s1)
80010440:	0067f793          	andi	a5,a5,6
80010444:	00c42683          	lw	a3,12(s0)
80010448:	00000493          	li	s1,0
8001044c:	00c79863          	bne	a5,a2,8001045c <_printf_common+0xf0>
80010450:	40e684b3          	sub	s1,a3,a4
80010454:	0004d463          	bgez	s1,8001045c <_printf_common+0xf0>
80010458:	00000493          	li	s1,0
8001045c:	00842783          	lw	a5,8(s0)
80010460:	01042703          	lw	a4,16(s0)
80010464:	00f75663          	bge	a4,a5,80010470 <_printf_common+0x104>
80010468:	40e787b3          	sub	a5,a5,a4
8001046c:	00f484b3          	add	s1,s1,a5
80010470:	00000913          	li	s2,0
80010474:	01a40413          	addi	s0,s0,26
80010478:	fff00b13          	li	s6,-1
8001047c:	09249063          	bne	s1,s2,800104fc <_printf_common+0x190>
80010480:	00000513          	li	a0,0
80010484:	0200006f          	j	800104a4 <_printf_common+0x138>
80010488:	00100693          	li	a3,1
8001048c:	000b0613          	mv	a2,s6
80010490:	000a0593          	mv	a1,s4
80010494:	00098513          	mv	a0,s3
80010498:	000a80e7          	jalr	s5
8001049c:	03751a63          	bne	a0,s7,800104d0 <_printf_common+0x164>
800104a0:	fff00513          	li	a0,-1
800104a4:	02c12083          	lw	ra,44(sp)
800104a8:	02812403          	lw	s0,40(sp)
800104ac:	02412483          	lw	s1,36(sp)
800104b0:	02012903          	lw	s2,32(sp)
800104b4:	01c12983          	lw	s3,28(sp)
800104b8:	01812a03          	lw	s4,24(sp)
800104bc:	01412a83          	lw	s5,20(sp)
800104c0:	01012b03          	lw	s6,16(sp)
800104c4:	00c12b83          	lw	s7,12(sp)
800104c8:	03010113          	addi	sp,sp,48
800104cc:	00008067          	ret
800104d0:	00190913          	addi	s2,s2,1
800104d4:	f25ff06f          	j	800103f8 <_printf_common+0x8c>
800104d8:	00d40733          	add	a4,s0,a3
800104dc:	03000613          	li	a2,48
800104e0:	04c701a3          	sb	a2,67(a4)
800104e4:	04544703          	lbu	a4,69(s0)
800104e8:	00168793          	addi	a5,a3,1
800104ec:	00f407b3          	add	a5,s0,a5
800104f0:	00268693          	addi	a3,a3,2
800104f4:	04e781a3          	sb	a4,67(a5)
800104f8:	f25ff06f          	j	8001041c <_printf_common+0xb0>
800104fc:	00100693          	li	a3,1
80010500:	00040613          	mv	a2,s0
80010504:	000a0593          	mv	a1,s4
80010508:	00098513          	mv	a0,s3
8001050c:	000a80e7          	jalr	s5
80010510:	f96508e3          	beq	a0,s6,800104a0 <_printf_common+0x134>
80010514:	00190913          	addi	s2,s2,1
80010518:	f65ff06f          	j	8001047c <_printf_common+0x110>

Disassembly of section .text._printf_i:

8001051c <_printf_i>:
8001051c:	fc010113          	addi	sp,sp,-64
80010520:	02812c23          	sw	s0,56(sp)
80010524:	03312623          	sw	s3,44(sp)
80010528:	03512223          	sw	s5,36(sp)
8001052c:	03612023          	sw	s6,32(sp)
80010530:	01712e23          	sw	s7,28(sp)
80010534:	02112e23          	sw	ra,60(sp)
80010538:	02912a23          	sw	s1,52(sp)
8001053c:	03212823          	sw	s2,48(sp)
80010540:	03412423          	sw	s4,40(sp)
80010544:	01812c23          	sw	s8,24(sp)
80010548:	0185c783          	lbu	a5,24(a1)
8001054c:	00068b93          	mv	s7,a3
80010550:	06e00693          	li	a3,110
80010554:	00050a93          	mv	s5,a0
80010558:	00058413          	mv	s0,a1
8001055c:	00060b13          	mv	s6,a2
80010560:	04358993          	addi	s3,a1,67
80010564:	28d78c63          	beq	a5,a3,800107fc <_printf_i+0x2e0>
80010568:	06f6e863          	bltu	a3,a5,800105d8 <_printf_i+0xbc>
8001056c:	06300693          	li	a3,99
80010570:	0ad78c63          	beq	a5,a3,80010628 <_printf_i+0x10c>
80010574:	00f6ec63          	bltu	a3,a5,8001058c <_printf_i+0x70>
80010578:	2c078063          	beqz	a5,80010838 <_printf_i+0x31c>
8001057c:	05800693          	li	a3,88
80010580:	12d78863          	beq	a5,a3,800106b0 <_printf_i+0x194>
80010584:	04240c13          	addi	s8,s0,66
80010588:	0b40006f          	j	8001063c <_printf_i+0x120>
8001058c:	06400693          	li	a3,100
80010590:	00d78663          	beq	a5,a3,8001059c <_printf_i+0x80>
80010594:	06900693          	li	a3,105
80010598:	fed796e3          	bne	a5,a3,80010584 <_printf_i+0x68>
8001059c:	00042783          	lw	a5,0(s0)
800105a0:	00072603          	lw	a2,0(a4)
800105a4:	0807f593          	andi	a1,a5,128
800105a8:	00460693          	addi	a3,a2,4
800105ac:	08058e63          	beqz	a1,80010648 <_printf_i+0x12c>
800105b0:	00062483          	lw	s1,0(a2)
800105b4:	00d72023          	sw	a3,0(a4)
800105b8:	0004d863          	bgez	s1,800105c8 <_printf_i+0xac>
800105bc:	02d00793          	li	a5,45
800105c0:	409004b3          	neg	s1,s1
800105c4:	04f401a3          	sb	a5,67(s0)
800105c8:	ffff3a17          	auipc	s4,0xffff3
800105cc:	af0a0a13          	addi	s4,s4,-1296 # 800030b8 <__sf_fake_stdout+0x34>
800105d0:	00a00913          	li	s2,10
800105d4:	12c0006f          	j	80010700 <_printf_i+0x1e4>
800105d8:	07300693          	li	a3,115
800105dc:	26d78463          	beq	a5,a3,80010844 <_printf_i+0x328>
800105e0:	02f6e263          	bltu	a3,a5,80010604 <_printf_i+0xe8>
800105e4:	06f00693          	li	a3,111
800105e8:	06d78e63          	beq	a5,a3,80010664 <_printf_i+0x148>
800105ec:	07000693          	li	a3,112
800105f0:	f8d79ae3          	bne	a5,a3,80010584 <_printf_i+0x68>
800105f4:	0005a783          	lw	a5,0(a1)
800105f8:	0207e793          	ori	a5,a5,32
800105fc:	00f5a023          	sw	a5,0(a1)
80010600:	0140006f          	j	80010614 <_printf_i+0xf8>
80010604:	07500693          	li	a3,117
80010608:	04d78e63          	beq	a5,a3,80010664 <_printf_i+0x148>
8001060c:	07800693          	li	a3,120
80010610:	f6d79ae3          	bne	a5,a3,80010584 <_printf_i+0x68>
80010614:	07800793          	li	a5,120
80010618:	04f402a3          	sb	a5,69(s0)
8001061c:	ffff3a17          	auipc	s4,0xffff3
80010620:	ab0a0a13          	addi	s4,s4,-1360 # 800030cc <__sf_fake_stdout+0x48>
80010624:	0980006f          	j	800106bc <_printf_i+0x1a0>
80010628:	00072783          	lw	a5,0(a4)
8001062c:	04258c13          	addi	s8,a1,66
80010630:	00478693          	addi	a3,a5,4
80010634:	0007a783          	lw	a5,0(a5)
80010638:	00d72023          	sw	a3,0(a4)
8001063c:	04f40123          	sb	a5,66(s0)
80010640:	00100793          	li	a5,1
80010644:	2300006f          	j	80010874 <_printf_i+0x358>
80010648:	00062483          	lw	s1,0(a2)
8001064c:	0407f793          	andi	a5,a5,64
80010650:	00d72023          	sw	a3,0(a4)
80010654:	f60782e3          	beqz	a5,800105b8 <_printf_i+0x9c>
80010658:	01049493          	slli	s1,s1,0x10
8001065c:	4104d493          	srai	s1,s1,0x10
80010660:	f59ff06f          	j	800105b8 <_printf_i+0x9c>
80010664:	00042603          	lw	a2,0(s0)
80010668:	00072683          	lw	a3,0(a4)
8001066c:	08067513          	andi	a0,a2,128
80010670:	00468593          	addi	a1,a3,4
80010674:	00050863          	beqz	a0,80010684 <_printf_i+0x168>
80010678:	00b72023          	sw	a1,0(a4)
8001067c:	0006a483          	lw	s1,0(a3)
80010680:	0140006f          	j	80010694 <_printf_i+0x178>
80010684:	04067613          	andi	a2,a2,64
80010688:	00b72023          	sw	a1,0(a4)
8001068c:	fe0608e3          	beqz	a2,8001067c <_printf_i+0x160>
80010690:	0006d483          	lhu	s1,0(a3)
80010694:	06f00713          	li	a4,111
80010698:	ffff3a17          	auipc	s4,0xffff3
8001069c:	a20a0a13          	addi	s4,s4,-1504 # 800030b8 <__sf_fake_stdout+0x34>
800106a0:	00a00913          	li	s2,10
800106a4:	04e79c63          	bne	a5,a4,800106fc <_printf_i+0x1e0>
800106a8:	00800913          	li	s2,8
800106ac:	0500006f          	j	800106fc <_printf_i+0x1e0>
800106b0:	04f582a3          	sb	a5,69(a1)
800106b4:	ffff3a17          	auipc	s4,0xffff3
800106b8:	a04a0a13          	addi	s4,s4,-1532 # 800030b8 <__sf_fake_stdout+0x34>
800106bc:	00042783          	lw	a5,0(s0)
800106c0:	00072683          	lw	a3,0(a4)
800106c4:	0807f613          	andi	a2,a5,128
800106c8:	0006a483          	lw	s1,0(a3)
800106cc:	00468693          	addi	a3,a3,4
800106d0:	10060663          	beqz	a2,800107dc <_printf_i+0x2c0>
800106d4:	00d72023          	sw	a3,0(a4)
800106d8:	0017f713          	andi	a4,a5,1
800106dc:	00070663          	beqz	a4,800106e8 <_printf_i+0x1cc>
800106e0:	0207e793          	ori	a5,a5,32
800106e4:	00f42023          	sw	a5,0(s0)
800106e8:	01000913          	li	s2,16
800106ec:	00049863          	bnez	s1,800106fc <_printf_i+0x1e0>
800106f0:	00042783          	lw	a5,0(s0)
800106f4:	fdf7f793          	andi	a5,a5,-33
800106f8:	00f42023          	sw	a5,0(s0)
800106fc:	040401a3          	sb	zero,67(s0)
80010700:	00442783          	lw	a5,4(s0)
80010704:	00f42423          	sw	a5,8(s0)
80010708:	0007c863          	bltz	a5,80010718 <_printf_i+0x1fc>
8001070c:	00042703          	lw	a4,0(s0)
80010710:	ffb77713          	andi	a4,a4,-5
80010714:	00e42023          	sw	a4,0(s0)
80010718:	00049663          	bnez	s1,80010724 <_printf_i+0x208>
8001071c:	00098c13          	mv	s8,s3
80010720:	02078a63          	beqz	a5,80010754 <_printf_i+0x238>
80010724:	00098c13          	mv	s8,s3
80010728:	00090593          	mv	a1,s2
8001072c:	00048513          	mv	a0,s1
80010730:	d80fd0ef          	jal	ra,8000dcb0 <__umodsi3>
80010734:	00aa0533          	add	a0,s4,a0
80010738:	00054783          	lbu	a5,0(a0)
8001073c:	fffc0c13          	addi	s8,s8,-1
80010740:	00090593          	mv	a1,s2
80010744:	00fc0023          	sb	a5,0(s8)
80010748:	00048513          	mv	a0,s1
8001074c:	d1cfd0ef          	jal	ra,8000dc68 <__udivsi3>
80010750:	0b24f263          	bgeu	s1,s2,800107f4 <_printf_i+0x2d8>
80010754:	00800793          	li	a5,8
80010758:	02f91463          	bne	s2,a5,80010780 <_printf_i+0x264>
8001075c:	00042783          	lw	a5,0(s0)
80010760:	0017f793          	andi	a5,a5,1
80010764:	00078e63          	beqz	a5,80010780 <_printf_i+0x264>
80010768:	00442703          	lw	a4,4(s0)
8001076c:	01042783          	lw	a5,16(s0)
80010770:	00e7c863          	blt	a5,a4,80010780 <_printf_i+0x264>
80010774:	03000793          	li	a5,48
80010778:	fefc0fa3          	sb	a5,-1(s8)
8001077c:	fffc0c13          	addi	s8,s8,-1
80010780:	418989b3          	sub	s3,s3,s8
80010784:	01342823          	sw	s3,16(s0)
80010788:	000b8713          	mv	a4,s7
8001078c:	000b0693          	mv	a3,s6
80010790:	00c10613          	addi	a2,sp,12
80010794:	00040593          	mv	a1,s0
80010798:	000a8513          	mv	a0,s5
8001079c:	bd1ff0ef          	jal	ra,8001036c <_printf_common>
800107a0:	fff00493          	li	s1,-1
800107a4:	0c951e63          	bne	a0,s1,80010880 <_printf_i+0x364>
800107a8:	fff00513          	li	a0,-1
800107ac:	03c12083          	lw	ra,60(sp)
800107b0:	03812403          	lw	s0,56(sp)
800107b4:	03412483          	lw	s1,52(sp)
800107b8:	03012903          	lw	s2,48(sp)
800107bc:	02c12983          	lw	s3,44(sp)
800107c0:	02812a03          	lw	s4,40(sp)
800107c4:	02412a83          	lw	s5,36(sp)
800107c8:	02012b03          	lw	s6,32(sp)
800107cc:	01c12b83          	lw	s7,28(sp)
800107d0:	01812c03          	lw	s8,24(sp)
800107d4:	04010113          	addi	sp,sp,64
800107d8:	00008067          	ret
800107dc:	0407f613          	andi	a2,a5,64
800107e0:	00d72023          	sw	a3,0(a4)
800107e4:	ee060ae3          	beqz	a2,800106d8 <_printf_i+0x1bc>
800107e8:	01049493          	slli	s1,s1,0x10
800107ec:	0104d493          	srli	s1,s1,0x10
800107f0:	ee9ff06f          	j	800106d8 <_printf_i+0x1bc>
800107f4:	00050493          	mv	s1,a0
800107f8:	f31ff06f          	j	80010728 <_printf_i+0x20c>
800107fc:	0005a683          	lw	a3,0(a1)
80010800:	00072783          	lw	a5,0(a4)
80010804:	0145a603          	lw	a2,20(a1)
80010808:	0806f513          	andi	a0,a3,128
8001080c:	00478593          	addi	a1,a5,4
80010810:	00050a63          	beqz	a0,80010824 <_printf_i+0x308>
80010814:	00b72023          	sw	a1,0(a4)
80010818:	0007a783          	lw	a5,0(a5)
8001081c:	00c7a023          	sw	a2,0(a5)
80010820:	0180006f          	j	80010838 <_printf_i+0x31c>
80010824:	00b72023          	sw	a1,0(a4)
80010828:	0406f693          	andi	a3,a3,64
8001082c:	0007a783          	lw	a5,0(a5)
80010830:	fe0686e3          	beqz	a3,8001081c <_printf_i+0x300>
80010834:	00c79023          	sh	a2,0(a5)
80010838:	00042823          	sw	zero,16(s0)
8001083c:	00098c13          	mv	s8,s3
80010840:	f49ff06f          	j	80010788 <_printf_i+0x26c>
80010844:	00072783          	lw	a5,0(a4)
80010848:	0045a603          	lw	a2,4(a1)
8001084c:	00000593          	li	a1,0
80010850:	00478693          	addi	a3,a5,4
80010854:	00d72023          	sw	a3,0(a4)
80010858:	0007ac03          	lw	s8,0(a5)
8001085c:	000c0513          	mv	a0,s8
80010860:	459000ef          	jal	ra,800114b8 <memchr>
80010864:	00050663          	beqz	a0,80010870 <_printf_i+0x354>
80010868:	41850533          	sub	a0,a0,s8
8001086c:	00a42223          	sw	a0,4(s0)
80010870:	00442783          	lw	a5,4(s0)
80010874:	00f42823          	sw	a5,16(s0)
80010878:	040401a3          	sb	zero,67(s0)
8001087c:	f0dff06f          	j	80010788 <_printf_i+0x26c>
80010880:	01042683          	lw	a3,16(s0)
80010884:	000c0613          	mv	a2,s8
80010888:	000b0593          	mv	a1,s6
8001088c:	000a8513          	mv	a0,s5
80010890:	000b80e7          	jalr	s7
80010894:	f0950ae3          	beq	a0,s1,800107a8 <_printf_i+0x28c>
80010898:	00042783          	lw	a5,0(s0)
8001089c:	0027f793          	andi	a5,a5,2
800108a0:	04079463          	bnez	a5,800108e8 <_printf_i+0x3cc>
800108a4:	00c12783          	lw	a5,12(sp)
800108a8:	00c42503          	lw	a0,12(s0)
800108ac:	f0f550e3          	bge	a0,a5,800107ac <_printf_i+0x290>
800108b0:	00078513          	mv	a0,a5
800108b4:	ef9ff06f          	j	800107ac <_printf_i+0x290>
800108b8:	00100693          	li	a3,1
800108bc:	00090613          	mv	a2,s2
800108c0:	000b0593          	mv	a1,s6
800108c4:	000a8513          	mv	a0,s5
800108c8:	000b80e7          	jalr	s7
800108cc:	ed350ee3          	beq	a0,s3,800107a8 <_printf_i+0x28c>
800108d0:	00148493          	addi	s1,s1,1
800108d4:	00c42783          	lw	a5,12(s0)
800108d8:	00c12703          	lw	a4,12(sp)
800108dc:	40e787b3          	sub	a5,a5,a4
800108e0:	fcf4cce3          	blt	s1,a5,800108b8 <_printf_i+0x39c>
800108e4:	fc1ff06f          	j	800108a4 <_printf_i+0x388>
800108e8:	00000493          	li	s1,0
800108ec:	01940913          	addi	s2,s0,25
800108f0:	fff00993          	li	s3,-1
800108f4:	fe1ff06f          	j	800108d4 <_printf_i+0x3b8>

Disassembly of section .text.__sfputc_r:

800108f8 <__sfputc_r>:
800108f8:	00862783          	lw	a5,8(a2)
800108fc:	fff78793          	addi	a5,a5,-1
80010900:	00f62423          	sw	a5,8(a2)
80010904:	0007dc63          	bgez	a5,8001091c <__sfputc_r+0x24>
80010908:	01862703          	lw	a4,24(a2)
8001090c:	00e7c663          	blt	a5,a4,80010918 <__sfputc_r+0x20>
80010910:	00a00793          	li	a5,10
80010914:	00f59463          	bne	a1,a5,8001091c <__sfputc_r+0x24>
80010918:	e65fe06f          	j	8000f77c <__swbuf_r>
8001091c:	00062783          	lw	a5,0(a2)
80010920:	00058513          	mv	a0,a1
80010924:	00178713          	addi	a4,a5,1
80010928:	00e62023          	sw	a4,0(a2)
8001092c:	00b78023          	sb	a1,0(a5)
80010930:	00008067          	ret

Disassembly of section .text.__sfputs_r:

80010934 <__sfputs_r>:
80010934:	fe010113          	addi	sp,sp,-32
80010938:	00812c23          	sw	s0,24(sp)
8001093c:	00912a23          	sw	s1,20(sp)
80010940:	01212823          	sw	s2,16(sp)
80010944:	01312623          	sw	s3,12(sp)
80010948:	01412423          	sw	s4,8(sp)
8001094c:	00112e23          	sw	ra,28(sp)
80010950:	00050913          	mv	s2,a0
80010954:	00058993          	mv	s3,a1
80010958:	00060413          	mv	s0,a2
8001095c:	00d604b3          	add	s1,a2,a3
80010960:	fff00a13          	li	s4,-1
80010964:	00941663          	bne	s0,s1,80010970 <__sfputs_r+0x3c>
80010968:	00000513          	li	a0,0
8001096c:	01c0006f          	j	80010988 <__sfputs_r+0x54>
80010970:	00044583          	lbu	a1,0(s0)
80010974:	00098613          	mv	a2,s3
80010978:	00090513          	mv	a0,s2
8001097c:	f7dff0ef          	jal	ra,800108f8 <__sfputc_r>
80010980:	00140413          	addi	s0,s0,1
80010984:	ff4510e3          	bne	a0,s4,80010964 <__sfputs_r+0x30>
80010988:	01c12083          	lw	ra,28(sp)
8001098c:	01812403          	lw	s0,24(sp)
80010990:	01412483          	lw	s1,20(sp)
80010994:	01012903          	lw	s2,16(sp)
80010998:	00c12983          	lw	s3,12(sp)
8001099c:	00812a03          	lw	s4,8(sp)
800109a0:	02010113          	addi	sp,sp,32
800109a4:	00008067          	ret

Disassembly of section .text.__sprint_r:

800109a8 <__sprint_r>:
800109a8:	00862703          	lw	a4,8(a2)
800109ac:	ff010113          	addi	sp,sp,-16
800109b0:	00812423          	sw	s0,8(sp)
800109b4:	00112623          	sw	ra,12(sp)
800109b8:	00060413          	mv	s0,a2
800109bc:	00071e63          	bnez	a4,800109d8 <__sprint_r+0x30>
800109c0:	00062223          	sw	zero,4(a2)
800109c4:	00000513          	li	a0,0
800109c8:	00c12083          	lw	ra,12(sp)
800109cc:	00812403          	lw	s0,8(sp)
800109d0:	01010113          	addi	sp,sp,16
800109d4:	00008067          	ret
800109d8:	63c000ef          	jal	ra,80011014 <__sfvwrite_r>
800109dc:	00042423          	sw	zero,8(s0)
800109e0:	00042223          	sw	zero,4(s0)
800109e4:	fe5ff06f          	j	800109c8 <__sprint_r+0x20>

Disassembly of section .text._vfprintf_r:

800109e8 <_vfiprintf_r>:
800109e8:	f6010113          	addi	sp,sp,-160
800109ec:	08812c23          	sw	s0,152(sp)
800109f0:	08912a23          	sw	s1,148(sp)
800109f4:	09212823          	sw	s2,144(sp)
800109f8:	09312623          	sw	s3,140(sp)
800109fc:	08112e23          	sw	ra,156(sp)
80010a00:	09412423          	sw	s4,136(sp)
80010a04:	09512223          	sw	s5,132(sp)
80010a08:	09612023          	sw	s6,128(sp)
80010a0c:	07712e23          	sw	s7,124(sp)
80010a10:	07812c23          	sw	s8,120(sp)
80010a14:	07912a23          	sw	s9,116(sp)
80010a18:	00050993          	mv	s3,a0
80010a1c:	00058493          	mv	s1,a1
80010a20:	00060913          	mv	s2,a2
80010a24:	00068413          	mv	s0,a3
80010a28:	00050863          	beqz	a0,80010a38 <_vfiprintf_r+0x50>
80010a2c:	01852783          	lw	a5,24(a0)
80010a30:	00079463          	bnez	a5,80010a38 <_vfiprintf_r+0x50>
80010a34:	c61fd0ef          	jal	ra,8000e694 <__sinit>
80010a38:	ffff2797          	auipc	a5,0xffff2
80010a3c:	62c78793          	addi	a5,a5,1580 # 80003064 <__sf_fake_stdin>
80010a40:	12f49263          	bne	s1,a5,80010b64 <_vfiprintf_r+0x17c>
80010a44:	0049a483          	lw	s1,4(s3)
80010a48:	00c4d783          	lhu	a5,12(s1)
80010a4c:	0087f793          	andi	a5,a5,8
80010a50:	12078e63          	beqz	a5,80010b8c <_vfiprintf_r+0x1a4>
80010a54:	0104a783          	lw	a5,16(s1)
80010a58:	12078a63          	beqz	a5,80010b8c <_vfiprintf_r+0x1a4>
80010a5c:	02000793          	li	a5,32
80010a60:	02f104a3          	sb	a5,41(sp)
80010a64:	03000793          	li	a5,48
80010a68:	02012223          	sw	zero,36(sp)
80010a6c:	02f10523          	sb	a5,42(sp)
80010a70:	00812623          	sw	s0,12(sp)
80010a74:	02500b13          	li	s6,37
80010a78:	ffff2a97          	auipc	s5,0xffff2
80010a7c:	62ca8a93          	addi	s5,s5,1580 # 800030a4 <__sf_fake_stdout+0x20>
80010a80:	00100b93          	li	s7,1
80010a84:	7ffefc17          	auipc	s8,0x7ffef
80010a88:	57cc0c13          	addi	s8,s8,1404 # 0 <_ram_heap_end+0x7ffe8000>
80010a8c:	00090413          	mv	s0,s2
80010a90:	00044783          	lbu	a5,0(s0)
80010a94:	00078463          	beqz	a5,80010a9c <_vfiprintf_r+0xb4>
80010a98:	13679e63          	bne	a5,s6,80010bd4 <_vfiprintf_r+0x1ec>
80010a9c:	41240cb3          	sub	s9,s0,s2
80010aa0:	020c8663          	beqz	s9,80010acc <_vfiprintf_r+0xe4>
80010aa4:	000c8693          	mv	a3,s9
80010aa8:	00090613          	mv	a2,s2
80010aac:	00048593          	mv	a1,s1
80010ab0:	00098513          	mv	a0,s3
80010ab4:	e81ff0ef          	jal	ra,80010934 <__sfputs_r>
80010ab8:	fff00793          	li	a5,-1
80010abc:	2cf50663          	beq	a0,a5,80010d88 <_vfiprintf_r+0x3a0>
80010ac0:	02412683          	lw	a3,36(sp)
80010ac4:	019686b3          	add	a3,a3,s9
80010ac8:	02d12223          	sw	a3,36(sp)
80010acc:	00044783          	lbu	a5,0(s0)
80010ad0:	2a078c63          	beqz	a5,80010d88 <_vfiprintf_r+0x3a0>
80010ad4:	fff00793          	li	a5,-1
80010ad8:	00140913          	addi	s2,s0,1
80010adc:	00012823          	sw	zero,16(sp)
80010ae0:	00012e23          	sw	zero,28(sp)
80010ae4:	00f12a23          	sw	a5,20(sp)
80010ae8:	00012c23          	sw	zero,24(sp)
80010aec:	040109a3          	sb	zero,83(sp)
80010af0:	06012423          	sw	zero,104(sp)
80010af4:	00094583          	lbu	a1,0(s2)
80010af8:	00500613          	li	a2,5
80010afc:	000a8513          	mv	a0,s5
80010b00:	1b9000ef          	jal	ra,800114b8 <memchr>
80010b04:	00190413          	addi	s0,s2,1
80010b08:	01012783          	lw	a5,16(sp)
80010b0c:	0c051863          	bnez	a0,80010bdc <_vfiprintf_r+0x1f4>
80010b10:	0107f713          	andi	a4,a5,16
80010b14:	00070663          	beqz	a4,80010b20 <_vfiprintf_r+0x138>
80010b18:	02000713          	li	a4,32
80010b1c:	04e109a3          	sb	a4,83(sp)
80010b20:	0087f713          	andi	a4,a5,8
80010b24:	00070663          	beqz	a4,80010b30 <_vfiprintf_r+0x148>
80010b28:	02b00713          	li	a4,43
80010b2c:	04e109a3          	sb	a4,83(sp)
80010b30:	00094683          	lbu	a3,0(s2)
80010b34:	02a00713          	li	a4,42
80010b38:	0ae68e63          	beq	a3,a4,80010bf4 <_vfiprintf_r+0x20c>
80010b3c:	01c12703          	lw	a4,28(sp)
80010b40:	00090413          	mv	s0,s2
80010b44:	00000793          	li	a5,0
80010b48:	00900613          	li	a2,9
80010b4c:	00044683          	lbu	a3,0(s0)
80010b50:	00140593          	addi	a1,s0,1
80010b54:	fd068693          	addi	a3,a3,-48
80010b58:	18d67263          	bgeu	a2,a3,80010cdc <_vfiprintf_r+0x2f4>
80010b5c:	0a079663          	bnez	a5,80010c08 <_vfiprintf_r+0x220>
80010b60:	0c00006f          	j	80010c20 <_vfiprintf_r+0x238>
80010b64:	ffff2797          	auipc	a5,0xffff2
80010b68:	52078793          	addi	a5,a5,1312 # 80003084 <__sf_fake_stdout>
80010b6c:	00f49663          	bne	s1,a5,80010b78 <_vfiprintf_r+0x190>
80010b70:	0089a483          	lw	s1,8(s3)
80010b74:	ed5ff06f          	j	80010a48 <_vfiprintf_r+0x60>
80010b78:	ffff2797          	auipc	a5,0xffff2
80010b7c:	4cc78793          	addi	a5,a5,1228 # 80003044 <__sf_fake_stderr>
80010b80:	ecf494e3          	bne	s1,a5,80010a48 <_vfiprintf_r+0x60>
80010b84:	00c9a483          	lw	s1,12(s3)
80010b88:	ec1ff06f          	j	80010a48 <_vfiprintf_r+0x60>
80010b8c:	00048593          	mv	a1,s1
80010b90:	00098513          	mv	a0,s3
80010b94:	d81fe0ef          	jal	ra,8000f914 <__swsetup_r>
80010b98:	ec0502e3          	beqz	a0,80010a5c <_vfiprintf_r+0x74>
80010b9c:	fff00513          	li	a0,-1
80010ba0:	09c12083          	lw	ra,156(sp)
80010ba4:	09812403          	lw	s0,152(sp)
80010ba8:	09412483          	lw	s1,148(sp)
80010bac:	09012903          	lw	s2,144(sp)
80010bb0:	08c12983          	lw	s3,140(sp)
80010bb4:	08812a03          	lw	s4,136(sp)
80010bb8:	08412a83          	lw	s5,132(sp)
80010bbc:	08012b03          	lw	s6,128(sp)
80010bc0:	07c12b83          	lw	s7,124(sp)
80010bc4:	07812c03          	lw	s8,120(sp)
80010bc8:	07412c83          	lw	s9,116(sp)
80010bcc:	0a010113          	addi	sp,sp,160
80010bd0:	00008067          	ret
80010bd4:	00140413          	addi	s0,s0,1
80010bd8:	eb9ff06f          	j	80010a90 <_vfiprintf_r+0xa8>
80010bdc:	41550533          	sub	a0,a0,s5
80010be0:	00ab9533          	sll	a0,s7,a0
80010be4:	00a7e7b3          	or	a5,a5,a0
80010be8:	00f12823          	sw	a5,16(sp)
80010bec:	00040913          	mv	s2,s0
80010bf0:	f05ff06f          	j	80010af4 <_vfiprintf_r+0x10c>
80010bf4:	00c12703          	lw	a4,12(sp)
80010bf8:	00470693          	addi	a3,a4,4
80010bfc:	00072703          	lw	a4,0(a4)
80010c00:	00d12623          	sw	a3,12(sp)
80010c04:	00074663          	bltz	a4,80010c10 <_vfiprintf_r+0x228>
80010c08:	00e12e23          	sw	a4,28(sp)
80010c0c:	0140006f          	j	80010c20 <_vfiprintf_r+0x238>
80010c10:	40e00733          	neg	a4,a4
80010c14:	0027e793          	ori	a5,a5,2
80010c18:	00e12e23          	sw	a4,28(sp)
80010c1c:	00f12823          	sw	a5,16(sp)
80010c20:	00044703          	lbu	a4,0(s0)
80010c24:	02e00793          	li	a5,46
80010c28:	02f71663          	bne	a4,a5,80010c54 <_vfiprintf_r+0x26c>
80010c2c:	00144703          	lbu	a4,1(s0)
80010c30:	02a00793          	li	a5,42
80010c34:	0cf71663          	bne	a4,a5,80010d00 <_vfiprintf_r+0x318>
80010c38:	00c12783          	lw	a5,12(sp)
80010c3c:	00240413          	addi	s0,s0,2
80010c40:	00478713          	addi	a4,a5,4
80010c44:	0007a783          	lw	a5,0(a5)
80010c48:	00e12623          	sw	a4,12(sp)
80010c4c:	0a07c663          	bltz	a5,80010cf8 <_vfiprintf_r+0x310>
80010c50:	00f12a23          	sw	a5,20(sp)
80010c54:	00044583          	lbu	a1,0(s0)
80010c58:	00300613          	li	a2,3
80010c5c:	ffff2517          	auipc	a0,0xffff2
80010c60:	45050513          	addi	a0,a0,1104 # 800030ac <__sf_fake_stdout+0x28>
80010c64:	055000ef          	jal	ra,800114b8 <memchr>
80010c68:	02050463          	beqz	a0,80010c90 <_vfiprintf_r+0x2a8>
80010c6c:	ffff2797          	auipc	a5,0xffff2
80010c70:	44078793          	addi	a5,a5,1088 # 800030ac <__sf_fake_stdout+0x28>
80010c74:	40f50533          	sub	a0,a0,a5
80010c78:	04000793          	li	a5,64
80010c7c:	00a797b3          	sll	a5,a5,a0
80010c80:	01012503          	lw	a0,16(sp)
80010c84:	00140413          	addi	s0,s0,1
80010c88:	00f56533          	or	a0,a0,a5
80010c8c:	00a12823          	sw	a0,16(sp)
80010c90:	00044583          	lbu	a1,0(s0)
80010c94:	00600613          	li	a2,6
80010c98:	ffff2517          	auipc	a0,0xffff2
80010c9c:	41850513          	addi	a0,a0,1048 # 800030b0 <__sf_fake_stdout+0x2c>
80010ca0:	00140913          	addi	s2,s0,1
80010ca4:	02b10423          	sb	a1,40(sp)
80010ca8:	011000ef          	jal	ra,800114b8 <memchr>
80010cac:	0e050863          	beqz	a0,80010d9c <_vfiprintf_r+0x3b4>
80010cb0:	0a0c1663          	bnez	s8,80010d5c <_vfiprintf_r+0x374>
80010cb4:	01012703          	lw	a4,16(sp)
80010cb8:	00c12783          	lw	a5,12(sp)
80010cbc:	10077713          	andi	a4,a4,256
80010cc0:	08070663          	beqz	a4,80010d4c <_vfiprintf_r+0x364>
80010cc4:	00478793          	addi	a5,a5,4
80010cc8:	00f12623          	sw	a5,12(sp)
80010ccc:	02412783          	lw	a5,36(sp)
80010cd0:	014787b3          	add	a5,a5,s4
80010cd4:	02f12223          	sw	a5,36(sp)
80010cd8:	db5ff06f          	j	80010a8c <_vfiprintf_r+0xa4>
80010cdc:	00271793          	slli	a5,a4,0x2
80010ce0:	00e787b3          	add	a5,a5,a4
80010ce4:	00179793          	slli	a5,a5,0x1
80010ce8:	00d78733          	add	a4,a5,a3
80010cec:	00058413          	mv	s0,a1
80010cf0:	00100793          	li	a5,1
80010cf4:	e59ff06f          	j	80010b4c <_vfiprintf_r+0x164>
80010cf8:	fff00793          	li	a5,-1
80010cfc:	f55ff06f          	j	80010c50 <_vfiprintf_r+0x268>
80010d00:	00140413          	addi	s0,s0,1
80010d04:	00012a23          	sw	zero,20(sp)
80010d08:	00000793          	li	a5,0
80010d0c:	00000713          	li	a4,0
80010d10:	00900613          	li	a2,9
80010d14:	00044683          	lbu	a3,0(s0)
80010d18:	00140593          	addi	a1,s0,1
80010d1c:	fd068693          	addi	a3,a3,-48
80010d20:	00d67863          	bgeu	a2,a3,80010d30 <_vfiprintf_r+0x348>
80010d24:	f20788e3          	beqz	a5,80010c54 <_vfiprintf_r+0x26c>
80010d28:	00e12a23          	sw	a4,20(sp)
80010d2c:	f29ff06f          	j	80010c54 <_vfiprintf_r+0x26c>
80010d30:	00271793          	slli	a5,a4,0x2
80010d34:	00e787b3          	add	a5,a5,a4
80010d38:	00179793          	slli	a5,a5,0x1
80010d3c:	00d78733          	add	a4,a5,a3
80010d40:	00058413          	mv	s0,a1
80010d44:	00100793          	li	a5,1
80010d48:	fcdff06f          	j	80010d14 <_vfiprintf_r+0x32c>
80010d4c:	00778793          	addi	a5,a5,7
80010d50:	ff87f793          	andi	a5,a5,-8
80010d54:	00878793          	addi	a5,a5,8
80010d58:	f71ff06f          	j	80010cc8 <_vfiprintf_r+0x2e0>
80010d5c:	00c10713          	addi	a4,sp,12
80010d60:	00000697          	auipc	a3,0x0
80010d64:	bd468693          	addi	a3,a3,-1068 # 80010934 <__sfputs_r>
80010d68:	00048613          	mv	a2,s1
80010d6c:	01010593          	addi	a1,sp,16
80010d70:	00098513          	mv	a0,s3
80010d74:	00000097          	auipc	ra,0x0
80010d78:	000000e7          	jalr	zero # 0 <_ram_heap_size>
80010d7c:	fff00793          	li	a5,-1
80010d80:	00050a13          	mv	s4,a0
80010d84:	f4f514e3          	bne	a0,a5,80010ccc <_vfiprintf_r+0x2e4>
80010d88:	00c4d783          	lhu	a5,12(s1)
80010d8c:	0407f793          	andi	a5,a5,64
80010d90:	e00796e3          	bnez	a5,80010b9c <_vfiprintf_r+0x1b4>
80010d94:	02412503          	lw	a0,36(sp)
80010d98:	e09ff06f          	j	80010ba0 <_vfiprintf_r+0x1b8>
80010d9c:	00c10713          	addi	a4,sp,12
80010da0:	00000697          	auipc	a3,0x0
80010da4:	b9468693          	addi	a3,a3,-1132 # 80010934 <__sfputs_r>
80010da8:	00048613          	mv	a2,s1
80010dac:	01010593          	addi	a1,sp,16
80010db0:	00098513          	mv	a0,s3
80010db4:	f68ff0ef          	jal	ra,8001051c <_printf_i>
80010db8:	fc5ff06f          	j	80010d7c <_vfiprintf_r+0x394>

Disassembly of section .text.vfprintf:

80010dbc <vfiprintf>:
80010dbc:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
80010dc0:	00060693          	mv	a3,a2
80010dc4:	00058613          	mv	a2,a1
80010dc8:	00050593          	mv	a1,a0
80010dcc:	0007a503          	lw	a0,0(a5)
80010dd0:	c19ff06f          	j	800109e8 <_vfiprintf_r>

Disassembly of section .text._read_r:

80010dd4 <_read_r>:
80010dd4:	ff010113          	addi	sp,sp,-16
80010dd8:	00812423          	sw	s0,8(sp)
80010ddc:	00050413          	mv	s0,a0
80010de0:	00058513          	mv	a0,a1
80010de4:	00060593          	mv	a1,a2
80010de8:	00068613          	mv	a2,a3
80010dec:	c601a623          	sw	zero,-916(gp) # 800036dc <errno>
80010df0:	00112623          	sw	ra,12(sp)
80010df4:	821f50ef          	jal	ra,80006614 <_read>
80010df8:	fff00793          	li	a5,-1
80010dfc:	00f51a63          	bne	a0,a5,80010e10 <_read_r+0x3c>
80010e00:	c6c18793          	addi	a5,gp,-916 # 800036dc <errno>
80010e04:	0007a783          	lw	a5,0(a5)
80010e08:	00078463          	beqz	a5,80010e10 <_read_r+0x3c>
80010e0c:	00f42023          	sw	a5,0(s0)
80010e10:	00c12083          	lw	ra,12(sp)
80010e14:	00812403          	lw	s0,8(sp)
80010e18:	01010113          	addi	sp,sp,16
80010e1c:	00008067          	ret

Disassembly of section .text.cleanup_glue:

80010e20 <cleanup_glue>:
80010e20:	ff010113          	addi	sp,sp,-16
80010e24:	00812423          	sw	s0,8(sp)
80010e28:	00058413          	mv	s0,a1
80010e2c:	0005a583          	lw	a1,0(a1)
80010e30:	00912223          	sw	s1,4(sp)
80010e34:	00112623          	sw	ra,12(sp)
80010e38:	00050493          	mv	s1,a0
80010e3c:	00058463          	beqz	a1,80010e44 <cleanup_glue+0x24>
80010e40:	fe1ff0ef          	jal	ra,80010e20 <cleanup_glue>
80010e44:	00040593          	mv	a1,s0
80010e48:	00812403          	lw	s0,8(sp)
80010e4c:	00c12083          	lw	ra,12(sp)
80010e50:	00048513          	mv	a0,s1
80010e54:	00412483          	lw	s1,4(sp)
80010e58:	01010113          	addi	sp,sp,16
80010e5c:	e35fd06f          	j	8000ec90 <_free_r>

Disassembly of section .text._reclaim_reent:

80010e60 <_reclaim_reent>:
80010e60:	80c18793          	addi	a5,gp,-2036 # 8000327c <_impure_ptr>
80010e64:	0007a783          	lw	a5,0(a5)
80010e68:	16a78063          	beq	a5,a0,80010fc8 <_reclaim_reent+0x168>
80010e6c:	02452783          	lw	a5,36(a0)
80010e70:	fe010113          	addi	sp,sp,-32
80010e74:	00812c23          	sw	s0,24(sp)
80010e78:	00112e23          	sw	ra,28(sp)
80010e7c:	00912a23          	sw	s1,20(sp)
80010e80:	01212823          	sw	s2,16(sp)
80010e84:	01312623          	sw	s3,12(sp)
80010e88:	00050413          	mv	s0,a0
80010e8c:	02078463          	beqz	a5,80010eb4 <_reclaim_reent+0x54>
80010e90:	00c7a783          	lw	a5,12(a5)
80010e94:	00000493          	li	s1,0
80010e98:	08000913          	li	s2,128
80010e9c:	0e079263          	bnez	a5,80010f80 <_reclaim_reent+0x120>
80010ea0:	02442783          	lw	a5,36(s0)
80010ea4:	0007a583          	lw	a1,0(a5)
80010ea8:	00058663          	beqz	a1,80010eb4 <_reclaim_reent+0x54>
80010eac:	00040513          	mv	a0,s0
80010eb0:	de1fd0ef          	jal	ra,8000ec90 <_free_r>
80010eb4:	01442583          	lw	a1,20(s0)
80010eb8:	00058663          	beqz	a1,80010ec4 <_reclaim_reent+0x64>
80010ebc:	00040513          	mv	a0,s0
80010ec0:	dd1fd0ef          	jal	ra,8000ec90 <_free_r>
80010ec4:	02442583          	lw	a1,36(s0)
80010ec8:	00058663          	beqz	a1,80010ed4 <_reclaim_reent+0x74>
80010ecc:	00040513          	mv	a0,s0
80010ed0:	dc1fd0ef          	jal	ra,8000ec90 <_free_r>
80010ed4:	03842583          	lw	a1,56(s0)
80010ed8:	00058663          	beqz	a1,80010ee4 <_reclaim_reent+0x84>
80010edc:	00040513          	mv	a0,s0
80010ee0:	db1fd0ef          	jal	ra,8000ec90 <_free_r>
80010ee4:	03c42583          	lw	a1,60(s0)
80010ee8:	00058663          	beqz	a1,80010ef4 <_reclaim_reent+0x94>
80010eec:	00040513          	mv	a0,s0
80010ef0:	da1fd0ef          	jal	ra,8000ec90 <_free_r>
80010ef4:	04042583          	lw	a1,64(s0)
80010ef8:	00058663          	beqz	a1,80010f04 <_reclaim_reent+0xa4>
80010efc:	00040513          	mv	a0,s0
80010f00:	d91fd0ef          	jal	ra,8000ec90 <_free_r>
80010f04:	05c42583          	lw	a1,92(s0)
80010f08:	00058663          	beqz	a1,80010f14 <_reclaim_reent+0xb4>
80010f0c:	00040513          	mv	a0,s0
80010f10:	d81fd0ef          	jal	ra,8000ec90 <_free_r>
80010f14:	05842583          	lw	a1,88(s0)
80010f18:	00058663          	beqz	a1,80010f24 <_reclaim_reent+0xc4>
80010f1c:	00040513          	mv	a0,s0
80010f20:	d71fd0ef          	jal	ra,8000ec90 <_free_r>
80010f24:	03442583          	lw	a1,52(s0)
80010f28:	00058663          	beqz	a1,80010f34 <_reclaim_reent+0xd4>
80010f2c:	00040513          	mv	a0,s0
80010f30:	d61fd0ef          	jal	ra,8000ec90 <_free_r>
80010f34:	01842783          	lw	a5,24(s0)
80010f38:	06078a63          	beqz	a5,80010fac <_reclaim_reent+0x14c>
80010f3c:	02842783          	lw	a5,40(s0)
80010f40:	00040513          	mv	a0,s0
80010f44:	000780e7          	jalr	a5
80010f48:	04842583          	lw	a1,72(s0)
80010f4c:	06058063          	beqz	a1,80010fac <_reclaim_reent+0x14c>
80010f50:	00040513          	mv	a0,s0
80010f54:	01812403          	lw	s0,24(sp)
80010f58:	01c12083          	lw	ra,28(sp)
80010f5c:	01412483          	lw	s1,20(sp)
80010f60:	01012903          	lw	s2,16(sp)
80010f64:	00c12983          	lw	s3,12(sp)
80010f68:	02010113          	addi	sp,sp,32
80010f6c:	eb5ff06f          	j	80010e20 <cleanup_glue>
80010f70:	009585b3          	add	a1,a1,s1
80010f74:	0005a583          	lw	a1,0(a1)
80010f78:	02059063          	bnez	a1,80010f98 <_reclaim_reent+0x138>
80010f7c:	00448493          	addi	s1,s1,4
80010f80:	02442783          	lw	a5,36(s0)
80010f84:	00c7a583          	lw	a1,12(a5)
80010f88:	ff2494e3          	bne	s1,s2,80010f70 <_reclaim_reent+0x110>
80010f8c:	00040513          	mv	a0,s0
80010f90:	d01fd0ef          	jal	ra,8000ec90 <_free_r>
80010f94:	f0dff06f          	j	80010ea0 <_reclaim_reent+0x40>
80010f98:	0005a983          	lw	s3,0(a1)
80010f9c:	00040513          	mv	a0,s0
80010fa0:	cf1fd0ef          	jal	ra,8000ec90 <_free_r>
80010fa4:	00098593          	mv	a1,s3
80010fa8:	fd1ff06f          	j	80010f78 <_reclaim_reent+0x118>
80010fac:	01c12083          	lw	ra,28(sp)
80010fb0:	01812403          	lw	s0,24(sp)
80010fb4:	01412483          	lw	s1,20(sp)
80010fb8:	01012903          	lw	s2,16(sp)
80010fbc:	00c12983          	lw	s3,12(sp)
80010fc0:	02010113          	addi	sp,sp,32
80010fc4:	00008067          	ret
80010fc8:	00008067          	ret

Disassembly of section .text._fstat_r:

80010fcc <_fstat_r>:
80010fcc:	ff010113          	addi	sp,sp,-16
80010fd0:	00812423          	sw	s0,8(sp)
80010fd4:	00050413          	mv	s0,a0
80010fd8:	00058513          	mv	a0,a1
80010fdc:	00060593          	mv	a1,a2
80010fe0:	c601a623          	sw	zero,-916(gp) # 800036dc <errno>
80010fe4:	00112623          	sw	ra,12(sp)
80010fe8:	e4cf50ef          	jal	ra,80006634 <_fstat>
80010fec:	fff00793          	li	a5,-1
80010ff0:	00f51a63          	bne	a0,a5,80011004 <_fstat_r+0x38>
80010ff4:	c6c18793          	addi	a5,gp,-916 # 800036dc <errno>
80010ff8:	0007a783          	lw	a5,0(a5)
80010ffc:	00078463          	beqz	a5,80011004 <_fstat_r+0x38>
80011000:	00f42023          	sw	a5,0(s0)
80011004:	00c12083          	lw	ra,12(sp)
80011008:	00812403          	lw	s0,8(sp)
8001100c:	01010113          	addi	sp,sp,16
80011010:	00008067          	ret

Disassembly of section .text.__sfvwrite_r:

80011014 <__sfvwrite_r>:
80011014:	00862783          	lw	a5,8(a2)
80011018:	00079863          	bnez	a5,80011028 <__sfvwrite_r+0x14>
8001101c:	00000793          	li	a5,0
80011020:	00078513          	mv	a0,a5
80011024:	00008067          	ret
80011028:	00c5d783          	lhu	a5,12(a1)
8001102c:	fc010113          	addi	sp,sp,-64
80011030:	02812c23          	sw	s0,56(sp)
80011034:	03212823          	sw	s2,48(sp)
80011038:	03612023          	sw	s6,32(sp)
8001103c:	02112e23          	sw	ra,60(sp)
80011040:	02912a23          	sw	s1,52(sp)
80011044:	03312623          	sw	s3,44(sp)
80011048:	03412423          	sw	s4,40(sp)
8001104c:	03512223          	sw	s5,36(sp)
80011050:	01712e23          	sw	s7,28(sp)
80011054:	01812c23          	sw	s8,24(sp)
80011058:	01912a23          	sw	s9,20(sp)
8001105c:	01a12823          	sw	s10,16(sp)
80011060:	01b12623          	sw	s11,12(sp)
80011064:	0087f793          	andi	a5,a5,8
80011068:	00060b13          	mv	s6,a2
8001106c:	00058413          	mv	s0,a1
80011070:	00050913          	mv	s2,a0
80011074:	0e078263          	beqz	a5,80011158 <__sfvwrite_r+0x144>
80011078:	0105a783          	lw	a5,16(a1)
8001107c:	0c078e63          	beqz	a5,80011158 <__sfvwrite_r+0x144>
80011080:	00c45783          	lhu	a5,12(s0)
80011084:	000b2a03          	lw	s4,0(s6)
80011088:	0027f713          	andi	a4,a5,2
8001108c:	16071a63          	bnez	a4,80011200 <__sfvwrite_r+0x1ec>
80011090:	0017f793          	andi	a5,a5,1
80011094:	00000b93          	li	s7,0
80011098:	20078a63          	beqz	a5,800112ac <__sfvwrite_r+0x298>
8001109c:	00000513          	li	a0,0
800110a0:	00000a93          	li	s5,0
800110a4:	00000993          	li	s3,0
800110a8:	36098463          	beqz	s3,80011410 <__sfvwrite_r+0x3fc>
800110ac:	02051263          	bnez	a0,800110d0 <__sfvwrite_r+0xbc>
800110b0:	00098613          	mv	a2,s3
800110b4:	00a00593          	li	a1,10
800110b8:	000a8513          	mv	a0,s5
800110bc:	3fc000ef          	jal	ra,800114b8 <memchr>
800110c0:	00198b93          	addi	s7,s3,1
800110c4:	00050663          	beqz	a0,800110d0 <__sfvwrite_r+0xbc>
800110c8:	00150513          	addi	a0,a0,1
800110cc:	41550bb3          	sub	s7,a0,s5
800110d0:	000b8c13          	mv	s8,s7
800110d4:	0179f463          	bgeu	s3,s7,800110dc <__sfvwrite_r+0xc8>
800110d8:	00098c13          	mv	s8,s3
800110dc:	00042503          	lw	a0,0(s0)
800110e0:	01042783          	lw	a5,16(s0)
800110e4:	01442683          	lw	a3,20(s0)
800110e8:	32a7fe63          	bgeu	a5,a0,80011424 <__sfvwrite_r+0x410>
800110ec:	00842483          	lw	s1,8(s0)
800110f0:	009684b3          	add	s1,a3,s1
800110f4:	3384d863          	bge	s1,s8,80011424 <__sfvwrite_r+0x410>
800110f8:	000a8593          	mv	a1,s5
800110fc:	00048613          	mv	a2,s1
80011100:	ae1fd0ef          	jal	ra,8000ebe0 <memmove>
80011104:	00042783          	lw	a5,0(s0)
80011108:	00040593          	mv	a1,s0
8001110c:	00090513          	mv	a0,s2
80011110:	009787b3          	add	a5,a5,s1
80011114:	00f42023          	sw	a5,0(s0)
80011118:	b8cfd0ef          	jal	ra,8000e4a4 <_fflush_r>
8001111c:	16051e63          	bnez	a0,80011298 <__sfvwrite_r+0x284>
80011120:	409b8bb3          	sub	s7,s7,s1
80011124:	00100513          	li	a0,1
80011128:	000b9a63          	bnez	s7,8001113c <__sfvwrite_r+0x128>
8001112c:	00040593          	mv	a1,s0
80011130:	00090513          	mv	a0,s2
80011134:	b70fd0ef          	jal	ra,8000e4a4 <_fflush_r>
80011138:	16051063          	bnez	a0,80011298 <__sfvwrite_r+0x284>
8001113c:	008b2783          	lw	a5,8(s6)
80011140:	009a8ab3          	add	s5,s5,s1
80011144:	409989b3          	sub	s3,s3,s1
80011148:	409784b3          	sub	s1,a5,s1
8001114c:	009b2423          	sw	s1,8(s6)
80011150:	f4049ce3          	bnez	s1,800110a8 <__sfvwrite_r+0x94>
80011154:	0680006f          	j	800111bc <__sfvwrite_r+0x1a8>
80011158:	00040593          	mv	a1,s0
8001115c:	00090513          	mv	a0,s2
80011160:	fb4fe0ef          	jal	ra,8000f914 <__swsetup_r>
80011164:	fff00793          	li	a5,-1
80011168:	f0050ce3          	beqz	a0,80011080 <__sfvwrite_r+0x6c>
8001116c:	0540006f          	j	800111c0 <__sfvwrite_r+0x1ac>
80011170:	000a2983          	lw	s3,0(s4)
80011174:	004a2483          	lw	s1,4(s4)
80011178:	008a0a13          	addi	s4,s4,8
8001117c:	fe048ae3          	beqz	s1,80011170 <__sfvwrite_r+0x15c>
80011180:	00048693          	mv	a3,s1
80011184:	009af463          	bgeu	s5,s1,8001118c <__sfvwrite_r+0x178>
80011188:	000a8693          	mv	a3,s5
8001118c:	02842783          	lw	a5,40(s0)
80011190:	02042583          	lw	a1,32(s0)
80011194:	00098613          	mv	a2,s3
80011198:	00090513          	mv	a0,s2
8001119c:	000780e7          	jalr	a5
800111a0:	0ea05c63          	blez	a0,80011298 <__sfvwrite_r+0x284>
800111a4:	008b2783          	lw	a5,8(s6)
800111a8:	00a989b3          	add	s3,s3,a0
800111ac:	40a484b3          	sub	s1,s1,a0
800111b0:	40a78533          	sub	a0,a5,a0
800111b4:	00ab2423          	sw	a0,8(s6)
800111b8:	fc0512e3          	bnez	a0,8001117c <__sfvwrite_r+0x168>
800111bc:	00000793          	li	a5,0
800111c0:	03c12083          	lw	ra,60(sp)
800111c4:	03812403          	lw	s0,56(sp)
800111c8:	03412483          	lw	s1,52(sp)
800111cc:	03012903          	lw	s2,48(sp)
800111d0:	02c12983          	lw	s3,44(sp)
800111d4:	02812a03          	lw	s4,40(sp)
800111d8:	02412a83          	lw	s5,36(sp)
800111dc:	02012b03          	lw	s6,32(sp)
800111e0:	01c12b83          	lw	s7,28(sp)
800111e4:	01812c03          	lw	s8,24(sp)
800111e8:	01412c83          	lw	s9,20(sp)
800111ec:	01012d03          	lw	s10,16(sp)
800111f0:	00c12d83          	lw	s11,12(sp)
800111f4:	00078513          	mv	a0,a5
800111f8:	04010113          	addi	sp,sp,64
800111fc:	00008067          	ret
80011200:	80000ab7          	lui	s5,0x80000
80011204:	00000993          	li	s3,0
80011208:	00000493          	li	s1,0
8001120c:	c00aca93          	xori	s5,s5,-1024
80011210:	f6dff06f          	j	8001117c <__sfvwrite_r+0x168>
80011214:	000a2b83          	lw	s7,0(s4)
80011218:	004a2483          	lw	s1,4(s4)
8001121c:	008a0a13          	addi	s4,s4,8
80011220:	fe048ae3          	beqz	s1,80011214 <__sfvwrite_r+0x200>
80011224:	00c45783          	lhu	a5,12(s0)
80011228:	00842d83          	lw	s11,8(s0)
8001122c:	00042503          	lw	a0,0(s0)
80011230:	2007f713          	andi	a4,a5,512
80011234:	14070263          	beqz	a4,80011378 <__sfvwrite_r+0x364>
80011238:	0db4e063          	bltu	s1,s11,800112f8 <__sfvwrite_r+0x2e4>
8001123c:	4807f713          	andi	a4,a5,1152
80011240:	0a070c63          	beqz	a4,800112f8 <__sfvwrite_r+0x2e4>
80011244:	01442703          	lw	a4,20(s0)
80011248:	01042583          	lw	a1,16(s0)
8001124c:	00171a93          	slli	s5,a4,0x1
80011250:	00ea8733          	add	a4,s5,a4
80011254:	01f75a93          	srli	s5,a4,0x1f
80011258:	40b50d33          	sub	s10,a0,a1
8001125c:	00ea8ab3          	add	s5,s5,a4
80011260:	001d0713          	addi	a4,s10,1
80011264:	401ada93          	srai	s5,s5,0x1
80011268:	00970733          	add	a4,a4,s1
8001126c:	00eaf463          	bgeu	s5,a4,80011274 <__sfvwrite_r+0x260>
80011270:	00070a93          	mv	s5,a4
80011274:	4007f793          	andi	a5,a5,1024
80011278:	0c078863          	beqz	a5,80011348 <__sfvwrite_r+0x334>
8001127c:	000a8593          	mv	a1,s5
80011280:	00090513          	mv	a0,s2
80011284:	b11fd0ef          	jal	ra,8000ed94 <_malloc_r>
80011288:	00050993          	mv	s3,a0
8001128c:	02051a63          	bnez	a0,800112c0 <__sfvwrite_r+0x2ac>
80011290:	00c00793          	li	a5,12
80011294:	00f92023          	sw	a5,0(s2)
80011298:	00c45783          	lhu	a5,12(s0)
8001129c:	0407e793          	ori	a5,a5,64
800112a0:	00f41623          	sh	a5,12(s0)
800112a4:	fff00793          	li	a5,-1
800112a8:	f19ff06f          	j	800111c0 <__sfvwrite_r+0x1ac>
800112ac:	80000c37          	lui	s8,0x80000
800112b0:	ffec4c93          	xori	s9,s8,-2
800112b4:	00000493          	li	s1,0
800112b8:	fffc4c13          	not	s8,s8
800112bc:	f65ff06f          	j	80011220 <__sfvwrite_r+0x20c>
800112c0:	01042583          	lw	a1,16(s0)
800112c4:	000d0613          	mv	a2,s10
800112c8:	841fd0ef          	jal	ra,8000eb08 <memcpy>
800112cc:	00c45783          	lhu	a5,12(s0)
800112d0:	b7f7f793          	andi	a5,a5,-1153
800112d4:	0807e793          	ori	a5,a5,128
800112d8:	00f41623          	sh	a5,12(s0)
800112dc:	01342823          	sw	s3,16(s0)
800112e0:	01542a23          	sw	s5,20(s0)
800112e4:	01a989b3          	add	s3,s3,s10
800112e8:	41aa8ab3          	sub	s5,s5,s10
800112ec:	01342023          	sw	s3,0(s0)
800112f0:	00048d93          	mv	s11,s1
800112f4:	01542423          	sw	s5,8(s0)
800112f8:	00048993          	mv	s3,s1
800112fc:	01b4f463          	bgeu	s1,s11,80011304 <__sfvwrite_r+0x2f0>
80011300:	00048d93          	mv	s11,s1
80011304:	00042503          	lw	a0,0(s0)
80011308:	000d8613          	mv	a2,s11
8001130c:	000b8593          	mv	a1,s7
80011310:	8d1fd0ef          	jal	ra,8000ebe0 <memmove>
80011314:	00842783          	lw	a5,8(s0)
80011318:	41b787b3          	sub	a5,a5,s11
8001131c:	00f42423          	sw	a5,8(s0)
80011320:	00042783          	lw	a5,0(s0)
80011324:	01b78db3          	add	s11,a5,s11
80011328:	01b42023          	sw	s11,0(s0)
8001132c:	008b2783          	lw	a5,8(s6)
80011330:	013b8bb3          	add	s7,s7,s3
80011334:	413484b3          	sub	s1,s1,s3
80011338:	413789b3          	sub	s3,a5,s3
8001133c:	013b2423          	sw	s3,8(s6)
80011340:	ee0990e3          	bnez	s3,80011220 <__sfvwrite_r+0x20c>
80011344:	e79ff06f          	j	800111bc <__sfvwrite_r+0x1a8>
80011348:	000a8613          	mv	a2,s5
8001134c:	00090513          	mv	a0,s2
80011350:	18c000ef          	jal	ra,800114dc <_realloc_r>
80011354:	00050993          	mv	s3,a0
80011358:	f80512e3          	bnez	a0,800112dc <__sfvwrite_r+0x2c8>
8001135c:	01042583          	lw	a1,16(s0)
80011360:	00090513          	mv	a0,s2
80011364:	92dfd0ef          	jal	ra,8000ec90 <_free_r>
80011368:	00c45783          	lhu	a5,12(s0)
8001136c:	f7f7f793          	andi	a5,a5,-129
80011370:	00f41623          	sh	a5,12(s0)
80011374:	f1dff06f          	j	80011290 <__sfvwrite_r+0x27c>
80011378:	01042783          	lw	a5,16(s0)
8001137c:	00a7e663          	bltu	a5,a0,80011388 <__sfvwrite_r+0x374>
80011380:	01442983          	lw	s3,20(s0)
80011384:	0534f663          	bgeu	s1,s3,800113d0 <__sfvwrite_r+0x3bc>
80011388:	000d8993          	mv	s3,s11
8001138c:	01b4f463          	bgeu	s1,s11,80011394 <__sfvwrite_r+0x380>
80011390:	00048993          	mv	s3,s1
80011394:	00098613          	mv	a2,s3
80011398:	000b8593          	mv	a1,s7
8001139c:	845fd0ef          	jal	ra,8000ebe0 <memmove>
800113a0:	00842783          	lw	a5,8(s0)
800113a4:	00042703          	lw	a4,0(s0)
800113a8:	413787b3          	sub	a5,a5,s3
800113ac:	01370733          	add	a4,a4,s3
800113b0:	00f42423          	sw	a5,8(s0)
800113b4:	00e42023          	sw	a4,0(s0)
800113b8:	f6079ae3          	bnez	a5,8001132c <__sfvwrite_r+0x318>
800113bc:	00040593          	mv	a1,s0
800113c0:	00090513          	mv	a0,s2
800113c4:	8e0fd0ef          	jal	ra,8000e4a4 <_fflush_r>
800113c8:	f60502e3          	beqz	a0,8001132c <__sfvwrite_r+0x318>
800113cc:	ecdff06f          	j	80011298 <__sfvwrite_r+0x284>
800113d0:	00048513          	mv	a0,s1
800113d4:	009cf463          	bgeu	s9,s1,800113dc <__sfvwrite_r+0x3c8>
800113d8:	000c0513          	mv	a0,s8
800113dc:	00098593          	mv	a1,s3
800113e0:	881fc0ef          	jal	ra,8000dc60 <__divsi3>
800113e4:	00098593          	mv	a1,s3
800113e8:	855fc0ef          	jal	ra,8000dc3c <__mulsi3>
800113ec:	02842783          	lw	a5,40(s0)
800113f0:	02042583          	lw	a1,32(s0)
800113f4:	00050693          	mv	a3,a0
800113f8:	000b8613          	mv	a2,s7
800113fc:	00090513          	mv	a0,s2
80011400:	000780e7          	jalr	a5
80011404:	00050993          	mv	s3,a0
80011408:	f2a042e3          	bgtz	a0,8001132c <__sfvwrite_r+0x318>
8001140c:	e8dff06f          	j	80011298 <__sfvwrite_r+0x284>
80011410:	000a2a83          	lw	s5,0(s4)
80011414:	004a2983          	lw	s3,4(s4)
80011418:	00000513          	li	a0,0
8001141c:	008a0a13          	addi	s4,s4,8
80011420:	c89ff06f          	j	800110a8 <__sfvwrite_r+0x94>
80011424:	02dc4263          	blt	s8,a3,80011448 <__sfvwrite_r+0x434>
80011428:	02842783          	lw	a5,40(s0)
8001142c:	02042583          	lw	a1,32(s0)
80011430:	000a8613          	mv	a2,s5
80011434:	00090513          	mv	a0,s2
80011438:	000780e7          	jalr	a5
8001143c:	00050493          	mv	s1,a0
80011440:	cea040e3          	bgtz	a0,80011120 <__sfvwrite_r+0x10c>
80011444:	e55ff06f          	j	80011298 <__sfvwrite_r+0x284>
80011448:	000c0613          	mv	a2,s8
8001144c:	000a8593          	mv	a1,s5
80011450:	f90fd0ef          	jal	ra,8000ebe0 <memmove>
80011454:	00842783          	lw	a5,8(s0)
80011458:	000c0493          	mv	s1,s8
8001145c:	418787b3          	sub	a5,a5,s8
80011460:	00f42423          	sw	a5,8(s0)
80011464:	00042783          	lw	a5,0(s0)
80011468:	018787b3          	add	a5,a5,s8
8001146c:	00f42023          	sw	a5,0(s0)
80011470:	cb1ff06f          	j	80011120 <__sfvwrite_r+0x10c>

Disassembly of section .text._isatty_r:

80011474 <_isatty_r>:
80011474:	ff010113          	addi	sp,sp,-16
80011478:	00812423          	sw	s0,8(sp)
8001147c:	00050413          	mv	s0,a0
80011480:	00058513          	mv	a0,a1
80011484:	c601a623          	sw	zero,-916(gp) # 800036dc <errno>
80011488:	00112623          	sw	ra,12(sp)
8001148c:	9a0f50ef          	jal	ra,8000662c <_isatty>
80011490:	fff00793          	li	a5,-1
80011494:	00f51a63          	bne	a0,a5,800114a8 <_isatty_r+0x34>
80011498:	c6c18793          	addi	a5,gp,-916 # 800036dc <errno>
8001149c:	0007a783          	lw	a5,0(a5)
800114a0:	00078463          	beqz	a5,800114a8 <_isatty_r+0x34>
800114a4:	00f42023          	sw	a5,0(s0)
800114a8:	00c12083          	lw	ra,12(sp)
800114ac:	00812403          	lw	s0,8(sp)
800114b0:	01010113          	addi	sp,sp,16
800114b4:	00008067          	ret

Disassembly of section .text.memchr:

800114b8 <memchr>:
800114b8:	0ff5f593          	andi	a1,a1,255
800114bc:	00c50633          	add	a2,a0,a2
800114c0:	00c51663          	bne	a0,a2,800114cc <memchr+0x14>
800114c4:	00000513          	li	a0,0
800114c8:	00008067          	ret
800114cc:	00054783          	lbu	a5,0(a0)
800114d0:	feb78ce3          	beq	a5,a1,800114c8 <memchr+0x10>
800114d4:	00150513          	addi	a0,a0,1
800114d8:	fe9ff06f          	j	800114c0 <memchr+0x8>

Disassembly of section .text._realloc_r:

800114dc <_realloc_r>:
800114dc:	00059663          	bnez	a1,800114e8 <_realloc_r+0xc>
800114e0:	00060593          	mv	a1,a2
800114e4:	8b1fd06f          	j	8000ed94 <_malloc_r>
800114e8:	fe010113          	addi	sp,sp,-32
800114ec:	00812c23          	sw	s0,24(sp)
800114f0:	00112e23          	sw	ra,28(sp)
800114f4:	00912a23          	sw	s1,20(sp)
800114f8:	01212823          	sw	s2,16(sp)
800114fc:	01312623          	sw	s3,12(sp)
80011500:	00060413          	mv	s0,a2
80011504:	02061663          	bnez	a2,80011530 <_realloc_r+0x54>
80011508:	f88fd0ef          	jal	ra,8000ec90 <_free_r>
8001150c:	00000913          	li	s2,0
80011510:	01c12083          	lw	ra,28(sp)
80011514:	01812403          	lw	s0,24(sp)
80011518:	00090513          	mv	a0,s2
8001151c:	01412483          	lw	s1,20(sp)
80011520:	01012903          	lw	s2,16(sp)
80011524:	00c12983          	lw	s3,12(sp)
80011528:	02010113          	addi	sp,sp,32
8001152c:	00008067          	ret
80011530:	00058493          	mv	s1,a1
80011534:	00050993          	mv	s3,a0
80011538:	03c000ef          	jal	ra,80011574 <_malloc_usable_size_r>
8001153c:	00048913          	mv	s2,s1
80011540:	fc8578e3          	bgeu	a0,s0,80011510 <_realloc_r+0x34>
80011544:	00040593          	mv	a1,s0
80011548:	00098513          	mv	a0,s3
8001154c:	849fd0ef          	jal	ra,8000ed94 <_malloc_r>
80011550:	00050913          	mv	s2,a0
80011554:	fa050ee3          	beqz	a0,80011510 <_realloc_r+0x34>
80011558:	00048593          	mv	a1,s1
8001155c:	00040613          	mv	a2,s0
80011560:	da8fd0ef          	jal	ra,8000eb08 <memcpy>
80011564:	00048593          	mv	a1,s1
80011568:	00098513          	mv	a0,s3
8001156c:	f24fd0ef          	jal	ra,8000ec90 <_free_r>
80011570:	fa1ff06f          	j	80011510 <_realloc_r+0x34>

Disassembly of section .text._malloc_usable_size_r:

80011574 <_malloc_usable_size_r>:
80011574:	ffc5a783          	lw	a5,-4(a1)
80011578:	ffc78513          	addi	a0,a5,-4
8001157c:	0007d863          	bgez	a5,8001158c <_malloc_usable_size_r+0x18>
80011580:	00a585b3          	add	a1,a1,a0
80011584:	0005a783          	lw	a5,0(a1)
80011588:	00f50533          	add	a0,a0,a5
8001158c:	00008067          	ret
