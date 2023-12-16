
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
80000064:	1cd030ef          	jal	ra,80003a30 <irqCallback>
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
800000b4:	79018193          	addi	gp,gp,1936 # 80003840 <__global_pointer$>
800000b8:	00011117          	auipc	sp,0x11
800000bc:	12810113          	addi	sp,sp,296 # 800111e0 <_stack_start>

800000c0 <bss_init>:
800000c0:	86018513          	addi	a0,gp,-1952 # 800030a0 <t2>
800000c4:	c4818593          	addi	a1,gp,-952 # 80003488 <_bss_end>

800000c8 <bss_loop>:
800000c8:	00b50863          	beq	a0,a1,800000d8 <bss_done>
800000cc:	00052023          	sw	zero,0(a0)
800000d0:	00450513          	addi	a0,a0,4
800000d4:	ff5ff06f          	j	800000c8 <bss_loop>

800000d8 <bss_done>:
800000d8:	00011517          	auipc	a0,0x11
800000dc:	90050513          	addi	a0,a0,-1792 # 800109d8 <_ctors_end>
800000e0:	ffc10113          	addi	sp,sp,-4

800000e4 <ctors_loop>:
800000e4:	00011597          	auipc	a1,0x11
800000e8:	8f458593          	addi	a1,a1,-1804 # 800109d8 <_ctors_end>
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
80000124:	3140d0ef          	jal	ra,8000d438 <end>

80000128 <infinitLoop>:
80000128:	0000006f          	j	80000128 <infinitLoop>
	...

Disassembly of section .memory:

800034ec <crc16>:
800034ec:	000107b7          	lui	a5,0x10
800034f0:	ffffa6b7          	lui	a3,0xffffa
800034f4:	00000713          	li	a4,0
800034f8:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
800034fc:	00168693          	addi	a3,a3,1 # ffffa001 <_heap_end+0x7ffe8001>
80003500:	00b74663          	blt	a4,a1,8000350c <crc16+0x20>
80003504:	00078513          	mv	a0,a5
80003508:	00008067          	ret
8000350c:	00e50633          	add	a2,a0,a4
80003510:	00064603          	lbu	a2,0(a2)
80003514:	00c7c7b3          	xor	a5,a5,a2
80003518:	00800613          	li	a2,8
8000351c:	0017f813          	andi	a6,a5,1
80003520:	0017d793          	srli	a5,a5,0x1
80003524:	00080863          	beqz	a6,80003534 <crc16+0x48>
80003528:	00d7c7b3          	xor	a5,a5,a3
8000352c:	01079793          	slli	a5,a5,0x10
80003530:	0107d793          	srli	a5,a5,0x10
80003534:	fff60613          	addi	a2,a2,-1
80003538:	fe0612e3          	bnez	a2,8000351c <crc16+0x30>
8000353c:	00170713          	addi	a4,a4,1
80003540:	fc1ff06f          	j	80003500 <crc16+0x14>

80003544 <add_crc>:
80003544:	ff010113          	addi	sp,sp,-16
80003548:	00812423          	sw	s0,8(sp)
8000354c:	00912223          	sw	s1,4(sp)
80003550:	00112623          	sw	ra,12(sp)
80003554:	00050413          	mv	s0,a0
80003558:	00058493          	mv	s1,a1
8000355c:	f91ff0ef          	jal	ra,800034ec <crc16>
80003560:	009405b3          	add	a1,s0,s1
80003564:	00a58023          	sb	a0,0(a1)
80003568:	00855513          	srli	a0,a0,0x8
8000356c:	00a580a3          	sb	a0,1(a1)
80003570:	00c12083          	lw	ra,12(sp)
80003574:	00812403          	lw	s0,8(sp)
80003578:	00412483          	lw	s1,4(sp)
8000357c:	01010113          	addi	sp,sp,16
80003580:	00008067          	ret

80003584 <println>:
80003584:	ff010113          	addi	sp,sp,-16
80003588:	00112623          	sw	ra,12(sp)
8000358c:	6ac020ef          	jal	ra,80005c38 <print_uart0>
80003590:	00c12083          	lw	ra,12(sp)
80003594:	80003537          	lui	a0,0x80003
80003598:	81050513          	addi	a0,a0,-2032 # 80002810 <_heap_end+0xffff0810>
8000359c:	01010113          	addi	sp,sp,16
800035a0:	6980206f          	j	80005c38 <print_uart0>

800035a4 <to_hex_nibble>:
800035a4:	00f57513          	andi	a0,a0,15
800035a8:	00900793          	li	a5,9
800035ac:	00a7f663          	bgeu	a5,a0,800035b8 <to_hex_nibble+0x14>
800035b0:	03750513          	addi	a0,a0,55
800035b4:	00008067          	ret
800035b8:	03050513          	addi	a0,a0,48
800035bc:	00008067          	ret

800035c0 <to_hex>:
800035c0:	fd010113          	addi	sp,sp,-48
800035c4:	02812423          	sw	s0,40(sp)
800035c8:	02912223          	sw	s1,36(sp)
800035cc:	03212023          	sw	s2,32(sp)
800035d0:	01312e23          	sw	s3,28(sp)
800035d4:	02112623          	sw	ra,44(sp)
800035d8:	00050913          	mv	s2,a0
800035dc:	00050493          	mv	s1,a0
800035e0:	01c00413          	li	s0,28
800035e4:	ffc00993          	li	s3,-4
800035e8:	0085d533          	srl	a0,a1,s0
800035ec:	0ff57513          	andi	a0,a0,255
800035f0:	00b12623          	sw	a1,12(sp)
800035f4:	fb1ff0ef          	jal	ra,800035a4 <to_hex_nibble>
800035f8:	00a48023          	sb	a0,0(s1)
800035fc:	ffc40413          	addi	s0,s0,-4
80003600:	00148493          	addi	s1,s1,1
80003604:	00c12583          	lw	a1,12(sp)
80003608:	ff3410e3          	bne	s0,s3,800035e8 <to_hex+0x28>
8000360c:	02c12083          	lw	ra,44(sp)
80003610:	02812403          	lw	s0,40(sp)
80003614:	00090423          	sb	zero,8(s2)
80003618:	02412483          	lw	s1,36(sp)
8000361c:	02012903          	lw	s2,32(sp)
80003620:	01c12983          	lw	s3,28(sp)
80003624:	03010113          	addi	sp,sp,48
80003628:	00008067          	ret

8000362c <process_and_wait>:
8000362c:	fe010113          	addi	sp,sp,-32
80003630:	00812c23          	sw	s0,24(sp)
80003634:	00912a23          	sw	s1,20(sp)
80003638:	01412423          	sw	s4,8(sp)
8000363c:	01512223          	sw	s5,4(sp)
80003640:	00112e23          	sw	ra,28(sp)
80003644:	01212823          	sw	s2,16(sp)
80003648:	01312623          	sw	s3,12(sp)
8000364c:	f00b07b7          	lui	a5,0xf00b0
80003650:	0007a903          	lw	s2,0(a5) # f00b0000 <_heap_end+0x7009e000>
80003654:	0047a983          	lw	s3,4(a5)
80003658:	00050a13          	mv	s4,a0
8000365c:	f00b0ab7          	lui	s5,0xf00b0
80003660:	000aa783          	lw	a5,0(s5) # f00b0000 <_heap_end+0x7009e000>
80003664:	004aa803          	lw	a6,4(s5)
80003668:	412786b3          	sub	a3,a5,s2
8000366c:	00d7b733          	sltu	a4,a5,a3
80003670:	413807b3          	sub	a5,a6,s3
80003674:	02e79663          	bne	a5,a4,800036a0 <process_and_wait+0x74>
80003678:	0346f463          	bgeu	a3,s4,800036a0 <process_and_wait+0x74>
8000367c:	8741a783          	lw	a5,-1932(gp) # 800030b4 <events_modbus_rtu_poll>
80003680:	00078663          	beqz	a5,8000368c <process_and_wait+0x60>
80003684:	470000ef          	jal	ra,80003af4 <modbus_rtu_poll>
80003688:	8601aa23          	sw	zero,-1932(gp) # 800030b4 <events_modbus_rtu_poll>
8000368c:	8781a783          	lw	a5,-1928(gp) # 800030b8 <events_mac_poll>
80003690:	fc0788e3          	beqz	a5,80003660 <process_and_wait+0x34>
80003694:	415010ef          	jal	ra,800052a8 <mac_poll>
80003698:	8601ac23          	sw	zero,-1928(gp) # 800030b8 <events_mac_poll>
8000369c:	fc5ff06f          	j	80003660 <process_and_wait+0x34>
800036a0:	01c12083          	lw	ra,28(sp)
800036a4:	01812403          	lw	s0,24(sp)
800036a8:	01412483          	lw	s1,20(sp)
800036ac:	01012903          	lw	s2,16(sp)
800036b0:	00c12983          	lw	s3,12(sp)
800036b4:	00812a03          	lw	s4,8(sp)
800036b8:	00412a83          	lw	s5,4(sp)
800036bc:	02010113          	addi	sp,sp,32
800036c0:	00008067          	ret

800036c4 <sram_test_write_shorts>:
800036c4:	80002537          	lui	a0,0x80002
800036c8:	fe010113          	addi	sp,sp,-32
800036cc:	900005b7          	lui	a1,0x90000
800036d0:	00080637          	lui	a2,0x80
800036d4:	f3450513          	addi	a0,a0,-204 # 80001f34 <_heap_end+0xfffeff34>
800036d8:	00112e23          	sw	ra,28(sp)
800036dc:	00812c23          	sw	s0,24(sp)
800036e0:	00912a23          	sw	s1,20(sp)
800036e4:	01212823          	sw	s2,16(sp)
800036e8:	01312623          	sw	s3,12(sp)
800036ec:	01412423          	sw	s4,8(sp)
800036f0:	6050a0ef          	jal	ra,8000e4f4 <iprintf>
800036f4:	00000793          	li	a5,0
800036f8:	900005b7          	lui	a1,0x90000
800036fc:	000406b7          	lui	a3,0x40
80003700:	00179713          	slli	a4,a5,0x1
80003704:	01079613          	slli	a2,a5,0x10
80003708:	00b70733          	add	a4,a4,a1
8000370c:	01065613          	srli	a2,a2,0x10
80003710:	00c71023          	sh	a2,0(a4)
80003714:	00178793          	addi	a5,a5,1
80003718:	fed794e3          	bne	a5,a3,80003700 <sram_test_write_shorts+0x3c>
8000371c:	80002537          	lui	a0,0x80002
80003720:	f5c50513          	addi	a0,a0,-164 # 80001f5c <_heap_end+0xfffeff5c>
80003724:	5d10a0ef          	jal	ra,8000e4f4 <iprintf>
80003728:	80002537          	lui	a0,0x80002
8000372c:	00080637          	lui	a2,0x80
80003730:	900005b7          	lui	a1,0x90000
80003734:	f6450513          	addi	a0,a0,-156 # 80001f64 <_heap_end+0xfffeff64>
80003738:	000104b7          	lui	s1,0x10
8000373c:	5b90a0ef          	jal	ra,8000e4f4 <iprintf>
80003740:	00000413          	li	s0,0
80003744:	900009b7          	lui	s3,0x90000
80003748:	fff48493          	addi	s1,s1,-1 # ffff <_stack_size+0xf7ff>
8000374c:	80002a37          	lui	s4,0x80002
80003750:	00040937          	lui	s2,0x40
80003754:	00141593          	slli	a1,s0,0x1
80003758:	013585b3          	add	a1,a1,s3
8000375c:	0005d783          	lhu	a5,0(a1) # 90000000 <_heap_end+0xffee000>
80003760:	01041713          	slli	a4,s0,0x10
80003764:	01075713          	srli	a4,a4,0x10
80003768:	00f70a63          	beq	a4,a5,8000377c <sram_test_write_shorts+0xb8>
8000376c:	0005d683          	lhu	a3,0(a1)
80003770:	00947633          	and	a2,s0,s1
80003774:	f8ca0513          	addi	a0,s4,-116 # 80001f8c <_heap_end+0xfffeff8c>
80003778:	57d0a0ef          	jal	ra,8000e4f4 <iprintf>
8000377c:	00140413          	addi	s0,s0,1
80003780:	fd241ae3          	bne	s0,s2,80003754 <sram_test_write_shorts+0x90>
80003784:	01812403          	lw	s0,24(sp)
80003788:	01c12083          	lw	ra,28(sp)
8000378c:	01412483          	lw	s1,20(sp)
80003790:	01012903          	lw	s2,16(sp)
80003794:	00c12983          	lw	s3,12(sp)
80003798:	00812a03          	lw	s4,8(sp)
8000379c:	80002537          	lui	a0,0x80002
800037a0:	fc050513          	addi	a0,a0,-64 # 80001fc0 <_heap_end+0xfffeffc0>
800037a4:	02010113          	addi	sp,sp,32
800037a8:	54d0a06f          	j	8000e4f4 <iprintf>

800037ac <sram_test_write_random_ints>:
800037ac:	80002537          	lui	a0,0x80002
800037b0:	fe010113          	addi	sp,sp,-32
800037b4:	00080637          	lui	a2,0x80
800037b8:	900005b7          	lui	a1,0x90000
800037bc:	f3450513          	addi	a0,a0,-204 # 80001f34 <_heap_end+0xfffeff34>
800037c0:	00112e23          	sw	ra,28(sp)
800037c4:	00812c23          	sw	s0,24(sp)
800037c8:	00912a23          	sw	s1,20(sp)
800037cc:	01212823          	sw	s2,16(sp)
800037d0:	01312623          	sw	s3,12(sp)
800037d4:	5210a0ef          	jal	ra,8000e4f4 <iprintf>
800037d8:	deadc7b7          	lui	a5,0xdeadc
800037dc:	eef78793          	addi	a5,a5,-273 # deadbeef <_heap_end+0x5eac9eef>
800037e0:	90000737          	lui	a4,0x90000
800037e4:	900806b7          	lui	a3,0x90080
800037e8:	00f72023          	sw	a5,0(a4) # 90000000 <_heap_end+0xffee000>
800037ec:	00470713          	addi	a4,a4,4
800037f0:	00179793          	slli	a5,a5,0x1
800037f4:	fed71ae3          	bne	a4,a3,800037e8 <sram_test_write_random_ints+0x3c>
800037f8:	80002537          	lui	a0,0x80002
800037fc:	f5c50513          	addi	a0,a0,-164 # 80001f5c <_heap_end+0xfffeff5c>
80003800:	4f50a0ef          	jal	ra,8000e4f4 <iprintf>
80003804:	80002537          	lui	a0,0x80002
80003808:	00080637          	lui	a2,0x80
8000380c:	900005b7          	lui	a1,0x90000
80003810:	f6450513          	addi	a0,a0,-156 # 80001f64 <_heap_end+0xfffeff64>
80003814:	deadc4b7          	lui	s1,0xdeadc
80003818:	4dd0a0ef          	jal	ra,8000e4f4 <iprintf>
8000381c:	eef48493          	addi	s1,s1,-273 # deadbeef <_heap_end+0x5eac9eef>
80003820:	90000437          	lui	s0,0x90000
80003824:	800029b7          	lui	s3,0x80002
80003828:	90080937          	lui	s2,0x90080
8000382c:	00042783          	lw	a5,0(s0) # 90000000 <_heap_end+0xffee000>
80003830:	00978c63          	beq	a5,s1,80003848 <__global_pointer$+0x8>
80003834:	00042683          	lw	a3,0(s0)
80003838:	00048613          	mv	a2,s1
8000383c:	00040593          	mv	a1,s0
80003840:	f8c98513          	addi	a0,s3,-116 # 80001f8c <_heap_end+0xfffeff8c>
80003844:	4b10a0ef          	jal	ra,8000e4f4 <iprintf>
80003848:	00440413          	addi	s0,s0,4
8000384c:	00149493          	slli	s1,s1,0x1
80003850:	fd241ee3          	bne	s0,s2,8000382c <sram_test_write_random_ints+0x80>
80003854:	01812403          	lw	s0,24(sp)
80003858:	01c12083          	lw	ra,28(sp)
8000385c:	01412483          	lw	s1,20(sp)
80003860:	01012903          	lw	s2,16(sp)
80003864:	00c12983          	lw	s3,12(sp)
80003868:	80002537          	lui	a0,0x80002
8000386c:	fc050513          	addi	a0,a0,-64 # 80001fc0 <_heap_end+0xfffeffc0>
80003870:	02010113          	addi	sp,sp,32
80003874:	4810a06f          	j	8000e4f4 <iprintf>

80003878 <timerInterrupt>:
80003878:	00008067          	ret

8000387c <externalInterrupt>:
8000387c:	ff010113          	addi	sp,sp,-16
80003880:	00112623          	sw	ra,12(sp)
80003884:	00812423          	sw	s0,8(sp)
80003888:	f00607b7          	lui	a5,0xf0060
8000388c:	0047a783          	lw	a5,4(a5) # f0060004 <_heap_end+0x7004e004>
80003890:	0017f793          	andi	a5,a5,1
80003894:	02078c63          	beqz	a5,800038cc <externalInterrupt+0x50>
80003898:	f0000737          	lui	a4,0xf0000
8000389c:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
800038a0:	02a00593          	li	a1,42
800038a4:	0027e793          	ori	a5,a5,2
800038a8:	00f72223          	sw	a5,4(a4)
800038ac:	f0010737          	lui	a4,0xf0010
800038b0:	00472783          	lw	a5,4(a4) # f0010004 <_heap_end+0x6fffe004>
800038b4:	0187d793          	srli	a5,a5,0x18
800038b8:	0e079c63          	bnez	a5,800039b0 <externalInterrupt+0x134>
800038bc:	f0060737          	lui	a4,0xf0060
800038c0:	00472783          	lw	a5,4(a4) # f0060004 <_heap_end+0x7004e004>
800038c4:	ffe7f793          	andi	a5,a5,-2
800038c8:	00f72223          	sw	a5,4(a4)
800038cc:	f0060437          	lui	s0,0xf0060
800038d0:	00442783          	lw	a5,4(s0) # f0060004 <_heap_end+0x7004e004>
800038d4:	0027f793          	andi	a5,a5,2
800038d8:	00078a63          	beqz	a5,800038ec <externalInterrupt+0x70>
800038dc:	2fc000ef          	jal	ra,80003bd8 <modbus_rtu_isr>
800038e0:	00442783          	lw	a5,4(s0)
800038e4:	ffd7f793          	andi	a5,a5,-3
800038e8:	00f42223          	sw	a5,4(s0)
800038ec:	f0060437          	lui	s0,0xf0060
800038f0:	00442783          	lw	a5,4(s0) # f0060004 <_heap_end+0x7004e004>
800038f4:	0047f793          	andi	a5,a5,4
800038f8:	00078a63          	beqz	a5,8000390c <externalInterrupt+0x90>
800038fc:	6dc010ef          	jal	ra,80004fd8 <mac_rx_isr>
80003900:	00442783          	lw	a5,4(s0)
80003904:	ffb7f793          	andi	a5,a5,-5
80003908:	00f42223          	sw	a5,4(s0)
8000390c:	f00607b7          	lui	a5,0xf0060
80003910:	0047a703          	lw	a4,4(a5) # f0060004 <_heap_end+0x7004e004>
80003914:	00877713          	andi	a4,a4,8
80003918:	02070863          	beqz	a4,80003948 <externalInterrupt+0xcc>
8000391c:	f0020737          	lui	a4,0xf0020
80003920:	000186b7          	lui	a3,0x18
80003924:	00072623          	sw	zero,12(a4) # f002000c <_heap_end+0x7000e00c>
80003928:	6a068693          	addi	a3,a3,1696 # 186a0 <_stack_size+0x17ea0>
8000392c:	00d72823          	sw	a3,16(a4)
80003930:	00100693          	li	a3,1
80003934:	00d72023          	sw	a3,0(a4)
80003938:	86d1ac23          	sw	a3,-1928(gp) # 800030b8 <events_mac_poll>
8000393c:	0047a703          	lw	a4,4(a5)
80003940:	ff777713          	andi	a4,a4,-9
80003944:	00e7a223          	sw	a4,4(a5)
80003948:	f00607b7          	lui	a5,0xf0060
8000394c:	0047a703          	lw	a4,4(a5) # f0060004 <_heap_end+0x7004e004>
80003950:	01077713          	andi	a4,a4,16
80003954:	02070863          	beqz	a4,80003984 <externalInterrupt+0x108>
80003958:	f0021737          	lui	a4,0xf0021
8000395c:	0000c6b7          	lui	a3,0xc
80003960:	00072623          	sw	zero,12(a4) # f002100c <_heap_end+0x7000f00c>
80003964:	35068693          	addi	a3,a3,848 # c350 <_stack_size+0xbb50>
80003968:	00d72823          	sw	a3,16(a4)
8000396c:	00100693          	li	a3,1
80003970:	00d72023          	sw	a3,0(a4)
80003974:	86d1aa23          	sw	a3,-1932(gp) # 800030b4 <events_modbus_rtu_poll>
80003978:	0047a703          	lw	a4,4(a5)
8000397c:	fef77713          	andi	a4,a4,-17
80003980:	00e7a223          	sw	a4,4(a5)
80003984:	f00607b7          	lui	a5,0xf0060
80003988:	0047a703          	lw	a4,4(a5) # f0060004 <_heap_end+0x7004e004>
8000398c:	02077713          	andi	a4,a4,32
80003990:	00070863          	beqz	a4,800039a0 <externalInterrupt+0x124>
80003994:	0047a703          	lw	a4,4(a5)
80003998:	fdf77713          	andi	a4,a4,-33
8000399c:	00e7a223          	sw	a4,4(a5)
800039a0:	00c12083          	lw	ra,12(sp)
800039a4:	00812403          	lw	s0,8(sp)
800039a8:	01010113          	addi	sp,sp,16
800039ac:	00008067          	ret
800039b0:	00072783          	lw	a5,0(a4)
800039b4:	0ff7f513          	andi	a0,a5,255
800039b8:	0ff7f693          	andi	a3,a5,255
800039bc:	00472783          	lw	a5,4(a4)
800039c0:	0107d793          	srli	a5,a5,0x10
800039c4:	0ff7f793          	andi	a5,a5,255
800039c8:	fe078ae3          	beqz	a5,800039bc <externalInterrupt+0x140>
800039cc:	00d72023          	sw	a3,0(a4)
800039d0:	00b51a63          	bne	a0,a1,800039e4 <externalInterrupt+0x168>
800039d4:	87c1a783          	lw	a5,-1924(gp) # 800030bc <uart_config_reset_counter>
800039d8:	00178793          	addi	a5,a5,1
800039dc:	86f1ae23          	sw	a5,-1924(gp) # 800030bc <uart_config_reset_counter>
800039e0:	ed1ff06f          	j	800038b0 <externalInterrupt+0x34>
800039e4:	8601ae23          	sw	zero,-1924(gp) # 800030bc <uart_config_reset_counter>
800039e8:	ec9ff06f          	j	800038b0 <externalInterrupt+0x34>

800039ec <crash>:
800039ec:	ff010113          	addi	sp,sp,-16
800039f0:	00812423          	sw	s0,8(sp)
800039f4:	00050593          	mv	a1,a0
800039f8:	8fc18513          	addi	a0,gp,-1796 # 8000313c <crash_str>
800039fc:	00112623          	sw	ra,12(sp)
80003a00:	bc1ff0ef          	jal	ra,800035c0 <to_hex>
80003a04:	80002537          	lui	a0,0x80002
80003a08:	22850513          	addi	a0,a0,552 # 80002228 <_heap_end+0xffff0228>
80003a0c:	22c020ef          	jal	ra,80005c38 <print_uart0>
80003a10:	8fc18513          	addi	a0,gp,-1796 # 8000313c <crash_str>
80003a14:	224020ef          	jal	ra,80005c38 <print_uart0>
80003a18:	00812403          	lw	s0,8(sp)
80003a1c:	00c12083          	lw	ra,12(sp)
80003a20:	80003537          	lui	a0,0x80003
80003a24:	81050513          	addi	a0,a0,-2032 # 80002810 <_heap_end+0xffff0810>
80003a28:	01010113          	addi	sp,sp,16
80003a2c:	20c0206f          	j	80005c38 <print_uart0>

80003a30 <irqCallback>:
80003a30:	88c1a783          	lw	a5,-1908(gp) # 800030cc <reg_irq_counter>
80003a34:	00178793          	addi	a5,a5,1
80003a38:	88f1a623          	sw	a5,-1908(gp) # 800030cc <reg_irq_counter>
80003a3c:	342027f3          	csrr	a5,mcause
80003a40:	0207d263          	bgez	a5,80003a64 <irqCallback+0x34>
80003a44:	00f7f793          	andi	a5,a5,15
80003a48:	00700713          	li	a4,7
80003a4c:	02e78063          	beq	a5,a4,80003a6c <irqCallback+0x3c>
80003a50:	00b00713          	li	a4,11
80003a54:	00e79463          	bne	a5,a4,80003a5c <irqCallback+0x2c>
80003a58:	e25ff06f          	j	8000387c <externalInterrupt>
80003a5c:	00200513          	li	a0,2
80003a60:	f8dff06f          	j	800039ec <crash>
80003a64:	00100513          	li	a0,1
80003a68:	ff9ff06f          	j	80003a60 <irqCallback+0x30>
80003a6c:	00008067          	ret

80003a70 <modbus_rtu_init>:
80003a70:	fe010113          	addi	sp,sp,-32
80003a74:	00112e23          	sw	ra,28(sp)
80003a78:	00812c23          	sw	s0,24(sp)
80003a7c:	f0011437          	lui	s0,0xf0011
80003a80:	00842783          	lw	a5,8(s0) # f0011008 <_heap_end+0x6ffff008>
80003a84:	9a41a583          	lw	a1,-1628(gp) # 800031e4 <active_config+0x18>
80003a88:	017d8537          	lui	a0,0x17d8
80003a8c:	84050513          	addi	a0,a0,-1984 # 17d7840 <_stack_size+0x17d7040>
80003a90:	00f12623          	sw	a5,12(sp)
80003a94:	0f9090ef          	jal	ra,8000d38c <__udivsi3>
80003a98:	00500593          	li	a1,5
80003a9c:	0f1090ef          	jal	ra,8000d38c <__udivsi3>
80003aa0:	fff50713          	addi	a4,a0,-1
80003aa4:	00e42423          	sw	a4,8(s0)
80003aa8:	00600693          	li	a3,6
80003aac:	00d42623          	sw	a3,12(s0)
80003ab0:	00c12783          	lw	a5,12(sp)
80003ab4:	80002537          	lui	a0,0x80002
80003ab8:	00000693          	li	a3,0
80003abc:	00000613          	li	a2,0
80003ac0:	00700593          	li	a1,7
80003ac4:	23850513          	addi	a0,a0,568 # 80002238 <_heap_end+0xffff0238>
80003ac8:	22d0a0ef          	jal	ra,8000e4f4 <iprintf>
80003acc:	f00b07b7          	lui	a5,0xf00b0
80003ad0:	0007a603          	lw	a2,0(a5) # f00b0000 <_heap_end+0x7009e000>
80003ad4:	0047a683          	lw	a3,4(a5)
80003ad8:	88c1a823          	sw	a2,-1904(gp) # 800030d0 <modbus_rtu_rx_timestamp>
80003adc:	01c12083          	lw	ra,28(sp)
80003ae0:	01812403          	lw	s0,24(sp)
80003ae4:	88d1aa23          	sw	a3,-1900(gp) # 800030d4 <modbus_rtu_rx_timestamp+0x4>
80003ae8:	8801ac23          	sw	zero,-1896(gp) # 800030d8 <modbus_rtu_rx_len>
80003aec:	02010113          	addi	sp,sp,32
80003af0:	00008067          	ret

80003af4 <modbus_rtu_poll>:
80003af4:	ef010113          	addi	sp,sp,-272
80003af8:	10812423          	sw	s0,264(sp)
80003afc:	8981a783          	lw	a5,-1896(gp) # 800030d8 <modbus_rtu_rx_len>
80003b00:	10112623          	sw	ra,268(sp)
80003b04:	10912223          	sw	s1,260(sp)
80003b08:	0a078e63          	beqz	a5,80003bc4 <modbus_rtu_poll+0xd0>
80003b0c:	f00b07b7          	lui	a5,0xf00b0
80003b10:	0047a803          	lw	a6,4(a5) # f00b0004 <_heap_end+0x7009e004>
80003b14:	0007a783          	lw	a5,0(a5)
80003b18:	8901a503          	lw	a0,-1904(gp) # 800030d0 <modbus_rtu_rx_timestamp>
80003b1c:	8941a583          	lw	a1,-1900(gp) # 800030d4 <modbus_rtu_rx_timestamp+0x4>
80003b20:	40a786b3          	sub	a3,a5,a0
80003b24:	00d7b733          	sltu	a4,a5,a3
80003b28:	40b807b3          	sub	a5,a6,a1
80003b2c:	00e79863          	bne	a5,a4,80003b3c <modbus_rtu_poll+0x48>
80003b30:	000027b7          	lui	a5,0x2
80003b34:	70f78793          	addi	a5,a5,1807 # 270f <_stack_size+0x1f0f>
80003b38:	08d7f663          	bgeu	a5,a3,80003bc4 <modbus_rtu_poll+0xd0>
80003b3c:	8981a583          	lw	a1,-1896(gp) # 800030d8 <modbus_rtu_rx_len>
80003b40:	80002537          	lui	a0,0x80002
80003b44:	29850513          	addi	a0,a0,664 # 80002298 <_heap_end+0xffff0298>
80003b48:	1ad0a0ef          	jal	ra,8000e4f4 <iprintf>
80003b4c:	8981a483          	lw	s1,-1896(gp) # 800030d8 <modbus_rtu_rx_len>
80003b50:	08000793          	li	a5,128
80003b54:	00048613          	mv	a2,s1
80003b58:	0097f463          	bgeu	a5,s1,80003b60 <modbus_rtu_poll+0x6c>
80003b5c:	08000613          	li	a2,128
80003b60:	90c18593          	addi	a1,gp,-1780 # 8000314c <modbus_rtu_rx_buf>
80003b64:	00010513          	mv	a0,sp
80003b68:	54c0a0ef          	jal	ra,8000e0b4 <memcpy>
80003b6c:	00048593          	mv	a1,s1
80003b70:	08010613          	addi	a2,sp,128
80003b74:	00010513          	mv	a0,sp
80003b78:	8801ac23          	sw	zero,-1896(gp) # 800030d8 <modbus_rtu_rx_len>
80003b7c:	519000ef          	jal	ra,80004894 <modbus_recv>
80003b80:	00050593          	mv	a1,a0
80003b84:	04050063          	beqz	a0,80003bc4 <modbus_rtu_poll+0xd0>
80003b88:	00000713          	li	a4,0
80003b8c:	f00116b7          	lui	a3,0xf0011
80003b90:	08010793          	addi	a5,sp,128
80003b94:	00e787b3          	add	a5,a5,a4
80003b98:	0007c603          	lbu	a2,0(a5)
80003b9c:	0046a783          	lw	a5,4(a3) # f0011004 <_heap_end+0x6ffff004>
80003ba0:	0107d793          	srli	a5,a5,0x10
80003ba4:	0ff7f793          	andi	a5,a5,255
80003ba8:	fe078ae3          	beqz	a5,80003b9c <modbus_rtu_poll+0xa8>
80003bac:	00c6a023          	sw	a2,0(a3)
80003bb0:	00170713          	addi	a4,a4,1
80003bb4:	fce59ee3          	bne	a1,a4,80003b90 <modbus_rtu_poll+0x9c>
80003bb8:	80002537          	lui	a0,0x80002
80003bbc:	2c850513          	addi	a0,a0,712 # 800022c8 <_heap_end+0xffff02c8>
80003bc0:	1350a0ef          	jal	ra,8000e4f4 <iprintf>
80003bc4:	10c12083          	lw	ra,268(sp)
80003bc8:	10812403          	lw	s0,264(sp)
80003bcc:	10412483          	lw	s1,260(sp)
80003bd0:	11010113          	addi	sp,sp,272
80003bd4:	00008067          	ret

80003bd8 <modbus_rtu_isr>:
80003bd8:	f7010113          	addi	sp,sp,-144
80003bdc:	08812423          	sw	s0,136(sp)
80003be0:	08912223          	sw	s1,132(sp)
80003be4:	08112623          	sw	ra,140(sp)
80003be8:	f00117b7          	lui	a5,0xf0011
80003bec:	0007a683          	lw	a3,0(a5) # f0011000 <_heap_end+0x6ffff000>
80003bf0:	8981a603          	lw	a2,-1896(gp) # 800030d8 <modbus_rtu_rx_len>
80003bf4:	0ff6f693          	andi	a3,a3,255
80003bf8:	00160793          	addi	a5,a2,1 # 80001 <_stack_size+0x7f801>
80003bfc:	88f1ac23          	sw	a5,-1896(gp) # 800030d8 <modbus_rtu_rx_len>
80003c00:	90c18713          	addi	a4,gp,-1780 # 8000314c <modbus_rtu_rx_buf>
80003c04:	00c70733          	add	a4,a4,a2
80003c08:	00d70023          	sb	a3,0(a4)
80003c0c:	8981a683          	lw	a3,-1896(gp) # 800030d8 <modbus_rtu_rx_len>
80003c10:	07f00713          	li	a4,127
80003c14:	90c18493          	addi	s1,gp,-1780 # 8000314c <modbus_rtu_rx_buf>
80003c18:	00d77463          	bgeu	a4,a3,80003c20 <modbus_rtu_isr+0x48>
80003c1c:	8801ac23          	sw	zero,-1896(gp) # 800030d8 <modbus_rtu_rx_len>
80003c20:	f0011737          	lui	a4,0xf0011
80003c24:	00472783          	lw	a5,4(a4) # f0011004 <_heap_end+0x6ffff004>
80003c28:	0187d793          	srli	a5,a5,0x18
80003c2c:	04078063          	beqz	a5,80003c6c <modbus_rtu_isr+0x94>
80003c30:	00472683          	lw	a3,4(a4)
80003c34:	8981a703          	lw	a4,-1896(gp) # 800030d8 <modbus_rtu_rx_len>
80003c38:	80002637          	lui	a2,0x80002
80003c3c:	0186d693          	srli	a3,a3,0x18
80003c40:	2f860613          	addi	a2,a2,760 # 800022f8 <_heap_end+0xffff02f8>
80003c44:	08000593          	li	a1,128
80003c48:	00010513          	mv	a0,sp
80003c4c:	2150a0ef          	jal	ra,8000e660 <sniprintf>
80003c50:	00010513          	mv	a0,sp
80003c54:	7e5010ef          	jal	ra,80005c38 <print_uart0>
80003c58:	f00116b7          	lui	a3,0xf0011
80003c5c:	07f00613          	li	a2,127
80003c60:	0046a783          	lw	a5,4(a3) # f0011004 <_heap_end+0x6ffff004>
80003c64:	0187d793          	srli	a5,a5,0x18
80003c68:	02079663          	bnez	a5,80003c94 <modbus_rtu_isr+0xbc>
80003c6c:	f00b07b7          	lui	a5,0xf00b0
80003c70:	0007a603          	lw	a2,0(a5) # f00b0000 <_heap_end+0x7009e000>
80003c74:	0047a683          	lw	a3,4(a5)
80003c78:	08c12083          	lw	ra,140(sp)
80003c7c:	08812403          	lw	s0,136(sp)
80003c80:	88c1a823          	sw	a2,-1904(gp) # 800030d0 <modbus_rtu_rx_timestamp>
80003c84:	88d1aa23          	sw	a3,-1900(gp) # 800030d4 <modbus_rtu_rx_timestamp+0x4>
80003c88:	08412483          	lw	s1,132(sp)
80003c8c:	09010113          	addi	sp,sp,144
80003c90:	00008067          	ret
80003c94:	0006a703          	lw	a4,0(a3)
80003c98:	8981a783          	lw	a5,-1896(gp) # 800030d8 <modbus_rtu_rx_len>
80003c9c:	0ff77713          	andi	a4,a4,255
80003ca0:	00178593          	addi	a1,a5,1
80003ca4:	88b1ac23          	sw	a1,-1896(gp) # 800030d8 <modbus_rtu_rx_len>
80003ca8:	00f487b3          	add	a5,s1,a5
80003cac:	00e78023          	sb	a4,0(a5)
80003cb0:	8981a783          	lw	a5,-1896(gp) # 800030d8 <modbus_rtu_rx_len>
80003cb4:	faf676e3          	bgeu	a2,a5,80003c60 <modbus_rtu_isr+0x88>
80003cb8:	8801ac23          	sw	zero,-1896(gp) # 800030d8 <modbus_rtu_rx_len>
80003cbc:	fa5ff06f          	j	80003c60 <modbus_rtu_isr+0x88>

80003cc0 <config_load>:
80003cc0:	0c050863          	beqz	a0,80003d90 <config_load+0xd0>
80003cc4:	fe010113          	addi	sp,sp,-32
80003cc8:	00812c23          	sw	s0,24(sp)
80003ccc:	00912a23          	sw	s1,20(sp)
80003cd0:	01212823          	sw	s2,16(sp)
80003cd4:	01312623          	sw	s3,12(sp)
80003cd8:	00112e23          	sw	ra,28(sp)
80003cdc:	00050413          	mv	s0,a0
80003ce0:	00050913          	mv	s2,a0
80003ce4:	00000493          	li	s1,0
80003ce8:	02000993          	li	s3,32
80003cec:	00090713          	mv	a4,s2
80003cf0:	00400693          	li	a3,4
80003cf4:	00048613          	mv	a2,s1
80003cf8:	05000593          	li	a1,80
80003cfc:	f0090537          	lui	a0,0xf0090
80003d00:	3fc000ef          	jal	ra,800040fc <eeprom_read_page>
80003d04:	00400793          	li	a5,4
80003d08:	02f50a63          	beq	a0,a5,80003d3c <config_load+0x7c>
80003d0c:	80002537          	lui	a0,0x80002
80003d10:	00400593          	li	a1,4
80003d14:	33050513          	addi	a0,a0,816 # 80002330 <_heap_end+0xffff0330>
80003d18:	7dc0a0ef          	jal	ra,8000e4f4 <iprintf>
80003d1c:	ffe00513          	li	a0,-2
80003d20:	01c12083          	lw	ra,28(sp)
80003d24:	01812403          	lw	s0,24(sp)
80003d28:	01412483          	lw	s1,20(sp)
80003d2c:	01012903          	lw	s2,16(sp)
80003d30:	00c12983          	lw	s3,12(sp)
80003d34:	02010113          	addi	sp,sp,32
80003d38:	00008067          	ret
80003d3c:	00448493          	addi	s1,s1,4
80003d40:	0ff4f493          	andi	s1,s1,255
80003d44:	00490913          	addi	s2,s2,4 # 90080004 <_heap_end+0x1006e004>
80003d48:	fb3492e3          	bne	s1,s3,80003cec <config_load+0x2c>
80003d4c:	01e00593          	li	a1,30
80003d50:	00040513          	mv	a0,s0
80003d54:	f98ff0ef          	jal	ra,800034ec <crc16>
80003d58:	01e45603          	lhu	a2,30(s0)
80003d5c:	00050593          	mv	a1,a0
80003d60:	00a60c63          	beq	a2,a0,80003d78 <config_load+0xb8>
80003d64:	80002537          	lui	a0,0x80002
80003d68:	36450513          	addi	a0,a0,868 # 80002364 <_heap_end+0xffff0364>
80003d6c:	7880a0ef          	jal	ra,8000e4f4 <iprintf>
80003d70:	ffd00513          	li	a0,-3
80003d74:	fadff06f          	j	80003d20 <config_load+0x60>
80003d78:	80002537          	lui	a0,0x80002
80003d7c:	02000593          	li	a1,32
80003d80:	39850513          	addi	a0,a0,920 # 80002398 <_heap_end+0xffff0398>
80003d84:	7700a0ef          	jal	ra,8000e4f4 <iprintf>
80003d88:	00000513          	li	a0,0
80003d8c:	f95ff06f          	j	80003d20 <config_load+0x60>
80003d90:	fff00513          	li	a0,-1
80003d94:	00008067          	ret

80003d98 <config_save>:
80003d98:	fe010113          	addi	sp,sp,-32
80003d9c:	00912a23          	sw	s1,20(sp)
80003da0:	00112e23          	sw	ra,28(sp)
80003da4:	00812c23          	sw	s0,24(sp)
80003da8:	01212823          	sw	s2,16(sp)
80003dac:	01312623          	sw	s3,12(sp)
80003db0:	01412423          	sw	s4,8(sp)
80003db4:	01512223          	sw	s5,4(sp)
80003db8:	fff00493          	li	s1,-1
80003dbc:	06050063          	beqz	a0,80003e1c <config_save+0x84>
80003dc0:	01e00593          	li	a1,30
80003dc4:	00050413          	mv	s0,a0
80003dc8:	f24ff0ef          	jal	ra,800034ec <crc16>
80003dcc:	00a41f23          	sh	a0,30(s0)
80003dd0:	00000913          	li	s2,0
80003dd4:	00000993          	li	s3,0
80003dd8:	00800a93          	li	s5,8
80003ddc:	01240733          	add	a4,s0,s2
80003de0:	00400693          	li	a3,4
80003de4:	0ff97613          	andi	a2,s2,255
80003de8:	05000593          	li	a1,80
80003dec:	f0090537          	lui	a0,0xf0090
80003df0:	0b8000ef          	jal	ra,80003ea8 <eeprom_write_page>
80003df4:	00400793          	li	a5,4
80003df8:	04f50663          	beq	a0,a5,80003e44 <config_save+0xac>
80003dfc:	80002537          	lui	a0,0x80002
80003e00:	00090713          	mv	a4,s2
80003e04:	00098693          	mv	a3,s3
80003e08:	00400613          	li	a2,4
80003e0c:	05000593          	li	a1,80
80003e10:	3d050513          	addi	a0,a0,976 # 800023d0 <_heap_end+0xffff03d0>
80003e14:	6e00a0ef          	jal	ra,8000e4f4 <iprintf>
80003e18:	ffe00493          	li	s1,-2
80003e1c:	01c12083          	lw	ra,28(sp)
80003e20:	01812403          	lw	s0,24(sp)
80003e24:	00048513          	mv	a0,s1
80003e28:	01012903          	lw	s2,16(sp)
80003e2c:	01412483          	lw	s1,20(sp)
80003e30:	00c12983          	lw	s3,12(sp)
80003e34:	00812a03          	lw	s4,8(sp)
80003e38:	00412a83          	lw	s5,4(sp)
80003e3c:	02010113          	addi	sp,sp,32
80003e40:	00008067          	ret
80003e44:	00a00a13          	li	s4,10
80003e48:	05000593          	li	a1,80
80003e4c:	f0090537          	lui	a0,0xf0090
80003e50:	228000ef          	jal	ra,80004078 <eeprom_poll>
80003e54:	00050493          	mv	s1,a0
80003e58:	02050663          	beqz	a0,80003e84 <config_save+0xec>
80003e5c:	3e800513          	li	a0,1000
80003e60:	fffa0a13          	addi	s4,s4,-1
80003e64:	5a5010ef          	jal	ra,80005c08 <delay_us>
80003e68:	fe0a10e3          	bnez	s4,80003e48 <config_save+0xb0>
80003e6c:	80002537          	lui	a0,0x80002
80003e70:	05000593          	li	a1,80
80003e74:	45050513          	addi	a0,a0,1104 # 80002450 <_heap_end+0xffff0450>
80003e78:	67c0a0ef          	jal	ra,8000e4f4 <iprintf>
80003e7c:	ffd00493          	li	s1,-3
80003e80:	f9dff06f          	j	80003e1c <config_save+0x84>
80003e84:	00198993          	addi	s3,s3,1
80003e88:	00490913          	addi	s2,s2,4
80003e8c:	f55998e3          	bne	s3,s5,80003ddc <config_save+0x44>
80003e90:	01e45603          	lhu	a2,30(s0)
80003e94:	80002537          	lui	a0,0x80002
80003e98:	02000593          	li	a1,32
80003e9c:	41850513          	addi	a0,a0,1048 # 80002418 <_heap_end+0xffff0418>
80003ea0:	6540a0ef          	jal	ra,8000e4f4 <iprintf>
80003ea4:	f79ff06f          	j	80003e1c <config_save+0x84>

80003ea8 <eeprom_write_page>:
80003ea8:	fe010113          	addi	sp,sp,-32
80003eac:	00812c23          	sw	s0,24(sp)
80003eb0:	00912a23          	sw	s1,20(sp)
80003eb4:	01212823          	sw	s2,16(sp)
80003eb8:	01412423          	sw	s4,8(sp)
80003ebc:	01512223          	sw	s5,4(sp)
80003ec0:	00112e23          	sw	ra,28(sp)
80003ec4:	01312623          	sw	s3,12(sp)
80003ec8:	01612023          	sw	s6,0(sp)
80003ecc:	01500793          	li	a5,21
80003ed0:	00159593          	slli	a1,a1,0x1
80003ed4:	00f52623          	sw	a5,12(a0)
80003ed8:	00018937          	lui	s2,0x18
80003edc:	00b52023          	sw	a1,0(a0)
80003ee0:	6a090593          	addi	a1,s2,1696 # 186a0 <_stack_size+0x17ea0>
80003ee4:	00050413          	mv	s0,a0
80003ee8:	00060493          	mv	s1,a2
80003eec:	00068a13          	mv	s4,a3
80003ef0:	00070a93          	mv	s5,a4
80003ef4:	48d010ef          	jal	ra,80005b80 <i2c_wait_for_busy>
80003ef8:	04051663          	bnez	a0,80003f44 <eeprom_write_page+0x9c>
80003efc:	00042623          	sw	zero,12(s0)
80003f00:	00100613          	li	a2,1
80003f04:	80002537          	lui	a0,0x80002
80003f08:	00040593          	mv	a1,s0
80003f0c:	48050513          	addi	a0,a0,1152 # 80002480 <_heap_end+0xffff0480>
80003f10:	5e40a0ef          	jal	ra,8000e4f4 <iprintf>
80003f14:	fff00493          	li	s1,-1
80003f18:	01c12083          	lw	ra,28(sp)
80003f1c:	01812403          	lw	s0,24(sp)
80003f20:	00048513          	mv	a0,s1
80003f24:	01012903          	lw	s2,16(sp)
80003f28:	01412483          	lw	s1,20(sp)
80003f2c:	00c12983          	lw	s3,12(sp)
80003f30:	00812a03          	lw	s4,8(sp)
80003f34:	00412a83          	lw	s5,4(sp)
80003f38:	00012b03          	lw	s6,0(sp)
80003f3c:	02010113          	addi	sp,sp,32
80003f40:	00008067          	ret
80003f44:	6a090593          	addi	a1,s2,1696
80003f48:	00040513          	mv	a0,s0
80003f4c:	461010ef          	jal	ra,80005bac <i2c_wait_for_release>
80003f50:	00051863          	bnez	a0,80003f60 <eeprom_write_page+0xb8>
80003f54:	00042623          	sw	zero,12(s0)
80003f58:	00200613          	li	a2,2
80003f5c:	fa9ff06f          	j	80003f04 <eeprom_write_page+0x5c>
80003f60:	00c42783          	lw	a5,12(s0)
80003f64:	0407f793          	andi	a5,a5,64
80003f68:	00078e63          	beqz	a5,80003f84 <eeprom_write_page+0xdc>
80003f6c:	00042623          	sw	zero,12(s0)
80003f70:	00100613          	li	a2,1
80003f74:	80002537          	lui	a0,0x80002
80003f78:	00040593          	mv	a1,s0
80003f7c:	4b050513          	addi	a0,a0,1200 # 800024b0 <_heap_end+0xffff04b0>
80003f80:	f91ff06f          	j	80003f10 <eeprom_write_page+0x68>
80003f84:	00200513          	li	a0,2
80003f88:	481010ef          	jal	ra,80005c08 <delay_us>
80003f8c:	01100793          	li	a5,17
80003f90:	00f42623          	sw	a5,12(s0)
80003f94:	00942023          	sw	s1,0(s0)
80003f98:	6a090593          	addi	a1,s2,1696
80003f9c:	00040513          	mv	a0,s0
80003fa0:	3e1010ef          	jal	ra,80005b80 <i2c_wait_for_busy>
80003fa4:	00051863          	bnez	a0,80003fb4 <eeprom_write_page+0x10c>
80003fa8:	00042623          	sw	zero,12(s0)
80003fac:	00300613          	li	a2,3
80003fb0:	f55ff06f          	j	80003f04 <eeprom_write_page+0x5c>
80003fb4:	6a090593          	addi	a1,s2,1696
80003fb8:	00040513          	mv	a0,s0
80003fbc:	3f1010ef          	jal	ra,80005bac <i2c_wait_for_release>
80003fc0:	00051863          	bnez	a0,80003fd0 <eeprom_write_page+0x128>
80003fc4:	00042623          	sw	zero,12(s0)
80003fc8:	00400613          	li	a2,4
80003fcc:	f39ff06f          	j	80003f04 <eeprom_write_page+0x5c>
80003fd0:	00c42783          	lw	a5,12(s0)
80003fd4:	00000993          	li	s3,0
80003fd8:	0407f793          	andi	a5,a5,64
80003fdc:	04079a63          	bnez	a5,80004030 <eeprom_write_page+0x188>
80003fe0:	000a0493          	mv	s1,s4
80003fe4:	fffa0b13          	addi	s6,s4,-1
80003fe8:	6a090913          	addi	s2,s2,1696
80003fec:	f349d6e3          	bge	s3,s4,80003f18 <eeprom_write_page+0x70>
80003ff0:	00200513          	li	a0,2
80003ff4:	415010ef          	jal	ra,80005c08 <delay_us>
80003ff8:	01100793          	li	a5,17
80003ffc:	013b1463          	bne	s6,s3,80004004 <eeprom_write_page+0x15c>
80004000:	01900793          	li	a5,25
80004004:	013a8733          	add	a4,s5,s3
80004008:	00074703          	lbu	a4,0(a4)
8000400c:	00f42623          	sw	a5,12(s0)
80004010:	00090593          	mv	a1,s2
80004014:	00e42023          	sw	a4,0(s0)
80004018:	00040513          	mv	a0,s0
8000401c:	365010ef          	jal	ra,80005b80 <i2c_wait_for_busy>
80004020:	00051e63          	bnez	a0,8000403c <eeprom_write_page+0x194>
80004024:	00042623          	sw	zero,12(s0)
80004028:	00500613          	li	a2,5
8000402c:	ed9ff06f          	j	80003f04 <eeprom_write_page+0x5c>
80004030:	00042623          	sw	zero,12(s0)
80004034:	00200613          	li	a2,2
80004038:	f3dff06f          	j	80003f74 <eeprom_write_page+0xcc>
8000403c:	00090593          	mv	a1,s2
80004040:	00040513          	mv	a0,s0
80004044:	369010ef          	jal	ra,80005bac <i2c_wait_for_release>
80004048:	00051863          	bnez	a0,80004058 <eeprom_write_page+0x1b0>
8000404c:	00042623          	sw	zero,12(s0)
80004050:	00600613          	li	a2,6
80004054:	eb1ff06f          	j	80003f04 <eeprom_write_page+0x5c>
80004058:	00c42783          	lw	a5,12(s0)
8000405c:	0407f793          	andi	a5,a5,64
80004060:	00078863          	beqz	a5,80004070 <eeprom_write_page+0x1c8>
80004064:	00042623          	sw	zero,12(s0)
80004068:	00300613          	li	a2,3
8000406c:	f09ff06f          	j	80003f74 <eeprom_write_page+0xcc>
80004070:	00198993          	addi	s3,s3,1
80004074:	f79ff06f          	j	80003fec <eeprom_write_page+0x144>

80004078 <eeprom_poll>:
80004078:	ff010113          	addi	sp,sp,-16
8000407c:	00812423          	sw	s0,8(sp)
80004080:	00912223          	sw	s1,4(sp)
80004084:	00112623          	sw	ra,12(sp)
80004088:	01d00793          	li	a5,29
8000408c:	00159593          	slli	a1,a1,0x1
80004090:	00f52623          	sw	a5,12(a0)
80004094:	000184b7          	lui	s1,0x18
80004098:	00b52023          	sw	a1,0(a0)
8000409c:	6a048593          	addi	a1,s1,1696 # 186a0 <_stack_size+0x17ea0>
800040a0:	00050413          	mv	s0,a0
800040a4:	2dd010ef          	jal	ra,80005b80 <i2c_wait_for_busy>
800040a8:	00100613          	li	a2,1
800040ac:	00050c63          	beqz	a0,800040c4 <eeprom_poll+0x4c>
800040b0:	6a048593          	addi	a1,s1,1696
800040b4:	00040513          	mv	a0,s0
800040b8:	2f5010ef          	jal	ra,80005bac <i2c_wait_for_release>
800040bc:	02051863          	bnez	a0,800040ec <eeprom_poll+0x74>
800040c0:	00200613          	li	a2,2
800040c4:	80002537          	lui	a0,0x80002
800040c8:	00040593          	mv	a1,s0
800040cc:	4e050513          	addi	a0,a0,1248 # 800024e0 <_heap_end+0xffff04e0>
800040d0:	4240a0ef          	jal	ra,8000e4f4 <iprintf>
800040d4:	fff00513          	li	a0,-1
800040d8:	00c12083          	lw	ra,12(sp)
800040dc:	00812403          	lw	s0,8(sp)
800040e0:	00412483          	lw	s1,4(sp)
800040e4:	01010113          	addi	sp,sp,16
800040e8:	00008067          	ret
800040ec:	00c42503          	lw	a0,12(s0)
800040f0:	00655513          	srli	a0,a0,0x6
800040f4:	00157513          	andi	a0,a0,1
800040f8:	fe1ff06f          	j	800040d8 <eeprom_poll+0x60>

800040fc <eeprom_read_page>:
800040fc:	fd010113          	addi	sp,sp,-48
80004100:	02812423          	sw	s0,40(sp)
80004104:	02912223          	sw	s1,36(sp)
80004108:	03212023          	sw	s2,32(sp)
8000410c:	01312e23          	sw	s3,28(sp)
80004110:	01412c23          	sw	s4,24(sp)
80004114:	01512a23          	sw	s5,20(sp)
80004118:	01612823          	sw	s6,16(sp)
8000411c:	02112623          	sw	ra,44(sp)
80004120:	01712623          	sw	s7,12(sp)
80004124:	01500993          	li	s3,21
80004128:	00159493          	slli	s1,a1,0x1
8000412c:	01352623          	sw	s3,12(a0)
80004130:	00018937          	lui	s2,0x18
80004134:	00952023          	sw	s1,0(a0)
80004138:	6a090593          	addi	a1,s2,1696 # 186a0 <_stack_size+0x17ea0>
8000413c:	00050413          	mv	s0,a0
80004140:	00060b13          	mv	s6,a2
80004144:	00068a13          	mv	s4,a3
80004148:	00070a93          	mv	s5,a4
8000414c:	235010ef          	jal	ra,80005b80 <i2c_wait_for_busy>
80004150:	00051e63          	bnez	a0,8000416c <eeprom_read_page+0x70>
80004154:	00042623          	sw	zero,12(s0)
80004158:	00100613          	li	a2,1
8000415c:	80002537          	lui	a0,0x80002
80004160:	00040593          	mv	a1,s0
80004164:	50850513          	addi	a0,a0,1288 # 80002508 <_heap_end+0xffff0508>
80004168:	0400006f          	j	800041a8 <eeprom_read_page+0xac>
8000416c:	6a090593          	addi	a1,s2,1696
80004170:	00040513          	mv	a0,s0
80004174:	239010ef          	jal	ra,80005bac <i2c_wait_for_release>
80004178:	00051863          	bnez	a0,80004188 <eeprom_read_page+0x8c>
8000417c:	00042623          	sw	zero,12(s0)
80004180:	00200613          	li	a2,2
80004184:	fd9ff06f          	j	8000415c <eeprom_read_page+0x60>
80004188:	00c42783          	lw	a5,12(s0)
8000418c:	0407f793          	andi	a5,a5,64
80004190:	04078863          	beqz	a5,800041e0 <eeprom_read_page+0xe4>
80004194:	00042623          	sw	zero,12(s0)
80004198:	00100613          	li	a2,1
8000419c:	80002537          	lui	a0,0x80002
800041a0:	00040593          	mv	a1,s0
800041a4:	53850513          	addi	a0,a0,1336 # 80002538 <_heap_end+0xffff0538>
800041a8:	34c0a0ef          	jal	ra,8000e4f4 <iprintf>
800041ac:	fff00493          	li	s1,-1
800041b0:	02c12083          	lw	ra,44(sp)
800041b4:	02812403          	lw	s0,40(sp)
800041b8:	00048513          	mv	a0,s1
800041bc:	02012903          	lw	s2,32(sp)
800041c0:	02412483          	lw	s1,36(sp)
800041c4:	01c12983          	lw	s3,28(sp)
800041c8:	01812a03          	lw	s4,24(sp)
800041cc:	01412a83          	lw	s5,20(sp)
800041d0:	01012b03          	lw	s6,16(sp)
800041d4:	00c12b83          	lw	s7,12(sp)
800041d8:	03010113          	addi	sp,sp,48
800041dc:	00008067          	ret
800041e0:	00200513          	li	a0,2
800041e4:	225010ef          	jal	ra,80005c08 <delay_us>
800041e8:	01900793          	li	a5,25
800041ec:	00f42623          	sw	a5,12(s0)
800041f0:	01642023          	sw	s6,0(s0)
800041f4:	6a090593          	addi	a1,s2,1696
800041f8:	00040513          	mv	a0,s0
800041fc:	185010ef          	jal	ra,80005b80 <i2c_wait_for_busy>
80004200:	00051863          	bnez	a0,80004210 <eeprom_read_page+0x114>
80004204:	00042623          	sw	zero,12(s0)
80004208:	00300613          	li	a2,3
8000420c:	f51ff06f          	j	8000415c <eeprom_read_page+0x60>
80004210:	6a090593          	addi	a1,s2,1696
80004214:	00040513          	mv	a0,s0
80004218:	195010ef          	jal	ra,80005bac <i2c_wait_for_release>
8000421c:	00051863          	bnez	a0,8000422c <eeprom_read_page+0x130>
80004220:	00042623          	sw	zero,12(s0)
80004224:	00400613          	li	a2,4
80004228:	f35ff06f          	j	8000415c <eeprom_read_page+0x60>
8000422c:	00c42783          	lw	a5,12(s0)
80004230:	0407f793          	andi	a5,a5,64
80004234:	00078863          	beqz	a5,80004244 <eeprom_read_page+0x148>
80004238:	00042623          	sw	zero,12(s0)
8000423c:	00200613          	li	a2,2
80004240:	f5dff06f          	j	8000419c <eeprom_read_page+0xa0>
80004244:	00200513          	li	a0,2
80004248:	1c1010ef          	jal	ra,80005c08 <delay_us>
8000424c:	0014e493          	ori	s1,s1,1
80004250:	01342623          	sw	s3,12(s0)
80004254:	00942023          	sw	s1,0(s0)
80004258:	6a090593          	addi	a1,s2,1696
8000425c:	00040513          	mv	a0,s0
80004260:	121010ef          	jal	ra,80005b80 <i2c_wait_for_busy>
80004264:	00051863          	bnez	a0,80004274 <eeprom_read_page+0x178>
80004268:	00042623          	sw	zero,12(s0)
8000426c:	00500613          	li	a2,5
80004270:	eedff06f          	j	8000415c <eeprom_read_page+0x60>
80004274:	6a090593          	addi	a1,s2,1696
80004278:	00040513          	mv	a0,s0
8000427c:	131010ef          	jal	ra,80005bac <i2c_wait_for_release>
80004280:	00051863          	bnez	a0,80004290 <eeprom_read_page+0x194>
80004284:	00042623          	sw	zero,12(s0)
80004288:	00600613          	li	a2,6
8000428c:	ed1ff06f          	j	8000415c <eeprom_read_page+0x60>
80004290:	00c42783          	lw	a5,12(s0)
80004294:	00000993          	li	s3,0
80004298:	0407f793          	andi	a5,a5,64
8000429c:	04079863          	bnez	a5,800042ec <eeprom_read_page+0x1f0>
800042a0:	000a0493          	mv	s1,s4
800042a4:	fffa0b13          	addi	s6,s4,-1
800042a8:	0ff00b93          	li	s7,255
800042ac:	6a090913          	addi	s2,s2,1696
800042b0:	f149d0e3          	bge	s3,s4,800041b0 <eeprom_read_page+0xb4>
800042b4:	00200513          	li	a0,2
800042b8:	151010ef          	jal	ra,80005c08 <delay_us>
800042bc:	02100793          	li	a5,33
800042c0:	013b1463          	bne	s6,s3,800042c8 <eeprom_read_page+0x1cc>
800042c4:	00900793          	li	a5,9
800042c8:	00f42623          	sw	a5,12(s0)
800042cc:	01742023          	sw	s7,0(s0)
800042d0:	00090593          	mv	a1,s2
800042d4:	00040513          	mv	a0,s0
800042d8:	0a9010ef          	jal	ra,80005b80 <i2c_wait_for_busy>
800042dc:	00051e63          	bnez	a0,800042f8 <eeprom_read_page+0x1fc>
800042e0:	00042623          	sw	zero,12(s0)
800042e4:	00700613          	li	a2,7
800042e8:	e75ff06f          	j	8000415c <eeprom_read_page+0x60>
800042ec:	00042623          	sw	zero,12(s0)
800042f0:	00300613          	li	a2,3
800042f4:	ea9ff06f          	j	8000419c <eeprom_read_page+0xa0>
800042f8:	00090593          	mv	a1,s2
800042fc:	00040513          	mv	a0,s0
80004300:	0ad010ef          	jal	ra,80005bac <i2c_wait_for_release>
80004304:	00051863          	bnez	a0,80004314 <eeprom_read_page+0x218>
80004308:	00042623          	sw	zero,12(s0)
8000430c:	00800613          	li	a2,8
80004310:	e4dff06f          	j	8000415c <eeprom_read_page+0x60>
80004314:	00442703          	lw	a4,4(s0)
80004318:	013a87b3          	add	a5,s5,s3
8000431c:	00198993          	addi	s3,s3,1
80004320:	00e78023          	sb	a4,0(a5)
80004324:	f8dff06f          	j	800042b0 <eeprom_read_page+0x1b4>

80004328 <eeprom_probe>:
80004328:	fe010113          	addi	sp,sp,-32
8000432c:	00912a23          	sw	s1,20(sp)
80004330:	00050493          	mv	s1,a0
80004334:	80002537          	lui	a0,0x80002
80004338:	05000593          	li	a1,80
8000433c:	56450513          	addi	a0,a0,1380 # 80002564 <_heap_end+0xffff0564>
80004340:	00112e23          	sw	ra,28(sp)
80004344:	01212823          	sw	s2,16(sp)
80004348:	00812c23          	sw	s0,24(sp)
8000434c:	1a80a0ef          	jal	ra,8000e4f4 <iprintf>
80004350:	deadc7b7          	lui	a5,0xdeadc
80004354:	eef78793          	addi	a5,a5,-273 # deadbeef <_heap_end+0x5eac9eef>
80004358:	00c10713          	addi	a4,sp,12
8000435c:	00400693          	li	a3,4
80004360:	07c00613          	li	a2,124
80004364:	05000593          	li	a1,80
80004368:	00048513          	mv	a0,s1
8000436c:	00f12623          	sw	a5,12(sp)
80004370:	b39ff0ef          	jal	ra,80003ea8 <eeprom_write_page>
80004374:	00400793          	li	a5,4
80004378:	00a00913          	li	s2,10
8000437c:	00f50c63          	beq	a0,a5,80004394 <eeprom_probe+0x6c>
80004380:	80002537          	lui	a0,0x80002
80004384:	05000593          	li	a1,80
80004388:	58050513          	addi	a0,a0,1408 # 80002580 <_heap_end+0xffff0580>
8000438c:	1680a0ef          	jal	ra,8000e4f4 <iprintf>
80004390:	0580006f          	j	800043e8 <eeprom_probe+0xc0>
80004394:	05000593          	li	a1,80
80004398:	00048513          	mv	a0,s1
8000439c:	cddff0ef          	jal	ra,80004078 <eeprom_poll>
800043a0:	00050413          	mv	s0,a0
800043a4:	06050a63          	beqz	a0,80004418 <eeprom_probe+0xf0>
800043a8:	3e800513          	li	a0,1000
800043ac:	fff90913          	addi	s2,s2,-1
800043b0:	059010ef          	jal	ra,80005c08 <delay_us>
800043b4:	fe0910e3          	bnez	s2,80004394 <eeprom_probe+0x6c>
800043b8:	80002537          	lui	a0,0x80002
800043bc:	05000593          	li	a1,80
800043c0:	62450513          	addi	a0,a0,1572 # 80002624 <_heap_end+0xffff0624>
800043c4:	fc9ff06f          	j	8000438c <eeprom_probe+0x64>
800043c8:	00c12603          	lw	a2,12(sp)
800043cc:	deadc7b7          	lui	a5,0xdeadc
800043d0:	eef78793          	addi	a5,a5,-273 # deadbeef <_heap_end+0x5eac9eef>
800043d4:	05000593          	li	a1,80
800043d8:	00f60c63          	beq	a2,a5,800043f0 <eeprom_probe+0xc8>
800043dc:	80002537          	lui	a0,0x80002
800043e0:	5d850513          	addi	a0,a0,1496 # 800025d8 <_heap_end+0xffff05d8>
800043e4:	1100a0ef          	jal	ra,8000e4f4 <iprintf>
800043e8:	fff00413          	li	s0,-1
800043ec:	0100006f          	j	800043fc <eeprom_probe+0xd4>
800043f0:	80002537          	lui	a0,0x80002
800043f4:	60c50513          	addi	a0,a0,1548 # 8000260c <_heap_end+0xffff060c>
800043f8:	0fc0a0ef          	jal	ra,8000e4f4 <iprintf>
800043fc:	00040513          	mv	a0,s0
80004400:	01c12083          	lw	ra,28(sp)
80004404:	01812403          	lw	s0,24(sp)
80004408:	01412483          	lw	s1,20(sp)
8000440c:	01012903          	lw	s2,16(sp)
80004410:	02010113          	addi	sp,sp,32
80004414:	00008067          	ret
80004418:	00c10713          	addi	a4,sp,12
8000441c:	00400693          	li	a3,4
80004420:	07c00613          	li	a2,124
80004424:	05000593          	li	a1,80
80004428:	00048513          	mv	a0,s1
8000442c:	00012623          	sw	zero,12(sp)
80004430:	ccdff0ef          	jal	ra,800040fc <eeprom_read_page>
80004434:	00400793          	li	a5,4
80004438:	f8f508e3          	beq	a0,a5,800043c8 <eeprom_probe+0xa0>
8000443c:	80002537          	lui	a0,0x80002
80004440:	05000593          	li	a1,80
80004444:	5ac50513          	addi	a0,a0,1452 # 800025ac <_heap_end+0xffff05ac>
80004448:	f45ff06f          	j	8000438c <eeprom_probe+0x64>

8000444c <modbus_error>:
8000444c:	ff010113          	addi	sp,sp,-16
80004450:	00812423          	sw	s0,8(sp)
80004454:	00912223          	sw	s1,4(sp)
80004458:	01212023          	sw	s2,0(sp)
8000445c:	00060413          	mv	s0,a2
80004460:	00058913          	mv	s2,a1
80004464:	00058613          	mv	a2,a1
80004468:	00050493          	mv	s1,a0
8000446c:	00050593          	mv	a1,a0
80004470:	80002537          	lui	a0,0x80002
80004474:	69850513          	addi	a0,a0,1688 # 80002698 <_heap_end+0xffff0698>
80004478:	00112623          	sw	ra,12(sp)
8000447c:	0780a0ef          	jal	ra,8000e4f4 <iprintf>
80004480:	9a01c783          	lbu	a5,-1632(gp) # 800031e0 <active_config+0x14>
80004484:	f804e493          	ori	s1,s1,-128
80004488:	009400a3          	sb	s1,1(s0)
8000448c:	01240123          	sb	s2,2(s0)
80004490:	00040513          	mv	a0,s0
80004494:	00f40023          	sb	a5,0(s0)
80004498:	00300593          	li	a1,3
8000449c:	8a8ff0ef          	jal	ra,80003544 <add_crc>
800044a0:	00c12083          	lw	ra,12(sp)
800044a4:	00812403          	lw	s0,8(sp)
800044a8:	00412483          	lw	s1,4(sp)
800044ac:	00012903          	lw	s2,0(sp)
800044b0:	00500513          	li	a0,5
800044b4:	01010113          	addi	sp,sp,16
800044b8:	00008067          	ret

800044bc <modbus_store_reg>:
800044bc:	fd850793          	addi	a5,a0,-40
800044c0:	fd010113          	addi	sp,sp,-48
800044c4:	01079793          	slli	a5,a5,0x10
800044c8:	02912223          	sw	s1,36(sp)
800044cc:	02112623          	sw	ra,44(sp)
800044d0:	02812423          	sw	s0,40(sp)
800044d4:	0107d793          	srli	a5,a5,0x10
800044d8:	00900713          	li	a4,9
800044dc:	00058493          	mv	s1,a1
800044e0:	02f76063          	bltu	a4,a5,80004500 <modbus_store_reg+0x44>
800044e4:	8801a783          	lw	a5,-1920(gp) # 800030c0 <reg_config_write>
800044e8:	00079c63          	bnez	a5,80004500 <modbus_store_reg+0x44>
800044ec:	80002537          	lui	a0,0x80002
800044f0:	6bc50513          	addi	a0,a0,1724 # 800026bc <_heap_end+0xffff06bc>
800044f4:	0000a0ef          	jal	ra,8000e4f4 <iprintf>
800044f8:	ffe00413          	li	s0,-2
800044fc:	0300006f          	j	8000452c <modbus_store_reg+0x70>
80004500:	02f00793          	li	a5,47
80004504:	34f50e63          	beq	a0,a5,80004860 <modbus_store_reg+0x3a4>
80004508:	0aa7e063          	bltu	a5,a0,800045a8 <modbus_store_reg+0xec>
8000450c:	02a00793          	li	a5,42
80004510:	2ef50863          	beq	a0,a5,80004800 <modbus_store_reg+0x344>
80004514:	02a7e863          	bltu	a5,a0,80004544 <modbus_store_reg+0x88>
80004518:	02000793          	li	a5,32
8000451c:	18f50c63          	beq	a0,a5,800046b4 <modbus_store_reg+0x1f8>
80004520:	02900793          	li	a5,41
80004524:	2af50463          	beq	a0,a5,800047cc <modbus_store_reg+0x310>
80004528:	fff00413          	li	s0,-1
8000452c:	00040513          	mv	a0,s0
80004530:	02c12083          	lw	ra,44(sp)
80004534:	02812403          	lw	s0,40(sp)
80004538:	02412483          	lw	s1,36(sp)
8000453c:	03010113          	addi	sp,sp,48
80004540:	00008067          	ret
80004544:	02c00793          	li	a5,44
80004548:	20f50e63          	beq	a0,a5,80004764 <modbus_store_reg+0x2a8>
8000454c:	2ef56263          	bltu	a0,a5,80004830 <modbus_store_reg+0x374>
80004550:	02d00793          	li	a5,45
80004554:	fcf51ae3          	bne	a0,a5,80004528 <modbus_store_reg+0x6c>
80004558:	00010513          	mv	a0,sp
8000455c:	f64ff0ef          	jal	ra,80003cc0 <config_load>
80004560:	00055c63          	bgez	a0,80004578 <modbus_store_reg+0xbc>
80004564:	800035b7          	lui	a1,0x80003
80004568:	02000613          	li	a2,32
8000456c:	fb058593          	addi	a1,a1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
80004570:	00010513          	mv	a0,sp
80004574:	341090ef          	jal	ra,8000e0b4 <memcpy>
80004578:	0004c783          	lbu	a5,0(s1)
8000457c:	0014c703          	lbu	a4,1(s1)
80004580:	01879793          	slli	a5,a5,0x18
80004584:	01071713          	slli	a4,a4,0x10
80004588:	00e7e7b3          	or	a5,a5,a4
8000458c:	0034c703          	lbu	a4,3(s1)
80004590:	00e7e7b3          	or	a5,a5,a4
80004594:	0024c703          	lbu	a4,2(s1)
80004598:	00871713          	slli	a4,a4,0x8
8000459c:	00e7e7b3          	or	a5,a5,a4
800045a0:	00f12c23          	sw	a5,24(sp)
800045a4:	1e80006f          	j	8000478c <modbus_store_reg+0x2d0>
800045a8:	03300793          	li	a5,51
800045ac:	0cf50e63          	beq	a0,a5,80004688 <modbus_store_reg+0x1cc>
800045b0:	0aa7e863          	bltu	a5,a0,80004660 <modbus_store_reg+0x1a4>
800045b4:	03100793          	li	a5,49
800045b8:	1ef50463          	beq	a0,a5,800047a0 <modbus_store_reg+0x2e4>
800045bc:	16a7f063          	bgeu	a5,a0,8000471c <modbus_store_reg+0x260>
800045c0:	0014c783          	lbu	a5,1(s1)
800045c4:	0004c503          	lbu	a0,0(s1)
800045c8:	0024c583          	lbu	a1,2(s1)
800045cc:	00879793          	slli	a5,a5,0x8
800045d0:	00a7e7b3          	or	a5,a5,a0
800045d4:	00879513          	slli	a0,a5,0x8
800045d8:	0087d793          	srli	a5,a5,0x8
800045dc:	00f567b3          	or	a5,a0,a5
800045e0:	01079513          	slli	a0,a5,0x10
800045e4:	0034c783          	lbu	a5,3(s1)
800045e8:	0044c703          	lbu	a4,4(s1)
800045ec:	01055513          	srli	a0,a0,0x10
800045f0:	00879793          	slli	a5,a5,0x8
800045f4:	00b7e7b3          	or	a5,a5,a1
800045f8:	00879593          	slli	a1,a5,0x8
800045fc:	0087d793          	srli	a5,a5,0x8
80004600:	00f5e7b3          	or	a5,a1,a5
80004604:	01079593          	slli	a1,a5,0x10
80004608:	0054c783          	lbu	a5,5(s1)
8000460c:	0105d593          	srli	a1,a1,0x10
80004610:	ffd00413          	li	s0,-3
80004614:	00879793          	slli	a5,a5,0x8
80004618:	00e7e7b3          	or	a5,a5,a4
8000461c:	00879713          	slli	a4,a5,0x8
80004620:	0087d793          	srli	a5,a5,0x8
80004624:	00f767b3          	or	a5,a4,a5
80004628:	01079793          	slli	a5,a5,0x10
8000462c:	0107d793          	srli	a5,a5,0x10
80004630:	ffa60713          	addi	a4,a2,-6
80004634:	ee060ce3          	beqz	a2,8000452c <modbus_store_reg+0x70>
80004638:	800036b7          	lui	a3,0x80003
8000463c:	0406a603          	lw	a2,64(a3) # 80003040 <_heap_end+0xffff1040>
80004640:	00648693          	addi	a3,s1,6
80004644:	04079e63          	bnez	a5,800046a0 <modbus_store_reg+0x1e4>
80004648:	800007b7          	lui	a5,0x80000
8000464c:	00800893          	li	a7,8
80004650:	00600813          	li	a6,6
80004654:	13478793          	addi	a5,a5,308 # 80000134 <_heap_end+0xfffee134>
80004658:	168010ef          	jal	ra,800057c0 <hub_print>
8000465c:	03c0006f          	j	80004698 <modbus_store_reg+0x1dc>
80004660:	07e00793          	li	a5,126
80004664:	08f50063          	beq	a0,a5,800046e4 <modbus_store_reg+0x228>
80004668:	07f00793          	li	a5,127
8000466c:	0af50463          	beq	a0,a5,80004714 <modbus_store_reg+0x258>
80004670:	03400793          	li	a5,52
80004674:	eaf51ae3          	bne	a0,a5,80004528 <modbus_store_reg+0x6c>
80004678:	0034c703          	lbu	a4,3(s1)
8000467c:	800037b7          	lui	a5,0x80003
80004680:	04e7a023          	sw	a4,64(a5) # 80003040 <_heap_end+0xffff1040>
80004684:	0140006f          	j	80004698 <modbus_store_reg+0x1dc>
80004688:	8b81a603          	lw	a2,-1864(gp) # 800030f8 <hub_frame_size>
8000468c:	00000593          	li	a1,0
80004690:	f0050537          	lui	a0,0xf0050
80004694:	5e8080ef          	jal	ra,8000cc7c <memset>
80004698:	00000413          	li	s0,0
8000469c:	e91ff06f          	j	8000452c <modbus_store_reg+0x70>
800046a0:	800007b7          	lui	a5,0x80000
800046a4:	01000893          	li	a7,16
800046a8:	00c00813          	li	a6,12
800046ac:	73478793          	addi	a5,a5,1844 # 80000734 <_heap_end+0xfffee734>
800046b0:	fa9ff06f          	j	80004658 <modbus_store_reg+0x19c>
800046b4:	0004c783          	lbu	a5,0(s1)
800046b8:	0014c703          	lbu	a4,1(s1)
800046bc:	01879793          	slli	a5,a5,0x18
800046c0:	01071713          	slli	a4,a4,0x10
800046c4:	00e7e7b3          	or	a5,a5,a4
800046c8:	0034c703          	lbu	a4,3(s1)
800046cc:	00e7e7b3          	or	a5,a5,a4
800046d0:	0024c703          	lbu	a4,2(s1)
800046d4:	00871713          	slli	a4,a4,0x8
800046d8:	00e7e7b3          	or	a5,a5,a4
800046dc:	88f1a223          	sw	a5,-1916(gp) # 800030c4 <reg_scratch>
800046e0:	fb9ff06f          	j	80004698 <modbus_store_reg+0x1dc>
800046e4:	0004c783          	lbu	a5,0(s1)
800046e8:	0014c703          	lbu	a4,1(s1)
800046ec:	01879793          	slli	a5,a5,0x18
800046f0:	01071713          	slli	a4,a4,0x10
800046f4:	00e7e7b3          	or	a5,a5,a4
800046f8:	0034c703          	lbu	a4,3(s1)
800046fc:	00e7e7b3          	or	a5,a5,a4
80004700:	0024c703          	lbu	a4,2(s1)
80004704:	00871713          	slli	a4,a4,0x8
80004708:	00e7e7b3          	or	a5,a5,a4
8000470c:	88f1a023          	sw	a5,-1920(gp) # 800030c0 <reg_config_write>
80004710:	f89ff06f          	j	80004698 <modbus_store_reg+0x1dc>
80004714:	660010ef          	jal	ra,80005d74 <hard_reboot>
80004718:	f81ff06f          	j	80004698 <modbus_store_reg+0x1dc>
8000471c:	0034c503          	lbu	a0,3(s1)
80004720:	475000ef          	jal	ra,80005394 <hub_init>
80004724:	00050413          	mv	s0,a0
80004728:	dc0518e3          	bnez	a0,800044f8 <modbus_store_reg+0x3c>
8000472c:	00010513          	mv	a0,sp
80004730:	d90ff0ef          	jal	ra,80003cc0 <config_load>
80004734:	00055c63          	bgez	a0,8000474c <modbus_store_reg+0x290>
80004738:	800035b7          	lui	a1,0x80003
8000473c:	02000613          	li	a2,32
80004740:	fb058593          	addi	a1,a1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
80004744:	00010513          	mv	a0,sp
80004748:	16d090ef          	jal	ra,8000e0b4 <memcpy>
8000474c:	0034c783          	lbu	a5,3(s1)
80004750:	00010513          	mv	a0,sp
80004754:	00f109a3          	sb	a5,19(sp)
80004758:	e40ff0ef          	jal	ra,80003d98 <config_save>
8000475c:	dc0558e3          	bgez	a0,8000452c <modbus_store_reg+0x70>
80004760:	d99ff06f          	j	800044f8 <modbus_store_reg+0x3c>
80004764:	00010513          	mv	a0,sp
80004768:	d58ff0ef          	jal	ra,80003cc0 <config_load>
8000476c:	00055c63          	bgez	a0,80004784 <modbus_store_reg+0x2c8>
80004770:	800035b7          	lui	a1,0x80003
80004774:	02000613          	li	a2,32
80004778:	fb058593          	addi	a1,a1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
8000477c:	00010513          	mv	a0,sp
80004780:	135090ef          	jal	ra,8000e0b4 <memcpy>
80004784:	0034c783          	lbu	a5,3(s1)
80004788:	00f10a23          	sb	a5,20(sp)
8000478c:	00010513          	mv	a0,sp
80004790:	e08ff0ef          	jal	ra,80003d98 <config_save>
80004794:	41f55513          	srai	a0,a0,0x1f
80004798:	ffe57413          	andi	s0,a0,-2
8000479c:	d91ff06f          	j	8000452c <modbus_store_reg+0x70>
800047a0:	00010513          	mv	a0,sp
800047a4:	d1cff0ef          	jal	ra,80003cc0 <config_load>
800047a8:	00055c63          	bgez	a0,800047c0 <modbus_store_reg+0x304>
800047ac:	800035b7          	lui	a1,0x80003
800047b0:	02000613          	li	a2,32
800047b4:	fb058593          	addi	a1,a1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
800047b8:	00010513          	mv	a0,sp
800047bc:	0f9090ef          	jal	ra,8000e0b4 <memcpy>
800047c0:	0034c783          	lbu	a5,3(s1)
800047c4:	00f10623          	sb	a5,12(sp)
800047c8:	fc5ff06f          	j	8000478c <modbus_store_reg+0x2d0>
800047cc:	00010513          	mv	a0,sp
800047d0:	cf0ff0ef          	jal	ra,80003cc0 <config_load>
800047d4:	00055c63          	bgez	a0,800047ec <modbus_store_reg+0x330>
800047d8:	800035b7          	lui	a1,0x80003
800047dc:	02000613          	li	a2,32
800047e0:	fb058593          	addi	a1,a1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
800047e4:	00010513          	mv	a0,sp
800047e8:	0cd090ef          	jal	ra,8000e0b4 <memcpy>
800047ec:	00400613          	li	a2,4
800047f0:	00348593          	addi	a1,s1,3
800047f4:	00010513          	mv	a0,sp
800047f8:	5b0010ef          	jal	ra,80005da8 <memcpy_rev>
800047fc:	f91ff06f          	j	8000478c <modbus_store_reg+0x2d0>
80004800:	00010513          	mv	a0,sp
80004804:	cbcff0ef          	jal	ra,80003cc0 <config_load>
80004808:	00055c63          	bgez	a0,80004820 <modbus_store_reg+0x364>
8000480c:	800035b7          	lui	a1,0x80003
80004810:	02000613          	li	a2,32
80004814:	fb058593          	addi	a1,a1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
80004818:	00010513          	mv	a0,sp
8000481c:	099090ef          	jal	ra,8000e0b4 <memcpy>
80004820:	00400613          	li	a2,4
80004824:	00348593          	addi	a1,s1,3
80004828:	00410513          	addi	a0,sp,4
8000482c:	fcdff06f          	j	800047f8 <modbus_store_reg+0x33c>
80004830:	00010513          	mv	a0,sp
80004834:	c8cff0ef          	jal	ra,80003cc0 <config_load>
80004838:	00055c63          	bgez	a0,80004850 <modbus_store_reg+0x394>
8000483c:	800035b7          	lui	a1,0x80003
80004840:	02000613          	li	a2,32
80004844:	fb058593          	addi	a1,a1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
80004848:	00010513          	mv	a0,sp
8000484c:	069090ef          	jal	ra,8000e0b4 <memcpy>
80004850:	00400613          	li	a2,4
80004854:	00348593          	addi	a1,s1,3
80004858:	00810513          	addi	a0,sp,8
8000485c:	f9dff06f          	j	800047f8 <modbus_store_reg+0x33c>
80004860:	00010513          	mv	a0,sp
80004864:	c5cff0ef          	jal	ra,80003cc0 <config_load>
80004868:	00055c63          	bgez	a0,80004880 <modbus_store_reg+0x3c4>
8000486c:	800035b7          	lui	a1,0x80003
80004870:	02000613          	li	a2,32
80004874:	fb058593          	addi	a1,a1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
80004878:	00010513          	mv	a0,sp
8000487c:	039090ef          	jal	ra,8000e0b4 <memcpy>
80004880:	00600613          	li	a2,6
80004884:	00048593          	mv	a1,s1
80004888:	00d10513          	addi	a0,sp,13
8000488c:	029090ef          	jal	ra,8000e0b4 <memcpy>
80004890:	efdff06f          	j	8000478c <modbus_store_reg+0x2d0>

80004894 <modbus_recv>:
80004894:	fb010113          	addi	sp,sp,-80
80004898:	04812423          	sw	s0,72(sp)
8000489c:	04112623          	sw	ra,76(sp)
800048a0:	04912223          	sw	s1,68(sp)
800048a4:	05212023          	sw	s2,64(sp)
800048a8:	03312e23          	sw	s3,60(sp)
800048ac:	03412c23          	sw	s4,56(sp)
800048b0:	03512a23          	sw	s5,52(sp)
800048b4:	03612823          	sw	s6,48(sp)
800048b8:	03712623          	sw	s7,44(sp)
800048bc:	03812423          	sw	s8,40(sp)
800048c0:	fff00413          	li	s0,-1
800048c4:	12050063          	beqz	a0,800049e4 <modbus_recv+0x150>
800048c8:	10060e63          	beqz	a2,800049e4 <modbus_recv+0x150>
800048cc:	00400793          	li	a5,4
800048d0:	10b7da63          	bge	a5,a1,800049e4 <modbus_recv+0x150>
800048d4:	00058a93          	mv	s5,a1
800048d8:	ffe58593          	addi	a1,a1,-2
800048dc:	01059593          	slli	a1,a1,0x10
800048e0:	0105d593          	srli	a1,a1,0x10
800048e4:	00050a13          	mv	s4,a0
800048e8:	00060493          	mv	s1,a2
800048ec:	c01fe0ef          	jal	ra,800034ec <crc16>
800048f0:	015a07b3          	add	a5,s4,s5
800048f4:	fff7c603          	lbu	a2,-1(a5)
800048f8:	ffe7c783          	lbu	a5,-2(a5)
800048fc:	00050593          	mv	a1,a0
80004900:	00861613          	slli	a2,a2,0x8
80004904:	00f66633          	or	a2,a2,a5
80004908:	40c51e63          	bne	a0,a2,80004d24 <modbus_recv+0x490>
8000490c:	98c18713          	addi	a4,gp,-1652 # 800031cc <active_config>
80004910:	000a4583          	lbu	a1,0(s4)
80004914:	01474603          	lbu	a2,20(a4)
80004918:	001a4903          	lbu	s2,1(s4)
8000491c:	98c18b13          	addi	s6,gp,-1652 # 800031cc <active_config>
80004920:	00c58863          	beq	a1,a2,80004930 <modbus_recv+0x9c>
80004924:	3e059663          	bnez	a1,80004d10 <modbus_recv+0x47c>
80004928:	01100793          	li	a5,17
8000492c:	3ef91263          	bne	s2,a5,80004d10 <modbus_recv+0x47c>
80004930:	002a4403          	lbu	s0,2(s4)
80004934:	003a4783          	lbu	a5,3(s4)
80004938:	08000613          	li	a2,128
8000493c:	00841413          	slli	s0,s0,0x8
80004940:	00f46433          	or	s0,s0,a5
80004944:	00000593          	li	a1,0
80004948:	00048513          	mv	a0,s1
8000494c:	01041413          	slli	s0,s0,0x10
80004950:	004a4983          	lbu	s3,4(s4)
80004954:	005a4c03          	lbu	s8,5(s4)
80004958:	324080ef          	jal	ra,8000cc7c <memset>
8000495c:	014b4783          	lbu	a5,20(s6)
80004960:	41045413          	srai	s0,s0,0x10
80004964:	01041b93          	slli	s7,s0,0x10
80004968:	010bdb93          	srli	s7,s7,0x10
8000496c:	80002537          	lui	a0,0x80002
80004970:	00f48023          	sb	a5,0(s1)
80004974:	012480a3          	sb	s2,1(s1)
80004978:	000b8613          	mv	a2,s7
8000497c:	00090593          	mv	a1,s2
80004980:	6fc50513          	addi	a0,a0,1788 # 800026fc <_heap_end+0xffff06fc>
80004984:	371090ef          	jal	ra,8000e4f4 <iprintf>
80004988:	fff90793          	addi	a5,s2,-1
8000498c:	0ff7f793          	andi	a5,a5,255
80004990:	01000713          	li	a4,16
80004994:	36f76863          	bltu	a4,a5,80004d04 <modbus_recv+0x470>
80004998:	80002737          	lui	a4,0x80002
8000499c:	00279793          	slli	a5,a5,0x2
800049a0:	65470713          	addi	a4,a4,1620 # 80002654 <_heap_end+0xffff0654>
800049a4:	00e787b3          	add	a5,a5,a4
800049a8:	0007a783          	lw	a5,0(a5)
800049ac:	00078067          	jr	a5
800049b0:	800026b7          	lui	a3,0x80002
800049b4:	800025b7          	lui	a1,0x80002
800049b8:	72068693          	addi	a3,a3,1824 # 80002720 <_heap_end+0xffff0720>
800049bc:	01800613          	li	a2,24
800049c0:	72c58593          	addi	a1,a1,1836 # 8000272c <_heap_end+0xffff072c>
800049c4:	00348513          	addi	a0,s1,3
800049c8:	5b5090ef          	jal	ra,8000e77c <siprintf>
800049cc:	02700793          	li	a5,39
800049d0:	00f48123          	sb	a5,2(s1)
800049d4:	02a00593          	li	a1,42
800049d8:	00048513          	mv	a0,s1
800049dc:	b69fe0ef          	jal	ra,80003544 <add_crc>
800049e0:	02c00413          	li	s0,44
800049e4:	00040513          	mv	a0,s0
800049e8:	04c12083          	lw	ra,76(sp)
800049ec:	04812403          	lw	s0,72(sp)
800049f0:	04412483          	lw	s1,68(sp)
800049f4:	04012903          	lw	s2,64(sp)
800049f8:	03c12983          	lw	s3,60(sp)
800049fc:	03812a03          	lw	s4,56(sp)
80004a00:	03412a83          	lw	s5,52(sp)
80004a04:	03012b03          	lw	s6,48(sp)
80004a08:	02c12b83          	lw	s7,44(sp)
80004a0c:	02812c03          	lw	s8,40(sp)
80004a10:	05010113          	addi	sp,sp,80
80004a14:	00008067          	ret
80004a18:	00899993          	slli	s3,s3,0x8
80004a1c:	0189e9b3          	or	s3,s3,s8
80004a20:	01099993          	slli	s3,s3,0x10
80004a24:	4109d993          	srai	s3,s3,0x10
80004a28:	00100793          	li	a5,1
80004a2c:	00048613          	mv	a2,s1
80004a30:	2cf99063          	bne	s3,a5,80004cf0 <modbus_recv+0x45c>
80004a34:	02c00793          	li	a5,44
80004a38:	20f40c63          	beq	s0,a5,80004c50 <modbus_recv+0x3bc>
80004a3c:	0887c063          	blt	a5,s0,80004abc <modbus_recv+0x228>
80004a40:	02000793          	li	a5,32
80004a44:	14f40e63          	beq	s0,a5,80004ba0 <modbus_recv+0x30c>
80004a48:	0287c663          	blt	a5,s0,80004a74 <modbus_recv+0x1e0>
80004a4c:	01e00793          	li	a5,30
80004a50:	0ef40e63          	beq	s0,a5,80004b4c <modbus_recv+0x2b8>
80004a54:	01f00793          	li	a5,31
80004a58:	12f40e63          	beq	s0,a5,80004b94 <modbus_recv+0x300>
80004a5c:	00048613          	mv	a2,s1
80004a60:	00200593          	li	a1,2
80004a64:	00090513          	mv	a0,s2
80004a68:	9e5ff0ef          	jal	ra,8000444c <modbus_error>
80004a6c:	00050413          	mv	s0,a0
80004a70:	0f00006f          	j	80004b60 <modbus_recv+0x2cc>
80004a74:	02a00793          	li	a5,42
80004a78:	14f40863          	beq	s0,a5,80004bc8 <modbus_recv+0x334>
80004a7c:	1687cc63          	blt	a5,s0,80004bf4 <modbus_recv+0x360>
80004a80:	02900793          	li	a5,41
80004a84:	fcf41ce3          	bne	s0,a5,80004a5c <modbus_recv+0x1c8>
80004a88:	00010513          	mv	a0,sp
80004a8c:	a34ff0ef          	jal	ra,80003cc0 <config_load>
80004a90:	00055c63          	bgez	a0,80004aa8 <modbus_recv+0x214>
80004a94:	800035b7          	lui	a1,0x80003
80004a98:	02000613          	li	a2,32
80004a9c:	fb058593          	addi	a1,a1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
80004aa0:	00010513          	mv	a0,sp
80004aa4:	610090ef          	jal	ra,8000e0b4 <memcpy>
80004aa8:	00400613          	li	a2,4
80004aac:	00010593          	mv	a1,sp
80004ab0:	00348513          	addi	a0,s1,3
80004ab4:	600090ef          	jal	ra,8000e0b4 <memcpy>
80004ab8:	0a40006f          	j	80004b5c <modbus_recv+0x2c8>
80004abc:	03000793          	li	a5,48
80004ac0:	16f40063          	beq	s0,a5,80004c20 <modbus_recv+0x38c>
80004ac4:	0487c463          	blt	a5,s0,80004b0c <modbus_recv+0x278>
80004ac8:	02d00793          	li	a5,45
80004acc:	1af40663          	beq	s0,a5,80004c78 <modbus_recv+0x3e4>
80004ad0:	02f00793          	li	a5,47
80004ad4:	f8f414e3          	bne	s0,a5,80004a5c <modbus_recv+0x1c8>
80004ad8:	00010513          	mv	a0,sp
80004adc:	9e4ff0ef          	jal	ra,80003cc0 <config_load>
80004ae0:	00055c63          	bgez	a0,80004af8 <modbus_recv+0x264>
80004ae4:	800035b7          	lui	a1,0x80003
80004ae8:	02000613          	li	a2,32
80004aec:	fb058593          	addi	a1,a1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
80004af0:	00010513          	mv	a0,sp
80004af4:	5c0090ef          	jal	ra,8000e0b4 <memcpy>
80004af8:	00600613          	li	a2,6
80004afc:	00d10593          	addi	a1,sp,13
80004b00:	00348513          	addi	a0,s1,3
80004b04:	5b0090ef          	jal	ra,8000e0b4 <memcpy>
80004b08:	1400006f          	j	80004c48 <modbus_recv+0x3b4>
80004b0c:	03400793          	li	a5,52
80004b10:	0af40463          	beq	s0,a5,80004bb8 <modbus_recv+0x324>
80004b14:	07e00793          	li	a5,126
80004b18:	08f40a63          	beq	s0,a5,80004bac <modbus_recv+0x318>
80004b1c:	03100793          	li	a5,49
80004b20:	f2f41ee3          	bne	s0,a5,80004a5c <modbus_recv+0x1c8>
80004b24:	00010513          	mv	a0,sp
80004b28:	998ff0ef          	jal	ra,80003cc0 <config_load>
80004b2c:	00055c63          	bgez	a0,80004b44 <modbus_recv+0x2b0>
80004b30:	800035b7          	lui	a1,0x80003
80004b34:	02000613          	li	a2,32
80004b38:	fb058593          	addi	a1,a1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
80004b3c:	00010513          	mv	a0,sp
80004b40:	574090ef          	jal	ra,8000e0b4 <memcpy>
80004b44:	00c14783          	lbu	a5,12(sp)
80004b48:	0fc0006f          	j	80004c44 <modbus_recv+0x3b0>
80004b4c:	00400613          	li	a2,4
80004b50:	88b18593          	addi	a1,gp,-1909 # 800030cb <reg_sys_counter+0x3>
80004b54:	00348513          	addi	a0,s1,3
80004b58:	250010ef          	jal	ra,80005da8 <memcpy_rev>
80004b5c:	00400413          	li	s0,4
80004b60:	00340593          	addi	a1,s0,3
80004b64:	01059593          	slli	a1,a1,0x10
80004b68:	00848123          	sb	s0,2(s1)
80004b6c:	0105d593          	srli	a1,a1,0x10
80004b70:	00048513          	mv	a0,s1
80004b74:	9d1fe0ef          	jal	ra,80003544 <add_crc>
80004b78:	00540413          	addi	s0,s0,5
80004b7c:	e60414e3          	bnez	s0,800049e4 <modbus_recv+0x150>
80004b80:	80002537          	lui	a0,0x80002
80004b84:	00090593          	mv	a1,s2
80004b88:	74c50513          	addi	a0,a0,1868 # 8000274c <_heap_end+0xffff074c>
80004b8c:	169090ef          	jal	ra,8000e4f4 <iprintf>
80004b90:	e55ff06f          	j	800049e4 <modbus_recv+0x150>
80004b94:	00400613          	li	a2,4
80004b98:	88f18593          	addi	a1,gp,-1905 # 800030cf <reg_irq_counter+0x3>
80004b9c:	fb9ff06f          	j	80004b54 <modbus_recv+0x2c0>
80004ba0:	00400613          	li	a2,4
80004ba4:	88718593          	addi	a1,gp,-1913 # 800030c7 <reg_scratch+0x3>
80004ba8:	fadff06f          	j	80004b54 <modbus_recv+0x2c0>
80004bac:	00400613          	li	a2,4
80004bb0:	88318593          	addi	a1,gp,-1917 # 800030c3 <reg_config_write+0x3>
80004bb4:	fa1ff06f          	j	80004b54 <modbus_recv+0x2c0>
80004bb8:	800035b7          	lui	a1,0x80003
80004bbc:	00400613          	li	a2,4
80004bc0:	04358593          	addi	a1,a1,67 # 80003043 <_heap_end+0xffff1043>
80004bc4:	f91ff06f          	j	80004b54 <modbus_recv+0x2c0>
80004bc8:	00010513          	mv	a0,sp
80004bcc:	8f4ff0ef          	jal	ra,80003cc0 <config_load>
80004bd0:	00055c63          	bgez	a0,80004be8 <modbus_recv+0x354>
80004bd4:	800035b7          	lui	a1,0x80003
80004bd8:	02000613          	li	a2,32
80004bdc:	fb058593          	addi	a1,a1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
80004be0:	00010513          	mv	a0,sp
80004be4:	4d0090ef          	jal	ra,8000e0b4 <memcpy>
80004be8:	00400613          	li	a2,4
80004bec:	00410593          	addi	a1,sp,4
80004bf0:	ec1ff06f          	j	80004ab0 <modbus_recv+0x21c>
80004bf4:	00010513          	mv	a0,sp
80004bf8:	8c8ff0ef          	jal	ra,80003cc0 <config_load>
80004bfc:	00055c63          	bgez	a0,80004c14 <modbus_recv+0x380>
80004c00:	800035b7          	lui	a1,0x80003
80004c04:	02000613          	li	a2,32
80004c08:	fb058593          	addi	a1,a1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
80004c0c:	00010513          	mv	a0,sp
80004c10:	4a4090ef          	jal	ra,8000e0b4 <memcpy>
80004c14:	00400613          	li	a2,4
80004c18:	00810593          	addi	a1,sp,8
80004c1c:	e95ff06f          	j	80004ab0 <modbus_recv+0x21c>
80004c20:	00010513          	mv	a0,sp
80004c24:	89cff0ef          	jal	ra,80003cc0 <config_load>
80004c28:	00055c63          	bgez	a0,80004c40 <modbus_recv+0x3ac>
80004c2c:	800035b7          	lui	a1,0x80003
80004c30:	02000613          	li	a2,32
80004c34:	fb058593          	addi	a1,a1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
80004c38:	00010513          	mv	a0,sp
80004c3c:	478090ef          	jal	ra,8000e0b4 <memcpy>
80004c40:	01314783          	lbu	a5,19(sp)
80004c44:	00f48323          	sb	a5,6(s1)
80004c48:	00600413          	li	s0,6
80004c4c:	f15ff06f          	j	80004b60 <modbus_recv+0x2cc>
80004c50:	00010513          	mv	a0,sp
80004c54:	86cff0ef          	jal	ra,80003cc0 <config_load>
80004c58:	00055c63          	bgez	a0,80004c70 <modbus_recv+0x3dc>
80004c5c:	800035b7          	lui	a1,0x80003
80004c60:	02000613          	li	a2,32
80004c64:	fb058593          	addi	a1,a1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
80004c68:	00010513          	mv	a0,sp
80004c6c:	448090ef          	jal	ra,8000e0b4 <memcpy>
80004c70:	01414783          	lbu	a5,20(sp)
80004c74:	fd1ff06f          	j	80004c44 <modbus_recv+0x3b0>
80004c78:	00010513          	mv	a0,sp
80004c7c:	844ff0ef          	jal	ra,80003cc0 <config_load>
80004c80:	00055c63          	bgez	a0,80004c98 <modbus_recv+0x404>
80004c84:	800035b7          	lui	a1,0x80003
80004c88:	02000613          	li	a2,32
80004c8c:	fb058593          	addi	a1,a1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
80004c90:	00010513          	mv	a0,sp
80004c94:	420090ef          	jal	ra,8000e0b4 <memcpy>
80004c98:	00400613          	li	a2,4
80004c9c:	01b10593          	addi	a1,sp,27
80004ca0:	e61ff06f          	j	80004b00 <modbus_recv+0x26c>
80004ca4:	00400613          	li	a2,4
80004ca8:	002a0593          	addi	a1,s4,2
80004cac:	00248513          	addi	a0,s1,2
80004cb0:	404090ef          	jal	ra,8000e0b4 <memcpy>
80004cb4:	00600593          	li	a1,6
80004cb8:	00048513          	mv	a0,s1
80004cbc:	889fe0ef          	jal	ra,80003544 <add_crc>
80004cc0:	00800413          	li	s0,8
80004cc4:	d21ff06f          	j	800049e4 <modbus_recv+0x150>
80004cc8:	ff7a8613          	addi	a2,s5,-9
80004ccc:	0ff67613          	andi	a2,a2,255
80004cd0:	007a0593          	addi	a1,s4,7
80004cd4:	000b8513          	mv	a0,s7
80004cd8:	fe4ff0ef          	jal	ra,800044bc <modbus_store_reg>
80004cdc:	fc0554e3          	bgez	a0,80004ca4 <modbus_recv+0x410>
80004ce0:	ffe00793          	li	a5,-2
80004ce4:	00048613          	mv	a2,s1
80004ce8:	00700593          	li	a1,7
80004cec:	00f50463          	beq	a0,a5,80004cf4 <modbus_recv+0x460>
80004cf0:	00300593          	li	a1,3
80004cf4:	00090513          	mv	a0,s2
80004cf8:	f54ff0ef          	jal	ra,8000444c <modbus_error>
80004cfc:	00050413          	mv	s0,a0
80004d00:	e7dff06f          	j	80004b7c <modbus_recv+0x2e8>
80004d04:	00048613          	mv	a2,s1
80004d08:	00100593          	li	a1,1
80004d0c:	fe9ff06f          	j	80004cf4 <modbus_recv+0x460>
80004d10:	80002537          	lui	a0,0x80002
80004d14:	77c50513          	addi	a0,a0,1916 # 8000277c <_heap_end+0xffff077c>
80004d18:	7dc090ef          	jal	ra,8000e4f4 <iprintf>
80004d1c:	00000413          	li	s0,0
80004d20:	cc5ff06f          	j	800049e4 <modbus_recv+0x150>
80004d24:	80002537          	lui	a0,0x80002
80004d28:	7bc50513          	addi	a0,a0,1980 # 800027bc <_heap_end+0xffff07bc>
80004d2c:	fedff06f          	j	80004d18 <modbus_recv+0x484>

80004d30 <mac_init>:
80004d30:	ff010113          	addi	sp,sp,-16
80004d34:	00112623          	sw	ra,12(sp)
80004d38:	00812423          	sw	s0,8(sp)
80004d3c:	02051263          	bnez	a0,80004d60 <mac_init+0x30>
80004d40:	80002537          	lui	a0,0x80002
80004d44:	7f450513          	addi	a0,a0,2036 # 800027f4 <_heap_end+0xffff07f4>
80004d48:	7ac090ef          	jal	ra,8000e4f4 <iprintf>
80004d4c:	ff000513          	li	a0,-16
80004d50:	00c12083          	lw	ra,12(sp)
80004d54:	00812403          	lw	s0,8(sp)
80004d58:	01010113          	addi	sp,sp,16
80004d5c:	00008067          	ret
80004d60:	800035b7          	lui	a1,0x80003
80004d64:	00050413          	mv	s0,a0
80004d68:	00500613          	li	a2,5
80004d6c:	81458593          	addi	a1,a1,-2028 # 80002814 <_heap_end+0xffff0814>
80004d70:	03650513          	addi	a0,a0,54
80004d74:	340090ef          	jal	ra,8000e0b4 <memcpy>
80004d78:	8000b7b7          	lui	a5,0x8000b
80004d7c:	45c78793          	addi	a5,a5,1116 # 8000b45c <_heap_end+0xffff945c>
80004d80:	00f42a23          	sw	a5,20(s0)
80004d84:	800057b7          	lui	a5,0x80005
80004d88:	de478793          	addi	a5,a5,-540 # 80004de4 <_heap_end+0xffff2de4>
80004d8c:	00f42c23          	sw	a5,24(s0)
80004d90:	00600613          	li	a2,6
80004d94:	99918593          	addi	a1,gp,-1639 # 800031d9 <active_config+0xd>
80004d98:	02e40513          	addi	a0,s0,46
80004d9c:	318090ef          	jal	ra,8000e0b4 <memcpy>
80004da0:	5dc00793          	li	a5,1500
80004da4:	02f41623          	sh	a5,44(s0)
80004da8:	000017b7          	lui	a5,0x1
80004dac:	e0678793          	addi	a5,a5,-506 # e06 <_stack_size+0x606>
80004db0:	02f41a23          	sh	a5,52(s0)
80004db4:	00002537          	lui	a0,0x2
80004db8:	01100793          	li	a5,17
80004dbc:	f0070437          	lui	s0,0xf0070
80004dc0:	00f42023          	sw	a5,0(s0) # f0070000 <_heap_end+0x7005e000>
80004dc4:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
80004dc8:	641000ef          	jal	ra,80005c08 <delay_us>
80004dcc:	80003537          	lui	a0,0x80003
80004dd0:	00042023          	sw	zero,0(s0)
80004dd4:	81c50513          	addi	a0,a0,-2020 # 8000281c <_heap_end+0xffff081c>
80004dd8:	71c090ef          	jal	ra,8000e4f4 <iprintf>
80004ddc:	00000513          	li	a0,0
80004de0:	f71ff06f          	j	80004d50 <mac_init+0x20>

80004de4 <mac_tx_packet>:
80004de4:	00050463          	beqz	a0,80004dec <mac_tx_packet+0x8>
80004de8:	00059e63          	bnez	a1,80004e04 <mac_tx_packet+0x20>
80004dec:	f0000737          	lui	a4,0xf0000
80004df0:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
80004df4:	ff000513          	li	a0,-16
80004df8:	0027e793          	ori	a5,a5,2
80004dfc:	00f72223          	sw	a5,4(a4)
80004e00:	00008067          	ret
80004e04:	ff010113          	addi	sp,sp,-16
80004e08:	00812423          	sw	s0,8(sp)
80004e0c:	00058413          	mv	s0,a1
80004e10:	00040513          	mv	a0,s0
80004e14:	ffe00593          	li	a1,-2
80004e18:	00112623          	sw	ra,12(sp)
80004e1c:	1d4020ef          	jal	ra,80006ff0 <pbuf_header>
80004e20:	00040713          	mv	a4,s0
80004e24:	00000793          	li	a5,0
80004e28:	00a75683          	lhu	a3,10(a4)
80004e2c:	00072703          	lw	a4,0(a4)
80004e30:	00d787b3          	add	a5,a5,a3
80004e34:	fe071ae3          	bnez	a4,80004e28 <mac_tx_packet+0x44>
80004e38:	00379793          	slli	a5,a5,0x3
80004e3c:	f00706b7          	lui	a3,0xf0070
80004e40:	0006a703          	lw	a4,0(a3) # f0070000 <_heap_end+0x7005e000>
80004e44:	00277713          	andi	a4,a4,2
80004e48:	fe070ce3          	beqz	a4,80004e40 <mac_tx_packet+0x5c>
80004e4c:	f0070737          	lui	a4,0xf0070
80004e50:	01472683          	lw	a3,20(a4) # f0070014 <_heap_end+0x7005e014>
80004e54:	fe068ee3          	beqz	a3,80004e50 <mac_tx_packet+0x6c>
80004e58:	00f72823          	sw	a5,16(a4)
80004e5c:	00040693          	mv	a3,s0
80004e60:	00000713          	li	a4,0
80004e64:	00000793          	li	a5,0
80004e68:	00300893          	li	a7,3
80004e6c:	f0070837          	lui	a6,0xf0070
80004e70:	0046a603          	lw	a2,4(a3)
80004e74:	00a6d583          	lhu	a1,10(a3)
80004e78:	00b605b3          	add	a1,a2,a1
80004e7c:	04c59863          	bne	a1,a2,80004ecc <mac_tx_packet+0xe8>
80004e80:	0006a683          	lw	a3,0(a3)
80004e84:	fe0696e3          	bnez	a3,80004e70 <mac_tx_packet+0x8c>
80004e88:	00078a63          	beqz	a5,80004e9c <mac_tx_packet+0xb8>
80004e8c:	f00707b7          	lui	a5,0xf0070
80004e90:	0147a683          	lw	a3,20(a5) # f0070014 <_heap_end+0x7005e014>
80004e94:	fe068ee3          	beqz	a3,80004e90 <mac_tx_packet+0xac>
80004e98:	00e7a823          	sw	a4,16(a5)
80004e9c:	00040513          	mv	a0,s0
80004ea0:	00200593          	li	a1,2
80004ea4:	14c020ef          	jal	ra,80006ff0 <pbuf_header>
80004ea8:	a0418793          	addi	a5,gp,-1532 # 80003244 <lwip_stats>
80004eac:	0007a703          	lw	a4,0(a5)
80004eb0:	00000513          	li	a0,0
80004eb4:	00170713          	addi	a4,a4,1
80004eb8:	00e7a023          	sw	a4,0(a5)
80004ebc:	00c12083          	lw	ra,12(sp)
80004ec0:	00812403          	lw	s0,8(sp)
80004ec4:	01010113          	addi	sp,sp,16
80004ec8:	00008067          	ret
80004ecc:	00064503          	lbu	a0,0(a2)
80004ed0:	00379313          	slli	t1,a5,0x3
80004ed4:	00651533          	sll	a0,a0,t1
80004ed8:	00a76733          	or	a4,a4,a0
80004edc:	01179a63          	bne	a5,a7,80004ef0 <mac_tx_packet+0x10c>
80004ee0:	01482503          	lw	a0,20(a6) # f0070014 <_heap_end+0x7005e014>
80004ee4:	fe050ee3          	beqz	a0,80004ee0 <mac_tx_packet+0xfc>
80004ee8:	00e82823          	sw	a4,16(a6)
80004eec:	00000713          	li	a4,0
80004ef0:	00178793          	addi	a5,a5,1
80004ef4:	0037f793          	andi	a5,a5,3
80004ef8:	00160613          	addi	a2,a2,1
80004efc:	f81ff06f          	j	80004e7c <mac_tx_packet+0x98>

80004f00 <sys_now>:
80004f00:	ff010113          	addi	sp,sp,-16
80004f04:	00112623          	sw	ra,12(sp)
80004f08:	f00b07b7          	lui	a5,0xf00b0
80004f0c:	0007a503          	lw	a0,0(a5) # f00b0000 <_heap_end+0x7009e000>
80004f10:	0047a583          	lw	a1,4(a5)
80004f14:	3e800613          	li	a2,1000
80004f18:	00000693          	li	a3,0
80004f1c:	671070ef          	jal	ra,8000cd8c <__udivdi3>
80004f20:	00c12083          	lw	ra,12(sp)
80004f24:	01010113          	addi	sp,sp,16
80004f28:	00008067          	ret

80004f2c <sys_arch_protect>:
80004f2c:	00008067          	ret

80004f30 <sys_arch_unprotect>:
80004f30:	00008067          	ret

80004f34 <mac_lwip_init>:
80004f34:	ff010113          	addi	sp,sp,-16
80004f38:	00112623          	sw	ra,12(sp)
80004f3c:	00812423          	sw	s0,8(sp)
80004f40:	00912223          	sw	s1,4(sp)
80004f44:	689000ef          	jal	ra,80005dcc <lwip_init>
80004f48:	fb9ff0ef          	jal	ra,80004f00 <sys_now>
80004f4c:	8aa1a223          	sw	a0,-1884(gp) # 800030e4 <ts_ipreass>
80004f50:	8aa1a623          	sw	a0,-1876(gp) # 800030ec <ts_etharp>
80004f54:	8000d837          	lui	a6,0x8000d
80004f58:	800057b7          	lui	a5,0x80005
80004f5c:	a4080813          	addi	a6,a6,-1472 # 8000ca40 <_heap_end+0xffffaa40>
80004f60:	d3078793          	addi	a5,a5,-720 # 80004d30 <_heap_end+0xffff2d30>
80004f64:	00000713          	li	a4,0
80004f68:	99018693          	addi	a3,gp,-1648 # 800031d0 <active_config+0x4>
80004f6c:	99418613          	addi	a2,gp,-1644 # 800031d4 <active_config+0x8>
80004f70:	98c18593          	addi	a1,gp,-1652 # 800031cc <active_config>
80004f74:	9ac18513          	addi	a0,gp,-1620 # 800031ec <default_netif>
80004f78:	219010ef          	jal	ra,80006990 <netif_add>
80004f7c:	02051663          	bnez	a0,80004fa8 <mac_lwip_init+0x74>
80004f80:	80003537          	lui	a0,0x80003
80004f84:	83050513          	addi	a0,a0,-2000 # 80002830 <_heap_end+0xffff0830>
80004f88:	56c090ef          	jal	ra,8000e4f4 <iprintf>
80004f8c:	fff00493          	li	s1,-1
80004f90:	00c12083          	lw	ra,12(sp)
80004f94:	00812403          	lw	s0,8(sp)
80004f98:	00048513          	mv	a0,s1
80004f9c:	00412483          	lw	s1,4(sp)
80004fa0:	01010113          	addi	sp,sp,16
80004fa4:	00008067          	ret
80004fa8:	9ac18513          	addi	a0,gp,-1620 # 800031ec <default_netif>
80004fac:	31d010ef          	jal	ra,80006ac8 <netif_set_default>
80004fb0:	9ac18513          	addi	a0,gp,-1620 # 800031ec <default_netif>
80004fb4:	98c18493          	addi	s1,gp,-1652 # 800031cc <active_config>
80004fb8:	319010ef          	jal	ra,80006ad0 <netif_set_up>
80004fbc:	00c4c783          	lbu	a5,12(s1)
80004fc0:	00000493          	li	s1,0
80004fc4:	0017f793          	andi	a5,a5,1
80004fc8:	fc0784e3          	beqz	a5,80004f90 <mac_lwip_init+0x5c>
80004fcc:	9ac18513          	addi	a0,gp,-1620 # 800031ec <default_netif>
80004fd0:	524050ef          	jal	ra,8000a4f4 <dhcp_start>
80004fd4:	fbdff06f          	j	80004f90 <mac_lwip_init+0x5c>

80004fd8 <mac_rx_isr>:
80004fd8:	fc010113          	addi	sp,sp,-64
80004fdc:	02912a23          	sw	s1,52(sp)
80004fe0:	03512223          	sw	s5,36(sp)
80004fe4:	01712e23          	sw	s7,28(sp)
80004fe8:	00001bb7          	lui	s7,0x1
80004fec:	03312623          	sw	s3,44(sp)
80004ff0:	01812c23          	sw	s8,24(sp)
80004ff4:	01912a23          	sw	s9,20(sp)
80004ff8:	02112e23          	sw	ra,60(sp)
80004ffc:	02812c23          	sw	s0,56(sp)
80005000:	03212823          	sw	s2,48(sp)
80005004:	03412423          	sw	s4,40(sp)
80005008:	03612023          	sw	s6,32(sp)
8000500c:	01a12823          	sw	s10,16(sp)
80005010:	00000993          	li	s3,0
80005014:	800b8b93          	addi	s7,s7,-2048 # 800 <_stack_size>
80005018:	a0418493          	addi	s1,gp,-1532 # 80003244 <lwip_stats>
8000501c:	9ac18a93          	addi	s5,gp,-1620 # 800031ec <default_netif>
80005020:	80003c37          	lui	s8,0x80003
80005024:	80003cb7          	lui	s9,0x80003
80005028:	f0070937          	lui	s2,0xf0070
8000502c:	00092783          	lw	a5,0(s2) # f0070000 <_heap_end+0x7005e000>
80005030:	0207f793          	andi	a5,a5,32
80005034:	04078663          	beqz	a5,80005080 <mac_rx_isr+0xa8>
80005038:	02092683          	lw	a3,32(s2)
8000503c:	00768413          	addi	s0,a3,7
80005040:	00345413          	srli	s0,s0,0x3
80005044:	068bfa63          	bgeu	s7,s0,800050b8 <mac_rx_isr+0xe0>
80005048:	80003537          	lui	a0,0x80003
8000504c:	00068613          	mv	a2,a3
80005050:	00040593          	mv	a1,s0
80005054:	85450513          	addi	a0,a0,-1964 # 80002854 <_heap_end+0xffff0854>
80005058:	49c090ef          	jal	ra,8000e4f4 <iprintf>
8000505c:	80c1a783          	lw	a5,-2036(gp) # 8000304c <_impure_ptr>
80005060:	0087a503          	lw	a0,8(a5)
80005064:	389080ef          	jal	ra,8000dbec <fflush>
80005068:	01100793          	li	a5,17
8000506c:	00002537          	lui	a0,0x2
80005070:	00f92023          	sw	a5,0(s2)
80005074:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
80005078:	391000ef          	jal	ra,80005c08 <delay_us>
8000507c:	00092023          	sw	zero,0(s2)
80005080:	03c12083          	lw	ra,60(sp)
80005084:	03812403          	lw	s0,56(sp)
80005088:	03412483          	lw	s1,52(sp)
8000508c:	03012903          	lw	s2,48(sp)
80005090:	02c12983          	lw	s3,44(sp)
80005094:	02812a03          	lw	s4,40(sp)
80005098:	02412a83          	lw	s5,36(sp)
8000509c:	02012b03          	lw	s6,32(sp)
800050a0:	01c12b83          	lw	s7,28(sp)
800050a4:	01812c03          	lw	s8,24(sp)
800050a8:	01412c83          	lw	s9,20(sp)
800050ac:	01012d03          	lw	s10,16(sp)
800050b0:	04010113          	addi	sp,sp,64
800050b4:	00008067          	ret
800050b8:	00240d13          	addi	s10,s0,2
800050bc:	010d1d13          	slli	s10,s10,0x10
800050c0:	010d5d13          	srli	s10,s10,0x10
800050c4:	18200613          	li	a2,386
800050c8:	000d0593          	mv	a1,s10
800050cc:	00000513          	li	a0,0
800050d0:	00d12623          	sw	a3,12(sp)
800050d4:	018020ef          	jal	ra,800070ec <pbuf_alloc>
800050d8:	00050913          	mv	s2,a0
800050dc:	00c12683          	lw	a3,12(sp)
800050e0:	0a051663          	bnez	a0,8000518c <mac_rx_isr+0x1b4>
800050e4:	f0000737          	lui	a4,0xf0000
800050e8:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
800050ec:	80003537          	lui	a0,0x80003
800050f0:	00040613          	mv	a2,s0
800050f4:	0027e793          	ori	a5,a5,2
800050f8:	00f72223          	sw	a5,4(a4)
800050fc:	01f68713          	addi	a4,a3,31
80005100:	00575713          	srli	a4,a4,0x5
80005104:	000d0593          	mv	a1,s10
80005108:	89450513          	addi	a0,a0,-1900 # 80002894 <_heap_end+0xffff0894>
8000510c:	3e8090ef          	jal	ra,8000e4f4 <iprintf>
80005110:	a0418793          	addi	a5,gp,-1532 # 80003244 <lwip_stats>
80005114:	0187a703          	lw	a4,24(a5)
80005118:	00170713          	addi	a4,a4,1
8000511c:	00e7ac23          	sw	a4,24(a5)
80005120:	00c7a703          	lw	a4,12(a5)
80005124:	00170713          	addi	a4,a4,1
80005128:	00e7a623          	sw	a4,12(a5)
8000512c:	f0070737          	lui	a4,0xf0070
80005130:	04804263          	bgtz	s0,80005174 <mac_rx_isr+0x19c>
80005134:	03812403          	lw	s0,56(sp)
80005138:	03c12083          	lw	ra,60(sp)
8000513c:	03412483          	lw	s1,52(sp)
80005140:	03012903          	lw	s2,48(sp)
80005144:	02c12983          	lw	s3,44(sp)
80005148:	02812a03          	lw	s4,40(sp)
8000514c:	02412a83          	lw	s5,36(sp)
80005150:	02012b03          	lw	s6,32(sp)
80005154:	01c12b83          	lw	s7,28(sp)
80005158:	01812c03          	lw	s8,24(sp)
8000515c:	01412c83          	lw	s9,20(sp)
80005160:	01012d03          	lw	s10,16(sp)
80005164:	80003537          	lui	a0,0x80003
80005168:	8e450513          	addi	a0,a0,-1820 # 800028e4 <_heap_end+0xffff08e4>
8000516c:	04010113          	addi	sp,sp,64
80005170:	3840906f          	j	8000e4f4 <iprintf>
80005174:	00072783          	lw	a5,0(a4) # f0070000 <_heap_end+0x7005e000>
80005178:	0207f793          	andi	a5,a5,32
8000517c:	fe078ce3          	beqz	a5,80005174 <mac_rx_isr+0x19c>
80005180:	02072783          	lw	a5,32(a4)
80005184:	ffc40413          	addi	s0,s0,-4
80005188:	fa9ff06f          	j	80005130 <mac_rx_isr+0x158>
8000518c:	ffe00593          	li	a1,-2
80005190:	661010ef          	jal	ra,80006ff0 <pbuf_header>
80005194:	00000713          	li	a4,0
80005198:	00000793          	li	a5,0
8000519c:	f0070637          	lui	a2,0xf0070
800051a0:	04041a63          	bnez	s0,800051f4 <mac_rx_isr+0x21c>
800051a4:	00200593          	li	a1,2
800051a8:	00090513          	mv	a0,s2
800051ac:	00492a03          	lw	s4,4(s2)
800051b0:	641010ef          	jal	ra,80006ff0 <pbuf_header>
800051b4:	0044a783          	lw	a5,4(s1)
800051b8:	000a8593          	mv	a1,s5
800051bc:	00090513          	mv	a0,s2
800051c0:	00178793          	addi	a5,a5,1
800051c4:	00f4a223          	sw	a5,4(s1)
800051c8:	010aa783          	lw	a5,16(s5)
800051cc:	000780e7          	jalr	a5
800051d0:	00050593          	mv	a1,a0
800051d4:	08050463          	beqz	a0,8000525c <mac_rx_isr+0x284>
800051d8:	f0000737          	lui	a4,0xf0000
800051dc:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
800051e0:	930c0513          	addi	a0,s8,-1744 # 80002930 <_heap_end+0xffff0930>
800051e4:	0027e793          	ori	a5,a5,2
800051e8:	00f72223          	sw	a5,4(a4)
800051ec:	308090ef          	jal	ra,8000e4f4 <iprintf>
800051f0:	06c0006f          	j	8000525c <mac_rx_isr+0x284>
800051f4:	08099063          	bnez	s3,80005274 <mac_rx_isr+0x29c>
800051f8:	06078863          	beqz	a5,80005268 <mac_rx_isr+0x290>
800051fc:	0007a783          	lw	a5,0(a5)
80005200:	06079663          	bnez	a5,8000526c <mac_rx_isr+0x294>
80005204:	f0000737          	lui	a4,0xf0000
80005208:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
8000520c:	904c8513          	addi	a0,s9,-1788 # 80002904 <_heap_end+0xffff0904>
80005210:	0027e793          	ori	a5,a5,2
80005214:	00f72223          	sw	a5,4(a4)
80005218:	2dc090ef          	jal	ra,8000e4f4 <iprintf>
8000521c:	0184a783          	lw	a5,24(s1)
80005220:	f0070737          	lui	a4,0xf0070
80005224:	00178793          	addi	a5,a5,1
80005228:	00f4ac23          	sw	a5,24(s1)
8000522c:	00c4a783          	lw	a5,12(s1)
80005230:	00178793          	addi	a5,a5,1
80005234:	00f4a623          	sw	a5,12(s1)
80005238:	00072783          	lw	a5,0(a4) # f0070000 <_heap_end+0x7005e000>
8000523c:	0207f793          	andi	a5,a5,32
80005240:	fe078ce3          	beqz	a5,80005238 <mac_rx_isr+0x260>
80005244:	02072783          	lw	a5,32(a4)
80005248:	ffc40413          	addi	s0,s0,-4
8000524c:	fe8046e3          	bgtz	s0,80005238 <mac_rx_isr+0x260>
80005250:	00200593          	li	a1,2
80005254:	00090513          	mv	a0,s2
80005258:	599010ef          	jal	ra,80006ff0 <pbuf_header>
8000525c:	00090513          	mv	a0,s2
80005260:	5b9010ef          	jal	ra,80007018 <pbuf_free>
80005264:	dc5ff06f          	j	80005028 <mac_rx_isr+0x50>
80005268:	00090793          	mv	a5,s2
8000526c:	00a7d983          	lhu	s3,10(a5)
80005270:	0047aa03          	lw	s4,4(a5)
80005274:	00071a63          	bnez	a4,80005288 <mac_rx_isr+0x2b0>
80005278:	00062683          	lw	a3,0(a2) # f0070000 <_heap_end+0x7005e000>
8000527c:	0206f693          	andi	a3,a3,32
80005280:	fe068ce3          	beqz	a3,80005278 <mac_rx_isr+0x2a0>
80005284:	02062b03          	lw	s6,32(a2)
80005288:	00170713          	addi	a4,a4,1
8000528c:	016a0023          	sb	s6,0(s4)
80005290:	00377713          	andi	a4,a4,3
80005294:	008b5b13          	srli	s6,s6,0x8
80005298:	fff40413          	addi	s0,s0,-1
8000529c:	001a0a13          	addi	s4,s4,1
800052a0:	fff98993          	addi	s3,s3,-1
800052a4:	efdff06f          	j	800051a0 <mac_rx_isr+0x1c8>

800052a8 <mac_poll>:
800052a8:	ff010113          	addi	sp,sp,-16
800052ac:	00812423          	sw	s0,8(sp)
800052b0:	00112623          	sw	ra,12(sp)
800052b4:	00912223          	sw	s1,4(sp)
800052b8:	c49ff0ef          	jal	ra,80004f00 <sys_now>
800052bc:	8ac1a683          	lw	a3,-1876(gp) # 800030ec <ts_etharp>
800052c0:	00050413          	mv	s0,a0
800052c4:	00a6f663          	bgeu	a3,a0,800052d0 <mac_poll+0x28>
800052c8:	8a41a683          	lw	a3,-1884(gp) # 800030e4 <ts_ipreass>
800052cc:	02a6e063          	bltu	a3,a0,800052ec <mac_poll+0x44>
800052d0:	8a81a223          	sw	s0,-1884(gp) # 800030e4 <ts_ipreass>
800052d4:	8a81a623          	sw	s0,-1876(gp) # 800030ec <ts_etharp>
800052d8:	00c12083          	lw	ra,12(sp)
800052dc:	00812403          	lw	s0,8(sp)
800052e0:	00412483          	lw	s1,4(sp)
800052e4:	01010113          	addi	sp,sp,16
800052e8:	00008067          	ret
800052ec:	8a01a783          	lw	a5,-1888(gp) # 800030e0 <ts_dhcp_fine>
800052f0:	1f300713          	li	a4,499
800052f4:	40f507b3          	sub	a5,a0,a5
800052f8:	00f77663          	bgeu	a4,a5,80005304 <mac_poll+0x5c>
800052fc:	5a0050ef          	jal	ra,8000a89c <dhcp_fine_tmr>
80005300:	8a81a023          	sw	s0,-1888(gp) # 800030e0 <ts_dhcp_fine>
80005304:	89c1a703          	lw	a4,-1892(gp) # 800030dc <ts_dhcp_coarse>
80005308:	0000f7b7          	lui	a5,0xf
8000530c:	a5f78793          	addi	a5,a5,-1441 # ea5f <_stack_size+0xe25f>
80005310:	40e40733          	sub	a4,s0,a4
80005314:	00e7f663          	bgeu	a5,a4,80005320 <mac_poll+0x78>
80005318:	2c0050ef          	jal	ra,8000a5d8 <dhcp_coarse_tmr>
8000531c:	8881ae23          	sw	s0,-1892(gp) # 800030dc <ts_dhcp_coarse>
80005320:	f00607b7          	lui	a5,0xf0060
80005324:	0087a783          	lw	a5,8(a5) # f0060008 <_heap_end+0x7004e008>
80005328:	0047f793          	andi	a5,a5,4
8000532c:	fa0786e3          	beqz	a5,800052d8 <mac_poll+0x30>
80005330:	80003537          	lui	a0,0x80003
80005334:	96050513          	addi	a0,a0,-1696 # 80002960 <_heap_end+0xffff0960>
80005338:	1bc090ef          	jal	ra,8000e4f4 <iprintf>
8000533c:	00812403          	lw	s0,8(sp)
80005340:	00c12083          	lw	ra,12(sp)
80005344:	00412483          	lw	s1,4(sp)
80005348:	01010113          	addi	sp,sp,16
8000534c:	c8dff06f          	j	80004fd8 <mac_rx_isr>

80005350 <mac_print_stats>:
80005350:	ff010113          	addi	sp,sp,-16
80005354:	9b018513          	addi	a0,gp,-1616 # 800031f0 <default_netif+0x4>
80005358:	00112623          	sw	ra,12(sp)
8000535c:	6d8070ef          	jal	ra,8000ca34 <ip4addr_ntoa>
80005360:	a0418613          	addi	a2,gp,-1532 # 80003244 <lwip_stats>
80005364:	01062883          	lw	a7,16(a2)
80005368:	01462803          	lw	a6,20(a2)
8000536c:	00c62783          	lw	a5,12(a2)
80005370:	02862703          	lw	a4,40(a2)
80005374:	00062683          	lw	a3,0(a2)
80005378:	00c12083          	lw	ra,12(sp)
8000537c:	00462603          	lw	a2,4(a2)
80005380:	00050593          	mv	a1,a0
80005384:	80003537          	lui	a0,0x80003
80005388:	98050513          	addi	a0,a0,-1664 # 80002980 <_heap_end+0xffff0980>
8000538c:	01010113          	addi	sp,sp,16
80005390:	1640906f          	j	8000e4f4 <iprintf>

80005394 <hub_init>:
80005394:	fe010113          	addi	sp,sp,-32
80005398:	00912a23          	sw	s1,20(sp)
8000539c:	800034b7          	lui	s1,0x80003
800053a0:	fd04c783          	lbu	a5,-48(s1) # 80002fd0 <_heap_end+0xffff0fd0>
800053a4:	00112e23          	sw	ra,28(sp)
800053a8:	00812c23          	sw	s0,24(sp)
800053ac:	01212823          	sw	s2,16(sp)
800053b0:	01312623          	sw	s3,12(sp)
800053b4:	01412423          	sw	s4,8(sp)
800053b8:	01512223          	sw	s5,4(sp)
800053bc:	01612023          	sw	s6,0(sp)
800053c0:	fd048493          	addi	s1,s1,-48
800053c4:	04f50063          	beq	a0,a5,80005404 <hub_init+0x70>
800053c8:	0054c703          	lbu	a4,5(s1)
800053cc:	fff00793          	li	a5,-1
800053d0:	00100a13          	li	s4,1
800053d4:	02e50a63          	beq	a0,a4,80005408 <hub_init+0x74>
800053d8:	01c12083          	lw	ra,28(sp)
800053dc:	01812403          	lw	s0,24(sp)
800053e0:	01412483          	lw	s1,20(sp)
800053e4:	01012903          	lw	s2,16(sp)
800053e8:	00c12983          	lw	s3,12(sp)
800053ec:	00812a03          	lw	s4,8(sp)
800053f0:	00412a83          	lw	s5,4(sp)
800053f4:	00012b03          	lw	s6,0(sp)
800053f8:	00078513          	mv	a0,a5
800053fc:	02010113          	addi	sp,sp,32
80005400:	00008067          	ret
80005404:	00000a13          	li	s4,0
80005408:	002a1993          	slli	s3,s4,0x2
8000540c:	014987b3          	add	a5,s3,s4
80005410:	00f487b3          	add	a5,s1,a5
80005414:	0017c403          	lbu	s0,1(a5)
80005418:	0027c903          	lbu	s2,2(a5)
8000541c:	0037ca83          	lbu	s5,3(a5)
80005420:	00040513          	mv	a0,s0
80005424:	00090593          	mv	a1,s2
80005428:	0047cb03          	lbu	s6,4(a5)
8000542c:	735070ef          	jal	ra,8000d360 <__mulsi3>
80005430:	000a8593          	mv	a1,s5
80005434:	72d070ef          	jal	ra,8000d360 <__mulsi3>
80005438:	000b0593          	mv	a1,s6
8000543c:	725070ef          	jal	ra,8000d360 <__mulsi3>
80005440:	40355513          	srai	a0,a0,0x3
80005444:	8aa1ac23          	sw	a0,-1864(gp) # 800030f8 <hub_frame_size>
80005448:	8a81aa23          	sw	s0,-1868(gp) # 800030f4 <hub_frame_width>
8000544c:	000a8593          	mv	a1,s5
80005450:	00090513          	mv	a0,s2
80005454:	70d070ef          	jal	ra,8000d360 <__mulsi3>
80005458:	8aa1a823          	sw	a0,-1872(gp) # 800030f0 <hub_frame_height>
8000545c:	f00547b7          	lui	a5,0xf0054
80005460:	0007a023          	sw	zero,0(a5) # f0054000 <_heap_end+0x70042000>
80005464:	000b0593          	mv	a1,s6
80005468:	00040513          	mv	a0,s0
8000546c:	6f5070ef          	jal	ra,8000d360 <__mulsi3>
80005470:	000a8593          	mv	a1,s5
80005474:	6ed070ef          	jal	ra,8000d360 <__mulsi3>
80005478:	00000693          	li	a3,0
8000547c:	00000713          	li	a4,0
80005480:	f0050637          	lui	a2,0xf0050
80005484:	000015b7          	lui	a1,0x1
80005488:	03274e63          	blt	a4,s2,800054c4 <hub_init+0x130>
8000548c:	014989b3          	add	s3,s3,s4
80005490:	013484b3          	add	s1,s1,s3
80005494:	0004c783          	lbu	a5,0(s1)
80005498:	01041413          	slli	s0,s0,0x10
8000549c:	01891913          	slli	s2,s2,0x18
800054a0:	01246433          	or	s0,s0,s2
800054a4:	00f46433          	or	s0,s0,a5
800054a8:	000107b7          	lui	a5,0x10
800054ac:	f8078793          	addi	a5,a5,-128 # ff80 <_stack_size+0xf780>
800054b0:	00f46433          	or	s0,s0,a5
800054b4:	f00547b7          	lui	a5,0xf0054
800054b8:	0087a023          	sw	s0,0(a5) # f0054000 <_heap_end+0x70042000>
800054bc:	00000793          	li	a5,0
800054c0:	f19ff06f          	j	800053d8 <hub_init+0x44>
800054c4:	00b707b3          	add	a5,a4,a1
800054c8:	00279793          	slli	a5,a5,0x2
800054cc:	4036d813          	srai	a6,a3,0x3
800054d0:	00f607b3          	add	a5,a2,a5
800054d4:	0107a223          	sw	a6,4(a5)
800054d8:	00170713          	addi	a4,a4,1
800054dc:	00a686b3          	add	a3,a3,a0
800054e0:	fa9ff06f          	j	80005488 <hub_init+0xf4>

800054e4 <hub_print_char>:
800054e4:	f9010113          	addi	sp,sp,-112
800054e8:	05812423          	sw	s8,72(sp)
800054ec:	00078c13          	mv	s8,a5
800054f0:	07812783          	lw	a5,120(sp)
800054f4:	06912223          	sw	s1,100(sp)
800054f8:	05312e23          	sw	s3,92(sp)
800054fc:	41f7d493          	srai	s1,a5,0x1f
80005500:	0074f493          	andi	s1,s1,7
80005504:	00f484b3          	add	s1,s1,a5
80005508:	05412c23          	sw	s4,88(sp)
8000550c:	02a12023          	sw	a0,32(sp)
80005510:	06112623          	sw	ra,108(sp)
80005514:	06812423          	sw	s0,104(sp)
80005518:	07212023          	sw	s2,96(sp)
8000551c:	05512a23          	sw	s5,84(sp)
80005520:	05612823          	sw	s6,80(sp)
80005524:	05712623          	sw	s7,76(sp)
80005528:	05912223          	sw	s9,68(sp)
8000552c:	05a12023          	sw	s10,64(sp)
80005530:	03b12e23          	sw	s11,60(sp)
80005534:	02c12223          	sw	a2,36(sp)
80005538:	02e12423          	sw	a4,40(sp)
8000553c:	03012623          	sw	a6,44(sp)
80005540:	0077f793          	andi	a5,a5,7
80005544:	00058513          	mv	a0,a1
80005548:	00068993          	mv	s3,a3
8000554c:	00088a13          	mv	s4,a7
80005550:	4034d493          	srai	s1,s1,0x3
80005554:	00078463          	beqz	a5,8000555c <hub_print_char+0x78>
80005558:	00148493          	addi	s1,s1,1
8000555c:	07412583          	lw	a1,116(sp)
80005560:	00000b93          	li	s7,0
80005564:	5fd070ef          	jal	ra,8000d360 <__mulsi3>
80005568:	00048593          	mv	a1,s1
8000556c:	5f5070ef          	jal	ra,8000d360 <__mulsi3>
80005570:	07012a83          	lw	s5,112(sp)
80005574:	003c1793          	slli	a5,s8,0x3
80005578:	00098593          	mv	a1,s3
8000557c:	00aa8ab3          	add	s5,s5,a0
80005580:	000c0513          	mv	a0,s8
80005584:	00f12e23          	sw	a5,28(sp)
80005588:	5d9070ef          	jal	ra,8000d360 <__mulsi3>
8000558c:	00a12823          	sw	a0,16(sp)
80005590:	049bc063          	blt	s7,s1,800055d0 <hub_print_char+0xec>
80005594:	06c12083          	lw	ra,108(sp)
80005598:	06812403          	lw	s0,104(sp)
8000559c:	06412483          	lw	s1,100(sp)
800055a0:	06012903          	lw	s2,96(sp)
800055a4:	05c12983          	lw	s3,92(sp)
800055a8:	05812a03          	lw	s4,88(sp)
800055ac:	05412a83          	lw	s5,84(sp)
800055b0:	05012b03          	lw	s6,80(sp)
800055b4:	04c12b83          	lw	s7,76(sp)
800055b8:	04812c03          	lw	s8,72(sp)
800055bc:	04412c83          	lw	s9,68(sp)
800055c0:	04012d03          	lw	s10,64(sp)
800055c4:	03c12d83          	lw	s11,60(sp)
800055c8:	07010113          	addi	sp,sp,112
800055cc:	00008067          	ret
800055d0:	07812703          	lw	a4,120(sp)
800055d4:	003b9793          	slli	a5,s7,0x3
800055d8:	40f707b3          	sub	a5,a4,a5
800055dc:	00f12623          	sw	a5,12(sp)
800055e0:	00c12703          	lw	a4,12(sp)
800055e4:	00800793          	li	a5,8
800055e8:	00e7d463          	bge	a5,a4,800055f0 <hub_print_char+0x10c>
800055ec:	00f12623          	sw	a5,12(sp)
800055f0:	02412b03          	lw	s6,36(sp)
800055f4:	00000c93          	li	s9,0
800055f8:	07412783          	lw	a5,116(sp)
800055fc:	02fcc263          	blt	s9,a5,80005620 <hub_print_char+0x13c>
80005600:	00fa8ab3          	add	s5,s5,a5
80005604:	01c12703          	lw	a4,28(sp)
80005608:	01012783          	lw	a5,16(sp)
8000560c:	001b8b93          	addi	s7,s7,1
80005610:	00898993          	addi	s3,s3,8
80005614:	00e787b3          	add	a5,a5,a4
80005618:	00f12823          	sw	a5,16(sp)
8000561c:	f75ff06f          	j	80005590 <hub_print_char+0xac>
80005620:	020b4863          	bltz	s6,80005650 <hub_print_char+0x16c>
80005624:	038b5663          	bge	s6,s8,80005650 <hub_print_char+0x16c>
80005628:	019a87b3          	add	a5,s5,s9
8000562c:	0007c783          	lbu	a5,0(a5)
80005630:	00000d13          	li	s10,0
80005634:	00f12c23          	sw	a5,24(sp)
80005638:	01012783          	lw	a5,16(sp)
8000563c:	00fb0db3          	add	s11,s6,a5
80005640:	00100793          	li	a5,1
80005644:	00f12423          	sw	a5,8(sp)
80005648:	00c12783          	lw	a5,12(sp)
8000564c:	00fd4863          	blt	s10,a5,8000565c <hub_print_char+0x178>
80005650:	001b0b13          	addi	s6,s6,1
80005654:	001c8c93          	addi	s9,s9,1
80005658:	fa1ff06f          	j	800055f8 <hub_print_char+0x114>
8000565c:	013d07b3          	add	a5,s10,s3
80005660:	0407ca63          	bltz	a5,800056b4 <hub_print_char+0x1d0>
80005664:	02c12703          	lw	a4,44(sp)
80005668:	04e7d663          	bge	a5,a4,800056b4 <hub_print_char+0x1d0>
8000566c:	00c00793          	li	a5,12
80005670:	06fa0063          	beq	s4,a5,800056d0 <hub_print_char+0x1ec>
80005674:	04b00793          	li	a5,75
80005678:	08fa0a63          	beq	s4,a5,8000570c <hub_print_char+0x228>
8000567c:	01412783          	lw	a5,20(sp)
80005680:	00279913          	slli	s2,a5,0x2
80005684:	02012783          	lw	a5,32(sp)
80005688:	01278933          	add	s2,a5,s2
8000568c:	00092503          	lw	a0,0(s2)
80005690:	6c8070ef          	jal	ra,8000cd58 <__bswapsi2>
80005694:	01812783          	lw	a5,24(sp)
80005698:	00812703          	lw	a4,8(sp)
8000569c:	00e7f7b3          	and	a5,a5,a4
800056a0:	10078263          	beqz	a5,800057a4 <hub_print_char+0x2c0>
800056a4:	00c00793          	li	a5,12
800056a8:	0afa0663          	beq	s4,a5,80005754 <hub_print_char+0x270>
800056ac:	04b00793          	li	a5,75
800056b0:	0afa0a63          	beq	s4,a5,80005764 <hub_print_char+0x280>
800056b4:	00812783          	lw	a5,8(sp)
800056b8:	001d0d13          	addi	s10,s10,1
800056bc:	018d8db3          	add	s11,s11,s8
800056c0:	00179793          	slli	a5,a5,0x1
800056c4:	0ff7f793          	andi	a5,a5,255
800056c8:	00f12423          	sw	a5,8(sp)
800056cc:	f7dff06f          	j	80005648 <hub_print_char+0x164>
800056d0:	41fdd793          	srai	a5,s11,0x1f
800056d4:	01f7f793          	andi	a5,a5,31
800056d8:	01b787b3          	add	a5,a5,s11
800056dc:	4057d793          	srai	a5,a5,0x5
800056e0:	00f12a23          	sw	a5,20(sp)
800056e4:	800007b7          	lui	a5,0x80000
800056e8:	01f78793          	addi	a5,a5,31 # 8000001f <_heap_end+0xfffee01f>
800056ec:	00fdf433          	and	s0,s11,a5
800056f0:	00045863          	bgez	s0,80005700 <hub_print_char+0x21c>
800056f4:	fff40413          	addi	s0,s0,-1
800056f8:	fe046413          	ori	s0,s0,-32
800056fc:	00140413          	addi	s0,s0,1
80005700:	800007b7          	lui	a5,0x80000
80005704:	0087d433          	srl	s0,a5,s0
80005708:	f75ff06f          	j	8000567c <hub_print_char+0x198>
8000570c:	41fdd793          	srai	a5,s11,0x1f
80005710:	0037f793          	andi	a5,a5,3
80005714:	01b787b3          	add	a5,a5,s11
80005718:	4027d793          	srai	a5,a5,0x2
8000571c:	00f12a23          	sw	a5,20(sp)
80005720:	800007b7          	lui	a5,0x80000
80005724:	00378793          	addi	a5,a5,3 # 80000003 <_heap_end+0xfffee003>
80005728:	00fdf433          	and	s0,s11,a5
8000572c:	00045863          	bgez	s0,8000573c <hub_print_char+0x258>
80005730:	fff40413          	addi	s0,s0,-1
80005734:	ffc46413          	ori	s0,s0,-4
80005738:	00140413          	addi	s0,s0,1
8000573c:	00300793          	li	a5,3
80005740:	40878433          	sub	s0,a5,s0
80005744:	00341413          	slli	s0,s0,0x3
80005748:	0ff00793          	li	a5,255
8000574c:	00879433          	sll	s0,a5,s0
80005750:	f2dff06f          	j	8000567c <hub_print_char+0x198>
80005754:	00a46533          	or	a0,s0,a0
80005758:	600070ef          	jal	ra,8000cd58 <__bswapsi2>
8000575c:	00a92023          	sw	a0,0(s2)
80005760:	f55ff06f          	j	800056b4 <hub_print_char+0x1d0>
80005764:	fff44793          	not	a5,s0
80005768:	00a7f533          	and	a0,a5,a0
8000576c:	800007b7          	lui	a5,0x80000
80005770:	00378793          	addi	a5,a5,3 # 80000003 <_heap_end+0xfffee003>
80005774:	00fdf7b3          	and	a5,s11,a5
80005778:	0007d863          	bgez	a5,80005788 <hub_print_char+0x2a4>
8000577c:	fff78793          	addi	a5,a5,-1
80005780:	ffc7e793          	ori	a5,a5,-4
80005784:	00178793          	addi	a5,a5,1
80005788:	00300713          	li	a4,3
8000578c:	40f707b3          	sub	a5,a4,a5
80005790:	02812703          	lw	a4,40(sp)
80005794:	00379793          	slli	a5,a5,0x3
80005798:	00f717b3          	sll	a5,a4,a5
8000579c:	00a7e533          	or	a0,a5,a0
800057a0:	fb9ff06f          	j	80005758 <hub_print_char+0x274>
800057a4:	00c00793          	li	a5,12
800057a8:	00fa0663          	beq	s4,a5,800057b4 <hub_print_char+0x2d0>
800057ac:	04b00793          	li	a5,75
800057b0:	f0fa12e3          	bne	s4,a5,800056b4 <hub_print_char+0x1d0>
800057b4:	fff44793          	not	a5,s0
800057b8:	00a7f533          	and	a0,a5,a0
800057bc:	f9dff06f          	j	80005758 <hub_print_char+0x274>

800057c0 <hub_print>:
800057c0:	fb010113          	addi	sp,sp,-80
800057c4:	04812423          	sw	s0,72(sp)
800057c8:	04912223          	sw	s1,68(sp)
800057cc:	05212023          	sw	s2,64(sp)
800057d0:	03312e23          	sw	s3,60(sp)
800057d4:	03412c23          	sw	s4,56(sp)
800057d8:	03512a23          	sw	s5,52(sp)
800057dc:	03612823          	sw	s6,48(sp)
800057e0:	03712623          	sw	s7,44(sp)
800057e4:	03812423          	sw	s8,40(sp)
800057e8:	03912223          	sw	s9,36(sp)
800057ec:	03a12023          	sw	s10,32(sp)
800057f0:	01b12e23          	sw	s11,28(sp)
800057f4:	04112623          	sw	ra,76(sp)
800057f8:	00058a13          	mv	s4,a1
800057fc:	00068a93          	mv	s5,a3
80005800:	00070993          	mv	s3,a4
80005804:	00078b13          	mv	s6,a5
80005808:	00080913          	mv	s2,a6
8000580c:	00088b93          	mv	s7,a7
80005810:	00050493          	mv	s1,a0
80005814:	00000413          	li	s0,0
80005818:	f0054c37          	lui	s8,0xf0054
8000581c:	0ff67d93          	andi	s11,a2,255
80005820:	05344063          	blt	s0,s3,80005860 <hub_print+0xa0>
80005824:	04c12083          	lw	ra,76(sp)
80005828:	04812403          	lw	s0,72(sp)
8000582c:	04412483          	lw	s1,68(sp)
80005830:	04012903          	lw	s2,64(sp)
80005834:	03c12983          	lw	s3,60(sp)
80005838:	03812a03          	lw	s4,56(sp)
8000583c:	03412a83          	lw	s5,52(sp)
80005840:	03012b03          	lw	s6,48(sp)
80005844:	02c12b83          	lw	s7,44(sp)
80005848:	02812c03          	lw	s8,40(sp)
8000584c:	02412c83          	lw	s9,36(sp)
80005850:	02012d03          	lw	s10,32(sp)
80005854:	01c12d83          	lw	s11,28(sp)
80005858:	05010113          	addi	sp,sp,80
8000585c:	00008067          	ret
80005860:	000c2883          	lw	a7,0(s8) # f0054000 <_heap_end+0x70042000>
80005864:	008a85b3          	add	a1,s5,s0
80005868:	01712423          	sw	s7,8(sp)
8000586c:	01212223          	sw	s2,4(sp)
80005870:	01612023          	sw	s6,0(sp)
80005874:	8b01a803          	lw	a6,-1872(gp) # 800030f0 <hub_frame_height>
80005878:	8b41a783          	lw	a5,-1868(gp) # 800030f4 <hub_frame_width>
8000587c:	0005c583          	lbu	a1,0(a1) # 1000 <_stack_size+0x800>
80005880:	00048613          	mv	a2,s1
80005884:	07f8f893          	andi	a7,a7,127
80005888:	000d8713          	mv	a4,s11
8000588c:	000a0693          	mv	a3,s4
80005890:	f0050537          	lui	a0,0xf0050
80005894:	c51ff0ef          	jal	ra,800054e4 <hub_print_char>
80005898:	00140413          	addi	s0,s0,1
8000589c:	012484b3          	add	s1,s1,s2
800058a0:	f81ff06f          	j	80005820 <hub_print+0x60>

800058a4 <modbus_udp_init>:
800058a4:	ff010113          	addi	sp,sp,-16
800058a8:	02e00513          	li	a0,46
800058ac:	00912223          	sw	s1,4(sp)
800058b0:	00112623          	sw	ra,12(sp)
800058b4:	00812423          	sw	s0,8(sp)
800058b8:	3ac030ef          	jal	ra,80008c64 <udp_new_ip_type>
800058bc:	8aa1ae23          	sw	a0,-1860(gp) # 800030fc <modbus_udp_pcb>
800058c0:	02051663          	bnez	a0,800058ec <modbus_udp_init+0x48>
800058c4:	80003537          	lui	a0,0x80003
800058c8:	9dc50513          	addi	a0,a0,-1572 # 800029dc <_heap_end+0xffff09dc>
800058cc:	429080ef          	jal	ra,8000e4f4 <iprintf>
800058d0:	fff00413          	li	s0,-1
800058d4:	00040513          	mv	a0,s0
800058d8:	00c12083          	lw	ra,12(sp)
800058dc:	00812403          	lw	s0,8(sp)
800058e0:	00412483          	lw	s1,4(sp)
800058e4:	01010113          	addi	sp,sp,16
800058e8:	00008067          	ret
800058ec:	7d100613          	li	a2,2001
800058f0:	84818593          	addi	a1,gp,-1976 # 80003088 <ip_addr_any>
800058f4:	5e1020ef          	jal	ra,800086d4 <udp_bind>
800058f8:	00050413          	mv	s0,a0
800058fc:	00050e63          	beqz	a0,80005918 <modbus_udp_init+0x74>
80005900:	80003537          	lui	a0,0x80003
80005904:	a0c50513          	addi	a0,a0,-1524 # 80002a0c <_heap_end+0xffff0a0c>
80005908:	3ed080ef          	jal	ra,8000e4f4 <iprintf>
8000590c:	8bc1a503          	lw	a0,-1860(gp) # 800030fc <modbus_udp_pcb>
80005910:	2c0030ef          	jal	ra,80008bd0 <udp_remove>
80005914:	fc1ff06f          	j	800058d4 <modbus_udp_init+0x30>
80005918:	8bc1a503          	lw	a0,-1860(gp) # 800030fc <modbus_udp_pcb>
8000591c:	800065b7          	lui	a1,0x80006
80005920:	00000613          	li	a2,0
80005924:	ac058593          	addi	a1,a1,-1344 # 80005ac0 <_heap_end+0xffff3ac0>
80005928:	298030ef          	jal	ra,80008bc0 <udp_recv>
8000592c:	80003537          	lui	a0,0x80003
80005930:	a3850513          	addi	a0,a0,-1480 # 80002a38 <_heap_end+0xffff0a38>
80005934:	3c1080ef          	jal	ra,8000e4f4 <iprintf>
80005938:	f9dff06f          	j	800058d4 <modbus_udp_init+0x30>

8000593c <modbus_udp_send>:
8000593c:	fd010113          	addi	sp,sp,-48
80005940:	01412c23          	sw	s4,24(sp)
80005944:	00168a13          	addi	s4,a3,1
80005948:	03212023          	sw	s2,32(sp)
8000594c:	00058913          	mv	s2,a1
80005950:	010a1593          	slli	a1,s4,0x10
80005954:	01312e23          	sw	s3,28(sp)
80005958:	01512a23          	sw	s5,20(sp)
8000595c:	00050993          	mv	s3,a0
80005960:	00060a93          	mv	s5,a2
80005964:	0105d593          	srli	a1,a1,0x10
80005968:	28000613          	li	a2,640
8000596c:	03800513          	li	a0,56
80005970:	02912223          	sw	s1,36(sp)
80005974:	02112623          	sw	ra,44(sp)
80005978:	02812423          	sw	s0,40(sp)
8000597c:	00068493          	mv	s1,a3
80005980:	76c010ef          	jal	ra,800070ec <pbuf_alloc>
80005984:	04051063          	bnez	a0,800059c4 <modbus_udp_send+0x88>
80005988:	f0000737          	lui	a4,0xf0000
8000598c:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
80005990:	80003537          	lui	a0,0x80003
80005994:	a5450513          	addi	a0,a0,-1452 # 80002a54 <_heap_end+0xffff0a54>
80005998:	ffd7f793          	andi	a5,a5,-3
8000599c:	00f72223          	sw	a5,4(a4)
800059a0:	02812403          	lw	s0,40(sp)
800059a4:	02c12083          	lw	ra,44(sp)
800059a8:	02412483          	lw	s1,36(sp)
800059ac:	02012903          	lw	s2,32(sp)
800059b0:	01c12983          	lw	s3,28(sp)
800059b4:	01812a03          	lw	s4,24(sp)
800059b8:	01412a83          	lw	s5,20(sp)
800059bc:	03010113          	addi	sp,sp,48
800059c0:	3350806f          	j	8000e4f4 <iprintf>
800059c4:	00452783          	lw	a5,4(a0)
800059c8:	00050413          	mv	s0,a0
800059cc:	00078663          	beqz	a5,800059d8 <modbus_udp_send+0x9c>
800059d0:	00a55703          	lhu	a4,10(a0)
800059d4:	05477463          	bgeu	a4,s4,80005a1c <modbus_udp_send+0xe0>
800059d8:	f0000737          	lui	a4,0xf0000
800059dc:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
800059e0:	80003537          	lui	a0,0x80003
800059e4:	a8450513          	addi	a0,a0,-1404 # 80002a84 <_heap_end+0xffff0a84>
800059e8:	ffd7f793          	andi	a5,a5,-3
800059ec:	00f72223          	sw	a5,4(a4)
800059f0:	00a45603          	lhu	a2,10(s0)
800059f4:	00442583          	lw	a1,4(s0)
800059f8:	02812403          	lw	s0,40(sp)
800059fc:	02c12083          	lw	ra,44(sp)
80005a00:	02412483          	lw	s1,36(sp)
80005a04:	02012903          	lw	s2,32(sp)
80005a08:	01c12983          	lw	s3,28(sp)
80005a0c:	01812a03          	lw	s4,24(sp)
80005a10:	01412a83          	lw	s5,20(sp)
80005a14:	03010113          	addi	sp,sp,48
80005a18:	2dd0806f          	j	8000e4f4 <iprintf>
80005a1c:	00048613          	mv	a2,s1
80005a20:	000a8593          	mv	a1,s5
80005a24:	00078513          	mv	a0,a5
80005a28:	68c080ef          	jal	ra,8000e0b4 <memcpy>
80005a2c:	009507b3          	add	a5,a0,s1
80005a30:	00078023          	sb	zero,0(a5)
80005a34:	8bc1a503          	lw	a0,-1860(gp) # 800030fc <modbus_udp_pcb>
80005a38:	00040593          	mv	a1,s0
80005a3c:	00090693          	mv	a3,s2
80005a40:	00098613          	mv	a2,s3
80005a44:	7c1020ef          	jal	ra,80008a04 <udp_sendto>
80005a48:	00050593          	mv	a1,a0
80005a4c:	04050463          	beqz	a0,80005a94 <modbus_udp_send+0x158>
80005a50:	f0000737          	lui	a4,0xf0000
80005a54:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
80005a58:	80003537          	lui	a0,0x80003
80005a5c:	abc50513          	addi	a0,a0,-1348 # 80002abc <_heap_end+0xffff0abc>
80005a60:	ffd7f793          	andi	a5,a5,-3
80005a64:	00f72223          	sw	a5,4(a4)
80005a68:	28d080ef          	jal	ra,8000e4f4 <iprintf>
80005a6c:	00040513          	mv	a0,s0
80005a70:	02812403          	lw	s0,40(sp)
80005a74:	02c12083          	lw	ra,44(sp)
80005a78:	02412483          	lw	s1,36(sp)
80005a7c:	02012903          	lw	s2,32(sp)
80005a80:	01c12983          	lw	s3,28(sp)
80005a84:	01812a03          	lw	s4,24(sp)
80005a88:	01412a83          	lw	s5,20(sp)
80005a8c:	03010113          	addi	sp,sp,48
80005a90:	5880106f          	j	80007018 <pbuf_free>
80005a94:	00a45583          	lhu	a1,10(s0)
80005a98:	00098513          	mv	a0,s3
80005a9c:	00b12623          	sw	a1,12(sp)
80005aa0:	795060ef          	jal	ra,8000ca34 <ip4addr_ntoa>
80005aa4:	00c12583          	lw	a1,12(sp)
80005aa8:	00050613          	mv	a2,a0
80005aac:	80003537          	lui	a0,0x80003
80005ab0:	00090693          	mv	a3,s2
80005ab4:	af450513          	addi	a0,a0,-1292 # 80002af4 <_heap_end+0xffff0af4>
80005ab8:	23d080ef          	jal	ra,8000e4f4 <iprintf>
80005abc:	fb1ff06f          	j	80005a6c <modbus_udp_send+0x130>

80005ac0 <modbus_udp_recv>:
80005ac0:	f6010113          	addi	sp,sp,-160
80005ac4:	08112e23          	sw	ra,156(sp)
80005ac8:	08912a23          	sw	s1,148(sp)
80005acc:	09212823          	sw	s2,144(sp)
80005ad0:	09312623          	sw	s3,140(sp)
80005ad4:	08812c23          	sw	s0,152(sp)
80005ad8:	09412423          	sw	s4,136(sp)
80005adc:	00a65403          	lhu	s0,10(a2) # f005000a <_heap_end+0x7003e00a>
80005ae0:	00068513          	mv	a0,a3
80005ae4:	00070993          	mv	s3,a4
80005ae8:	00060493          	mv	s1,a2
80005aec:	00462a03          	lw	s4,4(a2)
80005af0:	00068913          	mv	s2,a3
80005af4:	741060ef          	jal	ra,8000ca34 <ip4addr_ntoa>
80005af8:	00050593          	mv	a1,a0
80005afc:	80003537          	lui	a0,0x80003
80005b00:	00040693          	mv	a3,s0
80005b04:	00098613          	mv	a2,s3
80005b08:	b2050513          	addi	a0,a0,-1248 # 80002b20 <_heap_end+0xffff0b20>
80005b0c:	1e9080ef          	jal	ra,8000e4f4 <iprintf>
80005b10:	00040593          	mv	a1,s0
80005b14:	00010613          	mv	a2,sp
80005b18:	000a0513          	mv	a0,s4
80005b1c:	d79fe0ef          	jal	ra,80004894 <modbus_recv>
80005b20:	00050413          	mv	s0,a0
80005b24:	00048513          	mv	a0,s1
80005b28:	4f0010ef          	jal	ra,80007018 <pbuf_free>
80005b2c:	02040463          	beqz	s0,80005b54 <modbus_udp_recv+0x94>
80005b30:	80003537          	lui	a0,0x80003
80005b34:	00040593          	mv	a1,s0
80005b38:	b4c50513          	addi	a0,a0,-1204 # 80002b4c <_heap_end+0xffff0b4c>
80005b3c:	1b9080ef          	jal	ra,8000e4f4 <iprintf>
80005b40:	00040693          	mv	a3,s0
80005b44:	00010613          	mv	a2,sp
80005b48:	00098593          	mv	a1,s3
80005b4c:	00090513          	mv	a0,s2
80005b50:	dedff0ef          	jal	ra,8000593c <modbus_udp_send>
80005b54:	09c12083          	lw	ra,156(sp)
80005b58:	09812403          	lw	s0,152(sp)
80005b5c:	09412483          	lw	s1,148(sp)
80005b60:	09012903          	lw	s2,144(sp)
80005b64:	08c12983          	lw	s3,140(sp)
80005b68:	08812a03          	lw	s4,136(sp)
80005b6c:	0a010113          	addi	sp,sp,160
80005b70:	00008067          	ret

80005b74 <i2c_init>:
80005b74:	0fa00793          	li	a5,250
80005b78:	00f52423          	sw	a5,8(a0)
80005b7c:	00008067          	ret

80005b80 <i2c_wait_for_busy>:
80005b80:	00000793          	li	a5,0
80005b84:	00b7c663          	blt	a5,a1,80005b90 <i2c_wait_for_busy+0x10>
80005b88:	00000513          	li	a0,0
80005b8c:	00008067          	ret
80005b90:	00c52703          	lw	a4,12(a0)
80005b94:	00277713          	andi	a4,a4,2
80005b98:	00071663          	bnez	a4,80005ba4 <i2c_wait_for_busy+0x24>
80005b9c:	00178793          	addi	a5,a5,1
80005ba0:	fe5ff06f          	j	80005b84 <i2c_wait_for_busy+0x4>
80005ba4:	00100513          	li	a0,1
80005ba8:	00008067          	ret

80005bac <i2c_wait_for_release>:
80005bac:	00000793          	li	a5,0
80005bb0:	00b7c663          	blt	a5,a1,80005bbc <i2c_wait_for_release+0x10>
80005bb4:	00000513          	li	a0,0
80005bb8:	00008067          	ret
80005bbc:	00c52703          	lw	a4,12(a0)
80005bc0:	00277713          	andi	a4,a4,2
80005bc4:	00070663          	beqz	a4,80005bd0 <i2c_wait_for_release+0x24>
80005bc8:	00178793          	addi	a5,a5,1
80005bcc:	fe5ff06f          	j	80005bb0 <i2c_wait_for_release+0x4>
80005bd0:	00100513          	li	a0,1
80005bd4:	00008067          	ret

80005bd8 <__malloc_lock>:
80005bd8:	00008067          	ret

80005bdc <__malloc_unlock>:
80005bdc:	00008067          	ret

80005be0 <init_sbrk>:
80005be0:	800117b7          	lui	a5,0x80011
80005be4:	1e078793          	addi	a5,a5,480 # 800111e0 <_heap_end+0xfffff1e0>
80005be8:	8cf1a023          	sw	a5,-1856(gp) # 80003100 <sbrk_heap_end>
80005bec:	00008067          	ret

80005bf0 <delay>:
80005bf0:	00000793          	li	a5,0
80005bf4:	00a79463          	bne	a5,a0,80005bfc <delay+0xc>
80005bf8:	00008067          	ret
80005bfc:	00060613          	mv	a2,a2
80005c00:	00178793          	addi	a5,a5,1
80005c04:	ff1ff06f          	j	80005bf4 <delay+0x4>

80005c08 <delay_us>:
80005c08:	f00b07b7          	lui	a5,0xf00b0
80005c0c:	0007a803          	lw	a6,0(a5) # f00b0000 <_heap_end+0x7009e000>
80005c10:	0047a883          	lw	a7,4(a5)
80005c14:	f00b0637          	lui	a2,0xf00b0
80005c18:	00062303          	lw	t1,0(a2) # f00b0000 <_heap_end+0x7009e000>
80005c1c:	00462383          	lw	t2,4(a2)
80005c20:	410306b3          	sub	a3,t1,a6
80005c24:	00d33733          	sltu	a4,t1,a3
80005c28:	411387b3          	sub	a5,t2,a7
80005c2c:	00e79463          	bne	a5,a4,80005c34 <delay_us+0x2c>
80005c30:	fea6e4e3          	bltu	a3,a0,80005c18 <delay_us+0x10>
80005c34:	00008067          	ret

80005c38 <print_uart0>:
80005c38:	f00106b7          	lui	a3,0xf0010
80005c3c:	00054703          	lbu	a4,0(a0)
80005c40:	00071463          	bnez	a4,80005c48 <print_uart0+0x10>
80005c44:	00008067          	ret
80005c48:	0046a783          	lw	a5,4(a3) # f0010004 <_heap_end+0x6fffe004>
80005c4c:	0107d793          	srli	a5,a5,0x10
80005c50:	0ff7f793          	andi	a5,a5,255
80005c54:	fe078ae3          	beqz	a5,80005c48 <print_uart0+0x10>
80005c58:	00e6a023          	sw	a4,0(a3)
80005c5c:	00150513          	addi	a0,a0,1
80005c60:	fddff06f          	j	80005c3c <print_uart0+0x4>

80005c64 <_sbrk>:
80005c64:	8c01a783          	lw	a5,-1856(gp) # 80003100 <sbrk_heap_end>
80005c68:	00079863          	bnez	a5,80005c78 <_sbrk+0x14>
80005c6c:	800117b7          	lui	a5,0x80011
80005c70:	1e078793          	addi	a5,a5,480 # 800111e0 <_heap_end+0xfffff1e0>
80005c74:	8cf1a023          	sw	a5,-1856(gp) # 80003100 <sbrk_heap_end>
80005c78:	8c01a683          	lw	a3,-1856(gp) # 80003100 <sbrk_heap_end>
80005c7c:	80012737          	lui	a4,0x80012
80005c80:	00070593          	mv	a1,a4
80005c84:	00a687b3          	add	a5,a3,a0
80005c88:	04f5f263          	bgeu	a1,a5,80005ccc <_sbrk+0x68>
80005c8c:	f7010113          	addi	sp,sp,-144
80005c90:	80003637          	lui	a2,0x80003
80005c94:	00050793          	mv	a5,a0
80005c98:	00070713          	mv	a4,a4
80005c9c:	b7c60613          	addi	a2,a2,-1156 # 80002b7c <_heap_end+0xffff0b7c>
80005ca0:	08000593          	li	a1,128
80005ca4:	00010513          	mv	a0,sp
80005ca8:	08112623          	sw	ra,140(sp)
80005cac:	1b5080ef          	jal	ra,8000e660 <sniprintf>
80005cb0:	00010513          	mv	a0,sp
80005cb4:	f85ff0ef          	jal	ra,80005c38 <print_uart0>
80005cb8:	08c12083          	lw	ra,140(sp)
80005cbc:	fff00693          	li	a3,-1
80005cc0:	00068513          	mv	a0,a3
80005cc4:	09010113          	addi	sp,sp,144
80005cc8:	00008067          	ret
80005ccc:	8cf1a023          	sw	a5,-1856(gp) # 80003100 <sbrk_heap_end>
80005cd0:	00068513          	mv	a0,a3
80005cd4:	00008067          	ret

80005cd8 <print_uart1>:
80005cd8:	f00116b7          	lui	a3,0xf0011
80005cdc:	00054703          	lbu	a4,0(a0)
80005ce0:	00071463          	bnez	a4,80005ce8 <print_uart1+0x10>
80005ce4:	00008067          	ret
80005ce8:	0046a783          	lw	a5,4(a3) # f0011004 <_heap_end+0x6ffff004>
80005cec:	0107d793          	srli	a5,a5,0x10
80005cf0:	0ff7f793          	andi	a5,a5,255
80005cf4:	fe078ae3          	beqz	a5,80005ce8 <print_uart1+0x10>
80005cf8:	00e6a023          	sw	a4,0(a3)
80005cfc:	00150513          	addi	a0,a0,1
80005d00:	fddff06f          	j	80005cdc <print_uart1+0x4>

80005d04 <_write>:
80005d04:	00c586b3          	add	a3,a1,a2
80005d08:	f0010737          	lui	a4,0xf0010
80005d0c:	00d59663          	bne	a1,a3,80005d18 <_write+0x14>
80005d10:	00060513          	mv	a0,a2
80005d14:	00008067          	ret
80005d18:	00158593          	addi	a1,a1,1
80005d1c:	fff5c503          	lbu	a0,-1(a1)
80005d20:	00472783          	lw	a5,4(a4) # f0010004 <_heap_end+0x6fffe004>
80005d24:	0107d793          	srli	a5,a5,0x10
80005d28:	0ff7f793          	andi	a5,a5,255
80005d2c:	fe078ae3          	beqz	a5,80005d20 <_write+0x1c>
80005d30:	00a72023          	sw	a0,0(a4)
80005d34:	fd9ff06f          	j	80005d0c <_write+0x8>

80005d38 <_read>:
80005d38:	00100513          	li	a0,1
80005d3c:	00008067          	ret

80005d40 <_close>:
80005d40:	fff00513          	li	a0,-1
80005d44:	00008067          	ret

80005d48 <_lseek>:
80005d48:	00000513          	li	a0,0
80005d4c:	00008067          	ret

80005d50 <_isatty>:
80005d50:	00100513          	li	a0,1
80005d54:	00008067          	ret

80005d58 <_fstat>:
80005d58:	000027b7          	lui	a5,0x2
80005d5c:	00f5a223          	sw	a5,4(a1)
80005d60:	00000513          	li	a0,0
80005d64:	00008067          	ret

80005d68 <_kill>:
80005d68:	00008067          	ret

80005d6c <_getpid>:
80005d6c:	fff00513          	li	a0,-1
80005d70:	00008067          	ret

80005d74 <hard_reboot>:
80005d74:	80003537          	lui	a0,0x80003
80005d78:	ff010113          	addi	sp,sp,-16
80005d7c:	bbc50513          	addi	a0,a0,-1092 # 80002bbc <_heap_end+0xffff0bbc>
80005d80:	00112623          	sw	ra,12(sp)
80005d84:	eb5ff0ef          	jal	ra,80005c38 <print_uart0>
80005d88:	3e800513          	li	a0,1000
80005d8c:	e7dff0ef          	jal	ra,80005c08 <delay_us>
80005d90:	f00a07b7          	lui	a5,0xf00a0
80005d94:	00100713          	li	a4,1
80005d98:	00e7a423          	sw	a4,8(a5) # f00a0008 <_heap_end+0x7008e008>
80005d9c:	00c12083          	lw	ra,12(sp)
80005da0:	01010113          	addi	sp,sp,16
80005da4:	00008067          	ret

80005da8 <memcpy_rev>:
80005da8:	00000793          	li	a5,0
80005dac:	00f61463          	bne	a2,a5,80005db4 <memcpy_rev+0xc>
80005db0:	00008067          	ret
80005db4:	40f58733          	sub	a4,a1,a5
80005db8:	00074683          	lbu	a3,0(a4)
80005dbc:	00f50733          	add	a4,a0,a5
80005dc0:	00178793          	addi	a5,a5,1
80005dc4:	00d70023          	sb	a3,0(a4)
80005dc8:	fe5ff06f          	j	80005dac <memcpy_rev+0x4>

80005dcc <lwip_init>:
80005dcc:	ff010113          	addi	sp,sp,-16
80005dd0:	00112623          	sw	ra,12(sp)
80005dd4:	340020ef          	jal	ra,80008114 <stats_init>
80005dd8:	015000ef          	jal	ra,800065ec <mem_init>
80005ddc:	141000ef          	jal	ra,8000671c <memp_init>
80005de0:	27d000ef          	jal	ra,8000685c <netif_init>
80005de4:	618020ef          	jal	ra,800083fc <udp_init>
80005de8:	00c12083          	lw	ra,12(sp)
80005dec:	01010113          	addi	sp,sp,16
80005df0:	4500206f          	j	80008240 <sys_timeouts_init>

80005df4 <lwip_htons>:
80005df4:	00851793          	slli	a5,a0,0x8
80005df8:	00855513          	srli	a0,a0,0x8
80005dfc:	00a7e533          	or	a0,a5,a0
80005e00:	01051513          	slli	a0,a0,0x10
80005e04:	01055513          	srli	a0,a0,0x10
80005e08:	00008067          	ret

80005e0c <lwip_htonl>:
80005e0c:	01855713          	srli	a4,a0,0x18
80005e10:	01851793          	slli	a5,a0,0x18
80005e14:	00e7e7b3          	or	a5,a5,a4
80005e18:	00ff06b7          	lui	a3,0xff0
80005e1c:	00851713          	slli	a4,a0,0x8
80005e20:	00d77733          	and	a4,a4,a3
80005e24:	00e7e7b3          	or	a5,a5,a4
80005e28:	00010737          	lui	a4,0x10
80005e2c:	f0070713          	addi	a4,a4,-256 # ff00 <_stack_size+0xf700>
80005e30:	00855513          	srli	a0,a0,0x8
80005e34:	00e57533          	and	a0,a0,a4
80005e38:	00a7e533          	or	a0,a5,a0
80005e3c:	00008067          	ret

80005e40 <lwip_strnstr>:
80005e40:	fe010113          	addi	sp,sp,-32
80005e44:	00812c23          	sw	s0,24(sp)
80005e48:	00050413          	mv	s0,a0
80005e4c:	00058513          	mv	a0,a1
80005e50:	00912a23          	sw	s1,20(sp)
80005e54:	01312623          	sw	s3,12(sp)
80005e58:	00112e23          	sw	ra,28(sp)
80005e5c:	01212823          	sw	s2,16(sp)
80005e60:	00058993          	mv	s3,a1
80005e64:	00060493          	mv	s1,a2
80005e68:	2c5080ef          	jal	ra,8000e92c <strlen>
80005e6c:	02050063          	beqz	a0,80005e8c <lwip_strnstr+0x4c>
80005e70:	00050913          	mv	s2,a0
80005e74:	009404b3          	add	s1,s0,s1
80005e78:	00044783          	lbu	a5,0(s0)
80005e7c:	00078663          	beqz	a5,80005e88 <lwip_strnstr+0x48>
80005e80:	01240733          	add	a4,s0,s2
80005e84:	02e4f463          	bgeu	s1,a4,80005eac <lwip_strnstr+0x6c>
80005e88:	00000413          	li	s0,0
80005e8c:	00040513          	mv	a0,s0
80005e90:	01c12083          	lw	ra,28(sp)
80005e94:	01812403          	lw	s0,24(sp)
80005e98:	01412483          	lw	s1,20(sp)
80005e9c:	01012903          	lw	s2,16(sp)
80005ea0:	00c12983          	lw	s3,12(sp)
80005ea4:	02010113          	addi	sp,sp,32
80005ea8:	00008067          	ret
80005eac:	0009c703          	lbu	a4,0(s3)
80005eb0:	00f71c63          	bne	a4,a5,80005ec8 <lwip_strnstr+0x88>
80005eb4:	00090613          	mv	a2,s2
80005eb8:	00098593          	mv	a1,s3
80005ebc:	00040513          	mv	a0,s0
80005ec0:	289080ef          	jal	ra,8000e948 <strncmp>
80005ec4:	fc0504e3          	beqz	a0,80005e8c <lwip_strnstr+0x4c>
80005ec8:	00140413          	addi	s0,s0,1
80005ecc:	fadff06f          	j	80005e78 <lwip_strnstr+0x38>

80005ed0 <lwip_stricmp>:
80005ed0:	01900813          	li	a6,25
80005ed4:	00150513          	addi	a0,a0,1
80005ed8:	00158593          	addi	a1,a1,1
80005edc:	fff54703          	lbu	a4,-1(a0)
80005ee0:	fff5c783          	lbu	a5,-1(a1)
80005ee4:	00f70e63          	beq	a4,a5,80005f00 <lwip_stricmp+0x30>
80005ee8:	02076613          	ori	a2,a4,32
80005eec:	f9f60693          	addi	a3,a2,-97
80005ef0:	0ff6f693          	andi	a3,a3,255
80005ef4:	00d86c63          	bltu	a6,a3,80005f0c <lwip_stricmp+0x3c>
80005ef8:	0207e793          	ori	a5,a5,32
80005efc:	00f61863          	bne	a2,a5,80005f0c <lwip_stricmp+0x3c>
80005f00:	fc071ae3          	bnez	a4,80005ed4 <lwip_stricmp+0x4>
80005f04:	00000513          	li	a0,0
80005f08:	00008067          	ret
80005f0c:	00100513          	li	a0,1
80005f10:	00008067          	ret

80005f14 <lwip_strnicmp>:
80005f14:	fff60613          	addi	a2,a2,-1
80005f18:	00000793          	li	a5,0
80005f1c:	01900313          	li	t1,25
80005f20:	00f50733          	add	a4,a0,a5
80005f24:	00074683          	lbu	a3,0(a4)
80005f28:	00f58733          	add	a4,a1,a5
80005f2c:	00074703          	lbu	a4,0(a4)
80005f30:	00e68e63          	beq	a3,a4,80005f4c <lwip_strnicmp+0x38>
80005f34:	0206e893          	ori	a7,a3,32
80005f38:	f9f88813          	addi	a6,a7,-97
80005f3c:	0ff87813          	andi	a6,a6,255
80005f40:	03036063          	bltu	t1,a6,80005f60 <lwip_strnicmp+0x4c>
80005f44:	02076713          	ori	a4,a4,32
80005f48:	00e89c63          	bne	a7,a4,80005f60 <lwip_strnicmp+0x4c>
80005f4c:	00f60663          	beq	a2,a5,80005f58 <lwip_strnicmp+0x44>
80005f50:	00178793          	addi	a5,a5,1
80005f54:	fc0696e3          	bnez	a3,80005f20 <lwip_strnicmp+0xc>
80005f58:	00000513          	li	a0,0
80005f5c:	00008067          	ret
80005f60:	00100513          	li	a0,1
80005f64:	00008067          	ret

80005f68 <lwip_itoa>:
80005f68:	fe010113          	addi	sp,sp,-32
80005f6c:	01212823          	sw	s2,16(sp)
80005f70:	01412423          	sw	s4,8(sp)
80005f74:	00112e23          	sw	ra,28(sp)
80005f78:	00812c23          	sw	s0,24(sp)
80005f7c:	00912a23          	sw	s1,20(sp)
80005f80:	01312623          	sw	s3,12(sp)
80005f84:	00100793          	li	a5,1
80005f88:	00050913          	mv	s2,a0
80005f8c:	00058a13          	mv	s4,a1
80005f90:	02b7e663          	bltu	a5,a1,80005fbc <lwip_itoa+0x54>
80005f94:	00f59463          	bne	a1,a5,80005f9c <lwip_itoa+0x34>
80005f98:	00090023          	sb	zero,0(s2)
80005f9c:	01c12083          	lw	ra,28(sp)
80005fa0:	01812403          	lw	s0,24(sp)
80005fa4:	01412483          	lw	s1,20(sp)
80005fa8:	01012903          	lw	s2,16(sp)
80005fac:	00c12983          	lw	s3,12(sp)
80005fb0:	00812a03          	lw	s4,8(sp)
80005fb4:	02010113          	addi	sp,sp,32
80005fb8:	00008067          	ret
80005fbc:	00050993          	mv	s3,a0
80005fc0:	00065863          	bgez	a2,80005fd0 <lwip_itoa+0x68>
80005fc4:	02d00793          	li	a5,45
80005fc8:	00150993          	addi	s3,a0,1
80005fcc:	00f50023          	sb	a5,0(a0)
80005fd0:	41f65793          	srai	a5,a2,0x1f
80005fd4:	fffa0413          	addi	s0,s4,-1
80005fd8:	00890433          	add	s0,s2,s0
80005fdc:	00c7c4b3          	xor	s1,a5,a2
80005fe0:	40f484b3          	sub	s1,s1,a5
80005fe4:	00040023          	sb	zero,0(s0)
80005fe8:	04048263          	beqz	s1,8000602c <lwip_itoa+0xc4>
80005fec:	fa89f6e3          	bgeu	s3,s0,80005f98 <lwip_itoa+0x30>
80005ff0:	00a00593          	li	a1,10
80005ff4:	00048513          	mv	a0,s1
80005ff8:	410070ef          	jal	ra,8000d408 <__modsi3>
80005ffc:	03050513          	addi	a0,a0,48
80006000:	fff40413          	addi	s0,s0,-1
80006004:	00a40023          	sb	a0,0(s0)
80006008:	00a00593          	li	a1,10
8000600c:	00048513          	mv	a0,s1
80006010:	374070ef          	jal	ra,8000d384 <__divsi3>
80006014:	00050493          	mv	s1,a0
80006018:	fd1ff06f          	j	80005fe8 <lwip_itoa+0x80>
8000601c:	03000793          	li	a5,48
80006020:	00f98023          	sb	a5,0(s3)
80006024:	000980a3          	sb	zero,1(s3)
80006028:	f75ff06f          	j	80005f9c <lwip_itoa+0x34>
8000602c:	00044783          	lbu	a5,0(s0)
80006030:	fe0786e3          	beqz	a5,8000601c <lwip_itoa+0xb4>
80006034:	01490633          	add	a2,s2,s4
80006038:	40860633          	sub	a2,a2,s0
8000603c:	00040593          	mv	a1,s0
80006040:	01812403          	lw	s0,24(sp)
80006044:	01c12083          	lw	ra,28(sp)
80006048:	01412483          	lw	s1,20(sp)
8000604c:	01012903          	lw	s2,16(sp)
80006050:	00812a03          	lw	s4,8(sp)
80006054:	00098513          	mv	a0,s3
80006058:	00c12983          	lw	s3,12(sp)
8000605c:	02010113          	addi	sp,sp,32
80006060:	12c0806f          	j	8000e18c <memmove>

80006064 <lwip_standard_chksum>:
80006064:	ff010113          	addi	sp,sp,-16
80006068:	00011723          	sh	zero,14(sp)
8000606c:	00157693          	andi	a3,a0,1
80006070:	00068c63          	beqz	a3,80006088 <lwip_standard_chksum+0x24>
80006074:	00b05a63          	blez	a1,80006088 <lwip_standard_chksum+0x24>
80006078:	00054783          	lbu	a5,0(a0)
8000607c:	fff58593          	addi	a1,a1,-1
80006080:	00150513          	addi	a0,a0,1
80006084:	00f107a3          	sb	a5,15(sp)
80006088:	00000793          	li	a5,0
8000608c:	00100713          	li	a4,1
80006090:	06b74063          	blt	a4,a1,800060f0 <lwip_standard_chksum+0x8c>
80006094:	00e59663          	bne	a1,a4,800060a0 <lwip_standard_chksum+0x3c>
80006098:	00054703          	lbu	a4,0(a0)
8000609c:	00e10723          	sb	a4,14(sp)
800060a0:	00e15503          	lhu	a0,14(sp)
800060a4:	00010737          	lui	a4,0x10
800060a8:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
800060ac:	00f50533          	add	a0,a0,a5
800060b0:	01055793          	srli	a5,a0,0x10
800060b4:	00e57533          	and	a0,a0,a4
800060b8:	00a787b3          	add	a5,a5,a0
800060bc:	0107d513          	srli	a0,a5,0x10
800060c0:	00e7f7b3          	and	a5,a5,a4
800060c4:	00f50533          	add	a0,a0,a5
800060c8:	00068c63          	beqz	a3,800060e0 <lwip_standard_chksum+0x7c>
800060cc:	00851793          	slli	a5,a0,0x8
800060d0:	00855513          	srli	a0,a0,0x8
800060d4:	00e7f733          	and	a4,a5,a4
800060d8:	0ff57513          	andi	a0,a0,255
800060dc:	00a76533          	or	a0,a4,a0
800060e0:	01051513          	slli	a0,a0,0x10
800060e4:	01055513          	srli	a0,a0,0x10
800060e8:	01010113          	addi	sp,sp,16
800060ec:	00008067          	ret
800060f0:	00250513          	addi	a0,a0,2
800060f4:	ffe55603          	lhu	a2,-2(a0)
800060f8:	ffe58593          	addi	a1,a1,-2
800060fc:	00c787b3          	add	a5,a5,a2
80006100:	f91ff06f          	j	80006090 <lwip_standard_chksum+0x2c>

80006104 <inet_chksum_pseudo>:
80006104:	fe010113          	addi	sp,sp,-32
80006108:	00812c23          	sw	s0,24(sp)
8000610c:	00912a23          	sw	s1,20(sp)
80006110:	01212823          	sw	s2,16(sp)
80006114:	01312623          	sw	s3,12(sp)
80006118:	01412423          	sw	s4,8(sp)
8000611c:	01512223          	sw	s5,4(sp)
80006120:	00112e23          	sw	ra,28(sp)
80006124:	00072703          	lw	a4,0(a4)
80006128:	0006a683          	lw	a3,0(a3) # ff0000 <_stack_size+0xfef800>
8000612c:	000107b7          	lui	a5,0x10
80006130:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80006134:	00f77433          	and	s0,a4,a5
80006138:	01075713          	srli	a4,a4,0x10
8000613c:	00e40433          	add	s0,s0,a4
80006140:	00f6f733          	and	a4,a3,a5
80006144:	00e40433          	add	s0,s0,a4
80006148:	0106d693          	srli	a3,a3,0x10
8000614c:	008686b3          	add	a3,a3,s0
80006150:	0106d413          	srli	s0,a3,0x10
80006154:	00f6f6b3          	and	a3,a3,a5
80006158:	00d406b3          	add	a3,s0,a3
8000615c:	0106d413          	srli	s0,a3,0x10
80006160:	00f6f6b3          	and	a3,a3,a5
80006164:	00050993          	mv	s3,a0
80006168:	00058a13          	mv	s4,a1
8000616c:	00060913          	mv	s2,a2
80006170:	00d40433          	add	s0,s0,a3
80006174:	00000a93          	li	s5,0
80006178:	00078493          	mv	s1,a5
8000617c:	08099863          	bnez	s3,8000620c <inet_chksum_pseudo+0x108>
80006180:	020a8063          	beqz	s5,800061a0 <inet_chksum_pseudo+0x9c>
80006184:	00010737          	lui	a4,0x10
80006188:	00841793          	slli	a5,s0,0x8
8000618c:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
80006190:	00845413          	srli	s0,s0,0x8
80006194:	00e7f7b3          	and	a5,a5,a4
80006198:	0ff47413          	andi	s0,s0,255
8000619c:	0087e433          	or	s0,a5,s0
800061a0:	000a0513          	mv	a0,s4
800061a4:	c51ff0ef          	jal	ra,80005df4 <lwip_htons>
800061a8:	00050493          	mv	s1,a0
800061ac:	00090513          	mv	a0,s2
800061b0:	c45ff0ef          	jal	ra,80005df4 <lwip_htons>
800061b4:	00a48533          	add	a0,s1,a0
800061b8:	000107b7          	lui	a5,0x10
800061bc:	00850433          	add	s0,a0,s0
800061c0:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
800061c4:	01045513          	srli	a0,s0,0x10
800061c8:	00f47433          	and	s0,s0,a5
800061cc:	00850433          	add	s0,a0,s0
800061d0:	01045513          	srli	a0,s0,0x10
800061d4:	00f47433          	and	s0,s0,a5
800061d8:	00850433          	add	s0,a0,s0
800061dc:	fff44513          	not	a0,s0
800061e0:	01c12083          	lw	ra,28(sp)
800061e4:	01812403          	lw	s0,24(sp)
800061e8:	01051513          	slli	a0,a0,0x10
800061ec:	01412483          	lw	s1,20(sp)
800061f0:	01012903          	lw	s2,16(sp)
800061f4:	00c12983          	lw	s3,12(sp)
800061f8:	00812a03          	lw	s4,8(sp)
800061fc:	00412a83          	lw	s5,4(sp)
80006200:	01055513          	srli	a0,a0,0x10
80006204:	02010113          	addi	sp,sp,32
80006208:	00008067          	ret
8000620c:	00a9d583          	lhu	a1,10(s3)
80006210:	0049a503          	lw	a0,4(s3)
80006214:	e51ff0ef          	jal	ra,80006064 <lwip_standard_chksum>
80006218:	00850433          	add	s0,a0,s0
8000621c:	01045793          	srli	a5,s0,0x10
80006220:	00947433          	and	s0,s0,s1
80006224:	00878433          	add	s0,a5,s0
80006228:	00a9d783          	lhu	a5,10(s3)
8000622c:	0017f793          	andi	a5,a5,1
80006230:	00078e63          	beqz	a5,8000624c <inet_chksum_pseudo+0x148>
80006234:	00841793          	slli	a5,s0,0x8
80006238:	00845413          	srli	s0,s0,0x8
8000623c:	0097f7b3          	and	a5,a5,s1
80006240:	0ff47413          	andi	s0,s0,255
80006244:	001aca93          	xori	s5,s5,1
80006248:	0087e433          	or	s0,a5,s0
8000624c:	0009a983          	lw	s3,0(s3)
80006250:	f2dff06f          	j	8000617c <inet_chksum_pseudo+0x78>

80006254 <ip_chksum_pseudo>:
80006254:	eb1ff06f          	j	80006104 <inet_chksum_pseudo>

80006258 <inet_chksum_pseudo_partial>:
80006258:	fd010113          	addi	sp,sp,-48
8000625c:	02812423          	sw	s0,40(sp)
80006260:	02912223          	sw	s1,36(sp)
80006264:	03212023          	sw	s2,32(sp)
80006268:	01412c23          	sw	s4,24(sp)
8000626c:	01512a23          	sw	s5,20(sp)
80006270:	01612823          	sw	s6,16(sp)
80006274:	02112623          	sw	ra,44(sp)
80006278:	01312e23          	sw	s3,28(sp)
8000627c:	00060913          	mv	s2,a2
80006280:	0007a603          	lw	a2,0(a5)
80006284:	00072703          	lw	a4,0(a4)
80006288:	000107b7          	lui	a5,0x10
8000628c:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80006290:	00f67433          	and	s0,a2,a5
80006294:	01065613          	srli	a2,a2,0x10
80006298:	00c40433          	add	s0,s0,a2
8000629c:	00f77633          	and	a2,a4,a5
800062a0:	00c40433          	add	s0,s0,a2
800062a4:	01075713          	srli	a4,a4,0x10
800062a8:	00870733          	add	a4,a4,s0
800062ac:	01075413          	srli	s0,a4,0x10
800062b0:	00f77733          	and	a4,a4,a5
800062b4:	00e40733          	add	a4,s0,a4
800062b8:	01075413          	srli	s0,a4,0x10
800062bc:	00f77733          	and	a4,a4,a5
800062c0:	00050a13          	mv	s4,a0
800062c4:	00058a93          	mv	s5,a1
800062c8:	00e40433          	add	s0,s0,a4
800062cc:	00000b13          	li	s6,0
800062d0:	00078493          	mv	s1,a5
800062d4:	060a1c63          	bnez	s4,8000634c <inet_chksum_pseudo_partial+0xf4>
800062d8:	0e0b1663          	bnez	s6,800063c4 <inet_chksum_pseudo_partial+0x16c>
800062dc:	000a8513          	mv	a0,s5
800062e0:	b15ff0ef          	jal	ra,80005df4 <lwip_htons>
800062e4:	00050493          	mv	s1,a0
800062e8:	00090513          	mv	a0,s2
800062ec:	b09ff0ef          	jal	ra,80005df4 <lwip_htons>
800062f0:	00a48533          	add	a0,s1,a0
800062f4:	000107b7          	lui	a5,0x10
800062f8:	00850433          	add	s0,a0,s0
800062fc:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80006300:	01045513          	srli	a0,s0,0x10
80006304:	00f47433          	and	s0,s0,a5
80006308:	00850433          	add	s0,a0,s0
8000630c:	01045513          	srli	a0,s0,0x10
80006310:	00f47433          	and	s0,s0,a5
80006314:	00850433          	add	s0,a0,s0
80006318:	fff44513          	not	a0,s0
8000631c:	02c12083          	lw	ra,44(sp)
80006320:	02812403          	lw	s0,40(sp)
80006324:	01051513          	slli	a0,a0,0x10
80006328:	02412483          	lw	s1,36(sp)
8000632c:	02012903          	lw	s2,32(sp)
80006330:	01c12983          	lw	s3,28(sp)
80006334:	01812a03          	lw	s4,24(sp)
80006338:	01412a83          	lw	s5,20(sp)
8000633c:	01012b03          	lw	s6,16(sp)
80006340:	01055513          	srli	a0,a0,0x10
80006344:	03010113          	addi	sp,sp,48
80006348:	00008067          	ret
8000634c:	f80686e3          	beqz	a3,800062d8 <inet_chksum_pseudo_partial+0x80>
80006350:	00aa5783          	lhu	a5,10(s4)
80006354:	00078993          	mv	s3,a5
80006358:	00f6f463          	bgeu	a3,a5,80006360 <inet_chksum_pseudo_partial+0x108>
8000635c:	00068993          	mv	s3,a3
80006360:	01099993          	slli	s3,s3,0x10
80006364:	004a2503          	lw	a0,4(s4)
80006368:	0109d993          	srli	s3,s3,0x10
8000636c:	00098593          	mv	a1,s3
80006370:	00d12623          	sw	a3,12(sp)
80006374:	cf1ff0ef          	jal	ra,80006064 <lwip_standard_chksum>
80006378:	00850433          	add	s0,a0,s0
8000637c:	01045793          	srli	a5,s0,0x10
80006380:	00c12683          	lw	a3,12(sp)
80006384:	00947433          	and	s0,s0,s1
80006388:	00878433          	add	s0,a5,s0
8000638c:	00aa5783          	lhu	a5,10(s4)
80006390:	413689b3          	sub	s3,a3,s3
80006394:	01099693          	slli	a3,s3,0x10
80006398:	0017f793          	andi	a5,a5,1
8000639c:	0106d693          	srli	a3,a3,0x10
800063a0:	00078e63          	beqz	a5,800063bc <inet_chksum_pseudo_partial+0x164>
800063a4:	00841793          	slli	a5,s0,0x8
800063a8:	00845413          	srli	s0,s0,0x8
800063ac:	0097f7b3          	and	a5,a5,s1
800063b0:	0ff47413          	andi	s0,s0,255
800063b4:	001b4b13          	xori	s6,s6,1
800063b8:	0087e433          	or	s0,a5,s0
800063bc:	000a2a03          	lw	s4,0(s4)
800063c0:	f15ff06f          	j	800062d4 <inet_chksum_pseudo_partial+0x7c>
800063c4:	00010737          	lui	a4,0x10
800063c8:	00841793          	slli	a5,s0,0x8
800063cc:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
800063d0:	00845413          	srli	s0,s0,0x8
800063d4:	00e7f7b3          	and	a5,a5,a4
800063d8:	0ff47413          	andi	s0,s0,255
800063dc:	0087e433          	or	s0,a5,s0
800063e0:	efdff06f          	j	800062dc <inet_chksum_pseudo_partial+0x84>

800063e4 <ip_chksum_pseudo_partial>:
800063e4:	e75ff06f          	j	80006258 <inet_chksum_pseudo_partial>

800063e8 <inet_chksum>:
800063e8:	ff010113          	addi	sp,sp,-16
800063ec:	00112623          	sw	ra,12(sp)
800063f0:	c75ff0ef          	jal	ra,80006064 <lwip_standard_chksum>
800063f4:	00c12083          	lw	ra,12(sp)
800063f8:	fff54513          	not	a0,a0
800063fc:	01051513          	slli	a0,a0,0x10
80006400:	01055513          	srli	a0,a0,0x10
80006404:	01010113          	addi	sp,sp,16
80006408:	00008067          	ret

8000640c <inet_chksum_pbuf>:
8000640c:	fe010113          	addi	sp,sp,-32
80006410:	01212823          	sw	s2,16(sp)
80006414:	00010937          	lui	s2,0x10
80006418:	00812c23          	sw	s0,24(sp)
8000641c:	00912a23          	sw	s1,20(sp)
80006420:	01312623          	sw	s3,12(sp)
80006424:	00112e23          	sw	ra,28(sp)
80006428:	00050493          	mv	s1,a0
8000642c:	00000993          	li	s3,0
80006430:	00000413          	li	s0,0
80006434:	fff90913          	addi	s2,s2,-1 # ffff <_stack_size+0xf7ff>
80006438:	04049663          	bnez	s1,80006484 <inet_chksum_pbuf+0x78>
8000643c:	02098063          	beqz	s3,8000645c <inet_chksum_pbuf+0x50>
80006440:	00010737          	lui	a4,0x10
80006444:	00841793          	slli	a5,s0,0x8
80006448:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
8000644c:	00845413          	srli	s0,s0,0x8
80006450:	00e7f7b3          	and	a5,a5,a4
80006454:	0ff47413          	andi	s0,s0,255
80006458:	0087e433          	or	s0,a5,s0
8000645c:	fff44513          	not	a0,s0
80006460:	01c12083          	lw	ra,28(sp)
80006464:	01812403          	lw	s0,24(sp)
80006468:	01051513          	slli	a0,a0,0x10
8000646c:	01412483          	lw	s1,20(sp)
80006470:	01012903          	lw	s2,16(sp)
80006474:	00c12983          	lw	s3,12(sp)
80006478:	01055513          	srli	a0,a0,0x10
8000647c:	02010113          	addi	sp,sp,32
80006480:	00008067          	ret
80006484:	00a4d583          	lhu	a1,10(s1)
80006488:	0044a503          	lw	a0,4(s1)
8000648c:	bd9ff0ef          	jal	ra,80006064 <lwip_standard_chksum>
80006490:	00850433          	add	s0,a0,s0
80006494:	01045793          	srli	a5,s0,0x10
80006498:	01247433          	and	s0,s0,s2
8000649c:	00878433          	add	s0,a5,s0
800064a0:	00a4d783          	lhu	a5,10(s1)
800064a4:	0017f793          	andi	a5,a5,1
800064a8:	00078e63          	beqz	a5,800064c4 <inet_chksum_pbuf+0xb8>
800064ac:	00841793          	slli	a5,s0,0x8
800064b0:	00845413          	srli	s0,s0,0x8
800064b4:	0127f7b3          	and	a5,a5,s2
800064b8:	0ff47413          	andi	s0,s0,255
800064bc:	0019c993          	xori	s3,s3,1
800064c0:	0087e433          	or	s0,a5,s0
800064c4:	0004a483          	lw	s1,0(s1)
800064c8:	f71ff06f          	j	80006438 <inet_chksum_pbuf+0x2c>

800064cc <mem_overflow_check_raw>:
800064cc:	f5010113          	addi	sp,sp,-176
800064d0:	0a812423          	sw	s0,168(sp)
800064d4:	0a912223          	sw	s1,164(sp)
800064d8:	0b212023          	sw	s2,160(sp)
800064dc:	09312e23          	sw	s3,156(sp)
800064e0:	09412c23          	sw	s4,152(sp)
800064e4:	09512a23          	sw	s5,148(sp)
800064e8:	09612823          	sw	s6,144(sp)
800064ec:	09712623          	sw	s7,140(sp)
800064f0:	0a112623          	sw	ra,172(sp)
800064f4:	00050493          	mv	s1,a0
800064f8:	00058a93          	mv	s5,a1
800064fc:	00060913          	mv	s2,a2
80006500:	00068993          	mv	s3,a3
80006504:	00000413          	li	s0,0
80006508:	0cd00b13          	li	s6,205
8000650c:	80003bb7          	lui	s7,0x80003
80006510:	01000a13          	li	s4,16
80006514:	008a87b3          	add	a5,s5,s0
80006518:	00f487b3          	add	a5,s1,a5
8000651c:	0007c783          	lbu	a5,0(a5)
80006520:	01678e63          	beq	a5,s6,8000653c <mem_overflow_check_raw+0x70>
80006524:	00098713          	mv	a4,s3
80006528:	00090693          	mv	a3,s2
8000652c:	bd8b8613          	addi	a2,s7,-1064 # 80002bd8 <_heap_end+0xffff0bd8>
80006530:	08000593          	li	a1,128
80006534:	00010513          	mv	a0,sp
80006538:	128080ef          	jal	ra,8000e660 <sniprintf>
8000653c:	00140413          	addi	s0,s0,1
80006540:	fd441ae3          	bne	s0,s4,80006514 <mem_overflow_check_raw+0x48>
80006544:	ff048413          	addi	s0,s1,-16
80006548:	0cd00a13          	li	s4,205
8000654c:	80003ab7          	lui	s5,0x80003
80006550:	00044783          	lbu	a5,0(s0)
80006554:	01478e63          	beq	a5,s4,80006570 <mem_overflow_check_raw+0xa4>
80006558:	00098713          	mv	a4,s3
8000655c:	00090693          	mv	a3,s2
80006560:	bf8a8613          	addi	a2,s5,-1032 # 80002bf8 <_heap_end+0xffff0bf8>
80006564:	08000593          	li	a1,128
80006568:	00010513          	mv	a0,sp
8000656c:	0f4080ef          	jal	ra,8000e660 <sniprintf>
80006570:	00140413          	addi	s0,s0,1
80006574:	fc849ee3          	bne	s1,s0,80006550 <mem_overflow_check_raw+0x84>
80006578:	0ac12083          	lw	ra,172(sp)
8000657c:	0a812403          	lw	s0,168(sp)
80006580:	0a412483          	lw	s1,164(sp)
80006584:	0a012903          	lw	s2,160(sp)
80006588:	09c12983          	lw	s3,156(sp)
8000658c:	09812a03          	lw	s4,152(sp)
80006590:	09412a83          	lw	s5,148(sp)
80006594:	09012b03          	lw	s6,144(sp)
80006598:	08c12b83          	lw	s7,140(sp)
8000659c:	0b010113          	addi	sp,sp,176
800065a0:	00008067          	ret

800065a4 <mem_overflow_init_raw>:
800065a4:	ff010113          	addi	sp,sp,-16
800065a8:	00812423          	sw	s0,8(sp)
800065ac:	00912223          	sw	s1,4(sp)
800065b0:	00050413          	mv	s0,a0
800065b4:	00058493          	mv	s1,a1
800065b8:	01000613          	li	a2,16
800065bc:	0cd00593          	li	a1,205
800065c0:	ff050513          	addi	a0,a0,-16
800065c4:	00112623          	sw	ra,12(sp)
800065c8:	6b4060ef          	jal	ra,8000cc7c <memset>
800065cc:	00940533          	add	a0,s0,s1
800065d0:	00812403          	lw	s0,8(sp)
800065d4:	00c12083          	lw	ra,12(sp)
800065d8:	00412483          	lw	s1,4(sp)
800065dc:	01000613          	li	a2,16
800065e0:	0cd00593          	li	a1,205
800065e4:	01010113          	addi	sp,sp,16
800065e8:	6940606f          	j	8000cc7c <memset>

800065ec <mem_init>:
800065ec:	00008067          	ret

800065f0 <mem_trim>:
800065f0:	00008067          	ret

800065f4 <lwip_malloc>:
800065f4:	ff010113          	addi	sp,sp,-16
800065f8:	00812423          	sw	s0,8(sp)
800065fc:	00112623          	sw	ra,12(sp)
80006600:	265070ef          	jal	ra,8000e064 <malloc>
80006604:	00050413          	mv	s0,a0
80006608:	00051663          	bnez	a0,80006614 <lwip_malloc+0x20>
8000660c:	921fe0ef          	jal	ra,80004f2c <sys_arch_protect>
80006610:	921fe0ef          	jal	ra,80004f30 <sys_arch_unprotect>
80006614:	00040513          	mv	a0,s0
80006618:	00c12083          	lw	ra,12(sp)
8000661c:	00812403          	lw	s0,8(sp)
80006620:	01010113          	addi	sp,sp,16
80006624:	00008067          	ret

80006628 <lwip_free>:
80006628:	24d0706f          	j	8000e074 <free>

8000662c <lwip_calloc>:
8000662c:	3200706f          	j	8000d94c <calloc>

80006630 <do_memp_free_pool>:
80006630:	ff010113          	addi	sp,sp,-16
80006634:	00112623          	sw	ra,12(sp)
80006638:	00812423          	sw	s0,8(sp)
8000663c:	00912223          	sw	s1,4(sp)
80006640:	01212023          	sw	s2,0(sp)
80006644:	00058413          	mv	s0,a1
80006648:	00050493          	mv	s1,a0
8000664c:	8e1fe0ef          	jal	ra,80004f2c <sys_arch_protect>
80006650:	0004a683          	lw	a3,0(s1)
80006654:	0044d583          	lhu	a1,4(s1)
80006658:	80003637          	lui	a2,0x80003
8000665c:	00050913          	mv	s2,a0
80006660:	c3060613          	addi	a2,a2,-976 # 80002c30 <_heap_end+0xffff0c30>
80006664:	00040513          	mv	a0,s0
80006668:	e65ff0ef          	jal	ra,800064cc <mem_overflow_check_raw>
8000666c:	00090513          	mv	a0,s2
80006670:	8c1fe0ef          	jal	ra,80004f30 <sys_arch_unprotect>
80006674:	fe440513          	addi	a0,s0,-28
80006678:	00812403          	lw	s0,8(sp)
8000667c:	00c12083          	lw	ra,12(sp)
80006680:	00412483          	lw	s1,4(sp)
80006684:	00012903          	lw	s2,0(sp)
80006688:	01010113          	addi	sp,sp,16
8000668c:	f9dff06f          	j	80006628 <lwip_free>

80006690 <do_memp_malloc_pool_fn>:
80006690:	fe010113          	addi	sp,sp,-32
80006694:	00812c23          	sw	s0,24(sp)
80006698:	00912a23          	sw	s1,20(sp)
8000669c:	00112e23          	sw	ra,28(sp)
800066a0:	01212823          	sw	s2,16(sp)
800066a4:	00050493          	mv	s1,a0
800066a8:	00455503          	lhu	a0,4(a0)
800066ac:	00b12623          	sw	a1,12(sp)
800066b0:	00c12423          	sw	a2,8(sp)
800066b4:	00350513          	addi	a0,a0,3
800066b8:	ffc57513          	andi	a0,a0,-4
800066bc:	02c50513          	addi	a0,a0,44
800066c0:	f35ff0ef          	jal	ra,800065f4 <lwip_malloc>
800066c4:	00050413          	mv	s0,a0
800066c8:	865fe0ef          	jal	ra,80004f2c <sys_arch_protect>
800066cc:	02040663          	beqz	s0,800066f8 <do_memp_malloc_pool_fn+0x68>
800066d0:	00c12583          	lw	a1,12(sp)
800066d4:	00812603          	lw	a2,8(sp)
800066d8:	01c40413          	addi	s0,s0,28
800066dc:	feb42423          	sw	a1,-24(s0)
800066e0:	fec42623          	sw	a2,-20(s0)
800066e4:	0044d583          	lhu	a1,4(s1)
800066e8:	00050913          	mv	s2,a0
800066ec:	00040513          	mv	a0,s0
800066f0:	eb5ff0ef          	jal	ra,800065a4 <mem_overflow_init_raw>
800066f4:	00090513          	mv	a0,s2
800066f8:	839fe0ef          	jal	ra,80004f30 <sys_arch_unprotect>
800066fc:	00040513          	mv	a0,s0
80006700:	01c12083          	lw	ra,28(sp)
80006704:	01812403          	lw	s0,24(sp)
80006708:	01412483          	lw	s1,20(sp)
8000670c:	01012903          	lw	s2,16(sp)
80006710:	02010113          	addi	sp,sp,32
80006714:	00008067          	ret

80006718 <memp_init_pool>:
80006718:	00008067          	ret

8000671c <memp_init>:
8000671c:	00008067          	ret

80006720 <memp_malloc_pool_fn>:
80006720:	00050463          	beqz	a0,80006728 <memp_malloc_pool_fn+0x8>
80006724:	f6dff06f          	j	80006690 <do_memp_malloc_pool_fn>
80006728:	00008067          	ret

8000672c <memp_malloc_fn>:
8000672c:	00500793          	li	a5,5
80006730:	00a7ee63          	bltu	a5,a0,8000674c <memp_malloc_fn+0x20>
80006734:	00251793          	slli	a5,a0,0x2
80006738:	80003537          	lui	a0,0x80003
8000673c:	c1850513          	addi	a0,a0,-1000 # 80002c18 <_heap_end+0xffff0c18>
80006740:	00f50533          	add	a0,a0,a5
80006744:	00052503          	lw	a0,0(a0)
80006748:	f49ff06f          	j	80006690 <do_memp_malloc_pool_fn>
8000674c:	00000513          	li	a0,0
80006750:	00008067          	ret

80006754 <memp_free_pool>:
80006754:	00050663          	beqz	a0,80006760 <memp_free_pool+0xc>
80006758:	00058463          	beqz	a1,80006760 <memp_free_pool+0xc>
8000675c:	ed5ff06f          	j	80006630 <do_memp_free_pool>
80006760:	00008067          	ret

80006764 <memp_free>:
80006764:	00500713          	li	a4,5
80006768:	02a76063          	bltu	a4,a0,80006788 <memp_free+0x24>
8000676c:	00058e63          	beqz	a1,80006788 <memp_free+0x24>
80006770:	00251793          	slli	a5,a0,0x2
80006774:	80003537          	lui	a0,0x80003
80006778:	c1850513          	addi	a0,a0,-1000 # 80002c18 <_heap_end+0xffff0c18>
8000677c:	00f50533          	add	a0,a0,a5
80006780:	00052503          	lw	a0,0(a0)
80006784:	eadff06f          	j	80006630 <do_memp_free_pool>
80006788:	00008067          	ret

8000678c <netif_null_output_ip4>:
8000678c:	ff400513          	li	a0,-12
80006790:	00008067          	ret

80006794 <netif_issue_reports>:
80006794:	03554783          	lbu	a5,53(a0)
80006798:	00500693          	li	a3,5
8000679c:	0057f613          	andi	a2,a5,5
800067a0:	02d61263          	bne	a2,a3,800067c4 <netif_issue_reports+0x30>
800067a4:	0015f593          	andi	a1,a1,1
800067a8:	00058e63          	beqz	a1,800067c4 <netif_issue_reports+0x30>
800067ac:	00452683          	lw	a3,4(a0)
800067b0:	00068a63          	beqz	a3,800067c4 <netif_issue_reports+0x30>
800067b4:	0087f793          	andi	a5,a5,8
800067b8:	00078663          	beqz	a5,800067c4 <netif_issue_reports+0x30>
800067bc:	00450593          	addi	a1,a0,4
800067c0:	0e50406f          	j	8000b0a4 <etharp_request>
800067c4:	00008067          	ret

800067c8 <netif_do_set_ipaddr>:
800067c8:	00452783          	lw	a5,4(a0)
800067cc:	0005a703          	lw	a4,0(a1)
800067d0:	08f70263          	beq	a4,a5,80006854 <netif_do_set_ipaddr+0x8c>
800067d4:	fe010113          	addi	sp,sp,-32
800067d8:	00f62023          	sw	a5,0(a2)
800067dc:	00812c23          	sw	s0,24(sp)
800067e0:	01212823          	sw	s2,16(sp)
800067e4:	00050413          	mv	s0,a0
800067e8:	00058913          	mv	s2,a1
800067ec:	00060513          	mv	a0,a2
800067f0:	00c10593          	addi	a1,sp,12
800067f4:	00112e23          	sw	ra,28(sp)
800067f8:	00e12623          	sw	a4,12(sp)
800067fc:	00912a23          	sw	s1,20(sp)
80006800:	00060493          	mv	s1,a2
80006804:	464020ef          	jal	ra,80008c68 <udp_netif_ip_addr_changed>
80006808:	00c10593          	addi	a1,sp,12
8000680c:	00048513          	mv	a0,s1
80006810:	0c5010ef          	jal	ra,800080d4 <raw_netif_ip_addr_changed>
80006814:	00092783          	lw	a5,0(s2)
80006818:	00100593          	li	a1,1
8000681c:	00040513          	mv	a0,s0
80006820:	00f42223          	sw	a5,4(s0)
80006824:	f71ff0ef          	jal	ra,80006794 <netif_issue_reports>
80006828:	01c42783          	lw	a5,28(s0)
8000682c:	00078663          	beqz	a5,80006838 <netif_do_set_ipaddr+0x70>
80006830:	00040513          	mv	a0,s0
80006834:	000780e7          	jalr	a5
80006838:	01c12083          	lw	ra,28(sp)
8000683c:	01812403          	lw	s0,24(sp)
80006840:	01412483          	lw	s1,20(sp)
80006844:	01012903          	lw	s2,16(sp)
80006848:	00100513          	li	a0,1
8000684c:	02010113          	addi	sp,sp,32
80006850:	00008067          	ret
80006854:	00000513          	li	a0,0
80006858:	00008067          	ret

8000685c <netif_init>:
8000685c:	00008067          	ret

80006860 <netif_input>:
80006860:	0355c783          	lbu	a5,53(a1)
80006864:	0187f793          	andi	a5,a5,24
80006868:	00078463          	beqz	a5,80006870 <netif_input+0x10>
8000686c:	1d40606f          	j	8000ca40 <ethernet_input>
80006870:	6300506f          	j	8000bea0 <ip4_input>

80006874 <netif_set_ipaddr>:
80006874:	02050463          	beqz	a0,8000689c <netif_set_ipaddr+0x28>
80006878:	fe010113          	addi	sp,sp,-32
8000687c:	00112e23          	sw	ra,28(sp)
80006880:	00059463          	bnez	a1,80006888 <netif_set_ipaddr+0x14>
80006884:	84818593          	addi	a1,gp,-1976 # 80003088 <ip_addr_any>
80006888:	00c10613          	addi	a2,sp,12
8000688c:	f3dff0ef          	jal	ra,800067c8 <netif_do_set_ipaddr>
80006890:	01c12083          	lw	ra,28(sp)
80006894:	02010113          	addi	sp,sp,32
80006898:	00008067          	ret
8000689c:	00008067          	ret

800068a0 <netif_set_netmask>:
800068a0:	00050e63          	beqz	a0,800068bc <netif_set_netmask+0x1c>
800068a4:	00059463          	bnez	a1,800068ac <netif_set_netmask+0xc>
800068a8:	84818593          	addi	a1,gp,-1976 # 80003088 <ip_addr_any>
800068ac:	0005a783          	lw	a5,0(a1)
800068b0:	00852703          	lw	a4,8(a0)
800068b4:	00e78463          	beq	a5,a4,800068bc <netif_set_netmask+0x1c>
800068b8:	00f52423          	sw	a5,8(a0)
800068bc:	00008067          	ret

800068c0 <netif_set_gw>:
800068c0:	00050e63          	beqz	a0,800068dc <netif_set_gw+0x1c>
800068c4:	00059463          	bnez	a1,800068cc <netif_set_gw+0xc>
800068c8:	84818593          	addi	a1,gp,-1976 # 80003088 <ip_addr_any>
800068cc:	0005a783          	lw	a5,0(a1)
800068d0:	00c52703          	lw	a4,12(a0)
800068d4:	00e78463          	beq	a5,a4,800068dc <netif_set_gw+0x1c>
800068d8:	00f52623          	sw	a5,12(a0)
800068dc:	00008067          	ret

800068e0 <netif_set_addr>:
800068e0:	fd010113          	addi	sp,sp,-48
800068e4:	02812423          	sw	s0,40(sp)
800068e8:	02912223          	sw	s1,36(sp)
800068ec:	03212023          	sw	s2,32(sp)
800068f0:	02112623          	sw	ra,44(sp)
800068f4:	00050493          	mv	s1,a0
800068f8:	00060913          	mv	s2,a2
800068fc:	00058413          	mv	s0,a1
80006900:	00059463          	bnez	a1,80006908 <netif_set_addr+0x28>
80006904:	84818413          	addi	s0,gp,-1976 # 80003088 <ip_addr_any>
80006908:	00091463          	bnez	s2,80006910 <netif_set_addr+0x30>
8000690c:	84818913          	addi	s2,gp,-1976 # 80003088 <ip_addr_any>
80006910:	00069463          	bnez	a3,80006918 <netif_set_addr+0x38>
80006914:	84818693          	addi	a3,gp,-1976 # 80003088 <ip_addr_any>
80006918:	00042783          	lw	a5,0(s0)
8000691c:	00078663          	beqz	a5,80006928 <netif_set_addr+0x48>
80006920:	00000793          	li	a5,0
80006924:	0200006f          	j	80006944 <netif_set_addr+0x64>
80006928:	01c10613          	addi	a2,sp,28
8000692c:	00040593          	mv	a1,s0
80006930:	00048513          	mv	a0,s1
80006934:	00d12623          	sw	a3,12(sp)
80006938:	e91ff0ef          	jal	ra,800067c8 <netif_do_set_ipaddr>
8000693c:	00c12683          	lw	a3,12(sp)
80006940:	00100793          	li	a5,1
80006944:	00092703          	lw	a4,0(s2)
80006948:	0084a603          	lw	a2,8(s1)
8000694c:	00c70463          	beq	a4,a2,80006954 <netif_set_addr+0x74>
80006950:	00e4a423          	sw	a4,8(s1)
80006954:	0006a703          	lw	a4,0(a3)
80006958:	00c4a683          	lw	a3,12(s1)
8000695c:	00d70463          	beq	a4,a3,80006964 <netif_set_addr+0x84>
80006960:	00e4a623          	sw	a4,12(s1)
80006964:	00079a63          	bnez	a5,80006978 <netif_set_addr+0x98>
80006968:	01c10613          	addi	a2,sp,28
8000696c:	00040593          	mv	a1,s0
80006970:	00048513          	mv	a0,s1
80006974:	e55ff0ef          	jal	ra,800067c8 <netif_do_set_ipaddr>
80006978:	02c12083          	lw	ra,44(sp)
8000697c:	02812403          	lw	s0,40(sp)
80006980:	02412483          	lw	s1,36(sp)
80006984:	02012903          	lw	s2,32(sp)
80006988:	03010113          	addi	sp,sp,48
8000698c:	00008067          	ret

80006990 <netif_add>:
80006990:	fe010113          	addi	sp,sp,-32
80006994:	00112e23          	sw	ra,28(sp)
80006998:	00812c23          	sw	s0,24(sp)
8000699c:	00912a23          	sw	s1,20(sp)
800069a0:	02051063          	bnez	a0,800069c0 <netif_add+0x30>
800069a4:	00000413          	li	s0,0
800069a8:	00040513          	mv	a0,s0
800069ac:	01c12083          	lw	ra,28(sp)
800069b0:	01812403          	lw	s0,24(sp)
800069b4:	01412483          	lw	s1,20(sp)
800069b8:	02010113          	addi	sp,sp,32
800069bc:	00008067          	ret
800069c0:	fe0782e3          	beqz	a5,800069a4 <netif_add+0x14>
800069c4:	00050413          	mv	s0,a0
800069c8:	00059463          	bnez	a1,800069d0 <netif_add+0x40>
800069cc:	84818593          	addi	a1,gp,-1976 # 80003088 <ip_addr_any>
800069d0:	00061463          	bnez	a2,800069d8 <netif_add+0x48>
800069d4:	84818613          	addi	a2,gp,-1976 # 80003088 <ip_addr_any>
800069d8:	00069463          	bnez	a3,800069e0 <netif_add+0x50>
800069dc:	84818693          	addi	a3,gp,-1976 # 80003088 <ip_addr_any>
800069e0:	02e42223          	sw	a4,36(s0)
800069e4:	8c41c703          	lbu	a4,-1852(gp) # 80003104 <netif_num>
800069e8:	80006537          	lui	a0,0x80006
800069ec:	78c50513          	addi	a0,a0,1932 # 8000678c <_heap_end+0xffff478c>
800069f0:	00a42a23          	sw	a0,20(s0)
800069f4:	00042223          	sw	zero,4(s0)
800069f8:	00040513          	mv	a0,s0
800069fc:	00042423          	sw	zero,8(s0)
80006a00:	00042623          	sw	zero,12(s0)
80006a04:	02041623          	sh	zero,44(s0)
80006a08:	02040aa3          	sb	zero,53(s0)
80006a0c:	02040423          	sb	zero,40(s0)
80006a10:	020404a3          	sb	zero,41(s0)
80006a14:	02040523          	sb	zero,42(s0)
80006a18:	020405a3          	sb	zero,43(s0)
80006a1c:	00042e23          	sw	zero,28(s0)
80006a20:	02042023          	sw	zero,32(s0)
80006a24:	02e40c23          	sb	a4,56(s0)
80006a28:	01042823          	sw	a6,16(s0)
80006a2c:	02042e23          	sw	zero,60(s0)
80006a30:	00f12623          	sw	a5,12(sp)
80006a34:	eadff0ef          	jal	ra,800068e0 <netif_set_addr>
80006a38:	00c12783          	lw	a5,12(sp)
80006a3c:	00040513          	mv	a0,s0
80006a40:	000780e7          	jalr	a5
80006a44:	f60510e3          	bnez	a0,800069a4 <netif_add+0x14>
80006a48:	8cc1a603          	lw	a2,-1844(gp) # 8000310c <netif_list>
80006a4c:	00078713          	mv	a4,a5
80006a50:	0ff00593          	li	a1,255
80006a54:	03844783          	lbu	a5,56(s0)
80006a58:	00b79463          	bne	a5,a1,80006a60 <netif_add+0xd0>
80006a5c:	02040c23          	sb	zero,56(s0)
80006a60:	03844783          	lbu	a5,56(s0)
80006a64:	00060693          	mv	a3,a2
80006a68:	02069463          	bnez	a3,80006a90 <netif_add+0x100>
80006a6c:	0fe00593          	li	a1,254
80006a70:	00000693          	li	a3,0
80006a74:	00b78663          	beq	a5,a1,80006a80 <netif_add+0xf0>
80006a78:	00178793          	addi	a5,a5,1
80006a7c:	0ff7f693          	andi	a3,a5,255
80006a80:	00c42023          	sw	a2,0(s0)
80006a84:	8cd18223          	sb	a3,-1852(gp) # 80003104 <netif_num>
80006a88:	8c81a623          	sw	s0,-1844(gp) # 8000310c <netif_list>
80006a8c:	f1dff06f          	j	800069a8 <netif_add+0x18>
80006a90:	0386c503          	lbu	a0,56(a3)
80006a94:	00f51863          	bne	a0,a5,80006aa4 <netif_add+0x114>
80006a98:	00178793          	addi	a5,a5,1
80006a9c:	02f40c23          	sb	a5,56(s0)
80006aa0:	fb5ff06f          	j	80006a54 <netif_add+0xc4>
80006aa4:	0006a683          	lw	a3,0(a3)
80006aa8:	fc1ff06f          	j	80006a68 <netif_add+0xd8>

80006aac <netif_add_noaddr>:
80006aac:	00068813          	mv	a6,a3
80006ab0:	00060793          	mv	a5,a2
80006ab4:	00058713          	mv	a4,a1
80006ab8:	00000693          	li	a3,0
80006abc:	00000613          	li	a2,0
80006ac0:	00000593          	li	a1,0
80006ac4:	ecdff06f          	j	80006990 <netif_add>

80006ac8 <netif_set_default>:
80006ac8:	8ca1a423          	sw	a0,-1848(gp) # 80003108 <netif_default>
80006acc:	00008067          	ret

80006ad0 <netif_set_up>:
80006ad0:	04050e63          	beqz	a0,80006b2c <netif_set_up+0x5c>
80006ad4:	ff010113          	addi	sp,sp,-16
80006ad8:	00812423          	sw	s0,8(sp)
80006adc:	00112623          	sw	ra,12(sp)
80006ae0:	03554783          	lbu	a5,53(a0)
80006ae4:	00050413          	mv	s0,a0
80006ae8:	0017f713          	andi	a4,a5,1
80006aec:	02071863          	bnez	a4,80006b1c <netif_set_up+0x4c>
80006af0:	0017e793          	ori	a5,a5,1
80006af4:	02f50aa3          	sb	a5,53(a0)
80006af8:	01c52783          	lw	a5,28(a0)
80006afc:	00078463          	beqz	a5,80006b04 <netif_set_up+0x34>
80006b00:	000780e7          	jalr	a5
80006b04:	00040513          	mv	a0,s0
80006b08:	00812403          	lw	s0,8(sp)
80006b0c:	00c12083          	lw	ra,12(sp)
80006b10:	00300593          	li	a1,3
80006b14:	01010113          	addi	sp,sp,16
80006b18:	c7dff06f          	j	80006794 <netif_issue_reports>
80006b1c:	00c12083          	lw	ra,12(sp)
80006b20:	00812403          	lw	s0,8(sp)
80006b24:	01010113          	addi	sp,sp,16
80006b28:	00008067          	ret
80006b2c:	00008067          	ret

80006b30 <netif_set_down>:
80006b30:	06050063          	beqz	a0,80006b90 <netif_set_down+0x60>
80006b34:	ff010113          	addi	sp,sp,-16
80006b38:	00812423          	sw	s0,8(sp)
80006b3c:	00112623          	sw	ra,12(sp)
80006b40:	03554783          	lbu	a5,53(a0)
80006b44:	00050413          	mv	s0,a0
80006b48:	0017f713          	andi	a4,a5,1
80006b4c:	02070a63          	beqz	a4,80006b80 <netif_set_down+0x50>
80006b50:	ffe7f713          	andi	a4,a5,-2
80006b54:	02e50aa3          	sb	a4,53(a0)
80006b58:	0087f793          	andi	a5,a5,8
80006b5c:	00078463          	beqz	a5,80006b64 <netif_set_down+0x34>
80006b60:	1cc040ef          	jal	ra,8000ad2c <etharp_cleanup_netif>
80006b64:	01c42303          	lw	t1,28(s0)
80006b68:	00030c63          	beqz	t1,80006b80 <netif_set_down+0x50>
80006b6c:	00040513          	mv	a0,s0
80006b70:	00812403          	lw	s0,8(sp)
80006b74:	00c12083          	lw	ra,12(sp)
80006b78:	01010113          	addi	sp,sp,16
80006b7c:	00030067          	jr	t1
80006b80:	00c12083          	lw	ra,12(sp)
80006b84:	00812403          	lw	s0,8(sp)
80006b88:	01010113          	addi	sp,sp,16
80006b8c:	00008067          	ret
80006b90:	00008067          	ret

80006b94 <netif_remove>:
80006b94:	08050e63          	beqz	a0,80006c30 <netif_remove+0x9c>
80006b98:	ff010113          	addi	sp,sp,-16
80006b9c:	00812423          	sw	s0,8(sp)
80006ba0:	00112623          	sw	ra,12(sp)
80006ba4:	00912223          	sw	s1,4(sp)
80006ba8:	00452783          	lw	a5,4(a0)
80006bac:	00050413          	mv	s0,a0
80006bb0:	02078063          	beqz	a5,80006bd0 <netif_remove+0x3c>
80006bb4:	00450493          	addi	s1,a0,4
80006bb8:	00000593          	li	a1,0
80006bbc:	00048513          	mv	a0,s1
80006bc0:	0a8020ef          	jal	ra,80008c68 <udp_netif_ip_addr_changed>
80006bc4:	00000593          	li	a1,0
80006bc8:	00048513          	mv	a0,s1
80006bcc:	508010ef          	jal	ra,800080d4 <raw_netif_ip_addr_changed>
80006bd0:	03544783          	lbu	a5,53(s0)
80006bd4:	0017f793          	andi	a5,a5,1
80006bd8:	00078663          	beqz	a5,80006be4 <netif_remove+0x50>
80006bdc:	00040513          	mv	a0,s0
80006be0:	f51ff0ef          	jal	ra,80006b30 <netif_set_down>
80006be4:	8c81a703          	lw	a4,-1848(gp) # 80003108 <netif_default>
80006be8:	00871463          	bne	a4,s0,80006bf0 <netif_remove+0x5c>
80006bec:	8c01a423          	sw	zero,-1848(gp) # 80003108 <netif_default>
80006bf0:	8cc1a783          	lw	a5,-1844(gp) # 8000310c <netif_list>
80006bf4:	02879263          	bne	a5,s0,80006c18 <netif_remove+0x84>
80006bf8:	00042783          	lw	a5,0(s0)
80006bfc:	8cf1a623          	sw	a5,-1844(gp) # 8000310c <netif_list>
80006c00:	00c12083          	lw	ra,12(sp)
80006c04:	00812403          	lw	s0,8(sp)
80006c08:	00412483          	lw	s1,4(sp)
80006c0c:	01010113          	addi	sp,sp,16
80006c10:	00008067          	ret
80006c14:	00070793          	mv	a5,a4
80006c18:	fe0784e3          	beqz	a5,80006c00 <netif_remove+0x6c>
80006c1c:	0007a703          	lw	a4,0(a5)
80006c20:	fe871ae3          	bne	a4,s0,80006c14 <netif_remove+0x80>
80006c24:	00042703          	lw	a4,0(s0)
80006c28:	00e7a023          	sw	a4,0(a5)
80006c2c:	fd5ff06f          	j	80006c00 <netif_remove+0x6c>
80006c30:	00008067          	ret

80006c34 <netif_set_status_callback>:
80006c34:	00050463          	beqz	a0,80006c3c <netif_set_status_callback+0x8>
80006c38:	00b52e23          	sw	a1,28(a0)
80006c3c:	00008067          	ret

80006c40 <netif_set_link_up>:
80006c40:	06050263          	beqz	a0,80006ca4 <netif_set_link_up+0x64>
80006c44:	ff010113          	addi	sp,sp,-16
80006c48:	00812423          	sw	s0,8(sp)
80006c4c:	00112623          	sw	ra,12(sp)
80006c50:	03554783          	lbu	a5,53(a0)
80006c54:	00050413          	mv	s0,a0
80006c58:	0047f713          	andi	a4,a5,4
80006c5c:	02071c63          	bnez	a4,80006c94 <netif_set_link_up+0x54>
80006c60:	0047e793          	ori	a5,a5,4
80006c64:	02f50aa3          	sb	a5,53(a0)
80006c68:	3c8030ef          	jal	ra,8000a030 <dhcp_network_changed>
80006c6c:	00300593          	li	a1,3
80006c70:	00040513          	mv	a0,s0
80006c74:	b21ff0ef          	jal	ra,80006794 <netif_issue_reports>
80006c78:	02042303          	lw	t1,32(s0)
80006c7c:	00030c63          	beqz	t1,80006c94 <netif_set_link_up+0x54>
80006c80:	00040513          	mv	a0,s0
80006c84:	00812403          	lw	s0,8(sp)
80006c88:	00c12083          	lw	ra,12(sp)
80006c8c:	01010113          	addi	sp,sp,16
80006c90:	00030067          	jr	t1
80006c94:	00c12083          	lw	ra,12(sp)
80006c98:	00812403          	lw	s0,8(sp)
80006c9c:	01010113          	addi	sp,sp,16
80006ca0:	00008067          	ret
80006ca4:	00008067          	ret

80006ca8 <netif_set_link_down>:
80006ca8:	02050263          	beqz	a0,80006ccc <netif_set_link_down+0x24>
80006cac:	03554703          	lbu	a4,53(a0)
80006cb0:	00477693          	andi	a3,a4,4
80006cb4:	00068c63          	beqz	a3,80006ccc <netif_set_link_down+0x24>
80006cb8:	02052303          	lw	t1,32(a0)
80006cbc:	ffb77713          	andi	a4,a4,-5
80006cc0:	02e50aa3          	sb	a4,53(a0)
80006cc4:	00030463          	beqz	t1,80006ccc <netif_set_link_down+0x24>
80006cc8:	00030067          	jr	t1
80006ccc:	00008067          	ret

80006cd0 <netif_set_link_callback>:
80006cd0:	00050463          	beqz	a0,80006cd8 <netif_set_link_callback+0x8>
80006cd4:	02b52023          	sw	a1,32(a0)
80006cd8:	00008067          	ret

80006cdc <netif_get_by_index>:
80006cdc:	00000793          	li	a5,0
80006ce0:	00050663          	beqz	a0,80006cec <netif_get_by_index+0x10>
80006ce4:	8cc1a783          	lw	a5,-1844(gp) # 8000310c <netif_list>
80006ce8:	00079663          	bnez	a5,80006cf4 <netif_get_by_index+0x18>
80006cec:	00078513          	mv	a0,a5
80006cf0:	00008067          	ret
80006cf4:	0387c703          	lbu	a4,56(a5)
80006cf8:	00170713          	addi	a4,a4,1
80006cfc:	0ff77713          	andi	a4,a4,255
80006d00:	fea706e3          	beq	a4,a0,80006cec <netif_get_by_index+0x10>
80006d04:	0007a783          	lw	a5,0(a5)
80006d08:	fe1ff06f          	j	80006ce8 <netif_get_by_index+0xc>

80006d0c <netif_index_to_name>:
80006d0c:	ff010113          	addi	sp,sp,-16
80006d10:	00812423          	sw	s0,8(sp)
80006d14:	00912223          	sw	s1,4(sp)
80006d18:	00112623          	sw	ra,12(sp)
80006d1c:	00050493          	mv	s1,a0
80006d20:	00058413          	mv	s0,a1
80006d24:	fb9ff0ef          	jal	ra,80006cdc <netif_get_by_index>
80006d28:	02050463          	beqz	a0,80006d50 <netif_index_to_name+0x44>
80006d2c:	03654783          	lbu	a5,54(a0)
80006d30:	fff48613          	addi	a2,s1,-1
80006d34:	00400593          	li	a1,4
80006d38:	00f40023          	sb	a5,0(s0)
80006d3c:	03754783          	lbu	a5,55(a0)
80006d40:	00240513          	addi	a0,s0,2
80006d44:	00f400a3          	sb	a5,1(s0)
80006d48:	a20ff0ef          	jal	ra,80005f68 <lwip_itoa>
80006d4c:	00040513          	mv	a0,s0
80006d50:	00c12083          	lw	ra,12(sp)
80006d54:	00812403          	lw	s0,8(sp)
80006d58:	00412483          	lw	s1,4(sp)
80006d5c:	01010113          	addi	sp,sp,16
80006d60:	00008067          	ret

80006d64 <netif_find>:
80006d64:	00051663          	bnez	a0,80006d70 <netif_find+0xc>
80006d68:	00000513          	li	a0,0
80006d6c:	00008067          	ret
80006d70:	ff010113          	addi	sp,sp,-16
80006d74:	00812423          	sw	s0,8(sp)
80006d78:	00050413          	mv	s0,a0
80006d7c:	00250513          	addi	a0,a0,2
80006d80:	00112623          	sw	ra,12(sp)
80006d84:	3b1060ef          	jal	ra,8000d934 <atoi>
80006d88:	0ff57793          	andi	a5,a0,255
80006d8c:	8cc1a503          	lw	a0,-1844(gp) # 8000310c <netif_list>
80006d90:	00051c63          	bnez	a0,80006da8 <netif_find+0x44>
80006d94:	00000513          	li	a0,0
80006d98:	00c12083          	lw	ra,12(sp)
80006d9c:	00812403          	lw	s0,8(sp)
80006da0:	01010113          	addi	sp,sp,16
80006da4:	00008067          	ret
80006da8:	03854703          	lbu	a4,56(a0)
80006dac:	00f71e63          	bne	a4,a5,80006dc8 <netif_find+0x64>
80006db0:	00044683          	lbu	a3,0(s0)
80006db4:	03654703          	lbu	a4,54(a0)
80006db8:	00e69863          	bne	a3,a4,80006dc8 <netif_find+0x64>
80006dbc:	00144683          	lbu	a3,1(s0)
80006dc0:	03754703          	lbu	a4,55(a0)
80006dc4:	fce68ae3          	beq	a3,a4,80006d98 <netif_find+0x34>
80006dc8:	00052503          	lw	a0,0(a0)
80006dcc:	fc5ff06f          	j	80006d90 <netif_find+0x2c>

80006dd0 <netif_name_to_index>:
80006dd0:	ff010113          	addi	sp,sp,-16
80006dd4:	00112623          	sw	ra,12(sp)
80006dd8:	f8dff0ef          	jal	ra,80006d64 <netif_find>
80006ddc:	00050e63          	beqz	a0,80006df8 <netif_name_to_index+0x28>
80006de0:	03854503          	lbu	a0,56(a0)
80006de4:	00150513          	addi	a0,a0,1
80006de8:	0ff57513          	andi	a0,a0,255
80006dec:	00c12083          	lw	ra,12(sp)
80006df0:	01010113          	addi	sp,sp,16
80006df4:	00008067          	ret
80006df8:	00000513          	li	a0,0
80006dfc:	ff1ff06f          	j	80006dec <netif_name_to_index+0x1c>

80006e00 <pbuf_skip_const>:
80006e00:	00050663          	beqz	a0,80006e0c <pbuf_skip_const+0xc>
80006e04:	00a55783          	lhu	a5,10(a0)
80006e08:	00f5f863          	bgeu	a1,a5,80006e18 <pbuf_skip_const+0x18>
80006e0c:	00060463          	beqz	a2,80006e14 <pbuf_skip_const+0x14>
80006e10:	00b61023          	sh	a1,0(a2)
80006e14:	00008067          	ret
80006e18:	40f585b3          	sub	a1,a1,a5
80006e1c:	01059593          	slli	a1,a1,0x10
80006e20:	0105d593          	srli	a1,a1,0x10
80006e24:	00052503          	lw	a0,0(a0)
80006e28:	fd9ff06f          	j	80006e00 <pbuf_skip_const>

80006e2c <pbuf_add_header_impl>:
80006e2c:	00050793          	mv	a5,a0
80006e30:	08050263          	beqz	a0,80006eb4 <pbuf_add_header_impl+0x88>
80006e34:	00010737          	lui	a4,0x10
80006e38:	00100513          	li	a0,1
80006e3c:	06e5fe63          	bgeu	a1,a4,80006eb8 <pbuf_add_header_impl+0x8c>
80006e40:	00000513          	li	a0,0
80006e44:	06058a63          	beqz	a1,80006eb8 <pbuf_add_header_impl+0x8c>
80006e48:	0087d703          	lhu	a4,8(a5)
80006e4c:	01059693          	slli	a3,a1,0x10
80006e50:	0106d693          	srli	a3,a3,0x10
80006e54:	00e68733          	add	a4,a3,a4
80006e58:	01071713          	slli	a4,a4,0x10
80006e5c:	01075713          	srli	a4,a4,0x10
80006e60:	00100513          	li	a0,1
80006e64:	04d76a63          	bltu	a4,a3,80006eb8 <pbuf_add_header_impl+0x8c>
80006e68:	00c78503          	lb	a0,12(a5)
80006e6c:	00055e63          	bgez	a0,80006e88 <pbuf_add_header_impl+0x5c>
80006e70:	0047a603          	lw	a2,4(a5)
80006e74:	00100513          	li	a0,1
80006e78:	40b605b3          	sub	a1,a2,a1
80006e7c:	01078613          	addi	a2,a5,16
80006e80:	00c5fc63          	bgeu	a1,a2,80006e98 <pbuf_add_header_impl+0x6c>
80006e84:	00008067          	ret
80006e88:	00100513          	li	a0,1
80006e8c:	02060663          	beqz	a2,80006eb8 <pbuf_add_header_impl+0x8c>
80006e90:	0047a603          	lw	a2,4(a5)
80006e94:	40b605b3          	sub	a1,a2,a1
80006e98:	00a7d603          	lhu	a2,10(a5)
80006e9c:	00b7a223          	sw	a1,4(a5)
80006ea0:	00e79423          	sh	a4,8(a5)
80006ea4:	00c686b3          	add	a3,a3,a2
80006ea8:	00d79523          	sh	a3,10(a5)
80006eac:	00000513          	li	a0,0
80006eb0:	00008067          	ret
80006eb4:	00100513          	li	a0,1
80006eb8:	00008067          	ret

80006ebc <pbuf_alloc_reference>:
80006ebc:	ff010113          	addi	sp,sp,-16
80006ec0:	00812423          	sw	s0,8(sp)
80006ec4:	00058413          	mv	s0,a1
80006ec8:	800035b7          	lui	a1,0x80003
80006ecc:	00912223          	sw	s1,4(sp)
80006ed0:	01212023          	sw	s2,0(sp)
80006ed4:	00060493          	mv	s1,a2
80006ed8:	00050913          	mv	s2,a0
80006edc:	14c00613          	li	a2,332
80006ee0:	c7c58593          	addi	a1,a1,-900 # 80002c7c <_heap_end+0xffff0c7c>
80006ee4:	00400513          	li	a0,4
80006ee8:	00112623          	sw	ra,12(sp)
80006eec:	841ff0ef          	jal	ra,8000672c <memp_malloc_fn>
80006ef0:	02050263          	beqz	a0,80006f14 <pbuf_alloc_reference+0x58>
80006ef4:	00100793          	li	a5,1
80006ef8:	00052023          	sw	zero,0(a0)
80006efc:	01252223          	sw	s2,4(a0)
80006f00:	00851423          	sh	s0,8(a0)
80006f04:	00851523          	sh	s0,10(a0)
80006f08:	00950623          	sb	s1,12(a0)
80006f0c:	000506a3          	sb	zero,13(a0)
80006f10:	00f51723          	sh	a5,14(a0)
80006f14:	00c12083          	lw	ra,12(sp)
80006f18:	00812403          	lw	s0,8(sp)
80006f1c:	00412483          	lw	s1,4(sp)
80006f20:	00012903          	lw	s2,0(sp)
80006f24:	01010113          	addi	sp,sp,16
80006f28:	00008067          	ret

80006f2c <pbuf_alloced_custom>:
80006f2c:	01051513          	slli	a0,a0,0x10
80006f30:	01055513          	srli	a0,a0,0x10
80006f34:	00350513          	addi	a0,a0,3
80006f38:	ffc57513          	andi	a0,a0,-4
80006f3c:	00a58833          	add	a6,a1,a0
80006f40:	0307ec63          	bltu	a5,a6,80006f78 <pbuf_alloced_custom+0x4c>
80006f44:	00070463          	beqz	a4,80006f4c <pbuf_alloced_custom+0x20>
80006f48:	00a70733          	add	a4,a4,a0
80006f4c:	00200793          	li	a5,2
80006f50:	00f686a3          	sb	a5,13(a3)
80006f54:	00100793          	li	a5,1
80006f58:	00068513          	mv	a0,a3
80006f5c:	0006a023          	sw	zero,0(a3)
80006f60:	00e6a223          	sw	a4,4(a3)
80006f64:	00b69423          	sh	a1,8(a3)
80006f68:	00b69523          	sh	a1,10(a3)
80006f6c:	00c68623          	sb	a2,12(a3)
80006f70:	00f69723          	sh	a5,14(a3)
80006f74:	00008067          	ret
80006f78:	00000513          	li	a0,0
80006f7c:	00008067          	ret

80006f80 <pbuf_add_header>:
80006f80:	00000613          	li	a2,0
80006f84:	ea9ff06f          	j	80006e2c <pbuf_add_header_impl>

80006f88 <pbuf_add_header_force>:
80006f88:	00100613          	li	a2,1
80006f8c:	ea1ff06f          	j	80006e2c <pbuf_add_header_impl>

80006f90 <pbuf_remove_header>:
80006f90:	00050793          	mv	a5,a0
80006f94:	04050a63          	beqz	a0,80006fe8 <pbuf_remove_header+0x58>
80006f98:	00010737          	lui	a4,0x10
80006f9c:	00100513          	li	a0,1
80006fa0:	04e5f663          	bgeu	a1,a4,80006fec <pbuf_remove_header+0x5c>
80006fa4:	00000513          	li	a0,0
80006fa8:	04058263          	beqz	a1,80006fec <pbuf_remove_header+0x5c>
80006fac:	00a7d703          	lhu	a4,10(a5)
80006fb0:	01059693          	slli	a3,a1,0x10
80006fb4:	0106d693          	srli	a3,a3,0x10
80006fb8:	00100513          	li	a0,1
80006fbc:	02d76863          	bltu	a4,a3,80006fec <pbuf_remove_header+0x5c>
80006fc0:	40d70733          	sub	a4,a4,a3
80006fc4:	0047a603          	lw	a2,4(a5)
80006fc8:	00e79523          	sh	a4,10(a5)
80006fcc:	0087d703          	lhu	a4,8(a5)
80006fd0:	00b605b3          	add	a1,a2,a1
80006fd4:	00b7a223          	sw	a1,4(a5)
80006fd8:	40d70733          	sub	a4,a4,a3
80006fdc:	00e79423          	sh	a4,8(a5)
80006fe0:	00000513          	li	a0,0
80006fe4:	00008067          	ret
80006fe8:	00100513          	li	a0,1
80006fec:	00008067          	ret

80006ff0 <pbuf_header>:
80006ff0:	0005d663          	bgez	a1,80006ffc <pbuf_header+0xc>
80006ff4:	40b005b3          	neg	a1,a1
80006ff8:	f99ff06f          	j	80006f90 <pbuf_remove_header>
80006ffc:	00000613          	li	a2,0
80007000:	e2dff06f          	j	80006e2c <pbuf_add_header_impl>

80007004 <pbuf_header_force>:
80007004:	0005d663          	bgez	a1,80007010 <pbuf_header_force+0xc>
80007008:	40b005b3          	neg	a1,a1
8000700c:	f85ff06f          	j	80006f90 <pbuf_remove_header>
80007010:	00100613          	li	a2,1
80007014:	e19ff06f          	j	80006e2c <pbuf_add_header_impl>

80007018 <pbuf_free>:
80007018:	fd010113          	addi	sp,sp,-48
8000701c:	02812423          	sw	s0,40(sp)
80007020:	02112623          	sw	ra,44(sp)
80007024:	02912223          	sw	s1,36(sp)
80007028:	03212023          	sw	s2,32(sp)
8000702c:	01312e23          	sw	s3,28(sp)
80007030:	00000413          	li	s0,0
80007034:	06050463          	beqz	a0,8000709c <pbuf_free+0x84>
80007038:	00050593          	mv	a1,a0
8000703c:	00000413          	li	s0,0
80007040:	00200913          	li	s2,2
80007044:	00100993          	li	s3,1
80007048:	00b12623          	sw	a1,12(sp)
8000704c:	ee1fd0ef          	jal	ra,80004f2c <sys_arch_protect>
80007050:	00c12583          	lw	a1,12(sp)
80007054:	00e5c483          	lbu	s1,14(a1)
80007058:	fff48493          	addi	s1,s1,-1
8000705c:	0ff4f493          	andi	s1,s1,255
80007060:	00958723          	sb	s1,14(a1)
80007064:	ecdfd0ef          	jal	ra,80004f30 <sys_arch_unprotect>
80007068:	02049a63          	bnez	s1,8000709c <pbuf_free+0x84>
8000706c:	00c12583          	lw	a1,12(sp)
80007070:	00d5c783          	lbu	a5,13(a1)
80007074:	0005a483          	lw	s1,0(a1)
80007078:	0027f793          	andi	a5,a5,2
8000707c:	04078063          	beqz	a5,800070bc <pbuf_free+0xa4>
80007080:	0105a783          	lw	a5,16(a1)
80007084:	00058513          	mv	a0,a1
80007088:	000780e7          	jalr	a5
8000708c:	00140413          	addi	s0,s0,1
80007090:	0ff47413          	andi	s0,s0,255
80007094:	00048593          	mv	a1,s1
80007098:	fa0498e3          	bnez	s1,80007048 <pbuf_free+0x30>
8000709c:	00040513          	mv	a0,s0
800070a0:	02c12083          	lw	ra,44(sp)
800070a4:	02812403          	lw	s0,40(sp)
800070a8:	02412483          	lw	s1,36(sp)
800070ac:	02012903          	lw	s2,32(sp)
800070b0:	01c12983          	lw	s3,28(sp)
800070b4:	03010113          	addi	sp,sp,48
800070b8:	00008067          	ret
800070bc:	00c5c783          	lbu	a5,12(a1)
800070c0:	00500513          	li	a0,5
800070c4:	00f7f793          	andi	a5,a5,15
800070c8:	01278663          	beq	a5,s2,800070d4 <pbuf_free+0xbc>
800070cc:	01379863          	bne	a5,s3,800070dc <pbuf_free+0xc4>
800070d0:	00400513          	li	a0,4
800070d4:	e90ff0ef          	jal	ra,80006764 <memp_free>
800070d8:	fb5ff06f          	j	8000708c <pbuf_free+0x74>
800070dc:	fa0798e3          	bnez	a5,8000708c <pbuf_free+0x74>
800070e0:	00058513          	mv	a0,a1
800070e4:	d44ff0ef          	jal	ra,80006628 <lwip_free>
800070e8:	fa5ff06f          	j	8000708c <pbuf_free+0x74>

800070ec <pbuf_alloc>:
800070ec:	fe010113          	addi	sp,sp,-32
800070f0:	01212823          	sw	s2,16(sp)
800070f4:	00112e23          	sw	ra,28(sp)
800070f8:	00812c23          	sw	s0,24(sp)
800070fc:	00912a23          	sw	s1,20(sp)
80007100:	01312623          	sw	s3,12(sp)
80007104:	01412423          	sw	s4,8(sp)
80007108:	01512223          	sw	s5,4(sp)
8000710c:	01612023          	sw	s6,0(sp)
80007110:	04100793          	li	a5,65
80007114:	00058913          	mv	s2,a1
80007118:	0cf60263          	beq	a2,a5,800071dc <pbuf_alloc+0xf0>
8000711c:	02c7ee63          	bltu	a5,a2,80007158 <pbuf_alloc+0x6c>
80007120:	00100793          	li	a5,1
80007124:	0af60c63          	beq	a2,a5,800071dc <pbuf_alloc+0xf0>
80007128:	00000493          	li	s1,0
8000712c:	01c12083          	lw	ra,28(sp)
80007130:	01812403          	lw	s0,24(sp)
80007134:	00048513          	mv	a0,s1
80007138:	01012903          	lw	s2,16(sp)
8000713c:	01412483          	lw	s1,20(sp)
80007140:	00c12983          	lw	s3,12(sp)
80007144:	00812a03          	lw	s4,8(sp)
80007148:	00412a83          	lw	s5,4(sp)
8000714c:	00012b03          	lw	s6,0(sp)
80007150:	02010113          	addi	sp,sp,32
80007154:	00008067          	ret
80007158:	01051413          	slli	s0,a0,0x10
8000715c:	18200793          	li	a5,386
80007160:	01045413          	srli	s0,s0,0x10
80007164:	0af60463          	beq	a2,a5,8000720c <pbuf_alloc+0x120>
80007168:	28000793          	li	a5,640
8000716c:	faf61ee3          	bne	a2,a5,80007128 <pbuf_alloc+0x3c>
80007170:	00340413          	addi	s0,s0,3
80007174:	00358793          	addi	a5,a1,3
80007178:	ffc47413          	andi	s0,s0,-4
8000717c:	ffc7f793          	andi	a5,a5,-4
80007180:	00f40433          	add	s0,s0,a5
80007184:	01041413          	slli	s0,s0,0x10
80007188:	01045413          	srli	s0,s0,0x10
8000718c:	00050993          	mv	s3,a0
80007190:	01040513          	addi	a0,s0,16
80007194:	f8f46ae3          	bltu	s0,a5,80007128 <pbuf_alloc+0x3c>
80007198:	f8f568e3          	bltu	a0,a5,80007128 <pbuf_alloc+0x3c>
8000719c:	c58ff0ef          	jal	ra,800065f4 <lwip_malloc>
800071a0:	00050493          	mv	s1,a0
800071a4:	f80504e3          	beqz	a0,8000712c <pbuf_alloc+0x40>
800071a8:	01099993          	slli	s3,s3,0x10
800071ac:	0109d993          	srli	s3,s3,0x10
800071b0:	013509b3          	add	s3,a0,s3
800071b4:	01398993          	addi	s3,s3,19
800071b8:	000107b7          	lui	a5,0x10
800071bc:	ffc9f993          	andi	s3,s3,-4
800071c0:	08078793          	addi	a5,a5,128 # 10080 <_stack_size+0xf880>
800071c4:	00052023          	sw	zero,0(a0)
800071c8:	01352223          	sw	s3,4(a0)
800071cc:	01251423          	sh	s2,8(a0)
800071d0:	01251523          	sh	s2,10(a0)
800071d4:	00f52623          	sw	a5,12(a0)
800071d8:	f55ff06f          	j	8000712c <pbuf_alloc+0x40>
800071dc:	01812403          	lw	s0,24(sp)
800071e0:	01c12083          	lw	ra,28(sp)
800071e4:	01412483          	lw	s1,20(sp)
800071e8:	00c12983          	lw	s3,12(sp)
800071ec:	00812a03          	lw	s4,8(sp)
800071f0:	00412a83          	lw	s5,4(sp)
800071f4:	00012b03          	lw	s6,0(sp)
800071f8:	00090593          	mv	a1,s2
800071fc:	01012903          	lw	s2,16(sp)
80007200:	00000513          	li	a0,0
80007204:	02010113          	addi	sp,sp,32
80007208:	cb5ff06f          	j	80006ebc <pbuf_alloc_reference>
8000720c:	000109b7          	lui	s3,0x10
80007210:	00000a13          	li	s4,0
80007214:	00000493          	li	s1,0
80007218:	80003ab7          	lui	s5,0x80003
8000721c:	5ec00b13          	li	s6,1516
80007220:	08298993          	addi	s3,s3,130 # 10082 <_stack_size+0xf882>
80007224:	0f300613          	li	a2,243
80007228:	c7ca8593          	addi	a1,s5,-900 # 80002c7c <_heap_end+0xffff0c7c>
8000722c:	00500513          	li	a0,5
80007230:	cfcff0ef          	jal	ra,8000672c <memp_malloc_fn>
80007234:	00051a63          	bnez	a0,80007248 <pbuf_alloc+0x15c>
80007238:	ee0488e3          	beqz	s1,80007128 <pbuf_alloc+0x3c>
8000723c:	00048513          	mv	a0,s1
80007240:	dd9ff0ef          	jal	ra,80007018 <pbuf_free>
80007244:	ee5ff06f          	j	80007128 <pbuf_alloc+0x3c>
80007248:	00340793          	addi	a5,s0,3
8000724c:	ffc7f793          	andi	a5,a5,-4
80007250:	40fb07b3          	sub	a5,s6,a5
80007254:	00078713          	mv	a4,a5
80007258:	01079793          	slli	a5,a5,0x10
8000725c:	0107d793          	srli	a5,a5,0x10
80007260:	00f97463          	bgeu	s2,a5,80007268 <pbuf_alloc+0x17c>
80007264:	00090713          	mv	a4,s2
80007268:	00850433          	add	s0,a0,s0
8000726c:	01340413          	addi	s0,s0,19
80007270:	ffc47413          	andi	s0,s0,-4
80007274:	01071793          	slli	a5,a4,0x10
80007278:	00052023          	sw	zero,0(a0)
8000727c:	00852223          	sw	s0,4(a0)
80007280:	01251423          	sh	s2,8(a0)
80007284:	00e51523          	sh	a4,10(a0)
80007288:	01352623          	sw	s3,12(a0)
8000728c:	0107d793          	srli	a5,a5,0x10
80007290:	02048263          	beqz	s1,800072b4 <pbuf_alloc+0x1c8>
80007294:	00aa2023          	sw	a0,0(s4)
80007298:	40f90933          	sub	s2,s2,a5
8000729c:	01091913          	slli	s2,s2,0x10
800072a0:	01095913          	srli	s2,s2,0x10
800072a4:	00000413          	li	s0,0
800072a8:	00050a13          	mv	s4,a0
800072ac:	f6091ce3          	bnez	s2,80007224 <pbuf_alloc+0x138>
800072b0:	e7dff06f          	j	8000712c <pbuf_alloc+0x40>
800072b4:	00050493          	mv	s1,a0
800072b8:	fe1ff06f          	j	80007298 <pbuf_alloc+0x1ac>

800072bc <pbuf_realloc>:
800072bc:	00855783          	lhu	a5,8(a0)
800072c0:	0af5f463          	bgeu	a1,a5,80007368 <pbuf_realloc+0xac>
800072c4:	ff010113          	addi	sp,sp,-16
800072c8:	00812423          	sw	s0,8(sp)
800072cc:	00912223          	sw	s1,4(sp)
800072d0:	00112623          	sw	ra,12(sp)
800072d4:	00050413          	mv	s0,a0
800072d8:	00058493          	mv	s1,a1
800072dc:	40f587b3          	sub	a5,a1,a5
800072e0:	00a45583          	lhu	a1,10(s0)
800072e4:	0695e263          	bltu	a1,s1,80007348 <pbuf_realloc+0x8c>
800072e8:	00c44783          	lbu	a5,12(s0)
800072ec:	00f7f793          	andi	a5,a5,15
800072f0:	02079663          	bnez	a5,8000731c <pbuf_realloc+0x60>
800072f4:	02958463          	beq	a1,s1,8000731c <pbuf_realloc+0x60>
800072f8:	00d44783          	lbu	a5,13(s0)
800072fc:	0027f793          	andi	a5,a5,2
80007300:	00079e63          	bnez	a5,8000731c <pbuf_realloc+0x60>
80007304:	00442583          	lw	a1,4(s0)
80007308:	00040513          	mv	a0,s0
8000730c:	408585b3          	sub	a1,a1,s0
80007310:	009585b3          	add	a1,a1,s1
80007314:	adcff0ef          	jal	ra,800065f0 <mem_trim>
80007318:	00050413          	mv	s0,a0
8000731c:	00042503          	lw	a0,0(s0)
80007320:	00941523          	sh	s1,10(s0)
80007324:	00941423          	sh	s1,8(s0)
80007328:	00050463          	beqz	a0,80007330 <pbuf_realloc+0x74>
8000732c:	cedff0ef          	jal	ra,80007018 <pbuf_free>
80007330:	00042023          	sw	zero,0(s0)
80007334:	00c12083          	lw	ra,12(sp)
80007338:	00812403          	lw	s0,8(sp)
8000733c:	00412483          	lw	s1,4(sp)
80007340:	01010113          	addi	sp,sp,16
80007344:	00008067          	ret
80007348:	00845703          	lhu	a4,8(s0)
8000734c:	40b484b3          	sub	s1,s1,a1
80007350:	01049493          	slli	s1,s1,0x10
80007354:	00e78733          	add	a4,a5,a4
80007358:	00e41423          	sh	a4,8(s0)
8000735c:	0104d493          	srli	s1,s1,0x10
80007360:	00042403          	lw	s0,0(s0)
80007364:	f7dff06f          	j	800072e0 <pbuf_realloc+0x24>
80007368:	00008067          	ret

8000736c <pbuf_free_header>:
8000736c:	fe010113          	addi	sp,sp,-32
80007370:	00812c23          	sw	s0,24(sp)
80007374:	00112e23          	sw	ra,28(sp)
80007378:	00912a23          	sw	s1,20(sp)
8000737c:	00050413          	mv	s0,a0
80007380:	04058263          	beqz	a1,800073c4 <pbuf_free_header+0x58>
80007384:	04040063          	beqz	s0,800073c4 <pbuf_free_header+0x58>
80007388:	00a45783          	lhu	a5,10(s0)
8000738c:	02f5e863          	bltu	a1,a5,800073bc <pbuf_free_header+0x50>
80007390:	40f585b3          	sub	a1,a1,a5
80007394:	00042483          	lw	s1,0(s0)
80007398:	01059593          	slli	a1,a1,0x10
8000739c:	0105d593          	srli	a1,a1,0x10
800073a0:	00042023          	sw	zero,0(s0)
800073a4:	00040513          	mv	a0,s0
800073a8:	00b12623          	sw	a1,12(sp)
800073ac:	c6dff0ef          	jal	ra,80007018 <pbuf_free>
800073b0:	00048413          	mv	s0,s1
800073b4:	00c12583          	lw	a1,12(sp)
800073b8:	fc9ff06f          	j	80007380 <pbuf_free_header+0x14>
800073bc:	00040513          	mv	a0,s0
800073c0:	bd1ff0ef          	jal	ra,80006f90 <pbuf_remove_header>
800073c4:	00040513          	mv	a0,s0
800073c8:	01c12083          	lw	ra,28(sp)
800073cc:	01812403          	lw	s0,24(sp)
800073d0:	01412483          	lw	s1,20(sp)
800073d4:	02010113          	addi	sp,sp,32
800073d8:	00008067          	ret

800073dc <pbuf_clen>:
800073dc:	00000793          	li	a5,0
800073e0:	00051663          	bnez	a0,800073ec <pbuf_clen+0x10>
800073e4:	00078513          	mv	a0,a5
800073e8:	00008067          	ret
800073ec:	00178793          	addi	a5,a5,1
800073f0:	01079793          	slli	a5,a5,0x10
800073f4:	0107d793          	srli	a5,a5,0x10
800073f8:	00052503          	lw	a0,0(a0)
800073fc:	fe5ff06f          	j	800073e0 <pbuf_clen+0x4>

80007400 <pbuf_ref>:
80007400:	02050a63          	beqz	a0,80007434 <pbuf_ref+0x34>
80007404:	ff010113          	addi	sp,sp,-16
80007408:	00812423          	sw	s0,8(sp)
8000740c:	00112623          	sw	ra,12(sp)
80007410:	00050413          	mv	s0,a0
80007414:	b19fd0ef          	jal	ra,80004f2c <sys_arch_protect>
80007418:	00e44783          	lbu	a5,14(s0)
8000741c:	00178793          	addi	a5,a5,1
80007420:	00f40723          	sb	a5,14(s0)
80007424:	00812403          	lw	s0,8(sp)
80007428:	00c12083          	lw	ra,12(sp)
8000742c:	01010113          	addi	sp,sp,16
80007430:	b01fd06f          	j	80004f30 <sys_arch_unprotect>
80007434:	00008067          	ret

80007438 <pbuf_cat>:
80007438:	02050a63          	beqz	a0,8000746c <pbuf_cat+0x34>
8000743c:	00059663          	bnez	a1,80007448 <pbuf_cat+0x10>
80007440:	00008067          	ret
80007444:	00070513          	mv	a0,a4
80007448:	00855783          	lhu	a5,8(a0)
8000744c:	0085d683          	lhu	a3,8(a1)
80007450:	00052703          	lw	a4,0(a0)
80007454:	00d787b3          	add	a5,a5,a3
80007458:	01079793          	slli	a5,a5,0x10
8000745c:	0107d793          	srli	a5,a5,0x10
80007460:	00f51423          	sh	a5,8(a0)
80007464:	fe0710e3          	bnez	a4,80007444 <pbuf_cat+0xc>
80007468:	00b52023          	sw	a1,0(a0)
8000746c:	00008067          	ret

80007470 <pbuf_chain>:
80007470:	ff010113          	addi	sp,sp,-16
80007474:	00812423          	sw	s0,8(sp)
80007478:	00112623          	sw	ra,12(sp)
8000747c:	00058413          	mv	s0,a1
80007480:	fb9ff0ef          	jal	ra,80007438 <pbuf_cat>
80007484:	00040513          	mv	a0,s0
80007488:	00812403          	lw	s0,8(sp)
8000748c:	00c12083          	lw	ra,12(sp)
80007490:	01010113          	addi	sp,sp,16
80007494:	f6dff06f          	j	80007400 <pbuf_ref>

80007498 <pbuf_dechain>:
80007498:	ff010113          	addi	sp,sp,-16
8000749c:	00112623          	sw	ra,12(sp)
800074a0:	00812423          	sw	s0,8(sp)
800074a4:	00052403          	lw	s0,0(a0)
800074a8:	02040663          	beqz	s0,800074d4 <pbuf_dechain+0x3c>
800074ac:	00855783          	lhu	a5,8(a0)
800074b0:	00a55703          	lhu	a4,10(a0)
800074b4:	40e787b3          	sub	a5,a5,a4
800074b8:	00f41423          	sh	a5,8(s0)
800074bc:	00a55783          	lhu	a5,10(a0)
800074c0:	00052023          	sw	zero,0(a0)
800074c4:	00f51423          	sh	a5,8(a0)
800074c8:	00040513          	mv	a0,s0
800074cc:	b4dff0ef          	jal	ra,80007018 <pbuf_free>
800074d0:	00050463          	beqz	a0,800074d8 <pbuf_dechain+0x40>
800074d4:	00000413          	li	s0,0
800074d8:	00040513          	mv	a0,s0
800074dc:	00c12083          	lw	ra,12(sp)
800074e0:	00812403          	lw	s0,8(sp)
800074e4:	01010113          	addi	sp,sp,16
800074e8:	00008067          	ret

800074ec <pbuf_copy>:
800074ec:	10050463          	beqz	a0,800075f4 <pbuf_copy+0x108>
800074f0:	fe010113          	addi	sp,sp,-32
800074f4:	00812c23          	sw	s0,24(sp)
800074f8:	00112e23          	sw	ra,28(sp)
800074fc:	00912a23          	sw	s1,20(sp)
80007500:	01212823          	sw	s2,16(sp)
80007504:	01312623          	sw	s3,12(sp)
80007508:	01412423          	sw	s4,8(sp)
8000750c:	00058413          	mv	s0,a1
80007510:	06058e63          	beqz	a1,8000758c <pbuf_copy+0xa0>
80007514:	00855703          	lhu	a4,8(a0)
80007518:	0085d783          	lhu	a5,8(a1)
8000751c:	00050493          	mv	s1,a0
80007520:	06f76663          	bltu	a4,a5,8000758c <pbuf_copy+0xa0>
80007524:	00000a13          	li	s4,0
80007528:	00000993          	li	s3,0
8000752c:	00a4d903          	lhu	s2,10(s1)
80007530:	00a45783          	lhu	a5,10(s0)
80007534:	41390933          	sub	s2,s2,s3
80007538:	414787b3          	sub	a5,a5,s4
8000753c:	0127f463          	bgeu	a5,s2,80007544 <pbuf_copy+0x58>
80007540:	00078913          	mv	s2,a5
80007544:	0044a503          	lw	a0,4(s1)
80007548:	00442583          	lw	a1,4(s0)
8000754c:	00090613          	mv	a2,s2
80007550:	01350533          	add	a0,a0,s3
80007554:	014585b3          	add	a1,a1,s4
80007558:	35d060ef          	jal	ra,8000e0b4 <memcpy>
8000755c:	00a45703          	lhu	a4,10(s0)
80007560:	012a0a33          	add	s4,s4,s2
80007564:	012989b3          	add	s3,s3,s2
80007568:	00a4d783          	lhu	a5,10(s1)
8000756c:	00ea6663          	bltu	s4,a4,80007578 <pbuf_copy+0x8c>
80007570:	00042403          	lw	s0,0(s0)
80007574:	00000a13          	li	s4,0
80007578:	02f99e63          	bne	s3,a5,800075b4 <pbuf_copy+0xc8>
8000757c:	0004a483          	lw	s1,0(s1)
80007580:	02049863          	bnez	s1,800075b0 <pbuf_copy+0xc4>
80007584:	00000513          	li	a0,0
80007588:	00040463          	beqz	s0,80007590 <pbuf_copy+0xa4>
8000758c:	ff000513          	li	a0,-16
80007590:	01c12083          	lw	ra,28(sp)
80007594:	01812403          	lw	s0,24(sp)
80007598:	01412483          	lw	s1,20(sp)
8000759c:	01012903          	lw	s2,16(sp)
800075a0:	00c12983          	lw	s3,12(sp)
800075a4:	00812a03          	lw	s4,8(sp)
800075a8:	02010113          	addi	sp,sp,32
800075ac:	00008067          	ret
800075b0:	00000993          	li	s3,0
800075b4:	00040c63          	beqz	s0,800075cc <pbuf_copy+0xe0>
800075b8:	00a45703          	lhu	a4,10(s0)
800075bc:	00845783          	lhu	a5,8(s0)
800075c0:	00f71663          	bne	a4,a5,800075cc <pbuf_copy+0xe0>
800075c4:	00042783          	lw	a5,0(s0)
800075c8:	02079263          	bnez	a5,800075ec <pbuf_copy+0x100>
800075cc:	00a4d703          	lhu	a4,10(s1)
800075d0:	0084d783          	lhu	a5,8(s1)
800075d4:	00f71663          	bne	a4,a5,800075e0 <pbuf_copy+0xf4>
800075d8:	0004a783          	lw	a5,0(s1)
800075dc:	00079863          	bnez	a5,800075ec <pbuf_copy+0x100>
800075e0:	f40416e3          	bnez	s0,8000752c <pbuf_copy+0x40>
800075e4:	00000513          	li	a0,0
800075e8:	fa9ff06f          	j	80007590 <pbuf_copy+0xa4>
800075ec:	ffa00513          	li	a0,-6
800075f0:	fa1ff06f          	j	80007590 <pbuf_copy+0xa4>
800075f4:	ff000513          	li	a0,-16
800075f8:	00008067          	ret

800075fc <pbuf_copy_partial>:
800075fc:	fe010113          	addi	sp,sp,-32
80007600:	00812c23          	sw	s0,24(sp)
80007604:	00112e23          	sw	ra,28(sp)
80007608:	00912a23          	sw	s1,20(sp)
8000760c:	01212823          	sw	s2,16(sp)
80007610:	01312623          	sw	s3,12(sp)
80007614:	01412423          	sw	s4,8(sp)
80007618:	00000413          	li	s0,0
8000761c:	02050063          	beqz	a0,8000763c <pbuf_copy_partial+0x40>
80007620:	00058a13          	mv	s4,a1
80007624:	00000413          	li	s0,0
80007628:	00058a63          	beqz	a1,8000763c <pbuf_copy_partial+0x40>
8000762c:	00050913          	mv	s2,a0
80007630:	00060493          	mv	s1,a2
80007634:	00048463          	beqz	s1,8000763c <pbuf_copy_partial+0x40>
80007638:	02091463          	bnez	s2,80007660 <pbuf_copy_partial+0x64>
8000763c:	00040513          	mv	a0,s0
80007640:	01c12083          	lw	ra,28(sp)
80007644:	01812403          	lw	s0,24(sp)
80007648:	01412483          	lw	s1,20(sp)
8000764c:	01012903          	lw	s2,16(sp)
80007650:	00c12983          	lw	s3,12(sp)
80007654:	00812a03          	lw	s4,8(sp)
80007658:	02010113          	addi	sp,sp,32
8000765c:	00008067          	ret
80007660:	00a95583          	lhu	a1,10(s2)
80007664:	00068e63          	beqz	a3,80007680 <pbuf_copy_partial+0x84>
80007668:	00b6ec63          	bltu	a3,a1,80007680 <pbuf_copy_partial+0x84>
8000766c:	40b686b3          	sub	a3,a3,a1
80007670:	01069693          	slli	a3,a3,0x10
80007674:	0106d693          	srli	a3,a3,0x10
80007678:	00092903          	lw	s2,0(s2)
8000767c:	fb9ff06f          	j	80007634 <pbuf_copy_partial+0x38>
80007680:	40d585b3          	sub	a1,a1,a3
80007684:	01059593          	slli	a1,a1,0x10
80007688:	0105d593          	srli	a1,a1,0x10
8000768c:	00058993          	mv	s3,a1
80007690:	00b4f463          	bgeu	s1,a1,80007698 <pbuf_copy_partial+0x9c>
80007694:	00048993          	mv	s3,s1
80007698:	00492583          	lw	a1,4(s2)
8000769c:	01099993          	slli	s3,s3,0x10
800076a0:	0109d993          	srli	s3,s3,0x10
800076a4:	00d585b3          	add	a1,a1,a3
800076a8:	008a0533          	add	a0,s4,s0
800076ac:	00098613          	mv	a2,s3
800076b0:	01340433          	add	s0,s0,s3
800076b4:	413484b3          	sub	s1,s1,s3
800076b8:	1fd060ef          	jal	ra,8000e0b4 <memcpy>
800076bc:	01041413          	slli	s0,s0,0x10
800076c0:	01049493          	slli	s1,s1,0x10
800076c4:	01045413          	srli	s0,s0,0x10
800076c8:	0104d493          	srli	s1,s1,0x10
800076cc:	00000693          	li	a3,0
800076d0:	fa9ff06f          	j	80007678 <pbuf_copy_partial+0x7c>

800076d4 <pbuf_get_contiguous>:
800076d4:	fe010113          	addi	sp,sp,-32
800076d8:	00112e23          	sw	ra,28(sp)
800076dc:	00812c23          	sw	s0,24(sp)
800076e0:	00912a23          	sw	s1,20(sp)
800076e4:	02051063          	bnez	a0,80007704 <pbuf_get_contiguous+0x30>
800076e8:	00000413          	li	s0,0
800076ec:	00040513          	mv	a0,s0
800076f0:	01c12083          	lw	ra,28(sp)
800076f4:	01812403          	lw	s0,24(sp)
800076f8:	01412483          	lw	s1,20(sp)
800076fc:	02010113          	addi	sp,sp,32
80007700:	00008067          	ret
80007704:	00058413          	mv	s0,a1
80007708:	fe0580e3          	beqz	a1,800076e8 <pbuf_get_contiguous+0x14>
8000770c:	00068493          	mv	s1,a3
80007710:	fcd66ce3          	bltu	a2,a3,800076e8 <pbuf_get_contiguous+0x14>
80007714:	00e10613          	addi	a2,sp,14
80007718:	00070593          	mv	a1,a4
8000771c:	ee4ff0ef          	jal	ra,80006e00 <pbuf_skip_const>
80007720:	fc0504e3          	beqz	a0,800076e8 <pbuf_get_contiguous+0x14>
80007724:	00e15683          	lhu	a3,14(sp)
80007728:	00a55603          	lhu	a2,10(a0)
8000772c:	00968733          	add	a4,a3,s1
80007730:	00e64863          	blt	a2,a4,80007740 <pbuf_get_contiguous+0x6c>
80007734:	00452403          	lw	s0,4(a0)
80007738:	00d40433          	add	s0,s0,a3
8000773c:	fb1ff06f          	j	800076ec <pbuf_get_contiguous+0x18>
80007740:	00048613          	mv	a2,s1
80007744:	00040593          	mv	a1,s0
80007748:	eb5ff0ef          	jal	ra,800075fc <pbuf_copy_partial>
8000774c:	fa9500e3          	beq	a0,s1,800076ec <pbuf_get_contiguous+0x18>
80007750:	f99ff06f          	j	800076e8 <pbuf_get_contiguous+0x14>

80007754 <pbuf_skip>:
80007754:	eacff06f          	j	80006e00 <pbuf_skip_const>

80007758 <pbuf_take>:
80007758:	08050c63          	beqz	a0,800077f0 <pbuf_take+0x98>
8000775c:	fe010113          	addi	sp,sp,-32
80007760:	00912a23          	sw	s1,20(sp)
80007764:	01412423          	sw	s4,8(sp)
80007768:	00112e23          	sw	ra,28(sp)
8000776c:	00812c23          	sw	s0,24(sp)
80007770:	01212823          	sw	s2,16(sp)
80007774:	01312623          	sw	s3,12(sp)
80007778:	00050493          	mv	s1,a0
8000777c:	00058a13          	mv	s4,a1
80007780:	ff000513          	li	a0,-16
80007784:	00058c63          	beqz	a1,8000779c <pbuf_take+0x44>
80007788:	0084d783          	lhu	a5,8(s1)
8000778c:	00060413          	mv	s0,a2
80007790:	fff00513          	li	a0,-1
80007794:	00000993          	li	s3,0
80007798:	04c7f663          	bgeu	a5,a2,800077e4 <pbuf_take+0x8c>
8000779c:	01c12083          	lw	ra,28(sp)
800077a0:	01812403          	lw	s0,24(sp)
800077a4:	01412483          	lw	s1,20(sp)
800077a8:	01012903          	lw	s2,16(sp)
800077ac:	00c12983          	lw	s3,12(sp)
800077b0:	00812a03          	lw	s4,8(sp)
800077b4:	02010113          	addi	sp,sp,32
800077b8:	00008067          	ret
800077bc:	00a4d903          	lhu	s2,10(s1)
800077c0:	01247463          	bgeu	s0,s2,800077c8 <pbuf_take+0x70>
800077c4:	00040913          	mv	s2,s0
800077c8:	0044a503          	lw	a0,4(s1)
800077cc:	013a05b3          	add	a1,s4,s3
800077d0:	00090613          	mv	a2,s2
800077d4:	0e1060ef          	jal	ra,8000e0b4 <memcpy>
800077d8:	0004a483          	lw	s1,0(s1)
800077dc:	41240433          	sub	s0,s0,s2
800077e0:	012989b3          	add	s3,s3,s2
800077e4:	fc041ce3          	bnez	s0,800077bc <pbuf_take+0x64>
800077e8:	00000513          	li	a0,0
800077ec:	fb1ff06f          	j	8000779c <pbuf_take+0x44>
800077f0:	ff000513          	li	a0,-16
800077f4:	00008067          	ret

800077f8 <pbuf_take_at>:
800077f8:	fd010113          	addi	sp,sp,-48
800077fc:	02812423          	sw	s0,40(sp)
80007800:	01312e23          	sw	s3,28(sp)
80007804:	00060413          	mv	s0,a2
80007808:	00058993          	mv	s3,a1
8000780c:	00e10613          	addi	a2,sp,14
80007810:	00068593          	mv	a1,a3
80007814:	02112623          	sw	ra,44(sp)
80007818:	02912223          	sw	s1,36(sp)
8000781c:	03212023          	sw	s2,32(sp)
80007820:	de0ff0ef          	jal	ra,80006e00 <pbuf_skip_const>
80007824:	08050263          	beqz	a0,800078a8 <pbuf_take_at+0xb0>
80007828:	00e15703          	lhu	a4,14(sp)
8000782c:	00855683          	lhu	a3,8(a0)
80007830:	00050493          	mv	s1,a0
80007834:	008707b3          	add	a5,a4,s0
80007838:	fff00513          	li	a0,-1
8000783c:	04f6c863          	blt	a3,a5,8000788c <pbuf_take_at+0x94>
80007840:	00a4d783          	lhu	a5,10(s1)
80007844:	00040913          	mv	s2,s0
80007848:	40e787b3          	sub	a5,a5,a4
8000784c:	0087d663          	bge	a5,s0,80007858 <pbuf_take_at+0x60>
80007850:	01079913          	slli	s2,a5,0x10
80007854:	01095913          	srli	s2,s2,0x10
80007858:	0044a503          	lw	a0,4(s1)
8000785c:	00090613          	mv	a2,s2
80007860:	00098593          	mv	a1,s3
80007864:	00e50533          	add	a0,a0,a4
80007868:	04d060ef          	jal	ra,8000e0b4 <memcpy>
8000786c:	41240633          	sub	a2,s0,s2
80007870:	01061613          	slli	a2,a2,0x10
80007874:	01065613          	srli	a2,a2,0x10
80007878:	00000513          	li	a0,0
8000787c:	00060863          	beqz	a2,8000788c <pbuf_take_at+0x94>
80007880:	0004a503          	lw	a0,0(s1)
80007884:	012985b3          	add	a1,s3,s2
80007888:	ed1ff0ef          	jal	ra,80007758 <pbuf_take>
8000788c:	02c12083          	lw	ra,44(sp)
80007890:	02812403          	lw	s0,40(sp)
80007894:	02412483          	lw	s1,36(sp)
80007898:	02012903          	lw	s2,32(sp)
8000789c:	01c12983          	lw	s3,28(sp)
800078a0:	03010113          	addi	sp,sp,48
800078a4:	00008067          	ret
800078a8:	fff00513          	li	a0,-1
800078ac:	fe1ff06f          	j	8000788c <pbuf_take_at+0x94>

800078b0 <pbuf_clone>:
800078b0:	ff010113          	addi	sp,sp,-16
800078b4:	00912223          	sw	s1,4(sp)
800078b8:	00060493          	mv	s1,a2
800078bc:	00058613          	mv	a2,a1
800078c0:	0084d583          	lhu	a1,8(s1)
800078c4:	00812423          	sw	s0,8(sp)
800078c8:	00112623          	sw	ra,12(sp)
800078cc:	821ff0ef          	jal	ra,800070ec <pbuf_alloc>
800078d0:	00050413          	mv	s0,a0
800078d4:	00050663          	beqz	a0,800078e0 <pbuf_clone+0x30>
800078d8:	00048593          	mv	a1,s1
800078dc:	c11ff0ef          	jal	ra,800074ec <pbuf_copy>
800078e0:	00040513          	mv	a0,s0
800078e4:	00c12083          	lw	ra,12(sp)
800078e8:	00812403          	lw	s0,8(sp)
800078ec:	00412483          	lw	s1,4(sp)
800078f0:	01010113          	addi	sp,sp,16
800078f4:	00008067          	ret

800078f8 <pbuf_coalesce>:
800078f8:	ff010113          	addi	sp,sp,-16
800078fc:	00812423          	sw	s0,8(sp)
80007900:	00112623          	sw	ra,12(sp)
80007904:	00912223          	sw	s1,4(sp)
80007908:	00052783          	lw	a5,0(a0)
8000790c:	00050413          	mv	s0,a0
80007910:	02079063          	bnez	a5,80007930 <pbuf_coalesce+0x38>
80007914:	00040493          	mv	s1,s0
80007918:	00c12083          	lw	ra,12(sp)
8000791c:	00812403          	lw	s0,8(sp)
80007920:	00048513          	mv	a0,s1
80007924:	00412483          	lw	s1,4(sp)
80007928:	01010113          	addi	sp,sp,16
8000792c:	00008067          	ret
80007930:	00058513          	mv	a0,a1
80007934:	00040613          	mv	a2,s0
80007938:	28000593          	li	a1,640
8000793c:	f75ff0ef          	jal	ra,800078b0 <pbuf_clone>
80007940:	00050493          	mv	s1,a0
80007944:	fc0508e3          	beqz	a0,80007914 <pbuf_coalesce+0x1c>
80007948:	00040513          	mv	a0,s0
8000794c:	eccff0ef          	jal	ra,80007018 <pbuf_free>
80007950:	fc9ff06f          	j	80007918 <pbuf_coalesce+0x20>

80007954 <pbuf_try_get_at>:
80007954:	fe010113          	addi	sp,sp,-32
80007958:	00e10613          	addi	a2,sp,14
8000795c:	00112e23          	sw	ra,28(sp)
80007960:	ca0ff0ef          	jal	ra,80006e00 <pbuf_skip_const>
80007964:	fff00793          	li	a5,-1
80007968:	02050063          	beqz	a0,80007988 <pbuf_try_get_at+0x34>
8000796c:	00e15703          	lhu	a4,14(sp)
80007970:	00a55683          	lhu	a3,10(a0)
80007974:	fff00793          	li	a5,-1
80007978:	00d77863          	bgeu	a4,a3,80007988 <pbuf_try_get_at+0x34>
8000797c:	00452783          	lw	a5,4(a0)
80007980:	00e787b3          	add	a5,a5,a4
80007984:	0007c783          	lbu	a5,0(a5)
80007988:	01c12083          	lw	ra,28(sp)
8000798c:	00078513          	mv	a0,a5
80007990:	02010113          	addi	sp,sp,32
80007994:	00008067          	ret

80007998 <pbuf_get_at>:
80007998:	ff010113          	addi	sp,sp,-16
8000799c:	00112623          	sw	ra,12(sp)
800079a0:	fb5ff0ef          	jal	ra,80007954 <pbuf_try_get_at>
800079a4:	00055463          	bgez	a0,800079ac <pbuf_get_at+0x14>
800079a8:	00000513          	li	a0,0
800079ac:	00c12083          	lw	ra,12(sp)
800079b0:	0ff57513          	andi	a0,a0,255
800079b4:	01010113          	addi	sp,sp,16
800079b8:	00008067          	ret

800079bc <pbuf_put_at>:
800079bc:	fe010113          	addi	sp,sp,-32
800079c0:	00812c23          	sw	s0,24(sp)
800079c4:	00060413          	mv	s0,a2
800079c8:	00e10613          	addi	a2,sp,14
800079cc:	00112e23          	sw	ra,28(sp)
800079d0:	c30ff0ef          	jal	ra,80006e00 <pbuf_skip_const>
800079d4:	00050e63          	beqz	a0,800079f0 <pbuf_put_at+0x34>
800079d8:	00e15703          	lhu	a4,14(sp)
800079dc:	00a55783          	lhu	a5,10(a0)
800079e0:	00f77863          	bgeu	a4,a5,800079f0 <pbuf_put_at+0x34>
800079e4:	00452783          	lw	a5,4(a0)
800079e8:	00e787b3          	add	a5,a5,a4
800079ec:	00878023          	sb	s0,0(a5)
800079f0:	01c12083          	lw	ra,28(sp)
800079f4:	01812403          	lw	s0,24(sp)
800079f8:	02010113          	addi	sp,sp,32
800079fc:	00008067          	ret

80007a00 <pbuf_memcmp>:
80007a00:	00855703          	lhu	a4,8(a0)
80007a04:	00d587b3          	add	a5,a1,a3
80007a08:	00f75863          	bge	a4,a5,80007a18 <pbuf_memcmp+0x18>
80007a0c:	00010537          	lui	a0,0x10
80007a10:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xf7ff>
80007a14:	00008067          	ret
80007a18:	fd010113          	addi	sp,sp,-48
80007a1c:	02812423          	sw	s0,40(sp)
80007a20:	02912223          	sw	s1,36(sp)
80007a24:	02112623          	sw	ra,44(sp)
80007a28:	03212023          	sw	s2,32(sp)
80007a2c:	01312e23          	sw	s3,28(sp)
80007a30:	00050493          	mv	s1,a0
80007a34:	00058413          	mv	s0,a1
80007a38:	00a4d783          	lhu	a5,10(s1)
80007a3c:	00f46c63          	bltu	s0,a5,80007a54 <pbuf_memcmp+0x54>
80007a40:	0004a483          	lw	s1,0(s1)
80007a44:	40f40433          	sub	s0,s0,a5
80007a48:	01041413          	slli	s0,s0,0x10
80007a4c:	01045413          	srli	s0,s0,0x10
80007a50:	fe0494e3          	bnez	s1,80007a38 <pbuf_memcmp+0x38>
80007a54:	00000993          	li	s3,0
80007a58:	01099913          	slli	s2,s3,0x10
80007a5c:	01095913          	srli	s2,s2,0x10
80007a60:	00d96663          	bltu	s2,a3,80007a6c <pbuf_memcmp+0x6c>
80007a64:	00000513          	li	a0,0
80007a68:	0580006f          	j	80007ac0 <pbuf_memcmp+0xc0>
80007a6c:	008905b3          	add	a1,s2,s0
80007a70:	01059593          	slli	a1,a1,0x10
80007a74:	0105d593          	srli	a1,a1,0x10
80007a78:	00048513          	mv	a0,s1
80007a7c:	00d12623          	sw	a3,12(sp)
80007a80:	00c12423          	sw	a2,8(sp)
80007a84:	f15ff0ef          	jal	ra,80007998 <pbuf_get_at>
80007a88:	00812603          	lw	a2,8(sp)
80007a8c:	00198993          	addi	s3,s3,1
80007a90:	00c12683          	lw	a3,12(sp)
80007a94:	013607b3          	add	a5,a2,s3
80007a98:	fff7c783          	lbu	a5,-1(a5)
80007a9c:	faa78ee3          	beq	a5,a0,80007a58 <pbuf_memcmp+0x58>
80007aa0:	000107b7          	lui	a5,0x10
80007aa4:	ffe78793          	addi	a5,a5,-2 # fffe <_stack_size+0xf7fe>
80007aa8:	00090513          	mv	a0,s2
80007aac:	0127f463          	bgeu	a5,s2,80007ab4 <pbuf_memcmp+0xb4>
80007ab0:	ffe00513          	li	a0,-2
80007ab4:	00150513          	addi	a0,a0,1
80007ab8:	01051513          	slli	a0,a0,0x10
80007abc:	01055513          	srli	a0,a0,0x10
80007ac0:	02c12083          	lw	ra,44(sp)
80007ac4:	02812403          	lw	s0,40(sp)
80007ac8:	02412483          	lw	s1,36(sp)
80007acc:	02012903          	lw	s2,32(sp)
80007ad0:	01c12983          	lw	s3,28(sp)
80007ad4:	03010113          	addi	sp,sp,48
80007ad8:	00008067          	ret

80007adc <pbuf_memfind>:
80007adc:	fe010113          	addi	sp,sp,-32
80007ae0:	00112e23          	sw	ra,28(sp)
80007ae4:	00812c23          	sw	s0,24(sp)
80007ae8:	00912a23          	sw	s1,20(sp)
80007aec:	01212823          	sw	s2,16(sp)
80007af0:	01312623          	sw	s3,12(sp)
80007af4:	01412423          	sw	s4,8(sp)
80007af8:	00855783          	lhu	a5,8(a0)
80007afc:	00d60733          	add	a4,a2,a3
80007b00:	02e7c263          	blt	a5,a4,80007b24 <pbuf_memfind+0x48>
80007b04:	40c787b3          	sub	a5,a5,a2
80007b08:	01079493          	slli	s1,a5,0x10
80007b0c:	00050993          	mv	s3,a0
80007b10:	00058a13          	mv	s4,a1
80007b14:	00060913          	mv	s2,a2
80007b18:	00068413          	mv	s0,a3
80007b1c:	0104d493          	srli	s1,s1,0x10
80007b20:	0284f863          	bgeu	s1,s0,80007b50 <pbuf_memfind+0x74>
80007b24:	00010437          	lui	s0,0x10
80007b28:	fff40413          	addi	s0,s0,-1 # ffff <_stack_size+0xf7ff>
80007b2c:	00040513          	mv	a0,s0
80007b30:	01c12083          	lw	ra,28(sp)
80007b34:	01812403          	lw	s0,24(sp)
80007b38:	01412483          	lw	s1,20(sp)
80007b3c:	01012903          	lw	s2,16(sp)
80007b40:	00c12983          	lw	s3,12(sp)
80007b44:	00812a03          	lw	s4,8(sp)
80007b48:	02010113          	addi	sp,sp,32
80007b4c:	00008067          	ret
80007b50:	00090693          	mv	a3,s2
80007b54:	000a0613          	mv	a2,s4
80007b58:	00040593          	mv	a1,s0
80007b5c:	00098513          	mv	a0,s3
80007b60:	ea1ff0ef          	jal	ra,80007a00 <pbuf_memcmp>
80007b64:	fc0504e3          	beqz	a0,80007b2c <pbuf_memfind+0x50>
80007b68:	00140413          	addi	s0,s0,1
80007b6c:	01041413          	slli	s0,s0,0x10
80007b70:	01045413          	srli	s0,s0,0x10
80007b74:	fadff06f          	j	80007b20 <pbuf_memfind+0x44>

80007b78 <pbuf_strstr>:
80007b78:	fe010113          	addi	sp,sp,-32
80007b7c:	00812c23          	sw	s0,24(sp)
80007b80:	01212823          	sw	s2,16(sp)
80007b84:	00112e23          	sw	ra,28(sp)
80007b88:	00010937          	lui	s2,0x10
80007b8c:	00912a23          	sw	s1,20(sp)
80007b90:	fff90413          	addi	s0,s2,-1 # ffff <_stack_size+0xf7ff>
80007b94:	04058c63          	beqz	a1,80007bec <pbuf_strstr+0x74>
80007b98:	0005c783          	lbu	a5,0(a1)
80007b9c:	04078863          	beqz	a5,80007bec <pbuf_strstr+0x74>
80007ba0:	00855783          	lhu	a5,8(a0)
80007ba4:	04878663          	beq	a5,s0,80007bf0 <pbuf_strstr+0x78>
80007ba8:	00050493          	mv	s1,a0
80007bac:	00058513          	mv	a0,a1
80007bb0:	00b12623          	sw	a1,12(sp)
80007bb4:	ffe90913          	addi	s2,s2,-2
80007bb8:	575060ef          	jal	ra,8000e92c <strlen>
80007bbc:	02a96863          	bltu	s2,a0,80007bec <pbuf_strstr+0x74>
80007bc0:	01812403          	lw	s0,24(sp)
80007bc4:	01051613          	slli	a2,a0,0x10
80007bc8:	00c12583          	lw	a1,12(sp)
80007bcc:	01c12083          	lw	ra,28(sp)
80007bd0:	01012903          	lw	s2,16(sp)
80007bd4:	00048513          	mv	a0,s1
80007bd8:	01412483          	lw	s1,20(sp)
80007bdc:	00000693          	li	a3,0
80007be0:	01065613          	srli	a2,a2,0x10
80007be4:	02010113          	addi	sp,sp,32
80007be8:	ef5ff06f          	j	80007adc <pbuf_memfind>
80007bec:	00040793          	mv	a5,s0
80007bf0:	01c12083          	lw	ra,28(sp)
80007bf4:	01812403          	lw	s0,24(sp)
80007bf8:	01412483          	lw	s1,20(sp)
80007bfc:	01012903          	lw	s2,16(sp)
80007c00:	00078513          	mv	a0,a5
80007c04:	02010113          	addi	sp,sp,32
80007c08:	00008067          	ret

80007c0c <raw_input>:
80007c0c:	fd010113          	addi	sp,sp,-48
80007c10:	02912223          	sw	s1,36(sp)
80007c14:	9ec18793          	addi	a5,gp,-1556 # 8000322c <ip_data>
80007c18:	02812423          	sw	s0,40(sp)
80007c1c:	03212023          	sw	s2,32(sp)
80007c20:	01312e23          	sw	s3,28(sp)
80007c24:	01412c23          	sw	s4,24(sp)
80007c28:	01512a23          	sw	s5,20(sp)
80007c2c:	01612823          	sw	s6,16(sp)
80007c30:	01712623          	sw	s7,12(sp)
80007c34:	02112623          	sw	ra,44(sp)
80007c38:	00050a13          	mv	s4,a0
80007c3c:	0007a583          	lw	a1,0(a5)
80007c40:	0147a503          	lw	a0,20(a5)
80007c44:	00000993          	li	s3,0
80007c48:	9ec18493          	addi	s1,gp,-1556 # 8000322c <ip_data>
80007c4c:	179040ef          	jal	ra,8000c5c4 <ip4_addr_isbroadcast_u32>
80007c50:	004a2783          	lw	a5,4(s4)
80007c54:	00050b13          	mv	s6,a0
80007c58:	0097ca83          	lbu	s5,9(a5)
80007c5c:	8d01a403          	lw	s0,-1840(gp) # 80003110 <raw_pcbs>
80007c60:	00000513          	li	a0,0
80007c64:	00078913          	mv	s2,a5
80007c68:	08040a63          	beqz	s0,80007cfc <raw_input+0xf0>
80007c6c:	01444783          	lbu	a5,20(s0)
80007c70:	0d579463          	bne	a5,s5,80007d38 <raw_input+0x12c>
80007c74:	00844703          	lbu	a4,8(s0)
80007c78:	00070c63          	beqz	a4,80007c90 <raw_input+0x84>
80007c7c:	0044a783          	lw	a5,4(s1)
80007c80:	0387c783          	lbu	a5,56(a5)
80007c84:	00178793          	addi	a5,a5,1
80007c88:	0ff7f793          	andi	a5,a5,255
80007c8c:	0af71663          	bne	a4,a5,80007d38 <raw_input+0x12c>
80007c90:	080b0c63          	beqz	s6,80007d28 <raw_input+0x11c>
80007c94:	00944783          	lbu	a5,9(s0)
80007c98:	0207f793          	andi	a5,a5,32
80007c9c:	08078e63          	beqz	a5,80007d38 <raw_input+0x12c>
80007ca0:	00042783          	lw	a5,0(s0)
80007ca4:	08079a63          	bnez	a5,80007d38 <raw_input+0x12c>
80007ca8:	01544783          	lbu	a5,21(s0)
80007cac:	0017f793          	andi	a5,a5,1
80007cb0:	00078863          	beqz	a5,80007cc0 <raw_input+0xb4>
80007cb4:	00442703          	lw	a4,4(s0)
80007cb8:	0104a783          	lw	a5,16(s1)
80007cbc:	06f71e63          	bne	a4,a5,80007d38 <raw_input+0x12c>
80007cc0:	01842783          	lw	a5,24(s0)
80007cc4:	06078a63          	beqz	a5,80007d38 <raw_input+0x12c>
80007cc8:	01c42503          	lw	a0,28(s0)
80007ccc:	9fc18693          	addi	a3,gp,-1540 # 8000323c <ip_data+0x10>
80007cd0:	000a0613          	mv	a2,s4
80007cd4:	00040593          	mv	a1,s0
80007cd8:	000780e7          	jalr	a5
80007cdc:	06050463          	beqz	a0,80007d44 <raw_input+0x138>
80007ce0:	00100513          	li	a0,1
80007ce4:	00098c63          	beqz	s3,80007cfc <raw_input+0xf0>
80007ce8:	01042783          	lw	a5,16(s0)
80007cec:	00f9a823          	sw	a5,16(s3)
80007cf0:	8d01a783          	lw	a5,-1840(gp) # 80003110 <raw_pcbs>
80007cf4:	8c81a823          	sw	s0,-1840(gp) # 80003110 <raw_pcbs>
80007cf8:	00f42823          	sw	a5,16(s0)
80007cfc:	02c12083          	lw	ra,44(sp)
80007d00:	02812403          	lw	s0,40(sp)
80007d04:	02412483          	lw	s1,36(sp)
80007d08:	02012903          	lw	s2,32(sp)
80007d0c:	01c12983          	lw	s3,28(sp)
80007d10:	01812a03          	lw	s4,24(sp)
80007d14:	01412a83          	lw	s5,20(sp)
80007d18:	01012b03          	lw	s6,16(sp)
80007d1c:	00c12b83          	lw	s7,12(sp)
80007d20:	03010113          	addi	sp,sp,48
80007d24:	00008067          	ret
80007d28:	00042783          	lw	a5,0(s0)
80007d2c:	f6078ee3          	beqz	a5,80007ca8 <raw_input+0x9c>
80007d30:	0144a703          	lw	a4,20(s1)
80007d34:	f6e78ae3          	beq	a5,a4,80007ca8 <raw_input+0x9c>
80007d38:	00040993          	mv	s3,s0
80007d3c:	01042403          	lw	s0,16(s0)
80007d40:	f29ff06f          	j	80007c68 <raw_input+0x5c>
80007d44:	00200513          	li	a0,2
80007d48:	ff1ff06f          	j	80007d38 <raw_input+0x12c>

80007d4c <raw_bind>:
80007d4c:	ffa00793          	li	a5,-6
80007d50:	00050a63          	beqz	a0,80007d64 <raw_bind+0x18>
80007d54:	00058863          	beqz	a1,80007d64 <raw_bind+0x18>
80007d58:	0005a783          	lw	a5,0(a1)
80007d5c:	00f52023          	sw	a5,0(a0)
80007d60:	00000793          	li	a5,0
80007d64:	00078513          	mv	a0,a5
80007d68:	00008067          	ret

80007d6c <raw_bind_netif>:
80007d6c:	00000793          	li	a5,0
80007d70:	00058863          	beqz	a1,80007d80 <raw_bind_netif+0x14>
80007d74:	0385c783          	lbu	a5,56(a1)
80007d78:	00178793          	addi	a5,a5,1
80007d7c:	0ff7f793          	andi	a5,a5,255
80007d80:	00f50423          	sb	a5,8(a0)
80007d84:	00008067          	ret

80007d88 <raw_connect>:
80007d88:	00050793          	mv	a5,a0
80007d8c:	ffa00513          	li	a0,-6
80007d90:	02078263          	beqz	a5,80007db4 <raw_connect+0x2c>
80007d94:	02058063          	beqz	a1,80007db4 <raw_connect+0x2c>
80007d98:	0005a703          	lw	a4,0(a1)
80007d9c:	00000513          	li	a0,0
80007da0:	00e7a223          	sw	a4,4(a5)
80007da4:	0157c703          	lbu	a4,21(a5)
80007da8:	00176713          	ori	a4,a4,1
80007dac:	00e78aa3          	sb	a4,21(a5)
80007db0:	00008067          	ret
80007db4:	00008067          	ret

80007db8 <raw_disconnect>:
80007db8:	01554783          	lbu	a5,21(a0)
80007dbc:	00052223          	sw	zero,4(a0)
80007dc0:	00050423          	sb	zero,8(a0)
80007dc4:	ffe7f793          	andi	a5,a5,-2
80007dc8:	00f50aa3          	sb	a5,21(a0)
80007dcc:	00008067          	ret

80007dd0 <raw_recv>:
80007dd0:	00b52c23          	sw	a1,24(a0)
80007dd4:	00c52e23          	sw	a2,28(a0)
80007dd8:	00008067          	ret

80007ddc <raw_sendto_if_src>:
80007ddc:	fe010113          	addi	sp,sp,-32
80007de0:	00112e23          	sw	ra,28(sp)
80007de4:	00812c23          	sw	s0,24(sp)
80007de8:	00912a23          	sw	s1,20(sp)
80007dec:	01212823          	sw	s2,16(sp)
80007df0:	01312623          	sw	s3,12(sp)
80007df4:	01412423          	sw	s4,8(sp)
80007df8:	01512223          	sw	s5,4(sp)
80007dfc:	00051663          	bnez	a0,80007e08 <raw_sendto_if_src+0x2c>
80007e00:	ffa00493          	li	s1,-6
80007e04:	06c0006f          	j	80007e70 <raw_sendto_if_src+0x94>
80007e08:	fe060ce3          	beqz	a2,80007e00 <raw_sendto_if_src+0x24>
80007e0c:	fe068ae3          	beqz	a3,80007e00 <raw_sendto_if_src+0x24>
80007e10:	fe0708e3          	beqz	a4,80007e00 <raw_sendto_if_src+0x24>
80007e14:	01554783          	lbu	a5,21(a0)
80007e18:	00070a13          	mv	s4,a4
80007e1c:	00068913          	mv	s2,a3
80007e20:	0027f793          	andi	a5,a5,2
80007e24:	00060a93          	mv	s5,a2
80007e28:	00058413          	mv	s0,a1
80007e2c:	00050493          	mv	s1,a0
80007e30:	06078463          	beqz	a5,80007e98 <raw_sendto_if_src+0xbc>
80007e34:	00a5d703          	lhu	a4,10(a1)
80007e38:	01300793          	li	a5,19
80007e3c:	fce7f2e3          	bgeu	a5,a4,80007e00 <raw_sendto_if_src+0x24>
80007e40:	00c50493          	addi	s1,a0,12
80007e44:	0296ae23          	sw	s1,60(a3)
80007e48:	00068813          	mv	a6,a3
80007e4c:	00000793          	li	a5,0
80007e50:	00000713          	li	a4,0
80007e54:	00000693          	li	a3,0
80007e58:	00000613          	li	a2,0
80007e5c:	000a0593          	mv	a1,s4
80007e60:	00040513          	mv	a0,s0
80007e64:	634040ef          	jal	ra,8000c498 <ip4_output_if>
80007e68:	00050493          	mv	s1,a0
80007e6c:	02092e23          	sw	zero,60(s2)
80007e70:	01c12083          	lw	ra,28(sp)
80007e74:	01812403          	lw	s0,24(sp)
80007e78:	00048513          	mv	a0,s1
80007e7c:	01012903          	lw	s2,16(sp)
80007e80:	01412483          	lw	s1,20(sp)
80007e84:	00c12983          	lw	s3,12(sp)
80007e88:	00812a03          	lw	s4,8(sp)
80007e8c:	00412a83          	lw	s5,4(sp)
80007e90:	02010113          	addi	sp,sp,32
80007e94:	00008067          	ret
80007e98:	0085d703          	lhu	a4,8(a1)
80007e9c:	000107b7          	lui	a5,0x10
80007ea0:	feb78793          	addi	a5,a5,-21 # ffeb <_stack_size+0xf7eb>
80007ea4:	00e7f663          	bgeu	a5,a4,80007eb0 <raw_sendto_if_src+0xd4>
80007ea8:	fff00493          	li	s1,-1
80007eac:	fc5ff06f          	j	80007e70 <raw_sendto_if_src+0x94>
80007eb0:	01400593          	li	a1,20
80007eb4:	00040513          	mv	a0,s0
80007eb8:	8c8ff0ef          	jal	ra,80006f80 <pbuf_add_header>
80007ebc:	04050c63          	beqz	a0,80007f14 <raw_sendto_if_src+0x138>
80007ec0:	28000613          	li	a2,640
80007ec4:	00000593          	li	a1,0
80007ec8:	02400513          	li	a0,36
80007ecc:	a20ff0ef          	jal	ra,800070ec <pbuf_alloc>
80007ed0:	00050993          	mv	s3,a0
80007ed4:	fc050ae3          	beqz	a0,80007ea8 <raw_sendto_if_src+0xcc>
80007ed8:	00845783          	lhu	a5,8(s0)
80007edc:	00078663          	beqz	a5,80007ee8 <raw_sendto_if_src+0x10c>
80007ee0:	00040593          	mv	a1,s0
80007ee4:	d8cff0ef          	jal	ra,80007470 <pbuf_chain>
80007ee8:	0094c783          	lbu	a5,9(s1)
80007eec:	0207f793          	andi	a5,a5,32
80007ef0:	02079e63          	bnez	a5,80007f2c <raw_sendto_if_src+0x150>
80007ef4:	000aa503          	lw	a0,0(s5)
80007ef8:	00090593          	mv	a1,s2
80007efc:	6c8040ef          	jal	ra,8000c5c4 <ip4_addr_isbroadcast_u32>
80007f00:	02050663          	beqz	a0,80007f2c <raw_sendto_if_src+0x150>
80007f04:	ef340ee3          	beq	s0,s3,80007e00 <raw_sendto_if_src+0x24>
80007f08:	00098513          	mv	a0,s3
80007f0c:	90cff0ef          	jal	ra,80007018 <pbuf_free>
80007f10:	ef1ff06f          	j	80007e00 <raw_sendto_if_src+0x24>
80007f14:	01400593          	li	a1,20
80007f18:	00040513          	mv	a0,s0
80007f1c:	874ff0ef          	jal	ra,80006f90 <pbuf_remove_header>
80007f20:	f80514e3          	bnez	a0,80007ea8 <raw_sendto_if_src+0xcc>
80007f24:	00040993          	mv	s3,s0
80007f28:	fc1ff06f          	j	80007ee8 <raw_sendto_if_src+0x10c>
80007f2c:	00c48793          	addi	a5,s1,12
80007f30:	00b4c683          	lbu	a3,11(s1)
80007f34:	02f92e23          	sw	a5,60(s2)
80007f38:	0144c783          	lbu	a5,20(s1)
80007f3c:	00a4c703          	lbu	a4,10(s1)
80007f40:	00090813          	mv	a6,s2
80007f44:	000a8613          	mv	a2,s5
80007f48:	000a0593          	mv	a1,s4
80007f4c:	00098513          	mv	a0,s3
80007f50:	548040ef          	jal	ra,8000c498 <ip4_output_if>
80007f54:	02092e23          	sw	zero,60(s2)
80007f58:	00050493          	mv	s1,a0
80007f5c:	f1340ae3          	beq	s0,s3,80007e70 <raw_sendto_if_src+0x94>
80007f60:	00098513          	mv	a0,s3
80007f64:	8b4ff0ef          	jal	ra,80007018 <pbuf_free>
80007f68:	f09ff06f          	j	80007e70 <raw_sendto_if_src+0x94>

80007f6c <raw_sendto>:
80007f6c:	08050663          	beqz	a0,80007ff8 <raw_sendto+0x8c>
80007f70:	08060463          	beqz	a2,80007ff8 <raw_sendto+0x8c>
80007f74:	ff010113          	addi	sp,sp,-16
80007f78:	00812423          	sw	s0,8(sp)
80007f7c:	00912223          	sw	s1,4(sp)
80007f80:	01212023          	sw	s2,0(sp)
80007f84:	00112623          	sw	ra,12(sp)
80007f88:	00050413          	mv	s0,a0
80007f8c:	00854503          	lbu	a0,8(a0)
80007f90:	00060493          	mv	s1,a2
80007f94:	00058913          	mv	s2,a1
80007f98:	04050663          	beqz	a0,80007fe4 <raw_sendto+0x78>
80007f9c:	d41fe0ef          	jal	ra,80006cdc <netif_get_by_index>
80007fa0:	06050063          	beqz	a0,80008000 <raw_sendto+0x94>
80007fa4:	00042783          	lw	a5,0(s0)
80007fa8:	04078463          	beqz	a5,80007ff0 <raw_sendto+0x84>
80007fac:	0f07f793          	andi	a5,a5,240
80007fb0:	0e000713          	li	a4,224
80007fb4:	02e78e63          	beq	a5,a4,80007ff0 <raw_sendto+0x84>
80007fb8:	00040713          	mv	a4,s0
80007fbc:	00050693          	mv	a3,a0
80007fc0:	00040513          	mv	a0,s0
80007fc4:	00812403          	lw	s0,8(sp)
80007fc8:	00c12083          	lw	ra,12(sp)
80007fcc:	00048613          	mv	a2,s1
80007fd0:	00090593          	mv	a1,s2
80007fd4:	00412483          	lw	s1,4(sp)
80007fd8:	00012903          	lw	s2,0(sp)
80007fdc:	01010113          	addi	sp,sp,16
80007fe0:	dfdff06f          	j	80007ddc <raw_sendto_if_src>
80007fe4:	00060513          	mv	a0,a2
80007fe8:	619030ef          	jal	ra,8000be00 <ip4_route>
80007fec:	fb5ff06f          	j	80007fa0 <raw_sendto+0x34>
80007ff0:	00450713          	addi	a4,a0,4
80007ff4:	fc9ff06f          	j	80007fbc <raw_sendto+0x50>
80007ff8:	ffa00513          	li	a0,-6
80007ffc:	00008067          	ret
80008000:	00c12083          	lw	ra,12(sp)
80008004:	00812403          	lw	s0,8(sp)
80008008:	00412483          	lw	s1,4(sp)
8000800c:	00012903          	lw	s2,0(sp)
80008010:	ffc00513          	li	a0,-4
80008014:	01010113          	addi	sp,sp,16
80008018:	00008067          	ret

8000801c <raw_send>:
8000801c:	00450613          	addi	a2,a0,4
80008020:	f4dff06f          	j	80007f6c <raw_sendto>

80008024 <raw_remove>:
80008024:	8d01a783          	lw	a5,-1840(gp) # 80003110 <raw_pcbs>
80008028:	00050593          	mv	a1,a0
8000802c:	00a79c63          	bne	a5,a0,80008044 <raw_remove+0x20>
80008030:	01052783          	lw	a5,16(a0)
80008034:	8cf1a823          	sw	a5,-1840(gp) # 80003110 <raw_pcbs>
80008038:	00000513          	li	a0,0
8000803c:	f28fe06f          	j	80006764 <memp_free>
80008040:	00070793          	mv	a5,a4
80008044:	fe078ae3          	beqz	a5,80008038 <raw_remove+0x14>
80008048:	0107a703          	lw	a4,16(a5)
8000804c:	fe0706e3          	beqz	a4,80008038 <raw_remove+0x14>
80008050:	feb718e3          	bne	a4,a1,80008040 <raw_remove+0x1c>
80008054:	0105a703          	lw	a4,16(a1)
80008058:	00e7a823          	sw	a4,16(a5)
8000805c:	fddff06f          	j	80008038 <raw_remove+0x14>

80008060 <raw_new>:
80008060:	ff010113          	addi	sp,sp,-16
80008064:	800035b7          	lui	a1,0x80003
80008068:	00912223          	sw	s1,4(sp)
8000806c:	25a00613          	li	a2,602
80008070:	00050493          	mv	s1,a0
80008074:	c9458593          	addi	a1,a1,-876 # 80002c94 <_heap_end+0xffff0c94>
80008078:	00000513          	li	a0,0
8000807c:	00812423          	sw	s0,8(sp)
80008080:	00112623          	sw	ra,12(sp)
80008084:	ea8fe0ef          	jal	ra,8000672c <memp_malloc_fn>
80008088:	00050413          	mv	s0,a0
8000808c:	02050463          	beqz	a0,800080b4 <raw_new+0x54>
80008090:	02000613          	li	a2,32
80008094:	00000593          	li	a1,0
80008098:	3e5040ef          	jal	ra,8000cc7c <memset>
8000809c:	fff00793          	li	a5,-1
800080a0:	00f405a3          	sb	a5,11(s0)
800080a4:	8d01a703          	lw	a4,-1840(gp) # 80003110 <raw_pcbs>
800080a8:	00940a23          	sb	s1,20(s0)
800080ac:	8c81a823          	sw	s0,-1840(gp) # 80003110 <raw_pcbs>
800080b0:	00e42823          	sw	a4,16(s0)
800080b4:	00040513          	mv	a0,s0
800080b8:	00c12083          	lw	ra,12(sp)
800080bc:	00812403          	lw	s0,8(sp)
800080c0:	00412483          	lw	s1,4(sp)
800080c4:	01010113          	addi	sp,sp,16
800080c8:	00008067          	ret

800080cc <raw_new_ip_type>:
800080cc:	00058513          	mv	a0,a1
800080d0:	f91ff06f          	j	80008060 <raw_new>

800080d4 <raw_netif_ip_addr_changed>:
800080d4:	02050063          	beqz	a0,800080f4 <raw_netif_ip_addr_changed+0x20>
800080d8:	00052783          	lw	a5,0(a0)
800080dc:	00078c63          	beqz	a5,800080f4 <raw_netif_ip_addr_changed+0x20>
800080e0:	00058a63          	beqz	a1,800080f4 <raw_netif_ip_addr_changed+0x20>
800080e4:	0005a783          	lw	a5,0(a1)
800080e8:	00078663          	beqz	a5,800080f4 <raw_netif_ip_addr_changed+0x20>
800080ec:	8d01a783          	lw	a5,-1840(gp) # 80003110 <raw_pcbs>
800080f0:	00079463          	bnez	a5,800080f8 <raw_netif_ip_addr_changed+0x24>
800080f4:	00008067          	ret
800080f8:	0007a683          	lw	a3,0(a5)
800080fc:	00052703          	lw	a4,0(a0)
80008100:	00e69663          	bne	a3,a4,8000810c <raw_netif_ip_addr_changed+0x38>
80008104:	0005a703          	lw	a4,0(a1)
80008108:	00e7a023          	sw	a4,0(a5)
8000810c:	0107a783          	lw	a5,16(a5)
80008110:	fe1ff06f          	j	800080f0 <raw_netif_ip_addr_changed+0x1c>

80008114 <stats_init>:
80008114:	00008067          	ret

80008118 <sys_timeout_abs>:
80008118:	ff010113          	addi	sp,sp,-16
8000811c:	01212023          	sw	s2,0(sp)
80008120:	00058913          	mv	s2,a1
80008124:	800035b7          	lui	a1,0x80003
80008128:	00812423          	sw	s0,8(sp)
8000812c:	00912223          	sw	s1,4(sp)
80008130:	00050413          	mv	s0,a0
80008134:	00060493          	mv	s1,a2
80008138:	cc058593          	addi	a1,a1,-832 # 80002cc0 <_heap_end+0xffff0cc0>
8000813c:	0bc00613          	li	a2,188
80008140:	00300513          	li	a0,3
80008144:	00112623          	sw	ra,12(sp)
80008148:	de4fe0ef          	jal	ra,8000672c <memp_malloc_fn>
8000814c:	02050063          	beqz	a0,8000816c <sys_timeout_abs+0x54>
80008150:	8d81a783          	lw	a5,-1832(gp) # 80003118 <next_timeout>
80008154:	00052023          	sw	zero,0(a0)
80008158:	01252423          	sw	s2,8(a0)
8000815c:	00952623          	sw	s1,12(a0)
80008160:	00852223          	sw	s0,4(a0)
80008164:	02079063          	bnez	a5,80008184 <sys_timeout_abs+0x6c>
80008168:	8ca1ac23          	sw	a0,-1832(gp) # 80003118 <next_timeout>
8000816c:	00c12083          	lw	ra,12(sp)
80008170:	00812403          	lw	s0,8(sp)
80008174:	00412483          	lw	s1,4(sp)
80008178:	00012903          	lw	s2,0(sp)
8000817c:	01010113          	addi	sp,sp,16
80008180:	00008067          	ret
80008184:	0047a683          	lw	a3,4(a5)
80008188:	40d406b3          	sub	a3,s0,a3
8000818c:	0006d863          	bgez	a3,8000819c <sys_timeout_abs+0x84>
80008190:	00f52023          	sw	a5,0(a0)
80008194:	fd5ff06f          	j	80008168 <sys_timeout_abs+0x50>
80008198:	00070793          	mv	a5,a4
8000819c:	0007a703          	lw	a4,0(a5)
800081a0:	00070863          	beqz	a4,800081b0 <sys_timeout_abs+0x98>
800081a4:	00472683          	lw	a3,4(a4) # 10004 <_stack_size+0xf804>
800081a8:	40d406b3          	sub	a3,s0,a3
800081ac:	fe06d6e3          	bgez	a3,80008198 <sys_timeout_abs+0x80>
800081b0:	00e52023          	sw	a4,0(a0)
800081b4:	00a7a023          	sw	a0,0(a5)
800081b8:	fb5ff06f          	j	8000816c <sys_timeout_abs+0x54>

800081bc <lwip_cyclic_timer>:
800081bc:	fe010113          	addi	sp,sp,-32
800081c0:	00112e23          	sw	ra,28(sp)
800081c4:	00452783          	lw	a5,4(a0)
800081c8:	00a12623          	sw	a0,12(sp)
800081cc:	000780e7          	jalr	a5
800081d0:	d31fc0ef          	jal	ra,80004f00 <sys_now>
800081d4:	00c12603          	lw	a2,12(sp)
800081d8:	8d41a783          	lw	a5,-1836(gp) # 80003114 <current_timeout_due_time>
800081dc:	00062703          	lw	a4,0(a2)
800081e0:	800085b7          	lui	a1,0x80008
800081e4:	1bc58593          	addi	a1,a1,444 # 800081bc <_heap_end+0xffff61bc>
800081e8:	00f707b3          	add	a5,a4,a5
800081ec:	40a786b3          	sub	a3,a5,a0
800081f0:	00a70533          	add	a0,a4,a0
800081f4:	0006c463          	bltz	a3,800081fc <lwip_cyclic_timer+0x40>
800081f8:	00078513          	mv	a0,a5
800081fc:	01c12083          	lw	ra,28(sp)
80008200:	02010113          	addi	sp,sp,32
80008204:	f15ff06f          	j	80008118 <sys_timeout_abs>

80008208 <sys_timeout>:
80008208:	fe010113          	addi	sp,sp,-32
8000820c:	00812c23          	sw	s0,24(sp)
80008210:	00112e23          	sw	ra,28(sp)
80008214:	00050413          	mv	s0,a0
80008218:	00b12623          	sw	a1,12(sp)
8000821c:	00c12423          	sw	a2,8(sp)
80008220:	ce1fc0ef          	jal	ra,80004f00 <sys_now>
80008224:	00850533          	add	a0,a0,s0
80008228:	01812403          	lw	s0,24(sp)
8000822c:	00812603          	lw	a2,8(sp)
80008230:	00c12583          	lw	a1,12(sp)
80008234:	01c12083          	lw	ra,28(sp)
80008238:	02010113          	addi	sp,sp,32
8000823c:	eddff06f          	j	80008118 <sys_timeout_abs>

80008240 <sys_timeouts_init>:
80008240:	ff010113          	addi	sp,sp,-16
80008244:	00812423          	sw	s0,8(sp)
80008248:	80003637          	lui	a2,0x80003
8000824c:	80008437          	lui	s0,0x80008
80008250:	00912223          	sw	s1,4(sp)
80008254:	1bc40593          	addi	a1,s0,444 # 800081bc <_heap_end+0xffff61bc>
80008258:	ca860493          	addi	s1,a2,-856 # 80002ca8 <_heap_end+0xffff0ca8>
8000825c:	3e800513          	li	a0,1000
80008260:	ca860613          	addi	a2,a2,-856
80008264:	00112623          	sw	ra,12(sp)
80008268:	fa1ff0ef          	jal	ra,80008208 <sys_timeout>
8000826c:	0000f537          	lui	a0,0xf
80008270:	00848613          	addi	a2,s1,8
80008274:	1bc40593          	addi	a1,s0,444
80008278:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
8000827c:	f8dff0ef          	jal	ra,80008208 <sys_timeout>
80008280:	1bc40593          	addi	a1,s0,444
80008284:	00812403          	lw	s0,8(sp)
80008288:	00c12083          	lw	ra,12(sp)
8000828c:	01048613          	addi	a2,s1,16
80008290:	00412483          	lw	s1,4(sp)
80008294:	1f400513          	li	a0,500
80008298:	01010113          	addi	sp,sp,16
8000829c:	f6dff06f          	j	80008208 <sys_timeout>

800082a0 <sys_untimeout>:
800082a0:	8d81a783          	lw	a5,-1832(gp) # 80003118 <next_timeout>
800082a4:	00070693          	mv	a3,a4
800082a8:	00000613          	li	a2,0
800082ac:	00079e63          	bnez	a5,800082c8 <sys_untimeout+0x28>
800082b0:	00008067          	ret
800082b4:	00e62023          	sw	a4,0(a2)
800082b8:	02c0006f          	j	800082e4 <sys_untimeout+0x44>
800082bc:	00078613          	mv	a2,a5
800082c0:	fe0708e3          	beqz	a4,800082b0 <sys_untimeout+0x10>
800082c4:	00070793          	mv	a5,a4
800082c8:	0087a803          	lw	a6,8(a5)
800082cc:	0007a703          	lw	a4,0(a5)
800082d0:	fea816e3          	bne	a6,a0,800082bc <sys_untimeout+0x1c>
800082d4:	00c7a803          	lw	a6,12(a5)
800082d8:	feb812e3          	bne	a6,a1,800082bc <sys_untimeout+0x1c>
800082dc:	fc061ce3          	bnez	a2,800082b4 <sys_untimeout+0x14>
800082e0:	8ce1ac23          	sw	a4,-1832(gp) # 80003118 <next_timeout>
800082e4:	00078593          	mv	a1,a5
800082e8:	00300513          	li	a0,3
800082ec:	c78fe06f          	j	80006764 <memp_free>

800082f0 <sys_check_timeouts>:
800082f0:	fe010113          	addi	sp,sp,-32
800082f4:	00912a23          	sw	s1,20(sp)
800082f8:	01312623          	sw	s3,12(sp)
800082fc:	01412423          	sw	s4,8(sp)
80008300:	00112e23          	sw	ra,28(sp)
80008304:	00812c23          	sw	s0,24(sp)
80008308:	01212823          	sw	s2,16(sp)
8000830c:	bf5fc0ef          	jal	ra,80004f00 <sys_now>
80008310:	00050993          	mv	s3,a0
80008314:	8d81a583          	lw	a1,-1832(gp) # 80003118 <next_timeout>
80008318:	02058e63          	beqz	a1,80008354 <sys_check_timeouts+0x64>
8000831c:	0045a783          	lw	a5,4(a1)
80008320:	40f98733          	sub	a4,s3,a5
80008324:	02074863          	bltz	a4,80008354 <sys_check_timeouts+0x64>
80008328:	0005a703          	lw	a4,0(a1)
8000832c:	0085a403          	lw	s0,8(a1)
80008330:	00300513          	li	a0,3
80008334:	8ce1ac23          	sw	a4,-1832(gp) # 80003118 <next_timeout>
80008338:	00c5a903          	lw	s2,12(a1)
8000833c:	8cf1aa23          	sw	a5,-1836(gp) # 80003114 <current_timeout_due_time>
80008340:	c24fe0ef          	jal	ra,80006764 <memp_free>
80008344:	fc0408e3          	beqz	s0,80008314 <sys_check_timeouts+0x24>
80008348:	00090513          	mv	a0,s2
8000834c:	000400e7          	jalr	s0
80008350:	fc5ff06f          	j	80008314 <sys_check_timeouts+0x24>
80008354:	01c12083          	lw	ra,28(sp)
80008358:	01812403          	lw	s0,24(sp)
8000835c:	01412483          	lw	s1,20(sp)
80008360:	01012903          	lw	s2,16(sp)
80008364:	00c12983          	lw	s3,12(sp)
80008368:	00812a03          	lw	s4,8(sp)
8000836c:	02010113          	addi	sp,sp,32
80008370:	00008067          	ret

80008374 <sys_restart_timeouts>:
80008374:	ff010113          	addi	sp,sp,-16
80008378:	00812423          	sw	s0,8(sp)
8000837c:	8d81a783          	lw	a5,-1832(gp) # 80003118 <next_timeout>
80008380:	00112623          	sw	ra,12(sp)
80008384:	02078463          	beqz	a5,800083ac <sys_restart_timeouts+0x38>
80008388:	b79fc0ef          	jal	ra,80004f00 <sys_now>
8000838c:	8d81a783          	lw	a5,-1832(gp) # 80003118 <next_timeout>
80008390:	0047a703          	lw	a4,4(a5)
80008394:	40e50533          	sub	a0,a0,a4
80008398:	0047a703          	lw	a4,4(a5)
8000839c:	00a70733          	add	a4,a4,a0
800083a0:	00e7a223          	sw	a4,4(a5)
800083a4:	0007a783          	lw	a5,0(a5)
800083a8:	fe0798e3          	bnez	a5,80008398 <sys_restart_timeouts+0x24>
800083ac:	00c12083          	lw	ra,12(sp)
800083b0:	00812403          	lw	s0,8(sp)
800083b4:	01010113          	addi	sp,sp,16
800083b8:	00008067          	ret

800083bc <sys_timeouts_sleeptime>:
800083bc:	ff010113          	addi	sp,sp,-16
800083c0:	00812423          	sw	s0,8(sp)
800083c4:	8d81a783          	lw	a5,-1832(gp) # 80003118 <next_timeout>
800083c8:	00112623          	sw	ra,12(sp)
800083cc:	fff00513          	li	a0,-1
800083d0:	00078e63          	beqz	a5,800083ec <sys_timeouts_sleeptime+0x30>
800083d4:	b2dfc0ef          	jal	ra,80004f00 <sys_now>
800083d8:	8d81a783          	lw	a5,-1832(gp) # 80003118 <next_timeout>
800083dc:	0047a783          	lw	a5,4(a5)
800083e0:	40a78533          	sub	a0,a5,a0
800083e4:	00055463          	bgez	a0,800083ec <sys_timeouts_sleeptime+0x30>
800083e8:	00000513          	li	a0,0
800083ec:	00c12083          	lw	ra,12(sp)
800083f0:	00812403          	lw	s0,8(sp)
800083f4:	01010113          	addi	sp,sp,16
800083f8:	00008067          	ret

800083fc <udp_init>:
800083fc:	00008067          	ret

80008400 <udp_input>:
80008400:	fd010113          	addi	sp,sp,-48
80008404:	02812423          	sw	s0,40(sp)
80008408:	02112623          	sw	ra,44(sp)
8000840c:	02912223          	sw	s1,36(sp)
80008410:	03212023          	sw	s2,32(sp)
80008414:	01312e23          	sw	s3,28(sp)
80008418:	01412c23          	sw	s4,24(sp)
8000841c:	01512a23          	sw	s5,20(sp)
80008420:	01612823          	sw	s6,16(sp)
80008424:	01712623          	sw	s7,12(sp)
80008428:	a0418793          	addi	a5,gp,-1532 # 80003244 <lwip_stats>
8000842c:	0f47a703          	lw	a4,244(a5)
80008430:	00170713          	addi	a4,a4,1
80008434:	0ee7aa23          	sw	a4,244(a5)
80008438:	00a55683          	lhu	a3,10(a0)
8000843c:	00700713          	li	a4,7
80008440:	04d76463          	bltu	a4,a3,80008488 <udp_input+0x88>
80008444:	1047a703          	lw	a4,260(a5)
80008448:	00170713          	addi	a4,a4,1
8000844c:	10e7a223          	sw	a4,260(a5)
80008450:	0fc7a703          	lw	a4,252(a5)
80008454:	00170713          	addi	a4,a4,1
80008458:	0ee7ae23          	sw	a4,252(a5)
8000845c:	02812403          	lw	s0,40(sp)
80008460:	02c12083          	lw	ra,44(sp)
80008464:	02412483          	lw	s1,36(sp)
80008468:	02012903          	lw	s2,32(sp)
8000846c:	01c12983          	lw	s3,28(sp)
80008470:	01812a03          	lw	s4,24(sp)
80008474:	01412a83          	lw	s5,20(sp)
80008478:	01012b03          	lw	s6,16(sp)
8000847c:	00c12b83          	lw	s7,12(sp)
80008480:	03010113          	addi	sp,sp,48
80008484:	b95fe06f          	j	80007018 <pbuf_free>
80008488:	9ec18913          	addi	s2,gp,-1556 # 8000322c <ip_data>
8000848c:	00452983          	lw	s3,4(a0)
80008490:	00050493          	mv	s1,a0
80008494:	00058b93          	mv	s7,a1
80008498:	01492503          	lw	a0,20(s2)
8000849c:	00092583          	lw	a1,0(s2)
800084a0:	a0418413          	addi	s0,gp,-1532 # 80003244 <lwip_stats>
800084a4:	9ec18a13          	addi	s4,gp,-1556 # 8000322c <ip_data>
800084a8:	11c040ef          	jal	ra,8000c5c4 <ip4_addr_isbroadcast_u32>
800084ac:	0019c783          	lbu	a5,1(s3)
800084b0:	00050a93          	mv	s5,a0
800084b4:	0009c503          	lbu	a0,0(s3)
800084b8:	00879793          	slli	a5,a5,0x8
800084bc:	00a7e533          	or	a0,a5,a0
800084c0:	935fd0ef          	jal	ra,80005df4 <lwip_htons>
800084c4:	0039c783          	lbu	a5,3(s3)
800084c8:	00050b13          	mv	s6,a0
800084cc:	0029c503          	lbu	a0,2(s3)
800084d0:	00879793          	slli	a5,a5,0x8
800084d4:	00a7e533          	or	a0,a5,a0
800084d8:	91dfd0ef          	jal	ra,80005df4 <lwip_htons>
800084dc:	8dc1a803          	lw	a6,-1828(gp) # 8000311c <udp_pcbs>
800084e0:	00492303          	lw	t1,4(s2)
800084e4:	01492683          	lw	a3,20(s2)
800084e8:	01092e03          	lw	t3,16(s2)
800084ec:	00080793          	mv	a5,a6
800084f0:	00000913          	li	s2,0
800084f4:	00000593          	li	a1,0
800084f8:	fff00893          	li	a7,-1
800084fc:	00079c63          	bnez	a5,80008514 <udp_input+0x114>
80008500:	0a091e63          	bnez	s2,800085bc <udp_input+0x1bc>
80008504:	004ba783          	lw	a5,4(s7)
80008508:	0ad78a63          	beq	a5,a3,800085bc <udp_input+0x1bc>
8000850c:	00048513          	mv	a0,s1
80008510:	f4dff06f          	j	8000845c <udp_input+0x5c>
80008514:	0167d703          	lhu	a4,22(a5)
80008518:	0ea71e63          	bne	a4,a0,80008614 <udp_input+0x214>
8000851c:	0087ce83          	lbu	t4,8(a5)
80008520:	000e8a63          	beqz	t4,80008534 <udp_input+0x134>
80008524:	03834703          	lbu	a4,56(t1)
80008528:	00170713          	addi	a4,a4,1
8000852c:	0ff77713          	andi	a4,a4,255
80008530:	0eee9263          	bne	t4,a4,80008614 <udp_input+0x214>
80008534:	0c0a8a63          	beqz	s5,80008608 <udp_input+0x208>
80008538:	0097c703          	lbu	a4,9(a5)
8000853c:	02077713          	andi	a4,a4,32
80008540:	0c070a63          	beqz	a4,80008614 <udp_input+0x214>
80008544:	0007a703          	lw	a4,0(a5)
80008548:	00070c63          	beqz	a4,80008560 <udp_input+0x160>
8000854c:	01168a63          	beq	a3,a7,80008560 <udp_input+0x160>
80008550:	008bae83          	lw	t4,8(s7)
80008554:	00d74733          	xor	a4,a4,a3
80008558:	01d77733          	and	a4,a4,t4
8000855c:	0a071c63          	bnez	a4,80008614 <udp_input+0x214>
80008560:	0147c703          	lbu	a4,20(a5)
80008564:	00477713          	andi	a4,a4,4
80008568:	02071463          	bnez	a4,80008590 <udp_input+0x190>
8000856c:	02090063          	beqz	s2,8000858c <udp_input+0x18c>
80008570:	020a8063          	beqz	s5,80008590 <udp_input+0x190>
80008574:	01169e63          	bne	a3,a7,80008590 <udp_input+0x190>
80008578:	004ba703          	lw	a4,4(s7)
8000857c:	00092e83          	lw	t4,0(s2)
80008580:	00ee8863          	beq	t4,a4,80008590 <udp_input+0x190>
80008584:	0007ae83          	lw	t4,0(a5)
80008588:	01d71463          	bne	a4,t4,80008590 <udp_input+0x190>
8000858c:	00078913          	mv	s2,a5
80008590:	0187d703          	lhu	a4,24(a5)
80008594:	09671063          	bne	a4,s6,80008614 <udp_input+0x214>
80008598:	0047a703          	lw	a4,4(a5)
8000859c:	00070463          	beqz	a4,800085a4 <udp_input+0x1a4>
800085a0:	07c71a63          	bne	a4,t3,80008614 <udp_input+0x214>
800085a4:	06058e63          	beqz	a1,80008620 <udp_input+0x220>
800085a8:	0107a703          	lw	a4,16(a5)
800085ac:	8cf1ae23          	sw	a5,-1828(gp) # 8000311c <udp_pcbs>
800085b0:	00e5a823          	sw	a4,16(a1)
800085b4:	0107a823          	sw	a6,16(a5)
800085b8:	00078913          	mv	s2,a5
800085bc:	0079c783          	lbu	a5,7(s3)
800085c0:	0069c703          	lbu	a4,6(s3)
800085c4:	00879793          	slli	a5,a5,0x8
800085c8:	00e7e7b3          	or	a5,a5,a4
800085cc:	06078263          	beqz	a5,80008630 <udp_input+0x230>
800085d0:	0084d603          	lhu	a2,8(s1)
800085d4:	a0018713          	addi	a4,gp,-1536 # 80003240 <ip_data+0x14>
800085d8:	9fc18693          	addi	a3,gp,-1540 # 8000323c <ip_data+0x10>
800085dc:	01100593          	li	a1,17
800085e0:	00048513          	mv	a0,s1
800085e4:	c71fd0ef          	jal	ra,80006254 <ip_chksum_pseudo>
800085e8:	04050463          	beqz	a0,80008630 <udp_input+0x230>
800085ec:	10042783          	lw	a5,256(s0)
800085f0:	00178793          	addi	a5,a5,1
800085f4:	10f42023          	sw	a5,256(s0)
800085f8:	0fc42783          	lw	a5,252(s0)
800085fc:	00178793          	addi	a5,a5,1
80008600:	0ef42e23          	sw	a5,252(s0)
80008604:	f09ff06f          	j	8000850c <udp_input+0x10c>
80008608:	0007a703          	lw	a4,0(a5)
8000860c:	f4070ae3          	beqz	a4,80008560 <udp_input+0x160>
80008610:	f4d708e3          	beq	a4,a3,80008560 <udp_input+0x160>
80008614:	00078593          	mv	a1,a5
80008618:	0107a783          	lw	a5,16(a5)
8000861c:	ee1ff06f          	j	800084fc <udp_input+0xfc>
80008620:	11c42703          	lw	a4,284(s0)
80008624:	00170713          	addi	a4,a4,1
80008628:	10e42e23          	sw	a4,284(s0)
8000862c:	f8dff06f          	j	800085b8 <udp_input+0x1b8>
80008630:	00800593          	li	a1,8
80008634:	00048513          	mv	a0,s1
80008638:	959fe0ef          	jal	ra,80006f90 <pbuf_remove_header>
8000863c:	fa051ee3          	bnez	a0,800085f8 <udp_input+0x1f8>
80008640:	04090663          	beqz	s2,8000868c <udp_input+0x28c>
80008644:	01c92303          	lw	t1,28(s2)
80008648:	ec0302e3          	beqz	t1,8000850c <udp_input+0x10c>
8000864c:	02812403          	lw	s0,40(sp)
80008650:	02092503          	lw	a0,32(s2)
80008654:	02c12083          	lw	ra,44(sp)
80008658:	01c12983          	lw	s3,28(sp)
8000865c:	01812a03          	lw	s4,24(sp)
80008660:	01412a83          	lw	s5,20(sp)
80008664:	00c12b83          	lw	s7,12(sp)
80008668:	000b0713          	mv	a4,s6
8000866c:	00048613          	mv	a2,s1
80008670:	01012b03          	lw	s6,16(sp)
80008674:	02412483          	lw	s1,36(sp)
80008678:	00090593          	mv	a1,s2
8000867c:	02012903          	lw	s2,32(sp)
80008680:	9fc18693          	addi	a3,gp,-1540 # 8000323c <ip_data+0x10>
80008684:	03010113          	addi	sp,sp,48
80008688:	00030067          	jr	t1
8000868c:	020a9c63          	bnez	s5,800086c4 <udp_input+0x2c4>
80008690:	014a2783          	lw	a5,20(s4)
80008694:	0e000713          	li	a4,224
80008698:	0f07f793          	andi	a5,a5,240
8000869c:	02e78463          	beq	a5,a4,800086c4 <udp_input+0x2c4>
800086a0:	00ca5583          	lhu	a1,12(s4)
800086a4:	00048513          	mv	a0,s1
800086a8:	00858593          	addi	a1,a1,8
800086ac:	01059593          	slli	a1,a1,0x10
800086b0:	4105d593          	srai	a1,a1,0x10
800086b4:	951fe0ef          	jal	ra,80007004 <pbuf_header_force>
800086b8:	00300593          	li	a1,3
800086bc:	00048513          	mv	a0,s1
800086c0:	264030ef          	jal	ra,8000b924 <icmp_dest_unreach>
800086c4:	11042783          	lw	a5,272(s0)
800086c8:	00178793          	addi	a5,a5,1
800086cc:	10f42823          	sw	a5,272(s0)
800086d0:	f29ff06f          	j	800085f8 <udp_input+0x1f8>

800086d4 <udp_bind>:
800086d4:	00059463          	bnez	a1,800086dc <udp_bind+0x8>
800086d8:	84818593          	addi	a1,gp,-1976 # 80003088 <ip_addr_any>
800086dc:	ff000793          	li	a5,-16
800086e0:	0a050463          	beqz	a0,80008788 <udp_bind+0xb4>
800086e4:	8dc1a783          	lw	a5,-1828(gp) # 8000311c <udp_pcbs>
800086e8:	00078693          	mv	a3,a5
800086ec:	06069063          	bnez	a3,8000874c <udp_bind+0x78>
800086f0:	00000e13          	li	t3,0
800086f4:	0c061463          	bnez	a2,800087bc <udp_bind+0xe8>
800086f8:	800036b7          	lui	a3,0x80003
800086fc:	0446d603          	lhu	a2,68(a3) # 80003044 <_heap_end+0xffff1044>
80008700:	00010337          	lui	t1,0x10
80008704:	00004837          	lui	a6,0x4
80008708:	fff30313          	addi	t1,t1,-1 # ffff <_stack_size+0xf7ff>
8000870c:	04660a63          	beq	a2,t1,80008760 <udp_bind+0x8c>
80008710:	00160613          	addi	a2,a2,1
80008714:	01061613          	slli	a2,a2,0x10
80008718:	01065613          	srli	a2,a2,0x10
8000871c:	00078893          	mv	a7,a5
80008720:	04089463          	bnez	a7,80008768 <udp_bind+0x94>
80008724:	04c69223          	sh	a2,68(a3)
80008728:	0005a783          	lw	a5,0(a1)
8000872c:	00c51b23          	sh	a2,22(a0)
80008730:	00f52023          	sw	a5,0(a0)
80008734:	000e1863          	bnez	t3,80008744 <udp_bind+0x70>
80008738:	8dc1a783          	lw	a5,-1828(gp) # 8000311c <udp_pcbs>
8000873c:	8ca1ae23          	sw	a0,-1828(gp) # 8000311c <udp_pcbs>
80008740:	00f52823          	sw	a5,16(a0)
80008744:	00000793          	li	a5,0
80008748:	0400006f          	j	80008788 <udp_bind+0xb4>
8000874c:	00a68663          	beq	a3,a0,80008758 <udp_bind+0x84>
80008750:	0106a683          	lw	a3,16(a3)
80008754:	f99ff06f          	j	800086ec <udp_bind+0x18>
80008758:	00100e13          	li	t3,1
8000875c:	f99ff06f          	j	800086f4 <udp_bind+0x20>
80008760:	0000c637          	lui	a2,0xc
80008764:	fb9ff06f          	j	8000871c <udp_bind+0x48>
80008768:	0168de83          	lhu	t4,22(a7)
8000876c:	02ce9263          	bne	t4,a2,80008790 <udp_bind+0xbc>
80008770:	fff80813          	addi	a6,a6,-1 # 3fff <_stack_size+0x37ff>
80008774:	01081813          	slli	a6,a6,0x10
80008778:	01085813          	srli	a6,a6,0x10
8000877c:	f80818e3          	bnez	a6,8000870c <udp_bind+0x38>
80008780:	04c69223          	sh	a2,68(a3)
80008784:	ff800793          	li	a5,-8
80008788:	00078513          	mv	a0,a5
8000878c:	00008067          	ret
80008790:	0108a883          	lw	a7,16(a7)
80008794:	f8dff06f          	j	80008720 <udp_bind+0x4c>
80008798:	02a78063          	beq	a5,a0,800087b8 <udp_bind+0xe4>
8000879c:	0167d683          	lhu	a3,22(a5)
800087a0:	00c69c63          	bne	a3,a2,800087b8 <udp_bind+0xe4>
800087a4:	0005a803          	lw	a6,0(a1)
800087a8:	0007a683          	lw	a3,0(a5)
800087ac:	fd068ce3          	beq	a3,a6,80008784 <udp_bind+0xb0>
800087b0:	fc080ae3          	beqz	a6,80008784 <udp_bind+0xb0>
800087b4:	fc0688e3          	beqz	a3,80008784 <udp_bind+0xb0>
800087b8:	0107a783          	lw	a5,16(a5)
800087bc:	fc079ee3          	bnez	a5,80008798 <udp_bind+0xc4>
800087c0:	f69ff06f          	j	80008728 <udp_bind+0x54>

800087c4 <udp_sendto_if_src>:
800087c4:	fd010113          	addi	sp,sp,-48
800087c8:	02912223          	sw	s1,36(sp)
800087cc:	02112623          	sw	ra,44(sp)
800087d0:	02812423          	sw	s0,40(sp)
800087d4:	03212023          	sw	s2,32(sp)
800087d8:	01312e23          	sw	s3,28(sp)
800087dc:	01412c23          	sw	s4,24(sp)
800087e0:	01512a23          	sw	s5,20(sp)
800087e4:	01612823          	sw	s6,16(sp)
800087e8:	01712623          	sw	s7,12(sp)
800087ec:	ff000493          	li	s1,-16
800087f0:	08050263          	beqz	a0,80008874 <udp_sendto_if_src+0xb0>
800087f4:	08058063          	beqz	a1,80008874 <udp_sendto_if_src+0xb0>
800087f8:	06060e63          	beqz	a2,80008874 <udp_sendto_if_src+0xb0>
800087fc:	06078c63          	beqz	a5,80008874 <udp_sendto_if_src+0xb0>
80008800:	06070a63          	beqz	a4,80008874 <udp_sendto_if_src+0xb0>
80008804:	00078b13          	mv	s6,a5
80008808:	00954783          	lbu	a5,9(a0)
8000880c:	00070a13          	mv	s4,a4
80008810:	00068b93          	mv	s7,a3
80008814:	0207f793          	andi	a5,a5,32
80008818:	00060a93          	mv	s5,a2
8000881c:	00058993          	mv	s3,a1
80008820:	00050413          	mv	s0,a0
80008824:	02078e63          	beqz	a5,80008860 <udp_sendto_if_src+0x9c>
80008828:	01645783          	lhu	a5,22(s0)
8000882c:	00079e63          	bnez	a5,80008848 <udp_sendto_if_src+0x84>
80008830:	00000613          	li	a2,0
80008834:	00040593          	mv	a1,s0
80008838:	00040513          	mv	a0,s0
8000883c:	e99ff0ef          	jal	ra,800086d4 <udp_bind>
80008840:	00050493          	mv	s1,a0
80008844:	02051863          	bnez	a0,80008874 <udp_sendto_if_src+0xb0>
80008848:	0089d703          	lhu	a4,8(s3)
8000884c:	000107b7          	lui	a5,0x10
80008850:	ff778793          	addi	a5,a5,-9 # fff7 <_stack_size+0xf7f7>
80008854:	04e7f863          	bgeu	a5,a4,800088a4 <udp_sendto_if_src+0xe0>
80008858:	fff00493          	li	s1,-1
8000885c:	0180006f          	j	80008874 <udp_sendto_if_src+0xb0>
80008860:	00062503          	lw	a0,0(a2) # c000 <_stack_size+0xb800>
80008864:	00070593          	mv	a1,a4
80008868:	ffa00493          	li	s1,-6
8000886c:	559030ef          	jal	ra,8000c5c4 <ip4_addr_isbroadcast_u32>
80008870:	fa050ce3          	beqz	a0,80008828 <udp_sendto_if_src+0x64>
80008874:	02c12083          	lw	ra,44(sp)
80008878:	02812403          	lw	s0,40(sp)
8000887c:	00048513          	mv	a0,s1
80008880:	02012903          	lw	s2,32(sp)
80008884:	02412483          	lw	s1,36(sp)
80008888:	01c12983          	lw	s3,28(sp)
8000888c:	01812a03          	lw	s4,24(sp)
80008890:	01412a83          	lw	s5,20(sp)
80008894:	01012b03          	lw	s6,16(sp)
80008898:	00c12b83          	lw	s7,12(sp)
8000889c:	03010113          	addi	sp,sp,48
800088a0:	00008067          	ret
800088a4:	00800593          	li	a1,8
800088a8:	00098513          	mv	a0,s3
800088ac:	ed4fe0ef          	jal	ra,80006f80 <pbuf_add_header>
800088b0:	10050063          	beqz	a0,800089b0 <udp_sendto_if_src+0x1ec>
800088b4:	28000613          	li	a2,640
800088b8:	00800593          	li	a1,8
800088bc:	02400513          	li	a0,36
800088c0:	82dfe0ef          	jal	ra,800070ec <pbuf_alloc>
800088c4:	00050913          	mv	s2,a0
800088c8:	f80508e3          	beqz	a0,80008858 <udp_sendto_if_src+0x94>
800088cc:	0089d783          	lhu	a5,8(s3)
800088d0:	00078663          	beqz	a5,800088dc <udp_sendto_if_src+0x118>
800088d4:	00098593          	mv	a1,s3
800088d8:	b99fe0ef          	jal	ra,80007470 <pbuf_chain>
800088dc:	01645503          	lhu	a0,22(s0)
800088e0:	00492483          	lw	s1,4(s2)
800088e4:	d10fd0ef          	jal	ra,80005df4 <lwip_htons>
800088e8:	00a48023          	sb	a0,0(s1)
800088ec:	00855513          	srli	a0,a0,0x8
800088f0:	00a480a3          	sb	a0,1(s1)
800088f4:	000b8513          	mv	a0,s7
800088f8:	cfcfd0ef          	jal	ra,80005df4 <lwip_htons>
800088fc:	00a48123          	sb	a0,2(s1)
80008900:	00855513          	srli	a0,a0,0x8
80008904:	00a481a3          	sb	a0,3(s1)
80008908:	00048323          	sb	zero,6(s1)
8000890c:	000483a3          	sb	zero,7(s1)
80008910:	00895503          	lhu	a0,8(s2)
80008914:	ce0fd0ef          	jal	ra,80005df4 <lwip_htons>
80008918:	00a48223          	sb	a0,4(s1)
8000891c:	00855513          	srli	a0,a0,0x8
80008920:	00a482a3          	sb	a0,5(s1)
80008924:	01444783          	lbu	a5,20(s0)
80008928:	0017f793          	andi	a5,a5,1
8000892c:	02079a63          	bnez	a5,80008960 <udp_sendto_if_src+0x19c>
80008930:	00895603          	lhu	a2,8(s2)
80008934:	000a8713          	mv	a4,s5
80008938:	000b0693          	mv	a3,s6
8000893c:	01100593          	li	a1,17
80008940:	00090513          	mv	a0,s2
80008944:	911fd0ef          	jal	ra,80006254 <ip_chksum_pseudo>
80008948:	00051663          	bnez	a0,80008954 <udp_sendto_if_src+0x190>
8000894c:	00010537          	lui	a0,0x10
80008950:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xf7ff>
80008954:	00a48323          	sb	a0,6(s1)
80008958:	00855513          	srli	a0,a0,0x8
8000895c:	00a483a3          	sb	a0,7(s1)
80008960:	00c40793          	addi	a5,s0,12
80008964:	00b44683          	lbu	a3,11(s0)
80008968:	02fa2e23          	sw	a5,60(s4)
8000896c:	00a44703          	lbu	a4,10(s0)
80008970:	000a0813          	mv	a6,s4
80008974:	01100793          	li	a5,17
80008978:	000a8613          	mv	a2,s5
8000897c:	000b0593          	mv	a1,s6
80008980:	00090513          	mv	a0,s2
80008984:	0d1030ef          	jal	ra,8000c254 <ip4_output_if_src>
80008988:	020a2e23          	sw	zero,60(s4)
8000898c:	00050493          	mv	s1,a0
80008990:	01390663          	beq	s2,s3,8000899c <udp_sendto_if_src+0x1d8>
80008994:	00090513          	mv	a0,s2
80008998:	e80fe0ef          	jal	ra,80007018 <pbuf_free>
8000899c:	a0418793          	addi	a5,gp,-1532 # 80003244 <lwip_stats>
800089a0:	0f07a703          	lw	a4,240(a5)
800089a4:	00170713          	addi	a4,a4,1
800089a8:	0ee7a823          	sw	a4,240(a5)
800089ac:	ec9ff06f          	j	80008874 <udp_sendto_if_src+0xb0>
800089b0:	00098913          	mv	s2,s3
800089b4:	f29ff06f          	j	800088dc <udp_sendto_if_src+0x118>

800089b8 <udp_sendto_if>:
800089b8:	02050e63          	beqz	a0,800089f4 <udp_sendto_if+0x3c>
800089bc:	02058c63          	beqz	a1,800089f4 <udp_sendto_if+0x3c>
800089c0:	02060a63          	beqz	a2,800089f4 <udp_sendto_if+0x3c>
800089c4:	02070863          	beqz	a4,800089f4 <udp_sendto_if+0x3c>
800089c8:	00052783          	lw	a5,0(a0)
800089cc:	00078863          	beqz	a5,800089dc <udp_sendto_if+0x24>
800089d0:	0f07f813          	andi	a6,a5,240
800089d4:	0e000893          	li	a7,224
800089d8:	01181663          	bne	a6,a7,800089e4 <udp_sendto_if+0x2c>
800089dc:	00470793          	addi	a5,a4,4
800089e0:	de5ff06f          	j	800087c4 <udp_sendto_if_src>
800089e4:	00472803          	lw	a6,4(a4)
800089e8:	01079a63          	bne	a5,a6,800089fc <udp_sendto_if+0x44>
800089ec:	00050793          	mv	a5,a0
800089f0:	ff1ff06f          	j	800089e0 <udp_sendto_if+0x28>
800089f4:	ff000513          	li	a0,-16
800089f8:	00008067          	ret
800089fc:	ffc00513          	li	a0,-4
80008a00:	00008067          	ret

80008a04 <udp_sendto>:
80008a04:	0a050863          	beqz	a0,80008ab4 <udp_sendto+0xb0>
80008a08:	0a058663          	beqz	a1,80008ab4 <udp_sendto+0xb0>
80008a0c:	0a060463          	beqz	a2,80008ab4 <udp_sendto+0xb0>
80008a10:	fe010113          	addi	sp,sp,-32
80008a14:	00812c23          	sw	s0,24(sp)
80008a18:	00912a23          	sw	s1,20(sp)
80008a1c:	01212823          	sw	s2,16(sp)
80008a20:	01312623          	sw	s3,12(sp)
80008a24:	00112e23          	sw	ra,28(sp)
80008a28:	00050413          	mv	s0,a0
80008a2c:	00854503          	lbu	a0,8(a0)
80008a30:	00068993          	mv	s3,a3
80008a34:	00060493          	mv	s1,a2
80008a38:	00058913          	mv	s2,a1
80008a3c:	02050e63          	beqz	a0,80008a78 <udp_sendto+0x74>
80008a40:	a9cfe0ef          	jal	ra,80006cdc <netif_get_by_index>
80008a44:	04051063          	bnez	a0,80008a84 <udp_sendto+0x80>
80008a48:	a0418793          	addi	a5,gp,-1532 # 80003244 <lwip_stats>
80008a4c:	10c7a703          	lw	a4,268(a5)
80008a50:	ffc00513          	li	a0,-4
80008a54:	00170713          	addi	a4,a4,1
80008a58:	10e7a623          	sw	a4,268(a5)
80008a5c:	01c12083          	lw	ra,28(sp)
80008a60:	01812403          	lw	s0,24(sp)
80008a64:	01412483          	lw	s1,20(sp)
80008a68:	01012903          	lw	s2,16(sp)
80008a6c:	00c12983          	lw	s3,12(sp)
80008a70:	02010113          	addi	sp,sp,32
80008a74:	00008067          	ret
80008a78:	00060513          	mv	a0,a2
80008a7c:	384030ef          	jal	ra,8000be00 <ip4_route>
80008a80:	fc5ff06f          	j	80008a44 <udp_sendto+0x40>
80008a84:	00050713          	mv	a4,a0
80008a88:	00040513          	mv	a0,s0
80008a8c:	01812403          	lw	s0,24(sp)
80008a90:	01c12083          	lw	ra,28(sp)
80008a94:	00098693          	mv	a3,s3
80008a98:	00048613          	mv	a2,s1
80008a9c:	00c12983          	lw	s3,12(sp)
80008aa0:	01412483          	lw	s1,20(sp)
80008aa4:	00090593          	mv	a1,s2
80008aa8:	01012903          	lw	s2,16(sp)
80008aac:	02010113          	addi	sp,sp,32
80008ab0:	f09ff06f          	j	800089b8 <udp_sendto_if>
80008ab4:	ff000513          	li	a0,-16
80008ab8:	00008067          	ret

80008abc <udp_send>:
80008abc:	00050a63          	beqz	a0,80008ad0 <udp_send+0x14>
80008ac0:	00058863          	beqz	a1,80008ad0 <udp_send+0x14>
80008ac4:	01855683          	lhu	a3,24(a0)
80008ac8:	00450613          	addi	a2,a0,4
80008acc:	f39ff06f          	j	80008a04 <udp_sendto>
80008ad0:	ff000513          	li	a0,-16
80008ad4:	00008067          	ret

80008ad8 <udp_bind_netif>:
80008ad8:	00000793          	li	a5,0
80008adc:	00058863          	beqz	a1,80008aec <udp_bind_netif+0x14>
80008ae0:	0385c783          	lbu	a5,56(a1)
80008ae4:	00178793          	addi	a5,a5,1
80008ae8:	0ff7f793          	andi	a5,a5,255
80008aec:	00f50423          	sb	a5,8(a0)
80008af0:	00008067          	ret

80008af4 <udp_connect>:
80008af4:	ff000793          	li	a5,-16
80008af8:	0a050063          	beqz	a0,80008b98 <udp_connect+0xa4>
80008afc:	08058e63          	beqz	a1,80008b98 <udp_connect+0xa4>
80008b00:	ff010113          	addi	sp,sp,-16
80008b04:	00812423          	sw	s0,8(sp)
80008b08:	00912223          	sw	s1,4(sp)
80008b0c:	01212023          	sw	s2,0(sp)
80008b10:	00112623          	sw	ra,12(sp)
80008b14:	01655783          	lhu	a5,22(a0)
80008b18:	00050413          	mv	s0,a0
80008b1c:	00060913          	mv	s2,a2
80008b20:	00058493          	mv	s1,a1
80008b24:	02078c63          	beqz	a5,80008b5c <udp_connect+0x68>
80008b28:	0004a783          	lw	a5,0(s1)
80008b2c:	01241c23          	sh	s2,24(s0)
80008b30:	00f42223          	sw	a5,4(s0)
80008b34:	01444783          	lbu	a5,20(s0)
80008b38:	0047e793          	ori	a5,a5,4
80008b3c:	00f40a23          	sb	a5,20(s0)
80008b40:	8dc1a683          	lw	a3,-1828(gp) # 8000311c <udp_pcbs>
80008b44:	00068713          	mv	a4,a3
80008b48:	04071263          	bnez	a4,80008b8c <udp_connect+0x98>
80008b4c:	00d42823          	sw	a3,16(s0)
80008b50:	8c81ae23          	sw	s0,-1828(gp) # 8000311c <udp_pcbs>
80008b54:	00000793          	li	a5,0
80008b58:	0180006f          	j	80008b70 <udp_connect+0x7c>
80008b5c:	00000613          	li	a2,0
80008b60:	00050593          	mv	a1,a0
80008b64:	b71ff0ef          	jal	ra,800086d4 <udp_bind>
80008b68:	00050793          	mv	a5,a0
80008b6c:	fa050ee3          	beqz	a0,80008b28 <udp_connect+0x34>
80008b70:	00c12083          	lw	ra,12(sp)
80008b74:	00812403          	lw	s0,8(sp)
80008b78:	00412483          	lw	s1,4(sp)
80008b7c:	00012903          	lw	s2,0(sp)
80008b80:	00078513          	mv	a0,a5
80008b84:	01010113          	addi	sp,sp,16
80008b88:	00008067          	ret
80008b8c:	fc8704e3          	beq	a4,s0,80008b54 <udp_connect+0x60>
80008b90:	01072703          	lw	a4,16(a4)
80008b94:	fb5ff06f          	j	80008b48 <udp_connect+0x54>
80008b98:	00078513          	mv	a0,a5
80008b9c:	00008067          	ret

80008ba0 <udp_disconnect>:
80008ba0:	00050e63          	beqz	a0,80008bbc <udp_disconnect+0x1c>
80008ba4:	01454783          	lbu	a5,20(a0)
80008ba8:	00052223          	sw	zero,4(a0)
80008bac:	00051c23          	sh	zero,24(a0)
80008bb0:	ffb7f793          	andi	a5,a5,-5
80008bb4:	00050423          	sb	zero,8(a0)
80008bb8:	00f50a23          	sb	a5,20(a0)
80008bbc:	00008067          	ret

80008bc0 <udp_recv>:
80008bc0:	00050663          	beqz	a0,80008bcc <udp_recv+0xc>
80008bc4:	00b52e23          	sw	a1,28(a0)
80008bc8:	02c52023          	sw	a2,32(a0)
80008bcc:	00008067          	ret

80008bd0 <udp_remove>:
80008bd0:	00050593          	mv	a1,a0
80008bd4:	02050e63          	beqz	a0,80008c10 <udp_remove+0x40>
80008bd8:	8dc1a783          	lw	a5,-1828(gp) # 8000311c <udp_pcbs>
80008bdc:	00a79c63          	bne	a5,a0,80008bf4 <udp_remove+0x24>
80008be0:	01052783          	lw	a5,16(a0)
80008be4:	8cf1ae23          	sw	a5,-1828(gp) # 8000311c <udp_pcbs>
80008be8:	00100513          	li	a0,1
80008bec:	b79fd06f          	j	80006764 <memp_free>
80008bf0:	00070793          	mv	a5,a4
80008bf4:	fe078ae3          	beqz	a5,80008be8 <udp_remove+0x18>
80008bf8:	0107a703          	lw	a4,16(a5)
80008bfc:	fe0706e3          	beqz	a4,80008be8 <udp_remove+0x18>
80008c00:	feb718e3          	bne	a4,a1,80008bf0 <udp_remove+0x20>
80008c04:	0105a703          	lw	a4,16(a1)
80008c08:	00e7a823          	sw	a4,16(a5)
80008c0c:	fddff06f          	j	80008be8 <udp_remove+0x18>
80008c10:	00008067          	ret

80008c14 <udp_new>:
80008c14:	800035b7          	lui	a1,0x80003
80008c18:	ff010113          	addi	sp,sp,-16
80008c1c:	4c800613          	li	a2,1224
80008c20:	cdc58593          	addi	a1,a1,-804 # 80002cdc <_heap_end+0xffff0cdc>
80008c24:	00100513          	li	a0,1
80008c28:	00812423          	sw	s0,8(sp)
80008c2c:	00112623          	sw	ra,12(sp)
80008c30:	afdfd0ef          	jal	ra,8000672c <memp_malloc_fn>
80008c34:	00050413          	mv	s0,a0
80008c38:	00050c63          	beqz	a0,80008c50 <udp_new+0x3c>
80008c3c:	02400613          	li	a2,36
80008c40:	00000593          	li	a1,0
80008c44:	038040ef          	jal	ra,8000cc7c <memset>
80008c48:	fff00793          	li	a5,-1
80008c4c:	00f405a3          	sb	a5,11(s0)
80008c50:	00040513          	mv	a0,s0
80008c54:	00c12083          	lw	ra,12(sp)
80008c58:	00812403          	lw	s0,8(sp)
80008c5c:	01010113          	addi	sp,sp,16
80008c60:	00008067          	ret

80008c64 <udp_new_ip_type>:
80008c64:	fb1ff06f          	j	80008c14 <udp_new>

80008c68 <udp_netif_ip_addr_changed>:
80008c68:	02050063          	beqz	a0,80008c88 <udp_netif_ip_addr_changed+0x20>
80008c6c:	00052783          	lw	a5,0(a0)
80008c70:	00078c63          	beqz	a5,80008c88 <udp_netif_ip_addr_changed+0x20>
80008c74:	00058a63          	beqz	a1,80008c88 <udp_netif_ip_addr_changed+0x20>
80008c78:	0005a783          	lw	a5,0(a1)
80008c7c:	00078663          	beqz	a5,80008c88 <udp_netif_ip_addr_changed+0x20>
80008c80:	8dc1a783          	lw	a5,-1828(gp) # 8000311c <udp_pcbs>
80008c84:	00079463          	bnez	a5,80008c8c <udp_netif_ip_addr_changed+0x24>
80008c88:	00008067          	ret
80008c8c:	0007a683          	lw	a3,0(a5)
80008c90:	00052703          	lw	a4,0(a0)
80008c94:	00e69663          	bne	a3,a4,80008ca0 <udp_netif_ip_addr_changed+0x38>
80008c98:	0005a703          	lw	a4,0(a1)
80008c9c:	00e7a023          	sw	a4,0(a5)
80008ca0:	0107a783          	lw	a5,16(a5)
80008ca4:	fe1ff06f          	j	80008c84 <udp_netif_ip_addr_changed+0x1c>

80008ca8 <dhcp_set_state>:
80008ca8:	00554783          	lbu	a5,5(a0)
80008cac:	00b78863          	beq	a5,a1,80008cbc <dhcp_set_state+0x14>
80008cb0:	00b502a3          	sb	a1,5(a0)
80008cb4:	00050323          	sb	zero,6(a0)
80008cb8:	00051423          	sh	zero,8(a0)
80008cbc:	00008067          	ret

80008cc0 <dhcp_option_short>:
80008cc0:	00a587b3          	add	a5,a1,a0
80008cc4:	00865713          	srli	a4,a2,0x8
80008cc8:	00e78023          	sb	a4,0(a5)
80008ccc:	00150793          	addi	a5,a0,1
80008cd0:	01079793          	slli	a5,a5,0x10
80008cd4:	0107d793          	srli	a5,a5,0x10
80008cd8:	00250513          	addi	a0,a0,2
80008cdc:	00f585b3          	add	a1,a1,a5
80008ce0:	01051513          	slli	a0,a0,0x10
80008ce4:	00c58023          	sb	a2,0(a1)
80008ce8:	01055513          	srli	a0,a0,0x10
80008cec:	00008067          	ret

80008cf0 <dhcp_option_long>:
80008cf0:	00a587b3          	add	a5,a1,a0
80008cf4:	01865713          	srli	a4,a2,0x18
80008cf8:	00e78023          	sb	a4,0(a5)
80008cfc:	00150793          	addi	a5,a0,1
80008d00:	01079793          	slli	a5,a5,0x10
80008d04:	0107d793          	srli	a5,a5,0x10
80008d08:	00f587b3          	add	a5,a1,a5
80008d0c:	01065713          	srli	a4,a2,0x10
80008d10:	00e78023          	sb	a4,0(a5)
80008d14:	00250793          	addi	a5,a0,2
80008d18:	01079793          	slli	a5,a5,0x10
80008d1c:	0107d793          	srli	a5,a5,0x10
80008d20:	00f587b3          	add	a5,a1,a5
80008d24:	00865713          	srli	a4,a2,0x8
80008d28:	00e78023          	sb	a4,0(a5)
80008d2c:	00350793          	addi	a5,a0,3
80008d30:	01079793          	slli	a5,a5,0x10
80008d34:	0107d793          	srli	a5,a5,0x10
80008d38:	00450513          	addi	a0,a0,4
80008d3c:	00f585b3          	add	a1,a1,a5
80008d40:	01051513          	slli	a0,a0,0x10
80008d44:	00c58023          	sb	a2,0(a1)
80008d48:	01055513          	srli	a0,a0,0x10
80008d4c:	00008067          	ret

80008d50 <dhcp_create_msg>:
80008d50:	fe010113          	addi	sp,sp,-32
80008d54:	00112e23          	sw	ra,28(sp)
80008d58:	00812c23          	sw	s0,24(sp)
80008d5c:	00912a23          	sw	s1,20(sp)
80008d60:	01212823          	sw	s2,16(sp)
80008d64:	01312623          	sw	s3,12(sp)
80008d68:	01412423          	sw	s4,8(sp)
80008d6c:	01512223          	sw	s5,4(sp)
80008d70:	01612023          	sw	s6,0(sp)
80008d74:	02051a63          	bnez	a0,80008da8 <dhcp_create_msg+0x58>
80008d78:	00000a93          	li	s5,0
80008d7c:	01c12083          	lw	ra,28(sp)
80008d80:	01812403          	lw	s0,24(sp)
80008d84:	000a8513          	mv	a0,s5
80008d88:	01412483          	lw	s1,20(sp)
80008d8c:	01012903          	lw	s2,16(sp)
80008d90:	00c12983          	lw	s3,12(sp)
80008d94:	00812a03          	lw	s4,8(sp)
80008d98:	00412a83          	lw	s5,4(sp)
80008d9c:	00012b03          	lw	s6,0(sp)
80008da0:	02010113          	addi	sp,sp,32
80008da4:	00008067          	ret
80008da8:	fc0588e3          	beqz	a1,80008d78 <dhcp_create_msg+0x28>
80008dac:	00060913          	mv	s2,a2
80008db0:	00058993          	mv	s3,a1
80008db4:	00050493          	mv	s1,a0
80008db8:	28000613          	li	a2,640
80008dbc:	13400593          	li	a1,308
80008dc0:	03800513          	li	a0,56
80008dc4:	00068a13          	mv	s4,a3
80008dc8:	b24fe0ef          	jal	ra,800070ec <pbuf_alloc>
80008dcc:	00050a93          	mv	s5,a0
80008dd0:	fa0504e3          	beqz	a0,80008d78 <dhcp_create_msg+0x28>
80008dd4:	00300793          	li	a5,3
80008dd8:	00f91663          	bne	s2,a5,80008de4 <dhcp_create_msg+0x94>
80008ddc:	0059c783          	lbu	a5,5(s3)
80008de0:	03279063          	bne	a5,s2,80008e00 <dhcp_create_msg+0xb0>
80008de4:	0069c703          	lbu	a4,6(s3)
80008de8:	00071863          	bnez	a4,80008df8 <dhcp_create_msg+0xa8>
80008dec:	8081a703          	lw	a4,-2040(gp) # 80003048 <xid.4812>
80008df0:	00170713          	addi	a4,a4,1
80008df4:	80e1a423          	sw	a4,-2040(gp) # 80003048 <xid.4812>
80008df8:	8081a783          	lw	a5,-2040(gp) # 80003048 <xid.4812>
80008dfc:	00f9a023          	sw	a5,0(s3)
80008e00:	004aa403          	lw	s0,4(s5)
80008e04:	13400613          	li	a2,308
80008e08:	00000593          	li	a1,0
80008e0c:	00100b13          	li	s6,1
80008e10:	00040513          	mv	a0,s0
80008e14:	669030ef          	jal	ra,8000cc7c <memset>
80008e18:	01640023          	sb	s6,0(s0)
80008e1c:	016400a3          	sb	s6,1(s0)
80008e20:	0344c783          	lbu	a5,52(s1)
80008e24:	00f40123          	sb	a5,2(s0)
80008e28:	0009a503          	lw	a0,0(s3)
80008e2c:	fe1fc0ef          	jal	ra,80005e0c <lwip_htonl>
80008e30:	00855793          	srli	a5,a0,0x8
80008e34:	00a40223          	sb	a0,4(s0)
80008e38:	00f402a3          	sb	a5,5(s0)
80008e3c:	01055793          	srli	a5,a0,0x10
80008e40:	01855513          	srli	a0,a0,0x18
80008e44:	00f40323          	sb	a5,6(s0)
80008e48:	00a403a3          	sb	a0,7(s0)
80008e4c:	00400793          	li	a5,4
80008e50:	02f90463          	beq	s2,a5,80008e78 <dhcp_create_msg+0x128>
80008e54:	ff990793          	addi	a5,s2,-7
80008e58:	0ff7f793          	andi	a5,a5,255
80008e5c:	00fb7e63          	bgeu	s6,a5,80008e78 <dhcp_create_msg+0x128>
80008e60:	00300793          	li	a5,3
80008e64:	02f91a63          	bne	s2,a5,80008e98 <dhcp_create_msg+0x148>
80008e68:	0059c783          	lbu	a5,5(s3)
80008e6c:	ffc78793          	addi	a5,a5,-4
80008e70:	0ff7f793          	andi	a5,a5,255
80008e74:	02fb6263          	bltu	s6,a5,80008e98 <dhcp_create_msg+0x148>
80008e78:	0044a783          	lw	a5,4(s1)
80008e7c:	0087d713          	srli	a4,a5,0x8
80008e80:	00f40623          	sb	a5,12(s0)
80008e84:	00e406a3          	sb	a4,13(s0)
80008e88:	0107d713          	srli	a4,a5,0x10
80008e8c:	0187d793          	srli	a5,a5,0x18
80008e90:	00e40723          	sb	a4,14(s0)
80008e94:	00f407a3          	sb	a5,15(s0)
80008e98:	02e48793          	addi	a5,s1,46
80008e9c:	01c40713          	addi	a4,s0,28
80008ea0:	03448493          	addi	s1,s1,52
80008ea4:	0007c683          	lbu	a3,0(a5)
80008ea8:	00178793          	addi	a5,a5,1
80008eac:	00170713          	addi	a4,a4,1
80008eb0:	fed70fa3          	sb	a3,-1(a4)
80008eb4:	fe9798e3          	bne	a5,s1,80008ea4 <dhcp_create_msg+0x154>
80008eb8:	06300793          	li	a5,99
80008ebc:	0ef40623          	sb	a5,236(s0)
80008ec0:	f8200713          	li	a4,-126
80008ec4:	0ef407a3          	sb	a5,239(s0)
80008ec8:	03500793          	li	a5,53
80008ecc:	0ee406a3          	sb	a4,237(s0)
80008ed0:	0ef40823          	sb	a5,240(s0)
80008ed4:	05300713          	li	a4,83
80008ed8:	00100793          	li	a5,1
80008edc:	0ef408a3          	sb	a5,241(s0)
80008ee0:	0ee40723          	sb	a4,238(s0)
80008ee4:	0f240923          	sb	s2,242(s0)
80008ee8:	00300793          	li	a5,3
80008eec:	00fa1023          	sh	a5,0(s4)
80008ef0:	e8dff06f          	j	80008d7c <dhcp_create_msg+0x2c>

80008ef4 <dhcp_option_trailer>:
80008ef4:	00150793          	addi	a5,a0,1
80008ef8:	01079793          	slli	a5,a5,0x10
80008efc:	00a58733          	add	a4,a1,a0
80008f00:	0107d793          	srli	a5,a5,0x10
80008f04:	fff00693          	li	a3,-1
80008f08:	00d70023          	sb	a3,0(a4)
80008f0c:	00f585b3          	add	a1,a1,a5
80008f10:	04300713          	li	a4,67
80008f14:	00f77c63          	bgeu	a4,a5,80008f2c <dhcp_option_trailer+0x38>
80008f18:	0f078593          	addi	a1,a5,240
80008f1c:	01059593          	slli	a1,a1,0x10
80008f20:	0105d593          	srli	a1,a1,0x10
80008f24:	00060513          	mv	a0,a2
80008f28:	b94fe06f          	j	800072bc <pbuf_realloc>
80008f2c:	00178793          	addi	a5,a5,1
80008f30:	01079793          	slli	a5,a5,0x10
80008f34:	00058023          	sb	zero,0(a1)
80008f38:	0107d793          	srli	a5,a5,0x10
80008f3c:	00158593          	addi	a1,a1,1
80008f40:	fd5ff06f          	j	80008f14 <dhcp_option_trailer+0x20>

80008f44 <dhcp_reboot>:
80008f44:	fd010113          	addi	sp,sp,-48
80008f48:	02112623          	sw	ra,44(sp)
80008f4c:	02812423          	sw	s0,40(sp)
80008f50:	03212023          	sw	s2,32(sp)
80008f54:	02912223          	sw	s1,36(sp)
80008f58:	01312e23          	sw	s3,28(sp)
80008f5c:	01412c23          	sw	s4,24(sp)
80008f60:	02852483          	lw	s1,40(a0)
80008f64:	00050913          	mv	s2,a0
80008f68:	00300593          	li	a1,3
80008f6c:	00048513          	mv	a0,s1
80008f70:	d39ff0ef          	jal	ra,80008ca8 <dhcp_set_state>
80008f74:	00e10693          	addi	a3,sp,14
80008f78:	00300613          	li	a2,3
80008f7c:	00048593          	mv	a1,s1
80008f80:	00090513          	mv	a0,s2
80008f84:	dcdff0ef          	jal	ra,80008d50 <dhcp_create_msg>
80008f88:	fff00413          	li	s0,-1
80008f8c:	14050663          	beqz	a0,800090d8 <dhcp_reboot+0x194>
80008f90:	00452403          	lw	s0,4(a0)
80008f94:	00e15783          	lhu	a5,14(sp)
80008f98:	00050993          	mv	s3,a0
80008f9c:	0f040413          	addi	s0,s0,240
80008fa0:	00f40733          	add	a4,s0,a5
80008fa4:	00278513          	addi	a0,a5,2
80008fa8:	00178793          	addi	a5,a5,1
80008fac:	01079793          	slli	a5,a5,0x10
80008fb0:	03900693          	li	a3,57
80008fb4:	0107d793          	srli	a5,a5,0x10
80008fb8:	00d70023          	sb	a3,0(a4)
80008fbc:	00f407b3          	add	a5,s0,a5
80008fc0:	00200713          	li	a4,2
80008fc4:	01051513          	slli	a0,a0,0x10
80008fc8:	00e78023          	sb	a4,0(a5)
80008fcc:	00040593          	mv	a1,s0
80008fd0:	24000613          	li	a2,576
80008fd4:	01055513          	srli	a0,a0,0x10
80008fd8:	00a11723          	sh	a0,14(sp)
80008fdc:	ce5ff0ef          	jal	ra,80008cc0 <dhcp_option_short>
80008fe0:	00a407b3          	add	a5,s0,a0
80008fe4:	00250a13          	addi	s4,a0,2
80008fe8:	00150513          	addi	a0,a0,1
80008fec:	01051513          	slli	a0,a0,0x10
80008ff0:	03200713          	li	a4,50
80008ff4:	01055513          	srli	a0,a0,0x10
80008ff8:	00e78023          	sb	a4,0(a5)
80008ffc:	00a40533          	add	a0,s0,a0
80009000:	00400793          	li	a5,4
80009004:	00f50023          	sb	a5,0(a0)
80009008:	01c4a503          	lw	a0,28(s1)
8000900c:	010a1a13          	slli	s4,s4,0x10
80009010:	010a5a13          	srli	s4,s4,0x10
80009014:	01411723          	sh	s4,14(sp)
80009018:	df5fc0ef          	jal	ra,80005e0c <lwip_htonl>
8000901c:	00050613          	mv	a2,a0
80009020:	00040593          	mv	a1,s0
80009024:	000a0513          	mv	a0,s4
80009028:	cc9ff0ef          	jal	ra,80008cf0 <dhcp_option_long>
8000902c:	00a40733          	add	a4,s0,a0
80009030:	03700693          	li	a3,55
80009034:	00d70023          	sb	a3,0(a4)
80009038:	00150713          	addi	a4,a0,1
8000903c:	01071713          	slli	a4,a4,0x10
80009040:	01075713          	srli	a4,a4,0x10
80009044:	00300693          	li	a3,3
80009048:	00e40733          	add	a4,s0,a4
8000904c:	00d70023          	sb	a3,0(a4)
80009050:	00250713          	addi	a4,a0,2
80009054:	01071713          	slli	a4,a4,0x10
80009058:	01075713          	srli	a4,a4,0x10
8000905c:	00e40733          	add	a4,s0,a4
80009060:	00100613          	li	a2,1
80009064:	00c70023          	sb	a2,0(a4)
80009068:	00050793          	mv	a5,a0
8000906c:	00350713          	addi	a4,a0,3
80009070:	01071713          	slli	a4,a4,0x10
80009074:	00478793          	addi	a5,a5,4
80009078:	01075713          	srli	a4,a4,0x10
8000907c:	01079793          	slli	a5,a5,0x10
80009080:	00e40733          	add	a4,s0,a4
80009084:	00550513          	addi	a0,a0,5
80009088:	0107d793          	srli	a5,a5,0x10
8000908c:	00d70023          	sb	a3,0(a4)
80009090:	00f407b3          	add	a5,s0,a5
80009094:	01c00713          	li	a4,28
80009098:	01051513          	slli	a0,a0,0x10
8000909c:	00e78023          	sb	a4,0(a5)
800090a0:	01055513          	srli	a0,a0,0x10
800090a4:	00040593          	mv	a1,s0
800090a8:	00098613          	mv	a2,s3
800090ac:	00a11723          	sh	a0,14(sp)
800090b0:	e45ff0ef          	jal	ra,80008ef4 <dhcp_option_trailer>
800090b4:	8e41a503          	lw	a0,-1820(gp) # 80003124 <dhcp_pcb>
800090b8:	00090713          	mv	a4,s2
800090bc:	04300693          	li	a3,67
800090c0:	84418613          	addi	a2,gp,-1980 # 80003084 <ip_addr_broadcast>
800090c4:	00098593          	mv	a1,s3
800090c8:	8f1ff0ef          	jal	ra,800089b8 <udp_sendto_if>
800090cc:	00050413          	mv	s0,a0
800090d0:	00098513          	mv	a0,s3
800090d4:	f45fd0ef          	jal	ra,80007018 <pbuf_free>
800090d8:	0064c783          	lbu	a5,6(s1)
800090dc:	0ff00713          	li	a4,255
800090e0:	00e78663          	beq	a5,a4,800090ec <dhcp_reboot+0x1a8>
800090e4:	00178793          	addi	a5,a5,1
800090e8:	00f48323          	sb	a5,6(s1)
800090ec:	0064c503          	lbu	a0,6(s1)
800090f0:	00900793          	li	a5,9
800090f4:	04a7ea63          	bltu	a5,a0,80009148 <dhcp_reboot+0x204>
800090f8:	00551793          	slli	a5,a0,0x5
800090fc:	40a787b3          	sub	a5,a5,a0
80009100:	00279793          	slli	a5,a5,0x2
80009104:	00f50533          	add	a0,a0,a5
80009108:	00351513          	slli	a0,a0,0x3
8000910c:	01051513          	slli	a0,a0,0x10
80009110:	01055513          	srli	a0,a0,0x10
80009114:	1f400593          	li	a1,500
80009118:	1f350513          	addi	a0,a0,499
8000911c:	268040ef          	jal	ra,8000d384 <__divsi3>
80009120:	00a49423          	sh	a0,8(s1)
80009124:	02c12083          	lw	ra,44(sp)
80009128:	00040513          	mv	a0,s0
8000912c:	02812403          	lw	s0,40(sp)
80009130:	02412483          	lw	s1,36(sp)
80009134:	02012903          	lw	s2,32(sp)
80009138:	01c12983          	lw	s3,28(sp)
8000913c:	01812a03          	lw	s4,24(sp)
80009140:	03010113          	addi	sp,sp,48
80009144:	00008067          	ret
80009148:	00002537          	lui	a0,0x2
8000914c:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
80009150:	fc5ff06f          	j	80009114 <dhcp_reboot+0x1d0>

80009154 <dhcp_select>:
80009154:	fd010113          	addi	sp,sp,-48
80009158:	02812423          	sw	s0,40(sp)
8000915c:	02112623          	sw	ra,44(sp)
80009160:	02912223          	sw	s1,36(sp)
80009164:	03212023          	sw	s2,32(sp)
80009168:	01312e23          	sw	s3,28(sp)
8000916c:	01412c23          	sw	s4,24(sp)
80009170:	01512a23          	sw	s5,20(sp)
80009174:	ff000413          	li	s0,-16
80009178:	22050263          	beqz	a0,8000939c <dhcp_select+0x248>
8000917c:	02852483          	lw	s1,40(a0)
80009180:	ffa00413          	li	s0,-6
80009184:	20048c63          	beqz	s1,8000939c <dhcp_select+0x248>
80009188:	00050913          	mv	s2,a0
8000918c:	00100593          	li	a1,1
80009190:	00048513          	mv	a0,s1
80009194:	b15ff0ef          	jal	ra,80008ca8 <dhcp_set_state>
80009198:	00e10693          	addi	a3,sp,14
8000919c:	00300613          	li	a2,3
800091a0:	00048593          	mv	a1,s1
800091a4:	00090513          	mv	a0,s2
800091a8:	ba9ff0ef          	jal	ra,80008d50 <dhcp_create_msg>
800091ac:	00050993          	mv	s3,a0
800091b0:	fff00413          	li	s0,-1
800091b4:	18050a63          	beqz	a0,80009348 <dhcp_select+0x1f4>
800091b8:	00452403          	lw	s0,4(a0)
800091bc:	00e15783          	lhu	a5,14(sp)
800091c0:	03900693          	li	a3,57
800091c4:	0f040413          	addi	s0,s0,240
800091c8:	00f40733          	add	a4,s0,a5
800091cc:	00278513          	addi	a0,a5,2
800091d0:	00178793          	addi	a5,a5,1
800091d4:	01079793          	slli	a5,a5,0x10
800091d8:	0107d793          	srli	a5,a5,0x10
800091dc:	00d70023          	sb	a3,0(a4)
800091e0:	00f407b3          	add	a5,s0,a5
800091e4:	00200713          	li	a4,2
800091e8:	00e78023          	sb	a4,0(a5)
800091ec:	02c95603          	lhu	a2,44(s2)
800091f0:	01051513          	slli	a0,a0,0x10
800091f4:	00040593          	mv	a1,s0
800091f8:	01055513          	srli	a0,a0,0x10
800091fc:	00a11723          	sh	a0,14(sp)
80009200:	ac1ff0ef          	jal	ra,80008cc0 <dhcp_option_short>
80009204:	00a407b3          	add	a5,s0,a0
80009208:	03200713          	li	a4,50
8000920c:	00e78023          	sb	a4,0(a5)
80009210:	00150793          	addi	a5,a0,1
80009214:	01079793          	slli	a5,a5,0x10
80009218:	0107d793          	srli	a5,a5,0x10
8000921c:	00f407b3          	add	a5,s0,a5
80009220:	00400a93          	li	s5,4
80009224:	01578023          	sb	s5,0(a5)
80009228:	00250a13          	addi	s4,a0,2
8000922c:	01c4a503          	lw	a0,28(s1)
80009230:	010a1a13          	slli	s4,s4,0x10
80009234:	010a5a13          	srli	s4,s4,0x10
80009238:	01411723          	sh	s4,14(sp)
8000923c:	bd1fc0ef          	jal	ra,80005e0c <lwip_htonl>
80009240:	00050613          	mv	a2,a0
80009244:	00040593          	mv	a1,s0
80009248:	000a0513          	mv	a0,s4
8000924c:	aa5ff0ef          	jal	ra,80008cf0 <dhcp_option_long>
80009250:	00a407b3          	add	a5,s0,a0
80009254:	03600713          	li	a4,54
80009258:	00e78023          	sb	a4,0(a5)
8000925c:	00150793          	addi	a5,a0,1
80009260:	01079793          	slli	a5,a5,0x10
80009264:	0107d793          	srli	a5,a5,0x10
80009268:	00f407b3          	add	a5,s0,a5
8000926c:	01578023          	sb	s5,0(a5)
80009270:	00250a13          	addi	s4,a0,2
80009274:	0184a503          	lw	a0,24(s1)
80009278:	010a1a13          	slli	s4,s4,0x10
8000927c:	010a5a13          	srli	s4,s4,0x10
80009280:	01411723          	sh	s4,14(sp)
80009284:	b89fc0ef          	jal	ra,80005e0c <lwip_htonl>
80009288:	00050613          	mv	a2,a0
8000928c:	00040593          	mv	a1,s0
80009290:	000a0513          	mv	a0,s4
80009294:	a5dff0ef          	jal	ra,80008cf0 <dhcp_option_long>
80009298:	00a40733          	add	a4,s0,a0
8000929c:	03700693          	li	a3,55
800092a0:	00d70023          	sb	a3,0(a4)
800092a4:	00150713          	addi	a4,a0,1
800092a8:	01071713          	slli	a4,a4,0x10
800092ac:	01075713          	srli	a4,a4,0x10
800092b0:	00300693          	li	a3,3
800092b4:	00e40733          	add	a4,s0,a4
800092b8:	00d70023          	sb	a3,0(a4)
800092bc:	00250713          	addi	a4,a0,2
800092c0:	01071713          	slli	a4,a4,0x10
800092c4:	01075713          	srli	a4,a4,0x10
800092c8:	00e40733          	add	a4,s0,a4
800092cc:	00100613          	li	a2,1
800092d0:	00c70023          	sb	a2,0(a4)
800092d4:	00050793          	mv	a5,a0
800092d8:	00350713          	addi	a4,a0,3
800092dc:	01071713          	slli	a4,a4,0x10
800092e0:	00478793          	addi	a5,a5,4
800092e4:	01075713          	srli	a4,a4,0x10
800092e8:	01079793          	slli	a5,a5,0x10
800092ec:	00e40733          	add	a4,s0,a4
800092f0:	00550513          	addi	a0,a0,5
800092f4:	0107d793          	srli	a5,a5,0x10
800092f8:	00d70023          	sb	a3,0(a4)
800092fc:	00f407b3          	add	a5,s0,a5
80009300:	01c00713          	li	a4,28
80009304:	01051513          	slli	a0,a0,0x10
80009308:	00e78023          	sb	a4,0(a5)
8000930c:	01055513          	srli	a0,a0,0x10
80009310:	00040593          	mv	a1,s0
80009314:	00098613          	mv	a2,s3
80009318:	00a11723          	sh	a0,14(sp)
8000931c:	bd9ff0ef          	jal	ra,80008ef4 <dhcp_option_trailer>
80009320:	8e41a503          	lw	a0,-1820(gp) # 80003124 <dhcp_pcb>
80009324:	84818793          	addi	a5,gp,-1976 # 80003088 <ip_addr_any>
80009328:	00090713          	mv	a4,s2
8000932c:	04300693          	li	a3,67
80009330:	84418613          	addi	a2,gp,-1980 # 80003084 <ip_addr_broadcast>
80009334:	00098593          	mv	a1,s3
80009338:	c8cff0ef          	jal	ra,800087c4 <udp_sendto_if_src>
8000933c:	00050413          	mv	s0,a0
80009340:	00098513          	mv	a0,s3
80009344:	cd5fd0ef          	jal	ra,80007018 <pbuf_free>
80009348:	0064c783          	lbu	a5,6(s1)
8000934c:	0ff00713          	li	a4,255
80009350:	00e78663          	beq	a5,a4,8000935c <dhcp_select+0x208>
80009354:	00178793          	addi	a5,a5,1
80009358:	00f48323          	sb	a5,6(s1)
8000935c:	0064c783          	lbu	a5,6(s1)
80009360:	00500713          	li	a4,5
80009364:	06f76063          	bltu	a4,a5,800093c4 <dhcp_select+0x270>
80009368:	00100513          	li	a0,1
8000936c:	00f51533          	sll	a0,a0,a5
80009370:	00551793          	slli	a5,a0,0x5
80009374:	40a787b3          	sub	a5,a5,a0
80009378:	00279793          	slli	a5,a5,0x2
8000937c:	00f50533          	add	a0,a0,a5
80009380:	00351513          	slli	a0,a0,0x3
80009384:	01051513          	slli	a0,a0,0x10
80009388:	01055513          	srli	a0,a0,0x10
8000938c:	1f400593          	li	a1,500
80009390:	1f350513          	addi	a0,a0,499
80009394:	7f1030ef          	jal	ra,8000d384 <__divsi3>
80009398:	00a49423          	sh	a0,8(s1)
8000939c:	00040513          	mv	a0,s0
800093a0:	02c12083          	lw	ra,44(sp)
800093a4:	02812403          	lw	s0,40(sp)
800093a8:	02412483          	lw	s1,36(sp)
800093ac:	02012903          	lw	s2,32(sp)
800093b0:	01c12983          	lw	s3,28(sp)
800093b4:	01812a03          	lw	s4,24(sp)
800093b8:	01412a83          	lw	s5,20(sp)
800093bc:	03010113          	addi	sp,sp,48
800093c0:	00008067          	ret
800093c4:	0000f537          	lui	a0,0xf
800093c8:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
800093cc:	fc1ff06f          	j	8000938c <dhcp_select+0x238>

800093d0 <dhcp_discover>:
800093d0:	fd010113          	addi	sp,sp,-48
800093d4:	01312e23          	sw	s3,28(sp)
800093d8:	02112623          	sw	ra,44(sp)
800093dc:	02812423          	sw	s0,40(sp)
800093e0:	02912223          	sw	s1,36(sp)
800093e4:	03212023          	sw	s2,32(sp)
800093e8:	02852483          	lw	s1,40(a0)
800093ec:	00050993          	mv	s3,a0
800093f0:	00600593          	li	a1,6
800093f4:	00048513          	mv	a0,s1
800093f8:	0004ae23          	sw	zero,28(s1)
800093fc:	8adff0ef          	jal	ra,80008ca8 <dhcp_set_state>
80009400:	00e10693          	addi	a3,sp,14
80009404:	00100613          	li	a2,1
80009408:	00048593          	mv	a1,s1
8000940c:	00098513          	mv	a0,s3
80009410:	941ff0ef          	jal	ra,80008d50 <dhcp_create_msg>
80009414:	10050063          	beqz	a0,80009514 <dhcp_discover+0x144>
80009418:	00452403          	lw	s0,4(a0)
8000941c:	00e15783          	lhu	a5,14(sp)
80009420:	00050913          	mv	s2,a0
80009424:	0f040413          	addi	s0,s0,240
80009428:	00f40733          	add	a4,s0,a5
8000942c:	00278513          	addi	a0,a5,2
80009430:	00178793          	addi	a5,a5,1
80009434:	01079793          	slli	a5,a5,0x10
80009438:	03900693          	li	a3,57
8000943c:	0107d793          	srli	a5,a5,0x10
80009440:	00d70023          	sb	a3,0(a4)
80009444:	00f407b3          	add	a5,s0,a5
80009448:	00200713          	li	a4,2
8000944c:	00e78023          	sb	a4,0(a5)
80009450:	02c9d603          	lhu	a2,44(s3)
80009454:	01051513          	slli	a0,a0,0x10
80009458:	01055513          	srli	a0,a0,0x10
8000945c:	00040593          	mv	a1,s0
80009460:	00a11723          	sh	a0,14(sp)
80009464:	85dff0ef          	jal	ra,80008cc0 <dhcp_option_short>
80009468:	00a40733          	add	a4,s0,a0
8000946c:	03700693          	li	a3,55
80009470:	00d70023          	sb	a3,0(a4)
80009474:	00150713          	addi	a4,a0,1
80009478:	01071713          	slli	a4,a4,0x10
8000947c:	01075713          	srli	a4,a4,0x10
80009480:	00300613          	li	a2,3
80009484:	00e40733          	add	a4,s0,a4
80009488:	00c70023          	sb	a2,0(a4)
8000948c:	00250713          	addi	a4,a0,2
80009490:	01071713          	slli	a4,a4,0x10
80009494:	01075713          	srli	a4,a4,0x10
80009498:	00e40733          	add	a4,s0,a4
8000949c:	00100693          	li	a3,1
800094a0:	00d70023          	sb	a3,0(a4)
800094a4:	00050793          	mv	a5,a0
800094a8:	00350693          	addi	a3,a0,3
800094ac:	01069693          	slli	a3,a3,0x10
800094b0:	00478793          	addi	a5,a5,4
800094b4:	0106d693          	srli	a3,a3,0x10
800094b8:	01079793          	slli	a5,a5,0x10
800094bc:	00d406b3          	add	a3,s0,a3
800094c0:	00550513          	addi	a0,a0,5
800094c4:	0107d793          	srli	a5,a5,0x10
800094c8:	00c68023          	sb	a2,0(a3)
800094cc:	00f407b3          	add	a5,s0,a5
800094d0:	01c00713          	li	a4,28
800094d4:	01051513          	slli	a0,a0,0x10
800094d8:	00e78023          	sb	a4,0(a5)
800094dc:	01055513          	srli	a0,a0,0x10
800094e0:	00090613          	mv	a2,s2
800094e4:	00040593          	mv	a1,s0
800094e8:	00a11723          	sh	a0,14(sp)
800094ec:	a09ff0ef          	jal	ra,80008ef4 <dhcp_option_trailer>
800094f0:	8e41a503          	lw	a0,-1820(gp) # 80003124 <dhcp_pcb>
800094f4:	84818793          	addi	a5,gp,-1976 # 80003088 <ip_addr_any>
800094f8:	00098713          	mv	a4,s3
800094fc:	04300693          	li	a3,67
80009500:	84418613          	addi	a2,gp,-1980 # 80003084 <ip_addr_broadcast>
80009504:	00090593          	mv	a1,s2
80009508:	abcff0ef          	jal	ra,800087c4 <udp_sendto_if_src>
8000950c:	00090513          	mv	a0,s2
80009510:	b09fd0ef          	jal	ra,80007018 <pbuf_free>
80009514:	0064c783          	lbu	a5,6(s1)
80009518:	0ff00713          	li	a4,255
8000951c:	00e78663          	beq	a5,a4,80009528 <dhcp_discover+0x158>
80009520:	00178793          	addi	a5,a5,1
80009524:	00f48323          	sb	a5,6(s1)
80009528:	0064c783          	lbu	a5,6(s1)
8000952c:	00500713          	li	a4,5
80009530:	04f76c63          	bltu	a4,a5,80009588 <dhcp_discover+0x1b8>
80009534:	00100513          	li	a0,1
80009538:	00f51533          	sll	a0,a0,a5
8000953c:	00551793          	slli	a5,a0,0x5
80009540:	40a787b3          	sub	a5,a5,a0
80009544:	00279793          	slli	a5,a5,0x2
80009548:	00f50533          	add	a0,a0,a5
8000954c:	00351513          	slli	a0,a0,0x3
80009550:	01051513          	slli	a0,a0,0x10
80009554:	01055513          	srli	a0,a0,0x10
80009558:	1f400593          	li	a1,500
8000955c:	1f350513          	addi	a0,a0,499
80009560:	625030ef          	jal	ra,8000d384 <__divsi3>
80009564:	00a49423          	sh	a0,8(s1)
80009568:	02c12083          	lw	ra,44(sp)
8000956c:	02812403          	lw	s0,40(sp)
80009570:	02412483          	lw	s1,36(sp)
80009574:	02012903          	lw	s2,32(sp)
80009578:	01c12983          	lw	s3,28(sp)
8000957c:	00000513          	li	a0,0
80009580:	03010113          	addi	sp,sp,48
80009584:	00008067          	ret
80009588:	0000f537          	lui	a0,0xf
8000958c:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
80009590:	fc9ff06f          	j	80009558 <dhcp_discover+0x188>

80009594 <dhcp_check>:
80009594:	ff010113          	addi	sp,sp,-16
80009598:	00112623          	sw	ra,12(sp)
8000959c:	00912223          	sw	s1,4(sp)
800095a0:	00812423          	sw	s0,8(sp)
800095a4:	02852403          	lw	s0,40(a0)
800095a8:	00050493          	mv	s1,a0
800095ac:	00800593          	li	a1,8
800095b0:	00040513          	mv	a0,s0
800095b4:	ef4ff0ef          	jal	ra,80008ca8 <dhcp_set_state>
800095b8:	00000613          	li	a2,0
800095bc:	01c40593          	addi	a1,s0,28
800095c0:	00048513          	mv	a0,s1
800095c4:	4b5010ef          	jal	ra,8000b278 <etharp_query>
800095c8:	00644783          	lbu	a5,6(s0)
800095cc:	0ff00713          	li	a4,255
800095d0:	00e78663          	beq	a5,a4,800095dc <dhcp_check+0x48>
800095d4:	00178793          	addi	a5,a5,1
800095d8:	00f40323          	sb	a5,6(s0)
800095dc:	00100793          	li	a5,1
800095e0:	00f41423          	sh	a5,8(s0)
800095e4:	00c12083          	lw	ra,12(sp)
800095e8:	00812403          	lw	s0,8(sp)
800095ec:	00412483          	lw	s1,4(sp)
800095f0:	01010113          	addi	sp,sp,16
800095f4:	00008067          	ret

800095f8 <dhcp_bind>:
800095f8:	1a050863          	beqz	a0,800097a8 <dhcp_bind+0x1b0>
800095fc:	fe010113          	addi	sp,sp,-32
80009600:	00112e23          	sw	ra,28(sp)
80009604:	00812c23          	sw	s0,24(sp)
80009608:	00912a23          	sw	s1,20(sp)
8000960c:	02852403          	lw	s0,40(a0)
80009610:	10040a63          	beqz	s0,80009724 <dhcp_bind+0x12c>
80009614:	00050493          	mv	s1,a0
80009618:	02842503          	lw	a0,40(s0)
8000961c:	00041923          	sh	zero,18(s0)
80009620:	fff00793          	li	a5,-1
80009624:	02f50463          	beq	a0,a5,8000964c <dhcp_bind+0x54>
80009628:	01e50513          	addi	a0,a0,30
8000962c:	003c07b7          	lui	a5,0x3c0
80009630:	10f57463          	bgeu	a0,a5,80009738 <dhcp_bind+0x140>
80009634:	03c00593          	li	a1,60
80009638:	555030ef          	jal	ra,8000d38c <__udivsi3>
8000963c:	01051793          	slli	a5,a0,0x10
80009640:	0107d793          	srli	a5,a5,0x10
80009644:	10050063          	beqz	a0,80009744 <dhcp_bind+0x14c>
80009648:	00f41a23          	sh	a5,20(s0)
8000964c:	02c42503          	lw	a0,44(s0)
80009650:	fff00793          	li	a5,-1
80009654:	02f50863          	beq	a0,a5,80009684 <dhcp_bind+0x8c>
80009658:	01e50513          	addi	a0,a0,30
8000965c:	003c07b7          	lui	a5,0x3c0
80009660:	0ef57663          	bgeu	a0,a5,8000974c <dhcp_bind+0x154>
80009664:	03c00593          	li	a1,60
80009668:	525030ef          	jal	ra,8000d38c <__udivsi3>
8000966c:	01051793          	slli	a5,a0,0x10
80009670:	0107d793          	srli	a5,a5,0x10
80009674:	0e050263          	beqz	a0,80009758 <dhcp_bind+0x160>
80009678:	00f41523          	sh	a5,10(s0)
8000967c:	00a45783          	lhu	a5,10(s0)
80009680:	00f41723          	sh	a5,14(s0)
80009684:	03042503          	lw	a0,48(s0)
80009688:	fff00793          	li	a5,-1
8000968c:	02f50863          	beq	a0,a5,800096bc <dhcp_bind+0xc4>
80009690:	01e50513          	addi	a0,a0,30
80009694:	003c07b7          	lui	a5,0x3c0
80009698:	0cf57463          	bgeu	a0,a5,80009760 <dhcp_bind+0x168>
8000969c:	03c00593          	li	a1,60
800096a0:	4ed030ef          	jal	ra,8000d38c <__udivsi3>
800096a4:	01051793          	slli	a5,a0,0x10
800096a8:	0107d793          	srli	a5,a5,0x10
800096ac:	0c050063          	beqz	a0,8000976c <dhcp_bind+0x174>
800096b0:	00f41623          	sh	a5,12(s0)
800096b4:	00c45783          	lhu	a5,12(s0)
800096b8:	00f41823          	sh	a5,16(s0)
800096bc:	00c45783          	lhu	a5,12(s0)
800096c0:	00a45703          	lhu	a4,10(s0)
800096c4:	00f76663          	bltu	a4,a5,800096d0 <dhcp_bind+0xd8>
800096c8:	00078463          	beqz	a5,800096d0 <dhcp_bind+0xd8>
800096cc:	00041523          	sh	zero,10(s0)
800096d0:	00744783          	lbu	a5,7(s0)
800096d4:	0a078063          	beqz	a5,80009774 <dhcp_bind+0x17c>
800096d8:	02042783          	lw	a5,32(s0)
800096dc:	00f12423          	sw	a5,8(sp)
800096e0:	02442783          	lw	a5,36(s0)
800096e4:	00f12623          	sw	a5,12(sp)
800096e8:	00079e63          	bnez	a5,80009704 <dhcp_bind+0x10c>
800096ec:	00812703          	lw	a4,8(sp)
800096f0:	01c42783          	lw	a5,28(s0)
800096f4:	00e7f7b3          	and	a5,a5,a4
800096f8:	01000737          	lui	a4,0x1000
800096fc:	00e7e7b3          	or	a5,a5,a4
80009700:	00f12623          	sw	a5,12(sp)
80009704:	00a00593          	li	a1,10
80009708:	00040513          	mv	a0,s0
8000970c:	d9cff0ef          	jal	ra,80008ca8 <dhcp_set_state>
80009710:	00c10693          	addi	a3,sp,12
80009714:	00810613          	addi	a2,sp,8
80009718:	01c40593          	addi	a1,s0,28
8000971c:	00048513          	mv	a0,s1
80009720:	9c0fd0ef          	jal	ra,800068e0 <netif_set_addr>
80009724:	01c12083          	lw	ra,28(sp)
80009728:	01812403          	lw	s0,24(sp)
8000972c:	01412483          	lw	s1,20(sp)
80009730:	02010113          	addi	sp,sp,32
80009734:	00008067          	ret
80009738:	000107b7          	lui	a5,0x10
8000973c:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80009740:	f09ff06f          	j	80009648 <dhcp_bind+0x50>
80009744:	00100793          	li	a5,1
80009748:	f01ff06f          	j	80009648 <dhcp_bind+0x50>
8000974c:	000107b7          	lui	a5,0x10
80009750:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80009754:	f25ff06f          	j	80009678 <dhcp_bind+0x80>
80009758:	00100793          	li	a5,1
8000975c:	f1dff06f          	j	80009678 <dhcp_bind+0x80>
80009760:	000107b7          	lui	a5,0x10
80009764:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80009768:	f49ff06f          	j	800096b0 <dhcp_bind+0xb8>
8000976c:	00100793          	li	a5,1
80009770:	f41ff06f          	j	800096b0 <dhcp_bind+0xb8>
80009774:	01c44783          	lbu	a5,28(s0)
80009778:	01879713          	slli	a4,a5,0x18
8000977c:	41875713          	srai	a4,a4,0x18
80009780:	00074663          	bltz	a4,8000978c <dhcp_bind+0x194>
80009784:	0ff00793          	li	a5,255
80009788:	f55ff06f          	j	800096dc <dhcp_bind+0xe4>
8000978c:	0bf00713          	li	a4,191
80009790:	00f77863          	bgeu	a4,a5,800097a0 <dhcp_bind+0x1a8>
80009794:	010007b7          	lui	a5,0x1000
80009798:	fff78793          	addi	a5,a5,-1 # ffffff <_stack_size+0xfff7ff>
8000979c:	f41ff06f          	j	800096dc <dhcp_bind+0xe4>
800097a0:	000107b7          	lui	a5,0x10
800097a4:	ff5ff06f          	j	80009798 <dhcp_bind+0x1a0>
800097a8:	00008067          	ret

800097ac <dhcp_inc_pcb_refcount>:
800097ac:	ff010113          	addi	sp,sp,-16
800097b0:	00812423          	sw	s0,8(sp)
800097b4:	8e01c783          	lbu	a5,-1824(gp) # 80003120 <dhcp_pcb_refcount>
800097b8:	00112623          	sw	ra,12(sp)
800097bc:	00912223          	sw	s1,4(sp)
800097c0:	01212023          	sw	s2,0(sp)
800097c4:	04079863          	bnez	a5,80009814 <dhcp_inc_pcb_refcount+0x68>
800097c8:	c4cff0ef          	jal	ra,80008c14 <udp_new>
800097cc:	8ea1a223          	sw	a0,-1820(gp) # 80003124 <dhcp_pcb>
800097d0:	fff00713          	li	a4,-1
800097d4:	04050863          	beqz	a0,80009824 <dhcp_inc_pcb_refcount+0x78>
800097d8:	00954703          	lbu	a4,9(a0)
800097dc:	04400613          	li	a2,68
800097e0:	02076713          	ori	a4,a4,32
800097e4:	00e504a3          	sb	a4,9(a0)
800097e8:	84818593          	addi	a1,gp,-1976 # 80003088 <ip_addr_any>
800097ec:	ee9fe0ef          	jal	ra,800086d4 <udp_bind>
800097f0:	8e41a503          	lw	a0,-1820(gp) # 80003124 <dhcp_pcb>
800097f4:	04300613          	li	a2,67
800097f8:	84818593          	addi	a1,gp,-1976 # 80003088 <ip_addr_any>
800097fc:	af8ff0ef          	jal	ra,80008af4 <udp_connect>
80009800:	8e41a503          	lw	a0,-1820(gp) # 80003124 <dhcp_pcb>
80009804:	8000a5b7          	lui	a1,0x8000a
80009808:	00000613          	li	a2,0
8000980c:	96c58593          	addi	a1,a1,-1684 # 8000996c <_heap_end+0xffff796c>
80009810:	bb0ff0ef          	jal	ra,80008bc0 <udp_recv>
80009814:	8e01c783          	lbu	a5,-1824(gp) # 80003120 <dhcp_pcb_refcount>
80009818:	00000713          	li	a4,0
8000981c:	00178793          	addi	a5,a5,1 # 10001 <_stack_size+0xf801>
80009820:	8ef18023          	sb	a5,-1824(gp) # 80003120 <dhcp_pcb_refcount>
80009824:	00c12083          	lw	ra,12(sp)
80009828:	00812403          	lw	s0,8(sp)
8000982c:	00412483          	lw	s1,4(sp)
80009830:	00012903          	lw	s2,0(sp)
80009834:	00070513          	mv	a0,a4
80009838:	01010113          	addi	sp,sp,16
8000983c:	00008067          	ret

80009840 <dhcp_handle_ack.isra.0>:
80009840:	ff010113          	addi	sp,sp,-16
80009844:	00912223          	sw	s1,4(sp)
80009848:	00812423          	sw	s0,8(sp)
8000984c:	00112623          	sw	ra,12(sp)
80009850:	8e818793          	addi	a5,gp,-1816 # 80003128 <dhcp_rx_options_given>
80009854:	0037c783          	lbu	a5,3(a5)
80009858:	02052023          	sw	zero,32(a0)
8000985c:	02052223          	sw	zero,36(a0)
80009860:	00050413          	mv	s0,a0
80009864:	8e818493          	addi	s1,gp,-1816 # 80003128 <dhcp_rx_options_given>
80009868:	00078663          	beqz	a5,80009874 <dhcp_handle_ack.isra.0+0x34>
8000986c:	b301a783          	lw	a5,-1232(gp) # 80003370 <dhcp_rx_options_val+0xc>
80009870:	02f52423          	sw	a5,40(a0)
80009874:	0044c783          	lbu	a5,4(s1)
80009878:	08078663          	beqz	a5,80009904 <dhcp_handle_ack.isra.0+0xc4>
8000987c:	b341a783          	lw	a5,-1228(gp) # 80003374 <dhcp_rx_options_val+0x10>
80009880:	02f42623          	sw	a5,44(s0)
80009884:	0054c783          	lbu	a5,5(s1)
80009888:	08078463          	beqz	a5,80009910 <dhcp_handle_ack.isra.0+0xd0>
8000988c:	b381a783          	lw	a5,-1224(gp) # 80003378 <dhcp_rx_options_val+0x14>
80009890:	02f42823          	sw	a5,48(s0)
80009894:	0115c703          	lbu	a4,17(a1)
80009898:	0105c783          	lbu	a5,16(a1)
8000989c:	00871713          	slli	a4,a4,0x8
800098a0:	00f76733          	or	a4,a4,a5
800098a4:	0125c783          	lbu	a5,18(a1)
800098a8:	01079793          	slli	a5,a5,0x10
800098ac:	00e7e733          	or	a4,a5,a4
800098b0:	0135c783          	lbu	a5,19(a1)
800098b4:	01879793          	slli	a5,a5,0x18
800098b8:	00e7e7b3          	or	a5,a5,a4
800098bc:	00f42e23          	sw	a5,28(s0)
800098c0:	0064c783          	lbu	a5,6(s1)
800098c4:	06078063          	beqz	a5,80009924 <dhcp_handle_ack.isra.0+0xe4>
800098c8:	b3c1a503          	lw	a0,-1220(gp) # 8000337c <dhcp_rx_options_val+0x18>
800098cc:	d40fc0ef          	jal	ra,80005e0c <lwip_htonl>
800098d0:	00100793          	li	a5,1
800098d4:	02a42023          	sw	a0,32(s0)
800098d8:	00f403a3          	sb	a5,7(s0)
800098dc:	0074c783          	lbu	a5,7(s1)
800098e0:	00078863          	beqz	a5,800098f0 <dhcp_handle_ack.isra.0+0xb0>
800098e4:	b401a503          	lw	a0,-1216(gp) # 80003380 <dhcp_rx_options_val+0x1c>
800098e8:	d24fc0ef          	jal	ra,80005e0c <lwip_htonl>
800098ec:	02a42223          	sw	a0,36(s0)
800098f0:	00c12083          	lw	ra,12(sp)
800098f4:	00812403          	lw	s0,8(sp)
800098f8:	00412483          	lw	s1,4(sp)
800098fc:	01010113          	addi	sp,sp,16
80009900:	00008067          	ret
80009904:	02842783          	lw	a5,40(s0)
80009908:	0017d793          	srli	a5,a5,0x1
8000990c:	f75ff06f          	j	80009880 <dhcp_handle_ack.isra.0+0x40>
80009910:	02842703          	lw	a4,40(s0)
80009914:	00371793          	slli	a5,a4,0x3
80009918:	40e787b3          	sub	a5,a5,a4
8000991c:	0037d793          	srli	a5,a5,0x3
80009920:	f71ff06f          	j	80009890 <dhcp_handle_ack.isra.0+0x50>
80009924:	000403a3          	sb	zero,7(s0)
80009928:	fb5ff06f          	j	800098dc <dhcp_handle_ack.isra.0+0x9c>

8000992c <dhcp_dec_pcb_refcount>:
8000992c:	8e01c783          	lbu	a5,-1824(gp) # 80003120 <dhcp_pcb_refcount>
80009930:	fff78793          	addi	a5,a5,-1
80009934:	0ff7f793          	andi	a5,a5,255
80009938:	8ef18023          	sb	a5,-1824(gp) # 80003120 <dhcp_pcb_refcount>
8000993c:	02079663          	bnez	a5,80009968 <dhcp_dec_pcb_refcount+0x3c>
80009940:	ff010113          	addi	sp,sp,-16
80009944:	00812423          	sw	s0,8(sp)
80009948:	8e41a503          	lw	a0,-1820(gp) # 80003124 <dhcp_pcb>
8000994c:	00112623          	sw	ra,12(sp)
80009950:	a80ff0ef          	jal	ra,80008bd0 <udp_remove>
80009954:	00c12083          	lw	ra,12(sp)
80009958:	8e01a223          	sw	zero,-1820(gp) # 80003124 <dhcp_pcb>
8000995c:	00812403          	lw	s0,8(sp)
80009960:	01010113          	addi	sp,sp,16
80009964:	00008067          	ret
80009968:	00008067          	ret

8000996c <dhcp_recv>:
8000996c:	fa010113          	addi	sp,sp,-96
80009970:	05212823          	sw	s2,80(sp)
80009974:	9f01a903          	lw	s2,-1552(gp) # 80003230 <ip_data+0x4>
80009978:	05312623          	sw	s3,76(sp)
8000997c:	04112e23          	sw	ra,92(sp)
80009980:	04812c23          	sw	s0,88(sp)
80009984:	04912a23          	sw	s1,84(sp)
80009988:	05412423          	sw	s4,72(sp)
8000998c:	05512223          	sw	s5,68(sp)
80009990:	05612023          	sw	s6,64(sp)
80009994:	03712e23          	sw	s7,60(sp)
80009998:	03812c23          	sw	s8,56(sp)
8000999c:	03912a23          	sw	s9,52(sp)
800099a0:	03a12823          	sw	s10,48(sp)
800099a4:	03b12623          	sw	s11,44(sp)
800099a8:	02892b83          	lw	s7,40(s2)
800099ac:	00060993          	mv	s3,a2
800099b0:	0e0b8663          	beqz	s7,80009a9c <dhcp_recv+0x130>
800099b4:	004bc783          	lbu	a5,4(s7)
800099b8:	0e078263          	beqz	a5,80009a9c <dhcp_recv+0x130>
800099bc:	00a65703          	lhu	a4,10(a2)
800099c0:	02b00793          	li	a5,43
800099c4:	0ce7fc63          	bgeu	a5,a4,80009a9c <dhcp_recv+0x130>
800099c8:	00462783          	lw	a5,4(a2)
800099cc:	00200713          	li	a4,2
800099d0:	0007c683          	lbu	a3,0(a5)
800099d4:	0ce69463          	bne	a3,a4,80009a9c <dhcp_recv+0x130>
800099d8:	03494603          	lbu	a2,52(s2)
800099dc:	00000713          	li	a4,0
800099e0:	00600693          	li	a3,6
800099e4:	0ff77593          	andi	a1,a4,255
800099e8:	00c5f463          	bgeu	a1,a2,800099f0 <dhcp_recv+0x84>
800099ec:	08d71c63          	bne	a4,a3,80009a84 <dhcp_recv+0x118>
800099f0:	0057c503          	lbu	a0,5(a5)
800099f4:	0047c703          	lbu	a4,4(a5)
800099f8:	00851513          	slli	a0,a0,0x8
800099fc:	00e56533          	or	a0,a0,a4
80009a00:	0067c703          	lbu	a4,6(a5)
80009a04:	01071713          	slli	a4,a4,0x10
80009a08:	00a76733          	or	a4,a4,a0
80009a0c:	0077c503          	lbu	a0,7(a5)
80009a10:	01851513          	slli	a0,a0,0x18
80009a14:	00e56533          	or	a0,a0,a4
80009a18:	bf4fc0ef          	jal	ra,80005e0c <lwip_htonl>
80009a1c:	000ba783          	lw	a5,0(s7)
80009a20:	06f51e63          	bne	a0,a5,80009a9c <dhcp_recv+0x130>
80009a24:	8e818793          	addi	a5,gp,-1816 # 80003128 <dhcp_rx_options_given>
80009a28:	0007a223          	sw	zero,4(a5)
80009a2c:	00a9d703          	lhu	a4,10(s3)
80009a30:	0007a023          	sw	zero,0(a5)
80009a34:	02b00793          	li	a5,43
80009a38:	8e818813          	addi	a6,gp,-1816 # 80003128 <dhcp_rx_options_given>
80009a3c:	06e7f063          	bgeu	a5,a4,80009a9c <dhcp_recv+0x130>
80009a40:	00010ab7          	lui	s5,0x10
80009a44:	ffda8793          	addi	a5,s5,-3 # fffd <_stack_size+0xf7fd>
80009a48:	0089dd83          	lhu	s11,8(s3)
80009a4c:	00f12423          	sw	a5,8(sp)
80009a50:	b2418793          	addi	a5,gp,-1244 # 80003364 <dhcp_rx_options_val>
80009a54:	00000b13          	li	s6,0
80009a58:	0f000d13          	li	s10,240
80009a5c:	00f12223          	sw	a5,4(sp)
80009a60:	00098c13          	mv	s8,s3
80009a64:	00ac5783          	lhu	a5,10(s8)
80009a68:	06fd7c63          	bgeu	s10,a5,80009ae0 <dhcp_recv+0x174>
80009a6c:	004c2783          	lw	a5,4(s8)
80009a70:	000d0413          	mv	s0,s10
80009a74:	00400a93          	li	s5,4
80009a78:	00f12023          	sw	a5,0(sp)
80009a7c:	00100a13          	li	s4,1
80009a80:	25c0006f          	j	80009cdc <dhcp_recv+0x370>
80009a84:	00e905b3          	add	a1,s2,a4
80009a88:	00170713          	addi	a4,a4,1 # 1000001 <_stack_size+0xfff801>
80009a8c:	00e78533          	add	a0,a5,a4
80009a90:	02e5c583          	lbu	a1,46(a1)
80009a94:	01b54503          	lbu	a0,27(a0)
80009a98:	f4b506e3          	beq	a0,a1,800099e4 <dhcp_recv+0x78>
80009a9c:	00098513          	mv	a0,s3
80009aa0:	d78fd0ef          	jal	ra,80007018 <pbuf_free>
80009aa4:	05c12083          	lw	ra,92(sp)
80009aa8:	05812403          	lw	s0,88(sp)
80009aac:	05412483          	lw	s1,84(sp)
80009ab0:	05012903          	lw	s2,80(sp)
80009ab4:	04c12983          	lw	s3,76(sp)
80009ab8:	04812a03          	lw	s4,72(sp)
80009abc:	04412a83          	lw	s5,68(sp)
80009ac0:	04012b03          	lw	s6,64(sp)
80009ac4:	03c12b83          	lw	s7,60(sp)
80009ac8:	03812c03          	lw	s8,56(sp)
80009acc:	03412c83          	lw	s9,52(sp)
80009ad0:	03012d03          	lw	s10,48(sp)
80009ad4:	02c12d83          	lw	s11,44(sp)
80009ad8:	06010113          	addi	sp,sp,96
80009adc:	00008067          	ret
80009ae0:	000c2c03          	lw	s8,0(s8)
80009ae4:	40fd0d33          	sub	s10,s10,a5
80009ae8:	40fd8db3          	sub	s11,s11,a5
80009aec:	010d1d13          	slli	s10,s10,0x10
80009af0:	010d9d93          	slli	s11,s11,0x10
80009af4:	010d5d13          	srli	s10,s10,0x10
80009af8:	010ddd93          	srli	s11,s11,0x10
80009afc:	f60c14e3          	bnez	s8,80009a64 <dhcp_recv+0xf8>
80009b00:	f9dff06f          	j	80009a9c <dhcp_recv+0x130>
80009b04:	00240693          	addi	a3,s0,2
80009b08:	01069693          	slli	a3,a3,0x10
80009b0c:	0106d693          	srli	a3,a3,0x10
80009b10:	f886e6e3          	bltu	a3,s0,80009a9c <dhcp_recv+0x130>
80009b14:	00ac5583          	lhu	a1,10(s8)
80009b18:	00140613          	addi	a2,s0,1
80009b1c:	02b65c63          	bge	a2,a1,80009b54 <dhcp_recv+0x1e8>
80009b20:	00174703          	lbu	a4,1(a4)
80009b24:	03400593          	li	a1,52
80009b28:	12b78263          	beq	a5,a1,80009c4c <dhcp_recv+0x2e0>
80009b2c:	02f5ee63          	bltu	a1,a5,80009b68 <dhcp_recv+0x1fc>
80009b30:	07478263          	beq	a5,s4,80009b94 <dhcp_recv+0x228>
80009b34:	16078663          	beqz	a5,80009ca0 <dhcp_recv+0x334>
80009b38:	00300613          	li	a2,3
80009b3c:	0ec78663          	beq	a5,a2,80009c28 <dhcp_recv+0x2bc>
80009b40:	03300613          	li	a2,51
80009b44:	0ec78a63          	beq	a5,a2,80009c38 <dhcp_recv+0x2cc>
80009b48:	fff00493          	li	s1,-1
80009b4c:	00000c93          	li	s9,0
80009b50:	0500006f          	j	80009ba0 <dhcp_recv+0x234>
80009b54:	000c2703          	lw	a4,0(s8)
80009b58:	32070263          	beqz	a4,80009e7c <dhcp_recv+0x510>
80009b5c:	00472703          	lw	a4,4(a4)
80009b60:	00074703          	lbu	a4,0(a4)
80009b64:	fc1ff06f          	j	80009b24 <dhcp_recv+0x1b8>
80009b68:	03600613          	li	a2,54
80009b6c:	10c78863          	beq	a5,a2,80009c7c <dhcp_recv+0x310>
80009b70:	0ec7ec63          	bltu	a5,a2,80009c68 <dhcp_recv+0x2fc>
80009b74:	03a00613          	li	a2,58
80009b78:	10c78c63          	beq	a5,a2,80009c90 <dhcp_recv+0x324>
80009b7c:	03b00613          	li	a2,59
80009b80:	fcc794e3          	bne	a5,a2,80009b48 <dhcp_recv+0x1dc>
80009b84:	f1571ce3          	bne	a4,s5,80009a9c <dhcp_recv+0x130>
80009b88:	00400c93          	li	s9,4
80009b8c:	00500493          	li	s1,5
80009b90:	0100006f          	j	80009ba0 <dhcp_recv+0x234>
80009b94:	f15714e3          	bne	a4,s5,80009a9c <dhcp_recv+0x130>
80009b98:	00400c93          	li	s9,4
80009b9c:	00600493          	li	s1,6
80009ba0:	00812783          	lw	a5,8(sp)
80009ba4:	00870433          	add	s0,a4,s0
80009ba8:	ee87cae3          	blt	a5,s0,80009a9c <dhcp_recv+0x130>
80009bac:	00e68733          	add	a4,a3,a4
80009bb0:	01071413          	slli	s0,a4,0x10
80009bb4:	01045413          	srli	s0,s0,0x10
80009bb8:	0e0c8863          	beqz	s9,80009ca8 <dhcp_recv+0x33c>
80009bbc:	009807b3          	add	a5,a6,s1
80009bc0:	0007c783          	lbu	a5,0(a5)
80009bc4:	00012e23          	sw	zero,28(sp)
80009bc8:	0e079063          	bnez	a5,80009ca8 <dhcp_recv+0x33c>
80009bcc:	010c9793          	slli	a5,s9,0x10
80009bd0:	0107d793          	srli	a5,a5,0x10
80009bd4:	00078613          	mv	a2,a5
80009bd8:	01c10593          	addi	a1,sp,28
80009bdc:	000c0513          	mv	a0,s8
80009be0:	00f12623          	sw	a5,12(sp)
80009be4:	a19fd0ef          	jal	ra,800075fc <pbuf_copy_partial>
80009be8:	00c12783          	lw	a5,12(sp)
80009bec:	eaa798e3          	bne	a5,a0,80009a9c <dhcp_recv+0x130>
80009bf0:	8e818813          	addi	a6,gp,-1816 # 80003128 <dhcp_rx_options_given>
80009bf4:	155c9a63          	bne	s9,s5,80009d48 <dhcp_recv+0x3dc>
80009bf8:	01c12503          	lw	a0,28(sp)
80009bfc:	a10fc0ef          	jal	ra,80005e0c <lwip_htonl>
80009c00:	00a12e23          	sw	a0,28(sp)
80009c04:	8e818813          	addi	a6,gp,-1816 # 80003128 <dhcp_rx_options_given>
80009c08:	009807b3          	add	a5,a6,s1
80009c0c:	01478023          	sb	s4,0(a5)
80009c10:	00412783          	lw	a5,4(sp)
80009c14:	00249493          	slli	s1,s1,0x2
80009c18:	009784b3          	add	s1,a5,s1
80009c1c:	01c12783          	lw	a5,28(sp)
80009c20:	00f4a023          	sw	a5,0(s1)
80009c24:	0840006f          	j	80009ca8 <dhcp_recv+0x33c>
80009c28:	e6e7fae3          	bgeu	a5,a4,80009a9c <dhcp_recv+0x130>
80009c2c:	00700493          	li	s1,7
80009c30:	00400c93          	li	s9,4
80009c34:	f6dff06f          	j	80009ba0 <dhcp_recv+0x234>
80009c38:	e75712e3          	bne	a4,s5,80009a9c <dhcp_recv+0x130>
80009c3c:	00400c93          	li	s9,4
80009c40:	00300493          	li	s1,3
80009c44:	f5dff06f          	j	80009ba0 <dhcp_recv+0x234>
80009c48:	00000713          	li	a4,0
80009c4c:	e54718e3          	bne	a4,s4,80009a9c <dhcp_recv+0x130>
80009c50:	0f000793          	li	a5,240
80009c54:	e4fd14e3          	bne	s10,a5,80009a9c <dhcp_recv+0x130>
80009c58:	00100c93          	li	s9,1
80009c5c:	00000493          	li	s1,0
80009c60:	f41ff06f          	j	80009ba0 <dhcp_recv+0x234>
80009c64:	00000713          	li	a4,0
80009c68:	e3471ae3          	bne	a4,s4,80009a9c <dhcp_recv+0x130>
80009c6c:	00100c93          	li	s9,1
80009c70:	00100493          	li	s1,1
80009c74:	f2dff06f          	j	80009ba0 <dhcp_recv+0x234>
80009c78:	00000713          	li	a4,0
80009c7c:	e35710e3          	bne	a4,s5,80009a9c <dhcp_recv+0x130>
80009c80:	00400c93          	li	s9,4
80009c84:	00200493          	li	s1,2
80009c88:	f19ff06f          	j	80009ba0 <dhcp_recv+0x234>
80009c8c:	00000713          	li	a4,0
80009c90:	e15716e3          	bne	a4,s5,80009a9c <dhcp_recv+0x130>
80009c94:	00400c93          	li	s9,4
80009c98:	00400493          	li	s1,4
80009c9c:	f05ff06f          	j	80009ba0 <dhcp_recv+0x234>
80009ca0:	01061413          	slli	s0,a2,0x10
80009ca4:	01045413          	srli	s0,s0,0x10
80009ca8:	00ac5783          	lhu	a5,10(s8)
80009cac:	02f46863          	bltu	s0,a5,80009cdc <dhcp_recv+0x370>
80009cb0:	40f40433          	sub	s0,s0,a5
80009cb4:	40fd8db3          	sub	s11,s11,a5
80009cb8:	01041413          	slli	s0,s0,0x10
80009cbc:	010d9d93          	slli	s11,s11,0x10
80009cc0:	01045413          	srli	s0,s0,0x10
80009cc4:	010ddd93          	srli	s11,s11,0x10
80009cc8:	ddb47ae3          	bgeu	s0,s11,80009a9c <dhcp_recv+0x130>
80009ccc:	000c2c03          	lw	s8,0(s8)
80009cd0:	dc0c06e3          	beqz	s8,80009a9c <dhcp_recv+0x130>
80009cd4:	004c2783          	lw	a5,4(s8)
80009cd8:	00f12023          	sw	a5,0(sp)
80009cdc:	01b47c63          	bgeu	s0,s11,80009cf4 <dhcp_recv+0x388>
80009ce0:	00012783          	lw	a5,0(sp)
80009ce4:	0ff00693          	li	a3,255
80009ce8:	00878733          	add	a4,a5,s0
80009cec:	00074783          	lbu	a5,0(a4)
80009cf0:	e0d79ae3          	bne	a5,a3,80009b04 <dhcp_recv+0x198>
80009cf4:	00084783          	lbu	a5,0(a6)
80009cf8:	06079063          	bnez	a5,80009d58 <dhcp_recv+0x3ec>
80009cfc:	060b1c63          	bnez	s6,80009d74 <dhcp_recv+0x408>
80009d00:	00184783          	lbu	a5,1(a6)
80009d04:	d8078ce3          	beqz	a5,80009a9c <dhcp_recv+0x130>
80009d08:	b2418793          	addi	a5,gp,-1244 # 80003364 <dhcp_rx_options_val>
80009d0c:	0047c703          	lbu	a4,4(a5)
80009d10:	00500693          	li	a3,5
80009d14:	0049a583          	lw	a1,4(s3)
80009d18:	0ad71463          	bne	a4,a3,80009dc0 <dhcp_recv+0x454>
80009d1c:	005bc783          	lbu	a5,5(s7)
80009d20:	00100713          	li	a4,1
80009d24:	06e79c63          	bne	a5,a4,80009d9c <dhcp_recv+0x430>
80009d28:	02892503          	lw	a0,40(s2)
80009d2c:	b15ff0ef          	jal	ra,80009840 <dhcp_handle_ack.isra.0>
80009d30:	03594783          	lbu	a5,53(s2)
80009d34:	00090513          	mv	a0,s2
80009d38:	0087f793          	andi	a5,a5,8
80009d3c:	06078e63          	beqz	a5,80009db8 <dhcp_recv+0x44c>
80009d40:	855ff0ef          	jal	ra,80009594 <dhcp_check>
80009d44:	d59ff06f          	j	80009a9c <dhcp_recv+0x130>
80009d48:	d54c9ae3          	bne	s9,s4,80009a9c <dhcp_recv+0x130>
80009d4c:	01c14783          	lbu	a5,28(sp)
80009d50:	00f12e23          	sw	a5,28(sp)
80009d54:	eb5ff06f          	j	80009c08 <dhcp_recv+0x29c>
80009d58:	00412783          	lw	a5,4(sp)
80009d5c:	00080023          	sb	zero,0(a6)
80009d60:	00100713          	li	a4,1
80009d64:	0007a783          	lw	a5,0(a5)
80009d68:	02e78463          	beq	a5,a4,80009d90 <dhcp_recv+0x424>
80009d6c:	00200713          	li	a4,2
80009d70:	00e79a63          	bne	a5,a4,80009d84 <dhcp_recv+0x418>
80009d74:	00000b13          	li	s6,0
80009d78:	06c00d93          	li	s11,108
80009d7c:	02c00d13          	li	s10,44
80009d80:	ce1ff06f          	j	80009a60 <dhcp_recv+0xf4>
80009d84:	00300713          	li	a4,3
80009d88:	f6e79ae3          	bne	a5,a4,80009cfc <dhcp_recv+0x390>
80009d8c:	00100b13          	li	s6,1
80009d90:	0ec00d93          	li	s11,236
80009d94:	06c00d13          	li	s10,108
80009d98:	cc9ff06f          	j	80009a60 <dhcp_recv+0xf4>
80009d9c:	ffd78793          	addi	a5,a5,-3
80009da0:	0ff7f793          	andi	a5,a5,255
80009da4:	00200713          	li	a4,2
80009da8:	cef76ae3          	bltu	a4,a5,80009a9c <dhcp_recv+0x130>
80009dac:	02892503          	lw	a0,40(s2)
80009db0:	a91ff0ef          	jal	ra,80009840 <dhcp_handle_ack.isra.0>
80009db4:	00090513          	mv	a0,s2
80009db8:	841ff0ef          	jal	ra,800095f8 <dhcp_bind>
80009dbc:	ce1ff06f          	j	80009a9c <dhcp_recv+0x130>
80009dc0:	00600693          	li	a3,6
80009dc4:	04d71663          	bne	a4,a3,80009e10 <dhcp_recv+0x4a4>
80009dc8:	005bc703          	lbu	a4,5(s7)
80009dcc:	00200693          	li	a3,2
80009dd0:	ffd70793          	addi	a5,a4,-3
80009dd4:	0ff7f793          	andi	a5,a5,255
80009dd8:	00f6f663          	bgeu	a3,a5,80009de4 <dhcp_recv+0x478>
80009ddc:	00100793          	li	a5,1
80009de0:	caf71ee3          	bne	a4,a5,80009a9c <dhcp_recv+0x130>
80009de4:	02892503          	lw	a0,40(s2)
80009de8:	00c00593          	li	a1,12
80009dec:	ebdfe0ef          	jal	ra,80008ca8 <dhcp_set_state>
80009df0:	84818693          	addi	a3,gp,-1976 # 80003088 <ip_addr_any>
80009df4:	84818613          	addi	a2,gp,-1976 # 80003088 <ip_addr_any>
80009df8:	00090513          	mv	a0,s2
80009dfc:	84818593          	addi	a1,gp,-1976 # 80003088 <ip_addr_any>
80009e00:	ae1fc0ef          	jal	ra,800068e0 <netif_set_addr>
80009e04:	00090513          	mv	a0,s2
80009e08:	dc8ff0ef          	jal	ra,800093d0 <dhcp_discover>
80009e0c:	c91ff06f          	j	80009a9c <dhcp_recv+0x130>
80009e10:	00200613          	li	a2,2
80009e14:	c8c714e3          	bne	a4,a2,80009a9c <dhcp_recv+0x130>
80009e18:	005bc703          	lbu	a4,5(s7)
80009e1c:	c8d710e3          	bne	a4,a3,80009a9c <dhcp_recv+0x130>
80009e20:	00284703          	lbu	a4,2(a6)
80009e24:	c6070ce3          	beqz	a4,80009a9c <dhcp_recv+0x130>
80009e28:	02892403          	lw	s0,40(s2)
80009e2c:	00b12023          	sw	a1,0(sp)
80009e30:	00041423          	sh	zero,8(s0)
80009e34:	0087a503          	lw	a0,8(a5)
80009e38:	fd5fb0ef          	jal	ra,80005e0c <lwip_htonl>
80009e3c:	00012583          	lw	a1,0(sp)
80009e40:	00a42c23          	sw	a0,24(s0)
80009e44:	00090513          	mv	a0,s2
80009e48:	0115c703          	lbu	a4,17(a1)
80009e4c:	0105c783          	lbu	a5,16(a1)
80009e50:	00871713          	slli	a4,a4,0x8
80009e54:	00f76733          	or	a4,a4,a5
80009e58:	0125c783          	lbu	a5,18(a1)
80009e5c:	01079793          	slli	a5,a5,0x10
80009e60:	00e7e733          	or	a4,a5,a4
80009e64:	0135c783          	lbu	a5,19(a1)
80009e68:	01879793          	slli	a5,a5,0x18
80009e6c:	00e7e7b3          	or	a5,a5,a4
80009e70:	00f42e23          	sw	a5,28(s0)
80009e74:	ae0ff0ef          	jal	ra,80009154 <dhcp_select>
80009e78:	c25ff06f          	j	80009a9c <dhcp_recv+0x130>
80009e7c:	03400713          	li	a4,52
80009e80:	dce784e3          	beq	a5,a4,80009c48 <dhcp_recv+0x2dc>
80009e84:	02f76263          	bltu	a4,a5,80009ea8 <dhcp_recv+0x53c>
80009e88:	c1478ae3          	beq	a5,s4,80009a9c <dhcp_recv+0x130>
80009e8c:	e0078ae3          	beqz	a5,80009ca0 <dhcp_recv+0x334>
80009e90:	00300713          	li	a4,3
80009e94:	c0e784e3          	beq	a5,a4,80009a9c <dhcp_recv+0x130>
80009e98:	03300713          	li	a4,51
80009e9c:	c0e780e3          	beq	a5,a4,80009a9c <dhcp_recv+0x130>
80009ea0:	00000713          	li	a4,0
80009ea4:	ca5ff06f          	j	80009b48 <dhcp_recv+0x1dc>
80009ea8:	03600713          	li	a4,54
80009eac:	dce786e3          	beq	a5,a4,80009c78 <dhcp_recv+0x30c>
80009eb0:	dae7eae3          	bltu	a5,a4,80009c64 <dhcp_recv+0x2f8>
80009eb4:	03a00713          	li	a4,58
80009eb8:	dce78ae3          	beq	a5,a4,80009c8c <dhcp_recv+0x320>
80009ebc:	03b00613          	li	a2,59
80009ec0:	00000713          	li	a4,0
80009ec4:	cbdff06f          	j	80009b80 <dhcp_recv+0x214>

80009ec8 <dhcp_set_struct>:
80009ec8:	ff010113          	addi	sp,sp,-16
80009ecc:	00058793          	mv	a5,a1
80009ed0:	00812423          	sw	s0,8(sp)
80009ed4:	03400613          	li	a2,52
80009ed8:	00050413          	mv	s0,a0
80009edc:	00000593          	li	a1,0
80009ee0:	00078513          	mv	a0,a5
80009ee4:	00112623          	sw	ra,12(sp)
80009ee8:	595020ef          	jal	ra,8000cc7c <memset>
80009eec:	02a42423          	sw	a0,40(s0)
80009ef0:	00c12083          	lw	ra,12(sp)
80009ef4:	00812403          	lw	s0,8(sp)
80009ef8:	01010113          	addi	sp,sp,16
80009efc:	00008067          	ret

80009f00 <dhcp_cleanup>:
80009f00:	02852783          	lw	a5,40(a0)
80009f04:	02078863          	beqz	a5,80009f34 <dhcp_cleanup+0x34>
80009f08:	ff010113          	addi	sp,sp,-16
80009f0c:	00812423          	sw	s0,8(sp)
80009f10:	00050413          	mv	s0,a0
80009f14:	00078513          	mv	a0,a5
80009f18:	00112623          	sw	ra,12(sp)
80009f1c:	f0cfc0ef          	jal	ra,80006628 <lwip_free>
80009f20:	02042423          	sw	zero,40(s0)
80009f24:	00c12083          	lw	ra,12(sp)
80009f28:	00812403          	lw	s0,8(sp)
80009f2c:	01010113          	addi	sp,sp,16
80009f30:	00008067          	ret
80009f34:	00008067          	ret

80009f38 <dhcp_inform>:
80009f38:	0e050a63          	beqz	a0,8000a02c <dhcp_inform+0xf4>
80009f3c:	fb010113          	addi	sp,sp,-80
80009f40:	04812423          	sw	s0,72(sp)
80009f44:	04112623          	sw	ra,76(sp)
80009f48:	04912223          	sw	s1,68(sp)
80009f4c:	05212023          	sw	s2,64(sp)
80009f50:	00050413          	mv	s0,a0
80009f54:	859ff0ef          	jal	ra,800097ac <dhcp_inc_pcb_refcount>
80009f58:	0a051e63          	bnez	a0,8000a014 <dhcp_inform+0xdc>
80009f5c:	03400613          	li	a2,52
80009f60:	00000593          	li	a1,0
80009f64:	00c10513          	addi	a0,sp,12
80009f68:	515020ef          	jal	ra,8000cc7c <memset>
80009f6c:	00700593          	li	a1,7
80009f70:	00c10513          	addi	a0,sp,12
80009f74:	d35fe0ef          	jal	ra,80008ca8 <dhcp_set_state>
80009f78:	00a10693          	addi	a3,sp,10
80009f7c:	00800613          	li	a2,8
80009f80:	00c10593          	addi	a1,sp,12
80009f84:	00040513          	mv	a0,s0
80009f88:	dc9fe0ef          	jal	ra,80008d50 <dhcp_create_msg>
80009f8c:	00050913          	mv	s2,a0
80009f90:	08050063          	beqz	a0,8000a010 <dhcp_inform+0xd8>
80009f94:	00452483          	lw	s1,4(a0)
80009f98:	00a15783          	lhu	a5,10(sp)
80009f9c:	03900693          	li	a3,57
80009fa0:	0f048493          	addi	s1,s1,240
80009fa4:	00f48733          	add	a4,s1,a5
80009fa8:	00278513          	addi	a0,a5,2
80009fac:	00178793          	addi	a5,a5,1
80009fb0:	01079793          	slli	a5,a5,0x10
80009fb4:	0107d793          	srli	a5,a5,0x10
80009fb8:	00d70023          	sb	a3,0(a4)
80009fbc:	00f487b3          	add	a5,s1,a5
80009fc0:	00200713          	li	a4,2
80009fc4:	00e78023          	sb	a4,0(a5)
80009fc8:	02c45603          	lhu	a2,44(s0)
80009fcc:	01051513          	slli	a0,a0,0x10
80009fd0:	01055513          	srli	a0,a0,0x10
80009fd4:	00048593          	mv	a1,s1
80009fd8:	00a11523          	sh	a0,10(sp)
80009fdc:	ce5fe0ef          	jal	ra,80008cc0 <dhcp_option_short>
80009fe0:	00090613          	mv	a2,s2
80009fe4:	00048593          	mv	a1,s1
80009fe8:	00a11523          	sh	a0,10(sp)
80009fec:	f09fe0ef          	jal	ra,80008ef4 <dhcp_option_trailer>
80009ff0:	8e41a503          	lw	a0,-1820(gp) # 80003124 <dhcp_pcb>
80009ff4:	00040713          	mv	a4,s0
80009ff8:	04300693          	li	a3,67
80009ffc:	84418613          	addi	a2,gp,-1980 # 80003084 <ip_addr_broadcast>
8000a000:	00090593          	mv	a1,s2
8000a004:	9b5fe0ef          	jal	ra,800089b8 <udp_sendto_if>
8000a008:	00090513          	mv	a0,s2
8000a00c:	80cfd0ef          	jal	ra,80007018 <pbuf_free>
8000a010:	91dff0ef          	jal	ra,8000992c <dhcp_dec_pcb_refcount>
8000a014:	04c12083          	lw	ra,76(sp)
8000a018:	04812403          	lw	s0,72(sp)
8000a01c:	04412483          	lw	s1,68(sp)
8000a020:	04012903          	lw	s2,64(sp)
8000a024:	05010113          	addi	sp,sp,80
8000a028:	00008067          	ret
8000a02c:	00008067          	ret

8000a030 <dhcp_network_changed>:
8000a030:	02852783          	lw	a5,40(a0)
8000a034:	02078a63          	beqz	a5,8000a068 <dhcp_network_changed+0x38>
8000a038:	0057c703          	lbu	a4,5(a5)
8000a03c:	00500693          	li	a3,5
8000a040:	00e6ec63          	bltu	a3,a4,8000a058 <dhcp_network_changed+0x28>
8000a044:	00300693          	li	a3,3
8000a048:	00d77c63          	bgeu	a4,a3,8000a060 <dhcp_network_changed+0x30>
8000a04c:	00070e63          	beqz	a4,8000a068 <dhcp_network_changed+0x38>
8000a050:	00078323          	sb	zero,6(a5)
8000a054:	b7cff06f          	j	800093d0 <dhcp_discover>
8000a058:	00a00693          	li	a3,10
8000a05c:	fed71ae3          	bne	a4,a3,8000a050 <dhcp_network_changed+0x20>
8000a060:	00078323          	sb	zero,6(a5)
8000a064:	ee1fe06f          	j	80008f44 <dhcp_reboot>
8000a068:	00008067          	ret

8000a06c <dhcp_arp_reply>:
8000a06c:	12050a63          	beqz	a0,8000a1a0 <dhcp_arp_reply+0x134>
8000a070:	fd010113          	addi	sp,sp,-48
8000a074:	02112623          	sw	ra,44(sp)
8000a078:	02812423          	sw	s0,40(sp)
8000a07c:	02912223          	sw	s1,36(sp)
8000a080:	03212023          	sw	s2,32(sp)
8000a084:	01312e23          	sw	s3,28(sp)
8000a088:	01412c23          	sw	s4,24(sp)
8000a08c:	02852403          	lw	s0,40(a0)
8000a090:	0e040863          	beqz	s0,8000a180 <dhcp_arp_reply+0x114>
8000a094:	00544703          	lbu	a4,5(s0)
8000a098:	00800793          	li	a5,8
8000a09c:	0ef71263          	bne	a4,a5,8000a180 <dhcp_arp_reply+0x114>
8000a0a0:	0005a703          	lw	a4,0(a1)
8000a0a4:	01c42783          	lw	a5,28(s0)
8000a0a8:	0cf71c63          	bne	a4,a5,8000a180 <dhcp_arp_reply+0x114>
8000a0ac:	00050a13          	mv	s4,a0
8000a0b0:	00c00593          	li	a1,12
8000a0b4:	00040513          	mv	a0,s0
8000a0b8:	bf1fe0ef          	jal	ra,80008ca8 <dhcp_set_state>
8000a0bc:	00e10693          	addi	a3,sp,14
8000a0c0:	00400613          	li	a2,4
8000a0c4:	00040593          	mv	a1,s0
8000a0c8:	000a0513          	mv	a0,s4
8000a0cc:	c85fe0ef          	jal	ra,80008d50 <dhcp_create_msg>
8000a0d0:	00050913          	mv	s2,a0
8000a0d4:	08050863          	beqz	a0,8000a164 <dhcp_arp_reply+0xf8>
8000a0d8:	00452483          	lw	s1,4(a0)
8000a0dc:	00e15783          	lhu	a5,14(sp)
8000a0e0:	03200693          	li	a3,50
8000a0e4:	0f048493          	addi	s1,s1,240
8000a0e8:	00f48733          	add	a4,s1,a5
8000a0ec:	00278993          	addi	s3,a5,2
8000a0f0:	00178793          	addi	a5,a5,1
8000a0f4:	01079793          	slli	a5,a5,0x10
8000a0f8:	0107d793          	srli	a5,a5,0x10
8000a0fc:	00d70023          	sb	a3,0(a4)
8000a100:	00f487b3          	add	a5,s1,a5
8000a104:	00400713          	li	a4,4
8000a108:	00e78023          	sb	a4,0(a5)
8000a10c:	01c42503          	lw	a0,28(s0)
8000a110:	01099993          	slli	s3,s3,0x10
8000a114:	0109d993          	srli	s3,s3,0x10
8000a118:	01311723          	sh	s3,14(sp)
8000a11c:	cf1fb0ef          	jal	ra,80005e0c <lwip_htonl>
8000a120:	00050613          	mv	a2,a0
8000a124:	00048593          	mv	a1,s1
8000a128:	00098513          	mv	a0,s3
8000a12c:	bc5fe0ef          	jal	ra,80008cf0 <dhcp_option_long>
8000a130:	00090613          	mv	a2,s2
8000a134:	00048593          	mv	a1,s1
8000a138:	00a11723          	sh	a0,14(sp)
8000a13c:	db9fe0ef          	jal	ra,80008ef4 <dhcp_option_trailer>
8000a140:	8e41a503          	lw	a0,-1820(gp) # 80003124 <dhcp_pcb>
8000a144:	84818793          	addi	a5,gp,-1976 # 80003088 <ip_addr_any>
8000a148:	000a0713          	mv	a4,s4
8000a14c:	04300693          	li	a3,67
8000a150:	84418613          	addi	a2,gp,-1980 # 80003084 <ip_addr_broadcast>
8000a154:	00090593          	mv	a1,s2
8000a158:	e6cfe0ef          	jal	ra,800087c4 <udp_sendto_if_src>
8000a15c:	00090513          	mv	a0,s2
8000a160:	eb9fc0ef          	jal	ra,80007018 <pbuf_free>
8000a164:	00644783          	lbu	a5,6(s0)
8000a168:	0ff00713          	li	a4,255
8000a16c:	00e78663          	beq	a5,a4,8000a178 <dhcp_arp_reply+0x10c>
8000a170:	00178793          	addi	a5,a5,1
8000a174:	00f40323          	sb	a5,6(s0)
8000a178:	01400793          	li	a5,20
8000a17c:	00f41423          	sh	a5,8(s0)
8000a180:	02c12083          	lw	ra,44(sp)
8000a184:	02812403          	lw	s0,40(sp)
8000a188:	02412483          	lw	s1,36(sp)
8000a18c:	02012903          	lw	s2,32(sp)
8000a190:	01c12983          	lw	s3,28(sp)
8000a194:	01812a03          	lw	s4,24(sp)
8000a198:	03010113          	addi	sp,sp,48
8000a19c:	00008067          	ret
8000a1a0:	00008067          	ret

8000a1a4 <dhcp_renew>:
8000a1a4:	fd010113          	addi	sp,sp,-48
8000a1a8:	02112623          	sw	ra,44(sp)
8000a1ac:	02812423          	sw	s0,40(sp)
8000a1b0:	01312e23          	sw	s3,28(sp)
8000a1b4:	02912223          	sw	s1,36(sp)
8000a1b8:	03212023          	sw	s2,32(sp)
8000a1bc:	02852483          	lw	s1,40(a0)
8000a1c0:	00050993          	mv	s3,a0
8000a1c4:	00500593          	li	a1,5
8000a1c8:	00048513          	mv	a0,s1
8000a1cc:	addfe0ef          	jal	ra,80008ca8 <dhcp_set_state>
8000a1d0:	00e10693          	addi	a3,sp,14
8000a1d4:	00300613          	li	a2,3
8000a1d8:	00048593          	mv	a1,s1
8000a1dc:	00098513          	mv	a0,s3
8000a1e0:	b71fe0ef          	jal	ra,80008d50 <dhcp_create_msg>
8000a1e4:	fff00413          	li	s0,-1
8000a1e8:	10050063          	beqz	a0,8000a2e8 <dhcp_renew+0x144>
8000a1ec:	00452403          	lw	s0,4(a0)
8000a1f0:	00e15783          	lhu	a5,14(sp)
8000a1f4:	00050913          	mv	s2,a0
8000a1f8:	0f040413          	addi	s0,s0,240
8000a1fc:	00f40733          	add	a4,s0,a5
8000a200:	00278513          	addi	a0,a5,2
8000a204:	00178793          	addi	a5,a5,1
8000a208:	01079793          	slli	a5,a5,0x10
8000a20c:	03900693          	li	a3,57
8000a210:	0107d793          	srli	a5,a5,0x10
8000a214:	00d70023          	sb	a3,0(a4)
8000a218:	00f407b3          	add	a5,s0,a5
8000a21c:	00200713          	li	a4,2
8000a220:	00e78023          	sb	a4,0(a5)
8000a224:	02c9d603          	lhu	a2,44(s3)
8000a228:	01051513          	slli	a0,a0,0x10
8000a22c:	00040593          	mv	a1,s0
8000a230:	01055513          	srli	a0,a0,0x10
8000a234:	00a11723          	sh	a0,14(sp)
8000a238:	a89fe0ef          	jal	ra,80008cc0 <dhcp_option_short>
8000a23c:	00a40733          	add	a4,s0,a0
8000a240:	03700693          	li	a3,55
8000a244:	00d70023          	sb	a3,0(a4)
8000a248:	00150713          	addi	a4,a0,1
8000a24c:	01071713          	slli	a4,a4,0x10
8000a250:	01075713          	srli	a4,a4,0x10
8000a254:	00e40733          	add	a4,s0,a4
8000a258:	00300613          	li	a2,3
8000a25c:	00c70023          	sb	a2,0(a4)
8000a260:	00250713          	addi	a4,a0,2
8000a264:	01071713          	slli	a4,a4,0x10
8000a268:	01075713          	srli	a4,a4,0x10
8000a26c:	00e40733          	add	a4,s0,a4
8000a270:	00100693          	li	a3,1
8000a274:	00d70023          	sb	a3,0(a4)
8000a278:	00050793          	mv	a5,a0
8000a27c:	00350693          	addi	a3,a0,3
8000a280:	01069693          	slli	a3,a3,0x10
8000a284:	00478793          	addi	a5,a5,4
8000a288:	0106d693          	srli	a3,a3,0x10
8000a28c:	01079793          	slli	a5,a5,0x10
8000a290:	00d406b3          	add	a3,s0,a3
8000a294:	00550513          	addi	a0,a0,5
8000a298:	0107d793          	srli	a5,a5,0x10
8000a29c:	00c68023          	sb	a2,0(a3)
8000a2a0:	00f407b3          	add	a5,s0,a5
8000a2a4:	01c00713          	li	a4,28
8000a2a8:	01051513          	slli	a0,a0,0x10
8000a2ac:	00e78023          	sb	a4,0(a5)
8000a2b0:	01055513          	srli	a0,a0,0x10
8000a2b4:	00040593          	mv	a1,s0
8000a2b8:	00090613          	mv	a2,s2
8000a2bc:	00a11723          	sh	a0,14(sp)
8000a2c0:	c35fe0ef          	jal	ra,80008ef4 <dhcp_option_trailer>
8000a2c4:	8e41a503          	lw	a0,-1820(gp) # 80003124 <dhcp_pcb>
8000a2c8:	00098713          	mv	a4,s3
8000a2cc:	04300693          	li	a3,67
8000a2d0:	01848613          	addi	a2,s1,24
8000a2d4:	00090593          	mv	a1,s2
8000a2d8:	ee0fe0ef          	jal	ra,800089b8 <udp_sendto_if>
8000a2dc:	00050413          	mv	s0,a0
8000a2e0:	00090513          	mv	a0,s2
8000a2e4:	d35fc0ef          	jal	ra,80007018 <pbuf_free>
8000a2e8:	0064c783          	lbu	a5,6(s1)
8000a2ec:	0ff00713          	li	a4,255
8000a2f0:	00e78663          	beq	a5,a4,8000a2fc <dhcp_renew+0x158>
8000a2f4:	00178793          	addi	a5,a5,1
8000a2f8:	00f48323          	sb	a5,6(s1)
8000a2fc:	0064c503          	lbu	a0,6(s1)
8000a300:	00900793          	li	a5,9
8000a304:	04a7e863          	bltu	a5,a0,8000a354 <dhcp_renew+0x1b0>
8000a308:	00551793          	slli	a5,a0,0x5
8000a30c:	40a787b3          	sub	a5,a5,a0
8000a310:	00279793          	slli	a5,a5,0x2
8000a314:	00f50533          	add	a0,a0,a5
8000a318:	00451513          	slli	a0,a0,0x4
8000a31c:	01051513          	slli	a0,a0,0x10
8000a320:	01055513          	srli	a0,a0,0x10
8000a324:	1f400593          	li	a1,500
8000a328:	1f350513          	addi	a0,a0,499
8000a32c:	058030ef          	jal	ra,8000d384 <__divsi3>
8000a330:	00a49423          	sh	a0,8(s1)
8000a334:	02c12083          	lw	ra,44(sp)
8000a338:	00040513          	mv	a0,s0
8000a33c:	02812403          	lw	s0,40(sp)
8000a340:	02412483          	lw	s1,36(sp)
8000a344:	02012903          	lw	s2,32(sp)
8000a348:	01c12983          	lw	s3,28(sp)
8000a34c:	03010113          	addi	sp,sp,48
8000a350:	00008067          	ret
8000a354:	00005537          	lui	a0,0x5
8000a358:	e2050513          	addi	a0,a0,-480 # 4e20 <_stack_size+0x4620>
8000a35c:	fc9ff06f          	j	8000a324 <dhcp_renew+0x180>

8000a360 <dhcp_supplied_address>:
8000a360:	02050863          	beqz	a0,8000a390 <dhcp_supplied_address+0x30>
8000a364:	02852783          	lw	a5,40(a0)
8000a368:	00000513          	li	a0,0
8000a36c:	02078463          	beqz	a5,8000a394 <dhcp_supplied_address+0x34>
8000a370:	0057c783          	lbu	a5,5(a5)
8000a374:	00a00713          	li	a4,10
8000a378:	00100513          	li	a0,1
8000a37c:	00e78663          	beq	a5,a4,8000a388 <dhcp_supplied_address+0x28>
8000a380:	ffc78513          	addi	a0,a5,-4
8000a384:	00253513          	sltiu	a0,a0,2
8000a388:	0ff57513          	andi	a0,a0,255
8000a38c:	00008067          	ret
8000a390:	00000513          	li	a0,0
8000a394:	00008067          	ret

8000a398 <dhcp_release_and_stop>:
8000a398:	fd010113          	addi	sp,sp,-48
8000a39c:	02112623          	sw	ra,44(sp)
8000a3a0:	02812423          	sw	s0,40(sp)
8000a3a4:	02912223          	sw	s1,36(sp)
8000a3a8:	03212023          	sw	s2,32(sp)
8000a3ac:	01312e23          	sw	s3,28(sp)
8000a3b0:	01412c23          	sw	s4,24(sp)
8000a3b4:	02852403          	lw	s0,40(a0)
8000a3b8:	10040e63          	beqz	s0,8000a4d4 <dhcp_release_and_stop+0x13c>
8000a3bc:	00544783          	lbu	a5,5(s0)
8000a3c0:	10078a63          	beqz	a5,8000a4d4 <dhcp_release_and_stop+0x13c>
8000a3c4:	01842783          	lw	a5,24(s0)
8000a3c8:	00042e23          	sw	zero,28(s0)
8000a3cc:	00042c23          	sw	zero,24(s0)
8000a3d0:	02042023          	sw	zero,32(s0)
8000a3d4:	02042223          	sw	zero,36(s0)
8000a3d8:	02042823          	sw	zero,48(s0)
8000a3dc:	02042623          	sw	zero,44(s0)
8000a3e0:	02042423          	sw	zero,40(s0)
8000a3e4:	00041723          	sh	zero,14(s0)
8000a3e8:	00042823          	sw	zero,16(s0)
8000a3ec:	00041a23          	sh	zero,20(s0)
8000a3f0:	00050493          	mv	s1,a0
8000a3f4:	00f12623          	sw	a5,12(sp)
8000a3f8:	f69ff0ef          	jal	ra,8000a360 <dhcp_supplied_address>
8000a3fc:	0a050463          	beqz	a0,8000a4a4 <dhcp_release_and_stop+0x10c>
8000a400:	00a10693          	addi	a3,sp,10
8000a404:	00700613          	li	a2,7
8000a408:	00040593          	mv	a1,s0
8000a40c:	00048513          	mv	a0,s1
8000a410:	941fe0ef          	jal	ra,80008d50 <dhcp_create_msg>
8000a414:	00050993          	mv	s3,a0
8000a418:	08050663          	beqz	a0,8000a4a4 <dhcp_release_and_stop+0x10c>
8000a41c:	00452903          	lw	s2,4(a0)
8000a420:	00a15783          	lhu	a5,10(sp)
8000a424:	03600693          	li	a3,54
8000a428:	0f090913          	addi	s2,s2,240
8000a42c:	00f90733          	add	a4,s2,a5
8000a430:	00278a13          	addi	s4,a5,2
8000a434:	00178793          	addi	a5,a5,1
8000a438:	01079793          	slli	a5,a5,0x10
8000a43c:	0107d793          	srli	a5,a5,0x10
8000a440:	00d70023          	sb	a3,0(a4)
8000a444:	00f907b3          	add	a5,s2,a5
8000a448:	00400713          	li	a4,4
8000a44c:	00e78023          	sb	a4,0(a5)
8000a450:	00c12503          	lw	a0,12(sp)
8000a454:	010a1a13          	slli	s4,s4,0x10
8000a458:	010a5a13          	srli	s4,s4,0x10
8000a45c:	01411523          	sh	s4,10(sp)
8000a460:	9adfb0ef          	jal	ra,80005e0c <lwip_htonl>
8000a464:	00050613          	mv	a2,a0
8000a468:	00090593          	mv	a1,s2
8000a46c:	000a0513          	mv	a0,s4
8000a470:	881fe0ef          	jal	ra,80008cf0 <dhcp_option_long>
8000a474:	00098613          	mv	a2,s3
8000a478:	00090593          	mv	a1,s2
8000a47c:	00a11523          	sh	a0,10(sp)
8000a480:	a75fe0ef          	jal	ra,80008ef4 <dhcp_option_trailer>
8000a484:	8e41a503          	lw	a0,-1820(gp) # 80003124 <dhcp_pcb>
8000a488:	00048713          	mv	a4,s1
8000a48c:	04300693          	li	a3,67
8000a490:	00c10613          	addi	a2,sp,12
8000a494:	00098593          	mv	a1,s3
8000a498:	d20fe0ef          	jal	ra,800089b8 <udp_sendto_if>
8000a49c:	00098513          	mv	a0,s3
8000a4a0:	b79fc0ef          	jal	ra,80007018 <pbuf_free>
8000a4a4:	84818693          	addi	a3,gp,-1976 # 80003088 <ip_addr_any>
8000a4a8:	84818613          	addi	a2,gp,-1976 # 80003088 <ip_addr_any>
8000a4ac:	00048513          	mv	a0,s1
8000a4b0:	84818593          	addi	a1,gp,-1976 # 80003088 <ip_addr_any>
8000a4b4:	c2cfc0ef          	jal	ra,800068e0 <netif_set_addr>
8000a4b8:	00000593          	li	a1,0
8000a4bc:	00040513          	mv	a0,s0
8000a4c0:	fe8fe0ef          	jal	ra,80008ca8 <dhcp_set_state>
8000a4c4:	00444783          	lbu	a5,4(s0)
8000a4c8:	00078663          	beqz	a5,8000a4d4 <dhcp_release_and_stop+0x13c>
8000a4cc:	c60ff0ef          	jal	ra,8000992c <dhcp_dec_pcb_refcount>
8000a4d0:	00040223          	sb	zero,4(s0)
8000a4d4:	02c12083          	lw	ra,44(sp)
8000a4d8:	02812403          	lw	s0,40(sp)
8000a4dc:	02412483          	lw	s1,36(sp)
8000a4e0:	02012903          	lw	s2,32(sp)
8000a4e4:	01c12983          	lw	s3,28(sp)
8000a4e8:	01812a03          	lw	s4,24(sp)
8000a4ec:	03010113          	addi	sp,sp,48
8000a4f0:	00008067          	ret

8000a4f4 <dhcp_start>:
8000a4f4:	ff010113          	addi	sp,sp,-16
8000a4f8:	00912223          	sw	s1,4(sp)
8000a4fc:	00112623          	sw	ra,12(sp)
8000a500:	00812423          	sw	s0,8(sp)
8000a504:	01212023          	sw	s2,0(sp)
8000a508:	ff000493          	li	s1,-16
8000a50c:	08050263          	beqz	a0,8000a590 <dhcp_start+0x9c>
8000a510:	03554783          	lbu	a5,53(a0)
8000a514:	ff000493          	li	s1,-16
8000a518:	0017f793          	andi	a5,a5,1
8000a51c:	06078a63          	beqz	a5,8000a590 <dhcp_start+0x9c>
8000a520:	02c55703          	lhu	a4,44(a0)
8000a524:	23f00793          	li	a5,575
8000a528:	02852903          	lw	s2,40(a0)
8000a52c:	00e7e663          	bltu	a5,a4,8000a538 <dhcp_start+0x44>
8000a530:	fff00493          	li	s1,-1
8000a534:	05c0006f          	j	8000a590 <dhcp_start+0x9c>
8000a538:	00050413          	mv	s0,a0
8000a53c:	06091863          	bnez	s2,8000a5ac <dhcp_start+0xb8>
8000a540:	03400513          	li	a0,52
8000a544:	8b0fc0ef          	jal	ra,800065f4 <lwip_malloc>
8000a548:	00050913          	mv	s2,a0
8000a54c:	fe0502e3          	beqz	a0,8000a530 <dhcp_start+0x3c>
8000a550:	02a42423          	sw	a0,40(s0)
8000a554:	03400613          	li	a2,52
8000a558:	00000593          	li	a1,0
8000a55c:	00090513          	mv	a0,s2
8000a560:	71c020ef          	jal	ra,8000cc7c <memset>
8000a564:	a48ff0ef          	jal	ra,800097ac <dhcp_inc_pcb_refcount>
8000a568:	00050493          	mv	s1,a0
8000a56c:	fc0512e3          	bnez	a0,8000a530 <dhcp_start+0x3c>
8000a570:	00100793          	li	a5,1
8000a574:	00f90223          	sb	a5,4(s2)
8000a578:	03544783          	lbu	a5,53(s0)
8000a57c:	0047f793          	andi	a5,a5,4
8000a580:	02079e63          	bnez	a5,8000a5bc <dhcp_start+0xc8>
8000a584:	00200593          	li	a1,2
8000a588:	00090513          	mv	a0,s2
8000a58c:	f1cfe0ef          	jal	ra,80008ca8 <dhcp_set_state>
8000a590:	00c12083          	lw	ra,12(sp)
8000a594:	00812403          	lw	s0,8(sp)
8000a598:	00048513          	mv	a0,s1
8000a59c:	00012903          	lw	s2,0(sp)
8000a5a0:	00412483          	lw	s1,4(sp)
8000a5a4:	01010113          	addi	sp,sp,16
8000a5a8:	00008067          	ret
8000a5ac:	00494783          	lbu	a5,4(s2)
8000a5b0:	fa0782e3          	beqz	a5,8000a554 <dhcp_start+0x60>
8000a5b4:	b78ff0ef          	jal	ra,8000992c <dhcp_dec_pcb_refcount>
8000a5b8:	f9dff06f          	j	8000a554 <dhcp_start+0x60>
8000a5bc:	00040513          	mv	a0,s0
8000a5c0:	e11fe0ef          	jal	ra,800093d0 <dhcp_discover>
8000a5c4:	00050493          	mv	s1,a0
8000a5c8:	fc0504e3          	beqz	a0,8000a590 <dhcp_start+0x9c>
8000a5cc:	00040513          	mv	a0,s0
8000a5d0:	dc9ff0ef          	jal	ra,8000a398 <dhcp_release_and_stop>
8000a5d4:	f5dff06f          	j	8000a530 <dhcp_start+0x3c>

8000a5d8 <dhcp_coarse_tmr>:
8000a5d8:	fc010113          	addi	sp,sp,-64
8000a5dc:	02812c23          	sw	s0,56(sp)
8000a5e0:	8cc1a403          	lw	s0,-1844(gp) # 8000310c <netif_list>
8000a5e4:	03312623          	sw	s3,44(sp)
8000a5e8:	000029b7          	lui	s3,0x2
8000a5ec:	03212823          	sw	s2,48(sp)
8000a5f0:	03412423          	sw	s4,40(sp)
8000a5f4:	03512223          	sw	s5,36(sp)
8000a5f8:	03612023          	sw	s6,32(sp)
8000a5fc:	01712e23          	sw	s7,28(sp)
8000a600:	02112e23          	sw	ra,60(sp)
8000a604:	02912a23          	sw	s1,52(sp)
8000a608:	01812c23          	sw	s8,24(sp)
8000a60c:	01912a23          	sw	s9,20(sp)
8000a610:	00100913          	li	s2,1
8000a614:	00a00a13          	li	s4,10
8000a618:	43200a93          	li	s5,1074
8000a61c:	71098993          	addi	s3,s3,1808 # 2710 <_stack_size+0x1f10>
8000a620:	02041c63          	bnez	s0,8000a658 <dhcp_coarse_tmr+0x80>
8000a624:	03c12083          	lw	ra,60(sp)
8000a628:	03812403          	lw	s0,56(sp)
8000a62c:	03412483          	lw	s1,52(sp)
8000a630:	03012903          	lw	s2,48(sp)
8000a634:	02c12983          	lw	s3,44(sp)
8000a638:	02812a03          	lw	s4,40(sp)
8000a63c:	02412a83          	lw	s5,36(sp)
8000a640:	02012b03          	lw	s6,32(sp)
8000a644:	01c12b83          	lw	s7,28(sp)
8000a648:	01812c03          	lw	s8,24(sp)
8000a64c:	01412c83          	lw	s9,20(sp)
8000a650:	04010113          	addi	sp,sp,64
8000a654:	00008067          	ret
8000a658:	02842783          	lw	a5,40(s0)
8000a65c:	02078e63          	beqz	a5,8000a698 <dhcp_coarse_tmr+0xc0>
8000a660:	0057c703          	lbu	a4,5(a5)
8000a664:	02070a63          	beqz	a4,8000a698 <dhcp_coarse_tmr+0xc0>
8000a668:	0147d683          	lhu	a3,20(a5)
8000a66c:	02068a63          	beqz	a3,8000a6a0 <dhcp_coarse_tmr+0xc8>
8000a670:	0127d703          	lhu	a4,18(a5)
8000a674:	00170713          	addi	a4,a4,1
8000a678:	01071713          	slli	a4,a4,0x10
8000a67c:	01075713          	srli	a4,a4,0x10
8000a680:	00e79923          	sh	a4,18(a5)
8000a684:	00e69e63          	bne	a3,a4,8000a6a0 <dhcp_coarse_tmr+0xc8>
8000a688:	00040513          	mv	a0,s0
8000a68c:	d0dff0ef          	jal	ra,8000a398 <dhcp_release_and_stop>
8000a690:	00040513          	mv	a0,s0
8000a694:	e61ff0ef          	jal	ra,8000a4f4 <dhcp_start>
8000a698:	00042403          	lw	s0,0(s0)
8000a69c:	f85ff06f          	j	8000a620 <dhcp_coarse_tmr+0x48>
8000a6a0:	0107d703          	lhu	a4,16(a5)
8000a6a4:	1a070663          	beqz	a4,8000a850 <dhcp_coarse_tmr+0x278>
8000a6a8:	fff70693          	addi	a3,a4,-1
8000a6ac:	00d79823          	sh	a3,16(a5)
8000a6b0:	1b271063          	bne	a4,s2,8000a850 <dhcp_coarse_tmr+0x278>
8000a6b4:	02842c03          	lw	s8,40(s0)
8000a6b8:	005c4783          	lbu	a5,5(s8)
8000a6bc:	fcfa6ee3          	bltu	s4,a5,8000a698 <dhcp_coarse_tmr+0xc0>
8000a6c0:	00fad7b3          	srl	a5,s5,a5
8000a6c4:	0017f793          	andi	a5,a5,1
8000a6c8:	fc0788e3          	beqz	a5,8000a698 <dhcp_coarse_tmr+0xc0>
8000a6cc:	00400593          	li	a1,4
8000a6d0:	000c0513          	mv	a0,s8
8000a6d4:	dd4fe0ef          	jal	ra,80008ca8 <dhcp_set_state>
8000a6d8:	00e10693          	addi	a3,sp,14
8000a6dc:	00300613          	li	a2,3
8000a6e0:	000c0593          	mv	a1,s8
8000a6e4:	00040513          	mv	a0,s0
8000a6e8:	e68fe0ef          	jal	ra,80008d50 <dhcp_create_msg>
8000a6ec:	00050c93          	mv	s9,a0
8000a6f0:	0e050a63          	beqz	a0,8000a7e4 <dhcp_coarse_tmr+0x20c>
8000a6f4:	00452483          	lw	s1,4(a0)
8000a6f8:	00e15783          	lhu	a5,14(sp)
8000a6fc:	03900693          	li	a3,57
8000a700:	0f048493          	addi	s1,s1,240
8000a704:	00f48733          	add	a4,s1,a5
8000a708:	00278513          	addi	a0,a5,2
8000a70c:	00178793          	addi	a5,a5,1
8000a710:	01079793          	slli	a5,a5,0x10
8000a714:	0107d793          	srli	a5,a5,0x10
8000a718:	00d70023          	sb	a3,0(a4)
8000a71c:	00f487b3          	add	a5,s1,a5
8000a720:	00200713          	li	a4,2
8000a724:	00e78023          	sb	a4,0(a5)
8000a728:	02c45603          	lhu	a2,44(s0)
8000a72c:	01051513          	slli	a0,a0,0x10
8000a730:	01055513          	srli	a0,a0,0x10
8000a734:	00048593          	mv	a1,s1
8000a738:	00a11723          	sh	a0,14(sp)
8000a73c:	d84fe0ef          	jal	ra,80008cc0 <dhcp_option_short>
8000a740:	00a48733          	add	a4,s1,a0
8000a744:	03700693          	li	a3,55
8000a748:	00d70023          	sb	a3,0(a4)
8000a74c:	00150713          	addi	a4,a0,1
8000a750:	01071713          	slli	a4,a4,0x10
8000a754:	01075713          	srli	a4,a4,0x10
8000a758:	00300693          	li	a3,3
8000a75c:	00e48733          	add	a4,s1,a4
8000a760:	00d70023          	sb	a3,0(a4)
8000a764:	00250713          	addi	a4,a0,2
8000a768:	01071713          	slli	a4,a4,0x10
8000a76c:	01075713          	srli	a4,a4,0x10
8000a770:	00e48733          	add	a4,s1,a4
8000a774:	01270023          	sb	s2,0(a4)
8000a778:	00050793          	mv	a5,a0
8000a77c:	00350713          	addi	a4,a0,3
8000a780:	01071713          	slli	a4,a4,0x10
8000a784:	00478793          	addi	a5,a5,4
8000a788:	01075713          	srli	a4,a4,0x10
8000a78c:	01079793          	slli	a5,a5,0x10
8000a790:	00e48733          	add	a4,s1,a4
8000a794:	00550513          	addi	a0,a0,5
8000a798:	0107d793          	srli	a5,a5,0x10
8000a79c:	00d70023          	sb	a3,0(a4)
8000a7a0:	00f487b3          	add	a5,s1,a5
8000a7a4:	01c00713          	li	a4,28
8000a7a8:	01051513          	slli	a0,a0,0x10
8000a7ac:	00e78023          	sb	a4,0(a5)
8000a7b0:	01055513          	srli	a0,a0,0x10
8000a7b4:	000c8613          	mv	a2,s9
8000a7b8:	00048593          	mv	a1,s1
8000a7bc:	00a11723          	sh	a0,14(sp)
8000a7c0:	f34fe0ef          	jal	ra,80008ef4 <dhcp_option_trailer>
8000a7c4:	8e41a503          	lw	a0,-1820(gp) # 80003124 <dhcp_pcb>
8000a7c8:	00040713          	mv	a4,s0
8000a7cc:	04300693          	li	a3,67
8000a7d0:	84418613          	addi	a2,gp,-1980 # 80003084 <ip_addr_broadcast>
8000a7d4:	000c8593          	mv	a1,s9
8000a7d8:	9e0fe0ef          	jal	ra,800089b8 <udp_sendto_if>
8000a7dc:	000c8513          	mv	a0,s9
8000a7e0:	839fc0ef          	jal	ra,80007018 <pbuf_free>
8000a7e4:	006c4783          	lbu	a5,6(s8)
8000a7e8:	0ff00713          	li	a4,255
8000a7ec:	00e78663          	beq	a5,a4,8000a7f8 <dhcp_coarse_tmr+0x220>
8000a7f0:	00178793          	addi	a5,a5,1
8000a7f4:	00fc0323          	sb	a5,6(s8)
8000a7f8:	006c4783          	lbu	a5,6(s8)
8000a7fc:	00900713          	li	a4,9
8000a800:	00098513          	mv	a0,s3
8000a804:	02f76063          	bltu	a4,a5,8000a824 <dhcp_coarse_tmr+0x24c>
8000a808:	00579513          	slli	a0,a5,0x5
8000a80c:	40f50533          	sub	a0,a0,a5
8000a810:	00251513          	slli	a0,a0,0x2
8000a814:	00a787b3          	add	a5,a5,a0
8000a818:	00379793          	slli	a5,a5,0x3
8000a81c:	01079513          	slli	a0,a5,0x10
8000a820:	01055513          	srli	a0,a0,0x10
8000a824:	1f400593          	li	a1,500
8000a828:	1f350513          	addi	a0,a0,499
8000a82c:	359020ef          	jal	ra,8000d384 <__divsi3>
8000a830:	014c5783          	lhu	a5,20(s8)
8000a834:	012c5703          	lhu	a4,18(s8)
8000a838:	00ac1423          	sh	a0,8(s8)
8000a83c:	40e787b3          	sub	a5,a5,a4
8000a840:	e4f95ce3          	bge	s2,a5,8000a698 <dhcp_coarse_tmr+0xc0>
8000a844:	4017d793          	srai	a5,a5,0x1
8000a848:	00fc1823          	sh	a5,16(s8)
8000a84c:	e4dff06f          	j	8000a698 <dhcp_coarse_tmr+0xc0>
8000a850:	00e7d703          	lhu	a4,14(a5)
8000a854:	e40702e3          	beqz	a4,8000a698 <dhcp_coarse_tmr+0xc0>
8000a858:	fff70693          	addi	a3,a4,-1
8000a85c:	00d79723          	sh	a3,14(a5)
8000a860:	e3271ce3          	bne	a4,s2,8000a698 <dhcp_coarse_tmr+0xc0>
8000a864:	02842483          	lw	s1,40(s0)
8000a868:	0054c783          	lbu	a5,5(s1)
8000a86c:	0fb7f713          	andi	a4,a5,251
8000a870:	01270463          	beq	a4,s2,8000a878 <dhcp_coarse_tmr+0x2a0>
8000a874:	e34792e3          	bne	a5,s4,8000a698 <dhcp_coarse_tmr+0xc0>
8000a878:	00040513          	mv	a0,s0
8000a87c:	929ff0ef          	jal	ra,8000a1a4 <dhcp_renew>
8000a880:	00c4d783          	lhu	a5,12(s1)
8000a884:	0124d703          	lhu	a4,18(s1)
8000a888:	40e787b3          	sub	a5,a5,a4
8000a88c:	e0f956e3          	bge	s2,a5,8000a698 <dhcp_coarse_tmr+0xc0>
8000a890:	4017d793          	srai	a5,a5,0x1
8000a894:	00f49723          	sh	a5,14(s1)
8000a898:	e01ff06f          	j	8000a698 <dhcp_coarse_tmr+0xc0>

8000a89c <dhcp_fine_tmr>:
8000a89c:	fe010113          	addi	sp,sp,-32
8000a8a0:	00812c23          	sw	s0,24(sp)
8000a8a4:	8cc1a403          	lw	s0,-1844(gp) # 8000310c <netif_list>
8000a8a8:	00912a23          	sw	s1,20(sp)
8000a8ac:	01212823          	sw	s2,16(sp)
8000a8b0:	01312623          	sw	s3,12(sp)
8000a8b4:	01412423          	sw	s4,8(sp)
8000a8b8:	01512223          	sw	s5,4(sp)
8000a8bc:	01612023          	sw	s6,0(sp)
8000a8c0:	00112e23          	sw	ra,28(sp)
8000a8c4:	00100493          	li	s1,1
8000a8c8:	00c00913          	li	s2,12
8000a8cc:	00600993          	li	s3,6
8000a8d0:	00800a13          	li	s4,8
8000a8d4:	00300a93          	li	s5,3
8000a8d8:	00500b13          	li	s6,5
8000a8dc:	02041663          	bnez	s0,8000a908 <dhcp_fine_tmr+0x6c>
8000a8e0:	01c12083          	lw	ra,28(sp)
8000a8e4:	01812403          	lw	s0,24(sp)
8000a8e8:	01412483          	lw	s1,20(sp)
8000a8ec:	01012903          	lw	s2,16(sp)
8000a8f0:	00c12983          	lw	s3,12(sp)
8000a8f4:	00812a03          	lw	s4,8(sp)
8000a8f8:	00412a83          	lw	s5,4(sp)
8000a8fc:	00012b03          	lw	s6,0(sp)
8000a900:	02010113          	addi	sp,sp,32
8000a904:	00008067          	ret
8000a908:	02842703          	lw	a4,40(s0)
8000a90c:	00070a63          	beqz	a4,8000a920 <dhcp_fine_tmr+0x84>
8000a910:	00875783          	lhu	a5,8(a4)
8000a914:	00f4fa63          	bgeu	s1,a5,8000a928 <dhcp_fine_tmr+0x8c>
8000a918:	fff78793          	addi	a5,a5,-1
8000a91c:	00f71423          	sh	a5,8(a4)
8000a920:	00042403          	lw	s0,0(s0)
8000a924:	fb9ff06f          	j	8000a8dc <dhcp_fine_tmr+0x40>
8000a928:	fe979ce3          	bne	a5,s1,8000a920 <dhcp_fine_tmr+0x84>
8000a92c:	00071423          	sh	zero,8(a4)
8000a930:	02842703          	lw	a4,40(s0)
8000a934:	00574783          	lbu	a5,5(a4)
8000a938:	01278463          	beq	a5,s2,8000a940 <dhcp_fine_tmr+0xa4>
8000a93c:	01379863          	bne	a5,s3,8000a94c <dhcp_fine_tmr+0xb0>
8000a940:	00040513          	mv	a0,s0
8000a944:	a8dfe0ef          	jal	ra,800093d0 <dhcp_discover>
8000a948:	fd9ff06f          	j	8000a920 <dhcp_fine_tmr+0x84>
8000a94c:	02979463          	bne	a5,s1,8000a974 <dhcp_fine_tmr+0xd8>
8000a950:	00674783          	lbu	a5,6(a4)
8000a954:	00040513          	mv	a0,s0
8000a958:	00fb6663          	bltu	s6,a5,8000a964 <dhcp_fine_tmr+0xc8>
8000a95c:	ff8fe0ef          	jal	ra,80009154 <dhcp_select>
8000a960:	fc1ff06f          	j	8000a920 <dhcp_fine_tmr+0x84>
8000a964:	a35ff0ef          	jal	ra,8000a398 <dhcp_release_and_stop>
8000a968:	00040513          	mv	a0,s0
8000a96c:	b89ff0ef          	jal	ra,8000a4f4 <dhcp_start>
8000a970:	fb1ff06f          	j	8000a920 <dhcp_fine_tmr+0x84>
8000a974:	03479063          	bne	a5,s4,8000a994 <dhcp_fine_tmr+0xf8>
8000a978:	00674783          	lbu	a5,6(a4)
8000a97c:	00040513          	mv	a0,s0
8000a980:	00f4e663          	bltu	s1,a5,8000a98c <dhcp_fine_tmr+0xf0>
8000a984:	c11fe0ef          	jal	ra,80009594 <dhcp_check>
8000a988:	f99ff06f          	j	8000a920 <dhcp_fine_tmr+0x84>
8000a98c:	c6dfe0ef          	jal	ra,800095f8 <dhcp_bind>
8000a990:	f91ff06f          	j	8000a920 <dhcp_fine_tmr+0x84>
8000a994:	f95796e3          	bne	a5,s5,8000a920 <dhcp_fine_tmr+0x84>
8000a998:	00674783          	lbu	a5,6(a4)
8000a99c:	00040513          	mv	a0,s0
8000a9a0:	faf4e2e3          	bltu	s1,a5,8000a944 <dhcp_fine_tmr+0xa8>
8000a9a4:	da0fe0ef          	jal	ra,80008f44 <dhcp_reboot>
8000a9a8:	f79ff06f          	j	8000a920 <dhcp_fine_tmr+0x84>

8000a9ac <dhcp_release>:
8000a9ac:	ff010113          	addi	sp,sp,-16
8000a9b0:	00112623          	sw	ra,12(sp)
8000a9b4:	9e5ff0ef          	jal	ra,8000a398 <dhcp_release_and_stop>
8000a9b8:	00c12083          	lw	ra,12(sp)
8000a9bc:	00000513          	li	a0,0
8000a9c0:	01010113          	addi	sp,sp,16
8000a9c4:	00008067          	ret

8000a9c8 <dhcp_stop>:
8000a9c8:	9d1ff06f          	j	8000a398 <dhcp_release_and_stop>

8000a9cc <etharp_free_entry>:
8000a9cc:	fe010113          	addi	sp,sp,-32
8000a9d0:	00912a23          	sw	s1,20(sp)
8000a9d4:	00151493          	slli	s1,a0,0x1
8000a9d8:	00a48733          	add	a4,s1,a0
8000a9dc:	01212823          	sw	s2,16(sp)
8000a9e0:	00371713          	slli	a4,a4,0x3
8000a9e4:	b4418913          	addi	s2,gp,-1212 # 80003384 <arp_table>
8000a9e8:	00812c23          	sw	s0,24(sp)
8000a9ec:	01312623          	sw	s3,12(sp)
8000a9f0:	00112e23          	sw	ra,28(sp)
8000a9f4:	00e90933          	add	s2,s2,a4
8000a9f8:	00050993          	mv	s3,a0
8000a9fc:	00092503          	lw	a0,0(s2)
8000aa00:	b4418413          	addi	s0,gp,-1212 # 80003384 <arp_table>
8000aa04:	00050663          	beqz	a0,8000aa10 <etharp_free_entry+0x44>
8000aa08:	e10fc0ef          	jal	ra,80007018 <pbuf_free>
8000aa0c:	00092023          	sw	zero,0(s2)
8000aa10:	01348533          	add	a0,s1,s3
8000aa14:	00351513          	slli	a0,a0,0x3
8000aa18:	00a40533          	add	a0,s0,a0
8000aa1c:	00050a23          	sb	zero,20(a0)
8000aa20:	00051923          	sh	zero,18(a0)
8000aa24:	00052423          	sw	zero,8(a0)
8000aa28:	00052223          	sw	zero,4(a0)
8000aa2c:	00600613          	li	a2,6
8000aa30:	84c18593          	addi	a1,gp,-1972 # 8000308c <ethzero>
8000aa34:	00c50513          	addi	a0,a0,12
8000aa38:	67c030ef          	jal	ra,8000e0b4 <memcpy>
8000aa3c:	01c12083          	lw	ra,28(sp)
8000aa40:	01812403          	lw	s0,24(sp)
8000aa44:	01412483          	lw	s1,20(sp)
8000aa48:	01012903          	lw	s2,16(sp)
8000aa4c:	00c12983          	lw	s3,12(sp)
8000aa50:	02010113          	addi	sp,sp,32
8000aa54:	00008067          	ret

8000aa58 <etharp_find_entry>:
8000aa58:	fe010113          	addi	sp,sp,-32
8000aa5c:	00812c23          	sw	s0,24(sp)
8000aa60:	00912a23          	sw	s1,20(sp)
8000aa64:	b4418693          	addi	a3,gp,-1212 # 80003384 <arp_table>
8000aa68:	00112e23          	sw	ra,28(sp)
8000aa6c:	01212823          	sw	s2,16(sp)
8000aa70:	01312623          	sw	s3,12(sp)
8000aa74:	00000293          	li	t0,0
8000aa78:	00000f93          	li	t6,0
8000aa7c:	00000f13          	li	t5,0
8000aa80:	00a00313          	li	t1,10
8000aa84:	00000793          	li	a5,0
8000aa88:	00a00713          	li	a4,10
8000aa8c:	00a00893          	li	a7,10
8000aa90:	00a00493          	li	s1,10
8000aa94:	b4418413          	addi	s0,gp,-1212 # 80003384 <arp_table>
8000aa98:	00a00e13          	li	t3,10
8000aa9c:	00100393          	li	t2,1
8000aaa0:	0146ce83          	lbu	t4,20(a3)
8000aaa4:	05c71263          	bne	a4,t3,8000aae8 <etharp_find_entry+0x90>
8000aaa8:	100e8463          	beqz	t4,8000abb0 <etharp_find_entry+0x158>
8000aaac:	00050e63          	beqz	a0,8000aac8 <etharp_find_entry+0x70>
8000aab0:	00052903          	lw	s2,0(a0)
8000aab4:	0046a803          	lw	a6,4(a3)
8000aab8:	01091863          	bne	s2,a6,8000aac8 <etharp_find_entry+0x70>
8000aabc:	0a060a63          	beqz	a2,8000ab70 <etharp_find_entry+0x118>
8000aac0:	0086a803          	lw	a6,8(a3)
8000aac4:	0ac80663          	beq	a6,a2,8000ab70 <etharp_find_entry+0x118>
8000aac8:	0126d803          	lhu	a6,18(a3)
8000aacc:	0c7e9a63          	bne	t4,t2,8000aba0 <etharp_find_entry+0x148>
8000aad0:	0006ae83          	lw	t4,0(a3)
8000aad4:	0a0e8e63          	beqz	t4,8000ab90 <etharp_find_entry+0x138>
8000aad8:	01e86a63          	bltu	a6,t5,8000aaec <etharp_find_entry+0x94>
8000aadc:	00080f13          	mv	t5,a6
8000aae0:	00078313          	mv	t1,a5
8000aae4:	0080006f          	j	8000aaec <etharp_find_entry+0x94>
8000aae8:	fc0e92e3          	bnez	t4,8000aaac <etharp_find_entry+0x54>
8000aaec:	00178793          	addi	a5,a5,1
8000aaf0:	01079813          	slli	a6,a5,0x10
8000aaf4:	01085813          	srli	a6,a6,0x10
8000aaf8:	01081793          	slli	a5,a6,0x10
8000aafc:	01868693          	addi	a3,a3,24
8000ab00:	4107d793          	srai	a5,a5,0x10
8000ab04:	f9c81ee3          	bne	a6,t3,8000aaa0 <etharp_find_entry+0x48>
8000ab08:	00100693          	li	a3,1
8000ab0c:	fff00793          	li	a5,-1
8000ab10:	06d59063          	bne	a1,a3,8000ab70 <etharp_find_entry+0x118>
8000ab14:	00060993          	mv	s3,a2
8000ab18:	00050913          	mv	s2,a0
8000ab1c:	03c71063          	bne	a4,t3,8000ab3c <etharp_find_entry+0xe4>
8000ab20:	08e89c63          	bne	a7,a4,8000abb8 <etharp_find_entry+0x160>
8000ab24:	01149663          	bne	s1,a7,8000ab30 <etharp_find_entry+0xd8>
8000ab28:	04930463          	beq	t1,s1,8000ab70 <etharp_find_entry+0x118>
8000ab2c:	00030493          	mv	s1,t1
8000ab30:	00048513          	mv	a0,s1
8000ab34:	e99ff0ef          	jal	ra,8000a9cc <etharp_free_entry>
8000ab38:	00048713          	mv	a4,s1
8000ab3c:	00171793          	slli	a5,a4,0x1
8000ab40:	00090c63          	beqz	s2,8000ab58 <etharp_find_entry+0x100>
8000ab44:	00092603          	lw	a2,0(s2)
8000ab48:	00e786b3          	add	a3,a5,a4
8000ab4c:	00369693          	slli	a3,a3,0x3
8000ab50:	00d406b3          	add	a3,s0,a3
8000ab54:	00c6a223          	sw	a2,4(a3)
8000ab58:	00e787b3          	add	a5,a5,a4
8000ab5c:	00379793          	slli	a5,a5,0x3
8000ab60:	00f407b3          	add	a5,s0,a5
8000ab64:	00079923          	sh	zero,18(a5)
8000ab68:	0137a423          	sw	s3,8(a5)
8000ab6c:	00070793          	mv	a5,a4
8000ab70:	01c12083          	lw	ra,28(sp)
8000ab74:	01812403          	lw	s0,24(sp)
8000ab78:	01412483          	lw	s1,20(sp)
8000ab7c:	01012903          	lw	s2,16(sp)
8000ab80:	00c12983          	lw	s3,12(sp)
8000ab84:	00078513          	mv	a0,a5
8000ab88:	02010113          	addi	sp,sp,32
8000ab8c:	00008067          	ret
8000ab90:	f5f86ee3          	bltu	a6,t6,8000aaec <etharp_find_entry+0x94>
8000ab94:	00080f93          	mv	t6,a6
8000ab98:	00078493          	mv	s1,a5
8000ab9c:	f51ff06f          	j	8000aaec <etharp_find_entry+0x94>
8000aba0:	f45866e3          	bltu	a6,t0,8000aaec <etharp_find_entry+0x94>
8000aba4:	00080293          	mv	t0,a6
8000aba8:	00078893          	mv	a7,a5
8000abac:	f41ff06f          	j	8000aaec <etharp_find_entry+0x94>
8000abb0:	00078713          	mv	a4,a5
8000abb4:	f39ff06f          	j	8000aaec <etharp_find_entry+0x94>
8000abb8:	00088493          	mv	s1,a7
8000abbc:	f75ff06f          	j	8000ab30 <etharp_find_entry+0xd8>

8000abc0 <etharp_raw>:
8000abc0:	fc010113          	addi	sp,sp,-64
8000abc4:	03312623          	sw	s3,44(sp)
8000abc8:	03412423          	sw	s4,40(sp)
8000abcc:	03512223          	sw	s5,36(sp)
8000abd0:	00050993          	mv	s3,a0
8000abd4:	00058a13          	mv	s4,a1
8000abd8:	00060a93          	mv	s5,a2
8000abdc:	01c00593          	li	a1,28
8000abe0:	28000613          	li	a2,640
8000abe4:	01000513          	li	a0,16
8000abe8:	02912a23          	sw	s1,52(sp)
8000abec:	03612023          	sw	s6,32(sp)
8000abf0:	01712e23          	sw	s7,28(sp)
8000abf4:	01812c23          	sw	s8,24(sp)
8000abf8:	01912a23          	sw	s9,20(sp)
8000abfc:	01112623          	sw	a7,12(sp)
8000ac00:	02112e23          	sw	ra,60(sp)
8000ac04:	02812c23          	sw	s0,56(sp)
8000ac08:	03212823          	sw	s2,48(sp)
8000ac0c:	00068c93          	mv	s9,a3
8000ac10:	00070b93          	mv	s7,a4
8000ac14:	00078c13          	mv	s8,a5
8000ac18:	00080b13          	mv	s6,a6
8000ac1c:	cd0fc0ef          	jal	ra,800070ec <pbuf_alloc>
8000ac20:	a0418493          	addi	s1,gp,-1532 # 80003244 <lwip_stats>
8000ac24:	00c12883          	lw	a7,12(sp)
8000ac28:	04051463          	bnez	a0,8000ac70 <etharp_raw+0xb0>
8000ac2c:	0484a783          	lw	a5,72(s1)
8000ac30:	fff00513          	li	a0,-1
8000ac34:	00178793          	addi	a5,a5,1
8000ac38:	04f4a423          	sw	a5,72(s1)
8000ac3c:	03c12083          	lw	ra,60(sp)
8000ac40:	03812403          	lw	s0,56(sp)
8000ac44:	03412483          	lw	s1,52(sp)
8000ac48:	03012903          	lw	s2,48(sp)
8000ac4c:	02c12983          	lw	s3,44(sp)
8000ac50:	02812a03          	lw	s4,40(sp)
8000ac54:	02412a83          	lw	s5,36(sp)
8000ac58:	02012b03          	lw	s6,32(sp)
8000ac5c:	01c12b83          	lw	s7,28(sp)
8000ac60:	01812c03          	lw	s8,24(sp)
8000ac64:	01412c83          	lw	s9,20(sp)
8000ac68:	04010113          	addi	sp,sp,64
8000ac6c:	00008067          	ret
8000ac70:	00452403          	lw	s0,4(a0)
8000ac74:	00050913          	mv	s2,a0
8000ac78:	00088513          	mv	a0,a7
8000ac7c:	978fb0ef          	jal	ra,80005df4 <lwip_htons>
8000ac80:	00a40323          	sb	a0,6(s0)
8000ac84:	00855513          	srli	a0,a0,0x8
8000ac88:	00a403a3          	sb	a0,7(s0)
8000ac8c:	00600613          	li	a2,6
8000ac90:	000c8593          	mv	a1,s9
8000ac94:	00840513          	addi	a0,s0,8
8000ac98:	41c030ef          	jal	ra,8000e0b4 <memcpy>
8000ac9c:	00600613          	li	a2,6
8000aca0:	000c0593          	mv	a1,s8
8000aca4:	01240513          	addi	a0,s0,18
8000aca8:	40c030ef          	jal	ra,8000e0b4 <memcpy>
8000acac:	00400613          	li	a2,4
8000acb0:	000b8593          	mv	a1,s7
8000acb4:	00e40513          	addi	a0,s0,14
8000acb8:	3fc030ef          	jal	ra,8000e0b4 <memcpy>
8000acbc:	00400613          	li	a2,4
8000acc0:	000b0593          	mv	a1,s6
8000acc4:	01840513          	addi	a0,s0,24
8000acc8:	3ec030ef          	jal	ra,8000e0b4 <memcpy>
8000accc:	00100793          	li	a5,1
8000acd0:	00f400a3          	sb	a5,1(s0)
8000acd4:	00800793          	li	a5,8
8000acd8:	00f40123          	sb	a5,2(s0)
8000acdc:	00600793          	li	a5,6
8000ace0:	00f40223          	sb	a5,4(s0)
8000ace4:	00001737          	lui	a4,0x1
8000ace8:	00400793          	li	a5,4
8000acec:	00f402a3          	sb	a5,5(s0)
8000acf0:	80670713          	addi	a4,a4,-2042 # 806 <_stack_size+0x6>
8000acf4:	000a8693          	mv	a3,s5
8000acf8:	000a0613          	mv	a2,s4
8000acfc:	00090593          	mv	a1,s2
8000ad00:	00040023          	sb	zero,0(s0)
8000ad04:	000401a3          	sb	zero,3(s0)
8000ad08:	00098513          	mv	a0,s3
8000ad0c:	695010ef          	jal	ra,8000cba0 <ethernet_output>
8000ad10:	0304a783          	lw	a5,48(s1)
8000ad14:	00090513          	mv	a0,s2
8000ad18:	00178793          	addi	a5,a5,1
8000ad1c:	02f4a823          	sw	a5,48(s1)
8000ad20:	af8fc0ef          	jal	ra,80007018 <pbuf_free>
8000ad24:	00000513          	li	a0,0
8000ad28:	f15ff06f          	j	8000ac3c <etharp_raw+0x7c>

8000ad2c <etharp_cleanup_netif>:
8000ad2c:	fe010113          	addi	sp,sp,-32
8000ad30:	00812c23          	sw	s0,24(sp)
8000ad34:	00912a23          	sw	s1,20(sp)
8000ad38:	01212823          	sw	s2,16(sp)
8000ad3c:	01312623          	sw	s3,12(sp)
8000ad40:	00112e23          	sw	ra,28(sp)
8000ad44:	00050993          	mv	s3,a0
8000ad48:	b4418413          	addi	s0,gp,-1212 # 80003384 <arp_table>
8000ad4c:	00000493          	li	s1,0
8000ad50:	00a00913          	li	s2,10
8000ad54:	01444783          	lbu	a5,20(s0)
8000ad58:	00078a63          	beqz	a5,8000ad6c <etharp_cleanup_netif+0x40>
8000ad5c:	00842783          	lw	a5,8(s0)
8000ad60:	01379663          	bne	a5,s3,8000ad6c <etharp_cleanup_netif+0x40>
8000ad64:	00048513          	mv	a0,s1
8000ad68:	c65ff0ef          	jal	ra,8000a9cc <etharp_free_entry>
8000ad6c:	00148493          	addi	s1,s1,1
8000ad70:	01840413          	addi	s0,s0,24
8000ad74:	ff2490e3          	bne	s1,s2,8000ad54 <etharp_cleanup_netif+0x28>
8000ad78:	01c12083          	lw	ra,28(sp)
8000ad7c:	01812403          	lw	s0,24(sp)
8000ad80:	01412483          	lw	s1,20(sp)
8000ad84:	01012903          	lw	s2,16(sp)
8000ad88:	00c12983          	lw	s3,12(sp)
8000ad8c:	02010113          	addi	sp,sp,32
8000ad90:	00008067          	ret

8000ad94 <etharp_find_addr>:
8000ad94:	fe010113          	addi	sp,sp,-32
8000ad98:	00058793          	mv	a5,a1
8000ad9c:	00812c23          	sw	s0,24(sp)
8000ada0:	00200593          	li	a1,2
8000ada4:	00060413          	mv	s0,a2
8000ada8:	00050613          	mv	a2,a0
8000adac:	00078513          	mv	a0,a5
8000adb0:	00112e23          	sw	ra,28(sp)
8000adb4:	00d12623          	sw	a3,12(sp)
8000adb8:	ca1ff0ef          	jal	ra,8000aa58 <etharp_find_entry>
8000adbc:	04054863          	bltz	a0,8000ae0c <etharp_find_addr+0x78>
8000adc0:	00151793          	slli	a5,a0,0x1
8000adc4:	00a787b3          	add	a5,a5,a0
8000adc8:	b4418713          	addi	a4,gp,-1212 # 80003384 <arp_table>
8000adcc:	00379793          	slli	a5,a5,0x3
8000add0:	00f70633          	add	a2,a4,a5
8000add4:	01464583          	lbu	a1,20(a2)
8000add8:	00100613          	li	a2,1
8000addc:	02b67863          	bgeu	a2,a1,8000ae0c <etharp_find_addr+0x78>
8000ade0:	00c78613          	addi	a2,a5,12
8000ade4:	00c12683          	lw	a3,12(sp)
8000ade8:	00c70633          	add	a2,a4,a2
8000adec:	00478793          	addi	a5,a5,4
8000adf0:	00c42023          	sw	a2,0(s0)
8000adf4:	00f707b3          	add	a5,a4,a5
8000adf8:	00f6a023          	sw	a5,0(a3)
8000adfc:	01c12083          	lw	ra,28(sp)
8000ae00:	01812403          	lw	s0,24(sp)
8000ae04:	02010113          	addi	sp,sp,32
8000ae08:	00008067          	ret
8000ae0c:	fff00513          	li	a0,-1
8000ae10:	fedff06f          	j	8000adfc <etharp_find_addr+0x68>

8000ae14 <etharp_get_entry>:
8000ae14:	00900793          	li	a5,9
8000ae18:	04a7e863          	bltu	a5,a0,8000ae68 <etharp_get_entry+0x54>
8000ae1c:	00151793          	slli	a5,a0,0x1
8000ae20:	00a787b3          	add	a5,a5,a0
8000ae24:	b4418713          	addi	a4,gp,-1212 # 80003384 <arp_table>
8000ae28:	00379793          	slli	a5,a5,0x3
8000ae2c:	00f70833          	add	a6,a4,a5
8000ae30:	01484303          	lbu	t1,20(a6)
8000ae34:	00100893          	li	a7,1
8000ae38:	00000513          	li	a0,0
8000ae3c:	0268f863          	bgeu	a7,t1,8000ae6c <etharp_get_entry+0x58>
8000ae40:	00478513          	addi	a0,a5,4
8000ae44:	00a70533          	add	a0,a4,a0
8000ae48:	00a5a023          	sw	a0,0(a1)
8000ae4c:	00882583          	lw	a1,8(a6)
8000ae50:	00c78793          	addi	a5,a5,12
8000ae54:	00f707b3          	add	a5,a4,a5
8000ae58:	00b62023          	sw	a1,0(a2)
8000ae5c:	00f6a023          	sw	a5,0(a3)
8000ae60:	00100513          	li	a0,1
8000ae64:	00008067          	ret
8000ae68:	00000513          	li	a0,0
8000ae6c:	00008067          	ret

8000ae70 <etharp_input>:
8000ae70:	22058863          	beqz	a1,8000b0a0 <etharp_input+0x230>
8000ae74:	fc010113          	addi	sp,sp,-64
8000ae78:	02812c23          	sw	s0,56(sp)
8000ae7c:	03212823          	sw	s2,48(sp)
8000ae80:	03312623          	sw	s3,44(sp)
8000ae84:	02112e23          	sw	ra,60(sp)
8000ae88:	02912a23          	sw	s1,52(sp)
8000ae8c:	03412423          	sw	s4,40(sp)
8000ae90:	03512223          	sw	s5,36(sp)
8000ae94:	03612023          	sw	s6,32(sp)
8000ae98:	01712e23          	sw	s7,28(sp)
8000ae9c:	00452483          	lw	s1,4(a0)
8000aea0:	00058413          	mv	s0,a1
8000aea4:	0014c783          	lbu	a5,1(s1)
8000aea8:	0004c703          	lbu	a4,0(s1)
8000aeac:	00050993          	mv	s3,a0
8000aeb0:	00879793          	slli	a5,a5,0x8
8000aeb4:	00e7e7b3          	or	a5,a5,a4
8000aeb8:	10000713          	li	a4,256
8000aebc:	a0418913          	addi	s2,gp,-1532 # 80003244 <lwip_stats>
8000aec0:	02e79a63          	bne	a5,a4,8000aef4 <etharp_input+0x84>
8000aec4:	0044c703          	lbu	a4,4(s1)
8000aec8:	00600793          	li	a5,6
8000aecc:	02f71463          	bne	a4,a5,8000aef4 <etharp_input+0x84>
8000aed0:	0054c703          	lbu	a4,5(s1)
8000aed4:	00400793          	li	a5,4
8000aed8:	00f71e63          	bne	a4,a5,8000aef4 <etharp_input+0x84>
8000aedc:	0034c783          	lbu	a5,3(s1)
8000aee0:	0024c703          	lbu	a4,2(s1)
8000aee4:	00879793          	slli	a5,a5,0x8
8000aee8:	00e7e7b3          	or	a5,a5,a4
8000aeec:	00800713          	li	a4,8
8000aef0:	04e78863          	beq	a5,a4,8000af40 <etharp_input+0xd0>
8000aef4:	05092783          	lw	a5,80(s2)
8000aef8:	00178793          	addi	a5,a5,1
8000aefc:	04f92823          	sw	a5,80(s2)
8000af00:	03c92783          	lw	a5,60(s2)
8000af04:	00178793          	addi	a5,a5,1
8000af08:	02f92e23          	sw	a5,60(s2)
8000af0c:	00098513          	mv	a0,s3
8000af10:	908fc0ef          	jal	ra,80007018 <pbuf_free>
8000af14:	03c12083          	lw	ra,60(sp)
8000af18:	03812403          	lw	s0,56(sp)
8000af1c:	03412483          	lw	s1,52(sp)
8000af20:	03012903          	lw	s2,48(sp)
8000af24:	02c12983          	lw	s3,44(sp)
8000af28:	02812a03          	lw	s4,40(sp)
8000af2c:	02412a83          	lw	s5,36(sp)
8000af30:	02012b03          	lw	s6,32(sp)
8000af34:	01c12b83          	lw	s7,28(sp)
8000af38:	04010113          	addi	sp,sp,64
8000af3c:	00008067          	ret
8000af40:	03492783          	lw	a5,52(s2)
8000af44:	00400613          	li	a2,4
8000af48:	00e48593          	addi	a1,s1,14
8000af4c:	00178793          	addi	a5,a5,1
8000af50:	00810513          	addi	a0,sp,8
8000af54:	02f92a23          	sw	a5,52(s2)
8000af58:	15c030ef          	jal	ra,8000e0b4 <memcpy>
8000af5c:	00400613          	li	a2,4
8000af60:	01848593          	addi	a1,s1,24
8000af64:	00c10513          	addi	a0,sp,12
8000af68:	14c030ef          	jal	ra,8000e0b4 <memcpy>
8000af6c:	00442783          	lw	a5,4(s0)
8000af70:	00848a13          	addi	s4,s1,8
8000af74:	00078663          	beqz	a5,8000af80 <etharp_input+0x110>
8000af78:	00c12703          	lw	a4,12(sp)
8000af7c:	0ce78e63          	beq	a5,a4,8000b058 <etharp_input+0x1e8>
8000af80:	00000a93          	li	s5,0
8000af84:	00200b13          	li	s6,2
8000af88:	00812503          	lw	a0,8(sp)
8000af8c:	08050e63          	beqz	a0,8000b028 <etharp_input+0x1b8>
8000af90:	00040593          	mv	a1,s0
8000af94:	630010ef          	jal	ra,8000c5c4 <ip4_addr_isbroadcast_u32>
8000af98:	08051863          	bnez	a0,8000b028 <etharp_input+0x1b8>
8000af9c:	00812783          	lw	a5,8(sp)
8000afa0:	0e000713          	li	a4,224
8000afa4:	0f07f793          	andi	a5,a5,240
8000afa8:	08e78063          	beq	a5,a4,8000b028 <etharp_input+0x1b8>
8000afac:	00040613          	mv	a2,s0
8000afb0:	000b0593          	mv	a1,s6
8000afb4:	00810513          	addi	a0,sp,8
8000afb8:	aa1ff0ef          	jal	ra,8000aa58 <etharp_find_entry>
8000afbc:	06054663          	bltz	a0,8000b028 <etharp_input+0x1b8>
8000afc0:	00151793          	slli	a5,a0,0x1
8000afc4:	00a787b3          	add	a5,a5,a0
8000afc8:	b4418713          	addi	a4,gp,-1212 # 80003384 <arp_table>
8000afcc:	00379793          	slli	a5,a5,0x3
8000afd0:	00f70b33          	add	s6,a4,a5
8000afd4:	00200693          	li	a3,2
8000afd8:	00c78793          	addi	a5,a5,12
8000afdc:	00db0a23          	sb	a3,20(s6)
8000afe0:	008b2423          	sw	s0,8(s6)
8000afe4:	00600613          	li	a2,6
8000afe8:	000a0593          	mv	a1,s4
8000afec:	00f70533          	add	a0,a4,a5
8000aff0:	0c4030ef          	jal	ra,8000e0b4 <memcpy>
8000aff4:	000b2b83          	lw	s7,0(s6)
8000aff8:	000b1923          	sh	zero,18(s6)
8000affc:	020b8663          	beqz	s7,8000b028 <etharp_input+0x1b8>
8000b000:	00001737          	lui	a4,0x1
8000b004:	000b2023          	sw	zero,0(s6)
8000b008:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b00c:	000a0693          	mv	a3,s4
8000b010:	02e40613          	addi	a2,s0,46
8000b014:	000b8593          	mv	a1,s7
8000b018:	00040513          	mv	a0,s0
8000b01c:	385010ef          	jal	ra,8000cba0 <ethernet_output>
8000b020:	000b8513          	mv	a0,s7
8000b024:	ff5fb0ef          	jal	ra,80007018 <pbuf_free>
8000b028:	0074c783          	lbu	a5,7(s1)
8000b02c:	0064c703          	lbu	a4,6(s1)
8000b030:	00879793          	slli	a5,a5,0x8
8000b034:	00e7e7b3          	or	a5,a5,a4
8000b038:	10000713          	li	a4,256
8000b03c:	02e78463          	beq	a5,a4,8000b064 <etharp_input+0x1f4>
8000b040:	20000713          	li	a4,512
8000b044:	04e78663          	beq	a5,a4,8000b090 <etharp_input+0x220>
8000b048:	05892783          	lw	a5,88(s2)
8000b04c:	00178793          	addi	a5,a5,1
8000b050:	04f92c23          	sw	a5,88(s2)
8000b054:	eb9ff06f          	j	8000af0c <etharp_input+0x9c>
8000b058:	00100a93          	li	s5,1
8000b05c:	00100b13          	li	s6,1
8000b060:	f29ff06f          	j	8000af88 <etharp_input+0x118>
8000b064:	ea0a84e3          	beqz	s5,8000af0c <etharp_input+0x9c>
8000b068:	02e40693          	addi	a3,s0,46
8000b06c:	00200893          	li	a7,2
8000b070:	00810813          	addi	a6,sp,8
8000b074:	000a0793          	mv	a5,s4
8000b078:	00440713          	addi	a4,s0,4
8000b07c:	000a0613          	mv	a2,s4
8000b080:	00068593          	mv	a1,a3
8000b084:	00040513          	mv	a0,s0
8000b088:	b39ff0ef          	jal	ra,8000abc0 <etharp_raw>
8000b08c:	e81ff06f          	j	8000af0c <etharp_input+0x9c>
8000b090:	00810593          	addi	a1,sp,8
8000b094:	00040513          	mv	a0,s0
8000b098:	fd5fe0ef          	jal	ra,8000a06c <dhcp_arp_reply>
8000b09c:	e71ff06f          	j	8000af0c <etharp_input+0x9c>
8000b0a0:	00008067          	ret

8000b0a4 <etharp_request>:
8000b0a4:	02e50693          	addi	a3,a0,46
8000b0a8:	00058813          	mv	a6,a1
8000b0ac:	00100893          	li	a7,1
8000b0b0:	84c18793          	addi	a5,gp,-1972 # 8000308c <ethzero>
8000b0b4:	00450713          	addi	a4,a0,4
8000b0b8:	85418613          	addi	a2,gp,-1964 # 80003094 <ethbroadcast>
8000b0bc:	00068593          	mv	a1,a3
8000b0c0:	b01ff06f          	j	8000abc0 <etharp_raw>

8000b0c4 <etharp_tmr>:
8000b0c4:	fd010113          	addi	sp,sp,-48
8000b0c8:	02812423          	sw	s0,40(sp)
8000b0cc:	02912223          	sw	s1,36(sp)
8000b0d0:	03212023          	sw	s2,32(sp)
8000b0d4:	01312e23          	sw	s3,28(sp)
8000b0d8:	01412c23          	sw	s4,24(sp)
8000b0dc:	01512a23          	sw	s5,20(sp)
8000b0e0:	01612823          	sw	s6,16(sp)
8000b0e4:	01712623          	sw	s7,12(sp)
8000b0e8:	02112623          	sw	ra,44(sp)
8000b0ec:	b4418413          	addi	s0,gp,-1212 # 80003384 <arp_table>
8000b0f0:	00000493          	li	s1,0
8000b0f4:	12b00a13          	li	s4,299
8000b0f8:	00100a93          	li	s5,1
8000b0fc:	00300b13          	li	s6,3
8000b100:	00400913          	li	s2,4
8000b104:	00200b93          	li	s7,2
8000b108:	00a00993          	li	s3,10
8000b10c:	01444703          	lbu	a4,20(s0)
8000b110:	02070663          	beqz	a4,8000b13c <etharp_tmr+0x78>
8000b114:	01245783          	lhu	a5,18(s0)
8000b118:	00178793          	addi	a5,a5,1
8000b11c:	01079793          	slli	a5,a5,0x10
8000b120:	0107d793          	srli	a5,a5,0x10
8000b124:	00f41923          	sh	a5,18(s0)
8000b128:	00fa6663          	bltu	s4,a5,8000b134 <etharp_tmr+0x70>
8000b12c:	05571463          	bne	a4,s5,8000b174 <etharp_tmr+0xb0>
8000b130:	04f97e63          	bgeu	s2,a5,8000b18c <etharp_tmr+0xc8>
8000b134:	00048513          	mv	a0,s1
8000b138:	895ff0ef          	jal	ra,8000a9cc <etharp_free_entry>
8000b13c:	00148493          	addi	s1,s1,1
8000b140:	01840413          	addi	s0,s0,24
8000b144:	fd3494e3          	bne	s1,s3,8000b10c <etharp_tmr+0x48>
8000b148:	02c12083          	lw	ra,44(sp)
8000b14c:	02812403          	lw	s0,40(sp)
8000b150:	02412483          	lw	s1,36(sp)
8000b154:	02012903          	lw	s2,32(sp)
8000b158:	01c12983          	lw	s3,28(sp)
8000b15c:	01812a03          	lw	s4,24(sp)
8000b160:	01412a83          	lw	s5,20(sp)
8000b164:	01012b03          	lw	s6,16(sp)
8000b168:	00c12b83          	lw	s7,12(sp)
8000b16c:	03010113          	addi	sp,sp,48
8000b170:	00008067          	ret
8000b174:	01671663          	bne	a4,s6,8000b180 <etharp_tmr+0xbc>
8000b178:	01240a23          	sb	s2,20(s0)
8000b17c:	fc1ff06f          	j	8000b13c <etharp_tmr+0x78>
8000b180:	fb271ee3          	bne	a4,s2,8000b13c <etharp_tmr+0x78>
8000b184:	01740a23          	sb	s7,20(s0)
8000b188:	fb5ff06f          	j	8000b13c <etharp_tmr+0x78>
8000b18c:	00842503          	lw	a0,8(s0)
8000b190:	00440593          	addi	a1,s0,4
8000b194:	f11ff0ef          	jal	ra,8000b0a4 <etharp_request>
8000b198:	fa5ff06f          	j	8000b13c <etharp_tmr+0x78>

8000b19c <etharp_output_to_arp_index>:
8000b19c:	fe010113          	addi	sp,sp,-32
8000b1a0:	01412423          	sw	s4,8(sp)
8000b1a4:	00058a13          	mv	s4,a1
8000b1a8:	00161593          	slli	a1,a2,0x1
8000b1ac:	00c58633          	add	a2,a1,a2
8000b1b0:	00361613          	slli	a2,a2,0x3
8000b1b4:	b4418593          	addi	a1,gp,-1212 # 80003384 <arp_table>
8000b1b8:	00812c23          	sw	s0,24(sp)
8000b1bc:	00912a23          	sw	s1,20(sp)
8000b1c0:	01212823          	sw	s2,16(sp)
8000b1c4:	01312623          	sw	s3,12(sp)
8000b1c8:	00112e23          	sw	ra,28(sp)
8000b1cc:	00c584b3          	add	s1,a1,a2
8000b1d0:	0144c703          	lbu	a4,20(s1)
8000b1d4:	00c60413          	addi	s0,a2,12
8000b1d8:	00200793          	li	a5,2
8000b1dc:	00050913          	mv	s2,a0
8000b1e0:	00858433          	add	s0,a1,s0
8000b1e4:	02e50993          	addi	s3,a0,46
8000b1e8:	02f71463          	bne	a4,a5,8000b210 <etharp_output_to_arp_index+0x74>
8000b1ec:	0124d783          	lhu	a5,18(s1)
8000b1f0:	11c00713          	li	a4,284
8000b1f4:	04f77a63          	bgeu	a4,a5,8000b248 <etharp_output_to_arp_index+0xac>
8000b1f8:	00460613          	addi	a2,a2,4
8000b1fc:	00c585b3          	add	a1,a1,a2
8000b200:	ea5ff0ef          	jal	ra,8000b0a4 <etharp_request>
8000b204:	00051663          	bnez	a0,8000b210 <etharp_output_to_arp_index+0x74>
8000b208:	00300793          	li	a5,3
8000b20c:	00f48a23          	sb	a5,20(s1)
8000b210:	00040693          	mv	a3,s0
8000b214:	01812403          	lw	s0,24(sp)
8000b218:	01c12083          	lw	ra,28(sp)
8000b21c:	01412483          	lw	s1,20(sp)
8000b220:	00098613          	mv	a2,s3
8000b224:	000a0593          	mv	a1,s4
8000b228:	00c12983          	lw	s3,12(sp)
8000b22c:	00812a03          	lw	s4,8(sp)
8000b230:	00090513          	mv	a0,s2
8000b234:	01012903          	lw	s2,16(sp)
8000b238:	00001737          	lui	a4,0x1
8000b23c:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b240:	02010113          	addi	sp,sp,32
8000b244:	15d0106f          	j	8000cba0 <ethernet_output>
8000b248:	10d00713          	li	a4,269
8000b24c:	fcf772e3          	bgeu	a4,a5,8000b210 <etharp_output_to_arp_index+0x74>
8000b250:	00460613          	addi	a2,a2,4
8000b254:	00c58833          	add	a6,a1,a2
8000b258:	00100893          	li	a7,1
8000b25c:	84c18793          	addi	a5,gp,-1972 # 8000308c <ethzero>
8000b260:	00450713          	addi	a4,a0,4
8000b264:	00098693          	mv	a3,s3
8000b268:	00040613          	mv	a2,s0
8000b26c:	00098593          	mv	a1,s3
8000b270:	951ff0ef          	jal	ra,8000abc0 <etharp_raw>
8000b274:	f91ff06f          	j	8000b204 <etharp_output_to_arp_index+0x68>

8000b278 <etharp_query>:
8000b278:	fe010113          	addi	sp,sp,-32
8000b27c:	01512223          	sw	s5,4(sp)
8000b280:	00058a93          	mv	s5,a1
8000b284:	00912a23          	sw	s1,20(sp)
8000b288:	00050593          	mv	a1,a0
8000b28c:	00050493          	mv	s1,a0
8000b290:	000aa503          	lw	a0,0(s5)
8000b294:	01312623          	sw	s3,12(sp)
8000b298:	00112e23          	sw	ra,28(sp)
8000b29c:	00812c23          	sw	s0,24(sp)
8000b2a0:	01212823          	sw	s2,16(sp)
8000b2a4:	01412423          	sw	s4,8(sp)
8000b2a8:	00060993          	mv	s3,a2
8000b2ac:	318010ef          	jal	ra,8000c5c4 <ip4_addr_isbroadcast_u32>
8000b2b0:	16051a63          	bnez	a0,8000b424 <etharp_query+0x1ac>
8000b2b4:	000aa783          	lw	a5,0(s5)
8000b2b8:	0e000713          	li	a4,224
8000b2bc:	0f07f693          	andi	a3,a5,240
8000b2c0:	16e68263          	beq	a3,a4,8000b424 <etharp_query+0x1ac>
8000b2c4:	16078063          	beqz	a5,8000b424 <etharp_query+0x1ac>
8000b2c8:	00048613          	mv	a2,s1
8000b2cc:	00100593          	li	a1,1
8000b2d0:	000a8513          	mv	a0,s5
8000b2d4:	f84ff0ef          	jal	ra,8000aa58 <etharp_find_entry>
8000b2d8:	02055e63          	bgez	a0,8000b314 <etharp_query+0x9c>
8000b2dc:	00098a63          	beqz	s3,8000b2f0 <etharp_query+0x78>
8000b2e0:	a0418793          	addi	a5,gp,-1532 # 80003244 <lwip_stats>
8000b2e4:	0487a703          	lw	a4,72(a5)
8000b2e8:	00170713          	addi	a4,a4,1
8000b2ec:	04e7a423          	sw	a4,72(a5)
8000b2f0:	01c12083          	lw	ra,28(sp)
8000b2f4:	01812403          	lw	s0,24(sp)
8000b2f8:	01412483          	lw	s1,20(sp)
8000b2fc:	01012903          	lw	s2,16(sp)
8000b300:	00c12983          	lw	s3,12(sp)
8000b304:	00812a03          	lw	s4,8(sp)
8000b308:	00412a83          	lw	s5,4(sp)
8000b30c:	02010113          	addi	sp,sp,32
8000b310:	00008067          	ret
8000b314:	0ff57413          	andi	s0,a0,255
8000b318:	00141a13          	slli	s4,s0,0x1
8000b31c:	008a0733          	add	a4,s4,s0
8000b320:	b4418793          	addi	a5,gp,-1212 # 80003384 <arp_table>
8000b324:	00371713          	slli	a4,a4,0x3
8000b328:	00e787b3          	add	a5,a5,a4
8000b32c:	0147c703          	lbu	a4,20(a5)
8000b330:	b4418913          	addi	s2,gp,-1212 # 80003384 <arp_table>
8000b334:	08070663          	beqz	a4,8000b3c0 <etharp_query+0x148>
8000b338:	fff00513          	li	a0,-1
8000b33c:	00099a63          	bnez	s3,8000b350 <etharp_query+0xd8>
8000b340:	000a8593          	mv	a1,s5
8000b344:	00048513          	mv	a0,s1
8000b348:	d5dff0ef          	jal	ra,8000b0a4 <etharp_request>
8000b34c:	fa0982e3          	beqz	s3,8000b2f0 <etharp_query+0x78>
8000b350:	008a07b3          	add	a5,s4,s0
8000b354:	00379793          	slli	a5,a5,0x3
8000b358:	00f907b3          	add	a5,s2,a5
8000b35c:	0147c703          	lbu	a4,20(a5)
8000b360:	00100793          	li	a5,1
8000b364:	06e7f663          	bgeu	a5,a4,8000b3d0 <etharp_query+0x158>
8000b368:	00048863          	beqz	s1,8000b378 <etharp_query+0x100>
8000b36c:	03c4a783          	lw	a5,60(s1)
8000b370:	00078463          	beqz	a5,8000b378 <etharp_query+0x100>
8000b374:	00878023          	sb	s0,0(a5)
8000b378:	008a06b3          	add	a3,s4,s0
8000b37c:	00369693          	slli	a3,a3,0x3
8000b380:	01812403          	lw	s0,24(sp)
8000b384:	00c68693          	addi	a3,a3,12
8000b388:	01c12083          	lw	ra,28(sp)
8000b38c:	00812a03          	lw	s4,8(sp)
8000b390:	00412a83          	lw	s5,4(sp)
8000b394:	00d906b3          	add	a3,s2,a3
8000b398:	02e48613          	addi	a2,s1,46
8000b39c:	01012903          	lw	s2,16(sp)
8000b3a0:	00098593          	mv	a1,s3
8000b3a4:	00048513          	mv	a0,s1
8000b3a8:	00c12983          	lw	s3,12(sp)
8000b3ac:	01412483          	lw	s1,20(sp)
8000b3b0:	00001737          	lui	a4,0x1
8000b3b4:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b3b8:	02010113          	addi	sp,sp,32
8000b3bc:	7e40106f          	j	8000cba0 <ethernet_output>
8000b3c0:	00100713          	li	a4,1
8000b3c4:	00e78a23          	sb	a4,20(a5)
8000b3c8:	0097a423          	sw	s1,8(a5)
8000b3cc:	f75ff06f          	j	8000b340 <etharp_query+0xc8>
8000b3d0:	f2f710e3          	bne	a4,a5,8000b2f0 <etharp_query+0x78>
8000b3d4:	00098793          	mv	a5,s3
8000b3d8:	00c7c703          	lbu	a4,12(a5)
8000b3dc:	04077713          	andi	a4,a4,64
8000b3e0:	04071663          	bnez	a4,8000b42c <etharp_query+0x1b4>
8000b3e4:	0007a783          	lw	a5,0(a5)
8000b3e8:	fe0798e3          	bnez	a5,8000b3d8 <etharp_query+0x160>
8000b3ec:	00098513          	mv	a0,s3
8000b3f0:	810fc0ef          	jal	ra,80007400 <pbuf_ref>
8000b3f4:	008a07b3          	add	a5,s4,s0
8000b3f8:	00379793          	slli	a5,a5,0x3
8000b3fc:	00f907b3          	add	a5,s2,a5
8000b400:	0007a503          	lw	a0,0(a5)
8000b404:	00050463          	beqz	a0,8000b40c <etharp_query+0x194>
8000b408:	c11fb0ef          	jal	ra,80007018 <pbuf_free>
8000b40c:	008a0433          	add	s0,s4,s0
8000b410:	00341413          	slli	s0,s0,0x3
8000b414:	00890433          	add	s0,s2,s0
8000b418:	01342023          	sw	s3,0(s0)
8000b41c:	00000513          	li	a0,0
8000b420:	ed1ff06f          	j	8000b2f0 <etharp_query+0x78>
8000b424:	ff000513          	li	a0,-16
8000b428:	ec9ff06f          	j	8000b2f0 <etharp_query+0x78>
8000b42c:	00098613          	mv	a2,s3
8000b430:	28000593          	li	a1,640
8000b434:	01000513          	li	a0,16
8000b438:	c78fc0ef          	jal	ra,800078b0 <pbuf_clone>
8000b43c:	00050993          	mv	s3,a0
8000b440:	fa051ae3          	bnez	a0,8000b3f4 <etharp_query+0x17c>
8000b444:	a0418793          	addi	a5,gp,-1532 # 80003244 <lwip_stats>
8000b448:	0487a703          	lw	a4,72(a5)
8000b44c:	fff00513          	li	a0,-1
8000b450:	00170713          	addi	a4,a4,1
8000b454:	04e7a423          	sw	a4,72(a5)
8000b458:	e99ff06f          	j	8000b2f0 <etharp_query+0x78>

8000b45c <etharp_output>:
8000b45c:	fe010113          	addi	sp,sp,-32
8000b460:	00812c23          	sw	s0,24(sp)
8000b464:	00912a23          	sw	s1,20(sp)
8000b468:	01212823          	sw	s2,16(sp)
8000b46c:	00112e23          	sw	ra,28(sp)
8000b470:	00050413          	mv	s0,a0
8000b474:	00058913          	mv	s2,a1
8000b478:	00050593          	mv	a1,a0
8000b47c:	00062503          	lw	a0,0(a2)
8000b480:	00060493          	mv	s1,a2
8000b484:	140010ef          	jal	ra,8000c5c4 <ip4_addr_isbroadcast_u32>
8000b488:	16051863          	bnez	a0,8000b5f8 <etharp_output+0x19c>
8000b48c:	0004a783          	lw	a5,0(s1)
8000b490:	0e000713          	li	a4,224
8000b494:	0f07f613          	andi	a2,a5,240
8000b498:	04e61863          	bne	a2,a4,8000b4e8 <etharp_output+0x8c>
8000b49c:	00100793          	li	a5,1
8000b4a0:	00f11423          	sh	a5,8(sp)
8000b4a4:	05e00793          	li	a5,94
8000b4a8:	00f10523          	sb	a5,10(sp)
8000b4ac:	0014c783          	lbu	a5,1(s1)
8000b4b0:	00810693          	addi	a3,sp,8
8000b4b4:	07f7f793          	andi	a5,a5,127
8000b4b8:	00f105a3          	sb	a5,11(sp)
8000b4bc:	0024c783          	lbu	a5,2(s1)
8000b4c0:	00f10623          	sb	a5,12(sp)
8000b4c4:	0034c783          	lbu	a5,3(s1)
8000b4c8:	00f106a3          	sb	a5,13(sp)
8000b4cc:	00001737          	lui	a4,0x1
8000b4d0:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b4d4:	02e40613          	addi	a2,s0,46
8000b4d8:	00090593          	mv	a1,s2
8000b4dc:	00040513          	mv	a0,s0
8000b4e0:	6c0010ef          	jal	ra,8000cba0 <ethernet_output>
8000b4e4:	0a40006f          	j	8000b588 <etharp_output+0x12c>
8000b4e8:	00442703          	lw	a4,4(s0)
8000b4ec:	00842603          	lw	a2,8(s0)
8000b4f0:	00050693          	mv	a3,a0
8000b4f4:	00e7c733          	xor	a4,a5,a4
8000b4f8:	00c77733          	and	a4,a4,a2
8000b4fc:	02070463          	beqz	a4,8000b524 <etharp_output+0xc8>
8000b500:	01079793          	slli	a5,a5,0x10
8000b504:	00010737          	lui	a4,0x10
8000b508:	0107d793          	srli	a5,a5,0x10
8000b50c:	ea970713          	addi	a4,a4,-343 # fea9 <_stack_size+0xf6a9>
8000b510:	00e78a63          	beq	a5,a4,8000b524 <etharp_output+0xc8>
8000b514:	00c42783          	lw	a5,12(s0)
8000b518:	ffc00513          	li	a0,-4
8000b51c:	06078663          	beqz	a5,8000b588 <etharp_output+0x12c>
8000b520:	00c40493          	addi	s1,s0,12
8000b524:	03c42583          	lw	a1,60(s0)
8000b528:	b4418793          	addi	a5,gp,-1212 # 80003384 <arp_table>
8000b52c:	06058a63          	beqz	a1,8000b5a0 <etharp_output+0x144>
8000b530:	0005c603          	lbu	a2,0(a1)
8000b534:	00900713          	li	a4,9
8000b538:	06c76463          	bltu	a4,a2,8000b5a0 <etharp_output+0x144>
8000b53c:	00161713          	slli	a4,a2,0x1
8000b540:	00c70733          	add	a4,a4,a2
8000b544:	00371713          	slli	a4,a4,0x3
8000b548:	00e78733          	add	a4,a5,a4
8000b54c:	01474803          	lbu	a6,20(a4)
8000b550:	00100513          	li	a0,1
8000b554:	05057663          	bgeu	a0,a6,8000b5a0 <etharp_output+0x144>
8000b558:	00872503          	lw	a0,8(a4)
8000b55c:	04851263          	bne	a0,s0,8000b5a0 <etharp_output+0x144>
8000b560:	0004a503          	lw	a0,0(s1)
8000b564:	00472703          	lw	a4,4(a4)
8000b568:	02e51c63          	bne	a0,a4,8000b5a0 <etharp_output+0x144>
8000b56c:	a0418793          	addi	a5,gp,-1532 # 80003244 <lwip_stats>
8000b570:	05c7a703          	lw	a4,92(a5)
8000b574:	00170713          	addi	a4,a4,1
8000b578:	04e7ae23          	sw	a4,92(a5)
8000b57c:	00090593          	mv	a1,s2
8000b580:	00040513          	mv	a0,s0
8000b584:	c19ff0ef          	jal	ra,8000b19c <etharp_output_to_arp_index>
8000b588:	01c12083          	lw	ra,28(sp)
8000b58c:	01812403          	lw	s0,24(sp)
8000b590:	01412483          	lw	s1,20(sp)
8000b594:	01012903          	lw	s2,16(sp)
8000b598:	02010113          	addi	sp,sp,32
8000b59c:	00008067          	ret
8000b5a0:	00100613          	li	a2,1
8000b5a4:	00a00713          	li	a4,10
8000b5a8:	0147c503          	lbu	a0,20(a5)
8000b5ac:	02a67463          	bgeu	a2,a0,8000b5d4 <etharp_output+0x178>
8000b5b0:	0087a503          	lw	a0,8(a5)
8000b5b4:	02851063          	bne	a0,s0,8000b5d4 <etharp_output+0x178>
8000b5b8:	0004a803          	lw	a6,0(s1)
8000b5bc:	0047a503          	lw	a0,4(a5)
8000b5c0:	00a81a63          	bne	a6,a0,8000b5d4 <etharp_output+0x178>
8000b5c4:	00058463          	beqz	a1,8000b5cc <etharp_output+0x170>
8000b5c8:	00d58023          	sb	a3,0(a1)
8000b5cc:	00068613          	mv	a2,a3
8000b5d0:	fadff06f          	j	8000b57c <etharp_output+0x120>
8000b5d4:	00168693          	addi	a3,a3,1
8000b5d8:	0ff6f693          	andi	a3,a3,255
8000b5dc:	01878793          	addi	a5,a5,24
8000b5e0:	fce694e3          	bne	a3,a4,8000b5a8 <etharp_output+0x14c>
8000b5e4:	00090613          	mv	a2,s2
8000b5e8:	00048593          	mv	a1,s1
8000b5ec:	00040513          	mv	a0,s0
8000b5f0:	c89ff0ef          	jal	ra,8000b278 <etharp_query>
8000b5f4:	f95ff06f          	j	8000b588 <etharp_output+0x12c>
8000b5f8:	85418693          	addi	a3,gp,-1964 # 80003094 <ethbroadcast>
8000b5fc:	ed1ff06f          	j	8000b4cc <etharp_output+0x70>

8000b600 <icmp_input>:
8000b600:	fd010113          	addi	sp,sp,-48
8000b604:	02912223          	sw	s1,36(sp)
8000b608:	02812423          	sw	s0,40(sp)
8000b60c:	01712623          	sw	s7,12(sp)
8000b610:	02112623          	sw	ra,44(sp)
8000b614:	03212023          	sw	s2,32(sp)
8000b618:	01312e23          	sw	s3,28(sp)
8000b61c:	01412c23          	sw	s4,24(sp)
8000b620:	01512a23          	sw	s5,20(sp)
8000b624:	01612823          	sw	s6,16(sp)
8000b628:	01812423          	sw	s8,8(sp)
8000b62c:	a0418793          	addi	a5,gp,-1532 # 80003244 <lwip_stats>
8000b630:	0c47a703          	lw	a4,196(a5)
8000b634:	00050413          	mv	s0,a0
8000b638:	00170713          	addi	a4,a4,1
8000b63c:	0ce7a223          	sw	a4,196(a5)
8000b640:	9ec18713          	addi	a4,gp,-1556 # 8000322c <ip_data>
8000b644:	00872c03          	lw	s8,8(a4)
8000b648:	01300713          	li	a4,19
8000b64c:	a0418493          	addi	s1,gp,-1532 # 80003244 <lwip_stats>
8000b650:	000c4a83          	lbu	s5,0(s8)
8000b654:	00fafa93          	andi	s5,s5,15
8000b658:	002a9a93          	slli	s5,s5,0x2
8000b65c:	2b577863          	bgeu	a4,s5,8000b90c <icmp_input+0x30c>
8000b660:	00a55683          	lhu	a3,10(a0)
8000b664:	00300713          	li	a4,3
8000b668:	2ad77263          	bgeu	a4,a3,8000b90c <icmp_input+0x30c>
8000b66c:	00452703          	lw	a4,4(a0)
8000b670:	00074703          	lbu	a4,0(a4)
8000b674:	22070663          	beqz	a4,8000b8a0 <icmp_input+0x2a0>
8000b678:	00800693          	li	a3,8
8000b67c:	26d71a63          	bne	a4,a3,8000b8f0 <icmp_input+0x2f0>
8000b680:	9ec18b93          	addi	s7,gp,-1556 # 8000322c <ip_data>
8000b684:	014ba503          	lw	a0,20(s7)
8000b688:	0e000793          	li	a5,224
8000b68c:	00058993          	mv	s3,a1
8000b690:	0f057713          	andi	a4,a0,240
8000b694:	00458913          	addi	s2,a1,4
8000b698:	00f70463          	beq	a4,a5,8000b6a0 <icmp_input+0xa0>
8000b69c:	a0018913          	addi	s2,gp,-1536 # 80003240 <ip_data+0x14>
8000b6a0:	000ba583          	lw	a1,0(s7)
8000b6a4:	721000ef          	jal	ra,8000c5c4 <ip4_addr_isbroadcast_u32>
8000b6a8:	00050463          	beqz	a0,8000b6b0 <icmp_input+0xb0>
8000b6ac:	00498913          	addi	s2,s3,4
8000b6b0:	00845703          	lhu	a4,8(s0)
8000b6b4:	00700793          	li	a5,7
8000b6b8:	24e7fa63          	bgeu	a5,a4,8000b90c <icmp_input+0x30c>
8000b6bc:	00040513          	mv	a0,s0
8000b6c0:	d4dfa0ef          	jal	ra,8000640c <inet_chksum_pbuf>
8000b6c4:	04050463          	beqz	a0,8000b70c <icmp_input+0x10c>
8000b6c8:	00040513          	mv	a0,s0
8000b6cc:	94dfb0ef          	jal	ra,80007018 <pbuf_free>
8000b6d0:	0d04a783          	lw	a5,208(s1)
8000b6d4:	00178793          	addi	a5,a5,1
8000b6d8:	0cf4a823          	sw	a5,208(s1)
8000b6dc:	02c12083          	lw	ra,44(sp)
8000b6e0:	02812403          	lw	s0,40(sp)
8000b6e4:	02412483          	lw	s1,36(sp)
8000b6e8:	02012903          	lw	s2,32(sp)
8000b6ec:	01c12983          	lw	s3,28(sp)
8000b6f0:	01812a03          	lw	s4,24(sp)
8000b6f4:	01412a83          	lw	s5,20(sp)
8000b6f8:	01012b03          	lw	s6,16(sp)
8000b6fc:	00c12b83          	lw	s7,12(sp)
8000b700:	00812c03          	lw	s8,8(sp)
8000b704:	03010113          	addi	sp,sp,48
8000b708:	00008067          	ret
8000b70c:	010a8b13          	addi	s6,s5,16
8000b710:	010a9a13          	slli	s4,s5,0x10
8000b714:	000b0593          	mv	a1,s6
8000b718:	00040513          	mv	a0,s0
8000b71c:	010a5a13          	srli	s4,s4,0x10
8000b720:	861fb0ef          	jal	ra,80006f80 <pbuf_add_header>
8000b724:	1a050863          	beqz	a0,8000b8d4 <icmp_input+0x2d4>
8000b728:	00845783          	lhu	a5,8(s0)
8000b72c:	014785b3          	add	a1,a5,s4
8000b730:	01059593          	slli	a1,a1,0x10
8000b734:	0105d593          	srli	a1,a1,0x10
8000b738:	02f5e463          	bltu	a1,a5,8000b760 <icmp_input+0x160>
8000b73c:	28000613          	li	a2,640
8000b740:	01000513          	li	a0,16
8000b744:	9a9fb0ef          	jal	ra,800070ec <pbuf_alloc>
8000b748:	00050b13          	mv	s6,a0
8000b74c:	00050a63          	beqz	a0,8000b760 <icmp_input+0x160>
8000b750:	00a55703          	lhu	a4,10(a0)
8000b754:	008a8793          	addi	a5,s5,8
8000b758:	02f77063          	bgeu	a4,a5,8000b778 <icmp_input+0x178>
8000b75c:	8bdfb0ef          	jal	ra,80007018 <pbuf_free>
8000b760:	00040513          	mv	a0,s0
8000b764:	8b5fb0ef          	jal	ra,80007018 <pbuf_free>
8000b768:	0e84a783          	lw	a5,232(s1)
8000b76c:	00178793          	addi	a5,a5,1
8000b770:	0ef4a423          	sw	a5,232(s1)
8000b774:	f69ff06f          	j	8000b6dc <icmp_input+0xdc>
8000b778:	00452503          	lw	a0,4(a0)
8000b77c:	000c0593          	mv	a1,s8
8000b780:	000a8613          	mv	a2,s5
8000b784:	131020ef          	jal	ra,8000e0b4 <memcpy>
8000b788:	000a8593          	mv	a1,s5
8000b78c:	000b0513          	mv	a0,s6
8000b790:	801fb0ef          	jal	ra,80006f90 <pbuf_remove_header>
8000b794:	00050663          	beqz	a0,8000b7a0 <icmp_input+0x1a0>
8000b798:	000b0513          	mv	a0,s6
8000b79c:	fc1ff06f          	j	8000b75c <icmp_input+0x15c>
8000b7a0:	00040593          	mv	a1,s0
8000b7a4:	000b0513          	mv	a0,s6
8000b7a8:	d45fb0ef          	jal	ra,800074ec <pbuf_copy>
8000b7ac:	fe0516e3          	bnez	a0,8000b798 <icmp_input+0x198>
8000b7b0:	00040513          	mv	a0,s0
8000b7b4:	865fb0ef          	jal	ra,80007018 <pbuf_free>
8000b7b8:	000b0413          	mv	s0,s6
8000b7bc:	000a8593          	mv	a1,s5
8000b7c0:	00040513          	mv	a0,s0
8000b7c4:	00442b03          	lw	s6,4(s0)
8000b7c8:	fb8fb0ef          	jal	ra,80006f80 <pbuf_add_header>
8000b7cc:	0c051a63          	bnez	a0,8000b8a0 <icmp_input+0x2a0>
8000b7d0:	00092783          	lw	a5,0(s2)
8000b7d4:	00442a83          	lw	s5,4(s0)
8000b7d8:	0087d713          	srli	a4,a5,0x8
8000b7dc:	00fa8623          	sb	a5,12(s5)
8000b7e0:	00ea86a3          	sb	a4,13(s5)
8000b7e4:	0107d713          	srli	a4,a5,0x10
8000b7e8:	0187d793          	srli	a5,a5,0x18
8000b7ec:	00ea8723          	sb	a4,14(s5)
8000b7f0:	00fa87a3          	sb	a5,15(s5)
8000b7f4:	010ba783          	lw	a5,16(s7)
8000b7f8:	0087d713          	srli	a4,a5,0x8
8000b7fc:	00fa8823          	sb	a5,16(s5)
8000b800:	00ea88a3          	sb	a4,17(s5)
8000b804:	0107d713          	srli	a4,a5,0x10
8000b808:	0187d793          	srli	a5,a5,0x18
8000b80c:	00ea8923          	sb	a4,18(s5)
8000b810:	00fa89a3          	sb	a5,19(s5)
8000b814:	003b4783          	lbu	a5,3(s6)
8000b818:	002b4703          	lbu	a4,2(s6)
8000b81c:	000b0023          	sb	zero,0(s6)
8000b820:	00879793          	slli	a5,a5,0x8
8000b824:	00e7e7b3          	or	a5,a5,a4
8000b828:	00010737          	lui	a4,0x10
8000b82c:	ff770713          	addi	a4,a4,-9 # fff7 <_stack_size+0xf7f7>
8000b830:	0af77c63          	bgeu	a4,a5,8000b8e8 <icmp_input+0x2e8>
8000b834:	00978793          	addi	a5,a5,9
8000b838:	01079793          	slli	a5,a5,0x10
8000b83c:	0107d793          	srli	a5,a5,0x10
8000b840:	00fb0123          	sb	a5,2(s6)
8000b844:	0087d793          	srli	a5,a5,0x8
8000b848:	00fb01a3          	sb	a5,3(s6)
8000b84c:	fff00793          	li	a5,-1
8000b850:	00fa8423          	sb	a5,8(s5)
8000b854:	000a0593          	mv	a1,s4
8000b858:	000a8523          	sb	zero,10(s5)
8000b85c:	000a85a3          	sb	zero,11(s5)
8000b860:	000a8513          	mv	a0,s5
8000b864:	b85fa0ef          	jal	ra,800063e8 <inet_chksum>
8000b868:	00aa8523          	sb	a0,10(s5)
8000b86c:	00855513          	srli	a0,a0,0x8
8000b870:	00aa85a3          	sb	a0,11(s5)
8000b874:	0c04a783          	lw	a5,192(s1)
8000b878:	00098813          	mv	a6,s3
8000b87c:	00000713          	li	a4,0
8000b880:	00178793          	addi	a5,a5,1
8000b884:	0cf4a023          	sw	a5,192(s1)
8000b888:	0ff00693          	li	a3,255
8000b88c:	00100793          	li	a5,1
8000b890:	00000613          	li	a2,0
8000b894:	00090593          	mv	a1,s2
8000b898:	00040513          	mv	a0,s0
8000b89c:	3fd000ef          	jal	ra,8000c498 <ip4_output_if>
8000b8a0:	00040513          	mv	a0,s0
8000b8a4:	02812403          	lw	s0,40(sp)
8000b8a8:	02c12083          	lw	ra,44(sp)
8000b8ac:	02412483          	lw	s1,36(sp)
8000b8b0:	02012903          	lw	s2,32(sp)
8000b8b4:	01c12983          	lw	s3,28(sp)
8000b8b8:	01812a03          	lw	s4,24(sp)
8000b8bc:	01412a83          	lw	s5,20(sp)
8000b8c0:	01012b03          	lw	s6,16(sp)
8000b8c4:	00c12b83          	lw	s7,12(sp)
8000b8c8:	00812c03          	lw	s8,8(sp)
8000b8cc:	03010113          	addi	sp,sp,48
8000b8d0:	f48fb06f          	j	80007018 <pbuf_free>
8000b8d4:	000b0593          	mv	a1,s6
8000b8d8:	00040513          	mv	a0,s0
8000b8dc:	eb4fb0ef          	jal	ra,80006f90 <pbuf_remove_header>
8000b8e0:	ec050ee3          	beqz	a0,8000b7bc <icmp_input+0x1bc>
8000b8e4:	e7dff06f          	j	8000b760 <icmp_input+0x160>
8000b8e8:	00878793          	addi	a5,a5,8
8000b8ec:	f4dff06f          	j	8000b838 <icmp_input+0x238>
8000b8f0:	0e07a703          	lw	a4,224(a5)
8000b8f4:	00170713          	addi	a4,a4,1
8000b8f8:	0ee7a023          	sw	a4,224(a5)
8000b8fc:	0cc7a703          	lw	a4,204(a5)
8000b900:	00170713          	addi	a4,a4,1
8000b904:	0ce7a623          	sw	a4,204(a5)
8000b908:	f99ff06f          	j	8000b8a0 <icmp_input+0x2a0>
8000b90c:	00040513          	mv	a0,s0
8000b910:	f08fb0ef          	jal	ra,80007018 <pbuf_free>
8000b914:	0d44a783          	lw	a5,212(s1)
8000b918:	00178793          	addi	a5,a5,1
8000b91c:	0cf4aa23          	sw	a5,212(s1)
8000b920:	dbdff06f          	j	8000b6dc <icmp_input+0xdc>

8000b924 <icmp_dest_unreach>:
8000b924:	fc010113          	addi	sp,sp,-64
8000b928:	03312623          	sw	s3,44(sp)
8000b92c:	03412423          	sw	s4,40(sp)
8000b930:	00050993          	mv	s3,a0
8000b934:	00058a13          	mv	s4,a1
8000b938:	28000613          	li	a2,640
8000b93c:	02400593          	li	a1,36
8000b940:	02400513          	li	a0,36
8000b944:	02112e23          	sw	ra,60(sp)
8000b948:	02812c23          	sw	s0,56(sp)
8000b94c:	02912a23          	sw	s1,52(sp)
8000b950:	03212823          	sw	s2,48(sp)
8000b954:	f98fb0ef          	jal	ra,800070ec <pbuf_alloc>
8000b958:	0c050a63          	beqz	a0,8000ba2c <icmp_dest_unreach+0x108>
8000b95c:	00452403          	lw	s0,4(a0)
8000b960:	00300793          	li	a5,3
8000b964:	0049a903          	lw	s2,4(s3)
8000b968:	00f40023          	sb	a5,0(s0)
8000b96c:	014400a3          	sb	s4,1(s0)
8000b970:	00040223          	sb	zero,4(s0)
8000b974:	000402a3          	sb	zero,5(s0)
8000b978:	00040323          	sb	zero,6(s0)
8000b97c:	000403a3          	sb	zero,7(s0)
8000b980:	00050493          	mv	s1,a0
8000b984:	00452503          	lw	a0,4(a0)
8000b988:	0049a583          	lw	a1,4(s3)
8000b98c:	01c00613          	li	a2,28
8000b990:	00850513          	addi	a0,a0,8
8000b994:	720020ef          	jal	ra,8000e0b4 <memcpy>
8000b998:	00d94703          	lbu	a4,13(s2)
8000b99c:	00c94783          	lbu	a5,12(s2)
8000b9a0:	01c10513          	addi	a0,sp,28
8000b9a4:	00871713          	slli	a4,a4,0x8
8000b9a8:	00f76733          	or	a4,a4,a5
8000b9ac:	00e94783          	lbu	a5,14(s2)
8000b9b0:	01079793          	slli	a5,a5,0x10
8000b9b4:	00e7e733          	or	a4,a5,a4
8000b9b8:	00f94783          	lbu	a5,15(s2)
8000b9bc:	01879793          	slli	a5,a5,0x18
8000b9c0:	00e7e7b3          	or	a5,a5,a4
8000b9c4:	00f12e23          	sw	a5,28(sp)
8000b9c8:	438000ef          	jal	ra,8000be00 <ip4_route>
8000b9cc:	00a12623          	sw	a0,12(sp)
8000b9d0:	04050a63          	beqz	a0,8000ba24 <icmp_dest_unreach+0x100>
8000b9d4:	00040123          	sb	zero,2(s0)
8000b9d8:	000401a3          	sb	zero,3(s0)
8000b9dc:	00a4d583          	lhu	a1,10(s1)
8000b9e0:	00040513          	mv	a0,s0
8000b9e4:	a05fa0ef          	jal	ra,800063e8 <inet_chksum>
8000b9e8:	00a40123          	sb	a0,2(s0)
8000b9ec:	00855513          	srli	a0,a0,0x8
8000b9f0:	00a401a3          	sb	a0,3(s0)
8000b9f4:	a0418793          	addi	a5,gp,-1532 # 80003244 <lwip_stats>
8000b9f8:	0c07a703          	lw	a4,192(a5)
8000b9fc:	00c12803          	lw	a6,12(sp)
8000ba00:	0ff00693          	li	a3,255
8000ba04:	00170713          	addi	a4,a4,1
8000ba08:	0ce7a023          	sw	a4,192(a5)
8000ba0c:	01c10613          	addi	a2,sp,28
8000ba10:	00100793          	li	a5,1
8000ba14:	00000713          	li	a4,0
8000ba18:	00000593          	li	a1,0
8000ba1c:	00048513          	mv	a0,s1
8000ba20:	279000ef          	jal	ra,8000c498 <ip4_output_if>
8000ba24:	00048513          	mv	a0,s1
8000ba28:	df0fb0ef          	jal	ra,80007018 <pbuf_free>
8000ba2c:	03c12083          	lw	ra,60(sp)
8000ba30:	03812403          	lw	s0,56(sp)
8000ba34:	03412483          	lw	s1,52(sp)
8000ba38:	03012903          	lw	s2,48(sp)
8000ba3c:	02c12983          	lw	s3,44(sp)
8000ba40:	02812a03          	lw	s4,40(sp)
8000ba44:	04010113          	addi	sp,sp,64
8000ba48:	00008067          	ret

8000ba4c <ipfrag_free_pbuf_custom>:
8000ba4c:	00050593          	mv	a1,a0
8000ba50:	01452503          	lw	a0,20(a0)
8000ba54:	02050463          	beqz	a0,8000ba7c <ipfrag_free_pbuf_custom+0x30>
8000ba58:	fe010113          	addi	sp,sp,-32
8000ba5c:	00112e23          	sw	ra,28(sp)
8000ba60:	00b12623          	sw	a1,12(sp)
8000ba64:	db4fb0ef          	jal	ra,80007018 <pbuf_free>
8000ba68:	00c12583          	lw	a1,12(sp)
8000ba6c:	01c12083          	lw	ra,28(sp)
8000ba70:	00200513          	li	a0,2
8000ba74:	02010113          	addi	sp,sp,32
8000ba78:	cedfa06f          	j	80006764 <memp_free>
8000ba7c:	00200513          	li	a0,2
8000ba80:	ff9ff06f          	j	8000ba78 <ipfrag_free_pbuf_custom+0x2c>

8000ba84 <ip4_frag>:
8000ba84:	fa010113          	addi	sp,sp,-96
8000ba88:	04112e23          	sw	ra,92(sp)
8000ba8c:	04812c23          	sw	s0,88(sp)
8000ba90:	04912a23          	sw	s1,84(sp)
8000ba94:	05212823          	sw	s2,80(sp)
8000ba98:	05312623          	sw	s3,76(sp)
8000ba9c:	05412423          	sw	s4,72(sp)
8000baa0:	05512223          	sw	s5,68(sp)
8000baa4:	05612023          	sw	s6,64(sp)
8000baa8:	03712e23          	sw	s7,60(sp)
8000baac:	03812c23          	sw	s8,56(sp)
8000bab0:	03912a23          	sw	s9,52(sp)
8000bab4:	03a12823          	sw	s10,48(sp)
8000bab8:	03b12623          	sw	s11,44(sp)
8000babc:	02c5d783          	lhu	a5,44(a1)
8000bac0:	00452c03          	lw	s8,4(a0)
8000bac4:	00c12623          	sw	a2,12(sp)
8000bac8:	fec78713          	addi	a4,a5,-20
8000bacc:	41f75793          	srai	a5,a4,0x1f
8000bad0:	0077f793          	andi	a5,a5,7
8000bad4:	00e787b3          	add	a5,a5,a4
8000bad8:	4037d793          	srai	a5,a5,0x3
8000badc:	01079793          	slli	a5,a5,0x10
8000bae0:	0107d793          	srli	a5,a5,0x10
8000bae4:	00f12223          	sw	a5,4(sp)
8000bae8:	000c4783          	lbu	a5,0(s8)
8000baec:	01400713          	li	a4,20
8000baf0:	00f7f793          	andi	a5,a5,15
8000baf4:	00279793          	slli	a5,a5,0x2
8000baf8:	2ae79663          	bne	a5,a4,8000bda4 <ip4_frag+0x320>
8000bafc:	00a55703          	lhu	a4,10(a0)
8000bb00:	01300793          	li	a5,19
8000bb04:	00050413          	mv	s0,a0
8000bb08:	ffa00513          	li	a0,-6
8000bb0c:	06e7fc63          	bgeu	a5,a4,8000bb84 <ip4_frag+0x100>
8000bb10:	007c4783          	lbu	a5,7(s8)
8000bb14:	006c4503          	lbu	a0,6(s8)
8000bb18:	00058c93          	mv	s9,a1
8000bb1c:	00879793          	slli	a5,a5,0x8
8000bb20:	00a7e533          	or	a0,a5,a0
8000bb24:	ad0fa0ef          	jal	ra,80005df4 <lwip_htons>
8000bb28:	000027b7          	lui	a5,0x2
8000bb2c:	00f577b3          	and	a5,a0,a5
8000bb30:	00f12423          	sw	a5,8(sp)
8000bb34:	00412783          	lw	a5,4(sp)
8000bb38:	00845483          	lhu	s1,8(s0)
8000bb3c:	01351b93          	slli	s7,a0,0x13
8000bb40:	00379793          	slli	a5,a5,0x3
8000bb44:	01079793          	slli	a5,a5,0x10
8000bb48:	0107d793          	srli	a5,a5,0x10
8000bb4c:	fec48493          	addi	s1,s1,-20
8000bb50:	00f12023          	sw	a5,0(sp)
8000bb54:	00f11923          	sh	a5,18(sp)
8000bb58:	8000c7b7          	lui	a5,0x8000c
8000bb5c:	01049493          	slli	s1,s1,0x10
8000bb60:	a4c78793          	addi	a5,a5,-1460 # 8000ba4c <_heap_end+0xffff9a4c>
8000bb64:	013bdb93          	srli	s7,s7,0x13
8000bb68:	0104d493          	srli	s1,s1,0x10
8000bb6c:	01400a13          	li	s4,20
8000bb70:	00000913          	li	s2,0
8000bb74:	00f12a23          	sw	a5,20(sp)
8000bb78:	a0418d13          	addi	s10,gp,-1532 # 80003244 <lwip_stats>
8000bb7c:	04049263          	bnez	s1,8000bbc0 <ip4_frag+0x13c>
8000bb80:	00000513          	li	a0,0
8000bb84:	05c12083          	lw	ra,92(sp)
8000bb88:	05812403          	lw	s0,88(sp)
8000bb8c:	05412483          	lw	s1,84(sp)
8000bb90:	05012903          	lw	s2,80(sp)
8000bb94:	04c12983          	lw	s3,76(sp)
8000bb98:	04812a03          	lw	s4,72(sp)
8000bb9c:	04412a83          	lw	s5,68(sp)
8000bba0:	04012b03          	lw	s6,64(sp)
8000bba4:	03c12b83          	lw	s7,60(sp)
8000bba8:	03812c03          	lw	s8,56(sp)
8000bbac:	03412c83          	lw	s9,52(sp)
8000bbb0:	03012d03          	lw	s10,48(sp)
8000bbb4:	02c12d83          	lw	s11,44(sp)
8000bbb8:	06010113          	addi	sp,sp,96
8000bbbc:	00008067          	ret
8000bbc0:	00012783          	lw	a5,0(sp)
8000bbc4:	01215a83          	lhu	s5,18(sp)
8000bbc8:	00f4f463          	bgeu	s1,a5,8000bbd0 <ip4_frag+0x14c>
8000bbcc:	00048a93          	mv	s5,s1
8000bbd0:	28000613          	li	a2,640
8000bbd4:	01400593          	li	a1,20
8000bbd8:	01000513          	li	a0,16
8000bbdc:	010a9a93          	slli	s5,s5,0x10
8000bbe0:	d0cfb0ef          	jal	ra,800070ec <pbuf_alloc>
8000bbe4:	010ada93          	srli	s5,s5,0x10
8000bbe8:	00050b13          	mv	s6,a0
8000bbec:	06050a63          	beqz	a0,8000bc60 <ip4_frag+0x1dc>
8000bbf0:	00452503          	lw	a0,4(a0)
8000bbf4:	01400613          	li	a2,20
8000bbf8:	000c0593          	mv	a1,s8
8000bbfc:	4b8020ef          	jal	ra,8000e0b4 <memcpy>
8000bc00:	004b2983          	lw	s3,4(s6)
8000bc04:	000a8d93          	mv	s11,s5
8000bc08:	0c0d8c63          	beqz	s11,8000bce0 <ip4_frag+0x25c>
8000bc0c:	00a45783          	lhu	a5,10(s0)
8000bc10:	414787b3          	sub	a5,a5,s4
8000bc14:	00078913          	mv	s2,a5
8000bc18:	01079793          	slli	a5,a5,0x10
8000bc1c:	0107d793          	srli	a5,a5,0x10
8000bc20:	00fdf463          	bgeu	s11,a5,8000bc28 <ip4_frag+0x1a4>
8000bc24:	000d8913          	mv	s2,s11
8000bc28:	01091913          	slli	s2,s2,0x10
8000bc2c:	01095913          	srli	s2,s2,0x10
8000bc30:	00091863          	bnez	s2,8000bc40 <ip4_frag+0x1bc>
8000bc34:	00042403          	lw	s0,0(s0)
8000bc38:	00000a13          	li	s4,0
8000bc3c:	fcdff06f          	j	8000bc08 <ip4_frag+0x184>
8000bc40:	800037b7          	lui	a5,0x80003
8000bc44:	2bd00613          	li	a2,701
8000bc48:	cf078593          	addi	a1,a5,-784 # 80002cf0 <_heap_end+0xffff0cf0>
8000bc4c:	00200513          	li	a0,2
8000bc50:	addfa0ef          	jal	ra,8000672c <memp_malloc_fn>
8000bc54:	00051a63          	bnez	a0,8000bc68 <ip4_frag+0x1e4>
8000bc58:	000b0513          	mv	a0,s6
8000bc5c:	bbcfb0ef          	jal	ra,80007018 <pbuf_free>
8000bc60:	fff00513          	li	a0,-1
8000bc64:	f21ff06f          	j	8000bb84 <ip4_frag+0x100>
8000bc68:	00442703          	lw	a4,4(s0)
8000bc6c:	00050693          	mv	a3,a0
8000bc70:	00a12c23          	sw	a0,24(sp)
8000bc74:	00090793          	mv	a5,s2
8000bc78:	01470733          	add	a4,a4,s4
8000bc7c:	04100613          	li	a2,65
8000bc80:	00090593          	mv	a1,s2
8000bc84:	00000513          	li	a0,0
8000bc88:	aa4fb0ef          	jal	ra,80006f2c <pbuf_alloced_custom>
8000bc8c:	01812883          	lw	a7,24(sp)
8000bc90:	00051a63          	bnez	a0,8000bca4 <ip4_frag+0x220>
8000bc94:	00088593          	mv	a1,a7
8000bc98:	00200513          	li	a0,2
8000bc9c:	ac9fa0ef          	jal	ra,80006764 <memp_free>
8000bca0:	fb9ff06f          	j	8000bc58 <ip4_frag+0x1d4>
8000bca4:	00a12c23          	sw	a0,24(sp)
8000bca8:	00040513          	mv	a0,s0
8000bcac:	01112e23          	sw	a7,28(sp)
8000bcb0:	f50fb0ef          	jal	ra,80007400 <pbuf_ref>
8000bcb4:	01c12883          	lw	a7,28(sp)
8000bcb8:	01412783          	lw	a5,20(sp)
8000bcbc:	01812583          	lw	a1,24(sp)
8000bcc0:	0088aa23          	sw	s0,20(a7)
8000bcc4:	00f8a823          	sw	a5,16(a7)
8000bcc8:	000b0513          	mv	a0,s6
8000bccc:	f6cfb0ef          	jal	ra,80007438 <pbuf_cat>
8000bcd0:	412d8833          	sub	a6,s11,s2
8000bcd4:	01081d93          	slli	s11,a6,0x10
8000bcd8:	010ddd93          	srli	s11,s11,0x10
8000bcdc:	f40d9ce3          	bnez	s11,8000bc34 <ip4_frag+0x1b0>
8000bce0:	02ccd783          	lhu	a5,44(s9)
8000bce4:	01490a33          	add	s4,s2,s4
8000bce8:	010a1a13          	slli	s4,s4,0x10
8000bcec:	013b9513          	slli	a0,s7,0x13
8000bcf0:	fed78793          	addi	a5,a5,-19
8000bcf4:	010a5a13          	srli	s4,s4,0x10
8000bcf8:	01355513          	srli	a0,a0,0x13
8000bcfc:	00f4d663          	bge	s1,a5,8000bd08 <ip4_frag+0x284>
8000bd00:	00812783          	lw	a5,8(sp)
8000bd04:	00078663          	beqz	a5,8000bd10 <ip4_frag+0x28c>
8000bd08:	000027b7          	lui	a5,0x2
8000bd0c:	00f56533          	or	a0,a0,a5
8000bd10:	8e4fa0ef          	jal	ra,80005df4 <lwip_htons>
8000bd14:	00a98323          	sb	a0,6(s3)
8000bd18:	00855513          	srli	a0,a0,0x8
8000bd1c:	00a983a3          	sb	a0,7(s3)
8000bd20:	014a8513          	addi	a0,s5,20
8000bd24:	01051513          	slli	a0,a0,0x10
8000bd28:	01055513          	srli	a0,a0,0x10
8000bd2c:	8c8fa0ef          	jal	ra,80005df4 <lwip_htons>
8000bd30:	00a98123          	sb	a0,2(s3)
8000bd34:	00855513          	srli	a0,a0,0x8
8000bd38:	00a981a3          	sb	a0,3(s3)
8000bd3c:	01400593          	li	a1,20
8000bd40:	00098523          	sb	zero,10(s3)
8000bd44:	000985a3          	sb	zero,11(s3)
8000bd48:	00098513          	mv	a0,s3
8000bd4c:	e9cfa0ef          	jal	ra,800063e8 <inet_chksum>
8000bd50:	00a98523          	sb	a0,10(s3)
8000bd54:	00855513          	srli	a0,a0,0x8
8000bd58:	00a985a3          	sb	a0,11(s3)
8000bd5c:	014ca783          	lw	a5,20(s9)
8000bd60:	00c12603          	lw	a2,12(sp)
8000bd64:	000b0593          	mv	a1,s6
8000bd68:	000c8513          	mv	a0,s9
8000bd6c:	000780e7          	jalr	a5 # 2000 <_stack_size+0x1800>
8000bd70:	060d2783          	lw	a5,96(s10)
8000bd74:	000b0513          	mv	a0,s6
8000bd78:	415484b3          	sub	s1,s1,s5
8000bd7c:	00178793          	addi	a5,a5,1
8000bd80:	06fd2023          	sw	a5,96(s10)
8000bd84:	a94fb0ef          	jal	ra,80007018 <pbuf_free>
8000bd88:	00412783          	lw	a5,4(sp)
8000bd8c:	01049493          	slli	s1,s1,0x10
8000bd90:	0104d493          	srli	s1,s1,0x10
8000bd94:	00fb8bb3          	add	s7,s7,a5
8000bd98:	010b9b93          	slli	s7,s7,0x10
8000bd9c:	010bdb93          	srli	s7,s7,0x10
8000bda0:	dddff06f          	j	8000bb7c <ip4_frag+0xf8>
8000bda4:	ffa00513          	li	a0,-6
8000bda8:	dddff06f          	j	8000bb84 <ip4_frag+0x100>

8000bdac <ip4_input_accept>:
8000bdac:	03554783          	lbu	a5,53(a0)
8000bdb0:	0017f793          	andi	a5,a5,1
8000bdb4:	04078063          	beqz	a5,8000bdf4 <ip4_input_accept+0x48>
8000bdb8:	00452703          	lw	a4,4(a0)
8000bdbc:	00050593          	mv	a1,a0
8000bdc0:	00000513          	li	a0,0
8000bdc4:	02070c63          	beqz	a4,8000bdfc <ip4_input_accept+0x50>
8000bdc8:	a001a783          	lw	a5,-1536(gp) # 80003240 <ip_data+0x14>
8000bdcc:	00100513          	li	a0,1
8000bdd0:	02f70663          	beq	a4,a5,8000bdfc <ip4_input_accept+0x50>
8000bdd4:	ff010113          	addi	sp,sp,-16
8000bdd8:	00078513          	mv	a0,a5
8000bddc:	00112623          	sw	ra,12(sp)
8000bde0:	7e4000ef          	jal	ra,8000c5c4 <ip4_addr_isbroadcast_u32>
8000bde4:	00c12083          	lw	ra,12(sp)
8000bde8:	00a03533          	snez	a0,a0
8000bdec:	01010113          	addi	sp,sp,16
8000bdf0:	00008067          	ret
8000bdf4:	00000513          	li	a0,0
8000bdf8:	00008067          	ret
8000bdfc:	00008067          	ret

8000be00 <ip4_route>:
8000be00:	8cc1a783          	lw	a5,-1844(gp) # 8000310c <netif_list>
8000be04:	04079463          	bnez	a5,8000be4c <ip4_route+0x4c>
8000be08:	8c81a703          	lw	a4,-1848(gp) # 80003108 <netif_default>
8000be0c:	02070463          	beqz	a4,8000be34 <ip4_route+0x34>
8000be10:	03574683          	lbu	a3,53(a4)
8000be14:	00500613          	li	a2,5
8000be18:	0056f693          	andi	a3,a3,5
8000be1c:	00c69c63          	bne	a3,a2,8000be34 <ip4_route+0x34>
8000be20:	00472683          	lw	a3,4(a4)
8000be24:	00068863          	beqz	a3,8000be34 <ip4_route+0x34>
8000be28:	00054603          	lbu	a2,0(a0)
8000be2c:	07f00693          	li	a3,127
8000be30:	06d61463          	bne	a2,a3,8000be98 <ip4_route+0x98>
8000be34:	a0418713          	addi	a4,gp,-1532 # 80003244 <lwip_stats>
8000be38:	0ac72683          	lw	a3,172(a4)
8000be3c:	00168693          	addi	a3,a3,1
8000be40:	0ad72623          	sw	a3,172(a4)
8000be44:	00078513          	mv	a0,a5
8000be48:	00008067          	ret
8000be4c:	0357c683          	lbu	a3,53(a5)
8000be50:	0016f713          	andi	a4,a3,1
8000be54:	02070e63          	beqz	a4,8000be90 <ip4_route+0x90>
8000be58:	0026d713          	srli	a4,a3,0x2
8000be5c:	00177713          	andi	a4,a4,1
8000be60:	02070863          	beqz	a4,8000be90 <ip4_route+0x90>
8000be64:	0047a703          	lw	a4,4(a5)
8000be68:	02070463          	beqz	a4,8000be90 <ip4_route+0x90>
8000be6c:	00052603          	lw	a2,0(a0)
8000be70:	0087a583          	lw	a1,8(a5)
8000be74:	00c74733          	xor	a4,a4,a2
8000be78:	00b77733          	and	a4,a4,a1
8000be7c:	fc0704e3          	beqz	a4,8000be44 <ip4_route+0x44>
8000be80:	0026f693          	andi	a3,a3,2
8000be84:	00069663          	bnez	a3,8000be90 <ip4_route+0x90>
8000be88:	00c7a703          	lw	a4,12(a5)
8000be8c:	fae60ce3          	beq	a2,a4,8000be44 <ip4_route+0x44>
8000be90:	0007a783          	lw	a5,0(a5)
8000be94:	f71ff06f          	j	8000be04 <ip4_route+0x4>
8000be98:	00070793          	mv	a5,a4
8000be9c:	fa9ff06f          	j	8000be44 <ip4_route+0x44>

8000bea0 <ip4_input>:
8000bea0:	fd010113          	addi	sp,sp,-48
8000bea4:	02812423          	sw	s0,40(sp)
8000bea8:	03212023          	sw	s2,32(sp)
8000beac:	02112623          	sw	ra,44(sp)
8000beb0:	02912223          	sw	s1,36(sp)
8000beb4:	01312e23          	sw	s3,28(sp)
8000beb8:	01412c23          	sw	s4,24(sp)
8000bebc:	01512a23          	sw	s5,20(sp)
8000bec0:	01612823          	sw	s6,16(sp)
8000bec4:	01712623          	sw	s7,12(sp)
8000bec8:	01812423          	sw	s8,8(sp)
8000becc:	a0418913          	addi	s2,gp,-1532 # 80003244 <lwip_stats>
8000bed0:	09492783          	lw	a5,148(s2)
8000bed4:	00178793          	addi	a5,a5,1
8000bed8:	08f92a23          	sw	a5,148(s2)
8000bedc:	00452483          	lw	s1,4(a0)
8000bee0:	00400793          	li	a5,4
8000bee4:	0004cb03          	lbu	s6,0(s1)
8000bee8:	004b5713          	srli	a4,s6,0x4
8000beec:	04f70a63          	beq	a4,a5,8000bf40 <ip4_input+0xa0>
8000bef0:	928fb0ef          	jal	ra,80007018 <pbuf_free>
8000bef4:	0b892783          	lw	a5,184(s2)
8000bef8:	00178793          	addi	a5,a5,1
8000befc:	0af92c23          	sw	a5,184(s2)
8000bf00:	09c92783          	lw	a5,156(s2)
8000bf04:	00178793          	addi	a5,a5,1
8000bf08:	08f92e23          	sw	a5,156(s2)
8000bf0c:	02c12083          	lw	ra,44(sp)
8000bf10:	02812403          	lw	s0,40(sp)
8000bf14:	02412483          	lw	s1,36(sp)
8000bf18:	02012903          	lw	s2,32(sp)
8000bf1c:	01c12983          	lw	s3,28(sp)
8000bf20:	01812a03          	lw	s4,24(sp)
8000bf24:	01412a83          	lw	s5,20(sp)
8000bf28:	01012b03          	lw	s6,16(sp)
8000bf2c:	00c12b83          	lw	s7,12(sp)
8000bf30:	00812c03          	lw	s8,8(sp)
8000bf34:	00000513          	li	a0,0
8000bf38:	03010113          	addi	sp,sp,48
8000bf3c:	00008067          	ret
8000bf40:	0034c783          	lbu	a5,3(s1)
8000bf44:	00050993          	mv	s3,a0
8000bf48:	0024c503          	lbu	a0,2(s1)
8000bf4c:	00879793          	slli	a5,a5,0x8
8000bf50:	00058a93          	mv	s5,a1
8000bf54:	00a7e533          	or	a0,a5,a0
8000bf58:	e9df90ef          	jal	ra,80005df4 <lwip_htons>
8000bf5c:	00fb7b13          	andi	s6,s6,15
8000bf60:	0089d783          	lhu	a5,8(s3)
8000bf64:	002b1b13          	slli	s6,s6,0x2
8000bf68:	010b1913          	slli	s2,s6,0x10
8000bf6c:	a0418413          	addi	s0,gp,-1532 # 80003244 <lwip_stats>
8000bf70:	01095913          	srli	s2,s2,0x10
8000bf74:	00050a13          	mv	s4,a0
8000bf78:	00f57863          	bgeu	a0,a5,8000bf88 <ip4_input+0xe8>
8000bf7c:	00050593          	mv	a1,a0
8000bf80:	00098513          	mv	a0,s3
8000bf84:	b38fb0ef          	jal	ra,800072bc <pbuf_realloc>
8000bf88:	00a9d783          	lhu	a5,10(s3)
8000bf8c:	0127ea63          	bltu	a5,s2,8000bfa0 <ip4_input+0x100>
8000bf90:	0089d783          	lhu	a5,8(s3)
8000bf94:	0147e663          	bltu	a5,s4,8000bfa0 <ip4_input+0x100>
8000bf98:	01300793          	li	a5,19
8000bf9c:	0327e463          	bltu	a5,s2,8000bfc4 <ip4_input+0x124>
8000bfa0:	00098513          	mv	a0,s3
8000bfa4:	874fb0ef          	jal	ra,80007018 <pbuf_free>
8000bfa8:	0a442783          	lw	a5,164(s0)
8000bfac:	00178793          	addi	a5,a5,1
8000bfb0:	0af42223          	sw	a5,164(s0)
8000bfb4:	09c42783          	lw	a5,156(s0)
8000bfb8:	00178793          	addi	a5,a5,1
8000bfbc:	08f42e23          	sw	a5,156(s0)
8000bfc0:	f4dff06f          	j	8000bf0c <ip4_input+0x6c>
8000bfc4:	00090593          	mv	a1,s2
8000bfc8:	00048513          	mv	a0,s1
8000bfcc:	c1cfa0ef          	jal	ra,800063e8 <inet_chksum>
8000bfd0:	00050e63          	beqz	a0,8000bfec <ip4_input+0x14c>
8000bfd4:	00098513          	mv	a0,s3
8000bfd8:	840fb0ef          	jal	ra,80007018 <pbuf_free>
8000bfdc:	0a042783          	lw	a5,160(s0)
8000bfe0:	00178793          	addi	a5,a5,1
8000bfe4:	0af42023          	sw	a5,160(s0)
8000bfe8:	fcdff06f          	j	8000bfb4 <ip4_input+0x114>
8000bfec:	0114c703          	lbu	a4,17(s1)
8000bff0:	0104c783          	lbu	a5,16(s1)
8000bff4:	00871713          	slli	a4,a4,0x8
8000bff8:	00f76733          	or	a4,a4,a5
8000bffc:	0124c783          	lbu	a5,18(s1)
8000c000:	9ec18613          	addi	a2,gp,-1556 # 8000322c <ip_data>
8000c004:	9ec18913          	addi	s2,gp,-1556 # 8000322c <ip_data>
8000c008:	01079793          	slli	a5,a5,0x10
8000c00c:	00e7e733          	or	a4,a5,a4
8000c010:	0134c783          	lbu	a5,19(s1)
8000c014:	01879793          	slli	a5,a5,0x18
8000c018:	00e7e7b3          	or	a5,a5,a4
8000c01c:	00f62a23          	sw	a5,20(a2)
8000c020:	00d4c683          	lbu	a3,13(s1)
8000c024:	00c4c703          	lbu	a4,12(s1)
8000c028:	0f07f793          	andi	a5,a5,240
8000c02c:	00869693          	slli	a3,a3,0x8
8000c030:	00e6e6b3          	or	a3,a3,a4
8000c034:	00e4c703          	lbu	a4,14(s1)
8000c038:	01071713          	slli	a4,a4,0x10
8000c03c:	00d766b3          	or	a3,a4,a3
8000c040:	00f4c703          	lbu	a4,15(s1)
8000c044:	01871713          	slli	a4,a4,0x18
8000c048:	00d76733          	or	a4,a4,a3
8000c04c:	00e62823          	sw	a4,16(a2)
8000c050:	0e000713          	li	a4,224
8000c054:	06e79063          	bne	a5,a4,8000c0b4 <ip4_input+0x214>
8000c058:	035ac783          	lbu	a5,53(s5)
8000c05c:	0017f793          	andi	a5,a5,1
8000c060:	00079c63          	bnez	a5,8000c078 <ip4_input+0x1d8>
8000c064:	0094c703          	lbu	a4,9(s1)
8000c068:	01100793          	li	a5,17
8000c06c:	08f70663          	beq	a4,a5,8000c0f8 <ip4_input+0x258>
8000c070:	00000a13          	li	s4,0
8000c074:	0100006f          	j	8000c084 <ip4_input+0x1e4>
8000c078:	004aa783          	lw	a5,4(s5)
8000c07c:	fe0784e3          	beqz	a5,8000c064 <ip4_input+0x1c4>
8000c080:	000a8a13          	mv	s4,s5
8000c084:	01092503          	lw	a0,16(s2)
8000c088:	08050a63          	beqz	a0,8000c11c <ip4_input+0x27c>
8000c08c:	000a8593          	mv	a1,s5
8000c090:	534000ef          	jal	ra,8000c5c4 <ip4_addr_isbroadcast_u32>
8000c094:	00051a63          	bnez	a0,8000c0a8 <ip4_input+0x208>
8000c098:	01092783          	lw	a5,16(s2)
8000c09c:	0e000713          	li	a4,224
8000c0a0:	0f07f793          	andi	a5,a5,240
8000c0a4:	06e79c63          	bne	a5,a4,8000c11c <ip4_input+0x27c>
8000c0a8:	00098513          	mv	a0,s3
8000c0ac:	f6dfa0ef          	jal	ra,80007018 <pbuf_free>
8000c0b0:	f05ff06f          	j	8000bfb4 <ip4_input+0x114>
8000c0b4:	000a8513          	mv	a0,s5
8000c0b8:	cf5ff0ef          	jal	ra,8000bdac <ip4_input_accept>
8000c0bc:	02051a63          	bnez	a0,8000c0f0 <ip4_input+0x250>
8000c0c0:	01494703          	lbu	a4,20(s2)
8000c0c4:	07f00793          	li	a5,127
8000c0c8:	f8f70ee3          	beq	a4,a5,8000c064 <ip4_input+0x1c4>
8000c0cc:	8cc1aa03          	lw	s4,-1844(gp) # 8000310c <netif_list>
8000c0d0:	f80a0ae3          	beqz	s4,8000c064 <ip4_input+0x1c4>
8000c0d4:	015a1663          	bne	s4,s5,8000c0e0 <ip4_input+0x240>
8000c0d8:	000a2a03          	lw	s4,0(s4)
8000c0dc:	ff5ff06f          	j	8000c0d0 <ip4_input+0x230>
8000c0e0:	000a0513          	mv	a0,s4
8000c0e4:	cc9ff0ef          	jal	ra,8000bdac <ip4_input_accept>
8000c0e8:	fe0508e3          	beqz	a0,8000c0d8 <ip4_input+0x238>
8000c0ec:	f99ff06f          	j	8000c084 <ip4_input+0x1e4>
8000c0f0:	f80a98e3          	bnez	s5,8000c080 <ip4_input+0x1e0>
8000c0f4:	f71ff06f          	j	8000c064 <ip4_input+0x1c4>
8000c0f8:	01648733          	add	a4,s1,s6
8000c0fc:	00374783          	lbu	a5,3(a4)
8000c100:	00274683          	lbu	a3,2(a4)
8000c104:	00004737          	lui	a4,0x4
8000c108:	00879793          	slli	a5,a5,0x8
8000c10c:	00d7e7b3          	or	a5,a5,a3
8000c110:	40070713          	addi	a4,a4,1024 # 4400 <_stack_size+0x3c00>
8000c114:	f4e79ee3          	bne	a5,a4,8000c070 <ip4_input+0x1d0>
8000c118:	000a8a13          	mv	s4,s5
8000c11c:	000a1e63          	bnez	s4,8000c138 <ip4_input+0x298>
8000c120:	09c42783          	lw	a5,156(s0)
8000c124:	00098513          	mv	a0,s3
8000c128:	00178793          	addi	a5,a5,1
8000c12c:	08f42e23          	sw	a5,156(s0)
8000c130:	ee9fa0ef          	jal	ra,80007018 <pbuf_free>
8000c134:	dd9ff06f          	j	8000bf0c <ip4_input+0x6c>
8000c138:	0064c783          	lbu	a5,6(s1)
8000c13c:	0074c703          	lbu	a4,7(s1)
8000c140:	03f7f793          	andi	a5,a5,63
8000c144:	00871713          	slli	a4,a4,0x8
8000c148:	00e7e7b3          	or	a5,a5,a4
8000c14c:	00078e63          	beqz	a5,8000c168 <ip4_input+0x2c8>
8000c150:	00098513          	mv	a0,s3
8000c154:	ec5fa0ef          	jal	ra,80007018 <pbuf_free>
8000c158:	0b442783          	lw	a5,180(s0)
8000c15c:	00178793          	addi	a5,a5,1
8000c160:	0af42a23          	sw	a5,180(s0)
8000c164:	e51ff06f          	j	8000bfb4 <ip4_input+0x114>
8000c168:	01492023          	sw	s4,0(s2)
8000c16c:	01592223          	sw	s5,4(s2)
8000c170:	00992423          	sw	s1,8(s2)
8000c174:	0004c783          	lbu	a5,0(s1)
8000c178:	000a8593          	mv	a1,s5
8000c17c:	00098513          	mv	a0,s3
8000c180:	00f7f793          	andi	a5,a5,15
8000c184:	00279793          	slli	a5,a5,0x2
8000c188:	00f91623          	sh	a5,12(s2)
8000c18c:	00100c13          	li	s8,1
8000c190:	a7dfb0ef          	jal	ra,80007c0c <raw_input>
8000c194:	00050b93          	mv	s7,a0
8000c198:	03850663          	beq	a0,s8,8000c1c4 <ip4_input+0x324>
8000c19c:	000b0593          	mv	a1,s6
8000c1a0:	00098513          	mv	a0,s3
8000c1a4:	dedfa0ef          	jal	ra,80006f90 <pbuf_remove_header>
8000c1a8:	0094c783          	lbu	a5,9(s1)
8000c1ac:	03878a63          	beq	a5,s8,8000c1e0 <ip4_input+0x340>
8000c1b0:	01100713          	li	a4,17
8000c1b4:	02e79e63          	bne	a5,a4,8000c1f0 <ip4_input+0x350>
8000c1b8:	000a8593          	mv	a1,s5
8000c1bc:	00098513          	mv	a0,s3
8000c1c0:	a40fc0ef          	jal	ra,80008400 <udp_input>
8000c1c4:	00092023          	sw	zero,0(s2)
8000c1c8:	00092223          	sw	zero,4(s2)
8000c1cc:	00092423          	sw	zero,8(s2)
8000c1d0:	00091623          	sh	zero,12(s2)
8000c1d4:	00092823          	sw	zero,16(s2)
8000c1d8:	00092a23          	sw	zero,20(s2)
8000c1dc:	d31ff06f          	j	8000bf0c <ip4_input+0x6c>
8000c1e0:	000a8593          	mv	a1,s5
8000c1e4:	00098513          	mv	a0,s3
8000c1e8:	c18ff0ef          	jal	ra,8000b600 <icmp_input>
8000c1ec:	fd9ff06f          	j	8000c1c4 <ip4_input+0x324>
8000c1f0:	00200793          	li	a5,2
8000c1f4:	04fb8a63          	beq	s7,a5,8000c248 <ip4_input+0x3a8>
8000c1f8:	01492503          	lw	a0,20(s2)
8000c1fc:	000a0593          	mv	a1,s4
8000c200:	3c4000ef          	jal	ra,8000c5c4 <ip4_addr_isbroadcast_u32>
8000c204:	02051663          	bnez	a0,8000c230 <ip4_input+0x390>
8000c208:	01492783          	lw	a5,20(s2)
8000c20c:	0e000713          	li	a4,224
8000c210:	0f07f793          	andi	a5,a5,240
8000c214:	00e78e63          	beq	a5,a4,8000c230 <ip4_input+0x390>
8000c218:	000b0593          	mv	a1,s6
8000c21c:	00098513          	mv	a0,s3
8000c220:	de5fa0ef          	jal	ra,80007004 <pbuf_header_force>
8000c224:	00200593          	li	a1,2
8000c228:	00098513          	mv	a0,s3
8000c22c:	ef8ff0ef          	jal	ra,8000b924 <icmp_dest_unreach>
8000c230:	0b042783          	lw	a5,176(s0)
8000c234:	00178793          	addi	a5,a5,1
8000c238:	0af42823          	sw	a5,176(s0)
8000c23c:	09c42783          	lw	a5,156(s0)
8000c240:	00178793          	addi	a5,a5,1
8000c244:	08f42e23          	sw	a5,156(s0)
8000c248:	00098513          	mv	a0,s3
8000c24c:	dcdfa0ef          	jal	ra,80007018 <pbuf_free>
8000c250:	f75ff06f          	j	8000c1c4 <ip4_input+0x324>

8000c254 <ip4_output_if_src>:
8000c254:	fc010113          	addi	sp,sp,-64
8000c258:	03212823          	sw	s2,48(sp)
8000c25c:	03412423          	sw	s4,40(sp)
8000c260:	03512223          	sw	s5,36(sp)
8000c264:	02112e23          	sw	ra,60(sp)
8000c268:	02812c23          	sw	s0,56(sp)
8000c26c:	02912a23          	sw	s1,52(sp)
8000c270:	03312623          	sw	s3,44(sp)
8000c274:	03612023          	sw	s6,32(sp)
8000c278:	00d12623          	sw	a3,12(sp)
8000c27c:	00f12423          	sw	a5,8(sp)
8000c280:	00c12223          	sw	a2,4(sp)
8000c284:	00050913          	mv	s2,a0
8000c288:	00080a13          	mv	s4,a6
8000c28c:	a0418a93          	addi	s5,gp,-1532 # 80003244 <lwip_stats>
8000c290:	1a060863          	beqz	a2,8000c440 <ip4_output_if_src+0x1ec>
8000c294:	00058993          	mv	s3,a1
8000c298:	01400593          	li	a1,20
8000c29c:	00070493          	mv	s1,a4
8000c2a0:	ce1fa0ef          	jal	ra,80006f80 <pbuf_add_header>
8000c2a4:	00412603          	lw	a2,4(sp)
8000c2a8:	00812783          	lw	a5,8(sp)
8000c2ac:	00c12683          	lw	a3,12(sp)
8000c2b0:	02050e63          	beqz	a0,8000c2ec <ip4_output_if_src+0x98>
8000c2b4:	0b8aa783          	lw	a5,184(s5)
8000c2b8:	ffe00513          	li	a0,-2
8000c2bc:	00178793          	addi	a5,a5,1
8000c2c0:	0afaac23          	sw	a5,184(s5)
8000c2c4:	03c12083          	lw	ra,60(sp)
8000c2c8:	03812403          	lw	s0,56(sp)
8000c2cc:	03412483          	lw	s1,52(sp)
8000c2d0:	03012903          	lw	s2,48(sp)
8000c2d4:	02c12983          	lw	s3,44(sp)
8000c2d8:	02812a03          	lw	s4,40(sp)
8000c2dc:	02412a83          	lw	s5,36(sp)
8000c2e0:	02012b03          	lw	s6,32(sp)
8000c2e4:	04010113          	addi	sp,sp,64
8000c2e8:	00008067          	ret
8000c2ec:	00492403          	lw	s0,4(s2)
8000c2f0:	00c12223          	sw	a2,4(sp)
8000c2f4:	00d40423          	sb	a3,8(s0)
8000c2f8:	00f404a3          	sb	a5,9(s0)
8000c2fc:	00869693          	slli	a3,a3,0x8
8000c300:	00f6e7b3          	or	a5,a3,a5
8000c304:	00062683          	lw	a3,0(a2)
8000c308:	009400a3          	sb	s1,1(s0)
8000c30c:	00849493          	slli	s1,s1,0x8
8000c310:	0086d593          	srli	a1,a3,0x8
8000c314:	00d40823          	sb	a3,16(s0)
8000c318:	00b408a3          	sb	a1,17(s0)
8000c31c:	0186d513          	srli	a0,a3,0x18
8000c320:	0106d593          	srli	a1,a3,0x10
8000c324:	01069693          	slli	a3,a3,0x10
8000c328:	0106d693          	srli	a3,a3,0x10
8000c32c:	00b686b3          	add	a3,a3,a1
8000c330:	00a409a3          	sb	a0,19(s0)
8000c334:	0454e493          	ori	s1,s1,69
8000c338:	04500513          	li	a0,69
8000c33c:	00b40923          	sb	a1,18(s0)
8000c340:	00a40023          	sb	a0,0(s0)
8000c344:	00d484b3          	add	s1,s1,a3
8000c348:	00879693          	slli	a3,a5,0x8
8000c34c:	4087d793          	srai	a5,a5,0x8
8000c350:	00f6e7b3          	or	a5,a3,a5
8000c354:	00895503          	lhu	a0,8(s2)
8000c358:	01079793          	slli	a5,a5,0x10
8000c35c:	0107d793          	srli	a5,a5,0x10
8000c360:	00f484b3          	add	s1,s1,a5
8000c364:	a91f90ef          	jal	ra,80005df4 <lwip_htons>
8000c368:	00855793          	srli	a5,a0,0x8
8000c36c:	00a40123          	sb	a0,2(s0)
8000c370:	009504b3          	add	s1,a0,s1
8000c374:	8f01d503          	lhu	a0,-1808(gp) # 80003130 <ip_id>
8000c378:	00f401a3          	sb	a5,3(s0)
8000c37c:	00040323          	sb	zero,6(s0)
8000c380:	000403a3          	sb	zero,7(s0)
8000c384:	a71f90ef          	jal	ra,80005df4 <lwip_htons>
8000c388:	00855793          	srli	a5,a0,0x8
8000c38c:	00f402a3          	sb	a5,5(s0)
8000c390:	8f01d783          	lhu	a5,-1808(gp) # 80003130 <ip_id>
8000c394:	00a40223          	sb	a0,4(s0)
8000c398:	00412603          	lw	a2,4(sp)
8000c39c:	00178793          	addi	a5,a5,1
8000c3a0:	8ef19823          	sh	a5,-1808(gp) # 80003130 <ip_id>
8000c3a4:	00950533          	add	a0,a0,s1
8000c3a8:	08099863          	bnez	s3,8000c438 <ip4_output_if_src+0x1e4>
8000c3ac:	8481a703          	lw	a4,-1976(gp) # 80003088 <ip_addr_any>
8000c3b0:	01875693          	srli	a3,a4,0x18
8000c3b4:	00d407a3          	sb	a3,15(s0)
8000c3b8:	000106b7          	lui	a3,0x10
8000c3bc:	00875793          	srli	a5,a4,0x8
8000c3c0:	fff68693          	addi	a3,a3,-1 # ffff <_stack_size+0xf7ff>
8000c3c4:	00e40623          	sb	a4,12(s0)
8000c3c8:	00f406a3          	sb	a5,13(s0)
8000c3cc:	01075793          	srli	a5,a4,0x10
8000c3d0:	00d77733          	and	a4,a4,a3
8000c3d4:	00a70733          	add	a4,a4,a0
8000c3d8:	00e78733          	add	a4,a5,a4
8000c3dc:	00f40723          	sb	a5,14(s0)
8000c3e0:	01075793          	srli	a5,a4,0x10
8000c3e4:	00d77733          	and	a4,a4,a3
8000c3e8:	00e78733          	add	a4,a5,a4
8000c3ec:	01075793          	srli	a5,a4,0x10
8000c3f0:	00e787b3          	add	a5,a5,a4
8000c3f4:	fff7c793          	not	a5,a5
8000c3f8:	01079793          	slli	a5,a5,0x10
8000c3fc:	0107d793          	srli	a5,a5,0x10
8000c400:	00f40523          	sb	a5,10(s0)
8000c404:	0087d793          	srli	a5,a5,0x8
8000c408:	00f405a3          	sb	a5,11(s0)
8000c40c:	090aa783          	lw	a5,144(s5)
8000c410:	00178793          	addi	a5,a5,1
8000c414:	08faa823          	sw	a5,144(s5)
8000c418:	02ca5783          	lhu	a5,44(s4)
8000c41c:	06078463          	beqz	a5,8000c484 <ip4_output_if_src+0x230>
8000c420:	00895703          	lhu	a4,8(s2)
8000c424:	06e7f063          	bgeu	a5,a4,8000c484 <ip4_output_if_src+0x230>
8000c428:	000a0593          	mv	a1,s4
8000c42c:	00090513          	mv	a0,s2
8000c430:	e54ff0ef          	jal	ra,8000ba84 <ip4_frag>
8000c434:	e91ff06f          	j	8000c2c4 <ip4_output_if_src+0x70>
8000c438:	0009a703          	lw	a4,0(s3)
8000c43c:	f75ff06f          	j	8000c3b0 <ip4_output_if_src+0x15c>
8000c440:	00a55703          	lhu	a4,10(a0)
8000c444:	01300793          	li	a5,19
8000c448:	e6e7f6e3          	bgeu	a5,a4,8000c2b4 <ip4_output_if_src+0x60>
8000c44c:	00452683          	lw	a3,4(a0)
8000c450:	01c10613          	addi	a2,sp,28
8000c454:	0116c703          	lbu	a4,17(a3)
8000c458:	0106c783          	lbu	a5,16(a3)
8000c45c:	00871713          	slli	a4,a4,0x8
8000c460:	00f76733          	or	a4,a4,a5
8000c464:	0126c783          	lbu	a5,18(a3)
8000c468:	01079793          	slli	a5,a5,0x10
8000c46c:	00e7e733          	or	a4,a5,a4
8000c470:	0136c783          	lbu	a5,19(a3)
8000c474:	01879793          	slli	a5,a5,0x18
8000c478:	00e7e7b3          	or	a5,a5,a4
8000c47c:	00f12e23          	sw	a5,28(sp)
8000c480:	f8dff06f          	j	8000c40c <ip4_output_if_src+0x1b8>
8000c484:	014a2783          	lw	a5,20(s4)
8000c488:	00090593          	mv	a1,s2
8000c48c:	000a0513          	mv	a0,s4
8000c490:	000780e7          	jalr	a5
8000c494:	e31ff06f          	j	8000c2c4 <ip4_output_if_src+0x70>

8000c498 <ip4_output_if>:
8000c498:	00060a63          	beqz	a2,8000c4ac <ip4_output_if+0x14>
8000c49c:	00058663          	beqz	a1,8000c4a8 <ip4_output_if+0x10>
8000c4a0:	0005a883          	lw	a7,0(a1)
8000c4a4:	00089463          	bnez	a7,8000c4ac <ip4_output_if+0x14>
8000c4a8:	00480593          	addi	a1,a6,4
8000c4ac:	da9ff06f          	j	8000c254 <ip4_output_if_src>

8000c4b0 <ip4_output>:
8000c4b0:	fd010113          	addi	sp,sp,-48
8000c4b4:	02812423          	sw	s0,40(sp)
8000c4b8:	00050413          	mv	s0,a0
8000c4bc:	00060513          	mv	a0,a2
8000c4c0:	00b12e23          	sw	a1,28(sp)
8000c4c4:	00d12c23          	sw	a3,24(sp)
8000c4c8:	00e12a23          	sw	a4,20(sp)
8000c4cc:	00f12823          	sw	a5,16(sp)
8000c4d0:	00c12623          	sw	a2,12(sp)
8000c4d4:	02112623          	sw	ra,44(sp)
8000c4d8:	929ff0ef          	jal	ra,8000be00 <ip4_route>
8000c4dc:	00c12603          	lw	a2,12(sp)
8000c4e0:	01012783          	lw	a5,16(sp)
8000c4e4:	01412703          	lw	a4,20(sp)
8000c4e8:	01812683          	lw	a3,24(sp)
8000c4ec:	01c12583          	lw	a1,28(sp)
8000c4f0:	00050e63          	beqz	a0,8000c50c <ip4_output+0x5c>
8000c4f4:	00050813          	mv	a6,a0
8000c4f8:	00040513          	mv	a0,s0
8000c4fc:	02812403          	lw	s0,40(sp)
8000c500:	02c12083          	lw	ra,44(sp)
8000c504:	03010113          	addi	sp,sp,48
8000c508:	f91ff06f          	j	8000c498 <ip4_output_if>
8000c50c:	a0418793          	addi	a5,gp,-1532 # 80003244 <lwip_stats>
8000c510:	0ac7a703          	lw	a4,172(a5)
8000c514:	ffc00513          	li	a0,-4
8000c518:	00170713          	addi	a4,a4,1
8000c51c:	0ae7a623          	sw	a4,172(a5)
8000c520:	02c12083          	lw	ra,44(sp)
8000c524:	02812403          	lw	s0,40(sp)
8000c528:	03010113          	addi	sp,sp,48
8000c52c:	00008067          	ret

8000c530 <ip4_output_hinted>:
8000c530:	fd010113          	addi	sp,sp,-48
8000c534:	02912223          	sw	s1,36(sp)
8000c538:	00050493          	mv	s1,a0
8000c53c:	00060513          	mv	a0,a2
8000c540:	00b12e23          	sw	a1,28(sp)
8000c544:	00d12c23          	sw	a3,24(sp)
8000c548:	00e12a23          	sw	a4,20(sp)
8000c54c:	00f12823          	sw	a5,16(sp)
8000c550:	01012623          	sw	a6,12(sp)
8000c554:	00c12423          	sw	a2,8(sp)
8000c558:	02112623          	sw	ra,44(sp)
8000c55c:	02812423          	sw	s0,40(sp)
8000c560:	8a1ff0ef          	jal	ra,8000be00 <ip4_route>
8000c564:	00812603          	lw	a2,8(sp)
8000c568:	00c12803          	lw	a6,12(sp)
8000c56c:	01012783          	lw	a5,16(sp)
8000c570:	01412703          	lw	a4,20(sp)
8000c574:	01812683          	lw	a3,24(sp)
8000c578:	01c12583          	lw	a1,28(sp)
8000c57c:	02051663          	bnez	a0,8000c5a8 <ip4_output_hinted+0x78>
8000c580:	a0418793          	addi	a5,gp,-1532 # 80003244 <lwip_stats>
8000c584:	0ac7a703          	lw	a4,172(a5)
8000c588:	ffc00513          	li	a0,-4
8000c58c:	00170713          	addi	a4,a4,1
8000c590:	0ae7a623          	sw	a4,172(a5)
8000c594:	02c12083          	lw	ra,44(sp)
8000c598:	02812403          	lw	s0,40(sp)
8000c59c:	02412483          	lw	s1,36(sp)
8000c5a0:	03010113          	addi	sp,sp,48
8000c5a4:	00008067          	ret
8000c5a8:	03052e23          	sw	a6,60(a0)
8000c5ac:	00050413          	mv	s0,a0
8000c5b0:	00050813          	mv	a6,a0
8000c5b4:	00048513          	mv	a0,s1
8000c5b8:	ee1ff0ef          	jal	ra,8000c498 <ip4_output_if>
8000c5bc:	02042e23          	sw	zero,60(s0)
8000c5c0:	fd5ff06f          	j	8000c594 <ip4_output_hinted+0x64>

8000c5c4 <ip4_addr_isbroadcast_u32>:
8000c5c4:	fff50693          	addi	a3,a0,-1
8000c5c8:	ffd00793          	li	a5,-3
8000c5cc:	00050713          	mv	a4,a0
8000c5d0:	04d7e063          	bltu	a5,a3,8000c610 <ip4_addr_isbroadcast_u32+0x4c>
8000c5d4:	0355c783          	lbu	a5,53(a1)
8000c5d8:	0027f513          	andi	a0,a5,2
8000c5dc:	02050c63          	beqz	a0,8000c614 <ip4_addr_isbroadcast_u32+0x50>
8000c5e0:	0045a783          	lw	a5,4(a1)
8000c5e4:	00000513          	li	a0,0
8000c5e8:	02e78663          	beq	a5,a4,8000c614 <ip4_addr_isbroadcast_u32+0x50>
8000c5ec:	0085a683          	lw	a3,8(a1)
8000c5f0:	00e7c7b3          	xor	a5,a5,a4
8000c5f4:	00d7f7b3          	and	a5,a5,a3
8000c5f8:	00079e63          	bnez	a5,8000c614 <ip4_addr_isbroadcast_u32+0x50>
8000c5fc:	fff6c693          	not	a3,a3
8000c600:	00e6f533          	and	a0,a3,a4
8000c604:	40d50533          	sub	a0,a0,a3
8000c608:	00153513          	seqz	a0,a0
8000c60c:	00008067          	ret
8000c610:	00100513          	li	a0,1
8000c614:	00008067          	ret

8000c618 <ip4_addr_netmask_valid>:
8000c618:	ff010113          	addi	sp,sp,-16
8000c61c:	00112623          	sw	ra,12(sp)
8000c620:	fecf90ef          	jal	ra,80005e0c <lwip_htonl>
8000c624:	02000713          	li	a4,32
8000c628:	800007b7          	lui	a5,0x80000
8000c62c:	00f576b3          	and	a3,a0,a5
8000c630:	02068663          	beqz	a3,8000c65c <ip4_addr_netmask_valid+0x44>
8000c634:	fff70713          	addi	a4,a4,-1
8000c638:	0017d793          	srli	a5,a5,0x1
8000c63c:	fe0718e3          	bnez	a4,8000c62c <ip4_addr_netmask_valid+0x14>
8000c640:	00100513          	li	a0,1
8000c644:	00c12083          	lw	ra,12(sp)
8000c648:	01010113          	addi	sp,sp,16
8000c64c:	00008067          	ret
8000c650:	00a7f733          	and	a4,a5,a0
8000c654:	00071863          	bnez	a4,8000c664 <ip4_addr_netmask_valid+0x4c>
8000c658:	0017d793          	srli	a5,a5,0x1
8000c65c:	fe079ae3          	bnez	a5,8000c650 <ip4_addr_netmask_valid+0x38>
8000c660:	fe1ff06f          	j	8000c640 <ip4_addr_netmask_valid+0x28>
8000c664:	00000513          	li	a0,0
8000c668:	fddff06f          	j	8000c644 <ip4_addr_netmask_valid+0x2c>

8000c66c <ip4addr_aton>:
8000c66c:	fb010113          	addi	sp,sp,-80
8000c670:	04812423          	sw	s0,72(sp)
8000c674:	05212023          	sw	s2,64(sp)
8000c678:	03312e23          	sw	s3,60(sp)
8000c67c:	03512a23          	sw	s5,52(sp)
8000c680:	03712623          	sw	s7,44(sp)
8000c684:	03812423          	sw	s8,40(sp)
8000c688:	03912223          	sw	s9,36(sp)
8000c68c:	03a12023          	sw	s10,32(sp)
8000c690:	01b12e23          	sw	s11,28(sp)
8000c694:	04112623          	sw	ra,76(sp)
8000c698:	04912223          	sw	s1,68(sp)
8000c69c:	03412c23          	sw	s4,56(sp)
8000c6a0:	03612823          	sw	s6,48(sp)
8000c6a4:	00054483          	lbu	s1,0(a0)
8000c6a8:	00010913          	mv	s2,sp
8000c6ac:	80003ab7          	lui	s5,0x80003
8000c6b0:	00058993          	mv	s3,a1
8000c6b4:	00090b93          	mv	s7,s2
8000c6b8:	d11a8a93          	addi	s5,s5,-751 # 80002d11 <_heap_end+0xffff0d11>
8000c6bc:	03000413          	li	s0,48
8000c6c0:	05800c13          	li	s8,88
8000c6c4:	01000c93          	li	s9,16
8000c6c8:	00200d13          	li	s10,2
8000c6cc:	02e00d93          	li	s11,46
8000c6d0:	00c10713          	addi	a4,sp,12
8000c6d4:	015487b3          	add	a5,s1,s5
8000c6d8:	0007c783          	lbu	a5,0(a5) # 80000000 <_heap_end+0xfffee000>
8000c6dc:	0047f793          	andi	a5,a5,4
8000c6e0:	1c078a63          	beqz	a5,8000c8b4 <ip4addr_aton+0x248>
8000c6e4:	00a00b13          	li	s6,10
8000c6e8:	00849c63          	bne	s1,s0,8000c700 <ip4addr_aton+0x94>
8000c6ec:	00154483          	lbu	s1,1(a0)
8000c6f0:	0df4f793          	andi	a5,s1,223
8000c6f4:	05878463          	beq	a5,s8,8000c73c <ip4addr_aton+0xd0>
8000c6f8:	00150513          	addi	a0,a0,1
8000c6fc:	00800b13          	li	s6,8
8000c700:	00050a13          	mv	s4,a0
8000c704:	00000513          	li	a0,0
8000c708:	009a87b3          	add	a5,s5,s1
8000c70c:	0007c783          	lbu	a5,0(a5)
8000c710:	0047f693          	andi	a3,a5,4
8000c714:	02068c63          	beqz	a3,8000c74c <ip4addr_aton+0xe0>
8000c718:	00050593          	mv	a1,a0
8000c71c:	000b0513          	mv	a0,s6
8000c720:	441000ef          	jal	ra,8000d360 <__mulsi3>
8000c724:	00950533          	add	a0,a0,s1
8000c728:	001a4483          	lbu	s1,1(s4)
8000c72c:	fd050513          	addi	a0,a0,-48
8000c730:	00c10713          	addi	a4,sp,12
8000c734:	001a0a13          	addi	s4,s4,1
8000c738:	fd1ff06f          	j	8000c708 <ip4addr_aton+0x9c>
8000c73c:	00254483          	lbu	s1,2(a0)
8000c740:	01000b13          	li	s6,16
8000c744:	00250513          	addi	a0,a0,2
8000c748:	fb9ff06f          	j	8000c700 <ip4addr_aton+0x94>
8000c74c:	039b1a63          	bne	s6,s9,8000c780 <ip4addr_aton+0x114>
8000c750:	0447f693          	andi	a3,a5,68
8000c754:	02068663          	beqz	a3,8000c780 <ip4addr_aton+0x114>
8000c758:	0037f793          	andi	a5,a5,3
8000c75c:	00451513          	slli	a0,a0,0x4
8000c760:	00a48493          	addi	s1,s1,10
8000c764:	06100593          	li	a1,97
8000c768:	01a78463          	beq	a5,s10,8000c770 <ip4addr_aton+0x104>
8000c76c:	04100593          	li	a1,65
8000c770:	40b484b3          	sub	s1,s1,a1
8000c774:	00a4e533          	or	a0,s1,a0
8000c778:	001a4483          	lbu	s1,1(s4)
8000c77c:	fb9ff06f          	j	8000c734 <ip4addr_aton+0xc8>
8000c780:	01b49e63          	bne	s1,s11,8000c79c <ip4addr_aton+0x130>
8000c784:	12e90863          	beq	s2,a4,8000c8b4 <ip4addr_aton+0x248>
8000c788:	00490913          	addi	s2,s2,4
8000c78c:	fea92e23          	sw	a0,-4(s2)
8000c790:	001a4483          	lbu	s1,1(s4)
8000c794:	001a0513          	addi	a0,s4,1
8000c798:	f3dff06f          	j	8000c6d4 <ip4addr_aton+0x68>
8000c79c:	00048863          	beqz	s1,8000c7ac <ip4addr_aton+0x140>
8000c7a0:	0087f793          	andi	a5,a5,8
8000c7a4:	00000413          	li	s0,0
8000c7a8:	02078863          	beqz	a5,8000c7d8 <ip4addr_aton+0x16c>
8000c7ac:	41790433          	sub	s0,s2,s7
8000c7b0:	40245413          	srai	s0,s0,0x2
8000c7b4:	00140413          	addi	s0,s0,1
8000c7b8:	00200793          	li	a5,2
8000c7bc:	0af40263          	beq	s0,a5,8000c860 <ip4addr_aton+0x1f4>
8000c7c0:	0487cc63          	blt	a5,s0,8000c818 <ip4addr_aton+0x1ac>
8000c7c4:	00040a63          	beqz	s0,8000c7d8 <ip4addr_aton+0x16c>
8000c7c8:	00100413          	li	s0,1
8000c7cc:	00098663          	beqz	s3,8000c7d8 <ip4addr_aton+0x16c>
8000c7d0:	e3cf90ef          	jal	ra,80005e0c <lwip_htonl>
8000c7d4:	00a9a023          	sw	a0,0(s3)
8000c7d8:	00040513          	mv	a0,s0
8000c7dc:	04c12083          	lw	ra,76(sp)
8000c7e0:	04812403          	lw	s0,72(sp)
8000c7e4:	04412483          	lw	s1,68(sp)
8000c7e8:	04012903          	lw	s2,64(sp)
8000c7ec:	03c12983          	lw	s3,60(sp)
8000c7f0:	03812a03          	lw	s4,56(sp)
8000c7f4:	03412a83          	lw	s5,52(sp)
8000c7f8:	03012b03          	lw	s6,48(sp)
8000c7fc:	02c12b83          	lw	s7,44(sp)
8000c800:	02812c03          	lw	s8,40(sp)
8000c804:	02412c83          	lw	s9,36(sp)
8000c808:	02012d03          	lw	s10,32(sp)
8000c80c:	01c12d83          	lw	s11,28(sp)
8000c810:	05010113          	addi	sp,sp,80
8000c814:	00008067          	ret
8000c818:	00300793          	li	a5,3
8000c81c:	06f40463          	beq	s0,a5,8000c884 <ip4addr_aton+0x218>
8000c820:	00400793          	li	a5,4
8000c824:	faf412e3          	bne	s0,a5,8000c7c8 <ip4addr_aton+0x15c>
8000c828:	0ff00613          	li	a2,255
8000c82c:	00000413          	li	s0,0
8000c830:	faa664e3          	bltu	a2,a0,8000c7d8 <ip4addr_aton+0x16c>
8000c834:	00012783          	lw	a5,0(sp)
8000c838:	faf660e3          	bltu	a2,a5,8000c7d8 <ip4addr_aton+0x16c>
8000c83c:	00412683          	lw	a3,4(sp)
8000c840:	f8d66ce3          	bltu	a2,a3,8000c7d8 <ip4addr_aton+0x16c>
8000c844:	00812703          	lw	a4,8(sp)
8000c848:	f8e668e3          	bltu	a2,a4,8000c7d8 <ip4addr_aton+0x16c>
8000c84c:	01879793          	slli	a5,a5,0x18
8000c850:	01069693          	slli	a3,a3,0x10
8000c854:	00d7e7b3          	or	a5,a5,a3
8000c858:	00871713          	slli	a4,a4,0x8
8000c85c:	0500006f          	j	8000c8ac <ip4addr_aton+0x240>
8000c860:	010007b7          	lui	a5,0x1000
8000c864:	00000413          	li	s0,0
8000c868:	f6f578e3          	bgeu	a0,a5,8000c7d8 <ip4addr_aton+0x16c>
8000c86c:	00012783          	lw	a5,0(sp)
8000c870:	0ff00713          	li	a4,255
8000c874:	f6f762e3          	bltu	a4,a5,8000c7d8 <ip4addr_aton+0x16c>
8000c878:	01879793          	slli	a5,a5,0x18
8000c87c:	00f56533          	or	a0,a0,a5
8000c880:	f49ff06f          	j	8000c7c8 <ip4addr_aton+0x15c>
8000c884:	000107b7          	lui	a5,0x10
8000c888:	00000413          	li	s0,0
8000c88c:	f4f576e3          	bgeu	a0,a5,8000c7d8 <ip4addr_aton+0x16c>
8000c890:	00012783          	lw	a5,0(sp)
8000c894:	0ff00693          	li	a3,255
8000c898:	f4f6e0e3          	bltu	a3,a5,8000c7d8 <ip4addr_aton+0x16c>
8000c89c:	00412703          	lw	a4,4(sp)
8000c8a0:	f2e6ece3          	bltu	a3,a4,8000c7d8 <ip4addr_aton+0x16c>
8000c8a4:	01879793          	slli	a5,a5,0x18
8000c8a8:	01071713          	slli	a4,a4,0x10
8000c8ac:	00e7e7b3          	or	a5,a5,a4
8000c8b0:	fcdff06f          	j	8000c87c <ip4addr_aton+0x210>
8000c8b4:	00000413          	li	s0,0
8000c8b8:	f21ff06f          	j	8000c7d8 <ip4addr_aton+0x16c>

8000c8bc <ipaddr_addr>:
8000c8bc:	fe010113          	addi	sp,sp,-32
8000c8c0:	00c10593          	addi	a1,sp,12
8000c8c4:	00112e23          	sw	ra,28(sp)
8000c8c8:	da5ff0ef          	jal	ra,8000c66c <ip4addr_aton>
8000c8cc:	00050a63          	beqz	a0,8000c8e0 <ipaddr_addr+0x24>
8000c8d0:	00c12503          	lw	a0,12(sp)
8000c8d4:	01c12083          	lw	ra,28(sp)
8000c8d8:	02010113          	addi	sp,sp,32
8000c8dc:	00008067          	ret
8000c8e0:	fff00513          	li	a0,-1
8000c8e4:	ff1ff06f          	j	8000c8d4 <ipaddr_addr+0x18>

8000c8e8 <ip4addr_ntoa_r>:
8000c8e8:	fb010113          	addi	sp,sp,-80
8000c8ec:	04912223          	sw	s1,68(sp)
8000c8f0:	05212023          	sw	s2,64(sp)
8000c8f4:	03312e23          	sw	s3,60(sp)
8000c8f8:	03612823          	sw	s6,48(sp)
8000c8fc:	03812423          	sw	s8,40(sp)
8000c900:	03912223          	sw	s9,36(sp)
8000c904:	03a12023          	sw	s10,32(sp)
8000c908:	04112623          	sw	ra,76(sp)
8000c90c:	04812423          	sw	s0,72(sp)
8000c910:	03412c23          	sw	s4,56(sp)
8000c914:	03512a23          	sw	s5,52(sp)
8000c918:	03712623          	sw	s7,44(sp)
8000c91c:	00052783          	lw	a5,0(a0)
8000c920:	00058493          	mv	s1,a1
8000c924:	00058b13          	mv	s6,a1
8000c928:	00f12e23          	sw	a5,28(sp)
8000c92c:	00000993          	li	s3,0
8000c930:	01c10913          	addi	s2,sp,28
8000c934:	00900c93          	li	s9,9
8000c938:	0ff00d13          	li	s10,255
8000c93c:	02e00c13          	li	s8,46
8000c940:	00094a03          	lbu	s4,0(s2)
8000c944:	00000413          	li	s0,0
8000c948:	00a00593          	li	a1,10
8000c94c:	000a0513          	mv	a0,s4
8000c950:	00c12623          	sw	a2,12(sp)
8000c954:	239000ef          	jal	ra,8000d38c <__udivsi3>
8000c958:	0ff57b93          	andi	s7,a0,255
8000c95c:	00a00593          	li	a1,10
8000c960:	000a0513          	mv	a0,s4
8000c964:	271000ef          	jal	ra,8000d3d4 <__umodsi3>
8000c968:	02010793          	addi	a5,sp,32
8000c96c:	03050513          	addi	a0,a0,48
8000c970:	008787b3          	add	a5,a5,s0
8000c974:	00140a93          	addi	s5,s0,1
8000c978:	fea78c23          	sb	a0,-8(a5) # fff8 <_stack_size+0xf7f8>
8000c97c:	0ffafa93          	andi	s5,s5,255
8000c980:	00c12603          	lw	a2,12(sp)
8000c984:	074ce863          	bltu	s9,s4,8000c9f4 <ip4addr_ntoa_r+0x10c>
8000c988:	01790023          	sb	s7,0(s2)
8000c98c:	00098713          	mv	a4,s3
8000c990:	000b0793          	mv	a5,s6
8000c994:	00198993          	addi	s3,s3,1
8000c998:	07a41463          	bne	s0,s10,8000ca00 <ip4addr_ntoa_r+0x118>
8000c99c:	08c75863          	bge	a4,a2,8000ca2c <ip4addr_ntoa_r+0x144>
8000c9a0:	01878023          	sb	s8,0(a5)
8000c9a4:	00190913          	addi	s2,s2,1
8000c9a8:	02010713          	addi	a4,sp,32
8000c9ac:	00178b13          	addi	s6,a5,1
8000c9b0:	f8e918e3          	bne	s2,a4,8000c940 <ip4addr_ntoa_r+0x58>
8000c9b4:	00078023          	sb	zero,0(a5)
8000c9b8:	00048513          	mv	a0,s1
8000c9bc:	04c12083          	lw	ra,76(sp)
8000c9c0:	04812403          	lw	s0,72(sp)
8000c9c4:	04412483          	lw	s1,68(sp)
8000c9c8:	04012903          	lw	s2,64(sp)
8000c9cc:	03c12983          	lw	s3,60(sp)
8000c9d0:	03812a03          	lw	s4,56(sp)
8000c9d4:	03412a83          	lw	s5,52(sp)
8000c9d8:	03012b03          	lw	s6,48(sp)
8000c9dc:	02c12b83          	lw	s7,44(sp)
8000c9e0:	02812c03          	lw	s8,40(sp)
8000c9e4:	02412c83          	lw	s9,36(sp)
8000c9e8:	02012d03          	lw	s10,32(sp)
8000c9ec:	05010113          	addi	sp,sp,80
8000c9f0:	00008067          	ret
8000c9f4:	000b8a13          	mv	s4,s7
8000c9f8:	000a8413          	mv	s0,s5
8000c9fc:	f4dff06f          	j	8000c948 <ip4addr_ntoa_r+0x60>
8000ca00:	fff40693          	addi	a3,s0,-1
8000ca04:	0ff6f693          	andi	a3,a3,255
8000ca08:	02c75263          	bge	a4,a2,8000ca2c <ip4addr_ntoa_r+0x144>
8000ca0c:	02010713          	addi	a4,sp,32
8000ca10:	00870433          	add	s0,a4,s0
8000ca14:	ff844703          	lbu	a4,-8(s0)
8000ca18:	00178793          	addi	a5,a5,1
8000ca1c:	00068413          	mv	s0,a3
8000ca20:	fee78fa3          	sb	a4,-1(a5)
8000ca24:	00098713          	mv	a4,s3
8000ca28:	f6dff06f          	j	8000c994 <ip4addr_ntoa_r+0xac>
8000ca2c:	00000513          	li	a0,0
8000ca30:	f8dff06f          	j	8000c9bc <ip4addr_ntoa_r+0xd4>

8000ca34 <ip4addr_ntoa>:
8000ca34:	01000613          	li	a2,16
8000ca38:	c3418593          	addi	a1,gp,-972 # 80003474 <str.4106>
8000ca3c:	eadff06f          	j	8000c8e8 <ip4addr_ntoa_r>

8000ca40 <ethernet_input>:
8000ca40:	ff010113          	addi	sp,sp,-16
8000ca44:	00812423          	sw	s0,8(sp)
8000ca48:	00112623          	sw	ra,12(sp)
8000ca4c:	00912223          	sw	s1,4(sp)
8000ca50:	01212023          	sw	s2,0(sp)
8000ca54:	00a55703          	lhu	a4,10(a0)
8000ca58:	01000793          	li	a5,16
8000ca5c:	00050413          	mv	s0,a0
8000ca60:	00e7ec63          	bltu	a5,a4,8000ca78 <ethernet_input+0x38>
8000ca64:	a0418793          	addi	a5,gp,-1532 # 80003244 <lwip_stats>
8000ca68:	0507a703          	lw	a4,80(a5)
8000ca6c:	00170713          	addi	a4,a4,1
8000ca70:	04e7a823          	sw	a4,80(a5)
8000ca74:	0a00006f          	j	8000cb14 <ethernet_input+0xd4>
8000ca78:	00f54783          	lbu	a5,15(a0)
8000ca7c:	00058913          	mv	s2,a1
8000ca80:	00079863          	bnez	a5,8000ca90 <ethernet_input+0x50>
8000ca84:	0385c783          	lbu	a5,56(a1)
8000ca88:	00178793          	addi	a5,a5,1
8000ca8c:	00f507a3          	sb	a5,15(a0)
8000ca90:	00442503          	lw	a0,4(s0)
8000ca94:	00f54483          	lbu	s1,15(a0)
8000ca98:	00e54783          	lbu	a5,14(a0)
8000ca9c:	00849493          	slli	s1,s1,0x8
8000caa0:	00f4e4b3          	or	s1,s1,a5
8000caa4:	00254783          	lbu	a5,2(a0)
8000caa8:	0017f713          	andi	a4,a5,1
8000caac:	02070663          	beqz	a4,8000cad8 <ethernet_input+0x98>
8000cab0:	00100713          	li	a4,1
8000cab4:	06e79c63          	bne	a5,a4,8000cb2c <ethernet_input+0xec>
8000cab8:	00354783          	lbu	a5,3(a0)
8000cabc:	00079e63          	bnez	a5,8000cad8 <ethernet_input+0x98>
8000cac0:	00454703          	lbu	a4,4(a0)
8000cac4:	05e00793          	li	a5,94
8000cac8:	00f71863          	bne	a4,a5,8000cad8 <ethernet_input+0x98>
8000cacc:	00d44783          	lbu	a5,13(s0)
8000cad0:	0107e793          	ori	a5,a5,16
8000cad4:	00f406a3          	sb	a5,13(s0)
8000cad8:	00800793          	li	a5,8
8000cadc:	06f48863          	beq	s1,a5,8000cb4c <ethernet_input+0x10c>
8000cae0:	60800793          	li	a5,1544
8000cae4:	f8f490e3          	bne	s1,a5,8000ca64 <ethernet_input+0x24>
8000cae8:	03594783          	lbu	a5,53(s2)
8000caec:	0087f793          	andi	a5,a5,8
8000caf0:	02078863          	beqz	a5,8000cb20 <ethernet_input+0xe0>
8000caf4:	01000593          	li	a1,16
8000caf8:	00040513          	mv	a0,s0
8000cafc:	c94fa0ef          	jal	ra,80006f90 <pbuf_remove_header>
8000cb00:	08050863          	beqz	a0,8000cb90 <ethernet_input+0x150>
8000cb04:	a0418793          	addi	a5,gp,-1532 # 80003244 <lwip_stats>
8000cb08:	0447a703          	lw	a4,68(a5)
8000cb0c:	00170713          	addi	a4,a4,1
8000cb10:	04e7a223          	sw	a4,68(a5)
8000cb14:	03c7a703          	lw	a4,60(a5)
8000cb18:	00170713          	addi	a4,a4,1
8000cb1c:	02e7ae23          	sw	a4,60(a5)
8000cb20:	00040513          	mv	a0,s0
8000cb24:	cf4fa0ef          	jal	ra,80007018 <pbuf_free>
8000cb28:	04c0006f          	j	8000cb74 <ethernet_input+0x134>
8000cb2c:	00600613          	li	a2,6
8000cb30:	85418593          	addi	a1,gp,-1964 # 80003094 <ethbroadcast>
8000cb34:	00250513          	addi	a0,a0,2
8000cb38:	54c010ef          	jal	ra,8000e084 <memcmp>
8000cb3c:	f8051ee3          	bnez	a0,8000cad8 <ethernet_input+0x98>
8000cb40:	00d44783          	lbu	a5,13(s0)
8000cb44:	0087e793          	ori	a5,a5,8
8000cb48:	f8dff06f          	j	8000cad4 <ethernet_input+0x94>
8000cb4c:	03594783          	lbu	a5,53(s2)
8000cb50:	0087f793          	andi	a5,a5,8
8000cb54:	fc0786e3          	beqz	a5,8000cb20 <ethernet_input+0xe0>
8000cb58:	01000593          	li	a1,16
8000cb5c:	00040513          	mv	a0,s0
8000cb60:	c30fa0ef          	jal	ra,80006f90 <pbuf_remove_header>
8000cb64:	fa051ee3          	bnez	a0,8000cb20 <ethernet_input+0xe0>
8000cb68:	00090593          	mv	a1,s2
8000cb6c:	00040513          	mv	a0,s0
8000cb70:	b30ff0ef          	jal	ra,8000bea0 <ip4_input>
8000cb74:	00c12083          	lw	ra,12(sp)
8000cb78:	00812403          	lw	s0,8(sp)
8000cb7c:	00412483          	lw	s1,4(sp)
8000cb80:	00012903          	lw	s2,0(sp)
8000cb84:	00000513          	li	a0,0
8000cb88:	01010113          	addi	sp,sp,16
8000cb8c:	00008067          	ret
8000cb90:	00090593          	mv	a1,s2
8000cb94:	00040513          	mv	a0,s0
8000cb98:	ad8fe0ef          	jal	ra,8000ae70 <etharp_input>
8000cb9c:	fd9ff06f          	j	8000cb74 <ethernet_input+0x134>

8000cba0 <ethernet_output>:
8000cba0:	fd010113          	addi	sp,sp,-48
8000cba4:	01312e23          	sw	s3,28(sp)
8000cba8:	00050993          	mv	s3,a0
8000cbac:	00070513          	mv	a0,a4
8000cbb0:	00d12623          	sw	a3,12(sp)
8000cbb4:	02112623          	sw	ra,44(sp)
8000cbb8:	02912223          	sw	s1,36(sp)
8000cbbc:	03212023          	sw	s2,32(sp)
8000cbc0:	01412c23          	sw	s4,24(sp)
8000cbc4:	00058913          	mv	s2,a1
8000cbc8:	00060a13          	mv	s4,a2
8000cbcc:	02812423          	sw	s0,40(sp)
8000cbd0:	a24f90ef          	jal	ra,80005df4 <lwip_htons>
8000cbd4:	00050493          	mv	s1,a0
8000cbd8:	01000593          	li	a1,16
8000cbdc:	00090513          	mv	a0,s2
8000cbe0:	ba0fa0ef          	jal	ra,80006f80 <pbuf_add_header>
8000cbe4:	00c12683          	lw	a3,12(sp)
8000cbe8:	06051063          	bnez	a0,8000cc48 <ethernet_output+0xa8>
8000cbec:	00492403          	lw	s0,4(s2)
8000cbf0:	00068593          	mv	a1,a3
8000cbf4:	00600613          	li	a2,6
8000cbf8:	00940723          	sb	s1,14(s0)
8000cbfc:	0084d493          	srli	s1,s1,0x8
8000cc00:	009407a3          	sb	s1,15(s0)
8000cc04:	00240513          	addi	a0,s0,2
8000cc08:	4ac010ef          	jal	ra,8000e0b4 <memcpy>
8000cc0c:	000a0593          	mv	a1,s4
8000cc10:	00840513          	addi	a0,s0,8
8000cc14:	00600613          	li	a2,6
8000cc18:	49c010ef          	jal	ra,8000e0b4 <memcpy>
8000cc1c:	02812403          	lw	s0,40(sp)
8000cc20:	0189a303          	lw	t1,24(s3)
8000cc24:	02c12083          	lw	ra,44(sp)
8000cc28:	02412483          	lw	s1,36(sp)
8000cc2c:	01812a03          	lw	s4,24(sp)
8000cc30:	00090593          	mv	a1,s2
8000cc34:	00098513          	mv	a0,s3
8000cc38:	02012903          	lw	s2,32(sp)
8000cc3c:	01c12983          	lw	s3,28(sp)
8000cc40:	03010113          	addi	sp,sp,48
8000cc44:	00030067          	jr	t1
8000cc48:	a0418793          	addi	a5,gp,-1532 # 80003244 <lwip_stats>
8000cc4c:	0147a703          	lw	a4,20(a5)
8000cc50:	ffe00513          	li	a0,-2
8000cc54:	00170713          	addi	a4,a4,1
8000cc58:	00e7aa23          	sw	a4,20(a5)
8000cc5c:	02c12083          	lw	ra,44(sp)
8000cc60:	02812403          	lw	s0,40(sp)
8000cc64:	02412483          	lw	s1,36(sp)
8000cc68:	02012903          	lw	s2,32(sp)
8000cc6c:	01c12983          	lw	s3,28(sp)
8000cc70:	01812a03          	lw	s4,24(sp)
8000cc74:	03010113          	addi	sp,sp,48
8000cc78:	00008067          	ret

8000cc7c <memset>:
8000cc7c:	00f00313          	li	t1,15
8000cc80:	00050713          	mv	a4,a0
8000cc84:	02c37e63          	bgeu	t1,a2,8000ccc0 <memset+0x44>
8000cc88:	00f77793          	andi	a5,a4,15
8000cc8c:	0a079063          	bnez	a5,8000cd2c <memset+0xb0>
8000cc90:	08059263          	bnez	a1,8000cd14 <memset+0x98>
8000cc94:	ff067693          	andi	a3,a2,-16
8000cc98:	00f67613          	andi	a2,a2,15
8000cc9c:	00e686b3          	add	a3,a3,a4
8000cca0:	00b72023          	sw	a1,0(a4)
8000cca4:	00b72223          	sw	a1,4(a4)
8000cca8:	00b72423          	sw	a1,8(a4)
8000ccac:	00b72623          	sw	a1,12(a4)
8000ccb0:	01070713          	addi	a4,a4,16
8000ccb4:	fed766e3          	bltu	a4,a3,8000cca0 <memset+0x24>
8000ccb8:	00061463          	bnez	a2,8000ccc0 <memset+0x44>
8000ccbc:	00008067          	ret
8000ccc0:	40c306b3          	sub	a3,t1,a2
8000ccc4:	00269693          	slli	a3,a3,0x2
8000ccc8:	00000297          	auipc	t0,0x0
8000cccc:	005686b3          	add	a3,a3,t0
8000ccd0:	00c68067          	jr	12(a3)
8000ccd4:	00b70723          	sb	a1,14(a4)
8000ccd8:	00b706a3          	sb	a1,13(a4)
8000ccdc:	00b70623          	sb	a1,12(a4)
8000cce0:	00b705a3          	sb	a1,11(a4)
8000cce4:	00b70523          	sb	a1,10(a4)
8000cce8:	00b704a3          	sb	a1,9(a4)
8000ccec:	00b70423          	sb	a1,8(a4)
8000ccf0:	00b703a3          	sb	a1,7(a4)
8000ccf4:	00b70323          	sb	a1,6(a4)
8000ccf8:	00b702a3          	sb	a1,5(a4)
8000ccfc:	00b70223          	sb	a1,4(a4)
8000cd00:	00b701a3          	sb	a1,3(a4)
8000cd04:	00b70123          	sb	a1,2(a4)
8000cd08:	00b700a3          	sb	a1,1(a4)
8000cd0c:	00b70023          	sb	a1,0(a4)
8000cd10:	00008067          	ret
8000cd14:	0ff5f593          	andi	a1,a1,255
8000cd18:	00859693          	slli	a3,a1,0x8
8000cd1c:	00d5e5b3          	or	a1,a1,a3
8000cd20:	01059693          	slli	a3,a1,0x10
8000cd24:	00d5e5b3          	or	a1,a1,a3
8000cd28:	f6dff06f          	j	8000cc94 <memset+0x18>
8000cd2c:	00279693          	slli	a3,a5,0x2
8000cd30:	00000297          	auipc	t0,0x0
8000cd34:	005686b3          	add	a3,a3,t0
8000cd38:	00008293          	mv	t0,ra
8000cd3c:	fa0680e7          	jalr	-96(a3)
8000cd40:	00028093          	mv	ra,t0
8000cd44:	ff078793          	addi	a5,a5,-16
8000cd48:	40f70733          	sub	a4,a4,a5
8000cd4c:	00f60633          	add	a2,a2,a5
8000cd50:	f6c378e3          	bgeu	t1,a2,8000ccc0 <memset+0x44>
8000cd54:	f3dff06f          	j	8000cc90 <memset+0x14>

8000cd58 <__bswapsi2>:
8000cd58:	01851713          	slli	a4,a0,0x18
8000cd5c:	01855793          	srli	a5,a0,0x18
8000cd60:	000106b7          	lui	a3,0x10
8000cd64:	00e7e7b3          	or	a5,a5,a4
8000cd68:	f0068693          	addi	a3,a3,-256 # ff00 <_stack_size+0xf700>
8000cd6c:	40855713          	srai	a4,a0,0x8
8000cd70:	00d77733          	and	a4,a4,a3
8000cd74:	00e7e7b3          	or	a5,a5,a4
8000cd78:	00851513          	slli	a0,a0,0x8
8000cd7c:	00ff0737          	lui	a4,0xff0
8000cd80:	00e57533          	and	a0,a0,a4
8000cd84:	00a7e533          	or	a0,a5,a0
8000cd88:	00008067          	ret

8000cd8c <__udivdi3>:
8000cd8c:	fd010113          	addi	sp,sp,-48
8000cd90:	02912223          	sw	s1,36(sp)
8000cd94:	01612823          	sw	s6,16(sp)
8000cd98:	02112623          	sw	ra,44(sp)
8000cd9c:	02812423          	sw	s0,40(sp)
8000cda0:	03212023          	sw	s2,32(sp)
8000cda4:	01312e23          	sw	s3,28(sp)
8000cda8:	01412c23          	sw	s4,24(sp)
8000cdac:	01512a23          	sw	s5,20(sp)
8000cdb0:	01712623          	sw	s7,12(sp)
8000cdb4:	01812423          	sw	s8,8(sp)
8000cdb8:	01912223          	sw	s9,4(sp)
8000cdbc:	00050b13          	mv	s6,a0
8000cdc0:	00058493          	mv	s1,a1
8000cdc4:	38069c63          	bnez	a3,8000d15c <__udivdi3+0x3d0>
8000cdc8:	00060413          	mv	s0,a2
8000cdcc:	00050993          	mv	s3,a0
8000cdd0:	ffff6917          	auipc	s2,0xffff6
8000cdd4:	0e090913          	addi	s2,s2,224 # 80002eb0 <__clz_tab>
8000cdd8:	12c5f863          	bgeu	a1,a2,8000cf08 <__udivdi3+0x17c>
8000cddc:	000107b7          	lui	a5,0x10
8000cde0:	00058a93          	mv	s5,a1
8000cde4:	10f67863          	bgeu	a2,a5,8000cef4 <__udivdi3+0x168>
8000cde8:	0ff00693          	li	a3,255
8000cdec:	00c6b6b3          	sltu	a3,a3,a2
8000cdf0:	00369693          	slli	a3,a3,0x3
8000cdf4:	00d657b3          	srl	a5,a2,a3
8000cdf8:	00f90933          	add	s2,s2,a5
8000cdfc:	00094703          	lbu	a4,0(s2)
8000ce00:	00d706b3          	add	a3,a4,a3
8000ce04:	02000713          	li	a4,32
8000ce08:	40d70733          	sub	a4,a4,a3
8000ce0c:	00070c63          	beqz	a4,8000ce24 <__udivdi3+0x98>
8000ce10:	00e494b3          	sll	s1,s1,a4
8000ce14:	00db56b3          	srl	a3,s6,a3
8000ce18:	00e61433          	sll	s0,a2,a4
8000ce1c:	0096eab3          	or	s5,a3,s1
8000ce20:	00eb19b3          	sll	s3,s6,a4
8000ce24:	01045b13          	srli	s6,s0,0x10
8000ce28:	000b0593          	mv	a1,s6
8000ce2c:	000a8513          	mv	a0,s5
8000ce30:	5a4000ef          	jal	ra,8000d3d4 <__umodsi3>
8000ce34:	00050913          	mv	s2,a0
8000ce38:	000b0593          	mv	a1,s6
8000ce3c:	01041b93          	slli	s7,s0,0x10
8000ce40:	000a8513          	mv	a0,s5
8000ce44:	548000ef          	jal	ra,8000d38c <__udivsi3>
8000ce48:	010bdb93          	srli	s7,s7,0x10
8000ce4c:	00050493          	mv	s1,a0
8000ce50:	00050593          	mv	a1,a0
8000ce54:	000b8513          	mv	a0,s7
8000ce58:	508000ef          	jal	ra,8000d360 <__mulsi3>
8000ce5c:	01091913          	slli	s2,s2,0x10
8000ce60:	0109d713          	srli	a4,s3,0x10
8000ce64:	00e96733          	or	a4,s2,a4
8000ce68:	00048a13          	mv	s4,s1
8000ce6c:	00a77e63          	bgeu	a4,a0,8000ce88 <__udivdi3+0xfc>
8000ce70:	00870733          	add	a4,a4,s0
8000ce74:	fff48a13          	addi	s4,s1,-1
8000ce78:	00876863          	bltu	a4,s0,8000ce88 <__udivdi3+0xfc>
8000ce7c:	00a77663          	bgeu	a4,a0,8000ce88 <__udivdi3+0xfc>
8000ce80:	ffe48a13          	addi	s4,s1,-2
8000ce84:	00870733          	add	a4,a4,s0
8000ce88:	40a704b3          	sub	s1,a4,a0
8000ce8c:	000b0593          	mv	a1,s6
8000ce90:	00048513          	mv	a0,s1
8000ce94:	540000ef          	jal	ra,8000d3d4 <__umodsi3>
8000ce98:	00050913          	mv	s2,a0
8000ce9c:	000b0593          	mv	a1,s6
8000cea0:	00048513          	mv	a0,s1
8000cea4:	4e8000ef          	jal	ra,8000d38c <__udivsi3>
8000cea8:	01099993          	slli	s3,s3,0x10
8000ceac:	00050493          	mv	s1,a0
8000ceb0:	00050593          	mv	a1,a0
8000ceb4:	01091913          	slli	s2,s2,0x10
8000ceb8:	000b8513          	mv	a0,s7
8000cebc:	0109d993          	srli	s3,s3,0x10
8000cec0:	4a0000ef          	jal	ra,8000d360 <__mulsi3>
8000cec4:	013969b3          	or	s3,s2,s3
8000cec8:	00048613          	mv	a2,s1
8000cecc:	00a9fc63          	bgeu	s3,a0,8000cee4 <__udivdi3+0x158>
8000ced0:	013409b3          	add	s3,s0,s3
8000ced4:	fff48613          	addi	a2,s1,-1
8000ced8:	0089e663          	bltu	s3,s0,8000cee4 <__udivdi3+0x158>
8000cedc:	00a9f463          	bgeu	s3,a0,8000cee4 <__udivdi3+0x158>
8000cee0:	ffe48613          	addi	a2,s1,-2
8000cee4:	010a1793          	slli	a5,s4,0x10
8000cee8:	00c7e7b3          	or	a5,a5,a2
8000ceec:	00000a13          	li	s4,0
8000cef0:	1300006f          	j	8000d020 <__udivdi3+0x294>
8000cef4:	010007b7          	lui	a5,0x1000
8000cef8:	01000693          	li	a3,16
8000cefc:	eef66ce3          	bltu	a2,a5,8000cdf4 <__udivdi3+0x68>
8000cf00:	01800693          	li	a3,24
8000cf04:	ef1ff06f          	j	8000cdf4 <__udivdi3+0x68>
8000cf08:	00068a13          	mv	s4,a3
8000cf0c:	00061a63          	bnez	a2,8000cf20 <__udivdi3+0x194>
8000cf10:	00000593          	li	a1,0
8000cf14:	00100513          	li	a0,1
8000cf18:	474000ef          	jal	ra,8000d38c <__udivsi3>
8000cf1c:	00050413          	mv	s0,a0
8000cf20:	000107b7          	lui	a5,0x10
8000cf24:	12f47c63          	bgeu	s0,a5,8000d05c <__udivdi3+0x2d0>
8000cf28:	0ff00793          	li	a5,255
8000cf2c:	0087f463          	bgeu	a5,s0,8000cf34 <__udivdi3+0x1a8>
8000cf30:	00800a13          	li	s4,8
8000cf34:	014457b3          	srl	a5,s0,s4
8000cf38:	00f90933          	add	s2,s2,a5
8000cf3c:	00094683          	lbu	a3,0(s2)
8000cf40:	02000613          	li	a2,32
8000cf44:	014686b3          	add	a3,a3,s4
8000cf48:	40d60633          	sub	a2,a2,a3
8000cf4c:	12061263          	bnez	a2,8000d070 <__udivdi3+0x2e4>
8000cf50:	408484b3          	sub	s1,s1,s0
8000cf54:	00100a13          	li	s4,1
8000cf58:	01045b13          	srli	s6,s0,0x10
8000cf5c:	000b0593          	mv	a1,s6
8000cf60:	00048513          	mv	a0,s1
8000cf64:	470000ef          	jal	ra,8000d3d4 <__umodsi3>
8000cf68:	00050913          	mv	s2,a0
8000cf6c:	000b0593          	mv	a1,s6
8000cf70:	00048513          	mv	a0,s1
8000cf74:	01041b93          	slli	s7,s0,0x10
8000cf78:	414000ef          	jal	ra,8000d38c <__udivsi3>
8000cf7c:	010bdb93          	srli	s7,s7,0x10
8000cf80:	00050493          	mv	s1,a0
8000cf84:	00050593          	mv	a1,a0
8000cf88:	000b8513          	mv	a0,s7
8000cf8c:	3d4000ef          	jal	ra,8000d360 <__mulsi3>
8000cf90:	01091913          	slli	s2,s2,0x10
8000cf94:	0109d713          	srli	a4,s3,0x10
8000cf98:	00e96733          	or	a4,s2,a4
8000cf9c:	00048a93          	mv	s5,s1
8000cfa0:	00a77e63          	bgeu	a4,a0,8000cfbc <__udivdi3+0x230>
8000cfa4:	00870733          	add	a4,a4,s0
8000cfa8:	fff48a93          	addi	s5,s1,-1
8000cfac:	00876863          	bltu	a4,s0,8000cfbc <__udivdi3+0x230>
8000cfb0:	00a77663          	bgeu	a4,a0,8000cfbc <__udivdi3+0x230>
8000cfb4:	ffe48a93          	addi	s5,s1,-2
8000cfb8:	00870733          	add	a4,a4,s0
8000cfbc:	40a704b3          	sub	s1,a4,a0
8000cfc0:	000b0593          	mv	a1,s6
8000cfc4:	00048513          	mv	a0,s1
8000cfc8:	40c000ef          	jal	ra,8000d3d4 <__umodsi3>
8000cfcc:	00050913          	mv	s2,a0
8000cfd0:	000b0593          	mv	a1,s6
8000cfd4:	00048513          	mv	a0,s1
8000cfd8:	3b4000ef          	jal	ra,8000d38c <__udivsi3>
8000cfdc:	01099993          	slli	s3,s3,0x10
8000cfe0:	00050493          	mv	s1,a0
8000cfe4:	00050593          	mv	a1,a0
8000cfe8:	01091913          	slli	s2,s2,0x10
8000cfec:	000b8513          	mv	a0,s7
8000cff0:	0109d993          	srli	s3,s3,0x10
8000cff4:	36c000ef          	jal	ra,8000d360 <__mulsi3>
8000cff8:	013969b3          	or	s3,s2,s3
8000cffc:	00048613          	mv	a2,s1
8000d000:	00a9fc63          	bgeu	s3,a0,8000d018 <__udivdi3+0x28c>
8000d004:	013409b3          	add	s3,s0,s3
8000d008:	fff48613          	addi	a2,s1,-1
8000d00c:	0089e663          	bltu	s3,s0,8000d018 <__udivdi3+0x28c>
8000d010:	00a9f463          	bgeu	s3,a0,8000d018 <__udivdi3+0x28c>
8000d014:	ffe48613          	addi	a2,s1,-2
8000d018:	010a9793          	slli	a5,s5,0x10
8000d01c:	00c7e7b3          	or	a5,a5,a2
8000d020:	00078513          	mv	a0,a5
8000d024:	000a0593          	mv	a1,s4
8000d028:	02c12083          	lw	ra,44(sp)
8000d02c:	02812403          	lw	s0,40(sp)
8000d030:	02412483          	lw	s1,36(sp)
8000d034:	02012903          	lw	s2,32(sp)
8000d038:	01c12983          	lw	s3,28(sp)
8000d03c:	01812a03          	lw	s4,24(sp)
8000d040:	01412a83          	lw	s5,20(sp)
8000d044:	01012b03          	lw	s6,16(sp)
8000d048:	00c12b83          	lw	s7,12(sp)
8000d04c:	00812c03          	lw	s8,8(sp)
8000d050:	00412c83          	lw	s9,4(sp)
8000d054:	03010113          	addi	sp,sp,48
8000d058:	00008067          	ret
8000d05c:	010007b7          	lui	a5,0x1000
8000d060:	01000a13          	li	s4,16
8000d064:	ecf468e3          	bltu	s0,a5,8000cf34 <__udivdi3+0x1a8>
8000d068:	01800a13          	li	s4,24
8000d06c:	ec9ff06f          	j	8000cf34 <__udivdi3+0x1a8>
8000d070:	00c41433          	sll	s0,s0,a2
8000d074:	00d4da33          	srl	s4,s1,a3
8000d078:	00cb19b3          	sll	s3,s6,a2
8000d07c:	00db56b3          	srl	a3,s6,a3
8000d080:	01045b13          	srli	s6,s0,0x10
8000d084:	00c494b3          	sll	s1,s1,a2
8000d088:	000b0593          	mv	a1,s6
8000d08c:	000a0513          	mv	a0,s4
8000d090:	0096eab3          	or	s5,a3,s1
8000d094:	340000ef          	jal	ra,8000d3d4 <__umodsi3>
8000d098:	00050913          	mv	s2,a0
8000d09c:	000b0593          	mv	a1,s6
8000d0a0:	000a0513          	mv	a0,s4
8000d0a4:	01041b93          	slli	s7,s0,0x10
8000d0a8:	2e4000ef          	jal	ra,8000d38c <__udivsi3>
8000d0ac:	010bdb93          	srli	s7,s7,0x10
8000d0b0:	00050493          	mv	s1,a0
8000d0b4:	00050593          	mv	a1,a0
8000d0b8:	000b8513          	mv	a0,s7
8000d0bc:	2a4000ef          	jal	ra,8000d360 <__mulsi3>
8000d0c0:	01091913          	slli	s2,s2,0x10
8000d0c4:	010ad713          	srli	a4,s5,0x10
8000d0c8:	00e96733          	or	a4,s2,a4
8000d0cc:	00048a13          	mv	s4,s1
8000d0d0:	00a77e63          	bgeu	a4,a0,8000d0ec <__udivdi3+0x360>
8000d0d4:	00870733          	add	a4,a4,s0
8000d0d8:	fff48a13          	addi	s4,s1,-1
8000d0dc:	00876863          	bltu	a4,s0,8000d0ec <__udivdi3+0x360>
8000d0e0:	00a77663          	bgeu	a4,a0,8000d0ec <__udivdi3+0x360>
8000d0e4:	ffe48a13          	addi	s4,s1,-2
8000d0e8:	00870733          	add	a4,a4,s0
8000d0ec:	40a704b3          	sub	s1,a4,a0
8000d0f0:	000b0593          	mv	a1,s6
8000d0f4:	00048513          	mv	a0,s1
8000d0f8:	2dc000ef          	jal	ra,8000d3d4 <__umodsi3>
8000d0fc:	00050913          	mv	s2,a0
8000d100:	000b0593          	mv	a1,s6
8000d104:	00048513          	mv	a0,s1
8000d108:	284000ef          	jal	ra,8000d38c <__udivsi3>
8000d10c:	00050493          	mv	s1,a0
8000d110:	00050593          	mv	a1,a0
8000d114:	000b8513          	mv	a0,s7
8000d118:	248000ef          	jal	ra,8000d360 <__mulsi3>
8000d11c:	010a9693          	slli	a3,s5,0x10
8000d120:	01091913          	slli	s2,s2,0x10
8000d124:	0106d693          	srli	a3,a3,0x10
8000d128:	00d967b3          	or	a5,s2,a3
8000d12c:	00048713          	mv	a4,s1
8000d130:	00a7fe63          	bgeu	a5,a0,8000d14c <__udivdi3+0x3c0>
8000d134:	008787b3          	add	a5,a5,s0
8000d138:	fff48713          	addi	a4,s1,-1
8000d13c:	0087e863          	bltu	a5,s0,8000d14c <__udivdi3+0x3c0>
8000d140:	00a7f663          	bgeu	a5,a0,8000d14c <__udivdi3+0x3c0>
8000d144:	ffe48713          	addi	a4,s1,-2
8000d148:	008787b3          	add	a5,a5,s0
8000d14c:	010a1a13          	slli	s4,s4,0x10
8000d150:	40a784b3          	sub	s1,a5,a0
8000d154:	00ea6a33          	or	s4,s4,a4
8000d158:	e01ff06f          	j	8000cf58 <__udivdi3+0x1cc>
8000d15c:	1ed5ec63          	bltu	a1,a3,8000d354 <__udivdi3+0x5c8>
8000d160:	000107b7          	lui	a5,0x10
8000d164:	04f6f463          	bgeu	a3,a5,8000d1ac <__udivdi3+0x420>
8000d168:	0ff00593          	li	a1,255
8000d16c:	00d5b533          	sltu	a0,a1,a3
8000d170:	00351513          	slli	a0,a0,0x3
8000d174:	00a6d733          	srl	a4,a3,a0
8000d178:	ffff6797          	auipc	a5,0xffff6
8000d17c:	d3878793          	addi	a5,a5,-712 # 80002eb0 <__clz_tab>
8000d180:	00e787b3          	add	a5,a5,a4
8000d184:	0007c583          	lbu	a1,0(a5)
8000d188:	02000a13          	li	s4,32
8000d18c:	00a585b3          	add	a1,a1,a0
8000d190:	40ba0a33          	sub	s4,s4,a1
8000d194:	020a1663          	bnez	s4,8000d1c0 <__udivdi3+0x434>
8000d198:	00100793          	li	a5,1
8000d19c:	e896e2e3          	bltu	a3,s1,8000d020 <__udivdi3+0x294>
8000d1a0:	00cb3633          	sltu	a2,s6,a2
8000d1a4:	00164793          	xori	a5,a2,1
8000d1a8:	e79ff06f          	j	8000d020 <__udivdi3+0x294>
8000d1ac:	010007b7          	lui	a5,0x1000
8000d1b0:	01000513          	li	a0,16
8000d1b4:	fcf6e0e3          	bltu	a3,a5,8000d174 <__udivdi3+0x3e8>
8000d1b8:	01800513          	li	a0,24
8000d1bc:	fb9ff06f          	j	8000d174 <__udivdi3+0x3e8>
8000d1c0:	00b65ab3          	srl	s5,a2,a1
8000d1c4:	014696b3          	sll	a3,a3,s4
8000d1c8:	00daeab3          	or	s5,s5,a3
8000d1cc:	00b4d933          	srl	s2,s1,a1
8000d1d0:	014497b3          	sll	a5,s1,s4
8000d1d4:	00bb55b3          	srl	a1,s6,a1
8000d1d8:	010adb93          	srli	s7,s5,0x10
8000d1dc:	00f5e4b3          	or	s1,a1,a5
8000d1e0:	00090513          	mv	a0,s2
8000d1e4:	000b8593          	mv	a1,s7
8000d1e8:	014619b3          	sll	s3,a2,s4
8000d1ec:	1e8000ef          	jal	ra,8000d3d4 <__umodsi3>
8000d1f0:	00050413          	mv	s0,a0
8000d1f4:	000b8593          	mv	a1,s7
8000d1f8:	00090513          	mv	a0,s2
8000d1fc:	010a9c13          	slli	s8,s5,0x10
8000d200:	18c000ef          	jal	ra,8000d38c <__udivsi3>
8000d204:	010c5c13          	srli	s8,s8,0x10
8000d208:	00050913          	mv	s2,a0
8000d20c:	00050593          	mv	a1,a0
8000d210:	000c0513          	mv	a0,s8
8000d214:	14c000ef          	jal	ra,8000d360 <__mulsi3>
8000d218:	01041413          	slli	s0,s0,0x10
8000d21c:	0104d713          	srli	a4,s1,0x10
8000d220:	00e46733          	or	a4,s0,a4
8000d224:	00090c93          	mv	s9,s2
8000d228:	00a77e63          	bgeu	a4,a0,8000d244 <__udivdi3+0x4b8>
8000d22c:	01570733          	add	a4,a4,s5
8000d230:	fff90c93          	addi	s9,s2,-1
8000d234:	01576863          	bltu	a4,s5,8000d244 <__udivdi3+0x4b8>
8000d238:	00a77663          	bgeu	a4,a0,8000d244 <__udivdi3+0x4b8>
8000d23c:	ffe90c93          	addi	s9,s2,-2
8000d240:	01570733          	add	a4,a4,s5
8000d244:	40a70933          	sub	s2,a4,a0
8000d248:	000b8593          	mv	a1,s7
8000d24c:	00090513          	mv	a0,s2
8000d250:	184000ef          	jal	ra,8000d3d4 <__umodsi3>
8000d254:	00050413          	mv	s0,a0
8000d258:	000b8593          	mv	a1,s7
8000d25c:	00090513          	mv	a0,s2
8000d260:	12c000ef          	jal	ra,8000d38c <__udivsi3>
8000d264:	00050913          	mv	s2,a0
8000d268:	00050593          	mv	a1,a0
8000d26c:	000c0513          	mv	a0,s8
8000d270:	0f0000ef          	jal	ra,8000d360 <__mulsi3>
8000d274:	01049793          	slli	a5,s1,0x10
8000d278:	01041413          	slli	s0,s0,0x10
8000d27c:	0107d793          	srli	a5,a5,0x10
8000d280:	00f46733          	or	a4,s0,a5
8000d284:	00090613          	mv	a2,s2
8000d288:	00a77e63          	bgeu	a4,a0,8000d2a4 <__udivdi3+0x518>
8000d28c:	01570733          	add	a4,a4,s5
8000d290:	fff90613          	addi	a2,s2,-1
8000d294:	01576863          	bltu	a4,s5,8000d2a4 <__udivdi3+0x518>
8000d298:	00a77663          	bgeu	a4,a0,8000d2a4 <__udivdi3+0x518>
8000d29c:	ffe90613          	addi	a2,s2,-2
8000d2a0:	01570733          	add	a4,a4,s5
8000d2a4:	010c9793          	slli	a5,s9,0x10
8000d2a8:	00010e37          	lui	t3,0x10
8000d2ac:	00c7e7b3          	or	a5,a5,a2
8000d2b0:	fffe0813          	addi	a6,t3,-1 # ffff <_stack_size+0xf7ff>
8000d2b4:	0107f333          	and	t1,a5,a6
8000d2b8:	0109f833          	and	a6,s3,a6
8000d2bc:	40a70733          	sub	a4,a4,a0
8000d2c0:	0107de93          	srli	t4,a5,0x10
8000d2c4:	0109d993          	srli	s3,s3,0x10
8000d2c8:	00030513          	mv	a0,t1
8000d2cc:	00080593          	mv	a1,a6
8000d2d0:	090000ef          	jal	ra,8000d360 <__mulsi3>
8000d2d4:	00050893          	mv	a7,a0
8000d2d8:	00098593          	mv	a1,s3
8000d2dc:	00030513          	mv	a0,t1
8000d2e0:	080000ef          	jal	ra,8000d360 <__mulsi3>
8000d2e4:	00050313          	mv	t1,a0
8000d2e8:	00080593          	mv	a1,a6
8000d2ec:	000e8513          	mv	a0,t4
8000d2f0:	070000ef          	jal	ra,8000d360 <__mulsi3>
8000d2f4:	00050813          	mv	a6,a0
8000d2f8:	00098593          	mv	a1,s3
8000d2fc:	000e8513          	mv	a0,t4
8000d300:	060000ef          	jal	ra,8000d360 <__mulsi3>
8000d304:	0108d693          	srli	a3,a7,0x10
8000d308:	01030333          	add	t1,t1,a6
8000d30c:	006686b3          	add	a3,a3,t1
8000d310:	0106f463          	bgeu	a3,a6,8000d318 <__udivdi3+0x58c>
8000d314:	01c50533          	add	a0,a0,t3
8000d318:	0106d613          	srli	a2,a3,0x10
8000d31c:	00a60533          	add	a0,a2,a0
8000d320:	02a76663          	bltu	a4,a0,8000d34c <__udivdi3+0x5c0>
8000d324:	bca714e3          	bne	a4,a0,8000ceec <__udivdi3+0x160>
8000d328:	00010737          	lui	a4,0x10
8000d32c:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
8000d330:	00e6f6b3          	and	a3,a3,a4
8000d334:	01069693          	slli	a3,a3,0x10
8000d338:	00e8f8b3          	and	a7,a7,a4
8000d33c:	014b1633          	sll	a2,s6,s4
8000d340:	011686b3          	add	a3,a3,a7
8000d344:	00000a13          	li	s4,0
8000d348:	ccd67ce3          	bgeu	a2,a3,8000d020 <__udivdi3+0x294>
8000d34c:	fff78793          	addi	a5,a5,-1 # ffffff <_stack_size+0xfff7ff>
8000d350:	b9dff06f          	j	8000ceec <__udivdi3+0x160>
8000d354:	00000a13          	li	s4,0
8000d358:	00000793          	li	a5,0
8000d35c:	cc5ff06f          	j	8000d020 <__udivdi3+0x294>

8000d360 <__mulsi3>:
8000d360:	00050613          	mv	a2,a0
8000d364:	00000513          	li	a0,0
8000d368:	0015f693          	andi	a3,a1,1
8000d36c:	00068463          	beqz	a3,8000d374 <__mulsi3+0x14>
8000d370:	00c50533          	add	a0,a0,a2
8000d374:	0015d593          	srli	a1,a1,0x1
8000d378:	00161613          	slli	a2,a2,0x1
8000d37c:	fe0596e3          	bnez	a1,8000d368 <__mulsi3+0x8>
8000d380:	00008067          	ret

8000d384 <__divsi3>:
8000d384:	06054063          	bltz	a0,8000d3e4 <__umodsi3+0x10>
8000d388:	0605c663          	bltz	a1,8000d3f4 <__umodsi3+0x20>

8000d38c <__udivsi3>:
8000d38c:	00058613          	mv	a2,a1
8000d390:	00050593          	mv	a1,a0
8000d394:	fff00513          	li	a0,-1
8000d398:	02060c63          	beqz	a2,8000d3d0 <__udivsi3+0x44>
8000d39c:	00100693          	li	a3,1
8000d3a0:	00b67a63          	bgeu	a2,a1,8000d3b4 <__udivsi3+0x28>
8000d3a4:	00c05863          	blez	a2,8000d3b4 <__udivsi3+0x28>
8000d3a8:	00161613          	slli	a2,a2,0x1
8000d3ac:	00169693          	slli	a3,a3,0x1
8000d3b0:	feb66ae3          	bltu	a2,a1,8000d3a4 <__udivsi3+0x18>
8000d3b4:	00000513          	li	a0,0
8000d3b8:	00c5e663          	bltu	a1,a2,8000d3c4 <__udivsi3+0x38>
8000d3bc:	40c585b3          	sub	a1,a1,a2
8000d3c0:	00d56533          	or	a0,a0,a3
8000d3c4:	0016d693          	srli	a3,a3,0x1
8000d3c8:	00165613          	srli	a2,a2,0x1
8000d3cc:	fe0696e3          	bnez	a3,8000d3b8 <__udivsi3+0x2c>
8000d3d0:	00008067          	ret

8000d3d4 <__umodsi3>:
8000d3d4:	00008293          	mv	t0,ra
8000d3d8:	fb5ff0ef          	jal	ra,8000d38c <__udivsi3>
8000d3dc:	00058513          	mv	a0,a1
8000d3e0:	00028067          	jr	t0 # 8000cd30 <memset+0xb4>
8000d3e4:	40a00533          	neg	a0,a0
8000d3e8:	0005d863          	bgez	a1,8000d3f8 <__umodsi3+0x24>
8000d3ec:	40b005b3          	neg	a1,a1
8000d3f0:	f9dff06f          	j	8000d38c <__udivsi3>
8000d3f4:	40b005b3          	neg	a1,a1
8000d3f8:	00008293          	mv	t0,ra
8000d3fc:	f91ff0ef          	jal	ra,8000d38c <__udivsi3>
8000d400:	40a00533          	neg	a0,a0
8000d404:	00028067          	jr	t0

8000d408 <__modsi3>:
8000d408:	00008293          	mv	t0,ra
8000d40c:	0005ca63          	bltz	a1,8000d420 <__modsi3+0x18>
8000d410:	00054c63          	bltz	a0,8000d428 <__modsi3+0x20>
8000d414:	f79ff0ef          	jal	ra,8000d38c <__udivsi3>
8000d418:	00058513          	mv	a0,a1
8000d41c:	00028067          	jr	t0
8000d420:	40b005b3          	neg	a1,a1
8000d424:	fe0558e3          	bgez	a0,8000d414 <__modsi3+0xc>
8000d428:	40a00533          	neg	a0,a0
8000d42c:	f61ff0ef          	jal	ra,8000d38c <__udivsi3>
8000d430:	40b00533          	neg	a0,a1
8000d434:	00028067          	jr	t0

Disassembly of section .text.startup:

8000d438 <main>:
8000d438:	eb010113          	addi	sp,sp,-336
8000d43c:	14112623          	sw	ra,332(sp)
8000d440:	14812423          	sw	s0,328(sp)
8000d444:	14912223          	sw	s1,324(sp)
8000d448:	15212023          	sw	s2,320(sp)
8000d44c:	13312e23          	sw	s3,316(sp)
8000d450:	13412c23          	sw	s4,312(sp)
8000d454:	13512a23          	sw	s5,308(sp)
8000d458:	13612823          	sw	s6,304(sp)
8000d45c:	13712623          	sw	s7,300(sp)
8000d460:	13812423          	sw	s8,296(sp)
8000d464:	30047073          	csrci	mstatus,8
8000d468:	f78f80ef          	jal	ra,80005be0 <init_sbrk>
8000d46c:	8701a783          	lw	a5,-1936(gp) # 800030b0 <deadbeef>
8000d470:	1a078663          	beqz	a5,8000d61c <main+0x1e4>
8000d474:	80002537          	lui	a0,0x80002
8000d478:	fc850513          	addi	a0,a0,-56 # 80001fc8 <_heap_end+0xfffeffc8>
8000d47c:	fbcf80ef          	jal	ra,80005c38 <print_uart0>
8000d480:	8f5f80ef          	jal	ra,80005d74 <hard_reboot>
8000d484:	8c01a583          	lw	a1,-1856(gp) # 80003100 <sbrk_heap_end>
8000d488:	02010513          	addi	a0,sp,32
8000d48c:	80003437          	lui	s0,0x80003
8000d490:	930f60ef          	jal	ra,800035c0 <to_hex>
8000d494:	80002537          	lui	a0,0x80002
8000d498:	ff050513          	addi	a0,a0,-16 # 80001ff0 <_heap_end+0xfffefff0>
8000d49c:	f9cf80ef          	jal	ra,80005c38 <print_uart0>
8000d4a0:	02010513          	addi	a0,sp,32
8000d4a4:	f94f80ef          	jal	ra,80005c38 <print_uart0>
8000d4a8:	81040513          	addi	a0,s0,-2032 # 80002810 <_heap_end+0xffff0810>
8000d4ac:	f8cf80ef          	jal	ra,80005c38 <print_uart0>
8000d4b0:	80002537          	lui	a0,0x80002
8000d4b4:	05100593          	li	a1,81
8000d4b8:	00050513          	mv	a0,a0
8000d4bc:	038010ef          	jal	ra,8000e4f4 <iprintf>
8000d4c0:	f00004b7          	lui	s1,0xf0000
8000d4c4:	0044a783          	lw	a5,4(s1) # f0000004 <_heap_end+0x6ffee004>
8000d4c8:	80002537          	lui	a0,0x80002
8000d4cc:	09850513          	addi	a0,a0,152 # 80002098 <_heap_end+0xffff0098>
8000d4d0:	0027e793          	ori	a5,a5,2
8000d4d4:	00f4a223          	sw	a5,4(s1)
8000d4d8:	01c010ef          	jal	ra,8000e4f4 <iprintf>
8000d4dc:	f00547b7          	lui	a5,0xf0054
8000d4e0:	0007a023          	sw	zero,0(a5) # f0054000 <_heap_end+0x70042000>
8000d4e4:	0044a783          	lw	a5,4(s1)
8000d4e8:	03f00713          	li	a4,63
8000d4ec:	01900613          	li	a2,25
8000d4f0:	ff77f793          	andi	a5,a5,-9
8000d4f4:	00f4a223          	sw	a5,4(s1)
8000d4f8:	f00607b7          	lui	a5,0xf0060
8000d4fc:	00e7a623          	sw	a4,12(a5) # f006000c <_heap_end+0x7004e00c>
8000d500:	0007a223          	sw	zero,4(a5)
8000d504:	fff00713          	li	a4,-1
8000d508:	00e7a023          	sw	a4,0(a5)
8000d50c:	f0010737          	lui	a4,0xf0010
8000d510:	00472783          	lw	a5,4(a4) # f0010004 <_heap_end+0x6fffe004>
8000d514:	00100693          	li	a3,1
8000d518:	f0090537          	lui	a0,0xf0090
8000d51c:	0027e793          	ori	a5,a5,2
8000d520:	00f72223          	sw	a5,4(a4)
8000d524:	f0011737          	lui	a4,0xf0011
8000d528:	00472783          	lw	a5,4(a4) # f0011004 <_heap_end+0x6ffff004>
8000d52c:	0027e793          	ori	a5,a5,2
8000d530:	00f72223          	sw	a5,4(a4)
8000d534:	f00207b7          	lui	a5,0xf0020
8000d538:	0007a023          	sw	zero,0(a5) # f0020000 <_heap_end+0x7000e000>
8000d53c:	00c7a223          	sw	a2,4(a5)
8000d540:	0007a423          	sw	zero,8(a5)
8000d544:	00018737          	lui	a4,0x18
8000d548:	0007a623          	sw	zero,12(a5)
8000d54c:	6a070713          	addi	a4,a4,1696 # 186a0 <_stack_size+0x17ea0>
8000d550:	00e7a823          	sw	a4,16(a5)
8000d554:	00d7a023          	sw	a3,0(a5)
8000d558:	f00217b7          	lui	a5,0xf0021
8000d55c:	0007a023          	sw	zero,0(a5) # f0021000 <_heap_end+0x7000f000>
8000d560:	00c7a223          	sw	a2,4(a5)
8000d564:	0007a423          	sw	zero,8(a5)
8000d568:	0000c737          	lui	a4,0xc
8000d56c:	0007a623          	sw	zero,12(a5)
8000d570:	35070713          	addi	a4,a4,848 # c350 <_stack_size+0xbb50>
8000d574:	00e7a823          	sw	a4,16(a5)
8000d578:	00d7a023          	sw	a3,0(a5)
8000d57c:	df8f80ef          	jal	ra,80005b74 <i2c_init>
8000d580:	30046073          	csrsi	mstatus,8
8000d584:	0007a937          	lui	s2,0x7a
8000d588:	00a00493          	li	s1,10
8000d58c:	00200b93          	li	s7,2
8000d590:	000a8993          	mv	s3,s5
8000d594:	f0000c37          	lui	s8,0xf0000
8000d598:	f0010a37          	lui	s4,0xf0010
8000d59c:	02e00b13          	li	s6,46
8000d5a0:	12090913          	addi	s2,s2,288 # 7a120 <_stack_size+0x79920>
8000d5a4:	87c1a783          	lw	a5,-1924(gp) # 800030bc <uart_config_reset_counter>
8000d5a8:	02fbe863          	bltu	s7,a5,8000d5d8 <main+0x1a0>
8000d5ac:	000c2783          	lw	a5,0(s8) # f0000000 <_heap_end+0x6ffee000>
8000d5b0:	0207d463          	bgez	a5,8000d5d8 <main+0x1a0>
8000d5b4:	004a2783          	lw	a5,4(s4) # f0010004 <_heap_end+0x6fffe004>
8000d5b8:	0107d793          	srli	a5,a5,0x10
8000d5bc:	0ff7f793          	andi	a5,a5,255
8000d5c0:	fe078ae3          	beqz	a5,8000d5b4 <main+0x17c>
8000d5c4:	016a2023          	sw	s6,0(s4)
8000d5c8:	00090513          	mv	a0,s2
8000d5cc:	fff48493          	addi	s1,s1,-1
8000d5d0:	e38f80ef          	jal	ra,80005c08 <delay_us>
8000d5d4:	fc0498e3          	bnez	s1,8000d5a4 <main+0x16c>
8000d5d8:	81040513          	addi	a0,s0,-2032
8000d5dc:	719000ef          	jal	ra,8000e4f4 <iprintf>
8000d5e0:	800034b7          	lui	s1,0x80003
8000d5e4:	02000613          	li	a2,32
8000d5e8:	fb048593          	addi	a1,s1,-80 # 80002fb0 <_heap_end+0xffff0fb0>
8000d5ec:	98c18513          	addi	a0,gp,-1652 # 800031cc <active_config>
8000d5f0:	2c5000ef          	jal	ra,8000e0b4 <memcpy>
8000d5f4:	87c1a703          	lw	a4,-1924(gp) # 800030bc <uart_config_reset_counter>
8000d5f8:	00200793          	li	a5,2
8000d5fc:	02e7f863          	bgeu	a5,a4,8000d62c <main+0x1f4>
8000d600:	800025b7          	lui	a1,0x80002
8000d604:	8601ae23          	sw	zero,-1924(gp) # 800030bc <uart_config_reset_counter>
8000d608:	0ac58593          	addi	a1,a1,172 # 800020ac <_heap_end+0xffff00ac>
8000d60c:	80002537          	lui	a0,0x80002
8000d610:	0bc50513          	addi	a0,a0,188 # 800020bc <_heap_end+0xffff00bc>
8000d614:	6e1000ef          	jal	ra,8000e4f4 <iprintf>
8000d618:	0500006f          	j	8000d668 <main+0x230>
8000d61c:	deadc7b7          	lui	a5,0xdeadc
8000d620:	eef78793          	addi	a5,a5,-273 # deadbeef <_heap_end+0x5eac9eef>
8000d624:	86f1a823          	sw	a5,-1936(gp) # 800030b0 <deadbeef>
8000d628:	e5dff06f          	j	8000d484 <main+0x4c>
8000d62c:	f00007b7          	lui	a5,0xf0000
8000d630:	0007a783          	lw	a5,0(a5) # f0000000 <_heap_end+0x6ffee000>
8000d634:	0007c863          	bltz	a5,8000d644 <main+0x20c>
8000d638:	800025b7          	lui	a1,0x80002
8000d63c:	0e058593          	addi	a1,a1,224 # 800020e0 <_heap_end+0xffff00e0>
8000d640:	fcdff06f          	j	8000d60c <main+0x1d4>
8000d644:	f0090537          	lui	a0,0xf0090
8000d648:	ce1f60ef          	jal	ra,80004328 <eeprom_probe>
8000d64c:	2c051e63          	bnez	a0,8000d928 <main+0x4f0>
8000d650:	98c18513          	addi	a0,gp,-1652 # 800031cc <active_config>
8000d654:	e6cf60ef          	jal	ra,80003cc0 <config_load>
8000d658:	2a051a63          	bnez	a0,8000d90c <main+0x4d4>
8000d65c:	80002537          	lui	a0,0x80002
8000d660:	0ec50513          	addi	a0,a0,236 # 800020ec <_heap_end+0xffff00ec>
8000d664:	691000ef          	jal	ra,8000e4f4 <iprintf>
8000d668:	30047073          	csrci	mstatus,8
8000d66c:	98c18413          	addi	s0,gp,-1652 # 800031cc <active_config>
8000d670:	01344503          	lbu	a0,19(s0)
8000d674:	d21f70ef          	jal	ra,80005394 <hub_init>
8000d678:	8bdf70ef          	jal	ra,80004f34 <mac_lwip_init>
8000d67c:	a28f80ef          	jal	ra,800058a4 <modbus_udp_init>
8000d680:	bf0f60ef          	jal	ra,80003a70 <modbus_rtu_init>
8000d684:	80002537          	lui	a0,0x80002
8000d688:	13050513          	addi	a0,a0,304 # 80002130 <_heap_end+0xffff0130>
8000d68c:	669000ef          	jal	ra,8000e4f4 <iprintf>
8000d690:	f0000737          	lui	a4,0xf0000
8000d694:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
8000d698:	ff87f793          	andi	a5,a5,-8
8000d69c:	00f72223          	sw	a5,4(a4)
8000d6a0:	30046073          	csrsi	mstatus,8
8000d6a4:	800004b7          	lui	s1,0x80000
8000d6a8:	800026b7          	lui	a3,0x80002
8000d6ac:	13448793          	addi	a5,s1,308 # 80000134 <_heap_end+0xfffee134>
8000d6b0:	00800893          	li	a7,8
8000d6b4:	00600813          	li	a6,6
8000d6b8:	00500713          	li	a4,5
8000d6bc:	14868693          	addi	a3,a3,328 # 80002148 <_heap_end+0xffff0148>
8000d6c0:	03f00613          	li	a2,63
8000d6c4:	00000593          	li	a1,0
8000d6c8:	00600513          	li	a0,6
8000d6cc:	8f4f80ef          	jal	ra,800057c0 <hub_print>
8000d6d0:	01444603          	lbu	a2,20(s0)
8000d6d4:	800025b7          	lui	a1,0x80002
8000d6d8:	15058593          	addi	a1,a1,336 # 80002150 <_heap_end+0xffff0150>
8000d6dc:	00010513          	mv	a0,sp
8000d6e0:	09c010ef          	jal	ra,8000e77c <siprintf>
8000d6e4:	13448793          	addi	a5,s1,308
8000d6e8:	00050713          	mv	a4,a0
8000d6ec:	00800893          	li	a7,8
8000d6f0:	00600813          	li	a6,6
8000d6f4:	00010693          	mv	a3,sp
8000d6f8:	03f00613          	li	a2,63
8000d6fc:	00800593          	li	a1,8
8000d700:	00000513          	li	a0,0
8000d704:	8bcf80ef          	jal	ra,800057c0 <hub_print>
8000d708:	001e8937          	lui	s2,0x1e8
8000d70c:	48090513          	addi	a0,s2,1152 # 1e8480 <_stack_size+0x1e7c80>
8000d710:	f1df50ef          	jal	ra,8000362c <process_and_wait>
8000d714:	800026b7          	lui	a3,0x80002
8000d718:	13448793          	addi	a5,s1,308
8000d71c:	00800893          	li	a7,8
8000d720:	00600813          	li	a6,6
8000d724:	00500713          	li	a4,5
8000d728:	15468693          	addi	a3,a3,340 # 80002154 <_heap_end+0xffff0154>
8000d72c:	03f00613          	li	a2,63
8000d730:	00000593          	li	a1,0
8000d734:	00600513          	li	a0,6
8000d738:	888f80ef          	jal	ra,800057c0 <hub_print>
8000d73c:	9ac18413          	addi	s0,gp,-1620 # 800031ec <default_netif>
8000d740:	00444603          	lbu	a2,4(s0)
8000d744:	800029b7          	lui	s3,0x80002
8000d748:	15c98593          	addi	a1,s3,348 # 8000215c <_heap_end+0xffff015c>
8000d74c:	00010513          	mv	a0,sp
8000d750:	02c010ef          	jal	ra,8000e77c <siprintf>
8000d754:	13448793          	addi	a5,s1,308
8000d758:	00050713          	mv	a4,a0
8000d75c:	00800893          	li	a7,8
8000d760:	00600813          	li	a6,6
8000d764:	00010693          	mv	a3,sp
8000d768:	03f00613          	li	a2,63
8000d76c:	00800593          	li	a1,8
8000d770:	00000513          	li	a0,0
8000d774:	84cf80ef          	jal	ra,800057c0 <hub_print>
8000d778:	48090513          	addi	a0,s2,1152
8000d77c:	eb1f50ef          	jal	ra,8000362c <process_and_wait>
8000d780:	00544603          	lbu	a2,5(s0)
8000d784:	15c98593          	addi	a1,s3,348
8000d788:	00010513          	mv	a0,sp
8000d78c:	7f1000ef          	jal	ra,8000e77c <siprintf>
8000d790:	13448793          	addi	a5,s1,308
8000d794:	00050713          	mv	a4,a0
8000d798:	00800893          	li	a7,8
8000d79c:	00600813          	li	a6,6
8000d7a0:	00010693          	mv	a3,sp
8000d7a4:	03f00613          	li	a2,63
8000d7a8:	00800593          	li	a1,8
8000d7ac:	00000513          	li	a0,0
8000d7b0:	810f80ef          	jal	ra,800057c0 <hub_print>
8000d7b4:	48090513          	addi	a0,s2,1152
8000d7b8:	e75f50ef          	jal	ra,8000362c <process_and_wait>
8000d7bc:	00644603          	lbu	a2,6(s0)
8000d7c0:	15c98593          	addi	a1,s3,348
8000d7c4:	00010513          	mv	a0,sp
8000d7c8:	7b5000ef          	jal	ra,8000e77c <siprintf>
8000d7cc:	13448793          	addi	a5,s1,308
8000d7d0:	00050713          	mv	a4,a0
8000d7d4:	00800893          	li	a7,8
8000d7d8:	00600813          	li	a6,6
8000d7dc:	00010693          	mv	a3,sp
8000d7e0:	03f00613          	li	a2,63
8000d7e4:	00800593          	li	a1,8
8000d7e8:	00000513          	li	a0,0
8000d7ec:	fd5f70ef          	jal	ra,800057c0 <hub_print>
8000d7f0:	48090513          	addi	a0,s2,1152
8000d7f4:	e39f50ef          	jal	ra,8000362c <process_and_wait>
8000d7f8:	00744603          	lbu	a2,7(s0)
8000d7fc:	15c98593          	addi	a1,s3,348
8000d800:	00010513          	mv	a0,sp
8000d804:	779000ef          	jal	ra,8000e77c <siprintf>
8000d808:	13448793          	addi	a5,s1,308
8000d80c:	00050713          	mv	a4,a0
8000d810:	00800893          	li	a7,8
8000d814:	00600813          	li	a6,6
8000d818:	00010693          	mv	a3,sp
8000d81c:	03f00613          	li	a2,63
8000d820:	00800593          	li	a1,8
8000d824:	00000513          	li	a0,0
8000d828:	f99f70ef          	jal	ra,800057c0 <hub_print>
8000d82c:	48090513          	addi	a0,s2,1152
8000d830:	dfdf50ef          	jal	ra,8000362c <process_and_wait>
8000d834:	8b81a603          	lw	a2,-1864(gp) # 800030f8 <hub_frame_size>
8000d838:	00000593          	li	a1,0
8000d83c:	f0050537          	lui	a0,0xf0050
8000d840:	0003d4b7          	lui	s1,0x3d
8000d844:	c38ff0ef          	jal	ra,8000cc7c <memset>
8000d848:	09048493          	addi	s1,s1,144 # 3d090 <_stack_size+0x3c890>
8000d84c:	80002bb7          	lui	s7,0x80002
8000d850:	80002c37          	lui	s8,0x80002
8000d854:	f0000937          	lui	s2,0xf0000
8000d858:	00492783          	lw	a5,4(s2) # f0000004 <_heap_end+0x6ffee004>
8000d85c:	00048513          	mv	a0,s1
8000d860:	0017e793          	ori	a5,a5,1
8000d864:	00f92223          	sw	a5,4(s2)
8000d868:	dc5f50ef          	jal	ra,8000362c <process_and_wait>
8000d86c:	00492783          	lw	a5,4(s2)
8000d870:	00048513          	mv	a0,s1
8000d874:	ffe7f793          	andi	a5,a5,-2
8000d878:	00f92223          	sw	a5,4(s2)
8000d87c:	db1f50ef          	jal	ra,8000362c <process_and_wait>
8000d880:	30047073          	csrci	mstatus,8
8000d884:	f00547b7          	lui	a5,0xf0054
8000d888:	0007a603          	lw	a2,0(a5) # f0054000 <_heap_end+0x70042000>
8000d88c:	8b81a683          	lw	a3,-1864(gp) # 800030f8 <hub_frame_size>
8000d890:	88c1a703          	lw	a4,-1908(gp) # 800030cc <reg_irq_counter>
8000d894:	8881a783          	lw	a5,-1912(gp) # 800030c8 <reg_sys_counter>
8000d898:	8841a803          	lw	a6,-1916(gp) # 800030c4 <reg_scratch>
8000d89c:	07f67613          	andi	a2,a2,127
8000d8a0:	05100593          	li	a1,81
8000d8a4:	164b8513          	addi	a0,s7,356 # 80002164 <_heap_end+0xffff0164>
8000d8a8:	44d000ef          	jal	ra,8000e4f4 <iprintf>
8000d8ac:	f00607b7          	lui	a5,0xf0060
8000d8b0:	0007a583          	lw	a1,0(a5) # f0060000 <_heap_end+0x7004e000>
8000d8b4:	0047a603          	lw	a2,4(a5)
8000d8b8:	00c7a683          	lw	a3,12(a5)
8000d8bc:	0087a703          	lw	a4,8(a5)
8000d8c0:	0107a783          	lw	a5,16(a5)
8000d8c4:	1d8c0513          	addi	a0,s8,472 # 800021d8 <_heap_end+0xffff01d8>
8000d8c8:	42d000ef          	jal	ra,8000e4f4 <iprintf>
8000d8cc:	a85f70ef          	jal	ra,80005350 <mac_print_stats>
8000d8d0:	30046073          	csrsi	mstatus,8
8000d8d4:	ed9f50ef          	jal	ra,800037ac <sram_test_write_random_ints>
8000d8d8:	8881a783          	lw	a5,-1912(gp) # 800030c8 <reg_sys_counter>
8000d8dc:	00178793          	addi	a5,a5,1
8000d8e0:	88f1a423          	sw	a5,-1912(gp) # 800030c8 <reg_sys_counter>
8000d8e4:	8801a783          	lw	a5,-1920(gp) # 800030c0 <reg_config_write>
8000d8e8:	00078863          	beqz	a5,8000d8f8 <main+0x4c0>
8000d8ec:	8801a783          	lw	a5,-1920(gp) # 800030c0 <reg_config_write>
8000d8f0:	fff78793          	addi	a5,a5,-1
8000d8f4:	88f1a023          	sw	a5,-1920(gp) # 800030c0 <reg_config_write>
8000d8f8:	f0000737          	lui	a4,0xf0000
8000d8fc:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
8000d900:	ffd7f793          	andi	a5,a5,-3
8000d904:	00f72223          	sw	a5,4(a4)
8000d908:	f4dff06f          	j	8000d854 <main+0x41c>
8000d90c:	fb048593          	addi	a1,s1,-80
8000d910:	02000613          	li	a2,32
8000d914:	98c18513          	addi	a0,gp,-1652 # 800031cc <active_config>
8000d918:	79c000ef          	jal	ra,8000e0b4 <memcpy>
8000d91c:	800025b7          	lui	a1,0x80002
8000d920:	10858593          	addi	a1,a1,264 # 80002108 <_heap_end+0xffff0108>
8000d924:	ce9ff06f          	j	8000d60c <main+0x1d4>
8000d928:	800025b7          	lui	a1,0x80002
8000d92c:	11c58593          	addi	a1,a1,284 # 8000211c <_heap_end+0xffff011c>
8000d930:	cddff06f          	j	8000d60c <main+0x1d4>

Disassembly of section .text.atoi:

8000d934 <atoi>:
8000d934:	00a00613          	li	a2,10
8000d938:	00000593          	li	a1,0
8000d93c:	2700106f          	j	8000ebac <strtol>

Disassembly of section .text._atoi_r:

8000d940 <_atoi_r>:
8000d940:	00a00693          	li	a3,10
8000d944:	00000613          	li	a2,0
8000d948:	2480106f          	j	8000eb90 <_strtol_r>

Disassembly of section .text.calloc:

8000d94c <calloc>:
8000d94c:	80c18793          	addi	a5,gp,-2036 # 8000304c <_impure_ptr>
8000d950:	00058613          	mv	a2,a1
8000d954:	00050593          	mv	a1,a0
8000d958:	0007a503          	lw	a0,0(a5)
8000d95c:	08d0006f          	j	8000e1e8 <_calloc_r>

Disassembly of section .text.__sflush_r:

8000d960 <__sflush_r>:
8000d960:	00c5d783          	lhu	a5,12(a1)
8000d964:	fe010113          	addi	sp,sp,-32
8000d968:	00812c23          	sw	s0,24(sp)
8000d96c:	00912a23          	sw	s1,20(sp)
8000d970:	00112e23          	sw	ra,28(sp)
8000d974:	01212823          	sw	s2,16(sp)
8000d978:	01312623          	sw	s3,12(sp)
8000d97c:	0087f713          	andi	a4,a5,8
8000d980:	00050493          	mv	s1,a0
8000d984:	00058413          	mv	s0,a1
8000d988:	14071e63          	bnez	a4,8000dae4 <__sflush_r+0x184>
8000d98c:	0045a703          	lw	a4,4(a1)
8000d990:	00e04a63          	bgtz	a4,8000d9a4 <__sflush_r+0x44>
8000d994:	0405a703          	lw	a4,64(a1)
8000d998:	00e04663          	bgtz	a4,8000d9a4 <__sflush_r+0x44>
8000d99c:	00000513          	li	a0,0
8000d9a0:	11c0006f          	j	8000dabc <__sflush_r+0x15c>
8000d9a4:	02c42703          	lw	a4,44(s0)
8000d9a8:	fe070ae3          	beqz	a4,8000d99c <__sflush_r+0x3c>
8000d9ac:	0004a903          	lw	s2,0(s1)
8000d9b0:	01379693          	slli	a3,a5,0x13
8000d9b4:	0004a023          	sw	zero,0(s1)
8000d9b8:	0a06de63          	bgez	a3,8000da74 <__sflush_r+0x114>
8000d9bc:	05442503          	lw	a0,84(s0)
8000d9c0:	00c45783          	lhu	a5,12(s0)
8000d9c4:	0047f793          	andi	a5,a5,4
8000d9c8:	00078e63          	beqz	a5,8000d9e4 <__sflush_r+0x84>
8000d9cc:	00442783          	lw	a5,4(s0)
8000d9d0:	40f50533          	sub	a0,a0,a5
8000d9d4:	03442783          	lw	a5,52(s0)
8000d9d8:	00078663          	beqz	a5,8000d9e4 <__sflush_r+0x84>
8000d9dc:	04042783          	lw	a5,64(s0)
8000d9e0:	40f50533          	sub	a0,a0,a5
8000d9e4:	02c42783          	lw	a5,44(s0)
8000d9e8:	02042583          	lw	a1,32(s0)
8000d9ec:	00050613          	mv	a2,a0
8000d9f0:	00000693          	li	a3,0
8000d9f4:	00048513          	mv	a0,s1
8000d9f8:	000780e7          	jalr	a5
8000d9fc:	fff00793          	li	a5,-1
8000da00:	00c45703          	lhu	a4,12(s0)
8000da04:	02f51263          	bne	a0,a5,8000da28 <__sflush_r+0xc8>
8000da08:	0004a683          	lw	a3,0(s1)
8000da0c:	01d00793          	li	a5,29
8000da10:	0cd7e463          	bltu	a5,a3,8000dad8 <__sflush_r+0x178>
8000da14:	204007b7          	lui	a5,0x20400
8000da18:	00178793          	addi	a5,a5,1 # 20400001 <_stack_size+0x203ff801>
8000da1c:	00d7d7b3          	srl	a5,a5,a3
8000da20:	0017f793          	andi	a5,a5,1
8000da24:	0a078a63          	beqz	a5,8000dad8 <__sflush_r+0x178>
8000da28:	01042783          	lw	a5,16(s0)
8000da2c:	00042223          	sw	zero,4(s0)
8000da30:	00f42023          	sw	a5,0(s0)
8000da34:	01371793          	slli	a5,a4,0x13
8000da38:	0007dc63          	bgez	a5,8000da50 <__sflush_r+0xf0>
8000da3c:	fff00793          	li	a5,-1
8000da40:	00f51663          	bne	a0,a5,8000da4c <__sflush_r+0xec>
8000da44:	0004a783          	lw	a5,0(s1)
8000da48:	00079463          	bnez	a5,8000da50 <__sflush_r+0xf0>
8000da4c:	04a42a23          	sw	a0,84(s0)
8000da50:	03442583          	lw	a1,52(s0)
8000da54:	0124a023          	sw	s2,0(s1)
8000da58:	f40582e3          	beqz	a1,8000d99c <__sflush_r+0x3c>
8000da5c:	04440793          	addi	a5,s0,68
8000da60:	00f58663          	beq	a1,a5,8000da6c <__sflush_r+0x10c>
8000da64:	00048513          	mv	a0,s1
8000da68:	7d4000ef          	jal	ra,8000e23c <_free_r>
8000da6c:	02042a23          	sw	zero,52(s0)
8000da70:	f2dff06f          	j	8000d99c <__sflush_r+0x3c>
8000da74:	02042583          	lw	a1,32(s0)
8000da78:	00100693          	li	a3,1
8000da7c:	00000613          	li	a2,0
8000da80:	00048513          	mv	a0,s1
8000da84:	000700e7          	jalr	a4
8000da88:	fff00793          	li	a5,-1
8000da8c:	f2f51ae3          	bne	a0,a5,8000d9c0 <__sflush_r+0x60>
8000da90:	0004a783          	lw	a5,0(s1)
8000da94:	f20786e3          	beqz	a5,8000d9c0 <__sflush_r+0x60>
8000da98:	01d00713          	li	a4,29
8000da9c:	00e78663          	beq	a5,a4,8000daa8 <__sflush_r+0x148>
8000daa0:	01600713          	li	a4,22
8000daa4:	00e79663          	bne	a5,a4,8000dab0 <__sflush_r+0x150>
8000daa8:	0124a023          	sw	s2,0(s1)
8000daac:	ef1ff06f          	j	8000d99c <__sflush_r+0x3c>
8000dab0:	00c45783          	lhu	a5,12(s0)
8000dab4:	0407e793          	ori	a5,a5,64
8000dab8:	00f41623          	sh	a5,12(s0)
8000dabc:	01c12083          	lw	ra,28(sp)
8000dac0:	01812403          	lw	s0,24(sp)
8000dac4:	01412483          	lw	s1,20(sp)
8000dac8:	01012903          	lw	s2,16(sp)
8000dacc:	00c12983          	lw	s3,12(sp)
8000dad0:	02010113          	addi	sp,sp,32
8000dad4:	00008067          	ret
8000dad8:	04076713          	ori	a4,a4,64
8000dadc:	00e41623          	sh	a4,12(s0)
8000dae0:	fddff06f          	j	8000dabc <__sflush_r+0x15c>
8000dae4:	0105a983          	lw	s3,16(a1)
8000dae8:	ea098ae3          	beqz	s3,8000d99c <__sflush_r+0x3c>
8000daec:	0005a903          	lw	s2,0(a1)
8000daf0:	0037f793          	andi	a5,a5,3
8000daf4:	0135a023          	sw	s3,0(a1)
8000daf8:	41390933          	sub	s2,s2,s3
8000dafc:	00000713          	li	a4,0
8000db00:	00079463          	bnez	a5,8000db08 <__sflush_r+0x1a8>
8000db04:	0145a703          	lw	a4,20(a1)
8000db08:	00e42423          	sw	a4,8(s0)
8000db0c:	e92058e3          	blez	s2,8000d99c <__sflush_r+0x3c>
8000db10:	02842783          	lw	a5,40(s0)
8000db14:	02042583          	lw	a1,32(s0)
8000db18:	00090693          	mv	a3,s2
8000db1c:	00098613          	mv	a2,s3
8000db20:	00048513          	mv	a0,s1
8000db24:	000780e7          	jalr	a5
8000db28:	00a04c63          	bgtz	a0,8000db40 <__sflush_r+0x1e0>
8000db2c:	00c45783          	lhu	a5,12(s0)
8000db30:	fff00513          	li	a0,-1
8000db34:	0407e793          	ori	a5,a5,64
8000db38:	00f41623          	sh	a5,12(s0)
8000db3c:	f81ff06f          	j	8000dabc <__sflush_r+0x15c>
8000db40:	00a989b3          	add	s3,s3,a0
8000db44:	40a90933          	sub	s2,s2,a0
8000db48:	fc5ff06f          	j	8000db0c <__sflush_r+0x1ac>

Disassembly of section .text._fflush_r:

8000db4c <_fflush_r>:
8000db4c:	0105a783          	lw	a5,16(a1)
8000db50:	08078a63          	beqz	a5,8000dbe4 <_fflush_r+0x98>
8000db54:	fe010113          	addi	sp,sp,-32
8000db58:	00812c23          	sw	s0,24(sp)
8000db5c:	00112e23          	sw	ra,28(sp)
8000db60:	00050413          	mv	s0,a0
8000db64:	00050c63          	beqz	a0,8000db7c <_fflush_r+0x30>
8000db68:	01852783          	lw	a5,24(a0) # f0050018 <_heap_end+0x7003e018>
8000db6c:	00079863          	bnez	a5,8000db7c <_fflush_r+0x30>
8000db70:	00b12623          	sw	a1,12(sp)
8000db74:	1c8000ef          	jal	ra,8000dd3c <__sinit>
8000db78:	00c12583          	lw	a1,12(sp)
8000db7c:	ffff5797          	auipc	a5,0xffff5
8000db80:	2b878793          	addi	a5,a5,696 # 80002e34 <__sf_fake_stdin>
8000db84:	02f59263          	bne	a1,a5,8000dba8 <_fflush_r+0x5c>
8000db88:	00442583          	lw	a1,4(s0)
8000db8c:	00c59783          	lh	a5,12(a1)
8000db90:	04078063          	beqz	a5,8000dbd0 <_fflush_r+0x84>
8000db94:	00040513          	mv	a0,s0
8000db98:	01812403          	lw	s0,24(sp)
8000db9c:	01c12083          	lw	ra,28(sp)
8000dba0:	02010113          	addi	sp,sp,32
8000dba4:	dbdff06f          	j	8000d960 <__sflush_r>
8000dba8:	ffff5797          	auipc	a5,0xffff5
8000dbac:	2ac78793          	addi	a5,a5,684 # 80002e54 <__sf_fake_stdout>
8000dbb0:	00f59663          	bne	a1,a5,8000dbbc <_fflush_r+0x70>
8000dbb4:	00842583          	lw	a1,8(s0)
8000dbb8:	fd5ff06f          	j	8000db8c <_fflush_r+0x40>
8000dbbc:	ffff5797          	auipc	a5,0xffff5
8000dbc0:	25878793          	addi	a5,a5,600 # 80002e14 <__sf_fake_stderr>
8000dbc4:	fcf594e3          	bne	a1,a5,8000db8c <_fflush_r+0x40>
8000dbc8:	00c42583          	lw	a1,12(s0)
8000dbcc:	fc1ff06f          	j	8000db8c <_fflush_r+0x40>
8000dbd0:	01c12083          	lw	ra,28(sp)
8000dbd4:	01812403          	lw	s0,24(sp)
8000dbd8:	00000513          	li	a0,0
8000dbdc:	02010113          	addi	sp,sp,32
8000dbe0:	00008067          	ret
8000dbe4:	00000513          	li	a0,0
8000dbe8:	00008067          	ret

Disassembly of section .text.fflush:

8000dbec <fflush>:
8000dbec:	00050593          	mv	a1,a0
8000dbf0:	00051c63          	bnez	a0,8000dc08 <fflush+0x1c>
8000dbf4:	c4818793          	addi	a5,gp,-952 # 80003488 <_bss_end>
8000dbf8:	0007a503          	lw	a0,0(a5)
8000dbfc:	00000597          	auipc	a1,0x0
8000dc00:	f5058593          	addi	a1,a1,-176 # 8000db4c <_fflush_r>
8000dc04:	3ac0006f          	j	8000dfb0 <_fwalk_reent>
8000dc08:	80c18793          	addi	a5,gp,-2036 # 8000304c <_impure_ptr>
8000dc0c:	0007a503          	lw	a0,0(a5)
8000dc10:	f3dff06f          	j	8000db4c <_fflush_r>

Disassembly of section .text.__fp_lock:

8000dc14 <__fp_lock>:
8000dc14:	00000513          	li	a0,0
8000dc18:	00008067          	ret

Disassembly of section .text.std:

8000dc1c <std>:
8000dc1c:	ff010113          	addi	sp,sp,-16
8000dc20:	00812423          	sw	s0,8(sp)
8000dc24:	00112623          	sw	ra,12(sp)
8000dc28:	00050413          	mv	s0,a0
8000dc2c:	00b51623          	sh	a1,12(a0)
8000dc30:	00c51723          	sh	a2,14(a0)
8000dc34:	00052023          	sw	zero,0(a0)
8000dc38:	00052223          	sw	zero,4(a0)
8000dc3c:	00052423          	sw	zero,8(a0)
8000dc40:	06052223          	sw	zero,100(a0)
8000dc44:	00052823          	sw	zero,16(a0)
8000dc48:	00052a23          	sw	zero,20(a0)
8000dc4c:	00052c23          	sw	zero,24(a0)
8000dc50:	00800613          	li	a2,8
8000dc54:	00000593          	li	a1,0
8000dc58:	05c50513          	addi	a0,a0,92
8000dc5c:	820ff0ef          	jal	ra,8000cc7c <memset>
8000dc60:	00001797          	auipc	a5,0x1
8000dc64:	b9078793          	addi	a5,a5,-1136 # 8000e7f0 <__sread>
8000dc68:	02f42223          	sw	a5,36(s0)
8000dc6c:	00001797          	auipc	a5,0x1
8000dc70:	bdc78793          	addi	a5,a5,-1060 # 8000e848 <__swrite>
8000dc74:	02f42423          	sw	a5,40(s0)
8000dc78:	00001797          	auipc	a5,0x1
8000dc7c:	c5478793          	addi	a5,a5,-940 # 8000e8cc <__sseek>
8000dc80:	02f42623          	sw	a5,44(s0)
8000dc84:	00001797          	auipc	a5,0x1
8000dc88:	ca078793          	addi	a5,a5,-864 # 8000e924 <__sclose>
8000dc8c:	02842023          	sw	s0,32(s0)
8000dc90:	02f42823          	sw	a5,48(s0)
8000dc94:	00c12083          	lw	ra,12(sp)
8000dc98:	00812403          	lw	s0,8(sp)
8000dc9c:	01010113          	addi	sp,sp,16
8000dca0:	00008067          	ret

Disassembly of section .text._cleanup_r:

8000dca4 <_cleanup_r>:
8000dca4:	00000597          	auipc	a1,0x0
8000dca8:	ea858593          	addi	a1,a1,-344 # 8000db4c <_fflush_r>
8000dcac:	3040006f          	j	8000dfb0 <_fwalk_reent>

Disassembly of section .text.__fp_unlock:

8000dcb0 <__fp_unlock>:
8000dcb0:	00000513          	li	a0,0
8000dcb4:	00008067          	ret

Disassembly of section .text.__sfmoreglue:

8000dcb8 <__sfmoreglue>:
8000dcb8:	ff010113          	addi	sp,sp,-16
8000dcbc:	fff58613          	addi	a2,a1,-1
8000dcc0:	00812423          	sw	s0,8(sp)
8000dcc4:	00161413          	slli	s0,a2,0x1
8000dcc8:	00c40433          	add	s0,s0,a2
8000dccc:	00241413          	slli	s0,s0,0x2
8000dcd0:	00c40433          	add	s0,s0,a2
8000dcd4:	00341413          	slli	s0,s0,0x3
8000dcd8:	01212023          	sw	s2,0(sp)
8000dcdc:	00058913          	mv	s2,a1
8000dce0:	07440593          	addi	a1,s0,116
8000dce4:	00912223          	sw	s1,4(sp)
8000dce8:	00112623          	sw	ra,12(sp)
8000dcec:	654000ef          	jal	ra,8000e340 <_malloc_r>
8000dcf0:	00050493          	mv	s1,a0
8000dcf4:	02050063          	beqz	a0,8000dd14 <__sfmoreglue+0x5c>
8000dcf8:	00052023          	sw	zero,0(a0)
8000dcfc:	01252223          	sw	s2,4(a0)
8000dd00:	00c50513          	addi	a0,a0,12
8000dd04:	00a4a423          	sw	a0,8(s1)
8000dd08:	06840613          	addi	a2,s0,104
8000dd0c:	00000593          	li	a1,0
8000dd10:	f6dfe0ef          	jal	ra,8000cc7c <memset>
8000dd14:	00c12083          	lw	ra,12(sp)
8000dd18:	00812403          	lw	s0,8(sp)
8000dd1c:	00048513          	mv	a0,s1
8000dd20:	00012903          	lw	s2,0(sp)
8000dd24:	00412483          	lw	s1,4(sp)
8000dd28:	01010113          	addi	sp,sp,16
8000dd2c:	00008067          	ret

Disassembly of section .text._cleanup:

8000dd30 <_cleanup>:
8000dd30:	c4818793          	addi	a5,gp,-952 # 80003488 <_bss_end>
8000dd34:	0007a503          	lw	a0,0(a5)
8000dd38:	f6dff06f          	j	8000dca4 <_cleanup_r>

Disassembly of section .text.__sinit:

8000dd3c <__sinit>:
8000dd3c:	01852783          	lw	a5,24(a0)
8000dd40:	0a079463          	bnez	a5,8000dde8 <__sinit+0xac>
8000dd44:	ff010113          	addi	sp,sp,-16
8000dd48:	00112623          	sw	ra,12(sp)
8000dd4c:	00812423          	sw	s0,8(sp)
8000dd50:	00000797          	auipc	a5,0x0
8000dd54:	f5478793          	addi	a5,a5,-172 # 8000dca4 <_cleanup_r>
8000dd58:	02f52423          	sw	a5,40(a0)
8000dd5c:	c4818793          	addi	a5,gp,-952 # 80003488 <_bss_end>
8000dd60:	0007a783          	lw	a5,0(a5)
8000dd64:	04052423          	sw	zero,72(a0)
8000dd68:	04052623          	sw	zero,76(a0)
8000dd6c:	04052823          	sw	zero,80(a0)
8000dd70:	00f51663          	bne	a0,a5,8000dd7c <__sinit+0x40>
8000dd74:	00100793          	li	a5,1
8000dd78:	00f52c23          	sw	a5,24(a0)
8000dd7c:	00050413          	mv	s0,a0
8000dd80:	06c000ef          	jal	ra,8000ddec <__sfp>
8000dd84:	00a42223          	sw	a0,4(s0)
8000dd88:	00040513          	mv	a0,s0
8000dd8c:	060000ef          	jal	ra,8000ddec <__sfp>
8000dd90:	00a42423          	sw	a0,8(s0)
8000dd94:	00040513          	mv	a0,s0
8000dd98:	054000ef          	jal	ra,8000ddec <__sfp>
8000dd9c:	00a42623          	sw	a0,12(s0)
8000dda0:	00442503          	lw	a0,4(s0)
8000dda4:	00000613          	li	a2,0
8000dda8:	00400593          	li	a1,4
8000ddac:	e71ff0ef          	jal	ra,8000dc1c <std>
8000ddb0:	00842503          	lw	a0,8(s0)
8000ddb4:	00100613          	li	a2,1
8000ddb8:	00900593          	li	a1,9
8000ddbc:	e61ff0ef          	jal	ra,8000dc1c <std>
8000ddc0:	00c42503          	lw	a0,12(s0)
8000ddc4:	00200613          	li	a2,2
8000ddc8:	01200593          	li	a1,18
8000ddcc:	e51ff0ef          	jal	ra,8000dc1c <std>
8000ddd0:	00100793          	li	a5,1
8000ddd4:	00f42c23          	sw	a5,24(s0)
8000ddd8:	00c12083          	lw	ra,12(sp)
8000dddc:	00812403          	lw	s0,8(sp)
8000dde0:	01010113          	addi	sp,sp,16
8000dde4:	00008067          	ret
8000dde8:	00008067          	ret

Disassembly of section .text.__sfp:

8000ddec <__sfp>:
8000ddec:	ff010113          	addi	sp,sp,-16
8000ddf0:	c4818793          	addi	a5,gp,-952 # 80003488 <_bss_end>
8000ddf4:	00912223          	sw	s1,4(sp)
8000ddf8:	0007a483          	lw	s1,0(a5)
8000ddfc:	01212023          	sw	s2,0(sp)
8000de00:	00112623          	sw	ra,12(sp)
8000de04:	0184a783          	lw	a5,24(s1)
8000de08:	00812423          	sw	s0,8(sp)
8000de0c:	00050913          	mv	s2,a0
8000de10:	00079663          	bnez	a5,8000de1c <__sfp+0x30>
8000de14:	00048513          	mv	a0,s1
8000de18:	f25ff0ef          	jal	ra,8000dd3c <__sinit>
8000de1c:	04848493          	addi	s1,s1,72
8000de20:	0084a403          	lw	s0,8(s1)
8000de24:	0044a783          	lw	a5,4(s1)
8000de28:	fff78793          	addi	a5,a5,-1
8000de2c:	0007da63          	bgez	a5,8000de40 <__sfp+0x54>
8000de30:	0004a783          	lw	a5,0(s1)
8000de34:	08078063          	beqz	a5,8000deb4 <__sfp+0xc8>
8000de38:	0004a483          	lw	s1,0(s1)
8000de3c:	fe5ff06f          	j	8000de20 <__sfp+0x34>
8000de40:	00c41703          	lh	a4,12(s0)
8000de44:	06071463          	bnez	a4,8000deac <__sfp+0xc0>
8000de48:	ffff07b7          	lui	a5,0xffff0
8000de4c:	00178793          	addi	a5,a5,1 # ffff0001 <_heap_end+0x7ffde001>
8000de50:	06042223          	sw	zero,100(s0)
8000de54:	00042023          	sw	zero,0(s0)
8000de58:	00042223          	sw	zero,4(s0)
8000de5c:	00042423          	sw	zero,8(s0)
8000de60:	00f42623          	sw	a5,12(s0)
8000de64:	00042823          	sw	zero,16(s0)
8000de68:	00042a23          	sw	zero,20(s0)
8000de6c:	00042c23          	sw	zero,24(s0)
8000de70:	00800613          	li	a2,8
8000de74:	00000593          	li	a1,0
8000de78:	05c40513          	addi	a0,s0,92
8000de7c:	e01fe0ef          	jal	ra,8000cc7c <memset>
8000de80:	02042a23          	sw	zero,52(s0)
8000de84:	02042c23          	sw	zero,56(s0)
8000de88:	04042423          	sw	zero,72(s0)
8000de8c:	04042623          	sw	zero,76(s0)
8000de90:	00040513          	mv	a0,s0
8000de94:	00c12083          	lw	ra,12(sp)
8000de98:	00812403          	lw	s0,8(sp)
8000de9c:	00412483          	lw	s1,4(sp)
8000dea0:	00012903          	lw	s2,0(sp)
8000dea4:	01010113          	addi	sp,sp,16
8000dea8:	00008067          	ret
8000deac:	06840413          	addi	s0,s0,104
8000deb0:	f79ff06f          	j	8000de28 <__sfp+0x3c>
8000deb4:	00400593          	li	a1,4
8000deb8:	00090513          	mv	a0,s2
8000debc:	dfdff0ef          	jal	ra,8000dcb8 <__sfmoreglue>
8000dec0:	00a4a023          	sw	a0,0(s1)
8000dec4:	00050413          	mv	s0,a0
8000dec8:	f60518e3          	bnez	a0,8000de38 <__sfp+0x4c>
8000decc:	00c00793          	li	a5,12
8000ded0:	00f92023          	sw	a5,0(s2)
8000ded4:	fbdff06f          	j	8000de90 <__sfp+0xa4>

Disassembly of section .text.__sfp_lock_acquire:

8000ded8 <__sfp_lock_acquire>:
8000ded8:	00008067          	ret

Disassembly of section .text.__sfp_lock_release:

8000dedc <__sfp_lock_release>:
8000dedc:	00008067          	ret

Disassembly of section .text.__sinit_lock_acquire:

8000dee0 <__sinit_lock_acquire>:
8000dee0:	00008067          	ret

Disassembly of section .text.__sinit_lock_release:

8000dee4 <__sinit_lock_release>:
8000dee4:	00008067          	ret

Disassembly of section .text.__fp_lock_all:

8000dee8 <__fp_lock_all>:
8000dee8:	80c18793          	addi	a5,gp,-2036 # 8000304c <_impure_ptr>
8000deec:	0007a503          	lw	a0,0(a5)
8000def0:	00000597          	auipc	a1,0x0
8000def4:	d2458593          	addi	a1,a1,-732 # 8000dc14 <__fp_lock>
8000def8:	0180006f          	j	8000df10 <_fwalk>

Disassembly of section .text.__fp_unlock_all:

8000defc <__fp_unlock_all>:
8000defc:	80c18793          	addi	a5,gp,-2036 # 8000304c <_impure_ptr>
8000df00:	0007a503          	lw	a0,0(a5)
8000df04:	00000597          	auipc	a1,0x0
8000df08:	dac58593          	addi	a1,a1,-596 # 8000dcb0 <__fp_unlock>
8000df0c:	0040006f          	j	8000df10 <_fwalk>

Disassembly of section .text._fwalk:

8000df10 <_fwalk>:
8000df10:	fd010113          	addi	sp,sp,-48
8000df14:	02812423          	sw	s0,40(sp)
8000df18:	03212023          	sw	s2,32(sp)
8000df1c:	01412c23          	sw	s4,24(sp)
8000df20:	01512a23          	sw	s5,20(sp)
8000df24:	02112623          	sw	ra,44(sp)
8000df28:	02912223          	sw	s1,36(sp)
8000df2c:	01312e23          	sw	s3,28(sp)
8000df30:	04850413          	addi	s0,a0,72
8000df34:	00000913          	li	s2,0
8000df38:	00100a13          	li	s4,1
8000df3c:	fff00a93          	li	s5,-1
8000df40:	02041663          	bnez	s0,8000df6c <_fwalk+0x5c>
8000df44:	02c12083          	lw	ra,44(sp)
8000df48:	02812403          	lw	s0,40(sp)
8000df4c:	00090513          	mv	a0,s2
8000df50:	02412483          	lw	s1,36(sp)
8000df54:	02012903          	lw	s2,32(sp)
8000df58:	01c12983          	lw	s3,28(sp)
8000df5c:	01812a03          	lw	s4,24(sp)
8000df60:	01412a83          	lw	s5,20(sp)
8000df64:	03010113          	addi	sp,sp,48
8000df68:	00008067          	ret
8000df6c:	00842483          	lw	s1,8(s0)
8000df70:	00442983          	lw	s3,4(s0)
8000df74:	fff98993          	addi	s3,s3,-1
8000df78:	0009d663          	bgez	s3,8000df84 <_fwalk+0x74>
8000df7c:	00042403          	lw	s0,0(s0)
8000df80:	fc1ff06f          	j	8000df40 <_fwalk+0x30>
8000df84:	00c4d783          	lhu	a5,12(s1)
8000df88:	02fa7063          	bgeu	s4,a5,8000dfa8 <_fwalk+0x98>
8000df8c:	00e49783          	lh	a5,14(s1)
8000df90:	01578c63          	beq	a5,s5,8000dfa8 <_fwalk+0x98>
8000df94:	00048513          	mv	a0,s1
8000df98:	00b12623          	sw	a1,12(sp)
8000df9c:	000580e7          	jalr	a1
8000dfa0:	00c12583          	lw	a1,12(sp)
8000dfa4:	00a96933          	or	s2,s2,a0
8000dfa8:	06848493          	addi	s1,s1,104
8000dfac:	fc9ff06f          	j	8000df74 <_fwalk+0x64>

Disassembly of section .text._fwalk_reent:

8000dfb0 <_fwalk_reent>:
8000dfb0:	fd010113          	addi	sp,sp,-48
8000dfb4:	02812423          	sw	s0,40(sp)
8000dfb8:	03212023          	sw	s2,32(sp)
8000dfbc:	01412c23          	sw	s4,24(sp)
8000dfc0:	01512a23          	sw	s5,20(sp)
8000dfc4:	01612823          	sw	s6,16(sp)
8000dfc8:	01712623          	sw	s7,12(sp)
8000dfcc:	02112623          	sw	ra,44(sp)
8000dfd0:	02912223          	sw	s1,36(sp)
8000dfd4:	01312e23          	sw	s3,28(sp)
8000dfd8:	00050a13          	mv	s4,a0
8000dfdc:	00058a93          	mv	s5,a1
8000dfe0:	04850413          	addi	s0,a0,72
8000dfe4:	00000913          	li	s2,0
8000dfe8:	00100b13          	li	s6,1
8000dfec:	fff00b93          	li	s7,-1
8000dff0:	02041a63          	bnez	s0,8000e024 <_fwalk_reent+0x74>
8000dff4:	02c12083          	lw	ra,44(sp)
8000dff8:	02812403          	lw	s0,40(sp)
8000dffc:	00090513          	mv	a0,s2
8000e000:	02412483          	lw	s1,36(sp)
8000e004:	02012903          	lw	s2,32(sp)
8000e008:	01c12983          	lw	s3,28(sp)
8000e00c:	01812a03          	lw	s4,24(sp)
8000e010:	01412a83          	lw	s5,20(sp)
8000e014:	01012b03          	lw	s6,16(sp)
8000e018:	00c12b83          	lw	s7,12(sp)
8000e01c:	03010113          	addi	sp,sp,48
8000e020:	00008067          	ret
8000e024:	00842483          	lw	s1,8(s0)
8000e028:	00442983          	lw	s3,4(s0)
8000e02c:	fff98993          	addi	s3,s3,-1
8000e030:	0009d663          	bgez	s3,8000e03c <_fwalk_reent+0x8c>
8000e034:	00042403          	lw	s0,0(s0)
8000e038:	fb9ff06f          	j	8000dff0 <_fwalk_reent+0x40>
8000e03c:	00c4d783          	lhu	a5,12(s1)
8000e040:	00fb7e63          	bgeu	s6,a5,8000e05c <_fwalk_reent+0xac>
8000e044:	00e49783          	lh	a5,14(s1)
8000e048:	01778a63          	beq	a5,s7,8000e05c <_fwalk_reent+0xac>
8000e04c:	00048593          	mv	a1,s1
8000e050:	000a0513          	mv	a0,s4
8000e054:	000a80e7          	jalr	s5
8000e058:	00a96933          	or	s2,s2,a0
8000e05c:	06848493          	addi	s1,s1,104
8000e060:	fcdff06f          	j	8000e02c <_fwalk_reent+0x7c>

Disassembly of section .text.malloc:

8000e064 <malloc>:
8000e064:	80c18793          	addi	a5,gp,-2036 # 8000304c <_impure_ptr>
8000e068:	00050593          	mv	a1,a0
8000e06c:	0007a503          	lw	a0,0(a5)
8000e070:	2d00006f          	j	8000e340 <_malloc_r>

Disassembly of section .text.free:

8000e074 <free>:
8000e074:	80c18793          	addi	a5,gp,-2036 # 8000304c <_impure_ptr>
8000e078:	00050593          	mv	a1,a0
8000e07c:	0007a503          	lw	a0,0(a5)
8000e080:	1bc0006f          	j	8000e23c <_free_r>

Disassembly of section .text.memcmp:

8000e084 <memcmp>:
8000e084:	00000713          	li	a4,0
8000e088:	00e61663          	bne	a2,a4,8000e094 <memcmp+0x10>
8000e08c:	00000513          	li	a0,0
8000e090:	00008067          	ret
8000e094:	00e507b3          	add	a5,a0,a4
8000e098:	00170713          	addi	a4,a4,1
8000e09c:	00e586b3          	add	a3,a1,a4
8000e0a0:	0007c783          	lbu	a5,0(a5)
8000e0a4:	fff6c683          	lbu	a3,-1(a3)
8000e0a8:	fed780e3          	beq	a5,a3,8000e088 <memcmp+0x4>
8000e0ac:	40d78533          	sub	a0,a5,a3
8000e0b0:	00008067          	ret

Disassembly of section .text.memcpy:

8000e0b4 <memcpy>:
8000e0b4:	00a5c7b3          	xor	a5,a1,a0
8000e0b8:	0037f793          	andi	a5,a5,3
8000e0bc:	00c50733          	add	a4,a0,a2
8000e0c0:	00079663          	bnez	a5,8000e0cc <memcpy+0x18>
8000e0c4:	00300793          	li	a5,3
8000e0c8:	02c7e263          	bltu	a5,a2,8000e0ec <memcpy+0x38>
8000e0cc:	00050793          	mv	a5,a0
8000e0d0:	0ae57c63          	bgeu	a0,a4,8000e188 <memcpy+0xd4>
8000e0d4:	0005c683          	lbu	a3,0(a1)
8000e0d8:	00178793          	addi	a5,a5,1
8000e0dc:	00158593          	addi	a1,a1,1
8000e0e0:	fed78fa3          	sb	a3,-1(a5)
8000e0e4:	fee7e8e3          	bltu	a5,a4,8000e0d4 <memcpy+0x20>
8000e0e8:	00008067          	ret
8000e0ec:	00357693          	andi	a3,a0,3
8000e0f0:	00050793          	mv	a5,a0
8000e0f4:	00068e63          	beqz	a3,8000e110 <memcpy+0x5c>
8000e0f8:	0005c683          	lbu	a3,0(a1)
8000e0fc:	00178793          	addi	a5,a5,1
8000e100:	00158593          	addi	a1,a1,1
8000e104:	fed78fa3          	sb	a3,-1(a5)
8000e108:	0037f693          	andi	a3,a5,3
8000e10c:	fe9ff06f          	j	8000e0f4 <memcpy+0x40>
8000e110:	ffc77693          	andi	a3,a4,-4
8000e114:	fe068613          	addi	a2,a3,-32
8000e118:	06c7f463          	bgeu	a5,a2,8000e180 <memcpy+0xcc>
8000e11c:	0005a383          	lw	t2,0(a1)
8000e120:	0045a283          	lw	t0,4(a1)
8000e124:	0085af83          	lw	t6,8(a1)
8000e128:	00c5af03          	lw	t5,12(a1)
8000e12c:	0105ae83          	lw	t4,16(a1)
8000e130:	0145ae03          	lw	t3,20(a1)
8000e134:	0185a303          	lw	t1,24(a1)
8000e138:	01c5a883          	lw	a7,28(a1)
8000e13c:	02458593          	addi	a1,a1,36
8000e140:	0077a023          	sw	t2,0(a5)
8000e144:	ffc5a803          	lw	a6,-4(a1)
8000e148:	0057a223          	sw	t0,4(a5)
8000e14c:	01f7a423          	sw	t6,8(a5)
8000e150:	01e7a623          	sw	t5,12(a5)
8000e154:	01d7a823          	sw	t4,16(a5)
8000e158:	01c7aa23          	sw	t3,20(a5)
8000e15c:	0067ac23          	sw	t1,24(a5)
8000e160:	0117ae23          	sw	a7,28(a5)
8000e164:	02478793          	addi	a5,a5,36
8000e168:	ff07ae23          	sw	a6,-4(a5)
8000e16c:	fadff06f          	j	8000e118 <memcpy+0x64>
8000e170:	0005a603          	lw	a2,0(a1)
8000e174:	00478793          	addi	a5,a5,4
8000e178:	00458593          	addi	a1,a1,4
8000e17c:	fec7ae23          	sw	a2,-4(a5)
8000e180:	fed7e8e3          	bltu	a5,a3,8000e170 <memcpy+0xbc>
8000e184:	f4e7e8e3          	bltu	a5,a4,8000e0d4 <memcpy+0x20>
8000e188:	00008067          	ret

Disassembly of section .text.memmove:

8000e18c <memmove>:
8000e18c:	04a5fa63          	bgeu	a1,a0,8000e1e0 <memmove+0x54>
8000e190:	00c586b3          	add	a3,a1,a2
8000e194:	04d57663          	bgeu	a0,a3,8000e1e0 <memmove+0x54>
8000e198:	fff64593          	not	a1,a2
8000e19c:	00000793          	li	a5,0
8000e1a0:	fff78793          	addi	a5,a5,-1
8000e1a4:	00f59463          	bne	a1,a5,8000e1ac <memmove+0x20>
8000e1a8:	00008067          	ret
8000e1ac:	00f68733          	add	a4,a3,a5
8000e1b0:	00074803          	lbu	a6,0(a4)
8000e1b4:	00c78733          	add	a4,a5,a2
8000e1b8:	00e50733          	add	a4,a0,a4
8000e1bc:	01070023          	sb	a6,0(a4)
8000e1c0:	fe1ff06f          	j	8000e1a0 <memmove+0x14>
8000e1c4:	00f58733          	add	a4,a1,a5
8000e1c8:	00074683          	lbu	a3,0(a4)
8000e1cc:	00f50733          	add	a4,a0,a5
8000e1d0:	00178793          	addi	a5,a5,1
8000e1d4:	00d70023          	sb	a3,0(a4)
8000e1d8:	fef616e3          	bne	a2,a5,8000e1c4 <memmove+0x38>
8000e1dc:	00008067          	ret
8000e1e0:	00000793          	li	a5,0
8000e1e4:	ff5ff06f          	j	8000e1d8 <memmove+0x4c>

Disassembly of section .text._calloc_r:

8000e1e8 <_calloc_r>:
8000e1e8:	fe010113          	addi	sp,sp,-32
8000e1ec:	00812c23          	sw	s0,24(sp)
8000e1f0:	00050413          	mv	s0,a0
8000e1f4:	00058513          	mv	a0,a1
8000e1f8:	00060593          	mv	a1,a2
8000e1fc:	00112e23          	sw	ra,28(sp)
8000e200:	960ff0ef          	jal	ra,8000d360 <__mulsi3>
8000e204:	00050593          	mv	a1,a0
8000e208:	00a12623          	sw	a0,12(sp)
8000e20c:	00040513          	mv	a0,s0
8000e210:	130000ef          	jal	ra,8000e340 <_malloc_r>
8000e214:	00050413          	mv	s0,a0
8000e218:	00050863          	beqz	a0,8000e228 <_calloc_r+0x40>
8000e21c:	00c12603          	lw	a2,12(sp)
8000e220:	00000593          	li	a1,0
8000e224:	a59fe0ef          	jal	ra,8000cc7c <memset>
8000e228:	00040513          	mv	a0,s0
8000e22c:	01c12083          	lw	ra,28(sp)
8000e230:	01812403          	lw	s0,24(sp)
8000e234:	02010113          	addi	sp,sp,32
8000e238:	00008067          	ret

Disassembly of section .text._free_r:

8000e23c <_free_r>:
8000e23c:	10058063          	beqz	a1,8000e33c <_free_r+0x100>
8000e240:	ffc5a783          	lw	a5,-4(a1)
8000e244:	ff010113          	addi	sp,sp,-16
8000e248:	00812423          	sw	s0,8(sp)
8000e24c:	00112623          	sw	ra,12(sp)
8000e250:	00912223          	sw	s1,4(sp)
8000e254:	ffc58413          	addi	s0,a1,-4
8000e258:	0007d463          	bgez	a5,8000e260 <_free_r+0x24>
8000e25c:	00f40433          	add	s0,s0,a5
8000e260:	00050493          	mv	s1,a0
8000e264:	975f70ef          	jal	ra,80005bd8 <__malloc_lock>
8000e268:	8f418793          	addi	a5,gp,-1804 # 80003134 <__malloc_free_list>
8000e26c:	0007a783          	lw	a5,0(a5)
8000e270:	02079263          	bnez	a5,8000e294 <_free_r+0x58>
8000e274:	00042223          	sw	zero,4(s0)
8000e278:	8e81aa23          	sw	s0,-1804(gp) # 80003134 <__malloc_free_list>
8000e27c:	00812403          	lw	s0,8(sp)
8000e280:	00c12083          	lw	ra,12(sp)
8000e284:	00048513          	mv	a0,s1
8000e288:	00412483          	lw	s1,4(sp)
8000e28c:	01010113          	addi	sp,sp,16
8000e290:	94df706f          	j	80005bdc <__malloc_unlock>
8000e294:	02f47663          	bgeu	s0,a5,8000e2c0 <_free_r+0x84>
8000e298:	00042683          	lw	a3,0(s0)
8000e29c:	00d40733          	add	a4,s0,a3
8000e2a0:	00e79a63          	bne	a5,a4,8000e2b4 <_free_r+0x78>
8000e2a4:	0007a703          	lw	a4,0(a5)
8000e2a8:	0047a783          	lw	a5,4(a5)
8000e2ac:	00d70733          	add	a4,a4,a3
8000e2b0:	00e42023          	sw	a4,0(s0)
8000e2b4:	00f42223          	sw	a5,4(s0)
8000e2b8:	fc1ff06f          	j	8000e278 <_free_r+0x3c>
8000e2bc:	00070793          	mv	a5,a4
8000e2c0:	0047a703          	lw	a4,4(a5)
8000e2c4:	00070463          	beqz	a4,8000e2cc <_free_r+0x90>
8000e2c8:	fee47ae3          	bgeu	s0,a4,8000e2bc <_free_r+0x80>
8000e2cc:	0007a683          	lw	a3,0(a5)
8000e2d0:	00d78633          	add	a2,a5,a3
8000e2d4:	02861863          	bne	a2,s0,8000e304 <_free_r+0xc8>
8000e2d8:	00042603          	lw	a2,0(s0)
8000e2dc:	00c686b3          	add	a3,a3,a2
8000e2e0:	00d7a023          	sw	a3,0(a5)
8000e2e4:	00d78633          	add	a2,a5,a3
8000e2e8:	f8c71ae3          	bne	a4,a2,8000e27c <_free_r+0x40>
8000e2ec:	00072603          	lw	a2,0(a4)
8000e2f0:	00472703          	lw	a4,4(a4)
8000e2f4:	00d606b3          	add	a3,a2,a3
8000e2f8:	00d7a023          	sw	a3,0(a5)
8000e2fc:	00e7a223          	sw	a4,4(a5)
8000e300:	f7dff06f          	j	8000e27c <_free_r+0x40>
8000e304:	00c47863          	bgeu	s0,a2,8000e314 <_free_r+0xd8>
8000e308:	00c00793          	li	a5,12
8000e30c:	00f4a023          	sw	a5,0(s1)
8000e310:	f6dff06f          	j	8000e27c <_free_r+0x40>
8000e314:	00042603          	lw	a2,0(s0)
8000e318:	00c406b3          	add	a3,s0,a2
8000e31c:	00d71a63          	bne	a4,a3,8000e330 <_free_r+0xf4>
8000e320:	00072683          	lw	a3,0(a4)
8000e324:	00472703          	lw	a4,4(a4)
8000e328:	00c686b3          	add	a3,a3,a2
8000e32c:	00d42023          	sw	a3,0(s0)
8000e330:	00e42223          	sw	a4,4(s0)
8000e334:	0087a223          	sw	s0,4(a5)
8000e338:	f45ff06f          	j	8000e27c <_free_r+0x40>
8000e33c:	00008067          	ret

Disassembly of section .text._malloc_r:

8000e340 <_malloc_r>:
8000e340:	fe010113          	addi	sp,sp,-32
8000e344:	00912a23          	sw	s1,20(sp)
8000e348:	00358493          	addi	s1,a1,3
8000e34c:	ffc4f493          	andi	s1,s1,-4
8000e350:	00112e23          	sw	ra,28(sp)
8000e354:	00812c23          	sw	s0,24(sp)
8000e358:	01212823          	sw	s2,16(sp)
8000e35c:	01312623          	sw	s3,12(sp)
8000e360:	00848493          	addi	s1,s1,8
8000e364:	00c00793          	li	a5,12
8000e368:	06f4f463          	bgeu	s1,a5,8000e3d0 <_malloc_r+0x90>
8000e36c:	00c00493          	li	s1,12
8000e370:	06b4e263          	bltu	s1,a1,8000e3d4 <_malloc_r+0x94>
8000e374:	00050913          	mv	s2,a0
8000e378:	861f70ef          	jal	ra,80005bd8 <__malloc_lock>
8000e37c:	8f418793          	addi	a5,gp,-1804 # 80003134 <__malloc_free_list>
8000e380:	0007a703          	lw	a4,0(a5)
8000e384:	00070413          	mv	s0,a4
8000e388:	06041a63          	bnez	s0,8000e3fc <_malloc_r+0xbc>
8000e38c:	8f818793          	addi	a5,gp,-1800 # 80003138 <__malloc_sbrk_start>
8000e390:	0007a783          	lw	a5,0(a5)
8000e394:	00079a63          	bnez	a5,8000e3a8 <_malloc_r+0x68>
8000e398:	00000593          	li	a1,0
8000e39c:	00090513          	mv	a0,s2
8000e3a0:	1cc000ef          	jal	ra,8000e56c <_sbrk_r>
8000e3a4:	8ea1ac23          	sw	a0,-1800(gp) # 80003138 <__malloc_sbrk_start>
8000e3a8:	00048593          	mv	a1,s1
8000e3ac:	00090513          	mv	a0,s2
8000e3b0:	1bc000ef          	jal	ra,8000e56c <_sbrk_r>
8000e3b4:	fff00993          	li	s3,-1
8000e3b8:	0b351a63          	bne	a0,s3,8000e46c <_malloc_r+0x12c>
8000e3bc:	00c00793          	li	a5,12
8000e3c0:	00f92023          	sw	a5,0(s2)
8000e3c4:	00090513          	mv	a0,s2
8000e3c8:	815f70ef          	jal	ra,80005bdc <__malloc_unlock>
8000e3cc:	0100006f          	j	8000e3dc <_malloc_r+0x9c>
8000e3d0:	fa04d0e3          	bgez	s1,8000e370 <_malloc_r+0x30>
8000e3d4:	00c00793          	li	a5,12
8000e3d8:	00f52023          	sw	a5,0(a0)
8000e3dc:	00000513          	li	a0,0
8000e3e0:	01c12083          	lw	ra,28(sp)
8000e3e4:	01812403          	lw	s0,24(sp)
8000e3e8:	01412483          	lw	s1,20(sp)
8000e3ec:	01012903          	lw	s2,16(sp)
8000e3f0:	00c12983          	lw	s3,12(sp)
8000e3f4:	02010113          	addi	sp,sp,32
8000e3f8:	00008067          	ret
8000e3fc:	00042783          	lw	a5,0(s0)
8000e400:	409787b3          	sub	a5,a5,s1
8000e404:	0407ce63          	bltz	a5,8000e460 <_malloc_r+0x120>
8000e408:	00b00693          	li	a3,11
8000e40c:	00f6fa63          	bgeu	a3,a5,8000e420 <_malloc_r+0xe0>
8000e410:	00f42023          	sw	a5,0(s0)
8000e414:	00f40433          	add	s0,s0,a5
8000e418:	00942023          	sw	s1,0(s0)
8000e41c:	0100006f          	j	8000e42c <_malloc_r+0xec>
8000e420:	00442783          	lw	a5,4(s0)
8000e424:	02871a63          	bne	a4,s0,8000e458 <_malloc_r+0x118>
8000e428:	8ef1aa23          	sw	a5,-1804(gp) # 80003134 <__malloc_free_list>
8000e42c:	00090513          	mv	a0,s2
8000e430:	facf70ef          	jal	ra,80005bdc <__malloc_unlock>
8000e434:	00b40513          	addi	a0,s0,11
8000e438:	00440793          	addi	a5,s0,4
8000e43c:	ff857513          	andi	a0,a0,-8
8000e440:	40f50733          	sub	a4,a0,a5
8000e444:	f8070ee3          	beqz	a4,8000e3e0 <_malloc_r+0xa0>
8000e448:	00e40433          	add	s0,s0,a4
8000e44c:	40a787b3          	sub	a5,a5,a0
8000e450:	00f42023          	sw	a5,0(s0)
8000e454:	f8dff06f          	j	8000e3e0 <_malloc_r+0xa0>
8000e458:	00f72223          	sw	a5,4(a4)
8000e45c:	fd1ff06f          	j	8000e42c <_malloc_r+0xec>
8000e460:	00040713          	mv	a4,s0
8000e464:	00442403          	lw	s0,4(s0)
8000e468:	f21ff06f          	j	8000e388 <_malloc_r+0x48>
8000e46c:	00350413          	addi	s0,a0,3
8000e470:	ffc47413          	andi	s0,s0,-4
8000e474:	fa8502e3          	beq	a0,s0,8000e418 <_malloc_r+0xd8>
8000e478:	40a405b3          	sub	a1,s0,a0
8000e47c:	00090513          	mv	a0,s2
8000e480:	0ec000ef          	jal	ra,8000e56c <_sbrk_r>
8000e484:	f9351ae3          	bne	a0,s3,8000e418 <_malloc_r+0xd8>
8000e488:	f35ff06f          	j	8000e3bc <_malloc_r+0x7c>

Disassembly of section .text._printf_r:

8000e48c <_iprintf_r>:
8000e48c:	fb010113          	addi	sp,sp,-80
8000e490:	02812423          	sw	s0,40(sp)
8000e494:	02112623          	sw	ra,44(sp)
8000e498:	02c12c23          	sw	a2,56(sp)
8000e49c:	02d12e23          	sw	a3,60(sp)
8000e4a0:	04e12023          	sw	a4,64(sp)
8000e4a4:	04f12223          	sw	a5,68(sp)
8000e4a8:	05012423          	sw	a6,72(sp)
8000e4ac:	05112623          	sw	a7,76(sp)
8000e4b0:	00050413          	mv	s0,a0
8000e4b4:	00050c63          	beqz	a0,8000e4cc <_iprintf_r+0x40>
8000e4b8:	01852783          	lw	a5,24(a0)
8000e4bc:	00079863          	bnez	a5,8000e4cc <_iprintf_r+0x40>
8000e4c0:	00b12623          	sw	a1,12(sp)
8000e4c4:	879ff0ef          	jal	ra,8000dd3c <__sinit>
8000e4c8:	00c12583          	lw	a1,12(sp)
8000e4cc:	00058613          	mv	a2,a1
8000e4d0:	00842583          	lw	a1,8(s0)
8000e4d4:	03810693          	addi	a3,sp,56
8000e4d8:	00040513          	mv	a0,s0
8000e4dc:	00d12e23          	sw	a3,28(sp)
8000e4e0:	50c010ef          	jal	ra,8000f9ec <_vfiprintf_r>
8000e4e4:	02c12083          	lw	ra,44(sp)
8000e4e8:	02812403          	lw	s0,40(sp)
8000e4ec:	05010113          	addi	sp,sp,80
8000e4f0:	00008067          	ret

Disassembly of section .text.printf:

8000e4f4 <iprintf>:
8000e4f4:	fc010113          	addi	sp,sp,-64
8000e4f8:	02f12a23          	sw	a5,52(sp)
8000e4fc:	02b12223          	sw	a1,36(sp)
8000e500:	02c12423          	sw	a2,40(sp)
8000e504:	02d12623          	sw	a3,44(sp)
8000e508:	02e12823          	sw	a4,48(sp)
8000e50c:	03012c23          	sw	a6,56(sp)
8000e510:	03112e23          	sw	a7,60(sp)
8000e514:	80c18793          	addi	a5,gp,-2036 # 8000304c <_impure_ptr>
8000e518:	00812c23          	sw	s0,24(sp)
8000e51c:	0007a403          	lw	s0,0(a5)
8000e520:	00912a23          	sw	s1,20(sp)
8000e524:	00112e23          	sw	ra,28(sp)
8000e528:	00050493          	mv	s1,a0
8000e52c:	00040a63          	beqz	s0,8000e540 <iprintf+0x4c>
8000e530:	01842783          	lw	a5,24(s0)
8000e534:	00079663          	bnez	a5,8000e540 <iprintf+0x4c>
8000e538:	00040513          	mv	a0,s0
8000e53c:	801ff0ef          	jal	ra,8000dd3c <__sinit>
8000e540:	00842583          	lw	a1,8(s0)
8000e544:	02410693          	addi	a3,sp,36
8000e548:	00048613          	mv	a2,s1
8000e54c:	00040513          	mv	a0,s0
8000e550:	00d12623          	sw	a3,12(sp)
8000e554:	498010ef          	jal	ra,8000f9ec <_vfiprintf_r>
8000e558:	01c12083          	lw	ra,28(sp)
8000e55c:	01812403          	lw	s0,24(sp)
8000e560:	01412483          	lw	s1,20(sp)
8000e564:	04010113          	addi	sp,sp,64
8000e568:	00008067          	ret

Disassembly of section .text._sbrk_r:

8000e56c <_sbrk_r>:
8000e56c:	ff010113          	addi	sp,sp,-16
8000e570:	00812423          	sw	s0,8(sp)
8000e574:	00050413          	mv	s0,a0
8000e578:	00058513          	mv	a0,a1
8000e57c:	c401a223          	sw	zero,-956(gp) # 80003484 <errno>
8000e580:	00112623          	sw	ra,12(sp)
8000e584:	ee0f70ef          	jal	ra,80005c64 <_sbrk>
8000e588:	fff00793          	li	a5,-1
8000e58c:	00f51a63          	bne	a0,a5,8000e5a0 <_sbrk_r+0x34>
8000e590:	c4418793          	addi	a5,gp,-956 # 80003484 <errno>
8000e594:	0007a783          	lw	a5,0(a5)
8000e598:	00078463          	beqz	a5,8000e5a0 <_sbrk_r+0x34>
8000e59c:	00f42023          	sw	a5,0(s0)
8000e5a0:	00c12083          	lw	ra,12(sp)
8000e5a4:	00812403          	lw	s0,8(sp)
8000e5a8:	01010113          	addi	sp,sp,16
8000e5ac:	00008067          	ret

Disassembly of section .text._snprintf_r:

8000e5b0 <_sniprintf_r>:
8000e5b0:	f7010113          	addi	sp,sp,-144
8000e5b4:	06112e23          	sw	ra,124(sp)
8000e5b8:	06812c23          	sw	s0,120(sp)
8000e5bc:	06912a23          	sw	s1,116(sp)
8000e5c0:	07212823          	sw	s2,112(sp)
8000e5c4:	08e12023          	sw	a4,128(sp)
8000e5c8:	08f12223          	sw	a5,132(sp)
8000e5cc:	09012423          	sw	a6,136(sp)
8000e5d0:	09112623          	sw	a7,140(sp)
8000e5d4:	02065463          	bgez	a2,8000e5fc <_sniprintf_r+0x4c>
8000e5d8:	08b00793          	li	a5,139
8000e5dc:	00f52023          	sw	a5,0(a0)
8000e5e0:	fff00513          	li	a0,-1
8000e5e4:	07c12083          	lw	ra,124(sp)
8000e5e8:	07812403          	lw	s0,120(sp)
8000e5ec:	07412483          	lw	s1,116(sp)
8000e5f0:	07012903          	lw	s2,112(sp)
8000e5f4:	09010113          	addi	sp,sp,144
8000e5f8:	00008067          	ret
8000e5fc:	20800793          	li	a5,520
8000e600:	00f11a23          	sh	a5,20(sp)
8000e604:	00b12423          	sw	a1,8(sp)
8000e608:	00b12c23          	sw	a1,24(sp)
8000e60c:	00060413          	mv	s0,a2
8000e610:	00000793          	li	a5,0
8000e614:	00060463          	beqz	a2,8000e61c <_sniprintf_r+0x6c>
8000e618:	fff60793          	addi	a5,a2,-1
8000e61c:	fff00913          	li	s2,-1
8000e620:	00068613          	mv	a2,a3
8000e624:	00810593          	addi	a1,sp,8
8000e628:	08010693          	addi	a3,sp,128
8000e62c:	00050493          	mv	s1,a0
8000e630:	00f12823          	sw	a5,16(sp)
8000e634:	00f12e23          	sw	a5,28(sp)
8000e638:	01211b23          	sh	s2,22(sp)
8000e63c:	00d12223          	sw	a3,4(sp)
8000e640:	189000ef          	jal	ra,8000efc8 <_svfiprintf_r>
8000e644:	01255663          	bge	a0,s2,8000e650 <_sniprintf_r+0xa0>
8000e648:	08b00793          	li	a5,139
8000e64c:	00f4a023          	sw	a5,0(s1)
8000e650:	f8040ae3          	beqz	s0,8000e5e4 <_sniprintf_r+0x34>
8000e654:	00812783          	lw	a5,8(sp)
8000e658:	00078023          	sb	zero,0(a5)
8000e65c:	f89ff06f          	j	8000e5e4 <_sniprintf_r+0x34>

Disassembly of section .text.snprintf:

8000e660 <sniprintf>:
8000e660:	f6010113          	addi	sp,sp,-160
8000e664:	08f12a23          	sw	a5,148(sp)
8000e668:	06912a23          	sw	s1,116(sp)
8000e66c:	08d12623          	sw	a3,140(sp)
8000e670:	08e12823          	sw	a4,144(sp)
8000e674:	09012c23          	sw	a6,152(sp)
8000e678:	09112e23          	sw	a7,156(sp)
8000e67c:	80c18793          	addi	a5,gp,-2036 # 8000304c <_impure_ptr>
8000e680:	06112e23          	sw	ra,124(sp)
8000e684:	06812c23          	sw	s0,120(sp)
8000e688:	07212823          	sw	s2,112(sp)
8000e68c:	0007a483          	lw	s1,0(a5)
8000e690:	0205d463          	bgez	a1,8000e6b8 <sniprintf+0x58>
8000e694:	08b00793          	li	a5,139
8000e698:	00f4a023          	sw	a5,0(s1)
8000e69c:	fff00513          	li	a0,-1
8000e6a0:	07c12083          	lw	ra,124(sp)
8000e6a4:	07812403          	lw	s0,120(sp)
8000e6a8:	07412483          	lw	s1,116(sp)
8000e6ac:	07012903          	lw	s2,112(sp)
8000e6b0:	0a010113          	addi	sp,sp,160
8000e6b4:	00008067          	ret
8000e6b8:	20800793          	li	a5,520
8000e6bc:	00f11a23          	sh	a5,20(sp)
8000e6c0:	00a12423          	sw	a0,8(sp)
8000e6c4:	00a12c23          	sw	a0,24(sp)
8000e6c8:	00000793          	li	a5,0
8000e6cc:	00058463          	beqz	a1,8000e6d4 <sniprintf+0x74>
8000e6d0:	fff58793          	addi	a5,a1,-1
8000e6d4:	fff00913          	li	s2,-1
8000e6d8:	00058413          	mv	s0,a1
8000e6dc:	08c10693          	addi	a3,sp,140
8000e6e0:	00810593          	addi	a1,sp,8
8000e6e4:	00048513          	mv	a0,s1
8000e6e8:	00f12823          	sw	a5,16(sp)
8000e6ec:	00f12e23          	sw	a5,28(sp)
8000e6f0:	01211b23          	sh	s2,22(sp)
8000e6f4:	00d12223          	sw	a3,4(sp)
8000e6f8:	0d1000ef          	jal	ra,8000efc8 <_svfiprintf_r>
8000e6fc:	01255663          	bge	a0,s2,8000e708 <sniprintf+0xa8>
8000e700:	08b00793          	li	a5,139
8000e704:	00f4a023          	sw	a5,0(s1)
8000e708:	f8040ce3          	beqz	s0,8000e6a0 <sniprintf+0x40>
8000e70c:	00812783          	lw	a5,8(sp)
8000e710:	00078023          	sb	zero,0(a5)
8000e714:	f8dff06f          	j	8000e6a0 <sniprintf+0x40>

Disassembly of section .text._sprintf_r:

8000e718 <_siprintf_r>:
8000e718:	f6010113          	addi	sp,sp,-160
8000e71c:	08f12a23          	sw	a5,148(sp)
8000e720:	800007b7          	lui	a5,0x80000
8000e724:	fff7c793          	not	a5,a5
8000e728:	00f12e23          	sw	a5,28(sp)
8000e72c:	00f12823          	sw	a5,16(sp)
8000e730:	ffff07b7          	lui	a5,0xffff0
8000e734:	08d12623          	sw	a3,140(sp)
8000e738:	00b12423          	sw	a1,8(sp)
8000e73c:	00b12c23          	sw	a1,24(sp)
8000e740:	20878793          	addi	a5,a5,520 # ffff0208 <_heap_end+0x7ffde208>
8000e744:	08c10693          	addi	a3,sp,140
8000e748:	00810593          	addi	a1,sp,8
8000e74c:	06112e23          	sw	ra,124(sp)
8000e750:	00f12a23          	sw	a5,20(sp)
8000e754:	08e12823          	sw	a4,144(sp)
8000e758:	09012c23          	sw	a6,152(sp)
8000e75c:	09112e23          	sw	a7,156(sp)
8000e760:	00d12223          	sw	a3,4(sp)
8000e764:	065000ef          	jal	ra,8000efc8 <_svfiprintf_r>
8000e768:	00812783          	lw	a5,8(sp)
8000e76c:	00078023          	sb	zero,0(a5)
8000e770:	07c12083          	lw	ra,124(sp)
8000e774:	0a010113          	addi	sp,sp,160
8000e778:	00008067          	ret

Disassembly of section .text.sprintf:

8000e77c <siprintf>:
8000e77c:	f6010113          	addi	sp,sp,-160
8000e780:	08f12a23          	sw	a5,148(sp)
8000e784:	800007b7          	lui	a5,0x80000
8000e788:	fff7c793          	not	a5,a5
8000e78c:	00f12e23          	sw	a5,28(sp)
8000e790:	00f12823          	sw	a5,16(sp)
8000e794:	ffff07b7          	lui	a5,0xffff0
8000e798:	20878793          	addi	a5,a5,520 # ffff0208 <_heap_end+0x7ffde208>
8000e79c:	08c12423          	sw	a2,136(sp)
8000e7a0:	08d12623          	sw	a3,140(sp)
8000e7a4:	08e12823          	sw	a4,144(sp)
8000e7a8:	09012c23          	sw	a6,152(sp)
8000e7ac:	09112e23          	sw	a7,156(sp)
8000e7b0:	00f12a23          	sw	a5,20(sp)
8000e7b4:	80c18793          	addi	a5,gp,-2036 # 8000304c <_impure_ptr>
8000e7b8:	00a12423          	sw	a0,8(sp)
8000e7bc:	00a12c23          	sw	a0,24(sp)
8000e7c0:	0007a503          	lw	a0,0(a5)
8000e7c4:	08810693          	addi	a3,sp,136
8000e7c8:	00058613          	mv	a2,a1
8000e7cc:	00810593          	addi	a1,sp,8
8000e7d0:	06112e23          	sw	ra,124(sp)
8000e7d4:	00d12223          	sw	a3,4(sp)
8000e7d8:	7f0000ef          	jal	ra,8000efc8 <_svfiprintf_r>
8000e7dc:	00812783          	lw	a5,8(sp)
8000e7e0:	00078023          	sb	zero,0(a5)
8000e7e4:	07c12083          	lw	ra,124(sp)
8000e7e8:	0a010113          	addi	sp,sp,160
8000e7ec:	00008067          	ret

Disassembly of section .text.__sread:

8000e7f0 <__sread>:
8000e7f0:	ff010113          	addi	sp,sp,-16
8000e7f4:	00812423          	sw	s0,8(sp)
8000e7f8:	00058413          	mv	s0,a1
8000e7fc:	00e59583          	lh	a1,14(a1)
8000e800:	00112623          	sw	ra,12(sp)
8000e804:	5d4010ef          	jal	ra,8000fdd8 <_read_r>
8000e808:	02054063          	bltz	a0,8000e828 <__sread+0x38>
8000e80c:	05442783          	lw	a5,84(s0)
8000e810:	00a787b3          	add	a5,a5,a0
8000e814:	04f42a23          	sw	a5,84(s0)
8000e818:	00c12083          	lw	ra,12(sp)
8000e81c:	00812403          	lw	s0,8(sp)
8000e820:	01010113          	addi	sp,sp,16
8000e824:	00008067          	ret
8000e828:	00c45783          	lhu	a5,12(s0)
8000e82c:	fffff737          	lui	a4,0xfffff
8000e830:	fff70713          	addi	a4,a4,-1 # ffffefff <_heap_end+0x7ffecfff>
8000e834:	00e7f7b3          	and	a5,a5,a4
8000e838:	00f41623          	sh	a5,12(s0)
8000e83c:	fddff06f          	j	8000e818 <__sread+0x28>

Disassembly of section .text.__seofread:

8000e840 <__seofread>:
8000e840:	00000513          	li	a0,0
8000e844:	00008067          	ret

Disassembly of section .text.__swrite:

8000e848 <__swrite>:
8000e848:	00c5d783          	lhu	a5,12(a1)
8000e84c:	fe010113          	addi	sp,sp,-32
8000e850:	00812c23          	sw	s0,24(sp)
8000e854:	00912a23          	sw	s1,20(sp)
8000e858:	01212823          	sw	s2,16(sp)
8000e85c:	01312623          	sw	s3,12(sp)
8000e860:	00112e23          	sw	ra,28(sp)
8000e864:	1007f793          	andi	a5,a5,256
8000e868:	00050493          	mv	s1,a0
8000e86c:	00058413          	mv	s0,a1
8000e870:	00060913          	mv	s2,a2
8000e874:	00068993          	mv	s3,a3
8000e878:	00078a63          	beqz	a5,8000e88c <__swrite+0x44>
8000e87c:	00e59583          	lh	a1,14(a1)
8000e880:	00200693          	li	a3,2
8000e884:	00000613          	li	a2,0
8000e888:	3cc000ef          	jal	ra,8000ec54 <_lseek_r>
8000e88c:	00c45783          	lhu	a5,12(s0)
8000e890:	fffff737          	lui	a4,0xfffff
8000e894:	fff70713          	addi	a4,a4,-1 # ffffefff <_heap_end+0x7ffecfff>
8000e898:	00e7f7b3          	and	a5,a5,a4
8000e89c:	00f41623          	sh	a5,12(s0)
8000e8a0:	00e41583          	lh	a1,14(s0)
8000e8a4:	01812403          	lw	s0,24(sp)
8000e8a8:	01c12083          	lw	ra,28(sp)
8000e8ac:	00098693          	mv	a3,s3
8000e8b0:	00090613          	mv	a2,s2
8000e8b4:	00c12983          	lw	s3,12(sp)
8000e8b8:	01012903          	lw	s2,16(sp)
8000e8bc:	00048513          	mv	a0,s1
8000e8c0:	01412483          	lw	s1,20(sp)
8000e8c4:	02010113          	addi	sp,sp,32
8000e8c8:	2fc0006f          	j	8000ebc4 <_write_r>

Disassembly of section .text.__sseek:

8000e8cc <__sseek>:
8000e8cc:	ff010113          	addi	sp,sp,-16
8000e8d0:	00812423          	sw	s0,8(sp)
8000e8d4:	00058413          	mv	s0,a1
8000e8d8:	00e59583          	lh	a1,14(a1)
8000e8dc:	00112623          	sw	ra,12(sp)
8000e8e0:	374000ef          	jal	ra,8000ec54 <_lseek_r>
8000e8e4:	fff00793          	li	a5,-1
8000e8e8:	00c45703          	lhu	a4,12(s0)
8000e8ec:	02f51263          	bne	a0,a5,8000e910 <__sseek+0x44>
8000e8f0:	fffff7b7          	lui	a5,0xfffff
8000e8f4:	fff78793          	addi	a5,a5,-1 # ffffefff <_heap_end+0x7ffecfff>
8000e8f8:	00e7f7b3          	and	a5,a5,a4
8000e8fc:	00f41623          	sh	a5,12(s0)
8000e900:	00c12083          	lw	ra,12(sp)
8000e904:	00812403          	lw	s0,8(sp)
8000e908:	01010113          	addi	sp,sp,16
8000e90c:	00008067          	ret
8000e910:	000017b7          	lui	a5,0x1
8000e914:	00f767b3          	or	a5,a4,a5
8000e918:	00f41623          	sh	a5,12(s0)
8000e91c:	04a42a23          	sw	a0,84(s0)
8000e920:	fe1ff06f          	j	8000e900 <__sseek+0x34>

Disassembly of section .text.__sclose:

8000e924 <__sclose>:
8000e924:	00e59583          	lh	a1,14(a1)
8000e928:	2e80006f          	j	8000ec10 <_close_r>

Disassembly of section .text.strlen:

8000e92c <strlen>:
8000e92c:	00050793          	mv	a5,a0
8000e930:	00178793          	addi	a5,a5,1 # 1001 <_stack_size+0x801>
8000e934:	fff7c703          	lbu	a4,-1(a5)
8000e938:	fe071ce3          	bnez	a4,8000e930 <strlen+0x4>
8000e93c:	40a78533          	sub	a0,a5,a0
8000e940:	fff50513          	addi	a0,a0,-1
8000e944:	00008067          	ret

Disassembly of section .text.strncmp:

8000e948 <strncmp>:
8000e948:	02060a63          	beqz	a2,8000e97c <strncmp+0x34>
8000e94c:	fff60613          	addi	a2,a2,-1
8000e950:	00000713          	li	a4,0
8000e954:	00e507b3          	add	a5,a0,a4
8000e958:	00e586b3          	add	a3,a1,a4
8000e95c:	0007c783          	lbu	a5,0(a5)
8000e960:	0006c683          	lbu	a3,0(a3)
8000e964:	00d79863          	bne	a5,a3,8000e974 <strncmp+0x2c>
8000e968:	00c70663          	beq	a4,a2,8000e974 <strncmp+0x2c>
8000e96c:	00170713          	addi	a4,a4,1
8000e970:	fe0792e3          	bnez	a5,8000e954 <strncmp+0xc>
8000e974:	40d78533          	sub	a0,a5,a3
8000e978:	00008067          	ret
8000e97c:	00000513          	li	a0,0
8000e980:	00008067          	ret

Disassembly of section .text._strtol_l.isra.0:

8000e984 <_strtol_l.isra.0>:
8000e984:	fc010113          	addi	sp,sp,-64
8000e988:	03212823          	sw	s2,48(sp)
8000e98c:	03512223          	sw	s5,36(sp)
8000e990:	03612023          	sw	s6,32(sp)
8000e994:	01812c23          	sw	s8,24(sp)
8000e998:	00068913          	mv	s2,a3
8000e99c:	02112e23          	sw	ra,60(sp)
8000e9a0:	02812c23          	sw	s0,56(sp)
8000e9a4:	02912a23          	sw	s1,52(sp)
8000e9a8:	03312623          	sw	s3,44(sp)
8000e9ac:	03412423          	sw	s4,40(sp)
8000e9b0:	01712e23          	sw	s7,28(sp)
8000e9b4:	01912a23          	sw	s9,20(sp)
8000e9b8:	01a12823          	sw	s10,16(sp)
8000e9bc:	01b12623          	sw	s11,12(sp)
8000e9c0:	00050a93          	mv	s5,a0
8000e9c4:	00058b13          	mv	s6,a1
8000e9c8:	00060c13          	mv	s8,a2
8000e9cc:	00058793          	mv	a5,a1
8000e9d0:	ffff4697          	auipc	a3,0xffff4
8000e9d4:	34168693          	addi	a3,a3,833 # 80002d11 <_ctype_+0x1>
8000e9d8:	00178493          	addi	s1,a5,1
8000e9dc:	fff4c403          	lbu	s0,-1(s1)
8000e9e0:	00d40733          	add	a4,s0,a3
8000e9e4:	00074703          	lbu	a4,0(a4)
8000e9e8:	00877713          	andi	a4,a4,8
8000e9ec:	0c071863          	bnez	a4,8000eabc <_strtol_l.isra.0+0x138>
8000e9f0:	02d00713          	li	a4,45
8000e9f4:	0ce41863          	bne	s0,a4,8000eac4 <_strtol_l.isra.0+0x140>
8000e9f8:	0004c403          	lbu	s0,0(s1)
8000e9fc:	00100a13          	li	s4,1
8000ea00:	00278493          	addi	s1,a5,2
8000ea04:	16090e63          	beqz	s2,8000eb80 <_strtol_l.isra.0+0x1fc>
8000ea08:	01000793          	li	a5,16
8000ea0c:	02f91463          	bne	s2,a5,8000ea34 <_strtol_l.isra.0+0xb0>
8000ea10:	03000793          	li	a5,48
8000ea14:	02f41063          	bne	s0,a5,8000ea34 <_strtol_l.isra.0+0xb0>
8000ea18:	0004c783          	lbu	a5,0(s1)
8000ea1c:	05800713          	li	a4,88
8000ea20:	0df7f793          	andi	a5,a5,223
8000ea24:	14e79663          	bne	a5,a4,8000eb70 <_strtol_l.isra.0+0x1ec>
8000ea28:	0014c403          	lbu	s0,1(s1)
8000ea2c:	01000913          	li	s2,16
8000ea30:	00248493          	addi	s1,s1,2
8000ea34:	800009b7          	lui	s3,0x80000
8000ea38:	000a1463          	bnez	s4,8000ea40 <_strtol_l.isra.0+0xbc>
8000ea3c:	fff9c993          	not	s3,s3
8000ea40:	00090593          	mv	a1,s2
8000ea44:	00098513          	mv	a0,s3
8000ea48:	98dfe0ef          	jal	ra,8000d3d4 <__umodsi3>
8000ea4c:	00050b93          	mv	s7,a0
8000ea50:	00090593          	mv	a1,s2
8000ea54:	00098513          	mv	a0,s3
8000ea58:	935fe0ef          	jal	ra,8000d38c <__udivsi3>
8000ea5c:	00050c93          	mv	s9,a0
8000ea60:	00000713          	li	a4,0
8000ea64:	00000513          	li	a0,0
8000ea68:	00900d93          	li	s11,9
8000ea6c:	01900d13          	li	s10,25
8000ea70:	fff00693          	li	a3,-1
8000ea74:	fd040793          	addi	a5,s0,-48
8000ea78:	06fde463          	bltu	s11,a5,8000eae0 <_strtol_l.isra.0+0x15c>
8000ea7c:	00078413          	mv	s0,a5
8000ea80:	09245063          	bge	s0,s2,8000eb00 <_strtol_l.isra.0+0x17c>
8000ea84:	02d70663          	beq	a4,a3,8000eab0 <_strtol_l.isra.0+0x12c>
8000ea88:	fff00713          	li	a4,-1
8000ea8c:	02ace263          	bltu	s9,a0,8000eab0 <_strtol_l.isra.0+0x12c>
8000ea90:	00ac9463          	bne	s9,a0,8000ea98 <_strtol_l.isra.0+0x114>
8000ea94:	008bce63          	blt	s7,s0,8000eab0 <_strtol_l.isra.0+0x12c>
8000ea98:	00050593          	mv	a1,a0
8000ea9c:	00090513          	mv	a0,s2
8000eaa0:	8c1fe0ef          	jal	ra,8000d360 <__mulsi3>
8000eaa4:	00a40533          	add	a0,s0,a0
8000eaa8:	00100713          	li	a4,1
8000eaac:	fff00693          	li	a3,-1
8000eab0:	00148493          	addi	s1,s1,1
8000eab4:	fff4c403          	lbu	s0,-1(s1)
8000eab8:	fbdff06f          	j	8000ea74 <_strtol_l.isra.0+0xf0>
8000eabc:	00048793          	mv	a5,s1
8000eac0:	f19ff06f          	j	8000e9d8 <_strtol_l.isra.0+0x54>
8000eac4:	02b00713          	li	a4,43
8000eac8:	00e40663          	beq	s0,a4,8000ead4 <_strtol_l.isra.0+0x150>
8000eacc:	00000a13          	li	s4,0
8000ead0:	f35ff06f          	j	8000ea04 <_strtol_l.isra.0+0x80>
8000ead4:	0004c403          	lbu	s0,0(s1)
8000ead8:	00278493          	addi	s1,a5,2
8000eadc:	ff1ff06f          	j	8000eacc <_strtol_l.isra.0+0x148>
8000eae0:	fbf40793          	addi	a5,s0,-65
8000eae4:	00fd6663          	bltu	s10,a5,8000eaf0 <_strtol_l.isra.0+0x16c>
8000eae8:	fc940413          	addi	s0,s0,-55
8000eaec:	f95ff06f          	j	8000ea80 <_strtol_l.isra.0+0xfc>
8000eaf0:	f9f40793          	addi	a5,s0,-97
8000eaf4:	00fd6663          	bltu	s10,a5,8000eb00 <_strtol_l.isra.0+0x17c>
8000eaf8:	fa940413          	addi	s0,s0,-87
8000eafc:	f85ff06f          	j	8000ea80 <_strtol_l.isra.0+0xfc>
8000eb00:	fff00793          	li	a5,-1
8000eb04:	04f71863          	bne	a4,a5,8000eb54 <_strtol_l.isra.0+0x1d0>
8000eb08:	02200793          	li	a5,34
8000eb0c:	00faa023          	sw	a5,0(s5)
8000eb10:	00098513          	mv	a0,s3
8000eb14:	040c1863          	bnez	s8,8000eb64 <_strtol_l.isra.0+0x1e0>
8000eb18:	03c12083          	lw	ra,60(sp)
8000eb1c:	03812403          	lw	s0,56(sp)
8000eb20:	03412483          	lw	s1,52(sp)
8000eb24:	03012903          	lw	s2,48(sp)
8000eb28:	02c12983          	lw	s3,44(sp)
8000eb2c:	02812a03          	lw	s4,40(sp)
8000eb30:	02412a83          	lw	s5,36(sp)
8000eb34:	02012b03          	lw	s6,32(sp)
8000eb38:	01c12b83          	lw	s7,28(sp)
8000eb3c:	01812c03          	lw	s8,24(sp)
8000eb40:	01412c83          	lw	s9,20(sp)
8000eb44:	01012d03          	lw	s10,16(sp)
8000eb48:	00c12d83          	lw	s11,12(sp)
8000eb4c:	04010113          	addi	sp,sp,64
8000eb50:	00008067          	ret
8000eb54:	000a0463          	beqz	s4,8000eb5c <_strtol_l.isra.0+0x1d8>
8000eb58:	40a00533          	neg	a0,a0
8000eb5c:	fa0c0ee3          	beqz	s8,8000eb18 <_strtol_l.isra.0+0x194>
8000eb60:	00070463          	beqz	a4,8000eb68 <_strtol_l.isra.0+0x1e4>
8000eb64:	fff48b13          	addi	s6,s1,-1
8000eb68:	016c2023          	sw	s6,0(s8)
8000eb6c:	fadff06f          	j	8000eb18 <_strtol_l.isra.0+0x194>
8000eb70:	03000413          	li	s0,48
8000eb74:	ec0910e3          	bnez	s2,8000ea34 <_strtol_l.isra.0+0xb0>
8000eb78:	00800913          	li	s2,8
8000eb7c:	eb9ff06f          	j	8000ea34 <_strtol_l.isra.0+0xb0>
8000eb80:	03000793          	li	a5,48
8000eb84:	e8f40ae3          	beq	s0,a5,8000ea18 <_strtol_l.isra.0+0x94>
8000eb88:	00a00913          	li	s2,10
8000eb8c:	ea9ff06f          	j	8000ea34 <_strtol_l.isra.0+0xb0>

Disassembly of section .text._strtol_r:

8000eb90 <_strtol_r>:
8000eb90:	df5ff06f          	j	8000e984 <_strtol_l.isra.0>

Disassembly of section .text.strtol_l:

8000eb94 <strtol_l>:
8000eb94:	80c18793          	addi	a5,gp,-2036 # 8000304c <_impure_ptr>
8000eb98:	00060693          	mv	a3,a2
8000eb9c:	00058613          	mv	a2,a1
8000eba0:	00050593          	mv	a1,a0
8000eba4:	0007a503          	lw	a0,0(a5)
8000eba8:	dddff06f          	j	8000e984 <_strtol_l.isra.0>

Disassembly of section .text.strtol:

8000ebac <strtol>:
8000ebac:	80c18793          	addi	a5,gp,-2036 # 8000304c <_impure_ptr>
8000ebb0:	00060693          	mv	a3,a2
8000ebb4:	00058613          	mv	a2,a1
8000ebb8:	00050593          	mv	a1,a0
8000ebbc:	0007a503          	lw	a0,0(a5)
8000ebc0:	dc5ff06f          	j	8000e984 <_strtol_l.isra.0>

Disassembly of section .text._write_r:

8000ebc4 <_write_r>:
8000ebc4:	ff010113          	addi	sp,sp,-16
8000ebc8:	00812423          	sw	s0,8(sp)
8000ebcc:	00050413          	mv	s0,a0
8000ebd0:	00058513          	mv	a0,a1
8000ebd4:	00060593          	mv	a1,a2
8000ebd8:	00068613          	mv	a2,a3
8000ebdc:	c401a223          	sw	zero,-956(gp) # 80003484 <errno>
8000ebe0:	00112623          	sw	ra,12(sp)
8000ebe4:	920f70ef          	jal	ra,80005d04 <_write>
8000ebe8:	fff00793          	li	a5,-1
8000ebec:	00f51a63          	bne	a0,a5,8000ec00 <_write_r+0x3c>
8000ebf0:	c4418793          	addi	a5,gp,-956 # 80003484 <errno>
8000ebf4:	0007a783          	lw	a5,0(a5)
8000ebf8:	00078463          	beqz	a5,8000ec00 <_write_r+0x3c>
8000ebfc:	00f42023          	sw	a5,0(s0)
8000ec00:	00c12083          	lw	ra,12(sp)
8000ec04:	00812403          	lw	s0,8(sp)
8000ec08:	01010113          	addi	sp,sp,16
8000ec0c:	00008067          	ret

Disassembly of section .text._close_r:

8000ec10 <_close_r>:
8000ec10:	ff010113          	addi	sp,sp,-16
8000ec14:	00812423          	sw	s0,8(sp)
8000ec18:	00050413          	mv	s0,a0
8000ec1c:	00058513          	mv	a0,a1
8000ec20:	c401a223          	sw	zero,-956(gp) # 80003484 <errno>
8000ec24:	00112623          	sw	ra,12(sp)
8000ec28:	918f70ef          	jal	ra,80005d40 <_close>
8000ec2c:	fff00793          	li	a5,-1
8000ec30:	00f51a63          	bne	a0,a5,8000ec44 <_close_r+0x34>
8000ec34:	c4418793          	addi	a5,gp,-956 # 80003484 <errno>
8000ec38:	0007a783          	lw	a5,0(a5)
8000ec3c:	00078463          	beqz	a5,8000ec44 <_close_r+0x34>
8000ec40:	00f42023          	sw	a5,0(s0)
8000ec44:	00c12083          	lw	ra,12(sp)
8000ec48:	00812403          	lw	s0,8(sp)
8000ec4c:	01010113          	addi	sp,sp,16
8000ec50:	00008067          	ret

Disassembly of section .text._lseek_r:

8000ec54 <_lseek_r>:
8000ec54:	ff010113          	addi	sp,sp,-16
8000ec58:	00812423          	sw	s0,8(sp)
8000ec5c:	00050413          	mv	s0,a0
8000ec60:	00058513          	mv	a0,a1
8000ec64:	00060593          	mv	a1,a2
8000ec68:	00068613          	mv	a2,a3
8000ec6c:	c401a223          	sw	zero,-956(gp) # 80003484 <errno>
8000ec70:	00112623          	sw	ra,12(sp)
8000ec74:	8d4f70ef          	jal	ra,80005d48 <_lseek>
8000ec78:	fff00793          	li	a5,-1
8000ec7c:	00f51a63          	bne	a0,a5,8000ec90 <_lseek_r+0x3c>
8000ec80:	c4418793          	addi	a5,gp,-956 # 80003484 <errno>
8000ec84:	0007a783          	lw	a5,0(a5)
8000ec88:	00078463          	beqz	a5,8000ec90 <_lseek_r+0x3c>
8000ec8c:	00f42023          	sw	a5,0(s0)
8000ec90:	00c12083          	lw	ra,12(sp)
8000ec94:	00812403          	lw	s0,8(sp)
8000ec98:	01010113          	addi	sp,sp,16
8000ec9c:	00008067          	ret

Disassembly of section .text.__ssputs_r:

8000eca0 <__ssputs_r>:
8000eca0:	fe010113          	addi	sp,sp,-32
8000eca4:	01212823          	sw	s2,16(sp)
8000eca8:	0085a903          	lw	s2,8(a1)
8000ecac:	00812c23          	sw	s0,24(sp)
8000ecb0:	01412423          	sw	s4,8(sp)
8000ecb4:	01612023          	sw	s6,0(sp)
8000ecb8:	00112e23          	sw	ra,28(sp)
8000ecbc:	00912a23          	sw	s1,20(sp)
8000ecc0:	01312623          	sw	s3,12(sp)
8000ecc4:	01512223          	sw	s5,4(sp)
8000ecc8:	00058413          	mv	s0,a1
8000eccc:	00060b13          	mv	s6,a2
8000ecd0:	00068a13          	mv	s4,a3
8000ecd4:	0f26e063          	bltu	a3,s2,8000edb4 <__ssputs_r+0x114>
8000ecd8:	00c5d783          	lhu	a5,12(a1)
8000ecdc:	4807f713          	andi	a4,a5,1152
8000ece0:	0c070863          	beqz	a4,8000edb0 <__ssputs_r+0x110>
8000ece4:	00042483          	lw	s1,0(s0)
8000ece8:	01442703          	lw	a4,20(s0)
8000ecec:	0105a583          	lw	a1,16(a1)
8000ecf0:	00050a93          	mv	s5,a0
8000ecf4:	40b489b3          	sub	s3,s1,a1
8000ecf8:	00171493          	slli	s1,a4,0x1
8000ecfc:	00e48733          	add	a4,s1,a4
8000ed00:	01f75493          	srli	s1,a4,0x1f
8000ed04:	00e484b3          	add	s1,s1,a4
8000ed08:	00168713          	addi	a4,a3,1
8000ed0c:	4014d493          	srai	s1,s1,0x1
8000ed10:	01370733          	add	a4,a4,s3
8000ed14:	00e4f463          	bgeu	s1,a4,8000ed1c <__ssputs_r+0x7c>
8000ed18:	00070493          	mv	s1,a4
8000ed1c:	4007f793          	andi	a5,a5,1024
8000ed20:	0c078463          	beqz	a5,8000ede8 <__ssputs_r+0x148>
8000ed24:	00048593          	mv	a1,s1
8000ed28:	000a8513          	mv	a0,s5
8000ed2c:	e14ff0ef          	jal	ra,8000e340 <_malloc_r>
8000ed30:	00050913          	mv	s2,a0
8000ed34:	04051263          	bnez	a0,8000ed78 <__ssputs_r+0xd8>
8000ed38:	00c00793          	li	a5,12
8000ed3c:	00faa023          	sw	a5,0(s5)
8000ed40:	00c45783          	lhu	a5,12(s0)
8000ed44:	fff00513          	li	a0,-1
8000ed48:	0407e793          	ori	a5,a5,64
8000ed4c:	00f41623          	sh	a5,12(s0)
8000ed50:	01c12083          	lw	ra,28(sp)
8000ed54:	01812403          	lw	s0,24(sp)
8000ed58:	01412483          	lw	s1,20(sp)
8000ed5c:	01012903          	lw	s2,16(sp)
8000ed60:	00c12983          	lw	s3,12(sp)
8000ed64:	00812a03          	lw	s4,8(sp)
8000ed68:	00412a83          	lw	s5,4(sp)
8000ed6c:	00012b03          	lw	s6,0(sp)
8000ed70:	02010113          	addi	sp,sp,32
8000ed74:	00008067          	ret
8000ed78:	01042583          	lw	a1,16(s0)
8000ed7c:	00098613          	mv	a2,s3
8000ed80:	b34ff0ef          	jal	ra,8000e0b4 <memcpy>
8000ed84:	00c45783          	lhu	a5,12(s0)
8000ed88:	b7f7f793          	andi	a5,a5,-1153
8000ed8c:	0807e793          	ori	a5,a5,128
8000ed90:	00f41623          	sh	a5,12(s0)
8000ed94:	01242823          	sw	s2,16(s0)
8000ed98:	00942a23          	sw	s1,20(s0)
8000ed9c:	01390933          	add	s2,s2,s3
8000eda0:	413484b3          	sub	s1,s1,s3
8000eda4:	01242023          	sw	s2,0(s0)
8000eda8:	00942423          	sw	s1,8(s0)
8000edac:	000a0913          	mv	s2,s4
8000edb0:	012a7463          	bgeu	s4,s2,8000edb8 <__ssputs_r+0x118>
8000edb4:	000a0913          	mv	s2,s4
8000edb8:	00042503          	lw	a0,0(s0)
8000edbc:	00090613          	mv	a2,s2
8000edc0:	000b0593          	mv	a1,s6
8000edc4:	bc8ff0ef          	jal	ra,8000e18c <memmove>
8000edc8:	00842783          	lw	a5,8(s0)
8000edcc:	00000513          	li	a0,0
8000edd0:	412787b3          	sub	a5,a5,s2
8000edd4:	00f42423          	sw	a5,8(s0)
8000edd8:	00042783          	lw	a5,0(s0)
8000eddc:	01278933          	add	s2,a5,s2
8000ede0:	01242023          	sw	s2,0(s0)
8000ede4:	f6dff06f          	j	8000ed50 <__ssputs_r+0xb0>
8000ede8:	00048613          	mv	a2,s1
8000edec:	000a8513          	mv	a0,s5
8000edf0:	2a9010ef          	jal	ra,80010898 <_realloc_r>
8000edf4:	00050913          	mv	s2,a0
8000edf8:	f8051ee3          	bnez	a0,8000ed94 <__ssputs_r+0xf4>
8000edfc:	01042583          	lw	a1,16(s0)
8000ee00:	000a8513          	mv	a0,s5
8000ee04:	c38ff0ef          	jal	ra,8000e23c <_free_r>
8000ee08:	f31ff06f          	j	8000ed38 <__ssputs_r+0x98>

Disassembly of section .text.__ssprint_r:

8000ee0c <__ssprint_r>:
8000ee0c:	00862783          	lw	a5,8(a2)
8000ee10:	fd010113          	addi	sp,sp,-48
8000ee14:	01312e23          	sw	s3,28(sp)
8000ee18:	02112623          	sw	ra,44(sp)
8000ee1c:	02812423          	sw	s0,40(sp)
8000ee20:	02912223          	sw	s1,36(sp)
8000ee24:	03212023          	sw	s2,32(sp)
8000ee28:	01412c23          	sw	s4,24(sp)
8000ee2c:	01512a23          	sw	s5,20(sp)
8000ee30:	01612823          	sw	s6,16(sp)
8000ee34:	01712623          	sw	s7,12(sp)
8000ee38:	01812423          	sw	s8,8(sp)
8000ee3c:	00060993          	mv	s3,a2
8000ee40:	12078663          	beqz	a5,8000ef6c <__ssprint_r+0x160>
8000ee44:	00062b03          	lw	s6,0(a2)
8000ee48:	00050a93          	mv	s5,a0
8000ee4c:	00058413          	mv	s0,a1
8000ee50:	00000b93          	li	s7,0
8000ee54:	00000913          	li	s2,0
8000ee58:	08090663          	beqz	s2,8000eee4 <__ssprint_r+0xd8>
8000ee5c:	00842a03          	lw	s4,8(s0)
8000ee60:	0d496663          	bltu	s2,s4,8000ef2c <__ssprint_r+0x120>
8000ee64:	00c45783          	lhu	a5,12(s0)
8000ee68:	4807f713          	andi	a4,a5,1152
8000ee6c:	0c070063          	beqz	a4,8000ef2c <__ssprint_r+0x120>
8000ee70:	00042483          	lw	s1,0(s0)
8000ee74:	01442703          	lw	a4,20(s0)
8000ee78:	01042583          	lw	a1,16(s0)
8000ee7c:	40b48c33          	sub	s8,s1,a1
8000ee80:	00171493          	slli	s1,a4,0x1
8000ee84:	00e48733          	add	a4,s1,a4
8000ee88:	01f75493          	srli	s1,a4,0x1f
8000ee8c:	00e484b3          	add	s1,s1,a4
8000ee90:	001c0713          	addi	a4,s8,1
8000ee94:	4014d493          	srai	s1,s1,0x1
8000ee98:	01270733          	add	a4,a4,s2
8000ee9c:	00e4f463          	bgeu	s1,a4,8000eea4 <__ssprint_r+0x98>
8000eea0:	00070493          	mv	s1,a4
8000eea4:	4007f793          	andi	a5,a5,1024
8000eea8:	0e078e63          	beqz	a5,8000efa4 <__ssprint_r+0x198>
8000eeac:	00048593          	mv	a1,s1
8000eeb0:	000a8513          	mv	a0,s5
8000eeb4:	c8cff0ef          	jal	ra,8000e340 <_malloc_r>
8000eeb8:	00050a13          	mv	s4,a0
8000eebc:	02051c63          	bnez	a0,8000eef4 <__ssprint_r+0xe8>
8000eec0:	00c00793          	li	a5,12
8000eec4:	00faa023          	sw	a5,0(s5)
8000eec8:	00c45783          	lhu	a5,12(s0)
8000eecc:	fff00513          	li	a0,-1
8000eed0:	0407e793          	ori	a5,a5,64
8000eed4:	00f41623          	sh	a5,12(s0)
8000eed8:	0009a423          	sw	zero,8(s3) # 80000008 <_heap_end+0xfffee008>
8000eedc:	0009a223          	sw	zero,4(s3)
8000eee0:	0940006f          	j	8000ef74 <__ssprint_r+0x168>
8000eee4:	000b2b83          	lw	s7,0(s6)
8000eee8:	004b2903          	lw	s2,4(s6)
8000eeec:	008b0b13          	addi	s6,s6,8
8000eef0:	f69ff06f          	j	8000ee58 <__ssprint_r+0x4c>
8000eef4:	01042583          	lw	a1,16(s0)
8000eef8:	000c0613          	mv	a2,s8
8000eefc:	9b8ff0ef          	jal	ra,8000e0b4 <memcpy>
8000ef00:	00c45783          	lhu	a5,12(s0)
8000ef04:	b7f7f793          	andi	a5,a5,-1153
8000ef08:	0807e793          	ori	a5,a5,128
8000ef0c:	00f41623          	sh	a5,12(s0)
8000ef10:	01442823          	sw	s4,16(s0)
8000ef14:	00942a23          	sw	s1,20(s0)
8000ef18:	018a0a33          	add	s4,s4,s8
8000ef1c:	418484b3          	sub	s1,s1,s8
8000ef20:	01442023          	sw	s4,0(s0)
8000ef24:	00942423          	sw	s1,8(s0)
8000ef28:	00090a13          	mv	s4,s2
8000ef2c:	01497463          	bgeu	s2,s4,8000ef34 <__ssprint_r+0x128>
8000ef30:	00090a13          	mv	s4,s2
8000ef34:	00042503          	lw	a0,0(s0)
8000ef38:	000a0613          	mv	a2,s4
8000ef3c:	000b8593          	mv	a1,s7
8000ef40:	a4cff0ef          	jal	ra,8000e18c <memmove>
8000ef44:	00842783          	lw	a5,8(s0)
8000ef48:	414787b3          	sub	a5,a5,s4
8000ef4c:	00f42423          	sw	a5,8(s0)
8000ef50:	00042783          	lw	a5,0(s0)
8000ef54:	01478a33          	add	s4,a5,s4
8000ef58:	0089a783          	lw	a5,8(s3)
8000ef5c:	01442023          	sw	s4,0(s0)
8000ef60:	41278933          	sub	s2,a5,s2
8000ef64:	0129a423          	sw	s2,8(s3)
8000ef68:	f6091ee3          	bnez	s2,8000eee4 <__ssprint_r+0xd8>
8000ef6c:	0009a223          	sw	zero,4(s3)
8000ef70:	00000513          	li	a0,0
8000ef74:	02c12083          	lw	ra,44(sp)
8000ef78:	02812403          	lw	s0,40(sp)
8000ef7c:	02412483          	lw	s1,36(sp)
8000ef80:	02012903          	lw	s2,32(sp)
8000ef84:	01c12983          	lw	s3,28(sp)
8000ef88:	01812a03          	lw	s4,24(sp)
8000ef8c:	01412a83          	lw	s5,20(sp)
8000ef90:	01012b03          	lw	s6,16(sp)
8000ef94:	00c12b83          	lw	s7,12(sp)
8000ef98:	00812c03          	lw	s8,8(sp)
8000ef9c:	03010113          	addi	sp,sp,48
8000efa0:	00008067          	ret
8000efa4:	00048613          	mv	a2,s1
8000efa8:	000a8513          	mv	a0,s5
8000efac:	0ed010ef          	jal	ra,80010898 <_realloc_r>
8000efb0:	00050a13          	mv	s4,a0
8000efb4:	f4051ee3          	bnez	a0,8000ef10 <__ssprint_r+0x104>
8000efb8:	01042583          	lw	a1,16(s0)
8000efbc:	000a8513          	mv	a0,s5
8000efc0:	a7cff0ef          	jal	ra,8000e23c <_free_r>
8000efc4:	efdff06f          	j	8000eec0 <__ssprint_r+0xb4>

Disassembly of section .text._svfprintf_r:

8000efc8 <_svfiprintf_r>:
8000efc8:	00c5d783          	lhu	a5,12(a1)
8000efcc:	f5010113          	addi	sp,sp,-176
8000efd0:	0a912223          	sw	s1,164(sp)
8000efd4:	0b212023          	sw	s2,160(sp)
8000efd8:	09312e23          	sw	s3,156(sp)
8000efdc:	0a112623          	sw	ra,172(sp)
8000efe0:	0a812423          	sw	s0,168(sp)
8000efe4:	09412c23          	sw	s4,152(sp)
8000efe8:	09512a23          	sw	s5,148(sp)
8000efec:	09612823          	sw	s6,144(sp)
8000eff0:	09712623          	sw	s7,140(sp)
8000eff4:	09812423          	sw	s8,136(sp)
8000eff8:	09912223          	sw	s9,132(sp)
8000effc:	0807f793          	andi	a5,a5,128
8000f000:	00050993          	mv	s3,a0
8000f004:	00058913          	mv	s2,a1
8000f008:	00060493          	mv	s1,a2
8000f00c:	06078863          	beqz	a5,8000f07c <_svfiprintf_r+0xb4>
8000f010:	0105a783          	lw	a5,16(a1)
8000f014:	06079463          	bnez	a5,8000f07c <_svfiprintf_r+0xb4>
8000f018:	04000593          	li	a1,64
8000f01c:	00d12623          	sw	a3,12(sp)
8000f020:	b20ff0ef          	jal	ra,8000e340 <_malloc_r>
8000f024:	00a92023          	sw	a0,0(s2)
8000f028:	00a92823          	sw	a0,16(s2)
8000f02c:	00c12683          	lw	a3,12(sp)
8000f030:	04051263          	bnez	a0,8000f074 <_svfiprintf_r+0xac>
8000f034:	00c00793          	li	a5,12
8000f038:	00f9a023          	sw	a5,0(s3)
8000f03c:	fff00513          	li	a0,-1
8000f040:	0ac12083          	lw	ra,172(sp)
8000f044:	0a812403          	lw	s0,168(sp)
8000f048:	0a412483          	lw	s1,164(sp)
8000f04c:	0a012903          	lw	s2,160(sp)
8000f050:	09c12983          	lw	s3,156(sp)
8000f054:	09812a03          	lw	s4,152(sp)
8000f058:	09412a83          	lw	s5,148(sp)
8000f05c:	09012b03          	lw	s6,144(sp)
8000f060:	08c12b83          	lw	s7,140(sp)
8000f064:	08812c03          	lw	s8,136(sp)
8000f068:	08412c83          	lw	s9,132(sp)
8000f06c:	0b010113          	addi	sp,sp,176
8000f070:	00008067          	ret
8000f074:	04000793          	li	a5,64
8000f078:	00f92a23          	sw	a5,20(s2)
8000f07c:	02000793          	li	a5,32
8000f080:	02f10ca3          	sb	a5,57(sp)
8000f084:	03000793          	li	a5,48
8000f088:	02012a23          	sw	zero,52(sp)
8000f08c:	02f10d23          	sb	a5,58(sp)
8000f090:	00d12e23          	sw	a3,28(sp)
8000f094:	02500b13          	li	s6,37
8000f098:	ffff4a97          	auipc	s5,0xffff4
8000f09c:	ddca8a93          	addi	s5,s5,-548 # 80002e74 <__sf_fake_stdout+0x20>
8000f0a0:	00100b93          	li	s7,1
8000f0a4:	7fff1c17          	auipc	s8,0x7fff1
8000f0a8:	f5cc0c13          	addi	s8,s8,-164 # 0 <_heap_end+0x7ffee000>
8000f0ac:	00048413          	mv	s0,s1
8000f0b0:	00044783          	lbu	a5,0(s0)
8000f0b4:	00078463          	beqz	a5,8000f0bc <_svfiprintf_r+0xf4>
8000f0b8:	0d679663          	bne	a5,s6,8000f184 <_svfiprintf_r+0x1bc>
8000f0bc:	40940cb3          	sub	s9,s0,s1
8000f0c0:	020c8663          	beqz	s9,8000f0ec <_svfiprintf_r+0x124>
8000f0c4:	000c8693          	mv	a3,s9
8000f0c8:	00048613          	mv	a2,s1
8000f0cc:	00090593          	mv	a1,s2
8000f0d0:	00098513          	mv	a0,s3
8000f0d4:	bcdff0ef          	jal	ra,8000eca0 <__ssputs_r>
8000f0d8:	fff00793          	li	a5,-1
8000f0dc:	24f50e63          	beq	a0,a5,8000f338 <_svfiprintf_r+0x370>
8000f0e0:	03412683          	lw	a3,52(sp)
8000f0e4:	019686b3          	add	a3,a3,s9
8000f0e8:	02d12a23          	sw	a3,52(sp)
8000f0ec:	00044783          	lbu	a5,0(s0)
8000f0f0:	24078463          	beqz	a5,8000f338 <_svfiprintf_r+0x370>
8000f0f4:	fff00793          	li	a5,-1
8000f0f8:	00140493          	addi	s1,s0,1
8000f0fc:	02012023          	sw	zero,32(sp)
8000f100:	02012623          	sw	zero,44(sp)
8000f104:	02f12223          	sw	a5,36(sp)
8000f108:	02012423          	sw	zero,40(sp)
8000f10c:	060101a3          	sb	zero,99(sp)
8000f110:	06012c23          	sw	zero,120(sp)
8000f114:	0004c583          	lbu	a1,0(s1)
8000f118:	00500613          	li	a2,5
8000f11c:	000a8513          	mv	a0,s5
8000f120:	754010ef          	jal	ra,80010874 <memchr>
8000f124:	00148413          	addi	s0,s1,1
8000f128:	02012783          	lw	a5,32(sp)
8000f12c:	06051063          	bnez	a0,8000f18c <_svfiprintf_r+0x1c4>
8000f130:	0107f713          	andi	a4,a5,16
8000f134:	00070663          	beqz	a4,8000f140 <_svfiprintf_r+0x178>
8000f138:	02000713          	li	a4,32
8000f13c:	06e101a3          	sb	a4,99(sp)
8000f140:	0087f713          	andi	a4,a5,8
8000f144:	00070663          	beqz	a4,8000f150 <_svfiprintf_r+0x188>
8000f148:	02b00713          	li	a4,43
8000f14c:	06e101a3          	sb	a4,99(sp)
8000f150:	0004c683          	lbu	a3,0(s1)
8000f154:	02a00713          	li	a4,42
8000f158:	04e68663          	beq	a3,a4,8000f1a4 <_svfiprintf_r+0x1dc>
8000f15c:	02c12703          	lw	a4,44(sp)
8000f160:	00048413          	mv	s0,s1
8000f164:	00000793          	li	a5,0
8000f168:	00900613          	li	a2,9
8000f16c:	00044683          	lbu	a3,0(s0)
8000f170:	00140593          	addi	a1,s0,1
8000f174:	fd068693          	addi	a3,a3,-48
8000f178:	10d67a63          	bgeu	a2,a3,8000f28c <_svfiprintf_r+0x2c4>
8000f17c:	02079e63          	bnez	a5,8000f1b8 <_svfiprintf_r+0x1f0>
8000f180:	0500006f          	j	8000f1d0 <_svfiprintf_r+0x208>
8000f184:	00140413          	addi	s0,s0,1
8000f188:	f29ff06f          	j	8000f0b0 <_svfiprintf_r+0xe8>
8000f18c:	41550533          	sub	a0,a0,s5
8000f190:	00ab9533          	sll	a0,s7,a0
8000f194:	00a7e7b3          	or	a5,a5,a0
8000f198:	02f12023          	sw	a5,32(sp)
8000f19c:	00040493          	mv	s1,s0
8000f1a0:	f75ff06f          	j	8000f114 <_svfiprintf_r+0x14c>
8000f1a4:	01c12703          	lw	a4,28(sp)
8000f1a8:	00470693          	addi	a3,a4,4
8000f1ac:	00072703          	lw	a4,0(a4)
8000f1b0:	00d12e23          	sw	a3,28(sp)
8000f1b4:	00074663          	bltz	a4,8000f1c0 <_svfiprintf_r+0x1f8>
8000f1b8:	02e12623          	sw	a4,44(sp)
8000f1bc:	0140006f          	j	8000f1d0 <_svfiprintf_r+0x208>
8000f1c0:	40e00733          	neg	a4,a4
8000f1c4:	0027e793          	ori	a5,a5,2
8000f1c8:	02e12623          	sw	a4,44(sp)
8000f1cc:	02f12023          	sw	a5,32(sp)
8000f1d0:	00044703          	lbu	a4,0(s0)
8000f1d4:	02e00793          	li	a5,46
8000f1d8:	02f71663          	bne	a4,a5,8000f204 <_svfiprintf_r+0x23c>
8000f1dc:	00144703          	lbu	a4,1(s0)
8000f1e0:	02a00793          	li	a5,42
8000f1e4:	0cf71663          	bne	a4,a5,8000f2b0 <_svfiprintf_r+0x2e8>
8000f1e8:	01c12783          	lw	a5,28(sp)
8000f1ec:	00240413          	addi	s0,s0,2
8000f1f0:	00478713          	addi	a4,a5,4
8000f1f4:	0007a783          	lw	a5,0(a5)
8000f1f8:	00e12e23          	sw	a4,28(sp)
8000f1fc:	0a07c663          	bltz	a5,8000f2a8 <_svfiprintf_r+0x2e0>
8000f200:	02f12223          	sw	a5,36(sp)
8000f204:	00044583          	lbu	a1,0(s0)
8000f208:	00300613          	li	a2,3
8000f20c:	ffff4517          	auipc	a0,0xffff4
8000f210:	c7050513          	addi	a0,a0,-912 # 80002e7c <__sf_fake_stdout+0x28>
8000f214:	660010ef          	jal	ra,80010874 <memchr>
8000f218:	02050463          	beqz	a0,8000f240 <_svfiprintf_r+0x278>
8000f21c:	ffff4797          	auipc	a5,0xffff4
8000f220:	c6078793          	addi	a5,a5,-928 # 80002e7c <__sf_fake_stdout+0x28>
8000f224:	40f50533          	sub	a0,a0,a5
8000f228:	04000793          	li	a5,64
8000f22c:	00a797b3          	sll	a5,a5,a0
8000f230:	02012503          	lw	a0,32(sp)
8000f234:	00140413          	addi	s0,s0,1
8000f238:	00f56533          	or	a0,a0,a5
8000f23c:	02a12023          	sw	a0,32(sp)
8000f240:	00044583          	lbu	a1,0(s0)
8000f244:	00600613          	li	a2,6
8000f248:	ffff4517          	auipc	a0,0xffff4
8000f24c:	c3850513          	addi	a0,a0,-968 # 80002e80 <__sf_fake_stdout+0x2c>
8000f250:	00140493          	addi	s1,s0,1
8000f254:	02b10c23          	sb	a1,56(sp)
8000f258:	61c010ef          	jal	ra,80010874 <memchr>
8000f25c:	0e050a63          	beqz	a0,8000f350 <_svfiprintf_r+0x388>
8000f260:	0a0c1663          	bnez	s8,8000f30c <_svfiprintf_r+0x344>
8000f264:	02012703          	lw	a4,32(sp)
8000f268:	01c12783          	lw	a5,28(sp)
8000f26c:	10077713          	andi	a4,a4,256
8000f270:	08070663          	beqz	a4,8000f2fc <_svfiprintf_r+0x334>
8000f274:	00478793          	addi	a5,a5,4
8000f278:	00f12e23          	sw	a5,28(sp)
8000f27c:	03412783          	lw	a5,52(sp)
8000f280:	014787b3          	add	a5,a5,s4
8000f284:	02f12a23          	sw	a5,52(sp)
8000f288:	e25ff06f          	j	8000f0ac <_svfiprintf_r+0xe4>
8000f28c:	00271793          	slli	a5,a4,0x2
8000f290:	00e787b3          	add	a5,a5,a4
8000f294:	00179793          	slli	a5,a5,0x1
8000f298:	00d78733          	add	a4,a5,a3
8000f29c:	00058413          	mv	s0,a1
8000f2a0:	00100793          	li	a5,1
8000f2a4:	ec9ff06f          	j	8000f16c <_svfiprintf_r+0x1a4>
8000f2a8:	fff00793          	li	a5,-1
8000f2ac:	f55ff06f          	j	8000f200 <_svfiprintf_r+0x238>
8000f2b0:	00140413          	addi	s0,s0,1
8000f2b4:	02012223          	sw	zero,36(sp)
8000f2b8:	00000793          	li	a5,0
8000f2bc:	00000713          	li	a4,0
8000f2c0:	00900613          	li	a2,9
8000f2c4:	00044683          	lbu	a3,0(s0)
8000f2c8:	00140593          	addi	a1,s0,1
8000f2cc:	fd068693          	addi	a3,a3,-48
8000f2d0:	00d67863          	bgeu	a2,a3,8000f2e0 <_svfiprintf_r+0x318>
8000f2d4:	f20788e3          	beqz	a5,8000f204 <_svfiprintf_r+0x23c>
8000f2d8:	02e12223          	sw	a4,36(sp)
8000f2dc:	f29ff06f          	j	8000f204 <_svfiprintf_r+0x23c>
8000f2e0:	00271793          	slli	a5,a4,0x2
8000f2e4:	00e787b3          	add	a5,a5,a4
8000f2e8:	00179793          	slli	a5,a5,0x1
8000f2ec:	00d78733          	add	a4,a5,a3
8000f2f0:	00058413          	mv	s0,a1
8000f2f4:	00100793          	li	a5,1
8000f2f8:	fcdff06f          	j	8000f2c4 <_svfiprintf_r+0x2fc>
8000f2fc:	00778793          	addi	a5,a5,7
8000f300:	ff87f793          	andi	a5,a5,-8
8000f304:	00878793          	addi	a5,a5,8
8000f308:	f71ff06f          	j	8000f278 <_svfiprintf_r+0x2b0>
8000f30c:	01c10713          	addi	a4,sp,28
8000f310:	00000697          	auipc	a3,0x0
8000f314:	99068693          	addi	a3,a3,-1648 # 8000eca0 <__ssputs_r>
8000f318:	00090613          	mv	a2,s2
8000f31c:	02010593          	addi	a1,sp,32
8000f320:	00098513          	mv	a0,s3
8000f324:	00000097          	auipc	ra,0x0
8000f328:	000000e7          	jalr	zero # 0 <_heap_size>
8000f32c:	fff00793          	li	a5,-1
8000f330:	00050a13          	mv	s4,a0
8000f334:	f4f514e3          	bne	a0,a5,8000f27c <_svfiprintf_r+0x2b4>
8000f338:	00c95783          	lhu	a5,12(s2)
8000f33c:	fff00513          	li	a0,-1
8000f340:	0407f793          	andi	a5,a5,64
8000f344:	ce079ee3          	bnez	a5,8000f040 <_svfiprintf_r+0x78>
8000f348:	03412503          	lw	a0,52(sp)
8000f34c:	cf5ff06f          	j	8000f040 <_svfiprintf_r+0x78>
8000f350:	01c10713          	addi	a4,sp,28
8000f354:	00000697          	auipc	a3,0x0
8000f358:	94c68693          	addi	a3,a3,-1716 # 8000eca0 <__ssputs_r>
8000f35c:	00090613          	mv	a2,s2
8000f360:	02010593          	addi	a1,sp,32
8000f364:	00098513          	mv	a0,s3
8000f368:	1b8000ef          	jal	ra,8000f520 <_printf_i>
8000f36c:	fc1ff06f          	j	8000f32c <_svfiprintf_r+0x364>

Disassembly of section .text._printf_common:

8000f370 <_printf_common>:
8000f370:	fd010113          	addi	sp,sp,-48
8000f374:	01512a23          	sw	s5,20(sp)
8000f378:	0105a783          	lw	a5,16(a1)
8000f37c:	00070a93          	mv	s5,a4
8000f380:	0085a703          	lw	a4,8(a1)
8000f384:	02812423          	sw	s0,40(sp)
8000f388:	02912223          	sw	s1,36(sp)
8000f38c:	01312e23          	sw	s3,28(sp)
8000f390:	01412c23          	sw	s4,24(sp)
8000f394:	02112623          	sw	ra,44(sp)
8000f398:	03212023          	sw	s2,32(sp)
8000f39c:	01612823          	sw	s6,16(sp)
8000f3a0:	01712623          	sw	s7,12(sp)
8000f3a4:	00050993          	mv	s3,a0
8000f3a8:	00058413          	mv	s0,a1
8000f3ac:	00060493          	mv	s1,a2
8000f3b0:	00068a13          	mv	s4,a3
8000f3b4:	00e7d463          	bge	a5,a4,8000f3bc <_printf_common+0x4c>
8000f3b8:	00070793          	mv	a5,a4
8000f3bc:	00f4a023          	sw	a5,0(s1)
8000f3c0:	04344703          	lbu	a4,67(s0)
8000f3c4:	00070663          	beqz	a4,8000f3d0 <_printf_common+0x60>
8000f3c8:	00178793          	addi	a5,a5,1
8000f3cc:	00f4a023          	sw	a5,0(s1)
8000f3d0:	00042783          	lw	a5,0(s0)
8000f3d4:	0207f793          	andi	a5,a5,32
8000f3d8:	00078863          	beqz	a5,8000f3e8 <_printf_common+0x78>
8000f3dc:	0004a783          	lw	a5,0(s1)
8000f3e0:	00278793          	addi	a5,a5,2
8000f3e4:	00f4a023          	sw	a5,0(s1)
8000f3e8:	00042903          	lw	s2,0(s0)
8000f3ec:	00697913          	andi	s2,s2,6
8000f3f0:	00091e63          	bnez	s2,8000f40c <_printf_common+0x9c>
8000f3f4:	01940b13          	addi	s6,s0,25
8000f3f8:	fff00b93          	li	s7,-1
8000f3fc:	00c42783          	lw	a5,12(s0)
8000f400:	0004a703          	lw	a4,0(s1)
8000f404:	40e787b3          	sub	a5,a5,a4
8000f408:	08f94263          	blt	s2,a5,8000f48c <_printf_common+0x11c>
8000f40c:	00042783          	lw	a5,0(s0)
8000f410:	04344683          	lbu	a3,67(s0)
8000f414:	0207f793          	andi	a5,a5,32
8000f418:	00d036b3          	snez	a3,a3
8000f41c:	0c079063          	bnez	a5,8000f4dc <_printf_common+0x16c>
8000f420:	04340613          	addi	a2,s0,67
8000f424:	000a0593          	mv	a1,s4
8000f428:	00098513          	mv	a0,s3
8000f42c:	000a80e7          	jalr	s5
8000f430:	fff00793          	li	a5,-1
8000f434:	06f50863          	beq	a0,a5,8000f4a4 <_printf_common+0x134>
8000f438:	00042783          	lw	a5,0(s0)
8000f43c:	00400613          	li	a2,4
8000f440:	0004a703          	lw	a4,0(s1)
8000f444:	0067f793          	andi	a5,a5,6
8000f448:	00c42683          	lw	a3,12(s0)
8000f44c:	00000493          	li	s1,0
8000f450:	00c79863          	bne	a5,a2,8000f460 <_printf_common+0xf0>
8000f454:	40e684b3          	sub	s1,a3,a4
8000f458:	0004d463          	bgez	s1,8000f460 <_printf_common+0xf0>
8000f45c:	00000493          	li	s1,0
8000f460:	00842783          	lw	a5,8(s0)
8000f464:	01042703          	lw	a4,16(s0)
8000f468:	00f75663          	bge	a4,a5,8000f474 <_printf_common+0x104>
8000f46c:	40e787b3          	sub	a5,a5,a4
8000f470:	00f484b3          	add	s1,s1,a5
8000f474:	00000913          	li	s2,0
8000f478:	01a40413          	addi	s0,s0,26
8000f47c:	fff00b13          	li	s6,-1
8000f480:	09249063          	bne	s1,s2,8000f500 <_printf_common+0x190>
8000f484:	00000513          	li	a0,0
8000f488:	0200006f          	j	8000f4a8 <_printf_common+0x138>
8000f48c:	00100693          	li	a3,1
8000f490:	000b0613          	mv	a2,s6
8000f494:	000a0593          	mv	a1,s4
8000f498:	00098513          	mv	a0,s3
8000f49c:	000a80e7          	jalr	s5
8000f4a0:	03751a63          	bne	a0,s7,8000f4d4 <_printf_common+0x164>
8000f4a4:	fff00513          	li	a0,-1
8000f4a8:	02c12083          	lw	ra,44(sp)
8000f4ac:	02812403          	lw	s0,40(sp)
8000f4b0:	02412483          	lw	s1,36(sp)
8000f4b4:	02012903          	lw	s2,32(sp)
8000f4b8:	01c12983          	lw	s3,28(sp)
8000f4bc:	01812a03          	lw	s4,24(sp)
8000f4c0:	01412a83          	lw	s5,20(sp)
8000f4c4:	01012b03          	lw	s6,16(sp)
8000f4c8:	00c12b83          	lw	s7,12(sp)
8000f4cc:	03010113          	addi	sp,sp,48
8000f4d0:	00008067          	ret
8000f4d4:	00190913          	addi	s2,s2,1
8000f4d8:	f25ff06f          	j	8000f3fc <_printf_common+0x8c>
8000f4dc:	00d40733          	add	a4,s0,a3
8000f4e0:	03000613          	li	a2,48
8000f4e4:	04c701a3          	sb	a2,67(a4)
8000f4e8:	04544703          	lbu	a4,69(s0)
8000f4ec:	00168793          	addi	a5,a3,1
8000f4f0:	00f407b3          	add	a5,s0,a5
8000f4f4:	00268693          	addi	a3,a3,2
8000f4f8:	04e781a3          	sb	a4,67(a5)
8000f4fc:	f25ff06f          	j	8000f420 <_printf_common+0xb0>
8000f500:	00100693          	li	a3,1
8000f504:	00040613          	mv	a2,s0
8000f508:	000a0593          	mv	a1,s4
8000f50c:	00098513          	mv	a0,s3
8000f510:	000a80e7          	jalr	s5
8000f514:	f96508e3          	beq	a0,s6,8000f4a4 <_printf_common+0x134>
8000f518:	00190913          	addi	s2,s2,1
8000f51c:	f65ff06f          	j	8000f480 <_printf_common+0x110>

Disassembly of section .text._printf_i:

8000f520 <_printf_i>:
8000f520:	fc010113          	addi	sp,sp,-64
8000f524:	02812c23          	sw	s0,56(sp)
8000f528:	03312623          	sw	s3,44(sp)
8000f52c:	03512223          	sw	s5,36(sp)
8000f530:	03612023          	sw	s6,32(sp)
8000f534:	01712e23          	sw	s7,28(sp)
8000f538:	02112e23          	sw	ra,60(sp)
8000f53c:	02912a23          	sw	s1,52(sp)
8000f540:	03212823          	sw	s2,48(sp)
8000f544:	03412423          	sw	s4,40(sp)
8000f548:	01812c23          	sw	s8,24(sp)
8000f54c:	0185c783          	lbu	a5,24(a1)
8000f550:	00068b93          	mv	s7,a3
8000f554:	06e00693          	li	a3,110
8000f558:	00050a93          	mv	s5,a0
8000f55c:	00058413          	mv	s0,a1
8000f560:	00060b13          	mv	s6,a2
8000f564:	04358993          	addi	s3,a1,67
8000f568:	28d78c63          	beq	a5,a3,8000f800 <_printf_i+0x2e0>
8000f56c:	06f6e863          	bltu	a3,a5,8000f5dc <_printf_i+0xbc>
8000f570:	06300693          	li	a3,99
8000f574:	0ad78c63          	beq	a5,a3,8000f62c <_printf_i+0x10c>
8000f578:	00f6ec63          	bltu	a3,a5,8000f590 <_printf_i+0x70>
8000f57c:	2c078063          	beqz	a5,8000f83c <_printf_i+0x31c>
8000f580:	05800693          	li	a3,88
8000f584:	12d78863          	beq	a5,a3,8000f6b4 <_printf_i+0x194>
8000f588:	04240c13          	addi	s8,s0,66
8000f58c:	0b40006f          	j	8000f640 <_printf_i+0x120>
8000f590:	06400693          	li	a3,100
8000f594:	00d78663          	beq	a5,a3,8000f5a0 <_printf_i+0x80>
8000f598:	06900693          	li	a3,105
8000f59c:	fed796e3          	bne	a5,a3,8000f588 <_printf_i+0x68>
8000f5a0:	00042783          	lw	a5,0(s0)
8000f5a4:	00072603          	lw	a2,0(a4)
8000f5a8:	0807f593          	andi	a1,a5,128
8000f5ac:	00460693          	addi	a3,a2,4
8000f5b0:	08058e63          	beqz	a1,8000f64c <_printf_i+0x12c>
8000f5b4:	00062483          	lw	s1,0(a2)
8000f5b8:	00d72023          	sw	a3,0(a4)
8000f5bc:	0004d863          	bgez	s1,8000f5cc <_printf_i+0xac>
8000f5c0:	02d00793          	li	a5,45
8000f5c4:	409004b3          	neg	s1,s1
8000f5c8:	04f401a3          	sb	a5,67(s0)
8000f5cc:	ffff4a17          	auipc	s4,0xffff4
8000f5d0:	8bca0a13          	addi	s4,s4,-1860 # 80002e88 <__sf_fake_stdout+0x34>
8000f5d4:	00a00913          	li	s2,10
8000f5d8:	12c0006f          	j	8000f704 <_printf_i+0x1e4>
8000f5dc:	07300693          	li	a3,115
8000f5e0:	26d78463          	beq	a5,a3,8000f848 <_printf_i+0x328>
8000f5e4:	02f6e263          	bltu	a3,a5,8000f608 <_printf_i+0xe8>
8000f5e8:	06f00693          	li	a3,111
8000f5ec:	06d78e63          	beq	a5,a3,8000f668 <_printf_i+0x148>
8000f5f0:	07000693          	li	a3,112
8000f5f4:	f8d79ae3          	bne	a5,a3,8000f588 <_printf_i+0x68>
8000f5f8:	0005a783          	lw	a5,0(a1)
8000f5fc:	0207e793          	ori	a5,a5,32
8000f600:	00f5a023          	sw	a5,0(a1)
8000f604:	0140006f          	j	8000f618 <_printf_i+0xf8>
8000f608:	07500693          	li	a3,117
8000f60c:	04d78e63          	beq	a5,a3,8000f668 <_printf_i+0x148>
8000f610:	07800693          	li	a3,120
8000f614:	f6d79ae3          	bne	a5,a3,8000f588 <_printf_i+0x68>
8000f618:	07800793          	li	a5,120
8000f61c:	04f402a3          	sb	a5,69(s0)
8000f620:	ffff4a17          	auipc	s4,0xffff4
8000f624:	87ca0a13          	addi	s4,s4,-1924 # 80002e9c <__sf_fake_stdout+0x48>
8000f628:	0980006f          	j	8000f6c0 <_printf_i+0x1a0>
8000f62c:	00072783          	lw	a5,0(a4)
8000f630:	04258c13          	addi	s8,a1,66
8000f634:	00478693          	addi	a3,a5,4
8000f638:	0007a783          	lw	a5,0(a5)
8000f63c:	00d72023          	sw	a3,0(a4)
8000f640:	04f40123          	sb	a5,66(s0)
8000f644:	00100793          	li	a5,1
8000f648:	2300006f          	j	8000f878 <_printf_i+0x358>
8000f64c:	00062483          	lw	s1,0(a2)
8000f650:	0407f793          	andi	a5,a5,64
8000f654:	00d72023          	sw	a3,0(a4)
8000f658:	f60782e3          	beqz	a5,8000f5bc <_printf_i+0x9c>
8000f65c:	01049493          	slli	s1,s1,0x10
8000f660:	4104d493          	srai	s1,s1,0x10
8000f664:	f59ff06f          	j	8000f5bc <_printf_i+0x9c>
8000f668:	00042603          	lw	a2,0(s0)
8000f66c:	00072683          	lw	a3,0(a4)
8000f670:	08067513          	andi	a0,a2,128
8000f674:	00468593          	addi	a1,a3,4
8000f678:	00050863          	beqz	a0,8000f688 <_printf_i+0x168>
8000f67c:	00b72023          	sw	a1,0(a4)
8000f680:	0006a483          	lw	s1,0(a3)
8000f684:	0140006f          	j	8000f698 <_printf_i+0x178>
8000f688:	04067613          	andi	a2,a2,64
8000f68c:	00b72023          	sw	a1,0(a4)
8000f690:	fe0608e3          	beqz	a2,8000f680 <_printf_i+0x160>
8000f694:	0006d483          	lhu	s1,0(a3)
8000f698:	06f00713          	li	a4,111
8000f69c:	ffff3a17          	auipc	s4,0xffff3
8000f6a0:	7eca0a13          	addi	s4,s4,2028 # 80002e88 <__sf_fake_stdout+0x34>
8000f6a4:	00a00913          	li	s2,10
8000f6a8:	04e79c63          	bne	a5,a4,8000f700 <_printf_i+0x1e0>
8000f6ac:	00800913          	li	s2,8
8000f6b0:	0500006f          	j	8000f700 <_printf_i+0x1e0>
8000f6b4:	04f582a3          	sb	a5,69(a1)
8000f6b8:	ffff3a17          	auipc	s4,0xffff3
8000f6bc:	7d0a0a13          	addi	s4,s4,2000 # 80002e88 <__sf_fake_stdout+0x34>
8000f6c0:	00042783          	lw	a5,0(s0)
8000f6c4:	00072683          	lw	a3,0(a4)
8000f6c8:	0807f613          	andi	a2,a5,128
8000f6cc:	0006a483          	lw	s1,0(a3)
8000f6d0:	00468693          	addi	a3,a3,4
8000f6d4:	10060663          	beqz	a2,8000f7e0 <_printf_i+0x2c0>
8000f6d8:	00d72023          	sw	a3,0(a4)
8000f6dc:	0017f713          	andi	a4,a5,1
8000f6e0:	00070663          	beqz	a4,8000f6ec <_printf_i+0x1cc>
8000f6e4:	0207e793          	ori	a5,a5,32
8000f6e8:	00f42023          	sw	a5,0(s0)
8000f6ec:	01000913          	li	s2,16
8000f6f0:	00049863          	bnez	s1,8000f700 <_printf_i+0x1e0>
8000f6f4:	00042783          	lw	a5,0(s0)
8000f6f8:	fdf7f793          	andi	a5,a5,-33
8000f6fc:	00f42023          	sw	a5,0(s0)
8000f700:	040401a3          	sb	zero,67(s0)
8000f704:	00442783          	lw	a5,4(s0)
8000f708:	00f42423          	sw	a5,8(s0)
8000f70c:	0007c863          	bltz	a5,8000f71c <_printf_i+0x1fc>
8000f710:	00042703          	lw	a4,0(s0)
8000f714:	ffb77713          	andi	a4,a4,-5
8000f718:	00e42023          	sw	a4,0(s0)
8000f71c:	00049663          	bnez	s1,8000f728 <_printf_i+0x208>
8000f720:	00098c13          	mv	s8,s3
8000f724:	02078a63          	beqz	a5,8000f758 <_printf_i+0x238>
8000f728:	00098c13          	mv	s8,s3
8000f72c:	00090593          	mv	a1,s2
8000f730:	00048513          	mv	a0,s1
8000f734:	ca1fd0ef          	jal	ra,8000d3d4 <__umodsi3>
8000f738:	00aa0533          	add	a0,s4,a0
8000f73c:	00054783          	lbu	a5,0(a0)
8000f740:	fffc0c13          	addi	s8,s8,-1
8000f744:	00090593          	mv	a1,s2
8000f748:	00fc0023          	sb	a5,0(s8)
8000f74c:	00048513          	mv	a0,s1
8000f750:	c3dfd0ef          	jal	ra,8000d38c <__udivsi3>
8000f754:	0b24f263          	bgeu	s1,s2,8000f7f8 <_printf_i+0x2d8>
8000f758:	00800793          	li	a5,8
8000f75c:	02f91463          	bne	s2,a5,8000f784 <_printf_i+0x264>
8000f760:	00042783          	lw	a5,0(s0)
8000f764:	0017f793          	andi	a5,a5,1
8000f768:	00078e63          	beqz	a5,8000f784 <_printf_i+0x264>
8000f76c:	00442703          	lw	a4,4(s0)
8000f770:	01042783          	lw	a5,16(s0)
8000f774:	00e7c863          	blt	a5,a4,8000f784 <_printf_i+0x264>
8000f778:	03000793          	li	a5,48
8000f77c:	fefc0fa3          	sb	a5,-1(s8)
8000f780:	fffc0c13          	addi	s8,s8,-1
8000f784:	418989b3          	sub	s3,s3,s8
8000f788:	01342823          	sw	s3,16(s0)
8000f78c:	000b8713          	mv	a4,s7
8000f790:	000b0693          	mv	a3,s6
8000f794:	00c10613          	addi	a2,sp,12
8000f798:	00040593          	mv	a1,s0
8000f79c:	000a8513          	mv	a0,s5
8000f7a0:	bd1ff0ef          	jal	ra,8000f370 <_printf_common>
8000f7a4:	fff00493          	li	s1,-1
8000f7a8:	0c951e63          	bne	a0,s1,8000f884 <_printf_i+0x364>
8000f7ac:	fff00513          	li	a0,-1
8000f7b0:	03c12083          	lw	ra,60(sp)
8000f7b4:	03812403          	lw	s0,56(sp)
8000f7b8:	03412483          	lw	s1,52(sp)
8000f7bc:	03012903          	lw	s2,48(sp)
8000f7c0:	02c12983          	lw	s3,44(sp)
8000f7c4:	02812a03          	lw	s4,40(sp)
8000f7c8:	02412a83          	lw	s5,36(sp)
8000f7cc:	02012b03          	lw	s6,32(sp)
8000f7d0:	01c12b83          	lw	s7,28(sp)
8000f7d4:	01812c03          	lw	s8,24(sp)
8000f7d8:	04010113          	addi	sp,sp,64
8000f7dc:	00008067          	ret
8000f7e0:	0407f613          	andi	a2,a5,64
8000f7e4:	00d72023          	sw	a3,0(a4)
8000f7e8:	ee060ae3          	beqz	a2,8000f6dc <_printf_i+0x1bc>
8000f7ec:	01049493          	slli	s1,s1,0x10
8000f7f0:	0104d493          	srli	s1,s1,0x10
8000f7f4:	ee9ff06f          	j	8000f6dc <_printf_i+0x1bc>
8000f7f8:	00050493          	mv	s1,a0
8000f7fc:	f31ff06f          	j	8000f72c <_printf_i+0x20c>
8000f800:	0005a683          	lw	a3,0(a1)
8000f804:	00072783          	lw	a5,0(a4)
8000f808:	0145a603          	lw	a2,20(a1)
8000f80c:	0806f513          	andi	a0,a3,128
8000f810:	00478593          	addi	a1,a5,4
8000f814:	00050a63          	beqz	a0,8000f828 <_printf_i+0x308>
8000f818:	00b72023          	sw	a1,0(a4)
8000f81c:	0007a783          	lw	a5,0(a5)
8000f820:	00c7a023          	sw	a2,0(a5)
8000f824:	0180006f          	j	8000f83c <_printf_i+0x31c>
8000f828:	00b72023          	sw	a1,0(a4)
8000f82c:	0406f693          	andi	a3,a3,64
8000f830:	0007a783          	lw	a5,0(a5)
8000f834:	fe0686e3          	beqz	a3,8000f820 <_printf_i+0x300>
8000f838:	00c79023          	sh	a2,0(a5)
8000f83c:	00042823          	sw	zero,16(s0)
8000f840:	00098c13          	mv	s8,s3
8000f844:	f49ff06f          	j	8000f78c <_printf_i+0x26c>
8000f848:	00072783          	lw	a5,0(a4)
8000f84c:	0045a603          	lw	a2,4(a1)
8000f850:	00000593          	li	a1,0
8000f854:	00478693          	addi	a3,a5,4
8000f858:	00d72023          	sw	a3,0(a4)
8000f85c:	0007ac03          	lw	s8,0(a5)
8000f860:	000c0513          	mv	a0,s8
8000f864:	010010ef          	jal	ra,80010874 <memchr>
8000f868:	00050663          	beqz	a0,8000f874 <_printf_i+0x354>
8000f86c:	41850533          	sub	a0,a0,s8
8000f870:	00a42223          	sw	a0,4(s0)
8000f874:	00442783          	lw	a5,4(s0)
8000f878:	00f42823          	sw	a5,16(s0)
8000f87c:	040401a3          	sb	zero,67(s0)
8000f880:	f0dff06f          	j	8000f78c <_printf_i+0x26c>
8000f884:	01042683          	lw	a3,16(s0)
8000f888:	000c0613          	mv	a2,s8
8000f88c:	000b0593          	mv	a1,s6
8000f890:	000a8513          	mv	a0,s5
8000f894:	000b80e7          	jalr	s7
8000f898:	f0950ae3          	beq	a0,s1,8000f7ac <_printf_i+0x28c>
8000f89c:	00042783          	lw	a5,0(s0)
8000f8a0:	0027f793          	andi	a5,a5,2
8000f8a4:	04079463          	bnez	a5,8000f8ec <_printf_i+0x3cc>
8000f8a8:	00c12783          	lw	a5,12(sp)
8000f8ac:	00c42503          	lw	a0,12(s0)
8000f8b0:	f0f550e3          	bge	a0,a5,8000f7b0 <_printf_i+0x290>
8000f8b4:	00078513          	mv	a0,a5
8000f8b8:	ef9ff06f          	j	8000f7b0 <_printf_i+0x290>
8000f8bc:	00100693          	li	a3,1
8000f8c0:	00090613          	mv	a2,s2
8000f8c4:	000b0593          	mv	a1,s6
8000f8c8:	000a8513          	mv	a0,s5
8000f8cc:	000b80e7          	jalr	s7
8000f8d0:	ed350ee3          	beq	a0,s3,8000f7ac <_printf_i+0x28c>
8000f8d4:	00148493          	addi	s1,s1,1
8000f8d8:	00c42783          	lw	a5,12(s0)
8000f8dc:	00c12703          	lw	a4,12(sp)
8000f8e0:	40e787b3          	sub	a5,a5,a4
8000f8e4:	fcf4cce3          	blt	s1,a5,8000f8bc <_printf_i+0x39c>
8000f8e8:	fc1ff06f          	j	8000f8a8 <_printf_i+0x388>
8000f8ec:	00000493          	li	s1,0
8000f8f0:	01940913          	addi	s2,s0,25
8000f8f4:	fff00993          	li	s3,-1
8000f8f8:	fe1ff06f          	j	8000f8d8 <_printf_i+0x3b8>

Disassembly of section .text.__sfputc_r:

8000f8fc <__sfputc_r>:
8000f8fc:	00862783          	lw	a5,8(a2)
8000f900:	fff78793          	addi	a5,a5,-1
8000f904:	00f62423          	sw	a5,8(a2)
8000f908:	0007dc63          	bgez	a5,8000f920 <__sfputc_r+0x24>
8000f90c:	01862703          	lw	a4,24(a2)
8000f910:	00e7c663          	blt	a5,a4,8000f91c <__sfputc_r+0x20>
8000f914:	00a00793          	li	a5,10
8000f918:	00f59463          	bne	a1,a5,8000f920 <__sfputc_r+0x24>
8000f91c:	6b40006f          	j	8000ffd0 <__swbuf_r>
8000f920:	00062783          	lw	a5,0(a2)
8000f924:	00058513          	mv	a0,a1
8000f928:	00178713          	addi	a4,a5,1
8000f92c:	00e62023          	sw	a4,0(a2)
8000f930:	00b78023          	sb	a1,0(a5)
8000f934:	00008067          	ret

Disassembly of section .text.__sfputs_r:

8000f938 <__sfputs_r>:
8000f938:	fe010113          	addi	sp,sp,-32
8000f93c:	00812c23          	sw	s0,24(sp)
8000f940:	00912a23          	sw	s1,20(sp)
8000f944:	01212823          	sw	s2,16(sp)
8000f948:	01312623          	sw	s3,12(sp)
8000f94c:	01412423          	sw	s4,8(sp)
8000f950:	00112e23          	sw	ra,28(sp)
8000f954:	00050913          	mv	s2,a0
8000f958:	00058993          	mv	s3,a1
8000f95c:	00060413          	mv	s0,a2
8000f960:	00d604b3          	add	s1,a2,a3
8000f964:	fff00a13          	li	s4,-1
8000f968:	00941663          	bne	s0,s1,8000f974 <__sfputs_r+0x3c>
8000f96c:	00000513          	li	a0,0
8000f970:	01c0006f          	j	8000f98c <__sfputs_r+0x54>
8000f974:	00044583          	lbu	a1,0(s0)
8000f978:	00098613          	mv	a2,s3
8000f97c:	00090513          	mv	a0,s2
8000f980:	f7dff0ef          	jal	ra,8000f8fc <__sfputc_r>
8000f984:	00140413          	addi	s0,s0,1
8000f988:	ff4510e3          	bne	a0,s4,8000f968 <__sfputs_r+0x30>
8000f98c:	01c12083          	lw	ra,28(sp)
8000f990:	01812403          	lw	s0,24(sp)
8000f994:	01412483          	lw	s1,20(sp)
8000f998:	01012903          	lw	s2,16(sp)
8000f99c:	00c12983          	lw	s3,12(sp)
8000f9a0:	00812a03          	lw	s4,8(sp)
8000f9a4:	02010113          	addi	sp,sp,32
8000f9a8:	00008067          	ret

Disassembly of section .text.__sprint_r:

8000f9ac <__sprint_r>:
8000f9ac:	00862703          	lw	a4,8(a2)
8000f9b0:	ff010113          	addi	sp,sp,-16
8000f9b4:	00812423          	sw	s0,8(sp)
8000f9b8:	00112623          	sw	ra,12(sp)
8000f9bc:	00060413          	mv	s0,a2
8000f9c0:	00071e63          	bnez	a4,8000f9dc <__sprint_r+0x30>
8000f9c4:	00062223          	sw	zero,4(a2)
8000f9c8:	00000513          	li	a0,0
8000f9cc:	00c12083          	lw	ra,12(sp)
8000f9d0:	00812403          	lw	s0,8(sp)
8000f9d4:	01010113          	addi	sp,sp,16
8000f9d8:	00008067          	ret
8000f9dc:	0bd000ef          	jal	ra,80010298 <__sfvwrite_r>
8000f9e0:	00042423          	sw	zero,8(s0)
8000f9e4:	00042223          	sw	zero,4(s0)
8000f9e8:	fe5ff06f          	j	8000f9cc <__sprint_r+0x20>

Disassembly of section .text._vfprintf_r:

8000f9ec <_vfiprintf_r>:
8000f9ec:	f6010113          	addi	sp,sp,-160
8000f9f0:	08812c23          	sw	s0,152(sp)
8000f9f4:	08912a23          	sw	s1,148(sp)
8000f9f8:	09212823          	sw	s2,144(sp)
8000f9fc:	09312623          	sw	s3,140(sp)
8000fa00:	08112e23          	sw	ra,156(sp)
8000fa04:	09412423          	sw	s4,136(sp)
8000fa08:	09512223          	sw	s5,132(sp)
8000fa0c:	09612023          	sw	s6,128(sp)
8000fa10:	07712e23          	sw	s7,124(sp)
8000fa14:	07812c23          	sw	s8,120(sp)
8000fa18:	07912a23          	sw	s9,116(sp)
8000fa1c:	00050993          	mv	s3,a0
8000fa20:	00058493          	mv	s1,a1
8000fa24:	00060913          	mv	s2,a2
8000fa28:	00068413          	mv	s0,a3
8000fa2c:	00050863          	beqz	a0,8000fa3c <_vfiprintf_r+0x50>
8000fa30:	01852783          	lw	a5,24(a0)
8000fa34:	00079463          	bnez	a5,8000fa3c <_vfiprintf_r+0x50>
8000fa38:	b04fe0ef          	jal	ra,8000dd3c <__sinit>
8000fa3c:	ffff3797          	auipc	a5,0xffff3
8000fa40:	3f878793          	addi	a5,a5,1016 # 80002e34 <__sf_fake_stdin>
8000fa44:	12f49263          	bne	s1,a5,8000fb68 <_vfiprintf_r+0x17c>
8000fa48:	0049a483          	lw	s1,4(s3)
8000fa4c:	00c4d783          	lhu	a5,12(s1)
8000fa50:	0087f793          	andi	a5,a5,8
8000fa54:	12078e63          	beqz	a5,8000fb90 <_vfiprintf_r+0x1a4>
8000fa58:	0104a783          	lw	a5,16(s1)
8000fa5c:	12078a63          	beqz	a5,8000fb90 <_vfiprintf_r+0x1a4>
8000fa60:	02000793          	li	a5,32
8000fa64:	02f104a3          	sb	a5,41(sp)
8000fa68:	03000793          	li	a5,48
8000fa6c:	02012223          	sw	zero,36(sp)
8000fa70:	02f10523          	sb	a5,42(sp)
8000fa74:	00812623          	sw	s0,12(sp)
8000fa78:	02500b13          	li	s6,37
8000fa7c:	ffff3a97          	auipc	s5,0xffff3
8000fa80:	3f8a8a93          	addi	s5,s5,1016 # 80002e74 <__sf_fake_stdout+0x20>
8000fa84:	00100b93          	li	s7,1
8000fa88:	7fff0c17          	auipc	s8,0x7fff0
8000fa8c:	578c0c13          	addi	s8,s8,1400 # 0 <_heap_end+0x7ffee000>
8000fa90:	00090413          	mv	s0,s2
8000fa94:	00044783          	lbu	a5,0(s0)
8000fa98:	00078463          	beqz	a5,8000faa0 <_vfiprintf_r+0xb4>
8000fa9c:	13679e63          	bne	a5,s6,8000fbd8 <_vfiprintf_r+0x1ec>
8000faa0:	41240cb3          	sub	s9,s0,s2
8000faa4:	020c8663          	beqz	s9,8000fad0 <_vfiprintf_r+0xe4>
8000faa8:	000c8693          	mv	a3,s9
8000faac:	00090613          	mv	a2,s2
8000fab0:	00048593          	mv	a1,s1
8000fab4:	00098513          	mv	a0,s3
8000fab8:	e81ff0ef          	jal	ra,8000f938 <__sfputs_r>
8000fabc:	fff00793          	li	a5,-1
8000fac0:	2cf50663          	beq	a0,a5,8000fd8c <_vfiprintf_r+0x3a0>
8000fac4:	02412683          	lw	a3,36(sp)
8000fac8:	019686b3          	add	a3,a3,s9
8000facc:	02d12223          	sw	a3,36(sp)
8000fad0:	00044783          	lbu	a5,0(s0)
8000fad4:	2a078c63          	beqz	a5,8000fd8c <_vfiprintf_r+0x3a0>
8000fad8:	fff00793          	li	a5,-1
8000fadc:	00140913          	addi	s2,s0,1
8000fae0:	00012823          	sw	zero,16(sp)
8000fae4:	00012e23          	sw	zero,28(sp)
8000fae8:	00f12a23          	sw	a5,20(sp)
8000faec:	00012c23          	sw	zero,24(sp)
8000faf0:	040109a3          	sb	zero,83(sp)
8000faf4:	06012423          	sw	zero,104(sp)
8000faf8:	00094583          	lbu	a1,0(s2)
8000fafc:	00500613          	li	a2,5
8000fb00:	000a8513          	mv	a0,s5
8000fb04:	571000ef          	jal	ra,80010874 <memchr>
8000fb08:	00190413          	addi	s0,s2,1
8000fb0c:	01012783          	lw	a5,16(sp)
8000fb10:	0c051863          	bnez	a0,8000fbe0 <_vfiprintf_r+0x1f4>
8000fb14:	0107f713          	andi	a4,a5,16
8000fb18:	00070663          	beqz	a4,8000fb24 <_vfiprintf_r+0x138>
8000fb1c:	02000713          	li	a4,32
8000fb20:	04e109a3          	sb	a4,83(sp)
8000fb24:	0087f713          	andi	a4,a5,8
8000fb28:	00070663          	beqz	a4,8000fb34 <_vfiprintf_r+0x148>
8000fb2c:	02b00713          	li	a4,43
8000fb30:	04e109a3          	sb	a4,83(sp)
8000fb34:	00094683          	lbu	a3,0(s2)
8000fb38:	02a00713          	li	a4,42
8000fb3c:	0ae68e63          	beq	a3,a4,8000fbf8 <_vfiprintf_r+0x20c>
8000fb40:	01c12703          	lw	a4,28(sp)
8000fb44:	00090413          	mv	s0,s2
8000fb48:	00000793          	li	a5,0
8000fb4c:	00900613          	li	a2,9
8000fb50:	00044683          	lbu	a3,0(s0)
8000fb54:	00140593          	addi	a1,s0,1
8000fb58:	fd068693          	addi	a3,a3,-48
8000fb5c:	18d67263          	bgeu	a2,a3,8000fce0 <_vfiprintf_r+0x2f4>
8000fb60:	0a079663          	bnez	a5,8000fc0c <_vfiprintf_r+0x220>
8000fb64:	0c00006f          	j	8000fc24 <_vfiprintf_r+0x238>
8000fb68:	ffff3797          	auipc	a5,0xffff3
8000fb6c:	2ec78793          	addi	a5,a5,748 # 80002e54 <__sf_fake_stdout>
8000fb70:	00f49663          	bne	s1,a5,8000fb7c <_vfiprintf_r+0x190>
8000fb74:	0089a483          	lw	s1,8(s3)
8000fb78:	ed5ff06f          	j	8000fa4c <_vfiprintf_r+0x60>
8000fb7c:	ffff3797          	auipc	a5,0xffff3
8000fb80:	29878793          	addi	a5,a5,664 # 80002e14 <__sf_fake_stderr>
8000fb84:	ecf494e3          	bne	s1,a5,8000fa4c <_vfiprintf_r+0x60>
8000fb88:	00c9a483          	lw	s1,12(s3)
8000fb8c:	ec1ff06f          	j	8000fa4c <_vfiprintf_r+0x60>
8000fb90:	00048593          	mv	a1,s1
8000fb94:	00098513          	mv	a0,s3
8000fb98:	584000ef          	jal	ra,8001011c <__swsetup_r>
8000fb9c:	ec0502e3          	beqz	a0,8000fa60 <_vfiprintf_r+0x74>
8000fba0:	fff00513          	li	a0,-1
8000fba4:	09c12083          	lw	ra,156(sp)
8000fba8:	09812403          	lw	s0,152(sp)
8000fbac:	09412483          	lw	s1,148(sp)
8000fbb0:	09012903          	lw	s2,144(sp)
8000fbb4:	08c12983          	lw	s3,140(sp)
8000fbb8:	08812a03          	lw	s4,136(sp)
8000fbbc:	08412a83          	lw	s5,132(sp)
8000fbc0:	08012b03          	lw	s6,128(sp)
8000fbc4:	07c12b83          	lw	s7,124(sp)
8000fbc8:	07812c03          	lw	s8,120(sp)
8000fbcc:	07412c83          	lw	s9,116(sp)
8000fbd0:	0a010113          	addi	sp,sp,160
8000fbd4:	00008067          	ret
8000fbd8:	00140413          	addi	s0,s0,1
8000fbdc:	eb9ff06f          	j	8000fa94 <_vfiprintf_r+0xa8>
8000fbe0:	41550533          	sub	a0,a0,s5
8000fbe4:	00ab9533          	sll	a0,s7,a0
8000fbe8:	00a7e7b3          	or	a5,a5,a0
8000fbec:	00f12823          	sw	a5,16(sp)
8000fbf0:	00040913          	mv	s2,s0
8000fbf4:	f05ff06f          	j	8000faf8 <_vfiprintf_r+0x10c>
8000fbf8:	00c12703          	lw	a4,12(sp)
8000fbfc:	00470693          	addi	a3,a4,4
8000fc00:	00072703          	lw	a4,0(a4)
8000fc04:	00d12623          	sw	a3,12(sp)
8000fc08:	00074663          	bltz	a4,8000fc14 <_vfiprintf_r+0x228>
8000fc0c:	00e12e23          	sw	a4,28(sp)
8000fc10:	0140006f          	j	8000fc24 <_vfiprintf_r+0x238>
8000fc14:	40e00733          	neg	a4,a4
8000fc18:	0027e793          	ori	a5,a5,2
8000fc1c:	00e12e23          	sw	a4,28(sp)
8000fc20:	00f12823          	sw	a5,16(sp)
8000fc24:	00044703          	lbu	a4,0(s0)
8000fc28:	02e00793          	li	a5,46
8000fc2c:	02f71663          	bne	a4,a5,8000fc58 <_vfiprintf_r+0x26c>
8000fc30:	00144703          	lbu	a4,1(s0)
8000fc34:	02a00793          	li	a5,42
8000fc38:	0cf71663          	bne	a4,a5,8000fd04 <_vfiprintf_r+0x318>
8000fc3c:	00c12783          	lw	a5,12(sp)
8000fc40:	00240413          	addi	s0,s0,2
8000fc44:	00478713          	addi	a4,a5,4
8000fc48:	0007a783          	lw	a5,0(a5)
8000fc4c:	00e12623          	sw	a4,12(sp)
8000fc50:	0a07c663          	bltz	a5,8000fcfc <_vfiprintf_r+0x310>
8000fc54:	00f12a23          	sw	a5,20(sp)
8000fc58:	00044583          	lbu	a1,0(s0)
8000fc5c:	00300613          	li	a2,3
8000fc60:	ffff3517          	auipc	a0,0xffff3
8000fc64:	21c50513          	addi	a0,a0,540 # 80002e7c <__sf_fake_stdout+0x28>
8000fc68:	40d000ef          	jal	ra,80010874 <memchr>
8000fc6c:	02050463          	beqz	a0,8000fc94 <_vfiprintf_r+0x2a8>
8000fc70:	ffff3797          	auipc	a5,0xffff3
8000fc74:	20c78793          	addi	a5,a5,524 # 80002e7c <__sf_fake_stdout+0x28>
8000fc78:	40f50533          	sub	a0,a0,a5
8000fc7c:	04000793          	li	a5,64
8000fc80:	00a797b3          	sll	a5,a5,a0
8000fc84:	01012503          	lw	a0,16(sp)
8000fc88:	00140413          	addi	s0,s0,1
8000fc8c:	00f56533          	or	a0,a0,a5
8000fc90:	00a12823          	sw	a0,16(sp)
8000fc94:	00044583          	lbu	a1,0(s0)
8000fc98:	00600613          	li	a2,6
8000fc9c:	ffff3517          	auipc	a0,0xffff3
8000fca0:	1e450513          	addi	a0,a0,484 # 80002e80 <__sf_fake_stdout+0x2c>
8000fca4:	00140913          	addi	s2,s0,1
8000fca8:	02b10423          	sb	a1,40(sp)
8000fcac:	3c9000ef          	jal	ra,80010874 <memchr>
8000fcb0:	0e050863          	beqz	a0,8000fda0 <_vfiprintf_r+0x3b4>
8000fcb4:	0a0c1663          	bnez	s8,8000fd60 <_vfiprintf_r+0x374>
8000fcb8:	01012703          	lw	a4,16(sp)
8000fcbc:	00c12783          	lw	a5,12(sp)
8000fcc0:	10077713          	andi	a4,a4,256
8000fcc4:	08070663          	beqz	a4,8000fd50 <_vfiprintf_r+0x364>
8000fcc8:	00478793          	addi	a5,a5,4
8000fccc:	00f12623          	sw	a5,12(sp)
8000fcd0:	02412783          	lw	a5,36(sp)
8000fcd4:	014787b3          	add	a5,a5,s4
8000fcd8:	02f12223          	sw	a5,36(sp)
8000fcdc:	db5ff06f          	j	8000fa90 <_vfiprintf_r+0xa4>
8000fce0:	00271793          	slli	a5,a4,0x2
8000fce4:	00e787b3          	add	a5,a5,a4
8000fce8:	00179793          	slli	a5,a5,0x1
8000fcec:	00d78733          	add	a4,a5,a3
8000fcf0:	00058413          	mv	s0,a1
8000fcf4:	00100793          	li	a5,1
8000fcf8:	e59ff06f          	j	8000fb50 <_vfiprintf_r+0x164>
8000fcfc:	fff00793          	li	a5,-1
8000fd00:	f55ff06f          	j	8000fc54 <_vfiprintf_r+0x268>
8000fd04:	00140413          	addi	s0,s0,1
8000fd08:	00012a23          	sw	zero,20(sp)
8000fd0c:	00000793          	li	a5,0
8000fd10:	00000713          	li	a4,0
8000fd14:	00900613          	li	a2,9
8000fd18:	00044683          	lbu	a3,0(s0)
8000fd1c:	00140593          	addi	a1,s0,1
8000fd20:	fd068693          	addi	a3,a3,-48
8000fd24:	00d67863          	bgeu	a2,a3,8000fd34 <_vfiprintf_r+0x348>
8000fd28:	f20788e3          	beqz	a5,8000fc58 <_vfiprintf_r+0x26c>
8000fd2c:	00e12a23          	sw	a4,20(sp)
8000fd30:	f29ff06f          	j	8000fc58 <_vfiprintf_r+0x26c>
8000fd34:	00271793          	slli	a5,a4,0x2
8000fd38:	00e787b3          	add	a5,a5,a4
8000fd3c:	00179793          	slli	a5,a5,0x1
8000fd40:	00d78733          	add	a4,a5,a3
8000fd44:	00058413          	mv	s0,a1
8000fd48:	00100793          	li	a5,1
8000fd4c:	fcdff06f          	j	8000fd18 <_vfiprintf_r+0x32c>
8000fd50:	00778793          	addi	a5,a5,7
8000fd54:	ff87f793          	andi	a5,a5,-8
8000fd58:	00878793          	addi	a5,a5,8
8000fd5c:	f71ff06f          	j	8000fccc <_vfiprintf_r+0x2e0>
8000fd60:	00c10713          	addi	a4,sp,12
8000fd64:	00000697          	auipc	a3,0x0
8000fd68:	bd468693          	addi	a3,a3,-1068 # 8000f938 <__sfputs_r>
8000fd6c:	00048613          	mv	a2,s1
8000fd70:	01010593          	addi	a1,sp,16
8000fd74:	00098513          	mv	a0,s3
8000fd78:	00000097          	auipc	ra,0x0
8000fd7c:	000000e7          	jalr	zero # 0 <_heap_size>
8000fd80:	fff00793          	li	a5,-1
8000fd84:	00050a13          	mv	s4,a0
8000fd88:	f4f514e3          	bne	a0,a5,8000fcd0 <_vfiprintf_r+0x2e4>
8000fd8c:	00c4d783          	lhu	a5,12(s1)
8000fd90:	0407f793          	andi	a5,a5,64
8000fd94:	e00796e3          	bnez	a5,8000fba0 <_vfiprintf_r+0x1b4>
8000fd98:	02412503          	lw	a0,36(sp)
8000fd9c:	e09ff06f          	j	8000fba4 <_vfiprintf_r+0x1b8>
8000fda0:	00c10713          	addi	a4,sp,12
8000fda4:	00000697          	auipc	a3,0x0
8000fda8:	b9468693          	addi	a3,a3,-1132 # 8000f938 <__sfputs_r>
8000fdac:	00048613          	mv	a2,s1
8000fdb0:	01010593          	addi	a1,sp,16
8000fdb4:	00098513          	mv	a0,s3
8000fdb8:	f68ff0ef          	jal	ra,8000f520 <_printf_i>
8000fdbc:	fc5ff06f          	j	8000fd80 <_vfiprintf_r+0x394>

Disassembly of section .text.vfprintf:

8000fdc0 <vfiprintf>:
8000fdc0:	80c18793          	addi	a5,gp,-2036 # 8000304c <_impure_ptr>
8000fdc4:	00060693          	mv	a3,a2
8000fdc8:	00058613          	mv	a2,a1
8000fdcc:	00050593          	mv	a1,a0
8000fdd0:	0007a503          	lw	a0,0(a5)
8000fdd4:	c19ff06f          	j	8000f9ec <_vfiprintf_r>

Disassembly of section .text._read_r:

8000fdd8 <_read_r>:
8000fdd8:	ff010113          	addi	sp,sp,-16
8000fddc:	00812423          	sw	s0,8(sp)
8000fde0:	00050413          	mv	s0,a0
8000fde4:	00058513          	mv	a0,a1
8000fde8:	00060593          	mv	a1,a2
8000fdec:	00068613          	mv	a2,a3
8000fdf0:	c401a223          	sw	zero,-956(gp) # 80003484 <errno>
8000fdf4:	00112623          	sw	ra,12(sp)
8000fdf8:	f41f50ef          	jal	ra,80005d38 <_read>
8000fdfc:	fff00793          	li	a5,-1
8000fe00:	00f51a63          	bne	a0,a5,8000fe14 <_read_r+0x3c>
8000fe04:	c4418793          	addi	a5,gp,-956 # 80003484 <errno>
8000fe08:	0007a783          	lw	a5,0(a5)
8000fe0c:	00078463          	beqz	a5,8000fe14 <_read_r+0x3c>
8000fe10:	00f42023          	sw	a5,0(s0)
8000fe14:	00c12083          	lw	ra,12(sp)
8000fe18:	00812403          	lw	s0,8(sp)
8000fe1c:	01010113          	addi	sp,sp,16
8000fe20:	00008067          	ret

Disassembly of section .text.cleanup_glue:

8000fe24 <cleanup_glue>:
8000fe24:	ff010113          	addi	sp,sp,-16
8000fe28:	00812423          	sw	s0,8(sp)
8000fe2c:	00058413          	mv	s0,a1
8000fe30:	0005a583          	lw	a1,0(a1)
8000fe34:	00912223          	sw	s1,4(sp)
8000fe38:	00112623          	sw	ra,12(sp)
8000fe3c:	00050493          	mv	s1,a0
8000fe40:	00058463          	beqz	a1,8000fe48 <cleanup_glue+0x24>
8000fe44:	fe1ff0ef          	jal	ra,8000fe24 <cleanup_glue>
8000fe48:	00040593          	mv	a1,s0
8000fe4c:	00812403          	lw	s0,8(sp)
8000fe50:	00c12083          	lw	ra,12(sp)
8000fe54:	00048513          	mv	a0,s1
8000fe58:	00412483          	lw	s1,4(sp)
8000fe5c:	01010113          	addi	sp,sp,16
8000fe60:	bdcfe06f          	j	8000e23c <_free_r>

Disassembly of section .text._reclaim_reent:

8000fe64 <_reclaim_reent>:
8000fe64:	80c18793          	addi	a5,gp,-2036 # 8000304c <_impure_ptr>
8000fe68:	0007a783          	lw	a5,0(a5)
8000fe6c:	16a78063          	beq	a5,a0,8000ffcc <_reclaim_reent+0x168>
8000fe70:	02452783          	lw	a5,36(a0)
8000fe74:	fe010113          	addi	sp,sp,-32
8000fe78:	00812c23          	sw	s0,24(sp)
8000fe7c:	00112e23          	sw	ra,28(sp)
8000fe80:	00912a23          	sw	s1,20(sp)
8000fe84:	01212823          	sw	s2,16(sp)
8000fe88:	01312623          	sw	s3,12(sp)
8000fe8c:	00050413          	mv	s0,a0
8000fe90:	02078463          	beqz	a5,8000feb8 <_reclaim_reent+0x54>
8000fe94:	00c7a783          	lw	a5,12(a5)
8000fe98:	00000493          	li	s1,0
8000fe9c:	08000913          	li	s2,128
8000fea0:	0e079263          	bnez	a5,8000ff84 <_reclaim_reent+0x120>
8000fea4:	02442783          	lw	a5,36(s0)
8000fea8:	0007a583          	lw	a1,0(a5)
8000feac:	00058663          	beqz	a1,8000feb8 <_reclaim_reent+0x54>
8000feb0:	00040513          	mv	a0,s0
8000feb4:	b88fe0ef          	jal	ra,8000e23c <_free_r>
8000feb8:	01442583          	lw	a1,20(s0)
8000febc:	00058663          	beqz	a1,8000fec8 <_reclaim_reent+0x64>
8000fec0:	00040513          	mv	a0,s0
8000fec4:	b78fe0ef          	jal	ra,8000e23c <_free_r>
8000fec8:	02442583          	lw	a1,36(s0)
8000fecc:	00058663          	beqz	a1,8000fed8 <_reclaim_reent+0x74>
8000fed0:	00040513          	mv	a0,s0
8000fed4:	b68fe0ef          	jal	ra,8000e23c <_free_r>
8000fed8:	03842583          	lw	a1,56(s0)
8000fedc:	00058663          	beqz	a1,8000fee8 <_reclaim_reent+0x84>
8000fee0:	00040513          	mv	a0,s0
8000fee4:	b58fe0ef          	jal	ra,8000e23c <_free_r>
8000fee8:	03c42583          	lw	a1,60(s0)
8000feec:	00058663          	beqz	a1,8000fef8 <_reclaim_reent+0x94>
8000fef0:	00040513          	mv	a0,s0
8000fef4:	b48fe0ef          	jal	ra,8000e23c <_free_r>
8000fef8:	04042583          	lw	a1,64(s0)
8000fefc:	00058663          	beqz	a1,8000ff08 <_reclaim_reent+0xa4>
8000ff00:	00040513          	mv	a0,s0
8000ff04:	b38fe0ef          	jal	ra,8000e23c <_free_r>
8000ff08:	05c42583          	lw	a1,92(s0)
8000ff0c:	00058663          	beqz	a1,8000ff18 <_reclaim_reent+0xb4>
8000ff10:	00040513          	mv	a0,s0
8000ff14:	b28fe0ef          	jal	ra,8000e23c <_free_r>
8000ff18:	05842583          	lw	a1,88(s0)
8000ff1c:	00058663          	beqz	a1,8000ff28 <_reclaim_reent+0xc4>
8000ff20:	00040513          	mv	a0,s0
8000ff24:	b18fe0ef          	jal	ra,8000e23c <_free_r>
8000ff28:	03442583          	lw	a1,52(s0)
8000ff2c:	00058663          	beqz	a1,8000ff38 <_reclaim_reent+0xd4>
8000ff30:	00040513          	mv	a0,s0
8000ff34:	b08fe0ef          	jal	ra,8000e23c <_free_r>
8000ff38:	01842783          	lw	a5,24(s0)
8000ff3c:	06078a63          	beqz	a5,8000ffb0 <_reclaim_reent+0x14c>
8000ff40:	02842783          	lw	a5,40(s0)
8000ff44:	00040513          	mv	a0,s0
8000ff48:	000780e7          	jalr	a5
8000ff4c:	04842583          	lw	a1,72(s0)
8000ff50:	06058063          	beqz	a1,8000ffb0 <_reclaim_reent+0x14c>
8000ff54:	00040513          	mv	a0,s0
8000ff58:	01812403          	lw	s0,24(sp)
8000ff5c:	01c12083          	lw	ra,28(sp)
8000ff60:	01412483          	lw	s1,20(sp)
8000ff64:	01012903          	lw	s2,16(sp)
8000ff68:	00c12983          	lw	s3,12(sp)
8000ff6c:	02010113          	addi	sp,sp,32
8000ff70:	eb5ff06f          	j	8000fe24 <cleanup_glue>
8000ff74:	009585b3          	add	a1,a1,s1
8000ff78:	0005a583          	lw	a1,0(a1)
8000ff7c:	02059063          	bnez	a1,8000ff9c <_reclaim_reent+0x138>
8000ff80:	00448493          	addi	s1,s1,4
8000ff84:	02442783          	lw	a5,36(s0)
8000ff88:	00c7a583          	lw	a1,12(a5)
8000ff8c:	ff2494e3          	bne	s1,s2,8000ff74 <_reclaim_reent+0x110>
8000ff90:	00040513          	mv	a0,s0
8000ff94:	aa8fe0ef          	jal	ra,8000e23c <_free_r>
8000ff98:	f0dff06f          	j	8000fea4 <_reclaim_reent+0x40>
8000ff9c:	0005a983          	lw	s3,0(a1)
8000ffa0:	00040513          	mv	a0,s0
8000ffa4:	a98fe0ef          	jal	ra,8000e23c <_free_r>
8000ffa8:	00098593          	mv	a1,s3
8000ffac:	fd1ff06f          	j	8000ff7c <_reclaim_reent+0x118>
8000ffb0:	01c12083          	lw	ra,28(sp)
8000ffb4:	01812403          	lw	s0,24(sp)
8000ffb8:	01412483          	lw	s1,20(sp)
8000ffbc:	01012903          	lw	s2,16(sp)
8000ffc0:	00c12983          	lw	s3,12(sp)
8000ffc4:	02010113          	addi	sp,sp,32
8000ffc8:	00008067          	ret
8000ffcc:	00008067          	ret

Disassembly of section .text.__swbuf_r:

8000ffd0 <__swbuf_r>:
8000ffd0:	fe010113          	addi	sp,sp,-32
8000ffd4:	00812c23          	sw	s0,24(sp)
8000ffd8:	00912a23          	sw	s1,20(sp)
8000ffdc:	01212823          	sw	s2,16(sp)
8000ffe0:	00112e23          	sw	ra,28(sp)
8000ffe4:	01312623          	sw	s3,12(sp)
8000ffe8:	00050493          	mv	s1,a0
8000ffec:	00058913          	mv	s2,a1
8000fff0:	00060413          	mv	s0,a2
8000fff4:	00050863          	beqz	a0,80010004 <__swbuf_r+0x34>
8000fff8:	01852783          	lw	a5,24(a0)
8000fffc:	00079463          	bnez	a5,80010004 <__swbuf_r+0x34>
80010000:	d3dfd0ef          	jal	ra,8000dd3c <__sinit>
80010004:	ffff3797          	auipc	a5,0xffff3
80010008:	e3078793          	addi	a5,a5,-464 # 80002e34 <__sf_fake_stdin>
8001000c:	0af41e63          	bne	s0,a5,800100c8 <__swbuf_r+0xf8>
80010010:	0044a403          	lw	s0,4(s1)
80010014:	01842783          	lw	a5,24(s0)
80010018:	00f42423          	sw	a5,8(s0)
8001001c:	00c45783          	lhu	a5,12(s0)
80010020:	0087f793          	andi	a5,a5,8
80010024:	0c078663          	beqz	a5,800100f0 <__swbuf_r+0x120>
80010028:	01042783          	lw	a5,16(s0)
8001002c:	0c078263          	beqz	a5,800100f0 <__swbuf_r+0x120>
80010030:	01042783          	lw	a5,16(s0)
80010034:	00042503          	lw	a0,0(s0)
80010038:	0ff97993          	andi	s3,s2,255
8001003c:	0ff97913          	andi	s2,s2,255
80010040:	40f50533          	sub	a0,a0,a5
80010044:	01442783          	lw	a5,20(s0)
80010048:	00f54a63          	blt	a0,a5,8001005c <__swbuf_r+0x8c>
8001004c:	00040593          	mv	a1,s0
80010050:	00048513          	mv	a0,s1
80010054:	af9fd0ef          	jal	ra,8000db4c <_fflush_r>
80010058:	0a051463          	bnez	a0,80010100 <__swbuf_r+0x130>
8001005c:	00842783          	lw	a5,8(s0)
80010060:	00150513          	addi	a0,a0,1
80010064:	fff78793          	addi	a5,a5,-1
80010068:	00f42423          	sw	a5,8(s0)
8001006c:	00042783          	lw	a5,0(s0)
80010070:	00178713          	addi	a4,a5,1
80010074:	00e42023          	sw	a4,0(s0)
80010078:	01378023          	sb	s3,0(a5)
8001007c:	01442783          	lw	a5,20(s0)
80010080:	00a78c63          	beq	a5,a0,80010098 <__swbuf_r+0xc8>
80010084:	00c45783          	lhu	a5,12(s0)
80010088:	0017f793          	andi	a5,a5,1
8001008c:	00078e63          	beqz	a5,800100a8 <__swbuf_r+0xd8>
80010090:	00a00793          	li	a5,10
80010094:	00f91a63          	bne	s2,a5,800100a8 <__swbuf_r+0xd8>
80010098:	00040593          	mv	a1,s0
8001009c:	00048513          	mv	a0,s1
800100a0:	aadfd0ef          	jal	ra,8000db4c <_fflush_r>
800100a4:	04051e63          	bnez	a0,80010100 <__swbuf_r+0x130>
800100a8:	01c12083          	lw	ra,28(sp)
800100ac:	01812403          	lw	s0,24(sp)
800100b0:	00090513          	mv	a0,s2
800100b4:	01412483          	lw	s1,20(sp)
800100b8:	01012903          	lw	s2,16(sp)
800100bc:	00c12983          	lw	s3,12(sp)
800100c0:	02010113          	addi	sp,sp,32
800100c4:	00008067          	ret
800100c8:	ffff3797          	auipc	a5,0xffff3
800100cc:	d8c78793          	addi	a5,a5,-628 # 80002e54 <__sf_fake_stdout>
800100d0:	00f41663          	bne	s0,a5,800100dc <__swbuf_r+0x10c>
800100d4:	0084a403          	lw	s0,8(s1)
800100d8:	f3dff06f          	j	80010014 <__swbuf_r+0x44>
800100dc:	ffff3797          	auipc	a5,0xffff3
800100e0:	d3878793          	addi	a5,a5,-712 # 80002e14 <__sf_fake_stderr>
800100e4:	f2f418e3          	bne	s0,a5,80010014 <__swbuf_r+0x44>
800100e8:	00c4a403          	lw	s0,12(s1)
800100ec:	f29ff06f          	j	80010014 <__swbuf_r+0x44>
800100f0:	00040593          	mv	a1,s0
800100f4:	00048513          	mv	a0,s1
800100f8:	024000ef          	jal	ra,8001011c <__swsetup_r>
800100fc:	f2050ae3          	beqz	a0,80010030 <__swbuf_r+0x60>
80010100:	fff00913          	li	s2,-1
80010104:	fa5ff06f          	j	800100a8 <__swbuf_r+0xd8>

Disassembly of section .text.__swbuf:

80010108 <__swbuf>:
80010108:	80c18793          	addi	a5,gp,-2036 # 8000304c <_impure_ptr>
8001010c:	00058613          	mv	a2,a1
80010110:	00050593          	mv	a1,a0
80010114:	0007a503          	lw	a0,0(a5)
80010118:	eb9ff06f          	j	8000ffd0 <__swbuf_r>

Disassembly of section .text.__swsetup_r:

8001011c <__swsetup_r>:
8001011c:	ff010113          	addi	sp,sp,-16
80010120:	80c18793          	addi	a5,gp,-2036 # 8000304c <_impure_ptr>
80010124:	00912223          	sw	s1,4(sp)
80010128:	0007a483          	lw	s1,0(a5)
8001012c:	00812423          	sw	s0,8(sp)
80010130:	01212023          	sw	s2,0(sp)
80010134:	00112623          	sw	ra,12(sp)
80010138:	00050913          	mv	s2,a0
8001013c:	00058413          	mv	s0,a1
80010140:	00048a63          	beqz	s1,80010154 <__swsetup_r+0x38>
80010144:	0184a783          	lw	a5,24(s1)
80010148:	00079663          	bnez	a5,80010154 <__swsetup_r+0x38>
8001014c:	00048513          	mv	a0,s1
80010150:	bedfd0ef          	jal	ra,8000dd3c <__sinit>
80010154:	ffff3797          	auipc	a5,0xffff3
80010158:	ce078793          	addi	a5,a5,-800 # 80002e34 <__sf_fake_stdin>
8001015c:	04f41863          	bne	s0,a5,800101ac <__swsetup_r+0x90>
80010160:	0044a403          	lw	s0,4(s1)
80010164:	00c41703          	lh	a4,12(s0)
80010168:	01071793          	slli	a5,a4,0x10
8001016c:	0107d793          	srli	a5,a5,0x10
80010170:	0087f693          	andi	a3,a5,8
80010174:	0a069463          	bnez	a3,8001021c <__swsetup_r+0x100>
80010178:	0107f693          	andi	a3,a5,16
8001017c:	04069c63          	bnez	a3,800101d4 <__swsetup_r+0xb8>
80010180:	00900793          	li	a5,9
80010184:	00f92023          	sw	a5,0(s2)
80010188:	04076713          	ori	a4,a4,64
8001018c:	00e41623          	sh	a4,12(s0)
80010190:	fff00513          	li	a0,-1
80010194:	00c12083          	lw	ra,12(sp)
80010198:	00812403          	lw	s0,8(sp)
8001019c:	00412483          	lw	s1,4(sp)
800101a0:	00012903          	lw	s2,0(sp)
800101a4:	01010113          	addi	sp,sp,16
800101a8:	00008067          	ret
800101ac:	ffff3797          	auipc	a5,0xffff3
800101b0:	ca878793          	addi	a5,a5,-856 # 80002e54 <__sf_fake_stdout>
800101b4:	00f41663          	bne	s0,a5,800101c0 <__swsetup_r+0xa4>
800101b8:	0084a403          	lw	s0,8(s1)
800101bc:	fa9ff06f          	j	80010164 <__swsetup_r+0x48>
800101c0:	ffff3797          	auipc	a5,0xffff3
800101c4:	c5478793          	addi	a5,a5,-940 # 80002e14 <__sf_fake_stderr>
800101c8:	f8f41ee3          	bne	s0,a5,80010164 <__swsetup_r+0x48>
800101cc:	00c4a403          	lw	s0,12(s1)
800101d0:	f95ff06f          	j	80010164 <__swsetup_r+0x48>
800101d4:	0047f793          	andi	a5,a5,4
800101d8:	02078c63          	beqz	a5,80010210 <__swsetup_r+0xf4>
800101dc:	03442583          	lw	a1,52(s0)
800101e0:	00058c63          	beqz	a1,800101f8 <__swsetup_r+0xdc>
800101e4:	04440793          	addi	a5,s0,68
800101e8:	00f58663          	beq	a1,a5,800101f4 <__swsetup_r+0xd8>
800101ec:	00090513          	mv	a0,s2
800101f0:	84cfe0ef          	jal	ra,8000e23c <_free_r>
800101f4:	02042a23          	sw	zero,52(s0)
800101f8:	00c45783          	lhu	a5,12(s0)
800101fc:	00042223          	sw	zero,4(s0)
80010200:	fdb7f793          	andi	a5,a5,-37
80010204:	00f41623          	sh	a5,12(s0)
80010208:	01042783          	lw	a5,16(s0)
8001020c:	00f42023          	sw	a5,0(s0)
80010210:	00c45783          	lhu	a5,12(s0)
80010214:	0087e793          	ori	a5,a5,8
80010218:	00f41623          	sh	a5,12(s0)
8001021c:	01042783          	lw	a5,16(s0)
80010220:	02079063          	bnez	a5,80010240 <__swsetup_r+0x124>
80010224:	00c45783          	lhu	a5,12(s0)
80010228:	20000713          	li	a4,512
8001022c:	2807f793          	andi	a5,a5,640
80010230:	00e78863          	beq	a5,a4,80010240 <__swsetup_r+0x124>
80010234:	00040593          	mv	a1,s0
80010238:	00090513          	mv	a0,s2
8001023c:	548000ef          	jal	ra,80010784 <__smakebuf_r>
80010240:	00c45783          	lhu	a5,12(s0)
80010244:	0017f713          	andi	a4,a5,1
80010248:	02070c63          	beqz	a4,80010280 <__swsetup_r+0x164>
8001024c:	01442783          	lw	a5,20(s0)
80010250:	00042423          	sw	zero,8(s0)
80010254:	40f007b3          	neg	a5,a5
80010258:	00f42c23          	sw	a5,24(s0)
8001025c:	01042783          	lw	a5,16(s0)
80010260:	00000513          	li	a0,0
80010264:	f20798e3          	bnez	a5,80010194 <__swsetup_r+0x78>
80010268:	00c41783          	lh	a5,12(s0)
8001026c:	0807f713          	andi	a4,a5,128
80010270:	f20702e3          	beqz	a4,80010194 <__swsetup_r+0x78>
80010274:	0407e793          	ori	a5,a5,64
80010278:	00f41623          	sh	a5,12(s0)
8001027c:	f15ff06f          	j	80010190 <__swsetup_r+0x74>
80010280:	0027f793          	andi	a5,a5,2
80010284:	00000713          	li	a4,0
80010288:	00079463          	bnez	a5,80010290 <__swsetup_r+0x174>
8001028c:	01442703          	lw	a4,20(s0)
80010290:	00e42423          	sw	a4,8(s0)
80010294:	fc9ff06f          	j	8001025c <__swsetup_r+0x140>

Disassembly of section .text.__sfvwrite_r:

80010298 <__sfvwrite_r>:
80010298:	00862783          	lw	a5,8(a2)
8001029c:	00079863          	bnez	a5,800102ac <__sfvwrite_r+0x14>
800102a0:	00000793          	li	a5,0
800102a4:	00078513          	mv	a0,a5
800102a8:	00008067          	ret
800102ac:	00c5d783          	lhu	a5,12(a1)
800102b0:	fc010113          	addi	sp,sp,-64
800102b4:	02812c23          	sw	s0,56(sp)
800102b8:	03212823          	sw	s2,48(sp)
800102bc:	03612023          	sw	s6,32(sp)
800102c0:	02112e23          	sw	ra,60(sp)
800102c4:	02912a23          	sw	s1,52(sp)
800102c8:	03312623          	sw	s3,44(sp)
800102cc:	03412423          	sw	s4,40(sp)
800102d0:	03512223          	sw	s5,36(sp)
800102d4:	01712e23          	sw	s7,28(sp)
800102d8:	01812c23          	sw	s8,24(sp)
800102dc:	01912a23          	sw	s9,20(sp)
800102e0:	01a12823          	sw	s10,16(sp)
800102e4:	01b12623          	sw	s11,12(sp)
800102e8:	0087f793          	andi	a5,a5,8
800102ec:	00060b13          	mv	s6,a2
800102f0:	00058413          	mv	s0,a1
800102f4:	00050913          	mv	s2,a0
800102f8:	0e078263          	beqz	a5,800103dc <__sfvwrite_r+0x144>
800102fc:	0105a783          	lw	a5,16(a1)
80010300:	0c078e63          	beqz	a5,800103dc <__sfvwrite_r+0x144>
80010304:	00c45783          	lhu	a5,12(s0)
80010308:	000b2a03          	lw	s4,0(s6)
8001030c:	0027f713          	andi	a4,a5,2
80010310:	16071a63          	bnez	a4,80010484 <__sfvwrite_r+0x1ec>
80010314:	0017f793          	andi	a5,a5,1
80010318:	00000b93          	li	s7,0
8001031c:	20078a63          	beqz	a5,80010530 <__sfvwrite_r+0x298>
80010320:	00000513          	li	a0,0
80010324:	00000a93          	li	s5,0
80010328:	00000993          	li	s3,0
8001032c:	36098463          	beqz	s3,80010694 <__sfvwrite_r+0x3fc>
80010330:	02051263          	bnez	a0,80010354 <__sfvwrite_r+0xbc>
80010334:	00098613          	mv	a2,s3
80010338:	00a00593          	li	a1,10
8001033c:	000a8513          	mv	a0,s5
80010340:	534000ef          	jal	ra,80010874 <memchr>
80010344:	00198b93          	addi	s7,s3,1
80010348:	00050663          	beqz	a0,80010354 <__sfvwrite_r+0xbc>
8001034c:	00150513          	addi	a0,a0,1
80010350:	41550bb3          	sub	s7,a0,s5
80010354:	000b8c13          	mv	s8,s7
80010358:	0179f463          	bgeu	s3,s7,80010360 <__sfvwrite_r+0xc8>
8001035c:	00098c13          	mv	s8,s3
80010360:	00042503          	lw	a0,0(s0)
80010364:	01042783          	lw	a5,16(s0)
80010368:	01442683          	lw	a3,20(s0)
8001036c:	32a7fe63          	bgeu	a5,a0,800106a8 <__sfvwrite_r+0x410>
80010370:	00842483          	lw	s1,8(s0)
80010374:	009684b3          	add	s1,a3,s1
80010378:	3384d863          	bge	s1,s8,800106a8 <__sfvwrite_r+0x410>
8001037c:	000a8593          	mv	a1,s5
80010380:	00048613          	mv	a2,s1
80010384:	e09fd0ef          	jal	ra,8000e18c <memmove>
80010388:	00042783          	lw	a5,0(s0)
8001038c:	00040593          	mv	a1,s0
80010390:	00090513          	mv	a0,s2
80010394:	009787b3          	add	a5,a5,s1
80010398:	00f42023          	sw	a5,0(s0)
8001039c:	fb0fd0ef          	jal	ra,8000db4c <_fflush_r>
800103a0:	16051e63          	bnez	a0,8001051c <__sfvwrite_r+0x284>
800103a4:	409b8bb3          	sub	s7,s7,s1
800103a8:	00100513          	li	a0,1
800103ac:	000b9a63          	bnez	s7,800103c0 <__sfvwrite_r+0x128>
800103b0:	00040593          	mv	a1,s0
800103b4:	00090513          	mv	a0,s2
800103b8:	f94fd0ef          	jal	ra,8000db4c <_fflush_r>
800103bc:	16051063          	bnez	a0,8001051c <__sfvwrite_r+0x284>
800103c0:	008b2783          	lw	a5,8(s6)
800103c4:	009a8ab3          	add	s5,s5,s1
800103c8:	409989b3          	sub	s3,s3,s1
800103cc:	409784b3          	sub	s1,a5,s1
800103d0:	009b2423          	sw	s1,8(s6)
800103d4:	f4049ce3          	bnez	s1,8001032c <__sfvwrite_r+0x94>
800103d8:	0680006f          	j	80010440 <__sfvwrite_r+0x1a8>
800103dc:	00040593          	mv	a1,s0
800103e0:	00090513          	mv	a0,s2
800103e4:	d39ff0ef          	jal	ra,8001011c <__swsetup_r>
800103e8:	fff00793          	li	a5,-1
800103ec:	f0050ce3          	beqz	a0,80010304 <__sfvwrite_r+0x6c>
800103f0:	0540006f          	j	80010444 <__sfvwrite_r+0x1ac>
800103f4:	000a2983          	lw	s3,0(s4)
800103f8:	004a2483          	lw	s1,4(s4)
800103fc:	008a0a13          	addi	s4,s4,8
80010400:	fe048ae3          	beqz	s1,800103f4 <__sfvwrite_r+0x15c>
80010404:	00048693          	mv	a3,s1
80010408:	009af463          	bgeu	s5,s1,80010410 <__sfvwrite_r+0x178>
8001040c:	000a8693          	mv	a3,s5
80010410:	02842783          	lw	a5,40(s0)
80010414:	02042583          	lw	a1,32(s0)
80010418:	00098613          	mv	a2,s3
8001041c:	00090513          	mv	a0,s2
80010420:	000780e7          	jalr	a5
80010424:	0ea05c63          	blez	a0,8001051c <__sfvwrite_r+0x284>
80010428:	008b2783          	lw	a5,8(s6)
8001042c:	00a989b3          	add	s3,s3,a0
80010430:	40a484b3          	sub	s1,s1,a0
80010434:	40a78533          	sub	a0,a5,a0
80010438:	00ab2423          	sw	a0,8(s6)
8001043c:	fc0512e3          	bnez	a0,80010400 <__sfvwrite_r+0x168>
80010440:	00000793          	li	a5,0
80010444:	03c12083          	lw	ra,60(sp)
80010448:	03812403          	lw	s0,56(sp)
8001044c:	03412483          	lw	s1,52(sp)
80010450:	03012903          	lw	s2,48(sp)
80010454:	02c12983          	lw	s3,44(sp)
80010458:	02812a03          	lw	s4,40(sp)
8001045c:	02412a83          	lw	s5,36(sp)
80010460:	02012b03          	lw	s6,32(sp)
80010464:	01c12b83          	lw	s7,28(sp)
80010468:	01812c03          	lw	s8,24(sp)
8001046c:	01412c83          	lw	s9,20(sp)
80010470:	01012d03          	lw	s10,16(sp)
80010474:	00c12d83          	lw	s11,12(sp)
80010478:	00078513          	mv	a0,a5
8001047c:	04010113          	addi	sp,sp,64
80010480:	00008067          	ret
80010484:	80000ab7          	lui	s5,0x80000
80010488:	00000993          	li	s3,0
8001048c:	00000493          	li	s1,0
80010490:	c00aca93          	xori	s5,s5,-1024
80010494:	f6dff06f          	j	80010400 <__sfvwrite_r+0x168>
80010498:	000a2b83          	lw	s7,0(s4)
8001049c:	004a2483          	lw	s1,4(s4)
800104a0:	008a0a13          	addi	s4,s4,8
800104a4:	fe048ae3          	beqz	s1,80010498 <__sfvwrite_r+0x200>
800104a8:	00c45783          	lhu	a5,12(s0)
800104ac:	00842d83          	lw	s11,8(s0)
800104b0:	00042503          	lw	a0,0(s0)
800104b4:	2007f713          	andi	a4,a5,512
800104b8:	14070263          	beqz	a4,800105fc <__sfvwrite_r+0x364>
800104bc:	0db4e063          	bltu	s1,s11,8001057c <__sfvwrite_r+0x2e4>
800104c0:	4807f713          	andi	a4,a5,1152
800104c4:	0a070c63          	beqz	a4,8001057c <__sfvwrite_r+0x2e4>
800104c8:	01442703          	lw	a4,20(s0)
800104cc:	01042583          	lw	a1,16(s0)
800104d0:	00171a93          	slli	s5,a4,0x1
800104d4:	00ea8733          	add	a4,s5,a4
800104d8:	01f75a93          	srli	s5,a4,0x1f
800104dc:	40b50d33          	sub	s10,a0,a1
800104e0:	00ea8ab3          	add	s5,s5,a4
800104e4:	001d0713          	addi	a4,s10,1
800104e8:	401ada93          	srai	s5,s5,0x1
800104ec:	00970733          	add	a4,a4,s1
800104f0:	00eaf463          	bgeu	s5,a4,800104f8 <__sfvwrite_r+0x260>
800104f4:	00070a93          	mv	s5,a4
800104f8:	4007f793          	andi	a5,a5,1024
800104fc:	0c078863          	beqz	a5,800105cc <__sfvwrite_r+0x334>
80010500:	000a8593          	mv	a1,s5
80010504:	00090513          	mv	a0,s2
80010508:	e39fd0ef          	jal	ra,8000e340 <_malloc_r>
8001050c:	00050993          	mv	s3,a0
80010510:	02051a63          	bnez	a0,80010544 <__sfvwrite_r+0x2ac>
80010514:	00c00793          	li	a5,12
80010518:	00f92023          	sw	a5,0(s2)
8001051c:	00c45783          	lhu	a5,12(s0)
80010520:	0407e793          	ori	a5,a5,64
80010524:	00f41623          	sh	a5,12(s0)
80010528:	fff00793          	li	a5,-1
8001052c:	f19ff06f          	j	80010444 <__sfvwrite_r+0x1ac>
80010530:	80000c37          	lui	s8,0x80000
80010534:	ffec4c93          	xori	s9,s8,-2
80010538:	00000493          	li	s1,0
8001053c:	fffc4c13          	not	s8,s8
80010540:	f65ff06f          	j	800104a4 <__sfvwrite_r+0x20c>
80010544:	01042583          	lw	a1,16(s0)
80010548:	000d0613          	mv	a2,s10
8001054c:	b69fd0ef          	jal	ra,8000e0b4 <memcpy>
80010550:	00c45783          	lhu	a5,12(s0)
80010554:	b7f7f793          	andi	a5,a5,-1153
80010558:	0807e793          	ori	a5,a5,128
8001055c:	00f41623          	sh	a5,12(s0)
80010560:	01342823          	sw	s3,16(s0)
80010564:	01542a23          	sw	s5,20(s0)
80010568:	01a989b3          	add	s3,s3,s10
8001056c:	41aa8ab3          	sub	s5,s5,s10
80010570:	01342023          	sw	s3,0(s0)
80010574:	00048d93          	mv	s11,s1
80010578:	01542423          	sw	s5,8(s0)
8001057c:	00048993          	mv	s3,s1
80010580:	01b4f463          	bgeu	s1,s11,80010588 <__sfvwrite_r+0x2f0>
80010584:	00048d93          	mv	s11,s1
80010588:	00042503          	lw	a0,0(s0)
8001058c:	000d8613          	mv	a2,s11
80010590:	000b8593          	mv	a1,s7
80010594:	bf9fd0ef          	jal	ra,8000e18c <memmove>
80010598:	00842783          	lw	a5,8(s0)
8001059c:	41b787b3          	sub	a5,a5,s11
800105a0:	00f42423          	sw	a5,8(s0)
800105a4:	00042783          	lw	a5,0(s0)
800105a8:	01b78db3          	add	s11,a5,s11
800105ac:	01b42023          	sw	s11,0(s0)
800105b0:	008b2783          	lw	a5,8(s6)
800105b4:	013b8bb3          	add	s7,s7,s3
800105b8:	413484b3          	sub	s1,s1,s3
800105bc:	413789b3          	sub	s3,a5,s3
800105c0:	013b2423          	sw	s3,8(s6)
800105c4:	ee0990e3          	bnez	s3,800104a4 <__sfvwrite_r+0x20c>
800105c8:	e79ff06f          	j	80010440 <__sfvwrite_r+0x1a8>
800105cc:	000a8613          	mv	a2,s5
800105d0:	00090513          	mv	a0,s2
800105d4:	2c4000ef          	jal	ra,80010898 <_realloc_r>
800105d8:	00050993          	mv	s3,a0
800105dc:	f80512e3          	bnez	a0,80010560 <__sfvwrite_r+0x2c8>
800105e0:	01042583          	lw	a1,16(s0)
800105e4:	00090513          	mv	a0,s2
800105e8:	c55fd0ef          	jal	ra,8000e23c <_free_r>
800105ec:	00c45783          	lhu	a5,12(s0)
800105f0:	f7f7f793          	andi	a5,a5,-129
800105f4:	00f41623          	sh	a5,12(s0)
800105f8:	f1dff06f          	j	80010514 <__sfvwrite_r+0x27c>
800105fc:	01042783          	lw	a5,16(s0)
80010600:	00a7e663          	bltu	a5,a0,8001060c <__sfvwrite_r+0x374>
80010604:	01442983          	lw	s3,20(s0)
80010608:	0534f663          	bgeu	s1,s3,80010654 <__sfvwrite_r+0x3bc>
8001060c:	000d8993          	mv	s3,s11
80010610:	01b4f463          	bgeu	s1,s11,80010618 <__sfvwrite_r+0x380>
80010614:	00048993          	mv	s3,s1
80010618:	00098613          	mv	a2,s3
8001061c:	000b8593          	mv	a1,s7
80010620:	b6dfd0ef          	jal	ra,8000e18c <memmove>
80010624:	00842783          	lw	a5,8(s0)
80010628:	00042703          	lw	a4,0(s0)
8001062c:	413787b3          	sub	a5,a5,s3
80010630:	01370733          	add	a4,a4,s3
80010634:	00f42423          	sw	a5,8(s0)
80010638:	00e42023          	sw	a4,0(s0)
8001063c:	f6079ae3          	bnez	a5,800105b0 <__sfvwrite_r+0x318>
80010640:	00040593          	mv	a1,s0
80010644:	00090513          	mv	a0,s2
80010648:	d04fd0ef          	jal	ra,8000db4c <_fflush_r>
8001064c:	f60502e3          	beqz	a0,800105b0 <__sfvwrite_r+0x318>
80010650:	ecdff06f          	j	8001051c <__sfvwrite_r+0x284>
80010654:	00048513          	mv	a0,s1
80010658:	009cf463          	bgeu	s9,s1,80010660 <__sfvwrite_r+0x3c8>
8001065c:	000c0513          	mv	a0,s8
80010660:	00098593          	mv	a1,s3
80010664:	d21fc0ef          	jal	ra,8000d384 <__divsi3>
80010668:	00098593          	mv	a1,s3
8001066c:	cf5fc0ef          	jal	ra,8000d360 <__mulsi3>
80010670:	02842783          	lw	a5,40(s0)
80010674:	02042583          	lw	a1,32(s0)
80010678:	00050693          	mv	a3,a0
8001067c:	000b8613          	mv	a2,s7
80010680:	00090513          	mv	a0,s2
80010684:	000780e7          	jalr	a5
80010688:	00050993          	mv	s3,a0
8001068c:	f2a042e3          	bgtz	a0,800105b0 <__sfvwrite_r+0x318>
80010690:	e8dff06f          	j	8001051c <__sfvwrite_r+0x284>
80010694:	000a2a83          	lw	s5,0(s4)
80010698:	004a2983          	lw	s3,4(s4)
8001069c:	00000513          	li	a0,0
800106a0:	008a0a13          	addi	s4,s4,8
800106a4:	c89ff06f          	j	8001032c <__sfvwrite_r+0x94>
800106a8:	02dc4263          	blt	s8,a3,800106cc <__sfvwrite_r+0x434>
800106ac:	02842783          	lw	a5,40(s0)
800106b0:	02042583          	lw	a1,32(s0)
800106b4:	000a8613          	mv	a2,s5
800106b8:	00090513          	mv	a0,s2
800106bc:	000780e7          	jalr	a5
800106c0:	00050493          	mv	s1,a0
800106c4:	cea040e3          	bgtz	a0,800103a4 <__sfvwrite_r+0x10c>
800106c8:	e55ff06f          	j	8001051c <__sfvwrite_r+0x284>
800106cc:	000c0613          	mv	a2,s8
800106d0:	000a8593          	mv	a1,s5
800106d4:	ab9fd0ef          	jal	ra,8000e18c <memmove>
800106d8:	00842783          	lw	a5,8(s0)
800106dc:	000c0493          	mv	s1,s8
800106e0:	418787b3          	sub	a5,a5,s8
800106e4:	00f42423          	sw	a5,8(s0)
800106e8:	00042783          	lw	a5,0(s0)
800106ec:	018787b3          	add	a5,a5,s8
800106f0:	00f42023          	sw	a5,0(s0)
800106f4:	cb1ff06f          	j	800103a4 <__sfvwrite_r+0x10c>

Disassembly of section .text.__swhatbuf_r:

800106f8 <__swhatbuf_r>:
800106f8:	f8010113          	addi	sp,sp,-128
800106fc:	06912a23          	sw	s1,116(sp)
80010700:	00058493          	mv	s1,a1
80010704:	00e59583          	lh	a1,14(a1)
80010708:	06812c23          	sw	s0,120(sp)
8001070c:	06112e23          	sw	ra,124(sp)
80010710:	00060413          	mv	s0,a2
80010714:	0005de63          	bgez	a1,80010730 <__swhatbuf_r+0x38>
80010718:	00c4d783          	lhu	a5,12(s1)
8001071c:	0006a023          	sw	zero,0(a3)
80010720:	0807f793          	andi	a5,a5,128
80010724:	04079063          	bnez	a5,80010764 <__swhatbuf_r+0x6c>
80010728:	40000793          	li	a5,1024
8001072c:	03c0006f          	j	80010768 <__swhatbuf_r+0x70>
80010730:	01810613          	addi	a2,sp,24
80010734:	00d12623          	sw	a3,12(sp)
80010738:	1f8000ef          	jal	ra,80010930 <_fstat_r>
8001073c:	00c12683          	lw	a3,12(sp)
80010740:	fc054ce3          	bltz	a0,80010718 <__swhatbuf_r+0x20>
80010744:	01c12703          	lw	a4,28(sp)
80010748:	0000f7b7          	lui	a5,0xf
8001074c:	00e7f7b3          	and	a5,a5,a4
80010750:	ffffe737          	lui	a4,0xffffe
80010754:	00e787b3          	add	a5,a5,a4
80010758:	0017b793          	seqz	a5,a5
8001075c:	00f6a023          	sw	a5,0(a3)
80010760:	fc9ff06f          	j	80010728 <__swhatbuf_r+0x30>
80010764:	04000793          	li	a5,64
80010768:	00f42023          	sw	a5,0(s0)
8001076c:	07c12083          	lw	ra,124(sp)
80010770:	07812403          	lw	s0,120(sp)
80010774:	07412483          	lw	s1,116(sp)
80010778:	00000513          	li	a0,0
8001077c:	08010113          	addi	sp,sp,128
80010780:	00008067          	ret

Disassembly of section .text.__smakebuf_r:

80010784 <__smakebuf_r>:
80010784:	00c5d783          	lhu	a5,12(a1)
80010788:	fe010113          	addi	sp,sp,-32
8001078c:	00812c23          	sw	s0,24(sp)
80010790:	00112e23          	sw	ra,28(sp)
80010794:	00912a23          	sw	s1,20(sp)
80010798:	01212823          	sw	s2,16(sp)
8001079c:	0027f793          	andi	a5,a5,2
800107a0:	00058413          	mv	s0,a1
800107a4:	02078863          	beqz	a5,800107d4 <__smakebuf_r+0x50>
800107a8:	04740793          	addi	a5,s0,71
800107ac:	00f42023          	sw	a5,0(s0)
800107b0:	00f42823          	sw	a5,16(s0)
800107b4:	00100793          	li	a5,1
800107b8:	00f42a23          	sw	a5,20(s0)
800107bc:	01c12083          	lw	ra,28(sp)
800107c0:	01812403          	lw	s0,24(sp)
800107c4:	01412483          	lw	s1,20(sp)
800107c8:	01012903          	lw	s2,16(sp)
800107cc:	02010113          	addi	sp,sp,32
800107d0:	00008067          	ret
800107d4:	00c10693          	addi	a3,sp,12
800107d8:	00810613          	addi	a2,sp,8
800107dc:	00050493          	mv	s1,a0
800107e0:	f19ff0ef          	jal	ra,800106f8 <__swhatbuf_r>
800107e4:	00812583          	lw	a1,8(sp)
800107e8:	00050913          	mv	s2,a0
800107ec:	00048513          	mv	a0,s1
800107f0:	b51fd0ef          	jal	ra,8000e340 <_malloc_r>
800107f4:	02051063          	bnez	a0,80010814 <__smakebuf_r+0x90>
800107f8:	00c41783          	lh	a5,12(s0)
800107fc:	2007f713          	andi	a4,a5,512
80010800:	fa071ee3          	bnez	a4,800107bc <__smakebuf_r+0x38>
80010804:	ffc7f793          	andi	a5,a5,-4
80010808:	0027e793          	ori	a5,a5,2
8001080c:	00f41623          	sh	a5,12(s0)
80010810:	f99ff06f          	j	800107a8 <__smakebuf_r+0x24>
80010814:	ffffd797          	auipc	a5,0xffffd
80010818:	49078793          	addi	a5,a5,1168 # 8000dca4 <_cleanup_r>
8001081c:	02f4a423          	sw	a5,40(s1)
80010820:	00c45783          	lhu	a5,12(s0)
80010824:	00a42023          	sw	a0,0(s0)
80010828:	00a42823          	sw	a0,16(s0)
8001082c:	0807e793          	ori	a5,a5,128
80010830:	00f41623          	sh	a5,12(s0)
80010834:	00812783          	lw	a5,8(sp)
80010838:	00f42a23          	sw	a5,20(s0)
8001083c:	00c12783          	lw	a5,12(sp)
80010840:	02078263          	beqz	a5,80010864 <__smakebuf_r+0xe0>
80010844:	00e41583          	lh	a1,14(s0)
80010848:	00048513          	mv	a0,s1
8001084c:	12c000ef          	jal	ra,80010978 <_isatty_r>
80010850:	00050a63          	beqz	a0,80010864 <__smakebuf_r+0xe0>
80010854:	00c45783          	lhu	a5,12(s0)
80010858:	ffc7f793          	andi	a5,a5,-4
8001085c:	0017e793          	ori	a5,a5,1
80010860:	00f41623          	sh	a5,12(s0)
80010864:	00c45783          	lhu	a5,12(s0)
80010868:	00f96933          	or	s2,s2,a5
8001086c:	01241623          	sh	s2,12(s0)
80010870:	f4dff06f          	j	800107bc <__smakebuf_r+0x38>

Disassembly of section .text.memchr:

80010874 <memchr>:
80010874:	0ff5f593          	andi	a1,a1,255
80010878:	00c50633          	add	a2,a0,a2
8001087c:	00c51663          	bne	a0,a2,80010888 <memchr+0x14>
80010880:	00000513          	li	a0,0
80010884:	00008067          	ret
80010888:	00054783          	lbu	a5,0(a0)
8001088c:	feb78ce3          	beq	a5,a1,80010884 <memchr+0x10>
80010890:	00150513          	addi	a0,a0,1
80010894:	fe9ff06f          	j	8001087c <memchr+0x8>

Disassembly of section .text._realloc_r:

80010898 <_realloc_r>:
80010898:	00059663          	bnez	a1,800108a4 <_realloc_r+0xc>
8001089c:	00060593          	mv	a1,a2
800108a0:	aa1fd06f          	j	8000e340 <_malloc_r>
800108a4:	fe010113          	addi	sp,sp,-32
800108a8:	00812c23          	sw	s0,24(sp)
800108ac:	00112e23          	sw	ra,28(sp)
800108b0:	00912a23          	sw	s1,20(sp)
800108b4:	01212823          	sw	s2,16(sp)
800108b8:	01312623          	sw	s3,12(sp)
800108bc:	00060413          	mv	s0,a2
800108c0:	02061663          	bnez	a2,800108ec <_realloc_r+0x54>
800108c4:	979fd0ef          	jal	ra,8000e23c <_free_r>
800108c8:	00000913          	li	s2,0
800108cc:	01c12083          	lw	ra,28(sp)
800108d0:	01812403          	lw	s0,24(sp)
800108d4:	00090513          	mv	a0,s2
800108d8:	01412483          	lw	s1,20(sp)
800108dc:	01012903          	lw	s2,16(sp)
800108e0:	00c12983          	lw	s3,12(sp)
800108e4:	02010113          	addi	sp,sp,32
800108e8:	00008067          	ret
800108ec:	00058493          	mv	s1,a1
800108f0:	00050993          	mv	s3,a0
800108f4:	0c8000ef          	jal	ra,800109bc <_malloc_usable_size_r>
800108f8:	00048913          	mv	s2,s1
800108fc:	fc8578e3          	bgeu	a0,s0,800108cc <_realloc_r+0x34>
80010900:	00040593          	mv	a1,s0
80010904:	00098513          	mv	a0,s3
80010908:	a39fd0ef          	jal	ra,8000e340 <_malloc_r>
8001090c:	00050913          	mv	s2,a0
80010910:	fa050ee3          	beqz	a0,800108cc <_realloc_r+0x34>
80010914:	00048593          	mv	a1,s1
80010918:	00040613          	mv	a2,s0
8001091c:	f98fd0ef          	jal	ra,8000e0b4 <memcpy>
80010920:	00048593          	mv	a1,s1
80010924:	00098513          	mv	a0,s3
80010928:	915fd0ef          	jal	ra,8000e23c <_free_r>
8001092c:	fa1ff06f          	j	800108cc <_realloc_r+0x34>

Disassembly of section .text._fstat_r:

80010930 <_fstat_r>:
80010930:	ff010113          	addi	sp,sp,-16
80010934:	00812423          	sw	s0,8(sp)
80010938:	00050413          	mv	s0,a0
8001093c:	00058513          	mv	a0,a1
80010940:	00060593          	mv	a1,a2
80010944:	c401a223          	sw	zero,-956(gp) # 80003484 <errno>
80010948:	00112623          	sw	ra,12(sp)
8001094c:	c0cf50ef          	jal	ra,80005d58 <_fstat>
80010950:	fff00793          	li	a5,-1
80010954:	00f51a63          	bne	a0,a5,80010968 <_fstat_r+0x38>
80010958:	c4418793          	addi	a5,gp,-956 # 80003484 <errno>
8001095c:	0007a783          	lw	a5,0(a5)
80010960:	00078463          	beqz	a5,80010968 <_fstat_r+0x38>
80010964:	00f42023          	sw	a5,0(s0)
80010968:	00c12083          	lw	ra,12(sp)
8001096c:	00812403          	lw	s0,8(sp)
80010970:	01010113          	addi	sp,sp,16
80010974:	00008067          	ret

Disassembly of section .text._isatty_r:

80010978 <_isatty_r>:
80010978:	ff010113          	addi	sp,sp,-16
8001097c:	00812423          	sw	s0,8(sp)
80010980:	00050413          	mv	s0,a0
80010984:	00058513          	mv	a0,a1
80010988:	c401a223          	sw	zero,-956(gp) # 80003484 <errno>
8001098c:	00112623          	sw	ra,12(sp)
80010990:	bc0f50ef          	jal	ra,80005d50 <_isatty>
80010994:	fff00793          	li	a5,-1
80010998:	00f51a63          	bne	a0,a5,800109ac <_isatty_r+0x34>
8001099c:	c4418793          	addi	a5,gp,-956 # 80003484 <errno>
800109a0:	0007a783          	lw	a5,0(a5)
800109a4:	00078463          	beqz	a5,800109ac <_isatty_r+0x34>
800109a8:	00f42023          	sw	a5,0(s0)
800109ac:	00c12083          	lw	ra,12(sp)
800109b0:	00812403          	lw	s0,8(sp)
800109b4:	01010113          	addi	sp,sp,16
800109b8:	00008067          	ret

Disassembly of section .text._malloc_usable_size_r:

800109bc <_malloc_usable_size_r>:
800109bc:	ffc5a783          	lw	a5,-4(a1)
800109c0:	ffc78513          	addi	a0,a5,-4
800109c4:	0007d863          	bgez	a5,800109d4 <_malloc_usable_size_r+0x18>
800109c8:	00a585b3          	add	a1,a1,a0
800109cc:	0005a783          	lw	a5,0(a1)
800109d0:	00f50533          	add	a0,a0,a5
800109d4:	00008067          	ret
