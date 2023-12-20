
build/karnix_hub12.elf:     file format elf32-littleriscv


Disassembly of section ._vector:

80000000 <crtStart>:
80000000:	80000137          	lui	sp,0x80000
80000004:	0b010113          	addi	sp,sp,176 # 800000b0 <_ram_heap_end+0xfffee0b0>
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
80000064:	13d030ef          	jal	ra,800039a0 <irqCallback>
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
800000b0:	00003197          	auipc	gp,0x3
800000b4:	7d018193          	addi	gp,gp,2000 # 80003880 <__global_pointer$>
800000b8:	00011117          	auipc	sp,0x11
800000bc:	3f810113          	addi	sp,sp,1016 # 800114b0 <_stack_start>

800000c0 <bss_init>:
800000c0:	86018513          	addi	a0,gp,-1952 # 800030e0 <t2>
800000c4:	c5018593          	addi	a1,gp,-944 # 800034d0 <_bss_end>

800000c8 <bss_loop>:
800000c8:	00b50863          	beq	a0,a1,800000d8 <bss_done>
800000cc:	00052023          	sw	zero,0(a0)
800000d0:	00450513          	addi	a0,a0,4
800000d4:	ff5ff06f          	j	800000c8 <bss_loop>

800000d8 <bss_done>:
800000d8:	00011517          	auipc	a0,0x11
800000dc:	bd450513          	addi	a0,a0,-1068 # 80010cac <_ctors_end>
800000e0:	ffc10113          	addi	sp,sp,-4

800000e4 <ctors_loop>:
800000e4:	00011597          	auipc	a1,0x11
800000e8:	bc858593          	addi	a1,a1,-1080 # 80010cac <_ctors_end>
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
80000110:	88050513          	addi	a0,a0,-1920 # 880 <_stack_size+0x80>
80000114:	30451073          	csrw	mie,a0
80000118:	00002537          	lui	a0,0x2
8000011c:	80850513          	addi	a0,a0,-2040 # 1808 <_stack_size+0x1008>
80000120:	30051073          	csrw	mstatus,a0
80000124:	3300d0ef          	jal	ra,8000d454 <end>

80000128 <infinitLoop>:
80000128:	0000006f          	j	80000128 <infinitLoop>
	...

Disassembly of section .memory:

80003534 <crc16>:
80003534:	000107b7          	lui	a5,0x10
80003538:	ffffa6b7          	lui	a3,0xffffa
8000353c:	00000713          	li	a4,0
80003540:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80003544:	00168693          	addi	a3,a3,1 # ffffa001 <_ram_heap_end+0x7ffe8001>
80003548:	00b74663          	blt	a4,a1,80003554 <crc16+0x20>
8000354c:	00078513          	mv	a0,a5
80003550:	00008067          	ret
80003554:	00e50633          	add	a2,a0,a4
80003558:	00064603          	lbu	a2,0(a2)
8000355c:	00c7c7b3          	xor	a5,a5,a2
80003560:	00800613          	li	a2,8
80003564:	0017f813          	andi	a6,a5,1
80003568:	0017d793          	srli	a5,a5,0x1
8000356c:	00080863          	beqz	a6,8000357c <crc16+0x48>
80003570:	00d7c7b3          	xor	a5,a5,a3
80003574:	01079793          	slli	a5,a5,0x10
80003578:	0107d793          	srli	a5,a5,0x10
8000357c:	fff60613          	addi	a2,a2,-1
80003580:	fe0612e3          	bnez	a2,80003564 <crc16+0x30>
80003584:	00170713          	addi	a4,a4,1
80003588:	fc1ff06f          	j	80003548 <crc16+0x14>

8000358c <add_crc>:
8000358c:	ff010113          	addi	sp,sp,-16
80003590:	00812423          	sw	s0,8(sp)
80003594:	00912223          	sw	s1,4(sp)
80003598:	00112623          	sw	ra,12(sp)
8000359c:	00050413          	mv	s0,a0
800035a0:	00058493          	mv	s1,a1
800035a4:	f91ff0ef          	jal	ra,80003534 <crc16>
800035a8:	009405b3          	add	a1,s0,s1
800035ac:	00a58023          	sb	a0,0(a1)
800035b0:	00855513          	srli	a0,a0,0x8
800035b4:	00a580a3          	sb	a0,1(a1)
800035b8:	00c12083          	lw	ra,12(sp)
800035bc:	00812403          	lw	s0,8(sp)
800035c0:	00412483          	lw	s1,4(sp)
800035c4:	01010113          	addi	sp,sp,16
800035c8:	00008067          	ret

800035cc <println>:
800035cc:	ff010113          	addi	sp,sp,-16
800035d0:	00112623          	sw	ra,12(sp)
800035d4:	678020ef          	jal	ra,80005c4c <print_uart0>
800035d8:	00c12083          	lw	ra,12(sp)
800035dc:	80003537          	lui	a0,0x80003
800035e0:	85050513          	addi	a0,a0,-1968 # 80002850 <_ram_heap_end+0xffff0850>
800035e4:	01010113          	addi	sp,sp,16
800035e8:	6640206f          	j	80005c4c <print_uart0>

800035ec <to_hex_nibble>:
800035ec:	00f57513          	andi	a0,a0,15
800035f0:	00900793          	li	a5,9
800035f4:	00a7f663          	bgeu	a5,a0,80003600 <to_hex_nibble+0x14>
800035f8:	03750513          	addi	a0,a0,55
800035fc:	00008067          	ret
80003600:	03050513          	addi	a0,a0,48
80003604:	00008067          	ret

80003608 <to_hex>:
80003608:	fd010113          	addi	sp,sp,-48
8000360c:	02812423          	sw	s0,40(sp)
80003610:	02912223          	sw	s1,36(sp)
80003614:	03212023          	sw	s2,32(sp)
80003618:	01312e23          	sw	s3,28(sp)
8000361c:	02112623          	sw	ra,44(sp)
80003620:	00050913          	mv	s2,a0
80003624:	00050493          	mv	s1,a0
80003628:	01c00413          	li	s0,28
8000362c:	ffc00993          	li	s3,-4
80003630:	0085d533          	srl	a0,a1,s0
80003634:	0ff57513          	andi	a0,a0,255
80003638:	00b12623          	sw	a1,12(sp)
8000363c:	fb1ff0ef          	jal	ra,800035ec <to_hex_nibble>
80003640:	00a48023          	sb	a0,0(s1)
80003644:	ffc40413          	addi	s0,s0,-4
80003648:	00148493          	addi	s1,s1,1
8000364c:	00c12583          	lw	a1,12(sp)
80003650:	ff3410e3          	bne	s0,s3,80003630 <to_hex+0x28>
80003654:	02c12083          	lw	ra,44(sp)
80003658:	02812403          	lw	s0,40(sp)
8000365c:	00090423          	sb	zero,8(s2)
80003660:	02412483          	lw	s1,36(sp)
80003664:	02012903          	lw	s2,32(sp)
80003668:	01c12983          	lw	s3,28(sp)
8000366c:	03010113          	addi	sp,sp,48
80003670:	00008067          	ret

80003674 <process_and_wait>:
80003674:	fe010113          	addi	sp,sp,-32
80003678:	00812c23          	sw	s0,24(sp)
8000367c:	00912a23          	sw	s1,20(sp)
80003680:	01412423          	sw	s4,8(sp)
80003684:	01512223          	sw	s5,4(sp)
80003688:	00112e23          	sw	ra,28(sp)
8000368c:	01212823          	sw	s2,16(sp)
80003690:	01312623          	sw	s3,12(sp)
80003694:	f00b07b7          	lui	a5,0xf00b0
80003698:	0007a903          	lw	s2,0(a5) # f00b0000 <_ram_heap_end+0x7009e000>
8000369c:	0047a983          	lw	s3,4(a5)
800036a0:	00050a13          	mv	s4,a0
800036a4:	f00b0ab7          	lui	s5,0xf00b0
800036a8:	000aa783          	lw	a5,0(s5) # f00b0000 <_ram_heap_end+0x7009e000>
800036ac:	004aa803          	lw	a6,4(s5)
800036b0:	412786b3          	sub	a3,a5,s2
800036b4:	00d7b733          	sltu	a4,a5,a3
800036b8:	413807b3          	sub	a5,a6,s3
800036bc:	02e79663          	bne	a5,a4,800036e8 <process_and_wait+0x74>
800036c0:	0346f463          	bgeu	a3,s4,800036e8 <process_and_wait+0x74>
800036c4:	8741a783          	lw	a5,-1932(gp) # 800030f4 <events_modbus_rtu_poll>
800036c8:	00078663          	beqz	a5,800036d4 <process_and_wait+0x60>
800036cc:	398000ef          	jal	ra,80003a64 <modbus_rtu_poll>
800036d0:	8601aa23          	sw	zero,-1932(gp) # 800030f4 <events_modbus_rtu_poll>
800036d4:	8781a783          	lw	a5,-1928(gp) # 800030f8 <events_mac_poll>
800036d8:	fc0788e3          	beqz	a5,800036a8 <process_and_wait+0x34>
800036dc:	3b5010ef          	jal	ra,80005290 <mac_poll>
800036e0:	8601ac23          	sw	zero,-1928(gp) # 800030f8 <events_mac_poll>
800036e4:	fc5ff06f          	j	800036a8 <process_and_wait+0x34>
800036e8:	01c12083          	lw	ra,28(sp)
800036ec:	01812403          	lw	s0,24(sp)
800036f0:	01412483          	lw	s1,20(sp)
800036f4:	01012903          	lw	s2,16(sp)
800036f8:	00c12983          	lw	s3,12(sp)
800036fc:	00812a03          	lw	s4,8(sp)
80003700:	00412a83          	lw	s5,4(sp)
80003704:	02010113          	addi	sp,sp,32
80003708:	00008067          	ret

8000370c <sram_test_write_random_ints>:
8000370c:	80002537          	lui	a0,0x80002
80003710:	fe010113          	addi	sp,sp,-32
80003714:	00080637          	lui	a2,0x80
80003718:	900005b7          	lui	a1,0x90000
8000371c:	f3450513          	addi	a0,a0,-204 # 80001f34 <_ram_heap_end+0xfffeff34>
80003720:	00112e23          	sw	ra,28(sp)
80003724:	00812c23          	sw	s0,24(sp)
80003728:	00912a23          	sw	s1,20(sp)
8000372c:	01212823          	sw	s2,16(sp)
80003730:	01312623          	sw	s3,12(sp)
80003734:	01412423          	sw	s4,8(sp)
80003738:	72d0a0ef          	jal	ra,8000e664 <iprintf>
8000373c:	deadc7b7          	lui	a5,0xdeadc
80003740:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac9eef>
80003744:	90000737          	lui	a4,0x90000
80003748:	900806b7          	lui	a3,0x90080
8000374c:	00f72023          	sw	a5,0(a4) # 90000000 <_ram_heap_end+0xffee000>
80003750:	00470713          	addi	a4,a4,4
80003754:	00179793          	slli	a5,a5,0x1
80003758:	fed71ae3          	bne	a4,a3,8000374c <sram_test_write_random_ints+0x40>
8000375c:	80002537          	lui	a0,0x80002
80003760:	00080637          	lui	a2,0x80
80003764:	900005b7          	lui	a1,0x90000
80003768:	f6050513          	addi	a0,a0,-160 # 80001f60 <_ram_heap_end+0xfffeff60>
8000376c:	deadc4b7          	lui	s1,0xdeadc
80003770:	6f50a0ef          	jal	ra,8000e664 <iprintf>
80003774:	00000913          	li	s2,0
80003778:	eef48493          	addi	s1,s1,-273 # deadbeef <_ram_heap_end+0x5eac9eef>
8000377c:	90000437          	lui	s0,0x90000
80003780:	80002a37          	lui	s4,0x80002
80003784:	900809b7          	lui	s3,0x90080
80003788:	00042783          	lw	a5,0(s0) # 90000000 <_ram_heap_end+0xffee000>
8000378c:	00978e63          	beq	a5,s1,800037a8 <sram_test_write_random_ints+0x9c>
80003790:	00042683          	lw	a3,0(s0)
80003794:	00048613          	mv	a2,s1
80003798:	00040593          	mv	a1,s0
8000379c:	f8ca0513          	addi	a0,s4,-116 # 80001f8c <_ram_heap_end+0xfffeff8c>
800037a0:	6c50a0ef          	jal	ra,8000e664 <iprintf>
800037a4:	00190913          	addi	s2,s2,1
800037a8:	00440413          	addi	s0,s0,4
800037ac:	00149493          	slli	s1,s1,0x1
800037b0:	fd341ce3          	bne	s0,s3,80003788 <sram_test_write_random_ints+0x7c>
800037b4:	80002537          	lui	a0,0x80002
800037b8:	00090593          	mv	a1,s2
800037bc:	fc050513          	addi	a0,a0,-64 # 80001fc0 <_ram_heap_end+0xfffeffc0>
800037c0:	6a50a0ef          	jal	ra,8000e664 <iprintf>
800037c4:	01c12083          	lw	ra,28(sp)
800037c8:	01812403          	lw	s0,24(sp)
800037cc:	00090513          	mv	a0,s2
800037d0:	01412483          	lw	s1,20(sp)
800037d4:	01012903          	lw	s2,16(sp)
800037d8:	00c12983          	lw	s3,12(sp)
800037dc:	00812a03          	lw	s4,8(sp)
800037e0:	02010113          	addi	sp,sp,32
800037e4:	00008067          	ret

800037e8 <timerInterrupt>:
800037e8:	00008067          	ret

800037ec <externalInterrupt>:
800037ec:	ff010113          	addi	sp,sp,-16
800037f0:	00112623          	sw	ra,12(sp)
800037f4:	00812423          	sw	s0,8(sp)
800037f8:	f00607b7          	lui	a5,0xf0060
800037fc:	0047a783          	lw	a5,4(a5) # f0060004 <_ram_heap_end+0x7004e004>
80003800:	0017f793          	andi	a5,a5,1
80003804:	02078c63          	beqz	a5,8000383c <externalInterrupt+0x50>
80003808:	f0000737          	lui	a4,0xf0000
8000380c:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
80003810:	02a00593          	li	a1,42
80003814:	0027e793          	ori	a5,a5,2
80003818:	00f72223          	sw	a5,4(a4)
8000381c:	f0010737          	lui	a4,0xf0010
80003820:	00472783          	lw	a5,4(a4) # f0010004 <_ram_heap_end+0x6fffe004>
80003824:	0187d793          	srli	a5,a5,0x18
80003828:	0e079c63          	bnez	a5,80003920 <__global_pointer$+0xa0>
8000382c:	f0060737          	lui	a4,0xf0060
80003830:	00472783          	lw	a5,4(a4) # f0060004 <_ram_heap_end+0x7004e004>
80003834:	ffe7f793          	andi	a5,a5,-2
80003838:	00f72223          	sw	a5,4(a4)
8000383c:	f0060437          	lui	s0,0xf0060
80003840:	00442783          	lw	a5,4(s0) # f0060004 <_ram_heap_end+0x7004e004>
80003844:	0027f793          	andi	a5,a5,2
80003848:	00078a63          	beqz	a5,8000385c <externalInterrupt+0x70>
8000384c:	2fc000ef          	jal	ra,80003b48 <modbus_rtu_isr>
80003850:	00442783          	lw	a5,4(s0)
80003854:	ffd7f793          	andi	a5,a5,-3
80003858:	00f42223          	sw	a5,4(s0)
8000385c:	f0060437          	lui	s0,0xf0060
80003860:	00442783          	lw	a5,4(s0) # f0060004 <_ram_heap_end+0x7004e004>
80003864:	0047f793          	andi	a5,a5,4
80003868:	00078a63          	beqz	a5,8000387c <externalInterrupt+0x90>
8000386c:	754010ef          	jal	ra,80004fc0 <mac_rx_isr>
80003870:	00442783          	lw	a5,4(s0)
80003874:	ffb7f793          	andi	a5,a5,-5
80003878:	00f42223          	sw	a5,4(s0)
8000387c:	f00607b7          	lui	a5,0xf0060
80003880:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x7004e004>
80003884:	00877713          	andi	a4,a4,8
80003888:	02070863          	beqz	a4,800038b8 <__global_pointer$+0x38>
8000388c:	f0020737          	lui	a4,0xf0020
80003890:	000186b7          	lui	a3,0x18
80003894:	00072623          	sw	zero,12(a4) # f002000c <_ram_heap_end+0x7000e00c>
80003898:	6a068693          	addi	a3,a3,1696 # 186a0 <_stack_size+0x17ea0>
8000389c:	00d72823          	sw	a3,16(a4)
800038a0:	00100693          	li	a3,1
800038a4:	00d72023          	sw	a3,0(a4)
800038a8:	86d1ac23          	sw	a3,-1928(gp) # 800030f8 <events_mac_poll>
800038ac:	0047a703          	lw	a4,4(a5)
800038b0:	ff777713          	andi	a4,a4,-9
800038b4:	00e7a223          	sw	a4,4(a5)
800038b8:	f00607b7          	lui	a5,0xf0060
800038bc:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x7004e004>
800038c0:	01077713          	andi	a4,a4,16
800038c4:	02070863          	beqz	a4,800038f4 <__global_pointer$+0x74>
800038c8:	f0021737          	lui	a4,0xf0021
800038cc:	0000c6b7          	lui	a3,0xc
800038d0:	00072623          	sw	zero,12(a4) # f002100c <_ram_heap_end+0x7000f00c>
800038d4:	35068693          	addi	a3,a3,848 # c350 <_stack_size+0xbb50>
800038d8:	00d72823          	sw	a3,16(a4)
800038dc:	00100693          	li	a3,1
800038e0:	00d72023          	sw	a3,0(a4)
800038e4:	86d1aa23          	sw	a3,-1932(gp) # 800030f4 <events_modbus_rtu_poll>
800038e8:	0047a703          	lw	a4,4(a5)
800038ec:	fef77713          	andi	a4,a4,-17
800038f0:	00e7a223          	sw	a4,4(a5)
800038f4:	f00607b7          	lui	a5,0xf0060
800038f8:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x7004e004>
800038fc:	02077713          	andi	a4,a4,32
80003900:	00070863          	beqz	a4,80003910 <__global_pointer$+0x90>
80003904:	0047a703          	lw	a4,4(a5)
80003908:	fdf77713          	andi	a4,a4,-33
8000390c:	00e7a223          	sw	a4,4(a5)
80003910:	00c12083          	lw	ra,12(sp)
80003914:	00812403          	lw	s0,8(sp)
80003918:	01010113          	addi	sp,sp,16
8000391c:	00008067          	ret
80003920:	00072783          	lw	a5,0(a4)
80003924:	0ff7f513          	andi	a0,a5,255
80003928:	0ff7f693          	andi	a3,a5,255
8000392c:	00472783          	lw	a5,4(a4)
80003930:	0107d793          	srli	a5,a5,0x10
80003934:	0ff7f793          	andi	a5,a5,255
80003938:	fe078ae3          	beqz	a5,8000392c <__global_pointer$+0xac>
8000393c:	00d72023          	sw	a3,0(a4)
80003940:	00b51a63          	bne	a0,a1,80003954 <__global_pointer$+0xd4>
80003944:	87c1a783          	lw	a5,-1924(gp) # 800030fc <uart_config_reset_counter>
80003948:	00178793          	addi	a5,a5,1
8000394c:	86f1ae23          	sw	a5,-1924(gp) # 800030fc <uart_config_reset_counter>
80003950:	ed1ff06f          	j	80003820 <externalInterrupt+0x34>
80003954:	8601ae23          	sw	zero,-1924(gp) # 800030fc <uart_config_reset_counter>
80003958:	ec9ff06f          	j	80003820 <externalInterrupt+0x34>

8000395c <crash>:
8000395c:	ff010113          	addi	sp,sp,-16
80003960:	00812423          	sw	s0,8(sp)
80003964:	00050593          	mv	a1,a0
80003968:	90418513          	addi	a0,gp,-1788 # 80003184 <crash_str>
8000396c:	00112623          	sw	ra,12(sp)
80003970:	c99ff0ef          	jal	ra,80003608 <to_hex>
80003974:	80002537          	lui	a0,0x80002
80003978:	28c50513          	addi	a0,a0,652 # 8000228c <_ram_heap_end+0xffff028c>
8000397c:	2d0020ef          	jal	ra,80005c4c <print_uart0>
80003980:	90418513          	addi	a0,gp,-1788 # 80003184 <crash_str>
80003984:	2c8020ef          	jal	ra,80005c4c <print_uart0>
80003988:	00812403          	lw	s0,8(sp)
8000398c:	00c12083          	lw	ra,12(sp)
80003990:	80003537          	lui	a0,0x80003
80003994:	85050513          	addi	a0,a0,-1968 # 80002850 <_ram_heap_end+0xffff0850>
80003998:	01010113          	addi	sp,sp,16
8000399c:	2b00206f          	j	80005c4c <print_uart0>

800039a0 <irqCallback>:
800039a0:	88c1a783          	lw	a5,-1908(gp) # 8000310c <reg_irq_counter>
800039a4:	00178793          	addi	a5,a5,1
800039a8:	88f1a623          	sw	a5,-1908(gp) # 8000310c <reg_irq_counter>
800039ac:	342027f3          	csrr	a5,mcause
800039b0:	0207d263          	bgez	a5,800039d4 <irqCallback+0x34>
800039b4:	00f7f793          	andi	a5,a5,15
800039b8:	00700713          	li	a4,7
800039bc:	02e78063          	beq	a5,a4,800039dc <irqCallback+0x3c>
800039c0:	00b00713          	li	a4,11
800039c4:	00e79463          	bne	a5,a4,800039cc <irqCallback+0x2c>
800039c8:	e25ff06f          	j	800037ec <externalInterrupt>
800039cc:	00200513          	li	a0,2
800039d0:	f8dff06f          	j	8000395c <crash>
800039d4:	00100513          	li	a0,1
800039d8:	ff9ff06f          	j	800039d0 <irqCallback+0x30>
800039dc:	00008067          	ret

800039e0 <modbus_rtu_init>:
800039e0:	fe010113          	addi	sp,sp,-32
800039e4:	00112e23          	sw	ra,28(sp)
800039e8:	00812c23          	sw	s0,24(sp)
800039ec:	f0011437          	lui	s0,0xf0011
800039f0:	00842783          	lw	a5,8(s0) # f0011008 <_ram_heap_end+0x6ffff008>
800039f4:	9ac1a583          	lw	a1,-1620(gp) # 8000322c <active_config+0x18>
800039f8:	017d8537          	lui	a0,0x17d8
800039fc:	84050513          	addi	a0,a0,-1984 # 17d7840 <_stack_size+0x17d7040>
80003a00:	00f12623          	sw	a5,12(sp)
80003a04:	1a5090ef          	jal	ra,8000d3a8 <__udivsi3>
80003a08:	00500593          	li	a1,5
80003a0c:	19d090ef          	jal	ra,8000d3a8 <__udivsi3>
80003a10:	fff50713          	addi	a4,a0,-1
80003a14:	00e42423          	sw	a4,8(s0)
80003a18:	00600693          	li	a3,6
80003a1c:	00d42623          	sw	a3,12(s0)
80003a20:	00c12783          	lw	a5,12(sp)
80003a24:	80002537          	lui	a0,0x80002
80003a28:	00000693          	li	a3,0
80003a2c:	00000613          	li	a2,0
80003a30:	00700593          	li	a1,7
80003a34:	29c50513          	addi	a0,a0,668 # 8000229c <_ram_heap_end+0xffff029c>
80003a38:	42d0a0ef          	jal	ra,8000e664 <iprintf>
80003a3c:	f00b07b7          	lui	a5,0xf00b0
80003a40:	0007a603          	lw	a2,0(a5) # f00b0000 <_ram_heap_end+0x7009e000>
80003a44:	0047a683          	lw	a3,4(a5)
80003a48:	88c1a823          	sw	a2,-1904(gp) # 80003110 <modbus_rtu_rx_timestamp>
80003a4c:	01c12083          	lw	ra,28(sp)
80003a50:	01812403          	lw	s0,24(sp)
80003a54:	88d1aa23          	sw	a3,-1900(gp) # 80003114 <modbus_rtu_rx_timestamp+0x4>
80003a58:	8801ac23          	sw	zero,-1896(gp) # 80003118 <modbus_rtu_rx_len>
80003a5c:	02010113          	addi	sp,sp,32
80003a60:	00008067          	ret

80003a64 <modbus_rtu_poll>:
80003a64:	ef010113          	addi	sp,sp,-272
80003a68:	10812423          	sw	s0,264(sp)
80003a6c:	8981a783          	lw	a5,-1896(gp) # 80003118 <modbus_rtu_rx_len>
80003a70:	10112623          	sw	ra,268(sp)
80003a74:	10912223          	sw	s1,260(sp)
80003a78:	0a078e63          	beqz	a5,80003b34 <modbus_rtu_poll+0xd0>
80003a7c:	f00b07b7          	lui	a5,0xf00b0
80003a80:	0047a803          	lw	a6,4(a5) # f00b0004 <_ram_heap_end+0x7009e004>
80003a84:	0007a783          	lw	a5,0(a5)
80003a88:	8901a503          	lw	a0,-1904(gp) # 80003110 <modbus_rtu_rx_timestamp>
80003a8c:	8941a583          	lw	a1,-1900(gp) # 80003114 <modbus_rtu_rx_timestamp+0x4>
80003a90:	40a786b3          	sub	a3,a5,a0
80003a94:	00d7b733          	sltu	a4,a5,a3
80003a98:	40b807b3          	sub	a5,a6,a1
80003a9c:	00e79863          	bne	a5,a4,80003aac <modbus_rtu_poll+0x48>
80003aa0:	000027b7          	lui	a5,0x2
80003aa4:	70f78793          	addi	a5,a5,1807 # 270f <_stack_size+0x1f0f>
80003aa8:	08d7f663          	bgeu	a5,a3,80003b34 <modbus_rtu_poll+0xd0>
80003aac:	8981a583          	lw	a1,-1896(gp) # 80003118 <modbus_rtu_rx_len>
80003ab0:	80002537          	lui	a0,0x80002
80003ab4:	2fc50513          	addi	a0,a0,764 # 800022fc <_ram_heap_end+0xffff02fc>
80003ab8:	3ad0a0ef          	jal	ra,8000e664 <iprintf>
80003abc:	8981a483          	lw	s1,-1896(gp) # 80003118 <modbus_rtu_rx_len>
80003ac0:	08000793          	li	a5,128
80003ac4:	00048613          	mv	a2,s1
80003ac8:	0097f463          	bgeu	a5,s1,80003ad0 <modbus_rtu_poll+0x6c>
80003acc:	08000613          	li	a2,128
80003ad0:	91418593          	addi	a1,gp,-1772 # 80003194 <modbus_rtu_rx_buf>
80003ad4:	00010513          	mv	a0,sp
80003ad8:	74c0a0ef          	jal	ra,8000e224 <memcpy>
80003adc:	00048593          	mv	a1,s1
80003ae0:	08010613          	addi	a2,sp,128
80003ae4:	00010513          	mv	a0,sp
80003ae8:	8801ac23          	sw	zero,-1896(gp) # 80003118 <modbus_rtu_rx_len>
80003aec:	5a5000ef          	jal	ra,80004890 <modbus_recv>
80003af0:	00050593          	mv	a1,a0
80003af4:	04050063          	beqz	a0,80003b34 <modbus_rtu_poll+0xd0>
80003af8:	00000713          	li	a4,0
80003afc:	f00116b7          	lui	a3,0xf0011
80003b00:	08010793          	addi	a5,sp,128
80003b04:	00e787b3          	add	a5,a5,a4
80003b08:	0007c603          	lbu	a2,0(a5)
80003b0c:	0046a783          	lw	a5,4(a3) # f0011004 <_ram_heap_end+0x6ffff004>
80003b10:	0107d793          	srli	a5,a5,0x10
80003b14:	0ff7f793          	andi	a5,a5,255
80003b18:	fe078ae3          	beqz	a5,80003b0c <modbus_rtu_poll+0xa8>
80003b1c:	00c6a023          	sw	a2,0(a3)
80003b20:	00170713          	addi	a4,a4,1
80003b24:	fce59ee3          	bne	a1,a4,80003b00 <modbus_rtu_poll+0x9c>
80003b28:	80002537          	lui	a0,0x80002
80003b2c:	32c50513          	addi	a0,a0,812 # 8000232c <_ram_heap_end+0xffff032c>
80003b30:	3350a0ef          	jal	ra,8000e664 <iprintf>
80003b34:	10c12083          	lw	ra,268(sp)
80003b38:	10812403          	lw	s0,264(sp)
80003b3c:	10412483          	lw	s1,260(sp)
80003b40:	11010113          	addi	sp,sp,272
80003b44:	00008067          	ret

80003b48 <modbus_rtu_isr>:
80003b48:	f7010113          	addi	sp,sp,-144
80003b4c:	08812423          	sw	s0,136(sp)
80003b50:	08912223          	sw	s1,132(sp)
80003b54:	08112623          	sw	ra,140(sp)
80003b58:	f00117b7          	lui	a5,0xf0011
80003b5c:	0007a683          	lw	a3,0(a5) # f0011000 <_ram_heap_end+0x6ffff000>
80003b60:	8981a603          	lw	a2,-1896(gp) # 80003118 <modbus_rtu_rx_len>
80003b64:	0ff6f693          	andi	a3,a3,255
80003b68:	00160793          	addi	a5,a2,1 # 80001 <_stack_size+0x7f801>
80003b6c:	88f1ac23          	sw	a5,-1896(gp) # 80003118 <modbus_rtu_rx_len>
80003b70:	91418713          	addi	a4,gp,-1772 # 80003194 <modbus_rtu_rx_buf>
80003b74:	00c70733          	add	a4,a4,a2
80003b78:	00d70023          	sb	a3,0(a4)
80003b7c:	8981a683          	lw	a3,-1896(gp) # 80003118 <modbus_rtu_rx_len>
80003b80:	07f00713          	li	a4,127
80003b84:	91418493          	addi	s1,gp,-1772 # 80003194 <modbus_rtu_rx_buf>
80003b88:	00d77463          	bgeu	a4,a3,80003b90 <modbus_rtu_isr+0x48>
80003b8c:	8801ac23          	sw	zero,-1896(gp) # 80003118 <modbus_rtu_rx_len>
80003b90:	f0011737          	lui	a4,0xf0011
80003b94:	00472783          	lw	a5,4(a4) # f0011004 <_ram_heap_end+0x6ffff004>
80003b98:	0187d793          	srli	a5,a5,0x18
80003b9c:	04078063          	beqz	a5,80003bdc <modbus_rtu_isr+0x94>
80003ba0:	00472683          	lw	a3,4(a4)
80003ba4:	8981a703          	lw	a4,-1896(gp) # 80003118 <modbus_rtu_rx_len>
80003ba8:	80002637          	lui	a2,0x80002
80003bac:	0186d693          	srli	a3,a3,0x18
80003bb0:	35c60613          	addi	a2,a2,860 # 8000235c <_ram_heap_end+0xffff035c>
80003bb4:	08000593          	li	a1,128
80003bb8:	00010513          	mv	a0,sp
80003bbc:	5790a0ef          	jal	ra,8000e934 <sniprintf>
80003bc0:	00010513          	mv	a0,sp
80003bc4:	088020ef          	jal	ra,80005c4c <print_uart0>
80003bc8:	f00116b7          	lui	a3,0xf0011
80003bcc:	07f00613          	li	a2,127
80003bd0:	0046a783          	lw	a5,4(a3) # f0011004 <_ram_heap_end+0x6ffff004>
80003bd4:	0187d793          	srli	a5,a5,0x18
80003bd8:	02079663          	bnez	a5,80003c04 <modbus_rtu_isr+0xbc>
80003bdc:	f00b07b7          	lui	a5,0xf00b0
80003be0:	0007a603          	lw	a2,0(a5) # f00b0000 <_ram_heap_end+0x7009e000>
80003be4:	0047a683          	lw	a3,4(a5)
80003be8:	08c12083          	lw	ra,140(sp)
80003bec:	08812403          	lw	s0,136(sp)
80003bf0:	88c1a823          	sw	a2,-1904(gp) # 80003110 <modbus_rtu_rx_timestamp>
80003bf4:	88d1aa23          	sw	a3,-1900(gp) # 80003114 <modbus_rtu_rx_timestamp+0x4>
80003bf8:	08412483          	lw	s1,132(sp)
80003bfc:	09010113          	addi	sp,sp,144
80003c00:	00008067          	ret
80003c04:	0006a703          	lw	a4,0(a3)
80003c08:	8981a783          	lw	a5,-1896(gp) # 80003118 <modbus_rtu_rx_len>
80003c0c:	0ff77713          	andi	a4,a4,255
80003c10:	00178593          	addi	a1,a5,1
80003c14:	88b1ac23          	sw	a1,-1896(gp) # 80003118 <modbus_rtu_rx_len>
80003c18:	00f487b3          	add	a5,s1,a5
80003c1c:	00e78023          	sb	a4,0(a5)
80003c20:	8981a783          	lw	a5,-1896(gp) # 80003118 <modbus_rtu_rx_len>
80003c24:	faf676e3          	bgeu	a2,a5,80003bd0 <modbus_rtu_isr+0x88>
80003c28:	8801ac23          	sw	zero,-1896(gp) # 80003118 <modbus_rtu_rx_len>
80003c2c:	fa5ff06f          	j	80003bd0 <modbus_rtu_isr+0x88>

80003c30 <config_load>:
80003c30:	0c050863          	beqz	a0,80003d00 <config_load+0xd0>
80003c34:	fe010113          	addi	sp,sp,-32
80003c38:	00812c23          	sw	s0,24(sp)
80003c3c:	00912a23          	sw	s1,20(sp)
80003c40:	01212823          	sw	s2,16(sp)
80003c44:	01312623          	sw	s3,12(sp)
80003c48:	00112e23          	sw	ra,28(sp)
80003c4c:	00050413          	mv	s0,a0
80003c50:	00050913          	mv	s2,a0
80003c54:	00000493          	li	s1,0
80003c58:	02000993          	li	s3,32
80003c5c:	00090713          	mv	a4,s2
80003c60:	00400693          	li	a3,4
80003c64:	00048613          	mv	a2,s1
80003c68:	05000593          	li	a1,80
80003c6c:	f0090537          	lui	a0,0xf0090
80003c70:	3fc000ef          	jal	ra,8000406c <eeprom_read_page>
80003c74:	00400793          	li	a5,4
80003c78:	02f50a63          	beq	a0,a5,80003cac <config_load+0x7c>
80003c7c:	80002537          	lui	a0,0x80002
80003c80:	00400593          	li	a1,4
80003c84:	39450513          	addi	a0,a0,916 # 80002394 <_ram_heap_end+0xffff0394>
80003c88:	1dd0a0ef          	jal	ra,8000e664 <iprintf>
80003c8c:	ffe00513          	li	a0,-2
80003c90:	01c12083          	lw	ra,28(sp)
80003c94:	01812403          	lw	s0,24(sp)
80003c98:	01412483          	lw	s1,20(sp)
80003c9c:	01012903          	lw	s2,16(sp)
80003ca0:	00c12983          	lw	s3,12(sp)
80003ca4:	02010113          	addi	sp,sp,32
80003ca8:	00008067          	ret
80003cac:	00448493          	addi	s1,s1,4
80003cb0:	0ff4f493          	andi	s1,s1,255
80003cb4:	00490913          	addi	s2,s2,4
80003cb8:	fb3492e3          	bne	s1,s3,80003c5c <config_load+0x2c>
80003cbc:	01e00593          	li	a1,30
80003cc0:	00040513          	mv	a0,s0
80003cc4:	871ff0ef          	jal	ra,80003534 <crc16>
80003cc8:	01e45603          	lhu	a2,30(s0)
80003ccc:	00050593          	mv	a1,a0
80003cd0:	00a60c63          	beq	a2,a0,80003ce8 <config_load+0xb8>
80003cd4:	80002537          	lui	a0,0x80002
80003cd8:	3c850513          	addi	a0,a0,968 # 800023c8 <_ram_heap_end+0xffff03c8>
80003cdc:	1890a0ef          	jal	ra,8000e664 <iprintf>
80003ce0:	ffd00513          	li	a0,-3
80003ce4:	fadff06f          	j	80003c90 <config_load+0x60>
80003ce8:	80002537          	lui	a0,0x80002
80003cec:	02000593          	li	a1,32
80003cf0:	3fc50513          	addi	a0,a0,1020 # 800023fc <_ram_heap_end+0xffff03fc>
80003cf4:	1710a0ef          	jal	ra,8000e664 <iprintf>
80003cf8:	00000513          	li	a0,0
80003cfc:	f95ff06f          	j	80003c90 <config_load+0x60>
80003d00:	fff00513          	li	a0,-1
80003d04:	00008067          	ret

80003d08 <config_save>:
80003d08:	fe010113          	addi	sp,sp,-32
80003d0c:	00912a23          	sw	s1,20(sp)
80003d10:	00112e23          	sw	ra,28(sp)
80003d14:	00812c23          	sw	s0,24(sp)
80003d18:	01212823          	sw	s2,16(sp)
80003d1c:	01312623          	sw	s3,12(sp)
80003d20:	01412423          	sw	s4,8(sp)
80003d24:	01512223          	sw	s5,4(sp)
80003d28:	fff00493          	li	s1,-1
80003d2c:	06050063          	beqz	a0,80003d8c <config_save+0x84>
80003d30:	01e00593          	li	a1,30
80003d34:	00050413          	mv	s0,a0
80003d38:	ffcff0ef          	jal	ra,80003534 <crc16>
80003d3c:	00a41f23          	sh	a0,30(s0)
80003d40:	00000913          	li	s2,0
80003d44:	00000993          	li	s3,0
80003d48:	00800a93          	li	s5,8
80003d4c:	01240733          	add	a4,s0,s2
80003d50:	00400693          	li	a3,4
80003d54:	0ff97613          	andi	a2,s2,255
80003d58:	05000593          	li	a1,80
80003d5c:	f0090537          	lui	a0,0xf0090
80003d60:	0b8000ef          	jal	ra,80003e18 <eeprom_write_page>
80003d64:	00400793          	li	a5,4
80003d68:	04f50663          	beq	a0,a5,80003db4 <config_save+0xac>
80003d6c:	80002537          	lui	a0,0x80002
80003d70:	00090713          	mv	a4,s2
80003d74:	00098693          	mv	a3,s3
80003d78:	00400613          	li	a2,4
80003d7c:	05000593          	li	a1,80
80003d80:	43450513          	addi	a0,a0,1076 # 80002434 <_ram_heap_end+0xffff0434>
80003d84:	0e10a0ef          	jal	ra,8000e664 <iprintf>
80003d88:	ffe00493          	li	s1,-2
80003d8c:	01c12083          	lw	ra,28(sp)
80003d90:	01812403          	lw	s0,24(sp)
80003d94:	00048513          	mv	a0,s1
80003d98:	01012903          	lw	s2,16(sp)
80003d9c:	01412483          	lw	s1,20(sp)
80003da0:	00c12983          	lw	s3,12(sp)
80003da4:	00812a03          	lw	s4,8(sp)
80003da8:	00412a83          	lw	s5,4(sp)
80003dac:	02010113          	addi	sp,sp,32
80003db0:	00008067          	ret
80003db4:	00a00a13          	li	s4,10
80003db8:	05000593          	li	a1,80
80003dbc:	f0090537          	lui	a0,0xf0090
80003dc0:	228000ef          	jal	ra,80003fe8 <eeprom_poll>
80003dc4:	00050493          	mv	s1,a0
80003dc8:	02050663          	beqz	a0,80003df4 <config_save+0xec>
80003dcc:	3e800513          	li	a0,1000
80003dd0:	fffa0a13          	addi	s4,s4,-1
80003dd4:	649010ef          	jal	ra,80005c1c <delay_us>
80003dd8:	fe0a10e3          	bnez	s4,80003db8 <config_save+0xb0>
80003ddc:	80002537          	lui	a0,0x80002
80003de0:	05000593          	li	a1,80
80003de4:	4b450513          	addi	a0,a0,1204 # 800024b4 <_ram_heap_end+0xffff04b4>
80003de8:	07d0a0ef          	jal	ra,8000e664 <iprintf>
80003dec:	ffd00493          	li	s1,-3
80003df0:	f9dff06f          	j	80003d8c <config_save+0x84>
80003df4:	00198993          	addi	s3,s3,1 # 90080001 <_ram_heap_end+0x1006e001>
80003df8:	00490913          	addi	s2,s2,4
80003dfc:	f55998e3          	bne	s3,s5,80003d4c <config_save+0x44>
80003e00:	01e45603          	lhu	a2,30(s0)
80003e04:	80002537          	lui	a0,0x80002
80003e08:	02000593          	li	a1,32
80003e0c:	47c50513          	addi	a0,a0,1148 # 8000247c <_ram_heap_end+0xffff047c>
80003e10:	0550a0ef          	jal	ra,8000e664 <iprintf>
80003e14:	f79ff06f          	j	80003d8c <config_save+0x84>

80003e18 <eeprom_write_page>:
80003e18:	fe010113          	addi	sp,sp,-32
80003e1c:	00812c23          	sw	s0,24(sp)
80003e20:	00912a23          	sw	s1,20(sp)
80003e24:	01212823          	sw	s2,16(sp)
80003e28:	01412423          	sw	s4,8(sp)
80003e2c:	01512223          	sw	s5,4(sp)
80003e30:	00112e23          	sw	ra,28(sp)
80003e34:	01312623          	sw	s3,12(sp)
80003e38:	01612023          	sw	s6,0(sp)
80003e3c:	01500793          	li	a5,21
80003e40:	00159593          	slli	a1,a1,0x1
80003e44:	00f52623          	sw	a5,12(a0)
80003e48:	00018937          	lui	s2,0x18
80003e4c:	00b52023          	sw	a1,0(a0)
80003e50:	6a090593          	addi	a1,s2,1696 # 186a0 <_stack_size+0x17ea0>
80003e54:	00050413          	mv	s0,a0
80003e58:	00060493          	mv	s1,a2
80003e5c:	00068a13          	mv	s4,a3
80003e60:	00070a93          	mv	s5,a4
80003e64:	505010ef          	jal	ra,80005b68 <i2c_wait_for_busy>
80003e68:	04051663          	bnez	a0,80003eb4 <eeprom_write_page+0x9c>
80003e6c:	00042623          	sw	zero,12(s0)
80003e70:	00100613          	li	a2,1
80003e74:	80002537          	lui	a0,0x80002
80003e78:	00040593          	mv	a1,s0
80003e7c:	4e450513          	addi	a0,a0,1252 # 800024e4 <_ram_heap_end+0xffff04e4>
80003e80:	7e40a0ef          	jal	ra,8000e664 <iprintf>
80003e84:	fff00493          	li	s1,-1
80003e88:	01c12083          	lw	ra,28(sp)
80003e8c:	01812403          	lw	s0,24(sp)
80003e90:	00048513          	mv	a0,s1
80003e94:	01012903          	lw	s2,16(sp)
80003e98:	01412483          	lw	s1,20(sp)
80003e9c:	00c12983          	lw	s3,12(sp)
80003ea0:	00812a03          	lw	s4,8(sp)
80003ea4:	00412a83          	lw	s5,4(sp)
80003ea8:	00012b03          	lw	s6,0(sp)
80003eac:	02010113          	addi	sp,sp,32
80003eb0:	00008067          	ret
80003eb4:	6a090593          	addi	a1,s2,1696
80003eb8:	00040513          	mv	a0,s0
80003ebc:	4d9010ef          	jal	ra,80005b94 <i2c_wait_for_release>
80003ec0:	00051863          	bnez	a0,80003ed0 <eeprom_write_page+0xb8>
80003ec4:	00042623          	sw	zero,12(s0)
80003ec8:	00200613          	li	a2,2
80003ecc:	fa9ff06f          	j	80003e74 <eeprom_write_page+0x5c>
80003ed0:	00c42783          	lw	a5,12(s0)
80003ed4:	0407f793          	andi	a5,a5,64
80003ed8:	00078e63          	beqz	a5,80003ef4 <eeprom_write_page+0xdc>
80003edc:	00042623          	sw	zero,12(s0)
80003ee0:	00100613          	li	a2,1
80003ee4:	80002537          	lui	a0,0x80002
80003ee8:	00040593          	mv	a1,s0
80003eec:	51450513          	addi	a0,a0,1300 # 80002514 <_ram_heap_end+0xffff0514>
80003ef0:	f91ff06f          	j	80003e80 <eeprom_write_page+0x68>
80003ef4:	00200513          	li	a0,2
80003ef8:	525010ef          	jal	ra,80005c1c <delay_us>
80003efc:	01100793          	li	a5,17
80003f00:	00f42623          	sw	a5,12(s0)
80003f04:	00942023          	sw	s1,0(s0)
80003f08:	6a090593          	addi	a1,s2,1696
80003f0c:	00040513          	mv	a0,s0
80003f10:	459010ef          	jal	ra,80005b68 <i2c_wait_for_busy>
80003f14:	00051863          	bnez	a0,80003f24 <eeprom_write_page+0x10c>
80003f18:	00042623          	sw	zero,12(s0)
80003f1c:	00300613          	li	a2,3
80003f20:	f55ff06f          	j	80003e74 <eeprom_write_page+0x5c>
80003f24:	6a090593          	addi	a1,s2,1696
80003f28:	00040513          	mv	a0,s0
80003f2c:	469010ef          	jal	ra,80005b94 <i2c_wait_for_release>
80003f30:	00051863          	bnez	a0,80003f40 <eeprom_write_page+0x128>
80003f34:	00042623          	sw	zero,12(s0)
80003f38:	00400613          	li	a2,4
80003f3c:	f39ff06f          	j	80003e74 <eeprom_write_page+0x5c>
80003f40:	00c42783          	lw	a5,12(s0)
80003f44:	00000993          	li	s3,0
80003f48:	0407f793          	andi	a5,a5,64
80003f4c:	04079a63          	bnez	a5,80003fa0 <eeprom_write_page+0x188>
80003f50:	000a0493          	mv	s1,s4
80003f54:	fffa0b13          	addi	s6,s4,-1
80003f58:	6a090913          	addi	s2,s2,1696
80003f5c:	f349d6e3          	bge	s3,s4,80003e88 <eeprom_write_page+0x70>
80003f60:	00200513          	li	a0,2
80003f64:	4b9010ef          	jal	ra,80005c1c <delay_us>
80003f68:	01100793          	li	a5,17
80003f6c:	013b1463          	bne	s6,s3,80003f74 <eeprom_write_page+0x15c>
80003f70:	01900793          	li	a5,25
80003f74:	013a8733          	add	a4,s5,s3
80003f78:	00074703          	lbu	a4,0(a4)
80003f7c:	00f42623          	sw	a5,12(s0)
80003f80:	00090593          	mv	a1,s2
80003f84:	00e42023          	sw	a4,0(s0)
80003f88:	00040513          	mv	a0,s0
80003f8c:	3dd010ef          	jal	ra,80005b68 <i2c_wait_for_busy>
80003f90:	00051e63          	bnez	a0,80003fac <eeprom_write_page+0x194>
80003f94:	00042623          	sw	zero,12(s0)
80003f98:	00500613          	li	a2,5
80003f9c:	ed9ff06f          	j	80003e74 <eeprom_write_page+0x5c>
80003fa0:	00042623          	sw	zero,12(s0)
80003fa4:	00200613          	li	a2,2
80003fa8:	f3dff06f          	j	80003ee4 <eeprom_write_page+0xcc>
80003fac:	00090593          	mv	a1,s2
80003fb0:	00040513          	mv	a0,s0
80003fb4:	3e1010ef          	jal	ra,80005b94 <i2c_wait_for_release>
80003fb8:	00051863          	bnez	a0,80003fc8 <eeprom_write_page+0x1b0>
80003fbc:	00042623          	sw	zero,12(s0)
80003fc0:	00600613          	li	a2,6
80003fc4:	eb1ff06f          	j	80003e74 <eeprom_write_page+0x5c>
80003fc8:	00c42783          	lw	a5,12(s0)
80003fcc:	0407f793          	andi	a5,a5,64
80003fd0:	00078863          	beqz	a5,80003fe0 <eeprom_write_page+0x1c8>
80003fd4:	00042623          	sw	zero,12(s0)
80003fd8:	00300613          	li	a2,3
80003fdc:	f09ff06f          	j	80003ee4 <eeprom_write_page+0xcc>
80003fe0:	00198993          	addi	s3,s3,1
80003fe4:	f79ff06f          	j	80003f5c <eeprom_write_page+0x144>

80003fe8 <eeprom_poll>:
80003fe8:	ff010113          	addi	sp,sp,-16
80003fec:	00812423          	sw	s0,8(sp)
80003ff0:	00912223          	sw	s1,4(sp)
80003ff4:	00112623          	sw	ra,12(sp)
80003ff8:	01d00793          	li	a5,29
80003ffc:	00159593          	slli	a1,a1,0x1
80004000:	00f52623          	sw	a5,12(a0)
80004004:	000184b7          	lui	s1,0x18
80004008:	00b52023          	sw	a1,0(a0)
8000400c:	6a048593          	addi	a1,s1,1696 # 186a0 <_stack_size+0x17ea0>
80004010:	00050413          	mv	s0,a0
80004014:	355010ef          	jal	ra,80005b68 <i2c_wait_for_busy>
80004018:	00100613          	li	a2,1
8000401c:	00050c63          	beqz	a0,80004034 <eeprom_poll+0x4c>
80004020:	6a048593          	addi	a1,s1,1696
80004024:	00040513          	mv	a0,s0
80004028:	36d010ef          	jal	ra,80005b94 <i2c_wait_for_release>
8000402c:	02051863          	bnez	a0,8000405c <eeprom_poll+0x74>
80004030:	00200613          	li	a2,2
80004034:	80002537          	lui	a0,0x80002
80004038:	00040593          	mv	a1,s0
8000403c:	54450513          	addi	a0,a0,1348 # 80002544 <_ram_heap_end+0xffff0544>
80004040:	6240a0ef          	jal	ra,8000e664 <iprintf>
80004044:	fff00513          	li	a0,-1
80004048:	00c12083          	lw	ra,12(sp)
8000404c:	00812403          	lw	s0,8(sp)
80004050:	00412483          	lw	s1,4(sp)
80004054:	01010113          	addi	sp,sp,16
80004058:	00008067          	ret
8000405c:	00c42503          	lw	a0,12(s0)
80004060:	00655513          	srli	a0,a0,0x6
80004064:	00157513          	andi	a0,a0,1
80004068:	fe1ff06f          	j	80004048 <eeprom_poll+0x60>

8000406c <eeprom_read_page>:
8000406c:	fd010113          	addi	sp,sp,-48
80004070:	02812423          	sw	s0,40(sp)
80004074:	02912223          	sw	s1,36(sp)
80004078:	03212023          	sw	s2,32(sp)
8000407c:	01312e23          	sw	s3,28(sp)
80004080:	01412c23          	sw	s4,24(sp)
80004084:	01512a23          	sw	s5,20(sp)
80004088:	01612823          	sw	s6,16(sp)
8000408c:	02112623          	sw	ra,44(sp)
80004090:	01712623          	sw	s7,12(sp)
80004094:	01500993          	li	s3,21
80004098:	00159493          	slli	s1,a1,0x1
8000409c:	01352623          	sw	s3,12(a0)
800040a0:	00018937          	lui	s2,0x18
800040a4:	00952023          	sw	s1,0(a0)
800040a8:	6a090593          	addi	a1,s2,1696 # 186a0 <_stack_size+0x17ea0>
800040ac:	00050413          	mv	s0,a0
800040b0:	00060b13          	mv	s6,a2
800040b4:	00068a13          	mv	s4,a3
800040b8:	00070a93          	mv	s5,a4
800040bc:	2ad010ef          	jal	ra,80005b68 <i2c_wait_for_busy>
800040c0:	00051e63          	bnez	a0,800040dc <eeprom_read_page+0x70>
800040c4:	00042623          	sw	zero,12(s0)
800040c8:	00100613          	li	a2,1
800040cc:	80002537          	lui	a0,0x80002
800040d0:	00040593          	mv	a1,s0
800040d4:	56c50513          	addi	a0,a0,1388 # 8000256c <_ram_heap_end+0xffff056c>
800040d8:	0400006f          	j	80004118 <eeprom_read_page+0xac>
800040dc:	6a090593          	addi	a1,s2,1696
800040e0:	00040513          	mv	a0,s0
800040e4:	2b1010ef          	jal	ra,80005b94 <i2c_wait_for_release>
800040e8:	00051863          	bnez	a0,800040f8 <eeprom_read_page+0x8c>
800040ec:	00042623          	sw	zero,12(s0)
800040f0:	00200613          	li	a2,2
800040f4:	fd9ff06f          	j	800040cc <eeprom_read_page+0x60>
800040f8:	00c42783          	lw	a5,12(s0)
800040fc:	0407f793          	andi	a5,a5,64
80004100:	04078863          	beqz	a5,80004150 <eeprom_read_page+0xe4>
80004104:	00042623          	sw	zero,12(s0)
80004108:	00100613          	li	a2,1
8000410c:	80002537          	lui	a0,0x80002
80004110:	00040593          	mv	a1,s0
80004114:	59c50513          	addi	a0,a0,1436 # 8000259c <_ram_heap_end+0xffff059c>
80004118:	54c0a0ef          	jal	ra,8000e664 <iprintf>
8000411c:	fff00493          	li	s1,-1
80004120:	02c12083          	lw	ra,44(sp)
80004124:	02812403          	lw	s0,40(sp)
80004128:	00048513          	mv	a0,s1
8000412c:	02012903          	lw	s2,32(sp)
80004130:	02412483          	lw	s1,36(sp)
80004134:	01c12983          	lw	s3,28(sp)
80004138:	01812a03          	lw	s4,24(sp)
8000413c:	01412a83          	lw	s5,20(sp)
80004140:	01012b03          	lw	s6,16(sp)
80004144:	00c12b83          	lw	s7,12(sp)
80004148:	03010113          	addi	sp,sp,48
8000414c:	00008067          	ret
80004150:	00200513          	li	a0,2
80004154:	2c9010ef          	jal	ra,80005c1c <delay_us>
80004158:	01900793          	li	a5,25
8000415c:	00f42623          	sw	a5,12(s0)
80004160:	01642023          	sw	s6,0(s0)
80004164:	6a090593          	addi	a1,s2,1696
80004168:	00040513          	mv	a0,s0
8000416c:	1fd010ef          	jal	ra,80005b68 <i2c_wait_for_busy>
80004170:	00051863          	bnez	a0,80004180 <eeprom_read_page+0x114>
80004174:	00042623          	sw	zero,12(s0)
80004178:	00300613          	li	a2,3
8000417c:	f51ff06f          	j	800040cc <eeprom_read_page+0x60>
80004180:	6a090593          	addi	a1,s2,1696
80004184:	00040513          	mv	a0,s0
80004188:	20d010ef          	jal	ra,80005b94 <i2c_wait_for_release>
8000418c:	00051863          	bnez	a0,8000419c <eeprom_read_page+0x130>
80004190:	00042623          	sw	zero,12(s0)
80004194:	00400613          	li	a2,4
80004198:	f35ff06f          	j	800040cc <eeprom_read_page+0x60>
8000419c:	00c42783          	lw	a5,12(s0)
800041a0:	0407f793          	andi	a5,a5,64
800041a4:	00078863          	beqz	a5,800041b4 <eeprom_read_page+0x148>
800041a8:	00042623          	sw	zero,12(s0)
800041ac:	00200613          	li	a2,2
800041b0:	f5dff06f          	j	8000410c <eeprom_read_page+0xa0>
800041b4:	00200513          	li	a0,2
800041b8:	265010ef          	jal	ra,80005c1c <delay_us>
800041bc:	0014e493          	ori	s1,s1,1
800041c0:	01342623          	sw	s3,12(s0)
800041c4:	00942023          	sw	s1,0(s0)
800041c8:	6a090593          	addi	a1,s2,1696
800041cc:	00040513          	mv	a0,s0
800041d0:	199010ef          	jal	ra,80005b68 <i2c_wait_for_busy>
800041d4:	00051863          	bnez	a0,800041e4 <eeprom_read_page+0x178>
800041d8:	00042623          	sw	zero,12(s0)
800041dc:	00500613          	li	a2,5
800041e0:	eedff06f          	j	800040cc <eeprom_read_page+0x60>
800041e4:	6a090593          	addi	a1,s2,1696
800041e8:	00040513          	mv	a0,s0
800041ec:	1a9010ef          	jal	ra,80005b94 <i2c_wait_for_release>
800041f0:	00051863          	bnez	a0,80004200 <eeprom_read_page+0x194>
800041f4:	00042623          	sw	zero,12(s0)
800041f8:	00600613          	li	a2,6
800041fc:	ed1ff06f          	j	800040cc <eeprom_read_page+0x60>
80004200:	00c42783          	lw	a5,12(s0)
80004204:	00000993          	li	s3,0
80004208:	0407f793          	andi	a5,a5,64
8000420c:	04079863          	bnez	a5,8000425c <eeprom_read_page+0x1f0>
80004210:	000a0493          	mv	s1,s4
80004214:	fffa0b13          	addi	s6,s4,-1
80004218:	0ff00b93          	li	s7,255
8000421c:	6a090913          	addi	s2,s2,1696
80004220:	f149d0e3          	bge	s3,s4,80004120 <eeprom_read_page+0xb4>
80004224:	00200513          	li	a0,2
80004228:	1f5010ef          	jal	ra,80005c1c <delay_us>
8000422c:	02100793          	li	a5,33
80004230:	013b1463          	bne	s6,s3,80004238 <eeprom_read_page+0x1cc>
80004234:	00900793          	li	a5,9
80004238:	00f42623          	sw	a5,12(s0)
8000423c:	01742023          	sw	s7,0(s0)
80004240:	00090593          	mv	a1,s2
80004244:	00040513          	mv	a0,s0
80004248:	121010ef          	jal	ra,80005b68 <i2c_wait_for_busy>
8000424c:	00051e63          	bnez	a0,80004268 <eeprom_read_page+0x1fc>
80004250:	00042623          	sw	zero,12(s0)
80004254:	00700613          	li	a2,7
80004258:	e75ff06f          	j	800040cc <eeprom_read_page+0x60>
8000425c:	00042623          	sw	zero,12(s0)
80004260:	00300613          	li	a2,3
80004264:	ea9ff06f          	j	8000410c <eeprom_read_page+0xa0>
80004268:	00090593          	mv	a1,s2
8000426c:	00040513          	mv	a0,s0
80004270:	125010ef          	jal	ra,80005b94 <i2c_wait_for_release>
80004274:	00051863          	bnez	a0,80004284 <eeprom_read_page+0x218>
80004278:	00042623          	sw	zero,12(s0)
8000427c:	00800613          	li	a2,8
80004280:	e4dff06f          	j	800040cc <eeprom_read_page+0x60>
80004284:	00442703          	lw	a4,4(s0)
80004288:	013a87b3          	add	a5,s5,s3
8000428c:	00198993          	addi	s3,s3,1
80004290:	00e78023          	sb	a4,0(a5)
80004294:	f8dff06f          	j	80004220 <eeprom_read_page+0x1b4>

80004298 <eeprom_probe>:
80004298:	fe010113          	addi	sp,sp,-32
8000429c:	00912a23          	sw	s1,20(sp)
800042a0:	00050493          	mv	s1,a0
800042a4:	80002537          	lui	a0,0x80002
800042a8:	05000593          	li	a1,80
800042ac:	5c850513          	addi	a0,a0,1480 # 800025c8 <_ram_heap_end+0xffff05c8>
800042b0:	00112e23          	sw	ra,28(sp)
800042b4:	01212823          	sw	s2,16(sp)
800042b8:	00812c23          	sw	s0,24(sp)
800042bc:	3a80a0ef          	jal	ra,8000e664 <iprintf>
800042c0:	deadc7b7          	lui	a5,0xdeadc
800042c4:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac9eef>
800042c8:	00c10713          	addi	a4,sp,12
800042cc:	00400693          	li	a3,4
800042d0:	07c00613          	li	a2,124
800042d4:	05000593          	li	a1,80
800042d8:	00048513          	mv	a0,s1
800042dc:	00f12623          	sw	a5,12(sp)
800042e0:	b39ff0ef          	jal	ra,80003e18 <eeprom_write_page>
800042e4:	00400793          	li	a5,4
800042e8:	00a00913          	li	s2,10
800042ec:	00f50c63          	beq	a0,a5,80004304 <eeprom_probe+0x6c>
800042f0:	80002537          	lui	a0,0x80002
800042f4:	05000593          	li	a1,80
800042f8:	5e450513          	addi	a0,a0,1508 # 800025e4 <_ram_heap_end+0xffff05e4>
800042fc:	3680a0ef          	jal	ra,8000e664 <iprintf>
80004300:	0580006f          	j	80004358 <eeprom_probe+0xc0>
80004304:	05000593          	li	a1,80
80004308:	00048513          	mv	a0,s1
8000430c:	cddff0ef          	jal	ra,80003fe8 <eeprom_poll>
80004310:	00050413          	mv	s0,a0
80004314:	06050a63          	beqz	a0,80004388 <eeprom_probe+0xf0>
80004318:	3e800513          	li	a0,1000
8000431c:	fff90913          	addi	s2,s2,-1
80004320:	0fd010ef          	jal	ra,80005c1c <delay_us>
80004324:	fe0910e3          	bnez	s2,80004304 <eeprom_probe+0x6c>
80004328:	80002537          	lui	a0,0x80002
8000432c:	05000593          	li	a1,80
80004330:	68850513          	addi	a0,a0,1672 # 80002688 <_ram_heap_end+0xffff0688>
80004334:	fc9ff06f          	j	800042fc <eeprom_probe+0x64>
80004338:	00c12603          	lw	a2,12(sp)
8000433c:	deadc7b7          	lui	a5,0xdeadc
80004340:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac9eef>
80004344:	05000593          	li	a1,80
80004348:	00f60c63          	beq	a2,a5,80004360 <eeprom_probe+0xc8>
8000434c:	80002537          	lui	a0,0x80002
80004350:	63c50513          	addi	a0,a0,1596 # 8000263c <_ram_heap_end+0xffff063c>
80004354:	3100a0ef          	jal	ra,8000e664 <iprintf>
80004358:	fff00413          	li	s0,-1
8000435c:	0100006f          	j	8000436c <eeprom_probe+0xd4>
80004360:	80002537          	lui	a0,0x80002
80004364:	67050513          	addi	a0,a0,1648 # 80002670 <_ram_heap_end+0xffff0670>
80004368:	2fc0a0ef          	jal	ra,8000e664 <iprintf>
8000436c:	00040513          	mv	a0,s0
80004370:	01c12083          	lw	ra,28(sp)
80004374:	01812403          	lw	s0,24(sp)
80004378:	01412483          	lw	s1,20(sp)
8000437c:	01012903          	lw	s2,16(sp)
80004380:	02010113          	addi	sp,sp,32
80004384:	00008067          	ret
80004388:	00c10713          	addi	a4,sp,12
8000438c:	00400693          	li	a3,4
80004390:	07c00613          	li	a2,124
80004394:	05000593          	li	a1,80
80004398:	00048513          	mv	a0,s1
8000439c:	00012623          	sw	zero,12(sp)
800043a0:	ccdff0ef          	jal	ra,8000406c <eeprom_read_page>
800043a4:	00400793          	li	a5,4
800043a8:	f8f508e3          	beq	a0,a5,80004338 <eeprom_probe+0xa0>
800043ac:	80002537          	lui	a0,0x80002
800043b0:	05000593          	li	a1,80
800043b4:	61050513          	addi	a0,a0,1552 # 80002610 <_ram_heap_end+0xffff0610>
800043b8:	f45ff06f          	j	800042fc <eeprom_probe+0x64>

800043bc <modbus_error>:
800043bc:	ff010113          	addi	sp,sp,-16
800043c0:	00812423          	sw	s0,8(sp)
800043c4:	00912223          	sw	s1,4(sp)
800043c8:	01212023          	sw	s2,0(sp)
800043cc:	00060413          	mv	s0,a2
800043d0:	00058913          	mv	s2,a1
800043d4:	00058613          	mv	a2,a1
800043d8:	00050493          	mv	s1,a0
800043dc:	00050593          	mv	a1,a0
800043e0:	80002537          	lui	a0,0x80002
800043e4:	6fc50513          	addi	a0,a0,1788 # 800026fc <_ram_heap_end+0xffff06fc>
800043e8:	00112623          	sw	ra,12(sp)
800043ec:	2780a0ef          	jal	ra,8000e664 <iprintf>
800043f0:	9a81c783          	lbu	a5,-1624(gp) # 80003228 <active_config+0x14>
800043f4:	f804e493          	ori	s1,s1,-128
800043f8:	009400a3          	sb	s1,1(s0)
800043fc:	01240123          	sb	s2,2(s0)
80004400:	00040513          	mv	a0,s0
80004404:	00f40023          	sb	a5,0(s0)
80004408:	00300593          	li	a1,3
8000440c:	980ff0ef          	jal	ra,8000358c <add_crc>
80004410:	00c12083          	lw	ra,12(sp)
80004414:	00812403          	lw	s0,8(sp)
80004418:	00412483          	lw	s1,4(sp)
8000441c:	00012903          	lw	s2,0(sp)
80004420:	00500513          	li	a0,5
80004424:	01010113          	addi	sp,sp,16
80004428:	00008067          	ret

8000442c <modbus_store_reg>:
8000442c:	fd850793          	addi	a5,a0,-40
80004430:	fd010113          	addi	sp,sp,-48
80004434:	01079793          	slli	a5,a5,0x10
80004438:	02812423          	sw	s0,40(sp)
8000443c:	02112623          	sw	ra,44(sp)
80004440:	02912223          	sw	s1,36(sp)
80004444:	0107d793          	srli	a5,a5,0x10
80004448:	00900713          	li	a4,9
8000444c:	00058413          	mv	s0,a1
80004450:	02f76063          	bltu	a4,a5,80004470 <modbus_store_reg+0x44>
80004454:	8801a783          	lw	a5,-1920(gp) # 80003100 <reg_config_write>
80004458:	00079c63          	bnez	a5,80004470 <modbus_store_reg+0x44>
8000445c:	80002537          	lui	a0,0x80002
80004460:	72050513          	addi	a0,a0,1824 # 80002720 <_ram_heap_end+0xffff0720>
80004464:	2000a0ef          	jal	ra,8000e664 <iprintf>
80004468:	ffe00493          	li	s1,-2
8000446c:	0380006f          	j	800044a4 <modbus_store_reg+0x78>
80004470:	02f00793          	li	a5,47
80004474:	3ef50463          	beq	a0,a5,8000485c <modbus_store_reg+0x430>
80004478:	0aa7e463          	bltu	a5,a0,80004520 <modbus_store_reg+0xf4>
8000447c:	02a00793          	li	a5,42
80004480:	36f50e63          	beq	a0,a5,800047fc <modbus_store_reg+0x3d0>
80004484:	02a7ec63          	bltu	a5,a0,800044bc <modbus_store_reg+0x90>
80004488:	02000793          	li	a5,32
8000448c:	22f50263          	beq	a0,a5,800046b0 <modbus_store_reg+0x284>
80004490:	02900793          	li	a5,41
80004494:	32f50a63          	beq	a0,a5,800047c8 <modbus_store_reg+0x39c>
80004498:	01400793          	li	a5,20
8000449c:	16f50e63          	beq	a0,a5,80004618 <modbus_store_reg+0x1ec>
800044a0:	fff00493          	li	s1,-1
800044a4:	02c12083          	lw	ra,44(sp)
800044a8:	02812403          	lw	s0,40(sp)
800044ac:	00048513          	mv	a0,s1
800044b0:	02412483          	lw	s1,36(sp)
800044b4:	03010113          	addi	sp,sp,48
800044b8:	00008067          	ret
800044bc:	02c00793          	li	a5,44
800044c0:	2af50063          	beq	a0,a5,80004760 <modbus_store_reg+0x334>
800044c4:	36f56463          	bltu	a0,a5,8000482c <modbus_store_reg+0x400>
800044c8:	02d00793          	li	a5,45
800044cc:	fcf51ae3          	bne	a0,a5,800044a0 <modbus_store_reg+0x74>
800044d0:	00010513          	mv	a0,sp
800044d4:	f5cff0ef          	jal	ra,80003c30 <config_load>
800044d8:	00055c63          	bgez	a0,800044f0 <modbus_store_reg+0xc4>
800044dc:	800035b7          	lui	a1,0x80003
800044e0:	02000613          	li	a2,32
800044e4:	ff458593          	addi	a1,a1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
800044e8:	00010513          	mv	a0,sp
800044ec:	539090ef          	jal	ra,8000e224 <memcpy>
800044f0:	00044783          	lbu	a5,0(s0)
800044f4:	00144703          	lbu	a4,1(s0)
800044f8:	01879793          	slli	a5,a5,0x18
800044fc:	01071713          	slli	a4,a4,0x10
80004500:	00e7e7b3          	or	a5,a5,a4
80004504:	00344703          	lbu	a4,3(s0)
80004508:	00e7e7b3          	or	a5,a5,a4
8000450c:	00244703          	lbu	a4,2(s0)
80004510:	00871713          	slli	a4,a4,0x8
80004514:	00e7e7b3          	or	a5,a5,a4
80004518:	00f12c23          	sw	a5,24(sp)
8000451c:	26c0006f          	j	80004788 <modbus_store_reg+0x35c>
80004520:	03300793          	li	a5,51
80004524:	0cf50e63          	beq	a0,a5,80004600 <modbus_store_reg+0x1d4>
80004528:	0aa7e863          	bltu	a5,a0,800045d8 <modbus_store_reg+0x1ac>
8000452c:	03100793          	li	a5,49
80004530:	26f50663          	beq	a0,a5,8000479c <modbus_store_reg+0x370>
80004534:	1ea7f263          	bgeu	a5,a0,80004718 <modbus_store_reg+0x2ec>
80004538:	00144703          	lbu	a4,1(s0)
8000453c:	00044503          	lbu	a0,0(s0)
80004540:	00244583          	lbu	a1,2(s0)
80004544:	00871713          	slli	a4,a4,0x8
80004548:	00a76733          	or	a4,a4,a0
8000454c:	00871513          	slli	a0,a4,0x8
80004550:	00875713          	srli	a4,a4,0x8
80004554:	00e56733          	or	a4,a0,a4
80004558:	01071513          	slli	a0,a4,0x10
8000455c:	00344703          	lbu	a4,3(s0)
80004560:	00444783          	lbu	a5,4(s0)
80004564:	01055513          	srli	a0,a0,0x10
80004568:	00871713          	slli	a4,a4,0x8
8000456c:	00b76733          	or	a4,a4,a1
80004570:	00871593          	slli	a1,a4,0x8
80004574:	00875713          	srli	a4,a4,0x8
80004578:	00e5e733          	or	a4,a1,a4
8000457c:	01071593          	slli	a1,a4,0x10
80004580:	00544703          	lbu	a4,5(s0)
80004584:	0105d593          	srli	a1,a1,0x10
80004588:	ffd00493          	li	s1,-3
8000458c:	00871713          	slli	a4,a4,0x8
80004590:	00f76733          	or	a4,a4,a5
80004594:	00871793          	slli	a5,a4,0x8
80004598:	00875713          	srli	a4,a4,0x8
8000459c:	00e7e733          	or	a4,a5,a4
800045a0:	01071793          	slli	a5,a4,0x10
800045a4:	0107d793          	srli	a5,a5,0x10
800045a8:	ffa60713          	addi	a4,a2,-6
800045ac:	ee060ce3          	beqz	a2,800044a4 <modbus_store_reg+0x78>
800045b0:	800036b7          	lui	a3,0x80003
800045b4:	0806a603          	lw	a2,128(a3) # 80003080 <_ram_heap_end+0xffff1080>
800045b8:	00640693          	addi	a3,s0,6
800045bc:	0e079063          	bnez	a5,8000469c <modbus_store_reg+0x270>
800045c0:	800007b7          	lui	a5,0x80000
800045c4:	00800893          	li	a7,8
800045c8:	00600813          	li	a6,6
800045cc:	13478793          	addi	a5,a5,308 # 80000134 <_ram_heap_end+0xfffee134>
800045d0:	1d8010ef          	jal	ra,800057a8 <hub_print>
800045d4:	03c0006f          	j	80004610 <modbus_store_reg+0x1e4>
800045d8:	07e00793          	li	a5,126
800045dc:	10f50263          	beq	a0,a5,800046e0 <modbus_store_reg+0x2b4>
800045e0:	07f00793          	li	a5,127
800045e4:	12f50663          	beq	a0,a5,80004710 <modbus_store_reg+0x2e4>
800045e8:	03400793          	li	a5,52
800045ec:	eaf51ae3          	bne	a0,a5,800044a0 <modbus_store_reg+0x74>
800045f0:	00344703          	lbu	a4,3(s0)
800045f4:	800037b7          	lui	a5,0x80003
800045f8:	08e7a023          	sw	a4,128(a5) # 80003080 <_ram_heap_end+0xffff1080>
800045fc:	0140006f          	j	80004610 <modbus_store_reg+0x1e4>
80004600:	8b81a603          	lw	a2,-1864(gp) # 80003138 <hub_frame_size>
80004604:	00000593          	li	a1,0
80004608:	f0050537          	lui	a0,0xf0050
8000460c:	68c080ef          	jal	ra,8000cc98 <memset>
80004610:	00000493          	li	s1,0
80004614:	e91ff06f          	j	800044a4 <modbus_store_reg+0x78>
80004618:	00144683          	lbu	a3,1(s0)
8000461c:	00044703          	lbu	a4,0(s0)
80004620:	ffe60613          	addi	a2,a2,-2
80004624:	00869693          	slli	a3,a3,0x8
80004628:	00e6e6b3          	or	a3,a3,a4
8000462c:	41f65793          	srai	a5,a2,0x1f
80004630:	00869713          	slli	a4,a3,0x8
80004634:	0037f793          	andi	a5,a5,3
80004638:	0086d693          	srli	a3,a3,0x8
8000463c:	00d76733          	or	a4,a4,a3
80004640:	00c787b3          	add	a5,a5,a2
80004644:	01071713          	slli	a4,a4,0x10
80004648:	ffc7f793          	andi	a5,a5,-4
8000464c:	01075713          	srli	a4,a4,0x10
80004650:	00f407b3          	add	a5,s0,a5
80004654:	f0050537          	lui	a0,0xf0050
80004658:	00470593          	addi	a1,a4,4
8000465c:	faf40ae3          	beq	s0,a5,80004610 <modbus_store_reg+0x1e4>
80004660:	00544683          	lbu	a3,5(s0)
80004664:	00444603          	lbu	a2,4(s0)
80004668:	00e50733          	add	a4,a0,a4
8000466c:	01869693          	slli	a3,a3,0x18
80004670:	01061613          	slli	a2,a2,0x10
80004674:	00c6e6b3          	or	a3,a3,a2
80004678:	00244603          	lbu	a2,2(s0)
8000467c:	00440413          	addi	s0,s0,4
80004680:	00c6e6b3          	or	a3,a3,a2
80004684:	fff44603          	lbu	a2,-1(s0)
80004688:	00861613          	slli	a2,a2,0x8
8000468c:	00c6e6b3          	or	a3,a3,a2
80004690:	00d72023          	sw	a3,0(a4)
80004694:	00058713          	mv	a4,a1
80004698:	fc1ff06f          	j	80004658 <modbus_store_reg+0x22c>
8000469c:	800007b7          	lui	a5,0x80000
800046a0:	01000893          	li	a7,16
800046a4:	00c00813          	li	a6,12
800046a8:	73478793          	addi	a5,a5,1844 # 80000734 <_ram_heap_end+0xfffee734>
800046ac:	f25ff06f          	j	800045d0 <modbus_store_reg+0x1a4>
800046b0:	00044783          	lbu	a5,0(s0)
800046b4:	00144703          	lbu	a4,1(s0)
800046b8:	01879793          	slli	a5,a5,0x18
800046bc:	01071713          	slli	a4,a4,0x10
800046c0:	00e7e7b3          	or	a5,a5,a4
800046c4:	00344703          	lbu	a4,3(s0)
800046c8:	00e7e7b3          	or	a5,a5,a4
800046cc:	00244703          	lbu	a4,2(s0)
800046d0:	00871713          	slli	a4,a4,0x8
800046d4:	00e7e7b3          	or	a5,a5,a4
800046d8:	88f1a223          	sw	a5,-1916(gp) # 80003104 <reg_scratch>
800046dc:	f35ff06f          	j	80004610 <modbus_store_reg+0x1e4>
800046e0:	00044783          	lbu	a5,0(s0)
800046e4:	00144703          	lbu	a4,1(s0)
800046e8:	01879793          	slli	a5,a5,0x18
800046ec:	01071713          	slli	a4,a4,0x10
800046f0:	00e7e7b3          	or	a5,a5,a4
800046f4:	00344703          	lbu	a4,3(s0)
800046f8:	00e7e7b3          	or	a5,a5,a4
800046fc:	00244703          	lbu	a4,2(s0)
80004700:	00871713          	slli	a4,a4,0x8
80004704:	00e7e7b3          	or	a5,a5,a4
80004708:	88f1a023          	sw	a5,-1920(gp) # 80003100 <reg_config_write>
8000470c:	f05ff06f          	j	80004610 <modbus_store_reg+0x1e4>
80004710:	680010ef          	jal	ra,80005d90 <hard_reboot>
80004714:	efdff06f          	j	80004610 <modbus_store_reg+0x1e4>
80004718:	00344503          	lbu	a0,3(s0)
8000471c:	461000ef          	jal	ra,8000537c <hub_init>
80004720:	00050493          	mv	s1,a0
80004724:	d40512e3          	bnez	a0,80004468 <modbus_store_reg+0x3c>
80004728:	00010513          	mv	a0,sp
8000472c:	d04ff0ef          	jal	ra,80003c30 <config_load>
80004730:	00055c63          	bgez	a0,80004748 <modbus_store_reg+0x31c>
80004734:	800035b7          	lui	a1,0x80003
80004738:	02000613          	li	a2,32
8000473c:	ff458593          	addi	a1,a1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
80004740:	00010513          	mv	a0,sp
80004744:	2e1090ef          	jal	ra,8000e224 <memcpy>
80004748:	00344783          	lbu	a5,3(s0)
8000474c:	00010513          	mv	a0,sp
80004750:	00f109a3          	sb	a5,19(sp)
80004754:	db4ff0ef          	jal	ra,80003d08 <config_save>
80004758:	d40556e3          	bgez	a0,800044a4 <modbus_store_reg+0x78>
8000475c:	d0dff06f          	j	80004468 <modbus_store_reg+0x3c>
80004760:	00010513          	mv	a0,sp
80004764:	cccff0ef          	jal	ra,80003c30 <config_load>
80004768:	00055c63          	bgez	a0,80004780 <modbus_store_reg+0x354>
8000476c:	800035b7          	lui	a1,0x80003
80004770:	02000613          	li	a2,32
80004774:	ff458593          	addi	a1,a1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
80004778:	00010513          	mv	a0,sp
8000477c:	2a9090ef          	jal	ra,8000e224 <memcpy>
80004780:	00344783          	lbu	a5,3(s0)
80004784:	00f10a23          	sb	a5,20(sp)
80004788:	00010513          	mv	a0,sp
8000478c:	d7cff0ef          	jal	ra,80003d08 <config_save>
80004790:	41f55513          	srai	a0,a0,0x1f
80004794:	ffe57493          	andi	s1,a0,-2
80004798:	d0dff06f          	j	800044a4 <modbus_store_reg+0x78>
8000479c:	00010513          	mv	a0,sp
800047a0:	c90ff0ef          	jal	ra,80003c30 <config_load>
800047a4:	00055c63          	bgez	a0,800047bc <modbus_store_reg+0x390>
800047a8:	800035b7          	lui	a1,0x80003
800047ac:	02000613          	li	a2,32
800047b0:	ff458593          	addi	a1,a1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
800047b4:	00010513          	mv	a0,sp
800047b8:	26d090ef          	jal	ra,8000e224 <memcpy>
800047bc:	00344783          	lbu	a5,3(s0)
800047c0:	00f10623          	sb	a5,12(sp)
800047c4:	fc5ff06f          	j	80004788 <modbus_store_reg+0x35c>
800047c8:	00010513          	mv	a0,sp
800047cc:	c64ff0ef          	jal	ra,80003c30 <config_load>
800047d0:	00055c63          	bgez	a0,800047e8 <modbus_store_reg+0x3bc>
800047d4:	800035b7          	lui	a1,0x80003
800047d8:	02000613          	li	a2,32
800047dc:	ff458593          	addi	a1,a1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
800047e0:	00010513          	mv	a0,sp
800047e4:	241090ef          	jal	ra,8000e224 <memcpy>
800047e8:	00400613          	li	a2,4
800047ec:	00340593          	addi	a1,s0,3
800047f0:	00010513          	mv	a0,sp
800047f4:	5d0010ef          	jal	ra,80005dc4 <memcpy_rev>
800047f8:	f91ff06f          	j	80004788 <modbus_store_reg+0x35c>
800047fc:	00010513          	mv	a0,sp
80004800:	c30ff0ef          	jal	ra,80003c30 <config_load>
80004804:	00055c63          	bgez	a0,8000481c <modbus_store_reg+0x3f0>
80004808:	800035b7          	lui	a1,0x80003
8000480c:	02000613          	li	a2,32
80004810:	ff458593          	addi	a1,a1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
80004814:	00010513          	mv	a0,sp
80004818:	20d090ef          	jal	ra,8000e224 <memcpy>
8000481c:	00400613          	li	a2,4
80004820:	00340593          	addi	a1,s0,3
80004824:	00410513          	addi	a0,sp,4
80004828:	fcdff06f          	j	800047f4 <modbus_store_reg+0x3c8>
8000482c:	00010513          	mv	a0,sp
80004830:	c00ff0ef          	jal	ra,80003c30 <config_load>
80004834:	00055c63          	bgez	a0,8000484c <modbus_store_reg+0x420>
80004838:	800035b7          	lui	a1,0x80003
8000483c:	02000613          	li	a2,32
80004840:	ff458593          	addi	a1,a1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
80004844:	00010513          	mv	a0,sp
80004848:	1dd090ef          	jal	ra,8000e224 <memcpy>
8000484c:	00400613          	li	a2,4
80004850:	00340593          	addi	a1,s0,3
80004854:	00810513          	addi	a0,sp,8
80004858:	f9dff06f          	j	800047f4 <modbus_store_reg+0x3c8>
8000485c:	00010513          	mv	a0,sp
80004860:	bd0ff0ef          	jal	ra,80003c30 <config_load>
80004864:	00055c63          	bgez	a0,8000487c <modbus_store_reg+0x450>
80004868:	800035b7          	lui	a1,0x80003
8000486c:	02000613          	li	a2,32
80004870:	ff458593          	addi	a1,a1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
80004874:	00010513          	mv	a0,sp
80004878:	1ad090ef          	jal	ra,8000e224 <memcpy>
8000487c:	00600613          	li	a2,6
80004880:	00040593          	mv	a1,s0
80004884:	00d10513          	addi	a0,sp,13
80004888:	19d090ef          	jal	ra,8000e224 <memcpy>
8000488c:	efdff06f          	j	80004788 <modbus_store_reg+0x35c>

80004890 <modbus_recv>:
80004890:	fb010113          	addi	sp,sp,-80
80004894:	04812423          	sw	s0,72(sp)
80004898:	04112623          	sw	ra,76(sp)
8000489c:	04912223          	sw	s1,68(sp)
800048a0:	05212023          	sw	s2,64(sp)
800048a4:	03312e23          	sw	s3,60(sp)
800048a8:	03412c23          	sw	s4,56(sp)
800048ac:	03512a23          	sw	s5,52(sp)
800048b0:	03612823          	sw	s6,48(sp)
800048b4:	03712623          	sw	s7,44(sp)
800048b8:	03812423          	sw	s8,40(sp)
800048bc:	fff00413          	li	s0,-1
800048c0:	10050663          	beqz	a0,800049cc <modbus_recv+0x13c>
800048c4:	10060463          	beqz	a2,800049cc <modbus_recv+0x13c>
800048c8:	00400793          	li	a5,4
800048cc:	10b7d063          	bge	a5,a1,800049cc <modbus_recv+0x13c>
800048d0:	00058a93          	mv	s5,a1
800048d4:	ffe58593          	addi	a1,a1,-2
800048d8:	01059593          	slli	a1,a1,0x10
800048dc:	0105d593          	srli	a1,a1,0x10
800048e0:	00050a13          	mv	s4,a0
800048e4:	00060493          	mv	s1,a2
800048e8:	c4dfe0ef          	jal	ra,80003534 <crc16>
800048ec:	015a07b3          	add	a5,s4,s5
800048f0:	fff7c603          	lbu	a2,-1(a5)
800048f4:	ffe7c783          	lbu	a5,-2(a5)
800048f8:	00050593          	mv	a1,a0
800048fc:	00861613          	slli	a2,a2,0x8
80004900:	00f66633          	or	a2,a2,a5
80004904:	40c51463          	bne	a0,a2,80004d0c <modbus_recv+0x47c>
80004908:	99418713          	addi	a4,gp,-1644 # 80003214 <active_config>
8000490c:	000a4583          	lbu	a1,0(s4)
80004910:	01474603          	lbu	a2,20(a4)
80004914:	001a4903          	lbu	s2,1(s4)
80004918:	99418b13          	addi	s6,gp,-1644 # 80003214 <active_config>
8000491c:	00c58863          	beq	a1,a2,8000492c <modbus_recv+0x9c>
80004920:	3c059c63          	bnez	a1,80004cf8 <modbus_recv+0x468>
80004924:	01100793          	li	a5,17
80004928:	3cf91863          	bne	s2,a5,80004cf8 <modbus_recv+0x468>
8000492c:	002a4403          	lbu	s0,2(s4)
80004930:	003a4783          	lbu	a5,3(s4)
80004934:	08000613          	li	a2,128
80004938:	00841413          	slli	s0,s0,0x8
8000493c:	00000593          	li	a1,0
80004940:	00048513          	mv	a0,s1
80004944:	00f46433          	or	s0,s0,a5
80004948:	004a4983          	lbu	s3,4(s4)
8000494c:	005a4c03          	lbu	s8,5(s4)
80004950:	348080ef          	jal	ra,8000cc98 <memset>
80004954:	014b4783          	lbu	a5,20(s6)
80004958:	01041413          	slli	s0,s0,0x10
8000495c:	41045413          	srai	s0,s0,0x10
80004960:	00f48023          	sb	a5,0(s1)
80004964:	fff90793          	addi	a5,s2,-1
80004968:	01041b93          	slli	s7,s0,0x10
8000496c:	012480a3          	sb	s2,1(s1)
80004970:	0ff7f793          	andi	a5,a5,255
80004974:	01000713          	li	a4,16
80004978:	010bdb93          	srli	s7,s7,0x10
8000497c:	36f76863          	bltu	a4,a5,80004cec <modbus_recv+0x45c>
80004980:	80002737          	lui	a4,0x80002
80004984:	00279793          	slli	a5,a5,0x2
80004988:	6b870713          	addi	a4,a4,1720 # 800026b8 <_ram_heap_end+0xffff06b8>
8000498c:	00e787b3          	add	a5,a5,a4
80004990:	0007a783          	lw	a5,0(a5)
80004994:	00078067          	jr	a5
80004998:	800026b7          	lui	a3,0x80002
8000499c:	800025b7          	lui	a1,0x80002
800049a0:	76068693          	addi	a3,a3,1888 # 80002760 <_ram_heap_end+0xffff0760>
800049a4:	07400613          	li	a2,116
800049a8:	76c58593          	addi	a1,a1,1900 # 8000276c <_ram_heap_end+0xffff076c>
800049ac:	00348513          	addi	a0,s1,3
800049b0:	0a00a0ef          	jal	ra,8000ea50 <siprintf>
800049b4:	02800793          	li	a5,40
800049b8:	00f48123          	sb	a5,2(s1)
800049bc:	02b00593          	li	a1,43
800049c0:	00048513          	mv	a0,s1
800049c4:	bc9fe0ef          	jal	ra,8000358c <add_crc>
800049c8:	02d00413          	li	s0,45
800049cc:	00040513          	mv	a0,s0
800049d0:	04c12083          	lw	ra,76(sp)
800049d4:	04812403          	lw	s0,72(sp)
800049d8:	04412483          	lw	s1,68(sp)
800049dc:	04012903          	lw	s2,64(sp)
800049e0:	03c12983          	lw	s3,60(sp)
800049e4:	03812a03          	lw	s4,56(sp)
800049e8:	03412a83          	lw	s5,52(sp)
800049ec:	03012b03          	lw	s6,48(sp)
800049f0:	02c12b83          	lw	s7,44(sp)
800049f4:	02812c03          	lw	s8,40(sp)
800049f8:	05010113          	addi	sp,sp,80
800049fc:	00008067          	ret
80004a00:	00899993          	slli	s3,s3,0x8
80004a04:	0189e9b3          	or	s3,s3,s8
80004a08:	01099993          	slli	s3,s3,0x10
80004a0c:	4109d993          	srai	s3,s3,0x10
80004a10:	00100793          	li	a5,1
80004a14:	00048613          	mv	a2,s1
80004a18:	2cf99063          	bne	s3,a5,80004cd8 <modbus_recv+0x448>
80004a1c:	02c00793          	li	a5,44
80004a20:	20f40c63          	beq	s0,a5,80004c38 <modbus_recv+0x3a8>
80004a24:	0887c063          	blt	a5,s0,80004aa4 <modbus_recv+0x214>
80004a28:	02000793          	li	a5,32
80004a2c:	14f40e63          	beq	s0,a5,80004b88 <modbus_recv+0x2f8>
80004a30:	0287c663          	blt	a5,s0,80004a5c <modbus_recv+0x1cc>
80004a34:	01e00793          	li	a5,30
80004a38:	0ef40e63          	beq	s0,a5,80004b34 <modbus_recv+0x2a4>
80004a3c:	01f00793          	li	a5,31
80004a40:	12f40e63          	beq	s0,a5,80004b7c <modbus_recv+0x2ec>
80004a44:	00048613          	mv	a2,s1
80004a48:	00200593          	li	a1,2
80004a4c:	00090513          	mv	a0,s2
80004a50:	96dff0ef          	jal	ra,800043bc <modbus_error>
80004a54:	00050413          	mv	s0,a0
80004a58:	0f00006f          	j	80004b48 <modbus_recv+0x2b8>
80004a5c:	02a00793          	li	a5,42
80004a60:	14f40863          	beq	s0,a5,80004bb0 <modbus_recv+0x320>
80004a64:	1687cc63          	blt	a5,s0,80004bdc <modbus_recv+0x34c>
80004a68:	02900793          	li	a5,41
80004a6c:	fcf41ce3          	bne	s0,a5,80004a44 <modbus_recv+0x1b4>
80004a70:	00010513          	mv	a0,sp
80004a74:	9bcff0ef          	jal	ra,80003c30 <config_load>
80004a78:	00055c63          	bgez	a0,80004a90 <modbus_recv+0x200>
80004a7c:	800035b7          	lui	a1,0x80003
80004a80:	02000613          	li	a2,32
80004a84:	ff458593          	addi	a1,a1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
80004a88:	00010513          	mv	a0,sp
80004a8c:	798090ef          	jal	ra,8000e224 <memcpy>
80004a90:	00400613          	li	a2,4
80004a94:	00010593          	mv	a1,sp
80004a98:	00348513          	addi	a0,s1,3
80004a9c:	788090ef          	jal	ra,8000e224 <memcpy>
80004aa0:	0a40006f          	j	80004b44 <modbus_recv+0x2b4>
80004aa4:	03000793          	li	a5,48
80004aa8:	16f40063          	beq	s0,a5,80004c08 <modbus_recv+0x378>
80004aac:	0487c463          	blt	a5,s0,80004af4 <modbus_recv+0x264>
80004ab0:	02d00793          	li	a5,45
80004ab4:	1af40663          	beq	s0,a5,80004c60 <modbus_recv+0x3d0>
80004ab8:	02f00793          	li	a5,47
80004abc:	f8f414e3          	bne	s0,a5,80004a44 <modbus_recv+0x1b4>
80004ac0:	00010513          	mv	a0,sp
80004ac4:	96cff0ef          	jal	ra,80003c30 <config_load>
80004ac8:	00055c63          	bgez	a0,80004ae0 <modbus_recv+0x250>
80004acc:	800035b7          	lui	a1,0x80003
80004ad0:	02000613          	li	a2,32
80004ad4:	ff458593          	addi	a1,a1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
80004ad8:	00010513          	mv	a0,sp
80004adc:	748090ef          	jal	ra,8000e224 <memcpy>
80004ae0:	00600613          	li	a2,6
80004ae4:	00d10593          	addi	a1,sp,13
80004ae8:	00348513          	addi	a0,s1,3
80004aec:	738090ef          	jal	ra,8000e224 <memcpy>
80004af0:	1400006f          	j	80004c30 <modbus_recv+0x3a0>
80004af4:	03400793          	li	a5,52
80004af8:	0af40463          	beq	s0,a5,80004ba0 <modbus_recv+0x310>
80004afc:	07e00793          	li	a5,126
80004b00:	08f40a63          	beq	s0,a5,80004b94 <modbus_recv+0x304>
80004b04:	03100793          	li	a5,49
80004b08:	f2f41ee3          	bne	s0,a5,80004a44 <modbus_recv+0x1b4>
80004b0c:	00010513          	mv	a0,sp
80004b10:	920ff0ef          	jal	ra,80003c30 <config_load>
80004b14:	00055c63          	bgez	a0,80004b2c <modbus_recv+0x29c>
80004b18:	800035b7          	lui	a1,0x80003
80004b1c:	02000613          	li	a2,32
80004b20:	ff458593          	addi	a1,a1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
80004b24:	00010513          	mv	a0,sp
80004b28:	6fc090ef          	jal	ra,8000e224 <memcpy>
80004b2c:	00c14783          	lbu	a5,12(sp)
80004b30:	0fc0006f          	j	80004c2c <modbus_recv+0x39c>
80004b34:	00400613          	li	a2,4
80004b38:	88b18593          	addi	a1,gp,-1909 # 8000310b <reg_sys_counter+0x3>
80004b3c:	00348513          	addi	a0,s1,3
80004b40:	284010ef          	jal	ra,80005dc4 <memcpy_rev>
80004b44:	00400413          	li	s0,4
80004b48:	00340593          	addi	a1,s0,3
80004b4c:	01059593          	slli	a1,a1,0x10
80004b50:	00848123          	sb	s0,2(s1)
80004b54:	0105d593          	srli	a1,a1,0x10
80004b58:	00048513          	mv	a0,s1
80004b5c:	a31fe0ef          	jal	ra,8000358c <add_crc>
80004b60:	00540413          	addi	s0,s0,5
80004b64:	e60414e3          	bnez	s0,800049cc <modbus_recv+0x13c>
80004b68:	80002537          	lui	a0,0x80002
80004b6c:	00090593          	mv	a1,s2
80004b70:	78c50513          	addi	a0,a0,1932 # 8000278c <_ram_heap_end+0xffff078c>
80004b74:	2f1090ef          	jal	ra,8000e664 <iprintf>
80004b78:	e55ff06f          	j	800049cc <modbus_recv+0x13c>
80004b7c:	00400613          	li	a2,4
80004b80:	88f18593          	addi	a1,gp,-1905 # 8000310f <reg_irq_counter+0x3>
80004b84:	fb9ff06f          	j	80004b3c <modbus_recv+0x2ac>
80004b88:	00400613          	li	a2,4
80004b8c:	88718593          	addi	a1,gp,-1913 # 80003107 <reg_scratch+0x3>
80004b90:	fadff06f          	j	80004b3c <modbus_recv+0x2ac>
80004b94:	00400613          	li	a2,4
80004b98:	88318593          	addi	a1,gp,-1917 # 80003103 <reg_config_write+0x3>
80004b9c:	fa1ff06f          	j	80004b3c <modbus_recv+0x2ac>
80004ba0:	800035b7          	lui	a1,0x80003
80004ba4:	00400613          	li	a2,4
80004ba8:	08358593          	addi	a1,a1,131 # 80003083 <_ram_heap_end+0xffff1083>
80004bac:	f91ff06f          	j	80004b3c <modbus_recv+0x2ac>
80004bb0:	00010513          	mv	a0,sp
80004bb4:	87cff0ef          	jal	ra,80003c30 <config_load>
80004bb8:	00055c63          	bgez	a0,80004bd0 <modbus_recv+0x340>
80004bbc:	800035b7          	lui	a1,0x80003
80004bc0:	02000613          	li	a2,32
80004bc4:	ff458593          	addi	a1,a1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
80004bc8:	00010513          	mv	a0,sp
80004bcc:	658090ef          	jal	ra,8000e224 <memcpy>
80004bd0:	00400613          	li	a2,4
80004bd4:	00410593          	addi	a1,sp,4
80004bd8:	ec1ff06f          	j	80004a98 <modbus_recv+0x208>
80004bdc:	00010513          	mv	a0,sp
80004be0:	850ff0ef          	jal	ra,80003c30 <config_load>
80004be4:	00055c63          	bgez	a0,80004bfc <modbus_recv+0x36c>
80004be8:	800035b7          	lui	a1,0x80003
80004bec:	02000613          	li	a2,32
80004bf0:	ff458593          	addi	a1,a1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
80004bf4:	00010513          	mv	a0,sp
80004bf8:	62c090ef          	jal	ra,8000e224 <memcpy>
80004bfc:	00400613          	li	a2,4
80004c00:	00810593          	addi	a1,sp,8
80004c04:	e95ff06f          	j	80004a98 <modbus_recv+0x208>
80004c08:	00010513          	mv	a0,sp
80004c0c:	824ff0ef          	jal	ra,80003c30 <config_load>
80004c10:	00055c63          	bgez	a0,80004c28 <modbus_recv+0x398>
80004c14:	800035b7          	lui	a1,0x80003
80004c18:	02000613          	li	a2,32
80004c1c:	ff458593          	addi	a1,a1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
80004c20:	00010513          	mv	a0,sp
80004c24:	600090ef          	jal	ra,8000e224 <memcpy>
80004c28:	01314783          	lbu	a5,19(sp)
80004c2c:	00f48323          	sb	a5,6(s1)
80004c30:	00600413          	li	s0,6
80004c34:	f15ff06f          	j	80004b48 <modbus_recv+0x2b8>
80004c38:	00010513          	mv	a0,sp
80004c3c:	ff5fe0ef          	jal	ra,80003c30 <config_load>
80004c40:	00055c63          	bgez	a0,80004c58 <modbus_recv+0x3c8>
80004c44:	800035b7          	lui	a1,0x80003
80004c48:	02000613          	li	a2,32
80004c4c:	ff458593          	addi	a1,a1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
80004c50:	00010513          	mv	a0,sp
80004c54:	5d0090ef          	jal	ra,8000e224 <memcpy>
80004c58:	01414783          	lbu	a5,20(sp)
80004c5c:	fd1ff06f          	j	80004c2c <modbus_recv+0x39c>
80004c60:	00010513          	mv	a0,sp
80004c64:	fcdfe0ef          	jal	ra,80003c30 <config_load>
80004c68:	00055c63          	bgez	a0,80004c80 <modbus_recv+0x3f0>
80004c6c:	800035b7          	lui	a1,0x80003
80004c70:	02000613          	li	a2,32
80004c74:	ff458593          	addi	a1,a1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
80004c78:	00010513          	mv	a0,sp
80004c7c:	5a8090ef          	jal	ra,8000e224 <memcpy>
80004c80:	00400613          	li	a2,4
80004c84:	01b10593          	addi	a1,sp,27
80004c88:	e61ff06f          	j	80004ae8 <modbus_recv+0x258>
80004c8c:	00400613          	li	a2,4
80004c90:	002a0593          	addi	a1,s4,2
80004c94:	00248513          	addi	a0,s1,2
80004c98:	58c090ef          	jal	ra,8000e224 <memcpy>
80004c9c:	00600593          	li	a1,6
80004ca0:	00048513          	mv	a0,s1
80004ca4:	8e9fe0ef          	jal	ra,8000358c <add_crc>
80004ca8:	00800413          	li	s0,8
80004cac:	d21ff06f          	j	800049cc <modbus_recv+0x13c>
80004cb0:	ff7a8613          	addi	a2,s5,-9
80004cb4:	0ff67613          	andi	a2,a2,255
80004cb8:	007a0593          	addi	a1,s4,7
80004cbc:	000b8513          	mv	a0,s7
80004cc0:	f6cff0ef          	jal	ra,8000442c <modbus_store_reg>
80004cc4:	fc0554e3          	bgez	a0,80004c8c <modbus_recv+0x3fc>
80004cc8:	ffe00793          	li	a5,-2
80004ccc:	00048613          	mv	a2,s1
80004cd0:	00700593          	li	a1,7
80004cd4:	00f50463          	beq	a0,a5,80004cdc <modbus_recv+0x44c>
80004cd8:	00300593          	li	a1,3
80004cdc:	00090513          	mv	a0,s2
80004ce0:	edcff0ef          	jal	ra,800043bc <modbus_error>
80004ce4:	00050413          	mv	s0,a0
80004ce8:	e7dff06f          	j	80004b64 <modbus_recv+0x2d4>
80004cec:	00048613          	mv	a2,s1
80004cf0:	00100593          	li	a1,1
80004cf4:	fe9ff06f          	j	80004cdc <modbus_recv+0x44c>
80004cf8:	80002537          	lui	a0,0x80002
80004cfc:	7bc50513          	addi	a0,a0,1980 # 800027bc <_ram_heap_end+0xffff07bc>
80004d00:	165090ef          	jal	ra,8000e664 <iprintf>
80004d04:	00000413          	li	s0,0
80004d08:	cc5ff06f          	j	800049cc <modbus_recv+0x13c>
80004d0c:	80002537          	lui	a0,0x80002
80004d10:	7fc50513          	addi	a0,a0,2044 # 800027fc <_ram_heap_end+0xffff07fc>
80004d14:	fedff06f          	j	80004d00 <modbus_recv+0x470>

80004d18 <mac_init>:
80004d18:	ff010113          	addi	sp,sp,-16
80004d1c:	00112623          	sw	ra,12(sp)
80004d20:	00812423          	sw	s0,8(sp)
80004d24:	02051263          	bnez	a0,80004d48 <mac_init+0x30>
80004d28:	80003537          	lui	a0,0x80003
80004d2c:	83450513          	addi	a0,a0,-1996 # 80002834 <_ram_heap_end+0xffff0834>
80004d30:	135090ef          	jal	ra,8000e664 <iprintf>
80004d34:	ff000513          	li	a0,-16
80004d38:	00c12083          	lw	ra,12(sp)
80004d3c:	00812403          	lw	s0,8(sp)
80004d40:	01010113          	addi	sp,sp,16
80004d44:	00008067          	ret
80004d48:	800035b7          	lui	a1,0x80003
80004d4c:	00050413          	mv	s0,a0
80004d50:	00500613          	li	a2,5
80004d54:	85458593          	addi	a1,a1,-1964 # 80002854 <_ram_heap_end+0xffff0854>
80004d58:	03650513          	addi	a0,a0,54
80004d5c:	4c8090ef          	jal	ra,8000e224 <memcpy>
80004d60:	8000b7b7          	lui	a5,0x8000b
80004d64:	47878793          	addi	a5,a5,1144 # 8000b478 <_ram_heap_end+0xffff9478>
80004d68:	00f42a23          	sw	a5,20(s0)
80004d6c:	800057b7          	lui	a5,0x80005
80004d70:	dcc78793          	addi	a5,a5,-564 # 80004dcc <_ram_heap_end+0xffff2dcc>
80004d74:	00f42c23          	sw	a5,24(s0)
80004d78:	00600613          	li	a2,6
80004d7c:	9a118593          	addi	a1,gp,-1631 # 80003221 <active_config+0xd>
80004d80:	02e40513          	addi	a0,s0,46
80004d84:	4a0090ef          	jal	ra,8000e224 <memcpy>
80004d88:	5dc00793          	li	a5,1500
80004d8c:	02f41623          	sh	a5,44(s0)
80004d90:	000017b7          	lui	a5,0x1
80004d94:	e0678793          	addi	a5,a5,-506 # e06 <_stack_size+0x606>
80004d98:	02f41a23          	sh	a5,52(s0)
80004d9c:	00002537          	lui	a0,0x2
80004da0:	01100793          	li	a5,17
80004da4:	f0070437          	lui	s0,0xf0070
80004da8:	00f42023          	sw	a5,0(s0) # f0070000 <_ram_heap_end+0x7005e000>
80004dac:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
80004db0:	66d000ef          	jal	ra,80005c1c <delay_us>
80004db4:	80003537          	lui	a0,0x80003
80004db8:	00042023          	sw	zero,0(s0)
80004dbc:	85c50513          	addi	a0,a0,-1956 # 8000285c <_ram_heap_end+0xffff085c>
80004dc0:	0a5090ef          	jal	ra,8000e664 <iprintf>
80004dc4:	00000513          	li	a0,0
80004dc8:	f71ff06f          	j	80004d38 <mac_init+0x20>

80004dcc <mac_tx_packet>:
80004dcc:	00050463          	beqz	a0,80004dd4 <mac_tx_packet+0x8>
80004dd0:	00059e63          	bnez	a1,80004dec <mac_tx_packet+0x20>
80004dd4:	f0000737          	lui	a4,0xf0000
80004dd8:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
80004ddc:	ff000513          	li	a0,-16
80004de0:	0027e793          	ori	a5,a5,2
80004de4:	00f72223          	sw	a5,4(a4)
80004de8:	00008067          	ret
80004dec:	ff010113          	addi	sp,sp,-16
80004df0:	00812423          	sw	s0,8(sp)
80004df4:	00058413          	mv	s0,a1
80004df8:	00040513          	mv	a0,s0
80004dfc:	ffe00593          	li	a1,-2
80004e00:	00112623          	sw	ra,12(sp)
80004e04:	208020ef          	jal	ra,8000700c <pbuf_header>
80004e08:	00040713          	mv	a4,s0
80004e0c:	00000793          	li	a5,0
80004e10:	00a75683          	lhu	a3,10(a4)
80004e14:	00072703          	lw	a4,0(a4)
80004e18:	00d787b3          	add	a5,a5,a3
80004e1c:	fe071ae3          	bnez	a4,80004e10 <mac_tx_packet+0x44>
80004e20:	00379793          	slli	a5,a5,0x3
80004e24:	f00706b7          	lui	a3,0xf0070
80004e28:	0006a703          	lw	a4,0(a3) # f0070000 <_ram_heap_end+0x7005e000>
80004e2c:	00277713          	andi	a4,a4,2
80004e30:	fe070ce3          	beqz	a4,80004e28 <mac_tx_packet+0x5c>
80004e34:	f0070737          	lui	a4,0xf0070
80004e38:	01472683          	lw	a3,20(a4) # f0070014 <_ram_heap_end+0x7005e014>
80004e3c:	fe068ee3          	beqz	a3,80004e38 <mac_tx_packet+0x6c>
80004e40:	00f72823          	sw	a5,16(a4)
80004e44:	00040693          	mv	a3,s0
80004e48:	00000713          	li	a4,0
80004e4c:	00000793          	li	a5,0
80004e50:	00300893          	li	a7,3
80004e54:	f0070837          	lui	a6,0xf0070
80004e58:	0046a603          	lw	a2,4(a3)
80004e5c:	00a6d583          	lhu	a1,10(a3)
80004e60:	00b605b3          	add	a1,a2,a1
80004e64:	04c59863          	bne	a1,a2,80004eb4 <mac_tx_packet+0xe8>
80004e68:	0006a683          	lw	a3,0(a3)
80004e6c:	fe0696e3          	bnez	a3,80004e58 <mac_tx_packet+0x8c>
80004e70:	00078a63          	beqz	a5,80004e84 <mac_tx_packet+0xb8>
80004e74:	f00707b7          	lui	a5,0xf0070
80004e78:	0147a683          	lw	a3,20(a5) # f0070014 <_ram_heap_end+0x7005e014>
80004e7c:	fe068ee3          	beqz	a3,80004e78 <mac_tx_packet+0xac>
80004e80:	00e7a823          	sw	a4,16(a5)
80004e84:	00040513          	mv	a0,s0
80004e88:	00200593          	li	a1,2
80004e8c:	180020ef          	jal	ra,8000700c <pbuf_header>
80004e90:	a0c18793          	addi	a5,gp,-1524 # 8000328c <lwip_stats>
80004e94:	0007a703          	lw	a4,0(a5)
80004e98:	00000513          	li	a0,0
80004e9c:	00170713          	addi	a4,a4,1
80004ea0:	00e7a023          	sw	a4,0(a5)
80004ea4:	00c12083          	lw	ra,12(sp)
80004ea8:	00812403          	lw	s0,8(sp)
80004eac:	01010113          	addi	sp,sp,16
80004eb0:	00008067          	ret
80004eb4:	00064503          	lbu	a0,0(a2)
80004eb8:	00379313          	slli	t1,a5,0x3
80004ebc:	00651533          	sll	a0,a0,t1
80004ec0:	00a76733          	or	a4,a4,a0
80004ec4:	01179a63          	bne	a5,a7,80004ed8 <mac_tx_packet+0x10c>
80004ec8:	01482503          	lw	a0,20(a6) # f0070014 <_ram_heap_end+0x7005e014>
80004ecc:	fe050ee3          	beqz	a0,80004ec8 <mac_tx_packet+0xfc>
80004ed0:	00e82823          	sw	a4,16(a6)
80004ed4:	00000713          	li	a4,0
80004ed8:	00178793          	addi	a5,a5,1
80004edc:	0037f793          	andi	a5,a5,3
80004ee0:	00160613          	addi	a2,a2,1
80004ee4:	f81ff06f          	j	80004e64 <mac_tx_packet+0x98>

80004ee8 <sys_now>:
80004ee8:	ff010113          	addi	sp,sp,-16
80004eec:	00112623          	sw	ra,12(sp)
80004ef0:	f00b07b7          	lui	a5,0xf00b0
80004ef4:	0007a503          	lw	a0,0(a5) # f00b0000 <_ram_heap_end+0x7009e000>
80004ef8:	0047a583          	lw	a1,4(a5)
80004efc:	3e800613          	li	a2,1000
80004f00:	00000693          	li	a3,0
80004f04:	6a5070ef          	jal	ra,8000cda8 <__udivdi3>
80004f08:	00c12083          	lw	ra,12(sp)
80004f0c:	01010113          	addi	sp,sp,16
80004f10:	00008067          	ret

80004f14 <sys_arch_protect>:
80004f14:	00008067          	ret

80004f18 <sys_arch_unprotect>:
80004f18:	00008067          	ret

80004f1c <mac_lwip_init>:
80004f1c:	ff010113          	addi	sp,sp,-16
80004f20:	00112623          	sw	ra,12(sp)
80004f24:	00812423          	sw	s0,8(sp)
80004f28:	00912223          	sw	s1,4(sp)
80004f2c:	6bd000ef          	jal	ra,80005de8 <lwip_init>
80004f30:	fb9ff0ef          	jal	ra,80004ee8 <sys_now>
80004f34:	8aa1a223          	sw	a0,-1884(gp) # 80003124 <ts_ipreass>
80004f38:	8aa1a623          	sw	a0,-1876(gp) # 8000312c <ts_etharp>
80004f3c:	8000d837          	lui	a6,0x8000d
80004f40:	800057b7          	lui	a5,0x80005
80004f44:	a5c80813          	addi	a6,a6,-1444 # 8000ca5c <_ram_heap_end+0xffffaa5c>
80004f48:	d1878793          	addi	a5,a5,-744 # 80004d18 <_ram_heap_end+0xffff2d18>
80004f4c:	00000713          	li	a4,0
80004f50:	99818693          	addi	a3,gp,-1640 # 80003218 <active_config+0x4>
80004f54:	99c18613          	addi	a2,gp,-1636 # 8000321c <active_config+0x8>
80004f58:	99418593          	addi	a1,gp,-1644 # 80003214 <active_config>
80004f5c:	9b418513          	addi	a0,gp,-1612 # 80003234 <default_netif>
80004f60:	24d010ef          	jal	ra,800069ac <netif_add>
80004f64:	02051663          	bnez	a0,80004f90 <mac_lwip_init+0x74>
80004f68:	80003537          	lui	a0,0x80003
80004f6c:	87050513          	addi	a0,a0,-1936 # 80002870 <_ram_heap_end+0xffff0870>
80004f70:	6f4090ef          	jal	ra,8000e664 <iprintf>
80004f74:	fff00493          	li	s1,-1
80004f78:	00c12083          	lw	ra,12(sp)
80004f7c:	00812403          	lw	s0,8(sp)
80004f80:	00048513          	mv	a0,s1
80004f84:	00412483          	lw	s1,4(sp)
80004f88:	01010113          	addi	sp,sp,16
80004f8c:	00008067          	ret
80004f90:	9b418513          	addi	a0,gp,-1612 # 80003234 <default_netif>
80004f94:	351010ef          	jal	ra,80006ae4 <netif_set_default>
80004f98:	9b418513          	addi	a0,gp,-1612 # 80003234 <default_netif>
80004f9c:	99418493          	addi	s1,gp,-1644 # 80003214 <active_config>
80004fa0:	34d010ef          	jal	ra,80006aec <netif_set_up>
80004fa4:	00c4c783          	lbu	a5,12(s1)
80004fa8:	00000493          	li	s1,0
80004fac:	0017f793          	andi	a5,a5,1
80004fb0:	fc0784e3          	beqz	a5,80004f78 <mac_lwip_init+0x5c>
80004fb4:	9b418513          	addi	a0,gp,-1612 # 80003234 <default_netif>
80004fb8:	558050ef          	jal	ra,8000a510 <dhcp_start>
80004fbc:	fbdff06f          	j	80004f78 <mac_lwip_init+0x5c>

80004fc0 <mac_rx_isr>:
80004fc0:	fc010113          	addi	sp,sp,-64
80004fc4:	02912a23          	sw	s1,52(sp)
80004fc8:	03512223          	sw	s5,36(sp)
80004fcc:	01712e23          	sw	s7,28(sp)
80004fd0:	00001bb7          	lui	s7,0x1
80004fd4:	03312623          	sw	s3,44(sp)
80004fd8:	01812c23          	sw	s8,24(sp)
80004fdc:	01912a23          	sw	s9,20(sp)
80004fe0:	02112e23          	sw	ra,60(sp)
80004fe4:	02812c23          	sw	s0,56(sp)
80004fe8:	03212823          	sw	s2,48(sp)
80004fec:	03412423          	sw	s4,40(sp)
80004ff0:	03612023          	sw	s6,32(sp)
80004ff4:	01a12823          	sw	s10,16(sp)
80004ff8:	00000993          	li	s3,0
80004ffc:	800b8b93          	addi	s7,s7,-2048 # 800 <_stack_size>
80005000:	a0c18493          	addi	s1,gp,-1524 # 8000328c <lwip_stats>
80005004:	9b418a93          	addi	s5,gp,-1612 # 80003234 <default_netif>
80005008:	80003c37          	lui	s8,0x80003
8000500c:	80003cb7          	lui	s9,0x80003
80005010:	f0070937          	lui	s2,0xf0070
80005014:	00092783          	lw	a5,0(s2) # f0070000 <_ram_heap_end+0x7005e000>
80005018:	0207f793          	andi	a5,a5,32
8000501c:	04078663          	beqz	a5,80005068 <mac_rx_isr+0xa8>
80005020:	02092683          	lw	a3,32(s2)
80005024:	00768413          	addi	s0,a3,7
80005028:	00345413          	srli	s0,s0,0x3
8000502c:	068bfa63          	bgeu	s7,s0,800050a0 <mac_rx_isr+0xe0>
80005030:	80003537          	lui	a0,0x80003
80005034:	00068613          	mv	a2,a3
80005038:	00040593          	mv	a1,s0
8000503c:	89450513          	addi	a0,a0,-1900 # 80002894 <_ram_heap_end+0xffff0894>
80005040:	624090ef          	jal	ra,8000e664 <iprintf>
80005044:	80c1a783          	lw	a5,-2036(gp) # 8000308c <_impure_ptr>
80005048:	0087a503          	lw	a0,8(a5)
8000504c:	415080ef          	jal	ra,8000dc60 <fflush>
80005050:	01100793          	li	a5,17
80005054:	00002537          	lui	a0,0x2
80005058:	00f92023          	sw	a5,0(s2)
8000505c:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
80005060:	3bd000ef          	jal	ra,80005c1c <delay_us>
80005064:	00092023          	sw	zero,0(s2)
80005068:	03c12083          	lw	ra,60(sp)
8000506c:	03812403          	lw	s0,56(sp)
80005070:	03412483          	lw	s1,52(sp)
80005074:	03012903          	lw	s2,48(sp)
80005078:	02c12983          	lw	s3,44(sp)
8000507c:	02812a03          	lw	s4,40(sp)
80005080:	02412a83          	lw	s5,36(sp)
80005084:	02012b03          	lw	s6,32(sp)
80005088:	01c12b83          	lw	s7,28(sp)
8000508c:	01812c03          	lw	s8,24(sp)
80005090:	01412c83          	lw	s9,20(sp)
80005094:	01012d03          	lw	s10,16(sp)
80005098:	04010113          	addi	sp,sp,64
8000509c:	00008067          	ret
800050a0:	00240d13          	addi	s10,s0,2
800050a4:	010d1d13          	slli	s10,s10,0x10
800050a8:	010d5d13          	srli	s10,s10,0x10
800050ac:	18200613          	li	a2,386
800050b0:	000d0593          	mv	a1,s10
800050b4:	00000513          	li	a0,0
800050b8:	00d12623          	sw	a3,12(sp)
800050bc:	04c020ef          	jal	ra,80007108 <pbuf_alloc>
800050c0:	00050913          	mv	s2,a0
800050c4:	00c12683          	lw	a3,12(sp)
800050c8:	0a051663          	bnez	a0,80005174 <mac_rx_isr+0x1b4>
800050cc:	f0000737          	lui	a4,0xf0000
800050d0:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
800050d4:	80003537          	lui	a0,0x80003
800050d8:	00040613          	mv	a2,s0
800050dc:	0027e793          	ori	a5,a5,2
800050e0:	00f72223          	sw	a5,4(a4)
800050e4:	01f68713          	addi	a4,a3,31
800050e8:	00575713          	srli	a4,a4,0x5
800050ec:	000d0593          	mv	a1,s10
800050f0:	8d450513          	addi	a0,a0,-1836 # 800028d4 <_ram_heap_end+0xffff08d4>
800050f4:	570090ef          	jal	ra,8000e664 <iprintf>
800050f8:	a0c18793          	addi	a5,gp,-1524 # 8000328c <lwip_stats>
800050fc:	0187a703          	lw	a4,24(a5)
80005100:	00170713          	addi	a4,a4,1
80005104:	00e7ac23          	sw	a4,24(a5)
80005108:	00c7a703          	lw	a4,12(a5)
8000510c:	00170713          	addi	a4,a4,1
80005110:	00e7a623          	sw	a4,12(a5)
80005114:	f0070737          	lui	a4,0xf0070
80005118:	04804263          	bgtz	s0,8000515c <mac_rx_isr+0x19c>
8000511c:	03812403          	lw	s0,56(sp)
80005120:	03c12083          	lw	ra,60(sp)
80005124:	03412483          	lw	s1,52(sp)
80005128:	03012903          	lw	s2,48(sp)
8000512c:	02c12983          	lw	s3,44(sp)
80005130:	02812a03          	lw	s4,40(sp)
80005134:	02412a83          	lw	s5,36(sp)
80005138:	02012b03          	lw	s6,32(sp)
8000513c:	01c12b83          	lw	s7,28(sp)
80005140:	01812c03          	lw	s8,24(sp)
80005144:	01412c83          	lw	s9,20(sp)
80005148:	01012d03          	lw	s10,16(sp)
8000514c:	80003537          	lui	a0,0x80003
80005150:	92450513          	addi	a0,a0,-1756 # 80002924 <_ram_heap_end+0xffff0924>
80005154:	04010113          	addi	sp,sp,64
80005158:	50c0906f          	j	8000e664 <iprintf>
8000515c:	00072783          	lw	a5,0(a4) # f0070000 <_ram_heap_end+0x7005e000>
80005160:	0207f793          	andi	a5,a5,32
80005164:	fe078ce3          	beqz	a5,8000515c <mac_rx_isr+0x19c>
80005168:	02072783          	lw	a5,32(a4)
8000516c:	ffc40413          	addi	s0,s0,-4
80005170:	fa9ff06f          	j	80005118 <mac_rx_isr+0x158>
80005174:	ffe00593          	li	a1,-2
80005178:	695010ef          	jal	ra,8000700c <pbuf_header>
8000517c:	00000713          	li	a4,0
80005180:	00000793          	li	a5,0
80005184:	f0070637          	lui	a2,0xf0070
80005188:	04041a63          	bnez	s0,800051dc <mac_rx_isr+0x21c>
8000518c:	00200593          	li	a1,2
80005190:	00090513          	mv	a0,s2
80005194:	00492a03          	lw	s4,4(s2)
80005198:	675010ef          	jal	ra,8000700c <pbuf_header>
8000519c:	0044a783          	lw	a5,4(s1)
800051a0:	000a8593          	mv	a1,s5
800051a4:	00090513          	mv	a0,s2
800051a8:	00178793          	addi	a5,a5,1
800051ac:	00f4a223          	sw	a5,4(s1)
800051b0:	010aa783          	lw	a5,16(s5)
800051b4:	000780e7          	jalr	a5
800051b8:	00050593          	mv	a1,a0
800051bc:	08050463          	beqz	a0,80005244 <mac_rx_isr+0x284>
800051c0:	f0000737          	lui	a4,0xf0000
800051c4:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
800051c8:	970c0513          	addi	a0,s8,-1680 # 80002970 <_ram_heap_end+0xffff0970>
800051cc:	0027e793          	ori	a5,a5,2
800051d0:	00f72223          	sw	a5,4(a4)
800051d4:	490090ef          	jal	ra,8000e664 <iprintf>
800051d8:	06c0006f          	j	80005244 <mac_rx_isr+0x284>
800051dc:	08099063          	bnez	s3,8000525c <mac_rx_isr+0x29c>
800051e0:	06078863          	beqz	a5,80005250 <mac_rx_isr+0x290>
800051e4:	0007a783          	lw	a5,0(a5)
800051e8:	06079663          	bnez	a5,80005254 <mac_rx_isr+0x294>
800051ec:	f0000737          	lui	a4,0xf0000
800051f0:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
800051f4:	944c8513          	addi	a0,s9,-1724 # 80002944 <_ram_heap_end+0xffff0944>
800051f8:	0027e793          	ori	a5,a5,2
800051fc:	00f72223          	sw	a5,4(a4)
80005200:	464090ef          	jal	ra,8000e664 <iprintf>
80005204:	0184a783          	lw	a5,24(s1)
80005208:	f0070737          	lui	a4,0xf0070
8000520c:	00178793          	addi	a5,a5,1
80005210:	00f4ac23          	sw	a5,24(s1)
80005214:	00c4a783          	lw	a5,12(s1)
80005218:	00178793          	addi	a5,a5,1
8000521c:	00f4a623          	sw	a5,12(s1)
80005220:	00072783          	lw	a5,0(a4) # f0070000 <_ram_heap_end+0x7005e000>
80005224:	0207f793          	andi	a5,a5,32
80005228:	fe078ce3          	beqz	a5,80005220 <mac_rx_isr+0x260>
8000522c:	02072783          	lw	a5,32(a4)
80005230:	ffc40413          	addi	s0,s0,-4
80005234:	fe8046e3          	bgtz	s0,80005220 <mac_rx_isr+0x260>
80005238:	00200593          	li	a1,2
8000523c:	00090513          	mv	a0,s2
80005240:	5cd010ef          	jal	ra,8000700c <pbuf_header>
80005244:	00090513          	mv	a0,s2
80005248:	5ed010ef          	jal	ra,80007034 <pbuf_free>
8000524c:	dc5ff06f          	j	80005010 <mac_rx_isr+0x50>
80005250:	00090793          	mv	a5,s2
80005254:	00a7d983          	lhu	s3,10(a5)
80005258:	0047aa03          	lw	s4,4(a5)
8000525c:	00071a63          	bnez	a4,80005270 <mac_rx_isr+0x2b0>
80005260:	00062683          	lw	a3,0(a2) # f0070000 <_ram_heap_end+0x7005e000>
80005264:	0206f693          	andi	a3,a3,32
80005268:	fe068ce3          	beqz	a3,80005260 <mac_rx_isr+0x2a0>
8000526c:	02062b03          	lw	s6,32(a2)
80005270:	00170713          	addi	a4,a4,1
80005274:	016a0023          	sb	s6,0(s4)
80005278:	00377713          	andi	a4,a4,3
8000527c:	008b5b13          	srli	s6,s6,0x8
80005280:	fff40413          	addi	s0,s0,-1
80005284:	001a0a13          	addi	s4,s4,1
80005288:	fff98993          	addi	s3,s3,-1
8000528c:	efdff06f          	j	80005188 <mac_rx_isr+0x1c8>

80005290 <mac_poll>:
80005290:	ff010113          	addi	sp,sp,-16
80005294:	00812423          	sw	s0,8(sp)
80005298:	00112623          	sw	ra,12(sp)
8000529c:	00912223          	sw	s1,4(sp)
800052a0:	c49ff0ef          	jal	ra,80004ee8 <sys_now>
800052a4:	8ac1a683          	lw	a3,-1876(gp) # 8000312c <ts_etharp>
800052a8:	00050413          	mv	s0,a0
800052ac:	00a6f663          	bgeu	a3,a0,800052b8 <mac_poll+0x28>
800052b0:	8a41a683          	lw	a3,-1884(gp) # 80003124 <ts_ipreass>
800052b4:	02a6e063          	bltu	a3,a0,800052d4 <mac_poll+0x44>
800052b8:	8a81a223          	sw	s0,-1884(gp) # 80003124 <ts_ipreass>
800052bc:	8a81a623          	sw	s0,-1876(gp) # 8000312c <ts_etharp>
800052c0:	00c12083          	lw	ra,12(sp)
800052c4:	00812403          	lw	s0,8(sp)
800052c8:	00412483          	lw	s1,4(sp)
800052cc:	01010113          	addi	sp,sp,16
800052d0:	00008067          	ret
800052d4:	8a01a783          	lw	a5,-1888(gp) # 80003120 <ts_dhcp_fine>
800052d8:	1f300713          	li	a4,499
800052dc:	40f507b3          	sub	a5,a0,a5
800052e0:	00f77663          	bgeu	a4,a5,800052ec <mac_poll+0x5c>
800052e4:	5d4050ef          	jal	ra,8000a8b8 <dhcp_fine_tmr>
800052e8:	8a81a023          	sw	s0,-1888(gp) # 80003120 <ts_dhcp_fine>
800052ec:	89c1a703          	lw	a4,-1892(gp) # 8000311c <ts_dhcp_coarse>
800052f0:	0000f7b7          	lui	a5,0xf
800052f4:	a5f78793          	addi	a5,a5,-1441 # ea5f <_stack_size+0xe25f>
800052f8:	40e40733          	sub	a4,s0,a4
800052fc:	00e7f663          	bgeu	a5,a4,80005308 <mac_poll+0x78>
80005300:	2f4050ef          	jal	ra,8000a5f4 <dhcp_coarse_tmr>
80005304:	8881ae23          	sw	s0,-1892(gp) # 8000311c <ts_dhcp_coarse>
80005308:	f00607b7          	lui	a5,0xf0060
8000530c:	0087a783          	lw	a5,8(a5) # f0060008 <_ram_heap_end+0x7004e008>
80005310:	0047f793          	andi	a5,a5,4
80005314:	fa0786e3          	beqz	a5,800052c0 <mac_poll+0x30>
80005318:	80003537          	lui	a0,0x80003
8000531c:	9a050513          	addi	a0,a0,-1632 # 800029a0 <_ram_heap_end+0xffff09a0>
80005320:	344090ef          	jal	ra,8000e664 <iprintf>
80005324:	00812403          	lw	s0,8(sp)
80005328:	00c12083          	lw	ra,12(sp)
8000532c:	00412483          	lw	s1,4(sp)
80005330:	01010113          	addi	sp,sp,16
80005334:	c8dff06f          	j	80004fc0 <mac_rx_isr>

80005338 <mac_print_stats>:
80005338:	ff010113          	addi	sp,sp,-16
8000533c:	9b818513          	addi	a0,gp,-1608 # 80003238 <default_netif+0x4>
80005340:	00112623          	sw	ra,12(sp)
80005344:	70c070ef          	jal	ra,8000ca50 <ip4addr_ntoa>
80005348:	a0c18613          	addi	a2,gp,-1524 # 8000328c <lwip_stats>
8000534c:	01062883          	lw	a7,16(a2)
80005350:	01462803          	lw	a6,20(a2)
80005354:	00c62783          	lw	a5,12(a2)
80005358:	02862703          	lw	a4,40(a2)
8000535c:	00062683          	lw	a3,0(a2)
80005360:	00c12083          	lw	ra,12(sp)
80005364:	00462603          	lw	a2,4(a2)
80005368:	00050593          	mv	a1,a0
8000536c:	80003537          	lui	a0,0x80003
80005370:	9c050513          	addi	a0,a0,-1600 # 800029c0 <_ram_heap_end+0xffff09c0>
80005374:	01010113          	addi	sp,sp,16
80005378:	2ec0906f          	j	8000e664 <iprintf>

8000537c <hub_init>:
8000537c:	fe010113          	addi	sp,sp,-32
80005380:	00912a23          	sw	s1,20(sp)
80005384:	800034b7          	lui	s1,0x80003
80005388:	0144c783          	lbu	a5,20(s1) # 80003014 <_ram_heap_end+0xffff1014>
8000538c:	00112e23          	sw	ra,28(sp)
80005390:	00812c23          	sw	s0,24(sp)
80005394:	01212823          	sw	s2,16(sp)
80005398:	01312623          	sw	s3,12(sp)
8000539c:	01412423          	sw	s4,8(sp)
800053a0:	01512223          	sw	s5,4(sp)
800053a4:	01612023          	sw	s6,0(sp)
800053a8:	01448493          	addi	s1,s1,20
800053ac:	04f50063          	beq	a0,a5,800053ec <hub_init+0x70>
800053b0:	0054c703          	lbu	a4,5(s1)
800053b4:	fff00793          	li	a5,-1
800053b8:	00100a13          	li	s4,1
800053bc:	02e50a63          	beq	a0,a4,800053f0 <hub_init+0x74>
800053c0:	01c12083          	lw	ra,28(sp)
800053c4:	01812403          	lw	s0,24(sp)
800053c8:	01412483          	lw	s1,20(sp)
800053cc:	01012903          	lw	s2,16(sp)
800053d0:	00c12983          	lw	s3,12(sp)
800053d4:	00812a03          	lw	s4,8(sp)
800053d8:	00412a83          	lw	s5,4(sp)
800053dc:	00012b03          	lw	s6,0(sp)
800053e0:	00078513          	mv	a0,a5
800053e4:	02010113          	addi	sp,sp,32
800053e8:	00008067          	ret
800053ec:	00000a13          	li	s4,0
800053f0:	002a1993          	slli	s3,s4,0x2
800053f4:	014987b3          	add	a5,s3,s4
800053f8:	00f487b3          	add	a5,s1,a5
800053fc:	0017c403          	lbu	s0,1(a5)
80005400:	0027c903          	lbu	s2,2(a5)
80005404:	0037ca83          	lbu	s5,3(a5)
80005408:	00040513          	mv	a0,s0
8000540c:	00090593          	mv	a1,s2
80005410:	0047cb03          	lbu	s6,4(a5)
80005414:	769070ef          	jal	ra,8000d37c <__mulsi3>
80005418:	000a8593          	mv	a1,s5
8000541c:	761070ef          	jal	ra,8000d37c <__mulsi3>
80005420:	000b0593          	mv	a1,s6
80005424:	759070ef          	jal	ra,8000d37c <__mulsi3>
80005428:	40355513          	srai	a0,a0,0x3
8000542c:	8aa1ac23          	sw	a0,-1864(gp) # 80003138 <hub_frame_size>
80005430:	8a81aa23          	sw	s0,-1868(gp) # 80003134 <hub_frame_width>
80005434:	000a8593          	mv	a1,s5
80005438:	00090513          	mv	a0,s2
8000543c:	741070ef          	jal	ra,8000d37c <__mulsi3>
80005440:	8aa1a823          	sw	a0,-1872(gp) # 80003130 <hub_frame_height>
80005444:	f00547b7          	lui	a5,0xf0054
80005448:	0007a023          	sw	zero,0(a5) # f0054000 <_ram_heap_end+0x70042000>
8000544c:	000b0593          	mv	a1,s6
80005450:	00040513          	mv	a0,s0
80005454:	729070ef          	jal	ra,8000d37c <__mulsi3>
80005458:	000a8593          	mv	a1,s5
8000545c:	721070ef          	jal	ra,8000d37c <__mulsi3>
80005460:	00000693          	li	a3,0
80005464:	00000713          	li	a4,0
80005468:	f0050637          	lui	a2,0xf0050
8000546c:	000015b7          	lui	a1,0x1
80005470:	03274e63          	blt	a4,s2,800054ac <hub_init+0x130>
80005474:	014989b3          	add	s3,s3,s4
80005478:	013484b3          	add	s1,s1,s3
8000547c:	0004c783          	lbu	a5,0(s1)
80005480:	01041413          	slli	s0,s0,0x10
80005484:	01891913          	slli	s2,s2,0x18
80005488:	01246433          	or	s0,s0,s2
8000548c:	00f46433          	or	s0,s0,a5
80005490:	000107b7          	lui	a5,0x10
80005494:	f8078793          	addi	a5,a5,-128 # ff80 <_stack_size+0xf780>
80005498:	00f46433          	or	s0,s0,a5
8000549c:	f00547b7          	lui	a5,0xf0054
800054a0:	0087a023          	sw	s0,0(a5) # f0054000 <_ram_heap_end+0x70042000>
800054a4:	00000793          	li	a5,0
800054a8:	f19ff06f          	j	800053c0 <hub_init+0x44>
800054ac:	00b707b3          	add	a5,a4,a1
800054b0:	00279793          	slli	a5,a5,0x2
800054b4:	4036d813          	srai	a6,a3,0x3
800054b8:	00f607b3          	add	a5,a2,a5
800054bc:	0107a223          	sw	a6,4(a5)
800054c0:	00170713          	addi	a4,a4,1
800054c4:	00a686b3          	add	a3,a3,a0
800054c8:	fa9ff06f          	j	80005470 <hub_init+0xf4>

800054cc <hub_print_char>:
800054cc:	f9010113          	addi	sp,sp,-112
800054d0:	05812423          	sw	s8,72(sp)
800054d4:	00078c13          	mv	s8,a5
800054d8:	07812783          	lw	a5,120(sp)
800054dc:	06912223          	sw	s1,100(sp)
800054e0:	05312e23          	sw	s3,92(sp)
800054e4:	41f7d493          	srai	s1,a5,0x1f
800054e8:	0074f493          	andi	s1,s1,7
800054ec:	00f484b3          	add	s1,s1,a5
800054f0:	05412c23          	sw	s4,88(sp)
800054f4:	02a12023          	sw	a0,32(sp)
800054f8:	06112623          	sw	ra,108(sp)
800054fc:	06812423          	sw	s0,104(sp)
80005500:	07212023          	sw	s2,96(sp)
80005504:	05512a23          	sw	s5,84(sp)
80005508:	05612823          	sw	s6,80(sp)
8000550c:	05712623          	sw	s7,76(sp)
80005510:	05912223          	sw	s9,68(sp)
80005514:	05a12023          	sw	s10,64(sp)
80005518:	03b12e23          	sw	s11,60(sp)
8000551c:	02c12223          	sw	a2,36(sp)
80005520:	02e12423          	sw	a4,40(sp)
80005524:	03012623          	sw	a6,44(sp)
80005528:	0077f793          	andi	a5,a5,7
8000552c:	00058513          	mv	a0,a1
80005530:	00068993          	mv	s3,a3
80005534:	00088a13          	mv	s4,a7
80005538:	4034d493          	srai	s1,s1,0x3
8000553c:	00078463          	beqz	a5,80005544 <hub_print_char+0x78>
80005540:	00148493          	addi	s1,s1,1
80005544:	07412583          	lw	a1,116(sp)
80005548:	00000b93          	li	s7,0
8000554c:	631070ef          	jal	ra,8000d37c <__mulsi3>
80005550:	00048593          	mv	a1,s1
80005554:	629070ef          	jal	ra,8000d37c <__mulsi3>
80005558:	07012a83          	lw	s5,112(sp)
8000555c:	003c1793          	slli	a5,s8,0x3
80005560:	00098593          	mv	a1,s3
80005564:	00aa8ab3          	add	s5,s5,a0
80005568:	000c0513          	mv	a0,s8
8000556c:	00f12e23          	sw	a5,28(sp)
80005570:	60d070ef          	jal	ra,8000d37c <__mulsi3>
80005574:	00a12823          	sw	a0,16(sp)
80005578:	049bc063          	blt	s7,s1,800055b8 <hub_print_char+0xec>
8000557c:	06c12083          	lw	ra,108(sp)
80005580:	06812403          	lw	s0,104(sp)
80005584:	06412483          	lw	s1,100(sp)
80005588:	06012903          	lw	s2,96(sp)
8000558c:	05c12983          	lw	s3,92(sp)
80005590:	05812a03          	lw	s4,88(sp)
80005594:	05412a83          	lw	s5,84(sp)
80005598:	05012b03          	lw	s6,80(sp)
8000559c:	04c12b83          	lw	s7,76(sp)
800055a0:	04812c03          	lw	s8,72(sp)
800055a4:	04412c83          	lw	s9,68(sp)
800055a8:	04012d03          	lw	s10,64(sp)
800055ac:	03c12d83          	lw	s11,60(sp)
800055b0:	07010113          	addi	sp,sp,112
800055b4:	00008067          	ret
800055b8:	07812703          	lw	a4,120(sp)
800055bc:	003b9793          	slli	a5,s7,0x3
800055c0:	40f707b3          	sub	a5,a4,a5
800055c4:	00f12623          	sw	a5,12(sp)
800055c8:	00c12703          	lw	a4,12(sp)
800055cc:	00800793          	li	a5,8
800055d0:	00e7d463          	bge	a5,a4,800055d8 <hub_print_char+0x10c>
800055d4:	00f12623          	sw	a5,12(sp)
800055d8:	02412b03          	lw	s6,36(sp)
800055dc:	00000c93          	li	s9,0
800055e0:	07412783          	lw	a5,116(sp)
800055e4:	02fcc263          	blt	s9,a5,80005608 <hub_print_char+0x13c>
800055e8:	00fa8ab3          	add	s5,s5,a5
800055ec:	01c12703          	lw	a4,28(sp)
800055f0:	01012783          	lw	a5,16(sp)
800055f4:	001b8b93          	addi	s7,s7,1
800055f8:	00898993          	addi	s3,s3,8
800055fc:	00e787b3          	add	a5,a5,a4
80005600:	00f12823          	sw	a5,16(sp)
80005604:	f75ff06f          	j	80005578 <hub_print_char+0xac>
80005608:	020b4863          	bltz	s6,80005638 <hub_print_char+0x16c>
8000560c:	038b5663          	bge	s6,s8,80005638 <hub_print_char+0x16c>
80005610:	019a87b3          	add	a5,s5,s9
80005614:	0007c783          	lbu	a5,0(a5)
80005618:	00000d13          	li	s10,0
8000561c:	00f12c23          	sw	a5,24(sp)
80005620:	01012783          	lw	a5,16(sp)
80005624:	00fb0db3          	add	s11,s6,a5
80005628:	00100793          	li	a5,1
8000562c:	00f12423          	sw	a5,8(sp)
80005630:	00c12783          	lw	a5,12(sp)
80005634:	00fd4863          	blt	s10,a5,80005644 <hub_print_char+0x178>
80005638:	001b0b13          	addi	s6,s6,1
8000563c:	001c8c93          	addi	s9,s9,1
80005640:	fa1ff06f          	j	800055e0 <hub_print_char+0x114>
80005644:	013d07b3          	add	a5,s10,s3
80005648:	0407ca63          	bltz	a5,8000569c <hub_print_char+0x1d0>
8000564c:	02c12703          	lw	a4,44(sp)
80005650:	04e7d663          	bge	a5,a4,8000569c <hub_print_char+0x1d0>
80005654:	00c00793          	li	a5,12
80005658:	06fa0063          	beq	s4,a5,800056b8 <hub_print_char+0x1ec>
8000565c:	04b00793          	li	a5,75
80005660:	08fa0a63          	beq	s4,a5,800056f4 <hub_print_char+0x228>
80005664:	01412783          	lw	a5,20(sp)
80005668:	00279913          	slli	s2,a5,0x2
8000566c:	02012783          	lw	a5,32(sp)
80005670:	01278933          	add	s2,a5,s2
80005674:	00092503          	lw	a0,0(s2)
80005678:	6fc070ef          	jal	ra,8000cd74 <__bswapsi2>
8000567c:	01812783          	lw	a5,24(sp)
80005680:	00812703          	lw	a4,8(sp)
80005684:	00e7f7b3          	and	a5,a5,a4
80005688:	10078263          	beqz	a5,8000578c <hub_print_char+0x2c0>
8000568c:	00c00793          	li	a5,12
80005690:	0afa0663          	beq	s4,a5,8000573c <hub_print_char+0x270>
80005694:	04b00793          	li	a5,75
80005698:	0afa0a63          	beq	s4,a5,8000574c <hub_print_char+0x280>
8000569c:	00812783          	lw	a5,8(sp)
800056a0:	001d0d13          	addi	s10,s10,1
800056a4:	018d8db3          	add	s11,s11,s8
800056a8:	00179793          	slli	a5,a5,0x1
800056ac:	0ff7f793          	andi	a5,a5,255
800056b0:	00f12423          	sw	a5,8(sp)
800056b4:	f7dff06f          	j	80005630 <hub_print_char+0x164>
800056b8:	41fdd793          	srai	a5,s11,0x1f
800056bc:	01f7f793          	andi	a5,a5,31
800056c0:	01b787b3          	add	a5,a5,s11
800056c4:	4057d793          	srai	a5,a5,0x5
800056c8:	00f12a23          	sw	a5,20(sp)
800056cc:	800007b7          	lui	a5,0x80000
800056d0:	01f78793          	addi	a5,a5,31 # 8000001f <_ram_heap_end+0xfffee01f>
800056d4:	00fdf433          	and	s0,s11,a5
800056d8:	00045863          	bgez	s0,800056e8 <hub_print_char+0x21c>
800056dc:	fff40413          	addi	s0,s0,-1
800056e0:	fe046413          	ori	s0,s0,-32
800056e4:	00140413          	addi	s0,s0,1
800056e8:	800007b7          	lui	a5,0x80000
800056ec:	0087d433          	srl	s0,a5,s0
800056f0:	f75ff06f          	j	80005664 <hub_print_char+0x198>
800056f4:	41fdd793          	srai	a5,s11,0x1f
800056f8:	0037f793          	andi	a5,a5,3
800056fc:	01b787b3          	add	a5,a5,s11
80005700:	4027d793          	srai	a5,a5,0x2
80005704:	00f12a23          	sw	a5,20(sp)
80005708:	800007b7          	lui	a5,0x80000
8000570c:	00378793          	addi	a5,a5,3 # 80000003 <_ram_heap_end+0xfffee003>
80005710:	00fdf433          	and	s0,s11,a5
80005714:	00045863          	bgez	s0,80005724 <hub_print_char+0x258>
80005718:	fff40413          	addi	s0,s0,-1
8000571c:	ffc46413          	ori	s0,s0,-4
80005720:	00140413          	addi	s0,s0,1
80005724:	00300793          	li	a5,3
80005728:	40878433          	sub	s0,a5,s0
8000572c:	00341413          	slli	s0,s0,0x3
80005730:	0ff00793          	li	a5,255
80005734:	00879433          	sll	s0,a5,s0
80005738:	f2dff06f          	j	80005664 <hub_print_char+0x198>
8000573c:	00a46533          	or	a0,s0,a0
80005740:	634070ef          	jal	ra,8000cd74 <__bswapsi2>
80005744:	00a92023          	sw	a0,0(s2)
80005748:	f55ff06f          	j	8000569c <hub_print_char+0x1d0>
8000574c:	fff44793          	not	a5,s0
80005750:	00a7f533          	and	a0,a5,a0
80005754:	800007b7          	lui	a5,0x80000
80005758:	00378793          	addi	a5,a5,3 # 80000003 <_ram_heap_end+0xfffee003>
8000575c:	00fdf7b3          	and	a5,s11,a5
80005760:	0007d863          	bgez	a5,80005770 <hub_print_char+0x2a4>
80005764:	fff78793          	addi	a5,a5,-1
80005768:	ffc7e793          	ori	a5,a5,-4
8000576c:	00178793          	addi	a5,a5,1
80005770:	00300713          	li	a4,3
80005774:	40f707b3          	sub	a5,a4,a5
80005778:	02812703          	lw	a4,40(sp)
8000577c:	00379793          	slli	a5,a5,0x3
80005780:	00f717b3          	sll	a5,a4,a5
80005784:	00a7e533          	or	a0,a5,a0
80005788:	fb9ff06f          	j	80005740 <hub_print_char+0x274>
8000578c:	00c00793          	li	a5,12
80005790:	00fa0663          	beq	s4,a5,8000579c <hub_print_char+0x2d0>
80005794:	04b00793          	li	a5,75
80005798:	f0fa12e3          	bne	s4,a5,8000569c <hub_print_char+0x1d0>
8000579c:	fff44793          	not	a5,s0
800057a0:	00a7f533          	and	a0,a5,a0
800057a4:	f9dff06f          	j	80005740 <hub_print_char+0x274>

800057a8 <hub_print>:
800057a8:	fb010113          	addi	sp,sp,-80
800057ac:	04812423          	sw	s0,72(sp)
800057b0:	04912223          	sw	s1,68(sp)
800057b4:	05212023          	sw	s2,64(sp)
800057b8:	03312e23          	sw	s3,60(sp)
800057bc:	03412c23          	sw	s4,56(sp)
800057c0:	03512a23          	sw	s5,52(sp)
800057c4:	03612823          	sw	s6,48(sp)
800057c8:	03712623          	sw	s7,44(sp)
800057cc:	03812423          	sw	s8,40(sp)
800057d0:	03912223          	sw	s9,36(sp)
800057d4:	03a12023          	sw	s10,32(sp)
800057d8:	01b12e23          	sw	s11,28(sp)
800057dc:	04112623          	sw	ra,76(sp)
800057e0:	00058a13          	mv	s4,a1
800057e4:	00068a93          	mv	s5,a3
800057e8:	00070993          	mv	s3,a4
800057ec:	00078b13          	mv	s6,a5
800057f0:	00080913          	mv	s2,a6
800057f4:	00088b93          	mv	s7,a7
800057f8:	00050493          	mv	s1,a0
800057fc:	00000413          	li	s0,0
80005800:	f0054c37          	lui	s8,0xf0054
80005804:	0ff67d93          	andi	s11,a2,255
80005808:	05344063          	blt	s0,s3,80005848 <hub_print+0xa0>
8000580c:	04c12083          	lw	ra,76(sp)
80005810:	04812403          	lw	s0,72(sp)
80005814:	04412483          	lw	s1,68(sp)
80005818:	04012903          	lw	s2,64(sp)
8000581c:	03c12983          	lw	s3,60(sp)
80005820:	03812a03          	lw	s4,56(sp)
80005824:	03412a83          	lw	s5,52(sp)
80005828:	03012b03          	lw	s6,48(sp)
8000582c:	02c12b83          	lw	s7,44(sp)
80005830:	02812c03          	lw	s8,40(sp)
80005834:	02412c83          	lw	s9,36(sp)
80005838:	02012d03          	lw	s10,32(sp)
8000583c:	01c12d83          	lw	s11,28(sp)
80005840:	05010113          	addi	sp,sp,80
80005844:	00008067          	ret
80005848:	000c2883          	lw	a7,0(s8) # f0054000 <_ram_heap_end+0x70042000>
8000584c:	008a85b3          	add	a1,s5,s0
80005850:	01712423          	sw	s7,8(sp)
80005854:	01212223          	sw	s2,4(sp)
80005858:	01612023          	sw	s6,0(sp)
8000585c:	8b01a803          	lw	a6,-1872(gp) # 80003130 <hub_frame_height>
80005860:	8b41a783          	lw	a5,-1868(gp) # 80003134 <hub_frame_width>
80005864:	0005c583          	lbu	a1,0(a1) # 1000 <_stack_size+0x800>
80005868:	00048613          	mv	a2,s1
8000586c:	07f8f893          	andi	a7,a7,127
80005870:	000d8713          	mv	a4,s11
80005874:	000a0693          	mv	a3,s4
80005878:	f0050537          	lui	a0,0xf0050
8000587c:	c51ff0ef          	jal	ra,800054cc <hub_print_char>
80005880:	00140413          	addi	s0,s0,1
80005884:	012484b3          	add	s1,s1,s2
80005888:	f81ff06f          	j	80005808 <hub_print+0x60>

8000588c <modbus_udp_init>:
8000588c:	ff010113          	addi	sp,sp,-16
80005890:	02e00513          	li	a0,46
80005894:	00912223          	sw	s1,4(sp)
80005898:	00112623          	sw	ra,12(sp)
8000589c:	00812423          	sw	s0,8(sp)
800058a0:	3e0030ef          	jal	ra,80008c80 <udp_new_ip_type>
800058a4:	8aa1ae23          	sw	a0,-1860(gp) # 8000313c <modbus_udp_pcb>
800058a8:	02051663          	bnez	a0,800058d4 <modbus_udp_init+0x48>
800058ac:	80003537          	lui	a0,0x80003
800058b0:	a1c50513          	addi	a0,a0,-1508 # 80002a1c <_ram_heap_end+0xffff0a1c>
800058b4:	5b1080ef          	jal	ra,8000e664 <iprintf>
800058b8:	fff00413          	li	s0,-1
800058bc:	00040513          	mv	a0,s0
800058c0:	00c12083          	lw	ra,12(sp)
800058c4:	00812403          	lw	s0,8(sp)
800058c8:	00412483          	lw	s1,4(sp)
800058cc:	01010113          	addi	sp,sp,16
800058d0:	00008067          	ret
800058d4:	7d100613          	li	a2,2001
800058d8:	84818593          	addi	a1,gp,-1976 # 800030c8 <ip_addr_any>
800058dc:	615020ef          	jal	ra,800086f0 <udp_bind>
800058e0:	00050413          	mv	s0,a0
800058e4:	00050e63          	beqz	a0,80005900 <modbus_udp_init+0x74>
800058e8:	80003537          	lui	a0,0x80003
800058ec:	a4c50513          	addi	a0,a0,-1460 # 80002a4c <_ram_heap_end+0xffff0a4c>
800058f0:	575080ef          	jal	ra,8000e664 <iprintf>
800058f4:	8bc1a503          	lw	a0,-1860(gp) # 8000313c <modbus_udp_pcb>
800058f8:	2f4030ef          	jal	ra,80008bec <udp_remove>
800058fc:	fc1ff06f          	j	800058bc <modbus_udp_init+0x30>
80005900:	8bc1a503          	lw	a0,-1860(gp) # 8000313c <modbus_udp_pcb>
80005904:	800065b7          	lui	a1,0x80006
80005908:	00000613          	li	a2,0
8000590c:	aa858593          	addi	a1,a1,-1368 # 80005aa8 <_ram_heap_end+0xffff3aa8>
80005910:	2cc030ef          	jal	ra,80008bdc <udp_recv>
80005914:	80003537          	lui	a0,0x80003
80005918:	a7850513          	addi	a0,a0,-1416 # 80002a78 <_ram_heap_end+0xffff0a78>
8000591c:	549080ef          	jal	ra,8000e664 <iprintf>
80005920:	f9dff06f          	j	800058bc <modbus_udp_init+0x30>

80005924 <modbus_udp_send>:
80005924:	fd010113          	addi	sp,sp,-48
80005928:	01412c23          	sw	s4,24(sp)
8000592c:	00168a13          	addi	s4,a3,1
80005930:	03212023          	sw	s2,32(sp)
80005934:	00058913          	mv	s2,a1
80005938:	010a1593          	slli	a1,s4,0x10
8000593c:	01312e23          	sw	s3,28(sp)
80005940:	01512a23          	sw	s5,20(sp)
80005944:	00050993          	mv	s3,a0
80005948:	00060a93          	mv	s5,a2
8000594c:	0105d593          	srli	a1,a1,0x10
80005950:	28000613          	li	a2,640
80005954:	03800513          	li	a0,56
80005958:	02912223          	sw	s1,36(sp)
8000595c:	02112623          	sw	ra,44(sp)
80005960:	02812423          	sw	s0,40(sp)
80005964:	00068493          	mv	s1,a3
80005968:	7a0010ef          	jal	ra,80007108 <pbuf_alloc>
8000596c:	04051063          	bnez	a0,800059ac <modbus_udp_send+0x88>
80005970:	f0000737          	lui	a4,0xf0000
80005974:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
80005978:	80003537          	lui	a0,0x80003
8000597c:	a9450513          	addi	a0,a0,-1388 # 80002a94 <_ram_heap_end+0xffff0a94>
80005980:	ffd7f793          	andi	a5,a5,-3
80005984:	00f72223          	sw	a5,4(a4)
80005988:	02812403          	lw	s0,40(sp)
8000598c:	02c12083          	lw	ra,44(sp)
80005990:	02412483          	lw	s1,36(sp)
80005994:	02012903          	lw	s2,32(sp)
80005998:	01c12983          	lw	s3,28(sp)
8000599c:	01812a03          	lw	s4,24(sp)
800059a0:	01412a83          	lw	s5,20(sp)
800059a4:	03010113          	addi	sp,sp,48
800059a8:	4bd0806f          	j	8000e664 <iprintf>
800059ac:	00452783          	lw	a5,4(a0)
800059b0:	00050413          	mv	s0,a0
800059b4:	00078663          	beqz	a5,800059c0 <modbus_udp_send+0x9c>
800059b8:	00a55703          	lhu	a4,10(a0)
800059bc:	05477463          	bgeu	a4,s4,80005a04 <modbus_udp_send+0xe0>
800059c0:	f0000737          	lui	a4,0xf0000
800059c4:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
800059c8:	80003537          	lui	a0,0x80003
800059cc:	ac450513          	addi	a0,a0,-1340 # 80002ac4 <_ram_heap_end+0xffff0ac4>
800059d0:	ffd7f793          	andi	a5,a5,-3
800059d4:	00f72223          	sw	a5,4(a4)
800059d8:	00a45603          	lhu	a2,10(s0)
800059dc:	00442583          	lw	a1,4(s0)
800059e0:	02812403          	lw	s0,40(sp)
800059e4:	02c12083          	lw	ra,44(sp)
800059e8:	02412483          	lw	s1,36(sp)
800059ec:	02012903          	lw	s2,32(sp)
800059f0:	01c12983          	lw	s3,28(sp)
800059f4:	01812a03          	lw	s4,24(sp)
800059f8:	01412a83          	lw	s5,20(sp)
800059fc:	03010113          	addi	sp,sp,48
80005a00:	4650806f          	j	8000e664 <iprintf>
80005a04:	00048613          	mv	a2,s1
80005a08:	000a8593          	mv	a1,s5
80005a0c:	00078513          	mv	a0,a5
80005a10:	015080ef          	jal	ra,8000e224 <memcpy>
80005a14:	009507b3          	add	a5,a0,s1
80005a18:	00078023          	sb	zero,0(a5)
80005a1c:	8bc1a503          	lw	a0,-1860(gp) # 8000313c <modbus_udp_pcb>
80005a20:	00040593          	mv	a1,s0
80005a24:	00090693          	mv	a3,s2
80005a28:	00098613          	mv	a2,s3
80005a2c:	7f5020ef          	jal	ra,80008a20 <udp_sendto>
80005a30:	00050593          	mv	a1,a0
80005a34:	04050463          	beqz	a0,80005a7c <modbus_udp_send+0x158>
80005a38:	f0000737          	lui	a4,0xf0000
80005a3c:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
80005a40:	80003537          	lui	a0,0x80003
80005a44:	afc50513          	addi	a0,a0,-1284 # 80002afc <_ram_heap_end+0xffff0afc>
80005a48:	ffd7f793          	andi	a5,a5,-3
80005a4c:	00f72223          	sw	a5,4(a4)
80005a50:	415080ef          	jal	ra,8000e664 <iprintf>
80005a54:	00040513          	mv	a0,s0
80005a58:	02812403          	lw	s0,40(sp)
80005a5c:	02c12083          	lw	ra,44(sp)
80005a60:	02412483          	lw	s1,36(sp)
80005a64:	02012903          	lw	s2,32(sp)
80005a68:	01c12983          	lw	s3,28(sp)
80005a6c:	01812a03          	lw	s4,24(sp)
80005a70:	01412a83          	lw	s5,20(sp)
80005a74:	03010113          	addi	sp,sp,48
80005a78:	5bc0106f          	j	80007034 <pbuf_free>
80005a7c:	00a45583          	lhu	a1,10(s0)
80005a80:	00098513          	mv	a0,s3
80005a84:	00b12623          	sw	a1,12(sp)
80005a88:	7c9060ef          	jal	ra,8000ca50 <ip4addr_ntoa>
80005a8c:	00c12583          	lw	a1,12(sp)
80005a90:	00050613          	mv	a2,a0
80005a94:	80003537          	lui	a0,0x80003
80005a98:	00090693          	mv	a3,s2
80005a9c:	b3450513          	addi	a0,a0,-1228 # 80002b34 <_ram_heap_end+0xffff0b34>
80005aa0:	3c5080ef          	jal	ra,8000e664 <iprintf>
80005aa4:	fb1ff06f          	j	80005a54 <modbus_udp_send+0x130>

80005aa8 <modbus_udp_recv>:
80005aa8:	f6010113          	addi	sp,sp,-160
80005aac:	08112e23          	sw	ra,156(sp)
80005ab0:	08912a23          	sw	s1,148(sp)
80005ab4:	09212823          	sw	s2,144(sp)
80005ab8:	09312623          	sw	s3,140(sp)
80005abc:	08812c23          	sw	s0,152(sp)
80005ac0:	09412423          	sw	s4,136(sp)
80005ac4:	00a65403          	lhu	s0,10(a2) # f005000a <_ram_heap_end+0x7003e00a>
80005ac8:	00068513          	mv	a0,a3
80005acc:	00070993          	mv	s3,a4
80005ad0:	00060493          	mv	s1,a2
80005ad4:	00462a03          	lw	s4,4(a2)
80005ad8:	00068913          	mv	s2,a3
80005adc:	775060ef          	jal	ra,8000ca50 <ip4addr_ntoa>
80005ae0:	00050593          	mv	a1,a0
80005ae4:	80003537          	lui	a0,0x80003
80005ae8:	00040693          	mv	a3,s0
80005aec:	00098613          	mv	a2,s3
80005af0:	b6050513          	addi	a0,a0,-1184 # 80002b60 <_ram_heap_end+0xffff0b60>
80005af4:	371080ef          	jal	ra,8000e664 <iprintf>
80005af8:	00040593          	mv	a1,s0
80005afc:	00010613          	mv	a2,sp
80005b00:	000a0513          	mv	a0,s4
80005b04:	d8dfe0ef          	jal	ra,80004890 <modbus_recv>
80005b08:	00050413          	mv	s0,a0
80005b0c:	00048513          	mv	a0,s1
80005b10:	524010ef          	jal	ra,80007034 <pbuf_free>
80005b14:	02040463          	beqz	s0,80005b3c <modbus_udp_recv+0x94>
80005b18:	80003537          	lui	a0,0x80003
80005b1c:	00040593          	mv	a1,s0
80005b20:	b8c50513          	addi	a0,a0,-1140 # 80002b8c <_ram_heap_end+0xffff0b8c>
80005b24:	341080ef          	jal	ra,8000e664 <iprintf>
80005b28:	00040693          	mv	a3,s0
80005b2c:	00010613          	mv	a2,sp
80005b30:	00098593          	mv	a1,s3
80005b34:	00090513          	mv	a0,s2
80005b38:	dedff0ef          	jal	ra,80005924 <modbus_udp_send>
80005b3c:	09c12083          	lw	ra,156(sp)
80005b40:	09812403          	lw	s0,152(sp)
80005b44:	09412483          	lw	s1,148(sp)
80005b48:	09012903          	lw	s2,144(sp)
80005b4c:	08c12983          	lw	s3,140(sp)
80005b50:	08812a03          	lw	s4,136(sp)
80005b54:	0a010113          	addi	sp,sp,160
80005b58:	00008067          	ret

80005b5c <i2c_init>:
80005b5c:	0fa00793          	li	a5,250
80005b60:	00f52423          	sw	a5,8(a0)
80005b64:	00008067          	ret

80005b68 <i2c_wait_for_busy>:
80005b68:	00000793          	li	a5,0
80005b6c:	00b7c663          	blt	a5,a1,80005b78 <i2c_wait_for_busy+0x10>
80005b70:	00000513          	li	a0,0
80005b74:	00008067          	ret
80005b78:	00c52703          	lw	a4,12(a0)
80005b7c:	00277713          	andi	a4,a4,2
80005b80:	00071663          	bnez	a4,80005b8c <i2c_wait_for_busy+0x24>
80005b84:	00178793          	addi	a5,a5,1
80005b88:	fe5ff06f          	j	80005b6c <i2c_wait_for_busy+0x4>
80005b8c:	00100513          	li	a0,1
80005b90:	00008067          	ret

80005b94 <i2c_wait_for_release>:
80005b94:	00000793          	li	a5,0
80005b98:	00b7c663          	blt	a5,a1,80005ba4 <i2c_wait_for_release+0x10>
80005b9c:	00000513          	li	a0,0
80005ba0:	00008067          	ret
80005ba4:	00c52703          	lw	a4,12(a0)
80005ba8:	00277713          	andi	a4,a4,2
80005bac:	00070663          	beqz	a4,80005bb8 <i2c_wait_for_release+0x24>
80005bb0:	00178793          	addi	a5,a5,1
80005bb4:	fe5ff06f          	j	80005b98 <i2c_wait_for_release+0x4>
80005bb8:	00100513          	li	a0,1
80005bbc:	00008067          	ret

80005bc0 <__malloc_lock>:
80005bc0:	00008067          	ret

80005bc4 <__malloc_unlock>:
80005bc4:	00008067          	ret

80005bc8 <init_sbrk>:
80005bc8:	02051463          	bnez	a0,80005bf0 <init_sbrk+0x28>
80005bcc:	80011737          	lui	a4,0x80011
80005bd0:	4b070713          	addi	a4,a4,1200 # 800114b0 <_ram_heap_end+0xfffff4b0>
80005bd4:	8ce1a223          	sw	a4,-1852(gp) # 80003144 <heap_start>
80005bd8:	80012737          	lui	a4,0x80012
80005bdc:	00070713          	mv	a4,a4
80005be0:	8ce1a023          	sw	a4,-1856(gp) # 80003140 <heap_end>
80005be4:	8c41a703          	lw	a4,-1852(gp) # 80003144 <heap_start>
80005be8:	8ce1a423          	sw	a4,-1848(gp) # 80003148 <sbrk_heap_end>
80005bec:	00008067          	ret
80005bf0:	00259593          	slli	a1,a1,0x2
80005bf4:	8ca1a223          	sw	a0,-1852(gp) # 80003144 <heap_start>
80005bf8:	00b50533          	add	a0,a0,a1
80005bfc:	8ca1a023          	sw	a0,-1856(gp) # 80003140 <heap_end>
80005c00:	fe5ff06f          	j	80005be4 <init_sbrk+0x1c>

80005c04 <delay>:
80005c04:	00000793          	li	a5,0
80005c08:	00a79463          	bne	a5,a0,80005c10 <delay+0xc>
80005c0c:	00008067          	ret
80005c10:	00060613          	mv	a2,a2
80005c14:	00178793          	addi	a5,a5,1
80005c18:	ff1ff06f          	j	80005c08 <delay+0x4>

80005c1c <delay_us>:
80005c1c:	f00b07b7          	lui	a5,0xf00b0
80005c20:	0007a803          	lw	a6,0(a5) # f00b0000 <_ram_heap_end+0x7009e000>
80005c24:	0047a883          	lw	a7,4(a5)
80005c28:	f00b0637          	lui	a2,0xf00b0
80005c2c:	00062303          	lw	t1,0(a2) # f00b0000 <_ram_heap_end+0x7009e000>
80005c30:	00462383          	lw	t2,4(a2)
80005c34:	410306b3          	sub	a3,t1,a6
80005c38:	00d33733          	sltu	a4,t1,a3
80005c3c:	411387b3          	sub	a5,t2,a7
80005c40:	00e79463          	bne	a5,a4,80005c48 <delay_us+0x2c>
80005c44:	fea6e4e3          	bltu	a3,a0,80005c2c <delay_us+0x10>
80005c48:	00008067          	ret

80005c4c <print_uart0>:
80005c4c:	f00106b7          	lui	a3,0xf0010
80005c50:	00054703          	lbu	a4,0(a0)
80005c54:	00071463          	bnez	a4,80005c5c <print_uart0+0x10>
80005c58:	00008067          	ret
80005c5c:	0046a783          	lw	a5,4(a3) # f0010004 <_ram_heap_end+0x6fffe004>
80005c60:	0107d793          	srli	a5,a5,0x10
80005c64:	0ff7f793          	andi	a5,a5,255
80005c68:	fe078ae3          	beqz	a5,80005c5c <print_uart0+0x10>
80005c6c:	00e6a023          	sw	a4,0(a3)
80005c70:	00150513          	addi	a0,a0,1
80005c74:	fddff06f          	j	80005c50 <print_uart0+0x4>

80005c78 <_sbrk>:
80005c78:	8c81a783          	lw	a5,-1848(gp) # 80003148 <sbrk_heap_end>
80005c7c:	02079063          	bnez	a5,80005c9c <_sbrk+0x24>
80005c80:	800117b7          	lui	a5,0x80011
80005c84:	4b078793          	addi	a5,a5,1200 # 800114b0 <_ram_heap_end+0xfffff4b0>
80005c88:	8cf1a223          	sw	a5,-1852(gp) # 80003144 <heap_start>
80005c8c:	80012737          	lui	a4,0x80012
80005c90:	00070713          	mv	a4,a4
80005c94:	8ce1a023          	sw	a4,-1856(gp) # 80003140 <heap_end>
80005c98:	8cf1a423          	sw	a5,-1848(gp) # 80003148 <sbrk_heap_end>
80005c9c:	8c81a683          	lw	a3,-1848(gp) # 80003148 <sbrk_heap_end>
80005ca0:	8c01a703          	lw	a4,-1856(gp) # 80003140 <heap_end>
80005ca4:	00a687b3          	add	a5,a3,a0
80005ca8:	04e7e063          	bltu	a5,a4,80005ce8 <_sbrk+0x70>
80005cac:	f7010113          	addi	sp,sp,-144
80005cb0:	80003637          	lui	a2,0x80003
80005cb4:	00050793          	mv	a5,a0
80005cb8:	bbc60613          	addi	a2,a2,-1092 # 80002bbc <_ram_heap_end+0xffff0bbc>
80005cbc:	08000593          	li	a1,128
80005cc0:	00010513          	mv	a0,sp
80005cc4:	08112623          	sw	ra,140(sp)
80005cc8:	46d080ef          	jal	ra,8000e934 <sniprintf>
80005ccc:	00010513          	mv	a0,sp
80005cd0:	f7dff0ef          	jal	ra,80005c4c <print_uart0>
80005cd4:	08c12083          	lw	ra,140(sp)
80005cd8:	fff00693          	li	a3,-1
80005cdc:	00068513          	mv	a0,a3
80005ce0:	09010113          	addi	sp,sp,144
80005ce4:	00008067          	ret
80005ce8:	8cf1a423          	sw	a5,-1848(gp) # 80003148 <sbrk_heap_end>
80005cec:	00068513          	mv	a0,a3
80005cf0:	00008067          	ret

80005cf4 <print_uart1>:
80005cf4:	f00116b7          	lui	a3,0xf0011
80005cf8:	00054703          	lbu	a4,0(a0)
80005cfc:	00071463          	bnez	a4,80005d04 <print_uart1+0x10>
80005d00:	00008067          	ret
80005d04:	0046a783          	lw	a5,4(a3) # f0011004 <_ram_heap_end+0x6ffff004>
80005d08:	0107d793          	srli	a5,a5,0x10
80005d0c:	0ff7f793          	andi	a5,a5,255
80005d10:	fe078ae3          	beqz	a5,80005d04 <print_uart1+0x10>
80005d14:	00e6a023          	sw	a4,0(a3)
80005d18:	00150513          	addi	a0,a0,1
80005d1c:	fddff06f          	j	80005cf8 <print_uart1+0x4>

80005d20 <_write>:
80005d20:	00c586b3          	add	a3,a1,a2
80005d24:	f0010737          	lui	a4,0xf0010
80005d28:	00d59663          	bne	a1,a3,80005d34 <_write+0x14>
80005d2c:	00060513          	mv	a0,a2
80005d30:	00008067          	ret
80005d34:	00158593          	addi	a1,a1,1
80005d38:	fff5c503          	lbu	a0,-1(a1)
80005d3c:	00472783          	lw	a5,4(a4) # f0010004 <_ram_heap_end+0x6fffe004>
80005d40:	0107d793          	srli	a5,a5,0x10
80005d44:	0ff7f793          	andi	a5,a5,255
80005d48:	fe078ae3          	beqz	a5,80005d3c <_write+0x1c>
80005d4c:	00a72023          	sw	a0,0(a4)
80005d50:	fd9ff06f          	j	80005d28 <_write+0x8>

80005d54 <_read>:
80005d54:	00100513          	li	a0,1
80005d58:	00008067          	ret

80005d5c <_close>:
80005d5c:	fff00513          	li	a0,-1
80005d60:	00008067          	ret

80005d64 <_lseek>:
80005d64:	00000513          	li	a0,0
80005d68:	00008067          	ret

80005d6c <_isatty>:
80005d6c:	00100513          	li	a0,1
80005d70:	00008067          	ret

80005d74 <_fstat>:
80005d74:	000027b7          	lui	a5,0x2
80005d78:	00f5a223          	sw	a5,4(a1)
80005d7c:	00000513          	li	a0,0
80005d80:	00008067          	ret

80005d84 <_kill>:
80005d84:	00008067          	ret

80005d88 <_getpid>:
80005d88:	fff00513          	li	a0,-1
80005d8c:	00008067          	ret

80005d90 <hard_reboot>:
80005d90:	80003537          	lui	a0,0x80003
80005d94:	ff010113          	addi	sp,sp,-16
80005d98:	c0050513          	addi	a0,a0,-1024 # 80002c00 <_ram_heap_end+0xffff0c00>
80005d9c:	00112623          	sw	ra,12(sp)
80005da0:	eadff0ef          	jal	ra,80005c4c <print_uart0>
80005da4:	3e800513          	li	a0,1000
80005da8:	e75ff0ef          	jal	ra,80005c1c <delay_us>
80005dac:	f00a07b7          	lui	a5,0xf00a0
80005db0:	00100713          	li	a4,1
80005db4:	00e7a423          	sw	a4,8(a5) # f00a0008 <_ram_heap_end+0x7008e008>
80005db8:	00c12083          	lw	ra,12(sp)
80005dbc:	01010113          	addi	sp,sp,16
80005dc0:	00008067          	ret

80005dc4 <memcpy_rev>:
80005dc4:	00000793          	li	a5,0
80005dc8:	00f61463          	bne	a2,a5,80005dd0 <memcpy_rev+0xc>
80005dcc:	00008067          	ret
80005dd0:	40f58733          	sub	a4,a1,a5
80005dd4:	00074683          	lbu	a3,0(a4)
80005dd8:	00f50733          	add	a4,a0,a5
80005ddc:	00178793          	addi	a5,a5,1
80005de0:	00d70023          	sb	a3,0(a4)
80005de4:	fe5ff06f          	j	80005dc8 <memcpy_rev+0x4>

80005de8 <lwip_init>:
80005de8:	ff010113          	addi	sp,sp,-16
80005dec:	00112623          	sw	ra,12(sp)
80005df0:	340020ef          	jal	ra,80008130 <stats_init>
80005df4:	015000ef          	jal	ra,80006608 <mem_init>
80005df8:	141000ef          	jal	ra,80006738 <memp_init>
80005dfc:	27d000ef          	jal	ra,80006878 <netif_init>
80005e00:	618020ef          	jal	ra,80008418 <udp_init>
80005e04:	00c12083          	lw	ra,12(sp)
80005e08:	01010113          	addi	sp,sp,16
80005e0c:	4500206f          	j	8000825c <sys_timeouts_init>

80005e10 <lwip_htons>:
80005e10:	00851793          	slli	a5,a0,0x8
80005e14:	00855513          	srli	a0,a0,0x8
80005e18:	00a7e533          	or	a0,a5,a0
80005e1c:	01051513          	slli	a0,a0,0x10
80005e20:	01055513          	srli	a0,a0,0x10
80005e24:	00008067          	ret

80005e28 <lwip_htonl>:
80005e28:	01855713          	srli	a4,a0,0x18
80005e2c:	01851793          	slli	a5,a0,0x18
80005e30:	00e7e7b3          	or	a5,a5,a4
80005e34:	00ff06b7          	lui	a3,0xff0
80005e38:	00851713          	slli	a4,a0,0x8
80005e3c:	00d77733          	and	a4,a4,a3
80005e40:	00e7e7b3          	or	a5,a5,a4
80005e44:	00010737          	lui	a4,0x10
80005e48:	f0070713          	addi	a4,a4,-256 # ff00 <_stack_size+0xf700>
80005e4c:	00855513          	srli	a0,a0,0x8
80005e50:	00e57533          	and	a0,a0,a4
80005e54:	00a7e533          	or	a0,a5,a0
80005e58:	00008067          	ret

80005e5c <lwip_strnstr>:
80005e5c:	fe010113          	addi	sp,sp,-32
80005e60:	00812c23          	sw	s0,24(sp)
80005e64:	00050413          	mv	s0,a0
80005e68:	00058513          	mv	a0,a1
80005e6c:	00912a23          	sw	s1,20(sp)
80005e70:	01312623          	sw	s3,12(sp)
80005e74:	00112e23          	sw	ra,28(sp)
80005e78:	01212823          	sw	s2,16(sp)
80005e7c:	00058993          	mv	s3,a1
80005e80:	00060493          	mv	s1,a2
80005e84:	57d080ef          	jal	ra,8000ec00 <strlen>
80005e88:	02050063          	beqz	a0,80005ea8 <lwip_strnstr+0x4c>
80005e8c:	00050913          	mv	s2,a0
80005e90:	009404b3          	add	s1,s0,s1
80005e94:	00044783          	lbu	a5,0(s0)
80005e98:	00078663          	beqz	a5,80005ea4 <lwip_strnstr+0x48>
80005e9c:	01240733          	add	a4,s0,s2
80005ea0:	02e4f463          	bgeu	s1,a4,80005ec8 <lwip_strnstr+0x6c>
80005ea4:	00000413          	li	s0,0
80005ea8:	00040513          	mv	a0,s0
80005eac:	01c12083          	lw	ra,28(sp)
80005eb0:	01812403          	lw	s0,24(sp)
80005eb4:	01412483          	lw	s1,20(sp)
80005eb8:	01012903          	lw	s2,16(sp)
80005ebc:	00c12983          	lw	s3,12(sp)
80005ec0:	02010113          	addi	sp,sp,32
80005ec4:	00008067          	ret
80005ec8:	0009c703          	lbu	a4,0(s3)
80005ecc:	00f71c63          	bne	a4,a5,80005ee4 <lwip_strnstr+0x88>
80005ed0:	00090613          	mv	a2,s2
80005ed4:	00098593          	mv	a1,s3
80005ed8:	00040513          	mv	a0,s0
80005edc:	541080ef          	jal	ra,8000ec1c <strncmp>
80005ee0:	fc0504e3          	beqz	a0,80005ea8 <lwip_strnstr+0x4c>
80005ee4:	00140413          	addi	s0,s0,1
80005ee8:	fadff06f          	j	80005e94 <lwip_strnstr+0x38>

80005eec <lwip_stricmp>:
80005eec:	01900813          	li	a6,25
80005ef0:	00150513          	addi	a0,a0,1
80005ef4:	00158593          	addi	a1,a1,1
80005ef8:	fff54703          	lbu	a4,-1(a0)
80005efc:	fff5c783          	lbu	a5,-1(a1)
80005f00:	00f70e63          	beq	a4,a5,80005f1c <lwip_stricmp+0x30>
80005f04:	02076613          	ori	a2,a4,32
80005f08:	f9f60693          	addi	a3,a2,-97
80005f0c:	0ff6f693          	andi	a3,a3,255
80005f10:	00d86c63          	bltu	a6,a3,80005f28 <lwip_stricmp+0x3c>
80005f14:	0207e793          	ori	a5,a5,32
80005f18:	00f61863          	bne	a2,a5,80005f28 <lwip_stricmp+0x3c>
80005f1c:	fc071ae3          	bnez	a4,80005ef0 <lwip_stricmp+0x4>
80005f20:	00000513          	li	a0,0
80005f24:	00008067          	ret
80005f28:	00100513          	li	a0,1
80005f2c:	00008067          	ret

80005f30 <lwip_strnicmp>:
80005f30:	fff60613          	addi	a2,a2,-1
80005f34:	00000793          	li	a5,0
80005f38:	01900313          	li	t1,25
80005f3c:	00f50733          	add	a4,a0,a5
80005f40:	00074683          	lbu	a3,0(a4)
80005f44:	00f58733          	add	a4,a1,a5
80005f48:	00074703          	lbu	a4,0(a4)
80005f4c:	00e68e63          	beq	a3,a4,80005f68 <lwip_strnicmp+0x38>
80005f50:	0206e893          	ori	a7,a3,32
80005f54:	f9f88813          	addi	a6,a7,-97
80005f58:	0ff87813          	andi	a6,a6,255
80005f5c:	03036063          	bltu	t1,a6,80005f7c <lwip_strnicmp+0x4c>
80005f60:	02076713          	ori	a4,a4,32
80005f64:	00e89c63          	bne	a7,a4,80005f7c <lwip_strnicmp+0x4c>
80005f68:	00f60663          	beq	a2,a5,80005f74 <lwip_strnicmp+0x44>
80005f6c:	00178793          	addi	a5,a5,1
80005f70:	fc0696e3          	bnez	a3,80005f3c <lwip_strnicmp+0xc>
80005f74:	00000513          	li	a0,0
80005f78:	00008067          	ret
80005f7c:	00100513          	li	a0,1
80005f80:	00008067          	ret

80005f84 <lwip_itoa>:
80005f84:	fe010113          	addi	sp,sp,-32
80005f88:	01212823          	sw	s2,16(sp)
80005f8c:	01412423          	sw	s4,8(sp)
80005f90:	00112e23          	sw	ra,28(sp)
80005f94:	00812c23          	sw	s0,24(sp)
80005f98:	00912a23          	sw	s1,20(sp)
80005f9c:	01312623          	sw	s3,12(sp)
80005fa0:	00100793          	li	a5,1
80005fa4:	00050913          	mv	s2,a0
80005fa8:	00058a13          	mv	s4,a1
80005fac:	02b7e663          	bltu	a5,a1,80005fd8 <lwip_itoa+0x54>
80005fb0:	00f59463          	bne	a1,a5,80005fb8 <lwip_itoa+0x34>
80005fb4:	00090023          	sb	zero,0(s2)
80005fb8:	01c12083          	lw	ra,28(sp)
80005fbc:	01812403          	lw	s0,24(sp)
80005fc0:	01412483          	lw	s1,20(sp)
80005fc4:	01012903          	lw	s2,16(sp)
80005fc8:	00c12983          	lw	s3,12(sp)
80005fcc:	00812a03          	lw	s4,8(sp)
80005fd0:	02010113          	addi	sp,sp,32
80005fd4:	00008067          	ret
80005fd8:	00050993          	mv	s3,a0
80005fdc:	00065863          	bgez	a2,80005fec <lwip_itoa+0x68>
80005fe0:	02d00793          	li	a5,45
80005fe4:	00150993          	addi	s3,a0,1
80005fe8:	00f50023          	sb	a5,0(a0)
80005fec:	41f65793          	srai	a5,a2,0x1f
80005ff0:	fffa0413          	addi	s0,s4,-1
80005ff4:	00890433          	add	s0,s2,s0
80005ff8:	00c7c4b3          	xor	s1,a5,a2
80005ffc:	40f484b3          	sub	s1,s1,a5
80006000:	00040023          	sb	zero,0(s0)
80006004:	04048263          	beqz	s1,80006048 <lwip_itoa+0xc4>
80006008:	fa89f6e3          	bgeu	s3,s0,80005fb4 <lwip_itoa+0x30>
8000600c:	00a00593          	li	a1,10
80006010:	00048513          	mv	a0,s1
80006014:	410070ef          	jal	ra,8000d424 <__modsi3>
80006018:	03050513          	addi	a0,a0,48
8000601c:	fff40413          	addi	s0,s0,-1
80006020:	00a40023          	sb	a0,0(s0)
80006024:	00a00593          	li	a1,10
80006028:	00048513          	mv	a0,s1
8000602c:	374070ef          	jal	ra,8000d3a0 <__divsi3>
80006030:	00050493          	mv	s1,a0
80006034:	fd1ff06f          	j	80006004 <lwip_itoa+0x80>
80006038:	03000793          	li	a5,48
8000603c:	00f98023          	sb	a5,0(s3)
80006040:	000980a3          	sb	zero,1(s3)
80006044:	f75ff06f          	j	80005fb8 <lwip_itoa+0x34>
80006048:	00044783          	lbu	a5,0(s0)
8000604c:	fe0786e3          	beqz	a5,80006038 <lwip_itoa+0xb4>
80006050:	01490633          	add	a2,s2,s4
80006054:	40860633          	sub	a2,a2,s0
80006058:	00040593          	mv	a1,s0
8000605c:	01812403          	lw	s0,24(sp)
80006060:	01c12083          	lw	ra,28(sp)
80006064:	01412483          	lw	s1,20(sp)
80006068:	01012903          	lw	s2,16(sp)
8000606c:	00812a03          	lw	s4,8(sp)
80006070:	00098513          	mv	a0,s3
80006074:	00c12983          	lw	s3,12(sp)
80006078:	02010113          	addi	sp,sp,32
8000607c:	2800806f          	j	8000e2fc <memmove>

80006080 <lwip_standard_chksum>:
80006080:	ff010113          	addi	sp,sp,-16
80006084:	00011723          	sh	zero,14(sp)
80006088:	00157693          	andi	a3,a0,1
8000608c:	00068c63          	beqz	a3,800060a4 <lwip_standard_chksum+0x24>
80006090:	00b05a63          	blez	a1,800060a4 <lwip_standard_chksum+0x24>
80006094:	00054783          	lbu	a5,0(a0)
80006098:	fff58593          	addi	a1,a1,-1
8000609c:	00150513          	addi	a0,a0,1
800060a0:	00f107a3          	sb	a5,15(sp)
800060a4:	00000793          	li	a5,0
800060a8:	00100713          	li	a4,1
800060ac:	06b74063          	blt	a4,a1,8000610c <lwip_standard_chksum+0x8c>
800060b0:	00e59663          	bne	a1,a4,800060bc <lwip_standard_chksum+0x3c>
800060b4:	00054703          	lbu	a4,0(a0)
800060b8:	00e10723          	sb	a4,14(sp)
800060bc:	00e15503          	lhu	a0,14(sp)
800060c0:	00010737          	lui	a4,0x10
800060c4:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
800060c8:	00f50533          	add	a0,a0,a5
800060cc:	01055793          	srli	a5,a0,0x10
800060d0:	00e57533          	and	a0,a0,a4
800060d4:	00a787b3          	add	a5,a5,a0
800060d8:	0107d513          	srli	a0,a5,0x10
800060dc:	00e7f7b3          	and	a5,a5,a4
800060e0:	00f50533          	add	a0,a0,a5
800060e4:	00068c63          	beqz	a3,800060fc <lwip_standard_chksum+0x7c>
800060e8:	00851793          	slli	a5,a0,0x8
800060ec:	00855513          	srli	a0,a0,0x8
800060f0:	00e7f733          	and	a4,a5,a4
800060f4:	0ff57513          	andi	a0,a0,255
800060f8:	00a76533          	or	a0,a4,a0
800060fc:	01051513          	slli	a0,a0,0x10
80006100:	01055513          	srli	a0,a0,0x10
80006104:	01010113          	addi	sp,sp,16
80006108:	00008067          	ret
8000610c:	00250513          	addi	a0,a0,2
80006110:	ffe55603          	lhu	a2,-2(a0)
80006114:	ffe58593          	addi	a1,a1,-2
80006118:	00c787b3          	add	a5,a5,a2
8000611c:	f91ff06f          	j	800060ac <lwip_standard_chksum+0x2c>

80006120 <inet_chksum_pseudo>:
80006120:	fe010113          	addi	sp,sp,-32
80006124:	00812c23          	sw	s0,24(sp)
80006128:	00912a23          	sw	s1,20(sp)
8000612c:	01212823          	sw	s2,16(sp)
80006130:	01312623          	sw	s3,12(sp)
80006134:	01412423          	sw	s4,8(sp)
80006138:	01512223          	sw	s5,4(sp)
8000613c:	00112e23          	sw	ra,28(sp)
80006140:	00072703          	lw	a4,0(a4)
80006144:	0006a683          	lw	a3,0(a3) # ff0000 <_stack_size+0xfef800>
80006148:	000107b7          	lui	a5,0x10
8000614c:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80006150:	00f77433          	and	s0,a4,a5
80006154:	01075713          	srli	a4,a4,0x10
80006158:	00e40433          	add	s0,s0,a4
8000615c:	00f6f733          	and	a4,a3,a5
80006160:	00e40433          	add	s0,s0,a4
80006164:	0106d693          	srli	a3,a3,0x10
80006168:	008686b3          	add	a3,a3,s0
8000616c:	0106d413          	srli	s0,a3,0x10
80006170:	00f6f6b3          	and	a3,a3,a5
80006174:	00d406b3          	add	a3,s0,a3
80006178:	0106d413          	srli	s0,a3,0x10
8000617c:	00f6f6b3          	and	a3,a3,a5
80006180:	00050993          	mv	s3,a0
80006184:	00058a13          	mv	s4,a1
80006188:	00060913          	mv	s2,a2
8000618c:	00d40433          	add	s0,s0,a3
80006190:	00000a93          	li	s5,0
80006194:	00078493          	mv	s1,a5
80006198:	08099863          	bnez	s3,80006228 <inet_chksum_pseudo+0x108>
8000619c:	020a8063          	beqz	s5,800061bc <inet_chksum_pseudo+0x9c>
800061a0:	00010737          	lui	a4,0x10
800061a4:	00841793          	slli	a5,s0,0x8
800061a8:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
800061ac:	00845413          	srli	s0,s0,0x8
800061b0:	00e7f7b3          	and	a5,a5,a4
800061b4:	0ff47413          	andi	s0,s0,255
800061b8:	0087e433          	or	s0,a5,s0
800061bc:	000a0513          	mv	a0,s4
800061c0:	c51ff0ef          	jal	ra,80005e10 <lwip_htons>
800061c4:	00050493          	mv	s1,a0
800061c8:	00090513          	mv	a0,s2
800061cc:	c45ff0ef          	jal	ra,80005e10 <lwip_htons>
800061d0:	00a48533          	add	a0,s1,a0
800061d4:	000107b7          	lui	a5,0x10
800061d8:	00850433          	add	s0,a0,s0
800061dc:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
800061e0:	01045513          	srli	a0,s0,0x10
800061e4:	00f47433          	and	s0,s0,a5
800061e8:	00850433          	add	s0,a0,s0
800061ec:	01045513          	srli	a0,s0,0x10
800061f0:	00f47433          	and	s0,s0,a5
800061f4:	00850433          	add	s0,a0,s0
800061f8:	fff44513          	not	a0,s0
800061fc:	01c12083          	lw	ra,28(sp)
80006200:	01812403          	lw	s0,24(sp)
80006204:	01051513          	slli	a0,a0,0x10
80006208:	01412483          	lw	s1,20(sp)
8000620c:	01012903          	lw	s2,16(sp)
80006210:	00c12983          	lw	s3,12(sp)
80006214:	00812a03          	lw	s4,8(sp)
80006218:	00412a83          	lw	s5,4(sp)
8000621c:	01055513          	srli	a0,a0,0x10
80006220:	02010113          	addi	sp,sp,32
80006224:	00008067          	ret
80006228:	00a9d583          	lhu	a1,10(s3)
8000622c:	0049a503          	lw	a0,4(s3)
80006230:	e51ff0ef          	jal	ra,80006080 <lwip_standard_chksum>
80006234:	00850433          	add	s0,a0,s0
80006238:	01045793          	srli	a5,s0,0x10
8000623c:	00947433          	and	s0,s0,s1
80006240:	00878433          	add	s0,a5,s0
80006244:	00a9d783          	lhu	a5,10(s3)
80006248:	0017f793          	andi	a5,a5,1
8000624c:	00078e63          	beqz	a5,80006268 <inet_chksum_pseudo+0x148>
80006250:	00841793          	slli	a5,s0,0x8
80006254:	00845413          	srli	s0,s0,0x8
80006258:	0097f7b3          	and	a5,a5,s1
8000625c:	0ff47413          	andi	s0,s0,255
80006260:	001aca93          	xori	s5,s5,1
80006264:	0087e433          	or	s0,a5,s0
80006268:	0009a983          	lw	s3,0(s3)
8000626c:	f2dff06f          	j	80006198 <inet_chksum_pseudo+0x78>

80006270 <ip_chksum_pseudo>:
80006270:	eb1ff06f          	j	80006120 <inet_chksum_pseudo>

80006274 <inet_chksum_pseudo_partial>:
80006274:	fd010113          	addi	sp,sp,-48
80006278:	02812423          	sw	s0,40(sp)
8000627c:	02912223          	sw	s1,36(sp)
80006280:	03212023          	sw	s2,32(sp)
80006284:	01412c23          	sw	s4,24(sp)
80006288:	01512a23          	sw	s5,20(sp)
8000628c:	01612823          	sw	s6,16(sp)
80006290:	02112623          	sw	ra,44(sp)
80006294:	01312e23          	sw	s3,28(sp)
80006298:	00060913          	mv	s2,a2
8000629c:	0007a603          	lw	a2,0(a5)
800062a0:	00072703          	lw	a4,0(a4)
800062a4:	000107b7          	lui	a5,0x10
800062a8:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
800062ac:	00f67433          	and	s0,a2,a5
800062b0:	01065613          	srli	a2,a2,0x10
800062b4:	00c40433          	add	s0,s0,a2
800062b8:	00f77633          	and	a2,a4,a5
800062bc:	00c40433          	add	s0,s0,a2
800062c0:	01075713          	srli	a4,a4,0x10
800062c4:	00870733          	add	a4,a4,s0
800062c8:	01075413          	srli	s0,a4,0x10
800062cc:	00f77733          	and	a4,a4,a5
800062d0:	00e40733          	add	a4,s0,a4
800062d4:	01075413          	srli	s0,a4,0x10
800062d8:	00f77733          	and	a4,a4,a5
800062dc:	00050a13          	mv	s4,a0
800062e0:	00058a93          	mv	s5,a1
800062e4:	00e40433          	add	s0,s0,a4
800062e8:	00000b13          	li	s6,0
800062ec:	00078493          	mv	s1,a5
800062f0:	060a1c63          	bnez	s4,80006368 <inet_chksum_pseudo_partial+0xf4>
800062f4:	0e0b1663          	bnez	s6,800063e0 <inet_chksum_pseudo_partial+0x16c>
800062f8:	000a8513          	mv	a0,s5
800062fc:	b15ff0ef          	jal	ra,80005e10 <lwip_htons>
80006300:	00050493          	mv	s1,a0
80006304:	00090513          	mv	a0,s2
80006308:	b09ff0ef          	jal	ra,80005e10 <lwip_htons>
8000630c:	00a48533          	add	a0,s1,a0
80006310:	000107b7          	lui	a5,0x10
80006314:	00850433          	add	s0,a0,s0
80006318:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
8000631c:	01045513          	srli	a0,s0,0x10
80006320:	00f47433          	and	s0,s0,a5
80006324:	00850433          	add	s0,a0,s0
80006328:	01045513          	srli	a0,s0,0x10
8000632c:	00f47433          	and	s0,s0,a5
80006330:	00850433          	add	s0,a0,s0
80006334:	fff44513          	not	a0,s0
80006338:	02c12083          	lw	ra,44(sp)
8000633c:	02812403          	lw	s0,40(sp)
80006340:	01051513          	slli	a0,a0,0x10
80006344:	02412483          	lw	s1,36(sp)
80006348:	02012903          	lw	s2,32(sp)
8000634c:	01c12983          	lw	s3,28(sp)
80006350:	01812a03          	lw	s4,24(sp)
80006354:	01412a83          	lw	s5,20(sp)
80006358:	01012b03          	lw	s6,16(sp)
8000635c:	01055513          	srli	a0,a0,0x10
80006360:	03010113          	addi	sp,sp,48
80006364:	00008067          	ret
80006368:	f80686e3          	beqz	a3,800062f4 <inet_chksum_pseudo_partial+0x80>
8000636c:	00aa5783          	lhu	a5,10(s4)
80006370:	00078993          	mv	s3,a5
80006374:	00f6f463          	bgeu	a3,a5,8000637c <inet_chksum_pseudo_partial+0x108>
80006378:	00068993          	mv	s3,a3
8000637c:	01099993          	slli	s3,s3,0x10
80006380:	004a2503          	lw	a0,4(s4)
80006384:	0109d993          	srli	s3,s3,0x10
80006388:	00098593          	mv	a1,s3
8000638c:	00d12623          	sw	a3,12(sp)
80006390:	cf1ff0ef          	jal	ra,80006080 <lwip_standard_chksum>
80006394:	00850433          	add	s0,a0,s0
80006398:	01045793          	srli	a5,s0,0x10
8000639c:	00c12683          	lw	a3,12(sp)
800063a0:	00947433          	and	s0,s0,s1
800063a4:	00878433          	add	s0,a5,s0
800063a8:	00aa5783          	lhu	a5,10(s4)
800063ac:	413689b3          	sub	s3,a3,s3
800063b0:	01099693          	slli	a3,s3,0x10
800063b4:	0017f793          	andi	a5,a5,1
800063b8:	0106d693          	srli	a3,a3,0x10
800063bc:	00078e63          	beqz	a5,800063d8 <inet_chksum_pseudo_partial+0x164>
800063c0:	00841793          	slli	a5,s0,0x8
800063c4:	00845413          	srli	s0,s0,0x8
800063c8:	0097f7b3          	and	a5,a5,s1
800063cc:	0ff47413          	andi	s0,s0,255
800063d0:	001b4b13          	xori	s6,s6,1
800063d4:	0087e433          	or	s0,a5,s0
800063d8:	000a2a03          	lw	s4,0(s4)
800063dc:	f15ff06f          	j	800062f0 <inet_chksum_pseudo_partial+0x7c>
800063e0:	00010737          	lui	a4,0x10
800063e4:	00841793          	slli	a5,s0,0x8
800063e8:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
800063ec:	00845413          	srli	s0,s0,0x8
800063f0:	00e7f7b3          	and	a5,a5,a4
800063f4:	0ff47413          	andi	s0,s0,255
800063f8:	0087e433          	or	s0,a5,s0
800063fc:	efdff06f          	j	800062f8 <inet_chksum_pseudo_partial+0x84>

80006400 <ip_chksum_pseudo_partial>:
80006400:	e75ff06f          	j	80006274 <inet_chksum_pseudo_partial>

80006404 <inet_chksum>:
80006404:	ff010113          	addi	sp,sp,-16
80006408:	00112623          	sw	ra,12(sp)
8000640c:	c75ff0ef          	jal	ra,80006080 <lwip_standard_chksum>
80006410:	00c12083          	lw	ra,12(sp)
80006414:	fff54513          	not	a0,a0
80006418:	01051513          	slli	a0,a0,0x10
8000641c:	01055513          	srli	a0,a0,0x10
80006420:	01010113          	addi	sp,sp,16
80006424:	00008067          	ret

80006428 <inet_chksum_pbuf>:
80006428:	fe010113          	addi	sp,sp,-32
8000642c:	01212823          	sw	s2,16(sp)
80006430:	00010937          	lui	s2,0x10
80006434:	00812c23          	sw	s0,24(sp)
80006438:	00912a23          	sw	s1,20(sp)
8000643c:	01312623          	sw	s3,12(sp)
80006440:	00112e23          	sw	ra,28(sp)
80006444:	00050493          	mv	s1,a0
80006448:	00000993          	li	s3,0
8000644c:	00000413          	li	s0,0
80006450:	fff90913          	addi	s2,s2,-1 # ffff <_stack_size+0xf7ff>
80006454:	04049663          	bnez	s1,800064a0 <inet_chksum_pbuf+0x78>
80006458:	02098063          	beqz	s3,80006478 <inet_chksum_pbuf+0x50>
8000645c:	00010737          	lui	a4,0x10
80006460:	00841793          	slli	a5,s0,0x8
80006464:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
80006468:	00845413          	srli	s0,s0,0x8
8000646c:	00e7f7b3          	and	a5,a5,a4
80006470:	0ff47413          	andi	s0,s0,255
80006474:	0087e433          	or	s0,a5,s0
80006478:	fff44513          	not	a0,s0
8000647c:	01c12083          	lw	ra,28(sp)
80006480:	01812403          	lw	s0,24(sp)
80006484:	01051513          	slli	a0,a0,0x10
80006488:	01412483          	lw	s1,20(sp)
8000648c:	01012903          	lw	s2,16(sp)
80006490:	00c12983          	lw	s3,12(sp)
80006494:	01055513          	srli	a0,a0,0x10
80006498:	02010113          	addi	sp,sp,32
8000649c:	00008067          	ret
800064a0:	00a4d583          	lhu	a1,10(s1)
800064a4:	0044a503          	lw	a0,4(s1)
800064a8:	bd9ff0ef          	jal	ra,80006080 <lwip_standard_chksum>
800064ac:	00850433          	add	s0,a0,s0
800064b0:	01045793          	srli	a5,s0,0x10
800064b4:	01247433          	and	s0,s0,s2
800064b8:	00878433          	add	s0,a5,s0
800064bc:	00a4d783          	lhu	a5,10(s1)
800064c0:	0017f793          	andi	a5,a5,1
800064c4:	00078e63          	beqz	a5,800064e0 <inet_chksum_pbuf+0xb8>
800064c8:	00841793          	slli	a5,s0,0x8
800064cc:	00845413          	srli	s0,s0,0x8
800064d0:	0127f7b3          	and	a5,a5,s2
800064d4:	0ff47413          	andi	s0,s0,255
800064d8:	0019c993          	xori	s3,s3,1
800064dc:	0087e433          	or	s0,a5,s0
800064e0:	0004a483          	lw	s1,0(s1)
800064e4:	f71ff06f          	j	80006454 <inet_chksum_pbuf+0x2c>

800064e8 <mem_overflow_check_raw>:
800064e8:	f5010113          	addi	sp,sp,-176
800064ec:	0a812423          	sw	s0,168(sp)
800064f0:	0a912223          	sw	s1,164(sp)
800064f4:	0b212023          	sw	s2,160(sp)
800064f8:	09312e23          	sw	s3,156(sp)
800064fc:	09412c23          	sw	s4,152(sp)
80006500:	09512a23          	sw	s5,148(sp)
80006504:	09612823          	sw	s6,144(sp)
80006508:	09712623          	sw	s7,140(sp)
8000650c:	0a112623          	sw	ra,172(sp)
80006510:	00050493          	mv	s1,a0
80006514:	00058a93          	mv	s5,a1
80006518:	00060913          	mv	s2,a2
8000651c:	00068993          	mv	s3,a3
80006520:	00000413          	li	s0,0
80006524:	0cd00b13          	li	s6,205
80006528:	80003bb7          	lui	s7,0x80003
8000652c:	01000a13          	li	s4,16
80006530:	008a87b3          	add	a5,s5,s0
80006534:	00f487b3          	add	a5,s1,a5
80006538:	0007c783          	lbu	a5,0(a5)
8000653c:	01678e63          	beq	a5,s6,80006558 <mem_overflow_check_raw+0x70>
80006540:	00098713          	mv	a4,s3
80006544:	00090693          	mv	a3,s2
80006548:	c1cb8613          	addi	a2,s7,-996 # 80002c1c <_ram_heap_end+0xffff0c1c>
8000654c:	08000593          	li	a1,128
80006550:	00010513          	mv	a0,sp
80006554:	3e0080ef          	jal	ra,8000e934 <sniprintf>
80006558:	00140413          	addi	s0,s0,1
8000655c:	fd441ae3          	bne	s0,s4,80006530 <mem_overflow_check_raw+0x48>
80006560:	ff048413          	addi	s0,s1,-16
80006564:	0cd00a13          	li	s4,205
80006568:	80003ab7          	lui	s5,0x80003
8000656c:	00044783          	lbu	a5,0(s0)
80006570:	01478e63          	beq	a5,s4,8000658c <mem_overflow_check_raw+0xa4>
80006574:	00098713          	mv	a4,s3
80006578:	00090693          	mv	a3,s2
8000657c:	c3ca8613          	addi	a2,s5,-964 # 80002c3c <_ram_heap_end+0xffff0c3c>
80006580:	08000593          	li	a1,128
80006584:	00010513          	mv	a0,sp
80006588:	3ac080ef          	jal	ra,8000e934 <sniprintf>
8000658c:	00140413          	addi	s0,s0,1
80006590:	fc849ee3          	bne	s1,s0,8000656c <mem_overflow_check_raw+0x84>
80006594:	0ac12083          	lw	ra,172(sp)
80006598:	0a812403          	lw	s0,168(sp)
8000659c:	0a412483          	lw	s1,164(sp)
800065a0:	0a012903          	lw	s2,160(sp)
800065a4:	09c12983          	lw	s3,156(sp)
800065a8:	09812a03          	lw	s4,152(sp)
800065ac:	09412a83          	lw	s5,148(sp)
800065b0:	09012b03          	lw	s6,144(sp)
800065b4:	08c12b83          	lw	s7,140(sp)
800065b8:	0b010113          	addi	sp,sp,176
800065bc:	00008067          	ret

800065c0 <mem_overflow_init_raw>:
800065c0:	ff010113          	addi	sp,sp,-16
800065c4:	00812423          	sw	s0,8(sp)
800065c8:	00912223          	sw	s1,4(sp)
800065cc:	00050413          	mv	s0,a0
800065d0:	00058493          	mv	s1,a1
800065d4:	01000613          	li	a2,16
800065d8:	0cd00593          	li	a1,205
800065dc:	ff050513          	addi	a0,a0,-16
800065e0:	00112623          	sw	ra,12(sp)
800065e4:	6b4060ef          	jal	ra,8000cc98 <memset>
800065e8:	00940533          	add	a0,s0,s1
800065ec:	00812403          	lw	s0,8(sp)
800065f0:	00c12083          	lw	ra,12(sp)
800065f4:	00412483          	lw	s1,4(sp)
800065f8:	01000613          	li	a2,16
800065fc:	0cd00593          	li	a1,205
80006600:	01010113          	addi	sp,sp,16
80006604:	6940606f          	j	8000cc98 <memset>

80006608 <mem_init>:
80006608:	00008067          	ret

8000660c <mem_trim>:
8000660c:	00008067          	ret

80006610 <lwip_malloc>:
80006610:	ff010113          	addi	sp,sp,-16
80006614:	00812423          	sw	s0,8(sp)
80006618:	00112623          	sw	ra,12(sp)
8000661c:	3b9070ef          	jal	ra,8000e1d4 <malloc>
80006620:	00050413          	mv	s0,a0
80006624:	00051663          	bnez	a0,80006630 <lwip_malloc+0x20>
80006628:	8edfe0ef          	jal	ra,80004f14 <sys_arch_protect>
8000662c:	8edfe0ef          	jal	ra,80004f18 <sys_arch_unprotect>
80006630:	00040513          	mv	a0,s0
80006634:	00c12083          	lw	ra,12(sp)
80006638:	00812403          	lw	s0,8(sp)
8000663c:	01010113          	addi	sp,sp,16
80006640:	00008067          	ret

80006644 <lwip_free>:
80006644:	3a10706f          	j	8000e1e4 <free>

80006648 <lwip_calloc>:
80006648:	3780706f          	j	8000d9c0 <calloc>

8000664c <do_memp_free_pool>:
8000664c:	ff010113          	addi	sp,sp,-16
80006650:	00112623          	sw	ra,12(sp)
80006654:	00812423          	sw	s0,8(sp)
80006658:	00912223          	sw	s1,4(sp)
8000665c:	01212023          	sw	s2,0(sp)
80006660:	00058413          	mv	s0,a1
80006664:	00050493          	mv	s1,a0
80006668:	8adfe0ef          	jal	ra,80004f14 <sys_arch_protect>
8000666c:	0004a683          	lw	a3,0(s1)
80006670:	0044d583          	lhu	a1,4(s1)
80006674:	80003637          	lui	a2,0x80003
80006678:	00050913          	mv	s2,a0
8000667c:	c7460613          	addi	a2,a2,-908 # 80002c74 <_ram_heap_end+0xffff0c74>
80006680:	00040513          	mv	a0,s0
80006684:	e65ff0ef          	jal	ra,800064e8 <mem_overflow_check_raw>
80006688:	00090513          	mv	a0,s2
8000668c:	88dfe0ef          	jal	ra,80004f18 <sys_arch_unprotect>
80006690:	fe440513          	addi	a0,s0,-28
80006694:	00812403          	lw	s0,8(sp)
80006698:	00c12083          	lw	ra,12(sp)
8000669c:	00412483          	lw	s1,4(sp)
800066a0:	00012903          	lw	s2,0(sp)
800066a4:	01010113          	addi	sp,sp,16
800066a8:	f9dff06f          	j	80006644 <lwip_free>

800066ac <do_memp_malloc_pool_fn>:
800066ac:	fe010113          	addi	sp,sp,-32
800066b0:	00812c23          	sw	s0,24(sp)
800066b4:	00912a23          	sw	s1,20(sp)
800066b8:	00112e23          	sw	ra,28(sp)
800066bc:	01212823          	sw	s2,16(sp)
800066c0:	00050493          	mv	s1,a0
800066c4:	00455503          	lhu	a0,4(a0)
800066c8:	00b12623          	sw	a1,12(sp)
800066cc:	00c12423          	sw	a2,8(sp)
800066d0:	00350513          	addi	a0,a0,3
800066d4:	ffc57513          	andi	a0,a0,-4
800066d8:	02c50513          	addi	a0,a0,44
800066dc:	f35ff0ef          	jal	ra,80006610 <lwip_malloc>
800066e0:	00050413          	mv	s0,a0
800066e4:	831fe0ef          	jal	ra,80004f14 <sys_arch_protect>
800066e8:	02040663          	beqz	s0,80006714 <do_memp_malloc_pool_fn+0x68>
800066ec:	00c12583          	lw	a1,12(sp)
800066f0:	00812603          	lw	a2,8(sp)
800066f4:	01c40413          	addi	s0,s0,28
800066f8:	feb42423          	sw	a1,-24(s0)
800066fc:	fec42623          	sw	a2,-20(s0)
80006700:	0044d583          	lhu	a1,4(s1)
80006704:	00050913          	mv	s2,a0
80006708:	00040513          	mv	a0,s0
8000670c:	eb5ff0ef          	jal	ra,800065c0 <mem_overflow_init_raw>
80006710:	00090513          	mv	a0,s2
80006714:	805fe0ef          	jal	ra,80004f18 <sys_arch_unprotect>
80006718:	00040513          	mv	a0,s0
8000671c:	01c12083          	lw	ra,28(sp)
80006720:	01812403          	lw	s0,24(sp)
80006724:	01412483          	lw	s1,20(sp)
80006728:	01012903          	lw	s2,16(sp)
8000672c:	02010113          	addi	sp,sp,32
80006730:	00008067          	ret

80006734 <memp_init_pool>:
80006734:	00008067          	ret

80006738 <memp_init>:
80006738:	00008067          	ret

8000673c <memp_malloc_pool_fn>:
8000673c:	00050463          	beqz	a0,80006744 <memp_malloc_pool_fn+0x8>
80006740:	f6dff06f          	j	800066ac <do_memp_malloc_pool_fn>
80006744:	00008067          	ret

80006748 <memp_malloc_fn>:
80006748:	00500793          	li	a5,5
8000674c:	00a7ee63          	bltu	a5,a0,80006768 <memp_malloc_fn+0x20>
80006750:	00251793          	slli	a5,a0,0x2
80006754:	80003537          	lui	a0,0x80003
80006758:	c5c50513          	addi	a0,a0,-932 # 80002c5c <_ram_heap_end+0xffff0c5c>
8000675c:	00f50533          	add	a0,a0,a5
80006760:	00052503          	lw	a0,0(a0)
80006764:	f49ff06f          	j	800066ac <do_memp_malloc_pool_fn>
80006768:	00000513          	li	a0,0
8000676c:	00008067          	ret

80006770 <memp_free_pool>:
80006770:	00050663          	beqz	a0,8000677c <memp_free_pool+0xc>
80006774:	00058463          	beqz	a1,8000677c <memp_free_pool+0xc>
80006778:	ed5ff06f          	j	8000664c <do_memp_free_pool>
8000677c:	00008067          	ret

80006780 <memp_free>:
80006780:	00500713          	li	a4,5
80006784:	02a76063          	bltu	a4,a0,800067a4 <memp_free+0x24>
80006788:	00058e63          	beqz	a1,800067a4 <memp_free+0x24>
8000678c:	00251793          	slli	a5,a0,0x2
80006790:	80003537          	lui	a0,0x80003
80006794:	c5c50513          	addi	a0,a0,-932 # 80002c5c <_ram_heap_end+0xffff0c5c>
80006798:	00f50533          	add	a0,a0,a5
8000679c:	00052503          	lw	a0,0(a0)
800067a0:	eadff06f          	j	8000664c <do_memp_free_pool>
800067a4:	00008067          	ret

800067a8 <netif_null_output_ip4>:
800067a8:	ff400513          	li	a0,-12
800067ac:	00008067          	ret

800067b0 <netif_issue_reports>:
800067b0:	03554783          	lbu	a5,53(a0)
800067b4:	00500693          	li	a3,5
800067b8:	0057f613          	andi	a2,a5,5
800067bc:	02d61263          	bne	a2,a3,800067e0 <netif_issue_reports+0x30>
800067c0:	0015f593          	andi	a1,a1,1
800067c4:	00058e63          	beqz	a1,800067e0 <netif_issue_reports+0x30>
800067c8:	00452683          	lw	a3,4(a0)
800067cc:	00068a63          	beqz	a3,800067e0 <netif_issue_reports+0x30>
800067d0:	0087f793          	andi	a5,a5,8
800067d4:	00078663          	beqz	a5,800067e0 <netif_issue_reports+0x30>
800067d8:	00450593          	addi	a1,a0,4
800067dc:	0e50406f          	j	8000b0c0 <etharp_request>
800067e0:	00008067          	ret

800067e4 <netif_do_set_ipaddr>:
800067e4:	00452783          	lw	a5,4(a0)
800067e8:	0005a703          	lw	a4,0(a1)
800067ec:	08f70263          	beq	a4,a5,80006870 <netif_do_set_ipaddr+0x8c>
800067f0:	fe010113          	addi	sp,sp,-32
800067f4:	00f62023          	sw	a5,0(a2)
800067f8:	00812c23          	sw	s0,24(sp)
800067fc:	01212823          	sw	s2,16(sp)
80006800:	00050413          	mv	s0,a0
80006804:	00058913          	mv	s2,a1
80006808:	00060513          	mv	a0,a2
8000680c:	00c10593          	addi	a1,sp,12
80006810:	00112e23          	sw	ra,28(sp)
80006814:	00e12623          	sw	a4,12(sp)
80006818:	00912a23          	sw	s1,20(sp)
8000681c:	00060493          	mv	s1,a2
80006820:	464020ef          	jal	ra,80008c84 <udp_netif_ip_addr_changed>
80006824:	00c10593          	addi	a1,sp,12
80006828:	00048513          	mv	a0,s1
8000682c:	0c5010ef          	jal	ra,800080f0 <raw_netif_ip_addr_changed>
80006830:	00092783          	lw	a5,0(s2)
80006834:	00100593          	li	a1,1
80006838:	00040513          	mv	a0,s0
8000683c:	00f42223          	sw	a5,4(s0)
80006840:	f71ff0ef          	jal	ra,800067b0 <netif_issue_reports>
80006844:	01c42783          	lw	a5,28(s0)
80006848:	00078663          	beqz	a5,80006854 <netif_do_set_ipaddr+0x70>
8000684c:	00040513          	mv	a0,s0
80006850:	000780e7          	jalr	a5
80006854:	01c12083          	lw	ra,28(sp)
80006858:	01812403          	lw	s0,24(sp)
8000685c:	01412483          	lw	s1,20(sp)
80006860:	01012903          	lw	s2,16(sp)
80006864:	00100513          	li	a0,1
80006868:	02010113          	addi	sp,sp,32
8000686c:	00008067          	ret
80006870:	00000513          	li	a0,0
80006874:	00008067          	ret

80006878 <netif_init>:
80006878:	00008067          	ret

8000687c <netif_input>:
8000687c:	0355c783          	lbu	a5,53(a1)
80006880:	0187f793          	andi	a5,a5,24
80006884:	00078463          	beqz	a5,8000688c <netif_input+0x10>
80006888:	1d40606f          	j	8000ca5c <ethernet_input>
8000688c:	6300506f          	j	8000bebc <ip4_input>

80006890 <netif_set_ipaddr>:
80006890:	02050463          	beqz	a0,800068b8 <netif_set_ipaddr+0x28>
80006894:	fe010113          	addi	sp,sp,-32
80006898:	00112e23          	sw	ra,28(sp)
8000689c:	00059463          	bnez	a1,800068a4 <netif_set_ipaddr+0x14>
800068a0:	84818593          	addi	a1,gp,-1976 # 800030c8 <ip_addr_any>
800068a4:	00c10613          	addi	a2,sp,12
800068a8:	f3dff0ef          	jal	ra,800067e4 <netif_do_set_ipaddr>
800068ac:	01c12083          	lw	ra,28(sp)
800068b0:	02010113          	addi	sp,sp,32
800068b4:	00008067          	ret
800068b8:	00008067          	ret

800068bc <netif_set_netmask>:
800068bc:	00050e63          	beqz	a0,800068d8 <netif_set_netmask+0x1c>
800068c0:	00059463          	bnez	a1,800068c8 <netif_set_netmask+0xc>
800068c4:	84818593          	addi	a1,gp,-1976 # 800030c8 <ip_addr_any>
800068c8:	0005a783          	lw	a5,0(a1)
800068cc:	00852703          	lw	a4,8(a0)
800068d0:	00e78463          	beq	a5,a4,800068d8 <netif_set_netmask+0x1c>
800068d4:	00f52423          	sw	a5,8(a0)
800068d8:	00008067          	ret

800068dc <netif_set_gw>:
800068dc:	00050e63          	beqz	a0,800068f8 <netif_set_gw+0x1c>
800068e0:	00059463          	bnez	a1,800068e8 <netif_set_gw+0xc>
800068e4:	84818593          	addi	a1,gp,-1976 # 800030c8 <ip_addr_any>
800068e8:	0005a783          	lw	a5,0(a1)
800068ec:	00c52703          	lw	a4,12(a0)
800068f0:	00e78463          	beq	a5,a4,800068f8 <netif_set_gw+0x1c>
800068f4:	00f52623          	sw	a5,12(a0)
800068f8:	00008067          	ret

800068fc <netif_set_addr>:
800068fc:	fd010113          	addi	sp,sp,-48
80006900:	02812423          	sw	s0,40(sp)
80006904:	02912223          	sw	s1,36(sp)
80006908:	03212023          	sw	s2,32(sp)
8000690c:	02112623          	sw	ra,44(sp)
80006910:	00050493          	mv	s1,a0
80006914:	00060913          	mv	s2,a2
80006918:	00058413          	mv	s0,a1
8000691c:	00059463          	bnez	a1,80006924 <netif_set_addr+0x28>
80006920:	84818413          	addi	s0,gp,-1976 # 800030c8 <ip_addr_any>
80006924:	00091463          	bnez	s2,8000692c <netif_set_addr+0x30>
80006928:	84818913          	addi	s2,gp,-1976 # 800030c8 <ip_addr_any>
8000692c:	00069463          	bnez	a3,80006934 <netif_set_addr+0x38>
80006930:	84818693          	addi	a3,gp,-1976 # 800030c8 <ip_addr_any>
80006934:	00042783          	lw	a5,0(s0)
80006938:	00078663          	beqz	a5,80006944 <netif_set_addr+0x48>
8000693c:	00000793          	li	a5,0
80006940:	0200006f          	j	80006960 <netif_set_addr+0x64>
80006944:	01c10613          	addi	a2,sp,28
80006948:	00040593          	mv	a1,s0
8000694c:	00048513          	mv	a0,s1
80006950:	00d12623          	sw	a3,12(sp)
80006954:	e91ff0ef          	jal	ra,800067e4 <netif_do_set_ipaddr>
80006958:	00c12683          	lw	a3,12(sp)
8000695c:	00100793          	li	a5,1
80006960:	00092703          	lw	a4,0(s2)
80006964:	0084a603          	lw	a2,8(s1)
80006968:	00c70463          	beq	a4,a2,80006970 <netif_set_addr+0x74>
8000696c:	00e4a423          	sw	a4,8(s1)
80006970:	0006a703          	lw	a4,0(a3)
80006974:	00c4a683          	lw	a3,12(s1)
80006978:	00d70463          	beq	a4,a3,80006980 <netif_set_addr+0x84>
8000697c:	00e4a623          	sw	a4,12(s1)
80006980:	00079a63          	bnez	a5,80006994 <netif_set_addr+0x98>
80006984:	01c10613          	addi	a2,sp,28
80006988:	00040593          	mv	a1,s0
8000698c:	00048513          	mv	a0,s1
80006990:	e55ff0ef          	jal	ra,800067e4 <netif_do_set_ipaddr>
80006994:	02c12083          	lw	ra,44(sp)
80006998:	02812403          	lw	s0,40(sp)
8000699c:	02412483          	lw	s1,36(sp)
800069a0:	02012903          	lw	s2,32(sp)
800069a4:	03010113          	addi	sp,sp,48
800069a8:	00008067          	ret

800069ac <netif_add>:
800069ac:	fe010113          	addi	sp,sp,-32
800069b0:	00112e23          	sw	ra,28(sp)
800069b4:	00812c23          	sw	s0,24(sp)
800069b8:	00912a23          	sw	s1,20(sp)
800069bc:	02051063          	bnez	a0,800069dc <netif_add+0x30>
800069c0:	00000413          	li	s0,0
800069c4:	00040513          	mv	a0,s0
800069c8:	01c12083          	lw	ra,28(sp)
800069cc:	01812403          	lw	s0,24(sp)
800069d0:	01412483          	lw	s1,20(sp)
800069d4:	02010113          	addi	sp,sp,32
800069d8:	00008067          	ret
800069dc:	fe0782e3          	beqz	a5,800069c0 <netif_add+0x14>
800069e0:	00050413          	mv	s0,a0
800069e4:	00059463          	bnez	a1,800069ec <netif_add+0x40>
800069e8:	84818593          	addi	a1,gp,-1976 # 800030c8 <ip_addr_any>
800069ec:	00061463          	bnez	a2,800069f4 <netif_add+0x48>
800069f0:	84818613          	addi	a2,gp,-1976 # 800030c8 <ip_addr_any>
800069f4:	00069463          	bnez	a3,800069fc <netif_add+0x50>
800069f8:	84818693          	addi	a3,gp,-1976 # 800030c8 <ip_addr_any>
800069fc:	02e42223          	sw	a4,36(s0)
80006a00:	8cc1c703          	lbu	a4,-1844(gp) # 8000314c <netif_num>
80006a04:	80006537          	lui	a0,0x80006
80006a08:	7a850513          	addi	a0,a0,1960 # 800067a8 <_ram_heap_end+0xffff47a8>
80006a0c:	00a42a23          	sw	a0,20(s0)
80006a10:	00042223          	sw	zero,4(s0)
80006a14:	00040513          	mv	a0,s0
80006a18:	00042423          	sw	zero,8(s0)
80006a1c:	00042623          	sw	zero,12(s0)
80006a20:	02041623          	sh	zero,44(s0)
80006a24:	02040aa3          	sb	zero,53(s0)
80006a28:	02040423          	sb	zero,40(s0)
80006a2c:	020404a3          	sb	zero,41(s0)
80006a30:	02040523          	sb	zero,42(s0)
80006a34:	020405a3          	sb	zero,43(s0)
80006a38:	00042e23          	sw	zero,28(s0)
80006a3c:	02042023          	sw	zero,32(s0)
80006a40:	02e40c23          	sb	a4,56(s0)
80006a44:	01042823          	sw	a6,16(s0)
80006a48:	02042e23          	sw	zero,60(s0)
80006a4c:	00f12623          	sw	a5,12(sp)
80006a50:	eadff0ef          	jal	ra,800068fc <netif_set_addr>
80006a54:	00c12783          	lw	a5,12(sp)
80006a58:	00040513          	mv	a0,s0
80006a5c:	000780e7          	jalr	a5
80006a60:	f60510e3          	bnez	a0,800069c0 <netif_add+0x14>
80006a64:	8d41a603          	lw	a2,-1836(gp) # 80003154 <netif_list>
80006a68:	00078713          	mv	a4,a5
80006a6c:	0ff00593          	li	a1,255
80006a70:	03844783          	lbu	a5,56(s0)
80006a74:	00b79463          	bne	a5,a1,80006a7c <netif_add+0xd0>
80006a78:	02040c23          	sb	zero,56(s0)
80006a7c:	03844783          	lbu	a5,56(s0)
80006a80:	00060693          	mv	a3,a2
80006a84:	02069463          	bnez	a3,80006aac <netif_add+0x100>
80006a88:	0fe00593          	li	a1,254
80006a8c:	00000693          	li	a3,0
80006a90:	00b78663          	beq	a5,a1,80006a9c <netif_add+0xf0>
80006a94:	00178793          	addi	a5,a5,1
80006a98:	0ff7f693          	andi	a3,a5,255
80006a9c:	00c42023          	sw	a2,0(s0)
80006aa0:	8cd18623          	sb	a3,-1844(gp) # 8000314c <netif_num>
80006aa4:	8c81aa23          	sw	s0,-1836(gp) # 80003154 <netif_list>
80006aa8:	f1dff06f          	j	800069c4 <netif_add+0x18>
80006aac:	0386c503          	lbu	a0,56(a3)
80006ab0:	00f51863          	bne	a0,a5,80006ac0 <netif_add+0x114>
80006ab4:	00178793          	addi	a5,a5,1
80006ab8:	02f40c23          	sb	a5,56(s0)
80006abc:	fb5ff06f          	j	80006a70 <netif_add+0xc4>
80006ac0:	0006a683          	lw	a3,0(a3)
80006ac4:	fc1ff06f          	j	80006a84 <netif_add+0xd8>

80006ac8 <netif_add_noaddr>:
80006ac8:	00068813          	mv	a6,a3
80006acc:	00060793          	mv	a5,a2
80006ad0:	00058713          	mv	a4,a1
80006ad4:	00000693          	li	a3,0
80006ad8:	00000613          	li	a2,0
80006adc:	00000593          	li	a1,0
80006ae0:	ecdff06f          	j	800069ac <netif_add>

80006ae4 <netif_set_default>:
80006ae4:	8ca1a823          	sw	a0,-1840(gp) # 80003150 <netif_default>
80006ae8:	00008067          	ret

80006aec <netif_set_up>:
80006aec:	04050e63          	beqz	a0,80006b48 <netif_set_up+0x5c>
80006af0:	ff010113          	addi	sp,sp,-16
80006af4:	00812423          	sw	s0,8(sp)
80006af8:	00112623          	sw	ra,12(sp)
80006afc:	03554783          	lbu	a5,53(a0)
80006b00:	00050413          	mv	s0,a0
80006b04:	0017f713          	andi	a4,a5,1
80006b08:	02071863          	bnez	a4,80006b38 <netif_set_up+0x4c>
80006b0c:	0017e793          	ori	a5,a5,1
80006b10:	02f50aa3          	sb	a5,53(a0)
80006b14:	01c52783          	lw	a5,28(a0)
80006b18:	00078463          	beqz	a5,80006b20 <netif_set_up+0x34>
80006b1c:	000780e7          	jalr	a5
80006b20:	00040513          	mv	a0,s0
80006b24:	00812403          	lw	s0,8(sp)
80006b28:	00c12083          	lw	ra,12(sp)
80006b2c:	00300593          	li	a1,3
80006b30:	01010113          	addi	sp,sp,16
80006b34:	c7dff06f          	j	800067b0 <netif_issue_reports>
80006b38:	00c12083          	lw	ra,12(sp)
80006b3c:	00812403          	lw	s0,8(sp)
80006b40:	01010113          	addi	sp,sp,16
80006b44:	00008067          	ret
80006b48:	00008067          	ret

80006b4c <netif_set_down>:
80006b4c:	06050063          	beqz	a0,80006bac <netif_set_down+0x60>
80006b50:	ff010113          	addi	sp,sp,-16
80006b54:	00812423          	sw	s0,8(sp)
80006b58:	00112623          	sw	ra,12(sp)
80006b5c:	03554783          	lbu	a5,53(a0)
80006b60:	00050413          	mv	s0,a0
80006b64:	0017f713          	andi	a4,a5,1
80006b68:	02070a63          	beqz	a4,80006b9c <netif_set_down+0x50>
80006b6c:	ffe7f713          	andi	a4,a5,-2
80006b70:	02e50aa3          	sb	a4,53(a0)
80006b74:	0087f793          	andi	a5,a5,8
80006b78:	00078463          	beqz	a5,80006b80 <netif_set_down+0x34>
80006b7c:	1cc040ef          	jal	ra,8000ad48 <etharp_cleanup_netif>
80006b80:	01c42303          	lw	t1,28(s0)
80006b84:	00030c63          	beqz	t1,80006b9c <netif_set_down+0x50>
80006b88:	00040513          	mv	a0,s0
80006b8c:	00812403          	lw	s0,8(sp)
80006b90:	00c12083          	lw	ra,12(sp)
80006b94:	01010113          	addi	sp,sp,16
80006b98:	00030067          	jr	t1
80006b9c:	00c12083          	lw	ra,12(sp)
80006ba0:	00812403          	lw	s0,8(sp)
80006ba4:	01010113          	addi	sp,sp,16
80006ba8:	00008067          	ret
80006bac:	00008067          	ret

80006bb0 <netif_remove>:
80006bb0:	08050e63          	beqz	a0,80006c4c <netif_remove+0x9c>
80006bb4:	ff010113          	addi	sp,sp,-16
80006bb8:	00812423          	sw	s0,8(sp)
80006bbc:	00112623          	sw	ra,12(sp)
80006bc0:	00912223          	sw	s1,4(sp)
80006bc4:	00452783          	lw	a5,4(a0)
80006bc8:	00050413          	mv	s0,a0
80006bcc:	02078063          	beqz	a5,80006bec <netif_remove+0x3c>
80006bd0:	00450493          	addi	s1,a0,4
80006bd4:	00000593          	li	a1,0
80006bd8:	00048513          	mv	a0,s1
80006bdc:	0a8020ef          	jal	ra,80008c84 <udp_netif_ip_addr_changed>
80006be0:	00000593          	li	a1,0
80006be4:	00048513          	mv	a0,s1
80006be8:	508010ef          	jal	ra,800080f0 <raw_netif_ip_addr_changed>
80006bec:	03544783          	lbu	a5,53(s0)
80006bf0:	0017f793          	andi	a5,a5,1
80006bf4:	00078663          	beqz	a5,80006c00 <netif_remove+0x50>
80006bf8:	00040513          	mv	a0,s0
80006bfc:	f51ff0ef          	jal	ra,80006b4c <netif_set_down>
80006c00:	8d01a703          	lw	a4,-1840(gp) # 80003150 <netif_default>
80006c04:	00871463          	bne	a4,s0,80006c0c <netif_remove+0x5c>
80006c08:	8c01a823          	sw	zero,-1840(gp) # 80003150 <netif_default>
80006c0c:	8d41a783          	lw	a5,-1836(gp) # 80003154 <netif_list>
80006c10:	02879263          	bne	a5,s0,80006c34 <netif_remove+0x84>
80006c14:	00042783          	lw	a5,0(s0)
80006c18:	8cf1aa23          	sw	a5,-1836(gp) # 80003154 <netif_list>
80006c1c:	00c12083          	lw	ra,12(sp)
80006c20:	00812403          	lw	s0,8(sp)
80006c24:	00412483          	lw	s1,4(sp)
80006c28:	01010113          	addi	sp,sp,16
80006c2c:	00008067          	ret
80006c30:	00070793          	mv	a5,a4
80006c34:	fe0784e3          	beqz	a5,80006c1c <netif_remove+0x6c>
80006c38:	0007a703          	lw	a4,0(a5)
80006c3c:	fe871ae3          	bne	a4,s0,80006c30 <netif_remove+0x80>
80006c40:	00042703          	lw	a4,0(s0)
80006c44:	00e7a023          	sw	a4,0(a5)
80006c48:	fd5ff06f          	j	80006c1c <netif_remove+0x6c>
80006c4c:	00008067          	ret

80006c50 <netif_set_status_callback>:
80006c50:	00050463          	beqz	a0,80006c58 <netif_set_status_callback+0x8>
80006c54:	00b52e23          	sw	a1,28(a0)
80006c58:	00008067          	ret

80006c5c <netif_set_link_up>:
80006c5c:	06050263          	beqz	a0,80006cc0 <netif_set_link_up+0x64>
80006c60:	ff010113          	addi	sp,sp,-16
80006c64:	00812423          	sw	s0,8(sp)
80006c68:	00112623          	sw	ra,12(sp)
80006c6c:	03554783          	lbu	a5,53(a0)
80006c70:	00050413          	mv	s0,a0
80006c74:	0047f713          	andi	a4,a5,4
80006c78:	02071c63          	bnez	a4,80006cb0 <netif_set_link_up+0x54>
80006c7c:	0047e793          	ori	a5,a5,4
80006c80:	02f50aa3          	sb	a5,53(a0)
80006c84:	3c8030ef          	jal	ra,8000a04c <dhcp_network_changed>
80006c88:	00300593          	li	a1,3
80006c8c:	00040513          	mv	a0,s0
80006c90:	b21ff0ef          	jal	ra,800067b0 <netif_issue_reports>
80006c94:	02042303          	lw	t1,32(s0)
80006c98:	00030c63          	beqz	t1,80006cb0 <netif_set_link_up+0x54>
80006c9c:	00040513          	mv	a0,s0
80006ca0:	00812403          	lw	s0,8(sp)
80006ca4:	00c12083          	lw	ra,12(sp)
80006ca8:	01010113          	addi	sp,sp,16
80006cac:	00030067          	jr	t1
80006cb0:	00c12083          	lw	ra,12(sp)
80006cb4:	00812403          	lw	s0,8(sp)
80006cb8:	01010113          	addi	sp,sp,16
80006cbc:	00008067          	ret
80006cc0:	00008067          	ret

80006cc4 <netif_set_link_down>:
80006cc4:	02050263          	beqz	a0,80006ce8 <netif_set_link_down+0x24>
80006cc8:	03554703          	lbu	a4,53(a0)
80006ccc:	00477693          	andi	a3,a4,4
80006cd0:	00068c63          	beqz	a3,80006ce8 <netif_set_link_down+0x24>
80006cd4:	02052303          	lw	t1,32(a0)
80006cd8:	ffb77713          	andi	a4,a4,-5
80006cdc:	02e50aa3          	sb	a4,53(a0)
80006ce0:	00030463          	beqz	t1,80006ce8 <netif_set_link_down+0x24>
80006ce4:	00030067          	jr	t1
80006ce8:	00008067          	ret

80006cec <netif_set_link_callback>:
80006cec:	00050463          	beqz	a0,80006cf4 <netif_set_link_callback+0x8>
80006cf0:	02b52023          	sw	a1,32(a0)
80006cf4:	00008067          	ret

80006cf8 <netif_get_by_index>:
80006cf8:	00000793          	li	a5,0
80006cfc:	00050663          	beqz	a0,80006d08 <netif_get_by_index+0x10>
80006d00:	8d41a783          	lw	a5,-1836(gp) # 80003154 <netif_list>
80006d04:	00079663          	bnez	a5,80006d10 <netif_get_by_index+0x18>
80006d08:	00078513          	mv	a0,a5
80006d0c:	00008067          	ret
80006d10:	0387c703          	lbu	a4,56(a5)
80006d14:	00170713          	addi	a4,a4,1
80006d18:	0ff77713          	andi	a4,a4,255
80006d1c:	fea706e3          	beq	a4,a0,80006d08 <netif_get_by_index+0x10>
80006d20:	0007a783          	lw	a5,0(a5)
80006d24:	fe1ff06f          	j	80006d04 <netif_get_by_index+0xc>

80006d28 <netif_index_to_name>:
80006d28:	ff010113          	addi	sp,sp,-16
80006d2c:	00812423          	sw	s0,8(sp)
80006d30:	00912223          	sw	s1,4(sp)
80006d34:	00112623          	sw	ra,12(sp)
80006d38:	00050493          	mv	s1,a0
80006d3c:	00058413          	mv	s0,a1
80006d40:	fb9ff0ef          	jal	ra,80006cf8 <netif_get_by_index>
80006d44:	02050463          	beqz	a0,80006d6c <netif_index_to_name+0x44>
80006d48:	03654783          	lbu	a5,54(a0)
80006d4c:	fff48613          	addi	a2,s1,-1
80006d50:	00400593          	li	a1,4
80006d54:	00f40023          	sb	a5,0(s0)
80006d58:	03754783          	lbu	a5,55(a0)
80006d5c:	00240513          	addi	a0,s0,2
80006d60:	00f400a3          	sb	a5,1(s0)
80006d64:	a20ff0ef          	jal	ra,80005f84 <lwip_itoa>
80006d68:	00040513          	mv	a0,s0
80006d6c:	00c12083          	lw	ra,12(sp)
80006d70:	00812403          	lw	s0,8(sp)
80006d74:	00412483          	lw	s1,4(sp)
80006d78:	01010113          	addi	sp,sp,16
80006d7c:	00008067          	ret

80006d80 <netif_find>:
80006d80:	00051663          	bnez	a0,80006d8c <netif_find+0xc>
80006d84:	00000513          	li	a0,0
80006d88:	00008067          	ret
80006d8c:	ff010113          	addi	sp,sp,-16
80006d90:	00812423          	sw	s0,8(sp)
80006d94:	00050413          	mv	s0,a0
80006d98:	00250513          	addi	a0,a0,2
80006d9c:	00112623          	sw	ra,12(sp)
80006da0:	409060ef          	jal	ra,8000d9a8 <atoi>
80006da4:	0ff57793          	andi	a5,a0,255
80006da8:	8d41a503          	lw	a0,-1836(gp) # 80003154 <netif_list>
80006dac:	00051c63          	bnez	a0,80006dc4 <netif_find+0x44>
80006db0:	00000513          	li	a0,0
80006db4:	00c12083          	lw	ra,12(sp)
80006db8:	00812403          	lw	s0,8(sp)
80006dbc:	01010113          	addi	sp,sp,16
80006dc0:	00008067          	ret
80006dc4:	03854703          	lbu	a4,56(a0)
80006dc8:	00f71e63          	bne	a4,a5,80006de4 <netif_find+0x64>
80006dcc:	00044683          	lbu	a3,0(s0)
80006dd0:	03654703          	lbu	a4,54(a0)
80006dd4:	00e69863          	bne	a3,a4,80006de4 <netif_find+0x64>
80006dd8:	00144683          	lbu	a3,1(s0)
80006ddc:	03754703          	lbu	a4,55(a0)
80006de0:	fce68ae3          	beq	a3,a4,80006db4 <netif_find+0x34>
80006de4:	00052503          	lw	a0,0(a0)
80006de8:	fc5ff06f          	j	80006dac <netif_find+0x2c>

80006dec <netif_name_to_index>:
80006dec:	ff010113          	addi	sp,sp,-16
80006df0:	00112623          	sw	ra,12(sp)
80006df4:	f8dff0ef          	jal	ra,80006d80 <netif_find>
80006df8:	00050e63          	beqz	a0,80006e14 <netif_name_to_index+0x28>
80006dfc:	03854503          	lbu	a0,56(a0)
80006e00:	00150513          	addi	a0,a0,1
80006e04:	0ff57513          	andi	a0,a0,255
80006e08:	00c12083          	lw	ra,12(sp)
80006e0c:	01010113          	addi	sp,sp,16
80006e10:	00008067          	ret
80006e14:	00000513          	li	a0,0
80006e18:	ff1ff06f          	j	80006e08 <netif_name_to_index+0x1c>

80006e1c <pbuf_skip_const>:
80006e1c:	00050663          	beqz	a0,80006e28 <pbuf_skip_const+0xc>
80006e20:	00a55783          	lhu	a5,10(a0)
80006e24:	00f5f863          	bgeu	a1,a5,80006e34 <pbuf_skip_const+0x18>
80006e28:	00060463          	beqz	a2,80006e30 <pbuf_skip_const+0x14>
80006e2c:	00b61023          	sh	a1,0(a2)
80006e30:	00008067          	ret
80006e34:	40f585b3          	sub	a1,a1,a5
80006e38:	01059593          	slli	a1,a1,0x10
80006e3c:	0105d593          	srli	a1,a1,0x10
80006e40:	00052503          	lw	a0,0(a0)
80006e44:	fd9ff06f          	j	80006e1c <pbuf_skip_const>

80006e48 <pbuf_add_header_impl>:
80006e48:	00050793          	mv	a5,a0
80006e4c:	08050263          	beqz	a0,80006ed0 <pbuf_add_header_impl+0x88>
80006e50:	00010737          	lui	a4,0x10
80006e54:	00100513          	li	a0,1
80006e58:	06e5fe63          	bgeu	a1,a4,80006ed4 <pbuf_add_header_impl+0x8c>
80006e5c:	00000513          	li	a0,0
80006e60:	06058a63          	beqz	a1,80006ed4 <pbuf_add_header_impl+0x8c>
80006e64:	0087d703          	lhu	a4,8(a5)
80006e68:	01059693          	slli	a3,a1,0x10
80006e6c:	0106d693          	srli	a3,a3,0x10
80006e70:	00e68733          	add	a4,a3,a4
80006e74:	01071713          	slli	a4,a4,0x10
80006e78:	01075713          	srli	a4,a4,0x10
80006e7c:	00100513          	li	a0,1
80006e80:	04d76a63          	bltu	a4,a3,80006ed4 <pbuf_add_header_impl+0x8c>
80006e84:	00c78503          	lb	a0,12(a5)
80006e88:	00055e63          	bgez	a0,80006ea4 <pbuf_add_header_impl+0x5c>
80006e8c:	0047a603          	lw	a2,4(a5)
80006e90:	00100513          	li	a0,1
80006e94:	40b605b3          	sub	a1,a2,a1
80006e98:	01078613          	addi	a2,a5,16
80006e9c:	00c5fc63          	bgeu	a1,a2,80006eb4 <pbuf_add_header_impl+0x6c>
80006ea0:	00008067          	ret
80006ea4:	00100513          	li	a0,1
80006ea8:	02060663          	beqz	a2,80006ed4 <pbuf_add_header_impl+0x8c>
80006eac:	0047a603          	lw	a2,4(a5)
80006eb0:	40b605b3          	sub	a1,a2,a1
80006eb4:	00a7d603          	lhu	a2,10(a5)
80006eb8:	00b7a223          	sw	a1,4(a5)
80006ebc:	00e79423          	sh	a4,8(a5)
80006ec0:	00c686b3          	add	a3,a3,a2
80006ec4:	00d79523          	sh	a3,10(a5)
80006ec8:	00000513          	li	a0,0
80006ecc:	00008067          	ret
80006ed0:	00100513          	li	a0,1
80006ed4:	00008067          	ret

80006ed8 <pbuf_alloc_reference>:
80006ed8:	ff010113          	addi	sp,sp,-16
80006edc:	00812423          	sw	s0,8(sp)
80006ee0:	00058413          	mv	s0,a1
80006ee4:	800035b7          	lui	a1,0x80003
80006ee8:	00912223          	sw	s1,4(sp)
80006eec:	01212023          	sw	s2,0(sp)
80006ef0:	00060493          	mv	s1,a2
80006ef4:	00050913          	mv	s2,a0
80006ef8:	14c00613          	li	a2,332
80006efc:	cc058593          	addi	a1,a1,-832 # 80002cc0 <_ram_heap_end+0xffff0cc0>
80006f00:	00400513          	li	a0,4
80006f04:	00112623          	sw	ra,12(sp)
80006f08:	841ff0ef          	jal	ra,80006748 <memp_malloc_fn>
80006f0c:	02050263          	beqz	a0,80006f30 <pbuf_alloc_reference+0x58>
80006f10:	00100793          	li	a5,1
80006f14:	00052023          	sw	zero,0(a0)
80006f18:	01252223          	sw	s2,4(a0)
80006f1c:	00851423          	sh	s0,8(a0)
80006f20:	00851523          	sh	s0,10(a0)
80006f24:	00950623          	sb	s1,12(a0)
80006f28:	000506a3          	sb	zero,13(a0)
80006f2c:	00f51723          	sh	a5,14(a0)
80006f30:	00c12083          	lw	ra,12(sp)
80006f34:	00812403          	lw	s0,8(sp)
80006f38:	00412483          	lw	s1,4(sp)
80006f3c:	00012903          	lw	s2,0(sp)
80006f40:	01010113          	addi	sp,sp,16
80006f44:	00008067          	ret

80006f48 <pbuf_alloced_custom>:
80006f48:	01051513          	slli	a0,a0,0x10
80006f4c:	01055513          	srli	a0,a0,0x10
80006f50:	00350513          	addi	a0,a0,3
80006f54:	ffc57513          	andi	a0,a0,-4
80006f58:	00a58833          	add	a6,a1,a0
80006f5c:	0307ec63          	bltu	a5,a6,80006f94 <pbuf_alloced_custom+0x4c>
80006f60:	00070463          	beqz	a4,80006f68 <pbuf_alloced_custom+0x20>
80006f64:	00a70733          	add	a4,a4,a0
80006f68:	00200793          	li	a5,2
80006f6c:	00f686a3          	sb	a5,13(a3)
80006f70:	00100793          	li	a5,1
80006f74:	00068513          	mv	a0,a3
80006f78:	0006a023          	sw	zero,0(a3)
80006f7c:	00e6a223          	sw	a4,4(a3)
80006f80:	00b69423          	sh	a1,8(a3)
80006f84:	00b69523          	sh	a1,10(a3)
80006f88:	00c68623          	sb	a2,12(a3)
80006f8c:	00f69723          	sh	a5,14(a3)
80006f90:	00008067          	ret
80006f94:	00000513          	li	a0,0
80006f98:	00008067          	ret

80006f9c <pbuf_add_header>:
80006f9c:	00000613          	li	a2,0
80006fa0:	ea9ff06f          	j	80006e48 <pbuf_add_header_impl>

80006fa4 <pbuf_add_header_force>:
80006fa4:	00100613          	li	a2,1
80006fa8:	ea1ff06f          	j	80006e48 <pbuf_add_header_impl>

80006fac <pbuf_remove_header>:
80006fac:	00050793          	mv	a5,a0
80006fb0:	04050a63          	beqz	a0,80007004 <pbuf_remove_header+0x58>
80006fb4:	00010737          	lui	a4,0x10
80006fb8:	00100513          	li	a0,1
80006fbc:	04e5f663          	bgeu	a1,a4,80007008 <pbuf_remove_header+0x5c>
80006fc0:	00000513          	li	a0,0
80006fc4:	04058263          	beqz	a1,80007008 <pbuf_remove_header+0x5c>
80006fc8:	00a7d703          	lhu	a4,10(a5)
80006fcc:	01059693          	slli	a3,a1,0x10
80006fd0:	0106d693          	srli	a3,a3,0x10
80006fd4:	00100513          	li	a0,1
80006fd8:	02d76863          	bltu	a4,a3,80007008 <pbuf_remove_header+0x5c>
80006fdc:	40d70733          	sub	a4,a4,a3
80006fe0:	0047a603          	lw	a2,4(a5)
80006fe4:	00e79523          	sh	a4,10(a5)
80006fe8:	0087d703          	lhu	a4,8(a5)
80006fec:	00b605b3          	add	a1,a2,a1
80006ff0:	00b7a223          	sw	a1,4(a5)
80006ff4:	40d70733          	sub	a4,a4,a3
80006ff8:	00e79423          	sh	a4,8(a5)
80006ffc:	00000513          	li	a0,0
80007000:	00008067          	ret
80007004:	00100513          	li	a0,1
80007008:	00008067          	ret

8000700c <pbuf_header>:
8000700c:	0005d663          	bgez	a1,80007018 <pbuf_header+0xc>
80007010:	40b005b3          	neg	a1,a1
80007014:	f99ff06f          	j	80006fac <pbuf_remove_header>
80007018:	00000613          	li	a2,0
8000701c:	e2dff06f          	j	80006e48 <pbuf_add_header_impl>

80007020 <pbuf_header_force>:
80007020:	0005d663          	bgez	a1,8000702c <pbuf_header_force+0xc>
80007024:	40b005b3          	neg	a1,a1
80007028:	f85ff06f          	j	80006fac <pbuf_remove_header>
8000702c:	00100613          	li	a2,1
80007030:	e19ff06f          	j	80006e48 <pbuf_add_header_impl>

80007034 <pbuf_free>:
80007034:	fd010113          	addi	sp,sp,-48
80007038:	02812423          	sw	s0,40(sp)
8000703c:	02112623          	sw	ra,44(sp)
80007040:	02912223          	sw	s1,36(sp)
80007044:	03212023          	sw	s2,32(sp)
80007048:	01312e23          	sw	s3,28(sp)
8000704c:	00000413          	li	s0,0
80007050:	06050463          	beqz	a0,800070b8 <pbuf_free+0x84>
80007054:	00050593          	mv	a1,a0
80007058:	00000413          	li	s0,0
8000705c:	00200913          	li	s2,2
80007060:	00100993          	li	s3,1
80007064:	00b12623          	sw	a1,12(sp)
80007068:	eadfd0ef          	jal	ra,80004f14 <sys_arch_protect>
8000706c:	00c12583          	lw	a1,12(sp)
80007070:	00e5c483          	lbu	s1,14(a1)
80007074:	fff48493          	addi	s1,s1,-1
80007078:	0ff4f493          	andi	s1,s1,255
8000707c:	00958723          	sb	s1,14(a1)
80007080:	e99fd0ef          	jal	ra,80004f18 <sys_arch_unprotect>
80007084:	02049a63          	bnez	s1,800070b8 <pbuf_free+0x84>
80007088:	00c12583          	lw	a1,12(sp)
8000708c:	00d5c783          	lbu	a5,13(a1)
80007090:	0005a483          	lw	s1,0(a1)
80007094:	0027f793          	andi	a5,a5,2
80007098:	04078063          	beqz	a5,800070d8 <pbuf_free+0xa4>
8000709c:	0105a783          	lw	a5,16(a1)
800070a0:	00058513          	mv	a0,a1
800070a4:	000780e7          	jalr	a5
800070a8:	00140413          	addi	s0,s0,1
800070ac:	0ff47413          	andi	s0,s0,255
800070b0:	00048593          	mv	a1,s1
800070b4:	fa0498e3          	bnez	s1,80007064 <pbuf_free+0x30>
800070b8:	00040513          	mv	a0,s0
800070bc:	02c12083          	lw	ra,44(sp)
800070c0:	02812403          	lw	s0,40(sp)
800070c4:	02412483          	lw	s1,36(sp)
800070c8:	02012903          	lw	s2,32(sp)
800070cc:	01c12983          	lw	s3,28(sp)
800070d0:	03010113          	addi	sp,sp,48
800070d4:	00008067          	ret
800070d8:	00c5c783          	lbu	a5,12(a1)
800070dc:	00500513          	li	a0,5
800070e0:	00f7f793          	andi	a5,a5,15
800070e4:	01278663          	beq	a5,s2,800070f0 <pbuf_free+0xbc>
800070e8:	01379863          	bne	a5,s3,800070f8 <pbuf_free+0xc4>
800070ec:	00400513          	li	a0,4
800070f0:	e90ff0ef          	jal	ra,80006780 <memp_free>
800070f4:	fb5ff06f          	j	800070a8 <pbuf_free+0x74>
800070f8:	fa0798e3          	bnez	a5,800070a8 <pbuf_free+0x74>
800070fc:	00058513          	mv	a0,a1
80007100:	d44ff0ef          	jal	ra,80006644 <lwip_free>
80007104:	fa5ff06f          	j	800070a8 <pbuf_free+0x74>

80007108 <pbuf_alloc>:
80007108:	fe010113          	addi	sp,sp,-32
8000710c:	01212823          	sw	s2,16(sp)
80007110:	00112e23          	sw	ra,28(sp)
80007114:	00812c23          	sw	s0,24(sp)
80007118:	00912a23          	sw	s1,20(sp)
8000711c:	01312623          	sw	s3,12(sp)
80007120:	01412423          	sw	s4,8(sp)
80007124:	01512223          	sw	s5,4(sp)
80007128:	01612023          	sw	s6,0(sp)
8000712c:	04100793          	li	a5,65
80007130:	00058913          	mv	s2,a1
80007134:	0cf60263          	beq	a2,a5,800071f8 <pbuf_alloc+0xf0>
80007138:	02c7ee63          	bltu	a5,a2,80007174 <pbuf_alloc+0x6c>
8000713c:	00100793          	li	a5,1
80007140:	0af60c63          	beq	a2,a5,800071f8 <pbuf_alloc+0xf0>
80007144:	00000493          	li	s1,0
80007148:	01c12083          	lw	ra,28(sp)
8000714c:	01812403          	lw	s0,24(sp)
80007150:	00048513          	mv	a0,s1
80007154:	01012903          	lw	s2,16(sp)
80007158:	01412483          	lw	s1,20(sp)
8000715c:	00c12983          	lw	s3,12(sp)
80007160:	00812a03          	lw	s4,8(sp)
80007164:	00412a83          	lw	s5,4(sp)
80007168:	00012b03          	lw	s6,0(sp)
8000716c:	02010113          	addi	sp,sp,32
80007170:	00008067          	ret
80007174:	01051413          	slli	s0,a0,0x10
80007178:	18200793          	li	a5,386
8000717c:	01045413          	srli	s0,s0,0x10
80007180:	0af60463          	beq	a2,a5,80007228 <pbuf_alloc+0x120>
80007184:	28000793          	li	a5,640
80007188:	faf61ee3          	bne	a2,a5,80007144 <pbuf_alloc+0x3c>
8000718c:	00340413          	addi	s0,s0,3
80007190:	00358793          	addi	a5,a1,3
80007194:	ffc47413          	andi	s0,s0,-4
80007198:	ffc7f793          	andi	a5,a5,-4
8000719c:	00f40433          	add	s0,s0,a5
800071a0:	01041413          	slli	s0,s0,0x10
800071a4:	01045413          	srli	s0,s0,0x10
800071a8:	00050993          	mv	s3,a0
800071ac:	01040513          	addi	a0,s0,16
800071b0:	f8f46ae3          	bltu	s0,a5,80007144 <pbuf_alloc+0x3c>
800071b4:	f8f568e3          	bltu	a0,a5,80007144 <pbuf_alloc+0x3c>
800071b8:	c58ff0ef          	jal	ra,80006610 <lwip_malloc>
800071bc:	00050493          	mv	s1,a0
800071c0:	f80504e3          	beqz	a0,80007148 <pbuf_alloc+0x40>
800071c4:	01099993          	slli	s3,s3,0x10
800071c8:	0109d993          	srli	s3,s3,0x10
800071cc:	013509b3          	add	s3,a0,s3
800071d0:	01398993          	addi	s3,s3,19
800071d4:	000107b7          	lui	a5,0x10
800071d8:	ffc9f993          	andi	s3,s3,-4
800071dc:	08078793          	addi	a5,a5,128 # 10080 <_stack_size+0xf880>
800071e0:	00052023          	sw	zero,0(a0)
800071e4:	01352223          	sw	s3,4(a0)
800071e8:	01251423          	sh	s2,8(a0)
800071ec:	01251523          	sh	s2,10(a0)
800071f0:	00f52623          	sw	a5,12(a0)
800071f4:	f55ff06f          	j	80007148 <pbuf_alloc+0x40>
800071f8:	01812403          	lw	s0,24(sp)
800071fc:	01c12083          	lw	ra,28(sp)
80007200:	01412483          	lw	s1,20(sp)
80007204:	00c12983          	lw	s3,12(sp)
80007208:	00812a03          	lw	s4,8(sp)
8000720c:	00412a83          	lw	s5,4(sp)
80007210:	00012b03          	lw	s6,0(sp)
80007214:	00090593          	mv	a1,s2
80007218:	01012903          	lw	s2,16(sp)
8000721c:	00000513          	li	a0,0
80007220:	02010113          	addi	sp,sp,32
80007224:	cb5ff06f          	j	80006ed8 <pbuf_alloc_reference>
80007228:	000109b7          	lui	s3,0x10
8000722c:	00000a13          	li	s4,0
80007230:	00000493          	li	s1,0
80007234:	80003ab7          	lui	s5,0x80003
80007238:	5ec00b13          	li	s6,1516
8000723c:	08298993          	addi	s3,s3,130 # 10082 <_stack_size+0xf882>
80007240:	0f300613          	li	a2,243
80007244:	cc0a8593          	addi	a1,s5,-832 # 80002cc0 <_ram_heap_end+0xffff0cc0>
80007248:	00500513          	li	a0,5
8000724c:	cfcff0ef          	jal	ra,80006748 <memp_malloc_fn>
80007250:	00051a63          	bnez	a0,80007264 <pbuf_alloc+0x15c>
80007254:	ee0488e3          	beqz	s1,80007144 <pbuf_alloc+0x3c>
80007258:	00048513          	mv	a0,s1
8000725c:	dd9ff0ef          	jal	ra,80007034 <pbuf_free>
80007260:	ee5ff06f          	j	80007144 <pbuf_alloc+0x3c>
80007264:	00340793          	addi	a5,s0,3
80007268:	ffc7f793          	andi	a5,a5,-4
8000726c:	40fb07b3          	sub	a5,s6,a5
80007270:	00078713          	mv	a4,a5
80007274:	01079793          	slli	a5,a5,0x10
80007278:	0107d793          	srli	a5,a5,0x10
8000727c:	00f97463          	bgeu	s2,a5,80007284 <pbuf_alloc+0x17c>
80007280:	00090713          	mv	a4,s2
80007284:	00850433          	add	s0,a0,s0
80007288:	01340413          	addi	s0,s0,19
8000728c:	ffc47413          	andi	s0,s0,-4
80007290:	01071793          	slli	a5,a4,0x10
80007294:	00052023          	sw	zero,0(a0)
80007298:	00852223          	sw	s0,4(a0)
8000729c:	01251423          	sh	s2,8(a0)
800072a0:	00e51523          	sh	a4,10(a0)
800072a4:	01352623          	sw	s3,12(a0)
800072a8:	0107d793          	srli	a5,a5,0x10
800072ac:	02048263          	beqz	s1,800072d0 <pbuf_alloc+0x1c8>
800072b0:	00aa2023          	sw	a0,0(s4)
800072b4:	40f90933          	sub	s2,s2,a5
800072b8:	01091913          	slli	s2,s2,0x10
800072bc:	01095913          	srli	s2,s2,0x10
800072c0:	00000413          	li	s0,0
800072c4:	00050a13          	mv	s4,a0
800072c8:	f6091ce3          	bnez	s2,80007240 <pbuf_alloc+0x138>
800072cc:	e7dff06f          	j	80007148 <pbuf_alloc+0x40>
800072d0:	00050493          	mv	s1,a0
800072d4:	fe1ff06f          	j	800072b4 <pbuf_alloc+0x1ac>

800072d8 <pbuf_realloc>:
800072d8:	00855783          	lhu	a5,8(a0)
800072dc:	0af5f463          	bgeu	a1,a5,80007384 <pbuf_realloc+0xac>
800072e0:	ff010113          	addi	sp,sp,-16
800072e4:	00812423          	sw	s0,8(sp)
800072e8:	00912223          	sw	s1,4(sp)
800072ec:	00112623          	sw	ra,12(sp)
800072f0:	00050413          	mv	s0,a0
800072f4:	00058493          	mv	s1,a1
800072f8:	40f587b3          	sub	a5,a1,a5
800072fc:	00a45583          	lhu	a1,10(s0)
80007300:	0695e263          	bltu	a1,s1,80007364 <pbuf_realloc+0x8c>
80007304:	00c44783          	lbu	a5,12(s0)
80007308:	00f7f793          	andi	a5,a5,15
8000730c:	02079663          	bnez	a5,80007338 <pbuf_realloc+0x60>
80007310:	02958463          	beq	a1,s1,80007338 <pbuf_realloc+0x60>
80007314:	00d44783          	lbu	a5,13(s0)
80007318:	0027f793          	andi	a5,a5,2
8000731c:	00079e63          	bnez	a5,80007338 <pbuf_realloc+0x60>
80007320:	00442583          	lw	a1,4(s0)
80007324:	00040513          	mv	a0,s0
80007328:	408585b3          	sub	a1,a1,s0
8000732c:	009585b3          	add	a1,a1,s1
80007330:	adcff0ef          	jal	ra,8000660c <mem_trim>
80007334:	00050413          	mv	s0,a0
80007338:	00042503          	lw	a0,0(s0)
8000733c:	00941523          	sh	s1,10(s0)
80007340:	00941423          	sh	s1,8(s0)
80007344:	00050463          	beqz	a0,8000734c <pbuf_realloc+0x74>
80007348:	cedff0ef          	jal	ra,80007034 <pbuf_free>
8000734c:	00042023          	sw	zero,0(s0)
80007350:	00c12083          	lw	ra,12(sp)
80007354:	00812403          	lw	s0,8(sp)
80007358:	00412483          	lw	s1,4(sp)
8000735c:	01010113          	addi	sp,sp,16
80007360:	00008067          	ret
80007364:	00845703          	lhu	a4,8(s0)
80007368:	40b484b3          	sub	s1,s1,a1
8000736c:	01049493          	slli	s1,s1,0x10
80007370:	00e78733          	add	a4,a5,a4
80007374:	00e41423          	sh	a4,8(s0)
80007378:	0104d493          	srli	s1,s1,0x10
8000737c:	00042403          	lw	s0,0(s0)
80007380:	f7dff06f          	j	800072fc <pbuf_realloc+0x24>
80007384:	00008067          	ret

80007388 <pbuf_free_header>:
80007388:	fe010113          	addi	sp,sp,-32
8000738c:	00812c23          	sw	s0,24(sp)
80007390:	00112e23          	sw	ra,28(sp)
80007394:	00912a23          	sw	s1,20(sp)
80007398:	00050413          	mv	s0,a0
8000739c:	04058263          	beqz	a1,800073e0 <pbuf_free_header+0x58>
800073a0:	04040063          	beqz	s0,800073e0 <pbuf_free_header+0x58>
800073a4:	00a45783          	lhu	a5,10(s0)
800073a8:	02f5e863          	bltu	a1,a5,800073d8 <pbuf_free_header+0x50>
800073ac:	40f585b3          	sub	a1,a1,a5
800073b0:	00042483          	lw	s1,0(s0)
800073b4:	01059593          	slli	a1,a1,0x10
800073b8:	0105d593          	srli	a1,a1,0x10
800073bc:	00042023          	sw	zero,0(s0)
800073c0:	00040513          	mv	a0,s0
800073c4:	00b12623          	sw	a1,12(sp)
800073c8:	c6dff0ef          	jal	ra,80007034 <pbuf_free>
800073cc:	00048413          	mv	s0,s1
800073d0:	00c12583          	lw	a1,12(sp)
800073d4:	fc9ff06f          	j	8000739c <pbuf_free_header+0x14>
800073d8:	00040513          	mv	a0,s0
800073dc:	bd1ff0ef          	jal	ra,80006fac <pbuf_remove_header>
800073e0:	00040513          	mv	a0,s0
800073e4:	01c12083          	lw	ra,28(sp)
800073e8:	01812403          	lw	s0,24(sp)
800073ec:	01412483          	lw	s1,20(sp)
800073f0:	02010113          	addi	sp,sp,32
800073f4:	00008067          	ret

800073f8 <pbuf_clen>:
800073f8:	00000793          	li	a5,0
800073fc:	00051663          	bnez	a0,80007408 <pbuf_clen+0x10>
80007400:	00078513          	mv	a0,a5
80007404:	00008067          	ret
80007408:	00178793          	addi	a5,a5,1
8000740c:	01079793          	slli	a5,a5,0x10
80007410:	0107d793          	srli	a5,a5,0x10
80007414:	00052503          	lw	a0,0(a0)
80007418:	fe5ff06f          	j	800073fc <pbuf_clen+0x4>

8000741c <pbuf_ref>:
8000741c:	02050a63          	beqz	a0,80007450 <pbuf_ref+0x34>
80007420:	ff010113          	addi	sp,sp,-16
80007424:	00812423          	sw	s0,8(sp)
80007428:	00112623          	sw	ra,12(sp)
8000742c:	00050413          	mv	s0,a0
80007430:	ae5fd0ef          	jal	ra,80004f14 <sys_arch_protect>
80007434:	00e44783          	lbu	a5,14(s0)
80007438:	00178793          	addi	a5,a5,1
8000743c:	00f40723          	sb	a5,14(s0)
80007440:	00812403          	lw	s0,8(sp)
80007444:	00c12083          	lw	ra,12(sp)
80007448:	01010113          	addi	sp,sp,16
8000744c:	acdfd06f          	j	80004f18 <sys_arch_unprotect>
80007450:	00008067          	ret

80007454 <pbuf_cat>:
80007454:	02050a63          	beqz	a0,80007488 <pbuf_cat+0x34>
80007458:	00059663          	bnez	a1,80007464 <pbuf_cat+0x10>
8000745c:	00008067          	ret
80007460:	00070513          	mv	a0,a4
80007464:	00855783          	lhu	a5,8(a0)
80007468:	0085d683          	lhu	a3,8(a1)
8000746c:	00052703          	lw	a4,0(a0)
80007470:	00d787b3          	add	a5,a5,a3
80007474:	01079793          	slli	a5,a5,0x10
80007478:	0107d793          	srli	a5,a5,0x10
8000747c:	00f51423          	sh	a5,8(a0)
80007480:	fe0710e3          	bnez	a4,80007460 <pbuf_cat+0xc>
80007484:	00b52023          	sw	a1,0(a0)
80007488:	00008067          	ret

8000748c <pbuf_chain>:
8000748c:	ff010113          	addi	sp,sp,-16
80007490:	00812423          	sw	s0,8(sp)
80007494:	00112623          	sw	ra,12(sp)
80007498:	00058413          	mv	s0,a1
8000749c:	fb9ff0ef          	jal	ra,80007454 <pbuf_cat>
800074a0:	00040513          	mv	a0,s0
800074a4:	00812403          	lw	s0,8(sp)
800074a8:	00c12083          	lw	ra,12(sp)
800074ac:	01010113          	addi	sp,sp,16
800074b0:	f6dff06f          	j	8000741c <pbuf_ref>

800074b4 <pbuf_dechain>:
800074b4:	ff010113          	addi	sp,sp,-16
800074b8:	00112623          	sw	ra,12(sp)
800074bc:	00812423          	sw	s0,8(sp)
800074c0:	00052403          	lw	s0,0(a0)
800074c4:	02040663          	beqz	s0,800074f0 <pbuf_dechain+0x3c>
800074c8:	00855783          	lhu	a5,8(a0)
800074cc:	00a55703          	lhu	a4,10(a0)
800074d0:	40e787b3          	sub	a5,a5,a4
800074d4:	00f41423          	sh	a5,8(s0)
800074d8:	00a55783          	lhu	a5,10(a0)
800074dc:	00052023          	sw	zero,0(a0)
800074e0:	00f51423          	sh	a5,8(a0)
800074e4:	00040513          	mv	a0,s0
800074e8:	b4dff0ef          	jal	ra,80007034 <pbuf_free>
800074ec:	00050463          	beqz	a0,800074f4 <pbuf_dechain+0x40>
800074f0:	00000413          	li	s0,0
800074f4:	00040513          	mv	a0,s0
800074f8:	00c12083          	lw	ra,12(sp)
800074fc:	00812403          	lw	s0,8(sp)
80007500:	01010113          	addi	sp,sp,16
80007504:	00008067          	ret

80007508 <pbuf_copy>:
80007508:	10050463          	beqz	a0,80007610 <pbuf_copy+0x108>
8000750c:	fe010113          	addi	sp,sp,-32
80007510:	00812c23          	sw	s0,24(sp)
80007514:	00112e23          	sw	ra,28(sp)
80007518:	00912a23          	sw	s1,20(sp)
8000751c:	01212823          	sw	s2,16(sp)
80007520:	01312623          	sw	s3,12(sp)
80007524:	01412423          	sw	s4,8(sp)
80007528:	00058413          	mv	s0,a1
8000752c:	06058e63          	beqz	a1,800075a8 <pbuf_copy+0xa0>
80007530:	00855703          	lhu	a4,8(a0)
80007534:	0085d783          	lhu	a5,8(a1)
80007538:	00050493          	mv	s1,a0
8000753c:	06f76663          	bltu	a4,a5,800075a8 <pbuf_copy+0xa0>
80007540:	00000a13          	li	s4,0
80007544:	00000993          	li	s3,0
80007548:	00a4d903          	lhu	s2,10(s1)
8000754c:	00a45783          	lhu	a5,10(s0)
80007550:	41390933          	sub	s2,s2,s3
80007554:	414787b3          	sub	a5,a5,s4
80007558:	0127f463          	bgeu	a5,s2,80007560 <pbuf_copy+0x58>
8000755c:	00078913          	mv	s2,a5
80007560:	0044a503          	lw	a0,4(s1)
80007564:	00442583          	lw	a1,4(s0)
80007568:	00090613          	mv	a2,s2
8000756c:	01350533          	add	a0,a0,s3
80007570:	014585b3          	add	a1,a1,s4
80007574:	4b1060ef          	jal	ra,8000e224 <memcpy>
80007578:	00a45703          	lhu	a4,10(s0)
8000757c:	012a0a33          	add	s4,s4,s2
80007580:	012989b3          	add	s3,s3,s2
80007584:	00a4d783          	lhu	a5,10(s1)
80007588:	00ea6663          	bltu	s4,a4,80007594 <pbuf_copy+0x8c>
8000758c:	00042403          	lw	s0,0(s0)
80007590:	00000a13          	li	s4,0
80007594:	02f99e63          	bne	s3,a5,800075d0 <pbuf_copy+0xc8>
80007598:	0004a483          	lw	s1,0(s1)
8000759c:	02049863          	bnez	s1,800075cc <pbuf_copy+0xc4>
800075a0:	00000513          	li	a0,0
800075a4:	00040463          	beqz	s0,800075ac <pbuf_copy+0xa4>
800075a8:	ff000513          	li	a0,-16
800075ac:	01c12083          	lw	ra,28(sp)
800075b0:	01812403          	lw	s0,24(sp)
800075b4:	01412483          	lw	s1,20(sp)
800075b8:	01012903          	lw	s2,16(sp)
800075bc:	00c12983          	lw	s3,12(sp)
800075c0:	00812a03          	lw	s4,8(sp)
800075c4:	02010113          	addi	sp,sp,32
800075c8:	00008067          	ret
800075cc:	00000993          	li	s3,0
800075d0:	00040c63          	beqz	s0,800075e8 <pbuf_copy+0xe0>
800075d4:	00a45703          	lhu	a4,10(s0)
800075d8:	00845783          	lhu	a5,8(s0)
800075dc:	00f71663          	bne	a4,a5,800075e8 <pbuf_copy+0xe0>
800075e0:	00042783          	lw	a5,0(s0)
800075e4:	02079263          	bnez	a5,80007608 <pbuf_copy+0x100>
800075e8:	00a4d703          	lhu	a4,10(s1)
800075ec:	0084d783          	lhu	a5,8(s1)
800075f0:	00f71663          	bne	a4,a5,800075fc <pbuf_copy+0xf4>
800075f4:	0004a783          	lw	a5,0(s1)
800075f8:	00079863          	bnez	a5,80007608 <pbuf_copy+0x100>
800075fc:	f40416e3          	bnez	s0,80007548 <pbuf_copy+0x40>
80007600:	00000513          	li	a0,0
80007604:	fa9ff06f          	j	800075ac <pbuf_copy+0xa4>
80007608:	ffa00513          	li	a0,-6
8000760c:	fa1ff06f          	j	800075ac <pbuf_copy+0xa4>
80007610:	ff000513          	li	a0,-16
80007614:	00008067          	ret

80007618 <pbuf_copy_partial>:
80007618:	fe010113          	addi	sp,sp,-32
8000761c:	00812c23          	sw	s0,24(sp)
80007620:	00112e23          	sw	ra,28(sp)
80007624:	00912a23          	sw	s1,20(sp)
80007628:	01212823          	sw	s2,16(sp)
8000762c:	01312623          	sw	s3,12(sp)
80007630:	01412423          	sw	s4,8(sp)
80007634:	00000413          	li	s0,0
80007638:	02050063          	beqz	a0,80007658 <pbuf_copy_partial+0x40>
8000763c:	00058a13          	mv	s4,a1
80007640:	00000413          	li	s0,0
80007644:	00058a63          	beqz	a1,80007658 <pbuf_copy_partial+0x40>
80007648:	00050913          	mv	s2,a0
8000764c:	00060493          	mv	s1,a2
80007650:	00048463          	beqz	s1,80007658 <pbuf_copy_partial+0x40>
80007654:	02091463          	bnez	s2,8000767c <pbuf_copy_partial+0x64>
80007658:	00040513          	mv	a0,s0
8000765c:	01c12083          	lw	ra,28(sp)
80007660:	01812403          	lw	s0,24(sp)
80007664:	01412483          	lw	s1,20(sp)
80007668:	01012903          	lw	s2,16(sp)
8000766c:	00c12983          	lw	s3,12(sp)
80007670:	00812a03          	lw	s4,8(sp)
80007674:	02010113          	addi	sp,sp,32
80007678:	00008067          	ret
8000767c:	00a95583          	lhu	a1,10(s2)
80007680:	00068e63          	beqz	a3,8000769c <pbuf_copy_partial+0x84>
80007684:	00b6ec63          	bltu	a3,a1,8000769c <pbuf_copy_partial+0x84>
80007688:	40b686b3          	sub	a3,a3,a1
8000768c:	01069693          	slli	a3,a3,0x10
80007690:	0106d693          	srli	a3,a3,0x10
80007694:	00092903          	lw	s2,0(s2)
80007698:	fb9ff06f          	j	80007650 <pbuf_copy_partial+0x38>
8000769c:	40d585b3          	sub	a1,a1,a3
800076a0:	01059593          	slli	a1,a1,0x10
800076a4:	0105d593          	srli	a1,a1,0x10
800076a8:	00058993          	mv	s3,a1
800076ac:	00b4f463          	bgeu	s1,a1,800076b4 <pbuf_copy_partial+0x9c>
800076b0:	00048993          	mv	s3,s1
800076b4:	00492583          	lw	a1,4(s2)
800076b8:	01099993          	slli	s3,s3,0x10
800076bc:	0109d993          	srli	s3,s3,0x10
800076c0:	00d585b3          	add	a1,a1,a3
800076c4:	008a0533          	add	a0,s4,s0
800076c8:	00098613          	mv	a2,s3
800076cc:	01340433          	add	s0,s0,s3
800076d0:	413484b3          	sub	s1,s1,s3
800076d4:	351060ef          	jal	ra,8000e224 <memcpy>
800076d8:	01041413          	slli	s0,s0,0x10
800076dc:	01049493          	slli	s1,s1,0x10
800076e0:	01045413          	srli	s0,s0,0x10
800076e4:	0104d493          	srli	s1,s1,0x10
800076e8:	00000693          	li	a3,0
800076ec:	fa9ff06f          	j	80007694 <pbuf_copy_partial+0x7c>

800076f0 <pbuf_get_contiguous>:
800076f0:	fe010113          	addi	sp,sp,-32
800076f4:	00112e23          	sw	ra,28(sp)
800076f8:	00812c23          	sw	s0,24(sp)
800076fc:	00912a23          	sw	s1,20(sp)
80007700:	02051063          	bnez	a0,80007720 <pbuf_get_contiguous+0x30>
80007704:	00000413          	li	s0,0
80007708:	00040513          	mv	a0,s0
8000770c:	01c12083          	lw	ra,28(sp)
80007710:	01812403          	lw	s0,24(sp)
80007714:	01412483          	lw	s1,20(sp)
80007718:	02010113          	addi	sp,sp,32
8000771c:	00008067          	ret
80007720:	00058413          	mv	s0,a1
80007724:	fe0580e3          	beqz	a1,80007704 <pbuf_get_contiguous+0x14>
80007728:	00068493          	mv	s1,a3
8000772c:	fcd66ce3          	bltu	a2,a3,80007704 <pbuf_get_contiguous+0x14>
80007730:	00e10613          	addi	a2,sp,14
80007734:	00070593          	mv	a1,a4
80007738:	ee4ff0ef          	jal	ra,80006e1c <pbuf_skip_const>
8000773c:	fc0504e3          	beqz	a0,80007704 <pbuf_get_contiguous+0x14>
80007740:	00e15683          	lhu	a3,14(sp)
80007744:	00a55603          	lhu	a2,10(a0)
80007748:	00968733          	add	a4,a3,s1
8000774c:	00e64863          	blt	a2,a4,8000775c <pbuf_get_contiguous+0x6c>
80007750:	00452403          	lw	s0,4(a0)
80007754:	00d40433          	add	s0,s0,a3
80007758:	fb1ff06f          	j	80007708 <pbuf_get_contiguous+0x18>
8000775c:	00048613          	mv	a2,s1
80007760:	00040593          	mv	a1,s0
80007764:	eb5ff0ef          	jal	ra,80007618 <pbuf_copy_partial>
80007768:	fa9500e3          	beq	a0,s1,80007708 <pbuf_get_contiguous+0x18>
8000776c:	f99ff06f          	j	80007704 <pbuf_get_contiguous+0x14>

80007770 <pbuf_skip>:
80007770:	eacff06f          	j	80006e1c <pbuf_skip_const>

80007774 <pbuf_take>:
80007774:	08050c63          	beqz	a0,8000780c <pbuf_take+0x98>
80007778:	fe010113          	addi	sp,sp,-32
8000777c:	00912a23          	sw	s1,20(sp)
80007780:	01412423          	sw	s4,8(sp)
80007784:	00112e23          	sw	ra,28(sp)
80007788:	00812c23          	sw	s0,24(sp)
8000778c:	01212823          	sw	s2,16(sp)
80007790:	01312623          	sw	s3,12(sp)
80007794:	00050493          	mv	s1,a0
80007798:	00058a13          	mv	s4,a1
8000779c:	ff000513          	li	a0,-16
800077a0:	00058c63          	beqz	a1,800077b8 <pbuf_take+0x44>
800077a4:	0084d783          	lhu	a5,8(s1)
800077a8:	00060413          	mv	s0,a2
800077ac:	fff00513          	li	a0,-1
800077b0:	00000993          	li	s3,0
800077b4:	04c7f663          	bgeu	a5,a2,80007800 <pbuf_take+0x8c>
800077b8:	01c12083          	lw	ra,28(sp)
800077bc:	01812403          	lw	s0,24(sp)
800077c0:	01412483          	lw	s1,20(sp)
800077c4:	01012903          	lw	s2,16(sp)
800077c8:	00c12983          	lw	s3,12(sp)
800077cc:	00812a03          	lw	s4,8(sp)
800077d0:	02010113          	addi	sp,sp,32
800077d4:	00008067          	ret
800077d8:	00a4d903          	lhu	s2,10(s1)
800077dc:	01247463          	bgeu	s0,s2,800077e4 <pbuf_take+0x70>
800077e0:	00040913          	mv	s2,s0
800077e4:	0044a503          	lw	a0,4(s1)
800077e8:	013a05b3          	add	a1,s4,s3
800077ec:	00090613          	mv	a2,s2
800077f0:	235060ef          	jal	ra,8000e224 <memcpy>
800077f4:	0004a483          	lw	s1,0(s1)
800077f8:	41240433          	sub	s0,s0,s2
800077fc:	012989b3          	add	s3,s3,s2
80007800:	fc041ce3          	bnez	s0,800077d8 <pbuf_take+0x64>
80007804:	00000513          	li	a0,0
80007808:	fb1ff06f          	j	800077b8 <pbuf_take+0x44>
8000780c:	ff000513          	li	a0,-16
80007810:	00008067          	ret

80007814 <pbuf_take_at>:
80007814:	fd010113          	addi	sp,sp,-48
80007818:	02812423          	sw	s0,40(sp)
8000781c:	01312e23          	sw	s3,28(sp)
80007820:	00060413          	mv	s0,a2
80007824:	00058993          	mv	s3,a1
80007828:	00e10613          	addi	a2,sp,14
8000782c:	00068593          	mv	a1,a3
80007830:	02112623          	sw	ra,44(sp)
80007834:	02912223          	sw	s1,36(sp)
80007838:	03212023          	sw	s2,32(sp)
8000783c:	de0ff0ef          	jal	ra,80006e1c <pbuf_skip_const>
80007840:	08050263          	beqz	a0,800078c4 <pbuf_take_at+0xb0>
80007844:	00e15703          	lhu	a4,14(sp)
80007848:	00855683          	lhu	a3,8(a0)
8000784c:	00050493          	mv	s1,a0
80007850:	008707b3          	add	a5,a4,s0
80007854:	fff00513          	li	a0,-1
80007858:	04f6c863          	blt	a3,a5,800078a8 <pbuf_take_at+0x94>
8000785c:	00a4d783          	lhu	a5,10(s1)
80007860:	00040913          	mv	s2,s0
80007864:	40e787b3          	sub	a5,a5,a4
80007868:	0087d663          	bge	a5,s0,80007874 <pbuf_take_at+0x60>
8000786c:	01079913          	slli	s2,a5,0x10
80007870:	01095913          	srli	s2,s2,0x10
80007874:	0044a503          	lw	a0,4(s1)
80007878:	00090613          	mv	a2,s2
8000787c:	00098593          	mv	a1,s3
80007880:	00e50533          	add	a0,a0,a4
80007884:	1a1060ef          	jal	ra,8000e224 <memcpy>
80007888:	41240633          	sub	a2,s0,s2
8000788c:	01061613          	slli	a2,a2,0x10
80007890:	01065613          	srli	a2,a2,0x10
80007894:	00000513          	li	a0,0
80007898:	00060863          	beqz	a2,800078a8 <pbuf_take_at+0x94>
8000789c:	0004a503          	lw	a0,0(s1)
800078a0:	012985b3          	add	a1,s3,s2
800078a4:	ed1ff0ef          	jal	ra,80007774 <pbuf_take>
800078a8:	02c12083          	lw	ra,44(sp)
800078ac:	02812403          	lw	s0,40(sp)
800078b0:	02412483          	lw	s1,36(sp)
800078b4:	02012903          	lw	s2,32(sp)
800078b8:	01c12983          	lw	s3,28(sp)
800078bc:	03010113          	addi	sp,sp,48
800078c0:	00008067          	ret
800078c4:	fff00513          	li	a0,-1
800078c8:	fe1ff06f          	j	800078a8 <pbuf_take_at+0x94>

800078cc <pbuf_clone>:
800078cc:	ff010113          	addi	sp,sp,-16
800078d0:	00912223          	sw	s1,4(sp)
800078d4:	00060493          	mv	s1,a2
800078d8:	00058613          	mv	a2,a1
800078dc:	0084d583          	lhu	a1,8(s1)
800078e0:	00812423          	sw	s0,8(sp)
800078e4:	00112623          	sw	ra,12(sp)
800078e8:	821ff0ef          	jal	ra,80007108 <pbuf_alloc>
800078ec:	00050413          	mv	s0,a0
800078f0:	00050663          	beqz	a0,800078fc <pbuf_clone+0x30>
800078f4:	00048593          	mv	a1,s1
800078f8:	c11ff0ef          	jal	ra,80007508 <pbuf_copy>
800078fc:	00040513          	mv	a0,s0
80007900:	00c12083          	lw	ra,12(sp)
80007904:	00812403          	lw	s0,8(sp)
80007908:	00412483          	lw	s1,4(sp)
8000790c:	01010113          	addi	sp,sp,16
80007910:	00008067          	ret

80007914 <pbuf_coalesce>:
80007914:	ff010113          	addi	sp,sp,-16
80007918:	00812423          	sw	s0,8(sp)
8000791c:	00112623          	sw	ra,12(sp)
80007920:	00912223          	sw	s1,4(sp)
80007924:	00052783          	lw	a5,0(a0)
80007928:	00050413          	mv	s0,a0
8000792c:	02079063          	bnez	a5,8000794c <pbuf_coalesce+0x38>
80007930:	00040493          	mv	s1,s0
80007934:	00c12083          	lw	ra,12(sp)
80007938:	00812403          	lw	s0,8(sp)
8000793c:	00048513          	mv	a0,s1
80007940:	00412483          	lw	s1,4(sp)
80007944:	01010113          	addi	sp,sp,16
80007948:	00008067          	ret
8000794c:	00058513          	mv	a0,a1
80007950:	00040613          	mv	a2,s0
80007954:	28000593          	li	a1,640
80007958:	f75ff0ef          	jal	ra,800078cc <pbuf_clone>
8000795c:	00050493          	mv	s1,a0
80007960:	fc0508e3          	beqz	a0,80007930 <pbuf_coalesce+0x1c>
80007964:	00040513          	mv	a0,s0
80007968:	eccff0ef          	jal	ra,80007034 <pbuf_free>
8000796c:	fc9ff06f          	j	80007934 <pbuf_coalesce+0x20>

80007970 <pbuf_try_get_at>:
80007970:	fe010113          	addi	sp,sp,-32
80007974:	00e10613          	addi	a2,sp,14
80007978:	00112e23          	sw	ra,28(sp)
8000797c:	ca0ff0ef          	jal	ra,80006e1c <pbuf_skip_const>
80007980:	fff00793          	li	a5,-1
80007984:	02050063          	beqz	a0,800079a4 <pbuf_try_get_at+0x34>
80007988:	00e15703          	lhu	a4,14(sp)
8000798c:	00a55683          	lhu	a3,10(a0)
80007990:	fff00793          	li	a5,-1
80007994:	00d77863          	bgeu	a4,a3,800079a4 <pbuf_try_get_at+0x34>
80007998:	00452783          	lw	a5,4(a0)
8000799c:	00e787b3          	add	a5,a5,a4
800079a0:	0007c783          	lbu	a5,0(a5)
800079a4:	01c12083          	lw	ra,28(sp)
800079a8:	00078513          	mv	a0,a5
800079ac:	02010113          	addi	sp,sp,32
800079b0:	00008067          	ret

800079b4 <pbuf_get_at>:
800079b4:	ff010113          	addi	sp,sp,-16
800079b8:	00112623          	sw	ra,12(sp)
800079bc:	fb5ff0ef          	jal	ra,80007970 <pbuf_try_get_at>
800079c0:	00055463          	bgez	a0,800079c8 <pbuf_get_at+0x14>
800079c4:	00000513          	li	a0,0
800079c8:	00c12083          	lw	ra,12(sp)
800079cc:	0ff57513          	andi	a0,a0,255
800079d0:	01010113          	addi	sp,sp,16
800079d4:	00008067          	ret

800079d8 <pbuf_put_at>:
800079d8:	fe010113          	addi	sp,sp,-32
800079dc:	00812c23          	sw	s0,24(sp)
800079e0:	00060413          	mv	s0,a2
800079e4:	00e10613          	addi	a2,sp,14
800079e8:	00112e23          	sw	ra,28(sp)
800079ec:	c30ff0ef          	jal	ra,80006e1c <pbuf_skip_const>
800079f0:	00050e63          	beqz	a0,80007a0c <pbuf_put_at+0x34>
800079f4:	00e15703          	lhu	a4,14(sp)
800079f8:	00a55783          	lhu	a5,10(a0)
800079fc:	00f77863          	bgeu	a4,a5,80007a0c <pbuf_put_at+0x34>
80007a00:	00452783          	lw	a5,4(a0)
80007a04:	00e787b3          	add	a5,a5,a4
80007a08:	00878023          	sb	s0,0(a5)
80007a0c:	01c12083          	lw	ra,28(sp)
80007a10:	01812403          	lw	s0,24(sp)
80007a14:	02010113          	addi	sp,sp,32
80007a18:	00008067          	ret

80007a1c <pbuf_memcmp>:
80007a1c:	00855703          	lhu	a4,8(a0)
80007a20:	00d587b3          	add	a5,a1,a3
80007a24:	00f75863          	bge	a4,a5,80007a34 <pbuf_memcmp+0x18>
80007a28:	00010537          	lui	a0,0x10
80007a2c:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xf7ff>
80007a30:	00008067          	ret
80007a34:	fd010113          	addi	sp,sp,-48
80007a38:	02812423          	sw	s0,40(sp)
80007a3c:	02912223          	sw	s1,36(sp)
80007a40:	02112623          	sw	ra,44(sp)
80007a44:	03212023          	sw	s2,32(sp)
80007a48:	01312e23          	sw	s3,28(sp)
80007a4c:	00050493          	mv	s1,a0
80007a50:	00058413          	mv	s0,a1
80007a54:	00a4d783          	lhu	a5,10(s1)
80007a58:	00f46c63          	bltu	s0,a5,80007a70 <pbuf_memcmp+0x54>
80007a5c:	0004a483          	lw	s1,0(s1)
80007a60:	40f40433          	sub	s0,s0,a5
80007a64:	01041413          	slli	s0,s0,0x10
80007a68:	01045413          	srli	s0,s0,0x10
80007a6c:	fe0494e3          	bnez	s1,80007a54 <pbuf_memcmp+0x38>
80007a70:	00000993          	li	s3,0
80007a74:	01099913          	slli	s2,s3,0x10
80007a78:	01095913          	srli	s2,s2,0x10
80007a7c:	00d96663          	bltu	s2,a3,80007a88 <pbuf_memcmp+0x6c>
80007a80:	00000513          	li	a0,0
80007a84:	0580006f          	j	80007adc <pbuf_memcmp+0xc0>
80007a88:	008905b3          	add	a1,s2,s0
80007a8c:	01059593          	slli	a1,a1,0x10
80007a90:	0105d593          	srli	a1,a1,0x10
80007a94:	00048513          	mv	a0,s1
80007a98:	00d12623          	sw	a3,12(sp)
80007a9c:	00c12423          	sw	a2,8(sp)
80007aa0:	f15ff0ef          	jal	ra,800079b4 <pbuf_get_at>
80007aa4:	00812603          	lw	a2,8(sp)
80007aa8:	00198993          	addi	s3,s3,1
80007aac:	00c12683          	lw	a3,12(sp)
80007ab0:	013607b3          	add	a5,a2,s3
80007ab4:	fff7c783          	lbu	a5,-1(a5)
80007ab8:	faa78ee3          	beq	a5,a0,80007a74 <pbuf_memcmp+0x58>
80007abc:	000107b7          	lui	a5,0x10
80007ac0:	ffe78793          	addi	a5,a5,-2 # fffe <_stack_size+0xf7fe>
80007ac4:	00090513          	mv	a0,s2
80007ac8:	0127f463          	bgeu	a5,s2,80007ad0 <pbuf_memcmp+0xb4>
80007acc:	ffe00513          	li	a0,-2
80007ad0:	00150513          	addi	a0,a0,1
80007ad4:	01051513          	slli	a0,a0,0x10
80007ad8:	01055513          	srli	a0,a0,0x10
80007adc:	02c12083          	lw	ra,44(sp)
80007ae0:	02812403          	lw	s0,40(sp)
80007ae4:	02412483          	lw	s1,36(sp)
80007ae8:	02012903          	lw	s2,32(sp)
80007aec:	01c12983          	lw	s3,28(sp)
80007af0:	03010113          	addi	sp,sp,48
80007af4:	00008067          	ret

80007af8 <pbuf_memfind>:
80007af8:	fe010113          	addi	sp,sp,-32
80007afc:	00112e23          	sw	ra,28(sp)
80007b00:	00812c23          	sw	s0,24(sp)
80007b04:	00912a23          	sw	s1,20(sp)
80007b08:	01212823          	sw	s2,16(sp)
80007b0c:	01312623          	sw	s3,12(sp)
80007b10:	01412423          	sw	s4,8(sp)
80007b14:	00855783          	lhu	a5,8(a0)
80007b18:	00d60733          	add	a4,a2,a3
80007b1c:	02e7c263          	blt	a5,a4,80007b40 <pbuf_memfind+0x48>
80007b20:	40c787b3          	sub	a5,a5,a2
80007b24:	01079493          	slli	s1,a5,0x10
80007b28:	00050993          	mv	s3,a0
80007b2c:	00058a13          	mv	s4,a1
80007b30:	00060913          	mv	s2,a2
80007b34:	00068413          	mv	s0,a3
80007b38:	0104d493          	srli	s1,s1,0x10
80007b3c:	0284f863          	bgeu	s1,s0,80007b6c <pbuf_memfind+0x74>
80007b40:	00010437          	lui	s0,0x10
80007b44:	fff40413          	addi	s0,s0,-1 # ffff <_stack_size+0xf7ff>
80007b48:	00040513          	mv	a0,s0
80007b4c:	01c12083          	lw	ra,28(sp)
80007b50:	01812403          	lw	s0,24(sp)
80007b54:	01412483          	lw	s1,20(sp)
80007b58:	01012903          	lw	s2,16(sp)
80007b5c:	00c12983          	lw	s3,12(sp)
80007b60:	00812a03          	lw	s4,8(sp)
80007b64:	02010113          	addi	sp,sp,32
80007b68:	00008067          	ret
80007b6c:	00090693          	mv	a3,s2
80007b70:	000a0613          	mv	a2,s4
80007b74:	00040593          	mv	a1,s0
80007b78:	00098513          	mv	a0,s3
80007b7c:	ea1ff0ef          	jal	ra,80007a1c <pbuf_memcmp>
80007b80:	fc0504e3          	beqz	a0,80007b48 <pbuf_memfind+0x50>
80007b84:	00140413          	addi	s0,s0,1
80007b88:	01041413          	slli	s0,s0,0x10
80007b8c:	01045413          	srli	s0,s0,0x10
80007b90:	fadff06f          	j	80007b3c <pbuf_memfind+0x44>

80007b94 <pbuf_strstr>:
80007b94:	fe010113          	addi	sp,sp,-32
80007b98:	00812c23          	sw	s0,24(sp)
80007b9c:	01212823          	sw	s2,16(sp)
80007ba0:	00112e23          	sw	ra,28(sp)
80007ba4:	00010937          	lui	s2,0x10
80007ba8:	00912a23          	sw	s1,20(sp)
80007bac:	fff90413          	addi	s0,s2,-1 # ffff <_stack_size+0xf7ff>
80007bb0:	04058c63          	beqz	a1,80007c08 <pbuf_strstr+0x74>
80007bb4:	0005c783          	lbu	a5,0(a1)
80007bb8:	04078863          	beqz	a5,80007c08 <pbuf_strstr+0x74>
80007bbc:	00855783          	lhu	a5,8(a0)
80007bc0:	04878663          	beq	a5,s0,80007c0c <pbuf_strstr+0x78>
80007bc4:	00050493          	mv	s1,a0
80007bc8:	00058513          	mv	a0,a1
80007bcc:	00b12623          	sw	a1,12(sp)
80007bd0:	ffe90913          	addi	s2,s2,-2
80007bd4:	02c070ef          	jal	ra,8000ec00 <strlen>
80007bd8:	02a96863          	bltu	s2,a0,80007c08 <pbuf_strstr+0x74>
80007bdc:	01812403          	lw	s0,24(sp)
80007be0:	01051613          	slli	a2,a0,0x10
80007be4:	00c12583          	lw	a1,12(sp)
80007be8:	01c12083          	lw	ra,28(sp)
80007bec:	01012903          	lw	s2,16(sp)
80007bf0:	00048513          	mv	a0,s1
80007bf4:	01412483          	lw	s1,20(sp)
80007bf8:	00000693          	li	a3,0
80007bfc:	01065613          	srli	a2,a2,0x10
80007c00:	02010113          	addi	sp,sp,32
80007c04:	ef5ff06f          	j	80007af8 <pbuf_memfind>
80007c08:	00040793          	mv	a5,s0
80007c0c:	01c12083          	lw	ra,28(sp)
80007c10:	01812403          	lw	s0,24(sp)
80007c14:	01412483          	lw	s1,20(sp)
80007c18:	01012903          	lw	s2,16(sp)
80007c1c:	00078513          	mv	a0,a5
80007c20:	02010113          	addi	sp,sp,32
80007c24:	00008067          	ret

80007c28 <raw_input>:
80007c28:	fd010113          	addi	sp,sp,-48
80007c2c:	02912223          	sw	s1,36(sp)
80007c30:	9f418793          	addi	a5,gp,-1548 # 80003274 <ip_data>
80007c34:	02812423          	sw	s0,40(sp)
80007c38:	03212023          	sw	s2,32(sp)
80007c3c:	01312e23          	sw	s3,28(sp)
80007c40:	01412c23          	sw	s4,24(sp)
80007c44:	01512a23          	sw	s5,20(sp)
80007c48:	01612823          	sw	s6,16(sp)
80007c4c:	01712623          	sw	s7,12(sp)
80007c50:	02112623          	sw	ra,44(sp)
80007c54:	00050a13          	mv	s4,a0
80007c58:	0007a583          	lw	a1,0(a5)
80007c5c:	0147a503          	lw	a0,20(a5)
80007c60:	00000993          	li	s3,0
80007c64:	9f418493          	addi	s1,gp,-1548 # 80003274 <ip_data>
80007c68:	179040ef          	jal	ra,8000c5e0 <ip4_addr_isbroadcast_u32>
80007c6c:	004a2783          	lw	a5,4(s4)
80007c70:	00050b13          	mv	s6,a0
80007c74:	0097ca83          	lbu	s5,9(a5)
80007c78:	8d81a403          	lw	s0,-1832(gp) # 80003158 <raw_pcbs>
80007c7c:	00000513          	li	a0,0
80007c80:	00078913          	mv	s2,a5
80007c84:	08040a63          	beqz	s0,80007d18 <raw_input+0xf0>
80007c88:	01444783          	lbu	a5,20(s0)
80007c8c:	0d579463          	bne	a5,s5,80007d54 <raw_input+0x12c>
80007c90:	00844703          	lbu	a4,8(s0)
80007c94:	00070c63          	beqz	a4,80007cac <raw_input+0x84>
80007c98:	0044a783          	lw	a5,4(s1)
80007c9c:	0387c783          	lbu	a5,56(a5)
80007ca0:	00178793          	addi	a5,a5,1
80007ca4:	0ff7f793          	andi	a5,a5,255
80007ca8:	0af71663          	bne	a4,a5,80007d54 <raw_input+0x12c>
80007cac:	080b0c63          	beqz	s6,80007d44 <raw_input+0x11c>
80007cb0:	00944783          	lbu	a5,9(s0)
80007cb4:	0207f793          	andi	a5,a5,32
80007cb8:	08078e63          	beqz	a5,80007d54 <raw_input+0x12c>
80007cbc:	00042783          	lw	a5,0(s0)
80007cc0:	08079a63          	bnez	a5,80007d54 <raw_input+0x12c>
80007cc4:	01544783          	lbu	a5,21(s0)
80007cc8:	0017f793          	andi	a5,a5,1
80007ccc:	00078863          	beqz	a5,80007cdc <raw_input+0xb4>
80007cd0:	00442703          	lw	a4,4(s0)
80007cd4:	0104a783          	lw	a5,16(s1)
80007cd8:	06f71e63          	bne	a4,a5,80007d54 <raw_input+0x12c>
80007cdc:	01842783          	lw	a5,24(s0)
80007ce0:	06078a63          	beqz	a5,80007d54 <raw_input+0x12c>
80007ce4:	01c42503          	lw	a0,28(s0)
80007ce8:	a0418693          	addi	a3,gp,-1532 # 80003284 <ip_data+0x10>
80007cec:	000a0613          	mv	a2,s4
80007cf0:	00040593          	mv	a1,s0
80007cf4:	000780e7          	jalr	a5
80007cf8:	06050463          	beqz	a0,80007d60 <raw_input+0x138>
80007cfc:	00100513          	li	a0,1
80007d00:	00098c63          	beqz	s3,80007d18 <raw_input+0xf0>
80007d04:	01042783          	lw	a5,16(s0)
80007d08:	00f9a823          	sw	a5,16(s3)
80007d0c:	8d81a783          	lw	a5,-1832(gp) # 80003158 <raw_pcbs>
80007d10:	8c81ac23          	sw	s0,-1832(gp) # 80003158 <raw_pcbs>
80007d14:	00f42823          	sw	a5,16(s0)
80007d18:	02c12083          	lw	ra,44(sp)
80007d1c:	02812403          	lw	s0,40(sp)
80007d20:	02412483          	lw	s1,36(sp)
80007d24:	02012903          	lw	s2,32(sp)
80007d28:	01c12983          	lw	s3,28(sp)
80007d2c:	01812a03          	lw	s4,24(sp)
80007d30:	01412a83          	lw	s5,20(sp)
80007d34:	01012b03          	lw	s6,16(sp)
80007d38:	00c12b83          	lw	s7,12(sp)
80007d3c:	03010113          	addi	sp,sp,48
80007d40:	00008067          	ret
80007d44:	00042783          	lw	a5,0(s0)
80007d48:	f6078ee3          	beqz	a5,80007cc4 <raw_input+0x9c>
80007d4c:	0144a703          	lw	a4,20(s1)
80007d50:	f6e78ae3          	beq	a5,a4,80007cc4 <raw_input+0x9c>
80007d54:	00040993          	mv	s3,s0
80007d58:	01042403          	lw	s0,16(s0)
80007d5c:	f29ff06f          	j	80007c84 <raw_input+0x5c>
80007d60:	00200513          	li	a0,2
80007d64:	ff1ff06f          	j	80007d54 <raw_input+0x12c>

80007d68 <raw_bind>:
80007d68:	ffa00793          	li	a5,-6
80007d6c:	00050a63          	beqz	a0,80007d80 <raw_bind+0x18>
80007d70:	00058863          	beqz	a1,80007d80 <raw_bind+0x18>
80007d74:	0005a783          	lw	a5,0(a1)
80007d78:	00f52023          	sw	a5,0(a0)
80007d7c:	00000793          	li	a5,0
80007d80:	00078513          	mv	a0,a5
80007d84:	00008067          	ret

80007d88 <raw_bind_netif>:
80007d88:	00000793          	li	a5,0
80007d8c:	00058863          	beqz	a1,80007d9c <raw_bind_netif+0x14>
80007d90:	0385c783          	lbu	a5,56(a1)
80007d94:	00178793          	addi	a5,a5,1
80007d98:	0ff7f793          	andi	a5,a5,255
80007d9c:	00f50423          	sb	a5,8(a0)
80007da0:	00008067          	ret

80007da4 <raw_connect>:
80007da4:	00050793          	mv	a5,a0
80007da8:	ffa00513          	li	a0,-6
80007dac:	02078263          	beqz	a5,80007dd0 <raw_connect+0x2c>
80007db0:	02058063          	beqz	a1,80007dd0 <raw_connect+0x2c>
80007db4:	0005a703          	lw	a4,0(a1)
80007db8:	00000513          	li	a0,0
80007dbc:	00e7a223          	sw	a4,4(a5)
80007dc0:	0157c703          	lbu	a4,21(a5)
80007dc4:	00176713          	ori	a4,a4,1
80007dc8:	00e78aa3          	sb	a4,21(a5)
80007dcc:	00008067          	ret
80007dd0:	00008067          	ret

80007dd4 <raw_disconnect>:
80007dd4:	01554783          	lbu	a5,21(a0)
80007dd8:	00052223          	sw	zero,4(a0)
80007ddc:	00050423          	sb	zero,8(a0)
80007de0:	ffe7f793          	andi	a5,a5,-2
80007de4:	00f50aa3          	sb	a5,21(a0)
80007de8:	00008067          	ret

80007dec <raw_recv>:
80007dec:	00b52c23          	sw	a1,24(a0)
80007df0:	00c52e23          	sw	a2,28(a0)
80007df4:	00008067          	ret

80007df8 <raw_sendto_if_src>:
80007df8:	fe010113          	addi	sp,sp,-32
80007dfc:	00112e23          	sw	ra,28(sp)
80007e00:	00812c23          	sw	s0,24(sp)
80007e04:	00912a23          	sw	s1,20(sp)
80007e08:	01212823          	sw	s2,16(sp)
80007e0c:	01312623          	sw	s3,12(sp)
80007e10:	01412423          	sw	s4,8(sp)
80007e14:	01512223          	sw	s5,4(sp)
80007e18:	00051663          	bnez	a0,80007e24 <raw_sendto_if_src+0x2c>
80007e1c:	ffa00493          	li	s1,-6
80007e20:	06c0006f          	j	80007e8c <raw_sendto_if_src+0x94>
80007e24:	fe060ce3          	beqz	a2,80007e1c <raw_sendto_if_src+0x24>
80007e28:	fe068ae3          	beqz	a3,80007e1c <raw_sendto_if_src+0x24>
80007e2c:	fe0708e3          	beqz	a4,80007e1c <raw_sendto_if_src+0x24>
80007e30:	01554783          	lbu	a5,21(a0)
80007e34:	00070a13          	mv	s4,a4
80007e38:	00068913          	mv	s2,a3
80007e3c:	0027f793          	andi	a5,a5,2
80007e40:	00060a93          	mv	s5,a2
80007e44:	00058413          	mv	s0,a1
80007e48:	00050493          	mv	s1,a0
80007e4c:	06078463          	beqz	a5,80007eb4 <raw_sendto_if_src+0xbc>
80007e50:	00a5d703          	lhu	a4,10(a1)
80007e54:	01300793          	li	a5,19
80007e58:	fce7f2e3          	bgeu	a5,a4,80007e1c <raw_sendto_if_src+0x24>
80007e5c:	00c50493          	addi	s1,a0,12
80007e60:	0296ae23          	sw	s1,60(a3)
80007e64:	00068813          	mv	a6,a3
80007e68:	00000793          	li	a5,0
80007e6c:	00000713          	li	a4,0
80007e70:	00000693          	li	a3,0
80007e74:	00000613          	li	a2,0
80007e78:	000a0593          	mv	a1,s4
80007e7c:	00040513          	mv	a0,s0
80007e80:	634040ef          	jal	ra,8000c4b4 <ip4_output_if>
80007e84:	00050493          	mv	s1,a0
80007e88:	02092e23          	sw	zero,60(s2)
80007e8c:	01c12083          	lw	ra,28(sp)
80007e90:	01812403          	lw	s0,24(sp)
80007e94:	00048513          	mv	a0,s1
80007e98:	01012903          	lw	s2,16(sp)
80007e9c:	01412483          	lw	s1,20(sp)
80007ea0:	00c12983          	lw	s3,12(sp)
80007ea4:	00812a03          	lw	s4,8(sp)
80007ea8:	00412a83          	lw	s5,4(sp)
80007eac:	02010113          	addi	sp,sp,32
80007eb0:	00008067          	ret
80007eb4:	0085d703          	lhu	a4,8(a1)
80007eb8:	000107b7          	lui	a5,0x10
80007ebc:	feb78793          	addi	a5,a5,-21 # ffeb <_stack_size+0xf7eb>
80007ec0:	00e7f663          	bgeu	a5,a4,80007ecc <raw_sendto_if_src+0xd4>
80007ec4:	fff00493          	li	s1,-1
80007ec8:	fc5ff06f          	j	80007e8c <raw_sendto_if_src+0x94>
80007ecc:	01400593          	li	a1,20
80007ed0:	00040513          	mv	a0,s0
80007ed4:	8c8ff0ef          	jal	ra,80006f9c <pbuf_add_header>
80007ed8:	04050c63          	beqz	a0,80007f30 <raw_sendto_if_src+0x138>
80007edc:	28000613          	li	a2,640
80007ee0:	00000593          	li	a1,0
80007ee4:	02400513          	li	a0,36
80007ee8:	a20ff0ef          	jal	ra,80007108 <pbuf_alloc>
80007eec:	00050993          	mv	s3,a0
80007ef0:	fc050ae3          	beqz	a0,80007ec4 <raw_sendto_if_src+0xcc>
80007ef4:	00845783          	lhu	a5,8(s0)
80007ef8:	00078663          	beqz	a5,80007f04 <raw_sendto_if_src+0x10c>
80007efc:	00040593          	mv	a1,s0
80007f00:	d8cff0ef          	jal	ra,8000748c <pbuf_chain>
80007f04:	0094c783          	lbu	a5,9(s1)
80007f08:	0207f793          	andi	a5,a5,32
80007f0c:	02079e63          	bnez	a5,80007f48 <raw_sendto_if_src+0x150>
80007f10:	000aa503          	lw	a0,0(s5)
80007f14:	00090593          	mv	a1,s2
80007f18:	6c8040ef          	jal	ra,8000c5e0 <ip4_addr_isbroadcast_u32>
80007f1c:	02050663          	beqz	a0,80007f48 <raw_sendto_if_src+0x150>
80007f20:	ef340ee3          	beq	s0,s3,80007e1c <raw_sendto_if_src+0x24>
80007f24:	00098513          	mv	a0,s3
80007f28:	90cff0ef          	jal	ra,80007034 <pbuf_free>
80007f2c:	ef1ff06f          	j	80007e1c <raw_sendto_if_src+0x24>
80007f30:	01400593          	li	a1,20
80007f34:	00040513          	mv	a0,s0
80007f38:	874ff0ef          	jal	ra,80006fac <pbuf_remove_header>
80007f3c:	f80514e3          	bnez	a0,80007ec4 <raw_sendto_if_src+0xcc>
80007f40:	00040993          	mv	s3,s0
80007f44:	fc1ff06f          	j	80007f04 <raw_sendto_if_src+0x10c>
80007f48:	00c48793          	addi	a5,s1,12
80007f4c:	00b4c683          	lbu	a3,11(s1)
80007f50:	02f92e23          	sw	a5,60(s2)
80007f54:	0144c783          	lbu	a5,20(s1)
80007f58:	00a4c703          	lbu	a4,10(s1)
80007f5c:	00090813          	mv	a6,s2
80007f60:	000a8613          	mv	a2,s5
80007f64:	000a0593          	mv	a1,s4
80007f68:	00098513          	mv	a0,s3
80007f6c:	548040ef          	jal	ra,8000c4b4 <ip4_output_if>
80007f70:	02092e23          	sw	zero,60(s2)
80007f74:	00050493          	mv	s1,a0
80007f78:	f1340ae3          	beq	s0,s3,80007e8c <raw_sendto_if_src+0x94>
80007f7c:	00098513          	mv	a0,s3
80007f80:	8b4ff0ef          	jal	ra,80007034 <pbuf_free>
80007f84:	f09ff06f          	j	80007e8c <raw_sendto_if_src+0x94>

80007f88 <raw_sendto>:
80007f88:	08050663          	beqz	a0,80008014 <raw_sendto+0x8c>
80007f8c:	08060463          	beqz	a2,80008014 <raw_sendto+0x8c>
80007f90:	ff010113          	addi	sp,sp,-16
80007f94:	00812423          	sw	s0,8(sp)
80007f98:	00912223          	sw	s1,4(sp)
80007f9c:	01212023          	sw	s2,0(sp)
80007fa0:	00112623          	sw	ra,12(sp)
80007fa4:	00050413          	mv	s0,a0
80007fa8:	00854503          	lbu	a0,8(a0)
80007fac:	00060493          	mv	s1,a2
80007fb0:	00058913          	mv	s2,a1
80007fb4:	04050663          	beqz	a0,80008000 <raw_sendto+0x78>
80007fb8:	d41fe0ef          	jal	ra,80006cf8 <netif_get_by_index>
80007fbc:	06050063          	beqz	a0,8000801c <raw_sendto+0x94>
80007fc0:	00042783          	lw	a5,0(s0)
80007fc4:	04078463          	beqz	a5,8000800c <raw_sendto+0x84>
80007fc8:	0f07f793          	andi	a5,a5,240
80007fcc:	0e000713          	li	a4,224
80007fd0:	02e78e63          	beq	a5,a4,8000800c <raw_sendto+0x84>
80007fd4:	00040713          	mv	a4,s0
80007fd8:	00050693          	mv	a3,a0
80007fdc:	00040513          	mv	a0,s0
80007fe0:	00812403          	lw	s0,8(sp)
80007fe4:	00c12083          	lw	ra,12(sp)
80007fe8:	00048613          	mv	a2,s1
80007fec:	00090593          	mv	a1,s2
80007ff0:	00412483          	lw	s1,4(sp)
80007ff4:	00012903          	lw	s2,0(sp)
80007ff8:	01010113          	addi	sp,sp,16
80007ffc:	dfdff06f          	j	80007df8 <raw_sendto_if_src>
80008000:	00060513          	mv	a0,a2
80008004:	619030ef          	jal	ra,8000be1c <ip4_route>
80008008:	fb5ff06f          	j	80007fbc <raw_sendto+0x34>
8000800c:	00450713          	addi	a4,a0,4
80008010:	fc9ff06f          	j	80007fd8 <raw_sendto+0x50>
80008014:	ffa00513          	li	a0,-6
80008018:	00008067          	ret
8000801c:	00c12083          	lw	ra,12(sp)
80008020:	00812403          	lw	s0,8(sp)
80008024:	00412483          	lw	s1,4(sp)
80008028:	00012903          	lw	s2,0(sp)
8000802c:	ffc00513          	li	a0,-4
80008030:	01010113          	addi	sp,sp,16
80008034:	00008067          	ret

80008038 <raw_send>:
80008038:	00450613          	addi	a2,a0,4
8000803c:	f4dff06f          	j	80007f88 <raw_sendto>

80008040 <raw_remove>:
80008040:	8d81a783          	lw	a5,-1832(gp) # 80003158 <raw_pcbs>
80008044:	00050593          	mv	a1,a0
80008048:	00a79c63          	bne	a5,a0,80008060 <raw_remove+0x20>
8000804c:	01052783          	lw	a5,16(a0)
80008050:	8cf1ac23          	sw	a5,-1832(gp) # 80003158 <raw_pcbs>
80008054:	00000513          	li	a0,0
80008058:	f28fe06f          	j	80006780 <memp_free>
8000805c:	00070793          	mv	a5,a4
80008060:	fe078ae3          	beqz	a5,80008054 <raw_remove+0x14>
80008064:	0107a703          	lw	a4,16(a5)
80008068:	fe0706e3          	beqz	a4,80008054 <raw_remove+0x14>
8000806c:	feb718e3          	bne	a4,a1,8000805c <raw_remove+0x1c>
80008070:	0105a703          	lw	a4,16(a1)
80008074:	00e7a823          	sw	a4,16(a5)
80008078:	fddff06f          	j	80008054 <raw_remove+0x14>

8000807c <raw_new>:
8000807c:	ff010113          	addi	sp,sp,-16
80008080:	800035b7          	lui	a1,0x80003
80008084:	00912223          	sw	s1,4(sp)
80008088:	25a00613          	li	a2,602
8000808c:	00050493          	mv	s1,a0
80008090:	cd858593          	addi	a1,a1,-808 # 80002cd8 <_ram_heap_end+0xffff0cd8>
80008094:	00000513          	li	a0,0
80008098:	00812423          	sw	s0,8(sp)
8000809c:	00112623          	sw	ra,12(sp)
800080a0:	ea8fe0ef          	jal	ra,80006748 <memp_malloc_fn>
800080a4:	00050413          	mv	s0,a0
800080a8:	02050463          	beqz	a0,800080d0 <raw_new+0x54>
800080ac:	02000613          	li	a2,32
800080b0:	00000593          	li	a1,0
800080b4:	3e5040ef          	jal	ra,8000cc98 <memset>
800080b8:	fff00793          	li	a5,-1
800080bc:	00f405a3          	sb	a5,11(s0)
800080c0:	8d81a703          	lw	a4,-1832(gp) # 80003158 <raw_pcbs>
800080c4:	00940a23          	sb	s1,20(s0)
800080c8:	8c81ac23          	sw	s0,-1832(gp) # 80003158 <raw_pcbs>
800080cc:	00e42823          	sw	a4,16(s0)
800080d0:	00040513          	mv	a0,s0
800080d4:	00c12083          	lw	ra,12(sp)
800080d8:	00812403          	lw	s0,8(sp)
800080dc:	00412483          	lw	s1,4(sp)
800080e0:	01010113          	addi	sp,sp,16
800080e4:	00008067          	ret

800080e8 <raw_new_ip_type>:
800080e8:	00058513          	mv	a0,a1
800080ec:	f91ff06f          	j	8000807c <raw_new>

800080f0 <raw_netif_ip_addr_changed>:
800080f0:	02050063          	beqz	a0,80008110 <raw_netif_ip_addr_changed+0x20>
800080f4:	00052783          	lw	a5,0(a0)
800080f8:	00078c63          	beqz	a5,80008110 <raw_netif_ip_addr_changed+0x20>
800080fc:	00058a63          	beqz	a1,80008110 <raw_netif_ip_addr_changed+0x20>
80008100:	0005a783          	lw	a5,0(a1)
80008104:	00078663          	beqz	a5,80008110 <raw_netif_ip_addr_changed+0x20>
80008108:	8d81a783          	lw	a5,-1832(gp) # 80003158 <raw_pcbs>
8000810c:	00079463          	bnez	a5,80008114 <raw_netif_ip_addr_changed+0x24>
80008110:	00008067          	ret
80008114:	0007a683          	lw	a3,0(a5)
80008118:	00052703          	lw	a4,0(a0)
8000811c:	00e69663          	bne	a3,a4,80008128 <raw_netif_ip_addr_changed+0x38>
80008120:	0005a703          	lw	a4,0(a1)
80008124:	00e7a023          	sw	a4,0(a5)
80008128:	0107a783          	lw	a5,16(a5)
8000812c:	fe1ff06f          	j	8000810c <raw_netif_ip_addr_changed+0x1c>

80008130 <stats_init>:
80008130:	00008067          	ret

80008134 <sys_timeout_abs>:
80008134:	ff010113          	addi	sp,sp,-16
80008138:	01212023          	sw	s2,0(sp)
8000813c:	00058913          	mv	s2,a1
80008140:	800035b7          	lui	a1,0x80003
80008144:	00812423          	sw	s0,8(sp)
80008148:	00912223          	sw	s1,4(sp)
8000814c:	00050413          	mv	s0,a0
80008150:	00060493          	mv	s1,a2
80008154:	d0458593          	addi	a1,a1,-764 # 80002d04 <_ram_heap_end+0xffff0d04>
80008158:	0bc00613          	li	a2,188
8000815c:	00300513          	li	a0,3
80008160:	00112623          	sw	ra,12(sp)
80008164:	de4fe0ef          	jal	ra,80006748 <memp_malloc_fn>
80008168:	02050063          	beqz	a0,80008188 <sys_timeout_abs+0x54>
8000816c:	8e01a783          	lw	a5,-1824(gp) # 80003160 <next_timeout>
80008170:	00052023          	sw	zero,0(a0)
80008174:	01252423          	sw	s2,8(a0)
80008178:	00952623          	sw	s1,12(a0)
8000817c:	00852223          	sw	s0,4(a0)
80008180:	02079063          	bnez	a5,800081a0 <sys_timeout_abs+0x6c>
80008184:	8ea1a023          	sw	a0,-1824(gp) # 80003160 <next_timeout>
80008188:	00c12083          	lw	ra,12(sp)
8000818c:	00812403          	lw	s0,8(sp)
80008190:	00412483          	lw	s1,4(sp)
80008194:	00012903          	lw	s2,0(sp)
80008198:	01010113          	addi	sp,sp,16
8000819c:	00008067          	ret
800081a0:	0047a683          	lw	a3,4(a5)
800081a4:	40d406b3          	sub	a3,s0,a3
800081a8:	0006d863          	bgez	a3,800081b8 <sys_timeout_abs+0x84>
800081ac:	00f52023          	sw	a5,0(a0)
800081b0:	fd5ff06f          	j	80008184 <sys_timeout_abs+0x50>
800081b4:	00070793          	mv	a5,a4
800081b8:	0007a703          	lw	a4,0(a5)
800081bc:	00070863          	beqz	a4,800081cc <sys_timeout_abs+0x98>
800081c0:	00472683          	lw	a3,4(a4) # 10004 <_stack_size+0xf804>
800081c4:	40d406b3          	sub	a3,s0,a3
800081c8:	fe06d6e3          	bgez	a3,800081b4 <sys_timeout_abs+0x80>
800081cc:	00e52023          	sw	a4,0(a0)
800081d0:	00a7a023          	sw	a0,0(a5)
800081d4:	fb5ff06f          	j	80008188 <sys_timeout_abs+0x54>

800081d8 <lwip_cyclic_timer>:
800081d8:	fe010113          	addi	sp,sp,-32
800081dc:	00112e23          	sw	ra,28(sp)
800081e0:	00452783          	lw	a5,4(a0)
800081e4:	00a12623          	sw	a0,12(sp)
800081e8:	000780e7          	jalr	a5
800081ec:	cfdfc0ef          	jal	ra,80004ee8 <sys_now>
800081f0:	00c12603          	lw	a2,12(sp)
800081f4:	8dc1a783          	lw	a5,-1828(gp) # 8000315c <current_timeout_due_time>
800081f8:	00062703          	lw	a4,0(a2)
800081fc:	800085b7          	lui	a1,0x80008
80008200:	1d858593          	addi	a1,a1,472 # 800081d8 <_ram_heap_end+0xffff61d8>
80008204:	00f707b3          	add	a5,a4,a5
80008208:	40a786b3          	sub	a3,a5,a0
8000820c:	00a70533          	add	a0,a4,a0
80008210:	0006c463          	bltz	a3,80008218 <lwip_cyclic_timer+0x40>
80008214:	00078513          	mv	a0,a5
80008218:	01c12083          	lw	ra,28(sp)
8000821c:	02010113          	addi	sp,sp,32
80008220:	f15ff06f          	j	80008134 <sys_timeout_abs>

80008224 <sys_timeout>:
80008224:	fe010113          	addi	sp,sp,-32
80008228:	00812c23          	sw	s0,24(sp)
8000822c:	00112e23          	sw	ra,28(sp)
80008230:	00050413          	mv	s0,a0
80008234:	00b12623          	sw	a1,12(sp)
80008238:	00c12423          	sw	a2,8(sp)
8000823c:	cadfc0ef          	jal	ra,80004ee8 <sys_now>
80008240:	00850533          	add	a0,a0,s0
80008244:	01812403          	lw	s0,24(sp)
80008248:	00812603          	lw	a2,8(sp)
8000824c:	00c12583          	lw	a1,12(sp)
80008250:	01c12083          	lw	ra,28(sp)
80008254:	02010113          	addi	sp,sp,32
80008258:	eddff06f          	j	80008134 <sys_timeout_abs>

8000825c <sys_timeouts_init>:
8000825c:	ff010113          	addi	sp,sp,-16
80008260:	00812423          	sw	s0,8(sp)
80008264:	80003637          	lui	a2,0x80003
80008268:	80008437          	lui	s0,0x80008
8000826c:	00912223          	sw	s1,4(sp)
80008270:	1d840593          	addi	a1,s0,472 # 800081d8 <_ram_heap_end+0xffff61d8>
80008274:	cec60493          	addi	s1,a2,-788 # 80002cec <_ram_heap_end+0xffff0cec>
80008278:	3e800513          	li	a0,1000
8000827c:	cec60613          	addi	a2,a2,-788
80008280:	00112623          	sw	ra,12(sp)
80008284:	fa1ff0ef          	jal	ra,80008224 <sys_timeout>
80008288:	0000f537          	lui	a0,0xf
8000828c:	00848613          	addi	a2,s1,8
80008290:	1d840593          	addi	a1,s0,472
80008294:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
80008298:	f8dff0ef          	jal	ra,80008224 <sys_timeout>
8000829c:	1d840593          	addi	a1,s0,472
800082a0:	00812403          	lw	s0,8(sp)
800082a4:	00c12083          	lw	ra,12(sp)
800082a8:	01048613          	addi	a2,s1,16
800082ac:	00412483          	lw	s1,4(sp)
800082b0:	1f400513          	li	a0,500
800082b4:	01010113          	addi	sp,sp,16
800082b8:	f6dff06f          	j	80008224 <sys_timeout>

800082bc <sys_untimeout>:
800082bc:	8e01a783          	lw	a5,-1824(gp) # 80003160 <next_timeout>
800082c0:	00070693          	mv	a3,a4
800082c4:	00000613          	li	a2,0
800082c8:	00079e63          	bnez	a5,800082e4 <sys_untimeout+0x28>
800082cc:	00008067          	ret
800082d0:	00e62023          	sw	a4,0(a2)
800082d4:	02c0006f          	j	80008300 <sys_untimeout+0x44>
800082d8:	00078613          	mv	a2,a5
800082dc:	fe0708e3          	beqz	a4,800082cc <sys_untimeout+0x10>
800082e0:	00070793          	mv	a5,a4
800082e4:	0087a803          	lw	a6,8(a5)
800082e8:	0007a703          	lw	a4,0(a5)
800082ec:	fea816e3          	bne	a6,a0,800082d8 <sys_untimeout+0x1c>
800082f0:	00c7a803          	lw	a6,12(a5)
800082f4:	feb812e3          	bne	a6,a1,800082d8 <sys_untimeout+0x1c>
800082f8:	fc061ce3          	bnez	a2,800082d0 <sys_untimeout+0x14>
800082fc:	8ee1a023          	sw	a4,-1824(gp) # 80003160 <next_timeout>
80008300:	00078593          	mv	a1,a5
80008304:	00300513          	li	a0,3
80008308:	c78fe06f          	j	80006780 <memp_free>

8000830c <sys_check_timeouts>:
8000830c:	fe010113          	addi	sp,sp,-32
80008310:	00912a23          	sw	s1,20(sp)
80008314:	01312623          	sw	s3,12(sp)
80008318:	01412423          	sw	s4,8(sp)
8000831c:	00112e23          	sw	ra,28(sp)
80008320:	00812c23          	sw	s0,24(sp)
80008324:	01212823          	sw	s2,16(sp)
80008328:	bc1fc0ef          	jal	ra,80004ee8 <sys_now>
8000832c:	00050993          	mv	s3,a0
80008330:	8e01a583          	lw	a1,-1824(gp) # 80003160 <next_timeout>
80008334:	02058e63          	beqz	a1,80008370 <sys_check_timeouts+0x64>
80008338:	0045a783          	lw	a5,4(a1)
8000833c:	40f98733          	sub	a4,s3,a5
80008340:	02074863          	bltz	a4,80008370 <sys_check_timeouts+0x64>
80008344:	0005a703          	lw	a4,0(a1)
80008348:	0085a403          	lw	s0,8(a1)
8000834c:	00300513          	li	a0,3
80008350:	8ee1a023          	sw	a4,-1824(gp) # 80003160 <next_timeout>
80008354:	00c5a903          	lw	s2,12(a1)
80008358:	8cf1ae23          	sw	a5,-1828(gp) # 8000315c <current_timeout_due_time>
8000835c:	c24fe0ef          	jal	ra,80006780 <memp_free>
80008360:	fc0408e3          	beqz	s0,80008330 <sys_check_timeouts+0x24>
80008364:	00090513          	mv	a0,s2
80008368:	000400e7          	jalr	s0
8000836c:	fc5ff06f          	j	80008330 <sys_check_timeouts+0x24>
80008370:	01c12083          	lw	ra,28(sp)
80008374:	01812403          	lw	s0,24(sp)
80008378:	01412483          	lw	s1,20(sp)
8000837c:	01012903          	lw	s2,16(sp)
80008380:	00c12983          	lw	s3,12(sp)
80008384:	00812a03          	lw	s4,8(sp)
80008388:	02010113          	addi	sp,sp,32
8000838c:	00008067          	ret

80008390 <sys_restart_timeouts>:
80008390:	ff010113          	addi	sp,sp,-16
80008394:	00812423          	sw	s0,8(sp)
80008398:	8e01a783          	lw	a5,-1824(gp) # 80003160 <next_timeout>
8000839c:	00112623          	sw	ra,12(sp)
800083a0:	02078463          	beqz	a5,800083c8 <sys_restart_timeouts+0x38>
800083a4:	b45fc0ef          	jal	ra,80004ee8 <sys_now>
800083a8:	8e01a783          	lw	a5,-1824(gp) # 80003160 <next_timeout>
800083ac:	0047a703          	lw	a4,4(a5)
800083b0:	40e50533          	sub	a0,a0,a4
800083b4:	0047a703          	lw	a4,4(a5)
800083b8:	00a70733          	add	a4,a4,a0
800083bc:	00e7a223          	sw	a4,4(a5)
800083c0:	0007a783          	lw	a5,0(a5)
800083c4:	fe0798e3          	bnez	a5,800083b4 <sys_restart_timeouts+0x24>
800083c8:	00c12083          	lw	ra,12(sp)
800083cc:	00812403          	lw	s0,8(sp)
800083d0:	01010113          	addi	sp,sp,16
800083d4:	00008067          	ret

800083d8 <sys_timeouts_sleeptime>:
800083d8:	ff010113          	addi	sp,sp,-16
800083dc:	00812423          	sw	s0,8(sp)
800083e0:	8e01a783          	lw	a5,-1824(gp) # 80003160 <next_timeout>
800083e4:	00112623          	sw	ra,12(sp)
800083e8:	fff00513          	li	a0,-1
800083ec:	00078e63          	beqz	a5,80008408 <sys_timeouts_sleeptime+0x30>
800083f0:	af9fc0ef          	jal	ra,80004ee8 <sys_now>
800083f4:	8e01a783          	lw	a5,-1824(gp) # 80003160 <next_timeout>
800083f8:	0047a783          	lw	a5,4(a5)
800083fc:	40a78533          	sub	a0,a5,a0
80008400:	00055463          	bgez	a0,80008408 <sys_timeouts_sleeptime+0x30>
80008404:	00000513          	li	a0,0
80008408:	00c12083          	lw	ra,12(sp)
8000840c:	00812403          	lw	s0,8(sp)
80008410:	01010113          	addi	sp,sp,16
80008414:	00008067          	ret

80008418 <udp_init>:
80008418:	00008067          	ret

8000841c <udp_input>:
8000841c:	fd010113          	addi	sp,sp,-48
80008420:	02812423          	sw	s0,40(sp)
80008424:	02112623          	sw	ra,44(sp)
80008428:	02912223          	sw	s1,36(sp)
8000842c:	03212023          	sw	s2,32(sp)
80008430:	01312e23          	sw	s3,28(sp)
80008434:	01412c23          	sw	s4,24(sp)
80008438:	01512a23          	sw	s5,20(sp)
8000843c:	01612823          	sw	s6,16(sp)
80008440:	01712623          	sw	s7,12(sp)
80008444:	a0c18793          	addi	a5,gp,-1524 # 8000328c <lwip_stats>
80008448:	0f47a703          	lw	a4,244(a5)
8000844c:	00170713          	addi	a4,a4,1
80008450:	0ee7aa23          	sw	a4,244(a5)
80008454:	00a55683          	lhu	a3,10(a0)
80008458:	00700713          	li	a4,7
8000845c:	04d76463          	bltu	a4,a3,800084a4 <udp_input+0x88>
80008460:	1047a703          	lw	a4,260(a5)
80008464:	00170713          	addi	a4,a4,1
80008468:	10e7a223          	sw	a4,260(a5)
8000846c:	0fc7a703          	lw	a4,252(a5)
80008470:	00170713          	addi	a4,a4,1
80008474:	0ee7ae23          	sw	a4,252(a5)
80008478:	02812403          	lw	s0,40(sp)
8000847c:	02c12083          	lw	ra,44(sp)
80008480:	02412483          	lw	s1,36(sp)
80008484:	02012903          	lw	s2,32(sp)
80008488:	01c12983          	lw	s3,28(sp)
8000848c:	01812a03          	lw	s4,24(sp)
80008490:	01412a83          	lw	s5,20(sp)
80008494:	01012b03          	lw	s6,16(sp)
80008498:	00c12b83          	lw	s7,12(sp)
8000849c:	03010113          	addi	sp,sp,48
800084a0:	b95fe06f          	j	80007034 <pbuf_free>
800084a4:	9f418913          	addi	s2,gp,-1548 # 80003274 <ip_data>
800084a8:	00452983          	lw	s3,4(a0)
800084ac:	00050493          	mv	s1,a0
800084b0:	00058b93          	mv	s7,a1
800084b4:	01492503          	lw	a0,20(s2)
800084b8:	00092583          	lw	a1,0(s2)
800084bc:	a0c18413          	addi	s0,gp,-1524 # 8000328c <lwip_stats>
800084c0:	9f418a13          	addi	s4,gp,-1548 # 80003274 <ip_data>
800084c4:	11c040ef          	jal	ra,8000c5e0 <ip4_addr_isbroadcast_u32>
800084c8:	0019c783          	lbu	a5,1(s3)
800084cc:	00050a93          	mv	s5,a0
800084d0:	0009c503          	lbu	a0,0(s3)
800084d4:	00879793          	slli	a5,a5,0x8
800084d8:	00a7e533          	or	a0,a5,a0
800084dc:	935fd0ef          	jal	ra,80005e10 <lwip_htons>
800084e0:	0039c783          	lbu	a5,3(s3)
800084e4:	00050b13          	mv	s6,a0
800084e8:	0029c503          	lbu	a0,2(s3)
800084ec:	00879793          	slli	a5,a5,0x8
800084f0:	00a7e533          	or	a0,a5,a0
800084f4:	91dfd0ef          	jal	ra,80005e10 <lwip_htons>
800084f8:	8e41a803          	lw	a6,-1820(gp) # 80003164 <udp_pcbs>
800084fc:	00492303          	lw	t1,4(s2)
80008500:	01492683          	lw	a3,20(s2)
80008504:	01092e03          	lw	t3,16(s2)
80008508:	00080793          	mv	a5,a6
8000850c:	00000913          	li	s2,0
80008510:	00000593          	li	a1,0
80008514:	fff00893          	li	a7,-1
80008518:	00079c63          	bnez	a5,80008530 <udp_input+0x114>
8000851c:	0a091e63          	bnez	s2,800085d8 <udp_input+0x1bc>
80008520:	004ba783          	lw	a5,4(s7)
80008524:	0ad78a63          	beq	a5,a3,800085d8 <udp_input+0x1bc>
80008528:	00048513          	mv	a0,s1
8000852c:	f4dff06f          	j	80008478 <udp_input+0x5c>
80008530:	0167d703          	lhu	a4,22(a5)
80008534:	0ea71e63          	bne	a4,a0,80008630 <udp_input+0x214>
80008538:	0087ce83          	lbu	t4,8(a5)
8000853c:	000e8a63          	beqz	t4,80008550 <udp_input+0x134>
80008540:	03834703          	lbu	a4,56(t1)
80008544:	00170713          	addi	a4,a4,1
80008548:	0ff77713          	andi	a4,a4,255
8000854c:	0eee9263          	bne	t4,a4,80008630 <udp_input+0x214>
80008550:	0c0a8a63          	beqz	s5,80008624 <udp_input+0x208>
80008554:	0097c703          	lbu	a4,9(a5)
80008558:	02077713          	andi	a4,a4,32
8000855c:	0c070a63          	beqz	a4,80008630 <udp_input+0x214>
80008560:	0007a703          	lw	a4,0(a5)
80008564:	00070c63          	beqz	a4,8000857c <udp_input+0x160>
80008568:	01168a63          	beq	a3,a7,8000857c <udp_input+0x160>
8000856c:	008bae83          	lw	t4,8(s7)
80008570:	00d74733          	xor	a4,a4,a3
80008574:	01d77733          	and	a4,a4,t4
80008578:	0a071c63          	bnez	a4,80008630 <udp_input+0x214>
8000857c:	0147c703          	lbu	a4,20(a5)
80008580:	00477713          	andi	a4,a4,4
80008584:	02071463          	bnez	a4,800085ac <udp_input+0x190>
80008588:	02090063          	beqz	s2,800085a8 <udp_input+0x18c>
8000858c:	020a8063          	beqz	s5,800085ac <udp_input+0x190>
80008590:	01169e63          	bne	a3,a7,800085ac <udp_input+0x190>
80008594:	004ba703          	lw	a4,4(s7)
80008598:	00092e83          	lw	t4,0(s2)
8000859c:	00ee8863          	beq	t4,a4,800085ac <udp_input+0x190>
800085a0:	0007ae83          	lw	t4,0(a5)
800085a4:	01d71463          	bne	a4,t4,800085ac <udp_input+0x190>
800085a8:	00078913          	mv	s2,a5
800085ac:	0187d703          	lhu	a4,24(a5)
800085b0:	09671063          	bne	a4,s6,80008630 <udp_input+0x214>
800085b4:	0047a703          	lw	a4,4(a5)
800085b8:	00070463          	beqz	a4,800085c0 <udp_input+0x1a4>
800085bc:	07c71a63          	bne	a4,t3,80008630 <udp_input+0x214>
800085c0:	06058e63          	beqz	a1,8000863c <udp_input+0x220>
800085c4:	0107a703          	lw	a4,16(a5)
800085c8:	8ef1a223          	sw	a5,-1820(gp) # 80003164 <udp_pcbs>
800085cc:	00e5a823          	sw	a4,16(a1)
800085d0:	0107a823          	sw	a6,16(a5)
800085d4:	00078913          	mv	s2,a5
800085d8:	0079c783          	lbu	a5,7(s3)
800085dc:	0069c703          	lbu	a4,6(s3)
800085e0:	00879793          	slli	a5,a5,0x8
800085e4:	00e7e7b3          	or	a5,a5,a4
800085e8:	06078263          	beqz	a5,8000864c <udp_input+0x230>
800085ec:	0084d603          	lhu	a2,8(s1)
800085f0:	a0818713          	addi	a4,gp,-1528 # 80003288 <ip_data+0x14>
800085f4:	a0418693          	addi	a3,gp,-1532 # 80003284 <ip_data+0x10>
800085f8:	01100593          	li	a1,17
800085fc:	00048513          	mv	a0,s1
80008600:	c71fd0ef          	jal	ra,80006270 <ip_chksum_pseudo>
80008604:	04050463          	beqz	a0,8000864c <udp_input+0x230>
80008608:	10042783          	lw	a5,256(s0)
8000860c:	00178793          	addi	a5,a5,1
80008610:	10f42023          	sw	a5,256(s0)
80008614:	0fc42783          	lw	a5,252(s0)
80008618:	00178793          	addi	a5,a5,1
8000861c:	0ef42e23          	sw	a5,252(s0)
80008620:	f09ff06f          	j	80008528 <udp_input+0x10c>
80008624:	0007a703          	lw	a4,0(a5)
80008628:	f4070ae3          	beqz	a4,8000857c <udp_input+0x160>
8000862c:	f4d708e3          	beq	a4,a3,8000857c <udp_input+0x160>
80008630:	00078593          	mv	a1,a5
80008634:	0107a783          	lw	a5,16(a5)
80008638:	ee1ff06f          	j	80008518 <udp_input+0xfc>
8000863c:	11c42703          	lw	a4,284(s0)
80008640:	00170713          	addi	a4,a4,1
80008644:	10e42e23          	sw	a4,284(s0)
80008648:	f8dff06f          	j	800085d4 <udp_input+0x1b8>
8000864c:	00800593          	li	a1,8
80008650:	00048513          	mv	a0,s1
80008654:	959fe0ef          	jal	ra,80006fac <pbuf_remove_header>
80008658:	fa051ee3          	bnez	a0,80008614 <udp_input+0x1f8>
8000865c:	04090663          	beqz	s2,800086a8 <udp_input+0x28c>
80008660:	01c92303          	lw	t1,28(s2)
80008664:	ec0302e3          	beqz	t1,80008528 <udp_input+0x10c>
80008668:	02812403          	lw	s0,40(sp)
8000866c:	02092503          	lw	a0,32(s2)
80008670:	02c12083          	lw	ra,44(sp)
80008674:	01c12983          	lw	s3,28(sp)
80008678:	01812a03          	lw	s4,24(sp)
8000867c:	01412a83          	lw	s5,20(sp)
80008680:	00c12b83          	lw	s7,12(sp)
80008684:	000b0713          	mv	a4,s6
80008688:	00048613          	mv	a2,s1
8000868c:	01012b03          	lw	s6,16(sp)
80008690:	02412483          	lw	s1,36(sp)
80008694:	00090593          	mv	a1,s2
80008698:	02012903          	lw	s2,32(sp)
8000869c:	a0418693          	addi	a3,gp,-1532 # 80003284 <ip_data+0x10>
800086a0:	03010113          	addi	sp,sp,48
800086a4:	00030067          	jr	t1
800086a8:	020a9c63          	bnez	s5,800086e0 <udp_input+0x2c4>
800086ac:	014a2783          	lw	a5,20(s4)
800086b0:	0e000713          	li	a4,224
800086b4:	0f07f793          	andi	a5,a5,240
800086b8:	02e78463          	beq	a5,a4,800086e0 <udp_input+0x2c4>
800086bc:	00ca5583          	lhu	a1,12(s4)
800086c0:	00048513          	mv	a0,s1
800086c4:	00858593          	addi	a1,a1,8
800086c8:	01059593          	slli	a1,a1,0x10
800086cc:	4105d593          	srai	a1,a1,0x10
800086d0:	951fe0ef          	jal	ra,80007020 <pbuf_header_force>
800086d4:	00300593          	li	a1,3
800086d8:	00048513          	mv	a0,s1
800086dc:	264030ef          	jal	ra,8000b940 <icmp_dest_unreach>
800086e0:	11042783          	lw	a5,272(s0)
800086e4:	00178793          	addi	a5,a5,1
800086e8:	10f42823          	sw	a5,272(s0)
800086ec:	f29ff06f          	j	80008614 <udp_input+0x1f8>

800086f0 <udp_bind>:
800086f0:	00059463          	bnez	a1,800086f8 <udp_bind+0x8>
800086f4:	84818593          	addi	a1,gp,-1976 # 800030c8 <ip_addr_any>
800086f8:	ff000793          	li	a5,-16
800086fc:	0a050463          	beqz	a0,800087a4 <udp_bind+0xb4>
80008700:	8e41a783          	lw	a5,-1820(gp) # 80003164 <udp_pcbs>
80008704:	00078693          	mv	a3,a5
80008708:	06069063          	bnez	a3,80008768 <udp_bind+0x78>
8000870c:	00000e13          	li	t3,0
80008710:	0c061463          	bnez	a2,800087d8 <udp_bind+0xe8>
80008714:	800036b7          	lui	a3,0x80003
80008718:	0846d603          	lhu	a2,132(a3) # 80003084 <_ram_heap_end+0xffff1084>
8000871c:	00010337          	lui	t1,0x10
80008720:	00004837          	lui	a6,0x4
80008724:	fff30313          	addi	t1,t1,-1 # ffff <_stack_size+0xf7ff>
80008728:	04660a63          	beq	a2,t1,8000877c <udp_bind+0x8c>
8000872c:	00160613          	addi	a2,a2,1
80008730:	01061613          	slli	a2,a2,0x10
80008734:	01065613          	srli	a2,a2,0x10
80008738:	00078893          	mv	a7,a5
8000873c:	04089463          	bnez	a7,80008784 <udp_bind+0x94>
80008740:	08c69223          	sh	a2,132(a3)
80008744:	0005a783          	lw	a5,0(a1)
80008748:	00c51b23          	sh	a2,22(a0)
8000874c:	00f52023          	sw	a5,0(a0)
80008750:	000e1863          	bnez	t3,80008760 <udp_bind+0x70>
80008754:	8e41a783          	lw	a5,-1820(gp) # 80003164 <udp_pcbs>
80008758:	8ea1a223          	sw	a0,-1820(gp) # 80003164 <udp_pcbs>
8000875c:	00f52823          	sw	a5,16(a0)
80008760:	00000793          	li	a5,0
80008764:	0400006f          	j	800087a4 <udp_bind+0xb4>
80008768:	00a68663          	beq	a3,a0,80008774 <udp_bind+0x84>
8000876c:	0106a683          	lw	a3,16(a3)
80008770:	f99ff06f          	j	80008708 <udp_bind+0x18>
80008774:	00100e13          	li	t3,1
80008778:	f99ff06f          	j	80008710 <udp_bind+0x20>
8000877c:	0000c637          	lui	a2,0xc
80008780:	fb9ff06f          	j	80008738 <udp_bind+0x48>
80008784:	0168de83          	lhu	t4,22(a7)
80008788:	02ce9263          	bne	t4,a2,800087ac <udp_bind+0xbc>
8000878c:	fff80813          	addi	a6,a6,-1 # 3fff <_stack_size+0x37ff>
80008790:	01081813          	slli	a6,a6,0x10
80008794:	01085813          	srli	a6,a6,0x10
80008798:	f80818e3          	bnez	a6,80008728 <udp_bind+0x38>
8000879c:	08c69223          	sh	a2,132(a3)
800087a0:	ff800793          	li	a5,-8
800087a4:	00078513          	mv	a0,a5
800087a8:	00008067          	ret
800087ac:	0108a883          	lw	a7,16(a7)
800087b0:	f8dff06f          	j	8000873c <udp_bind+0x4c>
800087b4:	02a78063          	beq	a5,a0,800087d4 <udp_bind+0xe4>
800087b8:	0167d683          	lhu	a3,22(a5)
800087bc:	00c69c63          	bne	a3,a2,800087d4 <udp_bind+0xe4>
800087c0:	0005a803          	lw	a6,0(a1)
800087c4:	0007a683          	lw	a3,0(a5)
800087c8:	fd068ce3          	beq	a3,a6,800087a0 <udp_bind+0xb0>
800087cc:	fc080ae3          	beqz	a6,800087a0 <udp_bind+0xb0>
800087d0:	fc0688e3          	beqz	a3,800087a0 <udp_bind+0xb0>
800087d4:	0107a783          	lw	a5,16(a5)
800087d8:	fc079ee3          	bnez	a5,800087b4 <udp_bind+0xc4>
800087dc:	f69ff06f          	j	80008744 <udp_bind+0x54>

800087e0 <udp_sendto_if_src>:
800087e0:	fd010113          	addi	sp,sp,-48
800087e4:	02912223          	sw	s1,36(sp)
800087e8:	02112623          	sw	ra,44(sp)
800087ec:	02812423          	sw	s0,40(sp)
800087f0:	03212023          	sw	s2,32(sp)
800087f4:	01312e23          	sw	s3,28(sp)
800087f8:	01412c23          	sw	s4,24(sp)
800087fc:	01512a23          	sw	s5,20(sp)
80008800:	01612823          	sw	s6,16(sp)
80008804:	01712623          	sw	s7,12(sp)
80008808:	ff000493          	li	s1,-16
8000880c:	08050263          	beqz	a0,80008890 <udp_sendto_if_src+0xb0>
80008810:	08058063          	beqz	a1,80008890 <udp_sendto_if_src+0xb0>
80008814:	06060e63          	beqz	a2,80008890 <udp_sendto_if_src+0xb0>
80008818:	06078c63          	beqz	a5,80008890 <udp_sendto_if_src+0xb0>
8000881c:	06070a63          	beqz	a4,80008890 <udp_sendto_if_src+0xb0>
80008820:	00078b13          	mv	s6,a5
80008824:	00954783          	lbu	a5,9(a0)
80008828:	00070a13          	mv	s4,a4
8000882c:	00068b93          	mv	s7,a3
80008830:	0207f793          	andi	a5,a5,32
80008834:	00060a93          	mv	s5,a2
80008838:	00058993          	mv	s3,a1
8000883c:	00050413          	mv	s0,a0
80008840:	02078e63          	beqz	a5,8000887c <udp_sendto_if_src+0x9c>
80008844:	01645783          	lhu	a5,22(s0)
80008848:	00079e63          	bnez	a5,80008864 <udp_sendto_if_src+0x84>
8000884c:	00000613          	li	a2,0
80008850:	00040593          	mv	a1,s0
80008854:	00040513          	mv	a0,s0
80008858:	e99ff0ef          	jal	ra,800086f0 <udp_bind>
8000885c:	00050493          	mv	s1,a0
80008860:	02051863          	bnez	a0,80008890 <udp_sendto_if_src+0xb0>
80008864:	0089d703          	lhu	a4,8(s3)
80008868:	000107b7          	lui	a5,0x10
8000886c:	ff778793          	addi	a5,a5,-9 # fff7 <_stack_size+0xf7f7>
80008870:	04e7f863          	bgeu	a5,a4,800088c0 <udp_sendto_if_src+0xe0>
80008874:	fff00493          	li	s1,-1
80008878:	0180006f          	j	80008890 <udp_sendto_if_src+0xb0>
8000887c:	00062503          	lw	a0,0(a2) # c000 <_stack_size+0xb800>
80008880:	00070593          	mv	a1,a4
80008884:	ffa00493          	li	s1,-6
80008888:	559030ef          	jal	ra,8000c5e0 <ip4_addr_isbroadcast_u32>
8000888c:	fa050ce3          	beqz	a0,80008844 <udp_sendto_if_src+0x64>
80008890:	02c12083          	lw	ra,44(sp)
80008894:	02812403          	lw	s0,40(sp)
80008898:	00048513          	mv	a0,s1
8000889c:	02012903          	lw	s2,32(sp)
800088a0:	02412483          	lw	s1,36(sp)
800088a4:	01c12983          	lw	s3,28(sp)
800088a8:	01812a03          	lw	s4,24(sp)
800088ac:	01412a83          	lw	s5,20(sp)
800088b0:	01012b03          	lw	s6,16(sp)
800088b4:	00c12b83          	lw	s7,12(sp)
800088b8:	03010113          	addi	sp,sp,48
800088bc:	00008067          	ret
800088c0:	00800593          	li	a1,8
800088c4:	00098513          	mv	a0,s3
800088c8:	ed4fe0ef          	jal	ra,80006f9c <pbuf_add_header>
800088cc:	10050063          	beqz	a0,800089cc <udp_sendto_if_src+0x1ec>
800088d0:	28000613          	li	a2,640
800088d4:	00800593          	li	a1,8
800088d8:	02400513          	li	a0,36
800088dc:	82dfe0ef          	jal	ra,80007108 <pbuf_alloc>
800088e0:	00050913          	mv	s2,a0
800088e4:	f80508e3          	beqz	a0,80008874 <udp_sendto_if_src+0x94>
800088e8:	0089d783          	lhu	a5,8(s3)
800088ec:	00078663          	beqz	a5,800088f8 <udp_sendto_if_src+0x118>
800088f0:	00098593          	mv	a1,s3
800088f4:	b99fe0ef          	jal	ra,8000748c <pbuf_chain>
800088f8:	01645503          	lhu	a0,22(s0)
800088fc:	00492483          	lw	s1,4(s2)
80008900:	d10fd0ef          	jal	ra,80005e10 <lwip_htons>
80008904:	00a48023          	sb	a0,0(s1)
80008908:	00855513          	srli	a0,a0,0x8
8000890c:	00a480a3          	sb	a0,1(s1)
80008910:	000b8513          	mv	a0,s7
80008914:	cfcfd0ef          	jal	ra,80005e10 <lwip_htons>
80008918:	00a48123          	sb	a0,2(s1)
8000891c:	00855513          	srli	a0,a0,0x8
80008920:	00a481a3          	sb	a0,3(s1)
80008924:	00048323          	sb	zero,6(s1)
80008928:	000483a3          	sb	zero,7(s1)
8000892c:	00895503          	lhu	a0,8(s2)
80008930:	ce0fd0ef          	jal	ra,80005e10 <lwip_htons>
80008934:	00a48223          	sb	a0,4(s1)
80008938:	00855513          	srli	a0,a0,0x8
8000893c:	00a482a3          	sb	a0,5(s1)
80008940:	01444783          	lbu	a5,20(s0)
80008944:	0017f793          	andi	a5,a5,1
80008948:	02079a63          	bnez	a5,8000897c <udp_sendto_if_src+0x19c>
8000894c:	00895603          	lhu	a2,8(s2)
80008950:	000a8713          	mv	a4,s5
80008954:	000b0693          	mv	a3,s6
80008958:	01100593          	li	a1,17
8000895c:	00090513          	mv	a0,s2
80008960:	911fd0ef          	jal	ra,80006270 <ip_chksum_pseudo>
80008964:	00051663          	bnez	a0,80008970 <udp_sendto_if_src+0x190>
80008968:	00010537          	lui	a0,0x10
8000896c:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xf7ff>
80008970:	00a48323          	sb	a0,6(s1)
80008974:	00855513          	srli	a0,a0,0x8
80008978:	00a483a3          	sb	a0,7(s1)
8000897c:	00c40793          	addi	a5,s0,12
80008980:	00b44683          	lbu	a3,11(s0)
80008984:	02fa2e23          	sw	a5,60(s4)
80008988:	00a44703          	lbu	a4,10(s0)
8000898c:	000a0813          	mv	a6,s4
80008990:	01100793          	li	a5,17
80008994:	000a8613          	mv	a2,s5
80008998:	000b0593          	mv	a1,s6
8000899c:	00090513          	mv	a0,s2
800089a0:	0d1030ef          	jal	ra,8000c270 <ip4_output_if_src>
800089a4:	020a2e23          	sw	zero,60(s4)
800089a8:	00050493          	mv	s1,a0
800089ac:	01390663          	beq	s2,s3,800089b8 <udp_sendto_if_src+0x1d8>
800089b0:	00090513          	mv	a0,s2
800089b4:	e80fe0ef          	jal	ra,80007034 <pbuf_free>
800089b8:	a0c18793          	addi	a5,gp,-1524 # 8000328c <lwip_stats>
800089bc:	0f07a703          	lw	a4,240(a5)
800089c0:	00170713          	addi	a4,a4,1
800089c4:	0ee7a823          	sw	a4,240(a5)
800089c8:	ec9ff06f          	j	80008890 <udp_sendto_if_src+0xb0>
800089cc:	00098913          	mv	s2,s3
800089d0:	f29ff06f          	j	800088f8 <udp_sendto_if_src+0x118>

800089d4 <udp_sendto_if>:
800089d4:	02050e63          	beqz	a0,80008a10 <udp_sendto_if+0x3c>
800089d8:	02058c63          	beqz	a1,80008a10 <udp_sendto_if+0x3c>
800089dc:	02060a63          	beqz	a2,80008a10 <udp_sendto_if+0x3c>
800089e0:	02070863          	beqz	a4,80008a10 <udp_sendto_if+0x3c>
800089e4:	00052783          	lw	a5,0(a0)
800089e8:	00078863          	beqz	a5,800089f8 <udp_sendto_if+0x24>
800089ec:	0f07f813          	andi	a6,a5,240
800089f0:	0e000893          	li	a7,224
800089f4:	01181663          	bne	a6,a7,80008a00 <udp_sendto_if+0x2c>
800089f8:	00470793          	addi	a5,a4,4
800089fc:	de5ff06f          	j	800087e0 <udp_sendto_if_src>
80008a00:	00472803          	lw	a6,4(a4)
80008a04:	01079a63          	bne	a5,a6,80008a18 <udp_sendto_if+0x44>
80008a08:	00050793          	mv	a5,a0
80008a0c:	ff1ff06f          	j	800089fc <udp_sendto_if+0x28>
80008a10:	ff000513          	li	a0,-16
80008a14:	00008067          	ret
80008a18:	ffc00513          	li	a0,-4
80008a1c:	00008067          	ret

80008a20 <udp_sendto>:
80008a20:	0a050863          	beqz	a0,80008ad0 <udp_sendto+0xb0>
80008a24:	0a058663          	beqz	a1,80008ad0 <udp_sendto+0xb0>
80008a28:	0a060463          	beqz	a2,80008ad0 <udp_sendto+0xb0>
80008a2c:	fe010113          	addi	sp,sp,-32
80008a30:	00812c23          	sw	s0,24(sp)
80008a34:	00912a23          	sw	s1,20(sp)
80008a38:	01212823          	sw	s2,16(sp)
80008a3c:	01312623          	sw	s3,12(sp)
80008a40:	00112e23          	sw	ra,28(sp)
80008a44:	00050413          	mv	s0,a0
80008a48:	00854503          	lbu	a0,8(a0)
80008a4c:	00068993          	mv	s3,a3
80008a50:	00060493          	mv	s1,a2
80008a54:	00058913          	mv	s2,a1
80008a58:	02050e63          	beqz	a0,80008a94 <udp_sendto+0x74>
80008a5c:	a9cfe0ef          	jal	ra,80006cf8 <netif_get_by_index>
80008a60:	04051063          	bnez	a0,80008aa0 <udp_sendto+0x80>
80008a64:	a0c18793          	addi	a5,gp,-1524 # 8000328c <lwip_stats>
80008a68:	10c7a703          	lw	a4,268(a5)
80008a6c:	ffc00513          	li	a0,-4
80008a70:	00170713          	addi	a4,a4,1
80008a74:	10e7a623          	sw	a4,268(a5)
80008a78:	01c12083          	lw	ra,28(sp)
80008a7c:	01812403          	lw	s0,24(sp)
80008a80:	01412483          	lw	s1,20(sp)
80008a84:	01012903          	lw	s2,16(sp)
80008a88:	00c12983          	lw	s3,12(sp)
80008a8c:	02010113          	addi	sp,sp,32
80008a90:	00008067          	ret
80008a94:	00060513          	mv	a0,a2
80008a98:	384030ef          	jal	ra,8000be1c <ip4_route>
80008a9c:	fc5ff06f          	j	80008a60 <udp_sendto+0x40>
80008aa0:	00050713          	mv	a4,a0
80008aa4:	00040513          	mv	a0,s0
80008aa8:	01812403          	lw	s0,24(sp)
80008aac:	01c12083          	lw	ra,28(sp)
80008ab0:	00098693          	mv	a3,s3
80008ab4:	00048613          	mv	a2,s1
80008ab8:	00c12983          	lw	s3,12(sp)
80008abc:	01412483          	lw	s1,20(sp)
80008ac0:	00090593          	mv	a1,s2
80008ac4:	01012903          	lw	s2,16(sp)
80008ac8:	02010113          	addi	sp,sp,32
80008acc:	f09ff06f          	j	800089d4 <udp_sendto_if>
80008ad0:	ff000513          	li	a0,-16
80008ad4:	00008067          	ret

80008ad8 <udp_send>:
80008ad8:	00050a63          	beqz	a0,80008aec <udp_send+0x14>
80008adc:	00058863          	beqz	a1,80008aec <udp_send+0x14>
80008ae0:	01855683          	lhu	a3,24(a0)
80008ae4:	00450613          	addi	a2,a0,4
80008ae8:	f39ff06f          	j	80008a20 <udp_sendto>
80008aec:	ff000513          	li	a0,-16
80008af0:	00008067          	ret

80008af4 <udp_bind_netif>:
80008af4:	00000793          	li	a5,0
80008af8:	00058863          	beqz	a1,80008b08 <udp_bind_netif+0x14>
80008afc:	0385c783          	lbu	a5,56(a1)
80008b00:	00178793          	addi	a5,a5,1
80008b04:	0ff7f793          	andi	a5,a5,255
80008b08:	00f50423          	sb	a5,8(a0)
80008b0c:	00008067          	ret

80008b10 <udp_connect>:
80008b10:	ff000793          	li	a5,-16
80008b14:	0a050063          	beqz	a0,80008bb4 <udp_connect+0xa4>
80008b18:	08058e63          	beqz	a1,80008bb4 <udp_connect+0xa4>
80008b1c:	ff010113          	addi	sp,sp,-16
80008b20:	00812423          	sw	s0,8(sp)
80008b24:	00912223          	sw	s1,4(sp)
80008b28:	01212023          	sw	s2,0(sp)
80008b2c:	00112623          	sw	ra,12(sp)
80008b30:	01655783          	lhu	a5,22(a0)
80008b34:	00050413          	mv	s0,a0
80008b38:	00060913          	mv	s2,a2
80008b3c:	00058493          	mv	s1,a1
80008b40:	02078c63          	beqz	a5,80008b78 <udp_connect+0x68>
80008b44:	0004a783          	lw	a5,0(s1)
80008b48:	01241c23          	sh	s2,24(s0)
80008b4c:	00f42223          	sw	a5,4(s0)
80008b50:	01444783          	lbu	a5,20(s0)
80008b54:	0047e793          	ori	a5,a5,4
80008b58:	00f40a23          	sb	a5,20(s0)
80008b5c:	8e41a683          	lw	a3,-1820(gp) # 80003164 <udp_pcbs>
80008b60:	00068713          	mv	a4,a3
80008b64:	04071263          	bnez	a4,80008ba8 <udp_connect+0x98>
80008b68:	00d42823          	sw	a3,16(s0)
80008b6c:	8e81a223          	sw	s0,-1820(gp) # 80003164 <udp_pcbs>
80008b70:	00000793          	li	a5,0
80008b74:	0180006f          	j	80008b8c <udp_connect+0x7c>
80008b78:	00000613          	li	a2,0
80008b7c:	00050593          	mv	a1,a0
80008b80:	b71ff0ef          	jal	ra,800086f0 <udp_bind>
80008b84:	00050793          	mv	a5,a0
80008b88:	fa050ee3          	beqz	a0,80008b44 <udp_connect+0x34>
80008b8c:	00c12083          	lw	ra,12(sp)
80008b90:	00812403          	lw	s0,8(sp)
80008b94:	00412483          	lw	s1,4(sp)
80008b98:	00012903          	lw	s2,0(sp)
80008b9c:	00078513          	mv	a0,a5
80008ba0:	01010113          	addi	sp,sp,16
80008ba4:	00008067          	ret
80008ba8:	fc8704e3          	beq	a4,s0,80008b70 <udp_connect+0x60>
80008bac:	01072703          	lw	a4,16(a4)
80008bb0:	fb5ff06f          	j	80008b64 <udp_connect+0x54>
80008bb4:	00078513          	mv	a0,a5
80008bb8:	00008067          	ret

80008bbc <udp_disconnect>:
80008bbc:	00050e63          	beqz	a0,80008bd8 <udp_disconnect+0x1c>
80008bc0:	01454783          	lbu	a5,20(a0)
80008bc4:	00052223          	sw	zero,4(a0)
80008bc8:	00051c23          	sh	zero,24(a0)
80008bcc:	ffb7f793          	andi	a5,a5,-5
80008bd0:	00050423          	sb	zero,8(a0)
80008bd4:	00f50a23          	sb	a5,20(a0)
80008bd8:	00008067          	ret

80008bdc <udp_recv>:
80008bdc:	00050663          	beqz	a0,80008be8 <udp_recv+0xc>
80008be0:	00b52e23          	sw	a1,28(a0)
80008be4:	02c52023          	sw	a2,32(a0)
80008be8:	00008067          	ret

80008bec <udp_remove>:
80008bec:	00050593          	mv	a1,a0
80008bf0:	02050e63          	beqz	a0,80008c2c <udp_remove+0x40>
80008bf4:	8e41a783          	lw	a5,-1820(gp) # 80003164 <udp_pcbs>
80008bf8:	00a79c63          	bne	a5,a0,80008c10 <udp_remove+0x24>
80008bfc:	01052783          	lw	a5,16(a0)
80008c00:	8ef1a223          	sw	a5,-1820(gp) # 80003164 <udp_pcbs>
80008c04:	00100513          	li	a0,1
80008c08:	b79fd06f          	j	80006780 <memp_free>
80008c0c:	00070793          	mv	a5,a4
80008c10:	fe078ae3          	beqz	a5,80008c04 <udp_remove+0x18>
80008c14:	0107a703          	lw	a4,16(a5)
80008c18:	fe0706e3          	beqz	a4,80008c04 <udp_remove+0x18>
80008c1c:	feb718e3          	bne	a4,a1,80008c0c <udp_remove+0x20>
80008c20:	0105a703          	lw	a4,16(a1)
80008c24:	00e7a823          	sw	a4,16(a5)
80008c28:	fddff06f          	j	80008c04 <udp_remove+0x18>
80008c2c:	00008067          	ret

80008c30 <udp_new>:
80008c30:	800035b7          	lui	a1,0x80003
80008c34:	ff010113          	addi	sp,sp,-16
80008c38:	4c800613          	li	a2,1224
80008c3c:	d2058593          	addi	a1,a1,-736 # 80002d20 <_ram_heap_end+0xffff0d20>
80008c40:	00100513          	li	a0,1
80008c44:	00812423          	sw	s0,8(sp)
80008c48:	00112623          	sw	ra,12(sp)
80008c4c:	afdfd0ef          	jal	ra,80006748 <memp_malloc_fn>
80008c50:	00050413          	mv	s0,a0
80008c54:	00050c63          	beqz	a0,80008c6c <udp_new+0x3c>
80008c58:	02400613          	li	a2,36
80008c5c:	00000593          	li	a1,0
80008c60:	038040ef          	jal	ra,8000cc98 <memset>
80008c64:	fff00793          	li	a5,-1
80008c68:	00f405a3          	sb	a5,11(s0)
80008c6c:	00040513          	mv	a0,s0
80008c70:	00c12083          	lw	ra,12(sp)
80008c74:	00812403          	lw	s0,8(sp)
80008c78:	01010113          	addi	sp,sp,16
80008c7c:	00008067          	ret

80008c80 <udp_new_ip_type>:
80008c80:	fb1ff06f          	j	80008c30 <udp_new>

80008c84 <udp_netif_ip_addr_changed>:
80008c84:	02050063          	beqz	a0,80008ca4 <udp_netif_ip_addr_changed+0x20>
80008c88:	00052783          	lw	a5,0(a0)
80008c8c:	00078c63          	beqz	a5,80008ca4 <udp_netif_ip_addr_changed+0x20>
80008c90:	00058a63          	beqz	a1,80008ca4 <udp_netif_ip_addr_changed+0x20>
80008c94:	0005a783          	lw	a5,0(a1)
80008c98:	00078663          	beqz	a5,80008ca4 <udp_netif_ip_addr_changed+0x20>
80008c9c:	8e41a783          	lw	a5,-1820(gp) # 80003164 <udp_pcbs>
80008ca0:	00079463          	bnez	a5,80008ca8 <udp_netif_ip_addr_changed+0x24>
80008ca4:	00008067          	ret
80008ca8:	0007a683          	lw	a3,0(a5)
80008cac:	00052703          	lw	a4,0(a0)
80008cb0:	00e69663          	bne	a3,a4,80008cbc <udp_netif_ip_addr_changed+0x38>
80008cb4:	0005a703          	lw	a4,0(a1)
80008cb8:	00e7a023          	sw	a4,0(a5)
80008cbc:	0107a783          	lw	a5,16(a5)
80008cc0:	fe1ff06f          	j	80008ca0 <udp_netif_ip_addr_changed+0x1c>

80008cc4 <dhcp_set_state>:
80008cc4:	00554783          	lbu	a5,5(a0)
80008cc8:	00b78863          	beq	a5,a1,80008cd8 <dhcp_set_state+0x14>
80008ccc:	00b502a3          	sb	a1,5(a0)
80008cd0:	00050323          	sb	zero,6(a0)
80008cd4:	00051423          	sh	zero,8(a0)
80008cd8:	00008067          	ret

80008cdc <dhcp_option_short>:
80008cdc:	00a587b3          	add	a5,a1,a0
80008ce0:	00865713          	srli	a4,a2,0x8
80008ce4:	00e78023          	sb	a4,0(a5)
80008ce8:	00150793          	addi	a5,a0,1
80008cec:	01079793          	slli	a5,a5,0x10
80008cf0:	0107d793          	srli	a5,a5,0x10
80008cf4:	00250513          	addi	a0,a0,2
80008cf8:	00f585b3          	add	a1,a1,a5
80008cfc:	01051513          	slli	a0,a0,0x10
80008d00:	00c58023          	sb	a2,0(a1)
80008d04:	01055513          	srli	a0,a0,0x10
80008d08:	00008067          	ret

80008d0c <dhcp_option_long>:
80008d0c:	00a587b3          	add	a5,a1,a0
80008d10:	01865713          	srli	a4,a2,0x18
80008d14:	00e78023          	sb	a4,0(a5)
80008d18:	00150793          	addi	a5,a0,1
80008d1c:	01079793          	slli	a5,a5,0x10
80008d20:	0107d793          	srli	a5,a5,0x10
80008d24:	00f587b3          	add	a5,a1,a5
80008d28:	01065713          	srli	a4,a2,0x10
80008d2c:	00e78023          	sb	a4,0(a5)
80008d30:	00250793          	addi	a5,a0,2
80008d34:	01079793          	slli	a5,a5,0x10
80008d38:	0107d793          	srli	a5,a5,0x10
80008d3c:	00f587b3          	add	a5,a1,a5
80008d40:	00865713          	srli	a4,a2,0x8
80008d44:	00e78023          	sb	a4,0(a5)
80008d48:	00350793          	addi	a5,a0,3
80008d4c:	01079793          	slli	a5,a5,0x10
80008d50:	0107d793          	srli	a5,a5,0x10
80008d54:	00450513          	addi	a0,a0,4
80008d58:	00f585b3          	add	a1,a1,a5
80008d5c:	01051513          	slli	a0,a0,0x10
80008d60:	00c58023          	sb	a2,0(a1)
80008d64:	01055513          	srli	a0,a0,0x10
80008d68:	00008067          	ret

80008d6c <dhcp_create_msg>:
80008d6c:	fe010113          	addi	sp,sp,-32
80008d70:	00112e23          	sw	ra,28(sp)
80008d74:	00812c23          	sw	s0,24(sp)
80008d78:	00912a23          	sw	s1,20(sp)
80008d7c:	01212823          	sw	s2,16(sp)
80008d80:	01312623          	sw	s3,12(sp)
80008d84:	01412423          	sw	s4,8(sp)
80008d88:	01512223          	sw	s5,4(sp)
80008d8c:	01612023          	sw	s6,0(sp)
80008d90:	02051a63          	bnez	a0,80008dc4 <dhcp_create_msg+0x58>
80008d94:	00000a93          	li	s5,0
80008d98:	01c12083          	lw	ra,28(sp)
80008d9c:	01812403          	lw	s0,24(sp)
80008da0:	000a8513          	mv	a0,s5
80008da4:	01412483          	lw	s1,20(sp)
80008da8:	01012903          	lw	s2,16(sp)
80008dac:	00c12983          	lw	s3,12(sp)
80008db0:	00812a03          	lw	s4,8(sp)
80008db4:	00412a83          	lw	s5,4(sp)
80008db8:	00012b03          	lw	s6,0(sp)
80008dbc:	02010113          	addi	sp,sp,32
80008dc0:	00008067          	ret
80008dc4:	fc0588e3          	beqz	a1,80008d94 <dhcp_create_msg+0x28>
80008dc8:	00060913          	mv	s2,a2
80008dcc:	00058993          	mv	s3,a1
80008dd0:	00050493          	mv	s1,a0
80008dd4:	28000613          	li	a2,640
80008dd8:	13400593          	li	a1,308
80008ddc:	03800513          	li	a0,56
80008de0:	00068a13          	mv	s4,a3
80008de4:	b24fe0ef          	jal	ra,80007108 <pbuf_alloc>
80008de8:	00050a93          	mv	s5,a0
80008dec:	fa0504e3          	beqz	a0,80008d94 <dhcp_create_msg+0x28>
80008df0:	00300793          	li	a5,3
80008df4:	00f91663          	bne	s2,a5,80008e00 <dhcp_create_msg+0x94>
80008df8:	0059c783          	lbu	a5,5(s3)
80008dfc:	03279063          	bne	a5,s2,80008e1c <dhcp_create_msg+0xb0>
80008e00:	0069c703          	lbu	a4,6(s3)
80008e04:	00071863          	bnez	a4,80008e14 <dhcp_create_msg+0xa8>
80008e08:	8081a703          	lw	a4,-2040(gp) # 80003088 <xid.4812>
80008e0c:	00170713          	addi	a4,a4,1
80008e10:	80e1a423          	sw	a4,-2040(gp) # 80003088 <xid.4812>
80008e14:	8081a783          	lw	a5,-2040(gp) # 80003088 <xid.4812>
80008e18:	00f9a023          	sw	a5,0(s3)
80008e1c:	004aa403          	lw	s0,4(s5)
80008e20:	13400613          	li	a2,308
80008e24:	00000593          	li	a1,0
80008e28:	00100b13          	li	s6,1
80008e2c:	00040513          	mv	a0,s0
80008e30:	669030ef          	jal	ra,8000cc98 <memset>
80008e34:	01640023          	sb	s6,0(s0)
80008e38:	016400a3          	sb	s6,1(s0)
80008e3c:	0344c783          	lbu	a5,52(s1)
80008e40:	00f40123          	sb	a5,2(s0)
80008e44:	0009a503          	lw	a0,0(s3)
80008e48:	fe1fc0ef          	jal	ra,80005e28 <lwip_htonl>
80008e4c:	00855793          	srli	a5,a0,0x8
80008e50:	00a40223          	sb	a0,4(s0)
80008e54:	00f402a3          	sb	a5,5(s0)
80008e58:	01055793          	srli	a5,a0,0x10
80008e5c:	01855513          	srli	a0,a0,0x18
80008e60:	00f40323          	sb	a5,6(s0)
80008e64:	00a403a3          	sb	a0,7(s0)
80008e68:	00400793          	li	a5,4
80008e6c:	02f90463          	beq	s2,a5,80008e94 <dhcp_create_msg+0x128>
80008e70:	ff990793          	addi	a5,s2,-7
80008e74:	0ff7f793          	andi	a5,a5,255
80008e78:	00fb7e63          	bgeu	s6,a5,80008e94 <dhcp_create_msg+0x128>
80008e7c:	00300793          	li	a5,3
80008e80:	02f91a63          	bne	s2,a5,80008eb4 <dhcp_create_msg+0x148>
80008e84:	0059c783          	lbu	a5,5(s3)
80008e88:	ffc78793          	addi	a5,a5,-4
80008e8c:	0ff7f793          	andi	a5,a5,255
80008e90:	02fb6263          	bltu	s6,a5,80008eb4 <dhcp_create_msg+0x148>
80008e94:	0044a783          	lw	a5,4(s1)
80008e98:	0087d713          	srli	a4,a5,0x8
80008e9c:	00f40623          	sb	a5,12(s0)
80008ea0:	00e406a3          	sb	a4,13(s0)
80008ea4:	0107d713          	srli	a4,a5,0x10
80008ea8:	0187d793          	srli	a5,a5,0x18
80008eac:	00e40723          	sb	a4,14(s0)
80008eb0:	00f407a3          	sb	a5,15(s0)
80008eb4:	02e48793          	addi	a5,s1,46
80008eb8:	01c40713          	addi	a4,s0,28
80008ebc:	03448493          	addi	s1,s1,52
80008ec0:	0007c683          	lbu	a3,0(a5)
80008ec4:	00178793          	addi	a5,a5,1
80008ec8:	00170713          	addi	a4,a4,1
80008ecc:	fed70fa3          	sb	a3,-1(a4)
80008ed0:	fe9798e3          	bne	a5,s1,80008ec0 <dhcp_create_msg+0x154>
80008ed4:	06300793          	li	a5,99
80008ed8:	0ef40623          	sb	a5,236(s0)
80008edc:	f8200713          	li	a4,-126
80008ee0:	0ef407a3          	sb	a5,239(s0)
80008ee4:	03500793          	li	a5,53
80008ee8:	0ee406a3          	sb	a4,237(s0)
80008eec:	0ef40823          	sb	a5,240(s0)
80008ef0:	05300713          	li	a4,83
80008ef4:	00100793          	li	a5,1
80008ef8:	0ef408a3          	sb	a5,241(s0)
80008efc:	0ee40723          	sb	a4,238(s0)
80008f00:	0f240923          	sb	s2,242(s0)
80008f04:	00300793          	li	a5,3
80008f08:	00fa1023          	sh	a5,0(s4)
80008f0c:	e8dff06f          	j	80008d98 <dhcp_create_msg+0x2c>

80008f10 <dhcp_option_trailer>:
80008f10:	00150793          	addi	a5,a0,1
80008f14:	01079793          	slli	a5,a5,0x10
80008f18:	00a58733          	add	a4,a1,a0
80008f1c:	0107d793          	srli	a5,a5,0x10
80008f20:	fff00693          	li	a3,-1
80008f24:	00d70023          	sb	a3,0(a4)
80008f28:	00f585b3          	add	a1,a1,a5
80008f2c:	04300713          	li	a4,67
80008f30:	00f77c63          	bgeu	a4,a5,80008f48 <dhcp_option_trailer+0x38>
80008f34:	0f078593          	addi	a1,a5,240
80008f38:	01059593          	slli	a1,a1,0x10
80008f3c:	0105d593          	srli	a1,a1,0x10
80008f40:	00060513          	mv	a0,a2
80008f44:	b94fe06f          	j	800072d8 <pbuf_realloc>
80008f48:	00178793          	addi	a5,a5,1
80008f4c:	01079793          	slli	a5,a5,0x10
80008f50:	00058023          	sb	zero,0(a1)
80008f54:	0107d793          	srli	a5,a5,0x10
80008f58:	00158593          	addi	a1,a1,1
80008f5c:	fd5ff06f          	j	80008f30 <dhcp_option_trailer+0x20>

80008f60 <dhcp_reboot>:
80008f60:	fd010113          	addi	sp,sp,-48
80008f64:	02112623          	sw	ra,44(sp)
80008f68:	02812423          	sw	s0,40(sp)
80008f6c:	03212023          	sw	s2,32(sp)
80008f70:	02912223          	sw	s1,36(sp)
80008f74:	01312e23          	sw	s3,28(sp)
80008f78:	01412c23          	sw	s4,24(sp)
80008f7c:	02852483          	lw	s1,40(a0)
80008f80:	00050913          	mv	s2,a0
80008f84:	00300593          	li	a1,3
80008f88:	00048513          	mv	a0,s1
80008f8c:	d39ff0ef          	jal	ra,80008cc4 <dhcp_set_state>
80008f90:	00e10693          	addi	a3,sp,14
80008f94:	00300613          	li	a2,3
80008f98:	00048593          	mv	a1,s1
80008f9c:	00090513          	mv	a0,s2
80008fa0:	dcdff0ef          	jal	ra,80008d6c <dhcp_create_msg>
80008fa4:	fff00413          	li	s0,-1
80008fa8:	14050663          	beqz	a0,800090f4 <dhcp_reboot+0x194>
80008fac:	00452403          	lw	s0,4(a0)
80008fb0:	00e15783          	lhu	a5,14(sp)
80008fb4:	00050993          	mv	s3,a0
80008fb8:	0f040413          	addi	s0,s0,240
80008fbc:	00f40733          	add	a4,s0,a5
80008fc0:	00278513          	addi	a0,a5,2
80008fc4:	00178793          	addi	a5,a5,1
80008fc8:	01079793          	slli	a5,a5,0x10
80008fcc:	03900693          	li	a3,57
80008fd0:	0107d793          	srli	a5,a5,0x10
80008fd4:	00d70023          	sb	a3,0(a4)
80008fd8:	00f407b3          	add	a5,s0,a5
80008fdc:	00200713          	li	a4,2
80008fe0:	01051513          	slli	a0,a0,0x10
80008fe4:	00e78023          	sb	a4,0(a5)
80008fe8:	00040593          	mv	a1,s0
80008fec:	24000613          	li	a2,576
80008ff0:	01055513          	srli	a0,a0,0x10
80008ff4:	00a11723          	sh	a0,14(sp)
80008ff8:	ce5ff0ef          	jal	ra,80008cdc <dhcp_option_short>
80008ffc:	00a407b3          	add	a5,s0,a0
80009000:	00250a13          	addi	s4,a0,2
80009004:	00150513          	addi	a0,a0,1
80009008:	01051513          	slli	a0,a0,0x10
8000900c:	03200713          	li	a4,50
80009010:	01055513          	srli	a0,a0,0x10
80009014:	00e78023          	sb	a4,0(a5)
80009018:	00a40533          	add	a0,s0,a0
8000901c:	00400793          	li	a5,4
80009020:	00f50023          	sb	a5,0(a0)
80009024:	01c4a503          	lw	a0,28(s1)
80009028:	010a1a13          	slli	s4,s4,0x10
8000902c:	010a5a13          	srli	s4,s4,0x10
80009030:	01411723          	sh	s4,14(sp)
80009034:	df5fc0ef          	jal	ra,80005e28 <lwip_htonl>
80009038:	00050613          	mv	a2,a0
8000903c:	00040593          	mv	a1,s0
80009040:	000a0513          	mv	a0,s4
80009044:	cc9ff0ef          	jal	ra,80008d0c <dhcp_option_long>
80009048:	00a40733          	add	a4,s0,a0
8000904c:	03700693          	li	a3,55
80009050:	00d70023          	sb	a3,0(a4)
80009054:	00150713          	addi	a4,a0,1
80009058:	01071713          	slli	a4,a4,0x10
8000905c:	01075713          	srli	a4,a4,0x10
80009060:	00300693          	li	a3,3
80009064:	00e40733          	add	a4,s0,a4
80009068:	00d70023          	sb	a3,0(a4)
8000906c:	00250713          	addi	a4,a0,2
80009070:	01071713          	slli	a4,a4,0x10
80009074:	01075713          	srli	a4,a4,0x10
80009078:	00e40733          	add	a4,s0,a4
8000907c:	00100613          	li	a2,1
80009080:	00c70023          	sb	a2,0(a4)
80009084:	00050793          	mv	a5,a0
80009088:	00350713          	addi	a4,a0,3
8000908c:	01071713          	slli	a4,a4,0x10
80009090:	00478793          	addi	a5,a5,4
80009094:	01075713          	srli	a4,a4,0x10
80009098:	01079793          	slli	a5,a5,0x10
8000909c:	00e40733          	add	a4,s0,a4
800090a0:	00550513          	addi	a0,a0,5
800090a4:	0107d793          	srli	a5,a5,0x10
800090a8:	00d70023          	sb	a3,0(a4)
800090ac:	00f407b3          	add	a5,s0,a5
800090b0:	01c00713          	li	a4,28
800090b4:	01051513          	slli	a0,a0,0x10
800090b8:	00e78023          	sb	a4,0(a5)
800090bc:	01055513          	srli	a0,a0,0x10
800090c0:	00040593          	mv	a1,s0
800090c4:	00098613          	mv	a2,s3
800090c8:	00a11723          	sh	a0,14(sp)
800090cc:	e45ff0ef          	jal	ra,80008f10 <dhcp_option_trailer>
800090d0:	8ec1a503          	lw	a0,-1812(gp) # 8000316c <dhcp_pcb>
800090d4:	00090713          	mv	a4,s2
800090d8:	04300693          	li	a3,67
800090dc:	84418613          	addi	a2,gp,-1980 # 800030c4 <ip_addr_broadcast>
800090e0:	00098593          	mv	a1,s3
800090e4:	8f1ff0ef          	jal	ra,800089d4 <udp_sendto_if>
800090e8:	00050413          	mv	s0,a0
800090ec:	00098513          	mv	a0,s3
800090f0:	f45fd0ef          	jal	ra,80007034 <pbuf_free>
800090f4:	0064c783          	lbu	a5,6(s1)
800090f8:	0ff00713          	li	a4,255
800090fc:	00e78663          	beq	a5,a4,80009108 <dhcp_reboot+0x1a8>
80009100:	00178793          	addi	a5,a5,1
80009104:	00f48323          	sb	a5,6(s1)
80009108:	0064c503          	lbu	a0,6(s1)
8000910c:	00900793          	li	a5,9
80009110:	04a7ea63          	bltu	a5,a0,80009164 <dhcp_reboot+0x204>
80009114:	00551793          	slli	a5,a0,0x5
80009118:	40a787b3          	sub	a5,a5,a0
8000911c:	00279793          	slli	a5,a5,0x2
80009120:	00f50533          	add	a0,a0,a5
80009124:	00351513          	slli	a0,a0,0x3
80009128:	01051513          	slli	a0,a0,0x10
8000912c:	01055513          	srli	a0,a0,0x10
80009130:	1f400593          	li	a1,500
80009134:	1f350513          	addi	a0,a0,499
80009138:	268040ef          	jal	ra,8000d3a0 <__divsi3>
8000913c:	00a49423          	sh	a0,8(s1)
80009140:	02c12083          	lw	ra,44(sp)
80009144:	00040513          	mv	a0,s0
80009148:	02812403          	lw	s0,40(sp)
8000914c:	02412483          	lw	s1,36(sp)
80009150:	02012903          	lw	s2,32(sp)
80009154:	01c12983          	lw	s3,28(sp)
80009158:	01812a03          	lw	s4,24(sp)
8000915c:	03010113          	addi	sp,sp,48
80009160:	00008067          	ret
80009164:	00002537          	lui	a0,0x2
80009168:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
8000916c:	fc5ff06f          	j	80009130 <dhcp_reboot+0x1d0>

80009170 <dhcp_select>:
80009170:	fd010113          	addi	sp,sp,-48
80009174:	02812423          	sw	s0,40(sp)
80009178:	02112623          	sw	ra,44(sp)
8000917c:	02912223          	sw	s1,36(sp)
80009180:	03212023          	sw	s2,32(sp)
80009184:	01312e23          	sw	s3,28(sp)
80009188:	01412c23          	sw	s4,24(sp)
8000918c:	01512a23          	sw	s5,20(sp)
80009190:	ff000413          	li	s0,-16
80009194:	22050263          	beqz	a0,800093b8 <dhcp_select+0x248>
80009198:	02852483          	lw	s1,40(a0)
8000919c:	ffa00413          	li	s0,-6
800091a0:	20048c63          	beqz	s1,800093b8 <dhcp_select+0x248>
800091a4:	00050913          	mv	s2,a0
800091a8:	00100593          	li	a1,1
800091ac:	00048513          	mv	a0,s1
800091b0:	b15ff0ef          	jal	ra,80008cc4 <dhcp_set_state>
800091b4:	00e10693          	addi	a3,sp,14
800091b8:	00300613          	li	a2,3
800091bc:	00048593          	mv	a1,s1
800091c0:	00090513          	mv	a0,s2
800091c4:	ba9ff0ef          	jal	ra,80008d6c <dhcp_create_msg>
800091c8:	00050993          	mv	s3,a0
800091cc:	fff00413          	li	s0,-1
800091d0:	18050a63          	beqz	a0,80009364 <dhcp_select+0x1f4>
800091d4:	00452403          	lw	s0,4(a0)
800091d8:	00e15783          	lhu	a5,14(sp)
800091dc:	03900693          	li	a3,57
800091e0:	0f040413          	addi	s0,s0,240
800091e4:	00f40733          	add	a4,s0,a5
800091e8:	00278513          	addi	a0,a5,2
800091ec:	00178793          	addi	a5,a5,1
800091f0:	01079793          	slli	a5,a5,0x10
800091f4:	0107d793          	srli	a5,a5,0x10
800091f8:	00d70023          	sb	a3,0(a4)
800091fc:	00f407b3          	add	a5,s0,a5
80009200:	00200713          	li	a4,2
80009204:	00e78023          	sb	a4,0(a5)
80009208:	02c95603          	lhu	a2,44(s2)
8000920c:	01051513          	slli	a0,a0,0x10
80009210:	00040593          	mv	a1,s0
80009214:	01055513          	srli	a0,a0,0x10
80009218:	00a11723          	sh	a0,14(sp)
8000921c:	ac1ff0ef          	jal	ra,80008cdc <dhcp_option_short>
80009220:	00a407b3          	add	a5,s0,a0
80009224:	03200713          	li	a4,50
80009228:	00e78023          	sb	a4,0(a5)
8000922c:	00150793          	addi	a5,a0,1
80009230:	01079793          	slli	a5,a5,0x10
80009234:	0107d793          	srli	a5,a5,0x10
80009238:	00f407b3          	add	a5,s0,a5
8000923c:	00400a93          	li	s5,4
80009240:	01578023          	sb	s5,0(a5)
80009244:	00250a13          	addi	s4,a0,2
80009248:	01c4a503          	lw	a0,28(s1)
8000924c:	010a1a13          	slli	s4,s4,0x10
80009250:	010a5a13          	srli	s4,s4,0x10
80009254:	01411723          	sh	s4,14(sp)
80009258:	bd1fc0ef          	jal	ra,80005e28 <lwip_htonl>
8000925c:	00050613          	mv	a2,a0
80009260:	00040593          	mv	a1,s0
80009264:	000a0513          	mv	a0,s4
80009268:	aa5ff0ef          	jal	ra,80008d0c <dhcp_option_long>
8000926c:	00a407b3          	add	a5,s0,a0
80009270:	03600713          	li	a4,54
80009274:	00e78023          	sb	a4,0(a5)
80009278:	00150793          	addi	a5,a0,1
8000927c:	01079793          	slli	a5,a5,0x10
80009280:	0107d793          	srli	a5,a5,0x10
80009284:	00f407b3          	add	a5,s0,a5
80009288:	01578023          	sb	s5,0(a5)
8000928c:	00250a13          	addi	s4,a0,2
80009290:	0184a503          	lw	a0,24(s1)
80009294:	010a1a13          	slli	s4,s4,0x10
80009298:	010a5a13          	srli	s4,s4,0x10
8000929c:	01411723          	sh	s4,14(sp)
800092a0:	b89fc0ef          	jal	ra,80005e28 <lwip_htonl>
800092a4:	00050613          	mv	a2,a0
800092a8:	00040593          	mv	a1,s0
800092ac:	000a0513          	mv	a0,s4
800092b0:	a5dff0ef          	jal	ra,80008d0c <dhcp_option_long>
800092b4:	00a40733          	add	a4,s0,a0
800092b8:	03700693          	li	a3,55
800092bc:	00d70023          	sb	a3,0(a4)
800092c0:	00150713          	addi	a4,a0,1
800092c4:	01071713          	slli	a4,a4,0x10
800092c8:	01075713          	srli	a4,a4,0x10
800092cc:	00300693          	li	a3,3
800092d0:	00e40733          	add	a4,s0,a4
800092d4:	00d70023          	sb	a3,0(a4)
800092d8:	00250713          	addi	a4,a0,2
800092dc:	01071713          	slli	a4,a4,0x10
800092e0:	01075713          	srli	a4,a4,0x10
800092e4:	00e40733          	add	a4,s0,a4
800092e8:	00100613          	li	a2,1
800092ec:	00c70023          	sb	a2,0(a4)
800092f0:	00050793          	mv	a5,a0
800092f4:	00350713          	addi	a4,a0,3
800092f8:	01071713          	slli	a4,a4,0x10
800092fc:	00478793          	addi	a5,a5,4
80009300:	01075713          	srli	a4,a4,0x10
80009304:	01079793          	slli	a5,a5,0x10
80009308:	00e40733          	add	a4,s0,a4
8000930c:	00550513          	addi	a0,a0,5
80009310:	0107d793          	srli	a5,a5,0x10
80009314:	00d70023          	sb	a3,0(a4)
80009318:	00f407b3          	add	a5,s0,a5
8000931c:	01c00713          	li	a4,28
80009320:	01051513          	slli	a0,a0,0x10
80009324:	00e78023          	sb	a4,0(a5)
80009328:	01055513          	srli	a0,a0,0x10
8000932c:	00040593          	mv	a1,s0
80009330:	00098613          	mv	a2,s3
80009334:	00a11723          	sh	a0,14(sp)
80009338:	bd9ff0ef          	jal	ra,80008f10 <dhcp_option_trailer>
8000933c:	8ec1a503          	lw	a0,-1812(gp) # 8000316c <dhcp_pcb>
80009340:	84818793          	addi	a5,gp,-1976 # 800030c8 <ip_addr_any>
80009344:	00090713          	mv	a4,s2
80009348:	04300693          	li	a3,67
8000934c:	84418613          	addi	a2,gp,-1980 # 800030c4 <ip_addr_broadcast>
80009350:	00098593          	mv	a1,s3
80009354:	c8cff0ef          	jal	ra,800087e0 <udp_sendto_if_src>
80009358:	00050413          	mv	s0,a0
8000935c:	00098513          	mv	a0,s3
80009360:	cd5fd0ef          	jal	ra,80007034 <pbuf_free>
80009364:	0064c783          	lbu	a5,6(s1)
80009368:	0ff00713          	li	a4,255
8000936c:	00e78663          	beq	a5,a4,80009378 <dhcp_select+0x208>
80009370:	00178793          	addi	a5,a5,1
80009374:	00f48323          	sb	a5,6(s1)
80009378:	0064c783          	lbu	a5,6(s1)
8000937c:	00500713          	li	a4,5
80009380:	06f76063          	bltu	a4,a5,800093e0 <dhcp_select+0x270>
80009384:	00100513          	li	a0,1
80009388:	00f51533          	sll	a0,a0,a5
8000938c:	00551793          	slli	a5,a0,0x5
80009390:	40a787b3          	sub	a5,a5,a0
80009394:	00279793          	slli	a5,a5,0x2
80009398:	00f50533          	add	a0,a0,a5
8000939c:	00351513          	slli	a0,a0,0x3
800093a0:	01051513          	slli	a0,a0,0x10
800093a4:	01055513          	srli	a0,a0,0x10
800093a8:	1f400593          	li	a1,500
800093ac:	1f350513          	addi	a0,a0,499
800093b0:	7f1030ef          	jal	ra,8000d3a0 <__divsi3>
800093b4:	00a49423          	sh	a0,8(s1)
800093b8:	00040513          	mv	a0,s0
800093bc:	02c12083          	lw	ra,44(sp)
800093c0:	02812403          	lw	s0,40(sp)
800093c4:	02412483          	lw	s1,36(sp)
800093c8:	02012903          	lw	s2,32(sp)
800093cc:	01c12983          	lw	s3,28(sp)
800093d0:	01812a03          	lw	s4,24(sp)
800093d4:	01412a83          	lw	s5,20(sp)
800093d8:	03010113          	addi	sp,sp,48
800093dc:	00008067          	ret
800093e0:	0000f537          	lui	a0,0xf
800093e4:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
800093e8:	fc1ff06f          	j	800093a8 <dhcp_select+0x238>

800093ec <dhcp_discover>:
800093ec:	fd010113          	addi	sp,sp,-48
800093f0:	01312e23          	sw	s3,28(sp)
800093f4:	02112623          	sw	ra,44(sp)
800093f8:	02812423          	sw	s0,40(sp)
800093fc:	02912223          	sw	s1,36(sp)
80009400:	03212023          	sw	s2,32(sp)
80009404:	02852483          	lw	s1,40(a0)
80009408:	00050993          	mv	s3,a0
8000940c:	00600593          	li	a1,6
80009410:	00048513          	mv	a0,s1
80009414:	0004ae23          	sw	zero,28(s1)
80009418:	8adff0ef          	jal	ra,80008cc4 <dhcp_set_state>
8000941c:	00e10693          	addi	a3,sp,14
80009420:	00100613          	li	a2,1
80009424:	00048593          	mv	a1,s1
80009428:	00098513          	mv	a0,s3
8000942c:	941ff0ef          	jal	ra,80008d6c <dhcp_create_msg>
80009430:	10050063          	beqz	a0,80009530 <dhcp_discover+0x144>
80009434:	00452403          	lw	s0,4(a0)
80009438:	00e15783          	lhu	a5,14(sp)
8000943c:	00050913          	mv	s2,a0
80009440:	0f040413          	addi	s0,s0,240
80009444:	00f40733          	add	a4,s0,a5
80009448:	00278513          	addi	a0,a5,2
8000944c:	00178793          	addi	a5,a5,1
80009450:	01079793          	slli	a5,a5,0x10
80009454:	03900693          	li	a3,57
80009458:	0107d793          	srli	a5,a5,0x10
8000945c:	00d70023          	sb	a3,0(a4)
80009460:	00f407b3          	add	a5,s0,a5
80009464:	00200713          	li	a4,2
80009468:	00e78023          	sb	a4,0(a5)
8000946c:	02c9d603          	lhu	a2,44(s3)
80009470:	01051513          	slli	a0,a0,0x10
80009474:	01055513          	srli	a0,a0,0x10
80009478:	00040593          	mv	a1,s0
8000947c:	00a11723          	sh	a0,14(sp)
80009480:	85dff0ef          	jal	ra,80008cdc <dhcp_option_short>
80009484:	00a40733          	add	a4,s0,a0
80009488:	03700693          	li	a3,55
8000948c:	00d70023          	sb	a3,0(a4)
80009490:	00150713          	addi	a4,a0,1
80009494:	01071713          	slli	a4,a4,0x10
80009498:	01075713          	srli	a4,a4,0x10
8000949c:	00300613          	li	a2,3
800094a0:	00e40733          	add	a4,s0,a4
800094a4:	00c70023          	sb	a2,0(a4)
800094a8:	00250713          	addi	a4,a0,2
800094ac:	01071713          	slli	a4,a4,0x10
800094b0:	01075713          	srli	a4,a4,0x10
800094b4:	00e40733          	add	a4,s0,a4
800094b8:	00100693          	li	a3,1
800094bc:	00d70023          	sb	a3,0(a4)
800094c0:	00050793          	mv	a5,a0
800094c4:	00350693          	addi	a3,a0,3
800094c8:	01069693          	slli	a3,a3,0x10
800094cc:	00478793          	addi	a5,a5,4
800094d0:	0106d693          	srli	a3,a3,0x10
800094d4:	01079793          	slli	a5,a5,0x10
800094d8:	00d406b3          	add	a3,s0,a3
800094dc:	00550513          	addi	a0,a0,5
800094e0:	0107d793          	srli	a5,a5,0x10
800094e4:	00c68023          	sb	a2,0(a3)
800094e8:	00f407b3          	add	a5,s0,a5
800094ec:	01c00713          	li	a4,28
800094f0:	01051513          	slli	a0,a0,0x10
800094f4:	00e78023          	sb	a4,0(a5)
800094f8:	01055513          	srli	a0,a0,0x10
800094fc:	00090613          	mv	a2,s2
80009500:	00040593          	mv	a1,s0
80009504:	00a11723          	sh	a0,14(sp)
80009508:	a09ff0ef          	jal	ra,80008f10 <dhcp_option_trailer>
8000950c:	8ec1a503          	lw	a0,-1812(gp) # 8000316c <dhcp_pcb>
80009510:	84818793          	addi	a5,gp,-1976 # 800030c8 <ip_addr_any>
80009514:	00098713          	mv	a4,s3
80009518:	04300693          	li	a3,67
8000951c:	84418613          	addi	a2,gp,-1980 # 800030c4 <ip_addr_broadcast>
80009520:	00090593          	mv	a1,s2
80009524:	abcff0ef          	jal	ra,800087e0 <udp_sendto_if_src>
80009528:	00090513          	mv	a0,s2
8000952c:	b09fd0ef          	jal	ra,80007034 <pbuf_free>
80009530:	0064c783          	lbu	a5,6(s1)
80009534:	0ff00713          	li	a4,255
80009538:	00e78663          	beq	a5,a4,80009544 <dhcp_discover+0x158>
8000953c:	00178793          	addi	a5,a5,1
80009540:	00f48323          	sb	a5,6(s1)
80009544:	0064c783          	lbu	a5,6(s1)
80009548:	00500713          	li	a4,5
8000954c:	04f76c63          	bltu	a4,a5,800095a4 <dhcp_discover+0x1b8>
80009550:	00100513          	li	a0,1
80009554:	00f51533          	sll	a0,a0,a5
80009558:	00551793          	slli	a5,a0,0x5
8000955c:	40a787b3          	sub	a5,a5,a0
80009560:	00279793          	slli	a5,a5,0x2
80009564:	00f50533          	add	a0,a0,a5
80009568:	00351513          	slli	a0,a0,0x3
8000956c:	01051513          	slli	a0,a0,0x10
80009570:	01055513          	srli	a0,a0,0x10
80009574:	1f400593          	li	a1,500
80009578:	1f350513          	addi	a0,a0,499
8000957c:	625030ef          	jal	ra,8000d3a0 <__divsi3>
80009580:	00a49423          	sh	a0,8(s1)
80009584:	02c12083          	lw	ra,44(sp)
80009588:	02812403          	lw	s0,40(sp)
8000958c:	02412483          	lw	s1,36(sp)
80009590:	02012903          	lw	s2,32(sp)
80009594:	01c12983          	lw	s3,28(sp)
80009598:	00000513          	li	a0,0
8000959c:	03010113          	addi	sp,sp,48
800095a0:	00008067          	ret
800095a4:	0000f537          	lui	a0,0xf
800095a8:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
800095ac:	fc9ff06f          	j	80009574 <dhcp_discover+0x188>

800095b0 <dhcp_check>:
800095b0:	ff010113          	addi	sp,sp,-16
800095b4:	00112623          	sw	ra,12(sp)
800095b8:	00912223          	sw	s1,4(sp)
800095bc:	00812423          	sw	s0,8(sp)
800095c0:	02852403          	lw	s0,40(a0)
800095c4:	00050493          	mv	s1,a0
800095c8:	00800593          	li	a1,8
800095cc:	00040513          	mv	a0,s0
800095d0:	ef4ff0ef          	jal	ra,80008cc4 <dhcp_set_state>
800095d4:	00000613          	li	a2,0
800095d8:	01c40593          	addi	a1,s0,28
800095dc:	00048513          	mv	a0,s1
800095e0:	4b5010ef          	jal	ra,8000b294 <etharp_query>
800095e4:	00644783          	lbu	a5,6(s0)
800095e8:	0ff00713          	li	a4,255
800095ec:	00e78663          	beq	a5,a4,800095f8 <dhcp_check+0x48>
800095f0:	00178793          	addi	a5,a5,1
800095f4:	00f40323          	sb	a5,6(s0)
800095f8:	00100793          	li	a5,1
800095fc:	00f41423          	sh	a5,8(s0)
80009600:	00c12083          	lw	ra,12(sp)
80009604:	00812403          	lw	s0,8(sp)
80009608:	00412483          	lw	s1,4(sp)
8000960c:	01010113          	addi	sp,sp,16
80009610:	00008067          	ret

80009614 <dhcp_bind>:
80009614:	1a050863          	beqz	a0,800097c4 <dhcp_bind+0x1b0>
80009618:	fe010113          	addi	sp,sp,-32
8000961c:	00112e23          	sw	ra,28(sp)
80009620:	00812c23          	sw	s0,24(sp)
80009624:	00912a23          	sw	s1,20(sp)
80009628:	02852403          	lw	s0,40(a0)
8000962c:	10040a63          	beqz	s0,80009740 <dhcp_bind+0x12c>
80009630:	00050493          	mv	s1,a0
80009634:	02842503          	lw	a0,40(s0)
80009638:	00041923          	sh	zero,18(s0)
8000963c:	fff00793          	li	a5,-1
80009640:	02f50463          	beq	a0,a5,80009668 <dhcp_bind+0x54>
80009644:	01e50513          	addi	a0,a0,30
80009648:	003c07b7          	lui	a5,0x3c0
8000964c:	10f57463          	bgeu	a0,a5,80009754 <dhcp_bind+0x140>
80009650:	03c00593          	li	a1,60
80009654:	555030ef          	jal	ra,8000d3a8 <__udivsi3>
80009658:	01051793          	slli	a5,a0,0x10
8000965c:	0107d793          	srli	a5,a5,0x10
80009660:	10050063          	beqz	a0,80009760 <dhcp_bind+0x14c>
80009664:	00f41a23          	sh	a5,20(s0)
80009668:	02c42503          	lw	a0,44(s0)
8000966c:	fff00793          	li	a5,-1
80009670:	02f50863          	beq	a0,a5,800096a0 <dhcp_bind+0x8c>
80009674:	01e50513          	addi	a0,a0,30
80009678:	003c07b7          	lui	a5,0x3c0
8000967c:	0ef57663          	bgeu	a0,a5,80009768 <dhcp_bind+0x154>
80009680:	03c00593          	li	a1,60
80009684:	525030ef          	jal	ra,8000d3a8 <__udivsi3>
80009688:	01051793          	slli	a5,a0,0x10
8000968c:	0107d793          	srli	a5,a5,0x10
80009690:	0e050263          	beqz	a0,80009774 <dhcp_bind+0x160>
80009694:	00f41523          	sh	a5,10(s0)
80009698:	00a45783          	lhu	a5,10(s0)
8000969c:	00f41723          	sh	a5,14(s0)
800096a0:	03042503          	lw	a0,48(s0)
800096a4:	fff00793          	li	a5,-1
800096a8:	02f50863          	beq	a0,a5,800096d8 <dhcp_bind+0xc4>
800096ac:	01e50513          	addi	a0,a0,30
800096b0:	003c07b7          	lui	a5,0x3c0
800096b4:	0cf57463          	bgeu	a0,a5,8000977c <dhcp_bind+0x168>
800096b8:	03c00593          	li	a1,60
800096bc:	4ed030ef          	jal	ra,8000d3a8 <__udivsi3>
800096c0:	01051793          	slli	a5,a0,0x10
800096c4:	0107d793          	srli	a5,a5,0x10
800096c8:	0c050063          	beqz	a0,80009788 <dhcp_bind+0x174>
800096cc:	00f41623          	sh	a5,12(s0)
800096d0:	00c45783          	lhu	a5,12(s0)
800096d4:	00f41823          	sh	a5,16(s0)
800096d8:	00c45783          	lhu	a5,12(s0)
800096dc:	00a45703          	lhu	a4,10(s0)
800096e0:	00f76663          	bltu	a4,a5,800096ec <dhcp_bind+0xd8>
800096e4:	00078463          	beqz	a5,800096ec <dhcp_bind+0xd8>
800096e8:	00041523          	sh	zero,10(s0)
800096ec:	00744783          	lbu	a5,7(s0)
800096f0:	0a078063          	beqz	a5,80009790 <dhcp_bind+0x17c>
800096f4:	02042783          	lw	a5,32(s0)
800096f8:	00f12423          	sw	a5,8(sp)
800096fc:	02442783          	lw	a5,36(s0)
80009700:	00f12623          	sw	a5,12(sp)
80009704:	00079e63          	bnez	a5,80009720 <dhcp_bind+0x10c>
80009708:	00812703          	lw	a4,8(sp)
8000970c:	01c42783          	lw	a5,28(s0)
80009710:	00e7f7b3          	and	a5,a5,a4
80009714:	01000737          	lui	a4,0x1000
80009718:	00e7e7b3          	or	a5,a5,a4
8000971c:	00f12623          	sw	a5,12(sp)
80009720:	00a00593          	li	a1,10
80009724:	00040513          	mv	a0,s0
80009728:	d9cff0ef          	jal	ra,80008cc4 <dhcp_set_state>
8000972c:	00c10693          	addi	a3,sp,12
80009730:	00810613          	addi	a2,sp,8
80009734:	01c40593          	addi	a1,s0,28
80009738:	00048513          	mv	a0,s1
8000973c:	9c0fd0ef          	jal	ra,800068fc <netif_set_addr>
80009740:	01c12083          	lw	ra,28(sp)
80009744:	01812403          	lw	s0,24(sp)
80009748:	01412483          	lw	s1,20(sp)
8000974c:	02010113          	addi	sp,sp,32
80009750:	00008067          	ret
80009754:	000107b7          	lui	a5,0x10
80009758:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
8000975c:	f09ff06f          	j	80009664 <dhcp_bind+0x50>
80009760:	00100793          	li	a5,1
80009764:	f01ff06f          	j	80009664 <dhcp_bind+0x50>
80009768:	000107b7          	lui	a5,0x10
8000976c:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80009770:	f25ff06f          	j	80009694 <dhcp_bind+0x80>
80009774:	00100793          	li	a5,1
80009778:	f1dff06f          	j	80009694 <dhcp_bind+0x80>
8000977c:	000107b7          	lui	a5,0x10
80009780:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80009784:	f49ff06f          	j	800096cc <dhcp_bind+0xb8>
80009788:	00100793          	li	a5,1
8000978c:	f41ff06f          	j	800096cc <dhcp_bind+0xb8>
80009790:	01c44783          	lbu	a5,28(s0)
80009794:	01879713          	slli	a4,a5,0x18
80009798:	41875713          	srai	a4,a4,0x18
8000979c:	00074663          	bltz	a4,800097a8 <dhcp_bind+0x194>
800097a0:	0ff00793          	li	a5,255
800097a4:	f55ff06f          	j	800096f8 <dhcp_bind+0xe4>
800097a8:	0bf00713          	li	a4,191
800097ac:	00f77863          	bgeu	a4,a5,800097bc <dhcp_bind+0x1a8>
800097b0:	010007b7          	lui	a5,0x1000
800097b4:	fff78793          	addi	a5,a5,-1 # ffffff <_stack_size+0xfff7ff>
800097b8:	f41ff06f          	j	800096f8 <dhcp_bind+0xe4>
800097bc:	000107b7          	lui	a5,0x10
800097c0:	ff5ff06f          	j	800097b4 <dhcp_bind+0x1a0>
800097c4:	00008067          	ret

800097c8 <dhcp_inc_pcb_refcount>:
800097c8:	ff010113          	addi	sp,sp,-16
800097cc:	00812423          	sw	s0,8(sp)
800097d0:	8e81c783          	lbu	a5,-1816(gp) # 80003168 <dhcp_pcb_refcount>
800097d4:	00112623          	sw	ra,12(sp)
800097d8:	00912223          	sw	s1,4(sp)
800097dc:	01212023          	sw	s2,0(sp)
800097e0:	04079863          	bnez	a5,80009830 <dhcp_inc_pcb_refcount+0x68>
800097e4:	c4cff0ef          	jal	ra,80008c30 <udp_new>
800097e8:	8ea1a623          	sw	a0,-1812(gp) # 8000316c <dhcp_pcb>
800097ec:	fff00713          	li	a4,-1
800097f0:	04050863          	beqz	a0,80009840 <dhcp_inc_pcb_refcount+0x78>
800097f4:	00954703          	lbu	a4,9(a0)
800097f8:	04400613          	li	a2,68
800097fc:	02076713          	ori	a4,a4,32
80009800:	00e504a3          	sb	a4,9(a0)
80009804:	84818593          	addi	a1,gp,-1976 # 800030c8 <ip_addr_any>
80009808:	ee9fe0ef          	jal	ra,800086f0 <udp_bind>
8000980c:	8ec1a503          	lw	a0,-1812(gp) # 8000316c <dhcp_pcb>
80009810:	04300613          	li	a2,67
80009814:	84818593          	addi	a1,gp,-1976 # 800030c8 <ip_addr_any>
80009818:	af8ff0ef          	jal	ra,80008b10 <udp_connect>
8000981c:	8ec1a503          	lw	a0,-1812(gp) # 8000316c <dhcp_pcb>
80009820:	8000a5b7          	lui	a1,0x8000a
80009824:	00000613          	li	a2,0
80009828:	98858593          	addi	a1,a1,-1656 # 80009988 <_ram_heap_end+0xffff7988>
8000982c:	bb0ff0ef          	jal	ra,80008bdc <udp_recv>
80009830:	8e81c783          	lbu	a5,-1816(gp) # 80003168 <dhcp_pcb_refcount>
80009834:	00000713          	li	a4,0
80009838:	00178793          	addi	a5,a5,1 # 10001 <_stack_size+0xf801>
8000983c:	8ef18423          	sb	a5,-1816(gp) # 80003168 <dhcp_pcb_refcount>
80009840:	00c12083          	lw	ra,12(sp)
80009844:	00812403          	lw	s0,8(sp)
80009848:	00412483          	lw	s1,4(sp)
8000984c:	00012903          	lw	s2,0(sp)
80009850:	00070513          	mv	a0,a4
80009854:	01010113          	addi	sp,sp,16
80009858:	00008067          	ret

8000985c <dhcp_handle_ack.isra.0>:
8000985c:	ff010113          	addi	sp,sp,-16
80009860:	00912223          	sw	s1,4(sp)
80009864:	00812423          	sw	s0,8(sp)
80009868:	00112623          	sw	ra,12(sp)
8000986c:	8f018793          	addi	a5,gp,-1808 # 80003170 <dhcp_rx_options_given>
80009870:	0037c783          	lbu	a5,3(a5)
80009874:	02052023          	sw	zero,32(a0)
80009878:	02052223          	sw	zero,36(a0)
8000987c:	00050413          	mv	s0,a0
80009880:	8f018493          	addi	s1,gp,-1808 # 80003170 <dhcp_rx_options_given>
80009884:	00078663          	beqz	a5,80009890 <dhcp_handle_ack.isra.0+0x34>
80009888:	b381a783          	lw	a5,-1224(gp) # 800033b8 <dhcp_rx_options_val+0xc>
8000988c:	02f52423          	sw	a5,40(a0)
80009890:	0044c783          	lbu	a5,4(s1)
80009894:	08078663          	beqz	a5,80009920 <dhcp_handle_ack.isra.0+0xc4>
80009898:	b3c1a783          	lw	a5,-1220(gp) # 800033bc <dhcp_rx_options_val+0x10>
8000989c:	02f42623          	sw	a5,44(s0)
800098a0:	0054c783          	lbu	a5,5(s1)
800098a4:	08078463          	beqz	a5,8000992c <dhcp_handle_ack.isra.0+0xd0>
800098a8:	b401a783          	lw	a5,-1216(gp) # 800033c0 <dhcp_rx_options_val+0x14>
800098ac:	02f42823          	sw	a5,48(s0)
800098b0:	0115c703          	lbu	a4,17(a1)
800098b4:	0105c783          	lbu	a5,16(a1)
800098b8:	00871713          	slli	a4,a4,0x8
800098bc:	00f76733          	or	a4,a4,a5
800098c0:	0125c783          	lbu	a5,18(a1)
800098c4:	01079793          	slli	a5,a5,0x10
800098c8:	00e7e733          	or	a4,a5,a4
800098cc:	0135c783          	lbu	a5,19(a1)
800098d0:	01879793          	slli	a5,a5,0x18
800098d4:	00e7e7b3          	or	a5,a5,a4
800098d8:	00f42e23          	sw	a5,28(s0)
800098dc:	0064c783          	lbu	a5,6(s1)
800098e0:	06078063          	beqz	a5,80009940 <dhcp_handle_ack.isra.0+0xe4>
800098e4:	b441a503          	lw	a0,-1212(gp) # 800033c4 <dhcp_rx_options_val+0x18>
800098e8:	d40fc0ef          	jal	ra,80005e28 <lwip_htonl>
800098ec:	00100793          	li	a5,1
800098f0:	02a42023          	sw	a0,32(s0)
800098f4:	00f403a3          	sb	a5,7(s0)
800098f8:	0074c783          	lbu	a5,7(s1)
800098fc:	00078863          	beqz	a5,8000990c <dhcp_handle_ack.isra.0+0xb0>
80009900:	b481a503          	lw	a0,-1208(gp) # 800033c8 <dhcp_rx_options_val+0x1c>
80009904:	d24fc0ef          	jal	ra,80005e28 <lwip_htonl>
80009908:	02a42223          	sw	a0,36(s0)
8000990c:	00c12083          	lw	ra,12(sp)
80009910:	00812403          	lw	s0,8(sp)
80009914:	00412483          	lw	s1,4(sp)
80009918:	01010113          	addi	sp,sp,16
8000991c:	00008067          	ret
80009920:	02842783          	lw	a5,40(s0)
80009924:	0017d793          	srli	a5,a5,0x1
80009928:	f75ff06f          	j	8000989c <dhcp_handle_ack.isra.0+0x40>
8000992c:	02842703          	lw	a4,40(s0)
80009930:	00371793          	slli	a5,a4,0x3
80009934:	40e787b3          	sub	a5,a5,a4
80009938:	0037d793          	srli	a5,a5,0x3
8000993c:	f71ff06f          	j	800098ac <dhcp_handle_ack.isra.0+0x50>
80009940:	000403a3          	sb	zero,7(s0)
80009944:	fb5ff06f          	j	800098f8 <dhcp_handle_ack.isra.0+0x9c>

80009948 <dhcp_dec_pcb_refcount>:
80009948:	8e81c783          	lbu	a5,-1816(gp) # 80003168 <dhcp_pcb_refcount>
8000994c:	fff78793          	addi	a5,a5,-1
80009950:	0ff7f793          	andi	a5,a5,255
80009954:	8ef18423          	sb	a5,-1816(gp) # 80003168 <dhcp_pcb_refcount>
80009958:	02079663          	bnez	a5,80009984 <dhcp_dec_pcb_refcount+0x3c>
8000995c:	ff010113          	addi	sp,sp,-16
80009960:	00812423          	sw	s0,8(sp)
80009964:	8ec1a503          	lw	a0,-1812(gp) # 8000316c <dhcp_pcb>
80009968:	00112623          	sw	ra,12(sp)
8000996c:	a80ff0ef          	jal	ra,80008bec <udp_remove>
80009970:	00c12083          	lw	ra,12(sp)
80009974:	8e01a623          	sw	zero,-1812(gp) # 8000316c <dhcp_pcb>
80009978:	00812403          	lw	s0,8(sp)
8000997c:	01010113          	addi	sp,sp,16
80009980:	00008067          	ret
80009984:	00008067          	ret

80009988 <dhcp_recv>:
80009988:	fa010113          	addi	sp,sp,-96
8000998c:	05212823          	sw	s2,80(sp)
80009990:	9f81a903          	lw	s2,-1544(gp) # 80003278 <ip_data+0x4>
80009994:	05312623          	sw	s3,76(sp)
80009998:	04112e23          	sw	ra,92(sp)
8000999c:	04812c23          	sw	s0,88(sp)
800099a0:	04912a23          	sw	s1,84(sp)
800099a4:	05412423          	sw	s4,72(sp)
800099a8:	05512223          	sw	s5,68(sp)
800099ac:	05612023          	sw	s6,64(sp)
800099b0:	03712e23          	sw	s7,60(sp)
800099b4:	03812c23          	sw	s8,56(sp)
800099b8:	03912a23          	sw	s9,52(sp)
800099bc:	03a12823          	sw	s10,48(sp)
800099c0:	03b12623          	sw	s11,44(sp)
800099c4:	02892b83          	lw	s7,40(s2)
800099c8:	00060993          	mv	s3,a2
800099cc:	0e0b8663          	beqz	s7,80009ab8 <dhcp_recv+0x130>
800099d0:	004bc783          	lbu	a5,4(s7)
800099d4:	0e078263          	beqz	a5,80009ab8 <dhcp_recv+0x130>
800099d8:	00a65703          	lhu	a4,10(a2)
800099dc:	02b00793          	li	a5,43
800099e0:	0ce7fc63          	bgeu	a5,a4,80009ab8 <dhcp_recv+0x130>
800099e4:	00462783          	lw	a5,4(a2)
800099e8:	00200713          	li	a4,2
800099ec:	0007c683          	lbu	a3,0(a5)
800099f0:	0ce69463          	bne	a3,a4,80009ab8 <dhcp_recv+0x130>
800099f4:	03494603          	lbu	a2,52(s2)
800099f8:	00000713          	li	a4,0
800099fc:	00600693          	li	a3,6
80009a00:	0ff77593          	andi	a1,a4,255
80009a04:	00c5f463          	bgeu	a1,a2,80009a0c <dhcp_recv+0x84>
80009a08:	08d71c63          	bne	a4,a3,80009aa0 <dhcp_recv+0x118>
80009a0c:	0057c503          	lbu	a0,5(a5)
80009a10:	0047c703          	lbu	a4,4(a5)
80009a14:	00851513          	slli	a0,a0,0x8
80009a18:	00e56533          	or	a0,a0,a4
80009a1c:	0067c703          	lbu	a4,6(a5)
80009a20:	01071713          	slli	a4,a4,0x10
80009a24:	00a76733          	or	a4,a4,a0
80009a28:	0077c503          	lbu	a0,7(a5)
80009a2c:	01851513          	slli	a0,a0,0x18
80009a30:	00e56533          	or	a0,a0,a4
80009a34:	bf4fc0ef          	jal	ra,80005e28 <lwip_htonl>
80009a38:	000ba783          	lw	a5,0(s7)
80009a3c:	06f51e63          	bne	a0,a5,80009ab8 <dhcp_recv+0x130>
80009a40:	8f018793          	addi	a5,gp,-1808 # 80003170 <dhcp_rx_options_given>
80009a44:	0007a223          	sw	zero,4(a5)
80009a48:	00a9d703          	lhu	a4,10(s3)
80009a4c:	0007a023          	sw	zero,0(a5)
80009a50:	02b00793          	li	a5,43
80009a54:	8f018813          	addi	a6,gp,-1808 # 80003170 <dhcp_rx_options_given>
80009a58:	06e7f063          	bgeu	a5,a4,80009ab8 <dhcp_recv+0x130>
80009a5c:	00010ab7          	lui	s5,0x10
80009a60:	ffda8793          	addi	a5,s5,-3 # fffd <_stack_size+0xf7fd>
80009a64:	0089dd83          	lhu	s11,8(s3)
80009a68:	00f12423          	sw	a5,8(sp)
80009a6c:	b2c18793          	addi	a5,gp,-1236 # 800033ac <dhcp_rx_options_val>
80009a70:	00000b13          	li	s6,0
80009a74:	0f000d13          	li	s10,240
80009a78:	00f12223          	sw	a5,4(sp)
80009a7c:	00098c13          	mv	s8,s3
80009a80:	00ac5783          	lhu	a5,10(s8)
80009a84:	06fd7c63          	bgeu	s10,a5,80009afc <dhcp_recv+0x174>
80009a88:	004c2783          	lw	a5,4(s8)
80009a8c:	000d0413          	mv	s0,s10
80009a90:	00400a93          	li	s5,4
80009a94:	00f12023          	sw	a5,0(sp)
80009a98:	00100a13          	li	s4,1
80009a9c:	25c0006f          	j	80009cf8 <dhcp_recv+0x370>
80009aa0:	00e905b3          	add	a1,s2,a4
80009aa4:	00170713          	addi	a4,a4,1 # 1000001 <_stack_size+0xfff801>
80009aa8:	00e78533          	add	a0,a5,a4
80009aac:	02e5c583          	lbu	a1,46(a1)
80009ab0:	01b54503          	lbu	a0,27(a0)
80009ab4:	f4b506e3          	beq	a0,a1,80009a00 <dhcp_recv+0x78>
80009ab8:	00098513          	mv	a0,s3
80009abc:	d78fd0ef          	jal	ra,80007034 <pbuf_free>
80009ac0:	05c12083          	lw	ra,92(sp)
80009ac4:	05812403          	lw	s0,88(sp)
80009ac8:	05412483          	lw	s1,84(sp)
80009acc:	05012903          	lw	s2,80(sp)
80009ad0:	04c12983          	lw	s3,76(sp)
80009ad4:	04812a03          	lw	s4,72(sp)
80009ad8:	04412a83          	lw	s5,68(sp)
80009adc:	04012b03          	lw	s6,64(sp)
80009ae0:	03c12b83          	lw	s7,60(sp)
80009ae4:	03812c03          	lw	s8,56(sp)
80009ae8:	03412c83          	lw	s9,52(sp)
80009aec:	03012d03          	lw	s10,48(sp)
80009af0:	02c12d83          	lw	s11,44(sp)
80009af4:	06010113          	addi	sp,sp,96
80009af8:	00008067          	ret
80009afc:	000c2c03          	lw	s8,0(s8)
80009b00:	40fd0d33          	sub	s10,s10,a5
80009b04:	40fd8db3          	sub	s11,s11,a5
80009b08:	010d1d13          	slli	s10,s10,0x10
80009b0c:	010d9d93          	slli	s11,s11,0x10
80009b10:	010d5d13          	srli	s10,s10,0x10
80009b14:	010ddd93          	srli	s11,s11,0x10
80009b18:	f60c14e3          	bnez	s8,80009a80 <dhcp_recv+0xf8>
80009b1c:	f9dff06f          	j	80009ab8 <dhcp_recv+0x130>
80009b20:	00240693          	addi	a3,s0,2
80009b24:	01069693          	slli	a3,a3,0x10
80009b28:	0106d693          	srli	a3,a3,0x10
80009b2c:	f886e6e3          	bltu	a3,s0,80009ab8 <dhcp_recv+0x130>
80009b30:	00ac5583          	lhu	a1,10(s8)
80009b34:	00140613          	addi	a2,s0,1
80009b38:	02b65c63          	bge	a2,a1,80009b70 <dhcp_recv+0x1e8>
80009b3c:	00174703          	lbu	a4,1(a4)
80009b40:	03400593          	li	a1,52
80009b44:	12b78263          	beq	a5,a1,80009c68 <dhcp_recv+0x2e0>
80009b48:	02f5ee63          	bltu	a1,a5,80009b84 <dhcp_recv+0x1fc>
80009b4c:	07478263          	beq	a5,s4,80009bb0 <dhcp_recv+0x228>
80009b50:	16078663          	beqz	a5,80009cbc <dhcp_recv+0x334>
80009b54:	00300613          	li	a2,3
80009b58:	0ec78663          	beq	a5,a2,80009c44 <dhcp_recv+0x2bc>
80009b5c:	03300613          	li	a2,51
80009b60:	0ec78a63          	beq	a5,a2,80009c54 <dhcp_recv+0x2cc>
80009b64:	fff00493          	li	s1,-1
80009b68:	00000c93          	li	s9,0
80009b6c:	0500006f          	j	80009bbc <dhcp_recv+0x234>
80009b70:	000c2703          	lw	a4,0(s8)
80009b74:	32070263          	beqz	a4,80009e98 <dhcp_recv+0x510>
80009b78:	00472703          	lw	a4,4(a4)
80009b7c:	00074703          	lbu	a4,0(a4)
80009b80:	fc1ff06f          	j	80009b40 <dhcp_recv+0x1b8>
80009b84:	03600613          	li	a2,54
80009b88:	10c78863          	beq	a5,a2,80009c98 <dhcp_recv+0x310>
80009b8c:	0ec7ec63          	bltu	a5,a2,80009c84 <dhcp_recv+0x2fc>
80009b90:	03a00613          	li	a2,58
80009b94:	10c78c63          	beq	a5,a2,80009cac <dhcp_recv+0x324>
80009b98:	03b00613          	li	a2,59
80009b9c:	fcc794e3          	bne	a5,a2,80009b64 <dhcp_recv+0x1dc>
80009ba0:	f1571ce3          	bne	a4,s5,80009ab8 <dhcp_recv+0x130>
80009ba4:	00400c93          	li	s9,4
80009ba8:	00500493          	li	s1,5
80009bac:	0100006f          	j	80009bbc <dhcp_recv+0x234>
80009bb0:	f15714e3          	bne	a4,s5,80009ab8 <dhcp_recv+0x130>
80009bb4:	00400c93          	li	s9,4
80009bb8:	00600493          	li	s1,6
80009bbc:	00812783          	lw	a5,8(sp)
80009bc0:	00870433          	add	s0,a4,s0
80009bc4:	ee87cae3          	blt	a5,s0,80009ab8 <dhcp_recv+0x130>
80009bc8:	00e68733          	add	a4,a3,a4
80009bcc:	01071413          	slli	s0,a4,0x10
80009bd0:	01045413          	srli	s0,s0,0x10
80009bd4:	0e0c8863          	beqz	s9,80009cc4 <dhcp_recv+0x33c>
80009bd8:	009807b3          	add	a5,a6,s1
80009bdc:	0007c783          	lbu	a5,0(a5)
80009be0:	00012e23          	sw	zero,28(sp)
80009be4:	0e079063          	bnez	a5,80009cc4 <dhcp_recv+0x33c>
80009be8:	010c9793          	slli	a5,s9,0x10
80009bec:	0107d793          	srli	a5,a5,0x10
80009bf0:	00078613          	mv	a2,a5
80009bf4:	01c10593          	addi	a1,sp,28
80009bf8:	000c0513          	mv	a0,s8
80009bfc:	00f12623          	sw	a5,12(sp)
80009c00:	a19fd0ef          	jal	ra,80007618 <pbuf_copy_partial>
80009c04:	00c12783          	lw	a5,12(sp)
80009c08:	eaa798e3          	bne	a5,a0,80009ab8 <dhcp_recv+0x130>
80009c0c:	8f018813          	addi	a6,gp,-1808 # 80003170 <dhcp_rx_options_given>
80009c10:	155c9a63          	bne	s9,s5,80009d64 <dhcp_recv+0x3dc>
80009c14:	01c12503          	lw	a0,28(sp)
80009c18:	a10fc0ef          	jal	ra,80005e28 <lwip_htonl>
80009c1c:	00a12e23          	sw	a0,28(sp)
80009c20:	8f018813          	addi	a6,gp,-1808 # 80003170 <dhcp_rx_options_given>
80009c24:	009807b3          	add	a5,a6,s1
80009c28:	01478023          	sb	s4,0(a5)
80009c2c:	00412783          	lw	a5,4(sp)
80009c30:	00249493          	slli	s1,s1,0x2
80009c34:	009784b3          	add	s1,a5,s1
80009c38:	01c12783          	lw	a5,28(sp)
80009c3c:	00f4a023          	sw	a5,0(s1)
80009c40:	0840006f          	j	80009cc4 <dhcp_recv+0x33c>
80009c44:	e6e7fae3          	bgeu	a5,a4,80009ab8 <dhcp_recv+0x130>
80009c48:	00700493          	li	s1,7
80009c4c:	00400c93          	li	s9,4
80009c50:	f6dff06f          	j	80009bbc <dhcp_recv+0x234>
80009c54:	e75712e3          	bne	a4,s5,80009ab8 <dhcp_recv+0x130>
80009c58:	00400c93          	li	s9,4
80009c5c:	00300493          	li	s1,3
80009c60:	f5dff06f          	j	80009bbc <dhcp_recv+0x234>
80009c64:	00000713          	li	a4,0
80009c68:	e54718e3          	bne	a4,s4,80009ab8 <dhcp_recv+0x130>
80009c6c:	0f000793          	li	a5,240
80009c70:	e4fd14e3          	bne	s10,a5,80009ab8 <dhcp_recv+0x130>
80009c74:	00100c93          	li	s9,1
80009c78:	00000493          	li	s1,0
80009c7c:	f41ff06f          	j	80009bbc <dhcp_recv+0x234>
80009c80:	00000713          	li	a4,0
80009c84:	e3471ae3          	bne	a4,s4,80009ab8 <dhcp_recv+0x130>
80009c88:	00100c93          	li	s9,1
80009c8c:	00100493          	li	s1,1
80009c90:	f2dff06f          	j	80009bbc <dhcp_recv+0x234>
80009c94:	00000713          	li	a4,0
80009c98:	e35710e3          	bne	a4,s5,80009ab8 <dhcp_recv+0x130>
80009c9c:	00400c93          	li	s9,4
80009ca0:	00200493          	li	s1,2
80009ca4:	f19ff06f          	j	80009bbc <dhcp_recv+0x234>
80009ca8:	00000713          	li	a4,0
80009cac:	e15716e3          	bne	a4,s5,80009ab8 <dhcp_recv+0x130>
80009cb0:	00400c93          	li	s9,4
80009cb4:	00400493          	li	s1,4
80009cb8:	f05ff06f          	j	80009bbc <dhcp_recv+0x234>
80009cbc:	01061413          	slli	s0,a2,0x10
80009cc0:	01045413          	srli	s0,s0,0x10
80009cc4:	00ac5783          	lhu	a5,10(s8)
80009cc8:	02f46863          	bltu	s0,a5,80009cf8 <dhcp_recv+0x370>
80009ccc:	40f40433          	sub	s0,s0,a5
80009cd0:	40fd8db3          	sub	s11,s11,a5
80009cd4:	01041413          	slli	s0,s0,0x10
80009cd8:	010d9d93          	slli	s11,s11,0x10
80009cdc:	01045413          	srli	s0,s0,0x10
80009ce0:	010ddd93          	srli	s11,s11,0x10
80009ce4:	ddb47ae3          	bgeu	s0,s11,80009ab8 <dhcp_recv+0x130>
80009ce8:	000c2c03          	lw	s8,0(s8)
80009cec:	dc0c06e3          	beqz	s8,80009ab8 <dhcp_recv+0x130>
80009cf0:	004c2783          	lw	a5,4(s8)
80009cf4:	00f12023          	sw	a5,0(sp)
80009cf8:	01b47c63          	bgeu	s0,s11,80009d10 <dhcp_recv+0x388>
80009cfc:	00012783          	lw	a5,0(sp)
80009d00:	0ff00693          	li	a3,255
80009d04:	00878733          	add	a4,a5,s0
80009d08:	00074783          	lbu	a5,0(a4)
80009d0c:	e0d79ae3          	bne	a5,a3,80009b20 <dhcp_recv+0x198>
80009d10:	00084783          	lbu	a5,0(a6)
80009d14:	06079063          	bnez	a5,80009d74 <dhcp_recv+0x3ec>
80009d18:	060b1c63          	bnez	s6,80009d90 <dhcp_recv+0x408>
80009d1c:	00184783          	lbu	a5,1(a6)
80009d20:	d8078ce3          	beqz	a5,80009ab8 <dhcp_recv+0x130>
80009d24:	b2c18793          	addi	a5,gp,-1236 # 800033ac <dhcp_rx_options_val>
80009d28:	0047c703          	lbu	a4,4(a5)
80009d2c:	00500693          	li	a3,5
80009d30:	0049a583          	lw	a1,4(s3)
80009d34:	0ad71463          	bne	a4,a3,80009ddc <dhcp_recv+0x454>
80009d38:	005bc783          	lbu	a5,5(s7)
80009d3c:	00100713          	li	a4,1
80009d40:	06e79c63          	bne	a5,a4,80009db8 <dhcp_recv+0x430>
80009d44:	02892503          	lw	a0,40(s2)
80009d48:	b15ff0ef          	jal	ra,8000985c <dhcp_handle_ack.isra.0>
80009d4c:	03594783          	lbu	a5,53(s2)
80009d50:	00090513          	mv	a0,s2
80009d54:	0087f793          	andi	a5,a5,8
80009d58:	06078e63          	beqz	a5,80009dd4 <dhcp_recv+0x44c>
80009d5c:	855ff0ef          	jal	ra,800095b0 <dhcp_check>
80009d60:	d59ff06f          	j	80009ab8 <dhcp_recv+0x130>
80009d64:	d54c9ae3          	bne	s9,s4,80009ab8 <dhcp_recv+0x130>
80009d68:	01c14783          	lbu	a5,28(sp)
80009d6c:	00f12e23          	sw	a5,28(sp)
80009d70:	eb5ff06f          	j	80009c24 <dhcp_recv+0x29c>
80009d74:	00412783          	lw	a5,4(sp)
80009d78:	00080023          	sb	zero,0(a6)
80009d7c:	00100713          	li	a4,1
80009d80:	0007a783          	lw	a5,0(a5)
80009d84:	02e78463          	beq	a5,a4,80009dac <dhcp_recv+0x424>
80009d88:	00200713          	li	a4,2
80009d8c:	00e79a63          	bne	a5,a4,80009da0 <dhcp_recv+0x418>
80009d90:	00000b13          	li	s6,0
80009d94:	06c00d93          	li	s11,108
80009d98:	02c00d13          	li	s10,44
80009d9c:	ce1ff06f          	j	80009a7c <dhcp_recv+0xf4>
80009da0:	00300713          	li	a4,3
80009da4:	f6e79ae3          	bne	a5,a4,80009d18 <dhcp_recv+0x390>
80009da8:	00100b13          	li	s6,1
80009dac:	0ec00d93          	li	s11,236
80009db0:	06c00d13          	li	s10,108
80009db4:	cc9ff06f          	j	80009a7c <dhcp_recv+0xf4>
80009db8:	ffd78793          	addi	a5,a5,-3
80009dbc:	0ff7f793          	andi	a5,a5,255
80009dc0:	00200713          	li	a4,2
80009dc4:	cef76ae3          	bltu	a4,a5,80009ab8 <dhcp_recv+0x130>
80009dc8:	02892503          	lw	a0,40(s2)
80009dcc:	a91ff0ef          	jal	ra,8000985c <dhcp_handle_ack.isra.0>
80009dd0:	00090513          	mv	a0,s2
80009dd4:	841ff0ef          	jal	ra,80009614 <dhcp_bind>
80009dd8:	ce1ff06f          	j	80009ab8 <dhcp_recv+0x130>
80009ddc:	00600693          	li	a3,6
80009de0:	04d71663          	bne	a4,a3,80009e2c <dhcp_recv+0x4a4>
80009de4:	005bc703          	lbu	a4,5(s7)
80009de8:	00200693          	li	a3,2
80009dec:	ffd70793          	addi	a5,a4,-3
80009df0:	0ff7f793          	andi	a5,a5,255
80009df4:	00f6f663          	bgeu	a3,a5,80009e00 <dhcp_recv+0x478>
80009df8:	00100793          	li	a5,1
80009dfc:	caf71ee3          	bne	a4,a5,80009ab8 <dhcp_recv+0x130>
80009e00:	02892503          	lw	a0,40(s2)
80009e04:	00c00593          	li	a1,12
80009e08:	ebdfe0ef          	jal	ra,80008cc4 <dhcp_set_state>
80009e0c:	84818693          	addi	a3,gp,-1976 # 800030c8 <ip_addr_any>
80009e10:	84818613          	addi	a2,gp,-1976 # 800030c8 <ip_addr_any>
80009e14:	00090513          	mv	a0,s2
80009e18:	84818593          	addi	a1,gp,-1976 # 800030c8 <ip_addr_any>
80009e1c:	ae1fc0ef          	jal	ra,800068fc <netif_set_addr>
80009e20:	00090513          	mv	a0,s2
80009e24:	dc8ff0ef          	jal	ra,800093ec <dhcp_discover>
80009e28:	c91ff06f          	j	80009ab8 <dhcp_recv+0x130>
80009e2c:	00200613          	li	a2,2
80009e30:	c8c714e3          	bne	a4,a2,80009ab8 <dhcp_recv+0x130>
80009e34:	005bc703          	lbu	a4,5(s7)
80009e38:	c8d710e3          	bne	a4,a3,80009ab8 <dhcp_recv+0x130>
80009e3c:	00284703          	lbu	a4,2(a6)
80009e40:	c6070ce3          	beqz	a4,80009ab8 <dhcp_recv+0x130>
80009e44:	02892403          	lw	s0,40(s2)
80009e48:	00b12023          	sw	a1,0(sp)
80009e4c:	00041423          	sh	zero,8(s0)
80009e50:	0087a503          	lw	a0,8(a5)
80009e54:	fd5fb0ef          	jal	ra,80005e28 <lwip_htonl>
80009e58:	00012583          	lw	a1,0(sp)
80009e5c:	00a42c23          	sw	a0,24(s0)
80009e60:	00090513          	mv	a0,s2
80009e64:	0115c703          	lbu	a4,17(a1)
80009e68:	0105c783          	lbu	a5,16(a1)
80009e6c:	00871713          	slli	a4,a4,0x8
80009e70:	00f76733          	or	a4,a4,a5
80009e74:	0125c783          	lbu	a5,18(a1)
80009e78:	01079793          	slli	a5,a5,0x10
80009e7c:	00e7e733          	or	a4,a5,a4
80009e80:	0135c783          	lbu	a5,19(a1)
80009e84:	01879793          	slli	a5,a5,0x18
80009e88:	00e7e7b3          	or	a5,a5,a4
80009e8c:	00f42e23          	sw	a5,28(s0)
80009e90:	ae0ff0ef          	jal	ra,80009170 <dhcp_select>
80009e94:	c25ff06f          	j	80009ab8 <dhcp_recv+0x130>
80009e98:	03400713          	li	a4,52
80009e9c:	dce784e3          	beq	a5,a4,80009c64 <dhcp_recv+0x2dc>
80009ea0:	02f76263          	bltu	a4,a5,80009ec4 <dhcp_recv+0x53c>
80009ea4:	c1478ae3          	beq	a5,s4,80009ab8 <dhcp_recv+0x130>
80009ea8:	e0078ae3          	beqz	a5,80009cbc <dhcp_recv+0x334>
80009eac:	00300713          	li	a4,3
80009eb0:	c0e784e3          	beq	a5,a4,80009ab8 <dhcp_recv+0x130>
80009eb4:	03300713          	li	a4,51
80009eb8:	c0e780e3          	beq	a5,a4,80009ab8 <dhcp_recv+0x130>
80009ebc:	00000713          	li	a4,0
80009ec0:	ca5ff06f          	j	80009b64 <dhcp_recv+0x1dc>
80009ec4:	03600713          	li	a4,54
80009ec8:	dce786e3          	beq	a5,a4,80009c94 <dhcp_recv+0x30c>
80009ecc:	dae7eae3          	bltu	a5,a4,80009c80 <dhcp_recv+0x2f8>
80009ed0:	03a00713          	li	a4,58
80009ed4:	dce78ae3          	beq	a5,a4,80009ca8 <dhcp_recv+0x320>
80009ed8:	03b00613          	li	a2,59
80009edc:	00000713          	li	a4,0
80009ee0:	cbdff06f          	j	80009b9c <dhcp_recv+0x214>

80009ee4 <dhcp_set_struct>:
80009ee4:	ff010113          	addi	sp,sp,-16
80009ee8:	00058793          	mv	a5,a1
80009eec:	00812423          	sw	s0,8(sp)
80009ef0:	03400613          	li	a2,52
80009ef4:	00050413          	mv	s0,a0
80009ef8:	00000593          	li	a1,0
80009efc:	00078513          	mv	a0,a5
80009f00:	00112623          	sw	ra,12(sp)
80009f04:	595020ef          	jal	ra,8000cc98 <memset>
80009f08:	02a42423          	sw	a0,40(s0)
80009f0c:	00c12083          	lw	ra,12(sp)
80009f10:	00812403          	lw	s0,8(sp)
80009f14:	01010113          	addi	sp,sp,16
80009f18:	00008067          	ret

80009f1c <dhcp_cleanup>:
80009f1c:	02852783          	lw	a5,40(a0)
80009f20:	02078863          	beqz	a5,80009f50 <dhcp_cleanup+0x34>
80009f24:	ff010113          	addi	sp,sp,-16
80009f28:	00812423          	sw	s0,8(sp)
80009f2c:	00050413          	mv	s0,a0
80009f30:	00078513          	mv	a0,a5
80009f34:	00112623          	sw	ra,12(sp)
80009f38:	f0cfc0ef          	jal	ra,80006644 <lwip_free>
80009f3c:	02042423          	sw	zero,40(s0)
80009f40:	00c12083          	lw	ra,12(sp)
80009f44:	00812403          	lw	s0,8(sp)
80009f48:	01010113          	addi	sp,sp,16
80009f4c:	00008067          	ret
80009f50:	00008067          	ret

80009f54 <dhcp_inform>:
80009f54:	0e050a63          	beqz	a0,8000a048 <dhcp_inform+0xf4>
80009f58:	fb010113          	addi	sp,sp,-80
80009f5c:	04812423          	sw	s0,72(sp)
80009f60:	04112623          	sw	ra,76(sp)
80009f64:	04912223          	sw	s1,68(sp)
80009f68:	05212023          	sw	s2,64(sp)
80009f6c:	00050413          	mv	s0,a0
80009f70:	859ff0ef          	jal	ra,800097c8 <dhcp_inc_pcb_refcount>
80009f74:	0a051e63          	bnez	a0,8000a030 <dhcp_inform+0xdc>
80009f78:	03400613          	li	a2,52
80009f7c:	00000593          	li	a1,0
80009f80:	00c10513          	addi	a0,sp,12
80009f84:	515020ef          	jal	ra,8000cc98 <memset>
80009f88:	00700593          	li	a1,7
80009f8c:	00c10513          	addi	a0,sp,12
80009f90:	d35fe0ef          	jal	ra,80008cc4 <dhcp_set_state>
80009f94:	00a10693          	addi	a3,sp,10
80009f98:	00800613          	li	a2,8
80009f9c:	00c10593          	addi	a1,sp,12
80009fa0:	00040513          	mv	a0,s0
80009fa4:	dc9fe0ef          	jal	ra,80008d6c <dhcp_create_msg>
80009fa8:	00050913          	mv	s2,a0
80009fac:	08050063          	beqz	a0,8000a02c <dhcp_inform+0xd8>
80009fb0:	00452483          	lw	s1,4(a0)
80009fb4:	00a15783          	lhu	a5,10(sp)
80009fb8:	03900693          	li	a3,57
80009fbc:	0f048493          	addi	s1,s1,240
80009fc0:	00f48733          	add	a4,s1,a5
80009fc4:	00278513          	addi	a0,a5,2
80009fc8:	00178793          	addi	a5,a5,1
80009fcc:	01079793          	slli	a5,a5,0x10
80009fd0:	0107d793          	srli	a5,a5,0x10
80009fd4:	00d70023          	sb	a3,0(a4)
80009fd8:	00f487b3          	add	a5,s1,a5
80009fdc:	00200713          	li	a4,2
80009fe0:	00e78023          	sb	a4,0(a5)
80009fe4:	02c45603          	lhu	a2,44(s0)
80009fe8:	01051513          	slli	a0,a0,0x10
80009fec:	01055513          	srli	a0,a0,0x10
80009ff0:	00048593          	mv	a1,s1
80009ff4:	00a11523          	sh	a0,10(sp)
80009ff8:	ce5fe0ef          	jal	ra,80008cdc <dhcp_option_short>
80009ffc:	00090613          	mv	a2,s2
8000a000:	00048593          	mv	a1,s1
8000a004:	00a11523          	sh	a0,10(sp)
8000a008:	f09fe0ef          	jal	ra,80008f10 <dhcp_option_trailer>
8000a00c:	8ec1a503          	lw	a0,-1812(gp) # 8000316c <dhcp_pcb>
8000a010:	00040713          	mv	a4,s0
8000a014:	04300693          	li	a3,67
8000a018:	84418613          	addi	a2,gp,-1980 # 800030c4 <ip_addr_broadcast>
8000a01c:	00090593          	mv	a1,s2
8000a020:	9b5fe0ef          	jal	ra,800089d4 <udp_sendto_if>
8000a024:	00090513          	mv	a0,s2
8000a028:	80cfd0ef          	jal	ra,80007034 <pbuf_free>
8000a02c:	91dff0ef          	jal	ra,80009948 <dhcp_dec_pcb_refcount>
8000a030:	04c12083          	lw	ra,76(sp)
8000a034:	04812403          	lw	s0,72(sp)
8000a038:	04412483          	lw	s1,68(sp)
8000a03c:	04012903          	lw	s2,64(sp)
8000a040:	05010113          	addi	sp,sp,80
8000a044:	00008067          	ret
8000a048:	00008067          	ret

8000a04c <dhcp_network_changed>:
8000a04c:	02852783          	lw	a5,40(a0)
8000a050:	02078a63          	beqz	a5,8000a084 <dhcp_network_changed+0x38>
8000a054:	0057c703          	lbu	a4,5(a5)
8000a058:	00500693          	li	a3,5
8000a05c:	00e6ec63          	bltu	a3,a4,8000a074 <dhcp_network_changed+0x28>
8000a060:	00300693          	li	a3,3
8000a064:	00d77c63          	bgeu	a4,a3,8000a07c <dhcp_network_changed+0x30>
8000a068:	00070e63          	beqz	a4,8000a084 <dhcp_network_changed+0x38>
8000a06c:	00078323          	sb	zero,6(a5)
8000a070:	b7cff06f          	j	800093ec <dhcp_discover>
8000a074:	00a00693          	li	a3,10
8000a078:	fed71ae3          	bne	a4,a3,8000a06c <dhcp_network_changed+0x20>
8000a07c:	00078323          	sb	zero,6(a5)
8000a080:	ee1fe06f          	j	80008f60 <dhcp_reboot>
8000a084:	00008067          	ret

8000a088 <dhcp_arp_reply>:
8000a088:	12050a63          	beqz	a0,8000a1bc <dhcp_arp_reply+0x134>
8000a08c:	fd010113          	addi	sp,sp,-48
8000a090:	02112623          	sw	ra,44(sp)
8000a094:	02812423          	sw	s0,40(sp)
8000a098:	02912223          	sw	s1,36(sp)
8000a09c:	03212023          	sw	s2,32(sp)
8000a0a0:	01312e23          	sw	s3,28(sp)
8000a0a4:	01412c23          	sw	s4,24(sp)
8000a0a8:	02852403          	lw	s0,40(a0)
8000a0ac:	0e040863          	beqz	s0,8000a19c <dhcp_arp_reply+0x114>
8000a0b0:	00544703          	lbu	a4,5(s0)
8000a0b4:	00800793          	li	a5,8
8000a0b8:	0ef71263          	bne	a4,a5,8000a19c <dhcp_arp_reply+0x114>
8000a0bc:	0005a703          	lw	a4,0(a1)
8000a0c0:	01c42783          	lw	a5,28(s0)
8000a0c4:	0cf71c63          	bne	a4,a5,8000a19c <dhcp_arp_reply+0x114>
8000a0c8:	00050a13          	mv	s4,a0
8000a0cc:	00c00593          	li	a1,12
8000a0d0:	00040513          	mv	a0,s0
8000a0d4:	bf1fe0ef          	jal	ra,80008cc4 <dhcp_set_state>
8000a0d8:	00e10693          	addi	a3,sp,14
8000a0dc:	00400613          	li	a2,4
8000a0e0:	00040593          	mv	a1,s0
8000a0e4:	000a0513          	mv	a0,s4
8000a0e8:	c85fe0ef          	jal	ra,80008d6c <dhcp_create_msg>
8000a0ec:	00050913          	mv	s2,a0
8000a0f0:	08050863          	beqz	a0,8000a180 <dhcp_arp_reply+0xf8>
8000a0f4:	00452483          	lw	s1,4(a0)
8000a0f8:	00e15783          	lhu	a5,14(sp)
8000a0fc:	03200693          	li	a3,50
8000a100:	0f048493          	addi	s1,s1,240
8000a104:	00f48733          	add	a4,s1,a5
8000a108:	00278993          	addi	s3,a5,2
8000a10c:	00178793          	addi	a5,a5,1
8000a110:	01079793          	slli	a5,a5,0x10
8000a114:	0107d793          	srli	a5,a5,0x10
8000a118:	00d70023          	sb	a3,0(a4)
8000a11c:	00f487b3          	add	a5,s1,a5
8000a120:	00400713          	li	a4,4
8000a124:	00e78023          	sb	a4,0(a5)
8000a128:	01c42503          	lw	a0,28(s0)
8000a12c:	01099993          	slli	s3,s3,0x10
8000a130:	0109d993          	srli	s3,s3,0x10
8000a134:	01311723          	sh	s3,14(sp)
8000a138:	cf1fb0ef          	jal	ra,80005e28 <lwip_htonl>
8000a13c:	00050613          	mv	a2,a0
8000a140:	00048593          	mv	a1,s1
8000a144:	00098513          	mv	a0,s3
8000a148:	bc5fe0ef          	jal	ra,80008d0c <dhcp_option_long>
8000a14c:	00090613          	mv	a2,s2
8000a150:	00048593          	mv	a1,s1
8000a154:	00a11723          	sh	a0,14(sp)
8000a158:	db9fe0ef          	jal	ra,80008f10 <dhcp_option_trailer>
8000a15c:	8ec1a503          	lw	a0,-1812(gp) # 8000316c <dhcp_pcb>
8000a160:	84818793          	addi	a5,gp,-1976 # 800030c8 <ip_addr_any>
8000a164:	000a0713          	mv	a4,s4
8000a168:	04300693          	li	a3,67
8000a16c:	84418613          	addi	a2,gp,-1980 # 800030c4 <ip_addr_broadcast>
8000a170:	00090593          	mv	a1,s2
8000a174:	e6cfe0ef          	jal	ra,800087e0 <udp_sendto_if_src>
8000a178:	00090513          	mv	a0,s2
8000a17c:	eb9fc0ef          	jal	ra,80007034 <pbuf_free>
8000a180:	00644783          	lbu	a5,6(s0)
8000a184:	0ff00713          	li	a4,255
8000a188:	00e78663          	beq	a5,a4,8000a194 <dhcp_arp_reply+0x10c>
8000a18c:	00178793          	addi	a5,a5,1
8000a190:	00f40323          	sb	a5,6(s0)
8000a194:	01400793          	li	a5,20
8000a198:	00f41423          	sh	a5,8(s0)
8000a19c:	02c12083          	lw	ra,44(sp)
8000a1a0:	02812403          	lw	s0,40(sp)
8000a1a4:	02412483          	lw	s1,36(sp)
8000a1a8:	02012903          	lw	s2,32(sp)
8000a1ac:	01c12983          	lw	s3,28(sp)
8000a1b0:	01812a03          	lw	s4,24(sp)
8000a1b4:	03010113          	addi	sp,sp,48
8000a1b8:	00008067          	ret
8000a1bc:	00008067          	ret

8000a1c0 <dhcp_renew>:
8000a1c0:	fd010113          	addi	sp,sp,-48
8000a1c4:	02112623          	sw	ra,44(sp)
8000a1c8:	02812423          	sw	s0,40(sp)
8000a1cc:	01312e23          	sw	s3,28(sp)
8000a1d0:	02912223          	sw	s1,36(sp)
8000a1d4:	03212023          	sw	s2,32(sp)
8000a1d8:	02852483          	lw	s1,40(a0)
8000a1dc:	00050993          	mv	s3,a0
8000a1e0:	00500593          	li	a1,5
8000a1e4:	00048513          	mv	a0,s1
8000a1e8:	addfe0ef          	jal	ra,80008cc4 <dhcp_set_state>
8000a1ec:	00e10693          	addi	a3,sp,14
8000a1f0:	00300613          	li	a2,3
8000a1f4:	00048593          	mv	a1,s1
8000a1f8:	00098513          	mv	a0,s3
8000a1fc:	b71fe0ef          	jal	ra,80008d6c <dhcp_create_msg>
8000a200:	fff00413          	li	s0,-1
8000a204:	10050063          	beqz	a0,8000a304 <dhcp_renew+0x144>
8000a208:	00452403          	lw	s0,4(a0)
8000a20c:	00e15783          	lhu	a5,14(sp)
8000a210:	00050913          	mv	s2,a0
8000a214:	0f040413          	addi	s0,s0,240
8000a218:	00f40733          	add	a4,s0,a5
8000a21c:	00278513          	addi	a0,a5,2
8000a220:	00178793          	addi	a5,a5,1
8000a224:	01079793          	slli	a5,a5,0x10
8000a228:	03900693          	li	a3,57
8000a22c:	0107d793          	srli	a5,a5,0x10
8000a230:	00d70023          	sb	a3,0(a4)
8000a234:	00f407b3          	add	a5,s0,a5
8000a238:	00200713          	li	a4,2
8000a23c:	00e78023          	sb	a4,0(a5)
8000a240:	02c9d603          	lhu	a2,44(s3)
8000a244:	01051513          	slli	a0,a0,0x10
8000a248:	00040593          	mv	a1,s0
8000a24c:	01055513          	srli	a0,a0,0x10
8000a250:	00a11723          	sh	a0,14(sp)
8000a254:	a89fe0ef          	jal	ra,80008cdc <dhcp_option_short>
8000a258:	00a40733          	add	a4,s0,a0
8000a25c:	03700693          	li	a3,55
8000a260:	00d70023          	sb	a3,0(a4)
8000a264:	00150713          	addi	a4,a0,1
8000a268:	01071713          	slli	a4,a4,0x10
8000a26c:	01075713          	srli	a4,a4,0x10
8000a270:	00e40733          	add	a4,s0,a4
8000a274:	00300613          	li	a2,3
8000a278:	00c70023          	sb	a2,0(a4)
8000a27c:	00250713          	addi	a4,a0,2
8000a280:	01071713          	slli	a4,a4,0x10
8000a284:	01075713          	srli	a4,a4,0x10
8000a288:	00e40733          	add	a4,s0,a4
8000a28c:	00100693          	li	a3,1
8000a290:	00d70023          	sb	a3,0(a4)
8000a294:	00050793          	mv	a5,a0
8000a298:	00350693          	addi	a3,a0,3
8000a29c:	01069693          	slli	a3,a3,0x10
8000a2a0:	00478793          	addi	a5,a5,4
8000a2a4:	0106d693          	srli	a3,a3,0x10
8000a2a8:	01079793          	slli	a5,a5,0x10
8000a2ac:	00d406b3          	add	a3,s0,a3
8000a2b0:	00550513          	addi	a0,a0,5
8000a2b4:	0107d793          	srli	a5,a5,0x10
8000a2b8:	00c68023          	sb	a2,0(a3)
8000a2bc:	00f407b3          	add	a5,s0,a5
8000a2c0:	01c00713          	li	a4,28
8000a2c4:	01051513          	slli	a0,a0,0x10
8000a2c8:	00e78023          	sb	a4,0(a5)
8000a2cc:	01055513          	srli	a0,a0,0x10
8000a2d0:	00040593          	mv	a1,s0
8000a2d4:	00090613          	mv	a2,s2
8000a2d8:	00a11723          	sh	a0,14(sp)
8000a2dc:	c35fe0ef          	jal	ra,80008f10 <dhcp_option_trailer>
8000a2e0:	8ec1a503          	lw	a0,-1812(gp) # 8000316c <dhcp_pcb>
8000a2e4:	00098713          	mv	a4,s3
8000a2e8:	04300693          	li	a3,67
8000a2ec:	01848613          	addi	a2,s1,24
8000a2f0:	00090593          	mv	a1,s2
8000a2f4:	ee0fe0ef          	jal	ra,800089d4 <udp_sendto_if>
8000a2f8:	00050413          	mv	s0,a0
8000a2fc:	00090513          	mv	a0,s2
8000a300:	d35fc0ef          	jal	ra,80007034 <pbuf_free>
8000a304:	0064c783          	lbu	a5,6(s1)
8000a308:	0ff00713          	li	a4,255
8000a30c:	00e78663          	beq	a5,a4,8000a318 <dhcp_renew+0x158>
8000a310:	00178793          	addi	a5,a5,1
8000a314:	00f48323          	sb	a5,6(s1)
8000a318:	0064c503          	lbu	a0,6(s1)
8000a31c:	00900793          	li	a5,9
8000a320:	04a7e863          	bltu	a5,a0,8000a370 <dhcp_renew+0x1b0>
8000a324:	00551793          	slli	a5,a0,0x5
8000a328:	40a787b3          	sub	a5,a5,a0
8000a32c:	00279793          	slli	a5,a5,0x2
8000a330:	00f50533          	add	a0,a0,a5
8000a334:	00451513          	slli	a0,a0,0x4
8000a338:	01051513          	slli	a0,a0,0x10
8000a33c:	01055513          	srli	a0,a0,0x10
8000a340:	1f400593          	li	a1,500
8000a344:	1f350513          	addi	a0,a0,499
8000a348:	058030ef          	jal	ra,8000d3a0 <__divsi3>
8000a34c:	00a49423          	sh	a0,8(s1)
8000a350:	02c12083          	lw	ra,44(sp)
8000a354:	00040513          	mv	a0,s0
8000a358:	02812403          	lw	s0,40(sp)
8000a35c:	02412483          	lw	s1,36(sp)
8000a360:	02012903          	lw	s2,32(sp)
8000a364:	01c12983          	lw	s3,28(sp)
8000a368:	03010113          	addi	sp,sp,48
8000a36c:	00008067          	ret
8000a370:	00005537          	lui	a0,0x5
8000a374:	e2050513          	addi	a0,a0,-480 # 4e20 <_stack_size+0x4620>
8000a378:	fc9ff06f          	j	8000a340 <dhcp_renew+0x180>

8000a37c <dhcp_supplied_address>:
8000a37c:	02050863          	beqz	a0,8000a3ac <dhcp_supplied_address+0x30>
8000a380:	02852783          	lw	a5,40(a0)
8000a384:	00000513          	li	a0,0
8000a388:	02078463          	beqz	a5,8000a3b0 <dhcp_supplied_address+0x34>
8000a38c:	0057c783          	lbu	a5,5(a5)
8000a390:	00a00713          	li	a4,10
8000a394:	00100513          	li	a0,1
8000a398:	00e78663          	beq	a5,a4,8000a3a4 <dhcp_supplied_address+0x28>
8000a39c:	ffc78513          	addi	a0,a5,-4
8000a3a0:	00253513          	sltiu	a0,a0,2
8000a3a4:	0ff57513          	andi	a0,a0,255
8000a3a8:	00008067          	ret
8000a3ac:	00000513          	li	a0,0
8000a3b0:	00008067          	ret

8000a3b4 <dhcp_release_and_stop>:
8000a3b4:	fd010113          	addi	sp,sp,-48
8000a3b8:	02112623          	sw	ra,44(sp)
8000a3bc:	02812423          	sw	s0,40(sp)
8000a3c0:	02912223          	sw	s1,36(sp)
8000a3c4:	03212023          	sw	s2,32(sp)
8000a3c8:	01312e23          	sw	s3,28(sp)
8000a3cc:	01412c23          	sw	s4,24(sp)
8000a3d0:	02852403          	lw	s0,40(a0)
8000a3d4:	10040e63          	beqz	s0,8000a4f0 <dhcp_release_and_stop+0x13c>
8000a3d8:	00544783          	lbu	a5,5(s0)
8000a3dc:	10078a63          	beqz	a5,8000a4f0 <dhcp_release_and_stop+0x13c>
8000a3e0:	01842783          	lw	a5,24(s0)
8000a3e4:	00042e23          	sw	zero,28(s0)
8000a3e8:	00042c23          	sw	zero,24(s0)
8000a3ec:	02042023          	sw	zero,32(s0)
8000a3f0:	02042223          	sw	zero,36(s0)
8000a3f4:	02042823          	sw	zero,48(s0)
8000a3f8:	02042623          	sw	zero,44(s0)
8000a3fc:	02042423          	sw	zero,40(s0)
8000a400:	00041723          	sh	zero,14(s0)
8000a404:	00042823          	sw	zero,16(s0)
8000a408:	00041a23          	sh	zero,20(s0)
8000a40c:	00050493          	mv	s1,a0
8000a410:	00f12623          	sw	a5,12(sp)
8000a414:	f69ff0ef          	jal	ra,8000a37c <dhcp_supplied_address>
8000a418:	0a050463          	beqz	a0,8000a4c0 <dhcp_release_and_stop+0x10c>
8000a41c:	00a10693          	addi	a3,sp,10
8000a420:	00700613          	li	a2,7
8000a424:	00040593          	mv	a1,s0
8000a428:	00048513          	mv	a0,s1
8000a42c:	941fe0ef          	jal	ra,80008d6c <dhcp_create_msg>
8000a430:	00050993          	mv	s3,a0
8000a434:	08050663          	beqz	a0,8000a4c0 <dhcp_release_and_stop+0x10c>
8000a438:	00452903          	lw	s2,4(a0)
8000a43c:	00a15783          	lhu	a5,10(sp)
8000a440:	03600693          	li	a3,54
8000a444:	0f090913          	addi	s2,s2,240
8000a448:	00f90733          	add	a4,s2,a5
8000a44c:	00278a13          	addi	s4,a5,2
8000a450:	00178793          	addi	a5,a5,1
8000a454:	01079793          	slli	a5,a5,0x10
8000a458:	0107d793          	srli	a5,a5,0x10
8000a45c:	00d70023          	sb	a3,0(a4)
8000a460:	00f907b3          	add	a5,s2,a5
8000a464:	00400713          	li	a4,4
8000a468:	00e78023          	sb	a4,0(a5)
8000a46c:	00c12503          	lw	a0,12(sp)
8000a470:	010a1a13          	slli	s4,s4,0x10
8000a474:	010a5a13          	srli	s4,s4,0x10
8000a478:	01411523          	sh	s4,10(sp)
8000a47c:	9adfb0ef          	jal	ra,80005e28 <lwip_htonl>
8000a480:	00050613          	mv	a2,a0
8000a484:	00090593          	mv	a1,s2
8000a488:	000a0513          	mv	a0,s4
8000a48c:	881fe0ef          	jal	ra,80008d0c <dhcp_option_long>
8000a490:	00098613          	mv	a2,s3
8000a494:	00090593          	mv	a1,s2
8000a498:	00a11523          	sh	a0,10(sp)
8000a49c:	a75fe0ef          	jal	ra,80008f10 <dhcp_option_trailer>
8000a4a0:	8ec1a503          	lw	a0,-1812(gp) # 8000316c <dhcp_pcb>
8000a4a4:	00048713          	mv	a4,s1
8000a4a8:	04300693          	li	a3,67
8000a4ac:	00c10613          	addi	a2,sp,12
8000a4b0:	00098593          	mv	a1,s3
8000a4b4:	d20fe0ef          	jal	ra,800089d4 <udp_sendto_if>
8000a4b8:	00098513          	mv	a0,s3
8000a4bc:	b79fc0ef          	jal	ra,80007034 <pbuf_free>
8000a4c0:	84818693          	addi	a3,gp,-1976 # 800030c8 <ip_addr_any>
8000a4c4:	84818613          	addi	a2,gp,-1976 # 800030c8 <ip_addr_any>
8000a4c8:	00048513          	mv	a0,s1
8000a4cc:	84818593          	addi	a1,gp,-1976 # 800030c8 <ip_addr_any>
8000a4d0:	c2cfc0ef          	jal	ra,800068fc <netif_set_addr>
8000a4d4:	00000593          	li	a1,0
8000a4d8:	00040513          	mv	a0,s0
8000a4dc:	fe8fe0ef          	jal	ra,80008cc4 <dhcp_set_state>
8000a4e0:	00444783          	lbu	a5,4(s0)
8000a4e4:	00078663          	beqz	a5,8000a4f0 <dhcp_release_and_stop+0x13c>
8000a4e8:	c60ff0ef          	jal	ra,80009948 <dhcp_dec_pcb_refcount>
8000a4ec:	00040223          	sb	zero,4(s0)
8000a4f0:	02c12083          	lw	ra,44(sp)
8000a4f4:	02812403          	lw	s0,40(sp)
8000a4f8:	02412483          	lw	s1,36(sp)
8000a4fc:	02012903          	lw	s2,32(sp)
8000a500:	01c12983          	lw	s3,28(sp)
8000a504:	01812a03          	lw	s4,24(sp)
8000a508:	03010113          	addi	sp,sp,48
8000a50c:	00008067          	ret

8000a510 <dhcp_start>:
8000a510:	ff010113          	addi	sp,sp,-16
8000a514:	00912223          	sw	s1,4(sp)
8000a518:	00112623          	sw	ra,12(sp)
8000a51c:	00812423          	sw	s0,8(sp)
8000a520:	01212023          	sw	s2,0(sp)
8000a524:	ff000493          	li	s1,-16
8000a528:	08050263          	beqz	a0,8000a5ac <dhcp_start+0x9c>
8000a52c:	03554783          	lbu	a5,53(a0)
8000a530:	ff000493          	li	s1,-16
8000a534:	0017f793          	andi	a5,a5,1
8000a538:	06078a63          	beqz	a5,8000a5ac <dhcp_start+0x9c>
8000a53c:	02c55703          	lhu	a4,44(a0)
8000a540:	23f00793          	li	a5,575
8000a544:	02852903          	lw	s2,40(a0)
8000a548:	00e7e663          	bltu	a5,a4,8000a554 <dhcp_start+0x44>
8000a54c:	fff00493          	li	s1,-1
8000a550:	05c0006f          	j	8000a5ac <dhcp_start+0x9c>
8000a554:	00050413          	mv	s0,a0
8000a558:	06091863          	bnez	s2,8000a5c8 <dhcp_start+0xb8>
8000a55c:	03400513          	li	a0,52
8000a560:	8b0fc0ef          	jal	ra,80006610 <lwip_malloc>
8000a564:	00050913          	mv	s2,a0
8000a568:	fe0502e3          	beqz	a0,8000a54c <dhcp_start+0x3c>
8000a56c:	02a42423          	sw	a0,40(s0)
8000a570:	03400613          	li	a2,52
8000a574:	00000593          	li	a1,0
8000a578:	00090513          	mv	a0,s2
8000a57c:	71c020ef          	jal	ra,8000cc98 <memset>
8000a580:	a48ff0ef          	jal	ra,800097c8 <dhcp_inc_pcb_refcount>
8000a584:	00050493          	mv	s1,a0
8000a588:	fc0512e3          	bnez	a0,8000a54c <dhcp_start+0x3c>
8000a58c:	00100793          	li	a5,1
8000a590:	00f90223          	sb	a5,4(s2)
8000a594:	03544783          	lbu	a5,53(s0)
8000a598:	0047f793          	andi	a5,a5,4
8000a59c:	02079e63          	bnez	a5,8000a5d8 <dhcp_start+0xc8>
8000a5a0:	00200593          	li	a1,2
8000a5a4:	00090513          	mv	a0,s2
8000a5a8:	f1cfe0ef          	jal	ra,80008cc4 <dhcp_set_state>
8000a5ac:	00c12083          	lw	ra,12(sp)
8000a5b0:	00812403          	lw	s0,8(sp)
8000a5b4:	00048513          	mv	a0,s1
8000a5b8:	00012903          	lw	s2,0(sp)
8000a5bc:	00412483          	lw	s1,4(sp)
8000a5c0:	01010113          	addi	sp,sp,16
8000a5c4:	00008067          	ret
8000a5c8:	00494783          	lbu	a5,4(s2)
8000a5cc:	fa0782e3          	beqz	a5,8000a570 <dhcp_start+0x60>
8000a5d0:	b78ff0ef          	jal	ra,80009948 <dhcp_dec_pcb_refcount>
8000a5d4:	f9dff06f          	j	8000a570 <dhcp_start+0x60>
8000a5d8:	00040513          	mv	a0,s0
8000a5dc:	e11fe0ef          	jal	ra,800093ec <dhcp_discover>
8000a5e0:	00050493          	mv	s1,a0
8000a5e4:	fc0504e3          	beqz	a0,8000a5ac <dhcp_start+0x9c>
8000a5e8:	00040513          	mv	a0,s0
8000a5ec:	dc9ff0ef          	jal	ra,8000a3b4 <dhcp_release_and_stop>
8000a5f0:	f5dff06f          	j	8000a54c <dhcp_start+0x3c>

8000a5f4 <dhcp_coarse_tmr>:
8000a5f4:	fc010113          	addi	sp,sp,-64
8000a5f8:	02812c23          	sw	s0,56(sp)
8000a5fc:	8d41a403          	lw	s0,-1836(gp) # 80003154 <netif_list>
8000a600:	03312623          	sw	s3,44(sp)
8000a604:	000029b7          	lui	s3,0x2
8000a608:	03212823          	sw	s2,48(sp)
8000a60c:	03412423          	sw	s4,40(sp)
8000a610:	03512223          	sw	s5,36(sp)
8000a614:	03612023          	sw	s6,32(sp)
8000a618:	01712e23          	sw	s7,28(sp)
8000a61c:	02112e23          	sw	ra,60(sp)
8000a620:	02912a23          	sw	s1,52(sp)
8000a624:	01812c23          	sw	s8,24(sp)
8000a628:	01912a23          	sw	s9,20(sp)
8000a62c:	00100913          	li	s2,1
8000a630:	00a00a13          	li	s4,10
8000a634:	43200a93          	li	s5,1074
8000a638:	71098993          	addi	s3,s3,1808 # 2710 <_stack_size+0x1f10>
8000a63c:	02041c63          	bnez	s0,8000a674 <dhcp_coarse_tmr+0x80>
8000a640:	03c12083          	lw	ra,60(sp)
8000a644:	03812403          	lw	s0,56(sp)
8000a648:	03412483          	lw	s1,52(sp)
8000a64c:	03012903          	lw	s2,48(sp)
8000a650:	02c12983          	lw	s3,44(sp)
8000a654:	02812a03          	lw	s4,40(sp)
8000a658:	02412a83          	lw	s5,36(sp)
8000a65c:	02012b03          	lw	s6,32(sp)
8000a660:	01c12b83          	lw	s7,28(sp)
8000a664:	01812c03          	lw	s8,24(sp)
8000a668:	01412c83          	lw	s9,20(sp)
8000a66c:	04010113          	addi	sp,sp,64
8000a670:	00008067          	ret
8000a674:	02842783          	lw	a5,40(s0)
8000a678:	02078e63          	beqz	a5,8000a6b4 <dhcp_coarse_tmr+0xc0>
8000a67c:	0057c703          	lbu	a4,5(a5)
8000a680:	02070a63          	beqz	a4,8000a6b4 <dhcp_coarse_tmr+0xc0>
8000a684:	0147d683          	lhu	a3,20(a5)
8000a688:	02068a63          	beqz	a3,8000a6bc <dhcp_coarse_tmr+0xc8>
8000a68c:	0127d703          	lhu	a4,18(a5)
8000a690:	00170713          	addi	a4,a4,1
8000a694:	01071713          	slli	a4,a4,0x10
8000a698:	01075713          	srli	a4,a4,0x10
8000a69c:	00e79923          	sh	a4,18(a5)
8000a6a0:	00e69e63          	bne	a3,a4,8000a6bc <dhcp_coarse_tmr+0xc8>
8000a6a4:	00040513          	mv	a0,s0
8000a6a8:	d0dff0ef          	jal	ra,8000a3b4 <dhcp_release_and_stop>
8000a6ac:	00040513          	mv	a0,s0
8000a6b0:	e61ff0ef          	jal	ra,8000a510 <dhcp_start>
8000a6b4:	00042403          	lw	s0,0(s0)
8000a6b8:	f85ff06f          	j	8000a63c <dhcp_coarse_tmr+0x48>
8000a6bc:	0107d703          	lhu	a4,16(a5)
8000a6c0:	1a070663          	beqz	a4,8000a86c <dhcp_coarse_tmr+0x278>
8000a6c4:	fff70693          	addi	a3,a4,-1
8000a6c8:	00d79823          	sh	a3,16(a5)
8000a6cc:	1b271063          	bne	a4,s2,8000a86c <dhcp_coarse_tmr+0x278>
8000a6d0:	02842c03          	lw	s8,40(s0)
8000a6d4:	005c4783          	lbu	a5,5(s8)
8000a6d8:	fcfa6ee3          	bltu	s4,a5,8000a6b4 <dhcp_coarse_tmr+0xc0>
8000a6dc:	00fad7b3          	srl	a5,s5,a5
8000a6e0:	0017f793          	andi	a5,a5,1
8000a6e4:	fc0788e3          	beqz	a5,8000a6b4 <dhcp_coarse_tmr+0xc0>
8000a6e8:	00400593          	li	a1,4
8000a6ec:	000c0513          	mv	a0,s8
8000a6f0:	dd4fe0ef          	jal	ra,80008cc4 <dhcp_set_state>
8000a6f4:	00e10693          	addi	a3,sp,14
8000a6f8:	00300613          	li	a2,3
8000a6fc:	000c0593          	mv	a1,s8
8000a700:	00040513          	mv	a0,s0
8000a704:	e68fe0ef          	jal	ra,80008d6c <dhcp_create_msg>
8000a708:	00050c93          	mv	s9,a0
8000a70c:	0e050a63          	beqz	a0,8000a800 <dhcp_coarse_tmr+0x20c>
8000a710:	00452483          	lw	s1,4(a0)
8000a714:	00e15783          	lhu	a5,14(sp)
8000a718:	03900693          	li	a3,57
8000a71c:	0f048493          	addi	s1,s1,240
8000a720:	00f48733          	add	a4,s1,a5
8000a724:	00278513          	addi	a0,a5,2
8000a728:	00178793          	addi	a5,a5,1
8000a72c:	01079793          	slli	a5,a5,0x10
8000a730:	0107d793          	srli	a5,a5,0x10
8000a734:	00d70023          	sb	a3,0(a4)
8000a738:	00f487b3          	add	a5,s1,a5
8000a73c:	00200713          	li	a4,2
8000a740:	00e78023          	sb	a4,0(a5)
8000a744:	02c45603          	lhu	a2,44(s0)
8000a748:	01051513          	slli	a0,a0,0x10
8000a74c:	01055513          	srli	a0,a0,0x10
8000a750:	00048593          	mv	a1,s1
8000a754:	00a11723          	sh	a0,14(sp)
8000a758:	d84fe0ef          	jal	ra,80008cdc <dhcp_option_short>
8000a75c:	00a48733          	add	a4,s1,a0
8000a760:	03700693          	li	a3,55
8000a764:	00d70023          	sb	a3,0(a4)
8000a768:	00150713          	addi	a4,a0,1
8000a76c:	01071713          	slli	a4,a4,0x10
8000a770:	01075713          	srli	a4,a4,0x10
8000a774:	00300693          	li	a3,3
8000a778:	00e48733          	add	a4,s1,a4
8000a77c:	00d70023          	sb	a3,0(a4)
8000a780:	00250713          	addi	a4,a0,2
8000a784:	01071713          	slli	a4,a4,0x10
8000a788:	01075713          	srli	a4,a4,0x10
8000a78c:	00e48733          	add	a4,s1,a4
8000a790:	01270023          	sb	s2,0(a4)
8000a794:	00050793          	mv	a5,a0
8000a798:	00350713          	addi	a4,a0,3
8000a79c:	01071713          	slli	a4,a4,0x10
8000a7a0:	00478793          	addi	a5,a5,4
8000a7a4:	01075713          	srli	a4,a4,0x10
8000a7a8:	01079793          	slli	a5,a5,0x10
8000a7ac:	00e48733          	add	a4,s1,a4
8000a7b0:	00550513          	addi	a0,a0,5
8000a7b4:	0107d793          	srli	a5,a5,0x10
8000a7b8:	00d70023          	sb	a3,0(a4)
8000a7bc:	00f487b3          	add	a5,s1,a5
8000a7c0:	01c00713          	li	a4,28
8000a7c4:	01051513          	slli	a0,a0,0x10
8000a7c8:	00e78023          	sb	a4,0(a5)
8000a7cc:	01055513          	srli	a0,a0,0x10
8000a7d0:	000c8613          	mv	a2,s9
8000a7d4:	00048593          	mv	a1,s1
8000a7d8:	00a11723          	sh	a0,14(sp)
8000a7dc:	f34fe0ef          	jal	ra,80008f10 <dhcp_option_trailer>
8000a7e0:	8ec1a503          	lw	a0,-1812(gp) # 8000316c <dhcp_pcb>
8000a7e4:	00040713          	mv	a4,s0
8000a7e8:	04300693          	li	a3,67
8000a7ec:	84418613          	addi	a2,gp,-1980 # 800030c4 <ip_addr_broadcast>
8000a7f0:	000c8593          	mv	a1,s9
8000a7f4:	9e0fe0ef          	jal	ra,800089d4 <udp_sendto_if>
8000a7f8:	000c8513          	mv	a0,s9
8000a7fc:	839fc0ef          	jal	ra,80007034 <pbuf_free>
8000a800:	006c4783          	lbu	a5,6(s8)
8000a804:	0ff00713          	li	a4,255
8000a808:	00e78663          	beq	a5,a4,8000a814 <dhcp_coarse_tmr+0x220>
8000a80c:	00178793          	addi	a5,a5,1
8000a810:	00fc0323          	sb	a5,6(s8)
8000a814:	006c4783          	lbu	a5,6(s8)
8000a818:	00900713          	li	a4,9
8000a81c:	00098513          	mv	a0,s3
8000a820:	02f76063          	bltu	a4,a5,8000a840 <dhcp_coarse_tmr+0x24c>
8000a824:	00579513          	slli	a0,a5,0x5
8000a828:	40f50533          	sub	a0,a0,a5
8000a82c:	00251513          	slli	a0,a0,0x2
8000a830:	00a787b3          	add	a5,a5,a0
8000a834:	00379793          	slli	a5,a5,0x3
8000a838:	01079513          	slli	a0,a5,0x10
8000a83c:	01055513          	srli	a0,a0,0x10
8000a840:	1f400593          	li	a1,500
8000a844:	1f350513          	addi	a0,a0,499
8000a848:	359020ef          	jal	ra,8000d3a0 <__divsi3>
8000a84c:	014c5783          	lhu	a5,20(s8)
8000a850:	012c5703          	lhu	a4,18(s8)
8000a854:	00ac1423          	sh	a0,8(s8)
8000a858:	40e787b3          	sub	a5,a5,a4
8000a85c:	e4f95ce3          	bge	s2,a5,8000a6b4 <dhcp_coarse_tmr+0xc0>
8000a860:	4017d793          	srai	a5,a5,0x1
8000a864:	00fc1823          	sh	a5,16(s8)
8000a868:	e4dff06f          	j	8000a6b4 <dhcp_coarse_tmr+0xc0>
8000a86c:	00e7d703          	lhu	a4,14(a5)
8000a870:	e40702e3          	beqz	a4,8000a6b4 <dhcp_coarse_tmr+0xc0>
8000a874:	fff70693          	addi	a3,a4,-1
8000a878:	00d79723          	sh	a3,14(a5)
8000a87c:	e3271ce3          	bne	a4,s2,8000a6b4 <dhcp_coarse_tmr+0xc0>
8000a880:	02842483          	lw	s1,40(s0)
8000a884:	0054c783          	lbu	a5,5(s1)
8000a888:	0fb7f713          	andi	a4,a5,251
8000a88c:	01270463          	beq	a4,s2,8000a894 <dhcp_coarse_tmr+0x2a0>
8000a890:	e34792e3          	bne	a5,s4,8000a6b4 <dhcp_coarse_tmr+0xc0>
8000a894:	00040513          	mv	a0,s0
8000a898:	929ff0ef          	jal	ra,8000a1c0 <dhcp_renew>
8000a89c:	00c4d783          	lhu	a5,12(s1)
8000a8a0:	0124d703          	lhu	a4,18(s1)
8000a8a4:	40e787b3          	sub	a5,a5,a4
8000a8a8:	e0f956e3          	bge	s2,a5,8000a6b4 <dhcp_coarse_tmr+0xc0>
8000a8ac:	4017d793          	srai	a5,a5,0x1
8000a8b0:	00f49723          	sh	a5,14(s1)
8000a8b4:	e01ff06f          	j	8000a6b4 <dhcp_coarse_tmr+0xc0>

8000a8b8 <dhcp_fine_tmr>:
8000a8b8:	fe010113          	addi	sp,sp,-32
8000a8bc:	00812c23          	sw	s0,24(sp)
8000a8c0:	8d41a403          	lw	s0,-1836(gp) # 80003154 <netif_list>
8000a8c4:	00912a23          	sw	s1,20(sp)
8000a8c8:	01212823          	sw	s2,16(sp)
8000a8cc:	01312623          	sw	s3,12(sp)
8000a8d0:	01412423          	sw	s4,8(sp)
8000a8d4:	01512223          	sw	s5,4(sp)
8000a8d8:	01612023          	sw	s6,0(sp)
8000a8dc:	00112e23          	sw	ra,28(sp)
8000a8e0:	00100493          	li	s1,1
8000a8e4:	00c00913          	li	s2,12
8000a8e8:	00600993          	li	s3,6
8000a8ec:	00800a13          	li	s4,8
8000a8f0:	00300a93          	li	s5,3
8000a8f4:	00500b13          	li	s6,5
8000a8f8:	02041663          	bnez	s0,8000a924 <dhcp_fine_tmr+0x6c>
8000a8fc:	01c12083          	lw	ra,28(sp)
8000a900:	01812403          	lw	s0,24(sp)
8000a904:	01412483          	lw	s1,20(sp)
8000a908:	01012903          	lw	s2,16(sp)
8000a90c:	00c12983          	lw	s3,12(sp)
8000a910:	00812a03          	lw	s4,8(sp)
8000a914:	00412a83          	lw	s5,4(sp)
8000a918:	00012b03          	lw	s6,0(sp)
8000a91c:	02010113          	addi	sp,sp,32
8000a920:	00008067          	ret
8000a924:	02842703          	lw	a4,40(s0)
8000a928:	00070a63          	beqz	a4,8000a93c <dhcp_fine_tmr+0x84>
8000a92c:	00875783          	lhu	a5,8(a4)
8000a930:	00f4fa63          	bgeu	s1,a5,8000a944 <dhcp_fine_tmr+0x8c>
8000a934:	fff78793          	addi	a5,a5,-1
8000a938:	00f71423          	sh	a5,8(a4)
8000a93c:	00042403          	lw	s0,0(s0)
8000a940:	fb9ff06f          	j	8000a8f8 <dhcp_fine_tmr+0x40>
8000a944:	fe979ce3          	bne	a5,s1,8000a93c <dhcp_fine_tmr+0x84>
8000a948:	00071423          	sh	zero,8(a4)
8000a94c:	02842703          	lw	a4,40(s0)
8000a950:	00574783          	lbu	a5,5(a4)
8000a954:	01278463          	beq	a5,s2,8000a95c <dhcp_fine_tmr+0xa4>
8000a958:	01379863          	bne	a5,s3,8000a968 <dhcp_fine_tmr+0xb0>
8000a95c:	00040513          	mv	a0,s0
8000a960:	a8dfe0ef          	jal	ra,800093ec <dhcp_discover>
8000a964:	fd9ff06f          	j	8000a93c <dhcp_fine_tmr+0x84>
8000a968:	02979463          	bne	a5,s1,8000a990 <dhcp_fine_tmr+0xd8>
8000a96c:	00674783          	lbu	a5,6(a4)
8000a970:	00040513          	mv	a0,s0
8000a974:	00fb6663          	bltu	s6,a5,8000a980 <dhcp_fine_tmr+0xc8>
8000a978:	ff8fe0ef          	jal	ra,80009170 <dhcp_select>
8000a97c:	fc1ff06f          	j	8000a93c <dhcp_fine_tmr+0x84>
8000a980:	a35ff0ef          	jal	ra,8000a3b4 <dhcp_release_and_stop>
8000a984:	00040513          	mv	a0,s0
8000a988:	b89ff0ef          	jal	ra,8000a510 <dhcp_start>
8000a98c:	fb1ff06f          	j	8000a93c <dhcp_fine_tmr+0x84>
8000a990:	03479063          	bne	a5,s4,8000a9b0 <dhcp_fine_tmr+0xf8>
8000a994:	00674783          	lbu	a5,6(a4)
8000a998:	00040513          	mv	a0,s0
8000a99c:	00f4e663          	bltu	s1,a5,8000a9a8 <dhcp_fine_tmr+0xf0>
8000a9a0:	c11fe0ef          	jal	ra,800095b0 <dhcp_check>
8000a9a4:	f99ff06f          	j	8000a93c <dhcp_fine_tmr+0x84>
8000a9a8:	c6dfe0ef          	jal	ra,80009614 <dhcp_bind>
8000a9ac:	f91ff06f          	j	8000a93c <dhcp_fine_tmr+0x84>
8000a9b0:	f95796e3          	bne	a5,s5,8000a93c <dhcp_fine_tmr+0x84>
8000a9b4:	00674783          	lbu	a5,6(a4)
8000a9b8:	00040513          	mv	a0,s0
8000a9bc:	faf4e2e3          	bltu	s1,a5,8000a960 <dhcp_fine_tmr+0xa8>
8000a9c0:	da0fe0ef          	jal	ra,80008f60 <dhcp_reboot>
8000a9c4:	f79ff06f          	j	8000a93c <dhcp_fine_tmr+0x84>

8000a9c8 <dhcp_release>:
8000a9c8:	ff010113          	addi	sp,sp,-16
8000a9cc:	00112623          	sw	ra,12(sp)
8000a9d0:	9e5ff0ef          	jal	ra,8000a3b4 <dhcp_release_and_stop>
8000a9d4:	00c12083          	lw	ra,12(sp)
8000a9d8:	00000513          	li	a0,0
8000a9dc:	01010113          	addi	sp,sp,16
8000a9e0:	00008067          	ret

8000a9e4 <dhcp_stop>:
8000a9e4:	9d1ff06f          	j	8000a3b4 <dhcp_release_and_stop>

8000a9e8 <etharp_free_entry>:
8000a9e8:	fe010113          	addi	sp,sp,-32
8000a9ec:	00912a23          	sw	s1,20(sp)
8000a9f0:	00151493          	slli	s1,a0,0x1
8000a9f4:	00a48733          	add	a4,s1,a0
8000a9f8:	01212823          	sw	s2,16(sp)
8000a9fc:	00371713          	slli	a4,a4,0x3
8000aa00:	b4c18913          	addi	s2,gp,-1204 # 800033cc <arp_table>
8000aa04:	00812c23          	sw	s0,24(sp)
8000aa08:	01312623          	sw	s3,12(sp)
8000aa0c:	00112e23          	sw	ra,28(sp)
8000aa10:	00e90933          	add	s2,s2,a4
8000aa14:	00050993          	mv	s3,a0
8000aa18:	00092503          	lw	a0,0(s2)
8000aa1c:	b4c18413          	addi	s0,gp,-1204 # 800033cc <arp_table>
8000aa20:	00050663          	beqz	a0,8000aa2c <etharp_free_entry+0x44>
8000aa24:	e10fc0ef          	jal	ra,80007034 <pbuf_free>
8000aa28:	00092023          	sw	zero,0(s2)
8000aa2c:	01348533          	add	a0,s1,s3
8000aa30:	00351513          	slli	a0,a0,0x3
8000aa34:	00a40533          	add	a0,s0,a0
8000aa38:	00050a23          	sb	zero,20(a0)
8000aa3c:	00051923          	sh	zero,18(a0)
8000aa40:	00052423          	sw	zero,8(a0)
8000aa44:	00052223          	sw	zero,4(a0)
8000aa48:	00600613          	li	a2,6
8000aa4c:	84c18593          	addi	a1,gp,-1972 # 800030cc <ethzero>
8000aa50:	00c50513          	addi	a0,a0,12
8000aa54:	7d0030ef          	jal	ra,8000e224 <memcpy>
8000aa58:	01c12083          	lw	ra,28(sp)
8000aa5c:	01812403          	lw	s0,24(sp)
8000aa60:	01412483          	lw	s1,20(sp)
8000aa64:	01012903          	lw	s2,16(sp)
8000aa68:	00c12983          	lw	s3,12(sp)
8000aa6c:	02010113          	addi	sp,sp,32
8000aa70:	00008067          	ret

8000aa74 <etharp_find_entry>:
8000aa74:	fe010113          	addi	sp,sp,-32
8000aa78:	00812c23          	sw	s0,24(sp)
8000aa7c:	00912a23          	sw	s1,20(sp)
8000aa80:	b4c18693          	addi	a3,gp,-1204 # 800033cc <arp_table>
8000aa84:	00112e23          	sw	ra,28(sp)
8000aa88:	01212823          	sw	s2,16(sp)
8000aa8c:	01312623          	sw	s3,12(sp)
8000aa90:	00000293          	li	t0,0
8000aa94:	00000f93          	li	t6,0
8000aa98:	00000f13          	li	t5,0
8000aa9c:	00a00313          	li	t1,10
8000aaa0:	00000793          	li	a5,0
8000aaa4:	00a00713          	li	a4,10
8000aaa8:	00a00893          	li	a7,10
8000aaac:	00a00493          	li	s1,10
8000aab0:	b4c18413          	addi	s0,gp,-1204 # 800033cc <arp_table>
8000aab4:	00a00e13          	li	t3,10
8000aab8:	00100393          	li	t2,1
8000aabc:	0146ce83          	lbu	t4,20(a3)
8000aac0:	05c71263          	bne	a4,t3,8000ab04 <etharp_find_entry+0x90>
8000aac4:	100e8463          	beqz	t4,8000abcc <etharp_find_entry+0x158>
8000aac8:	00050e63          	beqz	a0,8000aae4 <etharp_find_entry+0x70>
8000aacc:	00052903          	lw	s2,0(a0)
8000aad0:	0046a803          	lw	a6,4(a3)
8000aad4:	01091863          	bne	s2,a6,8000aae4 <etharp_find_entry+0x70>
8000aad8:	0a060a63          	beqz	a2,8000ab8c <etharp_find_entry+0x118>
8000aadc:	0086a803          	lw	a6,8(a3)
8000aae0:	0ac80663          	beq	a6,a2,8000ab8c <etharp_find_entry+0x118>
8000aae4:	0126d803          	lhu	a6,18(a3)
8000aae8:	0c7e9a63          	bne	t4,t2,8000abbc <etharp_find_entry+0x148>
8000aaec:	0006ae83          	lw	t4,0(a3)
8000aaf0:	0a0e8e63          	beqz	t4,8000abac <etharp_find_entry+0x138>
8000aaf4:	01e86a63          	bltu	a6,t5,8000ab08 <etharp_find_entry+0x94>
8000aaf8:	00080f13          	mv	t5,a6
8000aafc:	00078313          	mv	t1,a5
8000ab00:	0080006f          	j	8000ab08 <etharp_find_entry+0x94>
8000ab04:	fc0e92e3          	bnez	t4,8000aac8 <etharp_find_entry+0x54>
8000ab08:	00178793          	addi	a5,a5,1
8000ab0c:	01079813          	slli	a6,a5,0x10
8000ab10:	01085813          	srli	a6,a6,0x10
8000ab14:	01081793          	slli	a5,a6,0x10
8000ab18:	01868693          	addi	a3,a3,24
8000ab1c:	4107d793          	srai	a5,a5,0x10
8000ab20:	f9c81ee3          	bne	a6,t3,8000aabc <etharp_find_entry+0x48>
8000ab24:	00100693          	li	a3,1
8000ab28:	fff00793          	li	a5,-1
8000ab2c:	06d59063          	bne	a1,a3,8000ab8c <etharp_find_entry+0x118>
8000ab30:	00060993          	mv	s3,a2
8000ab34:	00050913          	mv	s2,a0
8000ab38:	03c71063          	bne	a4,t3,8000ab58 <etharp_find_entry+0xe4>
8000ab3c:	08e89c63          	bne	a7,a4,8000abd4 <etharp_find_entry+0x160>
8000ab40:	01149663          	bne	s1,a7,8000ab4c <etharp_find_entry+0xd8>
8000ab44:	04930463          	beq	t1,s1,8000ab8c <etharp_find_entry+0x118>
8000ab48:	00030493          	mv	s1,t1
8000ab4c:	00048513          	mv	a0,s1
8000ab50:	e99ff0ef          	jal	ra,8000a9e8 <etharp_free_entry>
8000ab54:	00048713          	mv	a4,s1
8000ab58:	00171793          	slli	a5,a4,0x1
8000ab5c:	00090c63          	beqz	s2,8000ab74 <etharp_find_entry+0x100>
8000ab60:	00092603          	lw	a2,0(s2)
8000ab64:	00e786b3          	add	a3,a5,a4
8000ab68:	00369693          	slli	a3,a3,0x3
8000ab6c:	00d406b3          	add	a3,s0,a3
8000ab70:	00c6a223          	sw	a2,4(a3)
8000ab74:	00e787b3          	add	a5,a5,a4
8000ab78:	00379793          	slli	a5,a5,0x3
8000ab7c:	00f407b3          	add	a5,s0,a5
8000ab80:	00079923          	sh	zero,18(a5)
8000ab84:	0137a423          	sw	s3,8(a5)
8000ab88:	00070793          	mv	a5,a4
8000ab8c:	01c12083          	lw	ra,28(sp)
8000ab90:	01812403          	lw	s0,24(sp)
8000ab94:	01412483          	lw	s1,20(sp)
8000ab98:	01012903          	lw	s2,16(sp)
8000ab9c:	00c12983          	lw	s3,12(sp)
8000aba0:	00078513          	mv	a0,a5
8000aba4:	02010113          	addi	sp,sp,32
8000aba8:	00008067          	ret
8000abac:	f5f86ee3          	bltu	a6,t6,8000ab08 <etharp_find_entry+0x94>
8000abb0:	00080f93          	mv	t6,a6
8000abb4:	00078493          	mv	s1,a5
8000abb8:	f51ff06f          	j	8000ab08 <etharp_find_entry+0x94>
8000abbc:	f45866e3          	bltu	a6,t0,8000ab08 <etharp_find_entry+0x94>
8000abc0:	00080293          	mv	t0,a6
8000abc4:	00078893          	mv	a7,a5
8000abc8:	f41ff06f          	j	8000ab08 <etharp_find_entry+0x94>
8000abcc:	00078713          	mv	a4,a5
8000abd0:	f39ff06f          	j	8000ab08 <etharp_find_entry+0x94>
8000abd4:	00088493          	mv	s1,a7
8000abd8:	f75ff06f          	j	8000ab4c <etharp_find_entry+0xd8>

8000abdc <etharp_raw>:
8000abdc:	fc010113          	addi	sp,sp,-64
8000abe0:	03312623          	sw	s3,44(sp)
8000abe4:	03412423          	sw	s4,40(sp)
8000abe8:	03512223          	sw	s5,36(sp)
8000abec:	00050993          	mv	s3,a0
8000abf0:	00058a13          	mv	s4,a1
8000abf4:	00060a93          	mv	s5,a2
8000abf8:	01c00593          	li	a1,28
8000abfc:	28000613          	li	a2,640
8000ac00:	01000513          	li	a0,16
8000ac04:	02912a23          	sw	s1,52(sp)
8000ac08:	03612023          	sw	s6,32(sp)
8000ac0c:	01712e23          	sw	s7,28(sp)
8000ac10:	01812c23          	sw	s8,24(sp)
8000ac14:	01912a23          	sw	s9,20(sp)
8000ac18:	01112623          	sw	a7,12(sp)
8000ac1c:	02112e23          	sw	ra,60(sp)
8000ac20:	02812c23          	sw	s0,56(sp)
8000ac24:	03212823          	sw	s2,48(sp)
8000ac28:	00068c93          	mv	s9,a3
8000ac2c:	00070b93          	mv	s7,a4
8000ac30:	00078c13          	mv	s8,a5
8000ac34:	00080b13          	mv	s6,a6
8000ac38:	cd0fc0ef          	jal	ra,80007108 <pbuf_alloc>
8000ac3c:	a0c18493          	addi	s1,gp,-1524 # 8000328c <lwip_stats>
8000ac40:	00c12883          	lw	a7,12(sp)
8000ac44:	04051463          	bnez	a0,8000ac8c <etharp_raw+0xb0>
8000ac48:	0484a783          	lw	a5,72(s1)
8000ac4c:	fff00513          	li	a0,-1
8000ac50:	00178793          	addi	a5,a5,1
8000ac54:	04f4a423          	sw	a5,72(s1)
8000ac58:	03c12083          	lw	ra,60(sp)
8000ac5c:	03812403          	lw	s0,56(sp)
8000ac60:	03412483          	lw	s1,52(sp)
8000ac64:	03012903          	lw	s2,48(sp)
8000ac68:	02c12983          	lw	s3,44(sp)
8000ac6c:	02812a03          	lw	s4,40(sp)
8000ac70:	02412a83          	lw	s5,36(sp)
8000ac74:	02012b03          	lw	s6,32(sp)
8000ac78:	01c12b83          	lw	s7,28(sp)
8000ac7c:	01812c03          	lw	s8,24(sp)
8000ac80:	01412c83          	lw	s9,20(sp)
8000ac84:	04010113          	addi	sp,sp,64
8000ac88:	00008067          	ret
8000ac8c:	00452403          	lw	s0,4(a0)
8000ac90:	00050913          	mv	s2,a0
8000ac94:	00088513          	mv	a0,a7
8000ac98:	978fb0ef          	jal	ra,80005e10 <lwip_htons>
8000ac9c:	00a40323          	sb	a0,6(s0)
8000aca0:	00855513          	srli	a0,a0,0x8
8000aca4:	00a403a3          	sb	a0,7(s0)
8000aca8:	00600613          	li	a2,6
8000acac:	000c8593          	mv	a1,s9
8000acb0:	00840513          	addi	a0,s0,8
8000acb4:	570030ef          	jal	ra,8000e224 <memcpy>
8000acb8:	00600613          	li	a2,6
8000acbc:	000c0593          	mv	a1,s8
8000acc0:	01240513          	addi	a0,s0,18
8000acc4:	560030ef          	jal	ra,8000e224 <memcpy>
8000acc8:	00400613          	li	a2,4
8000accc:	000b8593          	mv	a1,s7
8000acd0:	00e40513          	addi	a0,s0,14
8000acd4:	550030ef          	jal	ra,8000e224 <memcpy>
8000acd8:	00400613          	li	a2,4
8000acdc:	000b0593          	mv	a1,s6
8000ace0:	01840513          	addi	a0,s0,24
8000ace4:	540030ef          	jal	ra,8000e224 <memcpy>
8000ace8:	00100793          	li	a5,1
8000acec:	00f400a3          	sb	a5,1(s0)
8000acf0:	00800793          	li	a5,8
8000acf4:	00f40123          	sb	a5,2(s0)
8000acf8:	00600793          	li	a5,6
8000acfc:	00f40223          	sb	a5,4(s0)
8000ad00:	00001737          	lui	a4,0x1
8000ad04:	00400793          	li	a5,4
8000ad08:	00f402a3          	sb	a5,5(s0)
8000ad0c:	80670713          	addi	a4,a4,-2042 # 806 <_stack_size+0x6>
8000ad10:	000a8693          	mv	a3,s5
8000ad14:	000a0613          	mv	a2,s4
8000ad18:	00090593          	mv	a1,s2
8000ad1c:	00040023          	sb	zero,0(s0)
8000ad20:	000401a3          	sb	zero,3(s0)
8000ad24:	00098513          	mv	a0,s3
8000ad28:	695010ef          	jal	ra,8000cbbc <ethernet_output>
8000ad2c:	0304a783          	lw	a5,48(s1)
8000ad30:	00090513          	mv	a0,s2
8000ad34:	00178793          	addi	a5,a5,1
8000ad38:	02f4a823          	sw	a5,48(s1)
8000ad3c:	af8fc0ef          	jal	ra,80007034 <pbuf_free>
8000ad40:	00000513          	li	a0,0
8000ad44:	f15ff06f          	j	8000ac58 <etharp_raw+0x7c>

8000ad48 <etharp_cleanup_netif>:
8000ad48:	fe010113          	addi	sp,sp,-32
8000ad4c:	00812c23          	sw	s0,24(sp)
8000ad50:	00912a23          	sw	s1,20(sp)
8000ad54:	01212823          	sw	s2,16(sp)
8000ad58:	01312623          	sw	s3,12(sp)
8000ad5c:	00112e23          	sw	ra,28(sp)
8000ad60:	00050993          	mv	s3,a0
8000ad64:	b4c18413          	addi	s0,gp,-1204 # 800033cc <arp_table>
8000ad68:	00000493          	li	s1,0
8000ad6c:	00a00913          	li	s2,10
8000ad70:	01444783          	lbu	a5,20(s0)
8000ad74:	00078a63          	beqz	a5,8000ad88 <etharp_cleanup_netif+0x40>
8000ad78:	00842783          	lw	a5,8(s0)
8000ad7c:	01379663          	bne	a5,s3,8000ad88 <etharp_cleanup_netif+0x40>
8000ad80:	00048513          	mv	a0,s1
8000ad84:	c65ff0ef          	jal	ra,8000a9e8 <etharp_free_entry>
8000ad88:	00148493          	addi	s1,s1,1
8000ad8c:	01840413          	addi	s0,s0,24
8000ad90:	ff2490e3          	bne	s1,s2,8000ad70 <etharp_cleanup_netif+0x28>
8000ad94:	01c12083          	lw	ra,28(sp)
8000ad98:	01812403          	lw	s0,24(sp)
8000ad9c:	01412483          	lw	s1,20(sp)
8000ada0:	01012903          	lw	s2,16(sp)
8000ada4:	00c12983          	lw	s3,12(sp)
8000ada8:	02010113          	addi	sp,sp,32
8000adac:	00008067          	ret

8000adb0 <etharp_find_addr>:
8000adb0:	fe010113          	addi	sp,sp,-32
8000adb4:	00058793          	mv	a5,a1
8000adb8:	00812c23          	sw	s0,24(sp)
8000adbc:	00200593          	li	a1,2
8000adc0:	00060413          	mv	s0,a2
8000adc4:	00050613          	mv	a2,a0
8000adc8:	00078513          	mv	a0,a5
8000adcc:	00112e23          	sw	ra,28(sp)
8000add0:	00d12623          	sw	a3,12(sp)
8000add4:	ca1ff0ef          	jal	ra,8000aa74 <etharp_find_entry>
8000add8:	04054863          	bltz	a0,8000ae28 <etharp_find_addr+0x78>
8000addc:	00151793          	slli	a5,a0,0x1
8000ade0:	00a787b3          	add	a5,a5,a0
8000ade4:	b4c18713          	addi	a4,gp,-1204 # 800033cc <arp_table>
8000ade8:	00379793          	slli	a5,a5,0x3
8000adec:	00f70633          	add	a2,a4,a5
8000adf0:	01464583          	lbu	a1,20(a2)
8000adf4:	00100613          	li	a2,1
8000adf8:	02b67863          	bgeu	a2,a1,8000ae28 <etharp_find_addr+0x78>
8000adfc:	00c78613          	addi	a2,a5,12
8000ae00:	00c12683          	lw	a3,12(sp)
8000ae04:	00c70633          	add	a2,a4,a2
8000ae08:	00478793          	addi	a5,a5,4
8000ae0c:	00c42023          	sw	a2,0(s0)
8000ae10:	00f707b3          	add	a5,a4,a5
8000ae14:	00f6a023          	sw	a5,0(a3)
8000ae18:	01c12083          	lw	ra,28(sp)
8000ae1c:	01812403          	lw	s0,24(sp)
8000ae20:	02010113          	addi	sp,sp,32
8000ae24:	00008067          	ret
8000ae28:	fff00513          	li	a0,-1
8000ae2c:	fedff06f          	j	8000ae18 <etharp_find_addr+0x68>

8000ae30 <etharp_get_entry>:
8000ae30:	00900793          	li	a5,9
8000ae34:	04a7e863          	bltu	a5,a0,8000ae84 <etharp_get_entry+0x54>
8000ae38:	00151793          	slli	a5,a0,0x1
8000ae3c:	00a787b3          	add	a5,a5,a0
8000ae40:	b4c18713          	addi	a4,gp,-1204 # 800033cc <arp_table>
8000ae44:	00379793          	slli	a5,a5,0x3
8000ae48:	00f70833          	add	a6,a4,a5
8000ae4c:	01484303          	lbu	t1,20(a6)
8000ae50:	00100893          	li	a7,1
8000ae54:	00000513          	li	a0,0
8000ae58:	0268f863          	bgeu	a7,t1,8000ae88 <etharp_get_entry+0x58>
8000ae5c:	00478513          	addi	a0,a5,4
8000ae60:	00a70533          	add	a0,a4,a0
8000ae64:	00a5a023          	sw	a0,0(a1)
8000ae68:	00882583          	lw	a1,8(a6)
8000ae6c:	00c78793          	addi	a5,a5,12
8000ae70:	00f707b3          	add	a5,a4,a5
8000ae74:	00b62023          	sw	a1,0(a2)
8000ae78:	00f6a023          	sw	a5,0(a3)
8000ae7c:	00100513          	li	a0,1
8000ae80:	00008067          	ret
8000ae84:	00000513          	li	a0,0
8000ae88:	00008067          	ret

8000ae8c <etharp_input>:
8000ae8c:	22058863          	beqz	a1,8000b0bc <etharp_input+0x230>
8000ae90:	fc010113          	addi	sp,sp,-64
8000ae94:	02812c23          	sw	s0,56(sp)
8000ae98:	03212823          	sw	s2,48(sp)
8000ae9c:	03312623          	sw	s3,44(sp)
8000aea0:	02112e23          	sw	ra,60(sp)
8000aea4:	02912a23          	sw	s1,52(sp)
8000aea8:	03412423          	sw	s4,40(sp)
8000aeac:	03512223          	sw	s5,36(sp)
8000aeb0:	03612023          	sw	s6,32(sp)
8000aeb4:	01712e23          	sw	s7,28(sp)
8000aeb8:	00452483          	lw	s1,4(a0)
8000aebc:	00058413          	mv	s0,a1
8000aec0:	0014c783          	lbu	a5,1(s1)
8000aec4:	0004c703          	lbu	a4,0(s1)
8000aec8:	00050993          	mv	s3,a0
8000aecc:	00879793          	slli	a5,a5,0x8
8000aed0:	00e7e7b3          	or	a5,a5,a4
8000aed4:	10000713          	li	a4,256
8000aed8:	a0c18913          	addi	s2,gp,-1524 # 8000328c <lwip_stats>
8000aedc:	02e79a63          	bne	a5,a4,8000af10 <etharp_input+0x84>
8000aee0:	0044c703          	lbu	a4,4(s1)
8000aee4:	00600793          	li	a5,6
8000aee8:	02f71463          	bne	a4,a5,8000af10 <etharp_input+0x84>
8000aeec:	0054c703          	lbu	a4,5(s1)
8000aef0:	00400793          	li	a5,4
8000aef4:	00f71e63          	bne	a4,a5,8000af10 <etharp_input+0x84>
8000aef8:	0034c783          	lbu	a5,3(s1)
8000aefc:	0024c703          	lbu	a4,2(s1)
8000af00:	00879793          	slli	a5,a5,0x8
8000af04:	00e7e7b3          	or	a5,a5,a4
8000af08:	00800713          	li	a4,8
8000af0c:	04e78863          	beq	a5,a4,8000af5c <etharp_input+0xd0>
8000af10:	05092783          	lw	a5,80(s2)
8000af14:	00178793          	addi	a5,a5,1
8000af18:	04f92823          	sw	a5,80(s2)
8000af1c:	03c92783          	lw	a5,60(s2)
8000af20:	00178793          	addi	a5,a5,1
8000af24:	02f92e23          	sw	a5,60(s2)
8000af28:	00098513          	mv	a0,s3
8000af2c:	908fc0ef          	jal	ra,80007034 <pbuf_free>
8000af30:	03c12083          	lw	ra,60(sp)
8000af34:	03812403          	lw	s0,56(sp)
8000af38:	03412483          	lw	s1,52(sp)
8000af3c:	03012903          	lw	s2,48(sp)
8000af40:	02c12983          	lw	s3,44(sp)
8000af44:	02812a03          	lw	s4,40(sp)
8000af48:	02412a83          	lw	s5,36(sp)
8000af4c:	02012b03          	lw	s6,32(sp)
8000af50:	01c12b83          	lw	s7,28(sp)
8000af54:	04010113          	addi	sp,sp,64
8000af58:	00008067          	ret
8000af5c:	03492783          	lw	a5,52(s2)
8000af60:	00400613          	li	a2,4
8000af64:	00e48593          	addi	a1,s1,14
8000af68:	00178793          	addi	a5,a5,1
8000af6c:	00810513          	addi	a0,sp,8
8000af70:	02f92a23          	sw	a5,52(s2)
8000af74:	2b0030ef          	jal	ra,8000e224 <memcpy>
8000af78:	00400613          	li	a2,4
8000af7c:	01848593          	addi	a1,s1,24
8000af80:	00c10513          	addi	a0,sp,12
8000af84:	2a0030ef          	jal	ra,8000e224 <memcpy>
8000af88:	00442783          	lw	a5,4(s0)
8000af8c:	00848a13          	addi	s4,s1,8
8000af90:	00078663          	beqz	a5,8000af9c <etharp_input+0x110>
8000af94:	00c12703          	lw	a4,12(sp)
8000af98:	0ce78e63          	beq	a5,a4,8000b074 <etharp_input+0x1e8>
8000af9c:	00000a93          	li	s5,0
8000afa0:	00200b13          	li	s6,2
8000afa4:	00812503          	lw	a0,8(sp)
8000afa8:	08050e63          	beqz	a0,8000b044 <etharp_input+0x1b8>
8000afac:	00040593          	mv	a1,s0
8000afb0:	630010ef          	jal	ra,8000c5e0 <ip4_addr_isbroadcast_u32>
8000afb4:	08051863          	bnez	a0,8000b044 <etharp_input+0x1b8>
8000afb8:	00812783          	lw	a5,8(sp)
8000afbc:	0e000713          	li	a4,224
8000afc0:	0f07f793          	andi	a5,a5,240
8000afc4:	08e78063          	beq	a5,a4,8000b044 <etharp_input+0x1b8>
8000afc8:	00040613          	mv	a2,s0
8000afcc:	000b0593          	mv	a1,s6
8000afd0:	00810513          	addi	a0,sp,8
8000afd4:	aa1ff0ef          	jal	ra,8000aa74 <etharp_find_entry>
8000afd8:	06054663          	bltz	a0,8000b044 <etharp_input+0x1b8>
8000afdc:	00151793          	slli	a5,a0,0x1
8000afe0:	00a787b3          	add	a5,a5,a0
8000afe4:	b4c18713          	addi	a4,gp,-1204 # 800033cc <arp_table>
8000afe8:	00379793          	slli	a5,a5,0x3
8000afec:	00f70b33          	add	s6,a4,a5
8000aff0:	00200693          	li	a3,2
8000aff4:	00c78793          	addi	a5,a5,12
8000aff8:	00db0a23          	sb	a3,20(s6)
8000affc:	008b2423          	sw	s0,8(s6)
8000b000:	00600613          	li	a2,6
8000b004:	000a0593          	mv	a1,s4
8000b008:	00f70533          	add	a0,a4,a5
8000b00c:	218030ef          	jal	ra,8000e224 <memcpy>
8000b010:	000b2b83          	lw	s7,0(s6)
8000b014:	000b1923          	sh	zero,18(s6)
8000b018:	020b8663          	beqz	s7,8000b044 <etharp_input+0x1b8>
8000b01c:	00001737          	lui	a4,0x1
8000b020:	000b2023          	sw	zero,0(s6)
8000b024:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b028:	000a0693          	mv	a3,s4
8000b02c:	02e40613          	addi	a2,s0,46
8000b030:	000b8593          	mv	a1,s7
8000b034:	00040513          	mv	a0,s0
8000b038:	385010ef          	jal	ra,8000cbbc <ethernet_output>
8000b03c:	000b8513          	mv	a0,s7
8000b040:	ff5fb0ef          	jal	ra,80007034 <pbuf_free>
8000b044:	0074c783          	lbu	a5,7(s1)
8000b048:	0064c703          	lbu	a4,6(s1)
8000b04c:	00879793          	slli	a5,a5,0x8
8000b050:	00e7e7b3          	or	a5,a5,a4
8000b054:	10000713          	li	a4,256
8000b058:	02e78463          	beq	a5,a4,8000b080 <etharp_input+0x1f4>
8000b05c:	20000713          	li	a4,512
8000b060:	04e78663          	beq	a5,a4,8000b0ac <etharp_input+0x220>
8000b064:	05892783          	lw	a5,88(s2)
8000b068:	00178793          	addi	a5,a5,1
8000b06c:	04f92c23          	sw	a5,88(s2)
8000b070:	eb9ff06f          	j	8000af28 <etharp_input+0x9c>
8000b074:	00100a93          	li	s5,1
8000b078:	00100b13          	li	s6,1
8000b07c:	f29ff06f          	j	8000afa4 <etharp_input+0x118>
8000b080:	ea0a84e3          	beqz	s5,8000af28 <etharp_input+0x9c>
8000b084:	02e40693          	addi	a3,s0,46
8000b088:	00200893          	li	a7,2
8000b08c:	00810813          	addi	a6,sp,8
8000b090:	000a0793          	mv	a5,s4
8000b094:	00440713          	addi	a4,s0,4
8000b098:	000a0613          	mv	a2,s4
8000b09c:	00068593          	mv	a1,a3
8000b0a0:	00040513          	mv	a0,s0
8000b0a4:	b39ff0ef          	jal	ra,8000abdc <etharp_raw>
8000b0a8:	e81ff06f          	j	8000af28 <etharp_input+0x9c>
8000b0ac:	00810593          	addi	a1,sp,8
8000b0b0:	00040513          	mv	a0,s0
8000b0b4:	fd5fe0ef          	jal	ra,8000a088 <dhcp_arp_reply>
8000b0b8:	e71ff06f          	j	8000af28 <etharp_input+0x9c>
8000b0bc:	00008067          	ret

8000b0c0 <etharp_request>:
8000b0c0:	02e50693          	addi	a3,a0,46
8000b0c4:	00058813          	mv	a6,a1
8000b0c8:	00100893          	li	a7,1
8000b0cc:	84c18793          	addi	a5,gp,-1972 # 800030cc <ethzero>
8000b0d0:	00450713          	addi	a4,a0,4
8000b0d4:	85418613          	addi	a2,gp,-1964 # 800030d4 <ethbroadcast>
8000b0d8:	00068593          	mv	a1,a3
8000b0dc:	b01ff06f          	j	8000abdc <etharp_raw>

8000b0e0 <etharp_tmr>:
8000b0e0:	fd010113          	addi	sp,sp,-48
8000b0e4:	02812423          	sw	s0,40(sp)
8000b0e8:	02912223          	sw	s1,36(sp)
8000b0ec:	03212023          	sw	s2,32(sp)
8000b0f0:	01312e23          	sw	s3,28(sp)
8000b0f4:	01412c23          	sw	s4,24(sp)
8000b0f8:	01512a23          	sw	s5,20(sp)
8000b0fc:	01612823          	sw	s6,16(sp)
8000b100:	01712623          	sw	s7,12(sp)
8000b104:	02112623          	sw	ra,44(sp)
8000b108:	b4c18413          	addi	s0,gp,-1204 # 800033cc <arp_table>
8000b10c:	00000493          	li	s1,0
8000b110:	12b00a13          	li	s4,299
8000b114:	00100a93          	li	s5,1
8000b118:	00300b13          	li	s6,3
8000b11c:	00400913          	li	s2,4
8000b120:	00200b93          	li	s7,2
8000b124:	00a00993          	li	s3,10
8000b128:	01444703          	lbu	a4,20(s0)
8000b12c:	02070663          	beqz	a4,8000b158 <etharp_tmr+0x78>
8000b130:	01245783          	lhu	a5,18(s0)
8000b134:	00178793          	addi	a5,a5,1
8000b138:	01079793          	slli	a5,a5,0x10
8000b13c:	0107d793          	srli	a5,a5,0x10
8000b140:	00f41923          	sh	a5,18(s0)
8000b144:	00fa6663          	bltu	s4,a5,8000b150 <etharp_tmr+0x70>
8000b148:	05571463          	bne	a4,s5,8000b190 <etharp_tmr+0xb0>
8000b14c:	04f97e63          	bgeu	s2,a5,8000b1a8 <etharp_tmr+0xc8>
8000b150:	00048513          	mv	a0,s1
8000b154:	895ff0ef          	jal	ra,8000a9e8 <etharp_free_entry>
8000b158:	00148493          	addi	s1,s1,1
8000b15c:	01840413          	addi	s0,s0,24
8000b160:	fd3494e3          	bne	s1,s3,8000b128 <etharp_tmr+0x48>
8000b164:	02c12083          	lw	ra,44(sp)
8000b168:	02812403          	lw	s0,40(sp)
8000b16c:	02412483          	lw	s1,36(sp)
8000b170:	02012903          	lw	s2,32(sp)
8000b174:	01c12983          	lw	s3,28(sp)
8000b178:	01812a03          	lw	s4,24(sp)
8000b17c:	01412a83          	lw	s5,20(sp)
8000b180:	01012b03          	lw	s6,16(sp)
8000b184:	00c12b83          	lw	s7,12(sp)
8000b188:	03010113          	addi	sp,sp,48
8000b18c:	00008067          	ret
8000b190:	01671663          	bne	a4,s6,8000b19c <etharp_tmr+0xbc>
8000b194:	01240a23          	sb	s2,20(s0)
8000b198:	fc1ff06f          	j	8000b158 <etharp_tmr+0x78>
8000b19c:	fb271ee3          	bne	a4,s2,8000b158 <etharp_tmr+0x78>
8000b1a0:	01740a23          	sb	s7,20(s0)
8000b1a4:	fb5ff06f          	j	8000b158 <etharp_tmr+0x78>
8000b1a8:	00842503          	lw	a0,8(s0)
8000b1ac:	00440593          	addi	a1,s0,4
8000b1b0:	f11ff0ef          	jal	ra,8000b0c0 <etharp_request>
8000b1b4:	fa5ff06f          	j	8000b158 <etharp_tmr+0x78>

8000b1b8 <etharp_output_to_arp_index>:
8000b1b8:	fe010113          	addi	sp,sp,-32
8000b1bc:	01412423          	sw	s4,8(sp)
8000b1c0:	00058a13          	mv	s4,a1
8000b1c4:	00161593          	slli	a1,a2,0x1
8000b1c8:	00c58633          	add	a2,a1,a2
8000b1cc:	00361613          	slli	a2,a2,0x3
8000b1d0:	b4c18593          	addi	a1,gp,-1204 # 800033cc <arp_table>
8000b1d4:	00812c23          	sw	s0,24(sp)
8000b1d8:	00912a23          	sw	s1,20(sp)
8000b1dc:	01212823          	sw	s2,16(sp)
8000b1e0:	01312623          	sw	s3,12(sp)
8000b1e4:	00112e23          	sw	ra,28(sp)
8000b1e8:	00c584b3          	add	s1,a1,a2
8000b1ec:	0144c703          	lbu	a4,20(s1)
8000b1f0:	00c60413          	addi	s0,a2,12
8000b1f4:	00200793          	li	a5,2
8000b1f8:	00050913          	mv	s2,a0
8000b1fc:	00858433          	add	s0,a1,s0
8000b200:	02e50993          	addi	s3,a0,46
8000b204:	02f71463          	bne	a4,a5,8000b22c <etharp_output_to_arp_index+0x74>
8000b208:	0124d783          	lhu	a5,18(s1)
8000b20c:	11c00713          	li	a4,284
8000b210:	04f77a63          	bgeu	a4,a5,8000b264 <etharp_output_to_arp_index+0xac>
8000b214:	00460613          	addi	a2,a2,4
8000b218:	00c585b3          	add	a1,a1,a2
8000b21c:	ea5ff0ef          	jal	ra,8000b0c0 <etharp_request>
8000b220:	00051663          	bnez	a0,8000b22c <etharp_output_to_arp_index+0x74>
8000b224:	00300793          	li	a5,3
8000b228:	00f48a23          	sb	a5,20(s1)
8000b22c:	00040693          	mv	a3,s0
8000b230:	01812403          	lw	s0,24(sp)
8000b234:	01c12083          	lw	ra,28(sp)
8000b238:	01412483          	lw	s1,20(sp)
8000b23c:	00098613          	mv	a2,s3
8000b240:	000a0593          	mv	a1,s4
8000b244:	00c12983          	lw	s3,12(sp)
8000b248:	00812a03          	lw	s4,8(sp)
8000b24c:	00090513          	mv	a0,s2
8000b250:	01012903          	lw	s2,16(sp)
8000b254:	00001737          	lui	a4,0x1
8000b258:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b25c:	02010113          	addi	sp,sp,32
8000b260:	15d0106f          	j	8000cbbc <ethernet_output>
8000b264:	10d00713          	li	a4,269
8000b268:	fcf772e3          	bgeu	a4,a5,8000b22c <etharp_output_to_arp_index+0x74>
8000b26c:	00460613          	addi	a2,a2,4
8000b270:	00c58833          	add	a6,a1,a2
8000b274:	00100893          	li	a7,1
8000b278:	84c18793          	addi	a5,gp,-1972 # 800030cc <ethzero>
8000b27c:	00450713          	addi	a4,a0,4
8000b280:	00098693          	mv	a3,s3
8000b284:	00040613          	mv	a2,s0
8000b288:	00098593          	mv	a1,s3
8000b28c:	951ff0ef          	jal	ra,8000abdc <etharp_raw>
8000b290:	f91ff06f          	j	8000b220 <etharp_output_to_arp_index+0x68>

8000b294 <etharp_query>:
8000b294:	fe010113          	addi	sp,sp,-32
8000b298:	01512223          	sw	s5,4(sp)
8000b29c:	00058a93          	mv	s5,a1
8000b2a0:	00912a23          	sw	s1,20(sp)
8000b2a4:	00050593          	mv	a1,a0
8000b2a8:	00050493          	mv	s1,a0
8000b2ac:	000aa503          	lw	a0,0(s5)
8000b2b0:	01312623          	sw	s3,12(sp)
8000b2b4:	00112e23          	sw	ra,28(sp)
8000b2b8:	00812c23          	sw	s0,24(sp)
8000b2bc:	01212823          	sw	s2,16(sp)
8000b2c0:	01412423          	sw	s4,8(sp)
8000b2c4:	00060993          	mv	s3,a2
8000b2c8:	318010ef          	jal	ra,8000c5e0 <ip4_addr_isbroadcast_u32>
8000b2cc:	16051a63          	bnez	a0,8000b440 <etharp_query+0x1ac>
8000b2d0:	000aa783          	lw	a5,0(s5)
8000b2d4:	0e000713          	li	a4,224
8000b2d8:	0f07f693          	andi	a3,a5,240
8000b2dc:	16e68263          	beq	a3,a4,8000b440 <etharp_query+0x1ac>
8000b2e0:	16078063          	beqz	a5,8000b440 <etharp_query+0x1ac>
8000b2e4:	00048613          	mv	a2,s1
8000b2e8:	00100593          	li	a1,1
8000b2ec:	000a8513          	mv	a0,s5
8000b2f0:	f84ff0ef          	jal	ra,8000aa74 <etharp_find_entry>
8000b2f4:	02055e63          	bgez	a0,8000b330 <etharp_query+0x9c>
8000b2f8:	00098a63          	beqz	s3,8000b30c <etharp_query+0x78>
8000b2fc:	a0c18793          	addi	a5,gp,-1524 # 8000328c <lwip_stats>
8000b300:	0487a703          	lw	a4,72(a5)
8000b304:	00170713          	addi	a4,a4,1
8000b308:	04e7a423          	sw	a4,72(a5)
8000b30c:	01c12083          	lw	ra,28(sp)
8000b310:	01812403          	lw	s0,24(sp)
8000b314:	01412483          	lw	s1,20(sp)
8000b318:	01012903          	lw	s2,16(sp)
8000b31c:	00c12983          	lw	s3,12(sp)
8000b320:	00812a03          	lw	s4,8(sp)
8000b324:	00412a83          	lw	s5,4(sp)
8000b328:	02010113          	addi	sp,sp,32
8000b32c:	00008067          	ret
8000b330:	0ff57413          	andi	s0,a0,255
8000b334:	00141a13          	slli	s4,s0,0x1
8000b338:	008a0733          	add	a4,s4,s0
8000b33c:	b4c18793          	addi	a5,gp,-1204 # 800033cc <arp_table>
8000b340:	00371713          	slli	a4,a4,0x3
8000b344:	00e787b3          	add	a5,a5,a4
8000b348:	0147c703          	lbu	a4,20(a5)
8000b34c:	b4c18913          	addi	s2,gp,-1204 # 800033cc <arp_table>
8000b350:	08070663          	beqz	a4,8000b3dc <etharp_query+0x148>
8000b354:	fff00513          	li	a0,-1
8000b358:	00099a63          	bnez	s3,8000b36c <etharp_query+0xd8>
8000b35c:	000a8593          	mv	a1,s5
8000b360:	00048513          	mv	a0,s1
8000b364:	d5dff0ef          	jal	ra,8000b0c0 <etharp_request>
8000b368:	fa0982e3          	beqz	s3,8000b30c <etharp_query+0x78>
8000b36c:	008a07b3          	add	a5,s4,s0
8000b370:	00379793          	slli	a5,a5,0x3
8000b374:	00f907b3          	add	a5,s2,a5
8000b378:	0147c703          	lbu	a4,20(a5)
8000b37c:	00100793          	li	a5,1
8000b380:	06e7f663          	bgeu	a5,a4,8000b3ec <etharp_query+0x158>
8000b384:	00048863          	beqz	s1,8000b394 <etharp_query+0x100>
8000b388:	03c4a783          	lw	a5,60(s1)
8000b38c:	00078463          	beqz	a5,8000b394 <etharp_query+0x100>
8000b390:	00878023          	sb	s0,0(a5)
8000b394:	008a06b3          	add	a3,s4,s0
8000b398:	00369693          	slli	a3,a3,0x3
8000b39c:	01812403          	lw	s0,24(sp)
8000b3a0:	00c68693          	addi	a3,a3,12
8000b3a4:	01c12083          	lw	ra,28(sp)
8000b3a8:	00812a03          	lw	s4,8(sp)
8000b3ac:	00412a83          	lw	s5,4(sp)
8000b3b0:	00d906b3          	add	a3,s2,a3
8000b3b4:	02e48613          	addi	a2,s1,46
8000b3b8:	01012903          	lw	s2,16(sp)
8000b3bc:	00098593          	mv	a1,s3
8000b3c0:	00048513          	mv	a0,s1
8000b3c4:	00c12983          	lw	s3,12(sp)
8000b3c8:	01412483          	lw	s1,20(sp)
8000b3cc:	00001737          	lui	a4,0x1
8000b3d0:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b3d4:	02010113          	addi	sp,sp,32
8000b3d8:	7e40106f          	j	8000cbbc <ethernet_output>
8000b3dc:	00100713          	li	a4,1
8000b3e0:	00e78a23          	sb	a4,20(a5)
8000b3e4:	0097a423          	sw	s1,8(a5)
8000b3e8:	f75ff06f          	j	8000b35c <etharp_query+0xc8>
8000b3ec:	f2f710e3          	bne	a4,a5,8000b30c <etharp_query+0x78>
8000b3f0:	00098793          	mv	a5,s3
8000b3f4:	00c7c703          	lbu	a4,12(a5)
8000b3f8:	04077713          	andi	a4,a4,64
8000b3fc:	04071663          	bnez	a4,8000b448 <etharp_query+0x1b4>
8000b400:	0007a783          	lw	a5,0(a5)
8000b404:	fe0798e3          	bnez	a5,8000b3f4 <etharp_query+0x160>
8000b408:	00098513          	mv	a0,s3
8000b40c:	810fc0ef          	jal	ra,8000741c <pbuf_ref>
8000b410:	008a07b3          	add	a5,s4,s0
8000b414:	00379793          	slli	a5,a5,0x3
8000b418:	00f907b3          	add	a5,s2,a5
8000b41c:	0007a503          	lw	a0,0(a5)
8000b420:	00050463          	beqz	a0,8000b428 <etharp_query+0x194>
8000b424:	c11fb0ef          	jal	ra,80007034 <pbuf_free>
8000b428:	008a0433          	add	s0,s4,s0
8000b42c:	00341413          	slli	s0,s0,0x3
8000b430:	00890433          	add	s0,s2,s0
8000b434:	01342023          	sw	s3,0(s0)
8000b438:	00000513          	li	a0,0
8000b43c:	ed1ff06f          	j	8000b30c <etharp_query+0x78>
8000b440:	ff000513          	li	a0,-16
8000b444:	ec9ff06f          	j	8000b30c <etharp_query+0x78>
8000b448:	00098613          	mv	a2,s3
8000b44c:	28000593          	li	a1,640
8000b450:	01000513          	li	a0,16
8000b454:	c78fc0ef          	jal	ra,800078cc <pbuf_clone>
8000b458:	00050993          	mv	s3,a0
8000b45c:	fa051ae3          	bnez	a0,8000b410 <etharp_query+0x17c>
8000b460:	a0c18793          	addi	a5,gp,-1524 # 8000328c <lwip_stats>
8000b464:	0487a703          	lw	a4,72(a5)
8000b468:	fff00513          	li	a0,-1
8000b46c:	00170713          	addi	a4,a4,1
8000b470:	04e7a423          	sw	a4,72(a5)
8000b474:	e99ff06f          	j	8000b30c <etharp_query+0x78>

8000b478 <etharp_output>:
8000b478:	fe010113          	addi	sp,sp,-32
8000b47c:	00812c23          	sw	s0,24(sp)
8000b480:	00912a23          	sw	s1,20(sp)
8000b484:	01212823          	sw	s2,16(sp)
8000b488:	00112e23          	sw	ra,28(sp)
8000b48c:	00050413          	mv	s0,a0
8000b490:	00058913          	mv	s2,a1
8000b494:	00050593          	mv	a1,a0
8000b498:	00062503          	lw	a0,0(a2)
8000b49c:	00060493          	mv	s1,a2
8000b4a0:	140010ef          	jal	ra,8000c5e0 <ip4_addr_isbroadcast_u32>
8000b4a4:	16051863          	bnez	a0,8000b614 <etharp_output+0x19c>
8000b4a8:	0004a783          	lw	a5,0(s1)
8000b4ac:	0e000713          	li	a4,224
8000b4b0:	0f07f613          	andi	a2,a5,240
8000b4b4:	04e61863          	bne	a2,a4,8000b504 <etharp_output+0x8c>
8000b4b8:	00100793          	li	a5,1
8000b4bc:	00f11423          	sh	a5,8(sp)
8000b4c0:	05e00793          	li	a5,94
8000b4c4:	00f10523          	sb	a5,10(sp)
8000b4c8:	0014c783          	lbu	a5,1(s1)
8000b4cc:	00810693          	addi	a3,sp,8
8000b4d0:	07f7f793          	andi	a5,a5,127
8000b4d4:	00f105a3          	sb	a5,11(sp)
8000b4d8:	0024c783          	lbu	a5,2(s1)
8000b4dc:	00f10623          	sb	a5,12(sp)
8000b4e0:	0034c783          	lbu	a5,3(s1)
8000b4e4:	00f106a3          	sb	a5,13(sp)
8000b4e8:	00001737          	lui	a4,0x1
8000b4ec:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b4f0:	02e40613          	addi	a2,s0,46
8000b4f4:	00090593          	mv	a1,s2
8000b4f8:	00040513          	mv	a0,s0
8000b4fc:	6c0010ef          	jal	ra,8000cbbc <ethernet_output>
8000b500:	0a40006f          	j	8000b5a4 <etharp_output+0x12c>
8000b504:	00442703          	lw	a4,4(s0)
8000b508:	00842603          	lw	a2,8(s0)
8000b50c:	00050693          	mv	a3,a0
8000b510:	00e7c733          	xor	a4,a5,a4
8000b514:	00c77733          	and	a4,a4,a2
8000b518:	02070463          	beqz	a4,8000b540 <etharp_output+0xc8>
8000b51c:	01079793          	slli	a5,a5,0x10
8000b520:	00010737          	lui	a4,0x10
8000b524:	0107d793          	srli	a5,a5,0x10
8000b528:	ea970713          	addi	a4,a4,-343 # fea9 <_stack_size+0xf6a9>
8000b52c:	00e78a63          	beq	a5,a4,8000b540 <etharp_output+0xc8>
8000b530:	00c42783          	lw	a5,12(s0)
8000b534:	ffc00513          	li	a0,-4
8000b538:	06078663          	beqz	a5,8000b5a4 <etharp_output+0x12c>
8000b53c:	00c40493          	addi	s1,s0,12
8000b540:	03c42583          	lw	a1,60(s0)
8000b544:	b4c18793          	addi	a5,gp,-1204 # 800033cc <arp_table>
8000b548:	06058a63          	beqz	a1,8000b5bc <etharp_output+0x144>
8000b54c:	0005c603          	lbu	a2,0(a1)
8000b550:	00900713          	li	a4,9
8000b554:	06c76463          	bltu	a4,a2,8000b5bc <etharp_output+0x144>
8000b558:	00161713          	slli	a4,a2,0x1
8000b55c:	00c70733          	add	a4,a4,a2
8000b560:	00371713          	slli	a4,a4,0x3
8000b564:	00e78733          	add	a4,a5,a4
8000b568:	01474803          	lbu	a6,20(a4)
8000b56c:	00100513          	li	a0,1
8000b570:	05057663          	bgeu	a0,a6,8000b5bc <etharp_output+0x144>
8000b574:	00872503          	lw	a0,8(a4)
8000b578:	04851263          	bne	a0,s0,8000b5bc <etharp_output+0x144>
8000b57c:	0004a503          	lw	a0,0(s1)
8000b580:	00472703          	lw	a4,4(a4)
8000b584:	02e51c63          	bne	a0,a4,8000b5bc <etharp_output+0x144>
8000b588:	a0c18793          	addi	a5,gp,-1524 # 8000328c <lwip_stats>
8000b58c:	05c7a703          	lw	a4,92(a5)
8000b590:	00170713          	addi	a4,a4,1
8000b594:	04e7ae23          	sw	a4,92(a5)
8000b598:	00090593          	mv	a1,s2
8000b59c:	00040513          	mv	a0,s0
8000b5a0:	c19ff0ef          	jal	ra,8000b1b8 <etharp_output_to_arp_index>
8000b5a4:	01c12083          	lw	ra,28(sp)
8000b5a8:	01812403          	lw	s0,24(sp)
8000b5ac:	01412483          	lw	s1,20(sp)
8000b5b0:	01012903          	lw	s2,16(sp)
8000b5b4:	02010113          	addi	sp,sp,32
8000b5b8:	00008067          	ret
8000b5bc:	00100613          	li	a2,1
8000b5c0:	00a00713          	li	a4,10
8000b5c4:	0147c503          	lbu	a0,20(a5)
8000b5c8:	02a67463          	bgeu	a2,a0,8000b5f0 <etharp_output+0x178>
8000b5cc:	0087a503          	lw	a0,8(a5)
8000b5d0:	02851063          	bne	a0,s0,8000b5f0 <etharp_output+0x178>
8000b5d4:	0004a803          	lw	a6,0(s1)
8000b5d8:	0047a503          	lw	a0,4(a5)
8000b5dc:	00a81a63          	bne	a6,a0,8000b5f0 <etharp_output+0x178>
8000b5e0:	00058463          	beqz	a1,8000b5e8 <etharp_output+0x170>
8000b5e4:	00d58023          	sb	a3,0(a1)
8000b5e8:	00068613          	mv	a2,a3
8000b5ec:	fadff06f          	j	8000b598 <etharp_output+0x120>
8000b5f0:	00168693          	addi	a3,a3,1
8000b5f4:	0ff6f693          	andi	a3,a3,255
8000b5f8:	01878793          	addi	a5,a5,24
8000b5fc:	fce694e3          	bne	a3,a4,8000b5c4 <etharp_output+0x14c>
8000b600:	00090613          	mv	a2,s2
8000b604:	00048593          	mv	a1,s1
8000b608:	00040513          	mv	a0,s0
8000b60c:	c89ff0ef          	jal	ra,8000b294 <etharp_query>
8000b610:	f95ff06f          	j	8000b5a4 <etharp_output+0x12c>
8000b614:	85418693          	addi	a3,gp,-1964 # 800030d4 <ethbroadcast>
8000b618:	ed1ff06f          	j	8000b4e8 <etharp_output+0x70>

8000b61c <icmp_input>:
8000b61c:	fd010113          	addi	sp,sp,-48
8000b620:	02912223          	sw	s1,36(sp)
8000b624:	02812423          	sw	s0,40(sp)
8000b628:	01712623          	sw	s7,12(sp)
8000b62c:	02112623          	sw	ra,44(sp)
8000b630:	03212023          	sw	s2,32(sp)
8000b634:	01312e23          	sw	s3,28(sp)
8000b638:	01412c23          	sw	s4,24(sp)
8000b63c:	01512a23          	sw	s5,20(sp)
8000b640:	01612823          	sw	s6,16(sp)
8000b644:	01812423          	sw	s8,8(sp)
8000b648:	a0c18793          	addi	a5,gp,-1524 # 8000328c <lwip_stats>
8000b64c:	0c47a703          	lw	a4,196(a5)
8000b650:	00050413          	mv	s0,a0
8000b654:	00170713          	addi	a4,a4,1
8000b658:	0ce7a223          	sw	a4,196(a5)
8000b65c:	9f418713          	addi	a4,gp,-1548 # 80003274 <ip_data>
8000b660:	00872c03          	lw	s8,8(a4)
8000b664:	01300713          	li	a4,19
8000b668:	a0c18493          	addi	s1,gp,-1524 # 8000328c <lwip_stats>
8000b66c:	000c4a83          	lbu	s5,0(s8)
8000b670:	00fafa93          	andi	s5,s5,15
8000b674:	002a9a93          	slli	s5,s5,0x2
8000b678:	2b577863          	bgeu	a4,s5,8000b928 <icmp_input+0x30c>
8000b67c:	00a55683          	lhu	a3,10(a0)
8000b680:	00300713          	li	a4,3
8000b684:	2ad77263          	bgeu	a4,a3,8000b928 <icmp_input+0x30c>
8000b688:	00452703          	lw	a4,4(a0)
8000b68c:	00074703          	lbu	a4,0(a4)
8000b690:	22070663          	beqz	a4,8000b8bc <icmp_input+0x2a0>
8000b694:	00800693          	li	a3,8
8000b698:	26d71a63          	bne	a4,a3,8000b90c <icmp_input+0x2f0>
8000b69c:	9f418b93          	addi	s7,gp,-1548 # 80003274 <ip_data>
8000b6a0:	014ba503          	lw	a0,20(s7)
8000b6a4:	0e000793          	li	a5,224
8000b6a8:	00058993          	mv	s3,a1
8000b6ac:	0f057713          	andi	a4,a0,240
8000b6b0:	00458913          	addi	s2,a1,4
8000b6b4:	00f70463          	beq	a4,a5,8000b6bc <icmp_input+0xa0>
8000b6b8:	a0818913          	addi	s2,gp,-1528 # 80003288 <ip_data+0x14>
8000b6bc:	000ba583          	lw	a1,0(s7)
8000b6c0:	721000ef          	jal	ra,8000c5e0 <ip4_addr_isbroadcast_u32>
8000b6c4:	00050463          	beqz	a0,8000b6cc <icmp_input+0xb0>
8000b6c8:	00498913          	addi	s2,s3,4
8000b6cc:	00845703          	lhu	a4,8(s0)
8000b6d0:	00700793          	li	a5,7
8000b6d4:	24e7fa63          	bgeu	a5,a4,8000b928 <icmp_input+0x30c>
8000b6d8:	00040513          	mv	a0,s0
8000b6dc:	d4dfa0ef          	jal	ra,80006428 <inet_chksum_pbuf>
8000b6e0:	04050463          	beqz	a0,8000b728 <icmp_input+0x10c>
8000b6e4:	00040513          	mv	a0,s0
8000b6e8:	94dfb0ef          	jal	ra,80007034 <pbuf_free>
8000b6ec:	0d04a783          	lw	a5,208(s1)
8000b6f0:	00178793          	addi	a5,a5,1
8000b6f4:	0cf4a823          	sw	a5,208(s1)
8000b6f8:	02c12083          	lw	ra,44(sp)
8000b6fc:	02812403          	lw	s0,40(sp)
8000b700:	02412483          	lw	s1,36(sp)
8000b704:	02012903          	lw	s2,32(sp)
8000b708:	01c12983          	lw	s3,28(sp)
8000b70c:	01812a03          	lw	s4,24(sp)
8000b710:	01412a83          	lw	s5,20(sp)
8000b714:	01012b03          	lw	s6,16(sp)
8000b718:	00c12b83          	lw	s7,12(sp)
8000b71c:	00812c03          	lw	s8,8(sp)
8000b720:	03010113          	addi	sp,sp,48
8000b724:	00008067          	ret
8000b728:	010a8b13          	addi	s6,s5,16
8000b72c:	010a9a13          	slli	s4,s5,0x10
8000b730:	000b0593          	mv	a1,s6
8000b734:	00040513          	mv	a0,s0
8000b738:	010a5a13          	srli	s4,s4,0x10
8000b73c:	861fb0ef          	jal	ra,80006f9c <pbuf_add_header>
8000b740:	1a050863          	beqz	a0,8000b8f0 <icmp_input+0x2d4>
8000b744:	00845783          	lhu	a5,8(s0)
8000b748:	014785b3          	add	a1,a5,s4
8000b74c:	01059593          	slli	a1,a1,0x10
8000b750:	0105d593          	srli	a1,a1,0x10
8000b754:	02f5e463          	bltu	a1,a5,8000b77c <icmp_input+0x160>
8000b758:	28000613          	li	a2,640
8000b75c:	01000513          	li	a0,16
8000b760:	9a9fb0ef          	jal	ra,80007108 <pbuf_alloc>
8000b764:	00050b13          	mv	s6,a0
8000b768:	00050a63          	beqz	a0,8000b77c <icmp_input+0x160>
8000b76c:	00a55703          	lhu	a4,10(a0)
8000b770:	008a8793          	addi	a5,s5,8
8000b774:	02f77063          	bgeu	a4,a5,8000b794 <icmp_input+0x178>
8000b778:	8bdfb0ef          	jal	ra,80007034 <pbuf_free>
8000b77c:	00040513          	mv	a0,s0
8000b780:	8b5fb0ef          	jal	ra,80007034 <pbuf_free>
8000b784:	0e84a783          	lw	a5,232(s1)
8000b788:	00178793          	addi	a5,a5,1
8000b78c:	0ef4a423          	sw	a5,232(s1)
8000b790:	f69ff06f          	j	8000b6f8 <icmp_input+0xdc>
8000b794:	00452503          	lw	a0,4(a0)
8000b798:	000c0593          	mv	a1,s8
8000b79c:	000a8613          	mv	a2,s5
8000b7a0:	285020ef          	jal	ra,8000e224 <memcpy>
8000b7a4:	000a8593          	mv	a1,s5
8000b7a8:	000b0513          	mv	a0,s6
8000b7ac:	801fb0ef          	jal	ra,80006fac <pbuf_remove_header>
8000b7b0:	00050663          	beqz	a0,8000b7bc <icmp_input+0x1a0>
8000b7b4:	000b0513          	mv	a0,s6
8000b7b8:	fc1ff06f          	j	8000b778 <icmp_input+0x15c>
8000b7bc:	00040593          	mv	a1,s0
8000b7c0:	000b0513          	mv	a0,s6
8000b7c4:	d45fb0ef          	jal	ra,80007508 <pbuf_copy>
8000b7c8:	fe0516e3          	bnez	a0,8000b7b4 <icmp_input+0x198>
8000b7cc:	00040513          	mv	a0,s0
8000b7d0:	865fb0ef          	jal	ra,80007034 <pbuf_free>
8000b7d4:	000b0413          	mv	s0,s6
8000b7d8:	000a8593          	mv	a1,s5
8000b7dc:	00040513          	mv	a0,s0
8000b7e0:	00442b03          	lw	s6,4(s0)
8000b7e4:	fb8fb0ef          	jal	ra,80006f9c <pbuf_add_header>
8000b7e8:	0c051a63          	bnez	a0,8000b8bc <icmp_input+0x2a0>
8000b7ec:	00092783          	lw	a5,0(s2)
8000b7f0:	00442a83          	lw	s5,4(s0)
8000b7f4:	0087d713          	srli	a4,a5,0x8
8000b7f8:	00fa8623          	sb	a5,12(s5)
8000b7fc:	00ea86a3          	sb	a4,13(s5)
8000b800:	0107d713          	srli	a4,a5,0x10
8000b804:	0187d793          	srli	a5,a5,0x18
8000b808:	00ea8723          	sb	a4,14(s5)
8000b80c:	00fa87a3          	sb	a5,15(s5)
8000b810:	010ba783          	lw	a5,16(s7)
8000b814:	0087d713          	srli	a4,a5,0x8
8000b818:	00fa8823          	sb	a5,16(s5)
8000b81c:	00ea88a3          	sb	a4,17(s5)
8000b820:	0107d713          	srli	a4,a5,0x10
8000b824:	0187d793          	srli	a5,a5,0x18
8000b828:	00ea8923          	sb	a4,18(s5)
8000b82c:	00fa89a3          	sb	a5,19(s5)
8000b830:	003b4783          	lbu	a5,3(s6)
8000b834:	002b4703          	lbu	a4,2(s6)
8000b838:	000b0023          	sb	zero,0(s6)
8000b83c:	00879793          	slli	a5,a5,0x8
8000b840:	00e7e7b3          	or	a5,a5,a4
8000b844:	00010737          	lui	a4,0x10
8000b848:	ff770713          	addi	a4,a4,-9 # fff7 <_stack_size+0xf7f7>
8000b84c:	0af77c63          	bgeu	a4,a5,8000b904 <icmp_input+0x2e8>
8000b850:	00978793          	addi	a5,a5,9
8000b854:	01079793          	slli	a5,a5,0x10
8000b858:	0107d793          	srli	a5,a5,0x10
8000b85c:	00fb0123          	sb	a5,2(s6)
8000b860:	0087d793          	srli	a5,a5,0x8
8000b864:	00fb01a3          	sb	a5,3(s6)
8000b868:	fff00793          	li	a5,-1
8000b86c:	00fa8423          	sb	a5,8(s5)
8000b870:	000a0593          	mv	a1,s4
8000b874:	000a8523          	sb	zero,10(s5)
8000b878:	000a85a3          	sb	zero,11(s5)
8000b87c:	000a8513          	mv	a0,s5
8000b880:	b85fa0ef          	jal	ra,80006404 <inet_chksum>
8000b884:	00aa8523          	sb	a0,10(s5)
8000b888:	00855513          	srli	a0,a0,0x8
8000b88c:	00aa85a3          	sb	a0,11(s5)
8000b890:	0c04a783          	lw	a5,192(s1)
8000b894:	00098813          	mv	a6,s3
8000b898:	00000713          	li	a4,0
8000b89c:	00178793          	addi	a5,a5,1
8000b8a0:	0cf4a023          	sw	a5,192(s1)
8000b8a4:	0ff00693          	li	a3,255
8000b8a8:	00100793          	li	a5,1
8000b8ac:	00000613          	li	a2,0
8000b8b0:	00090593          	mv	a1,s2
8000b8b4:	00040513          	mv	a0,s0
8000b8b8:	3fd000ef          	jal	ra,8000c4b4 <ip4_output_if>
8000b8bc:	00040513          	mv	a0,s0
8000b8c0:	02812403          	lw	s0,40(sp)
8000b8c4:	02c12083          	lw	ra,44(sp)
8000b8c8:	02412483          	lw	s1,36(sp)
8000b8cc:	02012903          	lw	s2,32(sp)
8000b8d0:	01c12983          	lw	s3,28(sp)
8000b8d4:	01812a03          	lw	s4,24(sp)
8000b8d8:	01412a83          	lw	s5,20(sp)
8000b8dc:	01012b03          	lw	s6,16(sp)
8000b8e0:	00c12b83          	lw	s7,12(sp)
8000b8e4:	00812c03          	lw	s8,8(sp)
8000b8e8:	03010113          	addi	sp,sp,48
8000b8ec:	f48fb06f          	j	80007034 <pbuf_free>
8000b8f0:	000b0593          	mv	a1,s6
8000b8f4:	00040513          	mv	a0,s0
8000b8f8:	eb4fb0ef          	jal	ra,80006fac <pbuf_remove_header>
8000b8fc:	ec050ee3          	beqz	a0,8000b7d8 <icmp_input+0x1bc>
8000b900:	e7dff06f          	j	8000b77c <icmp_input+0x160>
8000b904:	00878793          	addi	a5,a5,8
8000b908:	f4dff06f          	j	8000b854 <icmp_input+0x238>
8000b90c:	0e07a703          	lw	a4,224(a5)
8000b910:	00170713          	addi	a4,a4,1
8000b914:	0ee7a023          	sw	a4,224(a5)
8000b918:	0cc7a703          	lw	a4,204(a5)
8000b91c:	00170713          	addi	a4,a4,1
8000b920:	0ce7a623          	sw	a4,204(a5)
8000b924:	f99ff06f          	j	8000b8bc <icmp_input+0x2a0>
8000b928:	00040513          	mv	a0,s0
8000b92c:	f08fb0ef          	jal	ra,80007034 <pbuf_free>
8000b930:	0d44a783          	lw	a5,212(s1)
8000b934:	00178793          	addi	a5,a5,1
8000b938:	0cf4aa23          	sw	a5,212(s1)
8000b93c:	dbdff06f          	j	8000b6f8 <icmp_input+0xdc>

8000b940 <icmp_dest_unreach>:
8000b940:	fc010113          	addi	sp,sp,-64
8000b944:	03312623          	sw	s3,44(sp)
8000b948:	03412423          	sw	s4,40(sp)
8000b94c:	00050993          	mv	s3,a0
8000b950:	00058a13          	mv	s4,a1
8000b954:	28000613          	li	a2,640
8000b958:	02400593          	li	a1,36
8000b95c:	02400513          	li	a0,36
8000b960:	02112e23          	sw	ra,60(sp)
8000b964:	02812c23          	sw	s0,56(sp)
8000b968:	02912a23          	sw	s1,52(sp)
8000b96c:	03212823          	sw	s2,48(sp)
8000b970:	f98fb0ef          	jal	ra,80007108 <pbuf_alloc>
8000b974:	0c050a63          	beqz	a0,8000ba48 <icmp_dest_unreach+0x108>
8000b978:	00452403          	lw	s0,4(a0)
8000b97c:	00300793          	li	a5,3
8000b980:	0049a903          	lw	s2,4(s3)
8000b984:	00f40023          	sb	a5,0(s0)
8000b988:	014400a3          	sb	s4,1(s0)
8000b98c:	00040223          	sb	zero,4(s0)
8000b990:	000402a3          	sb	zero,5(s0)
8000b994:	00040323          	sb	zero,6(s0)
8000b998:	000403a3          	sb	zero,7(s0)
8000b99c:	00050493          	mv	s1,a0
8000b9a0:	00452503          	lw	a0,4(a0)
8000b9a4:	0049a583          	lw	a1,4(s3)
8000b9a8:	01c00613          	li	a2,28
8000b9ac:	00850513          	addi	a0,a0,8
8000b9b0:	075020ef          	jal	ra,8000e224 <memcpy>
8000b9b4:	00d94703          	lbu	a4,13(s2)
8000b9b8:	00c94783          	lbu	a5,12(s2)
8000b9bc:	01c10513          	addi	a0,sp,28
8000b9c0:	00871713          	slli	a4,a4,0x8
8000b9c4:	00f76733          	or	a4,a4,a5
8000b9c8:	00e94783          	lbu	a5,14(s2)
8000b9cc:	01079793          	slli	a5,a5,0x10
8000b9d0:	00e7e733          	or	a4,a5,a4
8000b9d4:	00f94783          	lbu	a5,15(s2)
8000b9d8:	01879793          	slli	a5,a5,0x18
8000b9dc:	00e7e7b3          	or	a5,a5,a4
8000b9e0:	00f12e23          	sw	a5,28(sp)
8000b9e4:	438000ef          	jal	ra,8000be1c <ip4_route>
8000b9e8:	00a12623          	sw	a0,12(sp)
8000b9ec:	04050a63          	beqz	a0,8000ba40 <icmp_dest_unreach+0x100>
8000b9f0:	00040123          	sb	zero,2(s0)
8000b9f4:	000401a3          	sb	zero,3(s0)
8000b9f8:	00a4d583          	lhu	a1,10(s1)
8000b9fc:	00040513          	mv	a0,s0
8000ba00:	a05fa0ef          	jal	ra,80006404 <inet_chksum>
8000ba04:	00a40123          	sb	a0,2(s0)
8000ba08:	00855513          	srli	a0,a0,0x8
8000ba0c:	00a401a3          	sb	a0,3(s0)
8000ba10:	a0c18793          	addi	a5,gp,-1524 # 8000328c <lwip_stats>
8000ba14:	0c07a703          	lw	a4,192(a5)
8000ba18:	00c12803          	lw	a6,12(sp)
8000ba1c:	0ff00693          	li	a3,255
8000ba20:	00170713          	addi	a4,a4,1
8000ba24:	0ce7a023          	sw	a4,192(a5)
8000ba28:	01c10613          	addi	a2,sp,28
8000ba2c:	00100793          	li	a5,1
8000ba30:	00000713          	li	a4,0
8000ba34:	00000593          	li	a1,0
8000ba38:	00048513          	mv	a0,s1
8000ba3c:	279000ef          	jal	ra,8000c4b4 <ip4_output_if>
8000ba40:	00048513          	mv	a0,s1
8000ba44:	df0fb0ef          	jal	ra,80007034 <pbuf_free>
8000ba48:	03c12083          	lw	ra,60(sp)
8000ba4c:	03812403          	lw	s0,56(sp)
8000ba50:	03412483          	lw	s1,52(sp)
8000ba54:	03012903          	lw	s2,48(sp)
8000ba58:	02c12983          	lw	s3,44(sp)
8000ba5c:	02812a03          	lw	s4,40(sp)
8000ba60:	04010113          	addi	sp,sp,64
8000ba64:	00008067          	ret

8000ba68 <ipfrag_free_pbuf_custom>:
8000ba68:	00050593          	mv	a1,a0
8000ba6c:	01452503          	lw	a0,20(a0)
8000ba70:	02050463          	beqz	a0,8000ba98 <ipfrag_free_pbuf_custom+0x30>
8000ba74:	fe010113          	addi	sp,sp,-32
8000ba78:	00112e23          	sw	ra,28(sp)
8000ba7c:	00b12623          	sw	a1,12(sp)
8000ba80:	db4fb0ef          	jal	ra,80007034 <pbuf_free>
8000ba84:	00c12583          	lw	a1,12(sp)
8000ba88:	01c12083          	lw	ra,28(sp)
8000ba8c:	00200513          	li	a0,2
8000ba90:	02010113          	addi	sp,sp,32
8000ba94:	cedfa06f          	j	80006780 <memp_free>
8000ba98:	00200513          	li	a0,2
8000ba9c:	ff9ff06f          	j	8000ba94 <ipfrag_free_pbuf_custom+0x2c>

8000baa0 <ip4_frag>:
8000baa0:	fa010113          	addi	sp,sp,-96
8000baa4:	04112e23          	sw	ra,92(sp)
8000baa8:	04812c23          	sw	s0,88(sp)
8000baac:	04912a23          	sw	s1,84(sp)
8000bab0:	05212823          	sw	s2,80(sp)
8000bab4:	05312623          	sw	s3,76(sp)
8000bab8:	05412423          	sw	s4,72(sp)
8000babc:	05512223          	sw	s5,68(sp)
8000bac0:	05612023          	sw	s6,64(sp)
8000bac4:	03712e23          	sw	s7,60(sp)
8000bac8:	03812c23          	sw	s8,56(sp)
8000bacc:	03912a23          	sw	s9,52(sp)
8000bad0:	03a12823          	sw	s10,48(sp)
8000bad4:	03b12623          	sw	s11,44(sp)
8000bad8:	02c5d783          	lhu	a5,44(a1)
8000badc:	00452c03          	lw	s8,4(a0)
8000bae0:	00c12623          	sw	a2,12(sp)
8000bae4:	fec78713          	addi	a4,a5,-20
8000bae8:	41f75793          	srai	a5,a4,0x1f
8000baec:	0077f793          	andi	a5,a5,7
8000baf0:	00e787b3          	add	a5,a5,a4
8000baf4:	4037d793          	srai	a5,a5,0x3
8000baf8:	01079793          	slli	a5,a5,0x10
8000bafc:	0107d793          	srli	a5,a5,0x10
8000bb00:	00f12223          	sw	a5,4(sp)
8000bb04:	000c4783          	lbu	a5,0(s8)
8000bb08:	01400713          	li	a4,20
8000bb0c:	00f7f793          	andi	a5,a5,15
8000bb10:	00279793          	slli	a5,a5,0x2
8000bb14:	2ae79663          	bne	a5,a4,8000bdc0 <ip4_frag+0x320>
8000bb18:	00a55703          	lhu	a4,10(a0)
8000bb1c:	01300793          	li	a5,19
8000bb20:	00050413          	mv	s0,a0
8000bb24:	ffa00513          	li	a0,-6
8000bb28:	06e7fc63          	bgeu	a5,a4,8000bba0 <ip4_frag+0x100>
8000bb2c:	007c4783          	lbu	a5,7(s8)
8000bb30:	006c4503          	lbu	a0,6(s8)
8000bb34:	00058c93          	mv	s9,a1
8000bb38:	00879793          	slli	a5,a5,0x8
8000bb3c:	00a7e533          	or	a0,a5,a0
8000bb40:	ad0fa0ef          	jal	ra,80005e10 <lwip_htons>
8000bb44:	000027b7          	lui	a5,0x2
8000bb48:	00f577b3          	and	a5,a0,a5
8000bb4c:	00f12423          	sw	a5,8(sp)
8000bb50:	00412783          	lw	a5,4(sp)
8000bb54:	00845483          	lhu	s1,8(s0)
8000bb58:	01351b93          	slli	s7,a0,0x13
8000bb5c:	00379793          	slli	a5,a5,0x3
8000bb60:	01079793          	slli	a5,a5,0x10
8000bb64:	0107d793          	srli	a5,a5,0x10
8000bb68:	fec48493          	addi	s1,s1,-20
8000bb6c:	00f12023          	sw	a5,0(sp)
8000bb70:	00f11923          	sh	a5,18(sp)
8000bb74:	8000c7b7          	lui	a5,0x8000c
8000bb78:	01049493          	slli	s1,s1,0x10
8000bb7c:	a6878793          	addi	a5,a5,-1432 # 8000ba68 <_ram_heap_end+0xffff9a68>
8000bb80:	013bdb93          	srli	s7,s7,0x13
8000bb84:	0104d493          	srli	s1,s1,0x10
8000bb88:	01400a13          	li	s4,20
8000bb8c:	00000913          	li	s2,0
8000bb90:	00f12a23          	sw	a5,20(sp)
8000bb94:	a0c18d13          	addi	s10,gp,-1524 # 8000328c <lwip_stats>
8000bb98:	04049263          	bnez	s1,8000bbdc <ip4_frag+0x13c>
8000bb9c:	00000513          	li	a0,0
8000bba0:	05c12083          	lw	ra,92(sp)
8000bba4:	05812403          	lw	s0,88(sp)
8000bba8:	05412483          	lw	s1,84(sp)
8000bbac:	05012903          	lw	s2,80(sp)
8000bbb0:	04c12983          	lw	s3,76(sp)
8000bbb4:	04812a03          	lw	s4,72(sp)
8000bbb8:	04412a83          	lw	s5,68(sp)
8000bbbc:	04012b03          	lw	s6,64(sp)
8000bbc0:	03c12b83          	lw	s7,60(sp)
8000bbc4:	03812c03          	lw	s8,56(sp)
8000bbc8:	03412c83          	lw	s9,52(sp)
8000bbcc:	03012d03          	lw	s10,48(sp)
8000bbd0:	02c12d83          	lw	s11,44(sp)
8000bbd4:	06010113          	addi	sp,sp,96
8000bbd8:	00008067          	ret
8000bbdc:	00012783          	lw	a5,0(sp)
8000bbe0:	01215a83          	lhu	s5,18(sp)
8000bbe4:	00f4f463          	bgeu	s1,a5,8000bbec <ip4_frag+0x14c>
8000bbe8:	00048a93          	mv	s5,s1
8000bbec:	28000613          	li	a2,640
8000bbf0:	01400593          	li	a1,20
8000bbf4:	01000513          	li	a0,16
8000bbf8:	010a9a93          	slli	s5,s5,0x10
8000bbfc:	d0cfb0ef          	jal	ra,80007108 <pbuf_alloc>
8000bc00:	010ada93          	srli	s5,s5,0x10
8000bc04:	00050b13          	mv	s6,a0
8000bc08:	06050a63          	beqz	a0,8000bc7c <ip4_frag+0x1dc>
8000bc0c:	00452503          	lw	a0,4(a0)
8000bc10:	01400613          	li	a2,20
8000bc14:	000c0593          	mv	a1,s8
8000bc18:	60c020ef          	jal	ra,8000e224 <memcpy>
8000bc1c:	004b2983          	lw	s3,4(s6)
8000bc20:	000a8d93          	mv	s11,s5
8000bc24:	0c0d8c63          	beqz	s11,8000bcfc <ip4_frag+0x25c>
8000bc28:	00a45783          	lhu	a5,10(s0)
8000bc2c:	414787b3          	sub	a5,a5,s4
8000bc30:	00078913          	mv	s2,a5
8000bc34:	01079793          	slli	a5,a5,0x10
8000bc38:	0107d793          	srli	a5,a5,0x10
8000bc3c:	00fdf463          	bgeu	s11,a5,8000bc44 <ip4_frag+0x1a4>
8000bc40:	000d8913          	mv	s2,s11
8000bc44:	01091913          	slli	s2,s2,0x10
8000bc48:	01095913          	srli	s2,s2,0x10
8000bc4c:	00091863          	bnez	s2,8000bc5c <ip4_frag+0x1bc>
8000bc50:	00042403          	lw	s0,0(s0)
8000bc54:	00000a13          	li	s4,0
8000bc58:	fcdff06f          	j	8000bc24 <ip4_frag+0x184>
8000bc5c:	800037b7          	lui	a5,0x80003
8000bc60:	2bd00613          	li	a2,701
8000bc64:	d3478593          	addi	a1,a5,-716 # 80002d34 <_ram_heap_end+0xffff0d34>
8000bc68:	00200513          	li	a0,2
8000bc6c:	addfa0ef          	jal	ra,80006748 <memp_malloc_fn>
8000bc70:	00051a63          	bnez	a0,8000bc84 <ip4_frag+0x1e4>
8000bc74:	000b0513          	mv	a0,s6
8000bc78:	bbcfb0ef          	jal	ra,80007034 <pbuf_free>
8000bc7c:	fff00513          	li	a0,-1
8000bc80:	f21ff06f          	j	8000bba0 <ip4_frag+0x100>
8000bc84:	00442703          	lw	a4,4(s0)
8000bc88:	00050693          	mv	a3,a0
8000bc8c:	00a12c23          	sw	a0,24(sp)
8000bc90:	00090793          	mv	a5,s2
8000bc94:	01470733          	add	a4,a4,s4
8000bc98:	04100613          	li	a2,65
8000bc9c:	00090593          	mv	a1,s2
8000bca0:	00000513          	li	a0,0
8000bca4:	aa4fb0ef          	jal	ra,80006f48 <pbuf_alloced_custom>
8000bca8:	01812883          	lw	a7,24(sp)
8000bcac:	00051a63          	bnez	a0,8000bcc0 <ip4_frag+0x220>
8000bcb0:	00088593          	mv	a1,a7
8000bcb4:	00200513          	li	a0,2
8000bcb8:	ac9fa0ef          	jal	ra,80006780 <memp_free>
8000bcbc:	fb9ff06f          	j	8000bc74 <ip4_frag+0x1d4>
8000bcc0:	00a12c23          	sw	a0,24(sp)
8000bcc4:	00040513          	mv	a0,s0
8000bcc8:	01112e23          	sw	a7,28(sp)
8000bccc:	f50fb0ef          	jal	ra,8000741c <pbuf_ref>
8000bcd0:	01c12883          	lw	a7,28(sp)
8000bcd4:	01412783          	lw	a5,20(sp)
8000bcd8:	01812583          	lw	a1,24(sp)
8000bcdc:	0088aa23          	sw	s0,20(a7)
8000bce0:	00f8a823          	sw	a5,16(a7)
8000bce4:	000b0513          	mv	a0,s6
8000bce8:	f6cfb0ef          	jal	ra,80007454 <pbuf_cat>
8000bcec:	412d8833          	sub	a6,s11,s2
8000bcf0:	01081d93          	slli	s11,a6,0x10
8000bcf4:	010ddd93          	srli	s11,s11,0x10
8000bcf8:	f40d9ce3          	bnez	s11,8000bc50 <ip4_frag+0x1b0>
8000bcfc:	02ccd783          	lhu	a5,44(s9)
8000bd00:	01490a33          	add	s4,s2,s4
8000bd04:	010a1a13          	slli	s4,s4,0x10
8000bd08:	013b9513          	slli	a0,s7,0x13
8000bd0c:	fed78793          	addi	a5,a5,-19
8000bd10:	010a5a13          	srli	s4,s4,0x10
8000bd14:	01355513          	srli	a0,a0,0x13
8000bd18:	00f4d663          	bge	s1,a5,8000bd24 <ip4_frag+0x284>
8000bd1c:	00812783          	lw	a5,8(sp)
8000bd20:	00078663          	beqz	a5,8000bd2c <ip4_frag+0x28c>
8000bd24:	000027b7          	lui	a5,0x2
8000bd28:	00f56533          	or	a0,a0,a5
8000bd2c:	8e4fa0ef          	jal	ra,80005e10 <lwip_htons>
8000bd30:	00a98323          	sb	a0,6(s3)
8000bd34:	00855513          	srli	a0,a0,0x8
8000bd38:	00a983a3          	sb	a0,7(s3)
8000bd3c:	014a8513          	addi	a0,s5,20
8000bd40:	01051513          	slli	a0,a0,0x10
8000bd44:	01055513          	srli	a0,a0,0x10
8000bd48:	8c8fa0ef          	jal	ra,80005e10 <lwip_htons>
8000bd4c:	00a98123          	sb	a0,2(s3)
8000bd50:	00855513          	srli	a0,a0,0x8
8000bd54:	00a981a3          	sb	a0,3(s3)
8000bd58:	01400593          	li	a1,20
8000bd5c:	00098523          	sb	zero,10(s3)
8000bd60:	000985a3          	sb	zero,11(s3)
8000bd64:	00098513          	mv	a0,s3
8000bd68:	e9cfa0ef          	jal	ra,80006404 <inet_chksum>
8000bd6c:	00a98523          	sb	a0,10(s3)
8000bd70:	00855513          	srli	a0,a0,0x8
8000bd74:	00a985a3          	sb	a0,11(s3)
8000bd78:	014ca783          	lw	a5,20(s9)
8000bd7c:	00c12603          	lw	a2,12(sp)
8000bd80:	000b0593          	mv	a1,s6
8000bd84:	000c8513          	mv	a0,s9
8000bd88:	000780e7          	jalr	a5 # 2000 <_stack_size+0x1800>
8000bd8c:	060d2783          	lw	a5,96(s10)
8000bd90:	000b0513          	mv	a0,s6
8000bd94:	415484b3          	sub	s1,s1,s5
8000bd98:	00178793          	addi	a5,a5,1
8000bd9c:	06fd2023          	sw	a5,96(s10)
8000bda0:	a94fb0ef          	jal	ra,80007034 <pbuf_free>
8000bda4:	00412783          	lw	a5,4(sp)
8000bda8:	01049493          	slli	s1,s1,0x10
8000bdac:	0104d493          	srli	s1,s1,0x10
8000bdb0:	00fb8bb3          	add	s7,s7,a5
8000bdb4:	010b9b93          	slli	s7,s7,0x10
8000bdb8:	010bdb93          	srli	s7,s7,0x10
8000bdbc:	dddff06f          	j	8000bb98 <ip4_frag+0xf8>
8000bdc0:	ffa00513          	li	a0,-6
8000bdc4:	dddff06f          	j	8000bba0 <ip4_frag+0x100>

8000bdc8 <ip4_input_accept>:
8000bdc8:	03554783          	lbu	a5,53(a0)
8000bdcc:	0017f793          	andi	a5,a5,1
8000bdd0:	04078063          	beqz	a5,8000be10 <ip4_input_accept+0x48>
8000bdd4:	00452703          	lw	a4,4(a0)
8000bdd8:	00050593          	mv	a1,a0
8000bddc:	00000513          	li	a0,0
8000bde0:	02070c63          	beqz	a4,8000be18 <ip4_input_accept+0x50>
8000bde4:	a081a783          	lw	a5,-1528(gp) # 80003288 <ip_data+0x14>
8000bde8:	00100513          	li	a0,1
8000bdec:	02f70663          	beq	a4,a5,8000be18 <ip4_input_accept+0x50>
8000bdf0:	ff010113          	addi	sp,sp,-16
8000bdf4:	00078513          	mv	a0,a5
8000bdf8:	00112623          	sw	ra,12(sp)
8000bdfc:	7e4000ef          	jal	ra,8000c5e0 <ip4_addr_isbroadcast_u32>
8000be00:	00c12083          	lw	ra,12(sp)
8000be04:	00a03533          	snez	a0,a0
8000be08:	01010113          	addi	sp,sp,16
8000be0c:	00008067          	ret
8000be10:	00000513          	li	a0,0
8000be14:	00008067          	ret
8000be18:	00008067          	ret

8000be1c <ip4_route>:
8000be1c:	8d41a783          	lw	a5,-1836(gp) # 80003154 <netif_list>
8000be20:	04079463          	bnez	a5,8000be68 <ip4_route+0x4c>
8000be24:	8d01a703          	lw	a4,-1840(gp) # 80003150 <netif_default>
8000be28:	02070463          	beqz	a4,8000be50 <ip4_route+0x34>
8000be2c:	03574683          	lbu	a3,53(a4)
8000be30:	00500613          	li	a2,5
8000be34:	0056f693          	andi	a3,a3,5
8000be38:	00c69c63          	bne	a3,a2,8000be50 <ip4_route+0x34>
8000be3c:	00472683          	lw	a3,4(a4)
8000be40:	00068863          	beqz	a3,8000be50 <ip4_route+0x34>
8000be44:	00054603          	lbu	a2,0(a0)
8000be48:	07f00693          	li	a3,127
8000be4c:	06d61463          	bne	a2,a3,8000beb4 <ip4_route+0x98>
8000be50:	a0c18713          	addi	a4,gp,-1524 # 8000328c <lwip_stats>
8000be54:	0ac72683          	lw	a3,172(a4)
8000be58:	00168693          	addi	a3,a3,1
8000be5c:	0ad72623          	sw	a3,172(a4)
8000be60:	00078513          	mv	a0,a5
8000be64:	00008067          	ret
8000be68:	0357c683          	lbu	a3,53(a5)
8000be6c:	0016f713          	andi	a4,a3,1
8000be70:	02070e63          	beqz	a4,8000beac <ip4_route+0x90>
8000be74:	0026d713          	srli	a4,a3,0x2
8000be78:	00177713          	andi	a4,a4,1
8000be7c:	02070863          	beqz	a4,8000beac <ip4_route+0x90>
8000be80:	0047a703          	lw	a4,4(a5)
8000be84:	02070463          	beqz	a4,8000beac <ip4_route+0x90>
8000be88:	00052603          	lw	a2,0(a0)
8000be8c:	0087a583          	lw	a1,8(a5)
8000be90:	00c74733          	xor	a4,a4,a2
8000be94:	00b77733          	and	a4,a4,a1
8000be98:	fc0704e3          	beqz	a4,8000be60 <ip4_route+0x44>
8000be9c:	0026f693          	andi	a3,a3,2
8000bea0:	00069663          	bnez	a3,8000beac <ip4_route+0x90>
8000bea4:	00c7a703          	lw	a4,12(a5)
8000bea8:	fae60ce3          	beq	a2,a4,8000be60 <ip4_route+0x44>
8000beac:	0007a783          	lw	a5,0(a5)
8000beb0:	f71ff06f          	j	8000be20 <ip4_route+0x4>
8000beb4:	00070793          	mv	a5,a4
8000beb8:	fa9ff06f          	j	8000be60 <ip4_route+0x44>

8000bebc <ip4_input>:
8000bebc:	fd010113          	addi	sp,sp,-48
8000bec0:	02812423          	sw	s0,40(sp)
8000bec4:	03212023          	sw	s2,32(sp)
8000bec8:	02112623          	sw	ra,44(sp)
8000becc:	02912223          	sw	s1,36(sp)
8000bed0:	01312e23          	sw	s3,28(sp)
8000bed4:	01412c23          	sw	s4,24(sp)
8000bed8:	01512a23          	sw	s5,20(sp)
8000bedc:	01612823          	sw	s6,16(sp)
8000bee0:	01712623          	sw	s7,12(sp)
8000bee4:	01812423          	sw	s8,8(sp)
8000bee8:	a0c18913          	addi	s2,gp,-1524 # 8000328c <lwip_stats>
8000beec:	09492783          	lw	a5,148(s2)
8000bef0:	00178793          	addi	a5,a5,1
8000bef4:	08f92a23          	sw	a5,148(s2)
8000bef8:	00452483          	lw	s1,4(a0)
8000befc:	00400793          	li	a5,4
8000bf00:	0004cb03          	lbu	s6,0(s1)
8000bf04:	004b5713          	srli	a4,s6,0x4
8000bf08:	04f70a63          	beq	a4,a5,8000bf5c <ip4_input+0xa0>
8000bf0c:	928fb0ef          	jal	ra,80007034 <pbuf_free>
8000bf10:	0b892783          	lw	a5,184(s2)
8000bf14:	00178793          	addi	a5,a5,1
8000bf18:	0af92c23          	sw	a5,184(s2)
8000bf1c:	09c92783          	lw	a5,156(s2)
8000bf20:	00178793          	addi	a5,a5,1
8000bf24:	08f92e23          	sw	a5,156(s2)
8000bf28:	02c12083          	lw	ra,44(sp)
8000bf2c:	02812403          	lw	s0,40(sp)
8000bf30:	02412483          	lw	s1,36(sp)
8000bf34:	02012903          	lw	s2,32(sp)
8000bf38:	01c12983          	lw	s3,28(sp)
8000bf3c:	01812a03          	lw	s4,24(sp)
8000bf40:	01412a83          	lw	s5,20(sp)
8000bf44:	01012b03          	lw	s6,16(sp)
8000bf48:	00c12b83          	lw	s7,12(sp)
8000bf4c:	00812c03          	lw	s8,8(sp)
8000bf50:	00000513          	li	a0,0
8000bf54:	03010113          	addi	sp,sp,48
8000bf58:	00008067          	ret
8000bf5c:	0034c783          	lbu	a5,3(s1)
8000bf60:	00050993          	mv	s3,a0
8000bf64:	0024c503          	lbu	a0,2(s1)
8000bf68:	00879793          	slli	a5,a5,0x8
8000bf6c:	00058a93          	mv	s5,a1
8000bf70:	00a7e533          	or	a0,a5,a0
8000bf74:	e9df90ef          	jal	ra,80005e10 <lwip_htons>
8000bf78:	00fb7b13          	andi	s6,s6,15
8000bf7c:	0089d783          	lhu	a5,8(s3)
8000bf80:	002b1b13          	slli	s6,s6,0x2
8000bf84:	010b1913          	slli	s2,s6,0x10
8000bf88:	a0c18413          	addi	s0,gp,-1524 # 8000328c <lwip_stats>
8000bf8c:	01095913          	srli	s2,s2,0x10
8000bf90:	00050a13          	mv	s4,a0
8000bf94:	00f57863          	bgeu	a0,a5,8000bfa4 <ip4_input+0xe8>
8000bf98:	00050593          	mv	a1,a0
8000bf9c:	00098513          	mv	a0,s3
8000bfa0:	b38fb0ef          	jal	ra,800072d8 <pbuf_realloc>
8000bfa4:	00a9d783          	lhu	a5,10(s3)
8000bfa8:	0127ea63          	bltu	a5,s2,8000bfbc <ip4_input+0x100>
8000bfac:	0089d783          	lhu	a5,8(s3)
8000bfb0:	0147e663          	bltu	a5,s4,8000bfbc <ip4_input+0x100>
8000bfb4:	01300793          	li	a5,19
8000bfb8:	0327e463          	bltu	a5,s2,8000bfe0 <ip4_input+0x124>
8000bfbc:	00098513          	mv	a0,s3
8000bfc0:	874fb0ef          	jal	ra,80007034 <pbuf_free>
8000bfc4:	0a442783          	lw	a5,164(s0)
8000bfc8:	00178793          	addi	a5,a5,1
8000bfcc:	0af42223          	sw	a5,164(s0)
8000bfd0:	09c42783          	lw	a5,156(s0)
8000bfd4:	00178793          	addi	a5,a5,1
8000bfd8:	08f42e23          	sw	a5,156(s0)
8000bfdc:	f4dff06f          	j	8000bf28 <ip4_input+0x6c>
8000bfe0:	00090593          	mv	a1,s2
8000bfe4:	00048513          	mv	a0,s1
8000bfe8:	c1cfa0ef          	jal	ra,80006404 <inet_chksum>
8000bfec:	00050e63          	beqz	a0,8000c008 <ip4_input+0x14c>
8000bff0:	00098513          	mv	a0,s3
8000bff4:	840fb0ef          	jal	ra,80007034 <pbuf_free>
8000bff8:	0a042783          	lw	a5,160(s0)
8000bffc:	00178793          	addi	a5,a5,1
8000c000:	0af42023          	sw	a5,160(s0)
8000c004:	fcdff06f          	j	8000bfd0 <ip4_input+0x114>
8000c008:	0114c703          	lbu	a4,17(s1)
8000c00c:	0104c783          	lbu	a5,16(s1)
8000c010:	00871713          	slli	a4,a4,0x8
8000c014:	00f76733          	or	a4,a4,a5
8000c018:	0124c783          	lbu	a5,18(s1)
8000c01c:	9f418613          	addi	a2,gp,-1548 # 80003274 <ip_data>
8000c020:	9f418913          	addi	s2,gp,-1548 # 80003274 <ip_data>
8000c024:	01079793          	slli	a5,a5,0x10
8000c028:	00e7e733          	or	a4,a5,a4
8000c02c:	0134c783          	lbu	a5,19(s1)
8000c030:	01879793          	slli	a5,a5,0x18
8000c034:	00e7e7b3          	or	a5,a5,a4
8000c038:	00f62a23          	sw	a5,20(a2)
8000c03c:	00d4c683          	lbu	a3,13(s1)
8000c040:	00c4c703          	lbu	a4,12(s1)
8000c044:	0f07f793          	andi	a5,a5,240
8000c048:	00869693          	slli	a3,a3,0x8
8000c04c:	00e6e6b3          	or	a3,a3,a4
8000c050:	00e4c703          	lbu	a4,14(s1)
8000c054:	01071713          	slli	a4,a4,0x10
8000c058:	00d766b3          	or	a3,a4,a3
8000c05c:	00f4c703          	lbu	a4,15(s1)
8000c060:	01871713          	slli	a4,a4,0x18
8000c064:	00d76733          	or	a4,a4,a3
8000c068:	00e62823          	sw	a4,16(a2)
8000c06c:	0e000713          	li	a4,224
8000c070:	06e79063          	bne	a5,a4,8000c0d0 <ip4_input+0x214>
8000c074:	035ac783          	lbu	a5,53(s5)
8000c078:	0017f793          	andi	a5,a5,1
8000c07c:	00079c63          	bnez	a5,8000c094 <ip4_input+0x1d8>
8000c080:	0094c703          	lbu	a4,9(s1)
8000c084:	01100793          	li	a5,17
8000c088:	08f70663          	beq	a4,a5,8000c114 <ip4_input+0x258>
8000c08c:	00000a13          	li	s4,0
8000c090:	0100006f          	j	8000c0a0 <ip4_input+0x1e4>
8000c094:	004aa783          	lw	a5,4(s5)
8000c098:	fe0784e3          	beqz	a5,8000c080 <ip4_input+0x1c4>
8000c09c:	000a8a13          	mv	s4,s5
8000c0a0:	01092503          	lw	a0,16(s2)
8000c0a4:	08050a63          	beqz	a0,8000c138 <ip4_input+0x27c>
8000c0a8:	000a8593          	mv	a1,s5
8000c0ac:	534000ef          	jal	ra,8000c5e0 <ip4_addr_isbroadcast_u32>
8000c0b0:	00051a63          	bnez	a0,8000c0c4 <ip4_input+0x208>
8000c0b4:	01092783          	lw	a5,16(s2)
8000c0b8:	0e000713          	li	a4,224
8000c0bc:	0f07f793          	andi	a5,a5,240
8000c0c0:	06e79c63          	bne	a5,a4,8000c138 <ip4_input+0x27c>
8000c0c4:	00098513          	mv	a0,s3
8000c0c8:	f6dfa0ef          	jal	ra,80007034 <pbuf_free>
8000c0cc:	f05ff06f          	j	8000bfd0 <ip4_input+0x114>
8000c0d0:	000a8513          	mv	a0,s5
8000c0d4:	cf5ff0ef          	jal	ra,8000bdc8 <ip4_input_accept>
8000c0d8:	02051a63          	bnez	a0,8000c10c <ip4_input+0x250>
8000c0dc:	01494703          	lbu	a4,20(s2)
8000c0e0:	07f00793          	li	a5,127
8000c0e4:	f8f70ee3          	beq	a4,a5,8000c080 <ip4_input+0x1c4>
8000c0e8:	8d41aa03          	lw	s4,-1836(gp) # 80003154 <netif_list>
8000c0ec:	f80a0ae3          	beqz	s4,8000c080 <ip4_input+0x1c4>
8000c0f0:	015a1663          	bne	s4,s5,8000c0fc <ip4_input+0x240>
8000c0f4:	000a2a03          	lw	s4,0(s4)
8000c0f8:	ff5ff06f          	j	8000c0ec <ip4_input+0x230>
8000c0fc:	000a0513          	mv	a0,s4
8000c100:	cc9ff0ef          	jal	ra,8000bdc8 <ip4_input_accept>
8000c104:	fe0508e3          	beqz	a0,8000c0f4 <ip4_input+0x238>
8000c108:	f99ff06f          	j	8000c0a0 <ip4_input+0x1e4>
8000c10c:	f80a98e3          	bnez	s5,8000c09c <ip4_input+0x1e0>
8000c110:	f71ff06f          	j	8000c080 <ip4_input+0x1c4>
8000c114:	01648733          	add	a4,s1,s6
8000c118:	00374783          	lbu	a5,3(a4)
8000c11c:	00274683          	lbu	a3,2(a4)
8000c120:	00004737          	lui	a4,0x4
8000c124:	00879793          	slli	a5,a5,0x8
8000c128:	00d7e7b3          	or	a5,a5,a3
8000c12c:	40070713          	addi	a4,a4,1024 # 4400 <_stack_size+0x3c00>
8000c130:	f4e79ee3          	bne	a5,a4,8000c08c <ip4_input+0x1d0>
8000c134:	000a8a13          	mv	s4,s5
8000c138:	000a1e63          	bnez	s4,8000c154 <ip4_input+0x298>
8000c13c:	09c42783          	lw	a5,156(s0)
8000c140:	00098513          	mv	a0,s3
8000c144:	00178793          	addi	a5,a5,1
8000c148:	08f42e23          	sw	a5,156(s0)
8000c14c:	ee9fa0ef          	jal	ra,80007034 <pbuf_free>
8000c150:	dd9ff06f          	j	8000bf28 <ip4_input+0x6c>
8000c154:	0064c783          	lbu	a5,6(s1)
8000c158:	0074c703          	lbu	a4,7(s1)
8000c15c:	03f7f793          	andi	a5,a5,63
8000c160:	00871713          	slli	a4,a4,0x8
8000c164:	00e7e7b3          	or	a5,a5,a4
8000c168:	00078e63          	beqz	a5,8000c184 <ip4_input+0x2c8>
8000c16c:	00098513          	mv	a0,s3
8000c170:	ec5fa0ef          	jal	ra,80007034 <pbuf_free>
8000c174:	0b442783          	lw	a5,180(s0)
8000c178:	00178793          	addi	a5,a5,1
8000c17c:	0af42a23          	sw	a5,180(s0)
8000c180:	e51ff06f          	j	8000bfd0 <ip4_input+0x114>
8000c184:	01492023          	sw	s4,0(s2)
8000c188:	01592223          	sw	s5,4(s2)
8000c18c:	00992423          	sw	s1,8(s2)
8000c190:	0004c783          	lbu	a5,0(s1)
8000c194:	000a8593          	mv	a1,s5
8000c198:	00098513          	mv	a0,s3
8000c19c:	00f7f793          	andi	a5,a5,15
8000c1a0:	00279793          	slli	a5,a5,0x2
8000c1a4:	00f91623          	sh	a5,12(s2)
8000c1a8:	00100c13          	li	s8,1
8000c1ac:	a7dfb0ef          	jal	ra,80007c28 <raw_input>
8000c1b0:	00050b93          	mv	s7,a0
8000c1b4:	03850663          	beq	a0,s8,8000c1e0 <ip4_input+0x324>
8000c1b8:	000b0593          	mv	a1,s6
8000c1bc:	00098513          	mv	a0,s3
8000c1c0:	dedfa0ef          	jal	ra,80006fac <pbuf_remove_header>
8000c1c4:	0094c783          	lbu	a5,9(s1)
8000c1c8:	03878a63          	beq	a5,s8,8000c1fc <ip4_input+0x340>
8000c1cc:	01100713          	li	a4,17
8000c1d0:	02e79e63          	bne	a5,a4,8000c20c <ip4_input+0x350>
8000c1d4:	000a8593          	mv	a1,s5
8000c1d8:	00098513          	mv	a0,s3
8000c1dc:	a40fc0ef          	jal	ra,8000841c <udp_input>
8000c1e0:	00092023          	sw	zero,0(s2)
8000c1e4:	00092223          	sw	zero,4(s2)
8000c1e8:	00092423          	sw	zero,8(s2)
8000c1ec:	00091623          	sh	zero,12(s2)
8000c1f0:	00092823          	sw	zero,16(s2)
8000c1f4:	00092a23          	sw	zero,20(s2)
8000c1f8:	d31ff06f          	j	8000bf28 <ip4_input+0x6c>
8000c1fc:	000a8593          	mv	a1,s5
8000c200:	00098513          	mv	a0,s3
8000c204:	c18ff0ef          	jal	ra,8000b61c <icmp_input>
8000c208:	fd9ff06f          	j	8000c1e0 <ip4_input+0x324>
8000c20c:	00200793          	li	a5,2
8000c210:	04fb8a63          	beq	s7,a5,8000c264 <ip4_input+0x3a8>
8000c214:	01492503          	lw	a0,20(s2)
8000c218:	000a0593          	mv	a1,s4
8000c21c:	3c4000ef          	jal	ra,8000c5e0 <ip4_addr_isbroadcast_u32>
8000c220:	02051663          	bnez	a0,8000c24c <ip4_input+0x390>
8000c224:	01492783          	lw	a5,20(s2)
8000c228:	0e000713          	li	a4,224
8000c22c:	0f07f793          	andi	a5,a5,240
8000c230:	00e78e63          	beq	a5,a4,8000c24c <ip4_input+0x390>
8000c234:	000b0593          	mv	a1,s6
8000c238:	00098513          	mv	a0,s3
8000c23c:	de5fa0ef          	jal	ra,80007020 <pbuf_header_force>
8000c240:	00200593          	li	a1,2
8000c244:	00098513          	mv	a0,s3
8000c248:	ef8ff0ef          	jal	ra,8000b940 <icmp_dest_unreach>
8000c24c:	0b042783          	lw	a5,176(s0)
8000c250:	00178793          	addi	a5,a5,1
8000c254:	0af42823          	sw	a5,176(s0)
8000c258:	09c42783          	lw	a5,156(s0)
8000c25c:	00178793          	addi	a5,a5,1
8000c260:	08f42e23          	sw	a5,156(s0)
8000c264:	00098513          	mv	a0,s3
8000c268:	dcdfa0ef          	jal	ra,80007034 <pbuf_free>
8000c26c:	f75ff06f          	j	8000c1e0 <ip4_input+0x324>

8000c270 <ip4_output_if_src>:
8000c270:	fc010113          	addi	sp,sp,-64
8000c274:	03212823          	sw	s2,48(sp)
8000c278:	03412423          	sw	s4,40(sp)
8000c27c:	03512223          	sw	s5,36(sp)
8000c280:	02112e23          	sw	ra,60(sp)
8000c284:	02812c23          	sw	s0,56(sp)
8000c288:	02912a23          	sw	s1,52(sp)
8000c28c:	03312623          	sw	s3,44(sp)
8000c290:	03612023          	sw	s6,32(sp)
8000c294:	00d12623          	sw	a3,12(sp)
8000c298:	00f12423          	sw	a5,8(sp)
8000c29c:	00c12223          	sw	a2,4(sp)
8000c2a0:	00050913          	mv	s2,a0
8000c2a4:	00080a13          	mv	s4,a6
8000c2a8:	a0c18a93          	addi	s5,gp,-1524 # 8000328c <lwip_stats>
8000c2ac:	1a060863          	beqz	a2,8000c45c <ip4_output_if_src+0x1ec>
8000c2b0:	00058993          	mv	s3,a1
8000c2b4:	01400593          	li	a1,20
8000c2b8:	00070493          	mv	s1,a4
8000c2bc:	ce1fa0ef          	jal	ra,80006f9c <pbuf_add_header>
8000c2c0:	00412603          	lw	a2,4(sp)
8000c2c4:	00812783          	lw	a5,8(sp)
8000c2c8:	00c12683          	lw	a3,12(sp)
8000c2cc:	02050e63          	beqz	a0,8000c308 <ip4_output_if_src+0x98>
8000c2d0:	0b8aa783          	lw	a5,184(s5)
8000c2d4:	ffe00513          	li	a0,-2
8000c2d8:	00178793          	addi	a5,a5,1
8000c2dc:	0afaac23          	sw	a5,184(s5)
8000c2e0:	03c12083          	lw	ra,60(sp)
8000c2e4:	03812403          	lw	s0,56(sp)
8000c2e8:	03412483          	lw	s1,52(sp)
8000c2ec:	03012903          	lw	s2,48(sp)
8000c2f0:	02c12983          	lw	s3,44(sp)
8000c2f4:	02812a03          	lw	s4,40(sp)
8000c2f8:	02412a83          	lw	s5,36(sp)
8000c2fc:	02012b03          	lw	s6,32(sp)
8000c300:	04010113          	addi	sp,sp,64
8000c304:	00008067          	ret
8000c308:	00492403          	lw	s0,4(s2)
8000c30c:	00c12223          	sw	a2,4(sp)
8000c310:	00d40423          	sb	a3,8(s0)
8000c314:	00f404a3          	sb	a5,9(s0)
8000c318:	00869693          	slli	a3,a3,0x8
8000c31c:	00f6e7b3          	or	a5,a3,a5
8000c320:	00062683          	lw	a3,0(a2)
8000c324:	009400a3          	sb	s1,1(s0)
8000c328:	00849493          	slli	s1,s1,0x8
8000c32c:	0086d593          	srli	a1,a3,0x8
8000c330:	00d40823          	sb	a3,16(s0)
8000c334:	00b408a3          	sb	a1,17(s0)
8000c338:	0186d513          	srli	a0,a3,0x18
8000c33c:	0106d593          	srli	a1,a3,0x10
8000c340:	01069693          	slli	a3,a3,0x10
8000c344:	0106d693          	srli	a3,a3,0x10
8000c348:	00b686b3          	add	a3,a3,a1
8000c34c:	00a409a3          	sb	a0,19(s0)
8000c350:	0454e493          	ori	s1,s1,69
8000c354:	04500513          	li	a0,69
8000c358:	00b40923          	sb	a1,18(s0)
8000c35c:	00a40023          	sb	a0,0(s0)
8000c360:	00d484b3          	add	s1,s1,a3
8000c364:	00879693          	slli	a3,a5,0x8
8000c368:	4087d793          	srai	a5,a5,0x8
8000c36c:	00f6e7b3          	or	a5,a3,a5
8000c370:	00895503          	lhu	a0,8(s2)
8000c374:	01079793          	slli	a5,a5,0x10
8000c378:	0107d793          	srli	a5,a5,0x10
8000c37c:	00f484b3          	add	s1,s1,a5
8000c380:	a91f90ef          	jal	ra,80005e10 <lwip_htons>
8000c384:	00855793          	srli	a5,a0,0x8
8000c388:	00a40123          	sb	a0,2(s0)
8000c38c:	009504b3          	add	s1,a0,s1
8000c390:	8f81d503          	lhu	a0,-1800(gp) # 80003178 <ip_id>
8000c394:	00f401a3          	sb	a5,3(s0)
8000c398:	00040323          	sb	zero,6(s0)
8000c39c:	000403a3          	sb	zero,7(s0)
8000c3a0:	a71f90ef          	jal	ra,80005e10 <lwip_htons>
8000c3a4:	00855793          	srli	a5,a0,0x8
8000c3a8:	00f402a3          	sb	a5,5(s0)
8000c3ac:	8f81d783          	lhu	a5,-1800(gp) # 80003178 <ip_id>
8000c3b0:	00a40223          	sb	a0,4(s0)
8000c3b4:	00412603          	lw	a2,4(sp)
8000c3b8:	00178793          	addi	a5,a5,1
8000c3bc:	8ef19c23          	sh	a5,-1800(gp) # 80003178 <ip_id>
8000c3c0:	00950533          	add	a0,a0,s1
8000c3c4:	08099863          	bnez	s3,8000c454 <ip4_output_if_src+0x1e4>
8000c3c8:	8481a703          	lw	a4,-1976(gp) # 800030c8 <ip_addr_any>
8000c3cc:	01875693          	srli	a3,a4,0x18
8000c3d0:	00d407a3          	sb	a3,15(s0)
8000c3d4:	000106b7          	lui	a3,0x10
8000c3d8:	00875793          	srli	a5,a4,0x8
8000c3dc:	fff68693          	addi	a3,a3,-1 # ffff <_stack_size+0xf7ff>
8000c3e0:	00e40623          	sb	a4,12(s0)
8000c3e4:	00f406a3          	sb	a5,13(s0)
8000c3e8:	01075793          	srli	a5,a4,0x10
8000c3ec:	00d77733          	and	a4,a4,a3
8000c3f0:	00a70733          	add	a4,a4,a0
8000c3f4:	00e78733          	add	a4,a5,a4
8000c3f8:	00f40723          	sb	a5,14(s0)
8000c3fc:	01075793          	srli	a5,a4,0x10
8000c400:	00d77733          	and	a4,a4,a3
8000c404:	00e78733          	add	a4,a5,a4
8000c408:	01075793          	srli	a5,a4,0x10
8000c40c:	00e787b3          	add	a5,a5,a4
8000c410:	fff7c793          	not	a5,a5
8000c414:	01079793          	slli	a5,a5,0x10
8000c418:	0107d793          	srli	a5,a5,0x10
8000c41c:	00f40523          	sb	a5,10(s0)
8000c420:	0087d793          	srli	a5,a5,0x8
8000c424:	00f405a3          	sb	a5,11(s0)
8000c428:	090aa783          	lw	a5,144(s5)
8000c42c:	00178793          	addi	a5,a5,1
8000c430:	08faa823          	sw	a5,144(s5)
8000c434:	02ca5783          	lhu	a5,44(s4)
8000c438:	06078463          	beqz	a5,8000c4a0 <ip4_output_if_src+0x230>
8000c43c:	00895703          	lhu	a4,8(s2)
8000c440:	06e7f063          	bgeu	a5,a4,8000c4a0 <ip4_output_if_src+0x230>
8000c444:	000a0593          	mv	a1,s4
8000c448:	00090513          	mv	a0,s2
8000c44c:	e54ff0ef          	jal	ra,8000baa0 <ip4_frag>
8000c450:	e91ff06f          	j	8000c2e0 <ip4_output_if_src+0x70>
8000c454:	0009a703          	lw	a4,0(s3)
8000c458:	f75ff06f          	j	8000c3cc <ip4_output_if_src+0x15c>
8000c45c:	00a55703          	lhu	a4,10(a0)
8000c460:	01300793          	li	a5,19
8000c464:	e6e7f6e3          	bgeu	a5,a4,8000c2d0 <ip4_output_if_src+0x60>
8000c468:	00452683          	lw	a3,4(a0)
8000c46c:	01c10613          	addi	a2,sp,28
8000c470:	0116c703          	lbu	a4,17(a3)
8000c474:	0106c783          	lbu	a5,16(a3)
8000c478:	00871713          	slli	a4,a4,0x8
8000c47c:	00f76733          	or	a4,a4,a5
8000c480:	0126c783          	lbu	a5,18(a3)
8000c484:	01079793          	slli	a5,a5,0x10
8000c488:	00e7e733          	or	a4,a5,a4
8000c48c:	0136c783          	lbu	a5,19(a3)
8000c490:	01879793          	slli	a5,a5,0x18
8000c494:	00e7e7b3          	or	a5,a5,a4
8000c498:	00f12e23          	sw	a5,28(sp)
8000c49c:	f8dff06f          	j	8000c428 <ip4_output_if_src+0x1b8>
8000c4a0:	014a2783          	lw	a5,20(s4)
8000c4a4:	00090593          	mv	a1,s2
8000c4a8:	000a0513          	mv	a0,s4
8000c4ac:	000780e7          	jalr	a5
8000c4b0:	e31ff06f          	j	8000c2e0 <ip4_output_if_src+0x70>

8000c4b4 <ip4_output_if>:
8000c4b4:	00060a63          	beqz	a2,8000c4c8 <ip4_output_if+0x14>
8000c4b8:	00058663          	beqz	a1,8000c4c4 <ip4_output_if+0x10>
8000c4bc:	0005a883          	lw	a7,0(a1)
8000c4c0:	00089463          	bnez	a7,8000c4c8 <ip4_output_if+0x14>
8000c4c4:	00480593          	addi	a1,a6,4
8000c4c8:	da9ff06f          	j	8000c270 <ip4_output_if_src>

8000c4cc <ip4_output>:
8000c4cc:	fd010113          	addi	sp,sp,-48
8000c4d0:	02812423          	sw	s0,40(sp)
8000c4d4:	00050413          	mv	s0,a0
8000c4d8:	00060513          	mv	a0,a2
8000c4dc:	00b12e23          	sw	a1,28(sp)
8000c4e0:	00d12c23          	sw	a3,24(sp)
8000c4e4:	00e12a23          	sw	a4,20(sp)
8000c4e8:	00f12823          	sw	a5,16(sp)
8000c4ec:	00c12623          	sw	a2,12(sp)
8000c4f0:	02112623          	sw	ra,44(sp)
8000c4f4:	929ff0ef          	jal	ra,8000be1c <ip4_route>
8000c4f8:	00c12603          	lw	a2,12(sp)
8000c4fc:	01012783          	lw	a5,16(sp)
8000c500:	01412703          	lw	a4,20(sp)
8000c504:	01812683          	lw	a3,24(sp)
8000c508:	01c12583          	lw	a1,28(sp)
8000c50c:	00050e63          	beqz	a0,8000c528 <ip4_output+0x5c>
8000c510:	00050813          	mv	a6,a0
8000c514:	00040513          	mv	a0,s0
8000c518:	02812403          	lw	s0,40(sp)
8000c51c:	02c12083          	lw	ra,44(sp)
8000c520:	03010113          	addi	sp,sp,48
8000c524:	f91ff06f          	j	8000c4b4 <ip4_output_if>
8000c528:	a0c18793          	addi	a5,gp,-1524 # 8000328c <lwip_stats>
8000c52c:	0ac7a703          	lw	a4,172(a5)
8000c530:	ffc00513          	li	a0,-4
8000c534:	00170713          	addi	a4,a4,1
8000c538:	0ae7a623          	sw	a4,172(a5)
8000c53c:	02c12083          	lw	ra,44(sp)
8000c540:	02812403          	lw	s0,40(sp)
8000c544:	03010113          	addi	sp,sp,48
8000c548:	00008067          	ret

8000c54c <ip4_output_hinted>:
8000c54c:	fd010113          	addi	sp,sp,-48
8000c550:	02912223          	sw	s1,36(sp)
8000c554:	00050493          	mv	s1,a0
8000c558:	00060513          	mv	a0,a2
8000c55c:	00b12e23          	sw	a1,28(sp)
8000c560:	00d12c23          	sw	a3,24(sp)
8000c564:	00e12a23          	sw	a4,20(sp)
8000c568:	00f12823          	sw	a5,16(sp)
8000c56c:	01012623          	sw	a6,12(sp)
8000c570:	00c12423          	sw	a2,8(sp)
8000c574:	02112623          	sw	ra,44(sp)
8000c578:	02812423          	sw	s0,40(sp)
8000c57c:	8a1ff0ef          	jal	ra,8000be1c <ip4_route>
8000c580:	00812603          	lw	a2,8(sp)
8000c584:	00c12803          	lw	a6,12(sp)
8000c588:	01012783          	lw	a5,16(sp)
8000c58c:	01412703          	lw	a4,20(sp)
8000c590:	01812683          	lw	a3,24(sp)
8000c594:	01c12583          	lw	a1,28(sp)
8000c598:	02051663          	bnez	a0,8000c5c4 <ip4_output_hinted+0x78>
8000c59c:	a0c18793          	addi	a5,gp,-1524 # 8000328c <lwip_stats>
8000c5a0:	0ac7a703          	lw	a4,172(a5)
8000c5a4:	ffc00513          	li	a0,-4
8000c5a8:	00170713          	addi	a4,a4,1
8000c5ac:	0ae7a623          	sw	a4,172(a5)
8000c5b0:	02c12083          	lw	ra,44(sp)
8000c5b4:	02812403          	lw	s0,40(sp)
8000c5b8:	02412483          	lw	s1,36(sp)
8000c5bc:	03010113          	addi	sp,sp,48
8000c5c0:	00008067          	ret
8000c5c4:	03052e23          	sw	a6,60(a0)
8000c5c8:	00050413          	mv	s0,a0
8000c5cc:	00050813          	mv	a6,a0
8000c5d0:	00048513          	mv	a0,s1
8000c5d4:	ee1ff0ef          	jal	ra,8000c4b4 <ip4_output_if>
8000c5d8:	02042e23          	sw	zero,60(s0)
8000c5dc:	fd5ff06f          	j	8000c5b0 <ip4_output_hinted+0x64>

8000c5e0 <ip4_addr_isbroadcast_u32>:
8000c5e0:	fff50693          	addi	a3,a0,-1
8000c5e4:	ffd00793          	li	a5,-3
8000c5e8:	00050713          	mv	a4,a0
8000c5ec:	04d7e063          	bltu	a5,a3,8000c62c <ip4_addr_isbroadcast_u32+0x4c>
8000c5f0:	0355c783          	lbu	a5,53(a1)
8000c5f4:	0027f513          	andi	a0,a5,2
8000c5f8:	02050c63          	beqz	a0,8000c630 <ip4_addr_isbroadcast_u32+0x50>
8000c5fc:	0045a783          	lw	a5,4(a1)
8000c600:	00000513          	li	a0,0
8000c604:	02e78663          	beq	a5,a4,8000c630 <ip4_addr_isbroadcast_u32+0x50>
8000c608:	0085a683          	lw	a3,8(a1)
8000c60c:	00e7c7b3          	xor	a5,a5,a4
8000c610:	00d7f7b3          	and	a5,a5,a3
8000c614:	00079e63          	bnez	a5,8000c630 <ip4_addr_isbroadcast_u32+0x50>
8000c618:	fff6c693          	not	a3,a3
8000c61c:	00e6f533          	and	a0,a3,a4
8000c620:	40d50533          	sub	a0,a0,a3
8000c624:	00153513          	seqz	a0,a0
8000c628:	00008067          	ret
8000c62c:	00100513          	li	a0,1
8000c630:	00008067          	ret

8000c634 <ip4_addr_netmask_valid>:
8000c634:	ff010113          	addi	sp,sp,-16
8000c638:	00112623          	sw	ra,12(sp)
8000c63c:	fecf90ef          	jal	ra,80005e28 <lwip_htonl>
8000c640:	02000713          	li	a4,32
8000c644:	800007b7          	lui	a5,0x80000
8000c648:	00f576b3          	and	a3,a0,a5
8000c64c:	02068663          	beqz	a3,8000c678 <ip4_addr_netmask_valid+0x44>
8000c650:	fff70713          	addi	a4,a4,-1
8000c654:	0017d793          	srli	a5,a5,0x1
8000c658:	fe0718e3          	bnez	a4,8000c648 <ip4_addr_netmask_valid+0x14>
8000c65c:	00100513          	li	a0,1
8000c660:	00c12083          	lw	ra,12(sp)
8000c664:	01010113          	addi	sp,sp,16
8000c668:	00008067          	ret
8000c66c:	00a7f733          	and	a4,a5,a0
8000c670:	00071863          	bnez	a4,8000c680 <ip4_addr_netmask_valid+0x4c>
8000c674:	0017d793          	srli	a5,a5,0x1
8000c678:	fe079ae3          	bnez	a5,8000c66c <ip4_addr_netmask_valid+0x38>
8000c67c:	fe1ff06f          	j	8000c65c <ip4_addr_netmask_valid+0x28>
8000c680:	00000513          	li	a0,0
8000c684:	fddff06f          	j	8000c660 <ip4_addr_netmask_valid+0x2c>

8000c688 <ip4addr_aton>:
8000c688:	fb010113          	addi	sp,sp,-80
8000c68c:	04812423          	sw	s0,72(sp)
8000c690:	05212023          	sw	s2,64(sp)
8000c694:	03312e23          	sw	s3,60(sp)
8000c698:	03512a23          	sw	s5,52(sp)
8000c69c:	03712623          	sw	s7,44(sp)
8000c6a0:	03812423          	sw	s8,40(sp)
8000c6a4:	03912223          	sw	s9,36(sp)
8000c6a8:	03a12023          	sw	s10,32(sp)
8000c6ac:	01b12e23          	sw	s11,28(sp)
8000c6b0:	04112623          	sw	ra,76(sp)
8000c6b4:	04912223          	sw	s1,68(sp)
8000c6b8:	03412c23          	sw	s4,56(sp)
8000c6bc:	03612823          	sw	s6,48(sp)
8000c6c0:	00054483          	lbu	s1,0(a0)
8000c6c4:	00010913          	mv	s2,sp
8000c6c8:	80003ab7          	lui	s5,0x80003
8000c6cc:	00058993          	mv	s3,a1
8000c6d0:	00090b93          	mv	s7,s2
8000c6d4:	d55a8a93          	addi	s5,s5,-683 # 80002d55 <_ram_heap_end+0xffff0d55>
8000c6d8:	03000413          	li	s0,48
8000c6dc:	05800c13          	li	s8,88
8000c6e0:	01000c93          	li	s9,16
8000c6e4:	00200d13          	li	s10,2
8000c6e8:	02e00d93          	li	s11,46
8000c6ec:	00c10713          	addi	a4,sp,12
8000c6f0:	015487b3          	add	a5,s1,s5
8000c6f4:	0007c783          	lbu	a5,0(a5) # 80000000 <_ram_heap_end+0xfffee000>
8000c6f8:	0047f793          	andi	a5,a5,4
8000c6fc:	1c078a63          	beqz	a5,8000c8d0 <ip4addr_aton+0x248>
8000c700:	00a00b13          	li	s6,10
8000c704:	00849c63          	bne	s1,s0,8000c71c <ip4addr_aton+0x94>
8000c708:	00154483          	lbu	s1,1(a0)
8000c70c:	0df4f793          	andi	a5,s1,223
8000c710:	05878463          	beq	a5,s8,8000c758 <ip4addr_aton+0xd0>
8000c714:	00150513          	addi	a0,a0,1
8000c718:	00800b13          	li	s6,8
8000c71c:	00050a13          	mv	s4,a0
8000c720:	00000513          	li	a0,0
8000c724:	009a87b3          	add	a5,s5,s1
8000c728:	0007c783          	lbu	a5,0(a5)
8000c72c:	0047f693          	andi	a3,a5,4
8000c730:	02068c63          	beqz	a3,8000c768 <ip4addr_aton+0xe0>
8000c734:	00050593          	mv	a1,a0
8000c738:	000b0513          	mv	a0,s6
8000c73c:	441000ef          	jal	ra,8000d37c <__mulsi3>
8000c740:	00950533          	add	a0,a0,s1
8000c744:	001a4483          	lbu	s1,1(s4)
8000c748:	fd050513          	addi	a0,a0,-48
8000c74c:	00c10713          	addi	a4,sp,12
8000c750:	001a0a13          	addi	s4,s4,1
8000c754:	fd1ff06f          	j	8000c724 <ip4addr_aton+0x9c>
8000c758:	00254483          	lbu	s1,2(a0)
8000c75c:	01000b13          	li	s6,16
8000c760:	00250513          	addi	a0,a0,2
8000c764:	fb9ff06f          	j	8000c71c <ip4addr_aton+0x94>
8000c768:	039b1a63          	bne	s6,s9,8000c79c <ip4addr_aton+0x114>
8000c76c:	0447f693          	andi	a3,a5,68
8000c770:	02068663          	beqz	a3,8000c79c <ip4addr_aton+0x114>
8000c774:	0037f793          	andi	a5,a5,3
8000c778:	00451513          	slli	a0,a0,0x4
8000c77c:	00a48493          	addi	s1,s1,10
8000c780:	06100593          	li	a1,97
8000c784:	01a78463          	beq	a5,s10,8000c78c <ip4addr_aton+0x104>
8000c788:	04100593          	li	a1,65
8000c78c:	40b484b3          	sub	s1,s1,a1
8000c790:	00a4e533          	or	a0,s1,a0
8000c794:	001a4483          	lbu	s1,1(s4)
8000c798:	fb9ff06f          	j	8000c750 <ip4addr_aton+0xc8>
8000c79c:	01b49e63          	bne	s1,s11,8000c7b8 <ip4addr_aton+0x130>
8000c7a0:	12e90863          	beq	s2,a4,8000c8d0 <ip4addr_aton+0x248>
8000c7a4:	00490913          	addi	s2,s2,4
8000c7a8:	fea92e23          	sw	a0,-4(s2)
8000c7ac:	001a4483          	lbu	s1,1(s4)
8000c7b0:	001a0513          	addi	a0,s4,1
8000c7b4:	f3dff06f          	j	8000c6f0 <ip4addr_aton+0x68>
8000c7b8:	00048863          	beqz	s1,8000c7c8 <ip4addr_aton+0x140>
8000c7bc:	0087f793          	andi	a5,a5,8
8000c7c0:	00000413          	li	s0,0
8000c7c4:	02078863          	beqz	a5,8000c7f4 <ip4addr_aton+0x16c>
8000c7c8:	41790433          	sub	s0,s2,s7
8000c7cc:	40245413          	srai	s0,s0,0x2
8000c7d0:	00140413          	addi	s0,s0,1
8000c7d4:	00200793          	li	a5,2
8000c7d8:	0af40263          	beq	s0,a5,8000c87c <ip4addr_aton+0x1f4>
8000c7dc:	0487cc63          	blt	a5,s0,8000c834 <ip4addr_aton+0x1ac>
8000c7e0:	00040a63          	beqz	s0,8000c7f4 <ip4addr_aton+0x16c>
8000c7e4:	00100413          	li	s0,1
8000c7e8:	00098663          	beqz	s3,8000c7f4 <ip4addr_aton+0x16c>
8000c7ec:	e3cf90ef          	jal	ra,80005e28 <lwip_htonl>
8000c7f0:	00a9a023          	sw	a0,0(s3)
8000c7f4:	00040513          	mv	a0,s0
8000c7f8:	04c12083          	lw	ra,76(sp)
8000c7fc:	04812403          	lw	s0,72(sp)
8000c800:	04412483          	lw	s1,68(sp)
8000c804:	04012903          	lw	s2,64(sp)
8000c808:	03c12983          	lw	s3,60(sp)
8000c80c:	03812a03          	lw	s4,56(sp)
8000c810:	03412a83          	lw	s5,52(sp)
8000c814:	03012b03          	lw	s6,48(sp)
8000c818:	02c12b83          	lw	s7,44(sp)
8000c81c:	02812c03          	lw	s8,40(sp)
8000c820:	02412c83          	lw	s9,36(sp)
8000c824:	02012d03          	lw	s10,32(sp)
8000c828:	01c12d83          	lw	s11,28(sp)
8000c82c:	05010113          	addi	sp,sp,80
8000c830:	00008067          	ret
8000c834:	00300793          	li	a5,3
8000c838:	06f40463          	beq	s0,a5,8000c8a0 <ip4addr_aton+0x218>
8000c83c:	00400793          	li	a5,4
8000c840:	faf412e3          	bne	s0,a5,8000c7e4 <ip4addr_aton+0x15c>
8000c844:	0ff00613          	li	a2,255
8000c848:	00000413          	li	s0,0
8000c84c:	faa664e3          	bltu	a2,a0,8000c7f4 <ip4addr_aton+0x16c>
8000c850:	00012783          	lw	a5,0(sp)
8000c854:	faf660e3          	bltu	a2,a5,8000c7f4 <ip4addr_aton+0x16c>
8000c858:	00412683          	lw	a3,4(sp)
8000c85c:	f8d66ce3          	bltu	a2,a3,8000c7f4 <ip4addr_aton+0x16c>
8000c860:	00812703          	lw	a4,8(sp)
8000c864:	f8e668e3          	bltu	a2,a4,8000c7f4 <ip4addr_aton+0x16c>
8000c868:	01879793          	slli	a5,a5,0x18
8000c86c:	01069693          	slli	a3,a3,0x10
8000c870:	00d7e7b3          	or	a5,a5,a3
8000c874:	00871713          	slli	a4,a4,0x8
8000c878:	0500006f          	j	8000c8c8 <ip4addr_aton+0x240>
8000c87c:	010007b7          	lui	a5,0x1000
8000c880:	00000413          	li	s0,0
8000c884:	f6f578e3          	bgeu	a0,a5,8000c7f4 <ip4addr_aton+0x16c>
8000c888:	00012783          	lw	a5,0(sp)
8000c88c:	0ff00713          	li	a4,255
8000c890:	f6f762e3          	bltu	a4,a5,8000c7f4 <ip4addr_aton+0x16c>
8000c894:	01879793          	slli	a5,a5,0x18
8000c898:	00f56533          	or	a0,a0,a5
8000c89c:	f49ff06f          	j	8000c7e4 <ip4addr_aton+0x15c>
8000c8a0:	000107b7          	lui	a5,0x10
8000c8a4:	00000413          	li	s0,0
8000c8a8:	f4f576e3          	bgeu	a0,a5,8000c7f4 <ip4addr_aton+0x16c>
8000c8ac:	00012783          	lw	a5,0(sp)
8000c8b0:	0ff00693          	li	a3,255
8000c8b4:	f4f6e0e3          	bltu	a3,a5,8000c7f4 <ip4addr_aton+0x16c>
8000c8b8:	00412703          	lw	a4,4(sp)
8000c8bc:	f2e6ece3          	bltu	a3,a4,8000c7f4 <ip4addr_aton+0x16c>
8000c8c0:	01879793          	slli	a5,a5,0x18
8000c8c4:	01071713          	slli	a4,a4,0x10
8000c8c8:	00e7e7b3          	or	a5,a5,a4
8000c8cc:	fcdff06f          	j	8000c898 <ip4addr_aton+0x210>
8000c8d0:	00000413          	li	s0,0
8000c8d4:	f21ff06f          	j	8000c7f4 <ip4addr_aton+0x16c>

8000c8d8 <ipaddr_addr>:
8000c8d8:	fe010113          	addi	sp,sp,-32
8000c8dc:	00c10593          	addi	a1,sp,12
8000c8e0:	00112e23          	sw	ra,28(sp)
8000c8e4:	da5ff0ef          	jal	ra,8000c688 <ip4addr_aton>
8000c8e8:	00050a63          	beqz	a0,8000c8fc <ipaddr_addr+0x24>
8000c8ec:	00c12503          	lw	a0,12(sp)
8000c8f0:	01c12083          	lw	ra,28(sp)
8000c8f4:	02010113          	addi	sp,sp,32
8000c8f8:	00008067          	ret
8000c8fc:	fff00513          	li	a0,-1
8000c900:	ff1ff06f          	j	8000c8f0 <ipaddr_addr+0x18>

8000c904 <ip4addr_ntoa_r>:
8000c904:	fb010113          	addi	sp,sp,-80
8000c908:	04912223          	sw	s1,68(sp)
8000c90c:	05212023          	sw	s2,64(sp)
8000c910:	03312e23          	sw	s3,60(sp)
8000c914:	03612823          	sw	s6,48(sp)
8000c918:	03812423          	sw	s8,40(sp)
8000c91c:	03912223          	sw	s9,36(sp)
8000c920:	03a12023          	sw	s10,32(sp)
8000c924:	04112623          	sw	ra,76(sp)
8000c928:	04812423          	sw	s0,72(sp)
8000c92c:	03412c23          	sw	s4,56(sp)
8000c930:	03512a23          	sw	s5,52(sp)
8000c934:	03712623          	sw	s7,44(sp)
8000c938:	00052783          	lw	a5,0(a0)
8000c93c:	00058493          	mv	s1,a1
8000c940:	00058b13          	mv	s6,a1
8000c944:	00f12e23          	sw	a5,28(sp)
8000c948:	00000993          	li	s3,0
8000c94c:	01c10913          	addi	s2,sp,28
8000c950:	00900c93          	li	s9,9
8000c954:	0ff00d13          	li	s10,255
8000c958:	02e00c13          	li	s8,46
8000c95c:	00094a03          	lbu	s4,0(s2)
8000c960:	00000413          	li	s0,0
8000c964:	00a00593          	li	a1,10
8000c968:	000a0513          	mv	a0,s4
8000c96c:	00c12623          	sw	a2,12(sp)
8000c970:	239000ef          	jal	ra,8000d3a8 <__udivsi3>
8000c974:	0ff57b93          	andi	s7,a0,255
8000c978:	00a00593          	li	a1,10
8000c97c:	000a0513          	mv	a0,s4
8000c980:	271000ef          	jal	ra,8000d3f0 <__umodsi3>
8000c984:	02010793          	addi	a5,sp,32
8000c988:	03050513          	addi	a0,a0,48
8000c98c:	008787b3          	add	a5,a5,s0
8000c990:	00140a93          	addi	s5,s0,1
8000c994:	fea78c23          	sb	a0,-8(a5) # fff8 <_stack_size+0xf7f8>
8000c998:	0ffafa93          	andi	s5,s5,255
8000c99c:	00c12603          	lw	a2,12(sp)
8000c9a0:	074ce863          	bltu	s9,s4,8000ca10 <ip4addr_ntoa_r+0x10c>
8000c9a4:	01790023          	sb	s7,0(s2)
8000c9a8:	00098713          	mv	a4,s3
8000c9ac:	000b0793          	mv	a5,s6
8000c9b0:	00198993          	addi	s3,s3,1
8000c9b4:	07a41463          	bne	s0,s10,8000ca1c <ip4addr_ntoa_r+0x118>
8000c9b8:	08c75863          	bge	a4,a2,8000ca48 <ip4addr_ntoa_r+0x144>
8000c9bc:	01878023          	sb	s8,0(a5)
8000c9c0:	00190913          	addi	s2,s2,1
8000c9c4:	02010713          	addi	a4,sp,32
8000c9c8:	00178b13          	addi	s6,a5,1
8000c9cc:	f8e918e3          	bne	s2,a4,8000c95c <ip4addr_ntoa_r+0x58>
8000c9d0:	00078023          	sb	zero,0(a5)
8000c9d4:	00048513          	mv	a0,s1
8000c9d8:	04c12083          	lw	ra,76(sp)
8000c9dc:	04812403          	lw	s0,72(sp)
8000c9e0:	04412483          	lw	s1,68(sp)
8000c9e4:	04012903          	lw	s2,64(sp)
8000c9e8:	03c12983          	lw	s3,60(sp)
8000c9ec:	03812a03          	lw	s4,56(sp)
8000c9f0:	03412a83          	lw	s5,52(sp)
8000c9f4:	03012b03          	lw	s6,48(sp)
8000c9f8:	02c12b83          	lw	s7,44(sp)
8000c9fc:	02812c03          	lw	s8,40(sp)
8000ca00:	02412c83          	lw	s9,36(sp)
8000ca04:	02012d03          	lw	s10,32(sp)
8000ca08:	05010113          	addi	sp,sp,80
8000ca0c:	00008067          	ret
8000ca10:	000b8a13          	mv	s4,s7
8000ca14:	000a8413          	mv	s0,s5
8000ca18:	f4dff06f          	j	8000c964 <ip4addr_ntoa_r+0x60>
8000ca1c:	fff40693          	addi	a3,s0,-1
8000ca20:	0ff6f693          	andi	a3,a3,255
8000ca24:	02c75263          	bge	a4,a2,8000ca48 <ip4addr_ntoa_r+0x144>
8000ca28:	02010713          	addi	a4,sp,32
8000ca2c:	00870433          	add	s0,a4,s0
8000ca30:	ff844703          	lbu	a4,-8(s0)
8000ca34:	00178793          	addi	a5,a5,1
8000ca38:	00068413          	mv	s0,a3
8000ca3c:	fee78fa3          	sb	a4,-1(a5)
8000ca40:	00098713          	mv	a4,s3
8000ca44:	f6dff06f          	j	8000c9b0 <ip4addr_ntoa_r+0xac>
8000ca48:	00000513          	li	a0,0
8000ca4c:	f8dff06f          	j	8000c9d8 <ip4addr_ntoa_r+0xd4>

8000ca50 <ip4addr_ntoa>:
8000ca50:	01000613          	li	a2,16
8000ca54:	c3c18593          	addi	a1,gp,-964 # 800034bc <str.4106>
8000ca58:	eadff06f          	j	8000c904 <ip4addr_ntoa_r>

8000ca5c <ethernet_input>:
8000ca5c:	ff010113          	addi	sp,sp,-16
8000ca60:	00812423          	sw	s0,8(sp)
8000ca64:	00112623          	sw	ra,12(sp)
8000ca68:	00912223          	sw	s1,4(sp)
8000ca6c:	01212023          	sw	s2,0(sp)
8000ca70:	00a55703          	lhu	a4,10(a0)
8000ca74:	01000793          	li	a5,16
8000ca78:	00050413          	mv	s0,a0
8000ca7c:	00e7ec63          	bltu	a5,a4,8000ca94 <ethernet_input+0x38>
8000ca80:	a0c18793          	addi	a5,gp,-1524 # 8000328c <lwip_stats>
8000ca84:	0507a703          	lw	a4,80(a5)
8000ca88:	00170713          	addi	a4,a4,1
8000ca8c:	04e7a823          	sw	a4,80(a5)
8000ca90:	0a00006f          	j	8000cb30 <ethernet_input+0xd4>
8000ca94:	00f54783          	lbu	a5,15(a0)
8000ca98:	00058913          	mv	s2,a1
8000ca9c:	00079863          	bnez	a5,8000caac <ethernet_input+0x50>
8000caa0:	0385c783          	lbu	a5,56(a1)
8000caa4:	00178793          	addi	a5,a5,1
8000caa8:	00f507a3          	sb	a5,15(a0)
8000caac:	00442503          	lw	a0,4(s0)
8000cab0:	00f54483          	lbu	s1,15(a0)
8000cab4:	00e54783          	lbu	a5,14(a0)
8000cab8:	00849493          	slli	s1,s1,0x8
8000cabc:	00f4e4b3          	or	s1,s1,a5
8000cac0:	00254783          	lbu	a5,2(a0)
8000cac4:	0017f713          	andi	a4,a5,1
8000cac8:	02070663          	beqz	a4,8000caf4 <ethernet_input+0x98>
8000cacc:	00100713          	li	a4,1
8000cad0:	06e79c63          	bne	a5,a4,8000cb48 <ethernet_input+0xec>
8000cad4:	00354783          	lbu	a5,3(a0)
8000cad8:	00079e63          	bnez	a5,8000caf4 <ethernet_input+0x98>
8000cadc:	00454703          	lbu	a4,4(a0)
8000cae0:	05e00793          	li	a5,94
8000cae4:	00f71863          	bne	a4,a5,8000caf4 <ethernet_input+0x98>
8000cae8:	00d44783          	lbu	a5,13(s0)
8000caec:	0107e793          	ori	a5,a5,16
8000caf0:	00f406a3          	sb	a5,13(s0)
8000caf4:	00800793          	li	a5,8
8000caf8:	06f48863          	beq	s1,a5,8000cb68 <ethernet_input+0x10c>
8000cafc:	60800793          	li	a5,1544
8000cb00:	f8f490e3          	bne	s1,a5,8000ca80 <ethernet_input+0x24>
8000cb04:	03594783          	lbu	a5,53(s2)
8000cb08:	0087f793          	andi	a5,a5,8
8000cb0c:	02078863          	beqz	a5,8000cb3c <ethernet_input+0xe0>
8000cb10:	01000593          	li	a1,16
8000cb14:	00040513          	mv	a0,s0
8000cb18:	c94fa0ef          	jal	ra,80006fac <pbuf_remove_header>
8000cb1c:	08050863          	beqz	a0,8000cbac <ethernet_input+0x150>
8000cb20:	a0c18793          	addi	a5,gp,-1524 # 8000328c <lwip_stats>
8000cb24:	0447a703          	lw	a4,68(a5)
8000cb28:	00170713          	addi	a4,a4,1
8000cb2c:	04e7a223          	sw	a4,68(a5)
8000cb30:	03c7a703          	lw	a4,60(a5)
8000cb34:	00170713          	addi	a4,a4,1
8000cb38:	02e7ae23          	sw	a4,60(a5)
8000cb3c:	00040513          	mv	a0,s0
8000cb40:	cf4fa0ef          	jal	ra,80007034 <pbuf_free>
8000cb44:	04c0006f          	j	8000cb90 <ethernet_input+0x134>
8000cb48:	00600613          	li	a2,6
8000cb4c:	85418593          	addi	a1,gp,-1964 # 800030d4 <ethbroadcast>
8000cb50:	00250513          	addi	a0,a0,2
8000cb54:	6a0010ef          	jal	ra,8000e1f4 <memcmp>
8000cb58:	f8051ee3          	bnez	a0,8000caf4 <ethernet_input+0x98>
8000cb5c:	00d44783          	lbu	a5,13(s0)
8000cb60:	0087e793          	ori	a5,a5,8
8000cb64:	f8dff06f          	j	8000caf0 <ethernet_input+0x94>
8000cb68:	03594783          	lbu	a5,53(s2)
8000cb6c:	0087f793          	andi	a5,a5,8
8000cb70:	fc0786e3          	beqz	a5,8000cb3c <ethernet_input+0xe0>
8000cb74:	01000593          	li	a1,16
8000cb78:	00040513          	mv	a0,s0
8000cb7c:	c30fa0ef          	jal	ra,80006fac <pbuf_remove_header>
8000cb80:	fa051ee3          	bnez	a0,8000cb3c <ethernet_input+0xe0>
8000cb84:	00090593          	mv	a1,s2
8000cb88:	00040513          	mv	a0,s0
8000cb8c:	b30ff0ef          	jal	ra,8000bebc <ip4_input>
8000cb90:	00c12083          	lw	ra,12(sp)
8000cb94:	00812403          	lw	s0,8(sp)
8000cb98:	00412483          	lw	s1,4(sp)
8000cb9c:	00012903          	lw	s2,0(sp)
8000cba0:	00000513          	li	a0,0
8000cba4:	01010113          	addi	sp,sp,16
8000cba8:	00008067          	ret
8000cbac:	00090593          	mv	a1,s2
8000cbb0:	00040513          	mv	a0,s0
8000cbb4:	ad8fe0ef          	jal	ra,8000ae8c <etharp_input>
8000cbb8:	fd9ff06f          	j	8000cb90 <ethernet_input+0x134>

8000cbbc <ethernet_output>:
8000cbbc:	fd010113          	addi	sp,sp,-48
8000cbc0:	01312e23          	sw	s3,28(sp)
8000cbc4:	00050993          	mv	s3,a0
8000cbc8:	00070513          	mv	a0,a4
8000cbcc:	00d12623          	sw	a3,12(sp)
8000cbd0:	02112623          	sw	ra,44(sp)
8000cbd4:	02912223          	sw	s1,36(sp)
8000cbd8:	03212023          	sw	s2,32(sp)
8000cbdc:	01412c23          	sw	s4,24(sp)
8000cbe0:	00058913          	mv	s2,a1
8000cbe4:	00060a13          	mv	s4,a2
8000cbe8:	02812423          	sw	s0,40(sp)
8000cbec:	a24f90ef          	jal	ra,80005e10 <lwip_htons>
8000cbf0:	00050493          	mv	s1,a0
8000cbf4:	01000593          	li	a1,16
8000cbf8:	00090513          	mv	a0,s2
8000cbfc:	ba0fa0ef          	jal	ra,80006f9c <pbuf_add_header>
8000cc00:	00c12683          	lw	a3,12(sp)
8000cc04:	06051063          	bnez	a0,8000cc64 <ethernet_output+0xa8>
8000cc08:	00492403          	lw	s0,4(s2)
8000cc0c:	00068593          	mv	a1,a3
8000cc10:	00600613          	li	a2,6
8000cc14:	00940723          	sb	s1,14(s0)
8000cc18:	0084d493          	srli	s1,s1,0x8
8000cc1c:	009407a3          	sb	s1,15(s0)
8000cc20:	00240513          	addi	a0,s0,2
8000cc24:	600010ef          	jal	ra,8000e224 <memcpy>
8000cc28:	000a0593          	mv	a1,s4
8000cc2c:	00840513          	addi	a0,s0,8
8000cc30:	00600613          	li	a2,6
8000cc34:	5f0010ef          	jal	ra,8000e224 <memcpy>
8000cc38:	02812403          	lw	s0,40(sp)
8000cc3c:	0189a303          	lw	t1,24(s3)
8000cc40:	02c12083          	lw	ra,44(sp)
8000cc44:	02412483          	lw	s1,36(sp)
8000cc48:	01812a03          	lw	s4,24(sp)
8000cc4c:	00090593          	mv	a1,s2
8000cc50:	00098513          	mv	a0,s3
8000cc54:	02012903          	lw	s2,32(sp)
8000cc58:	01c12983          	lw	s3,28(sp)
8000cc5c:	03010113          	addi	sp,sp,48
8000cc60:	00030067          	jr	t1
8000cc64:	a0c18793          	addi	a5,gp,-1524 # 8000328c <lwip_stats>
8000cc68:	0147a703          	lw	a4,20(a5)
8000cc6c:	ffe00513          	li	a0,-2
8000cc70:	00170713          	addi	a4,a4,1
8000cc74:	00e7aa23          	sw	a4,20(a5)
8000cc78:	02c12083          	lw	ra,44(sp)
8000cc7c:	02812403          	lw	s0,40(sp)
8000cc80:	02412483          	lw	s1,36(sp)
8000cc84:	02012903          	lw	s2,32(sp)
8000cc88:	01c12983          	lw	s3,28(sp)
8000cc8c:	01812a03          	lw	s4,24(sp)
8000cc90:	03010113          	addi	sp,sp,48
8000cc94:	00008067          	ret

8000cc98 <memset>:
8000cc98:	00f00313          	li	t1,15
8000cc9c:	00050713          	mv	a4,a0
8000cca0:	02c37e63          	bgeu	t1,a2,8000ccdc <memset+0x44>
8000cca4:	00f77793          	andi	a5,a4,15
8000cca8:	0a079063          	bnez	a5,8000cd48 <memset+0xb0>
8000ccac:	08059263          	bnez	a1,8000cd30 <memset+0x98>
8000ccb0:	ff067693          	andi	a3,a2,-16
8000ccb4:	00f67613          	andi	a2,a2,15
8000ccb8:	00e686b3          	add	a3,a3,a4
8000ccbc:	00b72023          	sw	a1,0(a4)
8000ccc0:	00b72223          	sw	a1,4(a4)
8000ccc4:	00b72423          	sw	a1,8(a4)
8000ccc8:	00b72623          	sw	a1,12(a4)
8000cccc:	01070713          	addi	a4,a4,16
8000ccd0:	fed766e3          	bltu	a4,a3,8000ccbc <memset+0x24>
8000ccd4:	00061463          	bnez	a2,8000ccdc <memset+0x44>
8000ccd8:	00008067          	ret
8000ccdc:	40c306b3          	sub	a3,t1,a2
8000cce0:	00269693          	slli	a3,a3,0x2
8000cce4:	00000297          	auipc	t0,0x0
8000cce8:	005686b3          	add	a3,a3,t0
8000ccec:	00c68067          	jr	12(a3)
8000ccf0:	00b70723          	sb	a1,14(a4)
8000ccf4:	00b706a3          	sb	a1,13(a4)
8000ccf8:	00b70623          	sb	a1,12(a4)
8000ccfc:	00b705a3          	sb	a1,11(a4)
8000cd00:	00b70523          	sb	a1,10(a4)
8000cd04:	00b704a3          	sb	a1,9(a4)
8000cd08:	00b70423          	sb	a1,8(a4)
8000cd0c:	00b703a3          	sb	a1,7(a4)
8000cd10:	00b70323          	sb	a1,6(a4)
8000cd14:	00b702a3          	sb	a1,5(a4)
8000cd18:	00b70223          	sb	a1,4(a4)
8000cd1c:	00b701a3          	sb	a1,3(a4)
8000cd20:	00b70123          	sb	a1,2(a4)
8000cd24:	00b700a3          	sb	a1,1(a4)
8000cd28:	00b70023          	sb	a1,0(a4)
8000cd2c:	00008067          	ret
8000cd30:	0ff5f593          	andi	a1,a1,255
8000cd34:	00859693          	slli	a3,a1,0x8
8000cd38:	00d5e5b3          	or	a1,a1,a3
8000cd3c:	01059693          	slli	a3,a1,0x10
8000cd40:	00d5e5b3          	or	a1,a1,a3
8000cd44:	f6dff06f          	j	8000ccb0 <memset+0x18>
8000cd48:	00279693          	slli	a3,a5,0x2
8000cd4c:	00000297          	auipc	t0,0x0
8000cd50:	005686b3          	add	a3,a3,t0
8000cd54:	00008293          	mv	t0,ra
8000cd58:	fa0680e7          	jalr	-96(a3)
8000cd5c:	00028093          	mv	ra,t0
8000cd60:	ff078793          	addi	a5,a5,-16
8000cd64:	40f70733          	sub	a4,a4,a5
8000cd68:	00f60633          	add	a2,a2,a5
8000cd6c:	f6c378e3          	bgeu	t1,a2,8000ccdc <memset+0x44>
8000cd70:	f3dff06f          	j	8000ccac <memset+0x14>

8000cd74 <__bswapsi2>:
8000cd74:	01851713          	slli	a4,a0,0x18
8000cd78:	01855793          	srli	a5,a0,0x18
8000cd7c:	000106b7          	lui	a3,0x10
8000cd80:	00e7e7b3          	or	a5,a5,a4
8000cd84:	f0068693          	addi	a3,a3,-256 # ff00 <_stack_size+0xf700>
8000cd88:	40855713          	srai	a4,a0,0x8
8000cd8c:	00d77733          	and	a4,a4,a3
8000cd90:	00e7e7b3          	or	a5,a5,a4
8000cd94:	00851513          	slli	a0,a0,0x8
8000cd98:	00ff0737          	lui	a4,0xff0
8000cd9c:	00e57533          	and	a0,a0,a4
8000cda0:	00a7e533          	or	a0,a5,a0
8000cda4:	00008067          	ret

8000cda8 <__udivdi3>:
8000cda8:	fd010113          	addi	sp,sp,-48
8000cdac:	02912223          	sw	s1,36(sp)
8000cdb0:	01612823          	sw	s6,16(sp)
8000cdb4:	02112623          	sw	ra,44(sp)
8000cdb8:	02812423          	sw	s0,40(sp)
8000cdbc:	03212023          	sw	s2,32(sp)
8000cdc0:	01312e23          	sw	s3,28(sp)
8000cdc4:	01412c23          	sw	s4,24(sp)
8000cdc8:	01512a23          	sw	s5,20(sp)
8000cdcc:	01712623          	sw	s7,12(sp)
8000cdd0:	01812423          	sw	s8,8(sp)
8000cdd4:	01912223          	sw	s9,4(sp)
8000cdd8:	00050b13          	mv	s6,a0
8000cddc:	00058493          	mv	s1,a1
8000cde0:	38069c63          	bnez	a3,8000d178 <__udivdi3+0x3d0>
8000cde4:	00060413          	mv	s0,a2
8000cde8:	00050993          	mv	s3,a0
8000cdec:	ffff6917          	auipc	s2,0xffff6
8000cdf0:	10890913          	addi	s2,s2,264 # 80002ef4 <__clz_tab>
8000cdf4:	12c5f863          	bgeu	a1,a2,8000cf24 <__udivdi3+0x17c>
8000cdf8:	000107b7          	lui	a5,0x10
8000cdfc:	00058a93          	mv	s5,a1
8000ce00:	10f67863          	bgeu	a2,a5,8000cf10 <__udivdi3+0x168>
8000ce04:	0ff00693          	li	a3,255
8000ce08:	00c6b6b3          	sltu	a3,a3,a2
8000ce0c:	00369693          	slli	a3,a3,0x3
8000ce10:	00d657b3          	srl	a5,a2,a3
8000ce14:	00f90933          	add	s2,s2,a5
8000ce18:	00094703          	lbu	a4,0(s2)
8000ce1c:	00d706b3          	add	a3,a4,a3
8000ce20:	02000713          	li	a4,32
8000ce24:	40d70733          	sub	a4,a4,a3
8000ce28:	00070c63          	beqz	a4,8000ce40 <__udivdi3+0x98>
8000ce2c:	00e494b3          	sll	s1,s1,a4
8000ce30:	00db56b3          	srl	a3,s6,a3
8000ce34:	00e61433          	sll	s0,a2,a4
8000ce38:	0096eab3          	or	s5,a3,s1
8000ce3c:	00eb19b3          	sll	s3,s6,a4
8000ce40:	01045b13          	srli	s6,s0,0x10
8000ce44:	000b0593          	mv	a1,s6
8000ce48:	000a8513          	mv	a0,s5
8000ce4c:	5a4000ef          	jal	ra,8000d3f0 <__umodsi3>
8000ce50:	00050913          	mv	s2,a0
8000ce54:	000b0593          	mv	a1,s6
8000ce58:	01041b93          	slli	s7,s0,0x10
8000ce5c:	000a8513          	mv	a0,s5
8000ce60:	548000ef          	jal	ra,8000d3a8 <__udivsi3>
8000ce64:	010bdb93          	srli	s7,s7,0x10
8000ce68:	00050493          	mv	s1,a0
8000ce6c:	00050593          	mv	a1,a0
8000ce70:	000b8513          	mv	a0,s7
8000ce74:	508000ef          	jal	ra,8000d37c <__mulsi3>
8000ce78:	01091913          	slli	s2,s2,0x10
8000ce7c:	0109d713          	srli	a4,s3,0x10
8000ce80:	00e96733          	or	a4,s2,a4
8000ce84:	00048a13          	mv	s4,s1
8000ce88:	00a77e63          	bgeu	a4,a0,8000cea4 <__udivdi3+0xfc>
8000ce8c:	00870733          	add	a4,a4,s0
8000ce90:	fff48a13          	addi	s4,s1,-1
8000ce94:	00876863          	bltu	a4,s0,8000cea4 <__udivdi3+0xfc>
8000ce98:	00a77663          	bgeu	a4,a0,8000cea4 <__udivdi3+0xfc>
8000ce9c:	ffe48a13          	addi	s4,s1,-2
8000cea0:	00870733          	add	a4,a4,s0
8000cea4:	40a704b3          	sub	s1,a4,a0
8000cea8:	000b0593          	mv	a1,s6
8000ceac:	00048513          	mv	a0,s1
8000ceb0:	540000ef          	jal	ra,8000d3f0 <__umodsi3>
8000ceb4:	00050913          	mv	s2,a0
8000ceb8:	000b0593          	mv	a1,s6
8000cebc:	00048513          	mv	a0,s1
8000cec0:	4e8000ef          	jal	ra,8000d3a8 <__udivsi3>
8000cec4:	01099993          	slli	s3,s3,0x10
8000cec8:	00050493          	mv	s1,a0
8000cecc:	00050593          	mv	a1,a0
8000ced0:	01091913          	slli	s2,s2,0x10
8000ced4:	000b8513          	mv	a0,s7
8000ced8:	0109d993          	srli	s3,s3,0x10
8000cedc:	4a0000ef          	jal	ra,8000d37c <__mulsi3>
8000cee0:	013969b3          	or	s3,s2,s3
8000cee4:	00048613          	mv	a2,s1
8000cee8:	00a9fc63          	bgeu	s3,a0,8000cf00 <__udivdi3+0x158>
8000ceec:	013409b3          	add	s3,s0,s3
8000cef0:	fff48613          	addi	a2,s1,-1
8000cef4:	0089e663          	bltu	s3,s0,8000cf00 <__udivdi3+0x158>
8000cef8:	00a9f463          	bgeu	s3,a0,8000cf00 <__udivdi3+0x158>
8000cefc:	ffe48613          	addi	a2,s1,-2
8000cf00:	010a1793          	slli	a5,s4,0x10
8000cf04:	00c7e7b3          	or	a5,a5,a2
8000cf08:	00000a13          	li	s4,0
8000cf0c:	1300006f          	j	8000d03c <__udivdi3+0x294>
8000cf10:	010007b7          	lui	a5,0x1000
8000cf14:	01000693          	li	a3,16
8000cf18:	eef66ce3          	bltu	a2,a5,8000ce10 <__udivdi3+0x68>
8000cf1c:	01800693          	li	a3,24
8000cf20:	ef1ff06f          	j	8000ce10 <__udivdi3+0x68>
8000cf24:	00068a13          	mv	s4,a3
8000cf28:	00061a63          	bnez	a2,8000cf3c <__udivdi3+0x194>
8000cf2c:	00000593          	li	a1,0
8000cf30:	00100513          	li	a0,1
8000cf34:	474000ef          	jal	ra,8000d3a8 <__udivsi3>
8000cf38:	00050413          	mv	s0,a0
8000cf3c:	000107b7          	lui	a5,0x10
8000cf40:	12f47c63          	bgeu	s0,a5,8000d078 <__udivdi3+0x2d0>
8000cf44:	0ff00793          	li	a5,255
8000cf48:	0087f463          	bgeu	a5,s0,8000cf50 <__udivdi3+0x1a8>
8000cf4c:	00800a13          	li	s4,8
8000cf50:	014457b3          	srl	a5,s0,s4
8000cf54:	00f90933          	add	s2,s2,a5
8000cf58:	00094683          	lbu	a3,0(s2)
8000cf5c:	02000613          	li	a2,32
8000cf60:	014686b3          	add	a3,a3,s4
8000cf64:	40d60633          	sub	a2,a2,a3
8000cf68:	12061263          	bnez	a2,8000d08c <__udivdi3+0x2e4>
8000cf6c:	408484b3          	sub	s1,s1,s0
8000cf70:	00100a13          	li	s4,1
8000cf74:	01045b13          	srli	s6,s0,0x10
8000cf78:	000b0593          	mv	a1,s6
8000cf7c:	00048513          	mv	a0,s1
8000cf80:	470000ef          	jal	ra,8000d3f0 <__umodsi3>
8000cf84:	00050913          	mv	s2,a0
8000cf88:	000b0593          	mv	a1,s6
8000cf8c:	00048513          	mv	a0,s1
8000cf90:	01041b93          	slli	s7,s0,0x10
8000cf94:	414000ef          	jal	ra,8000d3a8 <__udivsi3>
8000cf98:	010bdb93          	srli	s7,s7,0x10
8000cf9c:	00050493          	mv	s1,a0
8000cfa0:	00050593          	mv	a1,a0
8000cfa4:	000b8513          	mv	a0,s7
8000cfa8:	3d4000ef          	jal	ra,8000d37c <__mulsi3>
8000cfac:	01091913          	slli	s2,s2,0x10
8000cfb0:	0109d713          	srli	a4,s3,0x10
8000cfb4:	00e96733          	or	a4,s2,a4
8000cfb8:	00048a93          	mv	s5,s1
8000cfbc:	00a77e63          	bgeu	a4,a0,8000cfd8 <__udivdi3+0x230>
8000cfc0:	00870733          	add	a4,a4,s0
8000cfc4:	fff48a93          	addi	s5,s1,-1
8000cfc8:	00876863          	bltu	a4,s0,8000cfd8 <__udivdi3+0x230>
8000cfcc:	00a77663          	bgeu	a4,a0,8000cfd8 <__udivdi3+0x230>
8000cfd0:	ffe48a93          	addi	s5,s1,-2
8000cfd4:	00870733          	add	a4,a4,s0
8000cfd8:	40a704b3          	sub	s1,a4,a0
8000cfdc:	000b0593          	mv	a1,s6
8000cfe0:	00048513          	mv	a0,s1
8000cfe4:	40c000ef          	jal	ra,8000d3f0 <__umodsi3>
8000cfe8:	00050913          	mv	s2,a0
8000cfec:	000b0593          	mv	a1,s6
8000cff0:	00048513          	mv	a0,s1
8000cff4:	3b4000ef          	jal	ra,8000d3a8 <__udivsi3>
8000cff8:	01099993          	slli	s3,s3,0x10
8000cffc:	00050493          	mv	s1,a0
8000d000:	00050593          	mv	a1,a0
8000d004:	01091913          	slli	s2,s2,0x10
8000d008:	000b8513          	mv	a0,s7
8000d00c:	0109d993          	srli	s3,s3,0x10
8000d010:	36c000ef          	jal	ra,8000d37c <__mulsi3>
8000d014:	013969b3          	or	s3,s2,s3
8000d018:	00048613          	mv	a2,s1
8000d01c:	00a9fc63          	bgeu	s3,a0,8000d034 <__udivdi3+0x28c>
8000d020:	013409b3          	add	s3,s0,s3
8000d024:	fff48613          	addi	a2,s1,-1
8000d028:	0089e663          	bltu	s3,s0,8000d034 <__udivdi3+0x28c>
8000d02c:	00a9f463          	bgeu	s3,a0,8000d034 <__udivdi3+0x28c>
8000d030:	ffe48613          	addi	a2,s1,-2
8000d034:	010a9793          	slli	a5,s5,0x10
8000d038:	00c7e7b3          	or	a5,a5,a2
8000d03c:	00078513          	mv	a0,a5
8000d040:	000a0593          	mv	a1,s4
8000d044:	02c12083          	lw	ra,44(sp)
8000d048:	02812403          	lw	s0,40(sp)
8000d04c:	02412483          	lw	s1,36(sp)
8000d050:	02012903          	lw	s2,32(sp)
8000d054:	01c12983          	lw	s3,28(sp)
8000d058:	01812a03          	lw	s4,24(sp)
8000d05c:	01412a83          	lw	s5,20(sp)
8000d060:	01012b03          	lw	s6,16(sp)
8000d064:	00c12b83          	lw	s7,12(sp)
8000d068:	00812c03          	lw	s8,8(sp)
8000d06c:	00412c83          	lw	s9,4(sp)
8000d070:	03010113          	addi	sp,sp,48
8000d074:	00008067          	ret
8000d078:	010007b7          	lui	a5,0x1000
8000d07c:	01000a13          	li	s4,16
8000d080:	ecf468e3          	bltu	s0,a5,8000cf50 <__udivdi3+0x1a8>
8000d084:	01800a13          	li	s4,24
8000d088:	ec9ff06f          	j	8000cf50 <__udivdi3+0x1a8>
8000d08c:	00c41433          	sll	s0,s0,a2
8000d090:	00d4da33          	srl	s4,s1,a3
8000d094:	00cb19b3          	sll	s3,s6,a2
8000d098:	00db56b3          	srl	a3,s6,a3
8000d09c:	01045b13          	srli	s6,s0,0x10
8000d0a0:	00c494b3          	sll	s1,s1,a2
8000d0a4:	000b0593          	mv	a1,s6
8000d0a8:	000a0513          	mv	a0,s4
8000d0ac:	0096eab3          	or	s5,a3,s1
8000d0b0:	340000ef          	jal	ra,8000d3f0 <__umodsi3>
8000d0b4:	00050913          	mv	s2,a0
8000d0b8:	000b0593          	mv	a1,s6
8000d0bc:	000a0513          	mv	a0,s4
8000d0c0:	01041b93          	slli	s7,s0,0x10
8000d0c4:	2e4000ef          	jal	ra,8000d3a8 <__udivsi3>
8000d0c8:	010bdb93          	srli	s7,s7,0x10
8000d0cc:	00050493          	mv	s1,a0
8000d0d0:	00050593          	mv	a1,a0
8000d0d4:	000b8513          	mv	a0,s7
8000d0d8:	2a4000ef          	jal	ra,8000d37c <__mulsi3>
8000d0dc:	01091913          	slli	s2,s2,0x10
8000d0e0:	010ad713          	srli	a4,s5,0x10
8000d0e4:	00e96733          	or	a4,s2,a4
8000d0e8:	00048a13          	mv	s4,s1
8000d0ec:	00a77e63          	bgeu	a4,a0,8000d108 <__udivdi3+0x360>
8000d0f0:	00870733          	add	a4,a4,s0
8000d0f4:	fff48a13          	addi	s4,s1,-1
8000d0f8:	00876863          	bltu	a4,s0,8000d108 <__udivdi3+0x360>
8000d0fc:	00a77663          	bgeu	a4,a0,8000d108 <__udivdi3+0x360>
8000d100:	ffe48a13          	addi	s4,s1,-2
8000d104:	00870733          	add	a4,a4,s0
8000d108:	40a704b3          	sub	s1,a4,a0
8000d10c:	000b0593          	mv	a1,s6
8000d110:	00048513          	mv	a0,s1
8000d114:	2dc000ef          	jal	ra,8000d3f0 <__umodsi3>
8000d118:	00050913          	mv	s2,a0
8000d11c:	000b0593          	mv	a1,s6
8000d120:	00048513          	mv	a0,s1
8000d124:	284000ef          	jal	ra,8000d3a8 <__udivsi3>
8000d128:	00050493          	mv	s1,a0
8000d12c:	00050593          	mv	a1,a0
8000d130:	000b8513          	mv	a0,s7
8000d134:	248000ef          	jal	ra,8000d37c <__mulsi3>
8000d138:	010a9693          	slli	a3,s5,0x10
8000d13c:	01091913          	slli	s2,s2,0x10
8000d140:	0106d693          	srli	a3,a3,0x10
8000d144:	00d967b3          	or	a5,s2,a3
8000d148:	00048713          	mv	a4,s1
8000d14c:	00a7fe63          	bgeu	a5,a0,8000d168 <__udivdi3+0x3c0>
8000d150:	008787b3          	add	a5,a5,s0
8000d154:	fff48713          	addi	a4,s1,-1
8000d158:	0087e863          	bltu	a5,s0,8000d168 <__udivdi3+0x3c0>
8000d15c:	00a7f663          	bgeu	a5,a0,8000d168 <__udivdi3+0x3c0>
8000d160:	ffe48713          	addi	a4,s1,-2
8000d164:	008787b3          	add	a5,a5,s0
8000d168:	010a1a13          	slli	s4,s4,0x10
8000d16c:	40a784b3          	sub	s1,a5,a0
8000d170:	00ea6a33          	or	s4,s4,a4
8000d174:	e01ff06f          	j	8000cf74 <__udivdi3+0x1cc>
8000d178:	1ed5ec63          	bltu	a1,a3,8000d370 <__udivdi3+0x5c8>
8000d17c:	000107b7          	lui	a5,0x10
8000d180:	04f6f463          	bgeu	a3,a5,8000d1c8 <__udivdi3+0x420>
8000d184:	0ff00593          	li	a1,255
8000d188:	00d5b533          	sltu	a0,a1,a3
8000d18c:	00351513          	slli	a0,a0,0x3
8000d190:	00a6d733          	srl	a4,a3,a0
8000d194:	ffff6797          	auipc	a5,0xffff6
8000d198:	d6078793          	addi	a5,a5,-672 # 80002ef4 <__clz_tab>
8000d19c:	00e787b3          	add	a5,a5,a4
8000d1a0:	0007c583          	lbu	a1,0(a5)
8000d1a4:	02000a13          	li	s4,32
8000d1a8:	00a585b3          	add	a1,a1,a0
8000d1ac:	40ba0a33          	sub	s4,s4,a1
8000d1b0:	020a1663          	bnez	s4,8000d1dc <__udivdi3+0x434>
8000d1b4:	00100793          	li	a5,1
8000d1b8:	e896e2e3          	bltu	a3,s1,8000d03c <__udivdi3+0x294>
8000d1bc:	00cb3633          	sltu	a2,s6,a2
8000d1c0:	00164793          	xori	a5,a2,1
8000d1c4:	e79ff06f          	j	8000d03c <__udivdi3+0x294>
8000d1c8:	010007b7          	lui	a5,0x1000
8000d1cc:	01000513          	li	a0,16
8000d1d0:	fcf6e0e3          	bltu	a3,a5,8000d190 <__udivdi3+0x3e8>
8000d1d4:	01800513          	li	a0,24
8000d1d8:	fb9ff06f          	j	8000d190 <__udivdi3+0x3e8>
8000d1dc:	00b65ab3          	srl	s5,a2,a1
8000d1e0:	014696b3          	sll	a3,a3,s4
8000d1e4:	00daeab3          	or	s5,s5,a3
8000d1e8:	00b4d933          	srl	s2,s1,a1
8000d1ec:	014497b3          	sll	a5,s1,s4
8000d1f0:	00bb55b3          	srl	a1,s6,a1
8000d1f4:	010adb93          	srli	s7,s5,0x10
8000d1f8:	00f5e4b3          	or	s1,a1,a5
8000d1fc:	00090513          	mv	a0,s2
8000d200:	000b8593          	mv	a1,s7
8000d204:	014619b3          	sll	s3,a2,s4
8000d208:	1e8000ef          	jal	ra,8000d3f0 <__umodsi3>
8000d20c:	00050413          	mv	s0,a0
8000d210:	000b8593          	mv	a1,s7
8000d214:	00090513          	mv	a0,s2
8000d218:	010a9c13          	slli	s8,s5,0x10
8000d21c:	18c000ef          	jal	ra,8000d3a8 <__udivsi3>
8000d220:	010c5c13          	srli	s8,s8,0x10
8000d224:	00050913          	mv	s2,a0
8000d228:	00050593          	mv	a1,a0
8000d22c:	000c0513          	mv	a0,s8
8000d230:	14c000ef          	jal	ra,8000d37c <__mulsi3>
8000d234:	01041413          	slli	s0,s0,0x10
8000d238:	0104d713          	srli	a4,s1,0x10
8000d23c:	00e46733          	or	a4,s0,a4
8000d240:	00090c93          	mv	s9,s2
8000d244:	00a77e63          	bgeu	a4,a0,8000d260 <__udivdi3+0x4b8>
8000d248:	01570733          	add	a4,a4,s5
8000d24c:	fff90c93          	addi	s9,s2,-1
8000d250:	01576863          	bltu	a4,s5,8000d260 <__udivdi3+0x4b8>
8000d254:	00a77663          	bgeu	a4,a0,8000d260 <__udivdi3+0x4b8>
8000d258:	ffe90c93          	addi	s9,s2,-2
8000d25c:	01570733          	add	a4,a4,s5
8000d260:	40a70933          	sub	s2,a4,a0
8000d264:	000b8593          	mv	a1,s7
8000d268:	00090513          	mv	a0,s2
8000d26c:	184000ef          	jal	ra,8000d3f0 <__umodsi3>
8000d270:	00050413          	mv	s0,a0
8000d274:	000b8593          	mv	a1,s7
8000d278:	00090513          	mv	a0,s2
8000d27c:	12c000ef          	jal	ra,8000d3a8 <__udivsi3>
8000d280:	00050913          	mv	s2,a0
8000d284:	00050593          	mv	a1,a0
8000d288:	000c0513          	mv	a0,s8
8000d28c:	0f0000ef          	jal	ra,8000d37c <__mulsi3>
8000d290:	01049793          	slli	a5,s1,0x10
8000d294:	01041413          	slli	s0,s0,0x10
8000d298:	0107d793          	srli	a5,a5,0x10
8000d29c:	00f46733          	or	a4,s0,a5
8000d2a0:	00090613          	mv	a2,s2
8000d2a4:	00a77e63          	bgeu	a4,a0,8000d2c0 <__udivdi3+0x518>
8000d2a8:	01570733          	add	a4,a4,s5
8000d2ac:	fff90613          	addi	a2,s2,-1
8000d2b0:	01576863          	bltu	a4,s5,8000d2c0 <__udivdi3+0x518>
8000d2b4:	00a77663          	bgeu	a4,a0,8000d2c0 <__udivdi3+0x518>
8000d2b8:	ffe90613          	addi	a2,s2,-2
8000d2bc:	01570733          	add	a4,a4,s5
8000d2c0:	010c9793          	slli	a5,s9,0x10
8000d2c4:	00010e37          	lui	t3,0x10
8000d2c8:	00c7e7b3          	or	a5,a5,a2
8000d2cc:	fffe0813          	addi	a6,t3,-1 # ffff <_stack_size+0xf7ff>
8000d2d0:	0107f333          	and	t1,a5,a6
8000d2d4:	0109f833          	and	a6,s3,a6
8000d2d8:	40a70733          	sub	a4,a4,a0
8000d2dc:	0107de93          	srli	t4,a5,0x10
8000d2e0:	0109d993          	srli	s3,s3,0x10
8000d2e4:	00030513          	mv	a0,t1
8000d2e8:	00080593          	mv	a1,a6
8000d2ec:	090000ef          	jal	ra,8000d37c <__mulsi3>
8000d2f0:	00050893          	mv	a7,a0
8000d2f4:	00098593          	mv	a1,s3
8000d2f8:	00030513          	mv	a0,t1
8000d2fc:	080000ef          	jal	ra,8000d37c <__mulsi3>
8000d300:	00050313          	mv	t1,a0
8000d304:	00080593          	mv	a1,a6
8000d308:	000e8513          	mv	a0,t4
8000d30c:	070000ef          	jal	ra,8000d37c <__mulsi3>
8000d310:	00050813          	mv	a6,a0
8000d314:	00098593          	mv	a1,s3
8000d318:	000e8513          	mv	a0,t4
8000d31c:	060000ef          	jal	ra,8000d37c <__mulsi3>
8000d320:	0108d693          	srli	a3,a7,0x10
8000d324:	01030333          	add	t1,t1,a6
8000d328:	006686b3          	add	a3,a3,t1
8000d32c:	0106f463          	bgeu	a3,a6,8000d334 <__udivdi3+0x58c>
8000d330:	01c50533          	add	a0,a0,t3
8000d334:	0106d613          	srli	a2,a3,0x10
8000d338:	00a60533          	add	a0,a2,a0
8000d33c:	02a76663          	bltu	a4,a0,8000d368 <__udivdi3+0x5c0>
8000d340:	bca714e3          	bne	a4,a0,8000cf08 <__udivdi3+0x160>
8000d344:	00010737          	lui	a4,0x10
8000d348:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
8000d34c:	00e6f6b3          	and	a3,a3,a4
8000d350:	01069693          	slli	a3,a3,0x10
8000d354:	00e8f8b3          	and	a7,a7,a4
8000d358:	014b1633          	sll	a2,s6,s4
8000d35c:	011686b3          	add	a3,a3,a7
8000d360:	00000a13          	li	s4,0
8000d364:	ccd67ce3          	bgeu	a2,a3,8000d03c <__udivdi3+0x294>
8000d368:	fff78793          	addi	a5,a5,-1 # ffffff <_stack_size+0xfff7ff>
8000d36c:	b9dff06f          	j	8000cf08 <__udivdi3+0x160>
8000d370:	00000a13          	li	s4,0
8000d374:	00000793          	li	a5,0
8000d378:	cc5ff06f          	j	8000d03c <__udivdi3+0x294>

8000d37c <__mulsi3>:
8000d37c:	00050613          	mv	a2,a0
8000d380:	00000513          	li	a0,0
8000d384:	0015f693          	andi	a3,a1,1
8000d388:	00068463          	beqz	a3,8000d390 <__mulsi3+0x14>
8000d38c:	00c50533          	add	a0,a0,a2
8000d390:	0015d593          	srli	a1,a1,0x1
8000d394:	00161613          	slli	a2,a2,0x1
8000d398:	fe0596e3          	bnez	a1,8000d384 <__mulsi3+0x8>
8000d39c:	00008067          	ret

8000d3a0 <__divsi3>:
8000d3a0:	06054063          	bltz	a0,8000d400 <__umodsi3+0x10>
8000d3a4:	0605c663          	bltz	a1,8000d410 <__umodsi3+0x20>

8000d3a8 <__udivsi3>:
8000d3a8:	00058613          	mv	a2,a1
8000d3ac:	00050593          	mv	a1,a0
8000d3b0:	fff00513          	li	a0,-1
8000d3b4:	02060c63          	beqz	a2,8000d3ec <__udivsi3+0x44>
8000d3b8:	00100693          	li	a3,1
8000d3bc:	00b67a63          	bgeu	a2,a1,8000d3d0 <__udivsi3+0x28>
8000d3c0:	00c05863          	blez	a2,8000d3d0 <__udivsi3+0x28>
8000d3c4:	00161613          	slli	a2,a2,0x1
8000d3c8:	00169693          	slli	a3,a3,0x1
8000d3cc:	feb66ae3          	bltu	a2,a1,8000d3c0 <__udivsi3+0x18>
8000d3d0:	00000513          	li	a0,0
8000d3d4:	00c5e663          	bltu	a1,a2,8000d3e0 <__udivsi3+0x38>
8000d3d8:	40c585b3          	sub	a1,a1,a2
8000d3dc:	00d56533          	or	a0,a0,a3
8000d3e0:	0016d693          	srli	a3,a3,0x1
8000d3e4:	00165613          	srli	a2,a2,0x1
8000d3e8:	fe0696e3          	bnez	a3,8000d3d4 <__udivsi3+0x2c>
8000d3ec:	00008067          	ret

8000d3f0 <__umodsi3>:
8000d3f0:	00008293          	mv	t0,ra
8000d3f4:	fb5ff0ef          	jal	ra,8000d3a8 <__udivsi3>
8000d3f8:	00058513          	mv	a0,a1
8000d3fc:	00028067          	jr	t0 # 8000cd4c <memset+0xb4>
8000d400:	40a00533          	neg	a0,a0
8000d404:	0005d863          	bgez	a1,8000d414 <__umodsi3+0x24>
8000d408:	40b005b3          	neg	a1,a1
8000d40c:	f9dff06f          	j	8000d3a8 <__udivsi3>
8000d410:	40b005b3          	neg	a1,a1
8000d414:	00008293          	mv	t0,ra
8000d418:	f91ff0ef          	jal	ra,8000d3a8 <__udivsi3>
8000d41c:	40a00533          	neg	a0,a0
8000d420:	00028067          	jr	t0

8000d424 <__modsi3>:
8000d424:	00008293          	mv	t0,ra
8000d428:	0005ca63          	bltz	a1,8000d43c <__modsi3+0x18>
8000d42c:	00054c63          	bltz	a0,8000d444 <__modsi3+0x20>
8000d430:	f79ff0ef          	jal	ra,8000d3a8 <__udivsi3>
8000d434:	00058513          	mv	a0,a1
8000d438:	00028067          	jr	t0
8000d43c:	40b005b3          	neg	a1,a1
8000d440:	fe0558e3          	bgez	a0,8000d430 <__modsi3+0xc>
8000d444:	40a00533          	neg	a0,a0
8000d448:	f61ff0ef          	jal	ra,8000d3a8 <__udivsi3>
8000d44c:	40b00533          	neg	a0,a1
8000d450:	00028067          	jr	t0

Disassembly of section .text.startup:

8000d454 <main>:
8000d454:	fb010113          	addi	sp,sp,-80
8000d458:	04112623          	sw	ra,76(sp)
8000d45c:	04812423          	sw	s0,72(sp)
8000d460:	04912223          	sw	s1,68(sp)
8000d464:	05212023          	sw	s2,64(sp)
8000d468:	03312e23          	sw	s3,60(sp)
8000d46c:	03412c23          	sw	s4,56(sp)
8000d470:	03512a23          	sw	s5,52(sp)
8000d474:	03612823          	sw	s6,48(sp)
8000d478:	03712623          	sw	s7,44(sp)
8000d47c:	03812423          	sw	s8,40(sp)
8000d480:	30047073          	csrci	mstatus,8
8000d484:	00000593          	li	a1,0
8000d488:	00000513          	li	a0,0
8000d48c:	f3cf80ef          	jal	ra,80005bc8 <init_sbrk>
8000d490:	001e8537          	lui	a0,0x1e8
8000d494:	48050513          	addi	a0,a0,1152 # 1e8480 <_stack_size+0x1e7c80>
8000d498:	f84f80ef          	jal	ra,80005c1c <delay_us>
8000d49c:	8701a783          	lw	a5,-1936(gp) # 800030f0 <deadbeef>
8000d4a0:	1c078c63          	beqz	a5,8000d678 <main+0x224>
8000d4a4:	80002537          	lui	a0,0x80002
8000d4a8:	fd450513          	addi	a0,a0,-44 # 80001fd4 <_ram_heap_end+0xfffeffd4>
8000d4ac:	fa0f80ef          	jal	ra,80005c4c <print_uart0>
8000d4b0:	8e1f80ef          	jal	ra,80005d90 <hard_reboot>
8000d4b4:	80002537          	lui	a0,0x80002
8000d4b8:	06900593          	li	a1,105
8000d4bc:	ffc50513          	addi	a0,a0,-4 # 80001ffc <_ram_heap_end+0xfffefffc>
8000d4c0:	1a4010ef          	jal	ra,8000e664 <iprintf>
8000d4c4:	f0000737          	lui	a4,0xf0000
8000d4c8:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
8000d4cc:	80002537          	lui	a0,0x80002
8000d4d0:	09050513          	addi	a0,a0,144 # 80002090 <_ram_heap_end+0xffff0090>
8000d4d4:	0027e793          	ori	a5,a5,2
8000d4d8:	00f72223          	sw	a5,4(a4)
8000d4dc:	188010ef          	jal	ra,8000e664 <iprintf>
8000d4e0:	a2cf60ef          	jal	ra,8000370c <sram_test_write_random_ints>
8000d4e4:	80002437          	lui	s0,0x80002
8000d4e8:	1a051063          	bnez	a0,8000d688 <main+0x234>
8000d4ec:	80002537          	lui	a0,0x80002
8000d4f0:	0a050513          	addi	a0,a0,160 # 800020a0 <_ram_heap_end+0xffff00a0>
8000d4f4:	170010ef          	jal	ra,8000e664 <iprintf>
8000d4f8:	000805b7          	lui	a1,0x80
8000d4fc:	90000537          	lui	a0,0x90000
8000d500:	ec8f80ef          	jal	ra,80005bc8 <init_sbrk>
8000d504:	800025b7          	lui	a1,0x80002
8000d508:	0b458593          	addi	a1,a1,180 # 800020b4 <_ram_heap_end+0xffff00b4>
8000d50c:	0bc40513          	addi	a0,s0,188 # 800020bc <_ram_heap_end+0xffff00bc>
8000d510:	154010ef          	jal	ra,8000e664 <iprintf>
8000d514:	f00547b7          	lui	a5,0xf0054
8000d518:	0007a023          	sw	zero,0(a5) # f0054000 <_ram_heap_end+0x70042000>
8000d51c:	f0000737          	lui	a4,0xf0000
8000d520:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
8000d524:	01900613          	li	a2,25
8000d528:	00100693          	li	a3,1
8000d52c:	ff77f793          	andi	a5,a5,-9
8000d530:	00f72223          	sw	a5,4(a4)
8000d534:	f00607b7          	lui	a5,0xf0060
8000d538:	03f00713          	li	a4,63
8000d53c:	00e7a623          	sw	a4,12(a5) # f006000c <_ram_heap_end+0x7004e00c>
8000d540:	0007a223          	sw	zero,4(a5)
8000d544:	fff00713          	li	a4,-1
8000d548:	00e7a023          	sw	a4,0(a5)
8000d54c:	f0010737          	lui	a4,0xf0010
8000d550:	00472783          	lw	a5,4(a4) # f0010004 <_ram_heap_end+0x6fffe004>
8000d554:	f0090537          	lui	a0,0xf0090
8000d558:	0027e793          	ori	a5,a5,2
8000d55c:	00f72223          	sw	a5,4(a4)
8000d560:	f0011737          	lui	a4,0xf0011
8000d564:	00472783          	lw	a5,4(a4) # f0011004 <_ram_heap_end+0x6ffff004>
8000d568:	0027e793          	ori	a5,a5,2
8000d56c:	00f72223          	sw	a5,4(a4)
8000d570:	f00207b7          	lui	a5,0xf0020
8000d574:	0007a023          	sw	zero,0(a5) # f0020000 <_ram_heap_end+0x7000e000>
8000d578:	00c7a223          	sw	a2,4(a5)
8000d57c:	0007a423          	sw	zero,8(a5)
8000d580:	00018737          	lui	a4,0x18
8000d584:	0007a623          	sw	zero,12(a5)
8000d588:	6a070713          	addi	a4,a4,1696 # 186a0 <_stack_size+0x17ea0>
8000d58c:	00e7a823          	sw	a4,16(a5)
8000d590:	00d7a023          	sw	a3,0(a5)
8000d594:	f00217b7          	lui	a5,0xf0021
8000d598:	0007a023          	sw	zero,0(a5) # f0021000 <_ram_heap_end+0x7000f000>
8000d59c:	00c7a223          	sw	a2,4(a5)
8000d5a0:	0007a423          	sw	zero,8(a5)
8000d5a4:	0000c737          	lui	a4,0xc
8000d5a8:	0007a623          	sw	zero,12(a5)
8000d5ac:	35070713          	addi	a4,a4,848 # c350 <_stack_size+0xbb50>
8000d5b0:	00e7a823          	sw	a4,16(a5)
8000d5b4:	00d7a023          	sw	a3,0(a5)
8000d5b8:	da4f80ef          	jal	ra,80005b5c <i2c_init>
8000d5bc:	30046073          	csrsi	mstatus,8
8000d5c0:	80c1a783          	lw	a5,-2036(gp) # 8000308c <_impure_ptr>
8000d5c4:	0007a937          	lui	s2,0x7a
8000d5c8:	0087a503          	lw	a0,8(a5)
8000d5cc:	00a00493          	li	s1,10
8000d5d0:	00200a93          	li	s5,2
8000d5d4:	28d000ef          	jal	ra,8000e060 <fpurge>
8000d5d8:	80002537          	lui	a0,0x80002
8000d5dc:	0d450513          	addi	a0,a0,212 # 800020d4 <_ram_heap_end+0xffff00d4>
8000d5e0:	084010ef          	jal	ra,8000e664 <iprintf>
8000d5e4:	80c1a783          	lw	a5,-2036(gp) # 8000308c <_impure_ptr>
8000d5e8:	000a0993          	mv	s3,s4
8000d5ec:	f0000b37          	lui	s6,0xf0000
8000d5f0:	0087a503          	lw	a0,8(a5)
8000d5f4:	12090913          	addi	s2,s2,288 # 7a120 <_stack_size+0x79920>
8000d5f8:	668000ef          	jal	ra,8000dc60 <fflush>
8000d5fc:	87c1a783          	lw	a5,-1924(gp) # 800030fc <uart_config_reset_counter>
8000d600:	02fae863          	bltu	s5,a5,8000d630 <main+0x1dc>
8000d604:	000b2783          	lw	a5,0(s6) # f0000000 <_ram_heap_end+0x6ffee000>
8000d608:	0207d463          	bgez	a5,8000d630 <main+0x1dc>
8000d60c:	02e00513          	li	a0,46
8000d610:	10c010ef          	jal	ra,8000e71c <putchar>
8000d614:	80c1a783          	lw	a5,-2036(gp) # 8000308c <_impure_ptr>
8000d618:	fff48493          	addi	s1,s1,-1
8000d61c:	0087a503          	lw	a0,8(a5)
8000d620:	640000ef          	jal	ra,8000dc60 <fflush>
8000d624:	00090513          	mv	a0,s2
8000d628:	df4f80ef          	jal	ra,80005c1c <delay_us>
8000d62c:	fc0498e3          	bnez	s1,8000d5fc <main+0x1a8>
8000d630:	80003537          	lui	a0,0x80003
8000d634:	85050513          	addi	a0,a0,-1968 # 80002850 <_ram_heap_end+0xffff0850>
8000d638:	02c010ef          	jal	ra,8000e664 <iprintf>
8000d63c:	800034b7          	lui	s1,0x80003
8000d640:	02000613          	li	a2,32
8000d644:	ff448593          	addi	a1,s1,-12 # 80002ff4 <_ram_heap_end+0xffff0ff4>
8000d648:	99418513          	addi	a0,gp,-1644 # 80003214 <active_config>
8000d64c:	3d9000ef          	jal	ra,8000e224 <memcpy>
8000d650:	87c1a703          	lw	a4,-1924(gp) # 800030fc <uart_config_reset_counter>
8000d654:	00200793          	li	a5,2
8000d658:	02e7fe63          	bgeu	a5,a4,8000d694 <main+0x240>
8000d65c:	800025b7          	lui	a1,0x80002
8000d660:	8601ae23          	sw	zero,-1924(gp) # 800030fc <uart_config_reset_counter>
8000d664:	0f058593          	addi	a1,a1,240 # 800020f0 <_ram_heap_end+0xffff00f0>
8000d668:	80002537          	lui	a0,0x80002
8000d66c:	10050513          	addi	a0,a0,256 # 80002100 <_ram_heap_end+0xffff0100>
8000d670:	7f5000ef          	jal	ra,8000e664 <iprintf>
8000d674:	05c0006f          	j	8000d6d0 <main+0x27c>
8000d678:	deadc7b7          	lui	a5,0xdeadc
8000d67c:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac9eef>
8000d680:	86f1a823          	sw	a5,-1936(gp) # 800030f0 <deadbeef>
8000d684:	e31ff06f          	j	8000d4b4 <main+0x60>
8000d688:	800025b7          	lui	a1,0x80002
8000d68c:	0c858593          	addi	a1,a1,200 # 800020c8 <_ram_heap_end+0xffff00c8>
8000d690:	e7dff06f          	j	8000d50c <main+0xb8>
8000d694:	f00007b7          	lui	a5,0xf0000
8000d698:	0007a783          	lw	a5,0(a5) # f0000000 <_ram_heap_end+0x6ffee000>
8000d69c:	0007c863          	bltz	a5,8000d6ac <main+0x258>
8000d6a0:	800025b7          	lui	a1,0x80002
8000d6a4:	11c58593          	addi	a1,a1,284 # 8000211c <_ram_heap_end+0xffff011c>
8000d6a8:	fc1ff06f          	j	8000d668 <main+0x214>
8000d6ac:	f0090537          	lui	a0,0xf0090
8000d6b0:	be9f60ef          	jal	ra,80004298 <eeprom_probe>
8000d6b4:	2e051463          	bnez	a0,8000d99c <main+0x548>
8000d6b8:	99418513          	addi	a0,gp,-1644 # 80003214 <active_config>
8000d6bc:	d74f60ef          	jal	ra,80003c30 <config_load>
8000d6c0:	2c051063          	bnez	a0,8000d980 <main+0x52c>
8000d6c4:	80002537          	lui	a0,0x80002
8000d6c8:	12850513          	addi	a0,a0,296 # 80002128 <_ram_heap_end+0xffff0128>
8000d6cc:	799000ef          	jal	ra,8000e664 <iprintf>
8000d6d0:	30047073          	csrci	mstatus,8
8000d6d4:	99418413          	addi	s0,gp,-1644 # 80003214 <active_config>
8000d6d8:	01344503          	lbu	a0,19(s0)
8000d6dc:	ca1f70ef          	jal	ra,8000537c <hub_init>
8000d6e0:	83df70ef          	jal	ra,80004f1c <mac_lwip_init>
8000d6e4:	9a8f80ef          	jal	ra,8000588c <modbus_udp_init>
8000d6e8:	af8f60ef          	jal	ra,800039e0 <modbus_rtu_init>
8000d6ec:	80002537          	lui	a0,0x80002
8000d6f0:	16c50513          	addi	a0,a0,364 # 8000216c <_ram_heap_end+0xffff016c>
8000d6f4:	771000ef          	jal	ra,8000e664 <iprintf>
8000d6f8:	f0000737          	lui	a4,0xf0000
8000d6fc:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
8000d700:	ff87f793          	andi	a5,a5,-8
8000d704:	00f72223          	sw	a5,4(a4)
8000d708:	30046073          	csrsi	mstatus,8
8000d70c:	80002537          	lui	a0,0x80002
8000d710:	18450513          	addi	a0,a0,388 # 80002184 <_ram_heap_end+0xffff0184>
8000d714:	751000ef          	jal	ra,8000e664 <iprintf>
8000d718:	800004b7          	lui	s1,0x80000
8000d71c:	800026b7          	lui	a3,0x80002
8000d720:	13448793          	addi	a5,s1,308 # 80000134 <_ram_heap_end+0xfffee134>
8000d724:	00800893          	li	a7,8
8000d728:	00600813          	li	a6,6
8000d72c:	00500713          	li	a4,5
8000d730:	1a468693          	addi	a3,a3,420 # 800021a4 <_ram_heap_end+0xffff01a4>
8000d734:	03f00613          	li	a2,63
8000d738:	00000593          	li	a1,0
8000d73c:	00600513          	li	a0,6
8000d740:	868f80ef          	jal	ra,800057a8 <hub_print>
8000d744:	01444603          	lbu	a2,20(s0)
8000d748:	800025b7          	lui	a1,0x80002
8000d74c:	1ac58593          	addi	a1,a1,428 # 800021ac <_ram_heap_end+0xffff01ac>
8000d750:	00010513          	mv	a0,sp
8000d754:	2fc010ef          	jal	ra,8000ea50 <siprintf>
8000d758:	13448793          	addi	a5,s1,308
8000d75c:	00050713          	mv	a4,a0
8000d760:	00800893          	li	a7,8
8000d764:	00600813          	li	a6,6
8000d768:	00010693          	mv	a3,sp
8000d76c:	03f00613          	li	a2,63
8000d770:	00800593          	li	a1,8
8000d774:	00000513          	li	a0,0
8000d778:	830f80ef          	jal	ra,800057a8 <hub_print>
8000d77c:	001e8937          	lui	s2,0x1e8
8000d780:	48090513          	addi	a0,s2,1152 # 1e8480 <_stack_size+0x1e7c80>
8000d784:	ef1f50ef          	jal	ra,80003674 <process_and_wait>
8000d788:	800026b7          	lui	a3,0x80002
8000d78c:	13448793          	addi	a5,s1,308
8000d790:	00800893          	li	a7,8
8000d794:	00600813          	li	a6,6
8000d798:	00500713          	li	a4,5
8000d79c:	1b068693          	addi	a3,a3,432 # 800021b0 <_ram_heap_end+0xffff01b0>
8000d7a0:	03f00613          	li	a2,63
8000d7a4:	00000593          	li	a1,0
8000d7a8:	00600513          	li	a0,6
8000d7ac:	ffdf70ef          	jal	ra,800057a8 <hub_print>
8000d7b0:	9b418413          	addi	s0,gp,-1612 # 80003234 <default_netif>
8000d7b4:	00444603          	lbu	a2,4(s0)
8000d7b8:	800029b7          	lui	s3,0x80002
8000d7bc:	1b898593          	addi	a1,s3,440 # 800021b8 <_ram_heap_end+0xffff01b8>
8000d7c0:	00010513          	mv	a0,sp
8000d7c4:	28c010ef          	jal	ra,8000ea50 <siprintf>
8000d7c8:	13448793          	addi	a5,s1,308
8000d7cc:	00050713          	mv	a4,a0
8000d7d0:	00800893          	li	a7,8
8000d7d4:	00600813          	li	a6,6
8000d7d8:	00010693          	mv	a3,sp
8000d7dc:	03f00613          	li	a2,63
8000d7e0:	00800593          	li	a1,8
8000d7e4:	00000513          	li	a0,0
8000d7e8:	fc1f70ef          	jal	ra,800057a8 <hub_print>
8000d7ec:	48090513          	addi	a0,s2,1152
8000d7f0:	e85f50ef          	jal	ra,80003674 <process_and_wait>
8000d7f4:	00544603          	lbu	a2,5(s0)
8000d7f8:	1b898593          	addi	a1,s3,440
8000d7fc:	00010513          	mv	a0,sp
8000d800:	250010ef          	jal	ra,8000ea50 <siprintf>
8000d804:	13448793          	addi	a5,s1,308
8000d808:	00050713          	mv	a4,a0
8000d80c:	00800893          	li	a7,8
8000d810:	00600813          	li	a6,6
8000d814:	00010693          	mv	a3,sp
8000d818:	03f00613          	li	a2,63
8000d81c:	00800593          	li	a1,8
8000d820:	00000513          	li	a0,0
8000d824:	f85f70ef          	jal	ra,800057a8 <hub_print>
8000d828:	48090513          	addi	a0,s2,1152
8000d82c:	e49f50ef          	jal	ra,80003674 <process_and_wait>
8000d830:	00644603          	lbu	a2,6(s0)
8000d834:	1b898593          	addi	a1,s3,440
8000d838:	00010513          	mv	a0,sp
8000d83c:	214010ef          	jal	ra,8000ea50 <siprintf>
8000d840:	13448793          	addi	a5,s1,308
8000d844:	00050713          	mv	a4,a0
8000d848:	00800893          	li	a7,8
8000d84c:	00600813          	li	a6,6
8000d850:	00010693          	mv	a3,sp
8000d854:	03f00613          	li	a2,63
8000d858:	00800593          	li	a1,8
8000d85c:	00000513          	li	a0,0
8000d860:	f49f70ef          	jal	ra,800057a8 <hub_print>
8000d864:	48090513          	addi	a0,s2,1152
8000d868:	e0df50ef          	jal	ra,80003674 <process_and_wait>
8000d86c:	00744603          	lbu	a2,7(s0)
8000d870:	1b898593          	addi	a1,s3,440
8000d874:	00010513          	mv	a0,sp
8000d878:	1d8010ef          	jal	ra,8000ea50 <siprintf>
8000d87c:	13448793          	addi	a5,s1,308
8000d880:	00050713          	mv	a4,a0
8000d884:	00800893          	li	a7,8
8000d888:	00600813          	li	a6,6
8000d88c:	00010693          	mv	a3,sp
8000d890:	03f00613          	li	a2,63
8000d894:	00800593          	li	a1,8
8000d898:	00000513          	li	a0,0
8000d89c:	f0df70ef          	jal	ra,800057a8 <hub_print>
8000d8a0:	48090513          	addi	a0,s2,1152
8000d8a4:	dd1f50ef          	jal	ra,80003674 <process_and_wait>
8000d8a8:	8b81a603          	lw	a2,-1864(gp) # 80003138 <hub_frame_size>
8000d8ac:	00000593          	li	a1,0
8000d8b0:	f0050537          	lui	a0,0xf0050
8000d8b4:	0007a4b7          	lui	s1,0x7a
8000d8b8:	be0ff0ef          	jal	ra,8000cc98 <memset>
8000d8bc:	12048493          	addi	s1,s1,288 # 7a120 <_stack_size+0x79920>
8000d8c0:	80002bb7          	lui	s7,0x80002
8000d8c4:	80002c37          	lui	s8,0x80002
8000d8c8:	f0000937          	lui	s2,0xf0000
8000d8cc:	00492783          	lw	a5,4(s2) # f0000004 <_ram_heap_end+0x6ffee004>
8000d8d0:	00048513          	mv	a0,s1
8000d8d4:	0017e793          	ori	a5,a5,1
8000d8d8:	00f92223          	sw	a5,4(s2)
8000d8dc:	d99f50ef          	jal	ra,80003674 <process_and_wait>
8000d8e0:	00492783          	lw	a5,4(s2)
8000d8e4:	00048513          	mv	a0,s1
8000d8e8:	ffe7f793          	andi	a5,a5,-2
8000d8ec:	00f92223          	sw	a5,4(s2)
8000d8f0:	d85f50ef          	jal	ra,80003674 <process_and_wait>
8000d8f4:	30047073          	csrci	mstatus,8
8000d8f8:	f00547b7          	lui	a5,0xf0054
8000d8fc:	0007a603          	lw	a2,0(a5) # f0054000 <_ram_heap_end+0x70042000>
8000d900:	8c81a883          	lw	a7,-1848(gp) # 80003148 <sbrk_heap_end>
8000d904:	88c1a703          	lw	a4,-1908(gp) # 8000310c <reg_irq_counter>
8000d908:	8b81a683          	lw	a3,-1864(gp) # 80003138 <hub_frame_size>
8000d90c:	8881a783          	lw	a5,-1912(gp) # 80003108 <reg_sys_counter>
8000d910:	8841a803          	lw	a6,-1916(gp) # 80003104 <reg_scratch>
8000d914:	07f67613          	andi	a2,a2,127
8000d918:	06900593          	li	a1,105
8000d91c:	1c0b8513          	addi	a0,s7,448 # 800021c0 <_ram_heap_end+0xffff01c0>
8000d920:	545000ef          	jal	ra,8000e664 <iprintf>
8000d924:	f00607b7          	lui	a5,0xf0060
8000d928:	0007a583          	lw	a1,0(a5) # f0060000 <_ram_heap_end+0x7004e000>
8000d92c:	0047a603          	lw	a2,4(a5)
8000d930:	00c7a683          	lw	a3,12(a5)
8000d934:	0087a703          	lw	a4,8(a5)
8000d938:	0107a783          	lw	a5,16(a5)
8000d93c:	23cc0513          	addi	a0,s8,572 # 8000223c <_ram_heap_end+0xffff023c>
8000d940:	525000ef          	jal	ra,8000e664 <iprintf>
8000d944:	9f5f70ef          	jal	ra,80005338 <mac_print_stats>
8000d948:	30046073          	csrsi	mstatus,8
8000d94c:	8881a783          	lw	a5,-1912(gp) # 80003108 <reg_sys_counter>
8000d950:	00178793          	addi	a5,a5,1
8000d954:	88f1a423          	sw	a5,-1912(gp) # 80003108 <reg_sys_counter>
8000d958:	8801a703          	lw	a4,-1920(gp) # 80003100 <reg_config_write>
8000d95c:	00070863          	beqz	a4,8000d96c <main+0x518>
8000d960:	8801a703          	lw	a4,-1920(gp) # 80003100 <reg_config_write>
8000d964:	fff70713          	addi	a4,a4,-1
8000d968:	88e1a023          	sw	a4,-1920(gp) # 80003100 <reg_config_write>
8000d96c:	f0000737          	lui	a4,0xf0000
8000d970:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
8000d974:	ffd7f793          	andi	a5,a5,-3
8000d978:	00f72223          	sw	a5,4(a4)
8000d97c:	f4dff06f          	j	8000d8c8 <main+0x474>
8000d980:	ff448593          	addi	a1,s1,-12
8000d984:	02000613          	li	a2,32
8000d988:	99418513          	addi	a0,gp,-1644 # 80003214 <active_config>
8000d98c:	099000ef          	jal	ra,8000e224 <memcpy>
8000d990:	800025b7          	lui	a1,0x80002
8000d994:	14458593          	addi	a1,a1,324 # 80002144 <_ram_heap_end+0xffff0144>
8000d998:	cd1ff06f          	j	8000d668 <main+0x214>
8000d99c:	800025b7          	lui	a1,0x80002
8000d9a0:	15858593          	addi	a1,a1,344 # 80002158 <_ram_heap_end+0xffff0158>
8000d9a4:	cc5ff06f          	j	8000d668 <main+0x214>

Disassembly of section .text.atoi:

8000d9a8 <atoi>:
8000d9a8:	00a00613          	li	a2,10
8000d9ac:	00000593          	li	a1,0
8000d9b0:	4d00106f          	j	8000ee80 <strtol>

Disassembly of section .text._atoi_r:

8000d9b4 <_atoi_r>:
8000d9b4:	00a00693          	li	a3,10
8000d9b8:	00000613          	li	a2,0
8000d9bc:	4a80106f          	j	8000ee64 <_strtol_r>

Disassembly of section .text.calloc:

8000d9c0 <calloc>:
8000d9c0:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000d9c4:	00058613          	mv	a2,a1
8000d9c8:	00050593          	mv	a1,a0
8000d9cc:	0007a503          	lw	a0,0(a5)
8000d9d0:	1890006f          	j	8000e358 <_calloc_r>

Disassembly of section .text.__sflush_r:

8000d9d4 <__sflush_r>:
8000d9d4:	00c5d783          	lhu	a5,12(a1)
8000d9d8:	fe010113          	addi	sp,sp,-32
8000d9dc:	00812c23          	sw	s0,24(sp)
8000d9e0:	00912a23          	sw	s1,20(sp)
8000d9e4:	00112e23          	sw	ra,28(sp)
8000d9e8:	01212823          	sw	s2,16(sp)
8000d9ec:	01312623          	sw	s3,12(sp)
8000d9f0:	0087f713          	andi	a4,a5,8
8000d9f4:	00050493          	mv	s1,a0
8000d9f8:	00058413          	mv	s0,a1
8000d9fc:	14071e63          	bnez	a4,8000db58 <__sflush_r+0x184>
8000da00:	0045a703          	lw	a4,4(a1)
8000da04:	00e04a63          	bgtz	a4,8000da18 <__sflush_r+0x44>
8000da08:	0405a703          	lw	a4,64(a1)
8000da0c:	00e04663          	bgtz	a4,8000da18 <__sflush_r+0x44>
8000da10:	00000513          	li	a0,0
8000da14:	11c0006f          	j	8000db30 <__sflush_r+0x15c>
8000da18:	02c42703          	lw	a4,44(s0)
8000da1c:	fe070ae3          	beqz	a4,8000da10 <__sflush_r+0x3c>
8000da20:	0004a903          	lw	s2,0(s1)
8000da24:	01379693          	slli	a3,a5,0x13
8000da28:	0004a023          	sw	zero,0(s1)
8000da2c:	0a06de63          	bgez	a3,8000dae8 <__sflush_r+0x114>
8000da30:	05442503          	lw	a0,84(s0)
8000da34:	00c45783          	lhu	a5,12(s0)
8000da38:	0047f793          	andi	a5,a5,4
8000da3c:	00078e63          	beqz	a5,8000da58 <__sflush_r+0x84>
8000da40:	00442783          	lw	a5,4(s0)
8000da44:	40f50533          	sub	a0,a0,a5
8000da48:	03442783          	lw	a5,52(s0)
8000da4c:	00078663          	beqz	a5,8000da58 <__sflush_r+0x84>
8000da50:	04042783          	lw	a5,64(s0)
8000da54:	40f50533          	sub	a0,a0,a5
8000da58:	02c42783          	lw	a5,44(s0)
8000da5c:	02042583          	lw	a1,32(s0)
8000da60:	00050613          	mv	a2,a0
8000da64:	00000693          	li	a3,0
8000da68:	00048513          	mv	a0,s1
8000da6c:	000780e7          	jalr	a5
8000da70:	fff00793          	li	a5,-1
8000da74:	00c45703          	lhu	a4,12(s0)
8000da78:	02f51263          	bne	a0,a5,8000da9c <__sflush_r+0xc8>
8000da7c:	0004a683          	lw	a3,0(s1)
8000da80:	01d00793          	li	a5,29
8000da84:	0cd7e463          	bltu	a5,a3,8000db4c <__sflush_r+0x178>
8000da88:	204007b7          	lui	a5,0x20400
8000da8c:	00178793          	addi	a5,a5,1 # 20400001 <_stack_size+0x203ff801>
8000da90:	00d7d7b3          	srl	a5,a5,a3
8000da94:	0017f793          	andi	a5,a5,1
8000da98:	0a078a63          	beqz	a5,8000db4c <__sflush_r+0x178>
8000da9c:	01042783          	lw	a5,16(s0)
8000daa0:	00042223          	sw	zero,4(s0)
8000daa4:	00f42023          	sw	a5,0(s0)
8000daa8:	01371793          	slli	a5,a4,0x13
8000daac:	0007dc63          	bgez	a5,8000dac4 <__sflush_r+0xf0>
8000dab0:	fff00793          	li	a5,-1
8000dab4:	00f51663          	bne	a0,a5,8000dac0 <__sflush_r+0xec>
8000dab8:	0004a783          	lw	a5,0(s1)
8000dabc:	00079463          	bnez	a5,8000dac4 <__sflush_r+0xf0>
8000dac0:	04a42a23          	sw	a0,84(s0)
8000dac4:	03442583          	lw	a1,52(s0)
8000dac8:	0124a023          	sw	s2,0(s1)
8000dacc:	f40582e3          	beqz	a1,8000da10 <__sflush_r+0x3c>
8000dad0:	04440793          	addi	a5,s0,68
8000dad4:	00f58663          	beq	a1,a5,8000dae0 <__sflush_r+0x10c>
8000dad8:	00048513          	mv	a0,s1
8000dadc:	0d1000ef          	jal	ra,8000e3ac <_free_r>
8000dae0:	02042a23          	sw	zero,52(s0)
8000dae4:	f2dff06f          	j	8000da10 <__sflush_r+0x3c>
8000dae8:	02042583          	lw	a1,32(s0)
8000daec:	00100693          	li	a3,1
8000daf0:	00000613          	li	a2,0
8000daf4:	00048513          	mv	a0,s1
8000daf8:	000700e7          	jalr	a4
8000dafc:	fff00793          	li	a5,-1
8000db00:	f2f51ae3          	bne	a0,a5,8000da34 <__sflush_r+0x60>
8000db04:	0004a783          	lw	a5,0(s1)
8000db08:	f20786e3          	beqz	a5,8000da34 <__sflush_r+0x60>
8000db0c:	01d00713          	li	a4,29
8000db10:	00e78663          	beq	a5,a4,8000db1c <__sflush_r+0x148>
8000db14:	01600713          	li	a4,22
8000db18:	00e79663          	bne	a5,a4,8000db24 <__sflush_r+0x150>
8000db1c:	0124a023          	sw	s2,0(s1)
8000db20:	ef1ff06f          	j	8000da10 <__sflush_r+0x3c>
8000db24:	00c45783          	lhu	a5,12(s0)
8000db28:	0407e793          	ori	a5,a5,64
8000db2c:	00f41623          	sh	a5,12(s0)
8000db30:	01c12083          	lw	ra,28(sp)
8000db34:	01812403          	lw	s0,24(sp)
8000db38:	01412483          	lw	s1,20(sp)
8000db3c:	01012903          	lw	s2,16(sp)
8000db40:	00c12983          	lw	s3,12(sp)
8000db44:	02010113          	addi	sp,sp,32
8000db48:	00008067          	ret
8000db4c:	04076713          	ori	a4,a4,64
8000db50:	00e41623          	sh	a4,12(s0)
8000db54:	fddff06f          	j	8000db30 <__sflush_r+0x15c>
8000db58:	0105a983          	lw	s3,16(a1)
8000db5c:	ea098ae3          	beqz	s3,8000da10 <__sflush_r+0x3c>
8000db60:	0005a903          	lw	s2,0(a1)
8000db64:	0037f793          	andi	a5,a5,3
8000db68:	0135a023          	sw	s3,0(a1)
8000db6c:	41390933          	sub	s2,s2,s3
8000db70:	00000713          	li	a4,0
8000db74:	00079463          	bnez	a5,8000db7c <__sflush_r+0x1a8>
8000db78:	0145a703          	lw	a4,20(a1)
8000db7c:	00e42423          	sw	a4,8(s0)
8000db80:	e92058e3          	blez	s2,8000da10 <__sflush_r+0x3c>
8000db84:	02842783          	lw	a5,40(s0)
8000db88:	02042583          	lw	a1,32(s0)
8000db8c:	00090693          	mv	a3,s2
8000db90:	00098613          	mv	a2,s3
8000db94:	00048513          	mv	a0,s1
8000db98:	000780e7          	jalr	a5
8000db9c:	00a04c63          	bgtz	a0,8000dbb4 <__sflush_r+0x1e0>
8000dba0:	00c45783          	lhu	a5,12(s0)
8000dba4:	fff00513          	li	a0,-1
8000dba8:	0407e793          	ori	a5,a5,64
8000dbac:	00f41623          	sh	a5,12(s0)
8000dbb0:	f81ff06f          	j	8000db30 <__sflush_r+0x15c>
8000dbb4:	00a989b3          	add	s3,s3,a0
8000dbb8:	40a90933          	sub	s2,s2,a0
8000dbbc:	fc5ff06f          	j	8000db80 <__sflush_r+0x1ac>

Disassembly of section .text._fflush_r:

8000dbc0 <_fflush_r>:
8000dbc0:	0105a783          	lw	a5,16(a1)
8000dbc4:	08078a63          	beqz	a5,8000dc58 <_fflush_r+0x98>
8000dbc8:	fe010113          	addi	sp,sp,-32
8000dbcc:	00812c23          	sw	s0,24(sp)
8000dbd0:	00112e23          	sw	ra,28(sp)
8000dbd4:	00050413          	mv	s0,a0
8000dbd8:	00050c63          	beqz	a0,8000dbf0 <_fflush_r+0x30>
8000dbdc:	01852783          	lw	a5,24(a0) # f0050018 <_ram_heap_end+0x7003e018>
8000dbe0:	00079863          	bnez	a5,8000dbf0 <_fflush_r+0x30>
8000dbe4:	00b12623          	sw	a1,12(sp)
8000dbe8:	1c8000ef          	jal	ra,8000ddb0 <__sinit>
8000dbec:	00c12583          	lw	a1,12(sp)
8000dbf0:	ffff5797          	auipc	a5,0xffff5
8000dbf4:	28878793          	addi	a5,a5,648 # 80002e78 <__sf_fake_stdin>
8000dbf8:	02f59263          	bne	a1,a5,8000dc1c <_fflush_r+0x5c>
8000dbfc:	00442583          	lw	a1,4(s0)
8000dc00:	00c59783          	lh	a5,12(a1)
8000dc04:	04078063          	beqz	a5,8000dc44 <_fflush_r+0x84>
8000dc08:	00040513          	mv	a0,s0
8000dc0c:	01812403          	lw	s0,24(sp)
8000dc10:	01c12083          	lw	ra,28(sp)
8000dc14:	02010113          	addi	sp,sp,32
8000dc18:	dbdff06f          	j	8000d9d4 <__sflush_r>
8000dc1c:	ffff5797          	auipc	a5,0xffff5
8000dc20:	27c78793          	addi	a5,a5,636 # 80002e98 <__sf_fake_stdout>
8000dc24:	00f59663          	bne	a1,a5,8000dc30 <_fflush_r+0x70>
8000dc28:	00842583          	lw	a1,8(s0)
8000dc2c:	fd5ff06f          	j	8000dc00 <_fflush_r+0x40>
8000dc30:	ffff5797          	auipc	a5,0xffff5
8000dc34:	22878793          	addi	a5,a5,552 # 80002e58 <__sf_fake_stderr>
8000dc38:	fcf594e3          	bne	a1,a5,8000dc00 <_fflush_r+0x40>
8000dc3c:	00c42583          	lw	a1,12(s0)
8000dc40:	fc1ff06f          	j	8000dc00 <_fflush_r+0x40>
8000dc44:	01c12083          	lw	ra,28(sp)
8000dc48:	01812403          	lw	s0,24(sp)
8000dc4c:	00000513          	li	a0,0
8000dc50:	02010113          	addi	sp,sp,32
8000dc54:	00008067          	ret
8000dc58:	00000513          	li	a0,0
8000dc5c:	00008067          	ret

Disassembly of section .text.fflush:

8000dc60 <fflush>:
8000dc60:	00050593          	mv	a1,a0
8000dc64:	00051c63          	bnez	a0,8000dc7c <fflush+0x1c>
8000dc68:	c5018793          	addi	a5,gp,-944 # 800034d0 <_bss_end>
8000dc6c:	0007a503          	lw	a0,0(a5)
8000dc70:	00000597          	auipc	a1,0x0
8000dc74:	f5058593          	addi	a1,a1,-176 # 8000dbc0 <_fflush_r>
8000dc78:	4a80006f          	j	8000e120 <_fwalk_reent>
8000dc7c:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000dc80:	0007a503          	lw	a0,0(a5)
8000dc84:	f3dff06f          	j	8000dbc0 <_fflush_r>

Disassembly of section .text.__fp_lock:

8000dc88 <__fp_lock>:
8000dc88:	00000513          	li	a0,0
8000dc8c:	00008067          	ret

Disassembly of section .text.std:

8000dc90 <std>:
8000dc90:	ff010113          	addi	sp,sp,-16
8000dc94:	00812423          	sw	s0,8(sp)
8000dc98:	00112623          	sw	ra,12(sp)
8000dc9c:	00050413          	mv	s0,a0
8000dca0:	00b51623          	sh	a1,12(a0)
8000dca4:	00c51723          	sh	a2,14(a0)
8000dca8:	00052023          	sw	zero,0(a0)
8000dcac:	00052223          	sw	zero,4(a0)
8000dcb0:	00052423          	sw	zero,8(a0)
8000dcb4:	06052223          	sw	zero,100(a0)
8000dcb8:	00052823          	sw	zero,16(a0)
8000dcbc:	00052a23          	sw	zero,20(a0)
8000dcc0:	00052c23          	sw	zero,24(a0)
8000dcc4:	00800613          	li	a2,8
8000dcc8:	00000593          	li	a1,0
8000dccc:	05c50513          	addi	a0,a0,92
8000dcd0:	fc9fe0ef          	jal	ra,8000cc98 <memset>
8000dcd4:	00001797          	auipc	a5,0x1
8000dcd8:	df078793          	addi	a5,a5,-528 # 8000eac4 <__sread>
8000dcdc:	02f42223          	sw	a5,36(s0)
8000dce0:	00001797          	auipc	a5,0x1
8000dce4:	e3c78793          	addi	a5,a5,-452 # 8000eb1c <__swrite>
8000dce8:	02f42423          	sw	a5,40(s0)
8000dcec:	00001797          	auipc	a5,0x1
8000dcf0:	eb478793          	addi	a5,a5,-332 # 8000eba0 <__sseek>
8000dcf4:	02f42623          	sw	a5,44(s0)
8000dcf8:	00001797          	auipc	a5,0x1
8000dcfc:	f0078793          	addi	a5,a5,-256 # 8000ebf8 <__sclose>
8000dd00:	02842023          	sw	s0,32(s0)
8000dd04:	02f42823          	sw	a5,48(s0)
8000dd08:	00c12083          	lw	ra,12(sp)
8000dd0c:	00812403          	lw	s0,8(sp)
8000dd10:	01010113          	addi	sp,sp,16
8000dd14:	00008067          	ret

Disassembly of section .text._cleanup_r:

8000dd18 <_cleanup_r>:
8000dd18:	00000597          	auipc	a1,0x0
8000dd1c:	ea858593          	addi	a1,a1,-344 # 8000dbc0 <_fflush_r>
8000dd20:	4000006f          	j	8000e120 <_fwalk_reent>

Disassembly of section .text.__fp_unlock:

8000dd24 <__fp_unlock>:
8000dd24:	00000513          	li	a0,0
8000dd28:	00008067          	ret

Disassembly of section .text.__sfmoreglue:

8000dd2c <__sfmoreglue>:
8000dd2c:	ff010113          	addi	sp,sp,-16
8000dd30:	fff58613          	addi	a2,a1,-1
8000dd34:	00812423          	sw	s0,8(sp)
8000dd38:	00161413          	slli	s0,a2,0x1
8000dd3c:	00c40433          	add	s0,s0,a2
8000dd40:	00241413          	slli	s0,s0,0x2
8000dd44:	00c40433          	add	s0,s0,a2
8000dd48:	00341413          	slli	s0,s0,0x3
8000dd4c:	01212023          	sw	s2,0(sp)
8000dd50:	00058913          	mv	s2,a1
8000dd54:	07440593          	addi	a1,s0,116
8000dd58:	00912223          	sw	s1,4(sp)
8000dd5c:	00112623          	sw	ra,12(sp)
8000dd60:	750000ef          	jal	ra,8000e4b0 <_malloc_r>
8000dd64:	00050493          	mv	s1,a0
8000dd68:	02050063          	beqz	a0,8000dd88 <__sfmoreglue+0x5c>
8000dd6c:	00052023          	sw	zero,0(a0)
8000dd70:	01252223          	sw	s2,4(a0)
8000dd74:	00c50513          	addi	a0,a0,12
8000dd78:	00a4a423          	sw	a0,8(s1)
8000dd7c:	06840613          	addi	a2,s0,104
8000dd80:	00000593          	li	a1,0
8000dd84:	f15fe0ef          	jal	ra,8000cc98 <memset>
8000dd88:	00c12083          	lw	ra,12(sp)
8000dd8c:	00812403          	lw	s0,8(sp)
8000dd90:	00048513          	mv	a0,s1
8000dd94:	00012903          	lw	s2,0(sp)
8000dd98:	00412483          	lw	s1,4(sp)
8000dd9c:	01010113          	addi	sp,sp,16
8000dda0:	00008067          	ret

Disassembly of section .text._cleanup:

8000dda4 <_cleanup>:
8000dda4:	c5018793          	addi	a5,gp,-944 # 800034d0 <_bss_end>
8000dda8:	0007a503          	lw	a0,0(a5)
8000ddac:	f6dff06f          	j	8000dd18 <_cleanup_r>

Disassembly of section .text.__sinit:

8000ddb0 <__sinit>:
8000ddb0:	01852783          	lw	a5,24(a0)
8000ddb4:	0a079463          	bnez	a5,8000de5c <__sinit+0xac>
8000ddb8:	ff010113          	addi	sp,sp,-16
8000ddbc:	00112623          	sw	ra,12(sp)
8000ddc0:	00812423          	sw	s0,8(sp)
8000ddc4:	00000797          	auipc	a5,0x0
8000ddc8:	f5478793          	addi	a5,a5,-172 # 8000dd18 <_cleanup_r>
8000ddcc:	02f52423          	sw	a5,40(a0)
8000ddd0:	c5018793          	addi	a5,gp,-944 # 800034d0 <_bss_end>
8000ddd4:	0007a783          	lw	a5,0(a5)
8000ddd8:	04052423          	sw	zero,72(a0)
8000dddc:	04052623          	sw	zero,76(a0)
8000dde0:	04052823          	sw	zero,80(a0)
8000dde4:	00f51663          	bne	a0,a5,8000ddf0 <__sinit+0x40>
8000dde8:	00100793          	li	a5,1
8000ddec:	00f52c23          	sw	a5,24(a0)
8000ddf0:	00050413          	mv	s0,a0
8000ddf4:	06c000ef          	jal	ra,8000de60 <__sfp>
8000ddf8:	00a42223          	sw	a0,4(s0)
8000ddfc:	00040513          	mv	a0,s0
8000de00:	060000ef          	jal	ra,8000de60 <__sfp>
8000de04:	00a42423          	sw	a0,8(s0)
8000de08:	00040513          	mv	a0,s0
8000de0c:	054000ef          	jal	ra,8000de60 <__sfp>
8000de10:	00a42623          	sw	a0,12(s0)
8000de14:	00442503          	lw	a0,4(s0)
8000de18:	00000613          	li	a2,0
8000de1c:	00400593          	li	a1,4
8000de20:	e71ff0ef          	jal	ra,8000dc90 <std>
8000de24:	00842503          	lw	a0,8(s0)
8000de28:	00100613          	li	a2,1
8000de2c:	00900593          	li	a1,9
8000de30:	e61ff0ef          	jal	ra,8000dc90 <std>
8000de34:	00c42503          	lw	a0,12(s0)
8000de38:	00200613          	li	a2,2
8000de3c:	01200593          	li	a1,18
8000de40:	e51ff0ef          	jal	ra,8000dc90 <std>
8000de44:	00100793          	li	a5,1
8000de48:	00f42c23          	sw	a5,24(s0)
8000de4c:	00c12083          	lw	ra,12(sp)
8000de50:	00812403          	lw	s0,8(sp)
8000de54:	01010113          	addi	sp,sp,16
8000de58:	00008067          	ret
8000de5c:	00008067          	ret

Disassembly of section .text.__sfp:

8000de60 <__sfp>:
8000de60:	ff010113          	addi	sp,sp,-16
8000de64:	c5018793          	addi	a5,gp,-944 # 800034d0 <_bss_end>
8000de68:	00912223          	sw	s1,4(sp)
8000de6c:	0007a483          	lw	s1,0(a5)
8000de70:	01212023          	sw	s2,0(sp)
8000de74:	00112623          	sw	ra,12(sp)
8000de78:	0184a783          	lw	a5,24(s1)
8000de7c:	00812423          	sw	s0,8(sp)
8000de80:	00050913          	mv	s2,a0
8000de84:	00079663          	bnez	a5,8000de90 <__sfp+0x30>
8000de88:	00048513          	mv	a0,s1
8000de8c:	f25ff0ef          	jal	ra,8000ddb0 <__sinit>
8000de90:	04848493          	addi	s1,s1,72
8000de94:	0084a403          	lw	s0,8(s1)
8000de98:	0044a783          	lw	a5,4(s1)
8000de9c:	fff78793          	addi	a5,a5,-1
8000dea0:	0007da63          	bgez	a5,8000deb4 <__sfp+0x54>
8000dea4:	0004a783          	lw	a5,0(s1)
8000dea8:	08078063          	beqz	a5,8000df28 <__sfp+0xc8>
8000deac:	0004a483          	lw	s1,0(s1)
8000deb0:	fe5ff06f          	j	8000de94 <__sfp+0x34>
8000deb4:	00c41703          	lh	a4,12(s0)
8000deb8:	06071463          	bnez	a4,8000df20 <__sfp+0xc0>
8000debc:	ffff07b7          	lui	a5,0xffff0
8000dec0:	00178793          	addi	a5,a5,1 # ffff0001 <_ram_heap_end+0x7ffde001>
8000dec4:	06042223          	sw	zero,100(s0)
8000dec8:	00042023          	sw	zero,0(s0)
8000decc:	00042223          	sw	zero,4(s0)
8000ded0:	00042423          	sw	zero,8(s0)
8000ded4:	00f42623          	sw	a5,12(s0)
8000ded8:	00042823          	sw	zero,16(s0)
8000dedc:	00042a23          	sw	zero,20(s0)
8000dee0:	00042c23          	sw	zero,24(s0)
8000dee4:	00800613          	li	a2,8
8000dee8:	00000593          	li	a1,0
8000deec:	05c40513          	addi	a0,s0,92
8000def0:	da9fe0ef          	jal	ra,8000cc98 <memset>
8000def4:	02042a23          	sw	zero,52(s0)
8000def8:	02042c23          	sw	zero,56(s0)
8000defc:	04042423          	sw	zero,72(s0)
8000df00:	04042623          	sw	zero,76(s0)
8000df04:	00040513          	mv	a0,s0
8000df08:	00c12083          	lw	ra,12(sp)
8000df0c:	00812403          	lw	s0,8(sp)
8000df10:	00412483          	lw	s1,4(sp)
8000df14:	00012903          	lw	s2,0(sp)
8000df18:	01010113          	addi	sp,sp,16
8000df1c:	00008067          	ret
8000df20:	06840413          	addi	s0,s0,104
8000df24:	f79ff06f          	j	8000de9c <__sfp+0x3c>
8000df28:	00400593          	li	a1,4
8000df2c:	00090513          	mv	a0,s2
8000df30:	dfdff0ef          	jal	ra,8000dd2c <__sfmoreglue>
8000df34:	00a4a023          	sw	a0,0(s1)
8000df38:	00050413          	mv	s0,a0
8000df3c:	f60518e3          	bnez	a0,8000deac <__sfp+0x4c>
8000df40:	00c00793          	li	a5,12
8000df44:	00f92023          	sw	a5,0(s2)
8000df48:	fbdff06f          	j	8000df04 <__sfp+0xa4>

Disassembly of section .text.__sfp_lock_acquire:

8000df4c <__sfp_lock_acquire>:
8000df4c:	00008067          	ret

Disassembly of section .text.__sfp_lock_release:

8000df50 <__sfp_lock_release>:
8000df50:	00008067          	ret

Disassembly of section .text.__sinit_lock_acquire:

8000df54 <__sinit_lock_acquire>:
8000df54:	00008067          	ret

Disassembly of section .text.__sinit_lock_release:

8000df58 <__sinit_lock_release>:
8000df58:	00008067          	ret

Disassembly of section .text.__fp_lock_all:

8000df5c <__fp_lock_all>:
8000df5c:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000df60:	0007a503          	lw	a0,0(a5)
8000df64:	00000597          	auipc	a1,0x0
8000df68:	d2458593          	addi	a1,a1,-732 # 8000dc88 <__fp_lock>
8000df6c:	1140006f          	j	8000e080 <_fwalk>

Disassembly of section .text.__fp_unlock_all:

8000df70 <__fp_unlock_all>:
8000df70:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000df74:	0007a503          	lw	a0,0(a5)
8000df78:	00000597          	auipc	a1,0x0
8000df7c:	dac58593          	addi	a1,a1,-596 # 8000dd24 <__fp_unlock>
8000df80:	1000006f          	j	8000e080 <_fwalk>

Disassembly of section .text._fpurge_r:

8000df84 <_fpurge_r>:
8000df84:	ff010113          	addi	sp,sp,-16
8000df88:	00812423          	sw	s0,8(sp)
8000df8c:	00912223          	sw	s1,4(sp)
8000df90:	00112623          	sw	ra,12(sp)
8000df94:	00050493          	mv	s1,a0
8000df98:	00058413          	mv	s0,a1
8000df9c:	00050863          	beqz	a0,8000dfac <_fpurge_r+0x28>
8000dfa0:	01852783          	lw	a5,24(a0)
8000dfa4:	00079463          	bnez	a5,8000dfac <_fpurge_r+0x28>
8000dfa8:	e09ff0ef          	jal	ra,8000ddb0 <__sinit>
8000dfac:	ffff5797          	auipc	a5,0xffff5
8000dfb0:	ecc78793          	addi	a5,a5,-308 # 80002e78 <__sf_fake_stdin>
8000dfb4:	02f41863          	bne	s0,a5,8000dfe4 <_fpurge_r+0x60>
8000dfb8:	0044a403          	lw	s0,4(s1)
8000dfbc:	00c41783          	lh	a5,12(s0)
8000dfc0:	04079663          	bnez	a5,8000e00c <_fpurge_r+0x88>
8000dfc4:	00900793          	li	a5,9
8000dfc8:	00f4a023          	sw	a5,0(s1)
8000dfcc:	fff00513          	li	a0,-1
8000dfd0:	00c12083          	lw	ra,12(sp)
8000dfd4:	00812403          	lw	s0,8(sp)
8000dfd8:	00412483          	lw	s1,4(sp)
8000dfdc:	01010113          	addi	sp,sp,16
8000dfe0:	00008067          	ret
8000dfe4:	ffff5797          	auipc	a5,0xffff5
8000dfe8:	eb478793          	addi	a5,a5,-332 # 80002e98 <__sf_fake_stdout>
8000dfec:	00f41663          	bne	s0,a5,8000dff8 <_fpurge_r+0x74>
8000dff0:	0084a403          	lw	s0,8(s1)
8000dff4:	fc9ff06f          	j	8000dfbc <_fpurge_r+0x38>
8000dff8:	ffff5797          	auipc	a5,0xffff5
8000dffc:	e6078793          	addi	a5,a5,-416 # 80002e58 <__sf_fake_stderr>
8000e000:	faf41ee3          	bne	s0,a5,8000dfbc <_fpurge_r+0x38>
8000e004:	00c4a403          	lw	s0,12(s1)
8000e008:	fb5ff06f          	j	8000dfbc <_fpurge_r+0x38>
8000e00c:	01042703          	lw	a4,16(s0)
8000e010:	00e42023          	sw	a4,0(s0)
8000e014:	0087f713          	andi	a4,a5,8
8000e018:	02071863          	bnez	a4,8000e048 <_fpurge_r+0xc4>
8000e01c:	03442583          	lw	a1,52(s0)
8000e020:	00042223          	sw	zero,4(s0)
8000e024:	00000513          	li	a0,0
8000e028:	fa0584e3          	beqz	a1,8000dfd0 <_fpurge_r+0x4c>
8000e02c:	04440793          	addi	a5,s0,68
8000e030:	00f58663          	beq	a1,a5,8000e03c <_fpurge_r+0xb8>
8000e034:	00048513          	mv	a0,s1
8000e038:	374000ef          	jal	ra,8000e3ac <_free_r>
8000e03c:	02042a23          	sw	zero,52(s0)
8000e040:	00000513          	li	a0,0
8000e044:	f8dff06f          	j	8000dfd0 <_fpurge_r+0x4c>
8000e048:	0037f793          	andi	a5,a5,3
8000e04c:	00000713          	li	a4,0
8000e050:	00079463          	bnez	a5,8000e058 <_fpurge_r+0xd4>
8000e054:	01442703          	lw	a4,20(s0)
8000e058:	00e42423          	sw	a4,8(s0)
8000e05c:	fe5ff06f          	j	8000e040 <_fpurge_r+0xbc>

Disassembly of section .text.fpurge:

8000e060 <fpurge>:
8000e060:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000e064:	00050593          	mv	a1,a0
8000e068:	0007a503          	lw	a0,0(a5)
8000e06c:	f19ff06f          	j	8000df84 <_fpurge_r>

Disassembly of section .text.__fpurge:

8000e070 <__fpurge>:
8000e070:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000e074:	00050593          	mv	a1,a0
8000e078:	0007a503          	lw	a0,0(a5)
8000e07c:	f09ff06f          	j	8000df84 <_fpurge_r>

Disassembly of section .text._fwalk:

8000e080 <_fwalk>:
8000e080:	fd010113          	addi	sp,sp,-48
8000e084:	02812423          	sw	s0,40(sp)
8000e088:	03212023          	sw	s2,32(sp)
8000e08c:	01412c23          	sw	s4,24(sp)
8000e090:	01512a23          	sw	s5,20(sp)
8000e094:	02112623          	sw	ra,44(sp)
8000e098:	02912223          	sw	s1,36(sp)
8000e09c:	01312e23          	sw	s3,28(sp)
8000e0a0:	04850413          	addi	s0,a0,72
8000e0a4:	00000913          	li	s2,0
8000e0a8:	00100a13          	li	s4,1
8000e0ac:	fff00a93          	li	s5,-1
8000e0b0:	02041663          	bnez	s0,8000e0dc <_fwalk+0x5c>
8000e0b4:	02c12083          	lw	ra,44(sp)
8000e0b8:	02812403          	lw	s0,40(sp)
8000e0bc:	00090513          	mv	a0,s2
8000e0c0:	02412483          	lw	s1,36(sp)
8000e0c4:	02012903          	lw	s2,32(sp)
8000e0c8:	01c12983          	lw	s3,28(sp)
8000e0cc:	01812a03          	lw	s4,24(sp)
8000e0d0:	01412a83          	lw	s5,20(sp)
8000e0d4:	03010113          	addi	sp,sp,48
8000e0d8:	00008067          	ret
8000e0dc:	00842483          	lw	s1,8(s0)
8000e0e0:	00442983          	lw	s3,4(s0)
8000e0e4:	fff98993          	addi	s3,s3,-1
8000e0e8:	0009d663          	bgez	s3,8000e0f4 <_fwalk+0x74>
8000e0ec:	00042403          	lw	s0,0(s0)
8000e0f0:	fc1ff06f          	j	8000e0b0 <_fwalk+0x30>
8000e0f4:	00c4d783          	lhu	a5,12(s1)
8000e0f8:	02fa7063          	bgeu	s4,a5,8000e118 <_fwalk+0x98>
8000e0fc:	00e49783          	lh	a5,14(s1)
8000e100:	01578c63          	beq	a5,s5,8000e118 <_fwalk+0x98>
8000e104:	00048513          	mv	a0,s1
8000e108:	00b12623          	sw	a1,12(sp)
8000e10c:	000580e7          	jalr	a1
8000e110:	00c12583          	lw	a1,12(sp)
8000e114:	00a96933          	or	s2,s2,a0
8000e118:	06848493          	addi	s1,s1,104
8000e11c:	fc9ff06f          	j	8000e0e4 <_fwalk+0x64>

Disassembly of section .text._fwalk_reent:

8000e120 <_fwalk_reent>:
8000e120:	fd010113          	addi	sp,sp,-48
8000e124:	02812423          	sw	s0,40(sp)
8000e128:	03212023          	sw	s2,32(sp)
8000e12c:	01412c23          	sw	s4,24(sp)
8000e130:	01512a23          	sw	s5,20(sp)
8000e134:	01612823          	sw	s6,16(sp)
8000e138:	01712623          	sw	s7,12(sp)
8000e13c:	02112623          	sw	ra,44(sp)
8000e140:	02912223          	sw	s1,36(sp)
8000e144:	01312e23          	sw	s3,28(sp)
8000e148:	00050a13          	mv	s4,a0
8000e14c:	00058a93          	mv	s5,a1
8000e150:	04850413          	addi	s0,a0,72
8000e154:	00000913          	li	s2,0
8000e158:	00100b13          	li	s6,1
8000e15c:	fff00b93          	li	s7,-1
8000e160:	02041a63          	bnez	s0,8000e194 <_fwalk_reent+0x74>
8000e164:	02c12083          	lw	ra,44(sp)
8000e168:	02812403          	lw	s0,40(sp)
8000e16c:	00090513          	mv	a0,s2
8000e170:	02412483          	lw	s1,36(sp)
8000e174:	02012903          	lw	s2,32(sp)
8000e178:	01c12983          	lw	s3,28(sp)
8000e17c:	01812a03          	lw	s4,24(sp)
8000e180:	01412a83          	lw	s5,20(sp)
8000e184:	01012b03          	lw	s6,16(sp)
8000e188:	00c12b83          	lw	s7,12(sp)
8000e18c:	03010113          	addi	sp,sp,48
8000e190:	00008067          	ret
8000e194:	00842483          	lw	s1,8(s0)
8000e198:	00442983          	lw	s3,4(s0)
8000e19c:	fff98993          	addi	s3,s3,-1
8000e1a0:	0009d663          	bgez	s3,8000e1ac <_fwalk_reent+0x8c>
8000e1a4:	00042403          	lw	s0,0(s0)
8000e1a8:	fb9ff06f          	j	8000e160 <_fwalk_reent+0x40>
8000e1ac:	00c4d783          	lhu	a5,12(s1)
8000e1b0:	00fb7e63          	bgeu	s6,a5,8000e1cc <_fwalk_reent+0xac>
8000e1b4:	00e49783          	lh	a5,14(s1)
8000e1b8:	01778a63          	beq	a5,s7,8000e1cc <_fwalk_reent+0xac>
8000e1bc:	00048593          	mv	a1,s1
8000e1c0:	000a0513          	mv	a0,s4
8000e1c4:	000a80e7          	jalr	s5
8000e1c8:	00a96933          	or	s2,s2,a0
8000e1cc:	06848493          	addi	s1,s1,104
8000e1d0:	fcdff06f          	j	8000e19c <_fwalk_reent+0x7c>

Disassembly of section .text.malloc:

8000e1d4 <malloc>:
8000e1d4:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000e1d8:	00050593          	mv	a1,a0
8000e1dc:	0007a503          	lw	a0,0(a5)
8000e1e0:	2d00006f          	j	8000e4b0 <_malloc_r>

Disassembly of section .text.free:

8000e1e4 <free>:
8000e1e4:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000e1e8:	00050593          	mv	a1,a0
8000e1ec:	0007a503          	lw	a0,0(a5)
8000e1f0:	1bc0006f          	j	8000e3ac <_free_r>

Disassembly of section .text.memcmp:

8000e1f4 <memcmp>:
8000e1f4:	00000713          	li	a4,0
8000e1f8:	00e61663          	bne	a2,a4,8000e204 <memcmp+0x10>
8000e1fc:	00000513          	li	a0,0
8000e200:	00008067          	ret
8000e204:	00e507b3          	add	a5,a0,a4
8000e208:	00170713          	addi	a4,a4,1
8000e20c:	00e586b3          	add	a3,a1,a4
8000e210:	0007c783          	lbu	a5,0(a5)
8000e214:	fff6c683          	lbu	a3,-1(a3)
8000e218:	fed780e3          	beq	a5,a3,8000e1f8 <memcmp+0x4>
8000e21c:	40d78533          	sub	a0,a5,a3
8000e220:	00008067          	ret

Disassembly of section .text.memcpy:

8000e224 <memcpy>:
8000e224:	00a5c7b3          	xor	a5,a1,a0
8000e228:	0037f793          	andi	a5,a5,3
8000e22c:	00c50733          	add	a4,a0,a2
8000e230:	00079663          	bnez	a5,8000e23c <memcpy+0x18>
8000e234:	00300793          	li	a5,3
8000e238:	02c7e263          	bltu	a5,a2,8000e25c <memcpy+0x38>
8000e23c:	00050793          	mv	a5,a0
8000e240:	0ae57c63          	bgeu	a0,a4,8000e2f8 <memcpy+0xd4>
8000e244:	0005c683          	lbu	a3,0(a1)
8000e248:	00178793          	addi	a5,a5,1
8000e24c:	00158593          	addi	a1,a1,1
8000e250:	fed78fa3          	sb	a3,-1(a5)
8000e254:	fee7e8e3          	bltu	a5,a4,8000e244 <memcpy+0x20>
8000e258:	00008067          	ret
8000e25c:	00357693          	andi	a3,a0,3
8000e260:	00050793          	mv	a5,a0
8000e264:	00068e63          	beqz	a3,8000e280 <memcpy+0x5c>
8000e268:	0005c683          	lbu	a3,0(a1)
8000e26c:	00178793          	addi	a5,a5,1
8000e270:	00158593          	addi	a1,a1,1
8000e274:	fed78fa3          	sb	a3,-1(a5)
8000e278:	0037f693          	andi	a3,a5,3
8000e27c:	fe9ff06f          	j	8000e264 <memcpy+0x40>
8000e280:	ffc77693          	andi	a3,a4,-4
8000e284:	fe068613          	addi	a2,a3,-32
8000e288:	06c7f463          	bgeu	a5,a2,8000e2f0 <memcpy+0xcc>
8000e28c:	0005a383          	lw	t2,0(a1)
8000e290:	0045a283          	lw	t0,4(a1)
8000e294:	0085af83          	lw	t6,8(a1)
8000e298:	00c5af03          	lw	t5,12(a1)
8000e29c:	0105ae83          	lw	t4,16(a1)
8000e2a0:	0145ae03          	lw	t3,20(a1)
8000e2a4:	0185a303          	lw	t1,24(a1)
8000e2a8:	01c5a883          	lw	a7,28(a1)
8000e2ac:	02458593          	addi	a1,a1,36
8000e2b0:	0077a023          	sw	t2,0(a5)
8000e2b4:	ffc5a803          	lw	a6,-4(a1)
8000e2b8:	0057a223          	sw	t0,4(a5)
8000e2bc:	01f7a423          	sw	t6,8(a5)
8000e2c0:	01e7a623          	sw	t5,12(a5)
8000e2c4:	01d7a823          	sw	t4,16(a5)
8000e2c8:	01c7aa23          	sw	t3,20(a5)
8000e2cc:	0067ac23          	sw	t1,24(a5)
8000e2d0:	0117ae23          	sw	a7,28(a5)
8000e2d4:	02478793          	addi	a5,a5,36
8000e2d8:	ff07ae23          	sw	a6,-4(a5)
8000e2dc:	fadff06f          	j	8000e288 <memcpy+0x64>
8000e2e0:	0005a603          	lw	a2,0(a1)
8000e2e4:	00478793          	addi	a5,a5,4
8000e2e8:	00458593          	addi	a1,a1,4
8000e2ec:	fec7ae23          	sw	a2,-4(a5)
8000e2f0:	fed7e8e3          	bltu	a5,a3,8000e2e0 <memcpy+0xbc>
8000e2f4:	f4e7e8e3          	bltu	a5,a4,8000e244 <memcpy+0x20>
8000e2f8:	00008067          	ret

Disassembly of section .text.memmove:

8000e2fc <memmove>:
8000e2fc:	04a5fa63          	bgeu	a1,a0,8000e350 <memmove+0x54>
8000e300:	00c586b3          	add	a3,a1,a2
8000e304:	04d57663          	bgeu	a0,a3,8000e350 <memmove+0x54>
8000e308:	fff64593          	not	a1,a2
8000e30c:	00000793          	li	a5,0
8000e310:	fff78793          	addi	a5,a5,-1
8000e314:	00f59463          	bne	a1,a5,8000e31c <memmove+0x20>
8000e318:	00008067          	ret
8000e31c:	00f68733          	add	a4,a3,a5
8000e320:	00074803          	lbu	a6,0(a4)
8000e324:	00c78733          	add	a4,a5,a2
8000e328:	00e50733          	add	a4,a0,a4
8000e32c:	01070023          	sb	a6,0(a4)
8000e330:	fe1ff06f          	j	8000e310 <memmove+0x14>
8000e334:	00f58733          	add	a4,a1,a5
8000e338:	00074683          	lbu	a3,0(a4)
8000e33c:	00f50733          	add	a4,a0,a5
8000e340:	00178793          	addi	a5,a5,1
8000e344:	00d70023          	sb	a3,0(a4)
8000e348:	fef616e3          	bne	a2,a5,8000e334 <memmove+0x38>
8000e34c:	00008067          	ret
8000e350:	00000793          	li	a5,0
8000e354:	ff5ff06f          	j	8000e348 <memmove+0x4c>

Disassembly of section .text._calloc_r:

8000e358 <_calloc_r>:
8000e358:	fe010113          	addi	sp,sp,-32
8000e35c:	00812c23          	sw	s0,24(sp)
8000e360:	00050413          	mv	s0,a0
8000e364:	00058513          	mv	a0,a1
8000e368:	00060593          	mv	a1,a2
8000e36c:	00112e23          	sw	ra,28(sp)
8000e370:	80cff0ef          	jal	ra,8000d37c <__mulsi3>
8000e374:	00050593          	mv	a1,a0
8000e378:	00a12623          	sw	a0,12(sp)
8000e37c:	00040513          	mv	a0,s0
8000e380:	130000ef          	jal	ra,8000e4b0 <_malloc_r>
8000e384:	00050413          	mv	s0,a0
8000e388:	00050863          	beqz	a0,8000e398 <_calloc_r+0x40>
8000e38c:	00c12603          	lw	a2,12(sp)
8000e390:	00000593          	li	a1,0
8000e394:	905fe0ef          	jal	ra,8000cc98 <memset>
8000e398:	00040513          	mv	a0,s0
8000e39c:	01c12083          	lw	ra,28(sp)
8000e3a0:	01812403          	lw	s0,24(sp)
8000e3a4:	02010113          	addi	sp,sp,32
8000e3a8:	00008067          	ret

Disassembly of section .text._free_r:

8000e3ac <_free_r>:
8000e3ac:	10058063          	beqz	a1,8000e4ac <_free_r+0x100>
8000e3b0:	ffc5a783          	lw	a5,-4(a1)
8000e3b4:	ff010113          	addi	sp,sp,-16
8000e3b8:	00812423          	sw	s0,8(sp)
8000e3bc:	00112623          	sw	ra,12(sp)
8000e3c0:	00912223          	sw	s1,4(sp)
8000e3c4:	ffc58413          	addi	s0,a1,-4
8000e3c8:	0007d463          	bgez	a5,8000e3d0 <_free_r+0x24>
8000e3cc:	00f40433          	add	s0,s0,a5
8000e3d0:	00050493          	mv	s1,a0
8000e3d4:	fecf70ef          	jal	ra,80005bc0 <__malloc_lock>
8000e3d8:	8fc18793          	addi	a5,gp,-1796 # 8000317c <__malloc_free_list>
8000e3dc:	0007a783          	lw	a5,0(a5)
8000e3e0:	02079263          	bnez	a5,8000e404 <_free_r+0x58>
8000e3e4:	00042223          	sw	zero,4(s0)
8000e3e8:	8e81ae23          	sw	s0,-1796(gp) # 8000317c <__malloc_free_list>
8000e3ec:	00812403          	lw	s0,8(sp)
8000e3f0:	00c12083          	lw	ra,12(sp)
8000e3f4:	00048513          	mv	a0,s1
8000e3f8:	00412483          	lw	s1,4(sp)
8000e3fc:	01010113          	addi	sp,sp,16
8000e400:	fc4f706f          	j	80005bc4 <__malloc_unlock>
8000e404:	02f47663          	bgeu	s0,a5,8000e430 <_free_r+0x84>
8000e408:	00042683          	lw	a3,0(s0)
8000e40c:	00d40733          	add	a4,s0,a3
8000e410:	00e79a63          	bne	a5,a4,8000e424 <_free_r+0x78>
8000e414:	0007a703          	lw	a4,0(a5)
8000e418:	0047a783          	lw	a5,4(a5)
8000e41c:	00d70733          	add	a4,a4,a3
8000e420:	00e42023          	sw	a4,0(s0)
8000e424:	00f42223          	sw	a5,4(s0)
8000e428:	fc1ff06f          	j	8000e3e8 <_free_r+0x3c>
8000e42c:	00070793          	mv	a5,a4
8000e430:	0047a703          	lw	a4,4(a5)
8000e434:	00070463          	beqz	a4,8000e43c <_free_r+0x90>
8000e438:	fee47ae3          	bgeu	s0,a4,8000e42c <_free_r+0x80>
8000e43c:	0007a683          	lw	a3,0(a5)
8000e440:	00d78633          	add	a2,a5,a3
8000e444:	02861863          	bne	a2,s0,8000e474 <_free_r+0xc8>
8000e448:	00042603          	lw	a2,0(s0)
8000e44c:	00c686b3          	add	a3,a3,a2
8000e450:	00d7a023          	sw	a3,0(a5)
8000e454:	00d78633          	add	a2,a5,a3
8000e458:	f8c71ae3          	bne	a4,a2,8000e3ec <_free_r+0x40>
8000e45c:	00072603          	lw	a2,0(a4)
8000e460:	00472703          	lw	a4,4(a4)
8000e464:	00d606b3          	add	a3,a2,a3
8000e468:	00d7a023          	sw	a3,0(a5)
8000e46c:	00e7a223          	sw	a4,4(a5)
8000e470:	f7dff06f          	j	8000e3ec <_free_r+0x40>
8000e474:	00c47863          	bgeu	s0,a2,8000e484 <_free_r+0xd8>
8000e478:	00c00793          	li	a5,12
8000e47c:	00f4a023          	sw	a5,0(s1)
8000e480:	f6dff06f          	j	8000e3ec <_free_r+0x40>
8000e484:	00042603          	lw	a2,0(s0)
8000e488:	00c406b3          	add	a3,s0,a2
8000e48c:	00d71a63          	bne	a4,a3,8000e4a0 <_free_r+0xf4>
8000e490:	00072683          	lw	a3,0(a4)
8000e494:	00472703          	lw	a4,4(a4)
8000e498:	00c686b3          	add	a3,a3,a2
8000e49c:	00d42023          	sw	a3,0(s0)
8000e4a0:	00e42223          	sw	a4,4(s0)
8000e4a4:	0087a223          	sw	s0,4(a5)
8000e4a8:	f45ff06f          	j	8000e3ec <_free_r+0x40>
8000e4ac:	00008067          	ret

Disassembly of section .text._malloc_r:

8000e4b0 <_malloc_r>:
8000e4b0:	fe010113          	addi	sp,sp,-32
8000e4b4:	00912a23          	sw	s1,20(sp)
8000e4b8:	00358493          	addi	s1,a1,3
8000e4bc:	ffc4f493          	andi	s1,s1,-4
8000e4c0:	00112e23          	sw	ra,28(sp)
8000e4c4:	00812c23          	sw	s0,24(sp)
8000e4c8:	01212823          	sw	s2,16(sp)
8000e4cc:	01312623          	sw	s3,12(sp)
8000e4d0:	00848493          	addi	s1,s1,8
8000e4d4:	00c00793          	li	a5,12
8000e4d8:	06f4f463          	bgeu	s1,a5,8000e540 <_malloc_r+0x90>
8000e4dc:	00c00493          	li	s1,12
8000e4e0:	06b4e263          	bltu	s1,a1,8000e544 <_malloc_r+0x94>
8000e4e4:	00050913          	mv	s2,a0
8000e4e8:	ed8f70ef          	jal	ra,80005bc0 <__malloc_lock>
8000e4ec:	8fc18793          	addi	a5,gp,-1796 # 8000317c <__malloc_free_list>
8000e4f0:	0007a703          	lw	a4,0(a5)
8000e4f4:	00070413          	mv	s0,a4
8000e4f8:	06041a63          	bnez	s0,8000e56c <_malloc_r+0xbc>
8000e4fc:	90018793          	addi	a5,gp,-1792 # 80003180 <__malloc_sbrk_start>
8000e500:	0007a783          	lw	a5,0(a5)
8000e504:	00079a63          	bnez	a5,8000e518 <_malloc_r+0x68>
8000e508:	00000593          	li	a1,0
8000e50c:	00090513          	mv	a0,s2
8000e510:	330000ef          	jal	ra,8000e840 <_sbrk_r>
8000e514:	90a1a023          	sw	a0,-1792(gp) # 80003180 <__malloc_sbrk_start>
8000e518:	00048593          	mv	a1,s1
8000e51c:	00090513          	mv	a0,s2
8000e520:	320000ef          	jal	ra,8000e840 <_sbrk_r>
8000e524:	fff00993          	li	s3,-1
8000e528:	0b351a63          	bne	a0,s3,8000e5dc <_malloc_r+0x12c>
8000e52c:	00c00793          	li	a5,12
8000e530:	00f92023          	sw	a5,0(s2)
8000e534:	00090513          	mv	a0,s2
8000e538:	e8cf70ef          	jal	ra,80005bc4 <__malloc_unlock>
8000e53c:	0100006f          	j	8000e54c <_malloc_r+0x9c>
8000e540:	fa04d0e3          	bgez	s1,8000e4e0 <_malloc_r+0x30>
8000e544:	00c00793          	li	a5,12
8000e548:	00f52023          	sw	a5,0(a0)
8000e54c:	00000513          	li	a0,0
8000e550:	01c12083          	lw	ra,28(sp)
8000e554:	01812403          	lw	s0,24(sp)
8000e558:	01412483          	lw	s1,20(sp)
8000e55c:	01012903          	lw	s2,16(sp)
8000e560:	00c12983          	lw	s3,12(sp)
8000e564:	02010113          	addi	sp,sp,32
8000e568:	00008067          	ret
8000e56c:	00042783          	lw	a5,0(s0)
8000e570:	409787b3          	sub	a5,a5,s1
8000e574:	0407ce63          	bltz	a5,8000e5d0 <_malloc_r+0x120>
8000e578:	00b00693          	li	a3,11
8000e57c:	00f6fa63          	bgeu	a3,a5,8000e590 <_malloc_r+0xe0>
8000e580:	00f42023          	sw	a5,0(s0)
8000e584:	00f40433          	add	s0,s0,a5
8000e588:	00942023          	sw	s1,0(s0)
8000e58c:	0100006f          	j	8000e59c <_malloc_r+0xec>
8000e590:	00442783          	lw	a5,4(s0)
8000e594:	02871a63          	bne	a4,s0,8000e5c8 <_malloc_r+0x118>
8000e598:	8ef1ae23          	sw	a5,-1796(gp) # 8000317c <__malloc_free_list>
8000e59c:	00090513          	mv	a0,s2
8000e5a0:	e24f70ef          	jal	ra,80005bc4 <__malloc_unlock>
8000e5a4:	00b40513          	addi	a0,s0,11
8000e5a8:	00440793          	addi	a5,s0,4
8000e5ac:	ff857513          	andi	a0,a0,-8
8000e5b0:	40f50733          	sub	a4,a0,a5
8000e5b4:	f8070ee3          	beqz	a4,8000e550 <_malloc_r+0xa0>
8000e5b8:	00e40433          	add	s0,s0,a4
8000e5bc:	40a787b3          	sub	a5,a5,a0
8000e5c0:	00f42023          	sw	a5,0(s0)
8000e5c4:	f8dff06f          	j	8000e550 <_malloc_r+0xa0>
8000e5c8:	00f72223          	sw	a5,4(a4)
8000e5cc:	fd1ff06f          	j	8000e59c <_malloc_r+0xec>
8000e5d0:	00040713          	mv	a4,s0
8000e5d4:	00442403          	lw	s0,4(s0)
8000e5d8:	f21ff06f          	j	8000e4f8 <_malloc_r+0x48>
8000e5dc:	00350413          	addi	s0,a0,3
8000e5e0:	ffc47413          	andi	s0,s0,-4
8000e5e4:	fa8502e3          	beq	a0,s0,8000e588 <_malloc_r+0xd8>
8000e5e8:	40a405b3          	sub	a1,s0,a0
8000e5ec:	00090513          	mv	a0,s2
8000e5f0:	250000ef          	jal	ra,8000e840 <_sbrk_r>
8000e5f4:	f9351ae3          	bne	a0,s3,8000e588 <_malloc_r+0xd8>
8000e5f8:	f35ff06f          	j	8000e52c <_malloc_r+0x7c>

Disassembly of section .text._printf_r:

8000e5fc <_iprintf_r>:
8000e5fc:	fb010113          	addi	sp,sp,-80
8000e600:	02812423          	sw	s0,40(sp)
8000e604:	02112623          	sw	ra,44(sp)
8000e608:	02c12c23          	sw	a2,56(sp)
8000e60c:	02d12e23          	sw	a3,60(sp)
8000e610:	04e12023          	sw	a4,64(sp)
8000e614:	04f12223          	sw	a5,68(sp)
8000e618:	05012423          	sw	a6,72(sp)
8000e61c:	05112623          	sw	a7,76(sp)
8000e620:	00050413          	mv	s0,a0
8000e624:	00050c63          	beqz	a0,8000e63c <_iprintf_r+0x40>
8000e628:	01852783          	lw	a5,24(a0)
8000e62c:	00079863          	bnez	a5,8000e63c <_iprintf_r+0x40>
8000e630:	00b12623          	sw	a1,12(sp)
8000e634:	f7cff0ef          	jal	ra,8000ddb0 <__sinit>
8000e638:	00c12583          	lw	a1,12(sp)
8000e63c:	00058613          	mv	a2,a1
8000e640:	00842583          	lw	a1,8(s0)
8000e644:	03810693          	addi	a3,sp,56
8000e648:	00040513          	mv	a0,s0
8000e64c:	00d12e23          	sw	a3,28(sp)
8000e650:	2b5010ef          	jal	ra,80010104 <_vfiprintf_r>
8000e654:	02c12083          	lw	ra,44(sp)
8000e658:	02812403          	lw	s0,40(sp)
8000e65c:	05010113          	addi	sp,sp,80
8000e660:	00008067          	ret

Disassembly of section .text.printf:

8000e664 <iprintf>:
8000e664:	fc010113          	addi	sp,sp,-64
8000e668:	02f12a23          	sw	a5,52(sp)
8000e66c:	02b12223          	sw	a1,36(sp)
8000e670:	02c12423          	sw	a2,40(sp)
8000e674:	02d12623          	sw	a3,44(sp)
8000e678:	02e12823          	sw	a4,48(sp)
8000e67c:	03012c23          	sw	a6,56(sp)
8000e680:	03112e23          	sw	a7,60(sp)
8000e684:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000e688:	00812c23          	sw	s0,24(sp)
8000e68c:	0007a403          	lw	s0,0(a5)
8000e690:	00912a23          	sw	s1,20(sp)
8000e694:	00112e23          	sw	ra,28(sp)
8000e698:	00050493          	mv	s1,a0
8000e69c:	00040a63          	beqz	s0,8000e6b0 <iprintf+0x4c>
8000e6a0:	01842783          	lw	a5,24(s0)
8000e6a4:	00079663          	bnez	a5,8000e6b0 <iprintf+0x4c>
8000e6a8:	00040513          	mv	a0,s0
8000e6ac:	f04ff0ef          	jal	ra,8000ddb0 <__sinit>
8000e6b0:	00842583          	lw	a1,8(s0)
8000e6b4:	02410693          	addi	a3,sp,36
8000e6b8:	00048613          	mv	a2,s1
8000e6bc:	00040513          	mv	a0,s0
8000e6c0:	00d12623          	sw	a3,12(sp)
8000e6c4:	241010ef          	jal	ra,80010104 <_vfiprintf_r>
8000e6c8:	01c12083          	lw	ra,28(sp)
8000e6cc:	01812403          	lw	s0,24(sp)
8000e6d0:	01412483          	lw	s1,20(sp)
8000e6d4:	04010113          	addi	sp,sp,64
8000e6d8:	00008067          	ret

Disassembly of section .text._putchar_r:

8000e6dc <_putchar_r>:
8000e6dc:	fe010113          	addi	sp,sp,-32
8000e6e0:	00812c23          	sw	s0,24(sp)
8000e6e4:	00112e23          	sw	ra,28(sp)
8000e6e8:	00050413          	mv	s0,a0
8000e6ec:	00050c63          	beqz	a0,8000e704 <_putchar_r+0x28>
8000e6f0:	01852783          	lw	a5,24(a0)
8000e6f4:	00079863          	bnez	a5,8000e704 <_putchar_r+0x28>
8000e6f8:	00b12623          	sw	a1,12(sp)
8000e6fc:	eb4ff0ef          	jal	ra,8000ddb0 <__sinit>
8000e700:	00c12583          	lw	a1,12(sp)
8000e704:	00842603          	lw	a2,8(s0)
8000e708:	00040513          	mv	a0,s0
8000e70c:	01812403          	lw	s0,24(sp)
8000e710:	01c12083          	lw	ra,28(sp)
8000e714:	02010113          	addi	sp,sp,32
8000e718:	0500006f          	j	8000e768 <_putc_r>

Disassembly of section .text.putchar:

8000e71c <putchar>:
8000e71c:	fe010113          	addi	sp,sp,-32
8000e720:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000e724:	00812c23          	sw	s0,24(sp)
8000e728:	0007a403          	lw	s0,0(a5)
8000e72c:	00112e23          	sw	ra,28(sp)
8000e730:	00050593          	mv	a1,a0
8000e734:	00040e63          	beqz	s0,8000e750 <putchar+0x34>
8000e738:	01842783          	lw	a5,24(s0)
8000e73c:	00079a63          	bnez	a5,8000e750 <putchar+0x34>
8000e740:	00a12623          	sw	a0,12(sp)
8000e744:	00040513          	mv	a0,s0
8000e748:	e68ff0ef          	jal	ra,8000ddb0 <__sinit>
8000e74c:	00c12583          	lw	a1,12(sp)
8000e750:	00842603          	lw	a2,8(s0)
8000e754:	00040513          	mv	a0,s0
8000e758:	01812403          	lw	s0,24(sp)
8000e75c:	01c12083          	lw	ra,28(sp)
8000e760:	02010113          	addi	sp,sp,32
8000e764:	0040006f          	j	8000e768 <_putc_r>

Disassembly of section .text._putc_r:

8000e768 <_putc_r>:
8000e768:	fe010113          	addi	sp,sp,-32
8000e76c:	00812c23          	sw	s0,24(sp)
8000e770:	00112e23          	sw	ra,28(sp)
8000e774:	00050413          	mv	s0,a0
8000e778:	02050063          	beqz	a0,8000e798 <_putc_r+0x30>
8000e77c:	01852783          	lw	a5,24(a0)
8000e780:	00079c63          	bnez	a5,8000e798 <_putc_r+0x30>
8000e784:	00c12623          	sw	a2,12(sp)
8000e788:	00b12423          	sw	a1,8(sp)
8000e78c:	e24ff0ef          	jal	ra,8000ddb0 <__sinit>
8000e790:	00c12603          	lw	a2,12(sp)
8000e794:	00812583          	lw	a1,8(sp)
8000e798:	ffff4797          	auipc	a5,0xffff4
8000e79c:	6e078793          	addi	a5,a5,1760 # 80002e78 <__sf_fake_stdin>
8000e7a0:	04f61063          	bne	a2,a5,8000e7e0 <_putc_r+0x78>
8000e7a4:	00442603          	lw	a2,4(s0)
8000e7a8:	00862783          	lw	a5,8(a2)
8000e7ac:	fff78793          	addi	a5,a5,-1
8000e7b0:	00f62423          	sw	a5,8(a2)
8000e7b4:	0407da63          	bgez	a5,8000e808 <_putc_r+0xa0>
8000e7b8:	01862703          	lw	a4,24(a2)
8000e7bc:	00e7c863          	blt	a5,a4,8000e7cc <_putc_r+0x64>
8000e7c0:	0ff5f793          	andi	a5,a1,255
8000e7c4:	00a00713          	li	a4,10
8000e7c8:	04e79063          	bne	a5,a4,8000e808 <_putc_r+0xa0>
8000e7cc:	00040513          	mv	a0,s0
8000e7d0:	01812403          	lw	s0,24(sp)
8000e7d4:	01c12083          	lw	ra,28(sp)
8000e7d8:	02010113          	addi	sp,sp,32
8000e7dc:	6bc0006f          	j	8000ee98 <__swbuf_r>
8000e7e0:	ffff4797          	auipc	a5,0xffff4
8000e7e4:	6b878793          	addi	a5,a5,1720 # 80002e98 <__sf_fake_stdout>
8000e7e8:	00f61663          	bne	a2,a5,8000e7f4 <_putc_r+0x8c>
8000e7ec:	00842603          	lw	a2,8(s0)
8000e7f0:	fb9ff06f          	j	8000e7a8 <_putc_r+0x40>
8000e7f4:	ffff4797          	auipc	a5,0xffff4
8000e7f8:	66478793          	addi	a5,a5,1636 # 80002e58 <__sf_fake_stderr>
8000e7fc:	faf616e3          	bne	a2,a5,8000e7a8 <_putc_r+0x40>
8000e800:	00c42603          	lw	a2,12(s0)
8000e804:	fa5ff06f          	j	8000e7a8 <_putc_r+0x40>
8000e808:	00062783          	lw	a5,0(a2)
8000e80c:	0ff5f513          	andi	a0,a1,255
8000e810:	00178713          	addi	a4,a5,1
8000e814:	00e62023          	sw	a4,0(a2)
8000e818:	00b78023          	sb	a1,0(a5)
8000e81c:	01c12083          	lw	ra,28(sp)
8000e820:	01812403          	lw	s0,24(sp)
8000e824:	02010113          	addi	sp,sp,32
8000e828:	00008067          	ret

Disassembly of section .text.putc:

8000e82c <putc>:
8000e82c:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000e830:	00058613          	mv	a2,a1
8000e834:	00050593          	mv	a1,a0
8000e838:	0007a503          	lw	a0,0(a5)
8000e83c:	f2dff06f          	j	8000e768 <_putc_r>

Disassembly of section .text._sbrk_r:

8000e840 <_sbrk_r>:
8000e840:	ff010113          	addi	sp,sp,-16
8000e844:	00812423          	sw	s0,8(sp)
8000e848:	00050413          	mv	s0,a0
8000e84c:	00058513          	mv	a0,a1
8000e850:	c401a623          	sw	zero,-948(gp) # 800034cc <errno>
8000e854:	00112623          	sw	ra,12(sp)
8000e858:	c20f70ef          	jal	ra,80005c78 <_sbrk>
8000e85c:	fff00793          	li	a5,-1
8000e860:	00f51a63          	bne	a0,a5,8000e874 <_sbrk_r+0x34>
8000e864:	c4c18793          	addi	a5,gp,-948 # 800034cc <errno>
8000e868:	0007a783          	lw	a5,0(a5)
8000e86c:	00078463          	beqz	a5,8000e874 <_sbrk_r+0x34>
8000e870:	00f42023          	sw	a5,0(s0)
8000e874:	00c12083          	lw	ra,12(sp)
8000e878:	00812403          	lw	s0,8(sp)
8000e87c:	01010113          	addi	sp,sp,16
8000e880:	00008067          	ret

Disassembly of section .text._snprintf_r:

8000e884 <_sniprintf_r>:
8000e884:	f7010113          	addi	sp,sp,-144
8000e888:	06112e23          	sw	ra,124(sp)
8000e88c:	06812c23          	sw	s0,120(sp)
8000e890:	06912a23          	sw	s1,116(sp)
8000e894:	07212823          	sw	s2,112(sp)
8000e898:	08e12023          	sw	a4,128(sp)
8000e89c:	08f12223          	sw	a5,132(sp)
8000e8a0:	09012423          	sw	a6,136(sp)
8000e8a4:	09112623          	sw	a7,140(sp)
8000e8a8:	02065463          	bgez	a2,8000e8d0 <_sniprintf_r+0x4c>
8000e8ac:	08b00793          	li	a5,139
8000e8b0:	00f52023          	sw	a5,0(a0)
8000e8b4:	fff00513          	li	a0,-1
8000e8b8:	07c12083          	lw	ra,124(sp)
8000e8bc:	07812403          	lw	s0,120(sp)
8000e8c0:	07412483          	lw	s1,116(sp)
8000e8c4:	07012903          	lw	s2,112(sp)
8000e8c8:	09010113          	addi	sp,sp,144
8000e8cc:	00008067          	ret
8000e8d0:	20800793          	li	a5,520
8000e8d4:	00f11a23          	sh	a5,20(sp)
8000e8d8:	00b12423          	sw	a1,8(sp)
8000e8dc:	00b12c23          	sw	a1,24(sp)
8000e8e0:	00060413          	mv	s0,a2
8000e8e4:	00000793          	li	a5,0
8000e8e8:	00060463          	beqz	a2,8000e8f0 <_sniprintf_r+0x6c>
8000e8ec:	fff60793          	addi	a5,a2,-1
8000e8f0:	fff00913          	li	s2,-1
8000e8f4:	00068613          	mv	a2,a3
8000e8f8:	00810593          	addi	a1,sp,8
8000e8fc:	08010693          	addi	a3,sp,128
8000e900:	00050493          	mv	s1,a0
8000e904:	00f12823          	sw	a5,16(sp)
8000e908:	00f12e23          	sw	a5,28(sp)
8000e90c:	01211b23          	sh	s2,22(sp)
8000e910:	00d12223          	sw	a3,4(sp)
8000e914:	5cd000ef          	jal	ra,8000f6e0 <_svfiprintf_r>
8000e918:	01255663          	bge	a0,s2,8000e924 <_sniprintf_r+0xa0>
8000e91c:	08b00793          	li	a5,139
8000e920:	00f4a023          	sw	a5,0(s1)
8000e924:	f8040ae3          	beqz	s0,8000e8b8 <_sniprintf_r+0x34>
8000e928:	00812783          	lw	a5,8(sp)
8000e92c:	00078023          	sb	zero,0(a5)
8000e930:	f89ff06f          	j	8000e8b8 <_sniprintf_r+0x34>

Disassembly of section .text.snprintf:

8000e934 <sniprintf>:
8000e934:	f6010113          	addi	sp,sp,-160
8000e938:	08f12a23          	sw	a5,148(sp)
8000e93c:	06912a23          	sw	s1,116(sp)
8000e940:	08d12623          	sw	a3,140(sp)
8000e944:	08e12823          	sw	a4,144(sp)
8000e948:	09012c23          	sw	a6,152(sp)
8000e94c:	09112e23          	sw	a7,156(sp)
8000e950:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000e954:	06112e23          	sw	ra,124(sp)
8000e958:	06812c23          	sw	s0,120(sp)
8000e95c:	07212823          	sw	s2,112(sp)
8000e960:	0007a483          	lw	s1,0(a5)
8000e964:	0205d463          	bgez	a1,8000e98c <sniprintf+0x58>
8000e968:	08b00793          	li	a5,139
8000e96c:	00f4a023          	sw	a5,0(s1)
8000e970:	fff00513          	li	a0,-1
8000e974:	07c12083          	lw	ra,124(sp)
8000e978:	07812403          	lw	s0,120(sp)
8000e97c:	07412483          	lw	s1,116(sp)
8000e980:	07012903          	lw	s2,112(sp)
8000e984:	0a010113          	addi	sp,sp,160
8000e988:	00008067          	ret
8000e98c:	20800793          	li	a5,520
8000e990:	00f11a23          	sh	a5,20(sp)
8000e994:	00a12423          	sw	a0,8(sp)
8000e998:	00a12c23          	sw	a0,24(sp)
8000e99c:	00000793          	li	a5,0
8000e9a0:	00058463          	beqz	a1,8000e9a8 <sniprintf+0x74>
8000e9a4:	fff58793          	addi	a5,a1,-1
8000e9a8:	fff00913          	li	s2,-1
8000e9ac:	00058413          	mv	s0,a1
8000e9b0:	08c10693          	addi	a3,sp,140
8000e9b4:	00810593          	addi	a1,sp,8
8000e9b8:	00048513          	mv	a0,s1
8000e9bc:	00f12823          	sw	a5,16(sp)
8000e9c0:	00f12e23          	sw	a5,28(sp)
8000e9c4:	01211b23          	sh	s2,22(sp)
8000e9c8:	00d12223          	sw	a3,4(sp)
8000e9cc:	515000ef          	jal	ra,8000f6e0 <_svfiprintf_r>
8000e9d0:	01255663          	bge	a0,s2,8000e9dc <sniprintf+0xa8>
8000e9d4:	08b00793          	li	a5,139
8000e9d8:	00f4a023          	sw	a5,0(s1)
8000e9dc:	f8040ce3          	beqz	s0,8000e974 <sniprintf+0x40>
8000e9e0:	00812783          	lw	a5,8(sp)
8000e9e4:	00078023          	sb	zero,0(a5)
8000e9e8:	f8dff06f          	j	8000e974 <sniprintf+0x40>

Disassembly of section .text._sprintf_r:

8000e9ec <_siprintf_r>:
8000e9ec:	f6010113          	addi	sp,sp,-160
8000e9f0:	08f12a23          	sw	a5,148(sp)
8000e9f4:	800007b7          	lui	a5,0x80000
8000e9f8:	fff7c793          	not	a5,a5
8000e9fc:	00f12e23          	sw	a5,28(sp)
8000ea00:	00f12823          	sw	a5,16(sp)
8000ea04:	ffff07b7          	lui	a5,0xffff0
8000ea08:	08d12623          	sw	a3,140(sp)
8000ea0c:	00b12423          	sw	a1,8(sp)
8000ea10:	00b12c23          	sw	a1,24(sp)
8000ea14:	20878793          	addi	a5,a5,520 # ffff0208 <_ram_heap_end+0x7ffde208>
8000ea18:	08c10693          	addi	a3,sp,140
8000ea1c:	00810593          	addi	a1,sp,8
8000ea20:	06112e23          	sw	ra,124(sp)
8000ea24:	00f12a23          	sw	a5,20(sp)
8000ea28:	08e12823          	sw	a4,144(sp)
8000ea2c:	09012c23          	sw	a6,152(sp)
8000ea30:	09112e23          	sw	a7,156(sp)
8000ea34:	00d12223          	sw	a3,4(sp)
8000ea38:	4a9000ef          	jal	ra,8000f6e0 <_svfiprintf_r>
8000ea3c:	00812783          	lw	a5,8(sp)
8000ea40:	00078023          	sb	zero,0(a5)
8000ea44:	07c12083          	lw	ra,124(sp)
8000ea48:	0a010113          	addi	sp,sp,160
8000ea4c:	00008067          	ret

Disassembly of section .text.sprintf:

8000ea50 <siprintf>:
8000ea50:	f6010113          	addi	sp,sp,-160
8000ea54:	08f12a23          	sw	a5,148(sp)
8000ea58:	800007b7          	lui	a5,0x80000
8000ea5c:	fff7c793          	not	a5,a5
8000ea60:	00f12e23          	sw	a5,28(sp)
8000ea64:	00f12823          	sw	a5,16(sp)
8000ea68:	ffff07b7          	lui	a5,0xffff0
8000ea6c:	20878793          	addi	a5,a5,520 # ffff0208 <_ram_heap_end+0x7ffde208>
8000ea70:	08c12423          	sw	a2,136(sp)
8000ea74:	08d12623          	sw	a3,140(sp)
8000ea78:	08e12823          	sw	a4,144(sp)
8000ea7c:	09012c23          	sw	a6,152(sp)
8000ea80:	09112e23          	sw	a7,156(sp)
8000ea84:	00f12a23          	sw	a5,20(sp)
8000ea88:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000ea8c:	00a12423          	sw	a0,8(sp)
8000ea90:	00a12c23          	sw	a0,24(sp)
8000ea94:	0007a503          	lw	a0,0(a5)
8000ea98:	08810693          	addi	a3,sp,136
8000ea9c:	00058613          	mv	a2,a1
8000eaa0:	00810593          	addi	a1,sp,8
8000eaa4:	06112e23          	sw	ra,124(sp)
8000eaa8:	00d12223          	sw	a3,4(sp)
8000eaac:	435000ef          	jal	ra,8000f6e0 <_svfiprintf_r>
8000eab0:	00812783          	lw	a5,8(sp)
8000eab4:	00078023          	sb	zero,0(a5)
8000eab8:	07c12083          	lw	ra,124(sp)
8000eabc:	0a010113          	addi	sp,sp,160
8000eac0:	00008067          	ret

Disassembly of section .text.__sread:

8000eac4 <__sread>:
8000eac4:	ff010113          	addi	sp,sp,-16
8000eac8:	00812423          	sw	s0,8(sp)
8000eacc:	00058413          	mv	s0,a1
8000ead0:	00e59583          	lh	a1,14(a1)
8000ead4:	00112623          	sw	ra,12(sp)
8000ead8:	219010ef          	jal	ra,800104f0 <_read_r>
8000eadc:	02054063          	bltz	a0,8000eafc <__sread+0x38>
8000eae0:	05442783          	lw	a5,84(s0)
8000eae4:	00a787b3          	add	a5,a5,a0
8000eae8:	04f42a23          	sw	a5,84(s0)
8000eaec:	00c12083          	lw	ra,12(sp)
8000eaf0:	00812403          	lw	s0,8(sp)
8000eaf4:	01010113          	addi	sp,sp,16
8000eaf8:	00008067          	ret
8000eafc:	00c45783          	lhu	a5,12(s0)
8000eb00:	fffff737          	lui	a4,0xfffff
8000eb04:	fff70713          	addi	a4,a4,-1 # ffffefff <_ram_heap_end+0x7ffecfff>
8000eb08:	00e7f7b3          	and	a5,a5,a4
8000eb0c:	00f41623          	sh	a5,12(s0)
8000eb10:	fddff06f          	j	8000eaec <__sread+0x28>

Disassembly of section .text.__seofread:

8000eb14 <__seofread>:
8000eb14:	00000513          	li	a0,0
8000eb18:	00008067          	ret

Disassembly of section .text.__swrite:

8000eb1c <__swrite>:
8000eb1c:	00c5d783          	lhu	a5,12(a1)
8000eb20:	fe010113          	addi	sp,sp,-32
8000eb24:	00812c23          	sw	s0,24(sp)
8000eb28:	00912a23          	sw	s1,20(sp)
8000eb2c:	01212823          	sw	s2,16(sp)
8000eb30:	01312623          	sw	s3,12(sp)
8000eb34:	00112e23          	sw	ra,28(sp)
8000eb38:	1007f793          	andi	a5,a5,256
8000eb3c:	00050493          	mv	s1,a0
8000eb40:	00058413          	mv	s0,a1
8000eb44:	00060913          	mv	s2,a2
8000eb48:	00068993          	mv	s3,a3
8000eb4c:	00078a63          	beqz	a5,8000eb60 <__swrite+0x44>
8000eb50:	00e59583          	lh	a1,14(a1)
8000eb54:	00200693          	li	a3,2
8000eb58:	00000613          	li	a2,0
8000eb5c:	694000ef          	jal	ra,8000f1f0 <_lseek_r>
8000eb60:	00c45783          	lhu	a5,12(s0)
8000eb64:	fffff737          	lui	a4,0xfffff
8000eb68:	fff70713          	addi	a4,a4,-1 # ffffefff <_ram_heap_end+0x7ffecfff>
8000eb6c:	00e7f7b3          	and	a5,a5,a4
8000eb70:	00f41623          	sh	a5,12(s0)
8000eb74:	00e41583          	lh	a1,14(s0)
8000eb78:	01812403          	lw	s0,24(sp)
8000eb7c:	01c12083          	lw	ra,28(sp)
8000eb80:	00098693          	mv	a3,s3
8000eb84:	00090613          	mv	a2,s2
8000eb88:	00c12983          	lw	s3,12(sp)
8000eb8c:	01012903          	lw	s2,16(sp)
8000eb90:	00048513          	mv	a0,s1
8000eb94:	01412483          	lw	s1,20(sp)
8000eb98:	02010113          	addi	sp,sp,32
8000eb9c:	4480006f          	j	8000efe4 <_write_r>

Disassembly of section .text.__sseek:

8000eba0 <__sseek>:
8000eba0:	ff010113          	addi	sp,sp,-16
8000eba4:	00812423          	sw	s0,8(sp)
8000eba8:	00058413          	mv	s0,a1
8000ebac:	00e59583          	lh	a1,14(a1)
8000ebb0:	00112623          	sw	ra,12(sp)
8000ebb4:	63c000ef          	jal	ra,8000f1f0 <_lseek_r>
8000ebb8:	fff00793          	li	a5,-1
8000ebbc:	00c45703          	lhu	a4,12(s0)
8000ebc0:	02f51263          	bne	a0,a5,8000ebe4 <__sseek+0x44>
8000ebc4:	fffff7b7          	lui	a5,0xfffff
8000ebc8:	fff78793          	addi	a5,a5,-1 # ffffefff <_ram_heap_end+0x7ffecfff>
8000ebcc:	00e7f7b3          	and	a5,a5,a4
8000ebd0:	00f41623          	sh	a5,12(s0)
8000ebd4:	00c12083          	lw	ra,12(sp)
8000ebd8:	00812403          	lw	s0,8(sp)
8000ebdc:	01010113          	addi	sp,sp,16
8000ebe0:	00008067          	ret
8000ebe4:	000017b7          	lui	a5,0x1
8000ebe8:	00f767b3          	or	a5,a4,a5
8000ebec:	00f41623          	sh	a5,12(s0)
8000ebf0:	04a42a23          	sw	a0,84(s0)
8000ebf4:	fe1ff06f          	j	8000ebd4 <__sseek+0x34>

Disassembly of section .text.__sclose:

8000ebf8 <__sclose>:
8000ebf8:	00e59583          	lh	a1,14(a1)
8000ebfc:	5b00006f          	j	8000f1ac <_close_r>

Disassembly of section .text.strlen:

8000ec00 <strlen>:
8000ec00:	00050793          	mv	a5,a0
8000ec04:	00178793          	addi	a5,a5,1 # 1001 <_stack_size+0x801>
8000ec08:	fff7c703          	lbu	a4,-1(a5)
8000ec0c:	fe071ce3          	bnez	a4,8000ec04 <strlen+0x4>
8000ec10:	40a78533          	sub	a0,a5,a0
8000ec14:	fff50513          	addi	a0,a0,-1
8000ec18:	00008067          	ret

Disassembly of section .text.strncmp:

8000ec1c <strncmp>:
8000ec1c:	02060a63          	beqz	a2,8000ec50 <strncmp+0x34>
8000ec20:	fff60613          	addi	a2,a2,-1
8000ec24:	00000713          	li	a4,0
8000ec28:	00e507b3          	add	a5,a0,a4
8000ec2c:	00e586b3          	add	a3,a1,a4
8000ec30:	0007c783          	lbu	a5,0(a5)
8000ec34:	0006c683          	lbu	a3,0(a3)
8000ec38:	00d79863          	bne	a5,a3,8000ec48 <strncmp+0x2c>
8000ec3c:	00c70663          	beq	a4,a2,8000ec48 <strncmp+0x2c>
8000ec40:	00170713          	addi	a4,a4,1
8000ec44:	fe0792e3          	bnez	a5,8000ec28 <strncmp+0xc>
8000ec48:	40d78533          	sub	a0,a5,a3
8000ec4c:	00008067          	ret
8000ec50:	00000513          	li	a0,0
8000ec54:	00008067          	ret

Disassembly of section .text._strtol_l.isra.0:

8000ec58 <_strtol_l.isra.0>:
8000ec58:	fc010113          	addi	sp,sp,-64
8000ec5c:	03212823          	sw	s2,48(sp)
8000ec60:	03512223          	sw	s5,36(sp)
8000ec64:	03612023          	sw	s6,32(sp)
8000ec68:	01812c23          	sw	s8,24(sp)
8000ec6c:	00068913          	mv	s2,a3
8000ec70:	02112e23          	sw	ra,60(sp)
8000ec74:	02812c23          	sw	s0,56(sp)
8000ec78:	02912a23          	sw	s1,52(sp)
8000ec7c:	03312623          	sw	s3,44(sp)
8000ec80:	03412423          	sw	s4,40(sp)
8000ec84:	01712e23          	sw	s7,28(sp)
8000ec88:	01912a23          	sw	s9,20(sp)
8000ec8c:	01a12823          	sw	s10,16(sp)
8000ec90:	01b12623          	sw	s11,12(sp)
8000ec94:	00050a93          	mv	s5,a0
8000ec98:	00058b13          	mv	s6,a1
8000ec9c:	00060c13          	mv	s8,a2
8000eca0:	00058793          	mv	a5,a1
8000eca4:	ffff4697          	auipc	a3,0xffff4
8000eca8:	0b168693          	addi	a3,a3,177 # 80002d55 <_ctype_+0x1>
8000ecac:	00178493          	addi	s1,a5,1
8000ecb0:	fff4c403          	lbu	s0,-1(s1)
8000ecb4:	00d40733          	add	a4,s0,a3
8000ecb8:	00074703          	lbu	a4,0(a4)
8000ecbc:	00877713          	andi	a4,a4,8
8000ecc0:	0c071863          	bnez	a4,8000ed90 <_strtol_l.isra.0+0x138>
8000ecc4:	02d00713          	li	a4,45
8000ecc8:	0ce41863          	bne	s0,a4,8000ed98 <_strtol_l.isra.0+0x140>
8000eccc:	0004c403          	lbu	s0,0(s1)
8000ecd0:	00100a13          	li	s4,1
8000ecd4:	00278493          	addi	s1,a5,2
8000ecd8:	16090e63          	beqz	s2,8000ee54 <_strtol_l.isra.0+0x1fc>
8000ecdc:	01000793          	li	a5,16
8000ece0:	02f91463          	bne	s2,a5,8000ed08 <_strtol_l.isra.0+0xb0>
8000ece4:	03000793          	li	a5,48
8000ece8:	02f41063          	bne	s0,a5,8000ed08 <_strtol_l.isra.0+0xb0>
8000ecec:	0004c783          	lbu	a5,0(s1)
8000ecf0:	05800713          	li	a4,88
8000ecf4:	0df7f793          	andi	a5,a5,223
8000ecf8:	14e79663          	bne	a5,a4,8000ee44 <_strtol_l.isra.0+0x1ec>
8000ecfc:	0014c403          	lbu	s0,1(s1)
8000ed00:	01000913          	li	s2,16
8000ed04:	00248493          	addi	s1,s1,2
8000ed08:	800009b7          	lui	s3,0x80000
8000ed0c:	000a1463          	bnez	s4,8000ed14 <_strtol_l.isra.0+0xbc>
8000ed10:	fff9c993          	not	s3,s3
8000ed14:	00090593          	mv	a1,s2
8000ed18:	00098513          	mv	a0,s3
8000ed1c:	ed4fe0ef          	jal	ra,8000d3f0 <__umodsi3>
8000ed20:	00050b93          	mv	s7,a0
8000ed24:	00090593          	mv	a1,s2
8000ed28:	00098513          	mv	a0,s3
8000ed2c:	e7cfe0ef          	jal	ra,8000d3a8 <__udivsi3>
8000ed30:	00050c93          	mv	s9,a0
8000ed34:	00000713          	li	a4,0
8000ed38:	00000513          	li	a0,0
8000ed3c:	00900d93          	li	s11,9
8000ed40:	01900d13          	li	s10,25
8000ed44:	fff00693          	li	a3,-1
8000ed48:	fd040793          	addi	a5,s0,-48
8000ed4c:	06fde463          	bltu	s11,a5,8000edb4 <_strtol_l.isra.0+0x15c>
8000ed50:	00078413          	mv	s0,a5
8000ed54:	09245063          	bge	s0,s2,8000edd4 <_strtol_l.isra.0+0x17c>
8000ed58:	02d70663          	beq	a4,a3,8000ed84 <_strtol_l.isra.0+0x12c>
8000ed5c:	fff00713          	li	a4,-1
8000ed60:	02ace263          	bltu	s9,a0,8000ed84 <_strtol_l.isra.0+0x12c>
8000ed64:	00ac9463          	bne	s9,a0,8000ed6c <_strtol_l.isra.0+0x114>
8000ed68:	008bce63          	blt	s7,s0,8000ed84 <_strtol_l.isra.0+0x12c>
8000ed6c:	00050593          	mv	a1,a0
8000ed70:	00090513          	mv	a0,s2
8000ed74:	e08fe0ef          	jal	ra,8000d37c <__mulsi3>
8000ed78:	00a40533          	add	a0,s0,a0
8000ed7c:	00100713          	li	a4,1
8000ed80:	fff00693          	li	a3,-1
8000ed84:	00148493          	addi	s1,s1,1
8000ed88:	fff4c403          	lbu	s0,-1(s1)
8000ed8c:	fbdff06f          	j	8000ed48 <_strtol_l.isra.0+0xf0>
8000ed90:	00048793          	mv	a5,s1
8000ed94:	f19ff06f          	j	8000ecac <_strtol_l.isra.0+0x54>
8000ed98:	02b00713          	li	a4,43
8000ed9c:	00e40663          	beq	s0,a4,8000eda8 <_strtol_l.isra.0+0x150>
8000eda0:	00000a13          	li	s4,0
8000eda4:	f35ff06f          	j	8000ecd8 <_strtol_l.isra.0+0x80>
8000eda8:	0004c403          	lbu	s0,0(s1)
8000edac:	00278493          	addi	s1,a5,2
8000edb0:	ff1ff06f          	j	8000eda0 <_strtol_l.isra.0+0x148>
8000edb4:	fbf40793          	addi	a5,s0,-65
8000edb8:	00fd6663          	bltu	s10,a5,8000edc4 <_strtol_l.isra.0+0x16c>
8000edbc:	fc940413          	addi	s0,s0,-55
8000edc0:	f95ff06f          	j	8000ed54 <_strtol_l.isra.0+0xfc>
8000edc4:	f9f40793          	addi	a5,s0,-97
8000edc8:	00fd6663          	bltu	s10,a5,8000edd4 <_strtol_l.isra.0+0x17c>
8000edcc:	fa940413          	addi	s0,s0,-87
8000edd0:	f85ff06f          	j	8000ed54 <_strtol_l.isra.0+0xfc>
8000edd4:	fff00793          	li	a5,-1
8000edd8:	04f71863          	bne	a4,a5,8000ee28 <_strtol_l.isra.0+0x1d0>
8000eddc:	02200793          	li	a5,34
8000ede0:	00faa023          	sw	a5,0(s5)
8000ede4:	00098513          	mv	a0,s3
8000ede8:	040c1863          	bnez	s8,8000ee38 <_strtol_l.isra.0+0x1e0>
8000edec:	03c12083          	lw	ra,60(sp)
8000edf0:	03812403          	lw	s0,56(sp)
8000edf4:	03412483          	lw	s1,52(sp)
8000edf8:	03012903          	lw	s2,48(sp)
8000edfc:	02c12983          	lw	s3,44(sp)
8000ee00:	02812a03          	lw	s4,40(sp)
8000ee04:	02412a83          	lw	s5,36(sp)
8000ee08:	02012b03          	lw	s6,32(sp)
8000ee0c:	01c12b83          	lw	s7,28(sp)
8000ee10:	01812c03          	lw	s8,24(sp)
8000ee14:	01412c83          	lw	s9,20(sp)
8000ee18:	01012d03          	lw	s10,16(sp)
8000ee1c:	00c12d83          	lw	s11,12(sp)
8000ee20:	04010113          	addi	sp,sp,64
8000ee24:	00008067          	ret
8000ee28:	000a0463          	beqz	s4,8000ee30 <_strtol_l.isra.0+0x1d8>
8000ee2c:	40a00533          	neg	a0,a0
8000ee30:	fa0c0ee3          	beqz	s8,8000edec <_strtol_l.isra.0+0x194>
8000ee34:	00070463          	beqz	a4,8000ee3c <_strtol_l.isra.0+0x1e4>
8000ee38:	fff48b13          	addi	s6,s1,-1
8000ee3c:	016c2023          	sw	s6,0(s8)
8000ee40:	fadff06f          	j	8000edec <_strtol_l.isra.0+0x194>
8000ee44:	03000413          	li	s0,48
8000ee48:	ec0910e3          	bnez	s2,8000ed08 <_strtol_l.isra.0+0xb0>
8000ee4c:	00800913          	li	s2,8
8000ee50:	eb9ff06f          	j	8000ed08 <_strtol_l.isra.0+0xb0>
8000ee54:	03000793          	li	a5,48
8000ee58:	e8f40ae3          	beq	s0,a5,8000ecec <_strtol_l.isra.0+0x94>
8000ee5c:	00a00913          	li	s2,10
8000ee60:	ea9ff06f          	j	8000ed08 <_strtol_l.isra.0+0xb0>

Disassembly of section .text._strtol_r:

8000ee64 <_strtol_r>:
8000ee64:	df5ff06f          	j	8000ec58 <_strtol_l.isra.0>

Disassembly of section .text.strtol_l:

8000ee68 <strtol_l>:
8000ee68:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000ee6c:	00060693          	mv	a3,a2
8000ee70:	00058613          	mv	a2,a1
8000ee74:	00050593          	mv	a1,a0
8000ee78:	0007a503          	lw	a0,0(a5)
8000ee7c:	dddff06f          	j	8000ec58 <_strtol_l.isra.0>

Disassembly of section .text.strtol:

8000ee80 <strtol>:
8000ee80:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000ee84:	00060693          	mv	a3,a2
8000ee88:	00058613          	mv	a2,a1
8000ee8c:	00050593          	mv	a1,a0
8000ee90:	0007a503          	lw	a0,0(a5)
8000ee94:	dc5ff06f          	j	8000ec58 <_strtol_l.isra.0>

Disassembly of section .text.__swbuf_r:

8000ee98 <__swbuf_r>:
8000ee98:	fe010113          	addi	sp,sp,-32
8000ee9c:	00812c23          	sw	s0,24(sp)
8000eea0:	00912a23          	sw	s1,20(sp)
8000eea4:	01212823          	sw	s2,16(sp)
8000eea8:	00112e23          	sw	ra,28(sp)
8000eeac:	01312623          	sw	s3,12(sp)
8000eeb0:	00050493          	mv	s1,a0
8000eeb4:	00058913          	mv	s2,a1
8000eeb8:	00060413          	mv	s0,a2
8000eebc:	00050863          	beqz	a0,8000eecc <__swbuf_r+0x34>
8000eec0:	01852783          	lw	a5,24(a0)
8000eec4:	00079463          	bnez	a5,8000eecc <__swbuf_r+0x34>
8000eec8:	ee9fe0ef          	jal	ra,8000ddb0 <__sinit>
8000eecc:	ffff4797          	auipc	a5,0xffff4
8000eed0:	fac78793          	addi	a5,a5,-84 # 80002e78 <__sf_fake_stdin>
8000eed4:	0af41e63          	bne	s0,a5,8000ef90 <__swbuf_r+0xf8>
8000eed8:	0044a403          	lw	s0,4(s1)
8000eedc:	01842783          	lw	a5,24(s0)
8000eee0:	00f42423          	sw	a5,8(s0)
8000eee4:	00c45783          	lhu	a5,12(s0)
8000eee8:	0087f793          	andi	a5,a5,8
8000eeec:	0c078663          	beqz	a5,8000efb8 <__swbuf_r+0x120>
8000eef0:	01042783          	lw	a5,16(s0)
8000eef4:	0c078263          	beqz	a5,8000efb8 <__swbuf_r+0x120>
8000eef8:	01042783          	lw	a5,16(s0)
8000eefc:	00042503          	lw	a0,0(s0)
8000ef00:	0ff97993          	andi	s3,s2,255
8000ef04:	0ff97913          	andi	s2,s2,255
8000ef08:	40f50533          	sub	a0,a0,a5
8000ef0c:	01442783          	lw	a5,20(s0)
8000ef10:	00f54a63          	blt	a0,a5,8000ef24 <__swbuf_r+0x8c>
8000ef14:	00040593          	mv	a1,s0
8000ef18:	00048513          	mv	a0,s1
8000ef1c:	ca5fe0ef          	jal	ra,8000dbc0 <_fflush_r>
8000ef20:	0a051463          	bnez	a0,8000efc8 <__swbuf_r+0x130>
8000ef24:	00842783          	lw	a5,8(s0)
8000ef28:	00150513          	addi	a0,a0,1
8000ef2c:	fff78793          	addi	a5,a5,-1
8000ef30:	00f42423          	sw	a5,8(s0)
8000ef34:	00042783          	lw	a5,0(s0)
8000ef38:	00178713          	addi	a4,a5,1
8000ef3c:	00e42023          	sw	a4,0(s0)
8000ef40:	01378023          	sb	s3,0(a5)
8000ef44:	01442783          	lw	a5,20(s0)
8000ef48:	00a78c63          	beq	a5,a0,8000ef60 <__swbuf_r+0xc8>
8000ef4c:	00c45783          	lhu	a5,12(s0)
8000ef50:	0017f793          	andi	a5,a5,1
8000ef54:	00078e63          	beqz	a5,8000ef70 <__swbuf_r+0xd8>
8000ef58:	00a00793          	li	a5,10
8000ef5c:	00f91a63          	bne	s2,a5,8000ef70 <__swbuf_r+0xd8>
8000ef60:	00040593          	mv	a1,s0
8000ef64:	00048513          	mv	a0,s1
8000ef68:	c59fe0ef          	jal	ra,8000dbc0 <_fflush_r>
8000ef6c:	04051e63          	bnez	a0,8000efc8 <__swbuf_r+0x130>
8000ef70:	01c12083          	lw	ra,28(sp)
8000ef74:	01812403          	lw	s0,24(sp)
8000ef78:	00090513          	mv	a0,s2
8000ef7c:	01412483          	lw	s1,20(sp)
8000ef80:	01012903          	lw	s2,16(sp)
8000ef84:	00c12983          	lw	s3,12(sp)
8000ef88:	02010113          	addi	sp,sp,32
8000ef8c:	00008067          	ret
8000ef90:	ffff4797          	auipc	a5,0xffff4
8000ef94:	f0878793          	addi	a5,a5,-248 # 80002e98 <__sf_fake_stdout>
8000ef98:	00f41663          	bne	s0,a5,8000efa4 <__swbuf_r+0x10c>
8000ef9c:	0084a403          	lw	s0,8(s1)
8000efa0:	f3dff06f          	j	8000eedc <__swbuf_r+0x44>
8000efa4:	ffff4797          	auipc	a5,0xffff4
8000efa8:	eb478793          	addi	a5,a5,-332 # 80002e58 <__sf_fake_stderr>
8000efac:	f2f418e3          	bne	s0,a5,8000eedc <__swbuf_r+0x44>
8000efb0:	00c4a403          	lw	s0,12(s1)
8000efb4:	f29ff06f          	j	8000eedc <__swbuf_r+0x44>
8000efb8:	00040593          	mv	a1,s0
8000efbc:	00048513          	mv	a0,s1
8000efc0:	070000ef          	jal	ra,8000f030 <__swsetup_r>
8000efc4:	f2050ae3          	beqz	a0,8000eef8 <__swbuf_r+0x60>
8000efc8:	fff00913          	li	s2,-1
8000efcc:	fa5ff06f          	j	8000ef70 <__swbuf_r+0xd8>

Disassembly of section .text.__swbuf:

8000efd0 <__swbuf>:
8000efd0:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000efd4:	00058613          	mv	a2,a1
8000efd8:	00050593          	mv	a1,a0
8000efdc:	0007a503          	lw	a0,0(a5)
8000efe0:	eb9ff06f          	j	8000ee98 <__swbuf_r>

Disassembly of section .text._write_r:

8000efe4 <_write_r>:
8000efe4:	ff010113          	addi	sp,sp,-16
8000efe8:	00812423          	sw	s0,8(sp)
8000efec:	00050413          	mv	s0,a0
8000eff0:	00058513          	mv	a0,a1
8000eff4:	00060593          	mv	a1,a2
8000eff8:	00068613          	mv	a2,a3
8000effc:	c401a623          	sw	zero,-948(gp) # 800034cc <errno>
8000f000:	00112623          	sw	ra,12(sp)
8000f004:	d1df60ef          	jal	ra,80005d20 <_write>
8000f008:	fff00793          	li	a5,-1
8000f00c:	00f51a63          	bne	a0,a5,8000f020 <_write_r+0x3c>
8000f010:	c4c18793          	addi	a5,gp,-948 # 800034cc <errno>
8000f014:	0007a783          	lw	a5,0(a5)
8000f018:	00078463          	beqz	a5,8000f020 <_write_r+0x3c>
8000f01c:	00f42023          	sw	a5,0(s0)
8000f020:	00c12083          	lw	ra,12(sp)
8000f024:	00812403          	lw	s0,8(sp)
8000f028:	01010113          	addi	sp,sp,16
8000f02c:	00008067          	ret

Disassembly of section .text.__swsetup_r:

8000f030 <__swsetup_r>:
8000f030:	ff010113          	addi	sp,sp,-16
8000f034:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
8000f038:	00912223          	sw	s1,4(sp)
8000f03c:	0007a483          	lw	s1,0(a5)
8000f040:	00812423          	sw	s0,8(sp)
8000f044:	01212023          	sw	s2,0(sp)
8000f048:	00112623          	sw	ra,12(sp)
8000f04c:	00050913          	mv	s2,a0
8000f050:	00058413          	mv	s0,a1
8000f054:	00048a63          	beqz	s1,8000f068 <__swsetup_r+0x38>
8000f058:	0184a783          	lw	a5,24(s1)
8000f05c:	00079663          	bnez	a5,8000f068 <__swsetup_r+0x38>
8000f060:	00048513          	mv	a0,s1
8000f064:	d4dfe0ef          	jal	ra,8000ddb0 <__sinit>
8000f068:	ffff4797          	auipc	a5,0xffff4
8000f06c:	e1078793          	addi	a5,a5,-496 # 80002e78 <__sf_fake_stdin>
8000f070:	04f41863          	bne	s0,a5,8000f0c0 <__swsetup_r+0x90>
8000f074:	0044a403          	lw	s0,4(s1)
8000f078:	00c41703          	lh	a4,12(s0)
8000f07c:	01071793          	slli	a5,a4,0x10
8000f080:	0107d793          	srli	a5,a5,0x10
8000f084:	0087f693          	andi	a3,a5,8
8000f088:	0a069463          	bnez	a3,8000f130 <__swsetup_r+0x100>
8000f08c:	0107f693          	andi	a3,a5,16
8000f090:	04069c63          	bnez	a3,8000f0e8 <__swsetup_r+0xb8>
8000f094:	00900793          	li	a5,9
8000f098:	00f92023          	sw	a5,0(s2)
8000f09c:	04076713          	ori	a4,a4,64
8000f0a0:	00e41623          	sh	a4,12(s0)
8000f0a4:	fff00513          	li	a0,-1
8000f0a8:	00c12083          	lw	ra,12(sp)
8000f0ac:	00812403          	lw	s0,8(sp)
8000f0b0:	00412483          	lw	s1,4(sp)
8000f0b4:	00012903          	lw	s2,0(sp)
8000f0b8:	01010113          	addi	sp,sp,16
8000f0bc:	00008067          	ret
8000f0c0:	ffff4797          	auipc	a5,0xffff4
8000f0c4:	dd878793          	addi	a5,a5,-552 # 80002e98 <__sf_fake_stdout>
8000f0c8:	00f41663          	bne	s0,a5,8000f0d4 <__swsetup_r+0xa4>
8000f0cc:	0084a403          	lw	s0,8(s1)
8000f0d0:	fa9ff06f          	j	8000f078 <__swsetup_r+0x48>
8000f0d4:	ffff4797          	auipc	a5,0xffff4
8000f0d8:	d8478793          	addi	a5,a5,-636 # 80002e58 <__sf_fake_stderr>
8000f0dc:	f8f41ee3          	bne	s0,a5,8000f078 <__swsetup_r+0x48>
8000f0e0:	00c4a403          	lw	s0,12(s1)
8000f0e4:	f95ff06f          	j	8000f078 <__swsetup_r+0x48>
8000f0e8:	0047f793          	andi	a5,a5,4
8000f0ec:	02078c63          	beqz	a5,8000f124 <__swsetup_r+0xf4>
8000f0f0:	03442583          	lw	a1,52(s0)
8000f0f4:	00058c63          	beqz	a1,8000f10c <__swsetup_r+0xdc>
8000f0f8:	04440793          	addi	a5,s0,68
8000f0fc:	00f58663          	beq	a1,a5,8000f108 <__swsetup_r+0xd8>
8000f100:	00090513          	mv	a0,s2
8000f104:	aa8ff0ef          	jal	ra,8000e3ac <_free_r>
8000f108:	02042a23          	sw	zero,52(s0)
8000f10c:	00c45783          	lhu	a5,12(s0)
8000f110:	00042223          	sw	zero,4(s0)
8000f114:	fdb7f793          	andi	a5,a5,-37
8000f118:	00f41623          	sh	a5,12(s0)
8000f11c:	01042783          	lw	a5,16(s0)
8000f120:	00f42023          	sw	a5,0(s0)
8000f124:	00c45783          	lhu	a5,12(s0)
8000f128:	0087e793          	ori	a5,a5,8
8000f12c:	00f41623          	sh	a5,12(s0)
8000f130:	01042783          	lw	a5,16(s0)
8000f134:	02079063          	bnez	a5,8000f154 <__swsetup_r+0x124>
8000f138:	00c45783          	lhu	a5,12(s0)
8000f13c:	20000713          	li	a4,512
8000f140:	2807f793          	andi	a5,a5,640
8000f144:	00e78863          	beq	a5,a4,8000f154 <__swsetup_r+0x124>
8000f148:	00040593          	mv	a1,s0
8000f14c:	00090513          	mv	a0,s2
8000f150:	178000ef          	jal	ra,8000f2c8 <__smakebuf_r>
8000f154:	00c45783          	lhu	a5,12(s0)
8000f158:	0017f713          	andi	a4,a5,1
8000f15c:	02070c63          	beqz	a4,8000f194 <__swsetup_r+0x164>
8000f160:	01442783          	lw	a5,20(s0)
8000f164:	00042423          	sw	zero,8(s0)
8000f168:	40f007b3          	neg	a5,a5
8000f16c:	00f42c23          	sw	a5,24(s0)
8000f170:	01042783          	lw	a5,16(s0)
8000f174:	00000513          	li	a0,0
8000f178:	f20798e3          	bnez	a5,8000f0a8 <__swsetup_r+0x78>
8000f17c:	00c41783          	lh	a5,12(s0)
8000f180:	0807f713          	andi	a4,a5,128
8000f184:	f20702e3          	beqz	a4,8000f0a8 <__swsetup_r+0x78>
8000f188:	0407e793          	ori	a5,a5,64
8000f18c:	00f41623          	sh	a5,12(s0)
8000f190:	f15ff06f          	j	8000f0a4 <__swsetup_r+0x74>
8000f194:	0027f793          	andi	a5,a5,2
8000f198:	00000713          	li	a4,0
8000f19c:	00079463          	bnez	a5,8000f1a4 <__swsetup_r+0x174>
8000f1a0:	01442703          	lw	a4,20(s0)
8000f1a4:	00e42423          	sw	a4,8(s0)
8000f1a8:	fc9ff06f          	j	8000f170 <__swsetup_r+0x140>

Disassembly of section .text._close_r:

8000f1ac <_close_r>:
8000f1ac:	ff010113          	addi	sp,sp,-16
8000f1b0:	00812423          	sw	s0,8(sp)
8000f1b4:	00050413          	mv	s0,a0
8000f1b8:	00058513          	mv	a0,a1
8000f1bc:	c401a623          	sw	zero,-948(gp) # 800034cc <errno>
8000f1c0:	00112623          	sw	ra,12(sp)
8000f1c4:	b99f60ef          	jal	ra,80005d5c <_close>
8000f1c8:	fff00793          	li	a5,-1
8000f1cc:	00f51a63          	bne	a0,a5,8000f1e0 <_close_r+0x34>
8000f1d0:	c4c18793          	addi	a5,gp,-948 # 800034cc <errno>
8000f1d4:	0007a783          	lw	a5,0(a5)
8000f1d8:	00078463          	beqz	a5,8000f1e0 <_close_r+0x34>
8000f1dc:	00f42023          	sw	a5,0(s0)
8000f1e0:	00c12083          	lw	ra,12(sp)
8000f1e4:	00812403          	lw	s0,8(sp)
8000f1e8:	01010113          	addi	sp,sp,16
8000f1ec:	00008067          	ret

Disassembly of section .text._lseek_r:

8000f1f0 <_lseek_r>:
8000f1f0:	ff010113          	addi	sp,sp,-16
8000f1f4:	00812423          	sw	s0,8(sp)
8000f1f8:	00050413          	mv	s0,a0
8000f1fc:	00058513          	mv	a0,a1
8000f200:	00060593          	mv	a1,a2
8000f204:	00068613          	mv	a2,a3
8000f208:	c401a623          	sw	zero,-948(gp) # 800034cc <errno>
8000f20c:	00112623          	sw	ra,12(sp)
8000f210:	b55f60ef          	jal	ra,80005d64 <_lseek>
8000f214:	fff00793          	li	a5,-1
8000f218:	00f51a63          	bne	a0,a5,8000f22c <_lseek_r+0x3c>
8000f21c:	c4c18793          	addi	a5,gp,-948 # 800034cc <errno>
8000f220:	0007a783          	lw	a5,0(a5)
8000f224:	00078463          	beqz	a5,8000f22c <_lseek_r+0x3c>
8000f228:	00f42023          	sw	a5,0(s0)
8000f22c:	00c12083          	lw	ra,12(sp)
8000f230:	00812403          	lw	s0,8(sp)
8000f234:	01010113          	addi	sp,sp,16
8000f238:	00008067          	ret

Disassembly of section .text.__swhatbuf_r:

8000f23c <__swhatbuf_r>:
8000f23c:	f8010113          	addi	sp,sp,-128
8000f240:	06912a23          	sw	s1,116(sp)
8000f244:	00058493          	mv	s1,a1
8000f248:	00e59583          	lh	a1,14(a1)
8000f24c:	06812c23          	sw	s0,120(sp)
8000f250:	06112e23          	sw	ra,124(sp)
8000f254:	00060413          	mv	s0,a2
8000f258:	0005de63          	bgez	a1,8000f274 <__swhatbuf_r+0x38>
8000f25c:	00c4d783          	lhu	a5,12(s1)
8000f260:	0006a023          	sw	zero,0(a3)
8000f264:	0807f793          	andi	a5,a5,128
8000f268:	04079063          	bnez	a5,8000f2a8 <__swhatbuf_r+0x6c>
8000f26c:	40000793          	li	a5,1024
8000f270:	03c0006f          	j	8000f2ac <__swhatbuf_r+0x70>
8000f274:	01810613          	addi	a2,sp,24
8000f278:	00d12623          	sw	a3,12(sp)
8000f27c:	46c010ef          	jal	ra,800106e8 <_fstat_r>
8000f280:	00c12683          	lw	a3,12(sp)
8000f284:	fc054ce3          	bltz	a0,8000f25c <__swhatbuf_r+0x20>
8000f288:	01c12703          	lw	a4,28(sp)
8000f28c:	0000f7b7          	lui	a5,0xf
8000f290:	00e7f7b3          	and	a5,a5,a4
8000f294:	ffffe737          	lui	a4,0xffffe
8000f298:	00e787b3          	add	a5,a5,a4
8000f29c:	0017b793          	seqz	a5,a5
8000f2a0:	00f6a023          	sw	a5,0(a3)
8000f2a4:	fc9ff06f          	j	8000f26c <__swhatbuf_r+0x30>
8000f2a8:	04000793          	li	a5,64
8000f2ac:	00f42023          	sw	a5,0(s0)
8000f2b0:	07c12083          	lw	ra,124(sp)
8000f2b4:	07812403          	lw	s0,120(sp)
8000f2b8:	07412483          	lw	s1,116(sp)
8000f2bc:	00000513          	li	a0,0
8000f2c0:	08010113          	addi	sp,sp,128
8000f2c4:	00008067          	ret

Disassembly of section .text.__smakebuf_r:

8000f2c8 <__smakebuf_r>:
8000f2c8:	00c5d783          	lhu	a5,12(a1)
8000f2cc:	fe010113          	addi	sp,sp,-32
8000f2d0:	00812c23          	sw	s0,24(sp)
8000f2d4:	00112e23          	sw	ra,28(sp)
8000f2d8:	00912a23          	sw	s1,20(sp)
8000f2dc:	01212823          	sw	s2,16(sp)
8000f2e0:	0027f793          	andi	a5,a5,2
8000f2e4:	00058413          	mv	s0,a1
8000f2e8:	02078863          	beqz	a5,8000f318 <__smakebuf_r+0x50>
8000f2ec:	04740793          	addi	a5,s0,71
8000f2f0:	00f42023          	sw	a5,0(s0)
8000f2f4:	00f42823          	sw	a5,16(s0)
8000f2f8:	00100793          	li	a5,1
8000f2fc:	00f42a23          	sw	a5,20(s0)
8000f300:	01c12083          	lw	ra,28(sp)
8000f304:	01812403          	lw	s0,24(sp)
8000f308:	01412483          	lw	s1,20(sp)
8000f30c:	01012903          	lw	s2,16(sp)
8000f310:	02010113          	addi	sp,sp,32
8000f314:	00008067          	ret
8000f318:	00c10693          	addi	a3,sp,12
8000f31c:	00810613          	addi	a2,sp,8
8000f320:	00050493          	mv	s1,a0
8000f324:	f19ff0ef          	jal	ra,8000f23c <__swhatbuf_r>
8000f328:	00812583          	lw	a1,8(sp)
8000f32c:	00050913          	mv	s2,a0
8000f330:	00048513          	mv	a0,s1
8000f334:	97cff0ef          	jal	ra,8000e4b0 <_malloc_r>
8000f338:	02051063          	bnez	a0,8000f358 <__smakebuf_r+0x90>
8000f33c:	00c41783          	lh	a5,12(s0)
8000f340:	2007f713          	andi	a4,a5,512
8000f344:	fa071ee3          	bnez	a4,8000f300 <__smakebuf_r+0x38>
8000f348:	ffc7f793          	andi	a5,a5,-4
8000f34c:	0027e793          	ori	a5,a5,2
8000f350:	00f41623          	sh	a5,12(s0)
8000f354:	f99ff06f          	j	8000f2ec <__smakebuf_r+0x24>
8000f358:	fffff797          	auipc	a5,0xfffff
8000f35c:	9c078793          	addi	a5,a5,-1600 # 8000dd18 <_cleanup_r>
8000f360:	02f4a423          	sw	a5,40(s1)
8000f364:	00c45783          	lhu	a5,12(s0)
8000f368:	00a42023          	sw	a0,0(s0)
8000f36c:	00a42823          	sw	a0,16(s0)
8000f370:	0807e793          	ori	a5,a5,128
8000f374:	00f41623          	sh	a5,12(s0)
8000f378:	00812783          	lw	a5,8(sp)
8000f37c:	00f42a23          	sw	a5,20(s0)
8000f380:	00c12783          	lw	a5,12(sp)
8000f384:	02078263          	beqz	a5,8000f3a8 <__smakebuf_r+0xe0>
8000f388:	00e41583          	lh	a1,14(s0)
8000f38c:	00048513          	mv	a0,s1
8000f390:	001010ef          	jal	ra,80010b90 <_isatty_r>
8000f394:	00050a63          	beqz	a0,8000f3a8 <__smakebuf_r+0xe0>
8000f398:	00c45783          	lhu	a5,12(s0)
8000f39c:	ffc7f793          	andi	a5,a5,-4
8000f3a0:	0017e793          	ori	a5,a5,1
8000f3a4:	00f41623          	sh	a5,12(s0)
8000f3a8:	00c45783          	lhu	a5,12(s0)
8000f3ac:	00f96933          	or	s2,s2,a5
8000f3b0:	01241623          	sh	s2,12(s0)
8000f3b4:	f4dff06f          	j	8000f300 <__smakebuf_r+0x38>

Disassembly of section .text.__ssputs_r:

8000f3b8 <__ssputs_r>:
8000f3b8:	fe010113          	addi	sp,sp,-32
8000f3bc:	01212823          	sw	s2,16(sp)
8000f3c0:	0085a903          	lw	s2,8(a1)
8000f3c4:	00812c23          	sw	s0,24(sp)
8000f3c8:	01412423          	sw	s4,8(sp)
8000f3cc:	01612023          	sw	s6,0(sp)
8000f3d0:	00112e23          	sw	ra,28(sp)
8000f3d4:	00912a23          	sw	s1,20(sp)
8000f3d8:	01312623          	sw	s3,12(sp)
8000f3dc:	01512223          	sw	s5,4(sp)
8000f3e0:	00058413          	mv	s0,a1
8000f3e4:	00060b13          	mv	s6,a2
8000f3e8:	00068a13          	mv	s4,a3
8000f3ec:	0f26e063          	bltu	a3,s2,8000f4cc <__ssputs_r+0x114>
8000f3f0:	00c5d783          	lhu	a5,12(a1)
8000f3f4:	4807f713          	andi	a4,a5,1152
8000f3f8:	0c070863          	beqz	a4,8000f4c8 <__ssputs_r+0x110>
8000f3fc:	00042483          	lw	s1,0(s0)
8000f400:	01442703          	lw	a4,20(s0)
8000f404:	0105a583          	lw	a1,16(a1)
8000f408:	00050a93          	mv	s5,a0
8000f40c:	40b489b3          	sub	s3,s1,a1
8000f410:	00171493          	slli	s1,a4,0x1
8000f414:	00e48733          	add	a4,s1,a4
8000f418:	01f75493          	srli	s1,a4,0x1f
8000f41c:	00e484b3          	add	s1,s1,a4
8000f420:	00168713          	addi	a4,a3,1
8000f424:	4014d493          	srai	s1,s1,0x1
8000f428:	01370733          	add	a4,a4,s3
8000f42c:	00e4f463          	bgeu	s1,a4,8000f434 <__ssputs_r+0x7c>
8000f430:	00070493          	mv	s1,a4
8000f434:	4007f793          	andi	a5,a5,1024
8000f438:	0c078463          	beqz	a5,8000f500 <__ssputs_r+0x148>
8000f43c:	00048593          	mv	a1,s1
8000f440:	000a8513          	mv	a0,s5
8000f444:	86cff0ef          	jal	ra,8000e4b0 <_malloc_r>
8000f448:	00050913          	mv	s2,a0
8000f44c:	04051263          	bnez	a0,8000f490 <__ssputs_r+0xd8>
8000f450:	00c00793          	li	a5,12
8000f454:	00faa023          	sw	a5,0(s5)
8000f458:	00c45783          	lhu	a5,12(s0)
8000f45c:	fff00513          	li	a0,-1
8000f460:	0407e793          	ori	a5,a5,64
8000f464:	00f41623          	sh	a5,12(s0)
8000f468:	01c12083          	lw	ra,28(sp)
8000f46c:	01812403          	lw	s0,24(sp)
8000f470:	01412483          	lw	s1,20(sp)
8000f474:	01012903          	lw	s2,16(sp)
8000f478:	00c12983          	lw	s3,12(sp)
8000f47c:	00812a03          	lw	s4,8(sp)
8000f480:	00412a83          	lw	s5,4(sp)
8000f484:	00012b03          	lw	s6,0(sp)
8000f488:	02010113          	addi	sp,sp,32
8000f48c:	00008067          	ret
8000f490:	01042583          	lw	a1,16(s0)
8000f494:	00098613          	mv	a2,s3
8000f498:	d8dfe0ef          	jal	ra,8000e224 <memcpy>
8000f49c:	00c45783          	lhu	a5,12(s0)
8000f4a0:	b7f7f793          	andi	a5,a5,-1153
8000f4a4:	0807e793          	ori	a5,a5,128
8000f4a8:	00f41623          	sh	a5,12(s0)
8000f4ac:	01242823          	sw	s2,16(s0)
8000f4b0:	00942a23          	sw	s1,20(s0)
8000f4b4:	01390933          	add	s2,s2,s3
8000f4b8:	413484b3          	sub	s1,s1,s3
8000f4bc:	01242023          	sw	s2,0(s0)
8000f4c0:	00942423          	sw	s1,8(s0)
8000f4c4:	000a0913          	mv	s2,s4
8000f4c8:	012a7463          	bgeu	s4,s2,8000f4d0 <__ssputs_r+0x118>
8000f4cc:	000a0913          	mv	s2,s4
8000f4d0:	00042503          	lw	a0,0(s0)
8000f4d4:	00090613          	mv	a2,s2
8000f4d8:	000b0593          	mv	a1,s6
8000f4dc:	e21fe0ef          	jal	ra,8000e2fc <memmove>
8000f4e0:	00842783          	lw	a5,8(s0)
8000f4e4:	00000513          	li	a0,0
8000f4e8:	412787b3          	sub	a5,a5,s2
8000f4ec:	00f42423          	sw	a5,8(s0)
8000f4f0:	00042783          	lw	a5,0(s0)
8000f4f4:	01278933          	add	s2,a5,s2
8000f4f8:	01242023          	sw	s2,0(s0)
8000f4fc:	f6dff06f          	j	8000f468 <__ssputs_r+0xb0>
8000f500:	00048613          	mv	a2,s1
8000f504:	000a8513          	mv	a0,s5
8000f508:	6f0010ef          	jal	ra,80010bf8 <_realloc_r>
8000f50c:	00050913          	mv	s2,a0
8000f510:	f8051ee3          	bnez	a0,8000f4ac <__ssputs_r+0xf4>
8000f514:	01042583          	lw	a1,16(s0)
8000f518:	000a8513          	mv	a0,s5
8000f51c:	e91fe0ef          	jal	ra,8000e3ac <_free_r>
8000f520:	f31ff06f          	j	8000f450 <__ssputs_r+0x98>

Disassembly of section .text.__ssprint_r:

8000f524 <__ssprint_r>:
8000f524:	00862783          	lw	a5,8(a2)
8000f528:	fd010113          	addi	sp,sp,-48
8000f52c:	01312e23          	sw	s3,28(sp)
8000f530:	02112623          	sw	ra,44(sp)
8000f534:	02812423          	sw	s0,40(sp)
8000f538:	02912223          	sw	s1,36(sp)
8000f53c:	03212023          	sw	s2,32(sp)
8000f540:	01412c23          	sw	s4,24(sp)
8000f544:	01512a23          	sw	s5,20(sp)
8000f548:	01612823          	sw	s6,16(sp)
8000f54c:	01712623          	sw	s7,12(sp)
8000f550:	01812423          	sw	s8,8(sp)
8000f554:	00060993          	mv	s3,a2
8000f558:	12078663          	beqz	a5,8000f684 <__ssprint_r+0x160>
8000f55c:	00062b03          	lw	s6,0(a2)
8000f560:	00050a93          	mv	s5,a0
8000f564:	00058413          	mv	s0,a1
8000f568:	00000b93          	li	s7,0
8000f56c:	00000913          	li	s2,0
8000f570:	08090663          	beqz	s2,8000f5fc <__ssprint_r+0xd8>
8000f574:	00842a03          	lw	s4,8(s0)
8000f578:	0d496663          	bltu	s2,s4,8000f644 <__ssprint_r+0x120>
8000f57c:	00c45783          	lhu	a5,12(s0)
8000f580:	4807f713          	andi	a4,a5,1152
8000f584:	0c070063          	beqz	a4,8000f644 <__ssprint_r+0x120>
8000f588:	00042483          	lw	s1,0(s0)
8000f58c:	01442703          	lw	a4,20(s0)
8000f590:	01042583          	lw	a1,16(s0)
8000f594:	40b48c33          	sub	s8,s1,a1
8000f598:	00171493          	slli	s1,a4,0x1
8000f59c:	00e48733          	add	a4,s1,a4
8000f5a0:	01f75493          	srli	s1,a4,0x1f
8000f5a4:	00e484b3          	add	s1,s1,a4
8000f5a8:	001c0713          	addi	a4,s8,1
8000f5ac:	4014d493          	srai	s1,s1,0x1
8000f5b0:	01270733          	add	a4,a4,s2
8000f5b4:	00e4f463          	bgeu	s1,a4,8000f5bc <__ssprint_r+0x98>
8000f5b8:	00070493          	mv	s1,a4
8000f5bc:	4007f793          	andi	a5,a5,1024
8000f5c0:	0e078e63          	beqz	a5,8000f6bc <__ssprint_r+0x198>
8000f5c4:	00048593          	mv	a1,s1
8000f5c8:	000a8513          	mv	a0,s5
8000f5cc:	ee5fe0ef          	jal	ra,8000e4b0 <_malloc_r>
8000f5d0:	00050a13          	mv	s4,a0
8000f5d4:	02051c63          	bnez	a0,8000f60c <__ssprint_r+0xe8>
8000f5d8:	00c00793          	li	a5,12
8000f5dc:	00faa023          	sw	a5,0(s5)
8000f5e0:	00c45783          	lhu	a5,12(s0)
8000f5e4:	fff00513          	li	a0,-1
8000f5e8:	0407e793          	ori	a5,a5,64
8000f5ec:	00f41623          	sh	a5,12(s0)
8000f5f0:	0009a423          	sw	zero,8(s3) # 80000008 <_ram_heap_end+0xfffee008>
8000f5f4:	0009a223          	sw	zero,4(s3)
8000f5f8:	0940006f          	j	8000f68c <__ssprint_r+0x168>
8000f5fc:	000b2b83          	lw	s7,0(s6)
8000f600:	004b2903          	lw	s2,4(s6)
8000f604:	008b0b13          	addi	s6,s6,8
8000f608:	f69ff06f          	j	8000f570 <__ssprint_r+0x4c>
8000f60c:	01042583          	lw	a1,16(s0)
8000f610:	000c0613          	mv	a2,s8
8000f614:	c11fe0ef          	jal	ra,8000e224 <memcpy>
8000f618:	00c45783          	lhu	a5,12(s0)
8000f61c:	b7f7f793          	andi	a5,a5,-1153
8000f620:	0807e793          	ori	a5,a5,128
8000f624:	00f41623          	sh	a5,12(s0)
8000f628:	01442823          	sw	s4,16(s0)
8000f62c:	00942a23          	sw	s1,20(s0)
8000f630:	018a0a33          	add	s4,s4,s8
8000f634:	418484b3          	sub	s1,s1,s8
8000f638:	01442023          	sw	s4,0(s0)
8000f63c:	00942423          	sw	s1,8(s0)
8000f640:	00090a13          	mv	s4,s2
8000f644:	01497463          	bgeu	s2,s4,8000f64c <__ssprint_r+0x128>
8000f648:	00090a13          	mv	s4,s2
8000f64c:	00042503          	lw	a0,0(s0)
8000f650:	000a0613          	mv	a2,s4
8000f654:	000b8593          	mv	a1,s7
8000f658:	ca5fe0ef          	jal	ra,8000e2fc <memmove>
8000f65c:	00842783          	lw	a5,8(s0)
8000f660:	414787b3          	sub	a5,a5,s4
8000f664:	00f42423          	sw	a5,8(s0)
8000f668:	00042783          	lw	a5,0(s0)
8000f66c:	01478a33          	add	s4,a5,s4
8000f670:	0089a783          	lw	a5,8(s3)
8000f674:	01442023          	sw	s4,0(s0)
8000f678:	41278933          	sub	s2,a5,s2
8000f67c:	0129a423          	sw	s2,8(s3)
8000f680:	f6091ee3          	bnez	s2,8000f5fc <__ssprint_r+0xd8>
8000f684:	0009a223          	sw	zero,4(s3)
8000f688:	00000513          	li	a0,0
8000f68c:	02c12083          	lw	ra,44(sp)
8000f690:	02812403          	lw	s0,40(sp)
8000f694:	02412483          	lw	s1,36(sp)
8000f698:	02012903          	lw	s2,32(sp)
8000f69c:	01c12983          	lw	s3,28(sp)
8000f6a0:	01812a03          	lw	s4,24(sp)
8000f6a4:	01412a83          	lw	s5,20(sp)
8000f6a8:	01012b03          	lw	s6,16(sp)
8000f6ac:	00c12b83          	lw	s7,12(sp)
8000f6b0:	00812c03          	lw	s8,8(sp)
8000f6b4:	03010113          	addi	sp,sp,48
8000f6b8:	00008067          	ret
8000f6bc:	00048613          	mv	a2,s1
8000f6c0:	000a8513          	mv	a0,s5
8000f6c4:	534010ef          	jal	ra,80010bf8 <_realloc_r>
8000f6c8:	00050a13          	mv	s4,a0
8000f6cc:	f4051ee3          	bnez	a0,8000f628 <__ssprint_r+0x104>
8000f6d0:	01042583          	lw	a1,16(s0)
8000f6d4:	000a8513          	mv	a0,s5
8000f6d8:	cd5fe0ef          	jal	ra,8000e3ac <_free_r>
8000f6dc:	efdff06f          	j	8000f5d8 <__ssprint_r+0xb4>

Disassembly of section .text._svfprintf_r:

8000f6e0 <_svfiprintf_r>:
8000f6e0:	00c5d783          	lhu	a5,12(a1)
8000f6e4:	f5010113          	addi	sp,sp,-176
8000f6e8:	0a912223          	sw	s1,164(sp)
8000f6ec:	0b212023          	sw	s2,160(sp)
8000f6f0:	09312e23          	sw	s3,156(sp)
8000f6f4:	0a112623          	sw	ra,172(sp)
8000f6f8:	0a812423          	sw	s0,168(sp)
8000f6fc:	09412c23          	sw	s4,152(sp)
8000f700:	09512a23          	sw	s5,148(sp)
8000f704:	09612823          	sw	s6,144(sp)
8000f708:	09712623          	sw	s7,140(sp)
8000f70c:	09812423          	sw	s8,136(sp)
8000f710:	09912223          	sw	s9,132(sp)
8000f714:	0807f793          	andi	a5,a5,128
8000f718:	00050993          	mv	s3,a0
8000f71c:	00058913          	mv	s2,a1
8000f720:	00060493          	mv	s1,a2
8000f724:	06078863          	beqz	a5,8000f794 <_svfiprintf_r+0xb4>
8000f728:	0105a783          	lw	a5,16(a1)
8000f72c:	06079463          	bnez	a5,8000f794 <_svfiprintf_r+0xb4>
8000f730:	04000593          	li	a1,64
8000f734:	00d12623          	sw	a3,12(sp)
8000f738:	d79fe0ef          	jal	ra,8000e4b0 <_malloc_r>
8000f73c:	00a92023          	sw	a0,0(s2)
8000f740:	00a92823          	sw	a0,16(s2)
8000f744:	00c12683          	lw	a3,12(sp)
8000f748:	04051263          	bnez	a0,8000f78c <_svfiprintf_r+0xac>
8000f74c:	00c00793          	li	a5,12
8000f750:	00f9a023          	sw	a5,0(s3)
8000f754:	fff00513          	li	a0,-1
8000f758:	0ac12083          	lw	ra,172(sp)
8000f75c:	0a812403          	lw	s0,168(sp)
8000f760:	0a412483          	lw	s1,164(sp)
8000f764:	0a012903          	lw	s2,160(sp)
8000f768:	09c12983          	lw	s3,156(sp)
8000f76c:	09812a03          	lw	s4,152(sp)
8000f770:	09412a83          	lw	s5,148(sp)
8000f774:	09012b03          	lw	s6,144(sp)
8000f778:	08c12b83          	lw	s7,140(sp)
8000f77c:	08812c03          	lw	s8,136(sp)
8000f780:	08412c83          	lw	s9,132(sp)
8000f784:	0b010113          	addi	sp,sp,176
8000f788:	00008067          	ret
8000f78c:	04000793          	li	a5,64
8000f790:	00f92a23          	sw	a5,20(s2)
8000f794:	02000793          	li	a5,32
8000f798:	02f10ca3          	sb	a5,57(sp)
8000f79c:	03000793          	li	a5,48
8000f7a0:	02012a23          	sw	zero,52(sp)
8000f7a4:	02f10d23          	sb	a5,58(sp)
8000f7a8:	00d12e23          	sw	a3,28(sp)
8000f7ac:	02500b13          	li	s6,37
8000f7b0:	ffff3a97          	auipc	s5,0xffff3
8000f7b4:	708a8a93          	addi	s5,s5,1800 # 80002eb8 <__sf_fake_stdout+0x20>
8000f7b8:	00100b93          	li	s7,1
8000f7bc:	7fff1c17          	auipc	s8,0x7fff1
8000f7c0:	844c0c13          	addi	s8,s8,-1980 # 0 <_ram_heap_end+0x7ffee000>
8000f7c4:	00048413          	mv	s0,s1
8000f7c8:	00044783          	lbu	a5,0(s0)
8000f7cc:	00078463          	beqz	a5,8000f7d4 <_svfiprintf_r+0xf4>
8000f7d0:	0d679663          	bne	a5,s6,8000f89c <_svfiprintf_r+0x1bc>
8000f7d4:	40940cb3          	sub	s9,s0,s1
8000f7d8:	020c8663          	beqz	s9,8000f804 <_svfiprintf_r+0x124>
8000f7dc:	000c8693          	mv	a3,s9
8000f7e0:	00048613          	mv	a2,s1
8000f7e4:	00090593          	mv	a1,s2
8000f7e8:	00098513          	mv	a0,s3
8000f7ec:	bcdff0ef          	jal	ra,8000f3b8 <__ssputs_r>
8000f7f0:	fff00793          	li	a5,-1
8000f7f4:	24f50e63          	beq	a0,a5,8000fa50 <_svfiprintf_r+0x370>
8000f7f8:	03412683          	lw	a3,52(sp)
8000f7fc:	019686b3          	add	a3,a3,s9
8000f800:	02d12a23          	sw	a3,52(sp)
8000f804:	00044783          	lbu	a5,0(s0)
8000f808:	24078463          	beqz	a5,8000fa50 <_svfiprintf_r+0x370>
8000f80c:	fff00793          	li	a5,-1
8000f810:	00140493          	addi	s1,s0,1
8000f814:	02012023          	sw	zero,32(sp)
8000f818:	02012623          	sw	zero,44(sp)
8000f81c:	02f12223          	sw	a5,36(sp)
8000f820:	02012423          	sw	zero,40(sp)
8000f824:	060101a3          	sb	zero,99(sp)
8000f828:	06012c23          	sw	zero,120(sp)
8000f82c:	0004c583          	lbu	a1,0(s1)
8000f830:	00500613          	li	a2,5
8000f834:	000a8513          	mv	a0,s5
8000f838:	39c010ef          	jal	ra,80010bd4 <memchr>
8000f83c:	00148413          	addi	s0,s1,1
8000f840:	02012783          	lw	a5,32(sp)
8000f844:	06051063          	bnez	a0,8000f8a4 <_svfiprintf_r+0x1c4>
8000f848:	0107f713          	andi	a4,a5,16
8000f84c:	00070663          	beqz	a4,8000f858 <_svfiprintf_r+0x178>
8000f850:	02000713          	li	a4,32
8000f854:	06e101a3          	sb	a4,99(sp)
8000f858:	0087f713          	andi	a4,a5,8
8000f85c:	00070663          	beqz	a4,8000f868 <_svfiprintf_r+0x188>
8000f860:	02b00713          	li	a4,43
8000f864:	06e101a3          	sb	a4,99(sp)
8000f868:	0004c683          	lbu	a3,0(s1)
8000f86c:	02a00713          	li	a4,42
8000f870:	04e68663          	beq	a3,a4,8000f8bc <_svfiprintf_r+0x1dc>
8000f874:	02c12703          	lw	a4,44(sp)
8000f878:	00048413          	mv	s0,s1
8000f87c:	00000793          	li	a5,0
8000f880:	00900613          	li	a2,9
8000f884:	00044683          	lbu	a3,0(s0)
8000f888:	00140593          	addi	a1,s0,1
8000f88c:	fd068693          	addi	a3,a3,-48
8000f890:	10d67a63          	bgeu	a2,a3,8000f9a4 <_svfiprintf_r+0x2c4>
8000f894:	02079e63          	bnez	a5,8000f8d0 <_svfiprintf_r+0x1f0>
8000f898:	0500006f          	j	8000f8e8 <_svfiprintf_r+0x208>
8000f89c:	00140413          	addi	s0,s0,1
8000f8a0:	f29ff06f          	j	8000f7c8 <_svfiprintf_r+0xe8>
8000f8a4:	41550533          	sub	a0,a0,s5
8000f8a8:	00ab9533          	sll	a0,s7,a0
8000f8ac:	00a7e7b3          	or	a5,a5,a0
8000f8b0:	02f12023          	sw	a5,32(sp)
8000f8b4:	00040493          	mv	s1,s0
8000f8b8:	f75ff06f          	j	8000f82c <_svfiprintf_r+0x14c>
8000f8bc:	01c12703          	lw	a4,28(sp)
8000f8c0:	00470693          	addi	a3,a4,4 # ffffe004 <_ram_heap_end+0x7ffec004>
8000f8c4:	00072703          	lw	a4,0(a4)
8000f8c8:	00d12e23          	sw	a3,28(sp)
8000f8cc:	00074663          	bltz	a4,8000f8d8 <_svfiprintf_r+0x1f8>
8000f8d0:	02e12623          	sw	a4,44(sp)
8000f8d4:	0140006f          	j	8000f8e8 <_svfiprintf_r+0x208>
8000f8d8:	40e00733          	neg	a4,a4
8000f8dc:	0027e793          	ori	a5,a5,2
8000f8e0:	02e12623          	sw	a4,44(sp)
8000f8e4:	02f12023          	sw	a5,32(sp)
8000f8e8:	00044703          	lbu	a4,0(s0)
8000f8ec:	02e00793          	li	a5,46
8000f8f0:	02f71663          	bne	a4,a5,8000f91c <_svfiprintf_r+0x23c>
8000f8f4:	00144703          	lbu	a4,1(s0)
8000f8f8:	02a00793          	li	a5,42
8000f8fc:	0cf71663          	bne	a4,a5,8000f9c8 <_svfiprintf_r+0x2e8>
8000f900:	01c12783          	lw	a5,28(sp)
8000f904:	00240413          	addi	s0,s0,2
8000f908:	00478713          	addi	a4,a5,4
8000f90c:	0007a783          	lw	a5,0(a5)
8000f910:	00e12e23          	sw	a4,28(sp)
8000f914:	0a07c663          	bltz	a5,8000f9c0 <_svfiprintf_r+0x2e0>
8000f918:	02f12223          	sw	a5,36(sp)
8000f91c:	00044583          	lbu	a1,0(s0)
8000f920:	00300613          	li	a2,3
8000f924:	ffff3517          	auipc	a0,0xffff3
8000f928:	59c50513          	addi	a0,a0,1436 # 80002ec0 <__sf_fake_stdout+0x28>
8000f92c:	2a8010ef          	jal	ra,80010bd4 <memchr>
8000f930:	02050463          	beqz	a0,8000f958 <_svfiprintf_r+0x278>
8000f934:	ffff3797          	auipc	a5,0xffff3
8000f938:	58c78793          	addi	a5,a5,1420 # 80002ec0 <__sf_fake_stdout+0x28>
8000f93c:	40f50533          	sub	a0,a0,a5
8000f940:	04000793          	li	a5,64
8000f944:	00a797b3          	sll	a5,a5,a0
8000f948:	02012503          	lw	a0,32(sp)
8000f94c:	00140413          	addi	s0,s0,1
8000f950:	00f56533          	or	a0,a0,a5
8000f954:	02a12023          	sw	a0,32(sp)
8000f958:	00044583          	lbu	a1,0(s0)
8000f95c:	00600613          	li	a2,6
8000f960:	ffff3517          	auipc	a0,0xffff3
8000f964:	56450513          	addi	a0,a0,1380 # 80002ec4 <__sf_fake_stdout+0x2c>
8000f968:	00140493          	addi	s1,s0,1
8000f96c:	02b10c23          	sb	a1,56(sp)
8000f970:	264010ef          	jal	ra,80010bd4 <memchr>
8000f974:	0e050a63          	beqz	a0,8000fa68 <_svfiprintf_r+0x388>
8000f978:	0a0c1663          	bnez	s8,8000fa24 <_svfiprintf_r+0x344>
8000f97c:	02012703          	lw	a4,32(sp)
8000f980:	01c12783          	lw	a5,28(sp)
8000f984:	10077713          	andi	a4,a4,256
8000f988:	08070663          	beqz	a4,8000fa14 <_svfiprintf_r+0x334>
8000f98c:	00478793          	addi	a5,a5,4
8000f990:	00f12e23          	sw	a5,28(sp)
8000f994:	03412783          	lw	a5,52(sp)
8000f998:	014787b3          	add	a5,a5,s4
8000f99c:	02f12a23          	sw	a5,52(sp)
8000f9a0:	e25ff06f          	j	8000f7c4 <_svfiprintf_r+0xe4>
8000f9a4:	00271793          	slli	a5,a4,0x2
8000f9a8:	00e787b3          	add	a5,a5,a4
8000f9ac:	00179793          	slli	a5,a5,0x1
8000f9b0:	00d78733          	add	a4,a5,a3
8000f9b4:	00058413          	mv	s0,a1
8000f9b8:	00100793          	li	a5,1
8000f9bc:	ec9ff06f          	j	8000f884 <_svfiprintf_r+0x1a4>
8000f9c0:	fff00793          	li	a5,-1
8000f9c4:	f55ff06f          	j	8000f918 <_svfiprintf_r+0x238>
8000f9c8:	00140413          	addi	s0,s0,1
8000f9cc:	02012223          	sw	zero,36(sp)
8000f9d0:	00000793          	li	a5,0
8000f9d4:	00000713          	li	a4,0
8000f9d8:	00900613          	li	a2,9
8000f9dc:	00044683          	lbu	a3,0(s0)
8000f9e0:	00140593          	addi	a1,s0,1
8000f9e4:	fd068693          	addi	a3,a3,-48
8000f9e8:	00d67863          	bgeu	a2,a3,8000f9f8 <_svfiprintf_r+0x318>
8000f9ec:	f20788e3          	beqz	a5,8000f91c <_svfiprintf_r+0x23c>
8000f9f0:	02e12223          	sw	a4,36(sp)
8000f9f4:	f29ff06f          	j	8000f91c <_svfiprintf_r+0x23c>
8000f9f8:	00271793          	slli	a5,a4,0x2
8000f9fc:	00e787b3          	add	a5,a5,a4
8000fa00:	00179793          	slli	a5,a5,0x1
8000fa04:	00d78733          	add	a4,a5,a3
8000fa08:	00058413          	mv	s0,a1
8000fa0c:	00100793          	li	a5,1
8000fa10:	fcdff06f          	j	8000f9dc <_svfiprintf_r+0x2fc>
8000fa14:	00778793          	addi	a5,a5,7
8000fa18:	ff87f793          	andi	a5,a5,-8
8000fa1c:	00878793          	addi	a5,a5,8
8000fa20:	f71ff06f          	j	8000f990 <_svfiprintf_r+0x2b0>
8000fa24:	01c10713          	addi	a4,sp,28
8000fa28:	00000697          	auipc	a3,0x0
8000fa2c:	99068693          	addi	a3,a3,-1648 # 8000f3b8 <__ssputs_r>
8000fa30:	00090613          	mv	a2,s2
8000fa34:	02010593          	addi	a1,sp,32
8000fa38:	00098513          	mv	a0,s3
8000fa3c:	00000097          	auipc	ra,0x0
8000fa40:	000000e7          	jalr	zero # 0 <_ram_heap_size>
8000fa44:	fff00793          	li	a5,-1
8000fa48:	00050a13          	mv	s4,a0
8000fa4c:	f4f514e3          	bne	a0,a5,8000f994 <_svfiprintf_r+0x2b4>
8000fa50:	00c95783          	lhu	a5,12(s2)
8000fa54:	fff00513          	li	a0,-1
8000fa58:	0407f793          	andi	a5,a5,64
8000fa5c:	ce079ee3          	bnez	a5,8000f758 <_svfiprintf_r+0x78>
8000fa60:	03412503          	lw	a0,52(sp)
8000fa64:	cf5ff06f          	j	8000f758 <_svfiprintf_r+0x78>
8000fa68:	01c10713          	addi	a4,sp,28
8000fa6c:	00000697          	auipc	a3,0x0
8000fa70:	94c68693          	addi	a3,a3,-1716 # 8000f3b8 <__ssputs_r>
8000fa74:	00090613          	mv	a2,s2
8000fa78:	02010593          	addi	a1,sp,32
8000fa7c:	00098513          	mv	a0,s3
8000fa80:	1b8000ef          	jal	ra,8000fc38 <_printf_i>
8000fa84:	fc1ff06f          	j	8000fa44 <_svfiprintf_r+0x364>

Disassembly of section .text._printf_common:

8000fa88 <_printf_common>:
8000fa88:	fd010113          	addi	sp,sp,-48
8000fa8c:	01512a23          	sw	s5,20(sp)
8000fa90:	0105a783          	lw	a5,16(a1)
8000fa94:	00070a93          	mv	s5,a4
8000fa98:	0085a703          	lw	a4,8(a1)
8000fa9c:	02812423          	sw	s0,40(sp)
8000faa0:	02912223          	sw	s1,36(sp)
8000faa4:	01312e23          	sw	s3,28(sp)
8000faa8:	01412c23          	sw	s4,24(sp)
8000faac:	02112623          	sw	ra,44(sp)
8000fab0:	03212023          	sw	s2,32(sp)
8000fab4:	01612823          	sw	s6,16(sp)
8000fab8:	01712623          	sw	s7,12(sp)
8000fabc:	00050993          	mv	s3,a0
8000fac0:	00058413          	mv	s0,a1
8000fac4:	00060493          	mv	s1,a2
8000fac8:	00068a13          	mv	s4,a3
8000facc:	00e7d463          	bge	a5,a4,8000fad4 <_printf_common+0x4c>
8000fad0:	00070793          	mv	a5,a4
8000fad4:	00f4a023          	sw	a5,0(s1)
8000fad8:	04344703          	lbu	a4,67(s0)
8000fadc:	00070663          	beqz	a4,8000fae8 <_printf_common+0x60>
8000fae0:	00178793          	addi	a5,a5,1
8000fae4:	00f4a023          	sw	a5,0(s1)
8000fae8:	00042783          	lw	a5,0(s0)
8000faec:	0207f793          	andi	a5,a5,32
8000faf0:	00078863          	beqz	a5,8000fb00 <_printf_common+0x78>
8000faf4:	0004a783          	lw	a5,0(s1)
8000faf8:	00278793          	addi	a5,a5,2
8000fafc:	00f4a023          	sw	a5,0(s1)
8000fb00:	00042903          	lw	s2,0(s0)
8000fb04:	00697913          	andi	s2,s2,6
8000fb08:	00091e63          	bnez	s2,8000fb24 <_printf_common+0x9c>
8000fb0c:	01940b13          	addi	s6,s0,25
8000fb10:	fff00b93          	li	s7,-1
8000fb14:	00c42783          	lw	a5,12(s0)
8000fb18:	0004a703          	lw	a4,0(s1)
8000fb1c:	40e787b3          	sub	a5,a5,a4
8000fb20:	08f94263          	blt	s2,a5,8000fba4 <_printf_common+0x11c>
8000fb24:	00042783          	lw	a5,0(s0)
8000fb28:	04344683          	lbu	a3,67(s0)
8000fb2c:	0207f793          	andi	a5,a5,32
8000fb30:	00d036b3          	snez	a3,a3
8000fb34:	0c079063          	bnez	a5,8000fbf4 <_printf_common+0x16c>
8000fb38:	04340613          	addi	a2,s0,67
8000fb3c:	000a0593          	mv	a1,s4
8000fb40:	00098513          	mv	a0,s3
8000fb44:	000a80e7          	jalr	s5
8000fb48:	fff00793          	li	a5,-1
8000fb4c:	06f50863          	beq	a0,a5,8000fbbc <_printf_common+0x134>
8000fb50:	00042783          	lw	a5,0(s0)
8000fb54:	00400613          	li	a2,4
8000fb58:	0004a703          	lw	a4,0(s1)
8000fb5c:	0067f793          	andi	a5,a5,6
8000fb60:	00c42683          	lw	a3,12(s0)
8000fb64:	00000493          	li	s1,0
8000fb68:	00c79863          	bne	a5,a2,8000fb78 <_printf_common+0xf0>
8000fb6c:	40e684b3          	sub	s1,a3,a4
8000fb70:	0004d463          	bgez	s1,8000fb78 <_printf_common+0xf0>
8000fb74:	00000493          	li	s1,0
8000fb78:	00842783          	lw	a5,8(s0)
8000fb7c:	01042703          	lw	a4,16(s0)
8000fb80:	00f75663          	bge	a4,a5,8000fb8c <_printf_common+0x104>
8000fb84:	40e787b3          	sub	a5,a5,a4
8000fb88:	00f484b3          	add	s1,s1,a5
8000fb8c:	00000913          	li	s2,0
8000fb90:	01a40413          	addi	s0,s0,26
8000fb94:	fff00b13          	li	s6,-1
8000fb98:	09249063          	bne	s1,s2,8000fc18 <_printf_common+0x190>
8000fb9c:	00000513          	li	a0,0
8000fba0:	0200006f          	j	8000fbc0 <_printf_common+0x138>
8000fba4:	00100693          	li	a3,1
8000fba8:	000b0613          	mv	a2,s6
8000fbac:	000a0593          	mv	a1,s4
8000fbb0:	00098513          	mv	a0,s3
8000fbb4:	000a80e7          	jalr	s5
8000fbb8:	03751a63          	bne	a0,s7,8000fbec <_printf_common+0x164>
8000fbbc:	fff00513          	li	a0,-1
8000fbc0:	02c12083          	lw	ra,44(sp)
8000fbc4:	02812403          	lw	s0,40(sp)
8000fbc8:	02412483          	lw	s1,36(sp)
8000fbcc:	02012903          	lw	s2,32(sp)
8000fbd0:	01c12983          	lw	s3,28(sp)
8000fbd4:	01812a03          	lw	s4,24(sp)
8000fbd8:	01412a83          	lw	s5,20(sp)
8000fbdc:	01012b03          	lw	s6,16(sp)
8000fbe0:	00c12b83          	lw	s7,12(sp)
8000fbe4:	03010113          	addi	sp,sp,48
8000fbe8:	00008067          	ret
8000fbec:	00190913          	addi	s2,s2,1
8000fbf0:	f25ff06f          	j	8000fb14 <_printf_common+0x8c>
8000fbf4:	00d40733          	add	a4,s0,a3
8000fbf8:	03000613          	li	a2,48
8000fbfc:	04c701a3          	sb	a2,67(a4)
8000fc00:	04544703          	lbu	a4,69(s0)
8000fc04:	00168793          	addi	a5,a3,1
8000fc08:	00f407b3          	add	a5,s0,a5
8000fc0c:	00268693          	addi	a3,a3,2
8000fc10:	04e781a3          	sb	a4,67(a5)
8000fc14:	f25ff06f          	j	8000fb38 <_printf_common+0xb0>
8000fc18:	00100693          	li	a3,1
8000fc1c:	00040613          	mv	a2,s0
8000fc20:	000a0593          	mv	a1,s4
8000fc24:	00098513          	mv	a0,s3
8000fc28:	000a80e7          	jalr	s5
8000fc2c:	f96508e3          	beq	a0,s6,8000fbbc <_printf_common+0x134>
8000fc30:	00190913          	addi	s2,s2,1
8000fc34:	f65ff06f          	j	8000fb98 <_printf_common+0x110>

Disassembly of section .text._printf_i:

8000fc38 <_printf_i>:
8000fc38:	fc010113          	addi	sp,sp,-64
8000fc3c:	02812c23          	sw	s0,56(sp)
8000fc40:	03312623          	sw	s3,44(sp)
8000fc44:	03512223          	sw	s5,36(sp)
8000fc48:	03612023          	sw	s6,32(sp)
8000fc4c:	01712e23          	sw	s7,28(sp)
8000fc50:	02112e23          	sw	ra,60(sp)
8000fc54:	02912a23          	sw	s1,52(sp)
8000fc58:	03212823          	sw	s2,48(sp)
8000fc5c:	03412423          	sw	s4,40(sp)
8000fc60:	01812c23          	sw	s8,24(sp)
8000fc64:	0185c783          	lbu	a5,24(a1)
8000fc68:	00068b93          	mv	s7,a3
8000fc6c:	06e00693          	li	a3,110
8000fc70:	00050a93          	mv	s5,a0
8000fc74:	00058413          	mv	s0,a1
8000fc78:	00060b13          	mv	s6,a2
8000fc7c:	04358993          	addi	s3,a1,67
8000fc80:	28d78c63          	beq	a5,a3,8000ff18 <_printf_i+0x2e0>
8000fc84:	06f6e863          	bltu	a3,a5,8000fcf4 <_printf_i+0xbc>
8000fc88:	06300693          	li	a3,99
8000fc8c:	0ad78c63          	beq	a5,a3,8000fd44 <_printf_i+0x10c>
8000fc90:	00f6ec63          	bltu	a3,a5,8000fca8 <_printf_i+0x70>
8000fc94:	2c078063          	beqz	a5,8000ff54 <_printf_i+0x31c>
8000fc98:	05800693          	li	a3,88
8000fc9c:	12d78863          	beq	a5,a3,8000fdcc <_printf_i+0x194>
8000fca0:	04240c13          	addi	s8,s0,66
8000fca4:	0b40006f          	j	8000fd58 <_printf_i+0x120>
8000fca8:	06400693          	li	a3,100
8000fcac:	00d78663          	beq	a5,a3,8000fcb8 <_printf_i+0x80>
8000fcb0:	06900693          	li	a3,105
8000fcb4:	fed796e3          	bne	a5,a3,8000fca0 <_printf_i+0x68>
8000fcb8:	00042783          	lw	a5,0(s0)
8000fcbc:	00072603          	lw	a2,0(a4)
8000fcc0:	0807f593          	andi	a1,a5,128
8000fcc4:	00460693          	addi	a3,a2,4
8000fcc8:	08058e63          	beqz	a1,8000fd64 <_printf_i+0x12c>
8000fccc:	00062483          	lw	s1,0(a2)
8000fcd0:	00d72023          	sw	a3,0(a4)
8000fcd4:	0004d863          	bgez	s1,8000fce4 <_printf_i+0xac>
8000fcd8:	02d00793          	li	a5,45
8000fcdc:	409004b3          	neg	s1,s1
8000fce0:	04f401a3          	sb	a5,67(s0)
8000fce4:	ffff3a17          	auipc	s4,0xffff3
8000fce8:	1e8a0a13          	addi	s4,s4,488 # 80002ecc <__sf_fake_stdout+0x34>
8000fcec:	00a00913          	li	s2,10
8000fcf0:	12c0006f          	j	8000fe1c <_printf_i+0x1e4>
8000fcf4:	07300693          	li	a3,115
8000fcf8:	26d78463          	beq	a5,a3,8000ff60 <_printf_i+0x328>
8000fcfc:	02f6e263          	bltu	a3,a5,8000fd20 <_printf_i+0xe8>
8000fd00:	06f00693          	li	a3,111
8000fd04:	06d78e63          	beq	a5,a3,8000fd80 <_printf_i+0x148>
8000fd08:	07000693          	li	a3,112
8000fd0c:	f8d79ae3          	bne	a5,a3,8000fca0 <_printf_i+0x68>
8000fd10:	0005a783          	lw	a5,0(a1)
8000fd14:	0207e793          	ori	a5,a5,32
8000fd18:	00f5a023          	sw	a5,0(a1)
8000fd1c:	0140006f          	j	8000fd30 <_printf_i+0xf8>
8000fd20:	07500693          	li	a3,117
8000fd24:	04d78e63          	beq	a5,a3,8000fd80 <_printf_i+0x148>
8000fd28:	07800693          	li	a3,120
8000fd2c:	f6d79ae3          	bne	a5,a3,8000fca0 <_printf_i+0x68>
8000fd30:	07800793          	li	a5,120
8000fd34:	04f402a3          	sb	a5,69(s0)
8000fd38:	ffff3a17          	auipc	s4,0xffff3
8000fd3c:	1a8a0a13          	addi	s4,s4,424 # 80002ee0 <__sf_fake_stdout+0x48>
8000fd40:	0980006f          	j	8000fdd8 <_printf_i+0x1a0>
8000fd44:	00072783          	lw	a5,0(a4)
8000fd48:	04258c13          	addi	s8,a1,66
8000fd4c:	00478693          	addi	a3,a5,4
8000fd50:	0007a783          	lw	a5,0(a5)
8000fd54:	00d72023          	sw	a3,0(a4)
8000fd58:	04f40123          	sb	a5,66(s0)
8000fd5c:	00100793          	li	a5,1
8000fd60:	2300006f          	j	8000ff90 <_printf_i+0x358>
8000fd64:	00062483          	lw	s1,0(a2)
8000fd68:	0407f793          	andi	a5,a5,64
8000fd6c:	00d72023          	sw	a3,0(a4)
8000fd70:	f60782e3          	beqz	a5,8000fcd4 <_printf_i+0x9c>
8000fd74:	01049493          	slli	s1,s1,0x10
8000fd78:	4104d493          	srai	s1,s1,0x10
8000fd7c:	f59ff06f          	j	8000fcd4 <_printf_i+0x9c>
8000fd80:	00042603          	lw	a2,0(s0)
8000fd84:	00072683          	lw	a3,0(a4)
8000fd88:	08067513          	andi	a0,a2,128
8000fd8c:	00468593          	addi	a1,a3,4
8000fd90:	00050863          	beqz	a0,8000fda0 <_printf_i+0x168>
8000fd94:	00b72023          	sw	a1,0(a4)
8000fd98:	0006a483          	lw	s1,0(a3)
8000fd9c:	0140006f          	j	8000fdb0 <_printf_i+0x178>
8000fda0:	04067613          	andi	a2,a2,64
8000fda4:	00b72023          	sw	a1,0(a4)
8000fda8:	fe0608e3          	beqz	a2,8000fd98 <_printf_i+0x160>
8000fdac:	0006d483          	lhu	s1,0(a3)
8000fdb0:	06f00713          	li	a4,111
8000fdb4:	ffff3a17          	auipc	s4,0xffff3
8000fdb8:	118a0a13          	addi	s4,s4,280 # 80002ecc <__sf_fake_stdout+0x34>
8000fdbc:	00a00913          	li	s2,10
8000fdc0:	04e79c63          	bne	a5,a4,8000fe18 <_printf_i+0x1e0>
8000fdc4:	00800913          	li	s2,8
8000fdc8:	0500006f          	j	8000fe18 <_printf_i+0x1e0>
8000fdcc:	04f582a3          	sb	a5,69(a1)
8000fdd0:	ffff3a17          	auipc	s4,0xffff3
8000fdd4:	0fca0a13          	addi	s4,s4,252 # 80002ecc <__sf_fake_stdout+0x34>
8000fdd8:	00042783          	lw	a5,0(s0)
8000fddc:	00072683          	lw	a3,0(a4)
8000fde0:	0807f613          	andi	a2,a5,128
8000fde4:	0006a483          	lw	s1,0(a3)
8000fde8:	00468693          	addi	a3,a3,4
8000fdec:	10060663          	beqz	a2,8000fef8 <_printf_i+0x2c0>
8000fdf0:	00d72023          	sw	a3,0(a4)
8000fdf4:	0017f713          	andi	a4,a5,1
8000fdf8:	00070663          	beqz	a4,8000fe04 <_printf_i+0x1cc>
8000fdfc:	0207e793          	ori	a5,a5,32
8000fe00:	00f42023          	sw	a5,0(s0)
8000fe04:	01000913          	li	s2,16
8000fe08:	00049863          	bnez	s1,8000fe18 <_printf_i+0x1e0>
8000fe0c:	00042783          	lw	a5,0(s0)
8000fe10:	fdf7f793          	andi	a5,a5,-33
8000fe14:	00f42023          	sw	a5,0(s0)
8000fe18:	040401a3          	sb	zero,67(s0)
8000fe1c:	00442783          	lw	a5,4(s0)
8000fe20:	00f42423          	sw	a5,8(s0)
8000fe24:	0007c863          	bltz	a5,8000fe34 <_printf_i+0x1fc>
8000fe28:	00042703          	lw	a4,0(s0)
8000fe2c:	ffb77713          	andi	a4,a4,-5
8000fe30:	00e42023          	sw	a4,0(s0)
8000fe34:	00049663          	bnez	s1,8000fe40 <_printf_i+0x208>
8000fe38:	00098c13          	mv	s8,s3
8000fe3c:	02078a63          	beqz	a5,8000fe70 <_printf_i+0x238>
8000fe40:	00098c13          	mv	s8,s3
8000fe44:	00090593          	mv	a1,s2
8000fe48:	00048513          	mv	a0,s1
8000fe4c:	da4fd0ef          	jal	ra,8000d3f0 <__umodsi3>
8000fe50:	00aa0533          	add	a0,s4,a0
8000fe54:	00054783          	lbu	a5,0(a0)
8000fe58:	fffc0c13          	addi	s8,s8,-1
8000fe5c:	00090593          	mv	a1,s2
8000fe60:	00fc0023          	sb	a5,0(s8)
8000fe64:	00048513          	mv	a0,s1
8000fe68:	d40fd0ef          	jal	ra,8000d3a8 <__udivsi3>
8000fe6c:	0b24f263          	bgeu	s1,s2,8000ff10 <_printf_i+0x2d8>
8000fe70:	00800793          	li	a5,8
8000fe74:	02f91463          	bne	s2,a5,8000fe9c <_printf_i+0x264>
8000fe78:	00042783          	lw	a5,0(s0)
8000fe7c:	0017f793          	andi	a5,a5,1
8000fe80:	00078e63          	beqz	a5,8000fe9c <_printf_i+0x264>
8000fe84:	00442703          	lw	a4,4(s0)
8000fe88:	01042783          	lw	a5,16(s0)
8000fe8c:	00e7c863          	blt	a5,a4,8000fe9c <_printf_i+0x264>
8000fe90:	03000793          	li	a5,48
8000fe94:	fefc0fa3          	sb	a5,-1(s8)
8000fe98:	fffc0c13          	addi	s8,s8,-1
8000fe9c:	418989b3          	sub	s3,s3,s8
8000fea0:	01342823          	sw	s3,16(s0)
8000fea4:	000b8713          	mv	a4,s7
8000fea8:	000b0693          	mv	a3,s6
8000feac:	00c10613          	addi	a2,sp,12
8000feb0:	00040593          	mv	a1,s0
8000feb4:	000a8513          	mv	a0,s5
8000feb8:	bd1ff0ef          	jal	ra,8000fa88 <_printf_common>
8000febc:	fff00493          	li	s1,-1
8000fec0:	0c951e63          	bne	a0,s1,8000ff9c <_printf_i+0x364>
8000fec4:	fff00513          	li	a0,-1
8000fec8:	03c12083          	lw	ra,60(sp)
8000fecc:	03812403          	lw	s0,56(sp)
8000fed0:	03412483          	lw	s1,52(sp)
8000fed4:	03012903          	lw	s2,48(sp)
8000fed8:	02c12983          	lw	s3,44(sp)
8000fedc:	02812a03          	lw	s4,40(sp)
8000fee0:	02412a83          	lw	s5,36(sp)
8000fee4:	02012b03          	lw	s6,32(sp)
8000fee8:	01c12b83          	lw	s7,28(sp)
8000feec:	01812c03          	lw	s8,24(sp)
8000fef0:	04010113          	addi	sp,sp,64
8000fef4:	00008067          	ret
8000fef8:	0407f613          	andi	a2,a5,64
8000fefc:	00d72023          	sw	a3,0(a4)
8000ff00:	ee060ae3          	beqz	a2,8000fdf4 <_printf_i+0x1bc>
8000ff04:	01049493          	slli	s1,s1,0x10
8000ff08:	0104d493          	srli	s1,s1,0x10
8000ff0c:	ee9ff06f          	j	8000fdf4 <_printf_i+0x1bc>
8000ff10:	00050493          	mv	s1,a0
8000ff14:	f31ff06f          	j	8000fe44 <_printf_i+0x20c>
8000ff18:	0005a683          	lw	a3,0(a1)
8000ff1c:	00072783          	lw	a5,0(a4)
8000ff20:	0145a603          	lw	a2,20(a1)
8000ff24:	0806f513          	andi	a0,a3,128
8000ff28:	00478593          	addi	a1,a5,4
8000ff2c:	00050a63          	beqz	a0,8000ff40 <_printf_i+0x308>
8000ff30:	00b72023          	sw	a1,0(a4)
8000ff34:	0007a783          	lw	a5,0(a5)
8000ff38:	00c7a023          	sw	a2,0(a5)
8000ff3c:	0180006f          	j	8000ff54 <_printf_i+0x31c>
8000ff40:	00b72023          	sw	a1,0(a4)
8000ff44:	0406f693          	andi	a3,a3,64
8000ff48:	0007a783          	lw	a5,0(a5)
8000ff4c:	fe0686e3          	beqz	a3,8000ff38 <_printf_i+0x300>
8000ff50:	00c79023          	sh	a2,0(a5)
8000ff54:	00042823          	sw	zero,16(s0)
8000ff58:	00098c13          	mv	s8,s3
8000ff5c:	f49ff06f          	j	8000fea4 <_printf_i+0x26c>
8000ff60:	00072783          	lw	a5,0(a4)
8000ff64:	0045a603          	lw	a2,4(a1)
8000ff68:	00000593          	li	a1,0
8000ff6c:	00478693          	addi	a3,a5,4
8000ff70:	00d72023          	sw	a3,0(a4)
8000ff74:	0007ac03          	lw	s8,0(a5)
8000ff78:	000c0513          	mv	a0,s8
8000ff7c:	459000ef          	jal	ra,80010bd4 <memchr>
8000ff80:	00050663          	beqz	a0,8000ff8c <_printf_i+0x354>
8000ff84:	41850533          	sub	a0,a0,s8
8000ff88:	00a42223          	sw	a0,4(s0)
8000ff8c:	00442783          	lw	a5,4(s0)
8000ff90:	00f42823          	sw	a5,16(s0)
8000ff94:	040401a3          	sb	zero,67(s0)
8000ff98:	f0dff06f          	j	8000fea4 <_printf_i+0x26c>
8000ff9c:	01042683          	lw	a3,16(s0)
8000ffa0:	000c0613          	mv	a2,s8
8000ffa4:	000b0593          	mv	a1,s6
8000ffa8:	000a8513          	mv	a0,s5
8000ffac:	000b80e7          	jalr	s7
8000ffb0:	f0950ae3          	beq	a0,s1,8000fec4 <_printf_i+0x28c>
8000ffb4:	00042783          	lw	a5,0(s0)
8000ffb8:	0027f793          	andi	a5,a5,2
8000ffbc:	04079463          	bnez	a5,80010004 <_printf_i+0x3cc>
8000ffc0:	00c12783          	lw	a5,12(sp)
8000ffc4:	00c42503          	lw	a0,12(s0)
8000ffc8:	f0f550e3          	bge	a0,a5,8000fec8 <_printf_i+0x290>
8000ffcc:	00078513          	mv	a0,a5
8000ffd0:	ef9ff06f          	j	8000fec8 <_printf_i+0x290>
8000ffd4:	00100693          	li	a3,1
8000ffd8:	00090613          	mv	a2,s2
8000ffdc:	000b0593          	mv	a1,s6
8000ffe0:	000a8513          	mv	a0,s5
8000ffe4:	000b80e7          	jalr	s7
8000ffe8:	ed350ee3          	beq	a0,s3,8000fec4 <_printf_i+0x28c>
8000ffec:	00148493          	addi	s1,s1,1
8000fff0:	00c42783          	lw	a5,12(s0)
8000fff4:	00c12703          	lw	a4,12(sp)
8000fff8:	40e787b3          	sub	a5,a5,a4
8000fffc:	fcf4cce3          	blt	s1,a5,8000ffd4 <_printf_i+0x39c>
80010000:	fc1ff06f          	j	8000ffc0 <_printf_i+0x388>
80010004:	00000493          	li	s1,0
80010008:	01940913          	addi	s2,s0,25
8001000c:	fff00993          	li	s3,-1
80010010:	fe1ff06f          	j	8000fff0 <_printf_i+0x3b8>

Disassembly of section .text.__sfputc_r:

80010014 <__sfputc_r>:
80010014:	00862783          	lw	a5,8(a2)
80010018:	fff78793          	addi	a5,a5,-1
8001001c:	00f62423          	sw	a5,8(a2)
80010020:	0007dc63          	bgez	a5,80010038 <__sfputc_r+0x24>
80010024:	01862703          	lw	a4,24(a2)
80010028:	00e7c663          	blt	a5,a4,80010034 <__sfputc_r+0x20>
8001002c:	00a00793          	li	a5,10
80010030:	00f59463          	bne	a1,a5,80010038 <__sfputc_r+0x24>
80010034:	e65fe06f          	j	8000ee98 <__swbuf_r>
80010038:	00062783          	lw	a5,0(a2)
8001003c:	00058513          	mv	a0,a1
80010040:	00178713          	addi	a4,a5,1
80010044:	00e62023          	sw	a4,0(a2)
80010048:	00b78023          	sb	a1,0(a5)
8001004c:	00008067          	ret

Disassembly of section .text.__sfputs_r:

80010050 <__sfputs_r>:
80010050:	fe010113          	addi	sp,sp,-32
80010054:	00812c23          	sw	s0,24(sp)
80010058:	00912a23          	sw	s1,20(sp)
8001005c:	01212823          	sw	s2,16(sp)
80010060:	01312623          	sw	s3,12(sp)
80010064:	01412423          	sw	s4,8(sp)
80010068:	00112e23          	sw	ra,28(sp)
8001006c:	00050913          	mv	s2,a0
80010070:	00058993          	mv	s3,a1
80010074:	00060413          	mv	s0,a2
80010078:	00d604b3          	add	s1,a2,a3
8001007c:	fff00a13          	li	s4,-1
80010080:	00941663          	bne	s0,s1,8001008c <__sfputs_r+0x3c>
80010084:	00000513          	li	a0,0
80010088:	01c0006f          	j	800100a4 <__sfputs_r+0x54>
8001008c:	00044583          	lbu	a1,0(s0)
80010090:	00098613          	mv	a2,s3
80010094:	00090513          	mv	a0,s2
80010098:	f7dff0ef          	jal	ra,80010014 <__sfputc_r>
8001009c:	00140413          	addi	s0,s0,1
800100a0:	ff4510e3          	bne	a0,s4,80010080 <__sfputs_r+0x30>
800100a4:	01c12083          	lw	ra,28(sp)
800100a8:	01812403          	lw	s0,24(sp)
800100ac:	01412483          	lw	s1,20(sp)
800100b0:	01012903          	lw	s2,16(sp)
800100b4:	00c12983          	lw	s3,12(sp)
800100b8:	00812a03          	lw	s4,8(sp)
800100bc:	02010113          	addi	sp,sp,32
800100c0:	00008067          	ret

Disassembly of section .text.__sprint_r:

800100c4 <__sprint_r>:
800100c4:	00862703          	lw	a4,8(a2)
800100c8:	ff010113          	addi	sp,sp,-16
800100cc:	00812423          	sw	s0,8(sp)
800100d0:	00112623          	sw	ra,12(sp)
800100d4:	00060413          	mv	s0,a2
800100d8:	00071e63          	bnez	a4,800100f4 <__sprint_r+0x30>
800100dc:	00062223          	sw	zero,4(a2)
800100e0:	00000513          	li	a0,0
800100e4:	00c12083          	lw	ra,12(sp)
800100e8:	00812403          	lw	s0,8(sp)
800100ec:	01010113          	addi	sp,sp,16
800100f0:	00008067          	ret
800100f4:	63c000ef          	jal	ra,80010730 <__sfvwrite_r>
800100f8:	00042423          	sw	zero,8(s0)
800100fc:	00042223          	sw	zero,4(s0)
80010100:	fe5ff06f          	j	800100e4 <__sprint_r+0x20>

Disassembly of section .text._vfprintf_r:

80010104 <_vfiprintf_r>:
80010104:	f6010113          	addi	sp,sp,-160
80010108:	08812c23          	sw	s0,152(sp)
8001010c:	08912a23          	sw	s1,148(sp)
80010110:	09212823          	sw	s2,144(sp)
80010114:	09312623          	sw	s3,140(sp)
80010118:	08112e23          	sw	ra,156(sp)
8001011c:	09412423          	sw	s4,136(sp)
80010120:	09512223          	sw	s5,132(sp)
80010124:	09612023          	sw	s6,128(sp)
80010128:	07712e23          	sw	s7,124(sp)
8001012c:	07812c23          	sw	s8,120(sp)
80010130:	07912a23          	sw	s9,116(sp)
80010134:	00050993          	mv	s3,a0
80010138:	00058493          	mv	s1,a1
8001013c:	00060913          	mv	s2,a2
80010140:	00068413          	mv	s0,a3
80010144:	00050863          	beqz	a0,80010154 <_vfiprintf_r+0x50>
80010148:	01852783          	lw	a5,24(a0)
8001014c:	00079463          	bnez	a5,80010154 <_vfiprintf_r+0x50>
80010150:	c61fd0ef          	jal	ra,8000ddb0 <__sinit>
80010154:	ffff3797          	auipc	a5,0xffff3
80010158:	d2478793          	addi	a5,a5,-732 # 80002e78 <__sf_fake_stdin>
8001015c:	12f49263          	bne	s1,a5,80010280 <_vfiprintf_r+0x17c>
80010160:	0049a483          	lw	s1,4(s3)
80010164:	00c4d783          	lhu	a5,12(s1)
80010168:	0087f793          	andi	a5,a5,8
8001016c:	12078e63          	beqz	a5,800102a8 <_vfiprintf_r+0x1a4>
80010170:	0104a783          	lw	a5,16(s1)
80010174:	12078a63          	beqz	a5,800102a8 <_vfiprintf_r+0x1a4>
80010178:	02000793          	li	a5,32
8001017c:	02f104a3          	sb	a5,41(sp)
80010180:	03000793          	li	a5,48
80010184:	02012223          	sw	zero,36(sp)
80010188:	02f10523          	sb	a5,42(sp)
8001018c:	00812623          	sw	s0,12(sp)
80010190:	02500b13          	li	s6,37
80010194:	ffff3a97          	auipc	s5,0xffff3
80010198:	d24a8a93          	addi	s5,s5,-732 # 80002eb8 <__sf_fake_stdout+0x20>
8001019c:	00100b93          	li	s7,1
800101a0:	7fff0c17          	auipc	s8,0x7fff0
800101a4:	e60c0c13          	addi	s8,s8,-416 # 0 <_ram_heap_end+0x7ffee000>
800101a8:	00090413          	mv	s0,s2
800101ac:	00044783          	lbu	a5,0(s0)
800101b0:	00078463          	beqz	a5,800101b8 <_vfiprintf_r+0xb4>
800101b4:	13679e63          	bne	a5,s6,800102f0 <_vfiprintf_r+0x1ec>
800101b8:	41240cb3          	sub	s9,s0,s2
800101bc:	020c8663          	beqz	s9,800101e8 <_vfiprintf_r+0xe4>
800101c0:	000c8693          	mv	a3,s9
800101c4:	00090613          	mv	a2,s2
800101c8:	00048593          	mv	a1,s1
800101cc:	00098513          	mv	a0,s3
800101d0:	e81ff0ef          	jal	ra,80010050 <__sfputs_r>
800101d4:	fff00793          	li	a5,-1
800101d8:	2cf50663          	beq	a0,a5,800104a4 <_vfiprintf_r+0x3a0>
800101dc:	02412683          	lw	a3,36(sp)
800101e0:	019686b3          	add	a3,a3,s9
800101e4:	02d12223          	sw	a3,36(sp)
800101e8:	00044783          	lbu	a5,0(s0)
800101ec:	2a078c63          	beqz	a5,800104a4 <_vfiprintf_r+0x3a0>
800101f0:	fff00793          	li	a5,-1
800101f4:	00140913          	addi	s2,s0,1
800101f8:	00012823          	sw	zero,16(sp)
800101fc:	00012e23          	sw	zero,28(sp)
80010200:	00f12a23          	sw	a5,20(sp)
80010204:	00012c23          	sw	zero,24(sp)
80010208:	040109a3          	sb	zero,83(sp)
8001020c:	06012423          	sw	zero,104(sp)
80010210:	00094583          	lbu	a1,0(s2)
80010214:	00500613          	li	a2,5
80010218:	000a8513          	mv	a0,s5
8001021c:	1b9000ef          	jal	ra,80010bd4 <memchr>
80010220:	00190413          	addi	s0,s2,1
80010224:	01012783          	lw	a5,16(sp)
80010228:	0c051863          	bnez	a0,800102f8 <_vfiprintf_r+0x1f4>
8001022c:	0107f713          	andi	a4,a5,16
80010230:	00070663          	beqz	a4,8001023c <_vfiprintf_r+0x138>
80010234:	02000713          	li	a4,32
80010238:	04e109a3          	sb	a4,83(sp)
8001023c:	0087f713          	andi	a4,a5,8
80010240:	00070663          	beqz	a4,8001024c <_vfiprintf_r+0x148>
80010244:	02b00713          	li	a4,43
80010248:	04e109a3          	sb	a4,83(sp)
8001024c:	00094683          	lbu	a3,0(s2)
80010250:	02a00713          	li	a4,42
80010254:	0ae68e63          	beq	a3,a4,80010310 <_vfiprintf_r+0x20c>
80010258:	01c12703          	lw	a4,28(sp)
8001025c:	00090413          	mv	s0,s2
80010260:	00000793          	li	a5,0
80010264:	00900613          	li	a2,9
80010268:	00044683          	lbu	a3,0(s0)
8001026c:	00140593          	addi	a1,s0,1
80010270:	fd068693          	addi	a3,a3,-48
80010274:	18d67263          	bgeu	a2,a3,800103f8 <_vfiprintf_r+0x2f4>
80010278:	0a079663          	bnez	a5,80010324 <_vfiprintf_r+0x220>
8001027c:	0c00006f          	j	8001033c <_vfiprintf_r+0x238>
80010280:	ffff3797          	auipc	a5,0xffff3
80010284:	c1878793          	addi	a5,a5,-1000 # 80002e98 <__sf_fake_stdout>
80010288:	00f49663          	bne	s1,a5,80010294 <_vfiprintf_r+0x190>
8001028c:	0089a483          	lw	s1,8(s3)
80010290:	ed5ff06f          	j	80010164 <_vfiprintf_r+0x60>
80010294:	ffff3797          	auipc	a5,0xffff3
80010298:	bc478793          	addi	a5,a5,-1084 # 80002e58 <__sf_fake_stderr>
8001029c:	ecf494e3          	bne	s1,a5,80010164 <_vfiprintf_r+0x60>
800102a0:	00c9a483          	lw	s1,12(s3)
800102a4:	ec1ff06f          	j	80010164 <_vfiprintf_r+0x60>
800102a8:	00048593          	mv	a1,s1
800102ac:	00098513          	mv	a0,s3
800102b0:	d81fe0ef          	jal	ra,8000f030 <__swsetup_r>
800102b4:	ec0502e3          	beqz	a0,80010178 <_vfiprintf_r+0x74>
800102b8:	fff00513          	li	a0,-1
800102bc:	09c12083          	lw	ra,156(sp)
800102c0:	09812403          	lw	s0,152(sp)
800102c4:	09412483          	lw	s1,148(sp)
800102c8:	09012903          	lw	s2,144(sp)
800102cc:	08c12983          	lw	s3,140(sp)
800102d0:	08812a03          	lw	s4,136(sp)
800102d4:	08412a83          	lw	s5,132(sp)
800102d8:	08012b03          	lw	s6,128(sp)
800102dc:	07c12b83          	lw	s7,124(sp)
800102e0:	07812c03          	lw	s8,120(sp)
800102e4:	07412c83          	lw	s9,116(sp)
800102e8:	0a010113          	addi	sp,sp,160
800102ec:	00008067          	ret
800102f0:	00140413          	addi	s0,s0,1
800102f4:	eb9ff06f          	j	800101ac <_vfiprintf_r+0xa8>
800102f8:	41550533          	sub	a0,a0,s5
800102fc:	00ab9533          	sll	a0,s7,a0
80010300:	00a7e7b3          	or	a5,a5,a0
80010304:	00f12823          	sw	a5,16(sp)
80010308:	00040913          	mv	s2,s0
8001030c:	f05ff06f          	j	80010210 <_vfiprintf_r+0x10c>
80010310:	00c12703          	lw	a4,12(sp)
80010314:	00470693          	addi	a3,a4,4
80010318:	00072703          	lw	a4,0(a4)
8001031c:	00d12623          	sw	a3,12(sp)
80010320:	00074663          	bltz	a4,8001032c <_vfiprintf_r+0x228>
80010324:	00e12e23          	sw	a4,28(sp)
80010328:	0140006f          	j	8001033c <_vfiprintf_r+0x238>
8001032c:	40e00733          	neg	a4,a4
80010330:	0027e793          	ori	a5,a5,2
80010334:	00e12e23          	sw	a4,28(sp)
80010338:	00f12823          	sw	a5,16(sp)
8001033c:	00044703          	lbu	a4,0(s0)
80010340:	02e00793          	li	a5,46
80010344:	02f71663          	bne	a4,a5,80010370 <_vfiprintf_r+0x26c>
80010348:	00144703          	lbu	a4,1(s0)
8001034c:	02a00793          	li	a5,42
80010350:	0cf71663          	bne	a4,a5,8001041c <_vfiprintf_r+0x318>
80010354:	00c12783          	lw	a5,12(sp)
80010358:	00240413          	addi	s0,s0,2
8001035c:	00478713          	addi	a4,a5,4
80010360:	0007a783          	lw	a5,0(a5)
80010364:	00e12623          	sw	a4,12(sp)
80010368:	0a07c663          	bltz	a5,80010414 <_vfiprintf_r+0x310>
8001036c:	00f12a23          	sw	a5,20(sp)
80010370:	00044583          	lbu	a1,0(s0)
80010374:	00300613          	li	a2,3
80010378:	ffff3517          	auipc	a0,0xffff3
8001037c:	b4850513          	addi	a0,a0,-1208 # 80002ec0 <__sf_fake_stdout+0x28>
80010380:	055000ef          	jal	ra,80010bd4 <memchr>
80010384:	02050463          	beqz	a0,800103ac <_vfiprintf_r+0x2a8>
80010388:	ffff3797          	auipc	a5,0xffff3
8001038c:	b3878793          	addi	a5,a5,-1224 # 80002ec0 <__sf_fake_stdout+0x28>
80010390:	40f50533          	sub	a0,a0,a5
80010394:	04000793          	li	a5,64
80010398:	00a797b3          	sll	a5,a5,a0
8001039c:	01012503          	lw	a0,16(sp)
800103a0:	00140413          	addi	s0,s0,1
800103a4:	00f56533          	or	a0,a0,a5
800103a8:	00a12823          	sw	a0,16(sp)
800103ac:	00044583          	lbu	a1,0(s0)
800103b0:	00600613          	li	a2,6
800103b4:	ffff3517          	auipc	a0,0xffff3
800103b8:	b1050513          	addi	a0,a0,-1264 # 80002ec4 <__sf_fake_stdout+0x2c>
800103bc:	00140913          	addi	s2,s0,1
800103c0:	02b10423          	sb	a1,40(sp)
800103c4:	011000ef          	jal	ra,80010bd4 <memchr>
800103c8:	0e050863          	beqz	a0,800104b8 <_vfiprintf_r+0x3b4>
800103cc:	0a0c1663          	bnez	s8,80010478 <_vfiprintf_r+0x374>
800103d0:	01012703          	lw	a4,16(sp)
800103d4:	00c12783          	lw	a5,12(sp)
800103d8:	10077713          	andi	a4,a4,256
800103dc:	08070663          	beqz	a4,80010468 <_vfiprintf_r+0x364>
800103e0:	00478793          	addi	a5,a5,4
800103e4:	00f12623          	sw	a5,12(sp)
800103e8:	02412783          	lw	a5,36(sp)
800103ec:	014787b3          	add	a5,a5,s4
800103f0:	02f12223          	sw	a5,36(sp)
800103f4:	db5ff06f          	j	800101a8 <_vfiprintf_r+0xa4>
800103f8:	00271793          	slli	a5,a4,0x2
800103fc:	00e787b3          	add	a5,a5,a4
80010400:	00179793          	slli	a5,a5,0x1
80010404:	00d78733          	add	a4,a5,a3
80010408:	00058413          	mv	s0,a1
8001040c:	00100793          	li	a5,1
80010410:	e59ff06f          	j	80010268 <_vfiprintf_r+0x164>
80010414:	fff00793          	li	a5,-1
80010418:	f55ff06f          	j	8001036c <_vfiprintf_r+0x268>
8001041c:	00140413          	addi	s0,s0,1
80010420:	00012a23          	sw	zero,20(sp)
80010424:	00000793          	li	a5,0
80010428:	00000713          	li	a4,0
8001042c:	00900613          	li	a2,9
80010430:	00044683          	lbu	a3,0(s0)
80010434:	00140593          	addi	a1,s0,1
80010438:	fd068693          	addi	a3,a3,-48
8001043c:	00d67863          	bgeu	a2,a3,8001044c <_vfiprintf_r+0x348>
80010440:	f20788e3          	beqz	a5,80010370 <_vfiprintf_r+0x26c>
80010444:	00e12a23          	sw	a4,20(sp)
80010448:	f29ff06f          	j	80010370 <_vfiprintf_r+0x26c>
8001044c:	00271793          	slli	a5,a4,0x2
80010450:	00e787b3          	add	a5,a5,a4
80010454:	00179793          	slli	a5,a5,0x1
80010458:	00d78733          	add	a4,a5,a3
8001045c:	00058413          	mv	s0,a1
80010460:	00100793          	li	a5,1
80010464:	fcdff06f          	j	80010430 <_vfiprintf_r+0x32c>
80010468:	00778793          	addi	a5,a5,7
8001046c:	ff87f793          	andi	a5,a5,-8
80010470:	00878793          	addi	a5,a5,8
80010474:	f71ff06f          	j	800103e4 <_vfiprintf_r+0x2e0>
80010478:	00c10713          	addi	a4,sp,12
8001047c:	00000697          	auipc	a3,0x0
80010480:	bd468693          	addi	a3,a3,-1068 # 80010050 <__sfputs_r>
80010484:	00048613          	mv	a2,s1
80010488:	01010593          	addi	a1,sp,16
8001048c:	00098513          	mv	a0,s3
80010490:	00000097          	auipc	ra,0x0
80010494:	000000e7          	jalr	zero # 0 <_ram_heap_size>
80010498:	fff00793          	li	a5,-1
8001049c:	00050a13          	mv	s4,a0
800104a0:	f4f514e3          	bne	a0,a5,800103e8 <_vfiprintf_r+0x2e4>
800104a4:	00c4d783          	lhu	a5,12(s1)
800104a8:	0407f793          	andi	a5,a5,64
800104ac:	e00796e3          	bnez	a5,800102b8 <_vfiprintf_r+0x1b4>
800104b0:	02412503          	lw	a0,36(sp)
800104b4:	e09ff06f          	j	800102bc <_vfiprintf_r+0x1b8>
800104b8:	00c10713          	addi	a4,sp,12
800104bc:	00000697          	auipc	a3,0x0
800104c0:	b9468693          	addi	a3,a3,-1132 # 80010050 <__sfputs_r>
800104c4:	00048613          	mv	a2,s1
800104c8:	01010593          	addi	a1,sp,16
800104cc:	00098513          	mv	a0,s3
800104d0:	f68ff0ef          	jal	ra,8000fc38 <_printf_i>
800104d4:	fc5ff06f          	j	80010498 <_vfiprintf_r+0x394>

Disassembly of section .text.vfprintf:

800104d8 <vfiprintf>:
800104d8:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
800104dc:	00060693          	mv	a3,a2
800104e0:	00058613          	mv	a2,a1
800104e4:	00050593          	mv	a1,a0
800104e8:	0007a503          	lw	a0,0(a5)
800104ec:	c19ff06f          	j	80010104 <_vfiprintf_r>

Disassembly of section .text._read_r:

800104f0 <_read_r>:
800104f0:	ff010113          	addi	sp,sp,-16
800104f4:	00812423          	sw	s0,8(sp)
800104f8:	00050413          	mv	s0,a0
800104fc:	00058513          	mv	a0,a1
80010500:	00060593          	mv	a1,a2
80010504:	00068613          	mv	a2,a3
80010508:	c401a623          	sw	zero,-948(gp) # 800034cc <errno>
8001050c:	00112623          	sw	ra,12(sp)
80010510:	845f50ef          	jal	ra,80005d54 <_read>
80010514:	fff00793          	li	a5,-1
80010518:	00f51a63          	bne	a0,a5,8001052c <_read_r+0x3c>
8001051c:	c4c18793          	addi	a5,gp,-948 # 800034cc <errno>
80010520:	0007a783          	lw	a5,0(a5)
80010524:	00078463          	beqz	a5,8001052c <_read_r+0x3c>
80010528:	00f42023          	sw	a5,0(s0)
8001052c:	00c12083          	lw	ra,12(sp)
80010530:	00812403          	lw	s0,8(sp)
80010534:	01010113          	addi	sp,sp,16
80010538:	00008067          	ret

Disassembly of section .text.cleanup_glue:

8001053c <cleanup_glue>:
8001053c:	ff010113          	addi	sp,sp,-16
80010540:	00812423          	sw	s0,8(sp)
80010544:	00058413          	mv	s0,a1
80010548:	0005a583          	lw	a1,0(a1)
8001054c:	00912223          	sw	s1,4(sp)
80010550:	00112623          	sw	ra,12(sp)
80010554:	00050493          	mv	s1,a0
80010558:	00058463          	beqz	a1,80010560 <cleanup_glue+0x24>
8001055c:	fe1ff0ef          	jal	ra,8001053c <cleanup_glue>
80010560:	00040593          	mv	a1,s0
80010564:	00812403          	lw	s0,8(sp)
80010568:	00c12083          	lw	ra,12(sp)
8001056c:	00048513          	mv	a0,s1
80010570:	00412483          	lw	s1,4(sp)
80010574:	01010113          	addi	sp,sp,16
80010578:	e35fd06f          	j	8000e3ac <_free_r>

Disassembly of section .text._reclaim_reent:

8001057c <_reclaim_reent>:
8001057c:	80c18793          	addi	a5,gp,-2036 # 8000308c <_impure_ptr>
80010580:	0007a783          	lw	a5,0(a5)
80010584:	16a78063          	beq	a5,a0,800106e4 <_reclaim_reent+0x168>
80010588:	02452783          	lw	a5,36(a0)
8001058c:	fe010113          	addi	sp,sp,-32
80010590:	00812c23          	sw	s0,24(sp)
80010594:	00112e23          	sw	ra,28(sp)
80010598:	00912a23          	sw	s1,20(sp)
8001059c:	01212823          	sw	s2,16(sp)
800105a0:	01312623          	sw	s3,12(sp)
800105a4:	00050413          	mv	s0,a0
800105a8:	02078463          	beqz	a5,800105d0 <_reclaim_reent+0x54>
800105ac:	00c7a783          	lw	a5,12(a5)
800105b0:	00000493          	li	s1,0
800105b4:	08000913          	li	s2,128
800105b8:	0e079263          	bnez	a5,8001069c <_reclaim_reent+0x120>
800105bc:	02442783          	lw	a5,36(s0)
800105c0:	0007a583          	lw	a1,0(a5)
800105c4:	00058663          	beqz	a1,800105d0 <_reclaim_reent+0x54>
800105c8:	00040513          	mv	a0,s0
800105cc:	de1fd0ef          	jal	ra,8000e3ac <_free_r>
800105d0:	01442583          	lw	a1,20(s0)
800105d4:	00058663          	beqz	a1,800105e0 <_reclaim_reent+0x64>
800105d8:	00040513          	mv	a0,s0
800105dc:	dd1fd0ef          	jal	ra,8000e3ac <_free_r>
800105e0:	02442583          	lw	a1,36(s0)
800105e4:	00058663          	beqz	a1,800105f0 <_reclaim_reent+0x74>
800105e8:	00040513          	mv	a0,s0
800105ec:	dc1fd0ef          	jal	ra,8000e3ac <_free_r>
800105f0:	03842583          	lw	a1,56(s0)
800105f4:	00058663          	beqz	a1,80010600 <_reclaim_reent+0x84>
800105f8:	00040513          	mv	a0,s0
800105fc:	db1fd0ef          	jal	ra,8000e3ac <_free_r>
80010600:	03c42583          	lw	a1,60(s0)
80010604:	00058663          	beqz	a1,80010610 <_reclaim_reent+0x94>
80010608:	00040513          	mv	a0,s0
8001060c:	da1fd0ef          	jal	ra,8000e3ac <_free_r>
80010610:	04042583          	lw	a1,64(s0)
80010614:	00058663          	beqz	a1,80010620 <_reclaim_reent+0xa4>
80010618:	00040513          	mv	a0,s0
8001061c:	d91fd0ef          	jal	ra,8000e3ac <_free_r>
80010620:	05c42583          	lw	a1,92(s0)
80010624:	00058663          	beqz	a1,80010630 <_reclaim_reent+0xb4>
80010628:	00040513          	mv	a0,s0
8001062c:	d81fd0ef          	jal	ra,8000e3ac <_free_r>
80010630:	05842583          	lw	a1,88(s0)
80010634:	00058663          	beqz	a1,80010640 <_reclaim_reent+0xc4>
80010638:	00040513          	mv	a0,s0
8001063c:	d71fd0ef          	jal	ra,8000e3ac <_free_r>
80010640:	03442583          	lw	a1,52(s0)
80010644:	00058663          	beqz	a1,80010650 <_reclaim_reent+0xd4>
80010648:	00040513          	mv	a0,s0
8001064c:	d61fd0ef          	jal	ra,8000e3ac <_free_r>
80010650:	01842783          	lw	a5,24(s0)
80010654:	06078a63          	beqz	a5,800106c8 <_reclaim_reent+0x14c>
80010658:	02842783          	lw	a5,40(s0)
8001065c:	00040513          	mv	a0,s0
80010660:	000780e7          	jalr	a5
80010664:	04842583          	lw	a1,72(s0)
80010668:	06058063          	beqz	a1,800106c8 <_reclaim_reent+0x14c>
8001066c:	00040513          	mv	a0,s0
80010670:	01812403          	lw	s0,24(sp)
80010674:	01c12083          	lw	ra,28(sp)
80010678:	01412483          	lw	s1,20(sp)
8001067c:	01012903          	lw	s2,16(sp)
80010680:	00c12983          	lw	s3,12(sp)
80010684:	02010113          	addi	sp,sp,32
80010688:	eb5ff06f          	j	8001053c <cleanup_glue>
8001068c:	009585b3          	add	a1,a1,s1
80010690:	0005a583          	lw	a1,0(a1)
80010694:	02059063          	bnez	a1,800106b4 <_reclaim_reent+0x138>
80010698:	00448493          	addi	s1,s1,4
8001069c:	02442783          	lw	a5,36(s0)
800106a0:	00c7a583          	lw	a1,12(a5)
800106a4:	ff2494e3          	bne	s1,s2,8001068c <_reclaim_reent+0x110>
800106a8:	00040513          	mv	a0,s0
800106ac:	d01fd0ef          	jal	ra,8000e3ac <_free_r>
800106b0:	f0dff06f          	j	800105bc <_reclaim_reent+0x40>
800106b4:	0005a983          	lw	s3,0(a1)
800106b8:	00040513          	mv	a0,s0
800106bc:	cf1fd0ef          	jal	ra,8000e3ac <_free_r>
800106c0:	00098593          	mv	a1,s3
800106c4:	fd1ff06f          	j	80010694 <_reclaim_reent+0x118>
800106c8:	01c12083          	lw	ra,28(sp)
800106cc:	01812403          	lw	s0,24(sp)
800106d0:	01412483          	lw	s1,20(sp)
800106d4:	01012903          	lw	s2,16(sp)
800106d8:	00c12983          	lw	s3,12(sp)
800106dc:	02010113          	addi	sp,sp,32
800106e0:	00008067          	ret
800106e4:	00008067          	ret

Disassembly of section .text._fstat_r:

800106e8 <_fstat_r>:
800106e8:	ff010113          	addi	sp,sp,-16
800106ec:	00812423          	sw	s0,8(sp)
800106f0:	00050413          	mv	s0,a0
800106f4:	00058513          	mv	a0,a1
800106f8:	00060593          	mv	a1,a2
800106fc:	c401a623          	sw	zero,-948(gp) # 800034cc <errno>
80010700:	00112623          	sw	ra,12(sp)
80010704:	e70f50ef          	jal	ra,80005d74 <_fstat>
80010708:	fff00793          	li	a5,-1
8001070c:	00f51a63          	bne	a0,a5,80010720 <_fstat_r+0x38>
80010710:	c4c18793          	addi	a5,gp,-948 # 800034cc <errno>
80010714:	0007a783          	lw	a5,0(a5)
80010718:	00078463          	beqz	a5,80010720 <_fstat_r+0x38>
8001071c:	00f42023          	sw	a5,0(s0)
80010720:	00c12083          	lw	ra,12(sp)
80010724:	00812403          	lw	s0,8(sp)
80010728:	01010113          	addi	sp,sp,16
8001072c:	00008067          	ret

Disassembly of section .text.__sfvwrite_r:

80010730 <__sfvwrite_r>:
80010730:	00862783          	lw	a5,8(a2)
80010734:	00079863          	bnez	a5,80010744 <__sfvwrite_r+0x14>
80010738:	00000793          	li	a5,0
8001073c:	00078513          	mv	a0,a5
80010740:	00008067          	ret
80010744:	00c5d783          	lhu	a5,12(a1)
80010748:	fc010113          	addi	sp,sp,-64
8001074c:	02812c23          	sw	s0,56(sp)
80010750:	03212823          	sw	s2,48(sp)
80010754:	03612023          	sw	s6,32(sp)
80010758:	02112e23          	sw	ra,60(sp)
8001075c:	02912a23          	sw	s1,52(sp)
80010760:	03312623          	sw	s3,44(sp)
80010764:	03412423          	sw	s4,40(sp)
80010768:	03512223          	sw	s5,36(sp)
8001076c:	01712e23          	sw	s7,28(sp)
80010770:	01812c23          	sw	s8,24(sp)
80010774:	01912a23          	sw	s9,20(sp)
80010778:	01a12823          	sw	s10,16(sp)
8001077c:	01b12623          	sw	s11,12(sp)
80010780:	0087f793          	andi	a5,a5,8
80010784:	00060b13          	mv	s6,a2
80010788:	00058413          	mv	s0,a1
8001078c:	00050913          	mv	s2,a0
80010790:	0e078263          	beqz	a5,80010874 <__sfvwrite_r+0x144>
80010794:	0105a783          	lw	a5,16(a1)
80010798:	0c078e63          	beqz	a5,80010874 <__sfvwrite_r+0x144>
8001079c:	00c45783          	lhu	a5,12(s0)
800107a0:	000b2a03          	lw	s4,0(s6)
800107a4:	0027f713          	andi	a4,a5,2
800107a8:	16071a63          	bnez	a4,8001091c <__sfvwrite_r+0x1ec>
800107ac:	0017f793          	andi	a5,a5,1
800107b0:	00000b93          	li	s7,0
800107b4:	20078a63          	beqz	a5,800109c8 <__sfvwrite_r+0x298>
800107b8:	00000513          	li	a0,0
800107bc:	00000a93          	li	s5,0
800107c0:	00000993          	li	s3,0
800107c4:	36098463          	beqz	s3,80010b2c <__sfvwrite_r+0x3fc>
800107c8:	02051263          	bnez	a0,800107ec <__sfvwrite_r+0xbc>
800107cc:	00098613          	mv	a2,s3
800107d0:	00a00593          	li	a1,10
800107d4:	000a8513          	mv	a0,s5
800107d8:	3fc000ef          	jal	ra,80010bd4 <memchr>
800107dc:	00198b93          	addi	s7,s3,1
800107e0:	00050663          	beqz	a0,800107ec <__sfvwrite_r+0xbc>
800107e4:	00150513          	addi	a0,a0,1
800107e8:	41550bb3          	sub	s7,a0,s5
800107ec:	000b8c13          	mv	s8,s7
800107f0:	0179f463          	bgeu	s3,s7,800107f8 <__sfvwrite_r+0xc8>
800107f4:	00098c13          	mv	s8,s3
800107f8:	00042503          	lw	a0,0(s0)
800107fc:	01042783          	lw	a5,16(s0)
80010800:	01442683          	lw	a3,20(s0)
80010804:	32a7fe63          	bgeu	a5,a0,80010b40 <__sfvwrite_r+0x410>
80010808:	00842483          	lw	s1,8(s0)
8001080c:	009684b3          	add	s1,a3,s1
80010810:	3384d863          	bge	s1,s8,80010b40 <__sfvwrite_r+0x410>
80010814:	000a8593          	mv	a1,s5
80010818:	00048613          	mv	a2,s1
8001081c:	ae1fd0ef          	jal	ra,8000e2fc <memmove>
80010820:	00042783          	lw	a5,0(s0)
80010824:	00040593          	mv	a1,s0
80010828:	00090513          	mv	a0,s2
8001082c:	009787b3          	add	a5,a5,s1
80010830:	00f42023          	sw	a5,0(s0)
80010834:	b8cfd0ef          	jal	ra,8000dbc0 <_fflush_r>
80010838:	16051e63          	bnez	a0,800109b4 <__sfvwrite_r+0x284>
8001083c:	409b8bb3          	sub	s7,s7,s1
80010840:	00100513          	li	a0,1
80010844:	000b9a63          	bnez	s7,80010858 <__sfvwrite_r+0x128>
80010848:	00040593          	mv	a1,s0
8001084c:	00090513          	mv	a0,s2
80010850:	b70fd0ef          	jal	ra,8000dbc0 <_fflush_r>
80010854:	16051063          	bnez	a0,800109b4 <__sfvwrite_r+0x284>
80010858:	008b2783          	lw	a5,8(s6)
8001085c:	009a8ab3          	add	s5,s5,s1
80010860:	409989b3          	sub	s3,s3,s1
80010864:	409784b3          	sub	s1,a5,s1
80010868:	009b2423          	sw	s1,8(s6)
8001086c:	f4049ce3          	bnez	s1,800107c4 <__sfvwrite_r+0x94>
80010870:	0680006f          	j	800108d8 <__sfvwrite_r+0x1a8>
80010874:	00040593          	mv	a1,s0
80010878:	00090513          	mv	a0,s2
8001087c:	fb4fe0ef          	jal	ra,8000f030 <__swsetup_r>
80010880:	fff00793          	li	a5,-1
80010884:	f0050ce3          	beqz	a0,8001079c <__sfvwrite_r+0x6c>
80010888:	0540006f          	j	800108dc <__sfvwrite_r+0x1ac>
8001088c:	000a2983          	lw	s3,0(s4)
80010890:	004a2483          	lw	s1,4(s4)
80010894:	008a0a13          	addi	s4,s4,8
80010898:	fe048ae3          	beqz	s1,8001088c <__sfvwrite_r+0x15c>
8001089c:	00048693          	mv	a3,s1
800108a0:	009af463          	bgeu	s5,s1,800108a8 <__sfvwrite_r+0x178>
800108a4:	000a8693          	mv	a3,s5
800108a8:	02842783          	lw	a5,40(s0)
800108ac:	02042583          	lw	a1,32(s0)
800108b0:	00098613          	mv	a2,s3
800108b4:	00090513          	mv	a0,s2
800108b8:	000780e7          	jalr	a5
800108bc:	0ea05c63          	blez	a0,800109b4 <__sfvwrite_r+0x284>
800108c0:	008b2783          	lw	a5,8(s6)
800108c4:	00a989b3          	add	s3,s3,a0
800108c8:	40a484b3          	sub	s1,s1,a0
800108cc:	40a78533          	sub	a0,a5,a0
800108d0:	00ab2423          	sw	a0,8(s6)
800108d4:	fc0512e3          	bnez	a0,80010898 <__sfvwrite_r+0x168>
800108d8:	00000793          	li	a5,0
800108dc:	03c12083          	lw	ra,60(sp)
800108e0:	03812403          	lw	s0,56(sp)
800108e4:	03412483          	lw	s1,52(sp)
800108e8:	03012903          	lw	s2,48(sp)
800108ec:	02c12983          	lw	s3,44(sp)
800108f0:	02812a03          	lw	s4,40(sp)
800108f4:	02412a83          	lw	s5,36(sp)
800108f8:	02012b03          	lw	s6,32(sp)
800108fc:	01c12b83          	lw	s7,28(sp)
80010900:	01812c03          	lw	s8,24(sp)
80010904:	01412c83          	lw	s9,20(sp)
80010908:	01012d03          	lw	s10,16(sp)
8001090c:	00c12d83          	lw	s11,12(sp)
80010910:	00078513          	mv	a0,a5
80010914:	04010113          	addi	sp,sp,64
80010918:	00008067          	ret
8001091c:	80000ab7          	lui	s5,0x80000
80010920:	00000993          	li	s3,0
80010924:	00000493          	li	s1,0
80010928:	c00aca93          	xori	s5,s5,-1024
8001092c:	f6dff06f          	j	80010898 <__sfvwrite_r+0x168>
80010930:	000a2b83          	lw	s7,0(s4)
80010934:	004a2483          	lw	s1,4(s4)
80010938:	008a0a13          	addi	s4,s4,8
8001093c:	fe048ae3          	beqz	s1,80010930 <__sfvwrite_r+0x200>
80010940:	00c45783          	lhu	a5,12(s0)
80010944:	00842d83          	lw	s11,8(s0)
80010948:	00042503          	lw	a0,0(s0)
8001094c:	2007f713          	andi	a4,a5,512
80010950:	14070263          	beqz	a4,80010a94 <__sfvwrite_r+0x364>
80010954:	0db4e063          	bltu	s1,s11,80010a14 <__sfvwrite_r+0x2e4>
80010958:	4807f713          	andi	a4,a5,1152
8001095c:	0a070c63          	beqz	a4,80010a14 <__sfvwrite_r+0x2e4>
80010960:	01442703          	lw	a4,20(s0)
80010964:	01042583          	lw	a1,16(s0)
80010968:	00171a93          	slli	s5,a4,0x1
8001096c:	00ea8733          	add	a4,s5,a4
80010970:	01f75a93          	srli	s5,a4,0x1f
80010974:	40b50d33          	sub	s10,a0,a1
80010978:	00ea8ab3          	add	s5,s5,a4
8001097c:	001d0713          	addi	a4,s10,1
80010980:	401ada93          	srai	s5,s5,0x1
80010984:	00970733          	add	a4,a4,s1
80010988:	00eaf463          	bgeu	s5,a4,80010990 <__sfvwrite_r+0x260>
8001098c:	00070a93          	mv	s5,a4
80010990:	4007f793          	andi	a5,a5,1024
80010994:	0c078863          	beqz	a5,80010a64 <__sfvwrite_r+0x334>
80010998:	000a8593          	mv	a1,s5
8001099c:	00090513          	mv	a0,s2
800109a0:	b11fd0ef          	jal	ra,8000e4b0 <_malloc_r>
800109a4:	00050993          	mv	s3,a0
800109a8:	02051a63          	bnez	a0,800109dc <__sfvwrite_r+0x2ac>
800109ac:	00c00793          	li	a5,12
800109b0:	00f92023          	sw	a5,0(s2)
800109b4:	00c45783          	lhu	a5,12(s0)
800109b8:	0407e793          	ori	a5,a5,64
800109bc:	00f41623          	sh	a5,12(s0)
800109c0:	fff00793          	li	a5,-1
800109c4:	f19ff06f          	j	800108dc <__sfvwrite_r+0x1ac>
800109c8:	80000c37          	lui	s8,0x80000
800109cc:	ffec4c93          	xori	s9,s8,-2
800109d0:	00000493          	li	s1,0
800109d4:	fffc4c13          	not	s8,s8
800109d8:	f65ff06f          	j	8001093c <__sfvwrite_r+0x20c>
800109dc:	01042583          	lw	a1,16(s0)
800109e0:	000d0613          	mv	a2,s10
800109e4:	841fd0ef          	jal	ra,8000e224 <memcpy>
800109e8:	00c45783          	lhu	a5,12(s0)
800109ec:	b7f7f793          	andi	a5,a5,-1153
800109f0:	0807e793          	ori	a5,a5,128
800109f4:	00f41623          	sh	a5,12(s0)
800109f8:	01342823          	sw	s3,16(s0)
800109fc:	01542a23          	sw	s5,20(s0)
80010a00:	01a989b3          	add	s3,s3,s10
80010a04:	41aa8ab3          	sub	s5,s5,s10
80010a08:	01342023          	sw	s3,0(s0)
80010a0c:	00048d93          	mv	s11,s1
80010a10:	01542423          	sw	s5,8(s0)
80010a14:	00048993          	mv	s3,s1
80010a18:	01b4f463          	bgeu	s1,s11,80010a20 <__sfvwrite_r+0x2f0>
80010a1c:	00048d93          	mv	s11,s1
80010a20:	00042503          	lw	a0,0(s0)
80010a24:	000d8613          	mv	a2,s11
80010a28:	000b8593          	mv	a1,s7
80010a2c:	8d1fd0ef          	jal	ra,8000e2fc <memmove>
80010a30:	00842783          	lw	a5,8(s0)
80010a34:	41b787b3          	sub	a5,a5,s11
80010a38:	00f42423          	sw	a5,8(s0)
80010a3c:	00042783          	lw	a5,0(s0)
80010a40:	01b78db3          	add	s11,a5,s11
80010a44:	01b42023          	sw	s11,0(s0)
80010a48:	008b2783          	lw	a5,8(s6)
80010a4c:	013b8bb3          	add	s7,s7,s3
80010a50:	413484b3          	sub	s1,s1,s3
80010a54:	413789b3          	sub	s3,a5,s3
80010a58:	013b2423          	sw	s3,8(s6)
80010a5c:	ee0990e3          	bnez	s3,8001093c <__sfvwrite_r+0x20c>
80010a60:	e79ff06f          	j	800108d8 <__sfvwrite_r+0x1a8>
80010a64:	000a8613          	mv	a2,s5
80010a68:	00090513          	mv	a0,s2
80010a6c:	18c000ef          	jal	ra,80010bf8 <_realloc_r>
80010a70:	00050993          	mv	s3,a0
80010a74:	f80512e3          	bnez	a0,800109f8 <__sfvwrite_r+0x2c8>
80010a78:	01042583          	lw	a1,16(s0)
80010a7c:	00090513          	mv	a0,s2
80010a80:	92dfd0ef          	jal	ra,8000e3ac <_free_r>
80010a84:	00c45783          	lhu	a5,12(s0)
80010a88:	f7f7f793          	andi	a5,a5,-129
80010a8c:	00f41623          	sh	a5,12(s0)
80010a90:	f1dff06f          	j	800109ac <__sfvwrite_r+0x27c>
80010a94:	01042783          	lw	a5,16(s0)
80010a98:	00a7e663          	bltu	a5,a0,80010aa4 <__sfvwrite_r+0x374>
80010a9c:	01442983          	lw	s3,20(s0)
80010aa0:	0534f663          	bgeu	s1,s3,80010aec <__sfvwrite_r+0x3bc>
80010aa4:	000d8993          	mv	s3,s11
80010aa8:	01b4f463          	bgeu	s1,s11,80010ab0 <__sfvwrite_r+0x380>
80010aac:	00048993          	mv	s3,s1
80010ab0:	00098613          	mv	a2,s3
80010ab4:	000b8593          	mv	a1,s7
80010ab8:	845fd0ef          	jal	ra,8000e2fc <memmove>
80010abc:	00842783          	lw	a5,8(s0)
80010ac0:	00042703          	lw	a4,0(s0)
80010ac4:	413787b3          	sub	a5,a5,s3
80010ac8:	01370733          	add	a4,a4,s3
80010acc:	00f42423          	sw	a5,8(s0)
80010ad0:	00e42023          	sw	a4,0(s0)
80010ad4:	f6079ae3          	bnez	a5,80010a48 <__sfvwrite_r+0x318>
80010ad8:	00040593          	mv	a1,s0
80010adc:	00090513          	mv	a0,s2
80010ae0:	8e0fd0ef          	jal	ra,8000dbc0 <_fflush_r>
80010ae4:	f60502e3          	beqz	a0,80010a48 <__sfvwrite_r+0x318>
80010ae8:	ecdff06f          	j	800109b4 <__sfvwrite_r+0x284>
80010aec:	00048513          	mv	a0,s1
80010af0:	009cf463          	bgeu	s9,s1,80010af8 <__sfvwrite_r+0x3c8>
80010af4:	000c0513          	mv	a0,s8
80010af8:	00098593          	mv	a1,s3
80010afc:	8a5fc0ef          	jal	ra,8000d3a0 <__divsi3>
80010b00:	00098593          	mv	a1,s3
80010b04:	879fc0ef          	jal	ra,8000d37c <__mulsi3>
80010b08:	02842783          	lw	a5,40(s0)
80010b0c:	02042583          	lw	a1,32(s0)
80010b10:	00050693          	mv	a3,a0
80010b14:	000b8613          	mv	a2,s7
80010b18:	00090513          	mv	a0,s2
80010b1c:	000780e7          	jalr	a5
80010b20:	00050993          	mv	s3,a0
80010b24:	f2a042e3          	bgtz	a0,80010a48 <__sfvwrite_r+0x318>
80010b28:	e8dff06f          	j	800109b4 <__sfvwrite_r+0x284>
80010b2c:	000a2a83          	lw	s5,0(s4)
80010b30:	004a2983          	lw	s3,4(s4)
80010b34:	00000513          	li	a0,0
80010b38:	008a0a13          	addi	s4,s4,8
80010b3c:	c89ff06f          	j	800107c4 <__sfvwrite_r+0x94>
80010b40:	02dc4263          	blt	s8,a3,80010b64 <__sfvwrite_r+0x434>
80010b44:	02842783          	lw	a5,40(s0)
80010b48:	02042583          	lw	a1,32(s0)
80010b4c:	000a8613          	mv	a2,s5
80010b50:	00090513          	mv	a0,s2
80010b54:	000780e7          	jalr	a5
80010b58:	00050493          	mv	s1,a0
80010b5c:	cea040e3          	bgtz	a0,8001083c <__sfvwrite_r+0x10c>
80010b60:	e55ff06f          	j	800109b4 <__sfvwrite_r+0x284>
80010b64:	000c0613          	mv	a2,s8
80010b68:	000a8593          	mv	a1,s5
80010b6c:	f90fd0ef          	jal	ra,8000e2fc <memmove>
80010b70:	00842783          	lw	a5,8(s0)
80010b74:	000c0493          	mv	s1,s8
80010b78:	418787b3          	sub	a5,a5,s8
80010b7c:	00f42423          	sw	a5,8(s0)
80010b80:	00042783          	lw	a5,0(s0)
80010b84:	018787b3          	add	a5,a5,s8
80010b88:	00f42023          	sw	a5,0(s0)
80010b8c:	cb1ff06f          	j	8001083c <__sfvwrite_r+0x10c>

Disassembly of section .text._isatty_r:

80010b90 <_isatty_r>:
80010b90:	ff010113          	addi	sp,sp,-16
80010b94:	00812423          	sw	s0,8(sp)
80010b98:	00050413          	mv	s0,a0
80010b9c:	00058513          	mv	a0,a1
80010ba0:	c401a623          	sw	zero,-948(gp) # 800034cc <errno>
80010ba4:	00112623          	sw	ra,12(sp)
80010ba8:	9c4f50ef          	jal	ra,80005d6c <_isatty>
80010bac:	fff00793          	li	a5,-1
80010bb0:	00f51a63          	bne	a0,a5,80010bc4 <_isatty_r+0x34>
80010bb4:	c4c18793          	addi	a5,gp,-948 # 800034cc <errno>
80010bb8:	0007a783          	lw	a5,0(a5)
80010bbc:	00078463          	beqz	a5,80010bc4 <_isatty_r+0x34>
80010bc0:	00f42023          	sw	a5,0(s0)
80010bc4:	00c12083          	lw	ra,12(sp)
80010bc8:	00812403          	lw	s0,8(sp)
80010bcc:	01010113          	addi	sp,sp,16
80010bd0:	00008067          	ret

Disassembly of section .text.memchr:

80010bd4 <memchr>:
80010bd4:	0ff5f593          	andi	a1,a1,255
80010bd8:	00c50633          	add	a2,a0,a2
80010bdc:	00c51663          	bne	a0,a2,80010be8 <memchr+0x14>
80010be0:	00000513          	li	a0,0
80010be4:	00008067          	ret
80010be8:	00054783          	lbu	a5,0(a0)
80010bec:	feb78ce3          	beq	a5,a1,80010be4 <memchr+0x10>
80010bf0:	00150513          	addi	a0,a0,1
80010bf4:	fe9ff06f          	j	80010bdc <memchr+0x8>

Disassembly of section .text._realloc_r:

80010bf8 <_realloc_r>:
80010bf8:	00059663          	bnez	a1,80010c04 <_realloc_r+0xc>
80010bfc:	00060593          	mv	a1,a2
80010c00:	8b1fd06f          	j	8000e4b0 <_malloc_r>
80010c04:	fe010113          	addi	sp,sp,-32
80010c08:	00812c23          	sw	s0,24(sp)
80010c0c:	00112e23          	sw	ra,28(sp)
80010c10:	00912a23          	sw	s1,20(sp)
80010c14:	01212823          	sw	s2,16(sp)
80010c18:	01312623          	sw	s3,12(sp)
80010c1c:	00060413          	mv	s0,a2
80010c20:	02061663          	bnez	a2,80010c4c <_realloc_r+0x54>
80010c24:	f88fd0ef          	jal	ra,8000e3ac <_free_r>
80010c28:	00000913          	li	s2,0
80010c2c:	01c12083          	lw	ra,28(sp)
80010c30:	01812403          	lw	s0,24(sp)
80010c34:	00090513          	mv	a0,s2
80010c38:	01412483          	lw	s1,20(sp)
80010c3c:	01012903          	lw	s2,16(sp)
80010c40:	00c12983          	lw	s3,12(sp)
80010c44:	02010113          	addi	sp,sp,32
80010c48:	00008067          	ret
80010c4c:	00058493          	mv	s1,a1
80010c50:	00050993          	mv	s3,a0
80010c54:	03c000ef          	jal	ra,80010c90 <_malloc_usable_size_r>
80010c58:	00048913          	mv	s2,s1
80010c5c:	fc8578e3          	bgeu	a0,s0,80010c2c <_realloc_r+0x34>
80010c60:	00040593          	mv	a1,s0
80010c64:	00098513          	mv	a0,s3
80010c68:	849fd0ef          	jal	ra,8000e4b0 <_malloc_r>
80010c6c:	00050913          	mv	s2,a0
80010c70:	fa050ee3          	beqz	a0,80010c2c <_realloc_r+0x34>
80010c74:	00048593          	mv	a1,s1
80010c78:	00040613          	mv	a2,s0
80010c7c:	da8fd0ef          	jal	ra,8000e224 <memcpy>
80010c80:	00048593          	mv	a1,s1
80010c84:	00098513          	mv	a0,s3
80010c88:	f24fd0ef          	jal	ra,8000e3ac <_free_r>
80010c8c:	fa1ff06f          	j	80010c2c <_realloc_r+0x34>

Disassembly of section .text._malloc_usable_size_r:

80010c90 <_malloc_usable_size_r>:
80010c90:	ffc5a783          	lw	a5,-4(a1)
80010c94:	ffc78513          	addi	a0,a5,-4
80010c98:	0007d863          	bgez	a5,80010ca8 <_malloc_usable_size_r+0x18>
80010c9c:	00a585b3          	add	a1,a1,a0
80010ca0:	0005a783          	lw	a5,0(a1)
80010ca4:	00f50533          	add	a0,a0,a5
80010ca8:	00008067          	ret
