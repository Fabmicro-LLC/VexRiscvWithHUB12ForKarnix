
build/karnix_hub12.elf:     file format elf32-littleriscv


Disassembly of section ._vector:

80000000 <crtStart>:
80000000:	80000137          	lui	sp,0x80000
80000004:	0b010113          	addi	sp,sp,176 # 800000b0 <_heap_end+0xfffee0b0>
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
80000064:	0fd030ef          	jal	ra,80003960 <irqCallback>
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
800000b4:	78818193          	addi	gp,gp,1928 # 80003838 <__global_pointer$>
800000b8:	00011117          	auipc	sp,0x11
800000bc:	05810113          	addi	sp,sp,88 # 80011110 <_stack_start>

800000c0 <bss_init>:
800000c0:	86018513          	addi	a0,gp,-1952 # 80003098 <t2>
800000c4:	c4818593          	addi	a1,gp,-952 # 80003480 <_bss_end>

800000c8 <bss_loop>:
800000c8:	00b50863          	beq	a0,a1,800000d8 <bss_done>
800000cc:	00052023          	sw	zero,0(a0)
800000d0:	00450513          	addi	a0,a0,4
800000d4:	ff5ff06f          	j	800000c8 <bss_loop>

800000d8 <bss_done>:
800000d8:	00011517          	auipc	a0,0x11
800000dc:	83050513          	addi	a0,a0,-2000 # 80010908 <_ctors_end>
800000e0:	ffc10113          	addi	sp,sp,-4

800000e4 <ctors_loop>:
800000e4:	00011597          	auipc	a1,0x11
800000e8:	82458593          	addi	a1,a1,-2012 # 80010908 <_ctors_end>
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
80000124:	2440d0ef          	jal	ra,8000d368 <end>

80000128 <infinitLoop>:
80000128:	0000006f          	j	80000128 <infinitLoop>
	...

Disassembly of section .memory:

800034e4 <crc16>:
800034e4:	000107b7          	lui	a5,0x10
800034e8:	ffffa6b7          	lui	a3,0xffffa
800034ec:	00000713          	li	a4,0
800034f0:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
800034f4:	00168693          	addi	a3,a3,1 # ffffa001 <_heap_end+0x7ffe8001>
800034f8:	00b74663          	blt	a4,a1,80003504 <crc16+0x20>
800034fc:	00078513          	mv	a0,a5
80003500:	00008067          	ret
80003504:	00e50633          	add	a2,a0,a4
80003508:	00064603          	lbu	a2,0(a2)
8000350c:	00c7c7b3          	xor	a5,a5,a2
80003510:	00800613          	li	a2,8
80003514:	0017f813          	andi	a6,a5,1
80003518:	0017d793          	srli	a5,a5,0x1
8000351c:	00080863          	beqz	a6,8000352c <crc16+0x48>
80003520:	00d7c7b3          	xor	a5,a5,a3
80003524:	01079793          	slli	a5,a5,0x10
80003528:	0107d793          	srli	a5,a5,0x10
8000352c:	fff60613          	addi	a2,a2,-1
80003530:	fe0612e3          	bnez	a2,80003514 <crc16+0x30>
80003534:	00170713          	addi	a4,a4,1
80003538:	fc1ff06f          	j	800034f8 <crc16+0x14>

8000353c <add_crc>:
8000353c:	ff010113          	addi	sp,sp,-16
80003540:	00812423          	sw	s0,8(sp)
80003544:	00912223          	sw	s1,4(sp)
80003548:	00112623          	sw	ra,12(sp)
8000354c:	00050413          	mv	s0,a0
80003550:	00058493          	mv	s1,a1
80003554:	f91ff0ef          	jal	ra,800034e4 <crc16>
80003558:	009405b3          	add	a1,s0,s1
8000355c:	00a58023          	sb	a0,0(a1)
80003560:	00855513          	srli	a0,a0,0x8
80003564:	00a580a3          	sb	a0,1(a1)
80003568:	00c12083          	lw	ra,12(sp)
8000356c:	00812403          	lw	s0,8(sp)
80003570:	00412483          	lw	s1,4(sp)
80003574:	01010113          	addi	sp,sp,16
80003578:	00008067          	ret

8000357c <println>:
8000357c:	ff010113          	addi	sp,sp,-16
80003580:	00112623          	sw	ra,12(sp)
80003584:	5e4020ef          	jal	ra,80005b68 <print_uart0>
80003588:	00c12083          	lw	ra,12(sp)
8000358c:	80003537          	lui	a0,0x80003
80003590:	80850513          	addi	a0,a0,-2040 # 80002808 <_heap_end+0xffff0808>
80003594:	01010113          	addi	sp,sp,16
80003598:	5d00206f          	j	80005b68 <print_uart0>

8000359c <to_hex_nibble>:
8000359c:	00f57513          	andi	a0,a0,15
800035a0:	00900793          	li	a5,9
800035a4:	00a7f663          	bgeu	a5,a0,800035b0 <to_hex_nibble+0x14>
800035a8:	03750513          	addi	a0,a0,55
800035ac:	00008067          	ret
800035b0:	03050513          	addi	a0,a0,48
800035b4:	00008067          	ret

800035b8 <to_hex>:
800035b8:	fd010113          	addi	sp,sp,-48
800035bc:	02812423          	sw	s0,40(sp)
800035c0:	02912223          	sw	s1,36(sp)
800035c4:	03212023          	sw	s2,32(sp)
800035c8:	01312e23          	sw	s3,28(sp)
800035cc:	02112623          	sw	ra,44(sp)
800035d0:	00050913          	mv	s2,a0
800035d4:	00050493          	mv	s1,a0
800035d8:	01c00413          	li	s0,28
800035dc:	ffc00993          	li	s3,-4
800035e0:	0085d533          	srl	a0,a1,s0
800035e4:	0ff57513          	andi	a0,a0,255
800035e8:	00b12623          	sw	a1,12(sp)
800035ec:	fb1ff0ef          	jal	ra,8000359c <to_hex_nibble>
800035f0:	00a48023          	sb	a0,0(s1)
800035f4:	ffc40413          	addi	s0,s0,-4
800035f8:	00148493          	addi	s1,s1,1
800035fc:	00c12583          	lw	a1,12(sp)
80003600:	ff3410e3          	bne	s0,s3,800035e0 <to_hex+0x28>
80003604:	02c12083          	lw	ra,44(sp)
80003608:	02812403          	lw	s0,40(sp)
8000360c:	00090423          	sb	zero,8(s2)
80003610:	02412483          	lw	s1,36(sp)
80003614:	02012903          	lw	s2,32(sp)
80003618:	01c12983          	lw	s3,28(sp)
8000361c:	03010113          	addi	sp,sp,48
80003620:	00008067          	ret

80003624 <process_and_wait>:
80003624:	fe010113          	addi	sp,sp,-32
80003628:	00812c23          	sw	s0,24(sp)
8000362c:	00912a23          	sw	s1,20(sp)
80003630:	01412423          	sw	s4,8(sp)
80003634:	01512223          	sw	s5,4(sp)
80003638:	00112e23          	sw	ra,28(sp)
8000363c:	01212823          	sw	s2,16(sp)
80003640:	01312623          	sw	s3,12(sp)
80003644:	f00b07b7          	lui	a5,0xf00b0
80003648:	0007a903          	lw	s2,0(a5) # f00b0000 <_heap_end+0x7009e000>
8000364c:	0047a983          	lw	s3,4(a5)
80003650:	00050a13          	mv	s4,a0
80003654:	f00b0ab7          	lui	s5,0xf00b0
80003658:	000aa783          	lw	a5,0(s5) # f00b0000 <_heap_end+0x7009e000>
8000365c:	004aa803          	lw	a6,4(s5)
80003660:	412786b3          	sub	a3,a5,s2
80003664:	00d7b733          	sltu	a4,a5,a3
80003668:	413807b3          	sub	a5,a6,s3
8000366c:	02e79663          	bne	a5,a4,80003698 <process_and_wait+0x74>
80003670:	0346f463          	bgeu	a3,s4,80003698 <process_and_wait+0x74>
80003674:	8741a783          	lw	a5,-1932(gp) # 800030ac <events_modbus_rtu_poll>
80003678:	00078663          	beqz	a5,80003684 <process_and_wait+0x60>
8000367c:	3a8000ef          	jal	ra,80003a24 <modbus_rtu_poll>
80003680:	8601aa23          	sw	zero,-1932(gp) # 800030ac <events_modbus_rtu_poll>
80003684:	8781a783          	lw	a5,-1928(gp) # 800030b0 <events_mac_poll>
80003688:	fc0788e3          	beqz	a5,80003658 <process_and_wait+0x34>
8000368c:	34d010ef          	jal	ra,800051d8 <mac_poll>
80003690:	8601ac23          	sw	zero,-1928(gp) # 800030b0 <events_mac_poll>
80003694:	fc5ff06f          	j	80003658 <process_and_wait+0x34>
80003698:	01c12083          	lw	ra,28(sp)
8000369c:	01812403          	lw	s0,24(sp)
800036a0:	01412483          	lw	s1,20(sp)
800036a4:	01012903          	lw	s2,16(sp)
800036a8:	00c12983          	lw	s3,12(sp)
800036ac:	00812a03          	lw	s4,8(sp)
800036b0:	00412a83          	lw	s5,4(sp)
800036b4:	02010113          	addi	sp,sp,32
800036b8:	00008067          	ret

800036bc <sram_test_write_shorts>:
800036bc:	80002537          	lui	a0,0x80002
800036c0:	fe010113          	addi	sp,sp,-32
800036c4:	900005b7          	lui	a1,0x90000
800036c8:	00080637          	lui	a2,0x80
800036cc:	f3450513          	addi	a0,a0,-204 # 80001f34 <_heap_end+0xfffeff34>
800036d0:	00112e23          	sw	ra,28(sp)
800036d4:	00812c23          	sw	s0,24(sp)
800036d8:	00912a23          	sw	s1,20(sp)
800036dc:	01212823          	sw	s2,16(sp)
800036e0:	01312623          	sw	s3,12(sp)
800036e4:	01412423          	sw	s4,8(sp)
800036e8:	01512223          	sw	s5,4(sp)
800036ec:	5390a0ef          	jal	ra,8000e424 <iprintf>
800036f0:	00000793          	li	a5,0
800036f4:	900005b7          	lui	a1,0x90000
800036f8:	000406b7          	lui	a3,0x40
800036fc:	00179713          	slli	a4,a5,0x1
80003700:	01079613          	slli	a2,a5,0x10
80003704:	00b70733          	add	a4,a4,a1
80003708:	01065613          	srli	a2,a2,0x10
8000370c:	00c71023          	sh	a2,0(a4)
80003710:	00178793          	addi	a5,a5,1
80003714:	fed794e3          	bne	a5,a3,800036fc <sram_test_write_shorts+0x40>
80003718:	800024b7          	lui	s1,0x80002
8000371c:	f5c48513          	addi	a0,s1,-164 # 80001f5c <_heap_end+0xfffeff5c>
80003720:	5050a0ef          	jal	ra,8000e424 <iprintf>
80003724:	80002537          	lui	a0,0x80002
80003728:	00080637          	lui	a2,0x80
8000372c:	900005b7          	lui	a1,0x90000
80003730:	f6450513          	addi	a0,a0,-156 # 80001f64 <_heap_end+0xfffeff64>
80003734:	00010937          	lui	s2,0x10
80003738:	4ed0a0ef          	jal	ra,8000e424 <iprintf>
8000373c:	00000413          	li	s0,0
80003740:	90000a37          	lui	s4,0x90000
80003744:	fff90913          	addi	s2,s2,-1 # ffff <_stack_size+0xf7ff>
80003748:	80002ab7          	lui	s5,0x80002
8000374c:	000409b7          	lui	s3,0x40
80003750:	00141593          	slli	a1,s0,0x1
80003754:	014585b3          	add	a1,a1,s4
80003758:	0005d783          	lhu	a5,0(a1) # 90000000 <_heap_end+0xffee000>
8000375c:	01041713          	slli	a4,s0,0x10
80003760:	01075713          	srli	a4,a4,0x10
80003764:	00f70a63          	beq	a4,a5,80003778 <sram_test_write_shorts+0xbc>
80003768:	0005d683          	lhu	a3,0(a1)
8000376c:	01247633          	and	a2,s0,s2
80003770:	f8ca8513          	addi	a0,s5,-116 # 80001f8c <_heap_end+0xfffeff8c>
80003774:	4b10a0ef          	jal	ra,8000e424 <iprintf>
80003778:	00140413          	addi	s0,s0,1
8000377c:	fd341ae3          	bne	s0,s3,80003750 <sram_test_write_shorts+0x94>
80003780:	01812403          	lw	s0,24(sp)
80003784:	01c12083          	lw	ra,28(sp)
80003788:	01012903          	lw	s2,16(sp)
8000378c:	00c12983          	lw	s3,12(sp)
80003790:	00812a03          	lw	s4,8(sp)
80003794:	00412a83          	lw	s5,4(sp)
80003798:	f5c48513          	addi	a0,s1,-164
8000379c:	01412483          	lw	s1,20(sp)
800037a0:	02010113          	addi	sp,sp,32
800037a4:	4810a06f          	j	8000e424 <iprintf>

800037a8 <timerInterrupt>:
800037a8:	00008067          	ret

800037ac <externalInterrupt>:
800037ac:	ff010113          	addi	sp,sp,-16
800037b0:	00112623          	sw	ra,12(sp)
800037b4:	00812423          	sw	s0,8(sp)
800037b8:	f00607b7          	lui	a5,0xf0060
800037bc:	0047a783          	lw	a5,4(a5) # f0060004 <_heap_end+0x7004e004>
800037c0:	0017f793          	andi	a5,a5,1
800037c4:	02078c63          	beqz	a5,800037fc <externalInterrupt+0x50>
800037c8:	f0000737          	lui	a4,0xf0000
800037cc:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
800037d0:	02a00593          	li	a1,42
800037d4:	0027e793          	ori	a5,a5,2
800037d8:	00f72223          	sw	a5,4(a4)
800037dc:	f0010737          	lui	a4,0xf0010
800037e0:	00472783          	lw	a5,4(a4) # f0010004 <_heap_end+0x6fffe004>
800037e4:	0187d793          	srli	a5,a5,0x18
800037e8:	0e079c63          	bnez	a5,800038e0 <__global_pointer$+0xa8>
800037ec:	f0060737          	lui	a4,0xf0060
800037f0:	00472783          	lw	a5,4(a4) # f0060004 <_heap_end+0x7004e004>
800037f4:	ffe7f793          	andi	a5,a5,-2
800037f8:	00f72223          	sw	a5,4(a4)
800037fc:	f0060437          	lui	s0,0xf0060
80003800:	00442783          	lw	a5,4(s0) # f0060004 <_heap_end+0x7004e004>
80003804:	0027f793          	andi	a5,a5,2
80003808:	00078a63          	beqz	a5,8000381c <externalInterrupt+0x70>
8000380c:	2fc000ef          	jal	ra,80003b08 <modbus_rtu_isr>
80003810:	00442783          	lw	a5,4(s0)
80003814:	ffd7f793          	andi	a5,a5,-3
80003818:	00f42223          	sw	a5,4(s0)
8000381c:	f0060437          	lui	s0,0xf0060
80003820:	00442783          	lw	a5,4(s0) # f0060004 <_heap_end+0x7004e004>
80003824:	0047f793          	andi	a5,a5,4
80003828:	00078a63          	beqz	a5,8000383c <__global_pointer$+0x4>
8000382c:	6dc010ef          	jal	ra,80004f08 <mac_rx_isr>
80003830:	00442783          	lw	a5,4(s0)
80003834:	ffb7f793          	andi	a5,a5,-5
80003838:	00f42223          	sw	a5,4(s0)
8000383c:	f00607b7          	lui	a5,0xf0060
80003840:	0047a703          	lw	a4,4(a5) # f0060004 <_heap_end+0x7004e004>
80003844:	00877713          	andi	a4,a4,8
80003848:	02070863          	beqz	a4,80003878 <__global_pointer$+0x40>
8000384c:	f0020737          	lui	a4,0xf0020
80003850:	000186b7          	lui	a3,0x18
80003854:	00072623          	sw	zero,12(a4) # f002000c <_heap_end+0x7000e00c>
80003858:	6a068693          	addi	a3,a3,1696 # 186a0 <_stack_size+0x17ea0>
8000385c:	00d72823          	sw	a3,16(a4)
80003860:	00100693          	li	a3,1
80003864:	00d72023          	sw	a3,0(a4)
80003868:	86d1ac23          	sw	a3,-1928(gp) # 800030b0 <events_mac_poll>
8000386c:	0047a703          	lw	a4,4(a5)
80003870:	ff777713          	andi	a4,a4,-9
80003874:	00e7a223          	sw	a4,4(a5)
80003878:	f00607b7          	lui	a5,0xf0060
8000387c:	0047a703          	lw	a4,4(a5) # f0060004 <_heap_end+0x7004e004>
80003880:	01077713          	andi	a4,a4,16
80003884:	02070863          	beqz	a4,800038b4 <__global_pointer$+0x7c>
80003888:	f0021737          	lui	a4,0xf0021
8000388c:	0000c6b7          	lui	a3,0xc
80003890:	00072623          	sw	zero,12(a4) # f002100c <_heap_end+0x7000f00c>
80003894:	35068693          	addi	a3,a3,848 # c350 <_stack_size+0xbb50>
80003898:	00d72823          	sw	a3,16(a4)
8000389c:	00100693          	li	a3,1
800038a0:	00d72023          	sw	a3,0(a4)
800038a4:	86d1aa23          	sw	a3,-1932(gp) # 800030ac <events_modbus_rtu_poll>
800038a8:	0047a703          	lw	a4,4(a5)
800038ac:	fef77713          	andi	a4,a4,-17
800038b0:	00e7a223          	sw	a4,4(a5)
800038b4:	f00607b7          	lui	a5,0xf0060
800038b8:	0047a703          	lw	a4,4(a5) # f0060004 <_heap_end+0x7004e004>
800038bc:	02077713          	andi	a4,a4,32
800038c0:	00070863          	beqz	a4,800038d0 <__global_pointer$+0x98>
800038c4:	0047a703          	lw	a4,4(a5)
800038c8:	fdf77713          	andi	a4,a4,-33
800038cc:	00e7a223          	sw	a4,4(a5)
800038d0:	00c12083          	lw	ra,12(sp)
800038d4:	00812403          	lw	s0,8(sp)
800038d8:	01010113          	addi	sp,sp,16
800038dc:	00008067          	ret
800038e0:	00072783          	lw	a5,0(a4)
800038e4:	0ff7f513          	andi	a0,a5,255
800038e8:	0ff7f693          	andi	a3,a5,255
800038ec:	00472783          	lw	a5,4(a4)
800038f0:	0107d793          	srli	a5,a5,0x10
800038f4:	0ff7f793          	andi	a5,a5,255
800038f8:	fe078ae3          	beqz	a5,800038ec <__global_pointer$+0xb4>
800038fc:	00d72023          	sw	a3,0(a4)
80003900:	00b51a63          	bne	a0,a1,80003914 <__global_pointer$+0xdc>
80003904:	87c1a783          	lw	a5,-1924(gp) # 800030b4 <uart_config_reset_counter>
80003908:	00178793          	addi	a5,a5,1
8000390c:	86f1ae23          	sw	a5,-1924(gp) # 800030b4 <uart_config_reset_counter>
80003910:	ed1ff06f          	j	800037e0 <externalInterrupt+0x34>
80003914:	8601ae23          	sw	zero,-1924(gp) # 800030b4 <uart_config_reset_counter>
80003918:	ec9ff06f          	j	800037e0 <externalInterrupt+0x34>

8000391c <crash>:
8000391c:	ff010113          	addi	sp,sp,-16
80003920:	00812423          	sw	s0,8(sp)
80003924:	00050593          	mv	a1,a0
80003928:	8fc18513          	addi	a0,gp,-1796 # 80003134 <crash_str>
8000392c:	00112623          	sw	ra,12(sp)
80003930:	c89ff0ef          	jal	ra,800035b8 <to_hex>
80003934:	80002537          	lui	a0,0x80002
80003938:	22050513          	addi	a0,a0,544 # 80002220 <_heap_end+0xffff0220>
8000393c:	22c020ef          	jal	ra,80005b68 <print_uart0>
80003940:	8fc18513          	addi	a0,gp,-1796 # 80003134 <crash_str>
80003944:	224020ef          	jal	ra,80005b68 <print_uart0>
80003948:	00812403          	lw	s0,8(sp)
8000394c:	00c12083          	lw	ra,12(sp)
80003950:	80003537          	lui	a0,0x80003
80003954:	80850513          	addi	a0,a0,-2040 # 80002808 <_heap_end+0xffff0808>
80003958:	01010113          	addi	sp,sp,16
8000395c:	20c0206f          	j	80005b68 <print_uart0>

80003960 <irqCallback>:
80003960:	88c1a783          	lw	a5,-1908(gp) # 800030c4 <reg_irq_counter>
80003964:	00178793          	addi	a5,a5,1
80003968:	88f1a623          	sw	a5,-1908(gp) # 800030c4 <reg_irq_counter>
8000396c:	342027f3          	csrr	a5,mcause
80003970:	0207d263          	bgez	a5,80003994 <irqCallback+0x34>
80003974:	00f7f793          	andi	a5,a5,15
80003978:	00700713          	li	a4,7
8000397c:	02e78063          	beq	a5,a4,8000399c <irqCallback+0x3c>
80003980:	00b00713          	li	a4,11
80003984:	00e79463          	bne	a5,a4,8000398c <irqCallback+0x2c>
80003988:	e25ff06f          	j	800037ac <externalInterrupt>
8000398c:	00200513          	li	a0,2
80003990:	f8dff06f          	j	8000391c <crash>
80003994:	00100513          	li	a0,1
80003998:	ff9ff06f          	j	80003990 <irqCallback+0x30>
8000399c:	00008067          	ret

800039a0 <modbus_rtu_init>:
800039a0:	fe010113          	addi	sp,sp,-32
800039a4:	00112e23          	sw	ra,28(sp)
800039a8:	00812c23          	sw	s0,24(sp)
800039ac:	f0011437          	lui	s0,0xf0011
800039b0:	00842783          	lw	a5,8(s0) # f0011008 <_heap_end+0x6ffff008>
800039b4:	9a41a583          	lw	a1,-1628(gp) # 800031dc <active_config+0x18>
800039b8:	017d8537          	lui	a0,0x17d8
800039bc:	84050513          	addi	a0,a0,-1984 # 17d7840 <_stack_size+0x17d7040>
800039c0:	00f12623          	sw	a5,12(sp)
800039c4:	0f9090ef          	jal	ra,8000d2bc <__udivsi3>
800039c8:	00500593          	li	a1,5
800039cc:	0f1090ef          	jal	ra,8000d2bc <__udivsi3>
800039d0:	fff50713          	addi	a4,a0,-1
800039d4:	00e42423          	sw	a4,8(s0)
800039d8:	00600693          	li	a3,6
800039dc:	00d42623          	sw	a3,12(s0)
800039e0:	00c12783          	lw	a5,12(sp)
800039e4:	80002537          	lui	a0,0x80002
800039e8:	00000693          	li	a3,0
800039ec:	00000613          	li	a2,0
800039f0:	00700593          	li	a1,7
800039f4:	23050513          	addi	a0,a0,560 # 80002230 <_heap_end+0xffff0230>
800039f8:	22d0a0ef          	jal	ra,8000e424 <iprintf>
800039fc:	f00b07b7          	lui	a5,0xf00b0
80003a00:	0007a603          	lw	a2,0(a5) # f00b0000 <_heap_end+0x7009e000>
80003a04:	0047a683          	lw	a3,4(a5)
80003a08:	88c1a823          	sw	a2,-1904(gp) # 800030c8 <modbus_rtu_rx_timestamp>
80003a0c:	01c12083          	lw	ra,28(sp)
80003a10:	01812403          	lw	s0,24(sp)
80003a14:	88d1aa23          	sw	a3,-1900(gp) # 800030cc <modbus_rtu_rx_timestamp+0x4>
80003a18:	8801ac23          	sw	zero,-1896(gp) # 800030d0 <modbus_rtu_rx_len>
80003a1c:	02010113          	addi	sp,sp,32
80003a20:	00008067          	ret

80003a24 <modbus_rtu_poll>:
80003a24:	ef010113          	addi	sp,sp,-272
80003a28:	10812423          	sw	s0,264(sp)
80003a2c:	8981a783          	lw	a5,-1896(gp) # 800030d0 <modbus_rtu_rx_len>
80003a30:	10112623          	sw	ra,268(sp)
80003a34:	10912223          	sw	s1,260(sp)
80003a38:	0a078e63          	beqz	a5,80003af4 <modbus_rtu_poll+0xd0>
80003a3c:	f00b07b7          	lui	a5,0xf00b0
80003a40:	0047a803          	lw	a6,4(a5) # f00b0004 <_heap_end+0x7009e004>
80003a44:	0007a783          	lw	a5,0(a5)
80003a48:	8901a503          	lw	a0,-1904(gp) # 800030c8 <modbus_rtu_rx_timestamp>
80003a4c:	8941a583          	lw	a1,-1900(gp) # 800030cc <modbus_rtu_rx_timestamp+0x4>
80003a50:	40a786b3          	sub	a3,a5,a0
80003a54:	00d7b733          	sltu	a4,a5,a3
80003a58:	40b807b3          	sub	a5,a6,a1
80003a5c:	00e79863          	bne	a5,a4,80003a6c <modbus_rtu_poll+0x48>
80003a60:	000027b7          	lui	a5,0x2
80003a64:	70f78793          	addi	a5,a5,1807 # 270f <_stack_size+0x1f0f>
80003a68:	08d7f663          	bgeu	a5,a3,80003af4 <modbus_rtu_poll+0xd0>
80003a6c:	8981a583          	lw	a1,-1896(gp) # 800030d0 <modbus_rtu_rx_len>
80003a70:	80002537          	lui	a0,0x80002
80003a74:	29050513          	addi	a0,a0,656 # 80002290 <_heap_end+0xffff0290>
80003a78:	1ad0a0ef          	jal	ra,8000e424 <iprintf>
80003a7c:	8981a483          	lw	s1,-1896(gp) # 800030d0 <modbus_rtu_rx_len>
80003a80:	08000793          	li	a5,128
80003a84:	00048613          	mv	a2,s1
80003a88:	0097f463          	bgeu	a5,s1,80003a90 <modbus_rtu_poll+0x6c>
80003a8c:	08000613          	li	a2,128
80003a90:	90c18593          	addi	a1,gp,-1780 # 80003144 <modbus_rtu_rx_buf>
80003a94:	00010513          	mv	a0,sp
80003a98:	54c0a0ef          	jal	ra,8000dfe4 <memcpy>
80003a9c:	00048593          	mv	a1,s1
80003aa0:	08010613          	addi	a2,sp,128
80003aa4:	00010513          	mv	a0,sp
80003aa8:	8801ac23          	sw	zero,-1896(gp) # 800030d0 <modbus_rtu_rx_len>
80003aac:	519000ef          	jal	ra,800047c4 <modbus_recv>
80003ab0:	00050593          	mv	a1,a0
80003ab4:	04050063          	beqz	a0,80003af4 <modbus_rtu_poll+0xd0>
80003ab8:	00000713          	li	a4,0
80003abc:	f00116b7          	lui	a3,0xf0011
80003ac0:	08010793          	addi	a5,sp,128
80003ac4:	00e787b3          	add	a5,a5,a4
80003ac8:	0007c603          	lbu	a2,0(a5)
80003acc:	0046a783          	lw	a5,4(a3) # f0011004 <_heap_end+0x6ffff004>
80003ad0:	0107d793          	srli	a5,a5,0x10
80003ad4:	0ff7f793          	andi	a5,a5,255
80003ad8:	fe078ae3          	beqz	a5,80003acc <modbus_rtu_poll+0xa8>
80003adc:	00c6a023          	sw	a2,0(a3)
80003ae0:	00170713          	addi	a4,a4,1
80003ae4:	fce59ee3          	bne	a1,a4,80003ac0 <modbus_rtu_poll+0x9c>
80003ae8:	80002537          	lui	a0,0x80002
80003aec:	2c050513          	addi	a0,a0,704 # 800022c0 <_heap_end+0xffff02c0>
80003af0:	1350a0ef          	jal	ra,8000e424 <iprintf>
80003af4:	10c12083          	lw	ra,268(sp)
80003af8:	10812403          	lw	s0,264(sp)
80003afc:	10412483          	lw	s1,260(sp)
80003b00:	11010113          	addi	sp,sp,272
80003b04:	00008067          	ret

80003b08 <modbus_rtu_isr>:
80003b08:	f7010113          	addi	sp,sp,-144
80003b0c:	08812423          	sw	s0,136(sp)
80003b10:	08912223          	sw	s1,132(sp)
80003b14:	08112623          	sw	ra,140(sp)
80003b18:	f00117b7          	lui	a5,0xf0011
80003b1c:	0007a683          	lw	a3,0(a5) # f0011000 <_heap_end+0x6ffff000>
80003b20:	8981a603          	lw	a2,-1896(gp) # 800030d0 <modbus_rtu_rx_len>
80003b24:	0ff6f693          	andi	a3,a3,255
80003b28:	00160793          	addi	a5,a2,1 # 80001 <_stack_size+0x7f801>
80003b2c:	88f1ac23          	sw	a5,-1896(gp) # 800030d0 <modbus_rtu_rx_len>
80003b30:	90c18713          	addi	a4,gp,-1780 # 80003144 <modbus_rtu_rx_buf>
80003b34:	00c70733          	add	a4,a4,a2
80003b38:	00d70023          	sb	a3,0(a4)
80003b3c:	8981a683          	lw	a3,-1896(gp) # 800030d0 <modbus_rtu_rx_len>
80003b40:	07f00713          	li	a4,127
80003b44:	90c18493          	addi	s1,gp,-1780 # 80003144 <modbus_rtu_rx_buf>
80003b48:	00d77463          	bgeu	a4,a3,80003b50 <modbus_rtu_isr+0x48>
80003b4c:	8801ac23          	sw	zero,-1896(gp) # 800030d0 <modbus_rtu_rx_len>
80003b50:	f0011737          	lui	a4,0xf0011
80003b54:	00472783          	lw	a5,4(a4) # f0011004 <_heap_end+0x6ffff004>
80003b58:	0187d793          	srli	a5,a5,0x18
80003b5c:	04078063          	beqz	a5,80003b9c <modbus_rtu_isr+0x94>
80003b60:	00472683          	lw	a3,4(a4)
80003b64:	8981a703          	lw	a4,-1896(gp) # 800030d0 <modbus_rtu_rx_len>
80003b68:	80002637          	lui	a2,0x80002
80003b6c:	0186d693          	srli	a3,a3,0x18
80003b70:	2f060613          	addi	a2,a2,752 # 800022f0 <_heap_end+0xffff02f0>
80003b74:	08000593          	li	a1,128
80003b78:	00010513          	mv	a0,sp
80003b7c:	2150a0ef          	jal	ra,8000e590 <sniprintf>
80003b80:	00010513          	mv	a0,sp
80003b84:	7e5010ef          	jal	ra,80005b68 <print_uart0>
80003b88:	f00116b7          	lui	a3,0xf0011
80003b8c:	07f00613          	li	a2,127
80003b90:	0046a783          	lw	a5,4(a3) # f0011004 <_heap_end+0x6ffff004>
80003b94:	0187d793          	srli	a5,a5,0x18
80003b98:	02079663          	bnez	a5,80003bc4 <modbus_rtu_isr+0xbc>
80003b9c:	f00b07b7          	lui	a5,0xf00b0
80003ba0:	0007a603          	lw	a2,0(a5) # f00b0000 <_heap_end+0x7009e000>
80003ba4:	0047a683          	lw	a3,4(a5)
80003ba8:	08c12083          	lw	ra,140(sp)
80003bac:	08812403          	lw	s0,136(sp)
80003bb0:	88c1a823          	sw	a2,-1904(gp) # 800030c8 <modbus_rtu_rx_timestamp>
80003bb4:	88d1aa23          	sw	a3,-1900(gp) # 800030cc <modbus_rtu_rx_timestamp+0x4>
80003bb8:	08412483          	lw	s1,132(sp)
80003bbc:	09010113          	addi	sp,sp,144
80003bc0:	00008067          	ret
80003bc4:	0006a703          	lw	a4,0(a3)
80003bc8:	8981a783          	lw	a5,-1896(gp) # 800030d0 <modbus_rtu_rx_len>
80003bcc:	0ff77713          	andi	a4,a4,255
80003bd0:	00178593          	addi	a1,a5,1
80003bd4:	88b1ac23          	sw	a1,-1896(gp) # 800030d0 <modbus_rtu_rx_len>
80003bd8:	00f487b3          	add	a5,s1,a5
80003bdc:	00e78023          	sb	a4,0(a5)
80003be0:	8981a783          	lw	a5,-1896(gp) # 800030d0 <modbus_rtu_rx_len>
80003be4:	faf676e3          	bgeu	a2,a5,80003b90 <modbus_rtu_isr+0x88>
80003be8:	8801ac23          	sw	zero,-1896(gp) # 800030d0 <modbus_rtu_rx_len>
80003bec:	fa5ff06f          	j	80003b90 <modbus_rtu_isr+0x88>

80003bf0 <config_load>:
80003bf0:	0c050863          	beqz	a0,80003cc0 <config_load+0xd0>
80003bf4:	fe010113          	addi	sp,sp,-32
80003bf8:	00812c23          	sw	s0,24(sp)
80003bfc:	00912a23          	sw	s1,20(sp)
80003c00:	01212823          	sw	s2,16(sp)
80003c04:	01312623          	sw	s3,12(sp)
80003c08:	00112e23          	sw	ra,28(sp)
80003c0c:	00050413          	mv	s0,a0
80003c10:	00050913          	mv	s2,a0
80003c14:	00000493          	li	s1,0
80003c18:	02000993          	li	s3,32
80003c1c:	00090713          	mv	a4,s2
80003c20:	00400693          	li	a3,4
80003c24:	00048613          	mv	a2,s1
80003c28:	05000593          	li	a1,80
80003c2c:	f0090537          	lui	a0,0xf0090
80003c30:	3fc000ef          	jal	ra,8000402c <eeprom_read_page>
80003c34:	00400793          	li	a5,4
80003c38:	02f50a63          	beq	a0,a5,80003c6c <config_load+0x7c>
80003c3c:	80002537          	lui	a0,0x80002
80003c40:	00400593          	li	a1,4
80003c44:	32850513          	addi	a0,a0,808 # 80002328 <_heap_end+0xffff0328>
80003c48:	7dc0a0ef          	jal	ra,8000e424 <iprintf>
80003c4c:	ffe00513          	li	a0,-2
80003c50:	01c12083          	lw	ra,28(sp)
80003c54:	01812403          	lw	s0,24(sp)
80003c58:	01412483          	lw	s1,20(sp)
80003c5c:	01012903          	lw	s2,16(sp)
80003c60:	00c12983          	lw	s3,12(sp)
80003c64:	02010113          	addi	sp,sp,32
80003c68:	00008067          	ret
80003c6c:	00448493          	addi	s1,s1,4
80003c70:	0ff4f493          	andi	s1,s1,255
80003c74:	00490913          	addi	s2,s2,4
80003c78:	fb3492e3          	bne	s1,s3,80003c1c <config_load+0x2c>
80003c7c:	01e00593          	li	a1,30
80003c80:	00040513          	mv	a0,s0
80003c84:	861ff0ef          	jal	ra,800034e4 <crc16>
80003c88:	01e45603          	lhu	a2,30(s0)
80003c8c:	00050593          	mv	a1,a0
80003c90:	00a60c63          	beq	a2,a0,80003ca8 <config_load+0xb8>
80003c94:	80002537          	lui	a0,0x80002
80003c98:	35c50513          	addi	a0,a0,860 # 8000235c <_heap_end+0xffff035c>
80003c9c:	7880a0ef          	jal	ra,8000e424 <iprintf>
80003ca0:	ffd00513          	li	a0,-3
80003ca4:	fadff06f          	j	80003c50 <config_load+0x60>
80003ca8:	80002537          	lui	a0,0x80002
80003cac:	02000593          	li	a1,32
80003cb0:	39050513          	addi	a0,a0,912 # 80002390 <_heap_end+0xffff0390>
80003cb4:	7700a0ef          	jal	ra,8000e424 <iprintf>
80003cb8:	00000513          	li	a0,0
80003cbc:	f95ff06f          	j	80003c50 <config_load+0x60>
80003cc0:	fff00513          	li	a0,-1
80003cc4:	00008067          	ret

80003cc8 <config_save>:
80003cc8:	fe010113          	addi	sp,sp,-32
80003ccc:	00912a23          	sw	s1,20(sp)
80003cd0:	00112e23          	sw	ra,28(sp)
80003cd4:	00812c23          	sw	s0,24(sp)
80003cd8:	01212823          	sw	s2,16(sp)
80003cdc:	01312623          	sw	s3,12(sp)
80003ce0:	01412423          	sw	s4,8(sp)
80003ce4:	01512223          	sw	s5,4(sp)
80003ce8:	fff00493          	li	s1,-1
80003cec:	06050063          	beqz	a0,80003d4c <config_save+0x84>
80003cf0:	01e00593          	li	a1,30
80003cf4:	00050413          	mv	s0,a0
80003cf8:	fecff0ef          	jal	ra,800034e4 <crc16>
80003cfc:	00a41f23          	sh	a0,30(s0)
80003d00:	00000913          	li	s2,0
80003d04:	00000993          	li	s3,0
80003d08:	00800a93          	li	s5,8
80003d0c:	01240733          	add	a4,s0,s2
80003d10:	00400693          	li	a3,4
80003d14:	0ff97613          	andi	a2,s2,255
80003d18:	05000593          	li	a1,80
80003d1c:	f0090537          	lui	a0,0xf0090
80003d20:	0b8000ef          	jal	ra,80003dd8 <eeprom_write_page>
80003d24:	00400793          	li	a5,4
80003d28:	04f50663          	beq	a0,a5,80003d74 <config_save+0xac>
80003d2c:	80002537          	lui	a0,0x80002
80003d30:	00090713          	mv	a4,s2
80003d34:	00098693          	mv	a3,s3
80003d38:	00400613          	li	a2,4
80003d3c:	05000593          	li	a1,80
80003d40:	3c850513          	addi	a0,a0,968 # 800023c8 <_heap_end+0xffff03c8>
80003d44:	6e00a0ef          	jal	ra,8000e424 <iprintf>
80003d48:	ffe00493          	li	s1,-2
80003d4c:	01c12083          	lw	ra,28(sp)
80003d50:	01812403          	lw	s0,24(sp)
80003d54:	00048513          	mv	a0,s1
80003d58:	01012903          	lw	s2,16(sp)
80003d5c:	01412483          	lw	s1,20(sp)
80003d60:	00c12983          	lw	s3,12(sp)
80003d64:	00812a03          	lw	s4,8(sp)
80003d68:	00412a83          	lw	s5,4(sp)
80003d6c:	02010113          	addi	sp,sp,32
80003d70:	00008067          	ret
80003d74:	00a00a13          	li	s4,10
80003d78:	05000593          	li	a1,80
80003d7c:	f0090537          	lui	a0,0xf0090
80003d80:	228000ef          	jal	ra,80003fa8 <eeprom_poll>
80003d84:	00050493          	mv	s1,a0
80003d88:	02050663          	beqz	a0,80003db4 <config_save+0xec>
80003d8c:	3e800513          	li	a0,1000
80003d90:	fffa0a13          	addi	s4,s4,-1 # 8fffffff <_heap_end+0xffedfff>
80003d94:	5a5010ef          	jal	ra,80005b38 <delay_us>
80003d98:	fe0a10e3          	bnez	s4,80003d78 <config_save+0xb0>
80003d9c:	80002537          	lui	a0,0x80002
80003da0:	05000593          	li	a1,80
80003da4:	44850513          	addi	a0,a0,1096 # 80002448 <_heap_end+0xffff0448>
80003da8:	67c0a0ef          	jal	ra,8000e424 <iprintf>
80003dac:	ffd00493          	li	s1,-3
80003db0:	f9dff06f          	j	80003d4c <config_save+0x84>
80003db4:	00198993          	addi	s3,s3,1 # 40001 <_stack_size+0x3f801>
80003db8:	00490913          	addi	s2,s2,4
80003dbc:	f55998e3          	bne	s3,s5,80003d0c <config_save+0x44>
80003dc0:	01e45603          	lhu	a2,30(s0)
80003dc4:	80002537          	lui	a0,0x80002
80003dc8:	02000593          	li	a1,32
80003dcc:	41050513          	addi	a0,a0,1040 # 80002410 <_heap_end+0xffff0410>
80003dd0:	6540a0ef          	jal	ra,8000e424 <iprintf>
80003dd4:	f79ff06f          	j	80003d4c <config_save+0x84>

80003dd8 <eeprom_write_page>:
80003dd8:	fe010113          	addi	sp,sp,-32
80003ddc:	00812c23          	sw	s0,24(sp)
80003de0:	00912a23          	sw	s1,20(sp)
80003de4:	01212823          	sw	s2,16(sp)
80003de8:	01412423          	sw	s4,8(sp)
80003dec:	01512223          	sw	s5,4(sp)
80003df0:	00112e23          	sw	ra,28(sp)
80003df4:	01312623          	sw	s3,12(sp)
80003df8:	01612023          	sw	s6,0(sp)
80003dfc:	01500793          	li	a5,21
80003e00:	00159593          	slli	a1,a1,0x1
80003e04:	00f52623          	sw	a5,12(a0)
80003e08:	00018937          	lui	s2,0x18
80003e0c:	00b52023          	sw	a1,0(a0)
80003e10:	6a090593          	addi	a1,s2,1696 # 186a0 <_stack_size+0x17ea0>
80003e14:	00050413          	mv	s0,a0
80003e18:	00060493          	mv	s1,a2
80003e1c:	00068a13          	mv	s4,a3
80003e20:	00070a93          	mv	s5,a4
80003e24:	48d010ef          	jal	ra,80005ab0 <i2c_wait_for_busy>
80003e28:	04051663          	bnez	a0,80003e74 <eeprom_write_page+0x9c>
80003e2c:	00042623          	sw	zero,12(s0)
80003e30:	00100613          	li	a2,1
80003e34:	80002537          	lui	a0,0x80002
80003e38:	00040593          	mv	a1,s0
80003e3c:	47850513          	addi	a0,a0,1144 # 80002478 <_heap_end+0xffff0478>
80003e40:	5e40a0ef          	jal	ra,8000e424 <iprintf>
80003e44:	fff00493          	li	s1,-1
80003e48:	01c12083          	lw	ra,28(sp)
80003e4c:	01812403          	lw	s0,24(sp)
80003e50:	00048513          	mv	a0,s1
80003e54:	01012903          	lw	s2,16(sp)
80003e58:	01412483          	lw	s1,20(sp)
80003e5c:	00c12983          	lw	s3,12(sp)
80003e60:	00812a03          	lw	s4,8(sp)
80003e64:	00412a83          	lw	s5,4(sp)
80003e68:	00012b03          	lw	s6,0(sp)
80003e6c:	02010113          	addi	sp,sp,32
80003e70:	00008067          	ret
80003e74:	6a090593          	addi	a1,s2,1696
80003e78:	00040513          	mv	a0,s0
80003e7c:	461010ef          	jal	ra,80005adc <i2c_wait_for_release>
80003e80:	00051863          	bnez	a0,80003e90 <eeprom_write_page+0xb8>
80003e84:	00042623          	sw	zero,12(s0)
80003e88:	00200613          	li	a2,2
80003e8c:	fa9ff06f          	j	80003e34 <eeprom_write_page+0x5c>
80003e90:	00c42783          	lw	a5,12(s0)
80003e94:	0407f793          	andi	a5,a5,64
80003e98:	00078e63          	beqz	a5,80003eb4 <eeprom_write_page+0xdc>
80003e9c:	00042623          	sw	zero,12(s0)
80003ea0:	00100613          	li	a2,1
80003ea4:	80002537          	lui	a0,0x80002
80003ea8:	00040593          	mv	a1,s0
80003eac:	4a850513          	addi	a0,a0,1192 # 800024a8 <_heap_end+0xffff04a8>
80003eb0:	f91ff06f          	j	80003e40 <eeprom_write_page+0x68>
80003eb4:	00200513          	li	a0,2
80003eb8:	481010ef          	jal	ra,80005b38 <delay_us>
80003ebc:	01100793          	li	a5,17
80003ec0:	00f42623          	sw	a5,12(s0)
80003ec4:	00942023          	sw	s1,0(s0)
80003ec8:	6a090593          	addi	a1,s2,1696
80003ecc:	00040513          	mv	a0,s0
80003ed0:	3e1010ef          	jal	ra,80005ab0 <i2c_wait_for_busy>
80003ed4:	00051863          	bnez	a0,80003ee4 <eeprom_write_page+0x10c>
80003ed8:	00042623          	sw	zero,12(s0)
80003edc:	00300613          	li	a2,3
80003ee0:	f55ff06f          	j	80003e34 <eeprom_write_page+0x5c>
80003ee4:	6a090593          	addi	a1,s2,1696
80003ee8:	00040513          	mv	a0,s0
80003eec:	3f1010ef          	jal	ra,80005adc <i2c_wait_for_release>
80003ef0:	00051863          	bnez	a0,80003f00 <eeprom_write_page+0x128>
80003ef4:	00042623          	sw	zero,12(s0)
80003ef8:	00400613          	li	a2,4
80003efc:	f39ff06f          	j	80003e34 <eeprom_write_page+0x5c>
80003f00:	00c42783          	lw	a5,12(s0)
80003f04:	00000993          	li	s3,0
80003f08:	0407f793          	andi	a5,a5,64
80003f0c:	04079a63          	bnez	a5,80003f60 <eeprom_write_page+0x188>
80003f10:	000a0493          	mv	s1,s4
80003f14:	fffa0b13          	addi	s6,s4,-1
80003f18:	6a090913          	addi	s2,s2,1696
80003f1c:	f349d6e3          	bge	s3,s4,80003e48 <eeprom_write_page+0x70>
80003f20:	00200513          	li	a0,2
80003f24:	415010ef          	jal	ra,80005b38 <delay_us>
80003f28:	01100793          	li	a5,17
80003f2c:	013b1463          	bne	s6,s3,80003f34 <eeprom_write_page+0x15c>
80003f30:	01900793          	li	a5,25
80003f34:	013a8733          	add	a4,s5,s3
80003f38:	00074703          	lbu	a4,0(a4)
80003f3c:	00f42623          	sw	a5,12(s0)
80003f40:	00090593          	mv	a1,s2
80003f44:	00e42023          	sw	a4,0(s0)
80003f48:	00040513          	mv	a0,s0
80003f4c:	365010ef          	jal	ra,80005ab0 <i2c_wait_for_busy>
80003f50:	00051e63          	bnez	a0,80003f6c <eeprom_write_page+0x194>
80003f54:	00042623          	sw	zero,12(s0)
80003f58:	00500613          	li	a2,5
80003f5c:	ed9ff06f          	j	80003e34 <eeprom_write_page+0x5c>
80003f60:	00042623          	sw	zero,12(s0)
80003f64:	00200613          	li	a2,2
80003f68:	f3dff06f          	j	80003ea4 <eeprom_write_page+0xcc>
80003f6c:	00090593          	mv	a1,s2
80003f70:	00040513          	mv	a0,s0
80003f74:	369010ef          	jal	ra,80005adc <i2c_wait_for_release>
80003f78:	00051863          	bnez	a0,80003f88 <eeprom_write_page+0x1b0>
80003f7c:	00042623          	sw	zero,12(s0)
80003f80:	00600613          	li	a2,6
80003f84:	eb1ff06f          	j	80003e34 <eeprom_write_page+0x5c>
80003f88:	00c42783          	lw	a5,12(s0)
80003f8c:	0407f793          	andi	a5,a5,64
80003f90:	00078863          	beqz	a5,80003fa0 <eeprom_write_page+0x1c8>
80003f94:	00042623          	sw	zero,12(s0)
80003f98:	00300613          	li	a2,3
80003f9c:	f09ff06f          	j	80003ea4 <eeprom_write_page+0xcc>
80003fa0:	00198993          	addi	s3,s3,1
80003fa4:	f79ff06f          	j	80003f1c <eeprom_write_page+0x144>

80003fa8 <eeprom_poll>:
80003fa8:	ff010113          	addi	sp,sp,-16
80003fac:	00812423          	sw	s0,8(sp)
80003fb0:	00912223          	sw	s1,4(sp)
80003fb4:	00112623          	sw	ra,12(sp)
80003fb8:	01d00793          	li	a5,29
80003fbc:	00159593          	slli	a1,a1,0x1
80003fc0:	00f52623          	sw	a5,12(a0)
80003fc4:	000184b7          	lui	s1,0x18
80003fc8:	00b52023          	sw	a1,0(a0)
80003fcc:	6a048593          	addi	a1,s1,1696 # 186a0 <_stack_size+0x17ea0>
80003fd0:	00050413          	mv	s0,a0
80003fd4:	2dd010ef          	jal	ra,80005ab0 <i2c_wait_for_busy>
80003fd8:	00100613          	li	a2,1
80003fdc:	00050c63          	beqz	a0,80003ff4 <eeprom_poll+0x4c>
80003fe0:	6a048593          	addi	a1,s1,1696
80003fe4:	00040513          	mv	a0,s0
80003fe8:	2f5010ef          	jal	ra,80005adc <i2c_wait_for_release>
80003fec:	02051863          	bnez	a0,8000401c <eeprom_poll+0x74>
80003ff0:	00200613          	li	a2,2
80003ff4:	80002537          	lui	a0,0x80002
80003ff8:	00040593          	mv	a1,s0
80003ffc:	4d850513          	addi	a0,a0,1240 # 800024d8 <_heap_end+0xffff04d8>
80004000:	4240a0ef          	jal	ra,8000e424 <iprintf>
80004004:	fff00513          	li	a0,-1
80004008:	00c12083          	lw	ra,12(sp)
8000400c:	00812403          	lw	s0,8(sp)
80004010:	00412483          	lw	s1,4(sp)
80004014:	01010113          	addi	sp,sp,16
80004018:	00008067          	ret
8000401c:	00c42503          	lw	a0,12(s0)
80004020:	00655513          	srli	a0,a0,0x6
80004024:	00157513          	andi	a0,a0,1
80004028:	fe1ff06f          	j	80004008 <eeprom_poll+0x60>

8000402c <eeprom_read_page>:
8000402c:	fd010113          	addi	sp,sp,-48
80004030:	02812423          	sw	s0,40(sp)
80004034:	02912223          	sw	s1,36(sp)
80004038:	03212023          	sw	s2,32(sp)
8000403c:	01312e23          	sw	s3,28(sp)
80004040:	01412c23          	sw	s4,24(sp)
80004044:	01512a23          	sw	s5,20(sp)
80004048:	01612823          	sw	s6,16(sp)
8000404c:	02112623          	sw	ra,44(sp)
80004050:	01712623          	sw	s7,12(sp)
80004054:	01500993          	li	s3,21
80004058:	00159493          	slli	s1,a1,0x1
8000405c:	01352623          	sw	s3,12(a0)
80004060:	00018937          	lui	s2,0x18
80004064:	00952023          	sw	s1,0(a0)
80004068:	6a090593          	addi	a1,s2,1696 # 186a0 <_stack_size+0x17ea0>
8000406c:	00050413          	mv	s0,a0
80004070:	00060b13          	mv	s6,a2
80004074:	00068a13          	mv	s4,a3
80004078:	00070a93          	mv	s5,a4
8000407c:	235010ef          	jal	ra,80005ab0 <i2c_wait_for_busy>
80004080:	00051e63          	bnez	a0,8000409c <eeprom_read_page+0x70>
80004084:	00042623          	sw	zero,12(s0)
80004088:	00100613          	li	a2,1
8000408c:	80002537          	lui	a0,0x80002
80004090:	00040593          	mv	a1,s0
80004094:	50050513          	addi	a0,a0,1280 # 80002500 <_heap_end+0xffff0500>
80004098:	0400006f          	j	800040d8 <eeprom_read_page+0xac>
8000409c:	6a090593          	addi	a1,s2,1696
800040a0:	00040513          	mv	a0,s0
800040a4:	239010ef          	jal	ra,80005adc <i2c_wait_for_release>
800040a8:	00051863          	bnez	a0,800040b8 <eeprom_read_page+0x8c>
800040ac:	00042623          	sw	zero,12(s0)
800040b0:	00200613          	li	a2,2
800040b4:	fd9ff06f          	j	8000408c <eeprom_read_page+0x60>
800040b8:	00c42783          	lw	a5,12(s0)
800040bc:	0407f793          	andi	a5,a5,64
800040c0:	04078863          	beqz	a5,80004110 <eeprom_read_page+0xe4>
800040c4:	00042623          	sw	zero,12(s0)
800040c8:	00100613          	li	a2,1
800040cc:	80002537          	lui	a0,0x80002
800040d0:	00040593          	mv	a1,s0
800040d4:	53050513          	addi	a0,a0,1328 # 80002530 <_heap_end+0xffff0530>
800040d8:	34c0a0ef          	jal	ra,8000e424 <iprintf>
800040dc:	fff00493          	li	s1,-1
800040e0:	02c12083          	lw	ra,44(sp)
800040e4:	02812403          	lw	s0,40(sp)
800040e8:	00048513          	mv	a0,s1
800040ec:	02012903          	lw	s2,32(sp)
800040f0:	02412483          	lw	s1,36(sp)
800040f4:	01c12983          	lw	s3,28(sp)
800040f8:	01812a03          	lw	s4,24(sp)
800040fc:	01412a83          	lw	s5,20(sp)
80004100:	01012b03          	lw	s6,16(sp)
80004104:	00c12b83          	lw	s7,12(sp)
80004108:	03010113          	addi	sp,sp,48
8000410c:	00008067          	ret
80004110:	00200513          	li	a0,2
80004114:	225010ef          	jal	ra,80005b38 <delay_us>
80004118:	01900793          	li	a5,25
8000411c:	00f42623          	sw	a5,12(s0)
80004120:	01642023          	sw	s6,0(s0)
80004124:	6a090593          	addi	a1,s2,1696
80004128:	00040513          	mv	a0,s0
8000412c:	185010ef          	jal	ra,80005ab0 <i2c_wait_for_busy>
80004130:	00051863          	bnez	a0,80004140 <eeprom_read_page+0x114>
80004134:	00042623          	sw	zero,12(s0)
80004138:	00300613          	li	a2,3
8000413c:	f51ff06f          	j	8000408c <eeprom_read_page+0x60>
80004140:	6a090593          	addi	a1,s2,1696
80004144:	00040513          	mv	a0,s0
80004148:	195010ef          	jal	ra,80005adc <i2c_wait_for_release>
8000414c:	00051863          	bnez	a0,8000415c <eeprom_read_page+0x130>
80004150:	00042623          	sw	zero,12(s0)
80004154:	00400613          	li	a2,4
80004158:	f35ff06f          	j	8000408c <eeprom_read_page+0x60>
8000415c:	00c42783          	lw	a5,12(s0)
80004160:	0407f793          	andi	a5,a5,64
80004164:	00078863          	beqz	a5,80004174 <eeprom_read_page+0x148>
80004168:	00042623          	sw	zero,12(s0)
8000416c:	00200613          	li	a2,2
80004170:	f5dff06f          	j	800040cc <eeprom_read_page+0xa0>
80004174:	00200513          	li	a0,2
80004178:	1c1010ef          	jal	ra,80005b38 <delay_us>
8000417c:	0014e493          	ori	s1,s1,1
80004180:	01342623          	sw	s3,12(s0)
80004184:	00942023          	sw	s1,0(s0)
80004188:	6a090593          	addi	a1,s2,1696
8000418c:	00040513          	mv	a0,s0
80004190:	121010ef          	jal	ra,80005ab0 <i2c_wait_for_busy>
80004194:	00051863          	bnez	a0,800041a4 <eeprom_read_page+0x178>
80004198:	00042623          	sw	zero,12(s0)
8000419c:	00500613          	li	a2,5
800041a0:	eedff06f          	j	8000408c <eeprom_read_page+0x60>
800041a4:	6a090593          	addi	a1,s2,1696
800041a8:	00040513          	mv	a0,s0
800041ac:	131010ef          	jal	ra,80005adc <i2c_wait_for_release>
800041b0:	00051863          	bnez	a0,800041c0 <eeprom_read_page+0x194>
800041b4:	00042623          	sw	zero,12(s0)
800041b8:	00600613          	li	a2,6
800041bc:	ed1ff06f          	j	8000408c <eeprom_read_page+0x60>
800041c0:	00c42783          	lw	a5,12(s0)
800041c4:	00000993          	li	s3,0
800041c8:	0407f793          	andi	a5,a5,64
800041cc:	04079863          	bnez	a5,8000421c <eeprom_read_page+0x1f0>
800041d0:	000a0493          	mv	s1,s4
800041d4:	fffa0b13          	addi	s6,s4,-1
800041d8:	0ff00b93          	li	s7,255
800041dc:	6a090913          	addi	s2,s2,1696
800041e0:	f149d0e3          	bge	s3,s4,800040e0 <eeprom_read_page+0xb4>
800041e4:	00200513          	li	a0,2
800041e8:	151010ef          	jal	ra,80005b38 <delay_us>
800041ec:	02100793          	li	a5,33
800041f0:	013b1463          	bne	s6,s3,800041f8 <eeprom_read_page+0x1cc>
800041f4:	00900793          	li	a5,9
800041f8:	00f42623          	sw	a5,12(s0)
800041fc:	01742023          	sw	s7,0(s0)
80004200:	00090593          	mv	a1,s2
80004204:	00040513          	mv	a0,s0
80004208:	0a9010ef          	jal	ra,80005ab0 <i2c_wait_for_busy>
8000420c:	00051e63          	bnez	a0,80004228 <eeprom_read_page+0x1fc>
80004210:	00042623          	sw	zero,12(s0)
80004214:	00700613          	li	a2,7
80004218:	e75ff06f          	j	8000408c <eeprom_read_page+0x60>
8000421c:	00042623          	sw	zero,12(s0)
80004220:	00300613          	li	a2,3
80004224:	ea9ff06f          	j	800040cc <eeprom_read_page+0xa0>
80004228:	00090593          	mv	a1,s2
8000422c:	00040513          	mv	a0,s0
80004230:	0ad010ef          	jal	ra,80005adc <i2c_wait_for_release>
80004234:	00051863          	bnez	a0,80004244 <eeprom_read_page+0x218>
80004238:	00042623          	sw	zero,12(s0)
8000423c:	00800613          	li	a2,8
80004240:	e4dff06f          	j	8000408c <eeprom_read_page+0x60>
80004244:	00442703          	lw	a4,4(s0)
80004248:	013a87b3          	add	a5,s5,s3
8000424c:	00198993          	addi	s3,s3,1
80004250:	00e78023          	sb	a4,0(a5)
80004254:	f8dff06f          	j	800041e0 <eeprom_read_page+0x1b4>

80004258 <eeprom_probe>:
80004258:	fe010113          	addi	sp,sp,-32
8000425c:	00912a23          	sw	s1,20(sp)
80004260:	00050493          	mv	s1,a0
80004264:	80002537          	lui	a0,0x80002
80004268:	05000593          	li	a1,80
8000426c:	55c50513          	addi	a0,a0,1372 # 8000255c <_heap_end+0xffff055c>
80004270:	00112e23          	sw	ra,28(sp)
80004274:	01212823          	sw	s2,16(sp)
80004278:	00812c23          	sw	s0,24(sp)
8000427c:	1a80a0ef          	jal	ra,8000e424 <iprintf>
80004280:	deadc7b7          	lui	a5,0xdeadc
80004284:	eef78793          	addi	a5,a5,-273 # deadbeef <_heap_end+0x5eac9eef>
80004288:	00c10713          	addi	a4,sp,12
8000428c:	00400693          	li	a3,4
80004290:	07c00613          	li	a2,124
80004294:	05000593          	li	a1,80
80004298:	00048513          	mv	a0,s1
8000429c:	00f12623          	sw	a5,12(sp)
800042a0:	b39ff0ef          	jal	ra,80003dd8 <eeprom_write_page>
800042a4:	00400793          	li	a5,4
800042a8:	00a00913          	li	s2,10
800042ac:	00f50c63          	beq	a0,a5,800042c4 <eeprom_probe+0x6c>
800042b0:	80002537          	lui	a0,0x80002
800042b4:	05000593          	li	a1,80
800042b8:	57850513          	addi	a0,a0,1400 # 80002578 <_heap_end+0xffff0578>
800042bc:	1680a0ef          	jal	ra,8000e424 <iprintf>
800042c0:	0580006f          	j	80004318 <eeprom_probe+0xc0>
800042c4:	05000593          	li	a1,80
800042c8:	00048513          	mv	a0,s1
800042cc:	cddff0ef          	jal	ra,80003fa8 <eeprom_poll>
800042d0:	00050413          	mv	s0,a0
800042d4:	06050a63          	beqz	a0,80004348 <eeprom_probe+0xf0>
800042d8:	3e800513          	li	a0,1000
800042dc:	fff90913          	addi	s2,s2,-1
800042e0:	059010ef          	jal	ra,80005b38 <delay_us>
800042e4:	fe0910e3          	bnez	s2,800042c4 <eeprom_probe+0x6c>
800042e8:	80002537          	lui	a0,0x80002
800042ec:	05000593          	li	a1,80
800042f0:	61c50513          	addi	a0,a0,1564 # 8000261c <_heap_end+0xffff061c>
800042f4:	fc9ff06f          	j	800042bc <eeprom_probe+0x64>
800042f8:	00c12603          	lw	a2,12(sp)
800042fc:	deadc7b7          	lui	a5,0xdeadc
80004300:	eef78793          	addi	a5,a5,-273 # deadbeef <_heap_end+0x5eac9eef>
80004304:	05000593          	li	a1,80
80004308:	00f60c63          	beq	a2,a5,80004320 <eeprom_probe+0xc8>
8000430c:	80002537          	lui	a0,0x80002
80004310:	5d050513          	addi	a0,a0,1488 # 800025d0 <_heap_end+0xffff05d0>
80004314:	1100a0ef          	jal	ra,8000e424 <iprintf>
80004318:	fff00413          	li	s0,-1
8000431c:	0100006f          	j	8000432c <eeprom_probe+0xd4>
80004320:	80002537          	lui	a0,0x80002
80004324:	60450513          	addi	a0,a0,1540 # 80002604 <_heap_end+0xffff0604>
80004328:	0fc0a0ef          	jal	ra,8000e424 <iprintf>
8000432c:	00040513          	mv	a0,s0
80004330:	01c12083          	lw	ra,28(sp)
80004334:	01812403          	lw	s0,24(sp)
80004338:	01412483          	lw	s1,20(sp)
8000433c:	01012903          	lw	s2,16(sp)
80004340:	02010113          	addi	sp,sp,32
80004344:	00008067          	ret
80004348:	00c10713          	addi	a4,sp,12
8000434c:	00400693          	li	a3,4
80004350:	07c00613          	li	a2,124
80004354:	05000593          	li	a1,80
80004358:	00048513          	mv	a0,s1
8000435c:	00012623          	sw	zero,12(sp)
80004360:	ccdff0ef          	jal	ra,8000402c <eeprom_read_page>
80004364:	00400793          	li	a5,4
80004368:	f8f508e3          	beq	a0,a5,800042f8 <eeprom_probe+0xa0>
8000436c:	80002537          	lui	a0,0x80002
80004370:	05000593          	li	a1,80
80004374:	5a450513          	addi	a0,a0,1444 # 800025a4 <_heap_end+0xffff05a4>
80004378:	f45ff06f          	j	800042bc <eeprom_probe+0x64>

8000437c <modbus_error>:
8000437c:	ff010113          	addi	sp,sp,-16
80004380:	00812423          	sw	s0,8(sp)
80004384:	00912223          	sw	s1,4(sp)
80004388:	01212023          	sw	s2,0(sp)
8000438c:	00060413          	mv	s0,a2
80004390:	00058913          	mv	s2,a1
80004394:	00058613          	mv	a2,a1
80004398:	00050493          	mv	s1,a0
8000439c:	00050593          	mv	a1,a0
800043a0:	80002537          	lui	a0,0x80002
800043a4:	69050513          	addi	a0,a0,1680 # 80002690 <_heap_end+0xffff0690>
800043a8:	00112623          	sw	ra,12(sp)
800043ac:	0780a0ef          	jal	ra,8000e424 <iprintf>
800043b0:	9a01c783          	lbu	a5,-1632(gp) # 800031d8 <active_config+0x14>
800043b4:	f804e493          	ori	s1,s1,-128
800043b8:	009400a3          	sb	s1,1(s0)
800043bc:	01240123          	sb	s2,2(s0)
800043c0:	00040513          	mv	a0,s0
800043c4:	00f40023          	sb	a5,0(s0)
800043c8:	00300593          	li	a1,3
800043cc:	970ff0ef          	jal	ra,8000353c <add_crc>
800043d0:	00c12083          	lw	ra,12(sp)
800043d4:	00812403          	lw	s0,8(sp)
800043d8:	00412483          	lw	s1,4(sp)
800043dc:	00012903          	lw	s2,0(sp)
800043e0:	00500513          	li	a0,5
800043e4:	01010113          	addi	sp,sp,16
800043e8:	00008067          	ret

800043ec <modbus_store_reg>:
800043ec:	fd850793          	addi	a5,a0,-40
800043f0:	fd010113          	addi	sp,sp,-48
800043f4:	01079793          	slli	a5,a5,0x10
800043f8:	02912223          	sw	s1,36(sp)
800043fc:	02112623          	sw	ra,44(sp)
80004400:	02812423          	sw	s0,40(sp)
80004404:	0107d793          	srli	a5,a5,0x10
80004408:	00900713          	li	a4,9
8000440c:	00058493          	mv	s1,a1
80004410:	02f76063          	bltu	a4,a5,80004430 <modbus_store_reg+0x44>
80004414:	8801a783          	lw	a5,-1920(gp) # 800030b8 <reg_config_write>
80004418:	00079c63          	bnez	a5,80004430 <modbus_store_reg+0x44>
8000441c:	80002537          	lui	a0,0x80002
80004420:	6b450513          	addi	a0,a0,1716 # 800026b4 <_heap_end+0xffff06b4>
80004424:	0000a0ef          	jal	ra,8000e424 <iprintf>
80004428:	ffe00413          	li	s0,-2
8000442c:	0300006f          	j	8000445c <modbus_store_reg+0x70>
80004430:	02f00793          	li	a5,47
80004434:	34f50e63          	beq	a0,a5,80004790 <modbus_store_reg+0x3a4>
80004438:	0aa7e063          	bltu	a5,a0,800044d8 <modbus_store_reg+0xec>
8000443c:	02a00793          	li	a5,42
80004440:	2ef50863          	beq	a0,a5,80004730 <modbus_store_reg+0x344>
80004444:	02a7e863          	bltu	a5,a0,80004474 <modbus_store_reg+0x88>
80004448:	02000793          	li	a5,32
8000444c:	18f50c63          	beq	a0,a5,800045e4 <modbus_store_reg+0x1f8>
80004450:	02900793          	li	a5,41
80004454:	2af50463          	beq	a0,a5,800046fc <modbus_store_reg+0x310>
80004458:	fff00413          	li	s0,-1
8000445c:	00040513          	mv	a0,s0
80004460:	02c12083          	lw	ra,44(sp)
80004464:	02812403          	lw	s0,40(sp)
80004468:	02412483          	lw	s1,36(sp)
8000446c:	03010113          	addi	sp,sp,48
80004470:	00008067          	ret
80004474:	02c00793          	li	a5,44
80004478:	20f50e63          	beq	a0,a5,80004694 <modbus_store_reg+0x2a8>
8000447c:	2ef56263          	bltu	a0,a5,80004760 <modbus_store_reg+0x374>
80004480:	02d00793          	li	a5,45
80004484:	fcf51ae3          	bne	a0,a5,80004458 <modbus_store_reg+0x6c>
80004488:	00010513          	mv	a0,sp
8000448c:	f64ff0ef          	jal	ra,80003bf0 <config_load>
80004490:	00055c63          	bgez	a0,800044a8 <modbus_store_reg+0xbc>
80004494:	800035b7          	lui	a1,0x80003
80004498:	02000613          	li	a2,32
8000449c:	fa858593          	addi	a1,a1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
800044a0:	00010513          	mv	a0,sp
800044a4:	341090ef          	jal	ra,8000dfe4 <memcpy>
800044a8:	0004c783          	lbu	a5,0(s1)
800044ac:	0014c703          	lbu	a4,1(s1)
800044b0:	01879793          	slli	a5,a5,0x18
800044b4:	01071713          	slli	a4,a4,0x10
800044b8:	00e7e7b3          	or	a5,a5,a4
800044bc:	0034c703          	lbu	a4,3(s1)
800044c0:	00e7e7b3          	or	a5,a5,a4
800044c4:	0024c703          	lbu	a4,2(s1)
800044c8:	00871713          	slli	a4,a4,0x8
800044cc:	00e7e7b3          	or	a5,a5,a4
800044d0:	00f12c23          	sw	a5,24(sp)
800044d4:	1e80006f          	j	800046bc <modbus_store_reg+0x2d0>
800044d8:	03300793          	li	a5,51
800044dc:	0cf50e63          	beq	a0,a5,800045b8 <modbus_store_reg+0x1cc>
800044e0:	0aa7e863          	bltu	a5,a0,80004590 <modbus_store_reg+0x1a4>
800044e4:	03100793          	li	a5,49
800044e8:	1ef50463          	beq	a0,a5,800046d0 <modbus_store_reg+0x2e4>
800044ec:	16a7f063          	bgeu	a5,a0,8000464c <modbus_store_reg+0x260>
800044f0:	0014c783          	lbu	a5,1(s1)
800044f4:	0004c503          	lbu	a0,0(s1)
800044f8:	0024c583          	lbu	a1,2(s1)
800044fc:	00879793          	slli	a5,a5,0x8
80004500:	00a7e7b3          	or	a5,a5,a0
80004504:	00879513          	slli	a0,a5,0x8
80004508:	0087d793          	srli	a5,a5,0x8
8000450c:	00f567b3          	or	a5,a0,a5
80004510:	01079513          	slli	a0,a5,0x10
80004514:	0034c783          	lbu	a5,3(s1)
80004518:	0044c703          	lbu	a4,4(s1)
8000451c:	01055513          	srli	a0,a0,0x10
80004520:	00879793          	slli	a5,a5,0x8
80004524:	00b7e7b3          	or	a5,a5,a1
80004528:	00879593          	slli	a1,a5,0x8
8000452c:	0087d793          	srli	a5,a5,0x8
80004530:	00f5e7b3          	or	a5,a1,a5
80004534:	01079593          	slli	a1,a5,0x10
80004538:	0054c783          	lbu	a5,5(s1)
8000453c:	0105d593          	srli	a1,a1,0x10
80004540:	ffd00413          	li	s0,-3
80004544:	00879793          	slli	a5,a5,0x8
80004548:	00e7e7b3          	or	a5,a5,a4
8000454c:	00879713          	slli	a4,a5,0x8
80004550:	0087d793          	srli	a5,a5,0x8
80004554:	00f767b3          	or	a5,a4,a5
80004558:	01079793          	slli	a5,a5,0x10
8000455c:	0107d793          	srli	a5,a5,0x10
80004560:	ffa60713          	addi	a4,a2,-6
80004564:	ee060ce3          	beqz	a2,8000445c <modbus_store_reg+0x70>
80004568:	800036b7          	lui	a3,0x80003
8000456c:	0386a603          	lw	a2,56(a3) # 80003038 <_heap_end+0xffff1038>
80004570:	00648693          	addi	a3,s1,6
80004574:	04079e63          	bnez	a5,800045d0 <modbus_store_reg+0x1e4>
80004578:	800007b7          	lui	a5,0x80000
8000457c:	00800893          	li	a7,8
80004580:	00600813          	li	a6,6
80004584:	13478793          	addi	a5,a5,308 # 80000134 <_heap_end+0xfffee134>
80004588:	168010ef          	jal	ra,800056f0 <hub_print>
8000458c:	03c0006f          	j	800045c8 <modbus_store_reg+0x1dc>
80004590:	07e00793          	li	a5,126
80004594:	08f50063          	beq	a0,a5,80004614 <modbus_store_reg+0x228>
80004598:	07f00793          	li	a5,127
8000459c:	0af50463          	beq	a0,a5,80004644 <modbus_store_reg+0x258>
800045a0:	03400793          	li	a5,52
800045a4:	eaf51ae3          	bne	a0,a5,80004458 <modbus_store_reg+0x6c>
800045a8:	0034c703          	lbu	a4,3(s1)
800045ac:	800037b7          	lui	a5,0x80003
800045b0:	02e7ac23          	sw	a4,56(a5) # 80003038 <_heap_end+0xffff1038>
800045b4:	0140006f          	j	800045c8 <modbus_store_reg+0x1dc>
800045b8:	8b81a603          	lw	a2,-1864(gp) # 800030f0 <hub_frame_size>
800045bc:	00000593          	li	a1,0
800045c0:	f0050537          	lui	a0,0xf0050
800045c4:	5e8080ef          	jal	ra,8000cbac <memset>
800045c8:	00000413          	li	s0,0
800045cc:	e91ff06f          	j	8000445c <modbus_store_reg+0x70>
800045d0:	800007b7          	lui	a5,0x80000
800045d4:	01000893          	li	a7,16
800045d8:	00c00813          	li	a6,12
800045dc:	73478793          	addi	a5,a5,1844 # 80000734 <_heap_end+0xfffee734>
800045e0:	fa9ff06f          	j	80004588 <modbus_store_reg+0x19c>
800045e4:	0004c783          	lbu	a5,0(s1)
800045e8:	0014c703          	lbu	a4,1(s1)
800045ec:	01879793          	slli	a5,a5,0x18
800045f0:	01071713          	slli	a4,a4,0x10
800045f4:	00e7e7b3          	or	a5,a5,a4
800045f8:	0034c703          	lbu	a4,3(s1)
800045fc:	00e7e7b3          	or	a5,a5,a4
80004600:	0024c703          	lbu	a4,2(s1)
80004604:	00871713          	slli	a4,a4,0x8
80004608:	00e7e7b3          	or	a5,a5,a4
8000460c:	88f1a223          	sw	a5,-1916(gp) # 800030bc <reg_scratch>
80004610:	fb9ff06f          	j	800045c8 <modbus_store_reg+0x1dc>
80004614:	0004c783          	lbu	a5,0(s1)
80004618:	0014c703          	lbu	a4,1(s1)
8000461c:	01879793          	slli	a5,a5,0x18
80004620:	01071713          	slli	a4,a4,0x10
80004624:	00e7e7b3          	or	a5,a5,a4
80004628:	0034c703          	lbu	a4,3(s1)
8000462c:	00e7e7b3          	or	a5,a5,a4
80004630:	0024c703          	lbu	a4,2(s1)
80004634:	00871713          	slli	a4,a4,0x8
80004638:	00e7e7b3          	or	a5,a5,a4
8000463c:	88f1a023          	sw	a5,-1920(gp) # 800030b8 <reg_config_write>
80004640:	f89ff06f          	j	800045c8 <modbus_store_reg+0x1dc>
80004644:	660010ef          	jal	ra,80005ca4 <hard_reboot>
80004648:	f81ff06f          	j	800045c8 <modbus_store_reg+0x1dc>
8000464c:	0034c503          	lbu	a0,3(s1)
80004650:	475000ef          	jal	ra,800052c4 <hub_init>
80004654:	00050413          	mv	s0,a0
80004658:	dc0518e3          	bnez	a0,80004428 <modbus_store_reg+0x3c>
8000465c:	00010513          	mv	a0,sp
80004660:	d90ff0ef          	jal	ra,80003bf0 <config_load>
80004664:	00055c63          	bgez	a0,8000467c <modbus_store_reg+0x290>
80004668:	800035b7          	lui	a1,0x80003
8000466c:	02000613          	li	a2,32
80004670:	fa858593          	addi	a1,a1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
80004674:	00010513          	mv	a0,sp
80004678:	16d090ef          	jal	ra,8000dfe4 <memcpy>
8000467c:	0034c783          	lbu	a5,3(s1)
80004680:	00010513          	mv	a0,sp
80004684:	00f109a3          	sb	a5,19(sp)
80004688:	e40ff0ef          	jal	ra,80003cc8 <config_save>
8000468c:	dc0558e3          	bgez	a0,8000445c <modbus_store_reg+0x70>
80004690:	d99ff06f          	j	80004428 <modbus_store_reg+0x3c>
80004694:	00010513          	mv	a0,sp
80004698:	d58ff0ef          	jal	ra,80003bf0 <config_load>
8000469c:	00055c63          	bgez	a0,800046b4 <modbus_store_reg+0x2c8>
800046a0:	800035b7          	lui	a1,0x80003
800046a4:	02000613          	li	a2,32
800046a8:	fa858593          	addi	a1,a1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
800046ac:	00010513          	mv	a0,sp
800046b0:	135090ef          	jal	ra,8000dfe4 <memcpy>
800046b4:	0034c783          	lbu	a5,3(s1)
800046b8:	00f10a23          	sb	a5,20(sp)
800046bc:	00010513          	mv	a0,sp
800046c0:	e08ff0ef          	jal	ra,80003cc8 <config_save>
800046c4:	41f55513          	srai	a0,a0,0x1f
800046c8:	ffe57413          	andi	s0,a0,-2
800046cc:	d91ff06f          	j	8000445c <modbus_store_reg+0x70>
800046d0:	00010513          	mv	a0,sp
800046d4:	d1cff0ef          	jal	ra,80003bf0 <config_load>
800046d8:	00055c63          	bgez	a0,800046f0 <modbus_store_reg+0x304>
800046dc:	800035b7          	lui	a1,0x80003
800046e0:	02000613          	li	a2,32
800046e4:	fa858593          	addi	a1,a1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
800046e8:	00010513          	mv	a0,sp
800046ec:	0f9090ef          	jal	ra,8000dfe4 <memcpy>
800046f0:	0034c783          	lbu	a5,3(s1)
800046f4:	00f10623          	sb	a5,12(sp)
800046f8:	fc5ff06f          	j	800046bc <modbus_store_reg+0x2d0>
800046fc:	00010513          	mv	a0,sp
80004700:	cf0ff0ef          	jal	ra,80003bf0 <config_load>
80004704:	00055c63          	bgez	a0,8000471c <modbus_store_reg+0x330>
80004708:	800035b7          	lui	a1,0x80003
8000470c:	02000613          	li	a2,32
80004710:	fa858593          	addi	a1,a1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
80004714:	00010513          	mv	a0,sp
80004718:	0cd090ef          	jal	ra,8000dfe4 <memcpy>
8000471c:	00400613          	li	a2,4
80004720:	00348593          	addi	a1,s1,3
80004724:	00010513          	mv	a0,sp
80004728:	5b0010ef          	jal	ra,80005cd8 <memcpy_rev>
8000472c:	f91ff06f          	j	800046bc <modbus_store_reg+0x2d0>
80004730:	00010513          	mv	a0,sp
80004734:	cbcff0ef          	jal	ra,80003bf0 <config_load>
80004738:	00055c63          	bgez	a0,80004750 <modbus_store_reg+0x364>
8000473c:	800035b7          	lui	a1,0x80003
80004740:	02000613          	li	a2,32
80004744:	fa858593          	addi	a1,a1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
80004748:	00010513          	mv	a0,sp
8000474c:	099090ef          	jal	ra,8000dfe4 <memcpy>
80004750:	00400613          	li	a2,4
80004754:	00348593          	addi	a1,s1,3
80004758:	00410513          	addi	a0,sp,4
8000475c:	fcdff06f          	j	80004728 <modbus_store_reg+0x33c>
80004760:	00010513          	mv	a0,sp
80004764:	c8cff0ef          	jal	ra,80003bf0 <config_load>
80004768:	00055c63          	bgez	a0,80004780 <modbus_store_reg+0x394>
8000476c:	800035b7          	lui	a1,0x80003
80004770:	02000613          	li	a2,32
80004774:	fa858593          	addi	a1,a1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
80004778:	00010513          	mv	a0,sp
8000477c:	069090ef          	jal	ra,8000dfe4 <memcpy>
80004780:	00400613          	li	a2,4
80004784:	00348593          	addi	a1,s1,3
80004788:	00810513          	addi	a0,sp,8
8000478c:	f9dff06f          	j	80004728 <modbus_store_reg+0x33c>
80004790:	00010513          	mv	a0,sp
80004794:	c5cff0ef          	jal	ra,80003bf0 <config_load>
80004798:	00055c63          	bgez	a0,800047b0 <modbus_store_reg+0x3c4>
8000479c:	800035b7          	lui	a1,0x80003
800047a0:	02000613          	li	a2,32
800047a4:	fa858593          	addi	a1,a1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
800047a8:	00010513          	mv	a0,sp
800047ac:	039090ef          	jal	ra,8000dfe4 <memcpy>
800047b0:	00600613          	li	a2,6
800047b4:	00048593          	mv	a1,s1
800047b8:	00d10513          	addi	a0,sp,13
800047bc:	029090ef          	jal	ra,8000dfe4 <memcpy>
800047c0:	efdff06f          	j	800046bc <modbus_store_reg+0x2d0>

800047c4 <modbus_recv>:
800047c4:	fb010113          	addi	sp,sp,-80
800047c8:	04812423          	sw	s0,72(sp)
800047cc:	04112623          	sw	ra,76(sp)
800047d0:	04912223          	sw	s1,68(sp)
800047d4:	05212023          	sw	s2,64(sp)
800047d8:	03312e23          	sw	s3,60(sp)
800047dc:	03412c23          	sw	s4,56(sp)
800047e0:	03512a23          	sw	s5,52(sp)
800047e4:	03612823          	sw	s6,48(sp)
800047e8:	03712623          	sw	s7,44(sp)
800047ec:	03812423          	sw	s8,40(sp)
800047f0:	fff00413          	li	s0,-1
800047f4:	12050063          	beqz	a0,80004914 <modbus_recv+0x150>
800047f8:	10060e63          	beqz	a2,80004914 <modbus_recv+0x150>
800047fc:	00400793          	li	a5,4
80004800:	10b7da63          	bge	a5,a1,80004914 <modbus_recv+0x150>
80004804:	00058a93          	mv	s5,a1
80004808:	ffe58593          	addi	a1,a1,-2
8000480c:	01059593          	slli	a1,a1,0x10
80004810:	0105d593          	srli	a1,a1,0x10
80004814:	00050a13          	mv	s4,a0
80004818:	00060493          	mv	s1,a2
8000481c:	cc9fe0ef          	jal	ra,800034e4 <crc16>
80004820:	015a07b3          	add	a5,s4,s5
80004824:	fff7c603          	lbu	a2,-1(a5)
80004828:	ffe7c783          	lbu	a5,-2(a5)
8000482c:	00050593          	mv	a1,a0
80004830:	00861613          	slli	a2,a2,0x8
80004834:	00f66633          	or	a2,a2,a5
80004838:	40c51e63          	bne	a0,a2,80004c54 <modbus_recv+0x490>
8000483c:	98c18713          	addi	a4,gp,-1652 # 800031c4 <active_config>
80004840:	000a4583          	lbu	a1,0(s4)
80004844:	01474603          	lbu	a2,20(a4)
80004848:	001a4903          	lbu	s2,1(s4)
8000484c:	98c18b13          	addi	s6,gp,-1652 # 800031c4 <active_config>
80004850:	00c58863          	beq	a1,a2,80004860 <modbus_recv+0x9c>
80004854:	3e059663          	bnez	a1,80004c40 <modbus_recv+0x47c>
80004858:	01100793          	li	a5,17
8000485c:	3ef91263          	bne	s2,a5,80004c40 <modbus_recv+0x47c>
80004860:	002a4403          	lbu	s0,2(s4)
80004864:	003a4783          	lbu	a5,3(s4)
80004868:	08000613          	li	a2,128
8000486c:	00841413          	slli	s0,s0,0x8
80004870:	00f46433          	or	s0,s0,a5
80004874:	00000593          	li	a1,0
80004878:	00048513          	mv	a0,s1
8000487c:	01041413          	slli	s0,s0,0x10
80004880:	004a4983          	lbu	s3,4(s4)
80004884:	005a4c03          	lbu	s8,5(s4)
80004888:	324080ef          	jal	ra,8000cbac <memset>
8000488c:	014b4783          	lbu	a5,20(s6)
80004890:	41045413          	srai	s0,s0,0x10
80004894:	01041b93          	slli	s7,s0,0x10
80004898:	010bdb93          	srli	s7,s7,0x10
8000489c:	80002537          	lui	a0,0x80002
800048a0:	00f48023          	sb	a5,0(s1)
800048a4:	012480a3          	sb	s2,1(s1)
800048a8:	000b8613          	mv	a2,s7
800048ac:	00090593          	mv	a1,s2
800048b0:	6f450513          	addi	a0,a0,1780 # 800026f4 <_heap_end+0xffff06f4>
800048b4:	371090ef          	jal	ra,8000e424 <iprintf>
800048b8:	fff90793          	addi	a5,s2,-1
800048bc:	0ff7f793          	andi	a5,a5,255
800048c0:	01000713          	li	a4,16
800048c4:	36f76863          	bltu	a4,a5,80004c34 <modbus_recv+0x470>
800048c8:	80002737          	lui	a4,0x80002
800048cc:	00279793          	slli	a5,a5,0x2
800048d0:	64c70713          	addi	a4,a4,1612 # 8000264c <_heap_end+0xffff064c>
800048d4:	00e787b3          	add	a5,a5,a4
800048d8:	0007a783          	lw	a5,0(a5)
800048dc:	00078067          	jr	a5
800048e0:	800026b7          	lui	a3,0x80002
800048e4:	800025b7          	lui	a1,0x80002
800048e8:	71868693          	addi	a3,a3,1816 # 80002718 <_heap_end+0xffff0718>
800048ec:	01800613          	li	a2,24
800048f0:	72458593          	addi	a1,a1,1828 # 80002724 <_heap_end+0xffff0724>
800048f4:	00348513          	addi	a0,s1,3
800048f8:	5b5090ef          	jal	ra,8000e6ac <siprintf>
800048fc:	02700793          	li	a5,39
80004900:	00f48123          	sb	a5,2(s1)
80004904:	02a00593          	li	a1,42
80004908:	00048513          	mv	a0,s1
8000490c:	c31fe0ef          	jal	ra,8000353c <add_crc>
80004910:	02c00413          	li	s0,44
80004914:	00040513          	mv	a0,s0
80004918:	04c12083          	lw	ra,76(sp)
8000491c:	04812403          	lw	s0,72(sp)
80004920:	04412483          	lw	s1,68(sp)
80004924:	04012903          	lw	s2,64(sp)
80004928:	03c12983          	lw	s3,60(sp)
8000492c:	03812a03          	lw	s4,56(sp)
80004930:	03412a83          	lw	s5,52(sp)
80004934:	03012b03          	lw	s6,48(sp)
80004938:	02c12b83          	lw	s7,44(sp)
8000493c:	02812c03          	lw	s8,40(sp)
80004940:	05010113          	addi	sp,sp,80
80004944:	00008067          	ret
80004948:	00899993          	slli	s3,s3,0x8
8000494c:	0189e9b3          	or	s3,s3,s8
80004950:	01099993          	slli	s3,s3,0x10
80004954:	4109d993          	srai	s3,s3,0x10
80004958:	00100793          	li	a5,1
8000495c:	00048613          	mv	a2,s1
80004960:	2cf99063          	bne	s3,a5,80004c20 <modbus_recv+0x45c>
80004964:	02c00793          	li	a5,44
80004968:	20f40c63          	beq	s0,a5,80004b80 <modbus_recv+0x3bc>
8000496c:	0887c063          	blt	a5,s0,800049ec <modbus_recv+0x228>
80004970:	02000793          	li	a5,32
80004974:	14f40e63          	beq	s0,a5,80004ad0 <modbus_recv+0x30c>
80004978:	0287c663          	blt	a5,s0,800049a4 <modbus_recv+0x1e0>
8000497c:	01e00793          	li	a5,30
80004980:	0ef40e63          	beq	s0,a5,80004a7c <modbus_recv+0x2b8>
80004984:	01f00793          	li	a5,31
80004988:	12f40e63          	beq	s0,a5,80004ac4 <modbus_recv+0x300>
8000498c:	00048613          	mv	a2,s1
80004990:	00200593          	li	a1,2
80004994:	00090513          	mv	a0,s2
80004998:	9e5ff0ef          	jal	ra,8000437c <modbus_error>
8000499c:	00050413          	mv	s0,a0
800049a0:	0f00006f          	j	80004a90 <modbus_recv+0x2cc>
800049a4:	02a00793          	li	a5,42
800049a8:	14f40863          	beq	s0,a5,80004af8 <modbus_recv+0x334>
800049ac:	1687cc63          	blt	a5,s0,80004b24 <modbus_recv+0x360>
800049b0:	02900793          	li	a5,41
800049b4:	fcf41ce3          	bne	s0,a5,8000498c <modbus_recv+0x1c8>
800049b8:	00010513          	mv	a0,sp
800049bc:	a34ff0ef          	jal	ra,80003bf0 <config_load>
800049c0:	00055c63          	bgez	a0,800049d8 <modbus_recv+0x214>
800049c4:	800035b7          	lui	a1,0x80003
800049c8:	02000613          	li	a2,32
800049cc:	fa858593          	addi	a1,a1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
800049d0:	00010513          	mv	a0,sp
800049d4:	610090ef          	jal	ra,8000dfe4 <memcpy>
800049d8:	00400613          	li	a2,4
800049dc:	00010593          	mv	a1,sp
800049e0:	00348513          	addi	a0,s1,3
800049e4:	600090ef          	jal	ra,8000dfe4 <memcpy>
800049e8:	0a40006f          	j	80004a8c <modbus_recv+0x2c8>
800049ec:	03000793          	li	a5,48
800049f0:	16f40063          	beq	s0,a5,80004b50 <modbus_recv+0x38c>
800049f4:	0487c463          	blt	a5,s0,80004a3c <modbus_recv+0x278>
800049f8:	02d00793          	li	a5,45
800049fc:	1af40663          	beq	s0,a5,80004ba8 <modbus_recv+0x3e4>
80004a00:	02f00793          	li	a5,47
80004a04:	f8f414e3          	bne	s0,a5,8000498c <modbus_recv+0x1c8>
80004a08:	00010513          	mv	a0,sp
80004a0c:	9e4ff0ef          	jal	ra,80003bf0 <config_load>
80004a10:	00055c63          	bgez	a0,80004a28 <modbus_recv+0x264>
80004a14:	800035b7          	lui	a1,0x80003
80004a18:	02000613          	li	a2,32
80004a1c:	fa858593          	addi	a1,a1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
80004a20:	00010513          	mv	a0,sp
80004a24:	5c0090ef          	jal	ra,8000dfe4 <memcpy>
80004a28:	00600613          	li	a2,6
80004a2c:	00d10593          	addi	a1,sp,13
80004a30:	00348513          	addi	a0,s1,3
80004a34:	5b0090ef          	jal	ra,8000dfe4 <memcpy>
80004a38:	1400006f          	j	80004b78 <modbus_recv+0x3b4>
80004a3c:	03400793          	li	a5,52
80004a40:	0af40463          	beq	s0,a5,80004ae8 <modbus_recv+0x324>
80004a44:	07e00793          	li	a5,126
80004a48:	08f40a63          	beq	s0,a5,80004adc <modbus_recv+0x318>
80004a4c:	03100793          	li	a5,49
80004a50:	f2f41ee3          	bne	s0,a5,8000498c <modbus_recv+0x1c8>
80004a54:	00010513          	mv	a0,sp
80004a58:	998ff0ef          	jal	ra,80003bf0 <config_load>
80004a5c:	00055c63          	bgez	a0,80004a74 <modbus_recv+0x2b0>
80004a60:	800035b7          	lui	a1,0x80003
80004a64:	02000613          	li	a2,32
80004a68:	fa858593          	addi	a1,a1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
80004a6c:	00010513          	mv	a0,sp
80004a70:	574090ef          	jal	ra,8000dfe4 <memcpy>
80004a74:	00c14783          	lbu	a5,12(sp)
80004a78:	0fc0006f          	j	80004b74 <modbus_recv+0x3b0>
80004a7c:	00400613          	li	a2,4
80004a80:	88b18593          	addi	a1,gp,-1909 # 800030c3 <reg_sys_counter+0x3>
80004a84:	00348513          	addi	a0,s1,3
80004a88:	250010ef          	jal	ra,80005cd8 <memcpy_rev>
80004a8c:	00400413          	li	s0,4
80004a90:	00340593          	addi	a1,s0,3
80004a94:	01059593          	slli	a1,a1,0x10
80004a98:	00848123          	sb	s0,2(s1)
80004a9c:	0105d593          	srli	a1,a1,0x10
80004aa0:	00048513          	mv	a0,s1
80004aa4:	a99fe0ef          	jal	ra,8000353c <add_crc>
80004aa8:	00540413          	addi	s0,s0,5
80004aac:	e60414e3          	bnez	s0,80004914 <modbus_recv+0x150>
80004ab0:	80002537          	lui	a0,0x80002
80004ab4:	00090593          	mv	a1,s2
80004ab8:	74450513          	addi	a0,a0,1860 # 80002744 <_heap_end+0xffff0744>
80004abc:	169090ef          	jal	ra,8000e424 <iprintf>
80004ac0:	e55ff06f          	j	80004914 <modbus_recv+0x150>
80004ac4:	00400613          	li	a2,4
80004ac8:	88f18593          	addi	a1,gp,-1905 # 800030c7 <reg_irq_counter+0x3>
80004acc:	fb9ff06f          	j	80004a84 <modbus_recv+0x2c0>
80004ad0:	00400613          	li	a2,4
80004ad4:	88718593          	addi	a1,gp,-1913 # 800030bf <reg_scratch+0x3>
80004ad8:	fadff06f          	j	80004a84 <modbus_recv+0x2c0>
80004adc:	00400613          	li	a2,4
80004ae0:	88318593          	addi	a1,gp,-1917 # 800030bb <reg_config_write+0x3>
80004ae4:	fa1ff06f          	j	80004a84 <modbus_recv+0x2c0>
80004ae8:	800035b7          	lui	a1,0x80003
80004aec:	00400613          	li	a2,4
80004af0:	03b58593          	addi	a1,a1,59 # 8000303b <_heap_end+0xffff103b>
80004af4:	f91ff06f          	j	80004a84 <modbus_recv+0x2c0>
80004af8:	00010513          	mv	a0,sp
80004afc:	8f4ff0ef          	jal	ra,80003bf0 <config_load>
80004b00:	00055c63          	bgez	a0,80004b18 <modbus_recv+0x354>
80004b04:	800035b7          	lui	a1,0x80003
80004b08:	02000613          	li	a2,32
80004b0c:	fa858593          	addi	a1,a1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
80004b10:	00010513          	mv	a0,sp
80004b14:	4d0090ef          	jal	ra,8000dfe4 <memcpy>
80004b18:	00400613          	li	a2,4
80004b1c:	00410593          	addi	a1,sp,4
80004b20:	ec1ff06f          	j	800049e0 <modbus_recv+0x21c>
80004b24:	00010513          	mv	a0,sp
80004b28:	8c8ff0ef          	jal	ra,80003bf0 <config_load>
80004b2c:	00055c63          	bgez	a0,80004b44 <modbus_recv+0x380>
80004b30:	800035b7          	lui	a1,0x80003
80004b34:	02000613          	li	a2,32
80004b38:	fa858593          	addi	a1,a1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
80004b3c:	00010513          	mv	a0,sp
80004b40:	4a4090ef          	jal	ra,8000dfe4 <memcpy>
80004b44:	00400613          	li	a2,4
80004b48:	00810593          	addi	a1,sp,8
80004b4c:	e95ff06f          	j	800049e0 <modbus_recv+0x21c>
80004b50:	00010513          	mv	a0,sp
80004b54:	89cff0ef          	jal	ra,80003bf0 <config_load>
80004b58:	00055c63          	bgez	a0,80004b70 <modbus_recv+0x3ac>
80004b5c:	800035b7          	lui	a1,0x80003
80004b60:	02000613          	li	a2,32
80004b64:	fa858593          	addi	a1,a1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
80004b68:	00010513          	mv	a0,sp
80004b6c:	478090ef          	jal	ra,8000dfe4 <memcpy>
80004b70:	01314783          	lbu	a5,19(sp)
80004b74:	00f48323          	sb	a5,6(s1)
80004b78:	00600413          	li	s0,6
80004b7c:	f15ff06f          	j	80004a90 <modbus_recv+0x2cc>
80004b80:	00010513          	mv	a0,sp
80004b84:	86cff0ef          	jal	ra,80003bf0 <config_load>
80004b88:	00055c63          	bgez	a0,80004ba0 <modbus_recv+0x3dc>
80004b8c:	800035b7          	lui	a1,0x80003
80004b90:	02000613          	li	a2,32
80004b94:	fa858593          	addi	a1,a1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
80004b98:	00010513          	mv	a0,sp
80004b9c:	448090ef          	jal	ra,8000dfe4 <memcpy>
80004ba0:	01414783          	lbu	a5,20(sp)
80004ba4:	fd1ff06f          	j	80004b74 <modbus_recv+0x3b0>
80004ba8:	00010513          	mv	a0,sp
80004bac:	844ff0ef          	jal	ra,80003bf0 <config_load>
80004bb0:	00055c63          	bgez	a0,80004bc8 <modbus_recv+0x404>
80004bb4:	800035b7          	lui	a1,0x80003
80004bb8:	02000613          	li	a2,32
80004bbc:	fa858593          	addi	a1,a1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
80004bc0:	00010513          	mv	a0,sp
80004bc4:	420090ef          	jal	ra,8000dfe4 <memcpy>
80004bc8:	00400613          	li	a2,4
80004bcc:	01b10593          	addi	a1,sp,27
80004bd0:	e61ff06f          	j	80004a30 <modbus_recv+0x26c>
80004bd4:	00400613          	li	a2,4
80004bd8:	002a0593          	addi	a1,s4,2
80004bdc:	00248513          	addi	a0,s1,2
80004be0:	404090ef          	jal	ra,8000dfe4 <memcpy>
80004be4:	00600593          	li	a1,6
80004be8:	00048513          	mv	a0,s1
80004bec:	951fe0ef          	jal	ra,8000353c <add_crc>
80004bf0:	00800413          	li	s0,8
80004bf4:	d21ff06f          	j	80004914 <modbus_recv+0x150>
80004bf8:	ff7a8613          	addi	a2,s5,-9
80004bfc:	0ff67613          	andi	a2,a2,255
80004c00:	007a0593          	addi	a1,s4,7
80004c04:	000b8513          	mv	a0,s7
80004c08:	fe4ff0ef          	jal	ra,800043ec <modbus_store_reg>
80004c0c:	fc0554e3          	bgez	a0,80004bd4 <modbus_recv+0x410>
80004c10:	ffe00793          	li	a5,-2
80004c14:	00048613          	mv	a2,s1
80004c18:	00700593          	li	a1,7
80004c1c:	00f50463          	beq	a0,a5,80004c24 <modbus_recv+0x460>
80004c20:	00300593          	li	a1,3
80004c24:	00090513          	mv	a0,s2
80004c28:	f54ff0ef          	jal	ra,8000437c <modbus_error>
80004c2c:	00050413          	mv	s0,a0
80004c30:	e7dff06f          	j	80004aac <modbus_recv+0x2e8>
80004c34:	00048613          	mv	a2,s1
80004c38:	00100593          	li	a1,1
80004c3c:	fe9ff06f          	j	80004c24 <modbus_recv+0x460>
80004c40:	80002537          	lui	a0,0x80002
80004c44:	77450513          	addi	a0,a0,1908 # 80002774 <_heap_end+0xffff0774>
80004c48:	7dc090ef          	jal	ra,8000e424 <iprintf>
80004c4c:	00000413          	li	s0,0
80004c50:	cc5ff06f          	j	80004914 <modbus_recv+0x150>
80004c54:	80002537          	lui	a0,0x80002
80004c58:	7b450513          	addi	a0,a0,1972 # 800027b4 <_heap_end+0xffff07b4>
80004c5c:	fedff06f          	j	80004c48 <modbus_recv+0x484>

80004c60 <mac_init>:
80004c60:	ff010113          	addi	sp,sp,-16
80004c64:	00112623          	sw	ra,12(sp)
80004c68:	00812423          	sw	s0,8(sp)
80004c6c:	02051263          	bnez	a0,80004c90 <mac_init+0x30>
80004c70:	80002537          	lui	a0,0x80002
80004c74:	7ec50513          	addi	a0,a0,2028 # 800027ec <_heap_end+0xffff07ec>
80004c78:	7ac090ef          	jal	ra,8000e424 <iprintf>
80004c7c:	ff000513          	li	a0,-16
80004c80:	00c12083          	lw	ra,12(sp)
80004c84:	00812403          	lw	s0,8(sp)
80004c88:	01010113          	addi	sp,sp,16
80004c8c:	00008067          	ret
80004c90:	800035b7          	lui	a1,0x80003
80004c94:	00050413          	mv	s0,a0
80004c98:	00500613          	li	a2,5
80004c9c:	80c58593          	addi	a1,a1,-2036 # 8000280c <_heap_end+0xffff080c>
80004ca0:	03650513          	addi	a0,a0,54
80004ca4:	340090ef          	jal	ra,8000dfe4 <memcpy>
80004ca8:	8000b7b7          	lui	a5,0x8000b
80004cac:	38c78793          	addi	a5,a5,908 # 8000b38c <_heap_end+0xffff938c>
80004cb0:	00f42a23          	sw	a5,20(s0)
80004cb4:	800057b7          	lui	a5,0x80005
80004cb8:	d1478793          	addi	a5,a5,-748 # 80004d14 <_heap_end+0xffff2d14>
80004cbc:	00f42c23          	sw	a5,24(s0)
80004cc0:	00600613          	li	a2,6
80004cc4:	99918593          	addi	a1,gp,-1639 # 800031d1 <active_config+0xd>
80004cc8:	02e40513          	addi	a0,s0,46
80004ccc:	318090ef          	jal	ra,8000dfe4 <memcpy>
80004cd0:	5dc00793          	li	a5,1500
80004cd4:	02f41623          	sh	a5,44(s0)
80004cd8:	000017b7          	lui	a5,0x1
80004cdc:	e0678793          	addi	a5,a5,-506 # e06 <_stack_size+0x606>
80004ce0:	02f41a23          	sh	a5,52(s0)
80004ce4:	00002537          	lui	a0,0x2
80004ce8:	01100793          	li	a5,17
80004cec:	f0070437          	lui	s0,0xf0070
80004cf0:	00f42023          	sw	a5,0(s0) # f0070000 <_heap_end+0x7005e000>
80004cf4:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
80004cf8:	641000ef          	jal	ra,80005b38 <delay_us>
80004cfc:	80003537          	lui	a0,0x80003
80004d00:	00042023          	sw	zero,0(s0)
80004d04:	81450513          	addi	a0,a0,-2028 # 80002814 <_heap_end+0xffff0814>
80004d08:	71c090ef          	jal	ra,8000e424 <iprintf>
80004d0c:	00000513          	li	a0,0
80004d10:	f71ff06f          	j	80004c80 <mac_init+0x20>

80004d14 <mac_tx_packet>:
80004d14:	00050463          	beqz	a0,80004d1c <mac_tx_packet+0x8>
80004d18:	00059e63          	bnez	a1,80004d34 <mac_tx_packet+0x20>
80004d1c:	f0000737          	lui	a4,0xf0000
80004d20:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
80004d24:	ff000513          	li	a0,-16
80004d28:	0027e793          	ori	a5,a5,2
80004d2c:	00f72223          	sw	a5,4(a4)
80004d30:	00008067          	ret
80004d34:	ff010113          	addi	sp,sp,-16
80004d38:	00812423          	sw	s0,8(sp)
80004d3c:	00058413          	mv	s0,a1
80004d40:	00040513          	mv	a0,s0
80004d44:	ffe00593          	li	a1,-2
80004d48:	00112623          	sw	ra,12(sp)
80004d4c:	1d4020ef          	jal	ra,80006f20 <pbuf_header>
80004d50:	00040713          	mv	a4,s0
80004d54:	00000793          	li	a5,0
80004d58:	00a75683          	lhu	a3,10(a4)
80004d5c:	00072703          	lw	a4,0(a4)
80004d60:	00d787b3          	add	a5,a5,a3
80004d64:	fe071ae3          	bnez	a4,80004d58 <mac_tx_packet+0x44>
80004d68:	00379793          	slli	a5,a5,0x3
80004d6c:	f00706b7          	lui	a3,0xf0070
80004d70:	0006a703          	lw	a4,0(a3) # f0070000 <_heap_end+0x7005e000>
80004d74:	00277713          	andi	a4,a4,2
80004d78:	fe070ce3          	beqz	a4,80004d70 <mac_tx_packet+0x5c>
80004d7c:	f0070737          	lui	a4,0xf0070
80004d80:	01472683          	lw	a3,20(a4) # f0070014 <_heap_end+0x7005e014>
80004d84:	fe068ee3          	beqz	a3,80004d80 <mac_tx_packet+0x6c>
80004d88:	00f72823          	sw	a5,16(a4)
80004d8c:	00040693          	mv	a3,s0
80004d90:	00000713          	li	a4,0
80004d94:	00000793          	li	a5,0
80004d98:	00300893          	li	a7,3
80004d9c:	f0070837          	lui	a6,0xf0070
80004da0:	0046a603          	lw	a2,4(a3)
80004da4:	00a6d583          	lhu	a1,10(a3)
80004da8:	00b605b3          	add	a1,a2,a1
80004dac:	04c59863          	bne	a1,a2,80004dfc <mac_tx_packet+0xe8>
80004db0:	0006a683          	lw	a3,0(a3)
80004db4:	fe0696e3          	bnez	a3,80004da0 <mac_tx_packet+0x8c>
80004db8:	00078a63          	beqz	a5,80004dcc <mac_tx_packet+0xb8>
80004dbc:	f00707b7          	lui	a5,0xf0070
80004dc0:	0147a683          	lw	a3,20(a5) # f0070014 <_heap_end+0x7005e014>
80004dc4:	fe068ee3          	beqz	a3,80004dc0 <mac_tx_packet+0xac>
80004dc8:	00e7a823          	sw	a4,16(a5)
80004dcc:	00040513          	mv	a0,s0
80004dd0:	00200593          	li	a1,2
80004dd4:	14c020ef          	jal	ra,80006f20 <pbuf_header>
80004dd8:	a0418793          	addi	a5,gp,-1532 # 8000323c <lwip_stats>
80004ddc:	0007a703          	lw	a4,0(a5)
80004de0:	00000513          	li	a0,0
80004de4:	00170713          	addi	a4,a4,1
80004de8:	00e7a023          	sw	a4,0(a5)
80004dec:	00c12083          	lw	ra,12(sp)
80004df0:	00812403          	lw	s0,8(sp)
80004df4:	01010113          	addi	sp,sp,16
80004df8:	00008067          	ret
80004dfc:	00064503          	lbu	a0,0(a2)
80004e00:	00379313          	slli	t1,a5,0x3
80004e04:	00651533          	sll	a0,a0,t1
80004e08:	00a76733          	or	a4,a4,a0
80004e0c:	01179a63          	bne	a5,a7,80004e20 <mac_tx_packet+0x10c>
80004e10:	01482503          	lw	a0,20(a6) # f0070014 <_heap_end+0x7005e014>
80004e14:	fe050ee3          	beqz	a0,80004e10 <mac_tx_packet+0xfc>
80004e18:	00e82823          	sw	a4,16(a6)
80004e1c:	00000713          	li	a4,0
80004e20:	00178793          	addi	a5,a5,1
80004e24:	0037f793          	andi	a5,a5,3
80004e28:	00160613          	addi	a2,a2,1
80004e2c:	f81ff06f          	j	80004dac <mac_tx_packet+0x98>

80004e30 <sys_now>:
80004e30:	ff010113          	addi	sp,sp,-16
80004e34:	00112623          	sw	ra,12(sp)
80004e38:	f00b07b7          	lui	a5,0xf00b0
80004e3c:	0007a503          	lw	a0,0(a5) # f00b0000 <_heap_end+0x7009e000>
80004e40:	0047a583          	lw	a1,4(a5)
80004e44:	3e800613          	li	a2,1000
80004e48:	00000693          	li	a3,0
80004e4c:	671070ef          	jal	ra,8000ccbc <__udivdi3>
80004e50:	00c12083          	lw	ra,12(sp)
80004e54:	01010113          	addi	sp,sp,16
80004e58:	00008067          	ret

80004e5c <sys_arch_protect>:
80004e5c:	00008067          	ret

80004e60 <sys_arch_unprotect>:
80004e60:	00008067          	ret

80004e64 <mac_lwip_init>:
80004e64:	ff010113          	addi	sp,sp,-16
80004e68:	00112623          	sw	ra,12(sp)
80004e6c:	00812423          	sw	s0,8(sp)
80004e70:	00912223          	sw	s1,4(sp)
80004e74:	689000ef          	jal	ra,80005cfc <lwip_init>
80004e78:	fb9ff0ef          	jal	ra,80004e30 <sys_now>
80004e7c:	8aa1a223          	sw	a0,-1884(gp) # 800030dc <ts_ipreass>
80004e80:	8aa1a623          	sw	a0,-1876(gp) # 800030e4 <ts_etharp>
80004e84:	8000d837          	lui	a6,0x8000d
80004e88:	800057b7          	lui	a5,0x80005
80004e8c:	97080813          	addi	a6,a6,-1680 # 8000c970 <_heap_end+0xffffa970>
80004e90:	c6078793          	addi	a5,a5,-928 # 80004c60 <_heap_end+0xffff2c60>
80004e94:	00000713          	li	a4,0
80004e98:	99018693          	addi	a3,gp,-1648 # 800031c8 <active_config+0x4>
80004e9c:	99418613          	addi	a2,gp,-1644 # 800031cc <active_config+0x8>
80004ea0:	98c18593          	addi	a1,gp,-1652 # 800031c4 <active_config>
80004ea4:	9ac18513          	addi	a0,gp,-1620 # 800031e4 <default_netif>
80004ea8:	219010ef          	jal	ra,800068c0 <netif_add>
80004eac:	02051663          	bnez	a0,80004ed8 <mac_lwip_init+0x74>
80004eb0:	80003537          	lui	a0,0x80003
80004eb4:	82850513          	addi	a0,a0,-2008 # 80002828 <_heap_end+0xffff0828>
80004eb8:	56c090ef          	jal	ra,8000e424 <iprintf>
80004ebc:	fff00493          	li	s1,-1
80004ec0:	00c12083          	lw	ra,12(sp)
80004ec4:	00812403          	lw	s0,8(sp)
80004ec8:	00048513          	mv	a0,s1
80004ecc:	00412483          	lw	s1,4(sp)
80004ed0:	01010113          	addi	sp,sp,16
80004ed4:	00008067          	ret
80004ed8:	9ac18513          	addi	a0,gp,-1620 # 800031e4 <default_netif>
80004edc:	31d010ef          	jal	ra,800069f8 <netif_set_default>
80004ee0:	9ac18513          	addi	a0,gp,-1620 # 800031e4 <default_netif>
80004ee4:	98c18493          	addi	s1,gp,-1652 # 800031c4 <active_config>
80004ee8:	319010ef          	jal	ra,80006a00 <netif_set_up>
80004eec:	00c4c783          	lbu	a5,12(s1)
80004ef0:	00000493          	li	s1,0
80004ef4:	0017f793          	andi	a5,a5,1
80004ef8:	fc0784e3          	beqz	a5,80004ec0 <mac_lwip_init+0x5c>
80004efc:	9ac18513          	addi	a0,gp,-1620 # 800031e4 <default_netif>
80004f00:	524050ef          	jal	ra,8000a424 <dhcp_start>
80004f04:	fbdff06f          	j	80004ec0 <mac_lwip_init+0x5c>

80004f08 <mac_rx_isr>:
80004f08:	fc010113          	addi	sp,sp,-64
80004f0c:	02912a23          	sw	s1,52(sp)
80004f10:	03512223          	sw	s5,36(sp)
80004f14:	01712e23          	sw	s7,28(sp)
80004f18:	00001bb7          	lui	s7,0x1
80004f1c:	03312623          	sw	s3,44(sp)
80004f20:	01812c23          	sw	s8,24(sp)
80004f24:	01912a23          	sw	s9,20(sp)
80004f28:	02112e23          	sw	ra,60(sp)
80004f2c:	02812c23          	sw	s0,56(sp)
80004f30:	03212823          	sw	s2,48(sp)
80004f34:	03412423          	sw	s4,40(sp)
80004f38:	03612023          	sw	s6,32(sp)
80004f3c:	01a12823          	sw	s10,16(sp)
80004f40:	00000993          	li	s3,0
80004f44:	800b8b93          	addi	s7,s7,-2048 # 800 <_stack_size>
80004f48:	a0418493          	addi	s1,gp,-1532 # 8000323c <lwip_stats>
80004f4c:	9ac18a93          	addi	s5,gp,-1620 # 800031e4 <default_netif>
80004f50:	80003c37          	lui	s8,0x80003
80004f54:	80003cb7          	lui	s9,0x80003
80004f58:	f0070937          	lui	s2,0xf0070
80004f5c:	00092783          	lw	a5,0(s2) # f0070000 <_heap_end+0x7005e000>
80004f60:	0207f793          	andi	a5,a5,32
80004f64:	04078663          	beqz	a5,80004fb0 <mac_rx_isr+0xa8>
80004f68:	02092683          	lw	a3,32(s2)
80004f6c:	00768413          	addi	s0,a3,7
80004f70:	00345413          	srli	s0,s0,0x3
80004f74:	068bfa63          	bgeu	s7,s0,80004fe8 <mac_rx_isr+0xe0>
80004f78:	80003537          	lui	a0,0x80003
80004f7c:	00068613          	mv	a2,a3
80004f80:	00040593          	mv	a1,s0
80004f84:	84c50513          	addi	a0,a0,-1972 # 8000284c <_heap_end+0xffff084c>
80004f88:	49c090ef          	jal	ra,8000e424 <iprintf>
80004f8c:	80c1a783          	lw	a5,-2036(gp) # 80003044 <_impure_ptr>
80004f90:	0087a503          	lw	a0,8(a5)
80004f94:	389080ef          	jal	ra,8000db1c <fflush>
80004f98:	01100793          	li	a5,17
80004f9c:	00002537          	lui	a0,0x2
80004fa0:	00f92023          	sw	a5,0(s2)
80004fa4:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
80004fa8:	391000ef          	jal	ra,80005b38 <delay_us>
80004fac:	00092023          	sw	zero,0(s2)
80004fb0:	03c12083          	lw	ra,60(sp)
80004fb4:	03812403          	lw	s0,56(sp)
80004fb8:	03412483          	lw	s1,52(sp)
80004fbc:	03012903          	lw	s2,48(sp)
80004fc0:	02c12983          	lw	s3,44(sp)
80004fc4:	02812a03          	lw	s4,40(sp)
80004fc8:	02412a83          	lw	s5,36(sp)
80004fcc:	02012b03          	lw	s6,32(sp)
80004fd0:	01c12b83          	lw	s7,28(sp)
80004fd4:	01812c03          	lw	s8,24(sp)
80004fd8:	01412c83          	lw	s9,20(sp)
80004fdc:	01012d03          	lw	s10,16(sp)
80004fe0:	04010113          	addi	sp,sp,64
80004fe4:	00008067          	ret
80004fe8:	00240d13          	addi	s10,s0,2
80004fec:	010d1d13          	slli	s10,s10,0x10
80004ff0:	010d5d13          	srli	s10,s10,0x10
80004ff4:	18200613          	li	a2,386
80004ff8:	000d0593          	mv	a1,s10
80004ffc:	00000513          	li	a0,0
80005000:	00d12623          	sw	a3,12(sp)
80005004:	018020ef          	jal	ra,8000701c <pbuf_alloc>
80005008:	00050913          	mv	s2,a0
8000500c:	00c12683          	lw	a3,12(sp)
80005010:	0a051663          	bnez	a0,800050bc <mac_rx_isr+0x1b4>
80005014:	f0000737          	lui	a4,0xf0000
80005018:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
8000501c:	80003537          	lui	a0,0x80003
80005020:	00040613          	mv	a2,s0
80005024:	0027e793          	ori	a5,a5,2
80005028:	00f72223          	sw	a5,4(a4)
8000502c:	01f68713          	addi	a4,a3,31
80005030:	00575713          	srli	a4,a4,0x5
80005034:	000d0593          	mv	a1,s10
80005038:	88c50513          	addi	a0,a0,-1908 # 8000288c <_heap_end+0xffff088c>
8000503c:	3e8090ef          	jal	ra,8000e424 <iprintf>
80005040:	a0418793          	addi	a5,gp,-1532 # 8000323c <lwip_stats>
80005044:	0187a703          	lw	a4,24(a5)
80005048:	00170713          	addi	a4,a4,1
8000504c:	00e7ac23          	sw	a4,24(a5)
80005050:	00c7a703          	lw	a4,12(a5)
80005054:	00170713          	addi	a4,a4,1
80005058:	00e7a623          	sw	a4,12(a5)
8000505c:	f0070737          	lui	a4,0xf0070
80005060:	04804263          	bgtz	s0,800050a4 <mac_rx_isr+0x19c>
80005064:	03812403          	lw	s0,56(sp)
80005068:	03c12083          	lw	ra,60(sp)
8000506c:	03412483          	lw	s1,52(sp)
80005070:	03012903          	lw	s2,48(sp)
80005074:	02c12983          	lw	s3,44(sp)
80005078:	02812a03          	lw	s4,40(sp)
8000507c:	02412a83          	lw	s5,36(sp)
80005080:	02012b03          	lw	s6,32(sp)
80005084:	01c12b83          	lw	s7,28(sp)
80005088:	01812c03          	lw	s8,24(sp)
8000508c:	01412c83          	lw	s9,20(sp)
80005090:	01012d03          	lw	s10,16(sp)
80005094:	80003537          	lui	a0,0x80003
80005098:	8dc50513          	addi	a0,a0,-1828 # 800028dc <_heap_end+0xffff08dc>
8000509c:	04010113          	addi	sp,sp,64
800050a0:	3840906f          	j	8000e424 <iprintf>
800050a4:	00072783          	lw	a5,0(a4) # f0070000 <_heap_end+0x7005e000>
800050a8:	0207f793          	andi	a5,a5,32
800050ac:	fe078ce3          	beqz	a5,800050a4 <mac_rx_isr+0x19c>
800050b0:	02072783          	lw	a5,32(a4)
800050b4:	ffc40413          	addi	s0,s0,-4
800050b8:	fa9ff06f          	j	80005060 <mac_rx_isr+0x158>
800050bc:	ffe00593          	li	a1,-2
800050c0:	661010ef          	jal	ra,80006f20 <pbuf_header>
800050c4:	00000713          	li	a4,0
800050c8:	00000793          	li	a5,0
800050cc:	f0070637          	lui	a2,0xf0070
800050d0:	04041a63          	bnez	s0,80005124 <mac_rx_isr+0x21c>
800050d4:	00200593          	li	a1,2
800050d8:	00090513          	mv	a0,s2
800050dc:	00492a03          	lw	s4,4(s2)
800050e0:	641010ef          	jal	ra,80006f20 <pbuf_header>
800050e4:	0044a783          	lw	a5,4(s1)
800050e8:	000a8593          	mv	a1,s5
800050ec:	00090513          	mv	a0,s2
800050f0:	00178793          	addi	a5,a5,1
800050f4:	00f4a223          	sw	a5,4(s1)
800050f8:	010aa783          	lw	a5,16(s5)
800050fc:	000780e7          	jalr	a5
80005100:	00050593          	mv	a1,a0
80005104:	08050463          	beqz	a0,8000518c <mac_rx_isr+0x284>
80005108:	f0000737          	lui	a4,0xf0000
8000510c:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
80005110:	928c0513          	addi	a0,s8,-1752 # 80002928 <_heap_end+0xffff0928>
80005114:	0027e793          	ori	a5,a5,2
80005118:	00f72223          	sw	a5,4(a4)
8000511c:	308090ef          	jal	ra,8000e424 <iprintf>
80005120:	06c0006f          	j	8000518c <mac_rx_isr+0x284>
80005124:	08099063          	bnez	s3,800051a4 <mac_rx_isr+0x29c>
80005128:	06078863          	beqz	a5,80005198 <mac_rx_isr+0x290>
8000512c:	0007a783          	lw	a5,0(a5)
80005130:	06079663          	bnez	a5,8000519c <mac_rx_isr+0x294>
80005134:	f0000737          	lui	a4,0xf0000
80005138:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
8000513c:	8fcc8513          	addi	a0,s9,-1796 # 800028fc <_heap_end+0xffff08fc>
80005140:	0027e793          	ori	a5,a5,2
80005144:	00f72223          	sw	a5,4(a4)
80005148:	2dc090ef          	jal	ra,8000e424 <iprintf>
8000514c:	0184a783          	lw	a5,24(s1)
80005150:	f0070737          	lui	a4,0xf0070
80005154:	00178793          	addi	a5,a5,1
80005158:	00f4ac23          	sw	a5,24(s1)
8000515c:	00c4a783          	lw	a5,12(s1)
80005160:	00178793          	addi	a5,a5,1
80005164:	00f4a623          	sw	a5,12(s1)
80005168:	00072783          	lw	a5,0(a4) # f0070000 <_heap_end+0x7005e000>
8000516c:	0207f793          	andi	a5,a5,32
80005170:	fe078ce3          	beqz	a5,80005168 <mac_rx_isr+0x260>
80005174:	02072783          	lw	a5,32(a4)
80005178:	ffc40413          	addi	s0,s0,-4
8000517c:	fe8046e3          	bgtz	s0,80005168 <mac_rx_isr+0x260>
80005180:	00200593          	li	a1,2
80005184:	00090513          	mv	a0,s2
80005188:	599010ef          	jal	ra,80006f20 <pbuf_header>
8000518c:	00090513          	mv	a0,s2
80005190:	5b9010ef          	jal	ra,80006f48 <pbuf_free>
80005194:	dc5ff06f          	j	80004f58 <mac_rx_isr+0x50>
80005198:	00090793          	mv	a5,s2
8000519c:	00a7d983          	lhu	s3,10(a5)
800051a0:	0047aa03          	lw	s4,4(a5)
800051a4:	00071a63          	bnez	a4,800051b8 <mac_rx_isr+0x2b0>
800051a8:	00062683          	lw	a3,0(a2) # f0070000 <_heap_end+0x7005e000>
800051ac:	0206f693          	andi	a3,a3,32
800051b0:	fe068ce3          	beqz	a3,800051a8 <mac_rx_isr+0x2a0>
800051b4:	02062b03          	lw	s6,32(a2)
800051b8:	00170713          	addi	a4,a4,1
800051bc:	016a0023          	sb	s6,0(s4)
800051c0:	00377713          	andi	a4,a4,3
800051c4:	008b5b13          	srli	s6,s6,0x8
800051c8:	fff40413          	addi	s0,s0,-1
800051cc:	001a0a13          	addi	s4,s4,1
800051d0:	fff98993          	addi	s3,s3,-1
800051d4:	efdff06f          	j	800050d0 <mac_rx_isr+0x1c8>

800051d8 <mac_poll>:
800051d8:	ff010113          	addi	sp,sp,-16
800051dc:	00812423          	sw	s0,8(sp)
800051e0:	00112623          	sw	ra,12(sp)
800051e4:	00912223          	sw	s1,4(sp)
800051e8:	c49ff0ef          	jal	ra,80004e30 <sys_now>
800051ec:	8ac1a683          	lw	a3,-1876(gp) # 800030e4 <ts_etharp>
800051f0:	00050413          	mv	s0,a0
800051f4:	00a6f663          	bgeu	a3,a0,80005200 <mac_poll+0x28>
800051f8:	8a41a683          	lw	a3,-1884(gp) # 800030dc <ts_ipreass>
800051fc:	02a6e063          	bltu	a3,a0,8000521c <mac_poll+0x44>
80005200:	8a81a223          	sw	s0,-1884(gp) # 800030dc <ts_ipreass>
80005204:	8a81a623          	sw	s0,-1876(gp) # 800030e4 <ts_etharp>
80005208:	00c12083          	lw	ra,12(sp)
8000520c:	00812403          	lw	s0,8(sp)
80005210:	00412483          	lw	s1,4(sp)
80005214:	01010113          	addi	sp,sp,16
80005218:	00008067          	ret
8000521c:	8a01a783          	lw	a5,-1888(gp) # 800030d8 <ts_dhcp_fine>
80005220:	1f300713          	li	a4,499
80005224:	40f507b3          	sub	a5,a0,a5
80005228:	00f77663          	bgeu	a4,a5,80005234 <mac_poll+0x5c>
8000522c:	5a0050ef          	jal	ra,8000a7cc <dhcp_fine_tmr>
80005230:	8a81a023          	sw	s0,-1888(gp) # 800030d8 <ts_dhcp_fine>
80005234:	89c1a703          	lw	a4,-1892(gp) # 800030d4 <ts_dhcp_coarse>
80005238:	0000f7b7          	lui	a5,0xf
8000523c:	a5f78793          	addi	a5,a5,-1441 # ea5f <_stack_size+0xe25f>
80005240:	40e40733          	sub	a4,s0,a4
80005244:	00e7f663          	bgeu	a5,a4,80005250 <mac_poll+0x78>
80005248:	2c0050ef          	jal	ra,8000a508 <dhcp_coarse_tmr>
8000524c:	8881ae23          	sw	s0,-1892(gp) # 800030d4 <ts_dhcp_coarse>
80005250:	f00607b7          	lui	a5,0xf0060
80005254:	0087a783          	lw	a5,8(a5) # f0060008 <_heap_end+0x7004e008>
80005258:	0047f793          	andi	a5,a5,4
8000525c:	fa0786e3          	beqz	a5,80005208 <mac_poll+0x30>
80005260:	80003537          	lui	a0,0x80003
80005264:	95850513          	addi	a0,a0,-1704 # 80002958 <_heap_end+0xffff0958>
80005268:	1bc090ef          	jal	ra,8000e424 <iprintf>
8000526c:	00812403          	lw	s0,8(sp)
80005270:	00c12083          	lw	ra,12(sp)
80005274:	00412483          	lw	s1,4(sp)
80005278:	01010113          	addi	sp,sp,16
8000527c:	c8dff06f          	j	80004f08 <mac_rx_isr>

80005280 <mac_print_stats>:
80005280:	ff010113          	addi	sp,sp,-16
80005284:	9b018513          	addi	a0,gp,-1616 # 800031e8 <default_netif+0x4>
80005288:	00112623          	sw	ra,12(sp)
8000528c:	6d8070ef          	jal	ra,8000c964 <ip4addr_ntoa>
80005290:	a0418613          	addi	a2,gp,-1532 # 8000323c <lwip_stats>
80005294:	01062883          	lw	a7,16(a2)
80005298:	01462803          	lw	a6,20(a2)
8000529c:	00c62783          	lw	a5,12(a2)
800052a0:	02862703          	lw	a4,40(a2)
800052a4:	00062683          	lw	a3,0(a2)
800052a8:	00c12083          	lw	ra,12(sp)
800052ac:	00462603          	lw	a2,4(a2)
800052b0:	00050593          	mv	a1,a0
800052b4:	80003537          	lui	a0,0x80003
800052b8:	97850513          	addi	a0,a0,-1672 # 80002978 <_heap_end+0xffff0978>
800052bc:	01010113          	addi	sp,sp,16
800052c0:	1640906f          	j	8000e424 <iprintf>

800052c4 <hub_init>:
800052c4:	fe010113          	addi	sp,sp,-32
800052c8:	00912a23          	sw	s1,20(sp)
800052cc:	800034b7          	lui	s1,0x80003
800052d0:	fc84c783          	lbu	a5,-56(s1) # 80002fc8 <_heap_end+0xffff0fc8>
800052d4:	00112e23          	sw	ra,28(sp)
800052d8:	00812c23          	sw	s0,24(sp)
800052dc:	01212823          	sw	s2,16(sp)
800052e0:	01312623          	sw	s3,12(sp)
800052e4:	01412423          	sw	s4,8(sp)
800052e8:	01512223          	sw	s5,4(sp)
800052ec:	01612023          	sw	s6,0(sp)
800052f0:	fc848493          	addi	s1,s1,-56
800052f4:	04f50063          	beq	a0,a5,80005334 <hub_init+0x70>
800052f8:	0054c703          	lbu	a4,5(s1)
800052fc:	fff00793          	li	a5,-1
80005300:	00100a13          	li	s4,1
80005304:	02e50a63          	beq	a0,a4,80005338 <hub_init+0x74>
80005308:	01c12083          	lw	ra,28(sp)
8000530c:	01812403          	lw	s0,24(sp)
80005310:	01412483          	lw	s1,20(sp)
80005314:	01012903          	lw	s2,16(sp)
80005318:	00c12983          	lw	s3,12(sp)
8000531c:	00812a03          	lw	s4,8(sp)
80005320:	00412a83          	lw	s5,4(sp)
80005324:	00012b03          	lw	s6,0(sp)
80005328:	00078513          	mv	a0,a5
8000532c:	02010113          	addi	sp,sp,32
80005330:	00008067          	ret
80005334:	00000a13          	li	s4,0
80005338:	002a1993          	slli	s3,s4,0x2
8000533c:	014987b3          	add	a5,s3,s4
80005340:	00f487b3          	add	a5,s1,a5
80005344:	0017c403          	lbu	s0,1(a5)
80005348:	0027c903          	lbu	s2,2(a5)
8000534c:	0037ca83          	lbu	s5,3(a5)
80005350:	00040513          	mv	a0,s0
80005354:	00090593          	mv	a1,s2
80005358:	0047cb03          	lbu	s6,4(a5)
8000535c:	735070ef          	jal	ra,8000d290 <__mulsi3>
80005360:	000a8593          	mv	a1,s5
80005364:	72d070ef          	jal	ra,8000d290 <__mulsi3>
80005368:	000b0593          	mv	a1,s6
8000536c:	725070ef          	jal	ra,8000d290 <__mulsi3>
80005370:	40355513          	srai	a0,a0,0x3
80005374:	8aa1ac23          	sw	a0,-1864(gp) # 800030f0 <hub_frame_size>
80005378:	8a81aa23          	sw	s0,-1868(gp) # 800030ec <hub_frame_width>
8000537c:	000a8593          	mv	a1,s5
80005380:	00090513          	mv	a0,s2
80005384:	70d070ef          	jal	ra,8000d290 <__mulsi3>
80005388:	8aa1a823          	sw	a0,-1872(gp) # 800030e8 <hub_frame_height>
8000538c:	f00547b7          	lui	a5,0xf0054
80005390:	0007a023          	sw	zero,0(a5) # f0054000 <_heap_end+0x70042000>
80005394:	000b0593          	mv	a1,s6
80005398:	00040513          	mv	a0,s0
8000539c:	6f5070ef          	jal	ra,8000d290 <__mulsi3>
800053a0:	000a8593          	mv	a1,s5
800053a4:	6ed070ef          	jal	ra,8000d290 <__mulsi3>
800053a8:	00000693          	li	a3,0
800053ac:	00000713          	li	a4,0
800053b0:	f0050637          	lui	a2,0xf0050
800053b4:	000015b7          	lui	a1,0x1
800053b8:	03274e63          	blt	a4,s2,800053f4 <hub_init+0x130>
800053bc:	014989b3          	add	s3,s3,s4
800053c0:	013484b3          	add	s1,s1,s3
800053c4:	0004c783          	lbu	a5,0(s1)
800053c8:	01041413          	slli	s0,s0,0x10
800053cc:	01891913          	slli	s2,s2,0x18
800053d0:	01246433          	or	s0,s0,s2
800053d4:	00f46433          	or	s0,s0,a5
800053d8:	000107b7          	lui	a5,0x10
800053dc:	f8078793          	addi	a5,a5,-128 # ff80 <_stack_size+0xf780>
800053e0:	00f46433          	or	s0,s0,a5
800053e4:	f00547b7          	lui	a5,0xf0054
800053e8:	0087a023          	sw	s0,0(a5) # f0054000 <_heap_end+0x70042000>
800053ec:	00000793          	li	a5,0
800053f0:	f19ff06f          	j	80005308 <hub_init+0x44>
800053f4:	00b707b3          	add	a5,a4,a1
800053f8:	00279793          	slli	a5,a5,0x2
800053fc:	4036d813          	srai	a6,a3,0x3
80005400:	00f607b3          	add	a5,a2,a5
80005404:	0107a223          	sw	a6,4(a5)
80005408:	00170713          	addi	a4,a4,1
8000540c:	00a686b3          	add	a3,a3,a0
80005410:	fa9ff06f          	j	800053b8 <hub_init+0xf4>

80005414 <hub_print_char>:
80005414:	f9010113          	addi	sp,sp,-112
80005418:	05812423          	sw	s8,72(sp)
8000541c:	00078c13          	mv	s8,a5
80005420:	07812783          	lw	a5,120(sp)
80005424:	06912223          	sw	s1,100(sp)
80005428:	05312e23          	sw	s3,92(sp)
8000542c:	41f7d493          	srai	s1,a5,0x1f
80005430:	0074f493          	andi	s1,s1,7
80005434:	00f484b3          	add	s1,s1,a5
80005438:	05412c23          	sw	s4,88(sp)
8000543c:	02a12023          	sw	a0,32(sp)
80005440:	06112623          	sw	ra,108(sp)
80005444:	06812423          	sw	s0,104(sp)
80005448:	07212023          	sw	s2,96(sp)
8000544c:	05512a23          	sw	s5,84(sp)
80005450:	05612823          	sw	s6,80(sp)
80005454:	05712623          	sw	s7,76(sp)
80005458:	05912223          	sw	s9,68(sp)
8000545c:	05a12023          	sw	s10,64(sp)
80005460:	03b12e23          	sw	s11,60(sp)
80005464:	02c12223          	sw	a2,36(sp)
80005468:	02e12423          	sw	a4,40(sp)
8000546c:	03012623          	sw	a6,44(sp)
80005470:	0077f793          	andi	a5,a5,7
80005474:	00058513          	mv	a0,a1
80005478:	00068993          	mv	s3,a3
8000547c:	00088a13          	mv	s4,a7
80005480:	4034d493          	srai	s1,s1,0x3
80005484:	00078463          	beqz	a5,8000548c <hub_print_char+0x78>
80005488:	00148493          	addi	s1,s1,1
8000548c:	07412583          	lw	a1,116(sp)
80005490:	00000b93          	li	s7,0
80005494:	5fd070ef          	jal	ra,8000d290 <__mulsi3>
80005498:	00048593          	mv	a1,s1
8000549c:	5f5070ef          	jal	ra,8000d290 <__mulsi3>
800054a0:	07012a83          	lw	s5,112(sp)
800054a4:	003c1793          	slli	a5,s8,0x3
800054a8:	00098593          	mv	a1,s3
800054ac:	00aa8ab3          	add	s5,s5,a0
800054b0:	000c0513          	mv	a0,s8
800054b4:	00f12e23          	sw	a5,28(sp)
800054b8:	5d9070ef          	jal	ra,8000d290 <__mulsi3>
800054bc:	00a12823          	sw	a0,16(sp)
800054c0:	049bc063          	blt	s7,s1,80005500 <hub_print_char+0xec>
800054c4:	06c12083          	lw	ra,108(sp)
800054c8:	06812403          	lw	s0,104(sp)
800054cc:	06412483          	lw	s1,100(sp)
800054d0:	06012903          	lw	s2,96(sp)
800054d4:	05c12983          	lw	s3,92(sp)
800054d8:	05812a03          	lw	s4,88(sp)
800054dc:	05412a83          	lw	s5,84(sp)
800054e0:	05012b03          	lw	s6,80(sp)
800054e4:	04c12b83          	lw	s7,76(sp)
800054e8:	04812c03          	lw	s8,72(sp)
800054ec:	04412c83          	lw	s9,68(sp)
800054f0:	04012d03          	lw	s10,64(sp)
800054f4:	03c12d83          	lw	s11,60(sp)
800054f8:	07010113          	addi	sp,sp,112
800054fc:	00008067          	ret
80005500:	07812703          	lw	a4,120(sp)
80005504:	003b9793          	slli	a5,s7,0x3
80005508:	40f707b3          	sub	a5,a4,a5
8000550c:	00f12623          	sw	a5,12(sp)
80005510:	00c12703          	lw	a4,12(sp)
80005514:	00800793          	li	a5,8
80005518:	00e7d463          	bge	a5,a4,80005520 <hub_print_char+0x10c>
8000551c:	00f12623          	sw	a5,12(sp)
80005520:	02412b03          	lw	s6,36(sp)
80005524:	00000c93          	li	s9,0
80005528:	07412783          	lw	a5,116(sp)
8000552c:	02fcc263          	blt	s9,a5,80005550 <hub_print_char+0x13c>
80005530:	00fa8ab3          	add	s5,s5,a5
80005534:	01c12703          	lw	a4,28(sp)
80005538:	01012783          	lw	a5,16(sp)
8000553c:	001b8b93          	addi	s7,s7,1
80005540:	00898993          	addi	s3,s3,8
80005544:	00e787b3          	add	a5,a5,a4
80005548:	00f12823          	sw	a5,16(sp)
8000554c:	f75ff06f          	j	800054c0 <hub_print_char+0xac>
80005550:	020b4863          	bltz	s6,80005580 <hub_print_char+0x16c>
80005554:	038b5663          	bge	s6,s8,80005580 <hub_print_char+0x16c>
80005558:	019a87b3          	add	a5,s5,s9
8000555c:	0007c783          	lbu	a5,0(a5)
80005560:	00000d13          	li	s10,0
80005564:	00f12c23          	sw	a5,24(sp)
80005568:	01012783          	lw	a5,16(sp)
8000556c:	00fb0db3          	add	s11,s6,a5
80005570:	00100793          	li	a5,1
80005574:	00f12423          	sw	a5,8(sp)
80005578:	00c12783          	lw	a5,12(sp)
8000557c:	00fd4863          	blt	s10,a5,8000558c <hub_print_char+0x178>
80005580:	001b0b13          	addi	s6,s6,1
80005584:	001c8c93          	addi	s9,s9,1
80005588:	fa1ff06f          	j	80005528 <hub_print_char+0x114>
8000558c:	013d07b3          	add	a5,s10,s3
80005590:	0407ca63          	bltz	a5,800055e4 <hub_print_char+0x1d0>
80005594:	02c12703          	lw	a4,44(sp)
80005598:	04e7d663          	bge	a5,a4,800055e4 <hub_print_char+0x1d0>
8000559c:	00c00793          	li	a5,12
800055a0:	06fa0063          	beq	s4,a5,80005600 <hub_print_char+0x1ec>
800055a4:	04b00793          	li	a5,75
800055a8:	08fa0a63          	beq	s4,a5,8000563c <hub_print_char+0x228>
800055ac:	01412783          	lw	a5,20(sp)
800055b0:	00279913          	slli	s2,a5,0x2
800055b4:	02012783          	lw	a5,32(sp)
800055b8:	01278933          	add	s2,a5,s2
800055bc:	00092503          	lw	a0,0(s2)
800055c0:	6c8070ef          	jal	ra,8000cc88 <__bswapsi2>
800055c4:	01812783          	lw	a5,24(sp)
800055c8:	00812703          	lw	a4,8(sp)
800055cc:	00e7f7b3          	and	a5,a5,a4
800055d0:	10078263          	beqz	a5,800056d4 <hub_print_char+0x2c0>
800055d4:	00c00793          	li	a5,12
800055d8:	0afa0663          	beq	s4,a5,80005684 <hub_print_char+0x270>
800055dc:	04b00793          	li	a5,75
800055e0:	0afa0a63          	beq	s4,a5,80005694 <hub_print_char+0x280>
800055e4:	00812783          	lw	a5,8(sp)
800055e8:	001d0d13          	addi	s10,s10,1
800055ec:	018d8db3          	add	s11,s11,s8
800055f0:	00179793          	slli	a5,a5,0x1
800055f4:	0ff7f793          	andi	a5,a5,255
800055f8:	00f12423          	sw	a5,8(sp)
800055fc:	f7dff06f          	j	80005578 <hub_print_char+0x164>
80005600:	41fdd793          	srai	a5,s11,0x1f
80005604:	01f7f793          	andi	a5,a5,31
80005608:	01b787b3          	add	a5,a5,s11
8000560c:	4057d793          	srai	a5,a5,0x5
80005610:	00f12a23          	sw	a5,20(sp)
80005614:	800007b7          	lui	a5,0x80000
80005618:	01f78793          	addi	a5,a5,31 # 8000001f <_heap_end+0xfffee01f>
8000561c:	00fdf433          	and	s0,s11,a5
80005620:	00045863          	bgez	s0,80005630 <hub_print_char+0x21c>
80005624:	fff40413          	addi	s0,s0,-1
80005628:	fe046413          	ori	s0,s0,-32
8000562c:	00140413          	addi	s0,s0,1
80005630:	800007b7          	lui	a5,0x80000
80005634:	0087d433          	srl	s0,a5,s0
80005638:	f75ff06f          	j	800055ac <hub_print_char+0x198>
8000563c:	41fdd793          	srai	a5,s11,0x1f
80005640:	0037f793          	andi	a5,a5,3
80005644:	01b787b3          	add	a5,a5,s11
80005648:	4027d793          	srai	a5,a5,0x2
8000564c:	00f12a23          	sw	a5,20(sp)
80005650:	800007b7          	lui	a5,0x80000
80005654:	00378793          	addi	a5,a5,3 # 80000003 <_heap_end+0xfffee003>
80005658:	00fdf433          	and	s0,s11,a5
8000565c:	00045863          	bgez	s0,8000566c <hub_print_char+0x258>
80005660:	fff40413          	addi	s0,s0,-1
80005664:	ffc46413          	ori	s0,s0,-4
80005668:	00140413          	addi	s0,s0,1
8000566c:	00300793          	li	a5,3
80005670:	40878433          	sub	s0,a5,s0
80005674:	00341413          	slli	s0,s0,0x3
80005678:	0ff00793          	li	a5,255
8000567c:	00879433          	sll	s0,a5,s0
80005680:	f2dff06f          	j	800055ac <hub_print_char+0x198>
80005684:	00a46533          	or	a0,s0,a0
80005688:	600070ef          	jal	ra,8000cc88 <__bswapsi2>
8000568c:	00a92023          	sw	a0,0(s2)
80005690:	f55ff06f          	j	800055e4 <hub_print_char+0x1d0>
80005694:	fff44793          	not	a5,s0
80005698:	00a7f533          	and	a0,a5,a0
8000569c:	800007b7          	lui	a5,0x80000
800056a0:	00378793          	addi	a5,a5,3 # 80000003 <_heap_end+0xfffee003>
800056a4:	00fdf7b3          	and	a5,s11,a5
800056a8:	0007d863          	bgez	a5,800056b8 <hub_print_char+0x2a4>
800056ac:	fff78793          	addi	a5,a5,-1
800056b0:	ffc7e793          	ori	a5,a5,-4
800056b4:	00178793          	addi	a5,a5,1
800056b8:	00300713          	li	a4,3
800056bc:	40f707b3          	sub	a5,a4,a5
800056c0:	02812703          	lw	a4,40(sp)
800056c4:	00379793          	slli	a5,a5,0x3
800056c8:	00f717b3          	sll	a5,a4,a5
800056cc:	00a7e533          	or	a0,a5,a0
800056d0:	fb9ff06f          	j	80005688 <hub_print_char+0x274>
800056d4:	00c00793          	li	a5,12
800056d8:	00fa0663          	beq	s4,a5,800056e4 <hub_print_char+0x2d0>
800056dc:	04b00793          	li	a5,75
800056e0:	f0fa12e3          	bne	s4,a5,800055e4 <hub_print_char+0x1d0>
800056e4:	fff44793          	not	a5,s0
800056e8:	00a7f533          	and	a0,a5,a0
800056ec:	f9dff06f          	j	80005688 <hub_print_char+0x274>

800056f0 <hub_print>:
800056f0:	fb010113          	addi	sp,sp,-80
800056f4:	04812423          	sw	s0,72(sp)
800056f8:	04912223          	sw	s1,68(sp)
800056fc:	05212023          	sw	s2,64(sp)
80005700:	03312e23          	sw	s3,60(sp)
80005704:	03412c23          	sw	s4,56(sp)
80005708:	03512a23          	sw	s5,52(sp)
8000570c:	03612823          	sw	s6,48(sp)
80005710:	03712623          	sw	s7,44(sp)
80005714:	03812423          	sw	s8,40(sp)
80005718:	03912223          	sw	s9,36(sp)
8000571c:	03a12023          	sw	s10,32(sp)
80005720:	01b12e23          	sw	s11,28(sp)
80005724:	04112623          	sw	ra,76(sp)
80005728:	00058a13          	mv	s4,a1
8000572c:	00068a93          	mv	s5,a3
80005730:	00070993          	mv	s3,a4
80005734:	00078b13          	mv	s6,a5
80005738:	00080913          	mv	s2,a6
8000573c:	00088b93          	mv	s7,a7
80005740:	00050493          	mv	s1,a0
80005744:	00000413          	li	s0,0
80005748:	f0054c37          	lui	s8,0xf0054
8000574c:	0ff67d93          	andi	s11,a2,255
80005750:	05344063          	blt	s0,s3,80005790 <hub_print+0xa0>
80005754:	04c12083          	lw	ra,76(sp)
80005758:	04812403          	lw	s0,72(sp)
8000575c:	04412483          	lw	s1,68(sp)
80005760:	04012903          	lw	s2,64(sp)
80005764:	03c12983          	lw	s3,60(sp)
80005768:	03812a03          	lw	s4,56(sp)
8000576c:	03412a83          	lw	s5,52(sp)
80005770:	03012b03          	lw	s6,48(sp)
80005774:	02c12b83          	lw	s7,44(sp)
80005778:	02812c03          	lw	s8,40(sp)
8000577c:	02412c83          	lw	s9,36(sp)
80005780:	02012d03          	lw	s10,32(sp)
80005784:	01c12d83          	lw	s11,28(sp)
80005788:	05010113          	addi	sp,sp,80
8000578c:	00008067          	ret
80005790:	000c2883          	lw	a7,0(s8) # f0054000 <_heap_end+0x70042000>
80005794:	008a85b3          	add	a1,s5,s0
80005798:	01712423          	sw	s7,8(sp)
8000579c:	01212223          	sw	s2,4(sp)
800057a0:	01612023          	sw	s6,0(sp)
800057a4:	8b01a803          	lw	a6,-1872(gp) # 800030e8 <hub_frame_height>
800057a8:	8b41a783          	lw	a5,-1868(gp) # 800030ec <hub_frame_width>
800057ac:	0005c583          	lbu	a1,0(a1) # 1000 <_stack_size+0x800>
800057b0:	00048613          	mv	a2,s1
800057b4:	07f8f893          	andi	a7,a7,127
800057b8:	000d8713          	mv	a4,s11
800057bc:	000a0693          	mv	a3,s4
800057c0:	f0050537          	lui	a0,0xf0050
800057c4:	c51ff0ef          	jal	ra,80005414 <hub_print_char>
800057c8:	00140413          	addi	s0,s0,1
800057cc:	012484b3          	add	s1,s1,s2
800057d0:	f81ff06f          	j	80005750 <hub_print+0x60>

800057d4 <modbus_udp_init>:
800057d4:	ff010113          	addi	sp,sp,-16
800057d8:	02e00513          	li	a0,46
800057dc:	00912223          	sw	s1,4(sp)
800057e0:	00112623          	sw	ra,12(sp)
800057e4:	00812423          	sw	s0,8(sp)
800057e8:	3ac030ef          	jal	ra,80008b94 <udp_new_ip_type>
800057ec:	8aa1ae23          	sw	a0,-1860(gp) # 800030f4 <modbus_udp_pcb>
800057f0:	02051663          	bnez	a0,8000581c <modbus_udp_init+0x48>
800057f4:	80003537          	lui	a0,0x80003
800057f8:	9d450513          	addi	a0,a0,-1580 # 800029d4 <_heap_end+0xffff09d4>
800057fc:	429080ef          	jal	ra,8000e424 <iprintf>
80005800:	fff00413          	li	s0,-1
80005804:	00040513          	mv	a0,s0
80005808:	00c12083          	lw	ra,12(sp)
8000580c:	00812403          	lw	s0,8(sp)
80005810:	00412483          	lw	s1,4(sp)
80005814:	01010113          	addi	sp,sp,16
80005818:	00008067          	ret
8000581c:	7d100613          	li	a2,2001
80005820:	84818593          	addi	a1,gp,-1976 # 80003080 <ip_addr_any>
80005824:	5e1020ef          	jal	ra,80008604 <udp_bind>
80005828:	00050413          	mv	s0,a0
8000582c:	00050e63          	beqz	a0,80005848 <modbus_udp_init+0x74>
80005830:	80003537          	lui	a0,0x80003
80005834:	a0450513          	addi	a0,a0,-1532 # 80002a04 <_heap_end+0xffff0a04>
80005838:	3ed080ef          	jal	ra,8000e424 <iprintf>
8000583c:	8bc1a503          	lw	a0,-1860(gp) # 800030f4 <modbus_udp_pcb>
80005840:	2c0030ef          	jal	ra,80008b00 <udp_remove>
80005844:	fc1ff06f          	j	80005804 <modbus_udp_init+0x30>
80005848:	8bc1a503          	lw	a0,-1860(gp) # 800030f4 <modbus_udp_pcb>
8000584c:	800065b7          	lui	a1,0x80006
80005850:	00000613          	li	a2,0
80005854:	9f058593          	addi	a1,a1,-1552 # 800059f0 <_heap_end+0xffff39f0>
80005858:	298030ef          	jal	ra,80008af0 <udp_recv>
8000585c:	80003537          	lui	a0,0x80003
80005860:	a3050513          	addi	a0,a0,-1488 # 80002a30 <_heap_end+0xffff0a30>
80005864:	3c1080ef          	jal	ra,8000e424 <iprintf>
80005868:	f9dff06f          	j	80005804 <modbus_udp_init+0x30>

8000586c <modbus_udp_send>:
8000586c:	fd010113          	addi	sp,sp,-48
80005870:	01412c23          	sw	s4,24(sp)
80005874:	00168a13          	addi	s4,a3,1
80005878:	03212023          	sw	s2,32(sp)
8000587c:	00058913          	mv	s2,a1
80005880:	010a1593          	slli	a1,s4,0x10
80005884:	01312e23          	sw	s3,28(sp)
80005888:	01512a23          	sw	s5,20(sp)
8000588c:	00050993          	mv	s3,a0
80005890:	00060a93          	mv	s5,a2
80005894:	0105d593          	srli	a1,a1,0x10
80005898:	28000613          	li	a2,640
8000589c:	03800513          	li	a0,56
800058a0:	02912223          	sw	s1,36(sp)
800058a4:	02112623          	sw	ra,44(sp)
800058a8:	02812423          	sw	s0,40(sp)
800058ac:	00068493          	mv	s1,a3
800058b0:	76c010ef          	jal	ra,8000701c <pbuf_alloc>
800058b4:	04051063          	bnez	a0,800058f4 <modbus_udp_send+0x88>
800058b8:	f0000737          	lui	a4,0xf0000
800058bc:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
800058c0:	80003537          	lui	a0,0x80003
800058c4:	a4c50513          	addi	a0,a0,-1460 # 80002a4c <_heap_end+0xffff0a4c>
800058c8:	ffd7f793          	andi	a5,a5,-3
800058cc:	00f72223          	sw	a5,4(a4)
800058d0:	02812403          	lw	s0,40(sp)
800058d4:	02c12083          	lw	ra,44(sp)
800058d8:	02412483          	lw	s1,36(sp)
800058dc:	02012903          	lw	s2,32(sp)
800058e0:	01c12983          	lw	s3,28(sp)
800058e4:	01812a03          	lw	s4,24(sp)
800058e8:	01412a83          	lw	s5,20(sp)
800058ec:	03010113          	addi	sp,sp,48
800058f0:	3350806f          	j	8000e424 <iprintf>
800058f4:	00452783          	lw	a5,4(a0)
800058f8:	00050413          	mv	s0,a0
800058fc:	00078663          	beqz	a5,80005908 <modbus_udp_send+0x9c>
80005900:	00a55703          	lhu	a4,10(a0)
80005904:	05477463          	bgeu	a4,s4,8000594c <modbus_udp_send+0xe0>
80005908:	f0000737          	lui	a4,0xf0000
8000590c:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
80005910:	80003537          	lui	a0,0x80003
80005914:	a7c50513          	addi	a0,a0,-1412 # 80002a7c <_heap_end+0xffff0a7c>
80005918:	ffd7f793          	andi	a5,a5,-3
8000591c:	00f72223          	sw	a5,4(a4)
80005920:	00a45603          	lhu	a2,10(s0)
80005924:	00442583          	lw	a1,4(s0)
80005928:	02812403          	lw	s0,40(sp)
8000592c:	02c12083          	lw	ra,44(sp)
80005930:	02412483          	lw	s1,36(sp)
80005934:	02012903          	lw	s2,32(sp)
80005938:	01c12983          	lw	s3,28(sp)
8000593c:	01812a03          	lw	s4,24(sp)
80005940:	01412a83          	lw	s5,20(sp)
80005944:	03010113          	addi	sp,sp,48
80005948:	2dd0806f          	j	8000e424 <iprintf>
8000594c:	00048613          	mv	a2,s1
80005950:	000a8593          	mv	a1,s5
80005954:	00078513          	mv	a0,a5
80005958:	68c080ef          	jal	ra,8000dfe4 <memcpy>
8000595c:	009507b3          	add	a5,a0,s1
80005960:	00078023          	sb	zero,0(a5)
80005964:	8bc1a503          	lw	a0,-1860(gp) # 800030f4 <modbus_udp_pcb>
80005968:	00040593          	mv	a1,s0
8000596c:	00090693          	mv	a3,s2
80005970:	00098613          	mv	a2,s3
80005974:	7c1020ef          	jal	ra,80008934 <udp_sendto>
80005978:	00050593          	mv	a1,a0
8000597c:	04050463          	beqz	a0,800059c4 <modbus_udp_send+0x158>
80005980:	f0000737          	lui	a4,0xf0000
80005984:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
80005988:	80003537          	lui	a0,0x80003
8000598c:	ab450513          	addi	a0,a0,-1356 # 80002ab4 <_heap_end+0xffff0ab4>
80005990:	ffd7f793          	andi	a5,a5,-3
80005994:	00f72223          	sw	a5,4(a4)
80005998:	28d080ef          	jal	ra,8000e424 <iprintf>
8000599c:	00040513          	mv	a0,s0
800059a0:	02812403          	lw	s0,40(sp)
800059a4:	02c12083          	lw	ra,44(sp)
800059a8:	02412483          	lw	s1,36(sp)
800059ac:	02012903          	lw	s2,32(sp)
800059b0:	01c12983          	lw	s3,28(sp)
800059b4:	01812a03          	lw	s4,24(sp)
800059b8:	01412a83          	lw	s5,20(sp)
800059bc:	03010113          	addi	sp,sp,48
800059c0:	5880106f          	j	80006f48 <pbuf_free>
800059c4:	00a45583          	lhu	a1,10(s0)
800059c8:	00098513          	mv	a0,s3
800059cc:	00b12623          	sw	a1,12(sp)
800059d0:	795060ef          	jal	ra,8000c964 <ip4addr_ntoa>
800059d4:	00c12583          	lw	a1,12(sp)
800059d8:	00050613          	mv	a2,a0
800059dc:	80003537          	lui	a0,0x80003
800059e0:	00090693          	mv	a3,s2
800059e4:	aec50513          	addi	a0,a0,-1300 # 80002aec <_heap_end+0xffff0aec>
800059e8:	23d080ef          	jal	ra,8000e424 <iprintf>
800059ec:	fb1ff06f          	j	8000599c <modbus_udp_send+0x130>

800059f0 <modbus_udp_recv>:
800059f0:	f6010113          	addi	sp,sp,-160
800059f4:	08112e23          	sw	ra,156(sp)
800059f8:	08912a23          	sw	s1,148(sp)
800059fc:	09212823          	sw	s2,144(sp)
80005a00:	09312623          	sw	s3,140(sp)
80005a04:	08812c23          	sw	s0,152(sp)
80005a08:	09412423          	sw	s4,136(sp)
80005a0c:	00a65403          	lhu	s0,10(a2) # f005000a <_heap_end+0x7003e00a>
80005a10:	00068513          	mv	a0,a3
80005a14:	00070993          	mv	s3,a4
80005a18:	00060493          	mv	s1,a2
80005a1c:	00462a03          	lw	s4,4(a2)
80005a20:	00068913          	mv	s2,a3
80005a24:	741060ef          	jal	ra,8000c964 <ip4addr_ntoa>
80005a28:	00050593          	mv	a1,a0
80005a2c:	80003537          	lui	a0,0x80003
80005a30:	00040693          	mv	a3,s0
80005a34:	00098613          	mv	a2,s3
80005a38:	b1850513          	addi	a0,a0,-1256 # 80002b18 <_heap_end+0xffff0b18>
80005a3c:	1e9080ef          	jal	ra,8000e424 <iprintf>
80005a40:	00040593          	mv	a1,s0
80005a44:	00010613          	mv	a2,sp
80005a48:	000a0513          	mv	a0,s4
80005a4c:	d79fe0ef          	jal	ra,800047c4 <modbus_recv>
80005a50:	00050413          	mv	s0,a0
80005a54:	00048513          	mv	a0,s1
80005a58:	4f0010ef          	jal	ra,80006f48 <pbuf_free>
80005a5c:	02040463          	beqz	s0,80005a84 <modbus_udp_recv+0x94>
80005a60:	80003537          	lui	a0,0x80003
80005a64:	00040593          	mv	a1,s0
80005a68:	b4450513          	addi	a0,a0,-1212 # 80002b44 <_heap_end+0xffff0b44>
80005a6c:	1b9080ef          	jal	ra,8000e424 <iprintf>
80005a70:	00040693          	mv	a3,s0
80005a74:	00010613          	mv	a2,sp
80005a78:	00098593          	mv	a1,s3
80005a7c:	00090513          	mv	a0,s2
80005a80:	dedff0ef          	jal	ra,8000586c <modbus_udp_send>
80005a84:	09c12083          	lw	ra,156(sp)
80005a88:	09812403          	lw	s0,152(sp)
80005a8c:	09412483          	lw	s1,148(sp)
80005a90:	09012903          	lw	s2,144(sp)
80005a94:	08c12983          	lw	s3,140(sp)
80005a98:	08812a03          	lw	s4,136(sp)
80005a9c:	0a010113          	addi	sp,sp,160
80005aa0:	00008067          	ret

80005aa4 <i2c_init>:
80005aa4:	0fa00793          	li	a5,250
80005aa8:	00f52423          	sw	a5,8(a0)
80005aac:	00008067          	ret

80005ab0 <i2c_wait_for_busy>:
80005ab0:	00000793          	li	a5,0
80005ab4:	00b7c663          	blt	a5,a1,80005ac0 <i2c_wait_for_busy+0x10>
80005ab8:	00000513          	li	a0,0
80005abc:	00008067          	ret
80005ac0:	00c52703          	lw	a4,12(a0)
80005ac4:	00277713          	andi	a4,a4,2
80005ac8:	00071663          	bnez	a4,80005ad4 <i2c_wait_for_busy+0x24>
80005acc:	00178793          	addi	a5,a5,1
80005ad0:	fe5ff06f          	j	80005ab4 <i2c_wait_for_busy+0x4>
80005ad4:	00100513          	li	a0,1
80005ad8:	00008067          	ret

80005adc <i2c_wait_for_release>:
80005adc:	00000793          	li	a5,0
80005ae0:	00b7c663          	blt	a5,a1,80005aec <i2c_wait_for_release+0x10>
80005ae4:	00000513          	li	a0,0
80005ae8:	00008067          	ret
80005aec:	00c52703          	lw	a4,12(a0)
80005af0:	00277713          	andi	a4,a4,2
80005af4:	00070663          	beqz	a4,80005b00 <i2c_wait_for_release+0x24>
80005af8:	00178793          	addi	a5,a5,1
80005afc:	fe5ff06f          	j	80005ae0 <i2c_wait_for_release+0x4>
80005b00:	00100513          	li	a0,1
80005b04:	00008067          	ret

80005b08 <__malloc_lock>:
80005b08:	00008067          	ret

80005b0c <__malloc_unlock>:
80005b0c:	00008067          	ret

80005b10 <init_sbrk>:
80005b10:	800117b7          	lui	a5,0x80011
80005b14:	11078793          	addi	a5,a5,272 # 80011110 <_heap_end+0xfffff110>
80005b18:	8cf1a023          	sw	a5,-1856(gp) # 800030f8 <sbrk_heap_end>
80005b1c:	00008067          	ret

80005b20 <delay>:
80005b20:	00000793          	li	a5,0
80005b24:	00a79463          	bne	a5,a0,80005b2c <delay+0xc>
80005b28:	00008067          	ret
80005b2c:	00060613          	mv	a2,a2
80005b30:	00178793          	addi	a5,a5,1
80005b34:	ff1ff06f          	j	80005b24 <delay+0x4>

80005b38 <delay_us>:
80005b38:	f00b07b7          	lui	a5,0xf00b0
80005b3c:	0007a803          	lw	a6,0(a5) # f00b0000 <_heap_end+0x7009e000>
80005b40:	0047a883          	lw	a7,4(a5)
80005b44:	f00b0637          	lui	a2,0xf00b0
80005b48:	00062303          	lw	t1,0(a2) # f00b0000 <_heap_end+0x7009e000>
80005b4c:	00462383          	lw	t2,4(a2)
80005b50:	410306b3          	sub	a3,t1,a6
80005b54:	00d33733          	sltu	a4,t1,a3
80005b58:	411387b3          	sub	a5,t2,a7
80005b5c:	00e79463          	bne	a5,a4,80005b64 <delay_us+0x2c>
80005b60:	fea6e4e3          	bltu	a3,a0,80005b48 <delay_us+0x10>
80005b64:	00008067          	ret

80005b68 <print_uart0>:
80005b68:	f00106b7          	lui	a3,0xf0010
80005b6c:	00054703          	lbu	a4,0(a0)
80005b70:	00071463          	bnez	a4,80005b78 <print_uart0+0x10>
80005b74:	00008067          	ret
80005b78:	0046a783          	lw	a5,4(a3) # f0010004 <_heap_end+0x6fffe004>
80005b7c:	0107d793          	srli	a5,a5,0x10
80005b80:	0ff7f793          	andi	a5,a5,255
80005b84:	fe078ae3          	beqz	a5,80005b78 <print_uart0+0x10>
80005b88:	00e6a023          	sw	a4,0(a3)
80005b8c:	00150513          	addi	a0,a0,1
80005b90:	fddff06f          	j	80005b6c <print_uart0+0x4>

80005b94 <_sbrk>:
80005b94:	8c01a783          	lw	a5,-1856(gp) # 800030f8 <sbrk_heap_end>
80005b98:	00079863          	bnez	a5,80005ba8 <_sbrk+0x14>
80005b9c:	800117b7          	lui	a5,0x80011
80005ba0:	11078793          	addi	a5,a5,272 # 80011110 <_heap_end+0xfffff110>
80005ba4:	8cf1a023          	sw	a5,-1856(gp) # 800030f8 <sbrk_heap_end>
80005ba8:	8c01a683          	lw	a3,-1856(gp) # 800030f8 <sbrk_heap_end>
80005bac:	80012737          	lui	a4,0x80012
80005bb0:	00070593          	mv	a1,a4
80005bb4:	00a687b3          	add	a5,a3,a0
80005bb8:	04f5f263          	bgeu	a1,a5,80005bfc <_sbrk+0x68>
80005bbc:	f7010113          	addi	sp,sp,-144
80005bc0:	80003637          	lui	a2,0x80003
80005bc4:	00050793          	mv	a5,a0
80005bc8:	00070713          	mv	a4,a4
80005bcc:	b7460613          	addi	a2,a2,-1164 # 80002b74 <_heap_end+0xffff0b74>
80005bd0:	08000593          	li	a1,128
80005bd4:	00010513          	mv	a0,sp
80005bd8:	08112623          	sw	ra,140(sp)
80005bdc:	1b5080ef          	jal	ra,8000e590 <sniprintf>
80005be0:	00010513          	mv	a0,sp
80005be4:	f85ff0ef          	jal	ra,80005b68 <print_uart0>
80005be8:	08c12083          	lw	ra,140(sp)
80005bec:	fff00693          	li	a3,-1
80005bf0:	00068513          	mv	a0,a3
80005bf4:	09010113          	addi	sp,sp,144
80005bf8:	00008067          	ret
80005bfc:	8cf1a023          	sw	a5,-1856(gp) # 800030f8 <sbrk_heap_end>
80005c00:	00068513          	mv	a0,a3
80005c04:	00008067          	ret

80005c08 <print_uart1>:
80005c08:	f00116b7          	lui	a3,0xf0011
80005c0c:	00054703          	lbu	a4,0(a0)
80005c10:	00071463          	bnez	a4,80005c18 <print_uart1+0x10>
80005c14:	00008067          	ret
80005c18:	0046a783          	lw	a5,4(a3) # f0011004 <_heap_end+0x6ffff004>
80005c1c:	0107d793          	srli	a5,a5,0x10
80005c20:	0ff7f793          	andi	a5,a5,255
80005c24:	fe078ae3          	beqz	a5,80005c18 <print_uart1+0x10>
80005c28:	00e6a023          	sw	a4,0(a3)
80005c2c:	00150513          	addi	a0,a0,1
80005c30:	fddff06f          	j	80005c0c <print_uart1+0x4>

80005c34 <_write>:
80005c34:	00c586b3          	add	a3,a1,a2
80005c38:	f0010737          	lui	a4,0xf0010
80005c3c:	00d59663          	bne	a1,a3,80005c48 <_write+0x14>
80005c40:	00060513          	mv	a0,a2
80005c44:	00008067          	ret
80005c48:	00158593          	addi	a1,a1,1
80005c4c:	fff5c503          	lbu	a0,-1(a1)
80005c50:	00472783          	lw	a5,4(a4) # f0010004 <_heap_end+0x6fffe004>
80005c54:	0107d793          	srli	a5,a5,0x10
80005c58:	0ff7f793          	andi	a5,a5,255
80005c5c:	fe078ae3          	beqz	a5,80005c50 <_write+0x1c>
80005c60:	00a72023          	sw	a0,0(a4)
80005c64:	fd9ff06f          	j	80005c3c <_write+0x8>

80005c68 <_read>:
80005c68:	00100513          	li	a0,1
80005c6c:	00008067          	ret

80005c70 <_close>:
80005c70:	fff00513          	li	a0,-1
80005c74:	00008067          	ret

80005c78 <_lseek>:
80005c78:	00000513          	li	a0,0
80005c7c:	00008067          	ret

80005c80 <_isatty>:
80005c80:	00100513          	li	a0,1
80005c84:	00008067          	ret

80005c88 <_fstat>:
80005c88:	000027b7          	lui	a5,0x2
80005c8c:	00f5a223          	sw	a5,4(a1)
80005c90:	00000513          	li	a0,0
80005c94:	00008067          	ret

80005c98 <_kill>:
80005c98:	00008067          	ret

80005c9c <_getpid>:
80005c9c:	fff00513          	li	a0,-1
80005ca0:	00008067          	ret

80005ca4 <hard_reboot>:
80005ca4:	80003537          	lui	a0,0x80003
80005ca8:	ff010113          	addi	sp,sp,-16
80005cac:	bb450513          	addi	a0,a0,-1100 # 80002bb4 <_heap_end+0xffff0bb4>
80005cb0:	00112623          	sw	ra,12(sp)
80005cb4:	eb5ff0ef          	jal	ra,80005b68 <print_uart0>
80005cb8:	3e800513          	li	a0,1000
80005cbc:	e7dff0ef          	jal	ra,80005b38 <delay_us>
80005cc0:	f00a07b7          	lui	a5,0xf00a0
80005cc4:	00100713          	li	a4,1
80005cc8:	00e7a423          	sw	a4,8(a5) # f00a0008 <_heap_end+0x7008e008>
80005ccc:	00c12083          	lw	ra,12(sp)
80005cd0:	01010113          	addi	sp,sp,16
80005cd4:	00008067          	ret

80005cd8 <memcpy_rev>:
80005cd8:	00000793          	li	a5,0
80005cdc:	00f61463          	bne	a2,a5,80005ce4 <memcpy_rev+0xc>
80005ce0:	00008067          	ret
80005ce4:	40f58733          	sub	a4,a1,a5
80005ce8:	00074683          	lbu	a3,0(a4)
80005cec:	00f50733          	add	a4,a0,a5
80005cf0:	00178793          	addi	a5,a5,1
80005cf4:	00d70023          	sb	a3,0(a4)
80005cf8:	fe5ff06f          	j	80005cdc <memcpy_rev+0x4>

80005cfc <lwip_init>:
80005cfc:	ff010113          	addi	sp,sp,-16
80005d00:	00112623          	sw	ra,12(sp)
80005d04:	340020ef          	jal	ra,80008044 <stats_init>
80005d08:	015000ef          	jal	ra,8000651c <mem_init>
80005d0c:	141000ef          	jal	ra,8000664c <memp_init>
80005d10:	27d000ef          	jal	ra,8000678c <netif_init>
80005d14:	618020ef          	jal	ra,8000832c <udp_init>
80005d18:	00c12083          	lw	ra,12(sp)
80005d1c:	01010113          	addi	sp,sp,16
80005d20:	4500206f          	j	80008170 <sys_timeouts_init>

80005d24 <lwip_htons>:
80005d24:	00851793          	slli	a5,a0,0x8
80005d28:	00855513          	srli	a0,a0,0x8
80005d2c:	00a7e533          	or	a0,a5,a0
80005d30:	01051513          	slli	a0,a0,0x10
80005d34:	01055513          	srli	a0,a0,0x10
80005d38:	00008067          	ret

80005d3c <lwip_htonl>:
80005d3c:	01855713          	srli	a4,a0,0x18
80005d40:	01851793          	slli	a5,a0,0x18
80005d44:	00e7e7b3          	or	a5,a5,a4
80005d48:	00ff06b7          	lui	a3,0xff0
80005d4c:	00851713          	slli	a4,a0,0x8
80005d50:	00d77733          	and	a4,a4,a3
80005d54:	00e7e7b3          	or	a5,a5,a4
80005d58:	00010737          	lui	a4,0x10
80005d5c:	f0070713          	addi	a4,a4,-256 # ff00 <_stack_size+0xf700>
80005d60:	00855513          	srli	a0,a0,0x8
80005d64:	00e57533          	and	a0,a0,a4
80005d68:	00a7e533          	or	a0,a5,a0
80005d6c:	00008067          	ret

80005d70 <lwip_strnstr>:
80005d70:	fe010113          	addi	sp,sp,-32
80005d74:	00812c23          	sw	s0,24(sp)
80005d78:	00050413          	mv	s0,a0
80005d7c:	00058513          	mv	a0,a1
80005d80:	00912a23          	sw	s1,20(sp)
80005d84:	01312623          	sw	s3,12(sp)
80005d88:	00112e23          	sw	ra,28(sp)
80005d8c:	01212823          	sw	s2,16(sp)
80005d90:	00058993          	mv	s3,a1
80005d94:	00060493          	mv	s1,a2
80005d98:	2c5080ef          	jal	ra,8000e85c <strlen>
80005d9c:	02050063          	beqz	a0,80005dbc <lwip_strnstr+0x4c>
80005da0:	00050913          	mv	s2,a0
80005da4:	009404b3          	add	s1,s0,s1
80005da8:	00044783          	lbu	a5,0(s0)
80005dac:	00078663          	beqz	a5,80005db8 <lwip_strnstr+0x48>
80005db0:	01240733          	add	a4,s0,s2
80005db4:	02e4f463          	bgeu	s1,a4,80005ddc <lwip_strnstr+0x6c>
80005db8:	00000413          	li	s0,0
80005dbc:	00040513          	mv	a0,s0
80005dc0:	01c12083          	lw	ra,28(sp)
80005dc4:	01812403          	lw	s0,24(sp)
80005dc8:	01412483          	lw	s1,20(sp)
80005dcc:	01012903          	lw	s2,16(sp)
80005dd0:	00c12983          	lw	s3,12(sp)
80005dd4:	02010113          	addi	sp,sp,32
80005dd8:	00008067          	ret
80005ddc:	0009c703          	lbu	a4,0(s3)
80005de0:	00f71c63          	bne	a4,a5,80005df8 <lwip_strnstr+0x88>
80005de4:	00090613          	mv	a2,s2
80005de8:	00098593          	mv	a1,s3
80005dec:	00040513          	mv	a0,s0
80005df0:	289080ef          	jal	ra,8000e878 <strncmp>
80005df4:	fc0504e3          	beqz	a0,80005dbc <lwip_strnstr+0x4c>
80005df8:	00140413          	addi	s0,s0,1
80005dfc:	fadff06f          	j	80005da8 <lwip_strnstr+0x38>

80005e00 <lwip_stricmp>:
80005e00:	01900813          	li	a6,25
80005e04:	00150513          	addi	a0,a0,1
80005e08:	00158593          	addi	a1,a1,1
80005e0c:	fff54703          	lbu	a4,-1(a0)
80005e10:	fff5c783          	lbu	a5,-1(a1)
80005e14:	00f70e63          	beq	a4,a5,80005e30 <lwip_stricmp+0x30>
80005e18:	02076613          	ori	a2,a4,32
80005e1c:	f9f60693          	addi	a3,a2,-97
80005e20:	0ff6f693          	andi	a3,a3,255
80005e24:	00d86c63          	bltu	a6,a3,80005e3c <lwip_stricmp+0x3c>
80005e28:	0207e793          	ori	a5,a5,32
80005e2c:	00f61863          	bne	a2,a5,80005e3c <lwip_stricmp+0x3c>
80005e30:	fc071ae3          	bnez	a4,80005e04 <lwip_stricmp+0x4>
80005e34:	00000513          	li	a0,0
80005e38:	00008067          	ret
80005e3c:	00100513          	li	a0,1
80005e40:	00008067          	ret

80005e44 <lwip_strnicmp>:
80005e44:	fff60613          	addi	a2,a2,-1
80005e48:	00000793          	li	a5,0
80005e4c:	01900313          	li	t1,25
80005e50:	00f50733          	add	a4,a0,a5
80005e54:	00074683          	lbu	a3,0(a4)
80005e58:	00f58733          	add	a4,a1,a5
80005e5c:	00074703          	lbu	a4,0(a4)
80005e60:	00e68e63          	beq	a3,a4,80005e7c <lwip_strnicmp+0x38>
80005e64:	0206e893          	ori	a7,a3,32
80005e68:	f9f88813          	addi	a6,a7,-97
80005e6c:	0ff87813          	andi	a6,a6,255
80005e70:	03036063          	bltu	t1,a6,80005e90 <lwip_strnicmp+0x4c>
80005e74:	02076713          	ori	a4,a4,32
80005e78:	00e89c63          	bne	a7,a4,80005e90 <lwip_strnicmp+0x4c>
80005e7c:	00f60663          	beq	a2,a5,80005e88 <lwip_strnicmp+0x44>
80005e80:	00178793          	addi	a5,a5,1
80005e84:	fc0696e3          	bnez	a3,80005e50 <lwip_strnicmp+0xc>
80005e88:	00000513          	li	a0,0
80005e8c:	00008067          	ret
80005e90:	00100513          	li	a0,1
80005e94:	00008067          	ret

80005e98 <lwip_itoa>:
80005e98:	fe010113          	addi	sp,sp,-32
80005e9c:	01212823          	sw	s2,16(sp)
80005ea0:	01412423          	sw	s4,8(sp)
80005ea4:	00112e23          	sw	ra,28(sp)
80005ea8:	00812c23          	sw	s0,24(sp)
80005eac:	00912a23          	sw	s1,20(sp)
80005eb0:	01312623          	sw	s3,12(sp)
80005eb4:	00100793          	li	a5,1
80005eb8:	00050913          	mv	s2,a0
80005ebc:	00058a13          	mv	s4,a1
80005ec0:	02b7e663          	bltu	a5,a1,80005eec <lwip_itoa+0x54>
80005ec4:	00f59463          	bne	a1,a5,80005ecc <lwip_itoa+0x34>
80005ec8:	00090023          	sb	zero,0(s2)
80005ecc:	01c12083          	lw	ra,28(sp)
80005ed0:	01812403          	lw	s0,24(sp)
80005ed4:	01412483          	lw	s1,20(sp)
80005ed8:	01012903          	lw	s2,16(sp)
80005edc:	00c12983          	lw	s3,12(sp)
80005ee0:	00812a03          	lw	s4,8(sp)
80005ee4:	02010113          	addi	sp,sp,32
80005ee8:	00008067          	ret
80005eec:	00050993          	mv	s3,a0
80005ef0:	00065863          	bgez	a2,80005f00 <lwip_itoa+0x68>
80005ef4:	02d00793          	li	a5,45
80005ef8:	00150993          	addi	s3,a0,1
80005efc:	00f50023          	sb	a5,0(a0)
80005f00:	41f65793          	srai	a5,a2,0x1f
80005f04:	fffa0413          	addi	s0,s4,-1
80005f08:	00890433          	add	s0,s2,s0
80005f0c:	00c7c4b3          	xor	s1,a5,a2
80005f10:	40f484b3          	sub	s1,s1,a5
80005f14:	00040023          	sb	zero,0(s0)
80005f18:	04048263          	beqz	s1,80005f5c <lwip_itoa+0xc4>
80005f1c:	fa89f6e3          	bgeu	s3,s0,80005ec8 <lwip_itoa+0x30>
80005f20:	00a00593          	li	a1,10
80005f24:	00048513          	mv	a0,s1
80005f28:	410070ef          	jal	ra,8000d338 <__modsi3>
80005f2c:	03050513          	addi	a0,a0,48
80005f30:	fff40413          	addi	s0,s0,-1
80005f34:	00a40023          	sb	a0,0(s0)
80005f38:	00a00593          	li	a1,10
80005f3c:	00048513          	mv	a0,s1
80005f40:	374070ef          	jal	ra,8000d2b4 <__divsi3>
80005f44:	00050493          	mv	s1,a0
80005f48:	fd1ff06f          	j	80005f18 <lwip_itoa+0x80>
80005f4c:	03000793          	li	a5,48
80005f50:	00f98023          	sb	a5,0(s3)
80005f54:	000980a3          	sb	zero,1(s3)
80005f58:	f75ff06f          	j	80005ecc <lwip_itoa+0x34>
80005f5c:	00044783          	lbu	a5,0(s0)
80005f60:	fe0786e3          	beqz	a5,80005f4c <lwip_itoa+0xb4>
80005f64:	01490633          	add	a2,s2,s4
80005f68:	40860633          	sub	a2,a2,s0
80005f6c:	00040593          	mv	a1,s0
80005f70:	01812403          	lw	s0,24(sp)
80005f74:	01c12083          	lw	ra,28(sp)
80005f78:	01412483          	lw	s1,20(sp)
80005f7c:	01012903          	lw	s2,16(sp)
80005f80:	00812a03          	lw	s4,8(sp)
80005f84:	00098513          	mv	a0,s3
80005f88:	00c12983          	lw	s3,12(sp)
80005f8c:	02010113          	addi	sp,sp,32
80005f90:	12c0806f          	j	8000e0bc <memmove>

80005f94 <lwip_standard_chksum>:
80005f94:	ff010113          	addi	sp,sp,-16
80005f98:	00011723          	sh	zero,14(sp)
80005f9c:	00157693          	andi	a3,a0,1
80005fa0:	00068c63          	beqz	a3,80005fb8 <lwip_standard_chksum+0x24>
80005fa4:	00b05a63          	blez	a1,80005fb8 <lwip_standard_chksum+0x24>
80005fa8:	00054783          	lbu	a5,0(a0)
80005fac:	fff58593          	addi	a1,a1,-1
80005fb0:	00150513          	addi	a0,a0,1
80005fb4:	00f107a3          	sb	a5,15(sp)
80005fb8:	00000793          	li	a5,0
80005fbc:	00100713          	li	a4,1
80005fc0:	06b74063          	blt	a4,a1,80006020 <lwip_standard_chksum+0x8c>
80005fc4:	00e59663          	bne	a1,a4,80005fd0 <lwip_standard_chksum+0x3c>
80005fc8:	00054703          	lbu	a4,0(a0)
80005fcc:	00e10723          	sb	a4,14(sp)
80005fd0:	00e15503          	lhu	a0,14(sp)
80005fd4:	00010737          	lui	a4,0x10
80005fd8:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
80005fdc:	00f50533          	add	a0,a0,a5
80005fe0:	01055793          	srli	a5,a0,0x10
80005fe4:	00e57533          	and	a0,a0,a4
80005fe8:	00a787b3          	add	a5,a5,a0
80005fec:	0107d513          	srli	a0,a5,0x10
80005ff0:	00e7f7b3          	and	a5,a5,a4
80005ff4:	00f50533          	add	a0,a0,a5
80005ff8:	00068c63          	beqz	a3,80006010 <lwip_standard_chksum+0x7c>
80005ffc:	00851793          	slli	a5,a0,0x8
80006000:	00855513          	srli	a0,a0,0x8
80006004:	00e7f733          	and	a4,a5,a4
80006008:	0ff57513          	andi	a0,a0,255
8000600c:	00a76533          	or	a0,a4,a0
80006010:	01051513          	slli	a0,a0,0x10
80006014:	01055513          	srli	a0,a0,0x10
80006018:	01010113          	addi	sp,sp,16
8000601c:	00008067          	ret
80006020:	00250513          	addi	a0,a0,2
80006024:	ffe55603          	lhu	a2,-2(a0)
80006028:	ffe58593          	addi	a1,a1,-2
8000602c:	00c787b3          	add	a5,a5,a2
80006030:	f91ff06f          	j	80005fc0 <lwip_standard_chksum+0x2c>

80006034 <inet_chksum_pseudo>:
80006034:	fe010113          	addi	sp,sp,-32
80006038:	00812c23          	sw	s0,24(sp)
8000603c:	00912a23          	sw	s1,20(sp)
80006040:	01212823          	sw	s2,16(sp)
80006044:	01312623          	sw	s3,12(sp)
80006048:	01412423          	sw	s4,8(sp)
8000604c:	01512223          	sw	s5,4(sp)
80006050:	00112e23          	sw	ra,28(sp)
80006054:	00072703          	lw	a4,0(a4)
80006058:	0006a683          	lw	a3,0(a3) # ff0000 <_stack_size+0xfef800>
8000605c:	000107b7          	lui	a5,0x10
80006060:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80006064:	00f77433          	and	s0,a4,a5
80006068:	01075713          	srli	a4,a4,0x10
8000606c:	00e40433          	add	s0,s0,a4
80006070:	00f6f733          	and	a4,a3,a5
80006074:	00e40433          	add	s0,s0,a4
80006078:	0106d693          	srli	a3,a3,0x10
8000607c:	008686b3          	add	a3,a3,s0
80006080:	0106d413          	srli	s0,a3,0x10
80006084:	00f6f6b3          	and	a3,a3,a5
80006088:	00d406b3          	add	a3,s0,a3
8000608c:	0106d413          	srli	s0,a3,0x10
80006090:	00f6f6b3          	and	a3,a3,a5
80006094:	00050993          	mv	s3,a0
80006098:	00058a13          	mv	s4,a1
8000609c:	00060913          	mv	s2,a2
800060a0:	00d40433          	add	s0,s0,a3
800060a4:	00000a93          	li	s5,0
800060a8:	00078493          	mv	s1,a5
800060ac:	08099863          	bnez	s3,8000613c <inet_chksum_pseudo+0x108>
800060b0:	020a8063          	beqz	s5,800060d0 <inet_chksum_pseudo+0x9c>
800060b4:	00010737          	lui	a4,0x10
800060b8:	00841793          	slli	a5,s0,0x8
800060bc:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
800060c0:	00845413          	srli	s0,s0,0x8
800060c4:	00e7f7b3          	and	a5,a5,a4
800060c8:	0ff47413          	andi	s0,s0,255
800060cc:	0087e433          	or	s0,a5,s0
800060d0:	000a0513          	mv	a0,s4
800060d4:	c51ff0ef          	jal	ra,80005d24 <lwip_htons>
800060d8:	00050493          	mv	s1,a0
800060dc:	00090513          	mv	a0,s2
800060e0:	c45ff0ef          	jal	ra,80005d24 <lwip_htons>
800060e4:	00a48533          	add	a0,s1,a0
800060e8:	000107b7          	lui	a5,0x10
800060ec:	00850433          	add	s0,a0,s0
800060f0:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
800060f4:	01045513          	srli	a0,s0,0x10
800060f8:	00f47433          	and	s0,s0,a5
800060fc:	00850433          	add	s0,a0,s0
80006100:	01045513          	srli	a0,s0,0x10
80006104:	00f47433          	and	s0,s0,a5
80006108:	00850433          	add	s0,a0,s0
8000610c:	fff44513          	not	a0,s0
80006110:	01c12083          	lw	ra,28(sp)
80006114:	01812403          	lw	s0,24(sp)
80006118:	01051513          	slli	a0,a0,0x10
8000611c:	01412483          	lw	s1,20(sp)
80006120:	01012903          	lw	s2,16(sp)
80006124:	00c12983          	lw	s3,12(sp)
80006128:	00812a03          	lw	s4,8(sp)
8000612c:	00412a83          	lw	s5,4(sp)
80006130:	01055513          	srli	a0,a0,0x10
80006134:	02010113          	addi	sp,sp,32
80006138:	00008067          	ret
8000613c:	00a9d583          	lhu	a1,10(s3)
80006140:	0049a503          	lw	a0,4(s3)
80006144:	e51ff0ef          	jal	ra,80005f94 <lwip_standard_chksum>
80006148:	00850433          	add	s0,a0,s0
8000614c:	01045793          	srli	a5,s0,0x10
80006150:	00947433          	and	s0,s0,s1
80006154:	00878433          	add	s0,a5,s0
80006158:	00a9d783          	lhu	a5,10(s3)
8000615c:	0017f793          	andi	a5,a5,1
80006160:	00078e63          	beqz	a5,8000617c <inet_chksum_pseudo+0x148>
80006164:	00841793          	slli	a5,s0,0x8
80006168:	00845413          	srli	s0,s0,0x8
8000616c:	0097f7b3          	and	a5,a5,s1
80006170:	0ff47413          	andi	s0,s0,255
80006174:	001aca93          	xori	s5,s5,1
80006178:	0087e433          	or	s0,a5,s0
8000617c:	0009a983          	lw	s3,0(s3)
80006180:	f2dff06f          	j	800060ac <inet_chksum_pseudo+0x78>

80006184 <ip_chksum_pseudo>:
80006184:	eb1ff06f          	j	80006034 <inet_chksum_pseudo>

80006188 <inet_chksum_pseudo_partial>:
80006188:	fd010113          	addi	sp,sp,-48
8000618c:	02812423          	sw	s0,40(sp)
80006190:	02912223          	sw	s1,36(sp)
80006194:	03212023          	sw	s2,32(sp)
80006198:	01412c23          	sw	s4,24(sp)
8000619c:	01512a23          	sw	s5,20(sp)
800061a0:	01612823          	sw	s6,16(sp)
800061a4:	02112623          	sw	ra,44(sp)
800061a8:	01312e23          	sw	s3,28(sp)
800061ac:	00060913          	mv	s2,a2
800061b0:	0007a603          	lw	a2,0(a5)
800061b4:	00072703          	lw	a4,0(a4)
800061b8:	000107b7          	lui	a5,0x10
800061bc:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
800061c0:	00f67433          	and	s0,a2,a5
800061c4:	01065613          	srli	a2,a2,0x10
800061c8:	00c40433          	add	s0,s0,a2
800061cc:	00f77633          	and	a2,a4,a5
800061d0:	00c40433          	add	s0,s0,a2
800061d4:	01075713          	srli	a4,a4,0x10
800061d8:	00870733          	add	a4,a4,s0
800061dc:	01075413          	srli	s0,a4,0x10
800061e0:	00f77733          	and	a4,a4,a5
800061e4:	00e40733          	add	a4,s0,a4
800061e8:	01075413          	srli	s0,a4,0x10
800061ec:	00f77733          	and	a4,a4,a5
800061f0:	00050a13          	mv	s4,a0
800061f4:	00058a93          	mv	s5,a1
800061f8:	00e40433          	add	s0,s0,a4
800061fc:	00000b13          	li	s6,0
80006200:	00078493          	mv	s1,a5
80006204:	060a1c63          	bnez	s4,8000627c <inet_chksum_pseudo_partial+0xf4>
80006208:	0e0b1663          	bnez	s6,800062f4 <inet_chksum_pseudo_partial+0x16c>
8000620c:	000a8513          	mv	a0,s5
80006210:	b15ff0ef          	jal	ra,80005d24 <lwip_htons>
80006214:	00050493          	mv	s1,a0
80006218:	00090513          	mv	a0,s2
8000621c:	b09ff0ef          	jal	ra,80005d24 <lwip_htons>
80006220:	00a48533          	add	a0,s1,a0
80006224:	000107b7          	lui	a5,0x10
80006228:	00850433          	add	s0,a0,s0
8000622c:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80006230:	01045513          	srli	a0,s0,0x10
80006234:	00f47433          	and	s0,s0,a5
80006238:	00850433          	add	s0,a0,s0
8000623c:	01045513          	srli	a0,s0,0x10
80006240:	00f47433          	and	s0,s0,a5
80006244:	00850433          	add	s0,a0,s0
80006248:	fff44513          	not	a0,s0
8000624c:	02c12083          	lw	ra,44(sp)
80006250:	02812403          	lw	s0,40(sp)
80006254:	01051513          	slli	a0,a0,0x10
80006258:	02412483          	lw	s1,36(sp)
8000625c:	02012903          	lw	s2,32(sp)
80006260:	01c12983          	lw	s3,28(sp)
80006264:	01812a03          	lw	s4,24(sp)
80006268:	01412a83          	lw	s5,20(sp)
8000626c:	01012b03          	lw	s6,16(sp)
80006270:	01055513          	srli	a0,a0,0x10
80006274:	03010113          	addi	sp,sp,48
80006278:	00008067          	ret
8000627c:	f80686e3          	beqz	a3,80006208 <inet_chksum_pseudo_partial+0x80>
80006280:	00aa5783          	lhu	a5,10(s4)
80006284:	00078993          	mv	s3,a5
80006288:	00f6f463          	bgeu	a3,a5,80006290 <inet_chksum_pseudo_partial+0x108>
8000628c:	00068993          	mv	s3,a3
80006290:	01099993          	slli	s3,s3,0x10
80006294:	004a2503          	lw	a0,4(s4)
80006298:	0109d993          	srli	s3,s3,0x10
8000629c:	00098593          	mv	a1,s3
800062a0:	00d12623          	sw	a3,12(sp)
800062a4:	cf1ff0ef          	jal	ra,80005f94 <lwip_standard_chksum>
800062a8:	00850433          	add	s0,a0,s0
800062ac:	01045793          	srli	a5,s0,0x10
800062b0:	00c12683          	lw	a3,12(sp)
800062b4:	00947433          	and	s0,s0,s1
800062b8:	00878433          	add	s0,a5,s0
800062bc:	00aa5783          	lhu	a5,10(s4)
800062c0:	413689b3          	sub	s3,a3,s3
800062c4:	01099693          	slli	a3,s3,0x10
800062c8:	0017f793          	andi	a5,a5,1
800062cc:	0106d693          	srli	a3,a3,0x10
800062d0:	00078e63          	beqz	a5,800062ec <inet_chksum_pseudo_partial+0x164>
800062d4:	00841793          	slli	a5,s0,0x8
800062d8:	00845413          	srli	s0,s0,0x8
800062dc:	0097f7b3          	and	a5,a5,s1
800062e0:	0ff47413          	andi	s0,s0,255
800062e4:	001b4b13          	xori	s6,s6,1
800062e8:	0087e433          	or	s0,a5,s0
800062ec:	000a2a03          	lw	s4,0(s4)
800062f0:	f15ff06f          	j	80006204 <inet_chksum_pseudo_partial+0x7c>
800062f4:	00010737          	lui	a4,0x10
800062f8:	00841793          	slli	a5,s0,0x8
800062fc:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
80006300:	00845413          	srli	s0,s0,0x8
80006304:	00e7f7b3          	and	a5,a5,a4
80006308:	0ff47413          	andi	s0,s0,255
8000630c:	0087e433          	or	s0,a5,s0
80006310:	efdff06f          	j	8000620c <inet_chksum_pseudo_partial+0x84>

80006314 <ip_chksum_pseudo_partial>:
80006314:	e75ff06f          	j	80006188 <inet_chksum_pseudo_partial>

80006318 <inet_chksum>:
80006318:	ff010113          	addi	sp,sp,-16
8000631c:	00112623          	sw	ra,12(sp)
80006320:	c75ff0ef          	jal	ra,80005f94 <lwip_standard_chksum>
80006324:	00c12083          	lw	ra,12(sp)
80006328:	fff54513          	not	a0,a0
8000632c:	01051513          	slli	a0,a0,0x10
80006330:	01055513          	srli	a0,a0,0x10
80006334:	01010113          	addi	sp,sp,16
80006338:	00008067          	ret

8000633c <inet_chksum_pbuf>:
8000633c:	fe010113          	addi	sp,sp,-32
80006340:	01212823          	sw	s2,16(sp)
80006344:	00010937          	lui	s2,0x10
80006348:	00812c23          	sw	s0,24(sp)
8000634c:	00912a23          	sw	s1,20(sp)
80006350:	01312623          	sw	s3,12(sp)
80006354:	00112e23          	sw	ra,28(sp)
80006358:	00050493          	mv	s1,a0
8000635c:	00000993          	li	s3,0
80006360:	00000413          	li	s0,0
80006364:	fff90913          	addi	s2,s2,-1 # ffff <_stack_size+0xf7ff>
80006368:	04049663          	bnez	s1,800063b4 <inet_chksum_pbuf+0x78>
8000636c:	02098063          	beqz	s3,8000638c <inet_chksum_pbuf+0x50>
80006370:	00010737          	lui	a4,0x10
80006374:	00841793          	slli	a5,s0,0x8
80006378:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
8000637c:	00845413          	srli	s0,s0,0x8
80006380:	00e7f7b3          	and	a5,a5,a4
80006384:	0ff47413          	andi	s0,s0,255
80006388:	0087e433          	or	s0,a5,s0
8000638c:	fff44513          	not	a0,s0
80006390:	01c12083          	lw	ra,28(sp)
80006394:	01812403          	lw	s0,24(sp)
80006398:	01051513          	slli	a0,a0,0x10
8000639c:	01412483          	lw	s1,20(sp)
800063a0:	01012903          	lw	s2,16(sp)
800063a4:	00c12983          	lw	s3,12(sp)
800063a8:	01055513          	srli	a0,a0,0x10
800063ac:	02010113          	addi	sp,sp,32
800063b0:	00008067          	ret
800063b4:	00a4d583          	lhu	a1,10(s1)
800063b8:	0044a503          	lw	a0,4(s1)
800063bc:	bd9ff0ef          	jal	ra,80005f94 <lwip_standard_chksum>
800063c0:	00850433          	add	s0,a0,s0
800063c4:	01045793          	srli	a5,s0,0x10
800063c8:	01247433          	and	s0,s0,s2
800063cc:	00878433          	add	s0,a5,s0
800063d0:	00a4d783          	lhu	a5,10(s1)
800063d4:	0017f793          	andi	a5,a5,1
800063d8:	00078e63          	beqz	a5,800063f4 <inet_chksum_pbuf+0xb8>
800063dc:	00841793          	slli	a5,s0,0x8
800063e0:	00845413          	srli	s0,s0,0x8
800063e4:	0127f7b3          	and	a5,a5,s2
800063e8:	0ff47413          	andi	s0,s0,255
800063ec:	0019c993          	xori	s3,s3,1
800063f0:	0087e433          	or	s0,a5,s0
800063f4:	0004a483          	lw	s1,0(s1)
800063f8:	f71ff06f          	j	80006368 <inet_chksum_pbuf+0x2c>

800063fc <mem_overflow_check_raw>:
800063fc:	f5010113          	addi	sp,sp,-176
80006400:	0a812423          	sw	s0,168(sp)
80006404:	0a912223          	sw	s1,164(sp)
80006408:	0b212023          	sw	s2,160(sp)
8000640c:	09312e23          	sw	s3,156(sp)
80006410:	09412c23          	sw	s4,152(sp)
80006414:	09512a23          	sw	s5,148(sp)
80006418:	09612823          	sw	s6,144(sp)
8000641c:	09712623          	sw	s7,140(sp)
80006420:	0a112623          	sw	ra,172(sp)
80006424:	00050493          	mv	s1,a0
80006428:	00058a93          	mv	s5,a1
8000642c:	00060913          	mv	s2,a2
80006430:	00068993          	mv	s3,a3
80006434:	00000413          	li	s0,0
80006438:	0cd00b13          	li	s6,205
8000643c:	80003bb7          	lui	s7,0x80003
80006440:	01000a13          	li	s4,16
80006444:	008a87b3          	add	a5,s5,s0
80006448:	00f487b3          	add	a5,s1,a5
8000644c:	0007c783          	lbu	a5,0(a5)
80006450:	01678e63          	beq	a5,s6,8000646c <mem_overflow_check_raw+0x70>
80006454:	00098713          	mv	a4,s3
80006458:	00090693          	mv	a3,s2
8000645c:	bd0b8613          	addi	a2,s7,-1072 # 80002bd0 <_heap_end+0xffff0bd0>
80006460:	08000593          	li	a1,128
80006464:	00010513          	mv	a0,sp
80006468:	128080ef          	jal	ra,8000e590 <sniprintf>
8000646c:	00140413          	addi	s0,s0,1
80006470:	fd441ae3          	bne	s0,s4,80006444 <mem_overflow_check_raw+0x48>
80006474:	ff048413          	addi	s0,s1,-16
80006478:	0cd00a13          	li	s4,205
8000647c:	80003ab7          	lui	s5,0x80003
80006480:	00044783          	lbu	a5,0(s0)
80006484:	01478e63          	beq	a5,s4,800064a0 <mem_overflow_check_raw+0xa4>
80006488:	00098713          	mv	a4,s3
8000648c:	00090693          	mv	a3,s2
80006490:	bf0a8613          	addi	a2,s5,-1040 # 80002bf0 <_heap_end+0xffff0bf0>
80006494:	08000593          	li	a1,128
80006498:	00010513          	mv	a0,sp
8000649c:	0f4080ef          	jal	ra,8000e590 <sniprintf>
800064a0:	00140413          	addi	s0,s0,1
800064a4:	fc849ee3          	bne	s1,s0,80006480 <mem_overflow_check_raw+0x84>
800064a8:	0ac12083          	lw	ra,172(sp)
800064ac:	0a812403          	lw	s0,168(sp)
800064b0:	0a412483          	lw	s1,164(sp)
800064b4:	0a012903          	lw	s2,160(sp)
800064b8:	09c12983          	lw	s3,156(sp)
800064bc:	09812a03          	lw	s4,152(sp)
800064c0:	09412a83          	lw	s5,148(sp)
800064c4:	09012b03          	lw	s6,144(sp)
800064c8:	08c12b83          	lw	s7,140(sp)
800064cc:	0b010113          	addi	sp,sp,176
800064d0:	00008067          	ret

800064d4 <mem_overflow_init_raw>:
800064d4:	ff010113          	addi	sp,sp,-16
800064d8:	00812423          	sw	s0,8(sp)
800064dc:	00912223          	sw	s1,4(sp)
800064e0:	00050413          	mv	s0,a0
800064e4:	00058493          	mv	s1,a1
800064e8:	01000613          	li	a2,16
800064ec:	0cd00593          	li	a1,205
800064f0:	ff050513          	addi	a0,a0,-16
800064f4:	00112623          	sw	ra,12(sp)
800064f8:	6b4060ef          	jal	ra,8000cbac <memset>
800064fc:	00940533          	add	a0,s0,s1
80006500:	00812403          	lw	s0,8(sp)
80006504:	00c12083          	lw	ra,12(sp)
80006508:	00412483          	lw	s1,4(sp)
8000650c:	01000613          	li	a2,16
80006510:	0cd00593          	li	a1,205
80006514:	01010113          	addi	sp,sp,16
80006518:	6940606f          	j	8000cbac <memset>

8000651c <mem_init>:
8000651c:	00008067          	ret

80006520 <mem_trim>:
80006520:	00008067          	ret

80006524 <lwip_malloc>:
80006524:	ff010113          	addi	sp,sp,-16
80006528:	00812423          	sw	s0,8(sp)
8000652c:	00112623          	sw	ra,12(sp)
80006530:	265070ef          	jal	ra,8000df94 <malloc>
80006534:	00050413          	mv	s0,a0
80006538:	00051663          	bnez	a0,80006544 <lwip_malloc+0x20>
8000653c:	921fe0ef          	jal	ra,80004e5c <sys_arch_protect>
80006540:	921fe0ef          	jal	ra,80004e60 <sys_arch_unprotect>
80006544:	00040513          	mv	a0,s0
80006548:	00c12083          	lw	ra,12(sp)
8000654c:	00812403          	lw	s0,8(sp)
80006550:	01010113          	addi	sp,sp,16
80006554:	00008067          	ret

80006558 <lwip_free>:
80006558:	24d0706f          	j	8000dfa4 <free>

8000655c <lwip_calloc>:
8000655c:	3200706f          	j	8000d87c <calloc>

80006560 <do_memp_free_pool>:
80006560:	ff010113          	addi	sp,sp,-16
80006564:	00112623          	sw	ra,12(sp)
80006568:	00812423          	sw	s0,8(sp)
8000656c:	00912223          	sw	s1,4(sp)
80006570:	01212023          	sw	s2,0(sp)
80006574:	00058413          	mv	s0,a1
80006578:	00050493          	mv	s1,a0
8000657c:	8e1fe0ef          	jal	ra,80004e5c <sys_arch_protect>
80006580:	0004a683          	lw	a3,0(s1)
80006584:	0044d583          	lhu	a1,4(s1)
80006588:	80003637          	lui	a2,0x80003
8000658c:	00050913          	mv	s2,a0
80006590:	c2860613          	addi	a2,a2,-984 # 80002c28 <_heap_end+0xffff0c28>
80006594:	00040513          	mv	a0,s0
80006598:	e65ff0ef          	jal	ra,800063fc <mem_overflow_check_raw>
8000659c:	00090513          	mv	a0,s2
800065a0:	8c1fe0ef          	jal	ra,80004e60 <sys_arch_unprotect>
800065a4:	fe440513          	addi	a0,s0,-28
800065a8:	00812403          	lw	s0,8(sp)
800065ac:	00c12083          	lw	ra,12(sp)
800065b0:	00412483          	lw	s1,4(sp)
800065b4:	00012903          	lw	s2,0(sp)
800065b8:	01010113          	addi	sp,sp,16
800065bc:	f9dff06f          	j	80006558 <lwip_free>

800065c0 <do_memp_malloc_pool_fn>:
800065c0:	fe010113          	addi	sp,sp,-32
800065c4:	00812c23          	sw	s0,24(sp)
800065c8:	00912a23          	sw	s1,20(sp)
800065cc:	00112e23          	sw	ra,28(sp)
800065d0:	01212823          	sw	s2,16(sp)
800065d4:	00050493          	mv	s1,a0
800065d8:	00455503          	lhu	a0,4(a0)
800065dc:	00b12623          	sw	a1,12(sp)
800065e0:	00c12423          	sw	a2,8(sp)
800065e4:	00350513          	addi	a0,a0,3
800065e8:	ffc57513          	andi	a0,a0,-4
800065ec:	02c50513          	addi	a0,a0,44
800065f0:	f35ff0ef          	jal	ra,80006524 <lwip_malloc>
800065f4:	00050413          	mv	s0,a0
800065f8:	865fe0ef          	jal	ra,80004e5c <sys_arch_protect>
800065fc:	02040663          	beqz	s0,80006628 <do_memp_malloc_pool_fn+0x68>
80006600:	00c12583          	lw	a1,12(sp)
80006604:	00812603          	lw	a2,8(sp)
80006608:	01c40413          	addi	s0,s0,28
8000660c:	feb42423          	sw	a1,-24(s0)
80006610:	fec42623          	sw	a2,-20(s0)
80006614:	0044d583          	lhu	a1,4(s1)
80006618:	00050913          	mv	s2,a0
8000661c:	00040513          	mv	a0,s0
80006620:	eb5ff0ef          	jal	ra,800064d4 <mem_overflow_init_raw>
80006624:	00090513          	mv	a0,s2
80006628:	839fe0ef          	jal	ra,80004e60 <sys_arch_unprotect>
8000662c:	00040513          	mv	a0,s0
80006630:	01c12083          	lw	ra,28(sp)
80006634:	01812403          	lw	s0,24(sp)
80006638:	01412483          	lw	s1,20(sp)
8000663c:	01012903          	lw	s2,16(sp)
80006640:	02010113          	addi	sp,sp,32
80006644:	00008067          	ret

80006648 <memp_init_pool>:
80006648:	00008067          	ret

8000664c <memp_init>:
8000664c:	00008067          	ret

80006650 <memp_malloc_pool_fn>:
80006650:	00050463          	beqz	a0,80006658 <memp_malloc_pool_fn+0x8>
80006654:	f6dff06f          	j	800065c0 <do_memp_malloc_pool_fn>
80006658:	00008067          	ret

8000665c <memp_malloc_fn>:
8000665c:	00500793          	li	a5,5
80006660:	00a7ee63          	bltu	a5,a0,8000667c <memp_malloc_fn+0x20>
80006664:	00251793          	slli	a5,a0,0x2
80006668:	80003537          	lui	a0,0x80003
8000666c:	c1050513          	addi	a0,a0,-1008 # 80002c10 <_heap_end+0xffff0c10>
80006670:	00f50533          	add	a0,a0,a5
80006674:	00052503          	lw	a0,0(a0)
80006678:	f49ff06f          	j	800065c0 <do_memp_malloc_pool_fn>
8000667c:	00000513          	li	a0,0
80006680:	00008067          	ret

80006684 <memp_free_pool>:
80006684:	00050663          	beqz	a0,80006690 <memp_free_pool+0xc>
80006688:	00058463          	beqz	a1,80006690 <memp_free_pool+0xc>
8000668c:	ed5ff06f          	j	80006560 <do_memp_free_pool>
80006690:	00008067          	ret

80006694 <memp_free>:
80006694:	00500713          	li	a4,5
80006698:	02a76063          	bltu	a4,a0,800066b8 <memp_free+0x24>
8000669c:	00058e63          	beqz	a1,800066b8 <memp_free+0x24>
800066a0:	00251793          	slli	a5,a0,0x2
800066a4:	80003537          	lui	a0,0x80003
800066a8:	c1050513          	addi	a0,a0,-1008 # 80002c10 <_heap_end+0xffff0c10>
800066ac:	00f50533          	add	a0,a0,a5
800066b0:	00052503          	lw	a0,0(a0)
800066b4:	eadff06f          	j	80006560 <do_memp_free_pool>
800066b8:	00008067          	ret

800066bc <netif_null_output_ip4>:
800066bc:	ff400513          	li	a0,-12
800066c0:	00008067          	ret

800066c4 <netif_issue_reports>:
800066c4:	03554783          	lbu	a5,53(a0)
800066c8:	00500693          	li	a3,5
800066cc:	0057f613          	andi	a2,a5,5
800066d0:	02d61263          	bne	a2,a3,800066f4 <netif_issue_reports+0x30>
800066d4:	0015f593          	andi	a1,a1,1
800066d8:	00058e63          	beqz	a1,800066f4 <netif_issue_reports+0x30>
800066dc:	00452683          	lw	a3,4(a0)
800066e0:	00068a63          	beqz	a3,800066f4 <netif_issue_reports+0x30>
800066e4:	0087f793          	andi	a5,a5,8
800066e8:	00078663          	beqz	a5,800066f4 <netif_issue_reports+0x30>
800066ec:	00450593          	addi	a1,a0,4
800066f0:	0e50406f          	j	8000afd4 <etharp_request>
800066f4:	00008067          	ret

800066f8 <netif_do_set_ipaddr>:
800066f8:	00452783          	lw	a5,4(a0)
800066fc:	0005a703          	lw	a4,0(a1)
80006700:	08f70263          	beq	a4,a5,80006784 <netif_do_set_ipaddr+0x8c>
80006704:	fe010113          	addi	sp,sp,-32
80006708:	00f62023          	sw	a5,0(a2)
8000670c:	00812c23          	sw	s0,24(sp)
80006710:	01212823          	sw	s2,16(sp)
80006714:	00050413          	mv	s0,a0
80006718:	00058913          	mv	s2,a1
8000671c:	00060513          	mv	a0,a2
80006720:	00c10593          	addi	a1,sp,12
80006724:	00112e23          	sw	ra,28(sp)
80006728:	00e12623          	sw	a4,12(sp)
8000672c:	00912a23          	sw	s1,20(sp)
80006730:	00060493          	mv	s1,a2
80006734:	464020ef          	jal	ra,80008b98 <udp_netif_ip_addr_changed>
80006738:	00c10593          	addi	a1,sp,12
8000673c:	00048513          	mv	a0,s1
80006740:	0c5010ef          	jal	ra,80008004 <raw_netif_ip_addr_changed>
80006744:	00092783          	lw	a5,0(s2)
80006748:	00100593          	li	a1,1
8000674c:	00040513          	mv	a0,s0
80006750:	00f42223          	sw	a5,4(s0)
80006754:	f71ff0ef          	jal	ra,800066c4 <netif_issue_reports>
80006758:	01c42783          	lw	a5,28(s0)
8000675c:	00078663          	beqz	a5,80006768 <netif_do_set_ipaddr+0x70>
80006760:	00040513          	mv	a0,s0
80006764:	000780e7          	jalr	a5
80006768:	01c12083          	lw	ra,28(sp)
8000676c:	01812403          	lw	s0,24(sp)
80006770:	01412483          	lw	s1,20(sp)
80006774:	01012903          	lw	s2,16(sp)
80006778:	00100513          	li	a0,1
8000677c:	02010113          	addi	sp,sp,32
80006780:	00008067          	ret
80006784:	00000513          	li	a0,0
80006788:	00008067          	ret

8000678c <netif_init>:
8000678c:	00008067          	ret

80006790 <netif_input>:
80006790:	0355c783          	lbu	a5,53(a1)
80006794:	0187f793          	andi	a5,a5,24
80006798:	00078463          	beqz	a5,800067a0 <netif_input+0x10>
8000679c:	1d40606f          	j	8000c970 <ethernet_input>
800067a0:	6300506f          	j	8000bdd0 <ip4_input>

800067a4 <netif_set_ipaddr>:
800067a4:	02050463          	beqz	a0,800067cc <netif_set_ipaddr+0x28>
800067a8:	fe010113          	addi	sp,sp,-32
800067ac:	00112e23          	sw	ra,28(sp)
800067b0:	00059463          	bnez	a1,800067b8 <netif_set_ipaddr+0x14>
800067b4:	84818593          	addi	a1,gp,-1976 # 80003080 <ip_addr_any>
800067b8:	00c10613          	addi	a2,sp,12
800067bc:	f3dff0ef          	jal	ra,800066f8 <netif_do_set_ipaddr>
800067c0:	01c12083          	lw	ra,28(sp)
800067c4:	02010113          	addi	sp,sp,32
800067c8:	00008067          	ret
800067cc:	00008067          	ret

800067d0 <netif_set_netmask>:
800067d0:	00050e63          	beqz	a0,800067ec <netif_set_netmask+0x1c>
800067d4:	00059463          	bnez	a1,800067dc <netif_set_netmask+0xc>
800067d8:	84818593          	addi	a1,gp,-1976 # 80003080 <ip_addr_any>
800067dc:	0005a783          	lw	a5,0(a1)
800067e0:	00852703          	lw	a4,8(a0)
800067e4:	00e78463          	beq	a5,a4,800067ec <netif_set_netmask+0x1c>
800067e8:	00f52423          	sw	a5,8(a0)
800067ec:	00008067          	ret

800067f0 <netif_set_gw>:
800067f0:	00050e63          	beqz	a0,8000680c <netif_set_gw+0x1c>
800067f4:	00059463          	bnez	a1,800067fc <netif_set_gw+0xc>
800067f8:	84818593          	addi	a1,gp,-1976 # 80003080 <ip_addr_any>
800067fc:	0005a783          	lw	a5,0(a1)
80006800:	00c52703          	lw	a4,12(a0)
80006804:	00e78463          	beq	a5,a4,8000680c <netif_set_gw+0x1c>
80006808:	00f52623          	sw	a5,12(a0)
8000680c:	00008067          	ret

80006810 <netif_set_addr>:
80006810:	fd010113          	addi	sp,sp,-48
80006814:	02812423          	sw	s0,40(sp)
80006818:	02912223          	sw	s1,36(sp)
8000681c:	03212023          	sw	s2,32(sp)
80006820:	02112623          	sw	ra,44(sp)
80006824:	00050493          	mv	s1,a0
80006828:	00060913          	mv	s2,a2
8000682c:	00058413          	mv	s0,a1
80006830:	00059463          	bnez	a1,80006838 <netif_set_addr+0x28>
80006834:	84818413          	addi	s0,gp,-1976 # 80003080 <ip_addr_any>
80006838:	00091463          	bnez	s2,80006840 <netif_set_addr+0x30>
8000683c:	84818913          	addi	s2,gp,-1976 # 80003080 <ip_addr_any>
80006840:	00069463          	bnez	a3,80006848 <netif_set_addr+0x38>
80006844:	84818693          	addi	a3,gp,-1976 # 80003080 <ip_addr_any>
80006848:	00042783          	lw	a5,0(s0)
8000684c:	00078663          	beqz	a5,80006858 <netif_set_addr+0x48>
80006850:	00000793          	li	a5,0
80006854:	0200006f          	j	80006874 <netif_set_addr+0x64>
80006858:	01c10613          	addi	a2,sp,28
8000685c:	00040593          	mv	a1,s0
80006860:	00048513          	mv	a0,s1
80006864:	00d12623          	sw	a3,12(sp)
80006868:	e91ff0ef          	jal	ra,800066f8 <netif_do_set_ipaddr>
8000686c:	00c12683          	lw	a3,12(sp)
80006870:	00100793          	li	a5,1
80006874:	00092703          	lw	a4,0(s2)
80006878:	0084a603          	lw	a2,8(s1)
8000687c:	00c70463          	beq	a4,a2,80006884 <netif_set_addr+0x74>
80006880:	00e4a423          	sw	a4,8(s1)
80006884:	0006a703          	lw	a4,0(a3)
80006888:	00c4a683          	lw	a3,12(s1)
8000688c:	00d70463          	beq	a4,a3,80006894 <netif_set_addr+0x84>
80006890:	00e4a623          	sw	a4,12(s1)
80006894:	00079a63          	bnez	a5,800068a8 <netif_set_addr+0x98>
80006898:	01c10613          	addi	a2,sp,28
8000689c:	00040593          	mv	a1,s0
800068a0:	00048513          	mv	a0,s1
800068a4:	e55ff0ef          	jal	ra,800066f8 <netif_do_set_ipaddr>
800068a8:	02c12083          	lw	ra,44(sp)
800068ac:	02812403          	lw	s0,40(sp)
800068b0:	02412483          	lw	s1,36(sp)
800068b4:	02012903          	lw	s2,32(sp)
800068b8:	03010113          	addi	sp,sp,48
800068bc:	00008067          	ret

800068c0 <netif_add>:
800068c0:	fe010113          	addi	sp,sp,-32
800068c4:	00112e23          	sw	ra,28(sp)
800068c8:	00812c23          	sw	s0,24(sp)
800068cc:	00912a23          	sw	s1,20(sp)
800068d0:	02051063          	bnez	a0,800068f0 <netif_add+0x30>
800068d4:	00000413          	li	s0,0
800068d8:	00040513          	mv	a0,s0
800068dc:	01c12083          	lw	ra,28(sp)
800068e0:	01812403          	lw	s0,24(sp)
800068e4:	01412483          	lw	s1,20(sp)
800068e8:	02010113          	addi	sp,sp,32
800068ec:	00008067          	ret
800068f0:	fe0782e3          	beqz	a5,800068d4 <netif_add+0x14>
800068f4:	00050413          	mv	s0,a0
800068f8:	00059463          	bnez	a1,80006900 <netif_add+0x40>
800068fc:	84818593          	addi	a1,gp,-1976 # 80003080 <ip_addr_any>
80006900:	00061463          	bnez	a2,80006908 <netif_add+0x48>
80006904:	84818613          	addi	a2,gp,-1976 # 80003080 <ip_addr_any>
80006908:	00069463          	bnez	a3,80006910 <netif_add+0x50>
8000690c:	84818693          	addi	a3,gp,-1976 # 80003080 <ip_addr_any>
80006910:	02e42223          	sw	a4,36(s0)
80006914:	8c41c703          	lbu	a4,-1852(gp) # 800030fc <netif_num>
80006918:	80006537          	lui	a0,0x80006
8000691c:	6bc50513          	addi	a0,a0,1724 # 800066bc <_heap_end+0xffff46bc>
80006920:	00a42a23          	sw	a0,20(s0)
80006924:	00042223          	sw	zero,4(s0)
80006928:	00040513          	mv	a0,s0
8000692c:	00042423          	sw	zero,8(s0)
80006930:	00042623          	sw	zero,12(s0)
80006934:	02041623          	sh	zero,44(s0)
80006938:	02040aa3          	sb	zero,53(s0)
8000693c:	02040423          	sb	zero,40(s0)
80006940:	020404a3          	sb	zero,41(s0)
80006944:	02040523          	sb	zero,42(s0)
80006948:	020405a3          	sb	zero,43(s0)
8000694c:	00042e23          	sw	zero,28(s0)
80006950:	02042023          	sw	zero,32(s0)
80006954:	02e40c23          	sb	a4,56(s0)
80006958:	01042823          	sw	a6,16(s0)
8000695c:	02042e23          	sw	zero,60(s0)
80006960:	00f12623          	sw	a5,12(sp)
80006964:	eadff0ef          	jal	ra,80006810 <netif_set_addr>
80006968:	00c12783          	lw	a5,12(sp)
8000696c:	00040513          	mv	a0,s0
80006970:	000780e7          	jalr	a5
80006974:	f60510e3          	bnez	a0,800068d4 <netif_add+0x14>
80006978:	8cc1a603          	lw	a2,-1844(gp) # 80003104 <netif_list>
8000697c:	00078713          	mv	a4,a5
80006980:	0ff00593          	li	a1,255
80006984:	03844783          	lbu	a5,56(s0)
80006988:	00b79463          	bne	a5,a1,80006990 <netif_add+0xd0>
8000698c:	02040c23          	sb	zero,56(s0)
80006990:	03844783          	lbu	a5,56(s0)
80006994:	00060693          	mv	a3,a2
80006998:	02069463          	bnez	a3,800069c0 <netif_add+0x100>
8000699c:	0fe00593          	li	a1,254
800069a0:	00000693          	li	a3,0
800069a4:	00b78663          	beq	a5,a1,800069b0 <netif_add+0xf0>
800069a8:	00178793          	addi	a5,a5,1
800069ac:	0ff7f693          	andi	a3,a5,255
800069b0:	00c42023          	sw	a2,0(s0)
800069b4:	8cd18223          	sb	a3,-1852(gp) # 800030fc <netif_num>
800069b8:	8c81a623          	sw	s0,-1844(gp) # 80003104 <netif_list>
800069bc:	f1dff06f          	j	800068d8 <netif_add+0x18>
800069c0:	0386c503          	lbu	a0,56(a3)
800069c4:	00f51863          	bne	a0,a5,800069d4 <netif_add+0x114>
800069c8:	00178793          	addi	a5,a5,1
800069cc:	02f40c23          	sb	a5,56(s0)
800069d0:	fb5ff06f          	j	80006984 <netif_add+0xc4>
800069d4:	0006a683          	lw	a3,0(a3)
800069d8:	fc1ff06f          	j	80006998 <netif_add+0xd8>

800069dc <netif_add_noaddr>:
800069dc:	00068813          	mv	a6,a3
800069e0:	00060793          	mv	a5,a2
800069e4:	00058713          	mv	a4,a1
800069e8:	00000693          	li	a3,0
800069ec:	00000613          	li	a2,0
800069f0:	00000593          	li	a1,0
800069f4:	ecdff06f          	j	800068c0 <netif_add>

800069f8 <netif_set_default>:
800069f8:	8ca1a423          	sw	a0,-1848(gp) # 80003100 <netif_default>
800069fc:	00008067          	ret

80006a00 <netif_set_up>:
80006a00:	04050e63          	beqz	a0,80006a5c <netif_set_up+0x5c>
80006a04:	ff010113          	addi	sp,sp,-16
80006a08:	00812423          	sw	s0,8(sp)
80006a0c:	00112623          	sw	ra,12(sp)
80006a10:	03554783          	lbu	a5,53(a0)
80006a14:	00050413          	mv	s0,a0
80006a18:	0017f713          	andi	a4,a5,1
80006a1c:	02071863          	bnez	a4,80006a4c <netif_set_up+0x4c>
80006a20:	0017e793          	ori	a5,a5,1
80006a24:	02f50aa3          	sb	a5,53(a0)
80006a28:	01c52783          	lw	a5,28(a0)
80006a2c:	00078463          	beqz	a5,80006a34 <netif_set_up+0x34>
80006a30:	000780e7          	jalr	a5
80006a34:	00040513          	mv	a0,s0
80006a38:	00812403          	lw	s0,8(sp)
80006a3c:	00c12083          	lw	ra,12(sp)
80006a40:	00300593          	li	a1,3
80006a44:	01010113          	addi	sp,sp,16
80006a48:	c7dff06f          	j	800066c4 <netif_issue_reports>
80006a4c:	00c12083          	lw	ra,12(sp)
80006a50:	00812403          	lw	s0,8(sp)
80006a54:	01010113          	addi	sp,sp,16
80006a58:	00008067          	ret
80006a5c:	00008067          	ret

80006a60 <netif_set_down>:
80006a60:	06050063          	beqz	a0,80006ac0 <netif_set_down+0x60>
80006a64:	ff010113          	addi	sp,sp,-16
80006a68:	00812423          	sw	s0,8(sp)
80006a6c:	00112623          	sw	ra,12(sp)
80006a70:	03554783          	lbu	a5,53(a0)
80006a74:	00050413          	mv	s0,a0
80006a78:	0017f713          	andi	a4,a5,1
80006a7c:	02070a63          	beqz	a4,80006ab0 <netif_set_down+0x50>
80006a80:	ffe7f713          	andi	a4,a5,-2
80006a84:	02e50aa3          	sb	a4,53(a0)
80006a88:	0087f793          	andi	a5,a5,8
80006a8c:	00078463          	beqz	a5,80006a94 <netif_set_down+0x34>
80006a90:	1cc040ef          	jal	ra,8000ac5c <etharp_cleanup_netif>
80006a94:	01c42303          	lw	t1,28(s0)
80006a98:	00030c63          	beqz	t1,80006ab0 <netif_set_down+0x50>
80006a9c:	00040513          	mv	a0,s0
80006aa0:	00812403          	lw	s0,8(sp)
80006aa4:	00c12083          	lw	ra,12(sp)
80006aa8:	01010113          	addi	sp,sp,16
80006aac:	00030067          	jr	t1
80006ab0:	00c12083          	lw	ra,12(sp)
80006ab4:	00812403          	lw	s0,8(sp)
80006ab8:	01010113          	addi	sp,sp,16
80006abc:	00008067          	ret
80006ac0:	00008067          	ret

80006ac4 <netif_remove>:
80006ac4:	08050e63          	beqz	a0,80006b60 <netif_remove+0x9c>
80006ac8:	ff010113          	addi	sp,sp,-16
80006acc:	00812423          	sw	s0,8(sp)
80006ad0:	00112623          	sw	ra,12(sp)
80006ad4:	00912223          	sw	s1,4(sp)
80006ad8:	00452783          	lw	a5,4(a0)
80006adc:	00050413          	mv	s0,a0
80006ae0:	02078063          	beqz	a5,80006b00 <netif_remove+0x3c>
80006ae4:	00450493          	addi	s1,a0,4
80006ae8:	00000593          	li	a1,0
80006aec:	00048513          	mv	a0,s1
80006af0:	0a8020ef          	jal	ra,80008b98 <udp_netif_ip_addr_changed>
80006af4:	00000593          	li	a1,0
80006af8:	00048513          	mv	a0,s1
80006afc:	508010ef          	jal	ra,80008004 <raw_netif_ip_addr_changed>
80006b00:	03544783          	lbu	a5,53(s0)
80006b04:	0017f793          	andi	a5,a5,1
80006b08:	00078663          	beqz	a5,80006b14 <netif_remove+0x50>
80006b0c:	00040513          	mv	a0,s0
80006b10:	f51ff0ef          	jal	ra,80006a60 <netif_set_down>
80006b14:	8c81a703          	lw	a4,-1848(gp) # 80003100 <netif_default>
80006b18:	00871463          	bne	a4,s0,80006b20 <netif_remove+0x5c>
80006b1c:	8c01a423          	sw	zero,-1848(gp) # 80003100 <netif_default>
80006b20:	8cc1a783          	lw	a5,-1844(gp) # 80003104 <netif_list>
80006b24:	02879263          	bne	a5,s0,80006b48 <netif_remove+0x84>
80006b28:	00042783          	lw	a5,0(s0)
80006b2c:	8cf1a623          	sw	a5,-1844(gp) # 80003104 <netif_list>
80006b30:	00c12083          	lw	ra,12(sp)
80006b34:	00812403          	lw	s0,8(sp)
80006b38:	00412483          	lw	s1,4(sp)
80006b3c:	01010113          	addi	sp,sp,16
80006b40:	00008067          	ret
80006b44:	00070793          	mv	a5,a4
80006b48:	fe0784e3          	beqz	a5,80006b30 <netif_remove+0x6c>
80006b4c:	0007a703          	lw	a4,0(a5)
80006b50:	fe871ae3          	bne	a4,s0,80006b44 <netif_remove+0x80>
80006b54:	00042703          	lw	a4,0(s0)
80006b58:	00e7a023          	sw	a4,0(a5)
80006b5c:	fd5ff06f          	j	80006b30 <netif_remove+0x6c>
80006b60:	00008067          	ret

80006b64 <netif_set_status_callback>:
80006b64:	00050463          	beqz	a0,80006b6c <netif_set_status_callback+0x8>
80006b68:	00b52e23          	sw	a1,28(a0)
80006b6c:	00008067          	ret

80006b70 <netif_set_link_up>:
80006b70:	06050263          	beqz	a0,80006bd4 <netif_set_link_up+0x64>
80006b74:	ff010113          	addi	sp,sp,-16
80006b78:	00812423          	sw	s0,8(sp)
80006b7c:	00112623          	sw	ra,12(sp)
80006b80:	03554783          	lbu	a5,53(a0)
80006b84:	00050413          	mv	s0,a0
80006b88:	0047f713          	andi	a4,a5,4
80006b8c:	02071c63          	bnez	a4,80006bc4 <netif_set_link_up+0x54>
80006b90:	0047e793          	ori	a5,a5,4
80006b94:	02f50aa3          	sb	a5,53(a0)
80006b98:	3c8030ef          	jal	ra,80009f60 <dhcp_network_changed>
80006b9c:	00300593          	li	a1,3
80006ba0:	00040513          	mv	a0,s0
80006ba4:	b21ff0ef          	jal	ra,800066c4 <netif_issue_reports>
80006ba8:	02042303          	lw	t1,32(s0)
80006bac:	00030c63          	beqz	t1,80006bc4 <netif_set_link_up+0x54>
80006bb0:	00040513          	mv	a0,s0
80006bb4:	00812403          	lw	s0,8(sp)
80006bb8:	00c12083          	lw	ra,12(sp)
80006bbc:	01010113          	addi	sp,sp,16
80006bc0:	00030067          	jr	t1
80006bc4:	00c12083          	lw	ra,12(sp)
80006bc8:	00812403          	lw	s0,8(sp)
80006bcc:	01010113          	addi	sp,sp,16
80006bd0:	00008067          	ret
80006bd4:	00008067          	ret

80006bd8 <netif_set_link_down>:
80006bd8:	02050263          	beqz	a0,80006bfc <netif_set_link_down+0x24>
80006bdc:	03554703          	lbu	a4,53(a0)
80006be0:	00477693          	andi	a3,a4,4
80006be4:	00068c63          	beqz	a3,80006bfc <netif_set_link_down+0x24>
80006be8:	02052303          	lw	t1,32(a0)
80006bec:	ffb77713          	andi	a4,a4,-5
80006bf0:	02e50aa3          	sb	a4,53(a0)
80006bf4:	00030463          	beqz	t1,80006bfc <netif_set_link_down+0x24>
80006bf8:	00030067          	jr	t1
80006bfc:	00008067          	ret

80006c00 <netif_set_link_callback>:
80006c00:	00050463          	beqz	a0,80006c08 <netif_set_link_callback+0x8>
80006c04:	02b52023          	sw	a1,32(a0)
80006c08:	00008067          	ret

80006c0c <netif_get_by_index>:
80006c0c:	00000793          	li	a5,0
80006c10:	00050663          	beqz	a0,80006c1c <netif_get_by_index+0x10>
80006c14:	8cc1a783          	lw	a5,-1844(gp) # 80003104 <netif_list>
80006c18:	00079663          	bnez	a5,80006c24 <netif_get_by_index+0x18>
80006c1c:	00078513          	mv	a0,a5
80006c20:	00008067          	ret
80006c24:	0387c703          	lbu	a4,56(a5)
80006c28:	00170713          	addi	a4,a4,1
80006c2c:	0ff77713          	andi	a4,a4,255
80006c30:	fea706e3          	beq	a4,a0,80006c1c <netif_get_by_index+0x10>
80006c34:	0007a783          	lw	a5,0(a5)
80006c38:	fe1ff06f          	j	80006c18 <netif_get_by_index+0xc>

80006c3c <netif_index_to_name>:
80006c3c:	ff010113          	addi	sp,sp,-16
80006c40:	00812423          	sw	s0,8(sp)
80006c44:	00912223          	sw	s1,4(sp)
80006c48:	00112623          	sw	ra,12(sp)
80006c4c:	00050493          	mv	s1,a0
80006c50:	00058413          	mv	s0,a1
80006c54:	fb9ff0ef          	jal	ra,80006c0c <netif_get_by_index>
80006c58:	02050463          	beqz	a0,80006c80 <netif_index_to_name+0x44>
80006c5c:	03654783          	lbu	a5,54(a0)
80006c60:	fff48613          	addi	a2,s1,-1
80006c64:	00400593          	li	a1,4
80006c68:	00f40023          	sb	a5,0(s0)
80006c6c:	03754783          	lbu	a5,55(a0)
80006c70:	00240513          	addi	a0,s0,2
80006c74:	00f400a3          	sb	a5,1(s0)
80006c78:	a20ff0ef          	jal	ra,80005e98 <lwip_itoa>
80006c7c:	00040513          	mv	a0,s0
80006c80:	00c12083          	lw	ra,12(sp)
80006c84:	00812403          	lw	s0,8(sp)
80006c88:	00412483          	lw	s1,4(sp)
80006c8c:	01010113          	addi	sp,sp,16
80006c90:	00008067          	ret

80006c94 <netif_find>:
80006c94:	00051663          	bnez	a0,80006ca0 <netif_find+0xc>
80006c98:	00000513          	li	a0,0
80006c9c:	00008067          	ret
80006ca0:	ff010113          	addi	sp,sp,-16
80006ca4:	00812423          	sw	s0,8(sp)
80006ca8:	00050413          	mv	s0,a0
80006cac:	00250513          	addi	a0,a0,2
80006cb0:	00112623          	sw	ra,12(sp)
80006cb4:	3b1060ef          	jal	ra,8000d864 <atoi>
80006cb8:	0ff57793          	andi	a5,a0,255
80006cbc:	8cc1a503          	lw	a0,-1844(gp) # 80003104 <netif_list>
80006cc0:	00051c63          	bnez	a0,80006cd8 <netif_find+0x44>
80006cc4:	00000513          	li	a0,0
80006cc8:	00c12083          	lw	ra,12(sp)
80006ccc:	00812403          	lw	s0,8(sp)
80006cd0:	01010113          	addi	sp,sp,16
80006cd4:	00008067          	ret
80006cd8:	03854703          	lbu	a4,56(a0)
80006cdc:	00f71e63          	bne	a4,a5,80006cf8 <netif_find+0x64>
80006ce0:	00044683          	lbu	a3,0(s0)
80006ce4:	03654703          	lbu	a4,54(a0)
80006ce8:	00e69863          	bne	a3,a4,80006cf8 <netif_find+0x64>
80006cec:	00144683          	lbu	a3,1(s0)
80006cf0:	03754703          	lbu	a4,55(a0)
80006cf4:	fce68ae3          	beq	a3,a4,80006cc8 <netif_find+0x34>
80006cf8:	00052503          	lw	a0,0(a0)
80006cfc:	fc5ff06f          	j	80006cc0 <netif_find+0x2c>

80006d00 <netif_name_to_index>:
80006d00:	ff010113          	addi	sp,sp,-16
80006d04:	00112623          	sw	ra,12(sp)
80006d08:	f8dff0ef          	jal	ra,80006c94 <netif_find>
80006d0c:	00050e63          	beqz	a0,80006d28 <netif_name_to_index+0x28>
80006d10:	03854503          	lbu	a0,56(a0)
80006d14:	00150513          	addi	a0,a0,1
80006d18:	0ff57513          	andi	a0,a0,255
80006d1c:	00c12083          	lw	ra,12(sp)
80006d20:	01010113          	addi	sp,sp,16
80006d24:	00008067          	ret
80006d28:	00000513          	li	a0,0
80006d2c:	ff1ff06f          	j	80006d1c <netif_name_to_index+0x1c>

80006d30 <pbuf_skip_const>:
80006d30:	00050663          	beqz	a0,80006d3c <pbuf_skip_const+0xc>
80006d34:	00a55783          	lhu	a5,10(a0)
80006d38:	00f5f863          	bgeu	a1,a5,80006d48 <pbuf_skip_const+0x18>
80006d3c:	00060463          	beqz	a2,80006d44 <pbuf_skip_const+0x14>
80006d40:	00b61023          	sh	a1,0(a2)
80006d44:	00008067          	ret
80006d48:	40f585b3          	sub	a1,a1,a5
80006d4c:	01059593          	slli	a1,a1,0x10
80006d50:	0105d593          	srli	a1,a1,0x10
80006d54:	00052503          	lw	a0,0(a0)
80006d58:	fd9ff06f          	j	80006d30 <pbuf_skip_const>

80006d5c <pbuf_add_header_impl>:
80006d5c:	00050793          	mv	a5,a0
80006d60:	08050263          	beqz	a0,80006de4 <pbuf_add_header_impl+0x88>
80006d64:	00010737          	lui	a4,0x10
80006d68:	00100513          	li	a0,1
80006d6c:	06e5fe63          	bgeu	a1,a4,80006de8 <pbuf_add_header_impl+0x8c>
80006d70:	00000513          	li	a0,0
80006d74:	06058a63          	beqz	a1,80006de8 <pbuf_add_header_impl+0x8c>
80006d78:	0087d703          	lhu	a4,8(a5)
80006d7c:	01059693          	slli	a3,a1,0x10
80006d80:	0106d693          	srli	a3,a3,0x10
80006d84:	00e68733          	add	a4,a3,a4
80006d88:	01071713          	slli	a4,a4,0x10
80006d8c:	01075713          	srli	a4,a4,0x10
80006d90:	00100513          	li	a0,1
80006d94:	04d76a63          	bltu	a4,a3,80006de8 <pbuf_add_header_impl+0x8c>
80006d98:	00c78503          	lb	a0,12(a5)
80006d9c:	00055e63          	bgez	a0,80006db8 <pbuf_add_header_impl+0x5c>
80006da0:	0047a603          	lw	a2,4(a5)
80006da4:	00100513          	li	a0,1
80006da8:	40b605b3          	sub	a1,a2,a1
80006dac:	01078613          	addi	a2,a5,16
80006db0:	00c5fc63          	bgeu	a1,a2,80006dc8 <pbuf_add_header_impl+0x6c>
80006db4:	00008067          	ret
80006db8:	00100513          	li	a0,1
80006dbc:	02060663          	beqz	a2,80006de8 <pbuf_add_header_impl+0x8c>
80006dc0:	0047a603          	lw	a2,4(a5)
80006dc4:	40b605b3          	sub	a1,a2,a1
80006dc8:	00a7d603          	lhu	a2,10(a5)
80006dcc:	00b7a223          	sw	a1,4(a5)
80006dd0:	00e79423          	sh	a4,8(a5)
80006dd4:	00c686b3          	add	a3,a3,a2
80006dd8:	00d79523          	sh	a3,10(a5)
80006ddc:	00000513          	li	a0,0
80006de0:	00008067          	ret
80006de4:	00100513          	li	a0,1
80006de8:	00008067          	ret

80006dec <pbuf_alloc_reference>:
80006dec:	ff010113          	addi	sp,sp,-16
80006df0:	00812423          	sw	s0,8(sp)
80006df4:	00058413          	mv	s0,a1
80006df8:	800035b7          	lui	a1,0x80003
80006dfc:	00912223          	sw	s1,4(sp)
80006e00:	01212023          	sw	s2,0(sp)
80006e04:	00060493          	mv	s1,a2
80006e08:	00050913          	mv	s2,a0
80006e0c:	14c00613          	li	a2,332
80006e10:	c7458593          	addi	a1,a1,-908 # 80002c74 <_heap_end+0xffff0c74>
80006e14:	00400513          	li	a0,4
80006e18:	00112623          	sw	ra,12(sp)
80006e1c:	841ff0ef          	jal	ra,8000665c <memp_malloc_fn>
80006e20:	02050263          	beqz	a0,80006e44 <pbuf_alloc_reference+0x58>
80006e24:	00100793          	li	a5,1
80006e28:	00052023          	sw	zero,0(a0)
80006e2c:	01252223          	sw	s2,4(a0)
80006e30:	00851423          	sh	s0,8(a0)
80006e34:	00851523          	sh	s0,10(a0)
80006e38:	00950623          	sb	s1,12(a0)
80006e3c:	000506a3          	sb	zero,13(a0)
80006e40:	00f51723          	sh	a5,14(a0)
80006e44:	00c12083          	lw	ra,12(sp)
80006e48:	00812403          	lw	s0,8(sp)
80006e4c:	00412483          	lw	s1,4(sp)
80006e50:	00012903          	lw	s2,0(sp)
80006e54:	01010113          	addi	sp,sp,16
80006e58:	00008067          	ret

80006e5c <pbuf_alloced_custom>:
80006e5c:	01051513          	slli	a0,a0,0x10
80006e60:	01055513          	srli	a0,a0,0x10
80006e64:	00350513          	addi	a0,a0,3
80006e68:	ffc57513          	andi	a0,a0,-4
80006e6c:	00a58833          	add	a6,a1,a0
80006e70:	0307ec63          	bltu	a5,a6,80006ea8 <pbuf_alloced_custom+0x4c>
80006e74:	00070463          	beqz	a4,80006e7c <pbuf_alloced_custom+0x20>
80006e78:	00a70733          	add	a4,a4,a0
80006e7c:	00200793          	li	a5,2
80006e80:	00f686a3          	sb	a5,13(a3)
80006e84:	00100793          	li	a5,1
80006e88:	00068513          	mv	a0,a3
80006e8c:	0006a023          	sw	zero,0(a3)
80006e90:	00e6a223          	sw	a4,4(a3)
80006e94:	00b69423          	sh	a1,8(a3)
80006e98:	00b69523          	sh	a1,10(a3)
80006e9c:	00c68623          	sb	a2,12(a3)
80006ea0:	00f69723          	sh	a5,14(a3)
80006ea4:	00008067          	ret
80006ea8:	00000513          	li	a0,0
80006eac:	00008067          	ret

80006eb0 <pbuf_add_header>:
80006eb0:	00000613          	li	a2,0
80006eb4:	ea9ff06f          	j	80006d5c <pbuf_add_header_impl>

80006eb8 <pbuf_add_header_force>:
80006eb8:	00100613          	li	a2,1
80006ebc:	ea1ff06f          	j	80006d5c <pbuf_add_header_impl>

80006ec0 <pbuf_remove_header>:
80006ec0:	00050793          	mv	a5,a0
80006ec4:	04050a63          	beqz	a0,80006f18 <pbuf_remove_header+0x58>
80006ec8:	00010737          	lui	a4,0x10
80006ecc:	00100513          	li	a0,1
80006ed0:	04e5f663          	bgeu	a1,a4,80006f1c <pbuf_remove_header+0x5c>
80006ed4:	00000513          	li	a0,0
80006ed8:	04058263          	beqz	a1,80006f1c <pbuf_remove_header+0x5c>
80006edc:	00a7d703          	lhu	a4,10(a5)
80006ee0:	01059693          	slli	a3,a1,0x10
80006ee4:	0106d693          	srli	a3,a3,0x10
80006ee8:	00100513          	li	a0,1
80006eec:	02d76863          	bltu	a4,a3,80006f1c <pbuf_remove_header+0x5c>
80006ef0:	40d70733          	sub	a4,a4,a3
80006ef4:	0047a603          	lw	a2,4(a5)
80006ef8:	00e79523          	sh	a4,10(a5)
80006efc:	0087d703          	lhu	a4,8(a5)
80006f00:	00b605b3          	add	a1,a2,a1
80006f04:	00b7a223          	sw	a1,4(a5)
80006f08:	40d70733          	sub	a4,a4,a3
80006f0c:	00e79423          	sh	a4,8(a5)
80006f10:	00000513          	li	a0,0
80006f14:	00008067          	ret
80006f18:	00100513          	li	a0,1
80006f1c:	00008067          	ret

80006f20 <pbuf_header>:
80006f20:	0005d663          	bgez	a1,80006f2c <pbuf_header+0xc>
80006f24:	40b005b3          	neg	a1,a1
80006f28:	f99ff06f          	j	80006ec0 <pbuf_remove_header>
80006f2c:	00000613          	li	a2,0
80006f30:	e2dff06f          	j	80006d5c <pbuf_add_header_impl>

80006f34 <pbuf_header_force>:
80006f34:	0005d663          	bgez	a1,80006f40 <pbuf_header_force+0xc>
80006f38:	40b005b3          	neg	a1,a1
80006f3c:	f85ff06f          	j	80006ec0 <pbuf_remove_header>
80006f40:	00100613          	li	a2,1
80006f44:	e19ff06f          	j	80006d5c <pbuf_add_header_impl>

80006f48 <pbuf_free>:
80006f48:	fd010113          	addi	sp,sp,-48
80006f4c:	02812423          	sw	s0,40(sp)
80006f50:	02112623          	sw	ra,44(sp)
80006f54:	02912223          	sw	s1,36(sp)
80006f58:	03212023          	sw	s2,32(sp)
80006f5c:	01312e23          	sw	s3,28(sp)
80006f60:	00000413          	li	s0,0
80006f64:	06050463          	beqz	a0,80006fcc <pbuf_free+0x84>
80006f68:	00050593          	mv	a1,a0
80006f6c:	00000413          	li	s0,0
80006f70:	00200913          	li	s2,2
80006f74:	00100993          	li	s3,1
80006f78:	00b12623          	sw	a1,12(sp)
80006f7c:	ee1fd0ef          	jal	ra,80004e5c <sys_arch_protect>
80006f80:	00c12583          	lw	a1,12(sp)
80006f84:	00e5c483          	lbu	s1,14(a1)
80006f88:	fff48493          	addi	s1,s1,-1
80006f8c:	0ff4f493          	andi	s1,s1,255
80006f90:	00958723          	sb	s1,14(a1)
80006f94:	ecdfd0ef          	jal	ra,80004e60 <sys_arch_unprotect>
80006f98:	02049a63          	bnez	s1,80006fcc <pbuf_free+0x84>
80006f9c:	00c12583          	lw	a1,12(sp)
80006fa0:	00d5c783          	lbu	a5,13(a1)
80006fa4:	0005a483          	lw	s1,0(a1)
80006fa8:	0027f793          	andi	a5,a5,2
80006fac:	04078063          	beqz	a5,80006fec <pbuf_free+0xa4>
80006fb0:	0105a783          	lw	a5,16(a1)
80006fb4:	00058513          	mv	a0,a1
80006fb8:	000780e7          	jalr	a5
80006fbc:	00140413          	addi	s0,s0,1
80006fc0:	0ff47413          	andi	s0,s0,255
80006fc4:	00048593          	mv	a1,s1
80006fc8:	fa0498e3          	bnez	s1,80006f78 <pbuf_free+0x30>
80006fcc:	00040513          	mv	a0,s0
80006fd0:	02c12083          	lw	ra,44(sp)
80006fd4:	02812403          	lw	s0,40(sp)
80006fd8:	02412483          	lw	s1,36(sp)
80006fdc:	02012903          	lw	s2,32(sp)
80006fe0:	01c12983          	lw	s3,28(sp)
80006fe4:	03010113          	addi	sp,sp,48
80006fe8:	00008067          	ret
80006fec:	00c5c783          	lbu	a5,12(a1)
80006ff0:	00500513          	li	a0,5
80006ff4:	00f7f793          	andi	a5,a5,15
80006ff8:	01278663          	beq	a5,s2,80007004 <pbuf_free+0xbc>
80006ffc:	01379863          	bne	a5,s3,8000700c <pbuf_free+0xc4>
80007000:	00400513          	li	a0,4
80007004:	e90ff0ef          	jal	ra,80006694 <memp_free>
80007008:	fb5ff06f          	j	80006fbc <pbuf_free+0x74>
8000700c:	fa0798e3          	bnez	a5,80006fbc <pbuf_free+0x74>
80007010:	00058513          	mv	a0,a1
80007014:	d44ff0ef          	jal	ra,80006558 <lwip_free>
80007018:	fa5ff06f          	j	80006fbc <pbuf_free+0x74>

8000701c <pbuf_alloc>:
8000701c:	fe010113          	addi	sp,sp,-32
80007020:	01212823          	sw	s2,16(sp)
80007024:	00112e23          	sw	ra,28(sp)
80007028:	00812c23          	sw	s0,24(sp)
8000702c:	00912a23          	sw	s1,20(sp)
80007030:	01312623          	sw	s3,12(sp)
80007034:	01412423          	sw	s4,8(sp)
80007038:	01512223          	sw	s5,4(sp)
8000703c:	01612023          	sw	s6,0(sp)
80007040:	04100793          	li	a5,65
80007044:	00058913          	mv	s2,a1
80007048:	0cf60263          	beq	a2,a5,8000710c <pbuf_alloc+0xf0>
8000704c:	02c7ee63          	bltu	a5,a2,80007088 <pbuf_alloc+0x6c>
80007050:	00100793          	li	a5,1
80007054:	0af60c63          	beq	a2,a5,8000710c <pbuf_alloc+0xf0>
80007058:	00000493          	li	s1,0
8000705c:	01c12083          	lw	ra,28(sp)
80007060:	01812403          	lw	s0,24(sp)
80007064:	00048513          	mv	a0,s1
80007068:	01012903          	lw	s2,16(sp)
8000706c:	01412483          	lw	s1,20(sp)
80007070:	00c12983          	lw	s3,12(sp)
80007074:	00812a03          	lw	s4,8(sp)
80007078:	00412a83          	lw	s5,4(sp)
8000707c:	00012b03          	lw	s6,0(sp)
80007080:	02010113          	addi	sp,sp,32
80007084:	00008067          	ret
80007088:	01051413          	slli	s0,a0,0x10
8000708c:	18200793          	li	a5,386
80007090:	01045413          	srli	s0,s0,0x10
80007094:	0af60463          	beq	a2,a5,8000713c <pbuf_alloc+0x120>
80007098:	28000793          	li	a5,640
8000709c:	faf61ee3          	bne	a2,a5,80007058 <pbuf_alloc+0x3c>
800070a0:	00340413          	addi	s0,s0,3
800070a4:	00358793          	addi	a5,a1,3
800070a8:	ffc47413          	andi	s0,s0,-4
800070ac:	ffc7f793          	andi	a5,a5,-4
800070b0:	00f40433          	add	s0,s0,a5
800070b4:	01041413          	slli	s0,s0,0x10
800070b8:	01045413          	srli	s0,s0,0x10
800070bc:	00050993          	mv	s3,a0
800070c0:	01040513          	addi	a0,s0,16
800070c4:	f8f46ae3          	bltu	s0,a5,80007058 <pbuf_alloc+0x3c>
800070c8:	f8f568e3          	bltu	a0,a5,80007058 <pbuf_alloc+0x3c>
800070cc:	c58ff0ef          	jal	ra,80006524 <lwip_malloc>
800070d0:	00050493          	mv	s1,a0
800070d4:	f80504e3          	beqz	a0,8000705c <pbuf_alloc+0x40>
800070d8:	01099993          	slli	s3,s3,0x10
800070dc:	0109d993          	srli	s3,s3,0x10
800070e0:	013509b3          	add	s3,a0,s3
800070e4:	01398993          	addi	s3,s3,19
800070e8:	000107b7          	lui	a5,0x10
800070ec:	ffc9f993          	andi	s3,s3,-4
800070f0:	08078793          	addi	a5,a5,128 # 10080 <_stack_size+0xf880>
800070f4:	00052023          	sw	zero,0(a0)
800070f8:	01352223          	sw	s3,4(a0)
800070fc:	01251423          	sh	s2,8(a0)
80007100:	01251523          	sh	s2,10(a0)
80007104:	00f52623          	sw	a5,12(a0)
80007108:	f55ff06f          	j	8000705c <pbuf_alloc+0x40>
8000710c:	01812403          	lw	s0,24(sp)
80007110:	01c12083          	lw	ra,28(sp)
80007114:	01412483          	lw	s1,20(sp)
80007118:	00c12983          	lw	s3,12(sp)
8000711c:	00812a03          	lw	s4,8(sp)
80007120:	00412a83          	lw	s5,4(sp)
80007124:	00012b03          	lw	s6,0(sp)
80007128:	00090593          	mv	a1,s2
8000712c:	01012903          	lw	s2,16(sp)
80007130:	00000513          	li	a0,0
80007134:	02010113          	addi	sp,sp,32
80007138:	cb5ff06f          	j	80006dec <pbuf_alloc_reference>
8000713c:	000109b7          	lui	s3,0x10
80007140:	00000a13          	li	s4,0
80007144:	00000493          	li	s1,0
80007148:	80003ab7          	lui	s5,0x80003
8000714c:	5ec00b13          	li	s6,1516
80007150:	08298993          	addi	s3,s3,130 # 10082 <_stack_size+0xf882>
80007154:	0f300613          	li	a2,243
80007158:	c74a8593          	addi	a1,s5,-908 # 80002c74 <_heap_end+0xffff0c74>
8000715c:	00500513          	li	a0,5
80007160:	cfcff0ef          	jal	ra,8000665c <memp_malloc_fn>
80007164:	00051a63          	bnez	a0,80007178 <pbuf_alloc+0x15c>
80007168:	ee0488e3          	beqz	s1,80007058 <pbuf_alloc+0x3c>
8000716c:	00048513          	mv	a0,s1
80007170:	dd9ff0ef          	jal	ra,80006f48 <pbuf_free>
80007174:	ee5ff06f          	j	80007058 <pbuf_alloc+0x3c>
80007178:	00340793          	addi	a5,s0,3
8000717c:	ffc7f793          	andi	a5,a5,-4
80007180:	40fb07b3          	sub	a5,s6,a5
80007184:	00078713          	mv	a4,a5
80007188:	01079793          	slli	a5,a5,0x10
8000718c:	0107d793          	srli	a5,a5,0x10
80007190:	00f97463          	bgeu	s2,a5,80007198 <pbuf_alloc+0x17c>
80007194:	00090713          	mv	a4,s2
80007198:	00850433          	add	s0,a0,s0
8000719c:	01340413          	addi	s0,s0,19
800071a0:	ffc47413          	andi	s0,s0,-4
800071a4:	01071793          	slli	a5,a4,0x10
800071a8:	00052023          	sw	zero,0(a0)
800071ac:	00852223          	sw	s0,4(a0)
800071b0:	01251423          	sh	s2,8(a0)
800071b4:	00e51523          	sh	a4,10(a0)
800071b8:	01352623          	sw	s3,12(a0)
800071bc:	0107d793          	srli	a5,a5,0x10
800071c0:	02048263          	beqz	s1,800071e4 <pbuf_alloc+0x1c8>
800071c4:	00aa2023          	sw	a0,0(s4)
800071c8:	40f90933          	sub	s2,s2,a5
800071cc:	01091913          	slli	s2,s2,0x10
800071d0:	01095913          	srli	s2,s2,0x10
800071d4:	00000413          	li	s0,0
800071d8:	00050a13          	mv	s4,a0
800071dc:	f6091ce3          	bnez	s2,80007154 <pbuf_alloc+0x138>
800071e0:	e7dff06f          	j	8000705c <pbuf_alloc+0x40>
800071e4:	00050493          	mv	s1,a0
800071e8:	fe1ff06f          	j	800071c8 <pbuf_alloc+0x1ac>

800071ec <pbuf_realloc>:
800071ec:	00855783          	lhu	a5,8(a0)
800071f0:	0af5f463          	bgeu	a1,a5,80007298 <pbuf_realloc+0xac>
800071f4:	ff010113          	addi	sp,sp,-16
800071f8:	00812423          	sw	s0,8(sp)
800071fc:	00912223          	sw	s1,4(sp)
80007200:	00112623          	sw	ra,12(sp)
80007204:	00050413          	mv	s0,a0
80007208:	00058493          	mv	s1,a1
8000720c:	40f587b3          	sub	a5,a1,a5
80007210:	00a45583          	lhu	a1,10(s0)
80007214:	0695e263          	bltu	a1,s1,80007278 <pbuf_realloc+0x8c>
80007218:	00c44783          	lbu	a5,12(s0)
8000721c:	00f7f793          	andi	a5,a5,15
80007220:	02079663          	bnez	a5,8000724c <pbuf_realloc+0x60>
80007224:	02958463          	beq	a1,s1,8000724c <pbuf_realloc+0x60>
80007228:	00d44783          	lbu	a5,13(s0)
8000722c:	0027f793          	andi	a5,a5,2
80007230:	00079e63          	bnez	a5,8000724c <pbuf_realloc+0x60>
80007234:	00442583          	lw	a1,4(s0)
80007238:	00040513          	mv	a0,s0
8000723c:	408585b3          	sub	a1,a1,s0
80007240:	009585b3          	add	a1,a1,s1
80007244:	adcff0ef          	jal	ra,80006520 <mem_trim>
80007248:	00050413          	mv	s0,a0
8000724c:	00042503          	lw	a0,0(s0)
80007250:	00941523          	sh	s1,10(s0)
80007254:	00941423          	sh	s1,8(s0)
80007258:	00050463          	beqz	a0,80007260 <pbuf_realloc+0x74>
8000725c:	cedff0ef          	jal	ra,80006f48 <pbuf_free>
80007260:	00042023          	sw	zero,0(s0)
80007264:	00c12083          	lw	ra,12(sp)
80007268:	00812403          	lw	s0,8(sp)
8000726c:	00412483          	lw	s1,4(sp)
80007270:	01010113          	addi	sp,sp,16
80007274:	00008067          	ret
80007278:	00845703          	lhu	a4,8(s0)
8000727c:	40b484b3          	sub	s1,s1,a1
80007280:	01049493          	slli	s1,s1,0x10
80007284:	00e78733          	add	a4,a5,a4
80007288:	00e41423          	sh	a4,8(s0)
8000728c:	0104d493          	srli	s1,s1,0x10
80007290:	00042403          	lw	s0,0(s0)
80007294:	f7dff06f          	j	80007210 <pbuf_realloc+0x24>
80007298:	00008067          	ret

8000729c <pbuf_free_header>:
8000729c:	fe010113          	addi	sp,sp,-32
800072a0:	00812c23          	sw	s0,24(sp)
800072a4:	00112e23          	sw	ra,28(sp)
800072a8:	00912a23          	sw	s1,20(sp)
800072ac:	00050413          	mv	s0,a0
800072b0:	04058263          	beqz	a1,800072f4 <pbuf_free_header+0x58>
800072b4:	04040063          	beqz	s0,800072f4 <pbuf_free_header+0x58>
800072b8:	00a45783          	lhu	a5,10(s0)
800072bc:	02f5e863          	bltu	a1,a5,800072ec <pbuf_free_header+0x50>
800072c0:	40f585b3          	sub	a1,a1,a5
800072c4:	00042483          	lw	s1,0(s0)
800072c8:	01059593          	slli	a1,a1,0x10
800072cc:	0105d593          	srli	a1,a1,0x10
800072d0:	00042023          	sw	zero,0(s0)
800072d4:	00040513          	mv	a0,s0
800072d8:	00b12623          	sw	a1,12(sp)
800072dc:	c6dff0ef          	jal	ra,80006f48 <pbuf_free>
800072e0:	00048413          	mv	s0,s1
800072e4:	00c12583          	lw	a1,12(sp)
800072e8:	fc9ff06f          	j	800072b0 <pbuf_free_header+0x14>
800072ec:	00040513          	mv	a0,s0
800072f0:	bd1ff0ef          	jal	ra,80006ec0 <pbuf_remove_header>
800072f4:	00040513          	mv	a0,s0
800072f8:	01c12083          	lw	ra,28(sp)
800072fc:	01812403          	lw	s0,24(sp)
80007300:	01412483          	lw	s1,20(sp)
80007304:	02010113          	addi	sp,sp,32
80007308:	00008067          	ret

8000730c <pbuf_clen>:
8000730c:	00000793          	li	a5,0
80007310:	00051663          	bnez	a0,8000731c <pbuf_clen+0x10>
80007314:	00078513          	mv	a0,a5
80007318:	00008067          	ret
8000731c:	00178793          	addi	a5,a5,1
80007320:	01079793          	slli	a5,a5,0x10
80007324:	0107d793          	srli	a5,a5,0x10
80007328:	00052503          	lw	a0,0(a0)
8000732c:	fe5ff06f          	j	80007310 <pbuf_clen+0x4>

80007330 <pbuf_ref>:
80007330:	02050a63          	beqz	a0,80007364 <pbuf_ref+0x34>
80007334:	ff010113          	addi	sp,sp,-16
80007338:	00812423          	sw	s0,8(sp)
8000733c:	00112623          	sw	ra,12(sp)
80007340:	00050413          	mv	s0,a0
80007344:	b19fd0ef          	jal	ra,80004e5c <sys_arch_protect>
80007348:	00e44783          	lbu	a5,14(s0)
8000734c:	00178793          	addi	a5,a5,1
80007350:	00f40723          	sb	a5,14(s0)
80007354:	00812403          	lw	s0,8(sp)
80007358:	00c12083          	lw	ra,12(sp)
8000735c:	01010113          	addi	sp,sp,16
80007360:	b01fd06f          	j	80004e60 <sys_arch_unprotect>
80007364:	00008067          	ret

80007368 <pbuf_cat>:
80007368:	02050a63          	beqz	a0,8000739c <pbuf_cat+0x34>
8000736c:	00059663          	bnez	a1,80007378 <pbuf_cat+0x10>
80007370:	00008067          	ret
80007374:	00070513          	mv	a0,a4
80007378:	00855783          	lhu	a5,8(a0)
8000737c:	0085d683          	lhu	a3,8(a1)
80007380:	00052703          	lw	a4,0(a0)
80007384:	00d787b3          	add	a5,a5,a3
80007388:	01079793          	slli	a5,a5,0x10
8000738c:	0107d793          	srli	a5,a5,0x10
80007390:	00f51423          	sh	a5,8(a0)
80007394:	fe0710e3          	bnez	a4,80007374 <pbuf_cat+0xc>
80007398:	00b52023          	sw	a1,0(a0)
8000739c:	00008067          	ret

800073a0 <pbuf_chain>:
800073a0:	ff010113          	addi	sp,sp,-16
800073a4:	00812423          	sw	s0,8(sp)
800073a8:	00112623          	sw	ra,12(sp)
800073ac:	00058413          	mv	s0,a1
800073b0:	fb9ff0ef          	jal	ra,80007368 <pbuf_cat>
800073b4:	00040513          	mv	a0,s0
800073b8:	00812403          	lw	s0,8(sp)
800073bc:	00c12083          	lw	ra,12(sp)
800073c0:	01010113          	addi	sp,sp,16
800073c4:	f6dff06f          	j	80007330 <pbuf_ref>

800073c8 <pbuf_dechain>:
800073c8:	ff010113          	addi	sp,sp,-16
800073cc:	00112623          	sw	ra,12(sp)
800073d0:	00812423          	sw	s0,8(sp)
800073d4:	00052403          	lw	s0,0(a0)
800073d8:	02040663          	beqz	s0,80007404 <pbuf_dechain+0x3c>
800073dc:	00855783          	lhu	a5,8(a0)
800073e0:	00a55703          	lhu	a4,10(a0)
800073e4:	40e787b3          	sub	a5,a5,a4
800073e8:	00f41423          	sh	a5,8(s0)
800073ec:	00a55783          	lhu	a5,10(a0)
800073f0:	00052023          	sw	zero,0(a0)
800073f4:	00f51423          	sh	a5,8(a0)
800073f8:	00040513          	mv	a0,s0
800073fc:	b4dff0ef          	jal	ra,80006f48 <pbuf_free>
80007400:	00050463          	beqz	a0,80007408 <pbuf_dechain+0x40>
80007404:	00000413          	li	s0,0
80007408:	00040513          	mv	a0,s0
8000740c:	00c12083          	lw	ra,12(sp)
80007410:	00812403          	lw	s0,8(sp)
80007414:	01010113          	addi	sp,sp,16
80007418:	00008067          	ret

8000741c <pbuf_copy>:
8000741c:	10050463          	beqz	a0,80007524 <pbuf_copy+0x108>
80007420:	fe010113          	addi	sp,sp,-32
80007424:	00812c23          	sw	s0,24(sp)
80007428:	00112e23          	sw	ra,28(sp)
8000742c:	00912a23          	sw	s1,20(sp)
80007430:	01212823          	sw	s2,16(sp)
80007434:	01312623          	sw	s3,12(sp)
80007438:	01412423          	sw	s4,8(sp)
8000743c:	00058413          	mv	s0,a1
80007440:	06058e63          	beqz	a1,800074bc <pbuf_copy+0xa0>
80007444:	00855703          	lhu	a4,8(a0)
80007448:	0085d783          	lhu	a5,8(a1)
8000744c:	00050493          	mv	s1,a0
80007450:	06f76663          	bltu	a4,a5,800074bc <pbuf_copy+0xa0>
80007454:	00000a13          	li	s4,0
80007458:	00000993          	li	s3,0
8000745c:	00a4d903          	lhu	s2,10(s1)
80007460:	00a45783          	lhu	a5,10(s0)
80007464:	41390933          	sub	s2,s2,s3
80007468:	414787b3          	sub	a5,a5,s4
8000746c:	0127f463          	bgeu	a5,s2,80007474 <pbuf_copy+0x58>
80007470:	00078913          	mv	s2,a5
80007474:	0044a503          	lw	a0,4(s1)
80007478:	00442583          	lw	a1,4(s0)
8000747c:	00090613          	mv	a2,s2
80007480:	01350533          	add	a0,a0,s3
80007484:	014585b3          	add	a1,a1,s4
80007488:	35d060ef          	jal	ra,8000dfe4 <memcpy>
8000748c:	00a45703          	lhu	a4,10(s0)
80007490:	012a0a33          	add	s4,s4,s2
80007494:	012989b3          	add	s3,s3,s2
80007498:	00a4d783          	lhu	a5,10(s1)
8000749c:	00ea6663          	bltu	s4,a4,800074a8 <pbuf_copy+0x8c>
800074a0:	00042403          	lw	s0,0(s0)
800074a4:	00000a13          	li	s4,0
800074a8:	02f99e63          	bne	s3,a5,800074e4 <pbuf_copy+0xc8>
800074ac:	0004a483          	lw	s1,0(s1)
800074b0:	02049863          	bnez	s1,800074e0 <pbuf_copy+0xc4>
800074b4:	00000513          	li	a0,0
800074b8:	00040463          	beqz	s0,800074c0 <pbuf_copy+0xa4>
800074bc:	ff000513          	li	a0,-16
800074c0:	01c12083          	lw	ra,28(sp)
800074c4:	01812403          	lw	s0,24(sp)
800074c8:	01412483          	lw	s1,20(sp)
800074cc:	01012903          	lw	s2,16(sp)
800074d0:	00c12983          	lw	s3,12(sp)
800074d4:	00812a03          	lw	s4,8(sp)
800074d8:	02010113          	addi	sp,sp,32
800074dc:	00008067          	ret
800074e0:	00000993          	li	s3,0
800074e4:	00040c63          	beqz	s0,800074fc <pbuf_copy+0xe0>
800074e8:	00a45703          	lhu	a4,10(s0)
800074ec:	00845783          	lhu	a5,8(s0)
800074f0:	00f71663          	bne	a4,a5,800074fc <pbuf_copy+0xe0>
800074f4:	00042783          	lw	a5,0(s0)
800074f8:	02079263          	bnez	a5,8000751c <pbuf_copy+0x100>
800074fc:	00a4d703          	lhu	a4,10(s1)
80007500:	0084d783          	lhu	a5,8(s1)
80007504:	00f71663          	bne	a4,a5,80007510 <pbuf_copy+0xf4>
80007508:	0004a783          	lw	a5,0(s1)
8000750c:	00079863          	bnez	a5,8000751c <pbuf_copy+0x100>
80007510:	f40416e3          	bnez	s0,8000745c <pbuf_copy+0x40>
80007514:	00000513          	li	a0,0
80007518:	fa9ff06f          	j	800074c0 <pbuf_copy+0xa4>
8000751c:	ffa00513          	li	a0,-6
80007520:	fa1ff06f          	j	800074c0 <pbuf_copy+0xa4>
80007524:	ff000513          	li	a0,-16
80007528:	00008067          	ret

8000752c <pbuf_copy_partial>:
8000752c:	fe010113          	addi	sp,sp,-32
80007530:	00812c23          	sw	s0,24(sp)
80007534:	00112e23          	sw	ra,28(sp)
80007538:	00912a23          	sw	s1,20(sp)
8000753c:	01212823          	sw	s2,16(sp)
80007540:	01312623          	sw	s3,12(sp)
80007544:	01412423          	sw	s4,8(sp)
80007548:	00000413          	li	s0,0
8000754c:	02050063          	beqz	a0,8000756c <pbuf_copy_partial+0x40>
80007550:	00058a13          	mv	s4,a1
80007554:	00000413          	li	s0,0
80007558:	00058a63          	beqz	a1,8000756c <pbuf_copy_partial+0x40>
8000755c:	00050913          	mv	s2,a0
80007560:	00060493          	mv	s1,a2
80007564:	00048463          	beqz	s1,8000756c <pbuf_copy_partial+0x40>
80007568:	02091463          	bnez	s2,80007590 <pbuf_copy_partial+0x64>
8000756c:	00040513          	mv	a0,s0
80007570:	01c12083          	lw	ra,28(sp)
80007574:	01812403          	lw	s0,24(sp)
80007578:	01412483          	lw	s1,20(sp)
8000757c:	01012903          	lw	s2,16(sp)
80007580:	00c12983          	lw	s3,12(sp)
80007584:	00812a03          	lw	s4,8(sp)
80007588:	02010113          	addi	sp,sp,32
8000758c:	00008067          	ret
80007590:	00a95583          	lhu	a1,10(s2)
80007594:	00068e63          	beqz	a3,800075b0 <pbuf_copy_partial+0x84>
80007598:	00b6ec63          	bltu	a3,a1,800075b0 <pbuf_copy_partial+0x84>
8000759c:	40b686b3          	sub	a3,a3,a1
800075a0:	01069693          	slli	a3,a3,0x10
800075a4:	0106d693          	srli	a3,a3,0x10
800075a8:	00092903          	lw	s2,0(s2)
800075ac:	fb9ff06f          	j	80007564 <pbuf_copy_partial+0x38>
800075b0:	40d585b3          	sub	a1,a1,a3
800075b4:	01059593          	slli	a1,a1,0x10
800075b8:	0105d593          	srli	a1,a1,0x10
800075bc:	00058993          	mv	s3,a1
800075c0:	00b4f463          	bgeu	s1,a1,800075c8 <pbuf_copy_partial+0x9c>
800075c4:	00048993          	mv	s3,s1
800075c8:	00492583          	lw	a1,4(s2)
800075cc:	01099993          	slli	s3,s3,0x10
800075d0:	0109d993          	srli	s3,s3,0x10
800075d4:	00d585b3          	add	a1,a1,a3
800075d8:	008a0533          	add	a0,s4,s0
800075dc:	00098613          	mv	a2,s3
800075e0:	01340433          	add	s0,s0,s3
800075e4:	413484b3          	sub	s1,s1,s3
800075e8:	1fd060ef          	jal	ra,8000dfe4 <memcpy>
800075ec:	01041413          	slli	s0,s0,0x10
800075f0:	01049493          	slli	s1,s1,0x10
800075f4:	01045413          	srli	s0,s0,0x10
800075f8:	0104d493          	srli	s1,s1,0x10
800075fc:	00000693          	li	a3,0
80007600:	fa9ff06f          	j	800075a8 <pbuf_copy_partial+0x7c>

80007604 <pbuf_get_contiguous>:
80007604:	fe010113          	addi	sp,sp,-32
80007608:	00112e23          	sw	ra,28(sp)
8000760c:	00812c23          	sw	s0,24(sp)
80007610:	00912a23          	sw	s1,20(sp)
80007614:	02051063          	bnez	a0,80007634 <pbuf_get_contiguous+0x30>
80007618:	00000413          	li	s0,0
8000761c:	00040513          	mv	a0,s0
80007620:	01c12083          	lw	ra,28(sp)
80007624:	01812403          	lw	s0,24(sp)
80007628:	01412483          	lw	s1,20(sp)
8000762c:	02010113          	addi	sp,sp,32
80007630:	00008067          	ret
80007634:	00058413          	mv	s0,a1
80007638:	fe0580e3          	beqz	a1,80007618 <pbuf_get_contiguous+0x14>
8000763c:	00068493          	mv	s1,a3
80007640:	fcd66ce3          	bltu	a2,a3,80007618 <pbuf_get_contiguous+0x14>
80007644:	00e10613          	addi	a2,sp,14
80007648:	00070593          	mv	a1,a4
8000764c:	ee4ff0ef          	jal	ra,80006d30 <pbuf_skip_const>
80007650:	fc0504e3          	beqz	a0,80007618 <pbuf_get_contiguous+0x14>
80007654:	00e15683          	lhu	a3,14(sp)
80007658:	00a55603          	lhu	a2,10(a0)
8000765c:	00968733          	add	a4,a3,s1
80007660:	00e64863          	blt	a2,a4,80007670 <pbuf_get_contiguous+0x6c>
80007664:	00452403          	lw	s0,4(a0)
80007668:	00d40433          	add	s0,s0,a3
8000766c:	fb1ff06f          	j	8000761c <pbuf_get_contiguous+0x18>
80007670:	00048613          	mv	a2,s1
80007674:	00040593          	mv	a1,s0
80007678:	eb5ff0ef          	jal	ra,8000752c <pbuf_copy_partial>
8000767c:	fa9500e3          	beq	a0,s1,8000761c <pbuf_get_contiguous+0x18>
80007680:	f99ff06f          	j	80007618 <pbuf_get_contiguous+0x14>

80007684 <pbuf_skip>:
80007684:	eacff06f          	j	80006d30 <pbuf_skip_const>

80007688 <pbuf_take>:
80007688:	08050c63          	beqz	a0,80007720 <pbuf_take+0x98>
8000768c:	fe010113          	addi	sp,sp,-32
80007690:	00912a23          	sw	s1,20(sp)
80007694:	01412423          	sw	s4,8(sp)
80007698:	00112e23          	sw	ra,28(sp)
8000769c:	00812c23          	sw	s0,24(sp)
800076a0:	01212823          	sw	s2,16(sp)
800076a4:	01312623          	sw	s3,12(sp)
800076a8:	00050493          	mv	s1,a0
800076ac:	00058a13          	mv	s4,a1
800076b0:	ff000513          	li	a0,-16
800076b4:	00058c63          	beqz	a1,800076cc <pbuf_take+0x44>
800076b8:	0084d783          	lhu	a5,8(s1)
800076bc:	00060413          	mv	s0,a2
800076c0:	fff00513          	li	a0,-1
800076c4:	00000993          	li	s3,0
800076c8:	04c7f663          	bgeu	a5,a2,80007714 <pbuf_take+0x8c>
800076cc:	01c12083          	lw	ra,28(sp)
800076d0:	01812403          	lw	s0,24(sp)
800076d4:	01412483          	lw	s1,20(sp)
800076d8:	01012903          	lw	s2,16(sp)
800076dc:	00c12983          	lw	s3,12(sp)
800076e0:	00812a03          	lw	s4,8(sp)
800076e4:	02010113          	addi	sp,sp,32
800076e8:	00008067          	ret
800076ec:	00a4d903          	lhu	s2,10(s1)
800076f0:	01247463          	bgeu	s0,s2,800076f8 <pbuf_take+0x70>
800076f4:	00040913          	mv	s2,s0
800076f8:	0044a503          	lw	a0,4(s1)
800076fc:	013a05b3          	add	a1,s4,s3
80007700:	00090613          	mv	a2,s2
80007704:	0e1060ef          	jal	ra,8000dfe4 <memcpy>
80007708:	0004a483          	lw	s1,0(s1)
8000770c:	41240433          	sub	s0,s0,s2
80007710:	012989b3          	add	s3,s3,s2
80007714:	fc041ce3          	bnez	s0,800076ec <pbuf_take+0x64>
80007718:	00000513          	li	a0,0
8000771c:	fb1ff06f          	j	800076cc <pbuf_take+0x44>
80007720:	ff000513          	li	a0,-16
80007724:	00008067          	ret

80007728 <pbuf_take_at>:
80007728:	fd010113          	addi	sp,sp,-48
8000772c:	02812423          	sw	s0,40(sp)
80007730:	01312e23          	sw	s3,28(sp)
80007734:	00060413          	mv	s0,a2
80007738:	00058993          	mv	s3,a1
8000773c:	00e10613          	addi	a2,sp,14
80007740:	00068593          	mv	a1,a3
80007744:	02112623          	sw	ra,44(sp)
80007748:	02912223          	sw	s1,36(sp)
8000774c:	03212023          	sw	s2,32(sp)
80007750:	de0ff0ef          	jal	ra,80006d30 <pbuf_skip_const>
80007754:	08050263          	beqz	a0,800077d8 <pbuf_take_at+0xb0>
80007758:	00e15703          	lhu	a4,14(sp)
8000775c:	00855683          	lhu	a3,8(a0)
80007760:	00050493          	mv	s1,a0
80007764:	008707b3          	add	a5,a4,s0
80007768:	fff00513          	li	a0,-1
8000776c:	04f6c863          	blt	a3,a5,800077bc <pbuf_take_at+0x94>
80007770:	00a4d783          	lhu	a5,10(s1)
80007774:	00040913          	mv	s2,s0
80007778:	40e787b3          	sub	a5,a5,a4
8000777c:	0087d663          	bge	a5,s0,80007788 <pbuf_take_at+0x60>
80007780:	01079913          	slli	s2,a5,0x10
80007784:	01095913          	srli	s2,s2,0x10
80007788:	0044a503          	lw	a0,4(s1)
8000778c:	00090613          	mv	a2,s2
80007790:	00098593          	mv	a1,s3
80007794:	00e50533          	add	a0,a0,a4
80007798:	04d060ef          	jal	ra,8000dfe4 <memcpy>
8000779c:	41240633          	sub	a2,s0,s2
800077a0:	01061613          	slli	a2,a2,0x10
800077a4:	01065613          	srli	a2,a2,0x10
800077a8:	00000513          	li	a0,0
800077ac:	00060863          	beqz	a2,800077bc <pbuf_take_at+0x94>
800077b0:	0004a503          	lw	a0,0(s1)
800077b4:	012985b3          	add	a1,s3,s2
800077b8:	ed1ff0ef          	jal	ra,80007688 <pbuf_take>
800077bc:	02c12083          	lw	ra,44(sp)
800077c0:	02812403          	lw	s0,40(sp)
800077c4:	02412483          	lw	s1,36(sp)
800077c8:	02012903          	lw	s2,32(sp)
800077cc:	01c12983          	lw	s3,28(sp)
800077d0:	03010113          	addi	sp,sp,48
800077d4:	00008067          	ret
800077d8:	fff00513          	li	a0,-1
800077dc:	fe1ff06f          	j	800077bc <pbuf_take_at+0x94>

800077e0 <pbuf_clone>:
800077e0:	ff010113          	addi	sp,sp,-16
800077e4:	00912223          	sw	s1,4(sp)
800077e8:	00060493          	mv	s1,a2
800077ec:	00058613          	mv	a2,a1
800077f0:	0084d583          	lhu	a1,8(s1)
800077f4:	00812423          	sw	s0,8(sp)
800077f8:	00112623          	sw	ra,12(sp)
800077fc:	821ff0ef          	jal	ra,8000701c <pbuf_alloc>
80007800:	00050413          	mv	s0,a0
80007804:	00050663          	beqz	a0,80007810 <pbuf_clone+0x30>
80007808:	00048593          	mv	a1,s1
8000780c:	c11ff0ef          	jal	ra,8000741c <pbuf_copy>
80007810:	00040513          	mv	a0,s0
80007814:	00c12083          	lw	ra,12(sp)
80007818:	00812403          	lw	s0,8(sp)
8000781c:	00412483          	lw	s1,4(sp)
80007820:	01010113          	addi	sp,sp,16
80007824:	00008067          	ret

80007828 <pbuf_coalesce>:
80007828:	ff010113          	addi	sp,sp,-16
8000782c:	00812423          	sw	s0,8(sp)
80007830:	00112623          	sw	ra,12(sp)
80007834:	00912223          	sw	s1,4(sp)
80007838:	00052783          	lw	a5,0(a0)
8000783c:	00050413          	mv	s0,a0
80007840:	02079063          	bnez	a5,80007860 <pbuf_coalesce+0x38>
80007844:	00040493          	mv	s1,s0
80007848:	00c12083          	lw	ra,12(sp)
8000784c:	00812403          	lw	s0,8(sp)
80007850:	00048513          	mv	a0,s1
80007854:	00412483          	lw	s1,4(sp)
80007858:	01010113          	addi	sp,sp,16
8000785c:	00008067          	ret
80007860:	00058513          	mv	a0,a1
80007864:	00040613          	mv	a2,s0
80007868:	28000593          	li	a1,640
8000786c:	f75ff0ef          	jal	ra,800077e0 <pbuf_clone>
80007870:	00050493          	mv	s1,a0
80007874:	fc0508e3          	beqz	a0,80007844 <pbuf_coalesce+0x1c>
80007878:	00040513          	mv	a0,s0
8000787c:	eccff0ef          	jal	ra,80006f48 <pbuf_free>
80007880:	fc9ff06f          	j	80007848 <pbuf_coalesce+0x20>

80007884 <pbuf_try_get_at>:
80007884:	fe010113          	addi	sp,sp,-32
80007888:	00e10613          	addi	a2,sp,14
8000788c:	00112e23          	sw	ra,28(sp)
80007890:	ca0ff0ef          	jal	ra,80006d30 <pbuf_skip_const>
80007894:	fff00793          	li	a5,-1
80007898:	02050063          	beqz	a0,800078b8 <pbuf_try_get_at+0x34>
8000789c:	00e15703          	lhu	a4,14(sp)
800078a0:	00a55683          	lhu	a3,10(a0)
800078a4:	fff00793          	li	a5,-1
800078a8:	00d77863          	bgeu	a4,a3,800078b8 <pbuf_try_get_at+0x34>
800078ac:	00452783          	lw	a5,4(a0)
800078b0:	00e787b3          	add	a5,a5,a4
800078b4:	0007c783          	lbu	a5,0(a5)
800078b8:	01c12083          	lw	ra,28(sp)
800078bc:	00078513          	mv	a0,a5
800078c0:	02010113          	addi	sp,sp,32
800078c4:	00008067          	ret

800078c8 <pbuf_get_at>:
800078c8:	ff010113          	addi	sp,sp,-16
800078cc:	00112623          	sw	ra,12(sp)
800078d0:	fb5ff0ef          	jal	ra,80007884 <pbuf_try_get_at>
800078d4:	00055463          	bgez	a0,800078dc <pbuf_get_at+0x14>
800078d8:	00000513          	li	a0,0
800078dc:	00c12083          	lw	ra,12(sp)
800078e0:	0ff57513          	andi	a0,a0,255
800078e4:	01010113          	addi	sp,sp,16
800078e8:	00008067          	ret

800078ec <pbuf_put_at>:
800078ec:	fe010113          	addi	sp,sp,-32
800078f0:	00812c23          	sw	s0,24(sp)
800078f4:	00060413          	mv	s0,a2
800078f8:	00e10613          	addi	a2,sp,14
800078fc:	00112e23          	sw	ra,28(sp)
80007900:	c30ff0ef          	jal	ra,80006d30 <pbuf_skip_const>
80007904:	00050e63          	beqz	a0,80007920 <pbuf_put_at+0x34>
80007908:	00e15703          	lhu	a4,14(sp)
8000790c:	00a55783          	lhu	a5,10(a0)
80007910:	00f77863          	bgeu	a4,a5,80007920 <pbuf_put_at+0x34>
80007914:	00452783          	lw	a5,4(a0)
80007918:	00e787b3          	add	a5,a5,a4
8000791c:	00878023          	sb	s0,0(a5)
80007920:	01c12083          	lw	ra,28(sp)
80007924:	01812403          	lw	s0,24(sp)
80007928:	02010113          	addi	sp,sp,32
8000792c:	00008067          	ret

80007930 <pbuf_memcmp>:
80007930:	00855703          	lhu	a4,8(a0)
80007934:	00d587b3          	add	a5,a1,a3
80007938:	00f75863          	bge	a4,a5,80007948 <pbuf_memcmp+0x18>
8000793c:	00010537          	lui	a0,0x10
80007940:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xf7ff>
80007944:	00008067          	ret
80007948:	fd010113          	addi	sp,sp,-48
8000794c:	02812423          	sw	s0,40(sp)
80007950:	02912223          	sw	s1,36(sp)
80007954:	02112623          	sw	ra,44(sp)
80007958:	03212023          	sw	s2,32(sp)
8000795c:	01312e23          	sw	s3,28(sp)
80007960:	00050493          	mv	s1,a0
80007964:	00058413          	mv	s0,a1
80007968:	00a4d783          	lhu	a5,10(s1)
8000796c:	00f46c63          	bltu	s0,a5,80007984 <pbuf_memcmp+0x54>
80007970:	0004a483          	lw	s1,0(s1)
80007974:	40f40433          	sub	s0,s0,a5
80007978:	01041413          	slli	s0,s0,0x10
8000797c:	01045413          	srli	s0,s0,0x10
80007980:	fe0494e3          	bnez	s1,80007968 <pbuf_memcmp+0x38>
80007984:	00000993          	li	s3,0
80007988:	01099913          	slli	s2,s3,0x10
8000798c:	01095913          	srli	s2,s2,0x10
80007990:	00d96663          	bltu	s2,a3,8000799c <pbuf_memcmp+0x6c>
80007994:	00000513          	li	a0,0
80007998:	0580006f          	j	800079f0 <pbuf_memcmp+0xc0>
8000799c:	008905b3          	add	a1,s2,s0
800079a0:	01059593          	slli	a1,a1,0x10
800079a4:	0105d593          	srli	a1,a1,0x10
800079a8:	00048513          	mv	a0,s1
800079ac:	00d12623          	sw	a3,12(sp)
800079b0:	00c12423          	sw	a2,8(sp)
800079b4:	f15ff0ef          	jal	ra,800078c8 <pbuf_get_at>
800079b8:	00812603          	lw	a2,8(sp)
800079bc:	00198993          	addi	s3,s3,1
800079c0:	00c12683          	lw	a3,12(sp)
800079c4:	013607b3          	add	a5,a2,s3
800079c8:	fff7c783          	lbu	a5,-1(a5)
800079cc:	faa78ee3          	beq	a5,a0,80007988 <pbuf_memcmp+0x58>
800079d0:	000107b7          	lui	a5,0x10
800079d4:	ffe78793          	addi	a5,a5,-2 # fffe <_stack_size+0xf7fe>
800079d8:	00090513          	mv	a0,s2
800079dc:	0127f463          	bgeu	a5,s2,800079e4 <pbuf_memcmp+0xb4>
800079e0:	ffe00513          	li	a0,-2
800079e4:	00150513          	addi	a0,a0,1
800079e8:	01051513          	slli	a0,a0,0x10
800079ec:	01055513          	srli	a0,a0,0x10
800079f0:	02c12083          	lw	ra,44(sp)
800079f4:	02812403          	lw	s0,40(sp)
800079f8:	02412483          	lw	s1,36(sp)
800079fc:	02012903          	lw	s2,32(sp)
80007a00:	01c12983          	lw	s3,28(sp)
80007a04:	03010113          	addi	sp,sp,48
80007a08:	00008067          	ret

80007a0c <pbuf_memfind>:
80007a0c:	fe010113          	addi	sp,sp,-32
80007a10:	00112e23          	sw	ra,28(sp)
80007a14:	00812c23          	sw	s0,24(sp)
80007a18:	00912a23          	sw	s1,20(sp)
80007a1c:	01212823          	sw	s2,16(sp)
80007a20:	01312623          	sw	s3,12(sp)
80007a24:	01412423          	sw	s4,8(sp)
80007a28:	00855783          	lhu	a5,8(a0)
80007a2c:	00d60733          	add	a4,a2,a3
80007a30:	02e7c263          	blt	a5,a4,80007a54 <pbuf_memfind+0x48>
80007a34:	40c787b3          	sub	a5,a5,a2
80007a38:	01079493          	slli	s1,a5,0x10
80007a3c:	00050993          	mv	s3,a0
80007a40:	00058a13          	mv	s4,a1
80007a44:	00060913          	mv	s2,a2
80007a48:	00068413          	mv	s0,a3
80007a4c:	0104d493          	srli	s1,s1,0x10
80007a50:	0284f863          	bgeu	s1,s0,80007a80 <pbuf_memfind+0x74>
80007a54:	00010437          	lui	s0,0x10
80007a58:	fff40413          	addi	s0,s0,-1 # ffff <_stack_size+0xf7ff>
80007a5c:	00040513          	mv	a0,s0
80007a60:	01c12083          	lw	ra,28(sp)
80007a64:	01812403          	lw	s0,24(sp)
80007a68:	01412483          	lw	s1,20(sp)
80007a6c:	01012903          	lw	s2,16(sp)
80007a70:	00c12983          	lw	s3,12(sp)
80007a74:	00812a03          	lw	s4,8(sp)
80007a78:	02010113          	addi	sp,sp,32
80007a7c:	00008067          	ret
80007a80:	00090693          	mv	a3,s2
80007a84:	000a0613          	mv	a2,s4
80007a88:	00040593          	mv	a1,s0
80007a8c:	00098513          	mv	a0,s3
80007a90:	ea1ff0ef          	jal	ra,80007930 <pbuf_memcmp>
80007a94:	fc0504e3          	beqz	a0,80007a5c <pbuf_memfind+0x50>
80007a98:	00140413          	addi	s0,s0,1
80007a9c:	01041413          	slli	s0,s0,0x10
80007aa0:	01045413          	srli	s0,s0,0x10
80007aa4:	fadff06f          	j	80007a50 <pbuf_memfind+0x44>

80007aa8 <pbuf_strstr>:
80007aa8:	fe010113          	addi	sp,sp,-32
80007aac:	00812c23          	sw	s0,24(sp)
80007ab0:	01212823          	sw	s2,16(sp)
80007ab4:	00112e23          	sw	ra,28(sp)
80007ab8:	00010937          	lui	s2,0x10
80007abc:	00912a23          	sw	s1,20(sp)
80007ac0:	fff90413          	addi	s0,s2,-1 # ffff <_stack_size+0xf7ff>
80007ac4:	04058c63          	beqz	a1,80007b1c <pbuf_strstr+0x74>
80007ac8:	0005c783          	lbu	a5,0(a1)
80007acc:	04078863          	beqz	a5,80007b1c <pbuf_strstr+0x74>
80007ad0:	00855783          	lhu	a5,8(a0)
80007ad4:	04878663          	beq	a5,s0,80007b20 <pbuf_strstr+0x78>
80007ad8:	00050493          	mv	s1,a0
80007adc:	00058513          	mv	a0,a1
80007ae0:	00b12623          	sw	a1,12(sp)
80007ae4:	ffe90913          	addi	s2,s2,-2
80007ae8:	575060ef          	jal	ra,8000e85c <strlen>
80007aec:	02a96863          	bltu	s2,a0,80007b1c <pbuf_strstr+0x74>
80007af0:	01812403          	lw	s0,24(sp)
80007af4:	01051613          	slli	a2,a0,0x10
80007af8:	00c12583          	lw	a1,12(sp)
80007afc:	01c12083          	lw	ra,28(sp)
80007b00:	01012903          	lw	s2,16(sp)
80007b04:	00048513          	mv	a0,s1
80007b08:	01412483          	lw	s1,20(sp)
80007b0c:	00000693          	li	a3,0
80007b10:	01065613          	srli	a2,a2,0x10
80007b14:	02010113          	addi	sp,sp,32
80007b18:	ef5ff06f          	j	80007a0c <pbuf_memfind>
80007b1c:	00040793          	mv	a5,s0
80007b20:	01c12083          	lw	ra,28(sp)
80007b24:	01812403          	lw	s0,24(sp)
80007b28:	01412483          	lw	s1,20(sp)
80007b2c:	01012903          	lw	s2,16(sp)
80007b30:	00078513          	mv	a0,a5
80007b34:	02010113          	addi	sp,sp,32
80007b38:	00008067          	ret

80007b3c <raw_input>:
80007b3c:	fd010113          	addi	sp,sp,-48
80007b40:	02912223          	sw	s1,36(sp)
80007b44:	9ec18793          	addi	a5,gp,-1556 # 80003224 <ip_data>
80007b48:	02812423          	sw	s0,40(sp)
80007b4c:	03212023          	sw	s2,32(sp)
80007b50:	01312e23          	sw	s3,28(sp)
80007b54:	01412c23          	sw	s4,24(sp)
80007b58:	01512a23          	sw	s5,20(sp)
80007b5c:	01612823          	sw	s6,16(sp)
80007b60:	01712623          	sw	s7,12(sp)
80007b64:	02112623          	sw	ra,44(sp)
80007b68:	00050a13          	mv	s4,a0
80007b6c:	0007a583          	lw	a1,0(a5)
80007b70:	0147a503          	lw	a0,20(a5)
80007b74:	00000993          	li	s3,0
80007b78:	9ec18493          	addi	s1,gp,-1556 # 80003224 <ip_data>
80007b7c:	179040ef          	jal	ra,8000c4f4 <ip4_addr_isbroadcast_u32>
80007b80:	004a2783          	lw	a5,4(s4)
80007b84:	00050b13          	mv	s6,a0
80007b88:	0097ca83          	lbu	s5,9(a5)
80007b8c:	8d01a403          	lw	s0,-1840(gp) # 80003108 <raw_pcbs>
80007b90:	00000513          	li	a0,0
80007b94:	00078913          	mv	s2,a5
80007b98:	08040a63          	beqz	s0,80007c2c <raw_input+0xf0>
80007b9c:	01444783          	lbu	a5,20(s0)
80007ba0:	0d579463          	bne	a5,s5,80007c68 <raw_input+0x12c>
80007ba4:	00844703          	lbu	a4,8(s0)
80007ba8:	00070c63          	beqz	a4,80007bc0 <raw_input+0x84>
80007bac:	0044a783          	lw	a5,4(s1)
80007bb0:	0387c783          	lbu	a5,56(a5)
80007bb4:	00178793          	addi	a5,a5,1
80007bb8:	0ff7f793          	andi	a5,a5,255
80007bbc:	0af71663          	bne	a4,a5,80007c68 <raw_input+0x12c>
80007bc0:	080b0c63          	beqz	s6,80007c58 <raw_input+0x11c>
80007bc4:	00944783          	lbu	a5,9(s0)
80007bc8:	0207f793          	andi	a5,a5,32
80007bcc:	08078e63          	beqz	a5,80007c68 <raw_input+0x12c>
80007bd0:	00042783          	lw	a5,0(s0)
80007bd4:	08079a63          	bnez	a5,80007c68 <raw_input+0x12c>
80007bd8:	01544783          	lbu	a5,21(s0)
80007bdc:	0017f793          	andi	a5,a5,1
80007be0:	00078863          	beqz	a5,80007bf0 <raw_input+0xb4>
80007be4:	00442703          	lw	a4,4(s0)
80007be8:	0104a783          	lw	a5,16(s1)
80007bec:	06f71e63          	bne	a4,a5,80007c68 <raw_input+0x12c>
80007bf0:	01842783          	lw	a5,24(s0)
80007bf4:	06078a63          	beqz	a5,80007c68 <raw_input+0x12c>
80007bf8:	01c42503          	lw	a0,28(s0)
80007bfc:	9fc18693          	addi	a3,gp,-1540 # 80003234 <ip_data+0x10>
80007c00:	000a0613          	mv	a2,s4
80007c04:	00040593          	mv	a1,s0
80007c08:	000780e7          	jalr	a5
80007c0c:	06050463          	beqz	a0,80007c74 <raw_input+0x138>
80007c10:	00100513          	li	a0,1
80007c14:	00098c63          	beqz	s3,80007c2c <raw_input+0xf0>
80007c18:	01042783          	lw	a5,16(s0)
80007c1c:	00f9a823          	sw	a5,16(s3)
80007c20:	8d01a783          	lw	a5,-1840(gp) # 80003108 <raw_pcbs>
80007c24:	8c81a823          	sw	s0,-1840(gp) # 80003108 <raw_pcbs>
80007c28:	00f42823          	sw	a5,16(s0)
80007c2c:	02c12083          	lw	ra,44(sp)
80007c30:	02812403          	lw	s0,40(sp)
80007c34:	02412483          	lw	s1,36(sp)
80007c38:	02012903          	lw	s2,32(sp)
80007c3c:	01c12983          	lw	s3,28(sp)
80007c40:	01812a03          	lw	s4,24(sp)
80007c44:	01412a83          	lw	s5,20(sp)
80007c48:	01012b03          	lw	s6,16(sp)
80007c4c:	00c12b83          	lw	s7,12(sp)
80007c50:	03010113          	addi	sp,sp,48
80007c54:	00008067          	ret
80007c58:	00042783          	lw	a5,0(s0)
80007c5c:	f6078ee3          	beqz	a5,80007bd8 <raw_input+0x9c>
80007c60:	0144a703          	lw	a4,20(s1)
80007c64:	f6e78ae3          	beq	a5,a4,80007bd8 <raw_input+0x9c>
80007c68:	00040993          	mv	s3,s0
80007c6c:	01042403          	lw	s0,16(s0)
80007c70:	f29ff06f          	j	80007b98 <raw_input+0x5c>
80007c74:	00200513          	li	a0,2
80007c78:	ff1ff06f          	j	80007c68 <raw_input+0x12c>

80007c7c <raw_bind>:
80007c7c:	ffa00793          	li	a5,-6
80007c80:	00050a63          	beqz	a0,80007c94 <raw_bind+0x18>
80007c84:	00058863          	beqz	a1,80007c94 <raw_bind+0x18>
80007c88:	0005a783          	lw	a5,0(a1)
80007c8c:	00f52023          	sw	a5,0(a0)
80007c90:	00000793          	li	a5,0
80007c94:	00078513          	mv	a0,a5
80007c98:	00008067          	ret

80007c9c <raw_bind_netif>:
80007c9c:	00000793          	li	a5,0
80007ca0:	00058863          	beqz	a1,80007cb0 <raw_bind_netif+0x14>
80007ca4:	0385c783          	lbu	a5,56(a1)
80007ca8:	00178793          	addi	a5,a5,1
80007cac:	0ff7f793          	andi	a5,a5,255
80007cb0:	00f50423          	sb	a5,8(a0)
80007cb4:	00008067          	ret

80007cb8 <raw_connect>:
80007cb8:	00050793          	mv	a5,a0
80007cbc:	ffa00513          	li	a0,-6
80007cc0:	02078263          	beqz	a5,80007ce4 <raw_connect+0x2c>
80007cc4:	02058063          	beqz	a1,80007ce4 <raw_connect+0x2c>
80007cc8:	0005a703          	lw	a4,0(a1)
80007ccc:	00000513          	li	a0,0
80007cd0:	00e7a223          	sw	a4,4(a5)
80007cd4:	0157c703          	lbu	a4,21(a5)
80007cd8:	00176713          	ori	a4,a4,1
80007cdc:	00e78aa3          	sb	a4,21(a5)
80007ce0:	00008067          	ret
80007ce4:	00008067          	ret

80007ce8 <raw_disconnect>:
80007ce8:	01554783          	lbu	a5,21(a0)
80007cec:	00052223          	sw	zero,4(a0)
80007cf0:	00050423          	sb	zero,8(a0)
80007cf4:	ffe7f793          	andi	a5,a5,-2
80007cf8:	00f50aa3          	sb	a5,21(a0)
80007cfc:	00008067          	ret

80007d00 <raw_recv>:
80007d00:	00b52c23          	sw	a1,24(a0)
80007d04:	00c52e23          	sw	a2,28(a0)
80007d08:	00008067          	ret

80007d0c <raw_sendto_if_src>:
80007d0c:	fe010113          	addi	sp,sp,-32
80007d10:	00112e23          	sw	ra,28(sp)
80007d14:	00812c23          	sw	s0,24(sp)
80007d18:	00912a23          	sw	s1,20(sp)
80007d1c:	01212823          	sw	s2,16(sp)
80007d20:	01312623          	sw	s3,12(sp)
80007d24:	01412423          	sw	s4,8(sp)
80007d28:	01512223          	sw	s5,4(sp)
80007d2c:	00051663          	bnez	a0,80007d38 <raw_sendto_if_src+0x2c>
80007d30:	ffa00493          	li	s1,-6
80007d34:	06c0006f          	j	80007da0 <raw_sendto_if_src+0x94>
80007d38:	fe060ce3          	beqz	a2,80007d30 <raw_sendto_if_src+0x24>
80007d3c:	fe068ae3          	beqz	a3,80007d30 <raw_sendto_if_src+0x24>
80007d40:	fe0708e3          	beqz	a4,80007d30 <raw_sendto_if_src+0x24>
80007d44:	01554783          	lbu	a5,21(a0)
80007d48:	00070a13          	mv	s4,a4
80007d4c:	00068913          	mv	s2,a3
80007d50:	0027f793          	andi	a5,a5,2
80007d54:	00060a93          	mv	s5,a2
80007d58:	00058413          	mv	s0,a1
80007d5c:	00050493          	mv	s1,a0
80007d60:	06078463          	beqz	a5,80007dc8 <raw_sendto_if_src+0xbc>
80007d64:	00a5d703          	lhu	a4,10(a1)
80007d68:	01300793          	li	a5,19
80007d6c:	fce7f2e3          	bgeu	a5,a4,80007d30 <raw_sendto_if_src+0x24>
80007d70:	00c50493          	addi	s1,a0,12
80007d74:	0296ae23          	sw	s1,60(a3)
80007d78:	00068813          	mv	a6,a3
80007d7c:	00000793          	li	a5,0
80007d80:	00000713          	li	a4,0
80007d84:	00000693          	li	a3,0
80007d88:	00000613          	li	a2,0
80007d8c:	000a0593          	mv	a1,s4
80007d90:	00040513          	mv	a0,s0
80007d94:	634040ef          	jal	ra,8000c3c8 <ip4_output_if>
80007d98:	00050493          	mv	s1,a0
80007d9c:	02092e23          	sw	zero,60(s2)
80007da0:	01c12083          	lw	ra,28(sp)
80007da4:	01812403          	lw	s0,24(sp)
80007da8:	00048513          	mv	a0,s1
80007dac:	01012903          	lw	s2,16(sp)
80007db0:	01412483          	lw	s1,20(sp)
80007db4:	00c12983          	lw	s3,12(sp)
80007db8:	00812a03          	lw	s4,8(sp)
80007dbc:	00412a83          	lw	s5,4(sp)
80007dc0:	02010113          	addi	sp,sp,32
80007dc4:	00008067          	ret
80007dc8:	0085d703          	lhu	a4,8(a1)
80007dcc:	000107b7          	lui	a5,0x10
80007dd0:	feb78793          	addi	a5,a5,-21 # ffeb <_stack_size+0xf7eb>
80007dd4:	00e7f663          	bgeu	a5,a4,80007de0 <raw_sendto_if_src+0xd4>
80007dd8:	fff00493          	li	s1,-1
80007ddc:	fc5ff06f          	j	80007da0 <raw_sendto_if_src+0x94>
80007de0:	01400593          	li	a1,20
80007de4:	00040513          	mv	a0,s0
80007de8:	8c8ff0ef          	jal	ra,80006eb0 <pbuf_add_header>
80007dec:	04050c63          	beqz	a0,80007e44 <raw_sendto_if_src+0x138>
80007df0:	28000613          	li	a2,640
80007df4:	00000593          	li	a1,0
80007df8:	02400513          	li	a0,36
80007dfc:	a20ff0ef          	jal	ra,8000701c <pbuf_alloc>
80007e00:	00050993          	mv	s3,a0
80007e04:	fc050ae3          	beqz	a0,80007dd8 <raw_sendto_if_src+0xcc>
80007e08:	00845783          	lhu	a5,8(s0)
80007e0c:	00078663          	beqz	a5,80007e18 <raw_sendto_if_src+0x10c>
80007e10:	00040593          	mv	a1,s0
80007e14:	d8cff0ef          	jal	ra,800073a0 <pbuf_chain>
80007e18:	0094c783          	lbu	a5,9(s1)
80007e1c:	0207f793          	andi	a5,a5,32
80007e20:	02079e63          	bnez	a5,80007e5c <raw_sendto_if_src+0x150>
80007e24:	000aa503          	lw	a0,0(s5)
80007e28:	00090593          	mv	a1,s2
80007e2c:	6c8040ef          	jal	ra,8000c4f4 <ip4_addr_isbroadcast_u32>
80007e30:	02050663          	beqz	a0,80007e5c <raw_sendto_if_src+0x150>
80007e34:	ef340ee3          	beq	s0,s3,80007d30 <raw_sendto_if_src+0x24>
80007e38:	00098513          	mv	a0,s3
80007e3c:	90cff0ef          	jal	ra,80006f48 <pbuf_free>
80007e40:	ef1ff06f          	j	80007d30 <raw_sendto_if_src+0x24>
80007e44:	01400593          	li	a1,20
80007e48:	00040513          	mv	a0,s0
80007e4c:	874ff0ef          	jal	ra,80006ec0 <pbuf_remove_header>
80007e50:	f80514e3          	bnez	a0,80007dd8 <raw_sendto_if_src+0xcc>
80007e54:	00040993          	mv	s3,s0
80007e58:	fc1ff06f          	j	80007e18 <raw_sendto_if_src+0x10c>
80007e5c:	00c48793          	addi	a5,s1,12
80007e60:	00b4c683          	lbu	a3,11(s1)
80007e64:	02f92e23          	sw	a5,60(s2)
80007e68:	0144c783          	lbu	a5,20(s1)
80007e6c:	00a4c703          	lbu	a4,10(s1)
80007e70:	00090813          	mv	a6,s2
80007e74:	000a8613          	mv	a2,s5
80007e78:	000a0593          	mv	a1,s4
80007e7c:	00098513          	mv	a0,s3
80007e80:	548040ef          	jal	ra,8000c3c8 <ip4_output_if>
80007e84:	02092e23          	sw	zero,60(s2)
80007e88:	00050493          	mv	s1,a0
80007e8c:	f1340ae3          	beq	s0,s3,80007da0 <raw_sendto_if_src+0x94>
80007e90:	00098513          	mv	a0,s3
80007e94:	8b4ff0ef          	jal	ra,80006f48 <pbuf_free>
80007e98:	f09ff06f          	j	80007da0 <raw_sendto_if_src+0x94>

80007e9c <raw_sendto>:
80007e9c:	08050663          	beqz	a0,80007f28 <raw_sendto+0x8c>
80007ea0:	08060463          	beqz	a2,80007f28 <raw_sendto+0x8c>
80007ea4:	ff010113          	addi	sp,sp,-16
80007ea8:	00812423          	sw	s0,8(sp)
80007eac:	00912223          	sw	s1,4(sp)
80007eb0:	01212023          	sw	s2,0(sp)
80007eb4:	00112623          	sw	ra,12(sp)
80007eb8:	00050413          	mv	s0,a0
80007ebc:	00854503          	lbu	a0,8(a0)
80007ec0:	00060493          	mv	s1,a2
80007ec4:	00058913          	mv	s2,a1
80007ec8:	04050663          	beqz	a0,80007f14 <raw_sendto+0x78>
80007ecc:	d41fe0ef          	jal	ra,80006c0c <netif_get_by_index>
80007ed0:	06050063          	beqz	a0,80007f30 <raw_sendto+0x94>
80007ed4:	00042783          	lw	a5,0(s0)
80007ed8:	04078463          	beqz	a5,80007f20 <raw_sendto+0x84>
80007edc:	0f07f793          	andi	a5,a5,240
80007ee0:	0e000713          	li	a4,224
80007ee4:	02e78e63          	beq	a5,a4,80007f20 <raw_sendto+0x84>
80007ee8:	00040713          	mv	a4,s0
80007eec:	00050693          	mv	a3,a0
80007ef0:	00040513          	mv	a0,s0
80007ef4:	00812403          	lw	s0,8(sp)
80007ef8:	00c12083          	lw	ra,12(sp)
80007efc:	00048613          	mv	a2,s1
80007f00:	00090593          	mv	a1,s2
80007f04:	00412483          	lw	s1,4(sp)
80007f08:	00012903          	lw	s2,0(sp)
80007f0c:	01010113          	addi	sp,sp,16
80007f10:	dfdff06f          	j	80007d0c <raw_sendto_if_src>
80007f14:	00060513          	mv	a0,a2
80007f18:	619030ef          	jal	ra,8000bd30 <ip4_route>
80007f1c:	fb5ff06f          	j	80007ed0 <raw_sendto+0x34>
80007f20:	00450713          	addi	a4,a0,4
80007f24:	fc9ff06f          	j	80007eec <raw_sendto+0x50>
80007f28:	ffa00513          	li	a0,-6
80007f2c:	00008067          	ret
80007f30:	00c12083          	lw	ra,12(sp)
80007f34:	00812403          	lw	s0,8(sp)
80007f38:	00412483          	lw	s1,4(sp)
80007f3c:	00012903          	lw	s2,0(sp)
80007f40:	ffc00513          	li	a0,-4
80007f44:	01010113          	addi	sp,sp,16
80007f48:	00008067          	ret

80007f4c <raw_send>:
80007f4c:	00450613          	addi	a2,a0,4
80007f50:	f4dff06f          	j	80007e9c <raw_sendto>

80007f54 <raw_remove>:
80007f54:	8d01a783          	lw	a5,-1840(gp) # 80003108 <raw_pcbs>
80007f58:	00050593          	mv	a1,a0
80007f5c:	00a79c63          	bne	a5,a0,80007f74 <raw_remove+0x20>
80007f60:	01052783          	lw	a5,16(a0)
80007f64:	8cf1a823          	sw	a5,-1840(gp) # 80003108 <raw_pcbs>
80007f68:	00000513          	li	a0,0
80007f6c:	f28fe06f          	j	80006694 <memp_free>
80007f70:	00070793          	mv	a5,a4
80007f74:	fe078ae3          	beqz	a5,80007f68 <raw_remove+0x14>
80007f78:	0107a703          	lw	a4,16(a5)
80007f7c:	fe0706e3          	beqz	a4,80007f68 <raw_remove+0x14>
80007f80:	feb718e3          	bne	a4,a1,80007f70 <raw_remove+0x1c>
80007f84:	0105a703          	lw	a4,16(a1)
80007f88:	00e7a823          	sw	a4,16(a5)
80007f8c:	fddff06f          	j	80007f68 <raw_remove+0x14>

80007f90 <raw_new>:
80007f90:	ff010113          	addi	sp,sp,-16
80007f94:	800035b7          	lui	a1,0x80003
80007f98:	00912223          	sw	s1,4(sp)
80007f9c:	25a00613          	li	a2,602
80007fa0:	00050493          	mv	s1,a0
80007fa4:	c8c58593          	addi	a1,a1,-884 # 80002c8c <_heap_end+0xffff0c8c>
80007fa8:	00000513          	li	a0,0
80007fac:	00812423          	sw	s0,8(sp)
80007fb0:	00112623          	sw	ra,12(sp)
80007fb4:	ea8fe0ef          	jal	ra,8000665c <memp_malloc_fn>
80007fb8:	00050413          	mv	s0,a0
80007fbc:	02050463          	beqz	a0,80007fe4 <raw_new+0x54>
80007fc0:	02000613          	li	a2,32
80007fc4:	00000593          	li	a1,0
80007fc8:	3e5040ef          	jal	ra,8000cbac <memset>
80007fcc:	fff00793          	li	a5,-1
80007fd0:	00f405a3          	sb	a5,11(s0)
80007fd4:	8d01a703          	lw	a4,-1840(gp) # 80003108 <raw_pcbs>
80007fd8:	00940a23          	sb	s1,20(s0)
80007fdc:	8c81a823          	sw	s0,-1840(gp) # 80003108 <raw_pcbs>
80007fe0:	00e42823          	sw	a4,16(s0)
80007fe4:	00040513          	mv	a0,s0
80007fe8:	00c12083          	lw	ra,12(sp)
80007fec:	00812403          	lw	s0,8(sp)
80007ff0:	00412483          	lw	s1,4(sp)
80007ff4:	01010113          	addi	sp,sp,16
80007ff8:	00008067          	ret

80007ffc <raw_new_ip_type>:
80007ffc:	00058513          	mv	a0,a1
80008000:	f91ff06f          	j	80007f90 <raw_new>

80008004 <raw_netif_ip_addr_changed>:
80008004:	02050063          	beqz	a0,80008024 <raw_netif_ip_addr_changed+0x20>
80008008:	00052783          	lw	a5,0(a0)
8000800c:	00078c63          	beqz	a5,80008024 <raw_netif_ip_addr_changed+0x20>
80008010:	00058a63          	beqz	a1,80008024 <raw_netif_ip_addr_changed+0x20>
80008014:	0005a783          	lw	a5,0(a1)
80008018:	00078663          	beqz	a5,80008024 <raw_netif_ip_addr_changed+0x20>
8000801c:	8d01a783          	lw	a5,-1840(gp) # 80003108 <raw_pcbs>
80008020:	00079463          	bnez	a5,80008028 <raw_netif_ip_addr_changed+0x24>
80008024:	00008067          	ret
80008028:	0007a683          	lw	a3,0(a5)
8000802c:	00052703          	lw	a4,0(a0)
80008030:	00e69663          	bne	a3,a4,8000803c <raw_netif_ip_addr_changed+0x38>
80008034:	0005a703          	lw	a4,0(a1)
80008038:	00e7a023          	sw	a4,0(a5)
8000803c:	0107a783          	lw	a5,16(a5)
80008040:	fe1ff06f          	j	80008020 <raw_netif_ip_addr_changed+0x1c>

80008044 <stats_init>:
80008044:	00008067          	ret

80008048 <sys_timeout_abs>:
80008048:	ff010113          	addi	sp,sp,-16
8000804c:	01212023          	sw	s2,0(sp)
80008050:	00058913          	mv	s2,a1
80008054:	800035b7          	lui	a1,0x80003
80008058:	00812423          	sw	s0,8(sp)
8000805c:	00912223          	sw	s1,4(sp)
80008060:	00050413          	mv	s0,a0
80008064:	00060493          	mv	s1,a2
80008068:	cb858593          	addi	a1,a1,-840 # 80002cb8 <_heap_end+0xffff0cb8>
8000806c:	0bc00613          	li	a2,188
80008070:	00300513          	li	a0,3
80008074:	00112623          	sw	ra,12(sp)
80008078:	de4fe0ef          	jal	ra,8000665c <memp_malloc_fn>
8000807c:	02050063          	beqz	a0,8000809c <sys_timeout_abs+0x54>
80008080:	8d81a783          	lw	a5,-1832(gp) # 80003110 <next_timeout>
80008084:	00052023          	sw	zero,0(a0)
80008088:	01252423          	sw	s2,8(a0)
8000808c:	00952623          	sw	s1,12(a0)
80008090:	00852223          	sw	s0,4(a0)
80008094:	02079063          	bnez	a5,800080b4 <sys_timeout_abs+0x6c>
80008098:	8ca1ac23          	sw	a0,-1832(gp) # 80003110 <next_timeout>
8000809c:	00c12083          	lw	ra,12(sp)
800080a0:	00812403          	lw	s0,8(sp)
800080a4:	00412483          	lw	s1,4(sp)
800080a8:	00012903          	lw	s2,0(sp)
800080ac:	01010113          	addi	sp,sp,16
800080b0:	00008067          	ret
800080b4:	0047a683          	lw	a3,4(a5)
800080b8:	40d406b3          	sub	a3,s0,a3
800080bc:	0006d863          	bgez	a3,800080cc <sys_timeout_abs+0x84>
800080c0:	00f52023          	sw	a5,0(a0)
800080c4:	fd5ff06f          	j	80008098 <sys_timeout_abs+0x50>
800080c8:	00070793          	mv	a5,a4
800080cc:	0007a703          	lw	a4,0(a5)
800080d0:	00070863          	beqz	a4,800080e0 <sys_timeout_abs+0x98>
800080d4:	00472683          	lw	a3,4(a4) # 10004 <_stack_size+0xf804>
800080d8:	40d406b3          	sub	a3,s0,a3
800080dc:	fe06d6e3          	bgez	a3,800080c8 <sys_timeout_abs+0x80>
800080e0:	00e52023          	sw	a4,0(a0)
800080e4:	00a7a023          	sw	a0,0(a5)
800080e8:	fb5ff06f          	j	8000809c <sys_timeout_abs+0x54>

800080ec <lwip_cyclic_timer>:
800080ec:	fe010113          	addi	sp,sp,-32
800080f0:	00112e23          	sw	ra,28(sp)
800080f4:	00452783          	lw	a5,4(a0)
800080f8:	00a12623          	sw	a0,12(sp)
800080fc:	000780e7          	jalr	a5
80008100:	d31fc0ef          	jal	ra,80004e30 <sys_now>
80008104:	00c12603          	lw	a2,12(sp)
80008108:	8d41a783          	lw	a5,-1836(gp) # 8000310c <current_timeout_due_time>
8000810c:	00062703          	lw	a4,0(a2)
80008110:	800085b7          	lui	a1,0x80008
80008114:	0ec58593          	addi	a1,a1,236 # 800080ec <_heap_end+0xffff60ec>
80008118:	00f707b3          	add	a5,a4,a5
8000811c:	40a786b3          	sub	a3,a5,a0
80008120:	00a70533          	add	a0,a4,a0
80008124:	0006c463          	bltz	a3,8000812c <lwip_cyclic_timer+0x40>
80008128:	00078513          	mv	a0,a5
8000812c:	01c12083          	lw	ra,28(sp)
80008130:	02010113          	addi	sp,sp,32
80008134:	f15ff06f          	j	80008048 <sys_timeout_abs>

80008138 <sys_timeout>:
80008138:	fe010113          	addi	sp,sp,-32
8000813c:	00812c23          	sw	s0,24(sp)
80008140:	00112e23          	sw	ra,28(sp)
80008144:	00050413          	mv	s0,a0
80008148:	00b12623          	sw	a1,12(sp)
8000814c:	00c12423          	sw	a2,8(sp)
80008150:	ce1fc0ef          	jal	ra,80004e30 <sys_now>
80008154:	00850533          	add	a0,a0,s0
80008158:	01812403          	lw	s0,24(sp)
8000815c:	00812603          	lw	a2,8(sp)
80008160:	00c12583          	lw	a1,12(sp)
80008164:	01c12083          	lw	ra,28(sp)
80008168:	02010113          	addi	sp,sp,32
8000816c:	eddff06f          	j	80008048 <sys_timeout_abs>

80008170 <sys_timeouts_init>:
80008170:	ff010113          	addi	sp,sp,-16
80008174:	00812423          	sw	s0,8(sp)
80008178:	80003637          	lui	a2,0x80003
8000817c:	80008437          	lui	s0,0x80008
80008180:	00912223          	sw	s1,4(sp)
80008184:	0ec40593          	addi	a1,s0,236 # 800080ec <_heap_end+0xffff60ec>
80008188:	ca060493          	addi	s1,a2,-864 # 80002ca0 <_heap_end+0xffff0ca0>
8000818c:	3e800513          	li	a0,1000
80008190:	ca060613          	addi	a2,a2,-864
80008194:	00112623          	sw	ra,12(sp)
80008198:	fa1ff0ef          	jal	ra,80008138 <sys_timeout>
8000819c:	0000f537          	lui	a0,0xf
800081a0:	00848613          	addi	a2,s1,8
800081a4:	0ec40593          	addi	a1,s0,236
800081a8:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
800081ac:	f8dff0ef          	jal	ra,80008138 <sys_timeout>
800081b0:	0ec40593          	addi	a1,s0,236
800081b4:	00812403          	lw	s0,8(sp)
800081b8:	00c12083          	lw	ra,12(sp)
800081bc:	01048613          	addi	a2,s1,16
800081c0:	00412483          	lw	s1,4(sp)
800081c4:	1f400513          	li	a0,500
800081c8:	01010113          	addi	sp,sp,16
800081cc:	f6dff06f          	j	80008138 <sys_timeout>

800081d0 <sys_untimeout>:
800081d0:	8d81a783          	lw	a5,-1832(gp) # 80003110 <next_timeout>
800081d4:	00070693          	mv	a3,a4
800081d8:	00000613          	li	a2,0
800081dc:	00079e63          	bnez	a5,800081f8 <sys_untimeout+0x28>
800081e0:	00008067          	ret
800081e4:	00e62023          	sw	a4,0(a2)
800081e8:	02c0006f          	j	80008214 <sys_untimeout+0x44>
800081ec:	00078613          	mv	a2,a5
800081f0:	fe0708e3          	beqz	a4,800081e0 <sys_untimeout+0x10>
800081f4:	00070793          	mv	a5,a4
800081f8:	0087a803          	lw	a6,8(a5)
800081fc:	0007a703          	lw	a4,0(a5)
80008200:	fea816e3          	bne	a6,a0,800081ec <sys_untimeout+0x1c>
80008204:	00c7a803          	lw	a6,12(a5)
80008208:	feb812e3          	bne	a6,a1,800081ec <sys_untimeout+0x1c>
8000820c:	fc061ce3          	bnez	a2,800081e4 <sys_untimeout+0x14>
80008210:	8ce1ac23          	sw	a4,-1832(gp) # 80003110 <next_timeout>
80008214:	00078593          	mv	a1,a5
80008218:	00300513          	li	a0,3
8000821c:	c78fe06f          	j	80006694 <memp_free>

80008220 <sys_check_timeouts>:
80008220:	fe010113          	addi	sp,sp,-32
80008224:	00912a23          	sw	s1,20(sp)
80008228:	01312623          	sw	s3,12(sp)
8000822c:	01412423          	sw	s4,8(sp)
80008230:	00112e23          	sw	ra,28(sp)
80008234:	00812c23          	sw	s0,24(sp)
80008238:	01212823          	sw	s2,16(sp)
8000823c:	bf5fc0ef          	jal	ra,80004e30 <sys_now>
80008240:	00050993          	mv	s3,a0
80008244:	8d81a583          	lw	a1,-1832(gp) # 80003110 <next_timeout>
80008248:	02058e63          	beqz	a1,80008284 <sys_check_timeouts+0x64>
8000824c:	0045a783          	lw	a5,4(a1)
80008250:	40f98733          	sub	a4,s3,a5
80008254:	02074863          	bltz	a4,80008284 <sys_check_timeouts+0x64>
80008258:	0005a703          	lw	a4,0(a1)
8000825c:	0085a403          	lw	s0,8(a1)
80008260:	00300513          	li	a0,3
80008264:	8ce1ac23          	sw	a4,-1832(gp) # 80003110 <next_timeout>
80008268:	00c5a903          	lw	s2,12(a1)
8000826c:	8cf1aa23          	sw	a5,-1836(gp) # 8000310c <current_timeout_due_time>
80008270:	c24fe0ef          	jal	ra,80006694 <memp_free>
80008274:	fc0408e3          	beqz	s0,80008244 <sys_check_timeouts+0x24>
80008278:	00090513          	mv	a0,s2
8000827c:	000400e7          	jalr	s0
80008280:	fc5ff06f          	j	80008244 <sys_check_timeouts+0x24>
80008284:	01c12083          	lw	ra,28(sp)
80008288:	01812403          	lw	s0,24(sp)
8000828c:	01412483          	lw	s1,20(sp)
80008290:	01012903          	lw	s2,16(sp)
80008294:	00c12983          	lw	s3,12(sp)
80008298:	00812a03          	lw	s4,8(sp)
8000829c:	02010113          	addi	sp,sp,32
800082a0:	00008067          	ret

800082a4 <sys_restart_timeouts>:
800082a4:	ff010113          	addi	sp,sp,-16
800082a8:	00812423          	sw	s0,8(sp)
800082ac:	8d81a783          	lw	a5,-1832(gp) # 80003110 <next_timeout>
800082b0:	00112623          	sw	ra,12(sp)
800082b4:	02078463          	beqz	a5,800082dc <sys_restart_timeouts+0x38>
800082b8:	b79fc0ef          	jal	ra,80004e30 <sys_now>
800082bc:	8d81a783          	lw	a5,-1832(gp) # 80003110 <next_timeout>
800082c0:	0047a703          	lw	a4,4(a5)
800082c4:	40e50533          	sub	a0,a0,a4
800082c8:	0047a703          	lw	a4,4(a5)
800082cc:	00a70733          	add	a4,a4,a0
800082d0:	00e7a223          	sw	a4,4(a5)
800082d4:	0007a783          	lw	a5,0(a5)
800082d8:	fe0798e3          	bnez	a5,800082c8 <sys_restart_timeouts+0x24>
800082dc:	00c12083          	lw	ra,12(sp)
800082e0:	00812403          	lw	s0,8(sp)
800082e4:	01010113          	addi	sp,sp,16
800082e8:	00008067          	ret

800082ec <sys_timeouts_sleeptime>:
800082ec:	ff010113          	addi	sp,sp,-16
800082f0:	00812423          	sw	s0,8(sp)
800082f4:	8d81a783          	lw	a5,-1832(gp) # 80003110 <next_timeout>
800082f8:	00112623          	sw	ra,12(sp)
800082fc:	fff00513          	li	a0,-1
80008300:	00078e63          	beqz	a5,8000831c <sys_timeouts_sleeptime+0x30>
80008304:	b2dfc0ef          	jal	ra,80004e30 <sys_now>
80008308:	8d81a783          	lw	a5,-1832(gp) # 80003110 <next_timeout>
8000830c:	0047a783          	lw	a5,4(a5)
80008310:	40a78533          	sub	a0,a5,a0
80008314:	00055463          	bgez	a0,8000831c <sys_timeouts_sleeptime+0x30>
80008318:	00000513          	li	a0,0
8000831c:	00c12083          	lw	ra,12(sp)
80008320:	00812403          	lw	s0,8(sp)
80008324:	01010113          	addi	sp,sp,16
80008328:	00008067          	ret

8000832c <udp_init>:
8000832c:	00008067          	ret

80008330 <udp_input>:
80008330:	fd010113          	addi	sp,sp,-48
80008334:	02812423          	sw	s0,40(sp)
80008338:	02112623          	sw	ra,44(sp)
8000833c:	02912223          	sw	s1,36(sp)
80008340:	03212023          	sw	s2,32(sp)
80008344:	01312e23          	sw	s3,28(sp)
80008348:	01412c23          	sw	s4,24(sp)
8000834c:	01512a23          	sw	s5,20(sp)
80008350:	01612823          	sw	s6,16(sp)
80008354:	01712623          	sw	s7,12(sp)
80008358:	a0418793          	addi	a5,gp,-1532 # 8000323c <lwip_stats>
8000835c:	0f47a703          	lw	a4,244(a5)
80008360:	00170713          	addi	a4,a4,1
80008364:	0ee7aa23          	sw	a4,244(a5)
80008368:	00a55683          	lhu	a3,10(a0)
8000836c:	00700713          	li	a4,7
80008370:	04d76463          	bltu	a4,a3,800083b8 <udp_input+0x88>
80008374:	1047a703          	lw	a4,260(a5)
80008378:	00170713          	addi	a4,a4,1
8000837c:	10e7a223          	sw	a4,260(a5)
80008380:	0fc7a703          	lw	a4,252(a5)
80008384:	00170713          	addi	a4,a4,1
80008388:	0ee7ae23          	sw	a4,252(a5)
8000838c:	02812403          	lw	s0,40(sp)
80008390:	02c12083          	lw	ra,44(sp)
80008394:	02412483          	lw	s1,36(sp)
80008398:	02012903          	lw	s2,32(sp)
8000839c:	01c12983          	lw	s3,28(sp)
800083a0:	01812a03          	lw	s4,24(sp)
800083a4:	01412a83          	lw	s5,20(sp)
800083a8:	01012b03          	lw	s6,16(sp)
800083ac:	00c12b83          	lw	s7,12(sp)
800083b0:	03010113          	addi	sp,sp,48
800083b4:	b95fe06f          	j	80006f48 <pbuf_free>
800083b8:	9ec18913          	addi	s2,gp,-1556 # 80003224 <ip_data>
800083bc:	00452983          	lw	s3,4(a0)
800083c0:	00050493          	mv	s1,a0
800083c4:	00058b93          	mv	s7,a1
800083c8:	01492503          	lw	a0,20(s2)
800083cc:	00092583          	lw	a1,0(s2)
800083d0:	a0418413          	addi	s0,gp,-1532 # 8000323c <lwip_stats>
800083d4:	9ec18a13          	addi	s4,gp,-1556 # 80003224 <ip_data>
800083d8:	11c040ef          	jal	ra,8000c4f4 <ip4_addr_isbroadcast_u32>
800083dc:	0019c783          	lbu	a5,1(s3)
800083e0:	00050a93          	mv	s5,a0
800083e4:	0009c503          	lbu	a0,0(s3)
800083e8:	00879793          	slli	a5,a5,0x8
800083ec:	00a7e533          	or	a0,a5,a0
800083f0:	935fd0ef          	jal	ra,80005d24 <lwip_htons>
800083f4:	0039c783          	lbu	a5,3(s3)
800083f8:	00050b13          	mv	s6,a0
800083fc:	0029c503          	lbu	a0,2(s3)
80008400:	00879793          	slli	a5,a5,0x8
80008404:	00a7e533          	or	a0,a5,a0
80008408:	91dfd0ef          	jal	ra,80005d24 <lwip_htons>
8000840c:	8dc1a803          	lw	a6,-1828(gp) # 80003114 <udp_pcbs>
80008410:	00492303          	lw	t1,4(s2)
80008414:	01492683          	lw	a3,20(s2)
80008418:	01092e03          	lw	t3,16(s2)
8000841c:	00080793          	mv	a5,a6
80008420:	00000913          	li	s2,0
80008424:	00000593          	li	a1,0
80008428:	fff00893          	li	a7,-1
8000842c:	00079c63          	bnez	a5,80008444 <udp_input+0x114>
80008430:	0a091e63          	bnez	s2,800084ec <udp_input+0x1bc>
80008434:	004ba783          	lw	a5,4(s7)
80008438:	0ad78a63          	beq	a5,a3,800084ec <udp_input+0x1bc>
8000843c:	00048513          	mv	a0,s1
80008440:	f4dff06f          	j	8000838c <udp_input+0x5c>
80008444:	0167d703          	lhu	a4,22(a5)
80008448:	0ea71e63          	bne	a4,a0,80008544 <udp_input+0x214>
8000844c:	0087ce83          	lbu	t4,8(a5)
80008450:	000e8a63          	beqz	t4,80008464 <udp_input+0x134>
80008454:	03834703          	lbu	a4,56(t1)
80008458:	00170713          	addi	a4,a4,1
8000845c:	0ff77713          	andi	a4,a4,255
80008460:	0eee9263          	bne	t4,a4,80008544 <udp_input+0x214>
80008464:	0c0a8a63          	beqz	s5,80008538 <udp_input+0x208>
80008468:	0097c703          	lbu	a4,9(a5)
8000846c:	02077713          	andi	a4,a4,32
80008470:	0c070a63          	beqz	a4,80008544 <udp_input+0x214>
80008474:	0007a703          	lw	a4,0(a5)
80008478:	00070c63          	beqz	a4,80008490 <udp_input+0x160>
8000847c:	01168a63          	beq	a3,a7,80008490 <udp_input+0x160>
80008480:	008bae83          	lw	t4,8(s7)
80008484:	00d74733          	xor	a4,a4,a3
80008488:	01d77733          	and	a4,a4,t4
8000848c:	0a071c63          	bnez	a4,80008544 <udp_input+0x214>
80008490:	0147c703          	lbu	a4,20(a5)
80008494:	00477713          	andi	a4,a4,4
80008498:	02071463          	bnez	a4,800084c0 <udp_input+0x190>
8000849c:	02090063          	beqz	s2,800084bc <udp_input+0x18c>
800084a0:	020a8063          	beqz	s5,800084c0 <udp_input+0x190>
800084a4:	01169e63          	bne	a3,a7,800084c0 <udp_input+0x190>
800084a8:	004ba703          	lw	a4,4(s7)
800084ac:	00092e83          	lw	t4,0(s2)
800084b0:	00ee8863          	beq	t4,a4,800084c0 <udp_input+0x190>
800084b4:	0007ae83          	lw	t4,0(a5)
800084b8:	01d71463          	bne	a4,t4,800084c0 <udp_input+0x190>
800084bc:	00078913          	mv	s2,a5
800084c0:	0187d703          	lhu	a4,24(a5)
800084c4:	09671063          	bne	a4,s6,80008544 <udp_input+0x214>
800084c8:	0047a703          	lw	a4,4(a5)
800084cc:	00070463          	beqz	a4,800084d4 <udp_input+0x1a4>
800084d0:	07c71a63          	bne	a4,t3,80008544 <udp_input+0x214>
800084d4:	06058e63          	beqz	a1,80008550 <udp_input+0x220>
800084d8:	0107a703          	lw	a4,16(a5)
800084dc:	8cf1ae23          	sw	a5,-1828(gp) # 80003114 <udp_pcbs>
800084e0:	00e5a823          	sw	a4,16(a1)
800084e4:	0107a823          	sw	a6,16(a5)
800084e8:	00078913          	mv	s2,a5
800084ec:	0079c783          	lbu	a5,7(s3)
800084f0:	0069c703          	lbu	a4,6(s3)
800084f4:	00879793          	slli	a5,a5,0x8
800084f8:	00e7e7b3          	or	a5,a5,a4
800084fc:	06078263          	beqz	a5,80008560 <udp_input+0x230>
80008500:	0084d603          	lhu	a2,8(s1)
80008504:	a0018713          	addi	a4,gp,-1536 # 80003238 <ip_data+0x14>
80008508:	9fc18693          	addi	a3,gp,-1540 # 80003234 <ip_data+0x10>
8000850c:	01100593          	li	a1,17
80008510:	00048513          	mv	a0,s1
80008514:	c71fd0ef          	jal	ra,80006184 <ip_chksum_pseudo>
80008518:	04050463          	beqz	a0,80008560 <udp_input+0x230>
8000851c:	10042783          	lw	a5,256(s0)
80008520:	00178793          	addi	a5,a5,1
80008524:	10f42023          	sw	a5,256(s0)
80008528:	0fc42783          	lw	a5,252(s0)
8000852c:	00178793          	addi	a5,a5,1
80008530:	0ef42e23          	sw	a5,252(s0)
80008534:	f09ff06f          	j	8000843c <udp_input+0x10c>
80008538:	0007a703          	lw	a4,0(a5)
8000853c:	f4070ae3          	beqz	a4,80008490 <udp_input+0x160>
80008540:	f4d708e3          	beq	a4,a3,80008490 <udp_input+0x160>
80008544:	00078593          	mv	a1,a5
80008548:	0107a783          	lw	a5,16(a5)
8000854c:	ee1ff06f          	j	8000842c <udp_input+0xfc>
80008550:	11c42703          	lw	a4,284(s0)
80008554:	00170713          	addi	a4,a4,1
80008558:	10e42e23          	sw	a4,284(s0)
8000855c:	f8dff06f          	j	800084e8 <udp_input+0x1b8>
80008560:	00800593          	li	a1,8
80008564:	00048513          	mv	a0,s1
80008568:	959fe0ef          	jal	ra,80006ec0 <pbuf_remove_header>
8000856c:	fa051ee3          	bnez	a0,80008528 <udp_input+0x1f8>
80008570:	04090663          	beqz	s2,800085bc <udp_input+0x28c>
80008574:	01c92303          	lw	t1,28(s2)
80008578:	ec0302e3          	beqz	t1,8000843c <udp_input+0x10c>
8000857c:	02812403          	lw	s0,40(sp)
80008580:	02092503          	lw	a0,32(s2)
80008584:	02c12083          	lw	ra,44(sp)
80008588:	01c12983          	lw	s3,28(sp)
8000858c:	01812a03          	lw	s4,24(sp)
80008590:	01412a83          	lw	s5,20(sp)
80008594:	00c12b83          	lw	s7,12(sp)
80008598:	000b0713          	mv	a4,s6
8000859c:	00048613          	mv	a2,s1
800085a0:	01012b03          	lw	s6,16(sp)
800085a4:	02412483          	lw	s1,36(sp)
800085a8:	00090593          	mv	a1,s2
800085ac:	02012903          	lw	s2,32(sp)
800085b0:	9fc18693          	addi	a3,gp,-1540 # 80003234 <ip_data+0x10>
800085b4:	03010113          	addi	sp,sp,48
800085b8:	00030067          	jr	t1
800085bc:	020a9c63          	bnez	s5,800085f4 <udp_input+0x2c4>
800085c0:	014a2783          	lw	a5,20(s4)
800085c4:	0e000713          	li	a4,224
800085c8:	0f07f793          	andi	a5,a5,240
800085cc:	02e78463          	beq	a5,a4,800085f4 <udp_input+0x2c4>
800085d0:	00ca5583          	lhu	a1,12(s4)
800085d4:	00048513          	mv	a0,s1
800085d8:	00858593          	addi	a1,a1,8
800085dc:	01059593          	slli	a1,a1,0x10
800085e0:	4105d593          	srai	a1,a1,0x10
800085e4:	951fe0ef          	jal	ra,80006f34 <pbuf_header_force>
800085e8:	00300593          	li	a1,3
800085ec:	00048513          	mv	a0,s1
800085f0:	264030ef          	jal	ra,8000b854 <icmp_dest_unreach>
800085f4:	11042783          	lw	a5,272(s0)
800085f8:	00178793          	addi	a5,a5,1
800085fc:	10f42823          	sw	a5,272(s0)
80008600:	f29ff06f          	j	80008528 <udp_input+0x1f8>

80008604 <udp_bind>:
80008604:	00059463          	bnez	a1,8000860c <udp_bind+0x8>
80008608:	84818593          	addi	a1,gp,-1976 # 80003080 <ip_addr_any>
8000860c:	ff000793          	li	a5,-16
80008610:	0a050463          	beqz	a0,800086b8 <udp_bind+0xb4>
80008614:	8dc1a783          	lw	a5,-1828(gp) # 80003114 <udp_pcbs>
80008618:	00078693          	mv	a3,a5
8000861c:	06069063          	bnez	a3,8000867c <udp_bind+0x78>
80008620:	00000e13          	li	t3,0
80008624:	0c061463          	bnez	a2,800086ec <udp_bind+0xe8>
80008628:	800036b7          	lui	a3,0x80003
8000862c:	03c6d603          	lhu	a2,60(a3) # 8000303c <_heap_end+0xffff103c>
80008630:	00010337          	lui	t1,0x10
80008634:	00004837          	lui	a6,0x4
80008638:	fff30313          	addi	t1,t1,-1 # ffff <_stack_size+0xf7ff>
8000863c:	04660a63          	beq	a2,t1,80008690 <udp_bind+0x8c>
80008640:	00160613          	addi	a2,a2,1
80008644:	01061613          	slli	a2,a2,0x10
80008648:	01065613          	srli	a2,a2,0x10
8000864c:	00078893          	mv	a7,a5
80008650:	04089463          	bnez	a7,80008698 <udp_bind+0x94>
80008654:	02c69e23          	sh	a2,60(a3)
80008658:	0005a783          	lw	a5,0(a1)
8000865c:	00c51b23          	sh	a2,22(a0)
80008660:	00f52023          	sw	a5,0(a0)
80008664:	000e1863          	bnez	t3,80008674 <udp_bind+0x70>
80008668:	8dc1a783          	lw	a5,-1828(gp) # 80003114 <udp_pcbs>
8000866c:	8ca1ae23          	sw	a0,-1828(gp) # 80003114 <udp_pcbs>
80008670:	00f52823          	sw	a5,16(a0)
80008674:	00000793          	li	a5,0
80008678:	0400006f          	j	800086b8 <udp_bind+0xb4>
8000867c:	00a68663          	beq	a3,a0,80008688 <udp_bind+0x84>
80008680:	0106a683          	lw	a3,16(a3)
80008684:	f99ff06f          	j	8000861c <udp_bind+0x18>
80008688:	00100e13          	li	t3,1
8000868c:	f99ff06f          	j	80008624 <udp_bind+0x20>
80008690:	0000c637          	lui	a2,0xc
80008694:	fb9ff06f          	j	8000864c <udp_bind+0x48>
80008698:	0168de83          	lhu	t4,22(a7)
8000869c:	02ce9263          	bne	t4,a2,800086c0 <udp_bind+0xbc>
800086a0:	fff80813          	addi	a6,a6,-1 # 3fff <_stack_size+0x37ff>
800086a4:	01081813          	slli	a6,a6,0x10
800086a8:	01085813          	srli	a6,a6,0x10
800086ac:	f80818e3          	bnez	a6,8000863c <udp_bind+0x38>
800086b0:	02c69e23          	sh	a2,60(a3)
800086b4:	ff800793          	li	a5,-8
800086b8:	00078513          	mv	a0,a5
800086bc:	00008067          	ret
800086c0:	0108a883          	lw	a7,16(a7)
800086c4:	f8dff06f          	j	80008650 <udp_bind+0x4c>
800086c8:	02a78063          	beq	a5,a0,800086e8 <udp_bind+0xe4>
800086cc:	0167d683          	lhu	a3,22(a5)
800086d0:	00c69c63          	bne	a3,a2,800086e8 <udp_bind+0xe4>
800086d4:	0005a803          	lw	a6,0(a1)
800086d8:	0007a683          	lw	a3,0(a5)
800086dc:	fd068ce3          	beq	a3,a6,800086b4 <udp_bind+0xb0>
800086e0:	fc080ae3          	beqz	a6,800086b4 <udp_bind+0xb0>
800086e4:	fc0688e3          	beqz	a3,800086b4 <udp_bind+0xb0>
800086e8:	0107a783          	lw	a5,16(a5)
800086ec:	fc079ee3          	bnez	a5,800086c8 <udp_bind+0xc4>
800086f0:	f69ff06f          	j	80008658 <udp_bind+0x54>

800086f4 <udp_sendto_if_src>:
800086f4:	fd010113          	addi	sp,sp,-48
800086f8:	02912223          	sw	s1,36(sp)
800086fc:	02112623          	sw	ra,44(sp)
80008700:	02812423          	sw	s0,40(sp)
80008704:	03212023          	sw	s2,32(sp)
80008708:	01312e23          	sw	s3,28(sp)
8000870c:	01412c23          	sw	s4,24(sp)
80008710:	01512a23          	sw	s5,20(sp)
80008714:	01612823          	sw	s6,16(sp)
80008718:	01712623          	sw	s7,12(sp)
8000871c:	ff000493          	li	s1,-16
80008720:	08050263          	beqz	a0,800087a4 <udp_sendto_if_src+0xb0>
80008724:	08058063          	beqz	a1,800087a4 <udp_sendto_if_src+0xb0>
80008728:	06060e63          	beqz	a2,800087a4 <udp_sendto_if_src+0xb0>
8000872c:	06078c63          	beqz	a5,800087a4 <udp_sendto_if_src+0xb0>
80008730:	06070a63          	beqz	a4,800087a4 <udp_sendto_if_src+0xb0>
80008734:	00078b13          	mv	s6,a5
80008738:	00954783          	lbu	a5,9(a0)
8000873c:	00070a13          	mv	s4,a4
80008740:	00068b93          	mv	s7,a3
80008744:	0207f793          	andi	a5,a5,32
80008748:	00060a93          	mv	s5,a2
8000874c:	00058993          	mv	s3,a1
80008750:	00050413          	mv	s0,a0
80008754:	02078e63          	beqz	a5,80008790 <udp_sendto_if_src+0x9c>
80008758:	01645783          	lhu	a5,22(s0)
8000875c:	00079e63          	bnez	a5,80008778 <udp_sendto_if_src+0x84>
80008760:	00000613          	li	a2,0
80008764:	00040593          	mv	a1,s0
80008768:	00040513          	mv	a0,s0
8000876c:	e99ff0ef          	jal	ra,80008604 <udp_bind>
80008770:	00050493          	mv	s1,a0
80008774:	02051863          	bnez	a0,800087a4 <udp_sendto_if_src+0xb0>
80008778:	0089d703          	lhu	a4,8(s3)
8000877c:	000107b7          	lui	a5,0x10
80008780:	ff778793          	addi	a5,a5,-9 # fff7 <_stack_size+0xf7f7>
80008784:	04e7f863          	bgeu	a5,a4,800087d4 <udp_sendto_if_src+0xe0>
80008788:	fff00493          	li	s1,-1
8000878c:	0180006f          	j	800087a4 <udp_sendto_if_src+0xb0>
80008790:	00062503          	lw	a0,0(a2) # c000 <_stack_size+0xb800>
80008794:	00070593          	mv	a1,a4
80008798:	ffa00493          	li	s1,-6
8000879c:	559030ef          	jal	ra,8000c4f4 <ip4_addr_isbroadcast_u32>
800087a0:	fa050ce3          	beqz	a0,80008758 <udp_sendto_if_src+0x64>
800087a4:	02c12083          	lw	ra,44(sp)
800087a8:	02812403          	lw	s0,40(sp)
800087ac:	00048513          	mv	a0,s1
800087b0:	02012903          	lw	s2,32(sp)
800087b4:	02412483          	lw	s1,36(sp)
800087b8:	01c12983          	lw	s3,28(sp)
800087bc:	01812a03          	lw	s4,24(sp)
800087c0:	01412a83          	lw	s5,20(sp)
800087c4:	01012b03          	lw	s6,16(sp)
800087c8:	00c12b83          	lw	s7,12(sp)
800087cc:	03010113          	addi	sp,sp,48
800087d0:	00008067          	ret
800087d4:	00800593          	li	a1,8
800087d8:	00098513          	mv	a0,s3
800087dc:	ed4fe0ef          	jal	ra,80006eb0 <pbuf_add_header>
800087e0:	10050063          	beqz	a0,800088e0 <udp_sendto_if_src+0x1ec>
800087e4:	28000613          	li	a2,640
800087e8:	00800593          	li	a1,8
800087ec:	02400513          	li	a0,36
800087f0:	82dfe0ef          	jal	ra,8000701c <pbuf_alloc>
800087f4:	00050913          	mv	s2,a0
800087f8:	f80508e3          	beqz	a0,80008788 <udp_sendto_if_src+0x94>
800087fc:	0089d783          	lhu	a5,8(s3)
80008800:	00078663          	beqz	a5,8000880c <udp_sendto_if_src+0x118>
80008804:	00098593          	mv	a1,s3
80008808:	b99fe0ef          	jal	ra,800073a0 <pbuf_chain>
8000880c:	01645503          	lhu	a0,22(s0)
80008810:	00492483          	lw	s1,4(s2)
80008814:	d10fd0ef          	jal	ra,80005d24 <lwip_htons>
80008818:	00a48023          	sb	a0,0(s1)
8000881c:	00855513          	srli	a0,a0,0x8
80008820:	00a480a3          	sb	a0,1(s1)
80008824:	000b8513          	mv	a0,s7
80008828:	cfcfd0ef          	jal	ra,80005d24 <lwip_htons>
8000882c:	00a48123          	sb	a0,2(s1)
80008830:	00855513          	srli	a0,a0,0x8
80008834:	00a481a3          	sb	a0,3(s1)
80008838:	00048323          	sb	zero,6(s1)
8000883c:	000483a3          	sb	zero,7(s1)
80008840:	00895503          	lhu	a0,8(s2)
80008844:	ce0fd0ef          	jal	ra,80005d24 <lwip_htons>
80008848:	00a48223          	sb	a0,4(s1)
8000884c:	00855513          	srli	a0,a0,0x8
80008850:	00a482a3          	sb	a0,5(s1)
80008854:	01444783          	lbu	a5,20(s0)
80008858:	0017f793          	andi	a5,a5,1
8000885c:	02079a63          	bnez	a5,80008890 <udp_sendto_if_src+0x19c>
80008860:	00895603          	lhu	a2,8(s2)
80008864:	000a8713          	mv	a4,s5
80008868:	000b0693          	mv	a3,s6
8000886c:	01100593          	li	a1,17
80008870:	00090513          	mv	a0,s2
80008874:	911fd0ef          	jal	ra,80006184 <ip_chksum_pseudo>
80008878:	00051663          	bnez	a0,80008884 <udp_sendto_if_src+0x190>
8000887c:	00010537          	lui	a0,0x10
80008880:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xf7ff>
80008884:	00a48323          	sb	a0,6(s1)
80008888:	00855513          	srli	a0,a0,0x8
8000888c:	00a483a3          	sb	a0,7(s1)
80008890:	00c40793          	addi	a5,s0,12
80008894:	00b44683          	lbu	a3,11(s0)
80008898:	02fa2e23          	sw	a5,60(s4)
8000889c:	00a44703          	lbu	a4,10(s0)
800088a0:	000a0813          	mv	a6,s4
800088a4:	01100793          	li	a5,17
800088a8:	000a8613          	mv	a2,s5
800088ac:	000b0593          	mv	a1,s6
800088b0:	00090513          	mv	a0,s2
800088b4:	0d1030ef          	jal	ra,8000c184 <ip4_output_if_src>
800088b8:	020a2e23          	sw	zero,60(s4)
800088bc:	00050493          	mv	s1,a0
800088c0:	01390663          	beq	s2,s3,800088cc <udp_sendto_if_src+0x1d8>
800088c4:	00090513          	mv	a0,s2
800088c8:	e80fe0ef          	jal	ra,80006f48 <pbuf_free>
800088cc:	a0418793          	addi	a5,gp,-1532 # 8000323c <lwip_stats>
800088d0:	0f07a703          	lw	a4,240(a5)
800088d4:	00170713          	addi	a4,a4,1
800088d8:	0ee7a823          	sw	a4,240(a5)
800088dc:	ec9ff06f          	j	800087a4 <udp_sendto_if_src+0xb0>
800088e0:	00098913          	mv	s2,s3
800088e4:	f29ff06f          	j	8000880c <udp_sendto_if_src+0x118>

800088e8 <udp_sendto_if>:
800088e8:	02050e63          	beqz	a0,80008924 <udp_sendto_if+0x3c>
800088ec:	02058c63          	beqz	a1,80008924 <udp_sendto_if+0x3c>
800088f0:	02060a63          	beqz	a2,80008924 <udp_sendto_if+0x3c>
800088f4:	02070863          	beqz	a4,80008924 <udp_sendto_if+0x3c>
800088f8:	00052783          	lw	a5,0(a0)
800088fc:	00078863          	beqz	a5,8000890c <udp_sendto_if+0x24>
80008900:	0f07f813          	andi	a6,a5,240
80008904:	0e000893          	li	a7,224
80008908:	01181663          	bne	a6,a7,80008914 <udp_sendto_if+0x2c>
8000890c:	00470793          	addi	a5,a4,4
80008910:	de5ff06f          	j	800086f4 <udp_sendto_if_src>
80008914:	00472803          	lw	a6,4(a4)
80008918:	01079a63          	bne	a5,a6,8000892c <udp_sendto_if+0x44>
8000891c:	00050793          	mv	a5,a0
80008920:	ff1ff06f          	j	80008910 <udp_sendto_if+0x28>
80008924:	ff000513          	li	a0,-16
80008928:	00008067          	ret
8000892c:	ffc00513          	li	a0,-4
80008930:	00008067          	ret

80008934 <udp_sendto>:
80008934:	0a050863          	beqz	a0,800089e4 <udp_sendto+0xb0>
80008938:	0a058663          	beqz	a1,800089e4 <udp_sendto+0xb0>
8000893c:	0a060463          	beqz	a2,800089e4 <udp_sendto+0xb0>
80008940:	fe010113          	addi	sp,sp,-32
80008944:	00812c23          	sw	s0,24(sp)
80008948:	00912a23          	sw	s1,20(sp)
8000894c:	01212823          	sw	s2,16(sp)
80008950:	01312623          	sw	s3,12(sp)
80008954:	00112e23          	sw	ra,28(sp)
80008958:	00050413          	mv	s0,a0
8000895c:	00854503          	lbu	a0,8(a0)
80008960:	00068993          	mv	s3,a3
80008964:	00060493          	mv	s1,a2
80008968:	00058913          	mv	s2,a1
8000896c:	02050e63          	beqz	a0,800089a8 <udp_sendto+0x74>
80008970:	a9cfe0ef          	jal	ra,80006c0c <netif_get_by_index>
80008974:	04051063          	bnez	a0,800089b4 <udp_sendto+0x80>
80008978:	a0418793          	addi	a5,gp,-1532 # 8000323c <lwip_stats>
8000897c:	10c7a703          	lw	a4,268(a5)
80008980:	ffc00513          	li	a0,-4
80008984:	00170713          	addi	a4,a4,1
80008988:	10e7a623          	sw	a4,268(a5)
8000898c:	01c12083          	lw	ra,28(sp)
80008990:	01812403          	lw	s0,24(sp)
80008994:	01412483          	lw	s1,20(sp)
80008998:	01012903          	lw	s2,16(sp)
8000899c:	00c12983          	lw	s3,12(sp)
800089a0:	02010113          	addi	sp,sp,32
800089a4:	00008067          	ret
800089a8:	00060513          	mv	a0,a2
800089ac:	384030ef          	jal	ra,8000bd30 <ip4_route>
800089b0:	fc5ff06f          	j	80008974 <udp_sendto+0x40>
800089b4:	00050713          	mv	a4,a0
800089b8:	00040513          	mv	a0,s0
800089bc:	01812403          	lw	s0,24(sp)
800089c0:	01c12083          	lw	ra,28(sp)
800089c4:	00098693          	mv	a3,s3
800089c8:	00048613          	mv	a2,s1
800089cc:	00c12983          	lw	s3,12(sp)
800089d0:	01412483          	lw	s1,20(sp)
800089d4:	00090593          	mv	a1,s2
800089d8:	01012903          	lw	s2,16(sp)
800089dc:	02010113          	addi	sp,sp,32
800089e0:	f09ff06f          	j	800088e8 <udp_sendto_if>
800089e4:	ff000513          	li	a0,-16
800089e8:	00008067          	ret

800089ec <udp_send>:
800089ec:	00050a63          	beqz	a0,80008a00 <udp_send+0x14>
800089f0:	00058863          	beqz	a1,80008a00 <udp_send+0x14>
800089f4:	01855683          	lhu	a3,24(a0)
800089f8:	00450613          	addi	a2,a0,4
800089fc:	f39ff06f          	j	80008934 <udp_sendto>
80008a00:	ff000513          	li	a0,-16
80008a04:	00008067          	ret

80008a08 <udp_bind_netif>:
80008a08:	00000793          	li	a5,0
80008a0c:	00058863          	beqz	a1,80008a1c <udp_bind_netif+0x14>
80008a10:	0385c783          	lbu	a5,56(a1)
80008a14:	00178793          	addi	a5,a5,1
80008a18:	0ff7f793          	andi	a5,a5,255
80008a1c:	00f50423          	sb	a5,8(a0)
80008a20:	00008067          	ret

80008a24 <udp_connect>:
80008a24:	ff000793          	li	a5,-16
80008a28:	0a050063          	beqz	a0,80008ac8 <udp_connect+0xa4>
80008a2c:	08058e63          	beqz	a1,80008ac8 <udp_connect+0xa4>
80008a30:	ff010113          	addi	sp,sp,-16
80008a34:	00812423          	sw	s0,8(sp)
80008a38:	00912223          	sw	s1,4(sp)
80008a3c:	01212023          	sw	s2,0(sp)
80008a40:	00112623          	sw	ra,12(sp)
80008a44:	01655783          	lhu	a5,22(a0)
80008a48:	00050413          	mv	s0,a0
80008a4c:	00060913          	mv	s2,a2
80008a50:	00058493          	mv	s1,a1
80008a54:	02078c63          	beqz	a5,80008a8c <udp_connect+0x68>
80008a58:	0004a783          	lw	a5,0(s1)
80008a5c:	01241c23          	sh	s2,24(s0)
80008a60:	00f42223          	sw	a5,4(s0)
80008a64:	01444783          	lbu	a5,20(s0)
80008a68:	0047e793          	ori	a5,a5,4
80008a6c:	00f40a23          	sb	a5,20(s0)
80008a70:	8dc1a683          	lw	a3,-1828(gp) # 80003114 <udp_pcbs>
80008a74:	00068713          	mv	a4,a3
80008a78:	04071263          	bnez	a4,80008abc <udp_connect+0x98>
80008a7c:	00d42823          	sw	a3,16(s0)
80008a80:	8c81ae23          	sw	s0,-1828(gp) # 80003114 <udp_pcbs>
80008a84:	00000793          	li	a5,0
80008a88:	0180006f          	j	80008aa0 <udp_connect+0x7c>
80008a8c:	00000613          	li	a2,0
80008a90:	00050593          	mv	a1,a0
80008a94:	b71ff0ef          	jal	ra,80008604 <udp_bind>
80008a98:	00050793          	mv	a5,a0
80008a9c:	fa050ee3          	beqz	a0,80008a58 <udp_connect+0x34>
80008aa0:	00c12083          	lw	ra,12(sp)
80008aa4:	00812403          	lw	s0,8(sp)
80008aa8:	00412483          	lw	s1,4(sp)
80008aac:	00012903          	lw	s2,0(sp)
80008ab0:	00078513          	mv	a0,a5
80008ab4:	01010113          	addi	sp,sp,16
80008ab8:	00008067          	ret
80008abc:	fc8704e3          	beq	a4,s0,80008a84 <udp_connect+0x60>
80008ac0:	01072703          	lw	a4,16(a4)
80008ac4:	fb5ff06f          	j	80008a78 <udp_connect+0x54>
80008ac8:	00078513          	mv	a0,a5
80008acc:	00008067          	ret

80008ad0 <udp_disconnect>:
80008ad0:	00050e63          	beqz	a0,80008aec <udp_disconnect+0x1c>
80008ad4:	01454783          	lbu	a5,20(a0)
80008ad8:	00052223          	sw	zero,4(a0)
80008adc:	00051c23          	sh	zero,24(a0)
80008ae0:	ffb7f793          	andi	a5,a5,-5
80008ae4:	00050423          	sb	zero,8(a0)
80008ae8:	00f50a23          	sb	a5,20(a0)
80008aec:	00008067          	ret

80008af0 <udp_recv>:
80008af0:	00050663          	beqz	a0,80008afc <udp_recv+0xc>
80008af4:	00b52e23          	sw	a1,28(a0)
80008af8:	02c52023          	sw	a2,32(a0)
80008afc:	00008067          	ret

80008b00 <udp_remove>:
80008b00:	00050593          	mv	a1,a0
80008b04:	02050e63          	beqz	a0,80008b40 <udp_remove+0x40>
80008b08:	8dc1a783          	lw	a5,-1828(gp) # 80003114 <udp_pcbs>
80008b0c:	00a79c63          	bne	a5,a0,80008b24 <udp_remove+0x24>
80008b10:	01052783          	lw	a5,16(a0)
80008b14:	8cf1ae23          	sw	a5,-1828(gp) # 80003114 <udp_pcbs>
80008b18:	00100513          	li	a0,1
80008b1c:	b79fd06f          	j	80006694 <memp_free>
80008b20:	00070793          	mv	a5,a4
80008b24:	fe078ae3          	beqz	a5,80008b18 <udp_remove+0x18>
80008b28:	0107a703          	lw	a4,16(a5)
80008b2c:	fe0706e3          	beqz	a4,80008b18 <udp_remove+0x18>
80008b30:	feb718e3          	bne	a4,a1,80008b20 <udp_remove+0x20>
80008b34:	0105a703          	lw	a4,16(a1)
80008b38:	00e7a823          	sw	a4,16(a5)
80008b3c:	fddff06f          	j	80008b18 <udp_remove+0x18>
80008b40:	00008067          	ret

80008b44 <udp_new>:
80008b44:	800035b7          	lui	a1,0x80003
80008b48:	ff010113          	addi	sp,sp,-16
80008b4c:	4c800613          	li	a2,1224
80008b50:	cd458593          	addi	a1,a1,-812 # 80002cd4 <_heap_end+0xffff0cd4>
80008b54:	00100513          	li	a0,1
80008b58:	00812423          	sw	s0,8(sp)
80008b5c:	00112623          	sw	ra,12(sp)
80008b60:	afdfd0ef          	jal	ra,8000665c <memp_malloc_fn>
80008b64:	00050413          	mv	s0,a0
80008b68:	00050c63          	beqz	a0,80008b80 <udp_new+0x3c>
80008b6c:	02400613          	li	a2,36
80008b70:	00000593          	li	a1,0
80008b74:	038040ef          	jal	ra,8000cbac <memset>
80008b78:	fff00793          	li	a5,-1
80008b7c:	00f405a3          	sb	a5,11(s0)
80008b80:	00040513          	mv	a0,s0
80008b84:	00c12083          	lw	ra,12(sp)
80008b88:	00812403          	lw	s0,8(sp)
80008b8c:	01010113          	addi	sp,sp,16
80008b90:	00008067          	ret

80008b94 <udp_new_ip_type>:
80008b94:	fb1ff06f          	j	80008b44 <udp_new>

80008b98 <udp_netif_ip_addr_changed>:
80008b98:	02050063          	beqz	a0,80008bb8 <udp_netif_ip_addr_changed+0x20>
80008b9c:	00052783          	lw	a5,0(a0)
80008ba0:	00078c63          	beqz	a5,80008bb8 <udp_netif_ip_addr_changed+0x20>
80008ba4:	00058a63          	beqz	a1,80008bb8 <udp_netif_ip_addr_changed+0x20>
80008ba8:	0005a783          	lw	a5,0(a1)
80008bac:	00078663          	beqz	a5,80008bb8 <udp_netif_ip_addr_changed+0x20>
80008bb0:	8dc1a783          	lw	a5,-1828(gp) # 80003114 <udp_pcbs>
80008bb4:	00079463          	bnez	a5,80008bbc <udp_netif_ip_addr_changed+0x24>
80008bb8:	00008067          	ret
80008bbc:	0007a683          	lw	a3,0(a5)
80008bc0:	00052703          	lw	a4,0(a0)
80008bc4:	00e69663          	bne	a3,a4,80008bd0 <udp_netif_ip_addr_changed+0x38>
80008bc8:	0005a703          	lw	a4,0(a1)
80008bcc:	00e7a023          	sw	a4,0(a5)
80008bd0:	0107a783          	lw	a5,16(a5)
80008bd4:	fe1ff06f          	j	80008bb4 <udp_netif_ip_addr_changed+0x1c>

80008bd8 <dhcp_set_state>:
80008bd8:	00554783          	lbu	a5,5(a0)
80008bdc:	00b78863          	beq	a5,a1,80008bec <dhcp_set_state+0x14>
80008be0:	00b502a3          	sb	a1,5(a0)
80008be4:	00050323          	sb	zero,6(a0)
80008be8:	00051423          	sh	zero,8(a0)
80008bec:	00008067          	ret

80008bf0 <dhcp_option_short>:
80008bf0:	00a587b3          	add	a5,a1,a0
80008bf4:	00865713          	srli	a4,a2,0x8
80008bf8:	00e78023          	sb	a4,0(a5)
80008bfc:	00150793          	addi	a5,a0,1
80008c00:	01079793          	slli	a5,a5,0x10
80008c04:	0107d793          	srli	a5,a5,0x10
80008c08:	00250513          	addi	a0,a0,2
80008c0c:	00f585b3          	add	a1,a1,a5
80008c10:	01051513          	slli	a0,a0,0x10
80008c14:	00c58023          	sb	a2,0(a1)
80008c18:	01055513          	srli	a0,a0,0x10
80008c1c:	00008067          	ret

80008c20 <dhcp_option_long>:
80008c20:	00a587b3          	add	a5,a1,a0
80008c24:	01865713          	srli	a4,a2,0x18
80008c28:	00e78023          	sb	a4,0(a5)
80008c2c:	00150793          	addi	a5,a0,1
80008c30:	01079793          	slli	a5,a5,0x10
80008c34:	0107d793          	srli	a5,a5,0x10
80008c38:	00f587b3          	add	a5,a1,a5
80008c3c:	01065713          	srli	a4,a2,0x10
80008c40:	00e78023          	sb	a4,0(a5)
80008c44:	00250793          	addi	a5,a0,2
80008c48:	01079793          	slli	a5,a5,0x10
80008c4c:	0107d793          	srli	a5,a5,0x10
80008c50:	00f587b3          	add	a5,a1,a5
80008c54:	00865713          	srli	a4,a2,0x8
80008c58:	00e78023          	sb	a4,0(a5)
80008c5c:	00350793          	addi	a5,a0,3
80008c60:	01079793          	slli	a5,a5,0x10
80008c64:	0107d793          	srli	a5,a5,0x10
80008c68:	00450513          	addi	a0,a0,4
80008c6c:	00f585b3          	add	a1,a1,a5
80008c70:	01051513          	slli	a0,a0,0x10
80008c74:	00c58023          	sb	a2,0(a1)
80008c78:	01055513          	srli	a0,a0,0x10
80008c7c:	00008067          	ret

80008c80 <dhcp_create_msg>:
80008c80:	fe010113          	addi	sp,sp,-32
80008c84:	00112e23          	sw	ra,28(sp)
80008c88:	00812c23          	sw	s0,24(sp)
80008c8c:	00912a23          	sw	s1,20(sp)
80008c90:	01212823          	sw	s2,16(sp)
80008c94:	01312623          	sw	s3,12(sp)
80008c98:	01412423          	sw	s4,8(sp)
80008c9c:	01512223          	sw	s5,4(sp)
80008ca0:	01612023          	sw	s6,0(sp)
80008ca4:	02051a63          	bnez	a0,80008cd8 <dhcp_create_msg+0x58>
80008ca8:	00000a93          	li	s5,0
80008cac:	01c12083          	lw	ra,28(sp)
80008cb0:	01812403          	lw	s0,24(sp)
80008cb4:	000a8513          	mv	a0,s5
80008cb8:	01412483          	lw	s1,20(sp)
80008cbc:	01012903          	lw	s2,16(sp)
80008cc0:	00c12983          	lw	s3,12(sp)
80008cc4:	00812a03          	lw	s4,8(sp)
80008cc8:	00412a83          	lw	s5,4(sp)
80008ccc:	00012b03          	lw	s6,0(sp)
80008cd0:	02010113          	addi	sp,sp,32
80008cd4:	00008067          	ret
80008cd8:	fc0588e3          	beqz	a1,80008ca8 <dhcp_create_msg+0x28>
80008cdc:	00060913          	mv	s2,a2
80008ce0:	00058993          	mv	s3,a1
80008ce4:	00050493          	mv	s1,a0
80008ce8:	28000613          	li	a2,640
80008cec:	13400593          	li	a1,308
80008cf0:	03800513          	li	a0,56
80008cf4:	00068a13          	mv	s4,a3
80008cf8:	b24fe0ef          	jal	ra,8000701c <pbuf_alloc>
80008cfc:	00050a93          	mv	s5,a0
80008d00:	fa0504e3          	beqz	a0,80008ca8 <dhcp_create_msg+0x28>
80008d04:	00300793          	li	a5,3
80008d08:	00f91663          	bne	s2,a5,80008d14 <dhcp_create_msg+0x94>
80008d0c:	0059c783          	lbu	a5,5(s3)
80008d10:	03279063          	bne	a5,s2,80008d30 <dhcp_create_msg+0xb0>
80008d14:	0069c703          	lbu	a4,6(s3)
80008d18:	00071863          	bnez	a4,80008d28 <dhcp_create_msg+0xa8>
80008d1c:	8081a703          	lw	a4,-2040(gp) # 80003040 <xid.4812>
80008d20:	00170713          	addi	a4,a4,1
80008d24:	80e1a423          	sw	a4,-2040(gp) # 80003040 <xid.4812>
80008d28:	8081a783          	lw	a5,-2040(gp) # 80003040 <xid.4812>
80008d2c:	00f9a023          	sw	a5,0(s3)
80008d30:	004aa403          	lw	s0,4(s5)
80008d34:	13400613          	li	a2,308
80008d38:	00000593          	li	a1,0
80008d3c:	00100b13          	li	s6,1
80008d40:	00040513          	mv	a0,s0
80008d44:	669030ef          	jal	ra,8000cbac <memset>
80008d48:	01640023          	sb	s6,0(s0)
80008d4c:	016400a3          	sb	s6,1(s0)
80008d50:	0344c783          	lbu	a5,52(s1)
80008d54:	00f40123          	sb	a5,2(s0)
80008d58:	0009a503          	lw	a0,0(s3)
80008d5c:	fe1fc0ef          	jal	ra,80005d3c <lwip_htonl>
80008d60:	00855793          	srli	a5,a0,0x8
80008d64:	00a40223          	sb	a0,4(s0)
80008d68:	00f402a3          	sb	a5,5(s0)
80008d6c:	01055793          	srli	a5,a0,0x10
80008d70:	01855513          	srli	a0,a0,0x18
80008d74:	00f40323          	sb	a5,6(s0)
80008d78:	00a403a3          	sb	a0,7(s0)
80008d7c:	00400793          	li	a5,4
80008d80:	02f90463          	beq	s2,a5,80008da8 <dhcp_create_msg+0x128>
80008d84:	ff990793          	addi	a5,s2,-7
80008d88:	0ff7f793          	andi	a5,a5,255
80008d8c:	00fb7e63          	bgeu	s6,a5,80008da8 <dhcp_create_msg+0x128>
80008d90:	00300793          	li	a5,3
80008d94:	02f91a63          	bne	s2,a5,80008dc8 <dhcp_create_msg+0x148>
80008d98:	0059c783          	lbu	a5,5(s3)
80008d9c:	ffc78793          	addi	a5,a5,-4
80008da0:	0ff7f793          	andi	a5,a5,255
80008da4:	02fb6263          	bltu	s6,a5,80008dc8 <dhcp_create_msg+0x148>
80008da8:	0044a783          	lw	a5,4(s1)
80008dac:	0087d713          	srli	a4,a5,0x8
80008db0:	00f40623          	sb	a5,12(s0)
80008db4:	00e406a3          	sb	a4,13(s0)
80008db8:	0107d713          	srli	a4,a5,0x10
80008dbc:	0187d793          	srli	a5,a5,0x18
80008dc0:	00e40723          	sb	a4,14(s0)
80008dc4:	00f407a3          	sb	a5,15(s0)
80008dc8:	02e48793          	addi	a5,s1,46
80008dcc:	01c40713          	addi	a4,s0,28
80008dd0:	03448493          	addi	s1,s1,52
80008dd4:	0007c683          	lbu	a3,0(a5)
80008dd8:	00178793          	addi	a5,a5,1
80008ddc:	00170713          	addi	a4,a4,1
80008de0:	fed70fa3          	sb	a3,-1(a4)
80008de4:	fe9798e3          	bne	a5,s1,80008dd4 <dhcp_create_msg+0x154>
80008de8:	06300793          	li	a5,99
80008dec:	0ef40623          	sb	a5,236(s0)
80008df0:	f8200713          	li	a4,-126
80008df4:	0ef407a3          	sb	a5,239(s0)
80008df8:	03500793          	li	a5,53
80008dfc:	0ee406a3          	sb	a4,237(s0)
80008e00:	0ef40823          	sb	a5,240(s0)
80008e04:	05300713          	li	a4,83
80008e08:	00100793          	li	a5,1
80008e0c:	0ef408a3          	sb	a5,241(s0)
80008e10:	0ee40723          	sb	a4,238(s0)
80008e14:	0f240923          	sb	s2,242(s0)
80008e18:	00300793          	li	a5,3
80008e1c:	00fa1023          	sh	a5,0(s4)
80008e20:	e8dff06f          	j	80008cac <dhcp_create_msg+0x2c>

80008e24 <dhcp_option_trailer>:
80008e24:	00150793          	addi	a5,a0,1
80008e28:	01079793          	slli	a5,a5,0x10
80008e2c:	00a58733          	add	a4,a1,a0
80008e30:	0107d793          	srli	a5,a5,0x10
80008e34:	fff00693          	li	a3,-1
80008e38:	00d70023          	sb	a3,0(a4)
80008e3c:	00f585b3          	add	a1,a1,a5
80008e40:	04300713          	li	a4,67
80008e44:	00f77c63          	bgeu	a4,a5,80008e5c <dhcp_option_trailer+0x38>
80008e48:	0f078593          	addi	a1,a5,240
80008e4c:	01059593          	slli	a1,a1,0x10
80008e50:	0105d593          	srli	a1,a1,0x10
80008e54:	00060513          	mv	a0,a2
80008e58:	b94fe06f          	j	800071ec <pbuf_realloc>
80008e5c:	00178793          	addi	a5,a5,1
80008e60:	01079793          	slli	a5,a5,0x10
80008e64:	00058023          	sb	zero,0(a1)
80008e68:	0107d793          	srli	a5,a5,0x10
80008e6c:	00158593          	addi	a1,a1,1
80008e70:	fd5ff06f          	j	80008e44 <dhcp_option_trailer+0x20>

80008e74 <dhcp_reboot>:
80008e74:	fd010113          	addi	sp,sp,-48
80008e78:	02112623          	sw	ra,44(sp)
80008e7c:	02812423          	sw	s0,40(sp)
80008e80:	03212023          	sw	s2,32(sp)
80008e84:	02912223          	sw	s1,36(sp)
80008e88:	01312e23          	sw	s3,28(sp)
80008e8c:	01412c23          	sw	s4,24(sp)
80008e90:	02852483          	lw	s1,40(a0)
80008e94:	00050913          	mv	s2,a0
80008e98:	00300593          	li	a1,3
80008e9c:	00048513          	mv	a0,s1
80008ea0:	d39ff0ef          	jal	ra,80008bd8 <dhcp_set_state>
80008ea4:	00e10693          	addi	a3,sp,14
80008ea8:	00300613          	li	a2,3
80008eac:	00048593          	mv	a1,s1
80008eb0:	00090513          	mv	a0,s2
80008eb4:	dcdff0ef          	jal	ra,80008c80 <dhcp_create_msg>
80008eb8:	fff00413          	li	s0,-1
80008ebc:	14050663          	beqz	a0,80009008 <dhcp_reboot+0x194>
80008ec0:	00452403          	lw	s0,4(a0)
80008ec4:	00e15783          	lhu	a5,14(sp)
80008ec8:	00050993          	mv	s3,a0
80008ecc:	0f040413          	addi	s0,s0,240
80008ed0:	00f40733          	add	a4,s0,a5
80008ed4:	00278513          	addi	a0,a5,2
80008ed8:	00178793          	addi	a5,a5,1
80008edc:	01079793          	slli	a5,a5,0x10
80008ee0:	03900693          	li	a3,57
80008ee4:	0107d793          	srli	a5,a5,0x10
80008ee8:	00d70023          	sb	a3,0(a4)
80008eec:	00f407b3          	add	a5,s0,a5
80008ef0:	00200713          	li	a4,2
80008ef4:	01051513          	slli	a0,a0,0x10
80008ef8:	00e78023          	sb	a4,0(a5)
80008efc:	00040593          	mv	a1,s0
80008f00:	24000613          	li	a2,576
80008f04:	01055513          	srli	a0,a0,0x10
80008f08:	00a11723          	sh	a0,14(sp)
80008f0c:	ce5ff0ef          	jal	ra,80008bf0 <dhcp_option_short>
80008f10:	00a407b3          	add	a5,s0,a0
80008f14:	00250a13          	addi	s4,a0,2
80008f18:	00150513          	addi	a0,a0,1
80008f1c:	01051513          	slli	a0,a0,0x10
80008f20:	03200713          	li	a4,50
80008f24:	01055513          	srli	a0,a0,0x10
80008f28:	00e78023          	sb	a4,0(a5)
80008f2c:	00a40533          	add	a0,s0,a0
80008f30:	00400793          	li	a5,4
80008f34:	00f50023          	sb	a5,0(a0)
80008f38:	01c4a503          	lw	a0,28(s1)
80008f3c:	010a1a13          	slli	s4,s4,0x10
80008f40:	010a5a13          	srli	s4,s4,0x10
80008f44:	01411723          	sh	s4,14(sp)
80008f48:	df5fc0ef          	jal	ra,80005d3c <lwip_htonl>
80008f4c:	00050613          	mv	a2,a0
80008f50:	00040593          	mv	a1,s0
80008f54:	000a0513          	mv	a0,s4
80008f58:	cc9ff0ef          	jal	ra,80008c20 <dhcp_option_long>
80008f5c:	00a40733          	add	a4,s0,a0
80008f60:	03700693          	li	a3,55
80008f64:	00d70023          	sb	a3,0(a4)
80008f68:	00150713          	addi	a4,a0,1
80008f6c:	01071713          	slli	a4,a4,0x10
80008f70:	01075713          	srli	a4,a4,0x10
80008f74:	00300693          	li	a3,3
80008f78:	00e40733          	add	a4,s0,a4
80008f7c:	00d70023          	sb	a3,0(a4)
80008f80:	00250713          	addi	a4,a0,2
80008f84:	01071713          	slli	a4,a4,0x10
80008f88:	01075713          	srli	a4,a4,0x10
80008f8c:	00e40733          	add	a4,s0,a4
80008f90:	00100613          	li	a2,1
80008f94:	00c70023          	sb	a2,0(a4)
80008f98:	00050793          	mv	a5,a0
80008f9c:	00350713          	addi	a4,a0,3
80008fa0:	01071713          	slli	a4,a4,0x10
80008fa4:	00478793          	addi	a5,a5,4
80008fa8:	01075713          	srli	a4,a4,0x10
80008fac:	01079793          	slli	a5,a5,0x10
80008fb0:	00e40733          	add	a4,s0,a4
80008fb4:	00550513          	addi	a0,a0,5
80008fb8:	0107d793          	srli	a5,a5,0x10
80008fbc:	00d70023          	sb	a3,0(a4)
80008fc0:	00f407b3          	add	a5,s0,a5
80008fc4:	01c00713          	li	a4,28
80008fc8:	01051513          	slli	a0,a0,0x10
80008fcc:	00e78023          	sb	a4,0(a5)
80008fd0:	01055513          	srli	a0,a0,0x10
80008fd4:	00040593          	mv	a1,s0
80008fd8:	00098613          	mv	a2,s3
80008fdc:	00a11723          	sh	a0,14(sp)
80008fe0:	e45ff0ef          	jal	ra,80008e24 <dhcp_option_trailer>
80008fe4:	8e41a503          	lw	a0,-1820(gp) # 8000311c <dhcp_pcb>
80008fe8:	00090713          	mv	a4,s2
80008fec:	04300693          	li	a3,67
80008ff0:	84418613          	addi	a2,gp,-1980 # 8000307c <ip_addr_broadcast>
80008ff4:	00098593          	mv	a1,s3
80008ff8:	8f1ff0ef          	jal	ra,800088e8 <udp_sendto_if>
80008ffc:	00050413          	mv	s0,a0
80009000:	00098513          	mv	a0,s3
80009004:	f45fd0ef          	jal	ra,80006f48 <pbuf_free>
80009008:	0064c783          	lbu	a5,6(s1)
8000900c:	0ff00713          	li	a4,255
80009010:	00e78663          	beq	a5,a4,8000901c <dhcp_reboot+0x1a8>
80009014:	00178793          	addi	a5,a5,1
80009018:	00f48323          	sb	a5,6(s1)
8000901c:	0064c503          	lbu	a0,6(s1)
80009020:	00900793          	li	a5,9
80009024:	04a7ea63          	bltu	a5,a0,80009078 <dhcp_reboot+0x204>
80009028:	00551793          	slli	a5,a0,0x5
8000902c:	40a787b3          	sub	a5,a5,a0
80009030:	00279793          	slli	a5,a5,0x2
80009034:	00f50533          	add	a0,a0,a5
80009038:	00351513          	slli	a0,a0,0x3
8000903c:	01051513          	slli	a0,a0,0x10
80009040:	01055513          	srli	a0,a0,0x10
80009044:	1f400593          	li	a1,500
80009048:	1f350513          	addi	a0,a0,499
8000904c:	268040ef          	jal	ra,8000d2b4 <__divsi3>
80009050:	00a49423          	sh	a0,8(s1)
80009054:	02c12083          	lw	ra,44(sp)
80009058:	00040513          	mv	a0,s0
8000905c:	02812403          	lw	s0,40(sp)
80009060:	02412483          	lw	s1,36(sp)
80009064:	02012903          	lw	s2,32(sp)
80009068:	01c12983          	lw	s3,28(sp)
8000906c:	01812a03          	lw	s4,24(sp)
80009070:	03010113          	addi	sp,sp,48
80009074:	00008067          	ret
80009078:	00002537          	lui	a0,0x2
8000907c:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
80009080:	fc5ff06f          	j	80009044 <dhcp_reboot+0x1d0>

80009084 <dhcp_select>:
80009084:	fd010113          	addi	sp,sp,-48
80009088:	02812423          	sw	s0,40(sp)
8000908c:	02112623          	sw	ra,44(sp)
80009090:	02912223          	sw	s1,36(sp)
80009094:	03212023          	sw	s2,32(sp)
80009098:	01312e23          	sw	s3,28(sp)
8000909c:	01412c23          	sw	s4,24(sp)
800090a0:	01512a23          	sw	s5,20(sp)
800090a4:	ff000413          	li	s0,-16
800090a8:	22050263          	beqz	a0,800092cc <dhcp_select+0x248>
800090ac:	02852483          	lw	s1,40(a0)
800090b0:	ffa00413          	li	s0,-6
800090b4:	20048c63          	beqz	s1,800092cc <dhcp_select+0x248>
800090b8:	00050913          	mv	s2,a0
800090bc:	00100593          	li	a1,1
800090c0:	00048513          	mv	a0,s1
800090c4:	b15ff0ef          	jal	ra,80008bd8 <dhcp_set_state>
800090c8:	00e10693          	addi	a3,sp,14
800090cc:	00300613          	li	a2,3
800090d0:	00048593          	mv	a1,s1
800090d4:	00090513          	mv	a0,s2
800090d8:	ba9ff0ef          	jal	ra,80008c80 <dhcp_create_msg>
800090dc:	00050993          	mv	s3,a0
800090e0:	fff00413          	li	s0,-1
800090e4:	18050a63          	beqz	a0,80009278 <dhcp_select+0x1f4>
800090e8:	00452403          	lw	s0,4(a0)
800090ec:	00e15783          	lhu	a5,14(sp)
800090f0:	03900693          	li	a3,57
800090f4:	0f040413          	addi	s0,s0,240
800090f8:	00f40733          	add	a4,s0,a5
800090fc:	00278513          	addi	a0,a5,2
80009100:	00178793          	addi	a5,a5,1
80009104:	01079793          	slli	a5,a5,0x10
80009108:	0107d793          	srli	a5,a5,0x10
8000910c:	00d70023          	sb	a3,0(a4)
80009110:	00f407b3          	add	a5,s0,a5
80009114:	00200713          	li	a4,2
80009118:	00e78023          	sb	a4,0(a5)
8000911c:	02c95603          	lhu	a2,44(s2)
80009120:	01051513          	slli	a0,a0,0x10
80009124:	00040593          	mv	a1,s0
80009128:	01055513          	srli	a0,a0,0x10
8000912c:	00a11723          	sh	a0,14(sp)
80009130:	ac1ff0ef          	jal	ra,80008bf0 <dhcp_option_short>
80009134:	00a407b3          	add	a5,s0,a0
80009138:	03200713          	li	a4,50
8000913c:	00e78023          	sb	a4,0(a5)
80009140:	00150793          	addi	a5,a0,1
80009144:	01079793          	slli	a5,a5,0x10
80009148:	0107d793          	srli	a5,a5,0x10
8000914c:	00f407b3          	add	a5,s0,a5
80009150:	00400a93          	li	s5,4
80009154:	01578023          	sb	s5,0(a5)
80009158:	00250a13          	addi	s4,a0,2
8000915c:	01c4a503          	lw	a0,28(s1)
80009160:	010a1a13          	slli	s4,s4,0x10
80009164:	010a5a13          	srli	s4,s4,0x10
80009168:	01411723          	sh	s4,14(sp)
8000916c:	bd1fc0ef          	jal	ra,80005d3c <lwip_htonl>
80009170:	00050613          	mv	a2,a0
80009174:	00040593          	mv	a1,s0
80009178:	000a0513          	mv	a0,s4
8000917c:	aa5ff0ef          	jal	ra,80008c20 <dhcp_option_long>
80009180:	00a407b3          	add	a5,s0,a0
80009184:	03600713          	li	a4,54
80009188:	00e78023          	sb	a4,0(a5)
8000918c:	00150793          	addi	a5,a0,1
80009190:	01079793          	slli	a5,a5,0x10
80009194:	0107d793          	srli	a5,a5,0x10
80009198:	00f407b3          	add	a5,s0,a5
8000919c:	01578023          	sb	s5,0(a5)
800091a0:	00250a13          	addi	s4,a0,2
800091a4:	0184a503          	lw	a0,24(s1)
800091a8:	010a1a13          	slli	s4,s4,0x10
800091ac:	010a5a13          	srli	s4,s4,0x10
800091b0:	01411723          	sh	s4,14(sp)
800091b4:	b89fc0ef          	jal	ra,80005d3c <lwip_htonl>
800091b8:	00050613          	mv	a2,a0
800091bc:	00040593          	mv	a1,s0
800091c0:	000a0513          	mv	a0,s4
800091c4:	a5dff0ef          	jal	ra,80008c20 <dhcp_option_long>
800091c8:	00a40733          	add	a4,s0,a0
800091cc:	03700693          	li	a3,55
800091d0:	00d70023          	sb	a3,0(a4)
800091d4:	00150713          	addi	a4,a0,1
800091d8:	01071713          	slli	a4,a4,0x10
800091dc:	01075713          	srli	a4,a4,0x10
800091e0:	00300693          	li	a3,3
800091e4:	00e40733          	add	a4,s0,a4
800091e8:	00d70023          	sb	a3,0(a4)
800091ec:	00250713          	addi	a4,a0,2
800091f0:	01071713          	slli	a4,a4,0x10
800091f4:	01075713          	srli	a4,a4,0x10
800091f8:	00e40733          	add	a4,s0,a4
800091fc:	00100613          	li	a2,1
80009200:	00c70023          	sb	a2,0(a4)
80009204:	00050793          	mv	a5,a0
80009208:	00350713          	addi	a4,a0,3
8000920c:	01071713          	slli	a4,a4,0x10
80009210:	00478793          	addi	a5,a5,4
80009214:	01075713          	srli	a4,a4,0x10
80009218:	01079793          	slli	a5,a5,0x10
8000921c:	00e40733          	add	a4,s0,a4
80009220:	00550513          	addi	a0,a0,5
80009224:	0107d793          	srli	a5,a5,0x10
80009228:	00d70023          	sb	a3,0(a4)
8000922c:	00f407b3          	add	a5,s0,a5
80009230:	01c00713          	li	a4,28
80009234:	01051513          	slli	a0,a0,0x10
80009238:	00e78023          	sb	a4,0(a5)
8000923c:	01055513          	srli	a0,a0,0x10
80009240:	00040593          	mv	a1,s0
80009244:	00098613          	mv	a2,s3
80009248:	00a11723          	sh	a0,14(sp)
8000924c:	bd9ff0ef          	jal	ra,80008e24 <dhcp_option_trailer>
80009250:	8e41a503          	lw	a0,-1820(gp) # 8000311c <dhcp_pcb>
80009254:	84818793          	addi	a5,gp,-1976 # 80003080 <ip_addr_any>
80009258:	00090713          	mv	a4,s2
8000925c:	04300693          	li	a3,67
80009260:	84418613          	addi	a2,gp,-1980 # 8000307c <ip_addr_broadcast>
80009264:	00098593          	mv	a1,s3
80009268:	c8cff0ef          	jal	ra,800086f4 <udp_sendto_if_src>
8000926c:	00050413          	mv	s0,a0
80009270:	00098513          	mv	a0,s3
80009274:	cd5fd0ef          	jal	ra,80006f48 <pbuf_free>
80009278:	0064c783          	lbu	a5,6(s1)
8000927c:	0ff00713          	li	a4,255
80009280:	00e78663          	beq	a5,a4,8000928c <dhcp_select+0x208>
80009284:	00178793          	addi	a5,a5,1
80009288:	00f48323          	sb	a5,6(s1)
8000928c:	0064c783          	lbu	a5,6(s1)
80009290:	00500713          	li	a4,5
80009294:	06f76063          	bltu	a4,a5,800092f4 <dhcp_select+0x270>
80009298:	00100513          	li	a0,1
8000929c:	00f51533          	sll	a0,a0,a5
800092a0:	00551793          	slli	a5,a0,0x5
800092a4:	40a787b3          	sub	a5,a5,a0
800092a8:	00279793          	slli	a5,a5,0x2
800092ac:	00f50533          	add	a0,a0,a5
800092b0:	00351513          	slli	a0,a0,0x3
800092b4:	01051513          	slli	a0,a0,0x10
800092b8:	01055513          	srli	a0,a0,0x10
800092bc:	1f400593          	li	a1,500
800092c0:	1f350513          	addi	a0,a0,499
800092c4:	7f1030ef          	jal	ra,8000d2b4 <__divsi3>
800092c8:	00a49423          	sh	a0,8(s1)
800092cc:	00040513          	mv	a0,s0
800092d0:	02c12083          	lw	ra,44(sp)
800092d4:	02812403          	lw	s0,40(sp)
800092d8:	02412483          	lw	s1,36(sp)
800092dc:	02012903          	lw	s2,32(sp)
800092e0:	01c12983          	lw	s3,28(sp)
800092e4:	01812a03          	lw	s4,24(sp)
800092e8:	01412a83          	lw	s5,20(sp)
800092ec:	03010113          	addi	sp,sp,48
800092f0:	00008067          	ret
800092f4:	0000f537          	lui	a0,0xf
800092f8:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
800092fc:	fc1ff06f          	j	800092bc <dhcp_select+0x238>

80009300 <dhcp_discover>:
80009300:	fd010113          	addi	sp,sp,-48
80009304:	01312e23          	sw	s3,28(sp)
80009308:	02112623          	sw	ra,44(sp)
8000930c:	02812423          	sw	s0,40(sp)
80009310:	02912223          	sw	s1,36(sp)
80009314:	03212023          	sw	s2,32(sp)
80009318:	02852483          	lw	s1,40(a0)
8000931c:	00050993          	mv	s3,a0
80009320:	00600593          	li	a1,6
80009324:	00048513          	mv	a0,s1
80009328:	0004ae23          	sw	zero,28(s1)
8000932c:	8adff0ef          	jal	ra,80008bd8 <dhcp_set_state>
80009330:	00e10693          	addi	a3,sp,14
80009334:	00100613          	li	a2,1
80009338:	00048593          	mv	a1,s1
8000933c:	00098513          	mv	a0,s3
80009340:	941ff0ef          	jal	ra,80008c80 <dhcp_create_msg>
80009344:	10050063          	beqz	a0,80009444 <dhcp_discover+0x144>
80009348:	00452403          	lw	s0,4(a0)
8000934c:	00e15783          	lhu	a5,14(sp)
80009350:	00050913          	mv	s2,a0
80009354:	0f040413          	addi	s0,s0,240
80009358:	00f40733          	add	a4,s0,a5
8000935c:	00278513          	addi	a0,a5,2
80009360:	00178793          	addi	a5,a5,1
80009364:	01079793          	slli	a5,a5,0x10
80009368:	03900693          	li	a3,57
8000936c:	0107d793          	srli	a5,a5,0x10
80009370:	00d70023          	sb	a3,0(a4)
80009374:	00f407b3          	add	a5,s0,a5
80009378:	00200713          	li	a4,2
8000937c:	00e78023          	sb	a4,0(a5)
80009380:	02c9d603          	lhu	a2,44(s3)
80009384:	01051513          	slli	a0,a0,0x10
80009388:	01055513          	srli	a0,a0,0x10
8000938c:	00040593          	mv	a1,s0
80009390:	00a11723          	sh	a0,14(sp)
80009394:	85dff0ef          	jal	ra,80008bf0 <dhcp_option_short>
80009398:	00a40733          	add	a4,s0,a0
8000939c:	03700693          	li	a3,55
800093a0:	00d70023          	sb	a3,0(a4)
800093a4:	00150713          	addi	a4,a0,1
800093a8:	01071713          	slli	a4,a4,0x10
800093ac:	01075713          	srli	a4,a4,0x10
800093b0:	00300613          	li	a2,3
800093b4:	00e40733          	add	a4,s0,a4
800093b8:	00c70023          	sb	a2,0(a4)
800093bc:	00250713          	addi	a4,a0,2
800093c0:	01071713          	slli	a4,a4,0x10
800093c4:	01075713          	srli	a4,a4,0x10
800093c8:	00e40733          	add	a4,s0,a4
800093cc:	00100693          	li	a3,1
800093d0:	00d70023          	sb	a3,0(a4)
800093d4:	00050793          	mv	a5,a0
800093d8:	00350693          	addi	a3,a0,3
800093dc:	01069693          	slli	a3,a3,0x10
800093e0:	00478793          	addi	a5,a5,4
800093e4:	0106d693          	srli	a3,a3,0x10
800093e8:	01079793          	slli	a5,a5,0x10
800093ec:	00d406b3          	add	a3,s0,a3
800093f0:	00550513          	addi	a0,a0,5
800093f4:	0107d793          	srli	a5,a5,0x10
800093f8:	00c68023          	sb	a2,0(a3)
800093fc:	00f407b3          	add	a5,s0,a5
80009400:	01c00713          	li	a4,28
80009404:	01051513          	slli	a0,a0,0x10
80009408:	00e78023          	sb	a4,0(a5)
8000940c:	01055513          	srli	a0,a0,0x10
80009410:	00090613          	mv	a2,s2
80009414:	00040593          	mv	a1,s0
80009418:	00a11723          	sh	a0,14(sp)
8000941c:	a09ff0ef          	jal	ra,80008e24 <dhcp_option_trailer>
80009420:	8e41a503          	lw	a0,-1820(gp) # 8000311c <dhcp_pcb>
80009424:	84818793          	addi	a5,gp,-1976 # 80003080 <ip_addr_any>
80009428:	00098713          	mv	a4,s3
8000942c:	04300693          	li	a3,67
80009430:	84418613          	addi	a2,gp,-1980 # 8000307c <ip_addr_broadcast>
80009434:	00090593          	mv	a1,s2
80009438:	abcff0ef          	jal	ra,800086f4 <udp_sendto_if_src>
8000943c:	00090513          	mv	a0,s2
80009440:	b09fd0ef          	jal	ra,80006f48 <pbuf_free>
80009444:	0064c783          	lbu	a5,6(s1)
80009448:	0ff00713          	li	a4,255
8000944c:	00e78663          	beq	a5,a4,80009458 <dhcp_discover+0x158>
80009450:	00178793          	addi	a5,a5,1
80009454:	00f48323          	sb	a5,6(s1)
80009458:	0064c783          	lbu	a5,6(s1)
8000945c:	00500713          	li	a4,5
80009460:	04f76c63          	bltu	a4,a5,800094b8 <dhcp_discover+0x1b8>
80009464:	00100513          	li	a0,1
80009468:	00f51533          	sll	a0,a0,a5
8000946c:	00551793          	slli	a5,a0,0x5
80009470:	40a787b3          	sub	a5,a5,a0
80009474:	00279793          	slli	a5,a5,0x2
80009478:	00f50533          	add	a0,a0,a5
8000947c:	00351513          	slli	a0,a0,0x3
80009480:	01051513          	slli	a0,a0,0x10
80009484:	01055513          	srli	a0,a0,0x10
80009488:	1f400593          	li	a1,500
8000948c:	1f350513          	addi	a0,a0,499
80009490:	625030ef          	jal	ra,8000d2b4 <__divsi3>
80009494:	00a49423          	sh	a0,8(s1)
80009498:	02c12083          	lw	ra,44(sp)
8000949c:	02812403          	lw	s0,40(sp)
800094a0:	02412483          	lw	s1,36(sp)
800094a4:	02012903          	lw	s2,32(sp)
800094a8:	01c12983          	lw	s3,28(sp)
800094ac:	00000513          	li	a0,0
800094b0:	03010113          	addi	sp,sp,48
800094b4:	00008067          	ret
800094b8:	0000f537          	lui	a0,0xf
800094bc:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
800094c0:	fc9ff06f          	j	80009488 <dhcp_discover+0x188>

800094c4 <dhcp_check>:
800094c4:	ff010113          	addi	sp,sp,-16
800094c8:	00112623          	sw	ra,12(sp)
800094cc:	00912223          	sw	s1,4(sp)
800094d0:	00812423          	sw	s0,8(sp)
800094d4:	02852403          	lw	s0,40(a0)
800094d8:	00050493          	mv	s1,a0
800094dc:	00800593          	li	a1,8
800094e0:	00040513          	mv	a0,s0
800094e4:	ef4ff0ef          	jal	ra,80008bd8 <dhcp_set_state>
800094e8:	00000613          	li	a2,0
800094ec:	01c40593          	addi	a1,s0,28
800094f0:	00048513          	mv	a0,s1
800094f4:	4b5010ef          	jal	ra,8000b1a8 <etharp_query>
800094f8:	00644783          	lbu	a5,6(s0)
800094fc:	0ff00713          	li	a4,255
80009500:	00e78663          	beq	a5,a4,8000950c <dhcp_check+0x48>
80009504:	00178793          	addi	a5,a5,1
80009508:	00f40323          	sb	a5,6(s0)
8000950c:	00100793          	li	a5,1
80009510:	00f41423          	sh	a5,8(s0)
80009514:	00c12083          	lw	ra,12(sp)
80009518:	00812403          	lw	s0,8(sp)
8000951c:	00412483          	lw	s1,4(sp)
80009520:	01010113          	addi	sp,sp,16
80009524:	00008067          	ret

80009528 <dhcp_bind>:
80009528:	1a050863          	beqz	a0,800096d8 <dhcp_bind+0x1b0>
8000952c:	fe010113          	addi	sp,sp,-32
80009530:	00112e23          	sw	ra,28(sp)
80009534:	00812c23          	sw	s0,24(sp)
80009538:	00912a23          	sw	s1,20(sp)
8000953c:	02852403          	lw	s0,40(a0)
80009540:	10040a63          	beqz	s0,80009654 <dhcp_bind+0x12c>
80009544:	00050493          	mv	s1,a0
80009548:	02842503          	lw	a0,40(s0)
8000954c:	00041923          	sh	zero,18(s0)
80009550:	fff00793          	li	a5,-1
80009554:	02f50463          	beq	a0,a5,8000957c <dhcp_bind+0x54>
80009558:	01e50513          	addi	a0,a0,30
8000955c:	003c07b7          	lui	a5,0x3c0
80009560:	10f57463          	bgeu	a0,a5,80009668 <dhcp_bind+0x140>
80009564:	03c00593          	li	a1,60
80009568:	555030ef          	jal	ra,8000d2bc <__udivsi3>
8000956c:	01051793          	slli	a5,a0,0x10
80009570:	0107d793          	srli	a5,a5,0x10
80009574:	10050063          	beqz	a0,80009674 <dhcp_bind+0x14c>
80009578:	00f41a23          	sh	a5,20(s0)
8000957c:	02c42503          	lw	a0,44(s0)
80009580:	fff00793          	li	a5,-1
80009584:	02f50863          	beq	a0,a5,800095b4 <dhcp_bind+0x8c>
80009588:	01e50513          	addi	a0,a0,30
8000958c:	003c07b7          	lui	a5,0x3c0
80009590:	0ef57663          	bgeu	a0,a5,8000967c <dhcp_bind+0x154>
80009594:	03c00593          	li	a1,60
80009598:	525030ef          	jal	ra,8000d2bc <__udivsi3>
8000959c:	01051793          	slli	a5,a0,0x10
800095a0:	0107d793          	srli	a5,a5,0x10
800095a4:	0e050263          	beqz	a0,80009688 <dhcp_bind+0x160>
800095a8:	00f41523          	sh	a5,10(s0)
800095ac:	00a45783          	lhu	a5,10(s0)
800095b0:	00f41723          	sh	a5,14(s0)
800095b4:	03042503          	lw	a0,48(s0)
800095b8:	fff00793          	li	a5,-1
800095bc:	02f50863          	beq	a0,a5,800095ec <dhcp_bind+0xc4>
800095c0:	01e50513          	addi	a0,a0,30
800095c4:	003c07b7          	lui	a5,0x3c0
800095c8:	0cf57463          	bgeu	a0,a5,80009690 <dhcp_bind+0x168>
800095cc:	03c00593          	li	a1,60
800095d0:	4ed030ef          	jal	ra,8000d2bc <__udivsi3>
800095d4:	01051793          	slli	a5,a0,0x10
800095d8:	0107d793          	srli	a5,a5,0x10
800095dc:	0c050063          	beqz	a0,8000969c <dhcp_bind+0x174>
800095e0:	00f41623          	sh	a5,12(s0)
800095e4:	00c45783          	lhu	a5,12(s0)
800095e8:	00f41823          	sh	a5,16(s0)
800095ec:	00c45783          	lhu	a5,12(s0)
800095f0:	00a45703          	lhu	a4,10(s0)
800095f4:	00f76663          	bltu	a4,a5,80009600 <dhcp_bind+0xd8>
800095f8:	00078463          	beqz	a5,80009600 <dhcp_bind+0xd8>
800095fc:	00041523          	sh	zero,10(s0)
80009600:	00744783          	lbu	a5,7(s0)
80009604:	0a078063          	beqz	a5,800096a4 <dhcp_bind+0x17c>
80009608:	02042783          	lw	a5,32(s0)
8000960c:	00f12423          	sw	a5,8(sp)
80009610:	02442783          	lw	a5,36(s0)
80009614:	00f12623          	sw	a5,12(sp)
80009618:	00079e63          	bnez	a5,80009634 <dhcp_bind+0x10c>
8000961c:	00812703          	lw	a4,8(sp)
80009620:	01c42783          	lw	a5,28(s0)
80009624:	00e7f7b3          	and	a5,a5,a4
80009628:	01000737          	lui	a4,0x1000
8000962c:	00e7e7b3          	or	a5,a5,a4
80009630:	00f12623          	sw	a5,12(sp)
80009634:	00a00593          	li	a1,10
80009638:	00040513          	mv	a0,s0
8000963c:	d9cff0ef          	jal	ra,80008bd8 <dhcp_set_state>
80009640:	00c10693          	addi	a3,sp,12
80009644:	00810613          	addi	a2,sp,8
80009648:	01c40593          	addi	a1,s0,28
8000964c:	00048513          	mv	a0,s1
80009650:	9c0fd0ef          	jal	ra,80006810 <netif_set_addr>
80009654:	01c12083          	lw	ra,28(sp)
80009658:	01812403          	lw	s0,24(sp)
8000965c:	01412483          	lw	s1,20(sp)
80009660:	02010113          	addi	sp,sp,32
80009664:	00008067          	ret
80009668:	000107b7          	lui	a5,0x10
8000966c:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80009670:	f09ff06f          	j	80009578 <dhcp_bind+0x50>
80009674:	00100793          	li	a5,1
80009678:	f01ff06f          	j	80009578 <dhcp_bind+0x50>
8000967c:	000107b7          	lui	a5,0x10
80009680:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80009684:	f25ff06f          	j	800095a8 <dhcp_bind+0x80>
80009688:	00100793          	li	a5,1
8000968c:	f1dff06f          	j	800095a8 <dhcp_bind+0x80>
80009690:	000107b7          	lui	a5,0x10
80009694:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80009698:	f49ff06f          	j	800095e0 <dhcp_bind+0xb8>
8000969c:	00100793          	li	a5,1
800096a0:	f41ff06f          	j	800095e0 <dhcp_bind+0xb8>
800096a4:	01c44783          	lbu	a5,28(s0)
800096a8:	01879713          	slli	a4,a5,0x18
800096ac:	41875713          	srai	a4,a4,0x18
800096b0:	00074663          	bltz	a4,800096bc <dhcp_bind+0x194>
800096b4:	0ff00793          	li	a5,255
800096b8:	f55ff06f          	j	8000960c <dhcp_bind+0xe4>
800096bc:	0bf00713          	li	a4,191
800096c0:	00f77863          	bgeu	a4,a5,800096d0 <dhcp_bind+0x1a8>
800096c4:	010007b7          	lui	a5,0x1000
800096c8:	fff78793          	addi	a5,a5,-1 # ffffff <_stack_size+0xfff7ff>
800096cc:	f41ff06f          	j	8000960c <dhcp_bind+0xe4>
800096d0:	000107b7          	lui	a5,0x10
800096d4:	ff5ff06f          	j	800096c8 <dhcp_bind+0x1a0>
800096d8:	00008067          	ret

800096dc <dhcp_inc_pcb_refcount>:
800096dc:	ff010113          	addi	sp,sp,-16
800096e0:	00812423          	sw	s0,8(sp)
800096e4:	8e01c783          	lbu	a5,-1824(gp) # 80003118 <dhcp_pcb_refcount>
800096e8:	00112623          	sw	ra,12(sp)
800096ec:	00912223          	sw	s1,4(sp)
800096f0:	01212023          	sw	s2,0(sp)
800096f4:	04079863          	bnez	a5,80009744 <dhcp_inc_pcb_refcount+0x68>
800096f8:	c4cff0ef          	jal	ra,80008b44 <udp_new>
800096fc:	8ea1a223          	sw	a0,-1820(gp) # 8000311c <dhcp_pcb>
80009700:	fff00713          	li	a4,-1
80009704:	04050863          	beqz	a0,80009754 <dhcp_inc_pcb_refcount+0x78>
80009708:	00954703          	lbu	a4,9(a0)
8000970c:	04400613          	li	a2,68
80009710:	02076713          	ori	a4,a4,32
80009714:	00e504a3          	sb	a4,9(a0)
80009718:	84818593          	addi	a1,gp,-1976 # 80003080 <ip_addr_any>
8000971c:	ee9fe0ef          	jal	ra,80008604 <udp_bind>
80009720:	8e41a503          	lw	a0,-1820(gp) # 8000311c <dhcp_pcb>
80009724:	04300613          	li	a2,67
80009728:	84818593          	addi	a1,gp,-1976 # 80003080 <ip_addr_any>
8000972c:	af8ff0ef          	jal	ra,80008a24 <udp_connect>
80009730:	8e41a503          	lw	a0,-1820(gp) # 8000311c <dhcp_pcb>
80009734:	8000a5b7          	lui	a1,0x8000a
80009738:	00000613          	li	a2,0
8000973c:	89c58593          	addi	a1,a1,-1892 # 8000989c <_heap_end+0xffff789c>
80009740:	bb0ff0ef          	jal	ra,80008af0 <udp_recv>
80009744:	8e01c783          	lbu	a5,-1824(gp) # 80003118 <dhcp_pcb_refcount>
80009748:	00000713          	li	a4,0
8000974c:	00178793          	addi	a5,a5,1 # 10001 <_stack_size+0xf801>
80009750:	8ef18023          	sb	a5,-1824(gp) # 80003118 <dhcp_pcb_refcount>
80009754:	00c12083          	lw	ra,12(sp)
80009758:	00812403          	lw	s0,8(sp)
8000975c:	00412483          	lw	s1,4(sp)
80009760:	00012903          	lw	s2,0(sp)
80009764:	00070513          	mv	a0,a4
80009768:	01010113          	addi	sp,sp,16
8000976c:	00008067          	ret

80009770 <dhcp_handle_ack.isra.0>:
80009770:	ff010113          	addi	sp,sp,-16
80009774:	00912223          	sw	s1,4(sp)
80009778:	00812423          	sw	s0,8(sp)
8000977c:	00112623          	sw	ra,12(sp)
80009780:	8e818793          	addi	a5,gp,-1816 # 80003120 <dhcp_rx_options_given>
80009784:	0037c783          	lbu	a5,3(a5)
80009788:	02052023          	sw	zero,32(a0)
8000978c:	02052223          	sw	zero,36(a0)
80009790:	00050413          	mv	s0,a0
80009794:	8e818493          	addi	s1,gp,-1816 # 80003120 <dhcp_rx_options_given>
80009798:	00078663          	beqz	a5,800097a4 <dhcp_handle_ack.isra.0+0x34>
8000979c:	b301a783          	lw	a5,-1232(gp) # 80003368 <dhcp_rx_options_val+0xc>
800097a0:	02f52423          	sw	a5,40(a0)
800097a4:	0044c783          	lbu	a5,4(s1)
800097a8:	08078663          	beqz	a5,80009834 <dhcp_handle_ack.isra.0+0xc4>
800097ac:	b341a783          	lw	a5,-1228(gp) # 8000336c <dhcp_rx_options_val+0x10>
800097b0:	02f42623          	sw	a5,44(s0)
800097b4:	0054c783          	lbu	a5,5(s1)
800097b8:	08078463          	beqz	a5,80009840 <dhcp_handle_ack.isra.0+0xd0>
800097bc:	b381a783          	lw	a5,-1224(gp) # 80003370 <dhcp_rx_options_val+0x14>
800097c0:	02f42823          	sw	a5,48(s0)
800097c4:	0115c703          	lbu	a4,17(a1)
800097c8:	0105c783          	lbu	a5,16(a1)
800097cc:	00871713          	slli	a4,a4,0x8
800097d0:	00f76733          	or	a4,a4,a5
800097d4:	0125c783          	lbu	a5,18(a1)
800097d8:	01079793          	slli	a5,a5,0x10
800097dc:	00e7e733          	or	a4,a5,a4
800097e0:	0135c783          	lbu	a5,19(a1)
800097e4:	01879793          	slli	a5,a5,0x18
800097e8:	00e7e7b3          	or	a5,a5,a4
800097ec:	00f42e23          	sw	a5,28(s0)
800097f0:	0064c783          	lbu	a5,6(s1)
800097f4:	06078063          	beqz	a5,80009854 <dhcp_handle_ack.isra.0+0xe4>
800097f8:	b3c1a503          	lw	a0,-1220(gp) # 80003374 <dhcp_rx_options_val+0x18>
800097fc:	d40fc0ef          	jal	ra,80005d3c <lwip_htonl>
80009800:	00100793          	li	a5,1
80009804:	02a42023          	sw	a0,32(s0)
80009808:	00f403a3          	sb	a5,7(s0)
8000980c:	0074c783          	lbu	a5,7(s1)
80009810:	00078863          	beqz	a5,80009820 <dhcp_handle_ack.isra.0+0xb0>
80009814:	b401a503          	lw	a0,-1216(gp) # 80003378 <dhcp_rx_options_val+0x1c>
80009818:	d24fc0ef          	jal	ra,80005d3c <lwip_htonl>
8000981c:	02a42223          	sw	a0,36(s0)
80009820:	00c12083          	lw	ra,12(sp)
80009824:	00812403          	lw	s0,8(sp)
80009828:	00412483          	lw	s1,4(sp)
8000982c:	01010113          	addi	sp,sp,16
80009830:	00008067          	ret
80009834:	02842783          	lw	a5,40(s0)
80009838:	0017d793          	srli	a5,a5,0x1
8000983c:	f75ff06f          	j	800097b0 <dhcp_handle_ack.isra.0+0x40>
80009840:	02842703          	lw	a4,40(s0)
80009844:	00371793          	slli	a5,a4,0x3
80009848:	40e787b3          	sub	a5,a5,a4
8000984c:	0037d793          	srli	a5,a5,0x3
80009850:	f71ff06f          	j	800097c0 <dhcp_handle_ack.isra.0+0x50>
80009854:	000403a3          	sb	zero,7(s0)
80009858:	fb5ff06f          	j	8000980c <dhcp_handle_ack.isra.0+0x9c>

8000985c <dhcp_dec_pcb_refcount>:
8000985c:	8e01c783          	lbu	a5,-1824(gp) # 80003118 <dhcp_pcb_refcount>
80009860:	fff78793          	addi	a5,a5,-1
80009864:	0ff7f793          	andi	a5,a5,255
80009868:	8ef18023          	sb	a5,-1824(gp) # 80003118 <dhcp_pcb_refcount>
8000986c:	02079663          	bnez	a5,80009898 <dhcp_dec_pcb_refcount+0x3c>
80009870:	ff010113          	addi	sp,sp,-16
80009874:	00812423          	sw	s0,8(sp)
80009878:	8e41a503          	lw	a0,-1820(gp) # 8000311c <dhcp_pcb>
8000987c:	00112623          	sw	ra,12(sp)
80009880:	a80ff0ef          	jal	ra,80008b00 <udp_remove>
80009884:	00c12083          	lw	ra,12(sp)
80009888:	8e01a223          	sw	zero,-1820(gp) # 8000311c <dhcp_pcb>
8000988c:	00812403          	lw	s0,8(sp)
80009890:	01010113          	addi	sp,sp,16
80009894:	00008067          	ret
80009898:	00008067          	ret

8000989c <dhcp_recv>:
8000989c:	fa010113          	addi	sp,sp,-96
800098a0:	05212823          	sw	s2,80(sp)
800098a4:	9f01a903          	lw	s2,-1552(gp) # 80003228 <ip_data+0x4>
800098a8:	05312623          	sw	s3,76(sp)
800098ac:	04112e23          	sw	ra,92(sp)
800098b0:	04812c23          	sw	s0,88(sp)
800098b4:	04912a23          	sw	s1,84(sp)
800098b8:	05412423          	sw	s4,72(sp)
800098bc:	05512223          	sw	s5,68(sp)
800098c0:	05612023          	sw	s6,64(sp)
800098c4:	03712e23          	sw	s7,60(sp)
800098c8:	03812c23          	sw	s8,56(sp)
800098cc:	03912a23          	sw	s9,52(sp)
800098d0:	03a12823          	sw	s10,48(sp)
800098d4:	03b12623          	sw	s11,44(sp)
800098d8:	02892b83          	lw	s7,40(s2)
800098dc:	00060993          	mv	s3,a2
800098e0:	0e0b8663          	beqz	s7,800099cc <dhcp_recv+0x130>
800098e4:	004bc783          	lbu	a5,4(s7)
800098e8:	0e078263          	beqz	a5,800099cc <dhcp_recv+0x130>
800098ec:	00a65703          	lhu	a4,10(a2)
800098f0:	02b00793          	li	a5,43
800098f4:	0ce7fc63          	bgeu	a5,a4,800099cc <dhcp_recv+0x130>
800098f8:	00462783          	lw	a5,4(a2)
800098fc:	00200713          	li	a4,2
80009900:	0007c683          	lbu	a3,0(a5)
80009904:	0ce69463          	bne	a3,a4,800099cc <dhcp_recv+0x130>
80009908:	03494603          	lbu	a2,52(s2)
8000990c:	00000713          	li	a4,0
80009910:	00600693          	li	a3,6
80009914:	0ff77593          	andi	a1,a4,255
80009918:	00c5f463          	bgeu	a1,a2,80009920 <dhcp_recv+0x84>
8000991c:	08d71c63          	bne	a4,a3,800099b4 <dhcp_recv+0x118>
80009920:	0057c503          	lbu	a0,5(a5)
80009924:	0047c703          	lbu	a4,4(a5)
80009928:	00851513          	slli	a0,a0,0x8
8000992c:	00e56533          	or	a0,a0,a4
80009930:	0067c703          	lbu	a4,6(a5)
80009934:	01071713          	slli	a4,a4,0x10
80009938:	00a76733          	or	a4,a4,a0
8000993c:	0077c503          	lbu	a0,7(a5)
80009940:	01851513          	slli	a0,a0,0x18
80009944:	00e56533          	or	a0,a0,a4
80009948:	bf4fc0ef          	jal	ra,80005d3c <lwip_htonl>
8000994c:	000ba783          	lw	a5,0(s7)
80009950:	06f51e63          	bne	a0,a5,800099cc <dhcp_recv+0x130>
80009954:	8e818793          	addi	a5,gp,-1816 # 80003120 <dhcp_rx_options_given>
80009958:	0007a223          	sw	zero,4(a5)
8000995c:	00a9d703          	lhu	a4,10(s3)
80009960:	0007a023          	sw	zero,0(a5)
80009964:	02b00793          	li	a5,43
80009968:	8e818813          	addi	a6,gp,-1816 # 80003120 <dhcp_rx_options_given>
8000996c:	06e7f063          	bgeu	a5,a4,800099cc <dhcp_recv+0x130>
80009970:	00010ab7          	lui	s5,0x10
80009974:	ffda8793          	addi	a5,s5,-3 # fffd <_stack_size+0xf7fd>
80009978:	0089dd83          	lhu	s11,8(s3)
8000997c:	00f12423          	sw	a5,8(sp)
80009980:	b2418793          	addi	a5,gp,-1244 # 8000335c <dhcp_rx_options_val>
80009984:	00000b13          	li	s6,0
80009988:	0f000d13          	li	s10,240
8000998c:	00f12223          	sw	a5,4(sp)
80009990:	00098c13          	mv	s8,s3
80009994:	00ac5783          	lhu	a5,10(s8)
80009998:	06fd7c63          	bgeu	s10,a5,80009a10 <dhcp_recv+0x174>
8000999c:	004c2783          	lw	a5,4(s8)
800099a0:	000d0413          	mv	s0,s10
800099a4:	00400a93          	li	s5,4
800099a8:	00f12023          	sw	a5,0(sp)
800099ac:	00100a13          	li	s4,1
800099b0:	25c0006f          	j	80009c0c <dhcp_recv+0x370>
800099b4:	00e905b3          	add	a1,s2,a4
800099b8:	00170713          	addi	a4,a4,1 # 1000001 <_stack_size+0xfff801>
800099bc:	00e78533          	add	a0,a5,a4
800099c0:	02e5c583          	lbu	a1,46(a1)
800099c4:	01b54503          	lbu	a0,27(a0)
800099c8:	f4b506e3          	beq	a0,a1,80009914 <dhcp_recv+0x78>
800099cc:	00098513          	mv	a0,s3
800099d0:	d78fd0ef          	jal	ra,80006f48 <pbuf_free>
800099d4:	05c12083          	lw	ra,92(sp)
800099d8:	05812403          	lw	s0,88(sp)
800099dc:	05412483          	lw	s1,84(sp)
800099e0:	05012903          	lw	s2,80(sp)
800099e4:	04c12983          	lw	s3,76(sp)
800099e8:	04812a03          	lw	s4,72(sp)
800099ec:	04412a83          	lw	s5,68(sp)
800099f0:	04012b03          	lw	s6,64(sp)
800099f4:	03c12b83          	lw	s7,60(sp)
800099f8:	03812c03          	lw	s8,56(sp)
800099fc:	03412c83          	lw	s9,52(sp)
80009a00:	03012d03          	lw	s10,48(sp)
80009a04:	02c12d83          	lw	s11,44(sp)
80009a08:	06010113          	addi	sp,sp,96
80009a0c:	00008067          	ret
80009a10:	000c2c03          	lw	s8,0(s8)
80009a14:	40fd0d33          	sub	s10,s10,a5
80009a18:	40fd8db3          	sub	s11,s11,a5
80009a1c:	010d1d13          	slli	s10,s10,0x10
80009a20:	010d9d93          	slli	s11,s11,0x10
80009a24:	010d5d13          	srli	s10,s10,0x10
80009a28:	010ddd93          	srli	s11,s11,0x10
80009a2c:	f60c14e3          	bnez	s8,80009994 <dhcp_recv+0xf8>
80009a30:	f9dff06f          	j	800099cc <dhcp_recv+0x130>
80009a34:	00240693          	addi	a3,s0,2
80009a38:	01069693          	slli	a3,a3,0x10
80009a3c:	0106d693          	srli	a3,a3,0x10
80009a40:	f886e6e3          	bltu	a3,s0,800099cc <dhcp_recv+0x130>
80009a44:	00ac5583          	lhu	a1,10(s8)
80009a48:	00140613          	addi	a2,s0,1
80009a4c:	02b65c63          	bge	a2,a1,80009a84 <dhcp_recv+0x1e8>
80009a50:	00174703          	lbu	a4,1(a4)
80009a54:	03400593          	li	a1,52
80009a58:	12b78263          	beq	a5,a1,80009b7c <dhcp_recv+0x2e0>
80009a5c:	02f5ee63          	bltu	a1,a5,80009a98 <dhcp_recv+0x1fc>
80009a60:	07478263          	beq	a5,s4,80009ac4 <dhcp_recv+0x228>
80009a64:	16078663          	beqz	a5,80009bd0 <dhcp_recv+0x334>
80009a68:	00300613          	li	a2,3
80009a6c:	0ec78663          	beq	a5,a2,80009b58 <dhcp_recv+0x2bc>
80009a70:	03300613          	li	a2,51
80009a74:	0ec78a63          	beq	a5,a2,80009b68 <dhcp_recv+0x2cc>
80009a78:	fff00493          	li	s1,-1
80009a7c:	00000c93          	li	s9,0
80009a80:	0500006f          	j	80009ad0 <dhcp_recv+0x234>
80009a84:	000c2703          	lw	a4,0(s8)
80009a88:	32070263          	beqz	a4,80009dac <dhcp_recv+0x510>
80009a8c:	00472703          	lw	a4,4(a4)
80009a90:	00074703          	lbu	a4,0(a4)
80009a94:	fc1ff06f          	j	80009a54 <dhcp_recv+0x1b8>
80009a98:	03600613          	li	a2,54
80009a9c:	10c78863          	beq	a5,a2,80009bac <dhcp_recv+0x310>
80009aa0:	0ec7ec63          	bltu	a5,a2,80009b98 <dhcp_recv+0x2fc>
80009aa4:	03a00613          	li	a2,58
80009aa8:	10c78c63          	beq	a5,a2,80009bc0 <dhcp_recv+0x324>
80009aac:	03b00613          	li	a2,59
80009ab0:	fcc794e3          	bne	a5,a2,80009a78 <dhcp_recv+0x1dc>
80009ab4:	f1571ce3          	bne	a4,s5,800099cc <dhcp_recv+0x130>
80009ab8:	00400c93          	li	s9,4
80009abc:	00500493          	li	s1,5
80009ac0:	0100006f          	j	80009ad0 <dhcp_recv+0x234>
80009ac4:	f15714e3          	bne	a4,s5,800099cc <dhcp_recv+0x130>
80009ac8:	00400c93          	li	s9,4
80009acc:	00600493          	li	s1,6
80009ad0:	00812783          	lw	a5,8(sp)
80009ad4:	00870433          	add	s0,a4,s0
80009ad8:	ee87cae3          	blt	a5,s0,800099cc <dhcp_recv+0x130>
80009adc:	00e68733          	add	a4,a3,a4
80009ae0:	01071413          	slli	s0,a4,0x10
80009ae4:	01045413          	srli	s0,s0,0x10
80009ae8:	0e0c8863          	beqz	s9,80009bd8 <dhcp_recv+0x33c>
80009aec:	009807b3          	add	a5,a6,s1
80009af0:	0007c783          	lbu	a5,0(a5)
80009af4:	00012e23          	sw	zero,28(sp)
80009af8:	0e079063          	bnez	a5,80009bd8 <dhcp_recv+0x33c>
80009afc:	010c9793          	slli	a5,s9,0x10
80009b00:	0107d793          	srli	a5,a5,0x10
80009b04:	00078613          	mv	a2,a5
80009b08:	01c10593          	addi	a1,sp,28
80009b0c:	000c0513          	mv	a0,s8
80009b10:	00f12623          	sw	a5,12(sp)
80009b14:	a19fd0ef          	jal	ra,8000752c <pbuf_copy_partial>
80009b18:	00c12783          	lw	a5,12(sp)
80009b1c:	eaa798e3          	bne	a5,a0,800099cc <dhcp_recv+0x130>
80009b20:	8e818813          	addi	a6,gp,-1816 # 80003120 <dhcp_rx_options_given>
80009b24:	155c9a63          	bne	s9,s5,80009c78 <dhcp_recv+0x3dc>
80009b28:	01c12503          	lw	a0,28(sp)
80009b2c:	a10fc0ef          	jal	ra,80005d3c <lwip_htonl>
80009b30:	00a12e23          	sw	a0,28(sp)
80009b34:	8e818813          	addi	a6,gp,-1816 # 80003120 <dhcp_rx_options_given>
80009b38:	009807b3          	add	a5,a6,s1
80009b3c:	01478023          	sb	s4,0(a5)
80009b40:	00412783          	lw	a5,4(sp)
80009b44:	00249493          	slli	s1,s1,0x2
80009b48:	009784b3          	add	s1,a5,s1
80009b4c:	01c12783          	lw	a5,28(sp)
80009b50:	00f4a023          	sw	a5,0(s1)
80009b54:	0840006f          	j	80009bd8 <dhcp_recv+0x33c>
80009b58:	e6e7fae3          	bgeu	a5,a4,800099cc <dhcp_recv+0x130>
80009b5c:	00700493          	li	s1,7
80009b60:	00400c93          	li	s9,4
80009b64:	f6dff06f          	j	80009ad0 <dhcp_recv+0x234>
80009b68:	e75712e3          	bne	a4,s5,800099cc <dhcp_recv+0x130>
80009b6c:	00400c93          	li	s9,4
80009b70:	00300493          	li	s1,3
80009b74:	f5dff06f          	j	80009ad0 <dhcp_recv+0x234>
80009b78:	00000713          	li	a4,0
80009b7c:	e54718e3          	bne	a4,s4,800099cc <dhcp_recv+0x130>
80009b80:	0f000793          	li	a5,240
80009b84:	e4fd14e3          	bne	s10,a5,800099cc <dhcp_recv+0x130>
80009b88:	00100c93          	li	s9,1
80009b8c:	00000493          	li	s1,0
80009b90:	f41ff06f          	j	80009ad0 <dhcp_recv+0x234>
80009b94:	00000713          	li	a4,0
80009b98:	e3471ae3          	bne	a4,s4,800099cc <dhcp_recv+0x130>
80009b9c:	00100c93          	li	s9,1
80009ba0:	00100493          	li	s1,1
80009ba4:	f2dff06f          	j	80009ad0 <dhcp_recv+0x234>
80009ba8:	00000713          	li	a4,0
80009bac:	e35710e3          	bne	a4,s5,800099cc <dhcp_recv+0x130>
80009bb0:	00400c93          	li	s9,4
80009bb4:	00200493          	li	s1,2
80009bb8:	f19ff06f          	j	80009ad0 <dhcp_recv+0x234>
80009bbc:	00000713          	li	a4,0
80009bc0:	e15716e3          	bne	a4,s5,800099cc <dhcp_recv+0x130>
80009bc4:	00400c93          	li	s9,4
80009bc8:	00400493          	li	s1,4
80009bcc:	f05ff06f          	j	80009ad0 <dhcp_recv+0x234>
80009bd0:	01061413          	slli	s0,a2,0x10
80009bd4:	01045413          	srli	s0,s0,0x10
80009bd8:	00ac5783          	lhu	a5,10(s8)
80009bdc:	02f46863          	bltu	s0,a5,80009c0c <dhcp_recv+0x370>
80009be0:	40f40433          	sub	s0,s0,a5
80009be4:	40fd8db3          	sub	s11,s11,a5
80009be8:	01041413          	slli	s0,s0,0x10
80009bec:	010d9d93          	slli	s11,s11,0x10
80009bf0:	01045413          	srli	s0,s0,0x10
80009bf4:	010ddd93          	srli	s11,s11,0x10
80009bf8:	ddb47ae3          	bgeu	s0,s11,800099cc <dhcp_recv+0x130>
80009bfc:	000c2c03          	lw	s8,0(s8)
80009c00:	dc0c06e3          	beqz	s8,800099cc <dhcp_recv+0x130>
80009c04:	004c2783          	lw	a5,4(s8)
80009c08:	00f12023          	sw	a5,0(sp)
80009c0c:	01b47c63          	bgeu	s0,s11,80009c24 <dhcp_recv+0x388>
80009c10:	00012783          	lw	a5,0(sp)
80009c14:	0ff00693          	li	a3,255
80009c18:	00878733          	add	a4,a5,s0
80009c1c:	00074783          	lbu	a5,0(a4)
80009c20:	e0d79ae3          	bne	a5,a3,80009a34 <dhcp_recv+0x198>
80009c24:	00084783          	lbu	a5,0(a6)
80009c28:	06079063          	bnez	a5,80009c88 <dhcp_recv+0x3ec>
80009c2c:	060b1c63          	bnez	s6,80009ca4 <dhcp_recv+0x408>
80009c30:	00184783          	lbu	a5,1(a6)
80009c34:	d8078ce3          	beqz	a5,800099cc <dhcp_recv+0x130>
80009c38:	b2418793          	addi	a5,gp,-1244 # 8000335c <dhcp_rx_options_val>
80009c3c:	0047c703          	lbu	a4,4(a5)
80009c40:	00500693          	li	a3,5
80009c44:	0049a583          	lw	a1,4(s3)
80009c48:	0ad71463          	bne	a4,a3,80009cf0 <dhcp_recv+0x454>
80009c4c:	005bc783          	lbu	a5,5(s7)
80009c50:	00100713          	li	a4,1
80009c54:	06e79c63          	bne	a5,a4,80009ccc <dhcp_recv+0x430>
80009c58:	02892503          	lw	a0,40(s2)
80009c5c:	b15ff0ef          	jal	ra,80009770 <dhcp_handle_ack.isra.0>
80009c60:	03594783          	lbu	a5,53(s2)
80009c64:	00090513          	mv	a0,s2
80009c68:	0087f793          	andi	a5,a5,8
80009c6c:	06078e63          	beqz	a5,80009ce8 <dhcp_recv+0x44c>
80009c70:	855ff0ef          	jal	ra,800094c4 <dhcp_check>
80009c74:	d59ff06f          	j	800099cc <dhcp_recv+0x130>
80009c78:	d54c9ae3          	bne	s9,s4,800099cc <dhcp_recv+0x130>
80009c7c:	01c14783          	lbu	a5,28(sp)
80009c80:	00f12e23          	sw	a5,28(sp)
80009c84:	eb5ff06f          	j	80009b38 <dhcp_recv+0x29c>
80009c88:	00412783          	lw	a5,4(sp)
80009c8c:	00080023          	sb	zero,0(a6)
80009c90:	00100713          	li	a4,1
80009c94:	0007a783          	lw	a5,0(a5)
80009c98:	02e78463          	beq	a5,a4,80009cc0 <dhcp_recv+0x424>
80009c9c:	00200713          	li	a4,2
80009ca0:	00e79a63          	bne	a5,a4,80009cb4 <dhcp_recv+0x418>
80009ca4:	00000b13          	li	s6,0
80009ca8:	06c00d93          	li	s11,108
80009cac:	02c00d13          	li	s10,44
80009cb0:	ce1ff06f          	j	80009990 <dhcp_recv+0xf4>
80009cb4:	00300713          	li	a4,3
80009cb8:	f6e79ae3          	bne	a5,a4,80009c2c <dhcp_recv+0x390>
80009cbc:	00100b13          	li	s6,1
80009cc0:	0ec00d93          	li	s11,236
80009cc4:	06c00d13          	li	s10,108
80009cc8:	cc9ff06f          	j	80009990 <dhcp_recv+0xf4>
80009ccc:	ffd78793          	addi	a5,a5,-3
80009cd0:	0ff7f793          	andi	a5,a5,255
80009cd4:	00200713          	li	a4,2
80009cd8:	cef76ae3          	bltu	a4,a5,800099cc <dhcp_recv+0x130>
80009cdc:	02892503          	lw	a0,40(s2)
80009ce0:	a91ff0ef          	jal	ra,80009770 <dhcp_handle_ack.isra.0>
80009ce4:	00090513          	mv	a0,s2
80009ce8:	841ff0ef          	jal	ra,80009528 <dhcp_bind>
80009cec:	ce1ff06f          	j	800099cc <dhcp_recv+0x130>
80009cf0:	00600693          	li	a3,6
80009cf4:	04d71663          	bne	a4,a3,80009d40 <dhcp_recv+0x4a4>
80009cf8:	005bc703          	lbu	a4,5(s7)
80009cfc:	00200693          	li	a3,2
80009d00:	ffd70793          	addi	a5,a4,-3
80009d04:	0ff7f793          	andi	a5,a5,255
80009d08:	00f6f663          	bgeu	a3,a5,80009d14 <dhcp_recv+0x478>
80009d0c:	00100793          	li	a5,1
80009d10:	caf71ee3          	bne	a4,a5,800099cc <dhcp_recv+0x130>
80009d14:	02892503          	lw	a0,40(s2)
80009d18:	00c00593          	li	a1,12
80009d1c:	ebdfe0ef          	jal	ra,80008bd8 <dhcp_set_state>
80009d20:	84818693          	addi	a3,gp,-1976 # 80003080 <ip_addr_any>
80009d24:	84818613          	addi	a2,gp,-1976 # 80003080 <ip_addr_any>
80009d28:	00090513          	mv	a0,s2
80009d2c:	84818593          	addi	a1,gp,-1976 # 80003080 <ip_addr_any>
80009d30:	ae1fc0ef          	jal	ra,80006810 <netif_set_addr>
80009d34:	00090513          	mv	a0,s2
80009d38:	dc8ff0ef          	jal	ra,80009300 <dhcp_discover>
80009d3c:	c91ff06f          	j	800099cc <dhcp_recv+0x130>
80009d40:	00200613          	li	a2,2
80009d44:	c8c714e3          	bne	a4,a2,800099cc <dhcp_recv+0x130>
80009d48:	005bc703          	lbu	a4,5(s7)
80009d4c:	c8d710e3          	bne	a4,a3,800099cc <dhcp_recv+0x130>
80009d50:	00284703          	lbu	a4,2(a6)
80009d54:	c6070ce3          	beqz	a4,800099cc <dhcp_recv+0x130>
80009d58:	02892403          	lw	s0,40(s2)
80009d5c:	00b12023          	sw	a1,0(sp)
80009d60:	00041423          	sh	zero,8(s0)
80009d64:	0087a503          	lw	a0,8(a5)
80009d68:	fd5fb0ef          	jal	ra,80005d3c <lwip_htonl>
80009d6c:	00012583          	lw	a1,0(sp)
80009d70:	00a42c23          	sw	a0,24(s0)
80009d74:	00090513          	mv	a0,s2
80009d78:	0115c703          	lbu	a4,17(a1)
80009d7c:	0105c783          	lbu	a5,16(a1)
80009d80:	00871713          	slli	a4,a4,0x8
80009d84:	00f76733          	or	a4,a4,a5
80009d88:	0125c783          	lbu	a5,18(a1)
80009d8c:	01079793          	slli	a5,a5,0x10
80009d90:	00e7e733          	or	a4,a5,a4
80009d94:	0135c783          	lbu	a5,19(a1)
80009d98:	01879793          	slli	a5,a5,0x18
80009d9c:	00e7e7b3          	or	a5,a5,a4
80009da0:	00f42e23          	sw	a5,28(s0)
80009da4:	ae0ff0ef          	jal	ra,80009084 <dhcp_select>
80009da8:	c25ff06f          	j	800099cc <dhcp_recv+0x130>
80009dac:	03400713          	li	a4,52
80009db0:	dce784e3          	beq	a5,a4,80009b78 <dhcp_recv+0x2dc>
80009db4:	02f76263          	bltu	a4,a5,80009dd8 <dhcp_recv+0x53c>
80009db8:	c1478ae3          	beq	a5,s4,800099cc <dhcp_recv+0x130>
80009dbc:	e0078ae3          	beqz	a5,80009bd0 <dhcp_recv+0x334>
80009dc0:	00300713          	li	a4,3
80009dc4:	c0e784e3          	beq	a5,a4,800099cc <dhcp_recv+0x130>
80009dc8:	03300713          	li	a4,51
80009dcc:	c0e780e3          	beq	a5,a4,800099cc <dhcp_recv+0x130>
80009dd0:	00000713          	li	a4,0
80009dd4:	ca5ff06f          	j	80009a78 <dhcp_recv+0x1dc>
80009dd8:	03600713          	li	a4,54
80009ddc:	dce786e3          	beq	a5,a4,80009ba8 <dhcp_recv+0x30c>
80009de0:	dae7eae3          	bltu	a5,a4,80009b94 <dhcp_recv+0x2f8>
80009de4:	03a00713          	li	a4,58
80009de8:	dce78ae3          	beq	a5,a4,80009bbc <dhcp_recv+0x320>
80009dec:	03b00613          	li	a2,59
80009df0:	00000713          	li	a4,0
80009df4:	cbdff06f          	j	80009ab0 <dhcp_recv+0x214>

80009df8 <dhcp_set_struct>:
80009df8:	ff010113          	addi	sp,sp,-16
80009dfc:	00058793          	mv	a5,a1
80009e00:	00812423          	sw	s0,8(sp)
80009e04:	03400613          	li	a2,52
80009e08:	00050413          	mv	s0,a0
80009e0c:	00000593          	li	a1,0
80009e10:	00078513          	mv	a0,a5
80009e14:	00112623          	sw	ra,12(sp)
80009e18:	595020ef          	jal	ra,8000cbac <memset>
80009e1c:	02a42423          	sw	a0,40(s0)
80009e20:	00c12083          	lw	ra,12(sp)
80009e24:	00812403          	lw	s0,8(sp)
80009e28:	01010113          	addi	sp,sp,16
80009e2c:	00008067          	ret

80009e30 <dhcp_cleanup>:
80009e30:	02852783          	lw	a5,40(a0)
80009e34:	02078863          	beqz	a5,80009e64 <dhcp_cleanup+0x34>
80009e38:	ff010113          	addi	sp,sp,-16
80009e3c:	00812423          	sw	s0,8(sp)
80009e40:	00050413          	mv	s0,a0
80009e44:	00078513          	mv	a0,a5
80009e48:	00112623          	sw	ra,12(sp)
80009e4c:	f0cfc0ef          	jal	ra,80006558 <lwip_free>
80009e50:	02042423          	sw	zero,40(s0)
80009e54:	00c12083          	lw	ra,12(sp)
80009e58:	00812403          	lw	s0,8(sp)
80009e5c:	01010113          	addi	sp,sp,16
80009e60:	00008067          	ret
80009e64:	00008067          	ret

80009e68 <dhcp_inform>:
80009e68:	0e050a63          	beqz	a0,80009f5c <dhcp_inform+0xf4>
80009e6c:	fb010113          	addi	sp,sp,-80
80009e70:	04812423          	sw	s0,72(sp)
80009e74:	04112623          	sw	ra,76(sp)
80009e78:	04912223          	sw	s1,68(sp)
80009e7c:	05212023          	sw	s2,64(sp)
80009e80:	00050413          	mv	s0,a0
80009e84:	859ff0ef          	jal	ra,800096dc <dhcp_inc_pcb_refcount>
80009e88:	0a051e63          	bnez	a0,80009f44 <dhcp_inform+0xdc>
80009e8c:	03400613          	li	a2,52
80009e90:	00000593          	li	a1,0
80009e94:	00c10513          	addi	a0,sp,12
80009e98:	515020ef          	jal	ra,8000cbac <memset>
80009e9c:	00700593          	li	a1,7
80009ea0:	00c10513          	addi	a0,sp,12
80009ea4:	d35fe0ef          	jal	ra,80008bd8 <dhcp_set_state>
80009ea8:	00a10693          	addi	a3,sp,10
80009eac:	00800613          	li	a2,8
80009eb0:	00c10593          	addi	a1,sp,12
80009eb4:	00040513          	mv	a0,s0
80009eb8:	dc9fe0ef          	jal	ra,80008c80 <dhcp_create_msg>
80009ebc:	00050913          	mv	s2,a0
80009ec0:	08050063          	beqz	a0,80009f40 <dhcp_inform+0xd8>
80009ec4:	00452483          	lw	s1,4(a0)
80009ec8:	00a15783          	lhu	a5,10(sp)
80009ecc:	03900693          	li	a3,57
80009ed0:	0f048493          	addi	s1,s1,240
80009ed4:	00f48733          	add	a4,s1,a5
80009ed8:	00278513          	addi	a0,a5,2
80009edc:	00178793          	addi	a5,a5,1
80009ee0:	01079793          	slli	a5,a5,0x10
80009ee4:	0107d793          	srli	a5,a5,0x10
80009ee8:	00d70023          	sb	a3,0(a4)
80009eec:	00f487b3          	add	a5,s1,a5
80009ef0:	00200713          	li	a4,2
80009ef4:	00e78023          	sb	a4,0(a5)
80009ef8:	02c45603          	lhu	a2,44(s0)
80009efc:	01051513          	slli	a0,a0,0x10
80009f00:	01055513          	srli	a0,a0,0x10
80009f04:	00048593          	mv	a1,s1
80009f08:	00a11523          	sh	a0,10(sp)
80009f0c:	ce5fe0ef          	jal	ra,80008bf0 <dhcp_option_short>
80009f10:	00090613          	mv	a2,s2
80009f14:	00048593          	mv	a1,s1
80009f18:	00a11523          	sh	a0,10(sp)
80009f1c:	f09fe0ef          	jal	ra,80008e24 <dhcp_option_trailer>
80009f20:	8e41a503          	lw	a0,-1820(gp) # 8000311c <dhcp_pcb>
80009f24:	00040713          	mv	a4,s0
80009f28:	04300693          	li	a3,67
80009f2c:	84418613          	addi	a2,gp,-1980 # 8000307c <ip_addr_broadcast>
80009f30:	00090593          	mv	a1,s2
80009f34:	9b5fe0ef          	jal	ra,800088e8 <udp_sendto_if>
80009f38:	00090513          	mv	a0,s2
80009f3c:	80cfd0ef          	jal	ra,80006f48 <pbuf_free>
80009f40:	91dff0ef          	jal	ra,8000985c <dhcp_dec_pcb_refcount>
80009f44:	04c12083          	lw	ra,76(sp)
80009f48:	04812403          	lw	s0,72(sp)
80009f4c:	04412483          	lw	s1,68(sp)
80009f50:	04012903          	lw	s2,64(sp)
80009f54:	05010113          	addi	sp,sp,80
80009f58:	00008067          	ret
80009f5c:	00008067          	ret

80009f60 <dhcp_network_changed>:
80009f60:	02852783          	lw	a5,40(a0)
80009f64:	02078a63          	beqz	a5,80009f98 <dhcp_network_changed+0x38>
80009f68:	0057c703          	lbu	a4,5(a5)
80009f6c:	00500693          	li	a3,5
80009f70:	00e6ec63          	bltu	a3,a4,80009f88 <dhcp_network_changed+0x28>
80009f74:	00300693          	li	a3,3
80009f78:	00d77c63          	bgeu	a4,a3,80009f90 <dhcp_network_changed+0x30>
80009f7c:	00070e63          	beqz	a4,80009f98 <dhcp_network_changed+0x38>
80009f80:	00078323          	sb	zero,6(a5)
80009f84:	b7cff06f          	j	80009300 <dhcp_discover>
80009f88:	00a00693          	li	a3,10
80009f8c:	fed71ae3          	bne	a4,a3,80009f80 <dhcp_network_changed+0x20>
80009f90:	00078323          	sb	zero,6(a5)
80009f94:	ee1fe06f          	j	80008e74 <dhcp_reboot>
80009f98:	00008067          	ret

80009f9c <dhcp_arp_reply>:
80009f9c:	12050a63          	beqz	a0,8000a0d0 <dhcp_arp_reply+0x134>
80009fa0:	fd010113          	addi	sp,sp,-48
80009fa4:	02112623          	sw	ra,44(sp)
80009fa8:	02812423          	sw	s0,40(sp)
80009fac:	02912223          	sw	s1,36(sp)
80009fb0:	03212023          	sw	s2,32(sp)
80009fb4:	01312e23          	sw	s3,28(sp)
80009fb8:	01412c23          	sw	s4,24(sp)
80009fbc:	02852403          	lw	s0,40(a0)
80009fc0:	0e040863          	beqz	s0,8000a0b0 <dhcp_arp_reply+0x114>
80009fc4:	00544703          	lbu	a4,5(s0)
80009fc8:	00800793          	li	a5,8
80009fcc:	0ef71263          	bne	a4,a5,8000a0b0 <dhcp_arp_reply+0x114>
80009fd0:	0005a703          	lw	a4,0(a1)
80009fd4:	01c42783          	lw	a5,28(s0)
80009fd8:	0cf71c63          	bne	a4,a5,8000a0b0 <dhcp_arp_reply+0x114>
80009fdc:	00050a13          	mv	s4,a0
80009fe0:	00c00593          	li	a1,12
80009fe4:	00040513          	mv	a0,s0
80009fe8:	bf1fe0ef          	jal	ra,80008bd8 <dhcp_set_state>
80009fec:	00e10693          	addi	a3,sp,14
80009ff0:	00400613          	li	a2,4
80009ff4:	00040593          	mv	a1,s0
80009ff8:	000a0513          	mv	a0,s4
80009ffc:	c85fe0ef          	jal	ra,80008c80 <dhcp_create_msg>
8000a000:	00050913          	mv	s2,a0
8000a004:	08050863          	beqz	a0,8000a094 <dhcp_arp_reply+0xf8>
8000a008:	00452483          	lw	s1,4(a0)
8000a00c:	00e15783          	lhu	a5,14(sp)
8000a010:	03200693          	li	a3,50
8000a014:	0f048493          	addi	s1,s1,240
8000a018:	00f48733          	add	a4,s1,a5
8000a01c:	00278993          	addi	s3,a5,2
8000a020:	00178793          	addi	a5,a5,1
8000a024:	01079793          	slli	a5,a5,0x10
8000a028:	0107d793          	srli	a5,a5,0x10
8000a02c:	00d70023          	sb	a3,0(a4)
8000a030:	00f487b3          	add	a5,s1,a5
8000a034:	00400713          	li	a4,4
8000a038:	00e78023          	sb	a4,0(a5)
8000a03c:	01c42503          	lw	a0,28(s0)
8000a040:	01099993          	slli	s3,s3,0x10
8000a044:	0109d993          	srli	s3,s3,0x10
8000a048:	01311723          	sh	s3,14(sp)
8000a04c:	cf1fb0ef          	jal	ra,80005d3c <lwip_htonl>
8000a050:	00050613          	mv	a2,a0
8000a054:	00048593          	mv	a1,s1
8000a058:	00098513          	mv	a0,s3
8000a05c:	bc5fe0ef          	jal	ra,80008c20 <dhcp_option_long>
8000a060:	00090613          	mv	a2,s2
8000a064:	00048593          	mv	a1,s1
8000a068:	00a11723          	sh	a0,14(sp)
8000a06c:	db9fe0ef          	jal	ra,80008e24 <dhcp_option_trailer>
8000a070:	8e41a503          	lw	a0,-1820(gp) # 8000311c <dhcp_pcb>
8000a074:	84818793          	addi	a5,gp,-1976 # 80003080 <ip_addr_any>
8000a078:	000a0713          	mv	a4,s4
8000a07c:	04300693          	li	a3,67
8000a080:	84418613          	addi	a2,gp,-1980 # 8000307c <ip_addr_broadcast>
8000a084:	00090593          	mv	a1,s2
8000a088:	e6cfe0ef          	jal	ra,800086f4 <udp_sendto_if_src>
8000a08c:	00090513          	mv	a0,s2
8000a090:	eb9fc0ef          	jal	ra,80006f48 <pbuf_free>
8000a094:	00644783          	lbu	a5,6(s0)
8000a098:	0ff00713          	li	a4,255
8000a09c:	00e78663          	beq	a5,a4,8000a0a8 <dhcp_arp_reply+0x10c>
8000a0a0:	00178793          	addi	a5,a5,1
8000a0a4:	00f40323          	sb	a5,6(s0)
8000a0a8:	01400793          	li	a5,20
8000a0ac:	00f41423          	sh	a5,8(s0)
8000a0b0:	02c12083          	lw	ra,44(sp)
8000a0b4:	02812403          	lw	s0,40(sp)
8000a0b8:	02412483          	lw	s1,36(sp)
8000a0bc:	02012903          	lw	s2,32(sp)
8000a0c0:	01c12983          	lw	s3,28(sp)
8000a0c4:	01812a03          	lw	s4,24(sp)
8000a0c8:	03010113          	addi	sp,sp,48
8000a0cc:	00008067          	ret
8000a0d0:	00008067          	ret

8000a0d4 <dhcp_renew>:
8000a0d4:	fd010113          	addi	sp,sp,-48
8000a0d8:	02112623          	sw	ra,44(sp)
8000a0dc:	02812423          	sw	s0,40(sp)
8000a0e0:	01312e23          	sw	s3,28(sp)
8000a0e4:	02912223          	sw	s1,36(sp)
8000a0e8:	03212023          	sw	s2,32(sp)
8000a0ec:	02852483          	lw	s1,40(a0)
8000a0f0:	00050993          	mv	s3,a0
8000a0f4:	00500593          	li	a1,5
8000a0f8:	00048513          	mv	a0,s1
8000a0fc:	addfe0ef          	jal	ra,80008bd8 <dhcp_set_state>
8000a100:	00e10693          	addi	a3,sp,14
8000a104:	00300613          	li	a2,3
8000a108:	00048593          	mv	a1,s1
8000a10c:	00098513          	mv	a0,s3
8000a110:	b71fe0ef          	jal	ra,80008c80 <dhcp_create_msg>
8000a114:	fff00413          	li	s0,-1
8000a118:	10050063          	beqz	a0,8000a218 <dhcp_renew+0x144>
8000a11c:	00452403          	lw	s0,4(a0)
8000a120:	00e15783          	lhu	a5,14(sp)
8000a124:	00050913          	mv	s2,a0
8000a128:	0f040413          	addi	s0,s0,240
8000a12c:	00f40733          	add	a4,s0,a5
8000a130:	00278513          	addi	a0,a5,2
8000a134:	00178793          	addi	a5,a5,1
8000a138:	01079793          	slli	a5,a5,0x10
8000a13c:	03900693          	li	a3,57
8000a140:	0107d793          	srli	a5,a5,0x10
8000a144:	00d70023          	sb	a3,0(a4)
8000a148:	00f407b3          	add	a5,s0,a5
8000a14c:	00200713          	li	a4,2
8000a150:	00e78023          	sb	a4,0(a5)
8000a154:	02c9d603          	lhu	a2,44(s3)
8000a158:	01051513          	slli	a0,a0,0x10
8000a15c:	00040593          	mv	a1,s0
8000a160:	01055513          	srli	a0,a0,0x10
8000a164:	00a11723          	sh	a0,14(sp)
8000a168:	a89fe0ef          	jal	ra,80008bf0 <dhcp_option_short>
8000a16c:	00a40733          	add	a4,s0,a0
8000a170:	03700693          	li	a3,55
8000a174:	00d70023          	sb	a3,0(a4)
8000a178:	00150713          	addi	a4,a0,1
8000a17c:	01071713          	slli	a4,a4,0x10
8000a180:	01075713          	srli	a4,a4,0x10
8000a184:	00e40733          	add	a4,s0,a4
8000a188:	00300613          	li	a2,3
8000a18c:	00c70023          	sb	a2,0(a4)
8000a190:	00250713          	addi	a4,a0,2
8000a194:	01071713          	slli	a4,a4,0x10
8000a198:	01075713          	srli	a4,a4,0x10
8000a19c:	00e40733          	add	a4,s0,a4
8000a1a0:	00100693          	li	a3,1
8000a1a4:	00d70023          	sb	a3,0(a4)
8000a1a8:	00050793          	mv	a5,a0
8000a1ac:	00350693          	addi	a3,a0,3
8000a1b0:	01069693          	slli	a3,a3,0x10
8000a1b4:	00478793          	addi	a5,a5,4
8000a1b8:	0106d693          	srli	a3,a3,0x10
8000a1bc:	01079793          	slli	a5,a5,0x10
8000a1c0:	00d406b3          	add	a3,s0,a3
8000a1c4:	00550513          	addi	a0,a0,5
8000a1c8:	0107d793          	srli	a5,a5,0x10
8000a1cc:	00c68023          	sb	a2,0(a3)
8000a1d0:	00f407b3          	add	a5,s0,a5
8000a1d4:	01c00713          	li	a4,28
8000a1d8:	01051513          	slli	a0,a0,0x10
8000a1dc:	00e78023          	sb	a4,0(a5)
8000a1e0:	01055513          	srli	a0,a0,0x10
8000a1e4:	00040593          	mv	a1,s0
8000a1e8:	00090613          	mv	a2,s2
8000a1ec:	00a11723          	sh	a0,14(sp)
8000a1f0:	c35fe0ef          	jal	ra,80008e24 <dhcp_option_trailer>
8000a1f4:	8e41a503          	lw	a0,-1820(gp) # 8000311c <dhcp_pcb>
8000a1f8:	00098713          	mv	a4,s3
8000a1fc:	04300693          	li	a3,67
8000a200:	01848613          	addi	a2,s1,24
8000a204:	00090593          	mv	a1,s2
8000a208:	ee0fe0ef          	jal	ra,800088e8 <udp_sendto_if>
8000a20c:	00050413          	mv	s0,a0
8000a210:	00090513          	mv	a0,s2
8000a214:	d35fc0ef          	jal	ra,80006f48 <pbuf_free>
8000a218:	0064c783          	lbu	a5,6(s1)
8000a21c:	0ff00713          	li	a4,255
8000a220:	00e78663          	beq	a5,a4,8000a22c <dhcp_renew+0x158>
8000a224:	00178793          	addi	a5,a5,1
8000a228:	00f48323          	sb	a5,6(s1)
8000a22c:	0064c503          	lbu	a0,6(s1)
8000a230:	00900793          	li	a5,9
8000a234:	04a7e863          	bltu	a5,a0,8000a284 <dhcp_renew+0x1b0>
8000a238:	00551793          	slli	a5,a0,0x5
8000a23c:	40a787b3          	sub	a5,a5,a0
8000a240:	00279793          	slli	a5,a5,0x2
8000a244:	00f50533          	add	a0,a0,a5
8000a248:	00451513          	slli	a0,a0,0x4
8000a24c:	01051513          	slli	a0,a0,0x10
8000a250:	01055513          	srli	a0,a0,0x10
8000a254:	1f400593          	li	a1,500
8000a258:	1f350513          	addi	a0,a0,499
8000a25c:	058030ef          	jal	ra,8000d2b4 <__divsi3>
8000a260:	00a49423          	sh	a0,8(s1)
8000a264:	02c12083          	lw	ra,44(sp)
8000a268:	00040513          	mv	a0,s0
8000a26c:	02812403          	lw	s0,40(sp)
8000a270:	02412483          	lw	s1,36(sp)
8000a274:	02012903          	lw	s2,32(sp)
8000a278:	01c12983          	lw	s3,28(sp)
8000a27c:	03010113          	addi	sp,sp,48
8000a280:	00008067          	ret
8000a284:	00005537          	lui	a0,0x5
8000a288:	e2050513          	addi	a0,a0,-480 # 4e20 <_stack_size+0x4620>
8000a28c:	fc9ff06f          	j	8000a254 <dhcp_renew+0x180>

8000a290 <dhcp_supplied_address>:
8000a290:	02050863          	beqz	a0,8000a2c0 <dhcp_supplied_address+0x30>
8000a294:	02852783          	lw	a5,40(a0)
8000a298:	00000513          	li	a0,0
8000a29c:	02078463          	beqz	a5,8000a2c4 <dhcp_supplied_address+0x34>
8000a2a0:	0057c783          	lbu	a5,5(a5)
8000a2a4:	00a00713          	li	a4,10
8000a2a8:	00100513          	li	a0,1
8000a2ac:	00e78663          	beq	a5,a4,8000a2b8 <dhcp_supplied_address+0x28>
8000a2b0:	ffc78513          	addi	a0,a5,-4
8000a2b4:	00253513          	sltiu	a0,a0,2
8000a2b8:	0ff57513          	andi	a0,a0,255
8000a2bc:	00008067          	ret
8000a2c0:	00000513          	li	a0,0
8000a2c4:	00008067          	ret

8000a2c8 <dhcp_release_and_stop>:
8000a2c8:	fd010113          	addi	sp,sp,-48
8000a2cc:	02112623          	sw	ra,44(sp)
8000a2d0:	02812423          	sw	s0,40(sp)
8000a2d4:	02912223          	sw	s1,36(sp)
8000a2d8:	03212023          	sw	s2,32(sp)
8000a2dc:	01312e23          	sw	s3,28(sp)
8000a2e0:	01412c23          	sw	s4,24(sp)
8000a2e4:	02852403          	lw	s0,40(a0)
8000a2e8:	10040e63          	beqz	s0,8000a404 <dhcp_release_and_stop+0x13c>
8000a2ec:	00544783          	lbu	a5,5(s0)
8000a2f0:	10078a63          	beqz	a5,8000a404 <dhcp_release_and_stop+0x13c>
8000a2f4:	01842783          	lw	a5,24(s0)
8000a2f8:	00042e23          	sw	zero,28(s0)
8000a2fc:	00042c23          	sw	zero,24(s0)
8000a300:	02042023          	sw	zero,32(s0)
8000a304:	02042223          	sw	zero,36(s0)
8000a308:	02042823          	sw	zero,48(s0)
8000a30c:	02042623          	sw	zero,44(s0)
8000a310:	02042423          	sw	zero,40(s0)
8000a314:	00041723          	sh	zero,14(s0)
8000a318:	00042823          	sw	zero,16(s0)
8000a31c:	00041a23          	sh	zero,20(s0)
8000a320:	00050493          	mv	s1,a0
8000a324:	00f12623          	sw	a5,12(sp)
8000a328:	f69ff0ef          	jal	ra,8000a290 <dhcp_supplied_address>
8000a32c:	0a050463          	beqz	a0,8000a3d4 <dhcp_release_and_stop+0x10c>
8000a330:	00a10693          	addi	a3,sp,10
8000a334:	00700613          	li	a2,7
8000a338:	00040593          	mv	a1,s0
8000a33c:	00048513          	mv	a0,s1
8000a340:	941fe0ef          	jal	ra,80008c80 <dhcp_create_msg>
8000a344:	00050993          	mv	s3,a0
8000a348:	08050663          	beqz	a0,8000a3d4 <dhcp_release_and_stop+0x10c>
8000a34c:	00452903          	lw	s2,4(a0)
8000a350:	00a15783          	lhu	a5,10(sp)
8000a354:	03600693          	li	a3,54
8000a358:	0f090913          	addi	s2,s2,240
8000a35c:	00f90733          	add	a4,s2,a5
8000a360:	00278a13          	addi	s4,a5,2
8000a364:	00178793          	addi	a5,a5,1
8000a368:	01079793          	slli	a5,a5,0x10
8000a36c:	0107d793          	srli	a5,a5,0x10
8000a370:	00d70023          	sb	a3,0(a4)
8000a374:	00f907b3          	add	a5,s2,a5
8000a378:	00400713          	li	a4,4
8000a37c:	00e78023          	sb	a4,0(a5)
8000a380:	00c12503          	lw	a0,12(sp)
8000a384:	010a1a13          	slli	s4,s4,0x10
8000a388:	010a5a13          	srli	s4,s4,0x10
8000a38c:	01411523          	sh	s4,10(sp)
8000a390:	9adfb0ef          	jal	ra,80005d3c <lwip_htonl>
8000a394:	00050613          	mv	a2,a0
8000a398:	00090593          	mv	a1,s2
8000a39c:	000a0513          	mv	a0,s4
8000a3a0:	881fe0ef          	jal	ra,80008c20 <dhcp_option_long>
8000a3a4:	00098613          	mv	a2,s3
8000a3a8:	00090593          	mv	a1,s2
8000a3ac:	00a11523          	sh	a0,10(sp)
8000a3b0:	a75fe0ef          	jal	ra,80008e24 <dhcp_option_trailer>
8000a3b4:	8e41a503          	lw	a0,-1820(gp) # 8000311c <dhcp_pcb>
8000a3b8:	00048713          	mv	a4,s1
8000a3bc:	04300693          	li	a3,67
8000a3c0:	00c10613          	addi	a2,sp,12
8000a3c4:	00098593          	mv	a1,s3
8000a3c8:	d20fe0ef          	jal	ra,800088e8 <udp_sendto_if>
8000a3cc:	00098513          	mv	a0,s3
8000a3d0:	b79fc0ef          	jal	ra,80006f48 <pbuf_free>
8000a3d4:	84818693          	addi	a3,gp,-1976 # 80003080 <ip_addr_any>
8000a3d8:	84818613          	addi	a2,gp,-1976 # 80003080 <ip_addr_any>
8000a3dc:	00048513          	mv	a0,s1
8000a3e0:	84818593          	addi	a1,gp,-1976 # 80003080 <ip_addr_any>
8000a3e4:	c2cfc0ef          	jal	ra,80006810 <netif_set_addr>
8000a3e8:	00000593          	li	a1,0
8000a3ec:	00040513          	mv	a0,s0
8000a3f0:	fe8fe0ef          	jal	ra,80008bd8 <dhcp_set_state>
8000a3f4:	00444783          	lbu	a5,4(s0)
8000a3f8:	00078663          	beqz	a5,8000a404 <dhcp_release_and_stop+0x13c>
8000a3fc:	c60ff0ef          	jal	ra,8000985c <dhcp_dec_pcb_refcount>
8000a400:	00040223          	sb	zero,4(s0)
8000a404:	02c12083          	lw	ra,44(sp)
8000a408:	02812403          	lw	s0,40(sp)
8000a40c:	02412483          	lw	s1,36(sp)
8000a410:	02012903          	lw	s2,32(sp)
8000a414:	01c12983          	lw	s3,28(sp)
8000a418:	01812a03          	lw	s4,24(sp)
8000a41c:	03010113          	addi	sp,sp,48
8000a420:	00008067          	ret

8000a424 <dhcp_start>:
8000a424:	ff010113          	addi	sp,sp,-16
8000a428:	00912223          	sw	s1,4(sp)
8000a42c:	00112623          	sw	ra,12(sp)
8000a430:	00812423          	sw	s0,8(sp)
8000a434:	01212023          	sw	s2,0(sp)
8000a438:	ff000493          	li	s1,-16
8000a43c:	08050263          	beqz	a0,8000a4c0 <dhcp_start+0x9c>
8000a440:	03554783          	lbu	a5,53(a0)
8000a444:	ff000493          	li	s1,-16
8000a448:	0017f793          	andi	a5,a5,1
8000a44c:	06078a63          	beqz	a5,8000a4c0 <dhcp_start+0x9c>
8000a450:	02c55703          	lhu	a4,44(a0)
8000a454:	23f00793          	li	a5,575
8000a458:	02852903          	lw	s2,40(a0)
8000a45c:	00e7e663          	bltu	a5,a4,8000a468 <dhcp_start+0x44>
8000a460:	fff00493          	li	s1,-1
8000a464:	05c0006f          	j	8000a4c0 <dhcp_start+0x9c>
8000a468:	00050413          	mv	s0,a0
8000a46c:	06091863          	bnez	s2,8000a4dc <dhcp_start+0xb8>
8000a470:	03400513          	li	a0,52
8000a474:	8b0fc0ef          	jal	ra,80006524 <lwip_malloc>
8000a478:	00050913          	mv	s2,a0
8000a47c:	fe0502e3          	beqz	a0,8000a460 <dhcp_start+0x3c>
8000a480:	02a42423          	sw	a0,40(s0)
8000a484:	03400613          	li	a2,52
8000a488:	00000593          	li	a1,0
8000a48c:	00090513          	mv	a0,s2
8000a490:	71c020ef          	jal	ra,8000cbac <memset>
8000a494:	a48ff0ef          	jal	ra,800096dc <dhcp_inc_pcb_refcount>
8000a498:	00050493          	mv	s1,a0
8000a49c:	fc0512e3          	bnez	a0,8000a460 <dhcp_start+0x3c>
8000a4a0:	00100793          	li	a5,1
8000a4a4:	00f90223          	sb	a5,4(s2)
8000a4a8:	03544783          	lbu	a5,53(s0)
8000a4ac:	0047f793          	andi	a5,a5,4
8000a4b0:	02079e63          	bnez	a5,8000a4ec <dhcp_start+0xc8>
8000a4b4:	00200593          	li	a1,2
8000a4b8:	00090513          	mv	a0,s2
8000a4bc:	f1cfe0ef          	jal	ra,80008bd8 <dhcp_set_state>
8000a4c0:	00c12083          	lw	ra,12(sp)
8000a4c4:	00812403          	lw	s0,8(sp)
8000a4c8:	00048513          	mv	a0,s1
8000a4cc:	00012903          	lw	s2,0(sp)
8000a4d0:	00412483          	lw	s1,4(sp)
8000a4d4:	01010113          	addi	sp,sp,16
8000a4d8:	00008067          	ret
8000a4dc:	00494783          	lbu	a5,4(s2)
8000a4e0:	fa0782e3          	beqz	a5,8000a484 <dhcp_start+0x60>
8000a4e4:	b78ff0ef          	jal	ra,8000985c <dhcp_dec_pcb_refcount>
8000a4e8:	f9dff06f          	j	8000a484 <dhcp_start+0x60>
8000a4ec:	00040513          	mv	a0,s0
8000a4f0:	e11fe0ef          	jal	ra,80009300 <dhcp_discover>
8000a4f4:	00050493          	mv	s1,a0
8000a4f8:	fc0504e3          	beqz	a0,8000a4c0 <dhcp_start+0x9c>
8000a4fc:	00040513          	mv	a0,s0
8000a500:	dc9ff0ef          	jal	ra,8000a2c8 <dhcp_release_and_stop>
8000a504:	f5dff06f          	j	8000a460 <dhcp_start+0x3c>

8000a508 <dhcp_coarse_tmr>:
8000a508:	fc010113          	addi	sp,sp,-64
8000a50c:	02812c23          	sw	s0,56(sp)
8000a510:	8cc1a403          	lw	s0,-1844(gp) # 80003104 <netif_list>
8000a514:	03312623          	sw	s3,44(sp)
8000a518:	000029b7          	lui	s3,0x2
8000a51c:	03212823          	sw	s2,48(sp)
8000a520:	03412423          	sw	s4,40(sp)
8000a524:	03512223          	sw	s5,36(sp)
8000a528:	03612023          	sw	s6,32(sp)
8000a52c:	01712e23          	sw	s7,28(sp)
8000a530:	02112e23          	sw	ra,60(sp)
8000a534:	02912a23          	sw	s1,52(sp)
8000a538:	01812c23          	sw	s8,24(sp)
8000a53c:	01912a23          	sw	s9,20(sp)
8000a540:	00100913          	li	s2,1
8000a544:	00a00a13          	li	s4,10
8000a548:	43200a93          	li	s5,1074
8000a54c:	71098993          	addi	s3,s3,1808 # 2710 <_stack_size+0x1f10>
8000a550:	02041c63          	bnez	s0,8000a588 <dhcp_coarse_tmr+0x80>
8000a554:	03c12083          	lw	ra,60(sp)
8000a558:	03812403          	lw	s0,56(sp)
8000a55c:	03412483          	lw	s1,52(sp)
8000a560:	03012903          	lw	s2,48(sp)
8000a564:	02c12983          	lw	s3,44(sp)
8000a568:	02812a03          	lw	s4,40(sp)
8000a56c:	02412a83          	lw	s5,36(sp)
8000a570:	02012b03          	lw	s6,32(sp)
8000a574:	01c12b83          	lw	s7,28(sp)
8000a578:	01812c03          	lw	s8,24(sp)
8000a57c:	01412c83          	lw	s9,20(sp)
8000a580:	04010113          	addi	sp,sp,64
8000a584:	00008067          	ret
8000a588:	02842783          	lw	a5,40(s0)
8000a58c:	02078e63          	beqz	a5,8000a5c8 <dhcp_coarse_tmr+0xc0>
8000a590:	0057c703          	lbu	a4,5(a5)
8000a594:	02070a63          	beqz	a4,8000a5c8 <dhcp_coarse_tmr+0xc0>
8000a598:	0147d683          	lhu	a3,20(a5)
8000a59c:	02068a63          	beqz	a3,8000a5d0 <dhcp_coarse_tmr+0xc8>
8000a5a0:	0127d703          	lhu	a4,18(a5)
8000a5a4:	00170713          	addi	a4,a4,1
8000a5a8:	01071713          	slli	a4,a4,0x10
8000a5ac:	01075713          	srli	a4,a4,0x10
8000a5b0:	00e79923          	sh	a4,18(a5)
8000a5b4:	00e69e63          	bne	a3,a4,8000a5d0 <dhcp_coarse_tmr+0xc8>
8000a5b8:	00040513          	mv	a0,s0
8000a5bc:	d0dff0ef          	jal	ra,8000a2c8 <dhcp_release_and_stop>
8000a5c0:	00040513          	mv	a0,s0
8000a5c4:	e61ff0ef          	jal	ra,8000a424 <dhcp_start>
8000a5c8:	00042403          	lw	s0,0(s0)
8000a5cc:	f85ff06f          	j	8000a550 <dhcp_coarse_tmr+0x48>
8000a5d0:	0107d703          	lhu	a4,16(a5)
8000a5d4:	1a070663          	beqz	a4,8000a780 <dhcp_coarse_tmr+0x278>
8000a5d8:	fff70693          	addi	a3,a4,-1
8000a5dc:	00d79823          	sh	a3,16(a5)
8000a5e0:	1b271063          	bne	a4,s2,8000a780 <dhcp_coarse_tmr+0x278>
8000a5e4:	02842c03          	lw	s8,40(s0)
8000a5e8:	005c4783          	lbu	a5,5(s8)
8000a5ec:	fcfa6ee3          	bltu	s4,a5,8000a5c8 <dhcp_coarse_tmr+0xc0>
8000a5f0:	00fad7b3          	srl	a5,s5,a5
8000a5f4:	0017f793          	andi	a5,a5,1
8000a5f8:	fc0788e3          	beqz	a5,8000a5c8 <dhcp_coarse_tmr+0xc0>
8000a5fc:	00400593          	li	a1,4
8000a600:	000c0513          	mv	a0,s8
8000a604:	dd4fe0ef          	jal	ra,80008bd8 <dhcp_set_state>
8000a608:	00e10693          	addi	a3,sp,14
8000a60c:	00300613          	li	a2,3
8000a610:	000c0593          	mv	a1,s8
8000a614:	00040513          	mv	a0,s0
8000a618:	e68fe0ef          	jal	ra,80008c80 <dhcp_create_msg>
8000a61c:	00050c93          	mv	s9,a0
8000a620:	0e050a63          	beqz	a0,8000a714 <dhcp_coarse_tmr+0x20c>
8000a624:	00452483          	lw	s1,4(a0)
8000a628:	00e15783          	lhu	a5,14(sp)
8000a62c:	03900693          	li	a3,57
8000a630:	0f048493          	addi	s1,s1,240
8000a634:	00f48733          	add	a4,s1,a5
8000a638:	00278513          	addi	a0,a5,2
8000a63c:	00178793          	addi	a5,a5,1
8000a640:	01079793          	slli	a5,a5,0x10
8000a644:	0107d793          	srli	a5,a5,0x10
8000a648:	00d70023          	sb	a3,0(a4)
8000a64c:	00f487b3          	add	a5,s1,a5
8000a650:	00200713          	li	a4,2
8000a654:	00e78023          	sb	a4,0(a5)
8000a658:	02c45603          	lhu	a2,44(s0)
8000a65c:	01051513          	slli	a0,a0,0x10
8000a660:	01055513          	srli	a0,a0,0x10
8000a664:	00048593          	mv	a1,s1
8000a668:	00a11723          	sh	a0,14(sp)
8000a66c:	d84fe0ef          	jal	ra,80008bf0 <dhcp_option_short>
8000a670:	00a48733          	add	a4,s1,a0
8000a674:	03700693          	li	a3,55
8000a678:	00d70023          	sb	a3,0(a4)
8000a67c:	00150713          	addi	a4,a0,1
8000a680:	01071713          	slli	a4,a4,0x10
8000a684:	01075713          	srli	a4,a4,0x10
8000a688:	00300693          	li	a3,3
8000a68c:	00e48733          	add	a4,s1,a4
8000a690:	00d70023          	sb	a3,0(a4)
8000a694:	00250713          	addi	a4,a0,2
8000a698:	01071713          	slli	a4,a4,0x10
8000a69c:	01075713          	srli	a4,a4,0x10
8000a6a0:	00e48733          	add	a4,s1,a4
8000a6a4:	01270023          	sb	s2,0(a4)
8000a6a8:	00050793          	mv	a5,a0
8000a6ac:	00350713          	addi	a4,a0,3
8000a6b0:	01071713          	slli	a4,a4,0x10
8000a6b4:	00478793          	addi	a5,a5,4
8000a6b8:	01075713          	srli	a4,a4,0x10
8000a6bc:	01079793          	slli	a5,a5,0x10
8000a6c0:	00e48733          	add	a4,s1,a4
8000a6c4:	00550513          	addi	a0,a0,5
8000a6c8:	0107d793          	srli	a5,a5,0x10
8000a6cc:	00d70023          	sb	a3,0(a4)
8000a6d0:	00f487b3          	add	a5,s1,a5
8000a6d4:	01c00713          	li	a4,28
8000a6d8:	01051513          	slli	a0,a0,0x10
8000a6dc:	00e78023          	sb	a4,0(a5)
8000a6e0:	01055513          	srli	a0,a0,0x10
8000a6e4:	000c8613          	mv	a2,s9
8000a6e8:	00048593          	mv	a1,s1
8000a6ec:	00a11723          	sh	a0,14(sp)
8000a6f0:	f34fe0ef          	jal	ra,80008e24 <dhcp_option_trailer>
8000a6f4:	8e41a503          	lw	a0,-1820(gp) # 8000311c <dhcp_pcb>
8000a6f8:	00040713          	mv	a4,s0
8000a6fc:	04300693          	li	a3,67
8000a700:	84418613          	addi	a2,gp,-1980 # 8000307c <ip_addr_broadcast>
8000a704:	000c8593          	mv	a1,s9
8000a708:	9e0fe0ef          	jal	ra,800088e8 <udp_sendto_if>
8000a70c:	000c8513          	mv	a0,s9
8000a710:	839fc0ef          	jal	ra,80006f48 <pbuf_free>
8000a714:	006c4783          	lbu	a5,6(s8)
8000a718:	0ff00713          	li	a4,255
8000a71c:	00e78663          	beq	a5,a4,8000a728 <dhcp_coarse_tmr+0x220>
8000a720:	00178793          	addi	a5,a5,1
8000a724:	00fc0323          	sb	a5,6(s8)
8000a728:	006c4783          	lbu	a5,6(s8)
8000a72c:	00900713          	li	a4,9
8000a730:	00098513          	mv	a0,s3
8000a734:	02f76063          	bltu	a4,a5,8000a754 <dhcp_coarse_tmr+0x24c>
8000a738:	00579513          	slli	a0,a5,0x5
8000a73c:	40f50533          	sub	a0,a0,a5
8000a740:	00251513          	slli	a0,a0,0x2
8000a744:	00a787b3          	add	a5,a5,a0
8000a748:	00379793          	slli	a5,a5,0x3
8000a74c:	01079513          	slli	a0,a5,0x10
8000a750:	01055513          	srli	a0,a0,0x10
8000a754:	1f400593          	li	a1,500
8000a758:	1f350513          	addi	a0,a0,499
8000a75c:	359020ef          	jal	ra,8000d2b4 <__divsi3>
8000a760:	014c5783          	lhu	a5,20(s8)
8000a764:	012c5703          	lhu	a4,18(s8)
8000a768:	00ac1423          	sh	a0,8(s8)
8000a76c:	40e787b3          	sub	a5,a5,a4
8000a770:	e4f95ce3          	bge	s2,a5,8000a5c8 <dhcp_coarse_tmr+0xc0>
8000a774:	4017d793          	srai	a5,a5,0x1
8000a778:	00fc1823          	sh	a5,16(s8)
8000a77c:	e4dff06f          	j	8000a5c8 <dhcp_coarse_tmr+0xc0>
8000a780:	00e7d703          	lhu	a4,14(a5)
8000a784:	e40702e3          	beqz	a4,8000a5c8 <dhcp_coarse_tmr+0xc0>
8000a788:	fff70693          	addi	a3,a4,-1
8000a78c:	00d79723          	sh	a3,14(a5)
8000a790:	e3271ce3          	bne	a4,s2,8000a5c8 <dhcp_coarse_tmr+0xc0>
8000a794:	02842483          	lw	s1,40(s0)
8000a798:	0054c783          	lbu	a5,5(s1)
8000a79c:	0fb7f713          	andi	a4,a5,251
8000a7a0:	01270463          	beq	a4,s2,8000a7a8 <dhcp_coarse_tmr+0x2a0>
8000a7a4:	e34792e3          	bne	a5,s4,8000a5c8 <dhcp_coarse_tmr+0xc0>
8000a7a8:	00040513          	mv	a0,s0
8000a7ac:	929ff0ef          	jal	ra,8000a0d4 <dhcp_renew>
8000a7b0:	00c4d783          	lhu	a5,12(s1)
8000a7b4:	0124d703          	lhu	a4,18(s1)
8000a7b8:	40e787b3          	sub	a5,a5,a4
8000a7bc:	e0f956e3          	bge	s2,a5,8000a5c8 <dhcp_coarse_tmr+0xc0>
8000a7c0:	4017d793          	srai	a5,a5,0x1
8000a7c4:	00f49723          	sh	a5,14(s1)
8000a7c8:	e01ff06f          	j	8000a5c8 <dhcp_coarse_tmr+0xc0>

8000a7cc <dhcp_fine_tmr>:
8000a7cc:	fe010113          	addi	sp,sp,-32
8000a7d0:	00812c23          	sw	s0,24(sp)
8000a7d4:	8cc1a403          	lw	s0,-1844(gp) # 80003104 <netif_list>
8000a7d8:	00912a23          	sw	s1,20(sp)
8000a7dc:	01212823          	sw	s2,16(sp)
8000a7e0:	01312623          	sw	s3,12(sp)
8000a7e4:	01412423          	sw	s4,8(sp)
8000a7e8:	01512223          	sw	s5,4(sp)
8000a7ec:	01612023          	sw	s6,0(sp)
8000a7f0:	00112e23          	sw	ra,28(sp)
8000a7f4:	00100493          	li	s1,1
8000a7f8:	00c00913          	li	s2,12
8000a7fc:	00600993          	li	s3,6
8000a800:	00800a13          	li	s4,8
8000a804:	00300a93          	li	s5,3
8000a808:	00500b13          	li	s6,5
8000a80c:	02041663          	bnez	s0,8000a838 <dhcp_fine_tmr+0x6c>
8000a810:	01c12083          	lw	ra,28(sp)
8000a814:	01812403          	lw	s0,24(sp)
8000a818:	01412483          	lw	s1,20(sp)
8000a81c:	01012903          	lw	s2,16(sp)
8000a820:	00c12983          	lw	s3,12(sp)
8000a824:	00812a03          	lw	s4,8(sp)
8000a828:	00412a83          	lw	s5,4(sp)
8000a82c:	00012b03          	lw	s6,0(sp)
8000a830:	02010113          	addi	sp,sp,32
8000a834:	00008067          	ret
8000a838:	02842703          	lw	a4,40(s0)
8000a83c:	00070a63          	beqz	a4,8000a850 <dhcp_fine_tmr+0x84>
8000a840:	00875783          	lhu	a5,8(a4)
8000a844:	00f4fa63          	bgeu	s1,a5,8000a858 <dhcp_fine_tmr+0x8c>
8000a848:	fff78793          	addi	a5,a5,-1
8000a84c:	00f71423          	sh	a5,8(a4)
8000a850:	00042403          	lw	s0,0(s0)
8000a854:	fb9ff06f          	j	8000a80c <dhcp_fine_tmr+0x40>
8000a858:	fe979ce3          	bne	a5,s1,8000a850 <dhcp_fine_tmr+0x84>
8000a85c:	00071423          	sh	zero,8(a4)
8000a860:	02842703          	lw	a4,40(s0)
8000a864:	00574783          	lbu	a5,5(a4)
8000a868:	01278463          	beq	a5,s2,8000a870 <dhcp_fine_tmr+0xa4>
8000a86c:	01379863          	bne	a5,s3,8000a87c <dhcp_fine_tmr+0xb0>
8000a870:	00040513          	mv	a0,s0
8000a874:	a8dfe0ef          	jal	ra,80009300 <dhcp_discover>
8000a878:	fd9ff06f          	j	8000a850 <dhcp_fine_tmr+0x84>
8000a87c:	02979463          	bne	a5,s1,8000a8a4 <dhcp_fine_tmr+0xd8>
8000a880:	00674783          	lbu	a5,6(a4)
8000a884:	00040513          	mv	a0,s0
8000a888:	00fb6663          	bltu	s6,a5,8000a894 <dhcp_fine_tmr+0xc8>
8000a88c:	ff8fe0ef          	jal	ra,80009084 <dhcp_select>
8000a890:	fc1ff06f          	j	8000a850 <dhcp_fine_tmr+0x84>
8000a894:	a35ff0ef          	jal	ra,8000a2c8 <dhcp_release_and_stop>
8000a898:	00040513          	mv	a0,s0
8000a89c:	b89ff0ef          	jal	ra,8000a424 <dhcp_start>
8000a8a0:	fb1ff06f          	j	8000a850 <dhcp_fine_tmr+0x84>
8000a8a4:	03479063          	bne	a5,s4,8000a8c4 <dhcp_fine_tmr+0xf8>
8000a8a8:	00674783          	lbu	a5,6(a4)
8000a8ac:	00040513          	mv	a0,s0
8000a8b0:	00f4e663          	bltu	s1,a5,8000a8bc <dhcp_fine_tmr+0xf0>
8000a8b4:	c11fe0ef          	jal	ra,800094c4 <dhcp_check>
8000a8b8:	f99ff06f          	j	8000a850 <dhcp_fine_tmr+0x84>
8000a8bc:	c6dfe0ef          	jal	ra,80009528 <dhcp_bind>
8000a8c0:	f91ff06f          	j	8000a850 <dhcp_fine_tmr+0x84>
8000a8c4:	f95796e3          	bne	a5,s5,8000a850 <dhcp_fine_tmr+0x84>
8000a8c8:	00674783          	lbu	a5,6(a4)
8000a8cc:	00040513          	mv	a0,s0
8000a8d0:	faf4e2e3          	bltu	s1,a5,8000a874 <dhcp_fine_tmr+0xa8>
8000a8d4:	da0fe0ef          	jal	ra,80008e74 <dhcp_reboot>
8000a8d8:	f79ff06f          	j	8000a850 <dhcp_fine_tmr+0x84>

8000a8dc <dhcp_release>:
8000a8dc:	ff010113          	addi	sp,sp,-16
8000a8e0:	00112623          	sw	ra,12(sp)
8000a8e4:	9e5ff0ef          	jal	ra,8000a2c8 <dhcp_release_and_stop>
8000a8e8:	00c12083          	lw	ra,12(sp)
8000a8ec:	00000513          	li	a0,0
8000a8f0:	01010113          	addi	sp,sp,16
8000a8f4:	00008067          	ret

8000a8f8 <dhcp_stop>:
8000a8f8:	9d1ff06f          	j	8000a2c8 <dhcp_release_and_stop>

8000a8fc <etharp_free_entry>:
8000a8fc:	fe010113          	addi	sp,sp,-32
8000a900:	00912a23          	sw	s1,20(sp)
8000a904:	00151493          	slli	s1,a0,0x1
8000a908:	00a48733          	add	a4,s1,a0
8000a90c:	01212823          	sw	s2,16(sp)
8000a910:	00371713          	slli	a4,a4,0x3
8000a914:	b4418913          	addi	s2,gp,-1212 # 8000337c <arp_table>
8000a918:	00812c23          	sw	s0,24(sp)
8000a91c:	01312623          	sw	s3,12(sp)
8000a920:	00112e23          	sw	ra,28(sp)
8000a924:	00e90933          	add	s2,s2,a4
8000a928:	00050993          	mv	s3,a0
8000a92c:	00092503          	lw	a0,0(s2)
8000a930:	b4418413          	addi	s0,gp,-1212 # 8000337c <arp_table>
8000a934:	00050663          	beqz	a0,8000a940 <etharp_free_entry+0x44>
8000a938:	e10fc0ef          	jal	ra,80006f48 <pbuf_free>
8000a93c:	00092023          	sw	zero,0(s2)
8000a940:	01348533          	add	a0,s1,s3
8000a944:	00351513          	slli	a0,a0,0x3
8000a948:	00a40533          	add	a0,s0,a0
8000a94c:	00050a23          	sb	zero,20(a0)
8000a950:	00051923          	sh	zero,18(a0)
8000a954:	00052423          	sw	zero,8(a0)
8000a958:	00052223          	sw	zero,4(a0)
8000a95c:	00600613          	li	a2,6
8000a960:	84c18593          	addi	a1,gp,-1972 # 80003084 <ethzero>
8000a964:	00c50513          	addi	a0,a0,12
8000a968:	67c030ef          	jal	ra,8000dfe4 <memcpy>
8000a96c:	01c12083          	lw	ra,28(sp)
8000a970:	01812403          	lw	s0,24(sp)
8000a974:	01412483          	lw	s1,20(sp)
8000a978:	01012903          	lw	s2,16(sp)
8000a97c:	00c12983          	lw	s3,12(sp)
8000a980:	02010113          	addi	sp,sp,32
8000a984:	00008067          	ret

8000a988 <etharp_find_entry>:
8000a988:	fe010113          	addi	sp,sp,-32
8000a98c:	00812c23          	sw	s0,24(sp)
8000a990:	00912a23          	sw	s1,20(sp)
8000a994:	b4418693          	addi	a3,gp,-1212 # 8000337c <arp_table>
8000a998:	00112e23          	sw	ra,28(sp)
8000a99c:	01212823          	sw	s2,16(sp)
8000a9a0:	01312623          	sw	s3,12(sp)
8000a9a4:	00000293          	li	t0,0
8000a9a8:	00000f93          	li	t6,0
8000a9ac:	00000f13          	li	t5,0
8000a9b0:	00a00313          	li	t1,10
8000a9b4:	00000793          	li	a5,0
8000a9b8:	00a00713          	li	a4,10
8000a9bc:	00a00893          	li	a7,10
8000a9c0:	00a00493          	li	s1,10
8000a9c4:	b4418413          	addi	s0,gp,-1212 # 8000337c <arp_table>
8000a9c8:	00a00e13          	li	t3,10
8000a9cc:	00100393          	li	t2,1
8000a9d0:	0146ce83          	lbu	t4,20(a3)
8000a9d4:	05c71263          	bne	a4,t3,8000aa18 <etharp_find_entry+0x90>
8000a9d8:	100e8463          	beqz	t4,8000aae0 <etharp_find_entry+0x158>
8000a9dc:	00050e63          	beqz	a0,8000a9f8 <etharp_find_entry+0x70>
8000a9e0:	00052903          	lw	s2,0(a0)
8000a9e4:	0046a803          	lw	a6,4(a3)
8000a9e8:	01091863          	bne	s2,a6,8000a9f8 <etharp_find_entry+0x70>
8000a9ec:	0a060a63          	beqz	a2,8000aaa0 <etharp_find_entry+0x118>
8000a9f0:	0086a803          	lw	a6,8(a3)
8000a9f4:	0ac80663          	beq	a6,a2,8000aaa0 <etharp_find_entry+0x118>
8000a9f8:	0126d803          	lhu	a6,18(a3)
8000a9fc:	0c7e9a63          	bne	t4,t2,8000aad0 <etharp_find_entry+0x148>
8000aa00:	0006ae83          	lw	t4,0(a3)
8000aa04:	0a0e8e63          	beqz	t4,8000aac0 <etharp_find_entry+0x138>
8000aa08:	01e86a63          	bltu	a6,t5,8000aa1c <etharp_find_entry+0x94>
8000aa0c:	00080f13          	mv	t5,a6
8000aa10:	00078313          	mv	t1,a5
8000aa14:	0080006f          	j	8000aa1c <etharp_find_entry+0x94>
8000aa18:	fc0e92e3          	bnez	t4,8000a9dc <etharp_find_entry+0x54>
8000aa1c:	00178793          	addi	a5,a5,1
8000aa20:	01079813          	slli	a6,a5,0x10
8000aa24:	01085813          	srli	a6,a6,0x10
8000aa28:	01081793          	slli	a5,a6,0x10
8000aa2c:	01868693          	addi	a3,a3,24
8000aa30:	4107d793          	srai	a5,a5,0x10
8000aa34:	f9c81ee3          	bne	a6,t3,8000a9d0 <etharp_find_entry+0x48>
8000aa38:	00100693          	li	a3,1
8000aa3c:	fff00793          	li	a5,-1
8000aa40:	06d59063          	bne	a1,a3,8000aaa0 <etharp_find_entry+0x118>
8000aa44:	00060993          	mv	s3,a2
8000aa48:	00050913          	mv	s2,a0
8000aa4c:	03c71063          	bne	a4,t3,8000aa6c <etharp_find_entry+0xe4>
8000aa50:	08e89c63          	bne	a7,a4,8000aae8 <etharp_find_entry+0x160>
8000aa54:	01149663          	bne	s1,a7,8000aa60 <etharp_find_entry+0xd8>
8000aa58:	04930463          	beq	t1,s1,8000aaa0 <etharp_find_entry+0x118>
8000aa5c:	00030493          	mv	s1,t1
8000aa60:	00048513          	mv	a0,s1
8000aa64:	e99ff0ef          	jal	ra,8000a8fc <etharp_free_entry>
8000aa68:	00048713          	mv	a4,s1
8000aa6c:	00171793          	slli	a5,a4,0x1
8000aa70:	00090c63          	beqz	s2,8000aa88 <etharp_find_entry+0x100>
8000aa74:	00092603          	lw	a2,0(s2)
8000aa78:	00e786b3          	add	a3,a5,a4
8000aa7c:	00369693          	slli	a3,a3,0x3
8000aa80:	00d406b3          	add	a3,s0,a3
8000aa84:	00c6a223          	sw	a2,4(a3)
8000aa88:	00e787b3          	add	a5,a5,a4
8000aa8c:	00379793          	slli	a5,a5,0x3
8000aa90:	00f407b3          	add	a5,s0,a5
8000aa94:	00079923          	sh	zero,18(a5)
8000aa98:	0137a423          	sw	s3,8(a5)
8000aa9c:	00070793          	mv	a5,a4
8000aaa0:	01c12083          	lw	ra,28(sp)
8000aaa4:	01812403          	lw	s0,24(sp)
8000aaa8:	01412483          	lw	s1,20(sp)
8000aaac:	01012903          	lw	s2,16(sp)
8000aab0:	00c12983          	lw	s3,12(sp)
8000aab4:	00078513          	mv	a0,a5
8000aab8:	02010113          	addi	sp,sp,32
8000aabc:	00008067          	ret
8000aac0:	f5f86ee3          	bltu	a6,t6,8000aa1c <etharp_find_entry+0x94>
8000aac4:	00080f93          	mv	t6,a6
8000aac8:	00078493          	mv	s1,a5
8000aacc:	f51ff06f          	j	8000aa1c <etharp_find_entry+0x94>
8000aad0:	f45866e3          	bltu	a6,t0,8000aa1c <etharp_find_entry+0x94>
8000aad4:	00080293          	mv	t0,a6
8000aad8:	00078893          	mv	a7,a5
8000aadc:	f41ff06f          	j	8000aa1c <etharp_find_entry+0x94>
8000aae0:	00078713          	mv	a4,a5
8000aae4:	f39ff06f          	j	8000aa1c <etharp_find_entry+0x94>
8000aae8:	00088493          	mv	s1,a7
8000aaec:	f75ff06f          	j	8000aa60 <etharp_find_entry+0xd8>

8000aaf0 <etharp_raw>:
8000aaf0:	fc010113          	addi	sp,sp,-64
8000aaf4:	03312623          	sw	s3,44(sp)
8000aaf8:	03412423          	sw	s4,40(sp)
8000aafc:	03512223          	sw	s5,36(sp)
8000ab00:	00050993          	mv	s3,a0
8000ab04:	00058a13          	mv	s4,a1
8000ab08:	00060a93          	mv	s5,a2
8000ab0c:	01c00593          	li	a1,28
8000ab10:	28000613          	li	a2,640
8000ab14:	01000513          	li	a0,16
8000ab18:	02912a23          	sw	s1,52(sp)
8000ab1c:	03612023          	sw	s6,32(sp)
8000ab20:	01712e23          	sw	s7,28(sp)
8000ab24:	01812c23          	sw	s8,24(sp)
8000ab28:	01912a23          	sw	s9,20(sp)
8000ab2c:	01112623          	sw	a7,12(sp)
8000ab30:	02112e23          	sw	ra,60(sp)
8000ab34:	02812c23          	sw	s0,56(sp)
8000ab38:	03212823          	sw	s2,48(sp)
8000ab3c:	00068c93          	mv	s9,a3
8000ab40:	00070b93          	mv	s7,a4
8000ab44:	00078c13          	mv	s8,a5
8000ab48:	00080b13          	mv	s6,a6
8000ab4c:	cd0fc0ef          	jal	ra,8000701c <pbuf_alloc>
8000ab50:	a0418493          	addi	s1,gp,-1532 # 8000323c <lwip_stats>
8000ab54:	00c12883          	lw	a7,12(sp)
8000ab58:	04051463          	bnez	a0,8000aba0 <etharp_raw+0xb0>
8000ab5c:	0484a783          	lw	a5,72(s1)
8000ab60:	fff00513          	li	a0,-1
8000ab64:	00178793          	addi	a5,a5,1
8000ab68:	04f4a423          	sw	a5,72(s1)
8000ab6c:	03c12083          	lw	ra,60(sp)
8000ab70:	03812403          	lw	s0,56(sp)
8000ab74:	03412483          	lw	s1,52(sp)
8000ab78:	03012903          	lw	s2,48(sp)
8000ab7c:	02c12983          	lw	s3,44(sp)
8000ab80:	02812a03          	lw	s4,40(sp)
8000ab84:	02412a83          	lw	s5,36(sp)
8000ab88:	02012b03          	lw	s6,32(sp)
8000ab8c:	01c12b83          	lw	s7,28(sp)
8000ab90:	01812c03          	lw	s8,24(sp)
8000ab94:	01412c83          	lw	s9,20(sp)
8000ab98:	04010113          	addi	sp,sp,64
8000ab9c:	00008067          	ret
8000aba0:	00452403          	lw	s0,4(a0)
8000aba4:	00050913          	mv	s2,a0
8000aba8:	00088513          	mv	a0,a7
8000abac:	978fb0ef          	jal	ra,80005d24 <lwip_htons>
8000abb0:	00a40323          	sb	a0,6(s0)
8000abb4:	00855513          	srli	a0,a0,0x8
8000abb8:	00a403a3          	sb	a0,7(s0)
8000abbc:	00600613          	li	a2,6
8000abc0:	000c8593          	mv	a1,s9
8000abc4:	00840513          	addi	a0,s0,8
8000abc8:	41c030ef          	jal	ra,8000dfe4 <memcpy>
8000abcc:	00600613          	li	a2,6
8000abd0:	000c0593          	mv	a1,s8
8000abd4:	01240513          	addi	a0,s0,18
8000abd8:	40c030ef          	jal	ra,8000dfe4 <memcpy>
8000abdc:	00400613          	li	a2,4
8000abe0:	000b8593          	mv	a1,s7
8000abe4:	00e40513          	addi	a0,s0,14
8000abe8:	3fc030ef          	jal	ra,8000dfe4 <memcpy>
8000abec:	00400613          	li	a2,4
8000abf0:	000b0593          	mv	a1,s6
8000abf4:	01840513          	addi	a0,s0,24
8000abf8:	3ec030ef          	jal	ra,8000dfe4 <memcpy>
8000abfc:	00100793          	li	a5,1
8000ac00:	00f400a3          	sb	a5,1(s0)
8000ac04:	00800793          	li	a5,8
8000ac08:	00f40123          	sb	a5,2(s0)
8000ac0c:	00600793          	li	a5,6
8000ac10:	00f40223          	sb	a5,4(s0)
8000ac14:	00001737          	lui	a4,0x1
8000ac18:	00400793          	li	a5,4
8000ac1c:	00f402a3          	sb	a5,5(s0)
8000ac20:	80670713          	addi	a4,a4,-2042 # 806 <_stack_size+0x6>
8000ac24:	000a8693          	mv	a3,s5
8000ac28:	000a0613          	mv	a2,s4
8000ac2c:	00090593          	mv	a1,s2
8000ac30:	00040023          	sb	zero,0(s0)
8000ac34:	000401a3          	sb	zero,3(s0)
8000ac38:	00098513          	mv	a0,s3
8000ac3c:	695010ef          	jal	ra,8000cad0 <ethernet_output>
8000ac40:	0304a783          	lw	a5,48(s1)
8000ac44:	00090513          	mv	a0,s2
8000ac48:	00178793          	addi	a5,a5,1
8000ac4c:	02f4a823          	sw	a5,48(s1)
8000ac50:	af8fc0ef          	jal	ra,80006f48 <pbuf_free>
8000ac54:	00000513          	li	a0,0
8000ac58:	f15ff06f          	j	8000ab6c <etharp_raw+0x7c>

8000ac5c <etharp_cleanup_netif>:
8000ac5c:	fe010113          	addi	sp,sp,-32
8000ac60:	00812c23          	sw	s0,24(sp)
8000ac64:	00912a23          	sw	s1,20(sp)
8000ac68:	01212823          	sw	s2,16(sp)
8000ac6c:	01312623          	sw	s3,12(sp)
8000ac70:	00112e23          	sw	ra,28(sp)
8000ac74:	00050993          	mv	s3,a0
8000ac78:	b4418413          	addi	s0,gp,-1212 # 8000337c <arp_table>
8000ac7c:	00000493          	li	s1,0
8000ac80:	00a00913          	li	s2,10
8000ac84:	01444783          	lbu	a5,20(s0)
8000ac88:	00078a63          	beqz	a5,8000ac9c <etharp_cleanup_netif+0x40>
8000ac8c:	00842783          	lw	a5,8(s0)
8000ac90:	01379663          	bne	a5,s3,8000ac9c <etharp_cleanup_netif+0x40>
8000ac94:	00048513          	mv	a0,s1
8000ac98:	c65ff0ef          	jal	ra,8000a8fc <etharp_free_entry>
8000ac9c:	00148493          	addi	s1,s1,1
8000aca0:	01840413          	addi	s0,s0,24
8000aca4:	ff2490e3          	bne	s1,s2,8000ac84 <etharp_cleanup_netif+0x28>
8000aca8:	01c12083          	lw	ra,28(sp)
8000acac:	01812403          	lw	s0,24(sp)
8000acb0:	01412483          	lw	s1,20(sp)
8000acb4:	01012903          	lw	s2,16(sp)
8000acb8:	00c12983          	lw	s3,12(sp)
8000acbc:	02010113          	addi	sp,sp,32
8000acc0:	00008067          	ret

8000acc4 <etharp_find_addr>:
8000acc4:	fe010113          	addi	sp,sp,-32
8000acc8:	00058793          	mv	a5,a1
8000accc:	00812c23          	sw	s0,24(sp)
8000acd0:	00200593          	li	a1,2
8000acd4:	00060413          	mv	s0,a2
8000acd8:	00050613          	mv	a2,a0
8000acdc:	00078513          	mv	a0,a5
8000ace0:	00112e23          	sw	ra,28(sp)
8000ace4:	00d12623          	sw	a3,12(sp)
8000ace8:	ca1ff0ef          	jal	ra,8000a988 <etharp_find_entry>
8000acec:	04054863          	bltz	a0,8000ad3c <etharp_find_addr+0x78>
8000acf0:	00151793          	slli	a5,a0,0x1
8000acf4:	00a787b3          	add	a5,a5,a0
8000acf8:	b4418713          	addi	a4,gp,-1212 # 8000337c <arp_table>
8000acfc:	00379793          	slli	a5,a5,0x3
8000ad00:	00f70633          	add	a2,a4,a5
8000ad04:	01464583          	lbu	a1,20(a2)
8000ad08:	00100613          	li	a2,1
8000ad0c:	02b67863          	bgeu	a2,a1,8000ad3c <etharp_find_addr+0x78>
8000ad10:	00c78613          	addi	a2,a5,12
8000ad14:	00c12683          	lw	a3,12(sp)
8000ad18:	00c70633          	add	a2,a4,a2
8000ad1c:	00478793          	addi	a5,a5,4
8000ad20:	00c42023          	sw	a2,0(s0)
8000ad24:	00f707b3          	add	a5,a4,a5
8000ad28:	00f6a023          	sw	a5,0(a3)
8000ad2c:	01c12083          	lw	ra,28(sp)
8000ad30:	01812403          	lw	s0,24(sp)
8000ad34:	02010113          	addi	sp,sp,32
8000ad38:	00008067          	ret
8000ad3c:	fff00513          	li	a0,-1
8000ad40:	fedff06f          	j	8000ad2c <etharp_find_addr+0x68>

8000ad44 <etharp_get_entry>:
8000ad44:	00900793          	li	a5,9
8000ad48:	04a7e863          	bltu	a5,a0,8000ad98 <etharp_get_entry+0x54>
8000ad4c:	00151793          	slli	a5,a0,0x1
8000ad50:	00a787b3          	add	a5,a5,a0
8000ad54:	b4418713          	addi	a4,gp,-1212 # 8000337c <arp_table>
8000ad58:	00379793          	slli	a5,a5,0x3
8000ad5c:	00f70833          	add	a6,a4,a5
8000ad60:	01484303          	lbu	t1,20(a6)
8000ad64:	00100893          	li	a7,1
8000ad68:	00000513          	li	a0,0
8000ad6c:	0268f863          	bgeu	a7,t1,8000ad9c <etharp_get_entry+0x58>
8000ad70:	00478513          	addi	a0,a5,4
8000ad74:	00a70533          	add	a0,a4,a0
8000ad78:	00a5a023          	sw	a0,0(a1)
8000ad7c:	00882583          	lw	a1,8(a6)
8000ad80:	00c78793          	addi	a5,a5,12
8000ad84:	00f707b3          	add	a5,a4,a5
8000ad88:	00b62023          	sw	a1,0(a2)
8000ad8c:	00f6a023          	sw	a5,0(a3)
8000ad90:	00100513          	li	a0,1
8000ad94:	00008067          	ret
8000ad98:	00000513          	li	a0,0
8000ad9c:	00008067          	ret

8000ada0 <etharp_input>:
8000ada0:	22058863          	beqz	a1,8000afd0 <etharp_input+0x230>
8000ada4:	fc010113          	addi	sp,sp,-64
8000ada8:	02812c23          	sw	s0,56(sp)
8000adac:	03212823          	sw	s2,48(sp)
8000adb0:	03312623          	sw	s3,44(sp)
8000adb4:	02112e23          	sw	ra,60(sp)
8000adb8:	02912a23          	sw	s1,52(sp)
8000adbc:	03412423          	sw	s4,40(sp)
8000adc0:	03512223          	sw	s5,36(sp)
8000adc4:	03612023          	sw	s6,32(sp)
8000adc8:	01712e23          	sw	s7,28(sp)
8000adcc:	00452483          	lw	s1,4(a0)
8000add0:	00058413          	mv	s0,a1
8000add4:	0014c783          	lbu	a5,1(s1)
8000add8:	0004c703          	lbu	a4,0(s1)
8000addc:	00050993          	mv	s3,a0
8000ade0:	00879793          	slli	a5,a5,0x8
8000ade4:	00e7e7b3          	or	a5,a5,a4
8000ade8:	10000713          	li	a4,256
8000adec:	a0418913          	addi	s2,gp,-1532 # 8000323c <lwip_stats>
8000adf0:	02e79a63          	bne	a5,a4,8000ae24 <etharp_input+0x84>
8000adf4:	0044c703          	lbu	a4,4(s1)
8000adf8:	00600793          	li	a5,6
8000adfc:	02f71463          	bne	a4,a5,8000ae24 <etharp_input+0x84>
8000ae00:	0054c703          	lbu	a4,5(s1)
8000ae04:	00400793          	li	a5,4
8000ae08:	00f71e63          	bne	a4,a5,8000ae24 <etharp_input+0x84>
8000ae0c:	0034c783          	lbu	a5,3(s1)
8000ae10:	0024c703          	lbu	a4,2(s1)
8000ae14:	00879793          	slli	a5,a5,0x8
8000ae18:	00e7e7b3          	or	a5,a5,a4
8000ae1c:	00800713          	li	a4,8
8000ae20:	04e78863          	beq	a5,a4,8000ae70 <etharp_input+0xd0>
8000ae24:	05092783          	lw	a5,80(s2)
8000ae28:	00178793          	addi	a5,a5,1
8000ae2c:	04f92823          	sw	a5,80(s2)
8000ae30:	03c92783          	lw	a5,60(s2)
8000ae34:	00178793          	addi	a5,a5,1
8000ae38:	02f92e23          	sw	a5,60(s2)
8000ae3c:	00098513          	mv	a0,s3
8000ae40:	908fc0ef          	jal	ra,80006f48 <pbuf_free>
8000ae44:	03c12083          	lw	ra,60(sp)
8000ae48:	03812403          	lw	s0,56(sp)
8000ae4c:	03412483          	lw	s1,52(sp)
8000ae50:	03012903          	lw	s2,48(sp)
8000ae54:	02c12983          	lw	s3,44(sp)
8000ae58:	02812a03          	lw	s4,40(sp)
8000ae5c:	02412a83          	lw	s5,36(sp)
8000ae60:	02012b03          	lw	s6,32(sp)
8000ae64:	01c12b83          	lw	s7,28(sp)
8000ae68:	04010113          	addi	sp,sp,64
8000ae6c:	00008067          	ret
8000ae70:	03492783          	lw	a5,52(s2)
8000ae74:	00400613          	li	a2,4
8000ae78:	00e48593          	addi	a1,s1,14
8000ae7c:	00178793          	addi	a5,a5,1
8000ae80:	00810513          	addi	a0,sp,8
8000ae84:	02f92a23          	sw	a5,52(s2)
8000ae88:	15c030ef          	jal	ra,8000dfe4 <memcpy>
8000ae8c:	00400613          	li	a2,4
8000ae90:	01848593          	addi	a1,s1,24
8000ae94:	00c10513          	addi	a0,sp,12
8000ae98:	14c030ef          	jal	ra,8000dfe4 <memcpy>
8000ae9c:	00442783          	lw	a5,4(s0)
8000aea0:	00848a13          	addi	s4,s1,8
8000aea4:	00078663          	beqz	a5,8000aeb0 <etharp_input+0x110>
8000aea8:	00c12703          	lw	a4,12(sp)
8000aeac:	0ce78e63          	beq	a5,a4,8000af88 <etharp_input+0x1e8>
8000aeb0:	00000a93          	li	s5,0
8000aeb4:	00200b13          	li	s6,2
8000aeb8:	00812503          	lw	a0,8(sp)
8000aebc:	08050e63          	beqz	a0,8000af58 <etharp_input+0x1b8>
8000aec0:	00040593          	mv	a1,s0
8000aec4:	630010ef          	jal	ra,8000c4f4 <ip4_addr_isbroadcast_u32>
8000aec8:	08051863          	bnez	a0,8000af58 <etharp_input+0x1b8>
8000aecc:	00812783          	lw	a5,8(sp)
8000aed0:	0e000713          	li	a4,224
8000aed4:	0f07f793          	andi	a5,a5,240
8000aed8:	08e78063          	beq	a5,a4,8000af58 <etharp_input+0x1b8>
8000aedc:	00040613          	mv	a2,s0
8000aee0:	000b0593          	mv	a1,s6
8000aee4:	00810513          	addi	a0,sp,8
8000aee8:	aa1ff0ef          	jal	ra,8000a988 <etharp_find_entry>
8000aeec:	06054663          	bltz	a0,8000af58 <etharp_input+0x1b8>
8000aef0:	00151793          	slli	a5,a0,0x1
8000aef4:	00a787b3          	add	a5,a5,a0
8000aef8:	b4418713          	addi	a4,gp,-1212 # 8000337c <arp_table>
8000aefc:	00379793          	slli	a5,a5,0x3
8000af00:	00f70b33          	add	s6,a4,a5
8000af04:	00200693          	li	a3,2
8000af08:	00c78793          	addi	a5,a5,12
8000af0c:	00db0a23          	sb	a3,20(s6)
8000af10:	008b2423          	sw	s0,8(s6)
8000af14:	00600613          	li	a2,6
8000af18:	000a0593          	mv	a1,s4
8000af1c:	00f70533          	add	a0,a4,a5
8000af20:	0c4030ef          	jal	ra,8000dfe4 <memcpy>
8000af24:	000b2b83          	lw	s7,0(s6)
8000af28:	000b1923          	sh	zero,18(s6)
8000af2c:	020b8663          	beqz	s7,8000af58 <etharp_input+0x1b8>
8000af30:	00001737          	lui	a4,0x1
8000af34:	000b2023          	sw	zero,0(s6)
8000af38:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000af3c:	000a0693          	mv	a3,s4
8000af40:	02e40613          	addi	a2,s0,46
8000af44:	000b8593          	mv	a1,s7
8000af48:	00040513          	mv	a0,s0
8000af4c:	385010ef          	jal	ra,8000cad0 <ethernet_output>
8000af50:	000b8513          	mv	a0,s7
8000af54:	ff5fb0ef          	jal	ra,80006f48 <pbuf_free>
8000af58:	0074c783          	lbu	a5,7(s1)
8000af5c:	0064c703          	lbu	a4,6(s1)
8000af60:	00879793          	slli	a5,a5,0x8
8000af64:	00e7e7b3          	or	a5,a5,a4
8000af68:	10000713          	li	a4,256
8000af6c:	02e78463          	beq	a5,a4,8000af94 <etharp_input+0x1f4>
8000af70:	20000713          	li	a4,512
8000af74:	04e78663          	beq	a5,a4,8000afc0 <etharp_input+0x220>
8000af78:	05892783          	lw	a5,88(s2)
8000af7c:	00178793          	addi	a5,a5,1
8000af80:	04f92c23          	sw	a5,88(s2)
8000af84:	eb9ff06f          	j	8000ae3c <etharp_input+0x9c>
8000af88:	00100a93          	li	s5,1
8000af8c:	00100b13          	li	s6,1
8000af90:	f29ff06f          	j	8000aeb8 <etharp_input+0x118>
8000af94:	ea0a84e3          	beqz	s5,8000ae3c <etharp_input+0x9c>
8000af98:	02e40693          	addi	a3,s0,46
8000af9c:	00200893          	li	a7,2
8000afa0:	00810813          	addi	a6,sp,8
8000afa4:	000a0793          	mv	a5,s4
8000afa8:	00440713          	addi	a4,s0,4
8000afac:	000a0613          	mv	a2,s4
8000afb0:	00068593          	mv	a1,a3
8000afb4:	00040513          	mv	a0,s0
8000afb8:	b39ff0ef          	jal	ra,8000aaf0 <etharp_raw>
8000afbc:	e81ff06f          	j	8000ae3c <etharp_input+0x9c>
8000afc0:	00810593          	addi	a1,sp,8
8000afc4:	00040513          	mv	a0,s0
8000afc8:	fd5fe0ef          	jal	ra,80009f9c <dhcp_arp_reply>
8000afcc:	e71ff06f          	j	8000ae3c <etharp_input+0x9c>
8000afd0:	00008067          	ret

8000afd4 <etharp_request>:
8000afd4:	02e50693          	addi	a3,a0,46
8000afd8:	00058813          	mv	a6,a1
8000afdc:	00100893          	li	a7,1
8000afe0:	84c18793          	addi	a5,gp,-1972 # 80003084 <ethzero>
8000afe4:	00450713          	addi	a4,a0,4
8000afe8:	85418613          	addi	a2,gp,-1964 # 8000308c <ethbroadcast>
8000afec:	00068593          	mv	a1,a3
8000aff0:	b01ff06f          	j	8000aaf0 <etharp_raw>

8000aff4 <etharp_tmr>:
8000aff4:	fd010113          	addi	sp,sp,-48
8000aff8:	02812423          	sw	s0,40(sp)
8000affc:	02912223          	sw	s1,36(sp)
8000b000:	03212023          	sw	s2,32(sp)
8000b004:	01312e23          	sw	s3,28(sp)
8000b008:	01412c23          	sw	s4,24(sp)
8000b00c:	01512a23          	sw	s5,20(sp)
8000b010:	01612823          	sw	s6,16(sp)
8000b014:	01712623          	sw	s7,12(sp)
8000b018:	02112623          	sw	ra,44(sp)
8000b01c:	b4418413          	addi	s0,gp,-1212 # 8000337c <arp_table>
8000b020:	00000493          	li	s1,0
8000b024:	12b00a13          	li	s4,299
8000b028:	00100a93          	li	s5,1
8000b02c:	00300b13          	li	s6,3
8000b030:	00400913          	li	s2,4
8000b034:	00200b93          	li	s7,2
8000b038:	00a00993          	li	s3,10
8000b03c:	01444703          	lbu	a4,20(s0)
8000b040:	02070663          	beqz	a4,8000b06c <etharp_tmr+0x78>
8000b044:	01245783          	lhu	a5,18(s0)
8000b048:	00178793          	addi	a5,a5,1
8000b04c:	01079793          	slli	a5,a5,0x10
8000b050:	0107d793          	srli	a5,a5,0x10
8000b054:	00f41923          	sh	a5,18(s0)
8000b058:	00fa6663          	bltu	s4,a5,8000b064 <etharp_tmr+0x70>
8000b05c:	05571463          	bne	a4,s5,8000b0a4 <etharp_tmr+0xb0>
8000b060:	04f97e63          	bgeu	s2,a5,8000b0bc <etharp_tmr+0xc8>
8000b064:	00048513          	mv	a0,s1
8000b068:	895ff0ef          	jal	ra,8000a8fc <etharp_free_entry>
8000b06c:	00148493          	addi	s1,s1,1
8000b070:	01840413          	addi	s0,s0,24
8000b074:	fd3494e3          	bne	s1,s3,8000b03c <etharp_tmr+0x48>
8000b078:	02c12083          	lw	ra,44(sp)
8000b07c:	02812403          	lw	s0,40(sp)
8000b080:	02412483          	lw	s1,36(sp)
8000b084:	02012903          	lw	s2,32(sp)
8000b088:	01c12983          	lw	s3,28(sp)
8000b08c:	01812a03          	lw	s4,24(sp)
8000b090:	01412a83          	lw	s5,20(sp)
8000b094:	01012b03          	lw	s6,16(sp)
8000b098:	00c12b83          	lw	s7,12(sp)
8000b09c:	03010113          	addi	sp,sp,48
8000b0a0:	00008067          	ret
8000b0a4:	01671663          	bne	a4,s6,8000b0b0 <etharp_tmr+0xbc>
8000b0a8:	01240a23          	sb	s2,20(s0)
8000b0ac:	fc1ff06f          	j	8000b06c <etharp_tmr+0x78>
8000b0b0:	fb271ee3          	bne	a4,s2,8000b06c <etharp_tmr+0x78>
8000b0b4:	01740a23          	sb	s7,20(s0)
8000b0b8:	fb5ff06f          	j	8000b06c <etharp_tmr+0x78>
8000b0bc:	00842503          	lw	a0,8(s0)
8000b0c0:	00440593          	addi	a1,s0,4
8000b0c4:	f11ff0ef          	jal	ra,8000afd4 <etharp_request>
8000b0c8:	fa5ff06f          	j	8000b06c <etharp_tmr+0x78>

8000b0cc <etharp_output_to_arp_index>:
8000b0cc:	fe010113          	addi	sp,sp,-32
8000b0d0:	01412423          	sw	s4,8(sp)
8000b0d4:	00058a13          	mv	s4,a1
8000b0d8:	00161593          	slli	a1,a2,0x1
8000b0dc:	00c58633          	add	a2,a1,a2
8000b0e0:	00361613          	slli	a2,a2,0x3
8000b0e4:	b4418593          	addi	a1,gp,-1212 # 8000337c <arp_table>
8000b0e8:	00812c23          	sw	s0,24(sp)
8000b0ec:	00912a23          	sw	s1,20(sp)
8000b0f0:	01212823          	sw	s2,16(sp)
8000b0f4:	01312623          	sw	s3,12(sp)
8000b0f8:	00112e23          	sw	ra,28(sp)
8000b0fc:	00c584b3          	add	s1,a1,a2
8000b100:	0144c703          	lbu	a4,20(s1)
8000b104:	00c60413          	addi	s0,a2,12
8000b108:	00200793          	li	a5,2
8000b10c:	00050913          	mv	s2,a0
8000b110:	00858433          	add	s0,a1,s0
8000b114:	02e50993          	addi	s3,a0,46
8000b118:	02f71463          	bne	a4,a5,8000b140 <etharp_output_to_arp_index+0x74>
8000b11c:	0124d783          	lhu	a5,18(s1)
8000b120:	11c00713          	li	a4,284
8000b124:	04f77a63          	bgeu	a4,a5,8000b178 <etharp_output_to_arp_index+0xac>
8000b128:	00460613          	addi	a2,a2,4
8000b12c:	00c585b3          	add	a1,a1,a2
8000b130:	ea5ff0ef          	jal	ra,8000afd4 <etharp_request>
8000b134:	00051663          	bnez	a0,8000b140 <etharp_output_to_arp_index+0x74>
8000b138:	00300793          	li	a5,3
8000b13c:	00f48a23          	sb	a5,20(s1)
8000b140:	00040693          	mv	a3,s0
8000b144:	01812403          	lw	s0,24(sp)
8000b148:	01c12083          	lw	ra,28(sp)
8000b14c:	01412483          	lw	s1,20(sp)
8000b150:	00098613          	mv	a2,s3
8000b154:	000a0593          	mv	a1,s4
8000b158:	00c12983          	lw	s3,12(sp)
8000b15c:	00812a03          	lw	s4,8(sp)
8000b160:	00090513          	mv	a0,s2
8000b164:	01012903          	lw	s2,16(sp)
8000b168:	00001737          	lui	a4,0x1
8000b16c:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b170:	02010113          	addi	sp,sp,32
8000b174:	15d0106f          	j	8000cad0 <ethernet_output>
8000b178:	10d00713          	li	a4,269
8000b17c:	fcf772e3          	bgeu	a4,a5,8000b140 <etharp_output_to_arp_index+0x74>
8000b180:	00460613          	addi	a2,a2,4
8000b184:	00c58833          	add	a6,a1,a2
8000b188:	00100893          	li	a7,1
8000b18c:	84c18793          	addi	a5,gp,-1972 # 80003084 <ethzero>
8000b190:	00450713          	addi	a4,a0,4
8000b194:	00098693          	mv	a3,s3
8000b198:	00040613          	mv	a2,s0
8000b19c:	00098593          	mv	a1,s3
8000b1a0:	951ff0ef          	jal	ra,8000aaf0 <etharp_raw>
8000b1a4:	f91ff06f          	j	8000b134 <etharp_output_to_arp_index+0x68>

8000b1a8 <etharp_query>:
8000b1a8:	fe010113          	addi	sp,sp,-32
8000b1ac:	01512223          	sw	s5,4(sp)
8000b1b0:	00058a93          	mv	s5,a1
8000b1b4:	00912a23          	sw	s1,20(sp)
8000b1b8:	00050593          	mv	a1,a0
8000b1bc:	00050493          	mv	s1,a0
8000b1c0:	000aa503          	lw	a0,0(s5)
8000b1c4:	01312623          	sw	s3,12(sp)
8000b1c8:	00112e23          	sw	ra,28(sp)
8000b1cc:	00812c23          	sw	s0,24(sp)
8000b1d0:	01212823          	sw	s2,16(sp)
8000b1d4:	01412423          	sw	s4,8(sp)
8000b1d8:	00060993          	mv	s3,a2
8000b1dc:	318010ef          	jal	ra,8000c4f4 <ip4_addr_isbroadcast_u32>
8000b1e0:	16051a63          	bnez	a0,8000b354 <etharp_query+0x1ac>
8000b1e4:	000aa783          	lw	a5,0(s5)
8000b1e8:	0e000713          	li	a4,224
8000b1ec:	0f07f693          	andi	a3,a5,240
8000b1f0:	16e68263          	beq	a3,a4,8000b354 <etharp_query+0x1ac>
8000b1f4:	16078063          	beqz	a5,8000b354 <etharp_query+0x1ac>
8000b1f8:	00048613          	mv	a2,s1
8000b1fc:	00100593          	li	a1,1
8000b200:	000a8513          	mv	a0,s5
8000b204:	f84ff0ef          	jal	ra,8000a988 <etharp_find_entry>
8000b208:	02055e63          	bgez	a0,8000b244 <etharp_query+0x9c>
8000b20c:	00098a63          	beqz	s3,8000b220 <etharp_query+0x78>
8000b210:	a0418793          	addi	a5,gp,-1532 # 8000323c <lwip_stats>
8000b214:	0487a703          	lw	a4,72(a5)
8000b218:	00170713          	addi	a4,a4,1
8000b21c:	04e7a423          	sw	a4,72(a5)
8000b220:	01c12083          	lw	ra,28(sp)
8000b224:	01812403          	lw	s0,24(sp)
8000b228:	01412483          	lw	s1,20(sp)
8000b22c:	01012903          	lw	s2,16(sp)
8000b230:	00c12983          	lw	s3,12(sp)
8000b234:	00812a03          	lw	s4,8(sp)
8000b238:	00412a83          	lw	s5,4(sp)
8000b23c:	02010113          	addi	sp,sp,32
8000b240:	00008067          	ret
8000b244:	0ff57413          	andi	s0,a0,255
8000b248:	00141a13          	slli	s4,s0,0x1
8000b24c:	008a0733          	add	a4,s4,s0
8000b250:	b4418793          	addi	a5,gp,-1212 # 8000337c <arp_table>
8000b254:	00371713          	slli	a4,a4,0x3
8000b258:	00e787b3          	add	a5,a5,a4
8000b25c:	0147c703          	lbu	a4,20(a5)
8000b260:	b4418913          	addi	s2,gp,-1212 # 8000337c <arp_table>
8000b264:	08070663          	beqz	a4,8000b2f0 <etharp_query+0x148>
8000b268:	fff00513          	li	a0,-1
8000b26c:	00099a63          	bnez	s3,8000b280 <etharp_query+0xd8>
8000b270:	000a8593          	mv	a1,s5
8000b274:	00048513          	mv	a0,s1
8000b278:	d5dff0ef          	jal	ra,8000afd4 <etharp_request>
8000b27c:	fa0982e3          	beqz	s3,8000b220 <etharp_query+0x78>
8000b280:	008a07b3          	add	a5,s4,s0
8000b284:	00379793          	slli	a5,a5,0x3
8000b288:	00f907b3          	add	a5,s2,a5
8000b28c:	0147c703          	lbu	a4,20(a5)
8000b290:	00100793          	li	a5,1
8000b294:	06e7f663          	bgeu	a5,a4,8000b300 <etharp_query+0x158>
8000b298:	00048863          	beqz	s1,8000b2a8 <etharp_query+0x100>
8000b29c:	03c4a783          	lw	a5,60(s1)
8000b2a0:	00078463          	beqz	a5,8000b2a8 <etharp_query+0x100>
8000b2a4:	00878023          	sb	s0,0(a5)
8000b2a8:	008a06b3          	add	a3,s4,s0
8000b2ac:	00369693          	slli	a3,a3,0x3
8000b2b0:	01812403          	lw	s0,24(sp)
8000b2b4:	00c68693          	addi	a3,a3,12
8000b2b8:	01c12083          	lw	ra,28(sp)
8000b2bc:	00812a03          	lw	s4,8(sp)
8000b2c0:	00412a83          	lw	s5,4(sp)
8000b2c4:	00d906b3          	add	a3,s2,a3
8000b2c8:	02e48613          	addi	a2,s1,46
8000b2cc:	01012903          	lw	s2,16(sp)
8000b2d0:	00098593          	mv	a1,s3
8000b2d4:	00048513          	mv	a0,s1
8000b2d8:	00c12983          	lw	s3,12(sp)
8000b2dc:	01412483          	lw	s1,20(sp)
8000b2e0:	00001737          	lui	a4,0x1
8000b2e4:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b2e8:	02010113          	addi	sp,sp,32
8000b2ec:	7e40106f          	j	8000cad0 <ethernet_output>
8000b2f0:	00100713          	li	a4,1
8000b2f4:	00e78a23          	sb	a4,20(a5)
8000b2f8:	0097a423          	sw	s1,8(a5)
8000b2fc:	f75ff06f          	j	8000b270 <etharp_query+0xc8>
8000b300:	f2f710e3          	bne	a4,a5,8000b220 <etharp_query+0x78>
8000b304:	00098793          	mv	a5,s3
8000b308:	00c7c703          	lbu	a4,12(a5)
8000b30c:	04077713          	andi	a4,a4,64
8000b310:	04071663          	bnez	a4,8000b35c <etharp_query+0x1b4>
8000b314:	0007a783          	lw	a5,0(a5)
8000b318:	fe0798e3          	bnez	a5,8000b308 <etharp_query+0x160>
8000b31c:	00098513          	mv	a0,s3
8000b320:	810fc0ef          	jal	ra,80007330 <pbuf_ref>
8000b324:	008a07b3          	add	a5,s4,s0
8000b328:	00379793          	slli	a5,a5,0x3
8000b32c:	00f907b3          	add	a5,s2,a5
8000b330:	0007a503          	lw	a0,0(a5)
8000b334:	00050463          	beqz	a0,8000b33c <etharp_query+0x194>
8000b338:	c11fb0ef          	jal	ra,80006f48 <pbuf_free>
8000b33c:	008a0433          	add	s0,s4,s0
8000b340:	00341413          	slli	s0,s0,0x3
8000b344:	00890433          	add	s0,s2,s0
8000b348:	01342023          	sw	s3,0(s0)
8000b34c:	00000513          	li	a0,0
8000b350:	ed1ff06f          	j	8000b220 <etharp_query+0x78>
8000b354:	ff000513          	li	a0,-16
8000b358:	ec9ff06f          	j	8000b220 <etharp_query+0x78>
8000b35c:	00098613          	mv	a2,s3
8000b360:	28000593          	li	a1,640
8000b364:	01000513          	li	a0,16
8000b368:	c78fc0ef          	jal	ra,800077e0 <pbuf_clone>
8000b36c:	00050993          	mv	s3,a0
8000b370:	fa051ae3          	bnez	a0,8000b324 <etharp_query+0x17c>
8000b374:	a0418793          	addi	a5,gp,-1532 # 8000323c <lwip_stats>
8000b378:	0487a703          	lw	a4,72(a5)
8000b37c:	fff00513          	li	a0,-1
8000b380:	00170713          	addi	a4,a4,1
8000b384:	04e7a423          	sw	a4,72(a5)
8000b388:	e99ff06f          	j	8000b220 <etharp_query+0x78>

8000b38c <etharp_output>:
8000b38c:	fe010113          	addi	sp,sp,-32
8000b390:	00812c23          	sw	s0,24(sp)
8000b394:	00912a23          	sw	s1,20(sp)
8000b398:	01212823          	sw	s2,16(sp)
8000b39c:	00112e23          	sw	ra,28(sp)
8000b3a0:	00050413          	mv	s0,a0
8000b3a4:	00058913          	mv	s2,a1
8000b3a8:	00050593          	mv	a1,a0
8000b3ac:	00062503          	lw	a0,0(a2)
8000b3b0:	00060493          	mv	s1,a2
8000b3b4:	140010ef          	jal	ra,8000c4f4 <ip4_addr_isbroadcast_u32>
8000b3b8:	16051863          	bnez	a0,8000b528 <etharp_output+0x19c>
8000b3bc:	0004a783          	lw	a5,0(s1)
8000b3c0:	0e000713          	li	a4,224
8000b3c4:	0f07f613          	andi	a2,a5,240
8000b3c8:	04e61863          	bne	a2,a4,8000b418 <etharp_output+0x8c>
8000b3cc:	00100793          	li	a5,1
8000b3d0:	00f11423          	sh	a5,8(sp)
8000b3d4:	05e00793          	li	a5,94
8000b3d8:	00f10523          	sb	a5,10(sp)
8000b3dc:	0014c783          	lbu	a5,1(s1)
8000b3e0:	00810693          	addi	a3,sp,8
8000b3e4:	07f7f793          	andi	a5,a5,127
8000b3e8:	00f105a3          	sb	a5,11(sp)
8000b3ec:	0024c783          	lbu	a5,2(s1)
8000b3f0:	00f10623          	sb	a5,12(sp)
8000b3f4:	0034c783          	lbu	a5,3(s1)
8000b3f8:	00f106a3          	sb	a5,13(sp)
8000b3fc:	00001737          	lui	a4,0x1
8000b400:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b404:	02e40613          	addi	a2,s0,46
8000b408:	00090593          	mv	a1,s2
8000b40c:	00040513          	mv	a0,s0
8000b410:	6c0010ef          	jal	ra,8000cad0 <ethernet_output>
8000b414:	0a40006f          	j	8000b4b8 <etharp_output+0x12c>
8000b418:	00442703          	lw	a4,4(s0)
8000b41c:	00842603          	lw	a2,8(s0)
8000b420:	00050693          	mv	a3,a0
8000b424:	00e7c733          	xor	a4,a5,a4
8000b428:	00c77733          	and	a4,a4,a2
8000b42c:	02070463          	beqz	a4,8000b454 <etharp_output+0xc8>
8000b430:	01079793          	slli	a5,a5,0x10
8000b434:	00010737          	lui	a4,0x10
8000b438:	0107d793          	srli	a5,a5,0x10
8000b43c:	ea970713          	addi	a4,a4,-343 # fea9 <_stack_size+0xf6a9>
8000b440:	00e78a63          	beq	a5,a4,8000b454 <etharp_output+0xc8>
8000b444:	00c42783          	lw	a5,12(s0)
8000b448:	ffc00513          	li	a0,-4
8000b44c:	06078663          	beqz	a5,8000b4b8 <etharp_output+0x12c>
8000b450:	00c40493          	addi	s1,s0,12
8000b454:	03c42583          	lw	a1,60(s0)
8000b458:	b4418793          	addi	a5,gp,-1212 # 8000337c <arp_table>
8000b45c:	06058a63          	beqz	a1,8000b4d0 <etharp_output+0x144>
8000b460:	0005c603          	lbu	a2,0(a1)
8000b464:	00900713          	li	a4,9
8000b468:	06c76463          	bltu	a4,a2,8000b4d0 <etharp_output+0x144>
8000b46c:	00161713          	slli	a4,a2,0x1
8000b470:	00c70733          	add	a4,a4,a2
8000b474:	00371713          	slli	a4,a4,0x3
8000b478:	00e78733          	add	a4,a5,a4
8000b47c:	01474803          	lbu	a6,20(a4)
8000b480:	00100513          	li	a0,1
8000b484:	05057663          	bgeu	a0,a6,8000b4d0 <etharp_output+0x144>
8000b488:	00872503          	lw	a0,8(a4)
8000b48c:	04851263          	bne	a0,s0,8000b4d0 <etharp_output+0x144>
8000b490:	0004a503          	lw	a0,0(s1)
8000b494:	00472703          	lw	a4,4(a4)
8000b498:	02e51c63          	bne	a0,a4,8000b4d0 <etharp_output+0x144>
8000b49c:	a0418793          	addi	a5,gp,-1532 # 8000323c <lwip_stats>
8000b4a0:	05c7a703          	lw	a4,92(a5)
8000b4a4:	00170713          	addi	a4,a4,1
8000b4a8:	04e7ae23          	sw	a4,92(a5)
8000b4ac:	00090593          	mv	a1,s2
8000b4b0:	00040513          	mv	a0,s0
8000b4b4:	c19ff0ef          	jal	ra,8000b0cc <etharp_output_to_arp_index>
8000b4b8:	01c12083          	lw	ra,28(sp)
8000b4bc:	01812403          	lw	s0,24(sp)
8000b4c0:	01412483          	lw	s1,20(sp)
8000b4c4:	01012903          	lw	s2,16(sp)
8000b4c8:	02010113          	addi	sp,sp,32
8000b4cc:	00008067          	ret
8000b4d0:	00100613          	li	a2,1
8000b4d4:	00a00713          	li	a4,10
8000b4d8:	0147c503          	lbu	a0,20(a5)
8000b4dc:	02a67463          	bgeu	a2,a0,8000b504 <etharp_output+0x178>
8000b4e0:	0087a503          	lw	a0,8(a5)
8000b4e4:	02851063          	bne	a0,s0,8000b504 <etharp_output+0x178>
8000b4e8:	0004a803          	lw	a6,0(s1)
8000b4ec:	0047a503          	lw	a0,4(a5)
8000b4f0:	00a81a63          	bne	a6,a0,8000b504 <etharp_output+0x178>
8000b4f4:	00058463          	beqz	a1,8000b4fc <etharp_output+0x170>
8000b4f8:	00d58023          	sb	a3,0(a1)
8000b4fc:	00068613          	mv	a2,a3
8000b500:	fadff06f          	j	8000b4ac <etharp_output+0x120>
8000b504:	00168693          	addi	a3,a3,1
8000b508:	0ff6f693          	andi	a3,a3,255
8000b50c:	01878793          	addi	a5,a5,24
8000b510:	fce694e3          	bne	a3,a4,8000b4d8 <etharp_output+0x14c>
8000b514:	00090613          	mv	a2,s2
8000b518:	00048593          	mv	a1,s1
8000b51c:	00040513          	mv	a0,s0
8000b520:	c89ff0ef          	jal	ra,8000b1a8 <etharp_query>
8000b524:	f95ff06f          	j	8000b4b8 <etharp_output+0x12c>
8000b528:	85418693          	addi	a3,gp,-1964 # 8000308c <ethbroadcast>
8000b52c:	ed1ff06f          	j	8000b3fc <etharp_output+0x70>

8000b530 <icmp_input>:
8000b530:	fd010113          	addi	sp,sp,-48
8000b534:	02912223          	sw	s1,36(sp)
8000b538:	02812423          	sw	s0,40(sp)
8000b53c:	01712623          	sw	s7,12(sp)
8000b540:	02112623          	sw	ra,44(sp)
8000b544:	03212023          	sw	s2,32(sp)
8000b548:	01312e23          	sw	s3,28(sp)
8000b54c:	01412c23          	sw	s4,24(sp)
8000b550:	01512a23          	sw	s5,20(sp)
8000b554:	01612823          	sw	s6,16(sp)
8000b558:	01812423          	sw	s8,8(sp)
8000b55c:	a0418793          	addi	a5,gp,-1532 # 8000323c <lwip_stats>
8000b560:	0c47a703          	lw	a4,196(a5)
8000b564:	00050413          	mv	s0,a0
8000b568:	00170713          	addi	a4,a4,1
8000b56c:	0ce7a223          	sw	a4,196(a5)
8000b570:	9ec18713          	addi	a4,gp,-1556 # 80003224 <ip_data>
8000b574:	00872c03          	lw	s8,8(a4)
8000b578:	01300713          	li	a4,19
8000b57c:	a0418493          	addi	s1,gp,-1532 # 8000323c <lwip_stats>
8000b580:	000c4a83          	lbu	s5,0(s8)
8000b584:	00fafa93          	andi	s5,s5,15
8000b588:	002a9a93          	slli	s5,s5,0x2
8000b58c:	2b577863          	bgeu	a4,s5,8000b83c <icmp_input+0x30c>
8000b590:	00a55683          	lhu	a3,10(a0)
8000b594:	00300713          	li	a4,3
8000b598:	2ad77263          	bgeu	a4,a3,8000b83c <icmp_input+0x30c>
8000b59c:	00452703          	lw	a4,4(a0)
8000b5a0:	00074703          	lbu	a4,0(a4)
8000b5a4:	22070663          	beqz	a4,8000b7d0 <icmp_input+0x2a0>
8000b5a8:	00800693          	li	a3,8
8000b5ac:	26d71a63          	bne	a4,a3,8000b820 <icmp_input+0x2f0>
8000b5b0:	9ec18b93          	addi	s7,gp,-1556 # 80003224 <ip_data>
8000b5b4:	014ba503          	lw	a0,20(s7)
8000b5b8:	0e000793          	li	a5,224
8000b5bc:	00058993          	mv	s3,a1
8000b5c0:	0f057713          	andi	a4,a0,240
8000b5c4:	00458913          	addi	s2,a1,4
8000b5c8:	00f70463          	beq	a4,a5,8000b5d0 <icmp_input+0xa0>
8000b5cc:	a0018913          	addi	s2,gp,-1536 # 80003238 <ip_data+0x14>
8000b5d0:	000ba583          	lw	a1,0(s7)
8000b5d4:	721000ef          	jal	ra,8000c4f4 <ip4_addr_isbroadcast_u32>
8000b5d8:	00050463          	beqz	a0,8000b5e0 <icmp_input+0xb0>
8000b5dc:	00498913          	addi	s2,s3,4
8000b5e0:	00845703          	lhu	a4,8(s0)
8000b5e4:	00700793          	li	a5,7
8000b5e8:	24e7fa63          	bgeu	a5,a4,8000b83c <icmp_input+0x30c>
8000b5ec:	00040513          	mv	a0,s0
8000b5f0:	d4dfa0ef          	jal	ra,8000633c <inet_chksum_pbuf>
8000b5f4:	04050463          	beqz	a0,8000b63c <icmp_input+0x10c>
8000b5f8:	00040513          	mv	a0,s0
8000b5fc:	94dfb0ef          	jal	ra,80006f48 <pbuf_free>
8000b600:	0d04a783          	lw	a5,208(s1)
8000b604:	00178793          	addi	a5,a5,1
8000b608:	0cf4a823          	sw	a5,208(s1)
8000b60c:	02c12083          	lw	ra,44(sp)
8000b610:	02812403          	lw	s0,40(sp)
8000b614:	02412483          	lw	s1,36(sp)
8000b618:	02012903          	lw	s2,32(sp)
8000b61c:	01c12983          	lw	s3,28(sp)
8000b620:	01812a03          	lw	s4,24(sp)
8000b624:	01412a83          	lw	s5,20(sp)
8000b628:	01012b03          	lw	s6,16(sp)
8000b62c:	00c12b83          	lw	s7,12(sp)
8000b630:	00812c03          	lw	s8,8(sp)
8000b634:	03010113          	addi	sp,sp,48
8000b638:	00008067          	ret
8000b63c:	010a8b13          	addi	s6,s5,16
8000b640:	010a9a13          	slli	s4,s5,0x10
8000b644:	000b0593          	mv	a1,s6
8000b648:	00040513          	mv	a0,s0
8000b64c:	010a5a13          	srli	s4,s4,0x10
8000b650:	861fb0ef          	jal	ra,80006eb0 <pbuf_add_header>
8000b654:	1a050863          	beqz	a0,8000b804 <icmp_input+0x2d4>
8000b658:	00845783          	lhu	a5,8(s0)
8000b65c:	014785b3          	add	a1,a5,s4
8000b660:	01059593          	slli	a1,a1,0x10
8000b664:	0105d593          	srli	a1,a1,0x10
8000b668:	02f5e463          	bltu	a1,a5,8000b690 <icmp_input+0x160>
8000b66c:	28000613          	li	a2,640
8000b670:	01000513          	li	a0,16
8000b674:	9a9fb0ef          	jal	ra,8000701c <pbuf_alloc>
8000b678:	00050b13          	mv	s6,a0
8000b67c:	00050a63          	beqz	a0,8000b690 <icmp_input+0x160>
8000b680:	00a55703          	lhu	a4,10(a0)
8000b684:	008a8793          	addi	a5,s5,8
8000b688:	02f77063          	bgeu	a4,a5,8000b6a8 <icmp_input+0x178>
8000b68c:	8bdfb0ef          	jal	ra,80006f48 <pbuf_free>
8000b690:	00040513          	mv	a0,s0
8000b694:	8b5fb0ef          	jal	ra,80006f48 <pbuf_free>
8000b698:	0e84a783          	lw	a5,232(s1)
8000b69c:	00178793          	addi	a5,a5,1
8000b6a0:	0ef4a423          	sw	a5,232(s1)
8000b6a4:	f69ff06f          	j	8000b60c <icmp_input+0xdc>
8000b6a8:	00452503          	lw	a0,4(a0)
8000b6ac:	000c0593          	mv	a1,s8
8000b6b0:	000a8613          	mv	a2,s5
8000b6b4:	131020ef          	jal	ra,8000dfe4 <memcpy>
8000b6b8:	000a8593          	mv	a1,s5
8000b6bc:	000b0513          	mv	a0,s6
8000b6c0:	801fb0ef          	jal	ra,80006ec0 <pbuf_remove_header>
8000b6c4:	00050663          	beqz	a0,8000b6d0 <icmp_input+0x1a0>
8000b6c8:	000b0513          	mv	a0,s6
8000b6cc:	fc1ff06f          	j	8000b68c <icmp_input+0x15c>
8000b6d0:	00040593          	mv	a1,s0
8000b6d4:	000b0513          	mv	a0,s6
8000b6d8:	d45fb0ef          	jal	ra,8000741c <pbuf_copy>
8000b6dc:	fe0516e3          	bnez	a0,8000b6c8 <icmp_input+0x198>
8000b6e0:	00040513          	mv	a0,s0
8000b6e4:	865fb0ef          	jal	ra,80006f48 <pbuf_free>
8000b6e8:	000b0413          	mv	s0,s6
8000b6ec:	000a8593          	mv	a1,s5
8000b6f0:	00040513          	mv	a0,s0
8000b6f4:	00442b03          	lw	s6,4(s0)
8000b6f8:	fb8fb0ef          	jal	ra,80006eb0 <pbuf_add_header>
8000b6fc:	0c051a63          	bnez	a0,8000b7d0 <icmp_input+0x2a0>
8000b700:	00092783          	lw	a5,0(s2)
8000b704:	00442a83          	lw	s5,4(s0)
8000b708:	0087d713          	srli	a4,a5,0x8
8000b70c:	00fa8623          	sb	a5,12(s5)
8000b710:	00ea86a3          	sb	a4,13(s5)
8000b714:	0107d713          	srli	a4,a5,0x10
8000b718:	0187d793          	srli	a5,a5,0x18
8000b71c:	00ea8723          	sb	a4,14(s5)
8000b720:	00fa87a3          	sb	a5,15(s5)
8000b724:	010ba783          	lw	a5,16(s7)
8000b728:	0087d713          	srli	a4,a5,0x8
8000b72c:	00fa8823          	sb	a5,16(s5)
8000b730:	00ea88a3          	sb	a4,17(s5)
8000b734:	0107d713          	srli	a4,a5,0x10
8000b738:	0187d793          	srli	a5,a5,0x18
8000b73c:	00ea8923          	sb	a4,18(s5)
8000b740:	00fa89a3          	sb	a5,19(s5)
8000b744:	003b4783          	lbu	a5,3(s6)
8000b748:	002b4703          	lbu	a4,2(s6)
8000b74c:	000b0023          	sb	zero,0(s6)
8000b750:	00879793          	slli	a5,a5,0x8
8000b754:	00e7e7b3          	or	a5,a5,a4
8000b758:	00010737          	lui	a4,0x10
8000b75c:	ff770713          	addi	a4,a4,-9 # fff7 <_stack_size+0xf7f7>
8000b760:	0af77c63          	bgeu	a4,a5,8000b818 <icmp_input+0x2e8>
8000b764:	00978793          	addi	a5,a5,9
8000b768:	01079793          	slli	a5,a5,0x10
8000b76c:	0107d793          	srli	a5,a5,0x10
8000b770:	00fb0123          	sb	a5,2(s6)
8000b774:	0087d793          	srli	a5,a5,0x8
8000b778:	00fb01a3          	sb	a5,3(s6)
8000b77c:	fff00793          	li	a5,-1
8000b780:	00fa8423          	sb	a5,8(s5)
8000b784:	000a0593          	mv	a1,s4
8000b788:	000a8523          	sb	zero,10(s5)
8000b78c:	000a85a3          	sb	zero,11(s5)
8000b790:	000a8513          	mv	a0,s5
8000b794:	b85fa0ef          	jal	ra,80006318 <inet_chksum>
8000b798:	00aa8523          	sb	a0,10(s5)
8000b79c:	00855513          	srli	a0,a0,0x8
8000b7a0:	00aa85a3          	sb	a0,11(s5)
8000b7a4:	0c04a783          	lw	a5,192(s1)
8000b7a8:	00098813          	mv	a6,s3
8000b7ac:	00000713          	li	a4,0
8000b7b0:	00178793          	addi	a5,a5,1
8000b7b4:	0cf4a023          	sw	a5,192(s1)
8000b7b8:	0ff00693          	li	a3,255
8000b7bc:	00100793          	li	a5,1
8000b7c0:	00000613          	li	a2,0
8000b7c4:	00090593          	mv	a1,s2
8000b7c8:	00040513          	mv	a0,s0
8000b7cc:	3fd000ef          	jal	ra,8000c3c8 <ip4_output_if>
8000b7d0:	00040513          	mv	a0,s0
8000b7d4:	02812403          	lw	s0,40(sp)
8000b7d8:	02c12083          	lw	ra,44(sp)
8000b7dc:	02412483          	lw	s1,36(sp)
8000b7e0:	02012903          	lw	s2,32(sp)
8000b7e4:	01c12983          	lw	s3,28(sp)
8000b7e8:	01812a03          	lw	s4,24(sp)
8000b7ec:	01412a83          	lw	s5,20(sp)
8000b7f0:	01012b03          	lw	s6,16(sp)
8000b7f4:	00c12b83          	lw	s7,12(sp)
8000b7f8:	00812c03          	lw	s8,8(sp)
8000b7fc:	03010113          	addi	sp,sp,48
8000b800:	f48fb06f          	j	80006f48 <pbuf_free>
8000b804:	000b0593          	mv	a1,s6
8000b808:	00040513          	mv	a0,s0
8000b80c:	eb4fb0ef          	jal	ra,80006ec0 <pbuf_remove_header>
8000b810:	ec050ee3          	beqz	a0,8000b6ec <icmp_input+0x1bc>
8000b814:	e7dff06f          	j	8000b690 <icmp_input+0x160>
8000b818:	00878793          	addi	a5,a5,8
8000b81c:	f4dff06f          	j	8000b768 <icmp_input+0x238>
8000b820:	0e07a703          	lw	a4,224(a5)
8000b824:	00170713          	addi	a4,a4,1
8000b828:	0ee7a023          	sw	a4,224(a5)
8000b82c:	0cc7a703          	lw	a4,204(a5)
8000b830:	00170713          	addi	a4,a4,1
8000b834:	0ce7a623          	sw	a4,204(a5)
8000b838:	f99ff06f          	j	8000b7d0 <icmp_input+0x2a0>
8000b83c:	00040513          	mv	a0,s0
8000b840:	f08fb0ef          	jal	ra,80006f48 <pbuf_free>
8000b844:	0d44a783          	lw	a5,212(s1)
8000b848:	00178793          	addi	a5,a5,1
8000b84c:	0cf4aa23          	sw	a5,212(s1)
8000b850:	dbdff06f          	j	8000b60c <icmp_input+0xdc>

8000b854 <icmp_dest_unreach>:
8000b854:	fc010113          	addi	sp,sp,-64
8000b858:	03312623          	sw	s3,44(sp)
8000b85c:	03412423          	sw	s4,40(sp)
8000b860:	00050993          	mv	s3,a0
8000b864:	00058a13          	mv	s4,a1
8000b868:	28000613          	li	a2,640
8000b86c:	02400593          	li	a1,36
8000b870:	02400513          	li	a0,36
8000b874:	02112e23          	sw	ra,60(sp)
8000b878:	02812c23          	sw	s0,56(sp)
8000b87c:	02912a23          	sw	s1,52(sp)
8000b880:	03212823          	sw	s2,48(sp)
8000b884:	f98fb0ef          	jal	ra,8000701c <pbuf_alloc>
8000b888:	0c050a63          	beqz	a0,8000b95c <icmp_dest_unreach+0x108>
8000b88c:	00452403          	lw	s0,4(a0)
8000b890:	00300793          	li	a5,3
8000b894:	0049a903          	lw	s2,4(s3)
8000b898:	00f40023          	sb	a5,0(s0)
8000b89c:	014400a3          	sb	s4,1(s0)
8000b8a0:	00040223          	sb	zero,4(s0)
8000b8a4:	000402a3          	sb	zero,5(s0)
8000b8a8:	00040323          	sb	zero,6(s0)
8000b8ac:	000403a3          	sb	zero,7(s0)
8000b8b0:	00050493          	mv	s1,a0
8000b8b4:	00452503          	lw	a0,4(a0)
8000b8b8:	0049a583          	lw	a1,4(s3)
8000b8bc:	01c00613          	li	a2,28
8000b8c0:	00850513          	addi	a0,a0,8
8000b8c4:	720020ef          	jal	ra,8000dfe4 <memcpy>
8000b8c8:	00d94703          	lbu	a4,13(s2)
8000b8cc:	00c94783          	lbu	a5,12(s2)
8000b8d0:	01c10513          	addi	a0,sp,28
8000b8d4:	00871713          	slli	a4,a4,0x8
8000b8d8:	00f76733          	or	a4,a4,a5
8000b8dc:	00e94783          	lbu	a5,14(s2)
8000b8e0:	01079793          	slli	a5,a5,0x10
8000b8e4:	00e7e733          	or	a4,a5,a4
8000b8e8:	00f94783          	lbu	a5,15(s2)
8000b8ec:	01879793          	slli	a5,a5,0x18
8000b8f0:	00e7e7b3          	or	a5,a5,a4
8000b8f4:	00f12e23          	sw	a5,28(sp)
8000b8f8:	438000ef          	jal	ra,8000bd30 <ip4_route>
8000b8fc:	00a12623          	sw	a0,12(sp)
8000b900:	04050a63          	beqz	a0,8000b954 <icmp_dest_unreach+0x100>
8000b904:	00040123          	sb	zero,2(s0)
8000b908:	000401a3          	sb	zero,3(s0)
8000b90c:	00a4d583          	lhu	a1,10(s1)
8000b910:	00040513          	mv	a0,s0
8000b914:	a05fa0ef          	jal	ra,80006318 <inet_chksum>
8000b918:	00a40123          	sb	a0,2(s0)
8000b91c:	00855513          	srli	a0,a0,0x8
8000b920:	00a401a3          	sb	a0,3(s0)
8000b924:	a0418793          	addi	a5,gp,-1532 # 8000323c <lwip_stats>
8000b928:	0c07a703          	lw	a4,192(a5)
8000b92c:	00c12803          	lw	a6,12(sp)
8000b930:	0ff00693          	li	a3,255
8000b934:	00170713          	addi	a4,a4,1
8000b938:	0ce7a023          	sw	a4,192(a5)
8000b93c:	01c10613          	addi	a2,sp,28
8000b940:	00100793          	li	a5,1
8000b944:	00000713          	li	a4,0
8000b948:	00000593          	li	a1,0
8000b94c:	00048513          	mv	a0,s1
8000b950:	279000ef          	jal	ra,8000c3c8 <ip4_output_if>
8000b954:	00048513          	mv	a0,s1
8000b958:	df0fb0ef          	jal	ra,80006f48 <pbuf_free>
8000b95c:	03c12083          	lw	ra,60(sp)
8000b960:	03812403          	lw	s0,56(sp)
8000b964:	03412483          	lw	s1,52(sp)
8000b968:	03012903          	lw	s2,48(sp)
8000b96c:	02c12983          	lw	s3,44(sp)
8000b970:	02812a03          	lw	s4,40(sp)
8000b974:	04010113          	addi	sp,sp,64
8000b978:	00008067          	ret

8000b97c <ipfrag_free_pbuf_custom>:
8000b97c:	00050593          	mv	a1,a0
8000b980:	01452503          	lw	a0,20(a0)
8000b984:	02050463          	beqz	a0,8000b9ac <ipfrag_free_pbuf_custom+0x30>
8000b988:	fe010113          	addi	sp,sp,-32
8000b98c:	00112e23          	sw	ra,28(sp)
8000b990:	00b12623          	sw	a1,12(sp)
8000b994:	db4fb0ef          	jal	ra,80006f48 <pbuf_free>
8000b998:	00c12583          	lw	a1,12(sp)
8000b99c:	01c12083          	lw	ra,28(sp)
8000b9a0:	00200513          	li	a0,2
8000b9a4:	02010113          	addi	sp,sp,32
8000b9a8:	cedfa06f          	j	80006694 <memp_free>
8000b9ac:	00200513          	li	a0,2
8000b9b0:	ff9ff06f          	j	8000b9a8 <ipfrag_free_pbuf_custom+0x2c>

8000b9b4 <ip4_frag>:
8000b9b4:	fa010113          	addi	sp,sp,-96
8000b9b8:	04112e23          	sw	ra,92(sp)
8000b9bc:	04812c23          	sw	s0,88(sp)
8000b9c0:	04912a23          	sw	s1,84(sp)
8000b9c4:	05212823          	sw	s2,80(sp)
8000b9c8:	05312623          	sw	s3,76(sp)
8000b9cc:	05412423          	sw	s4,72(sp)
8000b9d0:	05512223          	sw	s5,68(sp)
8000b9d4:	05612023          	sw	s6,64(sp)
8000b9d8:	03712e23          	sw	s7,60(sp)
8000b9dc:	03812c23          	sw	s8,56(sp)
8000b9e0:	03912a23          	sw	s9,52(sp)
8000b9e4:	03a12823          	sw	s10,48(sp)
8000b9e8:	03b12623          	sw	s11,44(sp)
8000b9ec:	02c5d783          	lhu	a5,44(a1)
8000b9f0:	00452c03          	lw	s8,4(a0)
8000b9f4:	00c12623          	sw	a2,12(sp)
8000b9f8:	fec78713          	addi	a4,a5,-20
8000b9fc:	41f75793          	srai	a5,a4,0x1f
8000ba00:	0077f793          	andi	a5,a5,7
8000ba04:	00e787b3          	add	a5,a5,a4
8000ba08:	4037d793          	srai	a5,a5,0x3
8000ba0c:	01079793          	slli	a5,a5,0x10
8000ba10:	0107d793          	srli	a5,a5,0x10
8000ba14:	00f12223          	sw	a5,4(sp)
8000ba18:	000c4783          	lbu	a5,0(s8)
8000ba1c:	01400713          	li	a4,20
8000ba20:	00f7f793          	andi	a5,a5,15
8000ba24:	00279793          	slli	a5,a5,0x2
8000ba28:	2ae79663          	bne	a5,a4,8000bcd4 <ip4_frag+0x320>
8000ba2c:	00a55703          	lhu	a4,10(a0)
8000ba30:	01300793          	li	a5,19
8000ba34:	00050413          	mv	s0,a0
8000ba38:	ffa00513          	li	a0,-6
8000ba3c:	06e7fc63          	bgeu	a5,a4,8000bab4 <ip4_frag+0x100>
8000ba40:	007c4783          	lbu	a5,7(s8)
8000ba44:	006c4503          	lbu	a0,6(s8)
8000ba48:	00058c93          	mv	s9,a1
8000ba4c:	00879793          	slli	a5,a5,0x8
8000ba50:	00a7e533          	or	a0,a5,a0
8000ba54:	ad0fa0ef          	jal	ra,80005d24 <lwip_htons>
8000ba58:	000027b7          	lui	a5,0x2
8000ba5c:	00f577b3          	and	a5,a0,a5
8000ba60:	00f12423          	sw	a5,8(sp)
8000ba64:	00412783          	lw	a5,4(sp)
8000ba68:	00845483          	lhu	s1,8(s0)
8000ba6c:	01351b93          	slli	s7,a0,0x13
8000ba70:	00379793          	slli	a5,a5,0x3
8000ba74:	01079793          	slli	a5,a5,0x10
8000ba78:	0107d793          	srli	a5,a5,0x10
8000ba7c:	fec48493          	addi	s1,s1,-20
8000ba80:	00f12023          	sw	a5,0(sp)
8000ba84:	00f11923          	sh	a5,18(sp)
8000ba88:	8000c7b7          	lui	a5,0x8000c
8000ba8c:	01049493          	slli	s1,s1,0x10
8000ba90:	97c78793          	addi	a5,a5,-1668 # 8000b97c <_heap_end+0xffff997c>
8000ba94:	013bdb93          	srli	s7,s7,0x13
8000ba98:	0104d493          	srli	s1,s1,0x10
8000ba9c:	01400a13          	li	s4,20
8000baa0:	00000913          	li	s2,0
8000baa4:	00f12a23          	sw	a5,20(sp)
8000baa8:	a0418d13          	addi	s10,gp,-1532 # 8000323c <lwip_stats>
8000baac:	04049263          	bnez	s1,8000baf0 <ip4_frag+0x13c>
8000bab0:	00000513          	li	a0,0
8000bab4:	05c12083          	lw	ra,92(sp)
8000bab8:	05812403          	lw	s0,88(sp)
8000babc:	05412483          	lw	s1,84(sp)
8000bac0:	05012903          	lw	s2,80(sp)
8000bac4:	04c12983          	lw	s3,76(sp)
8000bac8:	04812a03          	lw	s4,72(sp)
8000bacc:	04412a83          	lw	s5,68(sp)
8000bad0:	04012b03          	lw	s6,64(sp)
8000bad4:	03c12b83          	lw	s7,60(sp)
8000bad8:	03812c03          	lw	s8,56(sp)
8000badc:	03412c83          	lw	s9,52(sp)
8000bae0:	03012d03          	lw	s10,48(sp)
8000bae4:	02c12d83          	lw	s11,44(sp)
8000bae8:	06010113          	addi	sp,sp,96
8000baec:	00008067          	ret
8000baf0:	00012783          	lw	a5,0(sp)
8000baf4:	01215a83          	lhu	s5,18(sp)
8000baf8:	00f4f463          	bgeu	s1,a5,8000bb00 <ip4_frag+0x14c>
8000bafc:	00048a93          	mv	s5,s1
8000bb00:	28000613          	li	a2,640
8000bb04:	01400593          	li	a1,20
8000bb08:	01000513          	li	a0,16
8000bb0c:	010a9a93          	slli	s5,s5,0x10
8000bb10:	d0cfb0ef          	jal	ra,8000701c <pbuf_alloc>
8000bb14:	010ada93          	srli	s5,s5,0x10
8000bb18:	00050b13          	mv	s6,a0
8000bb1c:	06050a63          	beqz	a0,8000bb90 <ip4_frag+0x1dc>
8000bb20:	00452503          	lw	a0,4(a0)
8000bb24:	01400613          	li	a2,20
8000bb28:	000c0593          	mv	a1,s8
8000bb2c:	4b8020ef          	jal	ra,8000dfe4 <memcpy>
8000bb30:	004b2983          	lw	s3,4(s6)
8000bb34:	000a8d93          	mv	s11,s5
8000bb38:	0c0d8c63          	beqz	s11,8000bc10 <ip4_frag+0x25c>
8000bb3c:	00a45783          	lhu	a5,10(s0)
8000bb40:	414787b3          	sub	a5,a5,s4
8000bb44:	00078913          	mv	s2,a5
8000bb48:	01079793          	slli	a5,a5,0x10
8000bb4c:	0107d793          	srli	a5,a5,0x10
8000bb50:	00fdf463          	bgeu	s11,a5,8000bb58 <ip4_frag+0x1a4>
8000bb54:	000d8913          	mv	s2,s11
8000bb58:	01091913          	slli	s2,s2,0x10
8000bb5c:	01095913          	srli	s2,s2,0x10
8000bb60:	00091863          	bnez	s2,8000bb70 <ip4_frag+0x1bc>
8000bb64:	00042403          	lw	s0,0(s0)
8000bb68:	00000a13          	li	s4,0
8000bb6c:	fcdff06f          	j	8000bb38 <ip4_frag+0x184>
8000bb70:	800037b7          	lui	a5,0x80003
8000bb74:	2bd00613          	li	a2,701
8000bb78:	ce878593          	addi	a1,a5,-792 # 80002ce8 <_heap_end+0xffff0ce8>
8000bb7c:	00200513          	li	a0,2
8000bb80:	addfa0ef          	jal	ra,8000665c <memp_malloc_fn>
8000bb84:	00051a63          	bnez	a0,8000bb98 <ip4_frag+0x1e4>
8000bb88:	000b0513          	mv	a0,s6
8000bb8c:	bbcfb0ef          	jal	ra,80006f48 <pbuf_free>
8000bb90:	fff00513          	li	a0,-1
8000bb94:	f21ff06f          	j	8000bab4 <ip4_frag+0x100>
8000bb98:	00442703          	lw	a4,4(s0)
8000bb9c:	00050693          	mv	a3,a0
8000bba0:	00a12c23          	sw	a0,24(sp)
8000bba4:	00090793          	mv	a5,s2
8000bba8:	01470733          	add	a4,a4,s4
8000bbac:	04100613          	li	a2,65
8000bbb0:	00090593          	mv	a1,s2
8000bbb4:	00000513          	li	a0,0
8000bbb8:	aa4fb0ef          	jal	ra,80006e5c <pbuf_alloced_custom>
8000bbbc:	01812883          	lw	a7,24(sp)
8000bbc0:	00051a63          	bnez	a0,8000bbd4 <ip4_frag+0x220>
8000bbc4:	00088593          	mv	a1,a7
8000bbc8:	00200513          	li	a0,2
8000bbcc:	ac9fa0ef          	jal	ra,80006694 <memp_free>
8000bbd0:	fb9ff06f          	j	8000bb88 <ip4_frag+0x1d4>
8000bbd4:	00a12c23          	sw	a0,24(sp)
8000bbd8:	00040513          	mv	a0,s0
8000bbdc:	01112e23          	sw	a7,28(sp)
8000bbe0:	f50fb0ef          	jal	ra,80007330 <pbuf_ref>
8000bbe4:	01c12883          	lw	a7,28(sp)
8000bbe8:	01412783          	lw	a5,20(sp)
8000bbec:	01812583          	lw	a1,24(sp)
8000bbf0:	0088aa23          	sw	s0,20(a7)
8000bbf4:	00f8a823          	sw	a5,16(a7)
8000bbf8:	000b0513          	mv	a0,s6
8000bbfc:	f6cfb0ef          	jal	ra,80007368 <pbuf_cat>
8000bc00:	412d8833          	sub	a6,s11,s2
8000bc04:	01081d93          	slli	s11,a6,0x10
8000bc08:	010ddd93          	srli	s11,s11,0x10
8000bc0c:	f40d9ce3          	bnez	s11,8000bb64 <ip4_frag+0x1b0>
8000bc10:	02ccd783          	lhu	a5,44(s9)
8000bc14:	01490a33          	add	s4,s2,s4
8000bc18:	010a1a13          	slli	s4,s4,0x10
8000bc1c:	013b9513          	slli	a0,s7,0x13
8000bc20:	fed78793          	addi	a5,a5,-19
8000bc24:	010a5a13          	srli	s4,s4,0x10
8000bc28:	01355513          	srli	a0,a0,0x13
8000bc2c:	00f4d663          	bge	s1,a5,8000bc38 <ip4_frag+0x284>
8000bc30:	00812783          	lw	a5,8(sp)
8000bc34:	00078663          	beqz	a5,8000bc40 <ip4_frag+0x28c>
8000bc38:	000027b7          	lui	a5,0x2
8000bc3c:	00f56533          	or	a0,a0,a5
8000bc40:	8e4fa0ef          	jal	ra,80005d24 <lwip_htons>
8000bc44:	00a98323          	sb	a0,6(s3)
8000bc48:	00855513          	srli	a0,a0,0x8
8000bc4c:	00a983a3          	sb	a0,7(s3)
8000bc50:	014a8513          	addi	a0,s5,20
8000bc54:	01051513          	slli	a0,a0,0x10
8000bc58:	01055513          	srli	a0,a0,0x10
8000bc5c:	8c8fa0ef          	jal	ra,80005d24 <lwip_htons>
8000bc60:	00a98123          	sb	a0,2(s3)
8000bc64:	00855513          	srli	a0,a0,0x8
8000bc68:	00a981a3          	sb	a0,3(s3)
8000bc6c:	01400593          	li	a1,20
8000bc70:	00098523          	sb	zero,10(s3)
8000bc74:	000985a3          	sb	zero,11(s3)
8000bc78:	00098513          	mv	a0,s3
8000bc7c:	e9cfa0ef          	jal	ra,80006318 <inet_chksum>
8000bc80:	00a98523          	sb	a0,10(s3)
8000bc84:	00855513          	srli	a0,a0,0x8
8000bc88:	00a985a3          	sb	a0,11(s3)
8000bc8c:	014ca783          	lw	a5,20(s9)
8000bc90:	00c12603          	lw	a2,12(sp)
8000bc94:	000b0593          	mv	a1,s6
8000bc98:	000c8513          	mv	a0,s9
8000bc9c:	000780e7          	jalr	a5 # 2000 <_stack_size+0x1800>
8000bca0:	060d2783          	lw	a5,96(s10)
8000bca4:	000b0513          	mv	a0,s6
8000bca8:	415484b3          	sub	s1,s1,s5
8000bcac:	00178793          	addi	a5,a5,1
8000bcb0:	06fd2023          	sw	a5,96(s10)
8000bcb4:	a94fb0ef          	jal	ra,80006f48 <pbuf_free>
8000bcb8:	00412783          	lw	a5,4(sp)
8000bcbc:	01049493          	slli	s1,s1,0x10
8000bcc0:	0104d493          	srli	s1,s1,0x10
8000bcc4:	00fb8bb3          	add	s7,s7,a5
8000bcc8:	010b9b93          	slli	s7,s7,0x10
8000bccc:	010bdb93          	srli	s7,s7,0x10
8000bcd0:	dddff06f          	j	8000baac <ip4_frag+0xf8>
8000bcd4:	ffa00513          	li	a0,-6
8000bcd8:	dddff06f          	j	8000bab4 <ip4_frag+0x100>

8000bcdc <ip4_input_accept>:
8000bcdc:	03554783          	lbu	a5,53(a0)
8000bce0:	0017f793          	andi	a5,a5,1
8000bce4:	04078063          	beqz	a5,8000bd24 <ip4_input_accept+0x48>
8000bce8:	00452703          	lw	a4,4(a0)
8000bcec:	00050593          	mv	a1,a0
8000bcf0:	00000513          	li	a0,0
8000bcf4:	02070c63          	beqz	a4,8000bd2c <ip4_input_accept+0x50>
8000bcf8:	a001a783          	lw	a5,-1536(gp) # 80003238 <ip_data+0x14>
8000bcfc:	00100513          	li	a0,1
8000bd00:	02f70663          	beq	a4,a5,8000bd2c <ip4_input_accept+0x50>
8000bd04:	ff010113          	addi	sp,sp,-16
8000bd08:	00078513          	mv	a0,a5
8000bd0c:	00112623          	sw	ra,12(sp)
8000bd10:	7e4000ef          	jal	ra,8000c4f4 <ip4_addr_isbroadcast_u32>
8000bd14:	00c12083          	lw	ra,12(sp)
8000bd18:	00a03533          	snez	a0,a0
8000bd1c:	01010113          	addi	sp,sp,16
8000bd20:	00008067          	ret
8000bd24:	00000513          	li	a0,0
8000bd28:	00008067          	ret
8000bd2c:	00008067          	ret

8000bd30 <ip4_route>:
8000bd30:	8cc1a783          	lw	a5,-1844(gp) # 80003104 <netif_list>
8000bd34:	04079463          	bnez	a5,8000bd7c <ip4_route+0x4c>
8000bd38:	8c81a703          	lw	a4,-1848(gp) # 80003100 <netif_default>
8000bd3c:	02070463          	beqz	a4,8000bd64 <ip4_route+0x34>
8000bd40:	03574683          	lbu	a3,53(a4)
8000bd44:	00500613          	li	a2,5
8000bd48:	0056f693          	andi	a3,a3,5
8000bd4c:	00c69c63          	bne	a3,a2,8000bd64 <ip4_route+0x34>
8000bd50:	00472683          	lw	a3,4(a4)
8000bd54:	00068863          	beqz	a3,8000bd64 <ip4_route+0x34>
8000bd58:	00054603          	lbu	a2,0(a0)
8000bd5c:	07f00693          	li	a3,127
8000bd60:	06d61463          	bne	a2,a3,8000bdc8 <ip4_route+0x98>
8000bd64:	a0418713          	addi	a4,gp,-1532 # 8000323c <lwip_stats>
8000bd68:	0ac72683          	lw	a3,172(a4)
8000bd6c:	00168693          	addi	a3,a3,1
8000bd70:	0ad72623          	sw	a3,172(a4)
8000bd74:	00078513          	mv	a0,a5
8000bd78:	00008067          	ret
8000bd7c:	0357c683          	lbu	a3,53(a5)
8000bd80:	0016f713          	andi	a4,a3,1
8000bd84:	02070e63          	beqz	a4,8000bdc0 <ip4_route+0x90>
8000bd88:	0026d713          	srli	a4,a3,0x2
8000bd8c:	00177713          	andi	a4,a4,1
8000bd90:	02070863          	beqz	a4,8000bdc0 <ip4_route+0x90>
8000bd94:	0047a703          	lw	a4,4(a5)
8000bd98:	02070463          	beqz	a4,8000bdc0 <ip4_route+0x90>
8000bd9c:	00052603          	lw	a2,0(a0)
8000bda0:	0087a583          	lw	a1,8(a5)
8000bda4:	00c74733          	xor	a4,a4,a2
8000bda8:	00b77733          	and	a4,a4,a1
8000bdac:	fc0704e3          	beqz	a4,8000bd74 <ip4_route+0x44>
8000bdb0:	0026f693          	andi	a3,a3,2
8000bdb4:	00069663          	bnez	a3,8000bdc0 <ip4_route+0x90>
8000bdb8:	00c7a703          	lw	a4,12(a5)
8000bdbc:	fae60ce3          	beq	a2,a4,8000bd74 <ip4_route+0x44>
8000bdc0:	0007a783          	lw	a5,0(a5)
8000bdc4:	f71ff06f          	j	8000bd34 <ip4_route+0x4>
8000bdc8:	00070793          	mv	a5,a4
8000bdcc:	fa9ff06f          	j	8000bd74 <ip4_route+0x44>

8000bdd0 <ip4_input>:
8000bdd0:	fd010113          	addi	sp,sp,-48
8000bdd4:	02812423          	sw	s0,40(sp)
8000bdd8:	03212023          	sw	s2,32(sp)
8000bddc:	02112623          	sw	ra,44(sp)
8000bde0:	02912223          	sw	s1,36(sp)
8000bde4:	01312e23          	sw	s3,28(sp)
8000bde8:	01412c23          	sw	s4,24(sp)
8000bdec:	01512a23          	sw	s5,20(sp)
8000bdf0:	01612823          	sw	s6,16(sp)
8000bdf4:	01712623          	sw	s7,12(sp)
8000bdf8:	01812423          	sw	s8,8(sp)
8000bdfc:	a0418913          	addi	s2,gp,-1532 # 8000323c <lwip_stats>
8000be00:	09492783          	lw	a5,148(s2)
8000be04:	00178793          	addi	a5,a5,1
8000be08:	08f92a23          	sw	a5,148(s2)
8000be0c:	00452483          	lw	s1,4(a0)
8000be10:	00400793          	li	a5,4
8000be14:	0004cb03          	lbu	s6,0(s1)
8000be18:	004b5713          	srli	a4,s6,0x4
8000be1c:	04f70a63          	beq	a4,a5,8000be70 <ip4_input+0xa0>
8000be20:	928fb0ef          	jal	ra,80006f48 <pbuf_free>
8000be24:	0b892783          	lw	a5,184(s2)
8000be28:	00178793          	addi	a5,a5,1
8000be2c:	0af92c23          	sw	a5,184(s2)
8000be30:	09c92783          	lw	a5,156(s2)
8000be34:	00178793          	addi	a5,a5,1
8000be38:	08f92e23          	sw	a5,156(s2)
8000be3c:	02c12083          	lw	ra,44(sp)
8000be40:	02812403          	lw	s0,40(sp)
8000be44:	02412483          	lw	s1,36(sp)
8000be48:	02012903          	lw	s2,32(sp)
8000be4c:	01c12983          	lw	s3,28(sp)
8000be50:	01812a03          	lw	s4,24(sp)
8000be54:	01412a83          	lw	s5,20(sp)
8000be58:	01012b03          	lw	s6,16(sp)
8000be5c:	00c12b83          	lw	s7,12(sp)
8000be60:	00812c03          	lw	s8,8(sp)
8000be64:	00000513          	li	a0,0
8000be68:	03010113          	addi	sp,sp,48
8000be6c:	00008067          	ret
8000be70:	0034c783          	lbu	a5,3(s1)
8000be74:	00050993          	mv	s3,a0
8000be78:	0024c503          	lbu	a0,2(s1)
8000be7c:	00879793          	slli	a5,a5,0x8
8000be80:	00058a93          	mv	s5,a1
8000be84:	00a7e533          	or	a0,a5,a0
8000be88:	e9df90ef          	jal	ra,80005d24 <lwip_htons>
8000be8c:	00fb7b13          	andi	s6,s6,15
8000be90:	0089d783          	lhu	a5,8(s3)
8000be94:	002b1b13          	slli	s6,s6,0x2
8000be98:	010b1913          	slli	s2,s6,0x10
8000be9c:	a0418413          	addi	s0,gp,-1532 # 8000323c <lwip_stats>
8000bea0:	01095913          	srli	s2,s2,0x10
8000bea4:	00050a13          	mv	s4,a0
8000bea8:	00f57863          	bgeu	a0,a5,8000beb8 <ip4_input+0xe8>
8000beac:	00050593          	mv	a1,a0
8000beb0:	00098513          	mv	a0,s3
8000beb4:	b38fb0ef          	jal	ra,800071ec <pbuf_realloc>
8000beb8:	00a9d783          	lhu	a5,10(s3)
8000bebc:	0127ea63          	bltu	a5,s2,8000bed0 <ip4_input+0x100>
8000bec0:	0089d783          	lhu	a5,8(s3)
8000bec4:	0147e663          	bltu	a5,s4,8000bed0 <ip4_input+0x100>
8000bec8:	01300793          	li	a5,19
8000becc:	0327e463          	bltu	a5,s2,8000bef4 <ip4_input+0x124>
8000bed0:	00098513          	mv	a0,s3
8000bed4:	874fb0ef          	jal	ra,80006f48 <pbuf_free>
8000bed8:	0a442783          	lw	a5,164(s0)
8000bedc:	00178793          	addi	a5,a5,1
8000bee0:	0af42223          	sw	a5,164(s0)
8000bee4:	09c42783          	lw	a5,156(s0)
8000bee8:	00178793          	addi	a5,a5,1
8000beec:	08f42e23          	sw	a5,156(s0)
8000bef0:	f4dff06f          	j	8000be3c <ip4_input+0x6c>
8000bef4:	00090593          	mv	a1,s2
8000bef8:	00048513          	mv	a0,s1
8000befc:	c1cfa0ef          	jal	ra,80006318 <inet_chksum>
8000bf00:	00050e63          	beqz	a0,8000bf1c <ip4_input+0x14c>
8000bf04:	00098513          	mv	a0,s3
8000bf08:	840fb0ef          	jal	ra,80006f48 <pbuf_free>
8000bf0c:	0a042783          	lw	a5,160(s0)
8000bf10:	00178793          	addi	a5,a5,1
8000bf14:	0af42023          	sw	a5,160(s0)
8000bf18:	fcdff06f          	j	8000bee4 <ip4_input+0x114>
8000bf1c:	0114c703          	lbu	a4,17(s1)
8000bf20:	0104c783          	lbu	a5,16(s1)
8000bf24:	00871713          	slli	a4,a4,0x8
8000bf28:	00f76733          	or	a4,a4,a5
8000bf2c:	0124c783          	lbu	a5,18(s1)
8000bf30:	9ec18613          	addi	a2,gp,-1556 # 80003224 <ip_data>
8000bf34:	9ec18913          	addi	s2,gp,-1556 # 80003224 <ip_data>
8000bf38:	01079793          	slli	a5,a5,0x10
8000bf3c:	00e7e733          	or	a4,a5,a4
8000bf40:	0134c783          	lbu	a5,19(s1)
8000bf44:	01879793          	slli	a5,a5,0x18
8000bf48:	00e7e7b3          	or	a5,a5,a4
8000bf4c:	00f62a23          	sw	a5,20(a2)
8000bf50:	00d4c683          	lbu	a3,13(s1)
8000bf54:	00c4c703          	lbu	a4,12(s1)
8000bf58:	0f07f793          	andi	a5,a5,240
8000bf5c:	00869693          	slli	a3,a3,0x8
8000bf60:	00e6e6b3          	or	a3,a3,a4
8000bf64:	00e4c703          	lbu	a4,14(s1)
8000bf68:	01071713          	slli	a4,a4,0x10
8000bf6c:	00d766b3          	or	a3,a4,a3
8000bf70:	00f4c703          	lbu	a4,15(s1)
8000bf74:	01871713          	slli	a4,a4,0x18
8000bf78:	00d76733          	or	a4,a4,a3
8000bf7c:	00e62823          	sw	a4,16(a2)
8000bf80:	0e000713          	li	a4,224
8000bf84:	06e79063          	bne	a5,a4,8000bfe4 <ip4_input+0x214>
8000bf88:	035ac783          	lbu	a5,53(s5)
8000bf8c:	0017f793          	andi	a5,a5,1
8000bf90:	00079c63          	bnez	a5,8000bfa8 <ip4_input+0x1d8>
8000bf94:	0094c703          	lbu	a4,9(s1)
8000bf98:	01100793          	li	a5,17
8000bf9c:	08f70663          	beq	a4,a5,8000c028 <ip4_input+0x258>
8000bfa0:	00000a13          	li	s4,0
8000bfa4:	0100006f          	j	8000bfb4 <ip4_input+0x1e4>
8000bfa8:	004aa783          	lw	a5,4(s5)
8000bfac:	fe0784e3          	beqz	a5,8000bf94 <ip4_input+0x1c4>
8000bfb0:	000a8a13          	mv	s4,s5
8000bfb4:	01092503          	lw	a0,16(s2)
8000bfb8:	08050a63          	beqz	a0,8000c04c <ip4_input+0x27c>
8000bfbc:	000a8593          	mv	a1,s5
8000bfc0:	534000ef          	jal	ra,8000c4f4 <ip4_addr_isbroadcast_u32>
8000bfc4:	00051a63          	bnez	a0,8000bfd8 <ip4_input+0x208>
8000bfc8:	01092783          	lw	a5,16(s2)
8000bfcc:	0e000713          	li	a4,224
8000bfd0:	0f07f793          	andi	a5,a5,240
8000bfd4:	06e79c63          	bne	a5,a4,8000c04c <ip4_input+0x27c>
8000bfd8:	00098513          	mv	a0,s3
8000bfdc:	f6dfa0ef          	jal	ra,80006f48 <pbuf_free>
8000bfe0:	f05ff06f          	j	8000bee4 <ip4_input+0x114>
8000bfe4:	000a8513          	mv	a0,s5
8000bfe8:	cf5ff0ef          	jal	ra,8000bcdc <ip4_input_accept>
8000bfec:	02051a63          	bnez	a0,8000c020 <ip4_input+0x250>
8000bff0:	01494703          	lbu	a4,20(s2)
8000bff4:	07f00793          	li	a5,127
8000bff8:	f8f70ee3          	beq	a4,a5,8000bf94 <ip4_input+0x1c4>
8000bffc:	8cc1aa03          	lw	s4,-1844(gp) # 80003104 <netif_list>
8000c000:	f80a0ae3          	beqz	s4,8000bf94 <ip4_input+0x1c4>
8000c004:	015a1663          	bne	s4,s5,8000c010 <ip4_input+0x240>
8000c008:	000a2a03          	lw	s4,0(s4)
8000c00c:	ff5ff06f          	j	8000c000 <ip4_input+0x230>
8000c010:	000a0513          	mv	a0,s4
8000c014:	cc9ff0ef          	jal	ra,8000bcdc <ip4_input_accept>
8000c018:	fe0508e3          	beqz	a0,8000c008 <ip4_input+0x238>
8000c01c:	f99ff06f          	j	8000bfb4 <ip4_input+0x1e4>
8000c020:	f80a98e3          	bnez	s5,8000bfb0 <ip4_input+0x1e0>
8000c024:	f71ff06f          	j	8000bf94 <ip4_input+0x1c4>
8000c028:	01648733          	add	a4,s1,s6
8000c02c:	00374783          	lbu	a5,3(a4)
8000c030:	00274683          	lbu	a3,2(a4)
8000c034:	00004737          	lui	a4,0x4
8000c038:	00879793          	slli	a5,a5,0x8
8000c03c:	00d7e7b3          	or	a5,a5,a3
8000c040:	40070713          	addi	a4,a4,1024 # 4400 <_stack_size+0x3c00>
8000c044:	f4e79ee3          	bne	a5,a4,8000bfa0 <ip4_input+0x1d0>
8000c048:	000a8a13          	mv	s4,s5
8000c04c:	000a1e63          	bnez	s4,8000c068 <ip4_input+0x298>
8000c050:	09c42783          	lw	a5,156(s0)
8000c054:	00098513          	mv	a0,s3
8000c058:	00178793          	addi	a5,a5,1
8000c05c:	08f42e23          	sw	a5,156(s0)
8000c060:	ee9fa0ef          	jal	ra,80006f48 <pbuf_free>
8000c064:	dd9ff06f          	j	8000be3c <ip4_input+0x6c>
8000c068:	0064c783          	lbu	a5,6(s1)
8000c06c:	0074c703          	lbu	a4,7(s1)
8000c070:	03f7f793          	andi	a5,a5,63
8000c074:	00871713          	slli	a4,a4,0x8
8000c078:	00e7e7b3          	or	a5,a5,a4
8000c07c:	00078e63          	beqz	a5,8000c098 <ip4_input+0x2c8>
8000c080:	00098513          	mv	a0,s3
8000c084:	ec5fa0ef          	jal	ra,80006f48 <pbuf_free>
8000c088:	0b442783          	lw	a5,180(s0)
8000c08c:	00178793          	addi	a5,a5,1
8000c090:	0af42a23          	sw	a5,180(s0)
8000c094:	e51ff06f          	j	8000bee4 <ip4_input+0x114>
8000c098:	01492023          	sw	s4,0(s2)
8000c09c:	01592223          	sw	s5,4(s2)
8000c0a0:	00992423          	sw	s1,8(s2)
8000c0a4:	0004c783          	lbu	a5,0(s1)
8000c0a8:	000a8593          	mv	a1,s5
8000c0ac:	00098513          	mv	a0,s3
8000c0b0:	00f7f793          	andi	a5,a5,15
8000c0b4:	00279793          	slli	a5,a5,0x2
8000c0b8:	00f91623          	sh	a5,12(s2)
8000c0bc:	00100c13          	li	s8,1
8000c0c0:	a7dfb0ef          	jal	ra,80007b3c <raw_input>
8000c0c4:	00050b93          	mv	s7,a0
8000c0c8:	03850663          	beq	a0,s8,8000c0f4 <ip4_input+0x324>
8000c0cc:	000b0593          	mv	a1,s6
8000c0d0:	00098513          	mv	a0,s3
8000c0d4:	dedfa0ef          	jal	ra,80006ec0 <pbuf_remove_header>
8000c0d8:	0094c783          	lbu	a5,9(s1)
8000c0dc:	03878a63          	beq	a5,s8,8000c110 <ip4_input+0x340>
8000c0e0:	01100713          	li	a4,17
8000c0e4:	02e79e63          	bne	a5,a4,8000c120 <ip4_input+0x350>
8000c0e8:	000a8593          	mv	a1,s5
8000c0ec:	00098513          	mv	a0,s3
8000c0f0:	a40fc0ef          	jal	ra,80008330 <udp_input>
8000c0f4:	00092023          	sw	zero,0(s2)
8000c0f8:	00092223          	sw	zero,4(s2)
8000c0fc:	00092423          	sw	zero,8(s2)
8000c100:	00091623          	sh	zero,12(s2)
8000c104:	00092823          	sw	zero,16(s2)
8000c108:	00092a23          	sw	zero,20(s2)
8000c10c:	d31ff06f          	j	8000be3c <ip4_input+0x6c>
8000c110:	000a8593          	mv	a1,s5
8000c114:	00098513          	mv	a0,s3
8000c118:	c18ff0ef          	jal	ra,8000b530 <icmp_input>
8000c11c:	fd9ff06f          	j	8000c0f4 <ip4_input+0x324>
8000c120:	00200793          	li	a5,2
8000c124:	04fb8a63          	beq	s7,a5,8000c178 <ip4_input+0x3a8>
8000c128:	01492503          	lw	a0,20(s2)
8000c12c:	000a0593          	mv	a1,s4
8000c130:	3c4000ef          	jal	ra,8000c4f4 <ip4_addr_isbroadcast_u32>
8000c134:	02051663          	bnez	a0,8000c160 <ip4_input+0x390>
8000c138:	01492783          	lw	a5,20(s2)
8000c13c:	0e000713          	li	a4,224
8000c140:	0f07f793          	andi	a5,a5,240
8000c144:	00e78e63          	beq	a5,a4,8000c160 <ip4_input+0x390>
8000c148:	000b0593          	mv	a1,s6
8000c14c:	00098513          	mv	a0,s3
8000c150:	de5fa0ef          	jal	ra,80006f34 <pbuf_header_force>
8000c154:	00200593          	li	a1,2
8000c158:	00098513          	mv	a0,s3
8000c15c:	ef8ff0ef          	jal	ra,8000b854 <icmp_dest_unreach>
8000c160:	0b042783          	lw	a5,176(s0)
8000c164:	00178793          	addi	a5,a5,1
8000c168:	0af42823          	sw	a5,176(s0)
8000c16c:	09c42783          	lw	a5,156(s0)
8000c170:	00178793          	addi	a5,a5,1
8000c174:	08f42e23          	sw	a5,156(s0)
8000c178:	00098513          	mv	a0,s3
8000c17c:	dcdfa0ef          	jal	ra,80006f48 <pbuf_free>
8000c180:	f75ff06f          	j	8000c0f4 <ip4_input+0x324>

8000c184 <ip4_output_if_src>:
8000c184:	fc010113          	addi	sp,sp,-64
8000c188:	03212823          	sw	s2,48(sp)
8000c18c:	03412423          	sw	s4,40(sp)
8000c190:	03512223          	sw	s5,36(sp)
8000c194:	02112e23          	sw	ra,60(sp)
8000c198:	02812c23          	sw	s0,56(sp)
8000c19c:	02912a23          	sw	s1,52(sp)
8000c1a0:	03312623          	sw	s3,44(sp)
8000c1a4:	03612023          	sw	s6,32(sp)
8000c1a8:	00d12623          	sw	a3,12(sp)
8000c1ac:	00f12423          	sw	a5,8(sp)
8000c1b0:	00c12223          	sw	a2,4(sp)
8000c1b4:	00050913          	mv	s2,a0
8000c1b8:	00080a13          	mv	s4,a6
8000c1bc:	a0418a93          	addi	s5,gp,-1532 # 8000323c <lwip_stats>
8000c1c0:	1a060863          	beqz	a2,8000c370 <ip4_output_if_src+0x1ec>
8000c1c4:	00058993          	mv	s3,a1
8000c1c8:	01400593          	li	a1,20
8000c1cc:	00070493          	mv	s1,a4
8000c1d0:	ce1fa0ef          	jal	ra,80006eb0 <pbuf_add_header>
8000c1d4:	00412603          	lw	a2,4(sp)
8000c1d8:	00812783          	lw	a5,8(sp)
8000c1dc:	00c12683          	lw	a3,12(sp)
8000c1e0:	02050e63          	beqz	a0,8000c21c <ip4_output_if_src+0x98>
8000c1e4:	0b8aa783          	lw	a5,184(s5)
8000c1e8:	ffe00513          	li	a0,-2
8000c1ec:	00178793          	addi	a5,a5,1
8000c1f0:	0afaac23          	sw	a5,184(s5)
8000c1f4:	03c12083          	lw	ra,60(sp)
8000c1f8:	03812403          	lw	s0,56(sp)
8000c1fc:	03412483          	lw	s1,52(sp)
8000c200:	03012903          	lw	s2,48(sp)
8000c204:	02c12983          	lw	s3,44(sp)
8000c208:	02812a03          	lw	s4,40(sp)
8000c20c:	02412a83          	lw	s5,36(sp)
8000c210:	02012b03          	lw	s6,32(sp)
8000c214:	04010113          	addi	sp,sp,64
8000c218:	00008067          	ret
8000c21c:	00492403          	lw	s0,4(s2)
8000c220:	00c12223          	sw	a2,4(sp)
8000c224:	00d40423          	sb	a3,8(s0)
8000c228:	00f404a3          	sb	a5,9(s0)
8000c22c:	00869693          	slli	a3,a3,0x8
8000c230:	00f6e7b3          	or	a5,a3,a5
8000c234:	00062683          	lw	a3,0(a2)
8000c238:	009400a3          	sb	s1,1(s0)
8000c23c:	00849493          	slli	s1,s1,0x8
8000c240:	0086d593          	srli	a1,a3,0x8
8000c244:	00d40823          	sb	a3,16(s0)
8000c248:	00b408a3          	sb	a1,17(s0)
8000c24c:	0186d513          	srli	a0,a3,0x18
8000c250:	0106d593          	srli	a1,a3,0x10
8000c254:	01069693          	slli	a3,a3,0x10
8000c258:	0106d693          	srli	a3,a3,0x10
8000c25c:	00b686b3          	add	a3,a3,a1
8000c260:	00a409a3          	sb	a0,19(s0)
8000c264:	0454e493          	ori	s1,s1,69
8000c268:	04500513          	li	a0,69
8000c26c:	00b40923          	sb	a1,18(s0)
8000c270:	00a40023          	sb	a0,0(s0)
8000c274:	00d484b3          	add	s1,s1,a3
8000c278:	00879693          	slli	a3,a5,0x8
8000c27c:	4087d793          	srai	a5,a5,0x8
8000c280:	00f6e7b3          	or	a5,a3,a5
8000c284:	00895503          	lhu	a0,8(s2)
8000c288:	01079793          	slli	a5,a5,0x10
8000c28c:	0107d793          	srli	a5,a5,0x10
8000c290:	00f484b3          	add	s1,s1,a5
8000c294:	a91f90ef          	jal	ra,80005d24 <lwip_htons>
8000c298:	00855793          	srli	a5,a0,0x8
8000c29c:	00a40123          	sb	a0,2(s0)
8000c2a0:	009504b3          	add	s1,a0,s1
8000c2a4:	8f01d503          	lhu	a0,-1808(gp) # 80003128 <ip_id>
8000c2a8:	00f401a3          	sb	a5,3(s0)
8000c2ac:	00040323          	sb	zero,6(s0)
8000c2b0:	000403a3          	sb	zero,7(s0)
8000c2b4:	a71f90ef          	jal	ra,80005d24 <lwip_htons>
8000c2b8:	00855793          	srli	a5,a0,0x8
8000c2bc:	00f402a3          	sb	a5,5(s0)
8000c2c0:	8f01d783          	lhu	a5,-1808(gp) # 80003128 <ip_id>
8000c2c4:	00a40223          	sb	a0,4(s0)
8000c2c8:	00412603          	lw	a2,4(sp)
8000c2cc:	00178793          	addi	a5,a5,1
8000c2d0:	8ef19823          	sh	a5,-1808(gp) # 80003128 <ip_id>
8000c2d4:	00950533          	add	a0,a0,s1
8000c2d8:	08099863          	bnez	s3,8000c368 <ip4_output_if_src+0x1e4>
8000c2dc:	8481a703          	lw	a4,-1976(gp) # 80003080 <ip_addr_any>
8000c2e0:	01875693          	srli	a3,a4,0x18
8000c2e4:	00d407a3          	sb	a3,15(s0)
8000c2e8:	000106b7          	lui	a3,0x10
8000c2ec:	00875793          	srli	a5,a4,0x8
8000c2f0:	fff68693          	addi	a3,a3,-1 # ffff <_stack_size+0xf7ff>
8000c2f4:	00e40623          	sb	a4,12(s0)
8000c2f8:	00f406a3          	sb	a5,13(s0)
8000c2fc:	01075793          	srli	a5,a4,0x10
8000c300:	00d77733          	and	a4,a4,a3
8000c304:	00a70733          	add	a4,a4,a0
8000c308:	00e78733          	add	a4,a5,a4
8000c30c:	00f40723          	sb	a5,14(s0)
8000c310:	01075793          	srli	a5,a4,0x10
8000c314:	00d77733          	and	a4,a4,a3
8000c318:	00e78733          	add	a4,a5,a4
8000c31c:	01075793          	srli	a5,a4,0x10
8000c320:	00e787b3          	add	a5,a5,a4
8000c324:	fff7c793          	not	a5,a5
8000c328:	01079793          	slli	a5,a5,0x10
8000c32c:	0107d793          	srli	a5,a5,0x10
8000c330:	00f40523          	sb	a5,10(s0)
8000c334:	0087d793          	srli	a5,a5,0x8
8000c338:	00f405a3          	sb	a5,11(s0)
8000c33c:	090aa783          	lw	a5,144(s5)
8000c340:	00178793          	addi	a5,a5,1
8000c344:	08faa823          	sw	a5,144(s5)
8000c348:	02ca5783          	lhu	a5,44(s4)
8000c34c:	06078463          	beqz	a5,8000c3b4 <ip4_output_if_src+0x230>
8000c350:	00895703          	lhu	a4,8(s2)
8000c354:	06e7f063          	bgeu	a5,a4,8000c3b4 <ip4_output_if_src+0x230>
8000c358:	000a0593          	mv	a1,s4
8000c35c:	00090513          	mv	a0,s2
8000c360:	e54ff0ef          	jal	ra,8000b9b4 <ip4_frag>
8000c364:	e91ff06f          	j	8000c1f4 <ip4_output_if_src+0x70>
8000c368:	0009a703          	lw	a4,0(s3)
8000c36c:	f75ff06f          	j	8000c2e0 <ip4_output_if_src+0x15c>
8000c370:	00a55703          	lhu	a4,10(a0)
8000c374:	01300793          	li	a5,19
8000c378:	e6e7f6e3          	bgeu	a5,a4,8000c1e4 <ip4_output_if_src+0x60>
8000c37c:	00452683          	lw	a3,4(a0)
8000c380:	01c10613          	addi	a2,sp,28
8000c384:	0116c703          	lbu	a4,17(a3)
8000c388:	0106c783          	lbu	a5,16(a3)
8000c38c:	00871713          	slli	a4,a4,0x8
8000c390:	00f76733          	or	a4,a4,a5
8000c394:	0126c783          	lbu	a5,18(a3)
8000c398:	01079793          	slli	a5,a5,0x10
8000c39c:	00e7e733          	or	a4,a5,a4
8000c3a0:	0136c783          	lbu	a5,19(a3)
8000c3a4:	01879793          	slli	a5,a5,0x18
8000c3a8:	00e7e7b3          	or	a5,a5,a4
8000c3ac:	00f12e23          	sw	a5,28(sp)
8000c3b0:	f8dff06f          	j	8000c33c <ip4_output_if_src+0x1b8>
8000c3b4:	014a2783          	lw	a5,20(s4)
8000c3b8:	00090593          	mv	a1,s2
8000c3bc:	000a0513          	mv	a0,s4
8000c3c0:	000780e7          	jalr	a5
8000c3c4:	e31ff06f          	j	8000c1f4 <ip4_output_if_src+0x70>

8000c3c8 <ip4_output_if>:
8000c3c8:	00060a63          	beqz	a2,8000c3dc <ip4_output_if+0x14>
8000c3cc:	00058663          	beqz	a1,8000c3d8 <ip4_output_if+0x10>
8000c3d0:	0005a883          	lw	a7,0(a1)
8000c3d4:	00089463          	bnez	a7,8000c3dc <ip4_output_if+0x14>
8000c3d8:	00480593          	addi	a1,a6,4
8000c3dc:	da9ff06f          	j	8000c184 <ip4_output_if_src>

8000c3e0 <ip4_output>:
8000c3e0:	fd010113          	addi	sp,sp,-48
8000c3e4:	02812423          	sw	s0,40(sp)
8000c3e8:	00050413          	mv	s0,a0
8000c3ec:	00060513          	mv	a0,a2
8000c3f0:	00b12e23          	sw	a1,28(sp)
8000c3f4:	00d12c23          	sw	a3,24(sp)
8000c3f8:	00e12a23          	sw	a4,20(sp)
8000c3fc:	00f12823          	sw	a5,16(sp)
8000c400:	00c12623          	sw	a2,12(sp)
8000c404:	02112623          	sw	ra,44(sp)
8000c408:	929ff0ef          	jal	ra,8000bd30 <ip4_route>
8000c40c:	00c12603          	lw	a2,12(sp)
8000c410:	01012783          	lw	a5,16(sp)
8000c414:	01412703          	lw	a4,20(sp)
8000c418:	01812683          	lw	a3,24(sp)
8000c41c:	01c12583          	lw	a1,28(sp)
8000c420:	00050e63          	beqz	a0,8000c43c <ip4_output+0x5c>
8000c424:	00050813          	mv	a6,a0
8000c428:	00040513          	mv	a0,s0
8000c42c:	02812403          	lw	s0,40(sp)
8000c430:	02c12083          	lw	ra,44(sp)
8000c434:	03010113          	addi	sp,sp,48
8000c438:	f91ff06f          	j	8000c3c8 <ip4_output_if>
8000c43c:	a0418793          	addi	a5,gp,-1532 # 8000323c <lwip_stats>
8000c440:	0ac7a703          	lw	a4,172(a5)
8000c444:	ffc00513          	li	a0,-4
8000c448:	00170713          	addi	a4,a4,1
8000c44c:	0ae7a623          	sw	a4,172(a5)
8000c450:	02c12083          	lw	ra,44(sp)
8000c454:	02812403          	lw	s0,40(sp)
8000c458:	03010113          	addi	sp,sp,48
8000c45c:	00008067          	ret

8000c460 <ip4_output_hinted>:
8000c460:	fd010113          	addi	sp,sp,-48
8000c464:	02912223          	sw	s1,36(sp)
8000c468:	00050493          	mv	s1,a0
8000c46c:	00060513          	mv	a0,a2
8000c470:	00b12e23          	sw	a1,28(sp)
8000c474:	00d12c23          	sw	a3,24(sp)
8000c478:	00e12a23          	sw	a4,20(sp)
8000c47c:	00f12823          	sw	a5,16(sp)
8000c480:	01012623          	sw	a6,12(sp)
8000c484:	00c12423          	sw	a2,8(sp)
8000c488:	02112623          	sw	ra,44(sp)
8000c48c:	02812423          	sw	s0,40(sp)
8000c490:	8a1ff0ef          	jal	ra,8000bd30 <ip4_route>
8000c494:	00812603          	lw	a2,8(sp)
8000c498:	00c12803          	lw	a6,12(sp)
8000c49c:	01012783          	lw	a5,16(sp)
8000c4a0:	01412703          	lw	a4,20(sp)
8000c4a4:	01812683          	lw	a3,24(sp)
8000c4a8:	01c12583          	lw	a1,28(sp)
8000c4ac:	02051663          	bnez	a0,8000c4d8 <ip4_output_hinted+0x78>
8000c4b0:	a0418793          	addi	a5,gp,-1532 # 8000323c <lwip_stats>
8000c4b4:	0ac7a703          	lw	a4,172(a5)
8000c4b8:	ffc00513          	li	a0,-4
8000c4bc:	00170713          	addi	a4,a4,1
8000c4c0:	0ae7a623          	sw	a4,172(a5)
8000c4c4:	02c12083          	lw	ra,44(sp)
8000c4c8:	02812403          	lw	s0,40(sp)
8000c4cc:	02412483          	lw	s1,36(sp)
8000c4d0:	03010113          	addi	sp,sp,48
8000c4d4:	00008067          	ret
8000c4d8:	03052e23          	sw	a6,60(a0)
8000c4dc:	00050413          	mv	s0,a0
8000c4e0:	00050813          	mv	a6,a0
8000c4e4:	00048513          	mv	a0,s1
8000c4e8:	ee1ff0ef          	jal	ra,8000c3c8 <ip4_output_if>
8000c4ec:	02042e23          	sw	zero,60(s0)
8000c4f0:	fd5ff06f          	j	8000c4c4 <ip4_output_hinted+0x64>

8000c4f4 <ip4_addr_isbroadcast_u32>:
8000c4f4:	fff50693          	addi	a3,a0,-1
8000c4f8:	ffd00793          	li	a5,-3
8000c4fc:	00050713          	mv	a4,a0
8000c500:	04d7e063          	bltu	a5,a3,8000c540 <ip4_addr_isbroadcast_u32+0x4c>
8000c504:	0355c783          	lbu	a5,53(a1)
8000c508:	0027f513          	andi	a0,a5,2
8000c50c:	02050c63          	beqz	a0,8000c544 <ip4_addr_isbroadcast_u32+0x50>
8000c510:	0045a783          	lw	a5,4(a1)
8000c514:	00000513          	li	a0,0
8000c518:	02e78663          	beq	a5,a4,8000c544 <ip4_addr_isbroadcast_u32+0x50>
8000c51c:	0085a683          	lw	a3,8(a1)
8000c520:	00e7c7b3          	xor	a5,a5,a4
8000c524:	00d7f7b3          	and	a5,a5,a3
8000c528:	00079e63          	bnez	a5,8000c544 <ip4_addr_isbroadcast_u32+0x50>
8000c52c:	fff6c693          	not	a3,a3
8000c530:	00e6f533          	and	a0,a3,a4
8000c534:	40d50533          	sub	a0,a0,a3
8000c538:	00153513          	seqz	a0,a0
8000c53c:	00008067          	ret
8000c540:	00100513          	li	a0,1
8000c544:	00008067          	ret

8000c548 <ip4_addr_netmask_valid>:
8000c548:	ff010113          	addi	sp,sp,-16
8000c54c:	00112623          	sw	ra,12(sp)
8000c550:	fecf90ef          	jal	ra,80005d3c <lwip_htonl>
8000c554:	02000713          	li	a4,32
8000c558:	800007b7          	lui	a5,0x80000
8000c55c:	00f576b3          	and	a3,a0,a5
8000c560:	02068663          	beqz	a3,8000c58c <ip4_addr_netmask_valid+0x44>
8000c564:	fff70713          	addi	a4,a4,-1
8000c568:	0017d793          	srli	a5,a5,0x1
8000c56c:	fe0718e3          	bnez	a4,8000c55c <ip4_addr_netmask_valid+0x14>
8000c570:	00100513          	li	a0,1
8000c574:	00c12083          	lw	ra,12(sp)
8000c578:	01010113          	addi	sp,sp,16
8000c57c:	00008067          	ret
8000c580:	00a7f733          	and	a4,a5,a0
8000c584:	00071863          	bnez	a4,8000c594 <ip4_addr_netmask_valid+0x4c>
8000c588:	0017d793          	srli	a5,a5,0x1
8000c58c:	fe079ae3          	bnez	a5,8000c580 <ip4_addr_netmask_valid+0x38>
8000c590:	fe1ff06f          	j	8000c570 <ip4_addr_netmask_valid+0x28>
8000c594:	00000513          	li	a0,0
8000c598:	fddff06f          	j	8000c574 <ip4_addr_netmask_valid+0x2c>

8000c59c <ip4addr_aton>:
8000c59c:	fb010113          	addi	sp,sp,-80
8000c5a0:	04812423          	sw	s0,72(sp)
8000c5a4:	05212023          	sw	s2,64(sp)
8000c5a8:	03312e23          	sw	s3,60(sp)
8000c5ac:	03512a23          	sw	s5,52(sp)
8000c5b0:	03712623          	sw	s7,44(sp)
8000c5b4:	03812423          	sw	s8,40(sp)
8000c5b8:	03912223          	sw	s9,36(sp)
8000c5bc:	03a12023          	sw	s10,32(sp)
8000c5c0:	01b12e23          	sw	s11,28(sp)
8000c5c4:	04112623          	sw	ra,76(sp)
8000c5c8:	04912223          	sw	s1,68(sp)
8000c5cc:	03412c23          	sw	s4,56(sp)
8000c5d0:	03612823          	sw	s6,48(sp)
8000c5d4:	00054483          	lbu	s1,0(a0)
8000c5d8:	00010913          	mv	s2,sp
8000c5dc:	80003ab7          	lui	s5,0x80003
8000c5e0:	00058993          	mv	s3,a1
8000c5e4:	00090b93          	mv	s7,s2
8000c5e8:	d09a8a93          	addi	s5,s5,-759 # 80002d09 <_heap_end+0xffff0d09>
8000c5ec:	03000413          	li	s0,48
8000c5f0:	05800c13          	li	s8,88
8000c5f4:	01000c93          	li	s9,16
8000c5f8:	00200d13          	li	s10,2
8000c5fc:	02e00d93          	li	s11,46
8000c600:	00c10713          	addi	a4,sp,12
8000c604:	015487b3          	add	a5,s1,s5
8000c608:	0007c783          	lbu	a5,0(a5) # 80000000 <_heap_end+0xfffee000>
8000c60c:	0047f793          	andi	a5,a5,4
8000c610:	1c078a63          	beqz	a5,8000c7e4 <ip4addr_aton+0x248>
8000c614:	00a00b13          	li	s6,10
8000c618:	00849c63          	bne	s1,s0,8000c630 <ip4addr_aton+0x94>
8000c61c:	00154483          	lbu	s1,1(a0)
8000c620:	0df4f793          	andi	a5,s1,223
8000c624:	05878463          	beq	a5,s8,8000c66c <ip4addr_aton+0xd0>
8000c628:	00150513          	addi	a0,a0,1
8000c62c:	00800b13          	li	s6,8
8000c630:	00050a13          	mv	s4,a0
8000c634:	00000513          	li	a0,0
8000c638:	009a87b3          	add	a5,s5,s1
8000c63c:	0007c783          	lbu	a5,0(a5)
8000c640:	0047f693          	andi	a3,a5,4
8000c644:	02068c63          	beqz	a3,8000c67c <ip4addr_aton+0xe0>
8000c648:	00050593          	mv	a1,a0
8000c64c:	000b0513          	mv	a0,s6
8000c650:	441000ef          	jal	ra,8000d290 <__mulsi3>
8000c654:	00950533          	add	a0,a0,s1
8000c658:	001a4483          	lbu	s1,1(s4)
8000c65c:	fd050513          	addi	a0,a0,-48
8000c660:	00c10713          	addi	a4,sp,12
8000c664:	001a0a13          	addi	s4,s4,1
8000c668:	fd1ff06f          	j	8000c638 <ip4addr_aton+0x9c>
8000c66c:	00254483          	lbu	s1,2(a0)
8000c670:	01000b13          	li	s6,16
8000c674:	00250513          	addi	a0,a0,2
8000c678:	fb9ff06f          	j	8000c630 <ip4addr_aton+0x94>
8000c67c:	039b1a63          	bne	s6,s9,8000c6b0 <ip4addr_aton+0x114>
8000c680:	0447f693          	andi	a3,a5,68
8000c684:	02068663          	beqz	a3,8000c6b0 <ip4addr_aton+0x114>
8000c688:	0037f793          	andi	a5,a5,3
8000c68c:	00451513          	slli	a0,a0,0x4
8000c690:	00a48493          	addi	s1,s1,10
8000c694:	06100593          	li	a1,97
8000c698:	01a78463          	beq	a5,s10,8000c6a0 <ip4addr_aton+0x104>
8000c69c:	04100593          	li	a1,65
8000c6a0:	40b484b3          	sub	s1,s1,a1
8000c6a4:	00a4e533          	or	a0,s1,a0
8000c6a8:	001a4483          	lbu	s1,1(s4)
8000c6ac:	fb9ff06f          	j	8000c664 <ip4addr_aton+0xc8>
8000c6b0:	01b49e63          	bne	s1,s11,8000c6cc <ip4addr_aton+0x130>
8000c6b4:	12e90863          	beq	s2,a4,8000c7e4 <ip4addr_aton+0x248>
8000c6b8:	00490913          	addi	s2,s2,4
8000c6bc:	fea92e23          	sw	a0,-4(s2)
8000c6c0:	001a4483          	lbu	s1,1(s4)
8000c6c4:	001a0513          	addi	a0,s4,1
8000c6c8:	f3dff06f          	j	8000c604 <ip4addr_aton+0x68>
8000c6cc:	00048863          	beqz	s1,8000c6dc <ip4addr_aton+0x140>
8000c6d0:	0087f793          	andi	a5,a5,8
8000c6d4:	00000413          	li	s0,0
8000c6d8:	02078863          	beqz	a5,8000c708 <ip4addr_aton+0x16c>
8000c6dc:	41790433          	sub	s0,s2,s7
8000c6e0:	40245413          	srai	s0,s0,0x2
8000c6e4:	00140413          	addi	s0,s0,1
8000c6e8:	00200793          	li	a5,2
8000c6ec:	0af40263          	beq	s0,a5,8000c790 <ip4addr_aton+0x1f4>
8000c6f0:	0487cc63          	blt	a5,s0,8000c748 <ip4addr_aton+0x1ac>
8000c6f4:	00040a63          	beqz	s0,8000c708 <ip4addr_aton+0x16c>
8000c6f8:	00100413          	li	s0,1
8000c6fc:	00098663          	beqz	s3,8000c708 <ip4addr_aton+0x16c>
8000c700:	e3cf90ef          	jal	ra,80005d3c <lwip_htonl>
8000c704:	00a9a023          	sw	a0,0(s3)
8000c708:	00040513          	mv	a0,s0
8000c70c:	04c12083          	lw	ra,76(sp)
8000c710:	04812403          	lw	s0,72(sp)
8000c714:	04412483          	lw	s1,68(sp)
8000c718:	04012903          	lw	s2,64(sp)
8000c71c:	03c12983          	lw	s3,60(sp)
8000c720:	03812a03          	lw	s4,56(sp)
8000c724:	03412a83          	lw	s5,52(sp)
8000c728:	03012b03          	lw	s6,48(sp)
8000c72c:	02c12b83          	lw	s7,44(sp)
8000c730:	02812c03          	lw	s8,40(sp)
8000c734:	02412c83          	lw	s9,36(sp)
8000c738:	02012d03          	lw	s10,32(sp)
8000c73c:	01c12d83          	lw	s11,28(sp)
8000c740:	05010113          	addi	sp,sp,80
8000c744:	00008067          	ret
8000c748:	00300793          	li	a5,3
8000c74c:	06f40463          	beq	s0,a5,8000c7b4 <ip4addr_aton+0x218>
8000c750:	00400793          	li	a5,4
8000c754:	faf412e3          	bne	s0,a5,8000c6f8 <ip4addr_aton+0x15c>
8000c758:	0ff00613          	li	a2,255
8000c75c:	00000413          	li	s0,0
8000c760:	faa664e3          	bltu	a2,a0,8000c708 <ip4addr_aton+0x16c>
8000c764:	00012783          	lw	a5,0(sp)
8000c768:	faf660e3          	bltu	a2,a5,8000c708 <ip4addr_aton+0x16c>
8000c76c:	00412683          	lw	a3,4(sp)
8000c770:	f8d66ce3          	bltu	a2,a3,8000c708 <ip4addr_aton+0x16c>
8000c774:	00812703          	lw	a4,8(sp)
8000c778:	f8e668e3          	bltu	a2,a4,8000c708 <ip4addr_aton+0x16c>
8000c77c:	01879793          	slli	a5,a5,0x18
8000c780:	01069693          	slli	a3,a3,0x10
8000c784:	00d7e7b3          	or	a5,a5,a3
8000c788:	00871713          	slli	a4,a4,0x8
8000c78c:	0500006f          	j	8000c7dc <ip4addr_aton+0x240>
8000c790:	010007b7          	lui	a5,0x1000
8000c794:	00000413          	li	s0,0
8000c798:	f6f578e3          	bgeu	a0,a5,8000c708 <ip4addr_aton+0x16c>
8000c79c:	00012783          	lw	a5,0(sp)
8000c7a0:	0ff00713          	li	a4,255
8000c7a4:	f6f762e3          	bltu	a4,a5,8000c708 <ip4addr_aton+0x16c>
8000c7a8:	01879793          	slli	a5,a5,0x18
8000c7ac:	00f56533          	or	a0,a0,a5
8000c7b0:	f49ff06f          	j	8000c6f8 <ip4addr_aton+0x15c>
8000c7b4:	000107b7          	lui	a5,0x10
8000c7b8:	00000413          	li	s0,0
8000c7bc:	f4f576e3          	bgeu	a0,a5,8000c708 <ip4addr_aton+0x16c>
8000c7c0:	00012783          	lw	a5,0(sp)
8000c7c4:	0ff00693          	li	a3,255
8000c7c8:	f4f6e0e3          	bltu	a3,a5,8000c708 <ip4addr_aton+0x16c>
8000c7cc:	00412703          	lw	a4,4(sp)
8000c7d0:	f2e6ece3          	bltu	a3,a4,8000c708 <ip4addr_aton+0x16c>
8000c7d4:	01879793          	slli	a5,a5,0x18
8000c7d8:	01071713          	slli	a4,a4,0x10
8000c7dc:	00e7e7b3          	or	a5,a5,a4
8000c7e0:	fcdff06f          	j	8000c7ac <ip4addr_aton+0x210>
8000c7e4:	00000413          	li	s0,0
8000c7e8:	f21ff06f          	j	8000c708 <ip4addr_aton+0x16c>

8000c7ec <ipaddr_addr>:
8000c7ec:	fe010113          	addi	sp,sp,-32
8000c7f0:	00c10593          	addi	a1,sp,12
8000c7f4:	00112e23          	sw	ra,28(sp)
8000c7f8:	da5ff0ef          	jal	ra,8000c59c <ip4addr_aton>
8000c7fc:	00050a63          	beqz	a0,8000c810 <ipaddr_addr+0x24>
8000c800:	00c12503          	lw	a0,12(sp)
8000c804:	01c12083          	lw	ra,28(sp)
8000c808:	02010113          	addi	sp,sp,32
8000c80c:	00008067          	ret
8000c810:	fff00513          	li	a0,-1
8000c814:	ff1ff06f          	j	8000c804 <ipaddr_addr+0x18>

8000c818 <ip4addr_ntoa_r>:
8000c818:	fb010113          	addi	sp,sp,-80
8000c81c:	04912223          	sw	s1,68(sp)
8000c820:	05212023          	sw	s2,64(sp)
8000c824:	03312e23          	sw	s3,60(sp)
8000c828:	03612823          	sw	s6,48(sp)
8000c82c:	03812423          	sw	s8,40(sp)
8000c830:	03912223          	sw	s9,36(sp)
8000c834:	03a12023          	sw	s10,32(sp)
8000c838:	04112623          	sw	ra,76(sp)
8000c83c:	04812423          	sw	s0,72(sp)
8000c840:	03412c23          	sw	s4,56(sp)
8000c844:	03512a23          	sw	s5,52(sp)
8000c848:	03712623          	sw	s7,44(sp)
8000c84c:	00052783          	lw	a5,0(a0)
8000c850:	00058493          	mv	s1,a1
8000c854:	00058b13          	mv	s6,a1
8000c858:	00f12e23          	sw	a5,28(sp)
8000c85c:	00000993          	li	s3,0
8000c860:	01c10913          	addi	s2,sp,28
8000c864:	00900c93          	li	s9,9
8000c868:	0ff00d13          	li	s10,255
8000c86c:	02e00c13          	li	s8,46
8000c870:	00094a03          	lbu	s4,0(s2)
8000c874:	00000413          	li	s0,0
8000c878:	00a00593          	li	a1,10
8000c87c:	000a0513          	mv	a0,s4
8000c880:	00c12623          	sw	a2,12(sp)
8000c884:	239000ef          	jal	ra,8000d2bc <__udivsi3>
8000c888:	0ff57b93          	andi	s7,a0,255
8000c88c:	00a00593          	li	a1,10
8000c890:	000a0513          	mv	a0,s4
8000c894:	271000ef          	jal	ra,8000d304 <__umodsi3>
8000c898:	02010793          	addi	a5,sp,32
8000c89c:	03050513          	addi	a0,a0,48
8000c8a0:	008787b3          	add	a5,a5,s0
8000c8a4:	00140a93          	addi	s5,s0,1
8000c8a8:	fea78c23          	sb	a0,-8(a5) # fff8 <_stack_size+0xf7f8>
8000c8ac:	0ffafa93          	andi	s5,s5,255
8000c8b0:	00c12603          	lw	a2,12(sp)
8000c8b4:	074ce863          	bltu	s9,s4,8000c924 <ip4addr_ntoa_r+0x10c>
8000c8b8:	01790023          	sb	s7,0(s2)
8000c8bc:	00098713          	mv	a4,s3
8000c8c0:	000b0793          	mv	a5,s6
8000c8c4:	00198993          	addi	s3,s3,1
8000c8c8:	07a41463          	bne	s0,s10,8000c930 <ip4addr_ntoa_r+0x118>
8000c8cc:	08c75863          	bge	a4,a2,8000c95c <ip4addr_ntoa_r+0x144>
8000c8d0:	01878023          	sb	s8,0(a5)
8000c8d4:	00190913          	addi	s2,s2,1
8000c8d8:	02010713          	addi	a4,sp,32
8000c8dc:	00178b13          	addi	s6,a5,1
8000c8e0:	f8e918e3          	bne	s2,a4,8000c870 <ip4addr_ntoa_r+0x58>
8000c8e4:	00078023          	sb	zero,0(a5)
8000c8e8:	00048513          	mv	a0,s1
8000c8ec:	04c12083          	lw	ra,76(sp)
8000c8f0:	04812403          	lw	s0,72(sp)
8000c8f4:	04412483          	lw	s1,68(sp)
8000c8f8:	04012903          	lw	s2,64(sp)
8000c8fc:	03c12983          	lw	s3,60(sp)
8000c900:	03812a03          	lw	s4,56(sp)
8000c904:	03412a83          	lw	s5,52(sp)
8000c908:	03012b03          	lw	s6,48(sp)
8000c90c:	02c12b83          	lw	s7,44(sp)
8000c910:	02812c03          	lw	s8,40(sp)
8000c914:	02412c83          	lw	s9,36(sp)
8000c918:	02012d03          	lw	s10,32(sp)
8000c91c:	05010113          	addi	sp,sp,80
8000c920:	00008067          	ret
8000c924:	000b8a13          	mv	s4,s7
8000c928:	000a8413          	mv	s0,s5
8000c92c:	f4dff06f          	j	8000c878 <ip4addr_ntoa_r+0x60>
8000c930:	fff40693          	addi	a3,s0,-1
8000c934:	0ff6f693          	andi	a3,a3,255
8000c938:	02c75263          	bge	a4,a2,8000c95c <ip4addr_ntoa_r+0x144>
8000c93c:	02010713          	addi	a4,sp,32
8000c940:	00870433          	add	s0,a4,s0
8000c944:	ff844703          	lbu	a4,-8(s0)
8000c948:	00178793          	addi	a5,a5,1
8000c94c:	00068413          	mv	s0,a3
8000c950:	fee78fa3          	sb	a4,-1(a5)
8000c954:	00098713          	mv	a4,s3
8000c958:	f6dff06f          	j	8000c8c4 <ip4addr_ntoa_r+0xac>
8000c95c:	00000513          	li	a0,0
8000c960:	f8dff06f          	j	8000c8ec <ip4addr_ntoa_r+0xd4>

8000c964 <ip4addr_ntoa>:
8000c964:	01000613          	li	a2,16
8000c968:	c3418593          	addi	a1,gp,-972 # 8000346c <str.4106>
8000c96c:	eadff06f          	j	8000c818 <ip4addr_ntoa_r>

8000c970 <ethernet_input>:
8000c970:	ff010113          	addi	sp,sp,-16
8000c974:	00812423          	sw	s0,8(sp)
8000c978:	00112623          	sw	ra,12(sp)
8000c97c:	00912223          	sw	s1,4(sp)
8000c980:	01212023          	sw	s2,0(sp)
8000c984:	00a55703          	lhu	a4,10(a0)
8000c988:	01000793          	li	a5,16
8000c98c:	00050413          	mv	s0,a0
8000c990:	00e7ec63          	bltu	a5,a4,8000c9a8 <ethernet_input+0x38>
8000c994:	a0418793          	addi	a5,gp,-1532 # 8000323c <lwip_stats>
8000c998:	0507a703          	lw	a4,80(a5)
8000c99c:	00170713          	addi	a4,a4,1
8000c9a0:	04e7a823          	sw	a4,80(a5)
8000c9a4:	0a00006f          	j	8000ca44 <ethernet_input+0xd4>
8000c9a8:	00f54783          	lbu	a5,15(a0)
8000c9ac:	00058913          	mv	s2,a1
8000c9b0:	00079863          	bnez	a5,8000c9c0 <ethernet_input+0x50>
8000c9b4:	0385c783          	lbu	a5,56(a1)
8000c9b8:	00178793          	addi	a5,a5,1
8000c9bc:	00f507a3          	sb	a5,15(a0)
8000c9c0:	00442503          	lw	a0,4(s0)
8000c9c4:	00f54483          	lbu	s1,15(a0)
8000c9c8:	00e54783          	lbu	a5,14(a0)
8000c9cc:	00849493          	slli	s1,s1,0x8
8000c9d0:	00f4e4b3          	or	s1,s1,a5
8000c9d4:	00254783          	lbu	a5,2(a0)
8000c9d8:	0017f713          	andi	a4,a5,1
8000c9dc:	02070663          	beqz	a4,8000ca08 <ethernet_input+0x98>
8000c9e0:	00100713          	li	a4,1
8000c9e4:	06e79c63          	bne	a5,a4,8000ca5c <ethernet_input+0xec>
8000c9e8:	00354783          	lbu	a5,3(a0)
8000c9ec:	00079e63          	bnez	a5,8000ca08 <ethernet_input+0x98>
8000c9f0:	00454703          	lbu	a4,4(a0)
8000c9f4:	05e00793          	li	a5,94
8000c9f8:	00f71863          	bne	a4,a5,8000ca08 <ethernet_input+0x98>
8000c9fc:	00d44783          	lbu	a5,13(s0)
8000ca00:	0107e793          	ori	a5,a5,16
8000ca04:	00f406a3          	sb	a5,13(s0)
8000ca08:	00800793          	li	a5,8
8000ca0c:	06f48863          	beq	s1,a5,8000ca7c <ethernet_input+0x10c>
8000ca10:	60800793          	li	a5,1544
8000ca14:	f8f490e3          	bne	s1,a5,8000c994 <ethernet_input+0x24>
8000ca18:	03594783          	lbu	a5,53(s2)
8000ca1c:	0087f793          	andi	a5,a5,8
8000ca20:	02078863          	beqz	a5,8000ca50 <ethernet_input+0xe0>
8000ca24:	01000593          	li	a1,16
8000ca28:	00040513          	mv	a0,s0
8000ca2c:	c94fa0ef          	jal	ra,80006ec0 <pbuf_remove_header>
8000ca30:	08050863          	beqz	a0,8000cac0 <ethernet_input+0x150>
8000ca34:	a0418793          	addi	a5,gp,-1532 # 8000323c <lwip_stats>
8000ca38:	0447a703          	lw	a4,68(a5)
8000ca3c:	00170713          	addi	a4,a4,1
8000ca40:	04e7a223          	sw	a4,68(a5)
8000ca44:	03c7a703          	lw	a4,60(a5)
8000ca48:	00170713          	addi	a4,a4,1
8000ca4c:	02e7ae23          	sw	a4,60(a5)
8000ca50:	00040513          	mv	a0,s0
8000ca54:	cf4fa0ef          	jal	ra,80006f48 <pbuf_free>
8000ca58:	04c0006f          	j	8000caa4 <ethernet_input+0x134>
8000ca5c:	00600613          	li	a2,6
8000ca60:	85418593          	addi	a1,gp,-1964 # 8000308c <ethbroadcast>
8000ca64:	00250513          	addi	a0,a0,2
8000ca68:	54c010ef          	jal	ra,8000dfb4 <memcmp>
8000ca6c:	f8051ee3          	bnez	a0,8000ca08 <ethernet_input+0x98>
8000ca70:	00d44783          	lbu	a5,13(s0)
8000ca74:	0087e793          	ori	a5,a5,8
8000ca78:	f8dff06f          	j	8000ca04 <ethernet_input+0x94>
8000ca7c:	03594783          	lbu	a5,53(s2)
8000ca80:	0087f793          	andi	a5,a5,8
8000ca84:	fc0786e3          	beqz	a5,8000ca50 <ethernet_input+0xe0>
8000ca88:	01000593          	li	a1,16
8000ca8c:	00040513          	mv	a0,s0
8000ca90:	c30fa0ef          	jal	ra,80006ec0 <pbuf_remove_header>
8000ca94:	fa051ee3          	bnez	a0,8000ca50 <ethernet_input+0xe0>
8000ca98:	00090593          	mv	a1,s2
8000ca9c:	00040513          	mv	a0,s0
8000caa0:	b30ff0ef          	jal	ra,8000bdd0 <ip4_input>
8000caa4:	00c12083          	lw	ra,12(sp)
8000caa8:	00812403          	lw	s0,8(sp)
8000caac:	00412483          	lw	s1,4(sp)
8000cab0:	00012903          	lw	s2,0(sp)
8000cab4:	00000513          	li	a0,0
8000cab8:	01010113          	addi	sp,sp,16
8000cabc:	00008067          	ret
8000cac0:	00090593          	mv	a1,s2
8000cac4:	00040513          	mv	a0,s0
8000cac8:	ad8fe0ef          	jal	ra,8000ada0 <etharp_input>
8000cacc:	fd9ff06f          	j	8000caa4 <ethernet_input+0x134>

8000cad0 <ethernet_output>:
8000cad0:	fd010113          	addi	sp,sp,-48
8000cad4:	01312e23          	sw	s3,28(sp)
8000cad8:	00050993          	mv	s3,a0
8000cadc:	00070513          	mv	a0,a4
8000cae0:	00d12623          	sw	a3,12(sp)
8000cae4:	02112623          	sw	ra,44(sp)
8000cae8:	02912223          	sw	s1,36(sp)
8000caec:	03212023          	sw	s2,32(sp)
8000caf0:	01412c23          	sw	s4,24(sp)
8000caf4:	00058913          	mv	s2,a1
8000caf8:	00060a13          	mv	s4,a2
8000cafc:	02812423          	sw	s0,40(sp)
8000cb00:	a24f90ef          	jal	ra,80005d24 <lwip_htons>
8000cb04:	00050493          	mv	s1,a0
8000cb08:	01000593          	li	a1,16
8000cb0c:	00090513          	mv	a0,s2
8000cb10:	ba0fa0ef          	jal	ra,80006eb0 <pbuf_add_header>
8000cb14:	00c12683          	lw	a3,12(sp)
8000cb18:	06051063          	bnez	a0,8000cb78 <ethernet_output+0xa8>
8000cb1c:	00492403          	lw	s0,4(s2)
8000cb20:	00068593          	mv	a1,a3
8000cb24:	00600613          	li	a2,6
8000cb28:	00940723          	sb	s1,14(s0)
8000cb2c:	0084d493          	srli	s1,s1,0x8
8000cb30:	009407a3          	sb	s1,15(s0)
8000cb34:	00240513          	addi	a0,s0,2
8000cb38:	4ac010ef          	jal	ra,8000dfe4 <memcpy>
8000cb3c:	000a0593          	mv	a1,s4
8000cb40:	00840513          	addi	a0,s0,8
8000cb44:	00600613          	li	a2,6
8000cb48:	49c010ef          	jal	ra,8000dfe4 <memcpy>
8000cb4c:	02812403          	lw	s0,40(sp)
8000cb50:	0189a303          	lw	t1,24(s3)
8000cb54:	02c12083          	lw	ra,44(sp)
8000cb58:	02412483          	lw	s1,36(sp)
8000cb5c:	01812a03          	lw	s4,24(sp)
8000cb60:	00090593          	mv	a1,s2
8000cb64:	00098513          	mv	a0,s3
8000cb68:	02012903          	lw	s2,32(sp)
8000cb6c:	01c12983          	lw	s3,28(sp)
8000cb70:	03010113          	addi	sp,sp,48
8000cb74:	00030067          	jr	t1
8000cb78:	a0418793          	addi	a5,gp,-1532 # 8000323c <lwip_stats>
8000cb7c:	0147a703          	lw	a4,20(a5)
8000cb80:	ffe00513          	li	a0,-2
8000cb84:	00170713          	addi	a4,a4,1
8000cb88:	00e7aa23          	sw	a4,20(a5)
8000cb8c:	02c12083          	lw	ra,44(sp)
8000cb90:	02812403          	lw	s0,40(sp)
8000cb94:	02412483          	lw	s1,36(sp)
8000cb98:	02012903          	lw	s2,32(sp)
8000cb9c:	01c12983          	lw	s3,28(sp)
8000cba0:	01812a03          	lw	s4,24(sp)
8000cba4:	03010113          	addi	sp,sp,48
8000cba8:	00008067          	ret

8000cbac <memset>:
8000cbac:	00f00313          	li	t1,15
8000cbb0:	00050713          	mv	a4,a0
8000cbb4:	02c37e63          	bgeu	t1,a2,8000cbf0 <memset+0x44>
8000cbb8:	00f77793          	andi	a5,a4,15
8000cbbc:	0a079063          	bnez	a5,8000cc5c <memset+0xb0>
8000cbc0:	08059263          	bnez	a1,8000cc44 <memset+0x98>
8000cbc4:	ff067693          	andi	a3,a2,-16
8000cbc8:	00f67613          	andi	a2,a2,15
8000cbcc:	00e686b3          	add	a3,a3,a4
8000cbd0:	00b72023          	sw	a1,0(a4)
8000cbd4:	00b72223          	sw	a1,4(a4)
8000cbd8:	00b72423          	sw	a1,8(a4)
8000cbdc:	00b72623          	sw	a1,12(a4)
8000cbe0:	01070713          	addi	a4,a4,16
8000cbe4:	fed766e3          	bltu	a4,a3,8000cbd0 <memset+0x24>
8000cbe8:	00061463          	bnez	a2,8000cbf0 <memset+0x44>
8000cbec:	00008067          	ret
8000cbf0:	40c306b3          	sub	a3,t1,a2
8000cbf4:	00269693          	slli	a3,a3,0x2
8000cbf8:	00000297          	auipc	t0,0x0
8000cbfc:	005686b3          	add	a3,a3,t0
8000cc00:	00c68067          	jr	12(a3)
8000cc04:	00b70723          	sb	a1,14(a4)
8000cc08:	00b706a3          	sb	a1,13(a4)
8000cc0c:	00b70623          	sb	a1,12(a4)
8000cc10:	00b705a3          	sb	a1,11(a4)
8000cc14:	00b70523          	sb	a1,10(a4)
8000cc18:	00b704a3          	sb	a1,9(a4)
8000cc1c:	00b70423          	sb	a1,8(a4)
8000cc20:	00b703a3          	sb	a1,7(a4)
8000cc24:	00b70323          	sb	a1,6(a4)
8000cc28:	00b702a3          	sb	a1,5(a4)
8000cc2c:	00b70223          	sb	a1,4(a4)
8000cc30:	00b701a3          	sb	a1,3(a4)
8000cc34:	00b70123          	sb	a1,2(a4)
8000cc38:	00b700a3          	sb	a1,1(a4)
8000cc3c:	00b70023          	sb	a1,0(a4)
8000cc40:	00008067          	ret
8000cc44:	0ff5f593          	andi	a1,a1,255
8000cc48:	00859693          	slli	a3,a1,0x8
8000cc4c:	00d5e5b3          	or	a1,a1,a3
8000cc50:	01059693          	slli	a3,a1,0x10
8000cc54:	00d5e5b3          	or	a1,a1,a3
8000cc58:	f6dff06f          	j	8000cbc4 <memset+0x18>
8000cc5c:	00279693          	slli	a3,a5,0x2
8000cc60:	00000297          	auipc	t0,0x0
8000cc64:	005686b3          	add	a3,a3,t0
8000cc68:	00008293          	mv	t0,ra
8000cc6c:	fa0680e7          	jalr	-96(a3)
8000cc70:	00028093          	mv	ra,t0
8000cc74:	ff078793          	addi	a5,a5,-16
8000cc78:	40f70733          	sub	a4,a4,a5
8000cc7c:	00f60633          	add	a2,a2,a5
8000cc80:	f6c378e3          	bgeu	t1,a2,8000cbf0 <memset+0x44>
8000cc84:	f3dff06f          	j	8000cbc0 <memset+0x14>

8000cc88 <__bswapsi2>:
8000cc88:	01851713          	slli	a4,a0,0x18
8000cc8c:	01855793          	srli	a5,a0,0x18
8000cc90:	000106b7          	lui	a3,0x10
8000cc94:	00e7e7b3          	or	a5,a5,a4
8000cc98:	f0068693          	addi	a3,a3,-256 # ff00 <_stack_size+0xf700>
8000cc9c:	40855713          	srai	a4,a0,0x8
8000cca0:	00d77733          	and	a4,a4,a3
8000cca4:	00e7e7b3          	or	a5,a5,a4
8000cca8:	00851513          	slli	a0,a0,0x8
8000ccac:	00ff0737          	lui	a4,0xff0
8000ccb0:	00e57533          	and	a0,a0,a4
8000ccb4:	00a7e533          	or	a0,a5,a0
8000ccb8:	00008067          	ret

8000ccbc <__udivdi3>:
8000ccbc:	fd010113          	addi	sp,sp,-48
8000ccc0:	02912223          	sw	s1,36(sp)
8000ccc4:	01612823          	sw	s6,16(sp)
8000ccc8:	02112623          	sw	ra,44(sp)
8000cccc:	02812423          	sw	s0,40(sp)
8000ccd0:	03212023          	sw	s2,32(sp)
8000ccd4:	01312e23          	sw	s3,28(sp)
8000ccd8:	01412c23          	sw	s4,24(sp)
8000ccdc:	01512a23          	sw	s5,20(sp)
8000cce0:	01712623          	sw	s7,12(sp)
8000cce4:	01812423          	sw	s8,8(sp)
8000cce8:	01912223          	sw	s9,4(sp)
8000ccec:	00050b13          	mv	s6,a0
8000ccf0:	00058493          	mv	s1,a1
8000ccf4:	38069c63          	bnez	a3,8000d08c <__udivdi3+0x3d0>
8000ccf8:	00060413          	mv	s0,a2
8000ccfc:	00050993          	mv	s3,a0
8000cd00:	ffff6917          	auipc	s2,0xffff6
8000cd04:	1a890913          	addi	s2,s2,424 # 80002ea8 <__clz_tab>
8000cd08:	12c5f863          	bgeu	a1,a2,8000ce38 <__udivdi3+0x17c>
8000cd0c:	000107b7          	lui	a5,0x10
8000cd10:	00058a93          	mv	s5,a1
8000cd14:	10f67863          	bgeu	a2,a5,8000ce24 <__udivdi3+0x168>
8000cd18:	0ff00693          	li	a3,255
8000cd1c:	00c6b6b3          	sltu	a3,a3,a2
8000cd20:	00369693          	slli	a3,a3,0x3
8000cd24:	00d657b3          	srl	a5,a2,a3
8000cd28:	00f90933          	add	s2,s2,a5
8000cd2c:	00094703          	lbu	a4,0(s2)
8000cd30:	00d706b3          	add	a3,a4,a3
8000cd34:	02000713          	li	a4,32
8000cd38:	40d70733          	sub	a4,a4,a3
8000cd3c:	00070c63          	beqz	a4,8000cd54 <__udivdi3+0x98>
8000cd40:	00e494b3          	sll	s1,s1,a4
8000cd44:	00db56b3          	srl	a3,s6,a3
8000cd48:	00e61433          	sll	s0,a2,a4
8000cd4c:	0096eab3          	or	s5,a3,s1
8000cd50:	00eb19b3          	sll	s3,s6,a4
8000cd54:	01045b13          	srli	s6,s0,0x10
8000cd58:	000b0593          	mv	a1,s6
8000cd5c:	000a8513          	mv	a0,s5
8000cd60:	5a4000ef          	jal	ra,8000d304 <__umodsi3>
8000cd64:	00050913          	mv	s2,a0
8000cd68:	000b0593          	mv	a1,s6
8000cd6c:	01041b93          	slli	s7,s0,0x10
8000cd70:	000a8513          	mv	a0,s5
8000cd74:	548000ef          	jal	ra,8000d2bc <__udivsi3>
8000cd78:	010bdb93          	srli	s7,s7,0x10
8000cd7c:	00050493          	mv	s1,a0
8000cd80:	00050593          	mv	a1,a0
8000cd84:	000b8513          	mv	a0,s7
8000cd88:	508000ef          	jal	ra,8000d290 <__mulsi3>
8000cd8c:	01091913          	slli	s2,s2,0x10
8000cd90:	0109d713          	srli	a4,s3,0x10
8000cd94:	00e96733          	or	a4,s2,a4
8000cd98:	00048a13          	mv	s4,s1
8000cd9c:	00a77e63          	bgeu	a4,a0,8000cdb8 <__udivdi3+0xfc>
8000cda0:	00870733          	add	a4,a4,s0
8000cda4:	fff48a13          	addi	s4,s1,-1
8000cda8:	00876863          	bltu	a4,s0,8000cdb8 <__udivdi3+0xfc>
8000cdac:	00a77663          	bgeu	a4,a0,8000cdb8 <__udivdi3+0xfc>
8000cdb0:	ffe48a13          	addi	s4,s1,-2
8000cdb4:	00870733          	add	a4,a4,s0
8000cdb8:	40a704b3          	sub	s1,a4,a0
8000cdbc:	000b0593          	mv	a1,s6
8000cdc0:	00048513          	mv	a0,s1
8000cdc4:	540000ef          	jal	ra,8000d304 <__umodsi3>
8000cdc8:	00050913          	mv	s2,a0
8000cdcc:	000b0593          	mv	a1,s6
8000cdd0:	00048513          	mv	a0,s1
8000cdd4:	4e8000ef          	jal	ra,8000d2bc <__udivsi3>
8000cdd8:	01099993          	slli	s3,s3,0x10
8000cddc:	00050493          	mv	s1,a0
8000cde0:	00050593          	mv	a1,a0
8000cde4:	01091913          	slli	s2,s2,0x10
8000cde8:	000b8513          	mv	a0,s7
8000cdec:	0109d993          	srli	s3,s3,0x10
8000cdf0:	4a0000ef          	jal	ra,8000d290 <__mulsi3>
8000cdf4:	013969b3          	or	s3,s2,s3
8000cdf8:	00048613          	mv	a2,s1
8000cdfc:	00a9fc63          	bgeu	s3,a0,8000ce14 <__udivdi3+0x158>
8000ce00:	013409b3          	add	s3,s0,s3
8000ce04:	fff48613          	addi	a2,s1,-1
8000ce08:	0089e663          	bltu	s3,s0,8000ce14 <__udivdi3+0x158>
8000ce0c:	00a9f463          	bgeu	s3,a0,8000ce14 <__udivdi3+0x158>
8000ce10:	ffe48613          	addi	a2,s1,-2
8000ce14:	010a1793          	slli	a5,s4,0x10
8000ce18:	00c7e7b3          	or	a5,a5,a2
8000ce1c:	00000a13          	li	s4,0
8000ce20:	1300006f          	j	8000cf50 <__udivdi3+0x294>
8000ce24:	010007b7          	lui	a5,0x1000
8000ce28:	01000693          	li	a3,16
8000ce2c:	eef66ce3          	bltu	a2,a5,8000cd24 <__udivdi3+0x68>
8000ce30:	01800693          	li	a3,24
8000ce34:	ef1ff06f          	j	8000cd24 <__udivdi3+0x68>
8000ce38:	00068a13          	mv	s4,a3
8000ce3c:	00061a63          	bnez	a2,8000ce50 <__udivdi3+0x194>
8000ce40:	00000593          	li	a1,0
8000ce44:	00100513          	li	a0,1
8000ce48:	474000ef          	jal	ra,8000d2bc <__udivsi3>
8000ce4c:	00050413          	mv	s0,a0
8000ce50:	000107b7          	lui	a5,0x10
8000ce54:	12f47c63          	bgeu	s0,a5,8000cf8c <__udivdi3+0x2d0>
8000ce58:	0ff00793          	li	a5,255
8000ce5c:	0087f463          	bgeu	a5,s0,8000ce64 <__udivdi3+0x1a8>
8000ce60:	00800a13          	li	s4,8
8000ce64:	014457b3          	srl	a5,s0,s4
8000ce68:	00f90933          	add	s2,s2,a5
8000ce6c:	00094683          	lbu	a3,0(s2)
8000ce70:	02000613          	li	a2,32
8000ce74:	014686b3          	add	a3,a3,s4
8000ce78:	40d60633          	sub	a2,a2,a3
8000ce7c:	12061263          	bnez	a2,8000cfa0 <__udivdi3+0x2e4>
8000ce80:	408484b3          	sub	s1,s1,s0
8000ce84:	00100a13          	li	s4,1
8000ce88:	01045b13          	srli	s6,s0,0x10
8000ce8c:	000b0593          	mv	a1,s6
8000ce90:	00048513          	mv	a0,s1
8000ce94:	470000ef          	jal	ra,8000d304 <__umodsi3>
8000ce98:	00050913          	mv	s2,a0
8000ce9c:	000b0593          	mv	a1,s6
8000cea0:	00048513          	mv	a0,s1
8000cea4:	01041b93          	slli	s7,s0,0x10
8000cea8:	414000ef          	jal	ra,8000d2bc <__udivsi3>
8000ceac:	010bdb93          	srli	s7,s7,0x10
8000ceb0:	00050493          	mv	s1,a0
8000ceb4:	00050593          	mv	a1,a0
8000ceb8:	000b8513          	mv	a0,s7
8000cebc:	3d4000ef          	jal	ra,8000d290 <__mulsi3>
8000cec0:	01091913          	slli	s2,s2,0x10
8000cec4:	0109d713          	srli	a4,s3,0x10
8000cec8:	00e96733          	or	a4,s2,a4
8000cecc:	00048a93          	mv	s5,s1
8000ced0:	00a77e63          	bgeu	a4,a0,8000ceec <__udivdi3+0x230>
8000ced4:	00870733          	add	a4,a4,s0
8000ced8:	fff48a93          	addi	s5,s1,-1
8000cedc:	00876863          	bltu	a4,s0,8000ceec <__udivdi3+0x230>
8000cee0:	00a77663          	bgeu	a4,a0,8000ceec <__udivdi3+0x230>
8000cee4:	ffe48a93          	addi	s5,s1,-2
8000cee8:	00870733          	add	a4,a4,s0
8000ceec:	40a704b3          	sub	s1,a4,a0
8000cef0:	000b0593          	mv	a1,s6
8000cef4:	00048513          	mv	a0,s1
8000cef8:	40c000ef          	jal	ra,8000d304 <__umodsi3>
8000cefc:	00050913          	mv	s2,a0
8000cf00:	000b0593          	mv	a1,s6
8000cf04:	00048513          	mv	a0,s1
8000cf08:	3b4000ef          	jal	ra,8000d2bc <__udivsi3>
8000cf0c:	01099993          	slli	s3,s3,0x10
8000cf10:	00050493          	mv	s1,a0
8000cf14:	00050593          	mv	a1,a0
8000cf18:	01091913          	slli	s2,s2,0x10
8000cf1c:	000b8513          	mv	a0,s7
8000cf20:	0109d993          	srli	s3,s3,0x10
8000cf24:	36c000ef          	jal	ra,8000d290 <__mulsi3>
8000cf28:	013969b3          	or	s3,s2,s3
8000cf2c:	00048613          	mv	a2,s1
8000cf30:	00a9fc63          	bgeu	s3,a0,8000cf48 <__udivdi3+0x28c>
8000cf34:	013409b3          	add	s3,s0,s3
8000cf38:	fff48613          	addi	a2,s1,-1
8000cf3c:	0089e663          	bltu	s3,s0,8000cf48 <__udivdi3+0x28c>
8000cf40:	00a9f463          	bgeu	s3,a0,8000cf48 <__udivdi3+0x28c>
8000cf44:	ffe48613          	addi	a2,s1,-2
8000cf48:	010a9793          	slli	a5,s5,0x10
8000cf4c:	00c7e7b3          	or	a5,a5,a2
8000cf50:	00078513          	mv	a0,a5
8000cf54:	000a0593          	mv	a1,s4
8000cf58:	02c12083          	lw	ra,44(sp)
8000cf5c:	02812403          	lw	s0,40(sp)
8000cf60:	02412483          	lw	s1,36(sp)
8000cf64:	02012903          	lw	s2,32(sp)
8000cf68:	01c12983          	lw	s3,28(sp)
8000cf6c:	01812a03          	lw	s4,24(sp)
8000cf70:	01412a83          	lw	s5,20(sp)
8000cf74:	01012b03          	lw	s6,16(sp)
8000cf78:	00c12b83          	lw	s7,12(sp)
8000cf7c:	00812c03          	lw	s8,8(sp)
8000cf80:	00412c83          	lw	s9,4(sp)
8000cf84:	03010113          	addi	sp,sp,48
8000cf88:	00008067          	ret
8000cf8c:	010007b7          	lui	a5,0x1000
8000cf90:	01000a13          	li	s4,16
8000cf94:	ecf468e3          	bltu	s0,a5,8000ce64 <__udivdi3+0x1a8>
8000cf98:	01800a13          	li	s4,24
8000cf9c:	ec9ff06f          	j	8000ce64 <__udivdi3+0x1a8>
8000cfa0:	00c41433          	sll	s0,s0,a2
8000cfa4:	00d4da33          	srl	s4,s1,a3
8000cfa8:	00cb19b3          	sll	s3,s6,a2
8000cfac:	00db56b3          	srl	a3,s6,a3
8000cfb0:	01045b13          	srli	s6,s0,0x10
8000cfb4:	00c494b3          	sll	s1,s1,a2
8000cfb8:	000b0593          	mv	a1,s6
8000cfbc:	000a0513          	mv	a0,s4
8000cfc0:	0096eab3          	or	s5,a3,s1
8000cfc4:	340000ef          	jal	ra,8000d304 <__umodsi3>
8000cfc8:	00050913          	mv	s2,a0
8000cfcc:	000b0593          	mv	a1,s6
8000cfd0:	000a0513          	mv	a0,s4
8000cfd4:	01041b93          	slli	s7,s0,0x10
8000cfd8:	2e4000ef          	jal	ra,8000d2bc <__udivsi3>
8000cfdc:	010bdb93          	srli	s7,s7,0x10
8000cfe0:	00050493          	mv	s1,a0
8000cfe4:	00050593          	mv	a1,a0
8000cfe8:	000b8513          	mv	a0,s7
8000cfec:	2a4000ef          	jal	ra,8000d290 <__mulsi3>
8000cff0:	01091913          	slli	s2,s2,0x10
8000cff4:	010ad713          	srli	a4,s5,0x10
8000cff8:	00e96733          	or	a4,s2,a4
8000cffc:	00048a13          	mv	s4,s1
8000d000:	00a77e63          	bgeu	a4,a0,8000d01c <__udivdi3+0x360>
8000d004:	00870733          	add	a4,a4,s0
8000d008:	fff48a13          	addi	s4,s1,-1
8000d00c:	00876863          	bltu	a4,s0,8000d01c <__udivdi3+0x360>
8000d010:	00a77663          	bgeu	a4,a0,8000d01c <__udivdi3+0x360>
8000d014:	ffe48a13          	addi	s4,s1,-2
8000d018:	00870733          	add	a4,a4,s0
8000d01c:	40a704b3          	sub	s1,a4,a0
8000d020:	000b0593          	mv	a1,s6
8000d024:	00048513          	mv	a0,s1
8000d028:	2dc000ef          	jal	ra,8000d304 <__umodsi3>
8000d02c:	00050913          	mv	s2,a0
8000d030:	000b0593          	mv	a1,s6
8000d034:	00048513          	mv	a0,s1
8000d038:	284000ef          	jal	ra,8000d2bc <__udivsi3>
8000d03c:	00050493          	mv	s1,a0
8000d040:	00050593          	mv	a1,a0
8000d044:	000b8513          	mv	a0,s7
8000d048:	248000ef          	jal	ra,8000d290 <__mulsi3>
8000d04c:	010a9693          	slli	a3,s5,0x10
8000d050:	01091913          	slli	s2,s2,0x10
8000d054:	0106d693          	srli	a3,a3,0x10
8000d058:	00d967b3          	or	a5,s2,a3
8000d05c:	00048713          	mv	a4,s1
8000d060:	00a7fe63          	bgeu	a5,a0,8000d07c <__udivdi3+0x3c0>
8000d064:	008787b3          	add	a5,a5,s0
8000d068:	fff48713          	addi	a4,s1,-1
8000d06c:	0087e863          	bltu	a5,s0,8000d07c <__udivdi3+0x3c0>
8000d070:	00a7f663          	bgeu	a5,a0,8000d07c <__udivdi3+0x3c0>
8000d074:	ffe48713          	addi	a4,s1,-2
8000d078:	008787b3          	add	a5,a5,s0
8000d07c:	010a1a13          	slli	s4,s4,0x10
8000d080:	40a784b3          	sub	s1,a5,a0
8000d084:	00ea6a33          	or	s4,s4,a4
8000d088:	e01ff06f          	j	8000ce88 <__udivdi3+0x1cc>
8000d08c:	1ed5ec63          	bltu	a1,a3,8000d284 <__udivdi3+0x5c8>
8000d090:	000107b7          	lui	a5,0x10
8000d094:	04f6f463          	bgeu	a3,a5,8000d0dc <__udivdi3+0x420>
8000d098:	0ff00593          	li	a1,255
8000d09c:	00d5b533          	sltu	a0,a1,a3
8000d0a0:	00351513          	slli	a0,a0,0x3
8000d0a4:	00a6d733          	srl	a4,a3,a0
8000d0a8:	ffff6797          	auipc	a5,0xffff6
8000d0ac:	e0078793          	addi	a5,a5,-512 # 80002ea8 <__clz_tab>
8000d0b0:	00e787b3          	add	a5,a5,a4
8000d0b4:	0007c583          	lbu	a1,0(a5)
8000d0b8:	02000a13          	li	s4,32
8000d0bc:	00a585b3          	add	a1,a1,a0
8000d0c0:	40ba0a33          	sub	s4,s4,a1
8000d0c4:	020a1663          	bnez	s4,8000d0f0 <__udivdi3+0x434>
8000d0c8:	00100793          	li	a5,1
8000d0cc:	e896e2e3          	bltu	a3,s1,8000cf50 <__udivdi3+0x294>
8000d0d0:	00cb3633          	sltu	a2,s6,a2
8000d0d4:	00164793          	xori	a5,a2,1
8000d0d8:	e79ff06f          	j	8000cf50 <__udivdi3+0x294>
8000d0dc:	010007b7          	lui	a5,0x1000
8000d0e0:	01000513          	li	a0,16
8000d0e4:	fcf6e0e3          	bltu	a3,a5,8000d0a4 <__udivdi3+0x3e8>
8000d0e8:	01800513          	li	a0,24
8000d0ec:	fb9ff06f          	j	8000d0a4 <__udivdi3+0x3e8>
8000d0f0:	00b65ab3          	srl	s5,a2,a1
8000d0f4:	014696b3          	sll	a3,a3,s4
8000d0f8:	00daeab3          	or	s5,s5,a3
8000d0fc:	00b4d933          	srl	s2,s1,a1
8000d100:	014497b3          	sll	a5,s1,s4
8000d104:	00bb55b3          	srl	a1,s6,a1
8000d108:	010adb93          	srli	s7,s5,0x10
8000d10c:	00f5e4b3          	or	s1,a1,a5
8000d110:	00090513          	mv	a0,s2
8000d114:	000b8593          	mv	a1,s7
8000d118:	014619b3          	sll	s3,a2,s4
8000d11c:	1e8000ef          	jal	ra,8000d304 <__umodsi3>
8000d120:	00050413          	mv	s0,a0
8000d124:	000b8593          	mv	a1,s7
8000d128:	00090513          	mv	a0,s2
8000d12c:	010a9c13          	slli	s8,s5,0x10
8000d130:	18c000ef          	jal	ra,8000d2bc <__udivsi3>
8000d134:	010c5c13          	srli	s8,s8,0x10
8000d138:	00050913          	mv	s2,a0
8000d13c:	00050593          	mv	a1,a0
8000d140:	000c0513          	mv	a0,s8
8000d144:	14c000ef          	jal	ra,8000d290 <__mulsi3>
8000d148:	01041413          	slli	s0,s0,0x10
8000d14c:	0104d713          	srli	a4,s1,0x10
8000d150:	00e46733          	or	a4,s0,a4
8000d154:	00090c93          	mv	s9,s2
8000d158:	00a77e63          	bgeu	a4,a0,8000d174 <__udivdi3+0x4b8>
8000d15c:	01570733          	add	a4,a4,s5
8000d160:	fff90c93          	addi	s9,s2,-1
8000d164:	01576863          	bltu	a4,s5,8000d174 <__udivdi3+0x4b8>
8000d168:	00a77663          	bgeu	a4,a0,8000d174 <__udivdi3+0x4b8>
8000d16c:	ffe90c93          	addi	s9,s2,-2
8000d170:	01570733          	add	a4,a4,s5
8000d174:	40a70933          	sub	s2,a4,a0
8000d178:	000b8593          	mv	a1,s7
8000d17c:	00090513          	mv	a0,s2
8000d180:	184000ef          	jal	ra,8000d304 <__umodsi3>
8000d184:	00050413          	mv	s0,a0
8000d188:	000b8593          	mv	a1,s7
8000d18c:	00090513          	mv	a0,s2
8000d190:	12c000ef          	jal	ra,8000d2bc <__udivsi3>
8000d194:	00050913          	mv	s2,a0
8000d198:	00050593          	mv	a1,a0
8000d19c:	000c0513          	mv	a0,s8
8000d1a0:	0f0000ef          	jal	ra,8000d290 <__mulsi3>
8000d1a4:	01049793          	slli	a5,s1,0x10
8000d1a8:	01041413          	slli	s0,s0,0x10
8000d1ac:	0107d793          	srli	a5,a5,0x10
8000d1b0:	00f46733          	or	a4,s0,a5
8000d1b4:	00090613          	mv	a2,s2
8000d1b8:	00a77e63          	bgeu	a4,a0,8000d1d4 <__udivdi3+0x518>
8000d1bc:	01570733          	add	a4,a4,s5
8000d1c0:	fff90613          	addi	a2,s2,-1
8000d1c4:	01576863          	bltu	a4,s5,8000d1d4 <__udivdi3+0x518>
8000d1c8:	00a77663          	bgeu	a4,a0,8000d1d4 <__udivdi3+0x518>
8000d1cc:	ffe90613          	addi	a2,s2,-2
8000d1d0:	01570733          	add	a4,a4,s5
8000d1d4:	010c9793          	slli	a5,s9,0x10
8000d1d8:	00010e37          	lui	t3,0x10
8000d1dc:	00c7e7b3          	or	a5,a5,a2
8000d1e0:	fffe0813          	addi	a6,t3,-1 # ffff <_stack_size+0xf7ff>
8000d1e4:	0107f333          	and	t1,a5,a6
8000d1e8:	0109f833          	and	a6,s3,a6
8000d1ec:	40a70733          	sub	a4,a4,a0
8000d1f0:	0107de93          	srli	t4,a5,0x10
8000d1f4:	0109d993          	srli	s3,s3,0x10
8000d1f8:	00030513          	mv	a0,t1
8000d1fc:	00080593          	mv	a1,a6
8000d200:	090000ef          	jal	ra,8000d290 <__mulsi3>
8000d204:	00050893          	mv	a7,a0
8000d208:	00098593          	mv	a1,s3
8000d20c:	00030513          	mv	a0,t1
8000d210:	080000ef          	jal	ra,8000d290 <__mulsi3>
8000d214:	00050313          	mv	t1,a0
8000d218:	00080593          	mv	a1,a6
8000d21c:	000e8513          	mv	a0,t4
8000d220:	070000ef          	jal	ra,8000d290 <__mulsi3>
8000d224:	00050813          	mv	a6,a0
8000d228:	00098593          	mv	a1,s3
8000d22c:	000e8513          	mv	a0,t4
8000d230:	060000ef          	jal	ra,8000d290 <__mulsi3>
8000d234:	0108d693          	srli	a3,a7,0x10
8000d238:	01030333          	add	t1,t1,a6
8000d23c:	006686b3          	add	a3,a3,t1
8000d240:	0106f463          	bgeu	a3,a6,8000d248 <__udivdi3+0x58c>
8000d244:	01c50533          	add	a0,a0,t3
8000d248:	0106d613          	srli	a2,a3,0x10
8000d24c:	00a60533          	add	a0,a2,a0
8000d250:	02a76663          	bltu	a4,a0,8000d27c <__udivdi3+0x5c0>
8000d254:	bca714e3          	bne	a4,a0,8000ce1c <__udivdi3+0x160>
8000d258:	00010737          	lui	a4,0x10
8000d25c:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
8000d260:	00e6f6b3          	and	a3,a3,a4
8000d264:	01069693          	slli	a3,a3,0x10
8000d268:	00e8f8b3          	and	a7,a7,a4
8000d26c:	014b1633          	sll	a2,s6,s4
8000d270:	011686b3          	add	a3,a3,a7
8000d274:	00000a13          	li	s4,0
8000d278:	ccd67ce3          	bgeu	a2,a3,8000cf50 <__udivdi3+0x294>
8000d27c:	fff78793          	addi	a5,a5,-1 # ffffff <_stack_size+0xfff7ff>
8000d280:	b9dff06f          	j	8000ce1c <__udivdi3+0x160>
8000d284:	00000a13          	li	s4,0
8000d288:	00000793          	li	a5,0
8000d28c:	cc5ff06f          	j	8000cf50 <__udivdi3+0x294>

8000d290 <__mulsi3>:
8000d290:	00050613          	mv	a2,a0
8000d294:	00000513          	li	a0,0
8000d298:	0015f693          	andi	a3,a1,1
8000d29c:	00068463          	beqz	a3,8000d2a4 <__mulsi3+0x14>
8000d2a0:	00c50533          	add	a0,a0,a2
8000d2a4:	0015d593          	srli	a1,a1,0x1
8000d2a8:	00161613          	slli	a2,a2,0x1
8000d2ac:	fe0596e3          	bnez	a1,8000d298 <__mulsi3+0x8>
8000d2b0:	00008067          	ret

8000d2b4 <__divsi3>:
8000d2b4:	06054063          	bltz	a0,8000d314 <__umodsi3+0x10>
8000d2b8:	0605c663          	bltz	a1,8000d324 <__umodsi3+0x20>

8000d2bc <__udivsi3>:
8000d2bc:	00058613          	mv	a2,a1
8000d2c0:	00050593          	mv	a1,a0
8000d2c4:	fff00513          	li	a0,-1
8000d2c8:	02060c63          	beqz	a2,8000d300 <__udivsi3+0x44>
8000d2cc:	00100693          	li	a3,1
8000d2d0:	00b67a63          	bgeu	a2,a1,8000d2e4 <__udivsi3+0x28>
8000d2d4:	00c05863          	blez	a2,8000d2e4 <__udivsi3+0x28>
8000d2d8:	00161613          	slli	a2,a2,0x1
8000d2dc:	00169693          	slli	a3,a3,0x1
8000d2e0:	feb66ae3          	bltu	a2,a1,8000d2d4 <__udivsi3+0x18>
8000d2e4:	00000513          	li	a0,0
8000d2e8:	00c5e663          	bltu	a1,a2,8000d2f4 <__udivsi3+0x38>
8000d2ec:	40c585b3          	sub	a1,a1,a2
8000d2f0:	00d56533          	or	a0,a0,a3
8000d2f4:	0016d693          	srli	a3,a3,0x1
8000d2f8:	00165613          	srli	a2,a2,0x1
8000d2fc:	fe0696e3          	bnez	a3,8000d2e8 <__udivsi3+0x2c>
8000d300:	00008067          	ret

8000d304 <__umodsi3>:
8000d304:	00008293          	mv	t0,ra
8000d308:	fb5ff0ef          	jal	ra,8000d2bc <__udivsi3>
8000d30c:	00058513          	mv	a0,a1
8000d310:	00028067          	jr	t0 # 8000cc60 <memset+0xb4>
8000d314:	40a00533          	neg	a0,a0
8000d318:	0005d863          	bgez	a1,8000d328 <__umodsi3+0x24>
8000d31c:	40b005b3          	neg	a1,a1
8000d320:	f9dff06f          	j	8000d2bc <__udivsi3>
8000d324:	40b005b3          	neg	a1,a1
8000d328:	00008293          	mv	t0,ra
8000d32c:	f91ff0ef          	jal	ra,8000d2bc <__udivsi3>
8000d330:	40a00533          	neg	a0,a0
8000d334:	00028067          	jr	t0

8000d338 <__modsi3>:
8000d338:	00008293          	mv	t0,ra
8000d33c:	0005ca63          	bltz	a1,8000d350 <__modsi3+0x18>
8000d340:	00054c63          	bltz	a0,8000d358 <__modsi3+0x20>
8000d344:	f79ff0ef          	jal	ra,8000d2bc <__udivsi3>
8000d348:	00058513          	mv	a0,a1
8000d34c:	00028067          	jr	t0
8000d350:	40b005b3          	neg	a1,a1
8000d354:	fe0558e3          	bgez	a0,8000d344 <__modsi3+0xc>
8000d358:	40a00533          	neg	a0,a0
8000d35c:	f61ff0ef          	jal	ra,8000d2bc <__udivsi3>
8000d360:	40b00533          	neg	a0,a1
8000d364:	00028067          	jr	t0

Disassembly of section .text.startup:

8000d368 <main>:
8000d368:	eb010113          	addi	sp,sp,-336
8000d36c:	14112623          	sw	ra,332(sp)
8000d370:	14812423          	sw	s0,328(sp)
8000d374:	14912223          	sw	s1,324(sp)
8000d378:	15212023          	sw	s2,320(sp)
8000d37c:	13312e23          	sw	s3,316(sp)
8000d380:	13412c23          	sw	s4,312(sp)
8000d384:	13512a23          	sw	s5,308(sp)
8000d388:	13612823          	sw	s6,304(sp)
8000d38c:	13712623          	sw	s7,300(sp)
8000d390:	13812423          	sw	s8,296(sp)
8000d394:	30047073          	csrci	mstatus,8
8000d398:	f78f80ef          	jal	ra,80005b10 <init_sbrk>
8000d39c:	8701a783          	lw	a5,-1936(gp) # 800030a8 <deadbeef>
8000d3a0:	1a078663          	beqz	a5,8000d54c <main+0x1e4>
8000d3a4:	80002537          	lui	a0,0x80002
8000d3a8:	fc050513          	addi	a0,a0,-64 # 80001fc0 <_heap_end+0xfffeffc0>
8000d3ac:	fbcf80ef          	jal	ra,80005b68 <print_uart0>
8000d3b0:	8f5f80ef          	jal	ra,80005ca4 <hard_reboot>
8000d3b4:	8c01a583          	lw	a1,-1856(gp) # 800030f8 <sbrk_heap_end>
8000d3b8:	02010513          	addi	a0,sp,32
8000d3bc:	80003437          	lui	s0,0x80003
8000d3c0:	9f8f60ef          	jal	ra,800035b8 <to_hex>
8000d3c4:	80002537          	lui	a0,0x80002
8000d3c8:	fe850513          	addi	a0,a0,-24 # 80001fe8 <_heap_end+0xfffeffe8>
8000d3cc:	f9cf80ef          	jal	ra,80005b68 <print_uart0>
8000d3d0:	02010513          	addi	a0,sp,32
8000d3d4:	f94f80ef          	jal	ra,80005b68 <print_uart0>
8000d3d8:	80840513          	addi	a0,s0,-2040 # 80002808 <_heap_end+0xffff0808>
8000d3dc:	f8cf80ef          	jal	ra,80005b68 <print_uart0>
8000d3e0:	80002537          	lui	a0,0x80002
8000d3e4:	04300593          	li	a1,67
8000d3e8:	ff850513          	addi	a0,a0,-8 # 80001ff8 <_heap_end+0xfffefff8>
8000d3ec:	038010ef          	jal	ra,8000e424 <iprintf>
8000d3f0:	f00004b7          	lui	s1,0xf0000
8000d3f4:	0044a783          	lw	a5,4(s1) # f0000004 <_heap_end+0x6ffee004>
8000d3f8:	80002537          	lui	a0,0x80002
8000d3fc:	09050513          	addi	a0,a0,144 # 80002090 <_heap_end+0xffff0090>
8000d400:	0027e793          	ori	a5,a5,2
8000d404:	00f4a223          	sw	a5,4(s1)
8000d408:	01c010ef          	jal	ra,8000e424 <iprintf>
8000d40c:	f00547b7          	lui	a5,0xf0054
8000d410:	0007a023          	sw	zero,0(a5) # f0054000 <_heap_end+0x70042000>
8000d414:	0044a783          	lw	a5,4(s1)
8000d418:	03f00713          	li	a4,63
8000d41c:	01900613          	li	a2,25
8000d420:	ff77f793          	andi	a5,a5,-9
8000d424:	00f4a223          	sw	a5,4(s1)
8000d428:	f00607b7          	lui	a5,0xf0060
8000d42c:	00e7a623          	sw	a4,12(a5) # f006000c <_heap_end+0x7004e00c>
8000d430:	0007a223          	sw	zero,4(a5)
8000d434:	fff00713          	li	a4,-1
8000d438:	00e7a023          	sw	a4,0(a5)
8000d43c:	f0010737          	lui	a4,0xf0010
8000d440:	00472783          	lw	a5,4(a4) # f0010004 <_heap_end+0x6fffe004>
8000d444:	00100693          	li	a3,1
8000d448:	f0090537          	lui	a0,0xf0090
8000d44c:	0027e793          	ori	a5,a5,2
8000d450:	00f72223          	sw	a5,4(a4)
8000d454:	f0011737          	lui	a4,0xf0011
8000d458:	00472783          	lw	a5,4(a4) # f0011004 <_heap_end+0x6ffff004>
8000d45c:	0027e793          	ori	a5,a5,2
8000d460:	00f72223          	sw	a5,4(a4)
8000d464:	f00207b7          	lui	a5,0xf0020
8000d468:	0007a023          	sw	zero,0(a5) # f0020000 <_heap_end+0x7000e000>
8000d46c:	00c7a223          	sw	a2,4(a5)
8000d470:	0007a423          	sw	zero,8(a5)
8000d474:	00018737          	lui	a4,0x18
8000d478:	0007a623          	sw	zero,12(a5)
8000d47c:	6a070713          	addi	a4,a4,1696 # 186a0 <_stack_size+0x17ea0>
8000d480:	00e7a823          	sw	a4,16(a5)
8000d484:	00d7a023          	sw	a3,0(a5)
8000d488:	f00217b7          	lui	a5,0xf0021
8000d48c:	0007a023          	sw	zero,0(a5) # f0021000 <_heap_end+0x7000f000>
8000d490:	00c7a223          	sw	a2,4(a5)
8000d494:	0007a423          	sw	zero,8(a5)
8000d498:	0000c737          	lui	a4,0xc
8000d49c:	0007a623          	sw	zero,12(a5)
8000d4a0:	35070713          	addi	a4,a4,848 # c350 <_stack_size+0xbb50>
8000d4a4:	00e7a823          	sw	a4,16(a5)
8000d4a8:	00d7a023          	sw	a3,0(a5)
8000d4ac:	df8f80ef          	jal	ra,80005aa4 <i2c_init>
8000d4b0:	30046073          	csrsi	mstatus,8
8000d4b4:	0007a937          	lui	s2,0x7a
8000d4b8:	00a00493          	li	s1,10
8000d4bc:	00200b93          	li	s7,2
8000d4c0:	000a8993          	mv	s3,s5
8000d4c4:	f0000c37          	lui	s8,0xf0000
8000d4c8:	f0010a37          	lui	s4,0xf0010
8000d4cc:	02e00b13          	li	s6,46
8000d4d0:	12090913          	addi	s2,s2,288 # 7a120 <_stack_size+0x79920>
8000d4d4:	87c1a783          	lw	a5,-1924(gp) # 800030b4 <uart_config_reset_counter>
8000d4d8:	02fbe863          	bltu	s7,a5,8000d508 <main+0x1a0>
8000d4dc:	000c2783          	lw	a5,0(s8) # f0000000 <_heap_end+0x6ffee000>
8000d4e0:	0207d463          	bgez	a5,8000d508 <main+0x1a0>
8000d4e4:	004a2783          	lw	a5,4(s4) # f0010004 <_heap_end+0x6fffe004>
8000d4e8:	0107d793          	srli	a5,a5,0x10
8000d4ec:	0ff7f793          	andi	a5,a5,255
8000d4f0:	fe078ae3          	beqz	a5,8000d4e4 <main+0x17c>
8000d4f4:	016a2023          	sw	s6,0(s4)
8000d4f8:	00090513          	mv	a0,s2
8000d4fc:	fff48493          	addi	s1,s1,-1
8000d500:	e38f80ef          	jal	ra,80005b38 <delay_us>
8000d504:	fc0498e3          	bnez	s1,8000d4d4 <main+0x16c>
8000d508:	80840513          	addi	a0,s0,-2040
8000d50c:	719000ef          	jal	ra,8000e424 <iprintf>
8000d510:	800034b7          	lui	s1,0x80003
8000d514:	02000613          	li	a2,32
8000d518:	fa848593          	addi	a1,s1,-88 # 80002fa8 <_heap_end+0xffff0fa8>
8000d51c:	98c18513          	addi	a0,gp,-1652 # 800031c4 <active_config>
8000d520:	2c5000ef          	jal	ra,8000dfe4 <memcpy>
8000d524:	87c1a703          	lw	a4,-1924(gp) # 800030b4 <uart_config_reset_counter>
8000d528:	00200793          	li	a5,2
8000d52c:	02e7f863          	bgeu	a5,a4,8000d55c <main+0x1f4>
8000d530:	800025b7          	lui	a1,0x80002
8000d534:	8601ae23          	sw	zero,-1924(gp) # 800030b4 <uart_config_reset_counter>
8000d538:	0a458593          	addi	a1,a1,164 # 800020a4 <_heap_end+0xffff00a4>
8000d53c:	80002537          	lui	a0,0x80002
8000d540:	0b450513          	addi	a0,a0,180 # 800020b4 <_heap_end+0xffff00b4>
8000d544:	6e1000ef          	jal	ra,8000e424 <iprintf>
8000d548:	0500006f          	j	8000d598 <main+0x230>
8000d54c:	deadc7b7          	lui	a5,0xdeadc
8000d550:	eef78793          	addi	a5,a5,-273 # deadbeef <_heap_end+0x5eac9eef>
8000d554:	86f1a823          	sw	a5,-1936(gp) # 800030a8 <deadbeef>
8000d558:	e5dff06f          	j	8000d3b4 <main+0x4c>
8000d55c:	f00007b7          	lui	a5,0xf0000
8000d560:	0007a783          	lw	a5,0(a5) # f0000000 <_heap_end+0x6ffee000>
8000d564:	0007c863          	bltz	a5,8000d574 <main+0x20c>
8000d568:	800025b7          	lui	a1,0x80002
8000d56c:	0d858593          	addi	a1,a1,216 # 800020d8 <_heap_end+0xffff00d8>
8000d570:	fcdff06f          	j	8000d53c <main+0x1d4>
8000d574:	f0090537          	lui	a0,0xf0090
8000d578:	ce1f60ef          	jal	ra,80004258 <eeprom_probe>
8000d57c:	2c051e63          	bnez	a0,8000d858 <main+0x4f0>
8000d580:	98c18513          	addi	a0,gp,-1652 # 800031c4 <active_config>
8000d584:	e6cf60ef          	jal	ra,80003bf0 <config_load>
8000d588:	2a051a63          	bnez	a0,8000d83c <main+0x4d4>
8000d58c:	80002537          	lui	a0,0x80002
8000d590:	0e450513          	addi	a0,a0,228 # 800020e4 <_heap_end+0xffff00e4>
8000d594:	691000ef          	jal	ra,8000e424 <iprintf>
8000d598:	30047073          	csrci	mstatus,8
8000d59c:	98c18413          	addi	s0,gp,-1652 # 800031c4 <active_config>
8000d5a0:	01344503          	lbu	a0,19(s0)
8000d5a4:	d21f70ef          	jal	ra,800052c4 <hub_init>
8000d5a8:	8bdf70ef          	jal	ra,80004e64 <mac_lwip_init>
8000d5ac:	a28f80ef          	jal	ra,800057d4 <modbus_udp_init>
8000d5b0:	bf0f60ef          	jal	ra,800039a0 <modbus_rtu_init>
8000d5b4:	80002537          	lui	a0,0x80002
8000d5b8:	12850513          	addi	a0,a0,296 # 80002128 <_heap_end+0xffff0128>
8000d5bc:	669000ef          	jal	ra,8000e424 <iprintf>
8000d5c0:	f0000737          	lui	a4,0xf0000
8000d5c4:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
8000d5c8:	ff87f793          	andi	a5,a5,-8
8000d5cc:	00f72223          	sw	a5,4(a4)
8000d5d0:	30046073          	csrsi	mstatus,8
8000d5d4:	800004b7          	lui	s1,0x80000
8000d5d8:	800026b7          	lui	a3,0x80002
8000d5dc:	13448793          	addi	a5,s1,308 # 80000134 <_heap_end+0xfffee134>
8000d5e0:	00800893          	li	a7,8
8000d5e4:	00600813          	li	a6,6
8000d5e8:	00500713          	li	a4,5
8000d5ec:	14068693          	addi	a3,a3,320 # 80002140 <_heap_end+0xffff0140>
8000d5f0:	03f00613          	li	a2,63
8000d5f4:	00000593          	li	a1,0
8000d5f8:	00600513          	li	a0,6
8000d5fc:	8f4f80ef          	jal	ra,800056f0 <hub_print>
8000d600:	01444603          	lbu	a2,20(s0)
8000d604:	800025b7          	lui	a1,0x80002
8000d608:	14858593          	addi	a1,a1,328 # 80002148 <_heap_end+0xffff0148>
8000d60c:	00010513          	mv	a0,sp
8000d610:	09c010ef          	jal	ra,8000e6ac <siprintf>
8000d614:	13448793          	addi	a5,s1,308
8000d618:	00050713          	mv	a4,a0
8000d61c:	00800893          	li	a7,8
8000d620:	00600813          	li	a6,6
8000d624:	00010693          	mv	a3,sp
8000d628:	03f00613          	li	a2,63
8000d62c:	00800593          	li	a1,8
8000d630:	00000513          	li	a0,0
8000d634:	8bcf80ef          	jal	ra,800056f0 <hub_print>
8000d638:	001e8937          	lui	s2,0x1e8
8000d63c:	48090513          	addi	a0,s2,1152 # 1e8480 <_stack_size+0x1e7c80>
8000d640:	fe5f50ef          	jal	ra,80003624 <process_and_wait>
8000d644:	800026b7          	lui	a3,0x80002
8000d648:	13448793          	addi	a5,s1,308
8000d64c:	00800893          	li	a7,8
8000d650:	00600813          	li	a6,6
8000d654:	00500713          	li	a4,5
8000d658:	14c68693          	addi	a3,a3,332 # 8000214c <_heap_end+0xffff014c>
8000d65c:	03f00613          	li	a2,63
8000d660:	00000593          	li	a1,0
8000d664:	00600513          	li	a0,6
8000d668:	888f80ef          	jal	ra,800056f0 <hub_print>
8000d66c:	9ac18413          	addi	s0,gp,-1620 # 800031e4 <default_netif>
8000d670:	00444603          	lbu	a2,4(s0)
8000d674:	800029b7          	lui	s3,0x80002
8000d678:	15498593          	addi	a1,s3,340 # 80002154 <_heap_end+0xffff0154>
8000d67c:	00010513          	mv	a0,sp
8000d680:	02c010ef          	jal	ra,8000e6ac <siprintf>
8000d684:	13448793          	addi	a5,s1,308
8000d688:	00050713          	mv	a4,a0
8000d68c:	00800893          	li	a7,8
8000d690:	00600813          	li	a6,6
8000d694:	00010693          	mv	a3,sp
8000d698:	03f00613          	li	a2,63
8000d69c:	00800593          	li	a1,8
8000d6a0:	00000513          	li	a0,0
8000d6a4:	84cf80ef          	jal	ra,800056f0 <hub_print>
8000d6a8:	48090513          	addi	a0,s2,1152
8000d6ac:	f79f50ef          	jal	ra,80003624 <process_and_wait>
8000d6b0:	00544603          	lbu	a2,5(s0)
8000d6b4:	15498593          	addi	a1,s3,340
8000d6b8:	00010513          	mv	a0,sp
8000d6bc:	7f1000ef          	jal	ra,8000e6ac <siprintf>
8000d6c0:	13448793          	addi	a5,s1,308
8000d6c4:	00050713          	mv	a4,a0
8000d6c8:	00800893          	li	a7,8
8000d6cc:	00600813          	li	a6,6
8000d6d0:	00010693          	mv	a3,sp
8000d6d4:	03f00613          	li	a2,63
8000d6d8:	00800593          	li	a1,8
8000d6dc:	00000513          	li	a0,0
8000d6e0:	810f80ef          	jal	ra,800056f0 <hub_print>
8000d6e4:	48090513          	addi	a0,s2,1152
8000d6e8:	f3df50ef          	jal	ra,80003624 <process_and_wait>
8000d6ec:	00644603          	lbu	a2,6(s0)
8000d6f0:	15498593          	addi	a1,s3,340
8000d6f4:	00010513          	mv	a0,sp
8000d6f8:	7b5000ef          	jal	ra,8000e6ac <siprintf>
8000d6fc:	13448793          	addi	a5,s1,308
8000d700:	00050713          	mv	a4,a0
8000d704:	00800893          	li	a7,8
8000d708:	00600813          	li	a6,6
8000d70c:	00010693          	mv	a3,sp
8000d710:	03f00613          	li	a2,63
8000d714:	00800593          	li	a1,8
8000d718:	00000513          	li	a0,0
8000d71c:	fd5f70ef          	jal	ra,800056f0 <hub_print>
8000d720:	48090513          	addi	a0,s2,1152
8000d724:	f01f50ef          	jal	ra,80003624 <process_and_wait>
8000d728:	00744603          	lbu	a2,7(s0)
8000d72c:	15498593          	addi	a1,s3,340
8000d730:	00010513          	mv	a0,sp
8000d734:	779000ef          	jal	ra,8000e6ac <siprintf>
8000d738:	13448793          	addi	a5,s1,308
8000d73c:	00050713          	mv	a4,a0
8000d740:	00800893          	li	a7,8
8000d744:	00600813          	li	a6,6
8000d748:	00010693          	mv	a3,sp
8000d74c:	03f00613          	li	a2,63
8000d750:	00800593          	li	a1,8
8000d754:	00000513          	li	a0,0
8000d758:	f99f70ef          	jal	ra,800056f0 <hub_print>
8000d75c:	48090513          	addi	a0,s2,1152
8000d760:	ec5f50ef          	jal	ra,80003624 <process_and_wait>
8000d764:	8b81a603          	lw	a2,-1864(gp) # 800030f0 <hub_frame_size>
8000d768:	00000593          	li	a1,0
8000d76c:	f0050537          	lui	a0,0xf0050
8000d770:	0003d4b7          	lui	s1,0x3d
8000d774:	c38ff0ef          	jal	ra,8000cbac <memset>
8000d778:	09048493          	addi	s1,s1,144 # 3d090 <_stack_size+0x3c890>
8000d77c:	80002bb7          	lui	s7,0x80002
8000d780:	80002c37          	lui	s8,0x80002
8000d784:	f0000937          	lui	s2,0xf0000
8000d788:	00492783          	lw	a5,4(s2) # f0000004 <_heap_end+0x6ffee004>
8000d78c:	00048513          	mv	a0,s1
8000d790:	0017e793          	ori	a5,a5,1
8000d794:	00f92223          	sw	a5,4(s2)
8000d798:	e8df50ef          	jal	ra,80003624 <process_and_wait>
8000d79c:	00492783          	lw	a5,4(s2)
8000d7a0:	00048513          	mv	a0,s1
8000d7a4:	ffe7f793          	andi	a5,a5,-2
8000d7a8:	00f92223          	sw	a5,4(s2)
8000d7ac:	e79f50ef          	jal	ra,80003624 <process_and_wait>
8000d7b0:	30047073          	csrci	mstatus,8
8000d7b4:	f00547b7          	lui	a5,0xf0054
8000d7b8:	0007a603          	lw	a2,0(a5) # f0054000 <_heap_end+0x70042000>
8000d7bc:	8b81a683          	lw	a3,-1864(gp) # 800030f0 <hub_frame_size>
8000d7c0:	88c1a703          	lw	a4,-1908(gp) # 800030c4 <reg_irq_counter>
8000d7c4:	8881a783          	lw	a5,-1912(gp) # 800030c0 <reg_sys_counter>
8000d7c8:	8841a803          	lw	a6,-1916(gp) # 800030bc <reg_scratch>
8000d7cc:	07f67613          	andi	a2,a2,127
8000d7d0:	04300593          	li	a1,67
8000d7d4:	15cb8513          	addi	a0,s7,348 # 8000215c <_heap_end+0xffff015c>
8000d7d8:	44d000ef          	jal	ra,8000e424 <iprintf>
8000d7dc:	f00607b7          	lui	a5,0xf0060
8000d7e0:	0007a583          	lw	a1,0(a5) # f0060000 <_heap_end+0x7004e000>
8000d7e4:	0047a603          	lw	a2,4(a5)
8000d7e8:	00c7a683          	lw	a3,12(a5)
8000d7ec:	0087a703          	lw	a4,8(a5)
8000d7f0:	0107a783          	lw	a5,16(a5)
8000d7f4:	1d0c0513          	addi	a0,s8,464 # 800021d0 <_heap_end+0xffff01d0>
8000d7f8:	42d000ef          	jal	ra,8000e424 <iprintf>
8000d7fc:	a85f70ef          	jal	ra,80005280 <mac_print_stats>
8000d800:	30046073          	csrsi	mstatus,8
8000d804:	eb9f50ef          	jal	ra,800036bc <sram_test_write_shorts>
8000d808:	8881a783          	lw	a5,-1912(gp) # 800030c0 <reg_sys_counter>
8000d80c:	00178793          	addi	a5,a5,1
8000d810:	88f1a423          	sw	a5,-1912(gp) # 800030c0 <reg_sys_counter>
8000d814:	8801a783          	lw	a5,-1920(gp) # 800030b8 <reg_config_write>
8000d818:	00078863          	beqz	a5,8000d828 <main+0x4c0>
8000d81c:	8801a783          	lw	a5,-1920(gp) # 800030b8 <reg_config_write>
8000d820:	fff78793          	addi	a5,a5,-1
8000d824:	88f1a023          	sw	a5,-1920(gp) # 800030b8 <reg_config_write>
8000d828:	f0000737          	lui	a4,0xf0000
8000d82c:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
8000d830:	ffd7f793          	andi	a5,a5,-3
8000d834:	00f72223          	sw	a5,4(a4)
8000d838:	f4dff06f          	j	8000d784 <main+0x41c>
8000d83c:	fa848593          	addi	a1,s1,-88
8000d840:	02000613          	li	a2,32
8000d844:	98c18513          	addi	a0,gp,-1652 # 800031c4 <active_config>
8000d848:	79c000ef          	jal	ra,8000dfe4 <memcpy>
8000d84c:	800025b7          	lui	a1,0x80002
8000d850:	10058593          	addi	a1,a1,256 # 80002100 <_heap_end+0xffff0100>
8000d854:	ce9ff06f          	j	8000d53c <main+0x1d4>
8000d858:	800025b7          	lui	a1,0x80002
8000d85c:	11458593          	addi	a1,a1,276 # 80002114 <_heap_end+0xffff0114>
8000d860:	cddff06f          	j	8000d53c <main+0x1d4>

Disassembly of section .text.atoi:

8000d864 <atoi>:
8000d864:	00a00613          	li	a2,10
8000d868:	00000593          	li	a1,0
8000d86c:	2700106f          	j	8000eadc <strtol>

Disassembly of section .text._atoi_r:

8000d870 <_atoi_r>:
8000d870:	00a00693          	li	a3,10
8000d874:	00000613          	li	a2,0
8000d878:	2480106f          	j	8000eac0 <_strtol_r>

Disassembly of section .text.calloc:

8000d87c <calloc>:
8000d87c:	80c18793          	addi	a5,gp,-2036 # 80003044 <_impure_ptr>
8000d880:	00058613          	mv	a2,a1
8000d884:	00050593          	mv	a1,a0
8000d888:	0007a503          	lw	a0,0(a5)
8000d88c:	08d0006f          	j	8000e118 <_calloc_r>

Disassembly of section .text.__sflush_r:

8000d890 <__sflush_r>:
8000d890:	00c5d783          	lhu	a5,12(a1)
8000d894:	fe010113          	addi	sp,sp,-32
8000d898:	00812c23          	sw	s0,24(sp)
8000d89c:	00912a23          	sw	s1,20(sp)
8000d8a0:	00112e23          	sw	ra,28(sp)
8000d8a4:	01212823          	sw	s2,16(sp)
8000d8a8:	01312623          	sw	s3,12(sp)
8000d8ac:	0087f713          	andi	a4,a5,8
8000d8b0:	00050493          	mv	s1,a0
8000d8b4:	00058413          	mv	s0,a1
8000d8b8:	14071e63          	bnez	a4,8000da14 <__sflush_r+0x184>
8000d8bc:	0045a703          	lw	a4,4(a1)
8000d8c0:	00e04a63          	bgtz	a4,8000d8d4 <__sflush_r+0x44>
8000d8c4:	0405a703          	lw	a4,64(a1)
8000d8c8:	00e04663          	bgtz	a4,8000d8d4 <__sflush_r+0x44>
8000d8cc:	00000513          	li	a0,0
8000d8d0:	11c0006f          	j	8000d9ec <__sflush_r+0x15c>
8000d8d4:	02c42703          	lw	a4,44(s0)
8000d8d8:	fe070ae3          	beqz	a4,8000d8cc <__sflush_r+0x3c>
8000d8dc:	0004a903          	lw	s2,0(s1)
8000d8e0:	01379693          	slli	a3,a5,0x13
8000d8e4:	0004a023          	sw	zero,0(s1)
8000d8e8:	0a06de63          	bgez	a3,8000d9a4 <__sflush_r+0x114>
8000d8ec:	05442503          	lw	a0,84(s0)
8000d8f0:	00c45783          	lhu	a5,12(s0)
8000d8f4:	0047f793          	andi	a5,a5,4
8000d8f8:	00078e63          	beqz	a5,8000d914 <__sflush_r+0x84>
8000d8fc:	00442783          	lw	a5,4(s0)
8000d900:	40f50533          	sub	a0,a0,a5
8000d904:	03442783          	lw	a5,52(s0)
8000d908:	00078663          	beqz	a5,8000d914 <__sflush_r+0x84>
8000d90c:	04042783          	lw	a5,64(s0)
8000d910:	40f50533          	sub	a0,a0,a5
8000d914:	02c42783          	lw	a5,44(s0)
8000d918:	02042583          	lw	a1,32(s0)
8000d91c:	00050613          	mv	a2,a0
8000d920:	00000693          	li	a3,0
8000d924:	00048513          	mv	a0,s1
8000d928:	000780e7          	jalr	a5
8000d92c:	fff00793          	li	a5,-1
8000d930:	00c45703          	lhu	a4,12(s0)
8000d934:	02f51263          	bne	a0,a5,8000d958 <__sflush_r+0xc8>
8000d938:	0004a683          	lw	a3,0(s1)
8000d93c:	01d00793          	li	a5,29
8000d940:	0cd7e463          	bltu	a5,a3,8000da08 <__sflush_r+0x178>
8000d944:	204007b7          	lui	a5,0x20400
8000d948:	00178793          	addi	a5,a5,1 # 20400001 <_stack_size+0x203ff801>
8000d94c:	00d7d7b3          	srl	a5,a5,a3
8000d950:	0017f793          	andi	a5,a5,1
8000d954:	0a078a63          	beqz	a5,8000da08 <__sflush_r+0x178>
8000d958:	01042783          	lw	a5,16(s0)
8000d95c:	00042223          	sw	zero,4(s0)
8000d960:	00f42023          	sw	a5,0(s0)
8000d964:	01371793          	slli	a5,a4,0x13
8000d968:	0007dc63          	bgez	a5,8000d980 <__sflush_r+0xf0>
8000d96c:	fff00793          	li	a5,-1
8000d970:	00f51663          	bne	a0,a5,8000d97c <__sflush_r+0xec>
8000d974:	0004a783          	lw	a5,0(s1)
8000d978:	00079463          	bnez	a5,8000d980 <__sflush_r+0xf0>
8000d97c:	04a42a23          	sw	a0,84(s0)
8000d980:	03442583          	lw	a1,52(s0)
8000d984:	0124a023          	sw	s2,0(s1)
8000d988:	f40582e3          	beqz	a1,8000d8cc <__sflush_r+0x3c>
8000d98c:	04440793          	addi	a5,s0,68
8000d990:	00f58663          	beq	a1,a5,8000d99c <__sflush_r+0x10c>
8000d994:	00048513          	mv	a0,s1
8000d998:	7d4000ef          	jal	ra,8000e16c <_free_r>
8000d99c:	02042a23          	sw	zero,52(s0)
8000d9a0:	f2dff06f          	j	8000d8cc <__sflush_r+0x3c>
8000d9a4:	02042583          	lw	a1,32(s0)
8000d9a8:	00100693          	li	a3,1
8000d9ac:	00000613          	li	a2,0
8000d9b0:	00048513          	mv	a0,s1
8000d9b4:	000700e7          	jalr	a4
8000d9b8:	fff00793          	li	a5,-1
8000d9bc:	f2f51ae3          	bne	a0,a5,8000d8f0 <__sflush_r+0x60>
8000d9c0:	0004a783          	lw	a5,0(s1)
8000d9c4:	f20786e3          	beqz	a5,8000d8f0 <__sflush_r+0x60>
8000d9c8:	01d00713          	li	a4,29
8000d9cc:	00e78663          	beq	a5,a4,8000d9d8 <__sflush_r+0x148>
8000d9d0:	01600713          	li	a4,22
8000d9d4:	00e79663          	bne	a5,a4,8000d9e0 <__sflush_r+0x150>
8000d9d8:	0124a023          	sw	s2,0(s1)
8000d9dc:	ef1ff06f          	j	8000d8cc <__sflush_r+0x3c>
8000d9e0:	00c45783          	lhu	a5,12(s0)
8000d9e4:	0407e793          	ori	a5,a5,64
8000d9e8:	00f41623          	sh	a5,12(s0)
8000d9ec:	01c12083          	lw	ra,28(sp)
8000d9f0:	01812403          	lw	s0,24(sp)
8000d9f4:	01412483          	lw	s1,20(sp)
8000d9f8:	01012903          	lw	s2,16(sp)
8000d9fc:	00c12983          	lw	s3,12(sp)
8000da00:	02010113          	addi	sp,sp,32
8000da04:	00008067          	ret
8000da08:	04076713          	ori	a4,a4,64
8000da0c:	00e41623          	sh	a4,12(s0)
8000da10:	fddff06f          	j	8000d9ec <__sflush_r+0x15c>
8000da14:	0105a983          	lw	s3,16(a1)
8000da18:	ea098ae3          	beqz	s3,8000d8cc <__sflush_r+0x3c>
8000da1c:	0005a903          	lw	s2,0(a1)
8000da20:	0037f793          	andi	a5,a5,3
8000da24:	0135a023          	sw	s3,0(a1)
8000da28:	41390933          	sub	s2,s2,s3
8000da2c:	00000713          	li	a4,0
8000da30:	00079463          	bnez	a5,8000da38 <__sflush_r+0x1a8>
8000da34:	0145a703          	lw	a4,20(a1)
8000da38:	00e42423          	sw	a4,8(s0)
8000da3c:	e92058e3          	blez	s2,8000d8cc <__sflush_r+0x3c>
8000da40:	02842783          	lw	a5,40(s0)
8000da44:	02042583          	lw	a1,32(s0)
8000da48:	00090693          	mv	a3,s2
8000da4c:	00098613          	mv	a2,s3
8000da50:	00048513          	mv	a0,s1
8000da54:	000780e7          	jalr	a5
8000da58:	00a04c63          	bgtz	a0,8000da70 <__sflush_r+0x1e0>
8000da5c:	00c45783          	lhu	a5,12(s0)
8000da60:	fff00513          	li	a0,-1
8000da64:	0407e793          	ori	a5,a5,64
8000da68:	00f41623          	sh	a5,12(s0)
8000da6c:	f81ff06f          	j	8000d9ec <__sflush_r+0x15c>
8000da70:	00a989b3          	add	s3,s3,a0
8000da74:	40a90933          	sub	s2,s2,a0
8000da78:	fc5ff06f          	j	8000da3c <__sflush_r+0x1ac>

Disassembly of section .text._fflush_r:

8000da7c <_fflush_r>:
8000da7c:	0105a783          	lw	a5,16(a1)
8000da80:	08078a63          	beqz	a5,8000db14 <_fflush_r+0x98>
8000da84:	fe010113          	addi	sp,sp,-32
8000da88:	00812c23          	sw	s0,24(sp)
8000da8c:	00112e23          	sw	ra,28(sp)
8000da90:	00050413          	mv	s0,a0
8000da94:	00050c63          	beqz	a0,8000daac <_fflush_r+0x30>
8000da98:	01852783          	lw	a5,24(a0) # f0050018 <_heap_end+0x7003e018>
8000da9c:	00079863          	bnez	a5,8000daac <_fflush_r+0x30>
8000daa0:	00b12623          	sw	a1,12(sp)
8000daa4:	1c8000ef          	jal	ra,8000dc6c <__sinit>
8000daa8:	00c12583          	lw	a1,12(sp)
8000daac:	ffff5797          	auipc	a5,0xffff5
8000dab0:	38078793          	addi	a5,a5,896 # 80002e2c <__sf_fake_stdin>
8000dab4:	02f59263          	bne	a1,a5,8000dad8 <_fflush_r+0x5c>
8000dab8:	00442583          	lw	a1,4(s0)
8000dabc:	00c59783          	lh	a5,12(a1)
8000dac0:	04078063          	beqz	a5,8000db00 <_fflush_r+0x84>
8000dac4:	00040513          	mv	a0,s0
8000dac8:	01812403          	lw	s0,24(sp)
8000dacc:	01c12083          	lw	ra,28(sp)
8000dad0:	02010113          	addi	sp,sp,32
8000dad4:	dbdff06f          	j	8000d890 <__sflush_r>
8000dad8:	ffff5797          	auipc	a5,0xffff5
8000dadc:	37478793          	addi	a5,a5,884 # 80002e4c <__sf_fake_stdout>
8000dae0:	00f59663          	bne	a1,a5,8000daec <_fflush_r+0x70>
8000dae4:	00842583          	lw	a1,8(s0)
8000dae8:	fd5ff06f          	j	8000dabc <_fflush_r+0x40>
8000daec:	ffff5797          	auipc	a5,0xffff5
8000daf0:	32078793          	addi	a5,a5,800 # 80002e0c <__sf_fake_stderr>
8000daf4:	fcf594e3          	bne	a1,a5,8000dabc <_fflush_r+0x40>
8000daf8:	00c42583          	lw	a1,12(s0)
8000dafc:	fc1ff06f          	j	8000dabc <_fflush_r+0x40>
8000db00:	01c12083          	lw	ra,28(sp)
8000db04:	01812403          	lw	s0,24(sp)
8000db08:	00000513          	li	a0,0
8000db0c:	02010113          	addi	sp,sp,32
8000db10:	00008067          	ret
8000db14:	00000513          	li	a0,0
8000db18:	00008067          	ret

Disassembly of section .text.fflush:

8000db1c <fflush>:
8000db1c:	00050593          	mv	a1,a0
8000db20:	00051c63          	bnez	a0,8000db38 <fflush+0x1c>
8000db24:	c4818793          	addi	a5,gp,-952 # 80003480 <_bss_end>
8000db28:	0007a503          	lw	a0,0(a5)
8000db2c:	00000597          	auipc	a1,0x0
8000db30:	f5058593          	addi	a1,a1,-176 # 8000da7c <_fflush_r>
8000db34:	3ac0006f          	j	8000dee0 <_fwalk_reent>
8000db38:	80c18793          	addi	a5,gp,-2036 # 80003044 <_impure_ptr>
8000db3c:	0007a503          	lw	a0,0(a5)
8000db40:	f3dff06f          	j	8000da7c <_fflush_r>

Disassembly of section .text.__fp_lock:

8000db44 <__fp_lock>:
8000db44:	00000513          	li	a0,0
8000db48:	00008067          	ret

Disassembly of section .text.std:

8000db4c <std>:
8000db4c:	ff010113          	addi	sp,sp,-16
8000db50:	00812423          	sw	s0,8(sp)
8000db54:	00112623          	sw	ra,12(sp)
8000db58:	00050413          	mv	s0,a0
8000db5c:	00b51623          	sh	a1,12(a0)
8000db60:	00c51723          	sh	a2,14(a0)
8000db64:	00052023          	sw	zero,0(a0)
8000db68:	00052223          	sw	zero,4(a0)
8000db6c:	00052423          	sw	zero,8(a0)
8000db70:	06052223          	sw	zero,100(a0)
8000db74:	00052823          	sw	zero,16(a0)
8000db78:	00052a23          	sw	zero,20(a0)
8000db7c:	00052c23          	sw	zero,24(a0)
8000db80:	00800613          	li	a2,8
8000db84:	00000593          	li	a1,0
8000db88:	05c50513          	addi	a0,a0,92
8000db8c:	820ff0ef          	jal	ra,8000cbac <memset>
8000db90:	00001797          	auipc	a5,0x1
8000db94:	b9078793          	addi	a5,a5,-1136 # 8000e720 <__sread>
8000db98:	02f42223          	sw	a5,36(s0)
8000db9c:	00001797          	auipc	a5,0x1
8000dba0:	bdc78793          	addi	a5,a5,-1060 # 8000e778 <__swrite>
8000dba4:	02f42423          	sw	a5,40(s0)
8000dba8:	00001797          	auipc	a5,0x1
8000dbac:	c5478793          	addi	a5,a5,-940 # 8000e7fc <__sseek>
8000dbb0:	02f42623          	sw	a5,44(s0)
8000dbb4:	00001797          	auipc	a5,0x1
8000dbb8:	ca078793          	addi	a5,a5,-864 # 8000e854 <__sclose>
8000dbbc:	02842023          	sw	s0,32(s0)
8000dbc0:	02f42823          	sw	a5,48(s0)
8000dbc4:	00c12083          	lw	ra,12(sp)
8000dbc8:	00812403          	lw	s0,8(sp)
8000dbcc:	01010113          	addi	sp,sp,16
8000dbd0:	00008067          	ret

Disassembly of section .text._cleanup_r:

8000dbd4 <_cleanup_r>:
8000dbd4:	00000597          	auipc	a1,0x0
8000dbd8:	ea858593          	addi	a1,a1,-344 # 8000da7c <_fflush_r>
8000dbdc:	3040006f          	j	8000dee0 <_fwalk_reent>

Disassembly of section .text.__fp_unlock:

8000dbe0 <__fp_unlock>:
8000dbe0:	00000513          	li	a0,0
8000dbe4:	00008067          	ret

Disassembly of section .text.__sfmoreglue:

8000dbe8 <__sfmoreglue>:
8000dbe8:	ff010113          	addi	sp,sp,-16
8000dbec:	fff58613          	addi	a2,a1,-1
8000dbf0:	00812423          	sw	s0,8(sp)
8000dbf4:	00161413          	slli	s0,a2,0x1
8000dbf8:	00c40433          	add	s0,s0,a2
8000dbfc:	00241413          	slli	s0,s0,0x2
8000dc00:	00c40433          	add	s0,s0,a2
8000dc04:	00341413          	slli	s0,s0,0x3
8000dc08:	01212023          	sw	s2,0(sp)
8000dc0c:	00058913          	mv	s2,a1
8000dc10:	07440593          	addi	a1,s0,116
8000dc14:	00912223          	sw	s1,4(sp)
8000dc18:	00112623          	sw	ra,12(sp)
8000dc1c:	654000ef          	jal	ra,8000e270 <_malloc_r>
8000dc20:	00050493          	mv	s1,a0
8000dc24:	02050063          	beqz	a0,8000dc44 <__sfmoreglue+0x5c>
8000dc28:	00052023          	sw	zero,0(a0)
8000dc2c:	01252223          	sw	s2,4(a0)
8000dc30:	00c50513          	addi	a0,a0,12
8000dc34:	00a4a423          	sw	a0,8(s1)
8000dc38:	06840613          	addi	a2,s0,104
8000dc3c:	00000593          	li	a1,0
8000dc40:	f6dfe0ef          	jal	ra,8000cbac <memset>
8000dc44:	00c12083          	lw	ra,12(sp)
8000dc48:	00812403          	lw	s0,8(sp)
8000dc4c:	00048513          	mv	a0,s1
8000dc50:	00012903          	lw	s2,0(sp)
8000dc54:	00412483          	lw	s1,4(sp)
8000dc58:	01010113          	addi	sp,sp,16
8000dc5c:	00008067          	ret

Disassembly of section .text._cleanup:

8000dc60 <_cleanup>:
8000dc60:	c4818793          	addi	a5,gp,-952 # 80003480 <_bss_end>
8000dc64:	0007a503          	lw	a0,0(a5)
8000dc68:	f6dff06f          	j	8000dbd4 <_cleanup_r>

Disassembly of section .text.__sinit:

8000dc6c <__sinit>:
8000dc6c:	01852783          	lw	a5,24(a0)
8000dc70:	0a079463          	bnez	a5,8000dd18 <__sinit+0xac>
8000dc74:	ff010113          	addi	sp,sp,-16
8000dc78:	00112623          	sw	ra,12(sp)
8000dc7c:	00812423          	sw	s0,8(sp)
8000dc80:	00000797          	auipc	a5,0x0
8000dc84:	f5478793          	addi	a5,a5,-172 # 8000dbd4 <_cleanup_r>
8000dc88:	02f52423          	sw	a5,40(a0)
8000dc8c:	c4818793          	addi	a5,gp,-952 # 80003480 <_bss_end>
8000dc90:	0007a783          	lw	a5,0(a5)
8000dc94:	04052423          	sw	zero,72(a0)
8000dc98:	04052623          	sw	zero,76(a0)
8000dc9c:	04052823          	sw	zero,80(a0)
8000dca0:	00f51663          	bne	a0,a5,8000dcac <__sinit+0x40>
8000dca4:	00100793          	li	a5,1
8000dca8:	00f52c23          	sw	a5,24(a0)
8000dcac:	00050413          	mv	s0,a0
8000dcb0:	06c000ef          	jal	ra,8000dd1c <__sfp>
8000dcb4:	00a42223          	sw	a0,4(s0)
8000dcb8:	00040513          	mv	a0,s0
8000dcbc:	060000ef          	jal	ra,8000dd1c <__sfp>
8000dcc0:	00a42423          	sw	a0,8(s0)
8000dcc4:	00040513          	mv	a0,s0
8000dcc8:	054000ef          	jal	ra,8000dd1c <__sfp>
8000dccc:	00a42623          	sw	a0,12(s0)
8000dcd0:	00442503          	lw	a0,4(s0)
8000dcd4:	00000613          	li	a2,0
8000dcd8:	00400593          	li	a1,4
8000dcdc:	e71ff0ef          	jal	ra,8000db4c <std>
8000dce0:	00842503          	lw	a0,8(s0)
8000dce4:	00100613          	li	a2,1
8000dce8:	00900593          	li	a1,9
8000dcec:	e61ff0ef          	jal	ra,8000db4c <std>
8000dcf0:	00c42503          	lw	a0,12(s0)
8000dcf4:	00200613          	li	a2,2
8000dcf8:	01200593          	li	a1,18
8000dcfc:	e51ff0ef          	jal	ra,8000db4c <std>
8000dd00:	00100793          	li	a5,1
8000dd04:	00f42c23          	sw	a5,24(s0)
8000dd08:	00c12083          	lw	ra,12(sp)
8000dd0c:	00812403          	lw	s0,8(sp)
8000dd10:	01010113          	addi	sp,sp,16
8000dd14:	00008067          	ret
8000dd18:	00008067          	ret

Disassembly of section .text.__sfp:

8000dd1c <__sfp>:
8000dd1c:	ff010113          	addi	sp,sp,-16
8000dd20:	c4818793          	addi	a5,gp,-952 # 80003480 <_bss_end>
8000dd24:	00912223          	sw	s1,4(sp)
8000dd28:	0007a483          	lw	s1,0(a5)
8000dd2c:	01212023          	sw	s2,0(sp)
8000dd30:	00112623          	sw	ra,12(sp)
8000dd34:	0184a783          	lw	a5,24(s1)
8000dd38:	00812423          	sw	s0,8(sp)
8000dd3c:	00050913          	mv	s2,a0
8000dd40:	00079663          	bnez	a5,8000dd4c <__sfp+0x30>
8000dd44:	00048513          	mv	a0,s1
8000dd48:	f25ff0ef          	jal	ra,8000dc6c <__sinit>
8000dd4c:	04848493          	addi	s1,s1,72
8000dd50:	0084a403          	lw	s0,8(s1)
8000dd54:	0044a783          	lw	a5,4(s1)
8000dd58:	fff78793          	addi	a5,a5,-1
8000dd5c:	0007da63          	bgez	a5,8000dd70 <__sfp+0x54>
8000dd60:	0004a783          	lw	a5,0(s1)
8000dd64:	08078063          	beqz	a5,8000dde4 <__sfp+0xc8>
8000dd68:	0004a483          	lw	s1,0(s1)
8000dd6c:	fe5ff06f          	j	8000dd50 <__sfp+0x34>
8000dd70:	00c41703          	lh	a4,12(s0)
8000dd74:	06071463          	bnez	a4,8000dddc <__sfp+0xc0>
8000dd78:	ffff07b7          	lui	a5,0xffff0
8000dd7c:	00178793          	addi	a5,a5,1 # ffff0001 <_heap_end+0x7ffde001>
8000dd80:	06042223          	sw	zero,100(s0)
8000dd84:	00042023          	sw	zero,0(s0)
8000dd88:	00042223          	sw	zero,4(s0)
8000dd8c:	00042423          	sw	zero,8(s0)
8000dd90:	00f42623          	sw	a5,12(s0)
8000dd94:	00042823          	sw	zero,16(s0)
8000dd98:	00042a23          	sw	zero,20(s0)
8000dd9c:	00042c23          	sw	zero,24(s0)
8000dda0:	00800613          	li	a2,8
8000dda4:	00000593          	li	a1,0
8000dda8:	05c40513          	addi	a0,s0,92
8000ddac:	e01fe0ef          	jal	ra,8000cbac <memset>
8000ddb0:	02042a23          	sw	zero,52(s0)
8000ddb4:	02042c23          	sw	zero,56(s0)
8000ddb8:	04042423          	sw	zero,72(s0)
8000ddbc:	04042623          	sw	zero,76(s0)
8000ddc0:	00040513          	mv	a0,s0
8000ddc4:	00c12083          	lw	ra,12(sp)
8000ddc8:	00812403          	lw	s0,8(sp)
8000ddcc:	00412483          	lw	s1,4(sp)
8000ddd0:	00012903          	lw	s2,0(sp)
8000ddd4:	01010113          	addi	sp,sp,16
8000ddd8:	00008067          	ret
8000dddc:	06840413          	addi	s0,s0,104
8000dde0:	f79ff06f          	j	8000dd58 <__sfp+0x3c>
8000dde4:	00400593          	li	a1,4
8000dde8:	00090513          	mv	a0,s2
8000ddec:	dfdff0ef          	jal	ra,8000dbe8 <__sfmoreglue>
8000ddf0:	00a4a023          	sw	a0,0(s1)
8000ddf4:	00050413          	mv	s0,a0
8000ddf8:	f60518e3          	bnez	a0,8000dd68 <__sfp+0x4c>
8000ddfc:	00c00793          	li	a5,12
8000de00:	00f92023          	sw	a5,0(s2)
8000de04:	fbdff06f          	j	8000ddc0 <__sfp+0xa4>

Disassembly of section .text.__sfp_lock_acquire:

8000de08 <__sfp_lock_acquire>:
8000de08:	00008067          	ret

Disassembly of section .text.__sfp_lock_release:

8000de0c <__sfp_lock_release>:
8000de0c:	00008067          	ret

Disassembly of section .text.__sinit_lock_acquire:

8000de10 <__sinit_lock_acquire>:
8000de10:	00008067          	ret

Disassembly of section .text.__sinit_lock_release:

8000de14 <__sinit_lock_release>:
8000de14:	00008067          	ret

Disassembly of section .text.__fp_lock_all:

8000de18 <__fp_lock_all>:
8000de18:	80c18793          	addi	a5,gp,-2036 # 80003044 <_impure_ptr>
8000de1c:	0007a503          	lw	a0,0(a5)
8000de20:	00000597          	auipc	a1,0x0
8000de24:	d2458593          	addi	a1,a1,-732 # 8000db44 <__fp_lock>
8000de28:	0180006f          	j	8000de40 <_fwalk>

Disassembly of section .text.__fp_unlock_all:

8000de2c <__fp_unlock_all>:
8000de2c:	80c18793          	addi	a5,gp,-2036 # 80003044 <_impure_ptr>
8000de30:	0007a503          	lw	a0,0(a5)
8000de34:	00000597          	auipc	a1,0x0
8000de38:	dac58593          	addi	a1,a1,-596 # 8000dbe0 <__fp_unlock>
8000de3c:	0040006f          	j	8000de40 <_fwalk>

Disassembly of section .text._fwalk:

8000de40 <_fwalk>:
8000de40:	fd010113          	addi	sp,sp,-48
8000de44:	02812423          	sw	s0,40(sp)
8000de48:	03212023          	sw	s2,32(sp)
8000de4c:	01412c23          	sw	s4,24(sp)
8000de50:	01512a23          	sw	s5,20(sp)
8000de54:	02112623          	sw	ra,44(sp)
8000de58:	02912223          	sw	s1,36(sp)
8000de5c:	01312e23          	sw	s3,28(sp)
8000de60:	04850413          	addi	s0,a0,72
8000de64:	00000913          	li	s2,0
8000de68:	00100a13          	li	s4,1
8000de6c:	fff00a93          	li	s5,-1
8000de70:	02041663          	bnez	s0,8000de9c <_fwalk+0x5c>
8000de74:	02c12083          	lw	ra,44(sp)
8000de78:	02812403          	lw	s0,40(sp)
8000de7c:	00090513          	mv	a0,s2
8000de80:	02412483          	lw	s1,36(sp)
8000de84:	02012903          	lw	s2,32(sp)
8000de88:	01c12983          	lw	s3,28(sp)
8000de8c:	01812a03          	lw	s4,24(sp)
8000de90:	01412a83          	lw	s5,20(sp)
8000de94:	03010113          	addi	sp,sp,48
8000de98:	00008067          	ret
8000de9c:	00842483          	lw	s1,8(s0)
8000dea0:	00442983          	lw	s3,4(s0)
8000dea4:	fff98993          	addi	s3,s3,-1
8000dea8:	0009d663          	bgez	s3,8000deb4 <_fwalk+0x74>
8000deac:	00042403          	lw	s0,0(s0)
8000deb0:	fc1ff06f          	j	8000de70 <_fwalk+0x30>
8000deb4:	00c4d783          	lhu	a5,12(s1)
8000deb8:	02fa7063          	bgeu	s4,a5,8000ded8 <_fwalk+0x98>
8000debc:	00e49783          	lh	a5,14(s1)
8000dec0:	01578c63          	beq	a5,s5,8000ded8 <_fwalk+0x98>
8000dec4:	00048513          	mv	a0,s1
8000dec8:	00b12623          	sw	a1,12(sp)
8000decc:	000580e7          	jalr	a1
8000ded0:	00c12583          	lw	a1,12(sp)
8000ded4:	00a96933          	or	s2,s2,a0
8000ded8:	06848493          	addi	s1,s1,104
8000dedc:	fc9ff06f          	j	8000dea4 <_fwalk+0x64>

Disassembly of section .text._fwalk_reent:

8000dee0 <_fwalk_reent>:
8000dee0:	fd010113          	addi	sp,sp,-48
8000dee4:	02812423          	sw	s0,40(sp)
8000dee8:	03212023          	sw	s2,32(sp)
8000deec:	01412c23          	sw	s4,24(sp)
8000def0:	01512a23          	sw	s5,20(sp)
8000def4:	01612823          	sw	s6,16(sp)
8000def8:	01712623          	sw	s7,12(sp)
8000defc:	02112623          	sw	ra,44(sp)
8000df00:	02912223          	sw	s1,36(sp)
8000df04:	01312e23          	sw	s3,28(sp)
8000df08:	00050a13          	mv	s4,a0
8000df0c:	00058a93          	mv	s5,a1
8000df10:	04850413          	addi	s0,a0,72
8000df14:	00000913          	li	s2,0
8000df18:	00100b13          	li	s6,1
8000df1c:	fff00b93          	li	s7,-1
8000df20:	02041a63          	bnez	s0,8000df54 <_fwalk_reent+0x74>
8000df24:	02c12083          	lw	ra,44(sp)
8000df28:	02812403          	lw	s0,40(sp)
8000df2c:	00090513          	mv	a0,s2
8000df30:	02412483          	lw	s1,36(sp)
8000df34:	02012903          	lw	s2,32(sp)
8000df38:	01c12983          	lw	s3,28(sp)
8000df3c:	01812a03          	lw	s4,24(sp)
8000df40:	01412a83          	lw	s5,20(sp)
8000df44:	01012b03          	lw	s6,16(sp)
8000df48:	00c12b83          	lw	s7,12(sp)
8000df4c:	03010113          	addi	sp,sp,48
8000df50:	00008067          	ret
8000df54:	00842483          	lw	s1,8(s0)
8000df58:	00442983          	lw	s3,4(s0)
8000df5c:	fff98993          	addi	s3,s3,-1
8000df60:	0009d663          	bgez	s3,8000df6c <_fwalk_reent+0x8c>
8000df64:	00042403          	lw	s0,0(s0)
8000df68:	fb9ff06f          	j	8000df20 <_fwalk_reent+0x40>
8000df6c:	00c4d783          	lhu	a5,12(s1)
8000df70:	00fb7e63          	bgeu	s6,a5,8000df8c <_fwalk_reent+0xac>
8000df74:	00e49783          	lh	a5,14(s1)
8000df78:	01778a63          	beq	a5,s7,8000df8c <_fwalk_reent+0xac>
8000df7c:	00048593          	mv	a1,s1
8000df80:	000a0513          	mv	a0,s4
8000df84:	000a80e7          	jalr	s5
8000df88:	00a96933          	or	s2,s2,a0
8000df8c:	06848493          	addi	s1,s1,104
8000df90:	fcdff06f          	j	8000df5c <_fwalk_reent+0x7c>

Disassembly of section .text.malloc:

8000df94 <malloc>:
8000df94:	80c18793          	addi	a5,gp,-2036 # 80003044 <_impure_ptr>
8000df98:	00050593          	mv	a1,a0
8000df9c:	0007a503          	lw	a0,0(a5)
8000dfa0:	2d00006f          	j	8000e270 <_malloc_r>

Disassembly of section .text.free:

8000dfa4 <free>:
8000dfa4:	80c18793          	addi	a5,gp,-2036 # 80003044 <_impure_ptr>
8000dfa8:	00050593          	mv	a1,a0
8000dfac:	0007a503          	lw	a0,0(a5)
8000dfb0:	1bc0006f          	j	8000e16c <_free_r>

Disassembly of section .text.memcmp:

8000dfb4 <memcmp>:
8000dfb4:	00000713          	li	a4,0
8000dfb8:	00e61663          	bne	a2,a4,8000dfc4 <memcmp+0x10>
8000dfbc:	00000513          	li	a0,0
8000dfc0:	00008067          	ret
8000dfc4:	00e507b3          	add	a5,a0,a4
8000dfc8:	00170713          	addi	a4,a4,1
8000dfcc:	00e586b3          	add	a3,a1,a4
8000dfd0:	0007c783          	lbu	a5,0(a5)
8000dfd4:	fff6c683          	lbu	a3,-1(a3)
8000dfd8:	fed780e3          	beq	a5,a3,8000dfb8 <memcmp+0x4>
8000dfdc:	40d78533          	sub	a0,a5,a3
8000dfe0:	00008067          	ret

Disassembly of section .text.memcpy:

8000dfe4 <memcpy>:
8000dfe4:	00a5c7b3          	xor	a5,a1,a0
8000dfe8:	0037f793          	andi	a5,a5,3
8000dfec:	00c50733          	add	a4,a0,a2
8000dff0:	00079663          	bnez	a5,8000dffc <memcpy+0x18>
8000dff4:	00300793          	li	a5,3
8000dff8:	02c7e263          	bltu	a5,a2,8000e01c <memcpy+0x38>
8000dffc:	00050793          	mv	a5,a0
8000e000:	0ae57c63          	bgeu	a0,a4,8000e0b8 <memcpy+0xd4>
8000e004:	0005c683          	lbu	a3,0(a1)
8000e008:	00178793          	addi	a5,a5,1
8000e00c:	00158593          	addi	a1,a1,1
8000e010:	fed78fa3          	sb	a3,-1(a5)
8000e014:	fee7e8e3          	bltu	a5,a4,8000e004 <memcpy+0x20>
8000e018:	00008067          	ret
8000e01c:	00357693          	andi	a3,a0,3
8000e020:	00050793          	mv	a5,a0
8000e024:	00068e63          	beqz	a3,8000e040 <memcpy+0x5c>
8000e028:	0005c683          	lbu	a3,0(a1)
8000e02c:	00178793          	addi	a5,a5,1
8000e030:	00158593          	addi	a1,a1,1
8000e034:	fed78fa3          	sb	a3,-1(a5)
8000e038:	0037f693          	andi	a3,a5,3
8000e03c:	fe9ff06f          	j	8000e024 <memcpy+0x40>
8000e040:	ffc77693          	andi	a3,a4,-4
8000e044:	fe068613          	addi	a2,a3,-32
8000e048:	06c7f463          	bgeu	a5,a2,8000e0b0 <memcpy+0xcc>
8000e04c:	0005a383          	lw	t2,0(a1)
8000e050:	0045a283          	lw	t0,4(a1)
8000e054:	0085af83          	lw	t6,8(a1)
8000e058:	00c5af03          	lw	t5,12(a1)
8000e05c:	0105ae83          	lw	t4,16(a1)
8000e060:	0145ae03          	lw	t3,20(a1)
8000e064:	0185a303          	lw	t1,24(a1)
8000e068:	01c5a883          	lw	a7,28(a1)
8000e06c:	02458593          	addi	a1,a1,36
8000e070:	0077a023          	sw	t2,0(a5)
8000e074:	ffc5a803          	lw	a6,-4(a1)
8000e078:	0057a223          	sw	t0,4(a5)
8000e07c:	01f7a423          	sw	t6,8(a5)
8000e080:	01e7a623          	sw	t5,12(a5)
8000e084:	01d7a823          	sw	t4,16(a5)
8000e088:	01c7aa23          	sw	t3,20(a5)
8000e08c:	0067ac23          	sw	t1,24(a5)
8000e090:	0117ae23          	sw	a7,28(a5)
8000e094:	02478793          	addi	a5,a5,36
8000e098:	ff07ae23          	sw	a6,-4(a5)
8000e09c:	fadff06f          	j	8000e048 <memcpy+0x64>
8000e0a0:	0005a603          	lw	a2,0(a1)
8000e0a4:	00478793          	addi	a5,a5,4
8000e0a8:	00458593          	addi	a1,a1,4
8000e0ac:	fec7ae23          	sw	a2,-4(a5)
8000e0b0:	fed7e8e3          	bltu	a5,a3,8000e0a0 <memcpy+0xbc>
8000e0b4:	f4e7e8e3          	bltu	a5,a4,8000e004 <memcpy+0x20>
8000e0b8:	00008067          	ret

Disassembly of section .text.memmove:

8000e0bc <memmove>:
8000e0bc:	04a5fa63          	bgeu	a1,a0,8000e110 <memmove+0x54>
8000e0c0:	00c586b3          	add	a3,a1,a2
8000e0c4:	04d57663          	bgeu	a0,a3,8000e110 <memmove+0x54>
8000e0c8:	fff64593          	not	a1,a2
8000e0cc:	00000793          	li	a5,0
8000e0d0:	fff78793          	addi	a5,a5,-1
8000e0d4:	00f59463          	bne	a1,a5,8000e0dc <memmove+0x20>
8000e0d8:	00008067          	ret
8000e0dc:	00f68733          	add	a4,a3,a5
8000e0e0:	00074803          	lbu	a6,0(a4)
8000e0e4:	00c78733          	add	a4,a5,a2
8000e0e8:	00e50733          	add	a4,a0,a4
8000e0ec:	01070023          	sb	a6,0(a4)
8000e0f0:	fe1ff06f          	j	8000e0d0 <memmove+0x14>
8000e0f4:	00f58733          	add	a4,a1,a5
8000e0f8:	00074683          	lbu	a3,0(a4)
8000e0fc:	00f50733          	add	a4,a0,a5
8000e100:	00178793          	addi	a5,a5,1
8000e104:	00d70023          	sb	a3,0(a4)
8000e108:	fef616e3          	bne	a2,a5,8000e0f4 <memmove+0x38>
8000e10c:	00008067          	ret
8000e110:	00000793          	li	a5,0
8000e114:	ff5ff06f          	j	8000e108 <memmove+0x4c>

Disassembly of section .text._calloc_r:

8000e118 <_calloc_r>:
8000e118:	fe010113          	addi	sp,sp,-32
8000e11c:	00812c23          	sw	s0,24(sp)
8000e120:	00050413          	mv	s0,a0
8000e124:	00058513          	mv	a0,a1
8000e128:	00060593          	mv	a1,a2
8000e12c:	00112e23          	sw	ra,28(sp)
8000e130:	960ff0ef          	jal	ra,8000d290 <__mulsi3>
8000e134:	00050593          	mv	a1,a0
8000e138:	00a12623          	sw	a0,12(sp)
8000e13c:	00040513          	mv	a0,s0
8000e140:	130000ef          	jal	ra,8000e270 <_malloc_r>
8000e144:	00050413          	mv	s0,a0
8000e148:	00050863          	beqz	a0,8000e158 <_calloc_r+0x40>
8000e14c:	00c12603          	lw	a2,12(sp)
8000e150:	00000593          	li	a1,0
8000e154:	a59fe0ef          	jal	ra,8000cbac <memset>
8000e158:	00040513          	mv	a0,s0
8000e15c:	01c12083          	lw	ra,28(sp)
8000e160:	01812403          	lw	s0,24(sp)
8000e164:	02010113          	addi	sp,sp,32
8000e168:	00008067          	ret

Disassembly of section .text._free_r:

8000e16c <_free_r>:
8000e16c:	10058063          	beqz	a1,8000e26c <_free_r+0x100>
8000e170:	ffc5a783          	lw	a5,-4(a1)
8000e174:	ff010113          	addi	sp,sp,-16
8000e178:	00812423          	sw	s0,8(sp)
8000e17c:	00112623          	sw	ra,12(sp)
8000e180:	00912223          	sw	s1,4(sp)
8000e184:	ffc58413          	addi	s0,a1,-4
8000e188:	0007d463          	bgez	a5,8000e190 <_free_r+0x24>
8000e18c:	00f40433          	add	s0,s0,a5
8000e190:	00050493          	mv	s1,a0
8000e194:	975f70ef          	jal	ra,80005b08 <__malloc_lock>
8000e198:	8f418793          	addi	a5,gp,-1804 # 8000312c <__malloc_free_list>
8000e19c:	0007a783          	lw	a5,0(a5)
8000e1a0:	02079263          	bnez	a5,8000e1c4 <_free_r+0x58>
8000e1a4:	00042223          	sw	zero,4(s0)
8000e1a8:	8e81aa23          	sw	s0,-1804(gp) # 8000312c <__malloc_free_list>
8000e1ac:	00812403          	lw	s0,8(sp)
8000e1b0:	00c12083          	lw	ra,12(sp)
8000e1b4:	00048513          	mv	a0,s1
8000e1b8:	00412483          	lw	s1,4(sp)
8000e1bc:	01010113          	addi	sp,sp,16
8000e1c0:	94df706f          	j	80005b0c <__malloc_unlock>
8000e1c4:	02f47663          	bgeu	s0,a5,8000e1f0 <_free_r+0x84>
8000e1c8:	00042683          	lw	a3,0(s0)
8000e1cc:	00d40733          	add	a4,s0,a3
8000e1d0:	00e79a63          	bne	a5,a4,8000e1e4 <_free_r+0x78>
8000e1d4:	0007a703          	lw	a4,0(a5)
8000e1d8:	0047a783          	lw	a5,4(a5)
8000e1dc:	00d70733          	add	a4,a4,a3
8000e1e0:	00e42023          	sw	a4,0(s0)
8000e1e4:	00f42223          	sw	a5,4(s0)
8000e1e8:	fc1ff06f          	j	8000e1a8 <_free_r+0x3c>
8000e1ec:	00070793          	mv	a5,a4
8000e1f0:	0047a703          	lw	a4,4(a5)
8000e1f4:	00070463          	beqz	a4,8000e1fc <_free_r+0x90>
8000e1f8:	fee47ae3          	bgeu	s0,a4,8000e1ec <_free_r+0x80>
8000e1fc:	0007a683          	lw	a3,0(a5)
8000e200:	00d78633          	add	a2,a5,a3
8000e204:	02861863          	bne	a2,s0,8000e234 <_free_r+0xc8>
8000e208:	00042603          	lw	a2,0(s0)
8000e20c:	00c686b3          	add	a3,a3,a2
8000e210:	00d7a023          	sw	a3,0(a5)
8000e214:	00d78633          	add	a2,a5,a3
8000e218:	f8c71ae3          	bne	a4,a2,8000e1ac <_free_r+0x40>
8000e21c:	00072603          	lw	a2,0(a4)
8000e220:	00472703          	lw	a4,4(a4)
8000e224:	00d606b3          	add	a3,a2,a3
8000e228:	00d7a023          	sw	a3,0(a5)
8000e22c:	00e7a223          	sw	a4,4(a5)
8000e230:	f7dff06f          	j	8000e1ac <_free_r+0x40>
8000e234:	00c47863          	bgeu	s0,a2,8000e244 <_free_r+0xd8>
8000e238:	00c00793          	li	a5,12
8000e23c:	00f4a023          	sw	a5,0(s1)
8000e240:	f6dff06f          	j	8000e1ac <_free_r+0x40>
8000e244:	00042603          	lw	a2,0(s0)
8000e248:	00c406b3          	add	a3,s0,a2
8000e24c:	00d71a63          	bne	a4,a3,8000e260 <_free_r+0xf4>
8000e250:	00072683          	lw	a3,0(a4)
8000e254:	00472703          	lw	a4,4(a4)
8000e258:	00c686b3          	add	a3,a3,a2
8000e25c:	00d42023          	sw	a3,0(s0)
8000e260:	00e42223          	sw	a4,4(s0)
8000e264:	0087a223          	sw	s0,4(a5)
8000e268:	f45ff06f          	j	8000e1ac <_free_r+0x40>
8000e26c:	00008067          	ret

Disassembly of section .text._malloc_r:

8000e270 <_malloc_r>:
8000e270:	fe010113          	addi	sp,sp,-32
8000e274:	00912a23          	sw	s1,20(sp)
8000e278:	00358493          	addi	s1,a1,3
8000e27c:	ffc4f493          	andi	s1,s1,-4
8000e280:	00112e23          	sw	ra,28(sp)
8000e284:	00812c23          	sw	s0,24(sp)
8000e288:	01212823          	sw	s2,16(sp)
8000e28c:	01312623          	sw	s3,12(sp)
8000e290:	00848493          	addi	s1,s1,8
8000e294:	00c00793          	li	a5,12
8000e298:	06f4f463          	bgeu	s1,a5,8000e300 <_malloc_r+0x90>
8000e29c:	00c00493          	li	s1,12
8000e2a0:	06b4e263          	bltu	s1,a1,8000e304 <_malloc_r+0x94>
8000e2a4:	00050913          	mv	s2,a0
8000e2a8:	861f70ef          	jal	ra,80005b08 <__malloc_lock>
8000e2ac:	8f418793          	addi	a5,gp,-1804 # 8000312c <__malloc_free_list>
8000e2b0:	0007a703          	lw	a4,0(a5)
8000e2b4:	00070413          	mv	s0,a4
8000e2b8:	06041a63          	bnez	s0,8000e32c <_malloc_r+0xbc>
8000e2bc:	8f818793          	addi	a5,gp,-1800 # 80003130 <__malloc_sbrk_start>
8000e2c0:	0007a783          	lw	a5,0(a5)
8000e2c4:	00079a63          	bnez	a5,8000e2d8 <_malloc_r+0x68>
8000e2c8:	00000593          	li	a1,0
8000e2cc:	00090513          	mv	a0,s2
8000e2d0:	1cc000ef          	jal	ra,8000e49c <_sbrk_r>
8000e2d4:	8ea1ac23          	sw	a0,-1800(gp) # 80003130 <__malloc_sbrk_start>
8000e2d8:	00048593          	mv	a1,s1
8000e2dc:	00090513          	mv	a0,s2
8000e2e0:	1bc000ef          	jal	ra,8000e49c <_sbrk_r>
8000e2e4:	fff00993          	li	s3,-1
8000e2e8:	0b351a63          	bne	a0,s3,8000e39c <_malloc_r+0x12c>
8000e2ec:	00c00793          	li	a5,12
8000e2f0:	00f92023          	sw	a5,0(s2)
8000e2f4:	00090513          	mv	a0,s2
8000e2f8:	815f70ef          	jal	ra,80005b0c <__malloc_unlock>
8000e2fc:	0100006f          	j	8000e30c <_malloc_r+0x9c>
8000e300:	fa04d0e3          	bgez	s1,8000e2a0 <_malloc_r+0x30>
8000e304:	00c00793          	li	a5,12
8000e308:	00f52023          	sw	a5,0(a0)
8000e30c:	00000513          	li	a0,0
8000e310:	01c12083          	lw	ra,28(sp)
8000e314:	01812403          	lw	s0,24(sp)
8000e318:	01412483          	lw	s1,20(sp)
8000e31c:	01012903          	lw	s2,16(sp)
8000e320:	00c12983          	lw	s3,12(sp)
8000e324:	02010113          	addi	sp,sp,32
8000e328:	00008067          	ret
8000e32c:	00042783          	lw	a5,0(s0)
8000e330:	409787b3          	sub	a5,a5,s1
8000e334:	0407ce63          	bltz	a5,8000e390 <_malloc_r+0x120>
8000e338:	00b00693          	li	a3,11
8000e33c:	00f6fa63          	bgeu	a3,a5,8000e350 <_malloc_r+0xe0>
8000e340:	00f42023          	sw	a5,0(s0)
8000e344:	00f40433          	add	s0,s0,a5
8000e348:	00942023          	sw	s1,0(s0)
8000e34c:	0100006f          	j	8000e35c <_malloc_r+0xec>
8000e350:	00442783          	lw	a5,4(s0)
8000e354:	02871a63          	bne	a4,s0,8000e388 <_malloc_r+0x118>
8000e358:	8ef1aa23          	sw	a5,-1804(gp) # 8000312c <__malloc_free_list>
8000e35c:	00090513          	mv	a0,s2
8000e360:	facf70ef          	jal	ra,80005b0c <__malloc_unlock>
8000e364:	00b40513          	addi	a0,s0,11
8000e368:	00440793          	addi	a5,s0,4
8000e36c:	ff857513          	andi	a0,a0,-8
8000e370:	40f50733          	sub	a4,a0,a5
8000e374:	f8070ee3          	beqz	a4,8000e310 <_malloc_r+0xa0>
8000e378:	00e40433          	add	s0,s0,a4
8000e37c:	40a787b3          	sub	a5,a5,a0
8000e380:	00f42023          	sw	a5,0(s0)
8000e384:	f8dff06f          	j	8000e310 <_malloc_r+0xa0>
8000e388:	00f72223          	sw	a5,4(a4)
8000e38c:	fd1ff06f          	j	8000e35c <_malloc_r+0xec>
8000e390:	00040713          	mv	a4,s0
8000e394:	00442403          	lw	s0,4(s0)
8000e398:	f21ff06f          	j	8000e2b8 <_malloc_r+0x48>
8000e39c:	00350413          	addi	s0,a0,3
8000e3a0:	ffc47413          	andi	s0,s0,-4
8000e3a4:	fa8502e3          	beq	a0,s0,8000e348 <_malloc_r+0xd8>
8000e3a8:	40a405b3          	sub	a1,s0,a0
8000e3ac:	00090513          	mv	a0,s2
8000e3b0:	0ec000ef          	jal	ra,8000e49c <_sbrk_r>
8000e3b4:	f9351ae3          	bne	a0,s3,8000e348 <_malloc_r+0xd8>
8000e3b8:	f35ff06f          	j	8000e2ec <_malloc_r+0x7c>

Disassembly of section .text._printf_r:

8000e3bc <_iprintf_r>:
8000e3bc:	fb010113          	addi	sp,sp,-80
8000e3c0:	02812423          	sw	s0,40(sp)
8000e3c4:	02112623          	sw	ra,44(sp)
8000e3c8:	02c12c23          	sw	a2,56(sp)
8000e3cc:	02d12e23          	sw	a3,60(sp)
8000e3d0:	04e12023          	sw	a4,64(sp)
8000e3d4:	04f12223          	sw	a5,68(sp)
8000e3d8:	05012423          	sw	a6,72(sp)
8000e3dc:	05112623          	sw	a7,76(sp)
8000e3e0:	00050413          	mv	s0,a0
8000e3e4:	00050c63          	beqz	a0,8000e3fc <_iprintf_r+0x40>
8000e3e8:	01852783          	lw	a5,24(a0)
8000e3ec:	00079863          	bnez	a5,8000e3fc <_iprintf_r+0x40>
8000e3f0:	00b12623          	sw	a1,12(sp)
8000e3f4:	879ff0ef          	jal	ra,8000dc6c <__sinit>
8000e3f8:	00c12583          	lw	a1,12(sp)
8000e3fc:	00058613          	mv	a2,a1
8000e400:	00842583          	lw	a1,8(s0)
8000e404:	03810693          	addi	a3,sp,56
8000e408:	00040513          	mv	a0,s0
8000e40c:	00d12e23          	sw	a3,28(sp)
8000e410:	50c010ef          	jal	ra,8000f91c <_vfiprintf_r>
8000e414:	02c12083          	lw	ra,44(sp)
8000e418:	02812403          	lw	s0,40(sp)
8000e41c:	05010113          	addi	sp,sp,80
8000e420:	00008067          	ret

Disassembly of section .text.printf:

8000e424 <iprintf>:
8000e424:	fc010113          	addi	sp,sp,-64
8000e428:	02f12a23          	sw	a5,52(sp)
8000e42c:	02b12223          	sw	a1,36(sp)
8000e430:	02c12423          	sw	a2,40(sp)
8000e434:	02d12623          	sw	a3,44(sp)
8000e438:	02e12823          	sw	a4,48(sp)
8000e43c:	03012c23          	sw	a6,56(sp)
8000e440:	03112e23          	sw	a7,60(sp)
8000e444:	80c18793          	addi	a5,gp,-2036 # 80003044 <_impure_ptr>
8000e448:	00812c23          	sw	s0,24(sp)
8000e44c:	0007a403          	lw	s0,0(a5)
8000e450:	00912a23          	sw	s1,20(sp)
8000e454:	00112e23          	sw	ra,28(sp)
8000e458:	00050493          	mv	s1,a0
8000e45c:	00040a63          	beqz	s0,8000e470 <iprintf+0x4c>
8000e460:	01842783          	lw	a5,24(s0)
8000e464:	00079663          	bnez	a5,8000e470 <iprintf+0x4c>
8000e468:	00040513          	mv	a0,s0
8000e46c:	801ff0ef          	jal	ra,8000dc6c <__sinit>
8000e470:	00842583          	lw	a1,8(s0)
8000e474:	02410693          	addi	a3,sp,36
8000e478:	00048613          	mv	a2,s1
8000e47c:	00040513          	mv	a0,s0
8000e480:	00d12623          	sw	a3,12(sp)
8000e484:	498010ef          	jal	ra,8000f91c <_vfiprintf_r>
8000e488:	01c12083          	lw	ra,28(sp)
8000e48c:	01812403          	lw	s0,24(sp)
8000e490:	01412483          	lw	s1,20(sp)
8000e494:	04010113          	addi	sp,sp,64
8000e498:	00008067          	ret

Disassembly of section .text._sbrk_r:

8000e49c <_sbrk_r>:
8000e49c:	ff010113          	addi	sp,sp,-16
8000e4a0:	00812423          	sw	s0,8(sp)
8000e4a4:	00050413          	mv	s0,a0
8000e4a8:	00058513          	mv	a0,a1
8000e4ac:	c401a223          	sw	zero,-956(gp) # 8000347c <errno>
8000e4b0:	00112623          	sw	ra,12(sp)
8000e4b4:	ee0f70ef          	jal	ra,80005b94 <_sbrk>
8000e4b8:	fff00793          	li	a5,-1
8000e4bc:	00f51a63          	bne	a0,a5,8000e4d0 <_sbrk_r+0x34>
8000e4c0:	c4418793          	addi	a5,gp,-956 # 8000347c <errno>
8000e4c4:	0007a783          	lw	a5,0(a5)
8000e4c8:	00078463          	beqz	a5,8000e4d0 <_sbrk_r+0x34>
8000e4cc:	00f42023          	sw	a5,0(s0)
8000e4d0:	00c12083          	lw	ra,12(sp)
8000e4d4:	00812403          	lw	s0,8(sp)
8000e4d8:	01010113          	addi	sp,sp,16
8000e4dc:	00008067          	ret

Disassembly of section .text._snprintf_r:

8000e4e0 <_sniprintf_r>:
8000e4e0:	f7010113          	addi	sp,sp,-144
8000e4e4:	06112e23          	sw	ra,124(sp)
8000e4e8:	06812c23          	sw	s0,120(sp)
8000e4ec:	06912a23          	sw	s1,116(sp)
8000e4f0:	07212823          	sw	s2,112(sp)
8000e4f4:	08e12023          	sw	a4,128(sp)
8000e4f8:	08f12223          	sw	a5,132(sp)
8000e4fc:	09012423          	sw	a6,136(sp)
8000e500:	09112623          	sw	a7,140(sp)
8000e504:	02065463          	bgez	a2,8000e52c <_sniprintf_r+0x4c>
8000e508:	08b00793          	li	a5,139
8000e50c:	00f52023          	sw	a5,0(a0)
8000e510:	fff00513          	li	a0,-1
8000e514:	07c12083          	lw	ra,124(sp)
8000e518:	07812403          	lw	s0,120(sp)
8000e51c:	07412483          	lw	s1,116(sp)
8000e520:	07012903          	lw	s2,112(sp)
8000e524:	09010113          	addi	sp,sp,144
8000e528:	00008067          	ret
8000e52c:	20800793          	li	a5,520
8000e530:	00f11a23          	sh	a5,20(sp)
8000e534:	00b12423          	sw	a1,8(sp)
8000e538:	00b12c23          	sw	a1,24(sp)
8000e53c:	00060413          	mv	s0,a2
8000e540:	00000793          	li	a5,0
8000e544:	00060463          	beqz	a2,8000e54c <_sniprintf_r+0x6c>
8000e548:	fff60793          	addi	a5,a2,-1
8000e54c:	fff00913          	li	s2,-1
8000e550:	00068613          	mv	a2,a3
8000e554:	00810593          	addi	a1,sp,8
8000e558:	08010693          	addi	a3,sp,128
8000e55c:	00050493          	mv	s1,a0
8000e560:	00f12823          	sw	a5,16(sp)
8000e564:	00f12e23          	sw	a5,28(sp)
8000e568:	01211b23          	sh	s2,22(sp)
8000e56c:	00d12223          	sw	a3,4(sp)
8000e570:	189000ef          	jal	ra,8000eef8 <_svfiprintf_r>
8000e574:	01255663          	bge	a0,s2,8000e580 <_sniprintf_r+0xa0>
8000e578:	08b00793          	li	a5,139
8000e57c:	00f4a023          	sw	a5,0(s1)
8000e580:	f8040ae3          	beqz	s0,8000e514 <_sniprintf_r+0x34>
8000e584:	00812783          	lw	a5,8(sp)
8000e588:	00078023          	sb	zero,0(a5)
8000e58c:	f89ff06f          	j	8000e514 <_sniprintf_r+0x34>

Disassembly of section .text.snprintf:

8000e590 <sniprintf>:
8000e590:	f6010113          	addi	sp,sp,-160
8000e594:	08f12a23          	sw	a5,148(sp)
8000e598:	06912a23          	sw	s1,116(sp)
8000e59c:	08d12623          	sw	a3,140(sp)
8000e5a0:	08e12823          	sw	a4,144(sp)
8000e5a4:	09012c23          	sw	a6,152(sp)
8000e5a8:	09112e23          	sw	a7,156(sp)
8000e5ac:	80c18793          	addi	a5,gp,-2036 # 80003044 <_impure_ptr>
8000e5b0:	06112e23          	sw	ra,124(sp)
8000e5b4:	06812c23          	sw	s0,120(sp)
8000e5b8:	07212823          	sw	s2,112(sp)
8000e5bc:	0007a483          	lw	s1,0(a5)
8000e5c0:	0205d463          	bgez	a1,8000e5e8 <sniprintf+0x58>
8000e5c4:	08b00793          	li	a5,139
8000e5c8:	00f4a023          	sw	a5,0(s1)
8000e5cc:	fff00513          	li	a0,-1
8000e5d0:	07c12083          	lw	ra,124(sp)
8000e5d4:	07812403          	lw	s0,120(sp)
8000e5d8:	07412483          	lw	s1,116(sp)
8000e5dc:	07012903          	lw	s2,112(sp)
8000e5e0:	0a010113          	addi	sp,sp,160
8000e5e4:	00008067          	ret
8000e5e8:	20800793          	li	a5,520
8000e5ec:	00f11a23          	sh	a5,20(sp)
8000e5f0:	00a12423          	sw	a0,8(sp)
8000e5f4:	00a12c23          	sw	a0,24(sp)
8000e5f8:	00000793          	li	a5,0
8000e5fc:	00058463          	beqz	a1,8000e604 <sniprintf+0x74>
8000e600:	fff58793          	addi	a5,a1,-1
8000e604:	fff00913          	li	s2,-1
8000e608:	00058413          	mv	s0,a1
8000e60c:	08c10693          	addi	a3,sp,140
8000e610:	00810593          	addi	a1,sp,8
8000e614:	00048513          	mv	a0,s1
8000e618:	00f12823          	sw	a5,16(sp)
8000e61c:	00f12e23          	sw	a5,28(sp)
8000e620:	01211b23          	sh	s2,22(sp)
8000e624:	00d12223          	sw	a3,4(sp)
8000e628:	0d1000ef          	jal	ra,8000eef8 <_svfiprintf_r>
8000e62c:	01255663          	bge	a0,s2,8000e638 <sniprintf+0xa8>
8000e630:	08b00793          	li	a5,139
8000e634:	00f4a023          	sw	a5,0(s1)
8000e638:	f8040ce3          	beqz	s0,8000e5d0 <sniprintf+0x40>
8000e63c:	00812783          	lw	a5,8(sp)
8000e640:	00078023          	sb	zero,0(a5)
8000e644:	f8dff06f          	j	8000e5d0 <sniprintf+0x40>

Disassembly of section .text._sprintf_r:

8000e648 <_siprintf_r>:
8000e648:	f6010113          	addi	sp,sp,-160
8000e64c:	08f12a23          	sw	a5,148(sp)
8000e650:	800007b7          	lui	a5,0x80000
8000e654:	fff7c793          	not	a5,a5
8000e658:	00f12e23          	sw	a5,28(sp)
8000e65c:	00f12823          	sw	a5,16(sp)
8000e660:	ffff07b7          	lui	a5,0xffff0
8000e664:	08d12623          	sw	a3,140(sp)
8000e668:	00b12423          	sw	a1,8(sp)
8000e66c:	00b12c23          	sw	a1,24(sp)
8000e670:	20878793          	addi	a5,a5,520 # ffff0208 <_heap_end+0x7ffde208>
8000e674:	08c10693          	addi	a3,sp,140
8000e678:	00810593          	addi	a1,sp,8
8000e67c:	06112e23          	sw	ra,124(sp)
8000e680:	00f12a23          	sw	a5,20(sp)
8000e684:	08e12823          	sw	a4,144(sp)
8000e688:	09012c23          	sw	a6,152(sp)
8000e68c:	09112e23          	sw	a7,156(sp)
8000e690:	00d12223          	sw	a3,4(sp)
8000e694:	065000ef          	jal	ra,8000eef8 <_svfiprintf_r>
8000e698:	00812783          	lw	a5,8(sp)
8000e69c:	00078023          	sb	zero,0(a5)
8000e6a0:	07c12083          	lw	ra,124(sp)
8000e6a4:	0a010113          	addi	sp,sp,160
8000e6a8:	00008067          	ret

Disassembly of section .text.sprintf:

8000e6ac <siprintf>:
8000e6ac:	f6010113          	addi	sp,sp,-160
8000e6b0:	08f12a23          	sw	a5,148(sp)
8000e6b4:	800007b7          	lui	a5,0x80000
8000e6b8:	fff7c793          	not	a5,a5
8000e6bc:	00f12e23          	sw	a5,28(sp)
8000e6c0:	00f12823          	sw	a5,16(sp)
8000e6c4:	ffff07b7          	lui	a5,0xffff0
8000e6c8:	20878793          	addi	a5,a5,520 # ffff0208 <_heap_end+0x7ffde208>
8000e6cc:	08c12423          	sw	a2,136(sp)
8000e6d0:	08d12623          	sw	a3,140(sp)
8000e6d4:	08e12823          	sw	a4,144(sp)
8000e6d8:	09012c23          	sw	a6,152(sp)
8000e6dc:	09112e23          	sw	a7,156(sp)
8000e6e0:	00f12a23          	sw	a5,20(sp)
8000e6e4:	80c18793          	addi	a5,gp,-2036 # 80003044 <_impure_ptr>
8000e6e8:	00a12423          	sw	a0,8(sp)
8000e6ec:	00a12c23          	sw	a0,24(sp)
8000e6f0:	0007a503          	lw	a0,0(a5)
8000e6f4:	08810693          	addi	a3,sp,136
8000e6f8:	00058613          	mv	a2,a1
8000e6fc:	00810593          	addi	a1,sp,8
8000e700:	06112e23          	sw	ra,124(sp)
8000e704:	00d12223          	sw	a3,4(sp)
8000e708:	7f0000ef          	jal	ra,8000eef8 <_svfiprintf_r>
8000e70c:	00812783          	lw	a5,8(sp)
8000e710:	00078023          	sb	zero,0(a5)
8000e714:	07c12083          	lw	ra,124(sp)
8000e718:	0a010113          	addi	sp,sp,160
8000e71c:	00008067          	ret

Disassembly of section .text.__sread:

8000e720 <__sread>:
8000e720:	ff010113          	addi	sp,sp,-16
8000e724:	00812423          	sw	s0,8(sp)
8000e728:	00058413          	mv	s0,a1
8000e72c:	00e59583          	lh	a1,14(a1)
8000e730:	00112623          	sw	ra,12(sp)
8000e734:	5d4010ef          	jal	ra,8000fd08 <_read_r>
8000e738:	02054063          	bltz	a0,8000e758 <__sread+0x38>
8000e73c:	05442783          	lw	a5,84(s0)
8000e740:	00a787b3          	add	a5,a5,a0
8000e744:	04f42a23          	sw	a5,84(s0)
8000e748:	00c12083          	lw	ra,12(sp)
8000e74c:	00812403          	lw	s0,8(sp)
8000e750:	01010113          	addi	sp,sp,16
8000e754:	00008067          	ret
8000e758:	00c45783          	lhu	a5,12(s0)
8000e75c:	fffff737          	lui	a4,0xfffff
8000e760:	fff70713          	addi	a4,a4,-1 # ffffefff <_heap_end+0x7ffecfff>
8000e764:	00e7f7b3          	and	a5,a5,a4
8000e768:	00f41623          	sh	a5,12(s0)
8000e76c:	fddff06f          	j	8000e748 <__sread+0x28>

Disassembly of section .text.__seofread:

8000e770 <__seofread>:
8000e770:	00000513          	li	a0,0
8000e774:	00008067          	ret

Disassembly of section .text.__swrite:

8000e778 <__swrite>:
8000e778:	00c5d783          	lhu	a5,12(a1)
8000e77c:	fe010113          	addi	sp,sp,-32
8000e780:	00812c23          	sw	s0,24(sp)
8000e784:	00912a23          	sw	s1,20(sp)
8000e788:	01212823          	sw	s2,16(sp)
8000e78c:	01312623          	sw	s3,12(sp)
8000e790:	00112e23          	sw	ra,28(sp)
8000e794:	1007f793          	andi	a5,a5,256
8000e798:	00050493          	mv	s1,a0
8000e79c:	00058413          	mv	s0,a1
8000e7a0:	00060913          	mv	s2,a2
8000e7a4:	00068993          	mv	s3,a3
8000e7a8:	00078a63          	beqz	a5,8000e7bc <__swrite+0x44>
8000e7ac:	00e59583          	lh	a1,14(a1)
8000e7b0:	00200693          	li	a3,2
8000e7b4:	00000613          	li	a2,0
8000e7b8:	3cc000ef          	jal	ra,8000eb84 <_lseek_r>
8000e7bc:	00c45783          	lhu	a5,12(s0)
8000e7c0:	fffff737          	lui	a4,0xfffff
8000e7c4:	fff70713          	addi	a4,a4,-1 # ffffefff <_heap_end+0x7ffecfff>
8000e7c8:	00e7f7b3          	and	a5,a5,a4
8000e7cc:	00f41623          	sh	a5,12(s0)
8000e7d0:	00e41583          	lh	a1,14(s0)
8000e7d4:	01812403          	lw	s0,24(sp)
8000e7d8:	01c12083          	lw	ra,28(sp)
8000e7dc:	00098693          	mv	a3,s3
8000e7e0:	00090613          	mv	a2,s2
8000e7e4:	00c12983          	lw	s3,12(sp)
8000e7e8:	01012903          	lw	s2,16(sp)
8000e7ec:	00048513          	mv	a0,s1
8000e7f0:	01412483          	lw	s1,20(sp)
8000e7f4:	02010113          	addi	sp,sp,32
8000e7f8:	2fc0006f          	j	8000eaf4 <_write_r>

Disassembly of section .text.__sseek:

8000e7fc <__sseek>:
8000e7fc:	ff010113          	addi	sp,sp,-16
8000e800:	00812423          	sw	s0,8(sp)
8000e804:	00058413          	mv	s0,a1
8000e808:	00e59583          	lh	a1,14(a1)
8000e80c:	00112623          	sw	ra,12(sp)
8000e810:	374000ef          	jal	ra,8000eb84 <_lseek_r>
8000e814:	fff00793          	li	a5,-1
8000e818:	00c45703          	lhu	a4,12(s0)
8000e81c:	02f51263          	bne	a0,a5,8000e840 <__sseek+0x44>
8000e820:	fffff7b7          	lui	a5,0xfffff
8000e824:	fff78793          	addi	a5,a5,-1 # ffffefff <_heap_end+0x7ffecfff>
8000e828:	00e7f7b3          	and	a5,a5,a4
8000e82c:	00f41623          	sh	a5,12(s0)
8000e830:	00c12083          	lw	ra,12(sp)
8000e834:	00812403          	lw	s0,8(sp)
8000e838:	01010113          	addi	sp,sp,16
8000e83c:	00008067          	ret
8000e840:	000017b7          	lui	a5,0x1
8000e844:	00f767b3          	or	a5,a4,a5
8000e848:	00f41623          	sh	a5,12(s0)
8000e84c:	04a42a23          	sw	a0,84(s0)
8000e850:	fe1ff06f          	j	8000e830 <__sseek+0x34>

Disassembly of section .text.__sclose:

8000e854 <__sclose>:
8000e854:	00e59583          	lh	a1,14(a1)
8000e858:	2e80006f          	j	8000eb40 <_close_r>

Disassembly of section .text.strlen:

8000e85c <strlen>:
8000e85c:	00050793          	mv	a5,a0
8000e860:	00178793          	addi	a5,a5,1 # 1001 <_stack_size+0x801>
8000e864:	fff7c703          	lbu	a4,-1(a5)
8000e868:	fe071ce3          	bnez	a4,8000e860 <strlen+0x4>
8000e86c:	40a78533          	sub	a0,a5,a0
8000e870:	fff50513          	addi	a0,a0,-1
8000e874:	00008067          	ret

Disassembly of section .text.strncmp:

8000e878 <strncmp>:
8000e878:	02060a63          	beqz	a2,8000e8ac <strncmp+0x34>
8000e87c:	fff60613          	addi	a2,a2,-1
8000e880:	00000713          	li	a4,0
8000e884:	00e507b3          	add	a5,a0,a4
8000e888:	00e586b3          	add	a3,a1,a4
8000e88c:	0007c783          	lbu	a5,0(a5)
8000e890:	0006c683          	lbu	a3,0(a3)
8000e894:	00d79863          	bne	a5,a3,8000e8a4 <strncmp+0x2c>
8000e898:	00c70663          	beq	a4,a2,8000e8a4 <strncmp+0x2c>
8000e89c:	00170713          	addi	a4,a4,1
8000e8a0:	fe0792e3          	bnez	a5,8000e884 <strncmp+0xc>
8000e8a4:	40d78533          	sub	a0,a5,a3
8000e8a8:	00008067          	ret
8000e8ac:	00000513          	li	a0,0
8000e8b0:	00008067          	ret

Disassembly of section .text._strtol_l.isra.0:

8000e8b4 <_strtol_l.isra.0>:
8000e8b4:	fc010113          	addi	sp,sp,-64
8000e8b8:	03212823          	sw	s2,48(sp)
8000e8bc:	03512223          	sw	s5,36(sp)
8000e8c0:	03612023          	sw	s6,32(sp)
8000e8c4:	01812c23          	sw	s8,24(sp)
8000e8c8:	00068913          	mv	s2,a3
8000e8cc:	02112e23          	sw	ra,60(sp)
8000e8d0:	02812c23          	sw	s0,56(sp)
8000e8d4:	02912a23          	sw	s1,52(sp)
8000e8d8:	03312623          	sw	s3,44(sp)
8000e8dc:	03412423          	sw	s4,40(sp)
8000e8e0:	01712e23          	sw	s7,28(sp)
8000e8e4:	01912a23          	sw	s9,20(sp)
8000e8e8:	01a12823          	sw	s10,16(sp)
8000e8ec:	01b12623          	sw	s11,12(sp)
8000e8f0:	00050a93          	mv	s5,a0
8000e8f4:	00058b13          	mv	s6,a1
8000e8f8:	00060c13          	mv	s8,a2
8000e8fc:	00058793          	mv	a5,a1
8000e900:	ffff4697          	auipc	a3,0xffff4
8000e904:	40968693          	addi	a3,a3,1033 # 80002d09 <_ctype_+0x1>
8000e908:	00178493          	addi	s1,a5,1
8000e90c:	fff4c403          	lbu	s0,-1(s1)
8000e910:	00d40733          	add	a4,s0,a3
8000e914:	00074703          	lbu	a4,0(a4)
8000e918:	00877713          	andi	a4,a4,8
8000e91c:	0c071863          	bnez	a4,8000e9ec <_strtol_l.isra.0+0x138>
8000e920:	02d00713          	li	a4,45
8000e924:	0ce41863          	bne	s0,a4,8000e9f4 <_strtol_l.isra.0+0x140>
8000e928:	0004c403          	lbu	s0,0(s1)
8000e92c:	00100a13          	li	s4,1
8000e930:	00278493          	addi	s1,a5,2
8000e934:	16090e63          	beqz	s2,8000eab0 <_strtol_l.isra.0+0x1fc>
8000e938:	01000793          	li	a5,16
8000e93c:	02f91463          	bne	s2,a5,8000e964 <_strtol_l.isra.0+0xb0>
8000e940:	03000793          	li	a5,48
8000e944:	02f41063          	bne	s0,a5,8000e964 <_strtol_l.isra.0+0xb0>
8000e948:	0004c783          	lbu	a5,0(s1)
8000e94c:	05800713          	li	a4,88
8000e950:	0df7f793          	andi	a5,a5,223
8000e954:	14e79663          	bne	a5,a4,8000eaa0 <_strtol_l.isra.0+0x1ec>
8000e958:	0014c403          	lbu	s0,1(s1)
8000e95c:	01000913          	li	s2,16
8000e960:	00248493          	addi	s1,s1,2
8000e964:	800009b7          	lui	s3,0x80000
8000e968:	000a1463          	bnez	s4,8000e970 <_strtol_l.isra.0+0xbc>
8000e96c:	fff9c993          	not	s3,s3
8000e970:	00090593          	mv	a1,s2
8000e974:	00098513          	mv	a0,s3
8000e978:	98dfe0ef          	jal	ra,8000d304 <__umodsi3>
8000e97c:	00050b93          	mv	s7,a0
8000e980:	00090593          	mv	a1,s2
8000e984:	00098513          	mv	a0,s3
8000e988:	935fe0ef          	jal	ra,8000d2bc <__udivsi3>
8000e98c:	00050c93          	mv	s9,a0
8000e990:	00000713          	li	a4,0
8000e994:	00000513          	li	a0,0
8000e998:	00900d93          	li	s11,9
8000e99c:	01900d13          	li	s10,25
8000e9a0:	fff00693          	li	a3,-1
8000e9a4:	fd040793          	addi	a5,s0,-48
8000e9a8:	06fde463          	bltu	s11,a5,8000ea10 <_strtol_l.isra.0+0x15c>
8000e9ac:	00078413          	mv	s0,a5
8000e9b0:	09245063          	bge	s0,s2,8000ea30 <_strtol_l.isra.0+0x17c>
8000e9b4:	02d70663          	beq	a4,a3,8000e9e0 <_strtol_l.isra.0+0x12c>
8000e9b8:	fff00713          	li	a4,-1
8000e9bc:	02ace263          	bltu	s9,a0,8000e9e0 <_strtol_l.isra.0+0x12c>
8000e9c0:	00ac9463          	bne	s9,a0,8000e9c8 <_strtol_l.isra.0+0x114>
8000e9c4:	008bce63          	blt	s7,s0,8000e9e0 <_strtol_l.isra.0+0x12c>
8000e9c8:	00050593          	mv	a1,a0
8000e9cc:	00090513          	mv	a0,s2
8000e9d0:	8c1fe0ef          	jal	ra,8000d290 <__mulsi3>
8000e9d4:	00a40533          	add	a0,s0,a0
8000e9d8:	00100713          	li	a4,1
8000e9dc:	fff00693          	li	a3,-1
8000e9e0:	00148493          	addi	s1,s1,1
8000e9e4:	fff4c403          	lbu	s0,-1(s1)
8000e9e8:	fbdff06f          	j	8000e9a4 <_strtol_l.isra.0+0xf0>
8000e9ec:	00048793          	mv	a5,s1
8000e9f0:	f19ff06f          	j	8000e908 <_strtol_l.isra.0+0x54>
8000e9f4:	02b00713          	li	a4,43
8000e9f8:	00e40663          	beq	s0,a4,8000ea04 <_strtol_l.isra.0+0x150>
8000e9fc:	00000a13          	li	s4,0
8000ea00:	f35ff06f          	j	8000e934 <_strtol_l.isra.0+0x80>
8000ea04:	0004c403          	lbu	s0,0(s1)
8000ea08:	00278493          	addi	s1,a5,2
8000ea0c:	ff1ff06f          	j	8000e9fc <_strtol_l.isra.0+0x148>
8000ea10:	fbf40793          	addi	a5,s0,-65
8000ea14:	00fd6663          	bltu	s10,a5,8000ea20 <_strtol_l.isra.0+0x16c>
8000ea18:	fc940413          	addi	s0,s0,-55
8000ea1c:	f95ff06f          	j	8000e9b0 <_strtol_l.isra.0+0xfc>
8000ea20:	f9f40793          	addi	a5,s0,-97
8000ea24:	00fd6663          	bltu	s10,a5,8000ea30 <_strtol_l.isra.0+0x17c>
8000ea28:	fa940413          	addi	s0,s0,-87
8000ea2c:	f85ff06f          	j	8000e9b0 <_strtol_l.isra.0+0xfc>
8000ea30:	fff00793          	li	a5,-1
8000ea34:	04f71863          	bne	a4,a5,8000ea84 <_strtol_l.isra.0+0x1d0>
8000ea38:	02200793          	li	a5,34
8000ea3c:	00faa023          	sw	a5,0(s5)
8000ea40:	00098513          	mv	a0,s3
8000ea44:	040c1863          	bnez	s8,8000ea94 <_strtol_l.isra.0+0x1e0>
8000ea48:	03c12083          	lw	ra,60(sp)
8000ea4c:	03812403          	lw	s0,56(sp)
8000ea50:	03412483          	lw	s1,52(sp)
8000ea54:	03012903          	lw	s2,48(sp)
8000ea58:	02c12983          	lw	s3,44(sp)
8000ea5c:	02812a03          	lw	s4,40(sp)
8000ea60:	02412a83          	lw	s5,36(sp)
8000ea64:	02012b03          	lw	s6,32(sp)
8000ea68:	01c12b83          	lw	s7,28(sp)
8000ea6c:	01812c03          	lw	s8,24(sp)
8000ea70:	01412c83          	lw	s9,20(sp)
8000ea74:	01012d03          	lw	s10,16(sp)
8000ea78:	00c12d83          	lw	s11,12(sp)
8000ea7c:	04010113          	addi	sp,sp,64
8000ea80:	00008067          	ret
8000ea84:	000a0463          	beqz	s4,8000ea8c <_strtol_l.isra.0+0x1d8>
8000ea88:	40a00533          	neg	a0,a0
8000ea8c:	fa0c0ee3          	beqz	s8,8000ea48 <_strtol_l.isra.0+0x194>
8000ea90:	00070463          	beqz	a4,8000ea98 <_strtol_l.isra.0+0x1e4>
8000ea94:	fff48b13          	addi	s6,s1,-1
8000ea98:	016c2023          	sw	s6,0(s8)
8000ea9c:	fadff06f          	j	8000ea48 <_strtol_l.isra.0+0x194>
8000eaa0:	03000413          	li	s0,48
8000eaa4:	ec0910e3          	bnez	s2,8000e964 <_strtol_l.isra.0+0xb0>
8000eaa8:	00800913          	li	s2,8
8000eaac:	eb9ff06f          	j	8000e964 <_strtol_l.isra.0+0xb0>
8000eab0:	03000793          	li	a5,48
8000eab4:	e8f40ae3          	beq	s0,a5,8000e948 <_strtol_l.isra.0+0x94>
8000eab8:	00a00913          	li	s2,10
8000eabc:	ea9ff06f          	j	8000e964 <_strtol_l.isra.0+0xb0>

Disassembly of section .text._strtol_r:

8000eac0 <_strtol_r>:
8000eac0:	df5ff06f          	j	8000e8b4 <_strtol_l.isra.0>

Disassembly of section .text.strtol_l:

8000eac4 <strtol_l>:
8000eac4:	80c18793          	addi	a5,gp,-2036 # 80003044 <_impure_ptr>
8000eac8:	00060693          	mv	a3,a2
8000eacc:	00058613          	mv	a2,a1
8000ead0:	00050593          	mv	a1,a0
8000ead4:	0007a503          	lw	a0,0(a5)
8000ead8:	dddff06f          	j	8000e8b4 <_strtol_l.isra.0>

Disassembly of section .text.strtol:

8000eadc <strtol>:
8000eadc:	80c18793          	addi	a5,gp,-2036 # 80003044 <_impure_ptr>
8000eae0:	00060693          	mv	a3,a2
8000eae4:	00058613          	mv	a2,a1
8000eae8:	00050593          	mv	a1,a0
8000eaec:	0007a503          	lw	a0,0(a5)
8000eaf0:	dc5ff06f          	j	8000e8b4 <_strtol_l.isra.0>

Disassembly of section .text._write_r:

8000eaf4 <_write_r>:
8000eaf4:	ff010113          	addi	sp,sp,-16
8000eaf8:	00812423          	sw	s0,8(sp)
8000eafc:	00050413          	mv	s0,a0
8000eb00:	00058513          	mv	a0,a1
8000eb04:	00060593          	mv	a1,a2
8000eb08:	00068613          	mv	a2,a3
8000eb0c:	c401a223          	sw	zero,-956(gp) # 8000347c <errno>
8000eb10:	00112623          	sw	ra,12(sp)
8000eb14:	920f70ef          	jal	ra,80005c34 <_write>
8000eb18:	fff00793          	li	a5,-1
8000eb1c:	00f51a63          	bne	a0,a5,8000eb30 <_write_r+0x3c>
8000eb20:	c4418793          	addi	a5,gp,-956 # 8000347c <errno>
8000eb24:	0007a783          	lw	a5,0(a5)
8000eb28:	00078463          	beqz	a5,8000eb30 <_write_r+0x3c>
8000eb2c:	00f42023          	sw	a5,0(s0)
8000eb30:	00c12083          	lw	ra,12(sp)
8000eb34:	00812403          	lw	s0,8(sp)
8000eb38:	01010113          	addi	sp,sp,16
8000eb3c:	00008067          	ret

Disassembly of section .text._close_r:

8000eb40 <_close_r>:
8000eb40:	ff010113          	addi	sp,sp,-16
8000eb44:	00812423          	sw	s0,8(sp)
8000eb48:	00050413          	mv	s0,a0
8000eb4c:	00058513          	mv	a0,a1
8000eb50:	c401a223          	sw	zero,-956(gp) # 8000347c <errno>
8000eb54:	00112623          	sw	ra,12(sp)
8000eb58:	918f70ef          	jal	ra,80005c70 <_close>
8000eb5c:	fff00793          	li	a5,-1
8000eb60:	00f51a63          	bne	a0,a5,8000eb74 <_close_r+0x34>
8000eb64:	c4418793          	addi	a5,gp,-956 # 8000347c <errno>
8000eb68:	0007a783          	lw	a5,0(a5)
8000eb6c:	00078463          	beqz	a5,8000eb74 <_close_r+0x34>
8000eb70:	00f42023          	sw	a5,0(s0)
8000eb74:	00c12083          	lw	ra,12(sp)
8000eb78:	00812403          	lw	s0,8(sp)
8000eb7c:	01010113          	addi	sp,sp,16
8000eb80:	00008067          	ret

Disassembly of section .text._lseek_r:

8000eb84 <_lseek_r>:
8000eb84:	ff010113          	addi	sp,sp,-16
8000eb88:	00812423          	sw	s0,8(sp)
8000eb8c:	00050413          	mv	s0,a0
8000eb90:	00058513          	mv	a0,a1
8000eb94:	00060593          	mv	a1,a2
8000eb98:	00068613          	mv	a2,a3
8000eb9c:	c401a223          	sw	zero,-956(gp) # 8000347c <errno>
8000eba0:	00112623          	sw	ra,12(sp)
8000eba4:	8d4f70ef          	jal	ra,80005c78 <_lseek>
8000eba8:	fff00793          	li	a5,-1
8000ebac:	00f51a63          	bne	a0,a5,8000ebc0 <_lseek_r+0x3c>
8000ebb0:	c4418793          	addi	a5,gp,-956 # 8000347c <errno>
8000ebb4:	0007a783          	lw	a5,0(a5)
8000ebb8:	00078463          	beqz	a5,8000ebc0 <_lseek_r+0x3c>
8000ebbc:	00f42023          	sw	a5,0(s0)
8000ebc0:	00c12083          	lw	ra,12(sp)
8000ebc4:	00812403          	lw	s0,8(sp)
8000ebc8:	01010113          	addi	sp,sp,16
8000ebcc:	00008067          	ret

Disassembly of section .text.__ssputs_r:

8000ebd0 <__ssputs_r>:
8000ebd0:	fe010113          	addi	sp,sp,-32
8000ebd4:	01212823          	sw	s2,16(sp)
8000ebd8:	0085a903          	lw	s2,8(a1)
8000ebdc:	00812c23          	sw	s0,24(sp)
8000ebe0:	01412423          	sw	s4,8(sp)
8000ebe4:	01612023          	sw	s6,0(sp)
8000ebe8:	00112e23          	sw	ra,28(sp)
8000ebec:	00912a23          	sw	s1,20(sp)
8000ebf0:	01312623          	sw	s3,12(sp)
8000ebf4:	01512223          	sw	s5,4(sp)
8000ebf8:	00058413          	mv	s0,a1
8000ebfc:	00060b13          	mv	s6,a2
8000ec00:	00068a13          	mv	s4,a3
8000ec04:	0f26e063          	bltu	a3,s2,8000ece4 <__ssputs_r+0x114>
8000ec08:	00c5d783          	lhu	a5,12(a1)
8000ec0c:	4807f713          	andi	a4,a5,1152
8000ec10:	0c070863          	beqz	a4,8000ece0 <__ssputs_r+0x110>
8000ec14:	00042483          	lw	s1,0(s0)
8000ec18:	01442703          	lw	a4,20(s0)
8000ec1c:	0105a583          	lw	a1,16(a1)
8000ec20:	00050a93          	mv	s5,a0
8000ec24:	40b489b3          	sub	s3,s1,a1
8000ec28:	00171493          	slli	s1,a4,0x1
8000ec2c:	00e48733          	add	a4,s1,a4
8000ec30:	01f75493          	srli	s1,a4,0x1f
8000ec34:	00e484b3          	add	s1,s1,a4
8000ec38:	00168713          	addi	a4,a3,1
8000ec3c:	4014d493          	srai	s1,s1,0x1
8000ec40:	01370733          	add	a4,a4,s3
8000ec44:	00e4f463          	bgeu	s1,a4,8000ec4c <__ssputs_r+0x7c>
8000ec48:	00070493          	mv	s1,a4
8000ec4c:	4007f793          	andi	a5,a5,1024
8000ec50:	0c078463          	beqz	a5,8000ed18 <__ssputs_r+0x148>
8000ec54:	00048593          	mv	a1,s1
8000ec58:	000a8513          	mv	a0,s5
8000ec5c:	e14ff0ef          	jal	ra,8000e270 <_malloc_r>
8000ec60:	00050913          	mv	s2,a0
8000ec64:	04051263          	bnez	a0,8000eca8 <__ssputs_r+0xd8>
8000ec68:	00c00793          	li	a5,12
8000ec6c:	00faa023          	sw	a5,0(s5)
8000ec70:	00c45783          	lhu	a5,12(s0)
8000ec74:	fff00513          	li	a0,-1
8000ec78:	0407e793          	ori	a5,a5,64
8000ec7c:	00f41623          	sh	a5,12(s0)
8000ec80:	01c12083          	lw	ra,28(sp)
8000ec84:	01812403          	lw	s0,24(sp)
8000ec88:	01412483          	lw	s1,20(sp)
8000ec8c:	01012903          	lw	s2,16(sp)
8000ec90:	00c12983          	lw	s3,12(sp)
8000ec94:	00812a03          	lw	s4,8(sp)
8000ec98:	00412a83          	lw	s5,4(sp)
8000ec9c:	00012b03          	lw	s6,0(sp)
8000eca0:	02010113          	addi	sp,sp,32
8000eca4:	00008067          	ret
8000eca8:	01042583          	lw	a1,16(s0)
8000ecac:	00098613          	mv	a2,s3
8000ecb0:	b34ff0ef          	jal	ra,8000dfe4 <memcpy>
8000ecb4:	00c45783          	lhu	a5,12(s0)
8000ecb8:	b7f7f793          	andi	a5,a5,-1153
8000ecbc:	0807e793          	ori	a5,a5,128
8000ecc0:	00f41623          	sh	a5,12(s0)
8000ecc4:	01242823          	sw	s2,16(s0)
8000ecc8:	00942a23          	sw	s1,20(s0)
8000eccc:	01390933          	add	s2,s2,s3
8000ecd0:	413484b3          	sub	s1,s1,s3
8000ecd4:	01242023          	sw	s2,0(s0)
8000ecd8:	00942423          	sw	s1,8(s0)
8000ecdc:	000a0913          	mv	s2,s4
8000ece0:	012a7463          	bgeu	s4,s2,8000ece8 <__ssputs_r+0x118>
8000ece4:	000a0913          	mv	s2,s4
8000ece8:	00042503          	lw	a0,0(s0)
8000ecec:	00090613          	mv	a2,s2
8000ecf0:	000b0593          	mv	a1,s6
8000ecf4:	bc8ff0ef          	jal	ra,8000e0bc <memmove>
8000ecf8:	00842783          	lw	a5,8(s0)
8000ecfc:	00000513          	li	a0,0
8000ed00:	412787b3          	sub	a5,a5,s2
8000ed04:	00f42423          	sw	a5,8(s0)
8000ed08:	00042783          	lw	a5,0(s0)
8000ed0c:	01278933          	add	s2,a5,s2
8000ed10:	01242023          	sw	s2,0(s0)
8000ed14:	f6dff06f          	j	8000ec80 <__ssputs_r+0xb0>
8000ed18:	00048613          	mv	a2,s1
8000ed1c:	000a8513          	mv	a0,s5
8000ed20:	2a9010ef          	jal	ra,800107c8 <_realloc_r>
8000ed24:	00050913          	mv	s2,a0
8000ed28:	f8051ee3          	bnez	a0,8000ecc4 <__ssputs_r+0xf4>
8000ed2c:	01042583          	lw	a1,16(s0)
8000ed30:	000a8513          	mv	a0,s5
8000ed34:	c38ff0ef          	jal	ra,8000e16c <_free_r>
8000ed38:	f31ff06f          	j	8000ec68 <__ssputs_r+0x98>

Disassembly of section .text.__ssprint_r:

8000ed3c <__ssprint_r>:
8000ed3c:	00862783          	lw	a5,8(a2)
8000ed40:	fd010113          	addi	sp,sp,-48
8000ed44:	01312e23          	sw	s3,28(sp)
8000ed48:	02112623          	sw	ra,44(sp)
8000ed4c:	02812423          	sw	s0,40(sp)
8000ed50:	02912223          	sw	s1,36(sp)
8000ed54:	03212023          	sw	s2,32(sp)
8000ed58:	01412c23          	sw	s4,24(sp)
8000ed5c:	01512a23          	sw	s5,20(sp)
8000ed60:	01612823          	sw	s6,16(sp)
8000ed64:	01712623          	sw	s7,12(sp)
8000ed68:	01812423          	sw	s8,8(sp)
8000ed6c:	00060993          	mv	s3,a2
8000ed70:	12078663          	beqz	a5,8000ee9c <__ssprint_r+0x160>
8000ed74:	00062b03          	lw	s6,0(a2)
8000ed78:	00050a93          	mv	s5,a0
8000ed7c:	00058413          	mv	s0,a1
8000ed80:	00000b93          	li	s7,0
8000ed84:	00000913          	li	s2,0
8000ed88:	08090663          	beqz	s2,8000ee14 <__ssprint_r+0xd8>
8000ed8c:	00842a03          	lw	s4,8(s0)
8000ed90:	0d496663          	bltu	s2,s4,8000ee5c <__ssprint_r+0x120>
8000ed94:	00c45783          	lhu	a5,12(s0)
8000ed98:	4807f713          	andi	a4,a5,1152
8000ed9c:	0c070063          	beqz	a4,8000ee5c <__ssprint_r+0x120>
8000eda0:	00042483          	lw	s1,0(s0)
8000eda4:	01442703          	lw	a4,20(s0)
8000eda8:	01042583          	lw	a1,16(s0)
8000edac:	40b48c33          	sub	s8,s1,a1
8000edb0:	00171493          	slli	s1,a4,0x1
8000edb4:	00e48733          	add	a4,s1,a4
8000edb8:	01f75493          	srli	s1,a4,0x1f
8000edbc:	00e484b3          	add	s1,s1,a4
8000edc0:	001c0713          	addi	a4,s8,1
8000edc4:	4014d493          	srai	s1,s1,0x1
8000edc8:	01270733          	add	a4,a4,s2
8000edcc:	00e4f463          	bgeu	s1,a4,8000edd4 <__ssprint_r+0x98>
8000edd0:	00070493          	mv	s1,a4
8000edd4:	4007f793          	andi	a5,a5,1024
8000edd8:	0e078e63          	beqz	a5,8000eed4 <__ssprint_r+0x198>
8000eddc:	00048593          	mv	a1,s1
8000ede0:	000a8513          	mv	a0,s5
8000ede4:	c8cff0ef          	jal	ra,8000e270 <_malloc_r>
8000ede8:	00050a13          	mv	s4,a0
8000edec:	02051c63          	bnez	a0,8000ee24 <__ssprint_r+0xe8>
8000edf0:	00c00793          	li	a5,12
8000edf4:	00faa023          	sw	a5,0(s5)
8000edf8:	00c45783          	lhu	a5,12(s0)
8000edfc:	fff00513          	li	a0,-1
8000ee00:	0407e793          	ori	a5,a5,64
8000ee04:	00f41623          	sh	a5,12(s0)
8000ee08:	0009a423          	sw	zero,8(s3) # 80000008 <_heap_end+0xfffee008>
8000ee0c:	0009a223          	sw	zero,4(s3)
8000ee10:	0940006f          	j	8000eea4 <__ssprint_r+0x168>
8000ee14:	000b2b83          	lw	s7,0(s6)
8000ee18:	004b2903          	lw	s2,4(s6)
8000ee1c:	008b0b13          	addi	s6,s6,8
8000ee20:	f69ff06f          	j	8000ed88 <__ssprint_r+0x4c>
8000ee24:	01042583          	lw	a1,16(s0)
8000ee28:	000c0613          	mv	a2,s8
8000ee2c:	9b8ff0ef          	jal	ra,8000dfe4 <memcpy>
8000ee30:	00c45783          	lhu	a5,12(s0)
8000ee34:	b7f7f793          	andi	a5,a5,-1153
8000ee38:	0807e793          	ori	a5,a5,128
8000ee3c:	00f41623          	sh	a5,12(s0)
8000ee40:	01442823          	sw	s4,16(s0)
8000ee44:	00942a23          	sw	s1,20(s0)
8000ee48:	018a0a33          	add	s4,s4,s8
8000ee4c:	418484b3          	sub	s1,s1,s8
8000ee50:	01442023          	sw	s4,0(s0)
8000ee54:	00942423          	sw	s1,8(s0)
8000ee58:	00090a13          	mv	s4,s2
8000ee5c:	01497463          	bgeu	s2,s4,8000ee64 <__ssprint_r+0x128>
8000ee60:	00090a13          	mv	s4,s2
8000ee64:	00042503          	lw	a0,0(s0)
8000ee68:	000a0613          	mv	a2,s4
8000ee6c:	000b8593          	mv	a1,s7
8000ee70:	a4cff0ef          	jal	ra,8000e0bc <memmove>
8000ee74:	00842783          	lw	a5,8(s0)
8000ee78:	414787b3          	sub	a5,a5,s4
8000ee7c:	00f42423          	sw	a5,8(s0)
8000ee80:	00042783          	lw	a5,0(s0)
8000ee84:	01478a33          	add	s4,a5,s4
8000ee88:	0089a783          	lw	a5,8(s3)
8000ee8c:	01442023          	sw	s4,0(s0)
8000ee90:	41278933          	sub	s2,a5,s2
8000ee94:	0129a423          	sw	s2,8(s3)
8000ee98:	f6091ee3          	bnez	s2,8000ee14 <__ssprint_r+0xd8>
8000ee9c:	0009a223          	sw	zero,4(s3)
8000eea0:	00000513          	li	a0,0
8000eea4:	02c12083          	lw	ra,44(sp)
8000eea8:	02812403          	lw	s0,40(sp)
8000eeac:	02412483          	lw	s1,36(sp)
8000eeb0:	02012903          	lw	s2,32(sp)
8000eeb4:	01c12983          	lw	s3,28(sp)
8000eeb8:	01812a03          	lw	s4,24(sp)
8000eebc:	01412a83          	lw	s5,20(sp)
8000eec0:	01012b03          	lw	s6,16(sp)
8000eec4:	00c12b83          	lw	s7,12(sp)
8000eec8:	00812c03          	lw	s8,8(sp)
8000eecc:	03010113          	addi	sp,sp,48
8000eed0:	00008067          	ret
8000eed4:	00048613          	mv	a2,s1
8000eed8:	000a8513          	mv	a0,s5
8000eedc:	0ed010ef          	jal	ra,800107c8 <_realloc_r>
8000eee0:	00050a13          	mv	s4,a0
8000eee4:	f4051ee3          	bnez	a0,8000ee40 <__ssprint_r+0x104>
8000eee8:	01042583          	lw	a1,16(s0)
8000eeec:	000a8513          	mv	a0,s5
8000eef0:	a7cff0ef          	jal	ra,8000e16c <_free_r>
8000eef4:	efdff06f          	j	8000edf0 <__ssprint_r+0xb4>

Disassembly of section .text._svfprintf_r:

8000eef8 <_svfiprintf_r>:
8000eef8:	00c5d783          	lhu	a5,12(a1)
8000eefc:	f5010113          	addi	sp,sp,-176
8000ef00:	0a912223          	sw	s1,164(sp)
8000ef04:	0b212023          	sw	s2,160(sp)
8000ef08:	09312e23          	sw	s3,156(sp)
8000ef0c:	0a112623          	sw	ra,172(sp)
8000ef10:	0a812423          	sw	s0,168(sp)
8000ef14:	09412c23          	sw	s4,152(sp)
8000ef18:	09512a23          	sw	s5,148(sp)
8000ef1c:	09612823          	sw	s6,144(sp)
8000ef20:	09712623          	sw	s7,140(sp)
8000ef24:	09812423          	sw	s8,136(sp)
8000ef28:	09912223          	sw	s9,132(sp)
8000ef2c:	0807f793          	andi	a5,a5,128
8000ef30:	00050993          	mv	s3,a0
8000ef34:	00058913          	mv	s2,a1
8000ef38:	00060493          	mv	s1,a2
8000ef3c:	06078863          	beqz	a5,8000efac <_svfiprintf_r+0xb4>
8000ef40:	0105a783          	lw	a5,16(a1)
8000ef44:	06079463          	bnez	a5,8000efac <_svfiprintf_r+0xb4>
8000ef48:	04000593          	li	a1,64
8000ef4c:	00d12623          	sw	a3,12(sp)
8000ef50:	b20ff0ef          	jal	ra,8000e270 <_malloc_r>
8000ef54:	00a92023          	sw	a0,0(s2)
8000ef58:	00a92823          	sw	a0,16(s2)
8000ef5c:	00c12683          	lw	a3,12(sp)
8000ef60:	04051263          	bnez	a0,8000efa4 <_svfiprintf_r+0xac>
8000ef64:	00c00793          	li	a5,12
8000ef68:	00f9a023          	sw	a5,0(s3)
8000ef6c:	fff00513          	li	a0,-1
8000ef70:	0ac12083          	lw	ra,172(sp)
8000ef74:	0a812403          	lw	s0,168(sp)
8000ef78:	0a412483          	lw	s1,164(sp)
8000ef7c:	0a012903          	lw	s2,160(sp)
8000ef80:	09c12983          	lw	s3,156(sp)
8000ef84:	09812a03          	lw	s4,152(sp)
8000ef88:	09412a83          	lw	s5,148(sp)
8000ef8c:	09012b03          	lw	s6,144(sp)
8000ef90:	08c12b83          	lw	s7,140(sp)
8000ef94:	08812c03          	lw	s8,136(sp)
8000ef98:	08412c83          	lw	s9,132(sp)
8000ef9c:	0b010113          	addi	sp,sp,176
8000efa0:	00008067          	ret
8000efa4:	04000793          	li	a5,64
8000efa8:	00f92a23          	sw	a5,20(s2)
8000efac:	02000793          	li	a5,32
8000efb0:	02f10ca3          	sb	a5,57(sp)
8000efb4:	03000793          	li	a5,48
8000efb8:	02012a23          	sw	zero,52(sp)
8000efbc:	02f10d23          	sb	a5,58(sp)
8000efc0:	00d12e23          	sw	a3,28(sp)
8000efc4:	02500b13          	li	s6,37
8000efc8:	ffff4a97          	auipc	s5,0xffff4
8000efcc:	ea4a8a93          	addi	s5,s5,-348 # 80002e6c <__sf_fake_stdout+0x20>
8000efd0:	00100b93          	li	s7,1
8000efd4:	7fff1c17          	auipc	s8,0x7fff1
8000efd8:	02cc0c13          	addi	s8,s8,44 # 0 <_heap_end+0x7ffee000>
8000efdc:	00048413          	mv	s0,s1
8000efe0:	00044783          	lbu	a5,0(s0)
8000efe4:	00078463          	beqz	a5,8000efec <_svfiprintf_r+0xf4>
8000efe8:	0d679663          	bne	a5,s6,8000f0b4 <_svfiprintf_r+0x1bc>
8000efec:	40940cb3          	sub	s9,s0,s1
8000eff0:	020c8663          	beqz	s9,8000f01c <_svfiprintf_r+0x124>
8000eff4:	000c8693          	mv	a3,s9
8000eff8:	00048613          	mv	a2,s1
8000effc:	00090593          	mv	a1,s2
8000f000:	00098513          	mv	a0,s3
8000f004:	bcdff0ef          	jal	ra,8000ebd0 <__ssputs_r>
8000f008:	fff00793          	li	a5,-1
8000f00c:	24f50e63          	beq	a0,a5,8000f268 <_svfiprintf_r+0x370>
8000f010:	03412683          	lw	a3,52(sp)
8000f014:	019686b3          	add	a3,a3,s9
8000f018:	02d12a23          	sw	a3,52(sp)
8000f01c:	00044783          	lbu	a5,0(s0)
8000f020:	24078463          	beqz	a5,8000f268 <_svfiprintf_r+0x370>
8000f024:	fff00793          	li	a5,-1
8000f028:	00140493          	addi	s1,s0,1
8000f02c:	02012023          	sw	zero,32(sp)
8000f030:	02012623          	sw	zero,44(sp)
8000f034:	02f12223          	sw	a5,36(sp)
8000f038:	02012423          	sw	zero,40(sp)
8000f03c:	060101a3          	sb	zero,99(sp)
8000f040:	06012c23          	sw	zero,120(sp)
8000f044:	0004c583          	lbu	a1,0(s1)
8000f048:	00500613          	li	a2,5
8000f04c:	000a8513          	mv	a0,s5
8000f050:	754010ef          	jal	ra,800107a4 <memchr>
8000f054:	00148413          	addi	s0,s1,1
8000f058:	02012783          	lw	a5,32(sp)
8000f05c:	06051063          	bnez	a0,8000f0bc <_svfiprintf_r+0x1c4>
8000f060:	0107f713          	andi	a4,a5,16
8000f064:	00070663          	beqz	a4,8000f070 <_svfiprintf_r+0x178>
8000f068:	02000713          	li	a4,32
8000f06c:	06e101a3          	sb	a4,99(sp)
8000f070:	0087f713          	andi	a4,a5,8
8000f074:	00070663          	beqz	a4,8000f080 <_svfiprintf_r+0x188>
8000f078:	02b00713          	li	a4,43
8000f07c:	06e101a3          	sb	a4,99(sp)
8000f080:	0004c683          	lbu	a3,0(s1)
8000f084:	02a00713          	li	a4,42
8000f088:	04e68663          	beq	a3,a4,8000f0d4 <_svfiprintf_r+0x1dc>
8000f08c:	02c12703          	lw	a4,44(sp)
8000f090:	00048413          	mv	s0,s1
8000f094:	00000793          	li	a5,0
8000f098:	00900613          	li	a2,9
8000f09c:	00044683          	lbu	a3,0(s0)
8000f0a0:	00140593          	addi	a1,s0,1
8000f0a4:	fd068693          	addi	a3,a3,-48
8000f0a8:	10d67a63          	bgeu	a2,a3,8000f1bc <_svfiprintf_r+0x2c4>
8000f0ac:	02079e63          	bnez	a5,8000f0e8 <_svfiprintf_r+0x1f0>
8000f0b0:	0500006f          	j	8000f100 <_svfiprintf_r+0x208>
8000f0b4:	00140413          	addi	s0,s0,1
8000f0b8:	f29ff06f          	j	8000efe0 <_svfiprintf_r+0xe8>
8000f0bc:	41550533          	sub	a0,a0,s5
8000f0c0:	00ab9533          	sll	a0,s7,a0
8000f0c4:	00a7e7b3          	or	a5,a5,a0
8000f0c8:	02f12023          	sw	a5,32(sp)
8000f0cc:	00040493          	mv	s1,s0
8000f0d0:	f75ff06f          	j	8000f044 <_svfiprintf_r+0x14c>
8000f0d4:	01c12703          	lw	a4,28(sp)
8000f0d8:	00470693          	addi	a3,a4,4
8000f0dc:	00072703          	lw	a4,0(a4)
8000f0e0:	00d12e23          	sw	a3,28(sp)
8000f0e4:	00074663          	bltz	a4,8000f0f0 <_svfiprintf_r+0x1f8>
8000f0e8:	02e12623          	sw	a4,44(sp)
8000f0ec:	0140006f          	j	8000f100 <_svfiprintf_r+0x208>
8000f0f0:	40e00733          	neg	a4,a4
8000f0f4:	0027e793          	ori	a5,a5,2
8000f0f8:	02e12623          	sw	a4,44(sp)
8000f0fc:	02f12023          	sw	a5,32(sp)
8000f100:	00044703          	lbu	a4,0(s0)
8000f104:	02e00793          	li	a5,46
8000f108:	02f71663          	bne	a4,a5,8000f134 <_svfiprintf_r+0x23c>
8000f10c:	00144703          	lbu	a4,1(s0)
8000f110:	02a00793          	li	a5,42
8000f114:	0cf71663          	bne	a4,a5,8000f1e0 <_svfiprintf_r+0x2e8>
8000f118:	01c12783          	lw	a5,28(sp)
8000f11c:	00240413          	addi	s0,s0,2
8000f120:	00478713          	addi	a4,a5,4
8000f124:	0007a783          	lw	a5,0(a5)
8000f128:	00e12e23          	sw	a4,28(sp)
8000f12c:	0a07c663          	bltz	a5,8000f1d8 <_svfiprintf_r+0x2e0>
8000f130:	02f12223          	sw	a5,36(sp)
8000f134:	00044583          	lbu	a1,0(s0)
8000f138:	00300613          	li	a2,3
8000f13c:	ffff4517          	auipc	a0,0xffff4
8000f140:	d3850513          	addi	a0,a0,-712 # 80002e74 <__sf_fake_stdout+0x28>
8000f144:	660010ef          	jal	ra,800107a4 <memchr>
8000f148:	02050463          	beqz	a0,8000f170 <_svfiprintf_r+0x278>
8000f14c:	ffff4797          	auipc	a5,0xffff4
8000f150:	d2878793          	addi	a5,a5,-728 # 80002e74 <__sf_fake_stdout+0x28>
8000f154:	40f50533          	sub	a0,a0,a5
8000f158:	04000793          	li	a5,64
8000f15c:	00a797b3          	sll	a5,a5,a0
8000f160:	02012503          	lw	a0,32(sp)
8000f164:	00140413          	addi	s0,s0,1
8000f168:	00f56533          	or	a0,a0,a5
8000f16c:	02a12023          	sw	a0,32(sp)
8000f170:	00044583          	lbu	a1,0(s0)
8000f174:	00600613          	li	a2,6
8000f178:	ffff4517          	auipc	a0,0xffff4
8000f17c:	d0050513          	addi	a0,a0,-768 # 80002e78 <__sf_fake_stdout+0x2c>
8000f180:	00140493          	addi	s1,s0,1
8000f184:	02b10c23          	sb	a1,56(sp)
8000f188:	61c010ef          	jal	ra,800107a4 <memchr>
8000f18c:	0e050a63          	beqz	a0,8000f280 <_svfiprintf_r+0x388>
8000f190:	0a0c1663          	bnez	s8,8000f23c <_svfiprintf_r+0x344>
8000f194:	02012703          	lw	a4,32(sp)
8000f198:	01c12783          	lw	a5,28(sp)
8000f19c:	10077713          	andi	a4,a4,256
8000f1a0:	08070663          	beqz	a4,8000f22c <_svfiprintf_r+0x334>
8000f1a4:	00478793          	addi	a5,a5,4
8000f1a8:	00f12e23          	sw	a5,28(sp)
8000f1ac:	03412783          	lw	a5,52(sp)
8000f1b0:	014787b3          	add	a5,a5,s4
8000f1b4:	02f12a23          	sw	a5,52(sp)
8000f1b8:	e25ff06f          	j	8000efdc <_svfiprintf_r+0xe4>
8000f1bc:	00271793          	slli	a5,a4,0x2
8000f1c0:	00e787b3          	add	a5,a5,a4
8000f1c4:	00179793          	slli	a5,a5,0x1
8000f1c8:	00d78733          	add	a4,a5,a3
8000f1cc:	00058413          	mv	s0,a1
8000f1d0:	00100793          	li	a5,1
8000f1d4:	ec9ff06f          	j	8000f09c <_svfiprintf_r+0x1a4>
8000f1d8:	fff00793          	li	a5,-1
8000f1dc:	f55ff06f          	j	8000f130 <_svfiprintf_r+0x238>
8000f1e0:	00140413          	addi	s0,s0,1
8000f1e4:	02012223          	sw	zero,36(sp)
8000f1e8:	00000793          	li	a5,0
8000f1ec:	00000713          	li	a4,0
8000f1f0:	00900613          	li	a2,9
8000f1f4:	00044683          	lbu	a3,0(s0)
8000f1f8:	00140593          	addi	a1,s0,1
8000f1fc:	fd068693          	addi	a3,a3,-48
8000f200:	00d67863          	bgeu	a2,a3,8000f210 <_svfiprintf_r+0x318>
8000f204:	f20788e3          	beqz	a5,8000f134 <_svfiprintf_r+0x23c>
8000f208:	02e12223          	sw	a4,36(sp)
8000f20c:	f29ff06f          	j	8000f134 <_svfiprintf_r+0x23c>
8000f210:	00271793          	slli	a5,a4,0x2
8000f214:	00e787b3          	add	a5,a5,a4
8000f218:	00179793          	slli	a5,a5,0x1
8000f21c:	00d78733          	add	a4,a5,a3
8000f220:	00058413          	mv	s0,a1
8000f224:	00100793          	li	a5,1
8000f228:	fcdff06f          	j	8000f1f4 <_svfiprintf_r+0x2fc>
8000f22c:	00778793          	addi	a5,a5,7
8000f230:	ff87f793          	andi	a5,a5,-8
8000f234:	00878793          	addi	a5,a5,8
8000f238:	f71ff06f          	j	8000f1a8 <_svfiprintf_r+0x2b0>
8000f23c:	01c10713          	addi	a4,sp,28
8000f240:	00000697          	auipc	a3,0x0
8000f244:	99068693          	addi	a3,a3,-1648 # 8000ebd0 <__ssputs_r>
8000f248:	00090613          	mv	a2,s2
8000f24c:	02010593          	addi	a1,sp,32
8000f250:	00098513          	mv	a0,s3
8000f254:	00000097          	auipc	ra,0x0
8000f258:	000000e7          	jalr	zero # 0 <_heap_size>
8000f25c:	fff00793          	li	a5,-1
8000f260:	00050a13          	mv	s4,a0
8000f264:	f4f514e3          	bne	a0,a5,8000f1ac <_svfiprintf_r+0x2b4>
8000f268:	00c95783          	lhu	a5,12(s2)
8000f26c:	fff00513          	li	a0,-1
8000f270:	0407f793          	andi	a5,a5,64
8000f274:	ce079ee3          	bnez	a5,8000ef70 <_svfiprintf_r+0x78>
8000f278:	03412503          	lw	a0,52(sp)
8000f27c:	cf5ff06f          	j	8000ef70 <_svfiprintf_r+0x78>
8000f280:	01c10713          	addi	a4,sp,28
8000f284:	00000697          	auipc	a3,0x0
8000f288:	94c68693          	addi	a3,a3,-1716 # 8000ebd0 <__ssputs_r>
8000f28c:	00090613          	mv	a2,s2
8000f290:	02010593          	addi	a1,sp,32
8000f294:	00098513          	mv	a0,s3
8000f298:	1b8000ef          	jal	ra,8000f450 <_printf_i>
8000f29c:	fc1ff06f          	j	8000f25c <_svfiprintf_r+0x364>

Disassembly of section .text._printf_common:

8000f2a0 <_printf_common>:
8000f2a0:	fd010113          	addi	sp,sp,-48
8000f2a4:	01512a23          	sw	s5,20(sp)
8000f2a8:	0105a783          	lw	a5,16(a1)
8000f2ac:	00070a93          	mv	s5,a4
8000f2b0:	0085a703          	lw	a4,8(a1)
8000f2b4:	02812423          	sw	s0,40(sp)
8000f2b8:	02912223          	sw	s1,36(sp)
8000f2bc:	01312e23          	sw	s3,28(sp)
8000f2c0:	01412c23          	sw	s4,24(sp)
8000f2c4:	02112623          	sw	ra,44(sp)
8000f2c8:	03212023          	sw	s2,32(sp)
8000f2cc:	01612823          	sw	s6,16(sp)
8000f2d0:	01712623          	sw	s7,12(sp)
8000f2d4:	00050993          	mv	s3,a0
8000f2d8:	00058413          	mv	s0,a1
8000f2dc:	00060493          	mv	s1,a2
8000f2e0:	00068a13          	mv	s4,a3
8000f2e4:	00e7d463          	bge	a5,a4,8000f2ec <_printf_common+0x4c>
8000f2e8:	00070793          	mv	a5,a4
8000f2ec:	00f4a023          	sw	a5,0(s1)
8000f2f0:	04344703          	lbu	a4,67(s0)
8000f2f4:	00070663          	beqz	a4,8000f300 <_printf_common+0x60>
8000f2f8:	00178793          	addi	a5,a5,1
8000f2fc:	00f4a023          	sw	a5,0(s1)
8000f300:	00042783          	lw	a5,0(s0)
8000f304:	0207f793          	andi	a5,a5,32
8000f308:	00078863          	beqz	a5,8000f318 <_printf_common+0x78>
8000f30c:	0004a783          	lw	a5,0(s1)
8000f310:	00278793          	addi	a5,a5,2
8000f314:	00f4a023          	sw	a5,0(s1)
8000f318:	00042903          	lw	s2,0(s0)
8000f31c:	00697913          	andi	s2,s2,6
8000f320:	00091e63          	bnez	s2,8000f33c <_printf_common+0x9c>
8000f324:	01940b13          	addi	s6,s0,25
8000f328:	fff00b93          	li	s7,-1
8000f32c:	00c42783          	lw	a5,12(s0)
8000f330:	0004a703          	lw	a4,0(s1)
8000f334:	40e787b3          	sub	a5,a5,a4
8000f338:	08f94263          	blt	s2,a5,8000f3bc <_printf_common+0x11c>
8000f33c:	00042783          	lw	a5,0(s0)
8000f340:	04344683          	lbu	a3,67(s0)
8000f344:	0207f793          	andi	a5,a5,32
8000f348:	00d036b3          	snez	a3,a3
8000f34c:	0c079063          	bnez	a5,8000f40c <_printf_common+0x16c>
8000f350:	04340613          	addi	a2,s0,67
8000f354:	000a0593          	mv	a1,s4
8000f358:	00098513          	mv	a0,s3
8000f35c:	000a80e7          	jalr	s5
8000f360:	fff00793          	li	a5,-1
8000f364:	06f50863          	beq	a0,a5,8000f3d4 <_printf_common+0x134>
8000f368:	00042783          	lw	a5,0(s0)
8000f36c:	00400613          	li	a2,4
8000f370:	0004a703          	lw	a4,0(s1)
8000f374:	0067f793          	andi	a5,a5,6
8000f378:	00c42683          	lw	a3,12(s0)
8000f37c:	00000493          	li	s1,0
8000f380:	00c79863          	bne	a5,a2,8000f390 <_printf_common+0xf0>
8000f384:	40e684b3          	sub	s1,a3,a4
8000f388:	0004d463          	bgez	s1,8000f390 <_printf_common+0xf0>
8000f38c:	00000493          	li	s1,0
8000f390:	00842783          	lw	a5,8(s0)
8000f394:	01042703          	lw	a4,16(s0)
8000f398:	00f75663          	bge	a4,a5,8000f3a4 <_printf_common+0x104>
8000f39c:	40e787b3          	sub	a5,a5,a4
8000f3a0:	00f484b3          	add	s1,s1,a5
8000f3a4:	00000913          	li	s2,0
8000f3a8:	01a40413          	addi	s0,s0,26
8000f3ac:	fff00b13          	li	s6,-1
8000f3b0:	09249063          	bne	s1,s2,8000f430 <_printf_common+0x190>
8000f3b4:	00000513          	li	a0,0
8000f3b8:	0200006f          	j	8000f3d8 <_printf_common+0x138>
8000f3bc:	00100693          	li	a3,1
8000f3c0:	000b0613          	mv	a2,s6
8000f3c4:	000a0593          	mv	a1,s4
8000f3c8:	00098513          	mv	a0,s3
8000f3cc:	000a80e7          	jalr	s5
8000f3d0:	03751a63          	bne	a0,s7,8000f404 <_printf_common+0x164>
8000f3d4:	fff00513          	li	a0,-1
8000f3d8:	02c12083          	lw	ra,44(sp)
8000f3dc:	02812403          	lw	s0,40(sp)
8000f3e0:	02412483          	lw	s1,36(sp)
8000f3e4:	02012903          	lw	s2,32(sp)
8000f3e8:	01c12983          	lw	s3,28(sp)
8000f3ec:	01812a03          	lw	s4,24(sp)
8000f3f0:	01412a83          	lw	s5,20(sp)
8000f3f4:	01012b03          	lw	s6,16(sp)
8000f3f8:	00c12b83          	lw	s7,12(sp)
8000f3fc:	03010113          	addi	sp,sp,48
8000f400:	00008067          	ret
8000f404:	00190913          	addi	s2,s2,1
8000f408:	f25ff06f          	j	8000f32c <_printf_common+0x8c>
8000f40c:	00d40733          	add	a4,s0,a3
8000f410:	03000613          	li	a2,48
8000f414:	04c701a3          	sb	a2,67(a4)
8000f418:	04544703          	lbu	a4,69(s0)
8000f41c:	00168793          	addi	a5,a3,1
8000f420:	00f407b3          	add	a5,s0,a5
8000f424:	00268693          	addi	a3,a3,2
8000f428:	04e781a3          	sb	a4,67(a5)
8000f42c:	f25ff06f          	j	8000f350 <_printf_common+0xb0>
8000f430:	00100693          	li	a3,1
8000f434:	00040613          	mv	a2,s0
8000f438:	000a0593          	mv	a1,s4
8000f43c:	00098513          	mv	a0,s3
8000f440:	000a80e7          	jalr	s5
8000f444:	f96508e3          	beq	a0,s6,8000f3d4 <_printf_common+0x134>
8000f448:	00190913          	addi	s2,s2,1
8000f44c:	f65ff06f          	j	8000f3b0 <_printf_common+0x110>

Disassembly of section .text._printf_i:

8000f450 <_printf_i>:
8000f450:	fc010113          	addi	sp,sp,-64
8000f454:	02812c23          	sw	s0,56(sp)
8000f458:	03312623          	sw	s3,44(sp)
8000f45c:	03512223          	sw	s5,36(sp)
8000f460:	03612023          	sw	s6,32(sp)
8000f464:	01712e23          	sw	s7,28(sp)
8000f468:	02112e23          	sw	ra,60(sp)
8000f46c:	02912a23          	sw	s1,52(sp)
8000f470:	03212823          	sw	s2,48(sp)
8000f474:	03412423          	sw	s4,40(sp)
8000f478:	01812c23          	sw	s8,24(sp)
8000f47c:	0185c783          	lbu	a5,24(a1)
8000f480:	00068b93          	mv	s7,a3
8000f484:	06e00693          	li	a3,110
8000f488:	00050a93          	mv	s5,a0
8000f48c:	00058413          	mv	s0,a1
8000f490:	00060b13          	mv	s6,a2
8000f494:	04358993          	addi	s3,a1,67
8000f498:	28d78c63          	beq	a5,a3,8000f730 <_printf_i+0x2e0>
8000f49c:	06f6e863          	bltu	a3,a5,8000f50c <_printf_i+0xbc>
8000f4a0:	06300693          	li	a3,99
8000f4a4:	0ad78c63          	beq	a5,a3,8000f55c <_printf_i+0x10c>
8000f4a8:	00f6ec63          	bltu	a3,a5,8000f4c0 <_printf_i+0x70>
8000f4ac:	2c078063          	beqz	a5,8000f76c <_printf_i+0x31c>
8000f4b0:	05800693          	li	a3,88
8000f4b4:	12d78863          	beq	a5,a3,8000f5e4 <_printf_i+0x194>
8000f4b8:	04240c13          	addi	s8,s0,66
8000f4bc:	0b40006f          	j	8000f570 <_printf_i+0x120>
8000f4c0:	06400693          	li	a3,100
8000f4c4:	00d78663          	beq	a5,a3,8000f4d0 <_printf_i+0x80>
8000f4c8:	06900693          	li	a3,105
8000f4cc:	fed796e3          	bne	a5,a3,8000f4b8 <_printf_i+0x68>
8000f4d0:	00042783          	lw	a5,0(s0)
8000f4d4:	00072603          	lw	a2,0(a4)
8000f4d8:	0807f593          	andi	a1,a5,128
8000f4dc:	00460693          	addi	a3,a2,4
8000f4e0:	08058e63          	beqz	a1,8000f57c <_printf_i+0x12c>
8000f4e4:	00062483          	lw	s1,0(a2)
8000f4e8:	00d72023          	sw	a3,0(a4)
8000f4ec:	0004d863          	bgez	s1,8000f4fc <_printf_i+0xac>
8000f4f0:	02d00793          	li	a5,45
8000f4f4:	409004b3          	neg	s1,s1
8000f4f8:	04f401a3          	sb	a5,67(s0)
8000f4fc:	ffff4a17          	auipc	s4,0xffff4
8000f500:	984a0a13          	addi	s4,s4,-1660 # 80002e80 <__sf_fake_stdout+0x34>
8000f504:	00a00913          	li	s2,10
8000f508:	12c0006f          	j	8000f634 <_printf_i+0x1e4>
8000f50c:	07300693          	li	a3,115
8000f510:	26d78463          	beq	a5,a3,8000f778 <_printf_i+0x328>
8000f514:	02f6e263          	bltu	a3,a5,8000f538 <_printf_i+0xe8>
8000f518:	06f00693          	li	a3,111
8000f51c:	06d78e63          	beq	a5,a3,8000f598 <_printf_i+0x148>
8000f520:	07000693          	li	a3,112
8000f524:	f8d79ae3          	bne	a5,a3,8000f4b8 <_printf_i+0x68>
8000f528:	0005a783          	lw	a5,0(a1)
8000f52c:	0207e793          	ori	a5,a5,32
8000f530:	00f5a023          	sw	a5,0(a1)
8000f534:	0140006f          	j	8000f548 <_printf_i+0xf8>
8000f538:	07500693          	li	a3,117
8000f53c:	04d78e63          	beq	a5,a3,8000f598 <_printf_i+0x148>
8000f540:	07800693          	li	a3,120
8000f544:	f6d79ae3          	bne	a5,a3,8000f4b8 <_printf_i+0x68>
8000f548:	07800793          	li	a5,120
8000f54c:	04f402a3          	sb	a5,69(s0)
8000f550:	ffff4a17          	auipc	s4,0xffff4
8000f554:	944a0a13          	addi	s4,s4,-1724 # 80002e94 <__sf_fake_stdout+0x48>
8000f558:	0980006f          	j	8000f5f0 <_printf_i+0x1a0>
8000f55c:	00072783          	lw	a5,0(a4)
8000f560:	04258c13          	addi	s8,a1,66
8000f564:	00478693          	addi	a3,a5,4
8000f568:	0007a783          	lw	a5,0(a5)
8000f56c:	00d72023          	sw	a3,0(a4)
8000f570:	04f40123          	sb	a5,66(s0)
8000f574:	00100793          	li	a5,1
8000f578:	2300006f          	j	8000f7a8 <_printf_i+0x358>
8000f57c:	00062483          	lw	s1,0(a2)
8000f580:	0407f793          	andi	a5,a5,64
8000f584:	00d72023          	sw	a3,0(a4)
8000f588:	f60782e3          	beqz	a5,8000f4ec <_printf_i+0x9c>
8000f58c:	01049493          	slli	s1,s1,0x10
8000f590:	4104d493          	srai	s1,s1,0x10
8000f594:	f59ff06f          	j	8000f4ec <_printf_i+0x9c>
8000f598:	00042603          	lw	a2,0(s0)
8000f59c:	00072683          	lw	a3,0(a4)
8000f5a0:	08067513          	andi	a0,a2,128
8000f5a4:	00468593          	addi	a1,a3,4
8000f5a8:	00050863          	beqz	a0,8000f5b8 <_printf_i+0x168>
8000f5ac:	00b72023          	sw	a1,0(a4)
8000f5b0:	0006a483          	lw	s1,0(a3)
8000f5b4:	0140006f          	j	8000f5c8 <_printf_i+0x178>
8000f5b8:	04067613          	andi	a2,a2,64
8000f5bc:	00b72023          	sw	a1,0(a4)
8000f5c0:	fe0608e3          	beqz	a2,8000f5b0 <_printf_i+0x160>
8000f5c4:	0006d483          	lhu	s1,0(a3)
8000f5c8:	06f00713          	li	a4,111
8000f5cc:	ffff4a17          	auipc	s4,0xffff4
8000f5d0:	8b4a0a13          	addi	s4,s4,-1868 # 80002e80 <__sf_fake_stdout+0x34>
8000f5d4:	00a00913          	li	s2,10
8000f5d8:	04e79c63          	bne	a5,a4,8000f630 <_printf_i+0x1e0>
8000f5dc:	00800913          	li	s2,8
8000f5e0:	0500006f          	j	8000f630 <_printf_i+0x1e0>
8000f5e4:	04f582a3          	sb	a5,69(a1)
8000f5e8:	ffff4a17          	auipc	s4,0xffff4
8000f5ec:	898a0a13          	addi	s4,s4,-1896 # 80002e80 <__sf_fake_stdout+0x34>
8000f5f0:	00042783          	lw	a5,0(s0)
8000f5f4:	00072683          	lw	a3,0(a4)
8000f5f8:	0807f613          	andi	a2,a5,128
8000f5fc:	0006a483          	lw	s1,0(a3)
8000f600:	00468693          	addi	a3,a3,4
8000f604:	10060663          	beqz	a2,8000f710 <_printf_i+0x2c0>
8000f608:	00d72023          	sw	a3,0(a4)
8000f60c:	0017f713          	andi	a4,a5,1
8000f610:	00070663          	beqz	a4,8000f61c <_printf_i+0x1cc>
8000f614:	0207e793          	ori	a5,a5,32
8000f618:	00f42023          	sw	a5,0(s0)
8000f61c:	01000913          	li	s2,16
8000f620:	00049863          	bnez	s1,8000f630 <_printf_i+0x1e0>
8000f624:	00042783          	lw	a5,0(s0)
8000f628:	fdf7f793          	andi	a5,a5,-33
8000f62c:	00f42023          	sw	a5,0(s0)
8000f630:	040401a3          	sb	zero,67(s0)
8000f634:	00442783          	lw	a5,4(s0)
8000f638:	00f42423          	sw	a5,8(s0)
8000f63c:	0007c863          	bltz	a5,8000f64c <_printf_i+0x1fc>
8000f640:	00042703          	lw	a4,0(s0)
8000f644:	ffb77713          	andi	a4,a4,-5
8000f648:	00e42023          	sw	a4,0(s0)
8000f64c:	00049663          	bnez	s1,8000f658 <_printf_i+0x208>
8000f650:	00098c13          	mv	s8,s3
8000f654:	02078a63          	beqz	a5,8000f688 <_printf_i+0x238>
8000f658:	00098c13          	mv	s8,s3
8000f65c:	00090593          	mv	a1,s2
8000f660:	00048513          	mv	a0,s1
8000f664:	ca1fd0ef          	jal	ra,8000d304 <__umodsi3>
8000f668:	00aa0533          	add	a0,s4,a0
8000f66c:	00054783          	lbu	a5,0(a0)
8000f670:	fffc0c13          	addi	s8,s8,-1
8000f674:	00090593          	mv	a1,s2
8000f678:	00fc0023          	sb	a5,0(s8)
8000f67c:	00048513          	mv	a0,s1
8000f680:	c3dfd0ef          	jal	ra,8000d2bc <__udivsi3>
8000f684:	0b24f263          	bgeu	s1,s2,8000f728 <_printf_i+0x2d8>
8000f688:	00800793          	li	a5,8
8000f68c:	02f91463          	bne	s2,a5,8000f6b4 <_printf_i+0x264>
8000f690:	00042783          	lw	a5,0(s0)
8000f694:	0017f793          	andi	a5,a5,1
8000f698:	00078e63          	beqz	a5,8000f6b4 <_printf_i+0x264>
8000f69c:	00442703          	lw	a4,4(s0)
8000f6a0:	01042783          	lw	a5,16(s0)
8000f6a4:	00e7c863          	blt	a5,a4,8000f6b4 <_printf_i+0x264>
8000f6a8:	03000793          	li	a5,48
8000f6ac:	fefc0fa3          	sb	a5,-1(s8)
8000f6b0:	fffc0c13          	addi	s8,s8,-1
8000f6b4:	418989b3          	sub	s3,s3,s8
8000f6b8:	01342823          	sw	s3,16(s0)
8000f6bc:	000b8713          	mv	a4,s7
8000f6c0:	000b0693          	mv	a3,s6
8000f6c4:	00c10613          	addi	a2,sp,12
8000f6c8:	00040593          	mv	a1,s0
8000f6cc:	000a8513          	mv	a0,s5
8000f6d0:	bd1ff0ef          	jal	ra,8000f2a0 <_printf_common>
8000f6d4:	fff00493          	li	s1,-1
8000f6d8:	0c951e63          	bne	a0,s1,8000f7b4 <_printf_i+0x364>
8000f6dc:	fff00513          	li	a0,-1
8000f6e0:	03c12083          	lw	ra,60(sp)
8000f6e4:	03812403          	lw	s0,56(sp)
8000f6e8:	03412483          	lw	s1,52(sp)
8000f6ec:	03012903          	lw	s2,48(sp)
8000f6f0:	02c12983          	lw	s3,44(sp)
8000f6f4:	02812a03          	lw	s4,40(sp)
8000f6f8:	02412a83          	lw	s5,36(sp)
8000f6fc:	02012b03          	lw	s6,32(sp)
8000f700:	01c12b83          	lw	s7,28(sp)
8000f704:	01812c03          	lw	s8,24(sp)
8000f708:	04010113          	addi	sp,sp,64
8000f70c:	00008067          	ret
8000f710:	0407f613          	andi	a2,a5,64
8000f714:	00d72023          	sw	a3,0(a4)
8000f718:	ee060ae3          	beqz	a2,8000f60c <_printf_i+0x1bc>
8000f71c:	01049493          	slli	s1,s1,0x10
8000f720:	0104d493          	srli	s1,s1,0x10
8000f724:	ee9ff06f          	j	8000f60c <_printf_i+0x1bc>
8000f728:	00050493          	mv	s1,a0
8000f72c:	f31ff06f          	j	8000f65c <_printf_i+0x20c>
8000f730:	0005a683          	lw	a3,0(a1)
8000f734:	00072783          	lw	a5,0(a4)
8000f738:	0145a603          	lw	a2,20(a1)
8000f73c:	0806f513          	andi	a0,a3,128
8000f740:	00478593          	addi	a1,a5,4
8000f744:	00050a63          	beqz	a0,8000f758 <_printf_i+0x308>
8000f748:	00b72023          	sw	a1,0(a4)
8000f74c:	0007a783          	lw	a5,0(a5)
8000f750:	00c7a023          	sw	a2,0(a5)
8000f754:	0180006f          	j	8000f76c <_printf_i+0x31c>
8000f758:	00b72023          	sw	a1,0(a4)
8000f75c:	0406f693          	andi	a3,a3,64
8000f760:	0007a783          	lw	a5,0(a5)
8000f764:	fe0686e3          	beqz	a3,8000f750 <_printf_i+0x300>
8000f768:	00c79023          	sh	a2,0(a5)
8000f76c:	00042823          	sw	zero,16(s0)
8000f770:	00098c13          	mv	s8,s3
8000f774:	f49ff06f          	j	8000f6bc <_printf_i+0x26c>
8000f778:	00072783          	lw	a5,0(a4)
8000f77c:	0045a603          	lw	a2,4(a1)
8000f780:	00000593          	li	a1,0
8000f784:	00478693          	addi	a3,a5,4
8000f788:	00d72023          	sw	a3,0(a4)
8000f78c:	0007ac03          	lw	s8,0(a5)
8000f790:	000c0513          	mv	a0,s8
8000f794:	010010ef          	jal	ra,800107a4 <memchr>
8000f798:	00050663          	beqz	a0,8000f7a4 <_printf_i+0x354>
8000f79c:	41850533          	sub	a0,a0,s8
8000f7a0:	00a42223          	sw	a0,4(s0)
8000f7a4:	00442783          	lw	a5,4(s0)
8000f7a8:	00f42823          	sw	a5,16(s0)
8000f7ac:	040401a3          	sb	zero,67(s0)
8000f7b0:	f0dff06f          	j	8000f6bc <_printf_i+0x26c>
8000f7b4:	01042683          	lw	a3,16(s0)
8000f7b8:	000c0613          	mv	a2,s8
8000f7bc:	000b0593          	mv	a1,s6
8000f7c0:	000a8513          	mv	a0,s5
8000f7c4:	000b80e7          	jalr	s7
8000f7c8:	f0950ae3          	beq	a0,s1,8000f6dc <_printf_i+0x28c>
8000f7cc:	00042783          	lw	a5,0(s0)
8000f7d0:	0027f793          	andi	a5,a5,2
8000f7d4:	04079463          	bnez	a5,8000f81c <_printf_i+0x3cc>
8000f7d8:	00c12783          	lw	a5,12(sp)
8000f7dc:	00c42503          	lw	a0,12(s0)
8000f7e0:	f0f550e3          	bge	a0,a5,8000f6e0 <_printf_i+0x290>
8000f7e4:	00078513          	mv	a0,a5
8000f7e8:	ef9ff06f          	j	8000f6e0 <_printf_i+0x290>
8000f7ec:	00100693          	li	a3,1
8000f7f0:	00090613          	mv	a2,s2
8000f7f4:	000b0593          	mv	a1,s6
8000f7f8:	000a8513          	mv	a0,s5
8000f7fc:	000b80e7          	jalr	s7
8000f800:	ed350ee3          	beq	a0,s3,8000f6dc <_printf_i+0x28c>
8000f804:	00148493          	addi	s1,s1,1
8000f808:	00c42783          	lw	a5,12(s0)
8000f80c:	00c12703          	lw	a4,12(sp)
8000f810:	40e787b3          	sub	a5,a5,a4
8000f814:	fcf4cce3          	blt	s1,a5,8000f7ec <_printf_i+0x39c>
8000f818:	fc1ff06f          	j	8000f7d8 <_printf_i+0x388>
8000f81c:	00000493          	li	s1,0
8000f820:	01940913          	addi	s2,s0,25
8000f824:	fff00993          	li	s3,-1
8000f828:	fe1ff06f          	j	8000f808 <_printf_i+0x3b8>

Disassembly of section .text.__sfputc_r:

8000f82c <__sfputc_r>:
8000f82c:	00862783          	lw	a5,8(a2)
8000f830:	fff78793          	addi	a5,a5,-1
8000f834:	00f62423          	sw	a5,8(a2)
8000f838:	0007dc63          	bgez	a5,8000f850 <__sfputc_r+0x24>
8000f83c:	01862703          	lw	a4,24(a2)
8000f840:	00e7c663          	blt	a5,a4,8000f84c <__sfputc_r+0x20>
8000f844:	00a00793          	li	a5,10
8000f848:	00f59463          	bne	a1,a5,8000f850 <__sfputc_r+0x24>
8000f84c:	6b40006f          	j	8000ff00 <__swbuf_r>
8000f850:	00062783          	lw	a5,0(a2)
8000f854:	00058513          	mv	a0,a1
8000f858:	00178713          	addi	a4,a5,1
8000f85c:	00e62023          	sw	a4,0(a2)
8000f860:	00b78023          	sb	a1,0(a5)
8000f864:	00008067          	ret

Disassembly of section .text.__sfputs_r:

8000f868 <__sfputs_r>:
8000f868:	fe010113          	addi	sp,sp,-32
8000f86c:	00812c23          	sw	s0,24(sp)
8000f870:	00912a23          	sw	s1,20(sp)
8000f874:	01212823          	sw	s2,16(sp)
8000f878:	01312623          	sw	s3,12(sp)
8000f87c:	01412423          	sw	s4,8(sp)
8000f880:	00112e23          	sw	ra,28(sp)
8000f884:	00050913          	mv	s2,a0
8000f888:	00058993          	mv	s3,a1
8000f88c:	00060413          	mv	s0,a2
8000f890:	00d604b3          	add	s1,a2,a3
8000f894:	fff00a13          	li	s4,-1
8000f898:	00941663          	bne	s0,s1,8000f8a4 <__sfputs_r+0x3c>
8000f89c:	00000513          	li	a0,0
8000f8a0:	01c0006f          	j	8000f8bc <__sfputs_r+0x54>
8000f8a4:	00044583          	lbu	a1,0(s0)
8000f8a8:	00098613          	mv	a2,s3
8000f8ac:	00090513          	mv	a0,s2
8000f8b0:	f7dff0ef          	jal	ra,8000f82c <__sfputc_r>
8000f8b4:	00140413          	addi	s0,s0,1
8000f8b8:	ff4510e3          	bne	a0,s4,8000f898 <__sfputs_r+0x30>
8000f8bc:	01c12083          	lw	ra,28(sp)
8000f8c0:	01812403          	lw	s0,24(sp)
8000f8c4:	01412483          	lw	s1,20(sp)
8000f8c8:	01012903          	lw	s2,16(sp)
8000f8cc:	00c12983          	lw	s3,12(sp)
8000f8d0:	00812a03          	lw	s4,8(sp)
8000f8d4:	02010113          	addi	sp,sp,32
8000f8d8:	00008067          	ret

Disassembly of section .text.__sprint_r:

8000f8dc <__sprint_r>:
8000f8dc:	00862703          	lw	a4,8(a2)
8000f8e0:	ff010113          	addi	sp,sp,-16
8000f8e4:	00812423          	sw	s0,8(sp)
8000f8e8:	00112623          	sw	ra,12(sp)
8000f8ec:	00060413          	mv	s0,a2
8000f8f0:	00071e63          	bnez	a4,8000f90c <__sprint_r+0x30>
8000f8f4:	00062223          	sw	zero,4(a2)
8000f8f8:	00000513          	li	a0,0
8000f8fc:	00c12083          	lw	ra,12(sp)
8000f900:	00812403          	lw	s0,8(sp)
8000f904:	01010113          	addi	sp,sp,16
8000f908:	00008067          	ret
8000f90c:	0bd000ef          	jal	ra,800101c8 <__sfvwrite_r>
8000f910:	00042423          	sw	zero,8(s0)
8000f914:	00042223          	sw	zero,4(s0)
8000f918:	fe5ff06f          	j	8000f8fc <__sprint_r+0x20>

Disassembly of section .text._vfprintf_r:

8000f91c <_vfiprintf_r>:
8000f91c:	f6010113          	addi	sp,sp,-160
8000f920:	08812c23          	sw	s0,152(sp)
8000f924:	08912a23          	sw	s1,148(sp)
8000f928:	09212823          	sw	s2,144(sp)
8000f92c:	09312623          	sw	s3,140(sp)
8000f930:	08112e23          	sw	ra,156(sp)
8000f934:	09412423          	sw	s4,136(sp)
8000f938:	09512223          	sw	s5,132(sp)
8000f93c:	09612023          	sw	s6,128(sp)
8000f940:	07712e23          	sw	s7,124(sp)
8000f944:	07812c23          	sw	s8,120(sp)
8000f948:	07912a23          	sw	s9,116(sp)
8000f94c:	00050993          	mv	s3,a0
8000f950:	00058493          	mv	s1,a1
8000f954:	00060913          	mv	s2,a2
8000f958:	00068413          	mv	s0,a3
8000f95c:	00050863          	beqz	a0,8000f96c <_vfiprintf_r+0x50>
8000f960:	01852783          	lw	a5,24(a0)
8000f964:	00079463          	bnez	a5,8000f96c <_vfiprintf_r+0x50>
8000f968:	b04fe0ef          	jal	ra,8000dc6c <__sinit>
8000f96c:	ffff3797          	auipc	a5,0xffff3
8000f970:	4c078793          	addi	a5,a5,1216 # 80002e2c <__sf_fake_stdin>
8000f974:	12f49263          	bne	s1,a5,8000fa98 <_vfiprintf_r+0x17c>
8000f978:	0049a483          	lw	s1,4(s3)
8000f97c:	00c4d783          	lhu	a5,12(s1)
8000f980:	0087f793          	andi	a5,a5,8
8000f984:	12078e63          	beqz	a5,8000fac0 <_vfiprintf_r+0x1a4>
8000f988:	0104a783          	lw	a5,16(s1)
8000f98c:	12078a63          	beqz	a5,8000fac0 <_vfiprintf_r+0x1a4>
8000f990:	02000793          	li	a5,32
8000f994:	02f104a3          	sb	a5,41(sp)
8000f998:	03000793          	li	a5,48
8000f99c:	02012223          	sw	zero,36(sp)
8000f9a0:	02f10523          	sb	a5,42(sp)
8000f9a4:	00812623          	sw	s0,12(sp)
8000f9a8:	02500b13          	li	s6,37
8000f9ac:	ffff3a97          	auipc	s5,0xffff3
8000f9b0:	4c0a8a93          	addi	s5,s5,1216 # 80002e6c <__sf_fake_stdout+0x20>
8000f9b4:	00100b93          	li	s7,1
8000f9b8:	7fff0c17          	auipc	s8,0x7fff0
8000f9bc:	648c0c13          	addi	s8,s8,1608 # 0 <_heap_end+0x7ffee000>
8000f9c0:	00090413          	mv	s0,s2
8000f9c4:	00044783          	lbu	a5,0(s0)
8000f9c8:	00078463          	beqz	a5,8000f9d0 <_vfiprintf_r+0xb4>
8000f9cc:	13679e63          	bne	a5,s6,8000fb08 <_vfiprintf_r+0x1ec>
8000f9d0:	41240cb3          	sub	s9,s0,s2
8000f9d4:	020c8663          	beqz	s9,8000fa00 <_vfiprintf_r+0xe4>
8000f9d8:	000c8693          	mv	a3,s9
8000f9dc:	00090613          	mv	a2,s2
8000f9e0:	00048593          	mv	a1,s1
8000f9e4:	00098513          	mv	a0,s3
8000f9e8:	e81ff0ef          	jal	ra,8000f868 <__sfputs_r>
8000f9ec:	fff00793          	li	a5,-1
8000f9f0:	2cf50663          	beq	a0,a5,8000fcbc <_vfiprintf_r+0x3a0>
8000f9f4:	02412683          	lw	a3,36(sp)
8000f9f8:	019686b3          	add	a3,a3,s9
8000f9fc:	02d12223          	sw	a3,36(sp)
8000fa00:	00044783          	lbu	a5,0(s0)
8000fa04:	2a078c63          	beqz	a5,8000fcbc <_vfiprintf_r+0x3a0>
8000fa08:	fff00793          	li	a5,-1
8000fa0c:	00140913          	addi	s2,s0,1
8000fa10:	00012823          	sw	zero,16(sp)
8000fa14:	00012e23          	sw	zero,28(sp)
8000fa18:	00f12a23          	sw	a5,20(sp)
8000fa1c:	00012c23          	sw	zero,24(sp)
8000fa20:	040109a3          	sb	zero,83(sp)
8000fa24:	06012423          	sw	zero,104(sp)
8000fa28:	00094583          	lbu	a1,0(s2)
8000fa2c:	00500613          	li	a2,5
8000fa30:	000a8513          	mv	a0,s5
8000fa34:	571000ef          	jal	ra,800107a4 <memchr>
8000fa38:	00190413          	addi	s0,s2,1
8000fa3c:	01012783          	lw	a5,16(sp)
8000fa40:	0c051863          	bnez	a0,8000fb10 <_vfiprintf_r+0x1f4>
8000fa44:	0107f713          	andi	a4,a5,16
8000fa48:	00070663          	beqz	a4,8000fa54 <_vfiprintf_r+0x138>
8000fa4c:	02000713          	li	a4,32
8000fa50:	04e109a3          	sb	a4,83(sp)
8000fa54:	0087f713          	andi	a4,a5,8
8000fa58:	00070663          	beqz	a4,8000fa64 <_vfiprintf_r+0x148>
8000fa5c:	02b00713          	li	a4,43
8000fa60:	04e109a3          	sb	a4,83(sp)
8000fa64:	00094683          	lbu	a3,0(s2)
8000fa68:	02a00713          	li	a4,42
8000fa6c:	0ae68e63          	beq	a3,a4,8000fb28 <_vfiprintf_r+0x20c>
8000fa70:	01c12703          	lw	a4,28(sp)
8000fa74:	00090413          	mv	s0,s2
8000fa78:	00000793          	li	a5,0
8000fa7c:	00900613          	li	a2,9
8000fa80:	00044683          	lbu	a3,0(s0)
8000fa84:	00140593          	addi	a1,s0,1
8000fa88:	fd068693          	addi	a3,a3,-48
8000fa8c:	18d67263          	bgeu	a2,a3,8000fc10 <_vfiprintf_r+0x2f4>
8000fa90:	0a079663          	bnez	a5,8000fb3c <_vfiprintf_r+0x220>
8000fa94:	0c00006f          	j	8000fb54 <_vfiprintf_r+0x238>
8000fa98:	ffff3797          	auipc	a5,0xffff3
8000fa9c:	3b478793          	addi	a5,a5,948 # 80002e4c <__sf_fake_stdout>
8000faa0:	00f49663          	bne	s1,a5,8000faac <_vfiprintf_r+0x190>
8000faa4:	0089a483          	lw	s1,8(s3)
8000faa8:	ed5ff06f          	j	8000f97c <_vfiprintf_r+0x60>
8000faac:	ffff3797          	auipc	a5,0xffff3
8000fab0:	36078793          	addi	a5,a5,864 # 80002e0c <__sf_fake_stderr>
8000fab4:	ecf494e3          	bne	s1,a5,8000f97c <_vfiprintf_r+0x60>
8000fab8:	00c9a483          	lw	s1,12(s3)
8000fabc:	ec1ff06f          	j	8000f97c <_vfiprintf_r+0x60>
8000fac0:	00048593          	mv	a1,s1
8000fac4:	00098513          	mv	a0,s3
8000fac8:	584000ef          	jal	ra,8001004c <__swsetup_r>
8000facc:	ec0502e3          	beqz	a0,8000f990 <_vfiprintf_r+0x74>
8000fad0:	fff00513          	li	a0,-1
8000fad4:	09c12083          	lw	ra,156(sp)
8000fad8:	09812403          	lw	s0,152(sp)
8000fadc:	09412483          	lw	s1,148(sp)
8000fae0:	09012903          	lw	s2,144(sp)
8000fae4:	08c12983          	lw	s3,140(sp)
8000fae8:	08812a03          	lw	s4,136(sp)
8000faec:	08412a83          	lw	s5,132(sp)
8000faf0:	08012b03          	lw	s6,128(sp)
8000faf4:	07c12b83          	lw	s7,124(sp)
8000faf8:	07812c03          	lw	s8,120(sp)
8000fafc:	07412c83          	lw	s9,116(sp)
8000fb00:	0a010113          	addi	sp,sp,160
8000fb04:	00008067          	ret
8000fb08:	00140413          	addi	s0,s0,1
8000fb0c:	eb9ff06f          	j	8000f9c4 <_vfiprintf_r+0xa8>
8000fb10:	41550533          	sub	a0,a0,s5
8000fb14:	00ab9533          	sll	a0,s7,a0
8000fb18:	00a7e7b3          	or	a5,a5,a0
8000fb1c:	00f12823          	sw	a5,16(sp)
8000fb20:	00040913          	mv	s2,s0
8000fb24:	f05ff06f          	j	8000fa28 <_vfiprintf_r+0x10c>
8000fb28:	00c12703          	lw	a4,12(sp)
8000fb2c:	00470693          	addi	a3,a4,4
8000fb30:	00072703          	lw	a4,0(a4)
8000fb34:	00d12623          	sw	a3,12(sp)
8000fb38:	00074663          	bltz	a4,8000fb44 <_vfiprintf_r+0x228>
8000fb3c:	00e12e23          	sw	a4,28(sp)
8000fb40:	0140006f          	j	8000fb54 <_vfiprintf_r+0x238>
8000fb44:	40e00733          	neg	a4,a4
8000fb48:	0027e793          	ori	a5,a5,2
8000fb4c:	00e12e23          	sw	a4,28(sp)
8000fb50:	00f12823          	sw	a5,16(sp)
8000fb54:	00044703          	lbu	a4,0(s0)
8000fb58:	02e00793          	li	a5,46
8000fb5c:	02f71663          	bne	a4,a5,8000fb88 <_vfiprintf_r+0x26c>
8000fb60:	00144703          	lbu	a4,1(s0)
8000fb64:	02a00793          	li	a5,42
8000fb68:	0cf71663          	bne	a4,a5,8000fc34 <_vfiprintf_r+0x318>
8000fb6c:	00c12783          	lw	a5,12(sp)
8000fb70:	00240413          	addi	s0,s0,2
8000fb74:	00478713          	addi	a4,a5,4
8000fb78:	0007a783          	lw	a5,0(a5)
8000fb7c:	00e12623          	sw	a4,12(sp)
8000fb80:	0a07c663          	bltz	a5,8000fc2c <_vfiprintf_r+0x310>
8000fb84:	00f12a23          	sw	a5,20(sp)
8000fb88:	00044583          	lbu	a1,0(s0)
8000fb8c:	00300613          	li	a2,3
8000fb90:	ffff3517          	auipc	a0,0xffff3
8000fb94:	2e450513          	addi	a0,a0,740 # 80002e74 <__sf_fake_stdout+0x28>
8000fb98:	40d000ef          	jal	ra,800107a4 <memchr>
8000fb9c:	02050463          	beqz	a0,8000fbc4 <_vfiprintf_r+0x2a8>
8000fba0:	ffff3797          	auipc	a5,0xffff3
8000fba4:	2d478793          	addi	a5,a5,724 # 80002e74 <__sf_fake_stdout+0x28>
8000fba8:	40f50533          	sub	a0,a0,a5
8000fbac:	04000793          	li	a5,64
8000fbb0:	00a797b3          	sll	a5,a5,a0
8000fbb4:	01012503          	lw	a0,16(sp)
8000fbb8:	00140413          	addi	s0,s0,1
8000fbbc:	00f56533          	or	a0,a0,a5
8000fbc0:	00a12823          	sw	a0,16(sp)
8000fbc4:	00044583          	lbu	a1,0(s0)
8000fbc8:	00600613          	li	a2,6
8000fbcc:	ffff3517          	auipc	a0,0xffff3
8000fbd0:	2ac50513          	addi	a0,a0,684 # 80002e78 <__sf_fake_stdout+0x2c>
8000fbd4:	00140913          	addi	s2,s0,1
8000fbd8:	02b10423          	sb	a1,40(sp)
8000fbdc:	3c9000ef          	jal	ra,800107a4 <memchr>
8000fbe0:	0e050863          	beqz	a0,8000fcd0 <_vfiprintf_r+0x3b4>
8000fbe4:	0a0c1663          	bnez	s8,8000fc90 <_vfiprintf_r+0x374>
8000fbe8:	01012703          	lw	a4,16(sp)
8000fbec:	00c12783          	lw	a5,12(sp)
8000fbf0:	10077713          	andi	a4,a4,256
8000fbf4:	08070663          	beqz	a4,8000fc80 <_vfiprintf_r+0x364>
8000fbf8:	00478793          	addi	a5,a5,4
8000fbfc:	00f12623          	sw	a5,12(sp)
8000fc00:	02412783          	lw	a5,36(sp)
8000fc04:	014787b3          	add	a5,a5,s4
8000fc08:	02f12223          	sw	a5,36(sp)
8000fc0c:	db5ff06f          	j	8000f9c0 <_vfiprintf_r+0xa4>
8000fc10:	00271793          	slli	a5,a4,0x2
8000fc14:	00e787b3          	add	a5,a5,a4
8000fc18:	00179793          	slli	a5,a5,0x1
8000fc1c:	00d78733          	add	a4,a5,a3
8000fc20:	00058413          	mv	s0,a1
8000fc24:	00100793          	li	a5,1
8000fc28:	e59ff06f          	j	8000fa80 <_vfiprintf_r+0x164>
8000fc2c:	fff00793          	li	a5,-1
8000fc30:	f55ff06f          	j	8000fb84 <_vfiprintf_r+0x268>
8000fc34:	00140413          	addi	s0,s0,1
8000fc38:	00012a23          	sw	zero,20(sp)
8000fc3c:	00000793          	li	a5,0
8000fc40:	00000713          	li	a4,0
8000fc44:	00900613          	li	a2,9
8000fc48:	00044683          	lbu	a3,0(s0)
8000fc4c:	00140593          	addi	a1,s0,1
8000fc50:	fd068693          	addi	a3,a3,-48
8000fc54:	00d67863          	bgeu	a2,a3,8000fc64 <_vfiprintf_r+0x348>
8000fc58:	f20788e3          	beqz	a5,8000fb88 <_vfiprintf_r+0x26c>
8000fc5c:	00e12a23          	sw	a4,20(sp)
8000fc60:	f29ff06f          	j	8000fb88 <_vfiprintf_r+0x26c>
8000fc64:	00271793          	slli	a5,a4,0x2
8000fc68:	00e787b3          	add	a5,a5,a4
8000fc6c:	00179793          	slli	a5,a5,0x1
8000fc70:	00d78733          	add	a4,a5,a3
8000fc74:	00058413          	mv	s0,a1
8000fc78:	00100793          	li	a5,1
8000fc7c:	fcdff06f          	j	8000fc48 <_vfiprintf_r+0x32c>
8000fc80:	00778793          	addi	a5,a5,7
8000fc84:	ff87f793          	andi	a5,a5,-8
8000fc88:	00878793          	addi	a5,a5,8
8000fc8c:	f71ff06f          	j	8000fbfc <_vfiprintf_r+0x2e0>
8000fc90:	00c10713          	addi	a4,sp,12
8000fc94:	00000697          	auipc	a3,0x0
8000fc98:	bd468693          	addi	a3,a3,-1068 # 8000f868 <__sfputs_r>
8000fc9c:	00048613          	mv	a2,s1
8000fca0:	01010593          	addi	a1,sp,16
8000fca4:	00098513          	mv	a0,s3
8000fca8:	00000097          	auipc	ra,0x0
8000fcac:	000000e7          	jalr	zero # 0 <_heap_size>
8000fcb0:	fff00793          	li	a5,-1
8000fcb4:	00050a13          	mv	s4,a0
8000fcb8:	f4f514e3          	bne	a0,a5,8000fc00 <_vfiprintf_r+0x2e4>
8000fcbc:	00c4d783          	lhu	a5,12(s1)
8000fcc0:	0407f793          	andi	a5,a5,64
8000fcc4:	e00796e3          	bnez	a5,8000fad0 <_vfiprintf_r+0x1b4>
8000fcc8:	02412503          	lw	a0,36(sp)
8000fccc:	e09ff06f          	j	8000fad4 <_vfiprintf_r+0x1b8>
8000fcd0:	00c10713          	addi	a4,sp,12
8000fcd4:	00000697          	auipc	a3,0x0
8000fcd8:	b9468693          	addi	a3,a3,-1132 # 8000f868 <__sfputs_r>
8000fcdc:	00048613          	mv	a2,s1
8000fce0:	01010593          	addi	a1,sp,16
8000fce4:	00098513          	mv	a0,s3
8000fce8:	f68ff0ef          	jal	ra,8000f450 <_printf_i>
8000fcec:	fc5ff06f          	j	8000fcb0 <_vfiprintf_r+0x394>

Disassembly of section .text.vfprintf:

8000fcf0 <vfiprintf>:
8000fcf0:	80c18793          	addi	a5,gp,-2036 # 80003044 <_impure_ptr>
8000fcf4:	00060693          	mv	a3,a2
8000fcf8:	00058613          	mv	a2,a1
8000fcfc:	00050593          	mv	a1,a0
8000fd00:	0007a503          	lw	a0,0(a5)
8000fd04:	c19ff06f          	j	8000f91c <_vfiprintf_r>

Disassembly of section .text._read_r:

8000fd08 <_read_r>:
8000fd08:	ff010113          	addi	sp,sp,-16
8000fd0c:	00812423          	sw	s0,8(sp)
8000fd10:	00050413          	mv	s0,a0
8000fd14:	00058513          	mv	a0,a1
8000fd18:	00060593          	mv	a1,a2
8000fd1c:	00068613          	mv	a2,a3
8000fd20:	c401a223          	sw	zero,-956(gp) # 8000347c <errno>
8000fd24:	00112623          	sw	ra,12(sp)
8000fd28:	f41f50ef          	jal	ra,80005c68 <_read>
8000fd2c:	fff00793          	li	a5,-1
8000fd30:	00f51a63          	bne	a0,a5,8000fd44 <_read_r+0x3c>
8000fd34:	c4418793          	addi	a5,gp,-956 # 8000347c <errno>
8000fd38:	0007a783          	lw	a5,0(a5)
8000fd3c:	00078463          	beqz	a5,8000fd44 <_read_r+0x3c>
8000fd40:	00f42023          	sw	a5,0(s0)
8000fd44:	00c12083          	lw	ra,12(sp)
8000fd48:	00812403          	lw	s0,8(sp)
8000fd4c:	01010113          	addi	sp,sp,16
8000fd50:	00008067          	ret

Disassembly of section .text.cleanup_glue:

8000fd54 <cleanup_glue>:
8000fd54:	ff010113          	addi	sp,sp,-16
8000fd58:	00812423          	sw	s0,8(sp)
8000fd5c:	00058413          	mv	s0,a1
8000fd60:	0005a583          	lw	a1,0(a1)
8000fd64:	00912223          	sw	s1,4(sp)
8000fd68:	00112623          	sw	ra,12(sp)
8000fd6c:	00050493          	mv	s1,a0
8000fd70:	00058463          	beqz	a1,8000fd78 <cleanup_glue+0x24>
8000fd74:	fe1ff0ef          	jal	ra,8000fd54 <cleanup_glue>
8000fd78:	00040593          	mv	a1,s0
8000fd7c:	00812403          	lw	s0,8(sp)
8000fd80:	00c12083          	lw	ra,12(sp)
8000fd84:	00048513          	mv	a0,s1
8000fd88:	00412483          	lw	s1,4(sp)
8000fd8c:	01010113          	addi	sp,sp,16
8000fd90:	bdcfe06f          	j	8000e16c <_free_r>

Disassembly of section .text._reclaim_reent:

8000fd94 <_reclaim_reent>:
8000fd94:	80c18793          	addi	a5,gp,-2036 # 80003044 <_impure_ptr>
8000fd98:	0007a783          	lw	a5,0(a5)
8000fd9c:	16a78063          	beq	a5,a0,8000fefc <_reclaim_reent+0x168>
8000fda0:	02452783          	lw	a5,36(a0)
8000fda4:	fe010113          	addi	sp,sp,-32
8000fda8:	00812c23          	sw	s0,24(sp)
8000fdac:	00112e23          	sw	ra,28(sp)
8000fdb0:	00912a23          	sw	s1,20(sp)
8000fdb4:	01212823          	sw	s2,16(sp)
8000fdb8:	01312623          	sw	s3,12(sp)
8000fdbc:	00050413          	mv	s0,a0
8000fdc0:	02078463          	beqz	a5,8000fde8 <_reclaim_reent+0x54>
8000fdc4:	00c7a783          	lw	a5,12(a5)
8000fdc8:	00000493          	li	s1,0
8000fdcc:	08000913          	li	s2,128
8000fdd0:	0e079263          	bnez	a5,8000feb4 <_reclaim_reent+0x120>
8000fdd4:	02442783          	lw	a5,36(s0)
8000fdd8:	0007a583          	lw	a1,0(a5)
8000fddc:	00058663          	beqz	a1,8000fde8 <_reclaim_reent+0x54>
8000fde0:	00040513          	mv	a0,s0
8000fde4:	b88fe0ef          	jal	ra,8000e16c <_free_r>
8000fde8:	01442583          	lw	a1,20(s0)
8000fdec:	00058663          	beqz	a1,8000fdf8 <_reclaim_reent+0x64>
8000fdf0:	00040513          	mv	a0,s0
8000fdf4:	b78fe0ef          	jal	ra,8000e16c <_free_r>
8000fdf8:	02442583          	lw	a1,36(s0)
8000fdfc:	00058663          	beqz	a1,8000fe08 <_reclaim_reent+0x74>
8000fe00:	00040513          	mv	a0,s0
8000fe04:	b68fe0ef          	jal	ra,8000e16c <_free_r>
8000fe08:	03842583          	lw	a1,56(s0)
8000fe0c:	00058663          	beqz	a1,8000fe18 <_reclaim_reent+0x84>
8000fe10:	00040513          	mv	a0,s0
8000fe14:	b58fe0ef          	jal	ra,8000e16c <_free_r>
8000fe18:	03c42583          	lw	a1,60(s0)
8000fe1c:	00058663          	beqz	a1,8000fe28 <_reclaim_reent+0x94>
8000fe20:	00040513          	mv	a0,s0
8000fe24:	b48fe0ef          	jal	ra,8000e16c <_free_r>
8000fe28:	04042583          	lw	a1,64(s0)
8000fe2c:	00058663          	beqz	a1,8000fe38 <_reclaim_reent+0xa4>
8000fe30:	00040513          	mv	a0,s0
8000fe34:	b38fe0ef          	jal	ra,8000e16c <_free_r>
8000fe38:	05c42583          	lw	a1,92(s0)
8000fe3c:	00058663          	beqz	a1,8000fe48 <_reclaim_reent+0xb4>
8000fe40:	00040513          	mv	a0,s0
8000fe44:	b28fe0ef          	jal	ra,8000e16c <_free_r>
8000fe48:	05842583          	lw	a1,88(s0)
8000fe4c:	00058663          	beqz	a1,8000fe58 <_reclaim_reent+0xc4>
8000fe50:	00040513          	mv	a0,s0
8000fe54:	b18fe0ef          	jal	ra,8000e16c <_free_r>
8000fe58:	03442583          	lw	a1,52(s0)
8000fe5c:	00058663          	beqz	a1,8000fe68 <_reclaim_reent+0xd4>
8000fe60:	00040513          	mv	a0,s0
8000fe64:	b08fe0ef          	jal	ra,8000e16c <_free_r>
8000fe68:	01842783          	lw	a5,24(s0)
8000fe6c:	06078a63          	beqz	a5,8000fee0 <_reclaim_reent+0x14c>
8000fe70:	02842783          	lw	a5,40(s0)
8000fe74:	00040513          	mv	a0,s0
8000fe78:	000780e7          	jalr	a5
8000fe7c:	04842583          	lw	a1,72(s0)
8000fe80:	06058063          	beqz	a1,8000fee0 <_reclaim_reent+0x14c>
8000fe84:	00040513          	mv	a0,s0
8000fe88:	01812403          	lw	s0,24(sp)
8000fe8c:	01c12083          	lw	ra,28(sp)
8000fe90:	01412483          	lw	s1,20(sp)
8000fe94:	01012903          	lw	s2,16(sp)
8000fe98:	00c12983          	lw	s3,12(sp)
8000fe9c:	02010113          	addi	sp,sp,32
8000fea0:	eb5ff06f          	j	8000fd54 <cleanup_glue>
8000fea4:	009585b3          	add	a1,a1,s1
8000fea8:	0005a583          	lw	a1,0(a1)
8000feac:	02059063          	bnez	a1,8000fecc <_reclaim_reent+0x138>
8000feb0:	00448493          	addi	s1,s1,4
8000feb4:	02442783          	lw	a5,36(s0)
8000feb8:	00c7a583          	lw	a1,12(a5)
8000febc:	ff2494e3          	bne	s1,s2,8000fea4 <_reclaim_reent+0x110>
8000fec0:	00040513          	mv	a0,s0
8000fec4:	aa8fe0ef          	jal	ra,8000e16c <_free_r>
8000fec8:	f0dff06f          	j	8000fdd4 <_reclaim_reent+0x40>
8000fecc:	0005a983          	lw	s3,0(a1)
8000fed0:	00040513          	mv	a0,s0
8000fed4:	a98fe0ef          	jal	ra,8000e16c <_free_r>
8000fed8:	00098593          	mv	a1,s3
8000fedc:	fd1ff06f          	j	8000feac <_reclaim_reent+0x118>
8000fee0:	01c12083          	lw	ra,28(sp)
8000fee4:	01812403          	lw	s0,24(sp)
8000fee8:	01412483          	lw	s1,20(sp)
8000feec:	01012903          	lw	s2,16(sp)
8000fef0:	00c12983          	lw	s3,12(sp)
8000fef4:	02010113          	addi	sp,sp,32
8000fef8:	00008067          	ret
8000fefc:	00008067          	ret

Disassembly of section .text.__swbuf_r:

8000ff00 <__swbuf_r>:
8000ff00:	fe010113          	addi	sp,sp,-32
8000ff04:	00812c23          	sw	s0,24(sp)
8000ff08:	00912a23          	sw	s1,20(sp)
8000ff0c:	01212823          	sw	s2,16(sp)
8000ff10:	00112e23          	sw	ra,28(sp)
8000ff14:	01312623          	sw	s3,12(sp)
8000ff18:	00050493          	mv	s1,a0
8000ff1c:	00058913          	mv	s2,a1
8000ff20:	00060413          	mv	s0,a2
8000ff24:	00050863          	beqz	a0,8000ff34 <__swbuf_r+0x34>
8000ff28:	01852783          	lw	a5,24(a0)
8000ff2c:	00079463          	bnez	a5,8000ff34 <__swbuf_r+0x34>
8000ff30:	d3dfd0ef          	jal	ra,8000dc6c <__sinit>
8000ff34:	ffff3797          	auipc	a5,0xffff3
8000ff38:	ef878793          	addi	a5,a5,-264 # 80002e2c <__sf_fake_stdin>
8000ff3c:	0af41e63          	bne	s0,a5,8000fff8 <__swbuf_r+0xf8>
8000ff40:	0044a403          	lw	s0,4(s1)
8000ff44:	01842783          	lw	a5,24(s0)
8000ff48:	00f42423          	sw	a5,8(s0)
8000ff4c:	00c45783          	lhu	a5,12(s0)
8000ff50:	0087f793          	andi	a5,a5,8
8000ff54:	0c078663          	beqz	a5,80010020 <__swbuf_r+0x120>
8000ff58:	01042783          	lw	a5,16(s0)
8000ff5c:	0c078263          	beqz	a5,80010020 <__swbuf_r+0x120>
8000ff60:	01042783          	lw	a5,16(s0)
8000ff64:	00042503          	lw	a0,0(s0)
8000ff68:	0ff97993          	andi	s3,s2,255
8000ff6c:	0ff97913          	andi	s2,s2,255
8000ff70:	40f50533          	sub	a0,a0,a5
8000ff74:	01442783          	lw	a5,20(s0)
8000ff78:	00f54a63          	blt	a0,a5,8000ff8c <__swbuf_r+0x8c>
8000ff7c:	00040593          	mv	a1,s0
8000ff80:	00048513          	mv	a0,s1
8000ff84:	af9fd0ef          	jal	ra,8000da7c <_fflush_r>
8000ff88:	0a051463          	bnez	a0,80010030 <__swbuf_r+0x130>
8000ff8c:	00842783          	lw	a5,8(s0)
8000ff90:	00150513          	addi	a0,a0,1
8000ff94:	fff78793          	addi	a5,a5,-1
8000ff98:	00f42423          	sw	a5,8(s0)
8000ff9c:	00042783          	lw	a5,0(s0)
8000ffa0:	00178713          	addi	a4,a5,1
8000ffa4:	00e42023          	sw	a4,0(s0)
8000ffa8:	01378023          	sb	s3,0(a5)
8000ffac:	01442783          	lw	a5,20(s0)
8000ffb0:	00a78c63          	beq	a5,a0,8000ffc8 <__swbuf_r+0xc8>
8000ffb4:	00c45783          	lhu	a5,12(s0)
8000ffb8:	0017f793          	andi	a5,a5,1
8000ffbc:	00078e63          	beqz	a5,8000ffd8 <__swbuf_r+0xd8>
8000ffc0:	00a00793          	li	a5,10
8000ffc4:	00f91a63          	bne	s2,a5,8000ffd8 <__swbuf_r+0xd8>
8000ffc8:	00040593          	mv	a1,s0
8000ffcc:	00048513          	mv	a0,s1
8000ffd0:	aadfd0ef          	jal	ra,8000da7c <_fflush_r>
8000ffd4:	04051e63          	bnez	a0,80010030 <__swbuf_r+0x130>
8000ffd8:	01c12083          	lw	ra,28(sp)
8000ffdc:	01812403          	lw	s0,24(sp)
8000ffe0:	00090513          	mv	a0,s2
8000ffe4:	01412483          	lw	s1,20(sp)
8000ffe8:	01012903          	lw	s2,16(sp)
8000ffec:	00c12983          	lw	s3,12(sp)
8000fff0:	02010113          	addi	sp,sp,32
8000fff4:	00008067          	ret
8000fff8:	ffff3797          	auipc	a5,0xffff3
8000fffc:	e5478793          	addi	a5,a5,-428 # 80002e4c <__sf_fake_stdout>
80010000:	00f41663          	bne	s0,a5,8001000c <__swbuf_r+0x10c>
80010004:	0084a403          	lw	s0,8(s1)
80010008:	f3dff06f          	j	8000ff44 <__swbuf_r+0x44>
8001000c:	ffff3797          	auipc	a5,0xffff3
80010010:	e0078793          	addi	a5,a5,-512 # 80002e0c <__sf_fake_stderr>
80010014:	f2f418e3          	bne	s0,a5,8000ff44 <__swbuf_r+0x44>
80010018:	00c4a403          	lw	s0,12(s1)
8001001c:	f29ff06f          	j	8000ff44 <__swbuf_r+0x44>
80010020:	00040593          	mv	a1,s0
80010024:	00048513          	mv	a0,s1
80010028:	024000ef          	jal	ra,8001004c <__swsetup_r>
8001002c:	f2050ae3          	beqz	a0,8000ff60 <__swbuf_r+0x60>
80010030:	fff00913          	li	s2,-1
80010034:	fa5ff06f          	j	8000ffd8 <__swbuf_r+0xd8>

Disassembly of section .text.__swbuf:

80010038 <__swbuf>:
80010038:	80c18793          	addi	a5,gp,-2036 # 80003044 <_impure_ptr>
8001003c:	00058613          	mv	a2,a1
80010040:	00050593          	mv	a1,a0
80010044:	0007a503          	lw	a0,0(a5)
80010048:	eb9ff06f          	j	8000ff00 <__swbuf_r>

Disassembly of section .text.__swsetup_r:

8001004c <__swsetup_r>:
8001004c:	ff010113          	addi	sp,sp,-16
80010050:	80c18793          	addi	a5,gp,-2036 # 80003044 <_impure_ptr>
80010054:	00912223          	sw	s1,4(sp)
80010058:	0007a483          	lw	s1,0(a5)
8001005c:	00812423          	sw	s0,8(sp)
80010060:	01212023          	sw	s2,0(sp)
80010064:	00112623          	sw	ra,12(sp)
80010068:	00050913          	mv	s2,a0
8001006c:	00058413          	mv	s0,a1
80010070:	00048a63          	beqz	s1,80010084 <__swsetup_r+0x38>
80010074:	0184a783          	lw	a5,24(s1)
80010078:	00079663          	bnez	a5,80010084 <__swsetup_r+0x38>
8001007c:	00048513          	mv	a0,s1
80010080:	bedfd0ef          	jal	ra,8000dc6c <__sinit>
80010084:	ffff3797          	auipc	a5,0xffff3
80010088:	da878793          	addi	a5,a5,-600 # 80002e2c <__sf_fake_stdin>
8001008c:	04f41863          	bne	s0,a5,800100dc <__swsetup_r+0x90>
80010090:	0044a403          	lw	s0,4(s1)
80010094:	00c41703          	lh	a4,12(s0)
80010098:	01071793          	slli	a5,a4,0x10
8001009c:	0107d793          	srli	a5,a5,0x10
800100a0:	0087f693          	andi	a3,a5,8
800100a4:	0a069463          	bnez	a3,8001014c <__swsetup_r+0x100>
800100a8:	0107f693          	andi	a3,a5,16
800100ac:	04069c63          	bnez	a3,80010104 <__swsetup_r+0xb8>
800100b0:	00900793          	li	a5,9
800100b4:	00f92023          	sw	a5,0(s2)
800100b8:	04076713          	ori	a4,a4,64
800100bc:	00e41623          	sh	a4,12(s0)
800100c0:	fff00513          	li	a0,-1
800100c4:	00c12083          	lw	ra,12(sp)
800100c8:	00812403          	lw	s0,8(sp)
800100cc:	00412483          	lw	s1,4(sp)
800100d0:	00012903          	lw	s2,0(sp)
800100d4:	01010113          	addi	sp,sp,16
800100d8:	00008067          	ret
800100dc:	ffff3797          	auipc	a5,0xffff3
800100e0:	d7078793          	addi	a5,a5,-656 # 80002e4c <__sf_fake_stdout>
800100e4:	00f41663          	bne	s0,a5,800100f0 <__swsetup_r+0xa4>
800100e8:	0084a403          	lw	s0,8(s1)
800100ec:	fa9ff06f          	j	80010094 <__swsetup_r+0x48>
800100f0:	ffff3797          	auipc	a5,0xffff3
800100f4:	d1c78793          	addi	a5,a5,-740 # 80002e0c <__sf_fake_stderr>
800100f8:	f8f41ee3          	bne	s0,a5,80010094 <__swsetup_r+0x48>
800100fc:	00c4a403          	lw	s0,12(s1)
80010100:	f95ff06f          	j	80010094 <__swsetup_r+0x48>
80010104:	0047f793          	andi	a5,a5,4
80010108:	02078c63          	beqz	a5,80010140 <__swsetup_r+0xf4>
8001010c:	03442583          	lw	a1,52(s0)
80010110:	00058c63          	beqz	a1,80010128 <__swsetup_r+0xdc>
80010114:	04440793          	addi	a5,s0,68
80010118:	00f58663          	beq	a1,a5,80010124 <__swsetup_r+0xd8>
8001011c:	00090513          	mv	a0,s2
80010120:	84cfe0ef          	jal	ra,8000e16c <_free_r>
80010124:	02042a23          	sw	zero,52(s0)
80010128:	00c45783          	lhu	a5,12(s0)
8001012c:	00042223          	sw	zero,4(s0)
80010130:	fdb7f793          	andi	a5,a5,-37
80010134:	00f41623          	sh	a5,12(s0)
80010138:	01042783          	lw	a5,16(s0)
8001013c:	00f42023          	sw	a5,0(s0)
80010140:	00c45783          	lhu	a5,12(s0)
80010144:	0087e793          	ori	a5,a5,8
80010148:	00f41623          	sh	a5,12(s0)
8001014c:	01042783          	lw	a5,16(s0)
80010150:	02079063          	bnez	a5,80010170 <__swsetup_r+0x124>
80010154:	00c45783          	lhu	a5,12(s0)
80010158:	20000713          	li	a4,512
8001015c:	2807f793          	andi	a5,a5,640
80010160:	00e78863          	beq	a5,a4,80010170 <__swsetup_r+0x124>
80010164:	00040593          	mv	a1,s0
80010168:	00090513          	mv	a0,s2
8001016c:	548000ef          	jal	ra,800106b4 <__smakebuf_r>
80010170:	00c45783          	lhu	a5,12(s0)
80010174:	0017f713          	andi	a4,a5,1
80010178:	02070c63          	beqz	a4,800101b0 <__swsetup_r+0x164>
8001017c:	01442783          	lw	a5,20(s0)
80010180:	00042423          	sw	zero,8(s0)
80010184:	40f007b3          	neg	a5,a5
80010188:	00f42c23          	sw	a5,24(s0)
8001018c:	01042783          	lw	a5,16(s0)
80010190:	00000513          	li	a0,0
80010194:	f20798e3          	bnez	a5,800100c4 <__swsetup_r+0x78>
80010198:	00c41783          	lh	a5,12(s0)
8001019c:	0807f713          	andi	a4,a5,128
800101a0:	f20702e3          	beqz	a4,800100c4 <__swsetup_r+0x78>
800101a4:	0407e793          	ori	a5,a5,64
800101a8:	00f41623          	sh	a5,12(s0)
800101ac:	f15ff06f          	j	800100c0 <__swsetup_r+0x74>
800101b0:	0027f793          	andi	a5,a5,2
800101b4:	00000713          	li	a4,0
800101b8:	00079463          	bnez	a5,800101c0 <__swsetup_r+0x174>
800101bc:	01442703          	lw	a4,20(s0)
800101c0:	00e42423          	sw	a4,8(s0)
800101c4:	fc9ff06f          	j	8001018c <__swsetup_r+0x140>

Disassembly of section .text.__sfvwrite_r:

800101c8 <__sfvwrite_r>:
800101c8:	00862783          	lw	a5,8(a2)
800101cc:	00079863          	bnez	a5,800101dc <__sfvwrite_r+0x14>
800101d0:	00000793          	li	a5,0
800101d4:	00078513          	mv	a0,a5
800101d8:	00008067          	ret
800101dc:	00c5d783          	lhu	a5,12(a1)
800101e0:	fc010113          	addi	sp,sp,-64
800101e4:	02812c23          	sw	s0,56(sp)
800101e8:	03212823          	sw	s2,48(sp)
800101ec:	03612023          	sw	s6,32(sp)
800101f0:	02112e23          	sw	ra,60(sp)
800101f4:	02912a23          	sw	s1,52(sp)
800101f8:	03312623          	sw	s3,44(sp)
800101fc:	03412423          	sw	s4,40(sp)
80010200:	03512223          	sw	s5,36(sp)
80010204:	01712e23          	sw	s7,28(sp)
80010208:	01812c23          	sw	s8,24(sp)
8001020c:	01912a23          	sw	s9,20(sp)
80010210:	01a12823          	sw	s10,16(sp)
80010214:	01b12623          	sw	s11,12(sp)
80010218:	0087f793          	andi	a5,a5,8
8001021c:	00060b13          	mv	s6,a2
80010220:	00058413          	mv	s0,a1
80010224:	00050913          	mv	s2,a0
80010228:	0e078263          	beqz	a5,8001030c <__sfvwrite_r+0x144>
8001022c:	0105a783          	lw	a5,16(a1)
80010230:	0c078e63          	beqz	a5,8001030c <__sfvwrite_r+0x144>
80010234:	00c45783          	lhu	a5,12(s0)
80010238:	000b2a03          	lw	s4,0(s6)
8001023c:	0027f713          	andi	a4,a5,2
80010240:	16071a63          	bnez	a4,800103b4 <__sfvwrite_r+0x1ec>
80010244:	0017f793          	andi	a5,a5,1
80010248:	00000b93          	li	s7,0
8001024c:	20078a63          	beqz	a5,80010460 <__sfvwrite_r+0x298>
80010250:	00000513          	li	a0,0
80010254:	00000a93          	li	s5,0
80010258:	00000993          	li	s3,0
8001025c:	36098463          	beqz	s3,800105c4 <__sfvwrite_r+0x3fc>
80010260:	02051263          	bnez	a0,80010284 <__sfvwrite_r+0xbc>
80010264:	00098613          	mv	a2,s3
80010268:	00a00593          	li	a1,10
8001026c:	000a8513          	mv	a0,s5
80010270:	534000ef          	jal	ra,800107a4 <memchr>
80010274:	00198b93          	addi	s7,s3,1
80010278:	00050663          	beqz	a0,80010284 <__sfvwrite_r+0xbc>
8001027c:	00150513          	addi	a0,a0,1
80010280:	41550bb3          	sub	s7,a0,s5
80010284:	000b8c13          	mv	s8,s7
80010288:	0179f463          	bgeu	s3,s7,80010290 <__sfvwrite_r+0xc8>
8001028c:	00098c13          	mv	s8,s3
80010290:	00042503          	lw	a0,0(s0)
80010294:	01042783          	lw	a5,16(s0)
80010298:	01442683          	lw	a3,20(s0)
8001029c:	32a7fe63          	bgeu	a5,a0,800105d8 <__sfvwrite_r+0x410>
800102a0:	00842483          	lw	s1,8(s0)
800102a4:	009684b3          	add	s1,a3,s1
800102a8:	3384d863          	bge	s1,s8,800105d8 <__sfvwrite_r+0x410>
800102ac:	000a8593          	mv	a1,s5
800102b0:	00048613          	mv	a2,s1
800102b4:	e09fd0ef          	jal	ra,8000e0bc <memmove>
800102b8:	00042783          	lw	a5,0(s0)
800102bc:	00040593          	mv	a1,s0
800102c0:	00090513          	mv	a0,s2
800102c4:	009787b3          	add	a5,a5,s1
800102c8:	00f42023          	sw	a5,0(s0)
800102cc:	fb0fd0ef          	jal	ra,8000da7c <_fflush_r>
800102d0:	16051e63          	bnez	a0,8001044c <__sfvwrite_r+0x284>
800102d4:	409b8bb3          	sub	s7,s7,s1
800102d8:	00100513          	li	a0,1
800102dc:	000b9a63          	bnez	s7,800102f0 <__sfvwrite_r+0x128>
800102e0:	00040593          	mv	a1,s0
800102e4:	00090513          	mv	a0,s2
800102e8:	f94fd0ef          	jal	ra,8000da7c <_fflush_r>
800102ec:	16051063          	bnez	a0,8001044c <__sfvwrite_r+0x284>
800102f0:	008b2783          	lw	a5,8(s6)
800102f4:	009a8ab3          	add	s5,s5,s1
800102f8:	409989b3          	sub	s3,s3,s1
800102fc:	409784b3          	sub	s1,a5,s1
80010300:	009b2423          	sw	s1,8(s6)
80010304:	f4049ce3          	bnez	s1,8001025c <__sfvwrite_r+0x94>
80010308:	0680006f          	j	80010370 <__sfvwrite_r+0x1a8>
8001030c:	00040593          	mv	a1,s0
80010310:	00090513          	mv	a0,s2
80010314:	d39ff0ef          	jal	ra,8001004c <__swsetup_r>
80010318:	fff00793          	li	a5,-1
8001031c:	f0050ce3          	beqz	a0,80010234 <__sfvwrite_r+0x6c>
80010320:	0540006f          	j	80010374 <__sfvwrite_r+0x1ac>
80010324:	000a2983          	lw	s3,0(s4)
80010328:	004a2483          	lw	s1,4(s4)
8001032c:	008a0a13          	addi	s4,s4,8
80010330:	fe048ae3          	beqz	s1,80010324 <__sfvwrite_r+0x15c>
80010334:	00048693          	mv	a3,s1
80010338:	009af463          	bgeu	s5,s1,80010340 <__sfvwrite_r+0x178>
8001033c:	000a8693          	mv	a3,s5
80010340:	02842783          	lw	a5,40(s0)
80010344:	02042583          	lw	a1,32(s0)
80010348:	00098613          	mv	a2,s3
8001034c:	00090513          	mv	a0,s2
80010350:	000780e7          	jalr	a5
80010354:	0ea05c63          	blez	a0,8001044c <__sfvwrite_r+0x284>
80010358:	008b2783          	lw	a5,8(s6)
8001035c:	00a989b3          	add	s3,s3,a0
80010360:	40a484b3          	sub	s1,s1,a0
80010364:	40a78533          	sub	a0,a5,a0
80010368:	00ab2423          	sw	a0,8(s6)
8001036c:	fc0512e3          	bnez	a0,80010330 <__sfvwrite_r+0x168>
80010370:	00000793          	li	a5,0
80010374:	03c12083          	lw	ra,60(sp)
80010378:	03812403          	lw	s0,56(sp)
8001037c:	03412483          	lw	s1,52(sp)
80010380:	03012903          	lw	s2,48(sp)
80010384:	02c12983          	lw	s3,44(sp)
80010388:	02812a03          	lw	s4,40(sp)
8001038c:	02412a83          	lw	s5,36(sp)
80010390:	02012b03          	lw	s6,32(sp)
80010394:	01c12b83          	lw	s7,28(sp)
80010398:	01812c03          	lw	s8,24(sp)
8001039c:	01412c83          	lw	s9,20(sp)
800103a0:	01012d03          	lw	s10,16(sp)
800103a4:	00c12d83          	lw	s11,12(sp)
800103a8:	00078513          	mv	a0,a5
800103ac:	04010113          	addi	sp,sp,64
800103b0:	00008067          	ret
800103b4:	80000ab7          	lui	s5,0x80000
800103b8:	00000993          	li	s3,0
800103bc:	00000493          	li	s1,0
800103c0:	c00aca93          	xori	s5,s5,-1024
800103c4:	f6dff06f          	j	80010330 <__sfvwrite_r+0x168>
800103c8:	000a2b83          	lw	s7,0(s4)
800103cc:	004a2483          	lw	s1,4(s4)
800103d0:	008a0a13          	addi	s4,s4,8
800103d4:	fe048ae3          	beqz	s1,800103c8 <__sfvwrite_r+0x200>
800103d8:	00c45783          	lhu	a5,12(s0)
800103dc:	00842d83          	lw	s11,8(s0)
800103e0:	00042503          	lw	a0,0(s0)
800103e4:	2007f713          	andi	a4,a5,512
800103e8:	14070263          	beqz	a4,8001052c <__sfvwrite_r+0x364>
800103ec:	0db4e063          	bltu	s1,s11,800104ac <__sfvwrite_r+0x2e4>
800103f0:	4807f713          	andi	a4,a5,1152
800103f4:	0a070c63          	beqz	a4,800104ac <__sfvwrite_r+0x2e4>
800103f8:	01442703          	lw	a4,20(s0)
800103fc:	01042583          	lw	a1,16(s0)
80010400:	00171a93          	slli	s5,a4,0x1
80010404:	00ea8733          	add	a4,s5,a4
80010408:	01f75a93          	srli	s5,a4,0x1f
8001040c:	40b50d33          	sub	s10,a0,a1
80010410:	00ea8ab3          	add	s5,s5,a4
80010414:	001d0713          	addi	a4,s10,1
80010418:	401ada93          	srai	s5,s5,0x1
8001041c:	00970733          	add	a4,a4,s1
80010420:	00eaf463          	bgeu	s5,a4,80010428 <__sfvwrite_r+0x260>
80010424:	00070a93          	mv	s5,a4
80010428:	4007f793          	andi	a5,a5,1024
8001042c:	0c078863          	beqz	a5,800104fc <__sfvwrite_r+0x334>
80010430:	000a8593          	mv	a1,s5
80010434:	00090513          	mv	a0,s2
80010438:	e39fd0ef          	jal	ra,8000e270 <_malloc_r>
8001043c:	00050993          	mv	s3,a0
80010440:	02051a63          	bnez	a0,80010474 <__sfvwrite_r+0x2ac>
80010444:	00c00793          	li	a5,12
80010448:	00f92023          	sw	a5,0(s2)
8001044c:	00c45783          	lhu	a5,12(s0)
80010450:	0407e793          	ori	a5,a5,64
80010454:	00f41623          	sh	a5,12(s0)
80010458:	fff00793          	li	a5,-1
8001045c:	f19ff06f          	j	80010374 <__sfvwrite_r+0x1ac>
80010460:	80000c37          	lui	s8,0x80000
80010464:	ffec4c93          	xori	s9,s8,-2
80010468:	00000493          	li	s1,0
8001046c:	fffc4c13          	not	s8,s8
80010470:	f65ff06f          	j	800103d4 <__sfvwrite_r+0x20c>
80010474:	01042583          	lw	a1,16(s0)
80010478:	000d0613          	mv	a2,s10
8001047c:	b69fd0ef          	jal	ra,8000dfe4 <memcpy>
80010480:	00c45783          	lhu	a5,12(s0)
80010484:	b7f7f793          	andi	a5,a5,-1153
80010488:	0807e793          	ori	a5,a5,128
8001048c:	00f41623          	sh	a5,12(s0)
80010490:	01342823          	sw	s3,16(s0)
80010494:	01542a23          	sw	s5,20(s0)
80010498:	01a989b3          	add	s3,s3,s10
8001049c:	41aa8ab3          	sub	s5,s5,s10
800104a0:	01342023          	sw	s3,0(s0)
800104a4:	00048d93          	mv	s11,s1
800104a8:	01542423          	sw	s5,8(s0)
800104ac:	00048993          	mv	s3,s1
800104b0:	01b4f463          	bgeu	s1,s11,800104b8 <__sfvwrite_r+0x2f0>
800104b4:	00048d93          	mv	s11,s1
800104b8:	00042503          	lw	a0,0(s0)
800104bc:	000d8613          	mv	a2,s11
800104c0:	000b8593          	mv	a1,s7
800104c4:	bf9fd0ef          	jal	ra,8000e0bc <memmove>
800104c8:	00842783          	lw	a5,8(s0)
800104cc:	41b787b3          	sub	a5,a5,s11
800104d0:	00f42423          	sw	a5,8(s0)
800104d4:	00042783          	lw	a5,0(s0)
800104d8:	01b78db3          	add	s11,a5,s11
800104dc:	01b42023          	sw	s11,0(s0)
800104e0:	008b2783          	lw	a5,8(s6)
800104e4:	013b8bb3          	add	s7,s7,s3
800104e8:	413484b3          	sub	s1,s1,s3
800104ec:	413789b3          	sub	s3,a5,s3
800104f0:	013b2423          	sw	s3,8(s6)
800104f4:	ee0990e3          	bnez	s3,800103d4 <__sfvwrite_r+0x20c>
800104f8:	e79ff06f          	j	80010370 <__sfvwrite_r+0x1a8>
800104fc:	000a8613          	mv	a2,s5
80010500:	00090513          	mv	a0,s2
80010504:	2c4000ef          	jal	ra,800107c8 <_realloc_r>
80010508:	00050993          	mv	s3,a0
8001050c:	f80512e3          	bnez	a0,80010490 <__sfvwrite_r+0x2c8>
80010510:	01042583          	lw	a1,16(s0)
80010514:	00090513          	mv	a0,s2
80010518:	c55fd0ef          	jal	ra,8000e16c <_free_r>
8001051c:	00c45783          	lhu	a5,12(s0)
80010520:	f7f7f793          	andi	a5,a5,-129
80010524:	00f41623          	sh	a5,12(s0)
80010528:	f1dff06f          	j	80010444 <__sfvwrite_r+0x27c>
8001052c:	01042783          	lw	a5,16(s0)
80010530:	00a7e663          	bltu	a5,a0,8001053c <__sfvwrite_r+0x374>
80010534:	01442983          	lw	s3,20(s0)
80010538:	0534f663          	bgeu	s1,s3,80010584 <__sfvwrite_r+0x3bc>
8001053c:	000d8993          	mv	s3,s11
80010540:	01b4f463          	bgeu	s1,s11,80010548 <__sfvwrite_r+0x380>
80010544:	00048993          	mv	s3,s1
80010548:	00098613          	mv	a2,s3
8001054c:	000b8593          	mv	a1,s7
80010550:	b6dfd0ef          	jal	ra,8000e0bc <memmove>
80010554:	00842783          	lw	a5,8(s0)
80010558:	00042703          	lw	a4,0(s0)
8001055c:	413787b3          	sub	a5,a5,s3
80010560:	01370733          	add	a4,a4,s3
80010564:	00f42423          	sw	a5,8(s0)
80010568:	00e42023          	sw	a4,0(s0)
8001056c:	f6079ae3          	bnez	a5,800104e0 <__sfvwrite_r+0x318>
80010570:	00040593          	mv	a1,s0
80010574:	00090513          	mv	a0,s2
80010578:	d04fd0ef          	jal	ra,8000da7c <_fflush_r>
8001057c:	f60502e3          	beqz	a0,800104e0 <__sfvwrite_r+0x318>
80010580:	ecdff06f          	j	8001044c <__sfvwrite_r+0x284>
80010584:	00048513          	mv	a0,s1
80010588:	009cf463          	bgeu	s9,s1,80010590 <__sfvwrite_r+0x3c8>
8001058c:	000c0513          	mv	a0,s8
80010590:	00098593          	mv	a1,s3
80010594:	d21fc0ef          	jal	ra,8000d2b4 <__divsi3>
80010598:	00098593          	mv	a1,s3
8001059c:	cf5fc0ef          	jal	ra,8000d290 <__mulsi3>
800105a0:	02842783          	lw	a5,40(s0)
800105a4:	02042583          	lw	a1,32(s0)
800105a8:	00050693          	mv	a3,a0
800105ac:	000b8613          	mv	a2,s7
800105b0:	00090513          	mv	a0,s2
800105b4:	000780e7          	jalr	a5
800105b8:	00050993          	mv	s3,a0
800105bc:	f2a042e3          	bgtz	a0,800104e0 <__sfvwrite_r+0x318>
800105c0:	e8dff06f          	j	8001044c <__sfvwrite_r+0x284>
800105c4:	000a2a83          	lw	s5,0(s4)
800105c8:	004a2983          	lw	s3,4(s4)
800105cc:	00000513          	li	a0,0
800105d0:	008a0a13          	addi	s4,s4,8
800105d4:	c89ff06f          	j	8001025c <__sfvwrite_r+0x94>
800105d8:	02dc4263          	blt	s8,a3,800105fc <__sfvwrite_r+0x434>
800105dc:	02842783          	lw	a5,40(s0)
800105e0:	02042583          	lw	a1,32(s0)
800105e4:	000a8613          	mv	a2,s5
800105e8:	00090513          	mv	a0,s2
800105ec:	000780e7          	jalr	a5
800105f0:	00050493          	mv	s1,a0
800105f4:	cea040e3          	bgtz	a0,800102d4 <__sfvwrite_r+0x10c>
800105f8:	e55ff06f          	j	8001044c <__sfvwrite_r+0x284>
800105fc:	000c0613          	mv	a2,s8
80010600:	000a8593          	mv	a1,s5
80010604:	ab9fd0ef          	jal	ra,8000e0bc <memmove>
80010608:	00842783          	lw	a5,8(s0)
8001060c:	000c0493          	mv	s1,s8
80010610:	418787b3          	sub	a5,a5,s8
80010614:	00f42423          	sw	a5,8(s0)
80010618:	00042783          	lw	a5,0(s0)
8001061c:	018787b3          	add	a5,a5,s8
80010620:	00f42023          	sw	a5,0(s0)
80010624:	cb1ff06f          	j	800102d4 <__sfvwrite_r+0x10c>

Disassembly of section .text.__swhatbuf_r:

80010628 <__swhatbuf_r>:
80010628:	f8010113          	addi	sp,sp,-128
8001062c:	06912a23          	sw	s1,116(sp)
80010630:	00058493          	mv	s1,a1
80010634:	00e59583          	lh	a1,14(a1)
80010638:	06812c23          	sw	s0,120(sp)
8001063c:	06112e23          	sw	ra,124(sp)
80010640:	00060413          	mv	s0,a2
80010644:	0005de63          	bgez	a1,80010660 <__swhatbuf_r+0x38>
80010648:	00c4d783          	lhu	a5,12(s1)
8001064c:	0006a023          	sw	zero,0(a3)
80010650:	0807f793          	andi	a5,a5,128
80010654:	04079063          	bnez	a5,80010694 <__swhatbuf_r+0x6c>
80010658:	40000793          	li	a5,1024
8001065c:	03c0006f          	j	80010698 <__swhatbuf_r+0x70>
80010660:	01810613          	addi	a2,sp,24
80010664:	00d12623          	sw	a3,12(sp)
80010668:	1f8000ef          	jal	ra,80010860 <_fstat_r>
8001066c:	00c12683          	lw	a3,12(sp)
80010670:	fc054ce3          	bltz	a0,80010648 <__swhatbuf_r+0x20>
80010674:	01c12703          	lw	a4,28(sp)
80010678:	0000f7b7          	lui	a5,0xf
8001067c:	00e7f7b3          	and	a5,a5,a4
80010680:	ffffe737          	lui	a4,0xffffe
80010684:	00e787b3          	add	a5,a5,a4
80010688:	0017b793          	seqz	a5,a5
8001068c:	00f6a023          	sw	a5,0(a3)
80010690:	fc9ff06f          	j	80010658 <__swhatbuf_r+0x30>
80010694:	04000793          	li	a5,64
80010698:	00f42023          	sw	a5,0(s0)
8001069c:	07c12083          	lw	ra,124(sp)
800106a0:	07812403          	lw	s0,120(sp)
800106a4:	07412483          	lw	s1,116(sp)
800106a8:	00000513          	li	a0,0
800106ac:	08010113          	addi	sp,sp,128
800106b0:	00008067          	ret

Disassembly of section .text.__smakebuf_r:

800106b4 <__smakebuf_r>:
800106b4:	00c5d783          	lhu	a5,12(a1)
800106b8:	fe010113          	addi	sp,sp,-32
800106bc:	00812c23          	sw	s0,24(sp)
800106c0:	00112e23          	sw	ra,28(sp)
800106c4:	00912a23          	sw	s1,20(sp)
800106c8:	01212823          	sw	s2,16(sp)
800106cc:	0027f793          	andi	a5,a5,2
800106d0:	00058413          	mv	s0,a1
800106d4:	02078863          	beqz	a5,80010704 <__smakebuf_r+0x50>
800106d8:	04740793          	addi	a5,s0,71
800106dc:	00f42023          	sw	a5,0(s0)
800106e0:	00f42823          	sw	a5,16(s0)
800106e4:	00100793          	li	a5,1
800106e8:	00f42a23          	sw	a5,20(s0)
800106ec:	01c12083          	lw	ra,28(sp)
800106f0:	01812403          	lw	s0,24(sp)
800106f4:	01412483          	lw	s1,20(sp)
800106f8:	01012903          	lw	s2,16(sp)
800106fc:	02010113          	addi	sp,sp,32
80010700:	00008067          	ret
80010704:	00c10693          	addi	a3,sp,12
80010708:	00810613          	addi	a2,sp,8
8001070c:	00050493          	mv	s1,a0
80010710:	f19ff0ef          	jal	ra,80010628 <__swhatbuf_r>
80010714:	00812583          	lw	a1,8(sp)
80010718:	00050913          	mv	s2,a0
8001071c:	00048513          	mv	a0,s1
80010720:	b51fd0ef          	jal	ra,8000e270 <_malloc_r>
80010724:	02051063          	bnez	a0,80010744 <__smakebuf_r+0x90>
80010728:	00c41783          	lh	a5,12(s0)
8001072c:	2007f713          	andi	a4,a5,512
80010730:	fa071ee3          	bnez	a4,800106ec <__smakebuf_r+0x38>
80010734:	ffc7f793          	andi	a5,a5,-4
80010738:	0027e793          	ori	a5,a5,2
8001073c:	00f41623          	sh	a5,12(s0)
80010740:	f99ff06f          	j	800106d8 <__smakebuf_r+0x24>
80010744:	ffffd797          	auipc	a5,0xffffd
80010748:	49078793          	addi	a5,a5,1168 # 8000dbd4 <_cleanup_r>
8001074c:	02f4a423          	sw	a5,40(s1)
80010750:	00c45783          	lhu	a5,12(s0)
80010754:	00a42023          	sw	a0,0(s0)
80010758:	00a42823          	sw	a0,16(s0)
8001075c:	0807e793          	ori	a5,a5,128
80010760:	00f41623          	sh	a5,12(s0)
80010764:	00812783          	lw	a5,8(sp)
80010768:	00f42a23          	sw	a5,20(s0)
8001076c:	00c12783          	lw	a5,12(sp)
80010770:	02078263          	beqz	a5,80010794 <__smakebuf_r+0xe0>
80010774:	00e41583          	lh	a1,14(s0)
80010778:	00048513          	mv	a0,s1
8001077c:	12c000ef          	jal	ra,800108a8 <_isatty_r>
80010780:	00050a63          	beqz	a0,80010794 <__smakebuf_r+0xe0>
80010784:	00c45783          	lhu	a5,12(s0)
80010788:	ffc7f793          	andi	a5,a5,-4
8001078c:	0017e793          	ori	a5,a5,1
80010790:	00f41623          	sh	a5,12(s0)
80010794:	00c45783          	lhu	a5,12(s0)
80010798:	00f96933          	or	s2,s2,a5
8001079c:	01241623          	sh	s2,12(s0)
800107a0:	f4dff06f          	j	800106ec <__smakebuf_r+0x38>

Disassembly of section .text.memchr:

800107a4 <memchr>:
800107a4:	0ff5f593          	andi	a1,a1,255
800107a8:	00c50633          	add	a2,a0,a2
800107ac:	00c51663          	bne	a0,a2,800107b8 <memchr+0x14>
800107b0:	00000513          	li	a0,0
800107b4:	00008067          	ret
800107b8:	00054783          	lbu	a5,0(a0)
800107bc:	feb78ce3          	beq	a5,a1,800107b4 <memchr+0x10>
800107c0:	00150513          	addi	a0,a0,1
800107c4:	fe9ff06f          	j	800107ac <memchr+0x8>

Disassembly of section .text._realloc_r:

800107c8 <_realloc_r>:
800107c8:	00059663          	bnez	a1,800107d4 <_realloc_r+0xc>
800107cc:	00060593          	mv	a1,a2
800107d0:	aa1fd06f          	j	8000e270 <_malloc_r>
800107d4:	fe010113          	addi	sp,sp,-32
800107d8:	00812c23          	sw	s0,24(sp)
800107dc:	00112e23          	sw	ra,28(sp)
800107e0:	00912a23          	sw	s1,20(sp)
800107e4:	01212823          	sw	s2,16(sp)
800107e8:	01312623          	sw	s3,12(sp)
800107ec:	00060413          	mv	s0,a2
800107f0:	02061663          	bnez	a2,8001081c <_realloc_r+0x54>
800107f4:	979fd0ef          	jal	ra,8000e16c <_free_r>
800107f8:	00000913          	li	s2,0
800107fc:	01c12083          	lw	ra,28(sp)
80010800:	01812403          	lw	s0,24(sp)
80010804:	00090513          	mv	a0,s2
80010808:	01412483          	lw	s1,20(sp)
8001080c:	01012903          	lw	s2,16(sp)
80010810:	00c12983          	lw	s3,12(sp)
80010814:	02010113          	addi	sp,sp,32
80010818:	00008067          	ret
8001081c:	00058493          	mv	s1,a1
80010820:	00050993          	mv	s3,a0
80010824:	0c8000ef          	jal	ra,800108ec <_malloc_usable_size_r>
80010828:	00048913          	mv	s2,s1
8001082c:	fc8578e3          	bgeu	a0,s0,800107fc <_realloc_r+0x34>
80010830:	00040593          	mv	a1,s0
80010834:	00098513          	mv	a0,s3
80010838:	a39fd0ef          	jal	ra,8000e270 <_malloc_r>
8001083c:	00050913          	mv	s2,a0
80010840:	fa050ee3          	beqz	a0,800107fc <_realloc_r+0x34>
80010844:	00048593          	mv	a1,s1
80010848:	00040613          	mv	a2,s0
8001084c:	f98fd0ef          	jal	ra,8000dfe4 <memcpy>
80010850:	00048593          	mv	a1,s1
80010854:	00098513          	mv	a0,s3
80010858:	915fd0ef          	jal	ra,8000e16c <_free_r>
8001085c:	fa1ff06f          	j	800107fc <_realloc_r+0x34>

Disassembly of section .text._fstat_r:

80010860 <_fstat_r>:
80010860:	ff010113          	addi	sp,sp,-16
80010864:	00812423          	sw	s0,8(sp)
80010868:	00050413          	mv	s0,a0
8001086c:	00058513          	mv	a0,a1
80010870:	00060593          	mv	a1,a2
80010874:	c401a223          	sw	zero,-956(gp) # 8000347c <errno>
80010878:	00112623          	sw	ra,12(sp)
8001087c:	c0cf50ef          	jal	ra,80005c88 <_fstat>
80010880:	fff00793          	li	a5,-1
80010884:	00f51a63          	bne	a0,a5,80010898 <_fstat_r+0x38>
80010888:	c4418793          	addi	a5,gp,-956 # 8000347c <errno>
8001088c:	0007a783          	lw	a5,0(a5)
80010890:	00078463          	beqz	a5,80010898 <_fstat_r+0x38>
80010894:	00f42023          	sw	a5,0(s0)
80010898:	00c12083          	lw	ra,12(sp)
8001089c:	00812403          	lw	s0,8(sp)
800108a0:	01010113          	addi	sp,sp,16
800108a4:	00008067          	ret

Disassembly of section .text._isatty_r:

800108a8 <_isatty_r>:
800108a8:	ff010113          	addi	sp,sp,-16
800108ac:	00812423          	sw	s0,8(sp)
800108b0:	00050413          	mv	s0,a0
800108b4:	00058513          	mv	a0,a1
800108b8:	c401a223          	sw	zero,-956(gp) # 8000347c <errno>
800108bc:	00112623          	sw	ra,12(sp)
800108c0:	bc0f50ef          	jal	ra,80005c80 <_isatty>
800108c4:	fff00793          	li	a5,-1
800108c8:	00f51a63          	bne	a0,a5,800108dc <_isatty_r+0x34>
800108cc:	c4418793          	addi	a5,gp,-956 # 8000347c <errno>
800108d0:	0007a783          	lw	a5,0(a5)
800108d4:	00078463          	beqz	a5,800108dc <_isatty_r+0x34>
800108d8:	00f42023          	sw	a5,0(s0)
800108dc:	00c12083          	lw	ra,12(sp)
800108e0:	00812403          	lw	s0,8(sp)
800108e4:	01010113          	addi	sp,sp,16
800108e8:	00008067          	ret

Disassembly of section .text._malloc_usable_size_r:

800108ec <_malloc_usable_size_r>:
800108ec:	ffc5a783          	lw	a5,-4(a1)
800108f0:	ffc78513          	addi	a0,a5,-4
800108f4:	0007d863          	bgez	a5,80010904 <_malloc_usable_size_r+0x18>
800108f8:	00a585b3          	add	a1,a1,a0
800108fc:	0005a783          	lw	a5,0(a1)
80010900:	00f50533          	add	a0,a0,a5
80010904:	00008067          	ret
