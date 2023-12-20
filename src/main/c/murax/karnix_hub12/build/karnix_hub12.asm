
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
80000064:	055030ef          	jal	ra,800038b8 <irqCallback>
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
800000b4:	6e818193          	addi	gp,gp,1768 # 80003798 <__global_pointer$>
800000b8:	00011117          	auipc	sp,0x11
800000bc:	29810113          	addi	sp,sp,664 # 80011350 <_stack_start>

800000c0 <bss_init>:
800000c0:	86018513          	addi	a0,gp,-1952 # 80002ff8 <t2>
800000c4:	c5018593          	addi	a1,gp,-944 # 800033e8 <_bss_end>

800000c8 <bss_loop>:
800000c8:	00b50863          	beq	a0,a1,800000d8 <bss_done>
800000cc:	00052023          	sw	zero,0(a0)
800000d0:	00450513          	addi	a0,a0,4
800000d4:	ff5ff06f          	j	800000c8 <bss_loop>

800000d8 <bss_done>:
800000d8:	00011517          	auipc	a0,0x11
800000dc:	a7450513          	addi	a0,a0,-1420 # 80010b4c <_ctors_end>
800000e0:	ffc10113          	addi	sp,sp,-4

800000e4 <ctors_loop>:
800000e4:	00011597          	auipc	a1,0x11
800000e8:	a6858593          	addi	a1,a1,-1432 # 80010b4c <_ctors_end>
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
80000124:	1d00d0ef          	jal	ra,8000d2f4 <end>

80000128 <infinitLoop>:
80000128:	0000006f          	j	80000128 <infinitLoop>
	...

Disassembly of section .memory:

8000344c <crc16>:
8000344c:	000107b7          	lui	a5,0x10
80003450:	ffffa6b7          	lui	a3,0xffffa
80003454:	00000713          	li	a4,0
80003458:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
8000345c:	00168693          	addi	a3,a3,1 # ffffa001 <_ram_heap_end+0x7ffe8001>
80003460:	00b74663          	blt	a4,a1,8000346c <crc16+0x20>
80003464:	00078513          	mv	a0,a5
80003468:	00008067          	ret
8000346c:	00e50633          	add	a2,a0,a4
80003470:	00064603          	lbu	a2,0(a2)
80003474:	00c7c7b3          	xor	a5,a5,a2
80003478:	00800613          	li	a2,8
8000347c:	0017f813          	andi	a6,a5,1
80003480:	0017d793          	srli	a5,a5,0x1
80003484:	00080863          	beqz	a6,80003494 <crc16+0x48>
80003488:	00d7c7b3          	xor	a5,a5,a3
8000348c:	01079793          	slli	a5,a5,0x10
80003490:	0107d793          	srli	a5,a5,0x10
80003494:	fff60613          	addi	a2,a2,-1
80003498:	fe0612e3          	bnez	a2,8000347c <crc16+0x30>
8000349c:	00170713          	addi	a4,a4,1
800034a0:	fc1ff06f          	j	80003460 <crc16+0x14>

800034a4 <add_crc>:
800034a4:	ff010113          	addi	sp,sp,-16
800034a8:	00812423          	sw	s0,8(sp)
800034ac:	00912223          	sw	s1,4(sp)
800034b0:	00112623          	sw	ra,12(sp)
800034b4:	00050413          	mv	s0,a0
800034b8:	00058493          	mv	s1,a1
800034bc:	f91ff0ef          	jal	ra,8000344c <crc16>
800034c0:	009405b3          	add	a1,s0,s1
800034c4:	00a58023          	sb	a0,0(a1)
800034c8:	00855513          	srli	a0,a0,0x8
800034cc:	00a580a3          	sb	a0,1(a1)
800034d0:	00c12083          	lw	ra,12(sp)
800034d4:	00812403          	lw	s0,8(sp)
800034d8:	00412483          	lw	s1,4(sp)
800034dc:	01010113          	addi	sp,sp,16
800034e0:	00008067          	ret

800034e4 <println>:
800034e4:	ff010113          	addi	sp,sp,-16
800034e8:	00112623          	sw	ra,12(sp)
800034ec:	600020ef          	jal	ra,80005aec <print_uart0>
800034f0:	00c12083          	lw	ra,12(sp)
800034f4:	80002537          	lui	a0,0x80002
800034f8:	7f050513          	addi	a0,a0,2032 # 800027f0 <_ram_heap_end+0xffff07f0>
800034fc:	01010113          	addi	sp,sp,16
80003500:	5ec0206f          	j	80005aec <print_uart0>

80003504 <to_hex_nibble>:
80003504:	00f57513          	andi	a0,a0,15
80003508:	00900793          	li	a5,9
8000350c:	00a7f663          	bgeu	a5,a0,80003518 <to_hex_nibble+0x14>
80003510:	03750513          	addi	a0,a0,55
80003514:	00008067          	ret
80003518:	03050513          	addi	a0,a0,48
8000351c:	00008067          	ret

80003520 <to_hex>:
80003520:	fd010113          	addi	sp,sp,-48
80003524:	02812423          	sw	s0,40(sp)
80003528:	02912223          	sw	s1,36(sp)
8000352c:	03212023          	sw	s2,32(sp)
80003530:	01312e23          	sw	s3,28(sp)
80003534:	02112623          	sw	ra,44(sp)
80003538:	00050913          	mv	s2,a0
8000353c:	00050493          	mv	s1,a0
80003540:	01c00413          	li	s0,28
80003544:	ffc00993          	li	s3,-4
80003548:	0085d533          	srl	a0,a1,s0
8000354c:	0ff57513          	andi	a0,a0,255
80003550:	00b12623          	sw	a1,12(sp)
80003554:	fb1ff0ef          	jal	ra,80003504 <to_hex_nibble>
80003558:	00a48023          	sb	a0,0(s1)
8000355c:	ffc40413          	addi	s0,s0,-4
80003560:	00148493          	addi	s1,s1,1
80003564:	00c12583          	lw	a1,12(sp)
80003568:	ff3410e3          	bne	s0,s3,80003548 <to_hex+0x28>
8000356c:	02c12083          	lw	ra,44(sp)
80003570:	02812403          	lw	s0,40(sp)
80003574:	00090423          	sb	zero,8(s2)
80003578:	02412483          	lw	s1,36(sp)
8000357c:	02012903          	lw	s2,32(sp)
80003580:	01c12983          	lw	s3,28(sp)
80003584:	03010113          	addi	sp,sp,48
80003588:	00008067          	ret

8000358c <process_and_wait>:
8000358c:	fe010113          	addi	sp,sp,-32
80003590:	00812c23          	sw	s0,24(sp)
80003594:	00912a23          	sw	s1,20(sp)
80003598:	01412423          	sw	s4,8(sp)
8000359c:	01512223          	sw	s5,4(sp)
800035a0:	00112e23          	sw	ra,28(sp)
800035a4:	01212823          	sw	s2,16(sp)
800035a8:	01312623          	sw	s3,12(sp)
800035ac:	f00b07b7          	lui	a5,0xf00b0
800035b0:	0007a903          	lw	s2,0(a5) # f00b0000 <_ram_heap_end+0x7009e000>
800035b4:	0047a983          	lw	s3,4(a5)
800035b8:	00050a13          	mv	s4,a0
800035bc:	f00b0ab7          	lui	s5,0xf00b0
800035c0:	000aa783          	lw	a5,0(s5) # f00b0000 <_ram_heap_end+0x7009e000>
800035c4:	004aa803          	lw	a6,4(s5)
800035c8:	412786b3          	sub	a3,a5,s2
800035cc:	00d7b733          	sltu	a4,a5,a3
800035d0:	413807b3          	sub	a5,a6,s3
800035d4:	02e79663          	bne	a5,a4,80003600 <process_and_wait+0x74>
800035d8:	0346f463          	bgeu	a3,s4,80003600 <process_and_wait+0x74>
800035dc:	8741a783          	lw	a5,-1932(gp) # 8000300c <events_modbus_rtu_poll>
800035e0:	00078663          	beqz	a5,800035ec <process_and_wait+0x60>
800035e4:	398000ef          	jal	ra,8000397c <modbus_rtu_poll>
800035e8:	8601aa23          	sw	zero,-1932(gp) # 8000300c <events_modbus_rtu_poll>
800035ec:	8781a783          	lw	a5,-1928(gp) # 80003010 <events_mac_poll>
800035f0:	fc0788e3          	beqz	a5,800035c0 <process_and_wait+0x34>
800035f4:	3b5010ef          	jal	ra,800051a8 <mac_poll>
800035f8:	8601ac23          	sw	zero,-1928(gp) # 80003010 <events_mac_poll>
800035fc:	fc5ff06f          	j	800035c0 <process_and_wait+0x34>
80003600:	01c12083          	lw	ra,28(sp)
80003604:	01812403          	lw	s0,24(sp)
80003608:	01412483          	lw	s1,20(sp)
8000360c:	01012903          	lw	s2,16(sp)
80003610:	00c12983          	lw	s3,12(sp)
80003614:	00812a03          	lw	s4,8(sp)
80003618:	00412a83          	lw	s5,4(sp)
8000361c:	02010113          	addi	sp,sp,32
80003620:	00008067          	ret

80003624 <sram_test_write_random_ints>:
80003624:	80002537          	lui	a0,0x80002
80003628:	fe010113          	addi	sp,sp,-32
8000362c:	00080637          	lui	a2,0x80
80003630:	900005b7          	lui	a1,0x90000
80003634:	f3450513          	addi	a0,a0,-204 # 80001f34 <_ram_heap_end+0xfffeff34>
80003638:	00112e23          	sw	ra,28(sp)
8000363c:	00812c23          	sw	s0,24(sp)
80003640:	00912a23          	sw	s1,20(sp)
80003644:	01212823          	sw	s2,16(sp)
80003648:	01312623          	sw	s3,12(sp)
8000364c:	01412423          	sw	s4,8(sp)
80003650:	6b50a0ef          	jal	ra,8000e504 <iprintf>
80003654:	deadc7b7          	lui	a5,0xdeadc
80003658:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac9eef>
8000365c:	90000737          	lui	a4,0x90000
80003660:	900806b7          	lui	a3,0x90080
80003664:	00f72023          	sw	a5,0(a4) # 90000000 <_ram_heap_end+0xffee000>
80003668:	00470713          	addi	a4,a4,4
8000366c:	00179793          	slli	a5,a5,0x1
80003670:	fed71ae3          	bne	a4,a3,80003664 <sram_test_write_random_ints+0x40>
80003674:	80002537          	lui	a0,0x80002
80003678:	00080637          	lui	a2,0x80
8000367c:	900005b7          	lui	a1,0x90000
80003680:	f6050513          	addi	a0,a0,-160 # 80001f60 <_ram_heap_end+0xfffeff60>
80003684:	deadc4b7          	lui	s1,0xdeadc
80003688:	67d0a0ef          	jal	ra,8000e504 <iprintf>
8000368c:	00000913          	li	s2,0
80003690:	eef48493          	addi	s1,s1,-273 # deadbeef <_ram_heap_end+0x5eac9eef>
80003694:	90000437          	lui	s0,0x90000
80003698:	80002a37          	lui	s4,0x80002
8000369c:	900809b7          	lui	s3,0x90080
800036a0:	00042783          	lw	a5,0(s0) # 90000000 <_ram_heap_end+0xffee000>
800036a4:	00978e63          	beq	a5,s1,800036c0 <sram_test_write_random_ints+0x9c>
800036a8:	00042683          	lw	a3,0(s0)
800036ac:	00048613          	mv	a2,s1
800036b0:	00040593          	mv	a1,s0
800036b4:	f8ca0513          	addi	a0,s4,-116 # 80001f8c <_ram_heap_end+0xfffeff8c>
800036b8:	64d0a0ef          	jal	ra,8000e504 <iprintf>
800036bc:	00190913          	addi	s2,s2,1
800036c0:	00440413          	addi	s0,s0,4
800036c4:	00149493          	slli	s1,s1,0x1
800036c8:	fd341ce3          	bne	s0,s3,800036a0 <sram_test_write_random_ints+0x7c>
800036cc:	80002537          	lui	a0,0x80002
800036d0:	00090593          	mv	a1,s2
800036d4:	fc050513          	addi	a0,a0,-64 # 80001fc0 <_ram_heap_end+0xfffeffc0>
800036d8:	62d0a0ef          	jal	ra,8000e504 <iprintf>
800036dc:	01c12083          	lw	ra,28(sp)
800036e0:	01812403          	lw	s0,24(sp)
800036e4:	00090513          	mv	a0,s2
800036e8:	01412483          	lw	s1,20(sp)
800036ec:	01012903          	lw	s2,16(sp)
800036f0:	00c12983          	lw	s3,12(sp)
800036f4:	00812a03          	lw	s4,8(sp)
800036f8:	02010113          	addi	sp,sp,32
800036fc:	00008067          	ret

80003700 <timerInterrupt>:
80003700:	00008067          	ret

80003704 <externalInterrupt>:
80003704:	ff010113          	addi	sp,sp,-16
80003708:	00112623          	sw	ra,12(sp)
8000370c:	00812423          	sw	s0,8(sp)
80003710:	f00607b7          	lui	a5,0xf0060
80003714:	0047a783          	lw	a5,4(a5) # f0060004 <_ram_heap_end+0x7004e004>
80003718:	0017f793          	andi	a5,a5,1
8000371c:	02078c63          	beqz	a5,80003754 <externalInterrupt+0x50>
80003720:	f0000737          	lui	a4,0xf0000
80003724:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
80003728:	02a00593          	li	a1,42
8000372c:	0027e793          	ori	a5,a5,2
80003730:	00f72223          	sw	a5,4(a4)
80003734:	f0010737          	lui	a4,0xf0010
80003738:	00472783          	lw	a5,4(a4) # f0010004 <_ram_heap_end+0x6fffe004>
8000373c:	0187d793          	srli	a5,a5,0x18
80003740:	0e079c63          	bnez	a5,80003838 <__global_pointer$+0xa0>
80003744:	f0060737          	lui	a4,0xf0060
80003748:	00472783          	lw	a5,4(a4) # f0060004 <_ram_heap_end+0x7004e004>
8000374c:	ffe7f793          	andi	a5,a5,-2
80003750:	00f72223          	sw	a5,4(a4)
80003754:	f0060437          	lui	s0,0xf0060
80003758:	00442783          	lw	a5,4(s0) # f0060004 <_ram_heap_end+0x7004e004>
8000375c:	0027f793          	andi	a5,a5,2
80003760:	00078a63          	beqz	a5,80003774 <externalInterrupt+0x70>
80003764:	2dc000ef          	jal	ra,80003a40 <modbus_rtu_isr>
80003768:	00442783          	lw	a5,4(s0)
8000376c:	ffd7f793          	andi	a5,a5,-3
80003770:	00f42223          	sw	a5,4(s0)
80003774:	f0060437          	lui	s0,0xf0060
80003778:	00442783          	lw	a5,4(s0) # f0060004 <_ram_heap_end+0x7004e004>
8000377c:	0047f793          	andi	a5,a5,4
80003780:	00078a63          	beqz	a5,80003794 <externalInterrupt+0x90>
80003784:	754010ef          	jal	ra,80004ed8 <mac_rx_isr>
80003788:	00442783          	lw	a5,4(s0)
8000378c:	ffb7f793          	andi	a5,a5,-5
80003790:	00f42223          	sw	a5,4(s0)
80003794:	f00607b7          	lui	a5,0xf0060
80003798:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x7004e004>
8000379c:	00877713          	andi	a4,a4,8
800037a0:	02070863          	beqz	a4,800037d0 <__global_pointer$+0x38>
800037a4:	f0020737          	lui	a4,0xf0020
800037a8:	000186b7          	lui	a3,0x18
800037ac:	00072623          	sw	zero,12(a4) # f002000c <_ram_heap_end+0x7000e00c>
800037b0:	6a068693          	addi	a3,a3,1696 # 186a0 <_stack_size+0x17ea0>
800037b4:	00d72823          	sw	a3,16(a4)
800037b8:	00100693          	li	a3,1
800037bc:	00d72023          	sw	a3,0(a4)
800037c0:	86d1ac23          	sw	a3,-1928(gp) # 80003010 <events_mac_poll>
800037c4:	0047a703          	lw	a4,4(a5)
800037c8:	ff777713          	andi	a4,a4,-9
800037cc:	00e7a223          	sw	a4,4(a5)
800037d0:	f00607b7          	lui	a5,0xf0060
800037d4:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x7004e004>
800037d8:	01077713          	andi	a4,a4,16
800037dc:	02070863          	beqz	a4,8000380c <__global_pointer$+0x74>
800037e0:	f0021737          	lui	a4,0xf0021
800037e4:	0000c6b7          	lui	a3,0xc
800037e8:	00072623          	sw	zero,12(a4) # f002100c <_ram_heap_end+0x7000f00c>
800037ec:	35068693          	addi	a3,a3,848 # c350 <_stack_size+0xbb50>
800037f0:	00d72823          	sw	a3,16(a4)
800037f4:	00100693          	li	a3,1
800037f8:	00d72023          	sw	a3,0(a4)
800037fc:	86d1aa23          	sw	a3,-1932(gp) # 8000300c <events_modbus_rtu_poll>
80003800:	0047a703          	lw	a4,4(a5)
80003804:	fef77713          	andi	a4,a4,-17
80003808:	00e7a223          	sw	a4,4(a5)
8000380c:	f00607b7          	lui	a5,0xf0060
80003810:	0047a703          	lw	a4,4(a5) # f0060004 <_ram_heap_end+0x7004e004>
80003814:	02077713          	andi	a4,a4,32
80003818:	00070863          	beqz	a4,80003828 <__global_pointer$+0x90>
8000381c:	0047a703          	lw	a4,4(a5)
80003820:	fdf77713          	andi	a4,a4,-33
80003824:	00e7a223          	sw	a4,4(a5)
80003828:	00c12083          	lw	ra,12(sp)
8000382c:	00812403          	lw	s0,8(sp)
80003830:	01010113          	addi	sp,sp,16
80003834:	00008067          	ret
80003838:	00072783          	lw	a5,0(a4)
8000383c:	0ff7f513          	andi	a0,a5,255
80003840:	0ff7f693          	andi	a3,a5,255
80003844:	00472783          	lw	a5,4(a4)
80003848:	0107d793          	srli	a5,a5,0x10
8000384c:	0ff7f793          	andi	a5,a5,255
80003850:	fe078ae3          	beqz	a5,80003844 <__global_pointer$+0xac>
80003854:	00d72023          	sw	a3,0(a4)
80003858:	00b51a63          	bne	a0,a1,8000386c <__global_pointer$+0xd4>
8000385c:	87c1a783          	lw	a5,-1924(gp) # 80003014 <uart_config_reset_counter>
80003860:	00178793          	addi	a5,a5,1
80003864:	86f1ae23          	sw	a5,-1924(gp) # 80003014 <uart_config_reset_counter>
80003868:	ed1ff06f          	j	80003738 <externalInterrupt+0x34>
8000386c:	8601ae23          	sw	zero,-1924(gp) # 80003014 <uart_config_reset_counter>
80003870:	ec9ff06f          	j	80003738 <externalInterrupt+0x34>

80003874 <crash>:
80003874:	ff010113          	addi	sp,sp,-16
80003878:	00812423          	sw	s0,8(sp)
8000387c:	00050593          	mv	a1,a0
80003880:	90418513          	addi	a0,gp,-1788 # 8000309c <crash_str>
80003884:	00112623          	sw	ra,12(sp)
80003888:	c99ff0ef          	jal	ra,80003520 <to_hex>
8000388c:	80002537          	lui	a0,0x80002
80003890:	28c50513          	addi	a0,a0,652 # 8000228c <_ram_heap_end+0xffff028c>
80003894:	258020ef          	jal	ra,80005aec <print_uart0>
80003898:	90418513          	addi	a0,gp,-1788 # 8000309c <crash_str>
8000389c:	250020ef          	jal	ra,80005aec <print_uart0>
800038a0:	00812403          	lw	s0,8(sp)
800038a4:	00c12083          	lw	ra,12(sp)
800038a8:	80002537          	lui	a0,0x80002
800038ac:	7f050513          	addi	a0,a0,2032 # 800027f0 <_ram_heap_end+0xffff07f0>
800038b0:	01010113          	addi	sp,sp,16
800038b4:	2380206f          	j	80005aec <print_uart0>

800038b8 <irqCallback>:
800038b8:	88c1a783          	lw	a5,-1908(gp) # 80003024 <reg_irq_counter>
800038bc:	00178793          	addi	a5,a5,1
800038c0:	88f1a623          	sw	a5,-1908(gp) # 80003024 <reg_irq_counter>
800038c4:	342027f3          	csrr	a5,mcause
800038c8:	0207d263          	bgez	a5,800038ec <irqCallback+0x34>
800038cc:	00f7f793          	andi	a5,a5,15
800038d0:	00700713          	li	a4,7
800038d4:	02e78063          	beq	a5,a4,800038f4 <irqCallback+0x3c>
800038d8:	00b00713          	li	a4,11
800038dc:	00e79463          	bne	a5,a4,800038e4 <irqCallback+0x2c>
800038e0:	e25ff06f          	j	80003704 <externalInterrupt>
800038e4:	00200513          	li	a0,2
800038e8:	f8dff06f          	j	80003874 <crash>
800038ec:	00100513          	li	a0,1
800038f0:	ff9ff06f          	j	800038e8 <irqCallback+0x30>
800038f4:	00008067          	ret

800038f8 <modbus_rtu_init>:
800038f8:	fe010113          	addi	sp,sp,-32
800038fc:	00112e23          	sw	ra,28(sp)
80003900:	00812c23          	sw	s0,24(sp)
80003904:	f0011437          	lui	s0,0xf0011
80003908:	00842783          	lw	a5,8(s0) # f0011008 <_ram_heap_end+0x6ffff008>
8000390c:	9ac1a583          	lw	a1,-1620(gp) # 80003144 <active_config+0x18>
80003910:	017d8537          	lui	a0,0x17d8
80003914:	84050513          	addi	a0,a0,-1984 # 17d7840 <_stack_size+0x17d7040>
80003918:	00f12623          	sw	a5,12(sp)
8000391c:	12d090ef          	jal	ra,8000d248 <__udivsi3>
80003920:	00500593          	li	a1,5
80003924:	125090ef          	jal	ra,8000d248 <__udivsi3>
80003928:	fff50713          	addi	a4,a0,-1
8000392c:	00e42423          	sw	a4,8(s0)
80003930:	00600693          	li	a3,6
80003934:	00d42623          	sw	a3,12(s0)
80003938:	00c12783          	lw	a5,12(sp)
8000393c:	80002537          	lui	a0,0x80002
80003940:	00000693          	li	a3,0
80003944:	00000613          	li	a2,0
80003948:	00700593          	li	a1,7
8000394c:	29c50513          	addi	a0,a0,668 # 8000229c <_ram_heap_end+0xffff029c>
80003950:	3b50a0ef          	jal	ra,8000e504 <iprintf>
80003954:	f00b07b7          	lui	a5,0xf00b0
80003958:	0007a603          	lw	a2,0(a5) # f00b0000 <_ram_heap_end+0x7009e000>
8000395c:	0047a683          	lw	a3,4(a5)
80003960:	88c1a823          	sw	a2,-1904(gp) # 80003028 <modbus_rtu_rx_timestamp>
80003964:	01c12083          	lw	ra,28(sp)
80003968:	01812403          	lw	s0,24(sp)
8000396c:	88d1aa23          	sw	a3,-1900(gp) # 8000302c <modbus_rtu_rx_timestamp+0x4>
80003970:	8801ac23          	sw	zero,-1896(gp) # 80003030 <modbus_rtu_rx_len>
80003974:	02010113          	addi	sp,sp,32
80003978:	00008067          	ret

8000397c <modbus_rtu_poll>:
8000397c:	ef010113          	addi	sp,sp,-272
80003980:	10812423          	sw	s0,264(sp)
80003984:	8981a783          	lw	a5,-1896(gp) # 80003030 <modbus_rtu_rx_len>
80003988:	10112623          	sw	ra,268(sp)
8000398c:	10912223          	sw	s1,260(sp)
80003990:	08078e63          	beqz	a5,80003a2c <modbus_rtu_poll+0xb0>
80003994:	f00b07b7          	lui	a5,0xf00b0
80003998:	0047a803          	lw	a6,4(a5) # f00b0004 <_ram_heap_end+0x7009e004>
8000399c:	0007a783          	lw	a5,0(a5)
800039a0:	8901a503          	lw	a0,-1904(gp) # 80003028 <modbus_rtu_rx_timestamp>
800039a4:	8941a583          	lw	a1,-1900(gp) # 8000302c <modbus_rtu_rx_timestamp+0x4>
800039a8:	40a786b3          	sub	a3,a5,a0
800039ac:	00d7b733          	sltu	a4,a5,a3
800039b0:	40b807b3          	sub	a5,a6,a1
800039b4:	00e79863          	bne	a5,a4,800039c4 <modbus_rtu_poll+0x48>
800039b8:	000027b7          	lui	a5,0x2
800039bc:	70f78793          	addi	a5,a5,1807 # 270f <_stack_size+0x1f0f>
800039c0:	06d7f663          	bgeu	a5,a3,80003a2c <modbus_rtu_poll+0xb0>
800039c4:	8981a483          	lw	s1,-1896(gp) # 80003030 <modbus_rtu_rx_len>
800039c8:	08000793          	li	a5,128
800039cc:	00048613          	mv	a2,s1
800039d0:	0097f463          	bgeu	a5,s1,800039d8 <modbus_rtu_poll+0x5c>
800039d4:	08000613          	li	a2,128
800039d8:	91418593          	addi	a1,gp,-1772 # 800030ac <modbus_rtu_rx_buf>
800039dc:	00010513          	mv	a0,sp
800039e0:	6e40a0ef          	jal	ra,8000e0c4 <memcpy>
800039e4:	08010613          	addi	a2,sp,128
800039e8:	00048593          	mv	a1,s1
800039ec:	00010513          	mv	a0,sp
800039f0:	8801ac23          	sw	zero,-1896(gp) # 80003030 <modbus_rtu_rx_len>
800039f4:	5a9000ef          	jal	ra,8000479c <modbus_recv>
800039f8:	02050a63          	beqz	a0,80003a2c <modbus_rtu_poll+0xb0>
800039fc:	00000713          	li	a4,0
80003a00:	f00116b7          	lui	a3,0xf0011
80003a04:	08010793          	addi	a5,sp,128
80003a08:	00e787b3          	add	a5,a5,a4
80003a0c:	0007c603          	lbu	a2,0(a5)
80003a10:	0046a783          	lw	a5,4(a3) # f0011004 <_ram_heap_end+0x6ffff004>
80003a14:	0107d793          	srli	a5,a5,0x10
80003a18:	0ff7f793          	andi	a5,a5,255
80003a1c:	fe078ae3          	beqz	a5,80003a10 <modbus_rtu_poll+0x94>
80003a20:	00c6a023          	sw	a2,0(a3)
80003a24:	00170713          	addi	a4,a4,1
80003a28:	fce51ee3          	bne	a0,a4,80003a04 <modbus_rtu_poll+0x88>
80003a2c:	10c12083          	lw	ra,268(sp)
80003a30:	10812403          	lw	s0,264(sp)
80003a34:	10412483          	lw	s1,260(sp)
80003a38:	11010113          	addi	sp,sp,272
80003a3c:	00008067          	ret

80003a40 <modbus_rtu_isr>:
80003a40:	f7010113          	addi	sp,sp,-144
80003a44:	08812423          	sw	s0,136(sp)
80003a48:	08912223          	sw	s1,132(sp)
80003a4c:	08112623          	sw	ra,140(sp)
80003a50:	f00117b7          	lui	a5,0xf0011
80003a54:	0007a683          	lw	a3,0(a5) # f0011000 <_ram_heap_end+0x6ffff000>
80003a58:	8981a603          	lw	a2,-1896(gp) # 80003030 <modbus_rtu_rx_len>
80003a5c:	0ff6f693          	andi	a3,a3,255
80003a60:	00160793          	addi	a5,a2,1 # 80001 <_stack_size+0x7f801>
80003a64:	88f1ac23          	sw	a5,-1896(gp) # 80003030 <modbus_rtu_rx_len>
80003a68:	91418713          	addi	a4,gp,-1772 # 800030ac <modbus_rtu_rx_buf>
80003a6c:	00c70733          	add	a4,a4,a2
80003a70:	00d70023          	sb	a3,0(a4)
80003a74:	8981a683          	lw	a3,-1896(gp) # 80003030 <modbus_rtu_rx_len>
80003a78:	07f00713          	li	a4,127
80003a7c:	91418493          	addi	s1,gp,-1772 # 800030ac <modbus_rtu_rx_buf>
80003a80:	00d77463          	bgeu	a4,a3,80003a88 <modbus_rtu_isr+0x48>
80003a84:	8801ac23          	sw	zero,-1896(gp) # 80003030 <modbus_rtu_rx_len>
80003a88:	f0011737          	lui	a4,0xf0011
80003a8c:	00472783          	lw	a5,4(a4) # f0011004 <_ram_heap_end+0x6ffff004>
80003a90:	0187d793          	srli	a5,a5,0x18
80003a94:	04078063          	beqz	a5,80003ad4 <modbus_rtu_isr+0x94>
80003a98:	00472683          	lw	a3,4(a4)
80003a9c:	8981a703          	lw	a4,-1896(gp) # 80003030 <modbus_rtu_rx_len>
80003aa0:	80002637          	lui	a2,0x80002
80003aa4:	0186d693          	srli	a3,a3,0x18
80003aa8:	2fc60613          	addi	a2,a2,764 # 800022fc <_ram_heap_end+0xffff02fc>
80003aac:	08000593          	li	a1,128
80003ab0:	00010513          	mv	a0,sp
80003ab4:	5210a0ef          	jal	ra,8000e7d4 <sniprintf>
80003ab8:	00010513          	mv	a0,sp
80003abc:	030020ef          	jal	ra,80005aec <print_uart0>
80003ac0:	f00116b7          	lui	a3,0xf0011
80003ac4:	07f00613          	li	a2,127
80003ac8:	0046a783          	lw	a5,4(a3) # f0011004 <_ram_heap_end+0x6ffff004>
80003acc:	0187d793          	srli	a5,a5,0x18
80003ad0:	02079663          	bnez	a5,80003afc <modbus_rtu_isr+0xbc>
80003ad4:	f00b07b7          	lui	a5,0xf00b0
80003ad8:	0007a603          	lw	a2,0(a5) # f00b0000 <_ram_heap_end+0x7009e000>
80003adc:	0047a683          	lw	a3,4(a5)
80003ae0:	08c12083          	lw	ra,140(sp)
80003ae4:	08812403          	lw	s0,136(sp)
80003ae8:	88c1a823          	sw	a2,-1904(gp) # 80003028 <modbus_rtu_rx_timestamp>
80003aec:	88d1aa23          	sw	a3,-1900(gp) # 8000302c <modbus_rtu_rx_timestamp+0x4>
80003af0:	08412483          	lw	s1,132(sp)
80003af4:	09010113          	addi	sp,sp,144
80003af8:	00008067          	ret
80003afc:	0006a703          	lw	a4,0(a3)
80003b00:	8981a783          	lw	a5,-1896(gp) # 80003030 <modbus_rtu_rx_len>
80003b04:	0ff77713          	andi	a4,a4,255
80003b08:	00178593          	addi	a1,a5,1
80003b0c:	88b1ac23          	sw	a1,-1896(gp) # 80003030 <modbus_rtu_rx_len>
80003b10:	00f487b3          	add	a5,s1,a5
80003b14:	00e78023          	sb	a4,0(a5)
80003b18:	8981a783          	lw	a5,-1896(gp) # 80003030 <modbus_rtu_rx_len>
80003b1c:	faf676e3          	bgeu	a2,a5,80003ac8 <modbus_rtu_isr+0x88>
80003b20:	8801ac23          	sw	zero,-1896(gp) # 80003030 <modbus_rtu_rx_len>
80003b24:	fa5ff06f          	j	80003ac8 <modbus_rtu_isr+0x88>

80003b28 <config_load>:
80003b28:	0c050863          	beqz	a0,80003bf8 <config_load+0xd0>
80003b2c:	fe010113          	addi	sp,sp,-32
80003b30:	00812c23          	sw	s0,24(sp)
80003b34:	00912a23          	sw	s1,20(sp)
80003b38:	01212823          	sw	s2,16(sp)
80003b3c:	01312623          	sw	s3,12(sp)
80003b40:	00112e23          	sw	ra,28(sp)
80003b44:	00050413          	mv	s0,a0
80003b48:	00050913          	mv	s2,a0
80003b4c:	00000493          	li	s1,0
80003b50:	02000993          	li	s3,32
80003b54:	00090713          	mv	a4,s2
80003b58:	00400693          	li	a3,4
80003b5c:	00048613          	mv	a2,s1
80003b60:	05000593          	li	a1,80
80003b64:	f0090537          	lui	a0,0xf0090
80003b68:	3fc000ef          	jal	ra,80003f64 <eeprom_read_page>
80003b6c:	00400793          	li	a5,4
80003b70:	02f50a63          	beq	a0,a5,80003ba4 <config_load+0x7c>
80003b74:	80002537          	lui	a0,0x80002
80003b78:	00400593          	li	a1,4
80003b7c:	33450513          	addi	a0,a0,820 # 80002334 <_ram_heap_end+0xffff0334>
80003b80:	1850a0ef          	jal	ra,8000e504 <iprintf>
80003b84:	ffe00513          	li	a0,-2
80003b88:	01c12083          	lw	ra,28(sp)
80003b8c:	01812403          	lw	s0,24(sp)
80003b90:	01412483          	lw	s1,20(sp)
80003b94:	01012903          	lw	s2,16(sp)
80003b98:	00c12983          	lw	s3,12(sp)
80003b9c:	02010113          	addi	sp,sp,32
80003ba0:	00008067          	ret
80003ba4:	00448493          	addi	s1,s1,4
80003ba8:	0ff4f493          	andi	s1,s1,255
80003bac:	00490913          	addi	s2,s2,4
80003bb0:	fb3492e3          	bne	s1,s3,80003b54 <config_load+0x2c>
80003bb4:	01e00593          	li	a1,30
80003bb8:	00040513          	mv	a0,s0
80003bbc:	891ff0ef          	jal	ra,8000344c <crc16>
80003bc0:	01e45603          	lhu	a2,30(s0)
80003bc4:	00050593          	mv	a1,a0
80003bc8:	00a60c63          	beq	a2,a0,80003be0 <config_load+0xb8>
80003bcc:	80002537          	lui	a0,0x80002
80003bd0:	36850513          	addi	a0,a0,872 # 80002368 <_ram_heap_end+0xffff0368>
80003bd4:	1310a0ef          	jal	ra,8000e504 <iprintf>
80003bd8:	ffd00513          	li	a0,-3
80003bdc:	fadff06f          	j	80003b88 <config_load+0x60>
80003be0:	80002537          	lui	a0,0x80002
80003be4:	02000593          	li	a1,32
80003be8:	39c50513          	addi	a0,a0,924 # 8000239c <_ram_heap_end+0xffff039c>
80003bec:	1190a0ef          	jal	ra,8000e504 <iprintf>
80003bf0:	00000513          	li	a0,0
80003bf4:	f95ff06f          	j	80003b88 <config_load+0x60>
80003bf8:	fff00513          	li	a0,-1
80003bfc:	00008067          	ret

80003c00 <config_save>:
80003c00:	fe010113          	addi	sp,sp,-32
80003c04:	00912a23          	sw	s1,20(sp)
80003c08:	00112e23          	sw	ra,28(sp)
80003c0c:	00812c23          	sw	s0,24(sp)
80003c10:	01212823          	sw	s2,16(sp)
80003c14:	01312623          	sw	s3,12(sp)
80003c18:	01412423          	sw	s4,8(sp)
80003c1c:	01512223          	sw	s5,4(sp)
80003c20:	fff00493          	li	s1,-1
80003c24:	06050063          	beqz	a0,80003c84 <config_save+0x84>
80003c28:	01e00593          	li	a1,30
80003c2c:	00050413          	mv	s0,a0
80003c30:	81dff0ef          	jal	ra,8000344c <crc16>
80003c34:	00a41f23          	sh	a0,30(s0)
80003c38:	00000913          	li	s2,0
80003c3c:	00000993          	li	s3,0
80003c40:	00800a93          	li	s5,8
80003c44:	01240733          	add	a4,s0,s2
80003c48:	00400693          	li	a3,4
80003c4c:	0ff97613          	andi	a2,s2,255
80003c50:	05000593          	li	a1,80
80003c54:	f0090537          	lui	a0,0xf0090
80003c58:	0b8000ef          	jal	ra,80003d10 <eeprom_write_page>
80003c5c:	00400793          	li	a5,4
80003c60:	04f50663          	beq	a0,a5,80003cac <config_save+0xac>
80003c64:	80002537          	lui	a0,0x80002
80003c68:	00090713          	mv	a4,s2
80003c6c:	00098693          	mv	a3,s3
80003c70:	00400613          	li	a2,4
80003c74:	05000593          	li	a1,80
80003c78:	3d450513          	addi	a0,a0,980 # 800023d4 <_ram_heap_end+0xffff03d4>
80003c7c:	0890a0ef          	jal	ra,8000e504 <iprintf>
80003c80:	ffe00493          	li	s1,-2
80003c84:	01c12083          	lw	ra,28(sp)
80003c88:	01812403          	lw	s0,24(sp)
80003c8c:	00048513          	mv	a0,s1
80003c90:	01012903          	lw	s2,16(sp)
80003c94:	01412483          	lw	s1,20(sp)
80003c98:	00c12983          	lw	s3,12(sp)
80003c9c:	00812a03          	lw	s4,8(sp)
80003ca0:	00412a83          	lw	s5,4(sp)
80003ca4:	02010113          	addi	sp,sp,32
80003ca8:	00008067          	ret
80003cac:	00a00a13          	li	s4,10
80003cb0:	05000593          	li	a1,80
80003cb4:	f0090537          	lui	a0,0xf0090
80003cb8:	228000ef          	jal	ra,80003ee0 <eeprom_poll>
80003cbc:	00050493          	mv	s1,a0
80003cc0:	02050663          	beqz	a0,80003cec <config_save+0xec>
80003cc4:	3e800513          	li	a0,1000
80003cc8:	fffa0a13          	addi	s4,s4,-1
80003ccc:	5f1010ef          	jal	ra,80005abc <delay_us>
80003cd0:	fe0a10e3          	bnez	s4,80003cb0 <config_save+0xb0>
80003cd4:	80002537          	lui	a0,0x80002
80003cd8:	05000593          	li	a1,80
80003cdc:	45450513          	addi	a0,a0,1108 # 80002454 <_ram_heap_end+0xffff0454>
80003ce0:	0250a0ef          	jal	ra,8000e504 <iprintf>
80003ce4:	ffd00493          	li	s1,-3
80003ce8:	f9dff06f          	j	80003c84 <config_save+0x84>
80003cec:	00198993          	addi	s3,s3,1 # 90080001 <_ram_heap_end+0x1006e001>
80003cf0:	00490913          	addi	s2,s2,4
80003cf4:	f55998e3          	bne	s3,s5,80003c44 <config_save+0x44>
80003cf8:	01e45603          	lhu	a2,30(s0)
80003cfc:	80002537          	lui	a0,0x80002
80003d00:	02000593          	li	a1,32
80003d04:	41c50513          	addi	a0,a0,1052 # 8000241c <_ram_heap_end+0xffff041c>
80003d08:	7fc0a0ef          	jal	ra,8000e504 <iprintf>
80003d0c:	f79ff06f          	j	80003c84 <config_save+0x84>

80003d10 <eeprom_write_page>:
80003d10:	fe010113          	addi	sp,sp,-32
80003d14:	00812c23          	sw	s0,24(sp)
80003d18:	00912a23          	sw	s1,20(sp)
80003d1c:	01212823          	sw	s2,16(sp)
80003d20:	01412423          	sw	s4,8(sp)
80003d24:	01512223          	sw	s5,4(sp)
80003d28:	00112e23          	sw	ra,28(sp)
80003d2c:	01312623          	sw	s3,12(sp)
80003d30:	01612023          	sw	s6,0(sp)
80003d34:	01500793          	li	a5,21
80003d38:	00159593          	slli	a1,a1,0x1
80003d3c:	00f52623          	sw	a5,12(a0)
80003d40:	00018937          	lui	s2,0x18
80003d44:	00b52023          	sw	a1,0(a0)
80003d48:	6a090593          	addi	a1,s2,1696 # 186a0 <_stack_size+0x17ea0>
80003d4c:	00050413          	mv	s0,a0
80003d50:	00060493          	mv	s1,a2
80003d54:	00068a13          	mv	s4,a3
80003d58:	00070a93          	mv	s5,a4
80003d5c:	4ad010ef          	jal	ra,80005a08 <i2c_wait_for_busy>
80003d60:	04051663          	bnez	a0,80003dac <eeprom_write_page+0x9c>
80003d64:	00042623          	sw	zero,12(s0)
80003d68:	00100613          	li	a2,1
80003d6c:	80002537          	lui	a0,0x80002
80003d70:	00040593          	mv	a1,s0
80003d74:	48450513          	addi	a0,a0,1156 # 80002484 <_ram_heap_end+0xffff0484>
80003d78:	78c0a0ef          	jal	ra,8000e504 <iprintf>
80003d7c:	fff00493          	li	s1,-1
80003d80:	01c12083          	lw	ra,28(sp)
80003d84:	01812403          	lw	s0,24(sp)
80003d88:	00048513          	mv	a0,s1
80003d8c:	01012903          	lw	s2,16(sp)
80003d90:	01412483          	lw	s1,20(sp)
80003d94:	00c12983          	lw	s3,12(sp)
80003d98:	00812a03          	lw	s4,8(sp)
80003d9c:	00412a83          	lw	s5,4(sp)
80003da0:	00012b03          	lw	s6,0(sp)
80003da4:	02010113          	addi	sp,sp,32
80003da8:	00008067          	ret
80003dac:	6a090593          	addi	a1,s2,1696
80003db0:	00040513          	mv	a0,s0
80003db4:	481010ef          	jal	ra,80005a34 <i2c_wait_for_release>
80003db8:	00051863          	bnez	a0,80003dc8 <eeprom_write_page+0xb8>
80003dbc:	00042623          	sw	zero,12(s0)
80003dc0:	00200613          	li	a2,2
80003dc4:	fa9ff06f          	j	80003d6c <eeprom_write_page+0x5c>
80003dc8:	00c42783          	lw	a5,12(s0)
80003dcc:	0407f793          	andi	a5,a5,64
80003dd0:	00078e63          	beqz	a5,80003dec <eeprom_write_page+0xdc>
80003dd4:	00042623          	sw	zero,12(s0)
80003dd8:	00100613          	li	a2,1
80003ddc:	80002537          	lui	a0,0x80002
80003de0:	00040593          	mv	a1,s0
80003de4:	4b450513          	addi	a0,a0,1204 # 800024b4 <_ram_heap_end+0xffff04b4>
80003de8:	f91ff06f          	j	80003d78 <eeprom_write_page+0x68>
80003dec:	00200513          	li	a0,2
80003df0:	4cd010ef          	jal	ra,80005abc <delay_us>
80003df4:	01100793          	li	a5,17
80003df8:	00f42623          	sw	a5,12(s0)
80003dfc:	00942023          	sw	s1,0(s0)
80003e00:	6a090593          	addi	a1,s2,1696
80003e04:	00040513          	mv	a0,s0
80003e08:	401010ef          	jal	ra,80005a08 <i2c_wait_for_busy>
80003e0c:	00051863          	bnez	a0,80003e1c <eeprom_write_page+0x10c>
80003e10:	00042623          	sw	zero,12(s0)
80003e14:	00300613          	li	a2,3
80003e18:	f55ff06f          	j	80003d6c <eeprom_write_page+0x5c>
80003e1c:	6a090593          	addi	a1,s2,1696
80003e20:	00040513          	mv	a0,s0
80003e24:	411010ef          	jal	ra,80005a34 <i2c_wait_for_release>
80003e28:	00051863          	bnez	a0,80003e38 <eeprom_write_page+0x128>
80003e2c:	00042623          	sw	zero,12(s0)
80003e30:	00400613          	li	a2,4
80003e34:	f39ff06f          	j	80003d6c <eeprom_write_page+0x5c>
80003e38:	00c42783          	lw	a5,12(s0)
80003e3c:	00000993          	li	s3,0
80003e40:	0407f793          	andi	a5,a5,64
80003e44:	04079a63          	bnez	a5,80003e98 <eeprom_write_page+0x188>
80003e48:	000a0493          	mv	s1,s4
80003e4c:	fffa0b13          	addi	s6,s4,-1
80003e50:	6a090913          	addi	s2,s2,1696
80003e54:	f349d6e3          	bge	s3,s4,80003d80 <eeprom_write_page+0x70>
80003e58:	00200513          	li	a0,2
80003e5c:	461010ef          	jal	ra,80005abc <delay_us>
80003e60:	01100793          	li	a5,17
80003e64:	013b1463          	bne	s6,s3,80003e6c <eeprom_write_page+0x15c>
80003e68:	01900793          	li	a5,25
80003e6c:	013a8733          	add	a4,s5,s3
80003e70:	00074703          	lbu	a4,0(a4)
80003e74:	00f42623          	sw	a5,12(s0)
80003e78:	00090593          	mv	a1,s2
80003e7c:	00e42023          	sw	a4,0(s0)
80003e80:	00040513          	mv	a0,s0
80003e84:	385010ef          	jal	ra,80005a08 <i2c_wait_for_busy>
80003e88:	00051e63          	bnez	a0,80003ea4 <eeprom_write_page+0x194>
80003e8c:	00042623          	sw	zero,12(s0)
80003e90:	00500613          	li	a2,5
80003e94:	ed9ff06f          	j	80003d6c <eeprom_write_page+0x5c>
80003e98:	00042623          	sw	zero,12(s0)
80003e9c:	00200613          	li	a2,2
80003ea0:	f3dff06f          	j	80003ddc <eeprom_write_page+0xcc>
80003ea4:	00090593          	mv	a1,s2
80003ea8:	00040513          	mv	a0,s0
80003eac:	389010ef          	jal	ra,80005a34 <i2c_wait_for_release>
80003eb0:	00051863          	bnez	a0,80003ec0 <eeprom_write_page+0x1b0>
80003eb4:	00042623          	sw	zero,12(s0)
80003eb8:	00600613          	li	a2,6
80003ebc:	eb1ff06f          	j	80003d6c <eeprom_write_page+0x5c>
80003ec0:	00c42783          	lw	a5,12(s0)
80003ec4:	0407f793          	andi	a5,a5,64
80003ec8:	00078863          	beqz	a5,80003ed8 <eeprom_write_page+0x1c8>
80003ecc:	00042623          	sw	zero,12(s0)
80003ed0:	00300613          	li	a2,3
80003ed4:	f09ff06f          	j	80003ddc <eeprom_write_page+0xcc>
80003ed8:	00198993          	addi	s3,s3,1
80003edc:	f79ff06f          	j	80003e54 <eeprom_write_page+0x144>

80003ee0 <eeprom_poll>:
80003ee0:	ff010113          	addi	sp,sp,-16
80003ee4:	00812423          	sw	s0,8(sp)
80003ee8:	00912223          	sw	s1,4(sp)
80003eec:	00112623          	sw	ra,12(sp)
80003ef0:	01d00793          	li	a5,29
80003ef4:	00159593          	slli	a1,a1,0x1
80003ef8:	00f52623          	sw	a5,12(a0)
80003efc:	000184b7          	lui	s1,0x18
80003f00:	00b52023          	sw	a1,0(a0)
80003f04:	6a048593          	addi	a1,s1,1696 # 186a0 <_stack_size+0x17ea0>
80003f08:	00050413          	mv	s0,a0
80003f0c:	2fd010ef          	jal	ra,80005a08 <i2c_wait_for_busy>
80003f10:	00100613          	li	a2,1
80003f14:	00050c63          	beqz	a0,80003f2c <eeprom_poll+0x4c>
80003f18:	6a048593          	addi	a1,s1,1696
80003f1c:	00040513          	mv	a0,s0
80003f20:	315010ef          	jal	ra,80005a34 <i2c_wait_for_release>
80003f24:	02051863          	bnez	a0,80003f54 <eeprom_poll+0x74>
80003f28:	00200613          	li	a2,2
80003f2c:	80002537          	lui	a0,0x80002
80003f30:	00040593          	mv	a1,s0
80003f34:	4e450513          	addi	a0,a0,1252 # 800024e4 <_ram_heap_end+0xffff04e4>
80003f38:	5cc0a0ef          	jal	ra,8000e504 <iprintf>
80003f3c:	fff00513          	li	a0,-1
80003f40:	00c12083          	lw	ra,12(sp)
80003f44:	00812403          	lw	s0,8(sp)
80003f48:	00412483          	lw	s1,4(sp)
80003f4c:	01010113          	addi	sp,sp,16
80003f50:	00008067          	ret
80003f54:	00c42503          	lw	a0,12(s0)
80003f58:	00655513          	srli	a0,a0,0x6
80003f5c:	00157513          	andi	a0,a0,1
80003f60:	fe1ff06f          	j	80003f40 <eeprom_poll+0x60>

80003f64 <eeprom_read_page>:
80003f64:	fd010113          	addi	sp,sp,-48
80003f68:	02812423          	sw	s0,40(sp)
80003f6c:	02912223          	sw	s1,36(sp)
80003f70:	03212023          	sw	s2,32(sp)
80003f74:	01312e23          	sw	s3,28(sp)
80003f78:	01412c23          	sw	s4,24(sp)
80003f7c:	01512a23          	sw	s5,20(sp)
80003f80:	01612823          	sw	s6,16(sp)
80003f84:	02112623          	sw	ra,44(sp)
80003f88:	01712623          	sw	s7,12(sp)
80003f8c:	01500993          	li	s3,21
80003f90:	00159493          	slli	s1,a1,0x1
80003f94:	01352623          	sw	s3,12(a0)
80003f98:	00018937          	lui	s2,0x18
80003f9c:	00952023          	sw	s1,0(a0)
80003fa0:	6a090593          	addi	a1,s2,1696 # 186a0 <_stack_size+0x17ea0>
80003fa4:	00050413          	mv	s0,a0
80003fa8:	00060b13          	mv	s6,a2
80003fac:	00068a13          	mv	s4,a3
80003fb0:	00070a93          	mv	s5,a4
80003fb4:	255010ef          	jal	ra,80005a08 <i2c_wait_for_busy>
80003fb8:	00051e63          	bnez	a0,80003fd4 <eeprom_read_page+0x70>
80003fbc:	00042623          	sw	zero,12(s0)
80003fc0:	00100613          	li	a2,1
80003fc4:	80002537          	lui	a0,0x80002
80003fc8:	00040593          	mv	a1,s0
80003fcc:	50c50513          	addi	a0,a0,1292 # 8000250c <_ram_heap_end+0xffff050c>
80003fd0:	0400006f          	j	80004010 <eeprom_read_page+0xac>
80003fd4:	6a090593          	addi	a1,s2,1696
80003fd8:	00040513          	mv	a0,s0
80003fdc:	259010ef          	jal	ra,80005a34 <i2c_wait_for_release>
80003fe0:	00051863          	bnez	a0,80003ff0 <eeprom_read_page+0x8c>
80003fe4:	00042623          	sw	zero,12(s0)
80003fe8:	00200613          	li	a2,2
80003fec:	fd9ff06f          	j	80003fc4 <eeprom_read_page+0x60>
80003ff0:	00c42783          	lw	a5,12(s0)
80003ff4:	0407f793          	andi	a5,a5,64
80003ff8:	04078863          	beqz	a5,80004048 <eeprom_read_page+0xe4>
80003ffc:	00042623          	sw	zero,12(s0)
80004000:	00100613          	li	a2,1
80004004:	80002537          	lui	a0,0x80002
80004008:	00040593          	mv	a1,s0
8000400c:	53c50513          	addi	a0,a0,1340 # 8000253c <_ram_heap_end+0xffff053c>
80004010:	4f40a0ef          	jal	ra,8000e504 <iprintf>
80004014:	fff00493          	li	s1,-1
80004018:	02c12083          	lw	ra,44(sp)
8000401c:	02812403          	lw	s0,40(sp)
80004020:	00048513          	mv	a0,s1
80004024:	02012903          	lw	s2,32(sp)
80004028:	02412483          	lw	s1,36(sp)
8000402c:	01c12983          	lw	s3,28(sp)
80004030:	01812a03          	lw	s4,24(sp)
80004034:	01412a83          	lw	s5,20(sp)
80004038:	01012b03          	lw	s6,16(sp)
8000403c:	00c12b83          	lw	s7,12(sp)
80004040:	03010113          	addi	sp,sp,48
80004044:	00008067          	ret
80004048:	00200513          	li	a0,2
8000404c:	271010ef          	jal	ra,80005abc <delay_us>
80004050:	01900793          	li	a5,25
80004054:	00f42623          	sw	a5,12(s0)
80004058:	01642023          	sw	s6,0(s0)
8000405c:	6a090593          	addi	a1,s2,1696
80004060:	00040513          	mv	a0,s0
80004064:	1a5010ef          	jal	ra,80005a08 <i2c_wait_for_busy>
80004068:	00051863          	bnez	a0,80004078 <eeprom_read_page+0x114>
8000406c:	00042623          	sw	zero,12(s0)
80004070:	00300613          	li	a2,3
80004074:	f51ff06f          	j	80003fc4 <eeprom_read_page+0x60>
80004078:	6a090593          	addi	a1,s2,1696
8000407c:	00040513          	mv	a0,s0
80004080:	1b5010ef          	jal	ra,80005a34 <i2c_wait_for_release>
80004084:	00051863          	bnez	a0,80004094 <eeprom_read_page+0x130>
80004088:	00042623          	sw	zero,12(s0)
8000408c:	00400613          	li	a2,4
80004090:	f35ff06f          	j	80003fc4 <eeprom_read_page+0x60>
80004094:	00c42783          	lw	a5,12(s0)
80004098:	0407f793          	andi	a5,a5,64
8000409c:	00078863          	beqz	a5,800040ac <eeprom_read_page+0x148>
800040a0:	00042623          	sw	zero,12(s0)
800040a4:	00200613          	li	a2,2
800040a8:	f5dff06f          	j	80004004 <eeprom_read_page+0xa0>
800040ac:	00200513          	li	a0,2
800040b0:	20d010ef          	jal	ra,80005abc <delay_us>
800040b4:	0014e493          	ori	s1,s1,1
800040b8:	01342623          	sw	s3,12(s0)
800040bc:	00942023          	sw	s1,0(s0)
800040c0:	6a090593          	addi	a1,s2,1696
800040c4:	00040513          	mv	a0,s0
800040c8:	141010ef          	jal	ra,80005a08 <i2c_wait_for_busy>
800040cc:	00051863          	bnez	a0,800040dc <eeprom_read_page+0x178>
800040d0:	00042623          	sw	zero,12(s0)
800040d4:	00500613          	li	a2,5
800040d8:	eedff06f          	j	80003fc4 <eeprom_read_page+0x60>
800040dc:	6a090593          	addi	a1,s2,1696
800040e0:	00040513          	mv	a0,s0
800040e4:	151010ef          	jal	ra,80005a34 <i2c_wait_for_release>
800040e8:	00051863          	bnez	a0,800040f8 <eeprom_read_page+0x194>
800040ec:	00042623          	sw	zero,12(s0)
800040f0:	00600613          	li	a2,6
800040f4:	ed1ff06f          	j	80003fc4 <eeprom_read_page+0x60>
800040f8:	00c42783          	lw	a5,12(s0)
800040fc:	00000993          	li	s3,0
80004100:	0407f793          	andi	a5,a5,64
80004104:	04079863          	bnez	a5,80004154 <eeprom_read_page+0x1f0>
80004108:	000a0493          	mv	s1,s4
8000410c:	fffa0b13          	addi	s6,s4,-1
80004110:	0ff00b93          	li	s7,255
80004114:	6a090913          	addi	s2,s2,1696
80004118:	f149d0e3          	bge	s3,s4,80004018 <eeprom_read_page+0xb4>
8000411c:	00200513          	li	a0,2
80004120:	19d010ef          	jal	ra,80005abc <delay_us>
80004124:	02100793          	li	a5,33
80004128:	013b1463          	bne	s6,s3,80004130 <eeprom_read_page+0x1cc>
8000412c:	00900793          	li	a5,9
80004130:	00f42623          	sw	a5,12(s0)
80004134:	01742023          	sw	s7,0(s0)
80004138:	00090593          	mv	a1,s2
8000413c:	00040513          	mv	a0,s0
80004140:	0c9010ef          	jal	ra,80005a08 <i2c_wait_for_busy>
80004144:	00051e63          	bnez	a0,80004160 <eeprom_read_page+0x1fc>
80004148:	00042623          	sw	zero,12(s0)
8000414c:	00700613          	li	a2,7
80004150:	e75ff06f          	j	80003fc4 <eeprom_read_page+0x60>
80004154:	00042623          	sw	zero,12(s0)
80004158:	00300613          	li	a2,3
8000415c:	ea9ff06f          	j	80004004 <eeprom_read_page+0xa0>
80004160:	00090593          	mv	a1,s2
80004164:	00040513          	mv	a0,s0
80004168:	0cd010ef          	jal	ra,80005a34 <i2c_wait_for_release>
8000416c:	00051863          	bnez	a0,8000417c <eeprom_read_page+0x218>
80004170:	00042623          	sw	zero,12(s0)
80004174:	00800613          	li	a2,8
80004178:	e4dff06f          	j	80003fc4 <eeprom_read_page+0x60>
8000417c:	00442703          	lw	a4,4(s0)
80004180:	013a87b3          	add	a5,s5,s3
80004184:	00198993          	addi	s3,s3,1
80004188:	00e78023          	sb	a4,0(a5)
8000418c:	f8dff06f          	j	80004118 <eeprom_read_page+0x1b4>

80004190 <eeprom_probe>:
80004190:	fe010113          	addi	sp,sp,-32
80004194:	00912a23          	sw	s1,20(sp)
80004198:	00050493          	mv	s1,a0
8000419c:	80002537          	lui	a0,0x80002
800041a0:	05000593          	li	a1,80
800041a4:	56850513          	addi	a0,a0,1384 # 80002568 <_ram_heap_end+0xffff0568>
800041a8:	00112e23          	sw	ra,28(sp)
800041ac:	01212823          	sw	s2,16(sp)
800041b0:	00812c23          	sw	s0,24(sp)
800041b4:	3500a0ef          	jal	ra,8000e504 <iprintf>
800041b8:	deadc7b7          	lui	a5,0xdeadc
800041bc:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac9eef>
800041c0:	00c10713          	addi	a4,sp,12
800041c4:	00400693          	li	a3,4
800041c8:	07c00613          	li	a2,124
800041cc:	05000593          	li	a1,80
800041d0:	00048513          	mv	a0,s1
800041d4:	00f12623          	sw	a5,12(sp)
800041d8:	b39ff0ef          	jal	ra,80003d10 <eeprom_write_page>
800041dc:	00400793          	li	a5,4
800041e0:	00a00913          	li	s2,10
800041e4:	00f50c63          	beq	a0,a5,800041fc <eeprom_probe+0x6c>
800041e8:	80002537          	lui	a0,0x80002
800041ec:	05000593          	li	a1,80
800041f0:	58450513          	addi	a0,a0,1412 # 80002584 <_ram_heap_end+0xffff0584>
800041f4:	3100a0ef          	jal	ra,8000e504 <iprintf>
800041f8:	0580006f          	j	80004250 <eeprom_probe+0xc0>
800041fc:	05000593          	li	a1,80
80004200:	00048513          	mv	a0,s1
80004204:	cddff0ef          	jal	ra,80003ee0 <eeprom_poll>
80004208:	00050413          	mv	s0,a0
8000420c:	06050a63          	beqz	a0,80004280 <eeprom_probe+0xf0>
80004210:	3e800513          	li	a0,1000
80004214:	fff90913          	addi	s2,s2,-1
80004218:	0a5010ef          	jal	ra,80005abc <delay_us>
8000421c:	fe0910e3          	bnez	s2,800041fc <eeprom_probe+0x6c>
80004220:	80002537          	lui	a0,0x80002
80004224:	05000593          	li	a1,80
80004228:	62850513          	addi	a0,a0,1576 # 80002628 <_ram_heap_end+0xffff0628>
8000422c:	fc9ff06f          	j	800041f4 <eeprom_probe+0x64>
80004230:	00c12603          	lw	a2,12(sp)
80004234:	deadc7b7          	lui	a5,0xdeadc
80004238:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac9eef>
8000423c:	05000593          	li	a1,80
80004240:	00f60c63          	beq	a2,a5,80004258 <eeprom_probe+0xc8>
80004244:	80002537          	lui	a0,0x80002
80004248:	5dc50513          	addi	a0,a0,1500 # 800025dc <_ram_heap_end+0xffff05dc>
8000424c:	2b80a0ef          	jal	ra,8000e504 <iprintf>
80004250:	fff00413          	li	s0,-1
80004254:	0100006f          	j	80004264 <eeprom_probe+0xd4>
80004258:	80002537          	lui	a0,0x80002
8000425c:	61050513          	addi	a0,a0,1552 # 80002610 <_ram_heap_end+0xffff0610>
80004260:	2a40a0ef          	jal	ra,8000e504 <iprintf>
80004264:	00040513          	mv	a0,s0
80004268:	01c12083          	lw	ra,28(sp)
8000426c:	01812403          	lw	s0,24(sp)
80004270:	01412483          	lw	s1,20(sp)
80004274:	01012903          	lw	s2,16(sp)
80004278:	02010113          	addi	sp,sp,32
8000427c:	00008067          	ret
80004280:	00c10713          	addi	a4,sp,12
80004284:	00400693          	li	a3,4
80004288:	07c00613          	li	a2,124
8000428c:	05000593          	li	a1,80
80004290:	00048513          	mv	a0,s1
80004294:	00012623          	sw	zero,12(sp)
80004298:	ccdff0ef          	jal	ra,80003f64 <eeprom_read_page>
8000429c:	00400793          	li	a5,4
800042a0:	f8f508e3          	beq	a0,a5,80004230 <eeprom_probe+0xa0>
800042a4:	80002537          	lui	a0,0x80002
800042a8:	05000593          	li	a1,80
800042ac:	5b050513          	addi	a0,a0,1456 # 800025b0 <_ram_heap_end+0xffff05b0>
800042b0:	f45ff06f          	j	800041f4 <eeprom_probe+0x64>

800042b4 <modbus_error>:
800042b4:	ff010113          	addi	sp,sp,-16
800042b8:	00812423          	sw	s0,8(sp)
800042bc:	00912223          	sw	s1,4(sp)
800042c0:	01212023          	sw	s2,0(sp)
800042c4:	00060413          	mv	s0,a2
800042c8:	00058913          	mv	s2,a1
800042cc:	00058613          	mv	a2,a1
800042d0:	00050493          	mv	s1,a0
800042d4:	00050593          	mv	a1,a0
800042d8:	80002537          	lui	a0,0x80002
800042dc:	69c50513          	addi	a0,a0,1692 # 8000269c <_ram_heap_end+0xffff069c>
800042e0:	00112623          	sw	ra,12(sp)
800042e4:	2200a0ef          	jal	ra,8000e504 <iprintf>
800042e8:	9a81c783          	lbu	a5,-1624(gp) # 80003140 <active_config+0x14>
800042ec:	f804e493          	ori	s1,s1,-128
800042f0:	009400a3          	sb	s1,1(s0)
800042f4:	01240123          	sb	s2,2(s0)
800042f8:	00040513          	mv	a0,s0
800042fc:	00f40023          	sb	a5,0(s0)
80004300:	00300593          	li	a1,3
80004304:	9a0ff0ef          	jal	ra,800034a4 <add_crc>
80004308:	00c12083          	lw	ra,12(sp)
8000430c:	00812403          	lw	s0,8(sp)
80004310:	00412483          	lw	s1,4(sp)
80004314:	00012903          	lw	s2,0(sp)
80004318:	00500513          	li	a0,5
8000431c:	01010113          	addi	sp,sp,16
80004320:	00008067          	ret

80004324 <modbus_store_reg>:
80004324:	fd850793          	addi	a5,a0,-40
80004328:	fd010113          	addi	sp,sp,-48
8000432c:	01079793          	slli	a5,a5,0x10
80004330:	02812423          	sw	s0,40(sp)
80004334:	02112623          	sw	ra,44(sp)
80004338:	02912223          	sw	s1,36(sp)
8000433c:	0107d793          	srli	a5,a5,0x10
80004340:	00900713          	li	a4,9
80004344:	00058413          	mv	s0,a1
80004348:	02f76063          	bltu	a4,a5,80004368 <modbus_store_reg+0x44>
8000434c:	8801a783          	lw	a5,-1920(gp) # 80003018 <reg_config_write>
80004350:	00079c63          	bnez	a5,80004368 <modbus_store_reg+0x44>
80004354:	80002537          	lui	a0,0x80002
80004358:	6c050513          	addi	a0,a0,1728 # 800026c0 <_ram_heap_end+0xffff06c0>
8000435c:	1a80a0ef          	jal	ra,8000e504 <iprintf>
80004360:	ffe00493          	li	s1,-2
80004364:	0380006f          	j	8000439c <modbus_store_reg+0x78>
80004368:	02f00793          	li	a5,47
8000436c:	3ef50e63          	beq	a0,a5,80004768 <modbus_store_reg+0x444>
80004370:	0aa7e463          	bltu	a5,a0,80004418 <modbus_store_reg+0xf4>
80004374:	02a00793          	li	a5,42
80004378:	38f50863          	beq	a0,a5,80004708 <modbus_store_reg+0x3e4>
8000437c:	02a7ec63          	bltu	a5,a0,800043b4 <modbus_store_reg+0x90>
80004380:	02000793          	li	a5,32
80004384:	22f50c63          	beq	a0,a5,800045bc <modbus_store_reg+0x298>
80004388:	02900793          	li	a5,41
8000438c:	34f50463          	beq	a0,a5,800046d4 <modbus_store_reg+0x3b0>
80004390:	01400793          	li	a5,20
80004394:	16f50e63          	beq	a0,a5,80004510 <modbus_store_reg+0x1ec>
80004398:	fff00493          	li	s1,-1
8000439c:	02c12083          	lw	ra,44(sp)
800043a0:	02812403          	lw	s0,40(sp)
800043a4:	00048513          	mv	a0,s1
800043a8:	02412483          	lw	s1,36(sp)
800043ac:	03010113          	addi	sp,sp,48
800043b0:	00008067          	ret
800043b4:	02c00793          	li	a5,44
800043b8:	2af50a63          	beq	a0,a5,8000466c <modbus_store_reg+0x348>
800043bc:	36f56e63          	bltu	a0,a5,80004738 <modbus_store_reg+0x414>
800043c0:	02d00793          	li	a5,45
800043c4:	fcf51ae3          	bne	a0,a5,80004398 <modbus_store_reg+0x74>
800043c8:	00010513          	mv	a0,sp
800043cc:	f5cff0ef          	jal	ra,80003b28 <config_load>
800043d0:	00055c63          	bgez	a0,800043e8 <modbus_store_reg+0xc4>
800043d4:	800035b7          	lui	a1,0x80003
800043d8:	02000613          	li	a2,32
800043dc:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
800043e0:	00010513          	mv	a0,sp
800043e4:	4e1090ef          	jal	ra,8000e0c4 <memcpy>
800043e8:	00044783          	lbu	a5,0(s0)
800043ec:	00144703          	lbu	a4,1(s0)
800043f0:	01879793          	slli	a5,a5,0x18
800043f4:	01071713          	slli	a4,a4,0x10
800043f8:	00e7e7b3          	or	a5,a5,a4
800043fc:	00344703          	lbu	a4,3(s0)
80004400:	00e7e7b3          	or	a5,a5,a4
80004404:	00244703          	lbu	a4,2(s0)
80004408:	00871713          	slli	a4,a4,0x8
8000440c:	00e7e7b3          	or	a5,a5,a4
80004410:	00f12c23          	sw	a5,24(sp)
80004414:	2800006f          	j	80004694 <modbus_store_reg+0x370>
80004418:	03300793          	li	a5,51
8000441c:	0cf50e63          	beq	a0,a5,800044f8 <modbus_store_reg+0x1d4>
80004420:	0aa7e863          	bltu	a5,a0,800044d0 <modbus_store_reg+0x1ac>
80004424:	03100793          	li	a5,49
80004428:	28f50063          	beq	a0,a5,800046a8 <modbus_store_reg+0x384>
8000442c:	1ea7fc63          	bgeu	a5,a0,80004624 <modbus_store_reg+0x300>
80004430:	00144703          	lbu	a4,1(s0)
80004434:	00044503          	lbu	a0,0(s0)
80004438:	00244583          	lbu	a1,2(s0)
8000443c:	00871713          	slli	a4,a4,0x8
80004440:	00a76733          	or	a4,a4,a0
80004444:	00871513          	slli	a0,a4,0x8
80004448:	00875713          	srli	a4,a4,0x8
8000444c:	00e56733          	or	a4,a0,a4
80004450:	01071513          	slli	a0,a4,0x10
80004454:	00344703          	lbu	a4,3(s0)
80004458:	00444783          	lbu	a5,4(s0)
8000445c:	01055513          	srli	a0,a0,0x10
80004460:	00871713          	slli	a4,a4,0x8
80004464:	00b76733          	or	a4,a4,a1
80004468:	00871593          	slli	a1,a4,0x8
8000446c:	00875713          	srli	a4,a4,0x8
80004470:	00e5e733          	or	a4,a1,a4
80004474:	01071593          	slli	a1,a4,0x10
80004478:	00544703          	lbu	a4,5(s0)
8000447c:	0105d593          	srli	a1,a1,0x10
80004480:	ffd00493          	li	s1,-3
80004484:	00871713          	slli	a4,a4,0x8
80004488:	00f76733          	or	a4,a4,a5
8000448c:	00871793          	slli	a5,a4,0x8
80004490:	00875713          	srli	a4,a4,0x8
80004494:	00e7e733          	or	a4,a5,a4
80004498:	01071793          	slli	a5,a4,0x10
8000449c:	0107d793          	srli	a5,a5,0x10
800044a0:	ffa60713          	addi	a4,a2,-6
800044a4:	ee060ce3          	beqz	a2,8000439c <modbus_store_reg+0x78>
800044a8:	800036b7          	lui	a3,0x80003
800044ac:	f986a603          	lw	a2,-104(a3) # 80002f98 <_ram_heap_end+0xffff0f98>
800044b0:	00640693          	addi	a3,s0,6
800044b4:	0e079a63          	bnez	a5,800045a8 <modbus_store_reg+0x284>
800044b8:	800007b7          	lui	a5,0x80000
800044bc:	00800893          	li	a7,8
800044c0:	00600813          	li	a6,6
800044c4:	13478793          	addi	a5,a5,308 # 80000134 <_ram_heap_end+0xfffee134>
800044c8:	1f8010ef          	jal	ra,800056c0 <hub_print>
800044cc:	03c0006f          	j	80004508 <modbus_store_reg+0x1e4>
800044d0:	07e00793          	li	a5,126
800044d4:	10f50c63          	beq	a0,a5,800045ec <modbus_store_reg+0x2c8>
800044d8:	07f00793          	li	a5,127
800044dc:	14f50063          	beq	a0,a5,8000461c <modbus_store_reg+0x2f8>
800044e0:	03400793          	li	a5,52
800044e4:	eaf51ae3          	bne	a0,a5,80004398 <modbus_store_reg+0x74>
800044e8:	00344703          	lbu	a4,3(s0)
800044ec:	800037b7          	lui	a5,0x80003
800044f0:	f8e7ac23          	sw	a4,-104(a5) # 80002f98 <_ram_heap_end+0xffff0f98>
800044f4:	0140006f          	j	80004508 <modbus_store_reg+0x1e4>
800044f8:	8b81a603          	lw	a2,-1864(gp) # 80003050 <hub_frame_size>
800044fc:	00000593          	li	a1,0
80004500:	f0050537          	lui	a0,0xf0050
80004504:	634080ef          	jal	ra,8000cb38 <memset>
80004508:	00000493          	li	s1,0
8000450c:	e91ff06f          	j	8000439c <modbus_store_reg+0x78>
80004510:	00144683          	lbu	a3,1(s0)
80004514:	00044703          	lbu	a4,0(s0)
80004518:	40000793          	li	a5,1024
8000451c:	00869693          	slli	a3,a3,0x8
80004520:	00e6e6b3          	or	a3,a3,a4
80004524:	00869713          	slli	a4,a3,0x8
80004528:	0086d693          	srli	a3,a3,0x8
8000452c:	00d76733          	or	a4,a4,a3
80004530:	000016b7          	lui	a3,0x1
80004534:	01071713          	slli	a4,a4,0x10
80004538:	00268693          	addi	a3,a3,2 # 1002 <_stack_size+0x802>
8000453c:	01075713          	srli	a4,a4,0x10
80004540:	00c6ec63          	bltu	a3,a2,80004558 <modbus_store_reg+0x234>
80004544:	ffe60613          	addi	a2,a2,-2
80004548:	41f65793          	srai	a5,a2,0x1f
8000454c:	0037f793          	andi	a5,a5,3
80004550:	00c787b3          	add	a5,a5,a2
80004554:	4027d793          	srai	a5,a5,0x2
80004558:	00279793          	slli	a5,a5,0x2
8000455c:	00f407b3          	add	a5,s0,a5
80004560:	f0050537          	lui	a0,0xf0050
80004564:	00470593          	addi	a1,a4,4
80004568:	faf400e3          	beq	s0,a5,80004508 <modbus_store_reg+0x1e4>
8000456c:	00544603          	lbu	a2,5(s0)
80004570:	00444683          	lbu	a3,4(s0)
80004574:	00e50733          	add	a4,a0,a4
80004578:	01861613          	slli	a2,a2,0x18
8000457c:	01069693          	slli	a3,a3,0x10
80004580:	00d66633          	or	a2,a2,a3
80004584:	00244683          	lbu	a3,2(s0)
80004588:	00440413          	addi	s0,s0,4
8000458c:	00d66633          	or	a2,a2,a3
80004590:	fff44683          	lbu	a3,-1(s0)
80004594:	00869693          	slli	a3,a3,0x8
80004598:	00d66633          	or	a2,a2,a3
8000459c:	00c72023          	sw	a2,0(a4)
800045a0:	00058713          	mv	a4,a1
800045a4:	fc1ff06f          	j	80004564 <modbus_store_reg+0x240>
800045a8:	800007b7          	lui	a5,0x80000
800045ac:	01000893          	li	a7,16
800045b0:	00c00813          	li	a6,12
800045b4:	73478793          	addi	a5,a5,1844 # 80000734 <_ram_heap_end+0xfffee734>
800045b8:	f11ff06f          	j	800044c8 <modbus_store_reg+0x1a4>
800045bc:	00044783          	lbu	a5,0(s0)
800045c0:	00144703          	lbu	a4,1(s0)
800045c4:	01879793          	slli	a5,a5,0x18
800045c8:	01071713          	slli	a4,a4,0x10
800045cc:	00e7e7b3          	or	a5,a5,a4
800045d0:	00344703          	lbu	a4,3(s0)
800045d4:	00e7e7b3          	or	a5,a5,a4
800045d8:	00244703          	lbu	a4,2(s0)
800045dc:	00871713          	slli	a4,a4,0x8
800045e0:	00e7e7b3          	or	a5,a5,a4
800045e4:	88f1a223          	sw	a5,-1916(gp) # 8000301c <reg_scratch>
800045e8:	f21ff06f          	j	80004508 <modbus_store_reg+0x1e4>
800045ec:	00044783          	lbu	a5,0(s0)
800045f0:	00144703          	lbu	a4,1(s0)
800045f4:	01879793          	slli	a5,a5,0x18
800045f8:	01071713          	slli	a4,a4,0x10
800045fc:	00e7e7b3          	or	a5,a5,a4
80004600:	00344703          	lbu	a4,3(s0)
80004604:	00e7e7b3          	or	a5,a5,a4
80004608:	00244703          	lbu	a4,2(s0)
8000460c:	00871713          	slli	a4,a4,0x8
80004610:	00e7e7b3          	or	a5,a5,a4
80004614:	88f1a023          	sw	a5,-1920(gp) # 80003018 <reg_config_write>
80004618:	ef1ff06f          	j	80004508 <modbus_store_reg+0x1e4>
8000461c:	614010ef          	jal	ra,80005c30 <hard_reboot>
80004620:	ee9ff06f          	j	80004508 <modbus_store_reg+0x1e4>
80004624:	00344503          	lbu	a0,3(s0)
80004628:	46d000ef          	jal	ra,80005294 <hub_init>
8000462c:	00050493          	mv	s1,a0
80004630:	d20518e3          	bnez	a0,80004360 <modbus_store_reg+0x3c>
80004634:	00010513          	mv	a0,sp
80004638:	cf0ff0ef          	jal	ra,80003b28 <config_load>
8000463c:	00055c63          	bgez	a0,80004654 <modbus_store_reg+0x330>
80004640:	800035b7          	lui	a1,0x80003
80004644:	02000613          	li	a2,32
80004648:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
8000464c:	00010513          	mv	a0,sp
80004650:	275090ef          	jal	ra,8000e0c4 <memcpy>
80004654:	00344783          	lbu	a5,3(s0)
80004658:	00010513          	mv	a0,sp
8000465c:	00f109a3          	sb	a5,19(sp)
80004660:	da0ff0ef          	jal	ra,80003c00 <config_save>
80004664:	d2055ce3          	bgez	a0,8000439c <modbus_store_reg+0x78>
80004668:	cf9ff06f          	j	80004360 <modbus_store_reg+0x3c>
8000466c:	00010513          	mv	a0,sp
80004670:	cb8ff0ef          	jal	ra,80003b28 <config_load>
80004674:	00055c63          	bgez	a0,8000468c <modbus_store_reg+0x368>
80004678:	800035b7          	lui	a1,0x80003
8000467c:	02000613          	li	a2,32
80004680:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
80004684:	00010513          	mv	a0,sp
80004688:	23d090ef          	jal	ra,8000e0c4 <memcpy>
8000468c:	00344783          	lbu	a5,3(s0)
80004690:	00f10a23          	sb	a5,20(sp)
80004694:	00010513          	mv	a0,sp
80004698:	d68ff0ef          	jal	ra,80003c00 <config_save>
8000469c:	41f55513          	srai	a0,a0,0x1f
800046a0:	ffe57493          	andi	s1,a0,-2
800046a4:	cf9ff06f          	j	8000439c <modbus_store_reg+0x78>
800046a8:	00010513          	mv	a0,sp
800046ac:	c7cff0ef          	jal	ra,80003b28 <config_load>
800046b0:	00055c63          	bgez	a0,800046c8 <modbus_store_reg+0x3a4>
800046b4:	800035b7          	lui	a1,0x80003
800046b8:	02000613          	li	a2,32
800046bc:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
800046c0:	00010513          	mv	a0,sp
800046c4:	201090ef          	jal	ra,8000e0c4 <memcpy>
800046c8:	00344783          	lbu	a5,3(s0)
800046cc:	00f10623          	sb	a5,12(sp)
800046d0:	fc5ff06f          	j	80004694 <modbus_store_reg+0x370>
800046d4:	00010513          	mv	a0,sp
800046d8:	c50ff0ef          	jal	ra,80003b28 <config_load>
800046dc:	00055c63          	bgez	a0,800046f4 <modbus_store_reg+0x3d0>
800046e0:	800035b7          	lui	a1,0x80003
800046e4:	02000613          	li	a2,32
800046e8:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
800046ec:	00010513          	mv	a0,sp
800046f0:	1d5090ef          	jal	ra,8000e0c4 <memcpy>
800046f4:	00400613          	li	a2,4
800046f8:	00340593          	addi	a1,s0,3
800046fc:	00010513          	mv	a0,sp
80004700:	564010ef          	jal	ra,80005c64 <memcpy_rev>
80004704:	f91ff06f          	j	80004694 <modbus_store_reg+0x370>
80004708:	00010513          	mv	a0,sp
8000470c:	c1cff0ef          	jal	ra,80003b28 <config_load>
80004710:	00055c63          	bgez	a0,80004728 <modbus_store_reg+0x404>
80004714:	800035b7          	lui	a1,0x80003
80004718:	02000613          	li	a2,32
8000471c:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
80004720:	00010513          	mv	a0,sp
80004724:	1a1090ef          	jal	ra,8000e0c4 <memcpy>
80004728:	00400613          	li	a2,4
8000472c:	00340593          	addi	a1,s0,3
80004730:	00410513          	addi	a0,sp,4
80004734:	fcdff06f          	j	80004700 <modbus_store_reg+0x3dc>
80004738:	00010513          	mv	a0,sp
8000473c:	becff0ef          	jal	ra,80003b28 <config_load>
80004740:	00055c63          	bgez	a0,80004758 <modbus_store_reg+0x434>
80004744:	800035b7          	lui	a1,0x80003
80004748:	02000613          	li	a2,32
8000474c:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
80004750:	00010513          	mv	a0,sp
80004754:	171090ef          	jal	ra,8000e0c4 <memcpy>
80004758:	00400613          	li	a2,4
8000475c:	00340593          	addi	a1,s0,3
80004760:	00810513          	addi	a0,sp,8
80004764:	f9dff06f          	j	80004700 <modbus_store_reg+0x3dc>
80004768:	00010513          	mv	a0,sp
8000476c:	bbcff0ef          	jal	ra,80003b28 <config_load>
80004770:	00055c63          	bgez	a0,80004788 <modbus_store_reg+0x464>
80004774:	800035b7          	lui	a1,0x80003
80004778:	02000613          	li	a2,32
8000477c:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
80004780:	00010513          	mv	a0,sp
80004784:	141090ef          	jal	ra,8000e0c4 <memcpy>
80004788:	00600613          	li	a2,6
8000478c:	00040593          	mv	a1,s0
80004790:	00d10513          	addi	a0,sp,13
80004794:	131090ef          	jal	ra,8000e0c4 <memcpy>
80004798:	efdff06f          	j	80004694 <modbus_store_reg+0x370>

8000479c <modbus_recv>:
8000479c:	fb010113          	addi	sp,sp,-80
800047a0:	04812423          	sw	s0,72(sp)
800047a4:	04112623          	sw	ra,76(sp)
800047a8:	04912223          	sw	s1,68(sp)
800047ac:	05212023          	sw	s2,64(sp)
800047b0:	03312e23          	sw	s3,60(sp)
800047b4:	03412c23          	sw	s4,56(sp)
800047b8:	03512a23          	sw	s5,52(sp)
800047bc:	03612823          	sw	s6,48(sp)
800047c0:	03712623          	sw	s7,44(sp)
800047c4:	03812423          	sw	s8,40(sp)
800047c8:	fff00413          	li	s0,-1
800047cc:	10050a63          	beqz	a0,800048e0 <modbus_recv+0x144>
800047d0:	10060863          	beqz	a2,800048e0 <modbus_recv+0x144>
800047d4:	00400793          	li	a5,4
800047d8:	10b7d463          	bge	a5,a1,800048e0 <modbus_recv+0x144>
800047dc:	01059a93          	slli	s5,a1,0x10
800047e0:	010ada93          	srli	s5,s5,0x10
800047e4:	00058413          	mv	s0,a1
800047e8:	ffea8593          	addi	a1,s5,-2
800047ec:	01059593          	slli	a1,a1,0x10
800047f0:	00050a13          	mv	s4,a0
800047f4:	0105d593          	srli	a1,a1,0x10
800047f8:	00060493          	mv	s1,a2
800047fc:	008a0433          	add	s0,s4,s0
80004800:	c4dfe0ef          	jal	ra,8000344c <crc16>
80004804:	fff44603          	lbu	a2,-1(s0)
80004808:	ffe44783          	lbu	a5,-2(s0)
8000480c:	00050593          	mv	a1,a0
80004810:	00861613          	slli	a2,a2,0x8
80004814:	00f66633          	or	a2,a2,a5
80004818:	40c51663          	bne	a0,a2,80004c24 <modbus_recv+0x488>
8000481c:	99418713          	addi	a4,gp,-1644 # 8000312c <active_config>
80004820:	000a4583          	lbu	a1,0(s4)
80004824:	01474603          	lbu	a2,20(a4)
80004828:	001a4903          	lbu	s2,1(s4)
8000482c:	99418b13          	addi	s6,gp,-1644 # 8000312c <active_config>
80004830:	00c58863          	beq	a1,a2,80004840 <modbus_recv+0xa4>
80004834:	3c059e63          	bnez	a1,80004c10 <modbus_recv+0x474>
80004838:	01100793          	li	a5,17
8000483c:	3cf91a63          	bne	s2,a5,80004c10 <modbus_recv+0x474>
80004840:	002a4403          	lbu	s0,2(s4)
80004844:	003a4783          	lbu	a5,3(s4)
80004848:	08000613          	li	a2,128
8000484c:	00841413          	slli	s0,s0,0x8
80004850:	00000593          	li	a1,0
80004854:	00048513          	mv	a0,s1
80004858:	00f46433          	or	s0,s0,a5
8000485c:	004a4983          	lbu	s3,4(s4)
80004860:	005a4c03          	lbu	s8,5(s4)
80004864:	2d4080ef          	jal	ra,8000cb38 <memset>
80004868:	014b4783          	lbu	a5,20(s6)
8000486c:	01041413          	slli	s0,s0,0x10
80004870:	41045413          	srai	s0,s0,0x10
80004874:	00f48023          	sb	a5,0(s1)
80004878:	fff90793          	addi	a5,s2,-1
8000487c:	01041b93          	slli	s7,s0,0x10
80004880:	012480a3          	sb	s2,1(s1)
80004884:	0ff7f793          	andi	a5,a5,255
80004888:	01000713          	li	a4,16
8000488c:	010bdb93          	srli	s7,s7,0x10
80004890:	36f76a63          	bltu	a4,a5,80004c04 <modbus_recv+0x468>
80004894:	80002737          	lui	a4,0x80002
80004898:	00279793          	slli	a5,a5,0x2
8000489c:	65870713          	addi	a4,a4,1624 # 80002658 <_ram_heap_end+0xffff0658>
800048a0:	00e787b3          	add	a5,a5,a4
800048a4:	0007a783          	lw	a5,0(a5)
800048a8:	00078067          	jr	a5
800048ac:	800026b7          	lui	a3,0x80002
800048b0:	800025b7          	lui	a1,0x80002
800048b4:	70068693          	addi	a3,a3,1792 # 80002700 <_ram_heap_end+0xffff0700>
800048b8:	07800613          	li	a2,120
800048bc:	70c58593          	addi	a1,a1,1804 # 8000270c <_ram_heap_end+0xffff070c>
800048c0:	00348513          	addi	a0,s1,3
800048c4:	02c0a0ef          	jal	ra,8000e8f0 <siprintf>
800048c8:	02800793          	li	a5,40
800048cc:	00f48123          	sb	a5,2(s1)
800048d0:	02b00593          	li	a1,43
800048d4:	00048513          	mv	a0,s1
800048d8:	bcdfe0ef          	jal	ra,800034a4 <add_crc>
800048dc:	02d00413          	li	s0,45
800048e0:	00040513          	mv	a0,s0
800048e4:	04c12083          	lw	ra,76(sp)
800048e8:	04812403          	lw	s0,72(sp)
800048ec:	04412483          	lw	s1,68(sp)
800048f0:	04012903          	lw	s2,64(sp)
800048f4:	03c12983          	lw	s3,60(sp)
800048f8:	03812a03          	lw	s4,56(sp)
800048fc:	03412a83          	lw	s5,52(sp)
80004900:	03012b03          	lw	s6,48(sp)
80004904:	02c12b83          	lw	s7,44(sp)
80004908:	02812c03          	lw	s8,40(sp)
8000490c:	05010113          	addi	sp,sp,80
80004910:	00008067          	ret
80004914:	00899993          	slli	s3,s3,0x8
80004918:	0189e9b3          	or	s3,s3,s8
8000491c:	01099993          	slli	s3,s3,0x10
80004920:	4109d993          	srai	s3,s3,0x10
80004924:	00100793          	li	a5,1
80004928:	00048613          	mv	a2,s1
8000492c:	2cf99263          	bne	s3,a5,80004bf0 <modbus_recv+0x454>
80004930:	02c00793          	li	a5,44
80004934:	20f40c63          	beq	s0,a5,80004b4c <modbus_recv+0x3b0>
80004938:	0887c063          	blt	a5,s0,800049b8 <modbus_recv+0x21c>
8000493c:	02000793          	li	a5,32
80004940:	14f40e63          	beq	s0,a5,80004a9c <modbus_recv+0x300>
80004944:	0287c663          	blt	a5,s0,80004970 <modbus_recv+0x1d4>
80004948:	01e00793          	li	a5,30
8000494c:	0ef40e63          	beq	s0,a5,80004a48 <modbus_recv+0x2ac>
80004950:	01f00793          	li	a5,31
80004954:	12f40e63          	beq	s0,a5,80004a90 <modbus_recv+0x2f4>
80004958:	00048613          	mv	a2,s1
8000495c:	00200593          	li	a1,2
80004960:	00090513          	mv	a0,s2
80004964:	951ff0ef          	jal	ra,800042b4 <modbus_error>
80004968:	00050413          	mv	s0,a0
8000496c:	0f00006f          	j	80004a5c <modbus_recv+0x2c0>
80004970:	02a00793          	li	a5,42
80004974:	14f40863          	beq	s0,a5,80004ac4 <modbus_recv+0x328>
80004978:	1687cc63          	blt	a5,s0,80004af0 <modbus_recv+0x354>
8000497c:	02900793          	li	a5,41
80004980:	fcf41ce3          	bne	s0,a5,80004958 <modbus_recv+0x1bc>
80004984:	00010513          	mv	a0,sp
80004988:	9a0ff0ef          	jal	ra,80003b28 <config_load>
8000498c:	00055c63          	bgez	a0,800049a4 <modbus_recv+0x208>
80004990:	800035b7          	lui	a1,0x80003
80004994:	02000613          	li	a2,32
80004998:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
8000499c:	00010513          	mv	a0,sp
800049a0:	724090ef          	jal	ra,8000e0c4 <memcpy>
800049a4:	00400613          	li	a2,4
800049a8:	00010593          	mv	a1,sp
800049ac:	00348513          	addi	a0,s1,3
800049b0:	714090ef          	jal	ra,8000e0c4 <memcpy>
800049b4:	0a40006f          	j	80004a58 <modbus_recv+0x2bc>
800049b8:	03000793          	li	a5,48
800049bc:	16f40063          	beq	s0,a5,80004b1c <modbus_recv+0x380>
800049c0:	0487c463          	blt	a5,s0,80004a08 <modbus_recv+0x26c>
800049c4:	02d00793          	li	a5,45
800049c8:	1af40663          	beq	s0,a5,80004b74 <modbus_recv+0x3d8>
800049cc:	02f00793          	li	a5,47
800049d0:	f8f414e3          	bne	s0,a5,80004958 <modbus_recv+0x1bc>
800049d4:	00010513          	mv	a0,sp
800049d8:	950ff0ef          	jal	ra,80003b28 <config_load>
800049dc:	00055c63          	bgez	a0,800049f4 <modbus_recv+0x258>
800049e0:	800035b7          	lui	a1,0x80003
800049e4:	02000613          	li	a2,32
800049e8:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
800049ec:	00010513          	mv	a0,sp
800049f0:	6d4090ef          	jal	ra,8000e0c4 <memcpy>
800049f4:	00600613          	li	a2,6
800049f8:	00d10593          	addi	a1,sp,13
800049fc:	00348513          	addi	a0,s1,3
80004a00:	6c4090ef          	jal	ra,8000e0c4 <memcpy>
80004a04:	1400006f          	j	80004b44 <modbus_recv+0x3a8>
80004a08:	03400793          	li	a5,52
80004a0c:	0af40463          	beq	s0,a5,80004ab4 <modbus_recv+0x318>
80004a10:	07e00793          	li	a5,126
80004a14:	08f40a63          	beq	s0,a5,80004aa8 <modbus_recv+0x30c>
80004a18:	03100793          	li	a5,49
80004a1c:	f2f41ee3          	bne	s0,a5,80004958 <modbus_recv+0x1bc>
80004a20:	00010513          	mv	a0,sp
80004a24:	904ff0ef          	jal	ra,80003b28 <config_load>
80004a28:	00055c63          	bgez	a0,80004a40 <modbus_recv+0x2a4>
80004a2c:	800035b7          	lui	a1,0x80003
80004a30:	02000613          	li	a2,32
80004a34:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
80004a38:	00010513          	mv	a0,sp
80004a3c:	688090ef          	jal	ra,8000e0c4 <memcpy>
80004a40:	00c14783          	lbu	a5,12(sp)
80004a44:	0fc0006f          	j	80004b40 <modbus_recv+0x3a4>
80004a48:	00400613          	li	a2,4
80004a4c:	88b18593          	addi	a1,gp,-1909 # 80003023 <reg_sys_counter+0x3>
80004a50:	00348513          	addi	a0,s1,3
80004a54:	210010ef          	jal	ra,80005c64 <memcpy_rev>
80004a58:	00400413          	li	s0,4
80004a5c:	00340593          	addi	a1,s0,3
80004a60:	01059593          	slli	a1,a1,0x10
80004a64:	00848123          	sb	s0,2(s1)
80004a68:	0105d593          	srli	a1,a1,0x10
80004a6c:	00048513          	mv	a0,s1
80004a70:	a35fe0ef          	jal	ra,800034a4 <add_crc>
80004a74:	00540413          	addi	s0,s0,5
80004a78:	e60414e3          	bnez	s0,800048e0 <modbus_recv+0x144>
80004a7c:	80002537          	lui	a0,0x80002
80004a80:	00090593          	mv	a1,s2
80004a84:	72c50513          	addi	a0,a0,1836 # 8000272c <_ram_heap_end+0xffff072c>
80004a88:	27d090ef          	jal	ra,8000e504 <iprintf>
80004a8c:	e55ff06f          	j	800048e0 <modbus_recv+0x144>
80004a90:	00400613          	li	a2,4
80004a94:	88f18593          	addi	a1,gp,-1905 # 80003027 <reg_irq_counter+0x3>
80004a98:	fb9ff06f          	j	80004a50 <modbus_recv+0x2b4>
80004a9c:	00400613          	li	a2,4
80004aa0:	88718593          	addi	a1,gp,-1913 # 8000301f <reg_scratch+0x3>
80004aa4:	fadff06f          	j	80004a50 <modbus_recv+0x2b4>
80004aa8:	00400613          	li	a2,4
80004aac:	88318593          	addi	a1,gp,-1917 # 8000301b <reg_config_write+0x3>
80004ab0:	fa1ff06f          	j	80004a50 <modbus_recv+0x2b4>
80004ab4:	800035b7          	lui	a1,0x80003
80004ab8:	00400613          	li	a2,4
80004abc:	f9b58593          	addi	a1,a1,-101 # 80002f9b <_ram_heap_end+0xffff0f9b>
80004ac0:	f91ff06f          	j	80004a50 <modbus_recv+0x2b4>
80004ac4:	00010513          	mv	a0,sp
80004ac8:	860ff0ef          	jal	ra,80003b28 <config_load>
80004acc:	00055c63          	bgez	a0,80004ae4 <modbus_recv+0x348>
80004ad0:	800035b7          	lui	a1,0x80003
80004ad4:	02000613          	li	a2,32
80004ad8:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
80004adc:	00010513          	mv	a0,sp
80004ae0:	5e4090ef          	jal	ra,8000e0c4 <memcpy>
80004ae4:	00400613          	li	a2,4
80004ae8:	00410593          	addi	a1,sp,4
80004aec:	ec1ff06f          	j	800049ac <modbus_recv+0x210>
80004af0:	00010513          	mv	a0,sp
80004af4:	834ff0ef          	jal	ra,80003b28 <config_load>
80004af8:	00055c63          	bgez	a0,80004b10 <modbus_recv+0x374>
80004afc:	800035b7          	lui	a1,0x80003
80004b00:	02000613          	li	a2,32
80004b04:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
80004b08:	00010513          	mv	a0,sp
80004b0c:	5b8090ef          	jal	ra,8000e0c4 <memcpy>
80004b10:	00400613          	li	a2,4
80004b14:	00810593          	addi	a1,sp,8
80004b18:	e95ff06f          	j	800049ac <modbus_recv+0x210>
80004b1c:	00010513          	mv	a0,sp
80004b20:	808ff0ef          	jal	ra,80003b28 <config_load>
80004b24:	00055c63          	bgez	a0,80004b3c <modbus_recv+0x3a0>
80004b28:	800035b7          	lui	a1,0x80003
80004b2c:	02000613          	li	a2,32
80004b30:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
80004b34:	00010513          	mv	a0,sp
80004b38:	58c090ef          	jal	ra,8000e0c4 <memcpy>
80004b3c:	01314783          	lbu	a5,19(sp)
80004b40:	00f48323          	sb	a5,6(s1)
80004b44:	00600413          	li	s0,6
80004b48:	f15ff06f          	j	80004a5c <modbus_recv+0x2c0>
80004b4c:	00010513          	mv	a0,sp
80004b50:	fd9fe0ef          	jal	ra,80003b28 <config_load>
80004b54:	00055c63          	bgez	a0,80004b6c <modbus_recv+0x3d0>
80004b58:	800035b7          	lui	a1,0x80003
80004b5c:	02000613          	li	a2,32
80004b60:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
80004b64:	00010513          	mv	a0,sp
80004b68:	55c090ef          	jal	ra,8000e0c4 <memcpy>
80004b6c:	01414783          	lbu	a5,20(sp)
80004b70:	fd1ff06f          	j	80004b40 <modbus_recv+0x3a4>
80004b74:	00010513          	mv	a0,sp
80004b78:	fb1fe0ef          	jal	ra,80003b28 <config_load>
80004b7c:	00055c63          	bgez	a0,80004b94 <modbus_recv+0x3f8>
80004b80:	800035b7          	lui	a1,0x80003
80004b84:	02000613          	li	a2,32
80004b88:	f0c58593          	addi	a1,a1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
80004b8c:	00010513          	mv	a0,sp
80004b90:	534090ef          	jal	ra,8000e0c4 <memcpy>
80004b94:	00400613          	li	a2,4
80004b98:	01b10593          	addi	a1,sp,27
80004b9c:	e61ff06f          	j	800049fc <modbus_recv+0x260>
80004ba0:	00400613          	li	a2,4
80004ba4:	002a0593          	addi	a1,s4,2
80004ba8:	00248513          	addi	a0,s1,2
80004bac:	518090ef          	jal	ra,8000e0c4 <memcpy>
80004bb0:	00600593          	li	a1,6
80004bb4:	00048513          	mv	a0,s1
80004bb8:	8edfe0ef          	jal	ra,800034a4 <add_crc>
80004bbc:	00800413          	li	s0,8
80004bc0:	d21ff06f          	j	800048e0 <modbus_recv+0x144>
80004bc4:	ff7a8613          	addi	a2,s5,-9
80004bc8:	01061613          	slli	a2,a2,0x10
80004bcc:	01065613          	srli	a2,a2,0x10
80004bd0:	007a0593          	addi	a1,s4,7
80004bd4:	000b8513          	mv	a0,s7
80004bd8:	f4cff0ef          	jal	ra,80004324 <modbus_store_reg>
80004bdc:	fc0552e3          	bgez	a0,80004ba0 <modbus_recv+0x404>
80004be0:	ffe00793          	li	a5,-2
80004be4:	00048613          	mv	a2,s1
80004be8:	00700593          	li	a1,7
80004bec:	00f50463          	beq	a0,a5,80004bf4 <modbus_recv+0x458>
80004bf0:	00300593          	li	a1,3
80004bf4:	00090513          	mv	a0,s2
80004bf8:	ebcff0ef          	jal	ra,800042b4 <modbus_error>
80004bfc:	00050413          	mv	s0,a0
80004c00:	e79ff06f          	j	80004a78 <modbus_recv+0x2dc>
80004c04:	00048613          	mv	a2,s1
80004c08:	00100593          	li	a1,1
80004c0c:	fe9ff06f          	j	80004bf4 <modbus_recv+0x458>
80004c10:	80002537          	lui	a0,0x80002
80004c14:	75c50513          	addi	a0,a0,1884 # 8000275c <_ram_heap_end+0xffff075c>
80004c18:	0ed090ef          	jal	ra,8000e504 <iprintf>
80004c1c:	00000413          	li	s0,0
80004c20:	cc1ff06f          	j	800048e0 <modbus_recv+0x144>
80004c24:	80002537          	lui	a0,0x80002
80004c28:	79c50513          	addi	a0,a0,1948 # 8000279c <_ram_heap_end+0xffff079c>
80004c2c:	fedff06f          	j	80004c18 <modbus_recv+0x47c>

80004c30 <mac_init>:
80004c30:	ff010113          	addi	sp,sp,-16
80004c34:	00112623          	sw	ra,12(sp)
80004c38:	00812423          	sw	s0,8(sp)
80004c3c:	02051263          	bnez	a0,80004c60 <mac_init+0x30>
80004c40:	80002537          	lui	a0,0x80002
80004c44:	7d450513          	addi	a0,a0,2004 # 800027d4 <_ram_heap_end+0xffff07d4>
80004c48:	0bd090ef          	jal	ra,8000e504 <iprintf>
80004c4c:	ff000513          	li	a0,-16
80004c50:	00c12083          	lw	ra,12(sp)
80004c54:	00812403          	lw	s0,8(sp)
80004c58:	01010113          	addi	sp,sp,16
80004c5c:	00008067          	ret
80004c60:	800025b7          	lui	a1,0x80002
80004c64:	00050413          	mv	s0,a0
80004c68:	00500613          	li	a2,5
80004c6c:	7f458593          	addi	a1,a1,2036 # 800027f4 <_ram_heap_end+0xffff07f4>
80004c70:	03650513          	addi	a0,a0,54
80004c74:	450090ef          	jal	ra,8000e0c4 <memcpy>
80004c78:	8000b7b7          	lui	a5,0x8000b
80004c7c:	31878793          	addi	a5,a5,792 # 8000b318 <_ram_heap_end+0xffff9318>
80004c80:	00f42a23          	sw	a5,20(s0)
80004c84:	800057b7          	lui	a5,0x80005
80004c88:	ce478793          	addi	a5,a5,-796 # 80004ce4 <_ram_heap_end+0xffff2ce4>
80004c8c:	00f42c23          	sw	a5,24(s0)
80004c90:	00600613          	li	a2,6
80004c94:	9a118593          	addi	a1,gp,-1631 # 80003139 <active_config+0xd>
80004c98:	02e40513          	addi	a0,s0,46
80004c9c:	428090ef          	jal	ra,8000e0c4 <memcpy>
80004ca0:	5dc00793          	li	a5,1500
80004ca4:	02f41623          	sh	a5,44(s0)
80004ca8:	000017b7          	lui	a5,0x1
80004cac:	e0678793          	addi	a5,a5,-506 # e06 <_stack_size+0x606>
80004cb0:	02f41a23          	sh	a5,52(s0)
80004cb4:	00002537          	lui	a0,0x2
80004cb8:	01100793          	li	a5,17
80004cbc:	f0070437          	lui	s0,0xf0070
80004cc0:	00f42023          	sw	a5,0(s0) # f0070000 <_ram_heap_end+0x7005e000>
80004cc4:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
80004cc8:	5f5000ef          	jal	ra,80005abc <delay_us>
80004ccc:	80002537          	lui	a0,0x80002
80004cd0:	00042023          	sw	zero,0(s0)
80004cd4:	7fc50513          	addi	a0,a0,2044 # 800027fc <_ram_heap_end+0xffff07fc>
80004cd8:	02d090ef          	jal	ra,8000e504 <iprintf>
80004cdc:	00000513          	li	a0,0
80004ce0:	f71ff06f          	j	80004c50 <mac_init+0x20>

80004ce4 <mac_tx_packet>:
80004ce4:	00050463          	beqz	a0,80004cec <mac_tx_packet+0x8>
80004ce8:	00059e63          	bnez	a1,80004d04 <mac_tx_packet+0x20>
80004cec:	f0000737          	lui	a4,0xf0000
80004cf0:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
80004cf4:	ff000513          	li	a0,-16
80004cf8:	0027e793          	ori	a5,a5,2
80004cfc:	00f72223          	sw	a5,4(a4)
80004d00:	00008067          	ret
80004d04:	ff010113          	addi	sp,sp,-16
80004d08:	00812423          	sw	s0,8(sp)
80004d0c:	00058413          	mv	s0,a1
80004d10:	00040513          	mv	a0,s0
80004d14:	ffe00593          	li	a1,-2
80004d18:	00112623          	sw	ra,12(sp)
80004d1c:	190020ef          	jal	ra,80006eac <pbuf_header>
80004d20:	00040713          	mv	a4,s0
80004d24:	00000793          	li	a5,0
80004d28:	00a75683          	lhu	a3,10(a4)
80004d2c:	00072703          	lw	a4,0(a4)
80004d30:	00d787b3          	add	a5,a5,a3
80004d34:	fe071ae3          	bnez	a4,80004d28 <mac_tx_packet+0x44>
80004d38:	00379793          	slli	a5,a5,0x3
80004d3c:	f00706b7          	lui	a3,0xf0070
80004d40:	0006a703          	lw	a4,0(a3) # f0070000 <_ram_heap_end+0x7005e000>
80004d44:	00277713          	andi	a4,a4,2
80004d48:	fe070ce3          	beqz	a4,80004d40 <mac_tx_packet+0x5c>
80004d4c:	f0070737          	lui	a4,0xf0070
80004d50:	01472683          	lw	a3,20(a4) # f0070014 <_ram_heap_end+0x7005e014>
80004d54:	fe068ee3          	beqz	a3,80004d50 <mac_tx_packet+0x6c>
80004d58:	00f72823          	sw	a5,16(a4)
80004d5c:	00040693          	mv	a3,s0
80004d60:	00000713          	li	a4,0
80004d64:	00000793          	li	a5,0
80004d68:	00300893          	li	a7,3
80004d6c:	f0070837          	lui	a6,0xf0070
80004d70:	0046a603          	lw	a2,4(a3)
80004d74:	00a6d583          	lhu	a1,10(a3)
80004d78:	00b605b3          	add	a1,a2,a1
80004d7c:	04c59863          	bne	a1,a2,80004dcc <mac_tx_packet+0xe8>
80004d80:	0006a683          	lw	a3,0(a3)
80004d84:	fe0696e3          	bnez	a3,80004d70 <mac_tx_packet+0x8c>
80004d88:	00078a63          	beqz	a5,80004d9c <mac_tx_packet+0xb8>
80004d8c:	f00707b7          	lui	a5,0xf0070
80004d90:	0147a683          	lw	a3,20(a5) # f0070014 <_ram_heap_end+0x7005e014>
80004d94:	fe068ee3          	beqz	a3,80004d90 <mac_tx_packet+0xac>
80004d98:	00e7a823          	sw	a4,16(a5)
80004d9c:	00040513          	mv	a0,s0
80004da0:	00200593          	li	a1,2
80004da4:	108020ef          	jal	ra,80006eac <pbuf_header>
80004da8:	a0c18793          	addi	a5,gp,-1524 # 800031a4 <lwip_stats>
80004dac:	0007a703          	lw	a4,0(a5)
80004db0:	00000513          	li	a0,0
80004db4:	00170713          	addi	a4,a4,1
80004db8:	00e7a023          	sw	a4,0(a5)
80004dbc:	00c12083          	lw	ra,12(sp)
80004dc0:	00812403          	lw	s0,8(sp)
80004dc4:	01010113          	addi	sp,sp,16
80004dc8:	00008067          	ret
80004dcc:	00064503          	lbu	a0,0(a2)
80004dd0:	00379313          	slli	t1,a5,0x3
80004dd4:	00651533          	sll	a0,a0,t1
80004dd8:	00a76733          	or	a4,a4,a0
80004ddc:	01179a63          	bne	a5,a7,80004df0 <mac_tx_packet+0x10c>
80004de0:	01482503          	lw	a0,20(a6) # f0070014 <_ram_heap_end+0x7005e014>
80004de4:	fe050ee3          	beqz	a0,80004de0 <mac_tx_packet+0xfc>
80004de8:	00e82823          	sw	a4,16(a6)
80004dec:	00000713          	li	a4,0
80004df0:	00178793          	addi	a5,a5,1
80004df4:	0037f793          	andi	a5,a5,3
80004df8:	00160613          	addi	a2,a2,1
80004dfc:	f81ff06f          	j	80004d7c <mac_tx_packet+0x98>

80004e00 <sys_now>:
80004e00:	ff010113          	addi	sp,sp,-16
80004e04:	00112623          	sw	ra,12(sp)
80004e08:	f00b07b7          	lui	a5,0xf00b0
80004e0c:	0007a503          	lw	a0,0(a5) # f00b0000 <_ram_heap_end+0x7009e000>
80004e10:	0047a583          	lw	a1,4(a5)
80004e14:	3e800613          	li	a2,1000
80004e18:	00000693          	li	a3,0
80004e1c:	62d070ef          	jal	ra,8000cc48 <__udivdi3>
80004e20:	00c12083          	lw	ra,12(sp)
80004e24:	01010113          	addi	sp,sp,16
80004e28:	00008067          	ret

80004e2c <sys_arch_protect>:
80004e2c:	00008067          	ret

80004e30 <sys_arch_unprotect>:
80004e30:	00008067          	ret

80004e34 <mac_lwip_init>:
80004e34:	ff010113          	addi	sp,sp,-16
80004e38:	00112623          	sw	ra,12(sp)
80004e3c:	00812423          	sw	s0,8(sp)
80004e40:	00912223          	sw	s1,4(sp)
80004e44:	645000ef          	jal	ra,80005c88 <lwip_init>
80004e48:	fb9ff0ef          	jal	ra,80004e00 <sys_now>
80004e4c:	8aa1a223          	sw	a0,-1884(gp) # 8000303c <ts_ipreass>
80004e50:	8aa1a623          	sw	a0,-1876(gp) # 80003044 <ts_etharp>
80004e54:	8000d837          	lui	a6,0x8000d
80004e58:	800057b7          	lui	a5,0x80005
80004e5c:	8fc80813          	addi	a6,a6,-1796 # 8000c8fc <_ram_heap_end+0xffffa8fc>
80004e60:	c3078793          	addi	a5,a5,-976 # 80004c30 <_ram_heap_end+0xffff2c30>
80004e64:	00000713          	li	a4,0
80004e68:	99818693          	addi	a3,gp,-1640 # 80003130 <active_config+0x4>
80004e6c:	99c18613          	addi	a2,gp,-1636 # 80003134 <active_config+0x8>
80004e70:	99418593          	addi	a1,gp,-1644 # 8000312c <active_config>
80004e74:	9b418513          	addi	a0,gp,-1612 # 8000314c <default_netif>
80004e78:	1d5010ef          	jal	ra,8000684c <netif_add>
80004e7c:	02051663          	bnez	a0,80004ea8 <mac_lwip_init+0x74>
80004e80:	80003537          	lui	a0,0x80003
80004e84:	81050513          	addi	a0,a0,-2032 # 80002810 <_ram_heap_end+0xffff0810>
80004e88:	67c090ef          	jal	ra,8000e504 <iprintf>
80004e8c:	fff00493          	li	s1,-1
80004e90:	00c12083          	lw	ra,12(sp)
80004e94:	00812403          	lw	s0,8(sp)
80004e98:	00048513          	mv	a0,s1
80004e9c:	00412483          	lw	s1,4(sp)
80004ea0:	01010113          	addi	sp,sp,16
80004ea4:	00008067          	ret
80004ea8:	9b418513          	addi	a0,gp,-1612 # 8000314c <default_netif>
80004eac:	2d9010ef          	jal	ra,80006984 <netif_set_default>
80004eb0:	9b418513          	addi	a0,gp,-1612 # 8000314c <default_netif>
80004eb4:	99418493          	addi	s1,gp,-1644 # 8000312c <active_config>
80004eb8:	2d5010ef          	jal	ra,8000698c <netif_set_up>
80004ebc:	00c4c783          	lbu	a5,12(s1)
80004ec0:	00000493          	li	s1,0
80004ec4:	0017f793          	andi	a5,a5,1
80004ec8:	fc0784e3          	beqz	a5,80004e90 <mac_lwip_init+0x5c>
80004ecc:	9b418513          	addi	a0,gp,-1612 # 8000314c <default_netif>
80004ed0:	4e0050ef          	jal	ra,8000a3b0 <dhcp_start>
80004ed4:	fbdff06f          	j	80004e90 <mac_lwip_init+0x5c>

80004ed8 <mac_rx_isr>:
80004ed8:	fc010113          	addi	sp,sp,-64
80004edc:	02912a23          	sw	s1,52(sp)
80004ee0:	03512223          	sw	s5,36(sp)
80004ee4:	01712e23          	sw	s7,28(sp)
80004ee8:	00001bb7          	lui	s7,0x1
80004eec:	03312623          	sw	s3,44(sp)
80004ef0:	01812c23          	sw	s8,24(sp)
80004ef4:	01912a23          	sw	s9,20(sp)
80004ef8:	02112e23          	sw	ra,60(sp)
80004efc:	02812c23          	sw	s0,56(sp)
80004f00:	03212823          	sw	s2,48(sp)
80004f04:	03412423          	sw	s4,40(sp)
80004f08:	03612023          	sw	s6,32(sp)
80004f0c:	01a12823          	sw	s10,16(sp)
80004f10:	00000993          	li	s3,0
80004f14:	800b8b93          	addi	s7,s7,-2048 # 800 <_stack_size>
80004f18:	a0c18493          	addi	s1,gp,-1524 # 800031a4 <lwip_stats>
80004f1c:	9b418a93          	addi	s5,gp,-1612 # 8000314c <default_netif>
80004f20:	80003c37          	lui	s8,0x80003
80004f24:	80003cb7          	lui	s9,0x80003
80004f28:	f0070937          	lui	s2,0xf0070
80004f2c:	00092783          	lw	a5,0(s2) # f0070000 <_ram_heap_end+0x7005e000>
80004f30:	0207f793          	andi	a5,a5,32
80004f34:	04078663          	beqz	a5,80004f80 <mac_rx_isr+0xa8>
80004f38:	02092683          	lw	a3,32(s2)
80004f3c:	00768413          	addi	s0,a3,7
80004f40:	00345413          	srli	s0,s0,0x3
80004f44:	068bfa63          	bgeu	s7,s0,80004fb8 <mac_rx_isr+0xe0>
80004f48:	80003537          	lui	a0,0x80003
80004f4c:	00068613          	mv	a2,a3
80004f50:	00040593          	mv	a1,s0
80004f54:	83450513          	addi	a0,a0,-1996 # 80002834 <_ram_heap_end+0xffff0834>
80004f58:	5ac090ef          	jal	ra,8000e504 <iprintf>
80004f5c:	80c1a783          	lw	a5,-2036(gp) # 80002fa4 <_impure_ptr>
80004f60:	0087a503          	lw	a0,8(a5)
80004f64:	39d080ef          	jal	ra,8000db00 <fflush>
80004f68:	01100793          	li	a5,17
80004f6c:	00002537          	lui	a0,0x2
80004f70:	00f92023          	sw	a5,0(s2)
80004f74:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
80004f78:	345000ef          	jal	ra,80005abc <delay_us>
80004f7c:	00092023          	sw	zero,0(s2)
80004f80:	03c12083          	lw	ra,60(sp)
80004f84:	03812403          	lw	s0,56(sp)
80004f88:	03412483          	lw	s1,52(sp)
80004f8c:	03012903          	lw	s2,48(sp)
80004f90:	02c12983          	lw	s3,44(sp)
80004f94:	02812a03          	lw	s4,40(sp)
80004f98:	02412a83          	lw	s5,36(sp)
80004f9c:	02012b03          	lw	s6,32(sp)
80004fa0:	01c12b83          	lw	s7,28(sp)
80004fa4:	01812c03          	lw	s8,24(sp)
80004fa8:	01412c83          	lw	s9,20(sp)
80004fac:	01012d03          	lw	s10,16(sp)
80004fb0:	04010113          	addi	sp,sp,64
80004fb4:	00008067          	ret
80004fb8:	00240d13          	addi	s10,s0,2
80004fbc:	010d1d13          	slli	s10,s10,0x10
80004fc0:	010d5d13          	srli	s10,s10,0x10
80004fc4:	18200613          	li	a2,386
80004fc8:	000d0593          	mv	a1,s10
80004fcc:	00000513          	li	a0,0
80004fd0:	00d12623          	sw	a3,12(sp)
80004fd4:	7d5010ef          	jal	ra,80006fa8 <pbuf_alloc>
80004fd8:	00050913          	mv	s2,a0
80004fdc:	00c12683          	lw	a3,12(sp)
80004fe0:	0a051663          	bnez	a0,8000508c <mac_rx_isr+0x1b4>
80004fe4:	f0000737          	lui	a4,0xf0000
80004fe8:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
80004fec:	80003537          	lui	a0,0x80003
80004ff0:	00040613          	mv	a2,s0
80004ff4:	0027e793          	ori	a5,a5,2
80004ff8:	00f72223          	sw	a5,4(a4)
80004ffc:	01f68713          	addi	a4,a3,31
80005000:	00575713          	srli	a4,a4,0x5
80005004:	000d0593          	mv	a1,s10
80005008:	87450513          	addi	a0,a0,-1932 # 80002874 <_ram_heap_end+0xffff0874>
8000500c:	4f8090ef          	jal	ra,8000e504 <iprintf>
80005010:	a0c18793          	addi	a5,gp,-1524 # 800031a4 <lwip_stats>
80005014:	0187a703          	lw	a4,24(a5)
80005018:	00170713          	addi	a4,a4,1
8000501c:	00e7ac23          	sw	a4,24(a5)
80005020:	00c7a703          	lw	a4,12(a5)
80005024:	00170713          	addi	a4,a4,1
80005028:	00e7a623          	sw	a4,12(a5)
8000502c:	f0070737          	lui	a4,0xf0070
80005030:	04804263          	bgtz	s0,80005074 <mac_rx_isr+0x19c>
80005034:	03812403          	lw	s0,56(sp)
80005038:	03c12083          	lw	ra,60(sp)
8000503c:	03412483          	lw	s1,52(sp)
80005040:	03012903          	lw	s2,48(sp)
80005044:	02c12983          	lw	s3,44(sp)
80005048:	02812a03          	lw	s4,40(sp)
8000504c:	02412a83          	lw	s5,36(sp)
80005050:	02012b03          	lw	s6,32(sp)
80005054:	01c12b83          	lw	s7,28(sp)
80005058:	01812c03          	lw	s8,24(sp)
8000505c:	01412c83          	lw	s9,20(sp)
80005060:	01012d03          	lw	s10,16(sp)
80005064:	80003537          	lui	a0,0x80003
80005068:	8c450513          	addi	a0,a0,-1852 # 800028c4 <_ram_heap_end+0xffff08c4>
8000506c:	04010113          	addi	sp,sp,64
80005070:	4940906f          	j	8000e504 <iprintf>
80005074:	00072783          	lw	a5,0(a4) # f0070000 <_ram_heap_end+0x7005e000>
80005078:	0207f793          	andi	a5,a5,32
8000507c:	fe078ce3          	beqz	a5,80005074 <mac_rx_isr+0x19c>
80005080:	02072783          	lw	a5,32(a4)
80005084:	ffc40413          	addi	s0,s0,-4
80005088:	fa9ff06f          	j	80005030 <mac_rx_isr+0x158>
8000508c:	ffe00593          	li	a1,-2
80005090:	61d010ef          	jal	ra,80006eac <pbuf_header>
80005094:	00000713          	li	a4,0
80005098:	00000793          	li	a5,0
8000509c:	f0070637          	lui	a2,0xf0070
800050a0:	04041a63          	bnez	s0,800050f4 <mac_rx_isr+0x21c>
800050a4:	00200593          	li	a1,2
800050a8:	00090513          	mv	a0,s2
800050ac:	00492a03          	lw	s4,4(s2)
800050b0:	5fd010ef          	jal	ra,80006eac <pbuf_header>
800050b4:	0044a783          	lw	a5,4(s1)
800050b8:	000a8593          	mv	a1,s5
800050bc:	00090513          	mv	a0,s2
800050c0:	00178793          	addi	a5,a5,1
800050c4:	00f4a223          	sw	a5,4(s1)
800050c8:	010aa783          	lw	a5,16(s5)
800050cc:	000780e7          	jalr	a5
800050d0:	00050593          	mv	a1,a0
800050d4:	08050463          	beqz	a0,8000515c <mac_rx_isr+0x284>
800050d8:	f0000737          	lui	a4,0xf0000
800050dc:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
800050e0:	910c0513          	addi	a0,s8,-1776 # 80002910 <_ram_heap_end+0xffff0910>
800050e4:	0027e793          	ori	a5,a5,2
800050e8:	00f72223          	sw	a5,4(a4)
800050ec:	418090ef          	jal	ra,8000e504 <iprintf>
800050f0:	06c0006f          	j	8000515c <mac_rx_isr+0x284>
800050f4:	08099063          	bnez	s3,80005174 <mac_rx_isr+0x29c>
800050f8:	06078863          	beqz	a5,80005168 <mac_rx_isr+0x290>
800050fc:	0007a783          	lw	a5,0(a5)
80005100:	06079663          	bnez	a5,8000516c <mac_rx_isr+0x294>
80005104:	f0000737          	lui	a4,0xf0000
80005108:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
8000510c:	8e4c8513          	addi	a0,s9,-1820 # 800028e4 <_ram_heap_end+0xffff08e4>
80005110:	0027e793          	ori	a5,a5,2
80005114:	00f72223          	sw	a5,4(a4)
80005118:	3ec090ef          	jal	ra,8000e504 <iprintf>
8000511c:	0184a783          	lw	a5,24(s1)
80005120:	f0070737          	lui	a4,0xf0070
80005124:	00178793          	addi	a5,a5,1
80005128:	00f4ac23          	sw	a5,24(s1)
8000512c:	00c4a783          	lw	a5,12(s1)
80005130:	00178793          	addi	a5,a5,1
80005134:	00f4a623          	sw	a5,12(s1)
80005138:	00072783          	lw	a5,0(a4) # f0070000 <_ram_heap_end+0x7005e000>
8000513c:	0207f793          	andi	a5,a5,32
80005140:	fe078ce3          	beqz	a5,80005138 <mac_rx_isr+0x260>
80005144:	02072783          	lw	a5,32(a4)
80005148:	ffc40413          	addi	s0,s0,-4
8000514c:	fe8046e3          	bgtz	s0,80005138 <mac_rx_isr+0x260>
80005150:	00200593          	li	a1,2
80005154:	00090513          	mv	a0,s2
80005158:	555010ef          	jal	ra,80006eac <pbuf_header>
8000515c:	00090513          	mv	a0,s2
80005160:	575010ef          	jal	ra,80006ed4 <pbuf_free>
80005164:	dc5ff06f          	j	80004f28 <mac_rx_isr+0x50>
80005168:	00090793          	mv	a5,s2
8000516c:	00a7d983          	lhu	s3,10(a5)
80005170:	0047aa03          	lw	s4,4(a5)
80005174:	00071a63          	bnez	a4,80005188 <mac_rx_isr+0x2b0>
80005178:	00062683          	lw	a3,0(a2) # f0070000 <_ram_heap_end+0x7005e000>
8000517c:	0206f693          	andi	a3,a3,32
80005180:	fe068ce3          	beqz	a3,80005178 <mac_rx_isr+0x2a0>
80005184:	02062b03          	lw	s6,32(a2)
80005188:	00170713          	addi	a4,a4,1
8000518c:	016a0023          	sb	s6,0(s4)
80005190:	00377713          	andi	a4,a4,3
80005194:	008b5b13          	srli	s6,s6,0x8
80005198:	fff40413          	addi	s0,s0,-1
8000519c:	001a0a13          	addi	s4,s4,1
800051a0:	fff98993          	addi	s3,s3,-1
800051a4:	efdff06f          	j	800050a0 <mac_rx_isr+0x1c8>

800051a8 <mac_poll>:
800051a8:	ff010113          	addi	sp,sp,-16
800051ac:	00812423          	sw	s0,8(sp)
800051b0:	00112623          	sw	ra,12(sp)
800051b4:	00912223          	sw	s1,4(sp)
800051b8:	c49ff0ef          	jal	ra,80004e00 <sys_now>
800051bc:	8ac1a683          	lw	a3,-1876(gp) # 80003044 <ts_etharp>
800051c0:	00050413          	mv	s0,a0
800051c4:	00a6f663          	bgeu	a3,a0,800051d0 <mac_poll+0x28>
800051c8:	8a41a683          	lw	a3,-1884(gp) # 8000303c <ts_ipreass>
800051cc:	02a6e063          	bltu	a3,a0,800051ec <mac_poll+0x44>
800051d0:	8a81a223          	sw	s0,-1884(gp) # 8000303c <ts_ipreass>
800051d4:	8a81a623          	sw	s0,-1876(gp) # 80003044 <ts_etharp>
800051d8:	00c12083          	lw	ra,12(sp)
800051dc:	00812403          	lw	s0,8(sp)
800051e0:	00412483          	lw	s1,4(sp)
800051e4:	01010113          	addi	sp,sp,16
800051e8:	00008067          	ret
800051ec:	8a01a783          	lw	a5,-1888(gp) # 80003038 <ts_dhcp_fine>
800051f0:	1f300713          	li	a4,499
800051f4:	40f507b3          	sub	a5,a0,a5
800051f8:	00f77663          	bgeu	a4,a5,80005204 <mac_poll+0x5c>
800051fc:	55c050ef          	jal	ra,8000a758 <dhcp_fine_tmr>
80005200:	8a81a023          	sw	s0,-1888(gp) # 80003038 <ts_dhcp_fine>
80005204:	89c1a703          	lw	a4,-1892(gp) # 80003034 <ts_dhcp_coarse>
80005208:	0000f7b7          	lui	a5,0xf
8000520c:	a5f78793          	addi	a5,a5,-1441 # ea5f <_stack_size+0xe25f>
80005210:	40e40733          	sub	a4,s0,a4
80005214:	00e7f663          	bgeu	a5,a4,80005220 <mac_poll+0x78>
80005218:	27c050ef          	jal	ra,8000a494 <dhcp_coarse_tmr>
8000521c:	8881ae23          	sw	s0,-1892(gp) # 80003034 <ts_dhcp_coarse>
80005220:	f00607b7          	lui	a5,0xf0060
80005224:	0087a783          	lw	a5,8(a5) # f0060008 <_ram_heap_end+0x7004e008>
80005228:	0047f793          	andi	a5,a5,4
8000522c:	fa0786e3          	beqz	a5,800051d8 <mac_poll+0x30>
80005230:	80003537          	lui	a0,0x80003
80005234:	94050513          	addi	a0,a0,-1728 # 80002940 <_ram_heap_end+0xffff0940>
80005238:	2cc090ef          	jal	ra,8000e504 <iprintf>
8000523c:	00812403          	lw	s0,8(sp)
80005240:	00c12083          	lw	ra,12(sp)
80005244:	00412483          	lw	s1,4(sp)
80005248:	01010113          	addi	sp,sp,16
8000524c:	c8dff06f          	j	80004ed8 <mac_rx_isr>

80005250 <mac_print_stats>:
80005250:	ff010113          	addi	sp,sp,-16
80005254:	9b818513          	addi	a0,gp,-1608 # 80003150 <default_netif+0x4>
80005258:	00112623          	sw	ra,12(sp)
8000525c:	694070ef          	jal	ra,8000c8f0 <ip4addr_ntoa>
80005260:	a0c18613          	addi	a2,gp,-1524 # 800031a4 <lwip_stats>
80005264:	01062883          	lw	a7,16(a2)
80005268:	01462803          	lw	a6,20(a2)
8000526c:	00c62783          	lw	a5,12(a2)
80005270:	02862703          	lw	a4,40(a2)
80005274:	00062683          	lw	a3,0(a2)
80005278:	00c12083          	lw	ra,12(sp)
8000527c:	00462603          	lw	a2,4(a2)
80005280:	00050593          	mv	a1,a0
80005284:	80003537          	lui	a0,0x80003
80005288:	96050513          	addi	a0,a0,-1696 # 80002960 <_ram_heap_end+0xffff0960>
8000528c:	01010113          	addi	sp,sp,16
80005290:	2740906f          	j	8000e504 <iprintf>

80005294 <hub_init>:
80005294:	fe010113          	addi	sp,sp,-32
80005298:	00912a23          	sw	s1,20(sp)
8000529c:	800034b7          	lui	s1,0x80003
800052a0:	f2c4c783          	lbu	a5,-212(s1) # 80002f2c <_ram_heap_end+0xffff0f2c>
800052a4:	00112e23          	sw	ra,28(sp)
800052a8:	00812c23          	sw	s0,24(sp)
800052ac:	01212823          	sw	s2,16(sp)
800052b0:	01312623          	sw	s3,12(sp)
800052b4:	01412423          	sw	s4,8(sp)
800052b8:	01512223          	sw	s5,4(sp)
800052bc:	01612023          	sw	s6,0(sp)
800052c0:	f2c48493          	addi	s1,s1,-212
800052c4:	04f50063          	beq	a0,a5,80005304 <hub_init+0x70>
800052c8:	0054c703          	lbu	a4,5(s1)
800052cc:	fff00793          	li	a5,-1
800052d0:	00100a13          	li	s4,1
800052d4:	02e50a63          	beq	a0,a4,80005308 <hub_init+0x74>
800052d8:	01c12083          	lw	ra,28(sp)
800052dc:	01812403          	lw	s0,24(sp)
800052e0:	01412483          	lw	s1,20(sp)
800052e4:	01012903          	lw	s2,16(sp)
800052e8:	00c12983          	lw	s3,12(sp)
800052ec:	00812a03          	lw	s4,8(sp)
800052f0:	00412a83          	lw	s5,4(sp)
800052f4:	00012b03          	lw	s6,0(sp)
800052f8:	00078513          	mv	a0,a5
800052fc:	02010113          	addi	sp,sp,32
80005300:	00008067          	ret
80005304:	00000a13          	li	s4,0
80005308:	002a1993          	slli	s3,s4,0x2
8000530c:	014987b3          	add	a5,s3,s4
80005310:	00f487b3          	add	a5,s1,a5
80005314:	0017c403          	lbu	s0,1(a5)
80005318:	0027c903          	lbu	s2,2(a5)
8000531c:	0037ca83          	lbu	s5,3(a5)
80005320:	00040513          	mv	a0,s0
80005324:	00090593          	mv	a1,s2
80005328:	0047cb03          	lbu	s6,4(a5)
8000532c:	6f1070ef          	jal	ra,8000d21c <__mulsi3>
80005330:	000a8593          	mv	a1,s5
80005334:	6e9070ef          	jal	ra,8000d21c <__mulsi3>
80005338:	000b0593          	mv	a1,s6
8000533c:	6e1070ef          	jal	ra,8000d21c <__mulsi3>
80005340:	40355513          	srai	a0,a0,0x3
80005344:	8aa1ac23          	sw	a0,-1864(gp) # 80003050 <hub_frame_size>
80005348:	8a81aa23          	sw	s0,-1868(gp) # 8000304c <hub_frame_width>
8000534c:	000a8593          	mv	a1,s5
80005350:	00090513          	mv	a0,s2
80005354:	6c9070ef          	jal	ra,8000d21c <__mulsi3>
80005358:	8aa1a823          	sw	a0,-1872(gp) # 80003048 <hub_frame_height>
8000535c:	f00547b7          	lui	a5,0xf0054
80005360:	0007a023          	sw	zero,0(a5) # f0054000 <_ram_heap_end+0x70042000>
80005364:	000b0593          	mv	a1,s6
80005368:	00040513          	mv	a0,s0
8000536c:	6b1070ef          	jal	ra,8000d21c <__mulsi3>
80005370:	000a8593          	mv	a1,s5
80005374:	6a9070ef          	jal	ra,8000d21c <__mulsi3>
80005378:	00000693          	li	a3,0
8000537c:	00000713          	li	a4,0
80005380:	f0050637          	lui	a2,0xf0050
80005384:	000015b7          	lui	a1,0x1
80005388:	03274e63          	blt	a4,s2,800053c4 <hub_init+0x130>
8000538c:	014989b3          	add	s3,s3,s4
80005390:	013484b3          	add	s1,s1,s3
80005394:	0004c783          	lbu	a5,0(s1)
80005398:	01041413          	slli	s0,s0,0x10
8000539c:	01891913          	slli	s2,s2,0x18
800053a0:	01246433          	or	s0,s0,s2
800053a4:	00f46433          	or	s0,s0,a5
800053a8:	000107b7          	lui	a5,0x10
800053ac:	f8078793          	addi	a5,a5,-128 # ff80 <_stack_size+0xf780>
800053b0:	00f46433          	or	s0,s0,a5
800053b4:	f00547b7          	lui	a5,0xf0054
800053b8:	0087a023          	sw	s0,0(a5) # f0054000 <_ram_heap_end+0x70042000>
800053bc:	00000793          	li	a5,0
800053c0:	f19ff06f          	j	800052d8 <hub_init+0x44>
800053c4:	00b707b3          	add	a5,a4,a1
800053c8:	00279793          	slli	a5,a5,0x2
800053cc:	4036d813          	srai	a6,a3,0x3
800053d0:	00f607b3          	add	a5,a2,a5
800053d4:	0107a223          	sw	a6,4(a5)
800053d8:	00170713          	addi	a4,a4,1
800053dc:	00a686b3          	add	a3,a3,a0
800053e0:	fa9ff06f          	j	80005388 <hub_init+0xf4>

800053e4 <hub_print_char>:
800053e4:	f9010113          	addi	sp,sp,-112
800053e8:	05812423          	sw	s8,72(sp)
800053ec:	00078c13          	mv	s8,a5
800053f0:	07812783          	lw	a5,120(sp)
800053f4:	06912223          	sw	s1,100(sp)
800053f8:	05312e23          	sw	s3,92(sp)
800053fc:	41f7d493          	srai	s1,a5,0x1f
80005400:	0074f493          	andi	s1,s1,7
80005404:	00f484b3          	add	s1,s1,a5
80005408:	05412c23          	sw	s4,88(sp)
8000540c:	02a12023          	sw	a0,32(sp)
80005410:	06112623          	sw	ra,108(sp)
80005414:	06812423          	sw	s0,104(sp)
80005418:	07212023          	sw	s2,96(sp)
8000541c:	05512a23          	sw	s5,84(sp)
80005420:	05612823          	sw	s6,80(sp)
80005424:	05712623          	sw	s7,76(sp)
80005428:	05912223          	sw	s9,68(sp)
8000542c:	05a12023          	sw	s10,64(sp)
80005430:	03b12e23          	sw	s11,60(sp)
80005434:	02c12223          	sw	a2,36(sp)
80005438:	02e12423          	sw	a4,40(sp)
8000543c:	03012623          	sw	a6,44(sp)
80005440:	0077f793          	andi	a5,a5,7
80005444:	00058513          	mv	a0,a1
80005448:	00068993          	mv	s3,a3
8000544c:	00088a13          	mv	s4,a7
80005450:	4034d493          	srai	s1,s1,0x3
80005454:	00078463          	beqz	a5,8000545c <hub_print_char+0x78>
80005458:	00148493          	addi	s1,s1,1
8000545c:	07412583          	lw	a1,116(sp)
80005460:	00000b93          	li	s7,0
80005464:	5b9070ef          	jal	ra,8000d21c <__mulsi3>
80005468:	00048593          	mv	a1,s1
8000546c:	5b1070ef          	jal	ra,8000d21c <__mulsi3>
80005470:	07012a83          	lw	s5,112(sp)
80005474:	003c1793          	slli	a5,s8,0x3
80005478:	00098593          	mv	a1,s3
8000547c:	00aa8ab3          	add	s5,s5,a0
80005480:	000c0513          	mv	a0,s8
80005484:	00f12e23          	sw	a5,28(sp)
80005488:	595070ef          	jal	ra,8000d21c <__mulsi3>
8000548c:	00a12823          	sw	a0,16(sp)
80005490:	049bc063          	blt	s7,s1,800054d0 <hub_print_char+0xec>
80005494:	06c12083          	lw	ra,108(sp)
80005498:	06812403          	lw	s0,104(sp)
8000549c:	06412483          	lw	s1,100(sp)
800054a0:	06012903          	lw	s2,96(sp)
800054a4:	05c12983          	lw	s3,92(sp)
800054a8:	05812a03          	lw	s4,88(sp)
800054ac:	05412a83          	lw	s5,84(sp)
800054b0:	05012b03          	lw	s6,80(sp)
800054b4:	04c12b83          	lw	s7,76(sp)
800054b8:	04812c03          	lw	s8,72(sp)
800054bc:	04412c83          	lw	s9,68(sp)
800054c0:	04012d03          	lw	s10,64(sp)
800054c4:	03c12d83          	lw	s11,60(sp)
800054c8:	07010113          	addi	sp,sp,112
800054cc:	00008067          	ret
800054d0:	07812703          	lw	a4,120(sp)
800054d4:	003b9793          	slli	a5,s7,0x3
800054d8:	40f707b3          	sub	a5,a4,a5
800054dc:	00f12623          	sw	a5,12(sp)
800054e0:	00c12703          	lw	a4,12(sp)
800054e4:	00800793          	li	a5,8
800054e8:	00e7d463          	bge	a5,a4,800054f0 <hub_print_char+0x10c>
800054ec:	00f12623          	sw	a5,12(sp)
800054f0:	02412b03          	lw	s6,36(sp)
800054f4:	00000c93          	li	s9,0
800054f8:	07412783          	lw	a5,116(sp)
800054fc:	02fcc263          	blt	s9,a5,80005520 <hub_print_char+0x13c>
80005500:	00fa8ab3          	add	s5,s5,a5
80005504:	01c12703          	lw	a4,28(sp)
80005508:	01012783          	lw	a5,16(sp)
8000550c:	001b8b93          	addi	s7,s7,1
80005510:	00898993          	addi	s3,s3,8
80005514:	00e787b3          	add	a5,a5,a4
80005518:	00f12823          	sw	a5,16(sp)
8000551c:	f75ff06f          	j	80005490 <hub_print_char+0xac>
80005520:	020b4863          	bltz	s6,80005550 <hub_print_char+0x16c>
80005524:	038b5663          	bge	s6,s8,80005550 <hub_print_char+0x16c>
80005528:	019a87b3          	add	a5,s5,s9
8000552c:	0007c783          	lbu	a5,0(a5)
80005530:	00000d13          	li	s10,0
80005534:	00f12c23          	sw	a5,24(sp)
80005538:	01012783          	lw	a5,16(sp)
8000553c:	00fb0db3          	add	s11,s6,a5
80005540:	00100793          	li	a5,1
80005544:	00f12423          	sw	a5,8(sp)
80005548:	00c12783          	lw	a5,12(sp)
8000554c:	00fd4863          	blt	s10,a5,8000555c <hub_print_char+0x178>
80005550:	001b0b13          	addi	s6,s6,1
80005554:	001c8c93          	addi	s9,s9,1
80005558:	fa1ff06f          	j	800054f8 <hub_print_char+0x114>
8000555c:	013d07b3          	add	a5,s10,s3
80005560:	0407ca63          	bltz	a5,800055b4 <hub_print_char+0x1d0>
80005564:	02c12703          	lw	a4,44(sp)
80005568:	04e7d663          	bge	a5,a4,800055b4 <hub_print_char+0x1d0>
8000556c:	00c00793          	li	a5,12
80005570:	06fa0063          	beq	s4,a5,800055d0 <hub_print_char+0x1ec>
80005574:	04b00793          	li	a5,75
80005578:	08fa0a63          	beq	s4,a5,8000560c <hub_print_char+0x228>
8000557c:	01412783          	lw	a5,20(sp)
80005580:	00279913          	slli	s2,a5,0x2
80005584:	02012783          	lw	a5,32(sp)
80005588:	01278933          	add	s2,a5,s2
8000558c:	00092503          	lw	a0,0(s2)
80005590:	684070ef          	jal	ra,8000cc14 <__bswapsi2>
80005594:	01812783          	lw	a5,24(sp)
80005598:	00812703          	lw	a4,8(sp)
8000559c:	00e7f7b3          	and	a5,a5,a4
800055a0:	10078263          	beqz	a5,800056a4 <hub_print_char+0x2c0>
800055a4:	00c00793          	li	a5,12
800055a8:	0afa0663          	beq	s4,a5,80005654 <hub_print_char+0x270>
800055ac:	04b00793          	li	a5,75
800055b0:	0afa0a63          	beq	s4,a5,80005664 <hub_print_char+0x280>
800055b4:	00812783          	lw	a5,8(sp)
800055b8:	001d0d13          	addi	s10,s10,1
800055bc:	018d8db3          	add	s11,s11,s8
800055c0:	00179793          	slli	a5,a5,0x1
800055c4:	0ff7f793          	andi	a5,a5,255
800055c8:	00f12423          	sw	a5,8(sp)
800055cc:	f7dff06f          	j	80005548 <hub_print_char+0x164>
800055d0:	41fdd793          	srai	a5,s11,0x1f
800055d4:	01f7f793          	andi	a5,a5,31
800055d8:	01b787b3          	add	a5,a5,s11
800055dc:	4057d793          	srai	a5,a5,0x5
800055e0:	00f12a23          	sw	a5,20(sp)
800055e4:	800007b7          	lui	a5,0x80000
800055e8:	01f78793          	addi	a5,a5,31 # 8000001f <_ram_heap_end+0xfffee01f>
800055ec:	00fdf433          	and	s0,s11,a5
800055f0:	00045863          	bgez	s0,80005600 <hub_print_char+0x21c>
800055f4:	fff40413          	addi	s0,s0,-1
800055f8:	fe046413          	ori	s0,s0,-32
800055fc:	00140413          	addi	s0,s0,1
80005600:	800007b7          	lui	a5,0x80000
80005604:	0087d433          	srl	s0,a5,s0
80005608:	f75ff06f          	j	8000557c <hub_print_char+0x198>
8000560c:	41fdd793          	srai	a5,s11,0x1f
80005610:	0037f793          	andi	a5,a5,3
80005614:	01b787b3          	add	a5,a5,s11
80005618:	4027d793          	srai	a5,a5,0x2
8000561c:	00f12a23          	sw	a5,20(sp)
80005620:	800007b7          	lui	a5,0x80000
80005624:	00378793          	addi	a5,a5,3 # 80000003 <_ram_heap_end+0xfffee003>
80005628:	00fdf433          	and	s0,s11,a5
8000562c:	00045863          	bgez	s0,8000563c <hub_print_char+0x258>
80005630:	fff40413          	addi	s0,s0,-1
80005634:	ffc46413          	ori	s0,s0,-4
80005638:	00140413          	addi	s0,s0,1
8000563c:	00300793          	li	a5,3
80005640:	40878433          	sub	s0,a5,s0
80005644:	00341413          	slli	s0,s0,0x3
80005648:	0ff00793          	li	a5,255
8000564c:	00879433          	sll	s0,a5,s0
80005650:	f2dff06f          	j	8000557c <hub_print_char+0x198>
80005654:	00a46533          	or	a0,s0,a0
80005658:	5bc070ef          	jal	ra,8000cc14 <__bswapsi2>
8000565c:	00a92023          	sw	a0,0(s2)
80005660:	f55ff06f          	j	800055b4 <hub_print_char+0x1d0>
80005664:	fff44793          	not	a5,s0
80005668:	00a7f533          	and	a0,a5,a0
8000566c:	800007b7          	lui	a5,0x80000
80005670:	00378793          	addi	a5,a5,3 # 80000003 <_ram_heap_end+0xfffee003>
80005674:	00fdf7b3          	and	a5,s11,a5
80005678:	0007d863          	bgez	a5,80005688 <hub_print_char+0x2a4>
8000567c:	fff78793          	addi	a5,a5,-1
80005680:	ffc7e793          	ori	a5,a5,-4
80005684:	00178793          	addi	a5,a5,1
80005688:	00300713          	li	a4,3
8000568c:	40f707b3          	sub	a5,a4,a5
80005690:	02812703          	lw	a4,40(sp)
80005694:	00379793          	slli	a5,a5,0x3
80005698:	00f717b3          	sll	a5,a4,a5
8000569c:	00a7e533          	or	a0,a5,a0
800056a0:	fb9ff06f          	j	80005658 <hub_print_char+0x274>
800056a4:	00c00793          	li	a5,12
800056a8:	00fa0663          	beq	s4,a5,800056b4 <hub_print_char+0x2d0>
800056ac:	04b00793          	li	a5,75
800056b0:	f0fa12e3          	bne	s4,a5,800055b4 <hub_print_char+0x1d0>
800056b4:	fff44793          	not	a5,s0
800056b8:	00a7f533          	and	a0,a5,a0
800056bc:	f9dff06f          	j	80005658 <hub_print_char+0x274>

800056c0 <hub_print>:
800056c0:	fb010113          	addi	sp,sp,-80
800056c4:	04812423          	sw	s0,72(sp)
800056c8:	04912223          	sw	s1,68(sp)
800056cc:	05212023          	sw	s2,64(sp)
800056d0:	03312e23          	sw	s3,60(sp)
800056d4:	03412c23          	sw	s4,56(sp)
800056d8:	03512a23          	sw	s5,52(sp)
800056dc:	03612823          	sw	s6,48(sp)
800056e0:	03712623          	sw	s7,44(sp)
800056e4:	03812423          	sw	s8,40(sp)
800056e8:	03912223          	sw	s9,36(sp)
800056ec:	03a12023          	sw	s10,32(sp)
800056f0:	01b12e23          	sw	s11,28(sp)
800056f4:	04112623          	sw	ra,76(sp)
800056f8:	00058a13          	mv	s4,a1
800056fc:	00068a93          	mv	s5,a3
80005700:	00070993          	mv	s3,a4
80005704:	00078b13          	mv	s6,a5
80005708:	00080913          	mv	s2,a6
8000570c:	00088b93          	mv	s7,a7
80005710:	00050493          	mv	s1,a0
80005714:	00000413          	li	s0,0
80005718:	f0054c37          	lui	s8,0xf0054
8000571c:	0ff67d93          	andi	s11,a2,255
80005720:	05344063          	blt	s0,s3,80005760 <hub_print+0xa0>
80005724:	04c12083          	lw	ra,76(sp)
80005728:	04812403          	lw	s0,72(sp)
8000572c:	04412483          	lw	s1,68(sp)
80005730:	04012903          	lw	s2,64(sp)
80005734:	03c12983          	lw	s3,60(sp)
80005738:	03812a03          	lw	s4,56(sp)
8000573c:	03412a83          	lw	s5,52(sp)
80005740:	03012b03          	lw	s6,48(sp)
80005744:	02c12b83          	lw	s7,44(sp)
80005748:	02812c03          	lw	s8,40(sp)
8000574c:	02412c83          	lw	s9,36(sp)
80005750:	02012d03          	lw	s10,32(sp)
80005754:	01c12d83          	lw	s11,28(sp)
80005758:	05010113          	addi	sp,sp,80
8000575c:	00008067          	ret
80005760:	000c2883          	lw	a7,0(s8) # f0054000 <_ram_heap_end+0x70042000>
80005764:	008a85b3          	add	a1,s5,s0
80005768:	01712423          	sw	s7,8(sp)
8000576c:	01212223          	sw	s2,4(sp)
80005770:	01612023          	sw	s6,0(sp)
80005774:	8b01a803          	lw	a6,-1872(gp) # 80003048 <hub_frame_height>
80005778:	8b41a783          	lw	a5,-1868(gp) # 8000304c <hub_frame_width>
8000577c:	0005c583          	lbu	a1,0(a1) # 1000 <_stack_size+0x800>
80005780:	00048613          	mv	a2,s1
80005784:	07f8f893          	andi	a7,a7,127
80005788:	000d8713          	mv	a4,s11
8000578c:	000a0693          	mv	a3,s4
80005790:	f0050537          	lui	a0,0xf0050
80005794:	c51ff0ef          	jal	ra,800053e4 <hub_print_char>
80005798:	00140413          	addi	s0,s0,1
8000579c:	012484b3          	add	s1,s1,s2
800057a0:	f81ff06f          	j	80005720 <hub_print+0x60>

800057a4 <modbus_udp_init>:
800057a4:	ff010113          	addi	sp,sp,-16
800057a8:	02e00513          	li	a0,46
800057ac:	00912223          	sw	s1,4(sp)
800057b0:	00112623          	sw	ra,12(sp)
800057b4:	00812423          	sw	s0,8(sp)
800057b8:	368030ef          	jal	ra,80008b20 <udp_new_ip_type>
800057bc:	8aa1ae23          	sw	a0,-1860(gp) # 80003054 <modbus_udp_pcb>
800057c0:	02051663          	bnez	a0,800057ec <modbus_udp_init+0x48>
800057c4:	80003537          	lui	a0,0x80003
800057c8:	9bc50513          	addi	a0,a0,-1604 # 800029bc <_ram_heap_end+0xffff09bc>
800057cc:	539080ef          	jal	ra,8000e504 <iprintf>
800057d0:	fff00413          	li	s0,-1
800057d4:	00040513          	mv	a0,s0
800057d8:	00c12083          	lw	ra,12(sp)
800057dc:	00812403          	lw	s0,8(sp)
800057e0:	00412483          	lw	s1,4(sp)
800057e4:	01010113          	addi	sp,sp,16
800057e8:	00008067          	ret
800057ec:	7d100613          	li	a2,2001
800057f0:	84818593          	addi	a1,gp,-1976 # 80002fe0 <ip_addr_any>
800057f4:	59d020ef          	jal	ra,80008590 <udp_bind>
800057f8:	00050413          	mv	s0,a0
800057fc:	00050e63          	beqz	a0,80005818 <modbus_udp_init+0x74>
80005800:	80003537          	lui	a0,0x80003
80005804:	9ec50513          	addi	a0,a0,-1556 # 800029ec <_ram_heap_end+0xffff09ec>
80005808:	4fd080ef          	jal	ra,8000e504 <iprintf>
8000580c:	8bc1a503          	lw	a0,-1860(gp) # 80003054 <modbus_udp_pcb>
80005810:	27c030ef          	jal	ra,80008a8c <udp_remove>
80005814:	fc1ff06f          	j	800057d4 <modbus_udp_init+0x30>
80005818:	8bc1a503          	lw	a0,-1860(gp) # 80003054 <modbus_udp_pcb>
8000581c:	800065b7          	lui	a1,0x80006
80005820:	00000613          	li	a2,0
80005824:	99458593          	addi	a1,a1,-1644 # 80005994 <_ram_heap_end+0xffff3994>
80005828:	254030ef          	jal	ra,80008a7c <udp_recv>
8000582c:	80003537          	lui	a0,0x80003
80005830:	a1850513          	addi	a0,a0,-1512 # 80002a18 <_ram_heap_end+0xffff0a18>
80005834:	4d1080ef          	jal	ra,8000e504 <iprintf>
80005838:	f9dff06f          	j	800057d4 <modbus_udp_init+0x30>

8000583c <modbus_udp_send>:
8000583c:	fe010113          	addi	sp,sp,-32
80005840:	01212823          	sw	s2,16(sp)
80005844:	00168913          	addi	s2,a3,1
80005848:	01412423          	sw	s4,8(sp)
8000584c:	00058a13          	mv	s4,a1
80005850:	01091593          	slli	a1,s2,0x10
80005854:	01312623          	sw	s3,12(sp)
80005858:	01512223          	sw	s5,4(sp)
8000585c:	00050993          	mv	s3,a0
80005860:	00060a93          	mv	s5,a2
80005864:	0105d593          	srli	a1,a1,0x10
80005868:	28000613          	li	a2,640
8000586c:	03800513          	li	a0,56
80005870:	00912a23          	sw	s1,20(sp)
80005874:	00112e23          	sw	ra,28(sp)
80005878:	00812c23          	sw	s0,24(sp)
8000587c:	00068493          	mv	s1,a3
80005880:	728010ef          	jal	ra,80006fa8 <pbuf_alloc>
80005884:	04051063          	bnez	a0,800058c4 <modbus_udp_send+0x88>
80005888:	f0000737          	lui	a4,0xf0000
8000588c:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
80005890:	80003537          	lui	a0,0x80003
80005894:	a3450513          	addi	a0,a0,-1484 # 80002a34 <_ram_heap_end+0xffff0a34>
80005898:	ffd7f793          	andi	a5,a5,-3
8000589c:	00f72223          	sw	a5,4(a4)
800058a0:	01812403          	lw	s0,24(sp)
800058a4:	01c12083          	lw	ra,28(sp)
800058a8:	01412483          	lw	s1,20(sp)
800058ac:	01012903          	lw	s2,16(sp)
800058b0:	00c12983          	lw	s3,12(sp)
800058b4:	00812a03          	lw	s4,8(sp)
800058b8:	00412a83          	lw	s5,4(sp)
800058bc:	02010113          	addi	sp,sp,32
800058c0:	4450806f          	j	8000e504 <iprintf>
800058c4:	00452783          	lw	a5,4(a0)
800058c8:	00050413          	mv	s0,a0
800058cc:	00078663          	beqz	a5,800058d8 <modbus_udp_send+0x9c>
800058d0:	00a55703          	lhu	a4,10(a0)
800058d4:	05277463          	bgeu	a4,s2,8000591c <modbus_udp_send+0xe0>
800058d8:	f0000737          	lui	a4,0xf0000
800058dc:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
800058e0:	80003537          	lui	a0,0x80003
800058e4:	a6450513          	addi	a0,a0,-1436 # 80002a64 <_ram_heap_end+0xffff0a64>
800058e8:	ffd7f793          	andi	a5,a5,-3
800058ec:	00f72223          	sw	a5,4(a4)
800058f0:	00a45603          	lhu	a2,10(s0)
800058f4:	00442583          	lw	a1,4(s0)
800058f8:	01812403          	lw	s0,24(sp)
800058fc:	01c12083          	lw	ra,28(sp)
80005900:	01412483          	lw	s1,20(sp)
80005904:	01012903          	lw	s2,16(sp)
80005908:	00c12983          	lw	s3,12(sp)
8000590c:	00812a03          	lw	s4,8(sp)
80005910:	00412a83          	lw	s5,4(sp)
80005914:	02010113          	addi	sp,sp,32
80005918:	3ed0806f          	j	8000e504 <iprintf>
8000591c:	00048613          	mv	a2,s1
80005920:	000a8593          	mv	a1,s5
80005924:	00078513          	mv	a0,a5
80005928:	79c080ef          	jal	ra,8000e0c4 <memcpy>
8000592c:	009507b3          	add	a5,a0,s1
80005930:	00078023          	sb	zero,0(a5)
80005934:	8bc1a503          	lw	a0,-1860(gp) # 80003054 <modbus_udp_pcb>
80005938:	00040593          	mv	a1,s0
8000593c:	000a0693          	mv	a3,s4
80005940:	00098613          	mv	a2,s3
80005944:	77d020ef          	jal	ra,800088c0 <udp_sendto>
80005948:	00050593          	mv	a1,a0
8000594c:	02050063          	beqz	a0,8000596c <modbus_udp_send+0x130>
80005950:	f0000737          	lui	a4,0xf0000
80005954:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
80005958:	80003537          	lui	a0,0x80003
8000595c:	a9c50513          	addi	a0,a0,-1380 # 80002a9c <_ram_heap_end+0xffff0a9c>
80005960:	ffd7f793          	andi	a5,a5,-3
80005964:	00f72223          	sw	a5,4(a4)
80005968:	39d080ef          	jal	ra,8000e504 <iprintf>
8000596c:	00040513          	mv	a0,s0
80005970:	01812403          	lw	s0,24(sp)
80005974:	01c12083          	lw	ra,28(sp)
80005978:	01412483          	lw	s1,20(sp)
8000597c:	01012903          	lw	s2,16(sp)
80005980:	00c12983          	lw	s3,12(sp)
80005984:	00812a03          	lw	s4,8(sp)
80005988:	00412a83          	lw	s5,4(sp)
8000598c:	02010113          	addi	sp,sp,32
80005990:	5440106f          	j	80006ed4 <pbuf_free>

80005994 <modbus_udp_recv>:
80005994:	f6010113          	addi	sp,sp,-160
80005998:	08812c23          	sw	s0,152(sp)
8000599c:	00060413          	mv	s0,a2
800059a0:	00a45583          	lhu	a1,10(s0)
800059a4:	00442503          	lw	a0,4(s0)
800059a8:	01010613          	addi	a2,sp,16
800059ac:	00e12623          	sw	a4,12(sp)
800059b0:	08112e23          	sw	ra,156(sp)
800059b4:	08912a23          	sw	s1,148(sp)
800059b8:	00068493          	mv	s1,a3
800059bc:	de1fe0ef          	jal	ra,8000479c <modbus_recv>
800059c0:	00a12423          	sw	a0,8(sp)
800059c4:	00040513          	mv	a0,s0
800059c8:	50c010ef          	jal	ra,80006ed4 <pbuf_free>
800059cc:	00812683          	lw	a3,8(sp)
800059d0:	00c12703          	lw	a4,12(sp)
800059d4:	00068a63          	beqz	a3,800059e8 <modbus_udp_recv+0x54>
800059d8:	01010613          	addi	a2,sp,16
800059dc:	00070593          	mv	a1,a4
800059e0:	00048513          	mv	a0,s1
800059e4:	e59ff0ef          	jal	ra,8000583c <modbus_udp_send>
800059e8:	09c12083          	lw	ra,156(sp)
800059ec:	09812403          	lw	s0,152(sp)
800059f0:	09412483          	lw	s1,148(sp)
800059f4:	0a010113          	addi	sp,sp,160
800059f8:	00008067          	ret

800059fc <i2c_init>:
800059fc:	0fa00793          	li	a5,250
80005a00:	00f52423          	sw	a5,8(a0)
80005a04:	00008067          	ret

80005a08 <i2c_wait_for_busy>:
80005a08:	00000793          	li	a5,0
80005a0c:	00b7c663          	blt	a5,a1,80005a18 <i2c_wait_for_busy+0x10>
80005a10:	00000513          	li	a0,0
80005a14:	00008067          	ret
80005a18:	00c52703          	lw	a4,12(a0)
80005a1c:	00277713          	andi	a4,a4,2
80005a20:	00071663          	bnez	a4,80005a2c <i2c_wait_for_busy+0x24>
80005a24:	00178793          	addi	a5,a5,1
80005a28:	fe5ff06f          	j	80005a0c <i2c_wait_for_busy+0x4>
80005a2c:	00100513          	li	a0,1
80005a30:	00008067          	ret

80005a34 <i2c_wait_for_release>:
80005a34:	00000793          	li	a5,0
80005a38:	00b7c663          	blt	a5,a1,80005a44 <i2c_wait_for_release+0x10>
80005a3c:	00000513          	li	a0,0
80005a40:	00008067          	ret
80005a44:	00c52703          	lw	a4,12(a0)
80005a48:	00277713          	andi	a4,a4,2
80005a4c:	00070663          	beqz	a4,80005a58 <i2c_wait_for_release+0x24>
80005a50:	00178793          	addi	a5,a5,1
80005a54:	fe5ff06f          	j	80005a38 <i2c_wait_for_release+0x4>
80005a58:	00100513          	li	a0,1
80005a5c:	00008067          	ret

80005a60 <__malloc_lock>:
80005a60:	00008067          	ret

80005a64 <__malloc_unlock>:
80005a64:	00008067          	ret

80005a68 <init_sbrk>:
80005a68:	02051463          	bnez	a0,80005a90 <init_sbrk+0x28>
80005a6c:	80011737          	lui	a4,0x80011
80005a70:	35070713          	addi	a4,a4,848 # 80011350 <_ram_heap_end+0xfffff350>
80005a74:	8ce1a223          	sw	a4,-1852(gp) # 8000305c <heap_start>
80005a78:	80012737          	lui	a4,0x80012
80005a7c:	00070713          	mv	a4,a4
80005a80:	8ce1a023          	sw	a4,-1856(gp) # 80003058 <heap_end>
80005a84:	8c41a703          	lw	a4,-1852(gp) # 8000305c <heap_start>
80005a88:	8ce1a423          	sw	a4,-1848(gp) # 80003060 <sbrk_heap_end>
80005a8c:	00008067          	ret
80005a90:	00259593          	slli	a1,a1,0x2
80005a94:	8ca1a223          	sw	a0,-1852(gp) # 8000305c <heap_start>
80005a98:	00b50533          	add	a0,a0,a1
80005a9c:	8ca1a023          	sw	a0,-1856(gp) # 80003058 <heap_end>
80005aa0:	fe5ff06f          	j	80005a84 <init_sbrk+0x1c>

80005aa4 <delay>:
80005aa4:	00000793          	li	a5,0
80005aa8:	00a79463          	bne	a5,a0,80005ab0 <delay+0xc>
80005aac:	00008067          	ret
80005ab0:	00060613          	mv	a2,a2
80005ab4:	00178793          	addi	a5,a5,1
80005ab8:	ff1ff06f          	j	80005aa8 <delay+0x4>

80005abc <delay_us>:
80005abc:	f00b07b7          	lui	a5,0xf00b0
80005ac0:	0007a803          	lw	a6,0(a5) # f00b0000 <_ram_heap_end+0x7009e000>
80005ac4:	0047a883          	lw	a7,4(a5)
80005ac8:	f00b0637          	lui	a2,0xf00b0
80005acc:	00062303          	lw	t1,0(a2) # f00b0000 <_ram_heap_end+0x7009e000>
80005ad0:	00462383          	lw	t2,4(a2)
80005ad4:	410306b3          	sub	a3,t1,a6
80005ad8:	00d33733          	sltu	a4,t1,a3
80005adc:	411387b3          	sub	a5,t2,a7
80005ae0:	00e79463          	bne	a5,a4,80005ae8 <delay_us+0x2c>
80005ae4:	fea6e4e3          	bltu	a3,a0,80005acc <delay_us+0x10>
80005ae8:	00008067          	ret

80005aec <print_uart0>:
80005aec:	f00106b7          	lui	a3,0xf0010
80005af0:	00054703          	lbu	a4,0(a0)
80005af4:	00071463          	bnez	a4,80005afc <print_uart0+0x10>
80005af8:	00008067          	ret
80005afc:	0046a783          	lw	a5,4(a3) # f0010004 <_ram_heap_end+0x6fffe004>
80005b00:	0107d793          	srli	a5,a5,0x10
80005b04:	0ff7f793          	andi	a5,a5,255
80005b08:	fe078ae3          	beqz	a5,80005afc <print_uart0+0x10>
80005b0c:	00e6a023          	sw	a4,0(a3)
80005b10:	00150513          	addi	a0,a0,1
80005b14:	fddff06f          	j	80005af0 <print_uart0+0x4>

80005b18 <_sbrk>:
80005b18:	8c81a783          	lw	a5,-1848(gp) # 80003060 <sbrk_heap_end>
80005b1c:	02079063          	bnez	a5,80005b3c <_sbrk+0x24>
80005b20:	800117b7          	lui	a5,0x80011
80005b24:	35078793          	addi	a5,a5,848 # 80011350 <_ram_heap_end+0xfffff350>
80005b28:	8cf1a223          	sw	a5,-1852(gp) # 8000305c <heap_start>
80005b2c:	80012737          	lui	a4,0x80012
80005b30:	00070713          	mv	a4,a4
80005b34:	8ce1a023          	sw	a4,-1856(gp) # 80003058 <heap_end>
80005b38:	8cf1a423          	sw	a5,-1848(gp) # 80003060 <sbrk_heap_end>
80005b3c:	8c81a683          	lw	a3,-1848(gp) # 80003060 <sbrk_heap_end>
80005b40:	8c01a703          	lw	a4,-1856(gp) # 80003058 <heap_end>
80005b44:	00a687b3          	add	a5,a3,a0
80005b48:	04e7e063          	bltu	a5,a4,80005b88 <_sbrk+0x70>
80005b4c:	f7010113          	addi	sp,sp,-144
80005b50:	80003637          	lui	a2,0x80003
80005b54:	00050793          	mv	a5,a0
80005b58:	ad460613          	addi	a2,a2,-1324 # 80002ad4 <_ram_heap_end+0xffff0ad4>
80005b5c:	08000593          	li	a1,128
80005b60:	00010513          	mv	a0,sp
80005b64:	08112623          	sw	ra,140(sp)
80005b68:	46d080ef          	jal	ra,8000e7d4 <sniprintf>
80005b6c:	00010513          	mv	a0,sp
80005b70:	f7dff0ef          	jal	ra,80005aec <print_uart0>
80005b74:	08c12083          	lw	ra,140(sp)
80005b78:	fff00693          	li	a3,-1
80005b7c:	00068513          	mv	a0,a3
80005b80:	09010113          	addi	sp,sp,144
80005b84:	00008067          	ret
80005b88:	8cf1a423          	sw	a5,-1848(gp) # 80003060 <sbrk_heap_end>
80005b8c:	00068513          	mv	a0,a3
80005b90:	00008067          	ret

80005b94 <print_uart1>:
80005b94:	f00116b7          	lui	a3,0xf0011
80005b98:	00054703          	lbu	a4,0(a0)
80005b9c:	00071463          	bnez	a4,80005ba4 <print_uart1+0x10>
80005ba0:	00008067          	ret
80005ba4:	0046a783          	lw	a5,4(a3) # f0011004 <_ram_heap_end+0x6ffff004>
80005ba8:	0107d793          	srli	a5,a5,0x10
80005bac:	0ff7f793          	andi	a5,a5,255
80005bb0:	fe078ae3          	beqz	a5,80005ba4 <print_uart1+0x10>
80005bb4:	00e6a023          	sw	a4,0(a3)
80005bb8:	00150513          	addi	a0,a0,1
80005bbc:	fddff06f          	j	80005b98 <print_uart1+0x4>

80005bc0 <_write>:
80005bc0:	00c586b3          	add	a3,a1,a2
80005bc4:	f0010737          	lui	a4,0xf0010
80005bc8:	00d59663          	bne	a1,a3,80005bd4 <_write+0x14>
80005bcc:	00060513          	mv	a0,a2
80005bd0:	00008067          	ret
80005bd4:	00158593          	addi	a1,a1,1
80005bd8:	fff5c503          	lbu	a0,-1(a1)
80005bdc:	00472783          	lw	a5,4(a4) # f0010004 <_ram_heap_end+0x6fffe004>
80005be0:	0107d793          	srli	a5,a5,0x10
80005be4:	0ff7f793          	andi	a5,a5,255
80005be8:	fe078ae3          	beqz	a5,80005bdc <_write+0x1c>
80005bec:	00a72023          	sw	a0,0(a4)
80005bf0:	fd9ff06f          	j	80005bc8 <_write+0x8>

80005bf4 <_read>:
80005bf4:	00100513          	li	a0,1
80005bf8:	00008067          	ret

80005bfc <_close>:
80005bfc:	fff00513          	li	a0,-1
80005c00:	00008067          	ret

80005c04 <_lseek>:
80005c04:	00000513          	li	a0,0
80005c08:	00008067          	ret

80005c0c <_isatty>:
80005c0c:	00100513          	li	a0,1
80005c10:	00008067          	ret

80005c14 <_fstat>:
80005c14:	000027b7          	lui	a5,0x2
80005c18:	00f5a223          	sw	a5,4(a1)
80005c1c:	00000513          	li	a0,0
80005c20:	00008067          	ret

80005c24 <_kill>:
80005c24:	00008067          	ret

80005c28 <_getpid>:
80005c28:	fff00513          	li	a0,-1
80005c2c:	00008067          	ret

80005c30 <hard_reboot>:
80005c30:	80003537          	lui	a0,0x80003
80005c34:	ff010113          	addi	sp,sp,-16
80005c38:	b1850513          	addi	a0,a0,-1256 # 80002b18 <_ram_heap_end+0xffff0b18>
80005c3c:	00112623          	sw	ra,12(sp)
80005c40:	eadff0ef          	jal	ra,80005aec <print_uart0>
80005c44:	3e800513          	li	a0,1000
80005c48:	e75ff0ef          	jal	ra,80005abc <delay_us>
80005c4c:	f00a07b7          	lui	a5,0xf00a0
80005c50:	00100713          	li	a4,1
80005c54:	00e7a423          	sw	a4,8(a5) # f00a0008 <_ram_heap_end+0x7008e008>
80005c58:	00c12083          	lw	ra,12(sp)
80005c5c:	01010113          	addi	sp,sp,16
80005c60:	00008067          	ret

80005c64 <memcpy_rev>:
80005c64:	00000793          	li	a5,0
80005c68:	00f61463          	bne	a2,a5,80005c70 <memcpy_rev+0xc>
80005c6c:	00008067          	ret
80005c70:	40f58733          	sub	a4,a1,a5
80005c74:	00074683          	lbu	a3,0(a4)
80005c78:	00f50733          	add	a4,a0,a5
80005c7c:	00178793          	addi	a5,a5,1
80005c80:	00d70023          	sb	a3,0(a4)
80005c84:	fe5ff06f          	j	80005c68 <memcpy_rev+0x4>

80005c88 <lwip_init>:
80005c88:	ff010113          	addi	sp,sp,-16
80005c8c:	00112623          	sw	ra,12(sp)
80005c90:	340020ef          	jal	ra,80007fd0 <stats_init>
80005c94:	015000ef          	jal	ra,800064a8 <mem_init>
80005c98:	141000ef          	jal	ra,800065d8 <memp_init>
80005c9c:	27d000ef          	jal	ra,80006718 <netif_init>
80005ca0:	618020ef          	jal	ra,800082b8 <udp_init>
80005ca4:	00c12083          	lw	ra,12(sp)
80005ca8:	01010113          	addi	sp,sp,16
80005cac:	4500206f          	j	800080fc <sys_timeouts_init>

80005cb0 <lwip_htons>:
80005cb0:	00851793          	slli	a5,a0,0x8
80005cb4:	00855513          	srli	a0,a0,0x8
80005cb8:	00a7e533          	or	a0,a5,a0
80005cbc:	01051513          	slli	a0,a0,0x10
80005cc0:	01055513          	srli	a0,a0,0x10
80005cc4:	00008067          	ret

80005cc8 <lwip_htonl>:
80005cc8:	01855713          	srli	a4,a0,0x18
80005ccc:	01851793          	slli	a5,a0,0x18
80005cd0:	00e7e7b3          	or	a5,a5,a4
80005cd4:	00ff06b7          	lui	a3,0xff0
80005cd8:	00851713          	slli	a4,a0,0x8
80005cdc:	00d77733          	and	a4,a4,a3
80005ce0:	00e7e7b3          	or	a5,a5,a4
80005ce4:	00010737          	lui	a4,0x10
80005ce8:	f0070713          	addi	a4,a4,-256 # ff00 <_stack_size+0xf700>
80005cec:	00855513          	srli	a0,a0,0x8
80005cf0:	00e57533          	and	a0,a0,a4
80005cf4:	00a7e533          	or	a0,a5,a0
80005cf8:	00008067          	ret

80005cfc <lwip_strnstr>:
80005cfc:	fe010113          	addi	sp,sp,-32
80005d00:	00812c23          	sw	s0,24(sp)
80005d04:	00050413          	mv	s0,a0
80005d08:	00058513          	mv	a0,a1
80005d0c:	00912a23          	sw	s1,20(sp)
80005d10:	01312623          	sw	s3,12(sp)
80005d14:	00112e23          	sw	ra,28(sp)
80005d18:	01212823          	sw	s2,16(sp)
80005d1c:	00058993          	mv	s3,a1
80005d20:	00060493          	mv	s1,a2
80005d24:	57d080ef          	jal	ra,8000eaa0 <strlen>
80005d28:	02050063          	beqz	a0,80005d48 <lwip_strnstr+0x4c>
80005d2c:	00050913          	mv	s2,a0
80005d30:	009404b3          	add	s1,s0,s1
80005d34:	00044783          	lbu	a5,0(s0)
80005d38:	00078663          	beqz	a5,80005d44 <lwip_strnstr+0x48>
80005d3c:	01240733          	add	a4,s0,s2
80005d40:	02e4f463          	bgeu	s1,a4,80005d68 <lwip_strnstr+0x6c>
80005d44:	00000413          	li	s0,0
80005d48:	00040513          	mv	a0,s0
80005d4c:	01c12083          	lw	ra,28(sp)
80005d50:	01812403          	lw	s0,24(sp)
80005d54:	01412483          	lw	s1,20(sp)
80005d58:	01012903          	lw	s2,16(sp)
80005d5c:	00c12983          	lw	s3,12(sp)
80005d60:	02010113          	addi	sp,sp,32
80005d64:	00008067          	ret
80005d68:	0009c703          	lbu	a4,0(s3)
80005d6c:	00f71c63          	bne	a4,a5,80005d84 <lwip_strnstr+0x88>
80005d70:	00090613          	mv	a2,s2
80005d74:	00098593          	mv	a1,s3
80005d78:	00040513          	mv	a0,s0
80005d7c:	541080ef          	jal	ra,8000eabc <strncmp>
80005d80:	fc0504e3          	beqz	a0,80005d48 <lwip_strnstr+0x4c>
80005d84:	00140413          	addi	s0,s0,1
80005d88:	fadff06f          	j	80005d34 <lwip_strnstr+0x38>

80005d8c <lwip_stricmp>:
80005d8c:	01900813          	li	a6,25
80005d90:	00150513          	addi	a0,a0,1
80005d94:	00158593          	addi	a1,a1,1
80005d98:	fff54703          	lbu	a4,-1(a0)
80005d9c:	fff5c783          	lbu	a5,-1(a1)
80005da0:	00f70e63          	beq	a4,a5,80005dbc <lwip_stricmp+0x30>
80005da4:	02076613          	ori	a2,a4,32
80005da8:	f9f60693          	addi	a3,a2,-97
80005dac:	0ff6f693          	andi	a3,a3,255
80005db0:	00d86c63          	bltu	a6,a3,80005dc8 <lwip_stricmp+0x3c>
80005db4:	0207e793          	ori	a5,a5,32
80005db8:	00f61863          	bne	a2,a5,80005dc8 <lwip_stricmp+0x3c>
80005dbc:	fc071ae3          	bnez	a4,80005d90 <lwip_stricmp+0x4>
80005dc0:	00000513          	li	a0,0
80005dc4:	00008067          	ret
80005dc8:	00100513          	li	a0,1
80005dcc:	00008067          	ret

80005dd0 <lwip_strnicmp>:
80005dd0:	fff60613          	addi	a2,a2,-1
80005dd4:	00000793          	li	a5,0
80005dd8:	01900313          	li	t1,25
80005ddc:	00f50733          	add	a4,a0,a5
80005de0:	00074683          	lbu	a3,0(a4)
80005de4:	00f58733          	add	a4,a1,a5
80005de8:	00074703          	lbu	a4,0(a4)
80005dec:	00e68e63          	beq	a3,a4,80005e08 <lwip_strnicmp+0x38>
80005df0:	0206e893          	ori	a7,a3,32
80005df4:	f9f88813          	addi	a6,a7,-97
80005df8:	0ff87813          	andi	a6,a6,255
80005dfc:	03036063          	bltu	t1,a6,80005e1c <lwip_strnicmp+0x4c>
80005e00:	02076713          	ori	a4,a4,32
80005e04:	00e89c63          	bne	a7,a4,80005e1c <lwip_strnicmp+0x4c>
80005e08:	00f60663          	beq	a2,a5,80005e14 <lwip_strnicmp+0x44>
80005e0c:	00178793          	addi	a5,a5,1
80005e10:	fc0696e3          	bnez	a3,80005ddc <lwip_strnicmp+0xc>
80005e14:	00000513          	li	a0,0
80005e18:	00008067          	ret
80005e1c:	00100513          	li	a0,1
80005e20:	00008067          	ret

80005e24 <lwip_itoa>:
80005e24:	fe010113          	addi	sp,sp,-32
80005e28:	01212823          	sw	s2,16(sp)
80005e2c:	01412423          	sw	s4,8(sp)
80005e30:	00112e23          	sw	ra,28(sp)
80005e34:	00812c23          	sw	s0,24(sp)
80005e38:	00912a23          	sw	s1,20(sp)
80005e3c:	01312623          	sw	s3,12(sp)
80005e40:	00100793          	li	a5,1
80005e44:	00050913          	mv	s2,a0
80005e48:	00058a13          	mv	s4,a1
80005e4c:	02b7e663          	bltu	a5,a1,80005e78 <lwip_itoa+0x54>
80005e50:	00f59463          	bne	a1,a5,80005e58 <lwip_itoa+0x34>
80005e54:	00090023          	sb	zero,0(s2)
80005e58:	01c12083          	lw	ra,28(sp)
80005e5c:	01812403          	lw	s0,24(sp)
80005e60:	01412483          	lw	s1,20(sp)
80005e64:	01012903          	lw	s2,16(sp)
80005e68:	00c12983          	lw	s3,12(sp)
80005e6c:	00812a03          	lw	s4,8(sp)
80005e70:	02010113          	addi	sp,sp,32
80005e74:	00008067          	ret
80005e78:	00050993          	mv	s3,a0
80005e7c:	00065863          	bgez	a2,80005e8c <lwip_itoa+0x68>
80005e80:	02d00793          	li	a5,45
80005e84:	00150993          	addi	s3,a0,1
80005e88:	00f50023          	sb	a5,0(a0)
80005e8c:	41f65793          	srai	a5,a2,0x1f
80005e90:	fffa0413          	addi	s0,s4,-1
80005e94:	00890433          	add	s0,s2,s0
80005e98:	00c7c4b3          	xor	s1,a5,a2
80005e9c:	40f484b3          	sub	s1,s1,a5
80005ea0:	00040023          	sb	zero,0(s0)
80005ea4:	04048263          	beqz	s1,80005ee8 <lwip_itoa+0xc4>
80005ea8:	fa89f6e3          	bgeu	s3,s0,80005e54 <lwip_itoa+0x30>
80005eac:	00a00593          	li	a1,10
80005eb0:	00048513          	mv	a0,s1
80005eb4:	410070ef          	jal	ra,8000d2c4 <__modsi3>
80005eb8:	03050513          	addi	a0,a0,48
80005ebc:	fff40413          	addi	s0,s0,-1
80005ec0:	00a40023          	sb	a0,0(s0)
80005ec4:	00a00593          	li	a1,10
80005ec8:	00048513          	mv	a0,s1
80005ecc:	374070ef          	jal	ra,8000d240 <__divsi3>
80005ed0:	00050493          	mv	s1,a0
80005ed4:	fd1ff06f          	j	80005ea4 <lwip_itoa+0x80>
80005ed8:	03000793          	li	a5,48
80005edc:	00f98023          	sb	a5,0(s3)
80005ee0:	000980a3          	sb	zero,1(s3)
80005ee4:	f75ff06f          	j	80005e58 <lwip_itoa+0x34>
80005ee8:	00044783          	lbu	a5,0(s0)
80005eec:	fe0786e3          	beqz	a5,80005ed8 <lwip_itoa+0xb4>
80005ef0:	01490633          	add	a2,s2,s4
80005ef4:	40860633          	sub	a2,a2,s0
80005ef8:	00040593          	mv	a1,s0
80005efc:	01812403          	lw	s0,24(sp)
80005f00:	01c12083          	lw	ra,28(sp)
80005f04:	01412483          	lw	s1,20(sp)
80005f08:	01012903          	lw	s2,16(sp)
80005f0c:	00812a03          	lw	s4,8(sp)
80005f10:	00098513          	mv	a0,s3
80005f14:	00c12983          	lw	s3,12(sp)
80005f18:	02010113          	addi	sp,sp,32
80005f1c:	2800806f          	j	8000e19c <memmove>

80005f20 <lwip_standard_chksum>:
80005f20:	ff010113          	addi	sp,sp,-16
80005f24:	00011723          	sh	zero,14(sp)
80005f28:	00157693          	andi	a3,a0,1
80005f2c:	00068c63          	beqz	a3,80005f44 <lwip_standard_chksum+0x24>
80005f30:	00b05a63          	blez	a1,80005f44 <lwip_standard_chksum+0x24>
80005f34:	00054783          	lbu	a5,0(a0)
80005f38:	fff58593          	addi	a1,a1,-1
80005f3c:	00150513          	addi	a0,a0,1
80005f40:	00f107a3          	sb	a5,15(sp)
80005f44:	00000793          	li	a5,0
80005f48:	00100713          	li	a4,1
80005f4c:	06b74063          	blt	a4,a1,80005fac <lwip_standard_chksum+0x8c>
80005f50:	00e59663          	bne	a1,a4,80005f5c <lwip_standard_chksum+0x3c>
80005f54:	00054703          	lbu	a4,0(a0)
80005f58:	00e10723          	sb	a4,14(sp)
80005f5c:	00e15503          	lhu	a0,14(sp)
80005f60:	00010737          	lui	a4,0x10
80005f64:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
80005f68:	00f50533          	add	a0,a0,a5
80005f6c:	01055793          	srli	a5,a0,0x10
80005f70:	00e57533          	and	a0,a0,a4
80005f74:	00a787b3          	add	a5,a5,a0
80005f78:	0107d513          	srli	a0,a5,0x10
80005f7c:	00e7f7b3          	and	a5,a5,a4
80005f80:	00f50533          	add	a0,a0,a5
80005f84:	00068c63          	beqz	a3,80005f9c <lwip_standard_chksum+0x7c>
80005f88:	00851793          	slli	a5,a0,0x8
80005f8c:	00855513          	srli	a0,a0,0x8
80005f90:	00e7f733          	and	a4,a5,a4
80005f94:	0ff57513          	andi	a0,a0,255
80005f98:	00a76533          	or	a0,a4,a0
80005f9c:	01051513          	slli	a0,a0,0x10
80005fa0:	01055513          	srli	a0,a0,0x10
80005fa4:	01010113          	addi	sp,sp,16
80005fa8:	00008067          	ret
80005fac:	00250513          	addi	a0,a0,2
80005fb0:	ffe55603          	lhu	a2,-2(a0)
80005fb4:	ffe58593          	addi	a1,a1,-2
80005fb8:	00c787b3          	add	a5,a5,a2
80005fbc:	f91ff06f          	j	80005f4c <lwip_standard_chksum+0x2c>

80005fc0 <inet_chksum_pseudo>:
80005fc0:	fe010113          	addi	sp,sp,-32
80005fc4:	00812c23          	sw	s0,24(sp)
80005fc8:	00912a23          	sw	s1,20(sp)
80005fcc:	01212823          	sw	s2,16(sp)
80005fd0:	01312623          	sw	s3,12(sp)
80005fd4:	01412423          	sw	s4,8(sp)
80005fd8:	01512223          	sw	s5,4(sp)
80005fdc:	00112e23          	sw	ra,28(sp)
80005fe0:	00072703          	lw	a4,0(a4)
80005fe4:	0006a683          	lw	a3,0(a3) # ff0000 <_stack_size+0xfef800>
80005fe8:	000107b7          	lui	a5,0x10
80005fec:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80005ff0:	00f77433          	and	s0,a4,a5
80005ff4:	01075713          	srli	a4,a4,0x10
80005ff8:	00e40433          	add	s0,s0,a4
80005ffc:	00f6f733          	and	a4,a3,a5
80006000:	00e40433          	add	s0,s0,a4
80006004:	0106d693          	srli	a3,a3,0x10
80006008:	008686b3          	add	a3,a3,s0
8000600c:	0106d413          	srli	s0,a3,0x10
80006010:	00f6f6b3          	and	a3,a3,a5
80006014:	00d406b3          	add	a3,s0,a3
80006018:	0106d413          	srli	s0,a3,0x10
8000601c:	00f6f6b3          	and	a3,a3,a5
80006020:	00050993          	mv	s3,a0
80006024:	00058a13          	mv	s4,a1
80006028:	00060913          	mv	s2,a2
8000602c:	00d40433          	add	s0,s0,a3
80006030:	00000a93          	li	s5,0
80006034:	00078493          	mv	s1,a5
80006038:	08099863          	bnez	s3,800060c8 <inet_chksum_pseudo+0x108>
8000603c:	020a8063          	beqz	s5,8000605c <inet_chksum_pseudo+0x9c>
80006040:	00010737          	lui	a4,0x10
80006044:	00841793          	slli	a5,s0,0x8
80006048:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
8000604c:	00845413          	srli	s0,s0,0x8
80006050:	00e7f7b3          	and	a5,a5,a4
80006054:	0ff47413          	andi	s0,s0,255
80006058:	0087e433          	or	s0,a5,s0
8000605c:	000a0513          	mv	a0,s4
80006060:	c51ff0ef          	jal	ra,80005cb0 <lwip_htons>
80006064:	00050493          	mv	s1,a0
80006068:	00090513          	mv	a0,s2
8000606c:	c45ff0ef          	jal	ra,80005cb0 <lwip_htons>
80006070:	00a48533          	add	a0,s1,a0
80006074:	000107b7          	lui	a5,0x10
80006078:	00850433          	add	s0,a0,s0
8000607c:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80006080:	01045513          	srli	a0,s0,0x10
80006084:	00f47433          	and	s0,s0,a5
80006088:	00850433          	add	s0,a0,s0
8000608c:	01045513          	srli	a0,s0,0x10
80006090:	00f47433          	and	s0,s0,a5
80006094:	00850433          	add	s0,a0,s0
80006098:	fff44513          	not	a0,s0
8000609c:	01c12083          	lw	ra,28(sp)
800060a0:	01812403          	lw	s0,24(sp)
800060a4:	01051513          	slli	a0,a0,0x10
800060a8:	01412483          	lw	s1,20(sp)
800060ac:	01012903          	lw	s2,16(sp)
800060b0:	00c12983          	lw	s3,12(sp)
800060b4:	00812a03          	lw	s4,8(sp)
800060b8:	00412a83          	lw	s5,4(sp)
800060bc:	01055513          	srli	a0,a0,0x10
800060c0:	02010113          	addi	sp,sp,32
800060c4:	00008067          	ret
800060c8:	00a9d583          	lhu	a1,10(s3)
800060cc:	0049a503          	lw	a0,4(s3)
800060d0:	e51ff0ef          	jal	ra,80005f20 <lwip_standard_chksum>
800060d4:	00850433          	add	s0,a0,s0
800060d8:	01045793          	srli	a5,s0,0x10
800060dc:	00947433          	and	s0,s0,s1
800060e0:	00878433          	add	s0,a5,s0
800060e4:	00a9d783          	lhu	a5,10(s3)
800060e8:	0017f793          	andi	a5,a5,1
800060ec:	00078e63          	beqz	a5,80006108 <inet_chksum_pseudo+0x148>
800060f0:	00841793          	slli	a5,s0,0x8
800060f4:	00845413          	srli	s0,s0,0x8
800060f8:	0097f7b3          	and	a5,a5,s1
800060fc:	0ff47413          	andi	s0,s0,255
80006100:	001aca93          	xori	s5,s5,1
80006104:	0087e433          	or	s0,a5,s0
80006108:	0009a983          	lw	s3,0(s3)
8000610c:	f2dff06f          	j	80006038 <inet_chksum_pseudo+0x78>

80006110 <ip_chksum_pseudo>:
80006110:	eb1ff06f          	j	80005fc0 <inet_chksum_pseudo>

80006114 <inet_chksum_pseudo_partial>:
80006114:	fd010113          	addi	sp,sp,-48
80006118:	02812423          	sw	s0,40(sp)
8000611c:	02912223          	sw	s1,36(sp)
80006120:	03212023          	sw	s2,32(sp)
80006124:	01412c23          	sw	s4,24(sp)
80006128:	01512a23          	sw	s5,20(sp)
8000612c:	01612823          	sw	s6,16(sp)
80006130:	02112623          	sw	ra,44(sp)
80006134:	01312e23          	sw	s3,28(sp)
80006138:	00060913          	mv	s2,a2
8000613c:	0007a603          	lw	a2,0(a5)
80006140:	00072703          	lw	a4,0(a4)
80006144:	000107b7          	lui	a5,0x10
80006148:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
8000614c:	00f67433          	and	s0,a2,a5
80006150:	01065613          	srli	a2,a2,0x10
80006154:	00c40433          	add	s0,s0,a2
80006158:	00f77633          	and	a2,a4,a5
8000615c:	00c40433          	add	s0,s0,a2
80006160:	01075713          	srli	a4,a4,0x10
80006164:	00870733          	add	a4,a4,s0
80006168:	01075413          	srli	s0,a4,0x10
8000616c:	00f77733          	and	a4,a4,a5
80006170:	00e40733          	add	a4,s0,a4
80006174:	01075413          	srli	s0,a4,0x10
80006178:	00f77733          	and	a4,a4,a5
8000617c:	00050a13          	mv	s4,a0
80006180:	00058a93          	mv	s5,a1
80006184:	00e40433          	add	s0,s0,a4
80006188:	00000b13          	li	s6,0
8000618c:	00078493          	mv	s1,a5
80006190:	060a1c63          	bnez	s4,80006208 <inet_chksum_pseudo_partial+0xf4>
80006194:	0e0b1663          	bnez	s6,80006280 <inet_chksum_pseudo_partial+0x16c>
80006198:	000a8513          	mv	a0,s5
8000619c:	b15ff0ef          	jal	ra,80005cb0 <lwip_htons>
800061a0:	00050493          	mv	s1,a0
800061a4:	00090513          	mv	a0,s2
800061a8:	b09ff0ef          	jal	ra,80005cb0 <lwip_htons>
800061ac:	00a48533          	add	a0,s1,a0
800061b0:	000107b7          	lui	a5,0x10
800061b4:	00850433          	add	s0,a0,s0
800061b8:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
800061bc:	01045513          	srli	a0,s0,0x10
800061c0:	00f47433          	and	s0,s0,a5
800061c4:	00850433          	add	s0,a0,s0
800061c8:	01045513          	srli	a0,s0,0x10
800061cc:	00f47433          	and	s0,s0,a5
800061d0:	00850433          	add	s0,a0,s0
800061d4:	fff44513          	not	a0,s0
800061d8:	02c12083          	lw	ra,44(sp)
800061dc:	02812403          	lw	s0,40(sp)
800061e0:	01051513          	slli	a0,a0,0x10
800061e4:	02412483          	lw	s1,36(sp)
800061e8:	02012903          	lw	s2,32(sp)
800061ec:	01c12983          	lw	s3,28(sp)
800061f0:	01812a03          	lw	s4,24(sp)
800061f4:	01412a83          	lw	s5,20(sp)
800061f8:	01012b03          	lw	s6,16(sp)
800061fc:	01055513          	srli	a0,a0,0x10
80006200:	03010113          	addi	sp,sp,48
80006204:	00008067          	ret
80006208:	f80686e3          	beqz	a3,80006194 <inet_chksum_pseudo_partial+0x80>
8000620c:	00aa5783          	lhu	a5,10(s4)
80006210:	00078993          	mv	s3,a5
80006214:	00f6f463          	bgeu	a3,a5,8000621c <inet_chksum_pseudo_partial+0x108>
80006218:	00068993          	mv	s3,a3
8000621c:	01099993          	slli	s3,s3,0x10
80006220:	004a2503          	lw	a0,4(s4)
80006224:	0109d993          	srli	s3,s3,0x10
80006228:	00098593          	mv	a1,s3
8000622c:	00d12623          	sw	a3,12(sp)
80006230:	cf1ff0ef          	jal	ra,80005f20 <lwip_standard_chksum>
80006234:	00850433          	add	s0,a0,s0
80006238:	01045793          	srli	a5,s0,0x10
8000623c:	00c12683          	lw	a3,12(sp)
80006240:	00947433          	and	s0,s0,s1
80006244:	00878433          	add	s0,a5,s0
80006248:	00aa5783          	lhu	a5,10(s4)
8000624c:	413689b3          	sub	s3,a3,s3
80006250:	01099693          	slli	a3,s3,0x10
80006254:	0017f793          	andi	a5,a5,1
80006258:	0106d693          	srli	a3,a3,0x10
8000625c:	00078e63          	beqz	a5,80006278 <inet_chksum_pseudo_partial+0x164>
80006260:	00841793          	slli	a5,s0,0x8
80006264:	00845413          	srli	s0,s0,0x8
80006268:	0097f7b3          	and	a5,a5,s1
8000626c:	0ff47413          	andi	s0,s0,255
80006270:	001b4b13          	xori	s6,s6,1
80006274:	0087e433          	or	s0,a5,s0
80006278:	000a2a03          	lw	s4,0(s4)
8000627c:	f15ff06f          	j	80006190 <inet_chksum_pseudo_partial+0x7c>
80006280:	00010737          	lui	a4,0x10
80006284:	00841793          	slli	a5,s0,0x8
80006288:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
8000628c:	00845413          	srli	s0,s0,0x8
80006290:	00e7f7b3          	and	a5,a5,a4
80006294:	0ff47413          	andi	s0,s0,255
80006298:	0087e433          	or	s0,a5,s0
8000629c:	efdff06f          	j	80006198 <inet_chksum_pseudo_partial+0x84>

800062a0 <ip_chksum_pseudo_partial>:
800062a0:	e75ff06f          	j	80006114 <inet_chksum_pseudo_partial>

800062a4 <inet_chksum>:
800062a4:	ff010113          	addi	sp,sp,-16
800062a8:	00112623          	sw	ra,12(sp)
800062ac:	c75ff0ef          	jal	ra,80005f20 <lwip_standard_chksum>
800062b0:	00c12083          	lw	ra,12(sp)
800062b4:	fff54513          	not	a0,a0
800062b8:	01051513          	slli	a0,a0,0x10
800062bc:	01055513          	srli	a0,a0,0x10
800062c0:	01010113          	addi	sp,sp,16
800062c4:	00008067          	ret

800062c8 <inet_chksum_pbuf>:
800062c8:	fe010113          	addi	sp,sp,-32
800062cc:	01212823          	sw	s2,16(sp)
800062d0:	00010937          	lui	s2,0x10
800062d4:	00812c23          	sw	s0,24(sp)
800062d8:	00912a23          	sw	s1,20(sp)
800062dc:	01312623          	sw	s3,12(sp)
800062e0:	00112e23          	sw	ra,28(sp)
800062e4:	00050493          	mv	s1,a0
800062e8:	00000993          	li	s3,0
800062ec:	00000413          	li	s0,0
800062f0:	fff90913          	addi	s2,s2,-1 # ffff <_stack_size+0xf7ff>
800062f4:	04049663          	bnez	s1,80006340 <inet_chksum_pbuf+0x78>
800062f8:	02098063          	beqz	s3,80006318 <inet_chksum_pbuf+0x50>
800062fc:	00010737          	lui	a4,0x10
80006300:	00841793          	slli	a5,s0,0x8
80006304:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
80006308:	00845413          	srli	s0,s0,0x8
8000630c:	00e7f7b3          	and	a5,a5,a4
80006310:	0ff47413          	andi	s0,s0,255
80006314:	0087e433          	or	s0,a5,s0
80006318:	fff44513          	not	a0,s0
8000631c:	01c12083          	lw	ra,28(sp)
80006320:	01812403          	lw	s0,24(sp)
80006324:	01051513          	slli	a0,a0,0x10
80006328:	01412483          	lw	s1,20(sp)
8000632c:	01012903          	lw	s2,16(sp)
80006330:	00c12983          	lw	s3,12(sp)
80006334:	01055513          	srli	a0,a0,0x10
80006338:	02010113          	addi	sp,sp,32
8000633c:	00008067          	ret
80006340:	00a4d583          	lhu	a1,10(s1)
80006344:	0044a503          	lw	a0,4(s1)
80006348:	bd9ff0ef          	jal	ra,80005f20 <lwip_standard_chksum>
8000634c:	00850433          	add	s0,a0,s0
80006350:	01045793          	srli	a5,s0,0x10
80006354:	01247433          	and	s0,s0,s2
80006358:	00878433          	add	s0,a5,s0
8000635c:	00a4d783          	lhu	a5,10(s1)
80006360:	0017f793          	andi	a5,a5,1
80006364:	00078e63          	beqz	a5,80006380 <inet_chksum_pbuf+0xb8>
80006368:	00841793          	slli	a5,s0,0x8
8000636c:	00845413          	srli	s0,s0,0x8
80006370:	0127f7b3          	and	a5,a5,s2
80006374:	0ff47413          	andi	s0,s0,255
80006378:	0019c993          	xori	s3,s3,1
8000637c:	0087e433          	or	s0,a5,s0
80006380:	0004a483          	lw	s1,0(s1)
80006384:	f71ff06f          	j	800062f4 <inet_chksum_pbuf+0x2c>

80006388 <mem_overflow_check_raw>:
80006388:	f5010113          	addi	sp,sp,-176
8000638c:	0a812423          	sw	s0,168(sp)
80006390:	0a912223          	sw	s1,164(sp)
80006394:	0b212023          	sw	s2,160(sp)
80006398:	09312e23          	sw	s3,156(sp)
8000639c:	09412c23          	sw	s4,152(sp)
800063a0:	09512a23          	sw	s5,148(sp)
800063a4:	09612823          	sw	s6,144(sp)
800063a8:	09712623          	sw	s7,140(sp)
800063ac:	0a112623          	sw	ra,172(sp)
800063b0:	00050493          	mv	s1,a0
800063b4:	00058a93          	mv	s5,a1
800063b8:	00060913          	mv	s2,a2
800063bc:	00068993          	mv	s3,a3
800063c0:	00000413          	li	s0,0
800063c4:	0cd00b13          	li	s6,205
800063c8:	80003bb7          	lui	s7,0x80003
800063cc:	01000a13          	li	s4,16
800063d0:	008a87b3          	add	a5,s5,s0
800063d4:	00f487b3          	add	a5,s1,a5
800063d8:	0007c783          	lbu	a5,0(a5)
800063dc:	01678e63          	beq	a5,s6,800063f8 <mem_overflow_check_raw+0x70>
800063e0:	00098713          	mv	a4,s3
800063e4:	00090693          	mv	a3,s2
800063e8:	b34b8613          	addi	a2,s7,-1228 # 80002b34 <_ram_heap_end+0xffff0b34>
800063ec:	08000593          	li	a1,128
800063f0:	00010513          	mv	a0,sp
800063f4:	3e0080ef          	jal	ra,8000e7d4 <sniprintf>
800063f8:	00140413          	addi	s0,s0,1
800063fc:	fd441ae3          	bne	s0,s4,800063d0 <mem_overflow_check_raw+0x48>
80006400:	ff048413          	addi	s0,s1,-16
80006404:	0cd00a13          	li	s4,205
80006408:	80003ab7          	lui	s5,0x80003
8000640c:	00044783          	lbu	a5,0(s0)
80006410:	01478e63          	beq	a5,s4,8000642c <mem_overflow_check_raw+0xa4>
80006414:	00098713          	mv	a4,s3
80006418:	00090693          	mv	a3,s2
8000641c:	b54a8613          	addi	a2,s5,-1196 # 80002b54 <_ram_heap_end+0xffff0b54>
80006420:	08000593          	li	a1,128
80006424:	00010513          	mv	a0,sp
80006428:	3ac080ef          	jal	ra,8000e7d4 <sniprintf>
8000642c:	00140413          	addi	s0,s0,1
80006430:	fc849ee3          	bne	s1,s0,8000640c <mem_overflow_check_raw+0x84>
80006434:	0ac12083          	lw	ra,172(sp)
80006438:	0a812403          	lw	s0,168(sp)
8000643c:	0a412483          	lw	s1,164(sp)
80006440:	0a012903          	lw	s2,160(sp)
80006444:	09c12983          	lw	s3,156(sp)
80006448:	09812a03          	lw	s4,152(sp)
8000644c:	09412a83          	lw	s5,148(sp)
80006450:	09012b03          	lw	s6,144(sp)
80006454:	08c12b83          	lw	s7,140(sp)
80006458:	0b010113          	addi	sp,sp,176
8000645c:	00008067          	ret

80006460 <mem_overflow_init_raw>:
80006460:	ff010113          	addi	sp,sp,-16
80006464:	00812423          	sw	s0,8(sp)
80006468:	00912223          	sw	s1,4(sp)
8000646c:	00050413          	mv	s0,a0
80006470:	00058493          	mv	s1,a1
80006474:	01000613          	li	a2,16
80006478:	0cd00593          	li	a1,205
8000647c:	ff050513          	addi	a0,a0,-16
80006480:	00112623          	sw	ra,12(sp)
80006484:	6b4060ef          	jal	ra,8000cb38 <memset>
80006488:	00940533          	add	a0,s0,s1
8000648c:	00812403          	lw	s0,8(sp)
80006490:	00c12083          	lw	ra,12(sp)
80006494:	00412483          	lw	s1,4(sp)
80006498:	01000613          	li	a2,16
8000649c:	0cd00593          	li	a1,205
800064a0:	01010113          	addi	sp,sp,16
800064a4:	6940606f          	j	8000cb38 <memset>

800064a8 <mem_init>:
800064a8:	00008067          	ret

800064ac <mem_trim>:
800064ac:	00008067          	ret

800064b0 <lwip_malloc>:
800064b0:	ff010113          	addi	sp,sp,-16
800064b4:	00812423          	sw	s0,8(sp)
800064b8:	00112623          	sw	ra,12(sp)
800064bc:	3b9070ef          	jal	ra,8000e074 <malloc>
800064c0:	00050413          	mv	s0,a0
800064c4:	00051663          	bnez	a0,800064d0 <lwip_malloc+0x20>
800064c8:	965fe0ef          	jal	ra,80004e2c <sys_arch_protect>
800064cc:	965fe0ef          	jal	ra,80004e30 <sys_arch_unprotect>
800064d0:	00040513          	mv	a0,s0
800064d4:	00c12083          	lw	ra,12(sp)
800064d8:	00812403          	lw	s0,8(sp)
800064dc:	01010113          	addi	sp,sp,16
800064e0:	00008067          	ret

800064e4 <lwip_free>:
800064e4:	3a10706f          	j	8000e084 <free>

800064e8 <lwip_calloc>:
800064e8:	3780706f          	j	8000d860 <calloc>

800064ec <do_memp_free_pool>:
800064ec:	ff010113          	addi	sp,sp,-16
800064f0:	00112623          	sw	ra,12(sp)
800064f4:	00812423          	sw	s0,8(sp)
800064f8:	00912223          	sw	s1,4(sp)
800064fc:	01212023          	sw	s2,0(sp)
80006500:	00058413          	mv	s0,a1
80006504:	00050493          	mv	s1,a0
80006508:	925fe0ef          	jal	ra,80004e2c <sys_arch_protect>
8000650c:	0004a683          	lw	a3,0(s1)
80006510:	0044d583          	lhu	a1,4(s1)
80006514:	80003637          	lui	a2,0x80003
80006518:	00050913          	mv	s2,a0
8000651c:	b8c60613          	addi	a2,a2,-1140 # 80002b8c <_ram_heap_end+0xffff0b8c>
80006520:	00040513          	mv	a0,s0
80006524:	e65ff0ef          	jal	ra,80006388 <mem_overflow_check_raw>
80006528:	00090513          	mv	a0,s2
8000652c:	905fe0ef          	jal	ra,80004e30 <sys_arch_unprotect>
80006530:	fe440513          	addi	a0,s0,-28
80006534:	00812403          	lw	s0,8(sp)
80006538:	00c12083          	lw	ra,12(sp)
8000653c:	00412483          	lw	s1,4(sp)
80006540:	00012903          	lw	s2,0(sp)
80006544:	01010113          	addi	sp,sp,16
80006548:	f9dff06f          	j	800064e4 <lwip_free>

8000654c <do_memp_malloc_pool_fn>:
8000654c:	fe010113          	addi	sp,sp,-32
80006550:	00812c23          	sw	s0,24(sp)
80006554:	00912a23          	sw	s1,20(sp)
80006558:	00112e23          	sw	ra,28(sp)
8000655c:	01212823          	sw	s2,16(sp)
80006560:	00050493          	mv	s1,a0
80006564:	00455503          	lhu	a0,4(a0)
80006568:	00b12623          	sw	a1,12(sp)
8000656c:	00c12423          	sw	a2,8(sp)
80006570:	00350513          	addi	a0,a0,3
80006574:	ffc57513          	andi	a0,a0,-4
80006578:	02c50513          	addi	a0,a0,44
8000657c:	f35ff0ef          	jal	ra,800064b0 <lwip_malloc>
80006580:	00050413          	mv	s0,a0
80006584:	8a9fe0ef          	jal	ra,80004e2c <sys_arch_protect>
80006588:	02040663          	beqz	s0,800065b4 <do_memp_malloc_pool_fn+0x68>
8000658c:	00c12583          	lw	a1,12(sp)
80006590:	00812603          	lw	a2,8(sp)
80006594:	01c40413          	addi	s0,s0,28
80006598:	feb42423          	sw	a1,-24(s0)
8000659c:	fec42623          	sw	a2,-20(s0)
800065a0:	0044d583          	lhu	a1,4(s1)
800065a4:	00050913          	mv	s2,a0
800065a8:	00040513          	mv	a0,s0
800065ac:	eb5ff0ef          	jal	ra,80006460 <mem_overflow_init_raw>
800065b0:	00090513          	mv	a0,s2
800065b4:	87dfe0ef          	jal	ra,80004e30 <sys_arch_unprotect>
800065b8:	00040513          	mv	a0,s0
800065bc:	01c12083          	lw	ra,28(sp)
800065c0:	01812403          	lw	s0,24(sp)
800065c4:	01412483          	lw	s1,20(sp)
800065c8:	01012903          	lw	s2,16(sp)
800065cc:	02010113          	addi	sp,sp,32
800065d0:	00008067          	ret

800065d4 <memp_init_pool>:
800065d4:	00008067          	ret

800065d8 <memp_init>:
800065d8:	00008067          	ret

800065dc <memp_malloc_pool_fn>:
800065dc:	00050463          	beqz	a0,800065e4 <memp_malloc_pool_fn+0x8>
800065e0:	f6dff06f          	j	8000654c <do_memp_malloc_pool_fn>
800065e4:	00008067          	ret

800065e8 <memp_malloc_fn>:
800065e8:	00500793          	li	a5,5
800065ec:	00a7ee63          	bltu	a5,a0,80006608 <memp_malloc_fn+0x20>
800065f0:	00251793          	slli	a5,a0,0x2
800065f4:	80003537          	lui	a0,0x80003
800065f8:	b7450513          	addi	a0,a0,-1164 # 80002b74 <_ram_heap_end+0xffff0b74>
800065fc:	00f50533          	add	a0,a0,a5
80006600:	00052503          	lw	a0,0(a0)
80006604:	f49ff06f          	j	8000654c <do_memp_malloc_pool_fn>
80006608:	00000513          	li	a0,0
8000660c:	00008067          	ret

80006610 <memp_free_pool>:
80006610:	00050663          	beqz	a0,8000661c <memp_free_pool+0xc>
80006614:	00058463          	beqz	a1,8000661c <memp_free_pool+0xc>
80006618:	ed5ff06f          	j	800064ec <do_memp_free_pool>
8000661c:	00008067          	ret

80006620 <memp_free>:
80006620:	00500713          	li	a4,5
80006624:	02a76063          	bltu	a4,a0,80006644 <memp_free+0x24>
80006628:	00058e63          	beqz	a1,80006644 <memp_free+0x24>
8000662c:	00251793          	slli	a5,a0,0x2
80006630:	80003537          	lui	a0,0x80003
80006634:	b7450513          	addi	a0,a0,-1164 # 80002b74 <_ram_heap_end+0xffff0b74>
80006638:	00f50533          	add	a0,a0,a5
8000663c:	00052503          	lw	a0,0(a0)
80006640:	eadff06f          	j	800064ec <do_memp_free_pool>
80006644:	00008067          	ret

80006648 <netif_null_output_ip4>:
80006648:	ff400513          	li	a0,-12
8000664c:	00008067          	ret

80006650 <netif_issue_reports>:
80006650:	03554783          	lbu	a5,53(a0)
80006654:	00500693          	li	a3,5
80006658:	0057f613          	andi	a2,a5,5
8000665c:	02d61263          	bne	a2,a3,80006680 <netif_issue_reports+0x30>
80006660:	0015f593          	andi	a1,a1,1
80006664:	00058e63          	beqz	a1,80006680 <netif_issue_reports+0x30>
80006668:	00452683          	lw	a3,4(a0)
8000666c:	00068a63          	beqz	a3,80006680 <netif_issue_reports+0x30>
80006670:	0087f793          	andi	a5,a5,8
80006674:	00078663          	beqz	a5,80006680 <netif_issue_reports+0x30>
80006678:	00450593          	addi	a1,a0,4
8000667c:	0e50406f          	j	8000af60 <etharp_request>
80006680:	00008067          	ret

80006684 <netif_do_set_ipaddr>:
80006684:	00452783          	lw	a5,4(a0)
80006688:	0005a703          	lw	a4,0(a1)
8000668c:	08f70263          	beq	a4,a5,80006710 <netif_do_set_ipaddr+0x8c>
80006690:	fe010113          	addi	sp,sp,-32
80006694:	00f62023          	sw	a5,0(a2)
80006698:	00812c23          	sw	s0,24(sp)
8000669c:	01212823          	sw	s2,16(sp)
800066a0:	00050413          	mv	s0,a0
800066a4:	00058913          	mv	s2,a1
800066a8:	00060513          	mv	a0,a2
800066ac:	00c10593          	addi	a1,sp,12
800066b0:	00112e23          	sw	ra,28(sp)
800066b4:	00e12623          	sw	a4,12(sp)
800066b8:	00912a23          	sw	s1,20(sp)
800066bc:	00060493          	mv	s1,a2
800066c0:	464020ef          	jal	ra,80008b24 <udp_netif_ip_addr_changed>
800066c4:	00c10593          	addi	a1,sp,12
800066c8:	00048513          	mv	a0,s1
800066cc:	0c5010ef          	jal	ra,80007f90 <raw_netif_ip_addr_changed>
800066d0:	00092783          	lw	a5,0(s2)
800066d4:	00100593          	li	a1,1
800066d8:	00040513          	mv	a0,s0
800066dc:	00f42223          	sw	a5,4(s0)
800066e0:	f71ff0ef          	jal	ra,80006650 <netif_issue_reports>
800066e4:	01c42783          	lw	a5,28(s0)
800066e8:	00078663          	beqz	a5,800066f4 <netif_do_set_ipaddr+0x70>
800066ec:	00040513          	mv	a0,s0
800066f0:	000780e7          	jalr	a5
800066f4:	01c12083          	lw	ra,28(sp)
800066f8:	01812403          	lw	s0,24(sp)
800066fc:	01412483          	lw	s1,20(sp)
80006700:	01012903          	lw	s2,16(sp)
80006704:	00100513          	li	a0,1
80006708:	02010113          	addi	sp,sp,32
8000670c:	00008067          	ret
80006710:	00000513          	li	a0,0
80006714:	00008067          	ret

80006718 <netif_init>:
80006718:	00008067          	ret

8000671c <netif_input>:
8000671c:	0355c783          	lbu	a5,53(a1)
80006720:	0187f793          	andi	a5,a5,24
80006724:	00078463          	beqz	a5,8000672c <netif_input+0x10>
80006728:	1d40606f          	j	8000c8fc <ethernet_input>
8000672c:	6300506f          	j	8000bd5c <ip4_input>

80006730 <netif_set_ipaddr>:
80006730:	02050463          	beqz	a0,80006758 <netif_set_ipaddr+0x28>
80006734:	fe010113          	addi	sp,sp,-32
80006738:	00112e23          	sw	ra,28(sp)
8000673c:	00059463          	bnez	a1,80006744 <netif_set_ipaddr+0x14>
80006740:	84818593          	addi	a1,gp,-1976 # 80002fe0 <ip_addr_any>
80006744:	00c10613          	addi	a2,sp,12
80006748:	f3dff0ef          	jal	ra,80006684 <netif_do_set_ipaddr>
8000674c:	01c12083          	lw	ra,28(sp)
80006750:	02010113          	addi	sp,sp,32
80006754:	00008067          	ret
80006758:	00008067          	ret

8000675c <netif_set_netmask>:
8000675c:	00050e63          	beqz	a0,80006778 <netif_set_netmask+0x1c>
80006760:	00059463          	bnez	a1,80006768 <netif_set_netmask+0xc>
80006764:	84818593          	addi	a1,gp,-1976 # 80002fe0 <ip_addr_any>
80006768:	0005a783          	lw	a5,0(a1)
8000676c:	00852703          	lw	a4,8(a0)
80006770:	00e78463          	beq	a5,a4,80006778 <netif_set_netmask+0x1c>
80006774:	00f52423          	sw	a5,8(a0)
80006778:	00008067          	ret

8000677c <netif_set_gw>:
8000677c:	00050e63          	beqz	a0,80006798 <netif_set_gw+0x1c>
80006780:	00059463          	bnez	a1,80006788 <netif_set_gw+0xc>
80006784:	84818593          	addi	a1,gp,-1976 # 80002fe0 <ip_addr_any>
80006788:	0005a783          	lw	a5,0(a1)
8000678c:	00c52703          	lw	a4,12(a0)
80006790:	00e78463          	beq	a5,a4,80006798 <netif_set_gw+0x1c>
80006794:	00f52623          	sw	a5,12(a0)
80006798:	00008067          	ret

8000679c <netif_set_addr>:
8000679c:	fd010113          	addi	sp,sp,-48
800067a0:	02812423          	sw	s0,40(sp)
800067a4:	02912223          	sw	s1,36(sp)
800067a8:	03212023          	sw	s2,32(sp)
800067ac:	02112623          	sw	ra,44(sp)
800067b0:	00050493          	mv	s1,a0
800067b4:	00060913          	mv	s2,a2
800067b8:	00058413          	mv	s0,a1
800067bc:	00059463          	bnez	a1,800067c4 <netif_set_addr+0x28>
800067c0:	84818413          	addi	s0,gp,-1976 # 80002fe0 <ip_addr_any>
800067c4:	00091463          	bnez	s2,800067cc <netif_set_addr+0x30>
800067c8:	84818913          	addi	s2,gp,-1976 # 80002fe0 <ip_addr_any>
800067cc:	00069463          	bnez	a3,800067d4 <netif_set_addr+0x38>
800067d0:	84818693          	addi	a3,gp,-1976 # 80002fe0 <ip_addr_any>
800067d4:	00042783          	lw	a5,0(s0)
800067d8:	00078663          	beqz	a5,800067e4 <netif_set_addr+0x48>
800067dc:	00000793          	li	a5,0
800067e0:	0200006f          	j	80006800 <netif_set_addr+0x64>
800067e4:	01c10613          	addi	a2,sp,28
800067e8:	00040593          	mv	a1,s0
800067ec:	00048513          	mv	a0,s1
800067f0:	00d12623          	sw	a3,12(sp)
800067f4:	e91ff0ef          	jal	ra,80006684 <netif_do_set_ipaddr>
800067f8:	00c12683          	lw	a3,12(sp)
800067fc:	00100793          	li	a5,1
80006800:	00092703          	lw	a4,0(s2)
80006804:	0084a603          	lw	a2,8(s1)
80006808:	00c70463          	beq	a4,a2,80006810 <netif_set_addr+0x74>
8000680c:	00e4a423          	sw	a4,8(s1)
80006810:	0006a703          	lw	a4,0(a3)
80006814:	00c4a683          	lw	a3,12(s1)
80006818:	00d70463          	beq	a4,a3,80006820 <netif_set_addr+0x84>
8000681c:	00e4a623          	sw	a4,12(s1)
80006820:	00079a63          	bnez	a5,80006834 <netif_set_addr+0x98>
80006824:	01c10613          	addi	a2,sp,28
80006828:	00040593          	mv	a1,s0
8000682c:	00048513          	mv	a0,s1
80006830:	e55ff0ef          	jal	ra,80006684 <netif_do_set_ipaddr>
80006834:	02c12083          	lw	ra,44(sp)
80006838:	02812403          	lw	s0,40(sp)
8000683c:	02412483          	lw	s1,36(sp)
80006840:	02012903          	lw	s2,32(sp)
80006844:	03010113          	addi	sp,sp,48
80006848:	00008067          	ret

8000684c <netif_add>:
8000684c:	fe010113          	addi	sp,sp,-32
80006850:	00112e23          	sw	ra,28(sp)
80006854:	00812c23          	sw	s0,24(sp)
80006858:	00912a23          	sw	s1,20(sp)
8000685c:	02051063          	bnez	a0,8000687c <netif_add+0x30>
80006860:	00000413          	li	s0,0
80006864:	00040513          	mv	a0,s0
80006868:	01c12083          	lw	ra,28(sp)
8000686c:	01812403          	lw	s0,24(sp)
80006870:	01412483          	lw	s1,20(sp)
80006874:	02010113          	addi	sp,sp,32
80006878:	00008067          	ret
8000687c:	fe0782e3          	beqz	a5,80006860 <netif_add+0x14>
80006880:	00050413          	mv	s0,a0
80006884:	00059463          	bnez	a1,8000688c <netif_add+0x40>
80006888:	84818593          	addi	a1,gp,-1976 # 80002fe0 <ip_addr_any>
8000688c:	00061463          	bnez	a2,80006894 <netif_add+0x48>
80006890:	84818613          	addi	a2,gp,-1976 # 80002fe0 <ip_addr_any>
80006894:	00069463          	bnez	a3,8000689c <netif_add+0x50>
80006898:	84818693          	addi	a3,gp,-1976 # 80002fe0 <ip_addr_any>
8000689c:	02e42223          	sw	a4,36(s0)
800068a0:	8cc1c703          	lbu	a4,-1844(gp) # 80003064 <netif_num>
800068a4:	80006537          	lui	a0,0x80006
800068a8:	64850513          	addi	a0,a0,1608 # 80006648 <_ram_heap_end+0xffff4648>
800068ac:	00a42a23          	sw	a0,20(s0)
800068b0:	00042223          	sw	zero,4(s0)
800068b4:	00040513          	mv	a0,s0
800068b8:	00042423          	sw	zero,8(s0)
800068bc:	00042623          	sw	zero,12(s0)
800068c0:	02041623          	sh	zero,44(s0)
800068c4:	02040aa3          	sb	zero,53(s0)
800068c8:	02040423          	sb	zero,40(s0)
800068cc:	020404a3          	sb	zero,41(s0)
800068d0:	02040523          	sb	zero,42(s0)
800068d4:	020405a3          	sb	zero,43(s0)
800068d8:	00042e23          	sw	zero,28(s0)
800068dc:	02042023          	sw	zero,32(s0)
800068e0:	02e40c23          	sb	a4,56(s0)
800068e4:	01042823          	sw	a6,16(s0)
800068e8:	02042e23          	sw	zero,60(s0)
800068ec:	00f12623          	sw	a5,12(sp)
800068f0:	eadff0ef          	jal	ra,8000679c <netif_set_addr>
800068f4:	00c12783          	lw	a5,12(sp)
800068f8:	00040513          	mv	a0,s0
800068fc:	000780e7          	jalr	a5
80006900:	f60510e3          	bnez	a0,80006860 <netif_add+0x14>
80006904:	8d41a603          	lw	a2,-1836(gp) # 8000306c <netif_list>
80006908:	00078713          	mv	a4,a5
8000690c:	0ff00593          	li	a1,255
80006910:	03844783          	lbu	a5,56(s0)
80006914:	00b79463          	bne	a5,a1,8000691c <netif_add+0xd0>
80006918:	02040c23          	sb	zero,56(s0)
8000691c:	03844783          	lbu	a5,56(s0)
80006920:	00060693          	mv	a3,a2
80006924:	02069463          	bnez	a3,8000694c <netif_add+0x100>
80006928:	0fe00593          	li	a1,254
8000692c:	00000693          	li	a3,0
80006930:	00b78663          	beq	a5,a1,8000693c <netif_add+0xf0>
80006934:	00178793          	addi	a5,a5,1
80006938:	0ff7f693          	andi	a3,a5,255
8000693c:	00c42023          	sw	a2,0(s0)
80006940:	8cd18623          	sb	a3,-1844(gp) # 80003064 <netif_num>
80006944:	8c81aa23          	sw	s0,-1836(gp) # 8000306c <netif_list>
80006948:	f1dff06f          	j	80006864 <netif_add+0x18>
8000694c:	0386c503          	lbu	a0,56(a3)
80006950:	00f51863          	bne	a0,a5,80006960 <netif_add+0x114>
80006954:	00178793          	addi	a5,a5,1
80006958:	02f40c23          	sb	a5,56(s0)
8000695c:	fb5ff06f          	j	80006910 <netif_add+0xc4>
80006960:	0006a683          	lw	a3,0(a3)
80006964:	fc1ff06f          	j	80006924 <netif_add+0xd8>

80006968 <netif_add_noaddr>:
80006968:	00068813          	mv	a6,a3
8000696c:	00060793          	mv	a5,a2
80006970:	00058713          	mv	a4,a1
80006974:	00000693          	li	a3,0
80006978:	00000613          	li	a2,0
8000697c:	00000593          	li	a1,0
80006980:	ecdff06f          	j	8000684c <netif_add>

80006984 <netif_set_default>:
80006984:	8ca1a823          	sw	a0,-1840(gp) # 80003068 <netif_default>
80006988:	00008067          	ret

8000698c <netif_set_up>:
8000698c:	04050e63          	beqz	a0,800069e8 <netif_set_up+0x5c>
80006990:	ff010113          	addi	sp,sp,-16
80006994:	00812423          	sw	s0,8(sp)
80006998:	00112623          	sw	ra,12(sp)
8000699c:	03554783          	lbu	a5,53(a0)
800069a0:	00050413          	mv	s0,a0
800069a4:	0017f713          	andi	a4,a5,1
800069a8:	02071863          	bnez	a4,800069d8 <netif_set_up+0x4c>
800069ac:	0017e793          	ori	a5,a5,1
800069b0:	02f50aa3          	sb	a5,53(a0)
800069b4:	01c52783          	lw	a5,28(a0)
800069b8:	00078463          	beqz	a5,800069c0 <netif_set_up+0x34>
800069bc:	000780e7          	jalr	a5
800069c0:	00040513          	mv	a0,s0
800069c4:	00812403          	lw	s0,8(sp)
800069c8:	00c12083          	lw	ra,12(sp)
800069cc:	00300593          	li	a1,3
800069d0:	01010113          	addi	sp,sp,16
800069d4:	c7dff06f          	j	80006650 <netif_issue_reports>
800069d8:	00c12083          	lw	ra,12(sp)
800069dc:	00812403          	lw	s0,8(sp)
800069e0:	01010113          	addi	sp,sp,16
800069e4:	00008067          	ret
800069e8:	00008067          	ret

800069ec <netif_set_down>:
800069ec:	06050063          	beqz	a0,80006a4c <netif_set_down+0x60>
800069f0:	ff010113          	addi	sp,sp,-16
800069f4:	00812423          	sw	s0,8(sp)
800069f8:	00112623          	sw	ra,12(sp)
800069fc:	03554783          	lbu	a5,53(a0)
80006a00:	00050413          	mv	s0,a0
80006a04:	0017f713          	andi	a4,a5,1
80006a08:	02070a63          	beqz	a4,80006a3c <netif_set_down+0x50>
80006a0c:	ffe7f713          	andi	a4,a5,-2
80006a10:	02e50aa3          	sb	a4,53(a0)
80006a14:	0087f793          	andi	a5,a5,8
80006a18:	00078463          	beqz	a5,80006a20 <netif_set_down+0x34>
80006a1c:	1cc040ef          	jal	ra,8000abe8 <etharp_cleanup_netif>
80006a20:	01c42303          	lw	t1,28(s0)
80006a24:	00030c63          	beqz	t1,80006a3c <netif_set_down+0x50>
80006a28:	00040513          	mv	a0,s0
80006a2c:	00812403          	lw	s0,8(sp)
80006a30:	00c12083          	lw	ra,12(sp)
80006a34:	01010113          	addi	sp,sp,16
80006a38:	00030067          	jr	t1
80006a3c:	00c12083          	lw	ra,12(sp)
80006a40:	00812403          	lw	s0,8(sp)
80006a44:	01010113          	addi	sp,sp,16
80006a48:	00008067          	ret
80006a4c:	00008067          	ret

80006a50 <netif_remove>:
80006a50:	08050e63          	beqz	a0,80006aec <netif_remove+0x9c>
80006a54:	ff010113          	addi	sp,sp,-16
80006a58:	00812423          	sw	s0,8(sp)
80006a5c:	00112623          	sw	ra,12(sp)
80006a60:	00912223          	sw	s1,4(sp)
80006a64:	00452783          	lw	a5,4(a0)
80006a68:	00050413          	mv	s0,a0
80006a6c:	02078063          	beqz	a5,80006a8c <netif_remove+0x3c>
80006a70:	00450493          	addi	s1,a0,4
80006a74:	00000593          	li	a1,0
80006a78:	00048513          	mv	a0,s1
80006a7c:	0a8020ef          	jal	ra,80008b24 <udp_netif_ip_addr_changed>
80006a80:	00000593          	li	a1,0
80006a84:	00048513          	mv	a0,s1
80006a88:	508010ef          	jal	ra,80007f90 <raw_netif_ip_addr_changed>
80006a8c:	03544783          	lbu	a5,53(s0)
80006a90:	0017f793          	andi	a5,a5,1
80006a94:	00078663          	beqz	a5,80006aa0 <netif_remove+0x50>
80006a98:	00040513          	mv	a0,s0
80006a9c:	f51ff0ef          	jal	ra,800069ec <netif_set_down>
80006aa0:	8d01a703          	lw	a4,-1840(gp) # 80003068 <netif_default>
80006aa4:	00871463          	bne	a4,s0,80006aac <netif_remove+0x5c>
80006aa8:	8c01a823          	sw	zero,-1840(gp) # 80003068 <netif_default>
80006aac:	8d41a783          	lw	a5,-1836(gp) # 8000306c <netif_list>
80006ab0:	02879263          	bne	a5,s0,80006ad4 <netif_remove+0x84>
80006ab4:	00042783          	lw	a5,0(s0)
80006ab8:	8cf1aa23          	sw	a5,-1836(gp) # 8000306c <netif_list>
80006abc:	00c12083          	lw	ra,12(sp)
80006ac0:	00812403          	lw	s0,8(sp)
80006ac4:	00412483          	lw	s1,4(sp)
80006ac8:	01010113          	addi	sp,sp,16
80006acc:	00008067          	ret
80006ad0:	00070793          	mv	a5,a4
80006ad4:	fe0784e3          	beqz	a5,80006abc <netif_remove+0x6c>
80006ad8:	0007a703          	lw	a4,0(a5)
80006adc:	fe871ae3          	bne	a4,s0,80006ad0 <netif_remove+0x80>
80006ae0:	00042703          	lw	a4,0(s0)
80006ae4:	00e7a023          	sw	a4,0(a5)
80006ae8:	fd5ff06f          	j	80006abc <netif_remove+0x6c>
80006aec:	00008067          	ret

80006af0 <netif_set_status_callback>:
80006af0:	00050463          	beqz	a0,80006af8 <netif_set_status_callback+0x8>
80006af4:	00b52e23          	sw	a1,28(a0)
80006af8:	00008067          	ret

80006afc <netif_set_link_up>:
80006afc:	06050263          	beqz	a0,80006b60 <netif_set_link_up+0x64>
80006b00:	ff010113          	addi	sp,sp,-16
80006b04:	00812423          	sw	s0,8(sp)
80006b08:	00112623          	sw	ra,12(sp)
80006b0c:	03554783          	lbu	a5,53(a0)
80006b10:	00050413          	mv	s0,a0
80006b14:	0047f713          	andi	a4,a5,4
80006b18:	02071c63          	bnez	a4,80006b50 <netif_set_link_up+0x54>
80006b1c:	0047e793          	ori	a5,a5,4
80006b20:	02f50aa3          	sb	a5,53(a0)
80006b24:	3c8030ef          	jal	ra,80009eec <dhcp_network_changed>
80006b28:	00300593          	li	a1,3
80006b2c:	00040513          	mv	a0,s0
80006b30:	b21ff0ef          	jal	ra,80006650 <netif_issue_reports>
80006b34:	02042303          	lw	t1,32(s0)
80006b38:	00030c63          	beqz	t1,80006b50 <netif_set_link_up+0x54>
80006b3c:	00040513          	mv	a0,s0
80006b40:	00812403          	lw	s0,8(sp)
80006b44:	00c12083          	lw	ra,12(sp)
80006b48:	01010113          	addi	sp,sp,16
80006b4c:	00030067          	jr	t1
80006b50:	00c12083          	lw	ra,12(sp)
80006b54:	00812403          	lw	s0,8(sp)
80006b58:	01010113          	addi	sp,sp,16
80006b5c:	00008067          	ret
80006b60:	00008067          	ret

80006b64 <netif_set_link_down>:
80006b64:	02050263          	beqz	a0,80006b88 <netif_set_link_down+0x24>
80006b68:	03554703          	lbu	a4,53(a0)
80006b6c:	00477693          	andi	a3,a4,4
80006b70:	00068c63          	beqz	a3,80006b88 <netif_set_link_down+0x24>
80006b74:	02052303          	lw	t1,32(a0)
80006b78:	ffb77713          	andi	a4,a4,-5
80006b7c:	02e50aa3          	sb	a4,53(a0)
80006b80:	00030463          	beqz	t1,80006b88 <netif_set_link_down+0x24>
80006b84:	00030067          	jr	t1
80006b88:	00008067          	ret

80006b8c <netif_set_link_callback>:
80006b8c:	00050463          	beqz	a0,80006b94 <netif_set_link_callback+0x8>
80006b90:	02b52023          	sw	a1,32(a0)
80006b94:	00008067          	ret

80006b98 <netif_get_by_index>:
80006b98:	00000793          	li	a5,0
80006b9c:	00050663          	beqz	a0,80006ba8 <netif_get_by_index+0x10>
80006ba0:	8d41a783          	lw	a5,-1836(gp) # 8000306c <netif_list>
80006ba4:	00079663          	bnez	a5,80006bb0 <netif_get_by_index+0x18>
80006ba8:	00078513          	mv	a0,a5
80006bac:	00008067          	ret
80006bb0:	0387c703          	lbu	a4,56(a5)
80006bb4:	00170713          	addi	a4,a4,1
80006bb8:	0ff77713          	andi	a4,a4,255
80006bbc:	fea706e3          	beq	a4,a0,80006ba8 <netif_get_by_index+0x10>
80006bc0:	0007a783          	lw	a5,0(a5)
80006bc4:	fe1ff06f          	j	80006ba4 <netif_get_by_index+0xc>

80006bc8 <netif_index_to_name>:
80006bc8:	ff010113          	addi	sp,sp,-16
80006bcc:	00812423          	sw	s0,8(sp)
80006bd0:	00912223          	sw	s1,4(sp)
80006bd4:	00112623          	sw	ra,12(sp)
80006bd8:	00050493          	mv	s1,a0
80006bdc:	00058413          	mv	s0,a1
80006be0:	fb9ff0ef          	jal	ra,80006b98 <netif_get_by_index>
80006be4:	02050463          	beqz	a0,80006c0c <netif_index_to_name+0x44>
80006be8:	03654783          	lbu	a5,54(a0)
80006bec:	fff48613          	addi	a2,s1,-1
80006bf0:	00400593          	li	a1,4
80006bf4:	00f40023          	sb	a5,0(s0)
80006bf8:	03754783          	lbu	a5,55(a0)
80006bfc:	00240513          	addi	a0,s0,2
80006c00:	00f400a3          	sb	a5,1(s0)
80006c04:	a20ff0ef          	jal	ra,80005e24 <lwip_itoa>
80006c08:	00040513          	mv	a0,s0
80006c0c:	00c12083          	lw	ra,12(sp)
80006c10:	00812403          	lw	s0,8(sp)
80006c14:	00412483          	lw	s1,4(sp)
80006c18:	01010113          	addi	sp,sp,16
80006c1c:	00008067          	ret

80006c20 <netif_find>:
80006c20:	00051663          	bnez	a0,80006c2c <netif_find+0xc>
80006c24:	00000513          	li	a0,0
80006c28:	00008067          	ret
80006c2c:	ff010113          	addi	sp,sp,-16
80006c30:	00812423          	sw	s0,8(sp)
80006c34:	00050413          	mv	s0,a0
80006c38:	00250513          	addi	a0,a0,2
80006c3c:	00112623          	sw	ra,12(sp)
80006c40:	409060ef          	jal	ra,8000d848 <atoi>
80006c44:	0ff57793          	andi	a5,a0,255
80006c48:	8d41a503          	lw	a0,-1836(gp) # 8000306c <netif_list>
80006c4c:	00051c63          	bnez	a0,80006c64 <netif_find+0x44>
80006c50:	00000513          	li	a0,0
80006c54:	00c12083          	lw	ra,12(sp)
80006c58:	00812403          	lw	s0,8(sp)
80006c5c:	01010113          	addi	sp,sp,16
80006c60:	00008067          	ret
80006c64:	03854703          	lbu	a4,56(a0)
80006c68:	00f71e63          	bne	a4,a5,80006c84 <netif_find+0x64>
80006c6c:	00044683          	lbu	a3,0(s0)
80006c70:	03654703          	lbu	a4,54(a0)
80006c74:	00e69863          	bne	a3,a4,80006c84 <netif_find+0x64>
80006c78:	00144683          	lbu	a3,1(s0)
80006c7c:	03754703          	lbu	a4,55(a0)
80006c80:	fce68ae3          	beq	a3,a4,80006c54 <netif_find+0x34>
80006c84:	00052503          	lw	a0,0(a0)
80006c88:	fc5ff06f          	j	80006c4c <netif_find+0x2c>

80006c8c <netif_name_to_index>:
80006c8c:	ff010113          	addi	sp,sp,-16
80006c90:	00112623          	sw	ra,12(sp)
80006c94:	f8dff0ef          	jal	ra,80006c20 <netif_find>
80006c98:	00050e63          	beqz	a0,80006cb4 <netif_name_to_index+0x28>
80006c9c:	03854503          	lbu	a0,56(a0)
80006ca0:	00150513          	addi	a0,a0,1
80006ca4:	0ff57513          	andi	a0,a0,255
80006ca8:	00c12083          	lw	ra,12(sp)
80006cac:	01010113          	addi	sp,sp,16
80006cb0:	00008067          	ret
80006cb4:	00000513          	li	a0,0
80006cb8:	ff1ff06f          	j	80006ca8 <netif_name_to_index+0x1c>

80006cbc <pbuf_skip_const>:
80006cbc:	00050663          	beqz	a0,80006cc8 <pbuf_skip_const+0xc>
80006cc0:	00a55783          	lhu	a5,10(a0)
80006cc4:	00f5f863          	bgeu	a1,a5,80006cd4 <pbuf_skip_const+0x18>
80006cc8:	00060463          	beqz	a2,80006cd0 <pbuf_skip_const+0x14>
80006ccc:	00b61023          	sh	a1,0(a2)
80006cd0:	00008067          	ret
80006cd4:	40f585b3          	sub	a1,a1,a5
80006cd8:	01059593          	slli	a1,a1,0x10
80006cdc:	0105d593          	srli	a1,a1,0x10
80006ce0:	00052503          	lw	a0,0(a0)
80006ce4:	fd9ff06f          	j	80006cbc <pbuf_skip_const>

80006ce8 <pbuf_add_header_impl>:
80006ce8:	00050793          	mv	a5,a0
80006cec:	08050263          	beqz	a0,80006d70 <pbuf_add_header_impl+0x88>
80006cf0:	00010737          	lui	a4,0x10
80006cf4:	00100513          	li	a0,1
80006cf8:	06e5fe63          	bgeu	a1,a4,80006d74 <pbuf_add_header_impl+0x8c>
80006cfc:	00000513          	li	a0,0
80006d00:	06058a63          	beqz	a1,80006d74 <pbuf_add_header_impl+0x8c>
80006d04:	0087d703          	lhu	a4,8(a5)
80006d08:	01059693          	slli	a3,a1,0x10
80006d0c:	0106d693          	srli	a3,a3,0x10
80006d10:	00e68733          	add	a4,a3,a4
80006d14:	01071713          	slli	a4,a4,0x10
80006d18:	01075713          	srli	a4,a4,0x10
80006d1c:	00100513          	li	a0,1
80006d20:	04d76a63          	bltu	a4,a3,80006d74 <pbuf_add_header_impl+0x8c>
80006d24:	00c78503          	lb	a0,12(a5)
80006d28:	00055e63          	bgez	a0,80006d44 <pbuf_add_header_impl+0x5c>
80006d2c:	0047a603          	lw	a2,4(a5)
80006d30:	00100513          	li	a0,1
80006d34:	40b605b3          	sub	a1,a2,a1
80006d38:	01078613          	addi	a2,a5,16
80006d3c:	00c5fc63          	bgeu	a1,a2,80006d54 <pbuf_add_header_impl+0x6c>
80006d40:	00008067          	ret
80006d44:	00100513          	li	a0,1
80006d48:	02060663          	beqz	a2,80006d74 <pbuf_add_header_impl+0x8c>
80006d4c:	0047a603          	lw	a2,4(a5)
80006d50:	40b605b3          	sub	a1,a2,a1
80006d54:	00a7d603          	lhu	a2,10(a5)
80006d58:	00b7a223          	sw	a1,4(a5)
80006d5c:	00e79423          	sh	a4,8(a5)
80006d60:	00c686b3          	add	a3,a3,a2
80006d64:	00d79523          	sh	a3,10(a5)
80006d68:	00000513          	li	a0,0
80006d6c:	00008067          	ret
80006d70:	00100513          	li	a0,1
80006d74:	00008067          	ret

80006d78 <pbuf_alloc_reference>:
80006d78:	ff010113          	addi	sp,sp,-16
80006d7c:	00812423          	sw	s0,8(sp)
80006d80:	00058413          	mv	s0,a1
80006d84:	800035b7          	lui	a1,0x80003
80006d88:	00912223          	sw	s1,4(sp)
80006d8c:	01212023          	sw	s2,0(sp)
80006d90:	00060493          	mv	s1,a2
80006d94:	00050913          	mv	s2,a0
80006d98:	14c00613          	li	a2,332
80006d9c:	bd858593          	addi	a1,a1,-1064 # 80002bd8 <_ram_heap_end+0xffff0bd8>
80006da0:	00400513          	li	a0,4
80006da4:	00112623          	sw	ra,12(sp)
80006da8:	841ff0ef          	jal	ra,800065e8 <memp_malloc_fn>
80006dac:	02050263          	beqz	a0,80006dd0 <pbuf_alloc_reference+0x58>
80006db0:	00100793          	li	a5,1
80006db4:	00052023          	sw	zero,0(a0)
80006db8:	01252223          	sw	s2,4(a0)
80006dbc:	00851423          	sh	s0,8(a0)
80006dc0:	00851523          	sh	s0,10(a0)
80006dc4:	00950623          	sb	s1,12(a0)
80006dc8:	000506a3          	sb	zero,13(a0)
80006dcc:	00f51723          	sh	a5,14(a0)
80006dd0:	00c12083          	lw	ra,12(sp)
80006dd4:	00812403          	lw	s0,8(sp)
80006dd8:	00412483          	lw	s1,4(sp)
80006ddc:	00012903          	lw	s2,0(sp)
80006de0:	01010113          	addi	sp,sp,16
80006de4:	00008067          	ret

80006de8 <pbuf_alloced_custom>:
80006de8:	01051513          	slli	a0,a0,0x10
80006dec:	01055513          	srli	a0,a0,0x10
80006df0:	00350513          	addi	a0,a0,3
80006df4:	ffc57513          	andi	a0,a0,-4
80006df8:	00a58833          	add	a6,a1,a0
80006dfc:	0307ec63          	bltu	a5,a6,80006e34 <pbuf_alloced_custom+0x4c>
80006e00:	00070463          	beqz	a4,80006e08 <pbuf_alloced_custom+0x20>
80006e04:	00a70733          	add	a4,a4,a0
80006e08:	00200793          	li	a5,2
80006e0c:	00f686a3          	sb	a5,13(a3)
80006e10:	00100793          	li	a5,1
80006e14:	00068513          	mv	a0,a3
80006e18:	0006a023          	sw	zero,0(a3)
80006e1c:	00e6a223          	sw	a4,4(a3)
80006e20:	00b69423          	sh	a1,8(a3)
80006e24:	00b69523          	sh	a1,10(a3)
80006e28:	00c68623          	sb	a2,12(a3)
80006e2c:	00f69723          	sh	a5,14(a3)
80006e30:	00008067          	ret
80006e34:	00000513          	li	a0,0
80006e38:	00008067          	ret

80006e3c <pbuf_add_header>:
80006e3c:	00000613          	li	a2,0
80006e40:	ea9ff06f          	j	80006ce8 <pbuf_add_header_impl>

80006e44 <pbuf_add_header_force>:
80006e44:	00100613          	li	a2,1
80006e48:	ea1ff06f          	j	80006ce8 <pbuf_add_header_impl>

80006e4c <pbuf_remove_header>:
80006e4c:	00050793          	mv	a5,a0
80006e50:	04050a63          	beqz	a0,80006ea4 <pbuf_remove_header+0x58>
80006e54:	00010737          	lui	a4,0x10
80006e58:	00100513          	li	a0,1
80006e5c:	04e5f663          	bgeu	a1,a4,80006ea8 <pbuf_remove_header+0x5c>
80006e60:	00000513          	li	a0,0
80006e64:	04058263          	beqz	a1,80006ea8 <pbuf_remove_header+0x5c>
80006e68:	00a7d703          	lhu	a4,10(a5)
80006e6c:	01059693          	slli	a3,a1,0x10
80006e70:	0106d693          	srli	a3,a3,0x10
80006e74:	00100513          	li	a0,1
80006e78:	02d76863          	bltu	a4,a3,80006ea8 <pbuf_remove_header+0x5c>
80006e7c:	40d70733          	sub	a4,a4,a3
80006e80:	0047a603          	lw	a2,4(a5)
80006e84:	00e79523          	sh	a4,10(a5)
80006e88:	0087d703          	lhu	a4,8(a5)
80006e8c:	00b605b3          	add	a1,a2,a1
80006e90:	00b7a223          	sw	a1,4(a5)
80006e94:	40d70733          	sub	a4,a4,a3
80006e98:	00e79423          	sh	a4,8(a5)
80006e9c:	00000513          	li	a0,0
80006ea0:	00008067          	ret
80006ea4:	00100513          	li	a0,1
80006ea8:	00008067          	ret

80006eac <pbuf_header>:
80006eac:	0005d663          	bgez	a1,80006eb8 <pbuf_header+0xc>
80006eb0:	40b005b3          	neg	a1,a1
80006eb4:	f99ff06f          	j	80006e4c <pbuf_remove_header>
80006eb8:	00000613          	li	a2,0
80006ebc:	e2dff06f          	j	80006ce8 <pbuf_add_header_impl>

80006ec0 <pbuf_header_force>:
80006ec0:	0005d663          	bgez	a1,80006ecc <pbuf_header_force+0xc>
80006ec4:	40b005b3          	neg	a1,a1
80006ec8:	f85ff06f          	j	80006e4c <pbuf_remove_header>
80006ecc:	00100613          	li	a2,1
80006ed0:	e19ff06f          	j	80006ce8 <pbuf_add_header_impl>

80006ed4 <pbuf_free>:
80006ed4:	fd010113          	addi	sp,sp,-48
80006ed8:	02812423          	sw	s0,40(sp)
80006edc:	02112623          	sw	ra,44(sp)
80006ee0:	02912223          	sw	s1,36(sp)
80006ee4:	03212023          	sw	s2,32(sp)
80006ee8:	01312e23          	sw	s3,28(sp)
80006eec:	00000413          	li	s0,0
80006ef0:	06050463          	beqz	a0,80006f58 <pbuf_free+0x84>
80006ef4:	00050593          	mv	a1,a0
80006ef8:	00000413          	li	s0,0
80006efc:	00200913          	li	s2,2
80006f00:	00100993          	li	s3,1
80006f04:	00b12623          	sw	a1,12(sp)
80006f08:	f25fd0ef          	jal	ra,80004e2c <sys_arch_protect>
80006f0c:	00c12583          	lw	a1,12(sp)
80006f10:	00e5c483          	lbu	s1,14(a1)
80006f14:	fff48493          	addi	s1,s1,-1
80006f18:	0ff4f493          	andi	s1,s1,255
80006f1c:	00958723          	sb	s1,14(a1)
80006f20:	f11fd0ef          	jal	ra,80004e30 <sys_arch_unprotect>
80006f24:	02049a63          	bnez	s1,80006f58 <pbuf_free+0x84>
80006f28:	00c12583          	lw	a1,12(sp)
80006f2c:	00d5c783          	lbu	a5,13(a1)
80006f30:	0005a483          	lw	s1,0(a1)
80006f34:	0027f793          	andi	a5,a5,2
80006f38:	04078063          	beqz	a5,80006f78 <pbuf_free+0xa4>
80006f3c:	0105a783          	lw	a5,16(a1)
80006f40:	00058513          	mv	a0,a1
80006f44:	000780e7          	jalr	a5
80006f48:	00140413          	addi	s0,s0,1
80006f4c:	0ff47413          	andi	s0,s0,255
80006f50:	00048593          	mv	a1,s1
80006f54:	fa0498e3          	bnez	s1,80006f04 <pbuf_free+0x30>
80006f58:	00040513          	mv	a0,s0
80006f5c:	02c12083          	lw	ra,44(sp)
80006f60:	02812403          	lw	s0,40(sp)
80006f64:	02412483          	lw	s1,36(sp)
80006f68:	02012903          	lw	s2,32(sp)
80006f6c:	01c12983          	lw	s3,28(sp)
80006f70:	03010113          	addi	sp,sp,48
80006f74:	00008067          	ret
80006f78:	00c5c783          	lbu	a5,12(a1)
80006f7c:	00500513          	li	a0,5
80006f80:	00f7f793          	andi	a5,a5,15
80006f84:	01278663          	beq	a5,s2,80006f90 <pbuf_free+0xbc>
80006f88:	01379863          	bne	a5,s3,80006f98 <pbuf_free+0xc4>
80006f8c:	00400513          	li	a0,4
80006f90:	e90ff0ef          	jal	ra,80006620 <memp_free>
80006f94:	fb5ff06f          	j	80006f48 <pbuf_free+0x74>
80006f98:	fa0798e3          	bnez	a5,80006f48 <pbuf_free+0x74>
80006f9c:	00058513          	mv	a0,a1
80006fa0:	d44ff0ef          	jal	ra,800064e4 <lwip_free>
80006fa4:	fa5ff06f          	j	80006f48 <pbuf_free+0x74>

80006fa8 <pbuf_alloc>:
80006fa8:	fe010113          	addi	sp,sp,-32
80006fac:	01212823          	sw	s2,16(sp)
80006fb0:	00112e23          	sw	ra,28(sp)
80006fb4:	00812c23          	sw	s0,24(sp)
80006fb8:	00912a23          	sw	s1,20(sp)
80006fbc:	01312623          	sw	s3,12(sp)
80006fc0:	01412423          	sw	s4,8(sp)
80006fc4:	01512223          	sw	s5,4(sp)
80006fc8:	01612023          	sw	s6,0(sp)
80006fcc:	04100793          	li	a5,65
80006fd0:	00058913          	mv	s2,a1
80006fd4:	0cf60263          	beq	a2,a5,80007098 <pbuf_alloc+0xf0>
80006fd8:	02c7ee63          	bltu	a5,a2,80007014 <pbuf_alloc+0x6c>
80006fdc:	00100793          	li	a5,1
80006fe0:	0af60c63          	beq	a2,a5,80007098 <pbuf_alloc+0xf0>
80006fe4:	00000493          	li	s1,0
80006fe8:	01c12083          	lw	ra,28(sp)
80006fec:	01812403          	lw	s0,24(sp)
80006ff0:	00048513          	mv	a0,s1
80006ff4:	01012903          	lw	s2,16(sp)
80006ff8:	01412483          	lw	s1,20(sp)
80006ffc:	00c12983          	lw	s3,12(sp)
80007000:	00812a03          	lw	s4,8(sp)
80007004:	00412a83          	lw	s5,4(sp)
80007008:	00012b03          	lw	s6,0(sp)
8000700c:	02010113          	addi	sp,sp,32
80007010:	00008067          	ret
80007014:	01051413          	slli	s0,a0,0x10
80007018:	18200793          	li	a5,386
8000701c:	01045413          	srli	s0,s0,0x10
80007020:	0af60463          	beq	a2,a5,800070c8 <pbuf_alloc+0x120>
80007024:	28000793          	li	a5,640
80007028:	faf61ee3          	bne	a2,a5,80006fe4 <pbuf_alloc+0x3c>
8000702c:	00340413          	addi	s0,s0,3
80007030:	00358793          	addi	a5,a1,3
80007034:	ffc47413          	andi	s0,s0,-4
80007038:	ffc7f793          	andi	a5,a5,-4
8000703c:	00f40433          	add	s0,s0,a5
80007040:	01041413          	slli	s0,s0,0x10
80007044:	01045413          	srli	s0,s0,0x10
80007048:	00050993          	mv	s3,a0
8000704c:	01040513          	addi	a0,s0,16
80007050:	f8f46ae3          	bltu	s0,a5,80006fe4 <pbuf_alloc+0x3c>
80007054:	f8f568e3          	bltu	a0,a5,80006fe4 <pbuf_alloc+0x3c>
80007058:	c58ff0ef          	jal	ra,800064b0 <lwip_malloc>
8000705c:	00050493          	mv	s1,a0
80007060:	f80504e3          	beqz	a0,80006fe8 <pbuf_alloc+0x40>
80007064:	01099993          	slli	s3,s3,0x10
80007068:	0109d993          	srli	s3,s3,0x10
8000706c:	013509b3          	add	s3,a0,s3
80007070:	01398993          	addi	s3,s3,19
80007074:	000107b7          	lui	a5,0x10
80007078:	ffc9f993          	andi	s3,s3,-4
8000707c:	08078793          	addi	a5,a5,128 # 10080 <_stack_size+0xf880>
80007080:	00052023          	sw	zero,0(a0)
80007084:	01352223          	sw	s3,4(a0)
80007088:	01251423          	sh	s2,8(a0)
8000708c:	01251523          	sh	s2,10(a0)
80007090:	00f52623          	sw	a5,12(a0)
80007094:	f55ff06f          	j	80006fe8 <pbuf_alloc+0x40>
80007098:	01812403          	lw	s0,24(sp)
8000709c:	01c12083          	lw	ra,28(sp)
800070a0:	01412483          	lw	s1,20(sp)
800070a4:	00c12983          	lw	s3,12(sp)
800070a8:	00812a03          	lw	s4,8(sp)
800070ac:	00412a83          	lw	s5,4(sp)
800070b0:	00012b03          	lw	s6,0(sp)
800070b4:	00090593          	mv	a1,s2
800070b8:	01012903          	lw	s2,16(sp)
800070bc:	00000513          	li	a0,0
800070c0:	02010113          	addi	sp,sp,32
800070c4:	cb5ff06f          	j	80006d78 <pbuf_alloc_reference>
800070c8:	000109b7          	lui	s3,0x10
800070cc:	00000a13          	li	s4,0
800070d0:	00000493          	li	s1,0
800070d4:	80003ab7          	lui	s5,0x80003
800070d8:	5ec00b13          	li	s6,1516
800070dc:	08298993          	addi	s3,s3,130 # 10082 <_stack_size+0xf882>
800070e0:	0f300613          	li	a2,243
800070e4:	bd8a8593          	addi	a1,s5,-1064 # 80002bd8 <_ram_heap_end+0xffff0bd8>
800070e8:	00500513          	li	a0,5
800070ec:	cfcff0ef          	jal	ra,800065e8 <memp_malloc_fn>
800070f0:	00051a63          	bnez	a0,80007104 <pbuf_alloc+0x15c>
800070f4:	ee0488e3          	beqz	s1,80006fe4 <pbuf_alloc+0x3c>
800070f8:	00048513          	mv	a0,s1
800070fc:	dd9ff0ef          	jal	ra,80006ed4 <pbuf_free>
80007100:	ee5ff06f          	j	80006fe4 <pbuf_alloc+0x3c>
80007104:	00340793          	addi	a5,s0,3
80007108:	ffc7f793          	andi	a5,a5,-4
8000710c:	40fb07b3          	sub	a5,s6,a5
80007110:	00078713          	mv	a4,a5
80007114:	01079793          	slli	a5,a5,0x10
80007118:	0107d793          	srli	a5,a5,0x10
8000711c:	00f97463          	bgeu	s2,a5,80007124 <pbuf_alloc+0x17c>
80007120:	00090713          	mv	a4,s2
80007124:	00850433          	add	s0,a0,s0
80007128:	01340413          	addi	s0,s0,19
8000712c:	ffc47413          	andi	s0,s0,-4
80007130:	01071793          	slli	a5,a4,0x10
80007134:	00052023          	sw	zero,0(a0)
80007138:	00852223          	sw	s0,4(a0)
8000713c:	01251423          	sh	s2,8(a0)
80007140:	00e51523          	sh	a4,10(a0)
80007144:	01352623          	sw	s3,12(a0)
80007148:	0107d793          	srli	a5,a5,0x10
8000714c:	02048263          	beqz	s1,80007170 <pbuf_alloc+0x1c8>
80007150:	00aa2023          	sw	a0,0(s4)
80007154:	40f90933          	sub	s2,s2,a5
80007158:	01091913          	slli	s2,s2,0x10
8000715c:	01095913          	srli	s2,s2,0x10
80007160:	00000413          	li	s0,0
80007164:	00050a13          	mv	s4,a0
80007168:	f6091ce3          	bnez	s2,800070e0 <pbuf_alloc+0x138>
8000716c:	e7dff06f          	j	80006fe8 <pbuf_alloc+0x40>
80007170:	00050493          	mv	s1,a0
80007174:	fe1ff06f          	j	80007154 <pbuf_alloc+0x1ac>

80007178 <pbuf_realloc>:
80007178:	00855783          	lhu	a5,8(a0)
8000717c:	0af5f463          	bgeu	a1,a5,80007224 <pbuf_realloc+0xac>
80007180:	ff010113          	addi	sp,sp,-16
80007184:	00812423          	sw	s0,8(sp)
80007188:	00912223          	sw	s1,4(sp)
8000718c:	00112623          	sw	ra,12(sp)
80007190:	00050413          	mv	s0,a0
80007194:	00058493          	mv	s1,a1
80007198:	40f587b3          	sub	a5,a1,a5
8000719c:	00a45583          	lhu	a1,10(s0)
800071a0:	0695e263          	bltu	a1,s1,80007204 <pbuf_realloc+0x8c>
800071a4:	00c44783          	lbu	a5,12(s0)
800071a8:	00f7f793          	andi	a5,a5,15
800071ac:	02079663          	bnez	a5,800071d8 <pbuf_realloc+0x60>
800071b0:	02958463          	beq	a1,s1,800071d8 <pbuf_realloc+0x60>
800071b4:	00d44783          	lbu	a5,13(s0)
800071b8:	0027f793          	andi	a5,a5,2
800071bc:	00079e63          	bnez	a5,800071d8 <pbuf_realloc+0x60>
800071c0:	00442583          	lw	a1,4(s0)
800071c4:	00040513          	mv	a0,s0
800071c8:	408585b3          	sub	a1,a1,s0
800071cc:	009585b3          	add	a1,a1,s1
800071d0:	adcff0ef          	jal	ra,800064ac <mem_trim>
800071d4:	00050413          	mv	s0,a0
800071d8:	00042503          	lw	a0,0(s0)
800071dc:	00941523          	sh	s1,10(s0)
800071e0:	00941423          	sh	s1,8(s0)
800071e4:	00050463          	beqz	a0,800071ec <pbuf_realloc+0x74>
800071e8:	cedff0ef          	jal	ra,80006ed4 <pbuf_free>
800071ec:	00042023          	sw	zero,0(s0)
800071f0:	00c12083          	lw	ra,12(sp)
800071f4:	00812403          	lw	s0,8(sp)
800071f8:	00412483          	lw	s1,4(sp)
800071fc:	01010113          	addi	sp,sp,16
80007200:	00008067          	ret
80007204:	00845703          	lhu	a4,8(s0)
80007208:	40b484b3          	sub	s1,s1,a1
8000720c:	01049493          	slli	s1,s1,0x10
80007210:	00e78733          	add	a4,a5,a4
80007214:	00e41423          	sh	a4,8(s0)
80007218:	0104d493          	srli	s1,s1,0x10
8000721c:	00042403          	lw	s0,0(s0)
80007220:	f7dff06f          	j	8000719c <pbuf_realloc+0x24>
80007224:	00008067          	ret

80007228 <pbuf_free_header>:
80007228:	fe010113          	addi	sp,sp,-32
8000722c:	00812c23          	sw	s0,24(sp)
80007230:	00112e23          	sw	ra,28(sp)
80007234:	00912a23          	sw	s1,20(sp)
80007238:	00050413          	mv	s0,a0
8000723c:	04058263          	beqz	a1,80007280 <pbuf_free_header+0x58>
80007240:	04040063          	beqz	s0,80007280 <pbuf_free_header+0x58>
80007244:	00a45783          	lhu	a5,10(s0)
80007248:	02f5e863          	bltu	a1,a5,80007278 <pbuf_free_header+0x50>
8000724c:	40f585b3          	sub	a1,a1,a5
80007250:	00042483          	lw	s1,0(s0)
80007254:	01059593          	slli	a1,a1,0x10
80007258:	0105d593          	srli	a1,a1,0x10
8000725c:	00042023          	sw	zero,0(s0)
80007260:	00040513          	mv	a0,s0
80007264:	00b12623          	sw	a1,12(sp)
80007268:	c6dff0ef          	jal	ra,80006ed4 <pbuf_free>
8000726c:	00048413          	mv	s0,s1
80007270:	00c12583          	lw	a1,12(sp)
80007274:	fc9ff06f          	j	8000723c <pbuf_free_header+0x14>
80007278:	00040513          	mv	a0,s0
8000727c:	bd1ff0ef          	jal	ra,80006e4c <pbuf_remove_header>
80007280:	00040513          	mv	a0,s0
80007284:	01c12083          	lw	ra,28(sp)
80007288:	01812403          	lw	s0,24(sp)
8000728c:	01412483          	lw	s1,20(sp)
80007290:	02010113          	addi	sp,sp,32
80007294:	00008067          	ret

80007298 <pbuf_clen>:
80007298:	00000793          	li	a5,0
8000729c:	00051663          	bnez	a0,800072a8 <pbuf_clen+0x10>
800072a0:	00078513          	mv	a0,a5
800072a4:	00008067          	ret
800072a8:	00178793          	addi	a5,a5,1
800072ac:	01079793          	slli	a5,a5,0x10
800072b0:	0107d793          	srli	a5,a5,0x10
800072b4:	00052503          	lw	a0,0(a0)
800072b8:	fe5ff06f          	j	8000729c <pbuf_clen+0x4>

800072bc <pbuf_ref>:
800072bc:	02050a63          	beqz	a0,800072f0 <pbuf_ref+0x34>
800072c0:	ff010113          	addi	sp,sp,-16
800072c4:	00812423          	sw	s0,8(sp)
800072c8:	00112623          	sw	ra,12(sp)
800072cc:	00050413          	mv	s0,a0
800072d0:	b5dfd0ef          	jal	ra,80004e2c <sys_arch_protect>
800072d4:	00e44783          	lbu	a5,14(s0)
800072d8:	00178793          	addi	a5,a5,1
800072dc:	00f40723          	sb	a5,14(s0)
800072e0:	00812403          	lw	s0,8(sp)
800072e4:	00c12083          	lw	ra,12(sp)
800072e8:	01010113          	addi	sp,sp,16
800072ec:	b45fd06f          	j	80004e30 <sys_arch_unprotect>
800072f0:	00008067          	ret

800072f4 <pbuf_cat>:
800072f4:	02050a63          	beqz	a0,80007328 <pbuf_cat+0x34>
800072f8:	00059663          	bnez	a1,80007304 <pbuf_cat+0x10>
800072fc:	00008067          	ret
80007300:	00070513          	mv	a0,a4
80007304:	00855783          	lhu	a5,8(a0)
80007308:	0085d683          	lhu	a3,8(a1)
8000730c:	00052703          	lw	a4,0(a0)
80007310:	00d787b3          	add	a5,a5,a3
80007314:	01079793          	slli	a5,a5,0x10
80007318:	0107d793          	srli	a5,a5,0x10
8000731c:	00f51423          	sh	a5,8(a0)
80007320:	fe0710e3          	bnez	a4,80007300 <pbuf_cat+0xc>
80007324:	00b52023          	sw	a1,0(a0)
80007328:	00008067          	ret

8000732c <pbuf_chain>:
8000732c:	ff010113          	addi	sp,sp,-16
80007330:	00812423          	sw	s0,8(sp)
80007334:	00112623          	sw	ra,12(sp)
80007338:	00058413          	mv	s0,a1
8000733c:	fb9ff0ef          	jal	ra,800072f4 <pbuf_cat>
80007340:	00040513          	mv	a0,s0
80007344:	00812403          	lw	s0,8(sp)
80007348:	00c12083          	lw	ra,12(sp)
8000734c:	01010113          	addi	sp,sp,16
80007350:	f6dff06f          	j	800072bc <pbuf_ref>

80007354 <pbuf_dechain>:
80007354:	ff010113          	addi	sp,sp,-16
80007358:	00112623          	sw	ra,12(sp)
8000735c:	00812423          	sw	s0,8(sp)
80007360:	00052403          	lw	s0,0(a0)
80007364:	02040663          	beqz	s0,80007390 <pbuf_dechain+0x3c>
80007368:	00855783          	lhu	a5,8(a0)
8000736c:	00a55703          	lhu	a4,10(a0)
80007370:	40e787b3          	sub	a5,a5,a4
80007374:	00f41423          	sh	a5,8(s0)
80007378:	00a55783          	lhu	a5,10(a0)
8000737c:	00052023          	sw	zero,0(a0)
80007380:	00f51423          	sh	a5,8(a0)
80007384:	00040513          	mv	a0,s0
80007388:	b4dff0ef          	jal	ra,80006ed4 <pbuf_free>
8000738c:	00050463          	beqz	a0,80007394 <pbuf_dechain+0x40>
80007390:	00000413          	li	s0,0
80007394:	00040513          	mv	a0,s0
80007398:	00c12083          	lw	ra,12(sp)
8000739c:	00812403          	lw	s0,8(sp)
800073a0:	01010113          	addi	sp,sp,16
800073a4:	00008067          	ret

800073a8 <pbuf_copy>:
800073a8:	10050463          	beqz	a0,800074b0 <pbuf_copy+0x108>
800073ac:	fe010113          	addi	sp,sp,-32
800073b0:	00812c23          	sw	s0,24(sp)
800073b4:	00112e23          	sw	ra,28(sp)
800073b8:	00912a23          	sw	s1,20(sp)
800073bc:	01212823          	sw	s2,16(sp)
800073c0:	01312623          	sw	s3,12(sp)
800073c4:	01412423          	sw	s4,8(sp)
800073c8:	00058413          	mv	s0,a1
800073cc:	06058e63          	beqz	a1,80007448 <pbuf_copy+0xa0>
800073d0:	00855703          	lhu	a4,8(a0)
800073d4:	0085d783          	lhu	a5,8(a1)
800073d8:	00050493          	mv	s1,a0
800073dc:	06f76663          	bltu	a4,a5,80007448 <pbuf_copy+0xa0>
800073e0:	00000a13          	li	s4,0
800073e4:	00000993          	li	s3,0
800073e8:	00a4d903          	lhu	s2,10(s1)
800073ec:	00a45783          	lhu	a5,10(s0)
800073f0:	41390933          	sub	s2,s2,s3
800073f4:	414787b3          	sub	a5,a5,s4
800073f8:	0127f463          	bgeu	a5,s2,80007400 <pbuf_copy+0x58>
800073fc:	00078913          	mv	s2,a5
80007400:	0044a503          	lw	a0,4(s1)
80007404:	00442583          	lw	a1,4(s0)
80007408:	00090613          	mv	a2,s2
8000740c:	01350533          	add	a0,a0,s3
80007410:	014585b3          	add	a1,a1,s4
80007414:	4b1060ef          	jal	ra,8000e0c4 <memcpy>
80007418:	00a45703          	lhu	a4,10(s0)
8000741c:	012a0a33          	add	s4,s4,s2
80007420:	012989b3          	add	s3,s3,s2
80007424:	00a4d783          	lhu	a5,10(s1)
80007428:	00ea6663          	bltu	s4,a4,80007434 <pbuf_copy+0x8c>
8000742c:	00042403          	lw	s0,0(s0)
80007430:	00000a13          	li	s4,0
80007434:	02f99e63          	bne	s3,a5,80007470 <pbuf_copy+0xc8>
80007438:	0004a483          	lw	s1,0(s1)
8000743c:	02049863          	bnez	s1,8000746c <pbuf_copy+0xc4>
80007440:	00000513          	li	a0,0
80007444:	00040463          	beqz	s0,8000744c <pbuf_copy+0xa4>
80007448:	ff000513          	li	a0,-16
8000744c:	01c12083          	lw	ra,28(sp)
80007450:	01812403          	lw	s0,24(sp)
80007454:	01412483          	lw	s1,20(sp)
80007458:	01012903          	lw	s2,16(sp)
8000745c:	00c12983          	lw	s3,12(sp)
80007460:	00812a03          	lw	s4,8(sp)
80007464:	02010113          	addi	sp,sp,32
80007468:	00008067          	ret
8000746c:	00000993          	li	s3,0
80007470:	00040c63          	beqz	s0,80007488 <pbuf_copy+0xe0>
80007474:	00a45703          	lhu	a4,10(s0)
80007478:	00845783          	lhu	a5,8(s0)
8000747c:	00f71663          	bne	a4,a5,80007488 <pbuf_copy+0xe0>
80007480:	00042783          	lw	a5,0(s0)
80007484:	02079263          	bnez	a5,800074a8 <pbuf_copy+0x100>
80007488:	00a4d703          	lhu	a4,10(s1)
8000748c:	0084d783          	lhu	a5,8(s1)
80007490:	00f71663          	bne	a4,a5,8000749c <pbuf_copy+0xf4>
80007494:	0004a783          	lw	a5,0(s1)
80007498:	00079863          	bnez	a5,800074a8 <pbuf_copy+0x100>
8000749c:	f40416e3          	bnez	s0,800073e8 <pbuf_copy+0x40>
800074a0:	00000513          	li	a0,0
800074a4:	fa9ff06f          	j	8000744c <pbuf_copy+0xa4>
800074a8:	ffa00513          	li	a0,-6
800074ac:	fa1ff06f          	j	8000744c <pbuf_copy+0xa4>
800074b0:	ff000513          	li	a0,-16
800074b4:	00008067          	ret

800074b8 <pbuf_copy_partial>:
800074b8:	fe010113          	addi	sp,sp,-32
800074bc:	00812c23          	sw	s0,24(sp)
800074c0:	00112e23          	sw	ra,28(sp)
800074c4:	00912a23          	sw	s1,20(sp)
800074c8:	01212823          	sw	s2,16(sp)
800074cc:	01312623          	sw	s3,12(sp)
800074d0:	01412423          	sw	s4,8(sp)
800074d4:	00000413          	li	s0,0
800074d8:	02050063          	beqz	a0,800074f8 <pbuf_copy_partial+0x40>
800074dc:	00058a13          	mv	s4,a1
800074e0:	00000413          	li	s0,0
800074e4:	00058a63          	beqz	a1,800074f8 <pbuf_copy_partial+0x40>
800074e8:	00050913          	mv	s2,a0
800074ec:	00060493          	mv	s1,a2
800074f0:	00048463          	beqz	s1,800074f8 <pbuf_copy_partial+0x40>
800074f4:	02091463          	bnez	s2,8000751c <pbuf_copy_partial+0x64>
800074f8:	00040513          	mv	a0,s0
800074fc:	01c12083          	lw	ra,28(sp)
80007500:	01812403          	lw	s0,24(sp)
80007504:	01412483          	lw	s1,20(sp)
80007508:	01012903          	lw	s2,16(sp)
8000750c:	00c12983          	lw	s3,12(sp)
80007510:	00812a03          	lw	s4,8(sp)
80007514:	02010113          	addi	sp,sp,32
80007518:	00008067          	ret
8000751c:	00a95583          	lhu	a1,10(s2)
80007520:	00068e63          	beqz	a3,8000753c <pbuf_copy_partial+0x84>
80007524:	00b6ec63          	bltu	a3,a1,8000753c <pbuf_copy_partial+0x84>
80007528:	40b686b3          	sub	a3,a3,a1
8000752c:	01069693          	slli	a3,a3,0x10
80007530:	0106d693          	srli	a3,a3,0x10
80007534:	00092903          	lw	s2,0(s2)
80007538:	fb9ff06f          	j	800074f0 <pbuf_copy_partial+0x38>
8000753c:	40d585b3          	sub	a1,a1,a3
80007540:	01059593          	slli	a1,a1,0x10
80007544:	0105d593          	srli	a1,a1,0x10
80007548:	00058993          	mv	s3,a1
8000754c:	00b4f463          	bgeu	s1,a1,80007554 <pbuf_copy_partial+0x9c>
80007550:	00048993          	mv	s3,s1
80007554:	00492583          	lw	a1,4(s2)
80007558:	01099993          	slli	s3,s3,0x10
8000755c:	0109d993          	srli	s3,s3,0x10
80007560:	00d585b3          	add	a1,a1,a3
80007564:	008a0533          	add	a0,s4,s0
80007568:	00098613          	mv	a2,s3
8000756c:	01340433          	add	s0,s0,s3
80007570:	413484b3          	sub	s1,s1,s3
80007574:	351060ef          	jal	ra,8000e0c4 <memcpy>
80007578:	01041413          	slli	s0,s0,0x10
8000757c:	01049493          	slli	s1,s1,0x10
80007580:	01045413          	srli	s0,s0,0x10
80007584:	0104d493          	srli	s1,s1,0x10
80007588:	00000693          	li	a3,0
8000758c:	fa9ff06f          	j	80007534 <pbuf_copy_partial+0x7c>

80007590 <pbuf_get_contiguous>:
80007590:	fe010113          	addi	sp,sp,-32
80007594:	00112e23          	sw	ra,28(sp)
80007598:	00812c23          	sw	s0,24(sp)
8000759c:	00912a23          	sw	s1,20(sp)
800075a0:	02051063          	bnez	a0,800075c0 <pbuf_get_contiguous+0x30>
800075a4:	00000413          	li	s0,0
800075a8:	00040513          	mv	a0,s0
800075ac:	01c12083          	lw	ra,28(sp)
800075b0:	01812403          	lw	s0,24(sp)
800075b4:	01412483          	lw	s1,20(sp)
800075b8:	02010113          	addi	sp,sp,32
800075bc:	00008067          	ret
800075c0:	00058413          	mv	s0,a1
800075c4:	fe0580e3          	beqz	a1,800075a4 <pbuf_get_contiguous+0x14>
800075c8:	00068493          	mv	s1,a3
800075cc:	fcd66ce3          	bltu	a2,a3,800075a4 <pbuf_get_contiguous+0x14>
800075d0:	00e10613          	addi	a2,sp,14
800075d4:	00070593          	mv	a1,a4
800075d8:	ee4ff0ef          	jal	ra,80006cbc <pbuf_skip_const>
800075dc:	fc0504e3          	beqz	a0,800075a4 <pbuf_get_contiguous+0x14>
800075e0:	00e15683          	lhu	a3,14(sp)
800075e4:	00a55603          	lhu	a2,10(a0)
800075e8:	00968733          	add	a4,a3,s1
800075ec:	00e64863          	blt	a2,a4,800075fc <pbuf_get_contiguous+0x6c>
800075f0:	00452403          	lw	s0,4(a0)
800075f4:	00d40433          	add	s0,s0,a3
800075f8:	fb1ff06f          	j	800075a8 <pbuf_get_contiguous+0x18>
800075fc:	00048613          	mv	a2,s1
80007600:	00040593          	mv	a1,s0
80007604:	eb5ff0ef          	jal	ra,800074b8 <pbuf_copy_partial>
80007608:	fa9500e3          	beq	a0,s1,800075a8 <pbuf_get_contiguous+0x18>
8000760c:	f99ff06f          	j	800075a4 <pbuf_get_contiguous+0x14>

80007610 <pbuf_skip>:
80007610:	eacff06f          	j	80006cbc <pbuf_skip_const>

80007614 <pbuf_take>:
80007614:	08050c63          	beqz	a0,800076ac <pbuf_take+0x98>
80007618:	fe010113          	addi	sp,sp,-32
8000761c:	00912a23          	sw	s1,20(sp)
80007620:	01412423          	sw	s4,8(sp)
80007624:	00112e23          	sw	ra,28(sp)
80007628:	00812c23          	sw	s0,24(sp)
8000762c:	01212823          	sw	s2,16(sp)
80007630:	01312623          	sw	s3,12(sp)
80007634:	00050493          	mv	s1,a0
80007638:	00058a13          	mv	s4,a1
8000763c:	ff000513          	li	a0,-16
80007640:	00058c63          	beqz	a1,80007658 <pbuf_take+0x44>
80007644:	0084d783          	lhu	a5,8(s1)
80007648:	00060413          	mv	s0,a2
8000764c:	fff00513          	li	a0,-1
80007650:	00000993          	li	s3,0
80007654:	04c7f663          	bgeu	a5,a2,800076a0 <pbuf_take+0x8c>
80007658:	01c12083          	lw	ra,28(sp)
8000765c:	01812403          	lw	s0,24(sp)
80007660:	01412483          	lw	s1,20(sp)
80007664:	01012903          	lw	s2,16(sp)
80007668:	00c12983          	lw	s3,12(sp)
8000766c:	00812a03          	lw	s4,8(sp)
80007670:	02010113          	addi	sp,sp,32
80007674:	00008067          	ret
80007678:	00a4d903          	lhu	s2,10(s1)
8000767c:	01247463          	bgeu	s0,s2,80007684 <pbuf_take+0x70>
80007680:	00040913          	mv	s2,s0
80007684:	0044a503          	lw	a0,4(s1)
80007688:	013a05b3          	add	a1,s4,s3
8000768c:	00090613          	mv	a2,s2
80007690:	235060ef          	jal	ra,8000e0c4 <memcpy>
80007694:	0004a483          	lw	s1,0(s1)
80007698:	41240433          	sub	s0,s0,s2
8000769c:	012989b3          	add	s3,s3,s2
800076a0:	fc041ce3          	bnez	s0,80007678 <pbuf_take+0x64>
800076a4:	00000513          	li	a0,0
800076a8:	fb1ff06f          	j	80007658 <pbuf_take+0x44>
800076ac:	ff000513          	li	a0,-16
800076b0:	00008067          	ret

800076b4 <pbuf_take_at>:
800076b4:	fd010113          	addi	sp,sp,-48
800076b8:	02812423          	sw	s0,40(sp)
800076bc:	01312e23          	sw	s3,28(sp)
800076c0:	00060413          	mv	s0,a2
800076c4:	00058993          	mv	s3,a1
800076c8:	00e10613          	addi	a2,sp,14
800076cc:	00068593          	mv	a1,a3
800076d0:	02112623          	sw	ra,44(sp)
800076d4:	02912223          	sw	s1,36(sp)
800076d8:	03212023          	sw	s2,32(sp)
800076dc:	de0ff0ef          	jal	ra,80006cbc <pbuf_skip_const>
800076e0:	08050263          	beqz	a0,80007764 <pbuf_take_at+0xb0>
800076e4:	00e15703          	lhu	a4,14(sp)
800076e8:	00855683          	lhu	a3,8(a0)
800076ec:	00050493          	mv	s1,a0
800076f0:	008707b3          	add	a5,a4,s0
800076f4:	fff00513          	li	a0,-1
800076f8:	04f6c863          	blt	a3,a5,80007748 <pbuf_take_at+0x94>
800076fc:	00a4d783          	lhu	a5,10(s1)
80007700:	00040913          	mv	s2,s0
80007704:	40e787b3          	sub	a5,a5,a4
80007708:	0087d663          	bge	a5,s0,80007714 <pbuf_take_at+0x60>
8000770c:	01079913          	slli	s2,a5,0x10
80007710:	01095913          	srli	s2,s2,0x10
80007714:	0044a503          	lw	a0,4(s1)
80007718:	00090613          	mv	a2,s2
8000771c:	00098593          	mv	a1,s3
80007720:	00e50533          	add	a0,a0,a4
80007724:	1a1060ef          	jal	ra,8000e0c4 <memcpy>
80007728:	41240633          	sub	a2,s0,s2
8000772c:	01061613          	slli	a2,a2,0x10
80007730:	01065613          	srli	a2,a2,0x10
80007734:	00000513          	li	a0,0
80007738:	00060863          	beqz	a2,80007748 <pbuf_take_at+0x94>
8000773c:	0004a503          	lw	a0,0(s1)
80007740:	012985b3          	add	a1,s3,s2
80007744:	ed1ff0ef          	jal	ra,80007614 <pbuf_take>
80007748:	02c12083          	lw	ra,44(sp)
8000774c:	02812403          	lw	s0,40(sp)
80007750:	02412483          	lw	s1,36(sp)
80007754:	02012903          	lw	s2,32(sp)
80007758:	01c12983          	lw	s3,28(sp)
8000775c:	03010113          	addi	sp,sp,48
80007760:	00008067          	ret
80007764:	fff00513          	li	a0,-1
80007768:	fe1ff06f          	j	80007748 <pbuf_take_at+0x94>

8000776c <pbuf_clone>:
8000776c:	ff010113          	addi	sp,sp,-16
80007770:	00912223          	sw	s1,4(sp)
80007774:	00060493          	mv	s1,a2
80007778:	00058613          	mv	a2,a1
8000777c:	0084d583          	lhu	a1,8(s1)
80007780:	00812423          	sw	s0,8(sp)
80007784:	00112623          	sw	ra,12(sp)
80007788:	821ff0ef          	jal	ra,80006fa8 <pbuf_alloc>
8000778c:	00050413          	mv	s0,a0
80007790:	00050663          	beqz	a0,8000779c <pbuf_clone+0x30>
80007794:	00048593          	mv	a1,s1
80007798:	c11ff0ef          	jal	ra,800073a8 <pbuf_copy>
8000779c:	00040513          	mv	a0,s0
800077a0:	00c12083          	lw	ra,12(sp)
800077a4:	00812403          	lw	s0,8(sp)
800077a8:	00412483          	lw	s1,4(sp)
800077ac:	01010113          	addi	sp,sp,16
800077b0:	00008067          	ret

800077b4 <pbuf_coalesce>:
800077b4:	ff010113          	addi	sp,sp,-16
800077b8:	00812423          	sw	s0,8(sp)
800077bc:	00112623          	sw	ra,12(sp)
800077c0:	00912223          	sw	s1,4(sp)
800077c4:	00052783          	lw	a5,0(a0)
800077c8:	00050413          	mv	s0,a0
800077cc:	02079063          	bnez	a5,800077ec <pbuf_coalesce+0x38>
800077d0:	00040493          	mv	s1,s0
800077d4:	00c12083          	lw	ra,12(sp)
800077d8:	00812403          	lw	s0,8(sp)
800077dc:	00048513          	mv	a0,s1
800077e0:	00412483          	lw	s1,4(sp)
800077e4:	01010113          	addi	sp,sp,16
800077e8:	00008067          	ret
800077ec:	00058513          	mv	a0,a1
800077f0:	00040613          	mv	a2,s0
800077f4:	28000593          	li	a1,640
800077f8:	f75ff0ef          	jal	ra,8000776c <pbuf_clone>
800077fc:	00050493          	mv	s1,a0
80007800:	fc0508e3          	beqz	a0,800077d0 <pbuf_coalesce+0x1c>
80007804:	00040513          	mv	a0,s0
80007808:	eccff0ef          	jal	ra,80006ed4 <pbuf_free>
8000780c:	fc9ff06f          	j	800077d4 <pbuf_coalesce+0x20>

80007810 <pbuf_try_get_at>:
80007810:	fe010113          	addi	sp,sp,-32
80007814:	00e10613          	addi	a2,sp,14
80007818:	00112e23          	sw	ra,28(sp)
8000781c:	ca0ff0ef          	jal	ra,80006cbc <pbuf_skip_const>
80007820:	fff00793          	li	a5,-1
80007824:	02050063          	beqz	a0,80007844 <pbuf_try_get_at+0x34>
80007828:	00e15703          	lhu	a4,14(sp)
8000782c:	00a55683          	lhu	a3,10(a0)
80007830:	fff00793          	li	a5,-1
80007834:	00d77863          	bgeu	a4,a3,80007844 <pbuf_try_get_at+0x34>
80007838:	00452783          	lw	a5,4(a0)
8000783c:	00e787b3          	add	a5,a5,a4
80007840:	0007c783          	lbu	a5,0(a5)
80007844:	01c12083          	lw	ra,28(sp)
80007848:	00078513          	mv	a0,a5
8000784c:	02010113          	addi	sp,sp,32
80007850:	00008067          	ret

80007854 <pbuf_get_at>:
80007854:	ff010113          	addi	sp,sp,-16
80007858:	00112623          	sw	ra,12(sp)
8000785c:	fb5ff0ef          	jal	ra,80007810 <pbuf_try_get_at>
80007860:	00055463          	bgez	a0,80007868 <pbuf_get_at+0x14>
80007864:	00000513          	li	a0,0
80007868:	00c12083          	lw	ra,12(sp)
8000786c:	0ff57513          	andi	a0,a0,255
80007870:	01010113          	addi	sp,sp,16
80007874:	00008067          	ret

80007878 <pbuf_put_at>:
80007878:	fe010113          	addi	sp,sp,-32
8000787c:	00812c23          	sw	s0,24(sp)
80007880:	00060413          	mv	s0,a2
80007884:	00e10613          	addi	a2,sp,14
80007888:	00112e23          	sw	ra,28(sp)
8000788c:	c30ff0ef          	jal	ra,80006cbc <pbuf_skip_const>
80007890:	00050e63          	beqz	a0,800078ac <pbuf_put_at+0x34>
80007894:	00e15703          	lhu	a4,14(sp)
80007898:	00a55783          	lhu	a5,10(a0)
8000789c:	00f77863          	bgeu	a4,a5,800078ac <pbuf_put_at+0x34>
800078a0:	00452783          	lw	a5,4(a0)
800078a4:	00e787b3          	add	a5,a5,a4
800078a8:	00878023          	sb	s0,0(a5)
800078ac:	01c12083          	lw	ra,28(sp)
800078b0:	01812403          	lw	s0,24(sp)
800078b4:	02010113          	addi	sp,sp,32
800078b8:	00008067          	ret

800078bc <pbuf_memcmp>:
800078bc:	00855703          	lhu	a4,8(a0)
800078c0:	00d587b3          	add	a5,a1,a3
800078c4:	00f75863          	bge	a4,a5,800078d4 <pbuf_memcmp+0x18>
800078c8:	00010537          	lui	a0,0x10
800078cc:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xf7ff>
800078d0:	00008067          	ret
800078d4:	fd010113          	addi	sp,sp,-48
800078d8:	02812423          	sw	s0,40(sp)
800078dc:	02912223          	sw	s1,36(sp)
800078e0:	02112623          	sw	ra,44(sp)
800078e4:	03212023          	sw	s2,32(sp)
800078e8:	01312e23          	sw	s3,28(sp)
800078ec:	00050493          	mv	s1,a0
800078f0:	00058413          	mv	s0,a1
800078f4:	00a4d783          	lhu	a5,10(s1)
800078f8:	00f46c63          	bltu	s0,a5,80007910 <pbuf_memcmp+0x54>
800078fc:	0004a483          	lw	s1,0(s1)
80007900:	40f40433          	sub	s0,s0,a5
80007904:	01041413          	slli	s0,s0,0x10
80007908:	01045413          	srli	s0,s0,0x10
8000790c:	fe0494e3          	bnez	s1,800078f4 <pbuf_memcmp+0x38>
80007910:	00000993          	li	s3,0
80007914:	01099913          	slli	s2,s3,0x10
80007918:	01095913          	srli	s2,s2,0x10
8000791c:	00d96663          	bltu	s2,a3,80007928 <pbuf_memcmp+0x6c>
80007920:	00000513          	li	a0,0
80007924:	0580006f          	j	8000797c <pbuf_memcmp+0xc0>
80007928:	008905b3          	add	a1,s2,s0
8000792c:	01059593          	slli	a1,a1,0x10
80007930:	0105d593          	srli	a1,a1,0x10
80007934:	00048513          	mv	a0,s1
80007938:	00d12623          	sw	a3,12(sp)
8000793c:	00c12423          	sw	a2,8(sp)
80007940:	f15ff0ef          	jal	ra,80007854 <pbuf_get_at>
80007944:	00812603          	lw	a2,8(sp)
80007948:	00198993          	addi	s3,s3,1
8000794c:	00c12683          	lw	a3,12(sp)
80007950:	013607b3          	add	a5,a2,s3
80007954:	fff7c783          	lbu	a5,-1(a5)
80007958:	faa78ee3          	beq	a5,a0,80007914 <pbuf_memcmp+0x58>
8000795c:	000107b7          	lui	a5,0x10
80007960:	ffe78793          	addi	a5,a5,-2 # fffe <_stack_size+0xf7fe>
80007964:	00090513          	mv	a0,s2
80007968:	0127f463          	bgeu	a5,s2,80007970 <pbuf_memcmp+0xb4>
8000796c:	ffe00513          	li	a0,-2
80007970:	00150513          	addi	a0,a0,1
80007974:	01051513          	slli	a0,a0,0x10
80007978:	01055513          	srli	a0,a0,0x10
8000797c:	02c12083          	lw	ra,44(sp)
80007980:	02812403          	lw	s0,40(sp)
80007984:	02412483          	lw	s1,36(sp)
80007988:	02012903          	lw	s2,32(sp)
8000798c:	01c12983          	lw	s3,28(sp)
80007990:	03010113          	addi	sp,sp,48
80007994:	00008067          	ret

80007998 <pbuf_memfind>:
80007998:	fe010113          	addi	sp,sp,-32
8000799c:	00112e23          	sw	ra,28(sp)
800079a0:	00812c23          	sw	s0,24(sp)
800079a4:	00912a23          	sw	s1,20(sp)
800079a8:	01212823          	sw	s2,16(sp)
800079ac:	01312623          	sw	s3,12(sp)
800079b0:	01412423          	sw	s4,8(sp)
800079b4:	00855783          	lhu	a5,8(a0)
800079b8:	00d60733          	add	a4,a2,a3
800079bc:	02e7c263          	blt	a5,a4,800079e0 <pbuf_memfind+0x48>
800079c0:	40c787b3          	sub	a5,a5,a2
800079c4:	01079493          	slli	s1,a5,0x10
800079c8:	00050993          	mv	s3,a0
800079cc:	00058a13          	mv	s4,a1
800079d0:	00060913          	mv	s2,a2
800079d4:	00068413          	mv	s0,a3
800079d8:	0104d493          	srli	s1,s1,0x10
800079dc:	0284f863          	bgeu	s1,s0,80007a0c <pbuf_memfind+0x74>
800079e0:	00010437          	lui	s0,0x10
800079e4:	fff40413          	addi	s0,s0,-1 # ffff <_stack_size+0xf7ff>
800079e8:	00040513          	mv	a0,s0
800079ec:	01c12083          	lw	ra,28(sp)
800079f0:	01812403          	lw	s0,24(sp)
800079f4:	01412483          	lw	s1,20(sp)
800079f8:	01012903          	lw	s2,16(sp)
800079fc:	00c12983          	lw	s3,12(sp)
80007a00:	00812a03          	lw	s4,8(sp)
80007a04:	02010113          	addi	sp,sp,32
80007a08:	00008067          	ret
80007a0c:	00090693          	mv	a3,s2
80007a10:	000a0613          	mv	a2,s4
80007a14:	00040593          	mv	a1,s0
80007a18:	00098513          	mv	a0,s3
80007a1c:	ea1ff0ef          	jal	ra,800078bc <pbuf_memcmp>
80007a20:	fc0504e3          	beqz	a0,800079e8 <pbuf_memfind+0x50>
80007a24:	00140413          	addi	s0,s0,1
80007a28:	01041413          	slli	s0,s0,0x10
80007a2c:	01045413          	srli	s0,s0,0x10
80007a30:	fadff06f          	j	800079dc <pbuf_memfind+0x44>

80007a34 <pbuf_strstr>:
80007a34:	fe010113          	addi	sp,sp,-32
80007a38:	00812c23          	sw	s0,24(sp)
80007a3c:	01212823          	sw	s2,16(sp)
80007a40:	00112e23          	sw	ra,28(sp)
80007a44:	00010937          	lui	s2,0x10
80007a48:	00912a23          	sw	s1,20(sp)
80007a4c:	fff90413          	addi	s0,s2,-1 # ffff <_stack_size+0xf7ff>
80007a50:	04058c63          	beqz	a1,80007aa8 <pbuf_strstr+0x74>
80007a54:	0005c783          	lbu	a5,0(a1)
80007a58:	04078863          	beqz	a5,80007aa8 <pbuf_strstr+0x74>
80007a5c:	00855783          	lhu	a5,8(a0)
80007a60:	04878663          	beq	a5,s0,80007aac <pbuf_strstr+0x78>
80007a64:	00050493          	mv	s1,a0
80007a68:	00058513          	mv	a0,a1
80007a6c:	00b12623          	sw	a1,12(sp)
80007a70:	ffe90913          	addi	s2,s2,-2
80007a74:	02c070ef          	jal	ra,8000eaa0 <strlen>
80007a78:	02a96863          	bltu	s2,a0,80007aa8 <pbuf_strstr+0x74>
80007a7c:	01812403          	lw	s0,24(sp)
80007a80:	01051613          	slli	a2,a0,0x10
80007a84:	00c12583          	lw	a1,12(sp)
80007a88:	01c12083          	lw	ra,28(sp)
80007a8c:	01012903          	lw	s2,16(sp)
80007a90:	00048513          	mv	a0,s1
80007a94:	01412483          	lw	s1,20(sp)
80007a98:	00000693          	li	a3,0
80007a9c:	01065613          	srli	a2,a2,0x10
80007aa0:	02010113          	addi	sp,sp,32
80007aa4:	ef5ff06f          	j	80007998 <pbuf_memfind>
80007aa8:	00040793          	mv	a5,s0
80007aac:	01c12083          	lw	ra,28(sp)
80007ab0:	01812403          	lw	s0,24(sp)
80007ab4:	01412483          	lw	s1,20(sp)
80007ab8:	01012903          	lw	s2,16(sp)
80007abc:	00078513          	mv	a0,a5
80007ac0:	02010113          	addi	sp,sp,32
80007ac4:	00008067          	ret

80007ac8 <raw_input>:
80007ac8:	fd010113          	addi	sp,sp,-48
80007acc:	02912223          	sw	s1,36(sp)
80007ad0:	9f418793          	addi	a5,gp,-1548 # 8000318c <ip_data>
80007ad4:	02812423          	sw	s0,40(sp)
80007ad8:	03212023          	sw	s2,32(sp)
80007adc:	01312e23          	sw	s3,28(sp)
80007ae0:	01412c23          	sw	s4,24(sp)
80007ae4:	01512a23          	sw	s5,20(sp)
80007ae8:	01612823          	sw	s6,16(sp)
80007aec:	01712623          	sw	s7,12(sp)
80007af0:	02112623          	sw	ra,44(sp)
80007af4:	00050a13          	mv	s4,a0
80007af8:	0007a583          	lw	a1,0(a5)
80007afc:	0147a503          	lw	a0,20(a5)
80007b00:	00000993          	li	s3,0
80007b04:	9f418493          	addi	s1,gp,-1548 # 8000318c <ip_data>
80007b08:	179040ef          	jal	ra,8000c480 <ip4_addr_isbroadcast_u32>
80007b0c:	004a2783          	lw	a5,4(s4)
80007b10:	00050b13          	mv	s6,a0
80007b14:	0097ca83          	lbu	s5,9(a5)
80007b18:	8d81a403          	lw	s0,-1832(gp) # 80003070 <raw_pcbs>
80007b1c:	00000513          	li	a0,0
80007b20:	00078913          	mv	s2,a5
80007b24:	08040a63          	beqz	s0,80007bb8 <raw_input+0xf0>
80007b28:	01444783          	lbu	a5,20(s0)
80007b2c:	0d579463          	bne	a5,s5,80007bf4 <raw_input+0x12c>
80007b30:	00844703          	lbu	a4,8(s0)
80007b34:	00070c63          	beqz	a4,80007b4c <raw_input+0x84>
80007b38:	0044a783          	lw	a5,4(s1)
80007b3c:	0387c783          	lbu	a5,56(a5)
80007b40:	00178793          	addi	a5,a5,1
80007b44:	0ff7f793          	andi	a5,a5,255
80007b48:	0af71663          	bne	a4,a5,80007bf4 <raw_input+0x12c>
80007b4c:	080b0c63          	beqz	s6,80007be4 <raw_input+0x11c>
80007b50:	00944783          	lbu	a5,9(s0)
80007b54:	0207f793          	andi	a5,a5,32
80007b58:	08078e63          	beqz	a5,80007bf4 <raw_input+0x12c>
80007b5c:	00042783          	lw	a5,0(s0)
80007b60:	08079a63          	bnez	a5,80007bf4 <raw_input+0x12c>
80007b64:	01544783          	lbu	a5,21(s0)
80007b68:	0017f793          	andi	a5,a5,1
80007b6c:	00078863          	beqz	a5,80007b7c <raw_input+0xb4>
80007b70:	00442703          	lw	a4,4(s0)
80007b74:	0104a783          	lw	a5,16(s1)
80007b78:	06f71e63          	bne	a4,a5,80007bf4 <raw_input+0x12c>
80007b7c:	01842783          	lw	a5,24(s0)
80007b80:	06078a63          	beqz	a5,80007bf4 <raw_input+0x12c>
80007b84:	01c42503          	lw	a0,28(s0)
80007b88:	a0418693          	addi	a3,gp,-1532 # 8000319c <ip_data+0x10>
80007b8c:	000a0613          	mv	a2,s4
80007b90:	00040593          	mv	a1,s0
80007b94:	000780e7          	jalr	a5
80007b98:	06050463          	beqz	a0,80007c00 <raw_input+0x138>
80007b9c:	00100513          	li	a0,1
80007ba0:	00098c63          	beqz	s3,80007bb8 <raw_input+0xf0>
80007ba4:	01042783          	lw	a5,16(s0)
80007ba8:	00f9a823          	sw	a5,16(s3)
80007bac:	8d81a783          	lw	a5,-1832(gp) # 80003070 <raw_pcbs>
80007bb0:	8c81ac23          	sw	s0,-1832(gp) # 80003070 <raw_pcbs>
80007bb4:	00f42823          	sw	a5,16(s0)
80007bb8:	02c12083          	lw	ra,44(sp)
80007bbc:	02812403          	lw	s0,40(sp)
80007bc0:	02412483          	lw	s1,36(sp)
80007bc4:	02012903          	lw	s2,32(sp)
80007bc8:	01c12983          	lw	s3,28(sp)
80007bcc:	01812a03          	lw	s4,24(sp)
80007bd0:	01412a83          	lw	s5,20(sp)
80007bd4:	01012b03          	lw	s6,16(sp)
80007bd8:	00c12b83          	lw	s7,12(sp)
80007bdc:	03010113          	addi	sp,sp,48
80007be0:	00008067          	ret
80007be4:	00042783          	lw	a5,0(s0)
80007be8:	f6078ee3          	beqz	a5,80007b64 <raw_input+0x9c>
80007bec:	0144a703          	lw	a4,20(s1)
80007bf0:	f6e78ae3          	beq	a5,a4,80007b64 <raw_input+0x9c>
80007bf4:	00040993          	mv	s3,s0
80007bf8:	01042403          	lw	s0,16(s0)
80007bfc:	f29ff06f          	j	80007b24 <raw_input+0x5c>
80007c00:	00200513          	li	a0,2
80007c04:	ff1ff06f          	j	80007bf4 <raw_input+0x12c>

80007c08 <raw_bind>:
80007c08:	ffa00793          	li	a5,-6
80007c0c:	00050a63          	beqz	a0,80007c20 <raw_bind+0x18>
80007c10:	00058863          	beqz	a1,80007c20 <raw_bind+0x18>
80007c14:	0005a783          	lw	a5,0(a1)
80007c18:	00f52023          	sw	a5,0(a0)
80007c1c:	00000793          	li	a5,0
80007c20:	00078513          	mv	a0,a5
80007c24:	00008067          	ret

80007c28 <raw_bind_netif>:
80007c28:	00000793          	li	a5,0
80007c2c:	00058863          	beqz	a1,80007c3c <raw_bind_netif+0x14>
80007c30:	0385c783          	lbu	a5,56(a1)
80007c34:	00178793          	addi	a5,a5,1
80007c38:	0ff7f793          	andi	a5,a5,255
80007c3c:	00f50423          	sb	a5,8(a0)
80007c40:	00008067          	ret

80007c44 <raw_connect>:
80007c44:	00050793          	mv	a5,a0
80007c48:	ffa00513          	li	a0,-6
80007c4c:	02078263          	beqz	a5,80007c70 <raw_connect+0x2c>
80007c50:	02058063          	beqz	a1,80007c70 <raw_connect+0x2c>
80007c54:	0005a703          	lw	a4,0(a1)
80007c58:	00000513          	li	a0,0
80007c5c:	00e7a223          	sw	a4,4(a5)
80007c60:	0157c703          	lbu	a4,21(a5)
80007c64:	00176713          	ori	a4,a4,1
80007c68:	00e78aa3          	sb	a4,21(a5)
80007c6c:	00008067          	ret
80007c70:	00008067          	ret

80007c74 <raw_disconnect>:
80007c74:	01554783          	lbu	a5,21(a0)
80007c78:	00052223          	sw	zero,4(a0)
80007c7c:	00050423          	sb	zero,8(a0)
80007c80:	ffe7f793          	andi	a5,a5,-2
80007c84:	00f50aa3          	sb	a5,21(a0)
80007c88:	00008067          	ret

80007c8c <raw_recv>:
80007c8c:	00b52c23          	sw	a1,24(a0)
80007c90:	00c52e23          	sw	a2,28(a0)
80007c94:	00008067          	ret

80007c98 <raw_sendto_if_src>:
80007c98:	fe010113          	addi	sp,sp,-32
80007c9c:	00112e23          	sw	ra,28(sp)
80007ca0:	00812c23          	sw	s0,24(sp)
80007ca4:	00912a23          	sw	s1,20(sp)
80007ca8:	01212823          	sw	s2,16(sp)
80007cac:	01312623          	sw	s3,12(sp)
80007cb0:	01412423          	sw	s4,8(sp)
80007cb4:	01512223          	sw	s5,4(sp)
80007cb8:	00051663          	bnez	a0,80007cc4 <raw_sendto_if_src+0x2c>
80007cbc:	ffa00493          	li	s1,-6
80007cc0:	06c0006f          	j	80007d2c <raw_sendto_if_src+0x94>
80007cc4:	fe060ce3          	beqz	a2,80007cbc <raw_sendto_if_src+0x24>
80007cc8:	fe068ae3          	beqz	a3,80007cbc <raw_sendto_if_src+0x24>
80007ccc:	fe0708e3          	beqz	a4,80007cbc <raw_sendto_if_src+0x24>
80007cd0:	01554783          	lbu	a5,21(a0)
80007cd4:	00070a13          	mv	s4,a4
80007cd8:	00068913          	mv	s2,a3
80007cdc:	0027f793          	andi	a5,a5,2
80007ce0:	00060a93          	mv	s5,a2
80007ce4:	00058413          	mv	s0,a1
80007ce8:	00050493          	mv	s1,a0
80007cec:	06078463          	beqz	a5,80007d54 <raw_sendto_if_src+0xbc>
80007cf0:	00a5d703          	lhu	a4,10(a1)
80007cf4:	01300793          	li	a5,19
80007cf8:	fce7f2e3          	bgeu	a5,a4,80007cbc <raw_sendto_if_src+0x24>
80007cfc:	00c50493          	addi	s1,a0,12
80007d00:	0296ae23          	sw	s1,60(a3)
80007d04:	00068813          	mv	a6,a3
80007d08:	00000793          	li	a5,0
80007d0c:	00000713          	li	a4,0
80007d10:	00000693          	li	a3,0
80007d14:	00000613          	li	a2,0
80007d18:	000a0593          	mv	a1,s4
80007d1c:	00040513          	mv	a0,s0
80007d20:	634040ef          	jal	ra,8000c354 <ip4_output_if>
80007d24:	00050493          	mv	s1,a0
80007d28:	02092e23          	sw	zero,60(s2)
80007d2c:	01c12083          	lw	ra,28(sp)
80007d30:	01812403          	lw	s0,24(sp)
80007d34:	00048513          	mv	a0,s1
80007d38:	01012903          	lw	s2,16(sp)
80007d3c:	01412483          	lw	s1,20(sp)
80007d40:	00c12983          	lw	s3,12(sp)
80007d44:	00812a03          	lw	s4,8(sp)
80007d48:	00412a83          	lw	s5,4(sp)
80007d4c:	02010113          	addi	sp,sp,32
80007d50:	00008067          	ret
80007d54:	0085d703          	lhu	a4,8(a1)
80007d58:	000107b7          	lui	a5,0x10
80007d5c:	feb78793          	addi	a5,a5,-21 # ffeb <_stack_size+0xf7eb>
80007d60:	00e7f663          	bgeu	a5,a4,80007d6c <raw_sendto_if_src+0xd4>
80007d64:	fff00493          	li	s1,-1
80007d68:	fc5ff06f          	j	80007d2c <raw_sendto_if_src+0x94>
80007d6c:	01400593          	li	a1,20
80007d70:	00040513          	mv	a0,s0
80007d74:	8c8ff0ef          	jal	ra,80006e3c <pbuf_add_header>
80007d78:	04050c63          	beqz	a0,80007dd0 <raw_sendto_if_src+0x138>
80007d7c:	28000613          	li	a2,640
80007d80:	00000593          	li	a1,0
80007d84:	02400513          	li	a0,36
80007d88:	a20ff0ef          	jal	ra,80006fa8 <pbuf_alloc>
80007d8c:	00050993          	mv	s3,a0
80007d90:	fc050ae3          	beqz	a0,80007d64 <raw_sendto_if_src+0xcc>
80007d94:	00845783          	lhu	a5,8(s0)
80007d98:	00078663          	beqz	a5,80007da4 <raw_sendto_if_src+0x10c>
80007d9c:	00040593          	mv	a1,s0
80007da0:	d8cff0ef          	jal	ra,8000732c <pbuf_chain>
80007da4:	0094c783          	lbu	a5,9(s1)
80007da8:	0207f793          	andi	a5,a5,32
80007dac:	02079e63          	bnez	a5,80007de8 <raw_sendto_if_src+0x150>
80007db0:	000aa503          	lw	a0,0(s5)
80007db4:	00090593          	mv	a1,s2
80007db8:	6c8040ef          	jal	ra,8000c480 <ip4_addr_isbroadcast_u32>
80007dbc:	02050663          	beqz	a0,80007de8 <raw_sendto_if_src+0x150>
80007dc0:	ef340ee3          	beq	s0,s3,80007cbc <raw_sendto_if_src+0x24>
80007dc4:	00098513          	mv	a0,s3
80007dc8:	90cff0ef          	jal	ra,80006ed4 <pbuf_free>
80007dcc:	ef1ff06f          	j	80007cbc <raw_sendto_if_src+0x24>
80007dd0:	01400593          	li	a1,20
80007dd4:	00040513          	mv	a0,s0
80007dd8:	874ff0ef          	jal	ra,80006e4c <pbuf_remove_header>
80007ddc:	f80514e3          	bnez	a0,80007d64 <raw_sendto_if_src+0xcc>
80007de0:	00040993          	mv	s3,s0
80007de4:	fc1ff06f          	j	80007da4 <raw_sendto_if_src+0x10c>
80007de8:	00c48793          	addi	a5,s1,12
80007dec:	00b4c683          	lbu	a3,11(s1)
80007df0:	02f92e23          	sw	a5,60(s2)
80007df4:	0144c783          	lbu	a5,20(s1)
80007df8:	00a4c703          	lbu	a4,10(s1)
80007dfc:	00090813          	mv	a6,s2
80007e00:	000a8613          	mv	a2,s5
80007e04:	000a0593          	mv	a1,s4
80007e08:	00098513          	mv	a0,s3
80007e0c:	548040ef          	jal	ra,8000c354 <ip4_output_if>
80007e10:	02092e23          	sw	zero,60(s2)
80007e14:	00050493          	mv	s1,a0
80007e18:	f1340ae3          	beq	s0,s3,80007d2c <raw_sendto_if_src+0x94>
80007e1c:	00098513          	mv	a0,s3
80007e20:	8b4ff0ef          	jal	ra,80006ed4 <pbuf_free>
80007e24:	f09ff06f          	j	80007d2c <raw_sendto_if_src+0x94>

80007e28 <raw_sendto>:
80007e28:	08050663          	beqz	a0,80007eb4 <raw_sendto+0x8c>
80007e2c:	08060463          	beqz	a2,80007eb4 <raw_sendto+0x8c>
80007e30:	ff010113          	addi	sp,sp,-16
80007e34:	00812423          	sw	s0,8(sp)
80007e38:	00912223          	sw	s1,4(sp)
80007e3c:	01212023          	sw	s2,0(sp)
80007e40:	00112623          	sw	ra,12(sp)
80007e44:	00050413          	mv	s0,a0
80007e48:	00854503          	lbu	a0,8(a0)
80007e4c:	00060493          	mv	s1,a2
80007e50:	00058913          	mv	s2,a1
80007e54:	04050663          	beqz	a0,80007ea0 <raw_sendto+0x78>
80007e58:	d41fe0ef          	jal	ra,80006b98 <netif_get_by_index>
80007e5c:	06050063          	beqz	a0,80007ebc <raw_sendto+0x94>
80007e60:	00042783          	lw	a5,0(s0)
80007e64:	04078463          	beqz	a5,80007eac <raw_sendto+0x84>
80007e68:	0f07f793          	andi	a5,a5,240
80007e6c:	0e000713          	li	a4,224
80007e70:	02e78e63          	beq	a5,a4,80007eac <raw_sendto+0x84>
80007e74:	00040713          	mv	a4,s0
80007e78:	00050693          	mv	a3,a0
80007e7c:	00040513          	mv	a0,s0
80007e80:	00812403          	lw	s0,8(sp)
80007e84:	00c12083          	lw	ra,12(sp)
80007e88:	00048613          	mv	a2,s1
80007e8c:	00090593          	mv	a1,s2
80007e90:	00412483          	lw	s1,4(sp)
80007e94:	00012903          	lw	s2,0(sp)
80007e98:	01010113          	addi	sp,sp,16
80007e9c:	dfdff06f          	j	80007c98 <raw_sendto_if_src>
80007ea0:	00060513          	mv	a0,a2
80007ea4:	619030ef          	jal	ra,8000bcbc <ip4_route>
80007ea8:	fb5ff06f          	j	80007e5c <raw_sendto+0x34>
80007eac:	00450713          	addi	a4,a0,4
80007eb0:	fc9ff06f          	j	80007e78 <raw_sendto+0x50>
80007eb4:	ffa00513          	li	a0,-6
80007eb8:	00008067          	ret
80007ebc:	00c12083          	lw	ra,12(sp)
80007ec0:	00812403          	lw	s0,8(sp)
80007ec4:	00412483          	lw	s1,4(sp)
80007ec8:	00012903          	lw	s2,0(sp)
80007ecc:	ffc00513          	li	a0,-4
80007ed0:	01010113          	addi	sp,sp,16
80007ed4:	00008067          	ret

80007ed8 <raw_send>:
80007ed8:	00450613          	addi	a2,a0,4
80007edc:	f4dff06f          	j	80007e28 <raw_sendto>

80007ee0 <raw_remove>:
80007ee0:	8d81a783          	lw	a5,-1832(gp) # 80003070 <raw_pcbs>
80007ee4:	00050593          	mv	a1,a0
80007ee8:	00a79c63          	bne	a5,a0,80007f00 <raw_remove+0x20>
80007eec:	01052783          	lw	a5,16(a0)
80007ef0:	8cf1ac23          	sw	a5,-1832(gp) # 80003070 <raw_pcbs>
80007ef4:	00000513          	li	a0,0
80007ef8:	f28fe06f          	j	80006620 <memp_free>
80007efc:	00070793          	mv	a5,a4
80007f00:	fe078ae3          	beqz	a5,80007ef4 <raw_remove+0x14>
80007f04:	0107a703          	lw	a4,16(a5)
80007f08:	fe0706e3          	beqz	a4,80007ef4 <raw_remove+0x14>
80007f0c:	feb718e3          	bne	a4,a1,80007efc <raw_remove+0x1c>
80007f10:	0105a703          	lw	a4,16(a1)
80007f14:	00e7a823          	sw	a4,16(a5)
80007f18:	fddff06f          	j	80007ef4 <raw_remove+0x14>

80007f1c <raw_new>:
80007f1c:	ff010113          	addi	sp,sp,-16
80007f20:	800035b7          	lui	a1,0x80003
80007f24:	00912223          	sw	s1,4(sp)
80007f28:	25a00613          	li	a2,602
80007f2c:	00050493          	mv	s1,a0
80007f30:	bf058593          	addi	a1,a1,-1040 # 80002bf0 <_ram_heap_end+0xffff0bf0>
80007f34:	00000513          	li	a0,0
80007f38:	00812423          	sw	s0,8(sp)
80007f3c:	00112623          	sw	ra,12(sp)
80007f40:	ea8fe0ef          	jal	ra,800065e8 <memp_malloc_fn>
80007f44:	00050413          	mv	s0,a0
80007f48:	02050463          	beqz	a0,80007f70 <raw_new+0x54>
80007f4c:	02000613          	li	a2,32
80007f50:	00000593          	li	a1,0
80007f54:	3e5040ef          	jal	ra,8000cb38 <memset>
80007f58:	fff00793          	li	a5,-1
80007f5c:	00f405a3          	sb	a5,11(s0)
80007f60:	8d81a703          	lw	a4,-1832(gp) # 80003070 <raw_pcbs>
80007f64:	00940a23          	sb	s1,20(s0)
80007f68:	8c81ac23          	sw	s0,-1832(gp) # 80003070 <raw_pcbs>
80007f6c:	00e42823          	sw	a4,16(s0)
80007f70:	00040513          	mv	a0,s0
80007f74:	00c12083          	lw	ra,12(sp)
80007f78:	00812403          	lw	s0,8(sp)
80007f7c:	00412483          	lw	s1,4(sp)
80007f80:	01010113          	addi	sp,sp,16
80007f84:	00008067          	ret

80007f88 <raw_new_ip_type>:
80007f88:	00058513          	mv	a0,a1
80007f8c:	f91ff06f          	j	80007f1c <raw_new>

80007f90 <raw_netif_ip_addr_changed>:
80007f90:	02050063          	beqz	a0,80007fb0 <raw_netif_ip_addr_changed+0x20>
80007f94:	00052783          	lw	a5,0(a0)
80007f98:	00078c63          	beqz	a5,80007fb0 <raw_netif_ip_addr_changed+0x20>
80007f9c:	00058a63          	beqz	a1,80007fb0 <raw_netif_ip_addr_changed+0x20>
80007fa0:	0005a783          	lw	a5,0(a1)
80007fa4:	00078663          	beqz	a5,80007fb0 <raw_netif_ip_addr_changed+0x20>
80007fa8:	8d81a783          	lw	a5,-1832(gp) # 80003070 <raw_pcbs>
80007fac:	00079463          	bnez	a5,80007fb4 <raw_netif_ip_addr_changed+0x24>
80007fb0:	00008067          	ret
80007fb4:	0007a683          	lw	a3,0(a5)
80007fb8:	00052703          	lw	a4,0(a0)
80007fbc:	00e69663          	bne	a3,a4,80007fc8 <raw_netif_ip_addr_changed+0x38>
80007fc0:	0005a703          	lw	a4,0(a1)
80007fc4:	00e7a023          	sw	a4,0(a5)
80007fc8:	0107a783          	lw	a5,16(a5)
80007fcc:	fe1ff06f          	j	80007fac <raw_netif_ip_addr_changed+0x1c>

80007fd0 <stats_init>:
80007fd0:	00008067          	ret

80007fd4 <sys_timeout_abs>:
80007fd4:	ff010113          	addi	sp,sp,-16
80007fd8:	01212023          	sw	s2,0(sp)
80007fdc:	00058913          	mv	s2,a1
80007fe0:	800035b7          	lui	a1,0x80003
80007fe4:	00812423          	sw	s0,8(sp)
80007fe8:	00912223          	sw	s1,4(sp)
80007fec:	00050413          	mv	s0,a0
80007ff0:	00060493          	mv	s1,a2
80007ff4:	c1c58593          	addi	a1,a1,-996 # 80002c1c <_ram_heap_end+0xffff0c1c>
80007ff8:	0bc00613          	li	a2,188
80007ffc:	00300513          	li	a0,3
80008000:	00112623          	sw	ra,12(sp)
80008004:	de4fe0ef          	jal	ra,800065e8 <memp_malloc_fn>
80008008:	02050063          	beqz	a0,80008028 <sys_timeout_abs+0x54>
8000800c:	8e01a783          	lw	a5,-1824(gp) # 80003078 <next_timeout>
80008010:	00052023          	sw	zero,0(a0)
80008014:	01252423          	sw	s2,8(a0)
80008018:	00952623          	sw	s1,12(a0)
8000801c:	00852223          	sw	s0,4(a0)
80008020:	02079063          	bnez	a5,80008040 <sys_timeout_abs+0x6c>
80008024:	8ea1a023          	sw	a0,-1824(gp) # 80003078 <next_timeout>
80008028:	00c12083          	lw	ra,12(sp)
8000802c:	00812403          	lw	s0,8(sp)
80008030:	00412483          	lw	s1,4(sp)
80008034:	00012903          	lw	s2,0(sp)
80008038:	01010113          	addi	sp,sp,16
8000803c:	00008067          	ret
80008040:	0047a683          	lw	a3,4(a5)
80008044:	40d406b3          	sub	a3,s0,a3
80008048:	0006d863          	bgez	a3,80008058 <sys_timeout_abs+0x84>
8000804c:	00f52023          	sw	a5,0(a0)
80008050:	fd5ff06f          	j	80008024 <sys_timeout_abs+0x50>
80008054:	00070793          	mv	a5,a4
80008058:	0007a703          	lw	a4,0(a5)
8000805c:	00070863          	beqz	a4,8000806c <sys_timeout_abs+0x98>
80008060:	00472683          	lw	a3,4(a4) # 10004 <_stack_size+0xf804>
80008064:	40d406b3          	sub	a3,s0,a3
80008068:	fe06d6e3          	bgez	a3,80008054 <sys_timeout_abs+0x80>
8000806c:	00e52023          	sw	a4,0(a0)
80008070:	00a7a023          	sw	a0,0(a5)
80008074:	fb5ff06f          	j	80008028 <sys_timeout_abs+0x54>

80008078 <lwip_cyclic_timer>:
80008078:	fe010113          	addi	sp,sp,-32
8000807c:	00112e23          	sw	ra,28(sp)
80008080:	00452783          	lw	a5,4(a0)
80008084:	00a12623          	sw	a0,12(sp)
80008088:	000780e7          	jalr	a5
8000808c:	d75fc0ef          	jal	ra,80004e00 <sys_now>
80008090:	00c12603          	lw	a2,12(sp)
80008094:	8dc1a783          	lw	a5,-1828(gp) # 80003074 <current_timeout_due_time>
80008098:	00062703          	lw	a4,0(a2)
8000809c:	800085b7          	lui	a1,0x80008
800080a0:	07858593          	addi	a1,a1,120 # 80008078 <_ram_heap_end+0xffff6078>
800080a4:	00f707b3          	add	a5,a4,a5
800080a8:	40a786b3          	sub	a3,a5,a0
800080ac:	00a70533          	add	a0,a4,a0
800080b0:	0006c463          	bltz	a3,800080b8 <lwip_cyclic_timer+0x40>
800080b4:	00078513          	mv	a0,a5
800080b8:	01c12083          	lw	ra,28(sp)
800080bc:	02010113          	addi	sp,sp,32
800080c0:	f15ff06f          	j	80007fd4 <sys_timeout_abs>

800080c4 <sys_timeout>:
800080c4:	fe010113          	addi	sp,sp,-32
800080c8:	00812c23          	sw	s0,24(sp)
800080cc:	00112e23          	sw	ra,28(sp)
800080d0:	00050413          	mv	s0,a0
800080d4:	00b12623          	sw	a1,12(sp)
800080d8:	00c12423          	sw	a2,8(sp)
800080dc:	d25fc0ef          	jal	ra,80004e00 <sys_now>
800080e0:	00850533          	add	a0,a0,s0
800080e4:	01812403          	lw	s0,24(sp)
800080e8:	00812603          	lw	a2,8(sp)
800080ec:	00c12583          	lw	a1,12(sp)
800080f0:	01c12083          	lw	ra,28(sp)
800080f4:	02010113          	addi	sp,sp,32
800080f8:	eddff06f          	j	80007fd4 <sys_timeout_abs>

800080fc <sys_timeouts_init>:
800080fc:	ff010113          	addi	sp,sp,-16
80008100:	00812423          	sw	s0,8(sp)
80008104:	80003637          	lui	a2,0x80003
80008108:	80008437          	lui	s0,0x80008
8000810c:	00912223          	sw	s1,4(sp)
80008110:	07840593          	addi	a1,s0,120 # 80008078 <_ram_heap_end+0xffff6078>
80008114:	c0460493          	addi	s1,a2,-1020 # 80002c04 <_ram_heap_end+0xffff0c04>
80008118:	3e800513          	li	a0,1000
8000811c:	c0460613          	addi	a2,a2,-1020
80008120:	00112623          	sw	ra,12(sp)
80008124:	fa1ff0ef          	jal	ra,800080c4 <sys_timeout>
80008128:	0000f537          	lui	a0,0xf
8000812c:	00848613          	addi	a2,s1,8
80008130:	07840593          	addi	a1,s0,120
80008134:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
80008138:	f8dff0ef          	jal	ra,800080c4 <sys_timeout>
8000813c:	07840593          	addi	a1,s0,120
80008140:	00812403          	lw	s0,8(sp)
80008144:	00c12083          	lw	ra,12(sp)
80008148:	01048613          	addi	a2,s1,16
8000814c:	00412483          	lw	s1,4(sp)
80008150:	1f400513          	li	a0,500
80008154:	01010113          	addi	sp,sp,16
80008158:	f6dff06f          	j	800080c4 <sys_timeout>

8000815c <sys_untimeout>:
8000815c:	8e01a783          	lw	a5,-1824(gp) # 80003078 <next_timeout>
80008160:	00070693          	mv	a3,a4
80008164:	00000613          	li	a2,0
80008168:	00079e63          	bnez	a5,80008184 <sys_untimeout+0x28>
8000816c:	00008067          	ret
80008170:	00e62023          	sw	a4,0(a2)
80008174:	02c0006f          	j	800081a0 <sys_untimeout+0x44>
80008178:	00078613          	mv	a2,a5
8000817c:	fe0708e3          	beqz	a4,8000816c <sys_untimeout+0x10>
80008180:	00070793          	mv	a5,a4
80008184:	0087a803          	lw	a6,8(a5)
80008188:	0007a703          	lw	a4,0(a5)
8000818c:	fea816e3          	bne	a6,a0,80008178 <sys_untimeout+0x1c>
80008190:	00c7a803          	lw	a6,12(a5)
80008194:	feb812e3          	bne	a6,a1,80008178 <sys_untimeout+0x1c>
80008198:	fc061ce3          	bnez	a2,80008170 <sys_untimeout+0x14>
8000819c:	8ee1a023          	sw	a4,-1824(gp) # 80003078 <next_timeout>
800081a0:	00078593          	mv	a1,a5
800081a4:	00300513          	li	a0,3
800081a8:	c78fe06f          	j	80006620 <memp_free>

800081ac <sys_check_timeouts>:
800081ac:	fe010113          	addi	sp,sp,-32
800081b0:	00912a23          	sw	s1,20(sp)
800081b4:	01312623          	sw	s3,12(sp)
800081b8:	01412423          	sw	s4,8(sp)
800081bc:	00112e23          	sw	ra,28(sp)
800081c0:	00812c23          	sw	s0,24(sp)
800081c4:	01212823          	sw	s2,16(sp)
800081c8:	c39fc0ef          	jal	ra,80004e00 <sys_now>
800081cc:	00050993          	mv	s3,a0
800081d0:	8e01a583          	lw	a1,-1824(gp) # 80003078 <next_timeout>
800081d4:	02058e63          	beqz	a1,80008210 <sys_check_timeouts+0x64>
800081d8:	0045a783          	lw	a5,4(a1)
800081dc:	40f98733          	sub	a4,s3,a5
800081e0:	02074863          	bltz	a4,80008210 <sys_check_timeouts+0x64>
800081e4:	0005a703          	lw	a4,0(a1)
800081e8:	0085a403          	lw	s0,8(a1)
800081ec:	00300513          	li	a0,3
800081f0:	8ee1a023          	sw	a4,-1824(gp) # 80003078 <next_timeout>
800081f4:	00c5a903          	lw	s2,12(a1)
800081f8:	8cf1ae23          	sw	a5,-1828(gp) # 80003074 <current_timeout_due_time>
800081fc:	c24fe0ef          	jal	ra,80006620 <memp_free>
80008200:	fc0408e3          	beqz	s0,800081d0 <sys_check_timeouts+0x24>
80008204:	00090513          	mv	a0,s2
80008208:	000400e7          	jalr	s0
8000820c:	fc5ff06f          	j	800081d0 <sys_check_timeouts+0x24>
80008210:	01c12083          	lw	ra,28(sp)
80008214:	01812403          	lw	s0,24(sp)
80008218:	01412483          	lw	s1,20(sp)
8000821c:	01012903          	lw	s2,16(sp)
80008220:	00c12983          	lw	s3,12(sp)
80008224:	00812a03          	lw	s4,8(sp)
80008228:	02010113          	addi	sp,sp,32
8000822c:	00008067          	ret

80008230 <sys_restart_timeouts>:
80008230:	ff010113          	addi	sp,sp,-16
80008234:	00812423          	sw	s0,8(sp)
80008238:	8e01a783          	lw	a5,-1824(gp) # 80003078 <next_timeout>
8000823c:	00112623          	sw	ra,12(sp)
80008240:	02078463          	beqz	a5,80008268 <sys_restart_timeouts+0x38>
80008244:	bbdfc0ef          	jal	ra,80004e00 <sys_now>
80008248:	8e01a783          	lw	a5,-1824(gp) # 80003078 <next_timeout>
8000824c:	0047a703          	lw	a4,4(a5)
80008250:	40e50533          	sub	a0,a0,a4
80008254:	0047a703          	lw	a4,4(a5)
80008258:	00a70733          	add	a4,a4,a0
8000825c:	00e7a223          	sw	a4,4(a5)
80008260:	0007a783          	lw	a5,0(a5)
80008264:	fe0798e3          	bnez	a5,80008254 <sys_restart_timeouts+0x24>
80008268:	00c12083          	lw	ra,12(sp)
8000826c:	00812403          	lw	s0,8(sp)
80008270:	01010113          	addi	sp,sp,16
80008274:	00008067          	ret

80008278 <sys_timeouts_sleeptime>:
80008278:	ff010113          	addi	sp,sp,-16
8000827c:	00812423          	sw	s0,8(sp)
80008280:	8e01a783          	lw	a5,-1824(gp) # 80003078 <next_timeout>
80008284:	00112623          	sw	ra,12(sp)
80008288:	fff00513          	li	a0,-1
8000828c:	00078e63          	beqz	a5,800082a8 <sys_timeouts_sleeptime+0x30>
80008290:	b71fc0ef          	jal	ra,80004e00 <sys_now>
80008294:	8e01a783          	lw	a5,-1824(gp) # 80003078 <next_timeout>
80008298:	0047a783          	lw	a5,4(a5)
8000829c:	40a78533          	sub	a0,a5,a0
800082a0:	00055463          	bgez	a0,800082a8 <sys_timeouts_sleeptime+0x30>
800082a4:	00000513          	li	a0,0
800082a8:	00c12083          	lw	ra,12(sp)
800082ac:	00812403          	lw	s0,8(sp)
800082b0:	01010113          	addi	sp,sp,16
800082b4:	00008067          	ret

800082b8 <udp_init>:
800082b8:	00008067          	ret

800082bc <udp_input>:
800082bc:	fd010113          	addi	sp,sp,-48
800082c0:	02812423          	sw	s0,40(sp)
800082c4:	02112623          	sw	ra,44(sp)
800082c8:	02912223          	sw	s1,36(sp)
800082cc:	03212023          	sw	s2,32(sp)
800082d0:	01312e23          	sw	s3,28(sp)
800082d4:	01412c23          	sw	s4,24(sp)
800082d8:	01512a23          	sw	s5,20(sp)
800082dc:	01612823          	sw	s6,16(sp)
800082e0:	01712623          	sw	s7,12(sp)
800082e4:	a0c18793          	addi	a5,gp,-1524 # 800031a4 <lwip_stats>
800082e8:	0f47a703          	lw	a4,244(a5)
800082ec:	00170713          	addi	a4,a4,1
800082f0:	0ee7aa23          	sw	a4,244(a5)
800082f4:	00a55683          	lhu	a3,10(a0)
800082f8:	00700713          	li	a4,7
800082fc:	04d76463          	bltu	a4,a3,80008344 <udp_input+0x88>
80008300:	1047a703          	lw	a4,260(a5)
80008304:	00170713          	addi	a4,a4,1
80008308:	10e7a223          	sw	a4,260(a5)
8000830c:	0fc7a703          	lw	a4,252(a5)
80008310:	00170713          	addi	a4,a4,1
80008314:	0ee7ae23          	sw	a4,252(a5)
80008318:	02812403          	lw	s0,40(sp)
8000831c:	02c12083          	lw	ra,44(sp)
80008320:	02412483          	lw	s1,36(sp)
80008324:	02012903          	lw	s2,32(sp)
80008328:	01c12983          	lw	s3,28(sp)
8000832c:	01812a03          	lw	s4,24(sp)
80008330:	01412a83          	lw	s5,20(sp)
80008334:	01012b03          	lw	s6,16(sp)
80008338:	00c12b83          	lw	s7,12(sp)
8000833c:	03010113          	addi	sp,sp,48
80008340:	b95fe06f          	j	80006ed4 <pbuf_free>
80008344:	9f418913          	addi	s2,gp,-1548 # 8000318c <ip_data>
80008348:	00452983          	lw	s3,4(a0)
8000834c:	00050493          	mv	s1,a0
80008350:	00058b93          	mv	s7,a1
80008354:	01492503          	lw	a0,20(s2)
80008358:	00092583          	lw	a1,0(s2)
8000835c:	a0c18413          	addi	s0,gp,-1524 # 800031a4 <lwip_stats>
80008360:	9f418a13          	addi	s4,gp,-1548 # 8000318c <ip_data>
80008364:	11c040ef          	jal	ra,8000c480 <ip4_addr_isbroadcast_u32>
80008368:	0019c783          	lbu	a5,1(s3)
8000836c:	00050a93          	mv	s5,a0
80008370:	0009c503          	lbu	a0,0(s3)
80008374:	00879793          	slli	a5,a5,0x8
80008378:	00a7e533          	or	a0,a5,a0
8000837c:	935fd0ef          	jal	ra,80005cb0 <lwip_htons>
80008380:	0039c783          	lbu	a5,3(s3)
80008384:	00050b13          	mv	s6,a0
80008388:	0029c503          	lbu	a0,2(s3)
8000838c:	00879793          	slli	a5,a5,0x8
80008390:	00a7e533          	or	a0,a5,a0
80008394:	91dfd0ef          	jal	ra,80005cb0 <lwip_htons>
80008398:	8e41a803          	lw	a6,-1820(gp) # 8000307c <udp_pcbs>
8000839c:	00492303          	lw	t1,4(s2)
800083a0:	01492683          	lw	a3,20(s2)
800083a4:	01092e03          	lw	t3,16(s2)
800083a8:	00080793          	mv	a5,a6
800083ac:	00000913          	li	s2,0
800083b0:	00000593          	li	a1,0
800083b4:	fff00893          	li	a7,-1
800083b8:	00079c63          	bnez	a5,800083d0 <udp_input+0x114>
800083bc:	0a091e63          	bnez	s2,80008478 <udp_input+0x1bc>
800083c0:	004ba783          	lw	a5,4(s7)
800083c4:	0ad78a63          	beq	a5,a3,80008478 <udp_input+0x1bc>
800083c8:	00048513          	mv	a0,s1
800083cc:	f4dff06f          	j	80008318 <udp_input+0x5c>
800083d0:	0167d703          	lhu	a4,22(a5)
800083d4:	0ea71e63          	bne	a4,a0,800084d0 <udp_input+0x214>
800083d8:	0087ce83          	lbu	t4,8(a5)
800083dc:	000e8a63          	beqz	t4,800083f0 <udp_input+0x134>
800083e0:	03834703          	lbu	a4,56(t1)
800083e4:	00170713          	addi	a4,a4,1
800083e8:	0ff77713          	andi	a4,a4,255
800083ec:	0eee9263          	bne	t4,a4,800084d0 <udp_input+0x214>
800083f0:	0c0a8a63          	beqz	s5,800084c4 <udp_input+0x208>
800083f4:	0097c703          	lbu	a4,9(a5)
800083f8:	02077713          	andi	a4,a4,32
800083fc:	0c070a63          	beqz	a4,800084d0 <udp_input+0x214>
80008400:	0007a703          	lw	a4,0(a5)
80008404:	00070c63          	beqz	a4,8000841c <udp_input+0x160>
80008408:	01168a63          	beq	a3,a7,8000841c <udp_input+0x160>
8000840c:	008bae83          	lw	t4,8(s7)
80008410:	00d74733          	xor	a4,a4,a3
80008414:	01d77733          	and	a4,a4,t4
80008418:	0a071c63          	bnez	a4,800084d0 <udp_input+0x214>
8000841c:	0147c703          	lbu	a4,20(a5)
80008420:	00477713          	andi	a4,a4,4
80008424:	02071463          	bnez	a4,8000844c <udp_input+0x190>
80008428:	02090063          	beqz	s2,80008448 <udp_input+0x18c>
8000842c:	020a8063          	beqz	s5,8000844c <udp_input+0x190>
80008430:	01169e63          	bne	a3,a7,8000844c <udp_input+0x190>
80008434:	004ba703          	lw	a4,4(s7)
80008438:	00092e83          	lw	t4,0(s2)
8000843c:	00ee8863          	beq	t4,a4,8000844c <udp_input+0x190>
80008440:	0007ae83          	lw	t4,0(a5)
80008444:	01d71463          	bne	a4,t4,8000844c <udp_input+0x190>
80008448:	00078913          	mv	s2,a5
8000844c:	0187d703          	lhu	a4,24(a5)
80008450:	09671063          	bne	a4,s6,800084d0 <udp_input+0x214>
80008454:	0047a703          	lw	a4,4(a5)
80008458:	00070463          	beqz	a4,80008460 <udp_input+0x1a4>
8000845c:	07c71a63          	bne	a4,t3,800084d0 <udp_input+0x214>
80008460:	06058e63          	beqz	a1,800084dc <udp_input+0x220>
80008464:	0107a703          	lw	a4,16(a5)
80008468:	8ef1a223          	sw	a5,-1820(gp) # 8000307c <udp_pcbs>
8000846c:	00e5a823          	sw	a4,16(a1)
80008470:	0107a823          	sw	a6,16(a5)
80008474:	00078913          	mv	s2,a5
80008478:	0079c783          	lbu	a5,7(s3)
8000847c:	0069c703          	lbu	a4,6(s3)
80008480:	00879793          	slli	a5,a5,0x8
80008484:	00e7e7b3          	or	a5,a5,a4
80008488:	06078263          	beqz	a5,800084ec <udp_input+0x230>
8000848c:	0084d603          	lhu	a2,8(s1)
80008490:	a0818713          	addi	a4,gp,-1528 # 800031a0 <ip_data+0x14>
80008494:	a0418693          	addi	a3,gp,-1532 # 8000319c <ip_data+0x10>
80008498:	01100593          	li	a1,17
8000849c:	00048513          	mv	a0,s1
800084a0:	c71fd0ef          	jal	ra,80006110 <ip_chksum_pseudo>
800084a4:	04050463          	beqz	a0,800084ec <udp_input+0x230>
800084a8:	10042783          	lw	a5,256(s0)
800084ac:	00178793          	addi	a5,a5,1
800084b0:	10f42023          	sw	a5,256(s0)
800084b4:	0fc42783          	lw	a5,252(s0)
800084b8:	00178793          	addi	a5,a5,1
800084bc:	0ef42e23          	sw	a5,252(s0)
800084c0:	f09ff06f          	j	800083c8 <udp_input+0x10c>
800084c4:	0007a703          	lw	a4,0(a5)
800084c8:	f4070ae3          	beqz	a4,8000841c <udp_input+0x160>
800084cc:	f4d708e3          	beq	a4,a3,8000841c <udp_input+0x160>
800084d0:	00078593          	mv	a1,a5
800084d4:	0107a783          	lw	a5,16(a5)
800084d8:	ee1ff06f          	j	800083b8 <udp_input+0xfc>
800084dc:	11c42703          	lw	a4,284(s0)
800084e0:	00170713          	addi	a4,a4,1
800084e4:	10e42e23          	sw	a4,284(s0)
800084e8:	f8dff06f          	j	80008474 <udp_input+0x1b8>
800084ec:	00800593          	li	a1,8
800084f0:	00048513          	mv	a0,s1
800084f4:	959fe0ef          	jal	ra,80006e4c <pbuf_remove_header>
800084f8:	fa051ee3          	bnez	a0,800084b4 <udp_input+0x1f8>
800084fc:	04090663          	beqz	s2,80008548 <udp_input+0x28c>
80008500:	01c92303          	lw	t1,28(s2)
80008504:	ec0302e3          	beqz	t1,800083c8 <udp_input+0x10c>
80008508:	02812403          	lw	s0,40(sp)
8000850c:	02092503          	lw	a0,32(s2)
80008510:	02c12083          	lw	ra,44(sp)
80008514:	01c12983          	lw	s3,28(sp)
80008518:	01812a03          	lw	s4,24(sp)
8000851c:	01412a83          	lw	s5,20(sp)
80008520:	00c12b83          	lw	s7,12(sp)
80008524:	000b0713          	mv	a4,s6
80008528:	00048613          	mv	a2,s1
8000852c:	01012b03          	lw	s6,16(sp)
80008530:	02412483          	lw	s1,36(sp)
80008534:	00090593          	mv	a1,s2
80008538:	02012903          	lw	s2,32(sp)
8000853c:	a0418693          	addi	a3,gp,-1532 # 8000319c <ip_data+0x10>
80008540:	03010113          	addi	sp,sp,48
80008544:	00030067          	jr	t1
80008548:	020a9c63          	bnez	s5,80008580 <udp_input+0x2c4>
8000854c:	014a2783          	lw	a5,20(s4)
80008550:	0e000713          	li	a4,224
80008554:	0f07f793          	andi	a5,a5,240
80008558:	02e78463          	beq	a5,a4,80008580 <udp_input+0x2c4>
8000855c:	00ca5583          	lhu	a1,12(s4)
80008560:	00048513          	mv	a0,s1
80008564:	00858593          	addi	a1,a1,8
80008568:	01059593          	slli	a1,a1,0x10
8000856c:	4105d593          	srai	a1,a1,0x10
80008570:	951fe0ef          	jal	ra,80006ec0 <pbuf_header_force>
80008574:	00300593          	li	a1,3
80008578:	00048513          	mv	a0,s1
8000857c:	264030ef          	jal	ra,8000b7e0 <icmp_dest_unreach>
80008580:	11042783          	lw	a5,272(s0)
80008584:	00178793          	addi	a5,a5,1
80008588:	10f42823          	sw	a5,272(s0)
8000858c:	f29ff06f          	j	800084b4 <udp_input+0x1f8>

80008590 <udp_bind>:
80008590:	00059463          	bnez	a1,80008598 <udp_bind+0x8>
80008594:	84818593          	addi	a1,gp,-1976 # 80002fe0 <ip_addr_any>
80008598:	ff000793          	li	a5,-16
8000859c:	0a050463          	beqz	a0,80008644 <udp_bind+0xb4>
800085a0:	8e41a783          	lw	a5,-1820(gp) # 8000307c <udp_pcbs>
800085a4:	00078693          	mv	a3,a5
800085a8:	06069063          	bnez	a3,80008608 <udp_bind+0x78>
800085ac:	00000e13          	li	t3,0
800085b0:	0c061463          	bnez	a2,80008678 <udp_bind+0xe8>
800085b4:	800036b7          	lui	a3,0x80003
800085b8:	f9c6d603          	lhu	a2,-100(a3) # 80002f9c <_ram_heap_end+0xffff0f9c>
800085bc:	00010337          	lui	t1,0x10
800085c0:	00004837          	lui	a6,0x4
800085c4:	fff30313          	addi	t1,t1,-1 # ffff <_stack_size+0xf7ff>
800085c8:	04660a63          	beq	a2,t1,8000861c <udp_bind+0x8c>
800085cc:	00160613          	addi	a2,a2,1
800085d0:	01061613          	slli	a2,a2,0x10
800085d4:	01065613          	srli	a2,a2,0x10
800085d8:	00078893          	mv	a7,a5
800085dc:	04089463          	bnez	a7,80008624 <udp_bind+0x94>
800085e0:	f8c69e23          	sh	a2,-100(a3)
800085e4:	0005a783          	lw	a5,0(a1)
800085e8:	00c51b23          	sh	a2,22(a0)
800085ec:	00f52023          	sw	a5,0(a0)
800085f0:	000e1863          	bnez	t3,80008600 <udp_bind+0x70>
800085f4:	8e41a783          	lw	a5,-1820(gp) # 8000307c <udp_pcbs>
800085f8:	8ea1a223          	sw	a0,-1820(gp) # 8000307c <udp_pcbs>
800085fc:	00f52823          	sw	a5,16(a0)
80008600:	00000793          	li	a5,0
80008604:	0400006f          	j	80008644 <udp_bind+0xb4>
80008608:	00a68663          	beq	a3,a0,80008614 <udp_bind+0x84>
8000860c:	0106a683          	lw	a3,16(a3)
80008610:	f99ff06f          	j	800085a8 <udp_bind+0x18>
80008614:	00100e13          	li	t3,1
80008618:	f99ff06f          	j	800085b0 <udp_bind+0x20>
8000861c:	0000c637          	lui	a2,0xc
80008620:	fb9ff06f          	j	800085d8 <udp_bind+0x48>
80008624:	0168de83          	lhu	t4,22(a7)
80008628:	02ce9263          	bne	t4,a2,8000864c <udp_bind+0xbc>
8000862c:	fff80813          	addi	a6,a6,-1 # 3fff <_stack_size+0x37ff>
80008630:	01081813          	slli	a6,a6,0x10
80008634:	01085813          	srli	a6,a6,0x10
80008638:	f80818e3          	bnez	a6,800085c8 <udp_bind+0x38>
8000863c:	f8c69e23          	sh	a2,-100(a3)
80008640:	ff800793          	li	a5,-8
80008644:	00078513          	mv	a0,a5
80008648:	00008067          	ret
8000864c:	0108a883          	lw	a7,16(a7)
80008650:	f8dff06f          	j	800085dc <udp_bind+0x4c>
80008654:	02a78063          	beq	a5,a0,80008674 <udp_bind+0xe4>
80008658:	0167d683          	lhu	a3,22(a5)
8000865c:	00c69c63          	bne	a3,a2,80008674 <udp_bind+0xe4>
80008660:	0005a803          	lw	a6,0(a1)
80008664:	0007a683          	lw	a3,0(a5)
80008668:	fd068ce3          	beq	a3,a6,80008640 <udp_bind+0xb0>
8000866c:	fc080ae3          	beqz	a6,80008640 <udp_bind+0xb0>
80008670:	fc0688e3          	beqz	a3,80008640 <udp_bind+0xb0>
80008674:	0107a783          	lw	a5,16(a5)
80008678:	fc079ee3          	bnez	a5,80008654 <udp_bind+0xc4>
8000867c:	f69ff06f          	j	800085e4 <udp_bind+0x54>

80008680 <udp_sendto_if_src>:
80008680:	fd010113          	addi	sp,sp,-48
80008684:	02912223          	sw	s1,36(sp)
80008688:	02112623          	sw	ra,44(sp)
8000868c:	02812423          	sw	s0,40(sp)
80008690:	03212023          	sw	s2,32(sp)
80008694:	01312e23          	sw	s3,28(sp)
80008698:	01412c23          	sw	s4,24(sp)
8000869c:	01512a23          	sw	s5,20(sp)
800086a0:	01612823          	sw	s6,16(sp)
800086a4:	01712623          	sw	s7,12(sp)
800086a8:	ff000493          	li	s1,-16
800086ac:	08050263          	beqz	a0,80008730 <udp_sendto_if_src+0xb0>
800086b0:	08058063          	beqz	a1,80008730 <udp_sendto_if_src+0xb0>
800086b4:	06060e63          	beqz	a2,80008730 <udp_sendto_if_src+0xb0>
800086b8:	06078c63          	beqz	a5,80008730 <udp_sendto_if_src+0xb0>
800086bc:	06070a63          	beqz	a4,80008730 <udp_sendto_if_src+0xb0>
800086c0:	00078b13          	mv	s6,a5
800086c4:	00954783          	lbu	a5,9(a0)
800086c8:	00070a13          	mv	s4,a4
800086cc:	00068b93          	mv	s7,a3
800086d0:	0207f793          	andi	a5,a5,32
800086d4:	00060a93          	mv	s5,a2
800086d8:	00058993          	mv	s3,a1
800086dc:	00050413          	mv	s0,a0
800086e0:	02078e63          	beqz	a5,8000871c <udp_sendto_if_src+0x9c>
800086e4:	01645783          	lhu	a5,22(s0)
800086e8:	00079e63          	bnez	a5,80008704 <udp_sendto_if_src+0x84>
800086ec:	00000613          	li	a2,0
800086f0:	00040593          	mv	a1,s0
800086f4:	00040513          	mv	a0,s0
800086f8:	e99ff0ef          	jal	ra,80008590 <udp_bind>
800086fc:	00050493          	mv	s1,a0
80008700:	02051863          	bnez	a0,80008730 <udp_sendto_if_src+0xb0>
80008704:	0089d703          	lhu	a4,8(s3)
80008708:	000107b7          	lui	a5,0x10
8000870c:	ff778793          	addi	a5,a5,-9 # fff7 <_stack_size+0xf7f7>
80008710:	04e7f863          	bgeu	a5,a4,80008760 <udp_sendto_if_src+0xe0>
80008714:	fff00493          	li	s1,-1
80008718:	0180006f          	j	80008730 <udp_sendto_if_src+0xb0>
8000871c:	00062503          	lw	a0,0(a2) # c000 <_stack_size+0xb800>
80008720:	00070593          	mv	a1,a4
80008724:	ffa00493          	li	s1,-6
80008728:	559030ef          	jal	ra,8000c480 <ip4_addr_isbroadcast_u32>
8000872c:	fa050ce3          	beqz	a0,800086e4 <udp_sendto_if_src+0x64>
80008730:	02c12083          	lw	ra,44(sp)
80008734:	02812403          	lw	s0,40(sp)
80008738:	00048513          	mv	a0,s1
8000873c:	02012903          	lw	s2,32(sp)
80008740:	02412483          	lw	s1,36(sp)
80008744:	01c12983          	lw	s3,28(sp)
80008748:	01812a03          	lw	s4,24(sp)
8000874c:	01412a83          	lw	s5,20(sp)
80008750:	01012b03          	lw	s6,16(sp)
80008754:	00c12b83          	lw	s7,12(sp)
80008758:	03010113          	addi	sp,sp,48
8000875c:	00008067          	ret
80008760:	00800593          	li	a1,8
80008764:	00098513          	mv	a0,s3
80008768:	ed4fe0ef          	jal	ra,80006e3c <pbuf_add_header>
8000876c:	10050063          	beqz	a0,8000886c <udp_sendto_if_src+0x1ec>
80008770:	28000613          	li	a2,640
80008774:	00800593          	li	a1,8
80008778:	02400513          	li	a0,36
8000877c:	82dfe0ef          	jal	ra,80006fa8 <pbuf_alloc>
80008780:	00050913          	mv	s2,a0
80008784:	f80508e3          	beqz	a0,80008714 <udp_sendto_if_src+0x94>
80008788:	0089d783          	lhu	a5,8(s3)
8000878c:	00078663          	beqz	a5,80008798 <udp_sendto_if_src+0x118>
80008790:	00098593          	mv	a1,s3
80008794:	b99fe0ef          	jal	ra,8000732c <pbuf_chain>
80008798:	01645503          	lhu	a0,22(s0)
8000879c:	00492483          	lw	s1,4(s2)
800087a0:	d10fd0ef          	jal	ra,80005cb0 <lwip_htons>
800087a4:	00a48023          	sb	a0,0(s1)
800087a8:	00855513          	srli	a0,a0,0x8
800087ac:	00a480a3          	sb	a0,1(s1)
800087b0:	000b8513          	mv	a0,s7
800087b4:	cfcfd0ef          	jal	ra,80005cb0 <lwip_htons>
800087b8:	00a48123          	sb	a0,2(s1)
800087bc:	00855513          	srli	a0,a0,0x8
800087c0:	00a481a3          	sb	a0,3(s1)
800087c4:	00048323          	sb	zero,6(s1)
800087c8:	000483a3          	sb	zero,7(s1)
800087cc:	00895503          	lhu	a0,8(s2)
800087d0:	ce0fd0ef          	jal	ra,80005cb0 <lwip_htons>
800087d4:	00a48223          	sb	a0,4(s1)
800087d8:	00855513          	srli	a0,a0,0x8
800087dc:	00a482a3          	sb	a0,5(s1)
800087e0:	01444783          	lbu	a5,20(s0)
800087e4:	0017f793          	andi	a5,a5,1
800087e8:	02079a63          	bnez	a5,8000881c <udp_sendto_if_src+0x19c>
800087ec:	00895603          	lhu	a2,8(s2)
800087f0:	000a8713          	mv	a4,s5
800087f4:	000b0693          	mv	a3,s6
800087f8:	01100593          	li	a1,17
800087fc:	00090513          	mv	a0,s2
80008800:	911fd0ef          	jal	ra,80006110 <ip_chksum_pseudo>
80008804:	00051663          	bnez	a0,80008810 <udp_sendto_if_src+0x190>
80008808:	00010537          	lui	a0,0x10
8000880c:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xf7ff>
80008810:	00a48323          	sb	a0,6(s1)
80008814:	00855513          	srli	a0,a0,0x8
80008818:	00a483a3          	sb	a0,7(s1)
8000881c:	00c40793          	addi	a5,s0,12
80008820:	00b44683          	lbu	a3,11(s0)
80008824:	02fa2e23          	sw	a5,60(s4)
80008828:	00a44703          	lbu	a4,10(s0)
8000882c:	000a0813          	mv	a6,s4
80008830:	01100793          	li	a5,17
80008834:	000a8613          	mv	a2,s5
80008838:	000b0593          	mv	a1,s6
8000883c:	00090513          	mv	a0,s2
80008840:	0d1030ef          	jal	ra,8000c110 <ip4_output_if_src>
80008844:	020a2e23          	sw	zero,60(s4)
80008848:	00050493          	mv	s1,a0
8000884c:	01390663          	beq	s2,s3,80008858 <udp_sendto_if_src+0x1d8>
80008850:	00090513          	mv	a0,s2
80008854:	e80fe0ef          	jal	ra,80006ed4 <pbuf_free>
80008858:	a0c18793          	addi	a5,gp,-1524 # 800031a4 <lwip_stats>
8000885c:	0f07a703          	lw	a4,240(a5)
80008860:	00170713          	addi	a4,a4,1
80008864:	0ee7a823          	sw	a4,240(a5)
80008868:	ec9ff06f          	j	80008730 <udp_sendto_if_src+0xb0>
8000886c:	00098913          	mv	s2,s3
80008870:	f29ff06f          	j	80008798 <udp_sendto_if_src+0x118>

80008874 <udp_sendto_if>:
80008874:	02050e63          	beqz	a0,800088b0 <udp_sendto_if+0x3c>
80008878:	02058c63          	beqz	a1,800088b0 <udp_sendto_if+0x3c>
8000887c:	02060a63          	beqz	a2,800088b0 <udp_sendto_if+0x3c>
80008880:	02070863          	beqz	a4,800088b0 <udp_sendto_if+0x3c>
80008884:	00052783          	lw	a5,0(a0)
80008888:	00078863          	beqz	a5,80008898 <udp_sendto_if+0x24>
8000888c:	0f07f813          	andi	a6,a5,240
80008890:	0e000893          	li	a7,224
80008894:	01181663          	bne	a6,a7,800088a0 <udp_sendto_if+0x2c>
80008898:	00470793          	addi	a5,a4,4
8000889c:	de5ff06f          	j	80008680 <udp_sendto_if_src>
800088a0:	00472803          	lw	a6,4(a4)
800088a4:	01079a63          	bne	a5,a6,800088b8 <udp_sendto_if+0x44>
800088a8:	00050793          	mv	a5,a0
800088ac:	ff1ff06f          	j	8000889c <udp_sendto_if+0x28>
800088b0:	ff000513          	li	a0,-16
800088b4:	00008067          	ret
800088b8:	ffc00513          	li	a0,-4
800088bc:	00008067          	ret

800088c0 <udp_sendto>:
800088c0:	0a050863          	beqz	a0,80008970 <udp_sendto+0xb0>
800088c4:	0a058663          	beqz	a1,80008970 <udp_sendto+0xb0>
800088c8:	0a060463          	beqz	a2,80008970 <udp_sendto+0xb0>
800088cc:	fe010113          	addi	sp,sp,-32
800088d0:	00812c23          	sw	s0,24(sp)
800088d4:	00912a23          	sw	s1,20(sp)
800088d8:	01212823          	sw	s2,16(sp)
800088dc:	01312623          	sw	s3,12(sp)
800088e0:	00112e23          	sw	ra,28(sp)
800088e4:	00050413          	mv	s0,a0
800088e8:	00854503          	lbu	a0,8(a0)
800088ec:	00068993          	mv	s3,a3
800088f0:	00060493          	mv	s1,a2
800088f4:	00058913          	mv	s2,a1
800088f8:	02050e63          	beqz	a0,80008934 <udp_sendto+0x74>
800088fc:	a9cfe0ef          	jal	ra,80006b98 <netif_get_by_index>
80008900:	04051063          	bnez	a0,80008940 <udp_sendto+0x80>
80008904:	a0c18793          	addi	a5,gp,-1524 # 800031a4 <lwip_stats>
80008908:	10c7a703          	lw	a4,268(a5)
8000890c:	ffc00513          	li	a0,-4
80008910:	00170713          	addi	a4,a4,1
80008914:	10e7a623          	sw	a4,268(a5)
80008918:	01c12083          	lw	ra,28(sp)
8000891c:	01812403          	lw	s0,24(sp)
80008920:	01412483          	lw	s1,20(sp)
80008924:	01012903          	lw	s2,16(sp)
80008928:	00c12983          	lw	s3,12(sp)
8000892c:	02010113          	addi	sp,sp,32
80008930:	00008067          	ret
80008934:	00060513          	mv	a0,a2
80008938:	384030ef          	jal	ra,8000bcbc <ip4_route>
8000893c:	fc5ff06f          	j	80008900 <udp_sendto+0x40>
80008940:	00050713          	mv	a4,a0
80008944:	00040513          	mv	a0,s0
80008948:	01812403          	lw	s0,24(sp)
8000894c:	01c12083          	lw	ra,28(sp)
80008950:	00098693          	mv	a3,s3
80008954:	00048613          	mv	a2,s1
80008958:	00c12983          	lw	s3,12(sp)
8000895c:	01412483          	lw	s1,20(sp)
80008960:	00090593          	mv	a1,s2
80008964:	01012903          	lw	s2,16(sp)
80008968:	02010113          	addi	sp,sp,32
8000896c:	f09ff06f          	j	80008874 <udp_sendto_if>
80008970:	ff000513          	li	a0,-16
80008974:	00008067          	ret

80008978 <udp_send>:
80008978:	00050a63          	beqz	a0,8000898c <udp_send+0x14>
8000897c:	00058863          	beqz	a1,8000898c <udp_send+0x14>
80008980:	01855683          	lhu	a3,24(a0)
80008984:	00450613          	addi	a2,a0,4
80008988:	f39ff06f          	j	800088c0 <udp_sendto>
8000898c:	ff000513          	li	a0,-16
80008990:	00008067          	ret

80008994 <udp_bind_netif>:
80008994:	00000793          	li	a5,0
80008998:	00058863          	beqz	a1,800089a8 <udp_bind_netif+0x14>
8000899c:	0385c783          	lbu	a5,56(a1)
800089a0:	00178793          	addi	a5,a5,1
800089a4:	0ff7f793          	andi	a5,a5,255
800089a8:	00f50423          	sb	a5,8(a0)
800089ac:	00008067          	ret

800089b0 <udp_connect>:
800089b0:	ff000793          	li	a5,-16
800089b4:	0a050063          	beqz	a0,80008a54 <udp_connect+0xa4>
800089b8:	08058e63          	beqz	a1,80008a54 <udp_connect+0xa4>
800089bc:	ff010113          	addi	sp,sp,-16
800089c0:	00812423          	sw	s0,8(sp)
800089c4:	00912223          	sw	s1,4(sp)
800089c8:	01212023          	sw	s2,0(sp)
800089cc:	00112623          	sw	ra,12(sp)
800089d0:	01655783          	lhu	a5,22(a0)
800089d4:	00050413          	mv	s0,a0
800089d8:	00060913          	mv	s2,a2
800089dc:	00058493          	mv	s1,a1
800089e0:	02078c63          	beqz	a5,80008a18 <udp_connect+0x68>
800089e4:	0004a783          	lw	a5,0(s1)
800089e8:	01241c23          	sh	s2,24(s0)
800089ec:	00f42223          	sw	a5,4(s0)
800089f0:	01444783          	lbu	a5,20(s0)
800089f4:	0047e793          	ori	a5,a5,4
800089f8:	00f40a23          	sb	a5,20(s0)
800089fc:	8e41a683          	lw	a3,-1820(gp) # 8000307c <udp_pcbs>
80008a00:	00068713          	mv	a4,a3
80008a04:	04071263          	bnez	a4,80008a48 <udp_connect+0x98>
80008a08:	00d42823          	sw	a3,16(s0)
80008a0c:	8e81a223          	sw	s0,-1820(gp) # 8000307c <udp_pcbs>
80008a10:	00000793          	li	a5,0
80008a14:	0180006f          	j	80008a2c <udp_connect+0x7c>
80008a18:	00000613          	li	a2,0
80008a1c:	00050593          	mv	a1,a0
80008a20:	b71ff0ef          	jal	ra,80008590 <udp_bind>
80008a24:	00050793          	mv	a5,a0
80008a28:	fa050ee3          	beqz	a0,800089e4 <udp_connect+0x34>
80008a2c:	00c12083          	lw	ra,12(sp)
80008a30:	00812403          	lw	s0,8(sp)
80008a34:	00412483          	lw	s1,4(sp)
80008a38:	00012903          	lw	s2,0(sp)
80008a3c:	00078513          	mv	a0,a5
80008a40:	01010113          	addi	sp,sp,16
80008a44:	00008067          	ret
80008a48:	fc8704e3          	beq	a4,s0,80008a10 <udp_connect+0x60>
80008a4c:	01072703          	lw	a4,16(a4)
80008a50:	fb5ff06f          	j	80008a04 <udp_connect+0x54>
80008a54:	00078513          	mv	a0,a5
80008a58:	00008067          	ret

80008a5c <udp_disconnect>:
80008a5c:	00050e63          	beqz	a0,80008a78 <udp_disconnect+0x1c>
80008a60:	01454783          	lbu	a5,20(a0)
80008a64:	00052223          	sw	zero,4(a0)
80008a68:	00051c23          	sh	zero,24(a0)
80008a6c:	ffb7f793          	andi	a5,a5,-5
80008a70:	00050423          	sb	zero,8(a0)
80008a74:	00f50a23          	sb	a5,20(a0)
80008a78:	00008067          	ret

80008a7c <udp_recv>:
80008a7c:	00050663          	beqz	a0,80008a88 <udp_recv+0xc>
80008a80:	00b52e23          	sw	a1,28(a0)
80008a84:	02c52023          	sw	a2,32(a0)
80008a88:	00008067          	ret

80008a8c <udp_remove>:
80008a8c:	00050593          	mv	a1,a0
80008a90:	02050e63          	beqz	a0,80008acc <udp_remove+0x40>
80008a94:	8e41a783          	lw	a5,-1820(gp) # 8000307c <udp_pcbs>
80008a98:	00a79c63          	bne	a5,a0,80008ab0 <udp_remove+0x24>
80008a9c:	01052783          	lw	a5,16(a0)
80008aa0:	8ef1a223          	sw	a5,-1820(gp) # 8000307c <udp_pcbs>
80008aa4:	00100513          	li	a0,1
80008aa8:	b79fd06f          	j	80006620 <memp_free>
80008aac:	00070793          	mv	a5,a4
80008ab0:	fe078ae3          	beqz	a5,80008aa4 <udp_remove+0x18>
80008ab4:	0107a703          	lw	a4,16(a5)
80008ab8:	fe0706e3          	beqz	a4,80008aa4 <udp_remove+0x18>
80008abc:	feb718e3          	bne	a4,a1,80008aac <udp_remove+0x20>
80008ac0:	0105a703          	lw	a4,16(a1)
80008ac4:	00e7a823          	sw	a4,16(a5)
80008ac8:	fddff06f          	j	80008aa4 <udp_remove+0x18>
80008acc:	00008067          	ret

80008ad0 <udp_new>:
80008ad0:	800035b7          	lui	a1,0x80003
80008ad4:	ff010113          	addi	sp,sp,-16
80008ad8:	4c800613          	li	a2,1224
80008adc:	c3858593          	addi	a1,a1,-968 # 80002c38 <_ram_heap_end+0xffff0c38>
80008ae0:	00100513          	li	a0,1
80008ae4:	00812423          	sw	s0,8(sp)
80008ae8:	00112623          	sw	ra,12(sp)
80008aec:	afdfd0ef          	jal	ra,800065e8 <memp_malloc_fn>
80008af0:	00050413          	mv	s0,a0
80008af4:	00050c63          	beqz	a0,80008b0c <udp_new+0x3c>
80008af8:	02400613          	li	a2,36
80008afc:	00000593          	li	a1,0
80008b00:	038040ef          	jal	ra,8000cb38 <memset>
80008b04:	fff00793          	li	a5,-1
80008b08:	00f405a3          	sb	a5,11(s0)
80008b0c:	00040513          	mv	a0,s0
80008b10:	00c12083          	lw	ra,12(sp)
80008b14:	00812403          	lw	s0,8(sp)
80008b18:	01010113          	addi	sp,sp,16
80008b1c:	00008067          	ret

80008b20 <udp_new_ip_type>:
80008b20:	fb1ff06f          	j	80008ad0 <udp_new>

80008b24 <udp_netif_ip_addr_changed>:
80008b24:	02050063          	beqz	a0,80008b44 <udp_netif_ip_addr_changed+0x20>
80008b28:	00052783          	lw	a5,0(a0)
80008b2c:	00078c63          	beqz	a5,80008b44 <udp_netif_ip_addr_changed+0x20>
80008b30:	00058a63          	beqz	a1,80008b44 <udp_netif_ip_addr_changed+0x20>
80008b34:	0005a783          	lw	a5,0(a1)
80008b38:	00078663          	beqz	a5,80008b44 <udp_netif_ip_addr_changed+0x20>
80008b3c:	8e41a783          	lw	a5,-1820(gp) # 8000307c <udp_pcbs>
80008b40:	00079463          	bnez	a5,80008b48 <udp_netif_ip_addr_changed+0x24>
80008b44:	00008067          	ret
80008b48:	0007a683          	lw	a3,0(a5)
80008b4c:	00052703          	lw	a4,0(a0)
80008b50:	00e69663          	bne	a3,a4,80008b5c <udp_netif_ip_addr_changed+0x38>
80008b54:	0005a703          	lw	a4,0(a1)
80008b58:	00e7a023          	sw	a4,0(a5)
80008b5c:	0107a783          	lw	a5,16(a5)
80008b60:	fe1ff06f          	j	80008b40 <udp_netif_ip_addr_changed+0x1c>

80008b64 <dhcp_set_state>:
80008b64:	00554783          	lbu	a5,5(a0)
80008b68:	00b78863          	beq	a5,a1,80008b78 <dhcp_set_state+0x14>
80008b6c:	00b502a3          	sb	a1,5(a0)
80008b70:	00050323          	sb	zero,6(a0)
80008b74:	00051423          	sh	zero,8(a0)
80008b78:	00008067          	ret

80008b7c <dhcp_option_short>:
80008b7c:	00a587b3          	add	a5,a1,a0
80008b80:	00865713          	srli	a4,a2,0x8
80008b84:	00e78023          	sb	a4,0(a5)
80008b88:	00150793          	addi	a5,a0,1
80008b8c:	01079793          	slli	a5,a5,0x10
80008b90:	0107d793          	srli	a5,a5,0x10
80008b94:	00250513          	addi	a0,a0,2
80008b98:	00f585b3          	add	a1,a1,a5
80008b9c:	01051513          	slli	a0,a0,0x10
80008ba0:	00c58023          	sb	a2,0(a1)
80008ba4:	01055513          	srli	a0,a0,0x10
80008ba8:	00008067          	ret

80008bac <dhcp_option_long>:
80008bac:	00a587b3          	add	a5,a1,a0
80008bb0:	01865713          	srli	a4,a2,0x18
80008bb4:	00e78023          	sb	a4,0(a5)
80008bb8:	00150793          	addi	a5,a0,1
80008bbc:	01079793          	slli	a5,a5,0x10
80008bc0:	0107d793          	srli	a5,a5,0x10
80008bc4:	00f587b3          	add	a5,a1,a5
80008bc8:	01065713          	srli	a4,a2,0x10
80008bcc:	00e78023          	sb	a4,0(a5)
80008bd0:	00250793          	addi	a5,a0,2
80008bd4:	01079793          	slli	a5,a5,0x10
80008bd8:	0107d793          	srli	a5,a5,0x10
80008bdc:	00f587b3          	add	a5,a1,a5
80008be0:	00865713          	srli	a4,a2,0x8
80008be4:	00e78023          	sb	a4,0(a5)
80008be8:	00350793          	addi	a5,a0,3
80008bec:	01079793          	slli	a5,a5,0x10
80008bf0:	0107d793          	srli	a5,a5,0x10
80008bf4:	00450513          	addi	a0,a0,4
80008bf8:	00f585b3          	add	a1,a1,a5
80008bfc:	01051513          	slli	a0,a0,0x10
80008c00:	00c58023          	sb	a2,0(a1)
80008c04:	01055513          	srli	a0,a0,0x10
80008c08:	00008067          	ret

80008c0c <dhcp_create_msg>:
80008c0c:	fe010113          	addi	sp,sp,-32
80008c10:	00112e23          	sw	ra,28(sp)
80008c14:	00812c23          	sw	s0,24(sp)
80008c18:	00912a23          	sw	s1,20(sp)
80008c1c:	01212823          	sw	s2,16(sp)
80008c20:	01312623          	sw	s3,12(sp)
80008c24:	01412423          	sw	s4,8(sp)
80008c28:	01512223          	sw	s5,4(sp)
80008c2c:	01612023          	sw	s6,0(sp)
80008c30:	02051a63          	bnez	a0,80008c64 <dhcp_create_msg+0x58>
80008c34:	00000a93          	li	s5,0
80008c38:	01c12083          	lw	ra,28(sp)
80008c3c:	01812403          	lw	s0,24(sp)
80008c40:	000a8513          	mv	a0,s5
80008c44:	01412483          	lw	s1,20(sp)
80008c48:	01012903          	lw	s2,16(sp)
80008c4c:	00c12983          	lw	s3,12(sp)
80008c50:	00812a03          	lw	s4,8(sp)
80008c54:	00412a83          	lw	s5,4(sp)
80008c58:	00012b03          	lw	s6,0(sp)
80008c5c:	02010113          	addi	sp,sp,32
80008c60:	00008067          	ret
80008c64:	fc0588e3          	beqz	a1,80008c34 <dhcp_create_msg+0x28>
80008c68:	00060913          	mv	s2,a2
80008c6c:	00058993          	mv	s3,a1
80008c70:	00050493          	mv	s1,a0
80008c74:	28000613          	li	a2,640
80008c78:	13400593          	li	a1,308
80008c7c:	03800513          	li	a0,56
80008c80:	00068a13          	mv	s4,a3
80008c84:	b24fe0ef          	jal	ra,80006fa8 <pbuf_alloc>
80008c88:	00050a93          	mv	s5,a0
80008c8c:	fa0504e3          	beqz	a0,80008c34 <dhcp_create_msg+0x28>
80008c90:	00300793          	li	a5,3
80008c94:	00f91663          	bne	s2,a5,80008ca0 <dhcp_create_msg+0x94>
80008c98:	0059c783          	lbu	a5,5(s3)
80008c9c:	03279063          	bne	a5,s2,80008cbc <dhcp_create_msg+0xb0>
80008ca0:	0069c703          	lbu	a4,6(s3)
80008ca4:	00071863          	bnez	a4,80008cb4 <dhcp_create_msg+0xa8>
80008ca8:	8081a703          	lw	a4,-2040(gp) # 80002fa0 <xid.4812>
80008cac:	00170713          	addi	a4,a4,1
80008cb0:	80e1a423          	sw	a4,-2040(gp) # 80002fa0 <xid.4812>
80008cb4:	8081a783          	lw	a5,-2040(gp) # 80002fa0 <xid.4812>
80008cb8:	00f9a023          	sw	a5,0(s3)
80008cbc:	004aa403          	lw	s0,4(s5)
80008cc0:	13400613          	li	a2,308
80008cc4:	00000593          	li	a1,0
80008cc8:	00100b13          	li	s6,1
80008ccc:	00040513          	mv	a0,s0
80008cd0:	669030ef          	jal	ra,8000cb38 <memset>
80008cd4:	01640023          	sb	s6,0(s0)
80008cd8:	016400a3          	sb	s6,1(s0)
80008cdc:	0344c783          	lbu	a5,52(s1)
80008ce0:	00f40123          	sb	a5,2(s0)
80008ce4:	0009a503          	lw	a0,0(s3)
80008ce8:	fe1fc0ef          	jal	ra,80005cc8 <lwip_htonl>
80008cec:	00855793          	srli	a5,a0,0x8
80008cf0:	00a40223          	sb	a0,4(s0)
80008cf4:	00f402a3          	sb	a5,5(s0)
80008cf8:	01055793          	srli	a5,a0,0x10
80008cfc:	01855513          	srli	a0,a0,0x18
80008d00:	00f40323          	sb	a5,6(s0)
80008d04:	00a403a3          	sb	a0,7(s0)
80008d08:	00400793          	li	a5,4
80008d0c:	02f90463          	beq	s2,a5,80008d34 <dhcp_create_msg+0x128>
80008d10:	ff990793          	addi	a5,s2,-7
80008d14:	0ff7f793          	andi	a5,a5,255
80008d18:	00fb7e63          	bgeu	s6,a5,80008d34 <dhcp_create_msg+0x128>
80008d1c:	00300793          	li	a5,3
80008d20:	02f91a63          	bne	s2,a5,80008d54 <dhcp_create_msg+0x148>
80008d24:	0059c783          	lbu	a5,5(s3)
80008d28:	ffc78793          	addi	a5,a5,-4
80008d2c:	0ff7f793          	andi	a5,a5,255
80008d30:	02fb6263          	bltu	s6,a5,80008d54 <dhcp_create_msg+0x148>
80008d34:	0044a783          	lw	a5,4(s1)
80008d38:	0087d713          	srli	a4,a5,0x8
80008d3c:	00f40623          	sb	a5,12(s0)
80008d40:	00e406a3          	sb	a4,13(s0)
80008d44:	0107d713          	srli	a4,a5,0x10
80008d48:	0187d793          	srli	a5,a5,0x18
80008d4c:	00e40723          	sb	a4,14(s0)
80008d50:	00f407a3          	sb	a5,15(s0)
80008d54:	02e48793          	addi	a5,s1,46
80008d58:	01c40713          	addi	a4,s0,28
80008d5c:	03448493          	addi	s1,s1,52
80008d60:	0007c683          	lbu	a3,0(a5)
80008d64:	00178793          	addi	a5,a5,1
80008d68:	00170713          	addi	a4,a4,1
80008d6c:	fed70fa3          	sb	a3,-1(a4)
80008d70:	fe9798e3          	bne	a5,s1,80008d60 <dhcp_create_msg+0x154>
80008d74:	06300793          	li	a5,99
80008d78:	0ef40623          	sb	a5,236(s0)
80008d7c:	f8200713          	li	a4,-126
80008d80:	0ef407a3          	sb	a5,239(s0)
80008d84:	03500793          	li	a5,53
80008d88:	0ee406a3          	sb	a4,237(s0)
80008d8c:	0ef40823          	sb	a5,240(s0)
80008d90:	05300713          	li	a4,83
80008d94:	00100793          	li	a5,1
80008d98:	0ef408a3          	sb	a5,241(s0)
80008d9c:	0ee40723          	sb	a4,238(s0)
80008da0:	0f240923          	sb	s2,242(s0)
80008da4:	00300793          	li	a5,3
80008da8:	00fa1023          	sh	a5,0(s4)
80008dac:	e8dff06f          	j	80008c38 <dhcp_create_msg+0x2c>

80008db0 <dhcp_option_trailer>:
80008db0:	00150793          	addi	a5,a0,1
80008db4:	01079793          	slli	a5,a5,0x10
80008db8:	00a58733          	add	a4,a1,a0
80008dbc:	0107d793          	srli	a5,a5,0x10
80008dc0:	fff00693          	li	a3,-1
80008dc4:	00d70023          	sb	a3,0(a4)
80008dc8:	00f585b3          	add	a1,a1,a5
80008dcc:	04300713          	li	a4,67
80008dd0:	00f77c63          	bgeu	a4,a5,80008de8 <dhcp_option_trailer+0x38>
80008dd4:	0f078593          	addi	a1,a5,240
80008dd8:	01059593          	slli	a1,a1,0x10
80008ddc:	0105d593          	srli	a1,a1,0x10
80008de0:	00060513          	mv	a0,a2
80008de4:	b94fe06f          	j	80007178 <pbuf_realloc>
80008de8:	00178793          	addi	a5,a5,1
80008dec:	01079793          	slli	a5,a5,0x10
80008df0:	00058023          	sb	zero,0(a1)
80008df4:	0107d793          	srli	a5,a5,0x10
80008df8:	00158593          	addi	a1,a1,1
80008dfc:	fd5ff06f          	j	80008dd0 <dhcp_option_trailer+0x20>

80008e00 <dhcp_reboot>:
80008e00:	fd010113          	addi	sp,sp,-48
80008e04:	02112623          	sw	ra,44(sp)
80008e08:	02812423          	sw	s0,40(sp)
80008e0c:	03212023          	sw	s2,32(sp)
80008e10:	02912223          	sw	s1,36(sp)
80008e14:	01312e23          	sw	s3,28(sp)
80008e18:	01412c23          	sw	s4,24(sp)
80008e1c:	02852483          	lw	s1,40(a0)
80008e20:	00050913          	mv	s2,a0
80008e24:	00300593          	li	a1,3
80008e28:	00048513          	mv	a0,s1
80008e2c:	d39ff0ef          	jal	ra,80008b64 <dhcp_set_state>
80008e30:	00e10693          	addi	a3,sp,14
80008e34:	00300613          	li	a2,3
80008e38:	00048593          	mv	a1,s1
80008e3c:	00090513          	mv	a0,s2
80008e40:	dcdff0ef          	jal	ra,80008c0c <dhcp_create_msg>
80008e44:	fff00413          	li	s0,-1
80008e48:	14050663          	beqz	a0,80008f94 <dhcp_reboot+0x194>
80008e4c:	00452403          	lw	s0,4(a0)
80008e50:	00e15783          	lhu	a5,14(sp)
80008e54:	00050993          	mv	s3,a0
80008e58:	0f040413          	addi	s0,s0,240
80008e5c:	00f40733          	add	a4,s0,a5
80008e60:	00278513          	addi	a0,a5,2
80008e64:	00178793          	addi	a5,a5,1
80008e68:	01079793          	slli	a5,a5,0x10
80008e6c:	03900693          	li	a3,57
80008e70:	0107d793          	srli	a5,a5,0x10
80008e74:	00d70023          	sb	a3,0(a4)
80008e78:	00f407b3          	add	a5,s0,a5
80008e7c:	00200713          	li	a4,2
80008e80:	01051513          	slli	a0,a0,0x10
80008e84:	00e78023          	sb	a4,0(a5)
80008e88:	00040593          	mv	a1,s0
80008e8c:	24000613          	li	a2,576
80008e90:	01055513          	srli	a0,a0,0x10
80008e94:	00a11723          	sh	a0,14(sp)
80008e98:	ce5ff0ef          	jal	ra,80008b7c <dhcp_option_short>
80008e9c:	00a407b3          	add	a5,s0,a0
80008ea0:	00250a13          	addi	s4,a0,2
80008ea4:	00150513          	addi	a0,a0,1
80008ea8:	01051513          	slli	a0,a0,0x10
80008eac:	03200713          	li	a4,50
80008eb0:	01055513          	srli	a0,a0,0x10
80008eb4:	00e78023          	sb	a4,0(a5)
80008eb8:	00a40533          	add	a0,s0,a0
80008ebc:	00400793          	li	a5,4
80008ec0:	00f50023          	sb	a5,0(a0)
80008ec4:	01c4a503          	lw	a0,28(s1)
80008ec8:	010a1a13          	slli	s4,s4,0x10
80008ecc:	010a5a13          	srli	s4,s4,0x10
80008ed0:	01411723          	sh	s4,14(sp)
80008ed4:	df5fc0ef          	jal	ra,80005cc8 <lwip_htonl>
80008ed8:	00050613          	mv	a2,a0
80008edc:	00040593          	mv	a1,s0
80008ee0:	000a0513          	mv	a0,s4
80008ee4:	cc9ff0ef          	jal	ra,80008bac <dhcp_option_long>
80008ee8:	00a40733          	add	a4,s0,a0
80008eec:	03700693          	li	a3,55
80008ef0:	00d70023          	sb	a3,0(a4)
80008ef4:	00150713          	addi	a4,a0,1
80008ef8:	01071713          	slli	a4,a4,0x10
80008efc:	01075713          	srli	a4,a4,0x10
80008f00:	00300693          	li	a3,3
80008f04:	00e40733          	add	a4,s0,a4
80008f08:	00d70023          	sb	a3,0(a4)
80008f0c:	00250713          	addi	a4,a0,2
80008f10:	01071713          	slli	a4,a4,0x10
80008f14:	01075713          	srli	a4,a4,0x10
80008f18:	00e40733          	add	a4,s0,a4
80008f1c:	00100613          	li	a2,1
80008f20:	00c70023          	sb	a2,0(a4)
80008f24:	00050793          	mv	a5,a0
80008f28:	00350713          	addi	a4,a0,3
80008f2c:	01071713          	slli	a4,a4,0x10
80008f30:	00478793          	addi	a5,a5,4
80008f34:	01075713          	srli	a4,a4,0x10
80008f38:	01079793          	slli	a5,a5,0x10
80008f3c:	00e40733          	add	a4,s0,a4
80008f40:	00550513          	addi	a0,a0,5
80008f44:	0107d793          	srli	a5,a5,0x10
80008f48:	00d70023          	sb	a3,0(a4)
80008f4c:	00f407b3          	add	a5,s0,a5
80008f50:	01c00713          	li	a4,28
80008f54:	01051513          	slli	a0,a0,0x10
80008f58:	00e78023          	sb	a4,0(a5)
80008f5c:	01055513          	srli	a0,a0,0x10
80008f60:	00040593          	mv	a1,s0
80008f64:	00098613          	mv	a2,s3
80008f68:	00a11723          	sh	a0,14(sp)
80008f6c:	e45ff0ef          	jal	ra,80008db0 <dhcp_option_trailer>
80008f70:	8ec1a503          	lw	a0,-1812(gp) # 80003084 <dhcp_pcb>
80008f74:	00090713          	mv	a4,s2
80008f78:	04300693          	li	a3,67
80008f7c:	84418613          	addi	a2,gp,-1980 # 80002fdc <ip_addr_broadcast>
80008f80:	00098593          	mv	a1,s3
80008f84:	8f1ff0ef          	jal	ra,80008874 <udp_sendto_if>
80008f88:	00050413          	mv	s0,a0
80008f8c:	00098513          	mv	a0,s3
80008f90:	f45fd0ef          	jal	ra,80006ed4 <pbuf_free>
80008f94:	0064c783          	lbu	a5,6(s1)
80008f98:	0ff00713          	li	a4,255
80008f9c:	00e78663          	beq	a5,a4,80008fa8 <dhcp_reboot+0x1a8>
80008fa0:	00178793          	addi	a5,a5,1
80008fa4:	00f48323          	sb	a5,6(s1)
80008fa8:	0064c503          	lbu	a0,6(s1)
80008fac:	00900793          	li	a5,9
80008fb0:	04a7ea63          	bltu	a5,a0,80009004 <dhcp_reboot+0x204>
80008fb4:	00551793          	slli	a5,a0,0x5
80008fb8:	40a787b3          	sub	a5,a5,a0
80008fbc:	00279793          	slli	a5,a5,0x2
80008fc0:	00f50533          	add	a0,a0,a5
80008fc4:	00351513          	slli	a0,a0,0x3
80008fc8:	01051513          	slli	a0,a0,0x10
80008fcc:	01055513          	srli	a0,a0,0x10
80008fd0:	1f400593          	li	a1,500
80008fd4:	1f350513          	addi	a0,a0,499
80008fd8:	268040ef          	jal	ra,8000d240 <__divsi3>
80008fdc:	00a49423          	sh	a0,8(s1)
80008fe0:	02c12083          	lw	ra,44(sp)
80008fe4:	00040513          	mv	a0,s0
80008fe8:	02812403          	lw	s0,40(sp)
80008fec:	02412483          	lw	s1,36(sp)
80008ff0:	02012903          	lw	s2,32(sp)
80008ff4:	01c12983          	lw	s3,28(sp)
80008ff8:	01812a03          	lw	s4,24(sp)
80008ffc:	03010113          	addi	sp,sp,48
80009000:	00008067          	ret
80009004:	00002537          	lui	a0,0x2
80009008:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
8000900c:	fc5ff06f          	j	80008fd0 <dhcp_reboot+0x1d0>

80009010 <dhcp_select>:
80009010:	fd010113          	addi	sp,sp,-48
80009014:	02812423          	sw	s0,40(sp)
80009018:	02112623          	sw	ra,44(sp)
8000901c:	02912223          	sw	s1,36(sp)
80009020:	03212023          	sw	s2,32(sp)
80009024:	01312e23          	sw	s3,28(sp)
80009028:	01412c23          	sw	s4,24(sp)
8000902c:	01512a23          	sw	s5,20(sp)
80009030:	ff000413          	li	s0,-16
80009034:	22050263          	beqz	a0,80009258 <dhcp_select+0x248>
80009038:	02852483          	lw	s1,40(a0)
8000903c:	ffa00413          	li	s0,-6
80009040:	20048c63          	beqz	s1,80009258 <dhcp_select+0x248>
80009044:	00050913          	mv	s2,a0
80009048:	00100593          	li	a1,1
8000904c:	00048513          	mv	a0,s1
80009050:	b15ff0ef          	jal	ra,80008b64 <dhcp_set_state>
80009054:	00e10693          	addi	a3,sp,14
80009058:	00300613          	li	a2,3
8000905c:	00048593          	mv	a1,s1
80009060:	00090513          	mv	a0,s2
80009064:	ba9ff0ef          	jal	ra,80008c0c <dhcp_create_msg>
80009068:	00050993          	mv	s3,a0
8000906c:	fff00413          	li	s0,-1
80009070:	18050a63          	beqz	a0,80009204 <dhcp_select+0x1f4>
80009074:	00452403          	lw	s0,4(a0)
80009078:	00e15783          	lhu	a5,14(sp)
8000907c:	03900693          	li	a3,57
80009080:	0f040413          	addi	s0,s0,240
80009084:	00f40733          	add	a4,s0,a5
80009088:	00278513          	addi	a0,a5,2
8000908c:	00178793          	addi	a5,a5,1
80009090:	01079793          	slli	a5,a5,0x10
80009094:	0107d793          	srli	a5,a5,0x10
80009098:	00d70023          	sb	a3,0(a4)
8000909c:	00f407b3          	add	a5,s0,a5
800090a0:	00200713          	li	a4,2
800090a4:	00e78023          	sb	a4,0(a5)
800090a8:	02c95603          	lhu	a2,44(s2)
800090ac:	01051513          	slli	a0,a0,0x10
800090b0:	00040593          	mv	a1,s0
800090b4:	01055513          	srli	a0,a0,0x10
800090b8:	00a11723          	sh	a0,14(sp)
800090bc:	ac1ff0ef          	jal	ra,80008b7c <dhcp_option_short>
800090c0:	00a407b3          	add	a5,s0,a0
800090c4:	03200713          	li	a4,50
800090c8:	00e78023          	sb	a4,0(a5)
800090cc:	00150793          	addi	a5,a0,1
800090d0:	01079793          	slli	a5,a5,0x10
800090d4:	0107d793          	srli	a5,a5,0x10
800090d8:	00f407b3          	add	a5,s0,a5
800090dc:	00400a93          	li	s5,4
800090e0:	01578023          	sb	s5,0(a5)
800090e4:	00250a13          	addi	s4,a0,2
800090e8:	01c4a503          	lw	a0,28(s1)
800090ec:	010a1a13          	slli	s4,s4,0x10
800090f0:	010a5a13          	srli	s4,s4,0x10
800090f4:	01411723          	sh	s4,14(sp)
800090f8:	bd1fc0ef          	jal	ra,80005cc8 <lwip_htonl>
800090fc:	00050613          	mv	a2,a0
80009100:	00040593          	mv	a1,s0
80009104:	000a0513          	mv	a0,s4
80009108:	aa5ff0ef          	jal	ra,80008bac <dhcp_option_long>
8000910c:	00a407b3          	add	a5,s0,a0
80009110:	03600713          	li	a4,54
80009114:	00e78023          	sb	a4,0(a5)
80009118:	00150793          	addi	a5,a0,1
8000911c:	01079793          	slli	a5,a5,0x10
80009120:	0107d793          	srli	a5,a5,0x10
80009124:	00f407b3          	add	a5,s0,a5
80009128:	01578023          	sb	s5,0(a5)
8000912c:	00250a13          	addi	s4,a0,2
80009130:	0184a503          	lw	a0,24(s1)
80009134:	010a1a13          	slli	s4,s4,0x10
80009138:	010a5a13          	srli	s4,s4,0x10
8000913c:	01411723          	sh	s4,14(sp)
80009140:	b89fc0ef          	jal	ra,80005cc8 <lwip_htonl>
80009144:	00050613          	mv	a2,a0
80009148:	00040593          	mv	a1,s0
8000914c:	000a0513          	mv	a0,s4
80009150:	a5dff0ef          	jal	ra,80008bac <dhcp_option_long>
80009154:	00a40733          	add	a4,s0,a0
80009158:	03700693          	li	a3,55
8000915c:	00d70023          	sb	a3,0(a4)
80009160:	00150713          	addi	a4,a0,1
80009164:	01071713          	slli	a4,a4,0x10
80009168:	01075713          	srli	a4,a4,0x10
8000916c:	00300693          	li	a3,3
80009170:	00e40733          	add	a4,s0,a4
80009174:	00d70023          	sb	a3,0(a4)
80009178:	00250713          	addi	a4,a0,2
8000917c:	01071713          	slli	a4,a4,0x10
80009180:	01075713          	srli	a4,a4,0x10
80009184:	00e40733          	add	a4,s0,a4
80009188:	00100613          	li	a2,1
8000918c:	00c70023          	sb	a2,0(a4)
80009190:	00050793          	mv	a5,a0
80009194:	00350713          	addi	a4,a0,3
80009198:	01071713          	slli	a4,a4,0x10
8000919c:	00478793          	addi	a5,a5,4
800091a0:	01075713          	srli	a4,a4,0x10
800091a4:	01079793          	slli	a5,a5,0x10
800091a8:	00e40733          	add	a4,s0,a4
800091ac:	00550513          	addi	a0,a0,5
800091b0:	0107d793          	srli	a5,a5,0x10
800091b4:	00d70023          	sb	a3,0(a4)
800091b8:	00f407b3          	add	a5,s0,a5
800091bc:	01c00713          	li	a4,28
800091c0:	01051513          	slli	a0,a0,0x10
800091c4:	00e78023          	sb	a4,0(a5)
800091c8:	01055513          	srli	a0,a0,0x10
800091cc:	00040593          	mv	a1,s0
800091d0:	00098613          	mv	a2,s3
800091d4:	00a11723          	sh	a0,14(sp)
800091d8:	bd9ff0ef          	jal	ra,80008db0 <dhcp_option_trailer>
800091dc:	8ec1a503          	lw	a0,-1812(gp) # 80003084 <dhcp_pcb>
800091e0:	84818793          	addi	a5,gp,-1976 # 80002fe0 <ip_addr_any>
800091e4:	00090713          	mv	a4,s2
800091e8:	04300693          	li	a3,67
800091ec:	84418613          	addi	a2,gp,-1980 # 80002fdc <ip_addr_broadcast>
800091f0:	00098593          	mv	a1,s3
800091f4:	c8cff0ef          	jal	ra,80008680 <udp_sendto_if_src>
800091f8:	00050413          	mv	s0,a0
800091fc:	00098513          	mv	a0,s3
80009200:	cd5fd0ef          	jal	ra,80006ed4 <pbuf_free>
80009204:	0064c783          	lbu	a5,6(s1)
80009208:	0ff00713          	li	a4,255
8000920c:	00e78663          	beq	a5,a4,80009218 <dhcp_select+0x208>
80009210:	00178793          	addi	a5,a5,1
80009214:	00f48323          	sb	a5,6(s1)
80009218:	0064c783          	lbu	a5,6(s1)
8000921c:	00500713          	li	a4,5
80009220:	06f76063          	bltu	a4,a5,80009280 <dhcp_select+0x270>
80009224:	00100513          	li	a0,1
80009228:	00f51533          	sll	a0,a0,a5
8000922c:	00551793          	slli	a5,a0,0x5
80009230:	40a787b3          	sub	a5,a5,a0
80009234:	00279793          	slli	a5,a5,0x2
80009238:	00f50533          	add	a0,a0,a5
8000923c:	00351513          	slli	a0,a0,0x3
80009240:	01051513          	slli	a0,a0,0x10
80009244:	01055513          	srli	a0,a0,0x10
80009248:	1f400593          	li	a1,500
8000924c:	1f350513          	addi	a0,a0,499
80009250:	7f1030ef          	jal	ra,8000d240 <__divsi3>
80009254:	00a49423          	sh	a0,8(s1)
80009258:	00040513          	mv	a0,s0
8000925c:	02c12083          	lw	ra,44(sp)
80009260:	02812403          	lw	s0,40(sp)
80009264:	02412483          	lw	s1,36(sp)
80009268:	02012903          	lw	s2,32(sp)
8000926c:	01c12983          	lw	s3,28(sp)
80009270:	01812a03          	lw	s4,24(sp)
80009274:	01412a83          	lw	s5,20(sp)
80009278:	03010113          	addi	sp,sp,48
8000927c:	00008067          	ret
80009280:	0000f537          	lui	a0,0xf
80009284:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
80009288:	fc1ff06f          	j	80009248 <dhcp_select+0x238>

8000928c <dhcp_discover>:
8000928c:	fd010113          	addi	sp,sp,-48
80009290:	01312e23          	sw	s3,28(sp)
80009294:	02112623          	sw	ra,44(sp)
80009298:	02812423          	sw	s0,40(sp)
8000929c:	02912223          	sw	s1,36(sp)
800092a0:	03212023          	sw	s2,32(sp)
800092a4:	02852483          	lw	s1,40(a0)
800092a8:	00050993          	mv	s3,a0
800092ac:	00600593          	li	a1,6
800092b0:	00048513          	mv	a0,s1
800092b4:	0004ae23          	sw	zero,28(s1)
800092b8:	8adff0ef          	jal	ra,80008b64 <dhcp_set_state>
800092bc:	00e10693          	addi	a3,sp,14
800092c0:	00100613          	li	a2,1
800092c4:	00048593          	mv	a1,s1
800092c8:	00098513          	mv	a0,s3
800092cc:	941ff0ef          	jal	ra,80008c0c <dhcp_create_msg>
800092d0:	10050063          	beqz	a0,800093d0 <dhcp_discover+0x144>
800092d4:	00452403          	lw	s0,4(a0)
800092d8:	00e15783          	lhu	a5,14(sp)
800092dc:	00050913          	mv	s2,a0
800092e0:	0f040413          	addi	s0,s0,240
800092e4:	00f40733          	add	a4,s0,a5
800092e8:	00278513          	addi	a0,a5,2
800092ec:	00178793          	addi	a5,a5,1
800092f0:	01079793          	slli	a5,a5,0x10
800092f4:	03900693          	li	a3,57
800092f8:	0107d793          	srli	a5,a5,0x10
800092fc:	00d70023          	sb	a3,0(a4)
80009300:	00f407b3          	add	a5,s0,a5
80009304:	00200713          	li	a4,2
80009308:	00e78023          	sb	a4,0(a5)
8000930c:	02c9d603          	lhu	a2,44(s3)
80009310:	01051513          	slli	a0,a0,0x10
80009314:	01055513          	srli	a0,a0,0x10
80009318:	00040593          	mv	a1,s0
8000931c:	00a11723          	sh	a0,14(sp)
80009320:	85dff0ef          	jal	ra,80008b7c <dhcp_option_short>
80009324:	00a40733          	add	a4,s0,a0
80009328:	03700693          	li	a3,55
8000932c:	00d70023          	sb	a3,0(a4)
80009330:	00150713          	addi	a4,a0,1
80009334:	01071713          	slli	a4,a4,0x10
80009338:	01075713          	srli	a4,a4,0x10
8000933c:	00300613          	li	a2,3
80009340:	00e40733          	add	a4,s0,a4
80009344:	00c70023          	sb	a2,0(a4)
80009348:	00250713          	addi	a4,a0,2
8000934c:	01071713          	slli	a4,a4,0x10
80009350:	01075713          	srli	a4,a4,0x10
80009354:	00e40733          	add	a4,s0,a4
80009358:	00100693          	li	a3,1
8000935c:	00d70023          	sb	a3,0(a4)
80009360:	00050793          	mv	a5,a0
80009364:	00350693          	addi	a3,a0,3
80009368:	01069693          	slli	a3,a3,0x10
8000936c:	00478793          	addi	a5,a5,4
80009370:	0106d693          	srli	a3,a3,0x10
80009374:	01079793          	slli	a5,a5,0x10
80009378:	00d406b3          	add	a3,s0,a3
8000937c:	00550513          	addi	a0,a0,5
80009380:	0107d793          	srli	a5,a5,0x10
80009384:	00c68023          	sb	a2,0(a3)
80009388:	00f407b3          	add	a5,s0,a5
8000938c:	01c00713          	li	a4,28
80009390:	01051513          	slli	a0,a0,0x10
80009394:	00e78023          	sb	a4,0(a5)
80009398:	01055513          	srli	a0,a0,0x10
8000939c:	00090613          	mv	a2,s2
800093a0:	00040593          	mv	a1,s0
800093a4:	00a11723          	sh	a0,14(sp)
800093a8:	a09ff0ef          	jal	ra,80008db0 <dhcp_option_trailer>
800093ac:	8ec1a503          	lw	a0,-1812(gp) # 80003084 <dhcp_pcb>
800093b0:	84818793          	addi	a5,gp,-1976 # 80002fe0 <ip_addr_any>
800093b4:	00098713          	mv	a4,s3
800093b8:	04300693          	li	a3,67
800093bc:	84418613          	addi	a2,gp,-1980 # 80002fdc <ip_addr_broadcast>
800093c0:	00090593          	mv	a1,s2
800093c4:	abcff0ef          	jal	ra,80008680 <udp_sendto_if_src>
800093c8:	00090513          	mv	a0,s2
800093cc:	b09fd0ef          	jal	ra,80006ed4 <pbuf_free>
800093d0:	0064c783          	lbu	a5,6(s1)
800093d4:	0ff00713          	li	a4,255
800093d8:	00e78663          	beq	a5,a4,800093e4 <dhcp_discover+0x158>
800093dc:	00178793          	addi	a5,a5,1
800093e0:	00f48323          	sb	a5,6(s1)
800093e4:	0064c783          	lbu	a5,6(s1)
800093e8:	00500713          	li	a4,5
800093ec:	04f76c63          	bltu	a4,a5,80009444 <dhcp_discover+0x1b8>
800093f0:	00100513          	li	a0,1
800093f4:	00f51533          	sll	a0,a0,a5
800093f8:	00551793          	slli	a5,a0,0x5
800093fc:	40a787b3          	sub	a5,a5,a0
80009400:	00279793          	slli	a5,a5,0x2
80009404:	00f50533          	add	a0,a0,a5
80009408:	00351513          	slli	a0,a0,0x3
8000940c:	01051513          	slli	a0,a0,0x10
80009410:	01055513          	srli	a0,a0,0x10
80009414:	1f400593          	li	a1,500
80009418:	1f350513          	addi	a0,a0,499
8000941c:	625030ef          	jal	ra,8000d240 <__divsi3>
80009420:	00a49423          	sh	a0,8(s1)
80009424:	02c12083          	lw	ra,44(sp)
80009428:	02812403          	lw	s0,40(sp)
8000942c:	02412483          	lw	s1,36(sp)
80009430:	02012903          	lw	s2,32(sp)
80009434:	01c12983          	lw	s3,28(sp)
80009438:	00000513          	li	a0,0
8000943c:	03010113          	addi	sp,sp,48
80009440:	00008067          	ret
80009444:	0000f537          	lui	a0,0xf
80009448:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
8000944c:	fc9ff06f          	j	80009414 <dhcp_discover+0x188>

80009450 <dhcp_check>:
80009450:	ff010113          	addi	sp,sp,-16
80009454:	00112623          	sw	ra,12(sp)
80009458:	00912223          	sw	s1,4(sp)
8000945c:	00812423          	sw	s0,8(sp)
80009460:	02852403          	lw	s0,40(a0)
80009464:	00050493          	mv	s1,a0
80009468:	00800593          	li	a1,8
8000946c:	00040513          	mv	a0,s0
80009470:	ef4ff0ef          	jal	ra,80008b64 <dhcp_set_state>
80009474:	00000613          	li	a2,0
80009478:	01c40593          	addi	a1,s0,28
8000947c:	00048513          	mv	a0,s1
80009480:	4b5010ef          	jal	ra,8000b134 <etharp_query>
80009484:	00644783          	lbu	a5,6(s0)
80009488:	0ff00713          	li	a4,255
8000948c:	00e78663          	beq	a5,a4,80009498 <dhcp_check+0x48>
80009490:	00178793          	addi	a5,a5,1
80009494:	00f40323          	sb	a5,6(s0)
80009498:	00100793          	li	a5,1
8000949c:	00f41423          	sh	a5,8(s0)
800094a0:	00c12083          	lw	ra,12(sp)
800094a4:	00812403          	lw	s0,8(sp)
800094a8:	00412483          	lw	s1,4(sp)
800094ac:	01010113          	addi	sp,sp,16
800094b0:	00008067          	ret

800094b4 <dhcp_bind>:
800094b4:	1a050863          	beqz	a0,80009664 <dhcp_bind+0x1b0>
800094b8:	fe010113          	addi	sp,sp,-32
800094bc:	00112e23          	sw	ra,28(sp)
800094c0:	00812c23          	sw	s0,24(sp)
800094c4:	00912a23          	sw	s1,20(sp)
800094c8:	02852403          	lw	s0,40(a0)
800094cc:	10040a63          	beqz	s0,800095e0 <dhcp_bind+0x12c>
800094d0:	00050493          	mv	s1,a0
800094d4:	02842503          	lw	a0,40(s0)
800094d8:	00041923          	sh	zero,18(s0)
800094dc:	fff00793          	li	a5,-1
800094e0:	02f50463          	beq	a0,a5,80009508 <dhcp_bind+0x54>
800094e4:	01e50513          	addi	a0,a0,30
800094e8:	003c07b7          	lui	a5,0x3c0
800094ec:	10f57463          	bgeu	a0,a5,800095f4 <dhcp_bind+0x140>
800094f0:	03c00593          	li	a1,60
800094f4:	555030ef          	jal	ra,8000d248 <__udivsi3>
800094f8:	01051793          	slli	a5,a0,0x10
800094fc:	0107d793          	srli	a5,a5,0x10
80009500:	10050063          	beqz	a0,80009600 <dhcp_bind+0x14c>
80009504:	00f41a23          	sh	a5,20(s0)
80009508:	02c42503          	lw	a0,44(s0)
8000950c:	fff00793          	li	a5,-1
80009510:	02f50863          	beq	a0,a5,80009540 <dhcp_bind+0x8c>
80009514:	01e50513          	addi	a0,a0,30
80009518:	003c07b7          	lui	a5,0x3c0
8000951c:	0ef57663          	bgeu	a0,a5,80009608 <dhcp_bind+0x154>
80009520:	03c00593          	li	a1,60
80009524:	525030ef          	jal	ra,8000d248 <__udivsi3>
80009528:	01051793          	slli	a5,a0,0x10
8000952c:	0107d793          	srli	a5,a5,0x10
80009530:	0e050263          	beqz	a0,80009614 <dhcp_bind+0x160>
80009534:	00f41523          	sh	a5,10(s0)
80009538:	00a45783          	lhu	a5,10(s0)
8000953c:	00f41723          	sh	a5,14(s0)
80009540:	03042503          	lw	a0,48(s0)
80009544:	fff00793          	li	a5,-1
80009548:	02f50863          	beq	a0,a5,80009578 <dhcp_bind+0xc4>
8000954c:	01e50513          	addi	a0,a0,30
80009550:	003c07b7          	lui	a5,0x3c0
80009554:	0cf57463          	bgeu	a0,a5,8000961c <dhcp_bind+0x168>
80009558:	03c00593          	li	a1,60
8000955c:	4ed030ef          	jal	ra,8000d248 <__udivsi3>
80009560:	01051793          	slli	a5,a0,0x10
80009564:	0107d793          	srli	a5,a5,0x10
80009568:	0c050063          	beqz	a0,80009628 <dhcp_bind+0x174>
8000956c:	00f41623          	sh	a5,12(s0)
80009570:	00c45783          	lhu	a5,12(s0)
80009574:	00f41823          	sh	a5,16(s0)
80009578:	00c45783          	lhu	a5,12(s0)
8000957c:	00a45703          	lhu	a4,10(s0)
80009580:	00f76663          	bltu	a4,a5,8000958c <dhcp_bind+0xd8>
80009584:	00078463          	beqz	a5,8000958c <dhcp_bind+0xd8>
80009588:	00041523          	sh	zero,10(s0)
8000958c:	00744783          	lbu	a5,7(s0)
80009590:	0a078063          	beqz	a5,80009630 <dhcp_bind+0x17c>
80009594:	02042783          	lw	a5,32(s0)
80009598:	00f12423          	sw	a5,8(sp)
8000959c:	02442783          	lw	a5,36(s0)
800095a0:	00f12623          	sw	a5,12(sp)
800095a4:	00079e63          	bnez	a5,800095c0 <dhcp_bind+0x10c>
800095a8:	00812703          	lw	a4,8(sp)
800095ac:	01c42783          	lw	a5,28(s0)
800095b0:	00e7f7b3          	and	a5,a5,a4
800095b4:	01000737          	lui	a4,0x1000
800095b8:	00e7e7b3          	or	a5,a5,a4
800095bc:	00f12623          	sw	a5,12(sp)
800095c0:	00a00593          	li	a1,10
800095c4:	00040513          	mv	a0,s0
800095c8:	d9cff0ef          	jal	ra,80008b64 <dhcp_set_state>
800095cc:	00c10693          	addi	a3,sp,12
800095d0:	00810613          	addi	a2,sp,8
800095d4:	01c40593          	addi	a1,s0,28
800095d8:	00048513          	mv	a0,s1
800095dc:	9c0fd0ef          	jal	ra,8000679c <netif_set_addr>
800095e0:	01c12083          	lw	ra,28(sp)
800095e4:	01812403          	lw	s0,24(sp)
800095e8:	01412483          	lw	s1,20(sp)
800095ec:	02010113          	addi	sp,sp,32
800095f0:	00008067          	ret
800095f4:	000107b7          	lui	a5,0x10
800095f8:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
800095fc:	f09ff06f          	j	80009504 <dhcp_bind+0x50>
80009600:	00100793          	li	a5,1
80009604:	f01ff06f          	j	80009504 <dhcp_bind+0x50>
80009608:	000107b7          	lui	a5,0x10
8000960c:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80009610:	f25ff06f          	j	80009534 <dhcp_bind+0x80>
80009614:	00100793          	li	a5,1
80009618:	f1dff06f          	j	80009534 <dhcp_bind+0x80>
8000961c:	000107b7          	lui	a5,0x10
80009620:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80009624:	f49ff06f          	j	8000956c <dhcp_bind+0xb8>
80009628:	00100793          	li	a5,1
8000962c:	f41ff06f          	j	8000956c <dhcp_bind+0xb8>
80009630:	01c44783          	lbu	a5,28(s0)
80009634:	01879713          	slli	a4,a5,0x18
80009638:	41875713          	srai	a4,a4,0x18
8000963c:	00074663          	bltz	a4,80009648 <dhcp_bind+0x194>
80009640:	0ff00793          	li	a5,255
80009644:	f55ff06f          	j	80009598 <dhcp_bind+0xe4>
80009648:	0bf00713          	li	a4,191
8000964c:	00f77863          	bgeu	a4,a5,8000965c <dhcp_bind+0x1a8>
80009650:	010007b7          	lui	a5,0x1000
80009654:	fff78793          	addi	a5,a5,-1 # ffffff <_stack_size+0xfff7ff>
80009658:	f41ff06f          	j	80009598 <dhcp_bind+0xe4>
8000965c:	000107b7          	lui	a5,0x10
80009660:	ff5ff06f          	j	80009654 <dhcp_bind+0x1a0>
80009664:	00008067          	ret

80009668 <dhcp_inc_pcb_refcount>:
80009668:	ff010113          	addi	sp,sp,-16
8000966c:	00812423          	sw	s0,8(sp)
80009670:	8e81c783          	lbu	a5,-1816(gp) # 80003080 <dhcp_pcb_refcount>
80009674:	00112623          	sw	ra,12(sp)
80009678:	00912223          	sw	s1,4(sp)
8000967c:	01212023          	sw	s2,0(sp)
80009680:	04079863          	bnez	a5,800096d0 <dhcp_inc_pcb_refcount+0x68>
80009684:	c4cff0ef          	jal	ra,80008ad0 <udp_new>
80009688:	8ea1a623          	sw	a0,-1812(gp) # 80003084 <dhcp_pcb>
8000968c:	fff00713          	li	a4,-1
80009690:	04050863          	beqz	a0,800096e0 <dhcp_inc_pcb_refcount+0x78>
80009694:	00954703          	lbu	a4,9(a0)
80009698:	04400613          	li	a2,68
8000969c:	02076713          	ori	a4,a4,32
800096a0:	00e504a3          	sb	a4,9(a0)
800096a4:	84818593          	addi	a1,gp,-1976 # 80002fe0 <ip_addr_any>
800096a8:	ee9fe0ef          	jal	ra,80008590 <udp_bind>
800096ac:	8ec1a503          	lw	a0,-1812(gp) # 80003084 <dhcp_pcb>
800096b0:	04300613          	li	a2,67
800096b4:	84818593          	addi	a1,gp,-1976 # 80002fe0 <ip_addr_any>
800096b8:	af8ff0ef          	jal	ra,800089b0 <udp_connect>
800096bc:	8ec1a503          	lw	a0,-1812(gp) # 80003084 <dhcp_pcb>
800096c0:	8000a5b7          	lui	a1,0x8000a
800096c4:	00000613          	li	a2,0
800096c8:	82858593          	addi	a1,a1,-2008 # 80009828 <_ram_heap_end+0xffff7828>
800096cc:	bb0ff0ef          	jal	ra,80008a7c <udp_recv>
800096d0:	8e81c783          	lbu	a5,-1816(gp) # 80003080 <dhcp_pcb_refcount>
800096d4:	00000713          	li	a4,0
800096d8:	00178793          	addi	a5,a5,1 # 10001 <_stack_size+0xf801>
800096dc:	8ef18423          	sb	a5,-1816(gp) # 80003080 <dhcp_pcb_refcount>
800096e0:	00c12083          	lw	ra,12(sp)
800096e4:	00812403          	lw	s0,8(sp)
800096e8:	00412483          	lw	s1,4(sp)
800096ec:	00012903          	lw	s2,0(sp)
800096f0:	00070513          	mv	a0,a4
800096f4:	01010113          	addi	sp,sp,16
800096f8:	00008067          	ret

800096fc <dhcp_handle_ack.isra.0>:
800096fc:	ff010113          	addi	sp,sp,-16
80009700:	00912223          	sw	s1,4(sp)
80009704:	00812423          	sw	s0,8(sp)
80009708:	00112623          	sw	ra,12(sp)
8000970c:	8f018793          	addi	a5,gp,-1808 # 80003088 <dhcp_rx_options_given>
80009710:	0037c783          	lbu	a5,3(a5)
80009714:	02052023          	sw	zero,32(a0)
80009718:	02052223          	sw	zero,36(a0)
8000971c:	00050413          	mv	s0,a0
80009720:	8f018493          	addi	s1,gp,-1808 # 80003088 <dhcp_rx_options_given>
80009724:	00078663          	beqz	a5,80009730 <dhcp_handle_ack.isra.0+0x34>
80009728:	b381a783          	lw	a5,-1224(gp) # 800032d0 <dhcp_rx_options_val+0xc>
8000972c:	02f52423          	sw	a5,40(a0)
80009730:	0044c783          	lbu	a5,4(s1)
80009734:	08078663          	beqz	a5,800097c0 <dhcp_handle_ack.isra.0+0xc4>
80009738:	b3c1a783          	lw	a5,-1220(gp) # 800032d4 <dhcp_rx_options_val+0x10>
8000973c:	02f42623          	sw	a5,44(s0)
80009740:	0054c783          	lbu	a5,5(s1)
80009744:	08078463          	beqz	a5,800097cc <dhcp_handle_ack.isra.0+0xd0>
80009748:	b401a783          	lw	a5,-1216(gp) # 800032d8 <dhcp_rx_options_val+0x14>
8000974c:	02f42823          	sw	a5,48(s0)
80009750:	0115c703          	lbu	a4,17(a1)
80009754:	0105c783          	lbu	a5,16(a1)
80009758:	00871713          	slli	a4,a4,0x8
8000975c:	00f76733          	or	a4,a4,a5
80009760:	0125c783          	lbu	a5,18(a1)
80009764:	01079793          	slli	a5,a5,0x10
80009768:	00e7e733          	or	a4,a5,a4
8000976c:	0135c783          	lbu	a5,19(a1)
80009770:	01879793          	slli	a5,a5,0x18
80009774:	00e7e7b3          	or	a5,a5,a4
80009778:	00f42e23          	sw	a5,28(s0)
8000977c:	0064c783          	lbu	a5,6(s1)
80009780:	06078063          	beqz	a5,800097e0 <dhcp_handle_ack.isra.0+0xe4>
80009784:	b441a503          	lw	a0,-1212(gp) # 800032dc <dhcp_rx_options_val+0x18>
80009788:	d40fc0ef          	jal	ra,80005cc8 <lwip_htonl>
8000978c:	00100793          	li	a5,1
80009790:	02a42023          	sw	a0,32(s0)
80009794:	00f403a3          	sb	a5,7(s0)
80009798:	0074c783          	lbu	a5,7(s1)
8000979c:	00078863          	beqz	a5,800097ac <dhcp_handle_ack.isra.0+0xb0>
800097a0:	b481a503          	lw	a0,-1208(gp) # 800032e0 <dhcp_rx_options_val+0x1c>
800097a4:	d24fc0ef          	jal	ra,80005cc8 <lwip_htonl>
800097a8:	02a42223          	sw	a0,36(s0)
800097ac:	00c12083          	lw	ra,12(sp)
800097b0:	00812403          	lw	s0,8(sp)
800097b4:	00412483          	lw	s1,4(sp)
800097b8:	01010113          	addi	sp,sp,16
800097bc:	00008067          	ret
800097c0:	02842783          	lw	a5,40(s0)
800097c4:	0017d793          	srli	a5,a5,0x1
800097c8:	f75ff06f          	j	8000973c <dhcp_handle_ack.isra.0+0x40>
800097cc:	02842703          	lw	a4,40(s0)
800097d0:	00371793          	slli	a5,a4,0x3
800097d4:	40e787b3          	sub	a5,a5,a4
800097d8:	0037d793          	srli	a5,a5,0x3
800097dc:	f71ff06f          	j	8000974c <dhcp_handle_ack.isra.0+0x50>
800097e0:	000403a3          	sb	zero,7(s0)
800097e4:	fb5ff06f          	j	80009798 <dhcp_handle_ack.isra.0+0x9c>

800097e8 <dhcp_dec_pcb_refcount>:
800097e8:	8e81c783          	lbu	a5,-1816(gp) # 80003080 <dhcp_pcb_refcount>
800097ec:	fff78793          	addi	a5,a5,-1
800097f0:	0ff7f793          	andi	a5,a5,255
800097f4:	8ef18423          	sb	a5,-1816(gp) # 80003080 <dhcp_pcb_refcount>
800097f8:	02079663          	bnez	a5,80009824 <dhcp_dec_pcb_refcount+0x3c>
800097fc:	ff010113          	addi	sp,sp,-16
80009800:	00812423          	sw	s0,8(sp)
80009804:	8ec1a503          	lw	a0,-1812(gp) # 80003084 <dhcp_pcb>
80009808:	00112623          	sw	ra,12(sp)
8000980c:	a80ff0ef          	jal	ra,80008a8c <udp_remove>
80009810:	00c12083          	lw	ra,12(sp)
80009814:	8e01a623          	sw	zero,-1812(gp) # 80003084 <dhcp_pcb>
80009818:	00812403          	lw	s0,8(sp)
8000981c:	01010113          	addi	sp,sp,16
80009820:	00008067          	ret
80009824:	00008067          	ret

80009828 <dhcp_recv>:
80009828:	fa010113          	addi	sp,sp,-96
8000982c:	05212823          	sw	s2,80(sp)
80009830:	9f81a903          	lw	s2,-1544(gp) # 80003190 <ip_data+0x4>
80009834:	05312623          	sw	s3,76(sp)
80009838:	04112e23          	sw	ra,92(sp)
8000983c:	04812c23          	sw	s0,88(sp)
80009840:	04912a23          	sw	s1,84(sp)
80009844:	05412423          	sw	s4,72(sp)
80009848:	05512223          	sw	s5,68(sp)
8000984c:	05612023          	sw	s6,64(sp)
80009850:	03712e23          	sw	s7,60(sp)
80009854:	03812c23          	sw	s8,56(sp)
80009858:	03912a23          	sw	s9,52(sp)
8000985c:	03a12823          	sw	s10,48(sp)
80009860:	03b12623          	sw	s11,44(sp)
80009864:	02892b83          	lw	s7,40(s2)
80009868:	00060993          	mv	s3,a2
8000986c:	0e0b8663          	beqz	s7,80009958 <dhcp_recv+0x130>
80009870:	004bc783          	lbu	a5,4(s7)
80009874:	0e078263          	beqz	a5,80009958 <dhcp_recv+0x130>
80009878:	00a65703          	lhu	a4,10(a2)
8000987c:	02b00793          	li	a5,43
80009880:	0ce7fc63          	bgeu	a5,a4,80009958 <dhcp_recv+0x130>
80009884:	00462783          	lw	a5,4(a2)
80009888:	00200713          	li	a4,2
8000988c:	0007c683          	lbu	a3,0(a5)
80009890:	0ce69463          	bne	a3,a4,80009958 <dhcp_recv+0x130>
80009894:	03494603          	lbu	a2,52(s2)
80009898:	00000713          	li	a4,0
8000989c:	00600693          	li	a3,6
800098a0:	0ff77593          	andi	a1,a4,255
800098a4:	00c5f463          	bgeu	a1,a2,800098ac <dhcp_recv+0x84>
800098a8:	08d71c63          	bne	a4,a3,80009940 <dhcp_recv+0x118>
800098ac:	0057c503          	lbu	a0,5(a5)
800098b0:	0047c703          	lbu	a4,4(a5)
800098b4:	00851513          	slli	a0,a0,0x8
800098b8:	00e56533          	or	a0,a0,a4
800098bc:	0067c703          	lbu	a4,6(a5)
800098c0:	01071713          	slli	a4,a4,0x10
800098c4:	00a76733          	or	a4,a4,a0
800098c8:	0077c503          	lbu	a0,7(a5)
800098cc:	01851513          	slli	a0,a0,0x18
800098d0:	00e56533          	or	a0,a0,a4
800098d4:	bf4fc0ef          	jal	ra,80005cc8 <lwip_htonl>
800098d8:	000ba783          	lw	a5,0(s7)
800098dc:	06f51e63          	bne	a0,a5,80009958 <dhcp_recv+0x130>
800098e0:	8f018793          	addi	a5,gp,-1808 # 80003088 <dhcp_rx_options_given>
800098e4:	0007a223          	sw	zero,4(a5)
800098e8:	00a9d703          	lhu	a4,10(s3)
800098ec:	0007a023          	sw	zero,0(a5)
800098f0:	02b00793          	li	a5,43
800098f4:	8f018813          	addi	a6,gp,-1808 # 80003088 <dhcp_rx_options_given>
800098f8:	06e7f063          	bgeu	a5,a4,80009958 <dhcp_recv+0x130>
800098fc:	00010ab7          	lui	s5,0x10
80009900:	ffda8793          	addi	a5,s5,-3 # fffd <_stack_size+0xf7fd>
80009904:	0089dd83          	lhu	s11,8(s3)
80009908:	00f12423          	sw	a5,8(sp)
8000990c:	b2c18793          	addi	a5,gp,-1236 # 800032c4 <dhcp_rx_options_val>
80009910:	00000b13          	li	s6,0
80009914:	0f000d13          	li	s10,240
80009918:	00f12223          	sw	a5,4(sp)
8000991c:	00098c13          	mv	s8,s3
80009920:	00ac5783          	lhu	a5,10(s8)
80009924:	06fd7c63          	bgeu	s10,a5,8000999c <dhcp_recv+0x174>
80009928:	004c2783          	lw	a5,4(s8)
8000992c:	000d0413          	mv	s0,s10
80009930:	00400a93          	li	s5,4
80009934:	00f12023          	sw	a5,0(sp)
80009938:	00100a13          	li	s4,1
8000993c:	25c0006f          	j	80009b98 <dhcp_recv+0x370>
80009940:	00e905b3          	add	a1,s2,a4
80009944:	00170713          	addi	a4,a4,1 # 1000001 <_stack_size+0xfff801>
80009948:	00e78533          	add	a0,a5,a4
8000994c:	02e5c583          	lbu	a1,46(a1)
80009950:	01b54503          	lbu	a0,27(a0)
80009954:	f4b506e3          	beq	a0,a1,800098a0 <dhcp_recv+0x78>
80009958:	00098513          	mv	a0,s3
8000995c:	d78fd0ef          	jal	ra,80006ed4 <pbuf_free>
80009960:	05c12083          	lw	ra,92(sp)
80009964:	05812403          	lw	s0,88(sp)
80009968:	05412483          	lw	s1,84(sp)
8000996c:	05012903          	lw	s2,80(sp)
80009970:	04c12983          	lw	s3,76(sp)
80009974:	04812a03          	lw	s4,72(sp)
80009978:	04412a83          	lw	s5,68(sp)
8000997c:	04012b03          	lw	s6,64(sp)
80009980:	03c12b83          	lw	s7,60(sp)
80009984:	03812c03          	lw	s8,56(sp)
80009988:	03412c83          	lw	s9,52(sp)
8000998c:	03012d03          	lw	s10,48(sp)
80009990:	02c12d83          	lw	s11,44(sp)
80009994:	06010113          	addi	sp,sp,96
80009998:	00008067          	ret
8000999c:	000c2c03          	lw	s8,0(s8)
800099a0:	40fd0d33          	sub	s10,s10,a5
800099a4:	40fd8db3          	sub	s11,s11,a5
800099a8:	010d1d13          	slli	s10,s10,0x10
800099ac:	010d9d93          	slli	s11,s11,0x10
800099b0:	010d5d13          	srli	s10,s10,0x10
800099b4:	010ddd93          	srli	s11,s11,0x10
800099b8:	f60c14e3          	bnez	s8,80009920 <dhcp_recv+0xf8>
800099bc:	f9dff06f          	j	80009958 <dhcp_recv+0x130>
800099c0:	00240693          	addi	a3,s0,2
800099c4:	01069693          	slli	a3,a3,0x10
800099c8:	0106d693          	srli	a3,a3,0x10
800099cc:	f886e6e3          	bltu	a3,s0,80009958 <dhcp_recv+0x130>
800099d0:	00ac5583          	lhu	a1,10(s8)
800099d4:	00140613          	addi	a2,s0,1
800099d8:	02b65c63          	bge	a2,a1,80009a10 <dhcp_recv+0x1e8>
800099dc:	00174703          	lbu	a4,1(a4)
800099e0:	03400593          	li	a1,52
800099e4:	12b78263          	beq	a5,a1,80009b08 <dhcp_recv+0x2e0>
800099e8:	02f5ee63          	bltu	a1,a5,80009a24 <dhcp_recv+0x1fc>
800099ec:	07478263          	beq	a5,s4,80009a50 <dhcp_recv+0x228>
800099f0:	16078663          	beqz	a5,80009b5c <dhcp_recv+0x334>
800099f4:	00300613          	li	a2,3
800099f8:	0ec78663          	beq	a5,a2,80009ae4 <dhcp_recv+0x2bc>
800099fc:	03300613          	li	a2,51
80009a00:	0ec78a63          	beq	a5,a2,80009af4 <dhcp_recv+0x2cc>
80009a04:	fff00493          	li	s1,-1
80009a08:	00000c93          	li	s9,0
80009a0c:	0500006f          	j	80009a5c <dhcp_recv+0x234>
80009a10:	000c2703          	lw	a4,0(s8)
80009a14:	32070263          	beqz	a4,80009d38 <dhcp_recv+0x510>
80009a18:	00472703          	lw	a4,4(a4)
80009a1c:	00074703          	lbu	a4,0(a4)
80009a20:	fc1ff06f          	j	800099e0 <dhcp_recv+0x1b8>
80009a24:	03600613          	li	a2,54
80009a28:	10c78863          	beq	a5,a2,80009b38 <dhcp_recv+0x310>
80009a2c:	0ec7ec63          	bltu	a5,a2,80009b24 <dhcp_recv+0x2fc>
80009a30:	03a00613          	li	a2,58
80009a34:	10c78c63          	beq	a5,a2,80009b4c <dhcp_recv+0x324>
80009a38:	03b00613          	li	a2,59
80009a3c:	fcc794e3          	bne	a5,a2,80009a04 <dhcp_recv+0x1dc>
80009a40:	f1571ce3          	bne	a4,s5,80009958 <dhcp_recv+0x130>
80009a44:	00400c93          	li	s9,4
80009a48:	00500493          	li	s1,5
80009a4c:	0100006f          	j	80009a5c <dhcp_recv+0x234>
80009a50:	f15714e3          	bne	a4,s5,80009958 <dhcp_recv+0x130>
80009a54:	00400c93          	li	s9,4
80009a58:	00600493          	li	s1,6
80009a5c:	00812783          	lw	a5,8(sp)
80009a60:	00870433          	add	s0,a4,s0
80009a64:	ee87cae3          	blt	a5,s0,80009958 <dhcp_recv+0x130>
80009a68:	00e68733          	add	a4,a3,a4
80009a6c:	01071413          	slli	s0,a4,0x10
80009a70:	01045413          	srli	s0,s0,0x10
80009a74:	0e0c8863          	beqz	s9,80009b64 <dhcp_recv+0x33c>
80009a78:	009807b3          	add	a5,a6,s1
80009a7c:	0007c783          	lbu	a5,0(a5)
80009a80:	00012e23          	sw	zero,28(sp)
80009a84:	0e079063          	bnez	a5,80009b64 <dhcp_recv+0x33c>
80009a88:	010c9793          	slli	a5,s9,0x10
80009a8c:	0107d793          	srli	a5,a5,0x10
80009a90:	00078613          	mv	a2,a5
80009a94:	01c10593          	addi	a1,sp,28
80009a98:	000c0513          	mv	a0,s8
80009a9c:	00f12623          	sw	a5,12(sp)
80009aa0:	a19fd0ef          	jal	ra,800074b8 <pbuf_copy_partial>
80009aa4:	00c12783          	lw	a5,12(sp)
80009aa8:	eaa798e3          	bne	a5,a0,80009958 <dhcp_recv+0x130>
80009aac:	8f018813          	addi	a6,gp,-1808 # 80003088 <dhcp_rx_options_given>
80009ab0:	155c9a63          	bne	s9,s5,80009c04 <dhcp_recv+0x3dc>
80009ab4:	01c12503          	lw	a0,28(sp)
80009ab8:	a10fc0ef          	jal	ra,80005cc8 <lwip_htonl>
80009abc:	00a12e23          	sw	a0,28(sp)
80009ac0:	8f018813          	addi	a6,gp,-1808 # 80003088 <dhcp_rx_options_given>
80009ac4:	009807b3          	add	a5,a6,s1
80009ac8:	01478023          	sb	s4,0(a5)
80009acc:	00412783          	lw	a5,4(sp)
80009ad0:	00249493          	slli	s1,s1,0x2
80009ad4:	009784b3          	add	s1,a5,s1
80009ad8:	01c12783          	lw	a5,28(sp)
80009adc:	00f4a023          	sw	a5,0(s1)
80009ae0:	0840006f          	j	80009b64 <dhcp_recv+0x33c>
80009ae4:	e6e7fae3          	bgeu	a5,a4,80009958 <dhcp_recv+0x130>
80009ae8:	00700493          	li	s1,7
80009aec:	00400c93          	li	s9,4
80009af0:	f6dff06f          	j	80009a5c <dhcp_recv+0x234>
80009af4:	e75712e3          	bne	a4,s5,80009958 <dhcp_recv+0x130>
80009af8:	00400c93          	li	s9,4
80009afc:	00300493          	li	s1,3
80009b00:	f5dff06f          	j	80009a5c <dhcp_recv+0x234>
80009b04:	00000713          	li	a4,0
80009b08:	e54718e3          	bne	a4,s4,80009958 <dhcp_recv+0x130>
80009b0c:	0f000793          	li	a5,240
80009b10:	e4fd14e3          	bne	s10,a5,80009958 <dhcp_recv+0x130>
80009b14:	00100c93          	li	s9,1
80009b18:	00000493          	li	s1,0
80009b1c:	f41ff06f          	j	80009a5c <dhcp_recv+0x234>
80009b20:	00000713          	li	a4,0
80009b24:	e3471ae3          	bne	a4,s4,80009958 <dhcp_recv+0x130>
80009b28:	00100c93          	li	s9,1
80009b2c:	00100493          	li	s1,1
80009b30:	f2dff06f          	j	80009a5c <dhcp_recv+0x234>
80009b34:	00000713          	li	a4,0
80009b38:	e35710e3          	bne	a4,s5,80009958 <dhcp_recv+0x130>
80009b3c:	00400c93          	li	s9,4
80009b40:	00200493          	li	s1,2
80009b44:	f19ff06f          	j	80009a5c <dhcp_recv+0x234>
80009b48:	00000713          	li	a4,0
80009b4c:	e15716e3          	bne	a4,s5,80009958 <dhcp_recv+0x130>
80009b50:	00400c93          	li	s9,4
80009b54:	00400493          	li	s1,4
80009b58:	f05ff06f          	j	80009a5c <dhcp_recv+0x234>
80009b5c:	01061413          	slli	s0,a2,0x10
80009b60:	01045413          	srli	s0,s0,0x10
80009b64:	00ac5783          	lhu	a5,10(s8)
80009b68:	02f46863          	bltu	s0,a5,80009b98 <dhcp_recv+0x370>
80009b6c:	40f40433          	sub	s0,s0,a5
80009b70:	40fd8db3          	sub	s11,s11,a5
80009b74:	01041413          	slli	s0,s0,0x10
80009b78:	010d9d93          	slli	s11,s11,0x10
80009b7c:	01045413          	srli	s0,s0,0x10
80009b80:	010ddd93          	srli	s11,s11,0x10
80009b84:	ddb47ae3          	bgeu	s0,s11,80009958 <dhcp_recv+0x130>
80009b88:	000c2c03          	lw	s8,0(s8)
80009b8c:	dc0c06e3          	beqz	s8,80009958 <dhcp_recv+0x130>
80009b90:	004c2783          	lw	a5,4(s8)
80009b94:	00f12023          	sw	a5,0(sp)
80009b98:	01b47c63          	bgeu	s0,s11,80009bb0 <dhcp_recv+0x388>
80009b9c:	00012783          	lw	a5,0(sp)
80009ba0:	0ff00693          	li	a3,255
80009ba4:	00878733          	add	a4,a5,s0
80009ba8:	00074783          	lbu	a5,0(a4)
80009bac:	e0d79ae3          	bne	a5,a3,800099c0 <dhcp_recv+0x198>
80009bb0:	00084783          	lbu	a5,0(a6)
80009bb4:	06079063          	bnez	a5,80009c14 <dhcp_recv+0x3ec>
80009bb8:	060b1c63          	bnez	s6,80009c30 <dhcp_recv+0x408>
80009bbc:	00184783          	lbu	a5,1(a6)
80009bc0:	d8078ce3          	beqz	a5,80009958 <dhcp_recv+0x130>
80009bc4:	b2c18793          	addi	a5,gp,-1236 # 800032c4 <dhcp_rx_options_val>
80009bc8:	0047c703          	lbu	a4,4(a5)
80009bcc:	00500693          	li	a3,5
80009bd0:	0049a583          	lw	a1,4(s3)
80009bd4:	0ad71463          	bne	a4,a3,80009c7c <dhcp_recv+0x454>
80009bd8:	005bc783          	lbu	a5,5(s7)
80009bdc:	00100713          	li	a4,1
80009be0:	06e79c63          	bne	a5,a4,80009c58 <dhcp_recv+0x430>
80009be4:	02892503          	lw	a0,40(s2)
80009be8:	b15ff0ef          	jal	ra,800096fc <dhcp_handle_ack.isra.0>
80009bec:	03594783          	lbu	a5,53(s2)
80009bf0:	00090513          	mv	a0,s2
80009bf4:	0087f793          	andi	a5,a5,8
80009bf8:	06078e63          	beqz	a5,80009c74 <dhcp_recv+0x44c>
80009bfc:	855ff0ef          	jal	ra,80009450 <dhcp_check>
80009c00:	d59ff06f          	j	80009958 <dhcp_recv+0x130>
80009c04:	d54c9ae3          	bne	s9,s4,80009958 <dhcp_recv+0x130>
80009c08:	01c14783          	lbu	a5,28(sp)
80009c0c:	00f12e23          	sw	a5,28(sp)
80009c10:	eb5ff06f          	j	80009ac4 <dhcp_recv+0x29c>
80009c14:	00412783          	lw	a5,4(sp)
80009c18:	00080023          	sb	zero,0(a6)
80009c1c:	00100713          	li	a4,1
80009c20:	0007a783          	lw	a5,0(a5)
80009c24:	02e78463          	beq	a5,a4,80009c4c <dhcp_recv+0x424>
80009c28:	00200713          	li	a4,2
80009c2c:	00e79a63          	bne	a5,a4,80009c40 <dhcp_recv+0x418>
80009c30:	00000b13          	li	s6,0
80009c34:	06c00d93          	li	s11,108
80009c38:	02c00d13          	li	s10,44
80009c3c:	ce1ff06f          	j	8000991c <dhcp_recv+0xf4>
80009c40:	00300713          	li	a4,3
80009c44:	f6e79ae3          	bne	a5,a4,80009bb8 <dhcp_recv+0x390>
80009c48:	00100b13          	li	s6,1
80009c4c:	0ec00d93          	li	s11,236
80009c50:	06c00d13          	li	s10,108
80009c54:	cc9ff06f          	j	8000991c <dhcp_recv+0xf4>
80009c58:	ffd78793          	addi	a5,a5,-3
80009c5c:	0ff7f793          	andi	a5,a5,255
80009c60:	00200713          	li	a4,2
80009c64:	cef76ae3          	bltu	a4,a5,80009958 <dhcp_recv+0x130>
80009c68:	02892503          	lw	a0,40(s2)
80009c6c:	a91ff0ef          	jal	ra,800096fc <dhcp_handle_ack.isra.0>
80009c70:	00090513          	mv	a0,s2
80009c74:	841ff0ef          	jal	ra,800094b4 <dhcp_bind>
80009c78:	ce1ff06f          	j	80009958 <dhcp_recv+0x130>
80009c7c:	00600693          	li	a3,6
80009c80:	04d71663          	bne	a4,a3,80009ccc <dhcp_recv+0x4a4>
80009c84:	005bc703          	lbu	a4,5(s7)
80009c88:	00200693          	li	a3,2
80009c8c:	ffd70793          	addi	a5,a4,-3
80009c90:	0ff7f793          	andi	a5,a5,255
80009c94:	00f6f663          	bgeu	a3,a5,80009ca0 <dhcp_recv+0x478>
80009c98:	00100793          	li	a5,1
80009c9c:	caf71ee3          	bne	a4,a5,80009958 <dhcp_recv+0x130>
80009ca0:	02892503          	lw	a0,40(s2)
80009ca4:	00c00593          	li	a1,12
80009ca8:	ebdfe0ef          	jal	ra,80008b64 <dhcp_set_state>
80009cac:	84818693          	addi	a3,gp,-1976 # 80002fe0 <ip_addr_any>
80009cb0:	84818613          	addi	a2,gp,-1976 # 80002fe0 <ip_addr_any>
80009cb4:	00090513          	mv	a0,s2
80009cb8:	84818593          	addi	a1,gp,-1976 # 80002fe0 <ip_addr_any>
80009cbc:	ae1fc0ef          	jal	ra,8000679c <netif_set_addr>
80009cc0:	00090513          	mv	a0,s2
80009cc4:	dc8ff0ef          	jal	ra,8000928c <dhcp_discover>
80009cc8:	c91ff06f          	j	80009958 <dhcp_recv+0x130>
80009ccc:	00200613          	li	a2,2
80009cd0:	c8c714e3          	bne	a4,a2,80009958 <dhcp_recv+0x130>
80009cd4:	005bc703          	lbu	a4,5(s7)
80009cd8:	c8d710e3          	bne	a4,a3,80009958 <dhcp_recv+0x130>
80009cdc:	00284703          	lbu	a4,2(a6)
80009ce0:	c6070ce3          	beqz	a4,80009958 <dhcp_recv+0x130>
80009ce4:	02892403          	lw	s0,40(s2)
80009ce8:	00b12023          	sw	a1,0(sp)
80009cec:	00041423          	sh	zero,8(s0)
80009cf0:	0087a503          	lw	a0,8(a5)
80009cf4:	fd5fb0ef          	jal	ra,80005cc8 <lwip_htonl>
80009cf8:	00012583          	lw	a1,0(sp)
80009cfc:	00a42c23          	sw	a0,24(s0)
80009d00:	00090513          	mv	a0,s2
80009d04:	0115c703          	lbu	a4,17(a1)
80009d08:	0105c783          	lbu	a5,16(a1)
80009d0c:	00871713          	slli	a4,a4,0x8
80009d10:	00f76733          	or	a4,a4,a5
80009d14:	0125c783          	lbu	a5,18(a1)
80009d18:	01079793          	slli	a5,a5,0x10
80009d1c:	00e7e733          	or	a4,a5,a4
80009d20:	0135c783          	lbu	a5,19(a1)
80009d24:	01879793          	slli	a5,a5,0x18
80009d28:	00e7e7b3          	or	a5,a5,a4
80009d2c:	00f42e23          	sw	a5,28(s0)
80009d30:	ae0ff0ef          	jal	ra,80009010 <dhcp_select>
80009d34:	c25ff06f          	j	80009958 <dhcp_recv+0x130>
80009d38:	03400713          	li	a4,52
80009d3c:	dce784e3          	beq	a5,a4,80009b04 <dhcp_recv+0x2dc>
80009d40:	02f76263          	bltu	a4,a5,80009d64 <dhcp_recv+0x53c>
80009d44:	c1478ae3          	beq	a5,s4,80009958 <dhcp_recv+0x130>
80009d48:	e0078ae3          	beqz	a5,80009b5c <dhcp_recv+0x334>
80009d4c:	00300713          	li	a4,3
80009d50:	c0e784e3          	beq	a5,a4,80009958 <dhcp_recv+0x130>
80009d54:	03300713          	li	a4,51
80009d58:	c0e780e3          	beq	a5,a4,80009958 <dhcp_recv+0x130>
80009d5c:	00000713          	li	a4,0
80009d60:	ca5ff06f          	j	80009a04 <dhcp_recv+0x1dc>
80009d64:	03600713          	li	a4,54
80009d68:	dce786e3          	beq	a5,a4,80009b34 <dhcp_recv+0x30c>
80009d6c:	dae7eae3          	bltu	a5,a4,80009b20 <dhcp_recv+0x2f8>
80009d70:	03a00713          	li	a4,58
80009d74:	dce78ae3          	beq	a5,a4,80009b48 <dhcp_recv+0x320>
80009d78:	03b00613          	li	a2,59
80009d7c:	00000713          	li	a4,0
80009d80:	cbdff06f          	j	80009a3c <dhcp_recv+0x214>

80009d84 <dhcp_set_struct>:
80009d84:	ff010113          	addi	sp,sp,-16
80009d88:	00058793          	mv	a5,a1
80009d8c:	00812423          	sw	s0,8(sp)
80009d90:	03400613          	li	a2,52
80009d94:	00050413          	mv	s0,a0
80009d98:	00000593          	li	a1,0
80009d9c:	00078513          	mv	a0,a5
80009da0:	00112623          	sw	ra,12(sp)
80009da4:	595020ef          	jal	ra,8000cb38 <memset>
80009da8:	02a42423          	sw	a0,40(s0)
80009dac:	00c12083          	lw	ra,12(sp)
80009db0:	00812403          	lw	s0,8(sp)
80009db4:	01010113          	addi	sp,sp,16
80009db8:	00008067          	ret

80009dbc <dhcp_cleanup>:
80009dbc:	02852783          	lw	a5,40(a0)
80009dc0:	02078863          	beqz	a5,80009df0 <dhcp_cleanup+0x34>
80009dc4:	ff010113          	addi	sp,sp,-16
80009dc8:	00812423          	sw	s0,8(sp)
80009dcc:	00050413          	mv	s0,a0
80009dd0:	00078513          	mv	a0,a5
80009dd4:	00112623          	sw	ra,12(sp)
80009dd8:	f0cfc0ef          	jal	ra,800064e4 <lwip_free>
80009ddc:	02042423          	sw	zero,40(s0)
80009de0:	00c12083          	lw	ra,12(sp)
80009de4:	00812403          	lw	s0,8(sp)
80009de8:	01010113          	addi	sp,sp,16
80009dec:	00008067          	ret
80009df0:	00008067          	ret

80009df4 <dhcp_inform>:
80009df4:	0e050a63          	beqz	a0,80009ee8 <dhcp_inform+0xf4>
80009df8:	fb010113          	addi	sp,sp,-80
80009dfc:	04812423          	sw	s0,72(sp)
80009e00:	04112623          	sw	ra,76(sp)
80009e04:	04912223          	sw	s1,68(sp)
80009e08:	05212023          	sw	s2,64(sp)
80009e0c:	00050413          	mv	s0,a0
80009e10:	859ff0ef          	jal	ra,80009668 <dhcp_inc_pcb_refcount>
80009e14:	0a051e63          	bnez	a0,80009ed0 <dhcp_inform+0xdc>
80009e18:	03400613          	li	a2,52
80009e1c:	00000593          	li	a1,0
80009e20:	00c10513          	addi	a0,sp,12
80009e24:	515020ef          	jal	ra,8000cb38 <memset>
80009e28:	00700593          	li	a1,7
80009e2c:	00c10513          	addi	a0,sp,12
80009e30:	d35fe0ef          	jal	ra,80008b64 <dhcp_set_state>
80009e34:	00a10693          	addi	a3,sp,10
80009e38:	00800613          	li	a2,8
80009e3c:	00c10593          	addi	a1,sp,12
80009e40:	00040513          	mv	a0,s0
80009e44:	dc9fe0ef          	jal	ra,80008c0c <dhcp_create_msg>
80009e48:	00050913          	mv	s2,a0
80009e4c:	08050063          	beqz	a0,80009ecc <dhcp_inform+0xd8>
80009e50:	00452483          	lw	s1,4(a0)
80009e54:	00a15783          	lhu	a5,10(sp)
80009e58:	03900693          	li	a3,57
80009e5c:	0f048493          	addi	s1,s1,240
80009e60:	00f48733          	add	a4,s1,a5
80009e64:	00278513          	addi	a0,a5,2
80009e68:	00178793          	addi	a5,a5,1
80009e6c:	01079793          	slli	a5,a5,0x10
80009e70:	0107d793          	srli	a5,a5,0x10
80009e74:	00d70023          	sb	a3,0(a4)
80009e78:	00f487b3          	add	a5,s1,a5
80009e7c:	00200713          	li	a4,2
80009e80:	00e78023          	sb	a4,0(a5)
80009e84:	02c45603          	lhu	a2,44(s0)
80009e88:	01051513          	slli	a0,a0,0x10
80009e8c:	01055513          	srli	a0,a0,0x10
80009e90:	00048593          	mv	a1,s1
80009e94:	00a11523          	sh	a0,10(sp)
80009e98:	ce5fe0ef          	jal	ra,80008b7c <dhcp_option_short>
80009e9c:	00090613          	mv	a2,s2
80009ea0:	00048593          	mv	a1,s1
80009ea4:	00a11523          	sh	a0,10(sp)
80009ea8:	f09fe0ef          	jal	ra,80008db0 <dhcp_option_trailer>
80009eac:	8ec1a503          	lw	a0,-1812(gp) # 80003084 <dhcp_pcb>
80009eb0:	00040713          	mv	a4,s0
80009eb4:	04300693          	li	a3,67
80009eb8:	84418613          	addi	a2,gp,-1980 # 80002fdc <ip_addr_broadcast>
80009ebc:	00090593          	mv	a1,s2
80009ec0:	9b5fe0ef          	jal	ra,80008874 <udp_sendto_if>
80009ec4:	00090513          	mv	a0,s2
80009ec8:	80cfd0ef          	jal	ra,80006ed4 <pbuf_free>
80009ecc:	91dff0ef          	jal	ra,800097e8 <dhcp_dec_pcb_refcount>
80009ed0:	04c12083          	lw	ra,76(sp)
80009ed4:	04812403          	lw	s0,72(sp)
80009ed8:	04412483          	lw	s1,68(sp)
80009edc:	04012903          	lw	s2,64(sp)
80009ee0:	05010113          	addi	sp,sp,80
80009ee4:	00008067          	ret
80009ee8:	00008067          	ret

80009eec <dhcp_network_changed>:
80009eec:	02852783          	lw	a5,40(a0)
80009ef0:	02078a63          	beqz	a5,80009f24 <dhcp_network_changed+0x38>
80009ef4:	0057c703          	lbu	a4,5(a5)
80009ef8:	00500693          	li	a3,5
80009efc:	00e6ec63          	bltu	a3,a4,80009f14 <dhcp_network_changed+0x28>
80009f00:	00300693          	li	a3,3
80009f04:	00d77c63          	bgeu	a4,a3,80009f1c <dhcp_network_changed+0x30>
80009f08:	00070e63          	beqz	a4,80009f24 <dhcp_network_changed+0x38>
80009f0c:	00078323          	sb	zero,6(a5)
80009f10:	b7cff06f          	j	8000928c <dhcp_discover>
80009f14:	00a00693          	li	a3,10
80009f18:	fed71ae3          	bne	a4,a3,80009f0c <dhcp_network_changed+0x20>
80009f1c:	00078323          	sb	zero,6(a5)
80009f20:	ee1fe06f          	j	80008e00 <dhcp_reboot>
80009f24:	00008067          	ret

80009f28 <dhcp_arp_reply>:
80009f28:	12050a63          	beqz	a0,8000a05c <dhcp_arp_reply+0x134>
80009f2c:	fd010113          	addi	sp,sp,-48
80009f30:	02112623          	sw	ra,44(sp)
80009f34:	02812423          	sw	s0,40(sp)
80009f38:	02912223          	sw	s1,36(sp)
80009f3c:	03212023          	sw	s2,32(sp)
80009f40:	01312e23          	sw	s3,28(sp)
80009f44:	01412c23          	sw	s4,24(sp)
80009f48:	02852403          	lw	s0,40(a0)
80009f4c:	0e040863          	beqz	s0,8000a03c <dhcp_arp_reply+0x114>
80009f50:	00544703          	lbu	a4,5(s0)
80009f54:	00800793          	li	a5,8
80009f58:	0ef71263          	bne	a4,a5,8000a03c <dhcp_arp_reply+0x114>
80009f5c:	0005a703          	lw	a4,0(a1)
80009f60:	01c42783          	lw	a5,28(s0)
80009f64:	0cf71c63          	bne	a4,a5,8000a03c <dhcp_arp_reply+0x114>
80009f68:	00050a13          	mv	s4,a0
80009f6c:	00c00593          	li	a1,12
80009f70:	00040513          	mv	a0,s0
80009f74:	bf1fe0ef          	jal	ra,80008b64 <dhcp_set_state>
80009f78:	00e10693          	addi	a3,sp,14
80009f7c:	00400613          	li	a2,4
80009f80:	00040593          	mv	a1,s0
80009f84:	000a0513          	mv	a0,s4
80009f88:	c85fe0ef          	jal	ra,80008c0c <dhcp_create_msg>
80009f8c:	00050913          	mv	s2,a0
80009f90:	08050863          	beqz	a0,8000a020 <dhcp_arp_reply+0xf8>
80009f94:	00452483          	lw	s1,4(a0)
80009f98:	00e15783          	lhu	a5,14(sp)
80009f9c:	03200693          	li	a3,50
80009fa0:	0f048493          	addi	s1,s1,240
80009fa4:	00f48733          	add	a4,s1,a5
80009fa8:	00278993          	addi	s3,a5,2
80009fac:	00178793          	addi	a5,a5,1
80009fb0:	01079793          	slli	a5,a5,0x10
80009fb4:	0107d793          	srli	a5,a5,0x10
80009fb8:	00d70023          	sb	a3,0(a4)
80009fbc:	00f487b3          	add	a5,s1,a5
80009fc0:	00400713          	li	a4,4
80009fc4:	00e78023          	sb	a4,0(a5)
80009fc8:	01c42503          	lw	a0,28(s0)
80009fcc:	01099993          	slli	s3,s3,0x10
80009fd0:	0109d993          	srli	s3,s3,0x10
80009fd4:	01311723          	sh	s3,14(sp)
80009fd8:	cf1fb0ef          	jal	ra,80005cc8 <lwip_htonl>
80009fdc:	00050613          	mv	a2,a0
80009fe0:	00048593          	mv	a1,s1
80009fe4:	00098513          	mv	a0,s3
80009fe8:	bc5fe0ef          	jal	ra,80008bac <dhcp_option_long>
80009fec:	00090613          	mv	a2,s2
80009ff0:	00048593          	mv	a1,s1
80009ff4:	00a11723          	sh	a0,14(sp)
80009ff8:	db9fe0ef          	jal	ra,80008db0 <dhcp_option_trailer>
80009ffc:	8ec1a503          	lw	a0,-1812(gp) # 80003084 <dhcp_pcb>
8000a000:	84818793          	addi	a5,gp,-1976 # 80002fe0 <ip_addr_any>
8000a004:	000a0713          	mv	a4,s4
8000a008:	04300693          	li	a3,67
8000a00c:	84418613          	addi	a2,gp,-1980 # 80002fdc <ip_addr_broadcast>
8000a010:	00090593          	mv	a1,s2
8000a014:	e6cfe0ef          	jal	ra,80008680 <udp_sendto_if_src>
8000a018:	00090513          	mv	a0,s2
8000a01c:	eb9fc0ef          	jal	ra,80006ed4 <pbuf_free>
8000a020:	00644783          	lbu	a5,6(s0)
8000a024:	0ff00713          	li	a4,255
8000a028:	00e78663          	beq	a5,a4,8000a034 <dhcp_arp_reply+0x10c>
8000a02c:	00178793          	addi	a5,a5,1
8000a030:	00f40323          	sb	a5,6(s0)
8000a034:	01400793          	li	a5,20
8000a038:	00f41423          	sh	a5,8(s0)
8000a03c:	02c12083          	lw	ra,44(sp)
8000a040:	02812403          	lw	s0,40(sp)
8000a044:	02412483          	lw	s1,36(sp)
8000a048:	02012903          	lw	s2,32(sp)
8000a04c:	01c12983          	lw	s3,28(sp)
8000a050:	01812a03          	lw	s4,24(sp)
8000a054:	03010113          	addi	sp,sp,48
8000a058:	00008067          	ret
8000a05c:	00008067          	ret

8000a060 <dhcp_renew>:
8000a060:	fd010113          	addi	sp,sp,-48
8000a064:	02112623          	sw	ra,44(sp)
8000a068:	02812423          	sw	s0,40(sp)
8000a06c:	01312e23          	sw	s3,28(sp)
8000a070:	02912223          	sw	s1,36(sp)
8000a074:	03212023          	sw	s2,32(sp)
8000a078:	02852483          	lw	s1,40(a0)
8000a07c:	00050993          	mv	s3,a0
8000a080:	00500593          	li	a1,5
8000a084:	00048513          	mv	a0,s1
8000a088:	addfe0ef          	jal	ra,80008b64 <dhcp_set_state>
8000a08c:	00e10693          	addi	a3,sp,14
8000a090:	00300613          	li	a2,3
8000a094:	00048593          	mv	a1,s1
8000a098:	00098513          	mv	a0,s3
8000a09c:	b71fe0ef          	jal	ra,80008c0c <dhcp_create_msg>
8000a0a0:	fff00413          	li	s0,-1
8000a0a4:	10050063          	beqz	a0,8000a1a4 <dhcp_renew+0x144>
8000a0a8:	00452403          	lw	s0,4(a0)
8000a0ac:	00e15783          	lhu	a5,14(sp)
8000a0b0:	00050913          	mv	s2,a0
8000a0b4:	0f040413          	addi	s0,s0,240
8000a0b8:	00f40733          	add	a4,s0,a5
8000a0bc:	00278513          	addi	a0,a5,2
8000a0c0:	00178793          	addi	a5,a5,1
8000a0c4:	01079793          	slli	a5,a5,0x10
8000a0c8:	03900693          	li	a3,57
8000a0cc:	0107d793          	srli	a5,a5,0x10
8000a0d0:	00d70023          	sb	a3,0(a4)
8000a0d4:	00f407b3          	add	a5,s0,a5
8000a0d8:	00200713          	li	a4,2
8000a0dc:	00e78023          	sb	a4,0(a5)
8000a0e0:	02c9d603          	lhu	a2,44(s3)
8000a0e4:	01051513          	slli	a0,a0,0x10
8000a0e8:	00040593          	mv	a1,s0
8000a0ec:	01055513          	srli	a0,a0,0x10
8000a0f0:	00a11723          	sh	a0,14(sp)
8000a0f4:	a89fe0ef          	jal	ra,80008b7c <dhcp_option_short>
8000a0f8:	00a40733          	add	a4,s0,a0
8000a0fc:	03700693          	li	a3,55
8000a100:	00d70023          	sb	a3,0(a4)
8000a104:	00150713          	addi	a4,a0,1
8000a108:	01071713          	slli	a4,a4,0x10
8000a10c:	01075713          	srli	a4,a4,0x10
8000a110:	00e40733          	add	a4,s0,a4
8000a114:	00300613          	li	a2,3
8000a118:	00c70023          	sb	a2,0(a4)
8000a11c:	00250713          	addi	a4,a0,2
8000a120:	01071713          	slli	a4,a4,0x10
8000a124:	01075713          	srli	a4,a4,0x10
8000a128:	00e40733          	add	a4,s0,a4
8000a12c:	00100693          	li	a3,1
8000a130:	00d70023          	sb	a3,0(a4)
8000a134:	00050793          	mv	a5,a0
8000a138:	00350693          	addi	a3,a0,3
8000a13c:	01069693          	slli	a3,a3,0x10
8000a140:	00478793          	addi	a5,a5,4
8000a144:	0106d693          	srli	a3,a3,0x10
8000a148:	01079793          	slli	a5,a5,0x10
8000a14c:	00d406b3          	add	a3,s0,a3
8000a150:	00550513          	addi	a0,a0,5
8000a154:	0107d793          	srli	a5,a5,0x10
8000a158:	00c68023          	sb	a2,0(a3)
8000a15c:	00f407b3          	add	a5,s0,a5
8000a160:	01c00713          	li	a4,28
8000a164:	01051513          	slli	a0,a0,0x10
8000a168:	00e78023          	sb	a4,0(a5)
8000a16c:	01055513          	srli	a0,a0,0x10
8000a170:	00040593          	mv	a1,s0
8000a174:	00090613          	mv	a2,s2
8000a178:	00a11723          	sh	a0,14(sp)
8000a17c:	c35fe0ef          	jal	ra,80008db0 <dhcp_option_trailer>
8000a180:	8ec1a503          	lw	a0,-1812(gp) # 80003084 <dhcp_pcb>
8000a184:	00098713          	mv	a4,s3
8000a188:	04300693          	li	a3,67
8000a18c:	01848613          	addi	a2,s1,24
8000a190:	00090593          	mv	a1,s2
8000a194:	ee0fe0ef          	jal	ra,80008874 <udp_sendto_if>
8000a198:	00050413          	mv	s0,a0
8000a19c:	00090513          	mv	a0,s2
8000a1a0:	d35fc0ef          	jal	ra,80006ed4 <pbuf_free>
8000a1a4:	0064c783          	lbu	a5,6(s1)
8000a1a8:	0ff00713          	li	a4,255
8000a1ac:	00e78663          	beq	a5,a4,8000a1b8 <dhcp_renew+0x158>
8000a1b0:	00178793          	addi	a5,a5,1
8000a1b4:	00f48323          	sb	a5,6(s1)
8000a1b8:	0064c503          	lbu	a0,6(s1)
8000a1bc:	00900793          	li	a5,9
8000a1c0:	04a7e863          	bltu	a5,a0,8000a210 <dhcp_renew+0x1b0>
8000a1c4:	00551793          	slli	a5,a0,0x5
8000a1c8:	40a787b3          	sub	a5,a5,a0
8000a1cc:	00279793          	slli	a5,a5,0x2
8000a1d0:	00f50533          	add	a0,a0,a5
8000a1d4:	00451513          	slli	a0,a0,0x4
8000a1d8:	01051513          	slli	a0,a0,0x10
8000a1dc:	01055513          	srli	a0,a0,0x10
8000a1e0:	1f400593          	li	a1,500
8000a1e4:	1f350513          	addi	a0,a0,499
8000a1e8:	058030ef          	jal	ra,8000d240 <__divsi3>
8000a1ec:	00a49423          	sh	a0,8(s1)
8000a1f0:	02c12083          	lw	ra,44(sp)
8000a1f4:	00040513          	mv	a0,s0
8000a1f8:	02812403          	lw	s0,40(sp)
8000a1fc:	02412483          	lw	s1,36(sp)
8000a200:	02012903          	lw	s2,32(sp)
8000a204:	01c12983          	lw	s3,28(sp)
8000a208:	03010113          	addi	sp,sp,48
8000a20c:	00008067          	ret
8000a210:	00005537          	lui	a0,0x5
8000a214:	e2050513          	addi	a0,a0,-480 # 4e20 <_stack_size+0x4620>
8000a218:	fc9ff06f          	j	8000a1e0 <dhcp_renew+0x180>

8000a21c <dhcp_supplied_address>:
8000a21c:	02050863          	beqz	a0,8000a24c <dhcp_supplied_address+0x30>
8000a220:	02852783          	lw	a5,40(a0)
8000a224:	00000513          	li	a0,0
8000a228:	02078463          	beqz	a5,8000a250 <dhcp_supplied_address+0x34>
8000a22c:	0057c783          	lbu	a5,5(a5)
8000a230:	00a00713          	li	a4,10
8000a234:	00100513          	li	a0,1
8000a238:	00e78663          	beq	a5,a4,8000a244 <dhcp_supplied_address+0x28>
8000a23c:	ffc78513          	addi	a0,a5,-4
8000a240:	00253513          	sltiu	a0,a0,2
8000a244:	0ff57513          	andi	a0,a0,255
8000a248:	00008067          	ret
8000a24c:	00000513          	li	a0,0
8000a250:	00008067          	ret

8000a254 <dhcp_release_and_stop>:
8000a254:	fd010113          	addi	sp,sp,-48
8000a258:	02112623          	sw	ra,44(sp)
8000a25c:	02812423          	sw	s0,40(sp)
8000a260:	02912223          	sw	s1,36(sp)
8000a264:	03212023          	sw	s2,32(sp)
8000a268:	01312e23          	sw	s3,28(sp)
8000a26c:	01412c23          	sw	s4,24(sp)
8000a270:	02852403          	lw	s0,40(a0)
8000a274:	10040e63          	beqz	s0,8000a390 <dhcp_release_and_stop+0x13c>
8000a278:	00544783          	lbu	a5,5(s0)
8000a27c:	10078a63          	beqz	a5,8000a390 <dhcp_release_and_stop+0x13c>
8000a280:	01842783          	lw	a5,24(s0)
8000a284:	00042e23          	sw	zero,28(s0)
8000a288:	00042c23          	sw	zero,24(s0)
8000a28c:	02042023          	sw	zero,32(s0)
8000a290:	02042223          	sw	zero,36(s0)
8000a294:	02042823          	sw	zero,48(s0)
8000a298:	02042623          	sw	zero,44(s0)
8000a29c:	02042423          	sw	zero,40(s0)
8000a2a0:	00041723          	sh	zero,14(s0)
8000a2a4:	00042823          	sw	zero,16(s0)
8000a2a8:	00041a23          	sh	zero,20(s0)
8000a2ac:	00050493          	mv	s1,a0
8000a2b0:	00f12623          	sw	a5,12(sp)
8000a2b4:	f69ff0ef          	jal	ra,8000a21c <dhcp_supplied_address>
8000a2b8:	0a050463          	beqz	a0,8000a360 <dhcp_release_and_stop+0x10c>
8000a2bc:	00a10693          	addi	a3,sp,10
8000a2c0:	00700613          	li	a2,7
8000a2c4:	00040593          	mv	a1,s0
8000a2c8:	00048513          	mv	a0,s1
8000a2cc:	941fe0ef          	jal	ra,80008c0c <dhcp_create_msg>
8000a2d0:	00050993          	mv	s3,a0
8000a2d4:	08050663          	beqz	a0,8000a360 <dhcp_release_and_stop+0x10c>
8000a2d8:	00452903          	lw	s2,4(a0)
8000a2dc:	00a15783          	lhu	a5,10(sp)
8000a2e0:	03600693          	li	a3,54
8000a2e4:	0f090913          	addi	s2,s2,240
8000a2e8:	00f90733          	add	a4,s2,a5
8000a2ec:	00278a13          	addi	s4,a5,2
8000a2f0:	00178793          	addi	a5,a5,1
8000a2f4:	01079793          	slli	a5,a5,0x10
8000a2f8:	0107d793          	srli	a5,a5,0x10
8000a2fc:	00d70023          	sb	a3,0(a4)
8000a300:	00f907b3          	add	a5,s2,a5
8000a304:	00400713          	li	a4,4
8000a308:	00e78023          	sb	a4,0(a5)
8000a30c:	00c12503          	lw	a0,12(sp)
8000a310:	010a1a13          	slli	s4,s4,0x10
8000a314:	010a5a13          	srli	s4,s4,0x10
8000a318:	01411523          	sh	s4,10(sp)
8000a31c:	9adfb0ef          	jal	ra,80005cc8 <lwip_htonl>
8000a320:	00050613          	mv	a2,a0
8000a324:	00090593          	mv	a1,s2
8000a328:	000a0513          	mv	a0,s4
8000a32c:	881fe0ef          	jal	ra,80008bac <dhcp_option_long>
8000a330:	00098613          	mv	a2,s3
8000a334:	00090593          	mv	a1,s2
8000a338:	00a11523          	sh	a0,10(sp)
8000a33c:	a75fe0ef          	jal	ra,80008db0 <dhcp_option_trailer>
8000a340:	8ec1a503          	lw	a0,-1812(gp) # 80003084 <dhcp_pcb>
8000a344:	00048713          	mv	a4,s1
8000a348:	04300693          	li	a3,67
8000a34c:	00c10613          	addi	a2,sp,12
8000a350:	00098593          	mv	a1,s3
8000a354:	d20fe0ef          	jal	ra,80008874 <udp_sendto_if>
8000a358:	00098513          	mv	a0,s3
8000a35c:	b79fc0ef          	jal	ra,80006ed4 <pbuf_free>
8000a360:	84818693          	addi	a3,gp,-1976 # 80002fe0 <ip_addr_any>
8000a364:	84818613          	addi	a2,gp,-1976 # 80002fe0 <ip_addr_any>
8000a368:	00048513          	mv	a0,s1
8000a36c:	84818593          	addi	a1,gp,-1976 # 80002fe0 <ip_addr_any>
8000a370:	c2cfc0ef          	jal	ra,8000679c <netif_set_addr>
8000a374:	00000593          	li	a1,0
8000a378:	00040513          	mv	a0,s0
8000a37c:	fe8fe0ef          	jal	ra,80008b64 <dhcp_set_state>
8000a380:	00444783          	lbu	a5,4(s0)
8000a384:	00078663          	beqz	a5,8000a390 <dhcp_release_and_stop+0x13c>
8000a388:	c60ff0ef          	jal	ra,800097e8 <dhcp_dec_pcb_refcount>
8000a38c:	00040223          	sb	zero,4(s0)
8000a390:	02c12083          	lw	ra,44(sp)
8000a394:	02812403          	lw	s0,40(sp)
8000a398:	02412483          	lw	s1,36(sp)
8000a39c:	02012903          	lw	s2,32(sp)
8000a3a0:	01c12983          	lw	s3,28(sp)
8000a3a4:	01812a03          	lw	s4,24(sp)
8000a3a8:	03010113          	addi	sp,sp,48
8000a3ac:	00008067          	ret

8000a3b0 <dhcp_start>:
8000a3b0:	ff010113          	addi	sp,sp,-16
8000a3b4:	00912223          	sw	s1,4(sp)
8000a3b8:	00112623          	sw	ra,12(sp)
8000a3bc:	00812423          	sw	s0,8(sp)
8000a3c0:	01212023          	sw	s2,0(sp)
8000a3c4:	ff000493          	li	s1,-16
8000a3c8:	08050263          	beqz	a0,8000a44c <dhcp_start+0x9c>
8000a3cc:	03554783          	lbu	a5,53(a0)
8000a3d0:	ff000493          	li	s1,-16
8000a3d4:	0017f793          	andi	a5,a5,1
8000a3d8:	06078a63          	beqz	a5,8000a44c <dhcp_start+0x9c>
8000a3dc:	02c55703          	lhu	a4,44(a0)
8000a3e0:	23f00793          	li	a5,575
8000a3e4:	02852903          	lw	s2,40(a0)
8000a3e8:	00e7e663          	bltu	a5,a4,8000a3f4 <dhcp_start+0x44>
8000a3ec:	fff00493          	li	s1,-1
8000a3f0:	05c0006f          	j	8000a44c <dhcp_start+0x9c>
8000a3f4:	00050413          	mv	s0,a0
8000a3f8:	06091863          	bnez	s2,8000a468 <dhcp_start+0xb8>
8000a3fc:	03400513          	li	a0,52
8000a400:	8b0fc0ef          	jal	ra,800064b0 <lwip_malloc>
8000a404:	00050913          	mv	s2,a0
8000a408:	fe0502e3          	beqz	a0,8000a3ec <dhcp_start+0x3c>
8000a40c:	02a42423          	sw	a0,40(s0)
8000a410:	03400613          	li	a2,52
8000a414:	00000593          	li	a1,0
8000a418:	00090513          	mv	a0,s2
8000a41c:	71c020ef          	jal	ra,8000cb38 <memset>
8000a420:	a48ff0ef          	jal	ra,80009668 <dhcp_inc_pcb_refcount>
8000a424:	00050493          	mv	s1,a0
8000a428:	fc0512e3          	bnez	a0,8000a3ec <dhcp_start+0x3c>
8000a42c:	00100793          	li	a5,1
8000a430:	00f90223          	sb	a5,4(s2)
8000a434:	03544783          	lbu	a5,53(s0)
8000a438:	0047f793          	andi	a5,a5,4
8000a43c:	02079e63          	bnez	a5,8000a478 <dhcp_start+0xc8>
8000a440:	00200593          	li	a1,2
8000a444:	00090513          	mv	a0,s2
8000a448:	f1cfe0ef          	jal	ra,80008b64 <dhcp_set_state>
8000a44c:	00c12083          	lw	ra,12(sp)
8000a450:	00812403          	lw	s0,8(sp)
8000a454:	00048513          	mv	a0,s1
8000a458:	00012903          	lw	s2,0(sp)
8000a45c:	00412483          	lw	s1,4(sp)
8000a460:	01010113          	addi	sp,sp,16
8000a464:	00008067          	ret
8000a468:	00494783          	lbu	a5,4(s2)
8000a46c:	fa0782e3          	beqz	a5,8000a410 <dhcp_start+0x60>
8000a470:	b78ff0ef          	jal	ra,800097e8 <dhcp_dec_pcb_refcount>
8000a474:	f9dff06f          	j	8000a410 <dhcp_start+0x60>
8000a478:	00040513          	mv	a0,s0
8000a47c:	e11fe0ef          	jal	ra,8000928c <dhcp_discover>
8000a480:	00050493          	mv	s1,a0
8000a484:	fc0504e3          	beqz	a0,8000a44c <dhcp_start+0x9c>
8000a488:	00040513          	mv	a0,s0
8000a48c:	dc9ff0ef          	jal	ra,8000a254 <dhcp_release_and_stop>
8000a490:	f5dff06f          	j	8000a3ec <dhcp_start+0x3c>

8000a494 <dhcp_coarse_tmr>:
8000a494:	fc010113          	addi	sp,sp,-64
8000a498:	02812c23          	sw	s0,56(sp)
8000a49c:	8d41a403          	lw	s0,-1836(gp) # 8000306c <netif_list>
8000a4a0:	03312623          	sw	s3,44(sp)
8000a4a4:	000029b7          	lui	s3,0x2
8000a4a8:	03212823          	sw	s2,48(sp)
8000a4ac:	03412423          	sw	s4,40(sp)
8000a4b0:	03512223          	sw	s5,36(sp)
8000a4b4:	03612023          	sw	s6,32(sp)
8000a4b8:	01712e23          	sw	s7,28(sp)
8000a4bc:	02112e23          	sw	ra,60(sp)
8000a4c0:	02912a23          	sw	s1,52(sp)
8000a4c4:	01812c23          	sw	s8,24(sp)
8000a4c8:	01912a23          	sw	s9,20(sp)
8000a4cc:	00100913          	li	s2,1
8000a4d0:	00a00a13          	li	s4,10
8000a4d4:	43200a93          	li	s5,1074
8000a4d8:	71098993          	addi	s3,s3,1808 # 2710 <_stack_size+0x1f10>
8000a4dc:	02041c63          	bnez	s0,8000a514 <dhcp_coarse_tmr+0x80>
8000a4e0:	03c12083          	lw	ra,60(sp)
8000a4e4:	03812403          	lw	s0,56(sp)
8000a4e8:	03412483          	lw	s1,52(sp)
8000a4ec:	03012903          	lw	s2,48(sp)
8000a4f0:	02c12983          	lw	s3,44(sp)
8000a4f4:	02812a03          	lw	s4,40(sp)
8000a4f8:	02412a83          	lw	s5,36(sp)
8000a4fc:	02012b03          	lw	s6,32(sp)
8000a500:	01c12b83          	lw	s7,28(sp)
8000a504:	01812c03          	lw	s8,24(sp)
8000a508:	01412c83          	lw	s9,20(sp)
8000a50c:	04010113          	addi	sp,sp,64
8000a510:	00008067          	ret
8000a514:	02842783          	lw	a5,40(s0)
8000a518:	02078e63          	beqz	a5,8000a554 <dhcp_coarse_tmr+0xc0>
8000a51c:	0057c703          	lbu	a4,5(a5)
8000a520:	02070a63          	beqz	a4,8000a554 <dhcp_coarse_tmr+0xc0>
8000a524:	0147d683          	lhu	a3,20(a5)
8000a528:	02068a63          	beqz	a3,8000a55c <dhcp_coarse_tmr+0xc8>
8000a52c:	0127d703          	lhu	a4,18(a5)
8000a530:	00170713          	addi	a4,a4,1
8000a534:	01071713          	slli	a4,a4,0x10
8000a538:	01075713          	srli	a4,a4,0x10
8000a53c:	00e79923          	sh	a4,18(a5)
8000a540:	00e69e63          	bne	a3,a4,8000a55c <dhcp_coarse_tmr+0xc8>
8000a544:	00040513          	mv	a0,s0
8000a548:	d0dff0ef          	jal	ra,8000a254 <dhcp_release_and_stop>
8000a54c:	00040513          	mv	a0,s0
8000a550:	e61ff0ef          	jal	ra,8000a3b0 <dhcp_start>
8000a554:	00042403          	lw	s0,0(s0)
8000a558:	f85ff06f          	j	8000a4dc <dhcp_coarse_tmr+0x48>
8000a55c:	0107d703          	lhu	a4,16(a5)
8000a560:	1a070663          	beqz	a4,8000a70c <dhcp_coarse_tmr+0x278>
8000a564:	fff70693          	addi	a3,a4,-1
8000a568:	00d79823          	sh	a3,16(a5)
8000a56c:	1b271063          	bne	a4,s2,8000a70c <dhcp_coarse_tmr+0x278>
8000a570:	02842c03          	lw	s8,40(s0)
8000a574:	005c4783          	lbu	a5,5(s8)
8000a578:	fcfa6ee3          	bltu	s4,a5,8000a554 <dhcp_coarse_tmr+0xc0>
8000a57c:	00fad7b3          	srl	a5,s5,a5
8000a580:	0017f793          	andi	a5,a5,1
8000a584:	fc0788e3          	beqz	a5,8000a554 <dhcp_coarse_tmr+0xc0>
8000a588:	00400593          	li	a1,4
8000a58c:	000c0513          	mv	a0,s8
8000a590:	dd4fe0ef          	jal	ra,80008b64 <dhcp_set_state>
8000a594:	00e10693          	addi	a3,sp,14
8000a598:	00300613          	li	a2,3
8000a59c:	000c0593          	mv	a1,s8
8000a5a0:	00040513          	mv	a0,s0
8000a5a4:	e68fe0ef          	jal	ra,80008c0c <dhcp_create_msg>
8000a5a8:	00050c93          	mv	s9,a0
8000a5ac:	0e050a63          	beqz	a0,8000a6a0 <dhcp_coarse_tmr+0x20c>
8000a5b0:	00452483          	lw	s1,4(a0)
8000a5b4:	00e15783          	lhu	a5,14(sp)
8000a5b8:	03900693          	li	a3,57
8000a5bc:	0f048493          	addi	s1,s1,240
8000a5c0:	00f48733          	add	a4,s1,a5
8000a5c4:	00278513          	addi	a0,a5,2
8000a5c8:	00178793          	addi	a5,a5,1
8000a5cc:	01079793          	slli	a5,a5,0x10
8000a5d0:	0107d793          	srli	a5,a5,0x10
8000a5d4:	00d70023          	sb	a3,0(a4)
8000a5d8:	00f487b3          	add	a5,s1,a5
8000a5dc:	00200713          	li	a4,2
8000a5e0:	00e78023          	sb	a4,0(a5)
8000a5e4:	02c45603          	lhu	a2,44(s0)
8000a5e8:	01051513          	slli	a0,a0,0x10
8000a5ec:	01055513          	srli	a0,a0,0x10
8000a5f0:	00048593          	mv	a1,s1
8000a5f4:	00a11723          	sh	a0,14(sp)
8000a5f8:	d84fe0ef          	jal	ra,80008b7c <dhcp_option_short>
8000a5fc:	00a48733          	add	a4,s1,a0
8000a600:	03700693          	li	a3,55
8000a604:	00d70023          	sb	a3,0(a4)
8000a608:	00150713          	addi	a4,a0,1
8000a60c:	01071713          	slli	a4,a4,0x10
8000a610:	01075713          	srli	a4,a4,0x10
8000a614:	00300693          	li	a3,3
8000a618:	00e48733          	add	a4,s1,a4
8000a61c:	00d70023          	sb	a3,0(a4)
8000a620:	00250713          	addi	a4,a0,2
8000a624:	01071713          	slli	a4,a4,0x10
8000a628:	01075713          	srli	a4,a4,0x10
8000a62c:	00e48733          	add	a4,s1,a4
8000a630:	01270023          	sb	s2,0(a4)
8000a634:	00050793          	mv	a5,a0
8000a638:	00350713          	addi	a4,a0,3
8000a63c:	01071713          	slli	a4,a4,0x10
8000a640:	00478793          	addi	a5,a5,4
8000a644:	01075713          	srli	a4,a4,0x10
8000a648:	01079793          	slli	a5,a5,0x10
8000a64c:	00e48733          	add	a4,s1,a4
8000a650:	00550513          	addi	a0,a0,5
8000a654:	0107d793          	srli	a5,a5,0x10
8000a658:	00d70023          	sb	a3,0(a4)
8000a65c:	00f487b3          	add	a5,s1,a5
8000a660:	01c00713          	li	a4,28
8000a664:	01051513          	slli	a0,a0,0x10
8000a668:	00e78023          	sb	a4,0(a5)
8000a66c:	01055513          	srli	a0,a0,0x10
8000a670:	000c8613          	mv	a2,s9
8000a674:	00048593          	mv	a1,s1
8000a678:	00a11723          	sh	a0,14(sp)
8000a67c:	f34fe0ef          	jal	ra,80008db0 <dhcp_option_trailer>
8000a680:	8ec1a503          	lw	a0,-1812(gp) # 80003084 <dhcp_pcb>
8000a684:	00040713          	mv	a4,s0
8000a688:	04300693          	li	a3,67
8000a68c:	84418613          	addi	a2,gp,-1980 # 80002fdc <ip_addr_broadcast>
8000a690:	000c8593          	mv	a1,s9
8000a694:	9e0fe0ef          	jal	ra,80008874 <udp_sendto_if>
8000a698:	000c8513          	mv	a0,s9
8000a69c:	839fc0ef          	jal	ra,80006ed4 <pbuf_free>
8000a6a0:	006c4783          	lbu	a5,6(s8)
8000a6a4:	0ff00713          	li	a4,255
8000a6a8:	00e78663          	beq	a5,a4,8000a6b4 <dhcp_coarse_tmr+0x220>
8000a6ac:	00178793          	addi	a5,a5,1
8000a6b0:	00fc0323          	sb	a5,6(s8)
8000a6b4:	006c4783          	lbu	a5,6(s8)
8000a6b8:	00900713          	li	a4,9
8000a6bc:	00098513          	mv	a0,s3
8000a6c0:	02f76063          	bltu	a4,a5,8000a6e0 <dhcp_coarse_tmr+0x24c>
8000a6c4:	00579513          	slli	a0,a5,0x5
8000a6c8:	40f50533          	sub	a0,a0,a5
8000a6cc:	00251513          	slli	a0,a0,0x2
8000a6d0:	00a787b3          	add	a5,a5,a0
8000a6d4:	00379793          	slli	a5,a5,0x3
8000a6d8:	01079513          	slli	a0,a5,0x10
8000a6dc:	01055513          	srli	a0,a0,0x10
8000a6e0:	1f400593          	li	a1,500
8000a6e4:	1f350513          	addi	a0,a0,499
8000a6e8:	359020ef          	jal	ra,8000d240 <__divsi3>
8000a6ec:	014c5783          	lhu	a5,20(s8)
8000a6f0:	012c5703          	lhu	a4,18(s8)
8000a6f4:	00ac1423          	sh	a0,8(s8)
8000a6f8:	40e787b3          	sub	a5,a5,a4
8000a6fc:	e4f95ce3          	bge	s2,a5,8000a554 <dhcp_coarse_tmr+0xc0>
8000a700:	4017d793          	srai	a5,a5,0x1
8000a704:	00fc1823          	sh	a5,16(s8)
8000a708:	e4dff06f          	j	8000a554 <dhcp_coarse_tmr+0xc0>
8000a70c:	00e7d703          	lhu	a4,14(a5)
8000a710:	e40702e3          	beqz	a4,8000a554 <dhcp_coarse_tmr+0xc0>
8000a714:	fff70693          	addi	a3,a4,-1
8000a718:	00d79723          	sh	a3,14(a5)
8000a71c:	e3271ce3          	bne	a4,s2,8000a554 <dhcp_coarse_tmr+0xc0>
8000a720:	02842483          	lw	s1,40(s0)
8000a724:	0054c783          	lbu	a5,5(s1)
8000a728:	0fb7f713          	andi	a4,a5,251
8000a72c:	01270463          	beq	a4,s2,8000a734 <dhcp_coarse_tmr+0x2a0>
8000a730:	e34792e3          	bne	a5,s4,8000a554 <dhcp_coarse_tmr+0xc0>
8000a734:	00040513          	mv	a0,s0
8000a738:	929ff0ef          	jal	ra,8000a060 <dhcp_renew>
8000a73c:	00c4d783          	lhu	a5,12(s1)
8000a740:	0124d703          	lhu	a4,18(s1)
8000a744:	40e787b3          	sub	a5,a5,a4
8000a748:	e0f956e3          	bge	s2,a5,8000a554 <dhcp_coarse_tmr+0xc0>
8000a74c:	4017d793          	srai	a5,a5,0x1
8000a750:	00f49723          	sh	a5,14(s1)
8000a754:	e01ff06f          	j	8000a554 <dhcp_coarse_tmr+0xc0>

8000a758 <dhcp_fine_tmr>:
8000a758:	fe010113          	addi	sp,sp,-32
8000a75c:	00812c23          	sw	s0,24(sp)
8000a760:	8d41a403          	lw	s0,-1836(gp) # 8000306c <netif_list>
8000a764:	00912a23          	sw	s1,20(sp)
8000a768:	01212823          	sw	s2,16(sp)
8000a76c:	01312623          	sw	s3,12(sp)
8000a770:	01412423          	sw	s4,8(sp)
8000a774:	01512223          	sw	s5,4(sp)
8000a778:	01612023          	sw	s6,0(sp)
8000a77c:	00112e23          	sw	ra,28(sp)
8000a780:	00100493          	li	s1,1
8000a784:	00c00913          	li	s2,12
8000a788:	00600993          	li	s3,6
8000a78c:	00800a13          	li	s4,8
8000a790:	00300a93          	li	s5,3
8000a794:	00500b13          	li	s6,5
8000a798:	02041663          	bnez	s0,8000a7c4 <dhcp_fine_tmr+0x6c>
8000a79c:	01c12083          	lw	ra,28(sp)
8000a7a0:	01812403          	lw	s0,24(sp)
8000a7a4:	01412483          	lw	s1,20(sp)
8000a7a8:	01012903          	lw	s2,16(sp)
8000a7ac:	00c12983          	lw	s3,12(sp)
8000a7b0:	00812a03          	lw	s4,8(sp)
8000a7b4:	00412a83          	lw	s5,4(sp)
8000a7b8:	00012b03          	lw	s6,0(sp)
8000a7bc:	02010113          	addi	sp,sp,32
8000a7c0:	00008067          	ret
8000a7c4:	02842703          	lw	a4,40(s0)
8000a7c8:	00070a63          	beqz	a4,8000a7dc <dhcp_fine_tmr+0x84>
8000a7cc:	00875783          	lhu	a5,8(a4)
8000a7d0:	00f4fa63          	bgeu	s1,a5,8000a7e4 <dhcp_fine_tmr+0x8c>
8000a7d4:	fff78793          	addi	a5,a5,-1
8000a7d8:	00f71423          	sh	a5,8(a4)
8000a7dc:	00042403          	lw	s0,0(s0)
8000a7e0:	fb9ff06f          	j	8000a798 <dhcp_fine_tmr+0x40>
8000a7e4:	fe979ce3          	bne	a5,s1,8000a7dc <dhcp_fine_tmr+0x84>
8000a7e8:	00071423          	sh	zero,8(a4)
8000a7ec:	02842703          	lw	a4,40(s0)
8000a7f0:	00574783          	lbu	a5,5(a4)
8000a7f4:	01278463          	beq	a5,s2,8000a7fc <dhcp_fine_tmr+0xa4>
8000a7f8:	01379863          	bne	a5,s3,8000a808 <dhcp_fine_tmr+0xb0>
8000a7fc:	00040513          	mv	a0,s0
8000a800:	a8dfe0ef          	jal	ra,8000928c <dhcp_discover>
8000a804:	fd9ff06f          	j	8000a7dc <dhcp_fine_tmr+0x84>
8000a808:	02979463          	bne	a5,s1,8000a830 <dhcp_fine_tmr+0xd8>
8000a80c:	00674783          	lbu	a5,6(a4)
8000a810:	00040513          	mv	a0,s0
8000a814:	00fb6663          	bltu	s6,a5,8000a820 <dhcp_fine_tmr+0xc8>
8000a818:	ff8fe0ef          	jal	ra,80009010 <dhcp_select>
8000a81c:	fc1ff06f          	j	8000a7dc <dhcp_fine_tmr+0x84>
8000a820:	a35ff0ef          	jal	ra,8000a254 <dhcp_release_and_stop>
8000a824:	00040513          	mv	a0,s0
8000a828:	b89ff0ef          	jal	ra,8000a3b0 <dhcp_start>
8000a82c:	fb1ff06f          	j	8000a7dc <dhcp_fine_tmr+0x84>
8000a830:	03479063          	bne	a5,s4,8000a850 <dhcp_fine_tmr+0xf8>
8000a834:	00674783          	lbu	a5,6(a4)
8000a838:	00040513          	mv	a0,s0
8000a83c:	00f4e663          	bltu	s1,a5,8000a848 <dhcp_fine_tmr+0xf0>
8000a840:	c11fe0ef          	jal	ra,80009450 <dhcp_check>
8000a844:	f99ff06f          	j	8000a7dc <dhcp_fine_tmr+0x84>
8000a848:	c6dfe0ef          	jal	ra,800094b4 <dhcp_bind>
8000a84c:	f91ff06f          	j	8000a7dc <dhcp_fine_tmr+0x84>
8000a850:	f95796e3          	bne	a5,s5,8000a7dc <dhcp_fine_tmr+0x84>
8000a854:	00674783          	lbu	a5,6(a4)
8000a858:	00040513          	mv	a0,s0
8000a85c:	faf4e2e3          	bltu	s1,a5,8000a800 <dhcp_fine_tmr+0xa8>
8000a860:	da0fe0ef          	jal	ra,80008e00 <dhcp_reboot>
8000a864:	f79ff06f          	j	8000a7dc <dhcp_fine_tmr+0x84>

8000a868 <dhcp_release>:
8000a868:	ff010113          	addi	sp,sp,-16
8000a86c:	00112623          	sw	ra,12(sp)
8000a870:	9e5ff0ef          	jal	ra,8000a254 <dhcp_release_and_stop>
8000a874:	00c12083          	lw	ra,12(sp)
8000a878:	00000513          	li	a0,0
8000a87c:	01010113          	addi	sp,sp,16
8000a880:	00008067          	ret

8000a884 <dhcp_stop>:
8000a884:	9d1ff06f          	j	8000a254 <dhcp_release_and_stop>

8000a888 <etharp_free_entry>:
8000a888:	fe010113          	addi	sp,sp,-32
8000a88c:	00912a23          	sw	s1,20(sp)
8000a890:	00151493          	slli	s1,a0,0x1
8000a894:	00a48733          	add	a4,s1,a0
8000a898:	01212823          	sw	s2,16(sp)
8000a89c:	00371713          	slli	a4,a4,0x3
8000a8a0:	b4c18913          	addi	s2,gp,-1204 # 800032e4 <arp_table>
8000a8a4:	00812c23          	sw	s0,24(sp)
8000a8a8:	01312623          	sw	s3,12(sp)
8000a8ac:	00112e23          	sw	ra,28(sp)
8000a8b0:	00e90933          	add	s2,s2,a4
8000a8b4:	00050993          	mv	s3,a0
8000a8b8:	00092503          	lw	a0,0(s2)
8000a8bc:	b4c18413          	addi	s0,gp,-1204 # 800032e4 <arp_table>
8000a8c0:	00050663          	beqz	a0,8000a8cc <etharp_free_entry+0x44>
8000a8c4:	e10fc0ef          	jal	ra,80006ed4 <pbuf_free>
8000a8c8:	00092023          	sw	zero,0(s2)
8000a8cc:	01348533          	add	a0,s1,s3
8000a8d0:	00351513          	slli	a0,a0,0x3
8000a8d4:	00a40533          	add	a0,s0,a0
8000a8d8:	00050a23          	sb	zero,20(a0)
8000a8dc:	00051923          	sh	zero,18(a0)
8000a8e0:	00052423          	sw	zero,8(a0)
8000a8e4:	00052223          	sw	zero,4(a0)
8000a8e8:	00600613          	li	a2,6
8000a8ec:	84c18593          	addi	a1,gp,-1972 # 80002fe4 <ethzero>
8000a8f0:	00c50513          	addi	a0,a0,12
8000a8f4:	7d0030ef          	jal	ra,8000e0c4 <memcpy>
8000a8f8:	01c12083          	lw	ra,28(sp)
8000a8fc:	01812403          	lw	s0,24(sp)
8000a900:	01412483          	lw	s1,20(sp)
8000a904:	01012903          	lw	s2,16(sp)
8000a908:	00c12983          	lw	s3,12(sp)
8000a90c:	02010113          	addi	sp,sp,32
8000a910:	00008067          	ret

8000a914 <etharp_find_entry>:
8000a914:	fe010113          	addi	sp,sp,-32
8000a918:	00812c23          	sw	s0,24(sp)
8000a91c:	00912a23          	sw	s1,20(sp)
8000a920:	b4c18693          	addi	a3,gp,-1204 # 800032e4 <arp_table>
8000a924:	00112e23          	sw	ra,28(sp)
8000a928:	01212823          	sw	s2,16(sp)
8000a92c:	01312623          	sw	s3,12(sp)
8000a930:	00000293          	li	t0,0
8000a934:	00000f93          	li	t6,0
8000a938:	00000f13          	li	t5,0
8000a93c:	00a00313          	li	t1,10
8000a940:	00000793          	li	a5,0
8000a944:	00a00713          	li	a4,10
8000a948:	00a00893          	li	a7,10
8000a94c:	00a00493          	li	s1,10
8000a950:	b4c18413          	addi	s0,gp,-1204 # 800032e4 <arp_table>
8000a954:	00a00e13          	li	t3,10
8000a958:	00100393          	li	t2,1
8000a95c:	0146ce83          	lbu	t4,20(a3)
8000a960:	05c71263          	bne	a4,t3,8000a9a4 <etharp_find_entry+0x90>
8000a964:	100e8463          	beqz	t4,8000aa6c <etharp_find_entry+0x158>
8000a968:	00050e63          	beqz	a0,8000a984 <etharp_find_entry+0x70>
8000a96c:	00052903          	lw	s2,0(a0)
8000a970:	0046a803          	lw	a6,4(a3)
8000a974:	01091863          	bne	s2,a6,8000a984 <etharp_find_entry+0x70>
8000a978:	0a060a63          	beqz	a2,8000aa2c <etharp_find_entry+0x118>
8000a97c:	0086a803          	lw	a6,8(a3)
8000a980:	0ac80663          	beq	a6,a2,8000aa2c <etharp_find_entry+0x118>
8000a984:	0126d803          	lhu	a6,18(a3)
8000a988:	0c7e9a63          	bne	t4,t2,8000aa5c <etharp_find_entry+0x148>
8000a98c:	0006ae83          	lw	t4,0(a3)
8000a990:	0a0e8e63          	beqz	t4,8000aa4c <etharp_find_entry+0x138>
8000a994:	01e86a63          	bltu	a6,t5,8000a9a8 <etharp_find_entry+0x94>
8000a998:	00080f13          	mv	t5,a6
8000a99c:	00078313          	mv	t1,a5
8000a9a0:	0080006f          	j	8000a9a8 <etharp_find_entry+0x94>
8000a9a4:	fc0e92e3          	bnez	t4,8000a968 <etharp_find_entry+0x54>
8000a9a8:	00178793          	addi	a5,a5,1
8000a9ac:	01079813          	slli	a6,a5,0x10
8000a9b0:	01085813          	srli	a6,a6,0x10
8000a9b4:	01081793          	slli	a5,a6,0x10
8000a9b8:	01868693          	addi	a3,a3,24
8000a9bc:	4107d793          	srai	a5,a5,0x10
8000a9c0:	f9c81ee3          	bne	a6,t3,8000a95c <etharp_find_entry+0x48>
8000a9c4:	00100693          	li	a3,1
8000a9c8:	fff00793          	li	a5,-1
8000a9cc:	06d59063          	bne	a1,a3,8000aa2c <etharp_find_entry+0x118>
8000a9d0:	00060993          	mv	s3,a2
8000a9d4:	00050913          	mv	s2,a0
8000a9d8:	03c71063          	bne	a4,t3,8000a9f8 <etharp_find_entry+0xe4>
8000a9dc:	08e89c63          	bne	a7,a4,8000aa74 <etharp_find_entry+0x160>
8000a9e0:	01149663          	bne	s1,a7,8000a9ec <etharp_find_entry+0xd8>
8000a9e4:	04930463          	beq	t1,s1,8000aa2c <etharp_find_entry+0x118>
8000a9e8:	00030493          	mv	s1,t1
8000a9ec:	00048513          	mv	a0,s1
8000a9f0:	e99ff0ef          	jal	ra,8000a888 <etharp_free_entry>
8000a9f4:	00048713          	mv	a4,s1
8000a9f8:	00171793          	slli	a5,a4,0x1
8000a9fc:	00090c63          	beqz	s2,8000aa14 <etharp_find_entry+0x100>
8000aa00:	00092603          	lw	a2,0(s2)
8000aa04:	00e786b3          	add	a3,a5,a4
8000aa08:	00369693          	slli	a3,a3,0x3
8000aa0c:	00d406b3          	add	a3,s0,a3
8000aa10:	00c6a223          	sw	a2,4(a3)
8000aa14:	00e787b3          	add	a5,a5,a4
8000aa18:	00379793          	slli	a5,a5,0x3
8000aa1c:	00f407b3          	add	a5,s0,a5
8000aa20:	00079923          	sh	zero,18(a5)
8000aa24:	0137a423          	sw	s3,8(a5)
8000aa28:	00070793          	mv	a5,a4
8000aa2c:	01c12083          	lw	ra,28(sp)
8000aa30:	01812403          	lw	s0,24(sp)
8000aa34:	01412483          	lw	s1,20(sp)
8000aa38:	01012903          	lw	s2,16(sp)
8000aa3c:	00c12983          	lw	s3,12(sp)
8000aa40:	00078513          	mv	a0,a5
8000aa44:	02010113          	addi	sp,sp,32
8000aa48:	00008067          	ret
8000aa4c:	f5f86ee3          	bltu	a6,t6,8000a9a8 <etharp_find_entry+0x94>
8000aa50:	00080f93          	mv	t6,a6
8000aa54:	00078493          	mv	s1,a5
8000aa58:	f51ff06f          	j	8000a9a8 <etharp_find_entry+0x94>
8000aa5c:	f45866e3          	bltu	a6,t0,8000a9a8 <etharp_find_entry+0x94>
8000aa60:	00080293          	mv	t0,a6
8000aa64:	00078893          	mv	a7,a5
8000aa68:	f41ff06f          	j	8000a9a8 <etharp_find_entry+0x94>
8000aa6c:	00078713          	mv	a4,a5
8000aa70:	f39ff06f          	j	8000a9a8 <etharp_find_entry+0x94>
8000aa74:	00088493          	mv	s1,a7
8000aa78:	f75ff06f          	j	8000a9ec <etharp_find_entry+0xd8>

8000aa7c <etharp_raw>:
8000aa7c:	fc010113          	addi	sp,sp,-64
8000aa80:	03312623          	sw	s3,44(sp)
8000aa84:	03412423          	sw	s4,40(sp)
8000aa88:	03512223          	sw	s5,36(sp)
8000aa8c:	00050993          	mv	s3,a0
8000aa90:	00058a13          	mv	s4,a1
8000aa94:	00060a93          	mv	s5,a2
8000aa98:	01c00593          	li	a1,28
8000aa9c:	28000613          	li	a2,640
8000aaa0:	01000513          	li	a0,16
8000aaa4:	02912a23          	sw	s1,52(sp)
8000aaa8:	03612023          	sw	s6,32(sp)
8000aaac:	01712e23          	sw	s7,28(sp)
8000aab0:	01812c23          	sw	s8,24(sp)
8000aab4:	01912a23          	sw	s9,20(sp)
8000aab8:	01112623          	sw	a7,12(sp)
8000aabc:	02112e23          	sw	ra,60(sp)
8000aac0:	02812c23          	sw	s0,56(sp)
8000aac4:	03212823          	sw	s2,48(sp)
8000aac8:	00068c93          	mv	s9,a3
8000aacc:	00070b93          	mv	s7,a4
8000aad0:	00078c13          	mv	s8,a5
8000aad4:	00080b13          	mv	s6,a6
8000aad8:	cd0fc0ef          	jal	ra,80006fa8 <pbuf_alloc>
8000aadc:	a0c18493          	addi	s1,gp,-1524 # 800031a4 <lwip_stats>
8000aae0:	00c12883          	lw	a7,12(sp)
8000aae4:	04051463          	bnez	a0,8000ab2c <etharp_raw+0xb0>
8000aae8:	0484a783          	lw	a5,72(s1)
8000aaec:	fff00513          	li	a0,-1
8000aaf0:	00178793          	addi	a5,a5,1
8000aaf4:	04f4a423          	sw	a5,72(s1)
8000aaf8:	03c12083          	lw	ra,60(sp)
8000aafc:	03812403          	lw	s0,56(sp)
8000ab00:	03412483          	lw	s1,52(sp)
8000ab04:	03012903          	lw	s2,48(sp)
8000ab08:	02c12983          	lw	s3,44(sp)
8000ab0c:	02812a03          	lw	s4,40(sp)
8000ab10:	02412a83          	lw	s5,36(sp)
8000ab14:	02012b03          	lw	s6,32(sp)
8000ab18:	01c12b83          	lw	s7,28(sp)
8000ab1c:	01812c03          	lw	s8,24(sp)
8000ab20:	01412c83          	lw	s9,20(sp)
8000ab24:	04010113          	addi	sp,sp,64
8000ab28:	00008067          	ret
8000ab2c:	00452403          	lw	s0,4(a0)
8000ab30:	00050913          	mv	s2,a0
8000ab34:	00088513          	mv	a0,a7
8000ab38:	978fb0ef          	jal	ra,80005cb0 <lwip_htons>
8000ab3c:	00a40323          	sb	a0,6(s0)
8000ab40:	00855513          	srli	a0,a0,0x8
8000ab44:	00a403a3          	sb	a0,7(s0)
8000ab48:	00600613          	li	a2,6
8000ab4c:	000c8593          	mv	a1,s9
8000ab50:	00840513          	addi	a0,s0,8
8000ab54:	570030ef          	jal	ra,8000e0c4 <memcpy>
8000ab58:	00600613          	li	a2,6
8000ab5c:	000c0593          	mv	a1,s8
8000ab60:	01240513          	addi	a0,s0,18
8000ab64:	560030ef          	jal	ra,8000e0c4 <memcpy>
8000ab68:	00400613          	li	a2,4
8000ab6c:	000b8593          	mv	a1,s7
8000ab70:	00e40513          	addi	a0,s0,14
8000ab74:	550030ef          	jal	ra,8000e0c4 <memcpy>
8000ab78:	00400613          	li	a2,4
8000ab7c:	000b0593          	mv	a1,s6
8000ab80:	01840513          	addi	a0,s0,24
8000ab84:	540030ef          	jal	ra,8000e0c4 <memcpy>
8000ab88:	00100793          	li	a5,1
8000ab8c:	00f400a3          	sb	a5,1(s0)
8000ab90:	00800793          	li	a5,8
8000ab94:	00f40123          	sb	a5,2(s0)
8000ab98:	00600793          	li	a5,6
8000ab9c:	00f40223          	sb	a5,4(s0)
8000aba0:	00001737          	lui	a4,0x1
8000aba4:	00400793          	li	a5,4
8000aba8:	00f402a3          	sb	a5,5(s0)
8000abac:	80670713          	addi	a4,a4,-2042 # 806 <_stack_size+0x6>
8000abb0:	000a8693          	mv	a3,s5
8000abb4:	000a0613          	mv	a2,s4
8000abb8:	00090593          	mv	a1,s2
8000abbc:	00040023          	sb	zero,0(s0)
8000abc0:	000401a3          	sb	zero,3(s0)
8000abc4:	00098513          	mv	a0,s3
8000abc8:	695010ef          	jal	ra,8000ca5c <ethernet_output>
8000abcc:	0304a783          	lw	a5,48(s1)
8000abd0:	00090513          	mv	a0,s2
8000abd4:	00178793          	addi	a5,a5,1
8000abd8:	02f4a823          	sw	a5,48(s1)
8000abdc:	af8fc0ef          	jal	ra,80006ed4 <pbuf_free>
8000abe0:	00000513          	li	a0,0
8000abe4:	f15ff06f          	j	8000aaf8 <etharp_raw+0x7c>

8000abe8 <etharp_cleanup_netif>:
8000abe8:	fe010113          	addi	sp,sp,-32
8000abec:	00812c23          	sw	s0,24(sp)
8000abf0:	00912a23          	sw	s1,20(sp)
8000abf4:	01212823          	sw	s2,16(sp)
8000abf8:	01312623          	sw	s3,12(sp)
8000abfc:	00112e23          	sw	ra,28(sp)
8000ac00:	00050993          	mv	s3,a0
8000ac04:	b4c18413          	addi	s0,gp,-1204 # 800032e4 <arp_table>
8000ac08:	00000493          	li	s1,0
8000ac0c:	00a00913          	li	s2,10
8000ac10:	01444783          	lbu	a5,20(s0)
8000ac14:	00078a63          	beqz	a5,8000ac28 <etharp_cleanup_netif+0x40>
8000ac18:	00842783          	lw	a5,8(s0)
8000ac1c:	01379663          	bne	a5,s3,8000ac28 <etharp_cleanup_netif+0x40>
8000ac20:	00048513          	mv	a0,s1
8000ac24:	c65ff0ef          	jal	ra,8000a888 <etharp_free_entry>
8000ac28:	00148493          	addi	s1,s1,1
8000ac2c:	01840413          	addi	s0,s0,24
8000ac30:	ff2490e3          	bne	s1,s2,8000ac10 <etharp_cleanup_netif+0x28>
8000ac34:	01c12083          	lw	ra,28(sp)
8000ac38:	01812403          	lw	s0,24(sp)
8000ac3c:	01412483          	lw	s1,20(sp)
8000ac40:	01012903          	lw	s2,16(sp)
8000ac44:	00c12983          	lw	s3,12(sp)
8000ac48:	02010113          	addi	sp,sp,32
8000ac4c:	00008067          	ret

8000ac50 <etharp_find_addr>:
8000ac50:	fe010113          	addi	sp,sp,-32
8000ac54:	00058793          	mv	a5,a1
8000ac58:	00812c23          	sw	s0,24(sp)
8000ac5c:	00200593          	li	a1,2
8000ac60:	00060413          	mv	s0,a2
8000ac64:	00050613          	mv	a2,a0
8000ac68:	00078513          	mv	a0,a5
8000ac6c:	00112e23          	sw	ra,28(sp)
8000ac70:	00d12623          	sw	a3,12(sp)
8000ac74:	ca1ff0ef          	jal	ra,8000a914 <etharp_find_entry>
8000ac78:	04054863          	bltz	a0,8000acc8 <etharp_find_addr+0x78>
8000ac7c:	00151793          	slli	a5,a0,0x1
8000ac80:	00a787b3          	add	a5,a5,a0
8000ac84:	b4c18713          	addi	a4,gp,-1204 # 800032e4 <arp_table>
8000ac88:	00379793          	slli	a5,a5,0x3
8000ac8c:	00f70633          	add	a2,a4,a5
8000ac90:	01464583          	lbu	a1,20(a2)
8000ac94:	00100613          	li	a2,1
8000ac98:	02b67863          	bgeu	a2,a1,8000acc8 <etharp_find_addr+0x78>
8000ac9c:	00c78613          	addi	a2,a5,12
8000aca0:	00c12683          	lw	a3,12(sp)
8000aca4:	00c70633          	add	a2,a4,a2
8000aca8:	00478793          	addi	a5,a5,4
8000acac:	00c42023          	sw	a2,0(s0)
8000acb0:	00f707b3          	add	a5,a4,a5
8000acb4:	00f6a023          	sw	a5,0(a3)
8000acb8:	01c12083          	lw	ra,28(sp)
8000acbc:	01812403          	lw	s0,24(sp)
8000acc0:	02010113          	addi	sp,sp,32
8000acc4:	00008067          	ret
8000acc8:	fff00513          	li	a0,-1
8000accc:	fedff06f          	j	8000acb8 <etharp_find_addr+0x68>

8000acd0 <etharp_get_entry>:
8000acd0:	00900793          	li	a5,9
8000acd4:	04a7e863          	bltu	a5,a0,8000ad24 <etharp_get_entry+0x54>
8000acd8:	00151793          	slli	a5,a0,0x1
8000acdc:	00a787b3          	add	a5,a5,a0
8000ace0:	b4c18713          	addi	a4,gp,-1204 # 800032e4 <arp_table>
8000ace4:	00379793          	slli	a5,a5,0x3
8000ace8:	00f70833          	add	a6,a4,a5
8000acec:	01484303          	lbu	t1,20(a6)
8000acf0:	00100893          	li	a7,1
8000acf4:	00000513          	li	a0,0
8000acf8:	0268f863          	bgeu	a7,t1,8000ad28 <etharp_get_entry+0x58>
8000acfc:	00478513          	addi	a0,a5,4
8000ad00:	00a70533          	add	a0,a4,a0
8000ad04:	00a5a023          	sw	a0,0(a1)
8000ad08:	00882583          	lw	a1,8(a6)
8000ad0c:	00c78793          	addi	a5,a5,12
8000ad10:	00f707b3          	add	a5,a4,a5
8000ad14:	00b62023          	sw	a1,0(a2)
8000ad18:	00f6a023          	sw	a5,0(a3)
8000ad1c:	00100513          	li	a0,1
8000ad20:	00008067          	ret
8000ad24:	00000513          	li	a0,0
8000ad28:	00008067          	ret

8000ad2c <etharp_input>:
8000ad2c:	22058863          	beqz	a1,8000af5c <etharp_input+0x230>
8000ad30:	fc010113          	addi	sp,sp,-64
8000ad34:	02812c23          	sw	s0,56(sp)
8000ad38:	03212823          	sw	s2,48(sp)
8000ad3c:	03312623          	sw	s3,44(sp)
8000ad40:	02112e23          	sw	ra,60(sp)
8000ad44:	02912a23          	sw	s1,52(sp)
8000ad48:	03412423          	sw	s4,40(sp)
8000ad4c:	03512223          	sw	s5,36(sp)
8000ad50:	03612023          	sw	s6,32(sp)
8000ad54:	01712e23          	sw	s7,28(sp)
8000ad58:	00452483          	lw	s1,4(a0)
8000ad5c:	00058413          	mv	s0,a1
8000ad60:	0014c783          	lbu	a5,1(s1)
8000ad64:	0004c703          	lbu	a4,0(s1)
8000ad68:	00050993          	mv	s3,a0
8000ad6c:	00879793          	slli	a5,a5,0x8
8000ad70:	00e7e7b3          	or	a5,a5,a4
8000ad74:	10000713          	li	a4,256
8000ad78:	a0c18913          	addi	s2,gp,-1524 # 800031a4 <lwip_stats>
8000ad7c:	02e79a63          	bne	a5,a4,8000adb0 <etharp_input+0x84>
8000ad80:	0044c703          	lbu	a4,4(s1)
8000ad84:	00600793          	li	a5,6
8000ad88:	02f71463          	bne	a4,a5,8000adb0 <etharp_input+0x84>
8000ad8c:	0054c703          	lbu	a4,5(s1)
8000ad90:	00400793          	li	a5,4
8000ad94:	00f71e63          	bne	a4,a5,8000adb0 <etharp_input+0x84>
8000ad98:	0034c783          	lbu	a5,3(s1)
8000ad9c:	0024c703          	lbu	a4,2(s1)
8000ada0:	00879793          	slli	a5,a5,0x8
8000ada4:	00e7e7b3          	or	a5,a5,a4
8000ada8:	00800713          	li	a4,8
8000adac:	04e78863          	beq	a5,a4,8000adfc <etharp_input+0xd0>
8000adb0:	05092783          	lw	a5,80(s2)
8000adb4:	00178793          	addi	a5,a5,1
8000adb8:	04f92823          	sw	a5,80(s2)
8000adbc:	03c92783          	lw	a5,60(s2)
8000adc0:	00178793          	addi	a5,a5,1
8000adc4:	02f92e23          	sw	a5,60(s2)
8000adc8:	00098513          	mv	a0,s3
8000adcc:	908fc0ef          	jal	ra,80006ed4 <pbuf_free>
8000add0:	03c12083          	lw	ra,60(sp)
8000add4:	03812403          	lw	s0,56(sp)
8000add8:	03412483          	lw	s1,52(sp)
8000addc:	03012903          	lw	s2,48(sp)
8000ade0:	02c12983          	lw	s3,44(sp)
8000ade4:	02812a03          	lw	s4,40(sp)
8000ade8:	02412a83          	lw	s5,36(sp)
8000adec:	02012b03          	lw	s6,32(sp)
8000adf0:	01c12b83          	lw	s7,28(sp)
8000adf4:	04010113          	addi	sp,sp,64
8000adf8:	00008067          	ret
8000adfc:	03492783          	lw	a5,52(s2)
8000ae00:	00400613          	li	a2,4
8000ae04:	00e48593          	addi	a1,s1,14
8000ae08:	00178793          	addi	a5,a5,1
8000ae0c:	00810513          	addi	a0,sp,8
8000ae10:	02f92a23          	sw	a5,52(s2)
8000ae14:	2b0030ef          	jal	ra,8000e0c4 <memcpy>
8000ae18:	00400613          	li	a2,4
8000ae1c:	01848593          	addi	a1,s1,24
8000ae20:	00c10513          	addi	a0,sp,12
8000ae24:	2a0030ef          	jal	ra,8000e0c4 <memcpy>
8000ae28:	00442783          	lw	a5,4(s0)
8000ae2c:	00848a13          	addi	s4,s1,8
8000ae30:	00078663          	beqz	a5,8000ae3c <etharp_input+0x110>
8000ae34:	00c12703          	lw	a4,12(sp)
8000ae38:	0ce78e63          	beq	a5,a4,8000af14 <etharp_input+0x1e8>
8000ae3c:	00000a93          	li	s5,0
8000ae40:	00200b13          	li	s6,2
8000ae44:	00812503          	lw	a0,8(sp)
8000ae48:	08050e63          	beqz	a0,8000aee4 <etharp_input+0x1b8>
8000ae4c:	00040593          	mv	a1,s0
8000ae50:	630010ef          	jal	ra,8000c480 <ip4_addr_isbroadcast_u32>
8000ae54:	08051863          	bnez	a0,8000aee4 <etharp_input+0x1b8>
8000ae58:	00812783          	lw	a5,8(sp)
8000ae5c:	0e000713          	li	a4,224
8000ae60:	0f07f793          	andi	a5,a5,240
8000ae64:	08e78063          	beq	a5,a4,8000aee4 <etharp_input+0x1b8>
8000ae68:	00040613          	mv	a2,s0
8000ae6c:	000b0593          	mv	a1,s6
8000ae70:	00810513          	addi	a0,sp,8
8000ae74:	aa1ff0ef          	jal	ra,8000a914 <etharp_find_entry>
8000ae78:	06054663          	bltz	a0,8000aee4 <etharp_input+0x1b8>
8000ae7c:	00151793          	slli	a5,a0,0x1
8000ae80:	00a787b3          	add	a5,a5,a0
8000ae84:	b4c18713          	addi	a4,gp,-1204 # 800032e4 <arp_table>
8000ae88:	00379793          	slli	a5,a5,0x3
8000ae8c:	00f70b33          	add	s6,a4,a5
8000ae90:	00200693          	li	a3,2
8000ae94:	00c78793          	addi	a5,a5,12
8000ae98:	00db0a23          	sb	a3,20(s6)
8000ae9c:	008b2423          	sw	s0,8(s6)
8000aea0:	00600613          	li	a2,6
8000aea4:	000a0593          	mv	a1,s4
8000aea8:	00f70533          	add	a0,a4,a5
8000aeac:	218030ef          	jal	ra,8000e0c4 <memcpy>
8000aeb0:	000b2b83          	lw	s7,0(s6)
8000aeb4:	000b1923          	sh	zero,18(s6)
8000aeb8:	020b8663          	beqz	s7,8000aee4 <etharp_input+0x1b8>
8000aebc:	00001737          	lui	a4,0x1
8000aec0:	000b2023          	sw	zero,0(s6)
8000aec4:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000aec8:	000a0693          	mv	a3,s4
8000aecc:	02e40613          	addi	a2,s0,46
8000aed0:	000b8593          	mv	a1,s7
8000aed4:	00040513          	mv	a0,s0
8000aed8:	385010ef          	jal	ra,8000ca5c <ethernet_output>
8000aedc:	000b8513          	mv	a0,s7
8000aee0:	ff5fb0ef          	jal	ra,80006ed4 <pbuf_free>
8000aee4:	0074c783          	lbu	a5,7(s1)
8000aee8:	0064c703          	lbu	a4,6(s1)
8000aeec:	00879793          	slli	a5,a5,0x8
8000aef0:	00e7e7b3          	or	a5,a5,a4
8000aef4:	10000713          	li	a4,256
8000aef8:	02e78463          	beq	a5,a4,8000af20 <etharp_input+0x1f4>
8000aefc:	20000713          	li	a4,512
8000af00:	04e78663          	beq	a5,a4,8000af4c <etharp_input+0x220>
8000af04:	05892783          	lw	a5,88(s2)
8000af08:	00178793          	addi	a5,a5,1
8000af0c:	04f92c23          	sw	a5,88(s2)
8000af10:	eb9ff06f          	j	8000adc8 <etharp_input+0x9c>
8000af14:	00100a93          	li	s5,1
8000af18:	00100b13          	li	s6,1
8000af1c:	f29ff06f          	j	8000ae44 <etharp_input+0x118>
8000af20:	ea0a84e3          	beqz	s5,8000adc8 <etharp_input+0x9c>
8000af24:	02e40693          	addi	a3,s0,46
8000af28:	00200893          	li	a7,2
8000af2c:	00810813          	addi	a6,sp,8
8000af30:	000a0793          	mv	a5,s4
8000af34:	00440713          	addi	a4,s0,4
8000af38:	000a0613          	mv	a2,s4
8000af3c:	00068593          	mv	a1,a3
8000af40:	00040513          	mv	a0,s0
8000af44:	b39ff0ef          	jal	ra,8000aa7c <etharp_raw>
8000af48:	e81ff06f          	j	8000adc8 <etharp_input+0x9c>
8000af4c:	00810593          	addi	a1,sp,8
8000af50:	00040513          	mv	a0,s0
8000af54:	fd5fe0ef          	jal	ra,80009f28 <dhcp_arp_reply>
8000af58:	e71ff06f          	j	8000adc8 <etharp_input+0x9c>
8000af5c:	00008067          	ret

8000af60 <etharp_request>:
8000af60:	02e50693          	addi	a3,a0,46
8000af64:	00058813          	mv	a6,a1
8000af68:	00100893          	li	a7,1
8000af6c:	84c18793          	addi	a5,gp,-1972 # 80002fe4 <ethzero>
8000af70:	00450713          	addi	a4,a0,4
8000af74:	85418613          	addi	a2,gp,-1964 # 80002fec <ethbroadcast>
8000af78:	00068593          	mv	a1,a3
8000af7c:	b01ff06f          	j	8000aa7c <etharp_raw>

8000af80 <etharp_tmr>:
8000af80:	fd010113          	addi	sp,sp,-48
8000af84:	02812423          	sw	s0,40(sp)
8000af88:	02912223          	sw	s1,36(sp)
8000af8c:	03212023          	sw	s2,32(sp)
8000af90:	01312e23          	sw	s3,28(sp)
8000af94:	01412c23          	sw	s4,24(sp)
8000af98:	01512a23          	sw	s5,20(sp)
8000af9c:	01612823          	sw	s6,16(sp)
8000afa0:	01712623          	sw	s7,12(sp)
8000afa4:	02112623          	sw	ra,44(sp)
8000afa8:	b4c18413          	addi	s0,gp,-1204 # 800032e4 <arp_table>
8000afac:	00000493          	li	s1,0
8000afb0:	12b00a13          	li	s4,299
8000afb4:	00100a93          	li	s5,1
8000afb8:	00300b13          	li	s6,3
8000afbc:	00400913          	li	s2,4
8000afc0:	00200b93          	li	s7,2
8000afc4:	00a00993          	li	s3,10
8000afc8:	01444703          	lbu	a4,20(s0)
8000afcc:	02070663          	beqz	a4,8000aff8 <etharp_tmr+0x78>
8000afd0:	01245783          	lhu	a5,18(s0)
8000afd4:	00178793          	addi	a5,a5,1
8000afd8:	01079793          	slli	a5,a5,0x10
8000afdc:	0107d793          	srli	a5,a5,0x10
8000afe0:	00f41923          	sh	a5,18(s0)
8000afe4:	00fa6663          	bltu	s4,a5,8000aff0 <etharp_tmr+0x70>
8000afe8:	05571463          	bne	a4,s5,8000b030 <etharp_tmr+0xb0>
8000afec:	04f97e63          	bgeu	s2,a5,8000b048 <etharp_tmr+0xc8>
8000aff0:	00048513          	mv	a0,s1
8000aff4:	895ff0ef          	jal	ra,8000a888 <etharp_free_entry>
8000aff8:	00148493          	addi	s1,s1,1
8000affc:	01840413          	addi	s0,s0,24
8000b000:	fd3494e3          	bne	s1,s3,8000afc8 <etharp_tmr+0x48>
8000b004:	02c12083          	lw	ra,44(sp)
8000b008:	02812403          	lw	s0,40(sp)
8000b00c:	02412483          	lw	s1,36(sp)
8000b010:	02012903          	lw	s2,32(sp)
8000b014:	01c12983          	lw	s3,28(sp)
8000b018:	01812a03          	lw	s4,24(sp)
8000b01c:	01412a83          	lw	s5,20(sp)
8000b020:	01012b03          	lw	s6,16(sp)
8000b024:	00c12b83          	lw	s7,12(sp)
8000b028:	03010113          	addi	sp,sp,48
8000b02c:	00008067          	ret
8000b030:	01671663          	bne	a4,s6,8000b03c <etharp_tmr+0xbc>
8000b034:	01240a23          	sb	s2,20(s0)
8000b038:	fc1ff06f          	j	8000aff8 <etharp_tmr+0x78>
8000b03c:	fb271ee3          	bne	a4,s2,8000aff8 <etharp_tmr+0x78>
8000b040:	01740a23          	sb	s7,20(s0)
8000b044:	fb5ff06f          	j	8000aff8 <etharp_tmr+0x78>
8000b048:	00842503          	lw	a0,8(s0)
8000b04c:	00440593          	addi	a1,s0,4
8000b050:	f11ff0ef          	jal	ra,8000af60 <etharp_request>
8000b054:	fa5ff06f          	j	8000aff8 <etharp_tmr+0x78>

8000b058 <etharp_output_to_arp_index>:
8000b058:	fe010113          	addi	sp,sp,-32
8000b05c:	01412423          	sw	s4,8(sp)
8000b060:	00058a13          	mv	s4,a1
8000b064:	00161593          	slli	a1,a2,0x1
8000b068:	00c58633          	add	a2,a1,a2
8000b06c:	00361613          	slli	a2,a2,0x3
8000b070:	b4c18593          	addi	a1,gp,-1204 # 800032e4 <arp_table>
8000b074:	00812c23          	sw	s0,24(sp)
8000b078:	00912a23          	sw	s1,20(sp)
8000b07c:	01212823          	sw	s2,16(sp)
8000b080:	01312623          	sw	s3,12(sp)
8000b084:	00112e23          	sw	ra,28(sp)
8000b088:	00c584b3          	add	s1,a1,a2
8000b08c:	0144c703          	lbu	a4,20(s1)
8000b090:	00c60413          	addi	s0,a2,12
8000b094:	00200793          	li	a5,2
8000b098:	00050913          	mv	s2,a0
8000b09c:	00858433          	add	s0,a1,s0
8000b0a0:	02e50993          	addi	s3,a0,46
8000b0a4:	02f71463          	bne	a4,a5,8000b0cc <etharp_output_to_arp_index+0x74>
8000b0a8:	0124d783          	lhu	a5,18(s1)
8000b0ac:	11c00713          	li	a4,284
8000b0b0:	04f77a63          	bgeu	a4,a5,8000b104 <etharp_output_to_arp_index+0xac>
8000b0b4:	00460613          	addi	a2,a2,4
8000b0b8:	00c585b3          	add	a1,a1,a2
8000b0bc:	ea5ff0ef          	jal	ra,8000af60 <etharp_request>
8000b0c0:	00051663          	bnez	a0,8000b0cc <etharp_output_to_arp_index+0x74>
8000b0c4:	00300793          	li	a5,3
8000b0c8:	00f48a23          	sb	a5,20(s1)
8000b0cc:	00040693          	mv	a3,s0
8000b0d0:	01812403          	lw	s0,24(sp)
8000b0d4:	01c12083          	lw	ra,28(sp)
8000b0d8:	01412483          	lw	s1,20(sp)
8000b0dc:	00098613          	mv	a2,s3
8000b0e0:	000a0593          	mv	a1,s4
8000b0e4:	00c12983          	lw	s3,12(sp)
8000b0e8:	00812a03          	lw	s4,8(sp)
8000b0ec:	00090513          	mv	a0,s2
8000b0f0:	01012903          	lw	s2,16(sp)
8000b0f4:	00001737          	lui	a4,0x1
8000b0f8:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b0fc:	02010113          	addi	sp,sp,32
8000b100:	15d0106f          	j	8000ca5c <ethernet_output>
8000b104:	10d00713          	li	a4,269
8000b108:	fcf772e3          	bgeu	a4,a5,8000b0cc <etharp_output_to_arp_index+0x74>
8000b10c:	00460613          	addi	a2,a2,4
8000b110:	00c58833          	add	a6,a1,a2
8000b114:	00100893          	li	a7,1
8000b118:	84c18793          	addi	a5,gp,-1972 # 80002fe4 <ethzero>
8000b11c:	00450713          	addi	a4,a0,4
8000b120:	00098693          	mv	a3,s3
8000b124:	00040613          	mv	a2,s0
8000b128:	00098593          	mv	a1,s3
8000b12c:	951ff0ef          	jal	ra,8000aa7c <etharp_raw>
8000b130:	f91ff06f          	j	8000b0c0 <etharp_output_to_arp_index+0x68>

8000b134 <etharp_query>:
8000b134:	fe010113          	addi	sp,sp,-32
8000b138:	01512223          	sw	s5,4(sp)
8000b13c:	00058a93          	mv	s5,a1
8000b140:	00912a23          	sw	s1,20(sp)
8000b144:	00050593          	mv	a1,a0
8000b148:	00050493          	mv	s1,a0
8000b14c:	000aa503          	lw	a0,0(s5)
8000b150:	01312623          	sw	s3,12(sp)
8000b154:	00112e23          	sw	ra,28(sp)
8000b158:	00812c23          	sw	s0,24(sp)
8000b15c:	01212823          	sw	s2,16(sp)
8000b160:	01412423          	sw	s4,8(sp)
8000b164:	00060993          	mv	s3,a2
8000b168:	318010ef          	jal	ra,8000c480 <ip4_addr_isbroadcast_u32>
8000b16c:	16051a63          	bnez	a0,8000b2e0 <etharp_query+0x1ac>
8000b170:	000aa783          	lw	a5,0(s5)
8000b174:	0e000713          	li	a4,224
8000b178:	0f07f693          	andi	a3,a5,240
8000b17c:	16e68263          	beq	a3,a4,8000b2e0 <etharp_query+0x1ac>
8000b180:	16078063          	beqz	a5,8000b2e0 <etharp_query+0x1ac>
8000b184:	00048613          	mv	a2,s1
8000b188:	00100593          	li	a1,1
8000b18c:	000a8513          	mv	a0,s5
8000b190:	f84ff0ef          	jal	ra,8000a914 <etharp_find_entry>
8000b194:	02055e63          	bgez	a0,8000b1d0 <etharp_query+0x9c>
8000b198:	00098a63          	beqz	s3,8000b1ac <etharp_query+0x78>
8000b19c:	a0c18793          	addi	a5,gp,-1524 # 800031a4 <lwip_stats>
8000b1a0:	0487a703          	lw	a4,72(a5)
8000b1a4:	00170713          	addi	a4,a4,1
8000b1a8:	04e7a423          	sw	a4,72(a5)
8000b1ac:	01c12083          	lw	ra,28(sp)
8000b1b0:	01812403          	lw	s0,24(sp)
8000b1b4:	01412483          	lw	s1,20(sp)
8000b1b8:	01012903          	lw	s2,16(sp)
8000b1bc:	00c12983          	lw	s3,12(sp)
8000b1c0:	00812a03          	lw	s4,8(sp)
8000b1c4:	00412a83          	lw	s5,4(sp)
8000b1c8:	02010113          	addi	sp,sp,32
8000b1cc:	00008067          	ret
8000b1d0:	0ff57413          	andi	s0,a0,255
8000b1d4:	00141a13          	slli	s4,s0,0x1
8000b1d8:	008a0733          	add	a4,s4,s0
8000b1dc:	b4c18793          	addi	a5,gp,-1204 # 800032e4 <arp_table>
8000b1e0:	00371713          	slli	a4,a4,0x3
8000b1e4:	00e787b3          	add	a5,a5,a4
8000b1e8:	0147c703          	lbu	a4,20(a5)
8000b1ec:	b4c18913          	addi	s2,gp,-1204 # 800032e4 <arp_table>
8000b1f0:	08070663          	beqz	a4,8000b27c <etharp_query+0x148>
8000b1f4:	fff00513          	li	a0,-1
8000b1f8:	00099a63          	bnez	s3,8000b20c <etharp_query+0xd8>
8000b1fc:	000a8593          	mv	a1,s5
8000b200:	00048513          	mv	a0,s1
8000b204:	d5dff0ef          	jal	ra,8000af60 <etharp_request>
8000b208:	fa0982e3          	beqz	s3,8000b1ac <etharp_query+0x78>
8000b20c:	008a07b3          	add	a5,s4,s0
8000b210:	00379793          	slli	a5,a5,0x3
8000b214:	00f907b3          	add	a5,s2,a5
8000b218:	0147c703          	lbu	a4,20(a5)
8000b21c:	00100793          	li	a5,1
8000b220:	06e7f663          	bgeu	a5,a4,8000b28c <etharp_query+0x158>
8000b224:	00048863          	beqz	s1,8000b234 <etharp_query+0x100>
8000b228:	03c4a783          	lw	a5,60(s1)
8000b22c:	00078463          	beqz	a5,8000b234 <etharp_query+0x100>
8000b230:	00878023          	sb	s0,0(a5)
8000b234:	008a06b3          	add	a3,s4,s0
8000b238:	00369693          	slli	a3,a3,0x3
8000b23c:	01812403          	lw	s0,24(sp)
8000b240:	00c68693          	addi	a3,a3,12
8000b244:	01c12083          	lw	ra,28(sp)
8000b248:	00812a03          	lw	s4,8(sp)
8000b24c:	00412a83          	lw	s5,4(sp)
8000b250:	00d906b3          	add	a3,s2,a3
8000b254:	02e48613          	addi	a2,s1,46
8000b258:	01012903          	lw	s2,16(sp)
8000b25c:	00098593          	mv	a1,s3
8000b260:	00048513          	mv	a0,s1
8000b264:	00c12983          	lw	s3,12(sp)
8000b268:	01412483          	lw	s1,20(sp)
8000b26c:	00001737          	lui	a4,0x1
8000b270:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b274:	02010113          	addi	sp,sp,32
8000b278:	7e40106f          	j	8000ca5c <ethernet_output>
8000b27c:	00100713          	li	a4,1
8000b280:	00e78a23          	sb	a4,20(a5)
8000b284:	0097a423          	sw	s1,8(a5)
8000b288:	f75ff06f          	j	8000b1fc <etharp_query+0xc8>
8000b28c:	f2f710e3          	bne	a4,a5,8000b1ac <etharp_query+0x78>
8000b290:	00098793          	mv	a5,s3
8000b294:	00c7c703          	lbu	a4,12(a5)
8000b298:	04077713          	andi	a4,a4,64
8000b29c:	04071663          	bnez	a4,8000b2e8 <etharp_query+0x1b4>
8000b2a0:	0007a783          	lw	a5,0(a5)
8000b2a4:	fe0798e3          	bnez	a5,8000b294 <etharp_query+0x160>
8000b2a8:	00098513          	mv	a0,s3
8000b2ac:	810fc0ef          	jal	ra,800072bc <pbuf_ref>
8000b2b0:	008a07b3          	add	a5,s4,s0
8000b2b4:	00379793          	slli	a5,a5,0x3
8000b2b8:	00f907b3          	add	a5,s2,a5
8000b2bc:	0007a503          	lw	a0,0(a5)
8000b2c0:	00050463          	beqz	a0,8000b2c8 <etharp_query+0x194>
8000b2c4:	c11fb0ef          	jal	ra,80006ed4 <pbuf_free>
8000b2c8:	008a0433          	add	s0,s4,s0
8000b2cc:	00341413          	slli	s0,s0,0x3
8000b2d0:	00890433          	add	s0,s2,s0
8000b2d4:	01342023          	sw	s3,0(s0)
8000b2d8:	00000513          	li	a0,0
8000b2dc:	ed1ff06f          	j	8000b1ac <etharp_query+0x78>
8000b2e0:	ff000513          	li	a0,-16
8000b2e4:	ec9ff06f          	j	8000b1ac <etharp_query+0x78>
8000b2e8:	00098613          	mv	a2,s3
8000b2ec:	28000593          	li	a1,640
8000b2f0:	01000513          	li	a0,16
8000b2f4:	c78fc0ef          	jal	ra,8000776c <pbuf_clone>
8000b2f8:	00050993          	mv	s3,a0
8000b2fc:	fa051ae3          	bnez	a0,8000b2b0 <etharp_query+0x17c>
8000b300:	a0c18793          	addi	a5,gp,-1524 # 800031a4 <lwip_stats>
8000b304:	0487a703          	lw	a4,72(a5)
8000b308:	fff00513          	li	a0,-1
8000b30c:	00170713          	addi	a4,a4,1
8000b310:	04e7a423          	sw	a4,72(a5)
8000b314:	e99ff06f          	j	8000b1ac <etharp_query+0x78>

8000b318 <etharp_output>:
8000b318:	fe010113          	addi	sp,sp,-32
8000b31c:	00812c23          	sw	s0,24(sp)
8000b320:	00912a23          	sw	s1,20(sp)
8000b324:	01212823          	sw	s2,16(sp)
8000b328:	00112e23          	sw	ra,28(sp)
8000b32c:	00050413          	mv	s0,a0
8000b330:	00058913          	mv	s2,a1
8000b334:	00050593          	mv	a1,a0
8000b338:	00062503          	lw	a0,0(a2)
8000b33c:	00060493          	mv	s1,a2
8000b340:	140010ef          	jal	ra,8000c480 <ip4_addr_isbroadcast_u32>
8000b344:	16051863          	bnez	a0,8000b4b4 <etharp_output+0x19c>
8000b348:	0004a783          	lw	a5,0(s1)
8000b34c:	0e000713          	li	a4,224
8000b350:	0f07f613          	andi	a2,a5,240
8000b354:	04e61863          	bne	a2,a4,8000b3a4 <etharp_output+0x8c>
8000b358:	00100793          	li	a5,1
8000b35c:	00f11423          	sh	a5,8(sp)
8000b360:	05e00793          	li	a5,94
8000b364:	00f10523          	sb	a5,10(sp)
8000b368:	0014c783          	lbu	a5,1(s1)
8000b36c:	00810693          	addi	a3,sp,8
8000b370:	07f7f793          	andi	a5,a5,127
8000b374:	00f105a3          	sb	a5,11(sp)
8000b378:	0024c783          	lbu	a5,2(s1)
8000b37c:	00f10623          	sb	a5,12(sp)
8000b380:	0034c783          	lbu	a5,3(s1)
8000b384:	00f106a3          	sb	a5,13(sp)
8000b388:	00001737          	lui	a4,0x1
8000b38c:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b390:	02e40613          	addi	a2,s0,46
8000b394:	00090593          	mv	a1,s2
8000b398:	00040513          	mv	a0,s0
8000b39c:	6c0010ef          	jal	ra,8000ca5c <ethernet_output>
8000b3a0:	0a40006f          	j	8000b444 <etharp_output+0x12c>
8000b3a4:	00442703          	lw	a4,4(s0)
8000b3a8:	00842603          	lw	a2,8(s0)
8000b3ac:	00050693          	mv	a3,a0
8000b3b0:	00e7c733          	xor	a4,a5,a4
8000b3b4:	00c77733          	and	a4,a4,a2
8000b3b8:	02070463          	beqz	a4,8000b3e0 <etharp_output+0xc8>
8000b3bc:	01079793          	slli	a5,a5,0x10
8000b3c0:	00010737          	lui	a4,0x10
8000b3c4:	0107d793          	srli	a5,a5,0x10
8000b3c8:	ea970713          	addi	a4,a4,-343 # fea9 <_stack_size+0xf6a9>
8000b3cc:	00e78a63          	beq	a5,a4,8000b3e0 <etharp_output+0xc8>
8000b3d0:	00c42783          	lw	a5,12(s0)
8000b3d4:	ffc00513          	li	a0,-4
8000b3d8:	06078663          	beqz	a5,8000b444 <etharp_output+0x12c>
8000b3dc:	00c40493          	addi	s1,s0,12
8000b3e0:	03c42583          	lw	a1,60(s0)
8000b3e4:	b4c18793          	addi	a5,gp,-1204 # 800032e4 <arp_table>
8000b3e8:	06058a63          	beqz	a1,8000b45c <etharp_output+0x144>
8000b3ec:	0005c603          	lbu	a2,0(a1)
8000b3f0:	00900713          	li	a4,9
8000b3f4:	06c76463          	bltu	a4,a2,8000b45c <etharp_output+0x144>
8000b3f8:	00161713          	slli	a4,a2,0x1
8000b3fc:	00c70733          	add	a4,a4,a2
8000b400:	00371713          	slli	a4,a4,0x3
8000b404:	00e78733          	add	a4,a5,a4
8000b408:	01474803          	lbu	a6,20(a4)
8000b40c:	00100513          	li	a0,1
8000b410:	05057663          	bgeu	a0,a6,8000b45c <etharp_output+0x144>
8000b414:	00872503          	lw	a0,8(a4)
8000b418:	04851263          	bne	a0,s0,8000b45c <etharp_output+0x144>
8000b41c:	0004a503          	lw	a0,0(s1)
8000b420:	00472703          	lw	a4,4(a4)
8000b424:	02e51c63          	bne	a0,a4,8000b45c <etharp_output+0x144>
8000b428:	a0c18793          	addi	a5,gp,-1524 # 800031a4 <lwip_stats>
8000b42c:	05c7a703          	lw	a4,92(a5)
8000b430:	00170713          	addi	a4,a4,1
8000b434:	04e7ae23          	sw	a4,92(a5)
8000b438:	00090593          	mv	a1,s2
8000b43c:	00040513          	mv	a0,s0
8000b440:	c19ff0ef          	jal	ra,8000b058 <etharp_output_to_arp_index>
8000b444:	01c12083          	lw	ra,28(sp)
8000b448:	01812403          	lw	s0,24(sp)
8000b44c:	01412483          	lw	s1,20(sp)
8000b450:	01012903          	lw	s2,16(sp)
8000b454:	02010113          	addi	sp,sp,32
8000b458:	00008067          	ret
8000b45c:	00100613          	li	a2,1
8000b460:	00a00713          	li	a4,10
8000b464:	0147c503          	lbu	a0,20(a5)
8000b468:	02a67463          	bgeu	a2,a0,8000b490 <etharp_output+0x178>
8000b46c:	0087a503          	lw	a0,8(a5)
8000b470:	02851063          	bne	a0,s0,8000b490 <etharp_output+0x178>
8000b474:	0004a803          	lw	a6,0(s1)
8000b478:	0047a503          	lw	a0,4(a5)
8000b47c:	00a81a63          	bne	a6,a0,8000b490 <etharp_output+0x178>
8000b480:	00058463          	beqz	a1,8000b488 <etharp_output+0x170>
8000b484:	00d58023          	sb	a3,0(a1)
8000b488:	00068613          	mv	a2,a3
8000b48c:	fadff06f          	j	8000b438 <etharp_output+0x120>
8000b490:	00168693          	addi	a3,a3,1
8000b494:	0ff6f693          	andi	a3,a3,255
8000b498:	01878793          	addi	a5,a5,24
8000b49c:	fce694e3          	bne	a3,a4,8000b464 <etharp_output+0x14c>
8000b4a0:	00090613          	mv	a2,s2
8000b4a4:	00048593          	mv	a1,s1
8000b4a8:	00040513          	mv	a0,s0
8000b4ac:	c89ff0ef          	jal	ra,8000b134 <etharp_query>
8000b4b0:	f95ff06f          	j	8000b444 <etharp_output+0x12c>
8000b4b4:	85418693          	addi	a3,gp,-1964 # 80002fec <ethbroadcast>
8000b4b8:	ed1ff06f          	j	8000b388 <etharp_output+0x70>

8000b4bc <icmp_input>:
8000b4bc:	fd010113          	addi	sp,sp,-48
8000b4c0:	02912223          	sw	s1,36(sp)
8000b4c4:	02812423          	sw	s0,40(sp)
8000b4c8:	01712623          	sw	s7,12(sp)
8000b4cc:	02112623          	sw	ra,44(sp)
8000b4d0:	03212023          	sw	s2,32(sp)
8000b4d4:	01312e23          	sw	s3,28(sp)
8000b4d8:	01412c23          	sw	s4,24(sp)
8000b4dc:	01512a23          	sw	s5,20(sp)
8000b4e0:	01612823          	sw	s6,16(sp)
8000b4e4:	01812423          	sw	s8,8(sp)
8000b4e8:	a0c18793          	addi	a5,gp,-1524 # 800031a4 <lwip_stats>
8000b4ec:	0c47a703          	lw	a4,196(a5)
8000b4f0:	00050413          	mv	s0,a0
8000b4f4:	00170713          	addi	a4,a4,1
8000b4f8:	0ce7a223          	sw	a4,196(a5)
8000b4fc:	9f418713          	addi	a4,gp,-1548 # 8000318c <ip_data>
8000b500:	00872c03          	lw	s8,8(a4)
8000b504:	01300713          	li	a4,19
8000b508:	a0c18493          	addi	s1,gp,-1524 # 800031a4 <lwip_stats>
8000b50c:	000c4a83          	lbu	s5,0(s8)
8000b510:	00fafa93          	andi	s5,s5,15
8000b514:	002a9a93          	slli	s5,s5,0x2
8000b518:	2b577863          	bgeu	a4,s5,8000b7c8 <icmp_input+0x30c>
8000b51c:	00a55683          	lhu	a3,10(a0)
8000b520:	00300713          	li	a4,3
8000b524:	2ad77263          	bgeu	a4,a3,8000b7c8 <icmp_input+0x30c>
8000b528:	00452703          	lw	a4,4(a0)
8000b52c:	00074703          	lbu	a4,0(a4)
8000b530:	22070663          	beqz	a4,8000b75c <icmp_input+0x2a0>
8000b534:	00800693          	li	a3,8
8000b538:	26d71a63          	bne	a4,a3,8000b7ac <icmp_input+0x2f0>
8000b53c:	9f418b93          	addi	s7,gp,-1548 # 8000318c <ip_data>
8000b540:	014ba503          	lw	a0,20(s7)
8000b544:	0e000793          	li	a5,224
8000b548:	00058993          	mv	s3,a1
8000b54c:	0f057713          	andi	a4,a0,240
8000b550:	00458913          	addi	s2,a1,4
8000b554:	00f70463          	beq	a4,a5,8000b55c <icmp_input+0xa0>
8000b558:	a0818913          	addi	s2,gp,-1528 # 800031a0 <ip_data+0x14>
8000b55c:	000ba583          	lw	a1,0(s7)
8000b560:	721000ef          	jal	ra,8000c480 <ip4_addr_isbroadcast_u32>
8000b564:	00050463          	beqz	a0,8000b56c <icmp_input+0xb0>
8000b568:	00498913          	addi	s2,s3,4
8000b56c:	00845703          	lhu	a4,8(s0)
8000b570:	00700793          	li	a5,7
8000b574:	24e7fa63          	bgeu	a5,a4,8000b7c8 <icmp_input+0x30c>
8000b578:	00040513          	mv	a0,s0
8000b57c:	d4dfa0ef          	jal	ra,800062c8 <inet_chksum_pbuf>
8000b580:	04050463          	beqz	a0,8000b5c8 <icmp_input+0x10c>
8000b584:	00040513          	mv	a0,s0
8000b588:	94dfb0ef          	jal	ra,80006ed4 <pbuf_free>
8000b58c:	0d04a783          	lw	a5,208(s1)
8000b590:	00178793          	addi	a5,a5,1
8000b594:	0cf4a823          	sw	a5,208(s1)
8000b598:	02c12083          	lw	ra,44(sp)
8000b59c:	02812403          	lw	s0,40(sp)
8000b5a0:	02412483          	lw	s1,36(sp)
8000b5a4:	02012903          	lw	s2,32(sp)
8000b5a8:	01c12983          	lw	s3,28(sp)
8000b5ac:	01812a03          	lw	s4,24(sp)
8000b5b0:	01412a83          	lw	s5,20(sp)
8000b5b4:	01012b03          	lw	s6,16(sp)
8000b5b8:	00c12b83          	lw	s7,12(sp)
8000b5bc:	00812c03          	lw	s8,8(sp)
8000b5c0:	03010113          	addi	sp,sp,48
8000b5c4:	00008067          	ret
8000b5c8:	010a8b13          	addi	s6,s5,16
8000b5cc:	010a9a13          	slli	s4,s5,0x10
8000b5d0:	000b0593          	mv	a1,s6
8000b5d4:	00040513          	mv	a0,s0
8000b5d8:	010a5a13          	srli	s4,s4,0x10
8000b5dc:	861fb0ef          	jal	ra,80006e3c <pbuf_add_header>
8000b5e0:	1a050863          	beqz	a0,8000b790 <icmp_input+0x2d4>
8000b5e4:	00845783          	lhu	a5,8(s0)
8000b5e8:	014785b3          	add	a1,a5,s4
8000b5ec:	01059593          	slli	a1,a1,0x10
8000b5f0:	0105d593          	srli	a1,a1,0x10
8000b5f4:	02f5e463          	bltu	a1,a5,8000b61c <icmp_input+0x160>
8000b5f8:	28000613          	li	a2,640
8000b5fc:	01000513          	li	a0,16
8000b600:	9a9fb0ef          	jal	ra,80006fa8 <pbuf_alloc>
8000b604:	00050b13          	mv	s6,a0
8000b608:	00050a63          	beqz	a0,8000b61c <icmp_input+0x160>
8000b60c:	00a55703          	lhu	a4,10(a0)
8000b610:	008a8793          	addi	a5,s5,8
8000b614:	02f77063          	bgeu	a4,a5,8000b634 <icmp_input+0x178>
8000b618:	8bdfb0ef          	jal	ra,80006ed4 <pbuf_free>
8000b61c:	00040513          	mv	a0,s0
8000b620:	8b5fb0ef          	jal	ra,80006ed4 <pbuf_free>
8000b624:	0e84a783          	lw	a5,232(s1)
8000b628:	00178793          	addi	a5,a5,1
8000b62c:	0ef4a423          	sw	a5,232(s1)
8000b630:	f69ff06f          	j	8000b598 <icmp_input+0xdc>
8000b634:	00452503          	lw	a0,4(a0)
8000b638:	000c0593          	mv	a1,s8
8000b63c:	000a8613          	mv	a2,s5
8000b640:	285020ef          	jal	ra,8000e0c4 <memcpy>
8000b644:	000a8593          	mv	a1,s5
8000b648:	000b0513          	mv	a0,s6
8000b64c:	801fb0ef          	jal	ra,80006e4c <pbuf_remove_header>
8000b650:	00050663          	beqz	a0,8000b65c <icmp_input+0x1a0>
8000b654:	000b0513          	mv	a0,s6
8000b658:	fc1ff06f          	j	8000b618 <icmp_input+0x15c>
8000b65c:	00040593          	mv	a1,s0
8000b660:	000b0513          	mv	a0,s6
8000b664:	d45fb0ef          	jal	ra,800073a8 <pbuf_copy>
8000b668:	fe0516e3          	bnez	a0,8000b654 <icmp_input+0x198>
8000b66c:	00040513          	mv	a0,s0
8000b670:	865fb0ef          	jal	ra,80006ed4 <pbuf_free>
8000b674:	000b0413          	mv	s0,s6
8000b678:	000a8593          	mv	a1,s5
8000b67c:	00040513          	mv	a0,s0
8000b680:	00442b03          	lw	s6,4(s0)
8000b684:	fb8fb0ef          	jal	ra,80006e3c <pbuf_add_header>
8000b688:	0c051a63          	bnez	a0,8000b75c <icmp_input+0x2a0>
8000b68c:	00092783          	lw	a5,0(s2)
8000b690:	00442a83          	lw	s5,4(s0)
8000b694:	0087d713          	srli	a4,a5,0x8
8000b698:	00fa8623          	sb	a5,12(s5)
8000b69c:	00ea86a3          	sb	a4,13(s5)
8000b6a0:	0107d713          	srli	a4,a5,0x10
8000b6a4:	0187d793          	srli	a5,a5,0x18
8000b6a8:	00ea8723          	sb	a4,14(s5)
8000b6ac:	00fa87a3          	sb	a5,15(s5)
8000b6b0:	010ba783          	lw	a5,16(s7)
8000b6b4:	0087d713          	srli	a4,a5,0x8
8000b6b8:	00fa8823          	sb	a5,16(s5)
8000b6bc:	00ea88a3          	sb	a4,17(s5)
8000b6c0:	0107d713          	srli	a4,a5,0x10
8000b6c4:	0187d793          	srli	a5,a5,0x18
8000b6c8:	00ea8923          	sb	a4,18(s5)
8000b6cc:	00fa89a3          	sb	a5,19(s5)
8000b6d0:	003b4783          	lbu	a5,3(s6)
8000b6d4:	002b4703          	lbu	a4,2(s6)
8000b6d8:	000b0023          	sb	zero,0(s6)
8000b6dc:	00879793          	slli	a5,a5,0x8
8000b6e0:	00e7e7b3          	or	a5,a5,a4
8000b6e4:	00010737          	lui	a4,0x10
8000b6e8:	ff770713          	addi	a4,a4,-9 # fff7 <_stack_size+0xf7f7>
8000b6ec:	0af77c63          	bgeu	a4,a5,8000b7a4 <icmp_input+0x2e8>
8000b6f0:	00978793          	addi	a5,a5,9
8000b6f4:	01079793          	slli	a5,a5,0x10
8000b6f8:	0107d793          	srli	a5,a5,0x10
8000b6fc:	00fb0123          	sb	a5,2(s6)
8000b700:	0087d793          	srli	a5,a5,0x8
8000b704:	00fb01a3          	sb	a5,3(s6)
8000b708:	fff00793          	li	a5,-1
8000b70c:	00fa8423          	sb	a5,8(s5)
8000b710:	000a0593          	mv	a1,s4
8000b714:	000a8523          	sb	zero,10(s5)
8000b718:	000a85a3          	sb	zero,11(s5)
8000b71c:	000a8513          	mv	a0,s5
8000b720:	b85fa0ef          	jal	ra,800062a4 <inet_chksum>
8000b724:	00aa8523          	sb	a0,10(s5)
8000b728:	00855513          	srli	a0,a0,0x8
8000b72c:	00aa85a3          	sb	a0,11(s5)
8000b730:	0c04a783          	lw	a5,192(s1)
8000b734:	00098813          	mv	a6,s3
8000b738:	00000713          	li	a4,0
8000b73c:	00178793          	addi	a5,a5,1
8000b740:	0cf4a023          	sw	a5,192(s1)
8000b744:	0ff00693          	li	a3,255
8000b748:	00100793          	li	a5,1
8000b74c:	00000613          	li	a2,0
8000b750:	00090593          	mv	a1,s2
8000b754:	00040513          	mv	a0,s0
8000b758:	3fd000ef          	jal	ra,8000c354 <ip4_output_if>
8000b75c:	00040513          	mv	a0,s0
8000b760:	02812403          	lw	s0,40(sp)
8000b764:	02c12083          	lw	ra,44(sp)
8000b768:	02412483          	lw	s1,36(sp)
8000b76c:	02012903          	lw	s2,32(sp)
8000b770:	01c12983          	lw	s3,28(sp)
8000b774:	01812a03          	lw	s4,24(sp)
8000b778:	01412a83          	lw	s5,20(sp)
8000b77c:	01012b03          	lw	s6,16(sp)
8000b780:	00c12b83          	lw	s7,12(sp)
8000b784:	00812c03          	lw	s8,8(sp)
8000b788:	03010113          	addi	sp,sp,48
8000b78c:	f48fb06f          	j	80006ed4 <pbuf_free>
8000b790:	000b0593          	mv	a1,s6
8000b794:	00040513          	mv	a0,s0
8000b798:	eb4fb0ef          	jal	ra,80006e4c <pbuf_remove_header>
8000b79c:	ec050ee3          	beqz	a0,8000b678 <icmp_input+0x1bc>
8000b7a0:	e7dff06f          	j	8000b61c <icmp_input+0x160>
8000b7a4:	00878793          	addi	a5,a5,8
8000b7a8:	f4dff06f          	j	8000b6f4 <icmp_input+0x238>
8000b7ac:	0e07a703          	lw	a4,224(a5)
8000b7b0:	00170713          	addi	a4,a4,1
8000b7b4:	0ee7a023          	sw	a4,224(a5)
8000b7b8:	0cc7a703          	lw	a4,204(a5)
8000b7bc:	00170713          	addi	a4,a4,1
8000b7c0:	0ce7a623          	sw	a4,204(a5)
8000b7c4:	f99ff06f          	j	8000b75c <icmp_input+0x2a0>
8000b7c8:	00040513          	mv	a0,s0
8000b7cc:	f08fb0ef          	jal	ra,80006ed4 <pbuf_free>
8000b7d0:	0d44a783          	lw	a5,212(s1)
8000b7d4:	00178793          	addi	a5,a5,1
8000b7d8:	0cf4aa23          	sw	a5,212(s1)
8000b7dc:	dbdff06f          	j	8000b598 <icmp_input+0xdc>

8000b7e0 <icmp_dest_unreach>:
8000b7e0:	fc010113          	addi	sp,sp,-64
8000b7e4:	03312623          	sw	s3,44(sp)
8000b7e8:	03412423          	sw	s4,40(sp)
8000b7ec:	00050993          	mv	s3,a0
8000b7f0:	00058a13          	mv	s4,a1
8000b7f4:	28000613          	li	a2,640
8000b7f8:	02400593          	li	a1,36
8000b7fc:	02400513          	li	a0,36
8000b800:	02112e23          	sw	ra,60(sp)
8000b804:	02812c23          	sw	s0,56(sp)
8000b808:	02912a23          	sw	s1,52(sp)
8000b80c:	03212823          	sw	s2,48(sp)
8000b810:	f98fb0ef          	jal	ra,80006fa8 <pbuf_alloc>
8000b814:	0c050a63          	beqz	a0,8000b8e8 <icmp_dest_unreach+0x108>
8000b818:	00452403          	lw	s0,4(a0)
8000b81c:	00300793          	li	a5,3
8000b820:	0049a903          	lw	s2,4(s3)
8000b824:	00f40023          	sb	a5,0(s0)
8000b828:	014400a3          	sb	s4,1(s0)
8000b82c:	00040223          	sb	zero,4(s0)
8000b830:	000402a3          	sb	zero,5(s0)
8000b834:	00040323          	sb	zero,6(s0)
8000b838:	000403a3          	sb	zero,7(s0)
8000b83c:	00050493          	mv	s1,a0
8000b840:	00452503          	lw	a0,4(a0)
8000b844:	0049a583          	lw	a1,4(s3)
8000b848:	01c00613          	li	a2,28
8000b84c:	00850513          	addi	a0,a0,8
8000b850:	075020ef          	jal	ra,8000e0c4 <memcpy>
8000b854:	00d94703          	lbu	a4,13(s2)
8000b858:	00c94783          	lbu	a5,12(s2)
8000b85c:	01c10513          	addi	a0,sp,28
8000b860:	00871713          	slli	a4,a4,0x8
8000b864:	00f76733          	or	a4,a4,a5
8000b868:	00e94783          	lbu	a5,14(s2)
8000b86c:	01079793          	slli	a5,a5,0x10
8000b870:	00e7e733          	or	a4,a5,a4
8000b874:	00f94783          	lbu	a5,15(s2)
8000b878:	01879793          	slli	a5,a5,0x18
8000b87c:	00e7e7b3          	or	a5,a5,a4
8000b880:	00f12e23          	sw	a5,28(sp)
8000b884:	438000ef          	jal	ra,8000bcbc <ip4_route>
8000b888:	00a12623          	sw	a0,12(sp)
8000b88c:	04050a63          	beqz	a0,8000b8e0 <icmp_dest_unreach+0x100>
8000b890:	00040123          	sb	zero,2(s0)
8000b894:	000401a3          	sb	zero,3(s0)
8000b898:	00a4d583          	lhu	a1,10(s1)
8000b89c:	00040513          	mv	a0,s0
8000b8a0:	a05fa0ef          	jal	ra,800062a4 <inet_chksum>
8000b8a4:	00a40123          	sb	a0,2(s0)
8000b8a8:	00855513          	srli	a0,a0,0x8
8000b8ac:	00a401a3          	sb	a0,3(s0)
8000b8b0:	a0c18793          	addi	a5,gp,-1524 # 800031a4 <lwip_stats>
8000b8b4:	0c07a703          	lw	a4,192(a5)
8000b8b8:	00c12803          	lw	a6,12(sp)
8000b8bc:	0ff00693          	li	a3,255
8000b8c0:	00170713          	addi	a4,a4,1
8000b8c4:	0ce7a023          	sw	a4,192(a5)
8000b8c8:	01c10613          	addi	a2,sp,28
8000b8cc:	00100793          	li	a5,1
8000b8d0:	00000713          	li	a4,0
8000b8d4:	00000593          	li	a1,0
8000b8d8:	00048513          	mv	a0,s1
8000b8dc:	279000ef          	jal	ra,8000c354 <ip4_output_if>
8000b8e0:	00048513          	mv	a0,s1
8000b8e4:	df0fb0ef          	jal	ra,80006ed4 <pbuf_free>
8000b8e8:	03c12083          	lw	ra,60(sp)
8000b8ec:	03812403          	lw	s0,56(sp)
8000b8f0:	03412483          	lw	s1,52(sp)
8000b8f4:	03012903          	lw	s2,48(sp)
8000b8f8:	02c12983          	lw	s3,44(sp)
8000b8fc:	02812a03          	lw	s4,40(sp)
8000b900:	04010113          	addi	sp,sp,64
8000b904:	00008067          	ret

8000b908 <ipfrag_free_pbuf_custom>:
8000b908:	00050593          	mv	a1,a0
8000b90c:	01452503          	lw	a0,20(a0)
8000b910:	02050463          	beqz	a0,8000b938 <ipfrag_free_pbuf_custom+0x30>
8000b914:	fe010113          	addi	sp,sp,-32
8000b918:	00112e23          	sw	ra,28(sp)
8000b91c:	00b12623          	sw	a1,12(sp)
8000b920:	db4fb0ef          	jal	ra,80006ed4 <pbuf_free>
8000b924:	00c12583          	lw	a1,12(sp)
8000b928:	01c12083          	lw	ra,28(sp)
8000b92c:	00200513          	li	a0,2
8000b930:	02010113          	addi	sp,sp,32
8000b934:	cedfa06f          	j	80006620 <memp_free>
8000b938:	00200513          	li	a0,2
8000b93c:	ff9ff06f          	j	8000b934 <ipfrag_free_pbuf_custom+0x2c>

8000b940 <ip4_frag>:
8000b940:	fa010113          	addi	sp,sp,-96
8000b944:	04112e23          	sw	ra,92(sp)
8000b948:	04812c23          	sw	s0,88(sp)
8000b94c:	04912a23          	sw	s1,84(sp)
8000b950:	05212823          	sw	s2,80(sp)
8000b954:	05312623          	sw	s3,76(sp)
8000b958:	05412423          	sw	s4,72(sp)
8000b95c:	05512223          	sw	s5,68(sp)
8000b960:	05612023          	sw	s6,64(sp)
8000b964:	03712e23          	sw	s7,60(sp)
8000b968:	03812c23          	sw	s8,56(sp)
8000b96c:	03912a23          	sw	s9,52(sp)
8000b970:	03a12823          	sw	s10,48(sp)
8000b974:	03b12623          	sw	s11,44(sp)
8000b978:	02c5d783          	lhu	a5,44(a1)
8000b97c:	00452c03          	lw	s8,4(a0)
8000b980:	00c12623          	sw	a2,12(sp)
8000b984:	fec78713          	addi	a4,a5,-20
8000b988:	41f75793          	srai	a5,a4,0x1f
8000b98c:	0077f793          	andi	a5,a5,7
8000b990:	00e787b3          	add	a5,a5,a4
8000b994:	4037d793          	srai	a5,a5,0x3
8000b998:	01079793          	slli	a5,a5,0x10
8000b99c:	0107d793          	srli	a5,a5,0x10
8000b9a0:	00f12223          	sw	a5,4(sp)
8000b9a4:	000c4783          	lbu	a5,0(s8)
8000b9a8:	01400713          	li	a4,20
8000b9ac:	00f7f793          	andi	a5,a5,15
8000b9b0:	00279793          	slli	a5,a5,0x2
8000b9b4:	2ae79663          	bne	a5,a4,8000bc60 <ip4_frag+0x320>
8000b9b8:	00a55703          	lhu	a4,10(a0)
8000b9bc:	01300793          	li	a5,19
8000b9c0:	00050413          	mv	s0,a0
8000b9c4:	ffa00513          	li	a0,-6
8000b9c8:	06e7fc63          	bgeu	a5,a4,8000ba40 <ip4_frag+0x100>
8000b9cc:	007c4783          	lbu	a5,7(s8)
8000b9d0:	006c4503          	lbu	a0,6(s8)
8000b9d4:	00058c93          	mv	s9,a1
8000b9d8:	00879793          	slli	a5,a5,0x8
8000b9dc:	00a7e533          	or	a0,a5,a0
8000b9e0:	ad0fa0ef          	jal	ra,80005cb0 <lwip_htons>
8000b9e4:	000027b7          	lui	a5,0x2
8000b9e8:	00f577b3          	and	a5,a0,a5
8000b9ec:	00f12423          	sw	a5,8(sp)
8000b9f0:	00412783          	lw	a5,4(sp)
8000b9f4:	00845483          	lhu	s1,8(s0)
8000b9f8:	01351b93          	slli	s7,a0,0x13
8000b9fc:	00379793          	slli	a5,a5,0x3
8000ba00:	01079793          	slli	a5,a5,0x10
8000ba04:	0107d793          	srli	a5,a5,0x10
8000ba08:	fec48493          	addi	s1,s1,-20
8000ba0c:	00f12023          	sw	a5,0(sp)
8000ba10:	00f11923          	sh	a5,18(sp)
8000ba14:	8000c7b7          	lui	a5,0x8000c
8000ba18:	01049493          	slli	s1,s1,0x10
8000ba1c:	90878793          	addi	a5,a5,-1784 # 8000b908 <_ram_heap_end+0xffff9908>
8000ba20:	013bdb93          	srli	s7,s7,0x13
8000ba24:	0104d493          	srli	s1,s1,0x10
8000ba28:	01400a13          	li	s4,20
8000ba2c:	00000913          	li	s2,0
8000ba30:	00f12a23          	sw	a5,20(sp)
8000ba34:	a0c18d13          	addi	s10,gp,-1524 # 800031a4 <lwip_stats>
8000ba38:	04049263          	bnez	s1,8000ba7c <ip4_frag+0x13c>
8000ba3c:	00000513          	li	a0,0
8000ba40:	05c12083          	lw	ra,92(sp)
8000ba44:	05812403          	lw	s0,88(sp)
8000ba48:	05412483          	lw	s1,84(sp)
8000ba4c:	05012903          	lw	s2,80(sp)
8000ba50:	04c12983          	lw	s3,76(sp)
8000ba54:	04812a03          	lw	s4,72(sp)
8000ba58:	04412a83          	lw	s5,68(sp)
8000ba5c:	04012b03          	lw	s6,64(sp)
8000ba60:	03c12b83          	lw	s7,60(sp)
8000ba64:	03812c03          	lw	s8,56(sp)
8000ba68:	03412c83          	lw	s9,52(sp)
8000ba6c:	03012d03          	lw	s10,48(sp)
8000ba70:	02c12d83          	lw	s11,44(sp)
8000ba74:	06010113          	addi	sp,sp,96
8000ba78:	00008067          	ret
8000ba7c:	00012783          	lw	a5,0(sp)
8000ba80:	01215a83          	lhu	s5,18(sp)
8000ba84:	00f4f463          	bgeu	s1,a5,8000ba8c <ip4_frag+0x14c>
8000ba88:	00048a93          	mv	s5,s1
8000ba8c:	28000613          	li	a2,640
8000ba90:	01400593          	li	a1,20
8000ba94:	01000513          	li	a0,16
8000ba98:	010a9a93          	slli	s5,s5,0x10
8000ba9c:	d0cfb0ef          	jal	ra,80006fa8 <pbuf_alloc>
8000baa0:	010ada93          	srli	s5,s5,0x10
8000baa4:	00050b13          	mv	s6,a0
8000baa8:	06050a63          	beqz	a0,8000bb1c <ip4_frag+0x1dc>
8000baac:	00452503          	lw	a0,4(a0)
8000bab0:	01400613          	li	a2,20
8000bab4:	000c0593          	mv	a1,s8
8000bab8:	60c020ef          	jal	ra,8000e0c4 <memcpy>
8000babc:	004b2983          	lw	s3,4(s6)
8000bac0:	000a8d93          	mv	s11,s5
8000bac4:	0c0d8c63          	beqz	s11,8000bb9c <ip4_frag+0x25c>
8000bac8:	00a45783          	lhu	a5,10(s0)
8000bacc:	414787b3          	sub	a5,a5,s4
8000bad0:	00078913          	mv	s2,a5
8000bad4:	01079793          	slli	a5,a5,0x10
8000bad8:	0107d793          	srli	a5,a5,0x10
8000badc:	00fdf463          	bgeu	s11,a5,8000bae4 <ip4_frag+0x1a4>
8000bae0:	000d8913          	mv	s2,s11
8000bae4:	01091913          	slli	s2,s2,0x10
8000bae8:	01095913          	srli	s2,s2,0x10
8000baec:	00091863          	bnez	s2,8000bafc <ip4_frag+0x1bc>
8000baf0:	00042403          	lw	s0,0(s0)
8000baf4:	00000a13          	li	s4,0
8000baf8:	fcdff06f          	j	8000bac4 <ip4_frag+0x184>
8000bafc:	800037b7          	lui	a5,0x80003
8000bb00:	2bd00613          	li	a2,701
8000bb04:	c4c78593          	addi	a1,a5,-948 # 80002c4c <_ram_heap_end+0xffff0c4c>
8000bb08:	00200513          	li	a0,2
8000bb0c:	addfa0ef          	jal	ra,800065e8 <memp_malloc_fn>
8000bb10:	00051a63          	bnez	a0,8000bb24 <ip4_frag+0x1e4>
8000bb14:	000b0513          	mv	a0,s6
8000bb18:	bbcfb0ef          	jal	ra,80006ed4 <pbuf_free>
8000bb1c:	fff00513          	li	a0,-1
8000bb20:	f21ff06f          	j	8000ba40 <ip4_frag+0x100>
8000bb24:	00442703          	lw	a4,4(s0)
8000bb28:	00050693          	mv	a3,a0
8000bb2c:	00a12c23          	sw	a0,24(sp)
8000bb30:	00090793          	mv	a5,s2
8000bb34:	01470733          	add	a4,a4,s4
8000bb38:	04100613          	li	a2,65
8000bb3c:	00090593          	mv	a1,s2
8000bb40:	00000513          	li	a0,0
8000bb44:	aa4fb0ef          	jal	ra,80006de8 <pbuf_alloced_custom>
8000bb48:	01812883          	lw	a7,24(sp)
8000bb4c:	00051a63          	bnez	a0,8000bb60 <ip4_frag+0x220>
8000bb50:	00088593          	mv	a1,a7
8000bb54:	00200513          	li	a0,2
8000bb58:	ac9fa0ef          	jal	ra,80006620 <memp_free>
8000bb5c:	fb9ff06f          	j	8000bb14 <ip4_frag+0x1d4>
8000bb60:	00a12c23          	sw	a0,24(sp)
8000bb64:	00040513          	mv	a0,s0
8000bb68:	01112e23          	sw	a7,28(sp)
8000bb6c:	f50fb0ef          	jal	ra,800072bc <pbuf_ref>
8000bb70:	01c12883          	lw	a7,28(sp)
8000bb74:	01412783          	lw	a5,20(sp)
8000bb78:	01812583          	lw	a1,24(sp)
8000bb7c:	0088aa23          	sw	s0,20(a7)
8000bb80:	00f8a823          	sw	a5,16(a7)
8000bb84:	000b0513          	mv	a0,s6
8000bb88:	f6cfb0ef          	jal	ra,800072f4 <pbuf_cat>
8000bb8c:	412d8833          	sub	a6,s11,s2
8000bb90:	01081d93          	slli	s11,a6,0x10
8000bb94:	010ddd93          	srli	s11,s11,0x10
8000bb98:	f40d9ce3          	bnez	s11,8000baf0 <ip4_frag+0x1b0>
8000bb9c:	02ccd783          	lhu	a5,44(s9)
8000bba0:	01490a33          	add	s4,s2,s4
8000bba4:	010a1a13          	slli	s4,s4,0x10
8000bba8:	013b9513          	slli	a0,s7,0x13
8000bbac:	fed78793          	addi	a5,a5,-19
8000bbb0:	010a5a13          	srli	s4,s4,0x10
8000bbb4:	01355513          	srli	a0,a0,0x13
8000bbb8:	00f4d663          	bge	s1,a5,8000bbc4 <ip4_frag+0x284>
8000bbbc:	00812783          	lw	a5,8(sp)
8000bbc0:	00078663          	beqz	a5,8000bbcc <ip4_frag+0x28c>
8000bbc4:	000027b7          	lui	a5,0x2
8000bbc8:	00f56533          	or	a0,a0,a5
8000bbcc:	8e4fa0ef          	jal	ra,80005cb0 <lwip_htons>
8000bbd0:	00a98323          	sb	a0,6(s3)
8000bbd4:	00855513          	srli	a0,a0,0x8
8000bbd8:	00a983a3          	sb	a0,7(s3)
8000bbdc:	014a8513          	addi	a0,s5,20
8000bbe0:	01051513          	slli	a0,a0,0x10
8000bbe4:	01055513          	srli	a0,a0,0x10
8000bbe8:	8c8fa0ef          	jal	ra,80005cb0 <lwip_htons>
8000bbec:	00a98123          	sb	a0,2(s3)
8000bbf0:	00855513          	srli	a0,a0,0x8
8000bbf4:	00a981a3          	sb	a0,3(s3)
8000bbf8:	01400593          	li	a1,20
8000bbfc:	00098523          	sb	zero,10(s3)
8000bc00:	000985a3          	sb	zero,11(s3)
8000bc04:	00098513          	mv	a0,s3
8000bc08:	e9cfa0ef          	jal	ra,800062a4 <inet_chksum>
8000bc0c:	00a98523          	sb	a0,10(s3)
8000bc10:	00855513          	srli	a0,a0,0x8
8000bc14:	00a985a3          	sb	a0,11(s3)
8000bc18:	014ca783          	lw	a5,20(s9)
8000bc1c:	00c12603          	lw	a2,12(sp)
8000bc20:	000b0593          	mv	a1,s6
8000bc24:	000c8513          	mv	a0,s9
8000bc28:	000780e7          	jalr	a5 # 2000 <_stack_size+0x1800>
8000bc2c:	060d2783          	lw	a5,96(s10)
8000bc30:	000b0513          	mv	a0,s6
8000bc34:	415484b3          	sub	s1,s1,s5
8000bc38:	00178793          	addi	a5,a5,1
8000bc3c:	06fd2023          	sw	a5,96(s10)
8000bc40:	a94fb0ef          	jal	ra,80006ed4 <pbuf_free>
8000bc44:	00412783          	lw	a5,4(sp)
8000bc48:	01049493          	slli	s1,s1,0x10
8000bc4c:	0104d493          	srli	s1,s1,0x10
8000bc50:	00fb8bb3          	add	s7,s7,a5
8000bc54:	010b9b93          	slli	s7,s7,0x10
8000bc58:	010bdb93          	srli	s7,s7,0x10
8000bc5c:	dddff06f          	j	8000ba38 <ip4_frag+0xf8>
8000bc60:	ffa00513          	li	a0,-6
8000bc64:	dddff06f          	j	8000ba40 <ip4_frag+0x100>

8000bc68 <ip4_input_accept>:
8000bc68:	03554783          	lbu	a5,53(a0)
8000bc6c:	0017f793          	andi	a5,a5,1
8000bc70:	04078063          	beqz	a5,8000bcb0 <ip4_input_accept+0x48>
8000bc74:	00452703          	lw	a4,4(a0)
8000bc78:	00050593          	mv	a1,a0
8000bc7c:	00000513          	li	a0,0
8000bc80:	02070c63          	beqz	a4,8000bcb8 <ip4_input_accept+0x50>
8000bc84:	a081a783          	lw	a5,-1528(gp) # 800031a0 <ip_data+0x14>
8000bc88:	00100513          	li	a0,1
8000bc8c:	02f70663          	beq	a4,a5,8000bcb8 <ip4_input_accept+0x50>
8000bc90:	ff010113          	addi	sp,sp,-16
8000bc94:	00078513          	mv	a0,a5
8000bc98:	00112623          	sw	ra,12(sp)
8000bc9c:	7e4000ef          	jal	ra,8000c480 <ip4_addr_isbroadcast_u32>
8000bca0:	00c12083          	lw	ra,12(sp)
8000bca4:	00a03533          	snez	a0,a0
8000bca8:	01010113          	addi	sp,sp,16
8000bcac:	00008067          	ret
8000bcb0:	00000513          	li	a0,0
8000bcb4:	00008067          	ret
8000bcb8:	00008067          	ret

8000bcbc <ip4_route>:
8000bcbc:	8d41a783          	lw	a5,-1836(gp) # 8000306c <netif_list>
8000bcc0:	04079463          	bnez	a5,8000bd08 <ip4_route+0x4c>
8000bcc4:	8d01a703          	lw	a4,-1840(gp) # 80003068 <netif_default>
8000bcc8:	02070463          	beqz	a4,8000bcf0 <ip4_route+0x34>
8000bccc:	03574683          	lbu	a3,53(a4)
8000bcd0:	00500613          	li	a2,5
8000bcd4:	0056f693          	andi	a3,a3,5
8000bcd8:	00c69c63          	bne	a3,a2,8000bcf0 <ip4_route+0x34>
8000bcdc:	00472683          	lw	a3,4(a4)
8000bce0:	00068863          	beqz	a3,8000bcf0 <ip4_route+0x34>
8000bce4:	00054603          	lbu	a2,0(a0)
8000bce8:	07f00693          	li	a3,127
8000bcec:	06d61463          	bne	a2,a3,8000bd54 <ip4_route+0x98>
8000bcf0:	a0c18713          	addi	a4,gp,-1524 # 800031a4 <lwip_stats>
8000bcf4:	0ac72683          	lw	a3,172(a4)
8000bcf8:	00168693          	addi	a3,a3,1
8000bcfc:	0ad72623          	sw	a3,172(a4)
8000bd00:	00078513          	mv	a0,a5
8000bd04:	00008067          	ret
8000bd08:	0357c683          	lbu	a3,53(a5)
8000bd0c:	0016f713          	andi	a4,a3,1
8000bd10:	02070e63          	beqz	a4,8000bd4c <ip4_route+0x90>
8000bd14:	0026d713          	srli	a4,a3,0x2
8000bd18:	00177713          	andi	a4,a4,1
8000bd1c:	02070863          	beqz	a4,8000bd4c <ip4_route+0x90>
8000bd20:	0047a703          	lw	a4,4(a5)
8000bd24:	02070463          	beqz	a4,8000bd4c <ip4_route+0x90>
8000bd28:	00052603          	lw	a2,0(a0)
8000bd2c:	0087a583          	lw	a1,8(a5)
8000bd30:	00c74733          	xor	a4,a4,a2
8000bd34:	00b77733          	and	a4,a4,a1
8000bd38:	fc0704e3          	beqz	a4,8000bd00 <ip4_route+0x44>
8000bd3c:	0026f693          	andi	a3,a3,2
8000bd40:	00069663          	bnez	a3,8000bd4c <ip4_route+0x90>
8000bd44:	00c7a703          	lw	a4,12(a5)
8000bd48:	fae60ce3          	beq	a2,a4,8000bd00 <ip4_route+0x44>
8000bd4c:	0007a783          	lw	a5,0(a5)
8000bd50:	f71ff06f          	j	8000bcc0 <ip4_route+0x4>
8000bd54:	00070793          	mv	a5,a4
8000bd58:	fa9ff06f          	j	8000bd00 <ip4_route+0x44>

8000bd5c <ip4_input>:
8000bd5c:	fd010113          	addi	sp,sp,-48
8000bd60:	02812423          	sw	s0,40(sp)
8000bd64:	03212023          	sw	s2,32(sp)
8000bd68:	02112623          	sw	ra,44(sp)
8000bd6c:	02912223          	sw	s1,36(sp)
8000bd70:	01312e23          	sw	s3,28(sp)
8000bd74:	01412c23          	sw	s4,24(sp)
8000bd78:	01512a23          	sw	s5,20(sp)
8000bd7c:	01612823          	sw	s6,16(sp)
8000bd80:	01712623          	sw	s7,12(sp)
8000bd84:	01812423          	sw	s8,8(sp)
8000bd88:	a0c18913          	addi	s2,gp,-1524 # 800031a4 <lwip_stats>
8000bd8c:	09492783          	lw	a5,148(s2)
8000bd90:	00178793          	addi	a5,a5,1
8000bd94:	08f92a23          	sw	a5,148(s2)
8000bd98:	00452483          	lw	s1,4(a0)
8000bd9c:	00400793          	li	a5,4
8000bda0:	0004cb03          	lbu	s6,0(s1)
8000bda4:	004b5713          	srli	a4,s6,0x4
8000bda8:	04f70a63          	beq	a4,a5,8000bdfc <ip4_input+0xa0>
8000bdac:	928fb0ef          	jal	ra,80006ed4 <pbuf_free>
8000bdb0:	0b892783          	lw	a5,184(s2)
8000bdb4:	00178793          	addi	a5,a5,1
8000bdb8:	0af92c23          	sw	a5,184(s2)
8000bdbc:	09c92783          	lw	a5,156(s2)
8000bdc0:	00178793          	addi	a5,a5,1
8000bdc4:	08f92e23          	sw	a5,156(s2)
8000bdc8:	02c12083          	lw	ra,44(sp)
8000bdcc:	02812403          	lw	s0,40(sp)
8000bdd0:	02412483          	lw	s1,36(sp)
8000bdd4:	02012903          	lw	s2,32(sp)
8000bdd8:	01c12983          	lw	s3,28(sp)
8000bddc:	01812a03          	lw	s4,24(sp)
8000bde0:	01412a83          	lw	s5,20(sp)
8000bde4:	01012b03          	lw	s6,16(sp)
8000bde8:	00c12b83          	lw	s7,12(sp)
8000bdec:	00812c03          	lw	s8,8(sp)
8000bdf0:	00000513          	li	a0,0
8000bdf4:	03010113          	addi	sp,sp,48
8000bdf8:	00008067          	ret
8000bdfc:	0034c783          	lbu	a5,3(s1)
8000be00:	00050993          	mv	s3,a0
8000be04:	0024c503          	lbu	a0,2(s1)
8000be08:	00879793          	slli	a5,a5,0x8
8000be0c:	00058a93          	mv	s5,a1
8000be10:	00a7e533          	or	a0,a5,a0
8000be14:	e9df90ef          	jal	ra,80005cb0 <lwip_htons>
8000be18:	00fb7b13          	andi	s6,s6,15
8000be1c:	0089d783          	lhu	a5,8(s3)
8000be20:	002b1b13          	slli	s6,s6,0x2
8000be24:	010b1913          	slli	s2,s6,0x10
8000be28:	a0c18413          	addi	s0,gp,-1524 # 800031a4 <lwip_stats>
8000be2c:	01095913          	srli	s2,s2,0x10
8000be30:	00050a13          	mv	s4,a0
8000be34:	00f57863          	bgeu	a0,a5,8000be44 <ip4_input+0xe8>
8000be38:	00050593          	mv	a1,a0
8000be3c:	00098513          	mv	a0,s3
8000be40:	b38fb0ef          	jal	ra,80007178 <pbuf_realloc>
8000be44:	00a9d783          	lhu	a5,10(s3)
8000be48:	0127ea63          	bltu	a5,s2,8000be5c <ip4_input+0x100>
8000be4c:	0089d783          	lhu	a5,8(s3)
8000be50:	0147e663          	bltu	a5,s4,8000be5c <ip4_input+0x100>
8000be54:	01300793          	li	a5,19
8000be58:	0327e463          	bltu	a5,s2,8000be80 <ip4_input+0x124>
8000be5c:	00098513          	mv	a0,s3
8000be60:	874fb0ef          	jal	ra,80006ed4 <pbuf_free>
8000be64:	0a442783          	lw	a5,164(s0)
8000be68:	00178793          	addi	a5,a5,1
8000be6c:	0af42223          	sw	a5,164(s0)
8000be70:	09c42783          	lw	a5,156(s0)
8000be74:	00178793          	addi	a5,a5,1
8000be78:	08f42e23          	sw	a5,156(s0)
8000be7c:	f4dff06f          	j	8000bdc8 <ip4_input+0x6c>
8000be80:	00090593          	mv	a1,s2
8000be84:	00048513          	mv	a0,s1
8000be88:	c1cfa0ef          	jal	ra,800062a4 <inet_chksum>
8000be8c:	00050e63          	beqz	a0,8000bea8 <ip4_input+0x14c>
8000be90:	00098513          	mv	a0,s3
8000be94:	840fb0ef          	jal	ra,80006ed4 <pbuf_free>
8000be98:	0a042783          	lw	a5,160(s0)
8000be9c:	00178793          	addi	a5,a5,1
8000bea0:	0af42023          	sw	a5,160(s0)
8000bea4:	fcdff06f          	j	8000be70 <ip4_input+0x114>
8000bea8:	0114c703          	lbu	a4,17(s1)
8000beac:	0104c783          	lbu	a5,16(s1)
8000beb0:	00871713          	slli	a4,a4,0x8
8000beb4:	00f76733          	or	a4,a4,a5
8000beb8:	0124c783          	lbu	a5,18(s1)
8000bebc:	9f418613          	addi	a2,gp,-1548 # 8000318c <ip_data>
8000bec0:	9f418913          	addi	s2,gp,-1548 # 8000318c <ip_data>
8000bec4:	01079793          	slli	a5,a5,0x10
8000bec8:	00e7e733          	or	a4,a5,a4
8000becc:	0134c783          	lbu	a5,19(s1)
8000bed0:	01879793          	slli	a5,a5,0x18
8000bed4:	00e7e7b3          	or	a5,a5,a4
8000bed8:	00f62a23          	sw	a5,20(a2)
8000bedc:	00d4c683          	lbu	a3,13(s1)
8000bee0:	00c4c703          	lbu	a4,12(s1)
8000bee4:	0f07f793          	andi	a5,a5,240
8000bee8:	00869693          	slli	a3,a3,0x8
8000beec:	00e6e6b3          	or	a3,a3,a4
8000bef0:	00e4c703          	lbu	a4,14(s1)
8000bef4:	01071713          	slli	a4,a4,0x10
8000bef8:	00d766b3          	or	a3,a4,a3
8000befc:	00f4c703          	lbu	a4,15(s1)
8000bf00:	01871713          	slli	a4,a4,0x18
8000bf04:	00d76733          	or	a4,a4,a3
8000bf08:	00e62823          	sw	a4,16(a2)
8000bf0c:	0e000713          	li	a4,224
8000bf10:	06e79063          	bne	a5,a4,8000bf70 <ip4_input+0x214>
8000bf14:	035ac783          	lbu	a5,53(s5)
8000bf18:	0017f793          	andi	a5,a5,1
8000bf1c:	00079c63          	bnez	a5,8000bf34 <ip4_input+0x1d8>
8000bf20:	0094c703          	lbu	a4,9(s1)
8000bf24:	01100793          	li	a5,17
8000bf28:	08f70663          	beq	a4,a5,8000bfb4 <ip4_input+0x258>
8000bf2c:	00000a13          	li	s4,0
8000bf30:	0100006f          	j	8000bf40 <ip4_input+0x1e4>
8000bf34:	004aa783          	lw	a5,4(s5)
8000bf38:	fe0784e3          	beqz	a5,8000bf20 <ip4_input+0x1c4>
8000bf3c:	000a8a13          	mv	s4,s5
8000bf40:	01092503          	lw	a0,16(s2)
8000bf44:	08050a63          	beqz	a0,8000bfd8 <ip4_input+0x27c>
8000bf48:	000a8593          	mv	a1,s5
8000bf4c:	534000ef          	jal	ra,8000c480 <ip4_addr_isbroadcast_u32>
8000bf50:	00051a63          	bnez	a0,8000bf64 <ip4_input+0x208>
8000bf54:	01092783          	lw	a5,16(s2)
8000bf58:	0e000713          	li	a4,224
8000bf5c:	0f07f793          	andi	a5,a5,240
8000bf60:	06e79c63          	bne	a5,a4,8000bfd8 <ip4_input+0x27c>
8000bf64:	00098513          	mv	a0,s3
8000bf68:	f6dfa0ef          	jal	ra,80006ed4 <pbuf_free>
8000bf6c:	f05ff06f          	j	8000be70 <ip4_input+0x114>
8000bf70:	000a8513          	mv	a0,s5
8000bf74:	cf5ff0ef          	jal	ra,8000bc68 <ip4_input_accept>
8000bf78:	02051a63          	bnez	a0,8000bfac <ip4_input+0x250>
8000bf7c:	01494703          	lbu	a4,20(s2)
8000bf80:	07f00793          	li	a5,127
8000bf84:	f8f70ee3          	beq	a4,a5,8000bf20 <ip4_input+0x1c4>
8000bf88:	8d41aa03          	lw	s4,-1836(gp) # 8000306c <netif_list>
8000bf8c:	f80a0ae3          	beqz	s4,8000bf20 <ip4_input+0x1c4>
8000bf90:	015a1663          	bne	s4,s5,8000bf9c <ip4_input+0x240>
8000bf94:	000a2a03          	lw	s4,0(s4)
8000bf98:	ff5ff06f          	j	8000bf8c <ip4_input+0x230>
8000bf9c:	000a0513          	mv	a0,s4
8000bfa0:	cc9ff0ef          	jal	ra,8000bc68 <ip4_input_accept>
8000bfa4:	fe0508e3          	beqz	a0,8000bf94 <ip4_input+0x238>
8000bfa8:	f99ff06f          	j	8000bf40 <ip4_input+0x1e4>
8000bfac:	f80a98e3          	bnez	s5,8000bf3c <ip4_input+0x1e0>
8000bfb0:	f71ff06f          	j	8000bf20 <ip4_input+0x1c4>
8000bfb4:	01648733          	add	a4,s1,s6
8000bfb8:	00374783          	lbu	a5,3(a4)
8000bfbc:	00274683          	lbu	a3,2(a4)
8000bfc0:	00004737          	lui	a4,0x4
8000bfc4:	00879793          	slli	a5,a5,0x8
8000bfc8:	00d7e7b3          	or	a5,a5,a3
8000bfcc:	40070713          	addi	a4,a4,1024 # 4400 <_stack_size+0x3c00>
8000bfd0:	f4e79ee3          	bne	a5,a4,8000bf2c <ip4_input+0x1d0>
8000bfd4:	000a8a13          	mv	s4,s5
8000bfd8:	000a1e63          	bnez	s4,8000bff4 <ip4_input+0x298>
8000bfdc:	09c42783          	lw	a5,156(s0)
8000bfe0:	00098513          	mv	a0,s3
8000bfe4:	00178793          	addi	a5,a5,1
8000bfe8:	08f42e23          	sw	a5,156(s0)
8000bfec:	ee9fa0ef          	jal	ra,80006ed4 <pbuf_free>
8000bff0:	dd9ff06f          	j	8000bdc8 <ip4_input+0x6c>
8000bff4:	0064c783          	lbu	a5,6(s1)
8000bff8:	0074c703          	lbu	a4,7(s1)
8000bffc:	03f7f793          	andi	a5,a5,63
8000c000:	00871713          	slli	a4,a4,0x8
8000c004:	00e7e7b3          	or	a5,a5,a4
8000c008:	00078e63          	beqz	a5,8000c024 <ip4_input+0x2c8>
8000c00c:	00098513          	mv	a0,s3
8000c010:	ec5fa0ef          	jal	ra,80006ed4 <pbuf_free>
8000c014:	0b442783          	lw	a5,180(s0)
8000c018:	00178793          	addi	a5,a5,1
8000c01c:	0af42a23          	sw	a5,180(s0)
8000c020:	e51ff06f          	j	8000be70 <ip4_input+0x114>
8000c024:	01492023          	sw	s4,0(s2)
8000c028:	01592223          	sw	s5,4(s2)
8000c02c:	00992423          	sw	s1,8(s2)
8000c030:	0004c783          	lbu	a5,0(s1)
8000c034:	000a8593          	mv	a1,s5
8000c038:	00098513          	mv	a0,s3
8000c03c:	00f7f793          	andi	a5,a5,15
8000c040:	00279793          	slli	a5,a5,0x2
8000c044:	00f91623          	sh	a5,12(s2)
8000c048:	00100c13          	li	s8,1
8000c04c:	a7dfb0ef          	jal	ra,80007ac8 <raw_input>
8000c050:	00050b93          	mv	s7,a0
8000c054:	03850663          	beq	a0,s8,8000c080 <ip4_input+0x324>
8000c058:	000b0593          	mv	a1,s6
8000c05c:	00098513          	mv	a0,s3
8000c060:	dedfa0ef          	jal	ra,80006e4c <pbuf_remove_header>
8000c064:	0094c783          	lbu	a5,9(s1)
8000c068:	03878a63          	beq	a5,s8,8000c09c <ip4_input+0x340>
8000c06c:	01100713          	li	a4,17
8000c070:	02e79e63          	bne	a5,a4,8000c0ac <ip4_input+0x350>
8000c074:	000a8593          	mv	a1,s5
8000c078:	00098513          	mv	a0,s3
8000c07c:	a40fc0ef          	jal	ra,800082bc <udp_input>
8000c080:	00092023          	sw	zero,0(s2)
8000c084:	00092223          	sw	zero,4(s2)
8000c088:	00092423          	sw	zero,8(s2)
8000c08c:	00091623          	sh	zero,12(s2)
8000c090:	00092823          	sw	zero,16(s2)
8000c094:	00092a23          	sw	zero,20(s2)
8000c098:	d31ff06f          	j	8000bdc8 <ip4_input+0x6c>
8000c09c:	000a8593          	mv	a1,s5
8000c0a0:	00098513          	mv	a0,s3
8000c0a4:	c18ff0ef          	jal	ra,8000b4bc <icmp_input>
8000c0a8:	fd9ff06f          	j	8000c080 <ip4_input+0x324>
8000c0ac:	00200793          	li	a5,2
8000c0b0:	04fb8a63          	beq	s7,a5,8000c104 <ip4_input+0x3a8>
8000c0b4:	01492503          	lw	a0,20(s2)
8000c0b8:	000a0593          	mv	a1,s4
8000c0bc:	3c4000ef          	jal	ra,8000c480 <ip4_addr_isbroadcast_u32>
8000c0c0:	02051663          	bnez	a0,8000c0ec <ip4_input+0x390>
8000c0c4:	01492783          	lw	a5,20(s2)
8000c0c8:	0e000713          	li	a4,224
8000c0cc:	0f07f793          	andi	a5,a5,240
8000c0d0:	00e78e63          	beq	a5,a4,8000c0ec <ip4_input+0x390>
8000c0d4:	000b0593          	mv	a1,s6
8000c0d8:	00098513          	mv	a0,s3
8000c0dc:	de5fa0ef          	jal	ra,80006ec0 <pbuf_header_force>
8000c0e0:	00200593          	li	a1,2
8000c0e4:	00098513          	mv	a0,s3
8000c0e8:	ef8ff0ef          	jal	ra,8000b7e0 <icmp_dest_unreach>
8000c0ec:	0b042783          	lw	a5,176(s0)
8000c0f0:	00178793          	addi	a5,a5,1
8000c0f4:	0af42823          	sw	a5,176(s0)
8000c0f8:	09c42783          	lw	a5,156(s0)
8000c0fc:	00178793          	addi	a5,a5,1
8000c100:	08f42e23          	sw	a5,156(s0)
8000c104:	00098513          	mv	a0,s3
8000c108:	dcdfa0ef          	jal	ra,80006ed4 <pbuf_free>
8000c10c:	f75ff06f          	j	8000c080 <ip4_input+0x324>

8000c110 <ip4_output_if_src>:
8000c110:	fc010113          	addi	sp,sp,-64
8000c114:	03212823          	sw	s2,48(sp)
8000c118:	03412423          	sw	s4,40(sp)
8000c11c:	03512223          	sw	s5,36(sp)
8000c120:	02112e23          	sw	ra,60(sp)
8000c124:	02812c23          	sw	s0,56(sp)
8000c128:	02912a23          	sw	s1,52(sp)
8000c12c:	03312623          	sw	s3,44(sp)
8000c130:	03612023          	sw	s6,32(sp)
8000c134:	00d12623          	sw	a3,12(sp)
8000c138:	00f12423          	sw	a5,8(sp)
8000c13c:	00c12223          	sw	a2,4(sp)
8000c140:	00050913          	mv	s2,a0
8000c144:	00080a13          	mv	s4,a6
8000c148:	a0c18a93          	addi	s5,gp,-1524 # 800031a4 <lwip_stats>
8000c14c:	1a060863          	beqz	a2,8000c2fc <ip4_output_if_src+0x1ec>
8000c150:	00058993          	mv	s3,a1
8000c154:	01400593          	li	a1,20
8000c158:	00070493          	mv	s1,a4
8000c15c:	ce1fa0ef          	jal	ra,80006e3c <pbuf_add_header>
8000c160:	00412603          	lw	a2,4(sp)
8000c164:	00812783          	lw	a5,8(sp)
8000c168:	00c12683          	lw	a3,12(sp)
8000c16c:	02050e63          	beqz	a0,8000c1a8 <ip4_output_if_src+0x98>
8000c170:	0b8aa783          	lw	a5,184(s5)
8000c174:	ffe00513          	li	a0,-2
8000c178:	00178793          	addi	a5,a5,1
8000c17c:	0afaac23          	sw	a5,184(s5)
8000c180:	03c12083          	lw	ra,60(sp)
8000c184:	03812403          	lw	s0,56(sp)
8000c188:	03412483          	lw	s1,52(sp)
8000c18c:	03012903          	lw	s2,48(sp)
8000c190:	02c12983          	lw	s3,44(sp)
8000c194:	02812a03          	lw	s4,40(sp)
8000c198:	02412a83          	lw	s5,36(sp)
8000c19c:	02012b03          	lw	s6,32(sp)
8000c1a0:	04010113          	addi	sp,sp,64
8000c1a4:	00008067          	ret
8000c1a8:	00492403          	lw	s0,4(s2)
8000c1ac:	00c12223          	sw	a2,4(sp)
8000c1b0:	00d40423          	sb	a3,8(s0)
8000c1b4:	00f404a3          	sb	a5,9(s0)
8000c1b8:	00869693          	slli	a3,a3,0x8
8000c1bc:	00f6e7b3          	or	a5,a3,a5
8000c1c0:	00062683          	lw	a3,0(a2)
8000c1c4:	009400a3          	sb	s1,1(s0)
8000c1c8:	00849493          	slli	s1,s1,0x8
8000c1cc:	0086d593          	srli	a1,a3,0x8
8000c1d0:	00d40823          	sb	a3,16(s0)
8000c1d4:	00b408a3          	sb	a1,17(s0)
8000c1d8:	0186d513          	srli	a0,a3,0x18
8000c1dc:	0106d593          	srli	a1,a3,0x10
8000c1e0:	01069693          	slli	a3,a3,0x10
8000c1e4:	0106d693          	srli	a3,a3,0x10
8000c1e8:	00b686b3          	add	a3,a3,a1
8000c1ec:	00a409a3          	sb	a0,19(s0)
8000c1f0:	0454e493          	ori	s1,s1,69
8000c1f4:	04500513          	li	a0,69
8000c1f8:	00b40923          	sb	a1,18(s0)
8000c1fc:	00a40023          	sb	a0,0(s0)
8000c200:	00d484b3          	add	s1,s1,a3
8000c204:	00879693          	slli	a3,a5,0x8
8000c208:	4087d793          	srai	a5,a5,0x8
8000c20c:	00f6e7b3          	or	a5,a3,a5
8000c210:	00895503          	lhu	a0,8(s2)
8000c214:	01079793          	slli	a5,a5,0x10
8000c218:	0107d793          	srli	a5,a5,0x10
8000c21c:	00f484b3          	add	s1,s1,a5
8000c220:	a91f90ef          	jal	ra,80005cb0 <lwip_htons>
8000c224:	00855793          	srli	a5,a0,0x8
8000c228:	00a40123          	sb	a0,2(s0)
8000c22c:	009504b3          	add	s1,a0,s1
8000c230:	8f81d503          	lhu	a0,-1800(gp) # 80003090 <ip_id>
8000c234:	00f401a3          	sb	a5,3(s0)
8000c238:	00040323          	sb	zero,6(s0)
8000c23c:	000403a3          	sb	zero,7(s0)
8000c240:	a71f90ef          	jal	ra,80005cb0 <lwip_htons>
8000c244:	00855793          	srli	a5,a0,0x8
8000c248:	00f402a3          	sb	a5,5(s0)
8000c24c:	8f81d783          	lhu	a5,-1800(gp) # 80003090 <ip_id>
8000c250:	00a40223          	sb	a0,4(s0)
8000c254:	00412603          	lw	a2,4(sp)
8000c258:	00178793          	addi	a5,a5,1
8000c25c:	8ef19c23          	sh	a5,-1800(gp) # 80003090 <ip_id>
8000c260:	00950533          	add	a0,a0,s1
8000c264:	08099863          	bnez	s3,8000c2f4 <ip4_output_if_src+0x1e4>
8000c268:	8481a703          	lw	a4,-1976(gp) # 80002fe0 <ip_addr_any>
8000c26c:	01875693          	srli	a3,a4,0x18
8000c270:	00d407a3          	sb	a3,15(s0)
8000c274:	000106b7          	lui	a3,0x10
8000c278:	00875793          	srli	a5,a4,0x8
8000c27c:	fff68693          	addi	a3,a3,-1 # ffff <_stack_size+0xf7ff>
8000c280:	00e40623          	sb	a4,12(s0)
8000c284:	00f406a3          	sb	a5,13(s0)
8000c288:	01075793          	srli	a5,a4,0x10
8000c28c:	00d77733          	and	a4,a4,a3
8000c290:	00a70733          	add	a4,a4,a0
8000c294:	00e78733          	add	a4,a5,a4
8000c298:	00f40723          	sb	a5,14(s0)
8000c29c:	01075793          	srli	a5,a4,0x10
8000c2a0:	00d77733          	and	a4,a4,a3
8000c2a4:	00e78733          	add	a4,a5,a4
8000c2a8:	01075793          	srli	a5,a4,0x10
8000c2ac:	00e787b3          	add	a5,a5,a4
8000c2b0:	fff7c793          	not	a5,a5
8000c2b4:	01079793          	slli	a5,a5,0x10
8000c2b8:	0107d793          	srli	a5,a5,0x10
8000c2bc:	00f40523          	sb	a5,10(s0)
8000c2c0:	0087d793          	srli	a5,a5,0x8
8000c2c4:	00f405a3          	sb	a5,11(s0)
8000c2c8:	090aa783          	lw	a5,144(s5)
8000c2cc:	00178793          	addi	a5,a5,1
8000c2d0:	08faa823          	sw	a5,144(s5)
8000c2d4:	02ca5783          	lhu	a5,44(s4)
8000c2d8:	06078463          	beqz	a5,8000c340 <ip4_output_if_src+0x230>
8000c2dc:	00895703          	lhu	a4,8(s2)
8000c2e0:	06e7f063          	bgeu	a5,a4,8000c340 <ip4_output_if_src+0x230>
8000c2e4:	000a0593          	mv	a1,s4
8000c2e8:	00090513          	mv	a0,s2
8000c2ec:	e54ff0ef          	jal	ra,8000b940 <ip4_frag>
8000c2f0:	e91ff06f          	j	8000c180 <ip4_output_if_src+0x70>
8000c2f4:	0009a703          	lw	a4,0(s3)
8000c2f8:	f75ff06f          	j	8000c26c <ip4_output_if_src+0x15c>
8000c2fc:	00a55703          	lhu	a4,10(a0)
8000c300:	01300793          	li	a5,19
8000c304:	e6e7f6e3          	bgeu	a5,a4,8000c170 <ip4_output_if_src+0x60>
8000c308:	00452683          	lw	a3,4(a0)
8000c30c:	01c10613          	addi	a2,sp,28
8000c310:	0116c703          	lbu	a4,17(a3)
8000c314:	0106c783          	lbu	a5,16(a3)
8000c318:	00871713          	slli	a4,a4,0x8
8000c31c:	00f76733          	or	a4,a4,a5
8000c320:	0126c783          	lbu	a5,18(a3)
8000c324:	01079793          	slli	a5,a5,0x10
8000c328:	00e7e733          	or	a4,a5,a4
8000c32c:	0136c783          	lbu	a5,19(a3)
8000c330:	01879793          	slli	a5,a5,0x18
8000c334:	00e7e7b3          	or	a5,a5,a4
8000c338:	00f12e23          	sw	a5,28(sp)
8000c33c:	f8dff06f          	j	8000c2c8 <ip4_output_if_src+0x1b8>
8000c340:	014a2783          	lw	a5,20(s4)
8000c344:	00090593          	mv	a1,s2
8000c348:	000a0513          	mv	a0,s4
8000c34c:	000780e7          	jalr	a5
8000c350:	e31ff06f          	j	8000c180 <ip4_output_if_src+0x70>

8000c354 <ip4_output_if>:
8000c354:	00060a63          	beqz	a2,8000c368 <ip4_output_if+0x14>
8000c358:	00058663          	beqz	a1,8000c364 <ip4_output_if+0x10>
8000c35c:	0005a883          	lw	a7,0(a1)
8000c360:	00089463          	bnez	a7,8000c368 <ip4_output_if+0x14>
8000c364:	00480593          	addi	a1,a6,4
8000c368:	da9ff06f          	j	8000c110 <ip4_output_if_src>

8000c36c <ip4_output>:
8000c36c:	fd010113          	addi	sp,sp,-48
8000c370:	02812423          	sw	s0,40(sp)
8000c374:	00050413          	mv	s0,a0
8000c378:	00060513          	mv	a0,a2
8000c37c:	00b12e23          	sw	a1,28(sp)
8000c380:	00d12c23          	sw	a3,24(sp)
8000c384:	00e12a23          	sw	a4,20(sp)
8000c388:	00f12823          	sw	a5,16(sp)
8000c38c:	00c12623          	sw	a2,12(sp)
8000c390:	02112623          	sw	ra,44(sp)
8000c394:	929ff0ef          	jal	ra,8000bcbc <ip4_route>
8000c398:	00c12603          	lw	a2,12(sp)
8000c39c:	01012783          	lw	a5,16(sp)
8000c3a0:	01412703          	lw	a4,20(sp)
8000c3a4:	01812683          	lw	a3,24(sp)
8000c3a8:	01c12583          	lw	a1,28(sp)
8000c3ac:	00050e63          	beqz	a0,8000c3c8 <ip4_output+0x5c>
8000c3b0:	00050813          	mv	a6,a0
8000c3b4:	00040513          	mv	a0,s0
8000c3b8:	02812403          	lw	s0,40(sp)
8000c3bc:	02c12083          	lw	ra,44(sp)
8000c3c0:	03010113          	addi	sp,sp,48
8000c3c4:	f91ff06f          	j	8000c354 <ip4_output_if>
8000c3c8:	a0c18793          	addi	a5,gp,-1524 # 800031a4 <lwip_stats>
8000c3cc:	0ac7a703          	lw	a4,172(a5)
8000c3d0:	ffc00513          	li	a0,-4
8000c3d4:	00170713          	addi	a4,a4,1
8000c3d8:	0ae7a623          	sw	a4,172(a5)
8000c3dc:	02c12083          	lw	ra,44(sp)
8000c3e0:	02812403          	lw	s0,40(sp)
8000c3e4:	03010113          	addi	sp,sp,48
8000c3e8:	00008067          	ret

8000c3ec <ip4_output_hinted>:
8000c3ec:	fd010113          	addi	sp,sp,-48
8000c3f0:	02912223          	sw	s1,36(sp)
8000c3f4:	00050493          	mv	s1,a0
8000c3f8:	00060513          	mv	a0,a2
8000c3fc:	00b12e23          	sw	a1,28(sp)
8000c400:	00d12c23          	sw	a3,24(sp)
8000c404:	00e12a23          	sw	a4,20(sp)
8000c408:	00f12823          	sw	a5,16(sp)
8000c40c:	01012623          	sw	a6,12(sp)
8000c410:	00c12423          	sw	a2,8(sp)
8000c414:	02112623          	sw	ra,44(sp)
8000c418:	02812423          	sw	s0,40(sp)
8000c41c:	8a1ff0ef          	jal	ra,8000bcbc <ip4_route>
8000c420:	00812603          	lw	a2,8(sp)
8000c424:	00c12803          	lw	a6,12(sp)
8000c428:	01012783          	lw	a5,16(sp)
8000c42c:	01412703          	lw	a4,20(sp)
8000c430:	01812683          	lw	a3,24(sp)
8000c434:	01c12583          	lw	a1,28(sp)
8000c438:	02051663          	bnez	a0,8000c464 <ip4_output_hinted+0x78>
8000c43c:	a0c18793          	addi	a5,gp,-1524 # 800031a4 <lwip_stats>
8000c440:	0ac7a703          	lw	a4,172(a5)
8000c444:	ffc00513          	li	a0,-4
8000c448:	00170713          	addi	a4,a4,1
8000c44c:	0ae7a623          	sw	a4,172(a5)
8000c450:	02c12083          	lw	ra,44(sp)
8000c454:	02812403          	lw	s0,40(sp)
8000c458:	02412483          	lw	s1,36(sp)
8000c45c:	03010113          	addi	sp,sp,48
8000c460:	00008067          	ret
8000c464:	03052e23          	sw	a6,60(a0)
8000c468:	00050413          	mv	s0,a0
8000c46c:	00050813          	mv	a6,a0
8000c470:	00048513          	mv	a0,s1
8000c474:	ee1ff0ef          	jal	ra,8000c354 <ip4_output_if>
8000c478:	02042e23          	sw	zero,60(s0)
8000c47c:	fd5ff06f          	j	8000c450 <ip4_output_hinted+0x64>

8000c480 <ip4_addr_isbroadcast_u32>:
8000c480:	fff50693          	addi	a3,a0,-1
8000c484:	ffd00793          	li	a5,-3
8000c488:	00050713          	mv	a4,a0
8000c48c:	04d7e063          	bltu	a5,a3,8000c4cc <ip4_addr_isbroadcast_u32+0x4c>
8000c490:	0355c783          	lbu	a5,53(a1)
8000c494:	0027f513          	andi	a0,a5,2
8000c498:	02050c63          	beqz	a0,8000c4d0 <ip4_addr_isbroadcast_u32+0x50>
8000c49c:	0045a783          	lw	a5,4(a1)
8000c4a0:	00000513          	li	a0,0
8000c4a4:	02e78663          	beq	a5,a4,8000c4d0 <ip4_addr_isbroadcast_u32+0x50>
8000c4a8:	0085a683          	lw	a3,8(a1)
8000c4ac:	00e7c7b3          	xor	a5,a5,a4
8000c4b0:	00d7f7b3          	and	a5,a5,a3
8000c4b4:	00079e63          	bnez	a5,8000c4d0 <ip4_addr_isbroadcast_u32+0x50>
8000c4b8:	fff6c693          	not	a3,a3
8000c4bc:	00e6f533          	and	a0,a3,a4
8000c4c0:	40d50533          	sub	a0,a0,a3
8000c4c4:	00153513          	seqz	a0,a0
8000c4c8:	00008067          	ret
8000c4cc:	00100513          	li	a0,1
8000c4d0:	00008067          	ret

8000c4d4 <ip4_addr_netmask_valid>:
8000c4d4:	ff010113          	addi	sp,sp,-16
8000c4d8:	00112623          	sw	ra,12(sp)
8000c4dc:	fecf90ef          	jal	ra,80005cc8 <lwip_htonl>
8000c4e0:	02000713          	li	a4,32
8000c4e4:	800007b7          	lui	a5,0x80000
8000c4e8:	00f576b3          	and	a3,a0,a5
8000c4ec:	02068663          	beqz	a3,8000c518 <ip4_addr_netmask_valid+0x44>
8000c4f0:	fff70713          	addi	a4,a4,-1
8000c4f4:	0017d793          	srli	a5,a5,0x1
8000c4f8:	fe0718e3          	bnez	a4,8000c4e8 <ip4_addr_netmask_valid+0x14>
8000c4fc:	00100513          	li	a0,1
8000c500:	00c12083          	lw	ra,12(sp)
8000c504:	01010113          	addi	sp,sp,16
8000c508:	00008067          	ret
8000c50c:	00a7f733          	and	a4,a5,a0
8000c510:	00071863          	bnez	a4,8000c520 <ip4_addr_netmask_valid+0x4c>
8000c514:	0017d793          	srli	a5,a5,0x1
8000c518:	fe079ae3          	bnez	a5,8000c50c <ip4_addr_netmask_valid+0x38>
8000c51c:	fe1ff06f          	j	8000c4fc <ip4_addr_netmask_valid+0x28>
8000c520:	00000513          	li	a0,0
8000c524:	fddff06f          	j	8000c500 <ip4_addr_netmask_valid+0x2c>

8000c528 <ip4addr_aton>:
8000c528:	fb010113          	addi	sp,sp,-80
8000c52c:	04812423          	sw	s0,72(sp)
8000c530:	05212023          	sw	s2,64(sp)
8000c534:	03312e23          	sw	s3,60(sp)
8000c538:	03512a23          	sw	s5,52(sp)
8000c53c:	03712623          	sw	s7,44(sp)
8000c540:	03812423          	sw	s8,40(sp)
8000c544:	03912223          	sw	s9,36(sp)
8000c548:	03a12023          	sw	s10,32(sp)
8000c54c:	01b12e23          	sw	s11,28(sp)
8000c550:	04112623          	sw	ra,76(sp)
8000c554:	04912223          	sw	s1,68(sp)
8000c558:	03412c23          	sw	s4,56(sp)
8000c55c:	03612823          	sw	s6,48(sp)
8000c560:	00054483          	lbu	s1,0(a0)
8000c564:	00010913          	mv	s2,sp
8000c568:	80003ab7          	lui	s5,0x80003
8000c56c:	00058993          	mv	s3,a1
8000c570:	00090b93          	mv	s7,s2
8000c574:	c6da8a93          	addi	s5,s5,-915 # 80002c6d <_ram_heap_end+0xffff0c6d>
8000c578:	03000413          	li	s0,48
8000c57c:	05800c13          	li	s8,88
8000c580:	01000c93          	li	s9,16
8000c584:	00200d13          	li	s10,2
8000c588:	02e00d93          	li	s11,46
8000c58c:	00c10713          	addi	a4,sp,12
8000c590:	015487b3          	add	a5,s1,s5
8000c594:	0007c783          	lbu	a5,0(a5) # 80000000 <_ram_heap_end+0xfffee000>
8000c598:	0047f793          	andi	a5,a5,4
8000c59c:	1c078a63          	beqz	a5,8000c770 <ip4addr_aton+0x248>
8000c5a0:	00a00b13          	li	s6,10
8000c5a4:	00849c63          	bne	s1,s0,8000c5bc <ip4addr_aton+0x94>
8000c5a8:	00154483          	lbu	s1,1(a0)
8000c5ac:	0df4f793          	andi	a5,s1,223
8000c5b0:	05878463          	beq	a5,s8,8000c5f8 <ip4addr_aton+0xd0>
8000c5b4:	00150513          	addi	a0,a0,1
8000c5b8:	00800b13          	li	s6,8
8000c5bc:	00050a13          	mv	s4,a0
8000c5c0:	00000513          	li	a0,0
8000c5c4:	009a87b3          	add	a5,s5,s1
8000c5c8:	0007c783          	lbu	a5,0(a5)
8000c5cc:	0047f693          	andi	a3,a5,4
8000c5d0:	02068c63          	beqz	a3,8000c608 <ip4addr_aton+0xe0>
8000c5d4:	00050593          	mv	a1,a0
8000c5d8:	000b0513          	mv	a0,s6
8000c5dc:	441000ef          	jal	ra,8000d21c <__mulsi3>
8000c5e0:	00950533          	add	a0,a0,s1
8000c5e4:	001a4483          	lbu	s1,1(s4)
8000c5e8:	fd050513          	addi	a0,a0,-48
8000c5ec:	00c10713          	addi	a4,sp,12
8000c5f0:	001a0a13          	addi	s4,s4,1
8000c5f4:	fd1ff06f          	j	8000c5c4 <ip4addr_aton+0x9c>
8000c5f8:	00254483          	lbu	s1,2(a0)
8000c5fc:	01000b13          	li	s6,16
8000c600:	00250513          	addi	a0,a0,2
8000c604:	fb9ff06f          	j	8000c5bc <ip4addr_aton+0x94>
8000c608:	039b1a63          	bne	s6,s9,8000c63c <ip4addr_aton+0x114>
8000c60c:	0447f693          	andi	a3,a5,68
8000c610:	02068663          	beqz	a3,8000c63c <ip4addr_aton+0x114>
8000c614:	0037f793          	andi	a5,a5,3
8000c618:	00451513          	slli	a0,a0,0x4
8000c61c:	00a48493          	addi	s1,s1,10
8000c620:	06100593          	li	a1,97
8000c624:	01a78463          	beq	a5,s10,8000c62c <ip4addr_aton+0x104>
8000c628:	04100593          	li	a1,65
8000c62c:	40b484b3          	sub	s1,s1,a1
8000c630:	00a4e533          	or	a0,s1,a0
8000c634:	001a4483          	lbu	s1,1(s4)
8000c638:	fb9ff06f          	j	8000c5f0 <ip4addr_aton+0xc8>
8000c63c:	01b49e63          	bne	s1,s11,8000c658 <ip4addr_aton+0x130>
8000c640:	12e90863          	beq	s2,a4,8000c770 <ip4addr_aton+0x248>
8000c644:	00490913          	addi	s2,s2,4
8000c648:	fea92e23          	sw	a0,-4(s2)
8000c64c:	001a4483          	lbu	s1,1(s4)
8000c650:	001a0513          	addi	a0,s4,1
8000c654:	f3dff06f          	j	8000c590 <ip4addr_aton+0x68>
8000c658:	00048863          	beqz	s1,8000c668 <ip4addr_aton+0x140>
8000c65c:	0087f793          	andi	a5,a5,8
8000c660:	00000413          	li	s0,0
8000c664:	02078863          	beqz	a5,8000c694 <ip4addr_aton+0x16c>
8000c668:	41790433          	sub	s0,s2,s7
8000c66c:	40245413          	srai	s0,s0,0x2
8000c670:	00140413          	addi	s0,s0,1
8000c674:	00200793          	li	a5,2
8000c678:	0af40263          	beq	s0,a5,8000c71c <ip4addr_aton+0x1f4>
8000c67c:	0487cc63          	blt	a5,s0,8000c6d4 <ip4addr_aton+0x1ac>
8000c680:	00040a63          	beqz	s0,8000c694 <ip4addr_aton+0x16c>
8000c684:	00100413          	li	s0,1
8000c688:	00098663          	beqz	s3,8000c694 <ip4addr_aton+0x16c>
8000c68c:	e3cf90ef          	jal	ra,80005cc8 <lwip_htonl>
8000c690:	00a9a023          	sw	a0,0(s3)
8000c694:	00040513          	mv	a0,s0
8000c698:	04c12083          	lw	ra,76(sp)
8000c69c:	04812403          	lw	s0,72(sp)
8000c6a0:	04412483          	lw	s1,68(sp)
8000c6a4:	04012903          	lw	s2,64(sp)
8000c6a8:	03c12983          	lw	s3,60(sp)
8000c6ac:	03812a03          	lw	s4,56(sp)
8000c6b0:	03412a83          	lw	s5,52(sp)
8000c6b4:	03012b03          	lw	s6,48(sp)
8000c6b8:	02c12b83          	lw	s7,44(sp)
8000c6bc:	02812c03          	lw	s8,40(sp)
8000c6c0:	02412c83          	lw	s9,36(sp)
8000c6c4:	02012d03          	lw	s10,32(sp)
8000c6c8:	01c12d83          	lw	s11,28(sp)
8000c6cc:	05010113          	addi	sp,sp,80
8000c6d0:	00008067          	ret
8000c6d4:	00300793          	li	a5,3
8000c6d8:	06f40463          	beq	s0,a5,8000c740 <ip4addr_aton+0x218>
8000c6dc:	00400793          	li	a5,4
8000c6e0:	faf412e3          	bne	s0,a5,8000c684 <ip4addr_aton+0x15c>
8000c6e4:	0ff00613          	li	a2,255
8000c6e8:	00000413          	li	s0,0
8000c6ec:	faa664e3          	bltu	a2,a0,8000c694 <ip4addr_aton+0x16c>
8000c6f0:	00012783          	lw	a5,0(sp)
8000c6f4:	faf660e3          	bltu	a2,a5,8000c694 <ip4addr_aton+0x16c>
8000c6f8:	00412683          	lw	a3,4(sp)
8000c6fc:	f8d66ce3          	bltu	a2,a3,8000c694 <ip4addr_aton+0x16c>
8000c700:	00812703          	lw	a4,8(sp)
8000c704:	f8e668e3          	bltu	a2,a4,8000c694 <ip4addr_aton+0x16c>
8000c708:	01879793          	slli	a5,a5,0x18
8000c70c:	01069693          	slli	a3,a3,0x10
8000c710:	00d7e7b3          	or	a5,a5,a3
8000c714:	00871713          	slli	a4,a4,0x8
8000c718:	0500006f          	j	8000c768 <ip4addr_aton+0x240>
8000c71c:	010007b7          	lui	a5,0x1000
8000c720:	00000413          	li	s0,0
8000c724:	f6f578e3          	bgeu	a0,a5,8000c694 <ip4addr_aton+0x16c>
8000c728:	00012783          	lw	a5,0(sp)
8000c72c:	0ff00713          	li	a4,255
8000c730:	f6f762e3          	bltu	a4,a5,8000c694 <ip4addr_aton+0x16c>
8000c734:	01879793          	slli	a5,a5,0x18
8000c738:	00f56533          	or	a0,a0,a5
8000c73c:	f49ff06f          	j	8000c684 <ip4addr_aton+0x15c>
8000c740:	000107b7          	lui	a5,0x10
8000c744:	00000413          	li	s0,0
8000c748:	f4f576e3          	bgeu	a0,a5,8000c694 <ip4addr_aton+0x16c>
8000c74c:	00012783          	lw	a5,0(sp)
8000c750:	0ff00693          	li	a3,255
8000c754:	f4f6e0e3          	bltu	a3,a5,8000c694 <ip4addr_aton+0x16c>
8000c758:	00412703          	lw	a4,4(sp)
8000c75c:	f2e6ece3          	bltu	a3,a4,8000c694 <ip4addr_aton+0x16c>
8000c760:	01879793          	slli	a5,a5,0x18
8000c764:	01071713          	slli	a4,a4,0x10
8000c768:	00e7e7b3          	or	a5,a5,a4
8000c76c:	fcdff06f          	j	8000c738 <ip4addr_aton+0x210>
8000c770:	00000413          	li	s0,0
8000c774:	f21ff06f          	j	8000c694 <ip4addr_aton+0x16c>

8000c778 <ipaddr_addr>:
8000c778:	fe010113          	addi	sp,sp,-32
8000c77c:	00c10593          	addi	a1,sp,12
8000c780:	00112e23          	sw	ra,28(sp)
8000c784:	da5ff0ef          	jal	ra,8000c528 <ip4addr_aton>
8000c788:	00050a63          	beqz	a0,8000c79c <ipaddr_addr+0x24>
8000c78c:	00c12503          	lw	a0,12(sp)
8000c790:	01c12083          	lw	ra,28(sp)
8000c794:	02010113          	addi	sp,sp,32
8000c798:	00008067          	ret
8000c79c:	fff00513          	li	a0,-1
8000c7a0:	ff1ff06f          	j	8000c790 <ipaddr_addr+0x18>

8000c7a4 <ip4addr_ntoa_r>:
8000c7a4:	fb010113          	addi	sp,sp,-80
8000c7a8:	04912223          	sw	s1,68(sp)
8000c7ac:	05212023          	sw	s2,64(sp)
8000c7b0:	03312e23          	sw	s3,60(sp)
8000c7b4:	03612823          	sw	s6,48(sp)
8000c7b8:	03812423          	sw	s8,40(sp)
8000c7bc:	03912223          	sw	s9,36(sp)
8000c7c0:	03a12023          	sw	s10,32(sp)
8000c7c4:	04112623          	sw	ra,76(sp)
8000c7c8:	04812423          	sw	s0,72(sp)
8000c7cc:	03412c23          	sw	s4,56(sp)
8000c7d0:	03512a23          	sw	s5,52(sp)
8000c7d4:	03712623          	sw	s7,44(sp)
8000c7d8:	00052783          	lw	a5,0(a0)
8000c7dc:	00058493          	mv	s1,a1
8000c7e0:	00058b13          	mv	s6,a1
8000c7e4:	00f12e23          	sw	a5,28(sp)
8000c7e8:	00000993          	li	s3,0
8000c7ec:	01c10913          	addi	s2,sp,28
8000c7f0:	00900c93          	li	s9,9
8000c7f4:	0ff00d13          	li	s10,255
8000c7f8:	02e00c13          	li	s8,46
8000c7fc:	00094a03          	lbu	s4,0(s2)
8000c800:	00000413          	li	s0,0
8000c804:	00a00593          	li	a1,10
8000c808:	000a0513          	mv	a0,s4
8000c80c:	00c12623          	sw	a2,12(sp)
8000c810:	239000ef          	jal	ra,8000d248 <__udivsi3>
8000c814:	0ff57b93          	andi	s7,a0,255
8000c818:	00a00593          	li	a1,10
8000c81c:	000a0513          	mv	a0,s4
8000c820:	271000ef          	jal	ra,8000d290 <__umodsi3>
8000c824:	02010793          	addi	a5,sp,32
8000c828:	03050513          	addi	a0,a0,48
8000c82c:	008787b3          	add	a5,a5,s0
8000c830:	00140a93          	addi	s5,s0,1
8000c834:	fea78c23          	sb	a0,-8(a5) # fff8 <_stack_size+0xf7f8>
8000c838:	0ffafa93          	andi	s5,s5,255
8000c83c:	00c12603          	lw	a2,12(sp)
8000c840:	074ce863          	bltu	s9,s4,8000c8b0 <ip4addr_ntoa_r+0x10c>
8000c844:	01790023          	sb	s7,0(s2)
8000c848:	00098713          	mv	a4,s3
8000c84c:	000b0793          	mv	a5,s6
8000c850:	00198993          	addi	s3,s3,1
8000c854:	07a41463          	bne	s0,s10,8000c8bc <ip4addr_ntoa_r+0x118>
8000c858:	08c75863          	bge	a4,a2,8000c8e8 <ip4addr_ntoa_r+0x144>
8000c85c:	01878023          	sb	s8,0(a5)
8000c860:	00190913          	addi	s2,s2,1
8000c864:	02010713          	addi	a4,sp,32
8000c868:	00178b13          	addi	s6,a5,1
8000c86c:	f8e918e3          	bne	s2,a4,8000c7fc <ip4addr_ntoa_r+0x58>
8000c870:	00078023          	sb	zero,0(a5)
8000c874:	00048513          	mv	a0,s1
8000c878:	04c12083          	lw	ra,76(sp)
8000c87c:	04812403          	lw	s0,72(sp)
8000c880:	04412483          	lw	s1,68(sp)
8000c884:	04012903          	lw	s2,64(sp)
8000c888:	03c12983          	lw	s3,60(sp)
8000c88c:	03812a03          	lw	s4,56(sp)
8000c890:	03412a83          	lw	s5,52(sp)
8000c894:	03012b03          	lw	s6,48(sp)
8000c898:	02c12b83          	lw	s7,44(sp)
8000c89c:	02812c03          	lw	s8,40(sp)
8000c8a0:	02412c83          	lw	s9,36(sp)
8000c8a4:	02012d03          	lw	s10,32(sp)
8000c8a8:	05010113          	addi	sp,sp,80
8000c8ac:	00008067          	ret
8000c8b0:	000b8a13          	mv	s4,s7
8000c8b4:	000a8413          	mv	s0,s5
8000c8b8:	f4dff06f          	j	8000c804 <ip4addr_ntoa_r+0x60>
8000c8bc:	fff40693          	addi	a3,s0,-1
8000c8c0:	0ff6f693          	andi	a3,a3,255
8000c8c4:	02c75263          	bge	a4,a2,8000c8e8 <ip4addr_ntoa_r+0x144>
8000c8c8:	02010713          	addi	a4,sp,32
8000c8cc:	00870433          	add	s0,a4,s0
8000c8d0:	ff844703          	lbu	a4,-8(s0)
8000c8d4:	00178793          	addi	a5,a5,1
8000c8d8:	00068413          	mv	s0,a3
8000c8dc:	fee78fa3          	sb	a4,-1(a5)
8000c8e0:	00098713          	mv	a4,s3
8000c8e4:	f6dff06f          	j	8000c850 <ip4addr_ntoa_r+0xac>
8000c8e8:	00000513          	li	a0,0
8000c8ec:	f8dff06f          	j	8000c878 <ip4addr_ntoa_r+0xd4>

8000c8f0 <ip4addr_ntoa>:
8000c8f0:	01000613          	li	a2,16
8000c8f4:	c3c18593          	addi	a1,gp,-964 # 800033d4 <str.4106>
8000c8f8:	eadff06f          	j	8000c7a4 <ip4addr_ntoa_r>

8000c8fc <ethernet_input>:
8000c8fc:	ff010113          	addi	sp,sp,-16
8000c900:	00812423          	sw	s0,8(sp)
8000c904:	00112623          	sw	ra,12(sp)
8000c908:	00912223          	sw	s1,4(sp)
8000c90c:	01212023          	sw	s2,0(sp)
8000c910:	00a55703          	lhu	a4,10(a0)
8000c914:	01000793          	li	a5,16
8000c918:	00050413          	mv	s0,a0
8000c91c:	00e7ec63          	bltu	a5,a4,8000c934 <ethernet_input+0x38>
8000c920:	a0c18793          	addi	a5,gp,-1524 # 800031a4 <lwip_stats>
8000c924:	0507a703          	lw	a4,80(a5)
8000c928:	00170713          	addi	a4,a4,1
8000c92c:	04e7a823          	sw	a4,80(a5)
8000c930:	0a00006f          	j	8000c9d0 <ethernet_input+0xd4>
8000c934:	00f54783          	lbu	a5,15(a0)
8000c938:	00058913          	mv	s2,a1
8000c93c:	00079863          	bnez	a5,8000c94c <ethernet_input+0x50>
8000c940:	0385c783          	lbu	a5,56(a1)
8000c944:	00178793          	addi	a5,a5,1
8000c948:	00f507a3          	sb	a5,15(a0)
8000c94c:	00442503          	lw	a0,4(s0)
8000c950:	00f54483          	lbu	s1,15(a0)
8000c954:	00e54783          	lbu	a5,14(a0)
8000c958:	00849493          	slli	s1,s1,0x8
8000c95c:	00f4e4b3          	or	s1,s1,a5
8000c960:	00254783          	lbu	a5,2(a0)
8000c964:	0017f713          	andi	a4,a5,1
8000c968:	02070663          	beqz	a4,8000c994 <ethernet_input+0x98>
8000c96c:	00100713          	li	a4,1
8000c970:	06e79c63          	bne	a5,a4,8000c9e8 <ethernet_input+0xec>
8000c974:	00354783          	lbu	a5,3(a0)
8000c978:	00079e63          	bnez	a5,8000c994 <ethernet_input+0x98>
8000c97c:	00454703          	lbu	a4,4(a0)
8000c980:	05e00793          	li	a5,94
8000c984:	00f71863          	bne	a4,a5,8000c994 <ethernet_input+0x98>
8000c988:	00d44783          	lbu	a5,13(s0)
8000c98c:	0107e793          	ori	a5,a5,16
8000c990:	00f406a3          	sb	a5,13(s0)
8000c994:	00800793          	li	a5,8
8000c998:	06f48863          	beq	s1,a5,8000ca08 <ethernet_input+0x10c>
8000c99c:	60800793          	li	a5,1544
8000c9a0:	f8f490e3          	bne	s1,a5,8000c920 <ethernet_input+0x24>
8000c9a4:	03594783          	lbu	a5,53(s2)
8000c9a8:	0087f793          	andi	a5,a5,8
8000c9ac:	02078863          	beqz	a5,8000c9dc <ethernet_input+0xe0>
8000c9b0:	01000593          	li	a1,16
8000c9b4:	00040513          	mv	a0,s0
8000c9b8:	c94fa0ef          	jal	ra,80006e4c <pbuf_remove_header>
8000c9bc:	08050863          	beqz	a0,8000ca4c <ethernet_input+0x150>
8000c9c0:	a0c18793          	addi	a5,gp,-1524 # 800031a4 <lwip_stats>
8000c9c4:	0447a703          	lw	a4,68(a5)
8000c9c8:	00170713          	addi	a4,a4,1
8000c9cc:	04e7a223          	sw	a4,68(a5)
8000c9d0:	03c7a703          	lw	a4,60(a5)
8000c9d4:	00170713          	addi	a4,a4,1
8000c9d8:	02e7ae23          	sw	a4,60(a5)
8000c9dc:	00040513          	mv	a0,s0
8000c9e0:	cf4fa0ef          	jal	ra,80006ed4 <pbuf_free>
8000c9e4:	04c0006f          	j	8000ca30 <ethernet_input+0x134>
8000c9e8:	00600613          	li	a2,6
8000c9ec:	85418593          	addi	a1,gp,-1964 # 80002fec <ethbroadcast>
8000c9f0:	00250513          	addi	a0,a0,2
8000c9f4:	6a0010ef          	jal	ra,8000e094 <memcmp>
8000c9f8:	f8051ee3          	bnez	a0,8000c994 <ethernet_input+0x98>
8000c9fc:	00d44783          	lbu	a5,13(s0)
8000ca00:	0087e793          	ori	a5,a5,8
8000ca04:	f8dff06f          	j	8000c990 <ethernet_input+0x94>
8000ca08:	03594783          	lbu	a5,53(s2)
8000ca0c:	0087f793          	andi	a5,a5,8
8000ca10:	fc0786e3          	beqz	a5,8000c9dc <ethernet_input+0xe0>
8000ca14:	01000593          	li	a1,16
8000ca18:	00040513          	mv	a0,s0
8000ca1c:	c30fa0ef          	jal	ra,80006e4c <pbuf_remove_header>
8000ca20:	fa051ee3          	bnez	a0,8000c9dc <ethernet_input+0xe0>
8000ca24:	00090593          	mv	a1,s2
8000ca28:	00040513          	mv	a0,s0
8000ca2c:	b30ff0ef          	jal	ra,8000bd5c <ip4_input>
8000ca30:	00c12083          	lw	ra,12(sp)
8000ca34:	00812403          	lw	s0,8(sp)
8000ca38:	00412483          	lw	s1,4(sp)
8000ca3c:	00012903          	lw	s2,0(sp)
8000ca40:	00000513          	li	a0,0
8000ca44:	01010113          	addi	sp,sp,16
8000ca48:	00008067          	ret
8000ca4c:	00090593          	mv	a1,s2
8000ca50:	00040513          	mv	a0,s0
8000ca54:	ad8fe0ef          	jal	ra,8000ad2c <etharp_input>
8000ca58:	fd9ff06f          	j	8000ca30 <ethernet_input+0x134>

8000ca5c <ethernet_output>:
8000ca5c:	fd010113          	addi	sp,sp,-48
8000ca60:	01312e23          	sw	s3,28(sp)
8000ca64:	00050993          	mv	s3,a0
8000ca68:	00070513          	mv	a0,a4
8000ca6c:	00d12623          	sw	a3,12(sp)
8000ca70:	02112623          	sw	ra,44(sp)
8000ca74:	02912223          	sw	s1,36(sp)
8000ca78:	03212023          	sw	s2,32(sp)
8000ca7c:	01412c23          	sw	s4,24(sp)
8000ca80:	00058913          	mv	s2,a1
8000ca84:	00060a13          	mv	s4,a2
8000ca88:	02812423          	sw	s0,40(sp)
8000ca8c:	a24f90ef          	jal	ra,80005cb0 <lwip_htons>
8000ca90:	00050493          	mv	s1,a0
8000ca94:	01000593          	li	a1,16
8000ca98:	00090513          	mv	a0,s2
8000ca9c:	ba0fa0ef          	jal	ra,80006e3c <pbuf_add_header>
8000caa0:	00c12683          	lw	a3,12(sp)
8000caa4:	06051063          	bnez	a0,8000cb04 <ethernet_output+0xa8>
8000caa8:	00492403          	lw	s0,4(s2)
8000caac:	00068593          	mv	a1,a3
8000cab0:	00600613          	li	a2,6
8000cab4:	00940723          	sb	s1,14(s0)
8000cab8:	0084d493          	srli	s1,s1,0x8
8000cabc:	009407a3          	sb	s1,15(s0)
8000cac0:	00240513          	addi	a0,s0,2
8000cac4:	600010ef          	jal	ra,8000e0c4 <memcpy>
8000cac8:	000a0593          	mv	a1,s4
8000cacc:	00840513          	addi	a0,s0,8
8000cad0:	00600613          	li	a2,6
8000cad4:	5f0010ef          	jal	ra,8000e0c4 <memcpy>
8000cad8:	02812403          	lw	s0,40(sp)
8000cadc:	0189a303          	lw	t1,24(s3)
8000cae0:	02c12083          	lw	ra,44(sp)
8000cae4:	02412483          	lw	s1,36(sp)
8000cae8:	01812a03          	lw	s4,24(sp)
8000caec:	00090593          	mv	a1,s2
8000caf0:	00098513          	mv	a0,s3
8000caf4:	02012903          	lw	s2,32(sp)
8000caf8:	01c12983          	lw	s3,28(sp)
8000cafc:	03010113          	addi	sp,sp,48
8000cb00:	00030067          	jr	t1
8000cb04:	a0c18793          	addi	a5,gp,-1524 # 800031a4 <lwip_stats>
8000cb08:	0147a703          	lw	a4,20(a5)
8000cb0c:	ffe00513          	li	a0,-2
8000cb10:	00170713          	addi	a4,a4,1
8000cb14:	00e7aa23          	sw	a4,20(a5)
8000cb18:	02c12083          	lw	ra,44(sp)
8000cb1c:	02812403          	lw	s0,40(sp)
8000cb20:	02412483          	lw	s1,36(sp)
8000cb24:	02012903          	lw	s2,32(sp)
8000cb28:	01c12983          	lw	s3,28(sp)
8000cb2c:	01812a03          	lw	s4,24(sp)
8000cb30:	03010113          	addi	sp,sp,48
8000cb34:	00008067          	ret

8000cb38 <memset>:
8000cb38:	00f00313          	li	t1,15
8000cb3c:	00050713          	mv	a4,a0
8000cb40:	02c37e63          	bgeu	t1,a2,8000cb7c <memset+0x44>
8000cb44:	00f77793          	andi	a5,a4,15
8000cb48:	0a079063          	bnez	a5,8000cbe8 <memset+0xb0>
8000cb4c:	08059263          	bnez	a1,8000cbd0 <memset+0x98>
8000cb50:	ff067693          	andi	a3,a2,-16
8000cb54:	00f67613          	andi	a2,a2,15
8000cb58:	00e686b3          	add	a3,a3,a4
8000cb5c:	00b72023          	sw	a1,0(a4)
8000cb60:	00b72223          	sw	a1,4(a4)
8000cb64:	00b72423          	sw	a1,8(a4)
8000cb68:	00b72623          	sw	a1,12(a4)
8000cb6c:	01070713          	addi	a4,a4,16
8000cb70:	fed766e3          	bltu	a4,a3,8000cb5c <memset+0x24>
8000cb74:	00061463          	bnez	a2,8000cb7c <memset+0x44>
8000cb78:	00008067          	ret
8000cb7c:	40c306b3          	sub	a3,t1,a2
8000cb80:	00269693          	slli	a3,a3,0x2
8000cb84:	00000297          	auipc	t0,0x0
8000cb88:	005686b3          	add	a3,a3,t0
8000cb8c:	00c68067          	jr	12(a3)
8000cb90:	00b70723          	sb	a1,14(a4)
8000cb94:	00b706a3          	sb	a1,13(a4)
8000cb98:	00b70623          	sb	a1,12(a4)
8000cb9c:	00b705a3          	sb	a1,11(a4)
8000cba0:	00b70523          	sb	a1,10(a4)
8000cba4:	00b704a3          	sb	a1,9(a4)
8000cba8:	00b70423          	sb	a1,8(a4)
8000cbac:	00b703a3          	sb	a1,7(a4)
8000cbb0:	00b70323          	sb	a1,6(a4)
8000cbb4:	00b702a3          	sb	a1,5(a4)
8000cbb8:	00b70223          	sb	a1,4(a4)
8000cbbc:	00b701a3          	sb	a1,3(a4)
8000cbc0:	00b70123          	sb	a1,2(a4)
8000cbc4:	00b700a3          	sb	a1,1(a4)
8000cbc8:	00b70023          	sb	a1,0(a4)
8000cbcc:	00008067          	ret
8000cbd0:	0ff5f593          	andi	a1,a1,255
8000cbd4:	00859693          	slli	a3,a1,0x8
8000cbd8:	00d5e5b3          	or	a1,a1,a3
8000cbdc:	01059693          	slli	a3,a1,0x10
8000cbe0:	00d5e5b3          	or	a1,a1,a3
8000cbe4:	f6dff06f          	j	8000cb50 <memset+0x18>
8000cbe8:	00279693          	slli	a3,a5,0x2
8000cbec:	00000297          	auipc	t0,0x0
8000cbf0:	005686b3          	add	a3,a3,t0
8000cbf4:	00008293          	mv	t0,ra
8000cbf8:	fa0680e7          	jalr	-96(a3)
8000cbfc:	00028093          	mv	ra,t0
8000cc00:	ff078793          	addi	a5,a5,-16
8000cc04:	40f70733          	sub	a4,a4,a5
8000cc08:	00f60633          	add	a2,a2,a5
8000cc0c:	f6c378e3          	bgeu	t1,a2,8000cb7c <memset+0x44>
8000cc10:	f3dff06f          	j	8000cb4c <memset+0x14>

8000cc14 <__bswapsi2>:
8000cc14:	01851713          	slli	a4,a0,0x18
8000cc18:	01855793          	srli	a5,a0,0x18
8000cc1c:	000106b7          	lui	a3,0x10
8000cc20:	00e7e7b3          	or	a5,a5,a4
8000cc24:	f0068693          	addi	a3,a3,-256 # ff00 <_stack_size+0xf700>
8000cc28:	40855713          	srai	a4,a0,0x8
8000cc2c:	00d77733          	and	a4,a4,a3
8000cc30:	00e7e7b3          	or	a5,a5,a4
8000cc34:	00851513          	slli	a0,a0,0x8
8000cc38:	00ff0737          	lui	a4,0xff0
8000cc3c:	00e57533          	and	a0,a0,a4
8000cc40:	00a7e533          	or	a0,a5,a0
8000cc44:	00008067          	ret

8000cc48 <__udivdi3>:
8000cc48:	fd010113          	addi	sp,sp,-48
8000cc4c:	02912223          	sw	s1,36(sp)
8000cc50:	01612823          	sw	s6,16(sp)
8000cc54:	02112623          	sw	ra,44(sp)
8000cc58:	02812423          	sw	s0,40(sp)
8000cc5c:	03212023          	sw	s2,32(sp)
8000cc60:	01312e23          	sw	s3,28(sp)
8000cc64:	01412c23          	sw	s4,24(sp)
8000cc68:	01512a23          	sw	s5,20(sp)
8000cc6c:	01712623          	sw	s7,12(sp)
8000cc70:	01812423          	sw	s8,8(sp)
8000cc74:	01912223          	sw	s9,4(sp)
8000cc78:	00050b13          	mv	s6,a0
8000cc7c:	00058493          	mv	s1,a1
8000cc80:	38069c63          	bnez	a3,8000d018 <__udivdi3+0x3d0>
8000cc84:	00060413          	mv	s0,a2
8000cc88:	00050993          	mv	s3,a0
8000cc8c:	ffff6917          	auipc	s2,0xffff6
8000cc90:	18090913          	addi	s2,s2,384 # 80002e0c <__clz_tab>
8000cc94:	12c5f863          	bgeu	a1,a2,8000cdc4 <__udivdi3+0x17c>
8000cc98:	000107b7          	lui	a5,0x10
8000cc9c:	00058a93          	mv	s5,a1
8000cca0:	10f67863          	bgeu	a2,a5,8000cdb0 <__udivdi3+0x168>
8000cca4:	0ff00693          	li	a3,255
8000cca8:	00c6b6b3          	sltu	a3,a3,a2
8000ccac:	00369693          	slli	a3,a3,0x3
8000ccb0:	00d657b3          	srl	a5,a2,a3
8000ccb4:	00f90933          	add	s2,s2,a5
8000ccb8:	00094703          	lbu	a4,0(s2)
8000ccbc:	00d706b3          	add	a3,a4,a3
8000ccc0:	02000713          	li	a4,32
8000ccc4:	40d70733          	sub	a4,a4,a3
8000ccc8:	00070c63          	beqz	a4,8000cce0 <__udivdi3+0x98>
8000cccc:	00e494b3          	sll	s1,s1,a4
8000ccd0:	00db56b3          	srl	a3,s6,a3
8000ccd4:	00e61433          	sll	s0,a2,a4
8000ccd8:	0096eab3          	or	s5,a3,s1
8000ccdc:	00eb19b3          	sll	s3,s6,a4
8000cce0:	01045b13          	srli	s6,s0,0x10
8000cce4:	000b0593          	mv	a1,s6
8000cce8:	000a8513          	mv	a0,s5
8000ccec:	5a4000ef          	jal	ra,8000d290 <__umodsi3>
8000ccf0:	00050913          	mv	s2,a0
8000ccf4:	000b0593          	mv	a1,s6
8000ccf8:	01041b93          	slli	s7,s0,0x10
8000ccfc:	000a8513          	mv	a0,s5
8000cd00:	548000ef          	jal	ra,8000d248 <__udivsi3>
8000cd04:	010bdb93          	srli	s7,s7,0x10
8000cd08:	00050493          	mv	s1,a0
8000cd0c:	00050593          	mv	a1,a0
8000cd10:	000b8513          	mv	a0,s7
8000cd14:	508000ef          	jal	ra,8000d21c <__mulsi3>
8000cd18:	01091913          	slli	s2,s2,0x10
8000cd1c:	0109d713          	srli	a4,s3,0x10
8000cd20:	00e96733          	or	a4,s2,a4
8000cd24:	00048a13          	mv	s4,s1
8000cd28:	00a77e63          	bgeu	a4,a0,8000cd44 <__udivdi3+0xfc>
8000cd2c:	00870733          	add	a4,a4,s0
8000cd30:	fff48a13          	addi	s4,s1,-1
8000cd34:	00876863          	bltu	a4,s0,8000cd44 <__udivdi3+0xfc>
8000cd38:	00a77663          	bgeu	a4,a0,8000cd44 <__udivdi3+0xfc>
8000cd3c:	ffe48a13          	addi	s4,s1,-2
8000cd40:	00870733          	add	a4,a4,s0
8000cd44:	40a704b3          	sub	s1,a4,a0
8000cd48:	000b0593          	mv	a1,s6
8000cd4c:	00048513          	mv	a0,s1
8000cd50:	540000ef          	jal	ra,8000d290 <__umodsi3>
8000cd54:	00050913          	mv	s2,a0
8000cd58:	000b0593          	mv	a1,s6
8000cd5c:	00048513          	mv	a0,s1
8000cd60:	4e8000ef          	jal	ra,8000d248 <__udivsi3>
8000cd64:	01099993          	slli	s3,s3,0x10
8000cd68:	00050493          	mv	s1,a0
8000cd6c:	00050593          	mv	a1,a0
8000cd70:	01091913          	slli	s2,s2,0x10
8000cd74:	000b8513          	mv	a0,s7
8000cd78:	0109d993          	srli	s3,s3,0x10
8000cd7c:	4a0000ef          	jal	ra,8000d21c <__mulsi3>
8000cd80:	013969b3          	or	s3,s2,s3
8000cd84:	00048613          	mv	a2,s1
8000cd88:	00a9fc63          	bgeu	s3,a0,8000cda0 <__udivdi3+0x158>
8000cd8c:	013409b3          	add	s3,s0,s3
8000cd90:	fff48613          	addi	a2,s1,-1
8000cd94:	0089e663          	bltu	s3,s0,8000cda0 <__udivdi3+0x158>
8000cd98:	00a9f463          	bgeu	s3,a0,8000cda0 <__udivdi3+0x158>
8000cd9c:	ffe48613          	addi	a2,s1,-2
8000cda0:	010a1793          	slli	a5,s4,0x10
8000cda4:	00c7e7b3          	or	a5,a5,a2
8000cda8:	00000a13          	li	s4,0
8000cdac:	1300006f          	j	8000cedc <__udivdi3+0x294>
8000cdb0:	010007b7          	lui	a5,0x1000
8000cdb4:	01000693          	li	a3,16
8000cdb8:	eef66ce3          	bltu	a2,a5,8000ccb0 <__udivdi3+0x68>
8000cdbc:	01800693          	li	a3,24
8000cdc0:	ef1ff06f          	j	8000ccb0 <__udivdi3+0x68>
8000cdc4:	00068a13          	mv	s4,a3
8000cdc8:	00061a63          	bnez	a2,8000cddc <__udivdi3+0x194>
8000cdcc:	00000593          	li	a1,0
8000cdd0:	00100513          	li	a0,1
8000cdd4:	474000ef          	jal	ra,8000d248 <__udivsi3>
8000cdd8:	00050413          	mv	s0,a0
8000cddc:	000107b7          	lui	a5,0x10
8000cde0:	12f47c63          	bgeu	s0,a5,8000cf18 <__udivdi3+0x2d0>
8000cde4:	0ff00793          	li	a5,255
8000cde8:	0087f463          	bgeu	a5,s0,8000cdf0 <__udivdi3+0x1a8>
8000cdec:	00800a13          	li	s4,8
8000cdf0:	014457b3          	srl	a5,s0,s4
8000cdf4:	00f90933          	add	s2,s2,a5
8000cdf8:	00094683          	lbu	a3,0(s2)
8000cdfc:	02000613          	li	a2,32
8000ce00:	014686b3          	add	a3,a3,s4
8000ce04:	40d60633          	sub	a2,a2,a3
8000ce08:	12061263          	bnez	a2,8000cf2c <__udivdi3+0x2e4>
8000ce0c:	408484b3          	sub	s1,s1,s0
8000ce10:	00100a13          	li	s4,1
8000ce14:	01045b13          	srli	s6,s0,0x10
8000ce18:	000b0593          	mv	a1,s6
8000ce1c:	00048513          	mv	a0,s1
8000ce20:	470000ef          	jal	ra,8000d290 <__umodsi3>
8000ce24:	00050913          	mv	s2,a0
8000ce28:	000b0593          	mv	a1,s6
8000ce2c:	00048513          	mv	a0,s1
8000ce30:	01041b93          	slli	s7,s0,0x10
8000ce34:	414000ef          	jal	ra,8000d248 <__udivsi3>
8000ce38:	010bdb93          	srli	s7,s7,0x10
8000ce3c:	00050493          	mv	s1,a0
8000ce40:	00050593          	mv	a1,a0
8000ce44:	000b8513          	mv	a0,s7
8000ce48:	3d4000ef          	jal	ra,8000d21c <__mulsi3>
8000ce4c:	01091913          	slli	s2,s2,0x10
8000ce50:	0109d713          	srli	a4,s3,0x10
8000ce54:	00e96733          	or	a4,s2,a4
8000ce58:	00048a93          	mv	s5,s1
8000ce5c:	00a77e63          	bgeu	a4,a0,8000ce78 <__udivdi3+0x230>
8000ce60:	00870733          	add	a4,a4,s0
8000ce64:	fff48a93          	addi	s5,s1,-1
8000ce68:	00876863          	bltu	a4,s0,8000ce78 <__udivdi3+0x230>
8000ce6c:	00a77663          	bgeu	a4,a0,8000ce78 <__udivdi3+0x230>
8000ce70:	ffe48a93          	addi	s5,s1,-2
8000ce74:	00870733          	add	a4,a4,s0
8000ce78:	40a704b3          	sub	s1,a4,a0
8000ce7c:	000b0593          	mv	a1,s6
8000ce80:	00048513          	mv	a0,s1
8000ce84:	40c000ef          	jal	ra,8000d290 <__umodsi3>
8000ce88:	00050913          	mv	s2,a0
8000ce8c:	000b0593          	mv	a1,s6
8000ce90:	00048513          	mv	a0,s1
8000ce94:	3b4000ef          	jal	ra,8000d248 <__udivsi3>
8000ce98:	01099993          	slli	s3,s3,0x10
8000ce9c:	00050493          	mv	s1,a0
8000cea0:	00050593          	mv	a1,a0
8000cea4:	01091913          	slli	s2,s2,0x10
8000cea8:	000b8513          	mv	a0,s7
8000ceac:	0109d993          	srli	s3,s3,0x10
8000ceb0:	36c000ef          	jal	ra,8000d21c <__mulsi3>
8000ceb4:	013969b3          	or	s3,s2,s3
8000ceb8:	00048613          	mv	a2,s1
8000cebc:	00a9fc63          	bgeu	s3,a0,8000ced4 <__udivdi3+0x28c>
8000cec0:	013409b3          	add	s3,s0,s3
8000cec4:	fff48613          	addi	a2,s1,-1
8000cec8:	0089e663          	bltu	s3,s0,8000ced4 <__udivdi3+0x28c>
8000cecc:	00a9f463          	bgeu	s3,a0,8000ced4 <__udivdi3+0x28c>
8000ced0:	ffe48613          	addi	a2,s1,-2
8000ced4:	010a9793          	slli	a5,s5,0x10
8000ced8:	00c7e7b3          	or	a5,a5,a2
8000cedc:	00078513          	mv	a0,a5
8000cee0:	000a0593          	mv	a1,s4
8000cee4:	02c12083          	lw	ra,44(sp)
8000cee8:	02812403          	lw	s0,40(sp)
8000ceec:	02412483          	lw	s1,36(sp)
8000cef0:	02012903          	lw	s2,32(sp)
8000cef4:	01c12983          	lw	s3,28(sp)
8000cef8:	01812a03          	lw	s4,24(sp)
8000cefc:	01412a83          	lw	s5,20(sp)
8000cf00:	01012b03          	lw	s6,16(sp)
8000cf04:	00c12b83          	lw	s7,12(sp)
8000cf08:	00812c03          	lw	s8,8(sp)
8000cf0c:	00412c83          	lw	s9,4(sp)
8000cf10:	03010113          	addi	sp,sp,48
8000cf14:	00008067          	ret
8000cf18:	010007b7          	lui	a5,0x1000
8000cf1c:	01000a13          	li	s4,16
8000cf20:	ecf468e3          	bltu	s0,a5,8000cdf0 <__udivdi3+0x1a8>
8000cf24:	01800a13          	li	s4,24
8000cf28:	ec9ff06f          	j	8000cdf0 <__udivdi3+0x1a8>
8000cf2c:	00c41433          	sll	s0,s0,a2
8000cf30:	00d4da33          	srl	s4,s1,a3
8000cf34:	00cb19b3          	sll	s3,s6,a2
8000cf38:	00db56b3          	srl	a3,s6,a3
8000cf3c:	01045b13          	srli	s6,s0,0x10
8000cf40:	00c494b3          	sll	s1,s1,a2
8000cf44:	000b0593          	mv	a1,s6
8000cf48:	000a0513          	mv	a0,s4
8000cf4c:	0096eab3          	or	s5,a3,s1
8000cf50:	340000ef          	jal	ra,8000d290 <__umodsi3>
8000cf54:	00050913          	mv	s2,a0
8000cf58:	000b0593          	mv	a1,s6
8000cf5c:	000a0513          	mv	a0,s4
8000cf60:	01041b93          	slli	s7,s0,0x10
8000cf64:	2e4000ef          	jal	ra,8000d248 <__udivsi3>
8000cf68:	010bdb93          	srli	s7,s7,0x10
8000cf6c:	00050493          	mv	s1,a0
8000cf70:	00050593          	mv	a1,a0
8000cf74:	000b8513          	mv	a0,s7
8000cf78:	2a4000ef          	jal	ra,8000d21c <__mulsi3>
8000cf7c:	01091913          	slli	s2,s2,0x10
8000cf80:	010ad713          	srli	a4,s5,0x10
8000cf84:	00e96733          	or	a4,s2,a4
8000cf88:	00048a13          	mv	s4,s1
8000cf8c:	00a77e63          	bgeu	a4,a0,8000cfa8 <__udivdi3+0x360>
8000cf90:	00870733          	add	a4,a4,s0
8000cf94:	fff48a13          	addi	s4,s1,-1
8000cf98:	00876863          	bltu	a4,s0,8000cfa8 <__udivdi3+0x360>
8000cf9c:	00a77663          	bgeu	a4,a0,8000cfa8 <__udivdi3+0x360>
8000cfa0:	ffe48a13          	addi	s4,s1,-2
8000cfa4:	00870733          	add	a4,a4,s0
8000cfa8:	40a704b3          	sub	s1,a4,a0
8000cfac:	000b0593          	mv	a1,s6
8000cfb0:	00048513          	mv	a0,s1
8000cfb4:	2dc000ef          	jal	ra,8000d290 <__umodsi3>
8000cfb8:	00050913          	mv	s2,a0
8000cfbc:	000b0593          	mv	a1,s6
8000cfc0:	00048513          	mv	a0,s1
8000cfc4:	284000ef          	jal	ra,8000d248 <__udivsi3>
8000cfc8:	00050493          	mv	s1,a0
8000cfcc:	00050593          	mv	a1,a0
8000cfd0:	000b8513          	mv	a0,s7
8000cfd4:	248000ef          	jal	ra,8000d21c <__mulsi3>
8000cfd8:	010a9693          	slli	a3,s5,0x10
8000cfdc:	01091913          	slli	s2,s2,0x10
8000cfe0:	0106d693          	srli	a3,a3,0x10
8000cfe4:	00d967b3          	or	a5,s2,a3
8000cfe8:	00048713          	mv	a4,s1
8000cfec:	00a7fe63          	bgeu	a5,a0,8000d008 <__udivdi3+0x3c0>
8000cff0:	008787b3          	add	a5,a5,s0
8000cff4:	fff48713          	addi	a4,s1,-1
8000cff8:	0087e863          	bltu	a5,s0,8000d008 <__udivdi3+0x3c0>
8000cffc:	00a7f663          	bgeu	a5,a0,8000d008 <__udivdi3+0x3c0>
8000d000:	ffe48713          	addi	a4,s1,-2
8000d004:	008787b3          	add	a5,a5,s0
8000d008:	010a1a13          	slli	s4,s4,0x10
8000d00c:	40a784b3          	sub	s1,a5,a0
8000d010:	00ea6a33          	or	s4,s4,a4
8000d014:	e01ff06f          	j	8000ce14 <__udivdi3+0x1cc>
8000d018:	1ed5ec63          	bltu	a1,a3,8000d210 <__udivdi3+0x5c8>
8000d01c:	000107b7          	lui	a5,0x10
8000d020:	04f6f463          	bgeu	a3,a5,8000d068 <__udivdi3+0x420>
8000d024:	0ff00593          	li	a1,255
8000d028:	00d5b533          	sltu	a0,a1,a3
8000d02c:	00351513          	slli	a0,a0,0x3
8000d030:	00a6d733          	srl	a4,a3,a0
8000d034:	ffff6797          	auipc	a5,0xffff6
8000d038:	dd878793          	addi	a5,a5,-552 # 80002e0c <__clz_tab>
8000d03c:	00e787b3          	add	a5,a5,a4
8000d040:	0007c583          	lbu	a1,0(a5)
8000d044:	02000a13          	li	s4,32
8000d048:	00a585b3          	add	a1,a1,a0
8000d04c:	40ba0a33          	sub	s4,s4,a1
8000d050:	020a1663          	bnez	s4,8000d07c <__udivdi3+0x434>
8000d054:	00100793          	li	a5,1
8000d058:	e896e2e3          	bltu	a3,s1,8000cedc <__udivdi3+0x294>
8000d05c:	00cb3633          	sltu	a2,s6,a2
8000d060:	00164793          	xori	a5,a2,1
8000d064:	e79ff06f          	j	8000cedc <__udivdi3+0x294>
8000d068:	010007b7          	lui	a5,0x1000
8000d06c:	01000513          	li	a0,16
8000d070:	fcf6e0e3          	bltu	a3,a5,8000d030 <__udivdi3+0x3e8>
8000d074:	01800513          	li	a0,24
8000d078:	fb9ff06f          	j	8000d030 <__udivdi3+0x3e8>
8000d07c:	00b65ab3          	srl	s5,a2,a1
8000d080:	014696b3          	sll	a3,a3,s4
8000d084:	00daeab3          	or	s5,s5,a3
8000d088:	00b4d933          	srl	s2,s1,a1
8000d08c:	014497b3          	sll	a5,s1,s4
8000d090:	00bb55b3          	srl	a1,s6,a1
8000d094:	010adb93          	srli	s7,s5,0x10
8000d098:	00f5e4b3          	or	s1,a1,a5
8000d09c:	00090513          	mv	a0,s2
8000d0a0:	000b8593          	mv	a1,s7
8000d0a4:	014619b3          	sll	s3,a2,s4
8000d0a8:	1e8000ef          	jal	ra,8000d290 <__umodsi3>
8000d0ac:	00050413          	mv	s0,a0
8000d0b0:	000b8593          	mv	a1,s7
8000d0b4:	00090513          	mv	a0,s2
8000d0b8:	010a9c13          	slli	s8,s5,0x10
8000d0bc:	18c000ef          	jal	ra,8000d248 <__udivsi3>
8000d0c0:	010c5c13          	srli	s8,s8,0x10
8000d0c4:	00050913          	mv	s2,a0
8000d0c8:	00050593          	mv	a1,a0
8000d0cc:	000c0513          	mv	a0,s8
8000d0d0:	14c000ef          	jal	ra,8000d21c <__mulsi3>
8000d0d4:	01041413          	slli	s0,s0,0x10
8000d0d8:	0104d713          	srli	a4,s1,0x10
8000d0dc:	00e46733          	or	a4,s0,a4
8000d0e0:	00090c93          	mv	s9,s2
8000d0e4:	00a77e63          	bgeu	a4,a0,8000d100 <__udivdi3+0x4b8>
8000d0e8:	01570733          	add	a4,a4,s5
8000d0ec:	fff90c93          	addi	s9,s2,-1
8000d0f0:	01576863          	bltu	a4,s5,8000d100 <__udivdi3+0x4b8>
8000d0f4:	00a77663          	bgeu	a4,a0,8000d100 <__udivdi3+0x4b8>
8000d0f8:	ffe90c93          	addi	s9,s2,-2
8000d0fc:	01570733          	add	a4,a4,s5
8000d100:	40a70933          	sub	s2,a4,a0
8000d104:	000b8593          	mv	a1,s7
8000d108:	00090513          	mv	a0,s2
8000d10c:	184000ef          	jal	ra,8000d290 <__umodsi3>
8000d110:	00050413          	mv	s0,a0
8000d114:	000b8593          	mv	a1,s7
8000d118:	00090513          	mv	a0,s2
8000d11c:	12c000ef          	jal	ra,8000d248 <__udivsi3>
8000d120:	00050913          	mv	s2,a0
8000d124:	00050593          	mv	a1,a0
8000d128:	000c0513          	mv	a0,s8
8000d12c:	0f0000ef          	jal	ra,8000d21c <__mulsi3>
8000d130:	01049793          	slli	a5,s1,0x10
8000d134:	01041413          	slli	s0,s0,0x10
8000d138:	0107d793          	srli	a5,a5,0x10
8000d13c:	00f46733          	or	a4,s0,a5
8000d140:	00090613          	mv	a2,s2
8000d144:	00a77e63          	bgeu	a4,a0,8000d160 <__udivdi3+0x518>
8000d148:	01570733          	add	a4,a4,s5
8000d14c:	fff90613          	addi	a2,s2,-1
8000d150:	01576863          	bltu	a4,s5,8000d160 <__udivdi3+0x518>
8000d154:	00a77663          	bgeu	a4,a0,8000d160 <__udivdi3+0x518>
8000d158:	ffe90613          	addi	a2,s2,-2
8000d15c:	01570733          	add	a4,a4,s5
8000d160:	010c9793          	slli	a5,s9,0x10
8000d164:	00010e37          	lui	t3,0x10
8000d168:	00c7e7b3          	or	a5,a5,a2
8000d16c:	fffe0813          	addi	a6,t3,-1 # ffff <_stack_size+0xf7ff>
8000d170:	0107f333          	and	t1,a5,a6
8000d174:	0109f833          	and	a6,s3,a6
8000d178:	40a70733          	sub	a4,a4,a0
8000d17c:	0107de93          	srli	t4,a5,0x10
8000d180:	0109d993          	srli	s3,s3,0x10
8000d184:	00030513          	mv	a0,t1
8000d188:	00080593          	mv	a1,a6
8000d18c:	090000ef          	jal	ra,8000d21c <__mulsi3>
8000d190:	00050893          	mv	a7,a0
8000d194:	00098593          	mv	a1,s3
8000d198:	00030513          	mv	a0,t1
8000d19c:	080000ef          	jal	ra,8000d21c <__mulsi3>
8000d1a0:	00050313          	mv	t1,a0
8000d1a4:	00080593          	mv	a1,a6
8000d1a8:	000e8513          	mv	a0,t4
8000d1ac:	070000ef          	jal	ra,8000d21c <__mulsi3>
8000d1b0:	00050813          	mv	a6,a0
8000d1b4:	00098593          	mv	a1,s3
8000d1b8:	000e8513          	mv	a0,t4
8000d1bc:	060000ef          	jal	ra,8000d21c <__mulsi3>
8000d1c0:	0108d693          	srli	a3,a7,0x10
8000d1c4:	01030333          	add	t1,t1,a6
8000d1c8:	006686b3          	add	a3,a3,t1
8000d1cc:	0106f463          	bgeu	a3,a6,8000d1d4 <__udivdi3+0x58c>
8000d1d0:	01c50533          	add	a0,a0,t3
8000d1d4:	0106d613          	srli	a2,a3,0x10
8000d1d8:	00a60533          	add	a0,a2,a0
8000d1dc:	02a76663          	bltu	a4,a0,8000d208 <__udivdi3+0x5c0>
8000d1e0:	bca714e3          	bne	a4,a0,8000cda8 <__udivdi3+0x160>
8000d1e4:	00010737          	lui	a4,0x10
8000d1e8:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
8000d1ec:	00e6f6b3          	and	a3,a3,a4
8000d1f0:	01069693          	slli	a3,a3,0x10
8000d1f4:	00e8f8b3          	and	a7,a7,a4
8000d1f8:	014b1633          	sll	a2,s6,s4
8000d1fc:	011686b3          	add	a3,a3,a7
8000d200:	00000a13          	li	s4,0
8000d204:	ccd67ce3          	bgeu	a2,a3,8000cedc <__udivdi3+0x294>
8000d208:	fff78793          	addi	a5,a5,-1 # ffffff <_stack_size+0xfff7ff>
8000d20c:	b9dff06f          	j	8000cda8 <__udivdi3+0x160>
8000d210:	00000a13          	li	s4,0
8000d214:	00000793          	li	a5,0
8000d218:	cc5ff06f          	j	8000cedc <__udivdi3+0x294>

8000d21c <__mulsi3>:
8000d21c:	00050613          	mv	a2,a0
8000d220:	00000513          	li	a0,0
8000d224:	0015f693          	andi	a3,a1,1
8000d228:	00068463          	beqz	a3,8000d230 <__mulsi3+0x14>
8000d22c:	00c50533          	add	a0,a0,a2
8000d230:	0015d593          	srli	a1,a1,0x1
8000d234:	00161613          	slli	a2,a2,0x1
8000d238:	fe0596e3          	bnez	a1,8000d224 <__mulsi3+0x8>
8000d23c:	00008067          	ret

8000d240 <__divsi3>:
8000d240:	06054063          	bltz	a0,8000d2a0 <__umodsi3+0x10>
8000d244:	0605c663          	bltz	a1,8000d2b0 <__umodsi3+0x20>

8000d248 <__udivsi3>:
8000d248:	00058613          	mv	a2,a1
8000d24c:	00050593          	mv	a1,a0
8000d250:	fff00513          	li	a0,-1
8000d254:	02060c63          	beqz	a2,8000d28c <__udivsi3+0x44>
8000d258:	00100693          	li	a3,1
8000d25c:	00b67a63          	bgeu	a2,a1,8000d270 <__udivsi3+0x28>
8000d260:	00c05863          	blez	a2,8000d270 <__udivsi3+0x28>
8000d264:	00161613          	slli	a2,a2,0x1
8000d268:	00169693          	slli	a3,a3,0x1
8000d26c:	feb66ae3          	bltu	a2,a1,8000d260 <__udivsi3+0x18>
8000d270:	00000513          	li	a0,0
8000d274:	00c5e663          	bltu	a1,a2,8000d280 <__udivsi3+0x38>
8000d278:	40c585b3          	sub	a1,a1,a2
8000d27c:	00d56533          	or	a0,a0,a3
8000d280:	0016d693          	srli	a3,a3,0x1
8000d284:	00165613          	srli	a2,a2,0x1
8000d288:	fe0696e3          	bnez	a3,8000d274 <__udivsi3+0x2c>
8000d28c:	00008067          	ret

8000d290 <__umodsi3>:
8000d290:	00008293          	mv	t0,ra
8000d294:	fb5ff0ef          	jal	ra,8000d248 <__udivsi3>
8000d298:	00058513          	mv	a0,a1
8000d29c:	00028067          	jr	t0 # 8000cbec <memset+0xb4>
8000d2a0:	40a00533          	neg	a0,a0
8000d2a4:	0005d863          	bgez	a1,8000d2b4 <__umodsi3+0x24>
8000d2a8:	40b005b3          	neg	a1,a1
8000d2ac:	f9dff06f          	j	8000d248 <__udivsi3>
8000d2b0:	40b005b3          	neg	a1,a1
8000d2b4:	00008293          	mv	t0,ra
8000d2b8:	f91ff0ef          	jal	ra,8000d248 <__udivsi3>
8000d2bc:	40a00533          	neg	a0,a0
8000d2c0:	00028067          	jr	t0

8000d2c4 <__modsi3>:
8000d2c4:	00008293          	mv	t0,ra
8000d2c8:	0005ca63          	bltz	a1,8000d2dc <__modsi3+0x18>
8000d2cc:	00054c63          	bltz	a0,8000d2e4 <__modsi3+0x20>
8000d2d0:	f79ff0ef          	jal	ra,8000d248 <__udivsi3>
8000d2d4:	00058513          	mv	a0,a1
8000d2d8:	00028067          	jr	t0
8000d2dc:	40b005b3          	neg	a1,a1
8000d2e0:	fe0558e3          	bgez	a0,8000d2d0 <__modsi3+0xc>
8000d2e4:	40a00533          	neg	a0,a0
8000d2e8:	f61ff0ef          	jal	ra,8000d248 <__udivsi3>
8000d2ec:	40b00533          	neg	a0,a1
8000d2f0:	00028067          	jr	t0

Disassembly of section .text.startup:

8000d2f4 <main>:
8000d2f4:	fb010113          	addi	sp,sp,-80
8000d2f8:	04112623          	sw	ra,76(sp)
8000d2fc:	04812423          	sw	s0,72(sp)
8000d300:	04912223          	sw	s1,68(sp)
8000d304:	05212023          	sw	s2,64(sp)
8000d308:	03312e23          	sw	s3,60(sp)
8000d30c:	03412c23          	sw	s4,56(sp)
8000d310:	03512a23          	sw	s5,52(sp)
8000d314:	03612823          	sw	s6,48(sp)
8000d318:	03712623          	sw	s7,44(sp)
8000d31c:	03812423          	sw	s8,40(sp)
8000d320:	30047073          	csrci	mstatus,8
8000d324:	00000593          	li	a1,0
8000d328:	00000513          	li	a0,0
8000d32c:	f3cf80ef          	jal	ra,80005a68 <init_sbrk>
8000d330:	001e8537          	lui	a0,0x1e8
8000d334:	48050513          	addi	a0,a0,1152 # 1e8480 <_stack_size+0x1e7c80>
8000d338:	f84f80ef          	jal	ra,80005abc <delay_us>
8000d33c:	8701a783          	lw	a5,-1936(gp) # 80003008 <deadbeef>
8000d340:	1c078c63          	beqz	a5,8000d518 <main+0x224>
8000d344:	80002537          	lui	a0,0x80002
8000d348:	fd450513          	addi	a0,a0,-44 # 80001fd4 <_ram_heap_end+0xfffeffd4>
8000d34c:	fa0f80ef          	jal	ra,80005aec <print_uart0>
8000d350:	8e1f80ef          	jal	ra,80005c30 <hard_reboot>
8000d354:	80002537          	lui	a0,0x80002
8000d358:	06900593          	li	a1,105
8000d35c:	ffc50513          	addi	a0,a0,-4 # 80001ffc <_ram_heap_end+0xfffefffc>
8000d360:	1a4010ef          	jal	ra,8000e504 <iprintf>
8000d364:	f0000737          	lui	a4,0xf0000
8000d368:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
8000d36c:	80002537          	lui	a0,0x80002
8000d370:	09050513          	addi	a0,a0,144 # 80002090 <_ram_heap_end+0xffff0090>
8000d374:	0027e793          	ori	a5,a5,2
8000d378:	00f72223          	sw	a5,4(a4)
8000d37c:	188010ef          	jal	ra,8000e504 <iprintf>
8000d380:	aa4f60ef          	jal	ra,80003624 <sram_test_write_random_ints>
8000d384:	80002437          	lui	s0,0x80002
8000d388:	1a051063          	bnez	a0,8000d528 <main+0x234>
8000d38c:	80002537          	lui	a0,0x80002
8000d390:	0a050513          	addi	a0,a0,160 # 800020a0 <_ram_heap_end+0xffff00a0>
8000d394:	170010ef          	jal	ra,8000e504 <iprintf>
8000d398:	000805b7          	lui	a1,0x80
8000d39c:	90000537          	lui	a0,0x90000
8000d3a0:	ec8f80ef          	jal	ra,80005a68 <init_sbrk>
8000d3a4:	800025b7          	lui	a1,0x80002
8000d3a8:	0b458593          	addi	a1,a1,180 # 800020b4 <_ram_heap_end+0xffff00b4>
8000d3ac:	0bc40513          	addi	a0,s0,188 # 800020bc <_ram_heap_end+0xffff00bc>
8000d3b0:	154010ef          	jal	ra,8000e504 <iprintf>
8000d3b4:	f00547b7          	lui	a5,0xf0054
8000d3b8:	0007a023          	sw	zero,0(a5) # f0054000 <_ram_heap_end+0x70042000>
8000d3bc:	f0000737          	lui	a4,0xf0000
8000d3c0:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
8000d3c4:	01900613          	li	a2,25
8000d3c8:	00100693          	li	a3,1
8000d3cc:	ff77f793          	andi	a5,a5,-9
8000d3d0:	00f72223          	sw	a5,4(a4)
8000d3d4:	f00607b7          	lui	a5,0xf0060
8000d3d8:	03f00713          	li	a4,63
8000d3dc:	00e7a623          	sw	a4,12(a5) # f006000c <_ram_heap_end+0x7004e00c>
8000d3e0:	0007a223          	sw	zero,4(a5)
8000d3e4:	fff00713          	li	a4,-1
8000d3e8:	00e7a023          	sw	a4,0(a5)
8000d3ec:	f0010737          	lui	a4,0xf0010
8000d3f0:	00472783          	lw	a5,4(a4) # f0010004 <_ram_heap_end+0x6fffe004>
8000d3f4:	f0090537          	lui	a0,0xf0090
8000d3f8:	0027e793          	ori	a5,a5,2
8000d3fc:	00f72223          	sw	a5,4(a4)
8000d400:	f0011737          	lui	a4,0xf0011
8000d404:	00472783          	lw	a5,4(a4) # f0011004 <_ram_heap_end+0x6ffff004>
8000d408:	0027e793          	ori	a5,a5,2
8000d40c:	00f72223          	sw	a5,4(a4)
8000d410:	f00207b7          	lui	a5,0xf0020
8000d414:	0007a023          	sw	zero,0(a5) # f0020000 <_ram_heap_end+0x7000e000>
8000d418:	00c7a223          	sw	a2,4(a5)
8000d41c:	0007a423          	sw	zero,8(a5)
8000d420:	00018737          	lui	a4,0x18
8000d424:	0007a623          	sw	zero,12(a5)
8000d428:	6a070713          	addi	a4,a4,1696 # 186a0 <_stack_size+0x17ea0>
8000d42c:	00e7a823          	sw	a4,16(a5)
8000d430:	00d7a023          	sw	a3,0(a5)
8000d434:	f00217b7          	lui	a5,0xf0021
8000d438:	0007a023          	sw	zero,0(a5) # f0021000 <_ram_heap_end+0x7000f000>
8000d43c:	00c7a223          	sw	a2,4(a5)
8000d440:	0007a423          	sw	zero,8(a5)
8000d444:	0000c737          	lui	a4,0xc
8000d448:	0007a623          	sw	zero,12(a5)
8000d44c:	35070713          	addi	a4,a4,848 # c350 <_stack_size+0xbb50>
8000d450:	00e7a823          	sw	a4,16(a5)
8000d454:	00d7a023          	sw	a3,0(a5)
8000d458:	da4f80ef          	jal	ra,800059fc <i2c_init>
8000d45c:	30046073          	csrsi	mstatus,8
8000d460:	80c1a783          	lw	a5,-2036(gp) # 80002fa4 <_impure_ptr>
8000d464:	0007a937          	lui	s2,0x7a
8000d468:	0087a503          	lw	a0,8(a5)
8000d46c:	00a00493          	li	s1,10
8000d470:	00200a93          	li	s5,2
8000d474:	28d000ef          	jal	ra,8000df00 <fpurge>
8000d478:	80002537          	lui	a0,0x80002
8000d47c:	0d450513          	addi	a0,a0,212 # 800020d4 <_ram_heap_end+0xffff00d4>
8000d480:	084010ef          	jal	ra,8000e504 <iprintf>
8000d484:	80c1a783          	lw	a5,-2036(gp) # 80002fa4 <_impure_ptr>
8000d488:	000a0993          	mv	s3,s4
8000d48c:	f0000b37          	lui	s6,0xf0000
8000d490:	0087a503          	lw	a0,8(a5)
8000d494:	12090913          	addi	s2,s2,288 # 7a120 <_stack_size+0x79920>
8000d498:	668000ef          	jal	ra,8000db00 <fflush>
8000d49c:	87c1a783          	lw	a5,-1924(gp) # 80003014 <uart_config_reset_counter>
8000d4a0:	02fae863          	bltu	s5,a5,8000d4d0 <main+0x1dc>
8000d4a4:	000b2783          	lw	a5,0(s6) # f0000000 <_ram_heap_end+0x6ffee000>
8000d4a8:	0207d463          	bgez	a5,8000d4d0 <main+0x1dc>
8000d4ac:	02e00513          	li	a0,46
8000d4b0:	10c010ef          	jal	ra,8000e5bc <putchar>
8000d4b4:	80c1a783          	lw	a5,-2036(gp) # 80002fa4 <_impure_ptr>
8000d4b8:	fff48493          	addi	s1,s1,-1
8000d4bc:	0087a503          	lw	a0,8(a5)
8000d4c0:	640000ef          	jal	ra,8000db00 <fflush>
8000d4c4:	00090513          	mv	a0,s2
8000d4c8:	df4f80ef          	jal	ra,80005abc <delay_us>
8000d4cc:	fc0498e3          	bnez	s1,8000d49c <main+0x1a8>
8000d4d0:	80002537          	lui	a0,0x80002
8000d4d4:	7f050513          	addi	a0,a0,2032 # 800027f0 <_ram_heap_end+0xffff07f0>
8000d4d8:	02c010ef          	jal	ra,8000e504 <iprintf>
8000d4dc:	800034b7          	lui	s1,0x80003
8000d4e0:	02000613          	li	a2,32
8000d4e4:	f0c48593          	addi	a1,s1,-244 # 80002f0c <_ram_heap_end+0xffff0f0c>
8000d4e8:	99418513          	addi	a0,gp,-1644 # 8000312c <active_config>
8000d4ec:	3d9000ef          	jal	ra,8000e0c4 <memcpy>
8000d4f0:	87c1a703          	lw	a4,-1924(gp) # 80003014 <uart_config_reset_counter>
8000d4f4:	00200793          	li	a5,2
8000d4f8:	02e7fe63          	bgeu	a5,a4,8000d534 <main+0x240>
8000d4fc:	800025b7          	lui	a1,0x80002
8000d500:	8601ae23          	sw	zero,-1924(gp) # 80003014 <uart_config_reset_counter>
8000d504:	0f058593          	addi	a1,a1,240 # 800020f0 <_ram_heap_end+0xffff00f0>
8000d508:	80002537          	lui	a0,0x80002
8000d50c:	10050513          	addi	a0,a0,256 # 80002100 <_ram_heap_end+0xffff0100>
8000d510:	7f5000ef          	jal	ra,8000e504 <iprintf>
8000d514:	05c0006f          	j	8000d570 <main+0x27c>
8000d518:	deadc7b7          	lui	a5,0xdeadc
8000d51c:	eef78793          	addi	a5,a5,-273 # deadbeef <_ram_heap_end+0x5eac9eef>
8000d520:	86f1a823          	sw	a5,-1936(gp) # 80003008 <deadbeef>
8000d524:	e31ff06f          	j	8000d354 <main+0x60>
8000d528:	800025b7          	lui	a1,0x80002
8000d52c:	0c858593          	addi	a1,a1,200 # 800020c8 <_ram_heap_end+0xffff00c8>
8000d530:	e7dff06f          	j	8000d3ac <main+0xb8>
8000d534:	f00007b7          	lui	a5,0xf0000
8000d538:	0007a783          	lw	a5,0(a5) # f0000000 <_ram_heap_end+0x6ffee000>
8000d53c:	0007c863          	bltz	a5,8000d54c <main+0x258>
8000d540:	800025b7          	lui	a1,0x80002
8000d544:	11c58593          	addi	a1,a1,284 # 8000211c <_ram_heap_end+0xffff011c>
8000d548:	fc1ff06f          	j	8000d508 <main+0x214>
8000d54c:	f0090537          	lui	a0,0xf0090
8000d550:	c41f60ef          	jal	ra,80004190 <eeprom_probe>
8000d554:	2e051463          	bnez	a0,8000d83c <main+0x548>
8000d558:	99418513          	addi	a0,gp,-1644 # 8000312c <active_config>
8000d55c:	dccf60ef          	jal	ra,80003b28 <config_load>
8000d560:	2c051063          	bnez	a0,8000d820 <main+0x52c>
8000d564:	80002537          	lui	a0,0x80002
8000d568:	12850513          	addi	a0,a0,296 # 80002128 <_ram_heap_end+0xffff0128>
8000d56c:	799000ef          	jal	ra,8000e504 <iprintf>
8000d570:	30047073          	csrci	mstatus,8
8000d574:	99418413          	addi	s0,gp,-1644 # 8000312c <active_config>
8000d578:	01344503          	lbu	a0,19(s0)
8000d57c:	d19f70ef          	jal	ra,80005294 <hub_init>
8000d580:	8b5f70ef          	jal	ra,80004e34 <mac_lwip_init>
8000d584:	a20f80ef          	jal	ra,800057a4 <modbus_udp_init>
8000d588:	b70f60ef          	jal	ra,800038f8 <modbus_rtu_init>
8000d58c:	80002537          	lui	a0,0x80002
8000d590:	16c50513          	addi	a0,a0,364 # 8000216c <_ram_heap_end+0xffff016c>
8000d594:	771000ef          	jal	ra,8000e504 <iprintf>
8000d598:	f0000737          	lui	a4,0xf0000
8000d59c:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
8000d5a0:	ff87f793          	andi	a5,a5,-8
8000d5a4:	00f72223          	sw	a5,4(a4)
8000d5a8:	30046073          	csrsi	mstatus,8
8000d5ac:	80002537          	lui	a0,0x80002
8000d5b0:	18450513          	addi	a0,a0,388 # 80002184 <_ram_heap_end+0xffff0184>
8000d5b4:	751000ef          	jal	ra,8000e504 <iprintf>
8000d5b8:	800004b7          	lui	s1,0x80000
8000d5bc:	800026b7          	lui	a3,0x80002
8000d5c0:	13448793          	addi	a5,s1,308 # 80000134 <_ram_heap_end+0xfffee134>
8000d5c4:	00800893          	li	a7,8
8000d5c8:	00600813          	li	a6,6
8000d5cc:	00500713          	li	a4,5
8000d5d0:	1a468693          	addi	a3,a3,420 # 800021a4 <_ram_heap_end+0xffff01a4>
8000d5d4:	03f00613          	li	a2,63
8000d5d8:	00000593          	li	a1,0
8000d5dc:	00600513          	li	a0,6
8000d5e0:	8e0f80ef          	jal	ra,800056c0 <hub_print>
8000d5e4:	01444603          	lbu	a2,20(s0)
8000d5e8:	800025b7          	lui	a1,0x80002
8000d5ec:	1ac58593          	addi	a1,a1,428 # 800021ac <_ram_heap_end+0xffff01ac>
8000d5f0:	00010513          	mv	a0,sp
8000d5f4:	2fc010ef          	jal	ra,8000e8f0 <siprintf>
8000d5f8:	13448793          	addi	a5,s1,308
8000d5fc:	00050713          	mv	a4,a0
8000d600:	00800893          	li	a7,8
8000d604:	00600813          	li	a6,6
8000d608:	00010693          	mv	a3,sp
8000d60c:	03f00613          	li	a2,63
8000d610:	00800593          	li	a1,8
8000d614:	00000513          	li	a0,0
8000d618:	8a8f80ef          	jal	ra,800056c0 <hub_print>
8000d61c:	001e8937          	lui	s2,0x1e8
8000d620:	48090513          	addi	a0,s2,1152 # 1e8480 <_stack_size+0x1e7c80>
8000d624:	f69f50ef          	jal	ra,8000358c <process_and_wait>
8000d628:	800026b7          	lui	a3,0x80002
8000d62c:	13448793          	addi	a5,s1,308
8000d630:	00800893          	li	a7,8
8000d634:	00600813          	li	a6,6
8000d638:	00500713          	li	a4,5
8000d63c:	1b068693          	addi	a3,a3,432 # 800021b0 <_ram_heap_end+0xffff01b0>
8000d640:	03f00613          	li	a2,63
8000d644:	00000593          	li	a1,0
8000d648:	00600513          	li	a0,6
8000d64c:	874f80ef          	jal	ra,800056c0 <hub_print>
8000d650:	9b418413          	addi	s0,gp,-1612 # 8000314c <default_netif>
8000d654:	00444603          	lbu	a2,4(s0)
8000d658:	800029b7          	lui	s3,0x80002
8000d65c:	1b898593          	addi	a1,s3,440 # 800021b8 <_ram_heap_end+0xffff01b8>
8000d660:	00010513          	mv	a0,sp
8000d664:	28c010ef          	jal	ra,8000e8f0 <siprintf>
8000d668:	13448793          	addi	a5,s1,308
8000d66c:	00050713          	mv	a4,a0
8000d670:	00800893          	li	a7,8
8000d674:	00600813          	li	a6,6
8000d678:	00010693          	mv	a3,sp
8000d67c:	03f00613          	li	a2,63
8000d680:	00800593          	li	a1,8
8000d684:	00000513          	li	a0,0
8000d688:	838f80ef          	jal	ra,800056c0 <hub_print>
8000d68c:	48090513          	addi	a0,s2,1152
8000d690:	efdf50ef          	jal	ra,8000358c <process_and_wait>
8000d694:	00544603          	lbu	a2,5(s0)
8000d698:	1b898593          	addi	a1,s3,440
8000d69c:	00010513          	mv	a0,sp
8000d6a0:	250010ef          	jal	ra,8000e8f0 <siprintf>
8000d6a4:	13448793          	addi	a5,s1,308
8000d6a8:	00050713          	mv	a4,a0
8000d6ac:	00800893          	li	a7,8
8000d6b0:	00600813          	li	a6,6
8000d6b4:	00010693          	mv	a3,sp
8000d6b8:	03f00613          	li	a2,63
8000d6bc:	00800593          	li	a1,8
8000d6c0:	00000513          	li	a0,0
8000d6c4:	ffdf70ef          	jal	ra,800056c0 <hub_print>
8000d6c8:	48090513          	addi	a0,s2,1152
8000d6cc:	ec1f50ef          	jal	ra,8000358c <process_and_wait>
8000d6d0:	00644603          	lbu	a2,6(s0)
8000d6d4:	1b898593          	addi	a1,s3,440
8000d6d8:	00010513          	mv	a0,sp
8000d6dc:	214010ef          	jal	ra,8000e8f0 <siprintf>
8000d6e0:	13448793          	addi	a5,s1,308
8000d6e4:	00050713          	mv	a4,a0
8000d6e8:	00800893          	li	a7,8
8000d6ec:	00600813          	li	a6,6
8000d6f0:	00010693          	mv	a3,sp
8000d6f4:	03f00613          	li	a2,63
8000d6f8:	00800593          	li	a1,8
8000d6fc:	00000513          	li	a0,0
8000d700:	fc1f70ef          	jal	ra,800056c0 <hub_print>
8000d704:	48090513          	addi	a0,s2,1152
8000d708:	e85f50ef          	jal	ra,8000358c <process_and_wait>
8000d70c:	00744603          	lbu	a2,7(s0)
8000d710:	1b898593          	addi	a1,s3,440
8000d714:	00010513          	mv	a0,sp
8000d718:	1d8010ef          	jal	ra,8000e8f0 <siprintf>
8000d71c:	13448793          	addi	a5,s1,308
8000d720:	00050713          	mv	a4,a0
8000d724:	00800893          	li	a7,8
8000d728:	00600813          	li	a6,6
8000d72c:	00010693          	mv	a3,sp
8000d730:	03f00613          	li	a2,63
8000d734:	00800593          	li	a1,8
8000d738:	00000513          	li	a0,0
8000d73c:	f85f70ef          	jal	ra,800056c0 <hub_print>
8000d740:	48090513          	addi	a0,s2,1152
8000d744:	e49f50ef          	jal	ra,8000358c <process_and_wait>
8000d748:	8b81a603          	lw	a2,-1864(gp) # 80003050 <hub_frame_size>
8000d74c:	00000593          	li	a1,0
8000d750:	f0050537          	lui	a0,0xf0050
8000d754:	0007a4b7          	lui	s1,0x7a
8000d758:	be0ff0ef          	jal	ra,8000cb38 <memset>
8000d75c:	12048493          	addi	s1,s1,288 # 7a120 <_stack_size+0x79920>
8000d760:	80002bb7          	lui	s7,0x80002
8000d764:	80002c37          	lui	s8,0x80002
8000d768:	f0000937          	lui	s2,0xf0000
8000d76c:	00492783          	lw	a5,4(s2) # f0000004 <_ram_heap_end+0x6ffee004>
8000d770:	00048513          	mv	a0,s1
8000d774:	0017e793          	ori	a5,a5,1
8000d778:	00f92223          	sw	a5,4(s2)
8000d77c:	e11f50ef          	jal	ra,8000358c <process_and_wait>
8000d780:	00492783          	lw	a5,4(s2)
8000d784:	00048513          	mv	a0,s1
8000d788:	ffe7f793          	andi	a5,a5,-2
8000d78c:	00f92223          	sw	a5,4(s2)
8000d790:	dfdf50ef          	jal	ra,8000358c <process_and_wait>
8000d794:	30047073          	csrci	mstatus,8
8000d798:	f00547b7          	lui	a5,0xf0054
8000d79c:	0007a603          	lw	a2,0(a5) # f0054000 <_ram_heap_end+0x70042000>
8000d7a0:	8c81a883          	lw	a7,-1848(gp) # 80003060 <sbrk_heap_end>
8000d7a4:	88c1a703          	lw	a4,-1908(gp) # 80003024 <reg_irq_counter>
8000d7a8:	8b81a683          	lw	a3,-1864(gp) # 80003050 <hub_frame_size>
8000d7ac:	8881a783          	lw	a5,-1912(gp) # 80003020 <reg_sys_counter>
8000d7b0:	8841a803          	lw	a6,-1916(gp) # 8000301c <reg_scratch>
8000d7b4:	07f67613          	andi	a2,a2,127
8000d7b8:	06900593          	li	a1,105
8000d7bc:	1c0b8513          	addi	a0,s7,448 # 800021c0 <_ram_heap_end+0xffff01c0>
8000d7c0:	545000ef          	jal	ra,8000e504 <iprintf>
8000d7c4:	f00607b7          	lui	a5,0xf0060
8000d7c8:	0007a583          	lw	a1,0(a5) # f0060000 <_ram_heap_end+0x7004e000>
8000d7cc:	0047a603          	lw	a2,4(a5)
8000d7d0:	00c7a683          	lw	a3,12(a5)
8000d7d4:	0087a703          	lw	a4,8(a5)
8000d7d8:	0107a783          	lw	a5,16(a5)
8000d7dc:	23cc0513          	addi	a0,s8,572 # 8000223c <_ram_heap_end+0xffff023c>
8000d7e0:	525000ef          	jal	ra,8000e504 <iprintf>
8000d7e4:	a6df70ef          	jal	ra,80005250 <mac_print_stats>
8000d7e8:	30046073          	csrsi	mstatus,8
8000d7ec:	8881a783          	lw	a5,-1912(gp) # 80003020 <reg_sys_counter>
8000d7f0:	00178793          	addi	a5,a5,1
8000d7f4:	88f1a423          	sw	a5,-1912(gp) # 80003020 <reg_sys_counter>
8000d7f8:	8801a703          	lw	a4,-1920(gp) # 80003018 <reg_config_write>
8000d7fc:	00070863          	beqz	a4,8000d80c <main+0x518>
8000d800:	8801a703          	lw	a4,-1920(gp) # 80003018 <reg_config_write>
8000d804:	fff70713          	addi	a4,a4,-1
8000d808:	88e1a023          	sw	a4,-1920(gp) # 80003018 <reg_config_write>
8000d80c:	f0000737          	lui	a4,0xf0000
8000d810:	00472783          	lw	a5,4(a4) # f0000004 <_ram_heap_end+0x6ffee004>
8000d814:	ffd7f793          	andi	a5,a5,-3
8000d818:	00f72223          	sw	a5,4(a4)
8000d81c:	f4dff06f          	j	8000d768 <main+0x474>
8000d820:	f0c48593          	addi	a1,s1,-244
8000d824:	02000613          	li	a2,32
8000d828:	99418513          	addi	a0,gp,-1644 # 8000312c <active_config>
8000d82c:	099000ef          	jal	ra,8000e0c4 <memcpy>
8000d830:	800025b7          	lui	a1,0x80002
8000d834:	14458593          	addi	a1,a1,324 # 80002144 <_ram_heap_end+0xffff0144>
8000d838:	cd1ff06f          	j	8000d508 <main+0x214>
8000d83c:	800025b7          	lui	a1,0x80002
8000d840:	15858593          	addi	a1,a1,344 # 80002158 <_ram_heap_end+0xffff0158>
8000d844:	cc5ff06f          	j	8000d508 <main+0x214>

Disassembly of section .text.atoi:

8000d848 <atoi>:
8000d848:	00a00613          	li	a2,10
8000d84c:	00000593          	li	a1,0
8000d850:	4d00106f          	j	8000ed20 <strtol>

Disassembly of section .text._atoi_r:

8000d854 <_atoi_r>:
8000d854:	00a00693          	li	a3,10
8000d858:	00000613          	li	a2,0
8000d85c:	4a80106f          	j	8000ed04 <_strtol_r>

Disassembly of section .text.calloc:

8000d860 <calloc>:
8000d860:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000d864:	00058613          	mv	a2,a1
8000d868:	00050593          	mv	a1,a0
8000d86c:	0007a503          	lw	a0,0(a5)
8000d870:	1890006f          	j	8000e1f8 <_calloc_r>

Disassembly of section .text.__sflush_r:

8000d874 <__sflush_r>:
8000d874:	00c5d783          	lhu	a5,12(a1)
8000d878:	fe010113          	addi	sp,sp,-32
8000d87c:	00812c23          	sw	s0,24(sp)
8000d880:	00912a23          	sw	s1,20(sp)
8000d884:	00112e23          	sw	ra,28(sp)
8000d888:	01212823          	sw	s2,16(sp)
8000d88c:	01312623          	sw	s3,12(sp)
8000d890:	0087f713          	andi	a4,a5,8
8000d894:	00050493          	mv	s1,a0
8000d898:	00058413          	mv	s0,a1
8000d89c:	14071e63          	bnez	a4,8000d9f8 <__sflush_r+0x184>
8000d8a0:	0045a703          	lw	a4,4(a1)
8000d8a4:	00e04a63          	bgtz	a4,8000d8b8 <__sflush_r+0x44>
8000d8a8:	0405a703          	lw	a4,64(a1)
8000d8ac:	00e04663          	bgtz	a4,8000d8b8 <__sflush_r+0x44>
8000d8b0:	00000513          	li	a0,0
8000d8b4:	11c0006f          	j	8000d9d0 <__sflush_r+0x15c>
8000d8b8:	02c42703          	lw	a4,44(s0)
8000d8bc:	fe070ae3          	beqz	a4,8000d8b0 <__sflush_r+0x3c>
8000d8c0:	0004a903          	lw	s2,0(s1)
8000d8c4:	01379693          	slli	a3,a5,0x13
8000d8c8:	0004a023          	sw	zero,0(s1)
8000d8cc:	0a06de63          	bgez	a3,8000d988 <__sflush_r+0x114>
8000d8d0:	05442503          	lw	a0,84(s0)
8000d8d4:	00c45783          	lhu	a5,12(s0)
8000d8d8:	0047f793          	andi	a5,a5,4
8000d8dc:	00078e63          	beqz	a5,8000d8f8 <__sflush_r+0x84>
8000d8e0:	00442783          	lw	a5,4(s0)
8000d8e4:	40f50533          	sub	a0,a0,a5
8000d8e8:	03442783          	lw	a5,52(s0)
8000d8ec:	00078663          	beqz	a5,8000d8f8 <__sflush_r+0x84>
8000d8f0:	04042783          	lw	a5,64(s0)
8000d8f4:	40f50533          	sub	a0,a0,a5
8000d8f8:	02c42783          	lw	a5,44(s0)
8000d8fc:	02042583          	lw	a1,32(s0)
8000d900:	00050613          	mv	a2,a0
8000d904:	00000693          	li	a3,0
8000d908:	00048513          	mv	a0,s1
8000d90c:	000780e7          	jalr	a5
8000d910:	fff00793          	li	a5,-1
8000d914:	00c45703          	lhu	a4,12(s0)
8000d918:	02f51263          	bne	a0,a5,8000d93c <__sflush_r+0xc8>
8000d91c:	0004a683          	lw	a3,0(s1)
8000d920:	01d00793          	li	a5,29
8000d924:	0cd7e463          	bltu	a5,a3,8000d9ec <__sflush_r+0x178>
8000d928:	204007b7          	lui	a5,0x20400
8000d92c:	00178793          	addi	a5,a5,1 # 20400001 <_stack_size+0x203ff801>
8000d930:	00d7d7b3          	srl	a5,a5,a3
8000d934:	0017f793          	andi	a5,a5,1
8000d938:	0a078a63          	beqz	a5,8000d9ec <__sflush_r+0x178>
8000d93c:	01042783          	lw	a5,16(s0)
8000d940:	00042223          	sw	zero,4(s0)
8000d944:	00f42023          	sw	a5,0(s0)
8000d948:	01371793          	slli	a5,a4,0x13
8000d94c:	0007dc63          	bgez	a5,8000d964 <__sflush_r+0xf0>
8000d950:	fff00793          	li	a5,-1
8000d954:	00f51663          	bne	a0,a5,8000d960 <__sflush_r+0xec>
8000d958:	0004a783          	lw	a5,0(s1)
8000d95c:	00079463          	bnez	a5,8000d964 <__sflush_r+0xf0>
8000d960:	04a42a23          	sw	a0,84(s0)
8000d964:	03442583          	lw	a1,52(s0)
8000d968:	0124a023          	sw	s2,0(s1)
8000d96c:	f40582e3          	beqz	a1,8000d8b0 <__sflush_r+0x3c>
8000d970:	04440793          	addi	a5,s0,68
8000d974:	00f58663          	beq	a1,a5,8000d980 <__sflush_r+0x10c>
8000d978:	00048513          	mv	a0,s1
8000d97c:	0d1000ef          	jal	ra,8000e24c <_free_r>
8000d980:	02042a23          	sw	zero,52(s0)
8000d984:	f2dff06f          	j	8000d8b0 <__sflush_r+0x3c>
8000d988:	02042583          	lw	a1,32(s0)
8000d98c:	00100693          	li	a3,1
8000d990:	00000613          	li	a2,0
8000d994:	00048513          	mv	a0,s1
8000d998:	000700e7          	jalr	a4
8000d99c:	fff00793          	li	a5,-1
8000d9a0:	f2f51ae3          	bne	a0,a5,8000d8d4 <__sflush_r+0x60>
8000d9a4:	0004a783          	lw	a5,0(s1)
8000d9a8:	f20786e3          	beqz	a5,8000d8d4 <__sflush_r+0x60>
8000d9ac:	01d00713          	li	a4,29
8000d9b0:	00e78663          	beq	a5,a4,8000d9bc <__sflush_r+0x148>
8000d9b4:	01600713          	li	a4,22
8000d9b8:	00e79663          	bne	a5,a4,8000d9c4 <__sflush_r+0x150>
8000d9bc:	0124a023          	sw	s2,0(s1)
8000d9c0:	ef1ff06f          	j	8000d8b0 <__sflush_r+0x3c>
8000d9c4:	00c45783          	lhu	a5,12(s0)
8000d9c8:	0407e793          	ori	a5,a5,64
8000d9cc:	00f41623          	sh	a5,12(s0)
8000d9d0:	01c12083          	lw	ra,28(sp)
8000d9d4:	01812403          	lw	s0,24(sp)
8000d9d8:	01412483          	lw	s1,20(sp)
8000d9dc:	01012903          	lw	s2,16(sp)
8000d9e0:	00c12983          	lw	s3,12(sp)
8000d9e4:	02010113          	addi	sp,sp,32
8000d9e8:	00008067          	ret
8000d9ec:	04076713          	ori	a4,a4,64
8000d9f0:	00e41623          	sh	a4,12(s0)
8000d9f4:	fddff06f          	j	8000d9d0 <__sflush_r+0x15c>
8000d9f8:	0105a983          	lw	s3,16(a1)
8000d9fc:	ea098ae3          	beqz	s3,8000d8b0 <__sflush_r+0x3c>
8000da00:	0005a903          	lw	s2,0(a1)
8000da04:	0037f793          	andi	a5,a5,3
8000da08:	0135a023          	sw	s3,0(a1)
8000da0c:	41390933          	sub	s2,s2,s3
8000da10:	00000713          	li	a4,0
8000da14:	00079463          	bnez	a5,8000da1c <__sflush_r+0x1a8>
8000da18:	0145a703          	lw	a4,20(a1)
8000da1c:	00e42423          	sw	a4,8(s0)
8000da20:	e92058e3          	blez	s2,8000d8b0 <__sflush_r+0x3c>
8000da24:	02842783          	lw	a5,40(s0)
8000da28:	02042583          	lw	a1,32(s0)
8000da2c:	00090693          	mv	a3,s2
8000da30:	00098613          	mv	a2,s3
8000da34:	00048513          	mv	a0,s1
8000da38:	000780e7          	jalr	a5
8000da3c:	00a04c63          	bgtz	a0,8000da54 <__sflush_r+0x1e0>
8000da40:	00c45783          	lhu	a5,12(s0)
8000da44:	fff00513          	li	a0,-1
8000da48:	0407e793          	ori	a5,a5,64
8000da4c:	00f41623          	sh	a5,12(s0)
8000da50:	f81ff06f          	j	8000d9d0 <__sflush_r+0x15c>
8000da54:	00a989b3          	add	s3,s3,a0
8000da58:	40a90933          	sub	s2,s2,a0
8000da5c:	fc5ff06f          	j	8000da20 <__sflush_r+0x1ac>

Disassembly of section .text._fflush_r:

8000da60 <_fflush_r>:
8000da60:	0105a783          	lw	a5,16(a1)
8000da64:	08078a63          	beqz	a5,8000daf8 <_fflush_r+0x98>
8000da68:	fe010113          	addi	sp,sp,-32
8000da6c:	00812c23          	sw	s0,24(sp)
8000da70:	00112e23          	sw	ra,28(sp)
8000da74:	00050413          	mv	s0,a0
8000da78:	00050c63          	beqz	a0,8000da90 <_fflush_r+0x30>
8000da7c:	01852783          	lw	a5,24(a0) # f0050018 <_ram_heap_end+0x7003e018>
8000da80:	00079863          	bnez	a5,8000da90 <_fflush_r+0x30>
8000da84:	00b12623          	sw	a1,12(sp)
8000da88:	1c8000ef          	jal	ra,8000dc50 <__sinit>
8000da8c:	00c12583          	lw	a1,12(sp)
8000da90:	ffff5797          	auipc	a5,0xffff5
8000da94:	30078793          	addi	a5,a5,768 # 80002d90 <__sf_fake_stdin>
8000da98:	02f59263          	bne	a1,a5,8000dabc <_fflush_r+0x5c>
8000da9c:	00442583          	lw	a1,4(s0)
8000daa0:	00c59783          	lh	a5,12(a1)
8000daa4:	04078063          	beqz	a5,8000dae4 <_fflush_r+0x84>
8000daa8:	00040513          	mv	a0,s0
8000daac:	01812403          	lw	s0,24(sp)
8000dab0:	01c12083          	lw	ra,28(sp)
8000dab4:	02010113          	addi	sp,sp,32
8000dab8:	dbdff06f          	j	8000d874 <__sflush_r>
8000dabc:	ffff5797          	auipc	a5,0xffff5
8000dac0:	2f478793          	addi	a5,a5,756 # 80002db0 <__sf_fake_stdout>
8000dac4:	00f59663          	bne	a1,a5,8000dad0 <_fflush_r+0x70>
8000dac8:	00842583          	lw	a1,8(s0)
8000dacc:	fd5ff06f          	j	8000daa0 <_fflush_r+0x40>
8000dad0:	ffff5797          	auipc	a5,0xffff5
8000dad4:	2a078793          	addi	a5,a5,672 # 80002d70 <__sf_fake_stderr>
8000dad8:	fcf594e3          	bne	a1,a5,8000daa0 <_fflush_r+0x40>
8000dadc:	00c42583          	lw	a1,12(s0)
8000dae0:	fc1ff06f          	j	8000daa0 <_fflush_r+0x40>
8000dae4:	01c12083          	lw	ra,28(sp)
8000dae8:	01812403          	lw	s0,24(sp)
8000daec:	00000513          	li	a0,0
8000daf0:	02010113          	addi	sp,sp,32
8000daf4:	00008067          	ret
8000daf8:	00000513          	li	a0,0
8000dafc:	00008067          	ret

Disassembly of section .text.fflush:

8000db00 <fflush>:
8000db00:	00050593          	mv	a1,a0
8000db04:	00051c63          	bnez	a0,8000db1c <fflush+0x1c>
8000db08:	c5018793          	addi	a5,gp,-944 # 800033e8 <_bss_end>
8000db0c:	0007a503          	lw	a0,0(a5)
8000db10:	00000597          	auipc	a1,0x0
8000db14:	f5058593          	addi	a1,a1,-176 # 8000da60 <_fflush_r>
8000db18:	4a80006f          	j	8000dfc0 <_fwalk_reent>
8000db1c:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000db20:	0007a503          	lw	a0,0(a5)
8000db24:	f3dff06f          	j	8000da60 <_fflush_r>

Disassembly of section .text.__fp_lock:

8000db28 <__fp_lock>:
8000db28:	00000513          	li	a0,0
8000db2c:	00008067          	ret

Disassembly of section .text.std:

8000db30 <std>:
8000db30:	ff010113          	addi	sp,sp,-16
8000db34:	00812423          	sw	s0,8(sp)
8000db38:	00112623          	sw	ra,12(sp)
8000db3c:	00050413          	mv	s0,a0
8000db40:	00b51623          	sh	a1,12(a0)
8000db44:	00c51723          	sh	a2,14(a0)
8000db48:	00052023          	sw	zero,0(a0)
8000db4c:	00052223          	sw	zero,4(a0)
8000db50:	00052423          	sw	zero,8(a0)
8000db54:	06052223          	sw	zero,100(a0)
8000db58:	00052823          	sw	zero,16(a0)
8000db5c:	00052a23          	sw	zero,20(a0)
8000db60:	00052c23          	sw	zero,24(a0)
8000db64:	00800613          	li	a2,8
8000db68:	00000593          	li	a1,0
8000db6c:	05c50513          	addi	a0,a0,92
8000db70:	fc9fe0ef          	jal	ra,8000cb38 <memset>
8000db74:	00001797          	auipc	a5,0x1
8000db78:	df078793          	addi	a5,a5,-528 # 8000e964 <__sread>
8000db7c:	02f42223          	sw	a5,36(s0)
8000db80:	00001797          	auipc	a5,0x1
8000db84:	e3c78793          	addi	a5,a5,-452 # 8000e9bc <__swrite>
8000db88:	02f42423          	sw	a5,40(s0)
8000db8c:	00001797          	auipc	a5,0x1
8000db90:	eb478793          	addi	a5,a5,-332 # 8000ea40 <__sseek>
8000db94:	02f42623          	sw	a5,44(s0)
8000db98:	00001797          	auipc	a5,0x1
8000db9c:	f0078793          	addi	a5,a5,-256 # 8000ea98 <__sclose>
8000dba0:	02842023          	sw	s0,32(s0)
8000dba4:	02f42823          	sw	a5,48(s0)
8000dba8:	00c12083          	lw	ra,12(sp)
8000dbac:	00812403          	lw	s0,8(sp)
8000dbb0:	01010113          	addi	sp,sp,16
8000dbb4:	00008067          	ret

Disassembly of section .text._cleanup_r:

8000dbb8 <_cleanup_r>:
8000dbb8:	00000597          	auipc	a1,0x0
8000dbbc:	ea858593          	addi	a1,a1,-344 # 8000da60 <_fflush_r>
8000dbc0:	4000006f          	j	8000dfc0 <_fwalk_reent>

Disassembly of section .text.__fp_unlock:

8000dbc4 <__fp_unlock>:
8000dbc4:	00000513          	li	a0,0
8000dbc8:	00008067          	ret

Disassembly of section .text.__sfmoreglue:

8000dbcc <__sfmoreglue>:
8000dbcc:	ff010113          	addi	sp,sp,-16
8000dbd0:	fff58613          	addi	a2,a1,-1
8000dbd4:	00812423          	sw	s0,8(sp)
8000dbd8:	00161413          	slli	s0,a2,0x1
8000dbdc:	00c40433          	add	s0,s0,a2
8000dbe0:	00241413          	slli	s0,s0,0x2
8000dbe4:	00c40433          	add	s0,s0,a2
8000dbe8:	00341413          	slli	s0,s0,0x3
8000dbec:	01212023          	sw	s2,0(sp)
8000dbf0:	00058913          	mv	s2,a1
8000dbf4:	07440593          	addi	a1,s0,116
8000dbf8:	00912223          	sw	s1,4(sp)
8000dbfc:	00112623          	sw	ra,12(sp)
8000dc00:	750000ef          	jal	ra,8000e350 <_malloc_r>
8000dc04:	00050493          	mv	s1,a0
8000dc08:	02050063          	beqz	a0,8000dc28 <__sfmoreglue+0x5c>
8000dc0c:	00052023          	sw	zero,0(a0)
8000dc10:	01252223          	sw	s2,4(a0)
8000dc14:	00c50513          	addi	a0,a0,12
8000dc18:	00a4a423          	sw	a0,8(s1)
8000dc1c:	06840613          	addi	a2,s0,104
8000dc20:	00000593          	li	a1,0
8000dc24:	f15fe0ef          	jal	ra,8000cb38 <memset>
8000dc28:	00c12083          	lw	ra,12(sp)
8000dc2c:	00812403          	lw	s0,8(sp)
8000dc30:	00048513          	mv	a0,s1
8000dc34:	00012903          	lw	s2,0(sp)
8000dc38:	00412483          	lw	s1,4(sp)
8000dc3c:	01010113          	addi	sp,sp,16
8000dc40:	00008067          	ret

Disassembly of section .text._cleanup:

8000dc44 <_cleanup>:
8000dc44:	c5018793          	addi	a5,gp,-944 # 800033e8 <_bss_end>
8000dc48:	0007a503          	lw	a0,0(a5)
8000dc4c:	f6dff06f          	j	8000dbb8 <_cleanup_r>

Disassembly of section .text.__sinit:

8000dc50 <__sinit>:
8000dc50:	01852783          	lw	a5,24(a0)
8000dc54:	0a079463          	bnez	a5,8000dcfc <__sinit+0xac>
8000dc58:	ff010113          	addi	sp,sp,-16
8000dc5c:	00112623          	sw	ra,12(sp)
8000dc60:	00812423          	sw	s0,8(sp)
8000dc64:	00000797          	auipc	a5,0x0
8000dc68:	f5478793          	addi	a5,a5,-172 # 8000dbb8 <_cleanup_r>
8000dc6c:	02f52423          	sw	a5,40(a0)
8000dc70:	c5018793          	addi	a5,gp,-944 # 800033e8 <_bss_end>
8000dc74:	0007a783          	lw	a5,0(a5)
8000dc78:	04052423          	sw	zero,72(a0)
8000dc7c:	04052623          	sw	zero,76(a0)
8000dc80:	04052823          	sw	zero,80(a0)
8000dc84:	00f51663          	bne	a0,a5,8000dc90 <__sinit+0x40>
8000dc88:	00100793          	li	a5,1
8000dc8c:	00f52c23          	sw	a5,24(a0)
8000dc90:	00050413          	mv	s0,a0
8000dc94:	06c000ef          	jal	ra,8000dd00 <__sfp>
8000dc98:	00a42223          	sw	a0,4(s0)
8000dc9c:	00040513          	mv	a0,s0
8000dca0:	060000ef          	jal	ra,8000dd00 <__sfp>
8000dca4:	00a42423          	sw	a0,8(s0)
8000dca8:	00040513          	mv	a0,s0
8000dcac:	054000ef          	jal	ra,8000dd00 <__sfp>
8000dcb0:	00a42623          	sw	a0,12(s0)
8000dcb4:	00442503          	lw	a0,4(s0)
8000dcb8:	00000613          	li	a2,0
8000dcbc:	00400593          	li	a1,4
8000dcc0:	e71ff0ef          	jal	ra,8000db30 <std>
8000dcc4:	00842503          	lw	a0,8(s0)
8000dcc8:	00100613          	li	a2,1
8000dccc:	00900593          	li	a1,9
8000dcd0:	e61ff0ef          	jal	ra,8000db30 <std>
8000dcd4:	00c42503          	lw	a0,12(s0)
8000dcd8:	00200613          	li	a2,2
8000dcdc:	01200593          	li	a1,18
8000dce0:	e51ff0ef          	jal	ra,8000db30 <std>
8000dce4:	00100793          	li	a5,1
8000dce8:	00f42c23          	sw	a5,24(s0)
8000dcec:	00c12083          	lw	ra,12(sp)
8000dcf0:	00812403          	lw	s0,8(sp)
8000dcf4:	01010113          	addi	sp,sp,16
8000dcf8:	00008067          	ret
8000dcfc:	00008067          	ret

Disassembly of section .text.__sfp:

8000dd00 <__sfp>:
8000dd00:	ff010113          	addi	sp,sp,-16
8000dd04:	c5018793          	addi	a5,gp,-944 # 800033e8 <_bss_end>
8000dd08:	00912223          	sw	s1,4(sp)
8000dd0c:	0007a483          	lw	s1,0(a5)
8000dd10:	01212023          	sw	s2,0(sp)
8000dd14:	00112623          	sw	ra,12(sp)
8000dd18:	0184a783          	lw	a5,24(s1)
8000dd1c:	00812423          	sw	s0,8(sp)
8000dd20:	00050913          	mv	s2,a0
8000dd24:	00079663          	bnez	a5,8000dd30 <__sfp+0x30>
8000dd28:	00048513          	mv	a0,s1
8000dd2c:	f25ff0ef          	jal	ra,8000dc50 <__sinit>
8000dd30:	04848493          	addi	s1,s1,72
8000dd34:	0084a403          	lw	s0,8(s1)
8000dd38:	0044a783          	lw	a5,4(s1)
8000dd3c:	fff78793          	addi	a5,a5,-1
8000dd40:	0007da63          	bgez	a5,8000dd54 <__sfp+0x54>
8000dd44:	0004a783          	lw	a5,0(s1)
8000dd48:	08078063          	beqz	a5,8000ddc8 <__sfp+0xc8>
8000dd4c:	0004a483          	lw	s1,0(s1)
8000dd50:	fe5ff06f          	j	8000dd34 <__sfp+0x34>
8000dd54:	00c41703          	lh	a4,12(s0)
8000dd58:	06071463          	bnez	a4,8000ddc0 <__sfp+0xc0>
8000dd5c:	ffff07b7          	lui	a5,0xffff0
8000dd60:	00178793          	addi	a5,a5,1 # ffff0001 <_ram_heap_end+0x7ffde001>
8000dd64:	06042223          	sw	zero,100(s0)
8000dd68:	00042023          	sw	zero,0(s0)
8000dd6c:	00042223          	sw	zero,4(s0)
8000dd70:	00042423          	sw	zero,8(s0)
8000dd74:	00f42623          	sw	a5,12(s0)
8000dd78:	00042823          	sw	zero,16(s0)
8000dd7c:	00042a23          	sw	zero,20(s0)
8000dd80:	00042c23          	sw	zero,24(s0)
8000dd84:	00800613          	li	a2,8
8000dd88:	00000593          	li	a1,0
8000dd8c:	05c40513          	addi	a0,s0,92
8000dd90:	da9fe0ef          	jal	ra,8000cb38 <memset>
8000dd94:	02042a23          	sw	zero,52(s0)
8000dd98:	02042c23          	sw	zero,56(s0)
8000dd9c:	04042423          	sw	zero,72(s0)
8000dda0:	04042623          	sw	zero,76(s0)
8000dda4:	00040513          	mv	a0,s0
8000dda8:	00c12083          	lw	ra,12(sp)
8000ddac:	00812403          	lw	s0,8(sp)
8000ddb0:	00412483          	lw	s1,4(sp)
8000ddb4:	00012903          	lw	s2,0(sp)
8000ddb8:	01010113          	addi	sp,sp,16
8000ddbc:	00008067          	ret
8000ddc0:	06840413          	addi	s0,s0,104
8000ddc4:	f79ff06f          	j	8000dd3c <__sfp+0x3c>
8000ddc8:	00400593          	li	a1,4
8000ddcc:	00090513          	mv	a0,s2
8000ddd0:	dfdff0ef          	jal	ra,8000dbcc <__sfmoreglue>
8000ddd4:	00a4a023          	sw	a0,0(s1)
8000ddd8:	00050413          	mv	s0,a0
8000dddc:	f60518e3          	bnez	a0,8000dd4c <__sfp+0x4c>
8000dde0:	00c00793          	li	a5,12
8000dde4:	00f92023          	sw	a5,0(s2)
8000dde8:	fbdff06f          	j	8000dda4 <__sfp+0xa4>

Disassembly of section .text.__sfp_lock_acquire:

8000ddec <__sfp_lock_acquire>:
8000ddec:	00008067          	ret

Disassembly of section .text.__sfp_lock_release:

8000ddf0 <__sfp_lock_release>:
8000ddf0:	00008067          	ret

Disassembly of section .text.__sinit_lock_acquire:

8000ddf4 <__sinit_lock_acquire>:
8000ddf4:	00008067          	ret

Disassembly of section .text.__sinit_lock_release:

8000ddf8 <__sinit_lock_release>:
8000ddf8:	00008067          	ret

Disassembly of section .text.__fp_lock_all:

8000ddfc <__fp_lock_all>:
8000ddfc:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000de00:	0007a503          	lw	a0,0(a5)
8000de04:	00000597          	auipc	a1,0x0
8000de08:	d2458593          	addi	a1,a1,-732 # 8000db28 <__fp_lock>
8000de0c:	1140006f          	j	8000df20 <_fwalk>

Disassembly of section .text.__fp_unlock_all:

8000de10 <__fp_unlock_all>:
8000de10:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000de14:	0007a503          	lw	a0,0(a5)
8000de18:	00000597          	auipc	a1,0x0
8000de1c:	dac58593          	addi	a1,a1,-596 # 8000dbc4 <__fp_unlock>
8000de20:	1000006f          	j	8000df20 <_fwalk>

Disassembly of section .text._fpurge_r:

8000de24 <_fpurge_r>:
8000de24:	ff010113          	addi	sp,sp,-16
8000de28:	00812423          	sw	s0,8(sp)
8000de2c:	00912223          	sw	s1,4(sp)
8000de30:	00112623          	sw	ra,12(sp)
8000de34:	00050493          	mv	s1,a0
8000de38:	00058413          	mv	s0,a1
8000de3c:	00050863          	beqz	a0,8000de4c <_fpurge_r+0x28>
8000de40:	01852783          	lw	a5,24(a0)
8000de44:	00079463          	bnez	a5,8000de4c <_fpurge_r+0x28>
8000de48:	e09ff0ef          	jal	ra,8000dc50 <__sinit>
8000de4c:	ffff5797          	auipc	a5,0xffff5
8000de50:	f4478793          	addi	a5,a5,-188 # 80002d90 <__sf_fake_stdin>
8000de54:	02f41863          	bne	s0,a5,8000de84 <_fpurge_r+0x60>
8000de58:	0044a403          	lw	s0,4(s1)
8000de5c:	00c41783          	lh	a5,12(s0)
8000de60:	04079663          	bnez	a5,8000deac <_fpurge_r+0x88>
8000de64:	00900793          	li	a5,9
8000de68:	00f4a023          	sw	a5,0(s1)
8000de6c:	fff00513          	li	a0,-1
8000de70:	00c12083          	lw	ra,12(sp)
8000de74:	00812403          	lw	s0,8(sp)
8000de78:	00412483          	lw	s1,4(sp)
8000de7c:	01010113          	addi	sp,sp,16
8000de80:	00008067          	ret
8000de84:	ffff5797          	auipc	a5,0xffff5
8000de88:	f2c78793          	addi	a5,a5,-212 # 80002db0 <__sf_fake_stdout>
8000de8c:	00f41663          	bne	s0,a5,8000de98 <_fpurge_r+0x74>
8000de90:	0084a403          	lw	s0,8(s1)
8000de94:	fc9ff06f          	j	8000de5c <_fpurge_r+0x38>
8000de98:	ffff5797          	auipc	a5,0xffff5
8000de9c:	ed878793          	addi	a5,a5,-296 # 80002d70 <__sf_fake_stderr>
8000dea0:	faf41ee3          	bne	s0,a5,8000de5c <_fpurge_r+0x38>
8000dea4:	00c4a403          	lw	s0,12(s1)
8000dea8:	fb5ff06f          	j	8000de5c <_fpurge_r+0x38>
8000deac:	01042703          	lw	a4,16(s0)
8000deb0:	00e42023          	sw	a4,0(s0)
8000deb4:	0087f713          	andi	a4,a5,8
8000deb8:	02071863          	bnez	a4,8000dee8 <_fpurge_r+0xc4>
8000debc:	03442583          	lw	a1,52(s0)
8000dec0:	00042223          	sw	zero,4(s0)
8000dec4:	00000513          	li	a0,0
8000dec8:	fa0584e3          	beqz	a1,8000de70 <_fpurge_r+0x4c>
8000decc:	04440793          	addi	a5,s0,68
8000ded0:	00f58663          	beq	a1,a5,8000dedc <_fpurge_r+0xb8>
8000ded4:	00048513          	mv	a0,s1
8000ded8:	374000ef          	jal	ra,8000e24c <_free_r>
8000dedc:	02042a23          	sw	zero,52(s0)
8000dee0:	00000513          	li	a0,0
8000dee4:	f8dff06f          	j	8000de70 <_fpurge_r+0x4c>
8000dee8:	0037f793          	andi	a5,a5,3
8000deec:	00000713          	li	a4,0
8000def0:	00079463          	bnez	a5,8000def8 <_fpurge_r+0xd4>
8000def4:	01442703          	lw	a4,20(s0)
8000def8:	00e42423          	sw	a4,8(s0)
8000defc:	fe5ff06f          	j	8000dee0 <_fpurge_r+0xbc>

Disassembly of section .text.fpurge:

8000df00 <fpurge>:
8000df00:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000df04:	00050593          	mv	a1,a0
8000df08:	0007a503          	lw	a0,0(a5)
8000df0c:	f19ff06f          	j	8000de24 <_fpurge_r>

Disassembly of section .text.__fpurge:

8000df10 <__fpurge>:
8000df10:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000df14:	00050593          	mv	a1,a0
8000df18:	0007a503          	lw	a0,0(a5)
8000df1c:	f09ff06f          	j	8000de24 <_fpurge_r>

Disassembly of section .text._fwalk:

8000df20 <_fwalk>:
8000df20:	fd010113          	addi	sp,sp,-48
8000df24:	02812423          	sw	s0,40(sp)
8000df28:	03212023          	sw	s2,32(sp)
8000df2c:	01412c23          	sw	s4,24(sp)
8000df30:	01512a23          	sw	s5,20(sp)
8000df34:	02112623          	sw	ra,44(sp)
8000df38:	02912223          	sw	s1,36(sp)
8000df3c:	01312e23          	sw	s3,28(sp)
8000df40:	04850413          	addi	s0,a0,72
8000df44:	00000913          	li	s2,0
8000df48:	00100a13          	li	s4,1
8000df4c:	fff00a93          	li	s5,-1
8000df50:	02041663          	bnez	s0,8000df7c <_fwalk+0x5c>
8000df54:	02c12083          	lw	ra,44(sp)
8000df58:	02812403          	lw	s0,40(sp)
8000df5c:	00090513          	mv	a0,s2
8000df60:	02412483          	lw	s1,36(sp)
8000df64:	02012903          	lw	s2,32(sp)
8000df68:	01c12983          	lw	s3,28(sp)
8000df6c:	01812a03          	lw	s4,24(sp)
8000df70:	01412a83          	lw	s5,20(sp)
8000df74:	03010113          	addi	sp,sp,48
8000df78:	00008067          	ret
8000df7c:	00842483          	lw	s1,8(s0)
8000df80:	00442983          	lw	s3,4(s0)
8000df84:	fff98993          	addi	s3,s3,-1
8000df88:	0009d663          	bgez	s3,8000df94 <_fwalk+0x74>
8000df8c:	00042403          	lw	s0,0(s0)
8000df90:	fc1ff06f          	j	8000df50 <_fwalk+0x30>
8000df94:	00c4d783          	lhu	a5,12(s1)
8000df98:	02fa7063          	bgeu	s4,a5,8000dfb8 <_fwalk+0x98>
8000df9c:	00e49783          	lh	a5,14(s1)
8000dfa0:	01578c63          	beq	a5,s5,8000dfb8 <_fwalk+0x98>
8000dfa4:	00048513          	mv	a0,s1
8000dfa8:	00b12623          	sw	a1,12(sp)
8000dfac:	000580e7          	jalr	a1
8000dfb0:	00c12583          	lw	a1,12(sp)
8000dfb4:	00a96933          	or	s2,s2,a0
8000dfb8:	06848493          	addi	s1,s1,104
8000dfbc:	fc9ff06f          	j	8000df84 <_fwalk+0x64>

Disassembly of section .text._fwalk_reent:

8000dfc0 <_fwalk_reent>:
8000dfc0:	fd010113          	addi	sp,sp,-48
8000dfc4:	02812423          	sw	s0,40(sp)
8000dfc8:	03212023          	sw	s2,32(sp)
8000dfcc:	01412c23          	sw	s4,24(sp)
8000dfd0:	01512a23          	sw	s5,20(sp)
8000dfd4:	01612823          	sw	s6,16(sp)
8000dfd8:	01712623          	sw	s7,12(sp)
8000dfdc:	02112623          	sw	ra,44(sp)
8000dfe0:	02912223          	sw	s1,36(sp)
8000dfe4:	01312e23          	sw	s3,28(sp)
8000dfe8:	00050a13          	mv	s4,a0
8000dfec:	00058a93          	mv	s5,a1
8000dff0:	04850413          	addi	s0,a0,72
8000dff4:	00000913          	li	s2,0
8000dff8:	00100b13          	li	s6,1
8000dffc:	fff00b93          	li	s7,-1
8000e000:	02041a63          	bnez	s0,8000e034 <_fwalk_reent+0x74>
8000e004:	02c12083          	lw	ra,44(sp)
8000e008:	02812403          	lw	s0,40(sp)
8000e00c:	00090513          	mv	a0,s2
8000e010:	02412483          	lw	s1,36(sp)
8000e014:	02012903          	lw	s2,32(sp)
8000e018:	01c12983          	lw	s3,28(sp)
8000e01c:	01812a03          	lw	s4,24(sp)
8000e020:	01412a83          	lw	s5,20(sp)
8000e024:	01012b03          	lw	s6,16(sp)
8000e028:	00c12b83          	lw	s7,12(sp)
8000e02c:	03010113          	addi	sp,sp,48
8000e030:	00008067          	ret
8000e034:	00842483          	lw	s1,8(s0)
8000e038:	00442983          	lw	s3,4(s0)
8000e03c:	fff98993          	addi	s3,s3,-1
8000e040:	0009d663          	bgez	s3,8000e04c <_fwalk_reent+0x8c>
8000e044:	00042403          	lw	s0,0(s0)
8000e048:	fb9ff06f          	j	8000e000 <_fwalk_reent+0x40>
8000e04c:	00c4d783          	lhu	a5,12(s1)
8000e050:	00fb7e63          	bgeu	s6,a5,8000e06c <_fwalk_reent+0xac>
8000e054:	00e49783          	lh	a5,14(s1)
8000e058:	01778a63          	beq	a5,s7,8000e06c <_fwalk_reent+0xac>
8000e05c:	00048593          	mv	a1,s1
8000e060:	000a0513          	mv	a0,s4
8000e064:	000a80e7          	jalr	s5
8000e068:	00a96933          	or	s2,s2,a0
8000e06c:	06848493          	addi	s1,s1,104
8000e070:	fcdff06f          	j	8000e03c <_fwalk_reent+0x7c>

Disassembly of section .text.malloc:

8000e074 <malloc>:
8000e074:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000e078:	00050593          	mv	a1,a0
8000e07c:	0007a503          	lw	a0,0(a5)
8000e080:	2d00006f          	j	8000e350 <_malloc_r>

Disassembly of section .text.free:

8000e084 <free>:
8000e084:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000e088:	00050593          	mv	a1,a0
8000e08c:	0007a503          	lw	a0,0(a5)
8000e090:	1bc0006f          	j	8000e24c <_free_r>

Disassembly of section .text.memcmp:

8000e094 <memcmp>:
8000e094:	00000713          	li	a4,0
8000e098:	00e61663          	bne	a2,a4,8000e0a4 <memcmp+0x10>
8000e09c:	00000513          	li	a0,0
8000e0a0:	00008067          	ret
8000e0a4:	00e507b3          	add	a5,a0,a4
8000e0a8:	00170713          	addi	a4,a4,1
8000e0ac:	00e586b3          	add	a3,a1,a4
8000e0b0:	0007c783          	lbu	a5,0(a5)
8000e0b4:	fff6c683          	lbu	a3,-1(a3)
8000e0b8:	fed780e3          	beq	a5,a3,8000e098 <memcmp+0x4>
8000e0bc:	40d78533          	sub	a0,a5,a3
8000e0c0:	00008067          	ret

Disassembly of section .text.memcpy:

8000e0c4 <memcpy>:
8000e0c4:	00a5c7b3          	xor	a5,a1,a0
8000e0c8:	0037f793          	andi	a5,a5,3
8000e0cc:	00c50733          	add	a4,a0,a2
8000e0d0:	00079663          	bnez	a5,8000e0dc <memcpy+0x18>
8000e0d4:	00300793          	li	a5,3
8000e0d8:	02c7e263          	bltu	a5,a2,8000e0fc <memcpy+0x38>
8000e0dc:	00050793          	mv	a5,a0
8000e0e0:	0ae57c63          	bgeu	a0,a4,8000e198 <memcpy+0xd4>
8000e0e4:	0005c683          	lbu	a3,0(a1)
8000e0e8:	00178793          	addi	a5,a5,1
8000e0ec:	00158593          	addi	a1,a1,1
8000e0f0:	fed78fa3          	sb	a3,-1(a5)
8000e0f4:	fee7e8e3          	bltu	a5,a4,8000e0e4 <memcpy+0x20>
8000e0f8:	00008067          	ret
8000e0fc:	00357693          	andi	a3,a0,3
8000e100:	00050793          	mv	a5,a0
8000e104:	00068e63          	beqz	a3,8000e120 <memcpy+0x5c>
8000e108:	0005c683          	lbu	a3,0(a1)
8000e10c:	00178793          	addi	a5,a5,1
8000e110:	00158593          	addi	a1,a1,1
8000e114:	fed78fa3          	sb	a3,-1(a5)
8000e118:	0037f693          	andi	a3,a5,3
8000e11c:	fe9ff06f          	j	8000e104 <memcpy+0x40>
8000e120:	ffc77693          	andi	a3,a4,-4
8000e124:	fe068613          	addi	a2,a3,-32
8000e128:	06c7f463          	bgeu	a5,a2,8000e190 <memcpy+0xcc>
8000e12c:	0005a383          	lw	t2,0(a1)
8000e130:	0045a283          	lw	t0,4(a1)
8000e134:	0085af83          	lw	t6,8(a1)
8000e138:	00c5af03          	lw	t5,12(a1)
8000e13c:	0105ae83          	lw	t4,16(a1)
8000e140:	0145ae03          	lw	t3,20(a1)
8000e144:	0185a303          	lw	t1,24(a1)
8000e148:	01c5a883          	lw	a7,28(a1)
8000e14c:	02458593          	addi	a1,a1,36
8000e150:	0077a023          	sw	t2,0(a5)
8000e154:	ffc5a803          	lw	a6,-4(a1)
8000e158:	0057a223          	sw	t0,4(a5)
8000e15c:	01f7a423          	sw	t6,8(a5)
8000e160:	01e7a623          	sw	t5,12(a5)
8000e164:	01d7a823          	sw	t4,16(a5)
8000e168:	01c7aa23          	sw	t3,20(a5)
8000e16c:	0067ac23          	sw	t1,24(a5)
8000e170:	0117ae23          	sw	a7,28(a5)
8000e174:	02478793          	addi	a5,a5,36
8000e178:	ff07ae23          	sw	a6,-4(a5)
8000e17c:	fadff06f          	j	8000e128 <memcpy+0x64>
8000e180:	0005a603          	lw	a2,0(a1)
8000e184:	00478793          	addi	a5,a5,4
8000e188:	00458593          	addi	a1,a1,4
8000e18c:	fec7ae23          	sw	a2,-4(a5)
8000e190:	fed7e8e3          	bltu	a5,a3,8000e180 <memcpy+0xbc>
8000e194:	f4e7e8e3          	bltu	a5,a4,8000e0e4 <memcpy+0x20>
8000e198:	00008067          	ret

Disassembly of section .text.memmove:

8000e19c <memmove>:
8000e19c:	04a5fa63          	bgeu	a1,a0,8000e1f0 <memmove+0x54>
8000e1a0:	00c586b3          	add	a3,a1,a2
8000e1a4:	04d57663          	bgeu	a0,a3,8000e1f0 <memmove+0x54>
8000e1a8:	fff64593          	not	a1,a2
8000e1ac:	00000793          	li	a5,0
8000e1b0:	fff78793          	addi	a5,a5,-1
8000e1b4:	00f59463          	bne	a1,a5,8000e1bc <memmove+0x20>
8000e1b8:	00008067          	ret
8000e1bc:	00f68733          	add	a4,a3,a5
8000e1c0:	00074803          	lbu	a6,0(a4)
8000e1c4:	00c78733          	add	a4,a5,a2
8000e1c8:	00e50733          	add	a4,a0,a4
8000e1cc:	01070023          	sb	a6,0(a4)
8000e1d0:	fe1ff06f          	j	8000e1b0 <memmove+0x14>
8000e1d4:	00f58733          	add	a4,a1,a5
8000e1d8:	00074683          	lbu	a3,0(a4)
8000e1dc:	00f50733          	add	a4,a0,a5
8000e1e0:	00178793          	addi	a5,a5,1
8000e1e4:	00d70023          	sb	a3,0(a4)
8000e1e8:	fef616e3          	bne	a2,a5,8000e1d4 <memmove+0x38>
8000e1ec:	00008067          	ret
8000e1f0:	00000793          	li	a5,0
8000e1f4:	ff5ff06f          	j	8000e1e8 <memmove+0x4c>

Disassembly of section .text._calloc_r:

8000e1f8 <_calloc_r>:
8000e1f8:	fe010113          	addi	sp,sp,-32
8000e1fc:	00812c23          	sw	s0,24(sp)
8000e200:	00050413          	mv	s0,a0
8000e204:	00058513          	mv	a0,a1
8000e208:	00060593          	mv	a1,a2
8000e20c:	00112e23          	sw	ra,28(sp)
8000e210:	80cff0ef          	jal	ra,8000d21c <__mulsi3>
8000e214:	00050593          	mv	a1,a0
8000e218:	00a12623          	sw	a0,12(sp)
8000e21c:	00040513          	mv	a0,s0
8000e220:	130000ef          	jal	ra,8000e350 <_malloc_r>
8000e224:	00050413          	mv	s0,a0
8000e228:	00050863          	beqz	a0,8000e238 <_calloc_r+0x40>
8000e22c:	00c12603          	lw	a2,12(sp)
8000e230:	00000593          	li	a1,0
8000e234:	905fe0ef          	jal	ra,8000cb38 <memset>
8000e238:	00040513          	mv	a0,s0
8000e23c:	01c12083          	lw	ra,28(sp)
8000e240:	01812403          	lw	s0,24(sp)
8000e244:	02010113          	addi	sp,sp,32
8000e248:	00008067          	ret

Disassembly of section .text._free_r:

8000e24c <_free_r>:
8000e24c:	10058063          	beqz	a1,8000e34c <_free_r+0x100>
8000e250:	ffc5a783          	lw	a5,-4(a1)
8000e254:	ff010113          	addi	sp,sp,-16
8000e258:	00812423          	sw	s0,8(sp)
8000e25c:	00112623          	sw	ra,12(sp)
8000e260:	00912223          	sw	s1,4(sp)
8000e264:	ffc58413          	addi	s0,a1,-4
8000e268:	0007d463          	bgez	a5,8000e270 <_free_r+0x24>
8000e26c:	00f40433          	add	s0,s0,a5
8000e270:	00050493          	mv	s1,a0
8000e274:	fecf70ef          	jal	ra,80005a60 <__malloc_lock>
8000e278:	8fc18793          	addi	a5,gp,-1796 # 80003094 <__malloc_free_list>
8000e27c:	0007a783          	lw	a5,0(a5)
8000e280:	02079263          	bnez	a5,8000e2a4 <_free_r+0x58>
8000e284:	00042223          	sw	zero,4(s0)
8000e288:	8e81ae23          	sw	s0,-1796(gp) # 80003094 <__malloc_free_list>
8000e28c:	00812403          	lw	s0,8(sp)
8000e290:	00c12083          	lw	ra,12(sp)
8000e294:	00048513          	mv	a0,s1
8000e298:	00412483          	lw	s1,4(sp)
8000e29c:	01010113          	addi	sp,sp,16
8000e2a0:	fc4f706f          	j	80005a64 <__malloc_unlock>
8000e2a4:	02f47663          	bgeu	s0,a5,8000e2d0 <_free_r+0x84>
8000e2a8:	00042683          	lw	a3,0(s0)
8000e2ac:	00d40733          	add	a4,s0,a3
8000e2b0:	00e79a63          	bne	a5,a4,8000e2c4 <_free_r+0x78>
8000e2b4:	0007a703          	lw	a4,0(a5)
8000e2b8:	0047a783          	lw	a5,4(a5)
8000e2bc:	00d70733          	add	a4,a4,a3
8000e2c0:	00e42023          	sw	a4,0(s0)
8000e2c4:	00f42223          	sw	a5,4(s0)
8000e2c8:	fc1ff06f          	j	8000e288 <_free_r+0x3c>
8000e2cc:	00070793          	mv	a5,a4
8000e2d0:	0047a703          	lw	a4,4(a5)
8000e2d4:	00070463          	beqz	a4,8000e2dc <_free_r+0x90>
8000e2d8:	fee47ae3          	bgeu	s0,a4,8000e2cc <_free_r+0x80>
8000e2dc:	0007a683          	lw	a3,0(a5)
8000e2e0:	00d78633          	add	a2,a5,a3
8000e2e4:	02861863          	bne	a2,s0,8000e314 <_free_r+0xc8>
8000e2e8:	00042603          	lw	a2,0(s0)
8000e2ec:	00c686b3          	add	a3,a3,a2
8000e2f0:	00d7a023          	sw	a3,0(a5)
8000e2f4:	00d78633          	add	a2,a5,a3
8000e2f8:	f8c71ae3          	bne	a4,a2,8000e28c <_free_r+0x40>
8000e2fc:	00072603          	lw	a2,0(a4)
8000e300:	00472703          	lw	a4,4(a4)
8000e304:	00d606b3          	add	a3,a2,a3
8000e308:	00d7a023          	sw	a3,0(a5)
8000e30c:	00e7a223          	sw	a4,4(a5)
8000e310:	f7dff06f          	j	8000e28c <_free_r+0x40>
8000e314:	00c47863          	bgeu	s0,a2,8000e324 <_free_r+0xd8>
8000e318:	00c00793          	li	a5,12
8000e31c:	00f4a023          	sw	a5,0(s1)
8000e320:	f6dff06f          	j	8000e28c <_free_r+0x40>
8000e324:	00042603          	lw	a2,0(s0)
8000e328:	00c406b3          	add	a3,s0,a2
8000e32c:	00d71a63          	bne	a4,a3,8000e340 <_free_r+0xf4>
8000e330:	00072683          	lw	a3,0(a4)
8000e334:	00472703          	lw	a4,4(a4)
8000e338:	00c686b3          	add	a3,a3,a2
8000e33c:	00d42023          	sw	a3,0(s0)
8000e340:	00e42223          	sw	a4,4(s0)
8000e344:	0087a223          	sw	s0,4(a5)
8000e348:	f45ff06f          	j	8000e28c <_free_r+0x40>
8000e34c:	00008067          	ret

Disassembly of section .text._malloc_r:

8000e350 <_malloc_r>:
8000e350:	fe010113          	addi	sp,sp,-32
8000e354:	00912a23          	sw	s1,20(sp)
8000e358:	00358493          	addi	s1,a1,3
8000e35c:	ffc4f493          	andi	s1,s1,-4
8000e360:	00112e23          	sw	ra,28(sp)
8000e364:	00812c23          	sw	s0,24(sp)
8000e368:	01212823          	sw	s2,16(sp)
8000e36c:	01312623          	sw	s3,12(sp)
8000e370:	00848493          	addi	s1,s1,8
8000e374:	00c00793          	li	a5,12
8000e378:	06f4f463          	bgeu	s1,a5,8000e3e0 <_malloc_r+0x90>
8000e37c:	00c00493          	li	s1,12
8000e380:	06b4e263          	bltu	s1,a1,8000e3e4 <_malloc_r+0x94>
8000e384:	00050913          	mv	s2,a0
8000e388:	ed8f70ef          	jal	ra,80005a60 <__malloc_lock>
8000e38c:	8fc18793          	addi	a5,gp,-1796 # 80003094 <__malloc_free_list>
8000e390:	0007a703          	lw	a4,0(a5)
8000e394:	00070413          	mv	s0,a4
8000e398:	06041a63          	bnez	s0,8000e40c <_malloc_r+0xbc>
8000e39c:	90018793          	addi	a5,gp,-1792 # 80003098 <__malloc_sbrk_start>
8000e3a0:	0007a783          	lw	a5,0(a5)
8000e3a4:	00079a63          	bnez	a5,8000e3b8 <_malloc_r+0x68>
8000e3a8:	00000593          	li	a1,0
8000e3ac:	00090513          	mv	a0,s2
8000e3b0:	330000ef          	jal	ra,8000e6e0 <_sbrk_r>
8000e3b4:	90a1a023          	sw	a0,-1792(gp) # 80003098 <__malloc_sbrk_start>
8000e3b8:	00048593          	mv	a1,s1
8000e3bc:	00090513          	mv	a0,s2
8000e3c0:	320000ef          	jal	ra,8000e6e0 <_sbrk_r>
8000e3c4:	fff00993          	li	s3,-1
8000e3c8:	0b351a63          	bne	a0,s3,8000e47c <_malloc_r+0x12c>
8000e3cc:	00c00793          	li	a5,12
8000e3d0:	00f92023          	sw	a5,0(s2)
8000e3d4:	00090513          	mv	a0,s2
8000e3d8:	e8cf70ef          	jal	ra,80005a64 <__malloc_unlock>
8000e3dc:	0100006f          	j	8000e3ec <_malloc_r+0x9c>
8000e3e0:	fa04d0e3          	bgez	s1,8000e380 <_malloc_r+0x30>
8000e3e4:	00c00793          	li	a5,12
8000e3e8:	00f52023          	sw	a5,0(a0)
8000e3ec:	00000513          	li	a0,0
8000e3f0:	01c12083          	lw	ra,28(sp)
8000e3f4:	01812403          	lw	s0,24(sp)
8000e3f8:	01412483          	lw	s1,20(sp)
8000e3fc:	01012903          	lw	s2,16(sp)
8000e400:	00c12983          	lw	s3,12(sp)
8000e404:	02010113          	addi	sp,sp,32
8000e408:	00008067          	ret
8000e40c:	00042783          	lw	a5,0(s0)
8000e410:	409787b3          	sub	a5,a5,s1
8000e414:	0407ce63          	bltz	a5,8000e470 <_malloc_r+0x120>
8000e418:	00b00693          	li	a3,11
8000e41c:	00f6fa63          	bgeu	a3,a5,8000e430 <_malloc_r+0xe0>
8000e420:	00f42023          	sw	a5,0(s0)
8000e424:	00f40433          	add	s0,s0,a5
8000e428:	00942023          	sw	s1,0(s0)
8000e42c:	0100006f          	j	8000e43c <_malloc_r+0xec>
8000e430:	00442783          	lw	a5,4(s0)
8000e434:	02871a63          	bne	a4,s0,8000e468 <_malloc_r+0x118>
8000e438:	8ef1ae23          	sw	a5,-1796(gp) # 80003094 <__malloc_free_list>
8000e43c:	00090513          	mv	a0,s2
8000e440:	e24f70ef          	jal	ra,80005a64 <__malloc_unlock>
8000e444:	00b40513          	addi	a0,s0,11
8000e448:	00440793          	addi	a5,s0,4
8000e44c:	ff857513          	andi	a0,a0,-8
8000e450:	40f50733          	sub	a4,a0,a5
8000e454:	f8070ee3          	beqz	a4,8000e3f0 <_malloc_r+0xa0>
8000e458:	00e40433          	add	s0,s0,a4
8000e45c:	40a787b3          	sub	a5,a5,a0
8000e460:	00f42023          	sw	a5,0(s0)
8000e464:	f8dff06f          	j	8000e3f0 <_malloc_r+0xa0>
8000e468:	00f72223          	sw	a5,4(a4)
8000e46c:	fd1ff06f          	j	8000e43c <_malloc_r+0xec>
8000e470:	00040713          	mv	a4,s0
8000e474:	00442403          	lw	s0,4(s0)
8000e478:	f21ff06f          	j	8000e398 <_malloc_r+0x48>
8000e47c:	00350413          	addi	s0,a0,3
8000e480:	ffc47413          	andi	s0,s0,-4
8000e484:	fa8502e3          	beq	a0,s0,8000e428 <_malloc_r+0xd8>
8000e488:	40a405b3          	sub	a1,s0,a0
8000e48c:	00090513          	mv	a0,s2
8000e490:	250000ef          	jal	ra,8000e6e0 <_sbrk_r>
8000e494:	f9351ae3          	bne	a0,s3,8000e428 <_malloc_r+0xd8>
8000e498:	f35ff06f          	j	8000e3cc <_malloc_r+0x7c>

Disassembly of section .text._printf_r:

8000e49c <_iprintf_r>:
8000e49c:	fb010113          	addi	sp,sp,-80
8000e4a0:	02812423          	sw	s0,40(sp)
8000e4a4:	02112623          	sw	ra,44(sp)
8000e4a8:	02c12c23          	sw	a2,56(sp)
8000e4ac:	02d12e23          	sw	a3,60(sp)
8000e4b0:	04e12023          	sw	a4,64(sp)
8000e4b4:	04f12223          	sw	a5,68(sp)
8000e4b8:	05012423          	sw	a6,72(sp)
8000e4bc:	05112623          	sw	a7,76(sp)
8000e4c0:	00050413          	mv	s0,a0
8000e4c4:	00050c63          	beqz	a0,8000e4dc <_iprintf_r+0x40>
8000e4c8:	01852783          	lw	a5,24(a0)
8000e4cc:	00079863          	bnez	a5,8000e4dc <_iprintf_r+0x40>
8000e4d0:	00b12623          	sw	a1,12(sp)
8000e4d4:	f7cff0ef          	jal	ra,8000dc50 <__sinit>
8000e4d8:	00c12583          	lw	a1,12(sp)
8000e4dc:	00058613          	mv	a2,a1
8000e4e0:	00842583          	lw	a1,8(s0)
8000e4e4:	03810693          	addi	a3,sp,56
8000e4e8:	00040513          	mv	a0,s0
8000e4ec:	00d12e23          	sw	a3,28(sp)
8000e4f0:	2b5010ef          	jal	ra,8000ffa4 <_vfiprintf_r>
8000e4f4:	02c12083          	lw	ra,44(sp)
8000e4f8:	02812403          	lw	s0,40(sp)
8000e4fc:	05010113          	addi	sp,sp,80
8000e500:	00008067          	ret

Disassembly of section .text.printf:

8000e504 <iprintf>:
8000e504:	fc010113          	addi	sp,sp,-64
8000e508:	02f12a23          	sw	a5,52(sp)
8000e50c:	02b12223          	sw	a1,36(sp)
8000e510:	02c12423          	sw	a2,40(sp)
8000e514:	02d12623          	sw	a3,44(sp)
8000e518:	02e12823          	sw	a4,48(sp)
8000e51c:	03012c23          	sw	a6,56(sp)
8000e520:	03112e23          	sw	a7,60(sp)
8000e524:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000e528:	00812c23          	sw	s0,24(sp)
8000e52c:	0007a403          	lw	s0,0(a5)
8000e530:	00912a23          	sw	s1,20(sp)
8000e534:	00112e23          	sw	ra,28(sp)
8000e538:	00050493          	mv	s1,a0
8000e53c:	00040a63          	beqz	s0,8000e550 <iprintf+0x4c>
8000e540:	01842783          	lw	a5,24(s0)
8000e544:	00079663          	bnez	a5,8000e550 <iprintf+0x4c>
8000e548:	00040513          	mv	a0,s0
8000e54c:	f04ff0ef          	jal	ra,8000dc50 <__sinit>
8000e550:	00842583          	lw	a1,8(s0)
8000e554:	02410693          	addi	a3,sp,36
8000e558:	00048613          	mv	a2,s1
8000e55c:	00040513          	mv	a0,s0
8000e560:	00d12623          	sw	a3,12(sp)
8000e564:	241010ef          	jal	ra,8000ffa4 <_vfiprintf_r>
8000e568:	01c12083          	lw	ra,28(sp)
8000e56c:	01812403          	lw	s0,24(sp)
8000e570:	01412483          	lw	s1,20(sp)
8000e574:	04010113          	addi	sp,sp,64
8000e578:	00008067          	ret

Disassembly of section .text._putchar_r:

8000e57c <_putchar_r>:
8000e57c:	fe010113          	addi	sp,sp,-32
8000e580:	00812c23          	sw	s0,24(sp)
8000e584:	00112e23          	sw	ra,28(sp)
8000e588:	00050413          	mv	s0,a0
8000e58c:	00050c63          	beqz	a0,8000e5a4 <_putchar_r+0x28>
8000e590:	01852783          	lw	a5,24(a0)
8000e594:	00079863          	bnez	a5,8000e5a4 <_putchar_r+0x28>
8000e598:	00b12623          	sw	a1,12(sp)
8000e59c:	eb4ff0ef          	jal	ra,8000dc50 <__sinit>
8000e5a0:	00c12583          	lw	a1,12(sp)
8000e5a4:	00842603          	lw	a2,8(s0)
8000e5a8:	00040513          	mv	a0,s0
8000e5ac:	01812403          	lw	s0,24(sp)
8000e5b0:	01c12083          	lw	ra,28(sp)
8000e5b4:	02010113          	addi	sp,sp,32
8000e5b8:	0500006f          	j	8000e608 <_putc_r>

Disassembly of section .text.putchar:

8000e5bc <putchar>:
8000e5bc:	fe010113          	addi	sp,sp,-32
8000e5c0:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000e5c4:	00812c23          	sw	s0,24(sp)
8000e5c8:	0007a403          	lw	s0,0(a5)
8000e5cc:	00112e23          	sw	ra,28(sp)
8000e5d0:	00050593          	mv	a1,a0
8000e5d4:	00040e63          	beqz	s0,8000e5f0 <putchar+0x34>
8000e5d8:	01842783          	lw	a5,24(s0)
8000e5dc:	00079a63          	bnez	a5,8000e5f0 <putchar+0x34>
8000e5e0:	00a12623          	sw	a0,12(sp)
8000e5e4:	00040513          	mv	a0,s0
8000e5e8:	e68ff0ef          	jal	ra,8000dc50 <__sinit>
8000e5ec:	00c12583          	lw	a1,12(sp)
8000e5f0:	00842603          	lw	a2,8(s0)
8000e5f4:	00040513          	mv	a0,s0
8000e5f8:	01812403          	lw	s0,24(sp)
8000e5fc:	01c12083          	lw	ra,28(sp)
8000e600:	02010113          	addi	sp,sp,32
8000e604:	0040006f          	j	8000e608 <_putc_r>

Disassembly of section .text._putc_r:

8000e608 <_putc_r>:
8000e608:	fe010113          	addi	sp,sp,-32
8000e60c:	00812c23          	sw	s0,24(sp)
8000e610:	00112e23          	sw	ra,28(sp)
8000e614:	00050413          	mv	s0,a0
8000e618:	02050063          	beqz	a0,8000e638 <_putc_r+0x30>
8000e61c:	01852783          	lw	a5,24(a0)
8000e620:	00079c63          	bnez	a5,8000e638 <_putc_r+0x30>
8000e624:	00c12623          	sw	a2,12(sp)
8000e628:	00b12423          	sw	a1,8(sp)
8000e62c:	e24ff0ef          	jal	ra,8000dc50 <__sinit>
8000e630:	00c12603          	lw	a2,12(sp)
8000e634:	00812583          	lw	a1,8(sp)
8000e638:	ffff4797          	auipc	a5,0xffff4
8000e63c:	75878793          	addi	a5,a5,1880 # 80002d90 <__sf_fake_stdin>
8000e640:	04f61063          	bne	a2,a5,8000e680 <_putc_r+0x78>
8000e644:	00442603          	lw	a2,4(s0)
8000e648:	00862783          	lw	a5,8(a2)
8000e64c:	fff78793          	addi	a5,a5,-1
8000e650:	00f62423          	sw	a5,8(a2)
8000e654:	0407da63          	bgez	a5,8000e6a8 <_putc_r+0xa0>
8000e658:	01862703          	lw	a4,24(a2)
8000e65c:	00e7c863          	blt	a5,a4,8000e66c <_putc_r+0x64>
8000e660:	0ff5f793          	andi	a5,a1,255
8000e664:	00a00713          	li	a4,10
8000e668:	04e79063          	bne	a5,a4,8000e6a8 <_putc_r+0xa0>
8000e66c:	00040513          	mv	a0,s0
8000e670:	01812403          	lw	s0,24(sp)
8000e674:	01c12083          	lw	ra,28(sp)
8000e678:	02010113          	addi	sp,sp,32
8000e67c:	6bc0006f          	j	8000ed38 <__swbuf_r>
8000e680:	ffff4797          	auipc	a5,0xffff4
8000e684:	73078793          	addi	a5,a5,1840 # 80002db0 <__sf_fake_stdout>
8000e688:	00f61663          	bne	a2,a5,8000e694 <_putc_r+0x8c>
8000e68c:	00842603          	lw	a2,8(s0)
8000e690:	fb9ff06f          	j	8000e648 <_putc_r+0x40>
8000e694:	ffff4797          	auipc	a5,0xffff4
8000e698:	6dc78793          	addi	a5,a5,1756 # 80002d70 <__sf_fake_stderr>
8000e69c:	faf616e3          	bne	a2,a5,8000e648 <_putc_r+0x40>
8000e6a0:	00c42603          	lw	a2,12(s0)
8000e6a4:	fa5ff06f          	j	8000e648 <_putc_r+0x40>
8000e6a8:	00062783          	lw	a5,0(a2)
8000e6ac:	0ff5f513          	andi	a0,a1,255
8000e6b0:	00178713          	addi	a4,a5,1
8000e6b4:	00e62023          	sw	a4,0(a2)
8000e6b8:	00b78023          	sb	a1,0(a5)
8000e6bc:	01c12083          	lw	ra,28(sp)
8000e6c0:	01812403          	lw	s0,24(sp)
8000e6c4:	02010113          	addi	sp,sp,32
8000e6c8:	00008067          	ret

Disassembly of section .text.putc:

8000e6cc <putc>:
8000e6cc:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000e6d0:	00058613          	mv	a2,a1
8000e6d4:	00050593          	mv	a1,a0
8000e6d8:	0007a503          	lw	a0,0(a5)
8000e6dc:	f2dff06f          	j	8000e608 <_putc_r>

Disassembly of section .text._sbrk_r:

8000e6e0 <_sbrk_r>:
8000e6e0:	ff010113          	addi	sp,sp,-16
8000e6e4:	00812423          	sw	s0,8(sp)
8000e6e8:	00050413          	mv	s0,a0
8000e6ec:	00058513          	mv	a0,a1
8000e6f0:	c401a623          	sw	zero,-948(gp) # 800033e4 <errno>
8000e6f4:	00112623          	sw	ra,12(sp)
8000e6f8:	c20f70ef          	jal	ra,80005b18 <_sbrk>
8000e6fc:	fff00793          	li	a5,-1
8000e700:	00f51a63          	bne	a0,a5,8000e714 <_sbrk_r+0x34>
8000e704:	c4c18793          	addi	a5,gp,-948 # 800033e4 <errno>
8000e708:	0007a783          	lw	a5,0(a5)
8000e70c:	00078463          	beqz	a5,8000e714 <_sbrk_r+0x34>
8000e710:	00f42023          	sw	a5,0(s0)
8000e714:	00c12083          	lw	ra,12(sp)
8000e718:	00812403          	lw	s0,8(sp)
8000e71c:	01010113          	addi	sp,sp,16
8000e720:	00008067          	ret

Disassembly of section .text._snprintf_r:

8000e724 <_sniprintf_r>:
8000e724:	f7010113          	addi	sp,sp,-144
8000e728:	06112e23          	sw	ra,124(sp)
8000e72c:	06812c23          	sw	s0,120(sp)
8000e730:	06912a23          	sw	s1,116(sp)
8000e734:	07212823          	sw	s2,112(sp)
8000e738:	08e12023          	sw	a4,128(sp)
8000e73c:	08f12223          	sw	a5,132(sp)
8000e740:	09012423          	sw	a6,136(sp)
8000e744:	09112623          	sw	a7,140(sp)
8000e748:	02065463          	bgez	a2,8000e770 <_sniprintf_r+0x4c>
8000e74c:	08b00793          	li	a5,139
8000e750:	00f52023          	sw	a5,0(a0)
8000e754:	fff00513          	li	a0,-1
8000e758:	07c12083          	lw	ra,124(sp)
8000e75c:	07812403          	lw	s0,120(sp)
8000e760:	07412483          	lw	s1,116(sp)
8000e764:	07012903          	lw	s2,112(sp)
8000e768:	09010113          	addi	sp,sp,144
8000e76c:	00008067          	ret
8000e770:	20800793          	li	a5,520
8000e774:	00f11a23          	sh	a5,20(sp)
8000e778:	00b12423          	sw	a1,8(sp)
8000e77c:	00b12c23          	sw	a1,24(sp)
8000e780:	00060413          	mv	s0,a2
8000e784:	00000793          	li	a5,0
8000e788:	00060463          	beqz	a2,8000e790 <_sniprintf_r+0x6c>
8000e78c:	fff60793          	addi	a5,a2,-1
8000e790:	fff00913          	li	s2,-1
8000e794:	00068613          	mv	a2,a3
8000e798:	00810593          	addi	a1,sp,8
8000e79c:	08010693          	addi	a3,sp,128
8000e7a0:	00050493          	mv	s1,a0
8000e7a4:	00f12823          	sw	a5,16(sp)
8000e7a8:	00f12e23          	sw	a5,28(sp)
8000e7ac:	01211b23          	sh	s2,22(sp)
8000e7b0:	00d12223          	sw	a3,4(sp)
8000e7b4:	5cd000ef          	jal	ra,8000f580 <_svfiprintf_r>
8000e7b8:	01255663          	bge	a0,s2,8000e7c4 <_sniprintf_r+0xa0>
8000e7bc:	08b00793          	li	a5,139
8000e7c0:	00f4a023          	sw	a5,0(s1)
8000e7c4:	f8040ae3          	beqz	s0,8000e758 <_sniprintf_r+0x34>
8000e7c8:	00812783          	lw	a5,8(sp)
8000e7cc:	00078023          	sb	zero,0(a5)
8000e7d0:	f89ff06f          	j	8000e758 <_sniprintf_r+0x34>

Disassembly of section .text.snprintf:

8000e7d4 <sniprintf>:
8000e7d4:	f6010113          	addi	sp,sp,-160
8000e7d8:	08f12a23          	sw	a5,148(sp)
8000e7dc:	06912a23          	sw	s1,116(sp)
8000e7e0:	08d12623          	sw	a3,140(sp)
8000e7e4:	08e12823          	sw	a4,144(sp)
8000e7e8:	09012c23          	sw	a6,152(sp)
8000e7ec:	09112e23          	sw	a7,156(sp)
8000e7f0:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000e7f4:	06112e23          	sw	ra,124(sp)
8000e7f8:	06812c23          	sw	s0,120(sp)
8000e7fc:	07212823          	sw	s2,112(sp)
8000e800:	0007a483          	lw	s1,0(a5)
8000e804:	0205d463          	bgez	a1,8000e82c <sniprintf+0x58>
8000e808:	08b00793          	li	a5,139
8000e80c:	00f4a023          	sw	a5,0(s1)
8000e810:	fff00513          	li	a0,-1
8000e814:	07c12083          	lw	ra,124(sp)
8000e818:	07812403          	lw	s0,120(sp)
8000e81c:	07412483          	lw	s1,116(sp)
8000e820:	07012903          	lw	s2,112(sp)
8000e824:	0a010113          	addi	sp,sp,160
8000e828:	00008067          	ret
8000e82c:	20800793          	li	a5,520
8000e830:	00f11a23          	sh	a5,20(sp)
8000e834:	00a12423          	sw	a0,8(sp)
8000e838:	00a12c23          	sw	a0,24(sp)
8000e83c:	00000793          	li	a5,0
8000e840:	00058463          	beqz	a1,8000e848 <sniprintf+0x74>
8000e844:	fff58793          	addi	a5,a1,-1
8000e848:	fff00913          	li	s2,-1
8000e84c:	00058413          	mv	s0,a1
8000e850:	08c10693          	addi	a3,sp,140
8000e854:	00810593          	addi	a1,sp,8
8000e858:	00048513          	mv	a0,s1
8000e85c:	00f12823          	sw	a5,16(sp)
8000e860:	00f12e23          	sw	a5,28(sp)
8000e864:	01211b23          	sh	s2,22(sp)
8000e868:	00d12223          	sw	a3,4(sp)
8000e86c:	515000ef          	jal	ra,8000f580 <_svfiprintf_r>
8000e870:	01255663          	bge	a0,s2,8000e87c <sniprintf+0xa8>
8000e874:	08b00793          	li	a5,139
8000e878:	00f4a023          	sw	a5,0(s1)
8000e87c:	f8040ce3          	beqz	s0,8000e814 <sniprintf+0x40>
8000e880:	00812783          	lw	a5,8(sp)
8000e884:	00078023          	sb	zero,0(a5)
8000e888:	f8dff06f          	j	8000e814 <sniprintf+0x40>

Disassembly of section .text._sprintf_r:

8000e88c <_siprintf_r>:
8000e88c:	f6010113          	addi	sp,sp,-160
8000e890:	08f12a23          	sw	a5,148(sp)
8000e894:	800007b7          	lui	a5,0x80000
8000e898:	fff7c793          	not	a5,a5
8000e89c:	00f12e23          	sw	a5,28(sp)
8000e8a0:	00f12823          	sw	a5,16(sp)
8000e8a4:	ffff07b7          	lui	a5,0xffff0
8000e8a8:	08d12623          	sw	a3,140(sp)
8000e8ac:	00b12423          	sw	a1,8(sp)
8000e8b0:	00b12c23          	sw	a1,24(sp)
8000e8b4:	20878793          	addi	a5,a5,520 # ffff0208 <_ram_heap_end+0x7ffde208>
8000e8b8:	08c10693          	addi	a3,sp,140
8000e8bc:	00810593          	addi	a1,sp,8
8000e8c0:	06112e23          	sw	ra,124(sp)
8000e8c4:	00f12a23          	sw	a5,20(sp)
8000e8c8:	08e12823          	sw	a4,144(sp)
8000e8cc:	09012c23          	sw	a6,152(sp)
8000e8d0:	09112e23          	sw	a7,156(sp)
8000e8d4:	00d12223          	sw	a3,4(sp)
8000e8d8:	4a9000ef          	jal	ra,8000f580 <_svfiprintf_r>
8000e8dc:	00812783          	lw	a5,8(sp)
8000e8e0:	00078023          	sb	zero,0(a5)
8000e8e4:	07c12083          	lw	ra,124(sp)
8000e8e8:	0a010113          	addi	sp,sp,160
8000e8ec:	00008067          	ret

Disassembly of section .text.sprintf:

8000e8f0 <siprintf>:
8000e8f0:	f6010113          	addi	sp,sp,-160
8000e8f4:	08f12a23          	sw	a5,148(sp)
8000e8f8:	800007b7          	lui	a5,0x80000
8000e8fc:	fff7c793          	not	a5,a5
8000e900:	00f12e23          	sw	a5,28(sp)
8000e904:	00f12823          	sw	a5,16(sp)
8000e908:	ffff07b7          	lui	a5,0xffff0
8000e90c:	20878793          	addi	a5,a5,520 # ffff0208 <_ram_heap_end+0x7ffde208>
8000e910:	08c12423          	sw	a2,136(sp)
8000e914:	08d12623          	sw	a3,140(sp)
8000e918:	08e12823          	sw	a4,144(sp)
8000e91c:	09012c23          	sw	a6,152(sp)
8000e920:	09112e23          	sw	a7,156(sp)
8000e924:	00f12a23          	sw	a5,20(sp)
8000e928:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000e92c:	00a12423          	sw	a0,8(sp)
8000e930:	00a12c23          	sw	a0,24(sp)
8000e934:	0007a503          	lw	a0,0(a5)
8000e938:	08810693          	addi	a3,sp,136
8000e93c:	00058613          	mv	a2,a1
8000e940:	00810593          	addi	a1,sp,8
8000e944:	06112e23          	sw	ra,124(sp)
8000e948:	00d12223          	sw	a3,4(sp)
8000e94c:	435000ef          	jal	ra,8000f580 <_svfiprintf_r>
8000e950:	00812783          	lw	a5,8(sp)
8000e954:	00078023          	sb	zero,0(a5)
8000e958:	07c12083          	lw	ra,124(sp)
8000e95c:	0a010113          	addi	sp,sp,160
8000e960:	00008067          	ret

Disassembly of section .text.__sread:

8000e964 <__sread>:
8000e964:	ff010113          	addi	sp,sp,-16
8000e968:	00812423          	sw	s0,8(sp)
8000e96c:	00058413          	mv	s0,a1
8000e970:	00e59583          	lh	a1,14(a1)
8000e974:	00112623          	sw	ra,12(sp)
8000e978:	219010ef          	jal	ra,80010390 <_read_r>
8000e97c:	02054063          	bltz	a0,8000e99c <__sread+0x38>
8000e980:	05442783          	lw	a5,84(s0)
8000e984:	00a787b3          	add	a5,a5,a0
8000e988:	04f42a23          	sw	a5,84(s0)
8000e98c:	00c12083          	lw	ra,12(sp)
8000e990:	00812403          	lw	s0,8(sp)
8000e994:	01010113          	addi	sp,sp,16
8000e998:	00008067          	ret
8000e99c:	00c45783          	lhu	a5,12(s0)
8000e9a0:	fffff737          	lui	a4,0xfffff
8000e9a4:	fff70713          	addi	a4,a4,-1 # ffffefff <_ram_heap_end+0x7ffecfff>
8000e9a8:	00e7f7b3          	and	a5,a5,a4
8000e9ac:	00f41623          	sh	a5,12(s0)
8000e9b0:	fddff06f          	j	8000e98c <__sread+0x28>

Disassembly of section .text.__seofread:

8000e9b4 <__seofread>:
8000e9b4:	00000513          	li	a0,0
8000e9b8:	00008067          	ret

Disassembly of section .text.__swrite:

8000e9bc <__swrite>:
8000e9bc:	00c5d783          	lhu	a5,12(a1)
8000e9c0:	fe010113          	addi	sp,sp,-32
8000e9c4:	00812c23          	sw	s0,24(sp)
8000e9c8:	00912a23          	sw	s1,20(sp)
8000e9cc:	01212823          	sw	s2,16(sp)
8000e9d0:	01312623          	sw	s3,12(sp)
8000e9d4:	00112e23          	sw	ra,28(sp)
8000e9d8:	1007f793          	andi	a5,a5,256
8000e9dc:	00050493          	mv	s1,a0
8000e9e0:	00058413          	mv	s0,a1
8000e9e4:	00060913          	mv	s2,a2
8000e9e8:	00068993          	mv	s3,a3
8000e9ec:	00078a63          	beqz	a5,8000ea00 <__swrite+0x44>
8000e9f0:	00e59583          	lh	a1,14(a1)
8000e9f4:	00200693          	li	a3,2
8000e9f8:	00000613          	li	a2,0
8000e9fc:	694000ef          	jal	ra,8000f090 <_lseek_r>
8000ea00:	00c45783          	lhu	a5,12(s0)
8000ea04:	fffff737          	lui	a4,0xfffff
8000ea08:	fff70713          	addi	a4,a4,-1 # ffffefff <_ram_heap_end+0x7ffecfff>
8000ea0c:	00e7f7b3          	and	a5,a5,a4
8000ea10:	00f41623          	sh	a5,12(s0)
8000ea14:	00e41583          	lh	a1,14(s0)
8000ea18:	01812403          	lw	s0,24(sp)
8000ea1c:	01c12083          	lw	ra,28(sp)
8000ea20:	00098693          	mv	a3,s3
8000ea24:	00090613          	mv	a2,s2
8000ea28:	00c12983          	lw	s3,12(sp)
8000ea2c:	01012903          	lw	s2,16(sp)
8000ea30:	00048513          	mv	a0,s1
8000ea34:	01412483          	lw	s1,20(sp)
8000ea38:	02010113          	addi	sp,sp,32
8000ea3c:	4480006f          	j	8000ee84 <_write_r>

Disassembly of section .text.__sseek:

8000ea40 <__sseek>:
8000ea40:	ff010113          	addi	sp,sp,-16
8000ea44:	00812423          	sw	s0,8(sp)
8000ea48:	00058413          	mv	s0,a1
8000ea4c:	00e59583          	lh	a1,14(a1)
8000ea50:	00112623          	sw	ra,12(sp)
8000ea54:	63c000ef          	jal	ra,8000f090 <_lseek_r>
8000ea58:	fff00793          	li	a5,-1
8000ea5c:	00c45703          	lhu	a4,12(s0)
8000ea60:	02f51263          	bne	a0,a5,8000ea84 <__sseek+0x44>
8000ea64:	fffff7b7          	lui	a5,0xfffff
8000ea68:	fff78793          	addi	a5,a5,-1 # ffffefff <_ram_heap_end+0x7ffecfff>
8000ea6c:	00e7f7b3          	and	a5,a5,a4
8000ea70:	00f41623          	sh	a5,12(s0)
8000ea74:	00c12083          	lw	ra,12(sp)
8000ea78:	00812403          	lw	s0,8(sp)
8000ea7c:	01010113          	addi	sp,sp,16
8000ea80:	00008067          	ret
8000ea84:	000017b7          	lui	a5,0x1
8000ea88:	00f767b3          	or	a5,a4,a5
8000ea8c:	00f41623          	sh	a5,12(s0)
8000ea90:	04a42a23          	sw	a0,84(s0)
8000ea94:	fe1ff06f          	j	8000ea74 <__sseek+0x34>

Disassembly of section .text.__sclose:

8000ea98 <__sclose>:
8000ea98:	00e59583          	lh	a1,14(a1)
8000ea9c:	5b00006f          	j	8000f04c <_close_r>

Disassembly of section .text.strlen:

8000eaa0 <strlen>:
8000eaa0:	00050793          	mv	a5,a0
8000eaa4:	00178793          	addi	a5,a5,1 # 1001 <_stack_size+0x801>
8000eaa8:	fff7c703          	lbu	a4,-1(a5)
8000eaac:	fe071ce3          	bnez	a4,8000eaa4 <strlen+0x4>
8000eab0:	40a78533          	sub	a0,a5,a0
8000eab4:	fff50513          	addi	a0,a0,-1
8000eab8:	00008067          	ret

Disassembly of section .text.strncmp:

8000eabc <strncmp>:
8000eabc:	02060a63          	beqz	a2,8000eaf0 <strncmp+0x34>
8000eac0:	fff60613          	addi	a2,a2,-1
8000eac4:	00000713          	li	a4,0
8000eac8:	00e507b3          	add	a5,a0,a4
8000eacc:	00e586b3          	add	a3,a1,a4
8000ead0:	0007c783          	lbu	a5,0(a5)
8000ead4:	0006c683          	lbu	a3,0(a3)
8000ead8:	00d79863          	bne	a5,a3,8000eae8 <strncmp+0x2c>
8000eadc:	00c70663          	beq	a4,a2,8000eae8 <strncmp+0x2c>
8000eae0:	00170713          	addi	a4,a4,1
8000eae4:	fe0792e3          	bnez	a5,8000eac8 <strncmp+0xc>
8000eae8:	40d78533          	sub	a0,a5,a3
8000eaec:	00008067          	ret
8000eaf0:	00000513          	li	a0,0
8000eaf4:	00008067          	ret

Disassembly of section .text._strtol_l.isra.0:

8000eaf8 <_strtol_l.isra.0>:
8000eaf8:	fc010113          	addi	sp,sp,-64
8000eafc:	03212823          	sw	s2,48(sp)
8000eb00:	03512223          	sw	s5,36(sp)
8000eb04:	03612023          	sw	s6,32(sp)
8000eb08:	01812c23          	sw	s8,24(sp)
8000eb0c:	00068913          	mv	s2,a3
8000eb10:	02112e23          	sw	ra,60(sp)
8000eb14:	02812c23          	sw	s0,56(sp)
8000eb18:	02912a23          	sw	s1,52(sp)
8000eb1c:	03312623          	sw	s3,44(sp)
8000eb20:	03412423          	sw	s4,40(sp)
8000eb24:	01712e23          	sw	s7,28(sp)
8000eb28:	01912a23          	sw	s9,20(sp)
8000eb2c:	01a12823          	sw	s10,16(sp)
8000eb30:	01b12623          	sw	s11,12(sp)
8000eb34:	00050a93          	mv	s5,a0
8000eb38:	00058b13          	mv	s6,a1
8000eb3c:	00060c13          	mv	s8,a2
8000eb40:	00058793          	mv	a5,a1
8000eb44:	ffff4697          	auipc	a3,0xffff4
8000eb48:	12968693          	addi	a3,a3,297 # 80002c6d <_ctype_+0x1>
8000eb4c:	00178493          	addi	s1,a5,1
8000eb50:	fff4c403          	lbu	s0,-1(s1)
8000eb54:	00d40733          	add	a4,s0,a3
8000eb58:	00074703          	lbu	a4,0(a4)
8000eb5c:	00877713          	andi	a4,a4,8
8000eb60:	0c071863          	bnez	a4,8000ec30 <_strtol_l.isra.0+0x138>
8000eb64:	02d00713          	li	a4,45
8000eb68:	0ce41863          	bne	s0,a4,8000ec38 <_strtol_l.isra.0+0x140>
8000eb6c:	0004c403          	lbu	s0,0(s1)
8000eb70:	00100a13          	li	s4,1
8000eb74:	00278493          	addi	s1,a5,2
8000eb78:	16090e63          	beqz	s2,8000ecf4 <_strtol_l.isra.0+0x1fc>
8000eb7c:	01000793          	li	a5,16
8000eb80:	02f91463          	bne	s2,a5,8000eba8 <_strtol_l.isra.0+0xb0>
8000eb84:	03000793          	li	a5,48
8000eb88:	02f41063          	bne	s0,a5,8000eba8 <_strtol_l.isra.0+0xb0>
8000eb8c:	0004c783          	lbu	a5,0(s1)
8000eb90:	05800713          	li	a4,88
8000eb94:	0df7f793          	andi	a5,a5,223
8000eb98:	14e79663          	bne	a5,a4,8000ece4 <_strtol_l.isra.0+0x1ec>
8000eb9c:	0014c403          	lbu	s0,1(s1)
8000eba0:	01000913          	li	s2,16
8000eba4:	00248493          	addi	s1,s1,2
8000eba8:	800009b7          	lui	s3,0x80000
8000ebac:	000a1463          	bnez	s4,8000ebb4 <_strtol_l.isra.0+0xbc>
8000ebb0:	fff9c993          	not	s3,s3
8000ebb4:	00090593          	mv	a1,s2
8000ebb8:	00098513          	mv	a0,s3
8000ebbc:	ed4fe0ef          	jal	ra,8000d290 <__umodsi3>
8000ebc0:	00050b93          	mv	s7,a0
8000ebc4:	00090593          	mv	a1,s2
8000ebc8:	00098513          	mv	a0,s3
8000ebcc:	e7cfe0ef          	jal	ra,8000d248 <__udivsi3>
8000ebd0:	00050c93          	mv	s9,a0
8000ebd4:	00000713          	li	a4,0
8000ebd8:	00000513          	li	a0,0
8000ebdc:	00900d93          	li	s11,9
8000ebe0:	01900d13          	li	s10,25
8000ebe4:	fff00693          	li	a3,-1
8000ebe8:	fd040793          	addi	a5,s0,-48
8000ebec:	06fde463          	bltu	s11,a5,8000ec54 <_strtol_l.isra.0+0x15c>
8000ebf0:	00078413          	mv	s0,a5
8000ebf4:	09245063          	bge	s0,s2,8000ec74 <_strtol_l.isra.0+0x17c>
8000ebf8:	02d70663          	beq	a4,a3,8000ec24 <_strtol_l.isra.0+0x12c>
8000ebfc:	fff00713          	li	a4,-1
8000ec00:	02ace263          	bltu	s9,a0,8000ec24 <_strtol_l.isra.0+0x12c>
8000ec04:	00ac9463          	bne	s9,a0,8000ec0c <_strtol_l.isra.0+0x114>
8000ec08:	008bce63          	blt	s7,s0,8000ec24 <_strtol_l.isra.0+0x12c>
8000ec0c:	00050593          	mv	a1,a0
8000ec10:	00090513          	mv	a0,s2
8000ec14:	e08fe0ef          	jal	ra,8000d21c <__mulsi3>
8000ec18:	00a40533          	add	a0,s0,a0
8000ec1c:	00100713          	li	a4,1
8000ec20:	fff00693          	li	a3,-1
8000ec24:	00148493          	addi	s1,s1,1
8000ec28:	fff4c403          	lbu	s0,-1(s1)
8000ec2c:	fbdff06f          	j	8000ebe8 <_strtol_l.isra.0+0xf0>
8000ec30:	00048793          	mv	a5,s1
8000ec34:	f19ff06f          	j	8000eb4c <_strtol_l.isra.0+0x54>
8000ec38:	02b00713          	li	a4,43
8000ec3c:	00e40663          	beq	s0,a4,8000ec48 <_strtol_l.isra.0+0x150>
8000ec40:	00000a13          	li	s4,0
8000ec44:	f35ff06f          	j	8000eb78 <_strtol_l.isra.0+0x80>
8000ec48:	0004c403          	lbu	s0,0(s1)
8000ec4c:	00278493          	addi	s1,a5,2
8000ec50:	ff1ff06f          	j	8000ec40 <_strtol_l.isra.0+0x148>
8000ec54:	fbf40793          	addi	a5,s0,-65
8000ec58:	00fd6663          	bltu	s10,a5,8000ec64 <_strtol_l.isra.0+0x16c>
8000ec5c:	fc940413          	addi	s0,s0,-55
8000ec60:	f95ff06f          	j	8000ebf4 <_strtol_l.isra.0+0xfc>
8000ec64:	f9f40793          	addi	a5,s0,-97
8000ec68:	00fd6663          	bltu	s10,a5,8000ec74 <_strtol_l.isra.0+0x17c>
8000ec6c:	fa940413          	addi	s0,s0,-87
8000ec70:	f85ff06f          	j	8000ebf4 <_strtol_l.isra.0+0xfc>
8000ec74:	fff00793          	li	a5,-1
8000ec78:	04f71863          	bne	a4,a5,8000ecc8 <_strtol_l.isra.0+0x1d0>
8000ec7c:	02200793          	li	a5,34
8000ec80:	00faa023          	sw	a5,0(s5)
8000ec84:	00098513          	mv	a0,s3
8000ec88:	040c1863          	bnez	s8,8000ecd8 <_strtol_l.isra.0+0x1e0>
8000ec8c:	03c12083          	lw	ra,60(sp)
8000ec90:	03812403          	lw	s0,56(sp)
8000ec94:	03412483          	lw	s1,52(sp)
8000ec98:	03012903          	lw	s2,48(sp)
8000ec9c:	02c12983          	lw	s3,44(sp)
8000eca0:	02812a03          	lw	s4,40(sp)
8000eca4:	02412a83          	lw	s5,36(sp)
8000eca8:	02012b03          	lw	s6,32(sp)
8000ecac:	01c12b83          	lw	s7,28(sp)
8000ecb0:	01812c03          	lw	s8,24(sp)
8000ecb4:	01412c83          	lw	s9,20(sp)
8000ecb8:	01012d03          	lw	s10,16(sp)
8000ecbc:	00c12d83          	lw	s11,12(sp)
8000ecc0:	04010113          	addi	sp,sp,64
8000ecc4:	00008067          	ret
8000ecc8:	000a0463          	beqz	s4,8000ecd0 <_strtol_l.isra.0+0x1d8>
8000eccc:	40a00533          	neg	a0,a0
8000ecd0:	fa0c0ee3          	beqz	s8,8000ec8c <_strtol_l.isra.0+0x194>
8000ecd4:	00070463          	beqz	a4,8000ecdc <_strtol_l.isra.0+0x1e4>
8000ecd8:	fff48b13          	addi	s6,s1,-1
8000ecdc:	016c2023          	sw	s6,0(s8)
8000ece0:	fadff06f          	j	8000ec8c <_strtol_l.isra.0+0x194>
8000ece4:	03000413          	li	s0,48
8000ece8:	ec0910e3          	bnez	s2,8000eba8 <_strtol_l.isra.0+0xb0>
8000ecec:	00800913          	li	s2,8
8000ecf0:	eb9ff06f          	j	8000eba8 <_strtol_l.isra.0+0xb0>
8000ecf4:	03000793          	li	a5,48
8000ecf8:	e8f40ae3          	beq	s0,a5,8000eb8c <_strtol_l.isra.0+0x94>
8000ecfc:	00a00913          	li	s2,10
8000ed00:	ea9ff06f          	j	8000eba8 <_strtol_l.isra.0+0xb0>

Disassembly of section .text._strtol_r:

8000ed04 <_strtol_r>:
8000ed04:	df5ff06f          	j	8000eaf8 <_strtol_l.isra.0>

Disassembly of section .text.strtol_l:

8000ed08 <strtol_l>:
8000ed08:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000ed0c:	00060693          	mv	a3,a2
8000ed10:	00058613          	mv	a2,a1
8000ed14:	00050593          	mv	a1,a0
8000ed18:	0007a503          	lw	a0,0(a5)
8000ed1c:	dddff06f          	j	8000eaf8 <_strtol_l.isra.0>

Disassembly of section .text.strtol:

8000ed20 <strtol>:
8000ed20:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000ed24:	00060693          	mv	a3,a2
8000ed28:	00058613          	mv	a2,a1
8000ed2c:	00050593          	mv	a1,a0
8000ed30:	0007a503          	lw	a0,0(a5)
8000ed34:	dc5ff06f          	j	8000eaf8 <_strtol_l.isra.0>

Disassembly of section .text.__swbuf_r:

8000ed38 <__swbuf_r>:
8000ed38:	fe010113          	addi	sp,sp,-32
8000ed3c:	00812c23          	sw	s0,24(sp)
8000ed40:	00912a23          	sw	s1,20(sp)
8000ed44:	01212823          	sw	s2,16(sp)
8000ed48:	00112e23          	sw	ra,28(sp)
8000ed4c:	01312623          	sw	s3,12(sp)
8000ed50:	00050493          	mv	s1,a0
8000ed54:	00058913          	mv	s2,a1
8000ed58:	00060413          	mv	s0,a2
8000ed5c:	00050863          	beqz	a0,8000ed6c <__swbuf_r+0x34>
8000ed60:	01852783          	lw	a5,24(a0)
8000ed64:	00079463          	bnez	a5,8000ed6c <__swbuf_r+0x34>
8000ed68:	ee9fe0ef          	jal	ra,8000dc50 <__sinit>
8000ed6c:	ffff4797          	auipc	a5,0xffff4
8000ed70:	02478793          	addi	a5,a5,36 # 80002d90 <__sf_fake_stdin>
8000ed74:	0af41e63          	bne	s0,a5,8000ee30 <__swbuf_r+0xf8>
8000ed78:	0044a403          	lw	s0,4(s1)
8000ed7c:	01842783          	lw	a5,24(s0)
8000ed80:	00f42423          	sw	a5,8(s0)
8000ed84:	00c45783          	lhu	a5,12(s0)
8000ed88:	0087f793          	andi	a5,a5,8
8000ed8c:	0c078663          	beqz	a5,8000ee58 <__swbuf_r+0x120>
8000ed90:	01042783          	lw	a5,16(s0)
8000ed94:	0c078263          	beqz	a5,8000ee58 <__swbuf_r+0x120>
8000ed98:	01042783          	lw	a5,16(s0)
8000ed9c:	00042503          	lw	a0,0(s0)
8000eda0:	0ff97993          	andi	s3,s2,255
8000eda4:	0ff97913          	andi	s2,s2,255
8000eda8:	40f50533          	sub	a0,a0,a5
8000edac:	01442783          	lw	a5,20(s0)
8000edb0:	00f54a63          	blt	a0,a5,8000edc4 <__swbuf_r+0x8c>
8000edb4:	00040593          	mv	a1,s0
8000edb8:	00048513          	mv	a0,s1
8000edbc:	ca5fe0ef          	jal	ra,8000da60 <_fflush_r>
8000edc0:	0a051463          	bnez	a0,8000ee68 <__swbuf_r+0x130>
8000edc4:	00842783          	lw	a5,8(s0)
8000edc8:	00150513          	addi	a0,a0,1
8000edcc:	fff78793          	addi	a5,a5,-1
8000edd0:	00f42423          	sw	a5,8(s0)
8000edd4:	00042783          	lw	a5,0(s0)
8000edd8:	00178713          	addi	a4,a5,1
8000eddc:	00e42023          	sw	a4,0(s0)
8000ede0:	01378023          	sb	s3,0(a5)
8000ede4:	01442783          	lw	a5,20(s0)
8000ede8:	00a78c63          	beq	a5,a0,8000ee00 <__swbuf_r+0xc8>
8000edec:	00c45783          	lhu	a5,12(s0)
8000edf0:	0017f793          	andi	a5,a5,1
8000edf4:	00078e63          	beqz	a5,8000ee10 <__swbuf_r+0xd8>
8000edf8:	00a00793          	li	a5,10
8000edfc:	00f91a63          	bne	s2,a5,8000ee10 <__swbuf_r+0xd8>
8000ee00:	00040593          	mv	a1,s0
8000ee04:	00048513          	mv	a0,s1
8000ee08:	c59fe0ef          	jal	ra,8000da60 <_fflush_r>
8000ee0c:	04051e63          	bnez	a0,8000ee68 <__swbuf_r+0x130>
8000ee10:	01c12083          	lw	ra,28(sp)
8000ee14:	01812403          	lw	s0,24(sp)
8000ee18:	00090513          	mv	a0,s2
8000ee1c:	01412483          	lw	s1,20(sp)
8000ee20:	01012903          	lw	s2,16(sp)
8000ee24:	00c12983          	lw	s3,12(sp)
8000ee28:	02010113          	addi	sp,sp,32
8000ee2c:	00008067          	ret
8000ee30:	ffff4797          	auipc	a5,0xffff4
8000ee34:	f8078793          	addi	a5,a5,-128 # 80002db0 <__sf_fake_stdout>
8000ee38:	00f41663          	bne	s0,a5,8000ee44 <__swbuf_r+0x10c>
8000ee3c:	0084a403          	lw	s0,8(s1)
8000ee40:	f3dff06f          	j	8000ed7c <__swbuf_r+0x44>
8000ee44:	ffff4797          	auipc	a5,0xffff4
8000ee48:	f2c78793          	addi	a5,a5,-212 # 80002d70 <__sf_fake_stderr>
8000ee4c:	f2f418e3          	bne	s0,a5,8000ed7c <__swbuf_r+0x44>
8000ee50:	00c4a403          	lw	s0,12(s1)
8000ee54:	f29ff06f          	j	8000ed7c <__swbuf_r+0x44>
8000ee58:	00040593          	mv	a1,s0
8000ee5c:	00048513          	mv	a0,s1
8000ee60:	070000ef          	jal	ra,8000eed0 <__swsetup_r>
8000ee64:	f2050ae3          	beqz	a0,8000ed98 <__swbuf_r+0x60>
8000ee68:	fff00913          	li	s2,-1
8000ee6c:	fa5ff06f          	j	8000ee10 <__swbuf_r+0xd8>

Disassembly of section .text.__swbuf:

8000ee70 <__swbuf>:
8000ee70:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000ee74:	00058613          	mv	a2,a1
8000ee78:	00050593          	mv	a1,a0
8000ee7c:	0007a503          	lw	a0,0(a5)
8000ee80:	eb9ff06f          	j	8000ed38 <__swbuf_r>

Disassembly of section .text._write_r:

8000ee84 <_write_r>:
8000ee84:	ff010113          	addi	sp,sp,-16
8000ee88:	00812423          	sw	s0,8(sp)
8000ee8c:	00050413          	mv	s0,a0
8000ee90:	00058513          	mv	a0,a1
8000ee94:	00060593          	mv	a1,a2
8000ee98:	00068613          	mv	a2,a3
8000ee9c:	c401a623          	sw	zero,-948(gp) # 800033e4 <errno>
8000eea0:	00112623          	sw	ra,12(sp)
8000eea4:	d1df60ef          	jal	ra,80005bc0 <_write>
8000eea8:	fff00793          	li	a5,-1
8000eeac:	00f51a63          	bne	a0,a5,8000eec0 <_write_r+0x3c>
8000eeb0:	c4c18793          	addi	a5,gp,-948 # 800033e4 <errno>
8000eeb4:	0007a783          	lw	a5,0(a5)
8000eeb8:	00078463          	beqz	a5,8000eec0 <_write_r+0x3c>
8000eebc:	00f42023          	sw	a5,0(s0)
8000eec0:	00c12083          	lw	ra,12(sp)
8000eec4:	00812403          	lw	s0,8(sp)
8000eec8:	01010113          	addi	sp,sp,16
8000eecc:	00008067          	ret

Disassembly of section .text.__swsetup_r:

8000eed0 <__swsetup_r>:
8000eed0:	ff010113          	addi	sp,sp,-16
8000eed4:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8000eed8:	00912223          	sw	s1,4(sp)
8000eedc:	0007a483          	lw	s1,0(a5)
8000eee0:	00812423          	sw	s0,8(sp)
8000eee4:	01212023          	sw	s2,0(sp)
8000eee8:	00112623          	sw	ra,12(sp)
8000eeec:	00050913          	mv	s2,a0
8000eef0:	00058413          	mv	s0,a1
8000eef4:	00048a63          	beqz	s1,8000ef08 <__swsetup_r+0x38>
8000eef8:	0184a783          	lw	a5,24(s1)
8000eefc:	00079663          	bnez	a5,8000ef08 <__swsetup_r+0x38>
8000ef00:	00048513          	mv	a0,s1
8000ef04:	d4dfe0ef          	jal	ra,8000dc50 <__sinit>
8000ef08:	ffff4797          	auipc	a5,0xffff4
8000ef0c:	e8878793          	addi	a5,a5,-376 # 80002d90 <__sf_fake_stdin>
8000ef10:	04f41863          	bne	s0,a5,8000ef60 <__swsetup_r+0x90>
8000ef14:	0044a403          	lw	s0,4(s1)
8000ef18:	00c41703          	lh	a4,12(s0)
8000ef1c:	01071793          	slli	a5,a4,0x10
8000ef20:	0107d793          	srli	a5,a5,0x10
8000ef24:	0087f693          	andi	a3,a5,8
8000ef28:	0a069463          	bnez	a3,8000efd0 <__swsetup_r+0x100>
8000ef2c:	0107f693          	andi	a3,a5,16
8000ef30:	04069c63          	bnez	a3,8000ef88 <__swsetup_r+0xb8>
8000ef34:	00900793          	li	a5,9
8000ef38:	00f92023          	sw	a5,0(s2)
8000ef3c:	04076713          	ori	a4,a4,64
8000ef40:	00e41623          	sh	a4,12(s0)
8000ef44:	fff00513          	li	a0,-1
8000ef48:	00c12083          	lw	ra,12(sp)
8000ef4c:	00812403          	lw	s0,8(sp)
8000ef50:	00412483          	lw	s1,4(sp)
8000ef54:	00012903          	lw	s2,0(sp)
8000ef58:	01010113          	addi	sp,sp,16
8000ef5c:	00008067          	ret
8000ef60:	ffff4797          	auipc	a5,0xffff4
8000ef64:	e5078793          	addi	a5,a5,-432 # 80002db0 <__sf_fake_stdout>
8000ef68:	00f41663          	bne	s0,a5,8000ef74 <__swsetup_r+0xa4>
8000ef6c:	0084a403          	lw	s0,8(s1)
8000ef70:	fa9ff06f          	j	8000ef18 <__swsetup_r+0x48>
8000ef74:	ffff4797          	auipc	a5,0xffff4
8000ef78:	dfc78793          	addi	a5,a5,-516 # 80002d70 <__sf_fake_stderr>
8000ef7c:	f8f41ee3          	bne	s0,a5,8000ef18 <__swsetup_r+0x48>
8000ef80:	00c4a403          	lw	s0,12(s1)
8000ef84:	f95ff06f          	j	8000ef18 <__swsetup_r+0x48>
8000ef88:	0047f793          	andi	a5,a5,4
8000ef8c:	02078c63          	beqz	a5,8000efc4 <__swsetup_r+0xf4>
8000ef90:	03442583          	lw	a1,52(s0)
8000ef94:	00058c63          	beqz	a1,8000efac <__swsetup_r+0xdc>
8000ef98:	04440793          	addi	a5,s0,68
8000ef9c:	00f58663          	beq	a1,a5,8000efa8 <__swsetup_r+0xd8>
8000efa0:	00090513          	mv	a0,s2
8000efa4:	aa8ff0ef          	jal	ra,8000e24c <_free_r>
8000efa8:	02042a23          	sw	zero,52(s0)
8000efac:	00c45783          	lhu	a5,12(s0)
8000efb0:	00042223          	sw	zero,4(s0)
8000efb4:	fdb7f793          	andi	a5,a5,-37
8000efb8:	00f41623          	sh	a5,12(s0)
8000efbc:	01042783          	lw	a5,16(s0)
8000efc0:	00f42023          	sw	a5,0(s0)
8000efc4:	00c45783          	lhu	a5,12(s0)
8000efc8:	0087e793          	ori	a5,a5,8
8000efcc:	00f41623          	sh	a5,12(s0)
8000efd0:	01042783          	lw	a5,16(s0)
8000efd4:	02079063          	bnez	a5,8000eff4 <__swsetup_r+0x124>
8000efd8:	00c45783          	lhu	a5,12(s0)
8000efdc:	20000713          	li	a4,512
8000efe0:	2807f793          	andi	a5,a5,640
8000efe4:	00e78863          	beq	a5,a4,8000eff4 <__swsetup_r+0x124>
8000efe8:	00040593          	mv	a1,s0
8000efec:	00090513          	mv	a0,s2
8000eff0:	178000ef          	jal	ra,8000f168 <__smakebuf_r>
8000eff4:	00c45783          	lhu	a5,12(s0)
8000eff8:	0017f713          	andi	a4,a5,1
8000effc:	02070c63          	beqz	a4,8000f034 <__swsetup_r+0x164>
8000f000:	01442783          	lw	a5,20(s0)
8000f004:	00042423          	sw	zero,8(s0)
8000f008:	40f007b3          	neg	a5,a5
8000f00c:	00f42c23          	sw	a5,24(s0)
8000f010:	01042783          	lw	a5,16(s0)
8000f014:	00000513          	li	a0,0
8000f018:	f20798e3          	bnez	a5,8000ef48 <__swsetup_r+0x78>
8000f01c:	00c41783          	lh	a5,12(s0)
8000f020:	0807f713          	andi	a4,a5,128
8000f024:	f20702e3          	beqz	a4,8000ef48 <__swsetup_r+0x78>
8000f028:	0407e793          	ori	a5,a5,64
8000f02c:	00f41623          	sh	a5,12(s0)
8000f030:	f15ff06f          	j	8000ef44 <__swsetup_r+0x74>
8000f034:	0027f793          	andi	a5,a5,2
8000f038:	00000713          	li	a4,0
8000f03c:	00079463          	bnez	a5,8000f044 <__swsetup_r+0x174>
8000f040:	01442703          	lw	a4,20(s0)
8000f044:	00e42423          	sw	a4,8(s0)
8000f048:	fc9ff06f          	j	8000f010 <__swsetup_r+0x140>

Disassembly of section .text._close_r:

8000f04c <_close_r>:
8000f04c:	ff010113          	addi	sp,sp,-16
8000f050:	00812423          	sw	s0,8(sp)
8000f054:	00050413          	mv	s0,a0
8000f058:	00058513          	mv	a0,a1
8000f05c:	c401a623          	sw	zero,-948(gp) # 800033e4 <errno>
8000f060:	00112623          	sw	ra,12(sp)
8000f064:	b99f60ef          	jal	ra,80005bfc <_close>
8000f068:	fff00793          	li	a5,-1
8000f06c:	00f51a63          	bne	a0,a5,8000f080 <_close_r+0x34>
8000f070:	c4c18793          	addi	a5,gp,-948 # 800033e4 <errno>
8000f074:	0007a783          	lw	a5,0(a5)
8000f078:	00078463          	beqz	a5,8000f080 <_close_r+0x34>
8000f07c:	00f42023          	sw	a5,0(s0)
8000f080:	00c12083          	lw	ra,12(sp)
8000f084:	00812403          	lw	s0,8(sp)
8000f088:	01010113          	addi	sp,sp,16
8000f08c:	00008067          	ret

Disassembly of section .text._lseek_r:

8000f090 <_lseek_r>:
8000f090:	ff010113          	addi	sp,sp,-16
8000f094:	00812423          	sw	s0,8(sp)
8000f098:	00050413          	mv	s0,a0
8000f09c:	00058513          	mv	a0,a1
8000f0a0:	00060593          	mv	a1,a2
8000f0a4:	00068613          	mv	a2,a3
8000f0a8:	c401a623          	sw	zero,-948(gp) # 800033e4 <errno>
8000f0ac:	00112623          	sw	ra,12(sp)
8000f0b0:	b55f60ef          	jal	ra,80005c04 <_lseek>
8000f0b4:	fff00793          	li	a5,-1
8000f0b8:	00f51a63          	bne	a0,a5,8000f0cc <_lseek_r+0x3c>
8000f0bc:	c4c18793          	addi	a5,gp,-948 # 800033e4 <errno>
8000f0c0:	0007a783          	lw	a5,0(a5)
8000f0c4:	00078463          	beqz	a5,8000f0cc <_lseek_r+0x3c>
8000f0c8:	00f42023          	sw	a5,0(s0)
8000f0cc:	00c12083          	lw	ra,12(sp)
8000f0d0:	00812403          	lw	s0,8(sp)
8000f0d4:	01010113          	addi	sp,sp,16
8000f0d8:	00008067          	ret

Disassembly of section .text.__swhatbuf_r:

8000f0dc <__swhatbuf_r>:
8000f0dc:	f8010113          	addi	sp,sp,-128
8000f0e0:	06912a23          	sw	s1,116(sp)
8000f0e4:	00058493          	mv	s1,a1
8000f0e8:	00e59583          	lh	a1,14(a1)
8000f0ec:	06812c23          	sw	s0,120(sp)
8000f0f0:	06112e23          	sw	ra,124(sp)
8000f0f4:	00060413          	mv	s0,a2
8000f0f8:	0005de63          	bgez	a1,8000f114 <__swhatbuf_r+0x38>
8000f0fc:	00c4d783          	lhu	a5,12(s1)
8000f100:	0006a023          	sw	zero,0(a3)
8000f104:	0807f793          	andi	a5,a5,128
8000f108:	04079063          	bnez	a5,8000f148 <__swhatbuf_r+0x6c>
8000f10c:	40000793          	li	a5,1024
8000f110:	03c0006f          	j	8000f14c <__swhatbuf_r+0x70>
8000f114:	01810613          	addi	a2,sp,24
8000f118:	00d12623          	sw	a3,12(sp)
8000f11c:	46c010ef          	jal	ra,80010588 <_fstat_r>
8000f120:	00c12683          	lw	a3,12(sp)
8000f124:	fc054ce3          	bltz	a0,8000f0fc <__swhatbuf_r+0x20>
8000f128:	01c12703          	lw	a4,28(sp)
8000f12c:	0000f7b7          	lui	a5,0xf
8000f130:	00e7f7b3          	and	a5,a5,a4
8000f134:	ffffe737          	lui	a4,0xffffe
8000f138:	00e787b3          	add	a5,a5,a4
8000f13c:	0017b793          	seqz	a5,a5
8000f140:	00f6a023          	sw	a5,0(a3)
8000f144:	fc9ff06f          	j	8000f10c <__swhatbuf_r+0x30>
8000f148:	04000793          	li	a5,64
8000f14c:	00f42023          	sw	a5,0(s0)
8000f150:	07c12083          	lw	ra,124(sp)
8000f154:	07812403          	lw	s0,120(sp)
8000f158:	07412483          	lw	s1,116(sp)
8000f15c:	00000513          	li	a0,0
8000f160:	08010113          	addi	sp,sp,128
8000f164:	00008067          	ret

Disassembly of section .text.__smakebuf_r:

8000f168 <__smakebuf_r>:
8000f168:	00c5d783          	lhu	a5,12(a1)
8000f16c:	fe010113          	addi	sp,sp,-32
8000f170:	00812c23          	sw	s0,24(sp)
8000f174:	00112e23          	sw	ra,28(sp)
8000f178:	00912a23          	sw	s1,20(sp)
8000f17c:	01212823          	sw	s2,16(sp)
8000f180:	0027f793          	andi	a5,a5,2
8000f184:	00058413          	mv	s0,a1
8000f188:	02078863          	beqz	a5,8000f1b8 <__smakebuf_r+0x50>
8000f18c:	04740793          	addi	a5,s0,71
8000f190:	00f42023          	sw	a5,0(s0)
8000f194:	00f42823          	sw	a5,16(s0)
8000f198:	00100793          	li	a5,1
8000f19c:	00f42a23          	sw	a5,20(s0)
8000f1a0:	01c12083          	lw	ra,28(sp)
8000f1a4:	01812403          	lw	s0,24(sp)
8000f1a8:	01412483          	lw	s1,20(sp)
8000f1ac:	01012903          	lw	s2,16(sp)
8000f1b0:	02010113          	addi	sp,sp,32
8000f1b4:	00008067          	ret
8000f1b8:	00c10693          	addi	a3,sp,12
8000f1bc:	00810613          	addi	a2,sp,8
8000f1c0:	00050493          	mv	s1,a0
8000f1c4:	f19ff0ef          	jal	ra,8000f0dc <__swhatbuf_r>
8000f1c8:	00812583          	lw	a1,8(sp)
8000f1cc:	00050913          	mv	s2,a0
8000f1d0:	00048513          	mv	a0,s1
8000f1d4:	97cff0ef          	jal	ra,8000e350 <_malloc_r>
8000f1d8:	02051063          	bnez	a0,8000f1f8 <__smakebuf_r+0x90>
8000f1dc:	00c41783          	lh	a5,12(s0)
8000f1e0:	2007f713          	andi	a4,a5,512
8000f1e4:	fa071ee3          	bnez	a4,8000f1a0 <__smakebuf_r+0x38>
8000f1e8:	ffc7f793          	andi	a5,a5,-4
8000f1ec:	0027e793          	ori	a5,a5,2
8000f1f0:	00f41623          	sh	a5,12(s0)
8000f1f4:	f99ff06f          	j	8000f18c <__smakebuf_r+0x24>
8000f1f8:	fffff797          	auipc	a5,0xfffff
8000f1fc:	9c078793          	addi	a5,a5,-1600 # 8000dbb8 <_cleanup_r>
8000f200:	02f4a423          	sw	a5,40(s1)
8000f204:	00c45783          	lhu	a5,12(s0)
8000f208:	00a42023          	sw	a0,0(s0)
8000f20c:	00a42823          	sw	a0,16(s0)
8000f210:	0807e793          	ori	a5,a5,128
8000f214:	00f41623          	sh	a5,12(s0)
8000f218:	00812783          	lw	a5,8(sp)
8000f21c:	00f42a23          	sw	a5,20(s0)
8000f220:	00c12783          	lw	a5,12(sp)
8000f224:	02078263          	beqz	a5,8000f248 <__smakebuf_r+0xe0>
8000f228:	00e41583          	lh	a1,14(s0)
8000f22c:	00048513          	mv	a0,s1
8000f230:	001010ef          	jal	ra,80010a30 <_isatty_r>
8000f234:	00050a63          	beqz	a0,8000f248 <__smakebuf_r+0xe0>
8000f238:	00c45783          	lhu	a5,12(s0)
8000f23c:	ffc7f793          	andi	a5,a5,-4
8000f240:	0017e793          	ori	a5,a5,1
8000f244:	00f41623          	sh	a5,12(s0)
8000f248:	00c45783          	lhu	a5,12(s0)
8000f24c:	00f96933          	or	s2,s2,a5
8000f250:	01241623          	sh	s2,12(s0)
8000f254:	f4dff06f          	j	8000f1a0 <__smakebuf_r+0x38>

Disassembly of section .text.__ssputs_r:

8000f258 <__ssputs_r>:
8000f258:	fe010113          	addi	sp,sp,-32
8000f25c:	01212823          	sw	s2,16(sp)
8000f260:	0085a903          	lw	s2,8(a1)
8000f264:	00812c23          	sw	s0,24(sp)
8000f268:	01412423          	sw	s4,8(sp)
8000f26c:	01612023          	sw	s6,0(sp)
8000f270:	00112e23          	sw	ra,28(sp)
8000f274:	00912a23          	sw	s1,20(sp)
8000f278:	01312623          	sw	s3,12(sp)
8000f27c:	01512223          	sw	s5,4(sp)
8000f280:	00058413          	mv	s0,a1
8000f284:	00060b13          	mv	s6,a2
8000f288:	00068a13          	mv	s4,a3
8000f28c:	0f26e063          	bltu	a3,s2,8000f36c <__ssputs_r+0x114>
8000f290:	00c5d783          	lhu	a5,12(a1)
8000f294:	4807f713          	andi	a4,a5,1152
8000f298:	0c070863          	beqz	a4,8000f368 <__ssputs_r+0x110>
8000f29c:	00042483          	lw	s1,0(s0)
8000f2a0:	01442703          	lw	a4,20(s0)
8000f2a4:	0105a583          	lw	a1,16(a1)
8000f2a8:	00050a93          	mv	s5,a0
8000f2ac:	40b489b3          	sub	s3,s1,a1
8000f2b0:	00171493          	slli	s1,a4,0x1
8000f2b4:	00e48733          	add	a4,s1,a4
8000f2b8:	01f75493          	srli	s1,a4,0x1f
8000f2bc:	00e484b3          	add	s1,s1,a4
8000f2c0:	00168713          	addi	a4,a3,1
8000f2c4:	4014d493          	srai	s1,s1,0x1
8000f2c8:	01370733          	add	a4,a4,s3
8000f2cc:	00e4f463          	bgeu	s1,a4,8000f2d4 <__ssputs_r+0x7c>
8000f2d0:	00070493          	mv	s1,a4
8000f2d4:	4007f793          	andi	a5,a5,1024
8000f2d8:	0c078463          	beqz	a5,8000f3a0 <__ssputs_r+0x148>
8000f2dc:	00048593          	mv	a1,s1
8000f2e0:	000a8513          	mv	a0,s5
8000f2e4:	86cff0ef          	jal	ra,8000e350 <_malloc_r>
8000f2e8:	00050913          	mv	s2,a0
8000f2ec:	04051263          	bnez	a0,8000f330 <__ssputs_r+0xd8>
8000f2f0:	00c00793          	li	a5,12
8000f2f4:	00faa023          	sw	a5,0(s5)
8000f2f8:	00c45783          	lhu	a5,12(s0)
8000f2fc:	fff00513          	li	a0,-1
8000f300:	0407e793          	ori	a5,a5,64
8000f304:	00f41623          	sh	a5,12(s0)
8000f308:	01c12083          	lw	ra,28(sp)
8000f30c:	01812403          	lw	s0,24(sp)
8000f310:	01412483          	lw	s1,20(sp)
8000f314:	01012903          	lw	s2,16(sp)
8000f318:	00c12983          	lw	s3,12(sp)
8000f31c:	00812a03          	lw	s4,8(sp)
8000f320:	00412a83          	lw	s5,4(sp)
8000f324:	00012b03          	lw	s6,0(sp)
8000f328:	02010113          	addi	sp,sp,32
8000f32c:	00008067          	ret
8000f330:	01042583          	lw	a1,16(s0)
8000f334:	00098613          	mv	a2,s3
8000f338:	d8dfe0ef          	jal	ra,8000e0c4 <memcpy>
8000f33c:	00c45783          	lhu	a5,12(s0)
8000f340:	b7f7f793          	andi	a5,a5,-1153
8000f344:	0807e793          	ori	a5,a5,128
8000f348:	00f41623          	sh	a5,12(s0)
8000f34c:	01242823          	sw	s2,16(s0)
8000f350:	00942a23          	sw	s1,20(s0)
8000f354:	01390933          	add	s2,s2,s3
8000f358:	413484b3          	sub	s1,s1,s3
8000f35c:	01242023          	sw	s2,0(s0)
8000f360:	00942423          	sw	s1,8(s0)
8000f364:	000a0913          	mv	s2,s4
8000f368:	012a7463          	bgeu	s4,s2,8000f370 <__ssputs_r+0x118>
8000f36c:	000a0913          	mv	s2,s4
8000f370:	00042503          	lw	a0,0(s0)
8000f374:	00090613          	mv	a2,s2
8000f378:	000b0593          	mv	a1,s6
8000f37c:	e21fe0ef          	jal	ra,8000e19c <memmove>
8000f380:	00842783          	lw	a5,8(s0)
8000f384:	00000513          	li	a0,0
8000f388:	412787b3          	sub	a5,a5,s2
8000f38c:	00f42423          	sw	a5,8(s0)
8000f390:	00042783          	lw	a5,0(s0)
8000f394:	01278933          	add	s2,a5,s2
8000f398:	01242023          	sw	s2,0(s0)
8000f39c:	f6dff06f          	j	8000f308 <__ssputs_r+0xb0>
8000f3a0:	00048613          	mv	a2,s1
8000f3a4:	000a8513          	mv	a0,s5
8000f3a8:	6f0010ef          	jal	ra,80010a98 <_realloc_r>
8000f3ac:	00050913          	mv	s2,a0
8000f3b0:	f8051ee3          	bnez	a0,8000f34c <__ssputs_r+0xf4>
8000f3b4:	01042583          	lw	a1,16(s0)
8000f3b8:	000a8513          	mv	a0,s5
8000f3bc:	e91fe0ef          	jal	ra,8000e24c <_free_r>
8000f3c0:	f31ff06f          	j	8000f2f0 <__ssputs_r+0x98>

Disassembly of section .text.__ssprint_r:

8000f3c4 <__ssprint_r>:
8000f3c4:	00862783          	lw	a5,8(a2)
8000f3c8:	fd010113          	addi	sp,sp,-48
8000f3cc:	01312e23          	sw	s3,28(sp)
8000f3d0:	02112623          	sw	ra,44(sp)
8000f3d4:	02812423          	sw	s0,40(sp)
8000f3d8:	02912223          	sw	s1,36(sp)
8000f3dc:	03212023          	sw	s2,32(sp)
8000f3e0:	01412c23          	sw	s4,24(sp)
8000f3e4:	01512a23          	sw	s5,20(sp)
8000f3e8:	01612823          	sw	s6,16(sp)
8000f3ec:	01712623          	sw	s7,12(sp)
8000f3f0:	01812423          	sw	s8,8(sp)
8000f3f4:	00060993          	mv	s3,a2
8000f3f8:	12078663          	beqz	a5,8000f524 <__ssprint_r+0x160>
8000f3fc:	00062b03          	lw	s6,0(a2)
8000f400:	00050a93          	mv	s5,a0
8000f404:	00058413          	mv	s0,a1
8000f408:	00000b93          	li	s7,0
8000f40c:	00000913          	li	s2,0
8000f410:	08090663          	beqz	s2,8000f49c <__ssprint_r+0xd8>
8000f414:	00842a03          	lw	s4,8(s0)
8000f418:	0d496663          	bltu	s2,s4,8000f4e4 <__ssprint_r+0x120>
8000f41c:	00c45783          	lhu	a5,12(s0)
8000f420:	4807f713          	andi	a4,a5,1152
8000f424:	0c070063          	beqz	a4,8000f4e4 <__ssprint_r+0x120>
8000f428:	00042483          	lw	s1,0(s0)
8000f42c:	01442703          	lw	a4,20(s0)
8000f430:	01042583          	lw	a1,16(s0)
8000f434:	40b48c33          	sub	s8,s1,a1
8000f438:	00171493          	slli	s1,a4,0x1
8000f43c:	00e48733          	add	a4,s1,a4
8000f440:	01f75493          	srli	s1,a4,0x1f
8000f444:	00e484b3          	add	s1,s1,a4
8000f448:	001c0713          	addi	a4,s8,1
8000f44c:	4014d493          	srai	s1,s1,0x1
8000f450:	01270733          	add	a4,a4,s2
8000f454:	00e4f463          	bgeu	s1,a4,8000f45c <__ssprint_r+0x98>
8000f458:	00070493          	mv	s1,a4
8000f45c:	4007f793          	andi	a5,a5,1024
8000f460:	0e078e63          	beqz	a5,8000f55c <__ssprint_r+0x198>
8000f464:	00048593          	mv	a1,s1
8000f468:	000a8513          	mv	a0,s5
8000f46c:	ee5fe0ef          	jal	ra,8000e350 <_malloc_r>
8000f470:	00050a13          	mv	s4,a0
8000f474:	02051c63          	bnez	a0,8000f4ac <__ssprint_r+0xe8>
8000f478:	00c00793          	li	a5,12
8000f47c:	00faa023          	sw	a5,0(s5)
8000f480:	00c45783          	lhu	a5,12(s0)
8000f484:	fff00513          	li	a0,-1
8000f488:	0407e793          	ori	a5,a5,64
8000f48c:	00f41623          	sh	a5,12(s0)
8000f490:	0009a423          	sw	zero,8(s3) # 80000008 <_ram_heap_end+0xfffee008>
8000f494:	0009a223          	sw	zero,4(s3)
8000f498:	0940006f          	j	8000f52c <__ssprint_r+0x168>
8000f49c:	000b2b83          	lw	s7,0(s6)
8000f4a0:	004b2903          	lw	s2,4(s6)
8000f4a4:	008b0b13          	addi	s6,s6,8
8000f4a8:	f69ff06f          	j	8000f410 <__ssprint_r+0x4c>
8000f4ac:	01042583          	lw	a1,16(s0)
8000f4b0:	000c0613          	mv	a2,s8
8000f4b4:	c11fe0ef          	jal	ra,8000e0c4 <memcpy>
8000f4b8:	00c45783          	lhu	a5,12(s0)
8000f4bc:	b7f7f793          	andi	a5,a5,-1153
8000f4c0:	0807e793          	ori	a5,a5,128
8000f4c4:	00f41623          	sh	a5,12(s0)
8000f4c8:	01442823          	sw	s4,16(s0)
8000f4cc:	00942a23          	sw	s1,20(s0)
8000f4d0:	018a0a33          	add	s4,s4,s8
8000f4d4:	418484b3          	sub	s1,s1,s8
8000f4d8:	01442023          	sw	s4,0(s0)
8000f4dc:	00942423          	sw	s1,8(s0)
8000f4e0:	00090a13          	mv	s4,s2
8000f4e4:	01497463          	bgeu	s2,s4,8000f4ec <__ssprint_r+0x128>
8000f4e8:	00090a13          	mv	s4,s2
8000f4ec:	00042503          	lw	a0,0(s0)
8000f4f0:	000a0613          	mv	a2,s4
8000f4f4:	000b8593          	mv	a1,s7
8000f4f8:	ca5fe0ef          	jal	ra,8000e19c <memmove>
8000f4fc:	00842783          	lw	a5,8(s0)
8000f500:	414787b3          	sub	a5,a5,s4
8000f504:	00f42423          	sw	a5,8(s0)
8000f508:	00042783          	lw	a5,0(s0)
8000f50c:	01478a33          	add	s4,a5,s4
8000f510:	0089a783          	lw	a5,8(s3)
8000f514:	01442023          	sw	s4,0(s0)
8000f518:	41278933          	sub	s2,a5,s2
8000f51c:	0129a423          	sw	s2,8(s3)
8000f520:	f6091ee3          	bnez	s2,8000f49c <__ssprint_r+0xd8>
8000f524:	0009a223          	sw	zero,4(s3)
8000f528:	00000513          	li	a0,0
8000f52c:	02c12083          	lw	ra,44(sp)
8000f530:	02812403          	lw	s0,40(sp)
8000f534:	02412483          	lw	s1,36(sp)
8000f538:	02012903          	lw	s2,32(sp)
8000f53c:	01c12983          	lw	s3,28(sp)
8000f540:	01812a03          	lw	s4,24(sp)
8000f544:	01412a83          	lw	s5,20(sp)
8000f548:	01012b03          	lw	s6,16(sp)
8000f54c:	00c12b83          	lw	s7,12(sp)
8000f550:	00812c03          	lw	s8,8(sp)
8000f554:	03010113          	addi	sp,sp,48
8000f558:	00008067          	ret
8000f55c:	00048613          	mv	a2,s1
8000f560:	000a8513          	mv	a0,s5
8000f564:	534010ef          	jal	ra,80010a98 <_realloc_r>
8000f568:	00050a13          	mv	s4,a0
8000f56c:	f4051ee3          	bnez	a0,8000f4c8 <__ssprint_r+0x104>
8000f570:	01042583          	lw	a1,16(s0)
8000f574:	000a8513          	mv	a0,s5
8000f578:	cd5fe0ef          	jal	ra,8000e24c <_free_r>
8000f57c:	efdff06f          	j	8000f478 <__ssprint_r+0xb4>

Disassembly of section .text._svfprintf_r:

8000f580 <_svfiprintf_r>:
8000f580:	00c5d783          	lhu	a5,12(a1)
8000f584:	f5010113          	addi	sp,sp,-176
8000f588:	0a912223          	sw	s1,164(sp)
8000f58c:	0b212023          	sw	s2,160(sp)
8000f590:	09312e23          	sw	s3,156(sp)
8000f594:	0a112623          	sw	ra,172(sp)
8000f598:	0a812423          	sw	s0,168(sp)
8000f59c:	09412c23          	sw	s4,152(sp)
8000f5a0:	09512a23          	sw	s5,148(sp)
8000f5a4:	09612823          	sw	s6,144(sp)
8000f5a8:	09712623          	sw	s7,140(sp)
8000f5ac:	09812423          	sw	s8,136(sp)
8000f5b0:	09912223          	sw	s9,132(sp)
8000f5b4:	0807f793          	andi	a5,a5,128
8000f5b8:	00050993          	mv	s3,a0
8000f5bc:	00058913          	mv	s2,a1
8000f5c0:	00060493          	mv	s1,a2
8000f5c4:	06078863          	beqz	a5,8000f634 <_svfiprintf_r+0xb4>
8000f5c8:	0105a783          	lw	a5,16(a1)
8000f5cc:	06079463          	bnez	a5,8000f634 <_svfiprintf_r+0xb4>
8000f5d0:	04000593          	li	a1,64
8000f5d4:	00d12623          	sw	a3,12(sp)
8000f5d8:	d79fe0ef          	jal	ra,8000e350 <_malloc_r>
8000f5dc:	00a92023          	sw	a0,0(s2)
8000f5e0:	00a92823          	sw	a0,16(s2)
8000f5e4:	00c12683          	lw	a3,12(sp)
8000f5e8:	04051263          	bnez	a0,8000f62c <_svfiprintf_r+0xac>
8000f5ec:	00c00793          	li	a5,12
8000f5f0:	00f9a023          	sw	a5,0(s3)
8000f5f4:	fff00513          	li	a0,-1
8000f5f8:	0ac12083          	lw	ra,172(sp)
8000f5fc:	0a812403          	lw	s0,168(sp)
8000f600:	0a412483          	lw	s1,164(sp)
8000f604:	0a012903          	lw	s2,160(sp)
8000f608:	09c12983          	lw	s3,156(sp)
8000f60c:	09812a03          	lw	s4,152(sp)
8000f610:	09412a83          	lw	s5,148(sp)
8000f614:	09012b03          	lw	s6,144(sp)
8000f618:	08c12b83          	lw	s7,140(sp)
8000f61c:	08812c03          	lw	s8,136(sp)
8000f620:	08412c83          	lw	s9,132(sp)
8000f624:	0b010113          	addi	sp,sp,176
8000f628:	00008067          	ret
8000f62c:	04000793          	li	a5,64
8000f630:	00f92a23          	sw	a5,20(s2)
8000f634:	02000793          	li	a5,32
8000f638:	02f10ca3          	sb	a5,57(sp)
8000f63c:	03000793          	li	a5,48
8000f640:	02012a23          	sw	zero,52(sp)
8000f644:	02f10d23          	sb	a5,58(sp)
8000f648:	00d12e23          	sw	a3,28(sp)
8000f64c:	02500b13          	li	s6,37
8000f650:	ffff3a97          	auipc	s5,0xffff3
8000f654:	780a8a93          	addi	s5,s5,1920 # 80002dd0 <__sf_fake_stdout+0x20>
8000f658:	00100b93          	li	s7,1
8000f65c:	7fff1c17          	auipc	s8,0x7fff1
8000f660:	9a4c0c13          	addi	s8,s8,-1628 # 0 <_ram_heap_end+0x7ffee000>
8000f664:	00048413          	mv	s0,s1
8000f668:	00044783          	lbu	a5,0(s0)
8000f66c:	00078463          	beqz	a5,8000f674 <_svfiprintf_r+0xf4>
8000f670:	0d679663          	bne	a5,s6,8000f73c <_svfiprintf_r+0x1bc>
8000f674:	40940cb3          	sub	s9,s0,s1
8000f678:	020c8663          	beqz	s9,8000f6a4 <_svfiprintf_r+0x124>
8000f67c:	000c8693          	mv	a3,s9
8000f680:	00048613          	mv	a2,s1
8000f684:	00090593          	mv	a1,s2
8000f688:	00098513          	mv	a0,s3
8000f68c:	bcdff0ef          	jal	ra,8000f258 <__ssputs_r>
8000f690:	fff00793          	li	a5,-1
8000f694:	24f50e63          	beq	a0,a5,8000f8f0 <_svfiprintf_r+0x370>
8000f698:	03412683          	lw	a3,52(sp)
8000f69c:	019686b3          	add	a3,a3,s9
8000f6a0:	02d12a23          	sw	a3,52(sp)
8000f6a4:	00044783          	lbu	a5,0(s0)
8000f6a8:	24078463          	beqz	a5,8000f8f0 <_svfiprintf_r+0x370>
8000f6ac:	fff00793          	li	a5,-1
8000f6b0:	00140493          	addi	s1,s0,1
8000f6b4:	02012023          	sw	zero,32(sp)
8000f6b8:	02012623          	sw	zero,44(sp)
8000f6bc:	02f12223          	sw	a5,36(sp)
8000f6c0:	02012423          	sw	zero,40(sp)
8000f6c4:	060101a3          	sb	zero,99(sp)
8000f6c8:	06012c23          	sw	zero,120(sp)
8000f6cc:	0004c583          	lbu	a1,0(s1)
8000f6d0:	00500613          	li	a2,5
8000f6d4:	000a8513          	mv	a0,s5
8000f6d8:	39c010ef          	jal	ra,80010a74 <memchr>
8000f6dc:	00148413          	addi	s0,s1,1
8000f6e0:	02012783          	lw	a5,32(sp)
8000f6e4:	06051063          	bnez	a0,8000f744 <_svfiprintf_r+0x1c4>
8000f6e8:	0107f713          	andi	a4,a5,16
8000f6ec:	00070663          	beqz	a4,8000f6f8 <_svfiprintf_r+0x178>
8000f6f0:	02000713          	li	a4,32
8000f6f4:	06e101a3          	sb	a4,99(sp)
8000f6f8:	0087f713          	andi	a4,a5,8
8000f6fc:	00070663          	beqz	a4,8000f708 <_svfiprintf_r+0x188>
8000f700:	02b00713          	li	a4,43
8000f704:	06e101a3          	sb	a4,99(sp)
8000f708:	0004c683          	lbu	a3,0(s1)
8000f70c:	02a00713          	li	a4,42
8000f710:	04e68663          	beq	a3,a4,8000f75c <_svfiprintf_r+0x1dc>
8000f714:	02c12703          	lw	a4,44(sp)
8000f718:	00048413          	mv	s0,s1
8000f71c:	00000793          	li	a5,0
8000f720:	00900613          	li	a2,9
8000f724:	00044683          	lbu	a3,0(s0)
8000f728:	00140593          	addi	a1,s0,1
8000f72c:	fd068693          	addi	a3,a3,-48
8000f730:	10d67a63          	bgeu	a2,a3,8000f844 <_svfiprintf_r+0x2c4>
8000f734:	02079e63          	bnez	a5,8000f770 <_svfiprintf_r+0x1f0>
8000f738:	0500006f          	j	8000f788 <_svfiprintf_r+0x208>
8000f73c:	00140413          	addi	s0,s0,1
8000f740:	f29ff06f          	j	8000f668 <_svfiprintf_r+0xe8>
8000f744:	41550533          	sub	a0,a0,s5
8000f748:	00ab9533          	sll	a0,s7,a0
8000f74c:	00a7e7b3          	or	a5,a5,a0
8000f750:	02f12023          	sw	a5,32(sp)
8000f754:	00040493          	mv	s1,s0
8000f758:	f75ff06f          	j	8000f6cc <_svfiprintf_r+0x14c>
8000f75c:	01c12703          	lw	a4,28(sp)
8000f760:	00470693          	addi	a3,a4,4 # ffffe004 <_ram_heap_end+0x7ffec004>
8000f764:	00072703          	lw	a4,0(a4)
8000f768:	00d12e23          	sw	a3,28(sp)
8000f76c:	00074663          	bltz	a4,8000f778 <_svfiprintf_r+0x1f8>
8000f770:	02e12623          	sw	a4,44(sp)
8000f774:	0140006f          	j	8000f788 <_svfiprintf_r+0x208>
8000f778:	40e00733          	neg	a4,a4
8000f77c:	0027e793          	ori	a5,a5,2
8000f780:	02e12623          	sw	a4,44(sp)
8000f784:	02f12023          	sw	a5,32(sp)
8000f788:	00044703          	lbu	a4,0(s0)
8000f78c:	02e00793          	li	a5,46
8000f790:	02f71663          	bne	a4,a5,8000f7bc <_svfiprintf_r+0x23c>
8000f794:	00144703          	lbu	a4,1(s0)
8000f798:	02a00793          	li	a5,42
8000f79c:	0cf71663          	bne	a4,a5,8000f868 <_svfiprintf_r+0x2e8>
8000f7a0:	01c12783          	lw	a5,28(sp)
8000f7a4:	00240413          	addi	s0,s0,2
8000f7a8:	00478713          	addi	a4,a5,4
8000f7ac:	0007a783          	lw	a5,0(a5)
8000f7b0:	00e12e23          	sw	a4,28(sp)
8000f7b4:	0a07c663          	bltz	a5,8000f860 <_svfiprintf_r+0x2e0>
8000f7b8:	02f12223          	sw	a5,36(sp)
8000f7bc:	00044583          	lbu	a1,0(s0)
8000f7c0:	00300613          	li	a2,3
8000f7c4:	ffff3517          	auipc	a0,0xffff3
8000f7c8:	61450513          	addi	a0,a0,1556 # 80002dd8 <__sf_fake_stdout+0x28>
8000f7cc:	2a8010ef          	jal	ra,80010a74 <memchr>
8000f7d0:	02050463          	beqz	a0,8000f7f8 <_svfiprintf_r+0x278>
8000f7d4:	ffff3797          	auipc	a5,0xffff3
8000f7d8:	60478793          	addi	a5,a5,1540 # 80002dd8 <__sf_fake_stdout+0x28>
8000f7dc:	40f50533          	sub	a0,a0,a5
8000f7e0:	04000793          	li	a5,64
8000f7e4:	00a797b3          	sll	a5,a5,a0
8000f7e8:	02012503          	lw	a0,32(sp)
8000f7ec:	00140413          	addi	s0,s0,1
8000f7f0:	00f56533          	or	a0,a0,a5
8000f7f4:	02a12023          	sw	a0,32(sp)
8000f7f8:	00044583          	lbu	a1,0(s0)
8000f7fc:	00600613          	li	a2,6
8000f800:	ffff3517          	auipc	a0,0xffff3
8000f804:	5dc50513          	addi	a0,a0,1500 # 80002ddc <__sf_fake_stdout+0x2c>
8000f808:	00140493          	addi	s1,s0,1
8000f80c:	02b10c23          	sb	a1,56(sp)
8000f810:	264010ef          	jal	ra,80010a74 <memchr>
8000f814:	0e050a63          	beqz	a0,8000f908 <_svfiprintf_r+0x388>
8000f818:	0a0c1663          	bnez	s8,8000f8c4 <_svfiprintf_r+0x344>
8000f81c:	02012703          	lw	a4,32(sp)
8000f820:	01c12783          	lw	a5,28(sp)
8000f824:	10077713          	andi	a4,a4,256
8000f828:	08070663          	beqz	a4,8000f8b4 <_svfiprintf_r+0x334>
8000f82c:	00478793          	addi	a5,a5,4
8000f830:	00f12e23          	sw	a5,28(sp)
8000f834:	03412783          	lw	a5,52(sp)
8000f838:	014787b3          	add	a5,a5,s4
8000f83c:	02f12a23          	sw	a5,52(sp)
8000f840:	e25ff06f          	j	8000f664 <_svfiprintf_r+0xe4>
8000f844:	00271793          	slli	a5,a4,0x2
8000f848:	00e787b3          	add	a5,a5,a4
8000f84c:	00179793          	slli	a5,a5,0x1
8000f850:	00d78733          	add	a4,a5,a3
8000f854:	00058413          	mv	s0,a1
8000f858:	00100793          	li	a5,1
8000f85c:	ec9ff06f          	j	8000f724 <_svfiprintf_r+0x1a4>
8000f860:	fff00793          	li	a5,-1
8000f864:	f55ff06f          	j	8000f7b8 <_svfiprintf_r+0x238>
8000f868:	00140413          	addi	s0,s0,1
8000f86c:	02012223          	sw	zero,36(sp)
8000f870:	00000793          	li	a5,0
8000f874:	00000713          	li	a4,0
8000f878:	00900613          	li	a2,9
8000f87c:	00044683          	lbu	a3,0(s0)
8000f880:	00140593          	addi	a1,s0,1
8000f884:	fd068693          	addi	a3,a3,-48
8000f888:	00d67863          	bgeu	a2,a3,8000f898 <_svfiprintf_r+0x318>
8000f88c:	f20788e3          	beqz	a5,8000f7bc <_svfiprintf_r+0x23c>
8000f890:	02e12223          	sw	a4,36(sp)
8000f894:	f29ff06f          	j	8000f7bc <_svfiprintf_r+0x23c>
8000f898:	00271793          	slli	a5,a4,0x2
8000f89c:	00e787b3          	add	a5,a5,a4
8000f8a0:	00179793          	slli	a5,a5,0x1
8000f8a4:	00d78733          	add	a4,a5,a3
8000f8a8:	00058413          	mv	s0,a1
8000f8ac:	00100793          	li	a5,1
8000f8b0:	fcdff06f          	j	8000f87c <_svfiprintf_r+0x2fc>
8000f8b4:	00778793          	addi	a5,a5,7
8000f8b8:	ff87f793          	andi	a5,a5,-8
8000f8bc:	00878793          	addi	a5,a5,8
8000f8c0:	f71ff06f          	j	8000f830 <_svfiprintf_r+0x2b0>
8000f8c4:	01c10713          	addi	a4,sp,28
8000f8c8:	00000697          	auipc	a3,0x0
8000f8cc:	99068693          	addi	a3,a3,-1648 # 8000f258 <__ssputs_r>
8000f8d0:	00090613          	mv	a2,s2
8000f8d4:	02010593          	addi	a1,sp,32
8000f8d8:	00098513          	mv	a0,s3
8000f8dc:	00000097          	auipc	ra,0x0
8000f8e0:	000000e7          	jalr	zero # 0 <_ram_heap_size>
8000f8e4:	fff00793          	li	a5,-1
8000f8e8:	00050a13          	mv	s4,a0
8000f8ec:	f4f514e3          	bne	a0,a5,8000f834 <_svfiprintf_r+0x2b4>
8000f8f0:	00c95783          	lhu	a5,12(s2)
8000f8f4:	fff00513          	li	a0,-1
8000f8f8:	0407f793          	andi	a5,a5,64
8000f8fc:	ce079ee3          	bnez	a5,8000f5f8 <_svfiprintf_r+0x78>
8000f900:	03412503          	lw	a0,52(sp)
8000f904:	cf5ff06f          	j	8000f5f8 <_svfiprintf_r+0x78>
8000f908:	01c10713          	addi	a4,sp,28
8000f90c:	00000697          	auipc	a3,0x0
8000f910:	94c68693          	addi	a3,a3,-1716 # 8000f258 <__ssputs_r>
8000f914:	00090613          	mv	a2,s2
8000f918:	02010593          	addi	a1,sp,32
8000f91c:	00098513          	mv	a0,s3
8000f920:	1b8000ef          	jal	ra,8000fad8 <_printf_i>
8000f924:	fc1ff06f          	j	8000f8e4 <_svfiprintf_r+0x364>

Disassembly of section .text._printf_common:

8000f928 <_printf_common>:
8000f928:	fd010113          	addi	sp,sp,-48
8000f92c:	01512a23          	sw	s5,20(sp)
8000f930:	0105a783          	lw	a5,16(a1)
8000f934:	00070a93          	mv	s5,a4
8000f938:	0085a703          	lw	a4,8(a1)
8000f93c:	02812423          	sw	s0,40(sp)
8000f940:	02912223          	sw	s1,36(sp)
8000f944:	01312e23          	sw	s3,28(sp)
8000f948:	01412c23          	sw	s4,24(sp)
8000f94c:	02112623          	sw	ra,44(sp)
8000f950:	03212023          	sw	s2,32(sp)
8000f954:	01612823          	sw	s6,16(sp)
8000f958:	01712623          	sw	s7,12(sp)
8000f95c:	00050993          	mv	s3,a0
8000f960:	00058413          	mv	s0,a1
8000f964:	00060493          	mv	s1,a2
8000f968:	00068a13          	mv	s4,a3
8000f96c:	00e7d463          	bge	a5,a4,8000f974 <_printf_common+0x4c>
8000f970:	00070793          	mv	a5,a4
8000f974:	00f4a023          	sw	a5,0(s1)
8000f978:	04344703          	lbu	a4,67(s0)
8000f97c:	00070663          	beqz	a4,8000f988 <_printf_common+0x60>
8000f980:	00178793          	addi	a5,a5,1
8000f984:	00f4a023          	sw	a5,0(s1)
8000f988:	00042783          	lw	a5,0(s0)
8000f98c:	0207f793          	andi	a5,a5,32
8000f990:	00078863          	beqz	a5,8000f9a0 <_printf_common+0x78>
8000f994:	0004a783          	lw	a5,0(s1)
8000f998:	00278793          	addi	a5,a5,2
8000f99c:	00f4a023          	sw	a5,0(s1)
8000f9a0:	00042903          	lw	s2,0(s0)
8000f9a4:	00697913          	andi	s2,s2,6
8000f9a8:	00091e63          	bnez	s2,8000f9c4 <_printf_common+0x9c>
8000f9ac:	01940b13          	addi	s6,s0,25
8000f9b0:	fff00b93          	li	s7,-1
8000f9b4:	00c42783          	lw	a5,12(s0)
8000f9b8:	0004a703          	lw	a4,0(s1)
8000f9bc:	40e787b3          	sub	a5,a5,a4
8000f9c0:	08f94263          	blt	s2,a5,8000fa44 <_printf_common+0x11c>
8000f9c4:	00042783          	lw	a5,0(s0)
8000f9c8:	04344683          	lbu	a3,67(s0)
8000f9cc:	0207f793          	andi	a5,a5,32
8000f9d0:	00d036b3          	snez	a3,a3
8000f9d4:	0c079063          	bnez	a5,8000fa94 <_printf_common+0x16c>
8000f9d8:	04340613          	addi	a2,s0,67
8000f9dc:	000a0593          	mv	a1,s4
8000f9e0:	00098513          	mv	a0,s3
8000f9e4:	000a80e7          	jalr	s5
8000f9e8:	fff00793          	li	a5,-1
8000f9ec:	06f50863          	beq	a0,a5,8000fa5c <_printf_common+0x134>
8000f9f0:	00042783          	lw	a5,0(s0)
8000f9f4:	00400613          	li	a2,4
8000f9f8:	0004a703          	lw	a4,0(s1)
8000f9fc:	0067f793          	andi	a5,a5,6
8000fa00:	00c42683          	lw	a3,12(s0)
8000fa04:	00000493          	li	s1,0
8000fa08:	00c79863          	bne	a5,a2,8000fa18 <_printf_common+0xf0>
8000fa0c:	40e684b3          	sub	s1,a3,a4
8000fa10:	0004d463          	bgez	s1,8000fa18 <_printf_common+0xf0>
8000fa14:	00000493          	li	s1,0
8000fa18:	00842783          	lw	a5,8(s0)
8000fa1c:	01042703          	lw	a4,16(s0)
8000fa20:	00f75663          	bge	a4,a5,8000fa2c <_printf_common+0x104>
8000fa24:	40e787b3          	sub	a5,a5,a4
8000fa28:	00f484b3          	add	s1,s1,a5
8000fa2c:	00000913          	li	s2,0
8000fa30:	01a40413          	addi	s0,s0,26
8000fa34:	fff00b13          	li	s6,-1
8000fa38:	09249063          	bne	s1,s2,8000fab8 <_printf_common+0x190>
8000fa3c:	00000513          	li	a0,0
8000fa40:	0200006f          	j	8000fa60 <_printf_common+0x138>
8000fa44:	00100693          	li	a3,1
8000fa48:	000b0613          	mv	a2,s6
8000fa4c:	000a0593          	mv	a1,s4
8000fa50:	00098513          	mv	a0,s3
8000fa54:	000a80e7          	jalr	s5
8000fa58:	03751a63          	bne	a0,s7,8000fa8c <_printf_common+0x164>
8000fa5c:	fff00513          	li	a0,-1
8000fa60:	02c12083          	lw	ra,44(sp)
8000fa64:	02812403          	lw	s0,40(sp)
8000fa68:	02412483          	lw	s1,36(sp)
8000fa6c:	02012903          	lw	s2,32(sp)
8000fa70:	01c12983          	lw	s3,28(sp)
8000fa74:	01812a03          	lw	s4,24(sp)
8000fa78:	01412a83          	lw	s5,20(sp)
8000fa7c:	01012b03          	lw	s6,16(sp)
8000fa80:	00c12b83          	lw	s7,12(sp)
8000fa84:	03010113          	addi	sp,sp,48
8000fa88:	00008067          	ret
8000fa8c:	00190913          	addi	s2,s2,1
8000fa90:	f25ff06f          	j	8000f9b4 <_printf_common+0x8c>
8000fa94:	00d40733          	add	a4,s0,a3
8000fa98:	03000613          	li	a2,48
8000fa9c:	04c701a3          	sb	a2,67(a4)
8000faa0:	04544703          	lbu	a4,69(s0)
8000faa4:	00168793          	addi	a5,a3,1
8000faa8:	00f407b3          	add	a5,s0,a5
8000faac:	00268693          	addi	a3,a3,2
8000fab0:	04e781a3          	sb	a4,67(a5)
8000fab4:	f25ff06f          	j	8000f9d8 <_printf_common+0xb0>
8000fab8:	00100693          	li	a3,1
8000fabc:	00040613          	mv	a2,s0
8000fac0:	000a0593          	mv	a1,s4
8000fac4:	00098513          	mv	a0,s3
8000fac8:	000a80e7          	jalr	s5
8000facc:	f96508e3          	beq	a0,s6,8000fa5c <_printf_common+0x134>
8000fad0:	00190913          	addi	s2,s2,1
8000fad4:	f65ff06f          	j	8000fa38 <_printf_common+0x110>

Disassembly of section .text._printf_i:

8000fad8 <_printf_i>:
8000fad8:	fc010113          	addi	sp,sp,-64
8000fadc:	02812c23          	sw	s0,56(sp)
8000fae0:	03312623          	sw	s3,44(sp)
8000fae4:	03512223          	sw	s5,36(sp)
8000fae8:	03612023          	sw	s6,32(sp)
8000faec:	01712e23          	sw	s7,28(sp)
8000faf0:	02112e23          	sw	ra,60(sp)
8000faf4:	02912a23          	sw	s1,52(sp)
8000faf8:	03212823          	sw	s2,48(sp)
8000fafc:	03412423          	sw	s4,40(sp)
8000fb00:	01812c23          	sw	s8,24(sp)
8000fb04:	0185c783          	lbu	a5,24(a1)
8000fb08:	00068b93          	mv	s7,a3
8000fb0c:	06e00693          	li	a3,110
8000fb10:	00050a93          	mv	s5,a0
8000fb14:	00058413          	mv	s0,a1
8000fb18:	00060b13          	mv	s6,a2
8000fb1c:	04358993          	addi	s3,a1,67
8000fb20:	28d78c63          	beq	a5,a3,8000fdb8 <_printf_i+0x2e0>
8000fb24:	06f6e863          	bltu	a3,a5,8000fb94 <_printf_i+0xbc>
8000fb28:	06300693          	li	a3,99
8000fb2c:	0ad78c63          	beq	a5,a3,8000fbe4 <_printf_i+0x10c>
8000fb30:	00f6ec63          	bltu	a3,a5,8000fb48 <_printf_i+0x70>
8000fb34:	2c078063          	beqz	a5,8000fdf4 <_printf_i+0x31c>
8000fb38:	05800693          	li	a3,88
8000fb3c:	12d78863          	beq	a5,a3,8000fc6c <_printf_i+0x194>
8000fb40:	04240c13          	addi	s8,s0,66
8000fb44:	0b40006f          	j	8000fbf8 <_printf_i+0x120>
8000fb48:	06400693          	li	a3,100
8000fb4c:	00d78663          	beq	a5,a3,8000fb58 <_printf_i+0x80>
8000fb50:	06900693          	li	a3,105
8000fb54:	fed796e3          	bne	a5,a3,8000fb40 <_printf_i+0x68>
8000fb58:	00042783          	lw	a5,0(s0)
8000fb5c:	00072603          	lw	a2,0(a4)
8000fb60:	0807f593          	andi	a1,a5,128
8000fb64:	00460693          	addi	a3,a2,4
8000fb68:	08058e63          	beqz	a1,8000fc04 <_printf_i+0x12c>
8000fb6c:	00062483          	lw	s1,0(a2)
8000fb70:	00d72023          	sw	a3,0(a4)
8000fb74:	0004d863          	bgez	s1,8000fb84 <_printf_i+0xac>
8000fb78:	02d00793          	li	a5,45
8000fb7c:	409004b3          	neg	s1,s1
8000fb80:	04f401a3          	sb	a5,67(s0)
8000fb84:	ffff3a17          	auipc	s4,0xffff3
8000fb88:	260a0a13          	addi	s4,s4,608 # 80002de4 <__sf_fake_stdout+0x34>
8000fb8c:	00a00913          	li	s2,10
8000fb90:	12c0006f          	j	8000fcbc <_printf_i+0x1e4>
8000fb94:	07300693          	li	a3,115
8000fb98:	26d78463          	beq	a5,a3,8000fe00 <_printf_i+0x328>
8000fb9c:	02f6e263          	bltu	a3,a5,8000fbc0 <_printf_i+0xe8>
8000fba0:	06f00693          	li	a3,111
8000fba4:	06d78e63          	beq	a5,a3,8000fc20 <_printf_i+0x148>
8000fba8:	07000693          	li	a3,112
8000fbac:	f8d79ae3          	bne	a5,a3,8000fb40 <_printf_i+0x68>
8000fbb0:	0005a783          	lw	a5,0(a1)
8000fbb4:	0207e793          	ori	a5,a5,32
8000fbb8:	00f5a023          	sw	a5,0(a1)
8000fbbc:	0140006f          	j	8000fbd0 <_printf_i+0xf8>
8000fbc0:	07500693          	li	a3,117
8000fbc4:	04d78e63          	beq	a5,a3,8000fc20 <_printf_i+0x148>
8000fbc8:	07800693          	li	a3,120
8000fbcc:	f6d79ae3          	bne	a5,a3,8000fb40 <_printf_i+0x68>
8000fbd0:	07800793          	li	a5,120
8000fbd4:	04f402a3          	sb	a5,69(s0)
8000fbd8:	ffff3a17          	auipc	s4,0xffff3
8000fbdc:	220a0a13          	addi	s4,s4,544 # 80002df8 <__sf_fake_stdout+0x48>
8000fbe0:	0980006f          	j	8000fc78 <_printf_i+0x1a0>
8000fbe4:	00072783          	lw	a5,0(a4)
8000fbe8:	04258c13          	addi	s8,a1,66
8000fbec:	00478693          	addi	a3,a5,4
8000fbf0:	0007a783          	lw	a5,0(a5)
8000fbf4:	00d72023          	sw	a3,0(a4)
8000fbf8:	04f40123          	sb	a5,66(s0)
8000fbfc:	00100793          	li	a5,1
8000fc00:	2300006f          	j	8000fe30 <_printf_i+0x358>
8000fc04:	00062483          	lw	s1,0(a2)
8000fc08:	0407f793          	andi	a5,a5,64
8000fc0c:	00d72023          	sw	a3,0(a4)
8000fc10:	f60782e3          	beqz	a5,8000fb74 <_printf_i+0x9c>
8000fc14:	01049493          	slli	s1,s1,0x10
8000fc18:	4104d493          	srai	s1,s1,0x10
8000fc1c:	f59ff06f          	j	8000fb74 <_printf_i+0x9c>
8000fc20:	00042603          	lw	a2,0(s0)
8000fc24:	00072683          	lw	a3,0(a4)
8000fc28:	08067513          	andi	a0,a2,128
8000fc2c:	00468593          	addi	a1,a3,4
8000fc30:	00050863          	beqz	a0,8000fc40 <_printf_i+0x168>
8000fc34:	00b72023          	sw	a1,0(a4)
8000fc38:	0006a483          	lw	s1,0(a3)
8000fc3c:	0140006f          	j	8000fc50 <_printf_i+0x178>
8000fc40:	04067613          	andi	a2,a2,64
8000fc44:	00b72023          	sw	a1,0(a4)
8000fc48:	fe0608e3          	beqz	a2,8000fc38 <_printf_i+0x160>
8000fc4c:	0006d483          	lhu	s1,0(a3)
8000fc50:	06f00713          	li	a4,111
8000fc54:	ffff3a17          	auipc	s4,0xffff3
8000fc58:	190a0a13          	addi	s4,s4,400 # 80002de4 <__sf_fake_stdout+0x34>
8000fc5c:	00a00913          	li	s2,10
8000fc60:	04e79c63          	bne	a5,a4,8000fcb8 <_printf_i+0x1e0>
8000fc64:	00800913          	li	s2,8
8000fc68:	0500006f          	j	8000fcb8 <_printf_i+0x1e0>
8000fc6c:	04f582a3          	sb	a5,69(a1)
8000fc70:	ffff3a17          	auipc	s4,0xffff3
8000fc74:	174a0a13          	addi	s4,s4,372 # 80002de4 <__sf_fake_stdout+0x34>
8000fc78:	00042783          	lw	a5,0(s0)
8000fc7c:	00072683          	lw	a3,0(a4)
8000fc80:	0807f613          	andi	a2,a5,128
8000fc84:	0006a483          	lw	s1,0(a3)
8000fc88:	00468693          	addi	a3,a3,4
8000fc8c:	10060663          	beqz	a2,8000fd98 <_printf_i+0x2c0>
8000fc90:	00d72023          	sw	a3,0(a4)
8000fc94:	0017f713          	andi	a4,a5,1
8000fc98:	00070663          	beqz	a4,8000fca4 <_printf_i+0x1cc>
8000fc9c:	0207e793          	ori	a5,a5,32
8000fca0:	00f42023          	sw	a5,0(s0)
8000fca4:	01000913          	li	s2,16
8000fca8:	00049863          	bnez	s1,8000fcb8 <_printf_i+0x1e0>
8000fcac:	00042783          	lw	a5,0(s0)
8000fcb0:	fdf7f793          	andi	a5,a5,-33
8000fcb4:	00f42023          	sw	a5,0(s0)
8000fcb8:	040401a3          	sb	zero,67(s0)
8000fcbc:	00442783          	lw	a5,4(s0)
8000fcc0:	00f42423          	sw	a5,8(s0)
8000fcc4:	0007c863          	bltz	a5,8000fcd4 <_printf_i+0x1fc>
8000fcc8:	00042703          	lw	a4,0(s0)
8000fccc:	ffb77713          	andi	a4,a4,-5
8000fcd0:	00e42023          	sw	a4,0(s0)
8000fcd4:	00049663          	bnez	s1,8000fce0 <_printf_i+0x208>
8000fcd8:	00098c13          	mv	s8,s3
8000fcdc:	02078a63          	beqz	a5,8000fd10 <_printf_i+0x238>
8000fce0:	00098c13          	mv	s8,s3
8000fce4:	00090593          	mv	a1,s2
8000fce8:	00048513          	mv	a0,s1
8000fcec:	da4fd0ef          	jal	ra,8000d290 <__umodsi3>
8000fcf0:	00aa0533          	add	a0,s4,a0
8000fcf4:	00054783          	lbu	a5,0(a0)
8000fcf8:	fffc0c13          	addi	s8,s8,-1
8000fcfc:	00090593          	mv	a1,s2
8000fd00:	00fc0023          	sb	a5,0(s8)
8000fd04:	00048513          	mv	a0,s1
8000fd08:	d40fd0ef          	jal	ra,8000d248 <__udivsi3>
8000fd0c:	0b24f263          	bgeu	s1,s2,8000fdb0 <_printf_i+0x2d8>
8000fd10:	00800793          	li	a5,8
8000fd14:	02f91463          	bne	s2,a5,8000fd3c <_printf_i+0x264>
8000fd18:	00042783          	lw	a5,0(s0)
8000fd1c:	0017f793          	andi	a5,a5,1
8000fd20:	00078e63          	beqz	a5,8000fd3c <_printf_i+0x264>
8000fd24:	00442703          	lw	a4,4(s0)
8000fd28:	01042783          	lw	a5,16(s0)
8000fd2c:	00e7c863          	blt	a5,a4,8000fd3c <_printf_i+0x264>
8000fd30:	03000793          	li	a5,48
8000fd34:	fefc0fa3          	sb	a5,-1(s8)
8000fd38:	fffc0c13          	addi	s8,s8,-1
8000fd3c:	418989b3          	sub	s3,s3,s8
8000fd40:	01342823          	sw	s3,16(s0)
8000fd44:	000b8713          	mv	a4,s7
8000fd48:	000b0693          	mv	a3,s6
8000fd4c:	00c10613          	addi	a2,sp,12
8000fd50:	00040593          	mv	a1,s0
8000fd54:	000a8513          	mv	a0,s5
8000fd58:	bd1ff0ef          	jal	ra,8000f928 <_printf_common>
8000fd5c:	fff00493          	li	s1,-1
8000fd60:	0c951e63          	bne	a0,s1,8000fe3c <_printf_i+0x364>
8000fd64:	fff00513          	li	a0,-1
8000fd68:	03c12083          	lw	ra,60(sp)
8000fd6c:	03812403          	lw	s0,56(sp)
8000fd70:	03412483          	lw	s1,52(sp)
8000fd74:	03012903          	lw	s2,48(sp)
8000fd78:	02c12983          	lw	s3,44(sp)
8000fd7c:	02812a03          	lw	s4,40(sp)
8000fd80:	02412a83          	lw	s5,36(sp)
8000fd84:	02012b03          	lw	s6,32(sp)
8000fd88:	01c12b83          	lw	s7,28(sp)
8000fd8c:	01812c03          	lw	s8,24(sp)
8000fd90:	04010113          	addi	sp,sp,64
8000fd94:	00008067          	ret
8000fd98:	0407f613          	andi	a2,a5,64
8000fd9c:	00d72023          	sw	a3,0(a4)
8000fda0:	ee060ae3          	beqz	a2,8000fc94 <_printf_i+0x1bc>
8000fda4:	01049493          	slli	s1,s1,0x10
8000fda8:	0104d493          	srli	s1,s1,0x10
8000fdac:	ee9ff06f          	j	8000fc94 <_printf_i+0x1bc>
8000fdb0:	00050493          	mv	s1,a0
8000fdb4:	f31ff06f          	j	8000fce4 <_printf_i+0x20c>
8000fdb8:	0005a683          	lw	a3,0(a1)
8000fdbc:	00072783          	lw	a5,0(a4)
8000fdc0:	0145a603          	lw	a2,20(a1)
8000fdc4:	0806f513          	andi	a0,a3,128
8000fdc8:	00478593          	addi	a1,a5,4
8000fdcc:	00050a63          	beqz	a0,8000fde0 <_printf_i+0x308>
8000fdd0:	00b72023          	sw	a1,0(a4)
8000fdd4:	0007a783          	lw	a5,0(a5)
8000fdd8:	00c7a023          	sw	a2,0(a5)
8000fddc:	0180006f          	j	8000fdf4 <_printf_i+0x31c>
8000fde0:	00b72023          	sw	a1,0(a4)
8000fde4:	0406f693          	andi	a3,a3,64
8000fde8:	0007a783          	lw	a5,0(a5)
8000fdec:	fe0686e3          	beqz	a3,8000fdd8 <_printf_i+0x300>
8000fdf0:	00c79023          	sh	a2,0(a5)
8000fdf4:	00042823          	sw	zero,16(s0)
8000fdf8:	00098c13          	mv	s8,s3
8000fdfc:	f49ff06f          	j	8000fd44 <_printf_i+0x26c>
8000fe00:	00072783          	lw	a5,0(a4)
8000fe04:	0045a603          	lw	a2,4(a1)
8000fe08:	00000593          	li	a1,0
8000fe0c:	00478693          	addi	a3,a5,4
8000fe10:	00d72023          	sw	a3,0(a4)
8000fe14:	0007ac03          	lw	s8,0(a5)
8000fe18:	000c0513          	mv	a0,s8
8000fe1c:	459000ef          	jal	ra,80010a74 <memchr>
8000fe20:	00050663          	beqz	a0,8000fe2c <_printf_i+0x354>
8000fe24:	41850533          	sub	a0,a0,s8
8000fe28:	00a42223          	sw	a0,4(s0)
8000fe2c:	00442783          	lw	a5,4(s0)
8000fe30:	00f42823          	sw	a5,16(s0)
8000fe34:	040401a3          	sb	zero,67(s0)
8000fe38:	f0dff06f          	j	8000fd44 <_printf_i+0x26c>
8000fe3c:	01042683          	lw	a3,16(s0)
8000fe40:	000c0613          	mv	a2,s8
8000fe44:	000b0593          	mv	a1,s6
8000fe48:	000a8513          	mv	a0,s5
8000fe4c:	000b80e7          	jalr	s7
8000fe50:	f0950ae3          	beq	a0,s1,8000fd64 <_printf_i+0x28c>
8000fe54:	00042783          	lw	a5,0(s0)
8000fe58:	0027f793          	andi	a5,a5,2
8000fe5c:	04079463          	bnez	a5,8000fea4 <_printf_i+0x3cc>
8000fe60:	00c12783          	lw	a5,12(sp)
8000fe64:	00c42503          	lw	a0,12(s0)
8000fe68:	f0f550e3          	bge	a0,a5,8000fd68 <_printf_i+0x290>
8000fe6c:	00078513          	mv	a0,a5
8000fe70:	ef9ff06f          	j	8000fd68 <_printf_i+0x290>
8000fe74:	00100693          	li	a3,1
8000fe78:	00090613          	mv	a2,s2
8000fe7c:	000b0593          	mv	a1,s6
8000fe80:	000a8513          	mv	a0,s5
8000fe84:	000b80e7          	jalr	s7
8000fe88:	ed350ee3          	beq	a0,s3,8000fd64 <_printf_i+0x28c>
8000fe8c:	00148493          	addi	s1,s1,1
8000fe90:	00c42783          	lw	a5,12(s0)
8000fe94:	00c12703          	lw	a4,12(sp)
8000fe98:	40e787b3          	sub	a5,a5,a4
8000fe9c:	fcf4cce3          	blt	s1,a5,8000fe74 <_printf_i+0x39c>
8000fea0:	fc1ff06f          	j	8000fe60 <_printf_i+0x388>
8000fea4:	00000493          	li	s1,0
8000fea8:	01940913          	addi	s2,s0,25
8000feac:	fff00993          	li	s3,-1
8000feb0:	fe1ff06f          	j	8000fe90 <_printf_i+0x3b8>

Disassembly of section .text.__sfputc_r:

8000feb4 <__sfputc_r>:
8000feb4:	00862783          	lw	a5,8(a2)
8000feb8:	fff78793          	addi	a5,a5,-1
8000febc:	00f62423          	sw	a5,8(a2)
8000fec0:	0007dc63          	bgez	a5,8000fed8 <__sfputc_r+0x24>
8000fec4:	01862703          	lw	a4,24(a2)
8000fec8:	00e7c663          	blt	a5,a4,8000fed4 <__sfputc_r+0x20>
8000fecc:	00a00793          	li	a5,10
8000fed0:	00f59463          	bne	a1,a5,8000fed8 <__sfputc_r+0x24>
8000fed4:	e65fe06f          	j	8000ed38 <__swbuf_r>
8000fed8:	00062783          	lw	a5,0(a2)
8000fedc:	00058513          	mv	a0,a1
8000fee0:	00178713          	addi	a4,a5,1
8000fee4:	00e62023          	sw	a4,0(a2)
8000fee8:	00b78023          	sb	a1,0(a5)
8000feec:	00008067          	ret

Disassembly of section .text.__sfputs_r:

8000fef0 <__sfputs_r>:
8000fef0:	fe010113          	addi	sp,sp,-32
8000fef4:	00812c23          	sw	s0,24(sp)
8000fef8:	00912a23          	sw	s1,20(sp)
8000fefc:	01212823          	sw	s2,16(sp)
8000ff00:	01312623          	sw	s3,12(sp)
8000ff04:	01412423          	sw	s4,8(sp)
8000ff08:	00112e23          	sw	ra,28(sp)
8000ff0c:	00050913          	mv	s2,a0
8000ff10:	00058993          	mv	s3,a1
8000ff14:	00060413          	mv	s0,a2
8000ff18:	00d604b3          	add	s1,a2,a3
8000ff1c:	fff00a13          	li	s4,-1
8000ff20:	00941663          	bne	s0,s1,8000ff2c <__sfputs_r+0x3c>
8000ff24:	00000513          	li	a0,0
8000ff28:	01c0006f          	j	8000ff44 <__sfputs_r+0x54>
8000ff2c:	00044583          	lbu	a1,0(s0)
8000ff30:	00098613          	mv	a2,s3
8000ff34:	00090513          	mv	a0,s2
8000ff38:	f7dff0ef          	jal	ra,8000feb4 <__sfputc_r>
8000ff3c:	00140413          	addi	s0,s0,1
8000ff40:	ff4510e3          	bne	a0,s4,8000ff20 <__sfputs_r+0x30>
8000ff44:	01c12083          	lw	ra,28(sp)
8000ff48:	01812403          	lw	s0,24(sp)
8000ff4c:	01412483          	lw	s1,20(sp)
8000ff50:	01012903          	lw	s2,16(sp)
8000ff54:	00c12983          	lw	s3,12(sp)
8000ff58:	00812a03          	lw	s4,8(sp)
8000ff5c:	02010113          	addi	sp,sp,32
8000ff60:	00008067          	ret

Disassembly of section .text.__sprint_r:

8000ff64 <__sprint_r>:
8000ff64:	00862703          	lw	a4,8(a2)
8000ff68:	ff010113          	addi	sp,sp,-16
8000ff6c:	00812423          	sw	s0,8(sp)
8000ff70:	00112623          	sw	ra,12(sp)
8000ff74:	00060413          	mv	s0,a2
8000ff78:	00071e63          	bnez	a4,8000ff94 <__sprint_r+0x30>
8000ff7c:	00062223          	sw	zero,4(a2)
8000ff80:	00000513          	li	a0,0
8000ff84:	00c12083          	lw	ra,12(sp)
8000ff88:	00812403          	lw	s0,8(sp)
8000ff8c:	01010113          	addi	sp,sp,16
8000ff90:	00008067          	ret
8000ff94:	63c000ef          	jal	ra,800105d0 <__sfvwrite_r>
8000ff98:	00042423          	sw	zero,8(s0)
8000ff9c:	00042223          	sw	zero,4(s0)
8000ffa0:	fe5ff06f          	j	8000ff84 <__sprint_r+0x20>

Disassembly of section .text._vfprintf_r:

8000ffa4 <_vfiprintf_r>:
8000ffa4:	f6010113          	addi	sp,sp,-160
8000ffa8:	08812c23          	sw	s0,152(sp)
8000ffac:	08912a23          	sw	s1,148(sp)
8000ffb0:	09212823          	sw	s2,144(sp)
8000ffb4:	09312623          	sw	s3,140(sp)
8000ffb8:	08112e23          	sw	ra,156(sp)
8000ffbc:	09412423          	sw	s4,136(sp)
8000ffc0:	09512223          	sw	s5,132(sp)
8000ffc4:	09612023          	sw	s6,128(sp)
8000ffc8:	07712e23          	sw	s7,124(sp)
8000ffcc:	07812c23          	sw	s8,120(sp)
8000ffd0:	07912a23          	sw	s9,116(sp)
8000ffd4:	00050993          	mv	s3,a0
8000ffd8:	00058493          	mv	s1,a1
8000ffdc:	00060913          	mv	s2,a2
8000ffe0:	00068413          	mv	s0,a3
8000ffe4:	00050863          	beqz	a0,8000fff4 <_vfiprintf_r+0x50>
8000ffe8:	01852783          	lw	a5,24(a0)
8000ffec:	00079463          	bnez	a5,8000fff4 <_vfiprintf_r+0x50>
8000fff0:	c61fd0ef          	jal	ra,8000dc50 <__sinit>
8000fff4:	ffff3797          	auipc	a5,0xffff3
8000fff8:	d9c78793          	addi	a5,a5,-612 # 80002d90 <__sf_fake_stdin>
8000fffc:	12f49263          	bne	s1,a5,80010120 <_vfiprintf_r+0x17c>
80010000:	0049a483          	lw	s1,4(s3)
80010004:	00c4d783          	lhu	a5,12(s1)
80010008:	0087f793          	andi	a5,a5,8
8001000c:	12078e63          	beqz	a5,80010148 <_vfiprintf_r+0x1a4>
80010010:	0104a783          	lw	a5,16(s1)
80010014:	12078a63          	beqz	a5,80010148 <_vfiprintf_r+0x1a4>
80010018:	02000793          	li	a5,32
8001001c:	02f104a3          	sb	a5,41(sp)
80010020:	03000793          	li	a5,48
80010024:	02012223          	sw	zero,36(sp)
80010028:	02f10523          	sb	a5,42(sp)
8001002c:	00812623          	sw	s0,12(sp)
80010030:	02500b13          	li	s6,37
80010034:	ffff3a97          	auipc	s5,0xffff3
80010038:	d9ca8a93          	addi	s5,s5,-612 # 80002dd0 <__sf_fake_stdout+0x20>
8001003c:	00100b93          	li	s7,1
80010040:	7fff0c17          	auipc	s8,0x7fff0
80010044:	fc0c0c13          	addi	s8,s8,-64 # 0 <_ram_heap_end+0x7ffee000>
80010048:	00090413          	mv	s0,s2
8001004c:	00044783          	lbu	a5,0(s0)
80010050:	00078463          	beqz	a5,80010058 <_vfiprintf_r+0xb4>
80010054:	13679e63          	bne	a5,s6,80010190 <_vfiprintf_r+0x1ec>
80010058:	41240cb3          	sub	s9,s0,s2
8001005c:	020c8663          	beqz	s9,80010088 <_vfiprintf_r+0xe4>
80010060:	000c8693          	mv	a3,s9
80010064:	00090613          	mv	a2,s2
80010068:	00048593          	mv	a1,s1
8001006c:	00098513          	mv	a0,s3
80010070:	e81ff0ef          	jal	ra,8000fef0 <__sfputs_r>
80010074:	fff00793          	li	a5,-1
80010078:	2cf50663          	beq	a0,a5,80010344 <_vfiprintf_r+0x3a0>
8001007c:	02412683          	lw	a3,36(sp)
80010080:	019686b3          	add	a3,a3,s9
80010084:	02d12223          	sw	a3,36(sp)
80010088:	00044783          	lbu	a5,0(s0)
8001008c:	2a078c63          	beqz	a5,80010344 <_vfiprintf_r+0x3a0>
80010090:	fff00793          	li	a5,-1
80010094:	00140913          	addi	s2,s0,1
80010098:	00012823          	sw	zero,16(sp)
8001009c:	00012e23          	sw	zero,28(sp)
800100a0:	00f12a23          	sw	a5,20(sp)
800100a4:	00012c23          	sw	zero,24(sp)
800100a8:	040109a3          	sb	zero,83(sp)
800100ac:	06012423          	sw	zero,104(sp)
800100b0:	00094583          	lbu	a1,0(s2)
800100b4:	00500613          	li	a2,5
800100b8:	000a8513          	mv	a0,s5
800100bc:	1b9000ef          	jal	ra,80010a74 <memchr>
800100c0:	00190413          	addi	s0,s2,1
800100c4:	01012783          	lw	a5,16(sp)
800100c8:	0c051863          	bnez	a0,80010198 <_vfiprintf_r+0x1f4>
800100cc:	0107f713          	andi	a4,a5,16
800100d0:	00070663          	beqz	a4,800100dc <_vfiprintf_r+0x138>
800100d4:	02000713          	li	a4,32
800100d8:	04e109a3          	sb	a4,83(sp)
800100dc:	0087f713          	andi	a4,a5,8
800100e0:	00070663          	beqz	a4,800100ec <_vfiprintf_r+0x148>
800100e4:	02b00713          	li	a4,43
800100e8:	04e109a3          	sb	a4,83(sp)
800100ec:	00094683          	lbu	a3,0(s2)
800100f0:	02a00713          	li	a4,42
800100f4:	0ae68e63          	beq	a3,a4,800101b0 <_vfiprintf_r+0x20c>
800100f8:	01c12703          	lw	a4,28(sp)
800100fc:	00090413          	mv	s0,s2
80010100:	00000793          	li	a5,0
80010104:	00900613          	li	a2,9
80010108:	00044683          	lbu	a3,0(s0)
8001010c:	00140593          	addi	a1,s0,1
80010110:	fd068693          	addi	a3,a3,-48
80010114:	18d67263          	bgeu	a2,a3,80010298 <_vfiprintf_r+0x2f4>
80010118:	0a079663          	bnez	a5,800101c4 <_vfiprintf_r+0x220>
8001011c:	0c00006f          	j	800101dc <_vfiprintf_r+0x238>
80010120:	ffff3797          	auipc	a5,0xffff3
80010124:	c9078793          	addi	a5,a5,-880 # 80002db0 <__sf_fake_stdout>
80010128:	00f49663          	bne	s1,a5,80010134 <_vfiprintf_r+0x190>
8001012c:	0089a483          	lw	s1,8(s3)
80010130:	ed5ff06f          	j	80010004 <_vfiprintf_r+0x60>
80010134:	ffff3797          	auipc	a5,0xffff3
80010138:	c3c78793          	addi	a5,a5,-964 # 80002d70 <__sf_fake_stderr>
8001013c:	ecf494e3          	bne	s1,a5,80010004 <_vfiprintf_r+0x60>
80010140:	00c9a483          	lw	s1,12(s3)
80010144:	ec1ff06f          	j	80010004 <_vfiprintf_r+0x60>
80010148:	00048593          	mv	a1,s1
8001014c:	00098513          	mv	a0,s3
80010150:	d81fe0ef          	jal	ra,8000eed0 <__swsetup_r>
80010154:	ec0502e3          	beqz	a0,80010018 <_vfiprintf_r+0x74>
80010158:	fff00513          	li	a0,-1
8001015c:	09c12083          	lw	ra,156(sp)
80010160:	09812403          	lw	s0,152(sp)
80010164:	09412483          	lw	s1,148(sp)
80010168:	09012903          	lw	s2,144(sp)
8001016c:	08c12983          	lw	s3,140(sp)
80010170:	08812a03          	lw	s4,136(sp)
80010174:	08412a83          	lw	s5,132(sp)
80010178:	08012b03          	lw	s6,128(sp)
8001017c:	07c12b83          	lw	s7,124(sp)
80010180:	07812c03          	lw	s8,120(sp)
80010184:	07412c83          	lw	s9,116(sp)
80010188:	0a010113          	addi	sp,sp,160
8001018c:	00008067          	ret
80010190:	00140413          	addi	s0,s0,1
80010194:	eb9ff06f          	j	8001004c <_vfiprintf_r+0xa8>
80010198:	41550533          	sub	a0,a0,s5
8001019c:	00ab9533          	sll	a0,s7,a0
800101a0:	00a7e7b3          	or	a5,a5,a0
800101a4:	00f12823          	sw	a5,16(sp)
800101a8:	00040913          	mv	s2,s0
800101ac:	f05ff06f          	j	800100b0 <_vfiprintf_r+0x10c>
800101b0:	00c12703          	lw	a4,12(sp)
800101b4:	00470693          	addi	a3,a4,4
800101b8:	00072703          	lw	a4,0(a4)
800101bc:	00d12623          	sw	a3,12(sp)
800101c0:	00074663          	bltz	a4,800101cc <_vfiprintf_r+0x228>
800101c4:	00e12e23          	sw	a4,28(sp)
800101c8:	0140006f          	j	800101dc <_vfiprintf_r+0x238>
800101cc:	40e00733          	neg	a4,a4
800101d0:	0027e793          	ori	a5,a5,2
800101d4:	00e12e23          	sw	a4,28(sp)
800101d8:	00f12823          	sw	a5,16(sp)
800101dc:	00044703          	lbu	a4,0(s0)
800101e0:	02e00793          	li	a5,46
800101e4:	02f71663          	bne	a4,a5,80010210 <_vfiprintf_r+0x26c>
800101e8:	00144703          	lbu	a4,1(s0)
800101ec:	02a00793          	li	a5,42
800101f0:	0cf71663          	bne	a4,a5,800102bc <_vfiprintf_r+0x318>
800101f4:	00c12783          	lw	a5,12(sp)
800101f8:	00240413          	addi	s0,s0,2
800101fc:	00478713          	addi	a4,a5,4
80010200:	0007a783          	lw	a5,0(a5)
80010204:	00e12623          	sw	a4,12(sp)
80010208:	0a07c663          	bltz	a5,800102b4 <_vfiprintf_r+0x310>
8001020c:	00f12a23          	sw	a5,20(sp)
80010210:	00044583          	lbu	a1,0(s0)
80010214:	00300613          	li	a2,3
80010218:	ffff3517          	auipc	a0,0xffff3
8001021c:	bc050513          	addi	a0,a0,-1088 # 80002dd8 <__sf_fake_stdout+0x28>
80010220:	055000ef          	jal	ra,80010a74 <memchr>
80010224:	02050463          	beqz	a0,8001024c <_vfiprintf_r+0x2a8>
80010228:	ffff3797          	auipc	a5,0xffff3
8001022c:	bb078793          	addi	a5,a5,-1104 # 80002dd8 <__sf_fake_stdout+0x28>
80010230:	40f50533          	sub	a0,a0,a5
80010234:	04000793          	li	a5,64
80010238:	00a797b3          	sll	a5,a5,a0
8001023c:	01012503          	lw	a0,16(sp)
80010240:	00140413          	addi	s0,s0,1
80010244:	00f56533          	or	a0,a0,a5
80010248:	00a12823          	sw	a0,16(sp)
8001024c:	00044583          	lbu	a1,0(s0)
80010250:	00600613          	li	a2,6
80010254:	ffff3517          	auipc	a0,0xffff3
80010258:	b8850513          	addi	a0,a0,-1144 # 80002ddc <__sf_fake_stdout+0x2c>
8001025c:	00140913          	addi	s2,s0,1
80010260:	02b10423          	sb	a1,40(sp)
80010264:	011000ef          	jal	ra,80010a74 <memchr>
80010268:	0e050863          	beqz	a0,80010358 <_vfiprintf_r+0x3b4>
8001026c:	0a0c1663          	bnez	s8,80010318 <_vfiprintf_r+0x374>
80010270:	01012703          	lw	a4,16(sp)
80010274:	00c12783          	lw	a5,12(sp)
80010278:	10077713          	andi	a4,a4,256
8001027c:	08070663          	beqz	a4,80010308 <_vfiprintf_r+0x364>
80010280:	00478793          	addi	a5,a5,4
80010284:	00f12623          	sw	a5,12(sp)
80010288:	02412783          	lw	a5,36(sp)
8001028c:	014787b3          	add	a5,a5,s4
80010290:	02f12223          	sw	a5,36(sp)
80010294:	db5ff06f          	j	80010048 <_vfiprintf_r+0xa4>
80010298:	00271793          	slli	a5,a4,0x2
8001029c:	00e787b3          	add	a5,a5,a4
800102a0:	00179793          	slli	a5,a5,0x1
800102a4:	00d78733          	add	a4,a5,a3
800102a8:	00058413          	mv	s0,a1
800102ac:	00100793          	li	a5,1
800102b0:	e59ff06f          	j	80010108 <_vfiprintf_r+0x164>
800102b4:	fff00793          	li	a5,-1
800102b8:	f55ff06f          	j	8001020c <_vfiprintf_r+0x268>
800102bc:	00140413          	addi	s0,s0,1
800102c0:	00012a23          	sw	zero,20(sp)
800102c4:	00000793          	li	a5,0
800102c8:	00000713          	li	a4,0
800102cc:	00900613          	li	a2,9
800102d0:	00044683          	lbu	a3,0(s0)
800102d4:	00140593          	addi	a1,s0,1
800102d8:	fd068693          	addi	a3,a3,-48
800102dc:	00d67863          	bgeu	a2,a3,800102ec <_vfiprintf_r+0x348>
800102e0:	f20788e3          	beqz	a5,80010210 <_vfiprintf_r+0x26c>
800102e4:	00e12a23          	sw	a4,20(sp)
800102e8:	f29ff06f          	j	80010210 <_vfiprintf_r+0x26c>
800102ec:	00271793          	slli	a5,a4,0x2
800102f0:	00e787b3          	add	a5,a5,a4
800102f4:	00179793          	slli	a5,a5,0x1
800102f8:	00d78733          	add	a4,a5,a3
800102fc:	00058413          	mv	s0,a1
80010300:	00100793          	li	a5,1
80010304:	fcdff06f          	j	800102d0 <_vfiprintf_r+0x32c>
80010308:	00778793          	addi	a5,a5,7
8001030c:	ff87f793          	andi	a5,a5,-8
80010310:	00878793          	addi	a5,a5,8
80010314:	f71ff06f          	j	80010284 <_vfiprintf_r+0x2e0>
80010318:	00c10713          	addi	a4,sp,12
8001031c:	00000697          	auipc	a3,0x0
80010320:	bd468693          	addi	a3,a3,-1068 # 8000fef0 <__sfputs_r>
80010324:	00048613          	mv	a2,s1
80010328:	01010593          	addi	a1,sp,16
8001032c:	00098513          	mv	a0,s3
80010330:	00000097          	auipc	ra,0x0
80010334:	000000e7          	jalr	zero # 0 <_ram_heap_size>
80010338:	fff00793          	li	a5,-1
8001033c:	00050a13          	mv	s4,a0
80010340:	f4f514e3          	bne	a0,a5,80010288 <_vfiprintf_r+0x2e4>
80010344:	00c4d783          	lhu	a5,12(s1)
80010348:	0407f793          	andi	a5,a5,64
8001034c:	e00796e3          	bnez	a5,80010158 <_vfiprintf_r+0x1b4>
80010350:	02412503          	lw	a0,36(sp)
80010354:	e09ff06f          	j	8001015c <_vfiprintf_r+0x1b8>
80010358:	00c10713          	addi	a4,sp,12
8001035c:	00000697          	auipc	a3,0x0
80010360:	b9468693          	addi	a3,a3,-1132 # 8000fef0 <__sfputs_r>
80010364:	00048613          	mv	a2,s1
80010368:	01010593          	addi	a1,sp,16
8001036c:	00098513          	mv	a0,s3
80010370:	f68ff0ef          	jal	ra,8000fad8 <_printf_i>
80010374:	fc5ff06f          	j	80010338 <_vfiprintf_r+0x394>

Disassembly of section .text.vfprintf:

80010378 <vfiprintf>:
80010378:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
8001037c:	00060693          	mv	a3,a2
80010380:	00058613          	mv	a2,a1
80010384:	00050593          	mv	a1,a0
80010388:	0007a503          	lw	a0,0(a5)
8001038c:	c19ff06f          	j	8000ffa4 <_vfiprintf_r>

Disassembly of section .text._read_r:

80010390 <_read_r>:
80010390:	ff010113          	addi	sp,sp,-16
80010394:	00812423          	sw	s0,8(sp)
80010398:	00050413          	mv	s0,a0
8001039c:	00058513          	mv	a0,a1
800103a0:	00060593          	mv	a1,a2
800103a4:	00068613          	mv	a2,a3
800103a8:	c401a623          	sw	zero,-948(gp) # 800033e4 <errno>
800103ac:	00112623          	sw	ra,12(sp)
800103b0:	845f50ef          	jal	ra,80005bf4 <_read>
800103b4:	fff00793          	li	a5,-1
800103b8:	00f51a63          	bne	a0,a5,800103cc <_read_r+0x3c>
800103bc:	c4c18793          	addi	a5,gp,-948 # 800033e4 <errno>
800103c0:	0007a783          	lw	a5,0(a5)
800103c4:	00078463          	beqz	a5,800103cc <_read_r+0x3c>
800103c8:	00f42023          	sw	a5,0(s0)
800103cc:	00c12083          	lw	ra,12(sp)
800103d0:	00812403          	lw	s0,8(sp)
800103d4:	01010113          	addi	sp,sp,16
800103d8:	00008067          	ret

Disassembly of section .text.cleanup_glue:

800103dc <cleanup_glue>:
800103dc:	ff010113          	addi	sp,sp,-16
800103e0:	00812423          	sw	s0,8(sp)
800103e4:	00058413          	mv	s0,a1
800103e8:	0005a583          	lw	a1,0(a1)
800103ec:	00912223          	sw	s1,4(sp)
800103f0:	00112623          	sw	ra,12(sp)
800103f4:	00050493          	mv	s1,a0
800103f8:	00058463          	beqz	a1,80010400 <cleanup_glue+0x24>
800103fc:	fe1ff0ef          	jal	ra,800103dc <cleanup_glue>
80010400:	00040593          	mv	a1,s0
80010404:	00812403          	lw	s0,8(sp)
80010408:	00c12083          	lw	ra,12(sp)
8001040c:	00048513          	mv	a0,s1
80010410:	00412483          	lw	s1,4(sp)
80010414:	01010113          	addi	sp,sp,16
80010418:	e35fd06f          	j	8000e24c <_free_r>

Disassembly of section .text._reclaim_reent:

8001041c <_reclaim_reent>:
8001041c:	80c18793          	addi	a5,gp,-2036 # 80002fa4 <_impure_ptr>
80010420:	0007a783          	lw	a5,0(a5)
80010424:	16a78063          	beq	a5,a0,80010584 <_reclaim_reent+0x168>
80010428:	02452783          	lw	a5,36(a0)
8001042c:	fe010113          	addi	sp,sp,-32
80010430:	00812c23          	sw	s0,24(sp)
80010434:	00112e23          	sw	ra,28(sp)
80010438:	00912a23          	sw	s1,20(sp)
8001043c:	01212823          	sw	s2,16(sp)
80010440:	01312623          	sw	s3,12(sp)
80010444:	00050413          	mv	s0,a0
80010448:	02078463          	beqz	a5,80010470 <_reclaim_reent+0x54>
8001044c:	00c7a783          	lw	a5,12(a5)
80010450:	00000493          	li	s1,0
80010454:	08000913          	li	s2,128
80010458:	0e079263          	bnez	a5,8001053c <_reclaim_reent+0x120>
8001045c:	02442783          	lw	a5,36(s0)
80010460:	0007a583          	lw	a1,0(a5)
80010464:	00058663          	beqz	a1,80010470 <_reclaim_reent+0x54>
80010468:	00040513          	mv	a0,s0
8001046c:	de1fd0ef          	jal	ra,8000e24c <_free_r>
80010470:	01442583          	lw	a1,20(s0)
80010474:	00058663          	beqz	a1,80010480 <_reclaim_reent+0x64>
80010478:	00040513          	mv	a0,s0
8001047c:	dd1fd0ef          	jal	ra,8000e24c <_free_r>
80010480:	02442583          	lw	a1,36(s0)
80010484:	00058663          	beqz	a1,80010490 <_reclaim_reent+0x74>
80010488:	00040513          	mv	a0,s0
8001048c:	dc1fd0ef          	jal	ra,8000e24c <_free_r>
80010490:	03842583          	lw	a1,56(s0)
80010494:	00058663          	beqz	a1,800104a0 <_reclaim_reent+0x84>
80010498:	00040513          	mv	a0,s0
8001049c:	db1fd0ef          	jal	ra,8000e24c <_free_r>
800104a0:	03c42583          	lw	a1,60(s0)
800104a4:	00058663          	beqz	a1,800104b0 <_reclaim_reent+0x94>
800104a8:	00040513          	mv	a0,s0
800104ac:	da1fd0ef          	jal	ra,8000e24c <_free_r>
800104b0:	04042583          	lw	a1,64(s0)
800104b4:	00058663          	beqz	a1,800104c0 <_reclaim_reent+0xa4>
800104b8:	00040513          	mv	a0,s0
800104bc:	d91fd0ef          	jal	ra,8000e24c <_free_r>
800104c0:	05c42583          	lw	a1,92(s0)
800104c4:	00058663          	beqz	a1,800104d0 <_reclaim_reent+0xb4>
800104c8:	00040513          	mv	a0,s0
800104cc:	d81fd0ef          	jal	ra,8000e24c <_free_r>
800104d0:	05842583          	lw	a1,88(s0)
800104d4:	00058663          	beqz	a1,800104e0 <_reclaim_reent+0xc4>
800104d8:	00040513          	mv	a0,s0
800104dc:	d71fd0ef          	jal	ra,8000e24c <_free_r>
800104e0:	03442583          	lw	a1,52(s0)
800104e4:	00058663          	beqz	a1,800104f0 <_reclaim_reent+0xd4>
800104e8:	00040513          	mv	a0,s0
800104ec:	d61fd0ef          	jal	ra,8000e24c <_free_r>
800104f0:	01842783          	lw	a5,24(s0)
800104f4:	06078a63          	beqz	a5,80010568 <_reclaim_reent+0x14c>
800104f8:	02842783          	lw	a5,40(s0)
800104fc:	00040513          	mv	a0,s0
80010500:	000780e7          	jalr	a5
80010504:	04842583          	lw	a1,72(s0)
80010508:	06058063          	beqz	a1,80010568 <_reclaim_reent+0x14c>
8001050c:	00040513          	mv	a0,s0
80010510:	01812403          	lw	s0,24(sp)
80010514:	01c12083          	lw	ra,28(sp)
80010518:	01412483          	lw	s1,20(sp)
8001051c:	01012903          	lw	s2,16(sp)
80010520:	00c12983          	lw	s3,12(sp)
80010524:	02010113          	addi	sp,sp,32
80010528:	eb5ff06f          	j	800103dc <cleanup_glue>
8001052c:	009585b3          	add	a1,a1,s1
80010530:	0005a583          	lw	a1,0(a1)
80010534:	02059063          	bnez	a1,80010554 <_reclaim_reent+0x138>
80010538:	00448493          	addi	s1,s1,4
8001053c:	02442783          	lw	a5,36(s0)
80010540:	00c7a583          	lw	a1,12(a5)
80010544:	ff2494e3          	bne	s1,s2,8001052c <_reclaim_reent+0x110>
80010548:	00040513          	mv	a0,s0
8001054c:	d01fd0ef          	jal	ra,8000e24c <_free_r>
80010550:	f0dff06f          	j	8001045c <_reclaim_reent+0x40>
80010554:	0005a983          	lw	s3,0(a1)
80010558:	00040513          	mv	a0,s0
8001055c:	cf1fd0ef          	jal	ra,8000e24c <_free_r>
80010560:	00098593          	mv	a1,s3
80010564:	fd1ff06f          	j	80010534 <_reclaim_reent+0x118>
80010568:	01c12083          	lw	ra,28(sp)
8001056c:	01812403          	lw	s0,24(sp)
80010570:	01412483          	lw	s1,20(sp)
80010574:	01012903          	lw	s2,16(sp)
80010578:	00c12983          	lw	s3,12(sp)
8001057c:	02010113          	addi	sp,sp,32
80010580:	00008067          	ret
80010584:	00008067          	ret

Disassembly of section .text._fstat_r:

80010588 <_fstat_r>:
80010588:	ff010113          	addi	sp,sp,-16
8001058c:	00812423          	sw	s0,8(sp)
80010590:	00050413          	mv	s0,a0
80010594:	00058513          	mv	a0,a1
80010598:	00060593          	mv	a1,a2
8001059c:	c401a623          	sw	zero,-948(gp) # 800033e4 <errno>
800105a0:	00112623          	sw	ra,12(sp)
800105a4:	e70f50ef          	jal	ra,80005c14 <_fstat>
800105a8:	fff00793          	li	a5,-1
800105ac:	00f51a63          	bne	a0,a5,800105c0 <_fstat_r+0x38>
800105b0:	c4c18793          	addi	a5,gp,-948 # 800033e4 <errno>
800105b4:	0007a783          	lw	a5,0(a5)
800105b8:	00078463          	beqz	a5,800105c0 <_fstat_r+0x38>
800105bc:	00f42023          	sw	a5,0(s0)
800105c0:	00c12083          	lw	ra,12(sp)
800105c4:	00812403          	lw	s0,8(sp)
800105c8:	01010113          	addi	sp,sp,16
800105cc:	00008067          	ret

Disassembly of section .text.__sfvwrite_r:

800105d0 <__sfvwrite_r>:
800105d0:	00862783          	lw	a5,8(a2)
800105d4:	00079863          	bnez	a5,800105e4 <__sfvwrite_r+0x14>
800105d8:	00000793          	li	a5,0
800105dc:	00078513          	mv	a0,a5
800105e0:	00008067          	ret
800105e4:	00c5d783          	lhu	a5,12(a1)
800105e8:	fc010113          	addi	sp,sp,-64
800105ec:	02812c23          	sw	s0,56(sp)
800105f0:	03212823          	sw	s2,48(sp)
800105f4:	03612023          	sw	s6,32(sp)
800105f8:	02112e23          	sw	ra,60(sp)
800105fc:	02912a23          	sw	s1,52(sp)
80010600:	03312623          	sw	s3,44(sp)
80010604:	03412423          	sw	s4,40(sp)
80010608:	03512223          	sw	s5,36(sp)
8001060c:	01712e23          	sw	s7,28(sp)
80010610:	01812c23          	sw	s8,24(sp)
80010614:	01912a23          	sw	s9,20(sp)
80010618:	01a12823          	sw	s10,16(sp)
8001061c:	01b12623          	sw	s11,12(sp)
80010620:	0087f793          	andi	a5,a5,8
80010624:	00060b13          	mv	s6,a2
80010628:	00058413          	mv	s0,a1
8001062c:	00050913          	mv	s2,a0
80010630:	0e078263          	beqz	a5,80010714 <__sfvwrite_r+0x144>
80010634:	0105a783          	lw	a5,16(a1)
80010638:	0c078e63          	beqz	a5,80010714 <__sfvwrite_r+0x144>
8001063c:	00c45783          	lhu	a5,12(s0)
80010640:	000b2a03          	lw	s4,0(s6)
80010644:	0027f713          	andi	a4,a5,2
80010648:	16071a63          	bnez	a4,800107bc <__sfvwrite_r+0x1ec>
8001064c:	0017f793          	andi	a5,a5,1
80010650:	00000b93          	li	s7,0
80010654:	20078a63          	beqz	a5,80010868 <__sfvwrite_r+0x298>
80010658:	00000513          	li	a0,0
8001065c:	00000a93          	li	s5,0
80010660:	00000993          	li	s3,0
80010664:	36098463          	beqz	s3,800109cc <__sfvwrite_r+0x3fc>
80010668:	02051263          	bnez	a0,8001068c <__sfvwrite_r+0xbc>
8001066c:	00098613          	mv	a2,s3
80010670:	00a00593          	li	a1,10
80010674:	000a8513          	mv	a0,s5
80010678:	3fc000ef          	jal	ra,80010a74 <memchr>
8001067c:	00198b93          	addi	s7,s3,1
80010680:	00050663          	beqz	a0,8001068c <__sfvwrite_r+0xbc>
80010684:	00150513          	addi	a0,a0,1
80010688:	41550bb3          	sub	s7,a0,s5
8001068c:	000b8c13          	mv	s8,s7
80010690:	0179f463          	bgeu	s3,s7,80010698 <__sfvwrite_r+0xc8>
80010694:	00098c13          	mv	s8,s3
80010698:	00042503          	lw	a0,0(s0)
8001069c:	01042783          	lw	a5,16(s0)
800106a0:	01442683          	lw	a3,20(s0)
800106a4:	32a7fe63          	bgeu	a5,a0,800109e0 <__sfvwrite_r+0x410>
800106a8:	00842483          	lw	s1,8(s0)
800106ac:	009684b3          	add	s1,a3,s1
800106b0:	3384d863          	bge	s1,s8,800109e0 <__sfvwrite_r+0x410>
800106b4:	000a8593          	mv	a1,s5
800106b8:	00048613          	mv	a2,s1
800106bc:	ae1fd0ef          	jal	ra,8000e19c <memmove>
800106c0:	00042783          	lw	a5,0(s0)
800106c4:	00040593          	mv	a1,s0
800106c8:	00090513          	mv	a0,s2
800106cc:	009787b3          	add	a5,a5,s1
800106d0:	00f42023          	sw	a5,0(s0)
800106d4:	b8cfd0ef          	jal	ra,8000da60 <_fflush_r>
800106d8:	16051e63          	bnez	a0,80010854 <__sfvwrite_r+0x284>
800106dc:	409b8bb3          	sub	s7,s7,s1
800106e0:	00100513          	li	a0,1
800106e4:	000b9a63          	bnez	s7,800106f8 <__sfvwrite_r+0x128>
800106e8:	00040593          	mv	a1,s0
800106ec:	00090513          	mv	a0,s2
800106f0:	b70fd0ef          	jal	ra,8000da60 <_fflush_r>
800106f4:	16051063          	bnez	a0,80010854 <__sfvwrite_r+0x284>
800106f8:	008b2783          	lw	a5,8(s6)
800106fc:	009a8ab3          	add	s5,s5,s1
80010700:	409989b3          	sub	s3,s3,s1
80010704:	409784b3          	sub	s1,a5,s1
80010708:	009b2423          	sw	s1,8(s6)
8001070c:	f4049ce3          	bnez	s1,80010664 <__sfvwrite_r+0x94>
80010710:	0680006f          	j	80010778 <__sfvwrite_r+0x1a8>
80010714:	00040593          	mv	a1,s0
80010718:	00090513          	mv	a0,s2
8001071c:	fb4fe0ef          	jal	ra,8000eed0 <__swsetup_r>
80010720:	fff00793          	li	a5,-1
80010724:	f0050ce3          	beqz	a0,8001063c <__sfvwrite_r+0x6c>
80010728:	0540006f          	j	8001077c <__sfvwrite_r+0x1ac>
8001072c:	000a2983          	lw	s3,0(s4)
80010730:	004a2483          	lw	s1,4(s4)
80010734:	008a0a13          	addi	s4,s4,8
80010738:	fe048ae3          	beqz	s1,8001072c <__sfvwrite_r+0x15c>
8001073c:	00048693          	mv	a3,s1
80010740:	009af463          	bgeu	s5,s1,80010748 <__sfvwrite_r+0x178>
80010744:	000a8693          	mv	a3,s5
80010748:	02842783          	lw	a5,40(s0)
8001074c:	02042583          	lw	a1,32(s0)
80010750:	00098613          	mv	a2,s3
80010754:	00090513          	mv	a0,s2
80010758:	000780e7          	jalr	a5
8001075c:	0ea05c63          	blez	a0,80010854 <__sfvwrite_r+0x284>
80010760:	008b2783          	lw	a5,8(s6)
80010764:	00a989b3          	add	s3,s3,a0
80010768:	40a484b3          	sub	s1,s1,a0
8001076c:	40a78533          	sub	a0,a5,a0
80010770:	00ab2423          	sw	a0,8(s6)
80010774:	fc0512e3          	bnez	a0,80010738 <__sfvwrite_r+0x168>
80010778:	00000793          	li	a5,0
8001077c:	03c12083          	lw	ra,60(sp)
80010780:	03812403          	lw	s0,56(sp)
80010784:	03412483          	lw	s1,52(sp)
80010788:	03012903          	lw	s2,48(sp)
8001078c:	02c12983          	lw	s3,44(sp)
80010790:	02812a03          	lw	s4,40(sp)
80010794:	02412a83          	lw	s5,36(sp)
80010798:	02012b03          	lw	s6,32(sp)
8001079c:	01c12b83          	lw	s7,28(sp)
800107a0:	01812c03          	lw	s8,24(sp)
800107a4:	01412c83          	lw	s9,20(sp)
800107a8:	01012d03          	lw	s10,16(sp)
800107ac:	00c12d83          	lw	s11,12(sp)
800107b0:	00078513          	mv	a0,a5
800107b4:	04010113          	addi	sp,sp,64
800107b8:	00008067          	ret
800107bc:	80000ab7          	lui	s5,0x80000
800107c0:	00000993          	li	s3,0
800107c4:	00000493          	li	s1,0
800107c8:	c00aca93          	xori	s5,s5,-1024
800107cc:	f6dff06f          	j	80010738 <__sfvwrite_r+0x168>
800107d0:	000a2b83          	lw	s7,0(s4)
800107d4:	004a2483          	lw	s1,4(s4)
800107d8:	008a0a13          	addi	s4,s4,8
800107dc:	fe048ae3          	beqz	s1,800107d0 <__sfvwrite_r+0x200>
800107e0:	00c45783          	lhu	a5,12(s0)
800107e4:	00842d83          	lw	s11,8(s0)
800107e8:	00042503          	lw	a0,0(s0)
800107ec:	2007f713          	andi	a4,a5,512
800107f0:	14070263          	beqz	a4,80010934 <__sfvwrite_r+0x364>
800107f4:	0db4e063          	bltu	s1,s11,800108b4 <__sfvwrite_r+0x2e4>
800107f8:	4807f713          	andi	a4,a5,1152
800107fc:	0a070c63          	beqz	a4,800108b4 <__sfvwrite_r+0x2e4>
80010800:	01442703          	lw	a4,20(s0)
80010804:	01042583          	lw	a1,16(s0)
80010808:	00171a93          	slli	s5,a4,0x1
8001080c:	00ea8733          	add	a4,s5,a4
80010810:	01f75a93          	srli	s5,a4,0x1f
80010814:	40b50d33          	sub	s10,a0,a1
80010818:	00ea8ab3          	add	s5,s5,a4
8001081c:	001d0713          	addi	a4,s10,1
80010820:	401ada93          	srai	s5,s5,0x1
80010824:	00970733          	add	a4,a4,s1
80010828:	00eaf463          	bgeu	s5,a4,80010830 <__sfvwrite_r+0x260>
8001082c:	00070a93          	mv	s5,a4
80010830:	4007f793          	andi	a5,a5,1024
80010834:	0c078863          	beqz	a5,80010904 <__sfvwrite_r+0x334>
80010838:	000a8593          	mv	a1,s5
8001083c:	00090513          	mv	a0,s2
80010840:	b11fd0ef          	jal	ra,8000e350 <_malloc_r>
80010844:	00050993          	mv	s3,a0
80010848:	02051a63          	bnez	a0,8001087c <__sfvwrite_r+0x2ac>
8001084c:	00c00793          	li	a5,12
80010850:	00f92023          	sw	a5,0(s2)
80010854:	00c45783          	lhu	a5,12(s0)
80010858:	0407e793          	ori	a5,a5,64
8001085c:	00f41623          	sh	a5,12(s0)
80010860:	fff00793          	li	a5,-1
80010864:	f19ff06f          	j	8001077c <__sfvwrite_r+0x1ac>
80010868:	80000c37          	lui	s8,0x80000
8001086c:	ffec4c93          	xori	s9,s8,-2
80010870:	00000493          	li	s1,0
80010874:	fffc4c13          	not	s8,s8
80010878:	f65ff06f          	j	800107dc <__sfvwrite_r+0x20c>
8001087c:	01042583          	lw	a1,16(s0)
80010880:	000d0613          	mv	a2,s10
80010884:	841fd0ef          	jal	ra,8000e0c4 <memcpy>
80010888:	00c45783          	lhu	a5,12(s0)
8001088c:	b7f7f793          	andi	a5,a5,-1153
80010890:	0807e793          	ori	a5,a5,128
80010894:	00f41623          	sh	a5,12(s0)
80010898:	01342823          	sw	s3,16(s0)
8001089c:	01542a23          	sw	s5,20(s0)
800108a0:	01a989b3          	add	s3,s3,s10
800108a4:	41aa8ab3          	sub	s5,s5,s10
800108a8:	01342023          	sw	s3,0(s0)
800108ac:	00048d93          	mv	s11,s1
800108b0:	01542423          	sw	s5,8(s0)
800108b4:	00048993          	mv	s3,s1
800108b8:	01b4f463          	bgeu	s1,s11,800108c0 <__sfvwrite_r+0x2f0>
800108bc:	00048d93          	mv	s11,s1
800108c0:	00042503          	lw	a0,0(s0)
800108c4:	000d8613          	mv	a2,s11
800108c8:	000b8593          	mv	a1,s7
800108cc:	8d1fd0ef          	jal	ra,8000e19c <memmove>
800108d0:	00842783          	lw	a5,8(s0)
800108d4:	41b787b3          	sub	a5,a5,s11
800108d8:	00f42423          	sw	a5,8(s0)
800108dc:	00042783          	lw	a5,0(s0)
800108e0:	01b78db3          	add	s11,a5,s11
800108e4:	01b42023          	sw	s11,0(s0)
800108e8:	008b2783          	lw	a5,8(s6)
800108ec:	013b8bb3          	add	s7,s7,s3
800108f0:	413484b3          	sub	s1,s1,s3
800108f4:	413789b3          	sub	s3,a5,s3
800108f8:	013b2423          	sw	s3,8(s6)
800108fc:	ee0990e3          	bnez	s3,800107dc <__sfvwrite_r+0x20c>
80010900:	e79ff06f          	j	80010778 <__sfvwrite_r+0x1a8>
80010904:	000a8613          	mv	a2,s5
80010908:	00090513          	mv	a0,s2
8001090c:	18c000ef          	jal	ra,80010a98 <_realloc_r>
80010910:	00050993          	mv	s3,a0
80010914:	f80512e3          	bnez	a0,80010898 <__sfvwrite_r+0x2c8>
80010918:	01042583          	lw	a1,16(s0)
8001091c:	00090513          	mv	a0,s2
80010920:	92dfd0ef          	jal	ra,8000e24c <_free_r>
80010924:	00c45783          	lhu	a5,12(s0)
80010928:	f7f7f793          	andi	a5,a5,-129
8001092c:	00f41623          	sh	a5,12(s0)
80010930:	f1dff06f          	j	8001084c <__sfvwrite_r+0x27c>
80010934:	01042783          	lw	a5,16(s0)
80010938:	00a7e663          	bltu	a5,a0,80010944 <__sfvwrite_r+0x374>
8001093c:	01442983          	lw	s3,20(s0)
80010940:	0534f663          	bgeu	s1,s3,8001098c <__sfvwrite_r+0x3bc>
80010944:	000d8993          	mv	s3,s11
80010948:	01b4f463          	bgeu	s1,s11,80010950 <__sfvwrite_r+0x380>
8001094c:	00048993          	mv	s3,s1
80010950:	00098613          	mv	a2,s3
80010954:	000b8593          	mv	a1,s7
80010958:	845fd0ef          	jal	ra,8000e19c <memmove>
8001095c:	00842783          	lw	a5,8(s0)
80010960:	00042703          	lw	a4,0(s0)
80010964:	413787b3          	sub	a5,a5,s3
80010968:	01370733          	add	a4,a4,s3
8001096c:	00f42423          	sw	a5,8(s0)
80010970:	00e42023          	sw	a4,0(s0)
80010974:	f6079ae3          	bnez	a5,800108e8 <__sfvwrite_r+0x318>
80010978:	00040593          	mv	a1,s0
8001097c:	00090513          	mv	a0,s2
80010980:	8e0fd0ef          	jal	ra,8000da60 <_fflush_r>
80010984:	f60502e3          	beqz	a0,800108e8 <__sfvwrite_r+0x318>
80010988:	ecdff06f          	j	80010854 <__sfvwrite_r+0x284>
8001098c:	00048513          	mv	a0,s1
80010990:	009cf463          	bgeu	s9,s1,80010998 <__sfvwrite_r+0x3c8>
80010994:	000c0513          	mv	a0,s8
80010998:	00098593          	mv	a1,s3
8001099c:	8a5fc0ef          	jal	ra,8000d240 <__divsi3>
800109a0:	00098593          	mv	a1,s3
800109a4:	879fc0ef          	jal	ra,8000d21c <__mulsi3>
800109a8:	02842783          	lw	a5,40(s0)
800109ac:	02042583          	lw	a1,32(s0)
800109b0:	00050693          	mv	a3,a0
800109b4:	000b8613          	mv	a2,s7
800109b8:	00090513          	mv	a0,s2
800109bc:	000780e7          	jalr	a5
800109c0:	00050993          	mv	s3,a0
800109c4:	f2a042e3          	bgtz	a0,800108e8 <__sfvwrite_r+0x318>
800109c8:	e8dff06f          	j	80010854 <__sfvwrite_r+0x284>
800109cc:	000a2a83          	lw	s5,0(s4)
800109d0:	004a2983          	lw	s3,4(s4)
800109d4:	00000513          	li	a0,0
800109d8:	008a0a13          	addi	s4,s4,8
800109dc:	c89ff06f          	j	80010664 <__sfvwrite_r+0x94>
800109e0:	02dc4263          	blt	s8,a3,80010a04 <__sfvwrite_r+0x434>
800109e4:	02842783          	lw	a5,40(s0)
800109e8:	02042583          	lw	a1,32(s0)
800109ec:	000a8613          	mv	a2,s5
800109f0:	00090513          	mv	a0,s2
800109f4:	000780e7          	jalr	a5
800109f8:	00050493          	mv	s1,a0
800109fc:	cea040e3          	bgtz	a0,800106dc <__sfvwrite_r+0x10c>
80010a00:	e55ff06f          	j	80010854 <__sfvwrite_r+0x284>
80010a04:	000c0613          	mv	a2,s8
80010a08:	000a8593          	mv	a1,s5
80010a0c:	f90fd0ef          	jal	ra,8000e19c <memmove>
80010a10:	00842783          	lw	a5,8(s0)
80010a14:	000c0493          	mv	s1,s8
80010a18:	418787b3          	sub	a5,a5,s8
80010a1c:	00f42423          	sw	a5,8(s0)
80010a20:	00042783          	lw	a5,0(s0)
80010a24:	018787b3          	add	a5,a5,s8
80010a28:	00f42023          	sw	a5,0(s0)
80010a2c:	cb1ff06f          	j	800106dc <__sfvwrite_r+0x10c>

Disassembly of section .text._isatty_r:

80010a30 <_isatty_r>:
80010a30:	ff010113          	addi	sp,sp,-16
80010a34:	00812423          	sw	s0,8(sp)
80010a38:	00050413          	mv	s0,a0
80010a3c:	00058513          	mv	a0,a1
80010a40:	c401a623          	sw	zero,-948(gp) # 800033e4 <errno>
80010a44:	00112623          	sw	ra,12(sp)
80010a48:	9c4f50ef          	jal	ra,80005c0c <_isatty>
80010a4c:	fff00793          	li	a5,-1
80010a50:	00f51a63          	bne	a0,a5,80010a64 <_isatty_r+0x34>
80010a54:	c4c18793          	addi	a5,gp,-948 # 800033e4 <errno>
80010a58:	0007a783          	lw	a5,0(a5)
80010a5c:	00078463          	beqz	a5,80010a64 <_isatty_r+0x34>
80010a60:	00f42023          	sw	a5,0(s0)
80010a64:	00c12083          	lw	ra,12(sp)
80010a68:	00812403          	lw	s0,8(sp)
80010a6c:	01010113          	addi	sp,sp,16
80010a70:	00008067          	ret

Disassembly of section .text.memchr:

80010a74 <memchr>:
80010a74:	0ff5f593          	andi	a1,a1,255
80010a78:	00c50633          	add	a2,a0,a2
80010a7c:	00c51663          	bne	a0,a2,80010a88 <memchr+0x14>
80010a80:	00000513          	li	a0,0
80010a84:	00008067          	ret
80010a88:	00054783          	lbu	a5,0(a0)
80010a8c:	feb78ce3          	beq	a5,a1,80010a84 <memchr+0x10>
80010a90:	00150513          	addi	a0,a0,1
80010a94:	fe9ff06f          	j	80010a7c <memchr+0x8>

Disassembly of section .text._realloc_r:

80010a98 <_realloc_r>:
80010a98:	00059663          	bnez	a1,80010aa4 <_realloc_r+0xc>
80010a9c:	00060593          	mv	a1,a2
80010aa0:	8b1fd06f          	j	8000e350 <_malloc_r>
80010aa4:	fe010113          	addi	sp,sp,-32
80010aa8:	00812c23          	sw	s0,24(sp)
80010aac:	00112e23          	sw	ra,28(sp)
80010ab0:	00912a23          	sw	s1,20(sp)
80010ab4:	01212823          	sw	s2,16(sp)
80010ab8:	01312623          	sw	s3,12(sp)
80010abc:	00060413          	mv	s0,a2
80010ac0:	02061663          	bnez	a2,80010aec <_realloc_r+0x54>
80010ac4:	f88fd0ef          	jal	ra,8000e24c <_free_r>
80010ac8:	00000913          	li	s2,0
80010acc:	01c12083          	lw	ra,28(sp)
80010ad0:	01812403          	lw	s0,24(sp)
80010ad4:	00090513          	mv	a0,s2
80010ad8:	01412483          	lw	s1,20(sp)
80010adc:	01012903          	lw	s2,16(sp)
80010ae0:	00c12983          	lw	s3,12(sp)
80010ae4:	02010113          	addi	sp,sp,32
80010ae8:	00008067          	ret
80010aec:	00058493          	mv	s1,a1
80010af0:	00050993          	mv	s3,a0
80010af4:	03c000ef          	jal	ra,80010b30 <_malloc_usable_size_r>
80010af8:	00048913          	mv	s2,s1
80010afc:	fc8578e3          	bgeu	a0,s0,80010acc <_realloc_r+0x34>
80010b00:	00040593          	mv	a1,s0
80010b04:	00098513          	mv	a0,s3
80010b08:	849fd0ef          	jal	ra,8000e350 <_malloc_r>
80010b0c:	00050913          	mv	s2,a0
80010b10:	fa050ee3          	beqz	a0,80010acc <_realloc_r+0x34>
80010b14:	00048593          	mv	a1,s1
80010b18:	00040613          	mv	a2,s0
80010b1c:	da8fd0ef          	jal	ra,8000e0c4 <memcpy>
80010b20:	00048593          	mv	a1,s1
80010b24:	00098513          	mv	a0,s3
80010b28:	f24fd0ef          	jal	ra,8000e24c <_free_r>
80010b2c:	fa1ff06f          	j	80010acc <_realloc_r+0x34>

Disassembly of section .text._malloc_usable_size_r:

80010b30 <_malloc_usable_size_r>:
80010b30:	ffc5a783          	lw	a5,-4(a1)
80010b34:	ffc78513          	addi	a0,a5,-4
80010b38:	0007d863          	bgez	a5,80010b48 <_malloc_usable_size_r+0x18>
80010b3c:	00a585b3          	add	a1,a1,a0
80010b40:	0005a783          	lw	a5,0(a1)
80010b44:	00f50533          	add	a0,a0,a5
80010b48:	00008067          	ret
