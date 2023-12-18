
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
80000064:	165030ef          	jal	ra,800039c8 <irqCallback>
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
800000b4:	7f818193          	addi	gp,gp,2040 # 800038a8 <__global_pointer$>
800000b8:	00011117          	auipc	sp,0x11
800000bc:	3a810113          	addi	sp,sp,936 # 80011460 <_stack_start>

800000c0 <bss_init>:
800000c0:	86018513          	addi	a0,gp,-1952 # 80003108 <t2>
800000c4:	c5018593          	addi	a1,gp,-944 # 800034f8 <_bss_end>

800000c8 <bss_loop>:
800000c8:	00b50863          	beq	a0,a1,800000d8 <bss_done>
800000cc:	00052023          	sw	zero,0(a0)
800000d0:	00450513          	addi	a0,a0,4
800000d4:	ff5ff06f          	j	800000c8 <bss_loop>

800000d8 <bss_done>:
800000d8:	00011517          	auipc	a0,0x11
800000dc:	b8450513          	addi	a0,a0,-1148 # 80010c5c <_ctors_end>
800000e0:	ffc10113          	addi	sp,sp,-4

800000e4 <ctors_loop>:
800000e4:	00011597          	auipc	a1,0x11
800000e8:	b7858593          	addi	a1,a1,-1160 # 80010c5c <_ctors_end>
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
80000124:	2e00d0ef          	jal	ra,8000d404 <end>

80000128 <infinitLoop>:
80000128:	0000006f          	j	80000128 <infinitLoop>
	...

Disassembly of section .memory:

8000355c <crc16>:
8000355c:	000107b7          	lui	a5,0x10
80003560:	ffffa6b7          	lui	a3,0xffffa
80003564:	00000713          	li	a4,0
80003568:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
8000356c:	00168693          	addi	a3,a3,1 # ffffa001 <_ram_heap_end+0x7ffe8001>
80003570:	00b74663          	blt	a4,a1,8000357c <crc16+0x20>
80003574:	00078513          	mv	a0,a5
80003578:	00008067          	ret
8000357c:	00e50633          	add	a2,a0,a4
80003580:	00064603          	lbu	a2,0(a2)
80003584:	00c7c7b3          	xor	a5,a5,a2
80003588:	00800613          	li	a2,8
8000358c:	0017f813          	andi	a6,a5,1
80003590:	0017d793          	srli	a5,a5,0x1
80003594:	00080863          	beqz	a6,800035a4 <crc16+0x48>
80003598:	00d7c7b3          	xor	a5,a5,a3
8000359c:	01079793          	slli	a5,a5,0x10
800035a0:	0107d793          	srli	a5,a5,0x10
800035a4:	fff60613          	addi	a2,a2,-1
800035a8:	fe0612e3          	bnez	a2,8000358c <crc16+0x30>
800035ac:	00170713          	addi	a4,a4,1
800035b0:	fc1ff06f          	j	80003570 <crc16+0x14>

800035b4 <add_crc>:
800035b4:	ff010113          	addi	sp,sp,-16
800035b8:	00812423          	sw	s0,8(sp)
800035bc:	00912223          	sw	s1,4(sp)
800035c0:	00112623          	sw	ra,12(sp)
800035c4:	00050413          	mv	s0,a0
800035c8:	00058493          	mv	s1,a1
800035cc:	f91ff0ef          	jal	ra,8000355c <crc16>
800035d0:	009405b3          	add	a1,s0,s1
800035d4:	00a58023          	sb	a0,0(a1)
800035d8:	00855513          	srli	a0,a0,0x8
800035dc:	00a580a3          	sb	a0,1(a1)
800035e0:	00c12083          	lw	ra,12(sp)
800035e4:	00812403          	lw	s0,8(sp)
800035e8:	00412483          	lw	s1,4(sp)
800035ec:	01010113          	addi	sp,sp,16
800035f0:	00008067          	ret

800035f4 <println>:
800035f4:	ff010113          	addi	sp,sp,-16
800035f8:	00112623          	sw	ra,12(sp)
800035fc:	600020ef          	jal	ra,80005bfc <print_uart0>
80003600:	00c12083          	lw	ra,12(sp)
80003604:	80003537          	lui	a0,0x80003
80003608:	87450513          	addi	a0,a0,-1932 # 80002874 <_ram_heap_end+0xffff0874>
8000360c:	01010113          	addi	sp,sp,16
80003610:	5ec0206f          	j	80005bfc <print_uart0>

80003614 <to_hex_nibble>:
80003614:	00f57513          	andi	a0,a0,15
80003618:	00900793          	li	a5,9
8000361c:	00a7f663          	bgeu	a5,a0,80003628 <to_hex_nibble+0x14>
80003620:	03750513          	addi	a0,a0,55
80003624:	00008067          	ret
80003628:	03050513          	addi	a0,a0,48
8000362c:	00008067          	ret

80003630 <to_hex>:
80003630:	fd010113          	addi	sp,sp,-48
80003634:	02812423          	sw	s0,40(sp)
80003638:	02912223          	sw	s1,36(sp)
8000363c:	03212023          	sw	s2,32(sp)
80003640:	01312e23          	sw	s3,28(sp)
80003644:	02112623          	sw	ra,44(sp)
80003648:	00050913          	mv	s2,a0
8000364c:	00050493          	mv	s1,a0
80003650:	01c00413          	li	s0,28
80003654:	ffc00993          	li	s3,-4
80003658:	0085d533          	srl	a0,a1,s0
8000365c:	0ff57513          	andi	a0,a0,255
80003660:	00b12623          	sw	a1,12(sp)
80003664:	fb1ff0ef          	jal	ra,80003614 <to_hex_nibble>
80003668:	00a48023          	sb	a0,0(s1)
8000366c:	ffc40413          	addi	s0,s0,-4
80003670:	00148493          	addi	s1,s1,1
80003674:	00c12583          	lw	a1,12(sp)
80003678:	ff3410e3          	bne	s0,s3,80003658 <to_hex+0x28>
8000367c:	02c12083          	lw	ra,44(sp)
80003680:	02812403          	lw	s0,40(sp)
80003684:	00090423          	sb	zero,8(s2)
80003688:	02412483          	lw	s1,36(sp)
8000368c:	02012903          	lw	s2,32(sp)
80003690:	01c12983          	lw	s3,28(sp)
80003694:	03010113          	addi	sp,sp,48
80003698:	00008067          	ret

8000369c <process_and_wait>:
8000369c:	fe010113          	addi	sp,sp,-32
800036a0:	00812c23          	sw	s0,24(sp)
800036a4:	00912a23          	sw	s1,20(sp)
800036a8:	01412423          	sw	s4,8(sp)
800036ac:	01512223          	sw	s5,4(sp)
800036b0:	00112e23          	sw	ra,28(sp)
800036b4:	01212823          	sw	s2,16(sp)
800036b8:	01312623          	sw	s3,12(sp)
800036bc:	f00b07b7          	lui	a5,0xf00b0
800036c0:	0007a903          	lw	s2,0(a5) # f00b0000 <_ram_heap_end+0x7009e000>
800036c4:	0047a983          	lw	s3,4(a5)
800036c8:	00050a13          	mv	s4,a0
800036cc:	f00b0ab7          	lui	s5,0xf00b0
800036d0:	000aa783          	lw	a5,0(s5) # f00b0000 <_ram_heap_end+0x7009e000>
800036d4:	004aa803          	lw	a6,4(s5)
800036d8:	412786b3          	sub	a3,a5,s2
800036dc:	00d7b733          	sltu	a4,a5,a3
800036e0:	413807b3          	sub	a5,a6,s3
800036e4:	02e79663          	bne	a5,a4,80003710 <process_and_wait+0x74>
800036e8:	0346f463          	bgeu	a3,s4,80003710 <process_and_wait+0x74>
800036ec:	8741a783          	lw	a5,-1932(gp) # 8000311c <events_modbus_rtu_poll>
800036f0:	00078663          	beqz	a5,800036fc <process_and_wait+0x60>
800036f4:	398000ef          	jal	ra,80003a8c <modbus_rtu_poll>
800036f8:	8601aa23          	sw	zero,-1932(gp) # 8000311c <events_modbus_rtu_poll>
800036fc:	8781a783          	lw	a5,-1928(gp) # 80003120 <events_mac_poll>
80003700:	fc0788e3          	beqz	a5,800036d0 <process_and_wait+0x34>
80003704:	33d010ef          	jal	ra,80005240 <mac_poll>
80003708:	8601ac23          	sw	zero,-1928(gp) # 80003120 <events_mac_poll>
8000370c:	fc5ff06f          	j	800036d0 <process_and_wait+0x34>
80003710:	01c12083          	lw	ra,28(sp)
80003714:	01812403          	lw	s0,24(sp)
80003718:	01412483          	lw	s1,20(sp)
8000371c:	01012903          	lw	s2,16(sp)
80003720:	00c12983          	lw	s3,12(sp)
80003724:	00812a03          	lw	s4,8(sp)
80003728:	00412a83          	lw	s5,4(sp)
8000372c:	02010113          	addi	sp,sp,32
80003730:	00008067          	ret

80003734 <sram_test_write_random_ints>:
80003734:	80002537          	lui	a0,0x80002
80003738:	fe010113          	addi	sp,sp,-32
8000373c:	00080637          	lui	a2,0x80
80003740:	900005b7          	lui	a1,0x90000
80003744:	f3450513          	addi	a0,a0,-204 # 80001f34 <_ram_heap_end+0xfffeff34>
80003748:	00112e23          	sw	ra,28(sp)
8000374c:	00812c23          	sw	s0,24(sp)
80003750:	00912a23          	sw	s1,20(sp)
80003754:	01212823          	sw	s2,16(sp)
80003758:	01312623          	sw	s3,12(sp)
8000375c:	01412423          	sw	s4,8(sp)
80003760:	6b50a0ef          	jal	ra,8000e614 <iprintf>
80003764:	deadc7b7          	lui	a5,0xdeadc
80003768:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac9eef>
8000376c:	90000737          	lui	a4,0x90000
80003770:	900806b7          	lui	a3,0x90080
80003774:	00f72023          	sw	a5,0(a4) # 90000000 <_ram_heap_end+0xffee000>
80003778:	00470713          	addi	a4,a4,4
8000377c:	00179793          	slli	a5,a5,0x1
80003780:	fed71ae3          	bne	a4,a3,80003774 <sram_test_write_random_ints+0x40>
80003784:	80002537          	lui	a0,0x80002
80003788:	00080637          	lui	a2,0x80
8000378c:	900005b7          	lui	a1,0x90000
80003790:	f6050513          	addi	a0,a0,-160 # 80001f60 <_ram_heap_end+0xfffeff60>
80003794:	deadc4b7          	lui	s1,0xdeadc
80003798:	67d0a0ef          	jal	ra,8000e614 <iprintf>
8000379c:	00000913          	li	s2,0
800037a0:	eef48493          	addi	s1,s1,-273 # deadbeef <_ram_heap_end+0x5eac9eef>
800037a4:	90000437          	lui	s0,0x90000
800037a8:	80002a37          	lui	s4,0x80002
800037ac:	900809b7          	lui	s3,0x90080
800037b0:	00042783          	lw	a5,0(s0) # 90000000 <_ram_heap_end+0xffee000>
800037b4:	00978e63          	beq	a5,s1,800037d0 <sram_test_write_random_ints+0x9c>
800037b8:	00042683          	lw	a3,0(s0)
800037bc:	00048613          	mv	a2,s1
800037c0:	00040593          	mv	a1,s0
800037c4:	f8ca0513          	addi	a0,s4,-116 # 80001f8c <_ram_heap_end+0xfffeff8c>
800037c8:	64d0a0ef          	jal	ra,8000e614 <iprintf>
800037cc:	00190913          	addi	s2,s2,1
800037d0:	00440413          	addi	s0,s0,4
800037d4:	00149493          	slli	s1,s1,0x1
800037d8:	fd341ce3          	bne	s0,s3,800037b0 <sram_test_write_random_ints+0x7c>
800037dc:	80002537          	lui	a0,0x80002
800037e0:	00090593          	mv	a1,s2
800037e4:	fc050513          	addi	a0,a0,-64 # 80001fc0 <_ram_heap_end+0xfffeffc0>
800037e8:	62d0a0ef          	jal	ra,8000e614 <iprintf>
800037ec:	01c12083          	lw	ra,28(sp)
800037f0:	01812403          	lw	s0,24(sp)
800037f4:	00090513          	mv	a0,s2
800037f8:	01412483          	lw	s1,20(sp)
800037fc:	01012903          	lw	s2,16(sp)
80003800:	00c12983          	lw	s3,12(sp)
80003804:	00812a03          	lw	s4,8(sp)
80003808:	02010113          	addi	sp,sp,32
8000380c:	00008067          	ret

80003810 <timerInterrupt>:
80003810:	00008067          	ret

80003814 <externalInterrupt>:
80003814:	ff010113          	addi	sp,sp,-16
80003818:	00112623          	sw	ra,12(sp)
8000381c:	00812423          	sw	s0,8(sp)
80003820:	f00607b7          	lui	a5,0xf0060
80003824:	0047a783          	lw	a5,4(a5) # f0060004 <_ram_heap_end+0x7004e004>
80003828:	0017f793          	andi	a5,a5,1
8000382c:	02078c63          	beqz	a5,80003864 <externalInterrupt+0x50>
80003830:	f0000737          	lui	a4,0xf0000
80003834:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
80003838:	02a00593          	li	a1,42
8000383c:	0027e793          	ori	a5,a5,2
80003840:	00f72223          	sw	a5,4(a4)
80003844:	f0010737          	lui	a4,0xf0010
80003848:	00472783          	lw	a5,4(a4) # f0010004 <_ram_heap_end+0x6fffe004>
8000384c:	0187d793          	srli	a5,a5,0x18
80003850:	0e079c63          	bnez	a5,80003948 <__global_pointer$+0xa0>
80003854:	f0060737          	lui	a4,0xf0060
80003858:	00472783          	lw	a5,4(a4) # f0060004 <_ram_heap_end+0x7004e004>
8000385c:	ffe7f793          	andi	a5,a5,-2
80003860:	00f72223          	sw	a5,4(a4)
80003864:	f0060437          	lui	s0,0xf0060
80003868:	00442783          	lw	a5,4(s0) # f0060004 <_ram_heap_end+0x7004e004>
8000386c:	0027f793          	andi	a5,a5,2
80003870:	00078a63          	beqz	a5,80003884 <externalInterrupt+0x70>
80003874:	2fc000ef          	jal	ra,80003b70 <modbus_rtu_isr>
80003878:	00442783          	lw	a5,4(s0)
8000387c:	ffd7f793          	andi	a5,a5,-3
80003880:	00f42223          	sw	a5,4(s0)
80003884:	f0060437          	lui	s0,0xf0060
80003888:	00442783          	lw	a5,4(s0) # f0060004 <_ram_heap_end+0x7004e004>
8000388c:	0047f793          	andi	a5,a5,4
80003890:	00078a63          	beqz	a5,800038a4 <externalInterrupt+0x90>
80003894:	6dc010ef          	jal	ra,80004f70 <mac_rx_isr>
80003898:	00442783          	lw	a5,4(s0)
8000389c:	ffb7f793          	andi	a5,a5,-5
800038a0:	00f42223          	sw	a5,4(s0)
800038a4:	f00607b7          	lui	a5,0xf0060
800038a8:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x7004e004>
800038ac:	00877713          	andi	a4,a4,8
800038b0:	02070863          	beqz	a4,800038e0 <__global_pointer$+0x38>
800038b4:	f0020737          	lui	a4,0xf0020
800038b8:	000186b7          	lui	a3,0x18
800038bc:	00072623          	sw	zero,12(a4) # f002000c <_ram_heap_end+0x7000e00c>
800038c0:	6a068693          	addi	a3,a3,1696 # 186a0 <_stack_size+0x17ea0>
800038c4:	00d72823          	sw	a3,16(a4)
800038c8:	00100693          	li	a3,1
800038cc:	00d72023          	sw	a3,0(a4)
800038d0:	86d1ac23          	sw	a3,-1928(gp) # 80003120 <events_mac_poll>
800038d4:	0047a703          	lw	a4,4(a5)
800038d8:	ff777713          	andi	a4,a4,-9
800038dc:	00e7a223          	sw	a4,4(a5)
800038e0:	f00607b7          	lui	a5,0xf0060
800038e4:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x7004e004>
800038e8:	01077713          	andi	a4,a4,16
800038ec:	02070863          	beqz	a4,8000391c <__global_pointer$+0x74>
800038f0:	f0021737          	lui	a4,0xf0021
800038f4:	0000c6b7          	lui	a3,0xc
800038f8:	00072623          	sw	zero,12(a4) # f002100c <_ram_heap_end+0x7000f00c>
800038fc:	35068693          	addi	a3,a3,848 # c350 <_stack_size+0xbb50>
80003900:	00d72823          	sw	a3,16(a4)
80003904:	00100693          	li	a3,1
80003908:	00d72023          	sw	a3,0(a4)
8000390c:	86d1aa23          	sw	a3,-1932(gp) # 8000311c <events_modbus_rtu_poll>
80003910:	0047a703          	lw	a4,4(a5)
80003914:	fef77713          	andi	a4,a4,-17
80003918:	00e7a223          	sw	a4,4(a5)
8000391c:	f00607b7          	lui	a5,0xf0060
80003920:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x7004e004>
80003924:	02077713          	andi	a4,a4,32
80003928:	00070863          	beqz	a4,80003938 <__global_pointer$+0x90>
8000392c:	0047a703          	lw	a4,4(a5)
80003930:	fdf77713          	andi	a4,a4,-33
80003934:	00e7a223          	sw	a4,4(a5)
80003938:	00c12083          	lw	ra,12(sp)
8000393c:	00812403          	lw	s0,8(sp)
80003940:	01010113          	addi	sp,sp,16
80003944:	00008067          	ret
80003948:	00072783          	lw	a5,0(a4)
8000394c:	0ff7f513          	andi	a0,a5,255
80003950:	0ff7f693          	andi	a3,a5,255
80003954:	00472783          	lw	a5,4(a4)
80003958:	0107d793          	srli	a5,a5,0x10
8000395c:	0ff7f793          	andi	a5,a5,255
80003960:	fe078ae3          	beqz	a5,80003954 <__global_pointer$+0xac>
80003964:	00d72023          	sw	a3,0(a4)
80003968:	00b51a63          	bne	a0,a1,8000397c <__global_pointer$+0xd4>
8000396c:	87c1a783          	lw	a5,-1924(gp) # 80003124 <uart_config_reset_counter>
80003970:	00178793          	addi	a5,a5,1
80003974:	86f1ae23          	sw	a5,-1924(gp) # 80003124 <uart_config_reset_counter>
80003978:	ed1ff06f          	j	80003848 <externalInterrupt+0x34>
8000397c:	8601ae23          	sw	zero,-1924(gp) # 80003124 <uart_config_reset_counter>
80003980:	ec9ff06f          	j	80003848 <externalInterrupt+0x34>

80003984 <crash>:
80003984:	ff010113          	addi	sp,sp,-16
80003988:	00812423          	sw	s0,8(sp)
8000398c:	00050593          	mv	a1,a0
80003990:	90418513          	addi	a0,gp,-1788 # 800031ac <crash_str>
80003994:	00112623          	sw	ra,12(sp)
80003998:	c99ff0ef          	jal	ra,80003630 <to_hex>
8000399c:	80002537          	lui	a0,0x80002
800039a0:	28c50513          	addi	a0,a0,652 # 8000228c <_ram_heap_end+0xffff028c>
800039a4:	258020ef          	jal	ra,80005bfc <print_uart0>
800039a8:	90418513          	addi	a0,gp,-1788 # 800031ac <crash_str>
800039ac:	250020ef          	jal	ra,80005bfc <print_uart0>
800039b0:	00812403          	lw	s0,8(sp)
800039b4:	00c12083          	lw	ra,12(sp)
800039b8:	80003537          	lui	a0,0x80003
800039bc:	87450513          	addi	a0,a0,-1932 # 80002874 <_ram_heap_end+0xffff0874>
800039c0:	01010113          	addi	sp,sp,16
800039c4:	2380206f          	j	80005bfc <print_uart0>

800039c8 <irqCallback>:
800039c8:	88c1a783          	lw	a5,-1908(gp) # 80003134 <reg_irq_counter>
800039cc:	00178793          	addi	a5,a5,1
800039d0:	88f1a623          	sw	a5,-1908(gp) # 80003134 <reg_irq_counter>
800039d4:	342027f3          	csrr	a5,mcause
800039d8:	0207d263          	bgez	a5,800039fc <irqCallback+0x34>
800039dc:	00f7f793          	andi	a5,a5,15
800039e0:	00700713          	li	a4,7
800039e4:	02e78063          	beq	a5,a4,80003a04 <irqCallback+0x3c>
800039e8:	00b00713          	li	a4,11
800039ec:	00e79463          	bne	a5,a4,800039f4 <irqCallback+0x2c>
800039f0:	e25ff06f          	j	80003814 <externalInterrupt>
800039f4:	00200513          	li	a0,2
800039f8:	f8dff06f          	j	80003984 <crash>
800039fc:	00100513          	li	a0,1
80003a00:	ff9ff06f          	j	800039f8 <irqCallback+0x30>
80003a04:	00008067          	ret

80003a08 <modbus_rtu_init>:
80003a08:	fe010113          	addi	sp,sp,-32
80003a0c:	00112e23          	sw	ra,28(sp)
80003a10:	00812c23          	sw	s0,24(sp)
80003a14:	f0011437          	lui	s0,0xf0011
80003a18:	00842783          	lw	a5,8(s0) # f0011008 <_ram_heap_end+0x6ffff008>
80003a1c:	9ac1a583          	lw	a1,-1620(gp) # 80003254 <active_config+0x18>
80003a20:	017d8537          	lui	a0,0x17d8
80003a24:	84050513          	addi	a0,a0,-1984 # 17d7840 <_stack_size+0x17d7040>
80003a28:	00f12623          	sw	a5,12(sp)
80003a2c:	12d090ef          	jal	ra,8000d358 <__udivsi3>
80003a30:	00500593          	li	a1,5
80003a34:	125090ef          	jal	ra,8000d358 <__udivsi3>
80003a38:	fff50713          	addi	a4,a0,-1
80003a3c:	00e42423          	sw	a4,8(s0)
80003a40:	00600693          	li	a3,6
80003a44:	00d42623          	sw	a3,12(s0)
80003a48:	00c12783          	lw	a5,12(sp)
80003a4c:	80002537          	lui	a0,0x80002
80003a50:	00000693          	li	a3,0
80003a54:	00000613          	li	a2,0
80003a58:	00700593          	li	a1,7
80003a5c:	29c50513          	addi	a0,a0,668 # 8000229c <_ram_heap_end+0xffff029c>
80003a60:	3b50a0ef          	jal	ra,8000e614 <iprintf>
80003a64:	f00b07b7          	lui	a5,0xf00b0
80003a68:	0007a603          	lw	a2,0(a5) # f00b0000 <_ram_heap_end+0x7009e000>
80003a6c:	0047a683          	lw	a3,4(a5)
80003a70:	88c1a823          	sw	a2,-1904(gp) # 80003138 <modbus_rtu_rx_timestamp>
80003a74:	01c12083          	lw	ra,28(sp)
80003a78:	01812403          	lw	s0,24(sp)
80003a7c:	88d1aa23          	sw	a3,-1900(gp) # 8000313c <modbus_rtu_rx_timestamp+0x4>
80003a80:	8801ac23          	sw	zero,-1896(gp) # 80003140 <modbus_rtu_rx_len>
80003a84:	02010113          	addi	sp,sp,32
80003a88:	00008067          	ret

80003a8c <modbus_rtu_poll>:
80003a8c:	ef010113          	addi	sp,sp,-272
80003a90:	10812423          	sw	s0,264(sp)
80003a94:	8981a783          	lw	a5,-1896(gp) # 80003140 <modbus_rtu_rx_len>
80003a98:	10112623          	sw	ra,268(sp)
80003a9c:	10912223          	sw	s1,260(sp)
80003aa0:	0a078e63          	beqz	a5,80003b5c <modbus_rtu_poll+0xd0>
80003aa4:	f00b07b7          	lui	a5,0xf00b0
80003aa8:	0047a803          	lw	a6,4(a5) # f00b0004 <_ram_heap_end+0x7009e004>
80003aac:	0007a783          	lw	a5,0(a5)
80003ab0:	8901a503          	lw	a0,-1904(gp) # 80003138 <modbus_rtu_rx_timestamp>
80003ab4:	8941a583          	lw	a1,-1900(gp) # 8000313c <modbus_rtu_rx_timestamp+0x4>
80003ab8:	40a786b3          	sub	a3,a5,a0
80003abc:	00d7b733          	sltu	a4,a5,a3
80003ac0:	40b807b3          	sub	a5,a6,a1
80003ac4:	00e79863          	bne	a5,a4,80003ad4 <modbus_rtu_poll+0x48>
80003ac8:	000027b7          	lui	a5,0x2
80003acc:	70f78793          	addi	a5,a5,1807 # 270f <_stack_size+0x1f0f>
80003ad0:	08d7f663          	bgeu	a5,a3,80003b5c <modbus_rtu_poll+0xd0>
80003ad4:	8981a583          	lw	a1,-1896(gp) # 80003140 <modbus_rtu_rx_len>
80003ad8:	80002537          	lui	a0,0x80002
80003adc:	2fc50513          	addi	a0,a0,764 # 800022fc <_ram_heap_end+0xffff02fc>
80003ae0:	3350a0ef          	jal	ra,8000e614 <iprintf>
80003ae4:	8981a483          	lw	s1,-1896(gp) # 80003140 <modbus_rtu_rx_len>
80003ae8:	08000793          	li	a5,128
80003aec:	00048613          	mv	a2,s1
80003af0:	0097f463          	bgeu	a5,s1,80003af8 <modbus_rtu_poll+0x6c>
80003af4:	08000613          	li	a2,128
80003af8:	91418593          	addi	a1,gp,-1772 # 800031bc <modbus_rtu_rx_buf>
80003afc:	00010513          	mv	a0,sp
80003b00:	6d40a0ef          	jal	ra,8000e1d4 <memcpy>
80003b04:	00048593          	mv	a1,s1
80003b08:	08010613          	addi	a2,sp,128
80003b0c:	00010513          	mv	a0,sp
80003b10:	8801ac23          	sw	zero,-1896(gp) # 80003140 <modbus_rtu_rx_len>
80003b14:	519000ef          	jal	ra,8000482c <modbus_recv>
80003b18:	00050593          	mv	a1,a0
80003b1c:	04050063          	beqz	a0,80003b5c <modbus_rtu_poll+0xd0>
80003b20:	00000713          	li	a4,0
80003b24:	f00116b7          	lui	a3,0xf0011
80003b28:	08010793          	addi	a5,sp,128
80003b2c:	00e787b3          	add	a5,a5,a4
80003b30:	0007c603          	lbu	a2,0(a5)
80003b34:	0046a783          	lw	a5,4(a3) # f0011004 <_ram_heap_end+0x6ffff004>
80003b38:	0107d793          	srli	a5,a5,0x10
80003b3c:	0ff7f793          	andi	a5,a5,255
80003b40:	fe078ae3          	beqz	a5,80003b34 <modbus_rtu_poll+0xa8>
80003b44:	00c6a023          	sw	a2,0(a3)
80003b48:	00170713          	addi	a4,a4,1
80003b4c:	fce59ee3          	bne	a1,a4,80003b28 <modbus_rtu_poll+0x9c>
80003b50:	80002537          	lui	a0,0x80002
80003b54:	32c50513          	addi	a0,a0,812 # 8000232c <_ram_heap_end+0xffff032c>
80003b58:	2bd0a0ef          	jal	ra,8000e614 <iprintf>
80003b5c:	10c12083          	lw	ra,268(sp)
80003b60:	10812403          	lw	s0,264(sp)
80003b64:	10412483          	lw	s1,260(sp)
80003b68:	11010113          	addi	sp,sp,272
80003b6c:	00008067          	ret

80003b70 <modbus_rtu_isr>:
80003b70:	f7010113          	addi	sp,sp,-144
80003b74:	08812423          	sw	s0,136(sp)
80003b78:	08912223          	sw	s1,132(sp)
80003b7c:	08112623          	sw	ra,140(sp)
80003b80:	f00117b7          	lui	a5,0xf0011
80003b84:	0007a683          	lw	a3,0(a5) # f0011000 <_ram_heap_end+0x6ffff000>
80003b88:	8981a603          	lw	a2,-1896(gp) # 80003140 <modbus_rtu_rx_len>
80003b8c:	0ff6f693          	andi	a3,a3,255
80003b90:	00160793          	addi	a5,a2,1 # 80001 <_stack_size+0x7f801>
80003b94:	88f1ac23          	sw	a5,-1896(gp) # 80003140 <modbus_rtu_rx_len>
80003b98:	91418713          	addi	a4,gp,-1772 # 800031bc <modbus_rtu_rx_buf>
80003b9c:	00c70733          	add	a4,a4,a2
80003ba0:	00d70023          	sb	a3,0(a4)
80003ba4:	8981a683          	lw	a3,-1896(gp) # 80003140 <modbus_rtu_rx_len>
80003ba8:	07f00713          	li	a4,127
80003bac:	91418493          	addi	s1,gp,-1772 # 800031bc <modbus_rtu_rx_buf>
80003bb0:	00d77463          	bgeu	a4,a3,80003bb8 <modbus_rtu_isr+0x48>
80003bb4:	8801ac23          	sw	zero,-1896(gp) # 80003140 <modbus_rtu_rx_len>
80003bb8:	f0011737          	lui	a4,0xf0011
80003bbc:	00472783          	lw	a5,4(a4) # f0011004 <_ram_heap_end+0x6ffff004>
80003bc0:	0187d793          	srli	a5,a5,0x18
80003bc4:	04078063          	beqz	a5,80003c04 <modbus_rtu_isr+0x94>
80003bc8:	00472683          	lw	a3,4(a4)
80003bcc:	8981a703          	lw	a4,-1896(gp) # 80003140 <modbus_rtu_rx_len>
80003bd0:	80002637          	lui	a2,0x80002
80003bd4:	0186d693          	srli	a3,a3,0x18
80003bd8:	35c60613          	addi	a2,a2,860 # 8000235c <_ram_heap_end+0xffff035c>
80003bdc:	08000593          	li	a1,128
80003be0:	00010513          	mv	a0,sp
80003be4:	5010a0ef          	jal	ra,8000e8e4 <sniprintf>
80003be8:	00010513          	mv	a0,sp
80003bec:	010020ef          	jal	ra,80005bfc <print_uart0>
80003bf0:	f00116b7          	lui	a3,0xf0011
80003bf4:	07f00613          	li	a2,127
80003bf8:	0046a783          	lw	a5,4(a3) # f0011004 <_ram_heap_end+0x6ffff004>
80003bfc:	0187d793          	srli	a5,a5,0x18
80003c00:	02079663          	bnez	a5,80003c2c <modbus_rtu_isr+0xbc>
80003c04:	f00b07b7          	lui	a5,0xf00b0
80003c08:	0007a603          	lw	a2,0(a5) # f00b0000 <_ram_heap_end+0x7009e000>
80003c0c:	0047a683          	lw	a3,4(a5)
80003c10:	08c12083          	lw	ra,140(sp)
80003c14:	08812403          	lw	s0,136(sp)
80003c18:	88c1a823          	sw	a2,-1904(gp) # 80003138 <modbus_rtu_rx_timestamp>
80003c1c:	88d1aa23          	sw	a3,-1900(gp) # 8000313c <modbus_rtu_rx_timestamp+0x4>
80003c20:	08412483          	lw	s1,132(sp)
80003c24:	09010113          	addi	sp,sp,144
80003c28:	00008067          	ret
80003c2c:	0006a703          	lw	a4,0(a3)
80003c30:	8981a783          	lw	a5,-1896(gp) # 80003140 <modbus_rtu_rx_len>
80003c34:	0ff77713          	andi	a4,a4,255
80003c38:	00178593          	addi	a1,a5,1
80003c3c:	88b1ac23          	sw	a1,-1896(gp) # 80003140 <modbus_rtu_rx_len>
80003c40:	00f487b3          	add	a5,s1,a5
80003c44:	00e78023          	sb	a4,0(a5)
80003c48:	8981a783          	lw	a5,-1896(gp) # 80003140 <modbus_rtu_rx_len>
80003c4c:	faf676e3          	bgeu	a2,a5,80003bf8 <modbus_rtu_isr+0x88>
80003c50:	8801ac23          	sw	zero,-1896(gp) # 80003140 <modbus_rtu_rx_len>
80003c54:	fa5ff06f          	j	80003bf8 <modbus_rtu_isr+0x88>

80003c58 <config_load>:
80003c58:	0c050863          	beqz	a0,80003d28 <config_load+0xd0>
80003c5c:	fe010113          	addi	sp,sp,-32
80003c60:	00812c23          	sw	s0,24(sp)
80003c64:	00912a23          	sw	s1,20(sp)
80003c68:	01212823          	sw	s2,16(sp)
80003c6c:	01312623          	sw	s3,12(sp)
80003c70:	00112e23          	sw	ra,28(sp)
80003c74:	00050413          	mv	s0,a0
80003c78:	00050913          	mv	s2,a0
80003c7c:	00000493          	li	s1,0
80003c80:	02000993          	li	s3,32
80003c84:	00090713          	mv	a4,s2
80003c88:	00400693          	li	a3,4
80003c8c:	00048613          	mv	a2,s1
80003c90:	05000593          	li	a1,80
80003c94:	f0090537          	lui	a0,0xf0090
80003c98:	3fc000ef          	jal	ra,80004094 <eeprom_read_page>
80003c9c:	00400793          	li	a5,4
80003ca0:	02f50a63          	beq	a0,a5,80003cd4 <config_load+0x7c>
80003ca4:	80002537          	lui	a0,0x80002
80003ca8:	00400593          	li	a1,4
80003cac:	39450513          	addi	a0,a0,916 # 80002394 <_ram_heap_end+0xffff0394>
80003cb0:	1650a0ef          	jal	ra,8000e614 <iprintf>
80003cb4:	ffe00513          	li	a0,-2
80003cb8:	01c12083          	lw	ra,28(sp)
80003cbc:	01812403          	lw	s0,24(sp)
80003cc0:	01412483          	lw	s1,20(sp)
80003cc4:	01012903          	lw	s2,16(sp)
80003cc8:	00c12983          	lw	s3,12(sp)
80003ccc:	02010113          	addi	sp,sp,32
80003cd0:	00008067          	ret
80003cd4:	00448493          	addi	s1,s1,4
80003cd8:	0ff4f493          	andi	s1,s1,255
80003cdc:	00490913          	addi	s2,s2,4
80003ce0:	fb3492e3          	bne	s1,s3,80003c84 <config_load+0x2c>
80003ce4:	01e00593          	li	a1,30
80003ce8:	00040513          	mv	a0,s0
80003cec:	871ff0ef          	jal	ra,8000355c <crc16>
80003cf0:	01e45603          	lhu	a2,30(s0)
80003cf4:	00050593          	mv	a1,a0
80003cf8:	00a60c63          	beq	a2,a0,80003d10 <config_load+0xb8>
80003cfc:	80002537          	lui	a0,0x80002
80003d00:	3c850513          	addi	a0,a0,968 # 800023c8 <_ram_heap_end+0xffff03c8>
80003d04:	1110a0ef          	jal	ra,8000e614 <iprintf>
80003d08:	ffd00513          	li	a0,-3
80003d0c:	fadff06f          	j	80003cb8 <config_load+0x60>
80003d10:	80002537          	lui	a0,0x80002
80003d14:	02000593          	li	a1,32
80003d18:	3fc50513          	addi	a0,a0,1020 # 800023fc <_ram_heap_end+0xffff03fc>
80003d1c:	0f90a0ef          	jal	ra,8000e614 <iprintf>
80003d20:	00000513          	li	a0,0
80003d24:	f95ff06f          	j	80003cb8 <config_load+0x60>
80003d28:	fff00513          	li	a0,-1
80003d2c:	00008067          	ret

80003d30 <config_save>:
80003d30:	fe010113          	addi	sp,sp,-32
80003d34:	00912a23          	sw	s1,20(sp)
80003d38:	00112e23          	sw	ra,28(sp)
80003d3c:	00812c23          	sw	s0,24(sp)
80003d40:	01212823          	sw	s2,16(sp)
80003d44:	01312623          	sw	s3,12(sp)
80003d48:	01412423          	sw	s4,8(sp)
80003d4c:	01512223          	sw	s5,4(sp)
80003d50:	fff00493          	li	s1,-1
80003d54:	06050063          	beqz	a0,80003db4 <config_save+0x84>
80003d58:	01e00593          	li	a1,30
80003d5c:	00050413          	mv	s0,a0
80003d60:	ffcff0ef          	jal	ra,8000355c <crc16>
80003d64:	00a41f23          	sh	a0,30(s0)
80003d68:	00000913          	li	s2,0
80003d6c:	00000993          	li	s3,0
80003d70:	00800a93          	li	s5,8
80003d74:	01240733          	add	a4,s0,s2
80003d78:	00400693          	li	a3,4
80003d7c:	0ff97613          	andi	a2,s2,255
80003d80:	05000593          	li	a1,80
80003d84:	f0090537          	lui	a0,0xf0090
80003d88:	0b8000ef          	jal	ra,80003e40 <eeprom_write_page>
80003d8c:	00400793          	li	a5,4
80003d90:	04f50663          	beq	a0,a5,80003ddc <config_save+0xac>
80003d94:	80002537          	lui	a0,0x80002
80003d98:	00090713          	mv	a4,s2
80003d9c:	00098693          	mv	a3,s3
80003da0:	00400613          	li	a2,4
80003da4:	05000593          	li	a1,80
80003da8:	43450513          	addi	a0,a0,1076 # 80002434 <_ram_heap_end+0xffff0434>
80003dac:	0690a0ef          	jal	ra,8000e614 <iprintf>
80003db0:	ffe00493          	li	s1,-2
80003db4:	01c12083          	lw	ra,28(sp)
80003db8:	01812403          	lw	s0,24(sp)
80003dbc:	00048513          	mv	a0,s1
80003dc0:	01012903          	lw	s2,16(sp)
80003dc4:	01412483          	lw	s1,20(sp)
80003dc8:	00c12983          	lw	s3,12(sp)
80003dcc:	00812a03          	lw	s4,8(sp)
80003dd0:	00412a83          	lw	s5,4(sp)
80003dd4:	02010113          	addi	sp,sp,32
80003dd8:	00008067          	ret
80003ddc:	00a00a13          	li	s4,10
80003de0:	05000593          	li	a1,80
80003de4:	f0090537          	lui	a0,0xf0090
80003de8:	228000ef          	jal	ra,80004010 <eeprom_poll>
80003dec:	00050493          	mv	s1,a0
80003df0:	02050663          	beqz	a0,80003e1c <config_save+0xec>
80003df4:	3e800513          	li	a0,1000
80003df8:	fffa0a13          	addi	s4,s4,-1
80003dfc:	5d1010ef          	jal	ra,80005bcc <delay_us>
80003e00:	fe0a10e3          	bnez	s4,80003de0 <config_save+0xb0>
80003e04:	80002537          	lui	a0,0x80002
80003e08:	05000593          	li	a1,80
80003e0c:	4b450513          	addi	a0,a0,1204 # 800024b4 <_ram_heap_end+0xffff04b4>
80003e10:	0050a0ef          	jal	ra,8000e614 <iprintf>
80003e14:	ffd00493          	li	s1,-3
80003e18:	f9dff06f          	j	80003db4 <config_save+0x84>
80003e1c:	00198993          	addi	s3,s3,1 # 90080001 <_ram_heap_end+0x1006e001>
80003e20:	00490913          	addi	s2,s2,4
80003e24:	f55998e3          	bne	s3,s5,80003d74 <config_save+0x44>
80003e28:	01e45603          	lhu	a2,30(s0)
80003e2c:	80002537          	lui	a0,0x80002
80003e30:	02000593          	li	a1,32
80003e34:	47c50513          	addi	a0,a0,1148 # 8000247c <_ram_heap_end+0xffff047c>
80003e38:	7dc0a0ef          	jal	ra,8000e614 <iprintf>
80003e3c:	f79ff06f          	j	80003db4 <config_save+0x84>

80003e40 <eeprom_write_page>:
80003e40:	fe010113          	addi	sp,sp,-32
80003e44:	00812c23          	sw	s0,24(sp)
80003e48:	00912a23          	sw	s1,20(sp)
80003e4c:	01212823          	sw	s2,16(sp)
80003e50:	01412423          	sw	s4,8(sp)
80003e54:	01512223          	sw	s5,4(sp)
80003e58:	00112e23          	sw	ra,28(sp)
80003e5c:	01312623          	sw	s3,12(sp)
80003e60:	01612023          	sw	s6,0(sp)
80003e64:	01500793          	li	a5,21
80003e68:	00159593          	slli	a1,a1,0x1
80003e6c:	00f52623          	sw	a5,12(a0)
80003e70:	00018937          	lui	s2,0x18
80003e74:	00b52023          	sw	a1,0(a0)
80003e78:	6a090593          	addi	a1,s2,1696 # 186a0 <_stack_size+0x17ea0>
80003e7c:	00050413          	mv	s0,a0
80003e80:	00060493          	mv	s1,a2
80003e84:	00068a13          	mv	s4,a3
80003e88:	00070a93          	mv	s5,a4
80003e8c:	48d010ef          	jal	ra,80005b18 <i2c_wait_for_busy>
80003e90:	04051663          	bnez	a0,80003edc <eeprom_write_page+0x9c>
80003e94:	00042623          	sw	zero,12(s0)
80003e98:	00100613          	li	a2,1
80003e9c:	80002537          	lui	a0,0x80002
80003ea0:	00040593          	mv	a1,s0
80003ea4:	4e450513          	addi	a0,a0,1252 # 800024e4 <_ram_heap_end+0xffff04e4>
80003ea8:	76c0a0ef          	jal	ra,8000e614 <iprintf>
80003eac:	fff00493          	li	s1,-1
80003eb0:	01c12083          	lw	ra,28(sp)
80003eb4:	01812403          	lw	s0,24(sp)
80003eb8:	00048513          	mv	a0,s1
80003ebc:	01012903          	lw	s2,16(sp)
80003ec0:	01412483          	lw	s1,20(sp)
80003ec4:	00c12983          	lw	s3,12(sp)
80003ec8:	00812a03          	lw	s4,8(sp)
80003ecc:	00412a83          	lw	s5,4(sp)
80003ed0:	00012b03          	lw	s6,0(sp)
80003ed4:	02010113          	addi	sp,sp,32
80003ed8:	00008067          	ret
80003edc:	6a090593          	addi	a1,s2,1696
80003ee0:	00040513          	mv	a0,s0
80003ee4:	461010ef          	jal	ra,80005b44 <i2c_wait_for_release>
80003ee8:	00051863          	bnez	a0,80003ef8 <eeprom_write_page+0xb8>
80003eec:	00042623          	sw	zero,12(s0)
80003ef0:	00200613          	li	a2,2
80003ef4:	fa9ff06f          	j	80003e9c <eeprom_write_page+0x5c>
80003ef8:	00c42783          	lw	a5,12(s0)
80003efc:	0407f793          	andi	a5,a5,64
80003f00:	00078e63          	beqz	a5,80003f1c <eeprom_write_page+0xdc>
80003f04:	00042623          	sw	zero,12(s0)
80003f08:	00100613          	li	a2,1
80003f0c:	80002537          	lui	a0,0x80002
80003f10:	00040593          	mv	a1,s0
80003f14:	51450513          	addi	a0,a0,1300 # 80002514 <_ram_heap_end+0xffff0514>
80003f18:	f91ff06f          	j	80003ea8 <eeprom_write_page+0x68>
80003f1c:	00200513          	li	a0,2
80003f20:	4ad010ef          	jal	ra,80005bcc <delay_us>
80003f24:	01100793          	li	a5,17
80003f28:	00f42623          	sw	a5,12(s0)
80003f2c:	00942023          	sw	s1,0(s0)
80003f30:	6a090593          	addi	a1,s2,1696
80003f34:	00040513          	mv	a0,s0
80003f38:	3e1010ef          	jal	ra,80005b18 <i2c_wait_for_busy>
80003f3c:	00051863          	bnez	a0,80003f4c <eeprom_write_page+0x10c>
80003f40:	00042623          	sw	zero,12(s0)
80003f44:	00300613          	li	a2,3
80003f48:	f55ff06f          	j	80003e9c <eeprom_write_page+0x5c>
80003f4c:	6a090593          	addi	a1,s2,1696
80003f50:	00040513          	mv	a0,s0
80003f54:	3f1010ef          	jal	ra,80005b44 <i2c_wait_for_release>
80003f58:	00051863          	bnez	a0,80003f68 <eeprom_write_page+0x128>
80003f5c:	00042623          	sw	zero,12(s0)
80003f60:	00400613          	li	a2,4
80003f64:	f39ff06f          	j	80003e9c <eeprom_write_page+0x5c>
80003f68:	00c42783          	lw	a5,12(s0)
80003f6c:	00000993          	li	s3,0
80003f70:	0407f793          	andi	a5,a5,64
80003f74:	04079a63          	bnez	a5,80003fc8 <eeprom_write_page+0x188>
80003f78:	000a0493          	mv	s1,s4
80003f7c:	fffa0b13          	addi	s6,s4,-1
80003f80:	6a090913          	addi	s2,s2,1696
80003f84:	f349d6e3          	bge	s3,s4,80003eb0 <eeprom_write_page+0x70>
80003f88:	00200513          	li	a0,2
80003f8c:	441010ef          	jal	ra,80005bcc <delay_us>
80003f90:	01100793          	li	a5,17
80003f94:	013b1463          	bne	s6,s3,80003f9c <eeprom_write_page+0x15c>
80003f98:	01900793          	li	a5,25
80003f9c:	013a8733          	add	a4,s5,s3
80003fa0:	00074703          	lbu	a4,0(a4)
80003fa4:	00f42623          	sw	a5,12(s0)
80003fa8:	00090593          	mv	a1,s2
80003fac:	00e42023          	sw	a4,0(s0)
80003fb0:	00040513          	mv	a0,s0
80003fb4:	365010ef          	jal	ra,80005b18 <i2c_wait_for_busy>
80003fb8:	00051e63          	bnez	a0,80003fd4 <eeprom_write_page+0x194>
80003fbc:	00042623          	sw	zero,12(s0)
80003fc0:	00500613          	li	a2,5
80003fc4:	ed9ff06f          	j	80003e9c <eeprom_write_page+0x5c>
80003fc8:	00042623          	sw	zero,12(s0)
80003fcc:	00200613          	li	a2,2
80003fd0:	f3dff06f          	j	80003f0c <eeprom_write_page+0xcc>
80003fd4:	00090593          	mv	a1,s2
80003fd8:	00040513          	mv	a0,s0
80003fdc:	369010ef          	jal	ra,80005b44 <i2c_wait_for_release>
80003fe0:	00051863          	bnez	a0,80003ff0 <eeprom_write_page+0x1b0>
80003fe4:	00042623          	sw	zero,12(s0)
80003fe8:	00600613          	li	a2,6
80003fec:	eb1ff06f          	j	80003e9c <eeprom_write_page+0x5c>
80003ff0:	00c42783          	lw	a5,12(s0)
80003ff4:	0407f793          	andi	a5,a5,64
80003ff8:	00078863          	beqz	a5,80004008 <eeprom_write_page+0x1c8>
80003ffc:	00042623          	sw	zero,12(s0)
80004000:	00300613          	li	a2,3
80004004:	f09ff06f          	j	80003f0c <eeprom_write_page+0xcc>
80004008:	00198993          	addi	s3,s3,1
8000400c:	f79ff06f          	j	80003f84 <eeprom_write_page+0x144>

80004010 <eeprom_poll>:
80004010:	ff010113          	addi	sp,sp,-16
80004014:	00812423          	sw	s0,8(sp)
80004018:	00912223          	sw	s1,4(sp)
8000401c:	00112623          	sw	ra,12(sp)
80004020:	01d00793          	li	a5,29
80004024:	00159593          	slli	a1,a1,0x1
80004028:	00f52623          	sw	a5,12(a0)
8000402c:	000184b7          	lui	s1,0x18
80004030:	00b52023          	sw	a1,0(a0)
80004034:	6a048593          	addi	a1,s1,1696 # 186a0 <_stack_size+0x17ea0>
80004038:	00050413          	mv	s0,a0
8000403c:	2dd010ef          	jal	ra,80005b18 <i2c_wait_for_busy>
80004040:	00100613          	li	a2,1
80004044:	00050c63          	beqz	a0,8000405c <eeprom_poll+0x4c>
80004048:	6a048593          	addi	a1,s1,1696
8000404c:	00040513          	mv	a0,s0
80004050:	2f5010ef          	jal	ra,80005b44 <i2c_wait_for_release>
80004054:	02051863          	bnez	a0,80004084 <eeprom_poll+0x74>
80004058:	00200613          	li	a2,2
8000405c:	80002537          	lui	a0,0x80002
80004060:	00040593          	mv	a1,s0
80004064:	54450513          	addi	a0,a0,1348 # 80002544 <_ram_heap_end+0xffff0544>
80004068:	5ac0a0ef          	jal	ra,8000e614 <iprintf>
8000406c:	fff00513          	li	a0,-1
80004070:	00c12083          	lw	ra,12(sp)
80004074:	00812403          	lw	s0,8(sp)
80004078:	00412483          	lw	s1,4(sp)
8000407c:	01010113          	addi	sp,sp,16
80004080:	00008067          	ret
80004084:	00c42503          	lw	a0,12(s0)
80004088:	00655513          	srli	a0,a0,0x6
8000408c:	00157513          	andi	a0,a0,1
80004090:	fe1ff06f          	j	80004070 <eeprom_poll+0x60>

80004094 <eeprom_read_page>:
80004094:	fd010113          	addi	sp,sp,-48
80004098:	02812423          	sw	s0,40(sp)
8000409c:	02912223          	sw	s1,36(sp)
800040a0:	03212023          	sw	s2,32(sp)
800040a4:	01312e23          	sw	s3,28(sp)
800040a8:	01412c23          	sw	s4,24(sp)
800040ac:	01512a23          	sw	s5,20(sp)
800040b0:	01612823          	sw	s6,16(sp)
800040b4:	02112623          	sw	ra,44(sp)
800040b8:	01712623          	sw	s7,12(sp)
800040bc:	01500993          	li	s3,21
800040c0:	00159493          	slli	s1,a1,0x1
800040c4:	01352623          	sw	s3,12(a0)
800040c8:	00018937          	lui	s2,0x18
800040cc:	00952023          	sw	s1,0(a0)
800040d0:	6a090593          	addi	a1,s2,1696 # 186a0 <_stack_size+0x17ea0>
800040d4:	00050413          	mv	s0,a0
800040d8:	00060b13          	mv	s6,a2
800040dc:	00068a13          	mv	s4,a3
800040e0:	00070a93          	mv	s5,a4
800040e4:	235010ef          	jal	ra,80005b18 <i2c_wait_for_busy>
800040e8:	00051e63          	bnez	a0,80004104 <eeprom_read_page+0x70>
800040ec:	00042623          	sw	zero,12(s0)
800040f0:	00100613          	li	a2,1
800040f4:	80002537          	lui	a0,0x80002
800040f8:	00040593          	mv	a1,s0
800040fc:	56c50513          	addi	a0,a0,1388 # 8000256c <_ram_heap_end+0xffff056c>
80004100:	0400006f          	j	80004140 <eeprom_read_page+0xac>
80004104:	6a090593          	addi	a1,s2,1696
80004108:	00040513          	mv	a0,s0
8000410c:	239010ef          	jal	ra,80005b44 <i2c_wait_for_release>
80004110:	00051863          	bnez	a0,80004120 <eeprom_read_page+0x8c>
80004114:	00042623          	sw	zero,12(s0)
80004118:	00200613          	li	a2,2
8000411c:	fd9ff06f          	j	800040f4 <eeprom_read_page+0x60>
80004120:	00c42783          	lw	a5,12(s0)
80004124:	0407f793          	andi	a5,a5,64
80004128:	04078863          	beqz	a5,80004178 <eeprom_read_page+0xe4>
8000412c:	00042623          	sw	zero,12(s0)
80004130:	00100613          	li	a2,1
80004134:	80002537          	lui	a0,0x80002
80004138:	00040593          	mv	a1,s0
8000413c:	59c50513          	addi	a0,a0,1436 # 8000259c <_ram_heap_end+0xffff059c>
80004140:	4d40a0ef          	jal	ra,8000e614 <iprintf>
80004144:	fff00493          	li	s1,-1
80004148:	02c12083          	lw	ra,44(sp)
8000414c:	02812403          	lw	s0,40(sp)
80004150:	00048513          	mv	a0,s1
80004154:	02012903          	lw	s2,32(sp)
80004158:	02412483          	lw	s1,36(sp)
8000415c:	01c12983          	lw	s3,28(sp)
80004160:	01812a03          	lw	s4,24(sp)
80004164:	01412a83          	lw	s5,20(sp)
80004168:	01012b03          	lw	s6,16(sp)
8000416c:	00c12b83          	lw	s7,12(sp)
80004170:	03010113          	addi	sp,sp,48
80004174:	00008067          	ret
80004178:	00200513          	li	a0,2
8000417c:	251010ef          	jal	ra,80005bcc <delay_us>
80004180:	01900793          	li	a5,25
80004184:	00f42623          	sw	a5,12(s0)
80004188:	01642023          	sw	s6,0(s0)
8000418c:	6a090593          	addi	a1,s2,1696
80004190:	00040513          	mv	a0,s0
80004194:	185010ef          	jal	ra,80005b18 <i2c_wait_for_busy>
80004198:	00051863          	bnez	a0,800041a8 <eeprom_read_page+0x114>
8000419c:	00042623          	sw	zero,12(s0)
800041a0:	00300613          	li	a2,3
800041a4:	f51ff06f          	j	800040f4 <eeprom_read_page+0x60>
800041a8:	6a090593          	addi	a1,s2,1696
800041ac:	00040513          	mv	a0,s0
800041b0:	195010ef          	jal	ra,80005b44 <i2c_wait_for_release>
800041b4:	00051863          	bnez	a0,800041c4 <eeprom_read_page+0x130>
800041b8:	00042623          	sw	zero,12(s0)
800041bc:	00400613          	li	a2,4
800041c0:	f35ff06f          	j	800040f4 <eeprom_read_page+0x60>
800041c4:	00c42783          	lw	a5,12(s0)
800041c8:	0407f793          	andi	a5,a5,64
800041cc:	00078863          	beqz	a5,800041dc <eeprom_read_page+0x148>
800041d0:	00042623          	sw	zero,12(s0)
800041d4:	00200613          	li	a2,2
800041d8:	f5dff06f          	j	80004134 <eeprom_read_page+0xa0>
800041dc:	00200513          	li	a0,2
800041e0:	1ed010ef          	jal	ra,80005bcc <delay_us>
800041e4:	0014e493          	ori	s1,s1,1
800041e8:	01342623          	sw	s3,12(s0)
800041ec:	00942023          	sw	s1,0(s0)
800041f0:	6a090593          	addi	a1,s2,1696
800041f4:	00040513          	mv	a0,s0
800041f8:	121010ef          	jal	ra,80005b18 <i2c_wait_for_busy>
800041fc:	00051863          	bnez	a0,8000420c <eeprom_read_page+0x178>
80004200:	00042623          	sw	zero,12(s0)
80004204:	00500613          	li	a2,5
80004208:	eedff06f          	j	800040f4 <eeprom_read_page+0x60>
8000420c:	6a090593          	addi	a1,s2,1696
80004210:	00040513          	mv	a0,s0
80004214:	131010ef          	jal	ra,80005b44 <i2c_wait_for_release>
80004218:	00051863          	bnez	a0,80004228 <eeprom_read_page+0x194>
8000421c:	00042623          	sw	zero,12(s0)
80004220:	00600613          	li	a2,6
80004224:	ed1ff06f          	j	800040f4 <eeprom_read_page+0x60>
80004228:	00c42783          	lw	a5,12(s0)
8000422c:	00000993          	li	s3,0
80004230:	0407f793          	andi	a5,a5,64
80004234:	04079863          	bnez	a5,80004284 <eeprom_read_page+0x1f0>
80004238:	000a0493          	mv	s1,s4
8000423c:	fffa0b13          	addi	s6,s4,-1
80004240:	0ff00b93          	li	s7,255
80004244:	6a090913          	addi	s2,s2,1696
80004248:	f149d0e3          	bge	s3,s4,80004148 <eeprom_read_page+0xb4>
8000424c:	00200513          	li	a0,2
80004250:	17d010ef          	jal	ra,80005bcc <delay_us>
80004254:	02100793          	li	a5,33
80004258:	013b1463          	bne	s6,s3,80004260 <eeprom_read_page+0x1cc>
8000425c:	00900793          	li	a5,9
80004260:	00f42623          	sw	a5,12(s0)
80004264:	01742023          	sw	s7,0(s0)
80004268:	00090593          	mv	a1,s2
8000426c:	00040513          	mv	a0,s0
80004270:	0a9010ef          	jal	ra,80005b18 <i2c_wait_for_busy>
80004274:	00051e63          	bnez	a0,80004290 <eeprom_read_page+0x1fc>
80004278:	00042623          	sw	zero,12(s0)
8000427c:	00700613          	li	a2,7
80004280:	e75ff06f          	j	800040f4 <eeprom_read_page+0x60>
80004284:	00042623          	sw	zero,12(s0)
80004288:	00300613          	li	a2,3
8000428c:	ea9ff06f          	j	80004134 <eeprom_read_page+0xa0>
80004290:	00090593          	mv	a1,s2
80004294:	00040513          	mv	a0,s0
80004298:	0ad010ef          	jal	ra,80005b44 <i2c_wait_for_release>
8000429c:	00051863          	bnez	a0,800042ac <eeprom_read_page+0x218>
800042a0:	00042623          	sw	zero,12(s0)
800042a4:	00800613          	li	a2,8
800042a8:	e4dff06f          	j	800040f4 <eeprom_read_page+0x60>
800042ac:	00442703          	lw	a4,4(s0)
800042b0:	013a87b3          	add	a5,s5,s3
800042b4:	00198993          	addi	s3,s3,1
800042b8:	00e78023          	sb	a4,0(a5)
800042bc:	f8dff06f          	j	80004248 <eeprom_read_page+0x1b4>

800042c0 <eeprom_probe>:
800042c0:	fe010113          	addi	sp,sp,-32
800042c4:	00912a23          	sw	s1,20(sp)
800042c8:	00050493          	mv	s1,a0
800042cc:	80002537          	lui	a0,0x80002
800042d0:	05000593          	li	a1,80
800042d4:	5c850513          	addi	a0,a0,1480 # 800025c8 <_ram_heap_end+0xffff05c8>
800042d8:	00112e23          	sw	ra,28(sp)
800042dc:	01212823          	sw	s2,16(sp)
800042e0:	00812c23          	sw	s0,24(sp)
800042e4:	3300a0ef          	jal	ra,8000e614 <iprintf>
800042e8:	deadc7b7          	lui	a5,0xdeadc
800042ec:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac9eef>
800042f0:	00c10713          	addi	a4,sp,12
800042f4:	00400693          	li	a3,4
800042f8:	07c00613          	li	a2,124
800042fc:	05000593          	li	a1,80
80004300:	00048513          	mv	a0,s1
80004304:	00f12623          	sw	a5,12(sp)
80004308:	b39ff0ef          	jal	ra,80003e40 <eeprom_write_page>
8000430c:	00400793          	li	a5,4
80004310:	00a00913          	li	s2,10
80004314:	00f50c63          	beq	a0,a5,8000432c <eeprom_probe+0x6c>
80004318:	80002537          	lui	a0,0x80002
8000431c:	05000593          	li	a1,80
80004320:	5e450513          	addi	a0,a0,1508 # 800025e4 <_ram_heap_end+0xffff05e4>
80004324:	2f00a0ef          	jal	ra,8000e614 <iprintf>
80004328:	0580006f          	j	80004380 <eeprom_probe+0xc0>
8000432c:	05000593          	li	a1,80
80004330:	00048513          	mv	a0,s1
80004334:	cddff0ef          	jal	ra,80004010 <eeprom_poll>
80004338:	00050413          	mv	s0,a0
8000433c:	06050a63          	beqz	a0,800043b0 <eeprom_probe+0xf0>
80004340:	3e800513          	li	a0,1000
80004344:	fff90913          	addi	s2,s2,-1
80004348:	085010ef          	jal	ra,80005bcc <delay_us>
8000434c:	fe0910e3          	bnez	s2,8000432c <eeprom_probe+0x6c>
80004350:	80002537          	lui	a0,0x80002
80004354:	05000593          	li	a1,80
80004358:	68850513          	addi	a0,a0,1672 # 80002688 <_ram_heap_end+0xffff0688>
8000435c:	fc9ff06f          	j	80004324 <eeprom_probe+0x64>
80004360:	00c12603          	lw	a2,12(sp)
80004364:	deadc7b7          	lui	a5,0xdeadc
80004368:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac9eef>
8000436c:	05000593          	li	a1,80
80004370:	00f60c63          	beq	a2,a5,80004388 <eeprom_probe+0xc8>
80004374:	80002537          	lui	a0,0x80002
80004378:	63c50513          	addi	a0,a0,1596 # 8000263c <_ram_heap_end+0xffff063c>
8000437c:	2980a0ef          	jal	ra,8000e614 <iprintf>
80004380:	fff00413          	li	s0,-1
80004384:	0100006f          	j	80004394 <eeprom_probe+0xd4>
80004388:	80002537          	lui	a0,0x80002
8000438c:	67050513          	addi	a0,a0,1648 # 80002670 <_ram_heap_end+0xffff0670>
80004390:	2840a0ef          	jal	ra,8000e614 <iprintf>
80004394:	00040513          	mv	a0,s0
80004398:	01c12083          	lw	ra,28(sp)
8000439c:	01812403          	lw	s0,24(sp)
800043a0:	01412483          	lw	s1,20(sp)
800043a4:	01012903          	lw	s2,16(sp)
800043a8:	02010113          	addi	sp,sp,32
800043ac:	00008067          	ret
800043b0:	00c10713          	addi	a4,sp,12
800043b4:	00400693          	li	a3,4
800043b8:	07c00613          	li	a2,124
800043bc:	05000593          	li	a1,80
800043c0:	00048513          	mv	a0,s1
800043c4:	00012623          	sw	zero,12(sp)
800043c8:	ccdff0ef          	jal	ra,80004094 <eeprom_read_page>
800043cc:	00400793          	li	a5,4
800043d0:	f8f508e3          	beq	a0,a5,80004360 <eeprom_probe+0xa0>
800043d4:	80002537          	lui	a0,0x80002
800043d8:	05000593          	li	a1,80
800043dc:	61050513          	addi	a0,a0,1552 # 80002610 <_ram_heap_end+0xffff0610>
800043e0:	f45ff06f          	j	80004324 <eeprom_probe+0x64>

800043e4 <modbus_error>:
800043e4:	ff010113          	addi	sp,sp,-16
800043e8:	00812423          	sw	s0,8(sp)
800043ec:	00912223          	sw	s1,4(sp)
800043f0:	01212023          	sw	s2,0(sp)
800043f4:	00060413          	mv	s0,a2
800043f8:	00058913          	mv	s2,a1
800043fc:	00058613          	mv	a2,a1
80004400:	00050493          	mv	s1,a0
80004404:	00050593          	mv	a1,a0
80004408:	80002537          	lui	a0,0x80002
8000440c:	6fc50513          	addi	a0,a0,1788 # 800026fc <_ram_heap_end+0xffff06fc>
80004410:	00112623          	sw	ra,12(sp)
80004414:	2000a0ef          	jal	ra,8000e614 <iprintf>
80004418:	9a81c783          	lbu	a5,-1624(gp) # 80003250 <active_config+0x14>
8000441c:	f804e493          	ori	s1,s1,-128
80004420:	009400a3          	sb	s1,1(s0)
80004424:	01240123          	sb	s2,2(s0)
80004428:	00040513          	mv	a0,s0
8000442c:	00f40023          	sb	a5,0(s0)
80004430:	00300593          	li	a1,3
80004434:	980ff0ef          	jal	ra,800035b4 <add_crc>
80004438:	00c12083          	lw	ra,12(sp)
8000443c:	00812403          	lw	s0,8(sp)
80004440:	00412483          	lw	s1,4(sp)
80004444:	00012903          	lw	s2,0(sp)
80004448:	00500513          	li	a0,5
8000444c:	01010113          	addi	sp,sp,16
80004450:	00008067          	ret

80004454 <modbus_store_reg>:
80004454:	fd850793          	addi	a5,a0,-40
80004458:	fd010113          	addi	sp,sp,-48
8000445c:	01079793          	slli	a5,a5,0x10
80004460:	02912223          	sw	s1,36(sp)
80004464:	02112623          	sw	ra,44(sp)
80004468:	02812423          	sw	s0,40(sp)
8000446c:	0107d793          	srli	a5,a5,0x10
80004470:	00900713          	li	a4,9
80004474:	00058493          	mv	s1,a1
80004478:	02f76063          	bltu	a4,a5,80004498 <modbus_store_reg+0x44>
8000447c:	8801a783          	lw	a5,-1920(gp) # 80003128 <reg_config_write>
80004480:	00079c63          	bnez	a5,80004498 <modbus_store_reg+0x44>
80004484:	80002537          	lui	a0,0x80002
80004488:	72050513          	addi	a0,a0,1824 # 80002720 <_ram_heap_end+0xffff0720>
8000448c:	1880a0ef          	jal	ra,8000e614 <iprintf>
80004490:	ffe00413          	li	s0,-2
80004494:	0300006f          	j	800044c4 <modbus_store_reg+0x70>
80004498:	02f00793          	li	a5,47
8000449c:	34f50e63          	beq	a0,a5,800047f8 <modbus_store_reg+0x3a4>
800044a0:	0aa7e063          	bltu	a5,a0,80004540 <modbus_store_reg+0xec>
800044a4:	02a00793          	li	a5,42
800044a8:	2ef50863          	beq	a0,a5,80004798 <modbus_store_reg+0x344>
800044ac:	02a7e863          	bltu	a5,a0,800044dc <modbus_store_reg+0x88>
800044b0:	02000793          	li	a5,32
800044b4:	18f50c63          	beq	a0,a5,8000464c <modbus_store_reg+0x1f8>
800044b8:	02900793          	li	a5,41
800044bc:	2af50463          	beq	a0,a5,80004764 <modbus_store_reg+0x310>
800044c0:	fff00413          	li	s0,-1
800044c4:	00040513          	mv	a0,s0
800044c8:	02c12083          	lw	ra,44(sp)
800044cc:	02812403          	lw	s0,40(sp)
800044d0:	02412483          	lw	s1,36(sp)
800044d4:	03010113          	addi	sp,sp,48
800044d8:	00008067          	ret
800044dc:	02c00793          	li	a5,44
800044e0:	20f50e63          	beq	a0,a5,800046fc <modbus_store_reg+0x2a8>
800044e4:	2ef56263          	bltu	a0,a5,800047c8 <modbus_store_reg+0x374>
800044e8:	02d00793          	li	a5,45
800044ec:	fcf51ae3          	bne	a0,a5,800044c0 <modbus_store_reg+0x6c>
800044f0:	00010513          	mv	a0,sp
800044f4:	f64ff0ef          	jal	ra,80003c58 <config_load>
800044f8:	00055c63          	bgez	a0,80004510 <modbus_store_reg+0xbc>
800044fc:	800035b7          	lui	a1,0x80003
80004500:	02000613          	li	a2,32
80004504:	01858593          	addi	a1,a1,24 # 80003018 <_ram_heap_end+0xffff1018>
80004508:	00010513          	mv	a0,sp
8000450c:	4c9090ef          	jal	ra,8000e1d4 <memcpy>
80004510:	0004c783          	lbu	a5,0(s1)
80004514:	0014c703          	lbu	a4,1(s1)
80004518:	01879793          	slli	a5,a5,0x18
8000451c:	01071713          	slli	a4,a4,0x10
80004520:	00e7e7b3          	or	a5,a5,a4
80004524:	0034c703          	lbu	a4,3(s1)
80004528:	00e7e7b3          	or	a5,a5,a4
8000452c:	0024c703          	lbu	a4,2(s1)
80004530:	00871713          	slli	a4,a4,0x8
80004534:	00e7e7b3          	or	a5,a5,a4
80004538:	00f12c23          	sw	a5,24(sp)
8000453c:	1e80006f          	j	80004724 <modbus_store_reg+0x2d0>
80004540:	03300793          	li	a5,51
80004544:	0cf50e63          	beq	a0,a5,80004620 <modbus_store_reg+0x1cc>
80004548:	0aa7e863          	bltu	a5,a0,800045f8 <modbus_store_reg+0x1a4>
8000454c:	03100793          	li	a5,49
80004550:	1ef50463          	beq	a0,a5,80004738 <modbus_store_reg+0x2e4>
80004554:	16a7f063          	bgeu	a5,a0,800046b4 <modbus_store_reg+0x260>
80004558:	0014c783          	lbu	a5,1(s1)
8000455c:	0004c503          	lbu	a0,0(s1)
80004560:	0024c583          	lbu	a1,2(s1)
80004564:	00879793          	slli	a5,a5,0x8
80004568:	00a7e7b3          	or	a5,a5,a0
8000456c:	00879513          	slli	a0,a5,0x8
80004570:	0087d793          	srli	a5,a5,0x8
80004574:	00f567b3          	or	a5,a0,a5
80004578:	01079513          	slli	a0,a5,0x10
8000457c:	0034c783          	lbu	a5,3(s1)
80004580:	0044c703          	lbu	a4,4(s1)
80004584:	01055513          	srli	a0,a0,0x10
80004588:	00879793          	slli	a5,a5,0x8
8000458c:	00b7e7b3          	or	a5,a5,a1
80004590:	00879593          	slli	a1,a5,0x8
80004594:	0087d793          	srli	a5,a5,0x8
80004598:	00f5e7b3          	or	a5,a1,a5
8000459c:	01079593          	slli	a1,a5,0x10
800045a0:	0054c783          	lbu	a5,5(s1)
800045a4:	0105d593          	srli	a1,a1,0x10
800045a8:	ffd00413          	li	s0,-3
800045ac:	00879793          	slli	a5,a5,0x8
800045b0:	00e7e7b3          	or	a5,a5,a4
800045b4:	00879713          	slli	a4,a5,0x8
800045b8:	0087d793          	srli	a5,a5,0x8
800045bc:	00f767b3          	or	a5,a4,a5
800045c0:	01079793          	slli	a5,a5,0x10
800045c4:	0107d793          	srli	a5,a5,0x10
800045c8:	ffa60713          	addi	a4,a2,-6
800045cc:	ee060ce3          	beqz	a2,800044c4 <modbus_store_reg+0x70>
800045d0:	800036b7          	lui	a3,0x80003
800045d4:	0a86a603          	lw	a2,168(a3) # 800030a8 <_ram_heap_end+0xffff10a8>
800045d8:	00648693          	addi	a3,s1,6
800045dc:	04079e63          	bnez	a5,80004638 <modbus_store_reg+0x1e4>
800045e0:	800007b7          	lui	a5,0x80000
800045e4:	00800893          	li	a7,8
800045e8:	00600813          	li	a6,6
800045ec:	13478793          	addi	a5,a5,308 # 80000134 <_ram_heap_end+0xfffee134>
800045f0:	168010ef          	jal	ra,80005758 <hub_print>
800045f4:	03c0006f          	j	80004630 <modbus_store_reg+0x1dc>
800045f8:	07e00793          	li	a5,126
800045fc:	08f50063          	beq	a0,a5,8000467c <modbus_store_reg+0x228>
80004600:	07f00793          	li	a5,127
80004604:	0af50463          	beq	a0,a5,800046ac <modbus_store_reg+0x258>
80004608:	03400793          	li	a5,52
8000460c:	eaf51ae3          	bne	a0,a5,800044c0 <modbus_store_reg+0x6c>
80004610:	0034c703          	lbu	a4,3(s1)
80004614:	800037b7          	lui	a5,0x80003
80004618:	0ae7a423          	sw	a4,168(a5) # 800030a8 <_ram_heap_end+0xffff10a8>
8000461c:	0140006f          	j	80004630 <modbus_store_reg+0x1dc>
80004620:	8b81a603          	lw	a2,-1864(gp) # 80003160 <hub_frame_size>
80004624:	00000593          	li	a1,0
80004628:	f0050537          	lui	a0,0xf0050
8000462c:	61c080ef          	jal	ra,8000cc48 <memset>
80004630:	00000413          	li	s0,0
80004634:	e91ff06f          	j	800044c4 <modbus_store_reg+0x70>
80004638:	800007b7          	lui	a5,0x80000
8000463c:	01000893          	li	a7,16
80004640:	00c00813          	li	a6,12
80004644:	73478793          	addi	a5,a5,1844 # 80000734 <_ram_heap_end+0xfffee734>
80004648:	fa9ff06f          	j	800045f0 <modbus_store_reg+0x19c>
8000464c:	0004c783          	lbu	a5,0(s1)
80004650:	0014c703          	lbu	a4,1(s1)
80004654:	01879793          	slli	a5,a5,0x18
80004658:	01071713          	slli	a4,a4,0x10
8000465c:	00e7e7b3          	or	a5,a5,a4
80004660:	0034c703          	lbu	a4,3(s1)
80004664:	00e7e7b3          	or	a5,a5,a4
80004668:	0024c703          	lbu	a4,2(s1)
8000466c:	00871713          	slli	a4,a4,0x8
80004670:	00e7e7b3          	or	a5,a5,a4
80004674:	88f1a223          	sw	a5,-1916(gp) # 8000312c <reg_scratch>
80004678:	fb9ff06f          	j	80004630 <modbus_store_reg+0x1dc>
8000467c:	0004c783          	lbu	a5,0(s1)
80004680:	0014c703          	lbu	a4,1(s1)
80004684:	01879793          	slli	a5,a5,0x18
80004688:	01071713          	slli	a4,a4,0x10
8000468c:	00e7e7b3          	or	a5,a5,a4
80004690:	0034c703          	lbu	a4,3(s1)
80004694:	00e7e7b3          	or	a5,a5,a4
80004698:	0024c703          	lbu	a4,2(s1)
8000469c:	00871713          	slli	a4,a4,0x8
800046a0:	00e7e7b3          	or	a5,a5,a4
800046a4:	88f1a023          	sw	a5,-1920(gp) # 80003128 <reg_config_write>
800046a8:	f89ff06f          	j	80004630 <modbus_store_reg+0x1dc>
800046ac:	694010ef          	jal	ra,80005d40 <hard_reboot>
800046b0:	f81ff06f          	j	80004630 <modbus_store_reg+0x1dc>
800046b4:	0034c503          	lbu	a0,3(s1)
800046b8:	475000ef          	jal	ra,8000532c <hub_init>
800046bc:	00050413          	mv	s0,a0
800046c0:	dc0518e3          	bnez	a0,80004490 <modbus_store_reg+0x3c>
800046c4:	00010513          	mv	a0,sp
800046c8:	d90ff0ef          	jal	ra,80003c58 <config_load>
800046cc:	00055c63          	bgez	a0,800046e4 <modbus_store_reg+0x290>
800046d0:	800035b7          	lui	a1,0x80003
800046d4:	02000613          	li	a2,32
800046d8:	01858593          	addi	a1,a1,24 # 80003018 <_ram_heap_end+0xffff1018>
800046dc:	00010513          	mv	a0,sp
800046e0:	2f5090ef          	jal	ra,8000e1d4 <memcpy>
800046e4:	0034c783          	lbu	a5,3(s1)
800046e8:	00010513          	mv	a0,sp
800046ec:	00f109a3          	sb	a5,19(sp)
800046f0:	e40ff0ef          	jal	ra,80003d30 <config_save>
800046f4:	dc0558e3          	bgez	a0,800044c4 <modbus_store_reg+0x70>
800046f8:	d99ff06f          	j	80004490 <modbus_store_reg+0x3c>
800046fc:	00010513          	mv	a0,sp
80004700:	d58ff0ef          	jal	ra,80003c58 <config_load>
80004704:	00055c63          	bgez	a0,8000471c <modbus_store_reg+0x2c8>
80004708:	800035b7          	lui	a1,0x80003
8000470c:	02000613          	li	a2,32
80004710:	01858593          	addi	a1,a1,24 # 80003018 <_ram_heap_end+0xffff1018>
80004714:	00010513          	mv	a0,sp
80004718:	2bd090ef          	jal	ra,8000e1d4 <memcpy>
8000471c:	0034c783          	lbu	a5,3(s1)
80004720:	00f10a23          	sb	a5,20(sp)
80004724:	00010513          	mv	a0,sp
80004728:	e08ff0ef          	jal	ra,80003d30 <config_save>
8000472c:	41f55513          	srai	a0,a0,0x1f
80004730:	ffe57413          	andi	s0,a0,-2
80004734:	d91ff06f          	j	800044c4 <modbus_store_reg+0x70>
80004738:	00010513          	mv	a0,sp
8000473c:	d1cff0ef          	jal	ra,80003c58 <config_load>
80004740:	00055c63          	bgez	a0,80004758 <modbus_store_reg+0x304>
80004744:	800035b7          	lui	a1,0x80003
80004748:	02000613          	li	a2,32
8000474c:	01858593          	addi	a1,a1,24 # 80003018 <_ram_heap_end+0xffff1018>
80004750:	00010513          	mv	a0,sp
80004754:	281090ef          	jal	ra,8000e1d4 <memcpy>
80004758:	0034c783          	lbu	a5,3(s1)
8000475c:	00f10623          	sb	a5,12(sp)
80004760:	fc5ff06f          	j	80004724 <modbus_store_reg+0x2d0>
80004764:	00010513          	mv	a0,sp
80004768:	cf0ff0ef          	jal	ra,80003c58 <config_load>
8000476c:	00055c63          	bgez	a0,80004784 <modbus_store_reg+0x330>
80004770:	800035b7          	lui	a1,0x80003
80004774:	02000613          	li	a2,32
80004778:	01858593          	addi	a1,a1,24 # 80003018 <_ram_heap_end+0xffff1018>
8000477c:	00010513          	mv	a0,sp
80004780:	255090ef          	jal	ra,8000e1d4 <memcpy>
80004784:	00400613          	li	a2,4
80004788:	00348593          	addi	a1,s1,3
8000478c:	00010513          	mv	a0,sp
80004790:	5e4010ef          	jal	ra,80005d74 <memcpy_rev>
80004794:	f91ff06f          	j	80004724 <modbus_store_reg+0x2d0>
80004798:	00010513          	mv	a0,sp
8000479c:	cbcff0ef          	jal	ra,80003c58 <config_load>
800047a0:	00055c63          	bgez	a0,800047b8 <modbus_store_reg+0x364>
800047a4:	800035b7          	lui	a1,0x80003
800047a8:	02000613          	li	a2,32
800047ac:	01858593          	addi	a1,a1,24 # 80003018 <_ram_heap_end+0xffff1018>
800047b0:	00010513          	mv	a0,sp
800047b4:	221090ef          	jal	ra,8000e1d4 <memcpy>
800047b8:	00400613          	li	a2,4
800047bc:	00348593          	addi	a1,s1,3
800047c0:	00410513          	addi	a0,sp,4
800047c4:	fcdff06f          	j	80004790 <modbus_store_reg+0x33c>
800047c8:	00010513          	mv	a0,sp
800047cc:	c8cff0ef          	jal	ra,80003c58 <config_load>
800047d0:	00055c63          	bgez	a0,800047e8 <modbus_store_reg+0x394>
800047d4:	800035b7          	lui	a1,0x80003
800047d8:	02000613          	li	a2,32
800047dc:	01858593          	addi	a1,a1,24 # 80003018 <_ram_heap_end+0xffff1018>
800047e0:	00010513          	mv	a0,sp
800047e4:	1f1090ef          	jal	ra,8000e1d4 <memcpy>
800047e8:	00400613          	li	a2,4
800047ec:	00348593          	addi	a1,s1,3
800047f0:	00810513          	addi	a0,sp,8
800047f4:	f9dff06f          	j	80004790 <modbus_store_reg+0x33c>
800047f8:	00010513          	mv	a0,sp
800047fc:	c5cff0ef          	jal	ra,80003c58 <config_load>
80004800:	00055c63          	bgez	a0,80004818 <modbus_store_reg+0x3c4>
80004804:	800035b7          	lui	a1,0x80003
80004808:	02000613          	li	a2,32
8000480c:	01858593          	addi	a1,a1,24 # 80003018 <_ram_heap_end+0xffff1018>
80004810:	00010513          	mv	a0,sp
80004814:	1c1090ef          	jal	ra,8000e1d4 <memcpy>
80004818:	00600613          	li	a2,6
8000481c:	00048593          	mv	a1,s1
80004820:	00d10513          	addi	a0,sp,13
80004824:	1b1090ef          	jal	ra,8000e1d4 <memcpy>
80004828:	efdff06f          	j	80004724 <modbus_store_reg+0x2d0>

8000482c <modbus_recv>:
8000482c:	fb010113          	addi	sp,sp,-80
80004830:	04812423          	sw	s0,72(sp)
80004834:	04112623          	sw	ra,76(sp)
80004838:	04912223          	sw	s1,68(sp)
8000483c:	05212023          	sw	s2,64(sp)
80004840:	03312e23          	sw	s3,60(sp)
80004844:	03412c23          	sw	s4,56(sp)
80004848:	03512a23          	sw	s5,52(sp)
8000484c:	03612823          	sw	s6,48(sp)
80004850:	03712623          	sw	s7,44(sp)
80004854:	03812423          	sw	s8,40(sp)
80004858:	fff00413          	li	s0,-1
8000485c:	12050063          	beqz	a0,8000497c <modbus_recv+0x150>
80004860:	10060e63          	beqz	a2,8000497c <modbus_recv+0x150>
80004864:	00400793          	li	a5,4
80004868:	10b7da63          	bge	a5,a1,8000497c <modbus_recv+0x150>
8000486c:	00058a93          	mv	s5,a1
80004870:	ffe58593          	addi	a1,a1,-2
80004874:	01059593          	slli	a1,a1,0x10
80004878:	0105d593          	srli	a1,a1,0x10
8000487c:	00050a13          	mv	s4,a0
80004880:	00060493          	mv	s1,a2
80004884:	cd9fe0ef          	jal	ra,8000355c <crc16>
80004888:	015a07b3          	add	a5,s4,s5
8000488c:	fff7c603          	lbu	a2,-1(a5)
80004890:	ffe7c783          	lbu	a5,-2(a5)
80004894:	00050593          	mv	a1,a0
80004898:	00861613          	slli	a2,a2,0x8
8000489c:	00f66633          	or	a2,a2,a5
800048a0:	40c51e63          	bne	a0,a2,80004cbc <modbus_recv+0x490>
800048a4:	99418713          	addi	a4,gp,-1644 # 8000323c <active_config>
800048a8:	000a4583          	lbu	a1,0(s4)
800048ac:	01474603          	lbu	a2,20(a4)
800048b0:	001a4903          	lbu	s2,1(s4)
800048b4:	99418b13          	addi	s6,gp,-1644 # 8000323c <active_config>
800048b8:	00c58863          	beq	a1,a2,800048c8 <modbus_recv+0x9c>
800048bc:	3e059663          	bnez	a1,80004ca8 <modbus_recv+0x47c>
800048c0:	01100793          	li	a5,17
800048c4:	3ef91263          	bne	s2,a5,80004ca8 <modbus_recv+0x47c>
800048c8:	002a4403          	lbu	s0,2(s4)
800048cc:	003a4783          	lbu	a5,3(s4)
800048d0:	08000613          	li	a2,128
800048d4:	00841413          	slli	s0,s0,0x8
800048d8:	00f46433          	or	s0,s0,a5
800048dc:	00000593          	li	a1,0
800048e0:	00048513          	mv	a0,s1
800048e4:	01041413          	slli	s0,s0,0x10
800048e8:	004a4983          	lbu	s3,4(s4)
800048ec:	005a4c03          	lbu	s8,5(s4)
800048f0:	358080ef          	jal	ra,8000cc48 <memset>
800048f4:	014b4783          	lbu	a5,20(s6)
800048f8:	41045413          	srai	s0,s0,0x10
800048fc:	01041b93          	slli	s7,s0,0x10
80004900:	010bdb93          	srli	s7,s7,0x10
80004904:	80002537          	lui	a0,0x80002
80004908:	00f48023          	sb	a5,0(s1)
8000490c:	012480a3          	sb	s2,1(s1)
80004910:	000b8613          	mv	a2,s7
80004914:	00090593          	mv	a1,s2
80004918:	76050513          	addi	a0,a0,1888 # 80002760 <_ram_heap_end+0xffff0760>
8000491c:	4f9090ef          	jal	ra,8000e614 <iprintf>
80004920:	fff90793          	addi	a5,s2,-1
80004924:	0ff7f793          	andi	a5,a5,255
80004928:	01000713          	li	a4,16
8000492c:	36f76863          	bltu	a4,a5,80004c9c <modbus_recv+0x470>
80004930:	80002737          	lui	a4,0x80002
80004934:	00279793          	slli	a5,a5,0x2
80004938:	6b870713          	addi	a4,a4,1720 # 800026b8 <_ram_heap_end+0xffff06b8>
8000493c:	00e787b3          	add	a5,a5,a4
80004940:	0007a783          	lw	a5,0(a5)
80004944:	00078067          	jr	a5
80004948:	800026b7          	lui	a3,0x80002
8000494c:	800025b7          	lui	a1,0x80002
80004950:	78468693          	addi	a3,a3,1924 # 80002784 <_ram_heap_end+0xffff0784>
80004954:	01800613          	li	a2,24
80004958:	79058593          	addi	a1,a1,1936 # 80002790 <_ram_heap_end+0xffff0790>
8000495c:	00348513          	addi	a0,s1,3
80004960:	0a00a0ef          	jal	ra,8000ea00 <siprintf>
80004964:	02700793          	li	a5,39
80004968:	00f48123          	sb	a5,2(s1)
8000496c:	02a00593          	li	a1,42
80004970:	00048513          	mv	a0,s1
80004974:	c41fe0ef          	jal	ra,800035b4 <add_crc>
80004978:	02c00413          	li	s0,44
8000497c:	00040513          	mv	a0,s0
80004980:	04c12083          	lw	ra,76(sp)
80004984:	04812403          	lw	s0,72(sp)
80004988:	04412483          	lw	s1,68(sp)
8000498c:	04012903          	lw	s2,64(sp)
80004990:	03c12983          	lw	s3,60(sp)
80004994:	03812a03          	lw	s4,56(sp)
80004998:	03412a83          	lw	s5,52(sp)
8000499c:	03012b03          	lw	s6,48(sp)
800049a0:	02c12b83          	lw	s7,44(sp)
800049a4:	02812c03          	lw	s8,40(sp)
800049a8:	05010113          	addi	sp,sp,80
800049ac:	00008067          	ret
800049b0:	00899993          	slli	s3,s3,0x8
800049b4:	0189e9b3          	or	s3,s3,s8
800049b8:	01099993          	slli	s3,s3,0x10
800049bc:	4109d993          	srai	s3,s3,0x10
800049c0:	00100793          	li	a5,1
800049c4:	00048613          	mv	a2,s1
800049c8:	2cf99063          	bne	s3,a5,80004c88 <modbus_recv+0x45c>
800049cc:	02c00793          	li	a5,44
800049d0:	20f40c63          	beq	s0,a5,80004be8 <modbus_recv+0x3bc>
800049d4:	0887c063          	blt	a5,s0,80004a54 <modbus_recv+0x228>
800049d8:	02000793          	li	a5,32
800049dc:	14f40e63          	beq	s0,a5,80004b38 <modbus_recv+0x30c>
800049e0:	0287c663          	blt	a5,s0,80004a0c <modbus_recv+0x1e0>
800049e4:	01e00793          	li	a5,30
800049e8:	0ef40e63          	beq	s0,a5,80004ae4 <modbus_recv+0x2b8>
800049ec:	01f00793          	li	a5,31
800049f0:	12f40e63          	beq	s0,a5,80004b2c <modbus_recv+0x300>
800049f4:	00048613          	mv	a2,s1
800049f8:	00200593          	li	a1,2
800049fc:	00090513          	mv	a0,s2
80004a00:	9e5ff0ef          	jal	ra,800043e4 <modbus_error>
80004a04:	00050413          	mv	s0,a0
80004a08:	0f00006f          	j	80004af8 <modbus_recv+0x2cc>
80004a0c:	02a00793          	li	a5,42
80004a10:	14f40863          	beq	s0,a5,80004b60 <modbus_recv+0x334>
80004a14:	1687cc63          	blt	a5,s0,80004b8c <modbus_recv+0x360>
80004a18:	02900793          	li	a5,41
80004a1c:	fcf41ce3          	bne	s0,a5,800049f4 <modbus_recv+0x1c8>
80004a20:	00010513          	mv	a0,sp
80004a24:	a34ff0ef          	jal	ra,80003c58 <config_load>
80004a28:	00055c63          	bgez	a0,80004a40 <modbus_recv+0x214>
80004a2c:	800035b7          	lui	a1,0x80003
80004a30:	02000613          	li	a2,32
80004a34:	01858593          	addi	a1,a1,24 # 80003018 <_ram_heap_end+0xffff1018>
80004a38:	00010513          	mv	a0,sp
80004a3c:	798090ef          	jal	ra,8000e1d4 <memcpy>
80004a40:	00400613          	li	a2,4
80004a44:	00010593          	mv	a1,sp
80004a48:	00348513          	addi	a0,s1,3
80004a4c:	788090ef          	jal	ra,8000e1d4 <memcpy>
80004a50:	0a40006f          	j	80004af4 <modbus_recv+0x2c8>
80004a54:	03000793          	li	a5,48
80004a58:	16f40063          	beq	s0,a5,80004bb8 <modbus_recv+0x38c>
80004a5c:	0487c463          	blt	a5,s0,80004aa4 <modbus_recv+0x278>
80004a60:	02d00793          	li	a5,45
80004a64:	1af40663          	beq	s0,a5,80004c10 <modbus_recv+0x3e4>
80004a68:	02f00793          	li	a5,47
80004a6c:	f8f414e3          	bne	s0,a5,800049f4 <modbus_recv+0x1c8>
80004a70:	00010513          	mv	a0,sp
80004a74:	9e4ff0ef          	jal	ra,80003c58 <config_load>
80004a78:	00055c63          	bgez	a0,80004a90 <modbus_recv+0x264>
80004a7c:	800035b7          	lui	a1,0x80003
80004a80:	02000613          	li	a2,32
80004a84:	01858593          	addi	a1,a1,24 # 80003018 <_ram_heap_end+0xffff1018>
80004a88:	00010513          	mv	a0,sp
80004a8c:	748090ef          	jal	ra,8000e1d4 <memcpy>
80004a90:	00600613          	li	a2,6
80004a94:	00d10593          	addi	a1,sp,13
80004a98:	00348513          	addi	a0,s1,3
80004a9c:	738090ef          	jal	ra,8000e1d4 <memcpy>
80004aa0:	1400006f          	j	80004be0 <modbus_recv+0x3b4>
80004aa4:	03400793          	li	a5,52
80004aa8:	0af40463          	beq	s0,a5,80004b50 <modbus_recv+0x324>
80004aac:	07e00793          	li	a5,126
80004ab0:	08f40a63          	beq	s0,a5,80004b44 <modbus_recv+0x318>
80004ab4:	03100793          	li	a5,49
80004ab8:	f2f41ee3          	bne	s0,a5,800049f4 <modbus_recv+0x1c8>
80004abc:	00010513          	mv	a0,sp
80004ac0:	998ff0ef          	jal	ra,80003c58 <config_load>
80004ac4:	00055c63          	bgez	a0,80004adc <modbus_recv+0x2b0>
80004ac8:	800035b7          	lui	a1,0x80003
80004acc:	02000613          	li	a2,32
80004ad0:	01858593          	addi	a1,a1,24 # 80003018 <_ram_heap_end+0xffff1018>
80004ad4:	00010513          	mv	a0,sp
80004ad8:	6fc090ef          	jal	ra,8000e1d4 <memcpy>
80004adc:	00c14783          	lbu	a5,12(sp)
80004ae0:	0fc0006f          	j	80004bdc <modbus_recv+0x3b0>
80004ae4:	00400613          	li	a2,4
80004ae8:	88b18593          	addi	a1,gp,-1909 # 80003133 <reg_sys_counter+0x3>
80004aec:	00348513          	addi	a0,s1,3
80004af0:	284010ef          	jal	ra,80005d74 <memcpy_rev>
80004af4:	00400413          	li	s0,4
80004af8:	00340593          	addi	a1,s0,3
80004afc:	01059593          	slli	a1,a1,0x10
80004b00:	00848123          	sb	s0,2(s1)
80004b04:	0105d593          	srli	a1,a1,0x10
80004b08:	00048513          	mv	a0,s1
80004b0c:	aa9fe0ef          	jal	ra,800035b4 <add_crc>
80004b10:	00540413          	addi	s0,s0,5
80004b14:	e60414e3          	bnez	s0,8000497c <modbus_recv+0x150>
80004b18:	80002537          	lui	a0,0x80002
80004b1c:	00090593          	mv	a1,s2
80004b20:	7b050513          	addi	a0,a0,1968 # 800027b0 <_ram_heap_end+0xffff07b0>
80004b24:	2f1090ef          	jal	ra,8000e614 <iprintf>
80004b28:	e55ff06f          	j	8000497c <modbus_recv+0x150>
80004b2c:	00400613          	li	a2,4
80004b30:	88f18593          	addi	a1,gp,-1905 # 80003137 <reg_irq_counter+0x3>
80004b34:	fb9ff06f          	j	80004aec <modbus_recv+0x2c0>
80004b38:	00400613          	li	a2,4
80004b3c:	88718593          	addi	a1,gp,-1913 # 8000312f <reg_scratch+0x3>
80004b40:	fadff06f          	j	80004aec <modbus_recv+0x2c0>
80004b44:	00400613          	li	a2,4
80004b48:	88318593          	addi	a1,gp,-1917 # 8000312b <reg_config_write+0x3>
80004b4c:	fa1ff06f          	j	80004aec <modbus_recv+0x2c0>
80004b50:	800035b7          	lui	a1,0x80003
80004b54:	00400613          	li	a2,4
80004b58:	0ab58593          	addi	a1,a1,171 # 800030ab <_ram_heap_end+0xffff10ab>
80004b5c:	f91ff06f          	j	80004aec <modbus_recv+0x2c0>
80004b60:	00010513          	mv	a0,sp
80004b64:	8f4ff0ef          	jal	ra,80003c58 <config_load>
80004b68:	00055c63          	bgez	a0,80004b80 <modbus_recv+0x354>
80004b6c:	800035b7          	lui	a1,0x80003
80004b70:	02000613          	li	a2,32
80004b74:	01858593          	addi	a1,a1,24 # 80003018 <_ram_heap_end+0xffff1018>
80004b78:	00010513          	mv	a0,sp
80004b7c:	658090ef          	jal	ra,8000e1d4 <memcpy>
80004b80:	00400613          	li	a2,4
80004b84:	00410593          	addi	a1,sp,4
80004b88:	ec1ff06f          	j	80004a48 <modbus_recv+0x21c>
80004b8c:	00010513          	mv	a0,sp
80004b90:	8c8ff0ef          	jal	ra,80003c58 <config_load>
80004b94:	00055c63          	bgez	a0,80004bac <modbus_recv+0x380>
80004b98:	800035b7          	lui	a1,0x80003
80004b9c:	02000613          	li	a2,32
80004ba0:	01858593          	addi	a1,a1,24 # 80003018 <_ram_heap_end+0xffff1018>
80004ba4:	00010513          	mv	a0,sp
80004ba8:	62c090ef          	jal	ra,8000e1d4 <memcpy>
80004bac:	00400613          	li	a2,4
80004bb0:	00810593          	addi	a1,sp,8
80004bb4:	e95ff06f          	j	80004a48 <modbus_recv+0x21c>
80004bb8:	00010513          	mv	a0,sp
80004bbc:	89cff0ef          	jal	ra,80003c58 <config_load>
80004bc0:	00055c63          	bgez	a0,80004bd8 <modbus_recv+0x3ac>
80004bc4:	800035b7          	lui	a1,0x80003
80004bc8:	02000613          	li	a2,32
80004bcc:	01858593          	addi	a1,a1,24 # 80003018 <_ram_heap_end+0xffff1018>
80004bd0:	00010513          	mv	a0,sp
80004bd4:	600090ef          	jal	ra,8000e1d4 <memcpy>
80004bd8:	01314783          	lbu	a5,19(sp)
80004bdc:	00f48323          	sb	a5,6(s1)
80004be0:	00600413          	li	s0,6
80004be4:	f15ff06f          	j	80004af8 <modbus_recv+0x2cc>
80004be8:	00010513          	mv	a0,sp
80004bec:	86cff0ef          	jal	ra,80003c58 <config_load>
80004bf0:	00055c63          	bgez	a0,80004c08 <modbus_recv+0x3dc>
80004bf4:	800035b7          	lui	a1,0x80003
80004bf8:	02000613          	li	a2,32
80004bfc:	01858593          	addi	a1,a1,24 # 80003018 <_ram_heap_end+0xffff1018>
80004c00:	00010513          	mv	a0,sp
80004c04:	5d0090ef          	jal	ra,8000e1d4 <memcpy>
80004c08:	01414783          	lbu	a5,20(sp)
80004c0c:	fd1ff06f          	j	80004bdc <modbus_recv+0x3b0>
80004c10:	00010513          	mv	a0,sp
80004c14:	844ff0ef          	jal	ra,80003c58 <config_load>
80004c18:	00055c63          	bgez	a0,80004c30 <modbus_recv+0x404>
80004c1c:	800035b7          	lui	a1,0x80003
80004c20:	02000613          	li	a2,32
80004c24:	01858593          	addi	a1,a1,24 # 80003018 <_ram_heap_end+0xffff1018>
80004c28:	00010513          	mv	a0,sp
80004c2c:	5a8090ef          	jal	ra,8000e1d4 <memcpy>
80004c30:	00400613          	li	a2,4
80004c34:	01b10593          	addi	a1,sp,27
80004c38:	e61ff06f          	j	80004a98 <modbus_recv+0x26c>
80004c3c:	00400613          	li	a2,4
80004c40:	002a0593          	addi	a1,s4,2
80004c44:	00248513          	addi	a0,s1,2
80004c48:	58c090ef          	jal	ra,8000e1d4 <memcpy>
80004c4c:	00600593          	li	a1,6
80004c50:	00048513          	mv	a0,s1
80004c54:	961fe0ef          	jal	ra,800035b4 <add_crc>
80004c58:	00800413          	li	s0,8
80004c5c:	d21ff06f          	j	8000497c <modbus_recv+0x150>
80004c60:	ff7a8613          	addi	a2,s5,-9
80004c64:	0ff67613          	andi	a2,a2,255
80004c68:	007a0593          	addi	a1,s4,7
80004c6c:	000b8513          	mv	a0,s7
80004c70:	fe4ff0ef          	jal	ra,80004454 <modbus_store_reg>
80004c74:	fc0554e3          	bgez	a0,80004c3c <modbus_recv+0x410>
80004c78:	ffe00793          	li	a5,-2
80004c7c:	00048613          	mv	a2,s1
80004c80:	00700593          	li	a1,7
80004c84:	00f50463          	beq	a0,a5,80004c8c <modbus_recv+0x460>
80004c88:	00300593          	li	a1,3
80004c8c:	00090513          	mv	a0,s2
80004c90:	f54ff0ef          	jal	ra,800043e4 <modbus_error>
80004c94:	00050413          	mv	s0,a0
80004c98:	e7dff06f          	j	80004b14 <modbus_recv+0x2e8>
80004c9c:	00048613          	mv	a2,s1
80004ca0:	00100593          	li	a1,1
80004ca4:	fe9ff06f          	j	80004c8c <modbus_recv+0x460>
80004ca8:	80002537          	lui	a0,0x80002
80004cac:	7e050513          	addi	a0,a0,2016 # 800027e0 <_ram_heap_end+0xffff07e0>
80004cb0:	165090ef          	jal	ra,8000e614 <iprintf>
80004cb4:	00000413          	li	s0,0
80004cb8:	cc5ff06f          	j	8000497c <modbus_recv+0x150>
80004cbc:	80003537          	lui	a0,0x80003
80004cc0:	82050513          	addi	a0,a0,-2016 # 80002820 <_ram_heap_end+0xffff0820>
80004cc4:	fedff06f          	j	80004cb0 <modbus_recv+0x484>

80004cc8 <mac_init>:
80004cc8:	ff010113          	addi	sp,sp,-16
80004ccc:	00112623          	sw	ra,12(sp)
80004cd0:	00812423          	sw	s0,8(sp)
80004cd4:	02051263          	bnez	a0,80004cf8 <mac_init+0x30>
80004cd8:	80003537          	lui	a0,0x80003
80004cdc:	85850513          	addi	a0,a0,-1960 # 80002858 <_ram_heap_end+0xffff0858>
80004ce0:	135090ef          	jal	ra,8000e614 <iprintf>
80004ce4:	ff000513          	li	a0,-16
80004ce8:	00c12083          	lw	ra,12(sp)
80004cec:	00812403          	lw	s0,8(sp)
80004cf0:	01010113          	addi	sp,sp,16
80004cf4:	00008067          	ret
80004cf8:	800035b7          	lui	a1,0x80003
80004cfc:	00050413          	mv	s0,a0
80004d00:	00500613          	li	a2,5
80004d04:	87858593          	addi	a1,a1,-1928 # 80002878 <_ram_heap_end+0xffff0878>
80004d08:	03650513          	addi	a0,a0,54
80004d0c:	4c8090ef          	jal	ra,8000e1d4 <memcpy>
80004d10:	8000b7b7          	lui	a5,0x8000b
80004d14:	42878793          	addi	a5,a5,1064 # 8000b428 <_ram_heap_end+0xffff9428>
80004d18:	00f42a23          	sw	a5,20(s0)
80004d1c:	800057b7          	lui	a5,0x80005
80004d20:	d7c78793          	addi	a5,a5,-644 # 80004d7c <_ram_heap_end+0xffff2d7c>
80004d24:	00f42c23          	sw	a5,24(s0)
80004d28:	00600613          	li	a2,6
80004d2c:	9a118593          	addi	a1,gp,-1631 # 80003249 <active_config+0xd>
80004d30:	02e40513          	addi	a0,s0,46
80004d34:	4a0090ef          	jal	ra,8000e1d4 <memcpy>
80004d38:	5dc00793          	li	a5,1500
80004d3c:	02f41623          	sh	a5,44(s0)
80004d40:	000017b7          	lui	a5,0x1
80004d44:	e0678793          	addi	a5,a5,-506 # e06 <_stack_size+0x606>
80004d48:	02f41a23          	sh	a5,52(s0)
80004d4c:	00002537          	lui	a0,0x2
80004d50:	01100793          	li	a5,17
80004d54:	f0070437          	lui	s0,0xf0070
80004d58:	00f42023          	sw	a5,0(s0) # f0070000 <_ram_heap_end+0x7005e000>
80004d5c:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
80004d60:	66d000ef          	jal	ra,80005bcc <delay_us>
80004d64:	80003537          	lui	a0,0x80003
80004d68:	00042023          	sw	zero,0(s0)
80004d6c:	88050513          	addi	a0,a0,-1920 # 80002880 <_ram_heap_end+0xffff0880>
80004d70:	0a5090ef          	jal	ra,8000e614 <iprintf>
80004d74:	00000513          	li	a0,0
80004d78:	f71ff06f          	j	80004ce8 <mac_init+0x20>

80004d7c <mac_tx_packet>:
80004d7c:	00050463          	beqz	a0,80004d84 <mac_tx_packet+0x8>
80004d80:	00059e63          	bnez	a1,80004d9c <mac_tx_packet+0x20>
80004d84:	f0000737          	lui	a4,0xf0000
80004d88:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
80004d8c:	ff000513          	li	a0,-16
80004d90:	0027e793          	ori	a5,a5,2
80004d94:	00f72223          	sw	a5,4(a4)
80004d98:	00008067          	ret
80004d9c:	ff010113          	addi	sp,sp,-16
80004da0:	00812423          	sw	s0,8(sp)
80004da4:	00058413          	mv	s0,a1
80004da8:	00040513          	mv	a0,s0
80004dac:	ffe00593          	li	a1,-2
80004db0:	00112623          	sw	ra,12(sp)
80004db4:	208020ef          	jal	ra,80006fbc <pbuf_header>
80004db8:	00040713          	mv	a4,s0
80004dbc:	00000793          	li	a5,0
80004dc0:	00a75683          	lhu	a3,10(a4)
80004dc4:	00072703          	lw	a4,0(a4)
80004dc8:	00d787b3          	add	a5,a5,a3
80004dcc:	fe071ae3          	bnez	a4,80004dc0 <mac_tx_packet+0x44>
80004dd0:	00379793          	slli	a5,a5,0x3
80004dd4:	f00706b7          	lui	a3,0xf0070
80004dd8:	0006a703          	lw	a4,0(a3) # f0070000 <_ram_heap_end+0x7005e000>
80004ddc:	00277713          	andi	a4,a4,2
80004de0:	fe070ce3          	beqz	a4,80004dd8 <mac_tx_packet+0x5c>
80004de4:	f0070737          	lui	a4,0xf0070
80004de8:	01472683          	lw	a3,20(a4) # f0070014 <_ram_heap_end+0x7005e014>
80004dec:	fe068ee3          	beqz	a3,80004de8 <mac_tx_packet+0x6c>
80004df0:	00f72823          	sw	a5,16(a4)
80004df4:	00040693          	mv	a3,s0
80004df8:	00000713          	li	a4,0
80004dfc:	00000793          	li	a5,0
80004e00:	00300893          	li	a7,3
80004e04:	f0070837          	lui	a6,0xf0070
80004e08:	0046a603          	lw	a2,4(a3)
80004e0c:	00a6d583          	lhu	a1,10(a3)
80004e10:	00b605b3          	add	a1,a2,a1
80004e14:	04c59863          	bne	a1,a2,80004e64 <mac_tx_packet+0xe8>
80004e18:	0006a683          	lw	a3,0(a3)
80004e1c:	fe0696e3          	bnez	a3,80004e08 <mac_tx_packet+0x8c>
80004e20:	00078a63          	beqz	a5,80004e34 <mac_tx_packet+0xb8>
80004e24:	f00707b7          	lui	a5,0xf0070
80004e28:	0147a683          	lw	a3,20(a5) # f0070014 <_ram_heap_end+0x7005e014>
80004e2c:	fe068ee3          	beqz	a3,80004e28 <mac_tx_packet+0xac>
80004e30:	00e7a823          	sw	a4,16(a5)
80004e34:	00040513          	mv	a0,s0
80004e38:	00200593          	li	a1,2
80004e3c:	180020ef          	jal	ra,80006fbc <pbuf_header>
80004e40:	a0c18793          	addi	a5,gp,-1524 # 800032b4 <lwip_stats>
80004e44:	0007a703          	lw	a4,0(a5)
80004e48:	00000513          	li	a0,0
80004e4c:	00170713          	addi	a4,a4,1
80004e50:	00e7a023          	sw	a4,0(a5)
80004e54:	00c12083          	lw	ra,12(sp)
80004e58:	00812403          	lw	s0,8(sp)
80004e5c:	01010113          	addi	sp,sp,16
80004e60:	00008067          	ret
80004e64:	00064503          	lbu	a0,0(a2)
80004e68:	00379313          	slli	t1,a5,0x3
80004e6c:	00651533          	sll	a0,a0,t1
80004e70:	00a76733          	or	a4,a4,a0
80004e74:	01179a63          	bne	a5,a7,80004e88 <mac_tx_packet+0x10c>
80004e78:	01482503          	lw	a0,20(a6) # f0070014 <_ram_heap_end+0x7005e014>
80004e7c:	fe050ee3          	beqz	a0,80004e78 <mac_tx_packet+0xfc>
80004e80:	00e82823          	sw	a4,16(a6)
80004e84:	00000713          	li	a4,0
80004e88:	00178793          	addi	a5,a5,1
80004e8c:	0037f793          	andi	a5,a5,3
80004e90:	00160613          	addi	a2,a2,1
80004e94:	f81ff06f          	j	80004e14 <mac_tx_packet+0x98>

80004e98 <sys_now>:
80004e98:	ff010113          	addi	sp,sp,-16
80004e9c:	00112623          	sw	ra,12(sp)
80004ea0:	f00b07b7          	lui	a5,0xf00b0
80004ea4:	0007a503          	lw	a0,0(a5) # f00b0000 <_ram_heap_end+0x7009e000>
80004ea8:	0047a583          	lw	a1,4(a5)
80004eac:	3e800613          	li	a2,1000
80004eb0:	00000693          	li	a3,0
80004eb4:	6a5070ef          	jal	ra,8000cd58 <__udivdi3>
80004eb8:	00c12083          	lw	ra,12(sp)
80004ebc:	01010113          	addi	sp,sp,16
80004ec0:	00008067          	ret

80004ec4 <sys_arch_protect>:
80004ec4:	00008067          	ret

80004ec8 <sys_arch_unprotect>:
80004ec8:	00008067          	ret

80004ecc <mac_lwip_init>:
80004ecc:	ff010113          	addi	sp,sp,-16
80004ed0:	00112623          	sw	ra,12(sp)
80004ed4:	00812423          	sw	s0,8(sp)
80004ed8:	00912223          	sw	s1,4(sp)
80004edc:	6bd000ef          	jal	ra,80005d98 <lwip_init>
80004ee0:	fb9ff0ef          	jal	ra,80004e98 <sys_now>
80004ee4:	8aa1a223          	sw	a0,-1884(gp) # 8000314c <ts_ipreass>
80004ee8:	8aa1a623          	sw	a0,-1876(gp) # 80003154 <ts_etharp>
80004eec:	8000d837          	lui	a6,0x8000d
80004ef0:	800057b7          	lui	a5,0x80005
80004ef4:	a0c80813          	addi	a6,a6,-1524 # 8000ca0c <_ram_heap_end+0xffffaa0c>
80004ef8:	cc878793          	addi	a5,a5,-824 # 80004cc8 <_ram_heap_end+0xffff2cc8>
80004efc:	00000713          	li	a4,0
80004f00:	99818693          	addi	a3,gp,-1640 # 80003240 <active_config+0x4>
80004f04:	99c18613          	addi	a2,gp,-1636 # 80003244 <active_config+0x8>
80004f08:	99418593          	addi	a1,gp,-1644 # 8000323c <active_config>
80004f0c:	9b418513          	addi	a0,gp,-1612 # 8000325c <default_netif>
80004f10:	24d010ef          	jal	ra,8000695c <netif_add>
80004f14:	02051663          	bnez	a0,80004f40 <mac_lwip_init+0x74>
80004f18:	80003537          	lui	a0,0x80003
80004f1c:	89450513          	addi	a0,a0,-1900 # 80002894 <_ram_heap_end+0xffff0894>
80004f20:	6f4090ef          	jal	ra,8000e614 <iprintf>
80004f24:	fff00493          	li	s1,-1
80004f28:	00c12083          	lw	ra,12(sp)
80004f2c:	00812403          	lw	s0,8(sp)
80004f30:	00048513          	mv	a0,s1
80004f34:	00412483          	lw	s1,4(sp)
80004f38:	01010113          	addi	sp,sp,16
80004f3c:	00008067          	ret
80004f40:	9b418513          	addi	a0,gp,-1612 # 8000325c <default_netif>
80004f44:	351010ef          	jal	ra,80006a94 <netif_set_default>
80004f48:	9b418513          	addi	a0,gp,-1612 # 8000325c <default_netif>
80004f4c:	99418493          	addi	s1,gp,-1644 # 8000323c <active_config>
80004f50:	34d010ef          	jal	ra,80006a9c <netif_set_up>
80004f54:	00c4c783          	lbu	a5,12(s1)
80004f58:	00000493          	li	s1,0
80004f5c:	0017f793          	andi	a5,a5,1
80004f60:	fc0784e3          	beqz	a5,80004f28 <mac_lwip_init+0x5c>
80004f64:	9b418513          	addi	a0,gp,-1612 # 8000325c <default_netif>
80004f68:	558050ef          	jal	ra,8000a4c0 <dhcp_start>
80004f6c:	fbdff06f          	j	80004f28 <mac_lwip_init+0x5c>

80004f70 <mac_rx_isr>:
80004f70:	fc010113          	addi	sp,sp,-64
80004f74:	02912a23          	sw	s1,52(sp)
80004f78:	03512223          	sw	s5,36(sp)
80004f7c:	01712e23          	sw	s7,28(sp)
80004f80:	00001bb7          	lui	s7,0x1
80004f84:	03312623          	sw	s3,44(sp)
80004f88:	01812c23          	sw	s8,24(sp)
80004f8c:	01912a23          	sw	s9,20(sp)
80004f90:	02112e23          	sw	ra,60(sp)
80004f94:	02812c23          	sw	s0,56(sp)
80004f98:	03212823          	sw	s2,48(sp)
80004f9c:	03412423          	sw	s4,40(sp)
80004fa0:	03612023          	sw	s6,32(sp)
80004fa4:	01a12823          	sw	s10,16(sp)
80004fa8:	00000993          	li	s3,0
80004fac:	800b8b93          	addi	s7,s7,-2048 # 800 <_stack_size>
80004fb0:	a0c18493          	addi	s1,gp,-1524 # 800032b4 <lwip_stats>
80004fb4:	9b418a93          	addi	s5,gp,-1612 # 8000325c <default_netif>
80004fb8:	80003c37          	lui	s8,0x80003
80004fbc:	80003cb7          	lui	s9,0x80003
80004fc0:	f0070937          	lui	s2,0xf0070
80004fc4:	00092783          	lw	a5,0(s2) # f0070000 <_ram_heap_end+0x7005e000>
80004fc8:	0207f793          	andi	a5,a5,32
80004fcc:	04078663          	beqz	a5,80005018 <mac_rx_isr+0xa8>
80004fd0:	02092683          	lw	a3,32(s2)
80004fd4:	00768413          	addi	s0,a3,7
80004fd8:	00345413          	srli	s0,s0,0x3
80004fdc:	068bfa63          	bgeu	s7,s0,80005050 <mac_rx_isr+0xe0>
80004fe0:	80003537          	lui	a0,0x80003
80004fe4:	00068613          	mv	a2,a3
80004fe8:	00040593          	mv	a1,s0
80004fec:	8b850513          	addi	a0,a0,-1864 # 800028b8 <_ram_heap_end+0xffff08b8>
80004ff0:	624090ef          	jal	ra,8000e614 <iprintf>
80004ff4:	80c1a783          	lw	a5,-2036(gp) # 800030b4 <_impure_ptr>
80004ff8:	0087a503          	lw	a0,8(a5)
80004ffc:	415080ef          	jal	ra,8000dc10 <fflush>
80005000:	01100793          	li	a5,17
80005004:	00002537          	lui	a0,0x2
80005008:	00f92023          	sw	a5,0(s2)
8000500c:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
80005010:	3bd000ef          	jal	ra,80005bcc <delay_us>
80005014:	00092023          	sw	zero,0(s2)
80005018:	03c12083          	lw	ra,60(sp)
8000501c:	03812403          	lw	s0,56(sp)
80005020:	03412483          	lw	s1,52(sp)
80005024:	03012903          	lw	s2,48(sp)
80005028:	02c12983          	lw	s3,44(sp)
8000502c:	02812a03          	lw	s4,40(sp)
80005030:	02412a83          	lw	s5,36(sp)
80005034:	02012b03          	lw	s6,32(sp)
80005038:	01c12b83          	lw	s7,28(sp)
8000503c:	01812c03          	lw	s8,24(sp)
80005040:	01412c83          	lw	s9,20(sp)
80005044:	01012d03          	lw	s10,16(sp)
80005048:	04010113          	addi	sp,sp,64
8000504c:	00008067          	ret
80005050:	00240d13          	addi	s10,s0,2
80005054:	010d1d13          	slli	s10,s10,0x10
80005058:	010d5d13          	srli	s10,s10,0x10
8000505c:	18200613          	li	a2,386
80005060:	000d0593          	mv	a1,s10
80005064:	00000513          	li	a0,0
80005068:	00d12623          	sw	a3,12(sp)
8000506c:	04c020ef          	jal	ra,800070b8 <pbuf_alloc>
80005070:	00050913          	mv	s2,a0
80005074:	00c12683          	lw	a3,12(sp)
80005078:	0a051663          	bnez	a0,80005124 <mac_rx_isr+0x1b4>
8000507c:	f0000737          	lui	a4,0xf0000
80005080:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
80005084:	80003537          	lui	a0,0x80003
80005088:	00040613          	mv	a2,s0
8000508c:	0027e793          	ori	a5,a5,2
80005090:	00f72223          	sw	a5,4(a4)
80005094:	01f68713          	addi	a4,a3,31
80005098:	00575713          	srli	a4,a4,0x5
8000509c:	000d0593          	mv	a1,s10
800050a0:	8f850513          	addi	a0,a0,-1800 # 800028f8 <_ram_heap_end+0xffff08f8>
800050a4:	570090ef          	jal	ra,8000e614 <iprintf>
800050a8:	a0c18793          	addi	a5,gp,-1524 # 800032b4 <lwip_stats>
800050ac:	0187a703          	lw	a4,24(a5)
800050b0:	00170713          	addi	a4,a4,1
800050b4:	00e7ac23          	sw	a4,24(a5)
800050b8:	00c7a703          	lw	a4,12(a5)
800050bc:	00170713          	addi	a4,a4,1
800050c0:	00e7a623          	sw	a4,12(a5)
800050c4:	f0070737          	lui	a4,0xf0070
800050c8:	04804263          	bgtz	s0,8000510c <mac_rx_isr+0x19c>
800050cc:	03812403          	lw	s0,56(sp)
800050d0:	03c12083          	lw	ra,60(sp)
800050d4:	03412483          	lw	s1,52(sp)
800050d8:	03012903          	lw	s2,48(sp)
800050dc:	02c12983          	lw	s3,44(sp)
800050e0:	02812a03          	lw	s4,40(sp)
800050e4:	02412a83          	lw	s5,36(sp)
800050e8:	02012b03          	lw	s6,32(sp)
800050ec:	01c12b83          	lw	s7,28(sp)
800050f0:	01812c03          	lw	s8,24(sp)
800050f4:	01412c83          	lw	s9,20(sp)
800050f8:	01012d03          	lw	s10,16(sp)
800050fc:	80003537          	lui	a0,0x80003
80005100:	94850513          	addi	a0,a0,-1720 # 80002948 <_ram_heap_end+0xffff0948>
80005104:	04010113          	addi	sp,sp,64
80005108:	50c0906f          	j	8000e614 <iprintf>
8000510c:	00072783          	lw	a5,0(a4) # f0070000 <_ram_heap_end+0x7005e000>
80005110:	0207f793          	andi	a5,a5,32
80005114:	fe078ce3          	beqz	a5,8000510c <mac_rx_isr+0x19c>
80005118:	02072783          	lw	a5,32(a4)
8000511c:	ffc40413          	addi	s0,s0,-4
80005120:	fa9ff06f          	j	800050c8 <mac_rx_isr+0x158>
80005124:	ffe00593          	li	a1,-2
80005128:	695010ef          	jal	ra,80006fbc <pbuf_header>
8000512c:	00000713          	li	a4,0
80005130:	00000793          	li	a5,0
80005134:	f0070637          	lui	a2,0xf0070
80005138:	04041a63          	bnez	s0,8000518c <mac_rx_isr+0x21c>
8000513c:	00200593          	li	a1,2
80005140:	00090513          	mv	a0,s2
80005144:	00492a03          	lw	s4,4(s2)
80005148:	675010ef          	jal	ra,80006fbc <pbuf_header>
8000514c:	0044a783          	lw	a5,4(s1)
80005150:	000a8593          	mv	a1,s5
80005154:	00090513          	mv	a0,s2
80005158:	00178793          	addi	a5,a5,1
8000515c:	00f4a223          	sw	a5,4(s1)
80005160:	010aa783          	lw	a5,16(s5)
80005164:	000780e7          	jalr	a5
80005168:	00050593          	mv	a1,a0
8000516c:	08050463          	beqz	a0,800051f4 <mac_rx_isr+0x284>
80005170:	f0000737          	lui	a4,0xf0000
80005174:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
80005178:	994c0513          	addi	a0,s8,-1644 # 80002994 <_ram_heap_end+0xffff0994>
8000517c:	0027e793          	ori	a5,a5,2
80005180:	00f72223          	sw	a5,4(a4)
80005184:	490090ef          	jal	ra,8000e614 <iprintf>
80005188:	06c0006f          	j	800051f4 <mac_rx_isr+0x284>
8000518c:	08099063          	bnez	s3,8000520c <mac_rx_isr+0x29c>
80005190:	06078863          	beqz	a5,80005200 <mac_rx_isr+0x290>
80005194:	0007a783          	lw	a5,0(a5)
80005198:	06079663          	bnez	a5,80005204 <mac_rx_isr+0x294>
8000519c:	f0000737          	lui	a4,0xf0000
800051a0:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
800051a4:	968c8513          	addi	a0,s9,-1688 # 80002968 <_ram_heap_end+0xffff0968>
800051a8:	0027e793          	ori	a5,a5,2
800051ac:	00f72223          	sw	a5,4(a4)
800051b0:	464090ef          	jal	ra,8000e614 <iprintf>
800051b4:	0184a783          	lw	a5,24(s1)
800051b8:	f0070737          	lui	a4,0xf0070
800051bc:	00178793          	addi	a5,a5,1
800051c0:	00f4ac23          	sw	a5,24(s1)
800051c4:	00c4a783          	lw	a5,12(s1)
800051c8:	00178793          	addi	a5,a5,1
800051cc:	00f4a623          	sw	a5,12(s1)
800051d0:	00072783          	lw	a5,0(a4) # f0070000 <_ram_heap_end+0x7005e000>
800051d4:	0207f793          	andi	a5,a5,32
800051d8:	fe078ce3          	beqz	a5,800051d0 <mac_rx_isr+0x260>
800051dc:	02072783          	lw	a5,32(a4)
800051e0:	ffc40413          	addi	s0,s0,-4
800051e4:	fe8046e3          	bgtz	s0,800051d0 <mac_rx_isr+0x260>
800051e8:	00200593          	li	a1,2
800051ec:	00090513          	mv	a0,s2
800051f0:	5cd010ef          	jal	ra,80006fbc <pbuf_header>
800051f4:	00090513          	mv	a0,s2
800051f8:	5ed010ef          	jal	ra,80006fe4 <pbuf_free>
800051fc:	dc5ff06f          	j	80004fc0 <mac_rx_isr+0x50>
80005200:	00090793          	mv	a5,s2
80005204:	00a7d983          	lhu	s3,10(a5)
80005208:	0047aa03          	lw	s4,4(a5)
8000520c:	00071a63          	bnez	a4,80005220 <mac_rx_isr+0x2b0>
80005210:	00062683          	lw	a3,0(a2) # f0070000 <_ram_heap_end+0x7005e000>
80005214:	0206f693          	andi	a3,a3,32
80005218:	fe068ce3          	beqz	a3,80005210 <mac_rx_isr+0x2a0>
8000521c:	02062b03          	lw	s6,32(a2)
80005220:	00170713          	addi	a4,a4,1
80005224:	016a0023          	sb	s6,0(s4)
80005228:	00377713          	andi	a4,a4,3
8000522c:	008b5b13          	srli	s6,s6,0x8
80005230:	fff40413          	addi	s0,s0,-1
80005234:	001a0a13          	addi	s4,s4,1
80005238:	fff98993          	addi	s3,s3,-1
8000523c:	efdff06f          	j	80005138 <mac_rx_isr+0x1c8>

80005240 <mac_poll>:
80005240:	ff010113          	addi	sp,sp,-16
80005244:	00812423          	sw	s0,8(sp)
80005248:	00112623          	sw	ra,12(sp)
8000524c:	00912223          	sw	s1,4(sp)
80005250:	c49ff0ef          	jal	ra,80004e98 <sys_now>
80005254:	8ac1a683          	lw	a3,-1876(gp) # 80003154 <ts_etharp>
80005258:	00050413          	mv	s0,a0
8000525c:	00a6f663          	bgeu	a3,a0,80005268 <mac_poll+0x28>
80005260:	8a41a683          	lw	a3,-1884(gp) # 8000314c <ts_ipreass>
80005264:	02a6e063          	bltu	a3,a0,80005284 <mac_poll+0x44>
80005268:	8a81a223          	sw	s0,-1884(gp) # 8000314c <ts_ipreass>
8000526c:	8a81a623          	sw	s0,-1876(gp) # 80003154 <ts_etharp>
80005270:	00c12083          	lw	ra,12(sp)
80005274:	00812403          	lw	s0,8(sp)
80005278:	00412483          	lw	s1,4(sp)
8000527c:	01010113          	addi	sp,sp,16
80005280:	00008067          	ret
80005284:	8a01a783          	lw	a5,-1888(gp) # 80003148 <ts_dhcp_fine>
80005288:	1f300713          	li	a4,499
8000528c:	40f507b3          	sub	a5,a0,a5
80005290:	00f77663          	bgeu	a4,a5,8000529c <mac_poll+0x5c>
80005294:	5d4050ef          	jal	ra,8000a868 <dhcp_fine_tmr>
80005298:	8a81a023          	sw	s0,-1888(gp) # 80003148 <ts_dhcp_fine>
8000529c:	89c1a703          	lw	a4,-1892(gp) # 80003144 <ts_dhcp_coarse>
800052a0:	0000f7b7          	lui	a5,0xf
800052a4:	a5f78793          	addi	a5,a5,-1441 # ea5f <_stack_size+0xe25f>
800052a8:	40e40733          	sub	a4,s0,a4
800052ac:	00e7f663          	bgeu	a5,a4,800052b8 <mac_poll+0x78>
800052b0:	2f4050ef          	jal	ra,8000a5a4 <dhcp_coarse_tmr>
800052b4:	8881ae23          	sw	s0,-1892(gp) # 80003144 <ts_dhcp_coarse>
800052b8:	f00607b7          	lui	a5,0xf0060
800052bc:	0087a783          	lw	a5,8(a5) # f0060008 <_ram_heap_end+0x7004e008>
800052c0:	0047f793          	andi	a5,a5,4
800052c4:	fa0786e3          	beqz	a5,80005270 <mac_poll+0x30>
800052c8:	80003537          	lui	a0,0x80003
800052cc:	9c450513          	addi	a0,a0,-1596 # 800029c4 <_ram_heap_end+0xffff09c4>
800052d0:	344090ef          	jal	ra,8000e614 <iprintf>
800052d4:	00812403          	lw	s0,8(sp)
800052d8:	00c12083          	lw	ra,12(sp)
800052dc:	00412483          	lw	s1,4(sp)
800052e0:	01010113          	addi	sp,sp,16
800052e4:	c8dff06f          	j	80004f70 <mac_rx_isr>

800052e8 <mac_print_stats>:
800052e8:	ff010113          	addi	sp,sp,-16
800052ec:	9b818513          	addi	a0,gp,-1608 # 80003260 <default_netif+0x4>
800052f0:	00112623          	sw	ra,12(sp)
800052f4:	70c070ef          	jal	ra,8000ca00 <ip4addr_ntoa>
800052f8:	a0c18613          	addi	a2,gp,-1524 # 800032b4 <lwip_stats>
800052fc:	01062883          	lw	a7,16(a2)
80005300:	01462803          	lw	a6,20(a2)
80005304:	00c62783          	lw	a5,12(a2)
80005308:	02862703          	lw	a4,40(a2)
8000530c:	00062683          	lw	a3,0(a2)
80005310:	00c12083          	lw	ra,12(sp)
80005314:	00462603          	lw	a2,4(a2)
80005318:	00050593          	mv	a1,a0
8000531c:	80003537          	lui	a0,0x80003
80005320:	9e450513          	addi	a0,a0,-1564 # 800029e4 <_ram_heap_end+0xffff09e4>
80005324:	01010113          	addi	sp,sp,16
80005328:	2ec0906f          	j	8000e614 <iprintf>

8000532c <hub_init>:
8000532c:	fe010113          	addi	sp,sp,-32
80005330:	00912a23          	sw	s1,20(sp)
80005334:	800034b7          	lui	s1,0x80003
80005338:	0384c783          	lbu	a5,56(s1) # 80003038 <_ram_heap_end+0xffff1038>
8000533c:	00112e23          	sw	ra,28(sp)
80005340:	00812c23          	sw	s0,24(sp)
80005344:	01212823          	sw	s2,16(sp)
80005348:	01312623          	sw	s3,12(sp)
8000534c:	01412423          	sw	s4,8(sp)
80005350:	01512223          	sw	s5,4(sp)
80005354:	01612023          	sw	s6,0(sp)
80005358:	03848493          	addi	s1,s1,56
8000535c:	04f50063          	beq	a0,a5,8000539c <hub_init+0x70>
80005360:	0054c703          	lbu	a4,5(s1)
80005364:	fff00793          	li	a5,-1
80005368:	00100a13          	li	s4,1
8000536c:	02e50a63          	beq	a0,a4,800053a0 <hub_init+0x74>
80005370:	01c12083          	lw	ra,28(sp)
80005374:	01812403          	lw	s0,24(sp)
80005378:	01412483          	lw	s1,20(sp)
8000537c:	01012903          	lw	s2,16(sp)
80005380:	00c12983          	lw	s3,12(sp)
80005384:	00812a03          	lw	s4,8(sp)
80005388:	00412a83          	lw	s5,4(sp)
8000538c:	00012b03          	lw	s6,0(sp)
80005390:	00078513          	mv	a0,a5
80005394:	02010113          	addi	sp,sp,32
80005398:	00008067          	ret
8000539c:	00000a13          	li	s4,0
800053a0:	002a1993          	slli	s3,s4,0x2
800053a4:	014987b3          	add	a5,s3,s4
800053a8:	00f487b3          	add	a5,s1,a5
800053ac:	0017c403          	lbu	s0,1(a5)
800053b0:	0027c903          	lbu	s2,2(a5)
800053b4:	0037ca83          	lbu	s5,3(a5)
800053b8:	00040513          	mv	a0,s0
800053bc:	00090593          	mv	a1,s2
800053c0:	0047cb03          	lbu	s6,4(a5)
800053c4:	769070ef          	jal	ra,8000d32c <__mulsi3>
800053c8:	000a8593          	mv	a1,s5
800053cc:	761070ef          	jal	ra,8000d32c <__mulsi3>
800053d0:	000b0593          	mv	a1,s6
800053d4:	759070ef          	jal	ra,8000d32c <__mulsi3>
800053d8:	40355513          	srai	a0,a0,0x3
800053dc:	8aa1ac23          	sw	a0,-1864(gp) # 80003160 <hub_frame_size>
800053e0:	8a81aa23          	sw	s0,-1868(gp) # 8000315c <hub_frame_width>
800053e4:	000a8593          	mv	a1,s5
800053e8:	00090513          	mv	a0,s2
800053ec:	741070ef          	jal	ra,8000d32c <__mulsi3>
800053f0:	8aa1a823          	sw	a0,-1872(gp) # 80003158 <hub_frame_height>
800053f4:	f00547b7          	lui	a5,0xf0054
800053f8:	0007a023          	sw	zero,0(a5) # f0054000 <_ram_heap_end+0x70042000>
800053fc:	000b0593          	mv	a1,s6
80005400:	00040513          	mv	a0,s0
80005404:	729070ef          	jal	ra,8000d32c <__mulsi3>
80005408:	000a8593          	mv	a1,s5
8000540c:	721070ef          	jal	ra,8000d32c <__mulsi3>
80005410:	00000693          	li	a3,0
80005414:	00000713          	li	a4,0
80005418:	f0050637          	lui	a2,0xf0050
8000541c:	000015b7          	lui	a1,0x1
80005420:	03274e63          	blt	a4,s2,8000545c <hub_init+0x130>
80005424:	014989b3          	add	s3,s3,s4
80005428:	013484b3          	add	s1,s1,s3
8000542c:	0004c783          	lbu	a5,0(s1)
80005430:	01041413          	slli	s0,s0,0x10
80005434:	01891913          	slli	s2,s2,0x18
80005438:	01246433          	or	s0,s0,s2
8000543c:	00f46433          	or	s0,s0,a5
80005440:	000107b7          	lui	a5,0x10
80005444:	f8078793          	addi	a5,a5,-128 # ff80 <_stack_size+0xf780>
80005448:	00f46433          	or	s0,s0,a5
8000544c:	f00547b7          	lui	a5,0xf0054
80005450:	0087a023          	sw	s0,0(a5) # f0054000 <_ram_heap_end+0x70042000>
80005454:	00000793          	li	a5,0
80005458:	f19ff06f          	j	80005370 <hub_init+0x44>
8000545c:	00b707b3          	add	a5,a4,a1
80005460:	00279793          	slli	a5,a5,0x2
80005464:	4036d813          	srai	a6,a3,0x3
80005468:	00f607b3          	add	a5,a2,a5
8000546c:	0107a223          	sw	a6,4(a5)
80005470:	00170713          	addi	a4,a4,1
80005474:	00a686b3          	add	a3,a3,a0
80005478:	fa9ff06f          	j	80005420 <hub_init+0xf4>

8000547c <hub_print_char>:
8000547c:	f9010113          	addi	sp,sp,-112
80005480:	05812423          	sw	s8,72(sp)
80005484:	00078c13          	mv	s8,a5
80005488:	07812783          	lw	a5,120(sp)
8000548c:	06912223          	sw	s1,100(sp)
80005490:	05312e23          	sw	s3,92(sp)
80005494:	41f7d493          	srai	s1,a5,0x1f
80005498:	0074f493          	andi	s1,s1,7
8000549c:	00f484b3          	add	s1,s1,a5
800054a0:	05412c23          	sw	s4,88(sp)
800054a4:	02a12023          	sw	a0,32(sp)
800054a8:	06112623          	sw	ra,108(sp)
800054ac:	06812423          	sw	s0,104(sp)
800054b0:	07212023          	sw	s2,96(sp)
800054b4:	05512a23          	sw	s5,84(sp)
800054b8:	05612823          	sw	s6,80(sp)
800054bc:	05712623          	sw	s7,76(sp)
800054c0:	05912223          	sw	s9,68(sp)
800054c4:	05a12023          	sw	s10,64(sp)
800054c8:	03b12e23          	sw	s11,60(sp)
800054cc:	02c12223          	sw	a2,36(sp)
800054d0:	02e12423          	sw	a4,40(sp)
800054d4:	03012623          	sw	a6,44(sp)
800054d8:	0077f793          	andi	a5,a5,7
800054dc:	00058513          	mv	a0,a1
800054e0:	00068993          	mv	s3,a3
800054e4:	00088a13          	mv	s4,a7
800054e8:	4034d493          	srai	s1,s1,0x3
800054ec:	00078463          	beqz	a5,800054f4 <hub_print_char+0x78>
800054f0:	00148493          	addi	s1,s1,1
800054f4:	07412583          	lw	a1,116(sp)
800054f8:	00000b93          	li	s7,0
800054fc:	631070ef          	jal	ra,8000d32c <__mulsi3>
80005500:	00048593          	mv	a1,s1
80005504:	629070ef          	jal	ra,8000d32c <__mulsi3>
80005508:	07012a83          	lw	s5,112(sp)
8000550c:	003c1793          	slli	a5,s8,0x3
80005510:	00098593          	mv	a1,s3
80005514:	00aa8ab3          	add	s5,s5,a0
80005518:	000c0513          	mv	a0,s8
8000551c:	00f12e23          	sw	a5,28(sp)
80005520:	60d070ef          	jal	ra,8000d32c <__mulsi3>
80005524:	00a12823          	sw	a0,16(sp)
80005528:	049bc063          	blt	s7,s1,80005568 <hub_print_char+0xec>
8000552c:	06c12083          	lw	ra,108(sp)
80005530:	06812403          	lw	s0,104(sp)
80005534:	06412483          	lw	s1,100(sp)
80005538:	06012903          	lw	s2,96(sp)
8000553c:	05c12983          	lw	s3,92(sp)
80005540:	05812a03          	lw	s4,88(sp)
80005544:	05412a83          	lw	s5,84(sp)
80005548:	05012b03          	lw	s6,80(sp)
8000554c:	04c12b83          	lw	s7,76(sp)
80005550:	04812c03          	lw	s8,72(sp)
80005554:	04412c83          	lw	s9,68(sp)
80005558:	04012d03          	lw	s10,64(sp)
8000555c:	03c12d83          	lw	s11,60(sp)
80005560:	07010113          	addi	sp,sp,112
80005564:	00008067          	ret
80005568:	07812703          	lw	a4,120(sp)
8000556c:	003b9793          	slli	a5,s7,0x3
80005570:	40f707b3          	sub	a5,a4,a5
80005574:	00f12623          	sw	a5,12(sp)
80005578:	00c12703          	lw	a4,12(sp)
8000557c:	00800793          	li	a5,8
80005580:	00e7d463          	bge	a5,a4,80005588 <hub_print_char+0x10c>
80005584:	00f12623          	sw	a5,12(sp)
80005588:	02412b03          	lw	s6,36(sp)
8000558c:	00000c93          	li	s9,0
80005590:	07412783          	lw	a5,116(sp)
80005594:	02fcc263          	blt	s9,a5,800055b8 <hub_print_char+0x13c>
80005598:	00fa8ab3          	add	s5,s5,a5
8000559c:	01c12703          	lw	a4,28(sp)
800055a0:	01012783          	lw	a5,16(sp)
800055a4:	001b8b93          	addi	s7,s7,1
800055a8:	00898993          	addi	s3,s3,8
800055ac:	00e787b3          	add	a5,a5,a4
800055b0:	00f12823          	sw	a5,16(sp)
800055b4:	f75ff06f          	j	80005528 <hub_print_char+0xac>
800055b8:	020b4863          	bltz	s6,800055e8 <hub_print_char+0x16c>
800055bc:	038b5663          	bge	s6,s8,800055e8 <hub_print_char+0x16c>
800055c0:	019a87b3          	add	a5,s5,s9
800055c4:	0007c783          	lbu	a5,0(a5)
800055c8:	00000d13          	li	s10,0
800055cc:	00f12c23          	sw	a5,24(sp)
800055d0:	01012783          	lw	a5,16(sp)
800055d4:	00fb0db3          	add	s11,s6,a5
800055d8:	00100793          	li	a5,1
800055dc:	00f12423          	sw	a5,8(sp)
800055e0:	00c12783          	lw	a5,12(sp)
800055e4:	00fd4863          	blt	s10,a5,800055f4 <hub_print_char+0x178>
800055e8:	001b0b13          	addi	s6,s6,1
800055ec:	001c8c93          	addi	s9,s9,1
800055f0:	fa1ff06f          	j	80005590 <hub_print_char+0x114>
800055f4:	013d07b3          	add	a5,s10,s3
800055f8:	0407ca63          	bltz	a5,8000564c <hub_print_char+0x1d0>
800055fc:	02c12703          	lw	a4,44(sp)
80005600:	04e7d663          	bge	a5,a4,8000564c <hub_print_char+0x1d0>
80005604:	00c00793          	li	a5,12
80005608:	06fa0063          	beq	s4,a5,80005668 <hub_print_char+0x1ec>
8000560c:	04b00793          	li	a5,75
80005610:	08fa0a63          	beq	s4,a5,800056a4 <hub_print_char+0x228>
80005614:	01412783          	lw	a5,20(sp)
80005618:	00279913          	slli	s2,a5,0x2
8000561c:	02012783          	lw	a5,32(sp)
80005620:	01278933          	add	s2,a5,s2
80005624:	00092503          	lw	a0,0(s2)
80005628:	6fc070ef          	jal	ra,8000cd24 <__bswapsi2>
8000562c:	01812783          	lw	a5,24(sp)
80005630:	00812703          	lw	a4,8(sp)
80005634:	00e7f7b3          	and	a5,a5,a4
80005638:	10078263          	beqz	a5,8000573c <hub_print_char+0x2c0>
8000563c:	00c00793          	li	a5,12
80005640:	0afa0663          	beq	s4,a5,800056ec <hub_print_char+0x270>
80005644:	04b00793          	li	a5,75
80005648:	0afa0a63          	beq	s4,a5,800056fc <hub_print_char+0x280>
8000564c:	00812783          	lw	a5,8(sp)
80005650:	001d0d13          	addi	s10,s10,1
80005654:	018d8db3          	add	s11,s11,s8
80005658:	00179793          	slli	a5,a5,0x1
8000565c:	0ff7f793          	andi	a5,a5,255
80005660:	00f12423          	sw	a5,8(sp)
80005664:	f7dff06f          	j	800055e0 <hub_print_char+0x164>
80005668:	41fdd793          	srai	a5,s11,0x1f
8000566c:	01f7f793          	andi	a5,a5,31
80005670:	01b787b3          	add	a5,a5,s11
80005674:	4057d793          	srai	a5,a5,0x5
80005678:	00f12a23          	sw	a5,20(sp)
8000567c:	800007b7          	lui	a5,0x80000
80005680:	01f78793          	addi	a5,a5,31 # 8000001f <_ram_heap_end+0xfffee01f>
80005684:	00fdf433          	and	s0,s11,a5
80005688:	00045863          	bgez	s0,80005698 <hub_print_char+0x21c>
8000568c:	fff40413          	addi	s0,s0,-1
80005690:	fe046413          	ori	s0,s0,-32
80005694:	00140413          	addi	s0,s0,1
80005698:	800007b7          	lui	a5,0x80000
8000569c:	0087d433          	srl	s0,a5,s0
800056a0:	f75ff06f          	j	80005614 <hub_print_char+0x198>
800056a4:	41fdd793          	srai	a5,s11,0x1f
800056a8:	0037f793          	andi	a5,a5,3
800056ac:	01b787b3          	add	a5,a5,s11
800056b0:	4027d793          	srai	a5,a5,0x2
800056b4:	00f12a23          	sw	a5,20(sp)
800056b8:	800007b7          	lui	a5,0x80000
800056bc:	00378793          	addi	a5,a5,3 # 80000003 <_ram_heap_end+0xfffee003>
800056c0:	00fdf433          	and	s0,s11,a5
800056c4:	00045863          	bgez	s0,800056d4 <hub_print_char+0x258>
800056c8:	fff40413          	addi	s0,s0,-1
800056cc:	ffc46413          	ori	s0,s0,-4
800056d0:	00140413          	addi	s0,s0,1
800056d4:	00300793          	li	a5,3
800056d8:	40878433          	sub	s0,a5,s0
800056dc:	00341413          	slli	s0,s0,0x3
800056e0:	0ff00793          	li	a5,255
800056e4:	00879433          	sll	s0,a5,s0
800056e8:	f2dff06f          	j	80005614 <hub_print_char+0x198>
800056ec:	00a46533          	or	a0,s0,a0
800056f0:	634070ef          	jal	ra,8000cd24 <__bswapsi2>
800056f4:	00a92023          	sw	a0,0(s2)
800056f8:	f55ff06f          	j	8000564c <hub_print_char+0x1d0>
800056fc:	fff44793          	not	a5,s0
80005700:	00a7f533          	and	a0,a5,a0
80005704:	800007b7          	lui	a5,0x80000
80005708:	00378793          	addi	a5,a5,3 # 80000003 <_ram_heap_end+0xfffee003>
8000570c:	00fdf7b3          	and	a5,s11,a5
80005710:	0007d863          	bgez	a5,80005720 <hub_print_char+0x2a4>
80005714:	fff78793          	addi	a5,a5,-1
80005718:	ffc7e793          	ori	a5,a5,-4
8000571c:	00178793          	addi	a5,a5,1
80005720:	00300713          	li	a4,3
80005724:	40f707b3          	sub	a5,a4,a5
80005728:	02812703          	lw	a4,40(sp)
8000572c:	00379793          	slli	a5,a5,0x3
80005730:	00f717b3          	sll	a5,a4,a5
80005734:	00a7e533          	or	a0,a5,a0
80005738:	fb9ff06f          	j	800056f0 <hub_print_char+0x274>
8000573c:	00c00793          	li	a5,12
80005740:	00fa0663          	beq	s4,a5,8000574c <hub_print_char+0x2d0>
80005744:	04b00793          	li	a5,75
80005748:	f0fa12e3          	bne	s4,a5,8000564c <hub_print_char+0x1d0>
8000574c:	fff44793          	not	a5,s0
80005750:	00a7f533          	and	a0,a5,a0
80005754:	f9dff06f          	j	800056f0 <hub_print_char+0x274>

80005758 <hub_print>:
80005758:	fb010113          	addi	sp,sp,-80
8000575c:	04812423          	sw	s0,72(sp)
80005760:	04912223          	sw	s1,68(sp)
80005764:	05212023          	sw	s2,64(sp)
80005768:	03312e23          	sw	s3,60(sp)
8000576c:	03412c23          	sw	s4,56(sp)
80005770:	03512a23          	sw	s5,52(sp)
80005774:	03612823          	sw	s6,48(sp)
80005778:	03712623          	sw	s7,44(sp)
8000577c:	03812423          	sw	s8,40(sp)
80005780:	03912223          	sw	s9,36(sp)
80005784:	03a12023          	sw	s10,32(sp)
80005788:	01b12e23          	sw	s11,28(sp)
8000578c:	04112623          	sw	ra,76(sp)
80005790:	00058a13          	mv	s4,a1
80005794:	00068a93          	mv	s5,a3
80005798:	00070993          	mv	s3,a4
8000579c:	00078b13          	mv	s6,a5
800057a0:	00080913          	mv	s2,a6
800057a4:	00088b93          	mv	s7,a7
800057a8:	00050493          	mv	s1,a0
800057ac:	00000413          	li	s0,0
800057b0:	f0054c37          	lui	s8,0xf0054
800057b4:	0ff67d93          	andi	s11,a2,255
800057b8:	05344063          	blt	s0,s3,800057f8 <hub_print+0xa0>
800057bc:	04c12083          	lw	ra,76(sp)
800057c0:	04812403          	lw	s0,72(sp)
800057c4:	04412483          	lw	s1,68(sp)
800057c8:	04012903          	lw	s2,64(sp)
800057cc:	03c12983          	lw	s3,60(sp)
800057d0:	03812a03          	lw	s4,56(sp)
800057d4:	03412a83          	lw	s5,52(sp)
800057d8:	03012b03          	lw	s6,48(sp)
800057dc:	02c12b83          	lw	s7,44(sp)
800057e0:	02812c03          	lw	s8,40(sp)
800057e4:	02412c83          	lw	s9,36(sp)
800057e8:	02012d03          	lw	s10,32(sp)
800057ec:	01c12d83          	lw	s11,28(sp)
800057f0:	05010113          	addi	sp,sp,80
800057f4:	00008067          	ret
800057f8:	000c2883          	lw	a7,0(s8) # f0054000 <_ram_heap_end+0x70042000>
800057fc:	008a85b3          	add	a1,s5,s0
80005800:	01712423          	sw	s7,8(sp)
80005804:	01212223          	sw	s2,4(sp)
80005808:	01612023          	sw	s6,0(sp)
8000580c:	8b01a803          	lw	a6,-1872(gp) # 80003158 <hub_frame_height>
80005810:	8b41a783          	lw	a5,-1868(gp) # 8000315c <hub_frame_width>
80005814:	0005c583          	lbu	a1,0(a1) # 1000 <_stack_size+0x800>
80005818:	00048613          	mv	a2,s1
8000581c:	07f8f893          	andi	a7,a7,127
80005820:	000d8713          	mv	a4,s11
80005824:	000a0693          	mv	a3,s4
80005828:	f0050537          	lui	a0,0xf0050
8000582c:	c51ff0ef          	jal	ra,8000547c <hub_print_char>
80005830:	00140413          	addi	s0,s0,1
80005834:	012484b3          	add	s1,s1,s2
80005838:	f81ff06f          	j	800057b8 <hub_print+0x60>

8000583c <modbus_udp_init>:
8000583c:	ff010113          	addi	sp,sp,-16
80005840:	02e00513          	li	a0,46
80005844:	00912223          	sw	s1,4(sp)
80005848:	00112623          	sw	ra,12(sp)
8000584c:	00812423          	sw	s0,8(sp)
80005850:	3e0030ef          	jal	ra,80008c30 <udp_new_ip_type>
80005854:	8aa1ae23          	sw	a0,-1860(gp) # 80003164 <modbus_udp_pcb>
80005858:	02051663          	bnez	a0,80005884 <modbus_udp_init+0x48>
8000585c:	80003537          	lui	a0,0x80003
80005860:	a4050513          	addi	a0,a0,-1472 # 80002a40 <_ram_heap_end+0xffff0a40>
80005864:	5b1080ef          	jal	ra,8000e614 <iprintf>
80005868:	fff00413          	li	s0,-1
8000586c:	00040513          	mv	a0,s0
80005870:	00c12083          	lw	ra,12(sp)
80005874:	00812403          	lw	s0,8(sp)
80005878:	00412483          	lw	s1,4(sp)
8000587c:	01010113          	addi	sp,sp,16
80005880:	00008067          	ret
80005884:	7d100613          	li	a2,2001
80005888:	84818593          	addi	a1,gp,-1976 # 800030f0 <ip_addr_any>
8000588c:	615020ef          	jal	ra,800086a0 <udp_bind>
80005890:	00050413          	mv	s0,a0
80005894:	00050e63          	beqz	a0,800058b0 <modbus_udp_init+0x74>
80005898:	80003537          	lui	a0,0x80003
8000589c:	a7050513          	addi	a0,a0,-1424 # 80002a70 <_ram_heap_end+0xffff0a70>
800058a0:	575080ef          	jal	ra,8000e614 <iprintf>
800058a4:	8bc1a503          	lw	a0,-1860(gp) # 80003164 <modbus_udp_pcb>
800058a8:	2f4030ef          	jal	ra,80008b9c <udp_remove>
800058ac:	fc1ff06f          	j	8000586c <modbus_udp_init+0x30>
800058b0:	8bc1a503          	lw	a0,-1860(gp) # 80003164 <modbus_udp_pcb>
800058b4:	800065b7          	lui	a1,0x80006
800058b8:	00000613          	li	a2,0
800058bc:	a5858593          	addi	a1,a1,-1448 # 80005a58 <_ram_heap_end+0xffff3a58>
800058c0:	2cc030ef          	jal	ra,80008b8c <udp_recv>
800058c4:	80003537          	lui	a0,0x80003
800058c8:	a9c50513          	addi	a0,a0,-1380 # 80002a9c <_ram_heap_end+0xffff0a9c>
800058cc:	549080ef          	jal	ra,8000e614 <iprintf>
800058d0:	f9dff06f          	j	8000586c <modbus_udp_init+0x30>

800058d4 <modbus_udp_send>:
800058d4:	fd010113          	addi	sp,sp,-48
800058d8:	01412c23          	sw	s4,24(sp)
800058dc:	00168a13          	addi	s4,a3,1
800058e0:	03212023          	sw	s2,32(sp)
800058e4:	00058913          	mv	s2,a1
800058e8:	010a1593          	slli	a1,s4,0x10
800058ec:	01312e23          	sw	s3,28(sp)
800058f0:	01512a23          	sw	s5,20(sp)
800058f4:	00050993          	mv	s3,a0
800058f8:	00060a93          	mv	s5,a2
800058fc:	0105d593          	srli	a1,a1,0x10
80005900:	28000613          	li	a2,640
80005904:	03800513          	li	a0,56
80005908:	02912223          	sw	s1,36(sp)
8000590c:	02112623          	sw	ra,44(sp)
80005910:	02812423          	sw	s0,40(sp)
80005914:	00068493          	mv	s1,a3
80005918:	7a0010ef          	jal	ra,800070b8 <pbuf_alloc>
8000591c:	04051063          	bnez	a0,8000595c <modbus_udp_send+0x88>
80005920:	f0000737          	lui	a4,0xf0000
80005924:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
80005928:	80003537          	lui	a0,0x80003
8000592c:	ab850513          	addi	a0,a0,-1352 # 80002ab8 <_ram_heap_end+0xffff0ab8>
80005930:	ffd7f793          	andi	a5,a5,-3
80005934:	00f72223          	sw	a5,4(a4)
80005938:	02812403          	lw	s0,40(sp)
8000593c:	02c12083          	lw	ra,44(sp)
80005940:	02412483          	lw	s1,36(sp)
80005944:	02012903          	lw	s2,32(sp)
80005948:	01c12983          	lw	s3,28(sp)
8000594c:	01812a03          	lw	s4,24(sp)
80005950:	01412a83          	lw	s5,20(sp)
80005954:	03010113          	addi	sp,sp,48
80005958:	4bd0806f          	j	8000e614 <iprintf>
8000595c:	00452783          	lw	a5,4(a0)
80005960:	00050413          	mv	s0,a0
80005964:	00078663          	beqz	a5,80005970 <modbus_udp_send+0x9c>
80005968:	00a55703          	lhu	a4,10(a0)
8000596c:	05477463          	bgeu	a4,s4,800059b4 <modbus_udp_send+0xe0>
80005970:	f0000737          	lui	a4,0xf0000
80005974:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
80005978:	80003537          	lui	a0,0x80003
8000597c:	ae850513          	addi	a0,a0,-1304 # 80002ae8 <_ram_heap_end+0xffff0ae8>
80005980:	ffd7f793          	andi	a5,a5,-3
80005984:	00f72223          	sw	a5,4(a4)
80005988:	00a45603          	lhu	a2,10(s0)
8000598c:	00442583          	lw	a1,4(s0)
80005990:	02812403          	lw	s0,40(sp)
80005994:	02c12083          	lw	ra,44(sp)
80005998:	02412483          	lw	s1,36(sp)
8000599c:	02012903          	lw	s2,32(sp)
800059a0:	01c12983          	lw	s3,28(sp)
800059a4:	01812a03          	lw	s4,24(sp)
800059a8:	01412a83          	lw	s5,20(sp)
800059ac:	03010113          	addi	sp,sp,48
800059b0:	4650806f          	j	8000e614 <iprintf>
800059b4:	00048613          	mv	a2,s1
800059b8:	000a8593          	mv	a1,s5
800059bc:	00078513          	mv	a0,a5
800059c0:	015080ef          	jal	ra,8000e1d4 <memcpy>
800059c4:	009507b3          	add	a5,a0,s1
800059c8:	00078023          	sb	zero,0(a5)
800059cc:	8bc1a503          	lw	a0,-1860(gp) # 80003164 <modbus_udp_pcb>
800059d0:	00040593          	mv	a1,s0
800059d4:	00090693          	mv	a3,s2
800059d8:	00098613          	mv	a2,s3
800059dc:	7f5020ef          	jal	ra,800089d0 <udp_sendto>
800059e0:	00050593          	mv	a1,a0
800059e4:	04050463          	beqz	a0,80005a2c <modbus_udp_send+0x158>
800059e8:	f0000737          	lui	a4,0xf0000
800059ec:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
800059f0:	80003537          	lui	a0,0x80003
800059f4:	b2050513          	addi	a0,a0,-1248 # 80002b20 <_ram_heap_end+0xffff0b20>
800059f8:	ffd7f793          	andi	a5,a5,-3
800059fc:	00f72223          	sw	a5,4(a4)
80005a00:	415080ef          	jal	ra,8000e614 <iprintf>
80005a04:	00040513          	mv	a0,s0
80005a08:	02812403          	lw	s0,40(sp)
80005a0c:	02c12083          	lw	ra,44(sp)
80005a10:	02412483          	lw	s1,36(sp)
80005a14:	02012903          	lw	s2,32(sp)
80005a18:	01c12983          	lw	s3,28(sp)
80005a1c:	01812a03          	lw	s4,24(sp)
80005a20:	01412a83          	lw	s5,20(sp)
80005a24:	03010113          	addi	sp,sp,48
80005a28:	5bc0106f          	j	80006fe4 <pbuf_free>
80005a2c:	00a45583          	lhu	a1,10(s0)
80005a30:	00098513          	mv	a0,s3
80005a34:	00b12623          	sw	a1,12(sp)
80005a38:	7c9060ef          	jal	ra,8000ca00 <ip4addr_ntoa>
80005a3c:	00c12583          	lw	a1,12(sp)
80005a40:	00050613          	mv	a2,a0
80005a44:	80003537          	lui	a0,0x80003
80005a48:	00090693          	mv	a3,s2
80005a4c:	b5850513          	addi	a0,a0,-1192 # 80002b58 <_ram_heap_end+0xffff0b58>
80005a50:	3c5080ef          	jal	ra,8000e614 <iprintf>
80005a54:	fb1ff06f          	j	80005a04 <modbus_udp_send+0x130>

80005a58 <modbus_udp_recv>:
80005a58:	f6010113          	addi	sp,sp,-160
80005a5c:	08112e23          	sw	ra,156(sp)
80005a60:	08912a23          	sw	s1,148(sp)
80005a64:	09212823          	sw	s2,144(sp)
80005a68:	09312623          	sw	s3,140(sp)
80005a6c:	08812c23          	sw	s0,152(sp)
80005a70:	09412423          	sw	s4,136(sp)
80005a74:	00a65403          	lhu	s0,10(a2) # f005000a <_ram_heap_end+0x7003e00a>
80005a78:	00068513          	mv	a0,a3
80005a7c:	00070993          	mv	s3,a4
80005a80:	00060493          	mv	s1,a2
80005a84:	00462a03          	lw	s4,4(a2)
80005a88:	00068913          	mv	s2,a3
80005a8c:	775060ef          	jal	ra,8000ca00 <ip4addr_ntoa>
80005a90:	00050593          	mv	a1,a0
80005a94:	80003537          	lui	a0,0x80003
80005a98:	00040693          	mv	a3,s0
80005a9c:	00098613          	mv	a2,s3
80005aa0:	b8450513          	addi	a0,a0,-1148 # 80002b84 <_ram_heap_end+0xffff0b84>
80005aa4:	371080ef          	jal	ra,8000e614 <iprintf>
80005aa8:	00040593          	mv	a1,s0
80005aac:	00010613          	mv	a2,sp
80005ab0:	000a0513          	mv	a0,s4
80005ab4:	d79fe0ef          	jal	ra,8000482c <modbus_recv>
80005ab8:	00050413          	mv	s0,a0
80005abc:	00048513          	mv	a0,s1
80005ac0:	524010ef          	jal	ra,80006fe4 <pbuf_free>
80005ac4:	02040463          	beqz	s0,80005aec <modbus_udp_recv+0x94>
80005ac8:	80003537          	lui	a0,0x80003
80005acc:	00040593          	mv	a1,s0
80005ad0:	bb050513          	addi	a0,a0,-1104 # 80002bb0 <_ram_heap_end+0xffff0bb0>
80005ad4:	341080ef          	jal	ra,8000e614 <iprintf>
80005ad8:	00040693          	mv	a3,s0
80005adc:	00010613          	mv	a2,sp
80005ae0:	00098593          	mv	a1,s3
80005ae4:	00090513          	mv	a0,s2
80005ae8:	dedff0ef          	jal	ra,800058d4 <modbus_udp_send>
80005aec:	09c12083          	lw	ra,156(sp)
80005af0:	09812403          	lw	s0,152(sp)
80005af4:	09412483          	lw	s1,148(sp)
80005af8:	09012903          	lw	s2,144(sp)
80005afc:	08c12983          	lw	s3,140(sp)
80005b00:	08812a03          	lw	s4,136(sp)
80005b04:	0a010113          	addi	sp,sp,160
80005b08:	00008067          	ret

80005b0c <i2c_init>:
80005b0c:	0fa00793          	li	a5,250
80005b10:	00f52423          	sw	a5,8(a0)
80005b14:	00008067          	ret

80005b18 <i2c_wait_for_busy>:
80005b18:	00000793          	li	a5,0
80005b1c:	00b7c663          	blt	a5,a1,80005b28 <i2c_wait_for_busy+0x10>
80005b20:	00000513          	li	a0,0
80005b24:	00008067          	ret
80005b28:	00c52703          	lw	a4,12(a0)
80005b2c:	00277713          	andi	a4,a4,2
80005b30:	00071663          	bnez	a4,80005b3c <i2c_wait_for_busy+0x24>
80005b34:	00178793          	addi	a5,a5,1
80005b38:	fe5ff06f          	j	80005b1c <i2c_wait_for_busy+0x4>
80005b3c:	00100513          	li	a0,1
80005b40:	00008067          	ret

80005b44 <i2c_wait_for_release>:
80005b44:	00000793          	li	a5,0
80005b48:	00b7c663          	blt	a5,a1,80005b54 <i2c_wait_for_release+0x10>
80005b4c:	00000513          	li	a0,0
80005b50:	00008067          	ret
80005b54:	00c52703          	lw	a4,12(a0)
80005b58:	00277713          	andi	a4,a4,2
80005b5c:	00070663          	beqz	a4,80005b68 <i2c_wait_for_release+0x24>
80005b60:	00178793          	addi	a5,a5,1
80005b64:	fe5ff06f          	j	80005b48 <i2c_wait_for_release+0x4>
80005b68:	00100513          	li	a0,1
80005b6c:	00008067          	ret

80005b70 <__malloc_lock>:
80005b70:	00008067          	ret

80005b74 <__malloc_unlock>:
80005b74:	00008067          	ret

80005b78 <init_sbrk>:
80005b78:	02051463          	bnez	a0,80005ba0 <init_sbrk+0x28>
80005b7c:	80011737          	lui	a4,0x80011
80005b80:	46070713          	addi	a4,a4,1120 # 80011460 <_ram_heap_end+0xfffff460>
80005b84:	8ce1a223          	sw	a4,-1852(gp) # 8000316c <heap_start>
80005b88:	80012737          	lui	a4,0x80012
80005b8c:	00070713          	mv	a4,a4
80005b90:	8ce1a023          	sw	a4,-1856(gp) # 80003168 <heap_end>
80005b94:	8c41a703          	lw	a4,-1852(gp) # 8000316c <heap_start>
80005b98:	8ce1a423          	sw	a4,-1848(gp) # 80003170 <sbrk_heap_end>
80005b9c:	00008067          	ret
80005ba0:	00259593          	slli	a1,a1,0x2
80005ba4:	8ca1a223          	sw	a0,-1852(gp) # 8000316c <heap_start>
80005ba8:	00b50533          	add	a0,a0,a1
80005bac:	8ca1a023          	sw	a0,-1856(gp) # 80003168 <heap_end>
80005bb0:	fe5ff06f          	j	80005b94 <init_sbrk+0x1c>

80005bb4 <delay>:
80005bb4:	00000793          	li	a5,0
80005bb8:	00a79463          	bne	a5,a0,80005bc0 <delay+0xc>
80005bbc:	00008067          	ret
80005bc0:	00060613          	mv	a2,a2
80005bc4:	00178793          	addi	a5,a5,1
80005bc8:	ff1ff06f          	j	80005bb8 <delay+0x4>

80005bcc <delay_us>:
80005bcc:	f00b07b7          	lui	a5,0xf00b0
80005bd0:	0007a803          	lw	a6,0(a5) # f00b0000 <_ram_heap_end+0x7009e000>
80005bd4:	0047a883          	lw	a7,4(a5)
80005bd8:	f00b0637          	lui	a2,0xf00b0
80005bdc:	00062303          	lw	t1,0(a2) # f00b0000 <_ram_heap_end+0x7009e000>
80005be0:	00462383          	lw	t2,4(a2)
80005be4:	410306b3          	sub	a3,t1,a6
80005be8:	00d33733          	sltu	a4,t1,a3
80005bec:	411387b3          	sub	a5,t2,a7
80005bf0:	00e79463          	bne	a5,a4,80005bf8 <delay_us+0x2c>
80005bf4:	fea6e4e3          	bltu	a3,a0,80005bdc <delay_us+0x10>
80005bf8:	00008067          	ret

80005bfc <print_uart0>:
80005bfc:	f00106b7          	lui	a3,0xf0010
80005c00:	00054703          	lbu	a4,0(a0)
80005c04:	00071463          	bnez	a4,80005c0c <print_uart0+0x10>
80005c08:	00008067          	ret
80005c0c:	0046a783          	lw	a5,4(a3) # f0010004 <_ram_heap_end+0x6fffe004>
80005c10:	0107d793          	srli	a5,a5,0x10
80005c14:	0ff7f793          	andi	a5,a5,255
80005c18:	fe078ae3          	beqz	a5,80005c0c <print_uart0+0x10>
80005c1c:	00e6a023          	sw	a4,0(a3)
80005c20:	00150513          	addi	a0,a0,1
80005c24:	fddff06f          	j	80005c00 <print_uart0+0x4>

80005c28 <_sbrk>:
80005c28:	8c81a783          	lw	a5,-1848(gp) # 80003170 <sbrk_heap_end>
80005c2c:	02079063          	bnez	a5,80005c4c <_sbrk+0x24>
80005c30:	800117b7          	lui	a5,0x80011
80005c34:	46078793          	addi	a5,a5,1120 # 80011460 <_ram_heap_end+0xfffff460>
80005c38:	8cf1a223          	sw	a5,-1852(gp) # 8000316c <heap_start>
80005c3c:	80012737          	lui	a4,0x80012
80005c40:	00070713          	mv	a4,a4
80005c44:	8ce1a023          	sw	a4,-1856(gp) # 80003168 <heap_end>
80005c48:	8cf1a423          	sw	a5,-1848(gp) # 80003170 <sbrk_heap_end>
80005c4c:	8c81a683          	lw	a3,-1848(gp) # 80003170 <sbrk_heap_end>
80005c50:	8c01a703          	lw	a4,-1856(gp) # 80003168 <heap_end>
80005c54:	00a687b3          	add	a5,a3,a0
80005c58:	04e7e063          	bltu	a5,a4,80005c98 <_sbrk+0x70>
80005c5c:	f7010113          	addi	sp,sp,-144
80005c60:	80003637          	lui	a2,0x80003
80005c64:	00050793          	mv	a5,a0
80005c68:	be060613          	addi	a2,a2,-1056 # 80002be0 <_ram_heap_end+0xffff0be0>
80005c6c:	08000593          	li	a1,128
80005c70:	00010513          	mv	a0,sp
80005c74:	08112623          	sw	ra,140(sp)
80005c78:	46d080ef          	jal	ra,8000e8e4 <sniprintf>
80005c7c:	00010513          	mv	a0,sp
80005c80:	f7dff0ef          	jal	ra,80005bfc <print_uart0>
80005c84:	08c12083          	lw	ra,140(sp)
80005c88:	fff00693          	li	a3,-1
80005c8c:	00068513          	mv	a0,a3
80005c90:	09010113          	addi	sp,sp,144
80005c94:	00008067          	ret
80005c98:	8cf1a423          	sw	a5,-1848(gp) # 80003170 <sbrk_heap_end>
80005c9c:	00068513          	mv	a0,a3
80005ca0:	00008067          	ret

80005ca4 <print_uart1>:
80005ca4:	f00116b7          	lui	a3,0xf0011
80005ca8:	00054703          	lbu	a4,0(a0)
80005cac:	00071463          	bnez	a4,80005cb4 <print_uart1+0x10>
80005cb0:	00008067          	ret
80005cb4:	0046a783          	lw	a5,4(a3) # f0011004 <_ram_heap_end+0x6ffff004>
80005cb8:	0107d793          	srli	a5,a5,0x10
80005cbc:	0ff7f793          	andi	a5,a5,255
80005cc0:	fe078ae3          	beqz	a5,80005cb4 <print_uart1+0x10>
80005cc4:	00e6a023          	sw	a4,0(a3)
80005cc8:	00150513          	addi	a0,a0,1
80005ccc:	fddff06f          	j	80005ca8 <print_uart1+0x4>

80005cd0 <_write>:
80005cd0:	00c586b3          	add	a3,a1,a2
80005cd4:	f0010737          	lui	a4,0xf0010
80005cd8:	00d59663          	bne	a1,a3,80005ce4 <_write+0x14>
80005cdc:	00060513          	mv	a0,a2
80005ce0:	00008067          	ret
80005ce4:	00158593          	addi	a1,a1,1
80005ce8:	fff5c503          	lbu	a0,-1(a1)
80005cec:	00472783          	lw	a5,4(a4) # f0010004 <_ram_heap_end+0x6fffe004>
80005cf0:	0107d793          	srli	a5,a5,0x10
80005cf4:	0ff7f793          	andi	a5,a5,255
80005cf8:	fe078ae3          	beqz	a5,80005cec <_write+0x1c>
80005cfc:	00a72023          	sw	a0,0(a4)
80005d00:	fd9ff06f          	j	80005cd8 <_write+0x8>

80005d04 <_read>:
80005d04:	00100513          	li	a0,1
80005d08:	00008067          	ret

80005d0c <_close>:
80005d0c:	fff00513          	li	a0,-1
80005d10:	00008067          	ret

80005d14 <_lseek>:
80005d14:	00000513          	li	a0,0
80005d18:	00008067          	ret

80005d1c <_isatty>:
80005d1c:	00100513          	li	a0,1
80005d20:	00008067          	ret

80005d24 <_fstat>:
80005d24:	000027b7          	lui	a5,0x2
80005d28:	00f5a223          	sw	a5,4(a1)
80005d2c:	00000513          	li	a0,0
80005d30:	00008067          	ret

80005d34 <_kill>:
80005d34:	00008067          	ret

80005d38 <_getpid>:
80005d38:	fff00513          	li	a0,-1
80005d3c:	00008067          	ret

80005d40 <hard_reboot>:
80005d40:	80003537          	lui	a0,0x80003
80005d44:	ff010113          	addi	sp,sp,-16
80005d48:	c2450513          	addi	a0,a0,-988 # 80002c24 <_ram_heap_end+0xffff0c24>
80005d4c:	00112623          	sw	ra,12(sp)
80005d50:	eadff0ef          	jal	ra,80005bfc <print_uart0>
80005d54:	3e800513          	li	a0,1000
80005d58:	e75ff0ef          	jal	ra,80005bcc <delay_us>
80005d5c:	f00a07b7          	lui	a5,0xf00a0
80005d60:	00100713          	li	a4,1
80005d64:	00e7a423          	sw	a4,8(a5) # f00a0008 <_ram_heap_end+0x7008e008>
80005d68:	00c12083          	lw	ra,12(sp)
80005d6c:	01010113          	addi	sp,sp,16
80005d70:	00008067          	ret

80005d74 <memcpy_rev>:
80005d74:	00000793          	li	a5,0
80005d78:	00f61463          	bne	a2,a5,80005d80 <memcpy_rev+0xc>
80005d7c:	00008067          	ret
80005d80:	40f58733          	sub	a4,a1,a5
80005d84:	00074683          	lbu	a3,0(a4)
80005d88:	00f50733          	add	a4,a0,a5
80005d8c:	00178793          	addi	a5,a5,1
80005d90:	00d70023          	sb	a3,0(a4)
80005d94:	fe5ff06f          	j	80005d78 <memcpy_rev+0x4>

80005d98 <lwip_init>:
80005d98:	ff010113          	addi	sp,sp,-16
80005d9c:	00112623          	sw	ra,12(sp)
80005da0:	340020ef          	jal	ra,800080e0 <stats_init>
80005da4:	015000ef          	jal	ra,800065b8 <mem_init>
80005da8:	141000ef          	jal	ra,800066e8 <memp_init>
80005dac:	27d000ef          	jal	ra,80006828 <netif_init>
80005db0:	618020ef          	jal	ra,800083c8 <udp_init>
80005db4:	00c12083          	lw	ra,12(sp)
80005db8:	01010113          	addi	sp,sp,16
80005dbc:	4500206f          	j	8000820c <sys_timeouts_init>

80005dc0 <lwip_htons>:
80005dc0:	00851793          	slli	a5,a0,0x8
80005dc4:	00855513          	srli	a0,a0,0x8
80005dc8:	00a7e533          	or	a0,a5,a0
80005dcc:	01051513          	slli	a0,a0,0x10
80005dd0:	01055513          	srli	a0,a0,0x10
80005dd4:	00008067          	ret

80005dd8 <lwip_htonl>:
80005dd8:	01855713          	srli	a4,a0,0x18
80005ddc:	01851793          	slli	a5,a0,0x18
80005de0:	00e7e7b3          	or	a5,a5,a4
80005de4:	00ff06b7          	lui	a3,0xff0
80005de8:	00851713          	slli	a4,a0,0x8
80005dec:	00d77733          	and	a4,a4,a3
80005df0:	00e7e7b3          	or	a5,a5,a4
80005df4:	00010737          	lui	a4,0x10
80005df8:	f0070713          	addi	a4,a4,-256 # ff00 <_stack_size+0xf700>
80005dfc:	00855513          	srli	a0,a0,0x8
80005e00:	00e57533          	and	a0,a0,a4
80005e04:	00a7e533          	or	a0,a5,a0
80005e08:	00008067          	ret

80005e0c <lwip_strnstr>:
80005e0c:	fe010113          	addi	sp,sp,-32
80005e10:	00812c23          	sw	s0,24(sp)
80005e14:	00050413          	mv	s0,a0
80005e18:	00058513          	mv	a0,a1
80005e1c:	00912a23          	sw	s1,20(sp)
80005e20:	01312623          	sw	s3,12(sp)
80005e24:	00112e23          	sw	ra,28(sp)
80005e28:	01212823          	sw	s2,16(sp)
80005e2c:	00058993          	mv	s3,a1
80005e30:	00060493          	mv	s1,a2
80005e34:	57d080ef          	jal	ra,8000ebb0 <strlen>
80005e38:	02050063          	beqz	a0,80005e58 <lwip_strnstr+0x4c>
80005e3c:	00050913          	mv	s2,a0
80005e40:	009404b3          	add	s1,s0,s1
80005e44:	00044783          	lbu	a5,0(s0)
80005e48:	00078663          	beqz	a5,80005e54 <lwip_strnstr+0x48>
80005e4c:	01240733          	add	a4,s0,s2
80005e50:	02e4f463          	bgeu	s1,a4,80005e78 <lwip_strnstr+0x6c>
80005e54:	00000413          	li	s0,0
80005e58:	00040513          	mv	a0,s0
80005e5c:	01c12083          	lw	ra,28(sp)
80005e60:	01812403          	lw	s0,24(sp)
80005e64:	01412483          	lw	s1,20(sp)
80005e68:	01012903          	lw	s2,16(sp)
80005e6c:	00c12983          	lw	s3,12(sp)
80005e70:	02010113          	addi	sp,sp,32
80005e74:	00008067          	ret
80005e78:	0009c703          	lbu	a4,0(s3)
80005e7c:	00f71c63          	bne	a4,a5,80005e94 <lwip_strnstr+0x88>
80005e80:	00090613          	mv	a2,s2
80005e84:	00098593          	mv	a1,s3
80005e88:	00040513          	mv	a0,s0
80005e8c:	541080ef          	jal	ra,8000ebcc <strncmp>
80005e90:	fc0504e3          	beqz	a0,80005e58 <lwip_strnstr+0x4c>
80005e94:	00140413          	addi	s0,s0,1
80005e98:	fadff06f          	j	80005e44 <lwip_strnstr+0x38>

80005e9c <lwip_stricmp>:
80005e9c:	01900813          	li	a6,25
80005ea0:	00150513          	addi	a0,a0,1
80005ea4:	00158593          	addi	a1,a1,1
80005ea8:	fff54703          	lbu	a4,-1(a0)
80005eac:	fff5c783          	lbu	a5,-1(a1)
80005eb0:	00f70e63          	beq	a4,a5,80005ecc <lwip_stricmp+0x30>
80005eb4:	02076613          	ori	a2,a4,32
80005eb8:	f9f60693          	addi	a3,a2,-97
80005ebc:	0ff6f693          	andi	a3,a3,255
80005ec0:	00d86c63          	bltu	a6,a3,80005ed8 <lwip_stricmp+0x3c>
80005ec4:	0207e793          	ori	a5,a5,32
80005ec8:	00f61863          	bne	a2,a5,80005ed8 <lwip_stricmp+0x3c>
80005ecc:	fc071ae3          	bnez	a4,80005ea0 <lwip_stricmp+0x4>
80005ed0:	00000513          	li	a0,0
80005ed4:	00008067          	ret
80005ed8:	00100513          	li	a0,1
80005edc:	00008067          	ret

80005ee0 <lwip_strnicmp>:
80005ee0:	fff60613          	addi	a2,a2,-1
80005ee4:	00000793          	li	a5,0
80005ee8:	01900313          	li	t1,25
80005eec:	00f50733          	add	a4,a0,a5
80005ef0:	00074683          	lbu	a3,0(a4)
80005ef4:	00f58733          	add	a4,a1,a5
80005ef8:	00074703          	lbu	a4,0(a4)
80005efc:	00e68e63          	beq	a3,a4,80005f18 <lwip_strnicmp+0x38>
80005f00:	0206e893          	ori	a7,a3,32
80005f04:	f9f88813          	addi	a6,a7,-97
80005f08:	0ff87813          	andi	a6,a6,255
80005f0c:	03036063          	bltu	t1,a6,80005f2c <lwip_strnicmp+0x4c>
80005f10:	02076713          	ori	a4,a4,32
80005f14:	00e89c63          	bne	a7,a4,80005f2c <lwip_strnicmp+0x4c>
80005f18:	00f60663          	beq	a2,a5,80005f24 <lwip_strnicmp+0x44>
80005f1c:	00178793          	addi	a5,a5,1
80005f20:	fc0696e3          	bnez	a3,80005eec <lwip_strnicmp+0xc>
80005f24:	00000513          	li	a0,0
80005f28:	00008067          	ret
80005f2c:	00100513          	li	a0,1
80005f30:	00008067          	ret

80005f34 <lwip_itoa>:
80005f34:	fe010113          	addi	sp,sp,-32
80005f38:	01212823          	sw	s2,16(sp)
80005f3c:	01412423          	sw	s4,8(sp)
80005f40:	00112e23          	sw	ra,28(sp)
80005f44:	00812c23          	sw	s0,24(sp)
80005f48:	00912a23          	sw	s1,20(sp)
80005f4c:	01312623          	sw	s3,12(sp)
80005f50:	00100793          	li	a5,1
80005f54:	00050913          	mv	s2,a0
80005f58:	00058a13          	mv	s4,a1
80005f5c:	02b7e663          	bltu	a5,a1,80005f88 <lwip_itoa+0x54>
80005f60:	00f59463          	bne	a1,a5,80005f68 <lwip_itoa+0x34>
80005f64:	00090023          	sb	zero,0(s2)
80005f68:	01c12083          	lw	ra,28(sp)
80005f6c:	01812403          	lw	s0,24(sp)
80005f70:	01412483          	lw	s1,20(sp)
80005f74:	01012903          	lw	s2,16(sp)
80005f78:	00c12983          	lw	s3,12(sp)
80005f7c:	00812a03          	lw	s4,8(sp)
80005f80:	02010113          	addi	sp,sp,32
80005f84:	00008067          	ret
80005f88:	00050993          	mv	s3,a0
80005f8c:	00065863          	bgez	a2,80005f9c <lwip_itoa+0x68>
80005f90:	02d00793          	li	a5,45
80005f94:	00150993          	addi	s3,a0,1
80005f98:	00f50023          	sb	a5,0(a0)
80005f9c:	41f65793          	srai	a5,a2,0x1f
80005fa0:	fffa0413          	addi	s0,s4,-1
80005fa4:	00890433          	add	s0,s2,s0
80005fa8:	00c7c4b3          	xor	s1,a5,a2
80005fac:	40f484b3          	sub	s1,s1,a5
80005fb0:	00040023          	sb	zero,0(s0)
80005fb4:	04048263          	beqz	s1,80005ff8 <lwip_itoa+0xc4>
80005fb8:	fa89f6e3          	bgeu	s3,s0,80005f64 <lwip_itoa+0x30>
80005fbc:	00a00593          	li	a1,10
80005fc0:	00048513          	mv	a0,s1
80005fc4:	410070ef          	jal	ra,8000d3d4 <__modsi3>
80005fc8:	03050513          	addi	a0,a0,48
80005fcc:	fff40413          	addi	s0,s0,-1
80005fd0:	00a40023          	sb	a0,0(s0)
80005fd4:	00a00593          	li	a1,10
80005fd8:	00048513          	mv	a0,s1
80005fdc:	374070ef          	jal	ra,8000d350 <__divsi3>
80005fe0:	00050493          	mv	s1,a0
80005fe4:	fd1ff06f          	j	80005fb4 <lwip_itoa+0x80>
80005fe8:	03000793          	li	a5,48
80005fec:	00f98023          	sb	a5,0(s3)
80005ff0:	000980a3          	sb	zero,1(s3)
80005ff4:	f75ff06f          	j	80005f68 <lwip_itoa+0x34>
80005ff8:	00044783          	lbu	a5,0(s0)
80005ffc:	fe0786e3          	beqz	a5,80005fe8 <lwip_itoa+0xb4>
80006000:	01490633          	add	a2,s2,s4
80006004:	40860633          	sub	a2,a2,s0
80006008:	00040593          	mv	a1,s0
8000600c:	01812403          	lw	s0,24(sp)
80006010:	01c12083          	lw	ra,28(sp)
80006014:	01412483          	lw	s1,20(sp)
80006018:	01012903          	lw	s2,16(sp)
8000601c:	00812a03          	lw	s4,8(sp)
80006020:	00098513          	mv	a0,s3
80006024:	00c12983          	lw	s3,12(sp)
80006028:	02010113          	addi	sp,sp,32
8000602c:	2800806f          	j	8000e2ac <memmove>

80006030 <lwip_standard_chksum>:
80006030:	ff010113          	addi	sp,sp,-16
80006034:	00011723          	sh	zero,14(sp)
80006038:	00157693          	andi	a3,a0,1
8000603c:	00068c63          	beqz	a3,80006054 <lwip_standard_chksum+0x24>
80006040:	00b05a63          	blez	a1,80006054 <lwip_standard_chksum+0x24>
80006044:	00054783          	lbu	a5,0(a0)
80006048:	fff58593          	addi	a1,a1,-1
8000604c:	00150513          	addi	a0,a0,1
80006050:	00f107a3          	sb	a5,15(sp)
80006054:	00000793          	li	a5,0
80006058:	00100713          	li	a4,1
8000605c:	06b74063          	blt	a4,a1,800060bc <lwip_standard_chksum+0x8c>
80006060:	00e59663          	bne	a1,a4,8000606c <lwip_standard_chksum+0x3c>
80006064:	00054703          	lbu	a4,0(a0)
80006068:	00e10723          	sb	a4,14(sp)
8000606c:	00e15503          	lhu	a0,14(sp)
80006070:	00010737          	lui	a4,0x10
80006074:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
80006078:	00f50533          	add	a0,a0,a5
8000607c:	01055793          	srli	a5,a0,0x10
80006080:	00e57533          	and	a0,a0,a4
80006084:	00a787b3          	add	a5,a5,a0
80006088:	0107d513          	srli	a0,a5,0x10
8000608c:	00e7f7b3          	and	a5,a5,a4
80006090:	00f50533          	add	a0,a0,a5
80006094:	00068c63          	beqz	a3,800060ac <lwip_standard_chksum+0x7c>
80006098:	00851793          	slli	a5,a0,0x8
8000609c:	00855513          	srli	a0,a0,0x8
800060a0:	00e7f733          	and	a4,a5,a4
800060a4:	0ff57513          	andi	a0,a0,255
800060a8:	00a76533          	or	a0,a4,a0
800060ac:	01051513          	slli	a0,a0,0x10
800060b0:	01055513          	srli	a0,a0,0x10
800060b4:	01010113          	addi	sp,sp,16
800060b8:	00008067          	ret
800060bc:	00250513          	addi	a0,a0,2
800060c0:	ffe55603          	lhu	a2,-2(a0)
800060c4:	ffe58593          	addi	a1,a1,-2
800060c8:	00c787b3          	add	a5,a5,a2
800060cc:	f91ff06f          	j	8000605c <lwip_standard_chksum+0x2c>

800060d0 <inet_chksum_pseudo>:
800060d0:	fe010113          	addi	sp,sp,-32
800060d4:	00812c23          	sw	s0,24(sp)
800060d8:	00912a23          	sw	s1,20(sp)
800060dc:	01212823          	sw	s2,16(sp)
800060e0:	01312623          	sw	s3,12(sp)
800060e4:	01412423          	sw	s4,8(sp)
800060e8:	01512223          	sw	s5,4(sp)
800060ec:	00112e23          	sw	ra,28(sp)
800060f0:	00072703          	lw	a4,0(a4)
800060f4:	0006a683          	lw	a3,0(a3) # ff0000 <_stack_size+0xfef800>
800060f8:	000107b7          	lui	a5,0x10
800060fc:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80006100:	00f77433          	and	s0,a4,a5
80006104:	01075713          	srli	a4,a4,0x10
80006108:	00e40433          	add	s0,s0,a4
8000610c:	00f6f733          	and	a4,a3,a5
80006110:	00e40433          	add	s0,s0,a4
80006114:	0106d693          	srli	a3,a3,0x10
80006118:	008686b3          	add	a3,a3,s0
8000611c:	0106d413          	srli	s0,a3,0x10
80006120:	00f6f6b3          	and	a3,a3,a5
80006124:	00d406b3          	add	a3,s0,a3
80006128:	0106d413          	srli	s0,a3,0x10
8000612c:	00f6f6b3          	and	a3,a3,a5
80006130:	00050993          	mv	s3,a0
80006134:	00058a13          	mv	s4,a1
80006138:	00060913          	mv	s2,a2
8000613c:	00d40433          	add	s0,s0,a3
80006140:	00000a93          	li	s5,0
80006144:	00078493          	mv	s1,a5
80006148:	08099863          	bnez	s3,800061d8 <inet_chksum_pseudo+0x108>
8000614c:	020a8063          	beqz	s5,8000616c <inet_chksum_pseudo+0x9c>
80006150:	00010737          	lui	a4,0x10
80006154:	00841793          	slli	a5,s0,0x8
80006158:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
8000615c:	00845413          	srli	s0,s0,0x8
80006160:	00e7f7b3          	and	a5,a5,a4
80006164:	0ff47413          	andi	s0,s0,255
80006168:	0087e433          	or	s0,a5,s0
8000616c:	000a0513          	mv	a0,s4
80006170:	c51ff0ef          	jal	ra,80005dc0 <lwip_htons>
80006174:	00050493          	mv	s1,a0
80006178:	00090513          	mv	a0,s2
8000617c:	c45ff0ef          	jal	ra,80005dc0 <lwip_htons>
80006180:	00a48533          	add	a0,s1,a0
80006184:	000107b7          	lui	a5,0x10
80006188:	00850433          	add	s0,a0,s0
8000618c:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80006190:	01045513          	srli	a0,s0,0x10
80006194:	00f47433          	and	s0,s0,a5
80006198:	00850433          	add	s0,a0,s0
8000619c:	01045513          	srli	a0,s0,0x10
800061a0:	00f47433          	and	s0,s0,a5
800061a4:	00850433          	add	s0,a0,s0
800061a8:	fff44513          	not	a0,s0
800061ac:	01c12083          	lw	ra,28(sp)
800061b0:	01812403          	lw	s0,24(sp)
800061b4:	01051513          	slli	a0,a0,0x10
800061b8:	01412483          	lw	s1,20(sp)
800061bc:	01012903          	lw	s2,16(sp)
800061c0:	00c12983          	lw	s3,12(sp)
800061c4:	00812a03          	lw	s4,8(sp)
800061c8:	00412a83          	lw	s5,4(sp)
800061cc:	01055513          	srli	a0,a0,0x10
800061d0:	02010113          	addi	sp,sp,32
800061d4:	00008067          	ret
800061d8:	00a9d583          	lhu	a1,10(s3)
800061dc:	0049a503          	lw	a0,4(s3)
800061e0:	e51ff0ef          	jal	ra,80006030 <lwip_standard_chksum>
800061e4:	00850433          	add	s0,a0,s0
800061e8:	01045793          	srli	a5,s0,0x10
800061ec:	00947433          	and	s0,s0,s1
800061f0:	00878433          	add	s0,a5,s0
800061f4:	00a9d783          	lhu	a5,10(s3)
800061f8:	0017f793          	andi	a5,a5,1
800061fc:	00078e63          	beqz	a5,80006218 <inet_chksum_pseudo+0x148>
80006200:	00841793          	slli	a5,s0,0x8
80006204:	00845413          	srli	s0,s0,0x8
80006208:	0097f7b3          	and	a5,a5,s1
8000620c:	0ff47413          	andi	s0,s0,255
80006210:	001aca93          	xori	s5,s5,1
80006214:	0087e433          	or	s0,a5,s0
80006218:	0009a983          	lw	s3,0(s3)
8000621c:	f2dff06f          	j	80006148 <inet_chksum_pseudo+0x78>

80006220 <ip_chksum_pseudo>:
80006220:	eb1ff06f          	j	800060d0 <inet_chksum_pseudo>

80006224 <inet_chksum_pseudo_partial>:
80006224:	fd010113          	addi	sp,sp,-48
80006228:	02812423          	sw	s0,40(sp)
8000622c:	02912223          	sw	s1,36(sp)
80006230:	03212023          	sw	s2,32(sp)
80006234:	01412c23          	sw	s4,24(sp)
80006238:	01512a23          	sw	s5,20(sp)
8000623c:	01612823          	sw	s6,16(sp)
80006240:	02112623          	sw	ra,44(sp)
80006244:	01312e23          	sw	s3,28(sp)
80006248:	00060913          	mv	s2,a2
8000624c:	0007a603          	lw	a2,0(a5)
80006250:	00072703          	lw	a4,0(a4)
80006254:	000107b7          	lui	a5,0x10
80006258:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
8000625c:	00f67433          	and	s0,a2,a5
80006260:	01065613          	srli	a2,a2,0x10
80006264:	00c40433          	add	s0,s0,a2
80006268:	00f77633          	and	a2,a4,a5
8000626c:	00c40433          	add	s0,s0,a2
80006270:	01075713          	srli	a4,a4,0x10
80006274:	00870733          	add	a4,a4,s0
80006278:	01075413          	srli	s0,a4,0x10
8000627c:	00f77733          	and	a4,a4,a5
80006280:	00e40733          	add	a4,s0,a4
80006284:	01075413          	srli	s0,a4,0x10
80006288:	00f77733          	and	a4,a4,a5
8000628c:	00050a13          	mv	s4,a0
80006290:	00058a93          	mv	s5,a1
80006294:	00e40433          	add	s0,s0,a4
80006298:	00000b13          	li	s6,0
8000629c:	00078493          	mv	s1,a5
800062a0:	060a1c63          	bnez	s4,80006318 <inet_chksum_pseudo_partial+0xf4>
800062a4:	0e0b1663          	bnez	s6,80006390 <inet_chksum_pseudo_partial+0x16c>
800062a8:	000a8513          	mv	a0,s5
800062ac:	b15ff0ef          	jal	ra,80005dc0 <lwip_htons>
800062b0:	00050493          	mv	s1,a0
800062b4:	00090513          	mv	a0,s2
800062b8:	b09ff0ef          	jal	ra,80005dc0 <lwip_htons>
800062bc:	00a48533          	add	a0,s1,a0
800062c0:	000107b7          	lui	a5,0x10
800062c4:	00850433          	add	s0,a0,s0
800062c8:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
800062cc:	01045513          	srli	a0,s0,0x10
800062d0:	00f47433          	and	s0,s0,a5
800062d4:	00850433          	add	s0,a0,s0
800062d8:	01045513          	srli	a0,s0,0x10
800062dc:	00f47433          	and	s0,s0,a5
800062e0:	00850433          	add	s0,a0,s0
800062e4:	fff44513          	not	a0,s0
800062e8:	02c12083          	lw	ra,44(sp)
800062ec:	02812403          	lw	s0,40(sp)
800062f0:	01051513          	slli	a0,a0,0x10
800062f4:	02412483          	lw	s1,36(sp)
800062f8:	02012903          	lw	s2,32(sp)
800062fc:	01c12983          	lw	s3,28(sp)
80006300:	01812a03          	lw	s4,24(sp)
80006304:	01412a83          	lw	s5,20(sp)
80006308:	01012b03          	lw	s6,16(sp)
8000630c:	01055513          	srli	a0,a0,0x10
80006310:	03010113          	addi	sp,sp,48
80006314:	00008067          	ret
80006318:	f80686e3          	beqz	a3,800062a4 <inet_chksum_pseudo_partial+0x80>
8000631c:	00aa5783          	lhu	a5,10(s4)
80006320:	00078993          	mv	s3,a5
80006324:	00f6f463          	bgeu	a3,a5,8000632c <inet_chksum_pseudo_partial+0x108>
80006328:	00068993          	mv	s3,a3
8000632c:	01099993          	slli	s3,s3,0x10
80006330:	004a2503          	lw	a0,4(s4)
80006334:	0109d993          	srli	s3,s3,0x10
80006338:	00098593          	mv	a1,s3
8000633c:	00d12623          	sw	a3,12(sp)
80006340:	cf1ff0ef          	jal	ra,80006030 <lwip_standard_chksum>
80006344:	00850433          	add	s0,a0,s0
80006348:	01045793          	srli	a5,s0,0x10
8000634c:	00c12683          	lw	a3,12(sp)
80006350:	00947433          	and	s0,s0,s1
80006354:	00878433          	add	s0,a5,s0
80006358:	00aa5783          	lhu	a5,10(s4)
8000635c:	413689b3          	sub	s3,a3,s3
80006360:	01099693          	slli	a3,s3,0x10
80006364:	0017f793          	andi	a5,a5,1
80006368:	0106d693          	srli	a3,a3,0x10
8000636c:	00078e63          	beqz	a5,80006388 <inet_chksum_pseudo_partial+0x164>
80006370:	00841793          	slli	a5,s0,0x8
80006374:	00845413          	srli	s0,s0,0x8
80006378:	0097f7b3          	and	a5,a5,s1
8000637c:	0ff47413          	andi	s0,s0,255
80006380:	001b4b13          	xori	s6,s6,1
80006384:	0087e433          	or	s0,a5,s0
80006388:	000a2a03          	lw	s4,0(s4)
8000638c:	f15ff06f          	j	800062a0 <inet_chksum_pseudo_partial+0x7c>
80006390:	00010737          	lui	a4,0x10
80006394:	00841793          	slli	a5,s0,0x8
80006398:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
8000639c:	00845413          	srli	s0,s0,0x8
800063a0:	00e7f7b3          	and	a5,a5,a4
800063a4:	0ff47413          	andi	s0,s0,255
800063a8:	0087e433          	or	s0,a5,s0
800063ac:	efdff06f          	j	800062a8 <inet_chksum_pseudo_partial+0x84>

800063b0 <ip_chksum_pseudo_partial>:
800063b0:	e75ff06f          	j	80006224 <inet_chksum_pseudo_partial>

800063b4 <inet_chksum>:
800063b4:	ff010113          	addi	sp,sp,-16
800063b8:	00112623          	sw	ra,12(sp)
800063bc:	c75ff0ef          	jal	ra,80006030 <lwip_standard_chksum>
800063c0:	00c12083          	lw	ra,12(sp)
800063c4:	fff54513          	not	a0,a0
800063c8:	01051513          	slli	a0,a0,0x10
800063cc:	01055513          	srli	a0,a0,0x10
800063d0:	01010113          	addi	sp,sp,16
800063d4:	00008067          	ret

800063d8 <inet_chksum_pbuf>:
800063d8:	fe010113          	addi	sp,sp,-32
800063dc:	01212823          	sw	s2,16(sp)
800063e0:	00010937          	lui	s2,0x10
800063e4:	00812c23          	sw	s0,24(sp)
800063e8:	00912a23          	sw	s1,20(sp)
800063ec:	01312623          	sw	s3,12(sp)
800063f0:	00112e23          	sw	ra,28(sp)
800063f4:	00050493          	mv	s1,a0
800063f8:	00000993          	li	s3,0
800063fc:	00000413          	li	s0,0
80006400:	fff90913          	addi	s2,s2,-1 # ffff <_stack_size+0xf7ff>
80006404:	04049663          	bnez	s1,80006450 <inet_chksum_pbuf+0x78>
80006408:	02098063          	beqz	s3,80006428 <inet_chksum_pbuf+0x50>
8000640c:	00010737          	lui	a4,0x10
80006410:	00841793          	slli	a5,s0,0x8
80006414:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
80006418:	00845413          	srli	s0,s0,0x8
8000641c:	00e7f7b3          	and	a5,a5,a4
80006420:	0ff47413          	andi	s0,s0,255
80006424:	0087e433          	or	s0,a5,s0
80006428:	fff44513          	not	a0,s0
8000642c:	01c12083          	lw	ra,28(sp)
80006430:	01812403          	lw	s0,24(sp)
80006434:	01051513          	slli	a0,a0,0x10
80006438:	01412483          	lw	s1,20(sp)
8000643c:	01012903          	lw	s2,16(sp)
80006440:	00c12983          	lw	s3,12(sp)
80006444:	01055513          	srli	a0,a0,0x10
80006448:	02010113          	addi	sp,sp,32
8000644c:	00008067          	ret
80006450:	00a4d583          	lhu	a1,10(s1)
80006454:	0044a503          	lw	a0,4(s1)
80006458:	bd9ff0ef          	jal	ra,80006030 <lwip_standard_chksum>
8000645c:	00850433          	add	s0,a0,s0
80006460:	01045793          	srli	a5,s0,0x10
80006464:	01247433          	and	s0,s0,s2
80006468:	00878433          	add	s0,a5,s0
8000646c:	00a4d783          	lhu	a5,10(s1)
80006470:	0017f793          	andi	a5,a5,1
80006474:	00078e63          	beqz	a5,80006490 <inet_chksum_pbuf+0xb8>
80006478:	00841793          	slli	a5,s0,0x8
8000647c:	00845413          	srli	s0,s0,0x8
80006480:	0127f7b3          	and	a5,a5,s2
80006484:	0ff47413          	andi	s0,s0,255
80006488:	0019c993          	xori	s3,s3,1
8000648c:	0087e433          	or	s0,a5,s0
80006490:	0004a483          	lw	s1,0(s1)
80006494:	f71ff06f          	j	80006404 <inet_chksum_pbuf+0x2c>

80006498 <mem_overflow_check_raw>:
80006498:	f5010113          	addi	sp,sp,-176
8000649c:	0a812423          	sw	s0,168(sp)
800064a0:	0a912223          	sw	s1,164(sp)
800064a4:	0b212023          	sw	s2,160(sp)
800064a8:	09312e23          	sw	s3,156(sp)
800064ac:	09412c23          	sw	s4,152(sp)
800064b0:	09512a23          	sw	s5,148(sp)
800064b4:	09612823          	sw	s6,144(sp)
800064b8:	09712623          	sw	s7,140(sp)
800064bc:	0a112623          	sw	ra,172(sp)
800064c0:	00050493          	mv	s1,a0
800064c4:	00058a93          	mv	s5,a1
800064c8:	00060913          	mv	s2,a2
800064cc:	00068993          	mv	s3,a3
800064d0:	00000413          	li	s0,0
800064d4:	0cd00b13          	li	s6,205
800064d8:	80003bb7          	lui	s7,0x80003
800064dc:	01000a13          	li	s4,16
800064e0:	008a87b3          	add	a5,s5,s0
800064e4:	00f487b3          	add	a5,s1,a5
800064e8:	0007c783          	lbu	a5,0(a5)
800064ec:	01678e63          	beq	a5,s6,80006508 <mem_overflow_check_raw+0x70>
800064f0:	00098713          	mv	a4,s3
800064f4:	00090693          	mv	a3,s2
800064f8:	c40b8613          	addi	a2,s7,-960 # 80002c40 <_ram_heap_end+0xffff0c40>
800064fc:	08000593          	li	a1,128
80006500:	00010513          	mv	a0,sp
80006504:	3e0080ef          	jal	ra,8000e8e4 <sniprintf>
80006508:	00140413          	addi	s0,s0,1
8000650c:	fd441ae3          	bne	s0,s4,800064e0 <mem_overflow_check_raw+0x48>
80006510:	ff048413          	addi	s0,s1,-16
80006514:	0cd00a13          	li	s4,205
80006518:	80003ab7          	lui	s5,0x80003
8000651c:	00044783          	lbu	a5,0(s0)
80006520:	01478e63          	beq	a5,s4,8000653c <mem_overflow_check_raw+0xa4>
80006524:	00098713          	mv	a4,s3
80006528:	00090693          	mv	a3,s2
8000652c:	c60a8613          	addi	a2,s5,-928 # 80002c60 <_ram_heap_end+0xffff0c60>
80006530:	08000593          	li	a1,128
80006534:	00010513          	mv	a0,sp
80006538:	3ac080ef          	jal	ra,8000e8e4 <sniprintf>
8000653c:	00140413          	addi	s0,s0,1
80006540:	fc849ee3          	bne	s1,s0,8000651c <mem_overflow_check_raw+0x84>
80006544:	0ac12083          	lw	ra,172(sp)
80006548:	0a812403          	lw	s0,168(sp)
8000654c:	0a412483          	lw	s1,164(sp)
80006550:	0a012903          	lw	s2,160(sp)
80006554:	09c12983          	lw	s3,156(sp)
80006558:	09812a03          	lw	s4,152(sp)
8000655c:	09412a83          	lw	s5,148(sp)
80006560:	09012b03          	lw	s6,144(sp)
80006564:	08c12b83          	lw	s7,140(sp)
80006568:	0b010113          	addi	sp,sp,176
8000656c:	00008067          	ret

80006570 <mem_overflow_init_raw>:
80006570:	ff010113          	addi	sp,sp,-16
80006574:	00812423          	sw	s0,8(sp)
80006578:	00912223          	sw	s1,4(sp)
8000657c:	00050413          	mv	s0,a0
80006580:	00058493          	mv	s1,a1
80006584:	01000613          	li	a2,16
80006588:	0cd00593          	li	a1,205
8000658c:	ff050513          	addi	a0,a0,-16
80006590:	00112623          	sw	ra,12(sp)
80006594:	6b4060ef          	jal	ra,8000cc48 <memset>
80006598:	00940533          	add	a0,s0,s1
8000659c:	00812403          	lw	s0,8(sp)
800065a0:	00c12083          	lw	ra,12(sp)
800065a4:	00412483          	lw	s1,4(sp)
800065a8:	01000613          	li	a2,16
800065ac:	0cd00593          	li	a1,205
800065b0:	01010113          	addi	sp,sp,16
800065b4:	6940606f          	j	8000cc48 <memset>

800065b8 <mem_init>:
800065b8:	00008067          	ret

800065bc <mem_trim>:
800065bc:	00008067          	ret

800065c0 <lwip_malloc>:
800065c0:	ff010113          	addi	sp,sp,-16
800065c4:	00812423          	sw	s0,8(sp)
800065c8:	00112623          	sw	ra,12(sp)
800065cc:	3b9070ef          	jal	ra,8000e184 <malloc>
800065d0:	00050413          	mv	s0,a0
800065d4:	00051663          	bnez	a0,800065e0 <lwip_malloc+0x20>
800065d8:	8edfe0ef          	jal	ra,80004ec4 <sys_arch_protect>
800065dc:	8edfe0ef          	jal	ra,80004ec8 <sys_arch_unprotect>
800065e0:	00040513          	mv	a0,s0
800065e4:	00c12083          	lw	ra,12(sp)
800065e8:	00812403          	lw	s0,8(sp)
800065ec:	01010113          	addi	sp,sp,16
800065f0:	00008067          	ret

800065f4 <lwip_free>:
800065f4:	3a10706f          	j	8000e194 <free>

800065f8 <lwip_calloc>:
800065f8:	3780706f          	j	8000d970 <calloc>

800065fc <do_memp_free_pool>:
800065fc:	ff010113          	addi	sp,sp,-16
80006600:	00112623          	sw	ra,12(sp)
80006604:	00812423          	sw	s0,8(sp)
80006608:	00912223          	sw	s1,4(sp)
8000660c:	01212023          	sw	s2,0(sp)
80006610:	00058413          	mv	s0,a1
80006614:	00050493          	mv	s1,a0
80006618:	8adfe0ef          	jal	ra,80004ec4 <sys_arch_protect>
8000661c:	0004a683          	lw	a3,0(s1)
80006620:	0044d583          	lhu	a1,4(s1)
80006624:	80003637          	lui	a2,0x80003
80006628:	00050913          	mv	s2,a0
8000662c:	c9860613          	addi	a2,a2,-872 # 80002c98 <_ram_heap_end+0xffff0c98>
80006630:	00040513          	mv	a0,s0
80006634:	e65ff0ef          	jal	ra,80006498 <mem_overflow_check_raw>
80006638:	00090513          	mv	a0,s2
8000663c:	88dfe0ef          	jal	ra,80004ec8 <sys_arch_unprotect>
80006640:	fe440513          	addi	a0,s0,-28
80006644:	00812403          	lw	s0,8(sp)
80006648:	00c12083          	lw	ra,12(sp)
8000664c:	00412483          	lw	s1,4(sp)
80006650:	00012903          	lw	s2,0(sp)
80006654:	01010113          	addi	sp,sp,16
80006658:	f9dff06f          	j	800065f4 <lwip_free>

8000665c <do_memp_malloc_pool_fn>:
8000665c:	fe010113          	addi	sp,sp,-32
80006660:	00812c23          	sw	s0,24(sp)
80006664:	00912a23          	sw	s1,20(sp)
80006668:	00112e23          	sw	ra,28(sp)
8000666c:	01212823          	sw	s2,16(sp)
80006670:	00050493          	mv	s1,a0
80006674:	00455503          	lhu	a0,4(a0)
80006678:	00b12623          	sw	a1,12(sp)
8000667c:	00c12423          	sw	a2,8(sp)
80006680:	00350513          	addi	a0,a0,3
80006684:	ffc57513          	andi	a0,a0,-4
80006688:	02c50513          	addi	a0,a0,44
8000668c:	f35ff0ef          	jal	ra,800065c0 <lwip_malloc>
80006690:	00050413          	mv	s0,a0
80006694:	831fe0ef          	jal	ra,80004ec4 <sys_arch_protect>
80006698:	02040663          	beqz	s0,800066c4 <do_memp_malloc_pool_fn+0x68>
8000669c:	00c12583          	lw	a1,12(sp)
800066a0:	00812603          	lw	a2,8(sp)
800066a4:	01c40413          	addi	s0,s0,28
800066a8:	feb42423          	sw	a1,-24(s0)
800066ac:	fec42623          	sw	a2,-20(s0)
800066b0:	0044d583          	lhu	a1,4(s1)
800066b4:	00050913          	mv	s2,a0
800066b8:	00040513          	mv	a0,s0
800066bc:	eb5ff0ef          	jal	ra,80006570 <mem_overflow_init_raw>
800066c0:	00090513          	mv	a0,s2
800066c4:	805fe0ef          	jal	ra,80004ec8 <sys_arch_unprotect>
800066c8:	00040513          	mv	a0,s0
800066cc:	01c12083          	lw	ra,28(sp)
800066d0:	01812403          	lw	s0,24(sp)
800066d4:	01412483          	lw	s1,20(sp)
800066d8:	01012903          	lw	s2,16(sp)
800066dc:	02010113          	addi	sp,sp,32
800066e0:	00008067          	ret

800066e4 <memp_init_pool>:
800066e4:	00008067          	ret

800066e8 <memp_init>:
800066e8:	00008067          	ret

800066ec <memp_malloc_pool_fn>:
800066ec:	00050463          	beqz	a0,800066f4 <memp_malloc_pool_fn+0x8>
800066f0:	f6dff06f          	j	8000665c <do_memp_malloc_pool_fn>
800066f4:	00008067          	ret

800066f8 <memp_malloc_fn>:
800066f8:	00500793          	li	a5,5
800066fc:	00a7ee63          	bltu	a5,a0,80006718 <memp_malloc_fn+0x20>
80006700:	00251793          	slli	a5,a0,0x2
80006704:	80003537          	lui	a0,0x80003
80006708:	c8050513          	addi	a0,a0,-896 # 80002c80 <_ram_heap_end+0xffff0c80>
8000670c:	00f50533          	add	a0,a0,a5
80006710:	00052503          	lw	a0,0(a0)
80006714:	f49ff06f          	j	8000665c <do_memp_malloc_pool_fn>
80006718:	00000513          	li	a0,0
8000671c:	00008067          	ret

80006720 <memp_free_pool>:
80006720:	00050663          	beqz	a0,8000672c <memp_free_pool+0xc>
80006724:	00058463          	beqz	a1,8000672c <memp_free_pool+0xc>
80006728:	ed5ff06f          	j	800065fc <do_memp_free_pool>
8000672c:	00008067          	ret

80006730 <memp_free>:
80006730:	00500713          	li	a4,5
80006734:	02a76063          	bltu	a4,a0,80006754 <memp_free+0x24>
80006738:	00058e63          	beqz	a1,80006754 <memp_free+0x24>
8000673c:	00251793          	slli	a5,a0,0x2
80006740:	80003537          	lui	a0,0x80003
80006744:	c8050513          	addi	a0,a0,-896 # 80002c80 <_ram_heap_end+0xffff0c80>
80006748:	00f50533          	add	a0,a0,a5
8000674c:	00052503          	lw	a0,0(a0)
80006750:	eadff06f          	j	800065fc <do_memp_free_pool>
80006754:	00008067          	ret

80006758 <netif_null_output_ip4>:
80006758:	ff400513          	li	a0,-12
8000675c:	00008067          	ret

80006760 <netif_issue_reports>:
80006760:	03554783          	lbu	a5,53(a0)
80006764:	00500693          	li	a3,5
80006768:	0057f613          	andi	a2,a5,5
8000676c:	02d61263          	bne	a2,a3,80006790 <netif_issue_reports+0x30>
80006770:	0015f593          	andi	a1,a1,1
80006774:	00058e63          	beqz	a1,80006790 <netif_issue_reports+0x30>
80006778:	00452683          	lw	a3,4(a0)
8000677c:	00068a63          	beqz	a3,80006790 <netif_issue_reports+0x30>
80006780:	0087f793          	andi	a5,a5,8
80006784:	00078663          	beqz	a5,80006790 <netif_issue_reports+0x30>
80006788:	00450593          	addi	a1,a0,4
8000678c:	0e50406f          	j	8000b070 <etharp_request>
80006790:	00008067          	ret

80006794 <netif_do_set_ipaddr>:
80006794:	00452783          	lw	a5,4(a0)
80006798:	0005a703          	lw	a4,0(a1)
8000679c:	08f70263          	beq	a4,a5,80006820 <netif_do_set_ipaddr+0x8c>
800067a0:	fe010113          	addi	sp,sp,-32
800067a4:	00f62023          	sw	a5,0(a2)
800067a8:	00812c23          	sw	s0,24(sp)
800067ac:	01212823          	sw	s2,16(sp)
800067b0:	00050413          	mv	s0,a0
800067b4:	00058913          	mv	s2,a1
800067b8:	00060513          	mv	a0,a2
800067bc:	00c10593          	addi	a1,sp,12
800067c0:	00112e23          	sw	ra,28(sp)
800067c4:	00e12623          	sw	a4,12(sp)
800067c8:	00912a23          	sw	s1,20(sp)
800067cc:	00060493          	mv	s1,a2
800067d0:	464020ef          	jal	ra,80008c34 <udp_netif_ip_addr_changed>
800067d4:	00c10593          	addi	a1,sp,12
800067d8:	00048513          	mv	a0,s1
800067dc:	0c5010ef          	jal	ra,800080a0 <raw_netif_ip_addr_changed>
800067e0:	00092783          	lw	a5,0(s2)
800067e4:	00100593          	li	a1,1
800067e8:	00040513          	mv	a0,s0
800067ec:	00f42223          	sw	a5,4(s0)
800067f0:	f71ff0ef          	jal	ra,80006760 <netif_issue_reports>
800067f4:	01c42783          	lw	a5,28(s0)
800067f8:	00078663          	beqz	a5,80006804 <netif_do_set_ipaddr+0x70>
800067fc:	00040513          	mv	a0,s0
80006800:	000780e7          	jalr	a5
80006804:	01c12083          	lw	ra,28(sp)
80006808:	01812403          	lw	s0,24(sp)
8000680c:	01412483          	lw	s1,20(sp)
80006810:	01012903          	lw	s2,16(sp)
80006814:	00100513          	li	a0,1
80006818:	02010113          	addi	sp,sp,32
8000681c:	00008067          	ret
80006820:	00000513          	li	a0,0
80006824:	00008067          	ret

80006828 <netif_init>:
80006828:	00008067          	ret

8000682c <netif_input>:
8000682c:	0355c783          	lbu	a5,53(a1)
80006830:	0187f793          	andi	a5,a5,24
80006834:	00078463          	beqz	a5,8000683c <netif_input+0x10>
80006838:	1d40606f          	j	8000ca0c <ethernet_input>
8000683c:	6300506f          	j	8000be6c <ip4_input>

80006840 <netif_set_ipaddr>:
80006840:	02050463          	beqz	a0,80006868 <netif_set_ipaddr+0x28>
80006844:	fe010113          	addi	sp,sp,-32
80006848:	00112e23          	sw	ra,28(sp)
8000684c:	00059463          	bnez	a1,80006854 <netif_set_ipaddr+0x14>
80006850:	84818593          	addi	a1,gp,-1976 # 800030f0 <ip_addr_any>
80006854:	00c10613          	addi	a2,sp,12
80006858:	f3dff0ef          	jal	ra,80006794 <netif_do_set_ipaddr>
8000685c:	01c12083          	lw	ra,28(sp)
80006860:	02010113          	addi	sp,sp,32
80006864:	00008067          	ret
80006868:	00008067          	ret

8000686c <netif_set_netmask>:
8000686c:	00050e63          	beqz	a0,80006888 <netif_set_netmask+0x1c>
80006870:	00059463          	bnez	a1,80006878 <netif_set_netmask+0xc>
80006874:	84818593          	addi	a1,gp,-1976 # 800030f0 <ip_addr_any>
80006878:	0005a783          	lw	a5,0(a1)
8000687c:	00852703          	lw	a4,8(a0)
80006880:	00e78463          	beq	a5,a4,80006888 <netif_set_netmask+0x1c>
80006884:	00f52423          	sw	a5,8(a0)
80006888:	00008067          	ret

8000688c <netif_set_gw>:
8000688c:	00050e63          	beqz	a0,800068a8 <netif_set_gw+0x1c>
80006890:	00059463          	bnez	a1,80006898 <netif_set_gw+0xc>
80006894:	84818593          	addi	a1,gp,-1976 # 800030f0 <ip_addr_any>
80006898:	0005a783          	lw	a5,0(a1)
8000689c:	00c52703          	lw	a4,12(a0)
800068a0:	00e78463          	beq	a5,a4,800068a8 <netif_set_gw+0x1c>
800068a4:	00f52623          	sw	a5,12(a0)
800068a8:	00008067          	ret

800068ac <netif_set_addr>:
800068ac:	fd010113          	addi	sp,sp,-48
800068b0:	02812423          	sw	s0,40(sp)
800068b4:	02912223          	sw	s1,36(sp)
800068b8:	03212023          	sw	s2,32(sp)
800068bc:	02112623          	sw	ra,44(sp)
800068c0:	00050493          	mv	s1,a0
800068c4:	00060913          	mv	s2,a2
800068c8:	00058413          	mv	s0,a1
800068cc:	00059463          	bnez	a1,800068d4 <netif_set_addr+0x28>
800068d0:	84818413          	addi	s0,gp,-1976 # 800030f0 <ip_addr_any>
800068d4:	00091463          	bnez	s2,800068dc <netif_set_addr+0x30>
800068d8:	84818913          	addi	s2,gp,-1976 # 800030f0 <ip_addr_any>
800068dc:	00069463          	bnez	a3,800068e4 <netif_set_addr+0x38>
800068e0:	84818693          	addi	a3,gp,-1976 # 800030f0 <ip_addr_any>
800068e4:	00042783          	lw	a5,0(s0)
800068e8:	00078663          	beqz	a5,800068f4 <netif_set_addr+0x48>
800068ec:	00000793          	li	a5,0
800068f0:	0200006f          	j	80006910 <netif_set_addr+0x64>
800068f4:	01c10613          	addi	a2,sp,28
800068f8:	00040593          	mv	a1,s0
800068fc:	00048513          	mv	a0,s1
80006900:	00d12623          	sw	a3,12(sp)
80006904:	e91ff0ef          	jal	ra,80006794 <netif_do_set_ipaddr>
80006908:	00c12683          	lw	a3,12(sp)
8000690c:	00100793          	li	a5,1
80006910:	00092703          	lw	a4,0(s2)
80006914:	0084a603          	lw	a2,8(s1)
80006918:	00c70463          	beq	a4,a2,80006920 <netif_set_addr+0x74>
8000691c:	00e4a423          	sw	a4,8(s1)
80006920:	0006a703          	lw	a4,0(a3)
80006924:	00c4a683          	lw	a3,12(s1)
80006928:	00d70463          	beq	a4,a3,80006930 <netif_set_addr+0x84>
8000692c:	00e4a623          	sw	a4,12(s1)
80006930:	00079a63          	bnez	a5,80006944 <netif_set_addr+0x98>
80006934:	01c10613          	addi	a2,sp,28
80006938:	00040593          	mv	a1,s0
8000693c:	00048513          	mv	a0,s1
80006940:	e55ff0ef          	jal	ra,80006794 <netif_do_set_ipaddr>
80006944:	02c12083          	lw	ra,44(sp)
80006948:	02812403          	lw	s0,40(sp)
8000694c:	02412483          	lw	s1,36(sp)
80006950:	02012903          	lw	s2,32(sp)
80006954:	03010113          	addi	sp,sp,48
80006958:	00008067          	ret

8000695c <netif_add>:
8000695c:	fe010113          	addi	sp,sp,-32
80006960:	00112e23          	sw	ra,28(sp)
80006964:	00812c23          	sw	s0,24(sp)
80006968:	00912a23          	sw	s1,20(sp)
8000696c:	02051063          	bnez	a0,8000698c <netif_add+0x30>
80006970:	00000413          	li	s0,0
80006974:	00040513          	mv	a0,s0
80006978:	01c12083          	lw	ra,28(sp)
8000697c:	01812403          	lw	s0,24(sp)
80006980:	01412483          	lw	s1,20(sp)
80006984:	02010113          	addi	sp,sp,32
80006988:	00008067          	ret
8000698c:	fe0782e3          	beqz	a5,80006970 <netif_add+0x14>
80006990:	00050413          	mv	s0,a0
80006994:	00059463          	bnez	a1,8000699c <netif_add+0x40>
80006998:	84818593          	addi	a1,gp,-1976 # 800030f0 <ip_addr_any>
8000699c:	00061463          	bnez	a2,800069a4 <netif_add+0x48>
800069a0:	84818613          	addi	a2,gp,-1976 # 800030f0 <ip_addr_any>
800069a4:	00069463          	bnez	a3,800069ac <netif_add+0x50>
800069a8:	84818693          	addi	a3,gp,-1976 # 800030f0 <ip_addr_any>
800069ac:	02e42223          	sw	a4,36(s0)
800069b0:	8cc1c703          	lbu	a4,-1844(gp) # 80003174 <netif_num>
800069b4:	80006537          	lui	a0,0x80006
800069b8:	75850513          	addi	a0,a0,1880 # 80006758 <_ram_heap_end+0xffff4758>
800069bc:	00a42a23          	sw	a0,20(s0)
800069c0:	00042223          	sw	zero,4(s0)
800069c4:	00040513          	mv	a0,s0
800069c8:	00042423          	sw	zero,8(s0)
800069cc:	00042623          	sw	zero,12(s0)
800069d0:	02041623          	sh	zero,44(s0)
800069d4:	02040aa3          	sb	zero,53(s0)
800069d8:	02040423          	sb	zero,40(s0)
800069dc:	020404a3          	sb	zero,41(s0)
800069e0:	02040523          	sb	zero,42(s0)
800069e4:	020405a3          	sb	zero,43(s0)
800069e8:	00042e23          	sw	zero,28(s0)
800069ec:	02042023          	sw	zero,32(s0)
800069f0:	02e40c23          	sb	a4,56(s0)
800069f4:	01042823          	sw	a6,16(s0)
800069f8:	02042e23          	sw	zero,60(s0)
800069fc:	00f12623          	sw	a5,12(sp)
80006a00:	eadff0ef          	jal	ra,800068ac <netif_set_addr>
80006a04:	00c12783          	lw	a5,12(sp)
80006a08:	00040513          	mv	a0,s0
80006a0c:	000780e7          	jalr	a5
80006a10:	f60510e3          	bnez	a0,80006970 <netif_add+0x14>
80006a14:	8d41a603          	lw	a2,-1836(gp) # 8000317c <netif_list>
80006a18:	00078713          	mv	a4,a5
80006a1c:	0ff00593          	li	a1,255
80006a20:	03844783          	lbu	a5,56(s0)
80006a24:	00b79463          	bne	a5,a1,80006a2c <netif_add+0xd0>
80006a28:	02040c23          	sb	zero,56(s0)
80006a2c:	03844783          	lbu	a5,56(s0)
80006a30:	00060693          	mv	a3,a2
80006a34:	02069463          	bnez	a3,80006a5c <netif_add+0x100>
80006a38:	0fe00593          	li	a1,254
80006a3c:	00000693          	li	a3,0
80006a40:	00b78663          	beq	a5,a1,80006a4c <netif_add+0xf0>
80006a44:	00178793          	addi	a5,a5,1
80006a48:	0ff7f693          	andi	a3,a5,255
80006a4c:	00c42023          	sw	a2,0(s0)
80006a50:	8cd18623          	sb	a3,-1844(gp) # 80003174 <netif_num>
80006a54:	8c81aa23          	sw	s0,-1836(gp) # 8000317c <netif_list>
80006a58:	f1dff06f          	j	80006974 <netif_add+0x18>
80006a5c:	0386c503          	lbu	a0,56(a3)
80006a60:	00f51863          	bne	a0,a5,80006a70 <netif_add+0x114>
80006a64:	00178793          	addi	a5,a5,1
80006a68:	02f40c23          	sb	a5,56(s0)
80006a6c:	fb5ff06f          	j	80006a20 <netif_add+0xc4>
80006a70:	0006a683          	lw	a3,0(a3)
80006a74:	fc1ff06f          	j	80006a34 <netif_add+0xd8>

80006a78 <netif_add_noaddr>:
80006a78:	00068813          	mv	a6,a3
80006a7c:	00060793          	mv	a5,a2
80006a80:	00058713          	mv	a4,a1
80006a84:	00000693          	li	a3,0
80006a88:	00000613          	li	a2,0
80006a8c:	00000593          	li	a1,0
80006a90:	ecdff06f          	j	8000695c <netif_add>

80006a94 <netif_set_default>:
80006a94:	8ca1a823          	sw	a0,-1840(gp) # 80003178 <netif_default>
80006a98:	00008067          	ret

80006a9c <netif_set_up>:
80006a9c:	04050e63          	beqz	a0,80006af8 <netif_set_up+0x5c>
80006aa0:	ff010113          	addi	sp,sp,-16
80006aa4:	00812423          	sw	s0,8(sp)
80006aa8:	00112623          	sw	ra,12(sp)
80006aac:	03554783          	lbu	a5,53(a0)
80006ab0:	00050413          	mv	s0,a0
80006ab4:	0017f713          	andi	a4,a5,1
80006ab8:	02071863          	bnez	a4,80006ae8 <netif_set_up+0x4c>
80006abc:	0017e793          	ori	a5,a5,1
80006ac0:	02f50aa3          	sb	a5,53(a0)
80006ac4:	01c52783          	lw	a5,28(a0)
80006ac8:	00078463          	beqz	a5,80006ad0 <netif_set_up+0x34>
80006acc:	000780e7          	jalr	a5
80006ad0:	00040513          	mv	a0,s0
80006ad4:	00812403          	lw	s0,8(sp)
80006ad8:	00c12083          	lw	ra,12(sp)
80006adc:	00300593          	li	a1,3
80006ae0:	01010113          	addi	sp,sp,16
80006ae4:	c7dff06f          	j	80006760 <netif_issue_reports>
80006ae8:	00c12083          	lw	ra,12(sp)
80006aec:	00812403          	lw	s0,8(sp)
80006af0:	01010113          	addi	sp,sp,16
80006af4:	00008067          	ret
80006af8:	00008067          	ret

80006afc <netif_set_down>:
80006afc:	06050063          	beqz	a0,80006b5c <netif_set_down+0x60>
80006b00:	ff010113          	addi	sp,sp,-16
80006b04:	00812423          	sw	s0,8(sp)
80006b08:	00112623          	sw	ra,12(sp)
80006b0c:	03554783          	lbu	a5,53(a0)
80006b10:	00050413          	mv	s0,a0
80006b14:	0017f713          	andi	a4,a5,1
80006b18:	02070a63          	beqz	a4,80006b4c <netif_set_down+0x50>
80006b1c:	ffe7f713          	andi	a4,a5,-2
80006b20:	02e50aa3          	sb	a4,53(a0)
80006b24:	0087f793          	andi	a5,a5,8
80006b28:	00078463          	beqz	a5,80006b30 <netif_set_down+0x34>
80006b2c:	1cc040ef          	jal	ra,8000acf8 <etharp_cleanup_netif>
80006b30:	01c42303          	lw	t1,28(s0)
80006b34:	00030c63          	beqz	t1,80006b4c <netif_set_down+0x50>
80006b38:	00040513          	mv	a0,s0
80006b3c:	00812403          	lw	s0,8(sp)
80006b40:	00c12083          	lw	ra,12(sp)
80006b44:	01010113          	addi	sp,sp,16
80006b48:	00030067          	jr	t1
80006b4c:	00c12083          	lw	ra,12(sp)
80006b50:	00812403          	lw	s0,8(sp)
80006b54:	01010113          	addi	sp,sp,16
80006b58:	00008067          	ret
80006b5c:	00008067          	ret

80006b60 <netif_remove>:
80006b60:	08050e63          	beqz	a0,80006bfc <netif_remove+0x9c>
80006b64:	ff010113          	addi	sp,sp,-16
80006b68:	00812423          	sw	s0,8(sp)
80006b6c:	00112623          	sw	ra,12(sp)
80006b70:	00912223          	sw	s1,4(sp)
80006b74:	00452783          	lw	a5,4(a0)
80006b78:	00050413          	mv	s0,a0
80006b7c:	02078063          	beqz	a5,80006b9c <netif_remove+0x3c>
80006b80:	00450493          	addi	s1,a0,4
80006b84:	00000593          	li	a1,0
80006b88:	00048513          	mv	a0,s1
80006b8c:	0a8020ef          	jal	ra,80008c34 <udp_netif_ip_addr_changed>
80006b90:	00000593          	li	a1,0
80006b94:	00048513          	mv	a0,s1
80006b98:	508010ef          	jal	ra,800080a0 <raw_netif_ip_addr_changed>
80006b9c:	03544783          	lbu	a5,53(s0)
80006ba0:	0017f793          	andi	a5,a5,1
80006ba4:	00078663          	beqz	a5,80006bb0 <netif_remove+0x50>
80006ba8:	00040513          	mv	a0,s0
80006bac:	f51ff0ef          	jal	ra,80006afc <netif_set_down>
80006bb0:	8d01a703          	lw	a4,-1840(gp) # 80003178 <netif_default>
80006bb4:	00871463          	bne	a4,s0,80006bbc <netif_remove+0x5c>
80006bb8:	8c01a823          	sw	zero,-1840(gp) # 80003178 <netif_default>
80006bbc:	8d41a783          	lw	a5,-1836(gp) # 8000317c <netif_list>
80006bc0:	02879263          	bne	a5,s0,80006be4 <netif_remove+0x84>
80006bc4:	00042783          	lw	a5,0(s0)
80006bc8:	8cf1aa23          	sw	a5,-1836(gp) # 8000317c <netif_list>
80006bcc:	00c12083          	lw	ra,12(sp)
80006bd0:	00812403          	lw	s0,8(sp)
80006bd4:	00412483          	lw	s1,4(sp)
80006bd8:	01010113          	addi	sp,sp,16
80006bdc:	00008067          	ret
80006be0:	00070793          	mv	a5,a4
80006be4:	fe0784e3          	beqz	a5,80006bcc <netif_remove+0x6c>
80006be8:	0007a703          	lw	a4,0(a5)
80006bec:	fe871ae3          	bne	a4,s0,80006be0 <netif_remove+0x80>
80006bf0:	00042703          	lw	a4,0(s0)
80006bf4:	00e7a023          	sw	a4,0(a5)
80006bf8:	fd5ff06f          	j	80006bcc <netif_remove+0x6c>
80006bfc:	00008067          	ret

80006c00 <netif_set_status_callback>:
80006c00:	00050463          	beqz	a0,80006c08 <netif_set_status_callback+0x8>
80006c04:	00b52e23          	sw	a1,28(a0)
80006c08:	00008067          	ret

80006c0c <netif_set_link_up>:
80006c0c:	06050263          	beqz	a0,80006c70 <netif_set_link_up+0x64>
80006c10:	ff010113          	addi	sp,sp,-16
80006c14:	00812423          	sw	s0,8(sp)
80006c18:	00112623          	sw	ra,12(sp)
80006c1c:	03554783          	lbu	a5,53(a0)
80006c20:	00050413          	mv	s0,a0
80006c24:	0047f713          	andi	a4,a5,4
80006c28:	02071c63          	bnez	a4,80006c60 <netif_set_link_up+0x54>
80006c2c:	0047e793          	ori	a5,a5,4
80006c30:	02f50aa3          	sb	a5,53(a0)
80006c34:	3c8030ef          	jal	ra,80009ffc <dhcp_network_changed>
80006c38:	00300593          	li	a1,3
80006c3c:	00040513          	mv	a0,s0
80006c40:	b21ff0ef          	jal	ra,80006760 <netif_issue_reports>
80006c44:	02042303          	lw	t1,32(s0)
80006c48:	00030c63          	beqz	t1,80006c60 <netif_set_link_up+0x54>
80006c4c:	00040513          	mv	a0,s0
80006c50:	00812403          	lw	s0,8(sp)
80006c54:	00c12083          	lw	ra,12(sp)
80006c58:	01010113          	addi	sp,sp,16
80006c5c:	00030067          	jr	t1
80006c60:	00c12083          	lw	ra,12(sp)
80006c64:	00812403          	lw	s0,8(sp)
80006c68:	01010113          	addi	sp,sp,16
80006c6c:	00008067          	ret
80006c70:	00008067          	ret

80006c74 <netif_set_link_down>:
80006c74:	02050263          	beqz	a0,80006c98 <netif_set_link_down+0x24>
80006c78:	03554703          	lbu	a4,53(a0)
80006c7c:	00477693          	andi	a3,a4,4
80006c80:	00068c63          	beqz	a3,80006c98 <netif_set_link_down+0x24>
80006c84:	02052303          	lw	t1,32(a0)
80006c88:	ffb77713          	andi	a4,a4,-5
80006c8c:	02e50aa3          	sb	a4,53(a0)
80006c90:	00030463          	beqz	t1,80006c98 <netif_set_link_down+0x24>
80006c94:	00030067          	jr	t1
80006c98:	00008067          	ret

80006c9c <netif_set_link_callback>:
80006c9c:	00050463          	beqz	a0,80006ca4 <netif_set_link_callback+0x8>
80006ca0:	02b52023          	sw	a1,32(a0)
80006ca4:	00008067          	ret

80006ca8 <netif_get_by_index>:
80006ca8:	00000793          	li	a5,0
80006cac:	00050663          	beqz	a0,80006cb8 <netif_get_by_index+0x10>
80006cb0:	8d41a783          	lw	a5,-1836(gp) # 8000317c <netif_list>
80006cb4:	00079663          	bnez	a5,80006cc0 <netif_get_by_index+0x18>
80006cb8:	00078513          	mv	a0,a5
80006cbc:	00008067          	ret
80006cc0:	0387c703          	lbu	a4,56(a5)
80006cc4:	00170713          	addi	a4,a4,1
80006cc8:	0ff77713          	andi	a4,a4,255
80006ccc:	fea706e3          	beq	a4,a0,80006cb8 <netif_get_by_index+0x10>
80006cd0:	0007a783          	lw	a5,0(a5)
80006cd4:	fe1ff06f          	j	80006cb4 <netif_get_by_index+0xc>

80006cd8 <netif_index_to_name>:
80006cd8:	ff010113          	addi	sp,sp,-16
80006cdc:	00812423          	sw	s0,8(sp)
80006ce0:	00912223          	sw	s1,4(sp)
80006ce4:	00112623          	sw	ra,12(sp)
80006ce8:	00050493          	mv	s1,a0
80006cec:	00058413          	mv	s0,a1
80006cf0:	fb9ff0ef          	jal	ra,80006ca8 <netif_get_by_index>
80006cf4:	02050463          	beqz	a0,80006d1c <netif_index_to_name+0x44>
80006cf8:	03654783          	lbu	a5,54(a0)
80006cfc:	fff48613          	addi	a2,s1,-1
80006d00:	00400593          	li	a1,4
80006d04:	00f40023          	sb	a5,0(s0)
80006d08:	03754783          	lbu	a5,55(a0)
80006d0c:	00240513          	addi	a0,s0,2
80006d10:	00f400a3          	sb	a5,1(s0)
80006d14:	a20ff0ef          	jal	ra,80005f34 <lwip_itoa>
80006d18:	00040513          	mv	a0,s0
80006d1c:	00c12083          	lw	ra,12(sp)
80006d20:	00812403          	lw	s0,8(sp)
80006d24:	00412483          	lw	s1,4(sp)
80006d28:	01010113          	addi	sp,sp,16
80006d2c:	00008067          	ret

80006d30 <netif_find>:
80006d30:	00051663          	bnez	a0,80006d3c <netif_find+0xc>
80006d34:	00000513          	li	a0,0
80006d38:	00008067          	ret
80006d3c:	ff010113          	addi	sp,sp,-16
80006d40:	00812423          	sw	s0,8(sp)
80006d44:	00050413          	mv	s0,a0
80006d48:	00250513          	addi	a0,a0,2
80006d4c:	00112623          	sw	ra,12(sp)
80006d50:	409060ef          	jal	ra,8000d958 <atoi>
80006d54:	0ff57793          	andi	a5,a0,255
80006d58:	8d41a503          	lw	a0,-1836(gp) # 8000317c <netif_list>
80006d5c:	00051c63          	bnez	a0,80006d74 <netif_find+0x44>
80006d60:	00000513          	li	a0,0
80006d64:	00c12083          	lw	ra,12(sp)
80006d68:	00812403          	lw	s0,8(sp)
80006d6c:	01010113          	addi	sp,sp,16
80006d70:	00008067          	ret
80006d74:	03854703          	lbu	a4,56(a0)
80006d78:	00f71e63          	bne	a4,a5,80006d94 <netif_find+0x64>
80006d7c:	00044683          	lbu	a3,0(s0)
80006d80:	03654703          	lbu	a4,54(a0)
80006d84:	00e69863          	bne	a3,a4,80006d94 <netif_find+0x64>
80006d88:	00144683          	lbu	a3,1(s0)
80006d8c:	03754703          	lbu	a4,55(a0)
80006d90:	fce68ae3          	beq	a3,a4,80006d64 <netif_find+0x34>
80006d94:	00052503          	lw	a0,0(a0)
80006d98:	fc5ff06f          	j	80006d5c <netif_find+0x2c>

80006d9c <netif_name_to_index>:
80006d9c:	ff010113          	addi	sp,sp,-16
80006da0:	00112623          	sw	ra,12(sp)
80006da4:	f8dff0ef          	jal	ra,80006d30 <netif_find>
80006da8:	00050e63          	beqz	a0,80006dc4 <netif_name_to_index+0x28>
80006dac:	03854503          	lbu	a0,56(a0)
80006db0:	00150513          	addi	a0,a0,1
80006db4:	0ff57513          	andi	a0,a0,255
80006db8:	00c12083          	lw	ra,12(sp)
80006dbc:	01010113          	addi	sp,sp,16
80006dc0:	00008067          	ret
80006dc4:	00000513          	li	a0,0
80006dc8:	ff1ff06f          	j	80006db8 <netif_name_to_index+0x1c>

80006dcc <pbuf_skip_const>:
80006dcc:	00050663          	beqz	a0,80006dd8 <pbuf_skip_const+0xc>
80006dd0:	00a55783          	lhu	a5,10(a0)
80006dd4:	00f5f863          	bgeu	a1,a5,80006de4 <pbuf_skip_const+0x18>
80006dd8:	00060463          	beqz	a2,80006de0 <pbuf_skip_const+0x14>
80006ddc:	00b61023          	sh	a1,0(a2)
80006de0:	00008067          	ret
80006de4:	40f585b3          	sub	a1,a1,a5
80006de8:	01059593          	slli	a1,a1,0x10
80006dec:	0105d593          	srli	a1,a1,0x10
80006df0:	00052503          	lw	a0,0(a0)
80006df4:	fd9ff06f          	j	80006dcc <pbuf_skip_const>

80006df8 <pbuf_add_header_impl>:
80006df8:	00050793          	mv	a5,a0
80006dfc:	08050263          	beqz	a0,80006e80 <pbuf_add_header_impl+0x88>
80006e00:	00010737          	lui	a4,0x10
80006e04:	00100513          	li	a0,1
80006e08:	06e5fe63          	bgeu	a1,a4,80006e84 <pbuf_add_header_impl+0x8c>
80006e0c:	00000513          	li	a0,0
80006e10:	06058a63          	beqz	a1,80006e84 <pbuf_add_header_impl+0x8c>
80006e14:	0087d703          	lhu	a4,8(a5)
80006e18:	01059693          	slli	a3,a1,0x10
80006e1c:	0106d693          	srli	a3,a3,0x10
80006e20:	00e68733          	add	a4,a3,a4
80006e24:	01071713          	slli	a4,a4,0x10
80006e28:	01075713          	srli	a4,a4,0x10
80006e2c:	00100513          	li	a0,1
80006e30:	04d76a63          	bltu	a4,a3,80006e84 <pbuf_add_header_impl+0x8c>
80006e34:	00c78503          	lb	a0,12(a5)
80006e38:	00055e63          	bgez	a0,80006e54 <pbuf_add_header_impl+0x5c>
80006e3c:	0047a603          	lw	a2,4(a5)
80006e40:	00100513          	li	a0,1
80006e44:	40b605b3          	sub	a1,a2,a1
80006e48:	01078613          	addi	a2,a5,16
80006e4c:	00c5fc63          	bgeu	a1,a2,80006e64 <pbuf_add_header_impl+0x6c>
80006e50:	00008067          	ret
80006e54:	00100513          	li	a0,1
80006e58:	02060663          	beqz	a2,80006e84 <pbuf_add_header_impl+0x8c>
80006e5c:	0047a603          	lw	a2,4(a5)
80006e60:	40b605b3          	sub	a1,a2,a1
80006e64:	00a7d603          	lhu	a2,10(a5)
80006e68:	00b7a223          	sw	a1,4(a5)
80006e6c:	00e79423          	sh	a4,8(a5)
80006e70:	00c686b3          	add	a3,a3,a2
80006e74:	00d79523          	sh	a3,10(a5)
80006e78:	00000513          	li	a0,0
80006e7c:	00008067          	ret
80006e80:	00100513          	li	a0,1
80006e84:	00008067          	ret

80006e88 <pbuf_alloc_reference>:
80006e88:	ff010113          	addi	sp,sp,-16
80006e8c:	00812423          	sw	s0,8(sp)
80006e90:	00058413          	mv	s0,a1
80006e94:	800035b7          	lui	a1,0x80003
80006e98:	00912223          	sw	s1,4(sp)
80006e9c:	01212023          	sw	s2,0(sp)
80006ea0:	00060493          	mv	s1,a2
80006ea4:	00050913          	mv	s2,a0
80006ea8:	14c00613          	li	a2,332
80006eac:	ce458593          	addi	a1,a1,-796 # 80002ce4 <_ram_heap_end+0xffff0ce4>
80006eb0:	00400513          	li	a0,4
80006eb4:	00112623          	sw	ra,12(sp)
80006eb8:	841ff0ef          	jal	ra,800066f8 <memp_malloc_fn>
80006ebc:	02050263          	beqz	a0,80006ee0 <pbuf_alloc_reference+0x58>
80006ec0:	00100793          	li	a5,1
80006ec4:	00052023          	sw	zero,0(a0)
80006ec8:	01252223          	sw	s2,4(a0)
80006ecc:	00851423          	sh	s0,8(a0)
80006ed0:	00851523          	sh	s0,10(a0)
80006ed4:	00950623          	sb	s1,12(a0)
80006ed8:	000506a3          	sb	zero,13(a0)
80006edc:	00f51723          	sh	a5,14(a0)
80006ee0:	00c12083          	lw	ra,12(sp)
80006ee4:	00812403          	lw	s0,8(sp)
80006ee8:	00412483          	lw	s1,4(sp)
80006eec:	00012903          	lw	s2,0(sp)
80006ef0:	01010113          	addi	sp,sp,16
80006ef4:	00008067          	ret

80006ef8 <pbuf_alloced_custom>:
80006ef8:	01051513          	slli	a0,a0,0x10
80006efc:	01055513          	srli	a0,a0,0x10
80006f00:	00350513          	addi	a0,a0,3
80006f04:	ffc57513          	andi	a0,a0,-4
80006f08:	00a58833          	add	a6,a1,a0
80006f0c:	0307ec63          	bltu	a5,a6,80006f44 <pbuf_alloced_custom+0x4c>
80006f10:	00070463          	beqz	a4,80006f18 <pbuf_alloced_custom+0x20>
80006f14:	00a70733          	add	a4,a4,a0
80006f18:	00200793          	li	a5,2
80006f1c:	00f686a3          	sb	a5,13(a3)
80006f20:	00100793          	li	a5,1
80006f24:	00068513          	mv	a0,a3
80006f28:	0006a023          	sw	zero,0(a3)
80006f2c:	00e6a223          	sw	a4,4(a3)
80006f30:	00b69423          	sh	a1,8(a3)
80006f34:	00b69523          	sh	a1,10(a3)
80006f38:	00c68623          	sb	a2,12(a3)
80006f3c:	00f69723          	sh	a5,14(a3)
80006f40:	00008067          	ret
80006f44:	00000513          	li	a0,0
80006f48:	00008067          	ret

80006f4c <pbuf_add_header>:
80006f4c:	00000613          	li	a2,0
80006f50:	ea9ff06f          	j	80006df8 <pbuf_add_header_impl>

80006f54 <pbuf_add_header_force>:
80006f54:	00100613          	li	a2,1
80006f58:	ea1ff06f          	j	80006df8 <pbuf_add_header_impl>

80006f5c <pbuf_remove_header>:
80006f5c:	00050793          	mv	a5,a0
80006f60:	04050a63          	beqz	a0,80006fb4 <pbuf_remove_header+0x58>
80006f64:	00010737          	lui	a4,0x10
80006f68:	00100513          	li	a0,1
80006f6c:	04e5f663          	bgeu	a1,a4,80006fb8 <pbuf_remove_header+0x5c>
80006f70:	00000513          	li	a0,0
80006f74:	04058263          	beqz	a1,80006fb8 <pbuf_remove_header+0x5c>
80006f78:	00a7d703          	lhu	a4,10(a5)
80006f7c:	01059693          	slli	a3,a1,0x10
80006f80:	0106d693          	srli	a3,a3,0x10
80006f84:	00100513          	li	a0,1
80006f88:	02d76863          	bltu	a4,a3,80006fb8 <pbuf_remove_header+0x5c>
80006f8c:	40d70733          	sub	a4,a4,a3
80006f90:	0047a603          	lw	a2,4(a5)
80006f94:	00e79523          	sh	a4,10(a5)
80006f98:	0087d703          	lhu	a4,8(a5)
80006f9c:	00b605b3          	add	a1,a2,a1
80006fa0:	00b7a223          	sw	a1,4(a5)
80006fa4:	40d70733          	sub	a4,a4,a3
80006fa8:	00e79423          	sh	a4,8(a5)
80006fac:	00000513          	li	a0,0
80006fb0:	00008067          	ret
80006fb4:	00100513          	li	a0,1
80006fb8:	00008067          	ret

80006fbc <pbuf_header>:
80006fbc:	0005d663          	bgez	a1,80006fc8 <pbuf_header+0xc>
80006fc0:	40b005b3          	neg	a1,a1
80006fc4:	f99ff06f          	j	80006f5c <pbuf_remove_header>
80006fc8:	00000613          	li	a2,0
80006fcc:	e2dff06f          	j	80006df8 <pbuf_add_header_impl>

80006fd0 <pbuf_header_force>:
80006fd0:	0005d663          	bgez	a1,80006fdc <pbuf_header_force+0xc>
80006fd4:	40b005b3          	neg	a1,a1
80006fd8:	f85ff06f          	j	80006f5c <pbuf_remove_header>
80006fdc:	00100613          	li	a2,1
80006fe0:	e19ff06f          	j	80006df8 <pbuf_add_header_impl>

80006fe4 <pbuf_free>:
80006fe4:	fd010113          	addi	sp,sp,-48
80006fe8:	02812423          	sw	s0,40(sp)
80006fec:	02112623          	sw	ra,44(sp)
80006ff0:	02912223          	sw	s1,36(sp)
80006ff4:	03212023          	sw	s2,32(sp)
80006ff8:	01312e23          	sw	s3,28(sp)
80006ffc:	00000413          	li	s0,0
80007000:	06050463          	beqz	a0,80007068 <pbuf_free+0x84>
80007004:	00050593          	mv	a1,a0
80007008:	00000413          	li	s0,0
8000700c:	00200913          	li	s2,2
80007010:	00100993          	li	s3,1
80007014:	00b12623          	sw	a1,12(sp)
80007018:	eadfd0ef          	jal	ra,80004ec4 <sys_arch_protect>
8000701c:	00c12583          	lw	a1,12(sp)
80007020:	00e5c483          	lbu	s1,14(a1)
80007024:	fff48493          	addi	s1,s1,-1
80007028:	0ff4f493          	andi	s1,s1,255
8000702c:	00958723          	sb	s1,14(a1)
80007030:	e99fd0ef          	jal	ra,80004ec8 <sys_arch_unprotect>
80007034:	02049a63          	bnez	s1,80007068 <pbuf_free+0x84>
80007038:	00c12583          	lw	a1,12(sp)
8000703c:	00d5c783          	lbu	a5,13(a1)
80007040:	0005a483          	lw	s1,0(a1)
80007044:	0027f793          	andi	a5,a5,2
80007048:	04078063          	beqz	a5,80007088 <pbuf_free+0xa4>
8000704c:	0105a783          	lw	a5,16(a1)
80007050:	00058513          	mv	a0,a1
80007054:	000780e7          	jalr	a5
80007058:	00140413          	addi	s0,s0,1
8000705c:	0ff47413          	andi	s0,s0,255
80007060:	00048593          	mv	a1,s1
80007064:	fa0498e3          	bnez	s1,80007014 <pbuf_free+0x30>
80007068:	00040513          	mv	a0,s0
8000706c:	02c12083          	lw	ra,44(sp)
80007070:	02812403          	lw	s0,40(sp)
80007074:	02412483          	lw	s1,36(sp)
80007078:	02012903          	lw	s2,32(sp)
8000707c:	01c12983          	lw	s3,28(sp)
80007080:	03010113          	addi	sp,sp,48
80007084:	00008067          	ret
80007088:	00c5c783          	lbu	a5,12(a1)
8000708c:	00500513          	li	a0,5
80007090:	00f7f793          	andi	a5,a5,15
80007094:	01278663          	beq	a5,s2,800070a0 <pbuf_free+0xbc>
80007098:	01379863          	bne	a5,s3,800070a8 <pbuf_free+0xc4>
8000709c:	00400513          	li	a0,4
800070a0:	e90ff0ef          	jal	ra,80006730 <memp_free>
800070a4:	fb5ff06f          	j	80007058 <pbuf_free+0x74>
800070a8:	fa0798e3          	bnez	a5,80007058 <pbuf_free+0x74>
800070ac:	00058513          	mv	a0,a1
800070b0:	d44ff0ef          	jal	ra,800065f4 <lwip_free>
800070b4:	fa5ff06f          	j	80007058 <pbuf_free+0x74>

800070b8 <pbuf_alloc>:
800070b8:	fe010113          	addi	sp,sp,-32
800070bc:	01212823          	sw	s2,16(sp)
800070c0:	00112e23          	sw	ra,28(sp)
800070c4:	00812c23          	sw	s0,24(sp)
800070c8:	00912a23          	sw	s1,20(sp)
800070cc:	01312623          	sw	s3,12(sp)
800070d0:	01412423          	sw	s4,8(sp)
800070d4:	01512223          	sw	s5,4(sp)
800070d8:	01612023          	sw	s6,0(sp)
800070dc:	04100793          	li	a5,65
800070e0:	00058913          	mv	s2,a1
800070e4:	0cf60263          	beq	a2,a5,800071a8 <pbuf_alloc+0xf0>
800070e8:	02c7ee63          	bltu	a5,a2,80007124 <pbuf_alloc+0x6c>
800070ec:	00100793          	li	a5,1
800070f0:	0af60c63          	beq	a2,a5,800071a8 <pbuf_alloc+0xf0>
800070f4:	00000493          	li	s1,0
800070f8:	01c12083          	lw	ra,28(sp)
800070fc:	01812403          	lw	s0,24(sp)
80007100:	00048513          	mv	a0,s1
80007104:	01012903          	lw	s2,16(sp)
80007108:	01412483          	lw	s1,20(sp)
8000710c:	00c12983          	lw	s3,12(sp)
80007110:	00812a03          	lw	s4,8(sp)
80007114:	00412a83          	lw	s5,4(sp)
80007118:	00012b03          	lw	s6,0(sp)
8000711c:	02010113          	addi	sp,sp,32
80007120:	00008067          	ret
80007124:	01051413          	slli	s0,a0,0x10
80007128:	18200793          	li	a5,386
8000712c:	01045413          	srli	s0,s0,0x10
80007130:	0af60463          	beq	a2,a5,800071d8 <pbuf_alloc+0x120>
80007134:	28000793          	li	a5,640
80007138:	faf61ee3          	bne	a2,a5,800070f4 <pbuf_alloc+0x3c>
8000713c:	00340413          	addi	s0,s0,3
80007140:	00358793          	addi	a5,a1,3
80007144:	ffc47413          	andi	s0,s0,-4
80007148:	ffc7f793          	andi	a5,a5,-4
8000714c:	00f40433          	add	s0,s0,a5
80007150:	01041413          	slli	s0,s0,0x10
80007154:	01045413          	srli	s0,s0,0x10
80007158:	00050993          	mv	s3,a0
8000715c:	01040513          	addi	a0,s0,16
80007160:	f8f46ae3          	bltu	s0,a5,800070f4 <pbuf_alloc+0x3c>
80007164:	f8f568e3          	bltu	a0,a5,800070f4 <pbuf_alloc+0x3c>
80007168:	c58ff0ef          	jal	ra,800065c0 <lwip_malloc>
8000716c:	00050493          	mv	s1,a0
80007170:	f80504e3          	beqz	a0,800070f8 <pbuf_alloc+0x40>
80007174:	01099993          	slli	s3,s3,0x10
80007178:	0109d993          	srli	s3,s3,0x10
8000717c:	013509b3          	add	s3,a0,s3
80007180:	01398993          	addi	s3,s3,19
80007184:	000107b7          	lui	a5,0x10
80007188:	ffc9f993          	andi	s3,s3,-4
8000718c:	08078793          	addi	a5,a5,128 # 10080 <_stack_size+0xf880>
80007190:	00052023          	sw	zero,0(a0)
80007194:	01352223          	sw	s3,4(a0)
80007198:	01251423          	sh	s2,8(a0)
8000719c:	01251523          	sh	s2,10(a0)
800071a0:	00f52623          	sw	a5,12(a0)
800071a4:	f55ff06f          	j	800070f8 <pbuf_alloc+0x40>
800071a8:	01812403          	lw	s0,24(sp)
800071ac:	01c12083          	lw	ra,28(sp)
800071b0:	01412483          	lw	s1,20(sp)
800071b4:	00c12983          	lw	s3,12(sp)
800071b8:	00812a03          	lw	s4,8(sp)
800071bc:	00412a83          	lw	s5,4(sp)
800071c0:	00012b03          	lw	s6,0(sp)
800071c4:	00090593          	mv	a1,s2
800071c8:	01012903          	lw	s2,16(sp)
800071cc:	00000513          	li	a0,0
800071d0:	02010113          	addi	sp,sp,32
800071d4:	cb5ff06f          	j	80006e88 <pbuf_alloc_reference>
800071d8:	000109b7          	lui	s3,0x10
800071dc:	00000a13          	li	s4,0
800071e0:	00000493          	li	s1,0
800071e4:	80003ab7          	lui	s5,0x80003
800071e8:	5ec00b13          	li	s6,1516
800071ec:	08298993          	addi	s3,s3,130 # 10082 <_stack_size+0xf882>
800071f0:	0f300613          	li	a2,243
800071f4:	ce4a8593          	addi	a1,s5,-796 # 80002ce4 <_ram_heap_end+0xffff0ce4>
800071f8:	00500513          	li	a0,5
800071fc:	cfcff0ef          	jal	ra,800066f8 <memp_malloc_fn>
80007200:	00051a63          	bnez	a0,80007214 <pbuf_alloc+0x15c>
80007204:	ee0488e3          	beqz	s1,800070f4 <pbuf_alloc+0x3c>
80007208:	00048513          	mv	a0,s1
8000720c:	dd9ff0ef          	jal	ra,80006fe4 <pbuf_free>
80007210:	ee5ff06f          	j	800070f4 <pbuf_alloc+0x3c>
80007214:	00340793          	addi	a5,s0,3
80007218:	ffc7f793          	andi	a5,a5,-4
8000721c:	40fb07b3          	sub	a5,s6,a5
80007220:	00078713          	mv	a4,a5
80007224:	01079793          	slli	a5,a5,0x10
80007228:	0107d793          	srli	a5,a5,0x10
8000722c:	00f97463          	bgeu	s2,a5,80007234 <pbuf_alloc+0x17c>
80007230:	00090713          	mv	a4,s2
80007234:	00850433          	add	s0,a0,s0
80007238:	01340413          	addi	s0,s0,19
8000723c:	ffc47413          	andi	s0,s0,-4
80007240:	01071793          	slli	a5,a4,0x10
80007244:	00052023          	sw	zero,0(a0)
80007248:	00852223          	sw	s0,4(a0)
8000724c:	01251423          	sh	s2,8(a0)
80007250:	00e51523          	sh	a4,10(a0)
80007254:	01352623          	sw	s3,12(a0)
80007258:	0107d793          	srli	a5,a5,0x10
8000725c:	02048263          	beqz	s1,80007280 <pbuf_alloc+0x1c8>
80007260:	00aa2023          	sw	a0,0(s4)
80007264:	40f90933          	sub	s2,s2,a5
80007268:	01091913          	slli	s2,s2,0x10
8000726c:	01095913          	srli	s2,s2,0x10
80007270:	00000413          	li	s0,0
80007274:	00050a13          	mv	s4,a0
80007278:	f6091ce3          	bnez	s2,800071f0 <pbuf_alloc+0x138>
8000727c:	e7dff06f          	j	800070f8 <pbuf_alloc+0x40>
80007280:	00050493          	mv	s1,a0
80007284:	fe1ff06f          	j	80007264 <pbuf_alloc+0x1ac>

80007288 <pbuf_realloc>:
80007288:	00855783          	lhu	a5,8(a0)
8000728c:	0af5f463          	bgeu	a1,a5,80007334 <pbuf_realloc+0xac>
80007290:	ff010113          	addi	sp,sp,-16
80007294:	00812423          	sw	s0,8(sp)
80007298:	00912223          	sw	s1,4(sp)
8000729c:	00112623          	sw	ra,12(sp)
800072a0:	00050413          	mv	s0,a0
800072a4:	00058493          	mv	s1,a1
800072a8:	40f587b3          	sub	a5,a1,a5
800072ac:	00a45583          	lhu	a1,10(s0)
800072b0:	0695e263          	bltu	a1,s1,80007314 <pbuf_realloc+0x8c>
800072b4:	00c44783          	lbu	a5,12(s0)
800072b8:	00f7f793          	andi	a5,a5,15
800072bc:	02079663          	bnez	a5,800072e8 <pbuf_realloc+0x60>
800072c0:	02958463          	beq	a1,s1,800072e8 <pbuf_realloc+0x60>
800072c4:	00d44783          	lbu	a5,13(s0)
800072c8:	0027f793          	andi	a5,a5,2
800072cc:	00079e63          	bnez	a5,800072e8 <pbuf_realloc+0x60>
800072d0:	00442583          	lw	a1,4(s0)
800072d4:	00040513          	mv	a0,s0
800072d8:	408585b3          	sub	a1,a1,s0
800072dc:	009585b3          	add	a1,a1,s1
800072e0:	adcff0ef          	jal	ra,800065bc <mem_trim>
800072e4:	00050413          	mv	s0,a0
800072e8:	00042503          	lw	a0,0(s0)
800072ec:	00941523          	sh	s1,10(s0)
800072f0:	00941423          	sh	s1,8(s0)
800072f4:	00050463          	beqz	a0,800072fc <pbuf_realloc+0x74>
800072f8:	cedff0ef          	jal	ra,80006fe4 <pbuf_free>
800072fc:	00042023          	sw	zero,0(s0)
80007300:	00c12083          	lw	ra,12(sp)
80007304:	00812403          	lw	s0,8(sp)
80007308:	00412483          	lw	s1,4(sp)
8000730c:	01010113          	addi	sp,sp,16
80007310:	00008067          	ret
80007314:	00845703          	lhu	a4,8(s0)
80007318:	40b484b3          	sub	s1,s1,a1
8000731c:	01049493          	slli	s1,s1,0x10
80007320:	00e78733          	add	a4,a5,a4
80007324:	00e41423          	sh	a4,8(s0)
80007328:	0104d493          	srli	s1,s1,0x10
8000732c:	00042403          	lw	s0,0(s0)
80007330:	f7dff06f          	j	800072ac <pbuf_realloc+0x24>
80007334:	00008067          	ret

80007338 <pbuf_free_header>:
80007338:	fe010113          	addi	sp,sp,-32
8000733c:	00812c23          	sw	s0,24(sp)
80007340:	00112e23          	sw	ra,28(sp)
80007344:	00912a23          	sw	s1,20(sp)
80007348:	00050413          	mv	s0,a0
8000734c:	04058263          	beqz	a1,80007390 <pbuf_free_header+0x58>
80007350:	04040063          	beqz	s0,80007390 <pbuf_free_header+0x58>
80007354:	00a45783          	lhu	a5,10(s0)
80007358:	02f5e863          	bltu	a1,a5,80007388 <pbuf_free_header+0x50>
8000735c:	40f585b3          	sub	a1,a1,a5
80007360:	00042483          	lw	s1,0(s0)
80007364:	01059593          	slli	a1,a1,0x10
80007368:	0105d593          	srli	a1,a1,0x10
8000736c:	00042023          	sw	zero,0(s0)
80007370:	00040513          	mv	a0,s0
80007374:	00b12623          	sw	a1,12(sp)
80007378:	c6dff0ef          	jal	ra,80006fe4 <pbuf_free>
8000737c:	00048413          	mv	s0,s1
80007380:	00c12583          	lw	a1,12(sp)
80007384:	fc9ff06f          	j	8000734c <pbuf_free_header+0x14>
80007388:	00040513          	mv	a0,s0
8000738c:	bd1ff0ef          	jal	ra,80006f5c <pbuf_remove_header>
80007390:	00040513          	mv	a0,s0
80007394:	01c12083          	lw	ra,28(sp)
80007398:	01812403          	lw	s0,24(sp)
8000739c:	01412483          	lw	s1,20(sp)
800073a0:	02010113          	addi	sp,sp,32
800073a4:	00008067          	ret

800073a8 <pbuf_clen>:
800073a8:	00000793          	li	a5,0
800073ac:	00051663          	bnez	a0,800073b8 <pbuf_clen+0x10>
800073b0:	00078513          	mv	a0,a5
800073b4:	00008067          	ret
800073b8:	00178793          	addi	a5,a5,1
800073bc:	01079793          	slli	a5,a5,0x10
800073c0:	0107d793          	srli	a5,a5,0x10
800073c4:	00052503          	lw	a0,0(a0)
800073c8:	fe5ff06f          	j	800073ac <pbuf_clen+0x4>

800073cc <pbuf_ref>:
800073cc:	02050a63          	beqz	a0,80007400 <pbuf_ref+0x34>
800073d0:	ff010113          	addi	sp,sp,-16
800073d4:	00812423          	sw	s0,8(sp)
800073d8:	00112623          	sw	ra,12(sp)
800073dc:	00050413          	mv	s0,a0
800073e0:	ae5fd0ef          	jal	ra,80004ec4 <sys_arch_protect>
800073e4:	00e44783          	lbu	a5,14(s0)
800073e8:	00178793          	addi	a5,a5,1
800073ec:	00f40723          	sb	a5,14(s0)
800073f0:	00812403          	lw	s0,8(sp)
800073f4:	00c12083          	lw	ra,12(sp)
800073f8:	01010113          	addi	sp,sp,16
800073fc:	acdfd06f          	j	80004ec8 <sys_arch_unprotect>
80007400:	00008067          	ret

80007404 <pbuf_cat>:
80007404:	02050a63          	beqz	a0,80007438 <pbuf_cat+0x34>
80007408:	00059663          	bnez	a1,80007414 <pbuf_cat+0x10>
8000740c:	00008067          	ret
80007410:	00070513          	mv	a0,a4
80007414:	00855783          	lhu	a5,8(a0)
80007418:	0085d683          	lhu	a3,8(a1)
8000741c:	00052703          	lw	a4,0(a0)
80007420:	00d787b3          	add	a5,a5,a3
80007424:	01079793          	slli	a5,a5,0x10
80007428:	0107d793          	srli	a5,a5,0x10
8000742c:	00f51423          	sh	a5,8(a0)
80007430:	fe0710e3          	bnez	a4,80007410 <pbuf_cat+0xc>
80007434:	00b52023          	sw	a1,0(a0)
80007438:	00008067          	ret

8000743c <pbuf_chain>:
8000743c:	ff010113          	addi	sp,sp,-16
80007440:	00812423          	sw	s0,8(sp)
80007444:	00112623          	sw	ra,12(sp)
80007448:	00058413          	mv	s0,a1
8000744c:	fb9ff0ef          	jal	ra,80007404 <pbuf_cat>
80007450:	00040513          	mv	a0,s0
80007454:	00812403          	lw	s0,8(sp)
80007458:	00c12083          	lw	ra,12(sp)
8000745c:	01010113          	addi	sp,sp,16
80007460:	f6dff06f          	j	800073cc <pbuf_ref>

80007464 <pbuf_dechain>:
80007464:	ff010113          	addi	sp,sp,-16
80007468:	00112623          	sw	ra,12(sp)
8000746c:	00812423          	sw	s0,8(sp)
80007470:	00052403          	lw	s0,0(a0)
80007474:	02040663          	beqz	s0,800074a0 <pbuf_dechain+0x3c>
80007478:	00855783          	lhu	a5,8(a0)
8000747c:	00a55703          	lhu	a4,10(a0)
80007480:	40e787b3          	sub	a5,a5,a4
80007484:	00f41423          	sh	a5,8(s0)
80007488:	00a55783          	lhu	a5,10(a0)
8000748c:	00052023          	sw	zero,0(a0)
80007490:	00f51423          	sh	a5,8(a0)
80007494:	00040513          	mv	a0,s0
80007498:	b4dff0ef          	jal	ra,80006fe4 <pbuf_free>
8000749c:	00050463          	beqz	a0,800074a4 <pbuf_dechain+0x40>
800074a0:	00000413          	li	s0,0
800074a4:	00040513          	mv	a0,s0
800074a8:	00c12083          	lw	ra,12(sp)
800074ac:	00812403          	lw	s0,8(sp)
800074b0:	01010113          	addi	sp,sp,16
800074b4:	00008067          	ret

800074b8 <pbuf_copy>:
800074b8:	10050463          	beqz	a0,800075c0 <pbuf_copy+0x108>
800074bc:	fe010113          	addi	sp,sp,-32
800074c0:	00812c23          	sw	s0,24(sp)
800074c4:	00112e23          	sw	ra,28(sp)
800074c8:	00912a23          	sw	s1,20(sp)
800074cc:	01212823          	sw	s2,16(sp)
800074d0:	01312623          	sw	s3,12(sp)
800074d4:	01412423          	sw	s4,8(sp)
800074d8:	00058413          	mv	s0,a1
800074dc:	06058e63          	beqz	a1,80007558 <pbuf_copy+0xa0>
800074e0:	00855703          	lhu	a4,8(a0)
800074e4:	0085d783          	lhu	a5,8(a1)
800074e8:	00050493          	mv	s1,a0
800074ec:	06f76663          	bltu	a4,a5,80007558 <pbuf_copy+0xa0>
800074f0:	00000a13          	li	s4,0
800074f4:	00000993          	li	s3,0
800074f8:	00a4d903          	lhu	s2,10(s1)
800074fc:	00a45783          	lhu	a5,10(s0)
80007500:	41390933          	sub	s2,s2,s3
80007504:	414787b3          	sub	a5,a5,s4
80007508:	0127f463          	bgeu	a5,s2,80007510 <pbuf_copy+0x58>
8000750c:	00078913          	mv	s2,a5
80007510:	0044a503          	lw	a0,4(s1)
80007514:	00442583          	lw	a1,4(s0)
80007518:	00090613          	mv	a2,s2
8000751c:	01350533          	add	a0,a0,s3
80007520:	014585b3          	add	a1,a1,s4
80007524:	4b1060ef          	jal	ra,8000e1d4 <memcpy>
80007528:	00a45703          	lhu	a4,10(s0)
8000752c:	012a0a33          	add	s4,s4,s2
80007530:	012989b3          	add	s3,s3,s2
80007534:	00a4d783          	lhu	a5,10(s1)
80007538:	00ea6663          	bltu	s4,a4,80007544 <pbuf_copy+0x8c>
8000753c:	00042403          	lw	s0,0(s0)
80007540:	00000a13          	li	s4,0
80007544:	02f99e63          	bne	s3,a5,80007580 <pbuf_copy+0xc8>
80007548:	0004a483          	lw	s1,0(s1)
8000754c:	02049863          	bnez	s1,8000757c <pbuf_copy+0xc4>
80007550:	00000513          	li	a0,0
80007554:	00040463          	beqz	s0,8000755c <pbuf_copy+0xa4>
80007558:	ff000513          	li	a0,-16
8000755c:	01c12083          	lw	ra,28(sp)
80007560:	01812403          	lw	s0,24(sp)
80007564:	01412483          	lw	s1,20(sp)
80007568:	01012903          	lw	s2,16(sp)
8000756c:	00c12983          	lw	s3,12(sp)
80007570:	00812a03          	lw	s4,8(sp)
80007574:	02010113          	addi	sp,sp,32
80007578:	00008067          	ret
8000757c:	00000993          	li	s3,0
80007580:	00040c63          	beqz	s0,80007598 <pbuf_copy+0xe0>
80007584:	00a45703          	lhu	a4,10(s0)
80007588:	00845783          	lhu	a5,8(s0)
8000758c:	00f71663          	bne	a4,a5,80007598 <pbuf_copy+0xe0>
80007590:	00042783          	lw	a5,0(s0)
80007594:	02079263          	bnez	a5,800075b8 <pbuf_copy+0x100>
80007598:	00a4d703          	lhu	a4,10(s1)
8000759c:	0084d783          	lhu	a5,8(s1)
800075a0:	00f71663          	bne	a4,a5,800075ac <pbuf_copy+0xf4>
800075a4:	0004a783          	lw	a5,0(s1)
800075a8:	00079863          	bnez	a5,800075b8 <pbuf_copy+0x100>
800075ac:	f40416e3          	bnez	s0,800074f8 <pbuf_copy+0x40>
800075b0:	00000513          	li	a0,0
800075b4:	fa9ff06f          	j	8000755c <pbuf_copy+0xa4>
800075b8:	ffa00513          	li	a0,-6
800075bc:	fa1ff06f          	j	8000755c <pbuf_copy+0xa4>
800075c0:	ff000513          	li	a0,-16
800075c4:	00008067          	ret

800075c8 <pbuf_copy_partial>:
800075c8:	fe010113          	addi	sp,sp,-32
800075cc:	00812c23          	sw	s0,24(sp)
800075d0:	00112e23          	sw	ra,28(sp)
800075d4:	00912a23          	sw	s1,20(sp)
800075d8:	01212823          	sw	s2,16(sp)
800075dc:	01312623          	sw	s3,12(sp)
800075e0:	01412423          	sw	s4,8(sp)
800075e4:	00000413          	li	s0,0
800075e8:	02050063          	beqz	a0,80007608 <pbuf_copy_partial+0x40>
800075ec:	00058a13          	mv	s4,a1
800075f0:	00000413          	li	s0,0
800075f4:	00058a63          	beqz	a1,80007608 <pbuf_copy_partial+0x40>
800075f8:	00050913          	mv	s2,a0
800075fc:	00060493          	mv	s1,a2
80007600:	00048463          	beqz	s1,80007608 <pbuf_copy_partial+0x40>
80007604:	02091463          	bnez	s2,8000762c <pbuf_copy_partial+0x64>
80007608:	00040513          	mv	a0,s0
8000760c:	01c12083          	lw	ra,28(sp)
80007610:	01812403          	lw	s0,24(sp)
80007614:	01412483          	lw	s1,20(sp)
80007618:	01012903          	lw	s2,16(sp)
8000761c:	00c12983          	lw	s3,12(sp)
80007620:	00812a03          	lw	s4,8(sp)
80007624:	02010113          	addi	sp,sp,32
80007628:	00008067          	ret
8000762c:	00a95583          	lhu	a1,10(s2)
80007630:	00068e63          	beqz	a3,8000764c <pbuf_copy_partial+0x84>
80007634:	00b6ec63          	bltu	a3,a1,8000764c <pbuf_copy_partial+0x84>
80007638:	40b686b3          	sub	a3,a3,a1
8000763c:	01069693          	slli	a3,a3,0x10
80007640:	0106d693          	srli	a3,a3,0x10
80007644:	00092903          	lw	s2,0(s2)
80007648:	fb9ff06f          	j	80007600 <pbuf_copy_partial+0x38>
8000764c:	40d585b3          	sub	a1,a1,a3
80007650:	01059593          	slli	a1,a1,0x10
80007654:	0105d593          	srli	a1,a1,0x10
80007658:	00058993          	mv	s3,a1
8000765c:	00b4f463          	bgeu	s1,a1,80007664 <pbuf_copy_partial+0x9c>
80007660:	00048993          	mv	s3,s1
80007664:	00492583          	lw	a1,4(s2)
80007668:	01099993          	slli	s3,s3,0x10
8000766c:	0109d993          	srli	s3,s3,0x10
80007670:	00d585b3          	add	a1,a1,a3
80007674:	008a0533          	add	a0,s4,s0
80007678:	00098613          	mv	a2,s3
8000767c:	01340433          	add	s0,s0,s3
80007680:	413484b3          	sub	s1,s1,s3
80007684:	351060ef          	jal	ra,8000e1d4 <memcpy>
80007688:	01041413          	slli	s0,s0,0x10
8000768c:	01049493          	slli	s1,s1,0x10
80007690:	01045413          	srli	s0,s0,0x10
80007694:	0104d493          	srli	s1,s1,0x10
80007698:	00000693          	li	a3,0
8000769c:	fa9ff06f          	j	80007644 <pbuf_copy_partial+0x7c>

800076a0 <pbuf_get_contiguous>:
800076a0:	fe010113          	addi	sp,sp,-32
800076a4:	00112e23          	sw	ra,28(sp)
800076a8:	00812c23          	sw	s0,24(sp)
800076ac:	00912a23          	sw	s1,20(sp)
800076b0:	02051063          	bnez	a0,800076d0 <pbuf_get_contiguous+0x30>
800076b4:	00000413          	li	s0,0
800076b8:	00040513          	mv	a0,s0
800076bc:	01c12083          	lw	ra,28(sp)
800076c0:	01812403          	lw	s0,24(sp)
800076c4:	01412483          	lw	s1,20(sp)
800076c8:	02010113          	addi	sp,sp,32
800076cc:	00008067          	ret
800076d0:	00058413          	mv	s0,a1
800076d4:	fe0580e3          	beqz	a1,800076b4 <pbuf_get_contiguous+0x14>
800076d8:	00068493          	mv	s1,a3
800076dc:	fcd66ce3          	bltu	a2,a3,800076b4 <pbuf_get_contiguous+0x14>
800076e0:	00e10613          	addi	a2,sp,14
800076e4:	00070593          	mv	a1,a4
800076e8:	ee4ff0ef          	jal	ra,80006dcc <pbuf_skip_const>
800076ec:	fc0504e3          	beqz	a0,800076b4 <pbuf_get_contiguous+0x14>
800076f0:	00e15683          	lhu	a3,14(sp)
800076f4:	00a55603          	lhu	a2,10(a0)
800076f8:	00968733          	add	a4,a3,s1
800076fc:	00e64863          	blt	a2,a4,8000770c <pbuf_get_contiguous+0x6c>
80007700:	00452403          	lw	s0,4(a0)
80007704:	00d40433          	add	s0,s0,a3
80007708:	fb1ff06f          	j	800076b8 <pbuf_get_contiguous+0x18>
8000770c:	00048613          	mv	a2,s1
80007710:	00040593          	mv	a1,s0
80007714:	eb5ff0ef          	jal	ra,800075c8 <pbuf_copy_partial>
80007718:	fa9500e3          	beq	a0,s1,800076b8 <pbuf_get_contiguous+0x18>
8000771c:	f99ff06f          	j	800076b4 <pbuf_get_contiguous+0x14>

80007720 <pbuf_skip>:
80007720:	eacff06f          	j	80006dcc <pbuf_skip_const>

80007724 <pbuf_take>:
80007724:	08050c63          	beqz	a0,800077bc <pbuf_take+0x98>
80007728:	fe010113          	addi	sp,sp,-32
8000772c:	00912a23          	sw	s1,20(sp)
80007730:	01412423          	sw	s4,8(sp)
80007734:	00112e23          	sw	ra,28(sp)
80007738:	00812c23          	sw	s0,24(sp)
8000773c:	01212823          	sw	s2,16(sp)
80007740:	01312623          	sw	s3,12(sp)
80007744:	00050493          	mv	s1,a0
80007748:	00058a13          	mv	s4,a1
8000774c:	ff000513          	li	a0,-16
80007750:	00058c63          	beqz	a1,80007768 <pbuf_take+0x44>
80007754:	0084d783          	lhu	a5,8(s1)
80007758:	00060413          	mv	s0,a2
8000775c:	fff00513          	li	a0,-1
80007760:	00000993          	li	s3,0
80007764:	04c7f663          	bgeu	a5,a2,800077b0 <pbuf_take+0x8c>
80007768:	01c12083          	lw	ra,28(sp)
8000776c:	01812403          	lw	s0,24(sp)
80007770:	01412483          	lw	s1,20(sp)
80007774:	01012903          	lw	s2,16(sp)
80007778:	00c12983          	lw	s3,12(sp)
8000777c:	00812a03          	lw	s4,8(sp)
80007780:	02010113          	addi	sp,sp,32
80007784:	00008067          	ret
80007788:	00a4d903          	lhu	s2,10(s1)
8000778c:	01247463          	bgeu	s0,s2,80007794 <pbuf_take+0x70>
80007790:	00040913          	mv	s2,s0
80007794:	0044a503          	lw	a0,4(s1)
80007798:	013a05b3          	add	a1,s4,s3
8000779c:	00090613          	mv	a2,s2
800077a0:	235060ef          	jal	ra,8000e1d4 <memcpy>
800077a4:	0004a483          	lw	s1,0(s1)
800077a8:	41240433          	sub	s0,s0,s2
800077ac:	012989b3          	add	s3,s3,s2
800077b0:	fc041ce3          	bnez	s0,80007788 <pbuf_take+0x64>
800077b4:	00000513          	li	a0,0
800077b8:	fb1ff06f          	j	80007768 <pbuf_take+0x44>
800077bc:	ff000513          	li	a0,-16
800077c0:	00008067          	ret

800077c4 <pbuf_take_at>:
800077c4:	fd010113          	addi	sp,sp,-48
800077c8:	02812423          	sw	s0,40(sp)
800077cc:	01312e23          	sw	s3,28(sp)
800077d0:	00060413          	mv	s0,a2
800077d4:	00058993          	mv	s3,a1
800077d8:	00e10613          	addi	a2,sp,14
800077dc:	00068593          	mv	a1,a3
800077e0:	02112623          	sw	ra,44(sp)
800077e4:	02912223          	sw	s1,36(sp)
800077e8:	03212023          	sw	s2,32(sp)
800077ec:	de0ff0ef          	jal	ra,80006dcc <pbuf_skip_const>
800077f0:	08050263          	beqz	a0,80007874 <pbuf_take_at+0xb0>
800077f4:	00e15703          	lhu	a4,14(sp)
800077f8:	00855683          	lhu	a3,8(a0)
800077fc:	00050493          	mv	s1,a0
80007800:	008707b3          	add	a5,a4,s0
80007804:	fff00513          	li	a0,-1
80007808:	04f6c863          	blt	a3,a5,80007858 <pbuf_take_at+0x94>
8000780c:	00a4d783          	lhu	a5,10(s1)
80007810:	00040913          	mv	s2,s0
80007814:	40e787b3          	sub	a5,a5,a4
80007818:	0087d663          	bge	a5,s0,80007824 <pbuf_take_at+0x60>
8000781c:	01079913          	slli	s2,a5,0x10
80007820:	01095913          	srli	s2,s2,0x10
80007824:	0044a503          	lw	a0,4(s1)
80007828:	00090613          	mv	a2,s2
8000782c:	00098593          	mv	a1,s3
80007830:	00e50533          	add	a0,a0,a4
80007834:	1a1060ef          	jal	ra,8000e1d4 <memcpy>
80007838:	41240633          	sub	a2,s0,s2
8000783c:	01061613          	slli	a2,a2,0x10
80007840:	01065613          	srli	a2,a2,0x10
80007844:	00000513          	li	a0,0
80007848:	00060863          	beqz	a2,80007858 <pbuf_take_at+0x94>
8000784c:	0004a503          	lw	a0,0(s1)
80007850:	012985b3          	add	a1,s3,s2
80007854:	ed1ff0ef          	jal	ra,80007724 <pbuf_take>
80007858:	02c12083          	lw	ra,44(sp)
8000785c:	02812403          	lw	s0,40(sp)
80007860:	02412483          	lw	s1,36(sp)
80007864:	02012903          	lw	s2,32(sp)
80007868:	01c12983          	lw	s3,28(sp)
8000786c:	03010113          	addi	sp,sp,48
80007870:	00008067          	ret
80007874:	fff00513          	li	a0,-1
80007878:	fe1ff06f          	j	80007858 <pbuf_take_at+0x94>

8000787c <pbuf_clone>:
8000787c:	ff010113          	addi	sp,sp,-16
80007880:	00912223          	sw	s1,4(sp)
80007884:	00060493          	mv	s1,a2
80007888:	00058613          	mv	a2,a1
8000788c:	0084d583          	lhu	a1,8(s1)
80007890:	00812423          	sw	s0,8(sp)
80007894:	00112623          	sw	ra,12(sp)
80007898:	821ff0ef          	jal	ra,800070b8 <pbuf_alloc>
8000789c:	00050413          	mv	s0,a0
800078a0:	00050663          	beqz	a0,800078ac <pbuf_clone+0x30>
800078a4:	00048593          	mv	a1,s1
800078a8:	c11ff0ef          	jal	ra,800074b8 <pbuf_copy>
800078ac:	00040513          	mv	a0,s0
800078b0:	00c12083          	lw	ra,12(sp)
800078b4:	00812403          	lw	s0,8(sp)
800078b8:	00412483          	lw	s1,4(sp)
800078bc:	01010113          	addi	sp,sp,16
800078c0:	00008067          	ret

800078c4 <pbuf_coalesce>:
800078c4:	ff010113          	addi	sp,sp,-16
800078c8:	00812423          	sw	s0,8(sp)
800078cc:	00112623          	sw	ra,12(sp)
800078d0:	00912223          	sw	s1,4(sp)
800078d4:	00052783          	lw	a5,0(a0)
800078d8:	00050413          	mv	s0,a0
800078dc:	02079063          	bnez	a5,800078fc <pbuf_coalesce+0x38>
800078e0:	00040493          	mv	s1,s0
800078e4:	00c12083          	lw	ra,12(sp)
800078e8:	00812403          	lw	s0,8(sp)
800078ec:	00048513          	mv	a0,s1
800078f0:	00412483          	lw	s1,4(sp)
800078f4:	01010113          	addi	sp,sp,16
800078f8:	00008067          	ret
800078fc:	00058513          	mv	a0,a1
80007900:	00040613          	mv	a2,s0
80007904:	28000593          	li	a1,640
80007908:	f75ff0ef          	jal	ra,8000787c <pbuf_clone>
8000790c:	00050493          	mv	s1,a0
80007910:	fc0508e3          	beqz	a0,800078e0 <pbuf_coalesce+0x1c>
80007914:	00040513          	mv	a0,s0
80007918:	eccff0ef          	jal	ra,80006fe4 <pbuf_free>
8000791c:	fc9ff06f          	j	800078e4 <pbuf_coalesce+0x20>

80007920 <pbuf_try_get_at>:
80007920:	fe010113          	addi	sp,sp,-32
80007924:	00e10613          	addi	a2,sp,14
80007928:	00112e23          	sw	ra,28(sp)
8000792c:	ca0ff0ef          	jal	ra,80006dcc <pbuf_skip_const>
80007930:	fff00793          	li	a5,-1
80007934:	02050063          	beqz	a0,80007954 <pbuf_try_get_at+0x34>
80007938:	00e15703          	lhu	a4,14(sp)
8000793c:	00a55683          	lhu	a3,10(a0)
80007940:	fff00793          	li	a5,-1
80007944:	00d77863          	bgeu	a4,a3,80007954 <pbuf_try_get_at+0x34>
80007948:	00452783          	lw	a5,4(a0)
8000794c:	00e787b3          	add	a5,a5,a4
80007950:	0007c783          	lbu	a5,0(a5)
80007954:	01c12083          	lw	ra,28(sp)
80007958:	00078513          	mv	a0,a5
8000795c:	02010113          	addi	sp,sp,32
80007960:	00008067          	ret

80007964 <pbuf_get_at>:
80007964:	ff010113          	addi	sp,sp,-16
80007968:	00112623          	sw	ra,12(sp)
8000796c:	fb5ff0ef          	jal	ra,80007920 <pbuf_try_get_at>
80007970:	00055463          	bgez	a0,80007978 <pbuf_get_at+0x14>
80007974:	00000513          	li	a0,0
80007978:	00c12083          	lw	ra,12(sp)
8000797c:	0ff57513          	andi	a0,a0,255
80007980:	01010113          	addi	sp,sp,16
80007984:	00008067          	ret

80007988 <pbuf_put_at>:
80007988:	fe010113          	addi	sp,sp,-32
8000798c:	00812c23          	sw	s0,24(sp)
80007990:	00060413          	mv	s0,a2
80007994:	00e10613          	addi	a2,sp,14
80007998:	00112e23          	sw	ra,28(sp)
8000799c:	c30ff0ef          	jal	ra,80006dcc <pbuf_skip_const>
800079a0:	00050e63          	beqz	a0,800079bc <pbuf_put_at+0x34>
800079a4:	00e15703          	lhu	a4,14(sp)
800079a8:	00a55783          	lhu	a5,10(a0)
800079ac:	00f77863          	bgeu	a4,a5,800079bc <pbuf_put_at+0x34>
800079b0:	00452783          	lw	a5,4(a0)
800079b4:	00e787b3          	add	a5,a5,a4
800079b8:	00878023          	sb	s0,0(a5)
800079bc:	01c12083          	lw	ra,28(sp)
800079c0:	01812403          	lw	s0,24(sp)
800079c4:	02010113          	addi	sp,sp,32
800079c8:	00008067          	ret

800079cc <pbuf_memcmp>:
800079cc:	00855703          	lhu	a4,8(a0)
800079d0:	00d587b3          	add	a5,a1,a3
800079d4:	00f75863          	bge	a4,a5,800079e4 <pbuf_memcmp+0x18>
800079d8:	00010537          	lui	a0,0x10
800079dc:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xf7ff>
800079e0:	00008067          	ret
800079e4:	fd010113          	addi	sp,sp,-48
800079e8:	02812423          	sw	s0,40(sp)
800079ec:	02912223          	sw	s1,36(sp)
800079f0:	02112623          	sw	ra,44(sp)
800079f4:	03212023          	sw	s2,32(sp)
800079f8:	01312e23          	sw	s3,28(sp)
800079fc:	00050493          	mv	s1,a0
80007a00:	00058413          	mv	s0,a1
80007a04:	00a4d783          	lhu	a5,10(s1)
80007a08:	00f46c63          	bltu	s0,a5,80007a20 <pbuf_memcmp+0x54>
80007a0c:	0004a483          	lw	s1,0(s1)
80007a10:	40f40433          	sub	s0,s0,a5
80007a14:	01041413          	slli	s0,s0,0x10
80007a18:	01045413          	srli	s0,s0,0x10
80007a1c:	fe0494e3          	bnez	s1,80007a04 <pbuf_memcmp+0x38>
80007a20:	00000993          	li	s3,0
80007a24:	01099913          	slli	s2,s3,0x10
80007a28:	01095913          	srli	s2,s2,0x10
80007a2c:	00d96663          	bltu	s2,a3,80007a38 <pbuf_memcmp+0x6c>
80007a30:	00000513          	li	a0,0
80007a34:	0580006f          	j	80007a8c <pbuf_memcmp+0xc0>
80007a38:	008905b3          	add	a1,s2,s0
80007a3c:	01059593          	slli	a1,a1,0x10
80007a40:	0105d593          	srli	a1,a1,0x10
80007a44:	00048513          	mv	a0,s1
80007a48:	00d12623          	sw	a3,12(sp)
80007a4c:	00c12423          	sw	a2,8(sp)
80007a50:	f15ff0ef          	jal	ra,80007964 <pbuf_get_at>
80007a54:	00812603          	lw	a2,8(sp)
80007a58:	00198993          	addi	s3,s3,1
80007a5c:	00c12683          	lw	a3,12(sp)
80007a60:	013607b3          	add	a5,a2,s3
80007a64:	fff7c783          	lbu	a5,-1(a5)
80007a68:	faa78ee3          	beq	a5,a0,80007a24 <pbuf_memcmp+0x58>
80007a6c:	000107b7          	lui	a5,0x10
80007a70:	ffe78793          	addi	a5,a5,-2 # fffe <_stack_size+0xf7fe>
80007a74:	00090513          	mv	a0,s2
80007a78:	0127f463          	bgeu	a5,s2,80007a80 <pbuf_memcmp+0xb4>
80007a7c:	ffe00513          	li	a0,-2
80007a80:	00150513          	addi	a0,a0,1
80007a84:	01051513          	slli	a0,a0,0x10
80007a88:	01055513          	srli	a0,a0,0x10
80007a8c:	02c12083          	lw	ra,44(sp)
80007a90:	02812403          	lw	s0,40(sp)
80007a94:	02412483          	lw	s1,36(sp)
80007a98:	02012903          	lw	s2,32(sp)
80007a9c:	01c12983          	lw	s3,28(sp)
80007aa0:	03010113          	addi	sp,sp,48
80007aa4:	00008067          	ret

80007aa8 <pbuf_memfind>:
80007aa8:	fe010113          	addi	sp,sp,-32
80007aac:	00112e23          	sw	ra,28(sp)
80007ab0:	00812c23          	sw	s0,24(sp)
80007ab4:	00912a23          	sw	s1,20(sp)
80007ab8:	01212823          	sw	s2,16(sp)
80007abc:	01312623          	sw	s3,12(sp)
80007ac0:	01412423          	sw	s4,8(sp)
80007ac4:	00855783          	lhu	a5,8(a0)
80007ac8:	00d60733          	add	a4,a2,a3
80007acc:	02e7c263          	blt	a5,a4,80007af0 <pbuf_memfind+0x48>
80007ad0:	40c787b3          	sub	a5,a5,a2
80007ad4:	01079493          	slli	s1,a5,0x10
80007ad8:	00050993          	mv	s3,a0
80007adc:	00058a13          	mv	s4,a1
80007ae0:	00060913          	mv	s2,a2
80007ae4:	00068413          	mv	s0,a3
80007ae8:	0104d493          	srli	s1,s1,0x10
80007aec:	0284f863          	bgeu	s1,s0,80007b1c <pbuf_memfind+0x74>
80007af0:	00010437          	lui	s0,0x10
80007af4:	fff40413          	addi	s0,s0,-1 # ffff <_stack_size+0xf7ff>
80007af8:	00040513          	mv	a0,s0
80007afc:	01c12083          	lw	ra,28(sp)
80007b00:	01812403          	lw	s0,24(sp)
80007b04:	01412483          	lw	s1,20(sp)
80007b08:	01012903          	lw	s2,16(sp)
80007b0c:	00c12983          	lw	s3,12(sp)
80007b10:	00812a03          	lw	s4,8(sp)
80007b14:	02010113          	addi	sp,sp,32
80007b18:	00008067          	ret
80007b1c:	00090693          	mv	a3,s2
80007b20:	000a0613          	mv	a2,s4
80007b24:	00040593          	mv	a1,s0
80007b28:	00098513          	mv	a0,s3
80007b2c:	ea1ff0ef          	jal	ra,800079cc <pbuf_memcmp>
80007b30:	fc0504e3          	beqz	a0,80007af8 <pbuf_memfind+0x50>
80007b34:	00140413          	addi	s0,s0,1
80007b38:	01041413          	slli	s0,s0,0x10
80007b3c:	01045413          	srli	s0,s0,0x10
80007b40:	fadff06f          	j	80007aec <pbuf_memfind+0x44>

80007b44 <pbuf_strstr>:
80007b44:	fe010113          	addi	sp,sp,-32
80007b48:	00812c23          	sw	s0,24(sp)
80007b4c:	01212823          	sw	s2,16(sp)
80007b50:	00112e23          	sw	ra,28(sp)
80007b54:	00010937          	lui	s2,0x10
80007b58:	00912a23          	sw	s1,20(sp)
80007b5c:	fff90413          	addi	s0,s2,-1 # ffff <_stack_size+0xf7ff>
80007b60:	04058c63          	beqz	a1,80007bb8 <pbuf_strstr+0x74>
80007b64:	0005c783          	lbu	a5,0(a1)
80007b68:	04078863          	beqz	a5,80007bb8 <pbuf_strstr+0x74>
80007b6c:	00855783          	lhu	a5,8(a0)
80007b70:	04878663          	beq	a5,s0,80007bbc <pbuf_strstr+0x78>
80007b74:	00050493          	mv	s1,a0
80007b78:	00058513          	mv	a0,a1
80007b7c:	00b12623          	sw	a1,12(sp)
80007b80:	ffe90913          	addi	s2,s2,-2
80007b84:	02c070ef          	jal	ra,8000ebb0 <strlen>
80007b88:	02a96863          	bltu	s2,a0,80007bb8 <pbuf_strstr+0x74>
80007b8c:	01812403          	lw	s0,24(sp)
80007b90:	01051613          	slli	a2,a0,0x10
80007b94:	00c12583          	lw	a1,12(sp)
80007b98:	01c12083          	lw	ra,28(sp)
80007b9c:	01012903          	lw	s2,16(sp)
80007ba0:	00048513          	mv	a0,s1
80007ba4:	01412483          	lw	s1,20(sp)
80007ba8:	00000693          	li	a3,0
80007bac:	01065613          	srli	a2,a2,0x10
80007bb0:	02010113          	addi	sp,sp,32
80007bb4:	ef5ff06f          	j	80007aa8 <pbuf_memfind>
80007bb8:	00040793          	mv	a5,s0
80007bbc:	01c12083          	lw	ra,28(sp)
80007bc0:	01812403          	lw	s0,24(sp)
80007bc4:	01412483          	lw	s1,20(sp)
80007bc8:	01012903          	lw	s2,16(sp)
80007bcc:	00078513          	mv	a0,a5
80007bd0:	02010113          	addi	sp,sp,32
80007bd4:	00008067          	ret

80007bd8 <raw_input>:
80007bd8:	fd010113          	addi	sp,sp,-48
80007bdc:	02912223          	sw	s1,36(sp)
80007be0:	9f418793          	addi	a5,gp,-1548 # 8000329c <ip_data>
80007be4:	02812423          	sw	s0,40(sp)
80007be8:	03212023          	sw	s2,32(sp)
80007bec:	01312e23          	sw	s3,28(sp)
80007bf0:	01412c23          	sw	s4,24(sp)
80007bf4:	01512a23          	sw	s5,20(sp)
80007bf8:	01612823          	sw	s6,16(sp)
80007bfc:	01712623          	sw	s7,12(sp)
80007c00:	02112623          	sw	ra,44(sp)
80007c04:	00050a13          	mv	s4,a0
80007c08:	0007a583          	lw	a1,0(a5)
80007c0c:	0147a503          	lw	a0,20(a5)
80007c10:	00000993          	li	s3,0
80007c14:	9f418493          	addi	s1,gp,-1548 # 8000329c <ip_data>
80007c18:	179040ef          	jal	ra,8000c590 <ip4_addr_isbroadcast_u32>
80007c1c:	004a2783          	lw	a5,4(s4)
80007c20:	00050b13          	mv	s6,a0
80007c24:	0097ca83          	lbu	s5,9(a5)
80007c28:	8d81a403          	lw	s0,-1832(gp) # 80003180 <raw_pcbs>
80007c2c:	00000513          	li	a0,0
80007c30:	00078913          	mv	s2,a5
80007c34:	08040a63          	beqz	s0,80007cc8 <raw_input+0xf0>
80007c38:	01444783          	lbu	a5,20(s0)
80007c3c:	0d579463          	bne	a5,s5,80007d04 <raw_input+0x12c>
80007c40:	00844703          	lbu	a4,8(s0)
80007c44:	00070c63          	beqz	a4,80007c5c <raw_input+0x84>
80007c48:	0044a783          	lw	a5,4(s1)
80007c4c:	0387c783          	lbu	a5,56(a5)
80007c50:	00178793          	addi	a5,a5,1
80007c54:	0ff7f793          	andi	a5,a5,255
80007c58:	0af71663          	bne	a4,a5,80007d04 <raw_input+0x12c>
80007c5c:	080b0c63          	beqz	s6,80007cf4 <raw_input+0x11c>
80007c60:	00944783          	lbu	a5,9(s0)
80007c64:	0207f793          	andi	a5,a5,32
80007c68:	08078e63          	beqz	a5,80007d04 <raw_input+0x12c>
80007c6c:	00042783          	lw	a5,0(s0)
80007c70:	08079a63          	bnez	a5,80007d04 <raw_input+0x12c>
80007c74:	01544783          	lbu	a5,21(s0)
80007c78:	0017f793          	andi	a5,a5,1
80007c7c:	00078863          	beqz	a5,80007c8c <raw_input+0xb4>
80007c80:	00442703          	lw	a4,4(s0)
80007c84:	0104a783          	lw	a5,16(s1)
80007c88:	06f71e63          	bne	a4,a5,80007d04 <raw_input+0x12c>
80007c8c:	01842783          	lw	a5,24(s0)
80007c90:	06078a63          	beqz	a5,80007d04 <raw_input+0x12c>
80007c94:	01c42503          	lw	a0,28(s0)
80007c98:	a0418693          	addi	a3,gp,-1532 # 800032ac <ip_data+0x10>
80007c9c:	000a0613          	mv	a2,s4
80007ca0:	00040593          	mv	a1,s0
80007ca4:	000780e7          	jalr	a5
80007ca8:	06050463          	beqz	a0,80007d10 <raw_input+0x138>
80007cac:	00100513          	li	a0,1
80007cb0:	00098c63          	beqz	s3,80007cc8 <raw_input+0xf0>
80007cb4:	01042783          	lw	a5,16(s0)
80007cb8:	00f9a823          	sw	a5,16(s3)
80007cbc:	8d81a783          	lw	a5,-1832(gp) # 80003180 <raw_pcbs>
80007cc0:	8c81ac23          	sw	s0,-1832(gp) # 80003180 <raw_pcbs>
80007cc4:	00f42823          	sw	a5,16(s0)
80007cc8:	02c12083          	lw	ra,44(sp)
80007ccc:	02812403          	lw	s0,40(sp)
80007cd0:	02412483          	lw	s1,36(sp)
80007cd4:	02012903          	lw	s2,32(sp)
80007cd8:	01c12983          	lw	s3,28(sp)
80007cdc:	01812a03          	lw	s4,24(sp)
80007ce0:	01412a83          	lw	s5,20(sp)
80007ce4:	01012b03          	lw	s6,16(sp)
80007ce8:	00c12b83          	lw	s7,12(sp)
80007cec:	03010113          	addi	sp,sp,48
80007cf0:	00008067          	ret
80007cf4:	00042783          	lw	a5,0(s0)
80007cf8:	f6078ee3          	beqz	a5,80007c74 <raw_input+0x9c>
80007cfc:	0144a703          	lw	a4,20(s1)
80007d00:	f6e78ae3          	beq	a5,a4,80007c74 <raw_input+0x9c>
80007d04:	00040993          	mv	s3,s0
80007d08:	01042403          	lw	s0,16(s0)
80007d0c:	f29ff06f          	j	80007c34 <raw_input+0x5c>
80007d10:	00200513          	li	a0,2
80007d14:	ff1ff06f          	j	80007d04 <raw_input+0x12c>

80007d18 <raw_bind>:
80007d18:	ffa00793          	li	a5,-6
80007d1c:	00050a63          	beqz	a0,80007d30 <raw_bind+0x18>
80007d20:	00058863          	beqz	a1,80007d30 <raw_bind+0x18>
80007d24:	0005a783          	lw	a5,0(a1)
80007d28:	00f52023          	sw	a5,0(a0)
80007d2c:	00000793          	li	a5,0
80007d30:	00078513          	mv	a0,a5
80007d34:	00008067          	ret

80007d38 <raw_bind_netif>:
80007d38:	00000793          	li	a5,0
80007d3c:	00058863          	beqz	a1,80007d4c <raw_bind_netif+0x14>
80007d40:	0385c783          	lbu	a5,56(a1)
80007d44:	00178793          	addi	a5,a5,1
80007d48:	0ff7f793          	andi	a5,a5,255
80007d4c:	00f50423          	sb	a5,8(a0)
80007d50:	00008067          	ret

80007d54 <raw_connect>:
80007d54:	00050793          	mv	a5,a0
80007d58:	ffa00513          	li	a0,-6
80007d5c:	02078263          	beqz	a5,80007d80 <raw_connect+0x2c>
80007d60:	02058063          	beqz	a1,80007d80 <raw_connect+0x2c>
80007d64:	0005a703          	lw	a4,0(a1)
80007d68:	00000513          	li	a0,0
80007d6c:	00e7a223          	sw	a4,4(a5)
80007d70:	0157c703          	lbu	a4,21(a5)
80007d74:	00176713          	ori	a4,a4,1
80007d78:	00e78aa3          	sb	a4,21(a5)
80007d7c:	00008067          	ret
80007d80:	00008067          	ret

80007d84 <raw_disconnect>:
80007d84:	01554783          	lbu	a5,21(a0)
80007d88:	00052223          	sw	zero,4(a0)
80007d8c:	00050423          	sb	zero,8(a0)
80007d90:	ffe7f793          	andi	a5,a5,-2
80007d94:	00f50aa3          	sb	a5,21(a0)
80007d98:	00008067          	ret

80007d9c <raw_recv>:
80007d9c:	00b52c23          	sw	a1,24(a0)
80007da0:	00c52e23          	sw	a2,28(a0)
80007da4:	00008067          	ret

80007da8 <raw_sendto_if_src>:
80007da8:	fe010113          	addi	sp,sp,-32
80007dac:	00112e23          	sw	ra,28(sp)
80007db0:	00812c23          	sw	s0,24(sp)
80007db4:	00912a23          	sw	s1,20(sp)
80007db8:	01212823          	sw	s2,16(sp)
80007dbc:	01312623          	sw	s3,12(sp)
80007dc0:	01412423          	sw	s4,8(sp)
80007dc4:	01512223          	sw	s5,4(sp)
80007dc8:	00051663          	bnez	a0,80007dd4 <raw_sendto_if_src+0x2c>
80007dcc:	ffa00493          	li	s1,-6
80007dd0:	06c0006f          	j	80007e3c <raw_sendto_if_src+0x94>
80007dd4:	fe060ce3          	beqz	a2,80007dcc <raw_sendto_if_src+0x24>
80007dd8:	fe068ae3          	beqz	a3,80007dcc <raw_sendto_if_src+0x24>
80007ddc:	fe0708e3          	beqz	a4,80007dcc <raw_sendto_if_src+0x24>
80007de0:	01554783          	lbu	a5,21(a0)
80007de4:	00070a13          	mv	s4,a4
80007de8:	00068913          	mv	s2,a3
80007dec:	0027f793          	andi	a5,a5,2
80007df0:	00060a93          	mv	s5,a2
80007df4:	00058413          	mv	s0,a1
80007df8:	00050493          	mv	s1,a0
80007dfc:	06078463          	beqz	a5,80007e64 <raw_sendto_if_src+0xbc>
80007e00:	00a5d703          	lhu	a4,10(a1)
80007e04:	01300793          	li	a5,19
80007e08:	fce7f2e3          	bgeu	a5,a4,80007dcc <raw_sendto_if_src+0x24>
80007e0c:	00c50493          	addi	s1,a0,12
80007e10:	0296ae23          	sw	s1,60(a3)
80007e14:	00068813          	mv	a6,a3
80007e18:	00000793          	li	a5,0
80007e1c:	00000713          	li	a4,0
80007e20:	00000693          	li	a3,0
80007e24:	00000613          	li	a2,0
80007e28:	000a0593          	mv	a1,s4
80007e2c:	00040513          	mv	a0,s0
80007e30:	634040ef          	jal	ra,8000c464 <ip4_output_if>
80007e34:	00050493          	mv	s1,a0
80007e38:	02092e23          	sw	zero,60(s2)
80007e3c:	01c12083          	lw	ra,28(sp)
80007e40:	01812403          	lw	s0,24(sp)
80007e44:	00048513          	mv	a0,s1
80007e48:	01012903          	lw	s2,16(sp)
80007e4c:	01412483          	lw	s1,20(sp)
80007e50:	00c12983          	lw	s3,12(sp)
80007e54:	00812a03          	lw	s4,8(sp)
80007e58:	00412a83          	lw	s5,4(sp)
80007e5c:	02010113          	addi	sp,sp,32
80007e60:	00008067          	ret
80007e64:	0085d703          	lhu	a4,8(a1)
80007e68:	000107b7          	lui	a5,0x10
80007e6c:	feb78793          	addi	a5,a5,-21 # ffeb <_stack_size+0xf7eb>
80007e70:	00e7f663          	bgeu	a5,a4,80007e7c <raw_sendto_if_src+0xd4>
80007e74:	fff00493          	li	s1,-1
80007e78:	fc5ff06f          	j	80007e3c <raw_sendto_if_src+0x94>
80007e7c:	01400593          	li	a1,20
80007e80:	00040513          	mv	a0,s0
80007e84:	8c8ff0ef          	jal	ra,80006f4c <pbuf_add_header>
80007e88:	04050c63          	beqz	a0,80007ee0 <raw_sendto_if_src+0x138>
80007e8c:	28000613          	li	a2,640
80007e90:	00000593          	li	a1,0
80007e94:	02400513          	li	a0,36
80007e98:	a20ff0ef          	jal	ra,800070b8 <pbuf_alloc>
80007e9c:	00050993          	mv	s3,a0
80007ea0:	fc050ae3          	beqz	a0,80007e74 <raw_sendto_if_src+0xcc>
80007ea4:	00845783          	lhu	a5,8(s0)
80007ea8:	00078663          	beqz	a5,80007eb4 <raw_sendto_if_src+0x10c>
80007eac:	00040593          	mv	a1,s0
80007eb0:	d8cff0ef          	jal	ra,8000743c <pbuf_chain>
80007eb4:	0094c783          	lbu	a5,9(s1)
80007eb8:	0207f793          	andi	a5,a5,32
80007ebc:	02079e63          	bnez	a5,80007ef8 <raw_sendto_if_src+0x150>
80007ec0:	000aa503          	lw	a0,0(s5)
80007ec4:	00090593          	mv	a1,s2
80007ec8:	6c8040ef          	jal	ra,8000c590 <ip4_addr_isbroadcast_u32>
80007ecc:	02050663          	beqz	a0,80007ef8 <raw_sendto_if_src+0x150>
80007ed0:	ef340ee3          	beq	s0,s3,80007dcc <raw_sendto_if_src+0x24>
80007ed4:	00098513          	mv	a0,s3
80007ed8:	90cff0ef          	jal	ra,80006fe4 <pbuf_free>
80007edc:	ef1ff06f          	j	80007dcc <raw_sendto_if_src+0x24>
80007ee0:	01400593          	li	a1,20
80007ee4:	00040513          	mv	a0,s0
80007ee8:	874ff0ef          	jal	ra,80006f5c <pbuf_remove_header>
80007eec:	f80514e3          	bnez	a0,80007e74 <raw_sendto_if_src+0xcc>
80007ef0:	00040993          	mv	s3,s0
80007ef4:	fc1ff06f          	j	80007eb4 <raw_sendto_if_src+0x10c>
80007ef8:	00c48793          	addi	a5,s1,12
80007efc:	00b4c683          	lbu	a3,11(s1)
80007f00:	02f92e23          	sw	a5,60(s2)
80007f04:	0144c783          	lbu	a5,20(s1)
80007f08:	00a4c703          	lbu	a4,10(s1)
80007f0c:	00090813          	mv	a6,s2
80007f10:	000a8613          	mv	a2,s5
80007f14:	000a0593          	mv	a1,s4
80007f18:	00098513          	mv	a0,s3
80007f1c:	548040ef          	jal	ra,8000c464 <ip4_output_if>
80007f20:	02092e23          	sw	zero,60(s2)
80007f24:	00050493          	mv	s1,a0
80007f28:	f1340ae3          	beq	s0,s3,80007e3c <raw_sendto_if_src+0x94>
80007f2c:	00098513          	mv	a0,s3
80007f30:	8b4ff0ef          	jal	ra,80006fe4 <pbuf_free>
80007f34:	f09ff06f          	j	80007e3c <raw_sendto_if_src+0x94>

80007f38 <raw_sendto>:
80007f38:	08050663          	beqz	a0,80007fc4 <raw_sendto+0x8c>
80007f3c:	08060463          	beqz	a2,80007fc4 <raw_sendto+0x8c>
80007f40:	ff010113          	addi	sp,sp,-16
80007f44:	00812423          	sw	s0,8(sp)
80007f48:	00912223          	sw	s1,4(sp)
80007f4c:	01212023          	sw	s2,0(sp)
80007f50:	00112623          	sw	ra,12(sp)
80007f54:	00050413          	mv	s0,a0
80007f58:	00854503          	lbu	a0,8(a0)
80007f5c:	00060493          	mv	s1,a2
80007f60:	00058913          	mv	s2,a1
80007f64:	04050663          	beqz	a0,80007fb0 <raw_sendto+0x78>
80007f68:	d41fe0ef          	jal	ra,80006ca8 <netif_get_by_index>
80007f6c:	06050063          	beqz	a0,80007fcc <raw_sendto+0x94>
80007f70:	00042783          	lw	a5,0(s0)
80007f74:	04078463          	beqz	a5,80007fbc <raw_sendto+0x84>
80007f78:	0f07f793          	andi	a5,a5,240
80007f7c:	0e000713          	li	a4,224
80007f80:	02e78e63          	beq	a5,a4,80007fbc <raw_sendto+0x84>
80007f84:	00040713          	mv	a4,s0
80007f88:	00050693          	mv	a3,a0
80007f8c:	00040513          	mv	a0,s0
80007f90:	00812403          	lw	s0,8(sp)
80007f94:	00c12083          	lw	ra,12(sp)
80007f98:	00048613          	mv	a2,s1
80007f9c:	00090593          	mv	a1,s2
80007fa0:	00412483          	lw	s1,4(sp)
80007fa4:	00012903          	lw	s2,0(sp)
80007fa8:	01010113          	addi	sp,sp,16
80007fac:	dfdff06f          	j	80007da8 <raw_sendto_if_src>
80007fb0:	00060513          	mv	a0,a2
80007fb4:	619030ef          	jal	ra,8000bdcc <ip4_route>
80007fb8:	fb5ff06f          	j	80007f6c <raw_sendto+0x34>
80007fbc:	00450713          	addi	a4,a0,4
80007fc0:	fc9ff06f          	j	80007f88 <raw_sendto+0x50>
80007fc4:	ffa00513          	li	a0,-6
80007fc8:	00008067          	ret
80007fcc:	00c12083          	lw	ra,12(sp)
80007fd0:	00812403          	lw	s0,8(sp)
80007fd4:	00412483          	lw	s1,4(sp)
80007fd8:	00012903          	lw	s2,0(sp)
80007fdc:	ffc00513          	li	a0,-4
80007fe0:	01010113          	addi	sp,sp,16
80007fe4:	00008067          	ret

80007fe8 <raw_send>:
80007fe8:	00450613          	addi	a2,a0,4
80007fec:	f4dff06f          	j	80007f38 <raw_sendto>

80007ff0 <raw_remove>:
80007ff0:	8d81a783          	lw	a5,-1832(gp) # 80003180 <raw_pcbs>
80007ff4:	00050593          	mv	a1,a0
80007ff8:	00a79c63          	bne	a5,a0,80008010 <raw_remove+0x20>
80007ffc:	01052783          	lw	a5,16(a0)
80008000:	8cf1ac23          	sw	a5,-1832(gp) # 80003180 <raw_pcbs>
80008004:	00000513          	li	a0,0
80008008:	f28fe06f          	j	80006730 <memp_free>
8000800c:	00070793          	mv	a5,a4
80008010:	fe078ae3          	beqz	a5,80008004 <raw_remove+0x14>
80008014:	0107a703          	lw	a4,16(a5)
80008018:	fe0706e3          	beqz	a4,80008004 <raw_remove+0x14>
8000801c:	feb718e3          	bne	a4,a1,8000800c <raw_remove+0x1c>
80008020:	0105a703          	lw	a4,16(a1)
80008024:	00e7a823          	sw	a4,16(a5)
80008028:	fddff06f          	j	80008004 <raw_remove+0x14>

8000802c <raw_new>:
8000802c:	ff010113          	addi	sp,sp,-16
80008030:	800035b7          	lui	a1,0x80003
80008034:	00912223          	sw	s1,4(sp)
80008038:	25a00613          	li	a2,602
8000803c:	00050493          	mv	s1,a0
80008040:	cfc58593          	addi	a1,a1,-772 # 80002cfc <_ram_heap_end+0xffff0cfc>
80008044:	00000513          	li	a0,0
80008048:	00812423          	sw	s0,8(sp)
8000804c:	00112623          	sw	ra,12(sp)
80008050:	ea8fe0ef          	jal	ra,800066f8 <memp_malloc_fn>
80008054:	00050413          	mv	s0,a0
80008058:	02050463          	beqz	a0,80008080 <raw_new+0x54>
8000805c:	02000613          	li	a2,32
80008060:	00000593          	li	a1,0
80008064:	3e5040ef          	jal	ra,8000cc48 <memset>
80008068:	fff00793          	li	a5,-1
8000806c:	00f405a3          	sb	a5,11(s0)
80008070:	8d81a703          	lw	a4,-1832(gp) # 80003180 <raw_pcbs>
80008074:	00940a23          	sb	s1,20(s0)
80008078:	8c81ac23          	sw	s0,-1832(gp) # 80003180 <raw_pcbs>
8000807c:	00e42823          	sw	a4,16(s0)
80008080:	00040513          	mv	a0,s0
80008084:	00c12083          	lw	ra,12(sp)
80008088:	00812403          	lw	s0,8(sp)
8000808c:	00412483          	lw	s1,4(sp)
80008090:	01010113          	addi	sp,sp,16
80008094:	00008067          	ret

80008098 <raw_new_ip_type>:
80008098:	00058513          	mv	a0,a1
8000809c:	f91ff06f          	j	8000802c <raw_new>

800080a0 <raw_netif_ip_addr_changed>:
800080a0:	02050063          	beqz	a0,800080c0 <raw_netif_ip_addr_changed+0x20>
800080a4:	00052783          	lw	a5,0(a0)
800080a8:	00078c63          	beqz	a5,800080c0 <raw_netif_ip_addr_changed+0x20>
800080ac:	00058a63          	beqz	a1,800080c0 <raw_netif_ip_addr_changed+0x20>
800080b0:	0005a783          	lw	a5,0(a1)
800080b4:	00078663          	beqz	a5,800080c0 <raw_netif_ip_addr_changed+0x20>
800080b8:	8d81a783          	lw	a5,-1832(gp) # 80003180 <raw_pcbs>
800080bc:	00079463          	bnez	a5,800080c4 <raw_netif_ip_addr_changed+0x24>
800080c0:	00008067          	ret
800080c4:	0007a683          	lw	a3,0(a5)
800080c8:	00052703          	lw	a4,0(a0)
800080cc:	00e69663          	bne	a3,a4,800080d8 <raw_netif_ip_addr_changed+0x38>
800080d0:	0005a703          	lw	a4,0(a1)
800080d4:	00e7a023          	sw	a4,0(a5)
800080d8:	0107a783          	lw	a5,16(a5)
800080dc:	fe1ff06f          	j	800080bc <raw_netif_ip_addr_changed+0x1c>

800080e0 <stats_init>:
800080e0:	00008067          	ret

800080e4 <sys_timeout_abs>:
800080e4:	ff010113          	addi	sp,sp,-16
800080e8:	01212023          	sw	s2,0(sp)
800080ec:	00058913          	mv	s2,a1
800080f0:	800035b7          	lui	a1,0x80003
800080f4:	00812423          	sw	s0,8(sp)
800080f8:	00912223          	sw	s1,4(sp)
800080fc:	00050413          	mv	s0,a0
80008100:	00060493          	mv	s1,a2
80008104:	d2858593          	addi	a1,a1,-728 # 80002d28 <_ram_heap_end+0xffff0d28>
80008108:	0bc00613          	li	a2,188
8000810c:	00300513          	li	a0,3
80008110:	00112623          	sw	ra,12(sp)
80008114:	de4fe0ef          	jal	ra,800066f8 <memp_malloc_fn>
80008118:	02050063          	beqz	a0,80008138 <sys_timeout_abs+0x54>
8000811c:	8e01a783          	lw	a5,-1824(gp) # 80003188 <next_timeout>
80008120:	00052023          	sw	zero,0(a0)
80008124:	01252423          	sw	s2,8(a0)
80008128:	00952623          	sw	s1,12(a0)
8000812c:	00852223          	sw	s0,4(a0)
80008130:	02079063          	bnez	a5,80008150 <sys_timeout_abs+0x6c>
80008134:	8ea1a023          	sw	a0,-1824(gp) # 80003188 <next_timeout>
80008138:	00c12083          	lw	ra,12(sp)
8000813c:	00812403          	lw	s0,8(sp)
80008140:	00412483          	lw	s1,4(sp)
80008144:	00012903          	lw	s2,0(sp)
80008148:	01010113          	addi	sp,sp,16
8000814c:	00008067          	ret
80008150:	0047a683          	lw	a3,4(a5)
80008154:	40d406b3          	sub	a3,s0,a3
80008158:	0006d863          	bgez	a3,80008168 <sys_timeout_abs+0x84>
8000815c:	00f52023          	sw	a5,0(a0)
80008160:	fd5ff06f          	j	80008134 <sys_timeout_abs+0x50>
80008164:	00070793          	mv	a5,a4
80008168:	0007a703          	lw	a4,0(a5)
8000816c:	00070863          	beqz	a4,8000817c <sys_timeout_abs+0x98>
80008170:	00472683          	lw	a3,4(a4) # 10004 <_stack_size+0xf804>
80008174:	40d406b3          	sub	a3,s0,a3
80008178:	fe06d6e3          	bgez	a3,80008164 <sys_timeout_abs+0x80>
8000817c:	00e52023          	sw	a4,0(a0)
80008180:	00a7a023          	sw	a0,0(a5)
80008184:	fb5ff06f          	j	80008138 <sys_timeout_abs+0x54>

80008188 <lwip_cyclic_timer>:
80008188:	fe010113          	addi	sp,sp,-32
8000818c:	00112e23          	sw	ra,28(sp)
80008190:	00452783          	lw	a5,4(a0)
80008194:	00a12623          	sw	a0,12(sp)
80008198:	000780e7          	jalr	a5
8000819c:	cfdfc0ef          	jal	ra,80004e98 <sys_now>
800081a0:	00c12603          	lw	a2,12(sp)
800081a4:	8dc1a783          	lw	a5,-1828(gp) # 80003184 <current_timeout_due_time>
800081a8:	00062703          	lw	a4,0(a2)
800081ac:	800085b7          	lui	a1,0x80008
800081b0:	18858593          	addi	a1,a1,392 # 80008188 <_ram_heap_end+0xffff6188>
800081b4:	00f707b3          	add	a5,a4,a5
800081b8:	40a786b3          	sub	a3,a5,a0
800081bc:	00a70533          	add	a0,a4,a0
800081c0:	0006c463          	bltz	a3,800081c8 <lwip_cyclic_timer+0x40>
800081c4:	00078513          	mv	a0,a5
800081c8:	01c12083          	lw	ra,28(sp)
800081cc:	02010113          	addi	sp,sp,32
800081d0:	f15ff06f          	j	800080e4 <sys_timeout_abs>

800081d4 <sys_timeout>:
800081d4:	fe010113          	addi	sp,sp,-32
800081d8:	00812c23          	sw	s0,24(sp)
800081dc:	00112e23          	sw	ra,28(sp)
800081e0:	00050413          	mv	s0,a0
800081e4:	00b12623          	sw	a1,12(sp)
800081e8:	00c12423          	sw	a2,8(sp)
800081ec:	cadfc0ef          	jal	ra,80004e98 <sys_now>
800081f0:	00850533          	add	a0,a0,s0
800081f4:	01812403          	lw	s0,24(sp)
800081f8:	00812603          	lw	a2,8(sp)
800081fc:	00c12583          	lw	a1,12(sp)
80008200:	01c12083          	lw	ra,28(sp)
80008204:	02010113          	addi	sp,sp,32
80008208:	eddff06f          	j	800080e4 <sys_timeout_abs>

8000820c <sys_timeouts_init>:
8000820c:	ff010113          	addi	sp,sp,-16
80008210:	00812423          	sw	s0,8(sp)
80008214:	80003637          	lui	a2,0x80003
80008218:	80008437          	lui	s0,0x80008
8000821c:	00912223          	sw	s1,4(sp)
80008220:	18840593          	addi	a1,s0,392 # 80008188 <_ram_heap_end+0xffff6188>
80008224:	d1060493          	addi	s1,a2,-752 # 80002d10 <_ram_heap_end+0xffff0d10>
80008228:	3e800513          	li	a0,1000
8000822c:	d1060613          	addi	a2,a2,-752
80008230:	00112623          	sw	ra,12(sp)
80008234:	fa1ff0ef          	jal	ra,800081d4 <sys_timeout>
80008238:	0000f537          	lui	a0,0xf
8000823c:	00848613          	addi	a2,s1,8
80008240:	18840593          	addi	a1,s0,392
80008244:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
80008248:	f8dff0ef          	jal	ra,800081d4 <sys_timeout>
8000824c:	18840593          	addi	a1,s0,392
80008250:	00812403          	lw	s0,8(sp)
80008254:	00c12083          	lw	ra,12(sp)
80008258:	01048613          	addi	a2,s1,16
8000825c:	00412483          	lw	s1,4(sp)
80008260:	1f400513          	li	a0,500
80008264:	01010113          	addi	sp,sp,16
80008268:	f6dff06f          	j	800081d4 <sys_timeout>

8000826c <sys_untimeout>:
8000826c:	8e01a783          	lw	a5,-1824(gp) # 80003188 <next_timeout>
80008270:	00070693          	mv	a3,a4
80008274:	00000613          	li	a2,0
80008278:	00079e63          	bnez	a5,80008294 <sys_untimeout+0x28>
8000827c:	00008067          	ret
80008280:	00e62023          	sw	a4,0(a2)
80008284:	02c0006f          	j	800082b0 <sys_untimeout+0x44>
80008288:	00078613          	mv	a2,a5
8000828c:	fe0708e3          	beqz	a4,8000827c <sys_untimeout+0x10>
80008290:	00070793          	mv	a5,a4
80008294:	0087a803          	lw	a6,8(a5)
80008298:	0007a703          	lw	a4,0(a5)
8000829c:	fea816e3          	bne	a6,a0,80008288 <sys_untimeout+0x1c>
800082a0:	00c7a803          	lw	a6,12(a5)
800082a4:	feb812e3          	bne	a6,a1,80008288 <sys_untimeout+0x1c>
800082a8:	fc061ce3          	bnez	a2,80008280 <sys_untimeout+0x14>
800082ac:	8ee1a023          	sw	a4,-1824(gp) # 80003188 <next_timeout>
800082b0:	00078593          	mv	a1,a5
800082b4:	00300513          	li	a0,3
800082b8:	c78fe06f          	j	80006730 <memp_free>

800082bc <sys_check_timeouts>:
800082bc:	fe010113          	addi	sp,sp,-32
800082c0:	00912a23          	sw	s1,20(sp)
800082c4:	01312623          	sw	s3,12(sp)
800082c8:	01412423          	sw	s4,8(sp)
800082cc:	00112e23          	sw	ra,28(sp)
800082d0:	00812c23          	sw	s0,24(sp)
800082d4:	01212823          	sw	s2,16(sp)
800082d8:	bc1fc0ef          	jal	ra,80004e98 <sys_now>
800082dc:	00050993          	mv	s3,a0
800082e0:	8e01a583          	lw	a1,-1824(gp) # 80003188 <next_timeout>
800082e4:	02058e63          	beqz	a1,80008320 <sys_check_timeouts+0x64>
800082e8:	0045a783          	lw	a5,4(a1)
800082ec:	40f98733          	sub	a4,s3,a5
800082f0:	02074863          	bltz	a4,80008320 <sys_check_timeouts+0x64>
800082f4:	0005a703          	lw	a4,0(a1)
800082f8:	0085a403          	lw	s0,8(a1)
800082fc:	00300513          	li	a0,3
80008300:	8ee1a023          	sw	a4,-1824(gp) # 80003188 <next_timeout>
80008304:	00c5a903          	lw	s2,12(a1)
80008308:	8cf1ae23          	sw	a5,-1828(gp) # 80003184 <current_timeout_due_time>
8000830c:	c24fe0ef          	jal	ra,80006730 <memp_free>
80008310:	fc0408e3          	beqz	s0,800082e0 <sys_check_timeouts+0x24>
80008314:	00090513          	mv	a0,s2
80008318:	000400e7          	jalr	s0
8000831c:	fc5ff06f          	j	800082e0 <sys_check_timeouts+0x24>
80008320:	01c12083          	lw	ra,28(sp)
80008324:	01812403          	lw	s0,24(sp)
80008328:	01412483          	lw	s1,20(sp)
8000832c:	01012903          	lw	s2,16(sp)
80008330:	00c12983          	lw	s3,12(sp)
80008334:	00812a03          	lw	s4,8(sp)
80008338:	02010113          	addi	sp,sp,32
8000833c:	00008067          	ret

80008340 <sys_restart_timeouts>:
80008340:	ff010113          	addi	sp,sp,-16
80008344:	00812423          	sw	s0,8(sp)
80008348:	8e01a783          	lw	a5,-1824(gp) # 80003188 <next_timeout>
8000834c:	00112623          	sw	ra,12(sp)
80008350:	02078463          	beqz	a5,80008378 <sys_restart_timeouts+0x38>
80008354:	b45fc0ef          	jal	ra,80004e98 <sys_now>
80008358:	8e01a783          	lw	a5,-1824(gp) # 80003188 <next_timeout>
8000835c:	0047a703          	lw	a4,4(a5)
80008360:	40e50533          	sub	a0,a0,a4
80008364:	0047a703          	lw	a4,4(a5)
80008368:	00a70733          	add	a4,a4,a0
8000836c:	00e7a223          	sw	a4,4(a5)
80008370:	0007a783          	lw	a5,0(a5)
80008374:	fe0798e3          	bnez	a5,80008364 <sys_restart_timeouts+0x24>
80008378:	00c12083          	lw	ra,12(sp)
8000837c:	00812403          	lw	s0,8(sp)
80008380:	01010113          	addi	sp,sp,16
80008384:	00008067          	ret

80008388 <sys_timeouts_sleeptime>:
80008388:	ff010113          	addi	sp,sp,-16
8000838c:	00812423          	sw	s0,8(sp)
80008390:	8e01a783          	lw	a5,-1824(gp) # 80003188 <next_timeout>
80008394:	00112623          	sw	ra,12(sp)
80008398:	fff00513          	li	a0,-1
8000839c:	00078e63          	beqz	a5,800083b8 <sys_timeouts_sleeptime+0x30>
800083a0:	af9fc0ef          	jal	ra,80004e98 <sys_now>
800083a4:	8e01a783          	lw	a5,-1824(gp) # 80003188 <next_timeout>
800083a8:	0047a783          	lw	a5,4(a5)
800083ac:	40a78533          	sub	a0,a5,a0
800083b0:	00055463          	bgez	a0,800083b8 <sys_timeouts_sleeptime+0x30>
800083b4:	00000513          	li	a0,0
800083b8:	00c12083          	lw	ra,12(sp)
800083bc:	00812403          	lw	s0,8(sp)
800083c0:	01010113          	addi	sp,sp,16
800083c4:	00008067          	ret

800083c8 <udp_init>:
800083c8:	00008067          	ret

800083cc <udp_input>:
800083cc:	fd010113          	addi	sp,sp,-48
800083d0:	02812423          	sw	s0,40(sp)
800083d4:	02112623          	sw	ra,44(sp)
800083d8:	02912223          	sw	s1,36(sp)
800083dc:	03212023          	sw	s2,32(sp)
800083e0:	01312e23          	sw	s3,28(sp)
800083e4:	01412c23          	sw	s4,24(sp)
800083e8:	01512a23          	sw	s5,20(sp)
800083ec:	01612823          	sw	s6,16(sp)
800083f0:	01712623          	sw	s7,12(sp)
800083f4:	a0c18793          	addi	a5,gp,-1524 # 800032b4 <lwip_stats>
800083f8:	0f47a703          	lw	a4,244(a5)
800083fc:	00170713          	addi	a4,a4,1
80008400:	0ee7aa23          	sw	a4,244(a5)
80008404:	00a55683          	lhu	a3,10(a0)
80008408:	00700713          	li	a4,7
8000840c:	04d76463          	bltu	a4,a3,80008454 <udp_input+0x88>
80008410:	1047a703          	lw	a4,260(a5)
80008414:	00170713          	addi	a4,a4,1
80008418:	10e7a223          	sw	a4,260(a5)
8000841c:	0fc7a703          	lw	a4,252(a5)
80008420:	00170713          	addi	a4,a4,1
80008424:	0ee7ae23          	sw	a4,252(a5)
80008428:	02812403          	lw	s0,40(sp)
8000842c:	02c12083          	lw	ra,44(sp)
80008430:	02412483          	lw	s1,36(sp)
80008434:	02012903          	lw	s2,32(sp)
80008438:	01c12983          	lw	s3,28(sp)
8000843c:	01812a03          	lw	s4,24(sp)
80008440:	01412a83          	lw	s5,20(sp)
80008444:	01012b03          	lw	s6,16(sp)
80008448:	00c12b83          	lw	s7,12(sp)
8000844c:	03010113          	addi	sp,sp,48
80008450:	b95fe06f          	j	80006fe4 <pbuf_free>
80008454:	9f418913          	addi	s2,gp,-1548 # 8000329c <ip_data>
80008458:	00452983          	lw	s3,4(a0)
8000845c:	00050493          	mv	s1,a0
80008460:	00058b93          	mv	s7,a1
80008464:	01492503          	lw	a0,20(s2)
80008468:	00092583          	lw	a1,0(s2)
8000846c:	a0c18413          	addi	s0,gp,-1524 # 800032b4 <lwip_stats>
80008470:	9f418a13          	addi	s4,gp,-1548 # 8000329c <ip_data>
80008474:	11c040ef          	jal	ra,8000c590 <ip4_addr_isbroadcast_u32>
80008478:	0019c783          	lbu	a5,1(s3)
8000847c:	00050a93          	mv	s5,a0
80008480:	0009c503          	lbu	a0,0(s3)
80008484:	00879793          	slli	a5,a5,0x8
80008488:	00a7e533          	or	a0,a5,a0
8000848c:	935fd0ef          	jal	ra,80005dc0 <lwip_htons>
80008490:	0039c783          	lbu	a5,3(s3)
80008494:	00050b13          	mv	s6,a0
80008498:	0029c503          	lbu	a0,2(s3)
8000849c:	00879793          	slli	a5,a5,0x8
800084a0:	00a7e533          	or	a0,a5,a0
800084a4:	91dfd0ef          	jal	ra,80005dc0 <lwip_htons>
800084a8:	8e41a803          	lw	a6,-1820(gp) # 8000318c <udp_pcbs>
800084ac:	00492303          	lw	t1,4(s2)
800084b0:	01492683          	lw	a3,20(s2)
800084b4:	01092e03          	lw	t3,16(s2)
800084b8:	00080793          	mv	a5,a6
800084bc:	00000913          	li	s2,0
800084c0:	00000593          	li	a1,0
800084c4:	fff00893          	li	a7,-1
800084c8:	00079c63          	bnez	a5,800084e0 <udp_input+0x114>
800084cc:	0a091e63          	bnez	s2,80008588 <udp_input+0x1bc>
800084d0:	004ba783          	lw	a5,4(s7)
800084d4:	0ad78a63          	beq	a5,a3,80008588 <udp_input+0x1bc>
800084d8:	00048513          	mv	a0,s1
800084dc:	f4dff06f          	j	80008428 <udp_input+0x5c>
800084e0:	0167d703          	lhu	a4,22(a5)
800084e4:	0ea71e63          	bne	a4,a0,800085e0 <udp_input+0x214>
800084e8:	0087ce83          	lbu	t4,8(a5)
800084ec:	000e8a63          	beqz	t4,80008500 <udp_input+0x134>
800084f0:	03834703          	lbu	a4,56(t1)
800084f4:	00170713          	addi	a4,a4,1
800084f8:	0ff77713          	andi	a4,a4,255
800084fc:	0eee9263          	bne	t4,a4,800085e0 <udp_input+0x214>
80008500:	0c0a8a63          	beqz	s5,800085d4 <udp_input+0x208>
80008504:	0097c703          	lbu	a4,9(a5)
80008508:	02077713          	andi	a4,a4,32
8000850c:	0c070a63          	beqz	a4,800085e0 <udp_input+0x214>
80008510:	0007a703          	lw	a4,0(a5)
80008514:	00070c63          	beqz	a4,8000852c <udp_input+0x160>
80008518:	01168a63          	beq	a3,a7,8000852c <udp_input+0x160>
8000851c:	008bae83          	lw	t4,8(s7)
80008520:	00d74733          	xor	a4,a4,a3
80008524:	01d77733          	and	a4,a4,t4
80008528:	0a071c63          	bnez	a4,800085e0 <udp_input+0x214>
8000852c:	0147c703          	lbu	a4,20(a5)
80008530:	00477713          	andi	a4,a4,4
80008534:	02071463          	bnez	a4,8000855c <udp_input+0x190>
80008538:	02090063          	beqz	s2,80008558 <udp_input+0x18c>
8000853c:	020a8063          	beqz	s5,8000855c <udp_input+0x190>
80008540:	01169e63          	bne	a3,a7,8000855c <udp_input+0x190>
80008544:	004ba703          	lw	a4,4(s7)
80008548:	00092e83          	lw	t4,0(s2)
8000854c:	00ee8863          	beq	t4,a4,8000855c <udp_input+0x190>
80008550:	0007ae83          	lw	t4,0(a5)
80008554:	01d71463          	bne	a4,t4,8000855c <udp_input+0x190>
80008558:	00078913          	mv	s2,a5
8000855c:	0187d703          	lhu	a4,24(a5)
80008560:	09671063          	bne	a4,s6,800085e0 <udp_input+0x214>
80008564:	0047a703          	lw	a4,4(a5)
80008568:	00070463          	beqz	a4,80008570 <udp_input+0x1a4>
8000856c:	07c71a63          	bne	a4,t3,800085e0 <udp_input+0x214>
80008570:	06058e63          	beqz	a1,800085ec <udp_input+0x220>
80008574:	0107a703          	lw	a4,16(a5)
80008578:	8ef1a223          	sw	a5,-1820(gp) # 8000318c <udp_pcbs>
8000857c:	00e5a823          	sw	a4,16(a1)
80008580:	0107a823          	sw	a6,16(a5)
80008584:	00078913          	mv	s2,a5
80008588:	0079c783          	lbu	a5,7(s3)
8000858c:	0069c703          	lbu	a4,6(s3)
80008590:	00879793          	slli	a5,a5,0x8
80008594:	00e7e7b3          	or	a5,a5,a4
80008598:	06078263          	beqz	a5,800085fc <udp_input+0x230>
8000859c:	0084d603          	lhu	a2,8(s1)
800085a0:	a0818713          	addi	a4,gp,-1528 # 800032b0 <ip_data+0x14>
800085a4:	a0418693          	addi	a3,gp,-1532 # 800032ac <ip_data+0x10>
800085a8:	01100593          	li	a1,17
800085ac:	00048513          	mv	a0,s1
800085b0:	c71fd0ef          	jal	ra,80006220 <ip_chksum_pseudo>
800085b4:	04050463          	beqz	a0,800085fc <udp_input+0x230>
800085b8:	10042783          	lw	a5,256(s0)
800085bc:	00178793          	addi	a5,a5,1
800085c0:	10f42023          	sw	a5,256(s0)
800085c4:	0fc42783          	lw	a5,252(s0)
800085c8:	00178793          	addi	a5,a5,1
800085cc:	0ef42e23          	sw	a5,252(s0)
800085d0:	f09ff06f          	j	800084d8 <udp_input+0x10c>
800085d4:	0007a703          	lw	a4,0(a5)
800085d8:	f4070ae3          	beqz	a4,8000852c <udp_input+0x160>
800085dc:	f4d708e3          	beq	a4,a3,8000852c <udp_input+0x160>
800085e0:	00078593          	mv	a1,a5
800085e4:	0107a783          	lw	a5,16(a5)
800085e8:	ee1ff06f          	j	800084c8 <udp_input+0xfc>
800085ec:	11c42703          	lw	a4,284(s0)
800085f0:	00170713          	addi	a4,a4,1
800085f4:	10e42e23          	sw	a4,284(s0)
800085f8:	f8dff06f          	j	80008584 <udp_input+0x1b8>
800085fc:	00800593          	li	a1,8
80008600:	00048513          	mv	a0,s1
80008604:	959fe0ef          	jal	ra,80006f5c <pbuf_remove_header>
80008608:	fa051ee3          	bnez	a0,800085c4 <udp_input+0x1f8>
8000860c:	04090663          	beqz	s2,80008658 <udp_input+0x28c>
80008610:	01c92303          	lw	t1,28(s2)
80008614:	ec0302e3          	beqz	t1,800084d8 <udp_input+0x10c>
80008618:	02812403          	lw	s0,40(sp)
8000861c:	02092503          	lw	a0,32(s2)
80008620:	02c12083          	lw	ra,44(sp)
80008624:	01c12983          	lw	s3,28(sp)
80008628:	01812a03          	lw	s4,24(sp)
8000862c:	01412a83          	lw	s5,20(sp)
80008630:	00c12b83          	lw	s7,12(sp)
80008634:	000b0713          	mv	a4,s6
80008638:	00048613          	mv	a2,s1
8000863c:	01012b03          	lw	s6,16(sp)
80008640:	02412483          	lw	s1,36(sp)
80008644:	00090593          	mv	a1,s2
80008648:	02012903          	lw	s2,32(sp)
8000864c:	a0418693          	addi	a3,gp,-1532 # 800032ac <ip_data+0x10>
80008650:	03010113          	addi	sp,sp,48
80008654:	00030067          	jr	t1
80008658:	020a9c63          	bnez	s5,80008690 <udp_input+0x2c4>
8000865c:	014a2783          	lw	a5,20(s4)
80008660:	0e000713          	li	a4,224
80008664:	0f07f793          	andi	a5,a5,240
80008668:	02e78463          	beq	a5,a4,80008690 <udp_input+0x2c4>
8000866c:	00ca5583          	lhu	a1,12(s4)
80008670:	00048513          	mv	a0,s1
80008674:	00858593          	addi	a1,a1,8
80008678:	01059593          	slli	a1,a1,0x10
8000867c:	4105d593          	srai	a1,a1,0x10
80008680:	951fe0ef          	jal	ra,80006fd0 <pbuf_header_force>
80008684:	00300593          	li	a1,3
80008688:	00048513          	mv	a0,s1
8000868c:	264030ef          	jal	ra,8000b8f0 <icmp_dest_unreach>
80008690:	11042783          	lw	a5,272(s0)
80008694:	00178793          	addi	a5,a5,1
80008698:	10f42823          	sw	a5,272(s0)
8000869c:	f29ff06f          	j	800085c4 <udp_input+0x1f8>

800086a0 <udp_bind>:
800086a0:	00059463          	bnez	a1,800086a8 <udp_bind+0x8>
800086a4:	84818593          	addi	a1,gp,-1976 # 800030f0 <ip_addr_any>
800086a8:	ff000793          	li	a5,-16
800086ac:	0a050463          	beqz	a0,80008754 <udp_bind+0xb4>
800086b0:	8e41a783          	lw	a5,-1820(gp) # 8000318c <udp_pcbs>
800086b4:	00078693          	mv	a3,a5
800086b8:	06069063          	bnez	a3,80008718 <udp_bind+0x78>
800086bc:	00000e13          	li	t3,0
800086c0:	0c061463          	bnez	a2,80008788 <udp_bind+0xe8>
800086c4:	800036b7          	lui	a3,0x80003
800086c8:	0ac6d603          	lhu	a2,172(a3) # 800030ac <_ram_heap_end+0xffff10ac>
800086cc:	00010337          	lui	t1,0x10
800086d0:	00004837          	lui	a6,0x4
800086d4:	fff30313          	addi	t1,t1,-1 # ffff <_stack_size+0xf7ff>
800086d8:	04660a63          	beq	a2,t1,8000872c <udp_bind+0x8c>
800086dc:	00160613          	addi	a2,a2,1
800086e0:	01061613          	slli	a2,a2,0x10
800086e4:	01065613          	srli	a2,a2,0x10
800086e8:	00078893          	mv	a7,a5
800086ec:	04089463          	bnez	a7,80008734 <udp_bind+0x94>
800086f0:	0ac69623          	sh	a2,172(a3)
800086f4:	0005a783          	lw	a5,0(a1)
800086f8:	00c51b23          	sh	a2,22(a0)
800086fc:	00f52023          	sw	a5,0(a0)
80008700:	000e1863          	bnez	t3,80008710 <udp_bind+0x70>
80008704:	8e41a783          	lw	a5,-1820(gp) # 8000318c <udp_pcbs>
80008708:	8ea1a223          	sw	a0,-1820(gp) # 8000318c <udp_pcbs>
8000870c:	00f52823          	sw	a5,16(a0)
80008710:	00000793          	li	a5,0
80008714:	0400006f          	j	80008754 <udp_bind+0xb4>
80008718:	00a68663          	beq	a3,a0,80008724 <udp_bind+0x84>
8000871c:	0106a683          	lw	a3,16(a3)
80008720:	f99ff06f          	j	800086b8 <udp_bind+0x18>
80008724:	00100e13          	li	t3,1
80008728:	f99ff06f          	j	800086c0 <udp_bind+0x20>
8000872c:	0000c637          	lui	a2,0xc
80008730:	fb9ff06f          	j	800086e8 <udp_bind+0x48>
80008734:	0168de83          	lhu	t4,22(a7)
80008738:	02ce9263          	bne	t4,a2,8000875c <udp_bind+0xbc>
8000873c:	fff80813          	addi	a6,a6,-1 # 3fff <_stack_size+0x37ff>
80008740:	01081813          	slli	a6,a6,0x10
80008744:	01085813          	srli	a6,a6,0x10
80008748:	f80818e3          	bnez	a6,800086d8 <udp_bind+0x38>
8000874c:	0ac69623          	sh	a2,172(a3)
80008750:	ff800793          	li	a5,-8
80008754:	00078513          	mv	a0,a5
80008758:	00008067          	ret
8000875c:	0108a883          	lw	a7,16(a7)
80008760:	f8dff06f          	j	800086ec <udp_bind+0x4c>
80008764:	02a78063          	beq	a5,a0,80008784 <udp_bind+0xe4>
80008768:	0167d683          	lhu	a3,22(a5)
8000876c:	00c69c63          	bne	a3,a2,80008784 <udp_bind+0xe4>
80008770:	0005a803          	lw	a6,0(a1)
80008774:	0007a683          	lw	a3,0(a5)
80008778:	fd068ce3          	beq	a3,a6,80008750 <udp_bind+0xb0>
8000877c:	fc080ae3          	beqz	a6,80008750 <udp_bind+0xb0>
80008780:	fc0688e3          	beqz	a3,80008750 <udp_bind+0xb0>
80008784:	0107a783          	lw	a5,16(a5)
80008788:	fc079ee3          	bnez	a5,80008764 <udp_bind+0xc4>
8000878c:	f69ff06f          	j	800086f4 <udp_bind+0x54>

80008790 <udp_sendto_if_src>:
80008790:	fd010113          	addi	sp,sp,-48
80008794:	02912223          	sw	s1,36(sp)
80008798:	02112623          	sw	ra,44(sp)
8000879c:	02812423          	sw	s0,40(sp)
800087a0:	03212023          	sw	s2,32(sp)
800087a4:	01312e23          	sw	s3,28(sp)
800087a8:	01412c23          	sw	s4,24(sp)
800087ac:	01512a23          	sw	s5,20(sp)
800087b0:	01612823          	sw	s6,16(sp)
800087b4:	01712623          	sw	s7,12(sp)
800087b8:	ff000493          	li	s1,-16
800087bc:	08050263          	beqz	a0,80008840 <udp_sendto_if_src+0xb0>
800087c0:	08058063          	beqz	a1,80008840 <udp_sendto_if_src+0xb0>
800087c4:	06060e63          	beqz	a2,80008840 <udp_sendto_if_src+0xb0>
800087c8:	06078c63          	beqz	a5,80008840 <udp_sendto_if_src+0xb0>
800087cc:	06070a63          	beqz	a4,80008840 <udp_sendto_if_src+0xb0>
800087d0:	00078b13          	mv	s6,a5
800087d4:	00954783          	lbu	a5,9(a0)
800087d8:	00070a13          	mv	s4,a4
800087dc:	00068b93          	mv	s7,a3
800087e0:	0207f793          	andi	a5,a5,32
800087e4:	00060a93          	mv	s5,a2
800087e8:	00058993          	mv	s3,a1
800087ec:	00050413          	mv	s0,a0
800087f0:	02078e63          	beqz	a5,8000882c <udp_sendto_if_src+0x9c>
800087f4:	01645783          	lhu	a5,22(s0)
800087f8:	00079e63          	bnez	a5,80008814 <udp_sendto_if_src+0x84>
800087fc:	00000613          	li	a2,0
80008800:	00040593          	mv	a1,s0
80008804:	00040513          	mv	a0,s0
80008808:	e99ff0ef          	jal	ra,800086a0 <udp_bind>
8000880c:	00050493          	mv	s1,a0
80008810:	02051863          	bnez	a0,80008840 <udp_sendto_if_src+0xb0>
80008814:	0089d703          	lhu	a4,8(s3)
80008818:	000107b7          	lui	a5,0x10
8000881c:	ff778793          	addi	a5,a5,-9 # fff7 <_stack_size+0xf7f7>
80008820:	04e7f863          	bgeu	a5,a4,80008870 <udp_sendto_if_src+0xe0>
80008824:	fff00493          	li	s1,-1
80008828:	0180006f          	j	80008840 <udp_sendto_if_src+0xb0>
8000882c:	00062503          	lw	a0,0(a2) # c000 <_stack_size+0xb800>
80008830:	00070593          	mv	a1,a4
80008834:	ffa00493          	li	s1,-6
80008838:	559030ef          	jal	ra,8000c590 <ip4_addr_isbroadcast_u32>
8000883c:	fa050ce3          	beqz	a0,800087f4 <udp_sendto_if_src+0x64>
80008840:	02c12083          	lw	ra,44(sp)
80008844:	02812403          	lw	s0,40(sp)
80008848:	00048513          	mv	a0,s1
8000884c:	02012903          	lw	s2,32(sp)
80008850:	02412483          	lw	s1,36(sp)
80008854:	01c12983          	lw	s3,28(sp)
80008858:	01812a03          	lw	s4,24(sp)
8000885c:	01412a83          	lw	s5,20(sp)
80008860:	01012b03          	lw	s6,16(sp)
80008864:	00c12b83          	lw	s7,12(sp)
80008868:	03010113          	addi	sp,sp,48
8000886c:	00008067          	ret
80008870:	00800593          	li	a1,8
80008874:	00098513          	mv	a0,s3
80008878:	ed4fe0ef          	jal	ra,80006f4c <pbuf_add_header>
8000887c:	10050063          	beqz	a0,8000897c <udp_sendto_if_src+0x1ec>
80008880:	28000613          	li	a2,640
80008884:	00800593          	li	a1,8
80008888:	02400513          	li	a0,36
8000888c:	82dfe0ef          	jal	ra,800070b8 <pbuf_alloc>
80008890:	00050913          	mv	s2,a0
80008894:	f80508e3          	beqz	a0,80008824 <udp_sendto_if_src+0x94>
80008898:	0089d783          	lhu	a5,8(s3)
8000889c:	00078663          	beqz	a5,800088a8 <udp_sendto_if_src+0x118>
800088a0:	00098593          	mv	a1,s3
800088a4:	b99fe0ef          	jal	ra,8000743c <pbuf_chain>
800088a8:	01645503          	lhu	a0,22(s0)
800088ac:	00492483          	lw	s1,4(s2)
800088b0:	d10fd0ef          	jal	ra,80005dc0 <lwip_htons>
800088b4:	00a48023          	sb	a0,0(s1)
800088b8:	00855513          	srli	a0,a0,0x8
800088bc:	00a480a3          	sb	a0,1(s1)
800088c0:	000b8513          	mv	a0,s7
800088c4:	cfcfd0ef          	jal	ra,80005dc0 <lwip_htons>
800088c8:	00a48123          	sb	a0,2(s1)
800088cc:	00855513          	srli	a0,a0,0x8
800088d0:	00a481a3          	sb	a0,3(s1)
800088d4:	00048323          	sb	zero,6(s1)
800088d8:	000483a3          	sb	zero,7(s1)
800088dc:	00895503          	lhu	a0,8(s2)
800088e0:	ce0fd0ef          	jal	ra,80005dc0 <lwip_htons>
800088e4:	00a48223          	sb	a0,4(s1)
800088e8:	00855513          	srli	a0,a0,0x8
800088ec:	00a482a3          	sb	a0,5(s1)
800088f0:	01444783          	lbu	a5,20(s0)
800088f4:	0017f793          	andi	a5,a5,1
800088f8:	02079a63          	bnez	a5,8000892c <udp_sendto_if_src+0x19c>
800088fc:	00895603          	lhu	a2,8(s2)
80008900:	000a8713          	mv	a4,s5
80008904:	000b0693          	mv	a3,s6
80008908:	01100593          	li	a1,17
8000890c:	00090513          	mv	a0,s2
80008910:	911fd0ef          	jal	ra,80006220 <ip_chksum_pseudo>
80008914:	00051663          	bnez	a0,80008920 <udp_sendto_if_src+0x190>
80008918:	00010537          	lui	a0,0x10
8000891c:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xf7ff>
80008920:	00a48323          	sb	a0,6(s1)
80008924:	00855513          	srli	a0,a0,0x8
80008928:	00a483a3          	sb	a0,7(s1)
8000892c:	00c40793          	addi	a5,s0,12
80008930:	00b44683          	lbu	a3,11(s0)
80008934:	02fa2e23          	sw	a5,60(s4)
80008938:	00a44703          	lbu	a4,10(s0)
8000893c:	000a0813          	mv	a6,s4
80008940:	01100793          	li	a5,17
80008944:	000a8613          	mv	a2,s5
80008948:	000b0593          	mv	a1,s6
8000894c:	00090513          	mv	a0,s2
80008950:	0d1030ef          	jal	ra,8000c220 <ip4_output_if_src>
80008954:	020a2e23          	sw	zero,60(s4)
80008958:	00050493          	mv	s1,a0
8000895c:	01390663          	beq	s2,s3,80008968 <udp_sendto_if_src+0x1d8>
80008960:	00090513          	mv	a0,s2
80008964:	e80fe0ef          	jal	ra,80006fe4 <pbuf_free>
80008968:	a0c18793          	addi	a5,gp,-1524 # 800032b4 <lwip_stats>
8000896c:	0f07a703          	lw	a4,240(a5)
80008970:	00170713          	addi	a4,a4,1
80008974:	0ee7a823          	sw	a4,240(a5)
80008978:	ec9ff06f          	j	80008840 <udp_sendto_if_src+0xb0>
8000897c:	00098913          	mv	s2,s3
80008980:	f29ff06f          	j	800088a8 <udp_sendto_if_src+0x118>

80008984 <udp_sendto_if>:
80008984:	02050e63          	beqz	a0,800089c0 <udp_sendto_if+0x3c>
80008988:	02058c63          	beqz	a1,800089c0 <udp_sendto_if+0x3c>
8000898c:	02060a63          	beqz	a2,800089c0 <udp_sendto_if+0x3c>
80008990:	02070863          	beqz	a4,800089c0 <udp_sendto_if+0x3c>
80008994:	00052783          	lw	a5,0(a0)
80008998:	00078863          	beqz	a5,800089a8 <udp_sendto_if+0x24>
8000899c:	0f07f813          	andi	a6,a5,240
800089a0:	0e000893          	li	a7,224
800089a4:	01181663          	bne	a6,a7,800089b0 <udp_sendto_if+0x2c>
800089a8:	00470793          	addi	a5,a4,4
800089ac:	de5ff06f          	j	80008790 <udp_sendto_if_src>
800089b0:	00472803          	lw	a6,4(a4)
800089b4:	01079a63          	bne	a5,a6,800089c8 <udp_sendto_if+0x44>
800089b8:	00050793          	mv	a5,a0
800089bc:	ff1ff06f          	j	800089ac <udp_sendto_if+0x28>
800089c0:	ff000513          	li	a0,-16
800089c4:	00008067          	ret
800089c8:	ffc00513          	li	a0,-4
800089cc:	00008067          	ret

800089d0 <udp_sendto>:
800089d0:	0a050863          	beqz	a0,80008a80 <udp_sendto+0xb0>
800089d4:	0a058663          	beqz	a1,80008a80 <udp_sendto+0xb0>
800089d8:	0a060463          	beqz	a2,80008a80 <udp_sendto+0xb0>
800089dc:	fe010113          	addi	sp,sp,-32
800089e0:	00812c23          	sw	s0,24(sp)
800089e4:	00912a23          	sw	s1,20(sp)
800089e8:	01212823          	sw	s2,16(sp)
800089ec:	01312623          	sw	s3,12(sp)
800089f0:	00112e23          	sw	ra,28(sp)
800089f4:	00050413          	mv	s0,a0
800089f8:	00854503          	lbu	a0,8(a0)
800089fc:	00068993          	mv	s3,a3
80008a00:	00060493          	mv	s1,a2
80008a04:	00058913          	mv	s2,a1
80008a08:	02050e63          	beqz	a0,80008a44 <udp_sendto+0x74>
80008a0c:	a9cfe0ef          	jal	ra,80006ca8 <netif_get_by_index>
80008a10:	04051063          	bnez	a0,80008a50 <udp_sendto+0x80>
80008a14:	a0c18793          	addi	a5,gp,-1524 # 800032b4 <lwip_stats>
80008a18:	10c7a703          	lw	a4,268(a5)
80008a1c:	ffc00513          	li	a0,-4
80008a20:	00170713          	addi	a4,a4,1
80008a24:	10e7a623          	sw	a4,268(a5)
80008a28:	01c12083          	lw	ra,28(sp)
80008a2c:	01812403          	lw	s0,24(sp)
80008a30:	01412483          	lw	s1,20(sp)
80008a34:	01012903          	lw	s2,16(sp)
80008a38:	00c12983          	lw	s3,12(sp)
80008a3c:	02010113          	addi	sp,sp,32
80008a40:	00008067          	ret
80008a44:	00060513          	mv	a0,a2
80008a48:	384030ef          	jal	ra,8000bdcc <ip4_route>
80008a4c:	fc5ff06f          	j	80008a10 <udp_sendto+0x40>
80008a50:	00050713          	mv	a4,a0
80008a54:	00040513          	mv	a0,s0
80008a58:	01812403          	lw	s0,24(sp)
80008a5c:	01c12083          	lw	ra,28(sp)
80008a60:	00098693          	mv	a3,s3
80008a64:	00048613          	mv	a2,s1
80008a68:	00c12983          	lw	s3,12(sp)
80008a6c:	01412483          	lw	s1,20(sp)
80008a70:	00090593          	mv	a1,s2
80008a74:	01012903          	lw	s2,16(sp)
80008a78:	02010113          	addi	sp,sp,32
80008a7c:	f09ff06f          	j	80008984 <udp_sendto_if>
80008a80:	ff000513          	li	a0,-16
80008a84:	00008067          	ret

80008a88 <udp_send>:
80008a88:	00050a63          	beqz	a0,80008a9c <udp_send+0x14>
80008a8c:	00058863          	beqz	a1,80008a9c <udp_send+0x14>
80008a90:	01855683          	lhu	a3,24(a0)
80008a94:	00450613          	addi	a2,a0,4
80008a98:	f39ff06f          	j	800089d0 <udp_sendto>
80008a9c:	ff000513          	li	a0,-16
80008aa0:	00008067          	ret

80008aa4 <udp_bind_netif>:
80008aa4:	00000793          	li	a5,0
80008aa8:	00058863          	beqz	a1,80008ab8 <udp_bind_netif+0x14>
80008aac:	0385c783          	lbu	a5,56(a1)
80008ab0:	00178793          	addi	a5,a5,1
80008ab4:	0ff7f793          	andi	a5,a5,255
80008ab8:	00f50423          	sb	a5,8(a0)
80008abc:	00008067          	ret

80008ac0 <udp_connect>:
80008ac0:	ff000793          	li	a5,-16
80008ac4:	0a050063          	beqz	a0,80008b64 <udp_connect+0xa4>
80008ac8:	08058e63          	beqz	a1,80008b64 <udp_connect+0xa4>
80008acc:	ff010113          	addi	sp,sp,-16
80008ad0:	00812423          	sw	s0,8(sp)
80008ad4:	00912223          	sw	s1,4(sp)
80008ad8:	01212023          	sw	s2,0(sp)
80008adc:	00112623          	sw	ra,12(sp)
80008ae0:	01655783          	lhu	a5,22(a0)
80008ae4:	00050413          	mv	s0,a0
80008ae8:	00060913          	mv	s2,a2
80008aec:	00058493          	mv	s1,a1
80008af0:	02078c63          	beqz	a5,80008b28 <udp_connect+0x68>
80008af4:	0004a783          	lw	a5,0(s1)
80008af8:	01241c23          	sh	s2,24(s0)
80008afc:	00f42223          	sw	a5,4(s0)
80008b00:	01444783          	lbu	a5,20(s0)
80008b04:	0047e793          	ori	a5,a5,4
80008b08:	00f40a23          	sb	a5,20(s0)
80008b0c:	8e41a683          	lw	a3,-1820(gp) # 8000318c <udp_pcbs>
80008b10:	00068713          	mv	a4,a3
80008b14:	04071263          	bnez	a4,80008b58 <udp_connect+0x98>
80008b18:	00d42823          	sw	a3,16(s0)
80008b1c:	8e81a223          	sw	s0,-1820(gp) # 8000318c <udp_pcbs>
80008b20:	00000793          	li	a5,0
80008b24:	0180006f          	j	80008b3c <udp_connect+0x7c>
80008b28:	00000613          	li	a2,0
80008b2c:	00050593          	mv	a1,a0
80008b30:	b71ff0ef          	jal	ra,800086a0 <udp_bind>
80008b34:	00050793          	mv	a5,a0
80008b38:	fa050ee3          	beqz	a0,80008af4 <udp_connect+0x34>
80008b3c:	00c12083          	lw	ra,12(sp)
80008b40:	00812403          	lw	s0,8(sp)
80008b44:	00412483          	lw	s1,4(sp)
80008b48:	00012903          	lw	s2,0(sp)
80008b4c:	00078513          	mv	a0,a5
80008b50:	01010113          	addi	sp,sp,16
80008b54:	00008067          	ret
80008b58:	fc8704e3          	beq	a4,s0,80008b20 <udp_connect+0x60>
80008b5c:	01072703          	lw	a4,16(a4)
80008b60:	fb5ff06f          	j	80008b14 <udp_connect+0x54>
80008b64:	00078513          	mv	a0,a5
80008b68:	00008067          	ret

80008b6c <udp_disconnect>:
80008b6c:	00050e63          	beqz	a0,80008b88 <udp_disconnect+0x1c>
80008b70:	01454783          	lbu	a5,20(a0)
80008b74:	00052223          	sw	zero,4(a0)
80008b78:	00051c23          	sh	zero,24(a0)
80008b7c:	ffb7f793          	andi	a5,a5,-5
80008b80:	00050423          	sb	zero,8(a0)
80008b84:	00f50a23          	sb	a5,20(a0)
80008b88:	00008067          	ret

80008b8c <udp_recv>:
80008b8c:	00050663          	beqz	a0,80008b98 <udp_recv+0xc>
80008b90:	00b52e23          	sw	a1,28(a0)
80008b94:	02c52023          	sw	a2,32(a0)
80008b98:	00008067          	ret

80008b9c <udp_remove>:
80008b9c:	00050593          	mv	a1,a0
80008ba0:	02050e63          	beqz	a0,80008bdc <udp_remove+0x40>
80008ba4:	8e41a783          	lw	a5,-1820(gp) # 8000318c <udp_pcbs>
80008ba8:	00a79c63          	bne	a5,a0,80008bc0 <udp_remove+0x24>
80008bac:	01052783          	lw	a5,16(a0)
80008bb0:	8ef1a223          	sw	a5,-1820(gp) # 8000318c <udp_pcbs>
80008bb4:	00100513          	li	a0,1
80008bb8:	b79fd06f          	j	80006730 <memp_free>
80008bbc:	00070793          	mv	a5,a4
80008bc0:	fe078ae3          	beqz	a5,80008bb4 <udp_remove+0x18>
80008bc4:	0107a703          	lw	a4,16(a5)
80008bc8:	fe0706e3          	beqz	a4,80008bb4 <udp_remove+0x18>
80008bcc:	feb718e3          	bne	a4,a1,80008bbc <udp_remove+0x20>
80008bd0:	0105a703          	lw	a4,16(a1)
80008bd4:	00e7a823          	sw	a4,16(a5)
80008bd8:	fddff06f          	j	80008bb4 <udp_remove+0x18>
80008bdc:	00008067          	ret

80008be0 <udp_new>:
80008be0:	800035b7          	lui	a1,0x80003
80008be4:	ff010113          	addi	sp,sp,-16
80008be8:	4c800613          	li	a2,1224
80008bec:	d4458593          	addi	a1,a1,-700 # 80002d44 <_ram_heap_end+0xffff0d44>
80008bf0:	00100513          	li	a0,1
80008bf4:	00812423          	sw	s0,8(sp)
80008bf8:	00112623          	sw	ra,12(sp)
80008bfc:	afdfd0ef          	jal	ra,800066f8 <memp_malloc_fn>
80008c00:	00050413          	mv	s0,a0
80008c04:	00050c63          	beqz	a0,80008c1c <udp_new+0x3c>
80008c08:	02400613          	li	a2,36
80008c0c:	00000593          	li	a1,0
80008c10:	038040ef          	jal	ra,8000cc48 <memset>
80008c14:	fff00793          	li	a5,-1
80008c18:	00f405a3          	sb	a5,11(s0)
80008c1c:	00040513          	mv	a0,s0
80008c20:	00c12083          	lw	ra,12(sp)
80008c24:	00812403          	lw	s0,8(sp)
80008c28:	01010113          	addi	sp,sp,16
80008c2c:	00008067          	ret

80008c30 <udp_new_ip_type>:
80008c30:	fb1ff06f          	j	80008be0 <udp_new>

80008c34 <udp_netif_ip_addr_changed>:
80008c34:	02050063          	beqz	a0,80008c54 <udp_netif_ip_addr_changed+0x20>
80008c38:	00052783          	lw	a5,0(a0)
80008c3c:	00078c63          	beqz	a5,80008c54 <udp_netif_ip_addr_changed+0x20>
80008c40:	00058a63          	beqz	a1,80008c54 <udp_netif_ip_addr_changed+0x20>
80008c44:	0005a783          	lw	a5,0(a1)
80008c48:	00078663          	beqz	a5,80008c54 <udp_netif_ip_addr_changed+0x20>
80008c4c:	8e41a783          	lw	a5,-1820(gp) # 8000318c <udp_pcbs>
80008c50:	00079463          	bnez	a5,80008c58 <udp_netif_ip_addr_changed+0x24>
80008c54:	00008067          	ret
80008c58:	0007a683          	lw	a3,0(a5)
80008c5c:	00052703          	lw	a4,0(a0)
80008c60:	00e69663          	bne	a3,a4,80008c6c <udp_netif_ip_addr_changed+0x38>
80008c64:	0005a703          	lw	a4,0(a1)
80008c68:	00e7a023          	sw	a4,0(a5)
80008c6c:	0107a783          	lw	a5,16(a5)
80008c70:	fe1ff06f          	j	80008c50 <udp_netif_ip_addr_changed+0x1c>

80008c74 <dhcp_set_state>:
80008c74:	00554783          	lbu	a5,5(a0)
80008c78:	00b78863          	beq	a5,a1,80008c88 <dhcp_set_state+0x14>
80008c7c:	00b502a3          	sb	a1,5(a0)
80008c80:	00050323          	sb	zero,6(a0)
80008c84:	00051423          	sh	zero,8(a0)
80008c88:	00008067          	ret

80008c8c <dhcp_option_short>:
80008c8c:	00a587b3          	add	a5,a1,a0
80008c90:	00865713          	srli	a4,a2,0x8
80008c94:	00e78023          	sb	a4,0(a5)
80008c98:	00150793          	addi	a5,a0,1
80008c9c:	01079793          	slli	a5,a5,0x10
80008ca0:	0107d793          	srli	a5,a5,0x10
80008ca4:	00250513          	addi	a0,a0,2
80008ca8:	00f585b3          	add	a1,a1,a5
80008cac:	01051513          	slli	a0,a0,0x10
80008cb0:	00c58023          	sb	a2,0(a1)
80008cb4:	01055513          	srli	a0,a0,0x10
80008cb8:	00008067          	ret

80008cbc <dhcp_option_long>:
80008cbc:	00a587b3          	add	a5,a1,a0
80008cc0:	01865713          	srli	a4,a2,0x18
80008cc4:	00e78023          	sb	a4,0(a5)
80008cc8:	00150793          	addi	a5,a0,1
80008ccc:	01079793          	slli	a5,a5,0x10
80008cd0:	0107d793          	srli	a5,a5,0x10
80008cd4:	00f587b3          	add	a5,a1,a5
80008cd8:	01065713          	srli	a4,a2,0x10
80008cdc:	00e78023          	sb	a4,0(a5)
80008ce0:	00250793          	addi	a5,a0,2
80008ce4:	01079793          	slli	a5,a5,0x10
80008ce8:	0107d793          	srli	a5,a5,0x10
80008cec:	00f587b3          	add	a5,a1,a5
80008cf0:	00865713          	srli	a4,a2,0x8
80008cf4:	00e78023          	sb	a4,0(a5)
80008cf8:	00350793          	addi	a5,a0,3
80008cfc:	01079793          	slli	a5,a5,0x10
80008d00:	0107d793          	srli	a5,a5,0x10
80008d04:	00450513          	addi	a0,a0,4
80008d08:	00f585b3          	add	a1,a1,a5
80008d0c:	01051513          	slli	a0,a0,0x10
80008d10:	00c58023          	sb	a2,0(a1)
80008d14:	01055513          	srli	a0,a0,0x10
80008d18:	00008067          	ret

80008d1c <dhcp_create_msg>:
80008d1c:	fe010113          	addi	sp,sp,-32
80008d20:	00112e23          	sw	ra,28(sp)
80008d24:	00812c23          	sw	s0,24(sp)
80008d28:	00912a23          	sw	s1,20(sp)
80008d2c:	01212823          	sw	s2,16(sp)
80008d30:	01312623          	sw	s3,12(sp)
80008d34:	01412423          	sw	s4,8(sp)
80008d38:	01512223          	sw	s5,4(sp)
80008d3c:	01612023          	sw	s6,0(sp)
80008d40:	02051a63          	bnez	a0,80008d74 <dhcp_create_msg+0x58>
80008d44:	00000a93          	li	s5,0
80008d48:	01c12083          	lw	ra,28(sp)
80008d4c:	01812403          	lw	s0,24(sp)
80008d50:	000a8513          	mv	a0,s5
80008d54:	01412483          	lw	s1,20(sp)
80008d58:	01012903          	lw	s2,16(sp)
80008d5c:	00c12983          	lw	s3,12(sp)
80008d60:	00812a03          	lw	s4,8(sp)
80008d64:	00412a83          	lw	s5,4(sp)
80008d68:	00012b03          	lw	s6,0(sp)
80008d6c:	02010113          	addi	sp,sp,32
80008d70:	00008067          	ret
80008d74:	fc0588e3          	beqz	a1,80008d44 <dhcp_create_msg+0x28>
80008d78:	00060913          	mv	s2,a2
80008d7c:	00058993          	mv	s3,a1
80008d80:	00050493          	mv	s1,a0
80008d84:	28000613          	li	a2,640
80008d88:	13400593          	li	a1,308
80008d8c:	03800513          	li	a0,56
80008d90:	00068a13          	mv	s4,a3
80008d94:	b24fe0ef          	jal	ra,800070b8 <pbuf_alloc>
80008d98:	00050a93          	mv	s5,a0
80008d9c:	fa0504e3          	beqz	a0,80008d44 <dhcp_create_msg+0x28>
80008da0:	00300793          	li	a5,3
80008da4:	00f91663          	bne	s2,a5,80008db0 <dhcp_create_msg+0x94>
80008da8:	0059c783          	lbu	a5,5(s3)
80008dac:	03279063          	bne	a5,s2,80008dcc <dhcp_create_msg+0xb0>
80008db0:	0069c703          	lbu	a4,6(s3)
80008db4:	00071863          	bnez	a4,80008dc4 <dhcp_create_msg+0xa8>
80008db8:	8081a703          	lw	a4,-2040(gp) # 800030b0 <xid.4812>
80008dbc:	00170713          	addi	a4,a4,1
80008dc0:	80e1a423          	sw	a4,-2040(gp) # 800030b0 <xid.4812>
80008dc4:	8081a783          	lw	a5,-2040(gp) # 800030b0 <xid.4812>
80008dc8:	00f9a023          	sw	a5,0(s3)
80008dcc:	004aa403          	lw	s0,4(s5)
80008dd0:	13400613          	li	a2,308
80008dd4:	00000593          	li	a1,0
80008dd8:	00100b13          	li	s6,1
80008ddc:	00040513          	mv	a0,s0
80008de0:	669030ef          	jal	ra,8000cc48 <memset>
80008de4:	01640023          	sb	s6,0(s0)
80008de8:	016400a3          	sb	s6,1(s0)
80008dec:	0344c783          	lbu	a5,52(s1)
80008df0:	00f40123          	sb	a5,2(s0)
80008df4:	0009a503          	lw	a0,0(s3)
80008df8:	fe1fc0ef          	jal	ra,80005dd8 <lwip_htonl>
80008dfc:	00855793          	srli	a5,a0,0x8
80008e00:	00a40223          	sb	a0,4(s0)
80008e04:	00f402a3          	sb	a5,5(s0)
80008e08:	01055793          	srli	a5,a0,0x10
80008e0c:	01855513          	srli	a0,a0,0x18
80008e10:	00f40323          	sb	a5,6(s0)
80008e14:	00a403a3          	sb	a0,7(s0)
80008e18:	00400793          	li	a5,4
80008e1c:	02f90463          	beq	s2,a5,80008e44 <dhcp_create_msg+0x128>
80008e20:	ff990793          	addi	a5,s2,-7
80008e24:	0ff7f793          	andi	a5,a5,255
80008e28:	00fb7e63          	bgeu	s6,a5,80008e44 <dhcp_create_msg+0x128>
80008e2c:	00300793          	li	a5,3
80008e30:	02f91a63          	bne	s2,a5,80008e64 <dhcp_create_msg+0x148>
80008e34:	0059c783          	lbu	a5,5(s3)
80008e38:	ffc78793          	addi	a5,a5,-4
80008e3c:	0ff7f793          	andi	a5,a5,255
80008e40:	02fb6263          	bltu	s6,a5,80008e64 <dhcp_create_msg+0x148>
80008e44:	0044a783          	lw	a5,4(s1)
80008e48:	0087d713          	srli	a4,a5,0x8
80008e4c:	00f40623          	sb	a5,12(s0)
80008e50:	00e406a3          	sb	a4,13(s0)
80008e54:	0107d713          	srli	a4,a5,0x10
80008e58:	0187d793          	srli	a5,a5,0x18
80008e5c:	00e40723          	sb	a4,14(s0)
80008e60:	00f407a3          	sb	a5,15(s0)
80008e64:	02e48793          	addi	a5,s1,46
80008e68:	01c40713          	addi	a4,s0,28
80008e6c:	03448493          	addi	s1,s1,52
80008e70:	0007c683          	lbu	a3,0(a5)
80008e74:	00178793          	addi	a5,a5,1
80008e78:	00170713          	addi	a4,a4,1
80008e7c:	fed70fa3          	sb	a3,-1(a4)
80008e80:	fe9798e3          	bne	a5,s1,80008e70 <dhcp_create_msg+0x154>
80008e84:	06300793          	li	a5,99
80008e88:	0ef40623          	sb	a5,236(s0)
80008e8c:	f8200713          	li	a4,-126
80008e90:	0ef407a3          	sb	a5,239(s0)
80008e94:	03500793          	li	a5,53
80008e98:	0ee406a3          	sb	a4,237(s0)
80008e9c:	0ef40823          	sb	a5,240(s0)
80008ea0:	05300713          	li	a4,83
80008ea4:	00100793          	li	a5,1
80008ea8:	0ef408a3          	sb	a5,241(s0)
80008eac:	0ee40723          	sb	a4,238(s0)
80008eb0:	0f240923          	sb	s2,242(s0)
80008eb4:	00300793          	li	a5,3
80008eb8:	00fa1023          	sh	a5,0(s4)
80008ebc:	e8dff06f          	j	80008d48 <dhcp_create_msg+0x2c>

80008ec0 <dhcp_option_trailer>:
80008ec0:	00150793          	addi	a5,a0,1
80008ec4:	01079793          	slli	a5,a5,0x10
80008ec8:	00a58733          	add	a4,a1,a0
80008ecc:	0107d793          	srli	a5,a5,0x10
80008ed0:	fff00693          	li	a3,-1
80008ed4:	00d70023          	sb	a3,0(a4)
80008ed8:	00f585b3          	add	a1,a1,a5
80008edc:	04300713          	li	a4,67
80008ee0:	00f77c63          	bgeu	a4,a5,80008ef8 <dhcp_option_trailer+0x38>
80008ee4:	0f078593          	addi	a1,a5,240
80008ee8:	01059593          	slli	a1,a1,0x10
80008eec:	0105d593          	srli	a1,a1,0x10
80008ef0:	00060513          	mv	a0,a2
80008ef4:	b94fe06f          	j	80007288 <pbuf_realloc>
80008ef8:	00178793          	addi	a5,a5,1
80008efc:	01079793          	slli	a5,a5,0x10
80008f00:	00058023          	sb	zero,0(a1)
80008f04:	0107d793          	srli	a5,a5,0x10
80008f08:	00158593          	addi	a1,a1,1
80008f0c:	fd5ff06f          	j	80008ee0 <dhcp_option_trailer+0x20>

80008f10 <dhcp_reboot>:
80008f10:	fd010113          	addi	sp,sp,-48
80008f14:	02112623          	sw	ra,44(sp)
80008f18:	02812423          	sw	s0,40(sp)
80008f1c:	03212023          	sw	s2,32(sp)
80008f20:	02912223          	sw	s1,36(sp)
80008f24:	01312e23          	sw	s3,28(sp)
80008f28:	01412c23          	sw	s4,24(sp)
80008f2c:	02852483          	lw	s1,40(a0)
80008f30:	00050913          	mv	s2,a0
80008f34:	00300593          	li	a1,3
80008f38:	00048513          	mv	a0,s1
80008f3c:	d39ff0ef          	jal	ra,80008c74 <dhcp_set_state>
80008f40:	00e10693          	addi	a3,sp,14
80008f44:	00300613          	li	a2,3
80008f48:	00048593          	mv	a1,s1
80008f4c:	00090513          	mv	a0,s2
80008f50:	dcdff0ef          	jal	ra,80008d1c <dhcp_create_msg>
80008f54:	fff00413          	li	s0,-1
80008f58:	14050663          	beqz	a0,800090a4 <dhcp_reboot+0x194>
80008f5c:	00452403          	lw	s0,4(a0)
80008f60:	00e15783          	lhu	a5,14(sp)
80008f64:	00050993          	mv	s3,a0
80008f68:	0f040413          	addi	s0,s0,240
80008f6c:	00f40733          	add	a4,s0,a5
80008f70:	00278513          	addi	a0,a5,2
80008f74:	00178793          	addi	a5,a5,1
80008f78:	01079793          	slli	a5,a5,0x10
80008f7c:	03900693          	li	a3,57
80008f80:	0107d793          	srli	a5,a5,0x10
80008f84:	00d70023          	sb	a3,0(a4)
80008f88:	00f407b3          	add	a5,s0,a5
80008f8c:	00200713          	li	a4,2
80008f90:	01051513          	slli	a0,a0,0x10
80008f94:	00e78023          	sb	a4,0(a5)
80008f98:	00040593          	mv	a1,s0
80008f9c:	24000613          	li	a2,576
80008fa0:	01055513          	srli	a0,a0,0x10
80008fa4:	00a11723          	sh	a0,14(sp)
80008fa8:	ce5ff0ef          	jal	ra,80008c8c <dhcp_option_short>
80008fac:	00a407b3          	add	a5,s0,a0
80008fb0:	00250a13          	addi	s4,a0,2
80008fb4:	00150513          	addi	a0,a0,1
80008fb8:	01051513          	slli	a0,a0,0x10
80008fbc:	03200713          	li	a4,50
80008fc0:	01055513          	srli	a0,a0,0x10
80008fc4:	00e78023          	sb	a4,0(a5)
80008fc8:	00a40533          	add	a0,s0,a0
80008fcc:	00400793          	li	a5,4
80008fd0:	00f50023          	sb	a5,0(a0)
80008fd4:	01c4a503          	lw	a0,28(s1)
80008fd8:	010a1a13          	slli	s4,s4,0x10
80008fdc:	010a5a13          	srli	s4,s4,0x10
80008fe0:	01411723          	sh	s4,14(sp)
80008fe4:	df5fc0ef          	jal	ra,80005dd8 <lwip_htonl>
80008fe8:	00050613          	mv	a2,a0
80008fec:	00040593          	mv	a1,s0
80008ff0:	000a0513          	mv	a0,s4
80008ff4:	cc9ff0ef          	jal	ra,80008cbc <dhcp_option_long>
80008ff8:	00a40733          	add	a4,s0,a0
80008ffc:	03700693          	li	a3,55
80009000:	00d70023          	sb	a3,0(a4)
80009004:	00150713          	addi	a4,a0,1
80009008:	01071713          	slli	a4,a4,0x10
8000900c:	01075713          	srli	a4,a4,0x10
80009010:	00300693          	li	a3,3
80009014:	00e40733          	add	a4,s0,a4
80009018:	00d70023          	sb	a3,0(a4)
8000901c:	00250713          	addi	a4,a0,2
80009020:	01071713          	slli	a4,a4,0x10
80009024:	01075713          	srli	a4,a4,0x10
80009028:	00e40733          	add	a4,s0,a4
8000902c:	00100613          	li	a2,1
80009030:	00c70023          	sb	a2,0(a4)
80009034:	00050793          	mv	a5,a0
80009038:	00350713          	addi	a4,a0,3
8000903c:	01071713          	slli	a4,a4,0x10
80009040:	00478793          	addi	a5,a5,4
80009044:	01075713          	srli	a4,a4,0x10
80009048:	01079793          	slli	a5,a5,0x10
8000904c:	00e40733          	add	a4,s0,a4
80009050:	00550513          	addi	a0,a0,5
80009054:	0107d793          	srli	a5,a5,0x10
80009058:	00d70023          	sb	a3,0(a4)
8000905c:	00f407b3          	add	a5,s0,a5
80009060:	01c00713          	li	a4,28
80009064:	01051513          	slli	a0,a0,0x10
80009068:	00e78023          	sb	a4,0(a5)
8000906c:	01055513          	srli	a0,a0,0x10
80009070:	00040593          	mv	a1,s0
80009074:	00098613          	mv	a2,s3
80009078:	00a11723          	sh	a0,14(sp)
8000907c:	e45ff0ef          	jal	ra,80008ec0 <dhcp_option_trailer>
80009080:	8ec1a503          	lw	a0,-1812(gp) # 80003194 <dhcp_pcb>
80009084:	00090713          	mv	a4,s2
80009088:	04300693          	li	a3,67
8000908c:	84418613          	addi	a2,gp,-1980 # 800030ec <ip_addr_broadcast>
80009090:	00098593          	mv	a1,s3
80009094:	8f1ff0ef          	jal	ra,80008984 <udp_sendto_if>
80009098:	00050413          	mv	s0,a0
8000909c:	00098513          	mv	a0,s3
800090a0:	f45fd0ef          	jal	ra,80006fe4 <pbuf_free>
800090a4:	0064c783          	lbu	a5,6(s1)
800090a8:	0ff00713          	li	a4,255
800090ac:	00e78663          	beq	a5,a4,800090b8 <dhcp_reboot+0x1a8>
800090b0:	00178793          	addi	a5,a5,1
800090b4:	00f48323          	sb	a5,6(s1)
800090b8:	0064c503          	lbu	a0,6(s1)
800090bc:	00900793          	li	a5,9
800090c0:	04a7ea63          	bltu	a5,a0,80009114 <dhcp_reboot+0x204>
800090c4:	00551793          	slli	a5,a0,0x5
800090c8:	40a787b3          	sub	a5,a5,a0
800090cc:	00279793          	slli	a5,a5,0x2
800090d0:	00f50533          	add	a0,a0,a5
800090d4:	00351513          	slli	a0,a0,0x3
800090d8:	01051513          	slli	a0,a0,0x10
800090dc:	01055513          	srli	a0,a0,0x10
800090e0:	1f400593          	li	a1,500
800090e4:	1f350513          	addi	a0,a0,499
800090e8:	268040ef          	jal	ra,8000d350 <__divsi3>
800090ec:	00a49423          	sh	a0,8(s1)
800090f0:	02c12083          	lw	ra,44(sp)
800090f4:	00040513          	mv	a0,s0
800090f8:	02812403          	lw	s0,40(sp)
800090fc:	02412483          	lw	s1,36(sp)
80009100:	02012903          	lw	s2,32(sp)
80009104:	01c12983          	lw	s3,28(sp)
80009108:	01812a03          	lw	s4,24(sp)
8000910c:	03010113          	addi	sp,sp,48
80009110:	00008067          	ret
80009114:	00002537          	lui	a0,0x2
80009118:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
8000911c:	fc5ff06f          	j	800090e0 <dhcp_reboot+0x1d0>

80009120 <dhcp_select>:
80009120:	fd010113          	addi	sp,sp,-48
80009124:	02812423          	sw	s0,40(sp)
80009128:	02112623          	sw	ra,44(sp)
8000912c:	02912223          	sw	s1,36(sp)
80009130:	03212023          	sw	s2,32(sp)
80009134:	01312e23          	sw	s3,28(sp)
80009138:	01412c23          	sw	s4,24(sp)
8000913c:	01512a23          	sw	s5,20(sp)
80009140:	ff000413          	li	s0,-16
80009144:	22050263          	beqz	a0,80009368 <dhcp_select+0x248>
80009148:	02852483          	lw	s1,40(a0)
8000914c:	ffa00413          	li	s0,-6
80009150:	20048c63          	beqz	s1,80009368 <dhcp_select+0x248>
80009154:	00050913          	mv	s2,a0
80009158:	00100593          	li	a1,1
8000915c:	00048513          	mv	a0,s1
80009160:	b15ff0ef          	jal	ra,80008c74 <dhcp_set_state>
80009164:	00e10693          	addi	a3,sp,14
80009168:	00300613          	li	a2,3
8000916c:	00048593          	mv	a1,s1
80009170:	00090513          	mv	a0,s2
80009174:	ba9ff0ef          	jal	ra,80008d1c <dhcp_create_msg>
80009178:	00050993          	mv	s3,a0
8000917c:	fff00413          	li	s0,-1
80009180:	18050a63          	beqz	a0,80009314 <dhcp_select+0x1f4>
80009184:	00452403          	lw	s0,4(a0)
80009188:	00e15783          	lhu	a5,14(sp)
8000918c:	03900693          	li	a3,57
80009190:	0f040413          	addi	s0,s0,240
80009194:	00f40733          	add	a4,s0,a5
80009198:	00278513          	addi	a0,a5,2
8000919c:	00178793          	addi	a5,a5,1
800091a0:	01079793          	slli	a5,a5,0x10
800091a4:	0107d793          	srli	a5,a5,0x10
800091a8:	00d70023          	sb	a3,0(a4)
800091ac:	00f407b3          	add	a5,s0,a5
800091b0:	00200713          	li	a4,2
800091b4:	00e78023          	sb	a4,0(a5)
800091b8:	02c95603          	lhu	a2,44(s2)
800091bc:	01051513          	slli	a0,a0,0x10
800091c0:	00040593          	mv	a1,s0
800091c4:	01055513          	srli	a0,a0,0x10
800091c8:	00a11723          	sh	a0,14(sp)
800091cc:	ac1ff0ef          	jal	ra,80008c8c <dhcp_option_short>
800091d0:	00a407b3          	add	a5,s0,a0
800091d4:	03200713          	li	a4,50
800091d8:	00e78023          	sb	a4,0(a5)
800091dc:	00150793          	addi	a5,a0,1
800091e0:	01079793          	slli	a5,a5,0x10
800091e4:	0107d793          	srli	a5,a5,0x10
800091e8:	00f407b3          	add	a5,s0,a5
800091ec:	00400a93          	li	s5,4
800091f0:	01578023          	sb	s5,0(a5)
800091f4:	00250a13          	addi	s4,a0,2
800091f8:	01c4a503          	lw	a0,28(s1)
800091fc:	010a1a13          	slli	s4,s4,0x10
80009200:	010a5a13          	srli	s4,s4,0x10
80009204:	01411723          	sh	s4,14(sp)
80009208:	bd1fc0ef          	jal	ra,80005dd8 <lwip_htonl>
8000920c:	00050613          	mv	a2,a0
80009210:	00040593          	mv	a1,s0
80009214:	000a0513          	mv	a0,s4
80009218:	aa5ff0ef          	jal	ra,80008cbc <dhcp_option_long>
8000921c:	00a407b3          	add	a5,s0,a0
80009220:	03600713          	li	a4,54
80009224:	00e78023          	sb	a4,0(a5)
80009228:	00150793          	addi	a5,a0,1
8000922c:	01079793          	slli	a5,a5,0x10
80009230:	0107d793          	srli	a5,a5,0x10
80009234:	00f407b3          	add	a5,s0,a5
80009238:	01578023          	sb	s5,0(a5)
8000923c:	00250a13          	addi	s4,a0,2
80009240:	0184a503          	lw	a0,24(s1)
80009244:	010a1a13          	slli	s4,s4,0x10
80009248:	010a5a13          	srli	s4,s4,0x10
8000924c:	01411723          	sh	s4,14(sp)
80009250:	b89fc0ef          	jal	ra,80005dd8 <lwip_htonl>
80009254:	00050613          	mv	a2,a0
80009258:	00040593          	mv	a1,s0
8000925c:	000a0513          	mv	a0,s4
80009260:	a5dff0ef          	jal	ra,80008cbc <dhcp_option_long>
80009264:	00a40733          	add	a4,s0,a0
80009268:	03700693          	li	a3,55
8000926c:	00d70023          	sb	a3,0(a4)
80009270:	00150713          	addi	a4,a0,1
80009274:	01071713          	slli	a4,a4,0x10
80009278:	01075713          	srli	a4,a4,0x10
8000927c:	00300693          	li	a3,3
80009280:	00e40733          	add	a4,s0,a4
80009284:	00d70023          	sb	a3,0(a4)
80009288:	00250713          	addi	a4,a0,2
8000928c:	01071713          	slli	a4,a4,0x10
80009290:	01075713          	srli	a4,a4,0x10
80009294:	00e40733          	add	a4,s0,a4
80009298:	00100613          	li	a2,1
8000929c:	00c70023          	sb	a2,0(a4)
800092a0:	00050793          	mv	a5,a0
800092a4:	00350713          	addi	a4,a0,3
800092a8:	01071713          	slli	a4,a4,0x10
800092ac:	00478793          	addi	a5,a5,4
800092b0:	01075713          	srli	a4,a4,0x10
800092b4:	01079793          	slli	a5,a5,0x10
800092b8:	00e40733          	add	a4,s0,a4
800092bc:	00550513          	addi	a0,a0,5
800092c0:	0107d793          	srli	a5,a5,0x10
800092c4:	00d70023          	sb	a3,0(a4)
800092c8:	00f407b3          	add	a5,s0,a5
800092cc:	01c00713          	li	a4,28
800092d0:	01051513          	slli	a0,a0,0x10
800092d4:	00e78023          	sb	a4,0(a5)
800092d8:	01055513          	srli	a0,a0,0x10
800092dc:	00040593          	mv	a1,s0
800092e0:	00098613          	mv	a2,s3
800092e4:	00a11723          	sh	a0,14(sp)
800092e8:	bd9ff0ef          	jal	ra,80008ec0 <dhcp_option_trailer>
800092ec:	8ec1a503          	lw	a0,-1812(gp) # 80003194 <dhcp_pcb>
800092f0:	84818793          	addi	a5,gp,-1976 # 800030f0 <ip_addr_any>
800092f4:	00090713          	mv	a4,s2
800092f8:	04300693          	li	a3,67
800092fc:	84418613          	addi	a2,gp,-1980 # 800030ec <ip_addr_broadcast>
80009300:	00098593          	mv	a1,s3
80009304:	c8cff0ef          	jal	ra,80008790 <udp_sendto_if_src>
80009308:	00050413          	mv	s0,a0
8000930c:	00098513          	mv	a0,s3
80009310:	cd5fd0ef          	jal	ra,80006fe4 <pbuf_free>
80009314:	0064c783          	lbu	a5,6(s1)
80009318:	0ff00713          	li	a4,255
8000931c:	00e78663          	beq	a5,a4,80009328 <dhcp_select+0x208>
80009320:	00178793          	addi	a5,a5,1
80009324:	00f48323          	sb	a5,6(s1)
80009328:	0064c783          	lbu	a5,6(s1)
8000932c:	00500713          	li	a4,5
80009330:	06f76063          	bltu	a4,a5,80009390 <dhcp_select+0x270>
80009334:	00100513          	li	a0,1
80009338:	00f51533          	sll	a0,a0,a5
8000933c:	00551793          	slli	a5,a0,0x5
80009340:	40a787b3          	sub	a5,a5,a0
80009344:	00279793          	slli	a5,a5,0x2
80009348:	00f50533          	add	a0,a0,a5
8000934c:	00351513          	slli	a0,a0,0x3
80009350:	01051513          	slli	a0,a0,0x10
80009354:	01055513          	srli	a0,a0,0x10
80009358:	1f400593          	li	a1,500
8000935c:	1f350513          	addi	a0,a0,499
80009360:	7f1030ef          	jal	ra,8000d350 <__divsi3>
80009364:	00a49423          	sh	a0,8(s1)
80009368:	00040513          	mv	a0,s0
8000936c:	02c12083          	lw	ra,44(sp)
80009370:	02812403          	lw	s0,40(sp)
80009374:	02412483          	lw	s1,36(sp)
80009378:	02012903          	lw	s2,32(sp)
8000937c:	01c12983          	lw	s3,28(sp)
80009380:	01812a03          	lw	s4,24(sp)
80009384:	01412a83          	lw	s5,20(sp)
80009388:	03010113          	addi	sp,sp,48
8000938c:	00008067          	ret
80009390:	0000f537          	lui	a0,0xf
80009394:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
80009398:	fc1ff06f          	j	80009358 <dhcp_select+0x238>

8000939c <dhcp_discover>:
8000939c:	fd010113          	addi	sp,sp,-48
800093a0:	01312e23          	sw	s3,28(sp)
800093a4:	02112623          	sw	ra,44(sp)
800093a8:	02812423          	sw	s0,40(sp)
800093ac:	02912223          	sw	s1,36(sp)
800093b0:	03212023          	sw	s2,32(sp)
800093b4:	02852483          	lw	s1,40(a0)
800093b8:	00050993          	mv	s3,a0
800093bc:	00600593          	li	a1,6
800093c0:	00048513          	mv	a0,s1
800093c4:	0004ae23          	sw	zero,28(s1)
800093c8:	8adff0ef          	jal	ra,80008c74 <dhcp_set_state>
800093cc:	00e10693          	addi	a3,sp,14
800093d0:	00100613          	li	a2,1
800093d4:	00048593          	mv	a1,s1
800093d8:	00098513          	mv	a0,s3
800093dc:	941ff0ef          	jal	ra,80008d1c <dhcp_create_msg>
800093e0:	10050063          	beqz	a0,800094e0 <dhcp_discover+0x144>
800093e4:	00452403          	lw	s0,4(a0)
800093e8:	00e15783          	lhu	a5,14(sp)
800093ec:	00050913          	mv	s2,a0
800093f0:	0f040413          	addi	s0,s0,240
800093f4:	00f40733          	add	a4,s0,a5
800093f8:	00278513          	addi	a0,a5,2
800093fc:	00178793          	addi	a5,a5,1
80009400:	01079793          	slli	a5,a5,0x10
80009404:	03900693          	li	a3,57
80009408:	0107d793          	srli	a5,a5,0x10
8000940c:	00d70023          	sb	a3,0(a4)
80009410:	00f407b3          	add	a5,s0,a5
80009414:	00200713          	li	a4,2
80009418:	00e78023          	sb	a4,0(a5)
8000941c:	02c9d603          	lhu	a2,44(s3)
80009420:	01051513          	slli	a0,a0,0x10
80009424:	01055513          	srli	a0,a0,0x10
80009428:	00040593          	mv	a1,s0
8000942c:	00a11723          	sh	a0,14(sp)
80009430:	85dff0ef          	jal	ra,80008c8c <dhcp_option_short>
80009434:	00a40733          	add	a4,s0,a0
80009438:	03700693          	li	a3,55
8000943c:	00d70023          	sb	a3,0(a4)
80009440:	00150713          	addi	a4,a0,1
80009444:	01071713          	slli	a4,a4,0x10
80009448:	01075713          	srli	a4,a4,0x10
8000944c:	00300613          	li	a2,3
80009450:	00e40733          	add	a4,s0,a4
80009454:	00c70023          	sb	a2,0(a4)
80009458:	00250713          	addi	a4,a0,2
8000945c:	01071713          	slli	a4,a4,0x10
80009460:	01075713          	srli	a4,a4,0x10
80009464:	00e40733          	add	a4,s0,a4
80009468:	00100693          	li	a3,1
8000946c:	00d70023          	sb	a3,0(a4)
80009470:	00050793          	mv	a5,a0
80009474:	00350693          	addi	a3,a0,3
80009478:	01069693          	slli	a3,a3,0x10
8000947c:	00478793          	addi	a5,a5,4
80009480:	0106d693          	srli	a3,a3,0x10
80009484:	01079793          	slli	a5,a5,0x10
80009488:	00d406b3          	add	a3,s0,a3
8000948c:	00550513          	addi	a0,a0,5
80009490:	0107d793          	srli	a5,a5,0x10
80009494:	00c68023          	sb	a2,0(a3)
80009498:	00f407b3          	add	a5,s0,a5
8000949c:	01c00713          	li	a4,28
800094a0:	01051513          	slli	a0,a0,0x10
800094a4:	00e78023          	sb	a4,0(a5)
800094a8:	01055513          	srli	a0,a0,0x10
800094ac:	00090613          	mv	a2,s2
800094b0:	00040593          	mv	a1,s0
800094b4:	00a11723          	sh	a0,14(sp)
800094b8:	a09ff0ef          	jal	ra,80008ec0 <dhcp_option_trailer>
800094bc:	8ec1a503          	lw	a0,-1812(gp) # 80003194 <dhcp_pcb>
800094c0:	84818793          	addi	a5,gp,-1976 # 800030f0 <ip_addr_any>
800094c4:	00098713          	mv	a4,s3
800094c8:	04300693          	li	a3,67
800094cc:	84418613          	addi	a2,gp,-1980 # 800030ec <ip_addr_broadcast>
800094d0:	00090593          	mv	a1,s2
800094d4:	abcff0ef          	jal	ra,80008790 <udp_sendto_if_src>
800094d8:	00090513          	mv	a0,s2
800094dc:	b09fd0ef          	jal	ra,80006fe4 <pbuf_free>
800094e0:	0064c783          	lbu	a5,6(s1)
800094e4:	0ff00713          	li	a4,255
800094e8:	00e78663          	beq	a5,a4,800094f4 <dhcp_discover+0x158>
800094ec:	00178793          	addi	a5,a5,1
800094f0:	00f48323          	sb	a5,6(s1)
800094f4:	0064c783          	lbu	a5,6(s1)
800094f8:	00500713          	li	a4,5
800094fc:	04f76c63          	bltu	a4,a5,80009554 <dhcp_discover+0x1b8>
80009500:	00100513          	li	a0,1
80009504:	00f51533          	sll	a0,a0,a5
80009508:	00551793          	slli	a5,a0,0x5
8000950c:	40a787b3          	sub	a5,a5,a0
80009510:	00279793          	slli	a5,a5,0x2
80009514:	00f50533          	add	a0,a0,a5
80009518:	00351513          	slli	a0,a0,0x3
8000951c:	01051513          	slli	a0,a0,0x10
80009520:	01055513          	srli	a0,a0,0x10
80009524:	1f400593          	li	a1,500
80009528:	1f350513          	addi	a0,a0,499
8000952c:	625030ef          	jal	ra,8000d350 <__divsi3>
80009530:	00a49423          	sh	a0,8(s1)
80009534:	02c12083          	lw	ra,44(sp)
80009538:	02812403          	lw	s0,40(sp)
8000953c:	02412483          	lw	s1,36(sp)
80009540:	02012903          	lw	s2,32(sp)
80009544:	01c12983          	lw	s3,28(sp)
80009548:	00000513          	li	a0,0
8000954c:	03010113          	addi	sp,sp,48
80009550:	00008067          	ret
80009554:	0000f537          	lui	a0,0xf
80009558:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
8000955c:	fc9ff06f          	j	80009524 <dhcp_discover+0x188>

80009560 <dhcp_check>:
80009560:	ff010113          	addi	sp,sp,-16
80009564:	00112623          	sw	ra,12(sp)
80009568:	00912223          	sw	s1,4(sp)
8000956c:	00812423          	sw	s0,8(sp)
80009570:	02852403          	lw	s0,40(a0)
80009574:	00050493          	mv	s1,a0
80009578:	00800593          	li	a1,8
8000957c:	00040513          	mv	a0,s0
80009580:	ef4ff0ef          	jal	ra,80008c74 <dhcp_set_state>
80009584:	00000613          	li	a2,0
80009588:	01c40593          	addi	a1,s0,28
8000958c:	00048513          	mv	a0,s1
80009590:	4b5010ef          	jal	ra,8000b244 <etharp_query>
80009594:	00644783          	lbu	a5,6(s0)
80009598:	0ff00713          	li	a4,255
8000959c:	00e78663          	beq	a5,a4,800095a8 <dhcp_check+0x48>
800095a0:	00178793          	addi	a5,a5,1
800095a4:	00f40323          	sb	a5,6(s0)
800095a8:	00100793          	li	a5,1
800095ac:	00f41423          	sh	a5,8(s0)
800095b0:	00c12083          	lw	ra,12(sp)
800095b4:	00812403          	lw	s0,8(sp)
800095b8:	00412483          	lw	s1,4(sp)
800095bc:	01010113          	addi	sp,sp,16
800095c0:	00008067          	ret

800095c4 <dhcp_bind>:
800095c4:	1a050863          	beqz	a0,80009774 <dhcp_bind+0x1b0>
800095c8:	fe010113          	addi	sp,sp,-32
800095cc:	00112e23          	sw	ra,28(sp)
800095d0:	00812c23          	sw	s0,24(sp)
800095d4:	00912a23          	sw	s1,20(sp)
800095d8:	02852403          	lw	s0,40(a0)
800095dc:	10040a63          	beqz	s0,800096f0 <dhcp_bind+0x12c>
800095e0:	00050493          	mv	s1,a0
800095e4:	02842503          	lw	a0,40(s0)
800095e8:	00041923          	sh	zero,18(s0)
800095ec:	fff00793          	li	a5,-1
800095f0:	02f50463          	beq	a0,a5,80009618 <dhcp_bind+0x54>
800095f4:	01e50513          	addi	a0,a0,30
800095f8:	003c07b7          	lui	a5,0x3c0
800095fc:	10f57463          	bgeu	a0,a5,80009704 <dhcp_bind+0x140>
80009600:	03c00593          	li	a1,60
80009604:	555030ef          	jal	ra,8000d358 <__udivsi3>
80009608:	01051793          	slli	a5,a0,0x10
8000960c:	0107d793          	srli	a5,a5,0x10
80009610:	10050063          	beqz	a0,80009710 <dhcp_bind+0x14c>
80009614:	00f41a23          	sh	a5,20(s0)
80009618:	02c42503          	lw	a0,44(s0)
8000961c:	fff00793          	li	a5,-1
80009620:	02f50863          	beq	a0,a5,80009650 <dhcp_bind+0x8c>
80009624:	01e50513          	addi	a0,a0,30
80009628:	003c07b7          	lui	a5,0x3c0
8000962c:	0ef57663          	bgeu	a0,a5,80009718 <dhcp_bind+0x154>
80009630:	03c00593          	li	a1,60
80009634:	525030ef          	jal	ra,8000d358 <__udivsi3>
80009638:	01051793          	slli	a5,a0,0x10
8000963c:	0107d793          	srli	a5,a5,0x10
80009640:	0e050263          	beqz	a0,80009724 <dhcp_bind+0x160>
80009644:	00f41523          	sh	a5,10(s0)
80009648:	00a45783          	lhu	a5,10(s0)
8000964c:	00f41723          	sh	a5,14(s0)
80009650:	03042503          	lw	a0,48(s0)
80009654:	fff00793          	li	a5,-1
80009658:	02f50863          	beq	a0,a5,80009688 <dhcp_bind+0xc4>
8000965c:	01e50513          	addi	a0,a0,30
80009660:	003c07b7          	lui	a5,0x3c0
80009664:	0cf57463          	bgeu	a0,a5,8000972c <dhcp_bind+0x168>
80009668:	03c00593          	li	a1,60
8000966c:	4ed030ef          	jal	ra,8000d358 <__udivsi3>
80009670:	01051793          	slli	a5,a0,0x10
80009674:	0107d793          	srli	a5,a5,0x10
80009678:	0c050063          	beqz	a0,80009738 <dhcp_bind+0x174>
8000967c:	00f41623          	sh	a5,12(s0)
80009680:	00c45783          	lhu	a5,12(s0)
80009684:	00f41823          	sh	a5,16(s0)
80009688:	00c45783          	lhu	a5,12(s0)
8000968c:	00a45703          	lhu	a4,10(s0)
80009690:	00f76663          	bltu	a4,a5,8000969c <dhcp_bind+0xd8>
80009694:	00078463          	beqz	a5,8000969c <dhcp_bind+0xd8>
80009698:	00041523          	sh	zero,10(s0)
8000969c:	00744783          	lbu	a5,7(s0)
800096a0:	0a078063          	beqz	a5,80009740 <dhcp_bind+0x17c>
800096a4:	02042783          	lw	a5,32(s0)
800096a8:	00f12423          	sw	a5,8(sp)
800096ac:	02442783          	lw	a5,36(s0)
800096b0:	00f12623          	sw	a5,12(sp)
800096b4:	00079e63          	bnez	a5,800096d0 <dhcp_bind+0x10c>
800096b8:	00812703          	lw	a4,8(sp)
800096bc:	01c42783          	lw	a5,28(s0)
800096c0:	00e7f7b3          	and	a5,a5,a4
800096c4:	01000737          	lui	a4,0x1000
800096c8:	00e7e7b3          	or	a5,a5,a4
800096cc:	00f12623          	sw	a5,12(sp)
800096d0:	00a00593          	li	a1,10
800096d4:	00040513          	mv	a0,s0
800096d8:	d9cff0ef          	jal	ra,80008c74 <dhcp_set_state>
800096dc:	00c10693          	addi	a3,sp,12
800096e0:	00810613          	addi	a2,sp,8
800096e4:	01c40593          	addi	a1,s0,28
800096e8:	00048513          	mv	a0,s1
800096ec:	9c0fd0ef          	jal	ra,800068ac <netif_set_addr>
800096f0:	01c12083          	lw	ra,28(sp)
800096f4:	01812403          	lw	s0,24(sp)
800096f8:	01412483          	lw	s1,20(sp)
800096fc:	02010113          	addi	sp,sp,32
80009700:	00008067          	ret
80009704:	000107b7          	lui	a5,0x10
80009708:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
8000970c:	f09ff06f          	j	80009614 <dhcp_bind+0x50>
80009710:	00100793          	li	a5,1
80009714:	f01ff06f          	j	80009614 <dhcp_bind+0x50>
80009718:	000107b7          	lui	a5,0x10
8000971c:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80009720:	f25ff06f          	j	80009644 <dhcp_bind+0x80>
80009724:	00100793          	li	a5,1
80009728:	f1dff06f          	j	80009644 <dhcp_bind+0x80>
8000972c:	000107b7          	lui	a5,0x10
80009730:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80009734:	f49ff06f          	j	8000967c <dhcp_bind+0xb8>
80009738:	00100793          	li	a5,1
8000973c:	f41ff06f          	j	8000967c <dhcp_bind+0xb8>
80009740:	01c44783          	lbu	a5,28(s0)
80009744:	01879713          	slli	a4,a5,0x18
80009748:	41875713          	srai	a4,a4,0x18
8000974c:	00074663          	bltz	a4,80009758 <dhcp_bind+0x194>
80009750:	0ff00793          	li	a5,255
80009754:	f55ff06f          	j	800096a8 <dhcp_bind+0xe4>
80009758:	0bf00713          	li	a4,191
8000975c:	00f77863          	bgeu	a4,a5,8000976c <dhcp_bind+0x1a8>
80009760:	010007b7          	lui	a5,0x1000
80009764:	fff78793          	addi	a5,a5,-1 # ffffff <_stack_size+0xfff7ff>
80009768:	f41ff06f          	j	800096a8 <dhcp_bind+0xe4>
8000976c:	000107b7          	lui	a5,0x10
80009770:	ff5ff06f          	j	80009764 <dhcp_bind+0x1a0>
80009774:	00008067          	ret

80009778 <dhcp_inc_pcb_refcount>:
80009778:	ff010113          	addi	sp,sp,-16
8000977c:	00812423          	sw	s0,8(sp)
80009780:	8e81c783          	lbu	a5,-1816(gp) # 80003190 <dhcp_pcb_refcount>
80009784:	00112623          	sw	ra,12(sp)
80009788:	00912223          	sw	s1,4(sp)
8000978c:	01212023          	sw	s2,0(sp)
80009790:	04079863          	bnez	a5,800097e0 <dhcp_inc_pcb_refcount+0x68>
80009794:	c4cff0ef          	jal	ra,80008be0 <udp_new>
80009798:	8ea1a623          	sw	a0,-1812(gp) # 80003194 <dhcp_pcb>
8000979c:	fff00713          	li	a4,-1
800097a0:	04050863          	beqz	a0,800097f0 <dhcp_inc_pcb_refcount+0x78>
800097a4:	00954703          	lbu	a4,9(a0)
800097a8:	04400613          	li	a2,68
800097ac:	02076713          	ori	a4,a4,32
800097b0:	00e504a3          	sb	a4,9(a0)
800097b4:	84818593          	addi	a1,gp,-1976 # 800030f0 <ip_addr_any>
800097b8:	ee9fe0ef          	jal	ra,800086a0 <udp_bind>
800097bc:	8ec1a503          	lw	a0,-1812(gp) # 80003194 <dhcp_pcb>
800097c0:	04300613          	li	a2,67
800097c4:	84818593          	addi	a1,gp,-1976 # 800030f0 <ip_addr_any>
800097c8:	af8ff0ef          	jal	ra,80008ac0 <udp_connect>
800097cc:	8ec1a503          	lw	a0,-1812(gp) # 80003194 <dhcp_pcb>
800097d0:	8000a5b7          	lui	a1,0x8000a
800097d4:	00000613          	li	a2,0
800097d8:	93858593          	addi	a1,a1,-1736 # 80009938 <_ram_heap_end+0xffff7938>
800097dc:	bb0ff0ef          	jal	ra,80008b8c <udp_recv>
800097e0:	8e81c783          	lbu	a5,-1816(gp) # 80003190 <dhcp_pcb_refcount>
800097e4:	00000713          	li	a4,0
800097e8:	00178793          	addi	a5,a5,1 # 10001 <_stack_size+0xf801>
800097ec:	8ef18423          	sb	a5,-1816(gp) # 80003190 <dhcp_pcb_refcount>
800097f0:	00c12083          	lw	ra,12(sp)
800097f4:	00812403          	lw	s0,8(sp)
800097f8:	00412483          	lw	s1,4(sp)
800097fc:	00012903          	lw	s2,0(sp)
80009800:	00070513          	mv	a0,a4
80009804:	01010113          	addi	sp,sp,16
80009808:	00008067          	ret

8000980c <dhcp_handle_ack.isra.0>:
8000980c:	ff010113          	addi	sp,sp,-16
80009810:	00912223          	sw	s1,4(sp)
80009814:	00812423          	sw	s0,8(sp)
80009818:	00112623          	sw	ra,12(sp)
8000981c:	8f018793          	addi	a5,gp,-1808 # 80003198 <dhcp_rx_options_given>
80009820:	0037c783          	lbu	a5,3(a5)
80009824:	02052023          	sw	zero,32(a0)
80009828:	02052223          	sw	zero,36(a0)
8000982c:	00050413          	mv	s0,a0
80009830:	8f018493          	addi	s1,gp,-1808 # 80003198 <dhcp_rx_options_given>
80009834:	00078663          	beqz	a5,80009840 <dhcp_handle_ack.isra.0+0x34>
80009838:	b381a783          	lw	a5,-1224(gp) # 800033e0 <dhcp_rx_options_val+0xc>
8000983c:	02f52423          	sw	a5,40(a0)
80009840:	0044c783          	lbu	a5,4(s1)
80009844:	08078663          	beqz	a5,800098d0 <dhcp_handle_ack.isra.0+0xc4>
80009848:	b3c1a783          	lw	a5,-1220(gp) # 800033e4 <dhcp_rx_options_val+0x10>
8000984c:	02f42623          	sw	a5,44(s0)
80009850:	0054c783          	lbu	a5,5(s1)
80009854:	08078463          	beqz	a5,800098dc <dhcp_handle_ack.isra.0+0xd0>
80009858:	b401a783          	lw	a5,-1216(gp) # 800033e8 <dhcp_rx_options_val+0x14>
8000985c:	02f42823          	sw	a5,48(s0)
80009860:	0115c703          	lbu	a4,17(a1)
80009864:	0105c783          	lbu	a5,16(a1)
80009868:	00871713          	slli	a4,a4,0x8
8000986c:	00f76733          	or	a4,a4,a5
80009870:	0125c783          	lbu	a5,18(a1)
80009874:	01079793          	slli	a5,a5,0x10
80009878:	00e7e733          	or	a4,a5,a4
8000987c:	0135c783          	lbu	a5,19(a1)
80009880:	01879793          	slli	a5,a5,0x18
80009884:	00e7e7b3          	or	a5,a5,a4
80009888:	00f42e23          	sw	a5,28(s0)
8000988c:	0064c783          	lbu	a5,6(s1)
80009890:	06078063          	beqz	a5,800098f0 <dhcp_handle_ack.isra.0+0xe4>
80009894:	b441a503          	lw	a0,-1212(gp) # 800033ec <dhcp_rx_options_val+0x18>
80009898:	d40fc0ef          	jal	ra,80005dd8 <lwip_htonl>
8000989c:	00100793          	li	a5,1
800098a0:	02a42023          	sw	a0,32(s0)
800098a4:	00f403a3          	sb	a5,7(s0)
800098a8:	0074c783          	lbu	a5,7(s1)
800098ac:	00078863          	beqz	a5,800098bc <dhcp_handle_ack.isra.0+0xb0>
800098b0:	b481a503          	lw	a0,-1208(gp) # 800033f0 <dhcp_rx_options_val+0x1c>
800098b4:	d24fc0ef          	jal	ra,80005dd8 <lwip_htonl>
800098b8:	02a42223          	sw	a0,36(s0)
800098bc:	00c12083          	lw	ra,12(sp)
800098c0:	00812403          	lw	s0,8(sp)
800098c4:	00412483          	lw	s1,4(sp)
800098c8:	01010113          	addi	sp,sp,16
800098cc:	00008067          	ret
800098d0:	02842783          	lw	a5,40(s0)
800098d4:	0017d793          	srli	a5,a5,0x1
800098d8:	f75ff06f          	j	8000984c <dhcp_handle_ack.isra.0+0x40>
800098dc:	02842703          	lw	a4,40(s0)
800098e0:	00371793          	slli	a5,a4,0x3
800098e4:	40e787b3          	sub	a5,a5,a4
800098e8:	0037d793          	srli	a5,a5,0x3
800098ec:	f71ff06f          	j	8000985c <dhcp_handle_ack.isra.0+0x50>
800098f0:	000403a3          	sb	zero,7(s0)
800098f4:	fb5ff06f          	j	800098a8 <dhcp_handle_ack.isra.0+0x9c>

800098f8 <dhcp_dec_pcb_refcount>:
800098f8:	8e81c783          	lbu	a5,-1816(gp) # 80003190 <dhcp_pcb_refcount>
800098fc:	fff78793          	addi	a5,a5,-1
80009900:	0ff7f793          	andi	a5,a5,255
80009904:	8ef18423          	sb	a5,-1816(gp) # 80003190 <dhcp_pcb_refcount>
80009908:	02079663          	bnez	a5,80009934 <dhcp_dec_pcb_refcount+0x3c>
8000990c:	ff010113          	addi	sp,sp,-16
80009910:	00812423          	sw	s0,8(sp)
80009914:	8ec1a503          	lw	a0,-1812(gp) # 80003194 <dhcp_pcb>
80009918:	00112623          	sw	ra,12(sp)
8000991c:	a80ff0ef          	jal	ra,80008b9c <udp_remove>
80009920:	00c12083          	lw	ra,12(sp)
80009924:	8e01a623          	sw	zero,-1812(gp) # 80003194 <dhcp_pcb>
80009928:	00812403          	lw	s0,8(sp)
8000992c:	01010113          	addi	sp,sp,16
80009930:	00008067          	ret
80009934:	00008067          	ret

80009938 <dhcp_recv>:
80009938:	fa010113          	addi	sp,sp,-96
8000993c:	05212823          	sw	s2,80(sp)
80009940:	9f81a903          	lw	s2,-1544(gp) # 800032a0 <ip_data+0x4>
80009944:	05312623          	sw	s3,76(sp)
80009948:	04112e23          	sw	ra,92(sp)
8000994c:	04812c23          	sw	s0,88(sp)
80009950:	04912a23          	sw	s1,84(sp)
80009954:	05412423          	sw	s4,72(sp)
80009958:	05512223          	sw	s5,68(sp)
8000995c:	05612023          	sw	s6,64(sp)
80009960:	03712e23          	sw	s7,60(sp)
80009964:	03812c23          	sw	s8,56(sp)
80009968:	03912a23          	sw	s9,52(sp)
8000996c:	03a12823          	sw	s10,48(sp)
80009970:	03b12623          	sw	s11,44(sp)
80009974:	02892b83          	lw	s7,40(s2)
80009978:	00060993          	mv	s3,a2
8000997c:	0e0b8663          	beqz	s7,80009a68 <dhcp_recv+0x130>
80009980:	004bc783          	lbu	a5,4(s7)
80009984:	0e078263          	beqz	a5,80009a68 <dhcp_recv+0x130>
80009988:	00a65703          	lhu	a4,10(a2)
8000998c:	02b00793          	li	a5,43
80009990:	0ce7fc63          	bgeu	a5,a4,80009a68 <dhcp_recv+0x130>
80009994:	00462783          	lw	a5,4(a2)
80009998:	00200713          	li	a4,2
8000999c:	0007c683          	lbu	a3,0(a5)
800099a0:	0ce69463          	bne	a3,a4,80009a68 <dhcp_recv+0x130>
800099a4:	03494603          	lbu	a2,52(s2)
800099a8:	00000713          	li	a4,0
800099ac:	00600693          	li	a3,6
800099b0:	0ff77593          	andi	a1,a4,255
800099b4:	00c5f463          	bgeu	a1,a2,800099bc <dhcp_recv+0x84>
800099b8:	08d71c63          	bne	a4,a3,80009a50 <dhcp_recv+0x118>
800099bc:	0057c503          	lbu	a0,5(a5)
800099c0:	0047c703          	lbu	a4,4(a5)
800099c4:	00851513          	slli	a0,a0,0x8
800099c8:	00e56533          	or	a0,a0,a4
800099cc:	0067c703          	lbu	a4,6(a5)
800099d0:	01071713          	slli	a4,a4,0x10
800099d4:	00a76733          	or	a4,a4,a0
800099d8:	0077c503          	lbu	a0,7(a5)
800099dc:	01851513          	slli	a0,a0,0x18
800099e0:	00e56533          	or	a0,a0,a4
800099e4:	bf4fc0ef          	jal	ra,80005dd8 <lwip_htonl>
800099e8:	000ba783          	lw	a5,0(s7)
800099ec:	06f51e63          	bne	a0,a5,80009a68 <dhcp_recv+0x130>
800099f0:	8f018793          	addi	a5,gp,-1808 # 80003198 <dhcp_rx_options_given>
800099f4:	0007a223          	sw	zero,4(a5)
800099f8:	00a9d703          	lhu	a4,10(s3)
800099fc:	0007a023          	sw	zero,0(a5)
80009a00:	02b00793          	li	a5,43
80009a04:	8f018813          	addi	a6,gp,-1808 # 80003198 <dhcp_rx_options_given>
80009a08:	06e7f063          	bgeu	a5,a4,80009a68 <dhcp_recv+0x130>
80009a0c:	00010ab7          	lui	s5,0x10
80009a10:	ffda8793          	addi	a5,s5,-3 # fffd <_stack_size+0xf7fd>
80009a14:	0089dd83          	lhu	s11,8(s3)
80009a18:	00f12423          	sw	a5,8(sp)
80009a1c:	b2c18793          	addi	a5,gp,-1236 # 800033d4 <dhcp_rx_options_val>
80009a20:	00000b13          	li	s6,0
80009a24:	0f000d13          	li	s10,240
80009a28:	00f12223          	sw	a5,4(sp)
80009a2c:	00098c13          	mv	s8,s3
80009a30:	00ac5783          	lhu	a5,10(s8)
80009a34:	06fd7c63          	bgeu	s10,a5,80009aac <dhcp_recv+0x174>
80009a38:	004c2783          	lw	a5,4(s8)
80009a3c:	000d0413          	mv	s0,s10
80009a40:	00400a93          	li	s5,4
80009a44:	00f12023          	sw	a5,0(sp)
80009a48:	00100a13          	li	s4,1
80009a4c:	25c0006f          	j	80009ca8 <dhcp_recv+0x370>
80009a50:	00e905b3          	add	a1,s2,a4
80009a54:	00170713          	addi	a4,a4,1 # 1000001 <_stack_size+0xfff801>
80009a58:	00e78533          	add	a0,a5,a4
80009a5c:	02e5c583          	lbu	a1,46(a1)
80009a60:	01b54503          	lbu	a0,27(a0)
80009a64:	f4b506e3          	beq	a0,a1,800099b0 <dhcp_recv+0x78>
80009a68:	00098513          	mv	a0,s3
80009a6c:	d78fd0ef          	jal	ra,80006fe4 <pbuf_free>
80009a70:	05c12083          	lw	ra,92(sp)
80009a74:	05812403          	lw	s0,88(sp)
80009a78:	05412483          	lw	s1,84(sp)
80009a7c:	05012903          	lw	s2,80(sp)
80009a80:	04c12983          	lw	s3,76(sp)
80009a84:	04812a03          	lw	s4,72(sp)
80009a88:	04412a83          	lw	s5,68(sp)
80009a8c:	04012b03          	lw	s6,64(sp)
80009a90:	03c12b83          	lw	s7,60(sp)
80009a94:	03812c03          	lw	s8,56(sp)
80009a98:	03412c83          	lw	s9,52(sp)
80009a9c:	03012d03          	lw	s10,48(sp)
80009aa0:	02c12d83          	lw	s11,44(sp)
80009aa4:	06010113          	addi	sp,sp,96
80009aa8:	00008067          	ret
80009aac:	000c2c03          	lw	s8,0(s8)
80009ab0:	40fd0d33          	sub	s10,s10,a5
80009ab4:	40fd8db3          	sub	s11,s11,a5
80009ab8:	010d1d13          	slli	s10,s10,0x10
80009abc:	010d9d93          	slli	s11,s11,0x10
80009ac0:	010d5d13          	srli	s10,s10,0x10
80009ac4:	010ddd93          	srli	s11,s11,0x10
80009ac8:	f60c14e3          	bnez	s8,80009a30 <dhcp_recv+0xf8>
80009acc:	f9dff06f          	j	80009a68 <dhcp_recv+0x130>
80009ad0:	00240693          	addi	a3,s0,2
80009ad4:	01069693          	slli	a3,a3,0x10
80009ad8:	0106d693          	srli	a3,a3,0x10
80009adc:	f886e6e3          	bltu	a3,s0,80009a68 <dhcp_recv+0x130>
80009ae0:	00ac5583          	lhu	a1,10(s8)
80009ae4:	00140613          	addi	a2,s0,1
80009ae8:	02b65c63          	bge	a2,a1,80009b20 <dhcp_recv+0x1e8>
80009aec:	00174703          	lbu	a4,1(a4)
80009af0:	03400593          	li	a1,52
80009af4:	12b78263          	beq	a5,a1,80009c18 <dhcp_recv+0x2e0>
80009af8:	02f5ee63          	bltu	a1,a5,80009b34 <dhcp_recv+0x1fc>
80009afc:	07478263          	beq	a5,s4,80009b60 <dhcp_recv+0x228>
80009b00:	16078663          	beqz	a5,80009c6c <dhcp_recv+0x334>
80009b04:	00300613          	li	a2,3
80009b08:	0ec78663          	beq	a5,a2,80009bf4 <dhcp_recv+0x2bc>
80009b0c:	03300613          	li	a2,51
80009b10:	0ec78a63          	beq	a5,a2,80009c04 <dhcp_recv+0x2cc>
80009b14:	fff00493          	li	s1,-1
80009b18:	00000c93          	li	s9,0
80009b1c:	0500006f          	j	80009b6c <dhcp_recv+0x234>
80009b20:	000c2703          	lw	a4,0(s8)
80009b24:	32070263          	beqz	a4,80009e48 <dhcp_recv+0x510>
80009b28:	00472703          	lw	a4,4(a4)
80009b2c:	00074703          	lbu	a4,0(a4)
80009b30:	fc1ff06f          	j	80009af0 <dhcp_recv+0x1b8>
80009b34:	03600613          	li	a2,54
80009b38:	10c78863          	beq	a5,a2,80009c48 <dhcp_recv+0x310>
80009b3c:	0ec7ec63          	bltu	a5,a2,80009c34 <dhcp_recv+0x2fc>
80009b40:	03a00613          	li	a2,58
80009b44:	10c78c63          	beq	a5,a2,80009c5c <dhcp_recv+0x324>
80009b48:	03b00613          	li	a2,59
80009b4c:	fcc794e3          	bne	a5,a2,80009b14 <dhcp_recv+0x1dc>
80009b50:	f1571ce3          	bne	a4,s5,80009a68 <dhcp_recv+0x130>
80009b54:	00400c93          	li	s9,4
80009b58:	00500493          	li	s1,5
80009b5c:	0100006f          	j	80009b6c <dhcp_recv+0x234>
80009b60:	f15714e3          	bne	a4,s5,80009a68 <dhcp_recv+0x130>
80009b64:	00400c93          	li	s9,4
80009b68:	00600493          	li	s1,6
80009b6c:	00812783          	lw	a5,8(sp)
80009b70:	00870433          	add	s0,a4,s0
80009b74:	ee87cae3          	blt	a5,s0,80009a68 <dhcp_recv+0x130>
80009b78:	00e68733          	add	a4,a3,a4
80009b7c:	01071413          	slli	s0,a4,0x10
80009b80:	01045413          	srli	s0,s0,0x10
80009b84:	0e0c8863          	beqz	s9,80009c74 <dhcp_recv+0x33c>
80009b88:	009807b3          	add	a5,a6,s1
80009b8c:	0007c783          	lbu	a5,0(a5)
80009b90:	00012e23          	sw	zero,28(sp)
80009b94:	0e079063          	bnez	a5,80009c74 <dhcp_recv+0x33c>
80009b98:	010c9793          	slli	a5,s9,0x10
80009b9c:	0107d793          	srli	a5,a5,0x10
80009ba0:	00078613          	mv	a2,a5
80009ba4:	01c10593          	addi	a1,sp,28
80009ba8:	000c0513          	mv	a0,s8
80009bac:	00f12623          	sw	a5,12(sp)
80009bb0:	a19fd0ef          	jal	ra,800075c8 <pbuf_copy_partial>
80009bb4:	00c12783          	lw	a5,12(sp)
80009bb8:	eaa798e3          	bne	a5,a0,80009a68 <dhcp_recv+0x130>
80009bbc:	8f018813          	addi	a6,gp,-1808 # 80003198 <dhcp_rx_options_given>
80009bc0:	155c9a63          	bne	s9,s5,80009d14 <dhcp_recv+0x3dc>
80009bc4:	01c12503          	lw	a0,28(sp)
80009bc8:	a10fc0ef          	jal	ra,80005dd8 <lwip_htonl>
80009bcc:	00a12e23          	sw	a0,28(sp)
80009bd0:	8f018813          	addi	a6,gp,-1808 # 80003198 <dhcp_rx_options_given>
80009bd4:	009807b3          	add	a5,a6,s1
80009bd8:	01478023          	sb	s4,0(a5)
80009bdc:	00412783          	lw	a5,4(sp)
80009be0:	00249493          	slli	s1,s1,0x2
80009be4:	009784b3          	add	s1,a5,s1
80009be8:	01c12783          	lw	a5,28(sp)
80009bec:	00f4a023          	sw	a5,0(s1)
80009bf0:	0840006f          	j	80009c74 <dhcp_recv+0x33c>
80009bf4:	e6e7fae3          	bgeu	a5,a4,80009a68 <dhcp_recv+0x130>
80009bf8:	00700493          	li	s1,7
80009bfc:	00400c93          	li	s9,4
80009c00:	f6dff06f          	j	80009b6c <dhcp_recv+0x234>
80009c04:	e75712e3          	bne	a4,s5,80009a68 <dhcp_recv+0x130>
80009c08:	00400c93          	li	s9,4
80009c0c:	00300493          	li	s1,3
80009c10:	f5dff06f          	j	80009b6c <dhcp_recv+0x234>
80009c14:	00000713          	li	a4,0
80009c18:	e54718e3          	bne	a4,s4,80009a68 <dhcp_recv+0x130>
80009c1c:	0f000793          	li	a5,240
80009c20:	e4fd14e3          	bne	s10,a5,80009a68 <dhcp_recv+0x130>
80009c24:	00100c93          	li	s9,1
80009c28:	00000493          	li	s1,0
80009c2c:	f41ff06f          	j	80009b6c <dhcp_recv+0x234>
80009c30:	00000713          	li	a4,0
80009c34:	e3471ae3          	bne	a4,s4,80009a68 <dhcp_recv+0x130>
80009c38:	00100c93          	li	s9,1
80009c3c:	00100493          	li	s1,1
80009c40:	f2dff06f          	j	80009b6c <dhcp_recv+0x234>
80009c44:	00000713          	li	a4,0
80009c48:	e35710e3          	bne	a4,s5,80009a68 <dhcp_recv+0x130>
80009c4c:	00400c93          	li	s9,4
80009c50:	00200493          	li	s1,2
80009c54:	f19ff06f          	j	80009b6c <dhcp_recv+0x234>
80009c58:	00000713          	li	a4,0
80009c5c:	e15716e3          	bne	a4,s5,80009a68 <dhcp_recv+0x130>
80009c60:	00400c93          	li	s9,4
80009c64:	00400493          	li	s1,4
80009c68:	f05ff06f          	j	80009b6c <dhcp_recv+0x234>
80009c6c:	01061413          	slli	s0,a2,0x10
80009c70:	01045413          	srli	s0,s0,0x10
80009c74:	00ac5783          	lhu	a5,10(s8)
80009c78:	02f46863          	bltu	s0,a5,80009ca8 <dhcp_recv+0x370>
80009c7c:	40f40433          	sub	s0,s0,a5
80009c80:	40fd8db3          	sub	s11,s11,a5
80009c84:	01041413          	slli	s0,s0,0x10
80009c88:	010d9d93          	slli	s11,s11,0x10
80009c8c:	01045413          	srli	s0,s0,0x10
80009c90:	010ddd93          	srli	s11,s11,0x10
80009c94:	ddb47ae3          	bgeu	s0,s11,80009a68 <dhcp_recv+0x130>
80009c98:	000c2c03          	lw	s8,0(s8)
80009c9c:	dc0c06e3          	beqz	s8,80009a68 <dhcp_recv+0x130>
80009ca0:	004c2783          	lw	a5,4(s8)
80009ca4:	00f12023          	sw	a5,0(sp)
80009ca8:	01b47c63          	bgeu	s0,s11,80009cc0 <dhcp_recv+0x388>
80009cac:	00012783          	lw	a5,0(sp)
80009cb0:	0ff00693          	li	a3,255
80009cb4:	00878733          	add	a4,a5,s0
80009cb8:	00074783          	lbu	a5,0(a4)
80009cbc:	e0d79ae3          	bne	a5,a3,80009ad0 <dhcp_recv+0x198>
80009cc0:	00084783          	lbu	a5,0(a6)
80009cc4:	06079063          	bnez	a5,80009d24 <dhcp_recv+0x3ec>
80009cc8:	060b1c63          	bnez	s6,80009d40 <dhcp_recv+0x408>
80009ccc:	00184783          	lbu	a5,1(a6)
80009cd0:	d8078ce3          	beqz	a5,80009a68 <dhcp_recv+0x130>
80009cd4:	b2c18793          	addi	a5,gp,-1236 # 800033d4 <dhcp_rx_options_val>
80009cd8:	0047c703          	lbu	a4,4(a5)
80009cdc:	00500693          	li	a3,5
80009ce0:	0049a583          	lw	a1,4(s3)
80009ce4:	0ad71463          	bne	a4,a3,80009d8c <dhcp_recv+0x454>
80009ce8:	005bc783          	lbu	a5,5(s7)
80009cec:	00100713          	li	a4,1
80009cf0:	06e79c63          	bne	a5,a4,80009d68 <dhcp_recv+0x430>
80009cf4:	02892503          	lw	a0,40(s2)
80009cf8:	b15ff0ef          	jal	ra,8000980c <dhcp_handle_ack.isra.0>
80009cfc:	03594783          	lbu	a5,53(s2)
80009d00:	00090513          	mv	a0,s2
80009d04:	0087f793          	andi	a5,a5,8
80009d08:	06078e63          	beqz	a5,80009d84 <dhcp_recv+0x44c>
80009d0c:	855ff0ef          	jal	ra,80009560 <dhcp_check>
80009d10:	d59ff06f          	j	80009a68 <dhcp_recv+0x130>
80009d14:	d54c9ae3          	bne	s9,s4,80009a68 <dhcp_recv+0x130>
80009d18:	01c14783          	lbu	a5,28(sp)
80009d1c:	00f12e23          	sw	a5,28(sp)
80009d20:	eb5ff06f          	j	80009bd4 <dhcp_recv+0x29c>
80009d24:	00412783          	lw	a5,4(sp)
80009d28:	00080023          	sb	zero,0(a6)
80009d2c:	00100713          	li	a4,1
80009d30:	0007a783          	lw	a5,0(a5)
80009d34:	02e78463          	beq	a5,a4,80009d5c <dhcp_recv+0x424>
80009d38:	00200713          	li	a4,2
80009d3c:	00e79a63          	bne	a5,a4,80009d50 <dhcp_recv+0x418>
80009d40:	00000b13          	li	s6,0
80009d44:	06c00d93          	li	s11,108
80009d48:	02c00d13          	li	s10,44
80009d4c:	ce1ff06f          	j	80009a2c <dhcp_recv+0xf4>
80009d50:	00300713          	li	a4,3
80009d54:	f6e79ae3          	bne	a5,a4,80009cc8 <dhcp_recv+0x390>
80009d58:	00100b13          	li	s6,1
80009d5c:	0ec00d93          	li	s11,236
80009d60:	06c00d13          	li	s10,108
80009d64:	cc9ff06f          	j	80009a2c <dhcp_recv+0xf4>
80009d68:	ffd78793          	addi	a5,a5,-3
80009d6c:	0ff7f793          	andi	a5,a5,255
80009d70:	00200713          	li	a4,2
80009d74:	cef76ae3          	bltu	a4,a5,80009a68 <dhcp_recv+0x130>
80009d78:	02892503          	lw	a0,40(s2)
80009d7c:	a91ff0ef          	jal	ra,8000980c <dhcp_handle_ack.isra.0>
80009d80:	00090513          	mv	a0,s2
80009d84:	841ff0ef          	jal	ra,800095c4 <dhcp_bind>
80009d88:	ce1ff06f          	j	80009a68 <dhcp_recv+0x130>
80009d8c:	00600693          	li	a3,6
80009d90:	04d71663          	bne	a4,a3,80009ddc <dhcp_recv+0x4a4>
80009d94:	005bc703          	lbu	a4,5(s7)
80009d98:	00200693          	li	a3,2
80009d9c:	ffd70793          	addi	a5,a4,-3
80009da0:	0ff7f793          	andi	a5,a5,255
80009da4:	00f6f663          	bgeu	a3,a5,80009db0 <dhcp_recv+0x478>
80009da8:	00100793          	li	a5,1
80009dac:	caf71ee3          	bne	a4,a5,80009a68 <dhcp_recv+0x130>
80009db0:	02892503          	lw	a0,40(s2)
80009db4:	00c00593          	li	a1,12
80009db8:	ebdfe0ef          	jal	ra,80008c74 <dhcp_set_state>
80009dbc:	84818693          	addi	a3,gp,-1976 # 800030f0 <ip_addr_any>
80009dc0:	84818613          	addi	a2,gp,-1976 # 800030f0 <ip_addr_any>
80009dc4:	00090513          	mv	a0,s2
80009dc8:	84818593          	addi	a1,gp,-1976 # 800030f0 <ip_addr_any>
80009dcc:	ae1fc0ef          	jal	ra,800068ac <netif_set_addr>
80009dd0:	00090513          	mv	a0,s2
80009dd4:	dc8ff0ef          	jal	ra,8000939c <dhcp_discover>
80009dd8:	c91ff06f          	j	80009a68 <dhcp_recv+0x130>
80009ddc:	00200613          	li	a2,2
80009de0:	c8c714e3          	bne	a4,a2,80009a68 <dhcp_recv+0x130>
80009de4:	005bc703          	lbu	a4,5(s7)
80009de8:	c8d710e3          	bne	a4,a3,80009a68 <dhcp_recv+0x130>
80009dec:	00284703          	lbu	a4,2(a6)
80009df0:	c6070ce3          	beqz	a4,80009a68 <dhcp_recv+0x130>
80009df4:	02892403          	lw	s0,40(s2)
80009df8:	00b12023          	sw	a1,0(sp)
80009dfc:	00041423          	sh	zero,8(s0)
80009e00:	0087a503          	lw	a0,8(a5)
80009e04:	fd5fb0ef          	jal	ra,80005dd8 <lwip_htonl>
80009e08:	00012583          	lw	a1,0(sp)
80009e0c:	00a42c23          	sw	a0,24(s0)
80009e10:	00090513          	mv	a0,s2
80009e14:	0115c703          	lbu	a4,17(a1)
80009e18:	0105c783          	lbu	a5,16(a1)
80009e1c:	00871713          	slli	a4,a4,0x8
80009e20:	00f76733          	or	a4,a4,a5
80009e24:	0125c783          	lbu	a5,18(a1)
80009e28:	01079793          	slli	a5,a5,0x10
80009e2c:	00e7e733          	or	a4,a5,a4
80009e30:	0135c783          	lbu	a5,19(a1)
80009e34:	01879793          	slli	a5,a5,0x18
80009e38:	00e7e7b3          	or	a5,a5,a4
80009e3c:	00f42e23          	sw	a5,28(s0)
80009e40:	ae0ff0ef          	jal	ra,80009120 <dhcp_select>
80009e44:	c25ff06f          	j	80009a68 <dhcp_recv+0x130>
80009e48:	03400713          	li	a4,52
80009e4c:	dce784e3          	beq	a5,a4,80009c14 <dhcp_recv+0x2dc>
80009e50:	02f76263          	bltu	a4,a5,80009e74 <dhcp_recv+0x53c>
80009e54:	c1478ae3          	beq	a5,s4,80009a68 <dhcp_recv+0x130>
80009e58:	e0078ae3          	beqz	a5,80009c6c <dhcp_recv+0x334>
80009e5c:	00300713          	li	a4,3
80009e60:	c0e784e3          	beq	a5,a4,80009a68 <dhcp_recv+0x130>
80009e64:	03300713          	li	a4,51
80009e68:	c0e780e3          	beq	a5,a4,80009a68 <dhcp_recv+0x130>
80009e6c:	00000713          	li	a4,0
80009e70:	ca5ff06f          	j	80009b14 <dhcp_recv+0x1dc>
80009e74:	03600713          	li	a4,54
80009e78:	dce786e3          	beq	a5,a4,80009c44 <dhcp_recv+0x30c>
80009e7c:	dae7eae3          	bltu	a5,a4,80009c30 <dhcp_recv+0x2f8>
80009e80:	03a00713          	li	a4,58
80009e84:	dce78ae3          	beq	a5,a4,80009c58 <dhcp_recv+0x320>
80009e88:	03b00613          	li	a2,59
80009e8c:	00000713          	li	a4,0
80009e90:	cbdff06f          	j	80009b4c <dhcp_recv+0x214>

80009e94 <dhcp_set_struct>:
80009e94:	ff010113          	addi	sp,sp,-16
80009e98:	00058793          	mv	a5,a1
80009e9c:	00812423          	sw	s0,8(sp)
80009ea0:	03400613          	li	a2,52
80009ea4:	00050413          	mv	s0,a0
80009ea8:	00000593          	li	a1,0
80009eac:	00078513          	mv	a0,a5
80009eb0:	00112623          	sw	ra,12(sp)
80009eb4:	595020ef          	jal	ra,8000cc48 <memset>
80009eb8:	02a42423          	sw	a0,40(s0)
80009ebc:	00c12083          	lw	ra,12(sp)
80009ec0:	00812403          	lw	s0,8(sp)
80009ec4:	01010113          	addi	sp,sp,16
80009ec8:	00008067          	ret

80009ecc <dhcp_cleanup>:
80009ecc:	02852783          	lw	a5,40(a0)
80009ed0:	02078863          	beqz	a5,80009f00 <dhcp_cleanup+0x34>
80009ed4:	ff010113          	addi	sp,sp,-16
80009ed8:	00812423          	sw	s0,8(sp)
80009edc:	00050413          	mv	s0,a0
80009ee0:	00078513          	mv	a0,a5
80009ee4:	00112623          	sw	ra,12(sp)
80009ee8:	f0cfc0ef          	jal	ra,800065f4 <lwip_free>
80009eec:	02042423          	sw	zero,40(s0)
80009ef0:	00c12083          	lw	ra,12(sp)
80009ef4:	00812403          	lw	s0,8(sp)
80009ef8:	01010113          	addi	sp,sp,16
80009efc:	00008067          	ret
80009f00:	00008067          	ret

80009f04 <dhcp_inform>:
80009f04:	0e050a63          	beqz	a0,80009ff8 <dhcp_inform+0xf4>
80009f08:	fb010113          	addi	sp,sp,-80
80009f0c:	04812423          	sw	s0,72(sp)
80009f10:	04112623          	sw	ra,76(sp)
80009f14:	04912223          	sw	s1,68(sp)
80009f18:	05212023          	sw	s2,64(sp)
80009f1c:	00050413          	mv	s0,a0
80009f20:	859ff0ef          	jal	ra,80009778 <dhcp_inc_pcb_refcount>
80009f24:	0a051e63          	bnez	a0,80009fe0 <dhcp_inform+0xdc>
80009f28:	03400613          	li	a2,52
80009f2c:	00000593          	li	a1,0
80009f30:	00c10513          	addi	a0,sp,12
80009f34:	515020ef          	jal	ra,8000cc48 <memset>
80009f38:	00700593          	li	a1,7
80009f3c:	00c10513          	addi	a0,sp,12
80009f40:	d35fe0ef          	jal	ra,80008c74 <dhcp_set_state>
80009f44:	00a10693          	addi	a3,sp,10
80009f48:	00800613          	li	a2,8
80009f4c:	00c10593          	addi	a1,sp,12
80009f50:	00040513          	mv	a0,s0
80009f54:	dc9fe0ef          	jal	ra,80008d1c <dhcp_create_msg>
80009f58:	00050913          	mv	s2,a0
80009f5c:	08050063          	beqz	a0,80009fdc <dhcp_inform+0xd8>
80009f60:	00452483          	lw	s1,4(a0)
80009f64:	00a15783          	lhu	a5,10(sp)
80009f68:	03900693          	li	a3,57
80009f6c:	0f048493          	addi	s1,s1,240
80009f70:	00f48733          	add	a4,s1,a5
80009f74:	00278513          	addi	a0,a5,2
80009f78:	00178793          	addi	a5,a5,1
80009f7c:	01079793          	slli	a5,a5,0x10
80009f80:	0107d793          	srli	a5,a5,0x10
80009f84:	00d70023          	sb	a3,0(a4)
80009f88:	00f487b3          	add	a5,s1,a5
80009f8c:	00200713          	li	a4,2
80009f90:	00e78023          	sb	a4,0(a5)
80009f94:	02c45603          	lhu	a2,44(s0)
80009f98:	01051513          	slli	a0,a0,0x10
80009f9c:	01055513          	srli	a0,a0,0x10
80009fa0:	00048593          	mv	a1,s1
80009fa4:	00a11523          	sh	a0,10(sp)
80009fa8:	ce5fe0ef          	jal	ra,80008c8c <dhcp_option_short>
80009fac:	00090613          	mv	a2,s2
80009fb0:	00048593          	mv	a1,s1
80009fb4:	00a11523          	sh	a0,10(sp)
80009fb8:	f09fe0ef          	jal	ra,80008ec0 <dhcp_option_trailer>
80009fbc:	8ec1a503          	lw	a0,-1812(gp) # 80003194 <dhcp_pcb>
80009fc0:	00040713          	mv	a4,s0
80009fc4:	04300693          	li	a3,67
80009fc8:	84418613          	addi	a2,gp,-1980 # 800030ec <ip_addr_broadcast>
80009fcc:	00090593          	mv	a1,s2
80009fd0:	9b5fe0ef          	jal	ra,80008984 <udp_sendto_if>
80009fd4:	00090513          	mv	a0,s2
80009fd8:	80cfd0ef          	jal	ra,80006fe4 <pbuf_free>
80009fdc:	91dff0ef          	jal	ra,800098f8 <dhcp_dec_pcb_refcount>
80009fe0:	04c12083          	lw	ra,76(sp)
80009fe4:	04812403          	lw	s0,72(sp)
80009fe8:	04412483          	lw	s1,68(sp)
80009fec:	04012903          	lw	s2,64(sp)
80009ff0:	05010113          	addi	sp,sp,80
80009ff4:	00008067          	ret
80009ff8:	00008067          	ret

80009ffc <dhcp_network_changed>:
80009ffc:	02852783          	lw	a5,40(a0)
8000a000:	02078a63          	beqz	a5,8000a034 <dhcp_network_changed+0x38>
8000a004:	0057c703          	lbu	a4,5(a5)
8000a008:	00500693          	li	a3,5
8000a00c:	00e6ec63          	bltu	a3,a4,8000a024 <dhcp_network_changed+0x28>
8000a010:	00300693          	li	a3,3
8000a014:	00d77c63          	bgeu	a4,a3,8000a02c <dhcp_network_changed+0x30>
8000a018:	00070e63          	beqz	a4,8000a034 <dhcp_network_changed+0x38>
8000a01c:	00078323          	sb	zero,6(a5)
8000a020:	b7cff06f          	j	8000939c <dhcp_discover>
8000a024:	00a00693          	li	a3,10
8000a028:	fed71ae3          	bne	a4,a3,8000a01c <dhcp_network_changed+0x20>
8000a02c:	00078323          	sb	zero,6(a5)
8000a030:	ee1fe06f          	j	80008f10 <dhcp_reboot>
8000a034:	00008067          	ret

8000a038 <dhcp_arp_reply>:
8000a038:	12050a63          	beqz	a0,8000a16c <dhcp_arp_reply+0x134>
8000a03c:	fd010113          	addi	sp,sp,-48
8000a040:	02112623          	sw	ra,44(sp)
8000a044:	02812423          	sw	s0,40(sp)
8000a048:	02912223          	sw	s1,36(sp)
8000a04c:	03212023          	sw	s2,32(sp)
8000a050:	01312e23          	sw	s3,28(sp)
8000a054:	01412c23          	sw	s4,24(sp)
8000a058:	02852403          	lw	s0,40(a0)
8000a05c:	0e040863          	beqz	s0,8000a14c <dhcp_arp_reply+0x114>
8000a060:	00544703          	lbu	a4,5(s0)
8000a064:	00800793          	li	a5,8
8000a068:	0ef71263          	bne	a4,a5,8000a14c <dhcp_arp_reply+0x114>
8000a06c:	0005a703          	lw	a4,0(a1)
8000a070:	01c42783          	lw	a5,28(s0)
8000a074:	0cf71c63          	bne	a4,a5,8000a14c <dhcp_arp_reply+0x114>
8000a078:	00050a13          	mv	s4,a0
8000a07c:	00c00593          	li	a1,12
8000a080:	00040513          	mv	a0,s0
8000a084:	bf1fe0ef          	jal	ra,80008c74 <dhcp_set_state>
8000a088:	00e10693          	addi	a3,sp,14
8000a08c:	00400613          	li	a2,4
8000a090:	00040593          	mv	a1,s0
8000a094:	000a0513          	mv	a0,s4
8000a098:	c85fe0ef          	jal	ra,80008d1c <dhcp_create_msg>
8000a09c:	00050913          	mv	s2,a0
8000a0a0:	08050863          	beqz	a0,8000a130 <dhcp_arp_reply+0xf8>
8000a0a4:	00452483          	lw	s1,4(a0)
8000a0a8:	00e15783          	lhu	a5,14(sp)
8000a0ac:	03200693          	li	a3,50
8000a0b0:	0f048493          	addi	s1,s1,240
8000a0b4:	00f48733          	add	a4,s1,a5
8000a0b8:	00278993          	addi	s3,a5,2
8000a0bc:	00178793          	addi	a5,a5,1
8000a0c0:	01079793          	slli	a5,a5,0x10
8000a0c4:	0107d793          	srli	a5,a5,0x10
8000a0c8:	00d70023          	sb	a3,0(a4)
8000a0cc:	00f487b3          	add	a5,s1,a5
8000a0d0:	00400713          	li	a4,4
8000a0d4:	00e78023          	sb	a4,0(a5)
8000a0d8:	01c42503          	lw	a0,28(s0)
8000a0dc:	01099993          	slli	s3,s3,0x10
8000a0e0:	0109d993          	srli	s3,s3,0x10
8000a0e4:	01311723          	sh	s3,14(sp)
8000a0e8:	cf1fb0ef          	jal	ra,80005dd8 <lwip_htonl>
8000a0ec:	00050613          	mv	a2,a0
8000a0f0:	00048593          	mv	a1,s1
8000a0f4:	00098513          	mv	a0,s3
8000a0f8:	bc5fe0ef          	jal	ra,80008cbc <dhcp_option_long>
8000a0fc:	00090613          	mv	a2,s2
8000a100:	00048593          	mv	a1,s1
8000a104:	00a11723          	sh	a0,14(sp)
8000a108:	db9fe0ef          	jal	ra,80008ec0 <dhcp_option_trailer>
8000a10c:	8ec1a503          	lw	a0,-1812(gp) # 80003194 <dhcp_pcb>
8000a110:	84818793          	addi	a5,gp,-1976 # 800030f0 <ip_addr_any>
8000a114:	000a0713          	mv	a4,s4
8000a118:	04300693          	li	a3,67
8000a11c:	84418613          	addi	a2,gp,-1980 # 800030ec <ip_addr_broadcast>
8000a120:	00090593          	mv	a1,s2
8000a124:	e6cfe0ef          	jal	ra,80008790 <udp_sendto_if_src>
8000a128:	00090513          	mv	a0,s2
8000a12c:	eb9fc0ef          	jal	ra,80006fe4 <pbuf_free>
8000a130:	00644783          	lbu	a5,6(s0)
8000a134:	0ff00713          	li	a4,255
8000a138:	00e78663          	beq	a5,a4,8000a144 <dhcp_arp_reply+0x10c>
8000a13c:	00178793          	addi	a5,a5,1
8000a140:	00f40323          	sb	a5,6(s0)
8000a144:	01400793          	li	a5,20
8000a148:	00f41423          	sh	a5,8(s0)
8000a14c:	02c12083          	lw	ra,44(sp)
8000a150:	02812403          	lw	s0,40(sp)
8000a154:	02412483          	lw	s1,36(sp)
8000a158:	02012903          	lw	s2,32(sp)
8000a15c:	01c12983          	lw	s3,28(sp)
8000a160:	01812a03          	lw	s4,24(sp)
8000a164:	03010113          	addi	sp,sp,48
8000a168:	00008067          	ret
8000a16c:	00008067          	ret

8000a170 <dhcp_renew>:
8000a170:	fd010113          	addi	sp,sp,-48
8000a174:	02112623          	sw	ra,44(sp)
8000a178:	02812423          	sw	s0,40(sp)
8000a17c:	01312e23          	sw	s3,28(sp)
8000a180:	02912223          	sw	s1,36(sp)
8000a184:	03212023          	sw	s2,32(sp)
8000a188:	02852483          	lw	s1,40(a0)
8000a18c:	00050993          	mv	s3,a0
8000a190:	00500593          	li	a1,5
8000a194:	00048513          	mv	a0,s1
8000a198:	addfe0ef          	jal	ra,80008c74 <dhcp_set_state>
8000a19c:	00e10693          	addi	a3,sp,14
8000a1a0:	00300613          	li	a2,3
8000a1a4:	00048593          	mv	a1,s1
8000a1a8:	00098513          	mv	a0,s3
8000a1ac:	b71fe0ef          	jal	ra,80008d1c <dhcp_create_msg>
8000a1b0:	fff00413          	li	s0,-1
8000a1b4:	10050063          	beqz	a0,8000a2b4 <dhcp_renew+0x144>
8000a1b8:	00452403          	lw	s0,4(a0)
8000a1bc:	00e15783          	lhu	a5,14(sp)
8000a1c0:	00050913          	mv	s2,a0
8000a1c4:	0f040413          	addi	s0,s0,240
8000a1c8:	00f40733          	add	a4,s0,a5
8000a1cc:	00278513          	addi	a0,a5,2
8000a1d0:	00178793          	addi	a5,a5,1
8000a1d4:	01079793          	slli	a5,a5,0x10
8000a1d8:	03900693          	li	a3,57
8000a1dc:	0107d793          	srli	a5,a5,0x10
8000a1e0:	00d70023          	sb	a3,0(a4)
8000a1e4:	00f407b3          	add	a5,s0,a5
8000a1e8:	00200713          	li	a4,2
8000a1ec:	00e78023          	sb	a4,0(a5)
8000a1f0:	02c9d603          	lhu	a2,44(s3)
8000a1f4:	01051513          	slli	a0,a0,0x10
8000a1f8:	00040593          	mv	a1,s0
8000a1fc:	01055513          	srli	a0,a0,0x10
8000a200:	00a11723          	sh	a0,14(sp)
8000a204:	a89fe0ef          	jal	ra,80008c8c <dhcp_option_short>
8000a208:	00a40733          	add	a4,s0,a0
8000a20c:	03700693          	li	a3,55
8000a210:	00d70023          	sb	a3,0(a4)
8000a214:	00150713          	addi	a4,a0,1
8000a218:	01071713          	slli	a4,a4,0x10
8000a21c:	01075713          	srli	a4,a4,0x10
8000a220:	00e40733          	add	a4,s0,a4
8000a224:	00300613          	li	a2,3
8000a228:	00c70023          	sb	a2,0(a4)
8000a22c:	00250713          	addi	a4,a0,2
8000a230:	01071713          	slli	a4,a4,0x10
8000a234:	01075713          	srli	a4,a4,0x10
8000a238:	00e40733          	add	a4,s0,a4
8000a23c:	00100693          	li	a3,1
8000a240:	00d70023          	sb	a3,0(a4)
8000a244:	00050793          	mv	a5,a0
8000a248:	00350693          	addi	a3,a0,3
8000a24c:	01069693          	slli	a3,a3,0x10
8000a250:	00478793          	addi	a5,a5,4
8000a254:	0106d693          	srli	a3,a3,0x10
8000a258:	01079793          	slli	a5,a5,0x10
8000a25c:	00d406b3          	add	a3,s0,a3
8000a260:	00550513          	addi	a0,a0,5
8000a264:	0107d793          	srli	a5,a5,0x10
8000a268:	00c68023          	sb	a2,0(a3)
8000a26c:	00f407b3          	add	a5,s0,a5
8000a270:	01c00713          	li	a4,28
8000a274:	01051513          	slli	a0,a0,0x10
8000a278:	00e78023          	sb	a4,0(a5)
8000a27c:	01055513          	srli	a0,a0,0x10
8000a280:	00040593          	mv	a1,s0
8000a284:	00090613          	mv	a2,s2
8000a288:	00a11723          	sh	a0,14(sp)
8000a28c:	c35fe0ef          	jal	ra,80008ec0 <dhcp_option_trailer>
8000a290:	8ec1a503          	lw	a0,-1812(gp) # 80003194 <dhcp_pcb>
8000a294:	00098713          	mv	a4,s3
8000a298:	04300693          	li	a3,67
8000a29c:	01848613          	addi	a2,s1,24
8000a2a0:	00090593          	mv	a1,s2
8000a2a4:	ee0fe0ef          	jal	ra,80008984 <udp_sendto_if>
8000a2a8:	00050413          	mv	s0,a0
8000a2ac:	00090513          	mv	a0,s2
8000a2b0:	d35fc0ef          	jal	ra,80006fe4 <pbuf_free>
8000a2b4:	0064c783          	lbu	a5,6(s1)
8000a2b8:	0ff00713          	li	a4,255
8000a2bc:	00e78663          	beq	a5,a4,8000a2c8 <dhcp_renew+0x158>
8000a2c0:	00178793          	addi	a5,a5,1
8000a2c4:	00f48323          	sb	a5,6(s1)
8000a2c8:	0064c503          	lbu	a0,6(s1)
8000a2cc:	00900793          	li	a5,9
8000a2d0:	04a7e863          	bltu	a5,a0,8000a320 <dhcp_renew+0x1b0>
8000a2d4:	00551793          	slli	a5,a0,0x5
8000a2d8:	40a787b3          	sub	a5,a5,a0
8000a2dc:	00279793          	slli	a5,a5,0x2
8000a2e0:	00f50533          	add	a0,a0,a5
8000a2e4:	00451513          	slli	a0,a0,0x4
8000a2e8:	01051513          	slli	a0,a0,0x10
8000a2ec:	01055513          	srli	a0,a0,0x10
8000a2f0:	1f400593          	li	a1,500
8000a2f4:	1f350513          	addi	a0,a0,499
8000a2f8:	058030ef          	jal	ra,8000d350 <__divsi3>
8000a2fc:	00a49423          	sh	a0,8(s1)
8000a300:	02c12083          	lw	ra,44(sp)
8000a304:	00040513          	mv	a0,s0
8000a308:	02812403          	lw	s0,40(sp)
8000a30c:	02412483          	lw	s1,36(sp)
8000a310:	02012903          	lw	s2,32(sp)
8000a314:	01c12983          	lw	s3,28(sp)
8000a318:	03010113          	addi	sp,sp,48
8000a31c:	00008067          	ret
8000a320:	00005537          	lui	a0,0x5
8000a324:	e2050513          	addi	a0,a0,-480 # 4e20 <_stack_size+0x4620>
8000a328:	fc9ff06f          	j	8000a2f0 <dhcp_renew+0x180>

8000a32c <dhcp_supplied_address>:
8000a32c:	02050863          	beqz	a0,8000a35c <dhcp_supplied_address+0x30>
8000a330:	02852783          	lw	a5,40(a0)
8000a334:	00000513          	li	a0,0
8000a338:	02078463          	beqz	a5,8000a360 <dhcp_supplied_address+0x34>
8000a33c:	0057c783          	lbu	a5,5(a5)
8000a340:	00a00713          	li	a4,10
8000a344:	00100513          	li	a0,1
8000a348:	00e78663          	beq	a5,a4,8000a354 <dhcp_supplied_address+0x28>
8000a34c:	ffc78513          	addi	a0,a5,-4
8000a350:	00253513          	sltiu	a0,a0,2
8000a354:	0ff57513          	andi	a0,a0,255
8000a358:	00008067          	ret
8000a35c:	00000513          	li	a0,0
8000a360:	00008067          	ret

8000a364 <dhcp_release_and_stop>:
8000a364:	fd010113          	addi	sp,sp,-48
8000a368:	02112623          	sw	ra,44(sp)
8000a36c:	02812423          	sw	s0,40(sp)
8000a370:	02912223          	sw	s1,36(sp)
8000a374:	03212023          	sw	s2,32(sp)
8000a378:	01312e23          	sw	s3,28(sp)
8000a37c:	01412c23          	sw	s4,24(sp)
8000a380:	02852403          	lw	s0,40(a0)
8000a384:	10040e63          	beqz	s0,8000a4a0 <dhcp_release_and_stop+0x13c>
8000a388:	00544783          	lbu	a5,5(s0)
8000a38c:	10078a63          	beqz	a5,8000a4a0 <dhcp_release_and_stop+0x13c>
8000a390:	01842783          	lw	a5,24(s0)
8000a394:	00042e23          	sw	zero,28(s0)
8000a398:	00042c23          	sw	zero,24(s0)
8000a39c:	02042023          	sw	zero,32(s0)
8000a3a0:	02042223          	sw	zero,36(s0)
8000a3a4:	02042823          	sw	zero,48(s0)
8000a3a8:	02042623          	sw	zero,44(s0)
8000a3ac:	02042423          	sw	zero,40(s0)
8000a3b0:	00041723          	sh	zero,14(s0)
8000a3b4:	00042823          	sw	zero,16(s0)
8000a3b8:	00041a23          	sh	zero,20(s0)
8000a3bc:	00050493          	mv	s1,a0
8000a3c0:	00f12623          	sw	a5,12(sp)
8000a3c4:	f69ff0ef          	jal	ra,8000a32c <dhcp_supplied_address>
8000a3c8:	0a050463          	beqz	a0,8000a470 <dhcp_release_and_stop+0x10c>
8000a3cc:	00a10693          	addi	a3,sp,10
8000a3d0:	00700613          	li	a2,7
8000a3d4:	00040593          	mv	a1,s0
8000a3d8:	00048513          	mv	a0,s1
8000a3dc:	941fe0ef          	jal	ra,80008d1c <dhcp_create_msg>
8000a3e0:	00050993          	mv	s3,a0
8000a3e4:	08050663          	beqz	a0,8000a470 <dhcp_release_and_stop+0x10c>
8000a3e8:	00452903          	lw	s2,4(a0)
8000a3ec:	00a15783          	lhu	a5,10(sp)
8000a3f0:	03600693          	li	a3,54
8000a3f4:	0f090913          	addi	s2,s2,240
8000a3f8:	00f90733          	add	a4,s2,a5
8000a3fc:	00278a13          	addi	s4,a5,2
8000a400:	00178793          	addi	a5,a5,1
8000a404:	01079793          	slli	a5,a5,0x10
8000a408:	0107d793          	srli	a5,a5,0x10
8000a40c:	00d70023          	sb	a3,0(a4)
8000a410:	00f907b3          	add	a5,s2,a5
8000a414:	00400713          	li	a4,4
8000a418:	00e78023          	sb	a4,0(a5)
8000a41c:	00c12503          	lw	a0,12(sp)
8000a420:	010a1a13          	slli	s4,s4,0x10
8000a424:	010a5a13          	srli	s4,s4,0x10
8000a428:	01411523          	sh	s4,10(sp)
8000a42c:	9adfb0ef          	jal	ra,80005dd8 <lwip_htonl>
8000a430:	00050613          	mv	a2,a0
8000a434:	00090593          	mv	a1,s2
8000a438:	000a0513          	mv	a0,s4
8000a43c:	881fe0ef          	jal	ra,80008cbc <dhcp_option_long>
8000a440:	00098613          	mv	a2,s3
8000a444:	00090593          	mv	a1,s2
8000a448:	00a11523          	sh	a0,10(sp)
8000a44c:	a75fe0ef          	jal	ra,80008ec0 <dhcp_option_trailer>
8000a450:	8ec1a503          	lw	a0,-1812(gp) # 80003194 <dhcp_pcb>
8000a454:	00048713          	mv	a4,s1
8000a458:	04300693          	li	a3,67
8000a45c:	00c10613          	addi	a2,sp,12
8000a460:	00098593          	mv	a1,s3
8000a464:	d20fe0ef          	jal	ra,80008984 <udp_sendto_if>
8000a468:	00098513          	mv	a0,s3
8000a46c:	b79fc0ef          	jal	ra,80006fe4 <pbuf_free>
8000a470:	84818693          	addi	a3,gp,-1976 # 800030f0 <ip_addr_any>
8000a474:	84818613          	addi	a2,gp,-1976 # 800030f0 <ip_addr_any>
8000a478:	00048513          	mv	a0,s1
8000a47c:	84818593          	addi	a1,gp,-1976 # 800030f0 <ip_addr_any>
8000a480:	c2cfc0ef          	jal	ra,800068ac <netif_set_addr>
8000a484:	00000593          	li	a1,0
8000a488:	00040513          	mv	a0,s0
8000a48c:	fe8fe0ef          	jal	ra,80008c74 <dhcp_set_state>
8000a490:	00444783          	lbu	a5,4(s0)
8000a494:	00078663          	beqz	a5,8000a4a0 <dhcp_release_and_stop+0x13c>
8000a498:	c60ff0ef          	jal	ra,800098f8 <dhcp_dec_pcb_refcount>
8000a49c:	00040223          	sb	zero,4(s0)
8000a4a0:	02c12083          	lw	ra,44(sp)
8000a4a4:	02812403          	lw	s0,40(sp)
8000a4a8:	02412483          	lw	s1,36(sp)
8000a4ac:	02012903          	lw	s2,32(sp)
8000a4b0:	01c12983          	lw	s3,28(sp)
8000a4b4:	01812a03          	lw	s4,24(sp)
8000a4b8:	03010113          	addi	sp,sp,48
8000a4bc:	00008067          	ret

8000a4c0 <dhcp_start>:
8000a4c0:	ff010113          	addi	sp,sp,-16
8000a4c4:	00912223          	sw	s1,4(sp)
8000a4c8:	00112623          	sw	ra,12(sp)
8000a4cc:	00812423          	sw	s0,8(sp)
8000a4d0:	01212023          	sw	s2,0(sp)
8000a4d4:	ff000493          	li	s1,-16
8000a4d8:	08050263          	beqz	a0,8000a55c <dhcp_start+0x9c>
8000a4dc:	03554783          	lbu	a5,53(a0)
8000a4e0:	ff000493          	li	s1,-16
8000a4e4:	0017f793          	andi	a5,a5,1
8000a4e8:	06078a63          	beqz	a5,8000a55c <dhcp_start+0x9c>
8000a4ec:	02c55703          	lhu	a4,44(a0)
8000a4f0:	23f00793          	li	a5,575
8000a4f4:	02852903          	lw	s2,40(a0)
8000a4f8:	00e7e663          	bltu	a5,a4,8000a504 <dhcp_start+0x44>
8000a4fc:	fff00493          	li	s1,-1
8000a500:	05c0006f          	j	8000a55c <dhcp_start+0x9c>
8000a504:	00050413          	mv	s0,a0
8000a508:	06091863          	bnez	s2,8000a578 <dhcp_start+0xb8>
8000a50c:	03400513          	li	a0,52
8000a510:	8b0fc0ef          	jal	ra,800065c0 <lwip_malloc>
8000a514:	00050913          	mv	s2,a0
8000a518:	fe0502e3          	beqz	a0,8000a4fc <dhcp_start+0x3c>
8000a51c:	02a42423          	sw	a0,40(s0)
8000a520:	03400613          	li	a2,52
8000a524:	00000593          	li	a1,0
8000a528:	00090513          	mv	a0,s2
8000a52c:	71c020ef          	jal	ra,8000cc48 <memset>
8000a530:	a48ff0ef          	jal	ra,80009778 <dhcp_inc_pcb_refcount>
8000a534:	00050493          	mv	s1,a0
8000a538:	fc0512e3          	bnez	a0,8000a4fc <dhcp_start+0x3c>
8000a53c:	00100793          	li	a5,1
8000a540:	00f90223          	sb	a5,4(s2)
8000a544:	03544783          	lbu	a5,53(s0)
8000a548:	0047f793          	andi	a5,a5,4
8000a54c:	02079e63          	bnez	a5,8000a588 <dhcp_start+0xc8>
8000a550:	00200593          	li	a1,2
8000a554:	00090513          	mv	a0,s2
8000a558:	f1cfe0ef          	jal	ra,80008c74 <dhcp_set_state>
8000a55c:	00c12083          	lw	ra,12(sp)
8000a560:	00812403          	lw	s0,8(sp)
8000a564:	00048513          	mv	a0,s1
8000a568:	00012903          	lw	s2,0(sp)
8000a56c:	00412483          	lw	s1,4(sp)
8000a570:	01010113          	addi	sp,sp,16
8000a574:	00008067          	ret
8000a578:	00494783          	lbu	a5,4(s2)
8000a57c:	fa0782e3          	beqz	a5,8000a520 <dhcp_start+0x60>
8000a580:	b78ff0ef          	jal	ra,800098f8 <dhcp_dec_pcb_refcount>
8000a584:	f9dff06f          	j	8000a520 <dhcp_start+0x60>
8000a588:	00040513          	mv	a0,s0
8000a58c:	e11fe0ef          	jal	ra,8000939c <dhcp_discover>
8000a590:	00050493          	mv	s1,a0
8000a594:	fc0504e3          	beqz	a0,8000a55c <dhcp_start+0x9c>
8000a598:	00040513          	mv	a0,s0
8000a59c:	dc9ff0ef          	jal	ra,8000a364 <dhcp_release_and_stop>
8000a5a0:	f5dff06f          	j	8000a4fc <dhcp_start+0x3c>

8000a5a4 <dhcp_coarse_tmr>:
8000a5a4:	fc010113          	addi	sp,sp,-64
8000a5a8:	02812c23          	sw	s0,56(sp)
8000a5ac:	8d41a403          	lw	s0,-1836(gp) # 8000317c <netif_list>
8000a5b0:	03312623          	sw	s3,44(sp)
8000a5b4:	000029b7          	lui	s3,0x2
8000a5b8:	03212823          	sw	s2,48(sp)
8000a5bc:	03412423          	sw	s4,40(sp)
8000a5c0:	03512223          	sw	s5,36(sp)
8000a5c4:	03612023          	sw	s6,32(sp)
8000a5c8:	01712e23          	sw	s7,28(sp)
8000a5cc:	02112e23          	sw	ra,60(sp)
8000a5d0:	02912a23          	sw	s1,52(sp)
8000a5d4:	01812c23          	sw	s8,24(sp)
8000a5d8:	01912a23          	sw	s9,20(sp)
8000a5dc:	00100913          	li	s2,1
8000a5e0:	00a00a13          	li	s4,10
8000a5e4:	43200a93          	li	s5,1074
8000a5e8:	71098993          	addi	s3,s3,1808 # 2710 <_stack_size+0x1f10>
8000a5ec:	02041c63          	bnez	s0,8000a624 <dhcp_coarse_tmr+0x80>
8000a5f0:	03c12083          	lw	ra,60(sp)
8000a5f4:	03812403          	lw	s0,56(sp)
8000a5f8:	03412483          	lw	s1,52(sp)
8000a5fc:	03012903          	lw	s2,48(sp)
8000a600:	02c12983          	lw	s3,44(sp)
8000a604:	02812a03          	lw	s4,40(sp)
8000a608:	02412a83          	lw	s5,36(sp)
8000a60c:	02012b03          	lw	s6,32(sp)
8000a610:	01c12b83          	lw	s7,28(sp)
8000a614:	01812c03          	lw	s8,24(sp)
8000a618:	01412c83          	lw	s9,20(sp)
8000a61c:	04010113          	addi	sp,sp,64
8000a620:	00008067          	ret
8000a624:	02842783          	lw	a5,40(s0)
8000a628:	02078e63          	beqz	a5,8000a664 <dhcp_coarse_tmr+0xc0>
8000a62c:	0057c703          	lbu	a4,5(a5)
8000a630:	02070a63          	beqz	a4,8000a664 <dhcp_coarse_tmr+0xc0>
8000a634:	0147d683          	lhu	a3,20(a5)
8000a638:	02068a63          	beqz	a3,8000a66c <dhcp_coarse_tmr+0xc8>
8000a63c:	0127d703          	lhu	a4,18(a5)
8000a640:	00170713          	addi	a4,a4,1
8000a644:	01071713          	slli	a4,a4,0x10
8000a648:	01075713          	srli	a4,a4,0x10
8000a64c:	00e79923          	sh	a4,18(a5)
8000a650:	00e69e63          	bne	a3,a4,8000a66c <dhcp_coarse_tmr+0xc8>
8000a654:	00040513          	mv	a0,s0
8000a658:	d0dff0ef          	jal	ra,8000a364 <dhcp_release_and_stop>
8000a65c:	00040513          	mv	a0,s0
8000a660:	e61ff0ef          	jal	ra,8000a4c0 <dhcp_start>
8000a664:	00042403          	lw	s0,0(s0)
8000a668:	f85ff06f          	j	8000a5ec <dhcp_coarse_tmr+0x48>
8000a66c:	0107d703          	lhu	a4,16(a5)
8000a670:	1a070663          	beqz	a4,8000a81c <dhcp_coarse_tmr+0x278>
8000a674:	fff70693          	addi	a3,a4,-1
8000a678:	00d79823          	sh	a3,16(a5)
8000a67c:	1b271063          	bne	a4,s2,8000a81c <dhcp_coarse_tmr+0x278>
8000a680:	02842c03          	lw	s8,40(s0)
8000a684:	005c4783          	lbu	a5,5(s8)
8000a688:	fcfa6ee3          	bltu	s4,a5,8000a664 <dhcp_coarse_tmr+0xc0>
8000a68c:	00fad7b3          	srl	a5,s5,a5
8000a690:	0017f793          	andi	a5,a5,1
8000a694:	fc0788e3          	beqz	a5,8000a664 <dhcp_coarse_tmr+0xc0>
8000a698:	00400593          	li	a1,4
8000a69c:	000c0513          	mv	a0,s8
8000a6a0:	dd4fe0ef          	jal	ra,80008c74 <dhcp_set_state>
8000a6a4:	00e10693          	addi	a3,sp,14
8000a6a8:	00300613          	li	a2,3
8000a6ac:	000c0593          	mv	a1,s8
8000a6b0:	00040513          	mv	a0,s0
8000a6b4:	e68fe0ef          	jal	ra,80008d1c <dhcp_create_msg>
8000a6b8:	00050c93          	mv	s9,a0
8000a6bc:	0e050a63          	beqz	a0,8000a7b0 <dhcp_coarse_tmr+0x20c>
8000a6c0:	00452483          	lw	s1,4(a0)
8000a6c4:	00e15783          	lhu	a5,14(sp)
8000a6c8:	03900693          	li	a3,57
8000a6cc:	0f048493          	addi	s1,s1,240
8000a6d0:	00f48733          	add	a4,s1,a5
8000a6d4:	00278513          	addi	a0,a5,2
8000a6d8:	00178793          	addi	a5,a5,1
8000a6dc:	01079793          	slli	a5,a5,0x10
8000a6e0:	0107d793          	srli	a5,a5,0x10
8000a6e4:	00d70023          	sb	a3,0(a4)
8000a6e8:	00f487b3          	add	a5,s1,a5
8000a6ec:	00200713          	li	a4,2
8000a6f0:	00e78023          	sb	a4,0(a5)
8000a6f4:	02c45603          	lhu	a2,44(s0)
8000a6f8:	01051513          	slli	a0,a0,0x10
8000a6fc:	01055513          	srli	a0,a0,0x10
8000a700:	00048593          	mv	a1,s1
8000a704:	00a11723          	sh	a0,14(sp)
8000a708:	d84fe0ef          	jal	ra,80008c8c <dhcp_option_short>
8000a70c:	00a48733          	add	a4,s1,a0
8000a710:	03700693          	li	a3,55
8000a714:	00d70023          	sb	a3,0(a4)
8000a718:	00150713          	addi	a4,a0,1
8000a71c:	01071713          	slli	a4,a4,0x10
8000a720:	01075713          	srli	a4,a4,0x10
8000a724:	00300693          	li	a3,3
8000a728:	00e48733          	add	a4,s1,a4
8000a72c:	00d70023          	sb	a3,0(a4)
8000a730:	00250713          	addi	a4,a0,2
8000a734:	01071713          	slli	a4,a4,0x10
8000a738:	01075713          	srli	a4,a4,0x10
8000a73c:	00e48733          	add	a4,s1,a4
8000a740:	01270023          	sb	s2,0(a4)
8000a744:	00050793          	mv	a5,a0
8000a748:	00350713          	addi	a4,a0,3
8000a74c:	01071713          	slli	a4,a4,0x10
8000a750:	00478793          	addi	a5,a5,4
8000a754:	01075713          	srli	a4,a4,0x10
8000a758:	01079793          	slli	a5,a5,0x10
8000a75c:	00e48733          	add	a4,s1,a4
8000a760:	00550513          	addi	a0,a0,5
8000a764:	0107d793          	srli	a5,a5,0x10
8000a768:	00d70023          	sb	a3,0(a4)
8000a76c:	00f487b3          	add	a5,s1,a5
8000a770:	01c00713          	li	a4,28
8000a774:	01051513          	slli	a0,a0,0x10
8000a778:	00e78023          	sb	a4,0(a5)
8000a77c:	01055513          	srli	a0,a0,0x10
8000a780:	000c8613          	mv	a2,s9
8000a784:	00048593          	mv	a1,s1
8000a788:	00a11723          	sh	a0,14(sp)
8000a78c:	f34fe0ef          	jal	ra,80008ec0 <dhcp_option_trailer>
8000a790:	8ec1a503          	lw	a0,-1812(gp) # 80003194 <dhcp_pcb>
8000a794:	00040713          	mv	a4,s0
8000a798:	04300693          	li	a3,67
8000a79c:	84418613          	addi	a2,gp,-1980 # 800030ec <ip_addr_broadcast>
8000a7a0:	000c8593          	mv	a1,s9
8000a7a4:	9e0fe0ef          	jal	ra,80008984 <udp_sendto_if>
8000a7a8:	000c8513          	mv	a0,s9
8000a7ac:	839fc0ef          	jal	ra,80006fe4 <pbuf_free>
8000a7b0:	006c4783          	lbu	a5,6(s8)
8000a7b4:	0ff00713          	li	a4,255
8000a7b8:	00e78663          	beq	a5,a4,8000a7c4 <dhcp_coarse_tmr+0x220>
8000a7bc:	00178793          	addi	a5,a5,1
8000a7c0:	00fc0323          	sb	a5,6(s8)
8000a7c4:	006c4783          	lbu	a5,6(s8)
8000a7c8:	00900713          	li	a4,9
8000a7cc:	00098513          	mv	a0,s3
8000a7d0:	02f76063          	bltu	a4,a5,8000a7f0 <dhcp_coarse_tmr+0x24c>
8000a7d4:	00579513          	slli	a0,a5,0x5
8000a7d8:	40f50533          	sub	a0,a0,a5
8000a7dc:	00251513          	slli	a0,a0,0x2
8000a7e0:	00a787b3          	add	a5,a5,a0
8000a7e4:	00379793          	slli	a5,a5,0x3
8000a7e8:	01079513          	slli	a0,a5,0x10
8000a7ec:	01055513          	srli	a0,a0,0x10
8000a7f0:	1f400593          	li	a1,500
8000a7f4:	1f350513          	addi	a0,a0,499
8000a7f8:	359020ef          	jal	ra,8000d350 <__divsi3>
8000a7fc:	014c5783          	lhu	a5,20(s8)
8000a800:	012c5703          	lhu	a4,18(s8)
8000a804:	00ac1423          	sh	a0,8(s8)
8000a808:	40e787b3          	sub	a5,a5,a4
8000a80c:	e4f95ce3          	bge	s2,a5,8000a664 <dhcp_coarse_tmr+0xc0>
8000a810:	4017d793          	srai	a5,a5,0x1
8000a814:	00fc1823          	sh	a5,16(s8)
8000a818:	e4dff06f          	j	8000a664 <dhcp_coarse_tmr+0xc0>
8000a81c:	00e7d703          	lhu	a4,14(a5)
8000a820:	e40702e3          	beqz	a4,8000a664 <dhcp_coarse_tmr+0xc0>
8000a824:	fff70693          	addi	a3,a4,-1
8000a828:	00d79723          	sh	a3,14(a5)
8000a82c:	e3271ce3          	bne	a4,s2,8000a664 <dhcp_coarse_tmr+0xc0>
8000a830:	02842483          	lw	s1,40(s0)
8000a834:	0054c783          	lbu	a5,5(s1)
8000a838:	0fb7f713          	andi	a4,a5,251
8000a83c:	01270463          	beq	a4,s2,8000a844 <dhcp_coarse_tmr+0x2a0>
8000a840:	e34792e3          	bne	a5,s4,8000a664 <dhcp_coarse_tmr+0xc0>
8000a844:	00040513          	mv	a0,s0
8000a848:	929ff0ef          	jal	ra,8000a170 <dhcp_renew>
8000a84c:	00c4d783          	lhu	a5,12(s1)
8000a850:	0124d703          	lhu	a4,18(s1)
8000a854:	40e787b3          	sub	a5,a5,a4
8000a858:	e0f956e3          	bge	s2,a5,8000a664 <dhcp_coarse_tmr+0xc0>
8000a85c:	4017d793          	srai	a5,a5,0x1
8000a860:	00f49723          	sh	a5,14(s1)
8000a864:	e01ff06f          	j	8000a664 <dhcp_coarse_tmr+0xc0>

8000a868 <dhcp_fine_tmr>:
8000a868:	fe010113          	addi	sp,sp,-32
8000a86c:	00812c23          	sw	s0,24(sp)
8000a870:	8d41a403          	lw	s0,-1836(gp) # 8000317c <netif_list>
8000a874:	00912a23          	sw	s1,20(sp)
8000a878:	01212823          	sw	s2,16(sp)
8000a87c:	01312623          	sw	s3,12(sp)
8000a880:	01412423          	sw	s4,8(sp)
8000a884:	01512223          	sw	s5,4(sp)
8000a888:	01612023          	sw	s6,0(sp)
8000a88c:	00112e23          	sw	ra,28(sp)
8000a890:	00100493          	li	s1,1
8000a894:	00c00913          	li	s2,12
8000a898:	00600993          	li	s3,6
8000a89c:	00800a13          	li	s4,8
8000a8a0:	00300a93          	li	s5,3
8000a8a4:	00500b13          	li	s6,5
8000a8a8:	02041663          	bnez	s0,8000a8d4 <dhcp_fine_tmr+0x6c>
8000a8ac:	01c12083          	lw	ra,28(sp)
8000a8b0:	01812403          	lw	s0,24(sp)
8000a8b4:	01412483          	lw	s1,20(sp)
8000a8b8:	01012903          	lw	s2,16(sp)
8000a8bc:	00c12983          	lw	s3,12(sp)
8000a8c0:	00812a03          	lw	s4,8(sp)
8000a8c4:	00412a83          	lw	s5,4(sp)
8000a8c8:	00012b03          	lw	s6,0(sp)
8000a8cc:	02010113          	addi	sp,sp,32
8000a8d0:	00008067          	ret
8000a8d4:	02842703          	lw	a4,40(s0)
8000a8d8:	00070a63          	beqz	a4,8000a8ec <dhcp_fine_tmr+0x84>
8000a8dc:	00875783          	lhu	a5,8(a4)
8000a8e0:	00f4fa63          	bgeu	s1,a5,8000a8f4 <dhcp_fine_tmr+0x8c>
8000a8e4:	fff78793          	addi	a5,a5,-1
8000a8e8:	00f71423          	sh	a5,8(a4)
8000a8ec:	00042403          	lw	s0,0(s0)
8000a8f0:	fb9ff06f          	j	8000a8a8 <dhcp_fine_tmr+0x40>
8000a8f4:	fe979ce3          	bne	a5,s1,8000a8ec <dhcp_fine_tmr+0x84>
8000a8f8:	00071423          	sh	zero,8(a4)
8000a8fc:	02842703          	lw	a4,40(s0)
8000a900:	00574783          	lbu	a5,5(a4)
8000a904:	01278463          	beq	a5,s2,8000a90c <dhcp_fine_tmr+0xa4>
8000a908:	01379863          	bne	a5,s3,8000a918 <dhcp_fine_tmr+0xb0>
8000a90c:	00040513          	mv	a0,s0
8000a910:	a8dfe0ef          	jal	ra,8000939c <dhcp_discover>
8000a914:	fd9ff06f          	j	8000a8ec <dhcp_fine_tmr+0x84>
8000a918:	02979463          	bne	a5,s1,8000a940 <dhcp_fine_tmr+0xd8>
8000a91c:	00674783          	lbu	a5,6(a4)
8000a920:	00040513          	mv	a0,s0
8000a924:	00fb6663          	bltu	s6,a5,8000a930 <dhcp_fine_tmr+0xc8>
8000a928:	ff8fe0ef          	jal	ra,80009120 <dhcp_select>
8000a92c:	fc1ff06f          	j	8000a8ec <dhcp_fine_tmr+0x84>
8000a930:	a35ff0ef          	jal	ra,8000a364 <dhcp_release_and_stop>
8000a934:	00040513          	mv	a0,s0
8000a938:	b89ff0ef          	jal	ra,8000a4c0 <dhcp_start>
8000a93c:	fb1ff06f          	j	8000a8ec <dhcp_fine_tmr+0x84>
8000a940:	03479063          	bne	a5,s4,8000a960 <dhcp_fine_tmr+0xf8>
8000a944:	00674783          	lbu	a5,6(a4)
8000a948:	00040513          	mv	a0,s0
8000a94c:	00f4e663          	bltu	s1,a5,8000a958 <dhcp_fine_tmr+0xf0>
8000a950:	c11fe0ef          	jal	ra,80009560 <dhcp_check>
8000a954:	f99ff06f          	j	8000a8ec <dhcp_fine_tmr+0x84>
8000a958:	c6dfe0ef          	jal	ra,800095c4 <dhcp_bind>
8000a95c:	f91ff06f          	j	8000a8ec <dhcp_fine_tmr+0x84>
8000a960:	f95796e3          	bne	a5,s5,8000a8ec <dhcp_fine_tmr+0x84>
8000a964:	00674783          	lbu	a5,6(a4)
8000a968:	00040513          	mv	a0,s0
8000a96c:	faf4e2e3          	bltu	s1,a5,8000a910 <dhcp_fine_tmr+0xa8>
8000a970:	da0fe0ef          	jal	ra,80008f10 <dhcp_reboot>
8000a974:	f79ff06f          	j	8000a8ec <dhcp_fine_tmr+0x84>

8000a978 <dhcp_release>:
8000a978:	ff010113          	addi	sp,sp,-16
8000a97c:	00112623          	sw	ra,12(sp)
8000a980:	9e5ff0ef          	jal	ra,8000a364 <dhcp_release_and_stop>
8000a984:	00c12083          	lw	ra,12(sp)
8000a988:	00000513          	li	a0,0
8000a98c:	01010113          	addi	sp,sp,16
8000a990:	00008067          	ret

8000a994 <dhcp_stop>:
8000a994:	9d1ff06f          	j	8000a364 <dhcp_release_and_stop>

8000a998 <etharp_free_entry>:
8000a998:	fe010113          	addi	sp,sp,-32
8000a99c:	00912a23          	sw	s1,20(sp)
8000a9a0:	00151493          	slli	s1,a0,0x1
8000a9a4:	00a48733          	add	a4,s1,a0
8000a9a8:	01212823          	sw	s2,16(sp)
8000a9ac:	00371713          	slli	a4,a4,0x3
8000a9b0:	b4c18913          	addi	s2,gp,-1204 # 800033f4 <arp_table>
8000a9b4:	00812c23          	sw	s0,24(sp)
8000a9b8:	01312623          	sw	s3,12(sp)
8000a9bc:	00112e23          	sw	ra,28(sp)
8000a9c0:	00e90933          	add	s2,s2,a4
8000a9c4:	00050993          	mv	s3,a0
8000a9c8:	00092503          	lw	a0,0(s2)
8000a9cc:	b4c18413          	addi	s0,gp,-1204 # 800033f4 <arp_table>
8000a9d0:	00050663          	beqz	a0,8000a9dc <etharp_free_entry+0x44>
8000a9d4:	e10fc0ef          	jal	ra,80006fe4 <pbuf_free>
8000a9d8:	00092023          	sw	zero,0(s2)
8000a9dc:	01348533          	add	a0,s1,s3
8000a9e0:	00351513          	slli	a0,a0,0x3
8000a9e4:	00a40533          	add	a0,s0,a0
8000a9e8:	00050a23          	sb	zero,20(a0)
8000a9ec:	00051923          	sh	zero,18(a0)
8000a9f0:	00052423          	sw	zero,8(a0)
8000a9f4:	00052223          	sw	zero,4(a0)
8000a9f8:	00600613          	li	a2,6
8000a9fc:	84c18593          	addi	a1,gp,-1972 # 800030f4 <ethzero>
8000aa00:	00c50513          	addi	a0,a0,12
8000aa04:	7d0030ef          	jal	ra,8000e1d4 <memcpy>
8000aa08:	01c12083          	lw	ra,28(sp)
8000aa0c:	01812403          	lw	s0,24(sp)
8000aa10:	01412483          	lw	s1,20(sp)
8000aa14:	01012903          	lw	s2,16(sp)
8000aa18:	00c12983          	lw	s3,12(sp)
8000aa1c:	02010113          	addi	sp,sp,32
8000aa20:	00008067          	ret

8000aa24 <etharp_find_entry>:
8000aa24:	fe010113          	addi	sp,sp,-32
8000aa28:	00812c23          	sw	s0,24(sp)
8000aa2c:	00912a23          	sw	s1,20(sp)
8000aa30:	b4c18693          	addi	a3,gp,-1204 # 800033f4 <arp_table>
8000aa34:	00112e23          	sw	ra,28(sp)
8000aa38:	01212823          	sw	s2,16(sp)
8000aa3c:	01312623          	sw	s3,12(sp)
8000aa40:	00000293          	li	t0,0
8000aa44:	00000f93          	li	t6,0
8000aa48:	00000f13          	li	t5,0
8000aa4c:	00a00313          	li	t1,10
8000aa50:	00000793          	li	a5,0
8000aa54:	00a00713          	li	a4,10
8000aa58:	00a00893          	li	a7,10
8000aa5c:	00a00493          	li	s1,10
8000aa60:	b4c18413          	addi	s0,gp,-1204 # 800033f4 <arp_table>
8000aa64:	00a00e13          	li	t3,10
8000aa68:	00100393          	li	t2,1
8000aa6c:	0146ce83          	lbu	t4,20(a3)
8000aa70:	05c71263          	bne	a4,t3,8000aab4 <etharp_find_entry+0x90>
8000aa74:	100e8463          	beqz	t4,8000ab7c <etharp_find_entry+0x158>
8000aa78:	00050e63          	beqz	a0,8000aa94 <etharp_find_entry+0x70>
8000aa7c:	00052903          	lw	s2,0(a0)
8000aa80:	0046a803          	lw	a6,4(a3)
8000aa84:	01091863          	bne	s2,a6,8000aa94 <etharp_find_entry+0x70>
8000aa88:	0a060a63          	beqz	a2,8000ab3c <etharp_find_entry+0x118>
8000aa8c:	0086a803          	lw	a6,8(a3)
8000aa90:	0ac80663          	beq	a6,a2,8000ab3c <etharp_find_entry+0x118>
8000aa94:	0126d803          	lhu	a6,18(a3)
8000aa98:	0c7e9a63          	bne	t4,t2,8000ab6c <etharp_find_entry+0x148>
8000aa9c:	0006ae83          	lw	t4,0(a3)
8000aaa0:	0a0e8e63          	beqz	t4,8000ab5c <etharp_find_entry+0x138>
8000aaa4:	01e86a63          	bltu	a6,t5,8000aab8 <etharp_find_entry+0x94>
8000aaa8:	00080f13          	mv	t5,a6
8000aaac:	00078313          	mv	t1,a5
8000aab0:	0080006f          	j	8000aab8 <etharp_find_entry+0x94>
8000aab4:	fc0e92e3          	bnez	t4,8000aa78 <etharp_find_entry+0x54>
8000aab8:	00178793          	addi	a5,a5,1
8000aabc:	01079813          	slli	a6,a5,0x10
8000aac0:	01085813          	srli	a6,a6,0x10
8000aac4:	01081793          	slli	a5,a6,0x10
8000aac8:	01868693          	addi	a3,a3,24
8000aacc:	4107d793          	srai	a5,a5,0x10
8000aad0:	f9c81ee3          	bne	a6,t3,8000aa6c <etharp_find_entry+0x48>
8000aad4:	00100693          	li	a3,1
8000aad8:	fff00793          	li	a5,-1
8000aadc:	06d59063          	bne	a1,a3,8000ab3c <etharp_find_entry+0x118>
8000aae0:	00060993          	mv	s3,a2
8000aae4:	00050913          	mv	s2,a0
8000aae8:	03c71063          	bne	a4,t3,8000ab08 <etharp_find_entry+0xe4>
8000aaec:	08e89c63          	bne	a7,a4,8000ab84 <etharp_find_entry+0x160>
8000aaf0:	01149663          	bne	s1,a7,8000aafc <etharp_find_entry+0xd8>
8000aaf4:	04930463          	beq	t1,s1,8000ab3c <etharp_find_entry+0x118>
8000aaf8:	00030493          	mv	s1,t1
8000aafc:	00048513          	mv	a0,s1
8000ab00:	e99ff0ef          	jal	ra,8000a998 <etharp_free_entry>
8000ab04:	00048713          	mv	a4,s1
8000ab08:	00171793          	slli	a5,a4,0x1
8000ab0c:	00090c63          	beqz	s2,8000ab24 <etharp_find_entry+0x100>
8000ab10:	00092603          	lw	a2,0(s2)
8000ab14:	00e786b3          	add	a3,a5,a4
8000ab18:	00369693          	slli	a3,a3,0x3
8000ab1c:	00d406b3          	add	a3,s0,a3
8000ab20:	00c6a223          	sw	a2,4(a3)
8000ab24:	00e787b3          	add	a5,a5,a4
8000ab28:	00379793          	slli	a5,a5,0x3
8000ab2c:	00f407b3          	add	a5,s0,a5
8000ab30:	00079923          	sh	zero,18(a5)
8000ab34:	0137a423          	sw	s3,8(a5)
8000ab38:	00070793          	mv	a5,a4
8000ab3c:	01c12083          	lw	ra,28(sp)
8000ab40:	01812403          	lw	s0,24(sp)
8000ab44:	01412483          	lw	s1,20(sp)
8000ab48:	01012903          	lw	s2,16(sp)
8000ab4c:	00c12983          	lw	s3,12(sp)
8000ab50:	00078513          	mv	a0,a5
8000ab54:	02010113          	addi	sp,sp,32
8000ab58:	00008067          	ret
8000ab5c:	f5f86ee3          	bltu	a6,t6,8000aab8 <etharp_find_entry+0x94>
8000ab60:	00080f93          	mv	t6,a6
8000ab64:	00078493          	mv	s1,a5
8000ab68:	f51ff06f          	j	8000aab8 <etharp_find_entry+0x94>
8000ab6c:	f45866e3          	bltu	a6,t0,8000aab8 <etharp_find_entry+0x94>
8000ab70:	00080293          	mv	t0,a6
8000ab74:	00078893          	mv	a7,a5
8000ab78:	f41ff06f          	j	8000aab8 <etharp_find_entry+0x94>
8000ab7c:	00078713          	mv	a4,a5
8000ab80:	f39ff06f          	j	8000aab8 <etharp_find_entry+0x94>
8000ab84:	00088493          	mv	s1,a7
8000ab88:	f75ff06f          	j	8000aafc <etharp_find_entry+0xd8>

8000ab8c <etharp_raw>:
8000ab8c:	fc010113          	addi	sp,sp,-64
8000ab90:	03312623          	sw	s3,44(sp)
8000ab94:	03412423          	sw	s4,40(sp)
8000ab98:	03512223          	sw	s5,36(sp)
8000ab9c:	00050993          	mv	s3,a0
8000aba0:	00058a13          	mv	s4,a1
8000aba4:	00060a93          	mv	s5,a2
8000aba8:	01c00593          	li	a1,28
8000abac:	28000613          	li	a2,640
8000abb0:	01000513          	li	a0,16
8000abb4:	02912a23          	sw	s1,52(sp)
8000abb8:	03612023          	sw	s6,32(sp)
8000abbc:	01712e23          	sw	s7,28(sp)
8000abc0:	01812c23          	sw	s8,24(sp)
8000abc4:	01912a23          	sw	s9,20(sp)
8000abc8:	01112623          	sw	a7,12(sp)
8000abcc:	02112e23          	sw	ra,60(sp)
8000abd0:	02812c23          	sw	s0,56(sp)
8000abd4:	03212823          	sw	s2,48(sp)
8000abd8:	00068c93          	mv	s9,a3
8000abdc:	00070b93          	mv	s7,a4
8000abe0:	00078c13          	mv	s8,a5
8000abe4:	00080b13          	mv	s6,a6
8000abe8:	cd0fc0ef          	jal	ra,800070b8 <pbuf_alloc>
8000abec:	a0c18493          	addi	s1,gp,-1524 # 800032b4 <lwip_stats>
8000abf0:	00c12883          	lw	a7,12(sp)
8000abf4:	04051463          	bnez	a0,8000ac3c <etharp_raw+0xb0>
8000abf8:	0484a783          	lw	a5,72(s1)
8000abfc:	fff00513          	li	a0,-1
8000ac00:	00178793          	addi	a5,a5,1
8000ac04:	04f4a423          	sw	a5,72(s1)
8000ac08:	03c12083          	lw	ra,60(sp)
8000ac0c:	03812403          	lw	s0,56(sp)
8000ac10:	03412483          	lw	s1,52(sp)
8000ac14:	03012903          	lw	s2,48(sp)
8000ac18:	02c12983          	lw	s3,44(sp)
8000ac1c:	02812a03          	lw	s4,40(sp)
8000ac20:	02412a83          	lw	s5,36(sp)
8000ac24:	02012b03          	lw	s6,32(sp)
8000ac28:	01c12b83          	lw	s7,28(sp)
8000ac2c:	01812c03          	lw	s8,24(sp)
8000ac30:	01412c83          	lw	s9,20(sp)
8000ac34:	04010113          	addi	sp,sp,64
8000ac38:	00008067          	ret
8000ac3c:	00452403          	lw	s0,4(a0)
8000ac40:	00050913          	mv	s2,a0
8000ac44:	00088513          	mv	a0,a7
8000ac48:	978fb0ef          	jal	ra,80005dc0 <lwip_htons>
8000ac4c:	00a40323          	sb	a0,6(s0)
8000ac50:	00855513          	srli	a0,a0,0x8
8000ac54:	00a403a3          	sb	a0,7(s0)
8000ac58:	00600613          	li	a2,6
8000ac5c:	000c8593          	mv	a1,s9
8000ac60:	00840513          	addi	a0,s0,8
8000ac64:	570030ef          	jal	ra,8000e1d4 <memcpy>
8000ac68:	00600613          	li	a2,6
8000ac6c:	000c0593          	mv	a1,s8
8000ac70:	01240513          	addi	a0,s0,18
8000ac74:	560030ef          	jal	ra,8000e1d4 <memcpy>
8000ac78:	00400613          	li	a2,4
8000ac7c:	000b8593          	mv	a1,s7
8000ac80:	00e40513          	addi	a0,s0,14
8000ac84:	550030ef          	jal	ra,8000e1d4 <memcpy>
8000ac88:	00400613          	li	a2,4
8000ac8c:	000b0593          	mv	a1,s6
8000ac90:	01840513          	addi	a0,s0,24
8000ac94:	540030ef          	jal	ra,8000e1d4 <memcpy>
8000ac98:	00100793          	li	a5,1
8000ac9c:	00f400a3          	sb	a5,1(s0)
8000aca0:	00800793          	li	a5,8
8000aca4:	00f40123          	sb	a5,2(s0)
8000aca8:	00600793          	li	a5,6
8000acac:	00f40223          	sb	a5,4(s0)
8000acb0:	00001737          	lui	a4,0x1
8000acb4:	00400793          	li	a5,4
8000acb8:	00f402a3          	sb	a5,5(s0)
8000acbc:	80670713          	addi	a4,a4,-2042 # 806 <_stack_size+0x6>
8000acc0:	000a8693          	mv	a3,s5
8000acc4:	000a0613          	mv	a2,s4
8000acc8:	00090593          	mv	a1,s2
8000accc:	00040023          	sb	zero,0(s0)
8000acd0:	000401a3          	sb	zero,3(s0)
8000acd4:	00098513          	mv	a0,s3
8000acd8:	695010ef          	jal	ra,8000cb6c <ethernet_output>
8000acdc:	0304a783          	lw	a5,48(s1)
8000ace0:	00090513          	mv	a0,s2
8000ace4:	00178793          	addi	a5,a5,1
8000ace8:	02f4a823          	sw	a5,48(s1)
8000acec:	af8fc0ef          	jal	ra,80006fe4 <pbuf_free>
8000acf0:	00000513          	li	a0,0
8000acf4:	f15ff06f          	j	8000ac08 <etharp_raw+0x7c>

8000acf8 <etharp_cleanup_netif>:
8000acf8:	fe010113          	addi	sp,sp,-32
8000acfc:	00812c23          	sw	s0,24(sp)
8000ad00:	00912a23          	sw	s1,20(sp)
8000ad04:	01212823          	sw	s2,16(sp)
8000ad08:	01312623          	sw	s3,12(sp)
8000ad0c:	00112e23          	sw	ra,28(sp)
8000ad10:	00050993          	mv	s3,a0
8000ad14:	b4c18413          	addi	s0,gp,-1204 # 800033f4 <arp_table>
8000ad18:	00000493          	li	s1,0
8000ad1c:	00a00913          	li	s2,10
8000ad20:	01444783          	lbu	a5,20(s0)
8000ad24:	00078a63          	beqz	a5,8000ad38 <etharp_cleanup_netif+0x40>
8000ad28:	00842783          	lw	a5,8(s0)
8000ad2c:	01379663          	bne	a5,s3,8000ad38 <etharp_cleanup_netif+0x40>
8000ad30:	00048513          	mv	a0,s1
8000ad34:	c65ff0ef          	jal	ra,8000a998 <etharp_free_entry>
8000ad38:	00148493          	addi	s1,s1,1
8000ad3c:	01840413          	addi	s0,s0,24
8000ad40:	ff2490e3          	bne	s1,s2,8000ad20 <etharp_cleanup_netif+0x28>
8000ad44:	01c12083          	lw	ra,28(sp)
8000ad48:	01812403          	lw	s0,24(sp)
8000ad4c:	01412483          	lw	s1,20(sp)
8000ad50:	01012903          	lw	s2,16(sp)
8000ad54:	00c12983          	lw	s3,12(sp)
8000ad58:	02010113          	addi	sp,sp,32
8000ad5c:	00008067          	ret

8000ad60 <etharp_find_addr>:
8000ad60:	fe010113          	addi	sp,sp,-32
8000ad64:	00058793          	mv	a5,a1
8000ad68:	00812c23          	sw	s0,24(sp)
8000ad6c:	00200593          	li	a1,2
8000ad70:	00060413          	mv	s0,a2
8000ad74:	00050613          	mv	a2,a0
8000ad78:	00078513          	mv	a0,a5
8000ad7c:	00112e23          	sw	ra,28(sp)
8000ad80:	00d12623          	sw	a3,12(sp)
8000ad84:	ca1ff0ef          	jal	ra,8000aa24 <etharp_find_entry>
8000ad88:	04054863          	bltz	a0,8000add8 <etharp_find_addr+0x78>
8000ad8c:	00151793          	slli	a5,a0,0x1
8000ad90:	00a787b3          	add	a5,a5,a0
8000ad94:	b4c18713          	addi	a4,gp,-1204 # 800033f4 <arp_table>
8000ad98:	00379793          	slli	a5,a5,0x3
8000ad9c:	00f70633          	add	a2,a4,a5
8000ada0:	01464583          	lbu	a1,20(a2)
8000ada4:	00100613          	li	a2,1
8000ada8:	02b67863          	bgeu	a2,a1,8000add8 <etharp_find_addr+0x78>
8000adac:	00c78613          	addi	a2,a5,12
8000adb0:	00c12683          	lw	a3,12(sp)
8000adb4:	00c70633          	add	a2,a4,a2
8000adb8:	00478793          	addi	a5,a5,4
8000adbc:	00c42023          	sw	a2,0(s0)
8000adc0:	00f707b3          	add	a5,a4,a5
8000adc4:	00f6a023          	sw	a5,0(a3)
8000adc8:	01c12083          	lw	ra,28(sp)
8000adcc:	01812403          	lw	s0,24(sp)
8000add0:	02010113          	addi	sp,sp,32
8000add4:	00008067          	ret
8000add8:	fff00513          	li	a0,-1
8000addc:	fedff06f          	j	8000adc8 <etharp_find_addr+0x68>

8000ade0 <etharp_get_entry>:
8000ade0:	00900793          	li	a5,9
8000ade4:	04a7e863          	bltu	a5,a0,8000ae34 <etharp_get_entry+0x54>
8000ade8:	00151793          	slli	a5,a0,0x1
8000adec:	00a787b3          	add	a5,a5,a0
8000adf0:	b4c18713          	addi	a4,gp,-1204 # 800033f4 <arp_table>
8000adf4:	00379793          	slli	a5,a5,0x3
8000adf8:	00f70833          	add	a6,a4,a5
8000adfc:	01484303          	lbu	t1,20(a6)
8000ae00:	00100893          	li	a7,1
8000ae04:	00000513          	li	a0,0
8000ae08:	0268f863          	bgeu	a7,t1,8000ae38 <etharp_get_entry+0x58>
8000ae0c:	00478513          	addi	a0,a5,4
8000ae10:	00a70533          	add	a0,a4,a0
8000ae14:	00a5a023          	sw	a0,0(a1)
8000ae18:	00882583          	lw	a1,8(a6)
8000ae1c:	00c78793          	addi	a5,a5,12
8000ae20:	00f707b3          	add	a5,a4,a5
8000ae24:	00b62023          	sw	a1,0(a2)
8000ae28:	00f6a023          	sw	a5,0(a3)
8000ae2c:	00100513          	li	a0,1
8000ae30:	00008067          	ret
8000ae34:	00000513          	li	a0,0
8000ae38:	00008067          	ret

8000ae3c <etharp_input>:
8000ae3c:	22058863          	beqz	a1,8000b06c <etharp_input+0x230>
8000ae40:	fc010113          	addi	sp,sp,-64
8000ae44:	02812c23          	sw	s0,56(sp)
8000ae48:	03212823          	sw	s2,48(sp)
8000ae4c:	03312623          	sw	s3,44(sp)
8000ae50:	02112e23          	sw	ra,60(sp)
8000ae54:	02912a23          	sw	s1,52(sp)
8000ae58:	03412423          	sw	s4,40(sp)
8000ae5c:	03512223          	sw	s5,36(sp)
8000ae60:	03612023          	sw	s6,32(sp)
8000ae64:	01712e23          	sw	s7,28(sp)
8000ae68:	00452483          	lw	s1,4(a0)
8000ae6c:	00058413          	mv	s0,a1
8000ae70:	0014c783          	lbu	a5,1(s1)
8000ae74:	0004c703          	lbu	a4,0(s1)
8000ae78:	00050993          	mv	s3,a0
8000ae7c:	00879793          	slli	a5,a5,0x8
8000ae80:	00e7e7b3          	or	a5,a5,a4
8000ae84:	10000713          	li	a4,256
8000ae88:	a0c18913          	addi	s2,gp,-1524 # 800032b4 <lwip_stats>
8000ae8c:	02e79a63          	bne	a5,a4,8000aec0 <etharp_input+0x84>
8000ae90:	0044c703          	lbu	a4,4(s1)
8000ae94:	00600793          	li	a5,6
8000ae98:	02f71463          	bne	a4,a5,8000aec0 <etharp_input+0x84>
8000ae9c:	0054c703          	lbu	a4,5(s1)
8000aea0:	00400793          	li	a5,4
8000aea4:	00f71e63          	bne	a4,a5,8000aec0 <etharp_input+0x84>
8000aea8:	0034c783          	lbu	a5,3(s1)
8000aeac:	0024c703          	lbu	a4,2(s1)
8000aeb0:	00879793          	slli	a5,a5,0x8
8000aeb4:	00e7e7b3          	or	a5,a5,a4
8000aeb8:	00800713          	li	a4,8
8000aebc:	04e78863          	beq	a5,a4,8000af0c <etharp_input+0xd0>
8000aec0:	05092783          	lw	a5,80(s2)
8000aec4:	00178793          	addi	a5,a5,1
8000aec8:	04f92823          	sw	a5,80(s2)
8000aecc:	03c92783          	lw	a5,60(s2)
8000aed0:	00178793          	addi	a5,a5,1
8000aed4:	02f92e23          	sw	a5,60(s2)
8000aed8:	00098513          	mv	a0,s3
8000aedc:	908fc0ef          	jal	ra,80006fe4 <pbuf_free>
8000aee0:	03c12083          	lw	ra,60(sp)
8000aee4:	03812403          	lw	s0,56(sp)
8000aee8:	03412483          	lw	s1,52(sp)
8000aeec:	03012903          	lw	s2,48(sp)
8000aef0:	02c12983          	lw	s3,44(sp)
8000aef4:	02812a03          	lw	s4,40(sp)
8000aef8:	02412a83          	lw	s5,36(sp)
8000aefc:	02012b03          	lw	s6,32(sp)
8000af00:	01c12b83          	lw	s7,28(sp)
8000af04:	04010113          	addi	sp,sp,64
8000af08:	00008067          	ret
8000af0c:	03492783          	lw	a5,52(s2)
8000af10:	00400613          	li	a2,4
8000af14:	00e48593          	addi	a1,s1,14
8000af18:	00178793          	addi	a5,a5,1
8000af1c:	00810513          	addi	a0,sp,8
8000af20:	02f92a23          	sw	a5,52(s2)
8000af24:	2b0030ef          	jal	ra,8000e1d4 <memcpy>
8000af28:	00400613          	li	a2,4
8000af2c:	01848593          	addi	a1,s1,24
8000af30:	00c10513          	addi	a0,sp,12
8000af34:	2a0030ef          	jal	ra,8000e1d4 <memcpy>
8000af38:	00442783          	lw	a5,4(s0)
8000af3c:	00848a13          	addi	s4,s1,8
8000af40:	00078663          	beqz	a5,8000af4c <etharp_input+0x110>
8000af44:	00c12703          	lw	a4,12(sp)
8000af48:	0ce78e63          	beq	a5,a4,8000b024 <etharp_input+0x1e8>
8000af4c:	00000a93          	li	s5,0
8000af50:	00200b13          	li	s6,2
8000af54:	00812503          	lw	a0,8(sp)
8000af58:	08050e63          	beqz	a0,8000aff4 <etharp_input+0x1b8>
8000af5c:	00040593          	mv	a1,s0
8000af60:	630010ef          	jal	ra,8000c590 <ip4_addr_isbroadcast_u32>
8000af64:	08051863          	bnez	a0,8000aff4 <etharp_input+0x1b8>
8000af68:	00812783          	lw	a5,8(sp)
8000af6c:	0e000713          	li	a4,224
8000af70:	0f07f793          	andi	a5,a5,240
8000af74:	08e78063          	beq	a5,a4,8000aff4 <etharp_input+0x1b8>
8000af78:	00040613          	mv	a2,s0
8000af7c:	000b0593          	mv	a1,s6
8000af80:	00810513          	addi	a0,sp,8
8000af84:	aa1ff0ef          	jal	ra,8000aa24 <etharp_find_entry>
8000af88:	06054663          	bltz	a0,8000aff4 <etharp_input+0x1b8>
8000af8c:	00151793          	slli	a5,a0,0x1
8000af90:	00a787b3          	add	a5,a5,a0
8000af94:	b4c18713          	addi	a4,gp,-1204 # 800033f4 <arp_table>
8000af98:	00379793          	slli	a5,a5,0x3
8000af9c:	00f70b33          	add	s6,a4,a5
8000afa0:	00200693          	li	a3,2
8000afa4:	00c78793          	addi	a5,a5,12
8000afa8:	00db0a23          	sb	a3,20(s6)
8000afac:	008b2423          	sw	s0,8(s6)
8000afb0:	00600613          	li	a2,6
8000afb4:	000a0593          	mv	a1,s4
8000afb8:	00f70533          	add	a0,a4,a5
8000afbc:	218030ef          	jal	ra,8000e1d4 <memcpy>
8000afc0:	000b2b83          	lw	s7,0(s6)
8000afc4:	000b1923          	sh	zero,18(s6)
8000afc8:	020b8663          	beqz	s7,8000aff4 <etharp_input+0x1b8>
8000afcc:	00001737          	lui	a4,0x1
8000afd0:	000b2023          	sw	zero,0(s6)
8000afd4:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000afd8:	000a0693          	mv	a3,s4
8000afdc:	02e40613          	addi	a2,s0,46
8000afe0:	000b8593          	mv	a1,s7
8000afe4:	00040513          	mv	a0,s0
8000afe8:	385010ef          	jal	ra,8000cb6c <ethernet_output>
8000afec:	000b8513          	mv	a0,s7
8000aff0:	ff5fb0ef          	jal	ra,80006fe4 <pbuf_free>
8000aff4:	0074c783          	lbu	a5,7(s1)
8000aff8:	0064c703          	lbu	a4,6(s1)
8000affc:	00879793          	slli	a5,a5,0x8
8000b000:	00e7e7b3          	or	a5,a5,a4
8000b004:	10000713          	li	a4,256
8000b008:	02e78463          	beq	a5,a4,8000b030 <etharp_input+0x1f4>
8000b00c:	20000713          	li	a4,512
8000b010:	04e78663          	beq	a5,a4,8000b05c <etharp_input+0x220>
8000b014:	05892783          	lw	a5,88(s2)
8000b018:	00178793          	addi	a5,a5,1
8000b01c:	04f92c23          	sw	a5,88(s2)
8000b020:	eb9ff06f          	j	8000aed8 <etharp_input+0x9c>
8000b024:	00100a93          	li	s5,1
8000b028:	00100b13          	li	s6,1
8000b02c:	f29ff06f          	j	8000af54 <etharp_input+0x118>
8000b030:	ea0a84e3          	beqz	s5,8000aed8 <etharp_input+0x9c>
8000b034:	02e40693          	addi	a3,s0,46
8000b038:	00200893          	li	a7,2
8000b03c:	00810813          	addi	a6,sp,8
8000b040:	000a0793          	mv	a5,s4
8000b044:	00440713          	addi	a4,s0,4
8000b048:	000a0613          	mv	a2,s4
8000b04c:	00068593          	mv	a1,a3
8000b050:	00040513          	mv	a0,s0
8000b054:	b39ff0ef          	jal	ra,8000ab8c <etharp_raw>
8000b058:	e81ff06f          	j	8000aed8 <etharp_input+0x9c>
8000b05c:	00810593          	addi	a1,sp,8
8000b060:	00040513          	mv	a0,s0
8000b064:	fd5fe0ef          	jal	ra,8000a038 <dhcp_arp_reply>
8000b068:	e71ff06f          	j	8000aed8 <etharp_input+0x9c>
8000b06c:	00008067          	ret

8000b070 <etharp_request>:
8000b070:	02e50693          	addi	a3,a0,46
8000b074:	00058813          	mv	a6,a1
8000b078:	00100893          	li	a7,1
8000b07c:	84c18793          	addi	a5,gp,-1972 # 800030f4 <ethzero>
8000b080:	00450713          	addi	a4,a0,4
8000b084:	85418613          	addi	a2,gp,-1964 # 800030fc <ethbroadcast>
8000b088:	00068593          	mv	a1,a3
8000b08c:	b01ff06f          	j	8000ab8c <etharp_raw>

8000b090 <etharp_tmr>:
8000b090:	fd010113          	addi	sp,sp,-48
8000b094:	02812423          	sw	s0,40(sp)
8000b098:	02912223          	sw	s1,36(sp)
8000b09c:	03212023          	sw	s2,32(sp)
8000b0a0:	01312e23          	sw	s3,28(sp)
8000b0a4:	01412c23          	sw	s4,24(sp)
8000b0a8:	01512a23          	sw	s5,20(sp)
8000b0ac:	01612823          	sw	s6,16(sp)
8000b0b0:	01712623          	sw	s7,12(sp)
8000b0b4:	02112623          	sw	ra,44(sp)
8000b0b8:	b4c18413          	addi	s0,gp,-1204 # 800033f4 <arp_table>
8000b0bc:	00000493          	li	s1,0
8000b0c0:	12b00a13          	li	s4,299
8000b0c4:	00100a93          	li	s5,1
8000b0c8:	00300b13          	li	s6,3
8000b0cc:	00400913          	li	s2,4
8000b0d0:	00200b93          	li	s7,2
8000b0d4:	00a00993          	li	s3,10
8000b0d8:	01444703          	lbu	a4,20(s0)
8000b0dc:	02070663          	beqz	a4,8000b108 <etharp_tmr+0x78>
8000b0e0:	01245783          	lhu	a5,18(s0)
8000b0e4:	00178793          	addi	a5,a5,1
8000b0e8:	01079793          	slli	a5,a5,0x10
8000b0ec:	0107d793          	srli	a5,a5,0x10
8000b0f0:	00f41923          	sh	a5,18(s0)
8000b0f4:	00fa6663          	bltu	s4,a5,8000b100 <etharp_tmr+0x70>
8000b0f8:	05571463          	bne	a4,s5,8000b140 <etharp_tmr+0xb0>
8000b0fc:	04f97e63          	bgeu	s2,a5,8000b158 <etharp_tmr+0xc8>
8000b100:	00048513          	mv	a0,s1
8000b104:	895ff0ef          	jal	ra,8000a998 <etharp_free_entry>
8000b108:	00148493          	addi	s1,s1,1
8000b10c:	01840413          	addi	s0,s0,24
8000b110:	fd3494e3          	bne	s1,s3,8000b0d8 <etharp_tmr+0x48>
8000b114:	02c12083          	lw	ra,44(sp)
8000b118:	02812403          	lw	s0,40(sp)
8000b11c:	02412483          	lw	s1,36(sp)
8000b120:	02012903          	lw	s2,32(sp)
8000b124:	01c12983          	lw	s3,28(sp)
8000b128:	01812a03          	lw	s4,24(sp)
8000b12c:	01412a83          	lw	s5,20(sp)
8000b130:	01012b03          	lw	s6,16(sp)
8000b134:	00c12b83          	lw	s7,12(sp)
8000b138:	03010113          	addi	sp,sp,48
8000b13c:	00008067          	ret
8000b140:	01671663          	bne	a4,s6,8000b14c <etharp_tmr+0xbc>
8000b144:	01240a23          	sb	s2,20(s0)
8000b148:	fc1ff06f          	j	8000b108 <etharp_tmr+0x78>
8000b14c:	fb271ee3          	bne	a4,s2,8000b108 <etharp_tmr+0x78>
8000b150:	01740a23          	sb	s7,20(s0)
8000b154:	fb5ff06f          	j	8000b108 <etharp_tmr+0x78>
8000b158:	00842503          	lw	a0,8(s0)
8000b15c:	00440593          	addi	a1,s0,4
8000b160:	f11ff0ef          	jal	ra,8000b070 <etharp_request>
8000b164:	fa5ff06f          	j	8000b108 <etharp_tmr+0x78>

8000b168 <etharp_output_to_arp_index>:
8000b168:	fe010113          	addi	sp,sp,-32
8000b16c:	01412423          	sw	s4,8(sp)
8000b170:	00058a13          	mv	s4,a1
8000b174:	00161593          	slli	a1,a2,0x1
8000b178:	00c58633          	add	a2,a1,a2
8000b17c:	00361613          	slli	a2,a2,0x3
8000b180:	b4c18593          	addi	a1,gp,-1204 # 800033f4 <arp_table>
8000b184:	00812c23          	sw	s0,24(sp)
8000b188:	00912a23          	sw	s1,20(sp)
8000b18c:	01212823          	sw	s2,16(sp)
8000b190:	01312623          	sw	s3,12(sp)
8000b194:	00112e23          	sw	ra,28(sp)
8000b198:	00c584b3          	add	s1,a1,a2
8000b19c:	0144c703          	lbu	a4,20(s1)
8000b1a0:	00c60413          	addi	s0,a2,12
8000b1a4:	00200793          	li	a5,2
8000b1a8:	00050913          	mv	s2,a0
8000b1ac:	00858433          	add	s0,a1,s0
8000b1b0:	02e50993          	addi	s3,a0,46
8000b1b4:	02f71463          	bne	a4,a5,8000b1dc <etharp_output_to_arp_index+0x74>
8000b1b8:	0124d783          	lhu	a5,18(s1)
8000b1bc:	11c00713          	li	a4,284
8000b1c0:	04f77a63          	bgeu	a4,a5,8000b214 <etharp_output_to_arp_index+0xac>
8000b1c4:	00460613          	addi	a2,a2,4
8000b1c8:	00c585b3          	add	a1,a1,a2
8000b1cc:	ea5ff0ef          	jal	ra,8000b070 <etharp_request>
8000b1d0:	00051663          	bnez	a0,8000b1dc <etharp_output_to_arp_index+0x74>
8000b1d4:	00300793          	li	a5,3
8000b1d8:	00f48a23          	sb	a5,20(s1)
8000b1dc:	00040693          	mv	a3,s0
8000b1e0:	01812403          	lw	s0,24(sp)
8000b1e4:	01c12083          	lw	ra,28(sp)
8000b1e8:	01412483          	lw	s1,20(sp)
8000b1ec:	00098613          	mv	a2,s3
8000b1f0:	000a0593          	mv	a1,s4
8000b1f4:	00c12983          	lw	s3,12(sp)
8000b1f8:	00812a03          	lw	s4,8(sp)
8000b1fc:	00090513          	mv	a0,s2
8000b200:	01012903          	lw	s2,16(sp)
8000b204:	00001737          	lui	a4,0x1
8000b208:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b20c:	02010113          	addi	sp,sp,32
8000b210:	15d0106f          	j	8000cb6c <ethernet_output>
8000b214:	10d00713          	li	a4,269
8000b218:	fcf772e3          	bgeu	a4,a5,8000b1dc <etharp_output_to_arp_index+0x74>
8000b21c:	00460613          	addi	a2,a2,4
8000b220:	00c58833          	add	a6,a1,a2
8000b224:	00100893          	li	a7,1
8000b228:	84c18793          	addi	a5,gp,-1972 # 800030f4 <ethzero>
8000b22c:	00450713          	addi	a4,a0,4
8000b230:	00098693          	mv	a3,s3
8000b234:	00040613          	mv	a2,s0
8000b238:	00098593          	mv	a1,s3
8000b23c:	951ff0ef          	jal	ra,8000ab8c <etharp_raw>
8000b240:	f91ff06f          	j	8000b1d0 <etharp_output_to_arp_index+0x68>

8000b244 <etharp_query>:
8000b244:	fe010113          	addi	sp,sp,-32
8000b248:	01512223          	sw	s5,4(sp)
8000b24c:	00058a93          	mv	s5,a1
8000b250:	00912a23          	sw	s1,20(sp)
8000b254:	00050593          	mv	a1,a0
8000b258:	00050493          	mv	s1,a0
8000b25c:	000aa503          	lw	a0,0(s5)
8000b260:	01312623          	sw	s3,12(sp)
8000b264:	00112e23          	sw	ra,28(sp)
8000b268:	00812c23          	sw	s0,24(sp)
8000b26c:	01212823          	sw	s2,16(sp)
8000b270:	01412423          	sw	s4,8(sp)
8000b274:	00060993          	mv	s3,a2
8000b278:	318010ef          	jal	ra,8000c590 <ip4_addr_isbroadcast_u32>
8000b27c:	16051a63          	bnez	a0,8000b3f0 <etharp_query+0x1ac>
8000b280:	000aa783          	lw	a5,0(s5)
8000b284:	0e000713          	li	a4,224
8000b288:	0f07f693          	andi	a3,a5,240
8000b28c:	16e68263          	beq	a3,a4,8000b3f0 <etharp_query+0x1ac>
8000b290:	16078063          	beqz	a5,8000b3f0 <etharp_query+0x1ac>
8000b294:	00048613          	mv	a2,s1
8000b298:	00100593          	li	a1,1
8000b29c:	000a8513          	mv	a0,s5
8000b2a0:	f84ff0ef          	jal	ra,8000aa24 <etharp_find_entry>
8000b2a4:	02055e63          	bgez	a0,8000b2e0 <etharp_query+0x9c>
8000b2a8:	00098a63          	beqz	s3,8000b2bc <etharp_query+0x78>
8000b2ac:	a0c18793          	addi	a5,gp,-1524 # 800032b4 <lwip_stats>
8000b2b0:	0487a703          	lw	a4,72(a5)
8000b2b4:	00170713          	addi	a4,a4,1
8000b2b8:	04e7a423          	sw	a4,72(a5)
8000b2bc:	01c12083          	lw	ra,28(sp)
8000b2c0:	01812403          	lw	s0,24(sp)
8000b2c4:	01412483          	lw	s1,20(sp)
8000b2c8:	01012903          	lw	s2,16(sp)
8000b2cc:	00c12983          	lw	s3,12(sp)
8000b2d0:	00812a03          	lw	s4,8(sp)
8000b2d4:	00412a83          	lw	s5,4(sp)
8000b2d8:	02010113          	addi	sp,sp,32
8000b2dc:	00008067          	ret
8000b2e0:	0ff57413          	andi	s0,a0,255
8000b2e4:	00141a13          	slli	s4,s0,0x1
8000b2e8:	008a0733          	add	a4,s4,s0
8000b2ec:	b4c18793          	addi	a5,gp,-1204 # 800033f4 <arp_table>
8000b2f0:	00371713          	slli	a4,a4,0x3
8000b2f4:	00e787b3          	add	a5,a5,a4
8000b2f8:	0147c703          	lbu	a4,20(a5)
8000b2fc:	b4c18913          	addi	s2,gp,-1204 # 800033f4 <arp_table>
8000b300:	08070663          	beqz	a4,8000b38c <etharp_query+0x148>
8000b304:	fff00513          	li	a0,-1
8000b308:	00099a63          	bnez	s3,8000b31c <etharp_query+0xd8>
8000b30c:	000a8593          	mv	a1,s5
8000b310:	00048513          	mv	a0,s1
8000b314:	d5dff0ef          	jal	ra,8000b070 <etharp_request>
8000b318:	fa0982e3          	beqz	s3,8000b2bc <etharp_query+0x78>
8000b31c:	008a07b3          	add	a5,s4,s0
8000b320:	00379793          	slli	a5,a5,0x3
8000b324:	00f907b3          	add	a5,s2,a5
8000b328:	0147c703          	lbu	a4,20(a5)
8000b32c:	00100793          	li	a5,1
8000b330:	06e7f663          	bgeu	a5,a4,8000b39c <etharp_query+0x158>
8000b334:	00048863          	beqz	s1,8000b344 <etharp_query+0x100>
8000b338:	03c4a783          	lw	a5,60(s1)
8000b33c:	00078463          	beqz	a5,8000b344 <etharp_query+0x100>
8000b340:	00878023          	sb	s0,0(a5)
8000b344:	008a06b3          	add	a3,s4,s0
8000b348:	00369693          	slli	a3,a3,0x3
8000b34c:	01812403          	lw	s0,24(sp)
8000b350:	00c68693          	addi	a3,a3,12
8000b354:	01c12083          	lw	ra,28(sp)
8000b358:	00812a03          	lw	s4,8(sp)
8000b35c:	00412a83          	lw	s5,4(sp)
8000b360:	00d906b3          	add	a3,s2,a3
8000b364:	02e48613          	addi	a2,s1,46
8000b368:	01012903          	lw	s2,16(sp)
8000b36c:	00098593          	mv	a1,s3
8000b370:	00048513          	mv	a0,s1
8000b374:	00c12983          	lw	s3,12(sp)
8000b378:	01412483          	lw	s1,20(sp)
8000b37c:	00001737          	lui	a4,0x1
8000b380:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b384:	02010113          	addi	sp,sp,32
8000b388:	7e40106f          	j	8000cb6c <ethernet_output>
8000b38c:	00100713          	li	a4,1
8000b390:	00e78a23          	sb	a4,20(a5)
8000b394:	0097a423          	sw	s1,8(a5)
8000b398:	f75ff06f          	j	8000b30c <etharp_query+0xc8>
8000b39c:	f2f710e3          	bne	a4,a5,8000b2bc <etharp_query+0x78>
8000b3a0:	00098793          	mv	a5,s3
8000b3a4:	00c7c703          	lbu	a4,12(a5)
8000b3a8:	04077713          	andi	a4,a4,64
8000b3ac:	04071663          	bnez	a4,8000b3f8 <etharp_query+0x1b4>
8000b3b0:	0007a783          	lw	a5,0(a5)
8000b3b4:	fe0798e3          	bnez	a5,8000b3a4 <etharp_query+0x160>
8000b3b8:	00098513          	mv	a0,s3
8000b3bc:	810fc0ef          	jal	ra,800073cc <pbuf_ref>
8000b3c0:	008a07b3          	add	a5,s4,s0
8000b3c4:	00379793          	slli	a5,a5,0x3
8000b3c8:	00f907b3          	add	a5,s2,a5
8000b3cc:	0007a503          	lw	a0,0(a5)
8000b3d0:	00050463          	beqz	a0,8000b3d8 <etharp_query+0x194>
8000b3d4:	c11fb0ef          	jal	ra,80006fe4 <pbuf_free>
8000b3d8:	008a0433          	add	s0,s4,s0
8000b3dc:	00341413          	slli	s0,s0,0x3
8000b3e0:	00890433          	add	s0,s2,s0
8000b3e4:	01342023          	sw	s3,0(s0)
8000b3e8:	00000513          	li	a0,0
8000b3ec:	ed1ff06f          	j	8000b2bc <etharp_query+0x78>
8000b3f0:	ff000513          	li	a0,-16
8000b3f4:	ec9ff06f          	j	8000b2bc <etharp_query+0x78>
8000b3f8:	00098613          	mv	a2,s3
8000b3fc:	28000593          	li	a1,640
8000b400:	01000513          	li	a0,16
8000b404:	c78fc0ef          	jal	ra,8000787c <pbuf_clone>
8000b408:	00050993          	mv	s3,a0
8000b40c:	fa051ae3          	bnez	a0,8000b3c0 <etharp_query+0x17c>
8000b410:	a0c18793          	addi	a5,gp,-1524 # 800032b4 <lwip_stats>
8000b414:	0487a703          	lw	a4,72(a5)
8000b418:	fff00513          	li	a0,-1
8000b41c:	00170713          	addi	a4,a4,1
8000b420:	04e7a423          	sw	a4,72(a5)
8000b424:	e99ff06f          	j	8000b2bc <etharp_query+0x78>

8000b428 <etharp_output>:
8000b428:	fe010113          	addi	sp,sp,-32
8000b42c:	00812c23          	sw	s0,24(sp)
8000b430:	00912a23          	sw	s1,20(sp)
8000b434:	01212823          	sw	s2,16(sp)
8000b438:	00112e23          	sw	ra,28(sp)
8000b43c:	00050413          	mv	s0,a0
8000b440:	00058913          	mv	s2,a1
8000b444:	00050593          	mv	a1,a0
8000b448:	00062503          	lw	a0,0(a2)
8000b44c:	00060493          	mv	s1,a2
8000b450:	140010ef          	jal	ra,8000c590 <ip4_addr_isbroadcast_u32>
8000b454:	16051863          	bnez	a0,8000b5c4 <etharp_output+0x19c>
8000b458:	0004a783          	lw	a5,0(s1)
8000b45c:	0e000713          	li	a4,224
8000b460:	0f07f613          	andi	a2,a5,240
8000b464:	04e61863          	bne	a2,a4,8000b4b4 <etharp_output+0x8c>
8000b468:	00100793          	li	a5,1
8000b46c:	00f11423          	sh	a5,8(sp)
8000b470:	05e00793          	li	a5,94
8000b474:	00f10523          	sb	a5,10(sp)
8000b478:	0014c783          	lbu	a5,1(s1)
8000b47c:	00810693          	addi	a3,sp,8
8000b480:	07f7f793          	andi	a5,a5,127
8000b484:	00f105a3          	sb	a5,11(sp)
8000b488:	0024c783          	lbu	a5,2(s1)
8000b48c:	00f10623          	sb	a5,12(sp)
8000b490:	0034c783          	lbu	a5,3(s1)
8000b494:	00f106a3          	sb	a5,13(sp)
8000b498:	00001737          	lui	a4,0x1
8000b49c:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b4a0:	02e40613          	addi	a2,s0,46
8000b4a4:	00090593          	mv	a1,s2
8000b4a8:	00040513          	mv	a0,s0
8000b4ac:	6c0010ef          	jal	ra,8000cb6c <ethernet_output>
8000b4b0:	0a40006f          	j	8000b554 <etharp_output+0x12c>
8000b4b4:	00442703          	lw	a4,4(s0)
8000b4b8:	00842603          	lw	a2,8(s0)
8000b4bc:	00050693          	mv	a3,a0
8000b4c0:	00e7c733          	xor	a4,a5,a4
8000b4c4:	00c77733          	and	a4,a4,a2
8000b4c8:	02070463          	beqz	a4,8000b4f0 <etharp_output+0xc8>
8000b4cc:	01079793          	slli	a5,a5,0x10
8000b4d0:	00010737          	lui	a4,0x10
8000b4d4:	0107d793          	srli	a5,a5,0x10
8000b4d8:	ea970713          	addi	a4,a4,-343 # fea9 <_stack_size+0xf6a9>
8000b4dc:	00e78a63          	beq	a5,a4,8000b4f0 <etharp_output+0xc8>
8000b4e0:	00c42783          	lw	a5,12(s0)
8000b4e4:	ffc00513          	li	a0,-4
8000b4e8:	06078663          	beqz	a5,8000b554 <etharp_output+0x12c>
8000b4ec:	00c40493          	addi	s1,s0,12
8000b4f0:	03c42583          	lw	a1,60(s0)
8000b4f4:	b4c18793          	addi	a5,gp,-1204 # 800033f4 <arp_table>
8000b4f8:	06058a63          	beqz	a1,8000b56c <etharp_output+0x144>
8000b4fc:	0005c603          	lbu	a2,0(a1)
8000b500:	00900713          	li	a4,9
8000b504:	06c76463          	bltu	a4,a2,8000b56c <etharp_output+0x144>
8000b508:	00161713          	slli	a4,a2,0x1
8000b50c:	00c70733          	add	a4,a4,a2
8000b510:	00371713          	slli	a4,a4,0x3
8000b514:	00e78733          	add	a4,a5,a4
8000b518:	01474803          	lbu	a6,20(a4)
8000b51c:	00100513          	li	a0,1
8000b520:	05057663          	bgeu	a0,a6,8000b56c <etharp_output+0x144>
8000b524:	00872503          	lw	a0,8(a4)
8000b528:	04851263          	bne	a0,s0,8000b56c <etharp_output+0x144>
8000b52c:	0004a503          	lw	a0,0(s1)
8000b530:	00472703          	lw	a4,4(a4)
8000b534:	02e51c63          	bne	a0,a4,8000b56c <etharp_output+0x144>
8000b538:	a0c18793          	addi	a5,gp,-1524 # 800032b4 <lwip_stats>
8000b53c:	05c7a703          	lw	a4,92(a5)
8000b540:	00170713          	addi	a4,a4,1
8000b544:	04e7ae23          	sw	a4,92(a5)
8000b548:	00090593          	mv	a1,s2
8000b54c:	00040513          	mv	a0,s0
8000b550:	c19ff0ef          	jal	ra,8000b168 <etharp_output_to_arp_index>
8000b554:	01c12083          	lw	ra,28(sp)
8000b558:	01812403          	lw	s0,24(sp)
8000b55c:	01412483          	lw	s1,20(sp)
8000b560:	01012903          	lw	s2,16(sp)
8000b564:	02010113          	addi	sp,sp,32
8000b568:	00008067          	ret
8000b56c:	00100613          	li	a2,1
8000b570:	00a00713          	li	a4,10
8000b574:	0147c503          	lbu	a0,20(a5)
8000b578:	02a67463          	bgeu	a2,a0,8000b5a0 <etharp_output+0x178>
8000b57c:	0087a503          	lw	a0,8(a5)
8000b580:	02851063          	bne	a0,s0,8000b5a0 <etharp_output+0x178>
8000b584:	0004a803          	lw	a6,0(s1)
8000b588:	0047a503          	lw	a0,4(a5)
8000b58c:	00a81a63          	bne	a6,a0,8000b5a0 <etharp_output+0x178>
8000b590:	00058463          	beqz	a1,8000b598 <etharp_output+0x170>
8000b594:	00d58023          	sb	a3,0(a1)
8000b598:	00068613          	mv	a2,a3
8000b59c:	fadff06f          	j	8000b548 <etharp_output+0x120>
8000b5a0:	00168693          	addi	a3,a3,1
8000b5a4:	0ff6f693          	andi	a3,a3,255
8000b5a8:	01878793          	addi	a5,a5,24
8000b5ac:	fce694e3          	bne	a3,a4,8000b574 <etharp_output+0x14c>
8000b5b0:	00090613          	mv	a2,s2
8000b5b4:	00048593          	mv	a1,s1
8000b5b8:	00040513          	mv	a0,s0
8000b5bc:	c89ff0ef          	jal	ra,8000b244 <etharp_query>
8000b5c0:	f95ff06f          	j	8000b554 <etharp_output+0x12c>
8000b5c4:	85418693          	addi	a3,gp,-1964 # 800030fc <ethbroadcast>
8000b5c8:	ed1ff06f          	j	8000b498 <etharp_output+0x70>

8000b5cc <icmp_input>:
8000b5cc:	fd010113          	addi	sp,sp,-48
8000b5d0:	02912223          	sw	s1,36(sp)
8000b5d4:	02812423          	sw	s0,40(sp)
8000b5d8:	01712623          	sw	s7,12(sp)
8000b5dc:	02112623          	sw	ra,44(sp)
8000b5e0:	03212023          	sw	s2,32(sp)
8000b5e4:	01312e23          	sw	s3,28(sp)
8000b5e8:	01412c23          	sw	s4,24(sp)
8000b5ec:	01512a23          	sw	s5,20(sp)
8000b5f0:	01612823          	sw	s6,16(sp)
8000b5f4:	01812423          	sw	s8,8(sp)
8000b5f8:	a0c18793          	addi	a5,gp,-1524 # 800032b4 <lwip_stats>
8000b5fc:	0c47a703          	lw	a4,196(a5)
8000b600:	00050413          	mv	s0,a0
8000b604:	00170713          	addi	a4,a4,1
8000b608:	0ce7a223          	sw	a4,196(a5)
8000b60c:	9f418713          	addi	a4,gp,-1548 # 8000329c <ip_data>
8000b610:	00872c03          	lw	s8,8(a4)
8000b614:	01300713          	li	a4,19
8000b618:	a0c18493          	addi	s1,gp,-1524 # 800032b4 <lwip_stats>
8000b61c:	000c4a83          	lbu	s5,0(s8)
8000b620:	00fafa93          	andi	s5,s5,15
8000b624:	002a9a93          	slli	s5,s5,0x2
8000b628:	2b577863          	bgeu	a4,s5,8000b8d8 <icmp_input+0x30c>
8000b62c:	00a55683          	lhu	a3,10(a0)
8000b630:	00300713          	li	a4,3
8000b634:	2ad77263          	bgeu	a4,a3,8000b8d8 <icmp_input+0x30c>
8000b638:	00452703          	lw	a4,4(a0)
8000b63c:	00074703          	lbu	a4,0(a4)
8000b640:	22070663          	beqz	a4,8000b86c <icmp_input+0x2a0>
8000b644:	00800693          	li	a3,8
8000b648:	26d71a63          	bne	a4,a3,8000b8bc <icmp_input+0x2f0>
8000b64c:	9f418b93          	addi	s7,gp,-1548 # 8000329c <ip_data>
8000b650:	014ba503          	lw	a0,20(s7)
8000b654:	0e000793          	li	a5,224
8000b658:	00058993          	mv	s3,a1
8000b65c:	0f057713          	andi	a4,a0,240
8000b660:	00458913          	addi	s2,a1,4
8000b664:	00f70463          	beq	a4,a5,8000b66c <icmp_input+0xa0>
8000b668:	a0818913          	addi	s2,gp,-1528 # 800032b0 <ip_data+0x14>
8000b66c:	000ba583          	lw	a1,0(s7)
8000b670:	721000ef          	jal	ra,8000c590 <ip4_addr_isbroadcast_u32>
8000b674:	00050463          	beqz	a0,8000b67c <icmp_input+0xb0>
8000b678:	00498913          	addi	s2,s3,4
8000b67c:	00845703          	lhu	a4,8(s0)
8000b680:	00700793          	li	a5,7
8000b684:	24e7fa63          	bgeu	a5,a4,8000b8d8 <icmp_input+0x30c>
8000b688:	00040513          	mv	a0,s0
8000b68c:	d4dfa0ef          	jal	ra,800063d8 <inet_chksum_pbuf>
8000b690:	04050463          	beqz	a0,8000b6d8 <icmp_input+0x10c>
8000b694:	00040513          	mv	a0,s0
8000b698:	94dfb0ef          	jal	ra,80006fe4 <pbuf_free>
8000b69c:	0d04a783          	lw	a5,208(s1)
8000b6a0:	00178793          	addi	a5,a5,1
8000b6a4:	0cf4a823          	sw	a5,208(s1)
8000b6a8:	02c12083          	lw	ra,44(sp)
8000b6ac:	02812403          	lw	s0,40(sp)
8000b6b0:	02412483          	lw	s1,36(sp)
8000b6b4:	02012903          	lw	s2,32(sp)
8000b6b8:	01c12983          	lw	s3,28(sp)
8000b6bc:	01812a03          	lw	s4,24(sp)
8000b6c0:	01412a83          	lw	s5,20(sp)
8000b6c4:	01012b03          	lw	s6,16(sp)
8000b6c8:	00c12b83          	lw	s7,12(sp)
8000b6cc:	00812c03          	lw	s8,8(sp)
8000b6d0:	03010113          	addi	sp,sp,48
8000b6d4:	00008067          	ret
8000b6d8:	010a8b13          	addi	s6,s5,16
8000b6dc:	010a9a13          	slli	s4,s5,0x10
8000b6e0:	000b0593          	mv	a1,s6
8000b6e4:	00040513          	mv	a0,s0
8000b6e8:	010a5a13          	srli	s4,s4,0x10
8000b6ec:	861fb0ef          	jal	ra,80006f4c <pbuf_add_header>
8000b6f0:	1a050863          	beqz	a0,8000b8a0 <icmp_input+0x2d4>
8000b6f4:	00845783          	lhu	a5,8(s0)
8000b6f8:	014785b3          	add	a1,a5,s4
8000b6fc:	01059593          	slli	a1,a1,0x10
8000b700:	0105d593          	srli	a1,a1,0x10
8000b704:	02f5e463          	bltu	a1,a5,8000b72c <icmp_input+0x160>
8000b708:	28000613          	li	a2,640
8000b70c:	01000513          	li	a0,16
8000b710:	9a9fb0ef          	jal	ra,800070b8 <pbuf_alloc>
8000b714:	00050b13          	mv	s6,a0
8000b718:	00050a63          	beqz	a0,8000b72c <icmp_input+0x160>
8000b71c:	00a55703          	lhu	a4,10(a0)
8000b720:	008a8793          	addi	a5,s5,8
8000b724:	02f77063          	bgeu	a4,a5,8000b744 <icmp_input+0x178>
8000b728:	8bdfb0ef          	jal	ra,80006fe4 <pbuf_free>
8000b72c:	00040513          	mv	a0,s0
8000b730:	8b5fb0ef          	jal	ra,80006fe4 <pbuf_free>
8000b734:	0e84a783          	lw	a5,232(s1)
8000b738:	00178793          	addi	a5,a5,1
8000b73c:	0ef4a423          	sw	a5,232(s1)
8000b740:	f69ff06f          	j	8000b6a8 <icmp_input+0xdc>
8000b744:	00452503          	lw	a0,4(a0)
8000b748:	000c0593          	mv	a1,s8
8000b74c:	000a8613          	mv	a2,s5
8000b750:	285020ef          	jal	ra,8000e1d4 <memcpy>
8000b754:	000a8593          	mv	a1,s5
8000b758:	000b0513          	mv	a0,s6
8000b75c:	801fb0ef          	jal	ra,80006f5c <pbuf_remove_header>
8000b760:	00050663          	beqz	a0,8000b76c <icmp_input+0x1a0>
8000b764:	000b0513          	mv	a0,s6
8000b768:	fc1ff06f          	j	8000b728 <icmp_input+0x15c>
8000b76c:	00040593          	mv	a1,s0
8000b770:	000b0513          	mv	a0,s6
8000b774:	d45fb0ef          	jal	ra,800074b8 <pbuf_copy>
8000b778:	fe0516e3          	bnez	a0,8000b764 <icmp_input+0x198>
8000b77c:	00040513          	mv	a0,s0
8000b780:	865fb0ef          	jal	ra,80006fe4 <pbuf_free>
8000b784:	000b0413          	mv	s0,s6
8000b788:	000a8593          	mv	a1,s5
8000b78c:	00040513          	mv	a0,s0
8000b790:	00442b03          	lw	s6,4(s0)
8000b794:	fb8fb0ef          	jal	ra,80006f4c <pbuf_add_header>
8000b798:	0c051a63          	bnez	a0,8000b86c <icmp_input+0x2a0>
8000b79c:	00092783          	lw	a5,0(s2)
8000b7a0:	00442a83          	lw	s5,4(s0)
8000b7a4:	0087d713          	srli	a4,a5,0x8
8000b7a8:	00fa8623          	sb	a5,12(s5)
8000b7ac:	00ea86a3          	sb	a4,13(s5)
8000b7b0:	0107d713          	srli	a4,a5,0x10
8000b7b4:	0187d793          	srli	a5,a5,0x18
8000b7b8:	00ea8723          	sb	a4,14(s5)
8000b7bc:	00fa87a3          	sb	a5,15(s5)
8000b7c0:	010ba783          	lw	a5,16(s7)
8000b7c4:	0087d713          	srli	a4,a5,0x8
8000b7c8:	00fa8823          	sb	a5,16(s5)
8000b7cc:	00ea88a3          	sb	a4,17(s5)
8000b7d0:	0107d713          	srli	a4,a5,0x10
8000b7d4:	0187d793          	srli	a5,a5,0x18
8000b7d8:	00ea8923          	sb	a4,18(s5)
8000b7dc:	00fa89a3          	sb	a5,19(s5)
8000b7e0:	003b4783          	lbu	a5,3(s6)
8000b7e4:	002b4703          	lbu	a4,2(s6)
8000b7e8:	000b0023          	sb	zero,0(s6)
8000b7ec:	00879793          	slli	a5,a5,0x8
8000b7f0:	00e7e7b3          	or	a5,a5,a4
8000b7f4:	00010737          	lui	a4,0x10
8000b7f8:	ff770713          	addi	a4,a4,-9 # fff7 <_stack_size+0xf7f7>
8000b7fc:	0af77c63          	bgeu	a4,a5,8000b8b4 <icmp_input+0x2e8>
8000b800:	00978793          	addi	a5,a5,9
8000b804:	01079793          	slli	a5,a5,0x10
8000b808:	0107d793          	srli	a5,a5,0x10
8000b80c:	00fb0123          	sb	a5,2(s6)
8000b810:	0087d793          	srli	a5,a5,0x8
8000b814:	00fb01a3          	sb	a5,3(s6)
8000b818:	fff00793          	li	a5,-1
8000b81c:	00fa8423          	sb	a5,8(s5)
8000b820:	000a0593          	mv	a1,s4
8000b824:	000a8523          	sb	zero,10(s5)
8000b828:	000a85a3          	sb	zero,11(s5)
8000b82c:	000a8513          	mv	a0,s5
8000b830:	b85fa0ef          	jal	ra,800063b4 <inet_chksum>
8000b834:	00aa8523          	sb	a0,10(s5)
8000b838:	00855513          	srli	a0,a0,0x8
8000b83c:	00aa85a3          	sb	a0,11(s5)
8000b840:	0c04a783          	lw	a5,192(s1)
8000b844:	00098813          	mv	a6,s3
8000b848:	00000713          	li	a4,0
8000b84c:	00178793          	addi	a5,a5,1
8000b850:	0cf4a023          	sw	a5,192(s1)
8000b854:	0ff00693          	li	a3,255
8000b858:	00100793          	li	a5,1
8000b85c:	00000613          	li	a2,0
8000b860:	00090593          	mv	a1,s2
8000b864:	00040513          	mv	a0,s0
8000b868:	3fd000ef          	jal	ra,8000c464 <ip4_output_if>
8000b86c:	00040513          	mv	a0,s0
8000b870:	02812403          	lw	s0,40(sp)
8000b874:	02c12083          	lw	ra,44(sp)
8000b878:	02412483          	lw	s1,36(sp)
8000b87c:	02012903          	lw	s2,32(sp)
8000b880:	01c12983          	lw	s3,28(sp)
8000b884:	01812a03          	lw	s4,24(sp)
8000b888:	01412a83          	lw	s5,20(sp)
8000b88c:	01012b03          	lw	s6,16(sp)
8000b890:	00c12b83          	lw	s7,12(sp)
8000b894:	00812c03          	lw	s8,8(sp)
8000b898:	03010113          	addi	sp,sp,48
8000b89c:	f48fb06f          	j	80006fe4 <pbuf_free>
8000b8a0:	000b0593          	mv	a1,s6
8000b8a4:	00040513          	mv	a0,s0
8000b8a8:	eb4fb0ef          	jal	ra,80006f5c <pbuf_remove_header>
8000b8ac:	ec050ee3          	beqz	a0,8000b788 <icmp_input+0x1bc>
8000b8b0:	e7dff06f          	j	8000b72c <icmp_input+0x160>
8000b8b4:	00878793          	addi	a5,a5,8
8000b8b8:	f4dff06f          	j	8000b804 <icmp_input+0x238>
8000b8bc:	0e07a703          	lw	a4,224(a5)
8000b8c0:	00170713          	addi	a4,a4,1
8000b8c4:	0ee7a023          	sw	a4,224(a5)
8000b8c8:	0cc7a703          	lw	a4,204(a5)
8000b8cc:	00170713          	addi	a4,a4,1
8000b8d0:	0ce7a623          	sw	a4,204(a5)
8000b8d4:	f99ff06f          	j	8000b86c <icmp_input+0x2a0>
8000b8d8:	00040513          	mv	a0,s0
8000b8dc:	f08fb0ef          	jal	ra,80006fe4 <pbuf_free>
8000b8e0:	0d44a783          	lw	a5,212(s1)
8000b8e4:	00178793          	addi	a5,a5,1
8000b8e8:	0cf4aa23          	sw	a5,212(s1)
8000b8ec:	dbdff06f          	j	8000b6a8 <icmp_input+0xdc>

8000b8f0 <icmp_dest_unreach>:
8000b8f0:	fc010113          	addi	sp,sp,-64
8000b8f4:	03312623          	sw	s3,44(sp)
8000b8f8:	03412423          	sw	s4,40(sp)
8000b8fc:	00050993          	mv	s3,a0
8000b900:	00058a13          	mv	s4,a1
8000b904:	28000613          	li	a2,640
8000b908:	02400593          	li	a1,36
8000b90c:	02400513          	li	a0,36
8000b910:	02112e23          	sw	ra,60(sp)
8000b914:	02812c23          	sw	s0,56(sp)
8000b918:	02912a23          	sw	s1,52(sp)
8000b91c:	03212823          	sw	s2,48(sp)
8000b920:	f98fb0ef          	jal	ra,800070b8 <pbuf_alloc>
8000b924:	0c050a63          	beqz	a0,8000b9f8 <icmp_dest_unreach+0x108>
8000b928:	00452403          	lw	s0,4(a0)
8000b92c:	00300793          	li	a5,3
8000b930:	0049a903          	lw	s2,4(s3)
8000b934:	00f40023          	sb	a5,0(s0)
8000b938:	014400a3          	sb	s4,1(s0)
8000b93c:	00040223          	sb	zero,4(s0)
8000b940:	000402a3          	sb	zero,5(s0)
8000b944:	00040323          	sb	zero,6(s0)
8000b948:	000403a3          	sb	zero,7(s0)
8000b94c:	00050493          	mv	s1,a0
8000b950:	00452503          	lw	a0,4(a0)
8000b954:	0049a583          	lw	a1,4(s3)
8000b958:	01c00613          	li	a2,28
8000b95c:	00850513          	addi	a0,a0,8
8000b960:	075020ef          	jal	ra,8000e1d4 <memcpy>
8000b964:	00d94703          	lbu	a4,13(s2)
8000b968:	00c94783          	lbu	a5,12(s2)
8000b96c:	01c10513          	addi	a0,sp,28
8000b970:	00871713          	slli	a4,a4,0x8
8000b974:	00f76733          	or	a4,a4,a5
8000b978:	00e94783          	lbu	a5,14(s2)
8000b97c:	01079793          	slli	a5,a5,0x10
8000b980:	00e7e733          	or	a4,a5,a4
8000b984:	00f94783          	lbu	a5,15(s2)
8000b988:	01879793          	slli	a5,a5,0x18
8000b98c:	00e7e7b3          	or	a5,a5,a4
8000b990:	00f12e23          	sw	a5,28(sp)
8000b994:	438000ef          	jal	ra,8000bdcc <ip4_route>
8000b998:	00a12623          	sw	a0,12(sp)
8000b99c:	04050a63          	beqz	a0,8000b9f0 <icmp_dest_unreach+0x100>
8000b9a0:	00040123          	sb	zero,2(s0)
8000b9a4:	000401a3          	sb	zero,3(s0)
8000b9a8:	00a4d583          	lhu	a1,10(s1)
8000b9ac:	00040513          	mv	a0,s0
8000b9b0:	a05fa0ef          	jal	ra,800063b4 <inet_chksum>
8000b9b4:	00a40123          	sb	a0,2(s0)
8000b9b8:	00855513          	srli	a0,a0,0x8
8000b9bc:	00a401a3          	sb	a0,3(s0)
8000b9c0:	a0c18793          	addi	a5,gp,-1524 # 800032b4 <lwip_stats>
8000b9c4:	0c07a703          	lw	a4,192(a5)
8000b9c8:	00c12803          	lw	a6,12(sp)
8000b9cc:	0ff00693          	li	a3,255
8000b9d0:	00170713          	addi	a4,a4,1
8000b9d4:	0ce7a023          	sw	a4,192(a5)
8000b9d8:	01c10613          	addi	a2,sp,28
8000b9dc:	00100793          	li	a5,1
8000b9e0:	00000713          	li	a4,0
8000b9e4:	00000593          	li	a1,0
8000b9e8:	00048513          	mv	a0,s1
8000b9ec:	279000ef          	jal	ra,8000c464 <ip4_output_if>
8000b9f0:	00048513          	mv	a0,s1
8000b9f4:	df0fb0ef          	jal	ra,80006fe4 <pbuf_free>
8000b9f8:	03c12083          	lw	ra,60(sp)
8000b9fc:	03812403          	lw	s0,56(sp)
8000ba00:	03412483          	lw	s1,52(sp)
8000ba04:	03012903          	lw	s2,48(sp)
8000ba08:	02c12983          	lw	s3,44(sp)
8000ba0c:	02812a03          	lw	s4,40(sp)
8000ba10:	04010113          	addi	sp,sp,64
8000ba14:	00008067          	ret

8000ba18 <ipfrag_free_pbuf_custom>:
8000ba18:	00050593          	mv	a1,a0
8000ba1c:	01452503          	lw	a0,20(a0)
8000ba20:	02050463          	beqz	a0,8000ba48 <ipfrag_free_pbuf_custom+0x30>
8000ba24:	fe010113          	addi	sp,sp,-32
8000ba28:	00112e23          	sw	ra,28(sp)
8000ba2c:	00b12623          	sw	a1,12(sp)
8000ba30:	db4fb0ef          	jal	ra,80006fe4 <pbuf_free>
8000ba34:	00c12583          	lw	a1,12(sp)
8000ba38:	01c12083          	lw	ra,28(sp)
8000ba3c:	00200513          	li	a0,2
8000ba40:	02010113          	addi	sp,sp,32
8000ba44:	cedfa06f          	j	80006730 <memp_free>
8000ba48:	00200513          	li	a0,2
8000ba4c:	ff9ff06f          	j	8000ba44 <ipfrag_free_pbuf_custom+0x2c>

8000ba50 <ip4_frag>:
8000ba50:	fa010113          	addi	sp,sp,-96
8000ba54:	04112e23          	sw	ra,92(sp)
8000ba58:	04812c23          	sw	s0,88(sp)
8000ba5c:	04912a23          	sw	s1,84(sp)
8000ba60:	05212823          	sw	s2,80(sp)
8000ba64:	05312623          	sw	s3,76(sp)
8000ba68:	05412423          	sw	s4,72(sp)
8000ba6c:	05512223          	sw	s5,68(sp)
8000ba70:	05612023          	sw	s6,64(sp)
8000ba74:	03712e23          	sw	s7,60(sp)
8000ba78:	03812c23          	sw	s8,56(sp)
8000ba7c:	03912a23          	sw	s9,52(sp)
8000ba80:	03a12823          	sw	s10,48(sp)
8000ba84:	03b12623          	sw	s11,44(sp)
8000ba88:	02c5d783          	lhu	a5,44(a1)
8000ba8c:	00452c03          	lw	s8,4(a0)
8000ba90:	00c12623          	sw	a2,12(sp)
8000ba94:	fec78713          	addi	a4,a5,-20
8000ba98:	41f75793          	srai	a5,a4,0x1f
8000ba9c:	0077f793          	andi	a5,a5,7
8000baa0:	00e787b3          	add	a5,a5,a4
8000baa4:	4037d793          	srai	a5,a5,0x3
8000baa8:	01079793          	slli	a5,a5,0x10
8000baac:	0107d793          	srli	a5,a5,0x10
8000bab0:	00f12223          	sw	a5,4(sp)
8000bab4:	000c4783          	lbu	a5,0(s8)
8000bab8:	01400713          	li	a4,20
8000babc:	00f7f793          	andi	a5,a5,15
8000bac0:	00279793          	slli	a5,a5,0x2
8000bac4:	2ae79663          	bne	a5,a4,8000bd70 <ip4_frag+0x320>
8000bac8:	00a55703          	lhu	a4,10(a0)
8000bacc:	01300793          	li	a5,19
8000bad0:	00050413          	mv	s0,a0
8000bad4:	ffa00513          	li	a0,-6
8000bad8:	06e7fc63          	bgeu	a5,a4,8000bb50 <ip4_frag+0x100>
8000badc:	007c4783          	lbu	a5,7(s8)
8000bae0:	006c4503          	lbu	a0,6(s8)
8000bae4:	00058c93          	mv	s9,a1
8000bae8:	00879793          	slli	a5,a5,0x8
8000baec:	00a7e533          	or	a0,a5,a0
8000baf0:	ad0fa0ef          	jal	ra,80005dc0 <lwip_htons>
8000baf4:	000027b7          	lui	a5,0x2
8000baf8:	00f577b3          	and	a5,a0,a5
8000bafc:	00f12423          	sw	a5,8(sp)
8000bb00:	00412783          	lw	a5,4(sp)
8000bb04:	00845483          	lhu	s1,8(s0)
8000bb08:	01351b93          	slli	s7,a0,0x13
8000bb0c:	00379793          	slli	a5,a5,0x3
8000bb10:	01079793          	slli	a5,a5,0x10
8000bb14:	0107d793          	srli	a5,a5,0x10
8000bb18:	fec48493          	addi	s1,s1,-20
8000bb1c:	00f12023          	sw	a5,0(sp)
8000bb20:	00f11923          	sh	a5,18(sp)
8000bb24:	8000c7b7          	lui	a5,0x8000c
8000bb28:	01049493          	slli	s1,s1,0x10
8000bb2c:	a1878793          	addi	a5,a5,-1512 # 8000ba18 <_ram_heap_end+0xffff9a18>
8000bb30:	013bdb93          	srli	s7,s7,0x13
8000bb34:	0104d493          	srli	s1,s1,0x10
8000bb38:	01400a13          	li	s4,20
8000bb3c:	00000913          	li	s2,0
8000bb40:	00f12a23          	sw	a5,20(sp)
8000bb44:	a0c18d13          	addi	s10,gp,-1524 # 800032b4 <lwip_stats>
8000bb48:	04049263          	bnez	s1,8000bb8c <ip4_frag+0x13c>
8000bb4c:	00000513          	li	a0,0
8000bb50:	05c12083          	lw	ra,92(sp)
8000bb54:	05812403          	lw	s0,88(sp)
8000bb58:	05412483          	lw	s1,84(sp)
8000bb5c:	05012903          	lw	s2,80(sp)
8000bb60:	04c12983          	lw	s3,76(sp)
8000bb64:	04812a03          	lw	s4,72(sp)
8000bb68:	04412a83          	lw	s5,68(sp)
8000bb6c:	04012b03          	lw	s6,64(sp)
8000bb70:	03c12b83          	lw	s7,60(sp)
8000bb74:	03812c03          	lw	s8,56(sp)
8000bb78:	03412c83          	lw	s9,52(sp)
8000bb7c:	03012d03          	lw	s10,48(sp)
8000bb80:	02c12d83          	lw	s11,44(sp)
8000bb84:	06010113          	addi	sp,sp,96
8000bb88:	00008067          	ret
8000bb8c:	00012783          	lw	a5,0(sp)
8000bb90:	01215a83          	lhu	s5,18(sp)
8000bb94:	00f4f463          	bgeu	s1,a5,8000bb9c <ip4_frag+0x14c>
8000bb98:	00048a93          	mv	s5,s1
8000bb9c:	28000613          	li	a2,640
8000bba0:	01400593          	li	a1,20
8000bba4:	01000513          	li	a0,16
8000bba8:	010a9a93          	slli	s5,s5,0x10
8000bbac:	d0cfb0ef          	jal	ra,800070b8 <pbuf_alloc>
8000bbb0:	010ada93          	srli	s5,s5,0x10
8000bbb4:	00050b13          	mv	s6,a0
8000bbb8:	06050a63          	beqz	a0,8000bc2c <ip4_frag+0x1dc>
8000bbbc:	00452503          	lw	a0,4(a0)
8000bbc0:	01400613          	li	a2,20
8000bbc4:	000c0593          	mv	a1,s8
8000bbc8:	60c020ef          	jal	ra,8000e1d4 <memcpy>
8000bbcc:	004b2983          	lw	s3,4(s6)
8000bbd0:	000a8d93          	mv	s11,s5
8000bbd4:	0c0d8c63          	beqz	s11,8000bcac <ip4_frag+0x25c>
8000bbd8:	00a45783          	lhu	a5,10(s0)
8000bbdc:	414787b3          	sub	a5,a5,s4
8000bbe0:	00078913          	mv	s2,a5
8000bbe4:	01079793          	slli	a5,a5,0x10
8000bbe8:	0107d793          	srli	a5,a5,0x10
8000bbec:	00fdf463          	bgeu	s11,a5,8000bbf4 <ip4_frag+0x1a4>
8000bbf0:	000d8913          	mv	s2,s11
8000bbf4:	01091913          	slli	s2,s2,0x10
8000bbf8:	01095913          	srli	s2,s2,0x10
8000bbfc:	00091863          	bnez	s2,8000bc0c <ip4_frag+0x1bc>
8000bc00:	00042403          	lw	s0,0(s0)
8000bc04:	00000a13          	li	s4,0
8000bc08:	fcdff06f          	j	8000bbd4 <ip4_frag+0x184>
8000bc0c:	800037b7          	lui	a5,0x80003
8000bc10:	2bd00613          	li	a2,701
8000bc14:	d5878593          	addi	a1,a5,-680 # 80002d58 <_ram_heap_end+0xffff0d58>
8000bc18:	00200513          	li	a0,2
8000bc1c:	addfa0ef          	jal	ra,800066f8 <memp_malloc_fn>
8000bc20:	00051a63          	bnez	a0,8000bc34 <ip4_frag+0x1e4>
8000bc24:	000b0513          	mv	a0,s6
8000bc28:	bbcfb0ef          	jal	ra,80006fe4 <pbuf_free>
8000bc2c:	fff00513          	li	a0,-1
8000bc30:	f21ff06f          	j	8000bb50 <ip4_frag+0x100>
8000bc34:	00442703          	lw	a4,4(s0)
8000bc38:	00050693          	mv	a3,a0
8000bc3c:	00a12c23          	sw	a0,24(sp)
8000bc40:	00090793          	mv	a5,s2
8000bc44:	01470733          	add	a4,a4,s4
8000bc48:	04100613          	li	a2,65
8000bc4c:	00090593          	mv	a1,s2
8000bc50:	00000513          	li	a0,0
8000bc54:	aa4fb0ef          	jal	ra,80006ef8 <pbuf_alloced_custom>
8000bc58:	01812883          	lw	a7,24(sp)
8000bc5c:	00051a63          	bnez	a0,8000bc70 <ip4_frag+0x220>
8000bc60:	00088593          	mv	a1,a7
8000bc64:	00200513          	li	a0,2
8000bc68:	ac9fa0ef          	jal	ra,80006730 <memp_free>
8000bc6c:	fb9ff06f          	j	8000bc24 <ip4_frag+0x1d4>
8000bc70:	00a12c23          	sw	a0,24(sp)
8000bc74:	00040513          	mv	a0,s0
8000bc78:	01112e23          	sw	a7,28(sp)
8000bc7c:	f50fb0ef          	jal	ra,800073cc <pbuf_ref>
8000bc80:	01c12883          	lw	a7,28(sp)
8000bc84:	01412783          	lw	a5,20(sp)
8000bc88:	01812583          	lw	a1,24(sp)
8000bc8c:	0088aa23          	sw	s0,20(a7)
8000bc90:	00f8a823          	sw	a5,16(a7)
8000bc94:	000b0513          	mv	a0,s6
8000bc98:	f6cfb0ef          	jal	ra,80007404 <pbuf_cat>
8000bc9c:	412d8833          	sub	a6,s11,s2
8000bca0:	01081d93          	slli	s11,a6,0x10
8000bca4:	010ddd93          	srli	s11,s11,0x10
8000bca8:	f40d9ce3          	bnez	s11,8000bc00 <ip4_frag+0x1b0>
8000bcac:	02ccd783          	lhu	a5,44(s9)
8000bcb0:	01490a33          	add	s4,s2,s4
8000bcb4:	010a1a13          	slli	s4,s4,0x10
8000bcb8:	013b9513          	slli	a0,s7,0x13
8000bcbc:	fed78793          	addi	a5,a5,-19
8000bcc0:	010a5a13          	srli	s4,s4,0x10
8000bcc4:	01355513          	srli	a0,a0,0x13
8000bcc8:	00f4d663          	bge	s1,a5,8000bcd4 <ip4_frag+0x284>
8000bccc:	00812783          	lw	a5,8(sp)
8000bcd0:	00078663          	beqz	a5,8000bcdc <ip4_frag+0x28c>
8000bcd4:	000027b7          	lui	a5,0x2
8000bcd8:	00f56533          	or	a0,a0,a5
8000bcdc:	8e4fa0ef          	jal	ra,80005dc0 <lwip_htons>
8000bce0:	00a98323          	sb	a0,6(s3)
8000bce4:	00855513          	srli	a0,a0,0x8
8000bce8:	00a983a3          	sb	a0,7(s3)
8000bcec:	014a8513          	addi	a0,s5,20
8000bcf0:	01051513          	slli	a0,a0,0x10
8000bcf4:	01055513          	srli	a0,a0,0x10
8000bcf8:	8c8fa0ef          	jal	ra,80005dc0 <lwip_htons>
8000bcfc:	00a98123          	sb	a0,2(s3)
8000bd00:	00855513          	srli	a0,a0,0x8
8000bd04:	00a981a3          	sb	a0,3(s3)
8000bd08:	01400593          	li	a1,20
8000bd0c:	00098523          	sb	zero,10(s3)
8000bd10:	000985a3          	sb	zero,11(s3)
8000bd14:	00098513          	mv	a0,s3
8000bd18:	e9cfa0ef          	jal	ra,800063b4 <inet_chksum>
8000bd1c:	00a98523          	sb	a0,10(s3)
8000bd20:	00855513          	srli	a0,a0,0x8
8000bd24:	00a985a3          	sb	a0,11(s3)
8000bd28:	014ca783          	lw	a5,20(s9)
8000bd2c:	00c12603          	lw	a2,12(sp)
8000bd30:	000b0593          	mv	a1,s6
8000bd34:	000c8513          	mv	a0,s9
8000bd38:	000780e7          	jalr	a5 # 2000 <_stack_size+0x1800>
8000bd3c:	060d2783          	lw	a5,96(s10)
8000bd40:	000b0513          	mv	a0,s6
8000bd44:	415484b3          	sub	s1,s1,s5
8000bd48:	00178793          	addi	a5,a5,1
8000bd4c:	06fd2023          	sw	a5,96(s10)
8000bd50:	a94fb0ef          	jal	ra,80006fe4 <pbuf_free>
8000bd54:	00412783          	lw	a5,4(sp)
8000bd58:	01049493          	slli	s1,s1,0x10
8000bd5c:	0104d493          	srli	s1,s1,0x10
8000bd60:	00fb8bb3          	add	s7,s7,a5
8000bd64:	010b9b93          	slli	s7,s7,0x10
8000bd68:	010bdb93          	srli	s7,s7,0x10
8000bd6c:	dddff06f          	j	8000bb48 <ip4_frag+0xf8>
8000bd70:	ffa00513          	li	a0,-6
8000bd74:	dddff06f          	j	8000bb50 <ip4_frag+0x100>

8000bd78 <ip4_input_accept>:
8000bd78:	03554783          	lbu	a5,53(a0)
8000bd7c:	0017f793          	andi	a5,a5,1
8000bd80:	04078063          	beqz	a5,8000bdc0 <ip4_input_accept+0x48>
8000bd84:	00452703          	lw	a4,4(a0)
8000bd88:	00050593          	mv	a1,a0
8000bd8c:	00000513          	li	a0,0
8000bd90:	02070c63          	beqz	a4,8000bdc8 <ip4_input_accept+0x50>
8000bd94:	a081a783          	lw	a5,-1528(gp) # 800032b0 <ip_data+0x14>
8000bd98:	00100513          	li	a0,1
8000bd9c:	02f70663          	beq	a4,a5,8000bdc8 <ip4_input_accept+0x50>
8000bda0:	ff010113          	addi	sp,sp,-16
8000bda4:	00078513          	mv	a0,a5
8000bda8:	00112623          	sw	ra,12(sp)
8000bdac:	7e4000ef          	jal	ra,8000c590 <ip4_addr_isbroadcast_u32>
8000bdb0:	00c12083          	lw	ra,12(sp)
8000bdb4:	00a03533          	snez	a0,a0
8000bdb8:	01010113          	addi	sp,sp,16
8000bdbc:	00008067          	ret
8000bdc0:	00000513          	li	a0,0
8000bdc4:	00008067          	ret
8000bdc8:	00008067          	ret

8000bdcc <ip4_route>:
8000bdcc:	8d41a783          	lw	a5,-1836(gp) # 8000317c <netif_list>
8000bdd0:	04079463          	bnez	a5,8000be18 <ip4_route+0x4c>
8000bdd4:	8d01a703          	lw	a4,-1840(gp) # 80003178 <netif_default>
8000bdd8:	02070463          	beqz	a4,8000be00 <ip4_route+0x34>
8000bddc:	03574683          	lbu	a3,53(a4)
8000bde0:	00500613          	li	a2,5
8000bde4:	0056f693          	andi	a3,a3,5
8000bde8:	00c69c63          	bne	a3,a2,8000be00 <ip4_route+0x34>
8000bdec:	00472683          	lw	a3,4(a4)
8000bdf0:	00068863          	beqz	a3,8000be00 <ip4_route+0x34>
8000bdf4:	00054603          	lbu	a2,0(a0)
8000bdf8:	07f00693          	li	a3,127
8000bdfc:	06d61463          	bne	a2,a3,8000be64 <ip4_route+0x98>
8000be00:	a0c18713          	addi	a4,gp,-1524 # 800032b4 <lwip_stats>
8000be04:	0ac72683          	lw	a3,172(a4)
8000be08:	00168693          	addi	a3,a3,1
8000be0c:	0ad72623          	sw	a3,172(a4)
8000be10:	00078513          	mv	a0,a5
8000be14:	00008067          	ret
8000be18:	0357c683          	lbu	a3,53(a5)
8000be1c:	0016f713          	andi	a4,a3,1
8000be20:	02070e63          	beqz	a4,8000be5c <ip4_route+0x90>
8000be24:	0026d713          	srli	a4,a3,0x2
8000be28:	00177713          	andi	a4,a4,1
8000be2c:	02070863          	beqz	a4,8000be5c <ip4_route+0x90>
8000be30:	0047a703          	lw	a4,4(a5)
8000be34:	02070463          	beqz	a4,8000be5c <ip4_route+0x90>
8000be38:	00052603          	lw	a2,0(a0)
8000be3c:	0087a583          	lw	a1,8(a5)
8000be40:	00c74733          	xor	a4,a4,a2
8000be44:	00b77733          	and	a4,a4,a1
8000be48:	fc0704e3          	beqz	a4,8000be10 <ip4_route+0x44>
8000be4c:	0026f693          	andi	a3,a3,2
8000be50:	00069663          	bnez	a3,8000be5c <ip4_route+0x90>
8000be54:	00c7a703          	lw	a4,12(a5)
8000be58:	fae60ce3          	beq	a2,a4,8000be10 <ip4_route+0x44>
8000be5c:	0007a783          	lw	a5,0(a5)
8000be60:	f71ff06f          	j	8000bdd0 <ip4_route+0x4>
8000be64:	00070793          	mv	a5,a4
8000be68:	fa9ff06f          	j	8000be10 <ip4_route+0x44>

8000be6c <ip4_input>:
8000be6c:	fd010113          	addi	sp,sp,-48
8000be70:	02812423          	sw	s0,40(sp)
8000be74:	03212023          	sw	s2,32(sp)
8000be78:	02112623          	sw	ra,44(sp)
8000be7c:	02912223          	sw	s1,36(sp)
8000be80:	01312e23          	sw	s3,28(sp)
8000be84:	01412c23          	sw	s4,24(sp)
8000be88:	01512a23          	sw	s5,20(sp)
8000be8c:	01612823          	sw	s6,16(sp)
8000be90:	01712623          	sw	s7,12(sp)
8000be94:	01812423          	sw	s8,8(sp)
8000be98:	a0c18913          	addi	s2,gp,-1524 # 800032b4 <lwip_stats>
8000be9c:	09492783          	lw	a5,148(s2)
8000bea0:	00178793          	addi	a5,a5,1
8000bea4:	08f92a23          	sw	a5,148(s2)
8000bea8:	00452483          	lw	s1,4(a0)
8000beac:	00400793          	li	a5,4
8000beb0:	0004cb03          	lbu	s6,0(s1)
8000beb4:	004b5713          	srli	a4,s6,0x4
8000beb8:	04f70a63          	beq	a4,a5,8000bf0c <ip4_input+0xa0>
8000bebc:	928fb0ef          	jal	ra,80006fe4 <pbuf_free>
8000bec0:	0b892783          	lw	a5,184(s2)
8000bec4:	00178793          	addi	a5,a5,1
8000bec8:	0af92c23          	sw	a5,184(s2)
8000becc:	09c92783          	lw	a5,156(s2)
8000bed0:	00178793          	addi	a5,a5,1
8000bed4:	08f92e23          	sw	a5,156(s2)
8000bed8:	02c12083          	lw	ra,44(sp)
8000bedc:	02812403          	lw	s0,40(sp)
8000bee0:	02412483          	lw	s1,36(sp)
8000bee4:	02012903          	lw	s2,32(sp)
8000bee8:	01c12983          	lw	s3,28(sp)
8000beec:	01812a03          	lw	s4,24(sp)
8000bef0:	01412a83          	lw	s5,20(sp)
8000bef4:	01012b03          	lw	s6,16(sp)
8000bef8:	00c12b83          	lw	s7,12(sp)
8000befc:	00812c03          	lw	s8,8(sp)
8000bf00:	00000513          	li	a0,0
8000bf04:	03010113          	addi	sp,sp,48
8000bf08:	00008067          	ret
8000bf0c:	0034c783          	lbu	a5,3(s1)
8000bf10:	00050993          	mv	s3,a0
8000bf14:	0024c503          	lbu	a0,2(s1)
8000bf18:	00879793          	slli	a5,a5,0x8
8000bf1c:	00058a93          	mv	s5,a1
8000bf20:	00a7e533          	or	a0,a5,a0
8000bf24:	e9df90ef          	jal	ra,80005dc0 <lwip_htons>
8000bf28:	00fb7b13          	andi	s6,s6,15
8000bf2c:	0089d783          	lhu	a5,8(s3)
8000bf30:	002b1b13          	slli	s6,s6,0x2
8000bf34:	010b1913          	slli	s2,s6,0x10
8000bf38:	a0c18413          	addi	s0,gp,-1524 # 800032b4 <lwip_stats>
8000bf3c:	01095913          	srli	s2,s2,0x10
8000bf40:	00050a13          	mv	s4,a0
8000bf44:	00f57863          	bgeu	a0,a5,8000bf54 <ip4_input+0xe8>
8000bf48:	00050593          	mv	a1,a0
8000bf4c:	00098513          	mv	a0,s3
8000bf50:	b38fb0ef          	jal	ra,80007288 <pbuf_realloc>
8000bf54:	00a9d783          	lhu	a5,10(s3)
8000bf58:	0127ea63          	bltu	a5,s2,8000bf6c <ip4_input+0x100>
8000bf5c:	0089d783          	lhu	a5,8(s3)
8000bf60:	0147e663          	bltu	a5,s4,8000bf6c <ip4_input+0x100>
8000bf64:	01300793          	li	a5,19
8000bf68:	0327e463          	bltu	a5,s2,8000bf90 <ip4_input+0x124>
8000bf6c:	00098513          	mv	a0,s3
8000bf70:	874fb0ef          	jal	ra,80006fe4 <pbuf_free>
8000bf74:	0a442783          	lw	a5,164(s0)
8000bf78:	00178793          	addi	a5,a5,1
8000bf7c:	0af42223          	sw	a5,164(s0)
8000bf80:	09c42783          	lw	a5,156(s0)
8000bf84:	00178793          	addi	a5,a5,1
8000bf88:	08f42e23          	sw	a5,156(s0)
8000bf8c:	f4dff06f          	j	8000bed8 <ip4_input+0x6c>
8000bf90:	00090593          	mv	a1,s2
8000bf94:	00048513          	mv	a0,s1
8000bf98:	c1cfa0ef          	jal	ra,800063b4 <inet_chksum>
8000bf9c:	00050e63          	beqz	a0,8000bfb8 <ip4_input+0x14c>
8000bfa0:	00098513          	mv	a0,s3
8000bfa4:	840fb0ef          	jal	ra,80006fe4 <pbuf_free>
8000bfa8:	0a042783          	lw	a5,160(s0)
8000bfac:	00178793          	addi	a5,a5,1
8000bfb0:	0af42023          	sw	a5,160(s0)
8000bfb4:	fcdff06f          	j	8000bf80 <ip4_input+0x114>
8000bfb8:	0114c703          	lbu	a4,17(s1)
8000bfbc:	0104c783          	lbu	a5,16(s1)
8000bfc0:	00871713          	slli	a4,a4,0x8
8000bfc4:	00f76733          	or	a4,a4,a5
8000bfc8:	0124c783          	lbu	a5,18(s1)
8000bfcc:	9f418613          	addi	a2,gp,-1548 # 8000329c <ip_data>
8000bfd0:	9f418913          	addi	s2,gp,-1548 # 8000329c <ip_data>
8000bfd4:	01079793          	slli	a5,a5,0x10
8000bfd8:	00e7e733          	or	a4,a5,a4
8000bfdc:	0134c783          	lbu	a5,19(s1)
8000bfe0:	01879793          	slli	a5,a5,0x18
8000bfe4:	00e7e7b3          	or	a5,a5,a4
8000bfe8:	00f62a23          	sw	a5,20(a2)
8000bfec:	00d4c683          	lbu	a3,13(s1)
8000bff0:	00c4c703          	lbu	a4,12(s1)
8000bff4:	0f07f793          	andi	a5,a5,240
8000bff8:	00869693          	slli	a3,a3,0x8
8000bffc:	00e6e6b3          	or	a3,a3,a4
8000c000:	00e4c703          	lbu	a4,14(s1)
8000c004:	01071713          	slli	a4,a4,0x10
8000c008:	00d766b3          	or	a3,a4,a3
8000c00c:	00f4c703          	lbu	a4,15(s1)
8000c010:	01871713          	slli	a4,a4,0x18
8000c014:	00d76733          	or	a4,a4,a3
8000c018:	00e62823          	sw	a4,16(a2)
8000c01c:	0e000713          	li	a4,224
8000c020:	06e79063          	bne	a5,a4,8000c080 <ip4_input+0x214>
8000c024:	035ac783          	lbu	a5,53(s5)
8000c028:	0017f793          	andi	a5,a5,1
8000c02c:	00079c63          	bnez	a5,8000c044 <ip4_input+0x1d8>
8000c030:	0094c703          	lbu	a4,9(s1)
8000c034:	01100793          	li	a5,17
8000c038:	08f70663          	beq	a4,a5,8000c0c4 <ip4_input+0x258>
8000c03c:	00000a13          	li	s4,0
8000c040:	0100006f          	j	8000c050 <ip4_input+0x1e4>
8000c044:	004aa783          	lw	a5,4(s5)
8000c048:	fe0784e3          	beqz	a5,8000c030 <ip4_input+0x1c4>
8000c04c:	000a8a13          	mv	s4,s5
8000c050:	01092503          	lw	a0,16(s2)
8000c054:	08050a63          	beqz	a0,8000c0e8 <ip4_input+0x27c>
8000c058:	000a8593          	mv	a1,s5
8000c05c:	534000ef          	jal	ra,8000c590 <ip4_addr_isbroadcast_u32>
8000c060:	00051a63          	bnez	a0,8000c074 <ip4_input+0x208>
8000c064:	01092783          	lw	a5,16(s2)
8000c068:	0e000713          	li	a4,224
8000c06c:	0f07f793          	andi	a5,a5,240
8000c070:	06e79c63          	bne	a5,a4,8000c0e8 <ip4_input+0x27c>
8000c074:	00098513          	mv	a0,s3
8000c078:	f6dfa0ef          	jal	ra,80006fe4 <pbuf_free>
8000c07c:	f05ff06f          	j	8000bf80 <ip4_input+0x114>
8000c080:	000a8513          	mv	a0,s5
8000c084:	cf5ff0ef          	jal	ra,8000bd78 <ip4_input_accept>
8000c088:	02051a63          	bnez	a0,8000c0bc <ip4_input+0x250>
8000c08c:	01494703          	lbu	a4,20(s2)
8000c090:	07f00793          	li	a5,127
8000c094:	f8f70ee3          	beq	a4,a5,8000c030 <ip4_input+0x1c4>
8000c098:	8d41aa03          	lw	s4,-1836(gp) # 8000317c <netif_list>
8000c09c:	f80a0ae3          	beqz	s4,8000c030 <ip4_input+0x1c4>
8000c0a0:	015a1663          	bne	s4,s5,8000c0ac <ip4_input+0x240>
8000c0a4:	000a2a03          	lw	s4,0(s4)
8000c0a8:	ff5ff06f          	j	8000c09c <ip4_input+0x230>
8000c0ac:	000a0513          	mv	a0,s4
8000c0b0:	cc9ff0ef          	jal	ra,8000bd78 <ip4_input_accept>
8000c0b4:	fe0508e3          	beqz	a0,8000c0a4 <ip4_input+0x238>
8000c0b8:	f99ff06f          	j	8000c050 <ip4_input+0x1e4>
8000c0bc:	f80a98e3          	bnez	s5,8000c04c <ip4_input+0x1e0>
8000c0c0:	f71ff06f          	j	8000c030 <ip4_input+0x1c4>
8000c0c4:	01648733          	add	a4,s1,s6
8000c0c8:	00374783          	lbu	a5,3(a4)
8000c0cc:	00274683          	lbu	a3,2(a4)
8000c0d0:	00004737          	lui	a4,0x4
8000c0d4:	00879793          	slli	a5,a5,0x8
8000c0d8:	00d7e7b3          	or	a5,a5,a3
8000c0dc:	40070713          	addi	a4,a4,1024 # 4400 <_stack_size+0x3c00>
8000c0e0:	f4e79ee3          	bne	a5,a4,8000c03c <ip4_input+0x1d0>
8000c0e4:	000a8a13          	mv	s4,s5
8000c0e8:	000a1e63          	bnez	s4,8000c104 <ip4_input+0x298>
8000c0ec:	09c42783          	lw	a5,156(s0)
8000c0f0:	00098513          	mv	a0,s3
8000c0f4:	00178793          	addi	a5,a5,1
8000c0f8:	08f42e23          	sw	a5,156(s0)
8000c0fc:	ee9fa0ef          	jal	ra,80006fe4 <pbuf_free>
8000c100:	dd9ff06f          	j	8000bed8 <ip4_input+0x6c>
8000c104:	0064c783          	lbu	a5,6(s1)
8000c108:	0074c703          	lbu	a4,7(s1)
8000c10c:	03f7f793          	andi	a5,a5,63
8000c110:	00871713          	slli	a4,a4,0x8
8000c114:	00e7e7b3          	or	a5,a5,a4
8000c118:	00078e63          	beqz	a5,8000c134 <ip4_input+0x2c8>
8000c11c:	00098513          	mv	a0,s3
8000c120:	ec5fa0ef          	jal	ra,80006fe4 <pbuf_free>
8000c124:	0b442783          	lw	a5,180(s0)
8000c128:	00178793          	addi	a5,a5,1
8000c12c:	0af42a23          	sw	a5,180(s0)
8000c130:	e51ff06f          	j	8000bf80 <ip4_input+0x114>
8000c134:	01492023          	sw	s4,0(s2)
8000c138:	01592223          	sw	s5,4(s2)
8000c13c:	00992423          	sw	s1,8(s2)
8000c140:	0004c783          	lbu	a5,0(s1)
8000c144:	000a8593          	mv	a1,s5
8000c148:	00098513          	mv	a0,s3
8000c14c:	00f7f793          	andi	a5,a5,15
8000c150:	00279793          	slli	a5,a5,0x2
8000c154:	00f91623          	sh	a5,12(s2)
8000c158:	00100c13          	li	s8,1
8000c15c:	a7dfb0ef          	jal	ra,80007bd8 <raw_input>
8000c160:	00050b93          	mv	s7,a0
8000c164:	03850663          	beq	a0,s8,8000c190 <ip4_input+0x324>
8000c168:	000b0593          	mv	a1,s6
8000c16c:	00098513          	mv	a0,s3
8000c170:	dedfa0ef          	jal	ra,80006f5c <pbuf_remove_header>
8000c174:	0094c783          	lbu	a5,9(s1)
8000c178:	03878a63          	beq	a5,s8,8000c1ac <ip4_input+0x340>
8000c17c:	01100713          	li	a4,17
8000c180:	02e79e63          	bne	a5,a4,8000c1bc <ip4_input+0x350>
8000c184:	000a8593          	mv	a1,s5
8000c188:	00098513          	mv	a0,s3
8000c18c:	a40fc0ef          	jal	ra,800083cc <udp_input>
8000c190:	00092023          	sw	zero,0(s2)
8000c194:	00092223          	sw	zero,4(s2)
8000c198:	00092423          	sw	zero,8(s2)
8000c19c:	00091623          	sh	zero,12(s2)
8000c1a0:	00092823          	sw	zero,16(s2)
8000c1a4:	00092a23          	sw	zero,20(s2)
8000c1a8:	d31ff06f          	j	8000bed8 <ip4_input+0x6c>
8000c1ac:	000a8593          	mv	a1,s5
8000c1b0:	00098513          	mv	a0,s3
8000c1b4:	c18ff0ef          	jal	ra,8000b5cc <icmp_input>
8000c1b8:	fd9ff06f          	j	8000c190 <ip4_input+0x324>
8000c1bc:	00200793          	li	a5,2
8000c1c0:	04fb8a63          	beq	s7,a5,8000c214 <ip4_input+0x3a8>
8000c1c4:	01492503          	lw	a0,20(s2)
8000c1c8:	000a0593          	mv	a1,s4
8000c1cc:	3c4000ef          	jal	ra,8000c590 <ip4_addr_isbroadcast_u32>
8000c1d0:	02051663          	bnez	a0,8000c1fc <ip4_input+0x390>
8000c1d4:	01492783          	lw	a5,20(s2)
8000c1d8:	0e000713          	li	a4,224
8000c1dc:	0f07f793          	andi	a5,a5,240
8000c1e0:	00e78e63          	beq	a5,a4,8000c1fc <ip4_input+0x390>
8000c1e4:	000b0593          	mv	a1,s6
8000c1e8:	00098513          	mv	a0,s3
8000c1ec:	de5fa0ef          	jal	ra,80006fd0 <pbuf_header_force>
8000c1f0:	00200593          	li	a1,2
8000c1f4:	00098513          	mv	a0,s3
8000c1f8:	ef8ff0ef          	jal	ra,8000b8f0 <icmp_dest_unreach>
8000c1fc:	0b042783          	lw	a5,176(s0)
8000c200:	00178793          	addi	a5,a5,1
8000c204:	0af42823          	sw	a5,176(s0)
8000c208:	09c42783          	lw	a5,156(s0)
8000c20c:	00178793          	addi	a5,a5,1
8000c210:	08f42e23          	sw	a5,156(s0)
8000c214:	00098513          	mv	a0,s3
8000c218:	dcdfa0ef          	jal	ra,80006fe4 <pbuf_free>
8000c21c:	f75ff06f          	j	8000c190 <ip4_input+0x324>

8000c220 <ip4_output_if_src>:
8000c220:	fc010113          	addi	sp,sp,-64
8000c224:	03212823          	sw	s2,48(sp)
8000c228:	03412423          	sw	s4,40(sp)
8000c22c:	03512223          	sw	s5,36(sp)
8000c230:	02112e23          	sw	ra,60(sp)
8000c234:	02812c23          	sw	s0,56(sp)
8000c238:	02912a23          	sw	s1,52(sp)
8000c23c:	03312623          	sw	s3,44(sp)
8000c240:	03612023          	sw	s6,32(sp)
8000c244:	00d12623          	sw	a3,12(sp)
8000c248:	00f12423          	sw	a5,8(sp)
8000c24c:	00c12223          	sw	a2,4(sp)
8000c250:	00050913          	mv	s2,a0
8000c254:	00080a13          	mv	s4,a6
8000c258:	a0c18a93          	addi	s5,gp,-1524 # 800032b4 <lwip_stats>
8000c25c:	1a060863          	beqz	a2,8000c40c <ip4_output_if_src+0x1ec>
8000c260:	00058993          	mv	s3,a1
8000c264:	01400593          	li	a1,20
8000c268:	00070493          	mv	s1,a4
8000c26c:	ce1fa0ef          	jal	ra,80006f4c <pbuf_add_header>
8000c270:	00412603          	lw	a2,4(sp)
8000c274:	00812783          	lw	a5,8(sp)
8000c278:	00c12683          	lw	a3,12(sp)
8000c27c:	02050e63          	beqz	a0,8000c2b8 <ip4_output_if_src+0x98>
8000c280:	0b8aa783          	lw	a5,184(s5)
8000c284:	ffe00513          	li	a0,-2
8000c288:	00178793          	addi	a5,a5,1
8000c28c:	0afaac23          	sw	a5,184(s5)
8000c290:	03c12083          	lw	ra,60(sp)
8000c294:	03812403          	lw	s0,56(sp)
8000c298:	03412483          	lw	s1,52(sp)
8000c29c:	03012903          	lw	s2,48(sp)
8000c2a0:	02c12983          	lw	s3,44(sp)
8000c2a4:	02812a03          	lw	s4,40(sp)
8000c2a8:	02412a83          	lw	s5,36(sp)
8000c2ac:	02012b03          	lw	s6,32(sp)
8000c2b0:	04010113          	addi	sp,sp,64
8000c2b4:	00008067          	ret
8000c2b8:	00492403          	lw	s0,4(s2)
8000c2bc:	00c12223          	sw	a2,4(sp)
8000c2c0:	00d40423          	sb	a3,8(s0)
8000c2c4:	00f404a3          	sb	a5,9(s0)
8000c2c8:	00869693          	slli	a3,a3,0x8
8000c2cc:	00f6e7b3          	or	a5,a3,a5
8000c2d0:	00062683          	lw	a3,0(a2)
8000c2d4:	009400a3          	sb	s1,1(s0)
8000c2d8:	00849493          	slli	s1,s1,0x8
8000c2dc:	0086d593          	srli	a1,a3,0x8
8000c2e0:	00d40823          	sb	a3,16(s0)
8000c2e4:	00b408a3          	sb	a1,17(s0)
8000c2e8:	0186d513          	srli	a0,a3,0x18
8000c2ec:	0106d593          	srli	a1,a3,0x10
8000c2f0:	01069693          	slli	a3,a3,0x10
8000c2f4:	0106d693          	srli	a3,a3,0x10
8000c2f8:	00b686b3          	add	a3,a3,a1
8000c2fc:	00a409a3          	sb	a0,19(s0)
8000c300:	0454e493          	ori	s1,s1,69
8000c304:	04500513          	li	a0,69
8000c308:	00b40923          	sb	a1,18(s0)
8000c30c:	00a40023          	sb	a0,0(s0)
8000c310:	00d484b3          	add	s1,s1,a3
8000c314:	00879693          	slli	a3,a5,0x8
8000c318:	4087d793          	srai	a5,a5,0x8
8000c31c:	00f6e7b3          	or	a5,a3,a5
8000c320:	00895503          	lhu	a0,8(s2)
8000c324:	01079793          	slli	a5,a5,0x10
8000c328:	0107d793          	srli	a5,a5,0x10
8000c32c:	00f484b3          	add	s1,s1,a5
8000c330:	a91f90ef          	jal	ra,80005dc0 <lwip_htons>
8000c334:	00855793          	srli	a5,a0,0x8
8000c338:	00a40123          	sb	a0,2(s0)
8000c33c:	009504b3          	add	s1,a0,s1
8000c340:	8f81d503          	lhu	a0,-1800(gp) # 800031a0 <ip_id>
8000c344:	00f401a3          	sb	a5,3(s0)
8000c348:	00040323          	sb	zero,6(s0)
8000c34c:	000403a3          	sb	zero,7(s0)
8000c350:	a71f90ef          	jal	ra,80005dc0 <lwip_htons>
8000c354:	00855793          	srli	a5,a0,0x8
8000c358:	00f402a3          	sb	a5,5(s0)
8000c35c:	8f81d783          	lhu	a5,-1800(gp) # 800031a0 <ip_id>
8000c360:	00a40223          	sb	a0,4(s0)
8000c364:	00412603          	lw	a2,4(sp)
8000c368:	00178793          	addi	a5,a5,1
8000c36c:	8ef19c23          	sh	a5,-1800(gp) # 800031a0 <ip_id>
8000c370:	00950533          	add	a0,a0,s1
8000c374:	08099863          	bnez	s3,8000c404 <ip4_output_if_src+0x1e4>
8000c378:	8481a703          	lw	a4,-1976(gp) # 800030f0 <ip_addr_any>
8000c37c:	01875693          	srli	a3,a4,0x18
8000c380:	00d407a3          	sb	a3,15(s0)
8000c384:	000106b7          	lui	a3,0x10
8000c388:	00875793          	srli	a5,a4,0x8
8000c38c:	fff68693          	addi	a3,a3,-1 # ffff <_stack_size+0xf7ff>
8000c390:	00e40623          	sb	a4,12(s0)
8000c394:	00f406a3          	sb	a5,13(s0)
8000c398:	01075793          	srli	a5,a4,0x10
8000c39c:	00d77733          	and	a4,a4,a3
8000c3a0:	00a70733          	add	a4,a4,a0
8000c3a4:	00e78733          	add	a4,a5,a4
8000c3a8:	00f40723          	sb	a5,14(s0)
8000c3ac:	01075793          	srli	a5,a4,0x10
8000c3b0:	00d77733          	and	a4,a4,a3
8000c3b4:	00e78733          	add	a4,a5,a4
8000c3b8:	01075793          	srli	a5,a4,0x10
8000c3bc:	00e787b3          	add	a5,a5,a4
8000c3c0:	fff7c793          	not	a5,a5
8000c3c4:	01079793          	slli	a5,a5,0x10
8000c3c8:	0107d793          	srli	a5,a5,0x10
8000c3cc:	00f40523          	sb	a5,10(s0)
8000c3d0:	0087d793          	srli	a5,a5,0x8
8000c3d4:	00f405a3          	sb	a5,11(s0)
8000c3d8:	090aa783          	lw	a5,144(s5)
8000c3dc:	00178793          	addi	a5,a5,1
8000c3e0:	08faa823          	sw	a5,144(s5)
8000c3e4:	02ca5783          	lhu	a5,44(s4)
8000c3e8:	06078463          	beqz	a5,8000c450 <ip4_output_if_src+0x230>
8000c3ec:	00895703          	lhu	a4,8(s2)
8000c3f0:	06e7f063          	bgeu	a5,a4,8000c450 <ip4_output_if_src+0x230>
8000c3f4:	000a0593          	mv	a1,s4
8000c3f8:	00090513          	mv	a0,s2
8000c3fc:	e54ff0ef          	jal	ra,8000ba50 <ip4_frag>
8000c400:	e91ff06f          	j	8000c290 <ip4_output_if_src+0x70>
8000c404:	0009a703          	lw	a4,0(s3)
8000c408:	f75ff06f          	j	8000c37c <ip4_output_if_src+0x15c>
8000c40c:	00a55703          	lhu	a4,10(a0)
8000c410:	01300793          	li	a5,19
8000c414:	e6e7f6e3          	bgeu	a5,a4,8000c280 <ip4_output_if_src+0x60>
8000c418:	00452683          	lw	a3,4(a0)
8000c41c:	01c10613          	addi	a2,sp,28
8000c420:	0116c703          	lbu	a4,17(a3)
8000c424:	0106c783          	lbu	a5,16(a3)
8000c428:	00871713          	slli	a4,a4,0x8
8000c42c:	00f76733          	or	a4,a4,a5
8000c430:	0126c783          	lbu	a5,18(a3)
8000c434:	01079793          	slli	a5,a5,0x10
8000c438:	00e7e733          	or	a4,a5,a4
8000c43c:	0136c783          	lbu	a5,19(a3)
8000c440:	01879793          	slli	a5,a5,0x18
8000c444:	00e7e7b3          	or	a5,a5,a4
8000c448:	00f12e23          	sw	a5,28(sp)
8000c44c:	f8dff06f          	j	8000c3d8 <ip4_output_if_src+0x1b8>
8000c450:	014a2783          	lw	a5,20(s4)
8000c454:	00090593          	mv	a1,s2
8000c458:	000a0513          	mv	a0,s4
8000c45c:	000780e7          	jalr	a5
8000c460:	e31ff06f          	j	8000c290 <ip4_output_if_src+0x70>

8000c464 <ip4_output_if>:
8000c464:	00060a63          	beqz	a2,8000c478 <ip4_output_if+0x14>
8000c468:	00058663          	beqz	a1,8000c474 <ip4_output_if+0x10>
8000c46c:	0005a883          	lw	a7,0(a1)
8000c470:	00089463          	bnez	a7,8000c478 <ip4_output_if+0x14>
8000c474:	00480593          	addi	a1,a6,4
8000c478:	da9ff06f          	j	8000c220 <ip4_output_if_src>

8000c47c <ip4_output>:
8000c47c:	fd010113          	addi	sp,sp,-48
8000c480:	02812423          	sw	s0,40(sp)
8000c484:	00050413          	mv	s0,a0
8000c488:	00060513          	mv	a0,a2
8000c48c:	00b12e23          	sw	a1,28(sp)
8000c490:	00d12c23          	sw	a3,24(sp)
8000c494:	00e12a23          	sw	a4,20(sp)
8000c498:	00f12823          	sw	a5,16(sp)
8000c49c:	00c12623          	sw	a2,12(sp)
8000c4a0:	02112623          	sw	ra,44(sp)
8000c4a4:	929ff0ef          	jal	ra,8000bdcc <ip4_route>
8000c4a8:	00c12603          	lw	a2,12(sp)
8000c4ac:	01012783          	lw	a5,16(sp)
8000c4b0:	01412703          	lw	a4,20(sp)
8000c4b4:	01812683          	lw	a3,24(sp)
8000c4b8:	01c12583          	lw	a1,28(sp)
8000c4bc:	00050e63          	beqz	a0,8000c4d8 <ip4_output+0x5c>
8000c4c0:	00050813          	mv	a6,a0
8000c4c4:	00040513          	mv	a0,s0
8000c4c8:	02812403          	lw	s0,40(sp)
8000c4cc:	02c12083          	lw	ra,44(sp)
8000c4d0:	03010113          	addi	sp,sp,48
8000c4d4:	f91ff06f          	j	8000c464 <ip4_output_if>
8000c4d8:	a0c18793          	addi	a5,gp,-1524 # 800032b4 <lwip_stats>
8000c4dc:	0ac7a703          	lw	a4,172(a5)
8000c4e0:	ffc00513          	li	a0,-4
8000c4e4:	00170713          	addi	a4,a4,1
8000c4e8:	0ae7a623          	sw	a4,172(a5)
8000c4ec:	02c12083          	lw	ra,44(sp)
8000c4f0:	02812403          	lw	s0,40(sp)
8000c4f4:	03010113          	addi	sp,sp,48
8000c4f8:	00008067          	ret

8000c4fc <ip4_output_hinted>:
8000c4fc:	fd010113          	addi	sp,sp,-48
8000c500:	02912223          	sw	s1,36(sp)
8000c504:	00050493          	mv	s1,a0
8000c508:	00060513          	mv	a0,a2
8000c50c:	00b12e23          	sw	a1,28(sp)
8000c510:	00d12c23          	sw	a3,24(sp)
8000c514:	00e12a23          	sw	a4,20(sp)
8000c518:	00f12823          	sw	a5,16(sp)
8000c51c:	01012623          	sw	a6,12(sp)
8000c520:	00c12423          	sw	a2,8(sp)
8000c524:	02112623          	sw	ra,44(sp)
8000c528:	02812423          	sw	s0,40(sp)
8000c52c:	8a1ff0ef          	jal	ra,8000bdcc <ip4_route>
8000c530:	00812603          	lw	a2,8(sp)
8000c534:	00c12803          	lw	a6,12(sp)
8000c538:	01012783          	lw	a5,16(sp)
8000c53c:	01412703          	lw	a4,20(sp)
8000c540:	01812683          	lw	a3,24(sp)
8000c544:	01c12583          	lw	a1,28(sp)
8000c548:	02051663          	bnez	a0,8000c574 <ip4_output_hinted+0x78>
8000c54c:	a0c18793          	addi	a5,gp,-1524 # 800032b4 <lwip_stats>
8000c550:	0ac7a703          	lw	a4,172(a5)
8000c554:	ffc00513          	li	a0,-4
8000c558:	00170713          	addi	a4,a4,1
8000c55c:	0ae7a623          	sw	a4,172(a5)
8000c560:	02c12083          	lw	ra,44(sp)
8000c564:	02812403          	lw	s0,40(sp)
8000c568:	02412483          	lw	s1,36(sp)
8000c56c:	03010113          	addi	sp,sp,48
8000c570:	00008067          	ret
8000c574:	03052e23          	sw	a6,60(a0)
8000c578:	00050413          	mv	s0,a0
8000c57c:	00050813          	mv	a6,a0
8000c580:	00048513          	mv	a0,s1
8000c584:	ee1ff0ef          	jal	ra,8000c464 <ip4_output_if>
8000c588:	02042e23          	sw	zero,60(s0)
8000c58c:	fd5ff06f          	j	8000c560 <ip4_output_hinted+0x64>

8000c590 <ip4_addr_isbroadcast_u32>:
8000c590:	fff50693          	addi	a3,a0,-1
8000c594:	ffd00793          	li	a5,-3
8000c598:	00050713          	mv	a4,a0
8000c59c:	04d7e063          	bltu	a5,a3,8000c5dc <ip4_addr_isbroadcast_u32+0x4c>
8000c5a0:	0355c783          	lbu	a5,53(a1)
8000c5a4:	0027f513          	andi	a0,a5,2
8000c5a8:	02050c63          	beqz	a0,8000c5e0 <ip4_addr_isbroadcast_u32+0x50>
8000c5ac:	0045a783          	lw	a5,4(a1)
8000c5b0:	00000513          	li	a0,0
8000c5b4:	02e78663          	beq	a5,a4,8000c5e0 <ip4_addr_isbroadcast_u32+0x50>
8000c5b8:	0085a683          	lw	a3,8(a1)
8000c5bc:	00e7c7b3          	xor	a5,a5,a4
8000c5c0:	00d7f7b3          	and	a5,a5,a3
8000c5c4:	00079e63          	bnez	a5,8000c5e0 <ip4_addr_isbroadcast_u32+0x50>
8000c5c8:	fff6c693          	not	a3,a3
8000c5cc:	00e6f533          	and	a0,a3,a4
8000c5d0:	40d50533          	sub	a0,a0,a3
8000c5d4:	00153513          	seqz	a0,a0
8000c5d8:	00008067          	ret
8000c5dc:	00100513          	li	a0,1
8000c5e0:	00008067          	ret

8000c5e4 <ip4_addr_netmask_valid>:
8000c5e4:	ff010113          	addi	sp,sp,-16
8000c5e8:	00112623          	sw	ra,12(sp)
8000c5ec:	fecf90ef          	jal	ra,80005dd8 <lwip_htonl>
8000c5f0:	02000713          	li	a4,32
8000c5f4:	800007b7          	lui	a5,0x80000
8000c5f8:	00f576b3          	and	a3,a0,a5
8000c5fc:	02068663          	beqz	a3,8000c628 <ip4_addr_netmask_valid+0x44>
8000c600:	fff70713          	addi	a4,a4,-1
8000c604:	0017d793          	srli	a5,a5,0x1
8000c608:	fe0718e3          	bnez	a4,8000c5f8 <ip4_addr_netmask_valid+0x14>
8000c60c:	00100513          	li	a0,1
8000c610:	00c12083          	lw	ra,12(sp)
8000c614:	01010113          	addi	sp,sp,16
8000c618:	00008067          	ret
8000c61c:	00a7f733          	and	a4,a5,a0
8000c620:	00071863          	bnez	a4,8000c630 <ip4_addr_netmask_valid+0x4c>
8000c624:	0017d793          	srli	a5,a5,0x1
8000c628:	fe079ae3          	bnez	a5,8000c61c <ip4_addr_netmask_valid+0x38>
8000c62c:	fe1ff06f          	j	8000c60c <ip4_addr_netmask_valid+0x28>
8000c630:	00000513          	li	a0,0
8000c634:	fddff06f          	j	8000c610 <ip4_addr_netmask_valid+0x2c>

8000c638 <ip4addr_aton>:
8000c638:	fb010113          	addi	sp,sp,-80
8000c63c:	04812423          	sw	s0,72(sp)
8000c640:	05212023          	sw	s2,64(sp)
8000c644:	03312e23          	sw	s3,60(sp)
8000c648:	03512a23          	sw	s5,52(sp)
8000c64c:	03712623          	sw	s7,44(sp)
8000c650:	03812423          	sw	s8,40(sp)
8000c654:	03912223          	sw	s9,36(sp)
8000c658:	03a12023          	sw	s10,32(sp)
8000c65c:	01b12e23          	sw	s11,28(sp)
8000c660:	04112623          	sw	ra,76(sp)
8000c664:	04912223          	sw	s1,68(sp)
8000c668:	03412c23          	sw	s4,56(sp)
8000c66c:	03612823          	sw	s6,48(sp)
8000c670:	00054483          	lbu	s1,0(a0)
8000c674:	00010913          	mv	s2,sp
8000c678:	80003ab7          	lui	s5,0x80003
8000c67c:	00058993          	mv	s3,a1
8000c680:	00090b93          	mv	s7,s2
8000c684:	d79a8a93          	addi	s5,s5,-647 # 80002d79 <_ram_heap_end+0xffff0d79>
8000c688:	03000413          	li	s0,48
8000c68c:	05800c13          	li	s8,88
8000c690:	01000c93          	li	s9,16
8000c694:	00200d13          	li	s10,2
8000c698:	02e00d93          	li	s11,46
8000c69c:	00c10713          	addi	a4,sp,12
8000c6a0:	015487b3          	add	a5,s1,s5
8000c6a4:	0007c783          	lbu	a5,0(a5) # 80000000 <_ram_heap_end+0xfffee000>
8000c6a8:	0047f793          	andi	a5,a5,4
8000c6ac:	1c078a63          	beqz	a5,8000c880 <ip4addr_aton+0x248>
8000c6b0:	00a00b13          	li	s6,10
8000c6b4:	00849c63          	bne	s1,s0,8000c6cc <ip4addr_aton+0x94>
8000c6b8:	00154483          	lbu	s1,1(a0)
8000c6bc:	0df4f793          	andi	a5,s1,223
8000c6c0:	05878463          	beq	a5,s8,8000c708 <ip4addr_aton+0xd0>
8000c6c4:	00150513          	addi	a0,a0,1
8000c6c8:	00800b13          	li	s6,8
8000c6cc:	00050a13          	mv	s4,a0
8000c6d0:	00000513          	li	a0,0
8000c6d4:	009a87b3          	add	a5,s5,s1
8000c6d8:	0007c783          	lbu	a5,0(a5)
8000c6dc:	0047f693          	andi	a3,a5,4
8000c6e0:	02068c63          	beqz	a3,8000c718 <ip4addr_aton+0xe0>
8000c6e4:	00050593          	mv	a1,a0
8000c6e8:	000b0513          	mv	a0,s6
8000c6ec:	441000ef          	jal	ra,8000d32c <__mulsi3>
8000c6f0:	00950533          	add	a0,a0,s1
8000c6f4:	001a4483          	lbu	s1,1(s4)
8000c6f8:	fd050513          	addi	a0,a0,-48
8000c6fc:	00c10713          	addi	a4,sp,12
8000c700:	001a0a13          	addi	s4,s4,1
8000c704:	fd1ff06f          	j	8000c6d4 <ip4addr_aton+0x9c>
8000c708:	00254483          	lbu	s1,2(a0)
8000c70c:	01000b13          	li	s6,16
8000c710:	00250513          	addi	a0,a0,2
8000c714:	fb9ff06f          	j	8000c6cc <ip4addr_aton+0x94>
8000c718:	039b1a63          	bne	s6,s9,8000c74c <ip4addr_aton+0x114>
8000c71c:	0447f693          	andi	a3,a5,68
8000c720:	02068663          	beqz	a3,8000c74c <ip4addr_aton+0x114>
8000c724:	0037f793          	andi	a5,a5,3
8000c728:	00451513          	slli	a0,a0,0x4
8000c72c:	00a48493          	addi	s1,s1,10
8000c730:	06100593          	li	a1,97
8000c734:	01a78463          	beq	a5,s10,8000c73c <ip4addr_aton+0x104>
8000c738:	04100593          	li	a1,65
8000c73c:	40b484b3          	sub	s1,s1,a1
8000c740:	00a4e533          	or	a0,s1,a0
8000c744:	001a4483          	lbu	s1,1(s4)
8000c748:	fb9ff06f          	j	8000c700 <ip4addr_aton+0xc8>
8000c74c:	01b49e63          	bne	s1,s11,8000c768 <ip4addr_aton+0x130>
8000c750:	12e90863          	beq	s2,a4,8000c880 <ip4addr_aton+0x248>
8000c754:	00490913          	addi	s2,s2,4
8000c758:	fea92e23          	sw	a0,-4(s2)
8000c75c:	001a4483          	lbu	s1,1(s4)
8000c760:	001a0513          	addi	a0,s4,1
8000c764:	f3dff06f          	j	8000c6a0 <ip4addr_aton+0x68>
8000c768:	00048863          	beqz	s1,8000c778 <ip4addr_aton+0x140>
8000c76c:	0087f793          	andi	a5,a5,8
8000c770:	00000413          	li	s0,0
8000c774:	02078863          	beqz	a5,8000c7a4 <ip4addr_aton+0x16c>
8000c778:	41790433          	sub	s0,s2,s7
8000c77c:	40245413          	srai	s0,s0,0x2
8000c780:	00140413          	addi	s0,s0,1
8000c784:	00200793          	li	a5,2
8000c788:	0af40263          	beq	s0,a5,8000c82c <ip4addr_aton+0x1f4>
8000c78c:	0487cc63          	blt	a5,s0,8000c7e4 <ip4addr_aton+0x1ac>
8000c790:	00040a63          	beqz	s0,8000c7a4 <ip4addr_aton+0x16c>
8000c794:	00100413          	li	s0,1
8000c798:	00098663          	beqz	s3,8000c7a4 <ip4addr_aton+0x16c>
8000c79c:	e3cf90ef          	jal	ra,80005dd8 <lwip_htonl>
8000c7a0:	00a9a023          	sw	a0,0(s3)
8000c7a4:	00040513          	mv	a0,s0
8000c7a8:	04c12083          	lw	ra,76(sp)
8000c7ac:	04812403          	lw	s0,72(sp)
8000c7b0:	04412483          	lw	s1,68(sp)
8000c7b4:	04012903          	lw	s2,64(sp)
8000c7b8:	03c12983          	lw	s3,60(sp)
8000c7bc:	03812a03          	lw	s4,56(sp)
8000c7c0:	03412a83          	lw	s5,52(sp)
8000c7c4:	03012b03          	lw	s6,48(sp)
8000c7c8:	02c12b83          	lw	s7,44(sp)
8000c7cc:	02812c03          	lw	s8,40(sp)
8000c7d0:	02412c83          	lw	s9,36(sp)
8000c7d4:	02012d03          	lw	s10,32(sp)
8000c7d8:	01c12d83          	lw	s11,28(sp)
8000c7dc:	05010113          	addi	sp,sp,80
8000c7e0:	00008067          	ret
8000c7e4:	00300793          	li	a5,3
8000c7e8:	06f40463          	beq	s0,a5,8000c850 <ip4addr_aton+0x218>
8000c7ec:	00400793          	li	a5,4
8000c7f0:	faf412e3          	bne	s0,a5,8000c794 <ip4addr_aton+0x15c>
8000c7f4:	0ff00613          	li	a2,255
8000c7f8:	00000413          	li	s0,0
8000c7fc:	faa664e3          	bltu	a2,a0,8000c7a4 <ip4addr_aton+0x16c>
8000c800:	00012783          	lw	a5,0(sp)
8000c804:	faf660e3          	bltu	a2,a5,8000c7a4 <ip4addr_aton+0x16c>
8000c808:	00412683          	lw	a3,4(sp)
8000c80c:	f8d66ce3          	bltu	a2,a3,8000c7a4 <ip4addr_aton+0x16c>
8000c810:	00812703          	lw	a4,8(sp)
8000c814:	f8e668e3          	bltu	a2,a4,8000c7a4 <ip4addr_aton+0x16c>
8000c818:	01879793          	slli	a5,a5,0x18
8000c81c:	01069693          	slli	a3,a3,0x10
8000c820:	00d7e7b3          	or	a5,a5,a3
8000c824:	00871713          	slli	a4,a4,0x8
8000c828:	0500006f          	j	8000c878 <ip4addr_aton+0x240>
8000c82c:	010007b7          	lui	a5,0x1000
8000c830:	00000413          	li	s0,0
8000c834:	f6f578e3          	bgeu	a0,a5,8000c7a4 <ip4addr_aton+0x16c>
8000c838:	00012783          	lw	a5,0(sp)
8000c83c:	0ff00713          	li	a4,255
8000c840:	f6f762e3          	bltu	a4,a5,8000c7a4 <ip4addr_aton+0x16c>
8000c844:	01879793          	slli	a5,a5,0x18
8000c848:	00f56533          	or	a0,a0,a5
8000c84c:	f49ff06f          	j	8000c794 <ip4addr_aton+0x15c>
8000c850:	000107b7          	lui	a5,0x10
8000c854:	00000413          	li	s0,0
8000c858:	f4f576e3          	bgeu	a0,a5,8000c7a4 <ip4addr_aton+0x16c>
8000c85c:	00012783          	lw	a5,0(sp)
8000c860:	0ff00693          	li	a3,255
8000c864:	f4f6e0e3          	bltu	a3,a5,8000c7a4 <ip4addr_aton+0x16c>
8000c868:	00412703          	lw	a4,4(sp)
8000c86c:	f2e6ece3          	bltu	a3,a4,8000c7a4 <ip4addr_aton+0x16c>
8000c870:	01879793          	slli	a5,a5,0x18
8000c874:	01071713          	slli	a4,a4,0x10
8000c878:	00e7e7b3          	or	a5,a5,a4
8000c87c:	fcdff06f          	j	8000c848 <ip4addr_aton+0x210>
8000c880:	00000413          	li	s0,0
8000c884:	f21ff06f          	j	8000c7a4 <ip4addr_aton+0x16c>

8000c888 <ipaddr_addr>:
8000c888:	fe010113          	addi	sp,sp,-32
8000c88c:	00c10593          	addi	a1,sp,12
8000c890:	00112e23          	sw	ra,28(sp)
8000c894:	da5ff0ef          	jal	ra,8000c638 <ip4addr_aton>
8000c898:	00050a63          	beqz	a0,8000c8ac <ipaddr_addr+0x24>
8000c89c:	00c12503          	lw	a0,12(sp)
8000c8a0:	01c12083          	lw	ra,28(sp)
8000c8a4:	02010113          	addi	sp,sp,32
8000c8a8:	00008067          	ret
8000c8ac:	fff00513          	li	a0,-1
8000c8b0:	ff1ff06f          	j	8000c8a0 <ipaddr_addr+0x18>

8000c8b4 <ip4addr_ntoa_r>:
8000c8b4:	fb010113          	addi	sp,sp,-80
8000c8b8:	04912223          	sw	s1,68(sp)
8000c8bc:	05212023          	sw	s2,64(sp)
8000c8c0:	03312e23          	sw	s3,60(sp)
8000c8c4:	03612823          	sw	s6,48(sp)
8000c8c8:	03812423          	sw	s8,40(sp)
8000c8cc:	03912223          	sw	s9,36(sp)
8000c8d0:	03a12023          	sw	s10,32(sp)
8000c8d4:	04112623          	sw	ra,76(sp)
8000c8d8:	04812423          	sw	s0,72(sp)
8000c8dc:	03412c23          	sw	s4,56(sp)
8000c8e0:	03512a23          	sw	s5,52(sp)
8000c8e4:	03712623          	sw	s7,44(sp)
8000c8e8:	00052783          	lw	a5,0(a0)
8000c8ec:	00058493          	mv	s1,a1
8000c8f0:	00058b13          	mv	s6,a1
8000c8f4:	00f12e23          	sw	a5,28(sp)
8000c8f8:	00000993          	li	s3,0
8000c8fc:	01c10913          	addi	s2,sp,28
8000c900:	00900c93          	li	s9,9
8000c904:	0ff00d13          	li	s10,255
8000c908:	02e00c13          	li	s8,46
8000c90c:	00094a03          	lbu	s4,0(s2)
8000c910:	00000413          	li	s0,0
8000c914:	00a00593          	li	a1,10
8000c918:	000a0513          	mv	a0,s4
8000c91c:	00c12623          	sw	a2,12(sp)
8000c920:	239000ef          	jal	ra,8000d358 <__udivsi3>
8000c924:	0ff57b93          	andi	s7,a0,255
8000c928:	00a00593          	li	a1,10
8000c92c:	000a0513          	mv	a0,s4
8000c930:	271000ef          	jal	ra,8000d3a0 <__umodsi3>
8000c934:	02010793          	addi	a5,sp,32
8000c938:	03050513          	addi	a0,a0,48
8000c93c:	008787b3          	add	a5,a5,s0
8000c940:	00140a93          	addi	s5,s0,1
8000c944:	fea78c23          	sb	a0,-8(a5) # fff8 <_stack_size+0xf7f8>
8000c948:	0ffafa93          	andi	s5,s5,255
8000c94c:	00c12603          	lw	a2,12(sp)
8000c950:	074ce863          	bltu	s9,s4,8000c9c0 <ip4addr_ntoa_r+0x10c>
8000c954:	01790023          	sb	s7,0(s2)
8000c958:	00098713          	mv	a4,s3
8000c95c:	000b0793          	mv	a5,s6
8000c960:	00198993          	addi	s3,s3,1
8000c964:	07a41463          	bne	s0,s10,8000c9cc <ip4addr_ntoa_r+0x118>
8000c968:	08c75863          	bge	a4,a2,8000c9f8 <ip4addr_ntoa_r+0x144>
8000c96c:	01878023          	sb	s8,0(a5)
8000c970:	00190913          	addi	s2,s2,1
8000c974:	02010713          	addi	a4,sp,32
8000c978:	00178b13          	addi	s6,a5,1
8000c97c:	f8e918e3          	bne	s2,a4,8000c90c <ip4addr_ntoa_r+0x58>
8000c980:	00078023          	sb	zero,0(a5)
8000c984:	00048513          	mv	a0,s1
8000c988:	04c12083          	lw	ra,76(sp)
8000c98c:	04812403          	lw	s0,72(sp)
8000c990:	04412483          	lw	s1,68(sp)
8000c994:	04012903          	lw	s2,64(sp)
8000c998:	03c12983          	lw	s3,60(sp)
8000c99c:	03812a03          	lw	s4,56(sp)
8000c9a0:	03412a83          	lw	s5,52(sp)
8000c9a4:	03012b03          	lw	s6,48(sp)
8000c9a8:	02c12b83          	lw	s7,44(sp)
8000c9ac:	02812c03          	lw	s8,40(sp)
8000c9b0:	02412c83          	lw	s9,36(sp)
8000c9b4:	02012d03          	lw	s10,32(sp)
8000c9b8:	05010113          	addi	sp,sp,80
8000c9bc:	00008067          	ret
8000c9c0:	000b8a13          	mv	s4,s7
8000c9c4:	000a8413          	mv	s0,s5
8000c9c8:	f4dff06f          	j	8000c914 <ip4addr_ntoa_r+0x60>
8000c9cc:	fff40693          	addi	a3,s0,-1
8000c9d0:	0ff6f693          	andi	a3,a3,255
8000c9d4:	02c75263          	bge	a4,a2,8000c9f8 <ip4addr_ntoa_r+0x144>
8000c9d8:	02010713          	addi	a4,sp,32
8000c9dc:	00870433          	add	s0,a4,s0
8000c9e0:	ff844703          	lbu	a4,-8(s0)
8000c9e4:	00178793          	addi	a5,a5,1
8000c9e8:	00068413          	mv	s0,a3
8000c9ec:	fee78fa3          	sb	a4,-1(a5)
8000c9f0:	00098713          	mv	a4,s3
8000c9f4:	f6dff06f          	j	8000c960 <ip4addr_ntoa_r+0xac>
8000c9f8:	00000513          	li	a0,0
8000c9fc:	f8dff06f          	j	8000c988 <ip4addr_ntoa_r+0xd4>

8000ca00 <ip4addr_ntoa>:
8000ca00:	01000613          	li	a2,16
8000ca04:	c3c18593          	addi	a1,gp,-964 # 800034e4 <str.4106>
8000ca08:	eadff06f          	j	8000c8b4 <ip4addr_ntoa_r>

8000ca0c <ethernet_input>:
8000ca0c:	ff010113          	addi	sp,sp,-16
8000ca10:	00812423          	sw	s0,8(sp)
8000ca14:	00112623          	sw	ra,12(sp)
8000ca18:	00912223          	sw	s1,4(sp)
8000ca1c:	01212023          	sw	s2,0(sp)
8000ca20:	00a55703          	lhu	a4,10(a0)
8000ca24:	01000793          	li	a5,16
8000ca28:	00050413          	mv	s0,a0
8000ca2c:	00e7ec63          	bltu	a5,a4,8000ca44 <ethernet_input+0x38>
8000ca30:	a0c18793          	addi	a5,gp,-1524 # 800032b4 <lwip_stats>
8000ca34:	0507a703          	lw	a4,80(a5)
8000ca38:	00170713          	addi	a4,a4,1
8000ca3c:	04e7a823          	sw	a4,80(a5)
8000ca40:	0a00006f          	j	8000cae0 <ethernet_input+0xd4>
8000ca44:	00f54783          	lbu	a5,15(a0)
8000ca48:	00058913          	mv	s2,a1
8000ca4c:	00079863          	bnez	a5,8000ca5c <ethernet_input+0x50>
8000ca50:	0385c783          	lbu	a5,56(a1)
8000ca54:	00178793          	addi	a5,a5,1
8000ca58:	00f507a3          	sb	a5,15(a0)
8000ca5c:	00442503          	lw	a0,4(s0)
8000ca60:	00f54483          	lbu	s1,15(a0)
8000ca64:	00e54783          	lbu	a5,14(a0)
8000ca68:	00849493          	slli	s1,s1,0x8
8000ca6c:	00f4e4b3          	or	s1,s1,a5
8000ca70:	00254783          	lbu	a5,2(a0)
8000ca74:	0017f713          	andi	a4,a5,1
8000ca78:	02070663          	beqz	a4,8000caa4 <ethernet_input+0x98>
8000ca7c:	00100713          	li	a4,1
8000ca80:	06e79c63          	bne	a5,a4,8000caf8 <ethernet_input+0xec>
8000ca84:	00354783          	lbu	a5,3(a0)
8000ca88:	00079e63          	bnez	a5,8000caa4 <ethernet_input+0x98>
8000ca8c:	00454703          	lbu	a4,4(a0)
8000ca90:	05e00793          	li	a5,94
8000ca94:	00f71863          	bne	a4,a5,8000caa4 <ethernet_input+0x98>
8000ca98:	00d44783          	lbu	a5,13(s0)
8000ca9c:	0107e793          	ori	a5,a5,16
8000caa0:	00f406a3          	sb	a5,13(s0)
8000caa4:	00800793          	li	a5,8
8000caa8:	06f48863          	beq	s1,a5,8000cb18 <ethernet_input+0x10c>
8000caac:	60800793          	li	a5,1544
8000cab0:	f8f490e3          	bne	s1,a5,8000ca30 <ethernet_input+0x24>
8000cab4:	03594783          	lbu	a5,53(s2)
8000cab8:	0087f793          	andi	a5,a5,8
8000cabc:	02078863          	beqz	a5,8000caec <ethernet_input+0xe0>
8000cac0:	01000593          	li	a1,16
8000cac4:	00040513          	mv	a0,s0
8000cac8:	c94fa0ef          	jal	ra,80006f5c <pbuf_remove_header>
8000cacc:	08050863          	beqz	a0,8000cb5c <ethernet_input+0x150>
8000cad0:	a0c18793          	addi	a5,gp,-1524 # 800032b4 <lwip_stats>
8000cad4:	0447a703          	lw	a4,68(a5)
8000cad8:	00170713          	addi	a4,a4,1
8000cadc:	04e7a223          	sw	a4,68(a5)
8000cae0:	03c7a703          	lw	a4,60(a5)
8000cae4:	00170713          	addi	a4,a4,1
8000cae8:	02e7ae23          	sw	a4,60(a5)
8000caec:	00040513          	mv	a0,s0
8000caf0:	cf4fa0ef          	jal	ra,80006fe4 <pbuf_free>
8000caf4:	04c0006f          	j	8000cb40 <ethernet_input+0x134>
8000caf8:	00600613          	li	a2,6
8000cafc:	85418593          	addi	a1,gp,-1964 # 800030fc <ethbroadcast>
8000cb00:	00250513          	addi	a0,a0,2
8000cb04:	6a0010ef          	jal	ra,8000e1a4 <memcmp>
8000cb08:	f8051ee3          	bnez	a0,8000caa4 <ethernet_input+0x98>
8000cb0c:	00d44783          	lbu	a5,13(s0)
8000cb10:	0087e793          	ori	a5,a5,8
8000cb14:	f8dff06f          	j	8000caa0 <ethernet_input+0x94>
8000cb18:	03594783          	lbu	a5,53(s2)
8000cb1c:	0087f793          	andi	a5,a5,8
8000cb20:	fc0786e3          	beqz	a5,8000caec <ethernet_input+0xe0>
8000cb24:	01000593          	li	a1,16
8000cb28:	00040513          	mv	a0,s0
8000cb2c:	c30fa0ef          	jal	ra,80006f5c <pbuf_remove_header>
8000cb30:	fa051ee3          	bnez	a0,8000caec <ethernet_input+0xe0>
8000cb34:	00090593          	mv	a1,s2
8000cb38:	00040513          	mv	a0,s0
8000cb3c:	b30ff0ef          	jal	ra,8000be6c <ip4_input>
8000cb40:	00c12083          	lw	ra,12(sp)
8000cb44:	00812403          	lw	s0,8(sp)
8000cb48:	00412483          	lw	s1,4(sp)
8000cb4c:	00012903          	lw	s2,0(sp)
8000cb50:	00000513          	li	a0,0
8000cb54:	01010113          	addi	sp,sp,16
8000cb58:	00008067          	ret
8000cb5c:	00090593          	mv	a1,s2
8000cb60:	00040513          	mv	a0,s0
8000cb64:	ad8fe0ef          	jal	ra,8000ae3c <etharp_input>
8000cb68:	fd9ff06f          	j	8000cb40 <ethernet_input+0x134>

8000cb6c <ethernet_output>:
8000cb6c:	fd010113          	addi	sp,sp,-48
8000cb70:	01312e23          	sw	s3,28(sp)
8000cb74:	00050993          	mv	s3,a0
8000cb78:	00070513          	mv	a0,a4
8000cb7c:	00d12623          	sw	a3,12(sp)
8000cb80:	02112623          	sw	ra,44(sp)
8000cb84:	02912223          	sw	s1,36(sp)
8000cb88:	03212023          	sw	s2,32(sp)
8000cb8c:	01412c23          	sw	s4,24(sp)
8000cb90:	00058913          	mv	s2,a1
8000cb94:	00060a13          	mv	s4,a2
8000cb98:	02812423          	sw	s0,40(sp)
8000cb9c:	a24f90ef          	jal	ra,80005dc0 <lwip_htons>
8000cba0:	00050493          	mv	s1,a0
8000cba4:	01000593          	li	a1,16
8000cba8:	00090513          	mv	a0,s2
8000cbac:	ba0fa0ef          	jal	ra,80006f4c <pbuf_add_header>
8000cbb0:	00c12683          	lw	a3,12(sp)
8000cbb4:	06051063          	bnez	a0,8000cc14 <ethernet_output+0xa8>
8000cbb8:	00492403          	lw	s0,4(s2)
8000cbbc:	00068593          	mv	a1,a3
8000cbc0:	00600613          	li	a2,6
8000cbc4:	00940723          	sb	s1,14(s0)
8000cbc8:	0084d493          	srli	s1,s1,0x8
8000cbcc:	009407a3          	sb	s1,15(s0)
8000cbd0:	00240513          	addi	a0,s0,2
8000cbd4:	600010ef          	jal	ra,8000e1d4 <memcpy>
8000cbd8:	000a0593          	mv	a1,s4
8000cbdc:	00840513          	addi	a0,s0,8
8000cbe0:	00600613          	li	a2,6
8000cbe4:	5f0010ef          	jal	ra,8000e1d4 <memcpy>
8000cbe8:	02812403          	lw	s0,40(sp)
8000cbec:	0189a303          	lw	t1,24(s3)
8000cbf0:	02c12083          	lw	ra,44(sp)
8000cbf4:	02412483          	lw	s1,36(sp)
8000cbf8:	01812a03          	lw	s4,24(sp)
8000cbfc:	00090593          	mv	a1,s2
8000cc00:	00098513          	mv	a0,s3
8000cc04:	02012903          	lw	s2,32(sp)
8000cc08:	01c12983          	lw	s3,28(sp)
8000cc0c:	03010113          	addi	sp,sp,48
8000cc10:	00030067          	jr	t1
8000cc14:	a0c18793          	addi	a5,gp,-1524 # 800032b4 <lwip_stats>
8000cc18:	0147a703          	lw	a4,20(a5)
8000cc1c:	ffe00513          	li	a0,-2
8000cc20:	00170713          	addi	a4,a4,1
8000cc24:	00e7aa23          	sw	a4,20(a5)
8000cc28:	02c12083          	lw	ra,44(sp)
8000cc2c:	02812403          	lw	s0,40(sp)
8000cc30:	02412483          	lw	s1,36(sp)
8000cc34:	02012903          	lw	s2,32(sp)
8000cc38:	01c12983          	lw	s3,28(sp)
8000cc3c:	01812a03          	lw	s4,24(sp)
8000cc40:	03010113          	addi	sp,sp,48
8000cc44:	00008067          	ret

8000cc48 <memset>:
8000cc48:	00f00313          	li	t1,15
8000cc4c:	00050713          	mv	a4,a0
8000cc50:	02c37e63          	bgeu	t1,a2,8000cc8c <memset+0x44>
8000cc54:	00f77793          	andi	a5,a4,15
8000cc58:	0a079063          	bnez	a5,8000ccf8 <memset+0xb0>
8000cc5c:	08059263          	bnez	a1,8000cce0 <memset+0x98>
8000cc60:	ff067693          	andi	a3,a2,-16
8000cc64:	00f67613          	andi	a2,a2,15
8000cc68:	00e686b3          	add	a3,a3,a4
8000cc6c:	00b72023          	sw	a1,0(a4)
8000cc70:	00b72223          	sw	a1,4(a4)
8000cc74:	00b72423          	sw	a1,8(a4)
8000cc78:	00b72623          	sw	a1,12(a4)
8000cc7c:	01070713          	addi	a4,a4,16
8000cc80:	fed766e3          	bltu	a4,a3,8000cc6c <memset+0x24>
8000cc84:	00061463          	bnez	a2,8000cc8c <memset+0x44>
8000cc88:	00008067          	ret
8000cc8c:	40c306b3          	sub	a3,t1,a2
8000cc90:	00269693          	slli	a3,a3,0x2
8000cc94:	00000297          	auipc	t0,0x0
8000cc98:	005686b3          	add	a3,a3,t0
8000cc9c:	00c68067          	jr	12(a3)
8000cca0:	00b70723          	sb	a1,14(a4)
8000cca4:	00b706a3          	sb	a1,13(a4)
8000cca8:	00b70623          	sb	a1,12(a4)
8000ccac:	00b705a3          	sb	a1,11(a4)
8000ccb0:	00b70523          	sb	a1,10(a4)
8000ccb4:	00b704a3          	sb	a1,9(a4)
8000ccb8:	00b70423          	sb	a1,8(a4)
8000ccbc:	00b703a3          	sb	a1,7(a4)
8000ccc0:	00b70323          	sb	a1,6(a4)
8000ccc4:	00b702a3          	sb	a1,5(a4)
8000ccc8:	00b70223          	sb	a1,4(a4)
8000cccc:	00b701a3          	sb	a1,3(a4)
8000ccd0:	00b70123          	sb	a1,2(a4)
8000ccd4:	00b700a3          	sb	a1,1(a4)
8000ccd8:	00b70023          	sb	a1,0(a4)
8000ccdc:	00008067          	ret
8000cce0:	0ff5f593          	andi	a1,a1,255
8000cce4:	00859693          	slli	a3,a1,0x8
8000cce8:	00d5e5b3          	or	a1,a1,a3
8000ccec:	01059693          	slli	a3,a1,0x10
8000ccf0:	00d5e5b3          	or	a1,a1,a3
8000ccf4:	f6dff06f          	j	8000cc60 <memset+0x18>
8000ccf8:	00279693          	slli	a3,a5,0x2
8000ccfc:	00000297          	auipc	t0,0x0
8000cd00:	005686b3          	add	a3,a3,t0
8000cd04:	00008293          	mv	t0,ra
8000cd08:	fa0680e7          	jalr	-96(a3)
8000cd0c:	00028093          	mv	ra,t0
8000cd10:	ff078793          	addi	a5,a5,-16
8000cd14:	40f70733          	sub	a4,a4,a5
8000cd18:	00f60633          	add	a2,a2,a5
8000cd1c:	f6c378e3          	bgeu	t1,a2,8000cc8c <memset+0x44>
8000cd20:	f3dff06f          	j	8000cc5c <memset+0x14>

8000cd24 <__bswapsi2>:
8000cd24:	01851713          	slli	a4,a0,0x18
8000cd28:	01855793          	srli	a5,a0,0x18
8000cd2c:	000106b7          	lui	a3,0x10
8000cd30:	00e7e7b3          	or	a5,a5,a4
8000cd34:	f0068693          	addi	a3,a3,-256 # ff00 <_stack_size+0xf700>
8000cd38:	40855713          	srai	a4,a0,0x8
8000cd3c:	00d77733          	and	a4,a4,a3
8000cd40:	00e7e7b3          	or	a5,a5,a4
8000cd44:	00851513          	slli	a0,a0,0x8
8000cd48:	00ff0737          	lui	a4,0xff0
8000cd4c:	00e57533          	and	a0,a0,a4
8000cd50:	00a7e533          	or	a0,a5,a0
8000cd54:	00008067          	ret

8000cd58 <__udivdi3>:
8000cd58:	fd010113          	addi	sp,sp,-48
8000cd5c:	02912223          	sw	s1,36(sp)
8000cd60:	01612823          	sw	s6,16(sp)
8000cd64:	02112623          	sw	ra,44(sp)
8000cd68:	02812423          	sw	s0,40(sp)
8000cd6c:	03212023          	sw	s2,32(sp)
8000cd70:	01312e23          	sw	s3,28(sp)
8000cd74:	01412c23          	sw	s4,24(sp)
8000cd78:	01512a23          	sw	s5,20(sp)
8000cd7c:	01712623          	sw	s7,12(sp)
8000cd80:	01812423          	sw	s8,8(sp)
8000cd84:	01912223          	sw	s9,4(sp)
8000cd88:	00050b13          	mv	s6,a0
8000cd8c:	00058493          	mv	s1,a1
8000cd90:	38069c63          	bnez	a3,8000d128 <__udivdi3+0x3d0>
8000cd94:	00060413          	mv	s0,a2
8000cd98:	00050993          	mv	s3,a0
8000cd9c:	ffff6917          	auipc	s2,0xffff6
8000cda0:	17c90913          	addi	s2,s2,380 # 80002f18 <__clz_tab>
8000cda4:	12c5f863          	bgeu	a1,a2,8000ced4 <__udivdi3+0x17c>
8000cda8:	000107b7          	lui	a5,0x10
8000cdac:	00058a93          	mv	s5,a1
8000cdb0:	10f67863          	bgeu	a2,a5,8000cec0 <__udivdi3+0x168>
8000cdb4:	0ff00693          	li	a3,255
8000cdb8:	00c6b6b3          	sltu	a3,a3,a2
8000cdbc:	00369693          	slli	a3,a3,0x3
8000cdc0:	00d657b3          	srl	a5,a2,a3
8000cdc4:	00f90933          	add	s2,s2,a5
8000cdc8:	00094703          	lbu	a4,0(s2)
8000cdcc:	00d706b3          	add	a3,a4,a3
8000cdd0:	02000713          	li	a4,32
8000cdd4:	40d70733          	sub	a4,a4,a3
8000cdd8:	00070c63          	beqz	a4,8000cdf0 <__udivdi3+0x98>
8000cddc:	00e494b3          	sll	s1,s1,a4
8000cde0:	00db56b3          	srl	a3,s6,a3
8000cde4:	00e61433          	sll	s0,a2,a4
8000cde8:	0096eab3          	or	s5,a3,s1
8000cdec:	00eb19b3          	sll	s3,s6,a4
8000cdf0:	01045b13          	srli	s6,s0,0x10
8000cdf4:	000b0593          	mv	a1,s6
8000cdf8:	000a8513          	mv	a0,s5
8000cdfc:	5a4000ef          	jal	ra,8000d3a0 <__umodsi3>
8000ce00:	00050913          	mv	s2,a0
8000ce04:	000b0593          	mv	a1,s6
8000ce08:	01041b93          	slli	s7,s0,0x10
8000ce0c:	000a8513          	mv	a0,s5
8000ce10:	548000ef          	jal	ra,8000d358 <__udivsi3>
8000ce14:	010bdb93          	srli	s7,s7,0x10
8000ce18:	00050493          	mv	s1,a0
8000ce1c:	00050593          	mv	a1,a0
8000ce20:	000b8513          	mv	a0,s7
8000ce24:	508000ef          	jal	ra,8000d32c <__mulsi3>
8000ce28:	01091913          	slli	s2,s2,0x10
8000ce2c:	0109d713          	srli	a4,s3,0x10
8000ce30:	00e96733          	or	a4,s2,a4
8000ce34:	00048a13          	mv	s4,s1
8000ce38:	00a77e63          	bgeu	a4,a0,8000ce54 <__udivdi3+0xfc>
8000ce3c:	00870733          	add	a4,a4,s0
8000ce40:	fff48a13          	addi	s4,s1,-1
8000ce44:	00876863          	bltu	a4,s0,8000ce54 <__udivdi3+0xfc>
8000ce48:	00a77663          	bgeu	a4,a0,8000ce54 <__udivdi3+0xfc>
8000ce4c:	ffe48a13          	addi	s4,s1,-2
8000ce50:	00870733          	add	a4,a4,s0
8000ce54:	40a704b3          	sub	s1,a4,a0
8000ce58:	000b0593          	mv	a1,s6
8000ce5c:	00048513          	mv	a0,s1
8000ce60:	540000ef          	jal	ra,8000d3a0 <__umodsi3>
8000ce64:	00050913          	mv	s2,a0
8000ce68:	000b0593          	mv	a1,s6
8000ce6c:	00048513          	mv	a0,s1
8000ce70:	4e8000ef          	jal	ra,8000d358 <__udivsi3>
8000ce74:	01099993          	slli	s3,s3,0x10
8000ce78:	00050493          	mv	s1,a0
8000ce7c:	00050593          	mv	a1,a0
8000ce80:	01091913          	slli	s2,s2,0x10
8000ce84:	000b8513          	mv	a0,s7
8000ce88:	0109d993          	srli	s3,s3,0x10
8000ce8c:	4a0000ef          	jal	ra,8000d32c <__mulsi3>
8000ce90:	013969b3          	or	s3,s2,s3
8000ce94:	00048613          	mv	a2,s1
8000ce98:	00a9fc63          	bgeu	s3,a0,8000ceb0 <__udivdi3+0x158>
8000ce9c:	013409b3          	add	s3,s0,s3
8000cea0:	fff48613          	addi	a2,s1,-1
8000cea4:	0089e663          	bltu	s3,s0,8000ceb0 <__udivdi3+0x158>
8000cea8:	00a9f463          	bgeu	s3,a0,8000ceb0 <__udivdi3+0x158>
8000ceac:	ffe48613          	addi	a2,s1,-2
8000ceb0:	010a1793          	slli	a5,s4,0x10
8000ceb4:	00c7e7b3          	or	a5,a5,a2
8000ceb8:	00000a13          	li	s4,0
8000cebc:	1300006f          	j	8000cfec <__udivdi3+0x294>
8000cec0:	010007b7          	lui	a5,0x1000
8000cec4:	01000693          	li	a3,16
8000cec8:	eef66ce3          	bltu	a2,a5,8000cdc0 <__udivdi3+0x68>
8000cecc:	01800693          	li	a3,24
8000ced0:	ef1ff06f          	j	8000cdc0 <__udivdi3+0x68>
8000ced4:	00068a13          	mv	s4,a3
8000ced8:	00061a63          	bnez	a2,8000ceec <__udivdi3+0x194>
8000cedc:	00000593          	li	a1,0
8000cee0:	00100513          	li	a0,1
8000cee4:	474000ef          	jal	ra,8000d358 <__udivsi3>
8000cee8:	00050413          	mv	s0,a0
8000ceec:	000107b7          	lui	a5,0x10
8000cef0:	12f47c63          	bgeu	s0,a5,8000d028 <__udivdi3+0x2d0>
8000cef4:	0ff00793          	li	a5,255
8000cef8:	0087f463          	bgeu	a5,s0,8000cf00 <__udivdi3+0x1a8>
8000cefc:	00800a13          	li	s4,8
8000cf00:	014457b3          	srl	a5,s0,s4
8000cf04:	00f90933          	add	s2,s2,a5
8000cf08:	00094683          	lbu	a3,0(s2)
8000cf0c:	02000613          	li	a2,32
8000cf10:	014686b3          	add	a3,a3,s4
8000cf14:	40d60633          	sub	a2,a2,a3
8000cf18:	12061263          	bnez	a2,8000d03c <__udivdi3+0x2e4>
8000cf1c:	408484b3          	sub	s1,s1,s0
8000cf20:	00100a13          	li	s4,1
8000cf24:	01045b13          	srli	s6,s0,0x10
8000cf28:	000b0593          	mv	a1,s6
8000cf2c:	00048513          	mv	a0,s1
8000cf30:	470000ef          	jal	ra,8000d3a0 <__umodsi3>
8000cf34:	00050913          	mv	s2,a0
8000cf38:	000b0593          	mv	a1,s6
8000cf3c:	00048513          	mv	a0,s1
8000cf40:	01041b93          	slli	s7,s0,0x10
8000cf44:	414000ef          	jal	ra,8000d358 <__udivsi3>
8000cf48:	010bdb93          	srli	s7,s7,0x10
8000cf4c:	00050493          	mv	s1,a0
8000cf50:	00050593          	mv	a1,a0
8000cf54:	000b8513          	mv	a0,s7
8000cf58:	3d4000ef          	jal	ra,8000d32c <__mulsi3>
8000cf5c:	01091913          	slli	s2,s2,0x10
8000cf60:	0109d713          	srli	a4,s3,0x10
8000cf64:	00e96733          	or	a4,s2,a4
8000cf68:	00048a93          	mv	s5,s1
8000cf6c:	00a77e63          	bgeu	a4,a0,8000cf88 <__udivdi3+0x230>
8000cf70:	00870733          	add	a4,a4,s0
8000cf74:	fff48a93          	addi	s5,s1,-1
8000cf78:	00876863          	bltu	a4,s0,8000cf88 <__udivdi3+0x230>
8000cf7c:	00a77663          	bgeu	a4,a0,8000cf88 <__udivdi3+0x230>
8000cf80:	ffe48a93          	addi	s5,s1,-2
8000cf84:	00870733          	add	a4,a4,s0
8000cf88:	40a704b3          	sub	s1,a4,a0
8000cf8c:	000b0593          	mv	a1,s6
8000cf90:	00048513          	mv	a0,s1
8000cf94:	40c000ef          	jal	ra,8000d3a0 <__umodsi3>
8000cf98:	00050913          	mv	s2,a0
8000cf9c:	000b0593          	mv	a1,s6
8000cfa0:	00048513          	mv	a0,s1
8000cfa4:	3b4000ef          	jal	ra,8000d358 <__udivsi3>
8000cfa8:	01099993          	slli	s3,s3,0x10
8000cfac:	00050493          	mv	s1,a0
8000cfb0:	00050593          	mv	a1,a0
8000cfb4:	01091913          	slli	s2,s2,0x10
8000cfb8:	000b8513          	mv	a0,s7
8000cfbc:	0109d993          	srli	s3,s3,0x10
8000cfc0:	36c000ef          	jal	ra,8000d32c <__mulsi3>
8000cfc4:	013969b3          	or	s3,s2,s3
8000cfc8:	00048613          	mv	a2,s1
8000cfcc:	00a9fc63          	bgeu	s3,a0,8000cfe4 <__udivdi3+0x28c>
8000cfd0:	013409b3          	add	s3,s0,s3
8000cfd4:	fff48613          	addi	a2,s1,-1
8000cfd8:	0089e663          	bltu	s3,s0,8000cfe4 <__udivdi3+0x28c>
8000cfdc:	00a9f463          	bgeu	s3,a0,8000cfe4 <__udivdi3+0x28c>
8000cfe0:	ffe48613          	addi	a2,s1,-2
8000cfe4:	010a9793          	slli	a5,s5,0x10
8000cfe8:	00c7e7b3          	or	a5,a5,a2
8000cfec:	00078513          	mv	a0,a5
8000cff0:	000a0593          	mv	a1,s4
8000cff4:	02c12083          	lw	ra,44(sp)
8000cff8:	02812403          	lw	s0,40(sp)
8000cffc:	02412483          	lw	s1,36(sp)
8000d000:	02012903          	lw	s2,32(sp)
8000d004:	01c12983          	lw	s3,28(sp)
8000d008:	01812a03          	lw	s4,24(sp)
8000d00c:	01412a83          	lw	s5,20(sp)
8000d010:	01012b03          	lw	s6,16(sp)
8000d014:	00c12b83          	lw	s7,12(sp)
8000d018:	00812c03          	lw	s8,8(sp)
8000d01c:	00412c83          	lw	s9,4(sp)
8000d020:	03010113          	addi	sp,sp,48
8000d024:	00008067          	ret
8000d028:	010007b7          	lui	a5,0x1000
8000d02c:	01000a13          	li	s4,16
8000d030:	ecf468e3          	bltu	s0,a5,8000cf00 <__udivdi3+0x1a8>
8000d034:	01800a13          	li	s4,24
8000d038:	ec9ff06f          	j	8000cf00 <__udivdi3+0x1a8>
8000d03c:	00c41433          	sll	s0,s0,a2
8000d040:	00d4da33          	srl	s4,s1,a3
8000d044:	00cb19b3          	sll	s3,s6,a2
8000d048:	00db56b3          	srl	a3,s6,a3
8000d04c:	01045b13          	srli	s6,s0,0x10
8000d050:	00c494b3          	sll	s1,s1,a2
8000d054:	000b0593          	mv	a1,s6
8000d058:	000a0513          	mv	a0,s4
8000d05c:	0096eab3          	or	s5,a3,s1
8000d060:	340000ef          	jal	ra,8000d3a0 <__umodsi3>
8000d064:	00050913          	mv	s2,a0
8000d068:	000b0593          	mv	a1,s6
8000d06c:	000a0513          	mv	a0,s4
8000d070:	01041b93          	slli	s7,s0,0x10
8000d074:	2e4000ef          	jal	ra,8000d358 <__udivsi3>
8000d078:	010bdb93          	srli	s7,s7,0x10
8000d07c:	00050493          	mv	s1,a0
8000d080:	00050593          	mv	a1,a0
8000d084:	000b8513          	mv	a0,s7
8000d088:	2a4000ef          	jal	ra,8000d32c <__mulsi3>
8000d08c:	01091913          	slli	s2,s2,0x10
8000d090:	010ad713          	srli	a4,s5,0x10
8000d094:	00e96733          	or	a4,s2,a4
8000d098:	00048a13          	mv	s4,s1
8000d09c:	00a77e63          	bgeu	a4,a0,8000d0b8 <__udivdi3+0x360>
8000d0a0:	00870733          	add	a4,a4,s0
8000d0a4:	fff48a13          	addi	s4,s1,-1
8000d0a8:	00876863          	bltu	a4,s0,8000d0b8 <__udivdi3+0x360>
8000d0ac:	00a77663          	bgeu	a4,a0,8000d0b8 <__udivdi3+0x360>
8000d0b0:	ffe48a13          	addi	s4,s1,-2
8000d0b4:	00870733          	add	a4,a4,s0
8000d0b8:	40a704b3          	sub	s1,a4,a0
8000d0bc:	000b0593          	mv	a1,s6
8000d0c0:	00048513          	mv	a0,s1
8000d0c4:	2dc000ef          	jal	ra,8000d3a0 <__umodsi3>
8000d0c8:	00050913          	mv	s2,a0
8000d0cc:	000b0593          	mv	a1,s6
8000d0d0:	00048513          	mv	a0,s1
8000d0d4:	284000ef          	jal	ra,8000d358 <__udivsi3>
8000d0d8:	00050493          	mv	s1,a0
8000d0dc:	00050593          	mv	a1,a0
8000d0e0:	000b8513          	mv	a0,s7
8000d0e4:	248000ef          	jal	ra,8000d32c <__mulsi3>
8000d0e8:	010a9693          	slli	a3,s5,0x10
8000d0ec:	01091913          	slli	s2,s2,0x10
8000d0f0:	0106d693          	srli	a3,a3,0x10
8000d0f4:	00d967b3          	or	a5,s2,a3
8000d0f8:	00048713          	mv	a4,s1
8000d0fc:	00a7fe63          	bgeu	a5,a0,8000d118 <__udivdi3+0x3c0>
8000d100:	008787b3          	add	a5,a5,s0
8000d104:	fff48713          	addi	a4,s1,-1
8000d108:	0087e863          	bltu	a5,s0,8000d118 <__udivdi3+0x3c0>
8000d10c:	00a7f663          	bgeu	a5,a0,8000d118 <__udivdi3+0x3c0>
8000d110:	ffe48713          	addi	a4,s1,-2
8000d114:	008787b3          	add	a5,a5,s0
8000d118:	010a1a13          	slli	s4,s4,0x10
8000d11c:	40a784b3          	sub	s1,a5,a0
8000d120:	00ea6a33          	or	s4,s4,a4
8000d124:	e01ff06f          	j	8000cf24 <__udivdi3+0x1cc>
8000d128:	1ed5ec63          	bltu	a1,a3,8000d320 <__udivdi3+0x5c8>
8000d12c:	000107b7          	lui	a5,0x10
8000d130:	04f6f463          	bgeu	a3,a5,8000d178 <__udivdi3+0x420>
8000d134:	0ff00593          	li	a1,255
8000d138:	00d5b533          	sltu	a0,a1,a3
8000d13c:	00351513          	slli	a0,a0,0x3
8000d140:	00a6d733          	srl	a4,a3,a0
8000d144:	ffff6797          	auipc	a5,0xffff6
8000d148:	dd478793          	addi	a5,a5,-556 # 80002f18 <__clz_tab>
8000d14c:	00e787b3          	add	a5,a5,a4
8000d150:	0007c583          	lbu	a1,0(a5)
8000d154:	02000a13          	li	s4,32
8000d158:	00a585b3          	add	a1,a1,a0
8000d15c:	40ba0a33          	sub	s4,s4,a1
8000d160:	020a1663          	bnez	s4,8000d18c <__udivdi3+0x434>
8000d164:	00100793          	li	a5,1
8000d168:	e896e2e3          	bltu	a3,s1,8000cfec <__udivdi3+0x294>
8000d16c:	00cb3633          	sltu	a2,s6,a2
8000d170:	00164793          	xori	a5,a2,1
8000d174:	e79ff06f          	j	8000cfec <__udivdi3+0x294>
8000d178:	010007b7          	lui	a5,0x1000
8000d17c:	01000513          	li	a0,16
8000d180:	fcf6e0e3          	bltu	a3,a5,8000d140 <__udivdi3+0x3e8>
8000d184:	01800513          	li	a0,24
8000d188:	fb9ff06f          	j	8000d140 <__udivdi3+0x3e8>
8000d18c:	00b65ab3          	srl	s5,a2,a1
8000d190:	014696b3          	sll	a3,a3,s4
8000d194:	00daeab3          	or	s5,s5,a3
8000d198:	00b4d933          	srl	s2,s1,a1
8000d19c:	014497b3          	sll	a5,s1,s4
8000d1a0:	00bb55b3          	srl	a1,s6,a1
8000d1a4:	010adb93          	srli	s7,s5,0x10
8000d1a8:	00f5e4b3          	or	s1,a1,a5
8000d1ac:	00090513          	mv	a0,s2
8000d1b0:	000b8593          	mv	a1,s7
8000d1b4:	014619b3          	sll	s3,a2,s4
8000d1b8:	1e8000ef          	jal	ra,8000d3a0 <__umodsi3>
8000d1bc:	00050413          	mv	s0,a0
8000d1c0:	000b8593          	mv	a1,s7
8000d1c4:	00090513          	mv	a0,s2
8000d1c8:	010a9c13          	slli	s8,s5,0x10
8000d1cc:	18c000ef          	jal	ra,8000d358 <__udivsi3>
8000d1d0:	010c5c13          	srli	s8,s8,0x10
8000d1d4:	00050913          	mv	s2,a0
8000d1d8:	00050593          	mv	a1,a0
8000d1dc:	000c0513          	mv	a0,s8
8000d1e0:	14c000ef          	jal	ra,8000d32c <__mulsi3>
8000d1e4:	01041413          	slli	s0,s0,0x10
8000d1e8:	0104d713          	srli	a4,s1,0x10
8000d1ec:	00e46733          	or	a4,s0,a4
8000d1f0:	00090c93          	mv	s9,s2
8000d1f4:	00a77e63          	bgeu	a4,a0,8000d210 <__udivdi3+0x4b8>
8000d1f8:	01570733          	add	a4,a4,s5
8000d1fc:	fff90c93          	addi	s9,s2,-1
8000d200:	01576863          	bltu	a4,s5,8000d210 <__udivdi3+0x4b8>
8000d204:	00a77663          	bgeu	a4,a0,8000d210 <__udivdi3+0x4b8>
8000d208:	ffe90c93          	addi	s9,s2,-2
8000d20c:	01570733          	add	a4,a4,s5
8000d210:	40a70933          	sub	s2,a4,a0
8000d214:	000b8593          	mv	a1,s7
8000d218:	00090513          	mv	a0,s2
8000d21c:	184000ef          	jal	ra,8000d3a0 <__umodsi3>
8000d220:	00050413          	mv	s0,a0
8000d224:	000b8593          	mv	a1,s7
8000d228:	00090513          	mv	a0,s2
8000d22c:	12c000ef          	jal	ra,8000d358 <__udivsi3>
8000d230:	00050913          	mv	s2,a0
8000d234:	00050593          	mv	a1,a0
8000d238:	000c0513          	mv	a0,s8
8000d23c:	0f0000ef          	jal	ra,8000d32c <__mulsi3>
8000d240:	01049793          	slli	a5,s1,0x10
8000d244:	01041413          	slli	s0,s0,0x10
8000d248:	0107d793          	srli	a5,a5,0x10
8000d24c:	00f46733          	or	a4,s0,a5
8000d250:	00090613          	mv	a2,s2
8000d254:	00a77e63          	bgeu	a4,a0,8000d270 <__udivdi3+0x518>
8000d258:	01570733          	add	a4,a4,s5
8000d25c:	fff90613          	addi	a2,s2,-1
8000d260:	01576863          	bltu	a4,s5,8000d270 <__udivdi3+0x518>
8000d264:	00a77663          	bgeu	a4,a0,8000d270 <__udivdi3+0x518>
8000d268:	ffe90613          	addi	a2,s2,-2
8000d26c:	01570733          	add	a4,a4,s5
8000d270:	010c9793          	slli	a5,s9,0x10
8000d274:	00010e37          	lui	t3,0x10
8000d278:	00c7e7b3          	or	a5,a5,a2
8000d27c:	fffe0813          	addi	a6,t3,-1 # ffff <_stack_size+0xf7ff>
8000d280:	0107f333          	and	t1,a5,a6
8000d284:	0109f833          	and	a6,s3,a6
8000d288:	40a70733          	sub	a4,a4,a0
8000d28c:	0107de93          	srli	t4,a5,0x10
8000d290:	0109d993          	srli	s3,s3,0x10
8000d294:	00030513          	mv	a0,t1
8000d298:	00080593          	mv	a1,a6
8000d29c:	090000ef          	jal	ra,8000d32c <__mulsi3>
8000d2a0:	00050893          	mv	a7,a0
8000d2a4:	00098593          	mv	a1,s3
8000d2a8:	00030513          	mv	a0,t1
8000d2ac:	080000ef          	jal	ra,8000d32c <__mulsi3>
8000d2b0:	00050313          	mv	t1,a0
8000d2b4:	00080593          	mv	a1,a6
8000d2b8:	000e8513          	mv	a0,t4
8000d2bc:	070000ef          	jal	ra,8000d32c <__mulsi3>
8000d2c0:	00050813          	mv	a6,a0
8000d2c4:	00098593          	mv	a1,s3
8000d2c8:	000e8513          	mv	a0,t4
8000d2cc:	060000ef          	jal	ra,8000d32c <__mulsi3>
8000d2d0:	0108d693          	srli	a3,a7,0x10
8000d2d4:	01030333          	add	t1,t1,a6
8000d2d8:	006686b3          	add	a3,a3,t1
8000d2dc:	0106f463          	bgeu	a3,a6,8000d2e4 <__udivdi3+0x58c>
8000d2e0:	01c50533          	add	a0,a0,t3
8000d2e4:	0106d613          	srli	a2,a3,0x10
8000d2e8:	00a60533          	add	a0,a2,a0
8000d2ec:	02a76663          	bltu	a4,a0,8000d318 <__udivdi3+0x5c0>
8000d2f0:	bca714e3          	bne	a4,a0,8000ceb8 <__udivdi3+0x160>
8000d2f4:	00010737          	lui	a4,0x10
8000d2f8:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
8000d2fc:	00e6f6b3          	and	a3,a3,a4
8000d300:	01069693          	slli	a3,a3,0x10
8000d304:	00e8f8b3          	and	a7,a7,a4
8000d308:	014b1633          	sll	a2,s6,s4
8000d30c:	011686b3          	add	a3,a3,a7
8000d310:	00000a13          	li	s4,0
8000d314:	ccd67ce3          	bgeu	a2,a3,8000cfec <__udivdi3+0x294>
8000d318:	fff78793          	addi	a5,a5,-1 # ffffff <_stack_size+0xfff7ff>
8000d31c:	b9dff06f          	j	8000ceb8 <__udivdi3+0x160>
8000d320:	00000a13          	li	s4,0
8000d324:	00000793          	li	a5,0
8000d328:	cc5ff06f          	j	8000cfec <__udivdi3+0x294>

8000d32c <__mulsi3>:
8000d32c:	00050613          	mv	a2,a0
8000d330:	00000513          	li	a0,0
8000d334:	0015f693          	andi	a3,a1,1
8000d338:	00068463          	beqz	a3,8000d340 <__mulsi3+0x14>
8000d33c:	00c50533          	add	a0,a0,a2
8000d340:	0015d593          	srli	a1,a1,0x1
8000d344:	00161613          	slli	a2,a2,0x1
8000d348:	fe0596e3          	bnez	a1,8000d334 <__mulsi3+0x8>
8000d34c:	00008067          	ret

8000d350 <__divsi3>:
8000d350:	06054063          	bltz	a0,8000d3b0 <__umodsi3+0x10>
8000d354:	0605c663          	bltz	a1,8000d3c0 <__umodsi3+0x20>

8000d358 <__udivsi3>:
8000d358:	00058613          	mv	a2,a1
8000d35c:	00050593          	mv	a1,a0
8000d360:	fff00513          	li	a0,-1
8000d364:	02060c63          	beqz	a2,8000d39c <__udivsi3+0x44>
8000d368:	00100693          	li	a3,1
8000d36c:	00b67a63          	bgeu	a2,a1,8000d380 <__udivsi3+0x28>
8000d370:	00c05863          	blez	a2,8000d380 <__udivsi3+0x28>
8000d374:	00161613          	slli	a2,a2,0x1
8000d378:	00169693          	slli	a3,a3,0x1
8000d37c:	feb66ae3          	bltu	a2,a1,8000d370 <__udivsi3+0x18>
8000d380:	00000513          	li	a0,0
8000d384:	00c5e663          	bltu	a1,a2,8000d390 <__udivsi3+0x38>
8000d388:	40c585b3          	sub	a1,a1,a2
8000d38c:	00d56533          	or	a0,a0,a3
8000d390:	0016d693          	srli	a3,a3,0x1
8000d394:	00165613          	srli	a2,a2,0x1
8000d398:	fe0696e3          	bnez	a3,8000d384 <__udivsi3+0x2c>
8000d39c:	00008067          	ret

8000d3a0 <__umodsi3>:
8000d3a0:	00008293          	mv	t0,ra
8000d3a4:	fb5ff0ef          	jal	ra,8000d358 <__udivsi3>
8000d3a8:	00058513          	mv	a0,a1
8000d3ac:	00028067          	jr	t0 # 8000ccfc <memset+0xb4>
8000d3b0:	40a00533          	neg	a0,a0
8000d3b4:	0005d863          	bgez	a1,8000d3c4 <__umodsi3+0x24>
8000d3b8:	40b005b3          	neg	a1,a1
8000d3bc:	f9dff06f          	j	8000d358 <__udivsi3>
8000d3c0:	40b005b3          	neg	a1,a1
8000d3c4:	00008293          	mv	t0,ra
8000d3c8:	f91ff0ef          	jal	ra,8000d358 <__udivsi3>
8000d3cc:	40a00533          	neg	a0,a0
8000d3d0:	00028067          	jr	t0

8000d3d4 <__modsi3>:
8000d3d4:	00008293          	mv	t0,ra
8000d3d8:	0005ca63          	bltz	a1,8000d3ec <__modsi3+0x18>
8000d3dc:	00054c63          	bltz	a0,8000d3f4 <__modsi3+0x20>
8000d3e0:	f79ff0ef          	jal	ra,8000d358 <__udivsi3>
8000d3e4:	00058513          	mv	a0,a1
8000d3e8:	00028067          	jr	t0
8000d3ec:	40b005b3          	neg	a1,a1
8000d3f0:	fe0558e3          	bgez	a0,8000d3e0 <__modsi3+0xc>
8000d3f4:	40a00533          	neg	a0,a0
8000d3f8:	f61ff0ef          	jal	ra,8000d358 <__udivsi3>
8000d3fc:	40b00533          	neg	a0,a1
8000d400:	00028067          	jr	t0

Disassembly of section .text.startup:

8000d404 <main>:
8000d404:	fb010113          	addi	sp,sp,-80
8000d408:	04112623          	sw	ra,76(sp)
8000d40c:	04812423          	sw	s0,72(sp)
8000d410:	04912223          	sw	s1,68(sp)
8000d414:	05212023          	sw	s2,64(sp)
8000d418:	03312e23          	sw	s3,60(sp)
8000d41c:	03412c23          	sw	s4,56(sp)
8000d420:	03512a23          	sw	s5,52(sp)
8000d424:	03612823          	sw	s6,48(sp)
8000d428:	03712623          	sw	s7,44(sp)
8000d42c:	03812423          	sw	s8,40(sp)
8000d430:	30047073          	csrci	mstatus,8
8000d434:	00000593          	li	a1,0
8000d438:	00000513          	li	a0,0
8000d43c:	f3cf80ef          	jal	ra,80005b78 <init_sbrk>
8000d440:	001e8537          	lui	a0,0x1e8
8000d444:	48050513          	addi	a0,a0,1152 # 1e8480 <_stack_size+0x1e7c80>
8000d448:	f84f80ef          	jal	ra,80005bcc <delay_us>
8000d44c:	8701a783          	lw	a5,-1936(gp) # 80003118 <deadbeef>
8000d450:	1c078c63          	beqz	a5,8000d628 <main+0x224>
8000d454:	80002537          	lui	a0,0x80002
8000d458:	fd450513          	addi	a0,a0,-44 # 80001fd4 <_ram_heap_end+0xfffeffd4>
8000d45c:	fa0f80ef          	jal	ra,80005bfc <print_uart0>
8000d460:	8e1f80ef          	jal	ra,80005d40 <hard_reboot>
8000d464:	80002537          	lui	a0,0x80002
8000d468:	06900593          	li	a1,105
8000d46c:	ffc50513          	addi	a0,a0,-4 # 80001ffc <_ram_heap_end+0xfffefffc>
8000d470:	1a4010ef          	jal	ra,8000e614 <iprintf>
8000d474:	f0000737          	lui	a4,0xf0000
8000d478:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
8000d47c:	80002537          	lui	a0,0x80002
8000d480:	09050513          	addi	a0,a0,144 # 80002090 <_ram_heap_end+0xffff0090>
8000d484:	0027e793          	ori	a5,a5,2
8000d488:	00f72223          	sw	a5,4(a4)
8000d48c:	188010ef          	jal	ra,8000e614 <iprintf>
8000d490:	aa4f60ef          	jal	ra,80003734 <sram_test_write_random_ints>
8000d494:	80002437          	lui	s0,0x80002
8000d498:	1a051063          	bnez	a0,8000d638 <main+0x234>
8000d49c:	80002537          	lui	a0,0x80002
8000d4a0:	0a050513          	addi	a0,a0,160 # 800020a0 <_ram_heap_end+0xffff00a0>
8000d4a4:	170010ef          	jal	ra,8000e614 <iprintf>
8000d4a8:	000805b7          	lui	a1,0x80
8000d4ac:	90000537          	lui	a0,0x90000
8000d4b0:	ec8f80ef          	jal	ra,80005b78 <init_sbrk>
8000d4b4:	800025b7          	lui	a1,0x80002
8000d4b8:	0b458593          	addi	a1,a1,180 # 800020b4 <_ram_heap_end+0xffff00b4>
8000d4bc:	0bc40513          	addi	a0,s0,188 # 800020bc <_ram_heap_end+0xffff00bc>
8000d4c0:	154010ef          	jal	ra,8000e614 <iprintf>
8000d4c4:	f00547b7          	lui	a5,0xf0054
8000d4c8:	0007a023          	sw	zero,0(a5) # f0054000 <_ram_heap_end+0x70042000>
8000d4cc:	f0000737          	lui	a4,0xf0000
8000d4d0:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
8000d4d4:	01900613          	li	a2,25
8000d4d8:	00100693          	li	a3,1
8000d4dc:	ff77f793          	andi	a5,a5,-9
8000d4e0:	00f72223          	sw	a5,4(a4)
8000d4e4:	f00607b7          	lui	a5,0xf0060
8000d4e8:	03f00713          	li	a4,63
8000d4ec:	00e7a623          	sw	a4,12(a5) # f006000c <_ram_heap_end+0x7004e00c>
8000d4f0:	0007a223          	sw	zero,4(a5)
8000d4f4:	fff00713          	li	a4,-1
8000d4f8:	00e7a023          	sw	a4,0(a5)
8000d4fc:	f0010737          	lui	a4,0xf0010
8000d500:	00472783          	lw	a5,4(a4) # f0010004 <_ram_heap_end+0x6fffe004>
8000d504:	f0090537          	lui	a0,0xf0090
8000d508:	0027e793          	ori	a5,a5,2
8000d50c:	00f72223          	sw	a5,4(a4)
8000d510:	f0011737          	lui	a4,0xf0011
8000d514:	00472783          	lw	a5,4(a4) # f0011004 <_ram_heap_end+0x6ffff004>
8000d518:	0027e793          	ori	a5,a5,2
8000d51c:	00f72223          	sw	a5,4(a4)
8000d520:	f00207b7          	lui	a5,0xf0020
8000d524:	0007a023          	sw	zero,0(a5) # f0020000 <_ram_heap_end+0x7000e000>
8000d528:	00c7a223          	sw	a2,4(a5)
8000d52c:	0007a423          	sw	zero,8(a5)
8000d530:	00018737          	lui	a4,0x18
8000d534:	0007a623          	sw	zero,12(a5)
8000d538:	6a070713          	addi	a4,a4,1696 # 186a0 <_stack_size+0x17ea0>
8000d53c:	00e7a823          	sw	a4,16(a5)
8000d540:	00d7a023          	sw	a3,0(a5)
8000d544:	f00217b7          	lui	a5,0xf0021
8000d548:	0007a023          	sw	zero,0(a5) # f0021000 <_ram_heap_end+0x7000f000>
8000d54c:	00c7a223          	sw	a2,4(a5)
8000d550:	0007a423          	sw	zero,8(a5)
8000d554:	0000c737          	lui	a4,0xc
8000d558:	0007a623          	sw	zero,12(a5)
8000d55c:	35070713          	addi	a4,a4,848 # c350 <_stack_size+0xbb50>
8000d560:	00e7a823          	sw	a4,16(a5)
8000d564:	00d7a023          	sw	a3,0(a5)
8000d568:	da4f80ef          	jal	ra,80005b0c <i2c_init>
8000d56c:	30046073          	csrsi	mstatus,8
8000d570:	80c1a783          	lw	a5,-2036(gp) # 800030b4 <_impure_ptr>
8000d574:	0007a937          	lui	s2,0x7a
8000d578:	0087a503          	lw	a0,8(a5)
8000d57c:	00a00493          	li	s1,10
8000d580:	00200a93          	li	s5,2
8000d584:	28d000ef          	jal	ra,8000e010 <fpurge>
8000d588:	80002537          	lui	a0,0x80002
8000d58c:	0d450513          	addi	a0,a0,212 # 800020d4 <_ram_heap_end+0xffff00d4>
8000d590:	084010ef          	jal	ra,8000e614 <iprintf>
8000d594:	80c1a783          	lw	a5,-2036(gp) # 800030b4 <_impure_ptr>
8000d598:	000a0993          	mv	s3,s4
8000d59c:	f0000b37          	lui	s6,0xf0000
8000d5a0:	0087a503          	lw	a0,8(a5)
8000d5a4:	12090913          	addi	s2,s2,288 # 7a120 <_stack_size+0x79920>
8000d5a8:	668000ef          	jal	ra,8000dc10 <fflush>
8000d5ac:	87c1a783          	lw	a5,-1924(gp) # 80003124 <uart_config_reset_counter>
8000d5b0:	02fae863          	bltu	s5,a5,8000d5e0 <main+0x1dc>
8000d5b4:	000b2783          	lw	a5,0(s6) # f0000000 <_ram_heap_end+0x6ffee000>
8000d5b8:	0207d463          	bgez	a5,8000d5e0 <main+0x1dc>
8000d5bc:	02e00513          	li	a0,46
8000d5c0:	10c010ef          	jal	ra,8000e6cc <putchar>
8000d5c4:	80c1a783          	lw	a5,-2036(gp) # 800030b4 <_impure_ptr>
8000d5c8:	fff48493          	addi	s1,s1,-1
8000d5cc:	0087a503          	lw	a0,8(a5)
8000d5d0:	640000ef          	jal	ra,8000dc10 <fflush>
8000d5d4:	00090513          	mv	a0,s2
8000d5d8:	df4f80ef          	jal	ra,80005bcc <delay_us>
8000d5dc:	fc0498e3          	bnez	s1,8000d5ac <main+0x1a8>
8000d5e0:	80003537          	lui	a0,0x80003
8000d5e4:	87450513          	addi	a0,a0,-1932 # 80002874 <_ram_heap_end+0xffff0874>
8000d5e8:	02c010ef          	jal	ra,8000e614 <iprintf>
8000d5ec:	800034b7          	lui	s1,0x80003
8000d5f0:	02000613          	li	a2,32
8000d5f4:	01848593          	addi	a1,s1,24 # 80003018 <_ram_heap_end+0xffff1018>
8000d5f8:	99418513          	addi	a0,gp,-1644 # 8000323c <active_config>
8000d5fc:	3d9000ef          	jal	ra,8000e1d4 <memcpy>
8000d600:	87c1a703          	lw	a4,-1924(gp) # 80003124 <uart_config_reset_counter>
8000d604:	00200793          	li	a5,2
8000d608:	02e7fe63          	bgeu	a5,a4,8000d644 <main+0x240>
8000d60c:	800025b7          	lui	a1,0x80002
8000d610:	8601ae23          	sw	zero,-1924(gp) # 80003124 <uart_config_reset_counter>
8000d614:	0f058593          	addi	a1,a1,240 # 800020f0 <_ram_heap_end+0xffff00f0>
8000d618:	80002537          	lui	a0,0x80002
8000d61c:	10050513          	addi	a0,a0,256 # 80002100 <_ram_heap_end+0xffff0100>
8000d620:	7f5000ef          	jal	ra,8000e614 <iprintf>
8000d624:	05c0006f          	j	8000d680 <main+0x27c>
8000d628:	deadc7b7          	lui	a5,0xdeadc
8000d62c:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac9eef>
8000d630:	86f1a823          	sw	a5,-1936(gp) # 80003118 <deadbeef>
8000d634:	e31ff06f          	j	8000d464 <main+0x60>
8000d638:	800025b7          	lui	a1,0x80002
8000d63c:	0c858593          	addi	a1,a1,200 # 800020c8 <_ram_heap_end+0xffff00c8>
8000d640:	e7dff06f          	j	8000d4bc <main+0xb8>
8000d644:	f00007b7          	lui	a5,0xf0000
8000d648:	0007a783          	lw	a5,0(a5) # f0000000 <_ram_heap_end+0x6ffee000>
8000d64c:	0007c863          	bltz	a5,8000d65c <main+0x258>
8000d650:	800025b7          	lui	a1,0x80002
8000d654:	11c58593          	addi	a1,a1,284 # 8000211c <_ram_heap_end+0xffff011c>
8000d658:	fc1ff06f          	j	8000d618 <main+0x214>
8000d65c:	f0090537          	lui	a0,0xf0090
8000d660:	c61f60ef          	jal	ra,800042c0 <eeprom_probe>
8000d664:	2e051463          	bnez	a0,8000d94c <main+0x548>
8000d668:	99418513          	addi	a0,gp,-1644 # 8000323c <active_config>
8000d66c:	decf60ef          	jal	ra,80003c58 <config_load>
8000d670:	2c051063          	bnez	a0,8000d930 <main+0x52c>
8000d674:	80002537          	lui	a0,0x80002
8000d678:	12850513          	addi	a0,a0,296 # 80002128 <_ram_heap_end+0xffff0128>
8000d67c:	799000ef          	jal	ra,8000e614 <iprintf>
8000d680:	30047073          	csrci	mstatus,8
8000d684:	99418413          	addi	s0,gp,-1644 # 8000323c <active_config>
8000d688:	01344503          	lbu	a0,19(s0)
8000d68c:	ca1f70ef          	jal	ra,8000532c <hub_init>
8000d690:	83df70ef          	jal	ra,80004ecc <mac_lwip_init>
8000d694:	9a8f80ef          	jal	ra,8000583c <modbus_udp_init>
8000d698:	b70f60ef          	jal	ra,80003a08 <modbus_rtu_init>
8000d69c:	80002537          	lui	a0,0x80002
8000d6a0:	16c50513          	addi	a0,a0,364 # 8000216c <_ram_heap_end+0xffff016c>
8000d6a4:	771000ef          	jal	ra,8000e614 <iprintf>
8000d6a8:	f0000737          	lui	a4,0xf0000
8000d6ac:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
8000d6b0:	ff87f793          	andi	a5,a5,-8
8000d6b4:	00f72223          	sw	a5,4(a4)
8000d6b8:	30046073          	csrsi	mstatus,8
8000d6bc:	80002537          	lui	a0,0x80002
8000d6c0:	18450513          	addi	a0,a0,388 # 80002184 <_ram_heap_end+0xffff0184>
8000d6c4:	751000ef          	jal	ra,8000e614 <iprintf>
8000d6c8:	800004b7          	lui	s1,0x80000
8000d6cc:	800026b7          	lui	a3,0x80002
8000d6d0:	13448793          	addi	a5,s1,308 # 80000134 <_ram_heap_end+0xfffee134>
8000d6d4:	00800893          	li	a7,8
8000d6d8:	00600813          	li	a6,6
8000d6dc:	00500713          	li	a4,5
8000d6e0:	1a468693          	addi	a3,a3,420 # 800021a4 <_ram_heap_end+0xffff01a4>
8000d6e4:	03f00613          	li	a2,63
8000d6e8:	00000593          	li	a1,0
8000d6ec:	00600513          	li	a0,6
8000d6f0:	868f80ef          	jal	ra,80005758 <hub_print>
8000d6f4:	01444603          	lbu	a2,20(s0)
8000d6f8:	800025b7          	lui	a1,0x80002
8000d6fc:	1ac58593          	addi	a1,a1,428 # 800021ac <_ram_heap_end+0xffff01ac>
8000d700:	00010513          	mv	a0,sp
8000d704:	2fc010ef          	jal	ra,8000ea00 <siprintf>
8000d708:	13448793          	addi	a5,s1,308
8000d70c:	00050713          	mv	a4,a0
8000d710:	00800893          	li	a7,8
8000d714:	00600813          	li	a6,6
8000d718:	00010693          	mv	a3,sp
8000d71c:	03f00613          	li	a2,63
8000d720:	00800593          	li	a1,8
8000d724:	00000513          	li	a0,0
8000d728:	830f80ef          	jal	ra,80005758 <hub_print>
8000d72c:	001e8937          	lui	s2,0x1e8
8000d730:	48090513          	addi	a0,s2,1152 # 1e8480 <_stack_size+0x1e7c80>
8000d734:	f69f50ef          	jal	ra,8000369c <process_and_wait>
8000d738:	800026b7          	lui	a3,0x80002
8000d73c:	13448793          	addi	a5,s1,308
8000d740:	00800893          	li	a7,8
8000d744:	00600813          	li	a6,6
8000d748:	00500713          	li	a4,5
8000d74c:	1b068693          	addi	a3,a3,432 # 800021b0 <_ram_heap_end+0xffff01b0>
8000d750:	03f00613          	li	a2,63
8000d754:	00000593          	li	a1,0
8000d758:	00600513          	li	a0,6
8000d75c:	ffdf70ef          	jal	ra,80005758 <hub_print>
8000d760:	9b418413          	addi	s0,gp,-1612 # 8000325c <default_netif>
8000d764:	00444603          	lbu	a2,4(s0)
8000d768:	800029b7          	lui	s3,0x80002
8000d76c:	1b898593          	addi	a1,s3,440 # 800021b8 <_ram_heap_end+0xffff01b8>
8000d770:	00010513          	mv	a0,sp
8000d774:	28c010ef          	jal	ra,8000ea00 <siprintf>
8000d778:	13448793          	addi	a5,s1,308
8000d77c:	00050713          	mv	a4,a0
8000d780:	00800893          	li	a7,8
8000d784:	00600813          	li	a6,6
8000d788:	00010693          	mv	a3,sp
8000d78c:	03f00613          	li	a2,63
8000d790:	00800593          	li	a1,8
8000d794:	00000513          	li	a0,0
8000d798:	fc1f70ef          	jal	ra,80005758 <hub_print>
8000d79c:	48090513          	addi	a0,s2,1152
8000d7a0:	efdf50ef          	jal	ra,8000369c <process_and_wait>
8000d7a4:	00544603          	lbu	a2,5(s0)
8000d7a8:	1b898593          	addi	a1,s3,440
8000d7ac:	00010513          	mv	a0,sp
8000d7b0:	250010ef          	jal	ra,8000ea00 <siprintf>
8000d7b4:	13448793          	addi	a5,s1,308
8000d7b8:	00050713          	mv	a4,a0
8000d7bc:	00800893          	li	a7,8
8000d7c0:	00600813          	li	a6,6
8000d7c4:	00010693          	mv	a3,sp
8000d7c8:	03f00613          	li	a2,63
8000d7cc:	00800593          	li	a1,8
8000d7d0:	00000513          	li	a0,0
8000d7d4:	f85f70ef          	jal	ra,80005758 <hub_print>
8000d7d8:	48090513          	addi	a0,s2,1152
8000d7dc:	ec1f50ef          	jal	ra,8000369c <process_and_wait>
8000d7e0:	00644603          	lbu	a2,6(s0)
8000d7e4:	1b898593          	addi	a1,s3,440
8000d7e8:	00010513          	mv	a0,sp
8000d7ec:	214010ef          	jal	ra,8000ea00 <siprintf>
8000d7f0:	13448793          	addi	a5,s1,308
8000d7f4:	00050713          	mv	a4,a0
8000d7f8:	00800893          	li	a7,8
8000d7fc:	00600813          	li	a6,6
8000d800:	00010693          	mv	a3,sp
8000d804:	03f00613          	li	a2,63
8000d808:	00800593          	li	a1,8
8000d80c:	00000513          	li	a0,0
8000d810:	f49f70ef          	jal	ra,80005758 <hub_print>
8000d814:	48090513          	addi	a0,s2,1152
8000d818:	e85f50ef          	jal	ra,8000369c <process_and_wait>
8000d81c:	00744603          	lbu	a2,7(s0)
8000d820:	1b898593          	addi	a1,s3,440
8000d824:	00010513          	mv	a0,sp
8000d828:	1d8010ef          	jal	ra,8000ea00 <siprintf>
8000d82c:	13448793          	addi	a5,s1,308
8000d830:	00050713          	mv	a4,a0
8000d834:	00800893          	li	a7,8
8000d838:	00600813          	li	a6,6
8000d83c:	00010693          	mv	a3,sp
8000d840:	03f00613          	li	a2,63
8000d844:	00800593          	li	a1,8
8000d848:	00000513          	li	a0,0
8000d84c:	f0df70ef          	jal	ra,80005758 <hub_print>
8000d850:	48090513          	addi	a0,s2,1152
8000d854:	e49f50ef          	jal	ra,8000369c <process_and_wait>
8000d858:	8b81a603          	lw	a2,-1864(gp) # 80003160 <hub_frame_size>
8000d85c:	00000593          	li	a1,0
8000d860:	f0050537          	lui	a0,0xf0050
8000d864:	0007a4b7          	lui	s1,0x7a
8000d868:	be0ff0ef          	jal	ra,8000cc48 <memset>
8000d86c:	12048493          	addi	s1,s1,288 # 7a120 <_stack_size+0x79920>
8000d870:	80002bb7          	lui	s7,0x80002
8000d874:	80002c37          	lui	s8,0x80002
8000d878:	f0000937          	lui	s2,0xf0000
8000d87c:	00492783          	lw	a5,4(s2) # f0000004 <_ram_heap_end+0x6ffee004>
8000d880:	00048513          	mv	a0,s1
8000d884:	0017e793          	ori	a5,a5,1
8000d888:	00f92223          	sw	a5,4(s2)
8000d88c:	e11f50ef          	jal	ra,8000369c <process_and_wait>
8000d890:	00492783          	lw	a5,4(s2)
8000d894:	00048513          	mv	a0,s1
8000d898:	ffe7f793          	andi	a5,a5,-2
8000d89c:	00f92223          	sw	a5,4(s2)
8000d8a0:	dfdf50ef          	jal	ra,8000369c <process_and_wait>
8000d8a4:	30047073          	csrci	mstatus,8
8000d8a8:	f00547b7          	lui	a5,0xf0054
8000d8ac:	0007a603          	lw	a2,0(a5) # f0054000 <_ram_heap_end+0x70042000>
8000d8b0:	8c81a883          	lw	a7,-1848(gp) # 80003170 <sbrk_heap_end>
8000d8b4:	88c1a703          	lw	a4,-1908(gp) # 80003134 <reg_irq_counter>
8000d8b8:	8b81a683          	lw	a3,-1864(gp) # 80003160 <hub_frame_size>
8000d8bc:	8881a783          	lw	a5,-1912(gp) # 80003130 <reg_sys_counter>
8000d8c0:	8841a803          	lw	a6,-1916(gp) # 8000312c <reg_scratch>
8000d8c4:	07f67613          	andi	a2,a2,127
8000d8c8:	06900593          	li	a1,105
8000d8cc:	1c0b8513          	addi	a0,s7,448 # 800021c0 <_ram_heap_end+0xffff01c0>
8000d8d0:	545000ef          	jal	ra,8000e614 <iprintf>
8000d8d4:	f00607b7          	lui	a5,0xf0060
8000d8d8:	0007a583          	lw	a1,0(a5) # f0060000 <_ram_heap_end+0x7004e000>
8000d8dc:	0047a603          	lw	a2,4(a5)
8000d8e0:	00c7a683          	lw	a3,12(a5)
8000d8e4:	0087a703          	lw	a4,8(a5)
8000d8e8:	0107a783          	lw	a5,16(a5)
8000d8ec:	23cc0513          	addi	a0,s8,572 # 8000223c <_ram_heap_end+0xffff023c>
8000d8f0:	525000ef          	jal	ra,8000e614 <iprintf>
8000d8f4:	9f5f70ef          	jal	ra,800052e8 <mac_print_stats>
8000d8f8:	30046073          	csrsi	mstatus,8
8000d8fc:	8881a783          	lw	a5,-1912(gp) # 80003130 <reg_sys_counter>
8000d900:	00178793          	addi	a5,a5,1
8000d904:	88f1a423          	sw	a5,-1912(gp) # 80003130 <reg_sys_counter>
8000d908:	8801a703          	lw	a4,-1920(gp) # 80003128 <reg_config_write>
8000d90c:	00070863          	beqz	a4,8000d91c <main+0x518>
8000d910:	8801a703          	lw	a4,-1920(gp) # 80003128 <reg_config_write>
8000d914:	fff70713          	addi	a4,a4,-1
8000d918:	88e1a023          	sw	a4,-1920(gp) # 80003128 <reg_config_write>
8000d91c:	f0000737          	lui	a4,0xf0000
8000d920:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
8000d924:	ffd7f793          	andi	a5,a5,-3
8000d928:	00f72223          	sw	a5,4(a4)
8000d92c:	f4dff06f          	j	8000d878 <main+0x474>
8000d930:	01848593          	addi	a1,s1,24
8000d934:	02000613          	li	a2,32
8000d938:	99418513          	addi	a0,gp,-1644 # 8000323c <active_config>
8000d93c:	099000ef          	jal	ra,8000e1d4 <memcpy>
8000d940:	800025b7          	lui	a1,0x80002
8000d944:	14458593          	addi	a1,a1,324 # 80002144 <_ram_heap_end+0xffff0144>
8000d948:	cd1ff06f          	j	8000d618 <main+0x214>
8000d94c:	800025b7          	lui	a1,0x80002
8000d950:	15858593          	addi	a1,a1,344 # 80002158 <_ram_heap_end+0xffff0158>
8000d954:	cc5ff06f          	j	8000d618 <main+0x214>

Disassembly of section .text.atoi:

8000d958 <atoi>:
8000d958:	00a00613          	li	a2,10
8000d95c:	00000593          	li	a1,0
8000d960:	4d00106f          	j	8000ee30 <strtol>

Disassembly of section .text._atoi_r:

8000d964 <_atoi_r>:
8000d964:	00a00693          	li	a3,10
8000d968:	00000613          	li	a2,0
8000d96c:	4a80106f          	j	8000ee14 <_strtol_r>

Disassembly of section .text.calloc:

8000d970 <calloc>:
8000d970:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000d974:	00058613          	mv	a2,a1
8000d978:	00050593          	mv	a1,a0
8000d97c:	0007a503          	lw	a0,0(a5)
8000d980:	1890006f          	j	8000e308 <_calloc_r>

Disassembly of section .text.__sflush_r:

8000d984 <__sflush_r>:
8000d984:	00c5d783          	lhu	a5,12(a1)
8000d988:	fe010113          	addi	sp,sp,-32
8000d98c:	00812c23          	sw	s0,24(sp)
8000d990:	00912a23          	sw	s1,20(sp)
8000d994:	00112e23          	sw	ra,28(sp)
8000d998:	01212823          	sw	s2,16(sp)
8000d99c:	01312623          	sw	s3,12(sp)
8000d9a0:	0087f713          	andi	a4,a5,8
8000d9a4:	00050493          	mv	s1,a0
8000d9a8:	00058413          	mv	s0,a1
8000d9ac:	14071e63          	bnez	a4,8000db08 <__sflush_r+0x184>
8000d9b0:	0045a703          	lw	a4,4(a1)
8000d9b4:	00e04a63          	bgtz	a4,8000d9c8 <__sflush_r+0x44>
8000d9b8:	0405a703          	lw	a4,64(a1)
8000d9bc:	00e04663          	bgtz	a4,8000d9c8 <__sflush_r+0x44>
8000d9c0:	00000513          	li	a0,0
8000d9c4:	11c0006f          	j	8000dae0 <__sflush_r+0x15c>
8000d9c8:	02c42703          	lw	a4,44(s0)
8000d9cc:	fe070ae3          	beqz	a4,8000d9c0 <__sflush_r+0x3c>
8000d9d0:	0004a903          	lw	s2,0(s1)
8000d9d4:	01379693          	slli	a3,a5,0x13
8000d9d8:	0004a023          	sw	zero,0(s1)
8000d9dc:	0a06de63          	bgez	a3,8000da98 <__sflush_r+0x114>
8000d9e0:	05442503          	lw	a0,84(s0)
8000d9e4:	00c45783          	lhu	a5,12(s0)
8000d9e8:	0047f793          	andi	a5,a5,4
8000d9ec:	00078e63          	beqz	a5,8000da08 <__sflush_r+0x84>
8000d9f0:	00442783          	lw	a5,4(s0)
8000d9f4:	40f50533          	sub	a0,a0,a5
8000d9f8:	03442783          	lw	a5,52(s0)
8000d9fc:	00078663          	beqz	a5,8000da08 <__sflush_r+0x84>
8000da00:	04042783          	lw	a5,64(s0)
8000da04:	40f50533          	sub	a0,a0,a5
8000da08:	02c42783          	lw	a5,44(s0)
8000da0c:	02042583          	lw	a1,32(s0)
8000da10:	00050613          	mv	a2,a0
8000da14:	00000693          	li	a3,0
8000da18:	00048513          	mv	a0,s1
8000da1c:	000780e7          	jalr	a5
8000da20:	fff00793          	li	a5,-1
8000da24:	00c45703          	lhu	a4,12(s0)
8000da28:	02f51263          	bne	a0,a5,8000da4c <__sflush_r+0xc8>
8000da2c:	0004a683          	lw	a3,0(s1)
8000da30:	01d00793          	li	a5,29
8000da34:	0cd7e463          	bltu	a5,a3,8000dafc <__sflush_r+0x178>
8000da38:	204007b7          	lui	a5,0x20400
8000da3c:	00178793          	addi	a5,a5,1 # 20400001 <_stack_size+0x203ff801>
8000da40:	00d7d7b3          	srl	a5,a5,a3
8000da44:	0017f793          	andi	a5,a5,1
8000da48:	0a078a63          	beqz	a5,8000dafc <__sflush_r+0x178>
8000da4c:	01042783          	lw	a5,16(s0)
8000da50:	00042223          	sw	zero,4(s0)
8000da54:	00f42023          	sw	a5,0(s0)
8000da58:	01371793          	slli	a5,a4,0x13
8000da5c:	0007dc63          	bgez	a5,8000da74 <__sflush_r+0xf0>
8000da60:	fff00793          	li	a5,-1
8000da64:	00f51663          	bne	a0,a5,8000da70 <__sflush_r+0xec>
8000da68:	0004a783          	lw	a5,0(s1)
8000da6c:	00079463          	bnez	a5,8000da74 <__sflush_r+0xf0>
8000da70:	04a42a23          	sw	a0,84(s0)
8000da74:	03442583          	lw	a1,52(s0)
8000da78:	0124a023          	sw	s2,0(s1)
8000da7c:	f40582e3          	beqz	a1,8000d9c0 <__sflush_r+0x3c>
8000da80:	04440793          	addi	a5,s0,68
8000da84:	00f58663          	beq	a1,a5,8000da90 <__sflush_r+0x10c>
8000da88:	00048513          	mv	a0,s1
8000da8c:	0d1000ef          	jal	ra,8000e35c <_free_r>
8000da90:	02042a23          	sw	zero,52(s0)
8000da94:	f2dff06f          	j	8000d9c0 <__sflush_r+0x3c>
8000da98:	02042583          	lw	a1,32(s0)
8000da9c:	00100693          	li	a3,1
8000daa0:	00000613          	li	a2,0
8000daa4:	00048513          	mv	a0,s1
8000daa8:	000700e7          	jalr	a4
8000daac:	fff00793          	li	a5,-1
8000dab0:	f2f51ae3          	bne	a0,a5,8000d9e4 <__sflush_r+0x60>
8000dab4:	0004a783          	lw	a5,0(s1)
8000dab8:	f20786e3          	beqz	a5,8000d9e4 <__sflush_r+0x60>
8000dabc:	01d00713          	li	a4,29
8000dac0:	00e78663          	beq	a5,a4,8000dacc <__sflush_r+0x148>
8000dac4:	01600713          	li	a4,22
8000dac8:	00e79663          	bne	a5,a4,8000dad4 <__sflush_r+0x150>
8000dacc:	0124a023          	sw	s2,0(s1)
8000dad0:	ef1ff06f          	j	8000d9c0 <__sflush_r+0x3c>
8000dad4:	00c45783          	lhu	a5,12(s0)
8000dad8:	0407e793          	ori	a5,a5,64
8000dadc:	00f41623          	sh	a5,12(s0)
8000dae0:	01c12083          	lw	ra,28(sp)
8000dae4:	01812403          	lw	s0,24(sp)
8000dae8:	01412483          	lw	s1,20(sp)
8000daec:	01012903          	lw	s2,16(sp)
8000daf0:	00c12983          	lw	s3,12(sp)
8000daf4:	02010113          	addi	sp,sp,32
8000daf8:	00008067          	ret
8000dafc:	04076713          	ori	a4,a4,64
8000db00:	00e41623          	sh	a4,12(s0)
8000db04:	fddff06f          	j	8000dae0 <__sflush_r+0x15c>
8000db08:	0105a983          	lw	s3,16(a1)
8000db0c:	ea098ae3          	beqz	s3,8000d9c0 <__sflush_r+0x3c>
8000db10:	0005a903          	lw	s2,0(a1)
8000db14:	0037f793          	andi	a5,a5,3
8000db18:	0135a023          	sw	s3,0(a1)
8000db1c:	41390933          	sub	s2,s2,s3
8000db20:	00000713          	li	a4,0
8000db24:	00079463          	bnez	a5,8000db2c <__sflush_r+0x1a8>
8000db28:	0145a703          	lw	a4,20(a1)
8000db2c:	00e42423          	sw	a4,8(s0)
8000db30:	e92058e3          	blez	s2,8000d9c0 <__sflush_r+0x3c>
8000db34:	02842783          	lw	a5,40(s0)
8000db38:	02042583          	lw	a1,32(s0)
8000db3c:	00090693          	mv	a3,s2
8000db40:	00098613          	mv	a2,s3
8000db44:	00048513          	mv	a0,s1
8000db48:	000780e7          	jalr	a5
8000db4c:	00a04c63          	bgtz	a0,8000db64 <__sflush_r+0x1e0>
8000db50:	00c45783          	lhu	a5,12(s0)
8000db54:	fff00513          	li	a0,-1
8000db58:	0407e793          	ori	a5,a5,64
8000db5c:	00f41623          	sh	a5,12(s0)
8000db60:	f81ff06f          	j	8000dae0 <__sflush_r+0x15c>
8000db64:	00a989b3          	add	s3,s3,a0
8000db68:	40a90933          	sub	s2,s2,a0
8000db6c:	fc5ff06f          	j	8000db30 <__sflush_r+0x1ac>

Disassembly of section .text._fflush_r:

8000db70 <_fflush_r>:
8000db70:	0105a783          	lw	a5,16(a1)
8000db74:	08078a63          	beqz	a5,8000dc08 <_fflush_r+0x98>
8000db78:	fe010113          	addi	sp,sp,-32
8000db7c:	00812c23          	sw	s0,24(sp)
8000db80:	00112e23          	sw	ra,28(sp)
8000db84:	00050413          	mv	s0,a0
8000db88:	00050c63          	beqz	a0,8000dba0 <_fflush_r+0x30>
8000db8c:	01852783          	lw	a5,24(a0) # f0050018 <_ram_heap_end+0x7003e018>
8000db90:	00079863          	bnez	a5,8000dba0 <_fflush_r+0x30>
8000db94:	00b12623          	sw	a1,12(sp)
8000db98:	1c8000ef          	jal	ra,8000dd60 <__sinit>
8000db9c:	00c12583          	lw	a1,12(sp)
8000dba0:	ffff5797          	auipc	a5,0xffff5
8000dba4:	2fc78793          	addi	a5,a5,764 # 80002e9c <__sf_fake_stdin>
8000dba8:	02f59263          	bne	a1,a5,8000dbcc <_fflush_r+0x5c>
8000dbac:	00442583          	lw	a1,4(s0)
8000dbb0:	00c59783          	lh	a5,12(a1)
8000dbb4:	04078063          	beqz	a5,8000dbf4 <_fflush_r+0x84>
8000dbb8:	00040513          	mv	a0,s0
8000dbbc:	01812403          	lw	s0,24(sp)
8000dbc0:	01c12083          	lw	ra,28(sp)
8000dbc4:	02010113          	addi	sp,sp,32
8000dbc8:	dbdff06f          	j	8000d984 <__sflush_r>
8000dbcc:	ffff5797          	auipc	a5,0xffff5
8000dbd0:	2f078793          	addi	a5,a5,752 # 80002ebc <__sf_fake_stdout>
8000dbd4:	00f59663          	bne	a1,a5,8000dbe0 <_fflush_r+0x70>
8000dbd8:	00842583          	lw	a1,8(s0)
8000dbdc:	fd5ff06f          	j	8000dbb0 <_fflush_r+0x40>
8000dbe0:	ffff5797          	auipc	a5,0xffff5
8000dbe4:	29c78793          	addi	a5,a5,668 # 80002e7c <__sf_fake_stderr>
8000dbe8:	fcf594e3          	bne	a1,a5,8000dbb0 <_fflush_r+0x40>
8000dbec:	00c42583          	lw	a1,12(s0)
8000dbf0:	fc1ff06f          	j	8000dbb0 <_fflush_r+0x40>
8000dbf4:	01c12083          	lw	ra,28(sp)
8000dbf8:	01812403          	lw	s0,24(sp)
8000dbfc:	00000513          	li	a0,0
8000dc00:	02010113          	addi	sp,sp,32
8000dc04:	00008067          	ret
8000dc08:	00000513          	li	a0,0
8000dc0c:	00008067          	ret

Disassembly of section .text.fflush:

8000dc10 <fflush>:
8000dc10:	00050593          	mv	a1,a0
8000dc14:	00051c63          	bnez	a0,8000dc2c <fflush+0x1c>
8000dc18:	c5018793          	addi	a5,gp,-944 # 800034f8 <_bss_end>
8000dc1c:	0007a503          	lw	a0,0(a5)
8000dc20:	00000597          	auipc	a1,0x0
8000dc24:	f5058593          	addi	a1,a1,-176 # 8000db70 <_fflush_r>
8000dc28:	4a80006f          	j	8000e0d0 <_fwalk_reent>
8000dc2c:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000dc30:	0007a503          	lw	a0,0(a5)
8000dc34:	f3dff06f          	j	8000db70 <_fflush_r>

Disassembly of section .text.__fp_lock:

8000dc38 <__fp_lock>:
8000dc38:	00000513          	li	a0,0
8000dc3c:	00008067          	ret

Disassembly of section .text.std:

8000dc40 <std>:
8000dc40:	ff010113          	addi	sp,sp,-16
8000dc44:	00812423          	sw	s0,8(sp)
8000dc48:	00112623          	sw	ra,12(sp)
8000dc4c:	00050413          	mv	s0,a0
8000dc50:	00b51623          	sh	a1,12(a0)
8000dc54:	00c51723          	sh	a2,14(a0)
8000dc58:	00052023          	sw	zero,0(a0)
8000dc5c:	00052223          	sw	zero,4(a0)
8000dc60:	00052423          	sw	zero,8(a0)
8000dc64:	06052223          	sw	zero,100(a0)
8000dc68:	00052823          	sw	zero,16(a0)
8000dc6c:	00052a23          	sw	zero,20(a0)
8000dc70:	00052c23          	sw	zero,24(a0)
8000dc74:	00800613          	li	a2,8
8000dc78:	00000593          	li	a1,0
8000dc7c:	05c50513          	addi	a0,a0,92
8000dc80:	fc9fe0ef          	jal	ra,8000cc48 <memset>
8000dc84:	00001797          	auipc	a5,0x1
8000dc88:	df078793          	addi	a5,a5,-528 # 8000ea74 <__sread>
8000dc8c:	02f42223          	sw	a5,36(s0)
8000dc90:	00001797          	auipc	a5,0x1
8000dc94:	e3c78793          	addi	a5,a5,-452 # 8000eacc <__swrite>
8000dc98:	02f42423          	sw	a5,40(s0)
8000dc9c:	00001797          	auipc	a5,0x1
8000dca0:	eb478793          	addi	a5,a5,-332 # 8000eb50 <__sseek>
8000dca4:	02f42623          	sw	a5,44(s0)
8000dca8:	00001797          	auipc	a5,0x1
8000dcac:	f0078793          	addi	a5,a5,-256 # 8000eba8 <__sclose>
8000dcb0:	02842023          	sw	s0,32(s0)
8000dcb4:	02f42823          	sw	a5,48(s0)
8000dcb8:	00c12083          	lw	ra,12(sp)
8000dcbc:	00812403          	lw	s0,8(sp)
8000dcc0:	01010113          	addi	sp,sp,16
8000dcc4:	00008067          	ret

Disassembly of section .text._cleanup_r:

8000dcc8 <_cleanup_r>:
8000dcc8:	00000597          	auipc	a1,0x0
8000dccc:	ea858593          	addi	a1,a1,-344 # 8000db70 <_fflush_r>
8000dcd0:	4000006f          	j	8000e0d0 <_fwalk_reent>

Disassembly of section .text.__fp_unlock:

8000dcd4 <__fp_unlock>:
8000dcd4:	00000513          	li	a0,0
8000dcd8:	00008067          	ret

Disassembly of section .text.__sfmoreglue:

8000dcdc <__sfmoreglue>:
8000dcdc:	ff010113          	addi	sp,sp,-16
8000dce0:	fff58613          	addi	a2,a1,-1
8000dce4:	00812423          	sw	s0,8(sp)
8000dce8:	00161413          	slli	s0,a2,0x1
8000dcec:	00c40433          	add	s0,s0,a2
8000dcf0:	00241413          	slli	s0,s0,0x2
8000dcf4:	00c40433          	add	s0,s0,a2
8000dcf8:	00341413          	slli	s0,s0,0x3
8000dcfc:	01212023          	sw	s2,0(sp)
8000dd00:	00058913          	mv	s2,a1
8000dd04:	07440593          	addi	a1,s0,116
8000dd08:	00912223          	sw	s1,4(sp)
8000dd0c:	00112623          	sw	ra,12(sp)
8000dd10:	750000ef          	jal	ra,8000e460 <_malloc_r>
8000dd14:	00050493          	mv	s1,a0
8000dd18:	02050063          	beqz	a0,8000dd38 <__sfmoreglue+0x5c>
8000dd1c:	00052023          	sw	zero,0(a0)
8000dd20:	01252223          	sw	s2,4(a0)
8000dd24:	00c50513          	addi	a0,a0,12
8000dd28:	00a4a423          	sw	a0,8(s1)
8000dd2c:	06840613          	addi	a2,s0,104
8000dd30:	00000593          	li	a1,0
8000dd34:	f15fe0ef          	jal	ra,8000cc48 <memset>
8000dd38:	00c12083          	lw	ra,12(sp)
8000dd3c:	00812403          	lw	s0,8(sp)
8000dd40:	00048513          	mv	a0,s1
8000dd44:	00012903          	lw	s2,0(sp)
8000dd48:	00412483          	lw	s1,4(sp)
8000dd4c:	01010113          	addi	sp,sp,16
8000dd50:	00008067          	ret

Disassembly of section .text._cleanup:

8000dd54 <_cleanup>:
8000dd54:	c5018793          	addi	a5,gp,-944 # 800034f8 <_bss_end>
8000dd58:	0007a503          	lw	a0,0(a5)
8000dd5c:	f6dff06f          	j	8000dcc8 <_cleanup_r>

Disassembly of section .text.__sinit:

8000dd60 <__sinit>:
8000dd60:	01852783          	lw	a5,24(a0)
8000dd64:	0a079463          	bnez	a5,8000de0c <__sinit+0xac>
8000dd68:	ff010113          	addi	sp,sp,-16
8000dd6c:	00112623          	sw	ra,12(sp)
8000dd70:	00812423          	sw	s0,8(sp)
8000dd74:	00000797          	auipc	a5,0x0
8000dd78:	f5478793          	addi	a5,a5,-172 # 8000dcc8 <_cleanup_r>
8000dd7c:	02f52423          	sw	a5,40(a0)
8000dd80:	c5018793          	addi	a5,gp,-944 # 800034f8 <_bss_end>
8000dd84:	0007a783          	lw	a5,0(a5)
8000dd88:	04052423          	sw	zero,72(a0)
8000dd8c:	04052623          	sw	zero,76(a0)
8000dd90:	04052823          	sw	zero,80(a0)
8000dd94:	00f51663          	bne	a0,a5,8000dda0 <__sinit+0x40>
8000dd98:	00100793          	li	a5,1
8000dd9c:	00f52c23          	sw	a5,24(a0)
8000dda0:	00050413          	mv	s0,a0
8000dda4:	06c000ef          	jal	ra,8000de10 <__sfp>
8000dda8:	00a42223          	sw	a0,4(s0)
8000ddac:	00040513          	mv	a0,s0
8000ddb0:	060000ef          	jal	ra,8000de10 <__sfp>
8000ddb4:	00a42423          	sw	a0,8(s0)
8000ddb8:	00040513          	mv	a0,s0
8000ddbc:	054000ef          	jal	ra,8000de10 <__sfp>
8000ddc0:	00a42623          	sw	a0,12(s0)
8000ddc4:	00442503          	lw	a0,4(s0)
8000ddc8:	00000613          	li	a2,0
8000ddcc:	00400593          	li	a1,4
8000ddd0:	e71ff0ef          	jal	ra,8000dc40 <std>
8000ddd4:	00842503          	lw	a0,8(s0)
8000ddd8:	00100613          	li	a2,1
8000dddc:	00900593          	li	a1,9
8000dde0:	e61ff0ef          	jal	ra,8000dc40 <std>
8000dde4:	00c42503          	lw	a0,12(s0)
8000dde8:	00200613          	li	a2,2
8000ddec:	01200593          	li	a1,18
8000ddf0:	e51ff0ef          	jal	ra,8000dc40 <std>
8000ddf4:	00100793          	li	a5,1
8000ddf8:	00f42c23          	sw	a5,24(s0)
8000ddfc:	00c12083          	lw	ra,12(sp)
8000de00:	00812403          	lw	s0,8(sp)
8000de04:	01010113          	addi	sp,sp,16
8000de08:	00008067          	ret
8000de0c:	00008067          	ret

Disassembly of section .text.__sfp:

8000de10 <__sfp>:
8000de10:	ff010113          	addi	sp,sp,-16
8000de14:	c5018793          	addi	a5,gp,-944 # 800034f8 <_bss_end>
8000de18:	00912223          	sw	s1,4(sp)
8000de1c:	0007a483          	lw	s1,0(a5)
8000de20:	01212023          	sw	s2,0(sp)
8000de24:	00112623          	sw	ra,12(sp)
8000de28:	0184a783          	lw	a5,24(s1)
8000de2c:	00812423          	sw	s0,8(sp)
8000de30:	00050913          	mv	s2,a0
8000de34:	00079663          	bnez	a5,8000de40 <__sfp+0x30>
8000de38:	00048513          	mv	a0,s1
8000de3c:	f25ff0ef          	jal	ra,8000dd60 <__sinit>
8000de40:	04848493          	addi	s1,s1,72
8000de44:	0084a403          	lw	s0,8(s1)
8000de48:	0044a783          	lw	a5,4(s1)
8000de4c:	fff78793          	addi	a5,a5,-1
8000de50:	0007da63          	bgez	a5,8000de64 <__sfp+0x54>
8000de54:	0004a783          	lw	a5,0(s1)
8000de58:	08078063          	beqz	a5,8000ded8 <__sfp+0xc8>
8000de5c:	0004a483          	lw	s1,0(s1)
8000de60:	fe5ff06f          	j	8000de44 <__sfp+0x34>
8000de64:	00c41703          	lh	a4,12(s0)
8000de68:	06071463          	bnez	a4,8000ded0 <__sfp+0xc0>
8000de6c:	ffff07b7          	lui	a5,0xffff0
8000de70:	00178793          	addi	a5,a5,1 # ffff0001 <_ram_heap_end+0x7ffde001>
8000de74:	06042223          	sw	zero,100(s0)
8000de78:	00042023          	sw	zero,0(s0)
8000de7c:	00042223          	sw	zero,4(s0)
8000de80:	00042423          	sw	zero,8(s0)
8000de84:	00f42623          	sw	a5,12(s0)
8000de88:	00042823          	sw	zero,16(s0)
8000de8c:	00042a23          	sw	zero,20(s0)
8000de90:	00042c23          	sw	zero,24(s0)
8000de94:	00800613          	li	a2,8
8000de98:	00000593          	li	a1,0
8000de9c:	05c40513          	addi	a0,s0,92
8000dea0:	da9fe0ef          	jal	ra,8000cc48 <memset>
8000dea4:	02042a23          	sw	zero,52(s0)
8000dea8:	02042c23          	sw	zero,56(s0)
8000deac:	04042423          	sw	zero,72(s0)
8000deb0:	04042623          	sw	zero,76(s0)
8000deb4:	00040513          	mv	a0,s0
8000deb8:	00c12083          	lw	ra,12(sp)
8000debc:	00812403          	lw	s0,8(sp)
8000dec0:	00412483          	lw	s1,4(sp)
8000dec4:	00012903          	lw	s2,0(sp)
8000dec8:	01010113          	addi	sp,sp,16
8000decc:	00008067          	ret
8000ded0:	06840413          	addi	s0,s0,104
8000ded4:	f79ff06f          	j	8000de4c <__sfp+0x3c>
8000ded8:	00400593          	li	a1,4
8000dedc:	00090513          	mv	a0,s2
8000dee0:	dfdff0ef          	jal	ra,8000dcdc <__sfmoreglue>
8000dee4:	00a4a023          	sw	a0,0(s1)
8000dee8:	00050413          	mv	s0,a0
8000deec:	f60518e3          	bnez	a0,8000de5c <__sfp+0x4c>
8000def0:	00c00793          	li	a5,12
8000def4:	00f92023          	sw	a5,0(s2)
8000def8:	fbdff06f          	j	8000deb4 <__sfp+0xa4>

Disassembly of section .text.__sfp_lock_acquire:

8000defc <__sfp_lock_acquire>:
8000defc:	00008067          	ret

Disassembly of section .text.__sfp_lock_release:

8000df00 <__sfp_lock_release>:
8000df00:	00008067          	ret

Disassembly of section .text.__sinit_lock_acquire:

8000df04 <__sinit_lock_acquire>:
8000df04:	00008067          	ret

Disassembly of section .text.__sinit_lock_release:

8000df08 <__sinit_lock_release>:
8000df08:	00008067          	ret

Disassembly of section .text.__fp_lock_all:

8000df0c <__fp_lock_all>:
8000df0c:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000df10:	0007a503          	lw	a0,0(a5)
8000df14:	00000597          	auipc	a1,0x0
8000df18:	d2458593          	addi	a1,a1,-732 # 8000dc38 <__fp_lock>
8000df1c:	1140006f          	j	8000e030 <_fwalk>

Disassembly of section .text.__fp_unlock_all:

8000df20 <__fp_unlock_all>:
8000df20:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000df24:	0007a503          	lw	a0,0(a5)
8000df28:	00000597          	auipc	a1,0x0
8000df2c:	dac58593          	addi	a1,a1,-596 # 8000dcd4 <__fp_unlock>
8000df30:	1000006f          	j	8000e030 <_fwalk>

Disassembly of section .text._fpurge_r:

8000df34 <_fpurge_r>:
8000df34:	ff010113          	addi	sp,sp,-16
8000df38:	00812423          	sw	s0,8(sp)
8000df3c:	00912223          	sw	s1,4(sp)
8000df40:	00112623          	sw	ra,12(sp)
8000df44:	00050493          	mv	s1,a0
8000df48:	00058413          	mv	s0,a1
8000df4c:	00050863          	beqz	a0,8000df5c <_fpurge_r+0x28>
8000df50:	01852783          	lw	a5,24(a0)
8000df54:	00079463          	bnez	a5,8000df5c <_fpurge_r+0x28>
8000df58:	e09ff0ef          	jal	ra,8000dd60 <__sinit>
8000df5c:	ffff5797          	auipc	a5,0xffff5
8000df60:	f4078793          	addi	a5,a5,-192 # 80002e9c <__sf_fake_stdin>
8000df64:	02f41863          	bne	s0,a5,8000df94 <_fpurge_r+0x60>
8000df68:	0044a403          	lw	s0,4(s1)
8000df6c:	00c41783          	lh	a5,12(s0)
8000df70:	04079663          	bnez	a5,8000dfbc <_fpurge_r+0x88>
8000df74:	00900793          	li	a5,9
8000df78:	00f4a023          	sw	a5,0(s1)
8000df7c:	fff00513          	li	a0,-1
8000df80:	00c12083          	lw	ra,12(sp)
8000df84:	00812403          	lw	s0,8(sp)
8000df88:	00412483          	lw	s1,4(sp)
8000df8c:	01010113          	addi	sp,sp,16
8000df90:	00008067          	ret
8000df94:	ffff5797          	auipc	a5,0xffff5
8000df98:	f2878793          	addi	a5,a5,-216 # 80002ebc <__sf_fake_stdout>
8000df9c:	00f41663          	bne	s0,a5,8000dfa8 <_fpurge_r+0x74>
8000dfa0:	0084a403          	lw	s0,8(s1)
8000dfa4:	fc9ff06f          	j	8000df6c <_fpurge_r+0x38>
8000dfa8:	ffff5797          	auipc	a5,0xffff5
8000dfac:	ed478793          	addi	a5,a5,-300 # 80002e7c <__sf_fake_stderr>
8000dfb0:	faf41ee3          	bne	s0,a5,8000df6c <_fpurge_r+0x38>
8000dfb4:	00c4a403          	lw	s0,12(s1)
8000dfb8:	fb5ff06f          	j	8000df6c <_fpurge_r+0x38>
8000dfbc:	01042703          	lw	a4,16(s0)
8000dfc0:	00e42023          	sw	a4,0(s0)
8000dfc4:	0087f713          	andi	a4,a5,8
8000dfc8:	02071863          	bnez	a4,8000dff8 <_fpurge_r+0xc4>
8000dfcc:	03442583          	lw	a1,52(s0)
8000dfd0:	00042223          	sw	zero,4(s0)
8000dfd4:	00000513          	li	a0,0
8000dfd8:	fa0584e3          	beqz	a1,8000df80 <_fpurge_r+0x4c>
8000dfdc:	04440793          	addi	a5,s0,68
8000dfe0:	00f58663          	beq	a1,a5,8000dfec <_fpurge_r+0xb8>
8000dfe4:	00048513          	mv	a0,s1
8000dfe8:	374000ef          	jal	ra,8000e35c <_free_r>
8000dfec:	02042a23          	sw	zero,52(s0)
8000dff0:	00000513          	li	a0,0
8000dff4:	f8dff06f          	j	8000df80 <_fpurge_r+0x4c>
8000dff8:	0037f793          	andi	a5,a5,3
8000dffc:	00000713          	li	a4,0
8000e000:	00079463          	bnez	a5,8000e008 <_fpurge_r+0xd4>
8000e004:	01442703          	lw	a4,20(s0)
8000e008:	00e42423          	sw	a4,8(s0)
8000e00c:	fe5ff06f          	j	8000dff0 <_fpurge_r+0xbc>

Disassembly of section .text.fpurge:

8000e010 <fpurge>:
8000e010:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000e014:	00050593          	mv	a1,a0
8000e018:	0007a503          	lw	a0,0(a5)
8000e01c:	f19ff06f          	j	8000df34 <_fpurge_r>

Disassembly of section .text.__fpurge:

8000e020 <__fpurge>:
8000e020:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000e024:	00050593          	mv	a1,a0
8000e028:	0007a503          	lw	a0,0(a5)
8000e02c:	f09ff06f          	j	8000df34 <_fpurge_r>

Disassembly of section .text._fwalk:

8000e030 <_fwalk>:
8000e030:	fd010113          	addi	sp,sp,-48
8000e034:	02812423          	sw	s0,40(sp)
8000e038:	03212023          	sw	s2,32(sp)
8000e03c:	01412c23          	sw	s4,24(sp)
8000e040:	01512a23          	sw	s5,20(sp)
8000e044:	02112623          	sw	ra,44(sp)
8000e048:	02912223          	sw	s1,36(sp)
8000e04c:	01312e23          	sw	s3,28(sp)
8000e050:	04850413          	addi	s0,a0,72
8000e054:	00000913          	li	s2,0
8000e058:	00100a13          	li	s4,1
8000e05c:	fff00a93          	li	s5,-1
8000e060:	02041663          	bnez	s0,8000e08c <_fwalk+0x5c>
8000e064:	02c12083          	lw	ra,44(sp)
8000e068:	02812403          	lw	s0,40(sp)
8000e06c:	00090513          	mv	a0,s2
8000e070:	02412483          	lw	s1,36(sp)
8000e074:	02012903          	lw	s2,32(sp)
8000e078:	01c12983          	lw	s3,28(sp)
8000e07c:	01812a03          	lw	s4,24(sp)
8000e080:	01412a83          	lw	s5,20(sp)
8000e084:	03010113          	addi	sp,sp,48
8000e088:	00008067          	ret
8000e08c:	00842483          	lw	s1,8(s0)
8000e090:	00442983          	lw	s3,4(s0)
8000e094:	fff98993          	addi	s3,s3,-1
8000e098:	0009d663          	bgez	s3,8000e0a4 <_fwalk+0x74>
8000e09c:	00042403          	lw	s0,0(s0)
8000e0a0:	fc1ff06f          	j	8000e060 <_fwalk+0x30>
8000e0a4:	00c4d783          	lhu	a5,12(s1)
8000e0a8:	02fa7063          	bgeu	s4,a5,8000e0c8 <_fwalk+0x98>
8000e0ac:	00e49783          	lh	a5,14(s1)
8000e0b0:	01578c63          	beq	a5,s5,8000e0c8 <_fwalk+0x98>
8000e0b4:	00048513          	mv	a0,s1
8000e0b8:	00b12623          	sw	a1,12(sp)
8000e0bc:	000580e7          	jalr	a1
8000e0c0:	00c12583          	lw	a1,12(sp)
8000e0c4:	00a96933          	or	s2,s2,a0
8000e0c8:	06848493          	addi	s1,s1,104
8000e0cc:	fc9ff06f          	j	8000e094 <_fwalk+0x64>

Disassembly of section .text._fwalk_reent:

8000e0d0 <_fwalk_reent>:
8000e0d0:	fd010113          	addi	sp,sp,-48
8000e0d4:	02812423          	sw	s0,40(sp)
8000e0d8:	03212023          	sw	s2,32(sp)
8000e0dc:	01412c23          	sw	s4,24(sp)
8000e0e0:	01512a23          	sw	s5,20(sp)
8000e0e4:	01612823          	sw	s6,16(sp)
8000e0e8:	01712623          	sw	s7,12(sp)
8000e0ec:	02112623          	sw	ra,44(sp)
8000e0f0:	02912223          	sw	s1,36(sp)
8000e0f4:	01312e23          	sw	s3,28(sp)
8000e0f8:	00050a13          	mv	s4,a0
8000e0fc:	00058a93          	mv	s5,a1
8000e100:	04850413          	addi	s0,a0,72
8000e104:	00000913          	li	s2,0
8000e108:	00100b13          	li	s6,1
8000e10c:	fff00b93          	li	s7,-1
8000e110:	02041a63          	bnez	s0,8000e144 <_fwalk_reent+0x74>
8000e114:	02c12083          	lw	ra,44(sp)
8000e118:	02812403          	lw	s0,40(sp)
8000e11c:	00090513          	mv	a0,s2
8000e120:	02412483          	lw	s1,36(sp)
8000e124:	02012903          	lw	s2,32(sp)
8000e128:	01c12983          	lw	s3,28(sp)
8000e12c:	01812a03          	lw	s4,24(sp)
8000e130:	01412a83          	lw	s5,20(sp)
8000e134:	01012b03          	lw	s6,16(sp)
8000e138:	00c12b83          	lw	s7,12(sp)
8000e13c:	03010113          	addi	sp,sp,48
8000e140:	00008067          	ret
8000e144:	00842483          	lw	s1,8(s0)
8000e148:	00442983          	lw	s3,4(s0)
8000e14c:	fff98993          	addi	s3,s3,-1
8000e150:	0009d663          	bgez	s3,8000e15c <_fwalk_reent+0x8c>
8000e154:	00042403          	lw	s0,0(s0)
8000e158:	fb9ff06f          	j	8000e110 <_fwalk_reent+0x40>
8000e15c:	00c4d783          	lhu	a5,12(s1)
8000e160:	00fb7e63          	bgeu	s6,a5,8000e17c <_fwalk_reent+0xac>
8000e164:	00e49783          	lh	a5,14(s1)
8000e168:	01778a63          	beq	a5,s7,8000e17c <_fwalk_reent+0xac>
8000e16c:	00048593          	mv	a1,s1
8000e170:	000a0513          	mv	a0,s4
8000e174:	000a80e7          	jalr	s5
8000e178:	00a96933          	or	s2,s2,a0
8000e17c:	06848493          	addi	s1,s1,104
8000e180:	fcdff06f          	j	8000e14c <_fwalk_reent+0x7c>

Disassembly of section .text.malloc:

8000e184 <malloc>:
8000e184:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000e188:	00050593          	mv	a1,a0
8000e18c:	0007a503          	lw	a0,0(a5)
8000e190:	2d00006f          	j	8000e460 <_malloc_r>

Disassembly of section .text.free:

8000e194 <free>:
8000e194:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000e198:	00050593          	mv	a1,a0
8000e19c:	0007a503          	lw	a0,0(a5)
8000e1a0:	1bc0006f          	j	8000e35c <_free_r>

Disassembly of section .text.memcmp:

8000e1a4 <memcmp>:
8000e1a4:	00000713          	li	a4,0
8000e1a8:	00e61663          	bne	a2,a4,8000e1b4 <memcmp+0x10>
8000e1ac:	00000513          	li	a0,0
8000e1b0:	00008067          	ret
8000e1b4:	00e507b3          	add	a5,a0,a4
8000e1b8:	00170713          	addi	a4,a4,1
8000e1bc:	00e586b3          	add	a3,a1,a4
8000e1c0:	0007c783          	lbu	a5,0(a5)
8000e1c4:	fff6c683          	lbu	a3,-1(a3)
8000e1c8:	fed780e3          	beq	a5,a3,8000e1a8 <memcmp+0x4>
8000e1cc:	40d78533          	sub	a0,a5,a3
8000e1d0:	00008067          	ret

Disassembly of section .text.memcpy:

8000e1d4 <memcpy>:
8000e1d4:	00a5c7b3          	xor	a5,a1,a0
8000e1d8:	0037f793          	andi	a5,a5,3
8000e1dc:	00c50733          	add	a4,a0,a2
8000e1e0:	00079663          	bnez	a5,8000e1ec <memcpy+0x18>
8000e1e4:	00300793          	li	a5,3
8000e1e8:	02c7e263          	bltu	a5,a2,8000e20c <memcpy+0x38>
8000e1ec:	00050793          	mv	a5,a0
8000e1f0:	0ae57c63          	bgeu	a0,a4,8000e2a8 <memcpy+0xd4>
8000e1f4:	0005c683          	lbu	a3,0(a1)
8000e1f8:	00178793          	addi	a5,a5,1
8000e1fc:	00158593          	addi	a1,a1,1
8000e200:	fed78fa3          	sb	a3,-1(a5)
8000e204:	fee7e8e3          	bltu	a5,a4,8000e1f4 <memcpy+0x20>
8000e208:	00008067          	ret
8000e20c:	00357693          	andi	a3,a0,3
8000e210:	00050793          	mv	a5,a0
8000e214:	00068e63          	beqz	a3,8000e230 <memcpy+0x5c>
8000e218:	0005c683          	lbu	a3,0(a1)
8000e21c:	00178793          	addi	a5,a5,1
8000e220:	00158593          	addi	a1,a1,1
8000e224:	fed78fa3          	sb	a3,-1(a5)
8000e228:	0037f693          	andi	a3,a5,3
8000e22c:	fe9ff06f          	j	8000e214 <memcpy+0x40>
8000e230:	ffc77693          	andi	a3,a4,-4
8000e234:	fe068613          	addi	a2,a3,-32
8000e238:	06c7f463          	bgeu	a5,a2,8000e2a0 <memcpy+0xcc>
8000e23c:	0005a383          	lw	t2,0(a1)
8000e240:	0045a283          	lw	t0,4(a1)
8000e244:	0085af83          	lw	t6,8(a1)
8000e248:	00c5af03          	lw	t5,12(a1)
8000e24c:	0105ae83          	lw	t4,16(a1)
8000e250:	0145ae03          	lw	t3,20(a1)
8000e254:	0185a303          	lw	t1,24(a1)
8000e258:	01c5a883          	lw	a7,28(a1)
8000e25c:	02458593          	addi	a1,a1,36
8000e260:	0077a023          	sw	t2,0(a5)
8000e264:	ffc5a803          	lw	a6,-4(a1)
8000e268:	0057a223          	sw	t0,4(a5)
8000e26c:	01f7a423          	sw	t6,8(a5)
8000e270:	01e7a623          	sw	t5,12(a5)
8000e274:	01d7a823          	sw	t4,16(a5)
8000e278:	01c7aa23          	sw	t3,20(a5)
8000e27c:	0067ac23          	sw	t1,24(a5)
8000e280:	0117ae23          	sw	a7,28(a5)
8000e284:	02478793          	addi	a5,a5,36
8000e288:	ff07ae23          	sw	a6,-4(a5)
8000e28c:	fadff06f          	j	8000e238 <memcpy+0x64>
8000e290:	0005a603          	lw	a2,0(a1)
8000e294:	00478793          	addi	a5,a5,4
8000e298:	00458593          	addi	a1,a1,4
8000e29c:	fec7ae23          	sw	a2,-4(a5)
8000e2a0:	fed7e8e3          	bltu	a5,a3,8000e290 <memcpy+0xbc>
8000e2a4:	f4e7e8e3          	bltu	a5,a4,8000e1f4 <memcpy+0x20>
8000e2a8:	00008067          	ret

Disassembly of section .text.memmove:

8000e2ac <memmove>:
8000e2ac:	04a5fa63          	bgeu	a1,a0,8000e300 <memmove+0x54>
8000e2b0:	00c586b3          	add	a3,a1,a2
8000e2b4:	04d57663          	bgeu	a0,a3,8000e300 <memmove+0x54>
8000e2b8:	fff64593          	not	a1,a2
8000e2bc:	00000793          	li	a5,0
8000e2c0:	fff78793          	addi	a5,a5,-1
8000e2c4:	00f59463          	bne	a1,a5,8000e2cc <memmove+0x20>
8000e2c8:	00008067          	ret
8000e2cc:	00f68733          	add	a4,a3,a5
8000e2d0:	00074803          	lbu	a6,0(a4)
8000e2d4:	00c78733          	add	a4,a5,a2
8000e2d8:	00e50733          	add	a4,a0,a4
8000e2dc:	01070023          	sb	a6,0(a4)
8000e2e0:	fe1ff06f          	j	8000e2c0 <memmove+0x14>
8000e2e4:	00f58733          	add	a4,a1,a5
8000e2e8:	00074683          	lbu	a3,0(a4)
8000e2ec:	00f50733          	add	a4,a0,a5
8000e2f0:	00178793          	addi	a5,a5,1
8000e2f4:	00d70023          	sb	a3,0(a4)
8000e2f8:	fef616e3          	bne	a2,a5,8000e2e4 <memmove+0x38>
8000e2fc:	00008067          	ret
8000e300:	00000793          	li	a5,0
8000e304:	ff5ff06f          	j	8000e2f8 <memmove+0x4c>

Disassembly of section .text._calloc_r:

8000e308 <_calloc_r>:
8000e308:	fe010113          	addi	sp,sp,-32
8000e30c:	00812c23          	sw	s0,24(sp)
8000e310:	00050413          	mv	s0,a0
8000e314:	00058513          	mv	a0,a1
8000e318:	00060593          	mv	a1,a2
8000e31c:	00112e23          	sw	ra,28(sp)
8000e320:	80cff0ef          	jal	ra,8000d32c <__mulsi3>
8000e324:	00050593          	mv	a1,a0
8000e328:	00a12623          	sw	a0,12(sp)
8000e32c:	00040513          	mv	a0,s0
8000e330:	130000ef          	jal	ra,8000e460 <_malloc_r>
8000e334:	00050413          	mv	s0,a0
8000e338:	00050863          	beqz	a0,8000e348 <_calloc_r+0x40>
8000e33c:	00c12603          	lw	a2,12(sp)
8000e340:	00000593          	li	a1,0
8000e344:	905fe0ef          	jal	ra,8000cc48 <memset>
8000e348:	00040513          	mv	a0,s0
8000e34c:	01c12083          	lw	ra,28(sp)
8000e350:	01812403          	lw	s0,24(sp)
8000e354:	02010113          	addi	sp,sp,32
8000e358:	00008067          	ret

Disassembly of section .text._free_r:

8000e35c <_free_r>:
8000e35c:	10058063          	beqz	a1,8000e45c <_free_r+0x100>
8000e360:	ffc5a783          	lw	a5,-4(a1)
8000e364:	ff010113          	addi	sp,sp,-16
8000e368:	00812423          	sw	s0,8(sp)
8000e36c:	00112623          	sw	ra,12(sp)
8000e370:	00912223          	sw	s1,4(sp)
8000e374:	ffc58413          	addi	s0,a1,-4
8000e378:	0007d463          	bgez	a5,8000e380 <_free_r+0x24>
8000e37c:	00f40433          	add	s0,s0,a5
8000e380:	00050493          	mv	s1,a0
8000e384:	fecf70ef          	jal	ra,80005b70 <__malloc_lock>
8000e388:	8fc18793          	addi	a5,gp,-1796 # 800031a4 <__malloc_free_list>
8000e38c:	0007a783          	lw	a5,0(a5)
8000e390:	02079263          	bnez	a5,8000e3b4 <_free_r+0x58>
8000e394:	00042223          	sw	zero,4(s0)
8000e398:	8e81ae23          	sw	s0,-1796(gp) # 800031a4 <__malloc_free_list>
8000e39c:	00812403          	lw	s0,8(sp)
8000e3a0:	00c12083          	lw	ra,12(sp)
8000e3a4:	00048513          	mv	a0,s1
8000e3a8:	00412483          	lw	s1,4(sp)
8000e3ac:	01010113          	addi	sp,sp,16
8000e3b0:	fc4f706f          	j	80005b74 <__malloc_unlock>
8000e3b4:	02f47663          	bgeu	s0,a5,8000e3e0 <_free_r+0x84>
8000e3b8:	00042683          	lw	a3,0(s0)
8000e3bc:	00d40733          	add	a4,s0,a3
8000e3c0:	00e79a63          	bne	a5,a4,8000e3d4 <_free_r+0x78>
8000e3c4:	0007a703          	lw	a4,0(a5)
8000e3c8:	0047a783          	lw	a5,4(a5)
8000e3cc:	00d70733          	add	a4,a4,a3
8000e3d0:	00e42023          	sw	a4,0(s0)
8000e3d4:	00f42223          	sw	a5,4(s0)
8000e3d8:	fc1ff06f          	j	8000e398 <_free_r+0x3c>
8000e3dc:	00070793          	mv	a5,a4
8000e3e0:	0047a703          	lw	a4,4(a5)
8000e3e4:	00070463          	beqz	a4,8000e3ec <_free_r+0x90>
8000e3e8:	fee47ae3          	bgeu	s0,a4,8000e3dc <_free_r+0x80>
8000e3ec:	0007a683          	lw	a3,0(a5)
8000e3f0:	00d78633          	add	a2,a5,a3
8000e3f4:	02861863          	bne	a2,s0,8000e424 <_free_r+0xc8>
8000e3f8:	00042603          	lw	a2,0(s0)
8000e3fc:	00c686b3          	add	a3,a3,a2
8000e400:	00d7a023          	sw	a3,0(a5)
8000e404:	00d78633          	add	a2,a5,a3
8000e408:	f8c71ae3          	bne	a4,a2,8000e39c <_free_r+0x40>
8000e40c:	00072603          	lw	a2,0(a4)
8000e410:	00472703          	lw	a4,4(a4)
8000e414:	00d606b3          	add	a3,a2,a3
8000e418:	00d7a023          	sw	a3,0(a5)
8000e41c:	00e7a223          	sw	a4,4(a5)
8000e420:	f7dff06f          	j	8000e39c <_free_r+0x40>
8000e424:	00c47863          	bgeu	s0,a2,8000e434 <_free_r+0xd8>
8000e428:	00c00793          	li	a5,12
8000e42c:	00f4a023          	sw	a5,0(s1)
8000e430:	f6dff06f          	j	8000e39c <_free_r+0x40>
8000e434:	00042603          	lw	a2,0(s0)
8000e438:	00c406b3          	add	a3,s0,a2
8000e43c:	00d71a63          	bne	a4,a3,8000e450 <_free_r+0xf4>
8000e440:	00072683          	lw	a3,0(a4)
8000e444:	00472703          	lw	a4,4(a4)
8000e448:	00c686b3          	add	a3,a3,a2
8000e44c:	00d42023          	sw	a3,0(s0)
8000e450:	00e42223          	sw	a4,4(s0)
8000e454:	0087a223          	sw	s0,4(a5)
8000e458:	f45ff06f          	j	8000e39c <_free_r+0x40>
8000e45c:	00008067          	ret

Disassembly of section .text._malloc_r:

8000e460 <_malloc_r>:
8000e460:	fe010113          	addi	sp,sp,-32
8000e464:	00912a23          	sw	s1,20(sp)
8000e468:	00358493          	addi	s1,a1,3
8000e46c:	ffc4f493          	andi	s1,s1,-4
8000e470:	00112e23          	sw	ra,28(sp)
8000e474:	00812c23          	sw	s0,24(sp)
8000e478:	01212823          	sw	s2,16(sp)
8000e47c:	01312623          	sw	s3,12(sp)
8000e480:	00848493          	addi	s1,s1,8
8000e484:	00c00793          	li	a5,12
8000e488:	06f4f463          	bgeu	s1,a5,8000e4f0 <_malloc_r+0x90>
8000e48c:	00c00493          	li	s1,12
8000e490:	06b4e263          	bltu	s1,a1,8000e4f4 <_malloc_r+0x94>
8000e494:	00050913          	mv	s2,a0
8000e498:	ed8f70ef          	jal	ra,80005b70 <__malloc_lock>
8000e49c:	8fc18793          	addi	a5,gp,-1796 # 800031a4 <__malloc_free_list>
8000e4a0:	0007a703          	lw	a4,0(a5)
8000e4a4:	00070413          	mv	s0,a4
8000e4a8:	06041a63          	bnez	s0,8000e51c <_malloc_r+0xbc>
8000e4ac:	90018793          	addi	a5,gp,-1792 # 800031a8 <__malloc_sbrk_start>
8000e4b0:	0007a783          	lw	a5,0(a5)
8000e4b4:	00079a63          	bnez	a5,8000e4c8 <_malloc_r+0x68>
8000e4b8:	00000593          	li	a1,0
8000e4bc:	00090513          	mv	a0,s2
8000e4c0:	330000ef          	jal	ra,8000e7f0 <_sbrk_r>
8000e4c4:	90a1a023          	sw	a0,-1792(gp) # 800031a8 <__malloc_sbrk_start>
8000e4c8:	00048593          	mv	a1,s1
8000e4cc:	00090513          	mv	a0,s2
8000e4d0:	320000ef          	jal	ra,8000e7f0 <_sbrk_r>
8000e4d4:	fff00993          	li	s3,-1
8000e4d8:	0b351a63          	bne	a0,s3,8000e58c <_malloc_r+0x12c>
8000e4dc:	00c00793          	li	a5,12
8000e4e0:	00f92023          	sw	a5,0(s2)
8000e4e4:	00090513          	mv	a0,s2
8000e4e8:	e8cf70ef          	jal	ra,80005b74 <__malloc_unlock>
8000e4ec:	0100006f          	j	8000e4fc <_malloc_r+0x9c>
8000e4f0:	fa04d0e3          	bgez	s1,8000e490 <_malloc_r+0x30>
8000e4f4:	00c00793          	li	a5,12
8000e4f8:	00f52023          	sw	a5,0(a0)
8000e4fc:	00000513          	li	a0,0
8000e500:	01c12083          	lw	ra,28(sp)
8000e504:	01812403          	lw	s0,24(sp)
8000e508:	01412483          	lw	s1,20(sp)
8000e50c:	01012903          	lw	s2,16(sp)
8000e510:	00c12983          	lw	s3,12(sp)
8000e514:	02010113          	addi	sp,sp,32
8000e518:	00008067          	ret
8000e51c:	00042783          	lw	a5,0(s0)
8000e520:	409787b3          	sub	a5,a5,s1
8000e524:	0407ce63          	bltz	a5,8000e580 <_malloc_r+0x120>
8000e528:	00b00693          	li	a3,11
8000e52c:	00f6fa63          	bgeu	a3,a5,8000e540 <_malloc_r+0xe0>
8000e530:	00f42023          	sw	a5,0(s0)
8000e534:	00f40433          	add	s0,s0,a5
8000e538:	00942023          	sw	s1,0(s0)
8000e53c:	0100006f          	j	8000e54c <_malloc_r+0xec>
8000e540:	00442783          	lw	a5,4(s0)
8000e544:	02871a63          	bne	a4,s0,8000e578 <_malloc_r+0x118>
8000e548:	8ef1ae23          	sw	a5,-1796(gp) # 800031a4 <__malloc_free_list>
8000e54c:	00090513          	mv	a0,s2
8000e550:	e24f70ef          	jal	ra,80005b74 <__malloc_unlock>
8000e554:	00b40513          	addi	a0,s0,11
8000e558:	00440793          	addi	a5,s0,4
8000e55c:	ff857513          	andi	a0,a0,-8
8000e560:	40f50733          	sub	a4,a0,a5
8000e564:	f8070ee3          	beqz	a4,8000e500 <_malloc_r+0xa0>
8000e568:	00e40433          	add	s0,s0,a4
8000e56c:	40a787b3          	sub	a5,a5,a0
8000e570:	00f42023          	sw	a5,0(s0)
8000e574:	f8dff06f          	j	8000e500 <_malloc_r+0xa0>
8000e578:	00f72223          	sw	a5,4(a4)
8000e57c:	fd1ff06f          	j	8000e54c <_malloc_r+0xec>
8000e580:	00040713          	mv	a4,s0
8000e584:	00442403          	lw	s0,4(s0)
8000e588:	f21ff06f          	j	8000e4a8 <_malloc_r+0x48>
8000e58c:	00350413          	addi	s0,a0,3
8000e590:	ffc47413          	andi	s0,s0,-4
8000e594:	fa8502e3          	beq	a0,s0,8000e538 <_malloc_r+0xd8>
8000e598:	40a405b3          	sub	a1,s0,a0
8000e59c:	00090513          	mv	a0,s2
8000e5a0:	250000ef          	jal	ra,8000e7f0 <_sbrk_r>
8000e5a4:	f9351ae3          	bne	a0,s3,8000e538 <_malloc_r+0xd8>
8000e5a8:	f35ff06f          	j	8000e4dc <_malloc_r+0x7c>

Disassembly of section .text._printf_r:

8000e5ac <_iprintf_r>:
8000e5ac:	fb010113          	addi	sp,sp,-80
8000e5b0:	02812423          	sw	s0,40(sp)
8000e5b4:	02112623          	sw	ra,44(sp)
8000e5b8:	02c12c23          	sw	a2,56(sp)
8000e5bc:	02d12e23          	sw	a3,60(sp)
8000e5c0:	04e12023          	sw	a4,64(sp)
8000e5c4:	04f12223          	sw	a5,68(sp)
8000e5c8:	05012423          	sw	a6,72(sp)
8000e5cc:	05112623          	sw	a7,76(sp)
8000e5d0:	00050413          	mv	s0,a0
8000e5d4:	00050c63          	beqz	a0,8000e5ec <_iprintf_r+0x40>
8000e5d8:	01852783          	lw	a5,24(a0)
8000e5dc:	00079863          	bnez	a5,8000e5ec <_iprintf_r+0x40>
8000e5e0:	00b12623          	sw	a1,12(sp)
8000e5e4:	f7cff0ef          	jal	ra,8000dd60 <__sinit>
8000e5e8:	00c12583          	lw	a1,12(sp)
8000e5ec:	00058613          	mv	a2,a1
8000e5f0:	00842583          	lw	a1,8(s0)
8000e5f4:	03810693          	addi	a3,sp,56
8000e5f8:	00040513          	mv	a0,s0
8000e5fc:	00d12e23          	sw	a3,28(sp)
8000e600:	2b5010ef          	jal	ra,800100b4 <_vfiprintf_r>
8000e604:	02c12083          	lw	ra,44(sp)
8000e608:	02812403          	lw	s0,40(sp)
8000e60c:	05010113          	addi	sp,sp,80
8000e610:	00008067          	ret

Disassembly of section .text.printf:

8000e614 <iprintf>:
8000e614:	fc010113          	addi	sp,sp,-64
8000e618:	02f12a23          	sw	a5,52(sp)
8000e61c:	02b12223          	sw	a1,36(sp)
8000e620:	02c12423          	sw	a2,40(sp)
8000e624:	02d12623          	sw	a3,44(sp)
8000e628:	02e12823          	sw	a4,48(sp)
8000e62c:	03012c23          	sw	a6,56(sp)
8000e630:	03112e23          	sw	a7,60(sp)
8000e634:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000e638:	00812c23          	sw	s0,24(sp)
8000e63c:	0007a403          	lw	s0,0(a5)
8000e640:	00912a23          	sw	s1,20(sp)
8000e644:	00112e23          	sw	ra,28(sp)
8000e648:	00050493          	mv	s1,a0
8000e64c:	00040a63          	beqz	s0,8000e660 <iprintf+0x4c>
8000e650:	01842783          	lw	a5,24(s0)
8000e654:	00079663          	bnez	a5,8000e660 <iprintf+0x4c>
8000e658:	00040513          	mv	a0,s0
8000e65c:	f04ff0ef          	jal	ra,8000dd60 <__sinit>
8000e660:	00842583          	lw	a1,8(s0)
8000e664:	02410693          	addi	a3,sp,36
8000e668:	00048613          	mv	a2,s1
8000e66c:	00040513          	mv	a0,s0
8000e670:	00d12623          	sw	a3,12(sp)
8000e674:	241010ef          	jal	ra,800100b4 <_vfiprintf_r>
8000e678:	01c12083          	lw	ra,28(sp)
8000e67c:	01812403          	lw	s0,24(sp)
8000e680:	01412483          	lw	s1,20(sp)
8000e684:	04010113          	addi	sp,sp,64
8000e688:	00008067          	ret

Disassembly of section .text._putchar_r:

8000e68c <_putchar_r>:
8000e68c:	fe010113          	addi	sp,sp,-32
8000e690:	00812c23          	sw	s0,24(sp)
8000e694:	00112e23          	sw	ra,28(sp)
8000e698:	00050413          	mv	s0,a0
8000e69c:	00050c63          	beqz	a0,8000e6b4 <_putchar_r+0x28>
8000e6a0:	01852783          	lw	a5,24(a0)
8000e6a4:	00079863          	bnez	a5,8000e6b4 <_putchar_r+0x28>
8000e6a8:	00b12623          	sw	a1,12(sp)
8000e6ac:	eb4ff0ef          	jal	ra,8000dd60 <__sinit>
8000e6b0:	00c12583          	lw	a1,12(sp)
8000e6b4:	00842603          	lw	a2,8(s0)
8000e6b8:	00040513          	mv	a0,s0
8000e6bc:	01812403          	lw	s0,24(sp)
8000e6c0:	01c12083          	lw	ra,28(sp)
8000e6c4:	02010113          	addi	sp,sp,32
8000e6c8:	0500006f          	j	8000e718 <_putc_r>

Disassembly of section .text.putchar:

8000e6cc <putchar>:
8000e6cc:	fe010113          	addi	sp,sp,-32
8000e6d0:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000e6d4:	00812c23          	sw	s0,24(sp)
8000e6d8:	0007a403          	lw	s0,0(a5)
8000e6dc:	00112e23          	sw	ra,28(sp)
8000e6e0:	00050593          	mv	a1,a0
8000e6e4:	00040e63          	beqz	s0,8000e700 <putchar+0x34>
8000e6e8:	01842783          	lw	a5,24(s0)
8000e6ec:	00079a63          	bnez	a5,8000e700 <putchar+0x34>
8000e6f0:	00a12623          	sw	a0,12(sp)
8000e6f4:	00040513          	mv	a0,s0
8000e6f8:	e68ff0ef          	jal	ra,8000dd60 <__sinit>
8000e6fc:	00c12583          	lw	a1,12(sp)
8000e700:	00842603          	lw	a2,8(s0)
8000e704:	00040513          	mv	a0,s0
8000e708:	01812403          	lw	s0,24(sp)
8000e70c:	01c12083          	lw	ra,28(sp)
8000e710:	02010113          	addi	sp,sp,32
8000e714:	0040006f          	j	8000e718 <_putc_r>

Disassembly of section .text._putc_r:

8000e718 <_putc_r>:
8000e718:	fe010113          	addi	sp,sp,-32
8000e71c:	00812c23          	sw	s0,24(sp)
8000e720:	00112e23          	sw	ra,28(sp)
8000e724:	00050413          	mv	s0,a0
8000e728:	02050063          	beqz	a0,8000e748 <_putc_r+0x30>
8000e72c:	01852783          	lw	a5,24(a0)
8000e730:	00079c63          	bnez	a5,8000e748 <_putc_r+0x30>
8000e734:	00c12623          	sw	a2,12(sp)
8000e738:	00b12423          	sw	a1,8(sp)
8000e73c:	e24ff0ef          	jal	ra,8000dd60 <__sinit>
8000e740:	00c12603          	lw	a2,12(sp)
8000e744:	00812583          	lw	a1,8(sp)
8000e748:	ffff4797          	auipc	a5,0xffff4
8000e74c:	75478793          	addi	a5,a5,1876 # 80002e9c <__sf_fake_stdin>
8000e750:	04f61063          	bne	a2,a5,8000e790 <_putc_r+0x78>
8000e754:	00442603          	lw	a2,4(s0)
8000e758:	00862783          	lw	a5,8(a2)
8000e75c:	fff78793          	addi	a5,a5,-1
8000e760:	00f62423          	sw	a5,8(a2)
8000e764:	0407da63          	bgez	a5,8000e7b8 <_putc_r+0xa0>
8000e768:	01862703          	lw	a4,24(a2)
8000e76c:	00e7c863          	blt	a5,a4,8000e77c <_putc_r+0x64>
8000e770:	0ff5f793          	andi	a5,a1,255
8000e774:	00a00713          	li	a4,10
8000e778:	04e79063          	bne	a5,a4,8000e7b8 <_putc_r+0xa0>
8000e77c:	00040513          	mv	a0,s0
8000e780:	01812403          	lw	s0,24(sp)
8000e784:	01c12083          	lw	ra,28(sp)
8000e788:	02010113          	addi	sp,sp,32
8000e78c:	6bc0006f          	j	8000ee48 <__swbuf_r>
8000e790:	ffff4797          	auipc	a5,0xffff4
8000e794:	72c78793          	addi	a5,a5,1836 # 80002ebc <__sf_fake_stdout>
8000e798:	00f61663          	bne	a2,a5,8000e7a4 <_putc_r+0x8c>
8000e79c:	00842603          	lw	a2,8(s0)
8000e7a0:	fb9ff06f          	j	8000e758 <_putc_r+0x40>
8000e7a4:	ffff4797          	auipc	a5,0xffff4
8000e7a8:	6d878793          	addi	a5,a5,1752 # 80002e7c <__sf_fake_stderr>
8000e7ac:	faf616e3          	bne	a2,a5,8000e758 <_putc_r+0x40>
8000e7b0:	00c42603          	lw	a2,12(s0)
8000e7b4:	fa5ff06f          	j	8000e758 <_putc_r+0x40>
8000e7b8:	00062783          	lw	a5,0(a2)
8000e7bc:	0ff5f513          	andi	a0,a1,255
8000e7c0:	00178713          	addi	a4,a5,1
8000e7c4:	00e62023          	sw	a4,0(a2)
8000e7c8:	00b78023          	sb	a1,0(a5)
8000e7cc:	01c12083          	lw	ra,28(sp)
8000e7d0:	01812403          	lw	s0,24(sp)
8000e7d4:	02010113          	addi	sp,sp,32
8000e7d8:	00008067          	ret

Disassembly of section .text.putc:

8000e7dc <putc>:
8000e7dc:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000e7e0:	00058613          	mv	a2,a1
8000e7e4:	00050593          	mv	a1,a0
8000e7e8:	0007a503          	lw	a0,0(a5)
8000e7ec:	f2dff06f          	j	8000e718 <_putc_r>

Disassembly of section .text._sbrk_r:

8000e7f0 <_sbrk_r>:
8000e7f0:	ff010113          	addi	sp,sp,-16
8000e7f4:	00812423          	sw	s0,8(sp)
8000e7f8:	00050413          	mv	s0,a0
8000e7fc:	00058513          	mv	a0,a1
8000e800:	c401a623          	sw	zero,-948(gp) # 800034f4 <errno>
8000e804:	00112623          	sw	ra,12(sp)
8000e808:	c20f70ef          	jal	ra,80005c28 <_sbrk>
8000e80c:	fff00793          	li	a5,-1
8000e810:	00f51a63          	bne	a0,a5,8000e824 <_sbrk_r+0x34>
8000e814:	c4c18793          	addi	a5,gp,-948 # 800034f4 <errno>
8000e818:	0007a783          	lw	a5,0(a5)
8000e81c:	00078463          	beqz	a5,8000e824 <_sbrk_r+0x34>
8000e820:	00f42023          	sw	a5,0(s0)
8000e824:	00c12083          	lw	ra,12(sp)
8000e828:	00812403          	lw	s0,8(sp)
8000e82c:	01010113          	addi	sp,sp,16
8000e830:	00008067          	ret

Disassembly of section .text._snprintf_r:

8000e834 <_sniprintf_r>:
8000e834:	f7010113          	addi	sp,sp,-144
8000e838:	06112e23          	sw	ra,124(sp)
8000e83c:	06812c23          	sw	s0,120(sp)
8000e840:	06912a23          	sw	s1,116(sp)
8000e844:	07212823          	sw	s2,112(sp)
8000e848:	08e12023          	sw	a4,128(sp)
8000e84c:	08f12223          	sw	a5,132(sp)
8000e850:	09012423          	sw	a6,136(sp)
8000e854:	09112623          	sw	a7,140(sp)
8000e858:	02065463          	bgez	a2,8000e880 <_sniprintf_r+0x4c>
8000e85c:	08b00793          	li	a5,139
8000e860:	00f52023          	sw	a5,0(a0)
8000e864:	fff00513          	li	a0,-1
8000e868:	07c12083          	lw	ra,124(sp)
8000e86c:	07812403          	lw	s0,120(sp)
8000e870:	07412483          	lw	s1,116(sp)
8000e874:	07012903          	lw	s2,112(sp)
8000e878:	09010113          	addi	sp,sp,144
8000e87c:	00008067          	ret
8000e880:	20800793          	li	a5,520
8000e884:	00f11a23          	sh	a5,20(sp)
8000e888:	00b12423          	sw	a1,8(sp)
8000e88c:	00b12c23          	sw	a1,24(sp)
8000e890:	00060413          	mv	s0,a2
8000e894:	00000793          	li	a5,0
8000e898:	00060463          	beqz	a2,8000e8a0 <_sniprintf_r+0x6c>
8000e89c:	fff60793          	addi	a5,a2,-1
8000e8a0:	fff00913          	li	s2,-1
8000e8a4:	00068613          	mv	a2,a3
8000e8a8:	00810593          	addi	a1,sp,8
8000e8ac:	08010693          	addi	a3,sp,128
8000e8b0:	00050493          	mv	s1,a0
8000e8b4:	00f12823          	sw	a5,16(sp)
8000e8b8:	00f12e23          	sw	a5,28(sp)
8000e8bc:	01211b23          	sh	s2,22(sp)
8000e8c0:	00d12223          	sw	a3,4(sp)
8000e8c4:	5cd000ef          	jal	ra,8000f690 <_svfiprintf_r>
8000e8c8:	01255663          	bge	a0,s2,8000e8d4 <_sniprintf_r+0xa0>
8000e8cc:	08b00793          	li	a5,139
8000e8d0:	00f4a023          	sw	a5,0(s1)
8000e8d4:	f8040ae3          	beqz	s0,8000e868 <_sniprintf_r+0x34>
8000e8d8:	00812783          	lw	a5,8(sp)
8000e8dc:	00078023          	sb	zero,0(a5)
8000e8e0:	f89ff06f          	j	8000e868 <_sniprintf_r+0x34>

Disassembly of section .text.snprintf:

8000e8e4 <sniprintf>:
8000e8e4:	f6010113          	addi	sp,sp,-160
8000e8e8:	08f12a23          	sw	a5,148(sp)
8000e8ec:	06912a23          	sw	s1,116(sp)
8000e8f0:	08d12623          	sw	a3,140(sp)
8000e8f4:	08e12823          	sw	a4,144(sp)
8000e8f8:	09012c23          	sw	a6,152(sp)
8000e8fc:	09112e23          	sw	a7,156(sp)
8000e900:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000e904:	06112e23          	sw	ra,124(sp)
8000e908:	06812c23          	sw	s0,120(sp)
8000e90c:	07212823          	sw	s2,112(sp)
8000e910:	0007a483          	lw	s1,0(a5)
8000e914:	0205d463          	bgez	a1,8000e93c <sniprintf+0x58>
8000e918:	08b00793          	li	a5,139
8000e91c:	00f4a023          	sw	a5,0(s1)
8000e920:	fff00513          	li	a0,-1
8000e924:	07c12083          	lw	ra,124(sp)
8000e928:	07812403          	lw	s0,120(sp)
8000e92c:	07412483          	lw	s1,116(sp)
8000e930:	07012903          	lw	s2,112(sp)
8000e934:	0a010113          	addi	sp,sp,160
8000e938:	00008067          	ret
8000e93c:	20800793          	li	a5,520
8000e940:	00f11a23          	sh	a5,20(sp)
8000e944:	00a12423          	sw	a0,8(sp)
8000e948:	00a12c23          	sw	a0,24(sp)
8000e94c:	00000793          	li	a5,0
8000e950:	00058463          	beqz	a1,8000e958 <sniprintf+0x74>
8000e954:	fff58793          	addi	a5,a1,-1
8000e958:	fff00913          	li	s2,-1
8000e95c:	00058413          	mv	s0,a1
8000e960:	08c10693          	addi	a3,sp,140
8000e964:	00810593          	addi	a1,sp,8
8000e968:	00048513          	mv	a0,s1
8000e96c:	00f12823          	sw	a5,16(sp)
8000e970:	00f12e23          	sw	a5,28(sp)
8000e974:	01211b23          	sh	s2,22(sp)
8000e978:	00d12223          	sw	a3,4(sp)
8000e97c:	515000ef          	jal	ra,8000f690 <_svfiprintf_r>
8000e980:	01255663          	bge	a0,s2,8000e98c <sniprintf+0xa8>
8000e984:	08b00793          	li	a5,139
8000e988:	00f4a023          	sw	a5,0(s1)
8000e98c:	f8040ce3          	beqz	s0,8000e924 <sniprintf+0x40>
8000e990:	00812783          	lw	a5,8(sp)
8000e994:	00078023          	sb	zero,0(a5)
8000e998:	f8dff06f          	j	8000e924 <sniprintf+0x40>

Disassembly of section .text._sprintf_r:

8000e99c <_siprintf_r>:
8000e99c:	f6010113          	addi	sp,sp,-160
8000e9a0:	08f12a23          	sw	a5,148(sp)
8000e9a4:	800007b7          	lui	a5,0x80000
8000e9a8:	fff7c793          	not	a5,a5
8000e9ac:	00f12e23          	sw	a5,28(sp)
8000e9b0:	00f12823          	sw	a5,16(sp)
8000e9b4:	ffff07b7          	lui	a5,0xffff0
8000e9b8:	08d12623          	sw	a3,140(sp)
8000e9bc:	00b12423          	sw	a1,8(sp)
8000e9c0:	00b12c23          	sw	a1,24(sp)
8000e9c4:	20878793          	addi	a5,a5,520 # ffff0208 <_ram_heap_end+0x7ffde208>
8000e9c8:	08c10693          	addi	a3,sp,140
8000e9cc:	00810593          	addi	a1,sp,8
8000e9d0:	06112e23          	sw	ra,124(sp)
8000e9d4:	00f12a23          	sw	a5,20(sp)
8000e9d8:	08e12823          	sw	a4,144(sp)
8000e9dc:	09012c23          	sw	a6,152(sp)
8000e9e0:	09112e23          	sw	a7,156(sp)
8000e9e4:	00d12223          	sw	a3,4(sp)
8000e9e8:	4a9000ef          	jal	ra,8000f690 <_svfiprintf_r>
8000e9ec:	00812783          	lw	a5,8(sp)
8000e9f0:	00078023          	sb	zero,0(a5)
8000e9f4:	07c12083          	lw	ra,124(sp)
8000e9f8:	0a010113          	addi	sp,sp,160
8000e9fc:	00008067          	ret

Disassembly of section .text.sprintf:

8000ea00 <siprintf>:
8000ea00:	f6010113          	addi	sp,sp,-160
8000ea04:	08f12a23          	sw	a5,148(sp)
8000ea08:	800007b7          	lui	a5,0x80000
8000ea0c:	fff7c793          	not	a5,a5
8000ea10:	00f12e23          	sw	a5,28(sp)
8000ea14:	00f12823          	sw	a5,16(sp)
8000ea18:	ffff07b7          	lui	a5,0xffff0
8000ea1c:	20878793          	addi	a5,a5,520 # ffff0208 <_ram_heap_end+0x7ffde208>
8000ea20:	08c12423          	sw	a2,136(sp)
8000ea24:	08d12623          	sw	a3,140(sp)
8000ea28:	08e12823          	sw	a4,144(sp)
8000ea2c:	09012c23          	sw	a6,152(sp)
8000ea30:	09112e23          	sw	a7,156(sp)
8000ea34:	00f12a23          	sw	a5,20(sp)
8000ea38:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000ea3c:	00a12423          	sw	a0,8(sp)
8000ea40:	00a12c23          	sw	a0,24(sp)
8000ea44:	0007a503          	lw	a0,0(a5)
8000ea48:	08810693          	addi	a3,sp,136
8000ea4c:	00058613          	mv	a2,a1
8000ea50:	00810593          	addi	a1,sp,8
8000ea54:	06112e23          	sw	ra,124(sp)
8000ea58:	00d12223          	sw	a3,4(sp)
8000ea5c:	435000ef          	jal	ra,8000f690 <_svfiprintf_r>
8000ea60:	00812783          	lw	a5,8(sp)
8000ea64:	00078023          	sb	zero,0(a5)
8000ea68:	07c12083          	lw	ra,124(sp)
8000ea6c:	0a010113          	addi	sp,sp,160
8000ea70:	00008067          	ret

Disassembly of section .text.__sread:

8000ea74 <__sread>:
8000ea74:	ff010113          	addi	sp,sp,-16
8000ea78:	00812423          	sw	s0,8(sp)
8000ea7c:	00058413          	mv	s0,a1
8000ea80:	00e59583          	lh	a1,14(a1)
8000ea84:	00112623          	sw	ra,12(sp)
8000ea88:	219010ef          	jal	ra,800104a0 <_read_r>
8000ea8c:	02054063          	bltz	a0,8000eaac <__sread+0x38>
8000ea90:	05442783          	lw	a5,84(s0)
8000ea94:	00a787b3          	add	a5,a5,a0
8000ea98:	04f42a23          	sw	a5,84(s0)
8000ea9c:	00c12083          	lw	ra,12(sp)
8000eaa0:	00812403          	lw	s0,8(sp)
8000eaa4:	01010113          	addi	sp,sp,16
8000eaa8:	00008067          	ret
8000eaac:	00c45783          	lhu	a5,12(s0)
8000eab0:	fffff737          	lui	a4,0xfffff
8000eab4:	fff70713          	addi	a4,a4,-1 # ffffefff <_ram_heap_end+0x7ffecfff>
8000eab8:	00e7f7b3          	and	a5,a5,a4
8000eabc:	00f41623          	sh	a5,12(s0)
8000eac0:	fddff06f          	j	8000ea9c <__sread+0x28>

Disassembly of section .text.__seofread:

8000eac4 <__seofread>:
8000eac4:	00000513          	li	a0,0
8000eac8:	00008067          	ret

Disassembly of section .text.__swrite:

8000eacc <__swrite>:
8000eacc:	00c5d783          	lhu	a5,12(a1)
8000ead0:	fe010113          	addi	sp,sp,-32
8000ead4:	00812c23          	sw	s0,24(sp)
8000ead8:	00912a23          	sw	s1,20(sp)
8000eadc:	01212823          	sw	s2,16(sp)
8000eae0:	01312623          	sw	s3,12(sp)
8000eae4:	00112e23          	sw	ra,28(sp)
8000eae8:	1007f793          	andi	a5,a5,256
8000eaec:	00050493          	mv	s1,a0
8000eaf0:	00058413          	mv	s0,a1
8000eaf4:	00060913          	mv	s2,a2
8000eaf8:	00068993          	mv	s3,a3
8000eafc:	00078a63          	beqz	a5,8000eb10 <__swrite+0x44>
8000eb00:	00e59583          	lh	a1,14(a1)
8000eb04:	00200693          	li	a3,2
8000eb08:	00000613          	li	a2,0
8000eb0c:	694000ef          	jal	ra,8000f1a0 <_lseek_r>
8000eb10:	00c45783          	lhu	a5,12(s0)
8000eb14:	fffff737          	lui	a4,0xfffff
8000eb18:	fff70713          	addi	a4,a4,-1 # ffffefff <_ram_heap_end+0x7ffecfff>
8000eb1c:	00e7f7b3          	and	a5,a5,a4
8000eb20:	00f41623          	sh	a5,12(s0)
8000eb24:	00e41583          	lh	a1,14(s0)
8000eb28:	01812403          	lw	s0,24(sp)
8000eb2c:	01c12083          	lw	ra,28(sp)
8000eb30:	00098693          	mv	a3,s3
8000eb34:	00090613          	mv	a2,s2
8000eb38:	00c12983          	lw	s3,12(sp)
8000eb3c:	01012903          	lw	s2,16(sp)
8000eb40:	00048513          	mv	a0,s1
8000eb44:	01412483          	lw	s1,20(sp)
8000eb48:	02010113          	addi	sp,sp,32
8000eb4c:	4480006f          	j	8000ef94 <_write_r>

Disassembly of section .text.__sseek:

8000eb50 <__sseek>:
8000eb50:	ff010113          	addi	sp,sp,-16
8000eb54:	00812423          	sw	s0,8(sp)
8000eb58:	00058413          	mv	s0,a1
8000eb5c:	00e59583          	lh	a1,14(a1)
8000eb60:	00112623          	sw	ra,12(sp)
8000eb64:	63c000ef          	jal	ra,8000f1a0 <_lseek_r>
8000eb68:	fff00793          	li	a5,-1
8000eb6c:	00c45703          	lhu	a4,12(s0)
8000eb70:	02f51263          	bne	a0,a5,8000eb94 <__sseek+0x44>
8000eb74:	fffff7b7          	lui	a5,0xfffff
8000eb78:	fff78793          	addi	a5,a5,-1 # ffffefff <_ram_heap_end+0x7ffecfff>
8000eb7c:	00e7f7b3          	and	a5,a5,a4
8000eb80:	00f41623          	sh	a5,12(s0)
8000eb84:	00c12083          	lw	ra,12(sp)
8000eb88:	00812403          	lw	s0,8(sp)
8000eb8c:	01010113          	addi	sp,sp,16
8000eb90:	00008067          	ret
8000eb94:	000017b7          	lui	a5,0x1
8000eb98:	00f767b3          	or	a5,a4,a5
8000eb9c:	00f41623          	sh	a5,12(s0)
8000eba0:	04a42a23          	sw	a0,84(s0)
8000eba4:	fe1ff06f          	j	8000eb84 <__sseek+0x34>

Disassembly of section .text.__sclose:

8000eba8 <__sclose>:
8000eba8:	00e59583          	lh	a1,14(a1)
8000ebac:	5b00006f          	j	8000f15c <_close_r>

Disassembly of section .text.strlen:

8000ebb0 <strlen>:
8000ebb0:	00050793          	mv	a5,a0
8000ebb4:	00178793          	addi	a5,a5,1 # 1001 <_stack_size+0x801>
8000ebb8:	fff7c703          	lbu	a4,-1(a5)
8000ebbc:	fe071ce3          	bnez	a4,8000ebb4 <strlen+0x4>
8000ebc0:	40a78533          	sub	a0,a5,a0
8000ebc4:	fff50513          	addi	a0,a0,-1
8000ebc8:	00008067          	ret

Disassembly of section .text.strncmp:

8000ebcc <strncmp>:
8000ebcc:	02060a63          	beqz	a2,8000ec00 <strncmp+0x34>
8000ebd0:	fff60613          	addi	a2,a2,-1
8000ebd4:	00000713          	li	a4,0
8000ebd8:	00e507b3          	add	a5,a0,a4
8000ebdc:	00e586b3          	add	a3,a1,a4
8000ebe0:	0007c783          	lbu	a5,0(a5)
8000ebe4:	0006c683          	lbu	a3,0(a3)
8000ebe8:	00d79863          	bne	a5,a3,8000ebf8 <strncmp+0x2c>
8000ebec:	00c70663          	beq	a4,a2,8000ebf8 <strncmp+0x2c>
8000ebf0:	00170713          	addi	a4,a4,1
8000ebf4:	fe0792e3          	bnez	a5,8000ebd8 <strncmp+0xc>
8000ebf8:	40d78533          	sub	a0,a5,a3
8000ebfc:	00008067          	ret
8000ec00:	00000513          	li	a0,0
8000ec04:	00008067          	ret

Disassembly of section .text._strtol_l.isra.0:

8000ec08 <_strtol_l.isra.0>:
8000ec08:	fc010113          	addi	sp,sp,-64
8000ec0c:	03212823          	sw	s2,48(sp)
8000ec10:	03512223          	sw	s5,36(sp)
8000ec14:	03612023          	sw	s6,32(sp)
8000ec18:	01812c23          	sw	s8,24(sp)
8000ec1c:	00068913          	mv	s2,a3
8000ec20:	02112e23          	sw	ra,60(sp)
8000ec24:	02812c23          	sw	s0,56(sp)
8000ec28:	02912a23          	sw	s1,52(sp)
8000ec2c:	03312623          	sw	s3,44(sp)
8000ec30:	03412423          	sw	s4,40(sp)
8000ec34:	01712e23          	sw	s7,28(sp)
8000ec38:	01912a23          	sw	s9,20(sp)
8000ec3c:	01a12823          	sw	s10,16(sp)
8000ec40:	01b12623          	sw	s11,12(sp)
8000ec44:	00050a93          	mv	s5,a0
8000ec48:	00058b13          	mv	s6,a1
8000ec4c:	00060c13          	mv	s8,a2
8000ec50:	00058793          	mv	a5,a1
8000ec54:	ffff4697          	auipc	a3,0xffff4
8000ec58:	12568693          	addi	a3,a3,293 # 80002d79 <_ctype_+0x1>
8000ec5c:	00178493          	addi	s1,a5,1
8000ec60:	fff4c403          	lbu	s0,-1(s1)
8000ec64:	00d40733          	add	a4,s0,a3
8000ec68:	00074703          	lbu	a4,0(a4)
8000ec6c:	00877713          	andi	a4,a4,8
8000ec70:	0c071863          	bnez	a4,8000ed40 <_strtol_l.isra.0+0x138>
8000ec74:	02d00713          	li	a4,45
8000ec78:	0ce41863          	bne	s0,a4,8000ed48 <_strtol_l.isra.0+0x140>
8000ec7c:	0004c403          	lbu	s0,0(s1)
8000ec80:	00100a13          	li	s4,1
8000ec84:	00278493          	addi	s1,a5,2
8000ec88:	16090e63          	beqz	s2,8000ee04 <_strtol_l.isra.0+0x1fc>
8000ec8c:	01000793          	li	a5,16
8000ec90:	02f91463          	bne	s2,a5,8000ecb8 <_strtol_l.isra.0+0xb0>
8000ec94:	03000793          	li	a5,48
8000ec98:	02f41063          	bne	s0,a5,8000ecb8 <_strtol_l.isra.0+0xb0>
8000ec9c:	0004c783          	lbu	a5,0(s1)
8000eca0:	05800713          	li	a4,88
8000eca4:	0df7f793          	andi	a5,a5,223
8000eca8:	14e79663          	bne	a5,a4,8000edf4 <_strtol_l.isra.0+0x1ec>
8000ecac:	0014c403          	lbu	s0,1(s1)
8000ecb0:	01000913          	li	s2,16
8000ecb4:	00248493          	addi	s1,s1,2
8000ecb8:	800009b7          	lui	s3,0x80000
8000ecbc:	000a1463          	bnez	s4,8000ecc4 <_strtol_l.isra.0+0xbc>
8000ecc0:	fff9c993          	not	s3,s3
8000ecc4:	00090593          	mv	a1,s2
8000ecc8:	00098513          	mv	a0,s3
8000eccc:	ed4fe0ef          	jal	ra,8000d3a0 <__umodsi3>
8000ecd0:	00050b93          	mv	s7,a0
8000ecd4:	00090593          	mv	a1,s2
8000ecd8:	00098513          	mv	a0,s3
8000ecdc:	e7cfe0ef          	jal	ra,8000d358 <__udivsi3>
8000ece0:	00050c93          	mv	s9,a0
8000ece4:	00000713          	li	a4,0
8000ece8:	00000513          	li	a0,0
8000ecec:	00900d93          	li	s11,9
8000ecf0:	01900d13          	li	s10,25
8000ecf4:	fff00693          	li	a3,-1
8000ecf8:	fd040793          	addi	a5,s0,-48
8000ecfc:	06fde463          	bltu	s11,a5,8000ed64 <_strtol_l.isra.0+0x15c>
8000ed00:	00078413          	mv	s0,a5
8000ed04:	09245063          	bge	s0,s2,8000ed84 <_strtol_l.isra.0+0x17c>
8000ed08:	02d70663          	beq	a4,a3,8000ed34 <_strtol_l.isra.0+0x12c>
8000ed0c:	fff00713          	li	a4,-1
8000ed10:	02ace263          	bltu	s9,a0,8000ed34 <_strtol_l.isra.0+0x12c>
8000ed14:	00ac9463          	bne	s9,a0,8000ed1c <_strtol_l.isra.0+0x114>
8000ed18:	008bce63          	blt	s7,s0,8000ed34 <_strtol_l.isra.0+0x12c>
8000ed1c:	00050593          	mv	a1,a0
8000ed20:	00090513          	mv	a0,s2
8000ed24:	e08fe0ef          	jal	ra,8000d32c <__mulsi3>
8000ed28:	00a40533          	add	a0,s0,a0
8000ed2c:	00100713          	li	a4,1
8000ed30:	fff00693          	li	a3,-1
8000ed34:	00148493          	addi	s1,s1,1
8000ed38:	fff4c403          	lbu	s0,-1(s1)
8000ed3c:	fbdff06f          	j	8000ecf8 <_strtol_l.isra.0+0xf0>
8000ed40:	00048793          	mv	a5,s1
8000ed44:	f19ff06f          	j	8000ec5c <_strtol_l.isra.0+0x54>
8000ed48:	02b00713          	li	a4,43
8000ed4c:	00e40663          	beq	s0,a4,8000ed58 <_strtol_l.isra.0+0x150>
8000ed50:	00000a13          	li	s4,0
8000ed54:	f35ff06f          	j	8000ec88 <_strtol_l.isra.0+0x80>
8000ed58:	0004c403          	lbu	s0,0(s1)
8000ed5c:	00278493          	addi	s1,a5,2
8000ed60:	ff1ff06f          	j	8000ed50 <_strtol_l.isra.0+0x148>
8000ed64:	fbf40793          	addi	a5,s0,-65
8000ed68:	00fd6663          	bltu	s10,a5,8000ed74 <_strtol_l.isra.0+0x16c>
8000ed6c:	fc940413          	addi	s0,s0,-55
8000ed70:	f95ff06f          	j	8000ed04 <_strtol_l.isra.0+0xfc>
8000ed74:	f9f40793          	addi	a5,s0,-97
8000ed78:	00fd6663          	bltu	s10,a5,8000ed84 <_strtol_l.isra.0+0x17c>
8000ed7c:	fa940413          	addi	s0,s0,-87
8000ed80:	f85ff06f          	j	8000ed04 <_strtol_l.isra.0+0xfc>
8000ed84:	fff00793          	li	a5,-1
8000ed88:	04f71863          	bne	a4,a5,8000edd8 <_strtol_l.isra.0+0x1d0>
8000ed8c:	02200793          	li	a5,34
8000ed90:	00faa023          	sw	a5,0(s5)
8000ed94:	00098513          	mv	a0,s3
8000ed98:	040c1863          	bnez	s8,8000ede8 <_strtol_l.isra.0+0x1e0>
8000ed9c:	03c12083          	lw	ra,60(sp)
8000eda0:	03812403          	lw	s0,56(sp)
8000eda4:	03412483          	lw	s1,52(sp)
8000eda8:	03012903          	lw	s2,48(sp)
8000edac:	02c12983          	lw	s3,44(sp)
8000edb0:	02812a03          	lw	s4,40(sp)
8000edb4:	02412a83          	lw	s5,36(sp)
8000edb8:	02012b03          	lw	s6,32(sp)
8000edbc:	01c12b83          	lw	s7,28(sp)
8000edc0:	01812c03          	lw	s8,24(sp)
8000edc4:	01412c83          	lw	s9,20(sp)
8000edc8:	01012d03          	lw	s10,16(sp)
8000edcc:	00c12d83          	lw	s11,12(sp)
8000edd0:	04010113          	addi	sp,sp,64
8000edd4:	00008067          	ret
8000edd8:	000a0463          	beqz	s4,8000ede0 <_strtol_l.isra.0+0x1d8>
8000eddc:	40a00533          	neg	a0,a0
8000ede0:	fa0c0ee3          	beqz	s8,8000ed9c <_strtol_l.isra.0+0x194>
8000ede4:	00070463          	beqz	a4,8000edec <_strtol_l.isra.0+0x1e4>
8000ede8:	fff48b13          	addi	s6,s1,-1
8000edec:	016c2023          	sw	s6,0(s8)
8000edf0:	fadff06f          	j	8000ed9c <_strtol_l.isra.0+0x194>
8000edf4:	03000413          	li	s0,48
8000edf8:	ec0910e3          	bnez	s2,8000ecb8 <_strtol_l.isra.0+0xb0>
8000edfc:	00800913          	li	s2,8
8000ee00:	eb9ff06f          	j	8000ecb8 <_strtol_l.isra.0+0xb0>
8000ee04:	03000793          	li	a5,48
8000ee08:	e8f40ae3          	beq	s0,a5,8000ec9c <_strtol_l.isra.0+0x94>
8000ee0c:	00a00913          	li	s2,10
8000ee10:	ea9ff06f          	j	8000ecb8 <_strtol_l.isra.0+0xb0>

Disassembly of section .text._strtol_r:

8000ee14 <_strtol_r>:
8000ee14:	df5ff06f          	j	8000ec08 <_strtol_l.isra.0>

Disassembly of section .text.strtol_l:

8000ee18 <strtol_l>:
8000ee18:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000ee1c:	00060693          	mv	a3,a2
8000ee20:	00058613          	mv	a2,a1
8000ee24:	00050593          	mv	a1,a0
8000ee28:	0007a503          	lw	a0,0(a5)
8000ee2c:	dddff06f          	j	8000ec08 <_strtol_l.isra.0>

Disassembly of section .text.strtol:

8000ee30 <strtol>:
8000ee30:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000ee34:	00060693          	mv	a3,a2
8000ee38:	00058613          	mv	a2,a1
8000ee3c:	00050593          	mv	a1,a0
8000ee40:	0007a503          	lw	a0,0(a5)
8000ee44:	dc5ff06f          	j	8000ec08 <_strtol_l.isra.0>

Disassembly of section .text.__swbuf_r:

8000ee48 <__swbuf_r>:
8000ee48:	fe010113          	addi	sp,sp,-32
8000ee4c:	00812c23          	sw	s0,24(sp)
8000ee50:	00912a23          	sw	s1,20(sp)
8000ee54:	01212823          	sw	s2,16(sp)
8000ee58:	00112e23          	sw	ra,28(sp)
8000ee5c:	01312623          	sw	s3,12(sp)
8000ee60:	00050493          	mv	s1,a0
8000ee64:	00058913          	mv	s2,a1
8000ee68:	00060413          	mv	s0,a2
8000ee6c:	00050863          	beqz	a0,8000ee7c <__swbuf_r+0x34>
8000ee70:	01852783          	lw	a5,24(a0)
8000ee74:	00079463          	bnez	a5,8000ee7c <__swbuf_r+0x34>
8000ee78:	ee9fe0ef          	jal	ra,8000dd60 <__sinit>
8000ee7c:	ffff4797          	auipc	a5,0xffff4
8000ee80:	02078793          	addi	a5,a5,32 # 80002e9c <__sf_fake_stdin>
8000ee84:	0af41e63          	bne	s0,a5,8000ef40 <__swbuf_r+0xf8>
8000ee88:	0044a403          	lw	s0,4(s1)
8000ee8c:	01842783          	lw	a5,24(s0)
8000ee90:	00f42423          	sw	a5,8(s0)
8000ee94:	00c45783          	lhu	a5,12(s0)
8000ee98:	0087f793          	andi	a5,a5,8
8000ee9c:	0c078663          	beqz	a5,8000ef68 <__swbuf_r+0x120>
8000eea0:	01042783          	lw	a5,16(s0)
8000eea4:	0c078263          	beqz	a5,8000ef68 <__swbuf_r+0x120>
8000eea8:	01042783          	lw	a5,16(s0)
8000eeac:	00042503          	lw	a0,0(s0)
8000eeb0:	0ff97993          	andi	s3,s2,255
8000eeb4:	0ff97913          	andi	s2,s2,255
8000eeb8:	40f50533          	sub	a0,a0,a5
8000eebc:	01442783          	lw	a5,20(s0)
8000eec0:	00f54a63          	blt	a0,a5,8000eed4 <__swbuf_r+0x8c>
8000eec4:	00040593          	mv	a1,s0
8000eec8:	00048513          	mv	a0,s1
8000eecc:	ca5fe0ef          	jal	ra,8000db70 <_fflush_r>
8000eed0:	0a051463          	bnez	a0,8000ef78 <__swbuf_r+0x130>
8000eed4:	00842783          	lw	a5,8(s0)
8000eed8:	00150513          	addi	a0,a0,1
8000eedc:	fff78793          	addi	a5,a5,-1
8000eee0:	00f42423          	sw	a5,8(s0)
8000eee4:	00042783          	lw	a5,0(s0)
8000eee8:	00178713          	addi	a4,a5,1
8000eeec:	00e42023          	sw	a4,0(s0)
8000eef0:	01378023          	sb	s3,0(a5)
8000eef4:	01442783          	lw	a5,20(s0)
8000eef8:	00a78c63          	beq	a5,a0,8000ef10 <__swbuf_r+0xc8>
8000eefc:	00c45783          	lhu	a5,12(s0)
8000ef00:	0017f793          	andi	a5,a5,1
8000ef04:	00078e63          	beqz	a5,8000ef20 <__swbuf_r+0xd8>
8000ef08:	00a00793          	li	a5,10
8000ef0c:	00f91a63          	bne	s2,a5,8000ef20 <__swbuf_r+0xd8>
8000ef10:	00040593          	mv	a1,s0
8000ef14:	00048513          	mv	a0,s1
8000ef18:	c59fe0ef          	jal	ra,8000db70 <_fflush_r>
8000ef1c:	04051e63          	bnez	a0,8000ef78 <__swbuf_r+0x130>
8000ef20:	01c12083          	lw	ra,28(sp)
8000ef24:	01812403          	lw	s0,24(sp)
8000ef28:	00090513          	mv	a0,s2
8000ef2c:	01412483          	lw	s1,20(sp)
8000ef30:	01012903          	lw	s2,16(sp)
8000ef34:	00c12983          	lw	s3,12(sp)
8000ef38:	02010113          	addi	sp,sp,32
8000ef3c:	00008067          	ret
8000ef40:	ffff4797          	auipc	a5,0xffff4
8000ef44:	f7c78793          	addi	a5,a5,-132 # 80002ebc <__sf_fake_stdout>
8000ef48:	00f41663          	bne	s0,a5,8000ef54 <__swbuf_r+0x10c>
8000ef4c:	0084a403          	lw	s0,8(s1)
8000ef50:	f3dff06f          	j	8000ee8c <__swbuf_r+0x44>
8000ef54:	ffff4797          	auipc	a5,0xffff4
8000ef58:	f2878793          	addi	a5,a5,-216 # 80002e7c <__sf_fake_stderr>
8000ef5c:	f2f418e3          	bne	s0,a5,8000ee8c <__swbuf_r+0x44>
8000ef60:	00c4a403          	lw	s0,12(s1)
8000ef64:	f29ff06f          	j	8000ee8c <__swbuf_r+0x44>
8000ef68:	00040593          	mv	a1,s0
8000ef6c:	00048513          	mv	a0,s1
8000ef70:	070000ef          	jal	ra,8000efe0 <__swsetup_r>
8000ef74:	f2050ae3          	beqz	a0,8000eea8 <__swbuf_r+0x60>
8000ef78:	fff00913          	li	s2,-1
8000ef7c:	fa5ff06f          	j	8000ef20 <__swbuf_r+0xd8>

Disassembly of section .text.__swbuf:

8000ef80 <__swbuf>:
8000ef80:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000ef84:	00058613          	mv	a2,a1
8000ef88:	00050593          	mv	a1,a0
8000ef8c:	0007a503          	lw	a0,0(a5)
8000ef90:	eb9ff06f          	j	8000ee48 <__swbuf_r>

Disassembly of section .text._write_r:

8000ef94 <_write_r>:
8000ef94:	ff010113          	addi	sp,sp,-16
8000ef98:	00812423          	sw	s0,8(sp)
8000ef9c:	00050413          	mv	s0,a0
8000efa0:	00058513          	mv	a0,a1
8000efa4:	00060593          	mv	a1,a2
8000efa8:	00068613          	mv	a2,a3
8000efac:	c401a623          	sw	zero,-948(gp) # 800034f4 <errno>
8000efb0:	00112623          	sw	ra,12(sp)
8000efb4:	d1df60ef          	jal	ra,80005cd0 <_write>
8000efb8:	fff00793          	li	a5,-1
8000efbc:	00f51a63          	bne	a0,a5,8000efd0 <_write_r+0x3c>
8000efc0:	c4c18793          	addi	a5,gp,-948 # 800034f4 <errno>
8000efc4:	0007a783          	lw	a5,0(a5)
8000efc8:	00078463          	beqz	a5,8000efd0 <_write_r+0x3c>
8000efcc:	00f42023          	sw	a5,0(s0)
8000efd0:	00c12083          	lw	ra,12(sp)
8000efd4:	00812403          	lw	s0,8(sp)
8000efd8:	01010113          	addi	sp,sp,16
8000efdc:	00008067          	ret

Disassembly of section .text.__swsetup_r:

8000efe0 <__swsetup_r>:
8000efe0:	ff010113          	addi	sp,sp,-16
8000efe4:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8000efe8:	00912223          	sw	s1,4(sp)
8000efec:	0007a483          	lw	s1,0(a5)
8000eff0:	00812423          	sw	s0,8(sp)
8000eff4:	01212023          	sw	s2,0(sp)
8000eff8:	00112623          	sw	ra,12(sp)
8000effc:	00050913          	mv	s2,a0
8000f000:	00058413          	mv	s0,a1
8000f004:	00048a63          	beqz	s1,8000f018 <__swsetup_r+0x38>
8000f008:	0184a783          	lw	a5,24(s1)
8000f00c:	00079663          	bnez	a5,8000f018 <__swsetup_r+0x38>
8000f010:	00048513          	mv	a0,s1
8000f014:	d4dfe0ef          	jal	ra,8000dd60 <__sinit>
8000f018:	ffff4797          	auipc	a5,0xffff4
8000f01c:	e8478793          	addi	a5,a5,-380 # 80002e9c <__sf_fake_stdin>
8000f020:	04f41863          	bne	s0,a5,8000f070 <__swsetup_r+0x90>
8000f024:	0044a403          	lw	s0,4(s1)
8000f028:	00c41703          	lh	a4,12(s0)
8000f02c:	01071793          	slli	a5,a4,0x10
8000f030:	0107d793          	srli	a5,a5,0x10
8000f034:	0087f693          	andi	a3,a5,8
8000f038:	0a069463          	bnez	a3,8000f0e0 <__swsetup_r+0x100>
8000f03c:	0107f693          	andi	a3,a5,16
8000f040:	04069c63          	bnez	a3,8000f098 <__swsetup_r+0xb8>
8000f044:	00900793          	li	a5,9
8000f048:	00f92023          	sw	a5,0(s2)
8000f04c:	04076713          	ori	a4,a4,64
8000f050:	00e41623          	sh	a4,12(s0)
8000f054:	fff00513          	li	a0,-1
8000f058:	00c12083          	lw	ra,12(sp)
8000f05c:	00812403          	lw	s0,8(sp)
8000f060:	00412483          	lw	s1,4(sp)
8000f064:	00012903          	lw	s2,0(sp)
8000f068:	01010113          	addi	sp,sp,16
8000f06c:	00008067          	ret
8000f070:	ffff4797          	auipc	a5,0xffff4
8000f074:	e4c78793          	addi	a5,a5,-436 # 80002ebc <__sf_fake_stdout>
8000f078:	00f41663          	bne	s0,a5,8000f084 <__swsetup_r+0xa4>
8000f07c:	0084a403          	lw	s0,8(s1)
8000f080:	fa9ff06f          	j	8000f028 <__swsetup_r+0x48>
8000f084:	ffff4797          	auipc	a5,0xffff4
8000f088:	df878793          	addi	a5,a5,-520 # 80002e7c <__sf_fake_stderr>
8000f08c:	f8f41ee3          	bne	s0,a5,8000f028 <__swsetup_r+0x48>
8000f090:	00c4a403          	lw	s0,12(s1)
8000f094:	f95ff06f          	j	8000f028 <__swsetup_r+0x48>
8000f098:	0047f793          	andi	a5,a5,4
8000f09c:	02078c63          	beqz	a5,8000f0d4 <__swsetup_r+0xf4>
8000f0a0:	03442583          	lw	a1,52(s0)
8000f0a4:	00058c63          	beqz	a1,8000f0bc <__swsetup_r+0xdc>
8000f0a8:	04440793          	addi	a5,s0,68
8000f0ac:	00f58663          	beq	a1,a5,8000f0b8 <__swsetup_r+0xd8>
8000f0b0:	00090513          	mv	a0,s2
8000f0b4:	aa8ff0ef          	jal	ra,8000e35c <_free_r>
8000f0b8:	02042a23          	sw	zero,52(s0)
8000f0bc:	00c45783          	lhu	a5,12(s0)
8000f0c0:	00042223          	sw	zero,4(s0)
8000f0c4:	fdb7f793          	andi	a5,a5,-37
8000f0c8:	00f41623          	sh	a5,12(s0)
8000f0cc:	01042783          	lw	a5,16(s0)
8000f0d0:	00f42023          	sw	a5,0(s0)
8000f0d4:	00c45783          	lhu	a5,12(s0)
8000f0d8:	0087e793          	ori	a5,a5,8
8000f0dc:	00f41623          	sh	a5,12(s0)
8000f0e0:	01042783          	lw	a5,16(s0)
8000f0e4:	02079063          	bnez	a5,8000f104 <__swsetup_r+0x124>
8000f0e8:	00c45783          	lhu	a5,12(s0)
8000f0ec:	20000713          	li	a4,512
8000f0f0:	2807f793          	andi	a5,a5,640
8000f0f4:	00e78863          	beq	a5,a4,8000f104 <__swsetup_r+0x124>
8000f0f8:	00040593          	mv	a1,s0
8000f0fc:	00090513          	mv	a0,s2
8000f100:	178000ef          	jal	ra,8000f278 <__smakebuf_r>
8000f104:	00c45783          	lhu	a5,12(s0)
8000f108:	0017f713          	andi	a4,a5,1
8000f10c:	02070c63          	beqz	a4,8000f144 <__swsetup_r+0x164>
8000f110:	01442783          	lw	a5,20(s0)
8000f114:	00042423          	sw	zero,8(s0)
8000f118:	40f007b3          	neg	a5,a5
8000f11c:	00f42c23          	sw	a5,24(s0)
8000f120:	01042783          	lw	a5,16(s0)
8000f124:	00000513          	li	a0,0
8000f128:	f20798e3          	bnez	a5,8000f058 <__swsetup_r+0x78>
8000f12c:	00c41783          	lh	a5,12(s0)
8000f130:	0807f713          	andi	a4,a5,128
8000f134:	f20702e3          	beqz	a4,8000f058 <__swsetup_r+0x78>
8000f138:	0407e793          	ori	a5,a5,64
8000f13c:	00f41623          	sh	a5,12(s0)
8000f140:	f15ff06f          	j	8000f054 <__swsetup_r+0x74>
8000f144:	0027f793          	andi	a5,a5,2
8000f148:	00000713          	li	a4,0
8000f14c:	00079463          	bnez	a5,8000f154 <__swsetup_r+0x174>
8000f150:	01442703          	lw	a4,20(s0)
8000f154:	00e42423          	sw	a4,8(s0)
8000f158:	fc9ff06f          	j	8000f120 <__swsetup_r+0x140>

Disassembly of section .text._close_r:

8000f15c <_close_r>:
8000f15c:	ff010113          	addi	sp,sp,-16
8000f160:	00812423          	sw	s0,8(sp)
8000f164:	00050413          	mv	s0,a0
8000f168:	00058513          	mv	a0,a1
8000f16c:	c401a623          	sw	zero,-948(gp) # 800034f4 <errno>
8000f170:	00112623          	sw	ra,12(sp)
8000f174:	b99f60ef          	jal	ra,80005d0c <_close>
8000f178:	fff00793          	li	a5,-1
8000f17c:	00f51a63          	bne	a0,a5,8000f190 <_close_r+0x34>
8000f180:	c4c18793          	addi	a5,gp,-948 # 800034f4 <errno>
8000f184:	0007a783          	lw	a5,0(a5)
8000f188:	00078463          	beqz	a5,8000f190 <_close_r+0x34>
8000f18c:	00f42023          	sw	a5,0(s0)
8000f190:	00c12083          	lw	ra,12(sp)
8000f194:	00812403          	lw	s0,8(sp)
8000f198:	01010113          	addi	sp,sp,16
8000f19c:	00008067          	ret

Disassembly of section .text._lseek_r:

8000f1a0 <_lseek_r>:
8000f1a0:	ff010113          	addi	sp,sp,-16
8000f1a4:	00812423          	sw	s0,8(sp)
8000f1a8:	00050413          	mv	s0,a0
8000f1ac:	00058513          	mv	a0,a1
8000f1b0:	00060593          	mv	a1,a2
8000f1b4:	00068613          	mv	a2,a3
8000f1b8:	c401a623          	sw	zero,-948(gp) # 800034f4 <errno>
8000f1bc:	00112623          	sw	ra,12(sp)
8000f1c0:	b55f60ef          	jal	ra,80005d14 <_lseek>
8000f1c4:	fff00793          	li	a5,-1
8000f1c8:	00f51a63          	bne	a0,a5,8000f1dc <_lseek_r+0x3c>
8000f1cc:	c4c18793          	addi	a5,gp,-948 # 800034f4 <errno>
8000f1d0:	0007a783          	lw	a5,0(a5)
8000f1d4:	00078463          	beqz	a5,8000f1dc <_lseek_r+0x3c>
8000f1d8:	00f42023          	sw	a5,0(s0)
8000f1dc:	00c12083          	lw	ra,12(sp)
8000f1e0:	00812403          	lw	s0,8(sp)
8000f1e4:	01010113          	addi	sp,sp,16
8000f1e8:	00008067          	ret

Disassembly of section .text.__swhatbuf_r:

8000f1ec <__swhatbuf_r>:
8000f1ec:	f8010113          	addi	sp,sp,-128
8000f1f0:	06912a23          	sw	s1,116(sp)
8000f1f4:	00058493          	mv	s1,a1
8000f1f8:	00e59583          	lh	a1,14(a1)
8000f1fc:	06812c23          	sw	s0,120(sp)
8000f200:	06112e23          	sw	ra,124(sp)
8000f204:	00060413          	mv	s0,a2
8000f208:	0005de63          	bgez	a1,8000f224 <__swhatbuf_r+0x38>
8000f20c:	00c4d783          	lhu	a5,12(s1)
8000f210:	0006a023          	sw	zero,0(a3)
8000f214:	0807f793          	andi	a5,a5,128
8000f218:	04079063          	bnez	a5,8000f258 <__swhatbuf_r+0x6c>
8000f21c:	40000793          	li	a5,1024
8000f220:	03c0006f          	j	8000f25c <__swhatbuf_r+0x70>
8000f224:	01810613          	addi	a2,sp,24
8000f228:	00d12623          	sw	a3,12(sp)
8000f22c:	46c010ef          	jal	ra,80010698 <_fstat_r>
8000f230:	00c12683          	lw	a3,12(sp)
8000f234:	fc054ce3          	bltz	a0,8000f20c <__swhatbuf_r+0x20>
8000f238:	01c12703          	lw	a4,28(sp)
8000f23c:	0000f7b7          	lui	a5,0xf
8000f240:	00e7f7b3          	and	a5,a5,a4
8000f244:	ffffe737          	lui	a4,0xffffe
8000f248:	00e787b3          	add	a5,a5,a4
8000f24c:	0017b793          	seqz	a5,a5
8000f250:	00f6a023          	sw	a5,0(a3)
8000f254:	fc9ff06f          	j	8000f21c <__swhatbuf_r+0x30>
8000f258:	04000793          	li	a5,64
8000f25c:	00f42023          	sw	a5,0(s0)
8000f260:	07c12083          	lw	ra,124(sp)
8000f264:	07812403          	lw	s0,120(sp)
8000f268:	07412483          	lw	s1,116(sp)
8000f26c:	00000513          	li	a0,0
8000f270:	08010113          	addi	sp,sp,128
8000f274:	00008067          	ret

Disassembly of section .text.__smakebuf_r:

8000f278 <__smakebuf_r>:
8000f278:	00c5d783          	lhu	a5,12(a1)
8000f27c:	fe010113          	addi	sp,sp,-32
8000f280:	00812c23          	sw	s0,24(sp)
8000f284:	00112e23          	sw	ra,28(sp)
8000f288:	00912a23          	sw	s1,20(sp)
8000f28c:	01212823          	sw	s2,16(sp)
8000f290:	0027f793          	andi	a5,a5,2
8000f294:	00058413          	mv	s0,a1
8000f298:	02078863          	beqz	a5,8000f2c8 <__smakebuf_r+0x50>
8000f29c:	04740793          	addi	a5,s0,71
8000f2a0:	00f42023          	sw	a5,0(s0)
8000f2a4:	00f42823          	sw	a5,16(s0)
8000f2a8:	00100793          	li	a5,1
8000f2ac:	00f42a23          	sw	a5,20(s0)
8000f2b0:	01c12083          	lw	ra,28(sp)
8000f2b4:	01812403          	lw	s0,24(sp)
8000f2b8:	01412483          	lw	s1,20(sp)
8000f2bc:	01012903          	lw	s2,16(sp)
8000f2c0:	02010113          	addi	sp,sp,32
8000f2c4:	00008067          	ret
8000f2c8:	00c10693          	addi	a3,sp,12
8000f2cc:	00810613          	addi	a2,sp,8
8000f2d0:	00050493          	mv	s1,a0
8000f2d4:	f19ff0ef          	jal	ra,8000f1ec <__swhatbuf_r>
8000f2d8:	00812583          	lw	a1,8(sp)
8000f2dc:	00050913          	mv	s2,a0
8000f2e0:	00048513          	mv	a0,s1
8000f2e4:	97cff0ef          	jal	ra,8000e460 <_malloc_r>
8000f2e8:	02051063          	bnez	a0,8000f308 <__smakebuf_r+0x90>
8000f2ec:	00c41783          	lh	a5,12(s0)
8000f2f0:	2007f713          	andi	a4,a5,512
8000f2f4:	fa071ee3          	bnez	a4,8000f2b0 <__smakebuf_r+0x38>
8000f2f8:	ffc7f793          	andi	a5,a5,-4
8000f2fc:	0027e793          	ori	a5,a5,2
8000f300:	00f41623          	sh	a5,12(s0)
8000f304:	f99ff06f          	j	8000f29c <__smakebuf_r+0x24>
8000f308:	fffff797          	auipc	a5,0xfffff
8000f30c:	9c078793          	addi	a5,a5,-1600 # 8000dcc8 <_cleanup_r>
8000f310:	02f4a423          	sw	a5,40(s1)
8000f314:	00c45783          	lhu	a5,12(s0)
8000f318:	00a42023          	sw	a0,0(s0)
8000f31c:	00a42823          	sw	a0,16(s0)
8000f320:	0807e793          	ori	a5,a5,128
8000f324:	00f41623          	sh	a5,12(s0)
8000f328:	00812783          	lw	a5,8(sp)
8000f32c:	00f42a23          	sw	a5,20(s0)
8000f330:	00c12783          	lw	a5,12(sp)
8000f334:	02078263          	beqz	a5,8000f358 <__smakebuf_r+0xe0>
8000f338:	00e41583          	lh	a1,14(s0)
8000f33c:	00048513          	mv	a0,s1
8000f340:	001010ef          	jal	ra,80010b40 <_isatty_r>
8000f344:	00050a63          	beqz	a0,8000f358 <__smakebuf_r+0xe0>
8000f348:	00c45783          	lhu	a5,12(s0)
8000f34c:	ffc7f793          	andi	a5,a5,-4
8000f350:	0017e793          	ori	a5,a5,1
8000f354:	00f41623          	sh	a5,12(s0)
8000f358:	00c45783          	lhu	a5,12(s0)
8000f35c:	00f96933          	or	s2,s2,a5
8000f360:	01241623          	sh	s2,12(s0)
8000f364:	f4dff06f          	j	8000f2b0 <__smakebuf_r+0x38>

Disassembly of section .text.__ssputs_r:

8000f368 <__ssputs_r>:
8000f368:	fe010113          	addi	sp,sp,-32
8000f36c:	01212823          	sw	s2,16(sp)
8000f370:	0085a903          	lw	s2,8(a1)
8000f374:	00812c23          	sw	s0,24(sp)
8000f378:	01412423          	sw	s4,8(sp)
8000f37c:	01612023          	sw	s6,0(sp)
8000f380:	00112e23          	sw	ra,28(sp)
8000f384:	00912a23          	sw	s1,20(sp)
8000f388:	01312623          	sw	s3,12(sp)
8000f38c:	01512223          	sw	s5,4(sp)
8000f390:	00058413          	mv	s0,a1
8000f394:	00060b13          	mv	s6,a2
8000f398:	00068a13          	mv	s4,a3
8000f39c:	0f26e063          	bltu	a3,s2,8000f47c <__ssputs_r+0x114>
8000f3a0:	00c5d783          	lhu	a5,12(a1)
8000f3a4:	4807f713          	andi	a4,a5,1152
8000f3a8:	0c070863          	beqz	a4,8000f478 <__ssputs_r+0x110>
8000f3ac:	00042483          	lw	s1,0(s0)
8000f3b0:	01442703          	lw	a4,20(s0)
8000f3b4:	0105a583          	lw	a1,16(a1)
8000f3b8:	00050a93          	mv	s5,a0
8000f3bc:	40b489b3          	sub	s3,s1,a1
8000f3c0:	00171493          	slli	s1,a4,0x1
8000f3c4:	00e48733          	add	a4,s1,a4
8000f3c8:	01f75493          	srli	s1,a4,0x1f
8000f3cc:	00e484b3          	add	s1,s1,a4
8000f3d0:	00168713          	addi	a4,a3,1
8000f3d4:	4014d493          	srai	s1,s1,0x1
8000f3d8:	01370733          	add	a4,a4,s3
8000f3dc:	00e4f463          	bgeu	s1,a4,8000f3e4 <__ssputs_r+0x7c>
8000f3e0:	00070493          	mv	s1,a4
8000f3e4:	4007f793          	andi	a5,a5,1024
8000f3e8:	0c078463          	beqz	a5,8000f4b0 <__ssputs_r+0x148>
8000f3ec:	00048593          	mv	a1,s1
8000f3f0:	000a8513          	mv	a0,s5
8000f3f4:	86cff0ef          	jal	ra,8000e460 <_malloc_r>
8000f3f8:	00050913          	mv	s2,a0
8000f3fc:	04051263          	bnez	a0,8000f440 <__ssputs_r+0xd8>
8000f400:	00c00793          	li	a5,12
8000f404:	00faa023          	sw	a5,0(s5)
8000f408:	00c45783          	lhu	a5,12(s0)
8000f40c:	fff00513          	li	a0,-1
8000f410:	0407e793          	ori	a5,a5,64
8000f414:	00f41623          	sh	a5,12(s0)
8000f418:	01c12083          	lw	ra,28(sp)
8000f41c:	01812403          	lw	s0,24(sp)
8000f420:	01412483          	lw	s1,20(sp)
8000f424:	01012903          	lw	s2,16(sp)
8000f428:	00c12983          	lw	s3,12(sp)
8000f42c:	00812a03          	lw	s4,8(sp)
8000f430:	00412a83          	lw	s5,4(sp)
8000f434:	00012b03          	lw	s6,0(sp)
8000f438:	02010113          	addi	sp,sp,32
8000f43c:	00008067          	ret
8000f440:	01042583          	lw	a1,16(s0)
8000f444:	00098613          	mv	a2,s3
8000f448:	d8dfe0ef          	jal	ra,8000e1d4 <memcpy>
8000f44c:	00c45783          	lhu	a5,12(s0)
8000f450:	b7f7f793          	andi	a5,a5,-1153
8000f454:	0807e793          	ori	a5,a5,128
8000f458:	00f41623          	sh	a5,12(s0)
8000f45c:	01242823          	sw	s2,16(s0)
8000f460:	00942a23          	sw	s1,20(s0)
8000f464:	01390933          	add	s2,s2,s3
8000f468:	413484b3          	sub	s1,s1,s3
8000f46c:	01242023          	sw	s2,0(s0)
8000f470:	00942423          	sw	s1,8(s0)
8000f474:	000a0913          	mv	s2,s4
8000f478:	012a7463          	bgeu	s4,s2,8000f480 <__ssputs_r+0x118>
8000f47c:	000a0913          	mv	s2,s4
8000f480:	00042503          	lw	a0,0(s0)
8000f484:	00090613          	mv	a2,s2
8000f488:	000b0593          	mv	a1,s6
8000f48c:	e21fe0ef          	jal	ra,8000e2ac <memmove>
8000f490:	00842783          	lw	a5,8(s0)
8000f494:	00000513          	li	a0,0
8000f498:	412787b3          	sub	a5,a5,s2
8000f49c:	00f42423          	sw	a5,8(s0)
8000f4a0:	00042783          	lw	a5,0(s0)
8000f4a4:	01278933          	add	s2,a5,s2
8000f4a8:	01242023          	sw	s2,0(s0)
8000f4ac:	f6dff06f          	j	8000f418 <__ssputs_r+0xb0>
8000f4b0:	00048613          	mv	a2,s1
8000f4b4:	000a8513          	mv	a0,s5
8000f4b8:	6f0010ef          	jal	ra,80010ba8 <_realloc_r>
8000f4bc:	00050913          	mv	s2,a0
8000f4c0:	f8051ee3          	bnez	a0,8000f45c <__ssputs_r+0xf4>
8000f4c4:	01042583          	lw	a1,16(s0)
8000f4c8:	000a8513          	mv	a0,s5
8000f4cc:	e91fe0ef          	jal	ra,8000e35c <_free_r>
8000f4d0:	f31ff06f          	j	8000f400 <__ssputs_r+0x98>

Disassembly of section .text.__ssprint_r:

8000f4d4 <__ssprint_r>:
8000f4d4:	00862783          	lw	a5,8(a2)
8000f4d8:	fd010113          	addi	sp,sp,-48
8000f4dc:	01312e23          	sw	s3,28(sp)
8000f4e0:	02112623          	sw	ra,44(sp)
8000f4e4:	02812423          	sw	s0,40(sp)
8000f4e8:	02912223          	sw	s1,36(sp)
8000f4ec:	03212023          	sw	s2,32(sp)
8000f4f0:	01412c23          	sw	s4,24(sp)
8000f4f4:	01512a23          	sw	s5,20(sp)
8000f4f8:	01612823          	sw	s6,16(sp)
8000f4fc:	01712623          	sw	s7,12(sp)
8000f500:	01812423          	sw	s8,8(sp)
8000f504:	00060993          	mv	s3,a2
8000f508:	12078663          	beqz	a5,8000f634 <__ssprint_r+0x160>
8000f50c:	00062b03          	lw	s6,0(a2)
8000f510:	00050a93          	mv	s5,a0
8000f514:	00058413          	mv	s0,a1
8000f518:	00000b93          	li	s7,0
8000f51c:	00000913          	li	s2,0
8000f520:	08090663          	beqz	s2,8000f5ac <__ssprint_r+0xd8>
8000f524:	00842a03          	lw	s4,8(s0)
8000f528:	0d496663          	bltu	s2,s4,8000f5f4 <__ssprint_r+0x120>
8000f52c:	00c45783          	lhu	a5,12(s0)
8000f530:	4807f713          	andi	a4,a5,1152
8000f534:	0c070063          	beqz	a4,8000f5f4 <__ssprint_r+0x120>
8000f538:	00042483          	lw	s1,0(s0)
8000f53c:	01442703          	lw	a4,20(s0)
8000f540:	01042583          	lw	a1,16(s0)
8000f544:	40b48c33          	sub	s8,s1,a1
8000f548:	00171493          	slli	s1,a4,0x1
8000f54c:	00e48733          	add	a4,s1,a4
8000f550:	01f75493          	srli	s1,a4,0x1f
8000f554:	00e484b3          	add	s1,s1,a4
8000f558:	001c0713          	addi	a4,s8,1
8000f55c:	4014d493          	srai	s1,s1,0x1
8000f560:	01270733          	add	a4,a4,s2
8000f564:	00e4f463          	bgeu	s1,a4,8000f56c <__ssprint_r+0x98>
8000f568:	00070493          	mv	s1,a4
8000f56c:	4007f793          	andi	a5,a5,1024
8000f570:	0e078e63          	beqz	a5,8000f66c <__ssprint_r+0x198>
8000f574:	00048593          	mv	a1,s1
8000f578:	000a8513          	mv	a0,s5
8000f57c:	ee5fe0ef          	jal	ra,8000e460 <_malloc_r>
8000f580:	00050a13          	mv	s4,a0
8000f584:	02051c63          	bnez	a0,8000f5bc <__ssprint_r+0xe8>
8000f588:	00c00793          	li	a5,12
8000f58c:	00faa023          	sw	a5,0(s5)
8000f590:	00c45783          	lhu	a5,12(s0)
8000f594:	fff00513          	li	a0,-1
8000f598:	0407e793          	ori	a5,a5,64
8000f59c:	00f41623          	sh	a5,12(s0)
8000f5a0:	0009a423          	sw	zero,8(s3) # 80000008 <_ram_heap_end+0xfffee008>
8000f5a4:	0009a223          	sw	zero,4(s3)
8000f5a8:	0940006f          	j	8000f63c <__ssprint_r+0x168>
8000f5ac:	000b2b83          	lw	s7,0(s6)
8000f5b0:	004b2903          	lw	s2,4(s6)
8000f5b4:	008b0b13          	addi	s6,s6,8
8000f5b8:	f69ff06f          	j	8000f520 <__ssprint_r+0x4c>
8000f5bc:	01042583          	lw	a1,16(s0)
8000f5c0:	000c0613          	mv	a2,s8
8000f5c4:	c11fe0ef          	jal	ra,8000e1d4 <memcpy>
8000f5c8:	00c45783          	lhu	a5,12(s0)
8000f5cc:	b7f7f793          	andi	a5,a5,-1153
8000f5d0:	0807e793          	ori	a5,a5,128
8000f5d4:	00f41623          	sh	a5,12(s0)
8000f5d8:	01442823          	sw	s4,16(s0)
8000f5dc:	00942a23          	sw	s1,20(s0)
8000f5e0:	018a0a33          	add	s4,s4,s8
8000f5e4:	418484b3          	sub	s1,s1,s8
8000f5e8:	01442023          	sw	s4,0(s0)
8000f5ec:	00942423          	sw	s1,8(s0)
8000f5f0:	00090a13          	mv	s4,s2
8000f5f4:	01497463          	bgeu	s2,s4,8000f5fc <__ssprint_r+0x128>
8000f5f8:	00090a13          	mv	s4,s2
8000f5fc:	00042503          	lw	a0,0(s0)
8000f600:	000a0613          	mv	a2,s4
8000f604:	000b8593          	mv	a1,s7
8000f608:	ca5fe0ef          	jal	ra,8000e2ac <memmove>
8000f60c:	00842783          	lw	a5,8(s0)
8000f610:	414787b3          	sub	a5,a5,s4
8000f614:	00f42423          	sw	a5,8(s0)
8000f618:	00042783          	lw	a5,0(s0)
8000f61c:	01478a33          	add	s4,a5,s4
8000f620:	0089a783          	lw	a5,8(s3)
8000f624:	01442023          	sw	s4,0(s0)
8000f628:	41278933          	sub	s2,a5,s2
8000f62c:	0129a423          	sw	s2,8(s3)
8000f630:	f6091ee3          	bnez	s2,8000f5ac <__ssprint_r+0xd8>
8000f634:	0009a223          	sw	zero,4(s3)
8000f638:	00000513          	li	a0,0
8000f63c:	02c12083          	lw	ra,44(sp)
8000f640:	02812403          	lw	s0,40(sp)
8000f644:	02412483          	lw	s1,36(sp)
8000f648:	02012903          	lw	s2,32(sp)
8000f64c:	01c12983          	lw	s3,28(sp)
8000f650:	01812a03          	lw	s4,24(sp)
8000f654:	01412a83          	lw	s5,20(sp)
8000f658:	01012b03          	lw	s6,16(sp)
8000f65c:	00c12b83          	lw	s7,12(sp)
8000f660:	00812c03          	lw	s8,8(sp)
8000f664:	03010113          	addi	sp,sp,48
8000f668:	00008067          	ret
8000f66c:	00048613          	mv	a2,s1
8000f670:	000a8513          	mv	a0,s5
8000f674:	534010ef          	jal	ra,80010ba8 <_realloc_r>
8000f678:	00050a13          	mv	s4,a0
8000f67c:	f4051ee3          	bnez	a0,8000f5d8 <__ssprint_r+0x104>
8000f680:	01042583          	lw	a1,16(s0)
8000f684:	000a8513          	mv	a0,s5
8000f688:	cd5fe0ef          	jal	ra,8000e35c <_free_r>
8000f68c:	efdff06f          	j	8000f588 <__ssprint_r+0xb4>

Disassembly of section .text._svfprintf_r:

8000f690 <_svfiprintf_r>:
8000f690:	00c5d783          	lhu	a5,12(a1)
8000f694:	f5010113          	addi	sp,sp,-176
8000f698:	0a912223          	sw	s1,164(sp)
8000f69c:	0b212023          	sw	s2,160(sp)
8000f6a0:	09312e23          	sw	s3,156(sp)
8000f6a4:	0a112623          	sw	ra,172(sp)
8000f6a8:	0a812423          	sw	s0,168(sp)
8000f6ac:	09412c23          	sw	s4,152(sp)
8000f6b0:	09512a23          	sw	s5,148(sp)
8000f6b4:	09612823          	sw	s6,144(sp)
8000f6b8:	09712623          	sw	s7,140(sp)
8000f6bc:	09812423          	sw	s8,136(sp)
8000f6c0:	09912223          	sw	s9,132(sp)
8000f6c4:	0807f793          	andi	a5,a5,128
8000f6c8:	00050993          	mv	s3,a0
8000f6cc:	00058913          	mv	s2,a1
8000f6d0:	00060493          	mv	s1,a2
8000f6d4:	06078863          	beqz	a5,8000f744 <_svfiprintf_r+0xb4>
8000f6d8:	0105a783          	lw	a5,16(a1)
8000f6dc:	06079463          	bnez	a5,8000f744 <_svfiprintf_r+0xb4>
8000f6e0:	04000593          	li	a1,64
8000f6e4:	00d12623          	sw	a3,12(sp)
8000f6e8:	d79fe0ef          	jal	ra,8000e460 <_malloc_r>
8000f6ec:	00a92023          	sw	a0,0(s2)
8000f6f0:	00a92823          	sw	a0,16(s2)
8000f6f4:	00c12683          	lw	a3,12(sp)
8000f6f8:	04051263          	bnez	a0,8000f73c <_svfiprintf_r+0xac>
8000f6fc:	00c00793          	li	a5,12
8000f700:	00f9a023          	sw	a5,0(s3)
8000f704:	fff00513          	li	a0,-1
8000f708:	0ac12083          	lw	ra,172(sp)
8000f70c:	0a812403          	lw	s0,168(sp)
8000f710:	0a412483          	lw	s1,164(sp)
8000f714:	0a012903          	lw	s2,160(sp)
8000f718:	09c12983          	lw	s3,156(sp)
8000f71c:	09812a03          	lw	s4,152(sp)
8000f720:	09412a83          	lw	s5,148(sp)
8000f724:	09012b03          	lw	s6,144(sp)
8000f728:	08c12b83          	lw	s7,140(sp)
8000f72c:	08812c03          	lw	s8,136(sp)
8000f730:	08412c83          	lw	s9,132(sp)
8000f734:	0b010113          	addi	sp,sp,176
8000f738:	00008067          	ret
8000f73c:	04000793          	li	a5,64
8000f740:	00f92a23          	sw	a5,20(s2)
8000f744:	02000793          	li	a5,32
8000f748:	02f10ca3          	sb	a5,57(sp)
8000f74c:	03000793          	li	a5,48
8000f750:	02012a23          	sw	zero,52(sp)
8000f754:	02f10d23          	sb	a5,58(sp)
8000f758:	00d12e23          	sw	a3,28(sp)
8000f75c:	02500b13          	li	s6,37
8000f760:	ffff3a97          	auipc	s5,0xffff3
8000f764:	77ca8a93          	addi	s5,s5,1916 # 80002edc <__sf_fake_stdout+0x20>
8000f768:	00100b93          	li	s7,1
8000f76c:	7fff1c17          	auipc	s8,0x7fff1
8000f770:	894c0c13          	addi	s8,s8,-1900 # 0 <_ram_heap_end+0x7ffee000>
8000f774:	00048413          	mv	s0,s1
8000f778:	00044783          	lbu	a5,0(s0)
8000f77c:	00078463          	beqz	a5,8000f784 <_svfiprintf_r+0xf4>
8000f780:	0d679663          	bne	a5,s6,8000f84c <_svfiprintf_r+0x1bc>
8000f784:	40940cb3          	sub	s9,s0,s1
8000f788:	020c8663          	beqz	s9,8000f7b4 <_svfiprintf_r+0x124>
8000f78c:	000c8693          	mv	a3,s9
8000f790:	00048613          	mv	a2,s1
8000f794:	00090593          	mv	a1,s2
8000f798:	00098513          	mv	a0,s3
8000f79c:	bcdff0ef          	jal	ra,8000f368 <__ssputs_r>
8000f7a0:	fff00793          	li	a5,-1
8000f7a4:	24f50e63          	beq	a0,a5,8000fa00 <_svfiprintf_r+0x370>
8000f7a8:	03412683          	lw	a3,52(sp)
8000f7ac:	019686b3          	add	a3,a3,s9
8000f7b0:	02d12a23          	sw	a3,52(sp)
8000f7b4:	00044783          	lbu	a5,0(s0)
8000f7b8:	24078463          	beqz	a5,8000fa00 <_svfiprintf_r+0x370>
8000f7bc:	fff00793          	li	a5,-1
8000f7c0:	00140493          	addi	s1,s0,1
8000f7c4:	02012023          	sw	zero,32(sp)
8000f7c8:	02012623          	sw	zero,44(sp)
8000f7cc:	02f12223          	sw	a5,36(sp)
8000f7d0:	02012423          	sw	zero,40(sp)
8000f7d4:	060101a3          	sb	zero,99(sp)
8000f7d8:	06012c23          	sw	zero,120(sp)
8000f7dc:	0004c583          	lbu	a1,0(s1)
8000f7e0:	00500613          	li	a2,5
8000f7e4:	000a8513          	mv	a0,s5
8000f7e8:	39c010ef          	jal	ra,80010b84 <memchr>
8000f7ec:	00148413          	addi	s0,s1,1
8000f7f0:	02012783          	lw	a5,32(sp)
8000f7f4:	06051063          	bnez	a0,8000f854 <_svfiprintf_r+0x1c4>
8000f7f8:	0107f713          	andi	a4,a5,16
8000f7fc:	00070663          	beqz	a4,8000f808 <_svfiprintf_r+0x178>
8000f800:	02000713          	li	a4,32
8000f804:	06e101a3          	sb	a4,99(sp)
8000f808:	0087f713          	andi	a4,a5,8
8000f80c:	00070663          	beqz	a4,8000f818 <_svfiprintf_r+0x188>
8000f810:	02b00713          	li	a4,43
8000f814:	06e101a3          	sb	a4,99(sp)
8000f818:	0004c683          	lbu	a3,0(s1)
8000f81c:	02a00713          	li	a4,42
8000f820:	04e68663          	beq	a3,a4,8000f86c <_svfiprintf_r+0x1dc>
8000f824:	02c12703          	lw	a4,44(sp)
8000f828:	00048413          	mv	s0,s1
8000f82c:	00000793          	li	a5,0
8000f830:	00900613          	li	a2,9
8000f834:	00044683          	lbu	a3,0(s0)
8000f838:	00140593          	addi	a1,s0,1
8000f83c:	fd068693          	addi	a3,a3,-48
8000f840:	10d67a63          	bgeu	a2,a3,8000f954 <_svfiprintf_r+0x2c4>
8000f844:	02079e63          	bnez	a5,8000f880 <_svfiprintf_r+0x1f0>
8000f848:	0500006f          	j	8000f898 <_svfiprintf_r+0x208>
8000f84c:	00140413          	addi	s0,s0,1
8000f850:	f29ff06f          	j	8000f778 <_svfiprintf_r+0xe8>
8000f854:	41550533          	sub	a0,a0,s5
8000f858:	00ab9533          	sll	a0,s7,a0
8000f85c:	00a7e7b3          	or	a5,a5,a0
8000f860:	02f12023          	sw	a5,32(sp)
8000f864:	00040493          	mv	s1,s0
8000f868:	f75ff06f          	j	8000f7dc <_svfiprintf_r+0x14c>
8000f86c:	01c12703          	lw	a4,28(sp)
8000f870:	00470693          	addi	a3,a4,4 # ffffe004 <_ram_heap_end+0x7ffec004>
8000f874:	00072703          	lw	a4,0(a4)
8000f878:	00d12e23          	sw	a3,28(sp)
8000f87c:	00074663          	bltz	a4,8000f888 <_svfiprintf_r+0x1f8>
8000f880:	02e12623          	sw	a4,44(sp)
8000f884:	0140006f          	j	8000f898 <_svfiprintf_r+0x208>
8000f888:	40e00733          	neg	a4,a4
8000f88c:	0027e793          	ori	a5,a5,2
8000f890:	02e12623          	sw	a4,44(sp)
8000f894:	02f12023          	sw	a5,32(sp)
8000f898:	00044703          	lbu	a4,0(s0)
8000f89c:	02e00793          	li	a5,46
8000f8a0:	02f71663          	bne	a4,a5,8000f8cc <_svfiprintf_r+0x23c>
8000f8a4:	00144703          	lbu	a4,1(s0)
8000f8a8:	02a00793          	li	a5,42
8000f8ac:	0cf71663          	bne	a4,a5,8000f978 <_svfiprintf_r+0x2e8>
8000f8b0:	01c12783          	lw	a5,28(sp)
8000f8b4:	00240413          	addi	s0,s0,2
8000f8b8:	00478713          	addi	a4,a5,4
8000f8bc:	0007a783          	lw	a5,0(a5)
8000f8c0:	00e12e23          	sw	a4,28(sp)
8000f8c4:	0a07c663          	bltz	a5,8000f970 <_svfiprintf_r+0x2e0>
8000f8c8:	02f12223          	sw	a5,36(sp)
8000f8cc:	00044583          	lbu	a1,0(s0)
8000f8d0:	00300613          	li	a2,3
8000f8d4:	ffff3517          	auipc	a0,0xffff3
8000f8d8:	61050513          	addi	a0,a0,1552 # 80002ee4 <__sf_fake_stdout+0x28>
8000f8dc:	2a8010ef          	jal	ra,80010b84 <memchr>
8000f8e0:	02050463          	beqz	a0,8000f908 <_svfiprintf_r+0x278>
8000f8e4:	ffff3797          	auipc	a5,0xffff3
8000f8e8:	60078793          	addi	a5,a5,1536 # 80002ee4 <__sf_fake_stdout+0x28>
8000f8ec:	40f50533          	sub	a0,a0,a5
8000f8f0:	04000793          	li	a5,64
8000f8f4:	00a797b3          	sll	a5,a5,a0
8000f8f8:	02012503          	lw	a0,32(sp)
8000f8fc:	00140413          	addi	s0,s0,1
8000f900:	00f56533          	or	a0,a0,a5
8000f904:	02a12023          	sw	a0,32(sp)
8000f908:	00044583          	lbu	a1,0(s0)
8000f90c:	00600613          	li	a2,6
8000f910:	ffff3517          	auipc	a0,0xffff3
8000f914:	5d850513          	addi	a0,a0,1496 # 80002ee8 <__sf_fake_stdout+0x2c>
8000f918:	00140493          	addi	s1,s0,1
8000f91c:	02b10c23          	sb	a1,56(sp)
8000f920:	264010ef          	jal	ra,80010b84 <memchr>
8000f924:	0e050a63          	beqz	a0,8000fa18 <_svfiprintf_r+0x388>
8000f928:	0a0c1663          	bnez	s8,8000f9d4 <_svfiprintf_r+0x344>
8000f92c:	02012703          	lw	a4,32(sp)
8000f930:	01c12783          	lw	a5,28(sp)
8000f934:	10077713          	andi	a4,a4,256
8000f938:	08070663          	beqz	a4,8000f9c4 <_svfiprintf_r+0x334>
8000f93c:	00478793          	addi	a5,a5,4
8000f940:	00f12e23          	sw	a5,28(sp)
8000f944:	03412783          	lw	a5,52(sp)
8000f948:	014787b3          	add	a5,a5,s4
8000f94c:	02f12a23          	sw	a5,52(sp)
8000f950:	e25ff06f          	j	8000f774 <_svfiprintf_r+0xe4>
8000f954:	00271793          	slli	a5,a4,0x2
8000f958:	00e787b3          	add	a5,a5,a4
8000f95c:	00179793          	slli	a5,a5,0x1
8000f960:	00d78733          	add	a4,a5,a3
8000f964:	00058413          	mv	s0,a1
8000f968:	00100793          	li	a5,1
8000f96c:	ec9ff06f          	j	8000f834 <_svfiprintf_r+0x1a4>
8000f970:	fff00793          	li	a5,-1
8000f974:	f55ff06f          	j	8000f8c8 <_svfiprintf_r+0x238>
8000f978:	00140413          	addi	s0,s0,1
8000f97c:	02012223          	sw	zero,36(sp)
8000f980:	00000793          	li	a5,0
8000f984:	00000713          	li	a4,0
8000f988:	00900613          	li	a2,9
8000f98c:	00044683          	lbu	a3,0(s0)
8000f990:	00140593          	addi	a1,s0,1
8000f994:	fd068693          	addi	a3,a3,-48
8000f998:	00d67863          	bgeu	a2,a3,8000f9a8 <_svfiprintf_r+0x318>
8000f99c:	f20788e3          	beqz	a5,8000f8cc <_svfiprintf_r+0x23c>
8000f9a0:	02e12223          	sw	a4,36(sp)
8000f9a4:	f29ff06f          	j	8000f8cc <_svfiprintf_r+0x23c>
8000f9a8:	00271793          	slli	a5,a4,0x2
8000f9ac:	00e787b3          	add	a5,a5,a4
8000f9b0:	00179793          	slli	a5,a5,0x1
8000f9b4:	00d78733          	add	a4,a5,a3
8000f9b8:	00058413          	mv	s0,a1
8000f9bc:	00100793          	li	a5,1
8000f9c0:	fcdff06f          	j	8000f98c <_svfiprintf_r+0x2fc>
8000f9c4:	00778793          	addi	a5,a5,7
8000f9c8:	ff87f793          	andi	a5,a5,-8
8000f9cc:	00878793          	addi	a5,a5,8
8000f9d0:	f71ff06f          	j	8000f940 <_svfiprintf_r+0x2b0>
8000f9d4:	01c10713          	addi	a4,sp,28
8000f9d8:	00000697          	auipc	a3,0x0
8000f9dc:	99068693          	addi	a3,a3,-1648 # 8000f368 <__ssputs_r>
8000f9e0:	00090613          	mv	a2,s2
8000f9e4:	02010593          	addi	a1,sp,32
8000f9e8:	00098513          	mv	a0,s3
8000f9ec:	00000097          	auipc	ra,0x0
8000f9f0:	000000e7          	jalr	zero # 0 <_ram_heap_size>
8000f9f4:	fff00793          	li	a5,-1
8000f9f8:	00050a13          	mv	s4,a0
8000f9fc:	f4f514e3          	bne	a0,a5,8000f944 <_svfiprintf_r+0x2b4>
8000fa00:	00c95783          	lhu	a5,12(s2)
8000fa04:	fff00513          	li	a0,-1
8000fa08:	0407f793          	andi	a5,a5,64
8000fa0c:	ce079ee3          	bnez	a5,8000f708 <_svfiprintf_r+0x78>
8000fa10:	03412503          	lw	a0,52(sp)
8000fa14:	cf5ff06f          	j	8000f708 <_svfiprintf_r+0x78>
8000fa18:	01c10713          	addi	a4,sp,28
8000fa1c:	00000697          	auipc	a3,0x0
8000fa20:	94c68693          	addi	a3,a3,-1716 # 8000f368 <__ssputs_r>
8000fa24:	00090613          	mv	a2,s2
8000fa28:	02010593          	addi	a1,sp,32
8000fa2c:	00098513          	mv	a0,s3
8000fa30:	1b8000ef          	jal	ra,8000fbe8 <_printf_i>
8000fa34:	fc1ff06f          	j	8000f9f4 <_svfiprintf_r+0x364>

Disassembly of section .text._printf_common:

8000fa38 <_printf_common>:
8000fa38:	fd010113          	addi	sp,sp,-48
8000fa3c:	01512a23          	sw	s5,20(sp)
8000fa40:	0105a783          	lw	a5,16(a1)
8000fa44:	00070a93          	mv	s5,a4
8000fa48:	0085a703          	lw	a4,8(a1)
8000fa4c:	02812423          	sw	s0,40(sp)
8000fa50:	02912223          	sw	s1,36(sp)
8000fa54:	01312e23          	sw	s3,28(sp)
8000fa58:	01412c23          	sw	s4,24(sp)
8000fa5c:	02112623          	sw	ra,44(sp)
8000fa60:	03212023          	sw	s2,32(sp)
8000fa64:	01612823          	sw	s6,16(sp)
8000fa68:	01712623          	sw	s7,12(sp)
8000fa6c:	00050993          	mv	s3,a0
8000fa70:	00058413          	mv	s0,a1
8000fa74:	00060493          	mv	s1,a2
8000fa78:	00068a13          	mv	s4,a3
8000fa7c:	00e7d463          	bge	a5,a4,8000fa84 <_printf_common+0x4c>
8000fa80:	00070793          	mv	a5,a4
8000fa84:	00f4a023          	sw	a5,0(s1)
8000fa88:	04344703          	lbu	a4,67(s0)
8000fa8c:	00070663          	beqz	a4,8000fa98 <_printf_common+0x60>
8000fa90:	00178793          	addi	a5,a5,1
8000fa94:	00f4a023          	sw	a5,0(s1)
8000fa98:	00042783          	lw	a5,0(s0)
8000fa9c:	0207f793          	andi	a5,a5,32
8000faa0:	00078863          	beqz	a5,8000fab0 <_printf_common+0x78>
8000faa4:	0004a783          	lw	a5,0(s1)
8000faa8:	00278793          	addi	a5,a5,2
8000faac:	00f4a023          	sw	a5,0(s1)
8000fab0:	00042903          	lw	s2,0(s0)
8000fab4:	00697913          	andi	s2,s2,6
8000fab8:	00091e63          	bnez	s2,8000fad4 <_printf_common+0x9c>
8000fabc:	01940b13          	addi	s6,s0,25
8000fac0:	fff00b93          	li	s7,-1
8000fac4:	00c42783          	lw	a5,12(s0)
8000fac8:	0004a703          	lw	a4,0(s1)
8000facc:	40e787b3          	sub	a5,a5,a4
8000fad0:	08f94263          	blt	s2,a5,8000fb54 <_printf_common+0x11c>
8000fad4:	00042783          	lw	a5,0(s0)
8000fad8:	04344683          	lbu	a3,67(s0)
8000fadc:	0207f793          	andi	a5,a5,32
8000fae0:	00d036b3          	snez	a3,a3
8000fae4:	0c079063          	bnez	a5,8000fba4 <_printf_common+0x16c>
8000fae8:	04340613          	addi	a2,s0,67
8000faec:	000a0593          	mv	a1,s4
8000faf0:	00098513          	mv	a0,s3
8000faf4:	000a80e7          	jalr	s5
8000faf8:	fff00793          	li	a5,-1
8000fafc:	06f50863          	beq	a0,a5,8000fb6c <_printf_common+0x134>
8000fb00:	00042783          	lw	a5,0(s0)
8000fb04:	00400613          	li	a2,4
8000fb08:	0004a703          	lw	a4,0(s1)
8000fb0c:	0067f793          	andi	a5,a5,6
8000fb10:	00c42683          	lw	a3,12(s0)
8000fb14:	00000493          	li	s1,0
8000fb18:	00c79863          	bne	a5,a2,8000fb28 <_printf_common+0xf0>
8000fb1c:	40e684b3          	sub	s1,a3,a4
8000fb20:	0004d463          	bgez	s1,8000fb28 <_printf_common+0xf0>
8000fb24:	00000493          	li	s1,0
8000fb28:	00842783          	lw	a5,8(s0)
8000fb2c:	01042703          	lw	a4,16(s0)
8000fb30:	00f75663          	bge	a4,a5,8000fb3c <_printf_common+0x104>
8000fb34:	40e787b3          	sub	a5,a5,a4
8000fb38:	00f484b3          	add	s1,s1,a5
8000fb3c:	00000913          	li	s2,0
8000fb40:	01a40413          	addi	s0,s0,26
8000fb44:	fff00b13          	li	s6,-1
8000fb48:	09249063          	bne	s1,s2,8000fbc8 <_printf_common+0x190>
8000fb4c:	00000513          	li	a0,0
8000fb50:	0200006f          	j	8000fb70 <_printf_common+0x138>
8000fb54:	00100693          	li	a3,1
8000fb58:	000b0613          	mv	a2,s6
8000fb5c:	000a0593          	mv	a1,s4
8000fb60:	00098513          	mv	a0,s3
8000fb64:	000a80e7          	jalr	s5
8000fb68:	03751a63          	bne	a0,s7,8000fb9c <_printf_common+0x164>
8000fb6c:	fff00513          	li	a0,-1
8000fb70:	02c12083          	lw	ra,44(sp)
8000fb74:	02812403          	lw	s0,40(sp)
8000fb78:	02412483          	lw	s1,36(sp)
8000fb7c:	02012903          	lw	s2,32(sp)
8000fb80:	01c12983          	lw	s3,28(sp)
8000fb84:	01812a03          	lw	s4,24(sp)
8000fb88:	01412a83          	lw	s5,20(sp)
8000fb8c:	01012b03          	lw	s6,16(sp)
8000fb90:	00c12b83          	lw	s7,12(sp)
8000fb94:	03010113          	addi	sp,sp,48
8000fb98:	00008067          	ret
8000fb9c:	00190913          	addi	s2,s2,1
8000fba0:	f25ff06f          	j	8000fac4 <_printf_common+0x8c>
8000fba4:	00d40733          	add	a4,s0,a3
8000fba8:	03000613          	li	a2,48
8000fbac:	04c701a3          	sb	a2,67(a4)
8000fbb0:	04544703          	lbu	a4,69(s0)
8000fbb4:	00168793          	addi	a5,a3,1
8000fbb8:	00f407b3          	add	a5,s0,a5
8000fbbc:	00268693          	addi	a3,a3,2
8000fbc0:	04e781a3          	sb	a4,67(a5)
8000fbc4:	f25ff06f          	j	8000fae8 <_printf_common+0xb0>
8000fbc8:	00100693          	li	a3,1
8000fbcc:	00040613          	mv	a2,s0
8000fbd0:	000a0593          	mv	a1,s4
8000fbd4:	00098513          	mv	a0,s3
8000fbd8:	000a80e7          	jalr	s5
8000fbdc:	f96508e3          	beq	a0,s6,8000fb6c <_printf_common+0x134>
8000fbe0:	00190913          	addi	s2,s2,1
8000fbe4:	f65ff06f          	j	8000fb48 <_printf_common+0x110>

Disassembly of section .text._printf_i:

8000fbe8 <_printf_i>:
8000fbe8:	fc010113          	addi	sp,sp,-64
8000fbec:	02812c23          	sw	s0,56(sp)
8000fbf0:	03312623          	sw	s3,44(sp)
8000fbf4:	03512223          	sw	s5,36(sp)
8000fbf8:	03612023          	sw	s6,32(sp)
8000fbfc:	01712e23          	sw	s7,28(sp)
8000fc00:	02112e23          	sw	ra,60(sp)
8000fc04:	02912a23          	sw	s1,52(sp)
8000fc08:	03212823          	sw	s2,48(sp)
8000fc0c:	03412423          	sw	s4,40(sp)
8000fc10:	01812c23          	sw	s8,24(sp)
8000fc14:	0185c783          	lbu	a5,24(a1)
8000fc18:	00068b93          	mv	s7,a3
8000fc1c:	06e00693          	li	a3,110
8000fc20:	00050a93          	mv	s5,a0
8000fc24:	00058413          	mv	s0,a1
8000fc28:	00060b13          	mv	s6,a2
8000fc2c:	04358993          	addi	s3,a1,67
8000fc30:	28d78c63          	beq	a5,a3,8000fec8 <_printf_i+0x2e0>
8000fc34:	06f6e863          	bltu	a3,a5,8000fca4 <_printf_i+0xbc>
8000fc38:	06300693          	li	a3,99
8000fc3c:	0ad78c63          	beq	a5,a3,8000fcf4 <_printf_i+0x10c>
8000fc40:	00f6ec63          	bltu	a3,a5,8000fc58 <_printf_i+0x70>
8000fc44:	2c078063          	beqz	a5,8000ff04 <_printf_i+0x31c>
8000fc48:	05800693          	li	a3,88
8000fc4c:	12d78863          	beq	a5,a3,8000fd7c <_printf_i+0x194>
8000fc50:	04240c13          	addi	s8,s0,66
8000fc54:	0b40006f          	j	8000fd08 <_printf_i+0x120>
8000fc58:	06400693          	li	a3,100
8000fc5c:	00d78663          	beq	a5,a3,8000fc68 <_printf_i+0x80>
8000fc60:	06900693          	li	a3,105
8000fc64:	fed796e3          	bne	a5,a3,8000fc50 <_printf_i+0x68>
8000fc68:	00042783          	lw	a5,0(s0)
8000fc6c:	00072603          	lw	a2,0(a4)
8000fc70:	0807f593          	andi	a1,a5,128
8000fc74:	00460693          	addi	a3,a2,4
8000fc78:	08058e63          	beqz	a1,8000fd14 <_printf_i+0x12c>
8000fc7c:	00062483          	lw	s1,0(a2)
8000fc80:	00d72023          	sw	a3,0(a4)
8000fc84:	0004d863          	bgez	s1,8000fc94 <_printf_i+0xac>
8000fc88:	02d00793          	li	a5,45
8000fc8c:	409004b3          	neg	s1,s1
8000fc90:	04f401a3          	sb	a5,67(s0)
8000fc94:	ffff3a17          	auipc	s4,0xffff3
8000fc98:	25ca0a13          	addi	s4,s4,604 # 80002ef0 <__sf_fake_stdout+0x34>
8000fc9c:	00a00913          	li	s2,10
8000fca0:	12c0006f          	j	8000fdcc <_printf_i+0x1e4>
8000fca4:	07300693          	li	a3,115
8000fca8:	26d78463          	beq	a5,a3,8000ff10 <_printf_i+0x328>
8000fcac:	02f6e263          	bltu	a3,a5,8000fcd0 <_printf_i+0xe8>
8000fcb0:	06f00693          	li	a3,111
8000fcb4:	06d78e63          	beq	a5,a3,8000fd30 <_printf_i+0x148>
8000fcb8:	07000693          	li	a3,112
8000fcbc:	f8d79ae3          	bne	a5,a3,8000fc50 <_printf_i+0x68>
8000fcc0:	0005a783          	lw	a5,0(a1)
8000fcc4:	0207e793          	ori	a5,a5,32
8000fcc8:	00f5a023          	sw	a5,0(a1)
8000fccc:	0140006f          	j	8000fce0 <_printf_i+0xf8>
8000fcd0:	07500693          	li	a3,117
8000fcd4:	04d78e63          	beq	a5,a3,8000fd30 <_printf_i+0x148>
8000fcd8:	07800693          	li	a3,120
8000fcdc:	f6d79ae3          	bne	a5,a3,8000fc50 <_printf_i+0x68>
8000fce0:	07800793          	li	a5,120
8000fce4:	04f402a3          	sb	a5,69(s0)
8000fce8:	ffff3a17          	auipc	s4,0xffff3
8000fcec:	21ca0a13          	addi	s4,s4,540 # 80002f04 <__sf_fake_stdout+0x48>
8000fcf0:	0980006f          	j	8000fd88 <_printf_i+0x1a0>
8000fcf4:	00072783          	lw	a5,0(a4)
8000fcf8:	04258c13          	addi	s8,a1,66
8000fcfc:	00478693          	addi	a3,a5,4
8000fd00:	0007a783          	lw	a5,0(a5)
8000fd04:	00d72023          	sw	a3,0(a4)
8000fd08:	04f40123          	sb	a5,66(s0)
8000fd0c:	00100793          	li	a5,1
8000fd10:	2300006f          	j	8000ff40 <_printf_i+0x358>
8000fd14:	00062483          	lw	s1,0(a2)
8000fd18:	0407f793          	andi	a5,a5,64
8000fd1c:	00d72023          	sw	a3,0(a4)
8000fd20:	f60782e3          	beqz	a5,8000fc84 <_printf_i+0x9c>
8000fd24:	01049493          	slli	s1,s1,0x10
8000fd28:	4104d493          	srai	s1,s1,0x10
8000fd2c:	f59ff06f          	j	8000fc84 <_printf_i+0x9c>
8000fd30:	00042603          	lw	a2,0(s0)
8000fd34:	00072683          	lw	a3,0(a4)
8000fd38:	08067513          	andi	a0,a2,128
8000fd3c:	00468593          	addi	a1,a3,4
8000fd40:	00050863          	beqz	a0,8000fd50 <_printf_i+0x168>
8000fd44:	00b72023          	sw	a1,0(a4)
8000fd48:	0006a483          	lw	s1,0(a3)
8000fd4c:	0140006f          	j	8000fd60 <_printf_i+0x178>
8000fd50:	04067613          	andi	a2,a2,64
8000fd54:	00b72023          	sw	a1,0(a4)
8000fd58:	fe0608e3          	beqz	a2,8000fd48 <_printf_i+0x160>
8000fd5c:	0006d483          	lhu	s1,0(a3)
8000fd60:	06f00713          	li	a4,111
8000fd64:	ffff3a17          	auipc	s4,0xffff3
8000fd68:	18ca0a13          	addi	s4,s4,396 # 80002ef0 <__sf_fake_stdout+0x34>
8000fd6c:	00a00913          	li	s2,10
8000fd70:	04e79c63          	bne	a5,a4,8000fdc8 <_printf_i+0x1e0>
8000fd74:	00800913          	li	s2,8
8000fd78:	0500006f          	j	8000fdc8 <_printf_i+0x1e0>
8000fd7c:	04f582a3          	sb	a5,69(a1)
8000fd80:	ffff3a17          	auipc	s4,0xffff3
8000fd84:	170a0a13          	addi	s4,s4,368 # 80002ef0 <__sf_fake_stdout+0x34>
8000fd88:	00042783          	lw	a5,0(s0)
8000fd8c:	00072683          	lw	a3,0(a4)
8000fd90:	0807f613          	andi	a2,a5,128
8000fd94:	0006a483          	lw	s1,0(a3)
8000fd98:	00468693          	addi	a3,a3,4
8000fd9c:	10060663          	beqz	a2,8000fea8 <_printf_i+0x2c0>
8000fda0:	00d72023          	sw	a3,0(a4)
8000fda4:	0017f713          	andi	a4,a5,1
8000fda8:	00070663          	beqz	a4,8000fdb4 <_printf_i+0x1cc>
8000fdac:	0207e793          	ori	a5,a5,32
8000fdb0:	00f42023          	sw	a5,0(s0)
8000fdb4:	01000913          	li	s2,16
8000fdb8:	00049863          	bnez	s1,8000fdc8 <_printf_i+0x1e0>
8000fdbc:	00042783          	lw	a5,0(s0)
8000fdc0:	fdf7f793          	andi	a5,a5,-33
8000fdc4:	00f42023          	sw	a5,0(s0)
8000fdc8:	040401a3          	sb	zero,67(s0)
8000fdcc:	00442783          	lw	a5,4(s0)
8000fdd0:	00f42423          	sw	a5,8(s0)
8000fdd4:	0007c863          	bltz	a5,8000fde4 <_printf_i+0x1fc>
8000fdd8:	00042703          	lw	a4,0(s0)
8000fddc:	ffb77713          	andi	a4,a4,-5
8000fde0:	00e42023          	sw	a4,0(s0)
8000fde4:	00049663          	bnez	s1,8000fdf0 <_printf_i+0x208>
8000fde8:	00098c13          	mv	s8,s3
8000fdec:	02078a63          	beqz	a5,8000fe20 <_printf_i+0x238>
8000fdf0:	00098c13          	mv	s8,s3
8000fdf4:	00090593          	mv	a1,s2
8000fdf8:	00048513          	mv	a0,s1
8000fdfc:	da4fd0ef          	jal	ra,8000d3a0 <__umodsi3>
8000fe00:	00aa0533          	add	a0,s4,a0
8000fe04:	00054783          	lbu	a5,0(a0)
8000fe08:	fffc0c13          	addi	s8,s8,-1
8000fe0c:	00090593          	mv	a1,s2
8000fe10:	00fc0023          	sb	a5,0(s8)
8000fe14:	00048513          	mv	a0,s1
8000fe18:	d40fd0ef          	jal	ra,8000d358 <__udivsi3>
8000fe1c:	0b24f263          	bgeu	s1,s2,8000fec0 <_printf_i+0x2d8>
8000fe20:	00800793          	li	a5,8
8000fe24:	02f91463          	bne	s2,a5,8000fe4c <_printf_i+0x264>
8000fe28:	00042783          	lw	a5,0(s0)
8000fe2c:	0017f793          	andi	a5,a5,1
8000fe30:	00078e63          	beqz	a5,8000fe4c <_printf_i+0x264>
8000fe34:	00442703          	lw	a4,4(s0)
8000fe38:	01042783          	lw	a5,16(s0)
8000fe3c:	00e7c863          	blt	a5,a4,8000fe4c <_printf_i+0x264>
8000fe40:	03000793          	li	a5,48
8000fe44:	fefc0fa3          	sb	a5,-1(s8)
8000fe48:	fffc0c13          	addi	s8,s8,-1
8000fe4c:	418989b3          	sub	s3,s3,s8
8000fe50:	01342823          	sw	s3,16(s0)
8000fe54:	000b8713          	mv	a4,s7
8000fe58:	000b0693          	mv	a3,s6
8000fe5c:	00c10613          	addi	a2,sp,12
8000fe60:	00040593          	mv	a1,s0
8000fe64:	000a8513          	mv	a0,s5
8000fe68:	bd1ff0ef          	jal	ra,8000fa38 <_printf_common>
8000fe6c:	fff00493          	li	s1,-1
8000fe70:	0c951e63          	bne	a0,s1,8000ff4c <_printf_i+0x364>
8000fe74:	fff00513          	li	a0,-1
8000fe78:	03c12083          	lw	ra,60(sp)
8000fe7c:	03812403          	lw	s0,56(sp)
8000fe80:	03412483          	lw	s1,52(sp)
8000fe84:	03012903          	lw	s2,48(sp)
8000fe88:	02c12983          	lw	s3,44(sp)
8000fe8c:	02812a03          	lw	s4,40(sp)
8000fe90:	02412a83          	lw	s5,36(sp)
8000fe94:	02012b03          	lw	s6,32(sp)
8000fe98:	01c12b83          	lw	s7,28(sp)
8000fe9c:	01812c03          	lw	s8,24(sp)
8000fea0:	04010113          	addi	sp,sp,64
8000fea4:	00008067          	ret
8000fea8:	0407f613          	andi	a2,a5,64
8000feac:	00d72023          	sw	a3,0(a4)
8000feb0:	ee060ae3          	beqz	a2,8000fda4 <_printf_i+0x1bc>
8000feb4:	01049493          	slli	s1,s1,0x10
8000feb8:	0104d493          	srli	s1,s1,0x10
8000febc:	ee9ff06f          	j	8000fda4 <_printf_i+0x1bc>
8000fec0:	00050493          	mv	s1,a0
8000fec4:	f31ff06f          	j	8000fdf4 <_printf_i+0x20c>
8000fec8:	0005a683          	lw	a3,0(a1)
8000fecc:	00072783          	lw	a5,0(a4)
8000fed0:	0145a603          	lw	a2,20(a1)
8000fed4:	0806f513          	andi	a0,a3,128
8000fed8:	00478593          	addi	a1,a5,4
8000fedc:	00050a63          	beqz	a0,8000fef0 <_printf_i+0x308>
8000fee0:	00b72023          	sw	a1,0(a4)
8000fee4:	0007a783          	lw	a5,0(a5)
8000fee8:	00c7a023          	sw	a2,0(a5)
8000feec:	0180006f          	j	8000ff04 <_printf_i+0x31c>
8000fef0:	00b72023          	sw	a1,0(a4)
8000fef4:	0406f693          	andi	a3,a3,64
8000fef8:	0007a783          	lw	a5,0(a5)
8000fefc:	fe0686e3          	beqz	a3,8000fee8 <_printf_i+0x300>
8000ff00:	00c79023          	sh	a2,0(a5)
8000ff04:	00042823          	sw	zero,16(s0)
8000ff08:	00098c13          	mv	s8,s3
8000ff0c:	f49ff06f          	j	8000fe54 <_printf_i+0x26c>
8000ff10:	00072783          	lw	a5,0(a4)
8000ff14:	0045a603          	lw	a2,4(a1)
8000ff18:	00000593          	li	a1,0
8000ff1c:	00478693          	addi	a3,a5,4
8000ff20:	00d72023          	sw	a3,0(a4)
8000ff24:	0007ac03          	lw	s8,0(a5)
8000ff28:	000c0513          	mv	a0,s8
8000ff2c:	459000ef          	jal	ra,80010b84 <memchr>
8000ff30:	00050663          	beqz	a0,8000ff3c <_printf_i+0x354>
8000ff34:	41850533          	sub	a0,a0,s8
8000ff38:	00a42223          	sw	a0,4(s0)
8000ff3c:	00442783          	lw	a5,4(s0)
8000ff40:	00f42823          	sw	a5,16(s0)
8000ff44:	040401a3          	sb	zero,67(s0)
8000ff48:	f0dff06f          	j	8000fe54 <_printf_i+0x26c>
8000ff4c:	01042683          	lw	a3,16(s0)
8000ff50:	000c0613          	mv	a2,s8
8000ff54:	000b0593          	mv	a1,s6
8000ff58:	000a8513          	mv	a0,s5
8000ff5c:	000b80e7          	jalr	s7
8000ff60:	f0950ae3          	beq	a0,s1,8000fe74 <_printf_i+0x28c>
8000ff64:	00042783          	lw	a5,0(s0)
8000ff68:	0027f793          	andi	a5,a5,2
8000ff6c:	04079463          	bnez	a5,8000ffb4 <_printf_i+0x3cc>
8000ff70:	00c12783          	lw	a5,12(sp)
8000ff74:	00c42503          	lw	a0,12(s0)
8000ff78:	f0f550e3          	bge	a0,a5,8000fe78 <_printf_i+0x290>
8000ff7c:	00078513          	mv	a0,a5
8000ff80:	ef9ff06f          	j	8000fe78 <_printf_i+0x290>
8000ff84:	00100693          	li	a3,1
8000ff88:	00090613          	mv	a2,s2
8000ff8c:	000b0593          	mv	a1,s6
8000ff90:	000a8513          	mv	a0,s5
8000ff94:	000b80e7          	jalr	s7
8000ff98:	ed350ee3          	beq	a0,s3,8000fe74 <_printf_i+0x28c>
8000ff9c:	00148493          	addi	s1,s1,1
8000ffa0:	00c42783          	lw	a5,12(s0)
8000ffa4:	00c12703          	lw	a4,12(sp)
8000ffa8:	40e787b3          	sub	a5,a5,a4
8000ffac:	fcf4cce3          	blt	s1,a5,8000ff84 <_printf_i+0x39c>
8000ffb0:	fc1ff06f          	j	8000ff70 <_printf_i+0x388>
8000ffb4:	00000493          	li	s1,0
8000ffb8:	01940913          	addi	s2,s0,25
8000ffbc:	fff00993          	li	s3,-1
8000ffc0:	fe1ff06f          	j	8000ffa0 <_printf_i+0x3b8>

Disassembly of section .text.__sfputc_r:

8000ffc4 <__sfputc_r>:
8000ffc4:	00862783          	lw	a5,8(a2)
8000ffc8:	fff78793          	addi	a5,a5,-1
8000ffcc:	00f62423          	sw	a5,8(a2)
8000ffd0:	0007dc63          	bgez	a5,8000ffe8 <__sfputc_r+0x24>
8000ffd4:	01862703          	lw	a4,24(a2)
8000ffd8:	00e7c663          	blt	a5,a4,8000ffe4 <__sfputc_r+0x20>
8000ffdc:	00a00793          	li	a5,10
8000ffe0:	00f59463          	bne	a1,a5,8000ffe8 <__sfputc_r+0x24>
8000ffe4:	e65fe06f          	j	8000ee48 <__swbuf_r>
8000ffe8:	00062783          	lw	a5,0(a2)
8000ffec:	00058513          	mv	a0,a1
8000fff0:	00178713          	addi	a4,a5,1
8000fff4:	00e62023          	sw	a4,0(a2)
8000fff8:	00b78023          	sb	a1,0(a5)
8000fffc:	00008067          	ret

Disassembly of section .text.__sfputs_r:

80010000 <__sfputs_r>:
80010000:	fe010113          	addi	sp,sp,-32
80010004:	00812c23          	sw	s0,24(sp)
80010008:	00912a23          	sw	s1,20(sp)
8001000c:	01212823          	sw	s2,16(sp)
80010010:	01312623          	sw	s3,12(sp)
80010014:	01412423          	sw	s4,8(sp)
80010018:	00112e23          	sw	ra,28(sp)
8001001c:	00050913          	mv	s2,a0
80010020:	00058993          	mv	s3,a1
80010024:	00060413          	mv	s0,a2
80010028:	00d604b3          	add	s1,a2,a3
8001002c:	fff00a13          	li	s4,-1
80010030:	00941663          	bne	s0,s1,8001003c <__sfputs_r+0x3c>
80010034:	00000513          	li	a0,0
80010038:	01c0006f          	j	80010054 <__sfputs_r+0x54>
8001003c:	00044583          	lbu	a1,0(s0)
80010040:	00098613          	mv	a2,s3
80010044:	00090513          	mv	a0,s2
80010048:	f7dff0ef          	jal	ra,8000ffc4 <__sfputc_r>
8001004c:	00140413          	addi	s0,s0,1
80010050:	ff4510e3          	bne	a0,s4,80010030 <__sfputs_r+0x30>
80010054:	01c12083          	lw	ra,28(sp)
80010058:	01812403          	lw	s0,24(sp)
8001005c:	01412483          	lw	s1,20(sp)
80010060:	01012903          	lw	s2,16(sp)
80010064:	00c12983          	lw	s3,12(sp)
80010068:	00812a03          	lw	s4,8(sp)
8001006c:	02010113          	addi	sp,sp,32
80010070:	00008067          	ret

Disassembly of section .text.__sprint_r:

80010074 <__sprint_r>:
80010074:	00862703          	lw	a4,8(a2)
80010078:	ff010113          	addi	sp,sp,-16
8001007c:	00812423          	sw	s0,8(sp)
80010080:	00112623          	sw	ra,12(sp)
80010084:	00060413          	mv	s0,a2
80010088:	00071e63          	bnez	a4,800100a4 <__sprint_r+0x30>
8001008c:	00062223          	sw	zero,4(a2)
80010090:	00000513          	li	a0,0
80010094:	00c12083          	lw	ra,12(sp)
80010098:	00812403          	lw	s0,8(sp)
8001009c:	01010113          	addi	sp,sp,16
800100a0:	00008067          	ret
800100a4:	63c000ef          	jal	ra,800106e0 <__sfvwrite_r>
800100a8:	00042423          	sw	zero,8(s0)
800100ac:	00042223          	sw	zero,4(s0)
800100b0:	fe5ff06f          	j	80010094 <__sprint_r+0x20>

Disassembly of section .text._vfprintf_r:

800100b4 <_vfiprintf_r>:
800100b4:	f6010113          	addi	sp,sp,-160
800100b8:	08812c23          	sw	s0,152(sp)
800100bc:	08912a23          	sw	s1,148(sp)
800100c0:	09212823          	sw	s2,144(sp)
800100c4:	09312623          	sw	s3,140(sp)
800100c8:	08112e23          	sw	ra,156(sp)
800100cc:	09412423          	sw	s4,136(sp)
800100d0:	09512223          	sw	s5,132(sp)
800100d4:	09612023          	sw	s6,128(sp)
800100d8:	07712e23          	sw	s7,124(sp)
800100dc:	07812c23          	sw	s8,120(sp)
800100e0:	07912a23          	sw	s9,116(sp)
800100e4:	00050993          	mv	s3,a0
800100e8:	00058493          	mv	s1,a1
800100ec:	00060913          	mv	s2,a2
800100f0:	00068413          	mv	s0,a3
800100f4:	00050863          	beqz	a0,80010104 <_vfiprintf_r+0x50>
800100f8:	01852783          	lw	a5,24(a0)
800100fc:	00079463          	bnez	a5,80010104 <_vfiprintf_r+0x50>
80010100:	c61fd0ef          	jal	ra,8000dd60 <__sinit>
80010104:	ffff3797          	auipc	a5,0xffff3
80010108:	d9878793          	addi	a5,a5,-616 # 80002e9c <__sf_fake_stdin>
8001010c:	12f49263          	bne	s1,a5,80010230 <_vfiprintf_r+0x17c>
80010110:	0049a483          	lw	s1,4(s3)
80010114:	00c4d783          	lhu	a5,12(s1)
80010118:	0087f793          	andi	a5,a5,8
8001011c:	12078e63          	beqz	a5,80010258 <_vfiprintf_r+0x1a4>
80010120:	0104a783          	lw	a5,16(s1)
80010124:	12078a63          	beqz	a5,80010258 <_vfiprintf_r+0x1a4>
80010128:	02000793          	li	a5,32
8001012c:	02f104a3          	sb	a5,41(sp)
80010130:	03000793          	li	a5,48
80010134:	02012223          	sw	zero,36(sp)
80010138:	02f10523          	sb	a5,42(sp)
8001013c:	00812623          	sw	s0,12(sp)
80010140:	02500b13          	li	s6,37
80010144:	ffff3a97          	auipc	s5,0xffff3
80010148:	d98a8a93          	addi	s5,s5,-616 # 80002edc <__sf_fake_stdout+0x20>
8001014c:	00100b93          	li	s7,1
80010150:	7fff0c17          	auipc	s8,0x7fff0
80010154:	eb0c0c13          	addi	s8,s8,-336 # 0 <_ram_heap_end+0x7ffee000>
80010158:	00090413          	mv	s0,s2
8001015c:	00044783          	lbu	a5,0(s0)
80010160:	00078463          	beqz	a5,80010168 <_vfiprintf_r+0xb4>
80010164:	13679e63          	bne	a5,s6,800102a0 <_vfiprintf_r+0x1ec>
80010168:	41240cb3          	sub	s9,s0,s2
8001016c:	020c8663          	beqz	s9,80010198 <_vfiprintf_r+0xe4>
80010170:	000c8693          	mv	a3,s9
80010174:	00090613          	mv	a2,s2
80010178:	00048593          	mv	a1,s1
8001017c:	00098513          	mv	a0,s3
80010180:	e81ff0ef          	jal	ra,80010000 <__sfputs_r>
80010184:	fff00793          	li	a5,-1
80010188:	2cf50663          	beq	a0,a5,80010454 <_vfiprintf_r+0x3a0>
8001018c:	02412683          	lw	a3,36(sp)
80010190:	019686b3          	add	a3,a3,s9
80010194:	02d12223          	sw	a3,36(sp)
80010198:	00044783          	lbu	a5,0(s0)
8001019c:	2a078c63          	beqz	a5,80010454 <_vfiprintf_r+0x3a0>
800101a0:	fff00793          	li	a5,-1
800101a4:	00140913          	addi	s2,s0,1
800101a8:	00012823          	sw	zero,16(sp)
800101ac:	00012e23          	sw	zero,28(sp)
800101b0:	00f12a23          	sw	a5,20(sp)
800101b4:	00012c23          	sw	zero,24(sp)
800101b8:	040109a3          	sb	zero,83(sp)
800101bc:	06012423          	sw	zero,104(sp)
800101c0:	00094583          	lbu	a1,0(s2)
800101c4:	00500613          	li	a2,5
800101c8:	000a8513          	mv	a0,s5
800101cc:	1b9000ef          	jal	ra,80010b84 <memchr>
800101d0:	00190413          	addi	s0,s2,1
800101d4:	01012783          	lw	a5,16(sp)
800101d8:	0c051863          	bnez	a0,800102a8 <_vfiprintf_r+0x1f4>
800101dc:	0107f713          	andi	a4,a5,16
800101e0:	00070663          	beqz	a4,800101ec <_vfiprintf_r+0x138>
800101e4:	02000713          	li	a4,32
800101e8:	04e109a3          	sb	a4,83(sp)
800101ec:	0087f713          	andi	a4,a5,8
800101f0:	00070663          	beqz	a4,800101fc <_vfiprintf_r+0x148>
800101f4:	02b00713          	li	a4,43
800101f8:	04e109a3          	sb	a4,83(sp)
800101fc:	00094683          	lbu	a3,0(s2)
80010200:	02a00713          	li	a4,42
80010204:	0ae68e63          	beq	a3,a4,800102c0 <_vfiprintf_r+0x20c>
80010208:	01c12703          	lw	a4,28(sp)
8001020c:	00090413          	mv	s0,s2
80010210:	00000793          	li	a5,0
80010214:	00900613          	li	a2,9
80010218:	00044683          	lbu	a3,0(s0)
8001021c:	00140593          	addi	a1,s0,1
80010220:	fd068693          	addi	a3,a3,-48
80010224:	18d67263          	bgeu	a2,a3,800103a8 <_vfiprintf_r+0x2f4>
80010228:	0a079663          	bnez	a5,800102d4 <_vfiprintf_r+0x220>
8001022c:	0c00006f          	j	800102ec <_vfiprintf_r+0x238>
80010230:	ffff3797          	auipc	a5,0xffff3
80010234:	c8c78793          	addi	a5,a5,-884 # 80002ebc <__sf_fake_stdout>
80010238:	00f49663          	bne	s1,a5,80010244 <_vfiprintf_r+0x190>
8001023c:	0089a483          	lw	s1,8(s3)
80010240:	ed5ff06f          	j	80010114 <_vfiprintf_r+0x60>
80010244:	ffff3797          	auipc	a5,0xffff3
80010248:	c3878793          	addi	a5,a5,-968 # 80002e7c <__sf_fake_stderr>
8001024c:	ecf494e3          	bne	s1,a5,80010114 <_vfiprintf_r+0x60>
80010250:	00c9a483          	lw	s1,12(s3)
80010254:	ec1ff06f          	j	80010114 <_vfiprintf_r+0x60>
80010258:	00048593          	mv	a1,s1
8001025c:	00098513          	mv	a0,s3
80010260:	d81fe0ef          	jal	ra,8000efe0 <__swsetup_r>
80010264:	ec0502e3          	beqz	a0,80010128 <_vfiprintf_r+0x74>
80010268:	fff00513          	li	a0,-1
8001026c:	09c12083          	lw	ra,156(sp)
80010270:	09812403          	lw	s0,152(sp)
80010274:	09412483          	lw	s1,148(sp)
80010278:	09012903          	lw	s2,144(sp)
8001027c:	08c12983          	lw	s3,140(sp)
80010280:	08812a03          	lw	s4,136(sp)
80010284:	08412a83          	lw	s5,132(sp)
80010288:	08012b03          	lw	s6,128(sp)
8001028c:	07c12b83          	lw	s7,124(sp)
80010290:	07812c03          	lw	s8,120(sp)
80010294:	07412c83          	lw	s9,116(sp)
80010298:	0a010113          	addi	sp,sp,160
8001029c:	00008067          	ret
800102a0:	00140413          	addi	s0,s0,1
800102a4:	eb9ff06f          	j	8001015c <_vfiprintf_r+0xa8>
800102a8:	41550533          	sub	a0,a0,s5
800102ac:	00ab9533          	sll	a0,s7,a0
800102b0:	00a7e7b3          	or	a5,a5,a0
800102b4:	00f12823          	sw	a5,16(sp)
800102b8:	00040913          	mv	s2,s0
800102bc:	f05ff06f          	j	800101c0 <_vfiprintf_r+0x10c>
800102c0:	00c12703          	lw	a4,12(sp)
800102c4:	00470693          	addi	a3,a4,4
800102c8:	00072703          	lw	a4,0(a4)
800102cc:	00d12623          	sw	a3,12(sp)
800102d0:	00074663          	bltz	a4,800102dc <_vfiprintf_r+0x228>
800102d4:	00e12e23          	sw	a4,28(sp)
800102d8:	0140006f          	j	800102ec <_vfiprintf_r+0x238>
800102dc:	40e00733          	neg	a4,a4
800102e0:	0027e793          	ori	a5,a5,2
800102e4:	00e12e23          	sw	a4,28(sp)
800102e8:	00f12823          	sw	a5,16(sp)
800102ec:	00044703          	lbu	a4,0(s0)
800102f0:	02e00793          	li	a5,46
800102f4:	02f71663          	bne	a4,a5,80010320 <_vfiprintf_r+0x26c>
800102f8:	00144703          	lbu	a4,1(s0)
800102fc:	02a00793          	li	a5,42
80010300:	0cf71663          	bne	a4,a5,800103cc <_vfiprintf_r+0x318>
80010304:	00c12783          	lw	a5,12(sp)
80010308:	00240413          	addi	s0,s0,2
8001030c:	00478713          	addi	a4,a5,4
80010310:	0007a783          	lw	a5,0(a5)
80010314:	00e12623          	sw	a4,12(sp)
80010318:	0a07c663          	bltz	a5,800103c4 <_vfiprintf_r+0x310>
8001031c:	00f12a23          	sw	a5,20(sp)
80010320:	00044583          	lbu	a1,0(s0)
80010324:	00300613          	li	a2,3
80010328:	ffff3517          	auipc	a0,0xffff3
8001032c:	bbc50513          	addi	a0,a0,-1092 # 80002ee4 <__sf_fake_stdout+0x28>
80010330:	055000ef          	jal	ra,80010b84 <memchr>
80010334:	02050463          	beqz	a0,8001035c <_vfiprintf_r+0x2a8>
80010338:	ffff3797          	auipc	a5,0xffff3
8001033c:	bac78793          	addi	a5,a5,-1108 # 80002ee4 <__sf_fake_stdout+0x28>
80010340:	40f50533          	sub	a0,a0,a5
80010344:	04000793          	li	a5,64
80010348:	00a797b3          	sll	a5,a5,a0
8001034c:	01012503          	lw	a0,16(sp)
80010350:	00140413          	addi	s0,s0,1
80010354:	00f56533          	or	a0,a0,a5
80010358:	00a12823          	sw	a0,16(sp)
8001035c:	00044583          	lbu	a1,0(s0)
80010360:	00600613          	li	a2,6
80010364:	ffff3517          	auipc	a0,0xffff3
80010368:	b8450513          	addi	a0,a0,-1148 # 80002ee8 <__sf_fake_stdout+0x2c>
8001036c:	00140913          	addi	s2,s0,1
80010370:	02b10423          	sb	a1,40(sp)
80010374:	011000ef          	jal	ra,80010b84 <memchr>
80010378:	0e050863          	beqz	a0,80010468 <_vfiprintf_r+0x3b4>
8001037c:	0a0c1663          	bnez	s8,80010428 <_vfiprintf_r+0x374>
80010380:	01012703          	lw	a4,16(sp)
80010384:	00c12783          	lw	a5,12(sp)
80010388:	10077713          	andi	a4,a4,256
8001038c:	08070663          	beqz	a4,80010418 <_vfiprintf_r+0x364>
80010390:	00478793          	addi	a5,a5,4
80010394:	00f12623          	sw	a5,12(sp)
80010398:	02412783          	lw	a5,36(sp)
8001039c:	014787b3          	add	a5,a5,s4
800103a0:	02f12223          	sw	a5,36(sp)
800103a4:	db5ff06f          	j	80010158 <_vfiprintf_r+0xa4>
800103a8:	00271793          	slli	a5,a4,0x2
800103ac:	00e787b3          	add	a5,a5,a4
800103b0:	00179793          	slli	a5,a5,0x1
800103b4:	00d78733          	add	a4,a5,a3
800103b8:	00058413          	mv	s0,a1
800103bc:	00100793          	li	a5,1
800103c0:	e59ff06f          	j	80010218 <_vfiprintf_r+0x164>
800103c4:	fff00793          	li	a5,-1
800103c8:	f55ff06f          	j	8001031c <_vfiprintf_r+0x268>
800103cc:	00140413          	addi	s0,s0,1
800103d0:	00012a23          	sw	zero,20(sp)
800103d4:	00000793          	li	a5,0
800103d8:	00000713          	li	a4,0
800103dc:	00900613          	li	a2,9
800103e0:	00044683          	lbu	a3,0(s0)
800103e4:	00140593          	addi	a1,s0,1
800103e8:	fd068693          	addi	a3,a3,-48
800103ec:	00d67863          	bgeu	a2,a3,800103fc <_vfiprintf_r+0x348>
800103f0:	f20788e3          	beqz	a5,80010320 <_vfiprintf_r+0x26c>
800103f4:	00e12a23          	sw	a4,20(sp)
800103f8:	f29ff06f          	j	80010320 <_vfiprintf_r+0x26c>
800103fc:	00271793          	slli	a5,a4,0x2
80010400:	00e787b3          	add	a5,a5,a4
80010404:	00179793          	slli	a5,a5,0x1
80010408:	00d78733          	add	a4,a5,a3
8001040c:	00058413          	mv	s0,a1
80010410:	00100793          	li	a5,1
80010414:	fcdff06f          	j	800103e0 <_vfiprintf_r+0x32c>
80010418:	00778793          	addi	a5,a5,7
8001041c:	ff87f793          	andi	a5,a5,-8
80010420:	00878793          	addi	a5,a5,8
80010424:	f71ff06f          	j	80010394 <_vfiprintf_r+0x2e0>
80010428:	00c10713          	addi	a4,sp,12
8001042c:	00000697          	auipc	a3,0x0
80010430:	bd468693          	addi	a3,a3,-1068 # 80010000 <__sfputs_r>
80010434:	00048613          	mv	a2,s1
80010438:	01010593          	addi	a1,sp,16
8001043c:	00098513          	mv	a0,s3
80010440:	00000097          	auipc	ra,0x0
80010444:	000000e7          	jalr	zero # 0 <_ram_heap_size>
80010448:	fff00793          	li	a5,-1
8001044c:	00050a13          	mv	s4,a0
80010450:	f4f514e3          	bne	a0,a5,80010398 <_vfiprintf_r+0x2e4>
80010454:	00c4d783          	lhu	a5,12(s1)
80010458:	0407f793          	andi	a5,a5,64
8001045c:	e00796e3          	bnez	a5,80010268 <_vfiprintf_r+0x1b4>
80010460:	02412503          	lw	a0,36(sp)
80010464:	e09ff06f          	j	8001026c <_vfiprintf_r+0x1b8>
80010468:	00c10713          	addi	a4,sp,12
8001046c:	00000697          	auipc	a3,0x0
80010470:	b9468693          	addi	a3,a3,-1132 # 80010000 <__sfputs_r>
80010474:	00048613          	mv	a2,s1
80010478:	01010593          	addi	a1,sp,16
8001047c:	00098513          	mv	a0,s3
80010480:	f68ff0ef          	jal	ra,8000fbe8 <_printf_i>
80010484:	fc5ff06f          	j	80010448 <_vfiprintf_r+0x394>

Disassembly of section .text.vfprintf:

80010488 <vfiprintf>:
80010488:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
8001048c:	00060693          	mv	a3,a2
80010490:	00058613          	mv	a2,a1
80010494:	00050593          	mv	a1,a0
80010498:	0007a503          	lw	a0,0(a5)
8001049c:	c19ff06f          	j	800100b4 <_vfiprintf_r>

Disassembly of section .text._read_r:

800104a0 <_read_r>:
800104a0:	ff010113          	addi	sp,sp,-16
800104a4:	00812423          	sw	s0,8(sp)
800104a8:	00050413          	mv	s0,a0
800104ac:	00058513          	mv	a0,a1
800104b0:	00060593          	mv	a1,a2
800104b4:	00068613          	mv	a2,a3
800104b8:	c401a623          	sw	zero,-948(gp) # 800034f4 <errno>
800104bc:	00112623          	sw	ra,12(sp)
800104c0:	845f50ef          	jal	ra,80005d04 <_read>
800104c4:	fff00793          	li	a5,-1
800104c8:	00f51a63          	bne	a0,a5,800104dc <_read_r+0x3c>
800104cc:	c4c18793          	addi	a5,gp,-948 # 800034f4 <errno>
800104d0:	0007a783          	lw	a5,0(a5)
800104d4:	00078463          	beqz	a5,800104dc <_read_r+0x3c>
800104d8:	00f42023          	sw	a5,0(s0)
800104dc:	00c12083          	lw	ra,12(sp)
800104e0:	00812403          	lw	s0,8(sp)
800104e4:	01010113          	addi	sp,sp,16
800104e8:	00008067          	ret

Disassembly of section .text.cleanup_glue:

800104ec <cleanup_glue>:
800104ec:	ff010113          	addi	sp,sp,-16
800104f0:	00812423          	sw	s0,8(sp)
800104f4:	00058413          	mv	s0,a1
800104f8:	0005a583          	lw	a1,0(a1)
800104fc:	00912223          	sw	s1,4(sp)
80010500:	00112623          	sw	ra,12(sp)
80010504:	00050493          	mv	s1,a0
80010508:	00058463          	beqz	a1,80010510 <cleanup_glue+0x24>
8001050c:	fe1ff0ef          	jal	ra,800104ec <cleanup_glue>
80010510:	00040593          	mv	a1,s0
80010514:	00812403          	lw	s0,8(sp)
80010518:	00c12083          	lw	ra,12(sp)
8001051c:	00048513          	mv	a0,s1
80010520:	00412483          	lw	s1,4(sp)
80010524:	01010113          	addi	sp,sp,16
80010528:	e35fd06f          	j	8000e35c <_free_r>

Disassembly of section .text._reclaim_reent:

8001052c <_reclaim_reent>:
8001052c:	80c18793          	addi	a5,gp,-2036 # 800030b4 <_impure_ptr>
80010530:	0007a783          	lw	a5,0(a5)
80010534:	16a78063          	beq	a5,a0,80010694 <_reclaim_reent+0x168>
80010538:	02452783          	lw	a5,36(a0)
8001053c:	fe010113          	addi	sp,sp,-32
80010540:	00812c23          	sw	s0,24(sp)
80010544:	00112e23          	sw	ra,28(sp)
80010548:	00912a23          	sw	s1,20(sp)
8001054c:	01212823          	sw	s2,16(sp)
80010550:	01312623          	sw	s3,12(sp)
80010554:	00050413          	mv	s0,a0
80010558:	02078463          	beqz	a5,80010580 <_reclaim_reent+0x54>
8001055c:	00c7a783          	lw	a5,12(a5)
80010560:	00000493          	li	s1,0
80010564:	08000913          	li	s2,128
80010568:	0e079263          	bnez	a5,8001064c <_reclaim_reent+0x120>
8001056c:	02442783          	lw	a5,36(s0)
80010570:	0007a583          	lw	a1,0(a5)
80010574:	00058663          	beqz	a1,80010580 <_reclaim_reent+0x54>
80010578:	00040513          	mv	a0,s0
8001057c:	de1fd0ef          	jal	ra,8000e35c <_free_r>
80010580:	01442583          	lw	a1,20(s0)
80010584:	00058663          	beqz	a1,80010590 <_reclaim_reent+0x64>
80010588:	00040513          	mv	a0,s0
8001058c:	dd1fd0ef          	jal	ra,8000e35c <_free_r>
80010590:	02442583          	lw	a1,36(s0)
80010594:	00058663          	beqz	a1,800105a0 <_reclaim_reent+0x74>
80010598:	00040513          	mv	a0,s0
8001059c:	dc1fd0ef          	jal	ra,8000e35c <_free_r>
800105a0:	03842583          	lw	a1,56(s0)
800105a4:	00058663          	beqz	a1,800105b0 <_reclaim_reent+0x84>
800105a8:	00040513          	mv	a0,s0
800105ac:	db1fd0ef          	jal	ra,8000e35c <_free_r>
800105b0:	03c42583          	lw	a1,60(s0)
800105b4:	00058663          	beqz	a1,800105c0 <_reclaim_reent+0x94>
800105b8:	00040513          	mv	a0,s0
800105bc:	da1fd0ef          	jal	ra,8000e35c <_free_r>
800105c0:	04042583          	lw	a1,64(s0)
800105c4:	00058663          	beqz	a1,800105d0 <_reclaim_reent+0xa4>
800105c8:	00040513          	mv	a0,s0
800105cc:	d91fd0ef          	jal	ra,8000e35c <_free_r>
800105d0:	05c42583          	lw	a1,92(s0)
800105d4:	00058663          	beqz	a1,800105e0 <_reclaim_reent+0xb4>
800105d8:	00040513          	mv	a0,s0
800105dc:	d81fd0ef          	jal	ra,8000e35c <_free_r>
800105e0:	05842583          	lw	a1,88(s0)
800105e4:	00058663          	beqz	a1,800105f0 <_reclaim_reent+0xc4>
800105e8:	00040513          	mv	a0,s0
800105ec:	d71fd0ef          	jal	ra,8000e35c <_free_r>
800105f0:	03442583          	lw	a1,52(s0)
800105f4:	00058663          	beqz	a1,80010600 <_reclaim_reent+0xd4>
800105f8:	00040513          	mv	a0,s0
800105fc:	d61fd0ef          	jal	ra,8000e35c <_free_r>
80010600:	01842783          	lw	a5,24(s0)
80010604:	06078a63          	beqz	a5,80010678 <_reclaim_reent+0x14c>
80010608:	02842783          	lw	a5,40(s0)
8001060c:	00040513          	mv	a0,s0
80010610:	000780e7          	jalr	a5
80010614:	04842583          	lw	a1,72(s0)
80010618:	06058063          	beqz	a1,80010678 <_reclaim_reent+0x14c>
8001061c:	00040513          	mv	a0,s0
80010620:	01812403          	lw	s0,24(sp)
80010624:	01c12083          	lw	ra,28(sp)
80010628:	01412483          	lw	s1,20(sp)
8001062c:	01012903          	lw	s2,16(sp)
80010630:	00c12983          	lw	s3,12(sp)
80010634:	02010113          	addi	sp,sp,32
80010638:	eb5ff06f          	j	800104ec <cleanup_glue>
8001063c:	009585b3          	add	a1,a1,s1
80010640:	0005a583          	lw	a1,0(a1)
80010644:	02059063          	bnez	a1,80010664 <_reclaim_reent+0x138>
80010648:	00448493          	addi	s1,s1,4
8001064c:	02442783          	lw	a5,36(s0)
80010650:	00c7a583          	lw	a1,12(a5)
80010654:	ff2494e3          	bne	s1,s2,8001063c <_reclaim_reent+0x110>
80010658:	00040513          	mv	a0,s0
8001065c:	d01fd0ef          	jal	ra,8000e35c <_free_r>
80010660:	f0dff06f          	j	8001056c <_reclaim_reent+0x40>
80010664:	0005a983          	lw	s3,0(a1)
80010668:	00040513          	mv	a0,s0
8001066c:	cf1fd0ef          	jal	ra,8000e35c <_free_r>
80010670:	00098593          	mv	a1,s3
80010674:	fd1ff06f          	j	80010644 <_reclaim_reent+0x118>
80010678:	01c12083          	lw	ra,28(sp)
8001067c:	01812403          	lw	s0,24(sp)
80010680:	01412483          	lw	s1,20(sp)
80010684:	01012903          	lw	s2,16(sp)
80010688:	00c12983          	lw	s3,12(sp)
8001068c:	02010113          	addi	sp,sp,32
80010690:	00008067          	ret
80010694:	00008067          	ret

Disassembly of section .text._fstat_r:

80010698 <_fstat_r>:
80010698:	ff010113          	addi	sp,sp,-16
8001069c:	00812423          	sw	s0,8(sp)
800106a0:	00050413          	mv	s0,a0
800106a4:	00058513          	mv	a0,a1
800106a8:	00060593          	mv	a1,a2
800106ac:	c401a623          	sw	zero,-948(gp) # 800034f4 <errno>
800106b0:	00112623          	sw	ra,12(sp)
800106b4:	e70f50ef          	jal	ra,80005d24 <_fstat>
800106b8:	fff00793          	li	a5,-1
800106bc:	00f51a63          	bne	a0,a5,800106d0 <_fstat_r+0x38>
800106c0:	c4c18793          	addi	a5,gp,-948 # 800034f4 <errno>
800106c4:	0007a783          	lw	a5,0(a5)
800106c8:	00078463          	beqz	a5,800106d0 <_fstat_r+0x38>
800106cc:	00f42023          	sw	a5,0(s0)
800106d0:	00c12083          	lw	ra,12(sp)
800106d4:	00812403          	lw	s0,8(sp)
800106d8:	01010113          	addi	sp,sp,16
800106dc:	00008067          	ret

Disassembly of section .text.__sfvwrite_r:

800106e0 <__sfvwrite_r>:
800106e0:	00862783          	lw	a5,8(a2)
800106e4:	00079863          	bnez	a5,800106f4 <__sfvwrite_r+0x14>
800106e8:	00000793          	li	a5,0
800106ec:	00078513          	mv	a0,a5
800106f0:	00008067          	ret
800106f4:	00c5d783          	lhu	a5,12(a1)
800106f8:	fc010113          	addi	sp,sp,-64
800106fc:	02812c23          	sw	s0,56(sp)
80010700:	03212823          	sw	s2,48(sp)
80010704:	03612023          	sw	s6,32(sp)
80010708:	02112e23          	sw	ra,60(sp)
8001070c:	02912a23          	sw	s1,52(sp)
80010710:	03312623          	sw	s3,44(sp)
80010714:	03412423          	sw	s4,40(sp)
80010718:	03512223          	sw	s5,36(sp)
8001071c:	01712e23          	sw	s7,28(sp)
80010720:	01812c23          	sw	s8,24(sp)
80010724:	01912a23          	sw	s9,20(sp)
80010728:	01a12823          	sw	s10,16(sp)
8001072c:	01b12623          	sw	s11,12(sp)
80010730:	0087f793          	andi	a5,a5,8
80010734:	00060b13          	mv	s6,a2
80010738:	00058413          	mv	s0,a1
8001073c:	00050913          	mv	s2,a0
80010740:	0e078263          	beqz	a5,80010824 <__sfvwrite_r+0x144>
80010744:	0105a783          	lw	a5,16(a1)
80010748:	0c078e63          	beqz	a5,80010824 <__sfvwrite_r+0x144>
8001074c:	00c45783          	lhu	a5,12(s0)
80010750:	000b2a03          	lw	s4,0(s6)
80010754:	0027f713          	andi	a4,a5,2
80010758:	16071a63          	bnez	a4,800108cc <__sfvwrite_r+0x1ec>
8001075c:	0017f793          	andi	a5,a5,1
80010760:	00000b93          	li	s7,0
80010764:	20078a63          	beqz	a5,80010978 <__sfvwrite_r+0x298>
80010768:	00000513          	li	a0,0
8001076c:	00000a93          	li	s5,0
80010770:	00000993          	li	s3,0
80010774:	36098463          	beqz	s3,80010adc <__sfvwrite_r+0x3fc>
80010778:	02051263          	bnez	a0,8001079c <__sfvwrite_r+0xbc>
8001077c:	00098613          	mv	a2,s3
80010780:	00a00593          	li	a1,10
80010784:	000a8513          	mv	a0,s5
80010788:	3fc000ef          	jal	ra,80010b84 <memchr>
8001078c:	00198b93          	addi	s7,s3,1
80010790:	00050663          	beqz	a0,8001079c <__sfvwrite_r+0xbc>
80010794:	00150513          	addi	a0,a0,1
80010798:	41550bb3          	sub	s7,a0,s5
8001079c:	000b8c13          	mv	s8,s7
800107a0:	0179f463          	bgeu	s3,s7,800107a8 <__sfvwrite_r+0xc8>
800107a4:	00098c13          	mv	s8,s3
800107a8:	00042503          	lw	a0,0(s0)
800107ac:	01042783          	lw	a5,16(s0)
800107b0:	01442683          	lw	a3,20(s0)
800107b4:	32a7fe63          	bgeu	a5,a0,80010af0 <__sfvwrite_r+0x410>
800107b8:	00842483          	lw	s1,8(s0)
800107bc:	009684b3          	add	s1,a3,s1
800107c0:	3384d863          	bge	s1,s8,80010af0 <__sfvwrite_r+0x410>
800107c4:	000a8593          	mv	a1,s5
800107c8:	00048613          	mv	a2,s1
800107cc:	ae1fd0ef          	jal	ra,8000e2ac <memmove>
800107d0:	00042783          	lw	a5,0(s0)
800107d4:	00040593          	mv	a1,s0
800107d8:	00090513          	mv	a0,s2
800107dc:	009787b3          	add	a5,a5,s1
800107e0:	00f42023          	sw	a5,0(s0)
800107e4:	b8cfd0ef          	jal	ra,8000db70 <_fflush_r>
800107e8:	16051e63          	bnez	a0,80010964 <__sfvwrite_r+0x284>
800107ec:	409b8bb3          	sub	s7,s7,s1
800107f0:	00100513          	li	a0,1
800107f4:	000b9a63          	bnez	s7,80010808 <__sfvwrite_r+0x128>
800107f8:	00040593          	mv	a1,s0
800107fc:	00090513          	mv	a0,s2
80010800:	b70fd0ef          	jal	ra,8000db70 <_fflush_r>
80010804:	16051063          	bnez	a0,80010964 <__sfvwrite_r+0x284>
80010808:	008b2783          	lw	a5,8(s6)
8001080c:	009a8ab3          	add	s5,s5,s1
80010810:	409989b3          	sub	s3,s3,s1
80010814:	409784b3          	sub	s1,a5,s1
80010818:	009b2423          	sw	s1,8(s6)
8001081c:	f4049ce3          	bnez	s1,80010774 <__sfvwrite_r+0x94>
80010820:	0680006f          	j	80010888 <__sfvwrite_r+0x1a8>
80010824:	00040593          	mv	a1,s0
80010828:	00090513          	mv	a0,s2
8001082c:	fb4fe0ef          	jal	ra,8000efe0 <__swsetup_r>
80010830:	fff00793          	li	a5,-1
80010834:	f0050ce3          	beqz	a0,8001074c <__sfvwrite_r+0x6c>
80010838:	0540006f          	j	8001088c <__sfvwrite_r+0x1ac>
8001083c:	000a2983          	lw	s3,0(s4)
80010840:	004a2483          	lw	s1,4(s4)
80010844:	008a0a13          	addi	s4,s4,8
80010848:	fe048ae3          	beqz	s1,8001083c <__sfvwrite_r+0x15c>
8001084c:	00048693          	mv	a3,s1
80010850:	009af463          	bgeu	s5,s1,80010858 <__sfvwrite_r+0x178>
80010854:	000a8693          	mv	a3,s5
80010858:	02842783          	lw	a5,40(s0)
8001085c:	02042583          	lw	a1,32(s0)
80010860:	00098613          	mv	a2,s3
80010864:	00090513          	mv	a0,s2
80010868:	000780e7          	jalr	a5
8001086c:	0ea05c63          	blez	a0,80010964 <__sfvwrite_r+0x284>
80010870:	008b2783          	lw	a5,8(s6)
80010874:	00a989b3          	add	s3,s3,a0
80010878:	40a484b3          	sub	s1,s1,a0
8001087c:	40a78533          	sub	a0,a5,a0
80010880:	00ab2423          	sw	a0,8(s6)
80010884:	fc0512e3          	bnez	a0,80010848 <__sfvwrite_r+0x168>
80010888:	00000793          	li	a5,0
8001088c:	03c12083          	lw	ra,60(sp)
80010890:	03812403          	lw	s0,56(sp)
80010894:	03412483          	lw	s1,52(sp)
80010898:	03012903          	lw	s2,48(sp)
8001089c:	02c12983          	lw	s3,44(sp)
800108a0:	02812a03          	lw	s4,40(sp)
800108a4:	02412a83          	lw	s5,36(sp)
800108a8:	02012b03          	lw	s6,32(sp)
800108ac:	01c12b83          	lw	s7,28(sp)
800108b0:	01812c03          	lw	s8,24(sp)
800108b4:	01412c83          	lw	s9,20(sp)
800108b8:	01012d03          	lw	s10,16(sp)
800108bc:	00c12d83          	lw	s11,12(sp)
800108c0:	00078513          	mv	a0,a5
800108c4:	04010113          	addi	sp,sp,64
800108c8:	00008067          	ret
800108cc:	80000ab7          	lui	s5,0x80000
800108d0:	00000993          	li	s3,0
800108d4:	00000493          	li	s1,0
800108d8:	c00aca93          	xori	s5,s5,-1024
800108dc:	f6dff06f          	j	80010848 <__sfvwrite_r+0x168>
800108e0:	000a2b83          	lw	s7,0(s4)
800108e4:	004a2483          	lw	s1,4(s4)
800108e8:	008a0a13          	addi	s4,s4,8
800108ec:	fe048ae3          	beqz	s1,800108e0 <__sfvwrite_r+0x200>
800108f0:	00c45783          	lhu	a5,12(s0)
800108f4:	00842d83          	lw	s11,8(s0)
800108f8:	00042503          	lw	a0,0(s0)
800108fc:	2007f713          	andi	a4,a5,512
80010900:	14070263          	beqz	a4,80010a44 <__sfvwrite_r+0x364>
80010904:	0db4e063          	bltu	s1,s11,800109c4 <__sfvwrite_r+0x2e4>
80010908:	4807f713          	andi	a4,a5,1152
8001090c:	0a070c63          	beqz	a4,800109c4 <__sfvwrite_r+0x2e4>
80010910:	01442703          	lw	a4,20(s0)
80010914:	01042583          	lw	a1,16(s0)
80010918:	00171a93          	slli	s5,a4,0x1
8001091c:	00ea8733          	add	a4,s5,a4
80010920:	01f75a93          	srli	s5,a4,0x1f
80010924:	40b50d33          	sub	s10,a0,a1
80010928:	00ea8ab3          	add	s5,s5,a4
8001092c:	001d0713          	addi	a4,s10,1
80010930:	401ada93          	srai	s5,s5,0x1
80010934:	00970733          	add	a4,a4,s1
80010938:	00eaf463          	bgeu	s5,a4,80010940 <__sfvwrite_r+0x260>
8001093c:	00070a93          	mv	s5,a4
80010940:	4007f793          	andi	a5,a5,1024
80010944:	0c078863          	beqz	a5,80010a14 <__sfvwrite_r+0x334>
80010948:	000a8593          	mv	a1,s5
8001094c:	00090513          	mv	a0,s2
80010950:	b11fd0ef          	jal	ra,8000e460 <_malloc_r>
80010954:	00050993          	mv	s3,a0
80010958:	02051a63          	bnez	a0,8001098c <__sfvwrite_r+0x2ac>
8001095c:	00c00793          	li	a5,12
80010960:	00f92023          	sw	a5,0(s2)
80010964:	00c45783          	lhu	a5,12(s0)
80010968:	0407e793          	ori	a5,a5,64
8001096c:	00f41623          	sh	a5,12(s0)
80010970:	fff00793          	li	a5,-1
80010974:	f19ff06f          	j	8001088c <__sfvwrite_r+0x1ac>
80010978:	80000c37          	lui	s8,0x80000
8001097c:	ffec4c93          	xori	s9,s8,-2
80010980:	00000493          	li	s1,0
80010984:	fffc4c13          	not	s8,s8
80010988:	f65ff06f          	j	800108ec <__sfvwrite_r+0x20c>
8001098c:	01042583          	lw	a1,16(s0)
80010990:	000d0613          	mv	a2,s10
80010994:	841fd0ef          	jal	ra,8000e1d4 <memcpy>
80010998:	00c45783          	lhu	a5,12(s0)
8001099c:	b7f7f793          	andi	a5,a5,-1153
800109a0:	0807e793          	ori	a5,a5,128
800109a4:	00f41623          	sh	a5,12(s0)
800109a8:	01342823          	sw	s3,16(s0)
800109ac:	01542a23          	sw	s5,20(s0)
800109b0:	01a989b3          	add	s3,s3,s10
800109b4:	41aa8ab3          	sub	s5,s5,s10
800109b8:	01342023          	sw	s3,0(s0)
800109bc:	00048d93          	mv	s11,s1
800109c0:	01542423          	sw	s5,8(s0)
800109c4:	00048993          	mv	s3,s1
800109c8:	01b4f463          	bgeu	s1,s11,800109d0 <__sfvwrite_r+0x2f0>
800109cc:	00048d93          	mv	s11,s1
800109d0:	00042503          	lw	a0,0(s0)
800109d4:	000d8613          	mv	a2,s11
800109d8:	000b8593          	mv	a1,s7
800109dc:	8d1fd0ef          	jal	ra,8000e2ac <memmove>
800109e0:	00842783          	lw	a5,8(s0)
800109e4:	41b787b3          	sub	a5,a5,s11
800109e8:	00f42423          	sw	a5,8(s0)
800109ec:	00042783          	lw	a5,0(s0)
800109f0:	01b78db3          	add	s11,a5,s11
800109f4:	01b42023          	sw	s11,0(s0)
800109f8:	008b2783          	lw	a5,8(s6)
800109fc:	013b8bb3          	add	s7,s7,s3
80010a00:	413484b3          	sub	s1,s1,s3
80010a04:	413789b3          	sub	s3,a5,s3
80010a08:	013b2423          	sw	s3,8(s6)
80010a0c:	ee0990e3          	bnez	s3,800108ec <__sfvwrite_r+0x20c>
80010a10:	e79ff06f          	j	80010888 <__sfvwrite_r+0x1a8>
80010a14:	000a8613          	mv	a2,s5
80010a18:	00090513          	mv	a0,s2
80010a1c:	18c000ef          	jal	ra,80010ba8 <_realloc_r>
80010a20:	00050993          	mv	s3,a0
80010a24:	f80512e3          	bnez	a0,800109a8 <__sfvwrite_r+0x2c8>
80010a28:	01042583          	lw	a1,16(s0)
80010a2c:	00090513          	mv	a0,s2
80010a30:	92dfd0ef          	jal	ra,8000e35c <_free_r>
80010a34:	00c45783          	lhu	a5,12(s0)
80010a38:	f7f7f793          	andi	a5,a5,-129
80010a3c:	00f41623          	sh	a5,12(s0)
80010a40:	f1dff06f          	j	8001095c <__sfvwrite_r+0x27c>
80010a44:	01042783          	lw	a5,16(s0)
80010a48:	00a7e663          	bltu	a5,a0,80010a54 <__sfvwrite_r+0x374>
80010a4c:	01442983          	lw	s3,20(s0)
80010a50:	0534f663          	bgeu	s1,s3,80010a9c <__sfvwrite_r+0x3bc>
80010a54:	000d8993          	mv	s3,s11
80010a58:	01b4f463          	bgeu	s1,s11,80010a60 <__sfvwrite_r+0x380>
80010a5c:	00048993          	mv	s3,s1
80010a60:	00098613          	mv	a2,s3
80010a64:	000b8593          	mv	a1,s7
80010a68:	845fd0ef          	jal	ra,8000e2ac <memmove>
80010a6c:	00842783          	lw	a5,8(s0)
80010a70:	00042703          	lw	a4,0(s0)
80010a74:	413787b3          	sub	a5,a5,s3
80010a78:	01370733          	add	a4,a4,s3
80010a7c:	00f42423          	sw	a5,8(s0)
80010a80:	00e42023          	sw	a4,0(s0)
80010a84:	f6079ae3          	bnez	a5,800109f8 <__sfvwrite_r+0x318>
80010a88:	00040593          	mv	a1,s0
80010a8c:	00090513          	mv	a0,s2
80010a90:	8e0fd0ef          	jal	ra,8000db70 <_fflush_r>
80010a94:	f60502e3          	beqz	a0,800109f8 <__sfvwrite_r+0x318>
80010a98:	ecdff06f          	j	80010964 <__sfvwrite_r+0x284>
80010a9c:	00048513          	mv	a0,s1
80010aa0:	009cf463          	bgeu	s9,s1,80010aa8 <__sfvwrite_r+0x3c8>
80010aa4:	000c0513          	mv	a0,s8
80010aa8:	00098593          	mv	a1,s3
80010aac:	8a5fc0ef          	jal	ra,8000d350 <__divsi3>
80010ab0:	00098593          	mv	a1,s3
80010ab4:	879fc0ef          	jal	ra,8000d32c <__mulsi3>
80010ab8:	02842783          	lw	a5,40(s0)
80010abc:	02042583          	lw	a1,32(s0)
80010ac0:	00050693          	mv	a3,a0
80010ac4:	000b8613          	mv	a2,s7
80010ac8:	00090513          	mv	a0,s2
80010acc:	000780e7          	jalr	a5
80010ad0:	00050993          	mv	s3,a0
80010ad4:	f2a042e3          	bgtz	a0,800109f8 <__sfvwrite_r+0x318>
80010ad8:	e8dff06f          	j	80010964 <__sfvwrite_r+0x284>
80010adc:	000a2a83          	lw	s5,0(s4)
80010ae0:	004a2983          	lw	s3,4(s4)
80010ae4:	00000513          	li	a0,0
80010ae8:	008a0a13          	addi	s4,s4,8
80010aec:	c89ff06f          	j	80010774 <__sfvwrite_r+0x94>
80010af0:	02dc4263          	blt	s8,a3,80010b14 <__sfvwrite_r+0x434>
80010af4:	02842783          	lw	a5,40(s0)
80010af8:	02042583          	lw	a1,32(s0)
80010afc:	000a8613          	mv	a2,s5
80010b00:	00090513          	mv	a0,s2
80010b04:	000780e7          	jalr	a5
80010b08:	00050493          	mv	s1,a0
80010b0c:	cea040e3          	bgtz	a0,800107ec <__sfvwrite_r+0x10c>
80010b10:	e55ff06f          	j	80010964 <__sfvwrite_r+0x284>
80010b14:	000c0613          	mv	a2,s8
80010b18:	000a8593          	mv	a1,s5
80010b1c:	f90fd0ef          	jal	ra,8000e2ac <memmove>
80010b20:	00842783          	lw	a5,8(s0)
80010b24:	000c0493          	mv	s1,s8
80010b28:	418787b3          	sub	a5,a5,s8
80010b2c:	00f42423          	sw	a5,8(s0)
80010b30:	00042783          	lw	a5,0(s0)
80010b34:	018787b3          	add	a5,a5,s8
80010b38:	00f42023          	sw	a5,0(s0)
80010b3c:	cb1ff06f          	j	800107ec <__sfvwrite_r+0x10c>

Disassembly of section .text._isatty_r:

80010b40 <_isatty_r>:
80010b40:	ff010113          	addi	sp,sp,-16
80010b44:	00812423          	sw	s0,8(sp)
80010b48:	00050413          	mv	s0,a0
80010b4c:	00058513          	mv	a0,a1
80010b50:	c401a623          	sw	zero,-948(gp) # 800034f4 <errno>
80010b54:	00112623          	sw	ra,12(sp)
80010b58:	9c4f50ef          	jal	ra,80005d1c <_isatty>
80010b5c:	fff00793          	li	a5,-1
80010b60:	00f51a63          	bne	a0,a5,80010b74 <_isatty_r+0x34>
80010b64:	c4c18793          	addi	a5,gp,-948 # 800034f4 <errno>
80010b68:	0007a783          	lw	a5,0(a5)
80010b6c:	00078463          	beqz	a5,80010b74 <_isatty_r+0x34>
80010b70:	00f42023          	sw	a5,0(s0)
80010b74:	00c12083          	lw	ra,12(sp)
80010b78:	00812403          	lw	s0,8(sp)
80010b7c:	01010113          	addi	sp,sp,16
80010b80:	00008067          	ret

Disassembly of section .text.memchr:

80010b84 <memchr>:
80010b84:	0ff5f593          	andi	a1,a1,255
80010b88:	00c50633          	add	a2,a0,a2
80010b8c:	00c51663          	bne	a0,a2,80010b98 <memchr+0x14>
80010b90:	00000513          	li	a0,0
80010b94:	00008067          	ret
80010b98:	00054783          	lbu	a5,0(a0)
80010b9c:	feb78ce3          	beq	a5,a1,80010b94 <memchr+0x10>
80010ba0:	00150513          	addi	a0,a0,1
80010ba4:	fe9ff06f          	j	80010b8c <memchr+0x8>

Disassembly of section .text._realloc_r:

80010ba8 <_realloc_r>:
80010ba8:	00059663          	bnez	a1,80010bb4 <_realloc_r+0xc>
80010bac:	00060593          	mv	a1,a2
80010bb0:	8b1fd06f          	j	8000e460 <_malloc_r>
80010bb4:	fe010113          	addi	sp,sp,-32
80010bb8:	00812c23          	sw	s0,24(sp)
80010bbc:	00112e23          	sw	ra,28(sp)
80010bc0:	00912a23          	sw	s1,20(sp)
80010bc4:	01212823          	sw	s2,16(sp)
80010bc8:	01312623          	sw	s3,12(sp)
80010bcc:	00060413          	mv	s0,a2
80010bd0:	02061663          	bnez	a2,80010bfc <_realloc_r+0x54>
80010bd4:	f88fd0ef          	jal	ra,8000e35c <_free_r>
80010bd8:	00000913          	li	s2,0
80010bdc:	01c12083          	lw	ra,28(sp)
80010be0:	01812403          	lw	s0,24(sp)
80010be4:	00090513          	mv	a0,s2
80010be8:	01412483          	lw	s1,20(sp)
80010bec:	01012903          	lw	s2,16(sp)
80010bf0:	00c12983          	lw	s3,12(sp)
80010bf4:	02010113          	addi	sp,sp,32
80010bf8:	00008067          	ret
80010bfc:	00058493          	mv	s1,a1
80010c00:	00050993          	mv	s3,a0
80010c04:	03c000ef          	jal	ra,80010c40 <_malloc_usable_size_r>
80010c08:	00048913          	mv	s2,s1
80010c0c:	fc8578e3          	bgeu	a0,s0,80010bdc <_realloc_r+0x34>
80010c10:	00040593          	mv	a1,s0
80010c14:	00098513          	mv	a0,s3
80010c18:	849fd0ef          	jal	ra,8000e460 <_malloc_r>
80010c1c:	00050913          	mv	s2,a0
80010c20:	fa050ee3          	beqz	a0,80010bdc <_realloc_r+0x34>
80010c24:	00048593          	mv	a1,s1
80010c28:	00040613          	mv	a2,s0
80010c2c:	da8fd0ef          	jal	ra,8000e1d4 <memcpy>
80010c30:	00048593          	mv	a1,s1
80010c34:	00098513          	mv	a0,s3
80010c38:	f24fd0ef          	jal	ra,8000e35c <_free_r>
80010c3c:	fa1ff06f          	j	80010bdc <_realloc_r+0x34>

Disassembly of section .text._malloc_usable_size_r:

80010c40 <_malloc_usable_size_r>:
80010c40:	ffc5a783          	lw	a5,-4(a1)
80010c44:	ffc78513          	addi	a0,a5,-4
80010c48:	0007d863          	bgez	a5,80010c58 <_malloc_usable_size_r+0x18>
80010c4c:	00a585b3          	add	a1,a1,a0
80010c50:	0005a783          	lw	a5,0(a1)
80010c54:	00f50533          	add	a0,a0,a5
80010c58:	00008067          	ret
