
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
80000064:	764030ef          	jal	ra,800037c8 <irqCallback>
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
800000b4:	6f018193          	addi	gp,gp,1776 # 800037a0 <__global_pointer$>
800000b8:	00011117          	auipc	sp,0x11
800000bc:	ea810113          	addi	sp,sp,-344 # 80010f60 <_stack_start>

800000c0 <bss_init>:
800000c0:	86018513          	addi	a0,gp,-1952 # 80003000 <t2>
800000c4:	c3818593          	addi	a1,gp,-968 # 800033d8 <_bss_end>

800000c8 <bss_loop>:
800000c8:	00b50863          	beq	a0,a1,800000d8 <bss_done>
800000cc:	00052023          	sw	zero,0(a0)
800000d0:	00450513          	addi	a0,a0,4
800000d4:	ff5ff06f          	j	800000c8 <bss_loop>

800000d8 <bss_done>:
800000d8:	00010517          	auipc	a0,0x10
800000dc:	68850513          	addi	a0,a0,1672 # 80010760 <_ctors_end>
800000e0:	ffc10113          	addi	sp,sp,-4

800000e4 <ctors_loop>:
800000e4:	00010597          	auipc	a1,0x10
800000e8:	67c58593          	addi	a1,a1,1660 # 80010760 <_ctors_end>
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
80000124:	0a40d0ef          	jal	ra,8000d1c8 <end>

80000128 <infinitLoop>:
80000128:	0000006f          	j	80000128 <infinitLoop>
	...

Disassembly of section .memory:

8000343c <crc16>:
8000343c:	000107b7          	lui	a5,0x10
80003440:	ffffa6b7          	lui	a3,0xffffa
80003444:	00000713          	li	a4,0
80003448:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
8000344c:	00168693          	addi	a3,a3,1 # ffffa001 <_heap_end+0x7ffe8001>
80003450:	00b74663          	blt	a4,a1,8000345c <crc16+0x20>
80003454:	00078513          	mv	a0,a5
80003458:	00008067          	ret
8000345c:	00e50633          	add	a2,a0,a4
80003460:	00064603          	lbu	a2,0(a2)
80003464:	00c7c7b3          	xor	a5,a5,a2
80003468:	00800613          	li	a2,8
8000346c:	0017f813          	andi	a6,a5,1
80003470:	0017d793          	srli	a5,a5,0x1
80003474:	00080863          	beqz	a6,80003484 <crc16+0x48>
80003478:	00d7c7b3          	xor	a5,a5,a3
8000347c:	01079793          	slli	a5,a5,0x10
80003480:	0107d793          	srli	a5,a5,0x10
80003484:	fff60613          	addi	a2,a2,-1
80003488:	fe0612e3          	bnez	a2,8000346c <crc16+0x30>
8000348c:	00170713          	addi	a4,a4,1
80003490:	fc1ff06f          	j	80003450 <crc16+0x14>

80003494 <add_crc>:
80003494:	ff010113          	addi	sp,sp,-16
80003498:	00812423          	sw	s0,8(sp)
8000349c:	00912223          	sw	s1,4(sp)
800034a0:	00112623          	sw	ra,12(sp)
800034a4:	00050413          	mv	s0,a0
800034a8:	00058493          	mv	s1,a1
800034ac:	f91ff0ef          	jal	ra,8000343c <crc16>
800034b0:	009405b3          	add	a1,s0,s1
800034b4:	00a58023          	sb	a0,0(a1)
800034b8:	00855513          	srli	a0,a0,0x8
800034bc:	00a580a3          	sb	a0,1(a1)
800034c0:	00c12083          	lw	ra,12(sp)
800034c4:	00812403          	lw	s0,8(sp)
800034c8:	00412483          	lw	s1,4(sp)
800034cc:	01010113          	addi	sp,sp,16
800034d0:	00008067          	ret

800034d4 <println>:
800034d4:	ff010113          	addi	sp,sp,-16
800034d8:	00112623          	sw	ra,12(sp)
800034dc:	4ec020ef          	jal	ra,800059c8 <print_uart0>
800034e0:	00c12083          	lw	ra,12(sp)
800034e4:	80002537          	lui	a0,0x80002
800034e8:	77050513          	addi	a0,a0,1904 # 80002770 <_heap_end+0xffff0770>
800034ec:	01010113          	addi	sp,sp,16
800034f0:	4d80206f          	j	800059c8 <print_uart0>

800034f4 <to_hex_nibble>:
800034f4:	00f57513          	andi	a0,a0,15
800034f8:	00900793          	li	a5,9
800034fc:	00a7f663          	bgeu	a5,a0,80003508 <to_hex_nibble+0x14>
80003500:	03750513          	addi	a0,a0,55
80003504:	00008067          	ret
80003508:	03050513          	addi	a0,a0,48
8000350c:	00008067          	ret

80003510 <to_hex>:
80003510:	fd010113          	addi	sp,sp,-48
80003514:	02812423          	sw	s0,40(sp)
80003518:	02912223          	sw	s1,36(sp)
8000351c:	03212023          	sw	s2,32(sp)
80003520:	01312e23          	sw	s3,28(sp)
80003524:	02112623          	sw	ra,44(sp)
80003528:	00050913          	mv	s2,a0
8000352c:	00050493          	mv	s1,a0
80003530:	01c00413          	li	s0,28
80003534:	ffc00993          	li	s3,-4
80003538:	0085d533          	srl	a0,a1,s0
8000353c:	0ff57513          	andi	a0,a0,255
80003540:	00b12623          	sw	a1,12(sp)
80003544:	fb1ff0ef          	jal	ra,800034f4 <to_hex_nibble>
80003548:	00a48023          	sb	a0,0(s1)
8000354c:	ffc40413          	addi	s0,s0,-4
80003550:	00148493          	addi	s1,s1,1
80003554:	00c12583          	lw	a1,12(sp)
80003558:	ff3410e3          	bne	s0,s3,80003538 <to_hex+0x28>
8000355c:	02c12083          	lw	ra,44(sp)
80003560:	02812403          	lw	s0,40(sp)
80003564:	00090423          	sb	zero,8(s2)
80003568:	02412483          	lw	s1,36(sp)
8000356c:	02012903          	lw	s2,32(sp)
80003570:	01c12983          	lw	s3,28(sp)
80003574:	03010113          	addi	sp,sp,48
80003578:	00008067          	ret

8000357c <process_and_wait>:
8000357c:	fe010113          	addi	sp,sp,-32
80003580:	00812c23          	sw	s0,24(sp)
80003584:	00912a23          	sw	s1,20(sp)
80003588:	01412423          	sw	s4,8(sp)
8000358c:	01512223          	sw	s5,4(sp)
80003590:	00112e23          	sw	ra,28(sp)
80003594:	01212823          	sw	s2,16(sp)
80003598:	01312623          	sw	s3,12(sp)
8000359c:	f00b07b7          	lui	a5,0xf00b0
800035a0:	0007a903          	lw	s2,0(a5) # f00b0000 <_heap_end+0x7009e000>
800035a4:	0047a983          	lw	s3,4(a5)
800035a8:	00050a13          	mv	s4,a0
800035ac:	f00b0ab7          	lui	s5,0xf00b0
800035b0:	000aa783          	lw	a5,0(s5) # f00b0000 <_heap_end+0x7009e000>
800035b4:	004aa803          	lw	a6,4(s5)
800035b8:	412786b3          	sub	a3,a5,s2
800035bc:	00d7b733          	sltu	a4,a5,a3
800035c0:	413807b3          	sub	a5,a6,s3
800035c4:	02e79663          	bne	a5,a4,800035f0 <process_and_wait+0x74>
800035c8:	0346f463          	bgeu	a3,s4,800035f0 <process_and_wait+0x74>
800035cc:	8741a783          	lw	a5,-1932(gp) # 80003014 <events_modbus_rtu_poll>
800035d0:	00078663          	beqz	a5,800035dc <process_and_wait+0x60>
800035d4:	2b0000ef          	jal	ra,80003884 <modbus_rtu_poll>
800035d8:	8601aa23          	sw	zero,-1932(gp) # 80003014 <events_modbus_rtu_poll>
800035dc:	8781a783          	lw	a5,-1928(gp) # 80003018 <events_mac_poll>
800035e0:	fc0788e3          	beqz	a5,800035b0 <process_and_wait+0x34>
800035e4:	255010ef          	jal	ra,80005038 <mac_poll>
800035e8:	8601ac23          	sw	zero,-1928(gp) # 80003018 <events_mac_poll>
800035ec:	fc5ff06f          	j	800035b0 <process_and_wait+0x34>
800035f0:	01c12083          	lw	ra,28(sp)
800035f4:	01812403          	lw	s0,24(sp)
800035f8:	01412483          	lw	s1,20(sp)
800035fc:	01012903          	lw	s2,16(sp)
80003600:	00c12983          	lw	s3,12(sp)
80003604:	00812a03          	lw	s4,8(sp)
80003608:	00412a83          	lw	s5,4(sp)
8000360c:	02010113          	addi	sp,sp,32
80003610:	00008067          	ret

80003614 <timerInterrupt>:
80003614:	00008067          	ret

80003618 <externalInterrupt>:
80003618:	ff010113          	addi	sp,sp,-16
8000361c:	00112623          	sw	ra,12(sp)
80003620:	00812423          	sw	s0,8(sp)
80003624:	f00607b7          	lui	a5,0xf0060
80003628:	0047a783          	lw	a5,4(a5) # f0060004 <_heap_end+0x7004e004>
8000362c:	0017f793          	andi	a5,a5,1
80003630:	02078c63          	beqz	a5,80003668 <externalInterrupt+0x50>
80003634:	f0000737          	lui	a4,0xf0000
80003638:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
8000363c:	02a00593          	li	a1,42
80003640:	0027e793          	ori	a5,a5,2
80003644:	00f72223          	sw	a5,4(a4)
80003648:	f0010737          	lui	a4,0xf0010
8000364c:	00472783          	lw	a5,4(a4) # f0010004 <_heap_end+0x6fffe004>
80003650:	0187d793          	srli	a5,a5,0x18
80003654:	0e079c63          	bnez	a5,8000374c <externalInterrupt+0x134>
80003658:	f0060737          	lui	a4,0xf0060
8000365c:	00472783          	lw	a5,4(a4) # f0060004 <_heap_end+0x7004e004>
80003660:	ffe7f793          	andi	a5,a5,-2
80003664:	00f72223          	sw	a5,4(a4)
80003668:	f0060437          	lui	s0,0xf0060
8000366c:	00442783          	lw	a5,4(s0) # f0060004 <_heap_end+0x7004e004>
80003670:	0027f793          	andi	a5,a5,2
80003674:	00078a63          	beqz	a5,80003688 <externalInterrupt+0x70>
80003678:	2f0000ef          	jal	ra,80003968 <modbus_rtu_isr>
8000367c:	00442783          	lw	a5,4(s0)
80003680:	ffd7f793          	andi	a5,a5,-3
80003684:	00f42223          	sw	a5,4(s0)
80003688:	f0060437          	lui	s0,0xf0060
8000368c:	00442783          	lw	a5,4(s0) # f0060004 <_heap_end+0x7004e004>
80003690:	0047f793          	andi	a5,a5,4
80003694:	00078a63          	beqz	a5,800036a8 <externalInterrupt+0x90>
80003698:	6d0010ef          	jal	ra,80004d68 <mac_rx_isr>
8000369c:	00442783          	lw	a5,4(s0)
800036a0:	ffb7f793          	andi	a5,a5,-5
800036a4:	00f42223          	sw	a5,4(s0)
800036a8:	f00607b7          	lui	a5,0xf0060
800036ac:	0047a703          	lw	a4,4(a5) # f0060004 <_heap_end+0x7004e004>
800036b0:	00877713          	andi	a4,a4,8
800036b4:	02070863          	beqz	a4,800036e4 <externalInterrupt+0xcc>
800036b8:	f0020737          	lui	a4,0xf0020
800036bc:	000186b7          	lui	a3,0x18
800036c0:	00072623          	sw	zero,12(a4) # f002000c <_heap_end+0x7000e00c>
800036c4:	6a068693          	addi	a3,a3,1696 # 186a0 <_stack_size+0x17ea0>
800036c8:	00d72823          	sw	a3,16(a4)
800036cc:	00100693          	li	a3,1
800036d0:	00d72023          	sw	a3,0(a4)
800036d4:	86d1ac23          	sw	a3,-1928(gp) # 80003018 <events_mac_poll>
800036d8:	0047a703          	lw	a4,4(a5)
800036dc:	ff777713          	andi	a4,a4,-9
800036e0:	00e7a223          	sw	a4,4(a5)
800036e4:	f00607b7          	lui	a5,0xf0060
800036e8:	0047a703          	lw	a4,4(a5) # f0060004 <_heap_end+0x7004e004>
800036ec:	01077713          	andi	a4,a4,16
800036f0:	02070863          	beqz	a4,80003720 <externalInterrupt+0x108>
800036f4:	f0021737          	lui	a4,0xf0021
800036f8:	0000c6b7          	lui	a3,0xc
800036fc:	00072623          	sw	zero,12(a4) # f002100c <_heap_end+0x7000f00c>
80003700:	35068693          	addi	a3,a3,848 # c350 <_stack_size+0xbb50>
80003704:	00d72823          	sw	a3,16(a4)
80003708:	00100693          	li	a3,1
8000370c:	00d72023          	sw	a3,0(a4)
80003710:	86d1aa23          	sw	a3,-1932(gp) # 80003014 <events_modbus_rtu_poll>
80003714:	0047a703          	lw	a4,4(a5)
80003718:	fef77713          	andi	a4,a4,-17
8000371c:	00e7a223          	sw	a4,4(a5)
80003720:	f00607b7          	lui	a5,0xf0060
80003724:	0047a703          	lw	a4,4(a5) # f0060004 <_heap_end+0x7004e004>
80003728:	02077713          	andi	a4,a4,32
8000372c:	00070863          	beqz	a4,8000373c <externalInterrupt+0x124>
80003730:	0047a703          	lw	a4,4(a5)
80003734:	fdf77713          	andi	a4,a4,-33
80003738:	00e7a223          	sw	a4,4(a5)
8000373c:	00c12083          	lw	ra,12(sp)
80003740:	00812403          	lw	s0,8(sp)
80003744:	01010113          	addi	sp,sp,16
80003748:	00008067          	ret
8000374c:	00072783          	lw	a5,0(a4)
80003750:	0ff7f513          	andi	a0,a5,255
80003754:	0ff7f693          	andi	a3,a5,255
80003758:	00472783          	lw	a5,4(a4)
8000375c:	0107d793          	srli	a5,a5,0x10
80003760:	0ff7f793          	andi	a5,a5,255
80003764:	fe078ae3          	beqz	a5,80003758 <externalInterrupt+0x140>
80003768:	00d72023          	sw	a3,0(a4)
8000376c:	00b51a63          	bne	a0,a1,80003780 <externalInterrupt+0x168>
80003770:	87c1a783          	lw	a5,-1924(gp) # 8000301c <uart_config_reset_counter>
80003774:	00178793          	addi	a5,a5,1
80003778:	86f1ae23          	sw	a5,-1924(gp) # 8000301c <uart_config_reset_counter>
8000377c:	ed1ff06f          	j	8000364c <externalInterrupt+0x34>
80003780:	8601ae23          	sw	zero,-1924(gp) # 8000301c <uart_config_reset_counter>
80003784:	ec9ff06f          	j	8000364c <externalInterrupt+0x34>

80003788 <crash>:
80003788:	fe010113          	addi	sp,sp,-32
8000378c:	00050593          	mv	a1,a0
80003790:	00010513          	mv	a0,sp
80003794:	00112e23          	sw	ra,28(sp)
80003798:	d79ff0ef          	jal	ra,80003510 <to_hex>
8000379c:	80002537          	lui	a0,0x80002
800037a0:	18850513          	addi	a0,a0,392 # 80002188 <_heap_end+0xffff0188>
800037a4:	224020ef          	jal	ra,800059c8 <print_uart0>
800037a8:	00010513          	mv	a0,sp
800037ac:	21c020ef          	jal	ra,800059c8 <print_uart0>
800037b0:	80002537          	lui	a0,0x80002
800037b4:	77050513          	addi	a0,a0,1904 # 80002770 <_heap_end+0xffff0770>
800037b8:	210020ef          	jal	ra,800059c8 <print_uart0>
800037bc:	01c12083          	lw	ra,28(sp)
800037c0:	02010113          	addi	sp,sp,32
800037c4:	00008067          	ret

800037c8 <irqCallback>:
800037c8:	88c1a783          	lw	a5,-1908(gp) # 8000302c <reg_irq_counter>
800037cc:	00178793          	addi	a5,a5,1
800037d0:	88f1a623          	sw	a5,-1908(gp) # 8000302c <reg_irq_counter>
800037d4:	342027f3          	csrr	a5,mcause
800037d8:	0007de63          	bgez	a5,800037f4 <irqCallback+0x2c>
800037dc:	00f7f793          	andi	a5,a5,15
800037e0:	00700713          	li	a4,7
800037e4:	00e78c63          	beq	a5,a4,800037fc <irqCallback+0x34>
800037e8:	00b00713          	li	a4,11
800037ec:	00e79463          	bne	a5,a4,800037f4 <irqCallback+0x2c>
800037f0:	e29ff06f          	j	80003618 <externalInterrupt>
800037f4:	00100513          	li	a0,1
800037f8:	f91ff06f          	j	80003788 <crash>
800037fc:	00008067          	ret

80003800 <modbus_rtu_init>:
80003800:	fe010113          	addi	sp,sp,-32
80003804:	00112e23          	sw	ra,28(sp)
80003808:	00812c23          	sw	s0,24(sp)
8000380c:	f0011437          	lui	s0,0xf0011
80003810:	00842783          	lw	a5,8(s0) # f0011008 <_heap_end+0x6ffff008>
80003814:	9941a583          	lw	a1,-1644(gp) # 80003134 <active_config+0x18>
80003818:	017d8537          	lui	a0,0x17d8
8000381c:	84050513          	addi	a0,a0,-1984 # 17d7840 <_stack_size+0x17d7040>
80003820:	00f12623          	sw	a5,12(sp)
80003824:	0f9090ef          	jal	ra,8000d11c <__udivsi3>
80003828:	00500593          	li	a1,5
8000382c:	0f1090ef          	jal	ra,8000d11c <__udivsi3>
80003830:	fff50713          	addi	a4,a0,-1
80003834:	00e42423          	sw	a4,8(s0)
80003838:	00600693          	li	a3,6
8000383c:	00d42623          	sw	a3,12(s0)
80003840:	00c12783          	lw	a5,12(sp)
80003844:	80002537          	lui	a0,0x80002
80003848:	00000693          	li	a3,0
8000384c:	00000613          	li	a2,0
80003850:	00700593          	li	a1,7
80003854:	19850513          	addi	a0,a0,408 # 80002198 <_heap_end+0xffff0198>
80003858:	2250a0ef          	jal	ra,8000e27c <iprintf>
8000385c:	f00b07b7          	lui	a5,0xf00b0
80003860:	0007a603          	lw	a2,0(a5) # f00b0000 <_heap_end+0x7009e000>
80003864:	0047a683          	lw	a3,4(a5)
80003868:	88c1a823          	sw	a2,-1904(gp) # 80003030 <modbus_rtu_rx_timestamp>
8000386c:	01c12083          	lw	ra,28(sp)
80003870:	01812403          	lw	s0,24(sp)
80003874:	88d1aa23          	sw	a3,-1900(gp) # 80003034 <modbus_rtu_rx_timestamp+0x4>
80003878:	8801ac23          	sw	zero,-1896(gp) # 80003038 <modbus_rtu_rx_len>
8000387c:	02010113          	addi	sp,sp,32
80003880:	00008067          	ret

80003884 <modbus_rtu_poll>:
80003884:	ef010113          	addi	sp,sp,-272
80003888:	10812423          	sw	s0,264(sp)
8000388c:	8981a783          	lw	a5,-1896(gp) # 80003038 <modbus_rtu_rx_len>
80003890:	10112623          	sw	ra,268(sp)
80003894:	10912223          	sw	s1,260(sp)
80003898:	0a078e63          	beqz	a5,80003954 <modbus_rtu_poll+0xd0>
8000389c:	f00b07b7          	lui	a5,0xf00b0
800038a0:	0047a803          	lw	a6,4(a5) # f00b0004 <_heap_end+0x7009e004>
800038a4:	0007a783          	lw	a5,0(a5)
800038a8:	8901a503          	lw	a0,-1904(gp) # 80003030 <modbus_rtu_rx_timestamp>
800038ac:	8941a583          	lw	a1,-1900(gp) # 80003034 <modbus_rtu_rx_timestamp+0x4>
800038b0:	40a786b3          	sub	a3,a5,a0
800038b4:	00d7b733          	sltu	a4,a5,a3
800038b8:	40b807b3          	sub	a5,a6,a1
800038bc:	00e79863          	bne	a5,a4,800038cc <modbus_rtu_poll+0x48>
800038c0:	000027b7          	lui	a5,0x2
800038c4:	70f78793          	addi	a5,a5,1807 # 270f <_stack_size+0x1f0f>
800038c8:	08d7f663          	bgeu	a5,a3,80003954 <modbus_rtu_poll+0xd0>
800038cc:	8981a583          	lw	a1,-1896(gp) # 80003038 <modbus_rtu_rx_len>
800038d0:	80002537          	lui	a0,0x80002
800038d4:	1f850513          	addi	a0,a0,504 # 800021f8 <_heap_end+0xffff01f8>
800038d8:	1a50a0ef          	jal	ra,8000e27c <iprintf>
800038dc:	8981a483          	lw	s1,-1896(gp) # 80003038 <modbus_rtu_rx_len>
800038e0:	08000793          	li	a5,128
800038e4:	00048613          	mv	a2,s1
800038e8:	0097f463          	bgeu	a5,s1,800038f0 <modbus_rtu_poll+0x6c>
800038ec:	08000613          	li	a2,128
800038f0:	8fc18593          	addi	a1,gp,-1796 # 8000309c <modbus_rtu_rx_buf>
800038f4:	00010513          	mv	a0,sp
800038f8:	5440a0ef          	jal	ra,8000de3c <memcpy>
800038fc:	00048593          	mv	a1,s1
80003900:	08010613          	addi	a2,sp,128
80003904:	00010513          	mv	a0,sp
80003908:	8801ac23          	sw	zero,-1896(gp) # 80003038 <modbus_rtu_rx_len>
8000390c:	519000ef          	jal	ra,80004624 <modbus_recv>
80003910:	00050593          	mv	a1,a0
80003914:	04050063          	beqz	a0,80003954 <modbus_rtu_poll+0xd0>
80003918:	00000713          	li	a4,0
8000391c:	f00116b7          	lui	a3,0xf0011
80003920:	08010793          	addi	a5,sp,128
80003924:	00e787b3          	add	a5,a5,a4
80003928:	0007c603          	lbu	a2,0(a5)
8000392c:	0046a783          	lw	a5,4(a3) # f0011004 <_heap_end+0x6ffff004>
80003930:	0107d793          	srli	a5,a5,0x10
80003934:	0ff7f793          	andi	a5,a5,255
80003938:	fe078ae3          	beqz	a5,8000392c <modbus_rtu_poll+0xa8>
8000393c:	00c6a023          	sw	a2,0(a3)
80003940:	00170713          	addi	a4,a4,1
80003944:	fce59ee3          	bne	a1,a4,80003920 <modbus_rtu_poll+0x9c>
80003948:	80002537          	lui	a0,0x80002
8000394c:	22850513          	addi	a0,a0,552 # 80002228 <_heap_end+0xffff0228>
80003950:	12d0a0ef          	jal	ra,8000e27c <iprintf>
80003954:	10c12083          	lw	ra,268(sp)
80003958:	10812403          	lw	s0,264(sp)
8000395c:	10412483          	lw	s1,260(sp)
80003960:	11010113          	addi	sp,sp,272
80003964:	00008067          	ret

80003968 <modbus_rtu_isr>:
80003968:	f7010113          	addi	sp,sp,-144
8000396c:	08812423          	sw	s0,136(sp)
80003970:	08912223          	sw	s1,132(sp)
80003974:	08112623          	sw	ra,140(sp)
80003978:	f00117b7          	lui	a5,0xf0011
8000397c:	0007a683          	lw	a3,0(a5) # f0011000 <_heap_end+0x6ffff000>
80003980:	8981a603          	lw	a2,-1896(gp) # 80003038 <modbus_rtu_rx_len>
80003984:	0ff6f693          	andi	a3,a3,255
80003988:	00160793          	addi	a5,a2,1
8000398c:	88f1ac23          	sw	a5,-1896(gp) # 80003038 <modbus_rtu_rx_len>
80003990:	8fc18713          	addi	a4,gp,-1796 # 8000309c <modbus_rtu_rx_buf>
80003994:	00c70733          	add	a4,a4,a2
80003998:	00d70023          	sb	a3,0(a4)
8000399c:	8981a683          	lw	a3,-1896(gp) # 80003038 <modbus_rtu_rx_len>
800039a0:	07f00713          	li	a4,127
800039a4:	8fc18493          	addi	s1,gp,-1796 # 8000309c <modbus_rtu_rx_buf>
800039a8:	00d77463          	bgeu	a4,a3,800039b0 <modbus_rtu_isr+0x48>
800039ac:	8801ac23          	sw	zero,-1896(gp) # 80003038 <modbus_rtu_rx_len>
800039b0:	f0011737          	lui	a4,0xf0011
800039b4:	00472783          	lw	a5,4(a4) # f0011004 <_heap_end+0x6ffff004>
800039b8:	0187d793          	srli	a5,a5,0x18
800039bc:	04078063          	beqz	a5,800039fc <modbus_rtu_isr+0x94>
800039c0:	00472683          	lw	a3,4(a4)
800039c4:	8981a703          	lw	a4,-1896(gp) # 80003038 <modbus_rtu_rx_len>
800039c8:	80002637          	lui	a2,0x80002
800039cc:	0186d693          	srli	a3,a3,0x18
800039d0:	25860613          	addi	a2,a2,600 # 80002258 <_heap_end+0xffff0258>
800039d4:	08000593          	li	a1,128
800039d8:	00010513          	mv	a0,sp
800039dc:	20d0a0ef          	jal	ra,8000e3e8 <sniprintf>
800039e0:	00010513          	mv	a0,sp
800039e4:	7e5010ef          	jal	ra,800059c8 <print_uart0>
800039e8:	f00116b7          	lui	a3,0xf0011
800039ec:	07f00613          	li	a2,127
800039f0:	0046a783          	lw	a5,4(a3) # f0011004 <_heap_end+0x6ffff004>
800039f4:	0187d793          	srli	a5,a5,0x18
800039f8:	02079663          	bnez	a5,80003a24 <modbus_rtu_isr+0xbc>
800039fc:	f00b07b7          	lui	a5,0xf00b0
80003a00:	0007a603          	lw	a2,0(a5) # f00b0000 <_heap_end+0x7009e000>
80003a04:	0047a683          	lw	a3,4(a5)
80003a08:	08c12083          	lw	ra,140(sp)
80003a0c:	08812403          	lw	s0,136(sp)
80003a10:	88c1a823          	sw	a2,-1904(gp) # 80003030 <modbus_rtu_rx_timestamp>
80003a14:	88d1aa23          	sw	a3,-1900(gp) # 80003034 <modbus_rtu_rx_timestamp+0x4>
80003a18:	08412483          	lw	s1,132(sp)
80003a1c:	09010113          	addi	sp,sp,144
80003a20:	00008067          	ret
80003a24:	0006a703          	lw	a4,0(a3)
80003a28:	8981a783          	lw	a5,-1896(gp) # 80003038 <modbus_rtu_rx_len>
80003a2c:	0ff77713          	andi	a4,a4,255
80003a30:	00178593          	addi	a1,a5,1
80003a34:	88b1ac23          	sw	a1,-1896(gp) # 80003038 <modbus_rtu_rx_len>
80003a38:	00f487b3          	add	a5,s1,a5
80003a3c:	00e78023          	sb	a4,0(a5)
80003a40:	8981a783          	lw	a5,-1896(gp) # 80003038 <modbus_rtu_rx_len>
80003a44:	faf676e3          	bgeu	a2,a5,800039f0 <modbus_rtu_isr+0x88>
80003a48:	8801ac23          	sw	zero,-1896(gp) # 80003038 <modbus_rtu_rx_len>
80003a4c:	fa5ff06f          	j	800039f0 <modbus_rtu_isr+0x88>

80003a50 <config_load>:
80003a50:	0c050863          	beqz	a0,80003b20 <config_load+0xd0>
80003a54:	fe010113          	addi	sp,sp,-32
80003a58:	00812c23          	sw	s0,24(sp)
80003a5c:	00912a23          	sw	s1,20(sp)
80003a60:	01212823          	sw	s2,16(sp)
80003a64:	01312623          	sw	s3,12(sp)
80003a68:	00112e23          	sw	ra,28(sp)
80003a6c:	00050413          	mv	s0,a0
80003a70:	00050913          	mv	s2,a0
80003a74:	00000493          	li	s1,0
80003a78:	02000993          	li	s3,32
80003a7c:	00090713          	mv	a4,s2
80003a80:	00400693          	li	a3,4
80003a84:	00048613          	mv	a2,s1
80003a88:	05000593          	li	a1,80
80003a8c:	f0090537          	lui	a0,0xf0090
80003a90:	3fc000ef          	jal	ra,80003e8c <eeprom_read_page>
80003a94:	00400793          	li	a5,4
80003a98:	02f50a63          	beq	a0,a5,80003acc <config_load+0x7c>
80003a9c:	80002537          	lui	a0,0x80002
80003aa0:	00400593          	li	a1,4
80003aa4:	29050513          	addi	a0,a0,656 # 80002290 <_heap_end+0xffff0290>
80003aa8:	7d40a0ef          	jal	ra,8000e27c <iprintf>
80003aac:	ffe00513          	li	a0,-2
80003ab0:	01c12083          	lw	ra,28(sp)
80003ab4:	01812403          	lw	s0,24(sp)
80003ab8:	01412483          	lw	s1,20(sp)
80003abc:	01012903          	lw	s2,16(sp)
80003ac0:	00c12983          	lw	s3,12(sp)
80003ac4:	02010113          	addi	sp,sp,32
80003ac8:	00008067          	ret
80003acc:	00448493          	addi	s1,s1,4
80003ad0:	0ff4f493          	andi	s1,s1,255
80003ad4:	00490913          	addi	s2,s2,4
80003ad8:	fb3492e3          	bne	s1,s3,80003a7c <config_load+0x2c>
80003adc:	01e00593          	li	a1,30
80003ae0:	00040513          	mv	a0,s0
80003ae4:	959ff0ef          	jal	ra,8000343c <crc16>
80003ae8:	01e45603          	lhu	a2,30(s0)
80003aec:	00050593          	mv	a1,a0
80003af0:	00a60c63          	beq	a2,a0,80003b08 <config_load+0xb8>
80003af4:	80002537          	lui	a0,0x80002
80003af8:	2c450513          	addi	a0,a0,708 # 800022c4 <_heap_end+0xffff02c4>
80003afc:	7800a0ef          	jal	ra,8000e27c <iprintf>
80003b00:	ffd00513          	li	a0,-3
80003b04:	fadff06f          	j	80003ab0 <config_load+0x60>
80003b08:	80002537          	lui	a0,0x80002
80003b0c:	02000593          	li	a1,32
80003b10:	2f850513          	addi	a0,a0,760 # 800022f8 <_heap_end+0xffff02f8>
80003b14:	7680a0ef          	jal	ra,8000e27c <iprintf>
80003b18:	00000513          	li	a0,0
80003b1c:	f95ff06f          	j	80003ab0 <config_load+0x60>
80003b20:	fff00513          	li	a0,-1
80003b24:	00008067          	ret

80003b28 <config_save>:
80003b28:	fe010113          	addi	sp,sp,-32
80003b2c:	00912a23          	sw	s1,20(sp)
80003b30:	00112e23          	sw	ra,28(sp)
80003b34:	00812c23          	sw	s0,24(sp)
80003b38:	01212823          	sw	s2,16(sp)
80003b3c:	01312623          	sw	s3,12(sp)
80003b40:	01412423          	sw	s4,8(sp)
80003b44:	01512223          	sw	s5,4(sp)
80003b48:	fff00493          	li	s1,-1
80003b4c:	06050063          	beqz	a0,80003bac <config_save+0x84>
80003b50:	01e00593          	li	a1,30
80003b54:	00050413          	mv	s0,a0
80003b58:	8e5ff0ef          	jal	ra,8000343c <crc16>
80003b5c:	00a41f23          	sh	a0,30(s0)
80003b60:	00000913          	li	s2,0
80003b64:	00000993          	li	s3,0
80003b68:	00800a93          	li	s5,8
80003b6c:	01240733          	add	a4,s0,s2
80003b70:	00400693          	li	a3,4
80003b74:	0ff97613          	andi	a2,s2,255
80003b78:	05000593          	li	a1,80
80003b7c:	f0090537          	lui	a0,0xf0090
80003b80:	0b8000ef          	jal	ra,80003c38 <eeprom_write_page>
80003b84:	00400793          	li	a5,4
80003b88:	04f50663          	beq	a0,a5,80003bd4 <config_save+0xac>
80003b8c:	80002537          	lui	a0,0x80002
80003b90:	00090713          	mv	a4,s2
80003b94:	00098693          	mv	a3,s3
80003b98:	00400613          	li	a2,4
80003b9c:	05000593          	li	a1,80
80003ba0:	33050513          	addi	a0,a0,816 # 80002330 <_heap_end+0xffff0330>
80003ba4:	6d80a0ef          	jal	ra,8000e27c <iprintf>
80003ba8:	ffe00493          	li	s1,-2
80003bac:	01c12083          	lw	ra,28(sp)
80003bb0:	01812403          	lw	s0,24(sp)
80003bb4:	00048513          	mv	a0,s1
80003bb8:	01012903          	lw	s2,16(sp)
80003bbc:	01412483          	lw	s1,20(sp)
80003bc0:	00c12983          	lw	s3,12(sp)
80003bc4:	00812a03          	lw	s4,8(sp)
80003bc8:	00412a83          	lw	s5,4(sp)
80003bcc:	02010113          	addi	sp,sp,32
80003bd0:	00008067          	ret
80003bd4:	00a00a13          	li	s4,10
80003bd8:	05000593          	li	a1,80
80003bdc:	f0090537          	lui	a0,0xf0090
80003be0:	228000ef          	jal	ra,80003e08 <eeprom_poll>
80003be4:	00050493          	mv	s1,a0
80003be8:	02050663          	beqz	a0,80003c14 <config_save+0xec>
80003bec:	3e800513          	li	a0,1000
80003bf0:	fffa0a13          	addi	s4,s4,-1
80003bf4:	5a5010ef          	jal	ra,80005998 <delay_us>
80003bf8:	fe0a10e3          	bnez	s4,80003bd8 <config_save+0xb0>
80003bfc:	80002537          	lui	a0,0x80002
80003c00:	05000593          	li	a1,80
80003c04:	3b050513          	addi	a0,a0,944 # 800023b0 <_heap_end+0xffff03b0>
80003c08:	6740a0ef          	jal	ra,8000e27c <iprintf>
80003c0c:	ffd00493          	li	s1,-3
80003c10:	f9dff06f          	j	80003bac <config_save+0x84>
80003c14:	00198993          	addi	s3,s3,1
80003c18:	00490913          	addi	s2,s2,4
80003c1c:	f55998e3          	bne	s3,s5,80003b6c <config_save+0x44>
80003c20:	01e45603          	lhu	a2,30(s0)
80003c24:	80002537          	lui	a0,0x80002
80003c28:	02000593          	li	a1,32
80003c2c:	37850513          	addi	a0,a0,888 # 80002378 <_heap_end+0xffff0378>
80003c30:	64c0a0ef          	jal	ra,8000e27c <iprintf>
80003c34:	f79ff06f          	j	80003bac <config_save+0x84>

80003c38 <eeprom_write_page>:
80003c38:	fe010113          	addi	sp,sp,-32
80003c3c:	00812c23          	sw	s0,24(sp)
80003c40:	00912a23          	sw	s1,20(sp)
80003c44:	01212823          	sw	s2,16(sp)
80003c48:	01412423          	sw	s4,8(sp)
80003c4c:	01512223          	sw	s5,4(sp)
80003c50:	00112e23          	sw	ra,28(sp)
80003c54:	01312623          	sw	s3,12(sp)
80003c58:	01612023          	sw	s6,0(sp)
80003c5c:	01500793          	li	a5,21
80003c60:	00159593          	slli	a1,a1,0x1
80003c64:	00f52623          	sw	a5,12(a0)
80003c68:	00018937          	lui	s2,0x18
80003c6c:	00b52023          	sw	a1,0(a0)
80003c70:	6a090593          	addi	a1,s2,1696 # 186a0 <_stack_size+0x17ea0>
80003c74:	00050413          	mv	s0,a0
80003c78:	00060493          	mv	s1,a2
80003c7c:	00068a13          	mv	s4,a3
80003c80:	00070a93          	mv	s5,a4
80003c84:	48d010ef          	jal	ra,80005910 <i2c_wait_for_busy>
80003c88:	04051663          	bnez	a0,80003cd4 <eeprom_write_page+0x9c>
80003c8c:	00042623          	sw	zero,12(s0)
80003c90:	00100613          	li	a2,1
80003c94:	80002537          	lui	a0,0x80002
80003c98:	00040593          	mv	a1,s0
80003c9c:	3e050513          	addi	a0,a0,992 # 800023e0 <_heap_end+0xffff03e0>
80003ca0:	5dc0a0ef          	jal	ra,8000e27c <iprintf>
80003ca4:	fff00493          	li	s1,-1
80003ca8:	01c12083          	lw	ra,28(sp)
80003cac:	01812403          	lw	s0,24(sp)
80003cb0:	00048513          	mv	a0,s1
80003cb4:	01012903          	lw	s2,16(sp)
80003cb8:	01412483          	lw	s1,20(sp)
80003cbc:	00c12983          	lw	s3,12(sp)
80003cc0:	00812a03          	lw	s4,8(sp)
80003cc4:	00412a83          	lw	s5,4(sp)
80003cc8:	00012b03          	lw	s6,0(sp)
80003ccc:	02010113          	addi	sp,sp,32
80003cd0:	00008067          	ret
80003cd4:	6a090593          	addi	a1,s2,1696
80003cd8:	00040513          	mv	a0,s0
80003cdc:	461010ef          	jal	ra,8000593c <i2c_wait_for_release>
80003ce0:	00051863          	bnez	a0,80003cf0 <eeprom_write_page+0xb8>
80003ce4:	00042623          	sw	zero,12(s0)
80003ce8:	00200613          	li	a2,2
80003cec:	fa9ff06f          	j	80003c94 <eeprom_write_page+0x5c>
80003cf0:	00c42783          	lw	a5,12(s0)
80003cf4:	0407f793          	andi	a5,a5,64
80003cf8:	00078e63          	beqz	a5,80003d14 <eeprom_write_page+0xdc>
80003cfc:	00042623          	sw	zero,12(s0)
80003d00:	00100613          	li	a2,1
80003d04:	80002537          	lui	a0,0x80002
80003d08:	00040593          	mv	a1,s0
80003d0c:	41050513          	addi	a0,a0,1040 # 80002410 <_heap_end+0xffff0410>
80003d10:	f91ff06f          	j	80003ca0 <eeprom_write_page+0x68>
80003d14:	00200513          	li	a0,2
80003d18:	481010ef          	jal	ra,80005998 <delay_us>
80003d1c:	01100793          	li	a5,17
80003d20:	00f42623          	sw	a5,12(s0)
80003d24:	00942023          	sw	s1,0(s0)
80003d28:	6a090593          	addi	a1,s2,1696
80003d2c:	00040513          	mv	a0,s0
80003d30:	3e1010ef          	jal	ra,80005910 <i2c_wait_for_busy>
80003d34:	00051863          	bnez	a0,80003d44 <eeprom_write_page+0x10c>
80003d38:	00042623          	sw	zero,12(s0)
80003d3c:	00300613          	li	a2,3
80003d40:	f55ff06f          	j	80003c94 <eeprom_write_page+0x5c>
80003d44:	6a090593          	addi	a1,s2,1696
80003d48:	00040513          	mv	a0,s0
80003d4c:	3f1010ef          	jal	ra,8000593c <i2c_wait_for_release>
80003d50:	00051863          	bnez	a0,80003d60 <eeprom_write_page+0x128>
80003d54:	00042623          	sw	zero,12(s0)
80003d58:	00400613          	li	a2,4
80003d5c:	f39ff06f          	j	80003c94 <eeprom_write_page+0x5c>
80003d60:	00c42783          	lw	a5,12(s0)
80003d64:	00000993          	li	s3,0
80003d68:	0407f793          	andi	a5,a5,64
80003d6c:	04079a63          	bnez	a5,80003dc0 <eeprom_write_page+0x188>
80003d70:	000a0493          	mv	s1,s4
80003d74:	fffa0b13          	addi	s6,s4,-1
80003d78:	6a090913          	addi	s2,s2,1696
80003d7c:	f349d6e3          	bge	s3,s4,80003ca8 <eeprom_write_page+0x70>
80003d80:	00200513          	li	a0,2
80003d84:	415010ef          	jal	ra,80005998 <delay_us>
80003d88:	01100793          	li	a5,17
80003d8c:	013b1463          	bne	s6,s3,80003d94 <eeprom_write_page+0x15c>
80003d90:	01900793          	li	a5,25
80003d94:	013a8733          	add	a4,s5,s3
80003d98:	00074703          	lbu	a4,0(a4)
80003d9c:	00f42623          	sw	a5,12(s0)
80003da0:	00090593          	mv	a1,s2
80003da4:	00e42023          	sw	a4,0(s0)
80003da8:	00040513          	mv	a0,s0
80003dac:	365010ef          	jal	ra,80005910 <i2c_wait_for_busy>
80003db0:	00051e63          	bnez	a0,80003dcc <eeprom_write_page+0x194>
80003db4:	00042623          	sw	zero,12(s0)
80003db8:	00500613          	li	a2,5
80003dbc:	ed9ff06f          	j	80003c94 <eeprom_write_page+0x5c>
80003dc0:	00042623          	sw	zero,12(s0)
80003dc4:	00200613          	li	a2,2
80003dc8:	f3dff06f          	j	80003d04 <eeprom_write_page+0xcc>
80003dcc:	00090593          	mv	a1,s2
80003dd0:	00040513          	mv	a0,s0
80003dd4:	369010ef          	jal	ra,8000593c <i2c_wait_for_release>
80003dd8:	00051863          	bnez	a0,80003de8 <eeprom_write_page+0x1b0>
80003ddc:	00042623          	sw	zero,12(s0)
80003de0:	00600613          	li	a2,6
80003de4:	eb1ff06f          	j	80003c94 <eeprom_write_page+0x5c>
80003de8:	00c42783          	lw	a5,12(s0)
80003dec:	0407f793          	andi	a5,a5,64
80003df0:	00078863          	beqz	a5,80003e00 <eeprom_write_page+0x1c8>
80003df4:	00042623          	sw	zero,12(s0)
80003df8:	00300613          	li	a2,3
80003dfc:	f09ff06f          	j	80003d04 <eeprom_write_page+0xcc>
80003e00:	00198993          	addi	s3,s3,1
80003e04:	f79ff06f          	j	80003d7c <eeprom_write_page+0x144>

80003e08 <eeprom_poll>:
80003e08:	ff010113          	addi	sp,sp,-16
80003e0c:	00812423          	sw	s0,8(sp)
80003e10:	00912223          	sw	s1,4(sp)
80003e14:	00112623          	sw	ra,12(sp)
80003e18:	01d00793          	li	a5,29
80003e1c:	00159593          	slli	a1,a1,0x1
80003e20:	00f52623          	sw	a5,12(a0)
80003e24:	000184b7          	lui	s1,0x18
80003e28:	00b52023          	sw	a1,0(a0)
80003e2c:	6a048593          	addi	a1,s1,1696 # 186a0 <_stack_size+0x17ea0>
80003e30:	00050413          	mv	s0,a0
80003e34:	2dd010ef          	jal	ra,80005910 <i2c_wait_for_busy>
80003e38:	00100613          	li	a2,1
80003e3c:	00050c63          	beqz	a0,80003e54 <eeprom_poll+0x4c>
80003e40:	6a048593          	addi	a1,s1,1696
80003e44:	00040513          	mv	a0,s0
80003e48:	2f5010ef          	jal	ra,8000593c <i2c_wait_for_release>
80003e4c:	02051863          	bnez	a0,80003e7c <eeprom_poll+0x74>
80003e50:	00200613          	li	a2,2
80003e54:	80002537          	lui	a0,0x80002
80003e58:	00040593          	mv	a1,s0
80003e5c:	44050513          	addi	a0,a0,1088 # 80002440 <_heap_end+0xffff0440>
80003e60:	41c0a0ef          	jal	ra,8000e27c <iprintf>
80003e64:	fff00513          	li	a0,-1
80003e68:	00c12083          	lw	ra,12(sp)
80003e6c:	00812403          	lw	s0,8(sp)
80003e70:	00412483          	lw	s1,4(sp)
80003e74:	01010113          	addi	sp,sp,16
80003e78:	00008067          	ret
80003e7c:	00c42503          	lw	a0,12(s0)
80003e80:	00655513          	srli	a0,a0,0x6
80003e84:	00157513          	andi	a0,a0,1
80003e88:	fe1ff06f          	j	80003e68 <eeprom_poll+0x60>

80003e8c <eeprom_read_page>:
80003e8c:	fd010113          	addi	sp,sp,-48
80003e90:	02812423          	sw	s0,40(sp)
80003e94:	02912223          	sw	s1,36(sp)
80003e98:	03212023          	sw	s2,32(sp)
80003e9c:	01312e23          	sw	s3,28(sp)
80003ea0:	01412c23          	sw	s4,24(sp)
80003ea4:	01512a23          	sw	s5,20(sp)
80003ea8:	01612823          	sw	s6,16(sp)
80003eac:	02112623          	sw	ra,44(sp)
80003eb0:	01712623          	sw	s7,12(sp)
80003eb4:	01500993          	li	s3,21
80003eb8:	00159493          	slli	s1,a1,0x1
80003ebc:	01352623          	sw	s3,12(a0)
80003ec0:	00018937          	lui	s2,0x18
80003ec4:	00952023          	sw	s1,0(a0)
80003ec8:	6a090593          	addi	a1,s2,1696 # 186a0 <_stack_size+0x17ea0>
80003ecc:	00050413          	mv	s0,a0
80003ed0:	00060b13          	mv	s6,a2
80003ed4:	00068a13          	mv	s4,a3
80003ed8:	00070a93          	mv	s5,a4
80003edc:	235010ef          	jal	ra,80005910 <i2c_wait_for_busy>
80003ee0:	00051e63          	bnez	a0,80003efc <eeprom_read_page+0x70>
80003ee4:	00042623          	sw	zero,12(s0)
80003ee8:	00100613          	li	a2,1
80003eec:	80002537          	lui	a0,0x80002
80003ef0:	00040593          	mv	a1,s0
80003ef4:	46850513          	addi	a0,a0,1128 # 80002468 <_heap_end+0xffff0468>
80003ef8:	0400006f          	j	80003f38 <eeprom_read_page+0xac>
80003efc:	6a090593          	addi	a1,s2,1696
80003f00:	00040513          	mv	a0,s0
80003f04:	239010ef          	jal	ra,8000593c <i2c_wait_for_release>
80003f08:	00051863          	bnez	a0,80003f18 <eeprom_read_page+0x8c>
80003f0c:	00042623          	sw	zero,12(s0)
80003f10:	00200613          	li	a2,2
80003f14:	fd9ff06f          	j	80003eec <eeprom_read_page+0x60>
80003f18:	00c42783          	lw	a5,12(s0)
80003f1c:	0407f793          	andi	a5,a5,64
80003f20:	04078863          	beqz	a5,80003f70 <eeprom_read_page+0xe4>
80003f24:	00042623          	sw	zero,12(s0)
80003f28:	00100613          	li	a2,1
80003f2c:	80002537          	lui	a0,0x80002
80003f30:	00040593          	mv	a1,s0
80003f34:	49850513          	addi	a0,a0,1176 # 80002498 <_heap_end+0xffff0498>
80003f38:	3440a0ef          	jal	ra,8000e27c <iprintf>
80003f3c:	fff00493          	li	s1,-1
80003f40:	02c12083          	lw	ra,44(sp)
80003f44:	02812403          	lw	s0,40(sp)
80003f48:	00048513          	mv	a0,s1
80003f4c:	02012903          	lw	s2,32(sp)
80003f50:	02412483          	lw	s1,36(sp)
80003f54:	01c12983          	lw	s3,28(sp)
80003f58:	01812a03          	lw	s4,24(sp)
80003f5c:	01412a83          	lw	s5,20(sp)
80003f60:	01012b03          	lw	s6,16(sp)
80003f64:	00c12b83          	lw	s7,12(sp)
80003f68:	03010113          	addi	sp,sp,48
80003f6c:	00008067          	ret
80003f70:	00200513          	li	a0,2
80003f74:	225010ef          	jal	ra,80005998 <delay_us>
80003f78:	01900793          	li	a5,25
80003f7c:	00f42623          	sw	a5,12(s0)
80003f80:	01642023          	sw	s6,0(s0)
80003f84:	6a090593          	addi	a1,s2,1696
80003f88:	00040513          	mv	a0,s0
80003f8c:	185010ef          	jal	ra,80005910 <i2c_wait_for_busy>
80003f90:	00051863          	bnez	a0,80003fa0 <eeprom_read_page+0x114>
80003f94:	00042623          	sw	zero,12(s0)
80003f98:	00300613          	li	a2,3
80003f9c:	f51ff06f          	j	80003eec <eeprom_read_page+0x60>
80003fa0:	6a090593          	addi	a1,s2,1696
80003fa4:	00040513          	mv	a0,s0
80003fa8:	195010ef          	jal	ra,8000593c <i2c_wait_for_release>
80003fac:	00051863          	bnez	a0,80003fbc <eeprom_read_page+0x130>
80003fb0:	00042623          	sw	zero,12(s0)
80003fb4:	00400613          	li	a2,4
80003fb8:	f35ff06f          	j	80003eec <eeprom_read_page+0x60>
80003fbc:	00c42783          	lw	a5,12(s0)
80003fc0:	0407f793          	andi	a5,a5,64
80003fc4:	00078863          	beqz	a5,80003fd4 <eeprom_read_page+0x148>
80003fc8:	00042623          	sw	zero,12(s0)
80003fcc:	00200613          	li	a2,2
80003fd0:	f5dff06f          	j	80003f2c <eeprom_read_page+0xa0>
80003fd4:	00200513          	li	a0,2
80003fd8:	1c1010ef          	jal	ra,80005998 <delay_us>
80003fdc:	0014e493          	ori	s1,s1,1
80003fe0:	01342623          	sw	s3,12(s0)
80003fe4:	00942023          	sw	s1,0(s0)
80003fe8:	6a090593          	addi	a1,s2,1696
80003fec:	00040513          	mv	a0,s0
80003ff0:	121010ef          	jal	ra,80005910 <i2c_wait_for_busy>
80003ff4:	00051863          	bnez	a0,80004004 <eeprom_read_page+0x178>
80003ff8:	00042623          	sw	zero,12(s0)
80003ffc:	00500613          	li	a2,5
80004000:	eedff06f          	j	80003eec <eeprom_read_page+0x60>
80004004:	6a090593          	addi	a1,s2,1696
80004008:	00040513          	mv	a0,s0
8000400c:	131010ef          	jal	ra,8000593c <i2c_wait_for_release>
80004010:	00051863          	bnez	a0,80004020 <eeprom_read_page+0x194>
80004014:	00042623          	sw	zero,12(s0)
80004018:	00600613          	li	a2,6
8000401c:	ed1ff06f          	j	80003eec <eeprom_read_page+0x60>
80004020:	00c42783          	lw	a5,12(s0)
80004024:	00000993          	li	s3,0
80004028:	0407f793          	andi	a5,a5,64
8000402c:	04079863          	bnez	a5,8000407c <eeprom_read_page+0x1f0>
80004030:	000a0493          	mv	s1,s4
80004034:	fffa0b13          	addi	s6,s4,-1
80004038:	0ff00b93          	li	s7,255
8000403c:	6a090913          	addi	s2,s2,1696
80004040:	f149d0e3          	bge	s3,s4,80003f40 <eeprom_read_page+0xb4>
80004044:	00200513          	li	a0,2
80004048:	151010ef          	jal	ra,80005998 <delay_us>
8000404c:	02100793          	li	a5,33
80004050:	013b1463          	bne	s6,s3,80004058 <eeprom_read_page+0x1cc>
80004054:	00900793          	li	a5,9
80004058:	00f42623          	sw	a5,12(s0)
8000405c:	01742023          	sw	s7,0(s0)
80004060:	00090593          	mv	a1,s2
80004064:	00040513          	mv	a0,s0
80004068:	0a9010ef          	jal	ra,80005910 <i2c_wait_for_busy>
8000406c:	00051e63          	bnez	a0,80004088 <eeprom_read_page+0x1fc>
80004070:	00042623          	sw	zero,12(s0)
80004074:	00700613          	li	a2,7
80004078:	e75ff06f          	j	80003eec <eeprom_read_page+0x60>
8000407c:	00042623          	sw	zero,12(s0)
80004080:	00300613          	li	a2,3
80004084:	ea9ff06f          	j	80003f2c <eeprom_read_page+0xa0>
80004088:	00090593          	mv	a1,s2
8000408c:	00040513          	mv	a0,s0
80004090:	0ad010ef          	jal	ra,8000593c <i2c_wait_for_release>
80004094:	00051863          	bnez	a0,800040a4 <eeprom_read_page+0x218>
80004098:	00042623          	sw	zero,12(s0)
8000409c:	00800613          	li	a2,8
800040a0:	e4dff06f          	j	80003eec <eeprom_read_page+0x60>
800040a4:	00442703          	lw	a4,4(s0)
800040a8:	013a87b3          	add	a5,s5,s3
800040ac:	00198993          	addi	s3,s3,1
800040b0:	00e78023          	sb	a4,0(a5)
800040b4:	f8dff06f          	j	80004040 <eeprom_read_page+0x1b4>

800040b8 <eeprom_probe>:
800040b8:	fe010113          	addi	sp,sp,-32
800040bc:	00912a23          	sw	s1,20(sp)
800040c0:	00050493          	mv	s1,a0
800040c4:	80002537          	lui	a0,0x80002
800040c8:	05000593          	li	a1,80
800040cc:	4c450513          	addi	a0,a0,1220 # 800024c4 <_heap_end+0xffff04c4>
800040d0:	00112e23          	sw	ra,28(sp)
800040d4:	01212823          	sw	s2,16(sp)
800040d8:	00812c23          	sw	s0,24(sp)
800040dc:	1a00a0ef          	jal	ra,8000e27c <iprintf>
800040e0:	deadc7b7          	lui	a5,0xdeadc
800040e4:	eef78793          	addi	a5,a5,-273 # deadbeef <_heap_end+0x5eac9eef>
800040e8:	00c10713          	addi	a4,sp,12
800040ec:	00400693          	li	a3,4
800040f0:	07c00613          	li	a2,124
800040f4:	05000593          	li	a1,80
800040f8:	00048513          	mv	a0,s1
800040fc:	00f12623          	sw	a5,12(sp)
80004100:	b39ff0ef          	jal	ra,80003c38 <eeprom_write_page>
80004104:	00400793          	li	a5,4
80004108:	00a00913          	li	s2,10
8000410c:	00f50c63          	beq	a0,a5,80004124 <eeprom_probe+0x6c>
80004110:	80002537          	lui	a0,0x80002
80004114:	05000593          	li	a1,80
80004118:	4e050513          	addi	a0,a0,1248 # 800024e0 <_heap_end+0xffff04e0>
8000411c:	1600a0ef          	jal	ra,8000e27c <iprintf>
80004120:	0580006f          	j	80004178 <eeprom_probe+0xc0>
80004124:	05000593          	li	a1,80
80004128:	00048513          	mv	a0,s1
8000412c:	cddff0ef          	jal	ra,80003e08 <eeprom_poll>
80004130:	00050413          	mv	s0,a0
80004134:	06050a63          	beqz	a0,800041a8 <eeprom_probe+0xf0>
80004138:	3e800513          	li	a0,1000
8000413c:	fff90913          	addi	s2,s2,-1
80004140:	059010ef          	jal	ra,80005998 <delay_us>
80004144:	fe0910e3          	bnez	s2,80004124 <eeprom_probe+0x6c>
80004148:	80002537          	lui	a0,0x80002
8000414c:	05000593          	li	a1,80
80004150:	58450513          	addi	a0,a0,1412 # 80002584 <_heap_end+0xffff0584>
80004154:	fc9ff06f          	j	8000411c <eeprom_probe+0x64>
80004158:	00c12603          	lw	a2,12(sp)
8000415c:	deadc7b7          	lui	a5,0xdeadc
80004160:	eef78793          	addi	a5,a5,-273 # deadbeef <_heap_end+0x5eac9eef>
80004164:	05000593          	li	a1,80
80004168:	00f60c63          	beq	a2,a5,80004180 <eeprom_probe+0xc8>
8000416c:	80002537          	lui	a0,0x80002
80004170:	53850513          	addi	a0,a0,1336 # 80002538 <_heap_end+0xffff0538>
80004174:	1080a0ef          	jal	ra,8000e27c <iprintf>
80004178:	fff00413          	li	s0,-1
8000417c:	0100006f          	j	8000418c <eeprom_probe+0xd4>
80004180:	80002537          	lui	a0,0x80002
80004184:	56c50513          	addi	a0,a0,1388 # 8000256c <_heap_end+0xffff056c>
80004188:	0f40a0ef          	jal	ra,8000e27c <iprintf>
8000418c:	00040513          	mv	a0,s0
80004190:	01c12083          	lw	ra,28(sp)
80004194:	01812403          	lw	s0,24(sp)
80004198:	01412483          	lw	s1,20(sp)
8000419c:	01012903          	lw	s2,16(sp)
800041a0:	02010113          	addi	sp,sp,32
800041a4:	00008067          	ret
800041a8:	00c10713          	addi	a4,sp,12
800041ac:	00400693          	li	a3,4
800041b0:	07c00613          	li	a2,124
800041b4:	05000593          	li	a1,80
800041b8:	00048513          	mv	a0,s1
800041bc:	00012623          	sw	zero,12(sp)
800041c0:	ccdff0ef          	jal	ra,80003e8c <eeprom_read_page>
800041c4:	00400793          	li	a5,4
800041c8:	f8f508e3          	beq	a0,a5,80004158 <eeprom_probe+0xa0>
800041cc:	80002537          	lui	a0,0x80002
800041d0:	05000593          	li	a1,80
800041d4:	50c50513          	addi	a0,a0,1292 # 8000250c <_heap_end+0xffff050c>
800041d8:	f45ff06f          	j	8000411c <eeprom_probe+0x64>

800041dc <modbus_error>:
800041dc:	ff010113          	addi	sp,sp,-16
800041e0:	00812423          	sw	s0,8(sp)
800041e4:	00912223          	sw	s1,4(sp)
800041e8:	01212023          	sw	s2,0(sp)
800041ec:	00060413          	mv	s0,a2
800041f0:	00058913          	mv	s2,a1
800041f4:	00058613          	mv	a2,a1
800041f8:	00050493          	mv	s1,a0
800041fc:	00050593          	mv	a1,a0
80004200:	80002537          	lui	a0,0x80002
80004204:	5f850513          	addi	a0,a0,1528 # 800025f8 <_heap_end+0xffff05f8>
80004208:	00112623          	sw	ra,12(sp)
8000420c:	0700a0ef          	jal	ra,8000e27c <iprintf>
80004210:	9901c783          	lbu	a5,-1648(gp) # 80003130 <active_config+0x14>
80004214:	f804e493          	ori	s1,s1,-128
80004218:	009400a3          	sb	s1,1(s0)
8000421c:	01240123          	sb	s2,2(s0)
80004220:	00040513          	mv	a0,s0
80004224:	00f40023          	sb	a5,0(s0)
80004228:	00300593          	li	a1,3
8000422c:	a68ff0ef          	jal	ra,80003494 <add_crc>
80004230:	00c12083          	lw	ra,12(sp)
80004234:	00812403          	lw	s0,8(sp)
80004238:	00412483          	lw	s1,4(sp)
8000423c:	00012903          	lw	s2,0(sp)
80004240:	00500513          	li	a0,5
80004244:	01010113          	addi	sp,sp,16
80004248:	00008067          	ret

8000424c <modbus_store_reg>:
8000424c:	fd850793          	addi	a5,a0,-40
80004250:	fd010113          	addi	sp,sp,-48
80004254:	01079793          	slli	a5,a5,0x10
80004258:	02912223          	sw	s1,36(sp)
8000425c:	02112623          	sw	ra,44(sp)
80004260:	02812423          	sw	s0,40(sp)
80004264:	0107d793          	srli	a5,a5,0x10
80004268:	00900713          	li	a4,9
8000426c:	00058493          	mv	s1,a1
80004270:	02f76063          	bltu	a4,a5,80004290 <modbus_store_reg+0x44>
80004274:	8801a783          	lw	a5,-1920(gp) # 80003020 <reg_config_write>
80004278:	00079c63          	bnez	a5,80004290 <modbus_store_reg+0x44>
8000427c:	80002537          	lui	a0,0x80002
80004280:	61c50513          	addi	a0,a0,1564 # 8000261c <_heap_end+0xffff061c>
80004284:	7f9090ef          	jal	ra,8000e27c <iprintf>
80004288:	ffe00413          	li	s0,-2
8000428c:	0300006f          	j	800042bc <modbus_store_reg+0x70>
80004290:	02f00793          	li	a5,47
80004294:	34f50e63          	beq	a0,a5,800045f0 <modbus_store_reg+0x3a4>
80004298:	0aa7e063          	bltu	a5,a0,80004338 <modbus_store_reg+0xec>
8000429c:	02a00793          	li	a5,42
800042a0:	2ef50863          	beq	a0,a5,80004590 <modbus_store_reg+0x344>
800042a4:	02a7e863          	bltu	a5,a0,800042d4 <modbus_store_reg+0x88>
800042a8:	02000793          	li	a5,32
800042ac:	18f50c63          	beq	a0,a5,80004444 <modbus_store_reg+0x1f8>
800042b0:	02900793          	li	a5,41
800042b4:	2af50463          	beq	a0,a5,8000455c <modbus_store_reg+0x310>
800042b8:	fff00413          	li	s0,-1
800042bc:	00040513          	mv	a0,s0
800042c0:	02c12083          	lw	ra,44(sp)
800042c4:	02812403          	lw	s0,40(sp)
800042c8:	02412483          	lw	s1,36(sp)
800042cc:	03010113          	addi	sp,sp,48
800042d0:	00008067          	ret
800042d4:	02c00793          	li	a5,44
800042d8:	20f50e63          	beq	a0,a5,800044f4 <modbus_store_reg+0x2a8>
800042dc:	2ef56263          	bltu	a0,a5,800045c0 <modbus_store_reg+0x374>
800042e0:	02d00793          	li	a5,45
800042e4:	fcf51ae3          	bne	a0,a5,800042b8 <modbus_store_reg+0x6c>
800042e8:	00010513          	mv	a0,sp
800042ec:	f64ff0ef          	jal	ra,80003a50 <config_load>
800042f0:	00055c63          	bgez	a0,80004308 <modbus_store_reg+0xbc>
800042f4:	800035b7          	lui	a1,0x80003
800042f8:	02000613          	li	a2,32
800042fc:	f1058593          	addi	a1,a1,-240 # 80002f10 <_heap_end+0xffff0f10>
80004300:	00010513          	mv	a0,sp
80004304:	339090ef          	jal	ra,8000de3c <memcpy>
80004308:	0004c783          	lbu	a5,0(s1)
8000430c:	0014c703          	lbu	a4,1(s1)
80004310:	01879793          	slli	a5,a5,0x18
80004314:	01071713          	slli	a4,a4,0x10
80004318:	00e7e7b3          	or	a5,a5,a4
8000431c:	0034c703          	lbu	a4,3(s1)
80004320:	00e7e7b3          	or	a5,a5,a4
80004324:	0024c703          	lbu	a4,2(s1)
80004328:	00871713          	slli	a4,a4,0x8
8000432c:	00e7e7b3          	or	a5,a5,a4
80004330:	00f12c23          	sw	a5,24(sp)
80004334:	1e80006f          	j	8000451c <modbus_store_reg+0x2d0>
80004338:	03300793          	li	a5,51
8000433c:	0cf50e63          	beq	a0,a5,80004418 <modbus_store_reg+0x1cc>
80004340:	0aa7e863          	bltu	a5,a0,800043f0 <modbus_store_reg+0x1a4>
80004344:	03100793          	li	a5,49
80004348:	1ef50463          	beq	a0,a5,80004530 <modbus_store_reg+0x2e4>
8000434c:	16a7f063          	bgeu	a5,a0,800044ac <modbus_store_reg+0x260>
80004350:	0014c783          	lbu	a5,1(s1)
80004354:	0004c503          	lbu	a0,0(s1)
80004358:	0024c583          	lbu	a1,2(s1)
8000435c:	00879793          	slli	a5,a5,0x8
80004360:	00a7e7b3          	or	a5,a5,a0
80004364:	00879513          	slli	a0,a5,0x8
80004368:	0087d793          	srli	a5,a5,0x8
8000436c:	00f567b3          	or	a5,a0,a5
80004370:	01079513          	slli	a0,a5,0x10
80004374:	0034c783          	lbu	a5,3(s1)
80004378:	0044c703          	lbu	a4,4(s1)
8000437c:	01055513          	srli	a0,a0,0x10
80004380:	00879793          	slli	a5,a5,0x8
80004384:	00b7e7b3          	or	a5,a5,a1
80004388:	00879593          	slli	a1,a5,0x8
8000438c:	0087d793          	srli	a5,a5,0x8
80004390:	00f5e7b3          	or	a5,a1,a5
80004394:	01079593          	slli	a1,a5,0x10
80004398:	0054c783          	lbu	a5,5(s1)
8000439c:	0105d593          	srli	a1,a1,0x10
800043a0:	ffd00413          	li	s0,-3
800043a4:	00879793          	slli	a5,a5,0x8
800043a8:	00e7e7b3          	or	a5,a5,a4
800043ac:	00879713          	slli	a4,a5,0x8
800043b0:	0087d793          	srli	a5,a5,0x8
800043b4:	00f767b3          	or	a5,a4,a5
800043b8:	01079793          	slli	a5,a5,0x10
800043bc:	0107d793          	srli	a5,a5,0x10
800043c0:	ffa60713          	addi	a4,a2,-6
800043c4:	ee060ce3          	beqz	a2,800042bc <modbus_store_reg+0x70>
800043c8:	800036b7          	lui	a3,0x80003
800043cc:	fa06a603          	lw	a2,-96(a3) # 80002fa0 <_heap_end+0xffff0fa0>
800043d0:	00648693          	addi	a3,s1,6
800043d4:	04079e63          	bnez	a5,80004430 <modbus_store_reg+0x1e4>
800043d8:	800007b7          	lui	a5,0x80000
800043dc:	00800893          	li	a7,8
800043e0:	00600813          	li	a6,6
800043e4:	13478793          	addi	a5,a5,308 # 80000134 <_heap_end+0xfffee134>
800043e8:	168010ef          	jal	ra,80005550 <hub_print>
800043ec:	03c0006f          	j	80004428 <modbus_store_reg+0x1dc>
800043f0:	07e00793          	li	a5,126
800043f4:	08f50063          	beq	a0,a5,80004474 <modbus_store_reg+0x228>
800043f8:	07f00793          	li	a5,127
800043fc:	0af50463          	beq	a0,a5,800044a4 <modbus_store_reg+0x258>
80004400:	03400793          	li	a5,52
80004404:	eaf51ae3          	bne	a0,a5,800042b8 <modbus_store_reg+0x6c>
80004408:	0034c703          	lbu	a4,3(s1)
8000440c:	800037b7          	lui	a5,0x80003
80004410:	fae7a023          	sw	a4,-96(a5) # 80002fa0 <_heap_end+0xffff0fa0>
80004414:	0140006f          	j	80004428 <modbus_store_reg+0x1dc>
80004418:	8b81a603          	lw	a2,-1864(gp) # 80003058 <hub_frame_size>
8000441c:	00000593          	li	a1,0
80004420:	f0050537          	lui	a0,0xf0050
80004424:	5e8080ef          	jal	ra,8000ca0c <memset>
80004428:	00000413          	li	s0,0
8000442c:	e91ff06f          	j	800042bc <modbus_store_reg+0x70>
80004430:	800007b7          	lui	a5,0x80000
80004434:	01000893          	li	a7,16
80004438:	00c00813          	li	a6,12
8000443c:	73478793          	addi	a5,a5,1844 # 80000734 <_heap_end+0xfffee734>
80004440:	fa9ff06f          	j	800043e8 <modbus_store_reg+0x19c>
80004444:	0004c783          	lbu	a5,0(s1)
80004448:	0014c703          	lbu	a4,1(s1)
8000444c:	01879793          	slli	a5,a5,0x18
80004450:	01071713          	slli	a4,a4,0x10
80004454:	00e7e7b3          	or	a5,a5,a4
80004458:	0034c703          	lbu	a4,3(s1)
8000445c:	00e7e7b3          	or	a5,a5,a4
80004460:	0024c703          	lbu	a4,2(s1)
80004464:	00871713          	slli	a4,a4,0x8
80004468:	00e7e7b3          	or	a5,a5,a4
8000446c:	88f1a223          	sw	a5,-1916(gp) # 80003024 <reg_scratch>
80004470:	fb9ff06f          	j	80004428 <modbus_store_reg+0x1dc>
80004474:	0004c783          	lbu	a5,0(s1)
80004478:	0014c703          	lbu	a4,1(s1)
8000447c:	01879793          	slli	a5,a5,0x18
80004480:	01071713          	slli	a4,a4,0x10
80004484:	00e7e7b3          	or	a5,a5,a4
80004488:	0034c703          	lbu	a4,3(s1)
8000448c:	00e7e7b3          	or	a5,a5,a4
80004490:	0024c703          	lbu	a4,2(s1)
80004494:	00871713          	slli	a4,a4,0x8
80004498:	00e7e7b3          	or	a5,a5,a4
8000449c:	88f1a023          	sw	a5,-1920(gp) # 80003020 <reg_config_write>
800044a0:	f89ff06f          	j	80004428 <modbus_store_reg+0x1dc>
800044a4:	660010ef          	jal	ra,80005b04 <hard_reboot>
800044a8:	f81ff06f          	j	80004428 <modbus_store_reg+0x1dc>
800044ac:	0034c503          	lbu	a0,3(s1)
800044b0:	475000ef          	jal	ra,80005124 <hub_init>
800044b4:	00050413          	mv	s0,a0
800044b8:	dc0518e3          	bnez	a0,80004288 <modbus_store_reg+0x3c>
800044bc:	00010513          	mv	a0,sp
800044c0:	d90ff0ef          	jal	ra,80003a50 <config_load>
800044c4:	00055c63          	bgez	a0,800044dc <modbus_store_reg+0x290>
800044c8:	800035b7          	lui	a1,0x80003
800044cc:	02000613          	li	a2,32
800044d0:	f1058593          	addi	a1,a1,-240 # 80002f10 <_heap_end+0xffff0f10>
800044d4:	00010513          	mv	a0,sp
800044d8:	165090ef          	jal	ra,8000de3c <memcpy>
800044dc:	0034c783          	lbu	a5,3(s1)
800044e0:	00010513          	mv	a0,sp
800044e4:	00f109a3          	sb	a5,19(sp)
800044e8:	e40ff0ef          	jal	ra,80003b28 <config_save>
800044ec:	dc0558e3          	bgez	a0,800042bc <modbus_store_reg+0x70>
800044f0:	d99ff06f          	j	80004288 <modbus_store_reg+0x3c>
800044f4:	00010513          	mv	a0,sp
800044f8:	d58ff0ef          	jal	ra,80003a50 <config_load>
800044fc:	00055c63          	bgez	a0,80004514 <modbus_store_reg+0x2c8>
80004500:	800035b7          	lui	a1,0x80003
80004504:	02000613          	li	a2,32
80004508:	f1058593          	addi	a1,a1,-240 # 80002f10 <_heap_end+0xffff0f10>
8000450c:	00010513          	mv	a0,sp
80004510:	12d090ef          	jal	ra,8000de3c <memcpy>
80004514:	0034c783          	lbu	a5,3(s1)
80004518:	00f10a23          	sb	a5,20(sp)
8000451c:	00010513          	mv	a0,sp
80004520:	e08ff0ef          	jal	ra,80003b28 <config_save>
80004524:	41f55513          	srai	a0,a0,0x1f
80004528:	ffe57413          	andi	s0,a0,-2
8000452c:	d91ff06f          	j	800042bc <modbus_store_reg+0x70>
80004530:	00010513          	mv	a0,sp
80004534:	d1cff0ef          	jal	ra,80003a50 <config_load>
80004538:	00055c63          	bgez	a0,80004550 <modbus_store_reg+0x304>
8000453c:	800035b7          	lui	a1,0x80003
80004540:	02000613          	li	a2,32
80004544:	f1058593          	addi	a1,a1,-240 # 80002f10 <_heap_end+0xffff0f10>
80004548:	00010513          	mv	a0,sp
8000454c:	0f1090ef          	jal	ra,8000de3c <memcpy>
80004550:	0034c783          	lbu	a5,3(s1)
80004554:	00f10623          	sb	a5,12(sp)
80004558:	fc5ff06f          	j	8000451c <modbus_store_reg+0x2d0>
8000455c:	00010513          	mv	a0,sp
80004560:	cf0ff0ef          	jal	ra,80003a50 <config_load>
80004564:	00055c63          	bgez	a0,8000457c <modbus_store_reg+0x330>
80004568:	800035b7          	lui	a1,0x80003
8000456c:	02000613          	li	a2,32
80004570:	f1058593          	addi	a1,a1,-240 # 80002f10 <_heap_end+0xffff0f10>
80004574:	00010513          	mv	a0,sp
80004578:	0c5090ef          	jal	ra,8000de3c <memcpy>
8000457c:	00400613          	li	a2,4
80004580:	00348593          	addi	a1,s1,3
80004584:	00010513          	mv	a0,sp
80004588:	5b0010ef          	jal	ra,80005b38 <memcpy_rev>
8000458c:	f91ff06f          	j	8000451c <modbus_store_reg+0x2d0>
80004590:	00010513          	mv	a0,sp
80004594:	cbcff0ef          	jal	ra,80003a50 <config_load>
80004598:	00055c63          	bgez	a0,800045b0 <modbus_store_reg+0x364>
8000459c:	800035b7          	lui	a1,0x80003
800045a0:	02000613          	li	a2,32
800045a4:	f1058593          	addi	a1,a1,-240 # 80002f10 <_heap_end+0xffff0f10>
800045a8:	00010513          	mv	a0,sp
800045ac:	091090ef          	jal	ra,8000de3c <memcpy>
800045b0:	00400613          	li	a2,4
800045b4:	00348593          	addi	a1,s1,3
800045b8:	00410513          	addi	a0,sp,4
800045bc:	fcdff06f          	j	80004588 <modbus_store_reg+0x33c>
800045c0:	00010513          	mv	a0,sp
800045c4:	c8cff0ef          	jal	ra,80003a50 <config_load>
800045c8:	00055c63          	bgez	a0,800045e0 <modbus_store_reg+0x394>
800045cc:	800035b7          	lui	a1,0x80003
800045d0:	02000613          	li	a2,32
800045d4:	f1058593          	addi	a1,a1,-240 # 80002f10 <_heap_end+0xffff0f10>
800045d8:	00010513          	mv	a0,sp
800045dc:	061090ef          	jal	ra,8000de3c <memcpy>
800045e0:	00400613          	li	a2,4
800045e4:	00348593          	addi	a1,s1,3
800045e8:	00810513          	addi	a0,sp,8
800045ec:	f9dff06f          	j	80004588 <modbus_store_reg+0x33c>
800045f0:	00010513          	mv	a0,sp
800045f4:	c5cff0ef          	jal	ra,80003a50 <config_load>
800045f8:	00055c63          	bgez	a0,80004610 <modbus_store_reg+0x3c4>
800045fc:	800035b7          	lui	a1,0x80003
80004600:	02000613          	li	a2,32
80004604:	f1058593          	addi	a1,a1,-240 # 80002f10 <_heap_end+0xffff0f10>
80004608:	00010513          	mv	a0,sp
8000460c:	031090ef          	jal	ra,8000de3c <memcpy>
80004610:	00600613          	li	a2,6
80004614:	00048593          	mv	a1,s1
80004618:	00d10513          	addi	a0,sp,13
8000461c:	021090ef          	jal	ra,8000de3c <memcpy>
80004620:	efdff06f          	j	8000451c <modbus_store_reg+0x2d0>

80004624 <modbus_recv>:
80004624:	fb010113          	addi	sp,sp,-80
80004628:	04812423          	sw	s0,72(sp)
8000462c:	04112623          	sw	ra,76(sp)
80004630:	04912223          	sw	s1,68(sp)
80004634:	05212023          	sw	s2,64(sp)
80004638:	03312e23          	sw	s3,60(sp)
8000463c:	03412c23          	sw	s4,56(sp)
80004640:	03512a23          	sw	s5,52(sp)
80004644:	03612823          	sw	s6,48(sp)
80004648:	03712623          	sw	s7,44(sp)
8000464c:	03812423          	sw	s8,40(sp)
80004650:	fff00413          	li	s0,-1
80004654:	12050063          	beqz	a0,80004774 <modbus_recv+0x150>
80004658:	10060e63          	beqz	a2,80004774 <modbus_recv+0x150>
8000465c:	00400793          	li	a5,4
80004660:	10b7da63          	bge	a5,a1,80004774 <modbus_recv+0x150>
80004664:	00058a93          	mv	s5,a1
80004668:	ffe58593          	addi	a1,a1,-2
8000466c:	01059593          	slli	a1,a1,0x10
80004670:	0105d593          	srli	a1,a1,0x10
80004674:	00050a13          	mv	s4,a0
80004678:	00060493          	mv	s1,a2
8000467c:	dc1fe0ef          	jal	ra,8000343c <crc16>
80004680:	015a07b3          	add	a5,s4,s5
80004684:	fff7c603          	lbu	a2,-1(a5)
80004688:	ffe7c783          	lbu	a5,-2(a5)
8000468c:	00050593          	mv	a1,a0
80004690:	00861613          	slli	a2,a2,0x8
80004694:	00f66633          	or	a2,a2,a5
80004698:	40c51e63          	bne	a0,a2,80004ab4 <modbus_recv+0x490>
8000469c:	97c18713          	addi	a4,gp,-1668 # 8000311c <active_config>
800046a0:	000a4583          	lbu	a1,0(s4)
800046a4:	01474603          	lbu	a2,20(a4)
800046a8:	001a4903          	lbu	s2,1(s4)
800046ac:	97c18b13          	addi	s6,gp,-1668 # 8000311c <active_config>
800046b0:	00c58863          	beq	a1,a2,800046c0 <modbus_recv+0x9c>
800046b4:	3e059663          	bnez	a1,80004aa0 <modbus_recv+0x47c>
800046b8:	01100793          	li	a5,17
800046bc:	3ef91263          	bne	s2,a5,80004aa0 <modbus_recv+0x47c>
800046c0:	002a4403          	lbu	s0,2(s4)
800046c4:	003a4783          	lbu	a5,3(s4)
800046c8:	08000613          	li	a2,128
800046cc:	00841413          	slli	s0,s0,0x8
800046d0:	00f46433          	or	s0,s0,a5
800046d4:	00000593          	li	a1,0
800046d8:	00048513          	mv	a0,s1
800046dc:	01041413          	slli	s0,s0,0x10
800046e0:	004a4983          	lbu	s3,4(s4)
800046e4:	005a4c03          	lbu	s8,5(s4)
800046e8:	324080ef          	jal	ra,8000ca0c <memset>
800046ec:	014b4783          	lbu	a5,20(s6)
800046f0:	41045413          	srai	s0,s0,0x10
800046f4:	01041b93          	slli	s7,s0,0x10
800046f8:	010bdb93          	srli	s7,s7,0x10
800046fc:	80002537          	lui	a0,0x80002
80004700:	00f48023          	sb	a5,0(s1)
80004704:	012480a3          	sb	s2,1(s1)
80004708:	000b8613          	mv	a2,s7
8000470c:	00090593          	mv	a1,s2
80004710:	65c50513          	addi	a0,a0,1628 # 8000265c <_heap_end+0xffff065c>
80004714:	369090ef          	jal	ra,8000e27c <iprintf>
80004718:	fff90793          	addi	a5,s2,-1
8000471c:	0ff7f793          	andi	a5,a5,255
80004720:	01000713          	li	a4,16
80004724:	36f76863          	bltu	a4,a5,80004a94 <modbus_recv+0x470>
80004728:	80002737          	lui	a4,0x80002
8000472c:	00279793          	slli	a5,a5,0x2
80004730:	5b470713          	addi	a4,a4,1460 # 800025b4 <_heap_end+0xffff05b4>
80004734:	00e787b3          	add	a5,a5,a4
80004738:	0007a783          	lw	a5,0(a5)
8000473c:	00078067          	jr	a5
80004740:	800026b7          	lui	a3,0x80002
80004744:	800025b7          	lui	a1,0x80002
80004748:	68068693          	addi	a3,a3,1664 # 80002680 <_heap_end+0xffff0680>
8000474c:	00800613          	li	a2,8
80004750:	68c58593          	addi	a1,a1,1676 # 8000268c <_heap_end+0xffff068c>
80004754:	00348513          	addi	a0,s1,3
80004758:	5ad090ef          	jal	ra,8000e504 <siprintf>
8000475c:	02700793          	li	a5,39
80004760:	00f48123          	sb	a5,2(s1)
80004764:	02a00593          	li	a1,42
80004768:	00048513          	mv	a0,s1
8000476c:	d29fe0ef          	jal	ra,80003494 <add_crc>
80004770:	02c00413          	li	s0,44
80004774:	00040513          	mv	a0,s0
80004778:	04c12083          	lw	ra,76(sp)
8000477c:	04812403          	lw	s0,72(sp)
80004780:	04412483          	lw	s1,68(sp)
80004784:	04012903          	lw	s2,64(sp)
80004788:	03c12983          	lw	s3,60(sp)
8000478c:	03812a03          	lw	s4,56(sp)
80004790:	03412a83          	lw	s5,52(sp)
80004794:	03012b03          	lw	s6,48(sp)
80004798:	02c12b83          	lw	s7,44(sp)
8000479c:	02812c03          	lw	s8,40(sp)
800047a0:	05010113          	addi	sp,sp,80
800047a4:	00008067          	ret
800047a8:	00899993          	slli	s3,s3,0x8
800047ac:	0189e9b3          	or	s3,s3,s8
800047b0:	01099993          	slli	s3,s3,0x10
800047b4:	4109d993          	srai	s3,s3,0x10
800047b8:	00100793          	li	a5,1
800047bc:	00048613          	mv	a2,s1
800047c0:	2cf99063          	bne	s3,a5,80004a80 <modbus_recv+0x45c>
800047c4:	02c00793          	li	a5,44
800047c8:	20f40c63          	beq	s0,a5,800049e0 <modbus_recv+0x3bc>
800047cc:	0887c063          	blt	a5,s0,8000484c <modbus_recv+0x228>
800047d0:	02000793          	li	a5,32
800047d4:	14f40e63          	beq	s0,a5,80004930 <modbus_recv+0x30c>
800047d8:	0287c663          	blt	a5,s0,80004804 <modbus_recv+0x1e0>
800047dc:	01e00793          	li	a5,30
800047e0:	0ef40e63          	beq	s0,a5,800048dc <modbus_recv+0x2b8>
800047e4:	01f00793          	li	a5,31
800047e8:	12f40e63          	beq	s0,a5,80004924 <modbus_recv+0x300>
800047ec:	00048613          	mv	a2,s1
800047f0:	00200593          	li	a1,2
800047f4:	00090513          	mv	a0,s2
800047f8:	9e5ff0ef          	jal	ra,800041dc <modbus_error>
800047fc:	00050413          	mv	s0,a0
80004800:	0f00006f          	j	800048f0 <modbus_recv+0x2cc>
80004804:	02a00793          	li	a5,42
80004808:	14f40863          	beq	s0,a5,80004958 <modbus_recv+0x334>
8000480c:	1687cc63          	blt	a5,s0,80004984 <modbus_recv+0x360>
80004810:	02900793          	li	a5,41
80004814:	fcf41ce3          	bne	s0,a5,800047ec <modbus_recv+0x1c8>
80004818:	00010513          	mv	a0,sp
8000481c:	a34ff0ef          	jal	ra,80003a50 <config_load>
80004820:	00055c63          	bgez	a0,80004838 <modbus_recv+0x214>
80004824:	800035b7          	lui	a1,0x80003
80004828:	02000613          	li	a2,32
8000482c:	f1058593          	addi	a1,a1,-240 # 80002f10 <_heap_end+0xffff0f10>
80004830:	00010513          	mv	a0,sp
80004834:	608090ef          	jal	ra,8000de3c <memcpy>
80004838:	00400613          	li	a2,4
8000483c:	00010593          	mv	a1,sp
80004840:	00348513          	addi	a0,s1,3
80004844:	5f8090ef          	jal	ra,8000de3c <memcpy>
80004848:	0a40006f          	j	800048ec <modbus_recv+0x2c8>
8000484c:	03000793          	li	a5,48
80004850:	16f40063          	beq	s0,a5,800049b0 <modbus_recv+0x38c>
80004854:	0487c463          	blt	a5,s0,8000489c <modbus_recv+0x278>
80004858:	02d00793          	li	a5,45
8000485c:	1af40663          	beq	s0,a5,80004a08 <modbus_recv+0x3e4>
80004860:	02f00793          	li	a5,47
80004864:	f8f414e3          	bne	s0,a5,800047ec <modbus_recv+0x1c8>
80004868:	00010513          	mv	a0,sp
8000486c:	9e4ff0ef          	jal	ra,80003a50 <config_load>
80004870:	00055c63          	bgez	a0,80004888 <modbus_recv+0x264>
80004874:	800035b7          	lui	a1,0x80003
80004878:	02000613          	li	a2,32
8000487c:	f1058593          	addi	a1,a1,-240 # 80002f10 <_heap_end+0xffff0f10>
80004880:	00010513          	mv	a0,sp
80004884:	5b8090ef          	jal	ra,8000de3c <memcpy>
80004888:	00600613          	li	a2,6
8000488c:	00d10593          	addi	a1,sp,13
80004890:	00348513          	addi	a0,s1,3
80004894:	5a8090ef          	jal	ra,8000de3c <memcpy>
80004898:	1400006f          	j	800049d8 <modbus_recv+0x3b4>
8000489c:	03400793          	li	a5,52
800048a0:	0af40463          	beq	s0,a5,80004948 <modbus_recv+0x324>
800048a4:	07e00793          	li	a5,126
800048a8:	08f40a63          	beq	s0,a5,8000493c <modbus_recv+0x318>
800048ac:	03100793          	li	a5,49
800048b0:	f2f41ee3          	bne	s0,a5,800047ec <modbus_recv+0x1c8>
800048b4:	00010513          	mv	a0,sp
800048b8:	998ff0ef          	jal	ra,80003a50 <config_load>
800048bc:	00055c63          	bgez	a0,800048d4 <modbus_recv+0x2b0>
800048c0:	800035b7          	lui	a1,0x80003
800048c4:	02000613          	li	a2,32
800048c8:	f1058593          	addi	a1,a1,-240 # 80002f10 <_heap_end+0xffff0f10>
800048cc:	00010513          	mv	a0,sp
800048d0:	56c090ef          	jal	ra,8000de3c <memcpy>
800048d4:	00c14783          	lbu	a5,12(sp)
800048d8:	0fc0006f          	j	800049d4 <modbus_recv+0x3b0>
800048dc:	00400613          	li	a2,4
800048e0:	88b18593          	addi	a1,gp,-1909 # 8000302b <reg_sys_counter+0x3>
800048e4:	00348513          	addi	a0,s1,3
800048e8:	250010ef          	jal	ra,80005b38 <memcpy_rev>
800048ec:	00400413          	li	s0,4
800048f0:	00340593          	addi	a1,s0,3
800048f4:	01059593          	slli	a1,a1,0x10
800048f8:	00848123          	sb	s0,2(s1)
800048fc:	0105d593          	srli	a1,a1,0x10
80004900:	00048513          	mv	a0,s1
80004904:	b91fe0ef          	jal	ra,80003494 <add_crc>
80004908:	00540413          	addi	s0,s0,5
8000490c:	e60414e3          	bnez	s0,80004774 <modbus_recv+0x150>
80004910:	80002537          	lui	a0,0x80002
80004914:	00090593          	mv	a1,s2
80004918:	6ac50513          	addi	a0,a0,1708 # 800026ac <_heap_end+0xffff06ac>
8000491c:	161090ef          	jal	ra,8000e27c <iprintf>
80004920:	e55ff06f          	j	80004774 <modbus_recv+0x150>
80004924:	00400613          	li	a2,4
80004928:	88f18593          	addi	a1,gp,-1905 # 8000302f <reg_irq_counter+0x3>
8000492c:	fb9ff06f          	j	800048e4 <modbus_recv+0x2c0>
80004930:	00400613          	li	a2,4
80004934:	88718593          	addi	a1,gp,-1913 # 80003027 <reg_scratch+0x3>
80004938:	fadff06f          	j	800048e4 <modbus_recv+0x2c0>
8000493c:	00400613          	li	a2,4
80004940:	88318593          	addi	a1,gp,-1917 # 80003023 <reg_config_write+0x3>
80004944:	fa1ff06f          	j	800048e4 <modbus_recv+0x2c0>
80004948:	800035b7          	lui	a1,0x80003
8000494c:	00400613          	li	a2,4
80004950:	fa358593          	addi	a1,a1,-93 # 80002fa3 <_heap_end+0xffff0fa3>
80004954:	f91ff06f          	j	800048e4 <modbus_recv+0x2c0>
80004958:	00010513          	mv	a0,sp
8000495c:	8f4ff0ef          	jal	ra,80003a50 <config_load>
80004960:	00055c63          	bgez	a0,80004978 <modbus_recv+0x354>
80004964:	800035b7          	lui	a1,0x80003
80004968:	02000613          	li	a2,32
8000496c:	f1058593          	addi	a1,a1,-240 # 80002f10 <_heap_end+0xffff0f10>
80004970:	00010513          	mv	a0,sp
80004974:	4c8090ef          	jal	ra,8000de3c <memcpy>
80004978:	00400613          	li	a2,4
8000497c:	00410593          	addi	a1,sp,4
80004980:	ec1ff06f          	j	80004840 <modbus_recv+0x21c>
80004984:	00010513          	mv	a0,sp
80004988:	8c8ff0ef          	jal	ra,80003a50 <config_load>
8000498c:	00055c63          	bgez	a0,800049a4 <modbus_recv+0x380>
80004990:	800035b7          	lui	a1,0x80003
80004994:	02000613          	li	a2,32
80004998:	f1058593          	addi	a1,a1,-240 # 80002f10 <_heap_end+0xffff0f10>
8000499c:	00010513          	mv	a0,sp
800049a0:	49c090ef          	jal	ra,8000de3c <memcpy>
800049a4:	00400613          	li	a2,4
800049a8:	00810593          	addi	a1,sp,8
800049ac:	e95ff06f          	j	80004840 <modbus_recv+0x21c>
800049b0:	00010513          	mv	a0,sp
800049b4:	89cff0ef          	jal	ra,80003a50 <config_load>
800049b8:	00055c63          	bgez	a0,800049d0 <modbus_recv+0x3ac>
800049bc:	800035b7          	lui	a1,0x80003
800049c0:	02000613          	li	a2,32
800049c4:	f1058593          	addi	a1,a1,-240 # 80002f10 <_heap_end+0xffff0f10>
800049c8:	00010513          	mv	a0,sp
800049cc:	470090ef          	jal	ra,8000de3c <memcpy>
800049d0:	01314783          	lbu	a5,19(sp)
800049d4:	00f48323          	sb	a5,6(s1)
800049d8:	00600413          	li	s0,6
800049dc:	f15ff06f          	j	800048f0 <modbus_recv+0x2cc>
800049e0:	00010513          	mv	a0,sp
800049e4:	86cff0ef          	jal	ra,80003a50 <config_load>
800049e8:	00055c63          	bgez	a0,80004a00 <modbus_recv+0x3dc>
800049ec:	800035b7          	lui	a1,0x80003
800049f0:	02000613          	li	a2,32
800049f4:	f1058593          	addi	a1,a1,-240 # 80002f10 <_heap_end+0xffff0f10>
800049f8:	00010513          	mv	a0,sp
800049fc:	440090ef          	jal	ra,8000de3c <memcpy>
80004a00:	01414783          	lbu	a5,20(sp)
80004a04:	fd1ff06f          	j	800049d4 <modbus_recv+0x3b0>
80004a08:	00010513          	mv	a0,sp
80004a0c:	844ff0ef          	jal	ra,80003a50 <config_load>
80004a10:	00055c63          	bgez	a0,80004a28 <modbus_recv+0x404>
80004a14:	800035b7          	lui	a1,0x80003
80004a18:	02000613          	li	a2,32
80004a1c:	f1058593          	addi	a1,a1,-240 # 80002f10 <_heap_end+0xffff0f10>
80004a20:	00010513          	mv	a0,sp
80004a24:	418090ef          	jal	ra,8000de3c <memcpy>
80004a28:	00400613          	li	a2,4
80004a2c:	01b10593          	addi	a1,sp,27
80004a30:	e61ff06f          	j	80004890 <modbus_recv+0x26c>
80004a34:	00400613          	li	a2,4
80004a38:	002a0593          	addi	a1,s4,2
80004a3c:	00248513          	addi	a0,s1,2
80004a40:	3fc090ef          	jal	ra,8000de3c <memcpy>
80004a44:	00600593          	li	a1,6
80004a48:	00048513          	mv	a0,s1
80004a4c:	a49fe0ef          	jal	ra,80003494 <add_crc>
80004a50:	00800413          	li	s0,8
80004a54:	d21ff06f          	j	80004774 <modbus_recv+0x150>
80004a58:	ff7a8613          	addi	a2,s5,-9
80004a5c:	0ff67613          	andi	a2,a2,255
80004a60:	007a0593          	addi	a1,s4,7
80004a64:	000b8513          	mv	a0,s7
80004a68:	fe4ff0ef          	jal	ra,8000424c <modbus_store_reg>
80004a6c:	fc0554e3          	bgez	a0,80004a34 <modbus_recv+0x410>
80004a70:	ffe00793          	li	a5,-2
80004a74:	00048613          	mv	a2,s1
80004a78:	00700593          	li	a1,7
80004a7c:	00f50463          	beq	a0,a5,80004a84 <modbus_recv+0x460>
80004a80:	00300593          	li	a1,3
80004a84:	00090513          	mv	a0,s2
80004a88:	f54ff0ef          	jal	ra,800041dc <modbus_error>
80004a8c:	00050413          	mv	s0,a0
80004a90:	e7dff06f          	j	8000490c <modbus_recv+0x2e8>
80004a94:	00048613          	mv	a2,s1
80004a98:	00100593          	li	a1,1
80004a9c:	fe9ff06f          	j	80004a84 <modbus_recv+0x460>
80004aa0:	80002537          	lui	a0,0x80002
80004aa4:	6dc50513          	addi	a0,a0,1756 # 800026dc <_heap_end+0xffff06dc>
80004aa8:	7d4090ef          	jal	ra,8000e27c <iprintf>
80004aac:	00000413          	li	s0,0
80004ab0:	cc5ff06f          	j	80004774 <modbus_recv+0x150>
80004ab4:	80002537          	lui	a0,0x80002
80004ab8:	71c50513          	addi	a0,a0,1820 # 8000271c <_heap_end+0xffff071c>
80004abc:	fedff06f          	j	80004aa8 <modbus_recv+0x484>

80004ac0 <mac_init>:
80004ac0:	ff010113          	addi	sp,sp,-16
80004ac4:	00112623          	sw	ra,12(sp)
80004ac8:	00812423          	sw	s0,8(sp)
80004acc:	02051263          	bnez	a0,80004af0 <mac_init+0x30>
80004ad0:	80002537          	lui	a0,0x80002
80004ad4:	75450513          	addi	a0,a0,1876 # 80002754 <_heap_end+0xffff0754>
80004ad8:	7a4090ef          	jal	ra,8000e27c <iprintf>
80004adc:	ff000513          	li	a0,-16
80004ae0:	00c12083          	lw	ra,12(sp)
80004ae4:	00812403          	lw	s0,8(sp)
80004ae8:	01010113          	addi	sp,sp,16
80004aec:	00008067          	ret
80004af0:	800025b7          	lui	a1,0x80002
80004af4:	00050413          	mv	s0,a0
80004af8:	00500613          	li	a2,5
80004afc:	77458593          	addi	a1,a1,1908 # 80002774 <_heap_end+0xffff0774>
80004b00:	03650513          	addi	a0,a0,54
80004b04:	338090ef          	jal	ra,8000de3c <memcpy>
80004b08:	8000b7b7          	lui	a5,0x8000b
80004b0c:	1ec78793          	addi	a5,a5,492 # 8000b1ec <_heap_end+0xffff91ec>
80004b10:	00f42a23          	sw	a5,20(s0)
80004b14:	800057b7          	lui	a5,0x80005
80004b18:	b7478793          	addi	a5,a5,-1164 # 80004b74 <_heap_end+0xffff2b74>
80004b1c:	00f42c23          	sw	a5,24(s0)
80004b20:	00600613          	li	a2,6
80004b24:	98918593          	addi	a1,gp,-1655 # 80003129 <active_config+0xd>
80004b28:	02e40513          	addi	a0,s0,46
80004b2c:	310090ef          	jal	ra,8000de3c <memcpy>
80004b30:	5dc00793          	li	a5,1500
80004b34:	02f41623          	sh	a5,44(s0)
80004b38:	000017b7          	lui	a5,0x1
80004b3c:	e0678793          	addi	a5,a5,-506 # e06 <_stack_size+0x606>
80004b40:	02f41a23          	sh	a5,52(s0)
80004b44:	00002537          	lui	a0,0x2
80004b48:	01100793          	li	a5,17
80004b4c:	f0070437          	lui	s0,0xf0070
80004b50:	00f42023          	sw	a5,0(s0) # f0070000 <_heap_end+0x7005e000>
80004b54:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
80004b58:	641000ef          	jal	ra,80005998 <delay_us>
80004b5c:	80002537          	lui	a0,0x80002
80004b60:	00042023          	sw	zero,0(s0)
80004b64:	77c50513          	addi	a0,a0,1916 # 8000277c <_heap_end+0xffff077c>
80004b68:	714090ef          	jal	ra,8000e27c <iprintf>
80004b6c:	00000513          	li	a0,0
80004b70:	f71ff06f          	j	80004ae0 <mac_init+0x20>

80004b74 <mac_tx_packet>:
80004b74:	00050463          	beqz	a0,80004b7c <mac_tx_packet+0x8>
80004b78:	00059e63          	bnez	a1,80004b94 <mac_tx_packet+0x20>
80004b7c:	f0000737          	lui	a4,0xf0000
80004b80:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
80004b84:	ff000513          	li	a0,-16
80004b88:	0027e793          	ori	a5,a5,2
80004b8c:	00f72223          	sw	a5,4(a4)
80004b90:	00008067          	ret
80004b94:	ff010113          	addi	sp,sp,-16
80004b98:	00812423          	sw	s0,8(sp)
80004b9c:	00058413          	mv	s0,a1
80004ba0:	00040513          	mv	a0,s0
80004ba4:	ffe00593          	li	a1,-2
80004ba8:	00112623          	sw	ra,12(sp)
80004bac:	1d4020ef          	jal	ra,80006d80 <pbuf_header>
80004bb0:	00040713          	mv	a4,s0
80004bb4:	00000793          	li	a5,0
80004bb8:	00a75683          	lhu	a3,10(a4)
80004bbc:	00072703          	lw	a4,0(a4)
80004bc0:	00d787b3          	add	a5,a5,a3
80004bc4:	fe071ae3          	bnez	a4,80004bb8 <mac_tx_packet+0x44>
80004bc8:	00379793          	slli	a5,a5,0x3
80004bcc:	f00706b7          	lui	a3,0xf0070
80004bd0:	0006a703          	lw	a4,0(a3) # f0070000 <_heap_end+0x7005e000>
80004bd4:	00277713          	andi	a4,a4,2
80004bd8:	fe070ce3          	beqz	a4,80004bd0 <mac_tx_packet+0x5c>
80004bdc:	f0070737          	lui	a4,0xf0070
80004be0:	01472683          	lw	a3,20(a4) # f0070014 <_heap_end+0x7005e014>
80004be4:	fe068ee3          	beqz	a3,80004be0 <mac_tx_packet+0x6c>
80004be8:	00f72823          	sw	a5,16(a4)
80004bec:	00040693          	mv	a3,s0
80004bf0:	00000713          	li	a4,0
80004bf4:	00000793          	li	a5,0
80004bf8:	00300893          	li	a7,3
80004bfc:	f0070837          	lui	a6,0xf0070
80004c00:	0046a603          	lw	a2,4(a3)
80004c04:	00a6d583          	lhu	a1,10(a3)
80004c08:	00b605b3          	add	a1,a2,a1
80004c0c:	04c59863          	bne	a1,a2,80004c5c <mac_tx_packet+0xe8>
80004c10:	0006a683          	lw	a3,0(a3)
80004c14:	fe0696e3          	bnez	a3,80004c00 <mac_tx_packet+0x8c>
80004c18:	00078a63          	beqz	a5,80004c2c <mac_tx_packet+0xb8>
80004c1c:	f00707b7          	lui	a5,0xf0070
80004c20:	0147a683          	lw	a3,20(a5) # f0070014 <_heap_end+0x7005e014>
80004c24:	fe068ee3          	beqz	a3,80004c20 <mac_tx_packet+0xac>
80004c28:	00e7a823          	sw	a4,16(a5)
80004c2c:	00040513          	mv	a0,s0
80004c30:	00200593          	li	a1,2
80004c34:	14c020ef          	jal	ra,80006d80 <pbuf_header>
80004c38:	9f418793          	addi	a5,gp,-1548 # 80003194 <lwip_stats>
80004c3c:	0007a703          	lw	a4,0(a5)
80004c40:	00000513          	li	a0,0
80004c44:	00170713          	addi	a4,a4,1
80004c48:	00e7a023          	sw	a4,0(a5)
80004c4c:	00c12083          	lw	ra,12(sp)
80004c50:	00812403          	lw	s0,8(sp)
80004c54:	01010113          	addi	sp,sp,16
80004c58:	00008067          	ret
80004c5c:	00064503          	lbu	a0,0(a2)
80004c60:	00379313          	slli	t1,a5,0x3
80004c64:	00651533          	sll	a0,a0,t1
80004c68:	00a76733          	or	a4,a4,a0
80004c6c:	01179a63          	bne	a5,a7,80004c80 <mac_tx_packet+0x10c>
80004c70:	01482503          	lw	a0,20(a6) # f0070014 <_heap_end+0x7005e014>
80004c74:	fe050ee3          	beqz	a0,80004c70 <mac_tx_packet+0xfc>
80004c78:	00e82823          	sw	a4,16(a6)
80004c7c:	00000713          	li	a4,0
80004c80:	00178793          	addi	a5,a5,1
80004c84:	0037f793          	andi	a5,a5,3
80004c88:	00160613          	addi	a2,a2,1
80004c8c:	f81ff06f          	j	80004c0c <mac_tx_packet+0x98>

80004c90 <sys_now>:
80004c90:	ff010113          	addi	sp,sp,-16
80004c94:	00112623          	sw	ra,12(sp)
80004c98:	f00b07b7          	lui	a5,0xf00b0
80004c9c:	0007a503          	lw	a0,0(a5) # f00b0000 <_heap_end+0x7009e000>
80004ca0:	0047a583          	lw	a1,4(a5)
80004ca4:	3e800613          	li	a2,1000
80004ca8:	00000693          	li	a3,0
80004cac:	671070ef          	jal	ra,8000cb1c <__udivdi3>
80004cb0:	00c12083          	lw	ra,12(sp)
80004cb4:	01010113          	addi	sp,sp,16
80004cb8:	00008067          	ret

80004cbc <sys_arch_protect>:
80004cbc:	00008067          	ret

80004cc0 <sys_arch_unprotect>:
80004cc0:	00008067          	ret

80004cc4 <mac_lwip_init>:
80004cc4:	ff010113          	addi	sp,sp,-16
80004cc8:	00112623          	sw	ra,12(sp)
80004ccc:	00812423          	sw	s0,8(sp)
80004cd0:	00912223          	sw	s1,4(sp)
80004cd4:	689000ef          	jal	ra,80005b5c <lwip_init>
80004cd8:	fb9ff0ef          	jal	ra,80004c90 <sys_now>
80004cdc:	8aa1a223          	sw	a0,-1884(gp) # 80003044 <ts_ipreass>
80004ce0:	8aa1a623          	sw	a0,-1876(gp) # 8000304c <ts_etharp>
80004ce4:	8000c837          	lui	a6,0x8000c
80004ce8:	800057b7          	lui	a5,0x80005
80004cec:	7d080813          	addi	a6,a6,2000 # 8000c7d0 <_heap_end+0xffffa7d0>
80004cf0:	ac078793          	addi	a5,a5,-1344 # 80004ac0 <_heap_end+0xffff2ac0>
80004cf4:	00000713          	li	a4,0
80004cf8:	98018693          	addi	a3,gp,-1664 # 80003120 <active_config+0x4>
80004cfc:	98418613          	addi	a2,gp,-1660 # 80003124 <active_config+0x8>
80004d00:	97c18593          	addi	a1,gp,-1668 # 8000311c <active_config>
80004d04:	99c18513          	addi	a0,gp,-1636 # 8000313c <default_netif>
80004d08:	219010ef          	jal	ra,80006720 <netif_add>
80004d0c:	02051663          	bnez	a0,80004d38 <mac_lwip_init+0x74>
80004d10:	80002537          	lui	a0,0x80002
80004d14:	79050513          	addi	a0,a0,1936 # 80002790 <_heap_end+0xffff0790>
80004d18:	564090ef          	jal	ra,8000e27c <iprintf>
80004d1c:	fff00493          	li	s1,-1
80004d20:	00c12083          	lw	ra,12(sp)
80004d24:	00812403          	lw	s0,8(sp)
80004d28:	00048513          	mv	a0,s1
80004d2c:	00412483          	lw	s1,4(sp)
80004d30:	01010113          	addi	sp,sp,16
80004d34:	00008067          	ret
80004d38:	99c18513          	addi	a0,gp,-1636 # 8000313c <default_netif>
80004d3c:	31d010ef          	jal	ra,80006858 <netif_set_default>
80004d40:	99c18513          	addi	a0,gp,-1636 # 8000313c <default_netif>
80004d44:	97c18493          	addi	s1,gp,-1668 # 8000311c <active_config>
80004d48:	319010ef          	jal	ra,80006860 <netif_set_up>
80004d4c:	00c4c783          	lbu	a5,12(s1)
80004d50:	00000493          	li	s1,0
80004d54:	0017f793          	andi	a5,a5,1
80004d58:	fc0784e3          	beqz	a5,80004d20 <mac_lwip_init+0x5c>
80004d5c:	99c18513          	addi	a0,gp,-1636 # 8000313c <default_netif>
80004d60:	524050ef          	jal	ra,8000a284 <dhcp_start>
80004d64:	fbdff06f          	j	80004d20 <mac_lwip_init+0x5c>

80004d68 <mac_rx_isr>:
80004d68:	fc010113          	addi	sp,sp,-64
80004d6c:	02912a23          	sw	s1,52(sp)
80004d70:	03512223          	sw	s5,36(sp)
80004d74:	01712e23          	sw	s7,28(sp)
80004d78:	00001bb7          	lui	s7,0x1
80004d7c:	03312623          	sw	s3,44(sp)
80004d80:	01812c23          	sw	s8,24(sp)
80004d84:	01912a23          	sw	s9,20(sp)
80004d88:	02112e23          	sw	ra,60(sp)
80004d8c:	02812c23          	sw	s0,56(sp)
80004d90:	03212823          	sw	s2,48(sp)
80004d94:	03412423          	sw	s4,40(sp)
80004d98:	03612023          	sw	s6,32(sp)
80004d9c:	01a12823          	sw	s10,16(sp)
80004da0:	00000993          	li	s3,0
80004da4:	800b8b93          	addi	s7,s7,-2048 # 800 <_stack_size>
80004da8:	9f418493          	addi	s1,gp,-1548 # 80003194 <lwip_stats>
80004dac:	99c18a93          	addi	s5,gp,-1636 # 8000313c <default_netif>
80004db0:	80003c37          	lui	s8,0x80003
80004db4:	80003cb7          	lui	s9,0x80003
80004db8:	f0070937          	lui	s2,0xf0070
80004dbc:	00092783          	lw	a5,0(s2) # f0070000 <_heap_end+0x7005e000>
80004dc0:	0207f793          	andi	a5,a5,32
80004dc4:	04078663          	beqz	a5,80004e10 <mac_rx_isr+0xa8>
80004dc8:	02092683          	lw	a3,32(s2)
80004dcc:	00768413          	addi	s0,a3,7
80004dd0:	00345413          	srli	s0,s0,0x3
80004dd4:	068bfa63          	bgeu	s7,s0,80004e48 <mac_rx_isr+0xe0>
80004dd8:	80002537          	lui	a0,0x80002
80004ddc:	00068613          	mv	a2,a3
80004de0:	00040593          	mv	a1,s0
80004de4:	7b450513          	addi	a0,a0,1972 # 800027b4 <_heap_end+0xffff07b4>
80004de8:	494090ef          	jal	ra,8000e27c <iprintf>
80004dec:	80c1a783          	lw	a5,-2036(gp) # 80002fac <_impure_ptr>
80004df0:	0087a503          	lw	a0,8(a5)
80004df4:	381080ef          	jal	ra,8000d974 <fflush>
80004df8:	01100793          	li	a5,17
80004dfc:	00002537          	lui	a0,0x2
80004e00:	00f92023          	sw	a5,0(s2)
80004e04:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
80004e08:	391000ef          	jal	ra,80005998 <delay_us>
80004e0c:	00092023          	sw	zero,0(s2)
80004e10:	03c12083          	lw	ra,60(sp)
80004e14:	03812403          	lw	s0,56(sp)
80004e18:	03412483          	lw	s1,52(sp)
80004e1c:	03012903          	lw	s2,48(sp)
80004e20:	02c12983          	lw	s3,44(sp)
80004e24:	02812a03          	lw	s4,40(sp)
80004e28:	02412a83          	lw	s5,36(sp)
80004e2c:	02012b03          	lw	s6,32(sp)
80004e30:	01c12b83          	lw	s7,28(sp)
80004e34:	01812c03          	lw	s8,24(sp)
80004e38:	01412c83          	lw	s9,20(sp)
80004e3c:	01012d03          	lw	s10,16(sp)
80004e40:	04010113          	addi	sp,sp,64
80004e44:	00008067          	ret
80004e48:	00240d13          	addi	s10,s0,2
80004e4c:	010d1d13          	slli	s10,s10,0x10
80004e50:	010d5d13          	srli	s10,s10,0x10
80004e54:	18200613          	li	a2,386
80004e58:	000d0593          	mv	a1,s10
80004e5c:	00000513          	li	a0,0
80004e60:	00d12623          	sw	a3,12(sp)
80004e64:	018020ef          	jal	ra,80006e7c <pbuf_alloc>
80004e68:	00050913          	mv	s2,a0
80004e6c:	00c12683          	lw	a3,12(sp)
80004e70:	0a051663          	bnez	a0,80004f1c <mac_rx_isr+0x1b4>
80004e74:	f0000737          	lui	a4,0xf0000
80004e78:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
80004e7c:	80002537          	lui	a0,0x80002
80004e80:	00040613          	mv	a2,s0
80004e84:	0027e793          	ori	a5,a5,2
80004e88:	00f72223          	sw	a5,4(a4)
80004e8c:	01f68713          	addi	a4,a3,31
80004e90:	00575713          	srli	a4,a4,0x5
80004e94:	000d0593          	mv	a1,s10
80004e98:	7f450513          	addi	a0,a0,2036 # 800027f4 <_heap_end+0xffff07f4>
80004e9c:	3e0090ef          	jal	ra,8000e27c <iprintf>
80004ea0:	9f418793          	addi	a5,gp,-1548 # 80003194 <lwip_stats>
80004ea4:	0187a703          	lw	a4,24(a5)
80004ea8:	00170713          	addi	a4,a4,1
80004eac:	00e7ac23          	sw	a4,24(a5)
80004eb0:	00c7a703          	lw	a4,12(a5)
80004eb4:	00170713          	addi	a4,a4,1
80004eb8:	00e7a623          	sw	a4,12(a5)
80004ebc:	f0070737          	lui	a4,0xf0070
80004ec0:	04804263          	bgtz	s0,80004f04 <mac_rx_isr+0x19c>
80004ec4:	03812403          	lw	s0,56(sp)
80004ec8:	03c12083          	lw	ra,60(sp)
80004ecc:	03412483          	lw	s1,52(sp)
80004ed0:	03012903          	lw	s2,48(sp)
80004ed4:	02c12983          	lw	s3,44(sp)
80004ed8:	02812a03          	lw	s4,40(sp)
80004edc:	02412a83          	lw	s5,36(sp)
80004ee0:	02012b03          	lw	s6,32(sp)
80004ee4:	01c12b83          	lw	s7,28(sp)
80004ee8:	01812c03          	lw	s8,24(sp)
80004eec:	01412c83          	lw	s9,20(sp)
80004ef0:	01012d03          	lw	s10,16(sp)
80004ef4:	80003537          	lui	a0,0x80003
80004ef8:	84450513          	addi	a0,a0,-1980 # 80002844 <_heap_end+0xffff0844>
80004efc:	04010113          	addi	sp,sp,64
80004f00:	37c0906f          	j	8000e27c <iprintf>
80004f04:	00072783          	lw	a5,0(a4) # f0070000 <_heap_end+0x7005e000>
80004f08:	0207f793          	andi	a5,a5,32
80004f0c:	fe078ce3          	beqz	a5,80004f04 <mac_rx_isr+0x19c>
80004f10:	02072783          	lw	a5,32(a4)
80004f14:	ffc40413          	addi	s0,s0,-4
80004f18:	fa9ff06f          	j	80004ec0 <mac_rx_isr+0x158>
80004f1c:	ffe00593          	li	a1,-2
80004f20:	661010ef          	jal	ra,80006d80 <pbuf_header>
80004f24:	00000713          	li	a4,0
80004f28:	00000793          	li	a5,0
80004f2c:	f0070637          	lui	a2,0xf0070
80004f30:	04041a63          	bnez	s0,80004f84 <mac_rx_isr+0x21c>
80004f34:	00200593          	li	a1,2
80004f38:	00090513          	mv	a0,s2
80004f3c:	00492a03          	lw	s4,4(s2)
80004f40:	641010ef          	jal	ra,80006d80 <pbuf_header>
80004f44:	0044a783          	lw	a5,4(s1)
80004f48:	000a8593          	mv	a1,s5
80004f4c:	00090513          	mv	a0,s2
80004f50:	00178793          	addi	a5,a5,1
80004f54:	00f4a223          	sw	a5,4(s1)
80004f58:	010aa783          	lw	a5,16(s5)
80004f5c:	000780e7          	jalr	a5
80004f60:	00050593          	mv	a1,a0
80004f64:	08050463          	beqz	a0,80004fec <mac_rx_isr+0x284>
80004f68:	f0000737          	lui	a4,0xf0000
80004f6c:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
80004f70:	890c0513          	addi	a0,s8,-1904 # 80002890 <_heap_end+0xffff0890>
80004f74:	0027e793          	ori	a5,a5,2
80004f78:	00f72223          	sw	a5,4(a4)
80004f7c:	300090ef          	jal	ra,8000e27c <iprintf>
80004f80:	06c0006f          	j	80004fec <mac_rx_isr+0x284>
80004f84:	08099063          	bnez	s3,80005004 <mac_rx_isr+0x29c>
80004f88:	06078863          	beqz	a5,80004ff8 <mac_rx_isr+0x290>
80004f8c:	0007a783          	lw	a5,0(a5)
80004f90:	06079663          	bnez	a5,80004ffc <mac_rx_isr+0x294>
80004f94:	f0000737          	lui	a4,0xf0000
80004f98:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
80004f9c:	864c8513          	addi	a0,s9,-1948 # 80002864 <_heap_end+0xffff0864>
80004fa0:	0027e793          	ori	a5,a5,2
80004fa4:	00f72223          	sw	a5,4(a4)
80004fa8:	2d4090ef          	jal	ra,8000e27c <iprintf>
80004fac:	0184a783          	lw	a5,24(s1)
80004fb0:	f0070737          	lui	a4,0xf0070
80004fb4:	00178793          	addi	a5,a5,1
80004fb8:	00f4ac23          	sw	a5,24(s1)
80004fbc:	00c4a783          	lw	a5,12(s1)
80004fc0:	00178793          	addi	a5,a5,1
80004fc4:	00f4a623          	sw	a5,12(s1)
80004fc8:	00072783          	lw	a5,0(a4) # f0070000 <_heap_end+0x7005e000>
80004fcc:	0207f793          	andi	a5,a5,32
80004fd0:	fe078ce3          	beqz	a5,80004fc8 <mac_rx_isr+0x260>
80004fd4:	02072783          	lw	a5,32(a4)
80004fd8:	ffc40413          	addi	s0,s0,-4
80004fdc:	fe8046e3          	bgtz	s0,80004fc8 <mac_rx_isr+0x260>
80004fe0:	00200593          	li	a1,2
80004fe4:	00090513          	mv	a0,s2
80004fe8:	599010ef          	jal	ra,80006d80 <pbuf_header>
80004fec:	00090513          	mv	a0,s2
80004ff0:	5b9010ef          	jal	ra,80006da8 <pbuf_free>
80004ff4:	dc5ff06f          	j	80004db8 <mac_rx_isr+0x50>
80004ff8:	00090793          	mv	a5,s2
80004ffc:	00a7d983          	lhu	s3,10(a5)
80005000:	0047aa03          	lw	s4,4(a5)
80005004:	00071a63          	bnez	a4,80005018 <mac_rx_isr+0x2b0>
80005008:	00062683          	lw	a3,0(a2) # f0070000 <_heap_end+0x7005e000>
8000500c:	0206f693          	andi	a3,a3,32
80005010:	fe068ce3          	beqz	a3,80005008 <mac_rx_isr+0x2a0>
80005014:	02062b03          	lw	s6,32(a2)
80005018:	00170713          	addi	a4,a4,1
8000501c:	016a0023          	sb	s6,0(s4)
80005020:	00377713          	andi	a4,a4,3
80005024:	008b5b13          	srli	s6,s6,0x8
80005028:	fff40413          	addi	s0,s0,-1
8000502c:	001a0a13          	addi	s4,s4,1
80005030:	fff98993          	addi	s3,s3,-1
80005034:	efdff06f          	j	80004f30 <mac_rx_isr+0x1c8>

80005038 <mac_poll>:
80005038:	ff010113          	addi	sp,sp,-16
8000503c:	00812423          	sw	s0,8(sp)
80005040:	00112623          	sw	ra,12(sp)
80005044:	00912223          	sw	s1,4(sp)
80005048:	c49ff0ef          	jal	ra,80004c90 <sys_now>
8000504c:	8ac1a683          	lw	a3,-1876(gp) # 8000304c <ts_etharp>
80005050:	00050413          	mv	s0,a0
80005054:	00a6f663          	bgeu	a3,a0,80005060 <mac_poll+0x28>
80005058:	8a41a683          	lw	a3,-1884(gp) # 80003044 <ts_ipreass>
8000505c:	02a6e063          	bltu	a3,a0,8000507c <mac_poll+0x44>
80005060:	8a81a223          	sw	s0,-1884(gp) # 80003044 <ts_ipreass>
80005064:	8a81a623          	sw	s0,-1876(gp) # 8000304c <ts_etharp>
80005068:	00c12083          	lw	ra,12(sp)
8000506c:	00812403          	lw	s0,8(sp)
80005070:	00412483          	lw	s1,4(sp)
80005074:	01010113          	addi	sp,sp,16
80005078:	00008067          	ret
8000507c:	8a01a783          	lw	a5,-1888(gp) # 80003040 <ts_dhcp_fine>
80005080:	1f300713          	li	a4,499
80005084:	40f507b3          	sub	a5,a0,a5
80005088:	00f77663          	bgeu	a4,a5,80005094 <mac_poll+0x5c>
8000508c:	5a0050ef          	jal	ra,8000a62c <dhcp_fine_tmr>
80005090:	8a81a023          	sw	s0,-1888(gp) # 80003040 <ts_dhcp_fine>
80005094:	89c1a703          	lw	a4,-1892(gp) # 8000303c <ts_dhcp_coarse>
80005098:	0000f7b7          	lui	a5,0xf
8000509c:	a5f78793          	addi	a5,a5,-1441 # ea5f <_stack_size+0xe25f>
800050a0:	40e40733          	sub	a4,s0,a4
800050a4:	00e7f663          	bgeu	a5,a4,800050b0 <mac_poll+0x78>
800050a8:	2c0050ef          	jal	ra,8000a368 <dhcp_coarse_tmr>
800050ac:	8881ae23          	sw	s0,-1892(gp) # 8000303c <ts_dhcp_coarse>
800050b0:	f00607b7          	lui	a5,0xf0060
800050b4:	0087a783          	lw	a5,8(a5) # f0060008 <_heap_end+0x7004e008>
800050b8:	0047f793          	andi	a5,a5,4
800050bc:	fa0786e3          	beqz	a5,80005068 <mac_poll+0x30>
800050c0:	80003537          	lui	a0,0x80003
800050c4:	8c050513          	addi	a0,a0,-1856 # 800028c0 <_heap_end+0xffff08c0>
800050c8:	1b4090ef          	jal	ra,8000e27c <iprintf>
800050cc:	00812403          	lw	s0,8(sp)
800050d0:	00c12083          	lw	ra,12(sp)
800050d4:	00412483          	lw	s1,4(sp)
800050d8:	01010113          	addi	sp,sp,16
800050dc:	c8dff06f          	j	80004d68 <mac_rx_isr>

800050e0 <mac_print_stats>:
800050e0:	ff010113          	addi	sp,sp,-16
800050e4:	9a018513          	addi	a0,gp,-1632 # 80003140 <default_netif+0x4>
800050e8:	00112623          	sw	ra,12(sp)
800050ec:	6d8070ef          	jal	ra,8000c7c4 <ip4addr_ntoa>
800050f0:	9f418613          	addi	a2,gp,-1548 # 80003194 <lwip_stats>
800050f4:	01062883          	lw	a7,16(a2)
800050f8:	01462803          	lw	a6,20(a2)
800050fc:	00c62783          	lw	a5,12(a2)
80005100:	02862703          	lw	a4,40(a2)
80005104:	00062683          	lw	a3,0(a2)
80005108:	00c12083          	lw	ra,12(sp)
8000510c:	00462603          	lw	a2,4(a2)
80005110:	00050593          	mv	a1,a0
80005114:	80003537          	lui	a0,0x80003
80005118:	8e050513          	addi	a0,a0,-1824 # 800028e0 <_heap_end+0xffff08e0>
8000511c:	01010113          	addi	sp,sp,16
80005120:	15c0906f          	j	8000e27c <iprintf>

80005124 <hub_init>:
80005124:	fe010113          	addi	sp,sp,-32
80005128:	00912a23          	sw	s1,20(sp)
8000512c:	800034b7          	lui	s1,0x80003
80005130:	f304c783          	lbu	a5,-208(s1) # 80002f30 <_heap_end+0xffff0f30>
80005134:	00112e23          	sw	ra,28(sp)
80005138:	00812c23          	sw	s0,24(sp)
8000513c:	01212823          	sw	s2,16(sp)
80005140:	01312623          	sw	s3,12(sp)
80005144:	01412423          	sw	s4,8(sp)
80005148:	01512223          	sw	s5,4(sp)
8000514c:	01612023          	sw	s6,0(sp)
80005150:	f3048493          	addi	s1,s1,-208
80005154:	04f50063          	beq	a0,a5,80005194 <hub_init+0x70>
80005158:	0054c703          	lbu	a4,5(s1)
8000515c:	fff00793          	li	a5,-1
80005160:	00100a13          	li	s4,1
80005164:	02e50a63          	beq	a0,a4,80005198 <hub_init+0x74>
80005168:	01c12083          	lw	ra,28(sp)
8000516c:	01812403          	lw	s0,24(sp)
80005170:	01412483          	lw	s1,20(sp)
80005174:	01012903          	lw	s2,16(sp)
80005178:	00c12983          	lw	s3,12(sp)
8000517c:	00812a03          	lw	s4,8(sp)
80005180:	00412a83          	lw	s5,4(sp)
80005184:	00012b03          	lw	s6,0(sp)
80005188:	00078513          	mv	a0,a5
8000518c:	02010113          	addi	sp,sp,32
80005190:	00008067          	ret
80005194:	00000a13          	li	s4,0
80005198:	002a1993          	slli	s3,s4,0x2
8000519c:	014987b3          	add	a5,s3,s4
800051a0:	00f487b3          	add	a5,s1,a5
800051a4:	0017c403          	lbu	s0,1(a5)
800051a8:	0027c903          	lbu	s2,2(a5)
800051ac:	0037ca83          	lbu	s5,3(a5)
800051b0:	00040513          	mv	a0,s0
800051b4:	00090593          	mv	a1,s2
800051b8:	0047cb03          	lbu	s6,4(a5)
800051bc:	735070ef          	jal	ra,8000d0f0 <__mulsi3>
800051c0:	000a8593          	mv	a1,s5
800051c4:	72d070ef          	jal	ra,8000d0f0 <__mulsi3>
800051c8:	000b0593          	mv	a1,s6
800051cc:	725070ef          	jal	ra,8000d0f0 <__mulsi3>
800051d0:	40355513          	srai	a0,a0,0x3
800051d4:	8aa1ac23          	sw	a0,-1864(gp) # 80003058 <hub_frame_size>
800051d8:	8a81aa23          	sw	s0,-1868(gp) # 80003054 <hub_frame_width>
800051dc:	000a8593          	mv	a1,s5
800051e0:	00090513          	mv	a0,s2
800051e4:	70d070ef          	jal	ra,8000d0f0 <__mulsi3>
800051e8:	8aa1a823          	sw	a0,-1872(gp) # 80003050 <hub_frame_height>
800051ec:	f00547b7          	lui	a5,0xf0054
800051f0:	0007a023          	sw	zero,0(a5) # f0054000 <_heap_end+0x70042000>
800051f4:	000b0593          	mv	a1,s6
800051f8:	00040513          	mv	a0,s0
800051fc:	6f5070ef          	jal	ra,8000d0f0 <__mulsi3>
80005200:	000a8593          	mv	a1,s5
80005204:	6ed070ef          	jal	ra,8000d0f0 <__mulsi3>
80005208:	00000693          	li	a3,0
8000520c:	00000713          	li	a4,0
80005210:	f0050637          	lui	a2,0xf0050
80005214:	000015b7          	lui	a1,0x1
80005218:	03274e63          	blt	a4,s2,80005254 <hub_init+0x130>
8000521c:	014989b3          	add	s3,s3,s4
80005220:	013484b3          	add	s1,s1,s3
80005224:	0004c783          	lbu	a5,0(s1)
80005228:	01041413          	slli	s0,s0,0x10
8000522c:	01891913          	slli	s2,s2,0x18
80005230:	01246433          	or	s0,s0,s2
80005234:	00f46433          	or	s0,s0,a5
80005238:	000107b7          	lui	a5,0x10
8000523c:	f8078793          	addi	a5,a5,-128 # ff80 <_stack_size+0xf780>
80005240:	00f46433          	or	s0,s0,a5
80005244:	f00547b7          	lui	a5,0xf0054
80005248:	0087a023          	sw	s0,0(a5) # f0054000 <_heap_end+0x70042000>
8000524c:	00000793          	li	a5,0
80005250:	f19ff06f          	j	80005168 <hub_init+0x44>
80005254:	00b707b3          	add	a5,a4,a1
80005258:	00279793          	slli	a5,a5,0x2
8000525c:	4036d813          	srai	a6,a3,0x3
80005260:	00f607b3          	add	a5,a2,a5
80005264:	0107a223          	sw	a6,4(a5)
80005268:	00170713          	addi	a4,a4,1
8000526c:	00a686b3          	add	a3,a3,a0
80005270:	fa9ff06f          	j	80005218 <hub_init+0xf4>

80005274 <hub_print_char>:
80005274:	f9010113          	addi	sp,sp,-112
80005278:	05812423          	sw	s8,72(sp)
8000527c:	00078c13          	mv	s8,a5
80005280:	07812783          	lw	a5,120(sp)
80005284:	06912223          	sw	s1,100(sp)
80005288:	05312e23          	sw	s3,92(sp)
8000528c:	41f7d493          	srai	s1,a5,0x1f
80005290:	0074f493          	andi	s1,s1,7
80005294:	00f484b3          	add	s1,s1,a5
80005298:	05412c23          	sw	s4,88(sp)
8000529c:	02a12023          	sw	a0,32(sp)
800052a0:	06112623          	sw	ra,108(sp)
800052a4:	06812423          	sw	s0,104(sp)
800052a8:	07212023          	sw	s2,96(sp)
800052ac:	05512a23          	sw	s5,84(sp)
800052b0:	05612823          	sw	s6,80(sp)
800052b4:	05712623          	sw	s7,76(sp)
800052b8:	05912223          	sw	s9,68(sp)
800052bc:	05a12023          	sw	s10,64(sp)
800052c0:	03b12e23          	sw	s11,60(sp)
800052c4:	02c12223          	sw	a2,36(sp)
800052c8:	02e12423          	sw	a4,40(sp)
800052cc:	03012623          	sw	a6,44(sp)
800052d0:	0077f793          	andi	a5,a5,7
800052d4:	00058513          	mv	a0,a1
800052d8:	00068993          	mv	s3,a3
800052dc:	00088a13          	mv	s4,a7
800052e0:	4034d493          	srai	s1,s1,0x3
800052e4:	00078463          	beqz	a5,800052ec <hub_print_char+0x78>
800052e8:	00148493          	addi	s1,s1,1
800052ec:	07412583          	lw	a1,116(sp)
800052f0:	00000b93          	li	s7,0
800052f4:	5fd070ef          	jal	ra,8000d0f0 <__mulsi3>
800052f8:	00048593          	mv	a1,s1
800052fc:	5f5070ef          	jal	ra,8000d0f0 <__mulsi3>
80005300:	07012a83          	lw	s5,112(sp)
80005304:	003c1793          	slli	a5,s8,0x3
80005308:	00098593          	mv	a1,s3
8000530c:	00aa8ab3          	add	s5,s5,a0
80005310:	000c0513          	mv	a0,s8
80005314:	00f12e23          	sw	a5,28(sp)
80005318:	5d9070ef          	jal	ra,8000d0f0 <__mulsi3>
8000531c:	00a12823          	sw	a0,16(sp)
80005320:	049bc063          	blt	s7,s1,80005360 <hub_print_char+0xec>
80005324:	06c12083          	lw	ra,108(sp)
80005328:	06812403          	lw	s0,104(sp)
8000532c:	06412483          	lw	s1,100(sp)
80005330:	06012903          	lw	s2,96(sp)
80005334:	05c12983          	lw	s3,92(sp)
80005338:	05812a03          	lw	s4,88(sp)
8000533c:	05412a83          	lw	s5,84(sp)
80005340:	05012b03          	lw	s6,80(sp)
80005344:	04c12b83          	lw	s7,76(sp)
80005348:	04812c03          	lw	s8,72(sp)
8000534c:	04412c83          	lw	s9,68(sp)
80005350:	04012d03          	lw	s10,64(sp)
80005354:	03c12d83          	lw	s11,60(sp)
80005358:	07010113          	addi	sp,sp,112
8000535c:	00008067          	ret
80005360:	07812703          	lw	a4,120(sp)
80005364:	003b9793          	slli	a5,s7,0x3
80005368:	40f707b3          	sub	a5,a4,a5
8000536c:	00f12623          	sw	a5,12(sp)
80005370:	00c12703          	lw	a4,12(sp)
80005374:	00800793          	li	a5,8
80005378:	00e7d463          	bge	a5,a4,80005380 <hub_print_char+0x10c>
8000537c:	00f12623          	sw	a5,12(sp)
80005380:	02412b03          	lw	s6,36(sp)
80005384:	00000c93          	li	s9,0
80005388:	07412783          	lw	a5,116(sp)
8000538c:	02fcc263          	blt	s9,a5,800053b0 <hub_print_char+0x13c>
80005390:	00fa8ab3          	add	s5,s5,a5
80005394:	01c12703          	lw	a4,28(sp)
80005398:	01012783          	lw	a5,16(sp)
8000539c:	001b8b93          	addi	s7,s7,1
800053a0:	00898993          	addi	s3,s3,8
800053a4:	00e787b3          	add	a5,a5,a4
800053a8:	00f12823          	sw	a5,16(sp)
800053ac:	f75ff06f          	j	80005320 <hub_print_char+0xac>
800053b0:	020b4863          	bltz	s6,800053e0 <hub_print_char+0x16c>
800053b4:	038b5663          	bge	s6,s8,800053e0 <hub_print_char+0x16c>
800053b8:	019a87b3          	add	a5,s5,s9
800053bc:	0007c783          	lbu	a5,0(a5)
800053c0:	00000d13          	li	s10,0
800053c4:	00f12c23          	sw	a5,24(sp)
800053c8:	01012783          	lw	a5,16(sp)
800053cc:	00fb0db3          	add	s11,s6,a5
800053d0:	00100793          	li	a5,1
800053d4:	00f12423          	sw	a5,8(sp)
800053d8:	00c12783          	lw	a5,12(sp)
800053dc:	00fd4863          	blt	s10,a5,800053ec <hub_print_char+0x178>
800053e0:	001b0b13          	addi	s6,s6,1
800053e4:	001c8c93          	addi	s9,s9,1
800053e8:	fa1ff06f          	j	80005388 <hub_print_char+0x114>
800053ec:	013d07b3          	add	a5,s10,s3
800053f0:	0407ca63          	bltz	a5,80005444 <hub_print_char+0x1d0>
800053f4:	02c12703          	lw	a4,44(sp)
800053f8:	04e7d663          	bge	a5,a4,80005444 <hub_print_char+0x1d0>
800053fc:	00c00793          	li	a5,12
80005400:	06fa0063          	beq	s4,a5,80005460 <hub_print_char+0x1ec>
80005404:	04b00793          	li	a5,75
80005408:	08fa0a63          	beq	s4,a5,8000549c <hub_print_char+0x228>
8000540c:	01412783          	lw	a5,20(sp)
80005410:	00279913          	slli	s2,a5,0x2
80005414:	02012783          	lw	a5,32(sp)
80005418:	01278933          	add	s2,a5,s2
8000541c:	00092503          	lw	a0,0(s2)
80005420:	6c8070ef          	jal	ra,8000cae8 <__bswapsi2>
80005424:	01812783          	lw	a5,24(sp)
80005428:	00812703          	lw	a4,8(sp)
8000542c:	00e7f7b3          	and	a5,a5,a4
80005430:	10078263          	beqz	a5,80005534 <hub_print_char+0x2c0>
80005434:	00c00793          	li	a5,12
80005438:	0afa0663          	beq	s4,a5,800054e4 <hub_print_char+0x270>
8000543c:	04b00793          	li	a5,75
80005440:	0afa0a63          	beq	s4,a5,800054f4 <hub_print_char+0x280>
80005444:	00812783          	lw	a5,8(sp)
80005448:	001d0d13          	addi	s10,s10,1
8000544c:	018d8db3          	add	s11,s11,s8
80005450:	00179793          	slli	a5,a5,0x1
80005454:	0ff7f793          	andi	a5,a5,255
80005458:	00f12423          	sw	a5,8(sp)
8000545c:	f7dff06f          	j	800053d8 <hub_print_char+0x164>
80005460:	41fdd793          	srai	a5,s11,0x1f
80005464:	01f7f793          	andi	a5,a5,31
80005468:	01b787b3          	add	a5,a5,s11
8000546c:	4057d793          	srai	a5,a5,0x5
80005470:	00f12a23          	sw	a5,20(sp)
80005474:	800007b7          	lui	a5,0x80000
80005478:	01f78793          	addi	a5,a5,31 # 8000001f <_heap_end+0xfffee01f>
8000547c:	00fdf433          	and	s0,s11,a5
80005480:	00045863          	bgez	s0,80005490 <hub_print_char+0x21c>
80005484:	fff40413          	addi	s0,s0,-1
80005488:	fe046413          	ori	s0,s0,-32
8000548c:	00140413          	addi	s0,s0,1
80005490:	800007b7          	lui	a5,0x80000
80005494:	0087d433          	srl	s0,a5,s0
80005498:	f75ff06f          	j	8000540c <hub_print_char+0x198>
8000549c:	41fdd793          	srai	a5,s11,0x1f
800054a0:	0037f793          	andi	a5,a5,3
800054a4:	01b787b3          	add	a5,a5,s11
800054a8:	4027d793          	srai	a5,a5,0x2
800054ac:	00f12a23          	sw	a5,20(sp)
800054b0:	800007b7          	lui	a5,0x80000
800054b4:	00378793          	addi	a5,a5,3 # 80000003 <_heap_end+0xfffee003>
800054b8:	00fdf433          	and	s0,s11,a5
800054bc:	00045863          	bgez	s0,800054cc <hub_print_char+0x258>
800054c0:	fff40413          	addi	s0,s0,-1
800054c4:	ffc46413          	ori	s0,s0,-4
800054c8:	00140413          	addi	s0,s0,1
800054cc:	00300793          	li	a5,3
800054d0:	40878433          	sub	s0,a5,s0
800054d4:	00341413          	slli	s0,s0,0x3
800054d8:	0ff00793          	li	a5,255
800054dc:	00879433          	sll	s0,a5,s0
800054e0:	f2dff06f          	j	8000540c <hub_print_char+0x198>
800054e4:	00a46533          	or	a0,s0,a0
800054e8:	600070ef          	jal	ra,8000cae8 <__bswapsi2>
800054ec:	00a92023          	sw	a0,0(s2)
800054f0:	f55ff06f          	j	80005444 <hub_print_char+0x1d0>
800054f4:	fff44793          	not	a5,s0
800054f8:	00a7f533          	and	a0,a5,a0
800054fc:	800007b7          	lui	a5,0x80000
80005500:	00378793          	addi	a5,a5,3 # 80000003 <_heap_end+0xfffee003>
80005504:	00fdf7b3          	and	a5,s11,a5
80005508:	0007d863          	bgez	a5,80005518 <hub_print_char+0x2a4>
8000550c:	fff78793          	addi	a5,a5,-1
80005510:	ffc7e793          	ori	a5,a5,-4
80005514:	00178793          	addi	a5,a5,1
80005518:	00300713          	li	a4,3
8000551c:	40f707b3          	sub	a5,a4,a5
80005520:	02812703          	lw	a4,40(sp)
80005524:	00379793          	slli	a5,a5,0x3
80005528:	00f717b3          	sll	a5,a4,a5
8000552c:	00a7e533          	or	a0,a5,a0
80005530:	fb9ff06f          	j	800054e8 <hub_print_char+0x274>
80005534:	00c00793          	li	a5,12
80005538:	00fa0663          	beq	s4,a5,80005544 <hub_print_char+0x2d0>
8000553c:	04b00793          	li	a5,75
80005540:	f0fa12e3          	bne	s4,a5,80005444 <hub_print_char+0x1d0>
80005544:	fff44793          	not	a5,s0
80005548:	00a7f533          	and	a0,a5,a0
8000554c:	f9dff06f          	j	800054e8 <hub_print_char+0x274>

80005550 <hub_print>:
80005550:	fb010113          	addi	sp,sp,-80
80005554:	04812423          	sw	s0,72(sp)
80005558:	04912223          	sw	s1,68(sp)
8000555c:	05212023          	sw	s2,64(sp)
80005560:	03312e23          	sw	s3,60(sp)
80005564:	03412c23          	sw	s4,56(sp)
80005568:	03512a23          	sw	s5,52(sp)
8000556c:	03612823          	sw	s6,48(sp)
80005570:	03712623          	sw	s7,44(sp)
80005574:	03812423          	sw	s8,40(sp)
80005578:	03912223          	sw	s9,36(sp)
8000557c:	03a12023          	sw	s10,32(sp)
80005580:	01b12e23          	sw	s11,28(sp)
80005584:	04112623          	sw	ra,76(sp)
80005588:	00058a13          	mv	s4,a1
8000558c:	00068a93          	mv	s5,a3
80005590:	00070993          	mv	s3,a4
80005594:	00078b13          	mv	s6,a5
80005598:	00080913          	mv	s2,a6
8000559c:	00088b93          	mv	s7,a7
800055a0:	00050493          	mv	s1,a0
800055a4:	00000413          	li	s0,0
800055a8:	f0054c37          	lui	s8,0xf0054
800055ac:	0ff67d93          	andi	s11,a2,255
800055b0:	05344063          	blt	s0,s3,800055f0 <hub_print+0xa0>
800055b4:	04c12083          	lw	ra,76(sp)
800055b8:	04812403          	lw	s0,72(sp)
800055bc:	04412483          	lw	s1,68(sp)
800055c0:	04012903          	lw	s2,64(sp)
800055c4:	03c12983          	lw	s3,60(sp)
800055c8:	03812a03          	lw	s4,56(sp)
800055cc:	03412a83          	lw	s5,52(sp)
800055d0:	03012b03          	lw	s6,48(sp)
800055d4:	02c12b83          	lw	s7,44(sp)
800055d8:	02812c03          	lw	s8,40(sp)
800055dc:	02412c83          	lw	s9,36(sp)
800055e0:	02012d03          	lw	s10,32(sp)
800055e4:	01c12d83          	lw	s11,28(sp)
800055e8:	05010113          	addi	sp,sp,80
800055ec:	00008067          	ret
800055f0:	000c2883          	lw	a7,0(s8) # f0054000 <_heap_end+0x70042000>
800055f4:	008a85b3          	add	a1,s5,s0
800055f8:	01712423          	sw	s7,8(sp)
800055fc:	01212223          	sw	s2,4(sp)
80005600:	01612023          	sw	s6,0(sp)
80005604:	8b01a803          	lw	a6,-1872(gp) # 80003050 <hub_frame_height>
80005608:	8b41a783          	lw	a5,-1868(gp) # 80003054 <hub_frame_width>
8000560c:	0005c583          	lbu	a1,0(a1) # 1000 <_stack_size+0x800>
80005610:	00048613          	mv	a2,s1
80005614:	07f8f893          	andi	a7,a7,127
80005618:	000d8713          	mv	a4,s11
8000561c:	000a0693          	mv	a3,s4
80005620:	f0050537          	lui	a0,0xf0050
80005624:	c51ff0ef          	jal	ra,80005274 <hub_print_char>
80005628:	00140413          	addi	s0,s0,1
8000562c:	012484b3          	add	s1,s1,s2
80005630:	f81ff06f          	j	800055b0 <hub_print+0x60>

80005634 <modbus_udp_init>:
80005634:	ff010113          	addi	sp,sp,-16
80005638:	02e00513          	li	a0,46
8000563c:	00912223          	sw	s1,4(sp)
80005640:	00112623          	sw	ra,12(sp)
80005644:	00812423          	sw	s0,8(sp)
80005648:	3ac030ef          	jal	ra,800089f4 <udp_new_ip_type>
8000564c:	8aa1ae23          	sw	a0,-1860(gp) # 8000305c <modbus_udp_pcb>
80005650:	02051663          	bnez	a0,8000567c <modbus_udp_init+0x48>
80005654:	80003537          	lui	a0,0x80003
80005658:	93c50513          	addi	a0,a0,-1732 # 8000293c <_heap_end+0xffff093c>
8000565c:	421080ef          	jal	ra,8000e27c <iprintf>
80005660:	fff00413          	li	s0,-1
80005664:	00040513          	mv	a0,s0
80005668:	00c12083          	lw	ra,12(sp)
8000566c:	00812403          	lw	s0,8(sp)
80005670:	00412483          	lw	s1,4(sp)
80005674:	01010113          	addi	sp,sp,16
80005678:	00008067          	ret
8000567c:	7d100613          	li	a2,2001
80005680:	84818593          	addi	a1,gp,-1976 # 80002fe8 <ip_addr_any>
80005684:	5e1020ef          	jal	ra,80008464 <udp_bind>
80005688:	00050413          	mv	s0,a0
8000568c:	00050e63          	beqz	a0,800056a8 <modbus_udp_init+0x74>
80005690:	80003537          	lui	a0,0x80003
80005694:	96c50513          	addi	a0,a0,-1684 # 8000296c <_heap_end+0xffff096c>
80005698:	3e5080ef          	jal	ra,8000e27c <iprintf>
8000569c:	8bc1a503          	lw	a0,-1860(gp) # 8000305c <modbus_udp_pcb>
800056a0:	2c0030ef          	jal	ra,80008960 <udp_remove>
800056a4:	fc1ff06f          	j	80005664 <modbus_udp_init+0x30>
800056a8:	8bc1a503          	lw	a0,-1860(gp) # 8000305c <modbus_udp_pcb>
800056ac:	800065b7          	lui	a1,0x80006
800056b0:	00000613          	li	a2,0
800056b4:	85058593          	addi	a1,a1,-1968 # 80005850 <_heap_end+0xffff3850>
800056b8:	298030ef          	jal	ra,80008950 <udp_recv>
800056bc:	80003537          	lui	a0,0x80003
800056c0:	99850513          	addi	a0,a0,-1640 # 80002998 <_heap_end+0xffff0998>
800056c4:	3b9080ef          	jal	ra,8000e27c <iprintf>
800056c8:	f9dff06f          	j	80005664 <modbus_udp_init+0x30>

800056cc <modbus_udp_send>:
800056cc:	fd010113          	addi	sp,sp,-48
800056d0:	01412c23          	sw	s4,24(sp)
800056d4:	00168a13          	addi	s4,a3,1
800056d8:	03212023          	sw	s2,32(sp)
800056dc:	00058913          	mv	s2,a1
800056e0:	010a1593          	slli	a1,s4,0x10
800056e4:	01312e23          	sw	s3,28(sp)
800056e8:	01512a23          	sw	s5,20(sp)
800056ec:	00050993          	mv	s3,a0
800056f0:	00060a93          	mv	s5,a2
800056f4:	0105d593          	srli	a1,a1,0x10
800056f8:	28000613          	li	a2,640
800056fc:	03800513          	li	a0,56
80005700:	02912223          	sw	s1,36(sp)
80005704:	02112623          	sw	ra,44(sp)
80005708:	02812423          	sw	s0,40(sp)
8000570c:	00068493          	mv	s1,a3
80005710:	76c010ef          	jal	ra,80006e7c <pbuf_alloc>
80005714:	04051063          	bnez	a0,80005754 <modbus_udp_send+0x88>
80005718:	f0000737          	lui	a4,0xf0000
8000571c:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
80005720:	80003537          	lui	a0,0x80003
80005724:	9b450513          	addi	a0,a0,-1612 # 800029b4 <_heap_end+0xffff09b4>
80005728:	ffd7f793          	andi	a5,a5,-3
8000572c:	00f72223          	sw	a5,4(a4)
80005730:	02812403          	lw	s0,40(sp)
80005734:	02c12083          	lw	ra,44(sp)
80005738:	02412483          	lw	s1,36(sp)
8000573c:	02012903          	lw	s2,32(sp)
80005740:	01c12983          	lw	s3,28(sp)
80005744:	01812a03          	lw	s4,24(sp)
80005748:	01412a83          	lw	s5,20(sp)
8000574c:	03010113          	addi	sp,sp,48
80005750:	32d0806f          	j	8000e27c <iprintf>
80005754:	00452783          	lw	a5,4(a0)
80005758:	00050413          	mv	s0,a0
8000575c:	00078663          	beqz	a5,80005768 <modbus_udp_send+0x9c>
80005760:	00a55703          	lhu	a4,10(a0)
80005764:	05477463          	bgeu	a4,s4,800057ac <modbus_udp_send+0xe0>
80005768:	f0000737          	lui	a4,0xf0000
8000576c:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
80005770:	80003537          	lui	a0,0x80003
80005774:	9e450513          	addi	a0,a0,-1564 # 800029e4 <_heap_end+0xffff09e4>
80005778:	ffd7f793          	andi	a5,a5,-3
8000577c:	00f72223          	sw	a5,4(a4)
80005780:	00a45603          	lhu	a2,10(s0)
80005784:	00442583          	lw	a1,4(s0)
80005788:	02812403          	lw	s0,40(sp)
8000578c:	02c12083          	lw	ra,44(sp)
80005790:	02412483          	lw	s1,36(sp)
80005794:	02012903          	lw	s2,32(sp)
80005798:	01c12983          	lw	s3,28(sp)
8000579c:	01812a03          	lw	s4,24(sp)
800057a0:	01412a83          	lw	s5,20(sp)
800057a4:	03010113          	addi	sp,sp,48
800057a8:	2d50806f          	j	8000e27c <iprintf>
800057ac:	00048613          	mv	a2,s1
800057b0:	000a8593          	mv	a1,s5
800057b4:	00078513          	mv	a0,a5
800057b8:	684080ef          	jal	ra,8000de3c <memcpy>
800057bc:	009507b3          	add	a5,a0,s1
800057c0:	00078023          	sb	zero,0(a5)
800057c4:	8bc1a503          	lw	a0,-1860(gp) # 8000305c <modbus_udp_pcb>
800057c8:	00040593          	mv	a1,s0
800057cc:	00090693          	mv	a3,s2
800057d0:	00098613          	mv	a2,s3
800057d4:	7c1020ef          	jal	ra,80008794 <udp_sendto>
800057d8:	00050593          	mv	a1,a0
800057dc:	04050463          	beqz	a0,80005824 <modbus_udp_send+0x158>
800057e0:	f0000737          	lui	a4,0xf0000
800057e4:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
800057e8:	80003537          	lui	a0,0x80003
800057ec:	a1c50513          	addi	a0,a0,-1508 # 80002a1c <_heap_end+0xffff0a1c>
800057f0:	ffd7f793          	andi	a5,a5,-3
800057f4:	00f72223          	sw	a5,4(a4)
800057f8:	285080ef          	jal	ra,8000e27c <iprintf>
800057fc:	00040513          	mv	a0,s0
80005800:	02812403          	lw	s0,40(sp)
80005804:	02c12083          	lw	ra,44(sp)
80005808:	02412483          	lw	s1,36(sp)
8000580c:	02012903          	lw	s2,32(sp)
80005810:	01c12983          	lw	s3,28(sp)
80005814:	01812a03          	lw	s4,24(sp)
80005818:	01412a83          	lw	s5,20(sp)
8000581c:	03010113          	addi	sp,sp,48
80005820:	5880106f          	j	80006da8 <pbuf_free>
80005824:	00a45583          	lhu	a1,10(s0)
80005828:	00098513          	mv	a0,s3
8000582c:	00b12623          	sw	a1,12(sp)
80005830:	795060ef          	jal	ra,8000c7c4 <ip4addr_ntoa>
80005834:	00c12583          	lw	a1,12(sp)
80005838:	00050613          	mv	a2,a0
8000583c:	80003537          	lui	a0,0x80003
80005840:	00090693          	mv	a3,s2
80005844:	a5450513          	addi	a0,a0,-1452 # 80002a54 <_heap_end+0xffff0a54>
80005848:	235080ef          	jal	ra,8000e27c <iprintf>
8000584c:	fb1ff06f          	j	800057fc <modbus_udp_send+0x130>

80005850 <modbus_udp_recv>:
80005850:	f6010113          	addi	sp,sp,-160
80005854:	08112e23          	sw	ra,156(sp)
80005858:	08912a23          	sw	s1,148(sp)
8000585c:	09212823          	sw	s2,144(sp)
80005860:	09312623          	sw	s3,140(sp)
80005864:	08812c23          	sw	s0,152(sp)
80005868:	09412423          	sw	s4,136(sp)
8000586c:	00a65403          	lhu	s0,10(a2) # f005000a <_heap_end+0x7003e00a>
80005870:	00068513          	mv	a0,a3
80005874:	00070993          	mv	s3,a4
80005878:	00060493          	mv	s1,a2
8000587c:	00462a03          	lw	s4,4(a2)
80005880:	00068913          	mv	s2,a3
80005884:	741060ef          	jal	ra,8000c7c4 <ip4addr_ntoa>
80005888:	00050593          	mv	a1,a0
8000588c:	80003537          	lui	a0,0x80003
80005890:	00040693          	mv	a3,s0
80005894:	00098613          	mv	a2,s3
80005898:	a8050513          	addi	a0,a0,-1408 # 80002a80 <_heap_end+0xffff0a80>
8000589c:	1e1080ef          	jal	ra,8000e27c <iprintf>
800058a0:	00040593          	mv	a1,s0
800058a4:	00010613          	mv	a2,sp
800058a8:	000a0513          	mv	a0,s4
800058ac:	d79fe0ef          	jal	ra,80004624 <modbus_recv>
800058b0:	00050413          	mv	s0,a0
800058b4:	00048513          	mv	a0,s1
800058b8:	4f0010ef          	jal	ra,80006da8 <pbuf_free>
800058bc:	02040463          	beqz	s0,800058e4 <modbus_udp_recv+0x94>
800058c0:	80003537          	lui	a0,0x80003
800058c4:	00040593          	mv	a1,s0
800058c8:	aac50513          	addi	a0,a0,-1364 # 80002aac <_heap_end+0xffff0aac>
800058cc:	1b1080ef          	jal	ra,8000e27c <iprintf>
800058d0:	00040693          	mv	a3,s0
800058d4:	00010613          	mv	a2,sp
800058d8:	00098593          	mv	a1,s3
800058dc:	00090513          	mv	a0,s2
800058e0:	dedff0ef          	jal	ra,800056cc <modbus_udp_send>
800058e4:	09c12083          	lw	ra,156(sp)
800058e8:	09812403          	lw	s0,152(sp)
800058ec:	09412483          	lw	s1,148(sp)
800058f0:	09012903          	lw	s2,144(sp)
800058f4:	08c12983          	lw	s3,140(sp)
800058f8:	08812a03          	lw	s4,136(sp)
800058fc:	0a010113          	addi	sp,sp,160
80005900:	00008067          	ret

80005904 <i2c_init>:
80005904:	0fa00793          	li	a5,250
80005908:	00f52423          	sw	a5,8(a0)
8000590c:	00008067          	ret

80005910 <i2c_wait_for_busy>:
80005910:	00000793          	li	a5,0
80005914:	00b7c663          	blt	a5,a1,80005920 <i2c_wait_for_busy+0x10>
80005918:	00000513          	li	a0,0
8000591c:	00008067          	ret
80005920:	00c52703          	lw	a4,12(a0)
80005924:	00277713          	andi	a4,a4,2
80005928:	00071663          	bnez	a4,80005934 <i2c_wait_for_busy+0x24>
8000592c:	00178793          	addi	a5,a5,1
80005930:	fe5ff06f          	j	80005914 <i2c_wait_for_busy+0x4>
80005934:	00100513          	li	a0,1
80005938:	00008067          	ret

8000593c <i2c_wait_for_release>:
8000593c:	00000793          	li	a5,0
80005940:	00b7c663          	blt	a5,a1,8000594c <i2c_wait_for_release+0x10>
80005944:	00000513          	li	a0,0
80005948:	00008067          	ret
8000594c:	00c52703          	lw	a4,12(a0)
80005950:	00277713          	andi	a4,a4,2
80005954:	00070663          	beqz	a4,80005960 <i2c_wait_for_release+0x24>
80005958:	00178793          	addi	a5,a5,1
8000595c:	fe5ff06f          	j	80005940 <i2c_wait_for_release+0x4>
80005960:	00100513          	li	a0,1
80005964:	00008067          	ret

80005968 <__malloc_lock>:
80005968:	00008067          	ret

8000596c <__malloc_unlock>:
8000596c:	00008067          	ret

80005970 <init_sbrk>:
80005970:	800117b7          	lui	a5,0x80011
80005974:	f6078793          	addi	a5,a5,-160 # 80010f60 <_heap_end+0xffffef60>
80005978:	8cf1a023          	sw	a5,-1856(gp) # 80003060 <sbrk_heap_end>
8000597c:	00008067          	ret

80005980 <delay>:
80005980:	00000793          	li	a5,0
80005984:	00a79463          	bne	a5,a0,8000598c <delay+0xc>
80005988:	00008067          	ret
8000598c:	00060613          	mv	a2,a2
80005990:	00178793          	addi	a5,a5,1
80005994:	ff1ff06f          	j	80005984 <delay+0x4>

80005998 <delay_us>:
80005998:	f00b07b7          	lui	a5,0xf00b0
8000599c:	0007a803          	lw	a6,0(a5) # f00b0000 <_heap_end+0x7009e000>
800059a0:	0047a883          	lw	a7,4(a5)
800059a4:	f00b0637          	lui	a2,0xf00b0
800059a8:	00062303          	lw	t1,0(a2) # f00b0000 <_heap_end+0x7009e000>
800059ac:	00462383          	lw	t2,4(a2)
800059b0:	410306b3          	sub	a3,t1,a6
800059b4:	00d33733          	sltu	a4,t1,a3
800059b8:	411387b3          	sub	a5,t2,a7
800059bc:	00e79463          	bne	a5,a4,800059c4 <delay_us+0x2c>
800059c0:	fea6e4e3          	bltu	a3,a0,800059a8 <delay_us+0x10>
800059c4:	00008067          	ret

800059c8 <print_uart0>:
800059c8:	f00106b7          	lui	a3,0xf0010
800059cc:	00054703          	lbu	a4,0(a0)
800059d0:	00071463          	bnez	a4,800059d8 <print_uart0+0x10>
800059d4:	00008067          	ret
800059d8:	0046a783          	lw	a5,4(a3) # f0010004 <_heap_end+0x6fffe004>
800059dc:	0107d793          	srli	a5,a5,0x10
800059e0:	0ff7f793          	andi	a5,a5,255
800059e4:	fe078ae3          	beqz	a5,800059d8 <print_uart0+0x10>
800059e8:	00e6a023          	sw	a4,0(a3)
800059ec:	00150513          	addi	a0,a0,1
800059f0:	fddff06f          	j	800059cc <print_uart0+0x4>

800059f4 <_sbrk>:
800059f4:	8c01a783          	lw	a5,-1856(gp) # 80003060 <sbrk_heap_end>
800059f8:	00079863          	bnez	a5,80005a08 <_sbrk+0x14>
800059fc:	800117b7          	lui	a5,0x80011
80005a00:	f6078793          	addi	a5,a5,-160 # 80010f60 <_heap_end+0xffffef60>
80005a04:	8cf1a023          	sw	a5,-1856(gp) # 80003060 <sbrk_heap_end>
80005a08:	8c01a683          	lw	a3,-1856(gp) # 80003060 <sbrk_heap_end>
80005a0c:	80012737          	lui	a4,0x80012
80005a10:	00070593          	mv	a1,a4
80005a14:	00a687b3          	add	a5,a3,a0
80005a18:	04f5f263          	bgeu	a1,a5,80005a5c <_sbrk+0x68>
80005a1c:	f7010113          	addi	sp,sp,-144
80005a20:	80003637          	lui	a2,0x80003
80005a24:	00050793          	mv	a5,a0
80005a28:	00070713          	mv	a4,a4
80005a2c:	adc60613          	addi	a2,a2,-1316 # 80002adc <_heap_end+0xffff0adc>
80005a30:	08000593          	li	a1,128
80005a34:	00010513          	mv	a0,sp
80005a38:	08112623          	sw	ra,140(sp)
80005a3c:	1ad080ef          	jal	ra,8000e3e8 <sniprintf>
80005a40:	00010513          	mv	a0,sp
80005a44:	f85ff0ef          	jal	ra,800059c8 <print_uart0>
80005a48:	08c12083          	lw	ra,140(sp)
80005a4c:	fff00693          	li	a3,-1
80005a50:	00068513          	mv	a0,a3
80005a54:	09010113          	addi	sp,sp,144
80005a58:	00008067          	ret
80005a5c:	8cf1a023          	sw	a5,-1856(gp) # 80003060 <sbrk_heap_end>
80005a60:	00068513          	mv	a0,a3
80005a64:	00008067          	ret

80005a68 <print_uart1>:
80005a68:	f00116b7          	lui	a3,0xf0011
80005a6c:	00054703          	lbu	a4,0(a0)
80005a70:	00071463          	bnez	a4,80005a78 <print_uart1+0x10>
80005a74:	00008067          	ret
80005a78:	0046a783          	lw	a5,4(a3) # f0011004 <_heap_end+0x6ffff004>
80005a7c:	0107d793          	srli	a5,a5,0x10
80005a80:	0ff7f793          	andi	a5,a5,255
80005a84:	fe078ae3          	beqz	a5,80005a78 <print_uart1+0x10>
80005a88:	00e6a023          	sw	a4,0(a3)
80005a8c:	00150513          	addi	a0,a0,1
80005a90:	fddff06f          	j	80005a6c <print_uart1+0x4>

80005a94 <_write>:
80005a94:	00c586b3          	add	a3,a1,a2
80005a98:	f0010737          	lui	a4,0xf0010
80005a9c:	00d59663          	bne	a1,a3,80005aa8 <_write+0x14>
80005aa0:	00060513          	mv	a0,a2
80005aa4:	00008067          	ret
80005aa8:	00158593          	addi	a1,a1,1
80005aac:	fff5c503          	lbu	a0,-1(a1)
80005ab0:	00472783          	lw	a5,4(a4) # f0010004 <_heap_end+0x6fffe004>
80005ab4:	0107d793          	srli	a5,a5,0x10
80005ab8:	0ff7f793          	andi	a5,a5,255
80005abc:	fe078ae3          	beqz	a5,80005ab0 <_write+0x1c>
80005ac0:	00a72023          	sw	a0,0(a4)
80005ac4:	fd9ff06f          	j	80005a9c <_write+0x8>

80005ac8 <_read>:
80005ac8:	00100513          	li	a0,1
80005acc:	00008067          	ret

80005ad0 <_close>:
80005ad0:	fff00513          	li	a0,-1
80005ad4:	00008067          	ret

80005ad8 <_lseek>:
80005ad8:	00000513          	li	a0,0
80005adc:	00008067          	ret

80005ae0 <_isatty>:
80005ae0:	00100513          	li	a0,1
80005ae4:	00008067          	ret

80005ae8 <_fstat>:
80005ae8:	000027b7          	lui	a5,0x2
80005aec:	00f5a223          	sw	a5,4(a1)
80005af0:	00000513          	li	a0,0
80005af4:	00008067          	ret

80005af8 <_kill>:
80005af8:	00008067          	ret

80005afc <_getpid>:
80005afc:	fff00513          	li	a0,-1
80005b00:	00008067          	ret

80005b04 <hard_reboot>:
80005b04:	80003537          	lui	a0,0x80003
80005b08:	ff010113          	addi	sp,sp,-16
80005b0c:	b1c50513          	addi	a0,a0,-1252 # 80002b1c <_heap_end+0xffff0b1c>
80005b10:	00112623          	sw	ra,12(sp)
80005b14:	eb5ff0ef          	jal	ra,800059c8 <print_uart0>
80005b18:	3e800513          	li	a0,1000
80005b1c:	e7dff0ef          	jal	ra,80005998 <delay_us>
80005b20:	f00a07b7          	lui	a5,0xf00a0
80005b24:	00100713          	li	a4,1
80005b28:	00e7a423          	sw	a4,8(a5) # f00a0008 <_heap_end+0x7008e008>
80005b2c:	00c12083          	lw	ra,12(sp)
80005b30:	01010113          	addi	sp,sp,16
80005b34:	00008067          	ret

80005b38 <memcpy_rev>:
80005b38:	00000793          	li	a5,0
80005b3c:	00f61463          	bne	a2,a5,80005b44 <memcpy_rev+0xc>
80005b40:	00008067          	ret
80005b44:	40f58733          	sub	a4,a1,a5
80005b48:	00074683          	lbu	a3,0(a4)
80005b4c:	00f50733          	add	a4,a0,a5
80005b50:	00178793          	addi	a5,a5,1
80005b54:	00d70023          	sb	a3,0(a4)
80005b58:	fe5ff06f          	j	80005b3c <memcpy_rev+0x4>

80005b5c <lwip_init>:
80005b5c:	ff010113          	addi	sp,sp,-16
80005b60:	00112623          	sw	ra,12(sp)
80005b64:	340020ef          	jal	ra,80007ea4 <stats_init>
80005b68:	015000ef          	jal	ra,8000637c <mem_init>
80005b6c:	141000ef          	jal	ra,800064ac <memp_init>
80005b70:	27d000ef          	jal	ra,800065ec <netif_init>
80005b74:	618020ef          	jal	ra,8000818c <udp_init>
80005b78:	00c12083          	lw	ra,12(sp)
80005b7c:	01010113          	addi	sp,sp,16
80005b80:	4500206f          	j	80007fd0 <sys_timeouts_init>

80005b84 <lwip_htons>:
80005b84:	00851793          	slli	a5,a0,0x8
80005b88:	00855513          	srli	a0,a0,0x8
80005b8c:	00a7e533          	or	a0,a5,a0
80005b90:	01051513          	slli	a0,a0,0x10
80005b94:	01055513          	srli	a0,a0,0x10
80005b98:	00008067          	ret

80005b9c <lwip_htonl>:
80005b9c:	01855713          	srli	a4,a0,0x18
80005ba0:	01851793          	slli	a5,a0,0x18
80005ba4:	00e7e7b3          	or	a5,a5,a4
80005ba8:	00ff06b7          	lui	a3,0xff0
80005bac:	00851713          	slli	a4,a0,0x8
80005bb0:	00d77733          	and	a4,a4,a3
80005bb4:	00e7e7b3          	or	a5,a5,a4
80005bb8:	00010737          	lui	a4,0x10
80005bbc:	f0070713          	addi	a4,a4,-256 # ff00 <_stack_size+0xf700>
80005bc0:	00855513          	srli	a0,a0,0x8
80005bc4:	00e57533          	and	a0,a0,a4
80005bc8:	00a7e533          	or	a0,a5,a0
80005bcc:	00008067          	ret

80005bd0 <lwip_strnstr>:
80005bd0:	fe010113          	addi	sp,sp,-32
80005bd4:	00812c23          	sw	s0,24(sp)
80005bd8:	00050413          	mv	s0,a0
80005bdc:	00058513          	mv	a0,a1
80005be0:	00912a23          	sw	s1,20(sp)
80005be4:	01312623          	sw	s3,12(sp)
80005be8:	00112e23          	sw	ra,28(sp)
80005bec:	01212823          	sw	s2,16(sp)
80005bf0:	00058993          	mv	s3,a1
80005bf4:	00060493          	mv	s1,a2
80005bf8:	2bd080ef          	jal	ra,8000e6b4 <strlen>
80005bfc:	02050063          	beqz	a0,80005c1c <lwip_strnstr+0x4c>
80005c00:	00050913          	mv	s2,a0
80005c04:	009404b3          	add	s1,s0,s1
80005c08:	00044783          	lbu	a5,0(s0)
80005c0c:	00078663          	beqz	a5,80005c18 <lwip_strnstr+0x48>
80005c10:	01240733          	add	a4,s0,s2
80005c14:	02e4f463          	bgeu	s1,a4,80005c3c <lwip_strnstr+0x6c>
80005c18:	00000413          	li	s0,0
80005c1c:	00040513          	mv	a0,s0
80005c20:	01c12083          	lw	ra,28(sp)
80005c24:	01812403          	lw	s0,24(sp)
80005c28:	01412483          	lw	s1,20(sp)
80005c2c:	01012903          	lw	s2,16(sp)
80005c30:	00c12983          	lw	s3,12(sp)
80005c34:	02010113          	addi	sp,sp,32
80005c38:	00008067          	ret
80005c3c:	0009c703          	lbu	a4,0(s3)
80005c40:	00f71c63          	bne	a4,a5,80005c58 <lwip_strnstr+0x88>
80005c44:	00090613          	mv	a2,s2
80005c48:	00098593          	mv	a1,s3
80005c4c:	00040513          	mv	a0,s0
80005c50:	281080ef          	jal	ra,8000e6d0 <strncmp>
80005c54:	fc0504e3          	beqz	a0,80005c1c <lwip_strnstr+0x4c>
80005c58:	00140413          	addi	s0,s0,1
80005c5c:	fadff06f          	j	80005c08 <lwip_strnstr+0x38>

80005c60 <lwip_stricmp>:
80005c60:	01900813          	li	a6,25
80005c64:	00150513          	addi	a0,a0,1
80005c68:	00158593          	addi	a1,a1,1
80005c6c:	fff54703          	lbu	a4,-1(a0)
80005c70:	fff5c783          	lbu	a5,-1(a1)
80005c74:	00f70e63          	beq	a4,a5,80005c90 <lwip_stricmp+0x30>
80005c78:	02076613          	ori	a2,a4,32
80005c7c:	f9f60693          	addi	a3,a2,-97
80005c80:	0ff6f693          	andi	a3,a3,255
80005c84:	00d86c63          	bltu	a6,a3,80005c9c <lwip_stricmp+0x3c>
80005c88:	0207e793          	ori	a5,a5,32
80005c8c:	00f61863          	bne	a2,a5,80005c9c <lwip_stricmp+0x3c>
80005c90:	fc071ae3          	bnez	a4,80005c64 <lwip_stricmp+0x4>
80005c94:	00000513          	li	a0,0
80005c98:	00008067          	ret
80005c9c:	00100513          	li	a0,1
80005ca0:	00008067          	ret

80005ca4 <lwip_strnicmp>:
80005ca4:	fff60613          	addi	a2,a2,-1
80005ca8:	00000793          	li	a5,0
80005cac:	01900313          	li	t1,25
80005cb0:	00f50733          	add	a4,a0,a5
80005cb4:	00074683          	lbu	a3,0(a4)
80005cb8:	00f58733          	add	a4,a1,a5
80005cbc:	00074703          	lbu	a4,0(a4)
80005cc0:	00e68e63          	beq	a3,a4,80005cdc <lwip_strnicmp+0x38>
80005cc4:	0206e893          	ori	a7,a3,32
80005cc8:	f9f88813          	addi	a6,a7,-97
80005ccc:	0ff87813          	andi	a6,a6,255
80005cd0:	03036063          	bltu	t1,a6,80005cf0 <lwip_strnicmp+0x4c>
80005cd4:	02076713          	ori	a4,a4,32
80005cd8:	00e89c63          	bne	a7,a4,80005cf0 <lwip_strnicmp+0x4c>
80005cdc:	00f60663          	beq	a2,a5,80005ce8 <lwip_strnicmp+0x44>
80005ce0:	00178793          	addi	a5,a5,1
80005ce4:	fc0696e3          	bnez	a3,80005cb0 <lwip_strnicmp+0xc>
80005ce8:	00000513          	li	a0,0
80005cec:	00008067          	ret
80005cf0:	00100513          	li	a0,1
80005cf4:	00008067          	ret

80005cf8 <lwip_itoa>:
80005cf8:	fe010113          	addi	sp,sp,-32
80005cfc:	01212823          	sw	s2,16(sp)
80005d00:	01412423          	sw	s4,8(sp)
80005d04:	00112e23          	sw	ra,28(sp)
80005d08:	00812c23          	sw	s0,24(sp)
80005d0c:	00912a23          	sw	s1,20(sp)
80005d10:	01312623          	sw	s3,12(sp)
80005d14:	00100793          	li	a5,1
80005d18:	00050913          	mv	s2,a0
80005d1c:	00058a13          	mv	s4,a1
80005d20:	02b7e663          	bltu	a5,a1,80005d4c <lwip_itoa+0x54>
80005d24:	00f59463          	bne	a1,a5,80005d2c <lwip_itoa+0x34>
80005d28:	00090023          	sb	zero,0(s2)
80005d2c:	01c12083          	lw	ra,28(sp)
80005d30:	01812403          	lw	s0,24(sp)
80005d34:	01412483          	lw	s1,20(sp)
80005d38:	01012903          	lw	s2,16(sp)
80005d3c:	00c12983          	lw	s3,12(sp)
80005d40:	00812a03          	lw	s4,8(sp)
80005d44:	02010113          	addi	sp,sp,32
80005d48:	00008067          	ret
80005d4c:	00050993          	mv	s3,a0
80005d50:	00065863          	bgez	a2,80005d60 <lwip_itoa+0x68>
80005d54:	02d00793          	li	a5,45
80005d58:	00150993          	addi	s3,a0,1
80005d5c:	00f50023          	sb	a5,0(a0)
80005d60:	41f65793          	srai	a5,a2,0x1f
80005d64:	fffa0413          	addi	s0,s4,-1
80005d68:	00890433          	add	s0,s2,s0
80005d6c:	00c7c4b3          	xor	s1,a5,a2
80005d70:	40f484b3          	sub	s1,s1,a5
80005d74:	00040023          	sb	zero,0(s0)
80005d78:	04048263          	beqz	s1,80005dbc <lwip_itoa+0xc4>
80005d7c:	fa89f6e3          	bgeu	s3,s0,80005d28 <lwip_itoa+0x30>
80005d80:	00a00593          	li	a1,10
80005d84:	00048513          	mv	a0,s1
80005d88:	410070ef          	jal	ra,8000d198 <__modsi3>
80005d8c:	03050513          	addi	a0,a0,48
80005d90:	fff40413          	addi	s0,s0,-1
80005d94:	00a40023          	sb	a0,0(s0)
80005d98:	00a00593          	li	a1,10
80005d9c:	00048513          	mv	a0,s1
80005da0:	374070ef          	jal	ra,8000d114 <__divsi3>
80005da4:	00050493          	mv	s1,a0
80005da8:	fd1ff06f          	j	80005d78 <lwip_itoa+0x80>
80005dac:	03000793          	li	a5,48
80005db0:	00f98023          	sb	a5,0(s3)
80005db4:	000980a3          	sb	zero,1(s3)
80005db8:	f75ff06f          	j	80005d2c <lwip_itoa+0x34>
80005dbc:	00044783          	lbu	a5,0(s0)
80005dc0:	fe0786e3          	beqz	a5,80005dac <lwip_itoa+0xb4>
80005dc4:	01490633          	add	a2,s2,s4
80005dc8:	40860633          	sub	a2,a2,s0
80005dcc:	00040593          	mv	a1,s0
80005dd0:	01812403          	lw	s0,24(sp)
80005dd4:	01c12083          	lw	ra,28(sp)
80005dd8:	01412483          	lw	s1,20(sp)
80005ddc:	01012903          	lw	s2,16(sp)
80005de0:	00812a03          	lw	s4,8(sp)
80005de4:	00098513          	mv	a0,s3
80005de8:	00c12983          	lw	s3,12(sp)
80005dec:	02010113          	addi	sp,sp,32
80005df0:	1240806f          	j	8000df14 <memmove>

80005df4 <lwip_standard_chksum>:
80005df4:	ff010113          	addi	sp,sp,-16
80005df8:	00011723          	sh	zero,14(sp)
80005dfc:	00157693          	andi	a3,a0,1
80005e00:	00068c63          	beqz	a3,80005e18 <lwip_standard_chksum+0x24>
80005e04:	00b05a63          	blez	a1,80005e18 <lwip_standard_chksum+0x24>
80005e08:	00054783          	lbu	a5,0(a0)
80005e0c:	fff58593          	addi	a1,a1,-1
80005e10:	00150513          	addi	a0,a0,1
80005e14:	00f107a3          	sb	a5,15(sp)
80005e18:	00000793          	li	a5,0
80005e1c:	00100713          	li	a4,1
80005e20:	06b74063          	blt	a4,a1,80005e80 <lwip_standard_chksum+0x8c>
80005e24:	00e59663          	bne	a1,a4,80005e30 <lwip_standard_chksum+0x3c>
80005e28:	00054703          	lbu	a4,0(a0)
80005e2c:	00e10723          	sb	a4,14(sp)
80005e30:	00e15503          	lhu	a0,14(sp)
80005e34:	00010737          	lui	a4,0x10
80005e38:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
80005e3c:	00f50533          	add	a0,a0,a5
80005e40:	01055793          	srli	a5,a0,0x10
80005e44:	00e57533          	and	a0,a0,a4
80005e48:	00a787b3          	add	a5,a5,a0
80005e4c:	0107d513          	srli	a0,a5,0x10
80005e50:	00e7f7b3          	and	a5,a5,a4
80005e54:	00f50533          	add	a0,a0,a5
80005e58:	00068c63          	beqz	a3,80005e70 <lwip_standard_chksum+0x7c>
80005e5c:	00851793          	slli	a5,a0,0x8
80005e60:	00855513          	srli	a0,a0,0x8
80005e64:	00e7f733          	and	a4,a5,a4
80005e68:	0ff57513          	andi	a0,a0,255
80005e6c:	00a76533          	or	a0,a4,a0
80005e70:	01051513          	slli	a0,a0,0x10
80005e74:	01055513          	srli	a0,a0,0x10
80005e78:	01010113          	addi	sp,sp,16
80005e7c:	00008067          	ret
80005e80:	00250513          	addi	a0,a0,2
80005e84:	ffe55603          	lhu	a2,-2(a0)
80005e88:	ffe58593          	addi	a1,a1,-2
80005e8c:	00c787b3          	add	a5,a5,a2
80005e90:	f91ff06f          	j	80005e20 <lwip_standard_chksum+0x2c>

80005e94 <inet_chksum_pseudo>:
80005e94:	fe010113          	addi	sp,sp,-32
80005e98:	00812c23          	sw	s0,24(sp)
80005e9c:	00912a23          	sw	s1,20(sp)
80005ea0:	01212823          	sw	s2,16(sp)
80005ea4:	01312623          	sw	s3,12(sp)
80005ea8:	01412423          	sw	s4,8(sp)
80005eac:	01512223          	sw	s5,4(sp)
80005eb0:	00112e23          	sw	ra,28(sp)
80005eb4:	00072703          	lw	a4,0(a4)
80005eb8:	0006a683          	lw	a3,0(a3) # ff0000 <_stack_size+0xfef800>
80005ebc:	000107b7          	lui	a5,0x10
80005ec0:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80005ec4:	00f77433          	and	s0,a4,a5
80005ec8:	01075713          	srli	a4,a4,0x10
80005ecc:	00e40433          	add	s0,s0,a4
80005ed0:	00f6f733          	and	a4,a3,a5
80005ed4:	00e40433          	add	s0,s0,a4
80005ed8:	0106d693          	srli	a3,a3,0x10
80005edc:	008686b3          	add	a3,a3,s0
80005ee0:	0106d413          	srli	s0,a3,0x10
80005ee4:	00f6f6b3          	and	a3,a3,a5
80005ee8:	00d406b3          	add	a3,s0,a3
80005eec:	0106d413          	srli	s0,a3,0x10
80005ef0:	00f6f6b3          	and	a3,a3,a5
80005ef4:	00050993          	mv	s3,a0
80005ef8:	00058a13          	mv	s4,a1
80005efc:	00060913          	mv	s2,a2
80005f00:	00d40433          	add	s0,s0,a3
80005f04:	00000a93          	li	s5,0
80005f08:	00078493          	mv	s1,a5
80005f0c:	08099863          	bnez	s3,80005f9c <inet_chksum_pseudo+0x108>
80005f10:	020a8063          	beqz	s5,80005f30 <inet_chksum_pseudo+0x9c>
80005f14:	00010737          	lui	a4,0x10
80005f18:	00841793          	slli	a5,s0,0x8
80005f1c:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
80005f20:	00845413          	srli	s0,s0,0x8
80005f24:	00e7f7b3          	and	a5,a5,a4
80005f28:	0ff47413          	andi	s0,s0,255
80005f2c:	0087e433          	or	s0,a5,s0
80005f30:	000a0513          	mv	a0,s4
80005f34:	c51ff0ef          	jal	ra,80005b84 <lwip_htons>
80005f38:	00050493          	mv	s1,a0
80005f3c:	00090513          	mv	a0,s2
80005f40:	c45ff0ef          	jal	ra,80005b84 <lwip_htons>
80005f44:	00a48533          	add	a0,s1,a0
80005f48:	000107b7          	lui	a5,0x10
80005f4c:	00850433          	add	s0,a0,s0
80005f50:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80005f54:	01045513          	srli	a0,s0,0x10
80005f58:	00f47433          	and	s0,s0,a5
80005f5c:	00850433          	add	s0,a0,s0
80005f60:	01045513          	srli	a0,s0,0x10
80005f64:	00f47433          	and	s0,s0,a5
80005f68:	00850433          	add	s0,a0,s0
80005f6c:	fff44513          	not	a0,s0
80005f70:	01c12083          	lw	ra,28(sp)
80005f74:	01812403          	lw	s0,24(sp)
80005f78:	01051513          	slli	a0,a0,0x10
80005f7c:	01412483          	lw	s1,20(sp)
80005f80:	01012903          	lw	s2,16(sp)
80005f84:	00c12983          	lw	s3,12(sp)
80005f88:	00812a03          	lw	s4,8(sp)
80005f8c:	00412a83          	lw	s5,4(sp)
80005f90:	01055513          	srli	a0,a0,0x10
80005f94:	02010113          	addi	sp,sp,32
80005f98:	00008067          	ret
80005f9c:	00a9d583          	lhu	a1,10(s3)
80005fa0:	0049a503          	lw	a0,4(s3)
80005fa4:	e51ff0ef          	jal	ra,80005df4 <lwip_standard_chksum>
80005fa8:	00850433          	add	s0,a0,s0
80005fac:	01045793          	srli	a5,s0,0x10
80005fb0:	00947433          	and	s0,s0,s1
80005fb4:	00878433          	add	s0,a5,s0
80005fb8:	00a9d783          	lhu	a5,10(s3)
80005fbc:	0017f793          	andi	a5,a5,1
80005fc0:	00078e63          	beqz	a5,80005fdc <inet_chksum_pseudo+0x148>
80005fc4:	00841793          	slli	a5,s0,0x8
80005fc8:	00845413          	srli	s0,s0,0x8
80005fcc:	0097f7b3          	and	a5,a5,s1
80005fd0:	0ff47413          	andi	s0,s0,255
80005fd4:	001aca93          	xori	s5,s5,1
80005fd8:	0087e433          	or	s0,a5,s0
80005fdc:	0009a983          	lw	s3,0(s3)
80005fe0:	f2dff06f          	j	80005f0c <inet_chksum_pseudo+0x78>

80005fe4 <ip_chksum_pseudo>:
80005fe4:	eb1ff06f          	j	80005e94 <inet_chksum_pseudo>

80005fe8 <inet_chksum_pseudo_partial>:
80005fe8:	fd010113          	addi	sp,sp,-48
80005fec:	02812423          	sw	s0,40(sp)
80005ff0:	02912223          	sw	s1,36(sp)
80005ff4:	03212023          	sw	s2,32(sp)
80005ff8:	01412c23          	sw	s4,24(sp)
80005ffc:	01512a23          	sw	s5,20(sp)
80006000:	01612823          	sw	s6,16(sp)
80006004:	02112623          	sw	ra,44(sp)
80006008:	01312e23          	sw	s3,28(sp)
8000600c:	00060913          	mv	s2,a2
80006010:	0007a603          	lw	a2,0(a5)
80006014:	00072703          	lw	a4,0(a4)
80006018:	000107b7          	lui	a5,0x10
8000601c:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80006020:	00f67433          	and	s0,a2,a5
80006024:	01065613          	srli	a2,a2,0x10
80006028:	00c40433          	add	s0,s0,a2
8000602c:	00f77633          	and	a2,a4,a5
80006030:	00c40433          	add	s0,s0,a2
80006034:	01075713          	srli	a4,a4,0x10
80006038:	00870733          	add	a4,a4,s0
8000603c:	01075413          	srli	s0,a4,0x10
80006040:	00f77733          	and	a4,a4,a5
80006044:	00e40733          	add	a4,s0,a4
80006048:	01075413          	srli	s0,a4,0x10
8000604c:	00f77733          	and	a4,a4,a5
80006050:	00050a13          	mv	s4,a0
80006054:	00058a93          	mv	s5,a1
80006058:	00e40433          	add	s0,s0,a4
8000605c:	00000b13          	li	s6,0
80006060:	00078493          	mv	s1,a5
80006064:	060a1c63          	bnez	s4,800060dc <inet_chksum_pseudo_partial+0xf4>
80006068:	0e0b1663          	bnez	s6,80006154 <inet_chksum_pseudo_partial+0x16c>
8000606c:	000a8513          	mv	a0,s5
80006070:	b15ff0ef          	jal	ra,80005b84 <lwip_htons>
80006074:	00050493          	mv	s1,a0
80006078:	00090513          	mv	a0,s2
8000607c:	b09ff0ef          	jal	ra,80005b84 <lwip_htons>
80006080:	00a48533          	add	a0,s1,a0
80006084:	000107b7          	lui	a5,0x10
80006088:	00850433          	add	s0,a0,s0
8000608c:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
80006090:	01045513          	srli	a0,s0,0x10
80006094:	00f47433          	and	s0,s0,a5
80006098:	00850433          	add	s0,a0,s0
8000609c:	01045513          	srli	a0,s0,0x10
800060a0:	00f47433          	and	s0,s0,a5
800060a4:	00850433          	add	s0,a0,s0
800060a8:	fff44513          	not	a0,s0
800060ac:	02c12083          	lw	ra,44(sp)
800060b0:	02812403          	lw	s0,40(sp)
800060b4:	01051513          	slli	a0,a0,0x10
800060b8:	02412483          	lw	s1,36(sp)
800060bc:	02012903          	lw	s2,32(sp)
800060c0:	01c12983          	lw	s3,28(sp)
800060c4:	01812a03          	lw	s4,24(sp)
800060c8:	01412a83          	lw	s5,20(sp)
800060cc:	01012b03          	lw	s6,16(sp)
800060d0:	01055513          	srli	a0,a0,0x10
800060d4:	03010113          	addi	sp,sp,48
800060d8:	00008067          	ret
800060dc:	f80686e3          	beqz	a3,80006068 <inet_chksum_pseudo_partial+0x80>
800060e0:	00aa5783          	lhu	a5,10(s4)
800060e4:	00078993          	mv	s3,a5
800060e8:	00f6f463          	bgeu	a3,a5,800060f0 <inet_chksum_pseudo_partial+0x108>
800060ec:	00068993          	mv	s3,a3
800060f0:	01099993          	slli	s3,s3,0x10
800060f4:	004a2503          	lw	a0,4(s4)
800060f8:	0109d993          	srli	s3,s3,0x10
800060fc:	00098593          	mv	a1,s3
80006100:	00d12623          	sw	a3,12(sp)
80006104:	cf1ff0ef          	jal	ra,80005df4 <lwip_standard_chksum>
80006108:	00850433          	add	s0,a0,s0
8000610c:	01045793          	srli	a5,s0,0x10
80006110:	00c12683          	lw	a3,12(sp)
80006114:	00947433          	and	s0,s0,s1
80006118:	00878433          	add	s0,a5,s0
8000611c:	00aa5783          	lhu	a5,10(s4)
80006120:	413689b3          	sub	s3,a3,s3
80006124:	01099693          	slli	a3,s3,0x10
80006128:	0017f793          	andi	a5,a5,1
8000612c:	0106d693          	srli	a3,a3,0x10
80006130:	00078e63          	beqz	a5,8000614c <inet_chksum_pseudo_partial+0x164>
80006134:	00841793          	slli	a5,s0,0x8
80006138:	00845413          	srli	s0,s0,0x8
8000613c:	0097f7b3          	and	a5,a5,s1
80006140:	0ff47413          	andi	s0,s0,255
80006144:	001b4b13          	xori	s6,s6,1
80006148:	0087e433          	or	s0,a5,s0
8000614c:	000a2a03          	lw	s4,0(s4)
80006150:	f15ff06f          	j	80006064 <inet_chksum_pseudo_partial+0x7c>
80006154:	00010737          	lui	a4,0x10
80006158:	00841793          	slli	a5,s0,0x8
8000615c:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
80006160:	00845413          	srli	s0,s0,0x8
80006164:	00e7f7b3          	and	a5,a5,a4
80006168:	0ff47413          	andi	s0,s0,255
8000616c:	0087e433          	or	s0,a5,s0
80006170:	efdff06f          	j	8000606c <inet_chksum_pseudo_partial+0x84>

80006174 <ip_chksum_pseudo_partial>:
80006174:	e75ff06f          	j	80005fe8 <inet_chksum_pseudo_partial>

80006178 <inet_chksum>:
80006178:	ff010113          	addi	sp,sp,-16
8000617c:	00112623          	sw	ra,12(sp)
80006180:	c75ff0ef          	jal	ra,80005df4 <lwip_standard_chksum>
80006184:	00c12083          	lw	ra,12(sp)
80006188:	fff54513          	not	a0,a0
8000618c:	01051513          	slli	a0,a0,0x10
80006190:	01055513          	srli	a0,a0,0x10
80006194:	01010113          	addi	sp,sp,16
80006198:	00008067          	ret

8000619c <inet_chksum_pbuf>:
8000619c:	fe010113          	addi	sp,sp,-32
800061a0:	01212823          	sw	s2,16(sp)
800061a4:	00010937          	lui	s2,0x10
800061a8:	00812c23          	sw	s0,24(sp)
800061ac:	00912a23          	sw	s1,20(sp)
800061b0:	01312623          	sw	s3,12(sp)
800061b4:	00112e23          	sw	ra,28(sp)
800061b8:	00050493          	mv	s1,a0
800061bc:	00000993          	li	s3,0
800061c0:	00000413          	li	s0,0
800061c4:	fff90913          	addi	s2,s2,-1 # ffff <_stack_size+0xf7ff>
800061c8:	04049663          	bnez	s1,80006214 <inet_chksum_pbuf+0x78>
800061cc:	02098063          	beqz	s3,800061ec <inet_chksum_pbuf+0x50>
800061d0:	00010737          	lui	a4,0x10
800061d4:	00841793          	slli	a5,s0,0x8
800061d8:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
800061dc:	00845413          	srli	s0,s0,0x8
800061e0:	00e7f7b3          	and	a5,a5,a4
800061e4:	0ff47413          	andi	s0,s0,255
800061e8:	0087e433          	or	s0,a5,s0
800061ec:	fff44513          	not	a0,s0
800061f0:	01c12083          	lw	ra,28(sp)
800061f4:	01812403          	lw	s0,24(sp)
800061f8:	01051513          	slli	a0,a0,0x10
800061fc:	01412483          	lw	s1,20(sp)
80006200:	01012903          	lw	s2,16(sp)
80006204:	00c12983          	lw	s3,12(sp)
80006208:	01055513          	srli	a0,a0,0x10
8000620c:	02010113          	addi	sp,sp,32
80006210:	00008067          	ret
80006214:	00a4d583          	lhu	a1,10(s1)
80006218:	0044a503          	lw	a0,4(s1)
8000621c:	bd9ff0ef          	jal	ra,80005df4 <lwip_standard_chksum>
80006220:	00850433          	add	s0,a0,s0
80006224:	01045793          	srli	a5,s0,0x10
80006228:	01247433          	and	s0,s0,s2
8000622c:	00878433          	add	s0,a5,s0
80006230:	00a4d783          	lhu	a5,10(s1)
80006234:	0017f793          	andi	a5,a5,1
80006238:	00078e63          	beqz	a5,80006254 <inet_chksum_pbuf+0xb8>
8000623c:	00841793          	slli	a5,s0,0x8
80006240:	00845413          	srli	s0,s0,0x8
80006244:	0127f7b3          	and	a5,a5,s2
80006248:	0ff47413          	andi	s0,s0,255
8000624c:	0019c993          	xori	s3,s3,1
80006250:	0087e433          	or	s0,a5,s0
80006254:	0004a483          	lw	s1,0(s1)
80006258:	f71ff06f          	j	800061c8 <inet_chksum_pbuf+0x2c>

8000625c <mem_overflow_check_raw>:
8000625c:	f5010113          	addi	sp,sp,-176
80006260:	0a812423          	sw	s0,168(sp)
80006264:	0a912223          	sw	s1,164(sp)
80006268:	0b212023          	sw	s2,160(sp)
8000626c:	09312e23          	sw	s3,156(sp)
80006270:	09412c23          	sw	s4,152(sp)
80006274:	09512a23          	sw	s5,148(sp)
80006278:	09612823          	sw	s6,144(sp)
8000627c:	09712623          	sw	s7,140(sp)
80006280:	0a112623          	sw	ra,172(sp)
80006284:	00050493          	mv	s1,a0
80006288:	00058a93          	mv	s5,a1
8000628c:	00060913          	mv	s2,a2
80006290:	00068993          	mv	s3,a3
80006294:	00000413          	li	s0,0
80006298:	0cd00b13          	li	s6,205
8000629c:	80003bb7          	lui	s7,0x80003
800062a0:	01000a13          	li	s4,16
800062a4:	008a87b3          	add	a5,s5,s0
800062a8:	00f487b3          	add	a5,s1,a5
800062ac:	0007c783          	lbu	a5,0(a5)
800062b0:	01678e63          	beq	a5,s6,800062cc <mem_overflow_check_raw+0x70>
800062b4:	00098713          	mv	a4,s3
800062b8:	00090693          	mv	a3,s2
800062bc:	b38b8613          	addi	a2,s7,-1224 # 80002b38 <_heap_end+0xffff0b38>
800062c0:	08000593          	li	a1,128
800062c4:	00010513          	mv	a0,sp
800062c8:	120080ef          	jal	ra,8000e3e8 <sniprintf>
800062cc:	00140413          	addi	s0,s0,1
800062d0:	fd441ae3          	bne	s0,s4,800062a4 <mem_overflow_check_raw+0x48>
800062d4:	ff048413          	addi	s0,s1,-16
800062d8:	0cd00a13          	li	s4,205
800062dc:	80003ab7          	lui	s5,0x80003
800062e0:	00044783          	lbu	a5,0(s0)
800062e4:	01478e63          	beq	a5,s4,80006300 <mem_overflow_check_raw+0xa4>
800062e8:	00098713          	mv	a4,s3
800062ec:	00090693          	mv	a3,s2
800062f0:	b58a8613          	addi	a2,s5,-1192 # 80002b58 <_heap_end+0xffff0b58>
800062f4:	08000593          	li	a1,128
800062f8:	00010513          	mv	a0,sp
800062fc:	0ec080ef          	jal	ra,8000e3e8 <sniprintf>
80006300:	00140413          	addi	s0,s0,1
80006304:	fc849ee3          	bne	s1,s0,800062e0 <mem_overflow_check_raw+0x84>
80006308:	0ac12083          	lw	ra,172(sp)
8000630c:	0a812403          	lw	s0,168(sp)
80006310:	0a412483          	lw	s1,164(sp)
80006314:	0a012903          	lw	s2,160(sp)
80006318:	09c12983          	lw	s3,156(sp)
8000631c:	09812a03          	lw	s4,152(sp)
80006320:	09412a83          	lw	s5,148(sp)
80006324:	09012b03          	lw	s6,144(sp)
80006328:	08c12b83          	lw	s7,140(sp)
8000632c:	0b010113          	addi	sp,sp,176
80006330:	00008067          	ret

80006334 <mem_overflow_init_raw>:
80006334:	ff010113          	addi	sp,sp,-16
80006338:	00812423          	sw	s0,8(sp)
8000633c:	00912223          	sw	s1,4(sp)
80006340:	00050413          	mv	s0,a0
80006344:	00058493          	mv	s1,a1
80006348:	01000613          	li	a2,16
8000634c:	0cd00593          	li	a1,205
80006350:	ff050513          	addi	a0,a0,-16
80006354:	00112623          	sw	ra,12(sp)
80006358:	6b4060ef          	jal	ra,8000ca0c <memset>
8000635c:	00940533          	add	a0,s0,s1
80006360:	00812403          	lw	s0,8(sp)
80006364:	00c12083          	lw	ra,12(sp)
80006368:	00412483          	lw	s1,4(sp)
8000636c:	01000613          	li	a2,16
80006370:	0cd00593          	li	a1,205
80006374:	01010113          	addi	sp,sp,16
80006378:	6940606f          	j	8000ca0c <memset>

8000637c <mem_init>:
8000637c:	00008067          	ret

80006380 <mem_trim>:
80006380:	00008067          	ret

80006384 <lwip_malloc>:
80006384:	ff010113          	addi	sp,sp,-16
80006388:	00812423          	sw	s0,8(sp)
8000638c:	00112623          	sw	ra,12(sp)
80006390:	25d070ef          	jal	ra,8000ddec <malloc>
80006394:	00050413          	mv	s0,a0
80006398:	00051663          	bnez	a0,800063a4 <lwip_malloc+0x20>
8000639c:	921fe0ef          	jal	ra,80004cbc <sys_arch_protect>
800063a0:	921fe0ef          	jal	ra,80004cc0 <sys_arch_unprotect>
800063a4:	00040513          	mv	a0,s0
800063a8:	00c12083          	lw	ra,12(sp)
800063ac:	00812403          	lw	s0,8(sp)
800063b0:	01010113          	addi	sp,sp,16
800063b4:	00008067          	ret

800063b8 <lwip_free>:
800063b8:	2450706f          	j	8000ddfc <free>

800063bc <lwip_calloc>:
800063bc:	3180706f          	j	8000d6d4 <calloc>

800063c0 <do_memp_free_pool>:
800063c0:	ff010113          	addi	sp,sp,-16
800063c4:	00112623          	sw	ra,12(sp)
800063c8:	00812423          	sw	s0,8(sp)
800063cc:	00912223          	sw	s1,4(sp)
800063d0:	01212023          	sw	s2,0(sp)
800063d4:	00058413          	mv	s0,a1
800063d8:	00050493          	mv	s1,a0
800063dc:	8e1fe0ef          	jal	ra,80004cbc <sys_arch_protect>
800063e0:	0004a683          	lw	a3,0(s1)
800063e4:	0044d583          	lhu	a1,4(s1)
800063e8:	80003637          	lui	a2,0x80003
800063ec:	00050913          	mv	s2,a0
800063f0:	b9060613          	addi	a2,a2,-1136 # 80002b90 <_heap_end+0xffff0b90>
800063f4:	00040513          	mv	a0,s0
800063f8:	e65ff0ef          	jal	ra,8000625c <mem_overflow_check_raw>
800063fc:	00090513          	mv	a0,s2
80006400:	8c1fe0ef          	jal	ra,80004cc0 <sys_arch_unprotect>
80006404:	fe440513          	addi	a0,s0,-28
80006408:	00812403          	lw	s0,8(sp)
8000640c:	00c12083          	lw	ra,12(sp)
80006410:	00412483          	lw	s1,4(sp)
80006414:	00012903          	lw	s2,0(sp)
80006418:	01010113          	addi	sp,sp,16
8000641c:	f9dff06f          	j	800063b8 <lwip_free>

80006420 <do_memp_malloc_pool_fn>:
80006420:	fe010113          	addi	sp,sp,-32
80006424:	00812c23          	sw	s0,24(sp)
80006428:	00912a23          	sw	s1,20(sp)
8000642c:	00112e23          	sw	ra,28(sp)
80006430:	01212823          	sw	s2,16(sp)
80006434:	00050493          	mv	s1,a0
80006438:	00455503          	lhu	a0,4(a0)
8000643c:	00b12623          	sw	a1,12(sp)
80006440:	00c12423          	sw	a2,8(sp)
80006444:	00350513          	addi	a0,a0,3
80006448:	ffc57513          	andi	a0,a0,-4
8000644c:	02c50513          	addi	a0,a0,44
80006450:	f35ff0ef          	jal	ra,80006384 <lwip_malloc>
80006454:	00050413          	mv	s0,a0
80006458:	865fe0ef          	jal	ra,80004cbc <sys_arch_protect>
8000645c:	02040663          	beqz	s0,80006488 <do_memp_malloc_pool_fn+0x68>
80006460:	00c12583          	lw	a1,12(sp)
80006464:	00812603          	lw	a2,8(sp)
80006468:	01c40413          	addi	s0,s0,28
8000646c:	feb42423          	sw	a1,-24(s0)
80006470:	fec42623          	sw	a2,-20(s0)
80006474:	0044d583          	lhu	a1,4(s1)
80006478:	00050913          	mv	s2,a0
8000647c:	00040513          	mv	a0,s0
80006480:	eb5ff0ef          	jal	ra,80006334 <mem_overflow_init_raw>
80006484:	00090513          	mv	a0,s2
80006488:	839fe0ef          	jal	ra,80004cc0 <sys_arch_unprotect>
8000648c:	00040513          	mv	a0,s0
80006490:	01c12083          	lw	ra,28(sp)
80006494:	01812403          	lw	s0,24(sp)
80006498:	01412483          	lw	s1,20(sp)
8000649c:	01012903          	lw	s2,16(sp)
800064a0:	02010113          	addi	sp,sp,32
800064a4:	00008067          	ret

800064a8 <memp_init_pool>:
800064a8:	00008067          	ret

800064ac <memp_init>:
800064ac:	00008067          	ret

800064b0 <memp_malloc_pool_fn>:
800064b0:	00050463          	beqz	a0,800064b8 <memp_malloc_pool_fn+0x8>
800064b4:	f6dff06f          	j	80006420 <do_memp_malloc_pool_fn>
800064b8:	00008067          	ret

800064bc <memp_malloc_fn>:
800064bc:	00500793          	li	a5,5
800064c0:	00a7ee63          	bltu	a5,a0,800064dc <memp_malloc_fn+0x20>
800064c4:	00251793          	slli	a5,a0,0x2
800064c8:	80003537          	lui	a0,0x80003
800064cc:	b7850513          	addi	a0,a0,-1160 # 80002b78 <_heap_end+0xffff0b78>
800064d0:	00f50533          	add	a0,a0,a5
800064d4:	00052503          	lw	a0,0(a0)
800064d8:	f49ff06f          	j	80006420 <do_memp_malloc_pool_fn>
800064dc:	00000513          	li	a0,0
800064e0:	00008067          	ret

800064e4 <memp_free_pool>:
800064e4:	00050663          	beqz	a0,800064f0 <memp_free_pool+0xc>
800064e8:	00058463          	beqz	a1,800064f0 <memp_free_pool+0xc>
800064ec:	ed5ff06f          	j	800063c0 <do_memp_free_pool>
800064f0:	00008067          	ret

800064f4 <memp_free>:
800064f4:	00500713          	li	a4,5
800064f8:	02a76063          	bltu	a4,a0,80006518 <memp_free+0x24>
800064fc:	00058e63          	beqz	a1,80006518 <memp_free+0x24>
80006500:	00251793          	slli	a5,a0,0x2
80006504:	80003537          	lui	a0,0x80003
80006508:	b7850513          	addi	a0,a0,-1160 # 80002b78 <_heap_end+0xffff0b78>
8000650c:	00f50533          	add	a0,a0,a5
80006510:	00052503          	lw	a0,0(a0)
80006514:	eadff06f          	j	800063c0 <do_memp_free_pool>
80006518:	00008067          	ret

8000651c <netif_null_output_ip4>:
8000651c:	ff400513          	li	a0,-12
80006520:	00008067          	ret

80006524 <netif_issue_reports>:
80006524:	03554783          	lbu	a5,53(a0)
80006528:	00500693          	li	a3,5
8000652c:	0057f613          	andi	a2,a5,5
80006530:	02d61263          	bne	a2,a3,80006554 <netif_issue_reports+0x30>
80006534:	0015f593          	andi	a1,a1,1
80006538:	00058e63          	beqz	a1,80006554 <netif_issue_reports+0x30>
8000653c:	00452683          	lw	a3,4(a0)
80006540:	00068a63          	beqz	a3,80006554 <netif_issue_reports+0x30>
80006544:	0087f793          	andi	a5,a5,8
80006548:	00078663          	beqz	a5,80006554 <netif_issue_reports+0x30>
8000654c:	00450593          	addi	a1,a0,4
80006550:	0e50406f          	j	8000ae34 <etharp_request>
80006554:	00008067          	ret

80006558 <netif_do_set_ipaddr>:
80006558:	00452783          	lw	a5,4(a0)
8000655c:	0005a703          	lw	a4,0(a1)
80006560:	08f70263          	beq	a4,a5,800065e4 <netif_do_set_ipaddr+0x8c>
80006564:	fe010113          	addi	sp,sp,-32
80006568:	00f62023          	sw	a5,0(a2)
8000656c:	00812c23          	sw	s0,24(sp)
80006570:	01212823          	sw	s2,16(sp)
80006574:	00050413          	mv	s0,a0
80006578:	00058913          	mv	s2,a1
8000657c:	00060513          	mv	a0,a2
80006580:	00c10593          	addi	a1,sp,12
80006584:	00112e23          	sw	ra,28(sp)
80006588:	00e12623          	sw	a4,12(sp)
8000658c:	00912a23          	sw	s1,20(sp)
80006590:	00060493          	mv	s1,a2
80006594:	464020ef          	jal	ra,800089f8 <udp_netif_ip_addr_changed>
80006598:	00c10593          	addi	a1,sp,12
8000659c:	00048513          	mv	a0,s1
800065a0:	0c5010ef          	jal	ra,80007e64 <raw_netif_ip_addr_changed>
800065a4:	00092783          	lw	a5,0(s2)
800065a8:	00100593          	li	a1,1
800065ac:	00040513          	mv	a0,s0
800065b0:	00f42223          	sw	a5,4(s0)
800065b4:	f71ff0ef          	jal	ra,80006524 <netif_issue_reports>
800065b8:	01c42783          	lw	a5,28(s0)
800065bc:	00078663          	beqz	a5,800065c8 <netif_do_set_ipaddr+0x70>
800065c0:	00040513          	mv	a0,s0
800065c4:	000780e7          	jalr	a5
800065c8:	01c12083          	lw	ra,28(sp)
800065cc:	01812403          	lw	s0,24(sp)
800065d0:	01412483          	lw	s1,20(sp)
800065d4:	01012903          	lw	s2,16(sp)
800065d8:	00100513          	li	a0,1
800065dc:	02010113          	addi	sp,sp,32
800065e0:	00008067          	ret
800065e4:	00000513          	li	a0,0
800065e8:	00008067          	ret

800065ec <netif_init>:
800065ec:	00008067          	ret

800065f0 <netif_input>:
800065f0:	0355c783          	lbu	a5,53(a1)
800065f4:	0187f793          	andi	a5,a5,24
800065f8:	00078463          	beqz	a5,80006600 <netif_input+0x10>
800065fc:	1d40606f          	j	8000c7d0 <ethernet_input>
80006600:	6300506f          	j	8000bc30 <ip4_input>

80006604 <netif_set_ipaddr>:
80006604:	02050463          	beqz	a0,8000662c <netif_set_ipaddr+0x28>
80006608:	fe010113          	addi	sp,sp,-32
8000660c:	00112e23          	sw	ra,28(sp)
80006610:	00059463          	bnez	a1,80006618 <netif_set_ipaddr+0x14>
80006614:	84818593          	addi	a1,gp,-1976 # 80002fe8 <ip_addr_any>
80006618:	00c10613          	addi	a2,sp,12
8000661c:	f3dff0ef          	jal	ra,80006558 <netif_do_set_ipaddr>
80006620:	01c12083          	lw	ra,28(sp)
80006624:	02010113          	addi	sp,sp,32
80006628:	00008067          	ret
8000662c:	00008067          	ret

80006630 <netif_set_netmask>:
80006630:	00050e63          	beqz	a0,8000664c <netif_set_netmask+0x1c>
80006634:	00059463          	bnez	a1,8000663c <netif_set_netmask+0xc>
80006638:	84818593          	addi	a1,gp,-1976 # 80002fe8 <ip_addr_any>
8000663c:	0005a783          	lw	a5,0(a1)
80006640:	00852703          	lw	a4,8(a0)
80006644:	00e78463          	beq	a5,a4,8000664c <netif_set_netmask+0x1c>
80006648:	00f52423          	sw	a5,8(a0)
8000664c:	00008067          	ret

80006650 <netif_set_gw>:
80006650:	00050e63          	beqz	a0,8000666c <netif_set_gw+0x1c>
80006654:	00059463          	bnez	a1,8000665c <netif_set_gw+0xc>
80006658:	84818593          	addi	a1,gp,-1976 # 80002fe8 <ip_addr_any>
8000665c:	0005a783          	lw	a5,0(a1)
80006660:	00c52703          	lw	a4,12(a0)
80006664:	00e78463          	beq	a5,a4,8000666c <netif_set_gw+0x1c>
80006668:	00f52623          	sw	a5,12(a0)
8000666c:	00008067          	ret

80006670 <netif_set_addr>:
80006670:	fd010113          	addi	sp,sp,-48
80006674:	02812423          	sw	s0,40(sp)
80006678:	02912223          	sw	s1,36(sp)
8000667c:	03212023          	sw	s2,32(sp)
80006680:	02112623          	sw	ra,44(sp)
80006684:	00050493          	mv	s1,a0
80006688:	00060913          	mv	s2,a2
8000668c:	00058413          	mv	s0,a1
80006690:	00059463          	bnez	a1,80006698 <netif_set_addr+0x28>
80006694:	84818413          	addi	s0,gp,-1976 # 80002fe8 <ip_addr_any>
80006698:	00091463          	bnez	s2,800066a0 <netif_set_addr+0x30>
8000669c:	84818913          	addi	s2,gp,-1976 # 80002fe8 <ip_addr_any>
800066a0:	00069463          	bnez	a3,800066a8 <netif_set_addr+0x38>
800066a4:	84818693          	addi	a3,gp,-1976 # 80002fe8 <ip_addr_any>
800066a8:	00042783          	lw	a5,0(s0)
800066ac:	00078663          	beqz	a5,800066b8 <netif_set_addr+0x48>
800066b0:	00000793          	li	a5,0
800066b4:	0200006f          	j	800066d4 <netif_set_addr+0x64>
800066b8:	01c10613          	addi	a2,sp,28
800066bc:	00040593          	mv	a1,s0
800066c0:	00048513          	mv	a0,s1
800066c4:	00d12623          	sw	a3,12(sp)
800066c8:	e91ff0ef          	jal	ra,80006558 <netif_do_set_ipaddr>
800066cc:	00c12683          	lw	a3,12(sp)
800066d0:	00100793          	li	a5,1
800066d4:	00092703          	lw	a4,0(s2)
800066d8:	0084a603          	lw	a2,8(s1)
800066dc:	00c70463          	beq	a4,a2,800066e4 <netif_set_addr+0x74>
800066e0:	00e4a423          	sw	a4,8(s1)
800066e4:	0006a703          	lw	a4,0(a3)
800066e8:	00c4a683          	lw	a3,12(s1)
800066ec:	00d70463          	beq	a4,a3,800066f4 <netif_set_addr+0x84>
800066f0:	00e4a623          	sw	a4,12(s1)
800066f4:	00079a63          	bnez	a5,80006708 <netif_set_addr+0x98>
800066f8:	01c10613          	addi	a2,sp,28
800066fc:	00040593          	mv	a1,s0
80006700:	00048513          	mv	a0,s1
80006704:	e55ff0ef          	jal	ra,80006558 <netif_do_set_ipaddr>
80006708:	02c12083          	lw	ra,44(sp)
8000670c:	02812403          	lw	s0,40(sp)
80006710:	02412483          	lw	s1,36(sp)
80006714:	02012903          	lw	s2,32(sp)
80006718:	03010113          	addi	sp,sp,48
8000671c:	00008067          	ret

80006720 <netif_add>:
80006720:	fe010113          	addi	sp,sp,-32
80006724:	00112e23          	sw	ra,28(sp)
80006728:	00812c23          	sw	s0,24(sp)
8000672c:	00912a23          	sw	s1,20(sp)
80006730:	02051063          	bnez	a0,80006750 <netif_add+0x30>
80006734:	00000413          	li	s0,0
80006738:	00040513          	mv	a0,s0
8000673c:	01c12083          	lw	ra,28(sp)
80006740:	01812403          	lw	s0,24(sp)
80006744:	01412483          	lw	s1,20(sp)
80006748:	02010113          	addi	sp,sp,32
8000674c:	00008067          	ret
80006750:	fe0782e3          	beqz	a5,80006734 <netif_add+0x14>
80006754:	00050413          	mv	s0,a0
80006758:	00059463          	bnez	a1,80006760 <netif_add+0x40>
8000675c:	84818593          	addi	a1,gp,-1976 # 80002fe8 <ip_addr_any>
80006760:	00061463          	bnez	a2,80006768 <netif_add+0x48>
80006764:	84818613          	addi	a2,gp,-1976 # 80002fe8 <ip_addr_any>
80006768:	00069463          	bnez	a3,80006770 <netif_add+0x50>
8000676c:	84818693          	addi	a3,gp,-1976 # 80002fe8 <ip_addr_any>
80006770:	02e42223          	sw	a4,36(s0)
80006774:	8c41c703          	lbu	a4,-1852(gp) # 80003064 <netif_num>
80006778:	80006537          	lui	a0,0x80006
8000677c:	51c50513          	addi	a0,a0,1308 # 8000651c <_heap_end+0xffff451c>
80006780:	00a42a23          	sw	a0,20(s0)
80006784:	00042223          	sw	zero,4(s0)
80006788:	00040513          	mv	a0,s0
8000678c:	00042423          	sw	zero,8(s0)
80006790:	00042623          	sw	zero,12(s0)
80006794:	02041623          	sh	zero,44(s0)
80006798:	02040aa3          	sb	zero,53(s0)
8000679c:	02040423          	sb	zero,40(s0)
800067a0:	020404a3          	sb	zero,41(s0)
800067a4:	02040523          	sb	zero,42(s0)
800067a8:	020405a3          	sb	zero,43(s0)
800067ac:	00042e23          	sw	zero,28(s0)
800067b0:	02042023          	sw	zero,32(s0)
800067b4:	02e40c23          	sb	a4,56(s0)
800067b8:	01042823          	sw	a6,16(s0)
800067bc:	02042e23          	sw	zero,60(s0)
800067c0:	00f12623          	sw	a5,12(sp)
800067c4:	eadff0ef          	jal	ra,80006670 <netif_set_addr>
800067c8:	00c12783          	lw	a5,12(sp)
800067cc:	00040513          	mv	a0,s0
800067d0:	000780e7          	jalr	a5
800067d4:	f60510e3          	bnez	a0,80006734 <netif_add+0x14>
800067d8:	8cc1a603          	lw	a2,-1844(gp) # 8000306c <netif_list>
800067dc:	00078713          	mv	a4,a5
800067e0:	0ff00593          	li	a1,255
800067e4:	03844783          	lbu	a5,56(s0)
800067e8:	00b79463          	bne	a5,a1,800067f0 <netif_add+0xd0>
800067ec:	02040c23          	sb	zero,56(s0)
800067f0:	03844783          	lbu	a5,56(s0)
800067f4:	00060693          	mv	a3,a2
800067f8:	02069463          	bnez	a3,80006820 <netif_add+0x100>
800067fc:	0fe00593          	li	a1,254
80006800:	00000693          	li	a3,0
80006804:	00b78663          	beq	a5,a1,80006810 <netif_add+0xf0>
80006808:	00178793          	addi	a5,a5,1
8000680c:	0ff7f693          	andi	a3,a5,255
80006810:	00c42023          	sw	a2,0(s0)
80006814:	8cd18223          	sb	a3,-1852(gp) # 80003064 <netif_num>
80006818:	8c81a623          	sw	s0,-1844(gp) # 8000306c <netif_list>
8000681c:	f1dff06f          	j	80006738 <netif_add+0x18>
80006820:	0386c503          	lbu	a0,56(a3)
80006824:	00f51863          	bne	a0,a5,80006834 <netif_add+0x114>
80006828:	00178793          	addi	a5,a5,1
8000682c:	02f40c23          	sb	a5,56(s0)
80006830:	fb5ff06f          	j	800067e4 <netif_add+0xc4>
80006834:	0006a683          	lw	a3,0(a3)
80006838:	fc1ff06f          	j	800067f8 <netif_add+0xd8>

8000683c <netif_add_noaddr>:
8000683c:	00068813          	mv	a6,a3
80006840:	00060793          	mv	a5,a2
80006844:	00058713          	mv	a4,a1
80006848:	00000693          	li	a3,0
8000684c:	00000613          	li	a2,0
80006850:	00000593          	li	a1,0
80006854:	ecdff06f          	j	80006720 <netif_add>

80006858 <netif_set_default>:
80006858:	8ca1a423          	sw	a0,-1848(gp) # 80003068 <netif_default>
8000685c:	00008067          	ret

80006860 <netif_set_up>:
80006860:	04050e63          	beqz	a0,800068bc <netif_set_up+0x5c>
80006864:	ff010113          	addi	sp,sp,-16
80006868:	00812423          	sw	s0,8(sp)
8000686c:	00112623          	sw	ra,12(sp)
80006870:	03554783          	lbu	a5,53(a0)
80006874:	00050413          	mv	s0,a0
80006878:	0017f713          	andi	a4,a5,1
8000687c:	02071863          	bnez	a4,800068ac <netif_set_up+0x4c>
80006880:	0017e793          	ori	a5,a5,1
80006884:	02f50aa3          	sb	a5,53(a0)
80006888:	01c52783          	lw	a5,28(a0)
8000688c:	00078463          	beqz	a5,80006894 <netif_set_up+0x34>
80006890:	000780e7          	jalr	a5
80006894:	00040513          	mv	a0,s0
80006898:	00812403          	lw	s0,8(sp)
8000689c:	00c12083          	lw	ra,12(sp)
800068a0:	00300593          	li	a1,3
800068a4:	01010113          	addi	sp,sp,16
800068a8:	c7dff06f          	j	80006524 <netif_issue_reports>
800068ac:	00c12083          	lw	ra,12(sp)
800068b0:	00812403          	lw	s0,8(sp)
800068b4:	01010113          	addi	sp,sp,16
800068b8:	00008067          	ret
800068bc:	00008067          	ret

800068c0 <netif_set_down>:
800068c0:	06050063          	beqz	a0,80006920 <netif_set_down+0x60>
800068c4:	ff010113          	addi	sp,sp,-16
800068c8:	00812423          	sw	s0,8(sp)
800068cc:	00112623          	sw	ra,12(sp)
800068d0:	03554783          	lbu	a5,53(a0)
800068d4:	00050413          	mv	s0,a0
800068d8:	0017f713          	andi	a4,a5,1
800068dc:	02070a63          	beqz	a4,80006910 <netif_set_down+0x50>
800068e0:	ffe7f713          	andi	a4,a5,-2
800068e4:	02e50aa3          	sb	a4,53(a0)
800068e8:	0087f793          	andi	a5,a5,8
800068ec:	00078463          	beqz	a5,800068f4 <netif_set_down+0x34>
800068f0:	1cc040ef          	jal	ra,8000aabc <etharp_cleanup_netif>
800068f4:	01c42303          	lw	t1,28(s0)
800068f8:	00030c63          	beqz	t1,80006910 <netif_set_down+0x50>
800068fc:	00040513          	mv	a0,s0
80006900:	00812403          	lw	s0,8(sp)
80006904:	00c12083          	lw	ra,12(sp)
80006908:	01010113          	addi	sp,sp,16
8000690c:	00030067          	jr	t1
80006910:	00c12083          	lw	ra,12(sp)
80006914:	00812403          	lw	s0,8(sp)
80006918:	01010113          	addi	sp,sp,16
8000691c:	00008067          	ret
80006920:	00008067          	ret

80006924 <netif_remove>:
80006924:	08050e63          	beqz	a0,800069c0 <netif_remove+0x9c>
80006928:	ff010113          	addi	sp,sp,-16
8000692c:	00812423          	sw	s0,8(sp)
80006930:	00112623          	sw	ra,12(sp)
80006934:	00912223          	sw	s1,4(sp)
80006938:	00452783          	lw	a5,4(a0)
8000693c:	00050413          	mv	s0,a0
80006940:	02078063          	beqz	a5,80006960 <netif_remove+0x3c>
80006944:	00450493          	addi	s1,a0,4
80006948:	00000593          	li	a1,0
8000694c:	00048513          	mv	a0,s1
80006950:	0a8020ef          	jal	ra,800089f8 <udp_netif_ip_addr_changed>
80006954:	00000593          	li	a1,0
80006958:	00048513          	mv	a0,s1
8000695c:	508010ef          	jal	ra,80007e64 <raw_netif_ip_addr_changed>
80006960:	03544783          	lbu	a5,53(s0)
80006964:	0017f793          	andi	a5,a5,1
80006968:	00078663          	beqz	a5,80006974 <netif_remove+0x50>
8000696c:	00040513          	mv	a0,s0
80006970:	f51ff0ef          	jal	ra,800068c0 <netif_set_down>
80006974:	8c81a703          	lw	a4,-1848(gp) # 80003068 <netif_default>
80006978:	00871463          	bne	a4,s0,80006980 <netif_remove+0x5c>
8000697c:	8c01a423          	sw	zero,-1848(gp) # 80003068 <netif_default>
80006980:	8cc1a783          	lw	a5,-1844(gp) # 8000306c <netif_list>
80006984:	02879263          	bne	a5,s0,800069a8 <netif_remove+0x84>
80006988:	00042783          	lw	a5,0(s0)
8000698c:	8cf1a623          	sw	a5,-1844(gp) # 8000306c <netif_list>
80006990:	00c12083          	lw	ra,12(sp)
80006994:	00812403          	lw	s0,8(sp)
80006998:	00412483          	lw	s1,4(sp)
8000699c:	01010113          	addi	sp,sp,16
800069a0:	00008067          	ret
800069a4:	00070793          	mv	a5,a4
800069a8:	fe0784e3          	beqz	a5,80006990 <netif_remove+0x6c>
800069ac:	0007a703          	lw	a4,0(a5)
800069b0:	fe871ae3          	bne	a4,s0,800069a4 <netif_remove+0x80>
800069b4:	00042703          	lw	a4,0(s0)
800069b8:	00e7a023          	sw	a4,0(a5)
800069bc:	fd5ff06f          	j	80006990 <netif_remove+0x6c>
800069c0:	00008067          	ret

800069c4 <netif_set_status_callback>:
800069c4:	00050463          	beqz	a0,800069cc <netif_set_status_callback+0x8>
800069c8:	00b52e23          	sw	a1,28(a0)
800069cc:	00008067          	ret

800069d0 <netif_set_link_up>:
800069d0:	06050263          	beqz	a0,80006a34 <netif_set_link_up+0x64>
800069d4:	ff010113          	addi	sp,sp,-16
800069d8:	00812423          	sw	s0,8(sp)
800069dc:	00112623          	sw	ra,12(sp)
800069e0:	03554783          	lbu	a5,53(a0)
800069e4:	00050413          	mv	s0,a0
800069e8:	0047f713          	andi	a4,a5,4
800069ec:	02071c63          	bnez	a4,80006a24 <netif_set_link_up+0x54>
800069f0:	0047e793          	ori	a5,a5,4
800069f4:	02f50aa3          	sb	a5,53(a0)
800069f8:	3c8030ef          	jal	ra,80009dc0 <dhcp_network_changed>
800069fc:	00300593          	li	a1,3
80006a00:	00040513          	mv	a0,s0
80006a04:	b21ff0ef          	jal	ra,80006524 <netif_issue_reports>
80006a08:	02042303          	lw	t1,32(s0)
80006a0c:	00030c63          	beqz	t1,80006a24 <netif_set_link_up+0x54>
80006a10:	00040513          	mv	a0,s0
80006a14:	00812403          	lw	s0,8(sp)
80006a18:	00c12083          	lw	ra,12(sp)
80006a1c:	01010113          	addi	sp,sp,16
80006a20:	00030067          	jr	t1
80006a24:	00c12083          	lw	ra,12(sp)
80006a28:	00812403          	lw	s0,8(sp)
80006a2c:	01010113          	addi	sp,sp,16
80006a30:	00008067          	ret
80006a34:	00008067          	ret

80006a38 <netif_set_link_down>:
80006a38:	02050263          	beqz	a0,80006a5c <netif_set_link_down+0x24>
80006a3c:	03554703          	lbu	a4,53(a0)
80006a40:	00477693          	andi	a3,a4,4
80006a44:	00068c63          	beqz	a3,80006a5c <netif_set_link_down+0x24>
80006a48:	02052303          	lw	t1,32(a0)
80006a4c:	ffb77713          	andi	a4,a4,-5
80006a50:	02e50aa3          	sb	a4,53(a0)
80006a54:	00030463          	beqz	t1,80006a5c <netif_set_link_down+0x24>
80006a58:	00030067          	jr	t1
80006a5c:	00008067          	ret

80006a60 <netif_set_link_callback>:
80006a60:	00050463          	beqz	a0,80006a68 <netif_set_link_callback+0x8>
80006a64:	02b52023          	sw	a1,32(a0)
80006a68:	00008067          	ret

80006a6c <netif_get_by_index>:
80006a6c:	00000793          	li	a5,0
80006a70:	00050663          	beqz	a0,80006a7c <netif_get_by_index+0x10>
80006a74:	8cc1a783          	lw	a5,-1844(gp) # 8000306c <netif_list>
80006a78:	00079663          	bnez	a5,80006a84 <netif_get_by_index+0x18>
80006a7c:	00078513          	mv	a0,a5
80006a80:	00008067          	ret
80006a84:	0387c703          	lbu	a4,56(a5)
80006a88:	00170713          	addi	a4,a4,1
80006a8c:	0ff77713          	andi	a4,a4,255
80006a90:	fea706e3          	beq	a4,a0,80006a7c <netif_get_by_index+0x10>
80006a94:	0007a783          	lw	a5,0(a5)
80006a98:	fe1ff06f          	j	80006a78 <netif_get_by_index+0xc>

80006a9c <netif_index_to_name>:
80006a9c:	ff010113          	addi	sp,sp,-16
80006aa0:	00812423          	sw	s0,8(sp)
80006aa4:	00912223          	sw	s1,4(sp)
80006aa8:	00112623          	sw	ra,12(sp)
80006aac:	00050493          	mv	s1,a0
80006ab0:	00058413          	mv	s0,a1
80006ab4:	fb9ff0ef          	jal	ra,80006a6c <netif_get_by_index>
80006ab8:	02050463          	beqz	a0,80006ae0 <netif_index_to_name+0x44>
80006abc:	03654783          	lbu	a5,54(a0)
80006ac0:	fff48613          	addi	a2,s1,-1
80006ac4:	00400593          	li	a1,4
80006ac8:	00f40023          	sb	a5,0(s0)
80006acc:	03754783          	lbu	a5,55(a0)
80006ad0:	00240513          	addi	a0,s0,2
80006ad4:	00f400a3          	sb	a5,1(s0)
80006ad8:	a20ff0ef          	jal	ra,80005cf8 <lwip_itoa>
80006adc:	00040513          	mv	a0,s0
80006ae0:	00c12083          	lw	ra,12(sp)
80006ae4:	00812403          	lw	s0,8(sp)
80006ae8:	00412483          	lw	s1,4(sp)
80006aec:	01010113          	addi	sp,sp,16
80006af0:	00008067          	ret

80006af4 <netif_find>:
80006af4:	00051663          	bnez	a0,80006b00 <netif_find+0xc>
80006af8:	00000513          	li	a0,0
80006afc:	00008067          	ret
80006b00:	ff010113          	addi	sp,sp,-16
80006b04:	00812423          	sw	s0,8(sp)
80006b08:	00050413          	mv	s0,a0
80006b0c:	00250513          	addi	a0,a0,2
80006b10:	00112623          	sw	ra,12(sp)
80006b14:	3a9060ef          	jal	ra,8000d6bc <atoi>
80006b18:	0ff57793          	andi	a5,a0,255
80006b1c:	8cc1a503          	lw	a0,-1844(gp) # 8000306c <netif_list>
80006b20:	00051c63          	bnez	a0,80006b38 <netif_find+0x44>
80006b24:	00000513          	li	a0,0
80006b28:	00c12083          	lw	ra,12(sp)
80006b2c:	00812403          	lw	s0,8(sp)
80006b30:	01010113          	addi	sp,sp,16
80006b34:	00008067          	ret
80006b38:	03854703          	lbu	a4,56(a0)
80006b3c:	00f71e63          	bne	a4,a5,80006b58 <netif_find+0x64>
80006b40:	00044683          	lbu	a3,0(s0)
80006b44:	03654703          	lbu	a4,54(a0)
80006b48:	00e69863          	bne	a3,a4,80006b58 <netif_find+0x64>
80006b4c:	00144683          	lbu	a3,1(s0)
80006b50:	03754703          	lbu	a4,55(a0)
80006b54:	fce68ae3          	beq	a3,a4,80006b28 <netif_find+0x34>
80006b58:	00052503          	lw	a0,0(a0)
80006b5c:	fc5ff06f          	j	80006b20 <netif_find+0x2c>

80006b60 <netif_name_to_index>:
80006b60:	ff010113          	addi	sp,sp,-16
80006b64:	00112623          	sw	ra,12(sp)
80006b68:	f8dff0ef          	jal	ra,80006af4 <netif_find>
80006b6c:	00050e63          	beqz	a0,80006b88 <netif_name_to_index+0x28>
80006b70:	03854503          	lbu	a0,56(a0)
80006b74:	00150513          	addi	a0,a0,1
80006b78:	0ff57513          	andi	a0,a0,255
80006b7c:	00c12083          	lw	ra,12(sp)
80006b80:	01010113          	addi	sp,sp,16
80006b84:	00008067          	ret
80006b88:	00000513          	li	a0,0
80006b8c:	ff1ff06f          	j	80006b7c <netif_name_to_index+0x1c>

80006b90 <pbuf_skip_const>:
80006b90:	00050663          	beqz	a0,80006b9c <pbuf_skip_const+0xc>
80006b94:	00a55783          	lhu	a5,10(a0)
80006b98:	00f5f863          	bgeu	a1,a5,80006ba8 <pbuf_skip_const+0x18>
80006b9c:	00060463          	beqz	a2,80006ba4 <pbuf_skip_const+0x14>
80006ba0:	00b61023          	sh	a1,0(a2)
80006ba4:	00008067          	ret
80006ba8:	40f585b3          	sub	a1,a1,a5
80006bac:	01059593          	slli	a1,a1,0x10
80006bb0:	0105d593          	srli	a1,a1,0x10
80006bb4:	00052503          	lw	a0,0(a0)
80006bb8:	fd9ff06f          	j	80006b90 <pbuf_skip_const>

80006bbc <pbuf_add_header_impl>:
80006bbc:	00050793          	mv	a5,a0
80006bc0:	08050263          	beqz	a0,80006c44 <pbuf_add_header_impl+0x88>
80006bc4:	00010737          	lui	a4,0x10
80006bc8:	00100513          	li	a0,1
80006bcc:	06e5fe63          	bgeu	a1,a4,80006c48 <pbuf_add_header_impl+0x8c>
80006bd0:	00000513          	li	a0,0
80006bd4:	06058a63          	beqz	a1,80006c48 <pbuf_add_header_impl+0x8c>
80006bd8:	0087d703          	lhu	a4,8(a5)
80006bdc:	01059693          	slli	a3,a1,0x10
80006be0:	0106d693          	srli	a3,a3,0x10
80006be4:	00e68733          	add	a4,a3,a4
80006be8:	01071713          	slli	a4,a4,0x10
80006bec:	01075713          	srli	a4,a4,0x10
80006bf0:	00100513          	li	a0,1
80006bf4:	04d76a63          	bltu	a4,a3,80006c48 <pbuf_add_header_impl+0x8c>
80006bf8:	00c78503          	lb	a0,12(a5)
80006bfc:	00055e63          	bgez	a0,80006c18 <pbuf_add_header_impl+0x5c>
80006c00:	0047a603          	lw	a2,4(a5)
80006c04:	00100513          	li	a0,1
80006c08:	40b605b3          	sub	a1,a2,a1
80006c0c:	01078613          	addi	a2,a5,16
80006c10:	00c5fc63          	bgeu	a1,a2,80006c28 <pbuf_add_header_impl+0x6c>
80006c14:	00008067          	ret
80006c18:	00100513          	li	a0,1
80006c1c:	02060663          	beqz	a2,80006c48 <pbuf_add_header_impl+0x8c>
80006c20:	0047a603          	lw	a2,4(a5)
80006c24:	40b605b3          	sub	a1,a2,a1
80006c28:	00a7d603          	lhu	a2,10(a5)
80006c2c:	00b7a223          	sw	a1,4(a5)
80006c30:	00e79423          	sh	a4,8(a5)
80006c34:	00c686b3          	add	a3,a3,a2
80006c38:	00d79523          	sh	a3,10(a5)
80006c3c:	00000513          	li	a0,0
80006c40:	00008067          	ret
80006c44:	00100513          	li	a0,1
80006c48:	00008067          	ret

80006c4c <pbuf_alloc_reference>:
80006c4c:	ff010113          	addi	sp,sp,-16
80006c50:	00812423          	sw	s0,8(sp)
80006c54:	00058413          	mv	s0,a1
80006c58:	800035b7          	lui	a1,0x80003
80006c5c:	00912223          	sw	s1,4(sp)
80006c60:	01212023          	sw	s2,0(sp)
80006c64:	00060493          	mv	s1,a2
80006c68:	00050913          	mv	s2,a0
80006c6c:	14c00613          	li	a2,332
80006c70:	bdc58593          	addi	a1,a1,-1060 # 80002bdc <_heap_end+0xffff0bdc>
80006c74:	00400513          	li	a0,4
80006c78:	00112623          	sw	ra,12(sp)
80006c7c:	841ff0ef          	jal	ra,800064bc <memp_malloc_fn>
80006c80:	02050263          	beqz	a0,80006ca4 <pbuf_alloc_reference+0x58>
80006c84:	00100793          	li	a5,1
80006c88:	00052023          	sw	zero,0(a0)
80006c8c:	01252223          	sw	s2,4(a0)
80006c90:	00851423          	sh	s0,8(a0)
80006c94:	00851523          	sh	s0,10(a0)
80006c98:	00950623          	sb	s1,12(a0)
80006c9c:	000506a3          	sb	zero,13(a0)
80006ca0:	00f51723          	sh	a5,14(a0)
80006ca4:	00c12083          	lw	ra,12(sp)
80006ca8:	00812403          	lw	s0,8(sp)
80006cac:	00412483          	lw	s1,4(sp)
80006cb0:	00012903          	lw	s2,0(sp)
80006cb4:	01010113          	addi	sp,sp,16
80006cb8:	00008067          	ret

80006cbc <pbuf_alloced_custom>:
80006cbc:	01051513          	slli	a0,a0,0x10
80006cc0:	01055513          	srli	a0,a0,0x10
80006cc4:	00350513          	addi	a0,a0,3
80006cc8:	ffc57513          	andi	a0,a0,-4
80006ccc:	00a58833          	add	a6,a1,a0
80006cd0:	0307ec63          	bltu	a5,a6,80006d08 <pbuf_alloced_custom+0x4c>
80006cd4:	00070463          	beqz	a4,80006cdc <pbuf_alloced_custom+0x20>
80006cd8:	00a70733          	add	a4,a4,a0
80006cdc:	00200793          	li	a5,2
80006ce0:	00f686a3          	sb	a5,13(a3)
80006ce4:	00100793          	li	a5,1
80006ce8:	00068513          	mv	a0,a3
80006cec:	0006a023          	sw	zero,0(a3)
80006cf0:	00e6a223          	sw	a4,4(a3)
80006cf4:	00b69423          	sh	a1,8(a3)
80006cf8:	00b69523          	sh	a1,10(a3)
80006cfc:	00c68623          	sb	a2,12(a3)
80006d00:	00f69723          	sh	a5,14(a3)
80006d04:	00008067          	ret
80006d08:	00000513          	li	a0,0
80006d0c:	00008067          	ret

80006d10 <pbuf_add_header>:
80006d10:	00000613          	li	a2,0
80006d14:	ea9ff06f          	j	80006bbc <pbuf_add_header_impl>

80006d18 <pbuf_add_header_force>:
80006d18:	00100613          	li	a2,1
80006d1c:	ea1ff06f          	j	80006bbc <pbuf_add_header_impl>

80006d20 <pbuf_remove_header>:
80006d20:	00050793          	mv	a5,a0
80006d24:	04050a63          	beqz	a0,80006d78 <pbuf_remove_header+0x58>
80006d28:	00010737          	lui	a4,0x10
80006d2c:	00100513          	li	a0,1
80006d30:	04e5f663          	bgeu	a1,a4,80006d7c <pbuf_remove_header+0x5c>
80006d34:	00000513          	li	a0,0
80006d38:	04058263          	beqz	a1,80006d7c <pbuf_remove_header+0x5c>
80006d3c:	00a7d703          	lhu	a4,10(a5)
80006d40:	01059693          	slli	a3,a1,0x10
80006d44:	0106d693          	srli	a3,a3,0x10
80006d48:	00100513          	li	a0,1
80006d4c:	02d76863          	bltu	a4,a3,80006d7c <pbuf_remove_header+0x5c>
80006d50:	40d70733          	sub	a4,a4,a3
80006d54:	0047a603          	lw	a2,4(a5)
80006d58:	00e79523          	sh	a4,10(a5)
80006d5c:	0087d703          	lhu	a4,8(a5)
80006d60:	00b605b3          	add	a1,a2,a1
80006d64:	00b7a223          	sw	a1,4(a5)
80006d68:	40d70733          	sub	a4,a4,a3
80006d6c:	00e79423          	sh	a4,8(a5)
80006d70:	00000513          	li	a0,0
80006d74:	00008067          	ret
80006d78:	00100513          	li	a0,1
80006d7c:	00008067          	ret

80006d80 <pbuf_header>:
80006d80:	0005d663          	bgez	a1,80006d8c <pbuf_header+0xc>
80006d84:	40b005b3          	neg	a1,a1
80006d88:	f99ff06f          	j	80006d20 <pbuf_remove_header>
80006d8c:	00000613          	li	a2,0
80006d90:	e2dff06f          	j	80006bbc <pbuf_add_header_impl>

80006d94 <pbuf_header_force>:
80006d94:	0005d663          	bgez	a1,80006da0 <pbuf_header_force+0xc>
80006d98:	40b005b3          	neg	a1,a1
80006d9c:	f85ff06f          	j	80006d20 <pbuf_remove_header>
80006da0:	00100613          	li	a2,1
80006da4:	e19ff06f          	j	80006bbc <pbuf_add_header_impl>

80006da8 <pbuf_free>:
80006da8:	fd010113          	addi	sp,sp,-48
80006dac:	02812423          	sw	s0,40(sp)
80006db0:	02112623          	sw	ra,44(sp)
80006db4:	02912223          	sw	s1,36(sp)
80006db8:	03212023          	sw	s2,32(sp)
80006dbc:	01312e23          	sw	s3,28(sp)
80006dc0:	00000413          	li	s0,0
80006dc4:	06050463          	beqz	a0,80006e2c <pbuf_free+0x84>
80006dc8:	00050593          	mv	a1,a0
80006dcc:	00000413          	li	s0,0
80006dd0:	00200913          	li	s2,2
80006dd4:	00100993          	li	s3,1
80006dd8:	00b12623          	sw	a1,12(sp)
80006ddc:	ee1fd0ef          	jal	ra,80004cbc <sys_arch_protect>
80006de0:	00c12583          	lw	a1,12(sp)
80006de4:	00e5c483          	lbu	s1,14(a1)
80006de8:	fff48493          	addi	s1,s1,-1
80006dec:	0ff4f493          	andi	s1,s1,255
80006df0:	00958723          	sb	s1,14(a1)
80006df4:	ecdfd0ef          	jal	ra,80004cc0 <sys_arch_unprotect>
80006df8:	02049a63          	bnez	s1,80006e2c <pbuf_free+0x84>
80006dfc:	00c12583          	lw	a1,12(sp)
80006e00:	00d5c783          	lbu	a5,13(a1)
80006e04:	0005a483          	lw	s1,0(a1)
80006e08:	0027f793          	andi	a5,a5,2
80006e0c:	04078063          	beqz	a5,80006e4c <pbuf_free+0xa4>
80006e10:	0105a783          	lw	a5,16(a1)
80006e14:	00058513          	mv	a0,a1
80006e18:	000780e7          	jalr	a5
80006e1c:	00140413          	addi	s0,s0,1
80006e20:	0ff47413          	andi	s0,s0,255
80006e24:	00048593          	mv	a1,s1
80006e28:	fa0498e3          	bnez	s1,80006dd8 <pbuf_free+0x30>
80006e2c:	00040513          	mv	a0,s0
80006e30:	02c12083          	lw	ra,44(sp)
80006e34:	02812403          	lw	s0,40(sp)
80006e38:	02412483          	lw	s1,36(sp)
80006e3c:	02012903          	lw	s2,32(sp)
80006e40:	01c12983          	lw	s3,28(sp)
80006e44:	03010113          	addi	sp,sp,48
80006e48:	00008067          	ret
80006e4c:	00c5c783          	lbu	a5,12(a1)
80006e50:	00500513          	li	a0,5
80006e54:	00f7f793          	andi	a5,a5,15
80006e58:	01278663          	beq	a5,s2,80006e64 <pbuf_free+0xbc>
80006e5c:	01379863          	bne	a5,s3,80006e6c <pbuf_free+0xc4>
80006e60:	00400513          	li	a0,4
80006e64:	e90ff0ef          	jal	ra,800064f4 <memp_free>
80006e68:	fb5ff06f          	j	80006e1c <pbuf_free+0x74>
80006e6c:	fa0798e3          	bnez	a5,80006e1c <pbuf_free+0x74>
80006e70:	00058513          	mv	a0,a1
80006e74:	d44ff0ef          	jal	ra,800063b8 <lwip_free>
80006e78:	fa5ff06f          	j	80006e1c <pbuf_free+0x74>

80006e7c <pbuf_alloc>:
80006e7c:	fe010113          	addi	sp,sp,-32
80006e80:	01212823          	sw	s2,16(sp)
80006e84:	00112e23          	sw	ra,28(sp)
80006e88:	00812c23          	sw	s0,24(sp)
80006e8c:	00912a23          	sw	s1,20(sp)
80006e90:	01312623          	sw	s3,12(sp)
80006e94:	01412423          	sw	s4,8(sp)
80006e98:	01512223          	sw	s5,4(sp)
80006e9c:	01612023          	sw	s6,0(sp)
80006ea0:	04100793          	li	a5,65
80006ea4:	00058913          	mv	s2,a1
80006ea8:	0cf60263          	beq	a2,a5,80006f6c <pbuf_alloc+0xf0>
80006eac:	02c7ee63          	bltu	a5,a2,80006ee8 <pbuf_alloc+0x6c>
80006eb0:	00100793          	li	a5,1
80006eb4:	0af60c63          	beq	a2,a5,80006f6c <pbuf_alloc+0xf0>
80006eb8:	00000493          	li	s1,0
80006ebc:	01c12083          	lw	ra,28(sp)
80006ec0:	01812403          	lw	s0,24(sp)
80006ec4:	00048513          	mv	a0,s1
80006ec8:	01012903          	lw	s2,16(sp)
80006ecc:	01412483          	lw	s1,20(sp)
80006ed0:	00c12983          	lw	s3,12(sp)
80006ed4:	00812a03          	lw	s4,8(sp)
80006ed8:	00412a83          	lw	s5,4(sp)
80006edc:	00012b03          	lw	s6,0(sp)
80006ee0:	02010113          	addi	sp,sp,32
80006ee4:	00008067          	ret
80006ee8:	01051413          	slli	s0,a0,0x10
80006eec:	18200793          	li	a5,386
80006ef0:	01045413          	srli	s0,s0,0x10
80006ef4:	0af60463          	beq	a2,a5,80006f9c <pbuf_alloc+0x120>
80006ef8:	28000793          	li	a5,640
80006efc:	faf61ee3          	bne	a2,a5,80006eb8 <pbuf_alloc+0x3c>
80006f00:	00340413          	addi	s0,s0,3
80006f04:	00358793          	addi	a5,a1,3
80006f08:	ffc47413          	andi	s0,s0,-4
80006f0c:	ffc7f793          	andi	a5,a5,-4
80006f10:	00f40433          	add	s0,s0,a5
80006f14:	01041413          	slli	s0,s0,0x10
80006f18:	01045413          	srli	s0,s0,0x10
80006f1c:	00050993          	mv	s3,a0
80006f20:	01040513          	addi	a0,s0,16
80006f24:	f8f46ae3          	bltu	s0,a5,80006eb8 <pbuf_alloc+0x3c>
80006f28:	f8f568e3          	bltu	a0,a5,80006eb8 <pbuf_alloc+0x3c>
80006f2c:	c58ff0ef          	jal	ra,80006384 <lwip_malloc>
80006f30:	00050493          	mv	s1,a0
80006f34:	f80504e3          	beqz	a0,80006ebc <pbuf_alloc+0x40>
80006f38:	01099993          	slli	s3,s3,0x10
80006f3c:	0109d993          	srli	s3,s3,0x10
80006f40:	013509b3          	add	s3,a0,s3
80006f44:	01398993          	addi	s3,s3,19
80006f48:	000107b7          	lui	a5,0x10
80006f4c:	ffc9f993          	andi	s3,s3,-4
80006f50:	08078793          	addi	a5,a5,128 # 10080 <_stack_size+0xf880>
80006f54:	00052023          	sw	zero,0(a0)
80006f58:	01352223          	sw	s3,4(a0)
80006f5c:	01251423          	sh	s2,8(a0)
80006f60:	01251523          	sh	s2,10(a0)
80006f64:	00f52623          	sw	a5,12(a0)
80006f68:	f55ff06f          	j	80006ebc <pbuf_alloc+0x40>
80006f6c:	01812403          	lw	s0,24(sp)
80006f70:	01c12083          	lw	ra,28(sp)
80006f74:	01412483          	lw	s1,20(sp)
80006f78:	00c12983          	lw	s3,12(sp)
80006f7c:	00812a03          	lw	s4,8(sp)
80006f80:	00412a83          	lw	s5,4(sp)
80006f84:	00012b03          	lw	s6,0(sp)
80006f88:	00090593          	mv	a1,s2
80006f8c:	01012903          	lw	s2,16(sp)
80006f90:	00000513          	li	a0,0
80006f94:	02010113          	addi	sp,sp,32
80006f98:	cb5ff06f          	j	80006c4c <pbuf_alloc_reference>
80006f9c:	000109b7          	lui	s3,0x10
80006fa0:	00000a13          	li	s4,0
80006fa4:	00000493          	li	s1,0
80006fa8:	80003ab7          	lui	s5,0x80003
80006fac:	5ec00b13          	li	s6,1516
80006fb0:	08298993          	addi	s3,s3,130 # 10082 <_stack_size+0xf882>
80006fb4:	0f300613          	li	a2,243
80006fb8:	bdca8593          	addi	a1,s5,-1060 # 80002bdc <_heap_end+0xffff0bdc>
80006fbc:	00500513          	li	a0,5
80006fc0:	cfcff0ef          	jal	ra,800064bc <memp_malloc_fn>
80006fc4:	00051a63          	bnez	a0,80006fd8 <pbuf_alloc+0x15c>
80006fc8:	ee0488e3          	beqz	s1,80006eb8 <pbuf_alloc+0x3c>
80006fcc:	00048513          	mv	a0,s1
80006fd0:	dd9ff0ef          	jal	ra,80006da8 <pbuf_free>
80006fd4:	ee5ff06f          	j	80006eb8 <pbuf_alloc+0x3c>
80006fd8:	00340793          	addi	a5,s0,3
80006fdc:	ffc7f793          	andi	a5,a5,-4
80006fe0:	40fb07b3          	sub	a5,s6,a5
80006fe4:	00078713          	mv	a4,a5
80006fe8:	01079793          	slli	a5,a5,0x10
80006fec:	0107d793          	srli	a5,a5,0x10
80006ff0:	00f97463          	bgeu	s2,a5,80006ff8 <pbuf_alloc+0x17c>
80006ff4:	00090713          	mv	a4,s2
80006ff8:	00850433          	add	s0,a0,s0
80006ffc:	01340413          	addi	s0,s0,19
80007000:	ffc47413          	andi	s0,s0,-4
80007004:	01071793          	slli	a5,a4,0x10
80007008:	00052023          	sw	zero,0(a0)
8000700c:	00852223          	sw	s0,4(a0)
80007010:	01251423          	sh	s2,8(a0)
80007014:	00e51523          	sh	a4,10(a0)
80007018:	01352623          	sw	s3,12(a0)
8000701c:	0107d793          	srli	a5,a5,0x10
80007020:	02048263          	beqz	s1,80007044 <pbuf_alloc+0x1c8>
80007024:	00aa2023          	sw	a0,0(s4)
80007028:	40f90933          	sub	s2,s2,a5
8000702c:	01091913          	slli	s2,s2,0x10
80007030:	01095913          	srli	s2,s2,0x10
80007034:	00000413          	li	s0,0
80007038:	00050a13          	mv	s4,a0
8000703c:	f6091ce3          	bnez	s2,80006fb4 <pbuf_alloc+0x138>
80007040:	e7dff06f          	j	80006ebc <pbuf_alloc+0x40>
80007044:	00050493          	mv	s1,a0
80007048:	fe1ff06f          	j	80007028 <pbuf_alloc+0x1ac>

8000704c <pbuf_realloc>:
8000704c:	00855783          	lhu	a5,8(a0)
80007050:	0af5f463          	bgeu	a1,a5,800070f8 <pbuf_realloc+0xac>
80007054:	ff010113          	addi	sp,sp,-16
80007058:	00812423          	sw	s0,8(sp)
8000705c:	00912223          	sw	s1,4(sp)
80007060:	00112623          	sw	ra,12(sp)
80007064:	00050413          	mv	s0,a0
80007068:	00058493          	mv	s1,a1
8000706c:	40f587b3          	sub	a5,a1,a5
80007070:	00a45583          	lhu	a1,10(s0)
80007074:	0695e263          	bltu	a1,s1,800070d8 <pbuf_realloc+0x8c>
80007078:	00c44783          	lbu	a5,12(s0)
8000707c:	00f7f793          	andi	a5,a5,15
80007080:	02079663          	bnez	a5,800070ac <pbuf_realloc+0x60>
80007084:	02958463          	beq	a1,s1,800070ac <pbuf_realloc+0x60>
80007088:	00d44783          	lbu	a5,13(s0)
8000708c:	0027f793          	andi	a5,a5,2
80007090:	00079e63          	bnez	a5,800070ac <pbuf_realloc+0x60>
80007094:	00442583          	lw	a1,4(s0)
80007098:	00040513          	mv	a0,s0
8000709c:	408585b3          	sub	a1,a1,s0
800070a0:	009585b3          	add	a1,a1,s1
800070a4:	adcff0ef          	jal	ra,80006380 <mem_trim>
800070a8:	00050413          	mv	s0,a0
800070ac:	00042503          	lw	a0,0(s0)
800070b0:	00941523          	sh	s1,10(s0)
800070b4:	00941423          	sh	s1,8(s0)
800070b8:	00050463          	beqz	a0,800070c0 <pbuf_realloc+0x74>
800070bc:	cedff0ef          	jal	ra,80006da8 <pbuf_free>
800070c0:	00042023          	sw	zero,0(s0)
800070c4:	00c12083          	lw	ra,12(sp)
800070c8:	00812403          	lw	s0,8(sp)
800070cc:	00412483          	lw	s1,4(sp)
800070d0:	01010113          	addi	sp,sp,16
800070d4:	00008067          	ret
800070d8:	00845703          	lhu	a4,8(s0)
800070dc:	40b484b3          	sub	s1,s1,a1
800070e0:	01049493          	slli	s1,s1,0x10
800070e4:	00e78733          	add	a4,a5,a4
800070e8:	00e41423          	sh	a4,8(s0)
800070ec:	0104d493          	srli	s1,s1,0x10
800070f0:	00042403          	lw	s0,0(s0)
800070f4:	f7dff06f          	j	80007070 <pbuf_realloc+0x24>
800070f8:	00008067          	ret

800070fc <pbuf_free_header>:
800070fc:	fe010113          	addi	sp,sp,-32
80007100:	00812c23          	sw	s0,24(sp)
80007104:	00112e23          	sw	ra,28(sp)
80007108:	00912a23          	sw	s1,20(sp)
8000710c:	00050413          	mv	s0,a0
80007110:	04058263          	beqz	a1,80007154 <pbuf_free_header+0x58>
80007114:	04040063          	beqz	s0,80007154 <pbuf_free_header+0x58>
80007118:	00a45783          	lhu	a5,10(s0)
8000711c:	02f5e863          	bltu	a1,a5,8000714c <pbuf_free_header+0x50>
80007120:	40f585b3          	sub	a1,a1,a5
80007124:	00042483          	lw	s1,0(s0)
80007128:	01059593          	slli	a1,a1,0x10
8000712c:	0105d593          	srli	a1,a1,0x10
80007130:	00042023          	sw	zero,0(s0)
80007134:	00040513          	mv	a0,s0
80007138:	00b12623          	sw	a1,12(sp)
8000713c:	c6dff0ef          	jal	ra,80006da8 <pbuf_free>
80007140:	00048413          	mv	s0,s1
80007144:	00c12583          	lw	a1,12(sp)
80007148:	fc9ff06f          	j	80007110 <pbuf_free_header+0x14>
8000714c:	00040513          	mv	a0,s0
80007150:	bd1ff0ef          	jal	ra,80006d20 <pbuf_remove_header>
80007154:	00040513          	mv	a0,s0
80007158:	01c12083          	lw	ra,28(sp)
8000715c:	01812403          	lw	s0,24(sp)
80007160:	01412483          	lw	s1,20(sp)
80007164:	02010113          	addi	sp,sp,32
80007168:	00008067          	ret

8000716c <pbuf_clen>:
8000716c:	00000793          	li	a5,0
80007170:	00051663          	bnez	a0,8000717c <pbuf_clen+0x10>
80007174:	00078513          	mv	a0,a5
80007178:	00008067          	ret
8000717c:	00178793          	addi	a5,a5,1
80007180:	01079793          	slli	a5,a5,0x10
80007184:	0107d793          	srli	a5,a5,0x10
80007188:	00052503          	lw	a0,0(a0)
8000718c:	fe5ff06f          	j	80007170 <pbuf_clen+0x4>

80007190 <pbuf_ref>:
80007190:	02050a63          	beqz	a0,800071c4 <pbuf_ref+0x34>
80007194:	ff010113          	addi	sp,sp,-16
80007198:	00812423          	sw	s0,8(sp)
8000719c:	00112623          	sw	ra,12(sp)
800071a0:	00050413          	mv	s0,a0
800071a4:	b19fd0ef          	jal	ra,80004cbc <sys_arch_protect>
800071a8:	00e44783          	lbu	a5,14(s0)
800071ac:	00178793          	addi	a5,a5,1
800071b0:	00f40723          	sb	a5,14(s0)
800071b4:	00812403          	lw	s0,8(sp)
800071b8:	00c12083          	lw	ra,12(sp)
800071bc:	01010113          	addi	sp,sp,16
800071c0:	b01fd06f          	j	80004cc0 <sys_arch_unprotect>
800071c4:	00008067          	ret

800071c8 <pbuf_cat>:
800071c8:	02050a63          	beqz	a0,800071fc <pbuf_cat+0x34>
800071cc:	00059663          	bnez	a1,800071d8 <pbuf_cat+0x10>
800071d0:	00008067          	ret
800071d4:	00070513          	mv	a0,a4
800071d8:	00855783          	lhu	a5,8(a0)
800071dc:	0085d683          	lhu	a3,8(a1)
800071e0:	00052703          	lw	a4,0(a0)
800071e4:	00d787b3          	add	a5,a5,a3
800071e8:	01079793          	slli	a5,a5,0x10
800071ec:	0107d793          	srli	a5,a5,0x10
800071f0:	00f51423          	sh	a5,8(a0)
800071f4:	fe0710e3          	bnez	a4,800071d4 <pbuf_cat+0xc>
800071f8:	00b52023          	sw	a1,0(a0)
800071fc:	00008067          	ret

80007200 <pbuf_chain>:
80007200:	ff010113          	addi	sp,sp,-16
80007204:	00812423          	sw	s0,8(sp)
80007208:	00112623          	sw	ra,12(sp)
8000720c:	00058413          	mv	s0,a1
80007210:	fb9ff0ef          	jal	ra,800071c8 <pbuf_cat>
80007214:	00040513          	mv	a0,s0
80007218:	00812403          	lw	s0,8(sp)
8000721c:	00c12083          	lw	ra,12(sp)
80007220:	01010113          	addi	sp,sp,16
80007224:	f6dff06f          	j	80007190 <pbuf_ref>

80007228 <pbuf_dechain>:
80007228:	ff010113          	addi	sp,sp,-16
8000722c:	00112623          	sw	ra,12(sp)
80007230:	00812423          	sw	s0,8(sp)
80007234:	00052403          	lw	s0,0(a0)
80007238:	02040663          	beqz	s0,80007264 <pbuf_dechain+0x3c>
8000723c:	00855783          	lhu	a5,8(a0)
80007240:	00a55703          	lhu	a4,10(a0)
80007244:	40e787b3          	sub	a5,a5,a4
80007248:	00f41423          	sh	a5,8(s0)
8000724c:	00a55783          	lhu	a5,10(a0)
80007250:	00052023          	sw	zero,0(a0)
80007254:	00f51423          	sh	a5,8(a0)
80007258:	00040513          	mv	a0,s0
8000725c:	b4dff0ef          	jal	ra,80006da8 <pbuf_free>
80007260:	00050463          	beqz	a0,80007268 <pbuf_dechain+0x40>
80007264:	00000413          	li	s0,0
80007268:	00040513          	mv	a0,s0
8000726c:	00c12083          	lw	ra,12(sp)
80007270:	00812403          	lw	s0,8(sp)
80007274:	01010113          	addi	sp,sp,16
80007278:	00008067          	ret

8000727c <pbuf_copy>:
8000727c:	10050463          	beqz	a0,80007384 <pbuf_copy+0x108>
80007280:	fe010113          	addi	sp,sp,-32
80007284:	00812c23          	sw	s0,24(sp)
80007288:	00112e23          	sw	ra,28(sp)
8000728c:	00912a23          	sw	s1,20(sp)
80007290:	01212823          	sw	s2,16(sp)
80007294:	01312623          	sw	s3,12(sp)
80007298:	01412423          	sw	s4,8(sp)
8000729c:	00058413          	mv	s0,a1
800072a0:	06058e63          	beqz	a1,8000731c <pbuf_copy+0xa0>
800072a4:	00855703          	lhu	a4,8(a0)
800072a8:	0085d783          	lhu	a5,8(a1)
800072ac:	00050493          	mv	s1,a0
800072b0:	06f76663          	bltu	a4,a5,8000731c <pbuf_copy+0xa0>
800072b4:	00000a13          	li	s4,0
800072b8:	00000993          	li	s3,0
800072bc:	00a4d903          	lhu	s2,10(s1)
800072c0:	00a45783          	lhu	a5,10(s0)
800072c4:	41390933          	sub	s2,s2,s3
800072c8:	414787b3          	sub	a5,a5,s4
800072cc:	0127f463          	bgeu	a5,s2,800072d4 <pbuf_copy+0x58>
800072d0:	00078913          	mv	s2,a5
800072d4:	0044a503          	lw	a0,4(s1)
800072d8:	00442583          	lw	a1,4(s0)
800072dc:	00090613          	mv	a2,s2
800072e0:	01350533          	add	a0,a0,s3
800072e4:	014585b3          	add	a1,a1,s4
800072e8:	355060ef          	jal	ra,8000de3c <memcpy>
800072ec:	00a45703          	lhu	a4,10(s0)
800072f0:	012a0a33          	add	s4,s4,s2
800072f4:	012989b3          	add	s3,s3,s2
800072f8:	00a4d783          	lhu	a5,10(s1)
800072fc:	00ea6663          	bltu	s4,a4,80007308 <pbuf_copy+0x8c>
80007300:	00042403          	lw	s0,0(s0)
80007304:	00000a13          	li	s4,0
80007308:	02f99e63          	bne	s3,a5,80007344 <pbuf_copy+0xc8>
8000730c:	0004a483          	lw	s1,0(s1)
80007310:	02049863          	bnez	s1,80007340 <pbuf_copy+0xc4>
80007314:	00000513          	li	a0,0
80007318:	00040463          	beqz	s0,80007320 <pbuf_copy+0xa4>
8000731c:	ff000513          	li	a0,-16
80007320:	01c12083          	lw	ra,28(sp)
80007324:	01812403          	lw	s0,24(sp)
80007328:	01412483          	lw	s1,20(sp)
8000732c:	01012903          	lw	s2,16(sp)
80007330:	00c12983          	lw	s3,12(sp)
80007334:	00812a03          	lw	s4,8(sp)
80007338:	02010113          	addi	sp,sp,32
8000733c:	00008067          	ret
80007340:	00000993          	li	s3,0
80007344:	00040c63          	beqz	s0,8000735c <pbuf_copy+0xe0>
80007348:	00a45703          	lhu	a4,10(s0)
8000734c:	00845783          	lhu	a5,8(s0)
80007350:	00f71663          	bne	a4,a5,8000735c <pbuf_copy+0xe0>
80007354:	00042783          	lw	a5,0(s0)
80007358:	02079263          	bnez	a5,8000737c <pbuf_copy+0x100>
8000735c:	00a4d703          	lhu	a4,10(s1)
80007360:	0084d783          	lhu	a5,8(s1)
80007364:	00f71663          	bne	a4,a5,80007370 <pbuf_copy+0xf4>
80007368:	0004a783          	lw	a5,0(s1)
8000736c:	00079863          	bnez	a5,8000737c <pbuf_copy+0x100>
80007370:	f40416e3          	bnez	s0,800072bc <pbuf_copy+0x40>
80007374:	00000513          	li	a0,0
80007378:	fa9ff06f          	j	80007320 <pbuf_copy+0xa4>
8000737c:	ffa00513          	li	a0,-6
80007380:	fa1ff06f          	j	80007320 <pbuf_copy+0xa4>
80007384:	ff000513          	li	a0,-16
80007388:	00008067          	ret

8000738c <pbuf_copy_partial>:
8000738c:	fe010113          	addi	sp,sp,-32
80007390:	00812c23          	sw	s0,24(sp)
80007394:	00112e23          	sw	ra,28(sp)
80007398:	00912a23          	sw	s1,20(sp)
8000739c:	01212823          	sw	s2,16(sp)
800073a0:	01312623          	sw	s3,12(sp)
800073a4:	01412423          	sw	s4,8(sp)
800073a8:	00000413          	li	s0,0
800073ac:	02050063          	beqz	a0,800073cc <pbuf_copy_partial+0x40>
800073b0:	00058a13          	mv	s4,a1
800073b4:	00000413          	li	s0,0
800073b8:	00058a63          	beqz	a1,800073cc <pbuf_copy_partial+0x40>
800073bc:	00050913          	mv	s2,a0
800073c0:	00060493          	mv	s1,a2
800073c4:	00048463          	beqz	s1,800073cc <pbuf_copy_partial+0x40>
800073c8:	02091463          	bnez	s2,800073f0 <pbuf_copy_partial+0x64>
800073cc:	00040513          	mv	a0,s0
800073d0:	01c12083          	lw	ra,28(sp)
800073d4:	01812403          	lw	s0,24(sp)
800073d8:	01412483          	lw	s1,20(sp)
800073dc:	01012903          	lw	s2,16(sp)
800073e0:	00c12983          	lw	s3,12(sp)
800073e4:	00812a03          	lw	s4,8(sp)
800073e8:	02010113          	addi	sp,sp,32
800073ec:	00008067          	ret
800073f0:	00a95583          	lhu	a1,10(s2)
800073f4:	00068e63          	beqz	a3,80007410 <pbuf_copy_partial+0x84>
800073f8:	00b6ec63          	bltu	a3,a1,80007410 <pbuf_copy_partial+0x84>
800073fc:	40b686b3          	sub	a3,a3,a1
80007400:	01069693          	slli	a3,a3,0x10
80007404:	0106d693          	srli	a3,a3,0x10
80007408:	00092903          	lw	s2,0(s2)
8000740c:	fb9ff06f          	j	800073c4 <pbuf_copy_partial+0x38>
80007410:	40d585b3          	sub	a1,a1,a3
80007414:	01059593          	slli	a1,a1,0x10
80007418:	0105d593          	srli	a1,a1,0x10
8000741c:	00058993          	mv	s3,a1
80007420:	00b4f463          	bgeu	s1,a1,80007428 <pbuf_copy_partial+0x9c>
80007424:	00048993          	mv	s3,s1
80007428:	00492583          	lw	a1,4(s2)
8000742c:	01099993          	slli	s3,s3,0x10
80007430:	0109d993          	srli	s3,s3,0x10
80007434:	00d585b3          	add	a1,a1,a3
80007438:	008a0533          	add	a0,s4,s0
8000743c:	00098613          	mv	a2,s3
80007440:	01340433          	add	s0,s0,s3
80007444:	413484b3          	sub	s1,s1,s3
80007448:	1f5060ef          	jal	ra,8000de3c <memcpy>
8000744c:	01041413          	slli	s0,s0,0x10
80007450:	01049493          	slli	s1,s1,0x10
80007454:	01045413          	srli	s0,s0,0x10
80007458:	0104d493          	srli	s1,s1,0x10
8000745c:	00000693          	li	a3,0
80007460:	fa9ff06f          	j	80007408 <pbuf_copy_partial+0x7c>

80007464 <pbuf_get_contiguous>:
80007464:	fe010113          	addi	sp,sp,-32
80007468:	00112e23          	sw	ra,28(sp)
8000746c:	00812c23          	sw	s0,24(sp)
80007470:	00912a23          	sw	s1,20(sp)
80007474:	02051063          	bnez	a0,80007494 <pbuf_get_contiguous+0x30>
80007478:	00000413          	li	s0,0
8000747c:	00040513          	mv	a0,s0
80007480:	01c12083          	lw	ra,28(sp)
80007484:	01812403          	lw	s0,24(sp)
80007488:	01412483          	lw	s1,20(sp)
8000748c:	02010113          	addi	sp,sp,32
80007490:	00008067          	ret
80007494:	00058413          	mv	s0,a1
80007498:	fe0580e3          	beqz	a1,80007478 <pbuf_get_contiguous+0x14>
8000749c:	00068493          	mv	s1,a3
800074a0:	fcd66ce3          	bltu	a2,a3,80007478 <pbuf_get_contiguous+0x14>
800074a4:	00e10613          	addi	a2,sp,14
800074a8:	00070593          	mv	a1,a4
800074ac:	ee4ff0ef          	jal	ra,80006b90 <pbuf_skip_const>
800074b0:	fc0504e3          	beqz	a0,80007478 <pbuf_get_contiguous+0x14>
800074b4:	00e15683          	lhu	a3,14(sp)
800074b8:	00a55603          	lhu	a2,10(a0)
800074bc:	00968733          	add	a4,a3,s1
800074c0:	00e64863          	blt	a2,a4,800074d0 <pbuf_get_contiguous+0x6c>
800074c4:	00452403          	lw	s0,4(a0)
800074c8:	00d40433          	add	s0,s0,a3
800074cc:	fb1ff06f          	j	8000747c <pbuf_get_contiguous+0x18>
800074d0:	00048613          	mv	a2,s1
800074d4:	00040593          	mv	a1,s0
800074d8:	eb5ff0ef          	jal	ra,8000738c <pbuf_copy_partial>
800074dc:	fa9500e3          	beq	a0,s1,8000747c <pbuf_get_contiguous+0x18>
800074e0:	f99ff06f          	j	80007478 <pbuf_get_contiguous+0x14>

800074e4 <pbuf_skip>:
800074e4:	eacff06f          	j	80006b90 <pbuf_skip_const>

800074e8 <pbuf_take>:
800074e8:	08050c63          	beqz	a0,80007580 <pbuf_take+0x98>
800074ec:	fe010113          	addi	sp,sp,-32
800074f0:	00912a23          	sw	s1,20(sp)
800074f4:	01412423          	sw	s4,8(sp)
800074f8:	00112e23          	sw	ra,28(sp)
800074fc:	00812c23          	sw	s0,24(sp)
80007500:	01212823          	sw	s2,16(sp)
80007504:	01312623          	sw	s3,12(sp)
80007508:	00050493          	mv	s1,a0
8000750c:	00058a13          	mv	s4,a1
80007510:	ff000513          	li	a0,-16
80007514:	00058c63          	beqz	a1,8000752c <pbuf_take+0x44>
80007518:	0084d783          	lhu	a5,8(s1)
8000751c:	00060413          	mv	s0,a2
80007520:	fff00513          	li	a0,-1
80007524:	00000993          	li	s3,0
80007528:	04c7f663          	bgeu	a5,a2,80007574 <pbuf_take+0x8c>
8000752c:	01c12083          	lw	ra,28(sp)
80007530:	01812403          	lw	s0,24(sp)
80007534:	01412483          	lw	s1,20(sp)
80007538:	01012903          	lw	s2,16(sp)
8000753c:	00c12983          	lw	s3,12(sp)
80007540:	00812a03          	lw	s4,8(sp)
80007544:	02010113          	addi	sp,sp,32
80007548:	00008067          	ret
8000754c:	00a4d903          	lhu	s2,10(s1)
80007550:	01247463          	bgeu	s0,s2,80007558 <pbuf_take+0x70>
80007554:	00040913          	mv	s2,s0
80007558:	0044a503          	lw	a0,4(s1)
8000755c:	013a05b3          	add	a1,s4,s3
80007560:	00090613          	mv	a2,s2
80007564:	0d9060ef          	jal	ra,8000de3c <memcpy>
80007568:	0004a483          	lw	s1,0(s1)
8000756c:	41240433          	sub	s0,s0,s2
80007570:	012989b3          	add	s3,s3,s2
80007574:	fc041ce3          	bnez	s0,8000754c <pbuf_take+0x64>
80007578:	00000513          	li	a0,0
8000757c:	fb1ff06f          	j	8000752c <pbuf_take+0x44>
80007580:	ff000513          	li	a0,-16
80007584:	00008067          	ret

80007588 <pbuf_take_at>:
80007588:	fd010113          	addi	sp,sp,-48
8000758c:	02812423          	sw	s0,40(sp)
80007590:	01312e23          	sw	s3,28(sp)
80007594:	00060413          	mv	s0,a2
80007598:	00058993          	mv	s3,a1
8000759c:	00e10613          	addi	a2,sp,14
800075a0:	00068593          	mv	a1,a3
800075a4:	02112623          	sw	ra,44(sp)
800075a8:	02912223          	sw	s1,36(sp)
800075ac:	03212023          	sw	s2,32(sp)
800075b0:	de0ff0ef          	jal	ra,80006b90 <pbuf_skip_const>
800075b4:	08050263          	beqz	a0,80007638 <pbuf_take_at+0xb0>
800075b8:	00e15703          	lhu	a4,14(sp)
800075bc:	00855683          	lhu	a3,8(a0)
800075c0:	00050493          	mv	s1,a0
800075c4:	008707b3          	add	a5,a4,s0
800075c8:	fff00513          	li	a0,-1
800075cc:	04f6c863          	blt	a3,a5,8000761c <pbuf_take_at+0x94>
800075d0:	00a4d783          	lhu	a5,10(s1)
800075d4:	00040913          	mv	s2,s0
800075d8:	40e787b3          	sub	a5,a5,a4
800075dc:	0087d663          	bge	a5,s0,800075e8 <pbuf_take_at+0x60>
800075e0:	01079913          	slli	s2,a5,0x10
800075e4:	01095913          	srli	s2,s2,0x10
800075e8:	0044a503          	lw	a0,4(s1)
800075ec:	00090613          	mv	a2,s2
800075f0:	00098593          	mv	a1,s3
800075f4:	00e50533          	add	a0,a0,a4
800075f8:	045060ef          	jal	ra,8000de3c <memcpy>
800075fc:	41240633          	sub	a2,s0,s2
80007600:	01061613          	slli	a2,a2,0x10
80007604:	01065613          	srli	a2,a2,0x10
80007608:	00000513          	li	a0,0
8000760c:	00060863          	beqz	a2,8000761c <pbuf_take_at+0x94>
80007610:	0004a503          	lw	a0,0(s1)
80007614:	012985b3          	add	a1,s3,s2
80007618:	ed1ff0ef          	jal	ra,800074e8 <pbuf_take>
8000761c:	02c12083          	lw	ra,44(sp)
80007620:	02812403          	lw	s0,40(sp)
80007624:	02412483          	lw	s1,36(sp)
80007628:	02012903          	lw	s2,32(sp)
8000762c:	01c12983          	lw	s3,28(sp)
80007630:	03010113          	addi	sp,sp,48
80007634:	00008067          	ret
80007638:	fff00513          	li	a0,-1
8000763c:	fe1ff06f          	j	8000761c <pbuf_take_at+0x94>

80007640 <pbuf_clone>:
80007640:	ff010113          	addi	sp,sp,-16
80007644:	00912223          	sw	s1,4(sp)
80007648:	00060493          	mv	s1,a2
8000764c:	00058613          	mv	a2,a1
80007650:	0084d583          	lhu	a1,8(s1)
80007654:	00812423          	sw	s0,8(sp)
80007658:	00112623          	sw	ra,12(sp)
8000765c:	821ff0ef          	jal	ra,80006e7c <pbuf_alloc>
80007660:	00050413          	mv	s0,a0
80007664:	00050663          	beqz	a0,80007670 <pbuf_clone+0x30>
80007668:	00048593          	mv	a1,s1
8000766c:	c11ff0ef          	jal	ra,8000727c <pbuf_copy>
80007670:	00040513          	mv	a0,s0
80007674:	00c12083          	lw	ra,12(sp)
80007678:	00812403          	lw	s0,8(sp)
8000767c:	00412483          	lw	s1,4(sp)
80007680:	01010113          	addi	sp,sp,16
80007684:	00008067          	ret

80007688 <pbuf_coalesce>:
80007688:	ff010113          	addi	sp,sp,-16
8000768c:	00812423          	sw	s0,8(sp)
80007690:	00112623          	sw	ra,12(sp)
80007694:	00912223          	sw	s1,4(sp)
80007698:	00052783          	lw	a5,0(a0)
8000769c:	00050413          	mv	s0,a0
800076a0:	02079063          	bnez	a5,800076c0 <pbuf_coalesce+0x38>
800076a4:	00040493          	mv	s1,s0
800076a8:	00c12083          	lw	ra,12(sp)
800076ac:	00812403          	lw	s0,8(sp)
800076b0:	00048513          	mv	a0,s1
800076b4:	00412483          	lw	s1,4(sp)
800076b8:	01010113          	addi	sp,sp,16
800076bc:	00008067          	ret
800076c0:	00058513          	mv	a0,a1
800076c4:	00040613          	mv	a2,s0
800076c8:	28000593          	li	a1,640
800076cc:	f75ff0ef          	jal	ra,80007640 <pbuf_clone>
800076d0:	00050493          	mv	s1,a0
800076d4:	fc0508e3          	beqz	a0,800076a4 <pbuf_coalesce+0x1c>
800076d8:	00040513          	mv	a0,s0
800076dc:	eccff0ef          	jal	ra,80006da8 <pbuf_free>
800076e0:	fc9ff06f          	j	800076a8 <pbuf_coalesce+0x20>

800076e4 <pbuf_try_get_at>:
800076e4:	fe010113          	addi	sp,sp,-32
800076e8:	00e10613          	addi	a2,sp,14
800076ec:	00112e23          	sw	ra,28(sp)
800076f0:	ca0ff0ef          	jal	ra,80006b90 <pbuf_skip_const>
800076f4:	fff00793          	li	a5,-1
800076f8:	02050063          	beqz	a0,80007718 <pbuf_try_get_at+0x34>
800076fc:	00e15703          	lhu	a4,14(sp)
80007700:	00a55683          	lhu	a3,10(a0)
80007704:	fff00793          	li	a5,-1
80007708:	00d77863          	bgeu	a4,a3,80007718 <pbuf_try_get_at+0x34>
8000770c:	00452783          	lw	a5,4(a0)
80007710:	00e787b3          	add	a5,a5,a4
80007714:	0007c783          	lbu	a5,0(a5)
80007718:	01c12083          	lw	ra,28(sp)
8000771c:	00078513          	mv	a0,a5
80007720:	02010113          	addi	sp,sp,32
80007724:	00008067          	ret

80007728 <pbuf_get_at>:
80007728:	ff010113          	addi	sp,sp,-16
8000772c:	00112623          	sw	ra,12(sp)
80007730:	fb5ff0ef          	jal	ra,800076e4 <pbuf_try_get_at>
80007734:	00055463          	bgez	a0,8000773c <pbuf_get_at+0x14>
80007738:	00000513          	li	a0,0
8000773c:	00c12083          	lw	ra,12(sp)
80007740:	0ff57513          	andi	a0,a0,255
80007744:	01010113          	addi	sp,sp,16
80007748:	00008067          	ret

8000774c <pbuf_put_at>:
8000774c:	fe010113          	addi	sp,sp,-32
80007750:	00812c23          	sw	s0,24(sp)
80007754:	00060413          	mv	s0,a2
80007758:	00e10613          	addi	a2,sp,14
8000775c:	00112e23          	sw	ra,28(sp)
80007760:	c30ff0ef          	jal	ra,80006b90 <pbuf_skip_const>
80007764:	00050e63          	beqz	a0,80007780 <pbuf_put_at+0x34>
80007768:	00e15703          	lhu	a4,14(sp)
8000776c:	00a55783          	lhu	a5,10(a0)
80007770:	00f77863          	bgeu	a4,a5,80007780 <pbuf_put_at+0x34>
80007774:	00452783          	lw	a5,4(a0)
80007778:	00e787b3          	add	a5,a5,a4
8000777c:	00878023          	sb	s0,0(a5)
80007780:	01c12083          	lw	ra,28(sp)
80007784:	01812403          	lw	s0,24(sp)
80007788:	02010113          	addi	sp,sp,32
8000778c:	00008067          	ret

80007790 <pbuf_memcmp>:
80007790:	00855703          	lhu	a4,8(a0)
80007794:	00d587b3          	add	a5,a1,a3
80007798:	00f75863          	bge	a4,a5,800077a8 <pbuf_memcmp+0x18>
8000779c:	00010537          	lui	a0,0x10
800077a0:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xf7ff>
800077a4:	00008067          	ret
800077a8:	fd010113          	addi	sp,sp,-48
800077ac:	02812423          	sw	s0,40(sp)
800077b0:	02912223          	sw	s1,36(sp)
800077b4:	02112623          	sw	ra,44(sp)
800077b8:	03212023          	sw	s2,32(sp)
800077bc:	01312e23          	sw	s3,28(sp)
800077c0:	00050493          	mv	s1,a0
800077c4:	00058413          	mv	s0,a1
800077c8:	00a4d783          	lhu	a5,10(s1)
800077cc:	00f46c63          	bltu	s0,a5,800077e4 <pbuf_memcmp+0x54>
800077d0:	0004a483          	lw	s1,0(s1)
800077d4:	40f40433          	sub	s0,s0,a5
800077d8:	01041413          	slli	s0,s0,0x10
800077dc:	01045413          	srli	s0,s0,0x10
800077e0:	fe0494e3          	bnez	s1,800077c8 <pbuf_memcmp+0x38>
800077e4:	00000993          	li	s3,0
800077e8:	01099913          	slli	s2,s3,0x10
800077ec:	01095913          	srli	s2,s2,0x10
800077f0:	00d96663          	bltu	s2,a3,800077fc <pbuf_memcmp+0x6c>
800077f4:	00000513          	li	a0,0
800077f8:	0580006f          	j	80007850 <pbuf_memcmp+0xc0>
800077fc:	008905b3          	add	a1,s2,s0
80007800:	01059593          	slli	a1,a1,0x10
80007804:	0105d593          	srli	a1,a1,0x10
80007808:	00048513          	mv	a0,s1
8000780c:	00d12623          	sw	a3,12(sp)
80007810:	00c12423          	sw	a2,8(sp)
80007814:	f15ff0ef          	jal	ra,80007728 <pbuf_get_at>
80007818:	00812603          	lw	a2,8(sp)
8000781c:	00198993          	addi	s3,s3,1
80007820:	00c12683          	lw	a3,12(sp)
80007824:	013607b3          	add	a5,a2,s3
80007828:	fff7c783          	lbu	a5,-1(a5)
8000782c:	faa78ee3          	beq	a5,a0,800077e8 <pbuf_memcmp+0x58>
80007830:	000107b7          	lui	a5,0x10
80007834:	ffe78793          	addi	a5,a5,-2 # fffe <_stack_size+0xf7fe>
80007838:	00090513          	mv	a0,s2
8000783c:	0127f463          	bgeu	a5,s2,80007844 <pbuf_memcmp+0xb4>
80007840:	ffe00513          	li	a0,-2
80007844:	00150513          	addi	a0,a0,1
80007848:	01051513          	slli	a0,a0,0x10
8000784c:	01055513          	srli	a0,a0,0x10
80007850:	02c12083          	lw	ra,44(sp)
80007854:	02812403          	lw	s0,40(sp)
80007858:	02412483          	lw	s1,36(sp)
8000785c:	02012903          	lw	s2,32(sp)
80007860:	01c12983          	lw	s3,28(sp)
80007864:	03010113          	addi	sp,sp,48
80007868:	00008067          	ret

8000786c <pbuf_memfind>:
8000786c:	fe010113          	addi	sp,sp,-32
80007870:	00112e23          	sw	ra,28(sp)
80007874:	00812c23          	sw	s0,24(sp)
80007878:	00912a23          	sw	s1,20(sp)
8000787c:	01212823          	sw	s2,16(sp)
80007880:	01312623          	sw	s3,12(sp)
80007884:	01412423          	sw	s4,8(sp)
80007888:	00855783          	lhu	a5,8(a0)
8000788c:	00d60733          	add	a4,a2,a3
80007890:	02e7c263          	blt	a5,a4,800078b4 <pbuf_memfind+0x48>
80007894:	40c787b3          	sub	a5,a5,a2
80007898:	01079493          	slli	s1,a5,0x10
8000789c:	00050993          	mv	s3,a0
800078a0:	00058a13          	mv	s4,a1
800078a4:	00060913          	mv	s2,a2
800078a8:	00068413          	mv	s0,a3
800078ac:	0104d493          	srli	s1,s1,0x10
800078b0:	0284f863          	bgeu	s1,s0,800078e0 <pbuf_memfind+0x74>
800078b4:	00010437          	lui	s0,0x10
800078b8:	fff40413          	addi	s0,s0,-1 # ffff <_stack_size+0xf7ff>
800078bc:	00040513          	mv	a0,s0
800078c0:	01c12083          	lw	ra,28(sp)
800078c4:	01812403          	lw	s0,24(sp)
800078c8:	01412483          	lw	s1,20(sp)
800078cc:	01012903          	lw	s2,16(sp)
800078d0:	00c12983          	lw	s3,12(sp)
800078d4:	00812a03          	lw	s4,8(sp)
800078d8:	02010113          	addi	sp,sp,32
800078dc:	00008067          	ret
800078e0:	00090693          	mv	a3,s2
800078e4:	000a0613          	mv	a2,s4
800078e8:	00040593          	mv	a1,s0
800078ec:	00098513          	mv	a0,s3
800078f0:	ea1ff0ef          	jal	ra,80007790 <pbuf_memcmp>
800078f4:	fc0504e3          	beqz	a0,800078bc <pbuf_memfind+0x50>
800078f8:	00140413          	addi	s0,s0,1
800078fc:	01041413          	slli	s0,s0,0x10
80007900:	01045413          	srli	s0,s0,0x10
80007904:	fadff06f          	j	800078b0 <pbuf_memfind+0x44>

80007908 <pbuf_strstr>:
80007908:	fe010113          	addi	sp,sp,-32
8000790c:	00812c23          	sw	s0,24(sp)
80007910:	01212823          	sw	s2,16(sp)
80007914:	00112e23          	sw	ra,28(sp)
80007918:	00010937          	lui	s2,0x10
8000791c:	00912a23          	sw	s1,20(sp)
80007920:	fff90413          	addi	s0,s2,-1 # ffff <_stack_size+0xf7ff>
80007924:	04058c63          	beqz	a1,8000797c <pbuf_strstr+0x74>
80007928:	0005c783          	lbu	a5,0(a1)
8000792c:	04078863          	beqz	a5,8000797c <pbuf_strstr+0x74>
80007930:	00855783          	lhu	a5,8(a0)
80007934:	04878663          	beq	a5,s0,80007980 <pbuf_strstr+0x78>
80007938:	00050493          	mv	s1,a0
8000793c:	00058513          	mv	a0,a1
80007940:	00b12623          	sw	a1,12(sp)
80007944:	ffe90913          	addi	s2,s2,-2
80007948:	56d060ef          	jal	ra,8000e6b4 <strlen>
8000794c:	02a96863          	bltu	s2,a0,8000797c <pbuf_strstr+0x74>
80007950:	01812403          	lw	s0,24(sp)
80007954:	01051613          	slli	a2,a0,0x10
80007958:	00c12583          	lw	a1,12(sp)
8000795c:	01c12083          	lw	ra,28(sp)
80007960:	01012903          	lw	s2,16(sp)
80007964:	00048513          	mv	a0,s1
80007968:	01412483          	lw	s1,20(sp)
8000796c:	00000693          	li	a3,0
80007970:	01065613          	srli	a2,a2,0x10
80007974:	02010113          	addi	sp,sp,32
80007978:	ef5ff06f          	j	8000786c <pbuf_memfind>
8000797c:	00040793          	mv	a5,s0
80007980:	01c12083          	lw	ra,28(sp)
80007984:	01812403          	lw	s0,24(sp)
80007988:	01412483          	lw	s1,20(sp)
8000798c:	01012903          	lw	s2,16(sp)
80007990:	00078513          	mv	a0,a5
80007994:	02010113          	addi	sp,sp,32
80007998:	00008067          	ret

8000799c <raw_input>:
8000799c:	fd010113          	addi	sp,sp,-48
800079a0:	02912223          	sw	s1,36(sp)
800079a4:	9dc18793          	addi	a5,gp,-1572 # 8000317c <ip_data>
800079a8:	02812423          	sw	s0,40(sp)
800079ac:	03212023          	sw	s2,32(sp)
800079b0:	01312e23          	sw	s3,28(sp)
800079b4:	01412c23          	sw	s4,24(sp)
800079b8:	01512a23          	sw	s5,20(sp)
800079bc:	01612823          	sw	s6,16(sp)
800079c0:	01712623          	sw	s7,12(sp)
800079c4:	02112623          	sw	ra,44(sp)
800079c8:	00050a13          	mv	s4,a0
800079cc:	0007a583          	lw	a1,0(a5)
800079d0:	0147a503          	lw	a0,20(a5)
800079d4:	00000993          	li	s3,0
800079d8:	9dc18493          	addi	s1,gp,-1572 # 8000317c <ip_data>
800079dc:	179040ef          	jal	ra,8000c354 <ip4_addr_isbroadcast_u32>
800079e0:	004a2783          	lw	a5,4(s4)
800079e4:	00050b13          	mv	s6,a0
800079e8:	0097ca83          	lbu	s5,9(a5)
800079ec:	8d01a403          	lw	s0,-1840(gp) # 80003070 <raw_pcbs>
800079f0:	00000513          	li	a0,0
800079f4:	00078913          	mv	s2,a5
800079f8:	08040a63          	beqz	s0,80007a8c <raw_input+0xf0>
800079fc:	01444783          	lbu	a5,20(s0)
80007a00:	0d579463          	bne	a5,s5,80007ac8 <raw_input+0x12c>
80007a04:	00844703          	lbu	a4,8(s0)
80007a08:	00070c63          	beqz	a4,80007a20 <raw_input+0x84>
80007a0c:	0044a783          	lw	a5,4(s1)
80007a10:	0387c783          	lbu	a5,56(a5)
80007a14:	00178793          	addi	a5,a5,1
80007a18:	0ff7f793          	andi	a5,a5,255
80007a1c:	0af71663          	bne	a4,a5,80007ac8 <raw_input+0x12c>
80007a20:	080b0c63          	beqz	s6,80007ab8 <raw_input+0x11c>
80007a24:	00944783          	lbu	a5,9(s0)
80007a28:	0207f793          	andi	a5,a5,32
80007a2c:	08078e63          	beqz	a5,80007ac8 <raw_input+0x12c>
80007a30:	00042783          	lw	a5,0(s0)
80007a34:	08079a63          	bnez	a5,80007ac8 <raw_input+0x12c>
80007a38:	01544783          	lbu	a5,21(s0)
80007a3c:	0017f793          	andi	a5,a5,1
80007a40:	00078863          	beqz	a5,80007a50 <raw_input+0xb4>
80007a44:	00442703          	lw	a4,4(s0)
80007a48:	0104a783          	lw	a5,16(s1)
80007a4c:	06f71e63          	bne	a4,a5,80007ac8 <raw_input+0x12c>
80007a50:	01842783          	lw	a5,24(s0)
80007a54:	06078a63          	beqz	a5,80007ac8 <raw_input+0x12c>
80007a58:	01c42503          	lw	a0,28(s0)
80007a5c:	9ec18693          	addi	a3,gp,-1556 # 8000318c <ip_data+0x10>
80007a60:	000a0613          	mv	a2,s4
80007a64:	00040593          	mv	a1,s0
80007a68:	000780e7          	jalr	a5
80007a6c:	06050463          	beqz	a0,80007ad4 <raw_input+0x138>
80007a70:	00100513          	li	a0,1
80007a74:	00098c63          	beqz	s3,80007a8c <raw_input+0xf0>
80007a78:	01042783          	lw	a5,16(s0)
80007a7c:	00f9a823          	sw	a5,16(s3)
80007a80:	8d01a783          	lw	a5,-1840(gp) # 80003070 <raw_pcbs>
80007a84:	8c81a823          	sw	s0,-1840(gp) # 80003070 <raw_pcbs>
80007a88:	00f42823          	sw	a5,16(s0)
80007a8c:	02c12083          	lw	ra,44(sp)
80007a90:	02812403          	lw	s0,40(sp)
80007a94:	02412483          	lw	s1,36(sp)
80007a98:	02012903          	lw	s2,32(sp)
80007a9c:	01c12983          	lw	s3,28(sp)
80007aa0:	01812a03          	lw	s4,24(sp)
80007aa4:	01412a83          	lw	s5,20(sp)
80007aa8:	01012b03          	lw	s6,16(sp)
80007aac:	00c12b83          	lw	s7,12(sp)
80007ab0:	03010113          	addi	sp,sp,48
80007ab4:	00008067          	ret
80007ab8:	00042783          	lw	a5,0(s0)
80007abc:	f6078ee3          	beqz	a5,80007a38 <raw_input+0x9c>
80007ac0:	0144a703          	lw	a4,20(s1)
80007ac4:	f6e78ae3          	beq	a5,a4,80007a38 <raw_input+0x9c>
80007ac8:	00040993          	mv	s3,s0
80007acc:	01042403          	lw	s0,16(s0)
80007ad0:	f29ff06f          	j	800079f8 <raw_input+0x5c>
80007ad4:	00200513          	li	a0,2
80007ad8:	ff1ff06f          	j	80007ac8 <raw_input+0x12c>

80007adc <raw_bind>:
80007adc:	ffa00793          	li	a5,-6
80007ae0:	00050a63          	beqz	a0,80007af4 <raw_bind+0x18>
80007ae4:	00058863          	beqz	a1,80007af4 <raw_bind+0x18>
80007ae8:	0005a783          	lw	a5,0(a1)
80007aec:	00f52023          	sw	a5,0(a0)
80007af0:	00000793          	li	a5,0
80007af4:	00078513          	mv	a0,a5
80007af8:	00008067          	ret

80007afc <raw_bind_netif>:
80007afc:	00000793          	li	a5,0
80007b00:	00058863          	beqz	a1,80007b10 <raw_bind_netif+0x14>
80007b04:	0385c783          	lbu	a5,56(a1)
80007b08:	00178793          	addi	a5,a5,1
80007b0c:	0ff7f793          	andi	a5,a5,255
80007b10:	00f50423          	sb	a5,8(a0)
80007b14:	00008067          	ret

80007b18 <raw_connect>:
80007b18:	00050793          	mv	a5,a0
80007b1c:	ffa00513          	li	a0,-6
80007b20:	02078263          	beqz	a5,80007b44 <raw_connect+0x2c>
80007b24:	02058063          	beqz	a1,80007b44 <raw_connect+0x2c>
80007b28:	0005a703          	lw	a4,0(a1)
80007b2c:	00000513          	li	a0,0
80007b30:	00e7a223          	sw	a4,4(a5)
80007b34:	0157c703          	lbu	a4,21(a5)
80007b38:	00176713          	ori	a4,a4,1
80007b3c:	00e78aa3          	sb	a4,21(a5)
80007b40:	00008067          	ret
80007b44:	00008067          	ret

80007b48 <raw_disconnect>:
80007b48:	01554783          	lbu	a5,21(a0)
80007b4c:	00052223          	sw	zero,4(a0)
80007b50:	00050423          	sb	zero,8(a0)
80007b54:	ffe7f793          	andi	a5,a5,-2
80007b58:	00f50aa3          	sb	a5,21(a0)
80007b5c:	00008067          	ret

80007b60 <raw_recv>:
80007b60:	00b52c23          	sw	a1,24(a0)
80007b64:	00c52e23          	sw	a2,28(a0)
80007b68:	00008067          	ret

80007b6c <raw_sendto_if_src>:
80007b6c:	fe010113          	addi	sp,sp,-32
80007b70:	00112e23          	sw	ra,28(sp)
80007b74:	00812c23          	sw	s0,24(sp)
80007b78:	00912a23          	sw	s1,20(sp)
80007b7c:	01212823          	sw	s2,16(sp)
80007b80:	01312623          	sw	s3,12(sp)
80007b84:	01412423          	sw	s4,8(sp)
80007b88:	01512223          	sw	s5,4(sp)
80007b8c:	00051663          	bnez	a0,80007b98 <raw_sendto_if_src+0x2c>
80007b90:	ffa00493          	li	s1,-6
80007b94:	06c0006f          	j	80007c00 <raw_sendto_if_src+0x94>
80007b98:	fe060ce3          	beqz	a2,80007b90 <raw_sendto_if_src+0x24>
80007b9c:	fe068ae3          	beqz	a3,80007b90 <raw_sendto_if_src+0x24>
80007ba0:	fe0708e3          	beqz	a4,80007b90 <raw_sendto_if_src+0x24>
80007ba4:	01554783          	lbu	a5,21(a0)
80007ba8:	00070a13          	mv	s4,a4
80007bac:	00068913          	mv	s2,a3
80007bb0:	0027f793          	andi	a5,a5,2
80007bb4:	00060a93          	mv	s5,a2
80007bb8:	00058413          	mv	s0,a1
80007bbc:	00050493          	mv	s1,a0
80007bc0:	06078463          	beqz	a5,80007c28 <raw_sendto_if_src+0xbc>
80007bc4:	00a5d703          	lhu	a4,10(a1)
80007bc8:	01300793          	li	a5,19
80007bcc:	fce7f2e3          	bgeu	a5,a4,80007b90 <raw_sendto_if_src+0x24>
80007bd0:	00c50493          	addi	s1,a0,12
80007bd4:	0296ae23          	sw	s1,60(a3)
80007bd8:	00068813          	mv	a6,a3
80007bdc:	00000793          	li	a5,0
80007be0:	00000713          	li	a4,0
80007be4:	00000693          	li	a3,0
80007be8:	00000613          	li	a2,0
80007bec:	000a0593          	mv	a1,s4
80007bf0:	00040513          	mv	a0,s0
80007bf4:	634040ef          	jal	ra,8000c228 <ip4_output_if>
80007bf8:	00050493          	mv	s1,a0
80007bfc:	02092e23          	sw	zero,60(s2)
80007c00:	01c12083          	lw	ra,28(sp)
80007c04:	01812403          	lw	s0,24(sp)
80007c08:	00048513          	mv	a0,s1
80007c0c:	01012903          	lw	s2,16(sp)
80007c10:	01412483          	lw	s1,20(sp)
80007c14:	00c12983          	lw	s3,12(sp)
80007c18:	00812a03          	lw	s4,8(sp)
80007c1c:	00412a83          	lw	s5,4(sp)
80007c20:	02010113          	addi	sp,sp,32
80007c24:	00008067          	ret
80007c28:	0085d703          	lhu	a4,8(a1)
80007c2c:	000107b7          	lui	a5,0x10
80007c30:	feb78793          	addi	a5,a5,-21 # ffeb <_stack_size+0xf7eb>
80007c34:	00e7f663          	bgeu	a5,a4,80007c40 <raw_sendto_if_src+0xd4>
80007c38:	fff00493          	li	s1,-1
80007c3c:	fc5ff06f          	j	80007c00 <raw_sendto_if_src+0x94>
80007c40:	01400593          	li	a1,20
80007c44:	00040513          	mv	a0,s0
80007c48:	8c8ff0ef          	jal	ra,80006d10 <pbuf_add_header>
80007c4c:	04050c63          	beqz	a0,80007ca4 <raw_sendto_if_src+0x138>
80007c50:	28000613          	li	a2,640
80007c54:	00000593          	li	a1,0
80007c58:	02400513          	li	a0,36
80007c5c:	a20ff0ef          	jal	ra,80006e7c <pbuf_alloc>
80007c60:	00050993          	mv	s3,a0
80007c64:	fc050ae3          	beqz	a0,80007c38 <raw_sendto_if_src+0xcc>
80007c68:	00845783          	lhu	a5,8(s0)
80007c6c:	00078663          	beqz	a5,80007c78 <raw_sendto_if_src+0x10c>
80007c70:	00040593          	mv	a1,s0
80007c74:	d8cff0ef          	jal	ra,80007200 <pbuf_chain>
80007c78:	0094c783          	lbu	a5,9(s1)
80007c7c:	0207f793          	andi	a5,a5,32
80007c80:	02079e63          	bnez	a5,80007cbc <raw_sendto_if_src+0x150>
80007c84:	000aa503          	lw	a0,0(s5)
80007c88:	00090593          	mv	a1,s2
80007c8c:	6c8040ef          	jal	ra,8000c354 <ip4_addr_isbroadcast_u32>
80007c90:	02050663          	beqz	a0,80007cbc <raw_sendto_if_src+0x150>
80007c94:	ef340ee3          	beq	s0,s3,80007b90 <raw_sendto_if_src+0x24>
80007c98:	00098513          	mv	a0,s3
80007c9c:	90cff0ef          	jal	ra,80006da8 <pbuf_free>
80007ca0:	ef1ff06f          	j	80007b90 <raw_sendto_if_src+0x24>
80007ca4:	01400593          	li	a1,20
80007ca8:	00040513          	mv	a0,s0
80007cac:	874ff0ef          	jal	ra,80006d20 <pbuf_remove_header>
80007cb0:	f80514e3          	bnez	a0,80007c38 <raw_sendto_if_src+0xcc>
80007cb4:	00040993          	mv	s3,s0
80007cb8:	fc1ff06f          	j	80007c78 <raw_sendto_if_src+0x10c>
80007cbc:	00c48793          	addi	a5,s1,12
80007cc0:	00b4c683          	lbu	a3,11(s1)
80007cc4:	02f92e23          	sw	a5,60(s2)
80007cc8:	0144c783          	lbu	a5,20(s1)
80007ccc:	00a4c703          	lbu	a4,10(s1)
80007cd0:	00090813          	mv	a6,s2
80007cd4:	000a8613          	mv	a2,s5
80007cd8:	000a0593          	mv	a1,s4
80007cdc:	00098513          	mv	a0,s3
80007ce0:	548040ef          	jal	ra,8000c228 <ip4_output_if>
80007ce4:	02092e23          	sw	zero,60(s2)
80007ce8:	00050493          	mv	s1,a0
80007cec:	f1340ae3          	beq	s0,s3,80007c00 <raw_sendto_if_src+0x94>
80007cf0:	00098513          	mv	a0,s3
80007cf4:	8b4ff0ef          	jal	ra,80006da8 <pbuf_free>
80007cf8:	f09ff06f          	j	80007c00 <raw_sendto_if_src+0x94>

80007cfc <raw_sendto>:
80007cfc:	08050663          	beqz	a0,80007d88 <raw_sendto+0x8c>
80007d00:	08060463          	beqz	a2,80007d88 <raw_sendto+0x8c>
80007d04:	ff010113          	addi	sp,sp,-16
80007d08:	00812423          	sw	s0,8(sp)
80007d0c:	00912223          	sw	s1,4(sp)
80007d10:	01212023          	sw	s2,0(sp)
80007d14:	00112623          	sw	ra,12(sp)
80007d18:	00050413          	mv	s0,a0
80007d1c:	00854503          	lbu	a0,8(a0)
80007d20:	00060493          	mv	s1,a2
80007d24:	00058913          	mv	s2,a1
80007d28:	04050663          	beqz	a0,80007d74 <raw_sendto+0x78>
80007d2c:	d41fe0ef          	jal	ra,80006a6c <netif_get_by_index>
80007d30:	06050063          	beqz	a0,80007d90 <raw_sendto+0x94>
80007d34:	00042783          	lw	a5,0(s0)
80007d38:	04078463          	beqz	a5,80007d80 <raw_sendto+0x84>
80007d3c:	0f07f793          	andi	a5,a5,240
80007d40:	0e000713          	li	a4,224
80007d44:	02e78e63          	beq	a5,a4,80007d80 <raw_sendto+0x84>
80007d48:	00040713          	mv	a4,s0
80007d4c:	00050693          	mv	a3,a0
80007d50:	00040513          	mv	a0,s0
80007d54:	00812403          	lw	s0,8(sp)
80007d58:	00c12083          	lw	ra,12(sp)
80007d5c:	00048613          	mv	a2,s1
80007d60:	00090593          	mv	a1,s2
80007d64:	00412483          	lw	s1,4(sp)
80007d68:	00012903          	lw	s2,0(sp)
80007d6c:	01010113          	addi	sp,sp,16
80007d70:	dfdff06f          	j	80007b6c <raw_sendto_if_src>
80007d74:	00060513          	mv	a0,a2
80007d78:	619030ef          	jal	ra,8000bb90 <ip4_route>
80007d7c:	fb5ff06f          	j	80007d30 <raw_sendto+0x34>
80007d80:	00450713          	addi	a4,a0,4
80007d84:	fc9ff06f          	j	80007d4c <raw_sendto+0x50>
80007d88:	ffa00513          	li	a0,-6
80007d8c:	00008067          	ret
80007d90:	00c12083          	lw	ra,12(sp)
80007d94:	00812403          	lw	s0,8(sp)
80007d98:	00412483          	lw	s1,4(sp)
80007d9c:	00012903          	lw	s2,0(sp)
80007da0:	ffc00513          	li	a0,-4
80007da4:	01010113          	addi	sp,sp,16
80007da8:	00008067          	ret

80007dac <raw_send>:
80007dac:	00450613          	addi	a2,a0,4
80007db0:	f4dff06f          	j	80007cfc <raw_sendto>

80007db4 <raw_remove>:
80007db4:	8d01a783          	lw	a5,-1840(gp) # 80003070 <raw_pcbs>
80007db8:	00050593          	mv	a1,a0
80007dbc:	00a79c63          	bne	a5,a0,80007dd4 <raw_remove+0x20>
80007dc0:	01052783          	lw	a5,16(a0)
80007dc4:	8cf1a823          	sw	a5,-1840(gp) # 80003070 <raw_pcbs>
80007dc8:	00000513          	li	a0,0
80007dcc:	f28fe06f          	j	800064f4 <memp_free>
80007dd0:	00070793          	mv	a5,a4
80007dd4:	fe078ae3          	beqz	a5,80007dc8 <raw_remove+0x14>
80007dd8:	0107a703          	lw	a4,16(a5)
80007ddc:	fe0706e3          	beqz	a4,80007dc8 <raw_remove+0x14>
80007de0:	feb718e3          	bne	a4,a1,80007dd0 <raw_remove+0x1c>
80007de4:	0105a703          	lw	a4,16(a1)
80007de8:	00e7a823          	sw	a4,16(a5)
80007dec:	fddff06f          	j	80007dc8 <raw_remove+0x14>

80007df0 <raw_new>:
80007df0:	ff010113          	addi	sp,sp,-16
80007df4:	800035b7          	lui	a1,0x80003
80007df8:	00912223          	sw	s1,4(sp)
80007dfc:	25a00613          	li	a2,602
80007e00:	00050493          	mv	s1,a0
80007e04:	bf458593          	addi	a1,a1,-1036 # 80002bf4 <_heap_end+0xffff0bf4>
80007e08:	00000513          	li	a0,0
80007e0c:	00812423          	sw	s0,8(sp)
80007e10:	00112623          	sw	ra,12(sp)
80007e14:	ea8fe0ef          	jal	ra,800064bc <memp_malloc_fn>
80007e18:	00050413          	mv	s0,a0
80007e1c:	02050463          	beqz	a0,80007e44 <raw_new+0x54>
80007e20:	02000613          	li	a2,32
80007e24:	00000593          	li	a1,0
80007e28:	3e5040ef          	jal	ra,8000ca0c <memset>
80007e2c:	fff00793          	li	a5,-1
80007e30:	00f405a3          	sb	a5,11(s0)
80007e34:	8d01a703          	lw	a4,-1840(gp) # 80003070 <raw_pcbs>
80007e38:	00940a23          	sb	s1,20(s0)
80007e3c:	8c81a823          	sw	s0,-1840(gp) # 80003070 <raw_pcbs>
80007e40:	00e42823          	sw	a4,16(s0)
80007e44:	00040513          	mv	a0,s0
80007e48:	00c12083          	lw	ra,12(sp)
80007e4c:	00812403          	lw	s0,8(sp)
80007e50:	00412483          	lw	s1,4(sp)
80007e54:	01010113          	addi	sp,sp,16
80007e58:	00008067          	ret

80007e5c <raw_new_ip_type>:
80007e5c:	00058513          	mv	a0,a1
80007e60:	f91ff06f          	j	80007df0 <raw_new>

80007e64 <raw_netif_ip_addr_changed>:
80007e64:	02050063          	beqz	a0,80007e84 <raw_netif_ip_addr_changed+0x20>
80007e68:	00052783          	lw	a5,0(a0)
80007e6c:	00078c63          	beqz	a5,80007e84 <raw_netif_ip_addr_changed+0x20>
80007e70:	00058a63          	beqz	a1,80007e84 <raw_netif_ip_addr_changed+0x20>
80007e74:	0005a783          	lw	a5,0(a1)
80007e78:	00078663          	beqz	a5,80007e84 <raw_netif_ip_addr_changed+0x20>
80007e7c:	8d01a783          	lw	a5,-1840(gp) # 80003070 <raw_pcbs>
80007e80:	00079463          	bnez	a5,80007e88 <raw_netif_ip_addr_changed+0x24>
80007e84:	00008067          	ret
80007e88:	0007a683          	lw	a3,0(a5)
80007e8c:	00052703          	lw	a4,0(a0)
80007e90:	00e69663          	bne	a3,a4,80007e9c <raw_netif_ip_addr_changed+0x38>
80007e94:	0005a703          	lw	a4,0(a1)
80007e98:	00e7a023          	sw	a4,0(a5)
80007e9c:	0107a783          	lw	a5,16(a5)
80007ea0:	fe1ff06f          	j	80007e80 <raw_netif_ip_addr_changed+0x1c>

80007ea4 <stats_init>:
80007ea4:	00008067          	ret

80007ea8 <sys_timeout_abs>:
80007ea8:	ff010113          	addi	sp,sp,-16
80007eac:	01212023          	sw	s2,0(sp)
80007eb0:	00058913          	mv	s2,a1
80007eb4:	800035b7          	lui	a1,0x80003
80007eb8:	00812423          	sw	s0,8(sp)
80007ebc:	00912223          	sw	s1,4(sp)
80007ec0:	00050413          	mv	s0,a0
80007ec4:	00060493          	mv	s1,a2
80007ec8:	c2058593          	addi	a1,a1,-992 # 80002c20 <_heap_end+0xffff0c20>
80007ecc:	0bc00613          	li	a2,188
80007ed0:	00300513          	li	a0,3
80007ed4:	00112623          	sw	ra,12(sp)
80007ed8:	de4fe0ef          	jal	ra,800064bc <memp_malloc_fn>
80007edc:	02050063          	beqz	a0,80007efc <sys_timeout_abs+0x54>
80007ee0:	8d81a783          	lw	a5,-1832(gp) # 80003078 <next_timeout>
80007ee4:	00052023          	sw	zero,0(a0)
80007ee8:	01252423          	sw	s2,8(a0)
80007eec:	00952623          	sw	s1,12(a0)
80007ef0:	00852223          	sw	s0,4(a0)
80007ef4:	02079063          	bnez	a5,80007f14 <sys_timeout_abs+0x6c>
80007ef8:	8ca1ac23          	sw	a0,-1832(gp) # 80003078 <next_timeout>
80007efc:	00c12083          	lw	ra,12(sp)
80007f00:	00812403          	lw	s0,8(sp)
80007f04:	00412483          	lw	s1,4(sp)
80007f08:	00012903          	lw	s2,0(sp)
80007f0c:	01010113          	addi	sp,sp,16
80007f10:	00008067          	ret
80007f14:	0047a683          	lw	a3,4(a5)
80007f18:	40d406b3          	sub	a3,s0,a3
80007f1c:	0006d863          	bgez	a3,80007f2c <sys_timeout_abs+0x84>
80007f20:	00f52023          	sw	a5,0(a0)
80007f24:	fd5ff06f          	j	80007ef8 <sys_timeout_abs+0x50>
80007f28:	00070793          	mv	a5,a4
80007f2c:	0007a703          	lw	a4,0(a5)
80007f30:	00070863          	beqz	a4,80007f40 <sys_timeout_abs+0x98>
80007f34:	00472683          	lw	a3,4(a4) # 10004 <_stack_size+0xf804>
80007f38:	40d406b3          	sub	a3,s0,a3
80007f3c:	fe06d6e3          	bgez	a3,80007f28 <sys_timeout_abs+0x80>
80007f40:	00e52023          	sw	a4,0(a0)
80007f44:	00a7a023          	sw	a0,0(a5)
80007f48:	fb5ff06f          	j	80007efc <sys_timeout_abs+0x54>

80007f4c <lwip_cyclic_timer>:
80007f4c:	fe010113          	addi	sp,sp,-32
80007f50:	00112e23          	sw	ra,28(sp)
80007f54:	00452783          	lw	a5,4(a0)
80007f58:	00a12623          	sw	a0,12(sp)
80007f5c:	000780e7          	jalr	a5
80007f60:	d31fc0ef          	jal	ra,80004c90 <sys_now>
80007f64:	00c12603          	lw	a2,12(sp)
80007f68:	8d41a783          	lw	a5,-1836(gp) # 80003074 <current_timeout_due_time>
80007f6c:	00062703          	lw	a4,0(a2)
80007f70:	800085b7          	lui	a1,0x80008
80007f74:	f4c58593          	addi	a1,a1,-180 # 80007f4c <_heap_end+0xffff5f4c>
80007f78:	00f707b3          	add	a5,a4,a5
80007f7c:	40a786b3          	sub	a3,a5,a0
80007f80:	00a70533          	add	a0,a4,a0
80007f84:	0006c463          	bltz	a3,80007f8c <lwip_cyclic_timer+0x40>
80007f88:	00078513          	mv	a0,a5
80007f8c:	01c12083          	lw	ra,28(sp)
80007f90:	02010113          	addi	sp,sp,32
80007f94:	f15ff06f          	j	80007ea8 <sys_timeout_abs>

80007f98 <sys_timeout>:
80007f98:	fe010113          	addi	sp,sp,-32
80007f9c:	00812c23          	sw	s0,24(sp)
80007fa0:	00112e23          	sw	ra,28(sp)
80007fa4:	00050413          	mv	s0,a0
80007fa8:	00b12623          	sw	a1,12(sp)
80007fac:	00c12423          	sw	a2,8(sp)
80007fb0:	ce1fc0ef          	jal	ra,80004c90 <sys_now>
80007fb4:	00850533          	add	a0,a0,s0
80007fb8:	01812403          	lw	s0,24(sp)
80007fbc:	00812603          	lw	a2,8(sp)
80007fc0:	00c12583          	lw	a1,12(sp)
80007fc4:	01c12083          	lw	ra,28(sp)
80007fc8:	02010113          	addi	sp,sp,32
80007fcc:	eddff06f          	j	80007ea8 <sys_timeout_abs>

80007fd0 <sys_timeouts_init>:
80007fd0:	ff010113          	addi	sp,sp,-16
80007fd4:	00812423          	sw	s0,8(sp)
80007fd8:	80003637          	lui	a2,0x80003
80007fdc:	80008437          	lui	s0,0x80008
80007fe0:	00912223          	sw	s1,4(sp)
80007fe4:	f4c40593          	addi	a1,s0,-180 # 80007f4c <_heap_end+0xffff5f4c>
80007fe8:	c0860493          	addi	s1,a2,-1016 # 80002c08 <_heap_end+0xffff0c08>
80007fec:	3e800513          	li	a0,1000
80007ff0:	c0860613          	addi	a2,a2,-1016
80007ff4:	00112623          	sw	ra,12(sp)
80007ff8:	fa1ff0ef          	jal	ra,80007f98 <sys_timeout>
80007ffc:	0000f537          	lui	a0,0xf
80008000:	00848613          	addi	a2,s1,8
80008004:	f4c40593          	addi	a1,s0,-180
80008008:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
8000800c:	f8dff0ef          	jal	ra,80007f98 <sys_timeout>
80008010:	f4c40593          	addi	a1,s0,-180
80008014:	00812403          	lw	s0,8(sp)
80008018:	00c12083          	lw	ra,12(sp)
8000801c:	01048613          	addi	a2,s1,16
80008020:	00412483          	lw	s1,4(sp)
80008024:	1f400513          	li	a0,500
80008028:	01010113          	addi	sp,sp,16
8000802c:	f6dff06f          	j	80007f98 <sys_timeout>

80008030 <sys_untimeout>:
80008030:	8d81a783          	lw	a5,-1832(gp) # 80003078 <next_timeout>
80008034:	00070693          	mv	a3,a4
80008038:	00000613          	li	a2,0
8000803c:	00079e63          	bnez	a5,80008058 <sys_untimeout+0x28>
80008040:	00008067          	ret
80008044:	00e62023          	sw	a4,0(a2)
80008048:	02c0006f          	j	80008074 <sys_untimeout+0x44>
8000804c:	00078613          	mv	a2,a5
80008050:	fe0708e3          	beqz	a4,80008040 <sys_untimeout+0x10>
80008054:	00070793          	mv	a5,a4
80008058:	0087a803          	lw	a6,8(a5)
8000805c:	0007a703          	lw	a4,0(a5)
80008060:	fea816e3          	bne	a6,a0,8000804c <sys_untimeout+0x1c>
80008064:	00c7a803          	lw	a6,12(a5)
80008068:	feb812e3          	bne	a6,a1,8000804c <sys_untimeout+0x1c>
8000806c:	fc061ce3          	bnez	a2,80008044 <sys_untimeout+0x14>
80008070:	8ce1ac23          	sw	a4,-1832(gp) # 80003078 <next_timeout>
80008074:	00078593          	mv	a1,a5
80008078:	00300513          	li	a0,3
8000807c:	c78fe06f          	j	800064f4 <memp_free>

80008080 <sys_check_timeouts>:
80008080:	fe010113          	addi	sp,sp,-32
80008084:	00912a23          	sw	s1,20(sp)
80008088:	01312623          	sw	s3,12(sp)
8000808c:	01412423          	sw	s4,8(sp)
80008090:	00112e23          	sw	ra,28(sp)
80008094:	00812c23          	sw	s0,24(sp)
80008098:	01212823          	sw	s2,16(sp)
8000809c:	bf5fc0ef          	jal	ra,80004c90 <sys_now>
800080a0:	00050993          	mv	s3,a0
800080a4:	8d81a583          	lw	a1,-1832(gp) # 80003078 <next_timeout>
800080a8:	02058e63          	beqz	a1,800080e4 <sys_check_timeouts+0x64>
800080ac:	0045a783          	lw	a5,4(a1)
800080b0:	40f98733          	sub	a4,s3,a5
800080b4:	02074863          	bltz	a4,800080e4 <sys_check_timeouts+0x64>
800080b8:	0005a703          	lw	a4,0(a1)
800080bc:	0085a403          	lw	s0,8(a1)
800080c0:	00300513          	li	a0,3
800080c4:	8ce1ac23          	sw	a4,-1832(gp) # 80003078 <next_timeout>
800080c8:	00c5a903          	lw	s2,12(a1)
800080cc:	8cf1aa23          	sw	a5,-1836(gp) # 80003074 <current_timeout_due_time>
800080d0:	c24fe0ef          	jal	ra,800064f4 <memp_free>
800080d4:	fc0408e3          	beqz	s0,800080a4 <sys_check_timeouts+0x24>
800080d8:	00090513          	mv	a0,s2
800080dc:	000400e7          	jalr	s0
800080e0:	fc5ff06f          	j	800080a4 <sys_check_timeouts+0x24>
800080e4:	01c12083          	lw	ra,28(sp)
800080e8:	01812403          	lw	s0,24(sp)
800080ec:	01412483          	lw	s1,20(sp)
800080f0:	01012903          	lw	s2,16(sp)
800080f4:	00c12983          	lw	s3,12(sp)
800080f8:	00812a03          	lw	s4,8(sp)
800080fc:	02010113          	addi	sp,sp,32
80008100:	00008067          	ret

80008104 <sys_restart_timeouts>:
80008104:	ff010113          	addi	sp,sp,-16
80008108:	00812423          	sw	s0,8(sp)
8000810c:	8d81a783          	lw	a5,-1832(gp) # 80003078 <next_timeout>
80008110:	00112623          	sw	ra,12(sp)
80008114:	02078463          	beqz	a5,8000813c <sys_restart_timeouts+0x38>
80008118:	b79fc0ef          	jal	ra,80004c90 <sys_now>
8000811c:	8d81a783          	lw	a5,-1832(gp) # 80003078 <next_timeout>
80008120:	0047a703          	lw	a4,4(a5)
80008124:	40e50533          	sub	a0,a0,a4
80008128:	0047a703          	lw	a4,4(a5)
8000812c:	00a70733          	add	a4,a4,a0
80008130:	00e7a223          	sw	a4,4(a5)
80008134:	0007a783          	lw	a5,0(a5)
80008138:	fe0798e3          	bnez	a5,80008128 <sys_restart_timeouts+0x24>
8000813c:	00c12083          	lw	ra,12(sp)
80008140:	00812403          	lw	s0,8(sp)
80008144:	01010113          	addi	sp,sp,16
80008148:	00008067          	ret

8000814c <sys_timeouts_sleeptime>:
8000814c:	ff010113          	addi	sp,sp,-16
80008150:	00812423          	sw	s0,8(sp)
80008154:	8d81a783          	lw	a5,-1832(gp) # 80003078 <next_timeout>
80008158:	00112623          	sw	ra,12(sp)
8000815c:	fff00513          	li	a0,-1
80008160:	00078e63          	beqz	a5,8000817c <sys_timeouts_sleeptime+0x30>
80008164:	b2dfc0ef          	jal	ra,80004c90 <sys_now>
80008168:	8d81a783          	lw	a5,-1832(gp) # 80003078 <next_timeout>
8000816c:	0047a783          	lw	a5,4(a5)
80008170:	40a78533          	sub	a0,a5,a0
80008174:	00055463          	bgez	a0,8000817c <sys_timeouts_sleeptime+0x30>
80008178:	00000513          	li	a0,0
8000817c:	00c12083          	lw	ra,12(sp)
80008180:	00812403          	lw	s0,8(sp)
80008184:	01010113          	addi	sp,sp,16
80008188:	00008067          	ret

8000818c <udp_init>:
8000818c:	00008067          	ret

80008190 <udp_input>:
80008190:	fd010113          	addi	sp,sp,-48
80008194:	02812423          	sw	s0,40(sp)
80008198:	02112623          	sw	ra,44(sp)
8000819c:	02912223          	sw	s1,36(sp)
800081a0:	03212023          	sw	s2,32(sp)
800081a4:	01312e23          	sw	s3,28(sp)
800081a8:	01412c23          	sw	s4,24(sp)
800081ac:	01512a23          	sw	s5,20(sp)
800081b0:	01612823          	sw	s6,16(sp)
800081b4:	01712623          	sw	s7,12(sp)
800081b8:	9f418793          	addi	a5,gp,-1548 # 80003194 <lwip_stats>
800081bc:	0f47a703          	lw	a4,244(a5)
800081c0:	00170713          	addi	a4,a4,1
800081c4:	0ee7aa23          	sw	a4,244(a5)
800081c8:	00a55683          	lhu	a3,10(a0)
800081cc:	00700713          	li	a4,7
800081d0:	04d76463          	bltu	a4,a3,80008218 <udp_input+0x88>
800081d4:	1047a703          	lw	a4,260(a5)
800081d8:	00170713          	addi	a4,a4,1
800081dc:	10e7a223          	sw	a4,260(a5)
800081e0:	0fc7a703          	lw	a4,252(a5)
800081e4:	00170713          	addi	a4,a4,1
800081e8:	0ee7ae23          	sw	a4,252(a5)
800081ec:	02812403          	lw	s0,40(sp)
800081f0:	02c12083          	lw	ra,44(sp)
800081f4:	02412483          	lw	s1,36(sp)
800081f8:	02012903          	lw	s2,32(sp)
800081fc:	01c12983          	lw	s3,28(sp)
80008200:	01812a03          	lw	s4,24(sp)
80008204:	01412a83          	lw	s5,20(sp)
80008208:	01012b03          	lw	s6,16(sp)
8000820c:	00c12b83          	lw	s7,12(sp)
80008210:	03010113          	addi	sp,sp,48
80008214:	b95fe06f          	j	80006da8 <pbuf_free>
80008218:	9dc18913          	addi	s2,gp,-1572 # 8000317c <ip_data>
8000821c:	00452983          	lw	s3,4(a0)
80008220:	00050493          	mv	s1,a0
80008224:	00058b93          	mv	s7,a1
80008228:	01492503          	lw	a0,20(s2)
8000822c:	00092583          	lw	a1,0(s2)
80008230:	9f418413          	addi	s0,gp,-1548 # 80003194 <lwip_stats>
80008234:	9dc18a13          	addi	s4,gp,-1572 # 8000317c <ip_data>
80008238:	11c040ef          	jal	ra,8000c354 <ip4_addr_isbroadcast_u32>
8000823c:	0019c783          	lbu	a5,1(s3)
80008240:	00050a93          	mv	s5,a0
80008244:	0009c503          	lbu	a0,0(s3)
80008248:	00879793          	slli	a5,a5,0x8
8000824c:	00a7e533          	or	a0,a5,a0
80008250:	935fd0ef          	jal	ra,80005b84 <lwip_htons>
80008254:	0039c783          	lbu	a5,3(s3)
80008258:	00050b13          	mv	s6,a0
8000825c:	0029c503          	lbu	a0,2(s3)
80008260:	00879793          	slli	a5,a5,0x8
80008264:	00a7e533          	or	a0,a5,a0
80008268:	91dfd0ef          	jal	ra,80005b84 <lwip_htons>
8000826c:	8dc1a803          	lw	a6,-1828(gp) # 8000307c <udp_pcbs>
80008270:	00492303          	lw	t1,4(s2)
80008274:	01492683          	lw	a3,20(s2)
80008278:	01092e03          	lw	t3,16(s2)
8000827c:	00080793          	mv	a5,a6
80008280:	00000913          	li	s2,0
80008284:	00000593          	li	a1,0
80008288:	fff00893          	li	a7,-1
8000828c:	00079c63          	bnez	a5,800082a4 <udp_input+0x114>
80008290:	0a091e63          	bnez	s2,8000834c <udp_input+0x1bc>
80008294:	004ba783          	lw	a5,4(s7)
80008298:	0ad78a63          	beq	a5,a3,8000834c <udp_input+0x1bc>
8000829c:	00048513          	mv	a0,s1
800082a0:	f4dff06f          	j	800081ec <udp_input+0x5c>
800082a4:	0167d703          	lhu	a4,22(a5)
800082a8:	0ea71e63          	bne	a4,a0,800083a4 <udp_input+0x214>
800082ac:	0087ce83          	lbu	t4,8(a5)
800082b0:	000e8a63          	beqz	t4,800082c4 <udp_input+0x134>
800082b4:	03834703          	lbu	a4,56(t1)
800082b8:	00170713          	addi	a4,a4,1
800082bc:	0ff77713          	andi	a4,a4,255
800082c0:	0eee9263          	bne	t4,a4,800083a4 <udp_input+0x214>
800082c4:	0c0a8a63          	beqz	s5,80008398 <udp_input+0x208>
800082c8:	0097c703          	lbu	a4,9(a5)
800082cc:	02077713          	andi	a4,a4,32
800082d0:	0c070a63          	beqz	a4,800083a4 <udp_input+0x214>
800082d4:	0007a703          	lw	a4,0(a5)
800082d8:	00070c63          	beqz	a4,800082f0 <udp_input+0x160>
800082dc:	01168a63          	beq	a3,a7,800082f0 <udp_input+0x160>
800082e0:	008bae83          	lw	t4,8(s7)
800082e4:	00d74733          	xor	a4,a4,a3
800082e8:	01d77733          	and	a4,a4,t4
800082ec:	0a071c63          	bnez	a4,800083a4 <udp_input+0x214>
800082f0:	0147c703          	lbu	a4,20(a5)
800082f4:	00477713          	andi	a4,a4,4
800082f8:	02071463          	bnez	a4,80008320 <udp_input+0x190>
800082fc:	02090063          	beqz	s2,8000831c <udp_input+0x18c>
80008300:	020a8063          	beqz	s5,80008320 <udp_input+0x190>
80008304:	01169e63          	bne	a3,a7,80008320 <udp_input+0x190>
80008308:	004ba703          	lw	a4,4(s7)
8000830c:	00092e83          	lw	t4,0(s2)
80008310:	00ee8863          	beq	t4,a4,80008320 <udp_input+0x190>
80008314:	0007ae83          	lw	t4,0(a5)
80008318:	01d71463          	bne	a4,t4,80008320 <udp_input+0x190>
8000831c:	00078913          	mv	s2,a5
80008320:	0187d703          	lhu	a4,24(a5)
80008324:	09671063          	bne	a4,s6,800083a4 <udp_input+0x214>
80008328:	0047a703          	lw	a4,4(a5)
8000832c:	00070463          	beqz	a4,80008334 <udp_input+0x1a4>
80008330:	07c71a63          	bne	a4,t3,800083a4 <udp_input+0x214>
80008334:	06058e63          	beqz	a1,800083b0 <udp_input+0x220>
80008338:	0107a703          	lw	a4,16(a5)
8000833c:	8cf1ae23          	sw	a5,-1828(gp) # 8000307c <udp_pcbs>
80008340:	00e5a823          	sw	a4,16(a1)
80008344:	0107a823          	sw	a6,16(a5)
80008348:	00078913          	mv	s2,a5
8000834c:	0079c783          	lbu	a5,7(s3)
80008350:	0069c703          	lbu	a4,6(s3)
80008354:	00879793          	slli	a5,a5,0x8
80008358:	00e7e7b3          	or	a5,a5,a4
8000835c:	06078263          	beqz	a5,800083c0 <udp_input+0x230>
80008360:	0084d603          	lhu	a2,8(s1)
80008364:	9f018713          	addi	a4,gp,-1552 # 80003190 <ip_data+0x14>
80008368:	9ec18693          	addi	a3,gp,-1556 # 8000318c <ip_data+0x10>
8000836c:	01100593          	li	a1,17
80008370:	00048513          	mv	a0,s1
80008374:	c71fd0ef          	jal	ra,80005fe4 <ip_chksum_pseudo>
80008378:	04050463          	beqz	a0,800083c0 <udp_input+0x230>
8000837c:	10042783          	lw	a5,256(s0)
80008380:	00178793          	addi	a5,a5,1
80008384:	10f42023          	sw	a5,256(s0)
80008388:	0fc42783          	lw	a5,252(s0)
8000838c:	00178793          	addi	a5,a5,1
80008390:	0ef42e23          	sw	a5,252(s0)
80008394:	f09ff06f          	j	8000829c <udp_input+0x10c>
80008398:	0007a703          	lw	a4,0(a5)
8000839c:	f4070ae3          	beqz	a4,800082f0 <udp_input+0x160>
800083a0:	f4d708e3          	beq	a4,a3,800082f0 <udp_input+0x160>
800083a4:	00078593          	mv	a1,a5
800083a8:	0107a783          	lw	a5,16(a5)
800083ac:	ee1ff06f          	j	8000828c <udp_input+0xfc>
800083b0:	11c42703          	lw	a4,284(s0)
800083b4:	00170713          	addi	a4,a4,1
800083b8:	10e42e23          	sw	a4,284(s0)
800083bc:	f8dff06f          	j	80008348 <udp_input+0x1b8>
800083c0:	00800593          	li	a1,8
800083c4:	00048513          	mv	a0,s1
800083c8:	959fe0ef          	jal	ra,80006d20 <pbuf_remove_header>
800083cc:	fa051ee3          	bnez	a0,80008388 <udp_input+0x1f8>
800083d0:	04090663          	beqz	s2,8000841c <udp_input+0x28c>
800083d4:	01c92303          	lw	t1,28(s2)
800083d8:	ec0302e3          	beqz	t1,8000829c <udp_input+0x10c>
800083dc:	02812403          	lw	s0,40(sp)
800083e0:	02092503          	lw	a0,32(s2)
800083e4:	02c12083          	lw	ra,44(sp)
800083e8:	01c12983          	lw	s3,28(sp)
800083ec:	01812a03          	lw	s4,24(sp)
800083f0:	01412a83          	lw	s5,20(sp)
800083f4:	00c12b83          	lw	s7,12(sp)
800083f8:	000b0713          	mv	a4,s6
800083fc:	00048613          	mv	a2,s1
80008400:	01012b03          	lw	s6,16(sp)
80008404:	02412483          	lw	s1,36(sp)
80008408:	00090593          	mv	a1,s2
8000840c:	02012903          	lw	s2,32(sp)
80008410:	9ec18693          	addi	a3,gp,-1556 # 8000318c <ip_data+0x10>
80008414:	03010113          	addi	sp,sp,48
80008418:	00030067          	jr	t1
8000841c:	020a9c63          	bnez	s5,80008454 <udp_input+0x2c4>
80008420:	014a2783          	lw	a5,20(s4)
80008424:	0e000713          	li	a4,224
80008428:	0f07f793          	andi	a5,a5,240
8000842c:	02e78463          	beq	a5,a4,80008454 <udp_input+0x2c4>
80008430:	00ca5583          	lhu	a1,12(s4)
80008434:	00048513          	mv	a0,s1
80008438:	00858593          	addi	a1,a1,8
8000843c:	01059593          	slli	a1,a1,0x10
80008440:	4105d593          	srai	a1,a1,0x10
80008444:	951fe0ef          	jal	ra,80006d94 <pbuf_header_force>
80008448:	00300593          	li	a1,3
8000844c:	00048513          	mv	a0,s1
80008450:	264030ef          	jal	ra,8000b6b4 <icmp_dest_unreach>
80008454:	11042783          	lw	a5,272(s0)
80008458:	00178793          	addi	a5,a5,1
8000845c:	10f42823          	sw	a5,272(s0)
80008460:	f29ff06f          	j	80008388 <udp_input+0x1f8>

80008464 <udp_bind>:
80008464:	00059463          	bnez	a1,8000846c <udp_bind+0x8>
80008468:	84818593          	addi	a1,gp,-1976 # 80002fe8 <ip_addr_any>
8000846c:	ff000793          	li	a5,-16
80008470:	0a050463          	beqz	a0,80008518 <udp_bind+0xb4>
80008474:	8dc1a783          	lw	a5,-1828(gp) # 8000307c <udp_pcbs>
80008478:	00078693          	mv	a3,a5
8000847c:	06069063          	bnez	a3,800084dc <udp_bind+0x78>
80008480:	00000e13          	li	t3,0
80008484:	0c061463          	bnez	a2,8000854c <udp_bind+0xe8>
80008488:	800036b7          	lui	a3,0x80003
8000848c:	fa46d603          	lhu	a2,-92(a3) # 80002fa4 <_heap_end+0xffff0fa4>
80008490:	00010337          	lui	t1,0x10
80008494:	00004837          	lui	a6,0x4
80008498:	fff30313          	addi	t1,t1,-1 # ffff <_stack_size+0xf7ff>
8000849c:	04660a63          	beq	a2,t1,800084f0 <udp_bind+0x8c>
800084a0:	00160613          	addi	a2,a2,1
800084a4:	01061613          	slli	a2,a2,0x10
800084a8:	01065613          	srli	a2,a2,0x10
800084ac:	00078893          	mv	a7,a5
800084b0:	04089463          	bnez	a7,800084f8 <udp_bind+0x94>
800084b4:	fac69223          	sh	a2,-92(a3)
800084b8:	0005a783          	lw	a5,0(a1)
800084bc:	00c51b23          	sh	a2,22(a0)
800084c0:	00f52023          	sw	a5,0(a0)
800084c4:	000e1863          	bnez	t3,800084d4 <udp_bind+0x70>
800084c8:	8dc1a783          	lw	a5,-1828(gp) # 8000307c <udp_pcbs>
800084cc:	8ca1ae23          	sw	a0,-1828(gp) # 8000307c <udp_pcbs>
800084d0:	00f52823          	sw	a5,16(a0)
800084d4:	00000793          	li	a5,0
800084d8:	0400006f          	j	80008518 <udp_bind+0xb4>
800084dc:	00a68663          	beq	a3,a0,800084e8 <udp_bind+0x84>
800084e0:	0106a683          	lw	a3,16(a3)
800084e4:	f99ff06f          	j	8000847c <udp_bind+0x18>
800084e8:	00100e13          	li	t3,1
800084ec:	f99ff06f          	j	80008484 <udp_bind+0x20>
800084f0:	0000c637          	lui	a2,0xc
800084f4:	fb9ff06f          	j	800084ac <udp_bind+0x48>
800084f8:	0168de83          	lhu	t4,22(a7)
800084fc:	02ce9263          	bne	t4,a2,80008520 <udp_bind+0xbc>
80008500:	fff80813          	addi	a6,a6,-1 # 3fff <_stack_size+0x37ff>
80008504:	01081813          	slli	a6,a6,0x10
80008508:	01085813          	srli	a6,a6,0x10
8000850c:	f80818e3          	bnez	a6,8000849c <udp_bind+0x38>
80008510:	fac69223          	sh	a2,-92(a3)
80008514:	ff800793          	li	a5,-8
80008518:	00078513          	mv	a0,a5
8000851c:	00008067          	ret
80008520:	0108a883          	lw	a7,16(a7)
80008524:	f8dff06f          	j	800084b0 <udp_bind+0x4c>
80008528:	02a78063          	beq	a5,a0,80008548 <udp_bind+0xe4>
8000852c:	0167d683          	lhu	a3,22(a5)
80008530:	00c69c63          	bne	a3,a2,80008548 <udp_bind+0xe4>
80008534:	0005a803          	lw	a6,0(a1)
80008538:	0007a683          	lw	a3,0(a5)
8000853c:	fd068ce3          	beq	a3,a6,80008514 <udp_bind+0xb0>
80008540:	fc080ae3          	beqz	a6,80008514 <udp_bind+0xb0>
80008544:	fc0688e3          	beqz	a3,80008514 <udp_bind+0xb0>
80008548:	0107a783          	lw	a5,16(a5)
8000854c:	fc079ee3          	bnez	a5,80008528 <udp_bind+0xc4>
80008550:	f69ff06f          	j	800084b8 <udp_bind+0x54>

80008554 <udp_sendto_if_src>:
80008554:	fd010113          	addi	sp,sp,-48
80008558:	02912223          	sw	s1,36(sp)
8000855c:	02112623          	sw	ra,44(sp)
80008560:	02812423          	sw	s0,40(sp)
80008564:	03212023          	sw	s2,32(sp)
80008568:	01312e23          	sw	s3,28(sp)
8000856c:	01412c23          	sw	s4,24(sp)
80008570:	01512a23          	sw	s5,20(sp)
80008574:	01612823          	sw	s6,16(sp)
80008578:	01712623          	sw	s7,12(sp)
8000857c:	ff000493          	li	s1,-16
80008580:	08050263          	beqz	a0,80008604 <udp_sendto_if_src+0xb0>
80008584:	08058063          	beqz	a1,80008604 <udp_sendto_if_src+0xb0>
80008588:	06060e63          	beqz	a2,80008604 <udp_sendto_if_src+0xb0>
8000858c:	06078c63          	beqz	a5,80008604 <udp_sendto_if_src+0xb0>
80008590:	06070a63          	beqz	a4,80008604 <udp_sendto_if_src+0xb0>
80008594:	00078b13          	mv	s6,a5
80008598:	00954783          	lbu	a5,9(a0)
8000859c:	00070a13          	mv	s4,a4
800085a0:	00068b93          	mv	s7,a3
800085a4:	0207f793          	andi	a5,a5,32
800085a8:	00060a93          	mv	s5,a2
800085ac:	00058993          	mv	s3,a1
800085b0:	00050413          	mv	s0,a0
800085b4:	02078e63          	beqz	a5,800085f0 <udp_sendto_if_src+0x9c>
800085b8:	01645783          	lhu	a5,22(s0)
800085bc:	00079e63          	bnez	a5,800085d8 <udp_sendto_if_src+0x84>
800085c0:	00000613          	li	a2,0
800085c4:	00040593          	mv	a1,s0
800085c8:	00040513          	mv	a0,s0
800085cc:	e99ff0ef          	jal	ra,80008464 <udp_bind>
800085d0:	00050493          	mv	s1,a0
800085d4:	02051863          	bnez	a0,80008604 <udp_sendto_if_src+0xb0>
800085d8:	0089d703          	lhu	a4,8(s3)
800085dc:	000107b7          	lui	a5,0x10
800085e0:	ff778793          	addi	a5,a5,-9 # fff7 <_stack_size+0xf7f7>
800085e4:	04e7f863          	bgeu	a5,a4,80008634 <udp_sendto_if_src+0xe0>
800085e8:	fff00493          	li	s1,-1
800085ec:	0180006f          	j	80008604 <udp_sendto_if_src+0xb0>
800085f0:	00062503          	lw	a0,0(a2) # c000 <_stack_size+0xb800>
800085f4:	00070593          	mv	a1,a4
800085f8:	ffa00493          	li	s1,-6
800085fc:	559030ef          	jal	ra,8000c354 <ip4_addr_isbroadcast_u32>
80008600:	fa050ce3          	beqz	a0,800085b8 <udp_sendto_if_src+0x64>
80008604:	02c12083          	lw	ra,44(sp)
80008608:	02812403          	lw	s0,40(sp)
8000860c:	00048513          	mv	a0,s1
80008610:	02012903          	lw	s2,32(sp)
80008614:	02412483          	lw	s1,36(sp)
80008618:	01c12983          	lw	s3,28(sp)
8000861c:	01812a03          	lw	s4,24(sp)
80008620:	01412a83          	lw	s5,20(sp)
80008624:	01012b03          	lw	s6,16(sp)
80008628:	00c12b83          	lw	s7,12(sp)
8000862c:	03010113          	addi	sp,sp,48
80008630:	00008067          	ret
80008634:	00800593          	li	a1,8
80008638:	00098513          	mv	a0,s3
8000863c:	ed4fe0ef          	jal	ra,80006d10 <pbuf_add_header>
80008640:	10050063          	beqz	a0,80008740 <udp_sendto_if_src+0x1ec>
80008644:	28000613          	li	a2,640
80008648:	00800593          	li	a1,8
8000864c:	02400513          	li	a0,36
80008650:	82dfe0ef          	jal	ra,80006e7c <pbuf_alloc>
80008654:	00050913          	mv	s2,a0
80008658:	f80508e3          	beqz	a0,800085e8 <udp_sendto_if_src+0x94>
8000865c:	0089d783          	lhu	a5,8(s3)
80008660:	00078663          	beqz	a5,8000866c <udp_sendto_if_src+0x118>
80008664:	00098593          	mv	a1,s3
80008668:	b99fe0ef          	jal	ra,80007200 <pbuf_chain>
8000866c:	01645503          	lhu	a0,22(s0)
80008670:	00492483          	lw	s1,4(s2)
80008674:	d10fd0ef          	jal	ra,80005b84 <lwip_htons>
80008678:	00a48023          	sb	a0,0(s1)
8000867c:	00855513          	srli	a0,a0,0x8
80008680:	00a480a3          	sb	a0,1(s1)
80008684:	000b8513          	mv	a0,s7
80008688:	cfcfd0ef          	jal	ra,80005b84 <lwip_htons>
8000868c:	00a48123          	sb	a0,2(s1)
80008690:	00855513          	srli	a0,a0,0x8
80008694:	00a481a3          	sb	a0,3(s1)
80008698:	00048323          	sb	zero,6(s1)
8000869c:	000483a3          	sb	zero,7(s1)
800086a0:	00895503          	lhu	a0,8(s2)
800086a4:	ce0fd0ef          	jal	ra,80005b84 <lwip_htons>
800086a8:	00a48223          	sb	a0,4(s1)
800086ac:	00855513          	srli	a0,a0,0x8
800086b0:	00a482a3          	sb	a0,5(s1)
800086b4:	01444783          	lbu	a5,20(s0)
800086b8:	0017f793          	andi	a5,a5,1
800086bc:	02079a63          	bnez	a5,800086f0 <udp_sendto_if_src+0x19c>
800086c0:	00895603          	lhu	a2,8(s2)
800086c4:	000a8713          	mv	a4,s5
800086c8:	000b0693          	mv	a3,s6
800086cc:	01100593          	li	a1,17
800086d0:	00090513          	mv	a0,s2
800086d4:	911fd0ef          	jal	ra,80005fe4 <ip_chksum_pseudo>
800086d8:	00051663          	bnez	a0,800086e4 <udp_sendto_if_src+0x190>
800086dc:	00010537          	lui	a0,0x10
800086e0:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xf7ff>
800086e4:	00a48323          	sb	a0,6(s1)
800086e8:	00855513          	srli	a0,a0,0x8
800086ec:	00a483a3          	sb	a0,7(s1)
800086f0:	00c40793          	addi	a5,s0,12
800086f4:	00b44683          	lbu	a3,11(s0)
800086f8:	02fa2e23          	sw	a5,60(s4)
800086fc:	00a44703          	lbu	a4,10(s0)
80008700:	000a0813          	mv	a6,s4
80008704:	01100793          	li	a5,17
80008708:	000a8613          	mv	a2,s5
8000870c:	000b0593          	mv	a1,s6
80008710:	00090513          	mv	a0,s2
80008714:	0d1030ef          	jal	ra,8000bfe4 <ip4_output_if_src>
80008718:	020a2e23          	sw	zero,60(s4)
8000871c:	00050493          	mv	s1,a0
80008720:	01390663          	beq	s2,s3,8000872c <udp_sendto_if_src+0x1d8>
80008724:	00090513          	mv	a0,s2
80008728:	e80fe0ef          	jal	ra,80006da8 <pbuf_free>
8000872c:	9f418793          	addi	a5,gp,-1548 # 80003194 <lwip_stats>
80008730:	0f07a703          	lw	a4,240(a5)
80008734:	00170713          	addi	a4,a4,1
80008738:	0ee7a823          	sw	a4,240(a5)
8000873c:	ec9ff06f          	j	80008604 <udp_sendto_if_src+0xb0>
80008740:	00098913          	mv	s2,s3
80008744:	f29ff06f          	j	8000866c <udp_sendto_if_src+0x118>

80008748 <udp_sendto_if>:
80008748:	02050e63          	beqz	a0,80008784 <udp_sendto_if+0x3c>
8000874c:	02058c63          	beqz	a1,80008784 <udp_sendto_if+0x3c>
80008750:	02060a63          	beqz	a2,80008784 <udp_sendto_if+0x3c>
80008754:	02070863          	beqz	a4,80008784 <udp_sendto_if+0x3c>
80008758:	00052783          	lw	a5,0(a0)
8000875c:	00078863          	beqz	a5,8000876c <udp_sendto_if+0x24>
80008760:	0f07f813          	andi	a6,a5,240
80008764:	0e000893          	li	a7,224
80008768:	01181663          	bne	a6,a7,80008774 <udp_sendto_if+0x2c>
8000876c:	00470793          	addi	a5,a4,4
80008770:	de5ff06f          	j	80008554 <udp_sendto_if_src>
80008774:	00472803          	lw	a6,4(a4)
80008778:	01079a63          	bne	a5,a6,8000878c <udp_sendto_if+0x44>
8000877c:	00050793          	mv	a5,a0
80008780:	ff1ff06f          	j	80008770 <udp_sendto_if+0x28>
80008784:	ff000513          	li	a0,-16
80008788:	00008067          	ret
8000878c:	ffc00513          	li	a0,-4
80008790:	00008067          	ret

80008794 <udp_sendto>:
80008794:	0a050863          	beqz	a0,80008844 <udp_sendto+0xb0>
80008798:	0a058663          	beqz	a1,80008844 <udp_sendto+0xb0>
8000879c:	0a060463          	beqz	a2,80008844 <udp_sendto+0xb0>
800087a0:	fe010113          	addi	sp,sp,-32
800087a4:	00812c23          	sw	s0,24(sp)
800087a8:	00912a23          	sw	s1,20(sp)
800087ac:	01212823          	sw	s2,16(sp)
800087b0:	01312623          	sw	s3,12(sp)
800087b4:	00112e23          	sw	ra,28(sp)
800087b8:	00050413          	mv	s0,a0
800087bc:	00854503          	lbu	a0,8(a0)
800087c0:	00068993          	mv	s3,a3
800087c4:	00060493          	mv	s1,a2
800087c8:	00058913          	mv	s2,a1
800087cc:	02050e63          	beqz	a0,80008808 <udp_sendto+0x74>
800087d0:	a9cfe0ef          	jal	ra,80006a6c <netif_get_by_index>
800087d4:	04051063          	bnez	a0,80008814 <udp_sendto+0x80>
800087d8:	9f418793          	addi	a5,gp,-1548 # 80003194 <lwip_stats>
800087dc:	10c7a703          	lw	a4,268(a5)
800087e0:	ffc00513          	li	a0,-4
800087e4:	00170713          	addi	a4,a4,1
800087e8:	10e7a623          	sw	a4,268(a5)
800087ec:	01c12083          	lw	ra,28(sp)
800087f0:	01812403          	lw	s0,24(sp)
800087f4:	01412483          	lw	s1,20(sp)
800087f8:	01012903          	lw	s2,16(sp)
800087fc:	00c12983          	lw	s3,12(sp)
80008800:	02010113          	addi	sp,sp,32
80008804:	00008067          	ret
80008808:	00060513          	mv	a0,a2
8000880c:	384030ef          	jal	ra,8000bb90 <ip4_route>
80008810:	fc5ff06f          	j	800087d4 <udp_sendto+0x40>
80008814:	00050713          	mv	a4,a0
80008818:	00040513          	mv	a0,s0
8000881c:	01812403          	lw	s0,24(sp)
80008820:	01c12083          	lw	ra,28(sp)
80008824:	00098693          	mv	a3,s3
80008828:	00048613          	mv	a2,s1
8000882c:	00c12983          	lw	s3,12(sp)
80008830:	01412483          	lw	s1,20(sp)
80008834:	00090593          	mv	a1,s2
80008838:	01012903          	lw	s2,16(sp)
8000883c:	02010113          	addi	sp,sp,32
80008840:	f09ff06f          	j	80008748 <udp_sendto_if>
80008844:	ff000513          	li	a0,-16
80008848:	00008067          	ret

8000884c <udp_send>:
8000884c:	00050a63          	beqz	a0,80008860 <udp_send+0x14>
80008850:	00058863          	beqz	a1,80008860 <udp_send+0x14>
80008854:	01855683          	lhu	a3,24(a0)
80008858:	00450613          	addi	a2,a0,4
8000885c:	f39ff06f          	j	80008794 <udp_sendto>
80008860:	ff000513          	li	a0,-16
80008864:	00008067          	ret

80008868 <udp_bind_netif>:
80008868:	00000793          	li	a5,0
8000886c:	00058863          	beqz	a1,8000887c <udp_bind_netif+0x14>
80008870:	0385c783          	lbu	a5,56(a1)
80008874:	00178793          	addi	a5,a5,1
80008878:	0ff7f793          	andi	a5,a5,255
8000887c:	00f50423          	sb	a5,8(a0)
80008880:	00008067          	ret

80008884 <udp_connect>:
80008884:	ff000793          	li	a5,-16
80008888:	0a050063          	beqz	a0,80008928 <udp_connect+0xa4>
8000888c:	08058e63          	beqz	a1,80008928 <udp_connect+0xa4>
80008890:	ff010113          	addi	sp,sp,-16
80008894:	00812423          	sw	s0,8(sp)
80008898:	00912223          	sw	s1,4(sp)
8000889c:	01212023          	sw	s2,0(sp)
800088a0:	00112623          	sw	ra,12(sp)
800088a4:	01655783          	lhu	a5,22(a0)
800088a8:	00050413          	mv	s0,a0
800088ac:	00060913          	mv	s2,a2
800088b0:	00058493          	mv	s1,a1
800088b4:	02078c63          	beqz	a5,800088ec <udp_connect+0x68>
800088b8:	0004a783          	lw	a5,0(s1)
800088bc:	01241c23          	sh	s2,24(s0)
800088c0:	00f42223          	sw	a5,4(s0)
800088c4:	01444783          	lbu	a5,20(s0)
800088c8:	0047e793          	ori	a5,a5,4
800088cc:	00f40a23          	sb	a5,20(s0)
800088d0:	8dc1a683          	lw	a3,-1828(gp) # 8000307c <udp_pcbs>
800088d4:	00068713          	mv	a4,a3
800088d8:	04071263          	bnez	a4,8000891c <udp_connect+0x98>
800088dc:	00d42823          	sw	a3,16(s0)
800088e0:	8c81ae23          	sw	s0,-1828(gp) # 8000307c <udp_pcbs>
800088e4:	00000793          	li	a5,0
800088e8:	0180006f          	j	80008900 <udp_connect+0x7c>
800088ec:	00000613          	li	a2,0
800088f0:	00050593          	mv	a1,a0
800088f4:	b71ff0ef          	jal	ra,80008464 <udp_bind>
800088f8:	00050793          	mv	a5,a0
800088fc:	fa050ee3          	beqz	a0,800088b8 <udp_connect+0x34>
80008900:	00c12083          	lw	ra,12(sp)
80008904:	00812403          	lw	s0,8(sp)
80008908:	00412483          	lw	s1,4(sp)
8000890c:	00012903          	lw	s2,0(sp)
80008910:	00078513          	mv	a0,a5
80008914:	01010113          	addi	sp,sp,16
80008918:	00008067          	ret
8000891c:	fc8704e3          	beq	a4,s0,800088e4 <udp_connect+0x60>
80008920:	01072703          	lw	a4,16(a4)
80008924:	fb5ff06f          	j	800088d8 <udp_connect+0x54>
80008928:	00078513          	mv	a0,a5
8000892c:	00008067          	ret

80008930 <udp_disconnect>:
80008930:	00050e63          	beqz	a0,8000894c <udp_disconnect+0x1c>
80008934:	01454783          	lbu	a5,20(a0)
80008938:	00052223          	sw	zero,4(a0)
8000893c:	00051c23          	sh	zero,24(a0)
80008940:	ffb7f793          	andi	a5,a5,-5
80008944:	00050423          	sb	zero,8(a0)
80008948:	00f50a23          	sb	a5,20(a0)
8000894c:	00008067          	ret

80008950 <udp_recv>:
80008950:	00050663          	beqz	a0,8000895c <udp_recv+0xc>
80008954:	00b52e23          	sw	a1,28(a0)
80008958:	02c52023          	sw	a2,32(a0)
8000895c:	00008067          	ret

80008960 <udp_remove>:
80008960:	00050593          	mv	a1,a0
80008964:	02050e63          	beqz	a0,800089a0 <udp_remove+0x40>
80008968:	8dc1a783          	lw	a5,-1828(gp) # 8000307c <udp_pcbs>
8000896c:	00a79c63          	bne	a5,a0,80008984 <udp_remove+0x24>
80008970:	01052783          	lw	a5,16(a0)
80008974:	8cf1ae23          	sw	a5,-1828(gp) # 8000307c <udp_pcbs>
80008978:	00100513          	li	a0,1
8000897c:	b79fd06f          	j	800064f4 <memp_free>
80008980:	00070793          	mv	a5,a4
80008984:	fe078ae3          	beqz	a5,80008978 <udp_remove+0x18>
80008988:	0107a703          	lw	a4,16(a5)
8000898c:	fe0706e3          	beqz	a4,80008978 <udp_remove+0x18>
80008990:	feb718e3          	bne	a4,a1,80008980 <udp_remove+0x20>
80008994:	0105a703          	lw	a4,16(a1)
80008998:	00e7a823          	sw	a4,16(a5)
8000899c:	fddff06f          	j	80008978 <udp_remove+0x18>
800089a0:	00008067          	ret

800089a4 <udp_new>:
800089a4:	800035b7          	lui	a1,0x80003
800089a8:	ff010113          	addi	sp,sp,-16
800089ac:	4c800613          	li	a2,1224
800089b0:	c3c58593          	addi	a1,a1,-964 # 80002c3c <_heap_end+0xffff0c3c>
800089b4:	00100513          	li	a0,1
800089b8:	00812423          	sw	s0,8(sp)
800089bc:	00112623          	sw	ra,12(sp)
800089c0:	afdfd0ef          	jal	ra,800064bc <memp_malloc_fn>
800089c4:	00050413          	mv	s0,a0
800089c8:	00050c63          	beqz	a0,800089e0 <udp_new+0x3c>
800089cc:	02400613          	li	a2,36
800089d0:	00000593          	li	a1,0
800089d4:	038040ef          	jal	ra,8000ca0c <memset>
800089d8:	fff00793          	li	a5,-1
800089dc:	00f405a3          	sb	a5,11(s0)
800089e0:	00040513          	mv	a0,s0
800089e4:	00c12083          	lw	ra,12(sp)
800089e8:	00812403          	lw	s0,8(sp)
800089ec:	01010113          	addi	sp,sp,16
800089f0:	00008067          	ret

800089f4 <udp_new_ip_type>:
800089f4:	fb1ff06f          	j	800089a4 <udp_new>

800089f8 <udp_netif_ip_addr_changed>:
800089f8:	02050063          	beqz	a0,80008a18 <udp_netif_ip_addr_changed+0x20>
800089fc:	00052783          	lw	a5,0(a0)
80008a00:	00078c63          	beqz	a5,80008a18 <udp_netif_ip_addr_changed+0x20>
80008a04:	00058a63          	beqz	a1,80008a18 <udp_netif_ip_addr_changed+0x20>
80008a08:	0005a783          	lw	a5,0(a1)
80008a0c:	00078663          	beqz	a5,80008a18 <udp_netif_ip_addr_changed+0x20>
80008a10:	8dc1a783          	lw	a5,-1828(gp) # 8000307c <udp_pcbs>
80008a14:	00079463          	bnez	a5,80008a1c <udp_netif_ip_addr_changed+0x24>
80008a18:	00008067          	ret
80008a1c:	0007a683          	lw	a3,0(a5)
80008a20:	00052703          	lw	a4,0(a0)
80008a24:	00e69663          	bne	a3,a4,80008a30 <udp_netif_ip_addr_changed+0x38>
80008a28:	0005a703          	lw	a4,0(a1)
80008a2c:	00e7a023          	sw	a4,0(a5)
80008a30:	0107a783          	lw	a5,16(a5)
80008a34:	fe1ff06f          	j	80008a14 <udp_netif_ip_addr_changed+0x1c>

80008a38 <dhcp_set_state>:
80008a38:	00554783          	lbu	a5,5(a0)
80008a3c:	00b78863          	beq	a5,a1,80008a4c <dhcp_set_state+0x14>
80008a40:	00b502a3          	sb	a1,5(a0)
80008a44:	00050323          	sb	zero,6(a0)
80008a48:	00051423          	sh	zero,8(a0)
80008a4c:	00008067          	ret

80008a50 <dhcp_option_short>:
80008a50:	00a587b3          	add	a5,a1,a0
80008a54:	00865713          	srli	a4,a2,0x8
80008a58:	00e78023          	sb	a4,0(a5)
80008a5c:	00150793          	addi	a5,a0,1
80008a60:	01079793          	slli	a5,a5,0x10
80008a64:	0107d793          	srli	a5,a5,0x10
80008a68:	00250513          	addi	a0,a0,2
80008a6c:	00f585b3          	add	a1,a1,a5
80008a70:	01051513          	slli	a0,a0,0x10
80008a74:	00c58023          	sb	a2,0(a1)
80008a78:	01055513          	srli	a0,a0,0x10
80008a7c:	00008067          	ret

80008a80 <dhcp_option_long>:
80008a80:	00a587b3          	add	a5,a1,a0
80008a84:	01865713          	srli	a4,a2,0x18
80008a88:	00e78023          	sb	a4,0(a5)
80008a8c:	00150793          	addi	a5,a0,1
80008a90:	01079793          	slli	a5,a5,0x10
80008a94:	0107d793          	srli	a5,a5,0x10
80008a98:	00f587b3          	add	a5,a1,a5
80008a9c:	01065713          	srli	a4,a2,0x10
80008aa0:	00e78023          	sb	a4,0(a5)
80008aa4:	00250793          	addi	a5,a0,2
80008aa8:	01079793          	slli	a5,a5,0x10
80008aac:	0107d793          	srli	a5,a5,0x10
80008ab0:	00f587b3          	add	a5,a1,a5
80008ab4:	00865713          	srli	a4,a2,0x8
80008ab8:	00e78023          	sb	a4,0(a5)
80008abc:	00350793          	addi	a5,a0,3
80008ac0:	01079793          	slli	a5,a5,0x10
80008ac4:	0107d793          	srli	a5,a5,0x10
80008ac8:	00450513          	addi	a0,a0,4
80008acc:	00f585b3          	add	a1,a1,a5
80008ad0:	01051513          	slli	a0,a0,0x10
80008ad4:	00c58023          	sb	a2,0(a1)
80008ad8:	01055513          	srli	a0,a0,0x10
80008adc:	00008067          	ret

80008ae0 <dhcp_create_msg>:
80008ae0:	fe010113          	addi	sp,sp,-32
80008ae4:	00112e23          	sw	ra,28(sp)
80008ae8:	00812c23          	sw	s0,24(sp)
80008aec:	00912a23          	sw	s1,20(sp)
80008af0:	01212823          	sw	s2,16(sp)
80008af4:	01312623          	sw	s3,12(sp)
80008af8:	01412423          	sw	s4,8(sp)
80008afc:	01512223          	sw	s5,4(sp)
80008b00:	01612023          	sw	s6,0(sp)
80008b04:	02051a63          	bnez	a0,80008b38 <dhcp_create_msg+0x58>
80008b08:	00000a93          	li	s5,0
80008b0c:	01c12083          	lw	ra,28(sp)
80008b10:	01812403          	lw	s0,24(sp)
80008b14:	000a8513          	mv	a0,s5
80008b18:	01412483          	lw	s1,20(sp)
80008b1c:	01012903          	lw	s2,16(sp)
80008b20:	00c12983          	lw	s3,12(sp)
80008b24:	00812a03          	lw	s4,8(sp)
80008b28:	00412a83          	lw	s5,4(sp)
80008b2c:	00012b03          	lw	s6,0(sp)
80008b30:	02010113          	addi	sp,sp,32
80008b34:	00008067          	ret
80008b38:	fc0588e3          	beqz	a1,80008b08 <dhcp_create_msg+0x28>
80008b3c:	00060913          	mv	s2,a2
80008b40:	00058993          	mv	s3,a1
80008b44:	00050493          	mv	s1,a0
80008b48:	28000613          	li	a2,640
80008b4c:	13400593          	li	a1,308
80008b50:	03800513          	li	a0,56
80008b54:	00068a13          	mv	s4,a3
80008b58:	b24fe0ef          	jal	ra,80006e7c <pbuf_alloc>
80008b5c:	00050a93          	mv	s5,a0
80008b60:	fa0504e3          	beqz	a0,80008b08 <dhcp_create_msg+0x28>
80008b64:	00300793          	li	a5,3
80008b68:	00f91663          	bne	s2,a5,80008b74 <dhcp_create_msg+0x94>
80008b6c:	0059c783          	lbu	a5,5(s3)
80008b70:	03279063          	bne	a5,s2,80008b90 <dhcp_create_msg+0xb0>
80008b74:	0069c703          	lbu	a4,6(s3)
80008b78:	00071863          	bnez	a4,80008b88 <dhcp_create_msg+0xa8>
80008b7c:	8081a703          	lw	a4,-2040(gp) # 80002fa8 <xid.4812>
80008b80:	00170713          	addi	a4,a4,1
80008b84:	80e1a423          	sw	a4,-2040(gp) # 80002fa8 <xid.4812>
80008b88:	8081a783          	lw	a5,-2040(gp) # 80002fa8 <xid.4812>
80008b8c:	00f9a023          	sw	a5,0(s3)
80008b90:	004aa403          	lw	s0,4(s5)
80008b94:	13400613          	li	a2,308
80008b98:	00000593          	li	a1,0
80008b9c:	00100b13          	li	s6,1
80008ba0:	00040513          	mv	a0,s0
80008ba4:	669030ef          	jal	ra,8000ca0c <memset>
80008ba8:	01640023          	sb	s6,0(s0)
80008bac:	016400a3          	sb	s6,1(s0)
80008bb0:	0344c783          	lbu	a5,52(s1)
80008bb4:	00f40123          	sb	a5,2(s0)
80008bb8:	0009a503          	lw	a0,0(s3)
80008bbc:	fe1fc0ef          	jal	ra,80005b9c <lwip_htonl>
80008bc0:	00855793          	srli	a5,a0,0x8
80008bc4:	00a40223          	sb	a0,4(s0)
80008bc8:	00f402a3          	sb	a5,5(s0)
80008bcc:	01055793          	srli	a5,a0,0x10
80008bd0:	01855513          	srli	a0,a0,0x18
80008bd4:	00f40323          	sb	a5,6(s0)
80008bd8:	00a403a3          	sb	a0,7(s0)
80008bdc:	00400793          	li	a5,4
80008be0:	02f90463          	beq	s2,a5,80008c08 <dhcp_create_msg+0x128>
80008be4:	ff990793          	addi	a5,s2,-7
80008be8:	0ff7f793          	andi	a5,a5,255
80008bec:	00fb7e63          	bgeu	s6,a5,80008c08 <dhcp_create_msg+0x128>
80008bf0:	00300793          	li	a5,3
80008bf4:	02f91a63          	bne	s2,a5,80008c28 <dhcp_create_msg+0x148>
80008bf8:	0059c783          	lbu	a5,5(s3)
80008bfc:	ffc78793          	addi	a5,a5,-4
80008c00:	0ff7f793          	andi	a5,a5,255
80008c04:	02fb6263          	bltu	s6,a5,80008c28 <dhcp_create_msg+0x148>
80008c08:	0044a783          	lw	a5,4(s1)
80008c0c:	0087d713          	srli	a4,a5,0x8
80008c10:	00f40623          	sb	a5,12(s0)
80008c14:	00e406a3          	sb	a4,13(s0)
80008c18:	0107d713          	srli	a4,a5,0x10
80008c1c:	0187d793          	srli	a5,a5,0x18
80008c20:	00e40723          	sb	a4,14(s0)
80008c24:	00f407a3          	sb	a5,15(s0)
80008c28:	02e48793          	addi	a5,s1,46
80008c2c:	01c40713          	addi	a4,s0,28
80008c30:	03448493          	addi	s1,s1,52
80008c34:	0007c683          	lbu	a3,0(a5)
80008c38:	00178793          	addi	a5,a5,1
80008c3c:	00170713          	addi	a4,a4,1
80008c40:	fed70fa3          	sb	a3,-1(a4)
80008c44:	fe9798e3          	bne	a5,s1,80008c34 <dhcp_create_msg+0x154>
80008c48:	06300793          	li	a5,99
80008c4c:	0ef40623          	sb	a5,236(s0)
80008c50:	f8200713          	li	a4,-126
80008c54:	0ef407a3          	sb	a5,239(s0)
80008c58:	03500793          	li	a5,53
80008c5c:	0ee406a3          	sb	a4,237(s0)
80008c60:	0ef40823          	sb	a5,240(s0)
80008c64:	05300713          	li	a4,83
80008c68:	00100793          	li	a5,1
80008c6c:	0ef408a3          	sb	a5,241(s0)
80008c70:	0ee40723          	sb	a4,238(s0)
80008c74:	0f240923          	sb	s2,242(s0)
80008c78:	00300793          	li	a5,3
80008c7c:	00fa1023          	sh	a5,0(s4)
80008c80:	e8dff06f          	j	80008b0c <dhcp_create_msg+0x2c>

80008c84 <dhcp_option_trailer>:
80008c84:	00150793          	addi	a5,a0,1
80008c88:	01079793          	slli	a5,a5,0x10
80008c8c:	00a58733          	add	a4,a1,a0
80008c90:	0107d793          	srli	a5,a5,0x10
80008c94:	fff00693          	li	a3,-1
80008c98:	00d70023          	sb	a3,0(a4)
80008c9c:	00f585b3          	add	a1,a1,a5
80008ca0:	04300713          	li	a4,67
80008ca4:	00f77c63          	bgeu	a4,a5,80008cbc <dhcp_option_trailer+0x38>
80008ca8:	0f078593          	addi	a1,a5,240
80008cac:	01059593          	slli	a1,a1,0x10
80008cb0:	0105d593          	srli	a1,a1,0x10
80008cb4:	00060513          	mv	a0,a2
80008cb8:	b94fe06f          	j	8000704c <pbuf_realloc>
80008cbc:	00178793          	addi	a5,a5,1
80008cc0:	01079793          	slli	a5,a5,0x10
80008cc4:	00058023          	sb	zero,0(a1)
80008cc8:	0107d793          	srli	a5,a5,0x10
80008ccc:	00158593          	addi	a1,a1,1
80008cd0:	fd5ff06f          	j	80008ca4 <dhcp_option_trailer+0x20>

80008cd4 <dhcp_reboot>:
80008cd4:	fd010113          	addi	sp,sp,-48
80008cd8:	02112623          	sw	ra,44(sp)
80008cdc:	02812423          	sw	s0,40(sp)
80008ce0:	03212023          	sw	s2,32(sp)
80008ce4:	02912223          	sw	s1,36(sp)
80008ce8:	01312e23          	sw	s3,28(sp)
80008cec:	01412c23          	sw	s4,24(sp)
80008cf0:	02852483          	lw	s1,40(a0)
80008cf4:	00050913          	mv	s2,a0
80008cf8:	00300593          	li	a1,3
80008cfc:	00048513          	mv	a0,s1
80008d00:	d39ff0ef          	jal	ra,80008a38 <dhcp_set_state>
80008d04:	00e10693          	addi	a3,sp,14
80008d08:	00300613          	li	a2,3
80008d0c:	00048593          	mv	a1,s1
80008d10:	00090513          	mv	a0,s2
80008d14:	dcdff0ef          	jal	ra,80008ae0 <dhcp_create_msg>
80008d18:	fff00413          	li	s0,-1
80008d1c:	14050663          	beqz	a0,80008e68 <dhcp_reboot+0x194>
80008d20:	00452403          	lw	s0,4(a0)
80008d24:	00e15783          	lhu	a5,14(sp)
80008d28:	00050993          	mv	s3,a0
80008d2c:	0f040413          	addi	s0,s0,240
80008d30:	00f40733          	add	a4,s0,a5
80008d34:	00278513          	addi	a0,a5,2
80008d38:	00178793          	addi	a5,a5,1
80008d3c:	01079793          	slli	a5,a5,0x10
80008d40:	03900693          	li	a3,57
80008d44:	0107d793          	srli	a5,a5,0x10
80008d48:	00d70023          	sb	a3,0(a4)
80008d4c:	00f407b3          	add	a5,s0,a5
80008d50:	00200713          	li	a4,2
80008d54:	01051513          	slli	a0,a0,0x10
80008d58:	00e78023          	sb	a4,0(a5)
80008d5c:	00040593          	mv	a1,s0
80008d60:	24000613          	li	a2,576
80008d64:	01055513          	srli	a0,a0,0x10
80008d68:	00a11723          	sh	a0,14(sp)
80008d6c:	ce5ff0ef          	jal	ra,80008a50 <dhcp_option_short>
80008d70:	00a407b3          	add	a5,s0,a0
80008d74:	00250a13          	addi	s4,a0,2
80008d78:	00150513          	addi	a0,a0,1
80008d7c:	01051513          	slli	a0,a0,0x10
80008d80:	03200713          	li	a4,50
80008d84:	01055513          	srli	a0,a0,0x10
80008d88:	00e78023          	sb	a4,0(a5)
80008d8c:	00a40533          	add	a0,s0,a0
80008d90:	00400793          	li	a5,4
80008d94:	00f50023          	sb	a5,0(a0)
80008d98:	01c4a503          	lw	a0,28(s1)
80008d9c:	010a1a13          	slli	s4,s4,0x10
80008da0:	010a5a13          	srli	s4,s4,0x10
80008da4:	01411723          	sh	s4,14(sp)
80008da8:	df5fc0ef          	jal	ra,80005b9c <lwip_htonl>
80008dac:	00050613          	mv	a2,a0
80008db0:	00040593          	mv	a1,s0
80008db4:	000a0513          	mv	a0,s4
80008db8:	cc9ff0ef          	jal	ra,80008a80 <dhcp_option_long>
80008dbc:	00a40733          	add	a4,s0,a0
80008dc0:	03700693          	li	a3,55
80008dc4:	00d70023          	sb	a3,0(a4)
80008dc8:	00150713          	addi	a4,a0,1
80008dcc:	01071713          	slli	a4,a4,0x10
80008dd0:	01075713          	srli	a4,a4,0x10
80008dd4:	00300693          	li	a3,3
80008dd8:	00e40733          	add	a4,s0,a4
80008ddc:	00d70023          	sb	a3,0(a4)
80008de0:	00250713          	addi	a4,a0,2
80008de4:	01071713          	slli	a4,a4,0x10
80008de8:	01075713          	srli	a4,a4,0x10
80008dec:	00e40733          	add	a4,s0,a4
80008df0:	00100613          	li	a2,1
80008df4:	00c70023          	sb	a2,0(a4)
80008df8:	00050793          	mv	a5,a0
80008dfc:	00350713          	addi	a4,a0,3
80008e00:	01071713          	slli	a4,a4,0x10
80008e04:	00478793          	addi	a5,a5,4
80008e08:	01075713          	srli	a4,a4,0x10
80008e0c:	01079793          	slli	a5,a5,0x10
80008e10:	00e40733          	add	a4,s0,a4
80008e14:	00550513          	addi	a0,a0,5
80008e18:	0107d793          	srli	a5,a5,0x10
80008e1c:	00d70023          	sb	a3,0(a4)
80008e20:	00f407b3          	add	a5,s0,a5
80008e24:	01c00713          	li	a4,28
80008e28:	01051513          	slli	a0,a0,0x10
80008e2c:	00e78023          	sb	a4,0(a5)
80008e30:	01055513          	srli	a0,a0,0x10
80008e34:	00040593          	mv	a1,s0
80008e38:	00098613          	mv	a2,s3
80008e3c:	00a11723          	sh	a0,14(sp)
80008e40:	e45ff0ef          	jal	ra,80008c84 <dhcp_option_trailer>
80008e44:	8e41a503          	lw	a0,-1820(gp) # 80003084 <dhcp_pcb>
80008e48:	00090713          	mv	a4,s2
80008e4c:	04300693          	li	a3,67
80008e50:	84418613          	addi	a2,gp,-1980 # 80002fe4 <ip_addr_broadcast>
80008e54:	00098593          	mv	a1,s3
80008e58:	8f1ff0ef          	jal	ra,80008748 <udp_sendto_if>
80008e5c:	00050413          	mv	s0,a0
80008e60:	00098513          	mv	a0,s3
80008e64:	f45fd0ef          	jal	ra,80006da8 <pbuf_free>
80008e68:	0064c783          	lbu	a5,6(s1)
80008e6c:	0ff00713          	li	a4,255
80008e70:	00e78663          	beq	a5,a4,80008e7c <dhcp_reboot+0x1a8>
80008e74:	00178793          	addi	a5,a5,1
80008e78:	00f48323          	sb	a5,6(s1)
80008e7c:	0064c503          	lbu	a0,6(s1)
80008e80:	00900793          	li	a5,9
80008e84:	04a7ea63          	bltu	a5,a0,80008ed8 <dhcp_reboot+0x204>
80008e88:	00551793          	slli	a5,a0,0x5
80008e8c:	40a787b3          	sub	a5,a5,a0
80008e90:	00279793          	slli	a5,a5,0x2
80008e94:	00f50533          	add	a0,a0,a5
80008e98:	00351513          	slli	a0,a0,0x3
80008e9c:	01051513          	slli	a0,a0,0x10
80008ea0:	01055513          	srli	a0,a0,0x10
80008ea4:	1f400593          	li	a1,500
80008ea8:	1f350513          	addi	a0,a0,499
80008eac:	268040ef          	jal	ra,8000d114 <__divsi3>
80008eb0:	00a49423          	sh	a0,8(s1)
80008eb4:	02c12083          	lw	ra,44(sp)
80008eb8:	00040513          	mv	a0,s0
80008ebc:	02812403          	lw	s0,40(sp)
80008ec0:	02412483          	lw	s1,36(sp)
80008ec4:	02012903          	lw	s2,32(sp)
80008ec8:	01c12983          	lw	s3,28(sp)
80008ecc:	01812a03          	lw	s4,24(sp)
80008ed0:	03010113          	addi	sp,sp,48
80008ed4:	00008067          	ret
80008ed8:	00002537          	lui	a0,0x2
80008edc:	71050513          	addi	a0,a0,1808 # 2710 <_stack_size+0x1f10>
80008ee0:	fc5ff06f          	j	80008ea4 <dhcp_reboot+0x1d0>

80008ee4 <dhcp_select>:
80008ee4:	fd010113          	addi	sp,sp,-48
80008ee8:	02812423          	sw	s0,40(sp)
80008eec:	02112623          	sw	ra,44(sp)
80008ef0:	02912223          	sw	s1,36(sp)
80008ef4:	03212023          	sw	s2,32(sp)
80008ef8:	01312e23          	sw	s3,28(sp)
80008efc:	01412c23          	sw	s4,24(sp)
80008f00:	01512a23          	sw	s5,20(sp)
80008f04:	ff000413          	li	s0,-16
80008f08:	22050263          	beqz	a0,8000912c <dhcp_select+0x248>
80008f0c:	02852483          	lw	s1,40(a0)
80008f10:	ffa00413          	li	s0,-6
80008f14:	20048c63          	beqz	s1,8000912c <dhcp_select+0x248>
80008f18:	00050913          	mv	s2,a0
80008f1c:	00100593          	li	a1,1
80008f20:	00048513          	mv	a0,s1
80008f24:	b15ff0ef          	jal	ra,80008a38 <dhcp_set_state>
80008f28:	00e10693          	addi	a3,sp,14
80008f2c:	00300613          	li	a2,3
80008f30:	00048593          	mv	a1,s1
80008f34:	00090513          	mv	a0,s2
80008f38:	ba9ff0ef          	jal	ra,80008ae0 <dhcp_create_msg>
80008f3c:	00050993          	mv	s3,a0
80008f40:	fff00413          	li	s0,-1
80008f44:	18050a63          	beqz	a0,800090d8 <dhcp_select+0x1f4>
80008f48:	00452403          	lw	s0,4(a0)
80008f4c:	00e15783          	lhu	a5,14(sp)
80008f50:	03900693          	li	a3,57
80008f54:	0f040413          	addi	s0,s0,240
80008f58:	00f40733          	add	a4,s0,a5
80008f5c:	00278513          	addi	a0,a5,2
80008f60:	00178793          	addi	a5,a5,1
80008f64:	01079793          	slli	a5,a5,0x10
80008f68:	0107d793          	srli	a5,a5,0x10
80008f6c:	00d70023          	sb	a3,0(a4)
80008f70:	00f407b3          	add	a5,s0,a5
80008f74:	00200713          	li	a4,2
80008f78:	00e78023          	sb	a4,0(a5)
80008f7c:	02c95603          	lhu	a2,44(s2)
80008f80:	01051513          	slli	a0,a0,0x10
80008f84:	00040593          	mv	a1,s0
80008f88:	01055513          	srli	a0,a0,0x10
80008f8c:	00a11723          	sh	a0,14(sp)
80008f90:	ac1ff0ef          	jal	ra,80008a50 <dhcp_option_short>
80008f94:	00a407b3          	add	a5,s0,a0
80008f98:	03200713          	li	a4,50
80008f9c:	00e78023          	sb	a4,0(a5)
80008fa0:	00150793          	addi	a5,a0,1
80008fa4:	01079793          	slli	a5,a5,0x10
80008fa8:	0107d793          	srli	a5,a5,0x10
80008fac:	00f407b3          	add	a5,s0,a5
80008fb0:	00400a93          	li	s5,4
80008fb4:	01578023          	sb	s5,0(a5)
80008fb8:	00250a13          	addi	s4,a0,2
80008fbc:	01c4a503          	lw	a0,28(s1)
80008fc0:	010a1a13          	slli	s4,s4,0x10
80008fc4:	010a5a13          	srli	s4,s4,0x10
80008fc8:	01411723          	sh	s4,14(sp)
80008fcc:	bd1fc0ef          	jal	ra,80005b9c <lwip_htonl>
80008fd0:	00050613          	mv	a2,a0
80008fd4:	00040593          	mv	a1,s0
80008fd8:	000a0513          	mv	a0,s4
80008fdc:	aa5ff0ef          	jal	ra,80008a80 <dhcp_option_long>
80008fe0:	00a407b3          	add	a5,s0,a0
80008fe4:	03600713          	li	a4,54
80008fe8:	00e78023          	sb	a4,0(a5)
80008fec:	00150793          	addi	a5,a0,1
80008ff0:	01079793          	slli	a5,a5,0x10
80008ff4:	0107d793          	srli	a5,a5,0x10
80008ff8:	00f407b3          	add	a5,s0,a5
80008ffc:	01578023          	sb	s5,0(a5)
80009000:	00250a13          	addi	s4,a0,2
80009004:	0184a503          	lw	a0,24(s1)
80009008:	010a1a13          	slli	s4,s4,0x10
8000900c:	010a5a13          	srli	s4,s4,0x10
80009010:	01411723          	sh	s4,14(sp)
80009014:	b89fc0ef          	jal	ra,80005b9c <lwip_htonl>
80009018:	00050613          	mv	a2,a0
8000901c:	00040593          	mv	a1,s0
80009020:	000a0513          	mv	a0,s4
80009024:	a5dff0ef          	jal	ra,80008a80 <dhcp_option_long>
80009028:	00a40733          	add	a4,s0,a0
8000902c:	03700693          	li	a3,55
80009030:	00d70023          	sb	a3,0(a4)
80009034:	00150713          	addi	a4,a0,1
80009038:	01071713          	slli	a4,a4,0x10
8000903c:	01075713          	srli	a4,a4,0x10
80009040:	00300693          	li	a3,3
80009044:	00e40733          	add	a4,s0,a4
80009048:	00d70023          	sb	a3,0(a4)
8000904c:	00250713          	addi	a4,a0,2
80009050:	01071713          	slli	a4,a4,0x10
80009054:	01075713          	srli	a4,a4,0x10
80009058:	00e40733          	add	a4,s0,a4
8000905c:	00100613          	li	a2,1
80009060:	00c70023          	sb	a2,0(a4)
80009064:	00050793          	mv	a5,a0
80009068:	00350713          	addi	a4,a0,3
8000906c:	01071713          	slli	a4,a4,0x10
80009070:	00478793          	addi	a5,a5,4
80009074:	01075713          	srli	a4,a4,0x10
80009078:	01079793          	slli	a5,a5,0x10
8000907c:	00e40733          	add	a4,s0,a4
80009080:	00550513          	addi	a0,a0,5
80009084:	0107d793          	srli	a5,a5,0x10
80009088:	00d70023          	sb	a3,0(a4)
8000908c:	00f407b3          	add	a5,s0,a5
80009090:	01c00713          	li	a4,28
80009094:	01051513          	slli	a0,a0,0x10
80009098:	00e78023          	sb	a4,0(a5)
8000909c:	01055513          	srli	a0,a0,0x10
800090a0:	00040593          	mv	a1,s0
800090a4:	00098613          	mv	a2,s3
800090a8:	00a11723          	sh	a0,14(sp)
800090ac:	bd9ff0ef          	jal	ra,80008c84 <dhcp_option_trailer>
800090b0:	8e41a503          	lw	a0,-1820(gp) # 80003084 <dhcp_pcb>
800090b4:	84818793          	addi	a5,gp,-1976 # 80002fe8 <ip_addr_any>
800090b8:	00090713          	mv	a4,s2
800090bc:	04300693          	li	a3,67
800090c0:	84418613          	addi	a2,gp,-1980 # 80002fe4 <ip_addr_broadcast>
800090c4:	00098593          	mv	a1,s3
800090c8:	c8cff0ef          	jal	ra,80008554 <udp_sendto_if_src>
800090cc:	00050413          	mv	s0,a0
800090d0:	00098513          	mv	a0,s3
800090d4:	cd5fd0ef          	jal	ra,80006da8 <pbuf_free>
800090d8:	0064c783          	lbu	a5,6(s1)
800090dc:	0ff00713          	li	a4,255
800090e0:	00e78663          	beq	a5,a4,800090ec <dhcp_select+0x208>
800090e4:	00178793          	addi	a5,a5,1
800090e8:	00f48323          	sb	a5,6(s1)
800090ec:	0064c783          	lbu	a5,6(s1)
800090f0:	00500713          	li	a4,5
800090f4:	06f76063          	bltu	a4,a5,80009154 <dhcp_select+0x270>
800090f8:	00100513          	li	a0,1
800090fc:	00f51533          	sll	a0,a0,a5
80009100:	00551793          	slli	a5,a0,0x5
80009104:	40a787b3          	sub	a5,a5,a0
80009108:	00279793          	slli	a5,a5,0x2
8000910c:	00f50533          	add	a0,a0,a5
80009110:	00351513          	slli	a0,a0,0x3
80009114:	01051513          	slli	a0,a0,0x10
80009118:	01055513          	srli	a0,a0,0x10
8000911c:	1f400593          	li	a1,500
80009120:	1f350513          	addi	a0,a0,499
80009124:	7f1030ef          	jal	ra,8000d114 <__divsi3>
80009128:	00a49423          	sh	a0,8(s1)
8000912c:	00040513          	mv	a0,s0
80009130:	02c12083          	lw	ra,44(sp)
80009134:	02812403          	lw	s0,40(sp)
80009138:	02412483          	lw	s1,36(sp)
8000913c:	02012903          	lw	s2,32(sp)
80009140:	01c12983          	lw	s3,28(sp)
80009144:	01812a03          	lw	s4,24(sp)
80009148:	01412a83          	lw	s5,20(sp)
8000914c:	03010113          	addi	sp,sp,48
80009150:	00008067          	ret
80009154:	0000f537          	lui	a0,0xf
80009158:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
8000915c:	fc1ff06f          	j	8000911c <dhcp_select+0x238>

80009160 <dhcp_discover>:
80009160:	fd010113          	addi	sp,sp,-48
80009164:	01312e23          	sw	s3,28(sp)
80009168:	02112623          	sw	ra,44(sp)
8000916c:	02812423          	sw	s0,40(sp)
80009170:	02912223          	sw	s1,36(sp)
80009174:	03212023          	sw	s2,32(sp)
80009178:	02852483          	lw	s1,40(a0)
8000917c:	00050993          	mv	s3,a0
80009180:	00600593          	li	a1,6
80009184:	00048513          	mv	a0,s1
80009188:	0004ae23          	sw	zero,28(s1)
8000918c:	8adff0ef          	jal	ra,80008a38 <dhcp_set_state>
80009190:	00e10693          	addi	a3,sp,14
80009194:	00100613          	li	a2,1
80009198:	00048593          	mv	a1,s1
8000919c:	00098513          	mv	a0,s3
800091a0:	941ff0ef          	jal	ra,80008ae0 <dhcp_create_msg>
800091a4:	10050063          	beqz	a0,800092a4 <dhcp_discover+0x144>
800091a8:	00452403          	lw	s0,4(a0)
800091ac:	00e15783          	lhu	a5,14(sp)
800091b0:	00050913          	mv	s2,a0
800091b4:	0f040413          	addi	s0,s0,240
800091b8:	00f40733          	add	a4,s0,a5
800091bc:	00278513          	addi	a0,a5,2
800091c0:	00178793          	addi	a5,a5,1
800091c4:	01079793          	slli	a5,a5,0x10
800091c8:	03900693          	li	a3,57
800091cc:	0107d793          	srli	a5,a5,0x10
800091d0:	00d70023          	sb	a3,0(a4)
800091d4:	00f407b3          	add	a5,s0,a5
800091d8:	00200713          	li	a4,2
800091dc:	00e78023          	sb	a4,0(a5)
800091e0:	02c9d603          	lhu	a2,44(s3)
800091e4:	01051513          	slli	a0,a0,0x10
800091e8:	01055513          	srli	a0,a0,0x10
800091ec:	00040593          	mv	a1,s0
800091f0:	00a11723          	sh	a0,14(sp)
800091f4:	85dff0ef          	jal	ra,80008a50 <dhcp_option_short>
800091f8:	00a40733          	add	a4,s0,a0
800091fc:	03700693          	li	a3,55
80009200:	00d70023          	sb	a3,0(a4)
80009204:	00150713          	addi	a4,a0,1
80009208:	01071713          	slli	a4,a4,0x10
8000920c:	01075713          	srli	a4,a4,0x10
80009210:	00300613          	li	a2,3
80009214:	00e40733          	add	a4,s0,a4
80009218:	00c70023          	sb	a2,0(a4)
8000921c:	00250713          	addi	a4,a0,2
80009220:	01071713          	slli	a4,a4,0x10
80009224:	01075713          	srli	a4,a4,0x10
80009228:	00e40733          	add	a4,s0,a4
8000922c:	00100693          	li	a3,1
80009230:	00d70023          	sb	a3,0(a4)
80009234:	00050793          	mv	a5,a0
80009238:	00350693          	addi	a3,a0,3
8000923c:	01069693          	slli	a3,a3,0x10
80009240:	00478793          	addi	a5,a5,4
80009244:	0106d693          	srli	a3,a3,0x10
80009248:	01079793          	slli	a5,a5,0x10
8000924c:	00d406b3          	add	a3,s0,a3
80009250:	00550513          	addi	a0,a0,5
80009254:	0107d793          	srli	a5,a5,0x10
80009258:	00c68023          	sb	a2,0(a3)
8000925c:	00f407b3          	add	a5,s0,a5
80009260:	01c00713          	li	a4,28
80009264:	01051513          	slli	a0,a0,0x10
80009268:	00e78023          	sb	a4,0(a5)
8000926c:	01055513          	srli	a0,a0,0x10
80009270:	00090613          	mv	a2,s2
80009274:	00040593          	mv	a1,s0
80009278:	00a11723          	sh	a0,14(sp)
8000927c:	a09ff0ef          	jal	ra,80008c84 <dhcp_option_trailer>
80009280:	8e41a503          	lw	a0,-1820(gp) # 80003084 <dhcp_pcb>
80009284:	84818793          	addi	a5,gp,-1976 # 80002fe8 <ip_addr_any>
80009288:	00098713          	mv	a4,s3
8000928c:	04300693          	li	a3,67
80009290:	84418613          	addi	a2,gp,-1980 # 80002fe4 <ip_addr_broadcast>
80009294:	00090593          	mv	a1,s2
80009298:	abcff0ef          	jal	ra,80008554 <udp_sendto_if_src>
8000929c:	00090513          	mv	a0,s2
800092a0:	b09fd0ef          	jal	ra,80006da8 <pbuf_free>
800092a4:	0064c783          	lbu	a5,6(s1)
800092a8:	0ff00713          	li	a4,255
800092ac:	00e78663          	beq	a5,a4,800092b8 <dhcp_discover+0x158>
800092b0:	00178793          	addi	a5,a5,1
800092b4:	00f48323          	sb	a5,6(s1)
800092b8:	0064c783          	lbu	a5,6(s1)
800092bc:	00500713          	li	a4,5
800092c0:	04f76c63          	bltu	a4,a5,80009318 <dhcp_discover+0x1b8>
800092c4:	00100513          	li	a0,1
800092c8:	00f51533          	sll	a0,a0,a5
800092cc:	00551793          	slli	a5,a0,0x5
800092d0:	40a787b3          	sub	a5,a5,a0
800092d4:	00279793          	slli	a5,a5,0x2
800092d8:	00f50533          	add	a0,a0,a5
800092dc:	00351513          	slli	a0,a0,0x3
800092e0:	01051513          	slli	a0,a0,0x10
800092e4:	01055513          	srli	a0,a0,0x10
800092e8:	1f400593          	li	a1,500
800092ec:	1f350513          	addi	a0,a0,499
800092f0:	625030ef          	jal	ra,8000d114 <__divsi3>
800092f4:	00a49423          	sh	a0,8(s1)
800092f8:	02c12083          	lw	ra,44(sp)
800092fc:	02812403          	lw	s0,40(sp)
80009300:	02412483          	lw	s1,36(sp)
80009304:	02012903          	lw	s2,32(sp)
80009308:	01c12983          	lw	s3,28(sp)
8000930c:	00000513          	li	a0,0
80009310:	03010113          	addi	sp,sp,48
80009314:	00008067          	ret
80009318:	0000f537          	lui	a0,0xf
8000931c:	a6050513          	addi	a0,a0,-1440 # ea60 <_stack_size+0xe260>
80009320:	fc9ff06f          	j	800092e8 <dhcp_discover+0x188>

80009324 <dhcp_check>:
80009324:	ff010113          	addi	sp,sp,-16
80009328:	00112623          	sw	ra,12(sp)
8000932c:	00912223          	sw	s1,4(sp)
80009330:	00812423          	sw	s0,8(sp)
80009334:	02852403          	lw	s0,40(a0)
80009338:	00050493          	mv	s1,a0
8000933c:	00800593          	li	a1,8
80009340:	00040513          	mv	a0,s0
80009344:	ef4ff0ef          	jal	ra,80008a38 <dhcp_set_state>
80009348:	00000613          	li	a2,0
8000934c:	01c40593          	addi	a1,s0,28
80009350:	00048513          	mv	a0,s1
80009354:	4b5010ef          	jal	ra,8000b008 <etharp_query>
80009358:	00644783          	lbu	a5,6(s0)
8000935c:	0ff00713          	li	a4,255
80009360:	00e78663          	beq	a5,a4,8000936c <dhcp_check+0x48>
80009364:	00178793          	addi	a5,a5,1
80009368:	00f40323          	sb	a5,6(s0)
8000936c:	00100793          	li	a5,1
80009370:	00f41423          	sh	a5,8(s0)
80009374:	00c12083          	lw	ra,12(sp)
80009378:	00812403          	lw	s0,8(sp)
8000937c:	00412483          	lw	s1,4(sp)
80009380:	01010113          	addi	sp,sp,16
80009384:	00008067          	ret

80009388 <dhcp_bind>:
80009388:	1a050863          	beqz	a0,80009538 <dhcp_bind+0x1b0>
8000938c:	fe010113          	addi	sp,sp,-32
80009390:	00112e23          	sw	ra,28(sp)
80009394:	00812c23          	sw	s0,24(sp)
80009398:	00912a23          	sw	s1,20(sp)
8000939c:	02852403          	lw	s0,40(a0)
800093a0:	10040a63          	beqz	s0,800094b4 <dhcp_bind+0x12c>
800093a4:	00050493          	mv	s1,a0
800093a8:	02842503          	lw	a0,40(s0)
800093ac:	00041923          	sh	zero,18(s0)
800093b0:	fff00793          	li	a5,-1
800093b4:	02f50463          	beq	a0,a5,800093dc <dhcp_bind+0x54>
800093b8:	01e50513          	addi	a0,a0,30
800093bc:	003c07b7          	lui	a5,0x3c0
800093c0:	10f57463          	bgeu	a0,a5,800094c8 <dhcp_bind+0x140>
800093c4:	03c00593          	li	a1,60
800093c8:	555030ef          	jal	ra,8000d11c <__udivsi3>
800093cc:	01051793          	slli	a5,a0,0x10
800093d0:	0107d793          	srli	a5,a5,0x10
800093d4:	10050063          	beqz	a0,800094d4 <dhcp_bind+0x14c>
800093d8:	00f41a23          	sh	a5,20(s0)
800093dc:	02c42503          	lw	a0,44(s0)
800093e0:	fff00793          	li	a5,-1
800093e4:	02f50863          	beq	a0,a5,80009414 <dhcp_bind+0x8c>
800093e8:	01e50513          	addi	a0,a0,30
800093ec:	003c07b7          	lui	a5,0x3c0
800093f0:	0ef57663          	bgeu	a0,a5,800094dc <dhcp_bind+0x154>
800093f4:	03c00593          	li	a1,60
800093f8:	525030ef          	jal	ra,8000d11c <__udivsi3>
800093fc:	01051793          	slli	a5,a0,0x10
80009400:	0107d793          	srli	a5,a5,0x10
80009404:	0e050263          	beqz	a0,800094e8 <dhcp_bind+0x160>
80009408:	00f41523          	sh	a5,10(s0)
8000940c:	00a45783          	lhu	a5,10(s0)
80009410:	00f41723          	sh	a5,14(s0)
80009414:	03042503          	lw	a0,48(s0)
80009418:	fff00793          	li	a5,-1
8000941c:	02f50863          	beq	a0,a5,8000944c <dhcp_bind+0xc4>
80009420:	01e50513          	addi	a0,a0,30
80009424:	003c07b7          	lui	a5,0x3c0
80009428:	0cf57463          	bgeu	a0,a5,800094f0 <dhcp_bind+0x168>
8000942c:	03c00593          	li	a1,60
80009430:	4ed030ef          	jal	ra,8000d11c <__udivsi3>
80009434:	01051793          	slli	a5,a0,0x10
80009438:	0107d793          	srli	a5,a5,0x10
8000943c:	0c050063          	beqz	a0,800094fc <dhcp_bind+0x174>
80009440:	00f41623          	sh	a5,12(s0)
80009444:	00c45783          	lhu	a5,12(s0)
80009448:	00f41823          	sh	a5,16(s0)
8000944c:	00c45783          	lhu	a5,12(s0)
80009450:	00a45703          	lhu	a4,10(s0)
80009454:	00f76663          	bltu	a4,a5,80009460 <dhcp_bind+0xd8>
80009458:	00078463          	beqz	a5,80009460 <dhcp_bind+0xd8>
8000945c:	00041523          	sh	zero,10(s0)
80009460:	00744783          	lbu	a5,7(s0)
80009464:	0a078063          	beqz	a5,80009504 <dhcp_bind+0x17c>
80009468:	02042783          	lw	a5,32(s0)
8000946c:	00f12423          	sw	a5,8(sp)
80009470:	02442783          	lw	a5,36(s0)
80009474:	00f12623          	sw	a5,12(sp)
80009478:	00079e63          	bnez	a5,80009494 <dhcp_bind+0x10c>
8000947c:	00812703          	lw	a4,8(sp)
80009480:	01c42783          	lw	a5,28(s0)
80009484:	00e7f7b3          	and	a5,a5,a4
80009488:	01000737          	lui	a4,0x1000
8000948c:	00e7e7b3          	or	a5,a5,a4
80009490:	00f12623          	sw	a5,12(sp)
80009494:	00a00593          	li	a1,10
80009498:	00040513          	mv	a0,s0
8000949c:	d9cff0ef          	jal	ra,80008a38 <dhcp_set_state>
800094a0:	00c10693          	addi	a3,sp,12
800094a4:	00810613          	addi	a2,sp,8
800094a8:	01c40593          	addi	a1,s0,28
800094ac:	00048513          	mv	a0,s1
800094b0:	9c0fd0ef          	jal	ra,80006670 <netif_set_addr>
800094b4:	01c12083          	lw	ra,28(sp)
800094b8:	01812403          	lw	s0,24(sp)
800094bc:	01412483          	lw	s1,20(sp)
800094c0:	02010113          	addi	sp,sp,32
800094c4:	00008067          	ret
800094c8:	000107b7          	lui	a5,0x10
800094cc:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
800094d0:	f09ff06f          	j	800093d8 <dhcp_bind+0x50>
800094d4:	00100793          	li	a5,1
800094d8:	f01ff06f          	j	800093d8 <dhcp_bind+0x50>
800094dc:	000107b7          	lui	a5,0x10
800094e0:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
800094e4:	f25ff06f          	j	80009408 <dhcp_bind+0x80>
800094e8:	00100793          	li	a5,1
800094ec:	f1dff06f          	j	80009408 <dhcp_bind+0x80>
800094f0:	000107b7          	lui	a5,0x10
800094f4:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
800094f8:	f49ff06f          	j	80009440 <dhcp_bind+0xb8>
800094fc:	00100793          	li	a5,1
80009500:	f41ff06f          	j	80009440 <dhcp_bind+0xb8>
80009504:	01c44783          	lbu	a5,28(s0)
80009508:	01879713          	slli	a4,a5,0x18
8000950c:	41875713          	srai	a4,a4,0x18
80009510:	00074663          	bltz	a4,8000951c <dhcp_bind+0x194>
80009514:	0ff00793          	li	a5,255
80009518:	f55ff06f          	j	8000946c <dhcp_bind+0xe4>
8000951c:	0bf00713          	li	a4,191
80009520:	00f77863          	bgeu	a4,a5,80009530 <dhcp_bind+0x1a8>
80009524:	010007b7          	lui	a5,0x1000
80009528:	fff78793          	addi	a5,a5,-1 # ffffff <_stack_size+0xfff7ff>
8000952c:	f41ff06f          	j	8000946c <dhcp_bind+0xe4>
80009530:	000107b7          	lui	a5,0x10
80009534:	ff5ff06f          	j	80009528 <dhcp_bind+0x1a0>
80009538:	00008067          	ret

8000953c <dhcp_inc_pcb_refcount>:
8000953c:	ff010113          	addi	sp,sp,-16
80009540:	00812423          	sw	s0,8(sp)
80009544:	8e01c783          	lbu	a5,-1824(gp) # 80003080 <dhcp_pcb_refcount>
80009548:	00112623          	sw	ra,12(sp)
8000954c:	00912223          	sw	s1,4(sp)
80009550:	01212023          	sw	s2,0(sp)
80009554:	04079863          	bnez	a5,800095a4 <dhcp_inc_pcb_refcount+0x68>
80009558:	c4cff0ef          	jal	ra,800089a4 <udp_new>
8000955c:	8ea1a223          	sw	a0,-1820(gp) # 80003084 <dhcp_pcb>
80009560:	fff00713          	li	a4,-1
80009564:	04050863          	beqz	a0,800095b4 <dhcp_inc_pcb_refcount+0x78>
80009568:	00954703          	lbu	a4,9(a0)
8000956c:	04400613          	li	a2,68
80009570:	02076713          	ori	a4,a4,32
80009574:	00e504a3          	sb	a4,9(a0)
80009578:	84818593          	addi	a1,gp,-1976 # 80002fe8 <ip_addr_any>
8000957c:	ee9fe0ef          	jal	ra,80008464 <udp_bind>
80009580:	8e41a503          	lw	a0,-1820(gp) # 80003084 <dhcp_pcb>
80009584:	04300613          	li	a2,67
80009588:	84818593          	addi	a1,gp,-1976 # 80002fe8 <ip_addr_any>
8000958c:	af8ff0ef          	jal	ra,80008884 <udp_connect>
80009590:	8e41a503          	lw	a0,-1820(gp) # 80003084 <dhcp_pcb>
80009594:	800095b7          	lui	a1,0x80009
80009598:	00000613          	li	a2,0
8000959c:	6fc58593          	addi	a1,a1,1788 # 800096fc <_heap_end+0xffff76fc>
800095a0:	bb0ff0ef          	jal	ra,80008950 <udp_recv>
800095a4:	8e01c783          	lbu	a5,-1824(gp) # 80003080 <dhcp_pcb_refcount>
800095a8:	00000713          	li	a4,0
800095ac:	00178793          	addi	a5,a5,1 # 10001 <_stack_size+0xf801>
800095b0:	8ef18023          	sb	a5,-1824(gp) # 80003080 <dhcp_pcb_refcount>
800095b4:	00c12083          	lw	ra,12(sp)
800095b8:	00812403          	lw	s0,8(sp)
800095bc:	00412483          	lw	s1,4(sp)
800095c0:	00012903          	lw	s2,0(sp)
800095c4:	00070513          	mv	a0,a4
800095c8:	01010113          	addi	sp,sp,16
800095cc:	00008067          	ret

800095d0 <dhcp_handle_ack.isra.0>:
800095d0:	ff010113          	addi	sp,sp,-16
800095d4:	00912223          	sw	s1,4(sp)
800095d8:	00812423          	sw	s0,8(sp)
800095dc:	00112623          	sw	ra,12(sp)
800095e0:	8e818793          	addi	a5,gp,-1816 # 80003088 <dhcp_rx_options_given>
800095e4:	0037c783          	lbu	a5,3(a5)
800095e8:	02052023          	sw	zero,32(a0)
800095ec:	02052223          	sw	zero,36(a0)
800095f0:	00050413          	mv	s0,a0
800095f4:	8e818493          	addi	s1,gp,-1816 # 80003088 <dhcp_rx_options_given>
800095f8:	00078663          	beqz	a5,80009604 <dhcp_handle_ack.isra.0+0x34>
800095fc:	b201a783          	lw	a5,-1248(gp) # 800032c0 <dhcp_rx_options_val+0xc>
80009600:	02f52423          	sw	a5,40(a0)
80009604:	0044c783          	lbu	a5,4(s1)
80009608:	08078663          	beqz	a5,80009694 <dhcp_handle_ack.isra.0+0xc4>
8000960c:	b241a783          	lw	a5,-1244(gp) # 800032c4 <dhcp_rx_options_val+0x10>
80009610:	02f42623          	sw	a5,44(s0)
80009614:	0054c783          	lbu	a5,5(s1)
80009618:	08078463          	beqz	a5,800096a0 <dhcp_handle_ack.isra.0+0xd0>
8000961c:	b281a783          	lw	a5,-1240(gp) # 800032c8 <dhcp_rx_options_val+0x14>
80009620:	02f42823          	sw	a5,48(s0)
80009624:	0115c703          	lbu	a4,17(a1)
80009628:	0105c783          	lbu	a5,16(a1)
8000962c:	00871713          	slli	a4,a4,0x8
80009630:	00f76733          	or	a4,a4,a5
80009634:	0125c783          	lbu	a5,18(a1)
80009638:	01079793          	slli	a5,a5,0x10
8000963c:	00e7e733          	or	a4,a5,a4
80009640:	0135c783          	lbu	a5,19(a1)
80009644:	01879793          	slli	a5,a5,0x18
80009648:	00e7e7b3          	or	a5,a5,a4
8000964c:	00f42e23          	sw	a5,28(s0)
80009650:	0064c783          	lbu	a5,6(s1)
80009654:	06078063          	beqz	a5,800096b4 <dhcp_handle_ack.isra.0+0xe4>
80009658:	b2c1a503          	lw	a0,-1236(gp) # 800032cc <dhcp_rx_options_val+0x18>
8000965c:	d40fc0ef          	jal	ra,80005b9c <lwip_htonl>
80009660:	00100793          	li	a5,1
80009664:	02a42023          	sw	a0,32(s0)
80009668:	00f403a3          	sb	a5,7(s0)
8000966c:	0074c783          	lbu	a5,7(s1)
80009670:	00078863          	beqz	a5,80009680 <dhcp_handle_ack.isra.0+0xb0>
80009674:	b301a503          	lw	a0,-1232(gp) # 800032d0 <dhcp_rx_options_val+0x1c>
80009678:	d24fc0ef          	jal	ra,80005b9c <lwip_htonl>
8000967c:	02a42223          	sw	a0,36(s0)
80009680:	00c12083          	lw	ra,12(sp)
80009684:	00812403          	lw	s0,8(sp)
80009688:	00412483          	lw	s1,4(sp)
8000968c:	01010113          	addi	sp,sp,16
80009690:	00008067          	ret
80009694:	02842783          	lw	a5,40(s0)
80009698:	0017d793          	srli	a5,a5,0x1
8000969c:	f75ff06f          	j	80009610 <dhcp_handle_ack.isra.0+0x40>
800096a0:	02842703          	lw	a4,40(s0)
800096a4:	00371793          	slli	a5,a4,0x3
800096a8:	40e787b3          	sub	a5,a5,a4
800096ac:	0037d793          	srli	a5,a5,0x3
800096b0:	f71ff06f          	j	80009620 <dhcp_handle_ack.isra.0+0x50>
800096b4:	000403a3          	sb	zero,7(s0)
800096b8:	fb5ff06f          	j	8000966c <dhcp_handle_ack.isra.0+0x9c>

800096bc <dhcp_dec_pcb_refcount>:
800096bc:	8e01c783          	lbu	a5,-1824(gp) # 80003080 <dhcp_pcb_refcount>
800096c0:	fff78793          	addi	a5,a5,-1
800096c4:	0ff7f793          	andi	a5,a5,255
800096c8:	8ef18023          	sb	a5,-1824(gp) # 80003080 <dhcp_pcb_refcount>
800096cc:	02079663          	bnez	a5,800096f8 <dhcp_dec_pcb_refcount+0x3c>
800096d0:	ff010113          	addi	sp,sp,-16
800096d4:	00812423          	sw	s0,8(sp)
800096d8:	8e41a503          	lw	a0,-1820(gp) # 80003084 <dhcp_pcb>
800096dc:	00112623          	sw	ra,12(sp)
800096e0:	a80ff0ef          	jal	ra,80008960 <udp_remove>
800096e4:	00c12083          	lw	ra,12(sp)
800096e8:	8e01a223          	sw	zero,-1820(gp) # 80003084 <dhcp_pcb>
800096ec:	00812403          	lw	s0,8(sp)
800096f0:	01010113          	addi	sp,sp,16
800096f4:	00008067          	ret
800096f8:	00008067          	ret

800096fc <dhcp_recv>:
800096fc:	fa010113          	addi	sp,sp,-96
80009700:	05212823          	sw	s2,80(sp)
80009704:	9e01a903          	lw	s2,-1568(gp) # 80003180 <ip_data+0x4>
80009708:	05312623          	sw	s3,76(sp)
8000970c:	04112e23          	sw	ra,92(sp)
80009710:	04812c23          	sw	s0,88(sp)
80009714:	04912a23          	sw	s1,84(sp)
80009718:	05412423          	sw	s4,72(sp)
8000971c:	05512223          	sw	s5,68(sp)
80009720:	05612023          	sw	s6,64(sp)
80009724:	03712e23          	sw	s7,60(sp)
80009728:	03812c23          	sw	s8,56(sp)
8000972c:	03912a23          	sw	s9,52(sp)
80009730:	03a12823          	sw	s10,48(sp)
80009734:	03b12623          	sw	s11,44(sp)
80009738:	02892b83          	lw	s7,40(s2)
8000973c:	00060993          	mv	s3,a2
80009740:	0e0b8663          	beqz	s7,8000982c <dhcp_recv+0x130>
80009744:	004bc783          	lbu	a5,4(s7)
80009748:	0e078263          	beqz	a5,8000982c <dhcp_recv+0x130>
8000974c:	00a65703          	lhu	a4,10(a2)
80009750:	02b00793          	li	a5,43
80009754:	0ce7fc63          	bgeu	a5,a4,8000982c <dhcp_recv+0x130>
80009758:	00462783          	lw	a5,4(a2)
8000975c:	00200713          	li	a4,2
80009760:	0007c683          	lbu	a3,0(a5)
80009764:	0ce69463          	bne	a3,a4,8000982c <dhcp_recv+0x130>
80009768:	03494603          	lbu	a2,52(s2)
8000976c:	00000713          	li	a4,0
80009770:	00600693          	li	a3,6
80009774:	0ff77593          	andi	a1,a4,255
80009778:	00c5f463          	bgeu	a1,a2,80009780 <dhcp_recv+0x84>
8000977c:	08d71c63          	bne	a4,a3,80009814 <dhcp_recv+0x118>
80009780:	0057c503          	lbu	a0,5(a5)
80009784:	0047c703          	lbu	a4,4(a5)
80009788:	00851513          	slli	a0,a0,0x8
8000978c:	00e56533          	or	a0,a0,a4
80009790:	0067c703          	lbu	a4,6(a5)
80009794:	01071713          	slli	a4,a4,0x10
80009798:	00a76733          	or	a4,a4,a0
8000979c:	0077c503          	lbu	a0,7(a5)
800097a0:	01851513          	slli	a0,a0,0x18
800097a4:	00e56533          	or	a0,a0,a4
800097a8:	bf4fc0ef          	jal	ra,80005b9c <lwip_htonl>
800097ac:	000ba783          	lw	a5,0(s7)
800097b0:	06f51e63          	bne	a0,a5,8000982c <dhcp_recv+0x130>
800097b4:	8e818793          	addi	a5,gp,-1816 # 80003088 <dhcp_rx_options_given>
800097b8:	0007a223          	sw	zero,4(a5)
800097bc:	00a9d703          	lhu	a4,10(s3)
800097c0:	0007a023          	sw	zero,0(a5)
800097c4:	02b00793          	li	a5,43
800097c8:	8e818813          	addi	a6,gp,-1816 # 80003088 <dhcp_rx_options_given>
800097cc:	06e7f063          	bgeu	a5,a4,8000982c <dhcp_recv+0x130>
800097d0:	00010ab7          	lui	s5,0x10
800097d4:	ffda8793          	addi	a5,s5,-3 # fffd <_stack_size+0xf7fd>
800097d8:	0089dd83          	lhu	s11,8(s3)
800097dc:	00f12423          	sw	a5,8(sp)
800097e0:	b1418793          	addi	a5,gp,-1260 # 800032b4 <dhcp_rx_options_val>
800097e4:	00000b13          	li	s6,0
800097e8:	0f000d13          	li	s10,240
800097ec:	00f12223          	sw	a5,4(sp)
800097f0:	00098c13          	mv	s8,s3
800097f4:	00ac5783          	lhu	a5,10(s8)
800097f8:	06fd7c63          	bgeu	s10,a5,80009870 <dhcp_recv+0x174>
800097fc:	004c2783          	lw	a5,4(s8)
80009800:	000d0413          	mv	s0,s10
80009804:	00400a93          	li	s5,4
80009808:	00f12023          	sw	a5,0(sp)
8000980c:	00100a13          	li	s4,1
80009810:	25c0006f          	j	80009a6c <dhcp_recv+0x370>
80009814:	00e905b3          	add	a1,s2,a4
80009818:	00170713          	addi	a4,a4,1 # 1000001 <_stack_size+0xfff801>
8000981c:	00e78533          	add	a0,a5,a4
80009820:	02e5c583          	lbu	a1,46(a1)
80009824:	01b54503          	lbu	a0,27(a0)
80009828:	f4b506e3          	beq	a0,a1,80009774 <dhcp_recv+0x78>
8000982c:	00098513          	mv	a0,s3
80009830:	d78fd0ef          	jal	ra,80006da8 <pbuf_free>
80009834:	05c12083          	lw	ra,92(sp)
80009838:	05812403          	lw	s0,88(sp)
8000983c:	05412483          	lw	s1,84(sp)
80009840:	05012903          	lw	s2,80(sp)
80009844:	04c12983          	lw	s3,76(sp)
80009848:	04812a03          	lw	s4,72(sp)
8000984c:	04412a83          	lw	s5,68(sp)
80009850:	04012b03          	lw	s6,64(sp)
80009854:	03c12b83          	lw	s7,60(sp)
80009858:	03812c03          	lw	s8,56(sp)
8000985c:	03412c83          	lw	s9,52(sp)
80009860:	03012d03          	lw	s10,48(sp)
80009864:	02c12d83          	lw	s11,44(sp)
80009868:	06010113          	addi	sp,sp,96
8000986c:	00008067          	ret
80009870:	000c2c03          	lw	s8,0(s8)
80009874:	40fd0d33          	sub	s10,s10,a5
80009878:	40fd8db3          	sub	s11,s11,a5
8000987c:	010d1d13          	slli	s10,s10,0x10
80009880:	010d9d93          	slli	s11,s11,0x10
80009884:	010d5d13          	srli	s10,s10,0x10
80009888:	010ddd93          	srli	s11,s11,0x10
8000988c:	f60c14e3          	bnez	s8,800097f4 <dhcp_recv+0xf8>
80009890:	f9dff06f          	j	8000982c <dhcp_recv+0x130>
80009894:	00240693          	addi	a3,s0,2
80009898:	01069693          	slli	a3,a3,0x10
8000989c:	0106d693          	srli	a3,a3,0x10
800098a0:	f886e6e3          	bltu	a3,s0,8000982c <dhcp_recv+0x130>
800098a4:	00ac5583          	lhu	a1,10(s8)
800098a8:	00140613          	addi	a2,s0,1
800098ac:	02b65c63          	bge	a2,a1,800098e4 <dhcp_recv+0x1e8>
800098b0:	00174703          	lbu	a4,1(a4)
800098b4:	03400593          	li	a1,52
800098b8:	12b78263          	beq	a5,a1,800099dc <dhcp_recv+0x2e0>
800098bc:	02f5ee63          	bltu	a1,a5,800098f8 <dhcp_recv+0x1fc>
800098c0:	07478263          	beq	a5,s4,80009924 <dhcp_recv+0x228>
800098c4:	16078663          	beqz	a5,80009a30 <dhcp_recv+0x334>
800098c8:	00300613          	li	a2,3
800098cc:	0ec78663          	beq	a5,a2,800099b8 <dhcp_recv+0x2bc>
800098d0:	03300613          	li	a2,51
800098d4:	0ec78a63          	beq	a5,a2,800099c8 <dhcp_recv+0x2cc>
800098d8:	fff00493          	li	s1,-1
800098dc:	00000c93          	li	s9,0
800098e0:	0500006f          	j	80009930 <dhcp_recv+0x234>
800098e4:	000c2703          	lw	a4,0(s8)
800098e8:	32070263          	beqz	a4,80009c0c <dhcp_recv+0x510>
800098ec:	00472703          	lw	a4,4(a4)
800098f0:	00074703          	lbu	a4,0(a4)
800098f4:	fc1ff06f          	j	800098b4 <dhcp_recv+0x1b8>
800098f8:	03600613          	li	a2,54
800098fc:	10c78863          	beq	a5,a2,80009a0c <dhcp_recv+0x310>
80009900:	0ec7ec63          	bltu	a5,a2,800099f8 <dhcp_recv+0x2fc>
80009904:	03a00613          	li	a2,58
80009908:	10c78c63          	beq	a5,a2,80009a20 <dhcp_recv+0x324>
8000990c:	03b00613          	li	a2,59
80009910:	fcc794e3          	bne	a5,a2,800098d8 <dhcp_recv+0x1dc>
80009914:	f1571ce3          	bne	a4,s5,8000982c <dhcp_recv+0x130>
80009918:	00400c93          	li	s9,4
8000991c:	00500493          	li	s1,5
80009920:	0100006f          	j	80009930 <dhcp_recv+0x234>
80009924:	f15714e3          	bne	a4,s5,8000982c <dhcp_recv+0x130>
80009928:	00400c93          	li	s9,4
8000992c:	00600493          	li	s1,6
80009930:	00812783          	lw	a5,8(sp)
80009934:	00870433          	add	s0,a4,s0
80009938:	ee87cae3          	blt	a5,s0,8000982c <dhcp_recv+0x130>
8000993c:	00e68733          	add	a4,a3,a4
80009940:	01071413          	slli	s0,a4,0x10
80009944:	01045413          	srli	s0,s0,0x10
80009948:	0e0c8863          	beqz	s9,80009a38 <dhcp_recv+0x33c>
8000994c:	009807b3          	add	a5,a6,s1
80009950:	0007c783          	lbu	a5,0(a5)
80009954:	00012e23          	sw	zero,28(sp)
80009958:	0e079063          	bnez	a5,80009a38 <dhcp_recv+0x33c>
8000995c:	010c9793          	slli	a5,s9,0x10
80009960:	0107d793          	srli	a5,a5,0x10
80009964:	00078613          	mv	a2,a5
80009968:	01c10593          	addi	a1,sp,28
8000996c:	000c0513          	mv	a0,s8
80009970:	00f12623          	sw	a5,12(sp)
80009974:	a19fd0ef          	jal	ra,8000738c <pbuf_copy_partial>
80009978:	00c12783          	lw	a5,12(sp)
8000997c:	eaa798e3          	bne	a5,a0,8000982c <dhcp_recv+0x130>
80009980:	8e818813          	addi	a6,gp,-1816 # 80003088 <dhcp_rx_options_given>
80009984:	155c9a63          	bne	s9,s5,80009ad8 <dhcp_recv+0x3dc>
80009988:	01c12503          	lw	a0,28(sp)
8000998c:	a10fc0ef          	jal	ra,80005b9c <lwip_htonl>
80009990:	00a12e23          	sw	a0,28(sp)
80009994:	8e818813          	addi	a6,gp,-1816 # 80003088 <dhcp_rx_options_given>
80009998:	009807b3          	add	a5,a6,s1
8000999c:	01478023          	sb	s4,0(a5)
800099a0:	00412783          	lw	a5,4(sp)
800099a4:	00249493          	slli	s1,s1,0x2
800099a8:	009784b3          	add	s1,a5,s1
800099ac:	01c12783          	lw	a5,28(sp)
800099b0:	00f4a023          	sw	a5,0(s1)
800099b4:	0840006f          	j	80009a38 <dhcp_recv+0x33c>
800099b8:	e6e7fae3          	bgeu	a5,a4,8000982c <dhcp_recv+0x130>
800099bc:	00700493          	li	s1,7
800099c0:	00400c93          	li	s9,4
800099c4:	f6dff06f          	j	80009930 <dhcp_recv+0x234>
800099c8:	e75712e3          	bne	a4,s5,8000982c <dhcp_recv+0x130>
800099cc:	00400c93          	li	s9,4
800099d0:	00300493          	li	s1,3
800099d4:	f5dff06f          	j	80009930 <dhcp_recv+0x234>
800099d8:	00000713          	li	a4,0
800099dc:	e54718e3          	bne	a4,s4,8000982c <dhcp_recv+0x130>
800099e0:	0f000793          	li	a5,240
800099e4:	e4fd14e3          	bne	s10,a5,8000982c <dhcp_recv+0x130>
800099e8:	00100c93          	li	s9,1
800099ec:	00000493          	li	s1,0
800099f0:	f41ff06f          	j	80009930 <dhcp_recv+0x234>
800099f4:	00000713          	li	a4,0
800099f8:	e3471ae3          	bne	a4,s4,8000982c <dhcp_recv+0x130>
800099fc:	00100c93          	li	s9,1
80009a00:	00100493          	li	s1,1
80009a04:	f2dff06f          	j	80009930 <dhcp_recv+0x234>
80009a08:	00000713          	li	a4,0
80009a0c:	e35710e3          	bne	a4,s5,8000982c <dhcp_recv+0x130>
80009a10:	00400c93          	li	s9,4
80009a14:	00200493          	li	s1,2
80009a18:	f19ff06f          	j	80009930 <dhcp_recv+0x234>
80009a1c:	00000713          	li	a4,0
80009a20:	e15716e3          	bne	a4,s5,8000982c <dhcp_recv+0x130>
80009a24:	00400c93          	li	s9,4
80009a28:	00400493          	li	s1,4
80009a2c:	f05ff06f          	j	80009930 <dhcp_recv+0x234>
80009a30:	01061413          	slli	s0,a2,0x10
80009a34:	01045413          	srli	s0,s0,0x10
80009a38:	00ac5783          	lhu	a5,10(s8)
80009a3c:	02f46863          	bltu	s0,a5,80009a6c <dhcp_recv+0x370>
80009a40:	40f40433          	sub	s0,s0,a5
80009a44:	40fd8db3          	sub	s11,s11,a5
80009a48:	01041413          	slli	s0,s0,0x10
80009a4c:	010d9d93          	slli	s11,s11,0x10
80009a50:	01045413          	srli	s0,s0,0x10
80009a54:	010ddd93          	srli	s11,s11,0x10
80009a58:	ddb47ae3          	bgeu	s0,s11,8000982c <dhcp_recv+0x130>
80009a5c:	000c2c03          	lw	s8,0(s8)
80009a60:	dc0c06e3          	beqz	s8,8000982c <dhcp_recv+0x130>
80009a64:	004c2783          	lw	a5,4(s8)
80009a68:	00f12023          	sw	a5,0(sp)
80009a6c:	01b47c63          	bgeu	s0,s11,80009a84 <dhcp_recv+0x388>
80009a70:	00012783          	lw	a5,0(sp)
80009a74:	0ff00693          	li	a3,255
80009a78:	00878733          	add	a4,a5,s0
80009a7c:	00074783          	lbu	a5,0(a4)
80009a80:	e0d79ae3          	bne	a5,a3,80009894 <dhcp_recv+0x198>
80009a84:	00084783          	lbu	a5,0(a6)
80009a88:	06079063          	bnez	a5,80009ae8 <dhcp_recv+0x3ec>
80009a8c:	060b1c63          	bnez	s6,80009b04 <dhcp_recv+0x408>
80009a90:	00184783          	lbu	a5,1(a6)
80009a94:	d8078ce3          	beqz	a5,8000982c <dhcp_recv+0x130>
80009a98:	b1418793          	addi	a5,gp,-1260 # 800032b4 <dhcp_rx_options_val>
80009a9c:	0047c703          	lbu	a4,4(a5)
80009aa0:	00500693          	li	a3,5
80009aa4:	0049a583          	lw	a1,4(s3)
80009aa8:	0ad71463          	bne	a4,a3,80009b50 <dhcp_recv+0x454>
80009aac:	005bc783          	lbu	a5,5(s7)
80009ab0:	00100713          	li	a4,1
80009ab4:	06e79c63          	bne	a5,a4,80009b2c <dhcp_recv+0x430>
80009ab8:	02892503          	lw	a0,40(s2)
80009abc:	b15ff0ef          	jal	ra,800095d0 <dhcp_handle_ack.isra.0>
80009ac0:	03594783          	lbu	a5,53(s2)
80009ac4:	00090513          	mv	a0,s2
80009ac8:	0087f793          	andi	a5,a5,8
80009acc:	06078e63          	beqz	a5,80009b48 <dhcp_recv+0x44c>
80009ad0:	855ff0ef          	jal	ra,80009324 <dhcp_check>
80009ad4:	d59ff06f          	j	8000982c <dhcp_recv+0x130>
80009ad8:	d54c9ae3          	bne	s9,s4,8000982c <dhcp_recv+0x130>
80009adc:	01c14783          	lbu	a5,28(sp)
80009ae0:	00f12e23          	sw	a5,28(sp)
80009ae4:	eb5ff06f          	j	80009998 <dhcp_recv+0x29c>
80009ae8:	00412783          	lw	a5,4(sp)
80009aec:	00080023          	sb	zero,0(a6)
80009af0:	00100713          	li	a4,1
80009af4:	0007a783          	lw	a5,0(a5)
80009af8:	02e78463          	beq	a5,a4,80009b20 <dhcp_recv+0x424>
80009afc:	00200713          	li	a4,2
80009b00:	00e79a63          	bne	a5,a4,80009b14 <dhcp_recv+0x418>
80009b04:	00000b13          	li	s6,0
80009b08:	06c00d93          	li	s11,108
80009b0c:	02c00d13          	li	s10,44
80009b10:	ce1ff06f          	j	800097f0 <dhcp_recv+0xf4>
80009b14:	00300713          	li	a4,3
80009b18:	f6e79ae3          	bne	a5,a4,80009a8c <dhcp_recv+0x390>
80009b1c:	00100b13          	li	s6,1
80009b20:	0ec00d93          	li	s11,236
80009b24:	06c00d13          	li	s10,108
80009b28:	cc9ff06f          	j	800097f0 <dhcp_recv+0xf4>
80009b2c:	ffd78793          	addi	a5,a5,-3
80009b30:	0ff7f793          	andi	a5,a5,255
80009b34:	00200713          	li	a4,2
80009b38:	cef76ae3          	bltu	a4,a5,8000982c <dhcp_recv+0x130>
80009b3c:	02892503          	lw	a0,40(s2)
80009b40:	a91ff0ef          	jal	ra,800095d0 <dhcp_handle_ack.isra.0>
80009b44:	00090513          	mv	a0,s2
80009b48:	841ff0ef          	jal	ra,80009388 <dhcp_bind>
80009b4c:	ce1ff06f          	j	8000982c <dhcp_recv+0x130>
80009b50:	00600693          	li	a3,6
80009b54:	04d71663          	bne	a4,a3,80009ba0 <dhcp_recv+0x4a4>
80009b58:	005bc703          	lbu	a4,5(s7)
80009b5c:	00200693          	li	a3,2
80009b60:	ffd70793          	addi	a5,a4,-3
80009b64:	0ff7f793          	andi	a5,a5,255
80009b68:	00f6f663          	bgeu	a3,a5,80009b74 <dhcp_recv+0x478>
80009b6c:	00100793          	li	a5,1
80009b70:	caf71ee3          	bne	a4,a5,8000982c <dhcp_recv+0x130>
80009b74:	02892503          	lw	a0,40(s2)
80009b78:	00c00593          	li	a1,12
80009b7c:	ebdfe0ef          	jal	ra,80008a38 <dhcp_set_state>
80009b80:	84818693          	addi	a3,gp,-1976 # 80002fe8 <ip_addr_any>
80009b84:	84818613          	addi	a2,gp,-1976 # 80002fe8 <ip_addr_any>
80009b88:	00090513          	mv	a0,s2
80009b8c:	84818593          	addi	a1,gp,-1976 # 80002fe8 <ip_addr_any>
80009b90:	ae1fc0ef          	jal	ra,80006670 <netif_set_addr>
80009b94:	00090513          	mv	a0,s2
80009b98:	dc8ff0ef          	jal	ra,80009160 <dhcp_discover>
80009b9c:	c91ff06f          	j	8000982c <dhcp_recv+0x130>
80009ba0:	00200613          	li	a2,2
80009ba4:	c8c714e3          	bne	a4,a2,8000982c <dhcp_recv+0x130>
80009ba8:	005bc703          	lbu	a4,5(s7)
80009bac:	c8d710e3          	bne	a4,a3,8000982c <dhcp_recv+0x130>
80009bb0:	00284703          	lbu	a4,2(a6)
80009bb4:	c6070ce3          	beqz	a4,8000982c <dhcp_recv+0x130>
80009bb8:	02892403          	lw	s0,40(s2)
80009bbc:	00b12023          	sw	a1,0(sp)
80009bc0:	00041423          	sh	zero,8(s0)
80009bc4:	0087a503          	lw	a0,8(a5)
80009bc8:	fd5fb0ef          	jal	ra,80005b9c <lwip_htonl>
80009bcc:	00012583          	lw	a1,0(sp)
80009bd0:	00a42c23          	sw	a0,24(s0)
80009bd4:	00090513          	mv	a0,s2
80009bd8:	0115c703          	lbu	a4,17(a1)
80009bdc:	0105c783          	lbu	a5,16(a1)
80009be0:	00871713          	slli	a4,a4,0x8
80009be4:	00f76733          	or	a4,a4,a5
80009be8:	0125c783          	lbu	a5,18(a1)
80009bec:	01079793          	slli	a5,a5,0x10
80009bf0:	00e7e733          	or	a4,a5,a4
80009bf4:	0135c783          	lbu	a5,19(a1)
80009bf8:	01879793          	slli	a5,a5,0x18
80009bfc:	00e7e7b3          	or	a5,a5,a4
80009c00:	00f42e23          	sw	a5,28(s0)
80009c04:	ae0ff0ef          	jal	ra,80008ee4 <dhcp_select>
80009c08:	c25ff06f          	j	8000982c <dhcp_recv+0x130>
80009c0c:	03400713          	li	a4,52
80009c10:	dce784e3          	beq	a5,a4,800099d8 <dhcp_recv+0x2dc>
80009c14:	02f76263          	bltu	a4,a5,80009c38 <dhcp_recv+0x53c>
80009c18:	c1478ae3          	beq	a5,s4,8000982c <dhcp_recv+0x130>
80009c1c:	e0078ae3          	beqz	a5,80009a30 <dhcp_recv+0x334>
80009c20:	00300713          	li	a4,3
80009c24:	c0e784e3          	beq	a5,a4,8000982c <dhcp_recv+0x130>
80009c28:	03300713          	li	a4,51
80009c2c:	c0e780e3          	beq	a5,a4,8000982c <dhcp_recv+0x130>
80009c30:	00000713          	li	a4,0
80009c34:	ca5ff06f          	j	800098d8 <dhcp_recv+0x1dc>
80009c38:	03600713          	li	a4,54
80009c3c:	dce786e3          	beq	a5,a4,80009a08 <dhcp_recv+0x30c>
80009c40:	dae7eae3          	bltu	a5,a4,800099f4 <dhcp_recv+0x2f8>
80009c44:	03a00713          	li	a4,58
80009c48:	dce78ae3          	beq	a5,a4,80009a1c <dhcp_recv+0x320>
80009c4c:	03b00613          	li	a2,59
80009c50:	00000713          	li	a4,0
80009c54:	cbdff06f          	j	80009910 <dhcp_recv+0x214>

80009c58 <dhcp_set_struct>:
80009c58:	ff010113          	addi	sp,sp,-16
80009c5c:	00058793          	mv	a5,a1
80009c60:	00812423          	sw	s0,8(sp)
80009c64:	03400613          	li	a2,52
80009c68:	00050413          	mv	s0,a0
80009c6c:	00000593          	li	a1,0
80009c70:	00078513          	mv	a0,a5
80009c74:	00112623          	sw	ra,12(sp)
80009c78:	595020ef          	jal	ra,8000ca0c <memset>
80009c7c:	02a42423          	sw	a0,40(s0)
80009c80:	00c12083          	lw	ra,12(sp)
80009c84:	00812403          	lw	s0,8(sp)
80009c88:	01010113          	addi	sp,sp,16
80009c8c:	00008067          	ret

80009c90 <dhcp_cleanup>:
80009c90:	02852783          	lw	a5,40(a0)
80009c94:	02078863          	beqz	a5,80009cc4 <dhcp_cleanup+0x34>
80009c98:	ff010113          	addi	sp,sp,-16
80009c9c:	00812423          	sw	s0,8(sp)
80009ca0:	00050413          	mv	s0,a0
80009ca4:	00078513          	mv	a0,a5
80009ca8:	00112623          	sw	ra,12(sp)
80009cac:	f0cfc0ef          	jal	ra,800063b8 <lwip_free>
80009cb0:	02042423          	sw	zero,40(s0)
80009cb4:	00c12083          	lw	ra,12(sp)
80009cb8:	00812403          	lw	s0,8(sp)
80009cbc:	01010113          	addi	sp,sp,16
80009cc0:	00008067          	ret
80009cc4:	00008067          	ret

80009cc8 <dhcp_inform>:
80009cc8:	0e050a63          	beqz	a0,80009dbc <dhcp_inform+0xf4>
80009ccc:	fb010113          	addi	sp,sp,-80
80009cd0:	04812423          	sw	s0,72(sp)
80009cd4:	04112623          	sw	ra,76(sp)
80009cd8:	04912223          	sw	s1,68(sp)
80009cdc:	05212023          	sw	s2,64(sp)
80009ce0:	00050413          	mv	s0,a0
80009ce4:	859ff0ef          	jal	ra,8000953c <dhcp_inc_pcb_refcount>
80009ce8:	0a051e63          	bnez	a0,80009da4 <dhcp_inform+0xdc>
80009cec:	03400613          	li	a2,52
80009cf0:	00000593          	li	a1,0
80009cf4:	00c10513          	addi	a0,sp,12
80009cf8:	515020ef          	jal	ra,8000ca0c <memset>
80009cfc:	00700593          	li	a1,7
80009d00:	00c10513          	addi	a0,sp,12
80009d04:	d35fe0ef          	jal	ra,80008a38 <dhcp_set_state>
80009d08:	00a10693          	addi	a3,sp,10
80009d0c:	00800613          	li	a2,8
80009d10:	00c10593          	addi	a1,sp,12
80009d14:	00040513          	mv	a0,s0
80009d18:	dc9fe0ef          	jal	ra,80008ae0 <dhcp_create_msg>
80009d1c:	00050913          	mv	s2,a0
80009d20:	08050063          	beqz	a0,80009da0 <dhcp_inform+0xd8>
80009d24:	00452483          	lw	s1,4(a0)
80009d28:	00a15783          	lhu	a5,10(sp)
80009d2c:	03900693          	li	a3,57
80009d30:	0f048493          	addi	s1,s1,240
80009d34:	00f48733          	add	a4,s1,a5
80009d38:	00278513          	addi	a0,a5,2
80009d3c:	00178793          	addi	a5,a5,1
80009d40:	01079793          	slli	a5,a5,0x10
80009d44:	0107d793          	srli	a5,a5,0x10
80009d48:	00d70023          	sb	a3,0(a4)
80009d4c:	00f487b3          	add	a5,s1,a5
80009d50:	00200713          	li	a4,2
80009d54:	00e78023          	sb	a4,0(a5)
80009d58:	02c45603          	lhu	a2,44(s0)
80009d5c:	01051513          	slli	a0,a0,0x10
80009d60:	01055513          	srli	a0,a0,0x10
80009d64:	00048593          	mv	a1,s1
80009d68:	00a11523          	sh	a0,10(sp)
80009d6c:	ce5fe0ef          	jal	ra,80008a50 <dhcp_option_short>
80009d70:	00090613          	mv	a2,s2
80009d74:	00048593          	mv	a1,s1
80009d78:	00a11523          	sh	a0,10(sp)
80009d7c:	f09fe0ef          	jal	ra,80008c84 <dhcp_option_trailer>
80009d80:	8e41a503          	lw	a0,-1820(gp) # 80003084 <dhcp_pcb>
80009d84:	00040713          	mv	a4,s0
80009d88:	04300693          	li	a3,67
80009d8c:	84418613          	addi	a2,gp,-1980 # 80002fe4 <ip_addr_broadcast>
80009d90:	00090593          	mv	a1,s2
80009d94:	9b5fe0ef          	jal	ra,80008748 <udp_sendto_if>
80009d98:	00090513          	mv	a0,s2
80009d9c:	80cfd0ef          	jal	ra,80006da8 <pbuf_free>
80009da0:	91dff0ef          	jal	ra,800096bc <dhcp_dec_pcb_refcount>
80009da4:	04c12083          	lw	ra,76(sp)
80009da8:	04812403          	lw	s0,72(sp)
80009dac:	04412483          	lw	s1,68(sp)
80009db0:	04012903          	lw	s2,64(sp)
80009db4:	05010113          	addi	sp,sp,80
80009db8:	00008067          	ret
80009dbc:	00008067          	ret

80009dc0 <dhcp_network_changed>:
80009dc0:	02852783          	lw	a5,40(a0)
80009dc4:	02078a63          	beqz	a5,80009df8 <dhcp_network_changed+0x38>
80009dc8:	0057c703          	lbu	a4,5(a5)
80009dcc:	00500693          	li	a3,5
80009dd0:	00e6ec63          	bltu	a3,a4,80009de8 <dhcp_network_changed+0x28>
80009dd4:	00300693          	li	a3,3
80009dd8:	00d77c63          	bgeu	a4,a3,80009df0 <dhcp_network_changed+0x30>
80009ddc:	00070e63          	beqz	a4,80009df8 <dhcp_network_changed+0x38>
80009de0:	00078323          	sb	zero,6(a5)
80009de4:	b7cff06f          	j	80009160 <dhcp_discover>
80009de8:	00a00693          	li	a3,10
80009dec:	fed71ae3          	bne	a4,a3,80009de0 <dhcp_network_changed+0x20>
80009df0:	00078323          	sb	zero,6(a5)
80009df4:	ee1fe06f          	j	80008cd4 <dhcp_reboot>
80009df8:	00008067          	ret

80009dfc <dhcp_arp_reply>:
80009dfc:	12050a63          	beqz	a0,80009f30 <dhcp_arp_reply+0x134>
80009e00:	fd010113          	addi	sp,sp,-48
80009e04:	02112623          	sw	ra,44(sp)
80009e08:	02812423          	sw	s0,40(sp)
80009e0c:	02912223          	sw	s1,36(sp)
80009e10:	03212023          	sw	s2,32(sp)
80009e14:	01312e23          	sw	s3,28(sp)
80009e18:	01412c23          	sw	s4,24(sp)
80009e1c:	02852403          	lw	s0,40(a0)
80009e20:	0e040863          	beqz	s0,80009f10 <dhcp_arp_reply+0x114>
80009e24:	00544703          	lbu	a4,5(s0)
80009e28:	00800793          	li	a5,8
80009e2c:	0ef71263          	bne	a4,a5,80009f10 <dhcp_arp_reply+0x114>
80009e30:	0005a703          	lw	a4,0(a1)
80009e34:	01c42783          	lw	a5,28(s0)
80009e38:	0cf71c63          	bne	a4,a5,80009f10 <dhcp_arp_reply+0x114>
80009e3c:	00050a13          	mv	s4,a0
80009e40:	00c00593          	li	a1,12
80009e44:	00040513          	mv	a0,s0
80009e48:	bf1fe0ef          	jal	ra,80008a38 <dhcp_set_state>
80009e4c:	00e10693          	addi	a3,sp,14
80009e50:	00400613          	li	a2,4
80009e54:	00040593          	mv	a1,s0
80009e58:	000a0513          	mv	a0,s4
80009e5c:	c85fe0ef          	jal	ra,80008ae0 <dhcp_create_msg>
80009e60:	00050913          	mv	s2,a0
80009e64:	08050863          	beqz	a0,80009ef4 <dhcp_arp_reply+0xf8>
80009e68:	00452483          	lw	s1,4(a0)
80009e6c:	00e15783          	lhu	a5,14(sp)
80009e70:	03200693          	li	a3,50
80009e74:	0f048493          	addi	s1,s1,240
80009e78:	00f48733          	add	a4,s1,a5
80009e7c:	00278993          	addi	s3,a5,2
80009e80:	00178793          	addi	a5,a5,1
80009e84:	01079793          	slli	a5,a5,0x10
80009e88:	0107d793          	srli	a5,a5,0x10
80009e8c:	00d70023          	sb	a3,0(a4)
80009e90:	00f487b3          	add	a5,s1,a5
80009e94:	00400713          	li	a4,4
80009e98:	00e78023          	sb	a4,0(a5)
80009e9c:	01c42503          	lw	a0,28(s0)
80009ea0:	01099993          	slli	s3,s3,0x10
80009ea4:	0109d993          	srli	s3,s3,0x10
80009ea8:	01311723          	sh	s3,14(sp)
80009eac:	cf1fb0ef          	jal	ra,80005b9c <lwip_htonl>
80009eb0:	00050613          	mv	a2,a0
80009eb4:	00048593          	mv	a1,s1
80009eb8:	00098513          	mv	a0,s3
80009ebc:	bc5fe0ef          	jal	ra,80008a80 <dhcp_option_long>
80009ec0:	00090613          	mv	a2,s2
80009ec4:	00048593          	mv	a1,s1
80009ec8:	00a11723          	sh	a0,14(sp)
80009ecc:	db9fe0ef          	jal	ra,80008c84 <dhcp_option_trailer>
80009ed0:	8e41a503          	lw	a0,-1820(gp) # 80003084 <dhcp_pcb>
80009ed4:	84818793          	addi	a5,gp,-1976 # 80002fe8 <ip_addr_any>
80009ed8:	000a0713          	mv	a4,s4
80009edc:	04300693          	li	a3,67
80009ee0:	84418613          	addi	a2,gp,-1980 # 80002fe4 <ip_addr_broadcast>
80009ee4:	00090593          	mv	a1,s2
80009ee8:	e6cfe0ef          	jal	ra,80008554 <udp_sendto_if_src>
80009eec:	00090513          	mv	a0,s2
80009ef0:	eb9fc0ef          	jal	ra,80006da8 <pbuf_free>
80009ef4:	00644783          	lbu	a5,6(s0)
80009ef8:	0ff00713          	li	a4,255
80009efc:	00e78663          	beq	a5,a4,80009f08 <dhcp_arp_reply+0x10c>
80009f00:	00178793          	addi	a5,a5,1
80009f04:	00f40323          	sb	a5,6(s0)
80009f08:	01400793          	li	a5,20
80009f0c:	00f41423          	sh	a5,8(s0)
80009f10:	02c12083          	lw	ra,44(sp)
80009f14:	02812403          	lw	s0,40(sp)
80009f18:	02412483          	lw	s1,36(sp)
80009f1c:	02012903          	lw	s2,32(sp)
80009f20:	01c12983          	lw	s3,28(sp)
80009f24:	01812a03          	lw	s4,24(sp)
80009f28:	03010113          	addi	sp,sp,48
80009f2c:	00008067          	ret
80009f30:	00008067          	ret

80009f34 <dhcp_renew>:
80009f34:	fd010113          	addi	sp,sp,-48
80009f38:	02112623          	sw	ra,44(sp)
80009f3c:	02812423          	sw	s0,40(sp)
80009f40:	01312e23          	sw	s3,28(sp)
80009f44:	02912223          	sw	s1,36(sp)
80009f48:	03212023          	sw	s2,32(sp)
80009f4c:	02852483          	lw	s1,40(a0)
80009f50:	00050993          	mv	s3,a0
80009f54:	00500593          	li	a1,5
80009f58:	00048513          	mv	a0,s1
80009f5c:	addfe0ef          	jal	ra,80008a38 <dhcp_set_state>
80009f60:	00e10693          	addi	a3,sp,14
80009f64:	00300613          	li	a2,3
80009f68:	00048593          	mv	a1,s1
80009f6c:	00098513          	mv	a0,s3
80009f70:	b71fe0ef          	jal	ra,80008ae0 <dhcp_create_msg>
80009f74:	fff00413          	li	s0,-1
80009f78:	10050063          	beqz	a0,8000a078 <dhcp_renew+0x144>
80009f7c:	00452403          	lw	s0,4(a0)
80009f80:	00e15783          	lhu	a5,14(sp)
80009f84:	00050913          	mv	s2,a0
80009f88:	0f040413          	addi	s0,s0,240
80009f8c:	00f40733          	add	a4,s0,a5
80009f90:	00278513          	addi	a0,a5,2
80009f94:	00178793          	addi	a5,a5,1
80009f98:	01079793          	slli	a5,a5,0x10
80009f9c:	03900693          	li	a3,57
80009fa0:	0107d793          	srli	a5,a5,0x10
80009fa4:	00d70023          	sb	a3,0(a4)
80009fa8:	00f407b3          	add	a5,s0,a5
80009fac:	00200713          	li	a4,2
80009fb0:	00e78023          	sb	a4,0(a5)
80009fb4:	02c9d603          	lhu	a2,44(s3)
80009fb8:	01051513          	slli	a0,a0,0x10
80009fbc:	00040593          	mv	a1,s0
80009fc0:	01055513          	srli	a0,a0,0x10
80009fc4:	00a11723          	sh	a0,14(sp)
80009fc8:	a89fe0ef          	jal	ra,80008a50 <dhcp_option_short>
80009fcc:	00a40733          	add	a4,s0,a0
80009fd0:	03700693          	li	a3,55
80009fd4:	00d70023          	sb	a3,0(a4)
80009fd8:	00150713          	addi	a4,a0,1
80009fdc:	01071713          	slli	a4,a4,0x10
80009fe0:	01075713          	srli	a4,a4,0x10
80009fe4:	00e40733          	add	a4,s0,a4
80009fe8:	00300613          	li	a2,3
80009fec:	00c70023          	sb	a2,0(a4)
80009ff0:	00250713          	addi	a4,a0,2
80009ff4:	01071713          	slli	a4,a4,0x10
80009ff8:	01075713          	srli	a4,a4,0x10
80009ffc:	00e40733          	add	a4,s0,a4
8000a000:	00100693          	li	a3,1
8000a004:	00d70023          	sb	a3,0(a4)
8000a008:	00050793          	mv	a5,a0
8000a00c:	00350693          	addi	a3,a0,3
8000a010:	01069693          	slli	a3,a3,0x10
8000a014:	00478793          	addi	a5,a5,4
8000a018:	0106d693          	srli	a3,a3,0x10
8000a01c:	01079793          	slli	a5,a5,0x10
8000a020:	00d406b3          	add	a3,s0,a3
8000a024:	00550513          	addi	a0,a0,5
8000a028:	0107d793          	srli	a5,a5,0x10
8000a02c:	00c68023          	sb	a2,0(a3)
8000a030:	00f407b3          	add	a5,s0,a5
8000a034:	01c00713          	li	a4,28
8000a038:	01051513          	slli	a0,a0,0x10
8000a03c:	00e78023          	sb	a4,0(a5)
8000a040:	01055513          	srli	a0,a0,0x10
8000a044:	00040593          	mv	a1,s0
8000a048:	00090613          	mv	a2,s2
8000a04c:	00a11723          	sh	a0,14(sp)
8000a050:	c35fe0ef          	jal	ra,80008c84 <dhcp_option_trailer>
8000a054:	8e41a503          	lw	a0,-1820(gp) # 80003084 <dhcp_pcb>
8000a058:	00098713          	mv	a4,s3
8000a05c:	04300693          	li	a3,67
8000a060:	01848613          	addi	a2,s1,24
8000a064:	00090593          	mv	a1,s2
8000a068:	ee0fe0ef          	jal	ra,80008748 <udp_sendto_if>
8000a06c:	00050413          	mv	s0,a0
8000a070:	00090513          	mv	a0,s2
8000a074:	d35fc0ef          	jal	ra,80006da8 <pbuf_free>
8000a078:	0064c783          	lbu	a5,6(s1)
8000a07c:	0ff00713          	li	a4,255
8000a080:	00e78663          	beq	a5,a4,8000a08c <dhcp_renew+0x158>
8000a084:	00178793          	addi	a5,a5,1
8000a088:	00f48323          	sb	a5,6(s1)
8000a08c:	0064c503          	lbu	a0,6(s1)
8000a090:	00900793          	li	a5,9
8000a094:	04a7e863          	bltu	a5,a0,8000a0e4 <dhcp_renew+0x1b0>
8000a098:	00551793          	slli	a5,a0,0x5
8000a09c:	40a787b3          	sub	a5,a5,a0
8000a0a0:	00279793          	slli	a5,a5,0x2
8000a0a4:	00f50533          	add	a0,a0,a5
8000a0a8:	00451513          	slli	a0,a0,0x4
8000a0ac:	01051513          	slli	a0,a0,0x10
8000a0b0:	01055513          	srli	a0,a0,0x10
8000a0b4:	1f400593          	li	a1,500
8000a0b8:	1f350513          	addi	a0,a0,499
8000a0bc:	058030ef          	jal	ra,8000d114 <__divsi3>
8000a0c0:	00a49423          	sh	a0,8(s1)
8000a0c4:	02c12083          	lw	ra,44(sp)
8000a0c8:	00040513          	mv	a0,s0
8000a0cc:	02812403          	lw	s0,40(sp)
8000a0d0:	02412483          	lw	s1,36(sp)
8000a0d4:	02012903          	lw	s2,32(sp)
8000a0d8:	01c12983          	lw	s3,28(sp)
8000a0dc:	03010113          	addi	sp,sp,48
8000a0e0:	00008067          	ret
8000a0e4:	00005537          	lui	a0,0x5
8000a0e8:	e2050513          	addi	a0,a0,-480 # 4e20 <_stack_size+0x4620>
8000a0ec:	fc9ff06f          	j	8000a0b4 <dhcp_renew+0x180>

8000a0f0 <dhcp_supplied_address>:
8000a0f0:	02050863          	beqz	a0,8000a120 <dhcp_supplied_address+0x30>
8000a0f4:	02852783          	lw	a5,40(a0)
8000a0f8:	00000513          	li	a0,0
8000a0fc:	02078463          	beqz	a5,8000a124 <dhcp_supplied_address+0x34>
8000a100:	0057c783          	lbu	a5,5(a5)
8000a104:	00a00713          	li	a4,10
8000a108:	00100513          	li	a0,1
8000a10c:	00e78663          	beq	a5,a4,8000a118 <dhcp_supplied_address+0x28>
8000a110:	ffc78513          	addi	a0,a5,-4
8000a114:	00253513          	sltiu	a0,a0,2
8000a118:	0ff57513          	andi	a0,a0,255
8000a11c:	00008067          	ret
8000a120:	00000513          	li	a0,0
8000a124:	00008067          	ret

8000a128 <dhcp_release_and_stop>:
8000a128:	fd010113          	addi	sp,sp,-48
8000a12c:	02112623          	sw	ra,44(sp)
8000a130:	02812423          	sw	s0,40(sp)
8000a134:	02912223          	sw	s1,36(sp)
8000a138:	03212023          	sw	s2,32(sp)
8000a13c:	01312e23          	sw	s3,28(sp)
8000a140:	01412c23          	sw	s4,24(sp)
8000a144:	02852403          	lw	s0,40(a0)
8000a148:	10040e63          	beqz	s0,8000a264 <dhcp_release_and_stop+0x13c>
8000a14c:	00544783          	lbu	a5,5(s0)
8000a150:	10078a63          	beqz	a5,8000a264 <dhcp_release_and_stop+0x13c>
8000a154:	01842783          	lw	a5,24(s0)
8000a158:	00042e23          	sw	zero,28(s0)
8000a15c:	00042c23          	sw	zero,24(s0)
8000a160:	02042023          	sw	zero,32(s0)
8000a164:	02042223          	sw	zero,36(s0)
8000a168:	02042823          	sw	zero,48(s0)
8000a16c:	02042623          	sw	zero,44(s0)
8000a170:	02042423          	sw	zero,40(s0)
8000a174:	00041723          	sh	zero,14(s0)
8000a178:	00042823          	sw	zero,16(s0)
8000a17c:	00041a23          	sh	zero,20(s0)
8000a180:	00050493          	mv	s1,a0
8000a184:	00f12623          	sw	a5,12(sp)
8000a188:	f69ff0ef          	jal	ra,8000a0f0 <dhcp_supplied_address>
8000a18c:	0a050463          	beqz	a0,8000a234 <dhcp_release_and_stop+0x10c>
8000a190:	00a10693          	addi	a3,sp,10
8000a194:	00700613          	li	a2,7
8000a198:	00040593          	mv	a1,s0
8000a19c:	00048513          	mv	a0,s1
8000a1a0:	941fe0ef          	jal	ra,80008ae0 <dhcp_create_msg>
8000a1a4:	00050993          	mv	s3,a0
8000a1a8:	08050663          	beqz	a0,8000a234 <dhcp_release_and_stop+0x10c>
8000a1ac:	00452903          	lw	s2,4(a0)
8000a1b0:	00a15783          	lhu	a5,10(sp)
8000a1b4:	03600693          	li	a3,54
8000a1b8:	0f090913          	addi	s2,s2,240
8000a1bc:	00f90733          	add	a4,s2,a5
8000a1c0:	00278a13          	addi	s4,a5,2
8000a1c4:	00178793          	addi	a5,a5,1
8000a1c8:	01079793          	slli	a5,a5,0x10
8000a1cc:	0107d793          	srli	a5,a5,0x10
8000a1d0:	00d70023          	sb	a3,0(a4)
8000a1d4:	00f907b3          	add	a5,s2,a5
8000a1d8:	00400713          	li	a4,4
8000a1dc:	00e78023          	sb	a4,0(a5)
8000a1e0:	00c12503          	lw	a0,12(sp)
8000a1e4:	010a1a13          	slli	s4,s4,0x10
8000a1e8:	010a5a13          	srli	s4,s4,0x10
8000a1ec:	01411523          	sh	s4,10(sp)
8000a1f0:	9adfb0ef          	jal	ra,80005b9c <lwip_htonl>
8000a1f4:	00050613          	mv	a2,a0
8000a1f8:	00090593          	mv	a1,s2
8000a1fc:	000a0513          	mv	a0,s4
8000a200:	881fe0ef          	jal	ra,80008a80 <dhcp_option_long>
8000a204:	00098613          	mv	a2,s3
8000a208:	00090593          	mv	a1,s2
8000a20c:	00a11523          	sh	a0,10(sp)
8000a210:	a75fe0ef          	jal	ra,80008c84 <dhcp_option_trailer>
8000a214:	8e41a503          	lw	a0,-1820(gp) # 80003084 <dhcp_pcb>
8000a218:	00048713          	mv	a4,s1
8000a21c:	04300693          	li	a3,67
8000a220:	00c10613          	addi	a2,sp,12
8000a224:	00098593          	mv	a1,s3
8000a228:	d20fe0ef          	jal	ra,80008748 <udp_sendto_if>
8000a22c:	00098513          	mv	a0,s3
8000a230:	b79fc0ef          	jal	ra,80006da8 <pbuf_free>
8000a234:	84818693          	addi	a3,gp,-1976 # 80002fe8 <ip_addr_any>
8000a238:	84818613          	addi	a2,gp,-1976 # 80002fe8 <ip_addr_any>
8000a23c:	00048513          	mv	a0,s1
8000a240:	84818593          	addi	a1,gp,-1976 # 80002fe8 <ip_addr_any>
8000a244:	c2cfc0ef          	jal	ra,80006670 <netif_set_addr>
8000a248:	00000593          	li	a1,0
8000a24c:	00040513          	mv	a0,s0
8000a250:	fe8fe0ef          	jal	ra,80008a38 <dhcp_set_state>
8000a254:	00444783          	lbu	a5,4(s0)
8000a258:	00078663          	beqz	a5,8000a264 <dhcp_release_and_stop+0x13c>
8000a25c:	c60ff0ef          	jal	ra,800096bc <dhcp_dec_pcb_refcount>
8000a260:	00040223          	sb	zero,4(s0)
8000a264:	02c12083          	lw	ra,44(sp)
8000a268:	02812403          	lw	s0,40(sp)
8000a26c:	02412483          	lw	s1,36(sp)
8000a270:	02012903          	lw	s2,32(sp)
8000a274:	01c12983          	lw	s3,28(sp)
8000a278:	01812a03          	lw	s4,24(sp)
8000a27c:	03010113          	addi	sp,sp,48
8000a280:	00008067          	ret

8000a284 <dhcp_start>:
8000a284:	ff010113          	addi	sp,sp,-16
8000a288:	00912223          	sw	s1,4(sp)
8000a28c:	00112623          	sw	ra,12(sp)
8000a290:	00812423          	sw	s0,8(sp)
8000a294:	01212023          	sw	s2,0(sp)
8000a298:	ff000493          	li	s1,-16
8000a29c:	08050263          	beqz	a0,8000a320 <dhcp_start+0x9c>
8000a2a0:	03554783          	lbu	a5,53(a0)
8000a2a4:	ff000493          	li	s1,-16
8000a2a8:	0017f793          	andi	a5,a5,1
8000a2ac:	06078a63          	beqz	a5,8000a320 <dhcp_start+0x9c>
8000a2b0:	02c55703          	lhu	a4,44(a0)
8000a2b4:	23f00793          	li	a5,575
8000a2b8:	02852903          	lw	s2,40(a0)
8000a2bc:	00e7e663          	bltu	a5,a4,8000a2c8 <dhcp_start+0x44>
8000a2c0:	fff00493          	li	s1,-1
8000a2c4:	05c0006f          	j	8000a320 <dhcp_start+0x9c>
8000a2c8:	00050413          	mv	s0,a0
8000a2cc:	06091863          	bnez	s2,8000a33c <dhcp_start+0xb8>
8000a2d0:	03400513          	li	a0,52
8000a2d4:	8b0fc0ef          	jal	ra,80006384 <lwip_malloc>
8000a2d8:	00050913          	mv	s2,a0
8000a2dc:	fe0502e3          	beqz	a0,8000a2c0 <dhcp_start+0x3c>
8000a2e0:	02a42423          	sw	a0,40(s0)
8000a2e4:	03400613          	li	a2,52
8000a2e8:	00000593          	li	a1,0
8000a2ec:	00090513          	mv	a0,s2
8000a2f0:	71c020ef          	jal	ra,8000ca0c <memset>
8000a2f4:	a48ff0ef          	jal	ra,8000953c <dhcp_inc_pcb_refcount>
8000a2f8:	00050493          	mv	s1,a0
8000a2fc:	fc0512e3          	bnez	a0,8000a2c0 <dhcp_start+0x3c>
8000a300:	00100793          	li	a5,1
8000a304:	00f90223          	sb	a5,4(s2)
8000a308:	03544783          	lbu	a5,53(s0)
8000a30c:	0047f793          	andi	a5,a5,4
8000a310:	02079e63          	bnez	a5,8000a34c <dhcp_start+0xc8>
8000a314:	00200593          	li	a1,2
8000a318:	00090513          	mv	a0,s2
8000a31c:	f1cfe0ef          	jal	ra,80008a38 <dhcp_set_state>
8000a320:	00c12083          	lw	ra,12(sp)
8000a324:	00812403          	lw	s0,8(sp)
8000a328:	00048513          	mv	a0,s1
8000a32c:	00012903          	lw	s2,0(sp)
8000a330:	00412483          	lw	s1,4(sp)
8000a334:	01010113          	addi	sp,sp,16
8000a338:	00008067          	ret
8000a33c:	00494783          	lbu	a5,4(s2)
8000a340:	fa0782e3          	beqz	a5,8000a2e4 <dhcp_start+0x60>
8000a344:	b78ff0ef          	jal	ra,800096bc <dhcp_dec_pcb_refcount>
8000a348:	f9dff06f          	j	8000a2e4 <dhcp_start+0x60>
8000a34c:	00040513          	mv	a0,s0
8000a350:	e11fe0ef          	jal	ra,80009160 <dhcp_discover>
8000a354:	00050493          	mv	s1,a0
8000a358:	fc0504e3          	beqz	a0,8000a320 <dhcp_start+0x9c>
8000a35c:	00040513          	mv	a0,s0
8000a360:	dc9ff0ef          	jal	ra,8000a128 <dhcp_release_and_stop>
8000a364:	f5dff06f          	j	8000a2c0 <dhcp_start+0x3c>

8000a368 <dhcp_coarse_tmr>:
8000a368:	fc010113          	addi	sp,sp,-64
8000a36c:	02812c23          	sw	s0,56(sp)
8000a370:	8cc1a403          	lw	s0,-1844(gp) # 8000306c <netif_list>
8000a374:	03312623          	sw	s3,44(sp)
8000a378:	000029b7          	lui	s3,0x2
8000a37c:	03212823          	sw	s2,48(sp)
8000a380:	03412423          	sw	s4,40(sp)
8000a384:	03512223          	sw	s5,36(sp)
8000a388:	03612023          	sw	s6,32(sp)
8000a38c:	01712e23          	sw	s7,28(sp)
8000a390:	02112e23          	sw	ra,60(sp)
8000a394:	02912a23          	sw	s1,52(sp)
8000a398:	01812c23          	sw	s8,24(sp)
8000a39c:	01912a23          	sw	s9,20(sp)
8000a3a0:	00100913          	li	s2,1
8000a3a4:	00a00a13          	li	s4,10
8000a3a8:	43200a93          	li	s5,1074
8000a3ac:	71098993          	addi	s3,s3,1808 # 2710 <_stack_size+0x1f10>
8000a3b0:	02041c63          	bnez	s0,8000a3e8 <dhcp_coarse_tmr+0x80>
8000a3b4:	03c12083          	lw	ra,60(sp)
8000a3b8:	03812403          	lw	s0,56(sp)
8000a3bc:	03412483          	lw	s1,52(sp)
8000a3c0:	03012903          	lw	s2,48(sp)
8000a3c4:	02c12983          	lw	s3,44(sp)
8000a3c8:	02812a03          	lw	s4,40(sp)
8000a3cc:	02412a83          	lw	s5,36(sp)
8000a3d0:	02012b03          	lw	s6,32(sp)
8000a3d4:	01c12b83          	lw	s7,28(sp)
8000a3d8:	01812c03          	lw	s8,24(sp)
8000a3dc:	01412c83          	lw	s9,20(sp)
8000a3e0:	04010113          	addi	sp,sp,64
8000a3e4:	00008067          	ret
8000a3e8:	02842783          	lw	a5,40(s0)
8000a3ec:	02078e63          	beqz	a5,8000a428 <dhcp_coarse_tmr+0xc0>
8000a3f0:	0057c703          	lbu	a4,5(a5)
8000a3f4:	02070a63          	beqz	a4,8000a428 <dhcp_coarse_tmr+0xc0>
8000a3f8:	0147d683          	lhu	a3,20(a5)
8000a3fc:	02068a63          	beqz	a3,8000a430 <dhcp_coarse_tmr+0xc8>
8000a400:	0127d703          	lhu	a4,18(a5)
8000a404:	00170713          	addi	a4,a4,1
8000a408:	01071713          	slli	a4,a4,0x10
8000a40c:	01075713          	srli	a4,a4,0x10
8000a410:	00e79923          	sh	a4,18(a5)
8000a414:	00e69e63          	bne	a3,a4,8000a430 <dhcp_coarse_tmr+0xc8>
8000a418:	00040513          	mv	a0,s0
8000a41c:	d0dff0ef          	jal	ra,8000a128 <dhcp_release_and_stop>
8000a420:	00040513          	mv	a0,s0
8000a424:	e61ff0ef          	jal	ra,8000a284 <dhcp_start>
8000a428:	00042403          	lw	s0,0(s0)
8000a42c:	f85ff06f          	j	8000a3b0 <dhcp_coarse_tmr+0x48>
8000a430:	0107d703          	lhu	a4,16(a5)
8000a434:	1a070663          	beqz	a4,8000a5e0 <dhcp_coarse_tmr+0x278>
8000a438:	fff70693          	addi	a3,a4,-1
8000a43c:	00d79823          	sh	a3,16(a5)
8000a440:	1b271063          	bne	a4,s2,8000a5e0 <dhcp_coarse_tmr+0x278>
8000a444:	02842c03          	lw	s8,40(s0)
8000a448:	005c4783          	lbu	a5,5(s8)
8000a44c:	fcfa6ee3          	bltu	s4,a5,8000a428 <dhcp_coarse_tmr+0xc0>
8000a450:	00fad7b3          	srl	a5,s5,a5
8000a454:	0017f793          	andi	a5,a5,1
8000a458:	fc0788e3          	beqz	a5,8000a428 <dhcp_coarse_tmr+0xc0>
8000a45c:	00400593          	li	a1,4
8000a460:	000c0513          	mv	a0,s8
8000a464:	dd4fe0ef          	jal	ra,80008a38 <dhcp_set_state>
8000a468:	00e10693          	addi	a3,sp,14
8000a46c:	00300613          	li	a2,3
8000a470:	000c0593          	mv	a1,s8
8000a474:	00040513          	mv	a0,s0
8000a478:	e68fe0ef          	jal	ra,80008ae0 <dhcp_create_msg>
8000a47c:	00050c93          	mv	s9,a0
8000a480:	0e050a63          	beqz	a0,8000a574 <dhcp_coarse_tmr+0x20c>
8000a484:	00452483          	lw	s1,4(a0)
8000a488:	00e15783          	lhu	a5,14(sp)
8000a48c:	03900693          	li	a3,57
8000a490:	0f048493          	addi	s1,s1,240
8000a494:	00f48733          	add	a4,s1,a5
8000a498:	00278513          	addi	a0,a5,2
8000a49c:	00178793          	addi	a5,a5,1
8000a4a0:	01079793          	slli	a5,a5,0x10
8000a4a4:	0107d793          	srli	a5,a5,0x10
8000a4a8:	00d70023          	sb	a3,0(a4)
8000a4ac:	00f487b3          	add	a5,s1,a5
8000a4b0:	00200713          	li	a4,2
8000a4b4:	00e78023          	sb	a4,0(a5)
8000a4b8:	02c45603          	lhu	a2,44(s0)
8000a4bc:	01051513          	slli	a0,a0,0x10
8000a4c0:	01055513          	srli	a0,a0,0x10
8000a4c4:	00048593          	mv	a1,s1
8000a4c8:	00a11723          	sh	a0,14(sp)
8000a4cc:	d84fe0ef          	jal	ra,80008a50 <dhcp_option_short>
8000a4d0:	00a48733          	add	a4,s1,a0
8000a4d4:	03700693          	li	a3,55
8000a4d8:	00d70023          	sb	a3,0(a4)
8000a4dc:	00150713          	addi	a4,a0,1
8000a4e0:	01071713          	slli	a4,a4,0x10
8000a4e4:	01075713          	srli	a4,a4,0x10
8000a4e8:	00300693          	li	a3,3
8000a4ec:	00e48733          	add	a4,s1,a4
8000a4f0:	00d70023          	sb	a3,0(a4)
8000a4f4:	00250713          	addi	a4,a0,2
8000a4f8:	01071713          	slli	a4,a4,0x10
8000a4fc:	01075713          	srli	a4,a4,0x10
8000a500:	00e48733          	add	a4,s1,a4
8000a504:	01270023          	sb	s2,0(a4)
8000a508:	00050793          	mv	a5,a0
8000a50c:	00350713          	addi	a4,a0,3
8000a510:	01071713          	slli	a4,a4,0x10
8000a514:	00478793          	addi	a5,a5,4
8000a518:	01075713          	srli	a4,a4,0x10
8000a51c:	01079793          	slli	a5,a5,0x10
8000a520:	00e48733          	add	a4,s1,a4
8000a524:	00550513          	addi	a0,a0,5
8000a528:	0107d793          	srli	a5,a5,0x10
8000a52c:	00d70023          	sb	a3,0(a4)
8000a530:	00f487b3          	add	a5,s1,a5
8000a534:	01c00713          	li	a4,28
8000a538:	01051513          	slli	a0,a0,0x10
8000a53c:	00e78023          	sb	a4,0(a5)
8000a540:	01055513          	srli	a0,a0,0x10
8000a544:	000c8613          	mv	a2,s9
8000a548:	00048593          	mv	a1,s1
8000a54c:	00a11723          	sh	a0,14(sp)
8000a550:	f34fe0ef          	jal	ra,80008c84 <dhcp_option_trailer>
8000a554:	8e41a503          	lw	a0,-1820(gp) # 80003084 <dhcp_pcb>
8000a558:	00040713          	mv	a4,s0
8000a55c:	04300693          	li	a3,67
8000a560:	84418613          	addi	a2,gp,-1980 # 80002fe4 <ip_addr_broadcast>
8000a564:	000c8593          	mv	a1,s9
8000a568:	9e0fe0ef          	jal	ra,80008748 <udp_sendto_if>
8000a56c:	000c8513          	mv	a0,s9
8000a570:	839fc0ef          	jal	ra,80006da8 <pbuf_free>
8000a574:	006c4783          	lbu	a5,6(s8)
8000a578:	0ff00713          	li	a4,255
8000a57c:	00e78663          	beq	a5,a4,8000a588 <dhcp_coarse_tmr+0x220>
8000a580:	00178793          	addi	a5,a5,1
8000a584:	00fc0323          	sb	a5,6(s8)
8000a588:	006c4783          	lbu	a5,6(s8)
8000a58c:	00900713          	li	a4,9
8000a590:	00098513          	mv	a0,s3
8000a594:	02f76063          	bltu	a4,a5,8000a5b4 <dhcp_coarse_tmr+0x24c>
8000a598:	00579513          	slli	a0,a5,0x5
8000a59c:	40f50533          	sub	a0,a0,a5
8000a5a0:	00251513          	slli	a0,a0,0x2
8000a5a4:	00a787b3          	add	a5,a5,a0
8000a5a8:	00379793          	slli	a5,a5,0x3
8000a5ac:	01079513          	slli	a0,a5,0x10
8000a5b0:	01055513          	srli	a0,a0,0x10
8000a5b4:	1f400593          	li	a1,500
8000a5b8:	1f350513          	addi	a0,a0,499
8000a5bc:	359020ef          	jal	ra,8000d114 <__divsi3>
8000a5c0:	014c5783          	lhu	a5,20(s8)
8000a5c4:	012c5703          	lhu	a4,18(s8)
8000a5c8:	00ac1423          	sh	a0,8(s8)
8000a5cc:	40e787b3          	sub	a5,a5,a4
8000a5d0:	e4f95ce3          	bge	s2,a5,8000a428 <dhcp_coarse_tmr+0xc0>
8000a5d4:	4017d793          	srai	a5,a5,0x1
8000a5d8:	00fc1823          	sh	a5,16(s8)
8000a5dc:	e4dff06f          	j	8000a428 <dhcp_coarse_tmr+0xc0>
8000a5e0:	00e7d703          	lhu	a4,14(a5)
8000a5e4:	e40702e3          	beqz	a4,8000a428 <dhcp_coarse_tmr+0xc0>
8000a5e8:	fff70693          	addi	a3,a4,-1
8000a5ec:	00d79723          	sh	a3,14(a5)
8000a5f0:	e3271ce3          	bne	a4,s2,8000a428 <dhcp_coarse_tmr+0xc0>
8000a5f4:	02842483          	lw	s1,40(s0)
8000a5f8:	0054c783          	lbu	a5,5(s1)
8000a5fc:	0fb7f713          	andi	a4,a5,251
8000a600:	01270463          	beq	a4,s2,8000a608 <dhcp_coarse_tmr+0x2a0>
8000a604:	e34792e3          	bne	a5,s4,8000a428 <dhcp_coarse_tmr+0xc0>
8000a608:	00040513          	mv	a0,s0
8000a60c:	929ff0ef          	jal	ra,80009f34 <dhcp_renew>
8000a610:	00c4d783          	lhu	a5,12(s1)
8000a614:	0124d703          	lhu	a4,18(s1)
8000a618:	40e787b3          	sub	a5,a5,a4
8000a61c:	e0f956e3          	bge	s2,a5,8000a428 <dhcp_coarse_tmr+0xc0>
8000a620:	4017d793          	srai	a5,a5,0x1
8000a624:	00f49723          	sh	a5,14(s1)
8000a628:	e01ff06f          	j	8000a428 <dhcp_coarse_tmr+0xc0>

8000a62c <dhcp_fine_tmr>:
8000a62c:	fe010113          	addi	sp,sp,-32
8000a630:	00812c23          	sw	s0,24(sp)
8000a634:	8cc1a403          	lw	s0,-1844(gp) # 8000306c <netif_list>
8000a638:	00912a23          	sw	s1,20(sp)
8000a63c:	01212823          	sw	s2,16(sp)
8000a640:	01312623          	sw	s3,12(sp)
8000a644:	01412423          	sw	s4,8(sp)
8000a648:	01512223          	sw	s5,4(sp)
8000a64c:	01612023          	sw	s6,0(sp)
8000a650:	00112e23          	sw	ra,28(sp)
8000a654:	00100493          	li	s1,1
8000a658:	00c00913          	li	s2,12
8000a65c:	00600993          	li	s3,6
8000a660:	00800a13          	li	s4,8
8000a664:	00300a93          	li	s5,3
8000a668:	00500b13          	li	s6,5
8000a66c:	02041663          	bnez	s0,8000a698 <dhcp_fine_tmr+0x6c>
8000a670:	01c12083          	lw	ra,28(sp)
8000a674:	01812403          	lw	s0,24(sp)
8000a678:	01412483          	lw	s1,20(sp)
8000a67c:	01012903          	lw	s2,16(sp)
8000a680:	00c12983          	lw	s3,12(sp)
8000a684:	00812a03          	lw	s4,8(sp)
8000a688:	00412a83          	lw	s5,4(sp)
8000a68c:	00012b03          	lw	s6,0(sp)
8000a690:	02010113          	addi	sp,sp,32
8000a694:	00008067          	ret
8000a698:	02842703          	lw	a4,40(s0)
8000a69c:	00070a63          	beqz	a4,8000a6b0 <dhcp_fine_tmr+0x84>
8000a6a0:	00875783          	lhu	a5,8(a4)
8000a6a4:	00f4fa63          	bgeu	s1,a5,8000a6b8 <dhcp_fine_tmr+0x8c>
8000a6a8:	fff78793          	addi	a5,a5,-1
8000a6ac:	00f71423          	sh	a5,8(a4)
8000a6b0:	00042403          	lw	s0,0(s0)
8000a6b4:	fb9ff06f          	j	8000a66c <dhcp_fine_tmr+0x40>
8000a6b8:	fe979ce3          	bne	a5,s1,8000a6b0 <dhcp_fine_tmr+0x84>
8000a6bc:	00071423          	sh	zero,8(a4)
8000a6c0:	02842703          	lw	a4,40(s0)
8000a6c4:	00574783          	lbu	a5,5(a4)
8000a6c8:	01278463          	beq	a5,s2,8000a6d0 <dhcp_fine_tmr+0xa4>
8000a6cc:	01379863          	bne	a5,s3,8000a6dc <dhcp_fine_tmr+0xb0>
8000a6d0:	00040513          	mv	a0,s0
8000a6d4:	a8dfe0ef          	jal	ra,80009160 <dhcp_discover>
8000a6d8:	fd9ff06f          	j	8000a6b0 <dhcp_fine_tmr+0x84>
8000a6dc:	02979463          	bne	a5,s1,8000a704 <dhcp_fine_tmr+0xd8>
8000a6e0:	00674783          	lbu	a5,6(a4)
8000a6e4:	00040513          	mv	a0,s0
8000a6e8:	00fb6663          	bltu	s6,a5,8000a6f4 <dhcp_fine_tmr+0xc8>
8000a6ec:	ff8fe0ef          	jal	ra,80008ee4 <dhcp_select>
8000a6f0:	fc1ff06f          	j	8000a6b0 <dhcp_fine_tmr+0x84>
8000a6f4:	a35ff0ef          	jal	ra,8000a128 <dhcp_release_and_stop>
8000a6f8:	00040513          	mv	a0,s0
8000a6fc:	b89ff0ef          	jal	ra,8000a284 <dhcp_start>
8000a700:	fb1ff06f          	j	8000a6b0 <dhcp_fine_tmr+0x84>
8000a704:	03479063          	bne	a5,s4,8000a724 <dhcp_fine_tmr+0xf8>
8000a708:	00674783          	lbu	a5,6(a4)
8000a70c:	00040513          	mv	a0,s0
8000a710:	00f4e663          	bltu	s1,a5,8000a71c <dhcp_fine_tmr+0xf0>
8000a714:	c11fe0ef          	jal	ra,80009324 <dhcp_check>
8000a718:	f99ff06f          	j	8000a6b0 <dhcp_fine_tmr+0x84>
8000a71c:	c6dfe0ef          	jal	ra,80009388 <dhcp_bind>
8000a720:	f91ff06f          	j	8000a6b0 <dhcp_fine_tmr+0x84>
8000a724:	f95796e3          	bne	a5,s5,8000a6b0 <dhcp_fine_tmr+0x84>
8000a728:	00674783          	lbu	a5,6(a4)
8000a72c:	00040513          	mv	a0,s0
8000a730:	faf4e2e3          	bltu	s1,a5,8000a6d4 <dhcp_fine_tmr+0xa8>
8000a734:	da0fe0ef          	jal	ra,80008cd4 <dhcp_reboot>
8000a738:	f79ff06f          	j	8000a6b0 <dhcp_fine_tmr+0x84>

8000a73c <dhcp_release>:
8000a73c:	ff010113          	addi	sp,sp,-16
8000a740:	00112623          	sw	ra,12(sp)
8000a744:	9e5ff0ef          	jal	ra,8000a128 <dhcp_release_and_stop>
8000a748:	00c12083          	lw	ra,12(sp)
8000a74c:	00000513          	li	a0,0
8000a750:	01010113          	addi	sp,sp,16
8000a754:	00008067          	ret

8000a758 <dhcp_stop>:
8000a758:	9d1ff06f          	j	8000a128 <dhcp_release_and_stop>

8000a75c <etharp_free_entry>:
8000a75c:	fe010113          	addi	sp,sp,-32
8000a760:	00912a23          	sw	s1,20(sp)
8000a764:	00151493          	slli	s1,a0,0x1
8000a768:	00a48733          	add	a4,s1,a0
8000a76c:	01212823          	sw	s2,16(sp)
8000a770:	00371713          	slli	a4,a4,0x3
8000a774:	b3418913          	addi	s2,gp,-1228 # 800032d4 <arp_table>
8000a778:	00812c23          	sw	s0,24(sp)
8000a77c:	01312623          	sw	s3,12(sp)
8000a780:	00112e23          	sw	ra,28(sp)
8000a784:	00e90933          	add	s2,s2,a4
8000a788:	00050993          	mv	s3,a0
8000a78c:	00092503          	lw	a0,0(s2)
8000a790:	b3418413          	addi	s0,gp,-1228 # 800032d4 <arp_table>
8000a794:	00050663          	beqz	a0,8000a7a0 <etharp_free_entry+0x44>
8000a798:	e10fc0ef          	jal	ra,80006da8 <pbuf_free>
8000a79c:	00092023          	sw	zero,0(s2)
8000a7a0:	01348533          	add	a0,s1,s3
8000a7a4:	00351513          	slli	a0,a0,0x3
8000a7a8:	00a40533          	add	a0,s0,a0
8000a7ac:	00050a23          	sb	zero,20(a0)
8000a7b0:	00051923          	sh	zero,18(a0)
8000a7b4:	00052423          	sw	zero,8(a0)
8000a7b8:	00052223          	sw	zero,4(a0)
8000a7bc:	00600613          	li	a2,6
8000a7c0:	84c18593          	addi	a1,gp,-1972 # 80002fec <ethzero>
8000a7c4:	00c50513          	addi	a0,a0,12
8000a7c8:	674030ef          	jal	ra,8000de3c <memcpy>
8000a7cc:	01c12083          	lw	ra,28(sp)
8000a7d0:	01812403          	lw	s0,24(sp)
8000a7d4:	01412483          	lw	s1,20(sp)
8000a7d8:	01012903          	lw	s2,16(sp)
8000a7dc:	00c12983          	lw	s3,12(sp)
8000a7e0:	02010113          	addi	sp,sp,32
8000a7e4:	00008067          	ret

8000a7e8 <etharp_find_entry>:
8000a7e8:	fe010113          	addi	sp,sp,-32
8000a7ec:	00812c23          	sw	s0,24(sp)
8000a7f0:	00912a23          	sw	s1,20(sp)
8000a7f4:	b3418693          	addi	a3,gp,-1228 # 800032d4 <arp_table>
8000a7f8:	00112e23          	sw	ra,28(sp)
8000a7fc:	01212823          	sw	s2,16(sp)
8000a800:	01312623          	sw	s3,12(sp)
8000a804:	00000293          	li	t0,0
8000a808:	00000f93          	li	t6,0
8000a80c:	00000f13          	li	t5,0
8000a810:	00a00313          	li	t1,10
8000a814:	00000793          	li	a5,0
8000a818:	00a00713          	li	a4,10
8000a81c:	00a00893          	li	a7,10
8000a820:	00a00493          	li	s1,10
8000a824:	b3418413          	addi	s0,gp,-1228 # 800032d4 <arp_table>
8000a828:	00a00e13          	li	t3,10
8000a82c:	00100393          	li	t2,1
8000a830:	0146ce83          	lbu	t4,20(a3)
8000a834:	05c71263          	bne	a4,t3,8000a878 <etharp_find_entry+0x90>
8000a838:	100e8463          	beqz	t4,8000a940 <etharp_find_entry+0x158>
8000a83c:	00050e63          	beqz	a0,8000a858 <etharp_find_entry+0x70>
8000a840:	00052903          	lw	s2,0(a0)
8000a844:	0046a803          	lw	a6,4(a3)
8000a848:	01091863          	bne	s2,a6,8000a858 <etharp_find_entry+0x70>
8000a84c:	0a060a63          	beqz	a2,8000a900 <etharp_find_entry+0x118>
8000a850:	0086a803          	lw	a6,8(a3)
8000a854:	0ac80663          	beq	a6,a2,8000a900 <etharp_find_entry+0x118>
8000a858:	0126d803          	lhu	a6,18(a3)
8000a85c:	0c7e9a63          	bne	t4,t2,8000a930 <etharp_find_entry+0x148>
8000a860:	0006ae83          	lw	t4,0(a3)
8000a864:	0a0e8e63          	beqz	t4,8000a920 <etharp_find_entry+0x138>
8000a868:	01e86a63          	bltu	a6,t5,8000a87c <etharp_find_entry+0x94>
8000a86c:	00080f13          	mv	t5,a6
8000a870:	00078313          	mv	t1,a5
8000a874:	0080006f          	j	8000a87c <etharp_find_entry+0x94>
8000a878:	fc0e92e3          	bnez	t4,8000a83c <etharp_find_entry+0x54>
8000a87c:	00178793          	addi	a5,a5,1
8000a880:	01079813          	slli	a6,a5,0x10
8000a884:	01085813          	srli	a6,a6,0x10
8000a888:	01081793          	slli	a5,a6,0x10
8000a88c:	01868693          	addi	a3,a3,24
8000a890:	4107d793          	srai	a5,a5,0x10
8000a894:	f9c81ee3          	bne	a6,t3,8000a830 <etharp_find_entry+0x48>
8000a898:	00100693          	li	a3,1
8000a89c:	fff00793          	li	a5,-1
8000a8a0:	06d59063          	bne	a1,a3,8000a900 <etharp_find_entry+0x118>
8000a8a4:	00060993          	mv	s3,a2
8000a8a8:	00050913          	mv	s2,a0
8000a8ac:	03c71063          	bne	a4,t3,8000a8cc <etharp_find_entry+0xe4>
8000a8b0:	08e89c63          	bne	a7,a4,8000a948 <etharp_find_entry+0x160>
8000a8b4:	01149663          	bne	s1,a7,8000a8c0 <etharp_find_entry+0xd8>
8000a8b8:	04930463          	beq	t1,s1,8000a900 <etharp_find_entry+0x118>
8000a8bc:	00030493          	mv	s1,t1
8000a8c0:	00048513          	mv	a0,s1
8000a8c4:	e99ff0ef          	jal	ra,8000a75c <etharp_free_entry>
8000a8c8:	00048713          	mv	a4,s1
8000a8cc:	00171793          	slli	a5,a4,0x1
8000a8d0:	00090c63          	beqz	s2,8000a8e8 <etharp_find_entry+0x100>
8000a8d4:	00092603          	lw	a2,0(s2)
8000a8d8:	00e786b3          	add	a3,a5,a4
8000a8dc:	00369693          	slli	a3,a3,0x3
8000a8e0:	00d406b3          	add	a3,s0,a3
8000a8e4:	00c6a223          	sw	a2,4(a3)
8000a8e8:	00e787b3          	add	a5,a5,a4
8000a8ec:	00379793          	slli	a5,a5,0x3
8000a8f0:	00f407b3          	add	a5,s0,a5
8000a8f4:	00079923          	sh	zero,18(a5)
8000a8f8:	0137a423          	sw	s3,8(a5)
8000a8fc:	00070793          	mv	a5,a4
8000a900:	01c12083          	lw	ra,28(sp)
8000a904:	01812403          	lw	s0,24(sp)
8000a908:	01412483          	lw	s1,20(sp)
8000a90c:	01012903          	lw	s2,16(sp)
8000a910:	00c12983          	lw	s3,12(sp)
8000a914:	00078513          	mv	a0,a5
8000a918:	02010113          	addi	sp,sp,32
8000a91c:	00008067          	ret
8000a920:	f5f86ee3          	bltu	a6,t6,8000a87c <etharp_find_entry+0x94>
8000a924:	00080f93          	mv	t6,a6
8000a928:	00078493          	mv	s1,a5
8000a92c:	f51ff06f          	j	8000a87c <etharp_find_entry+0x94>
8000a930:	f45866e3          	bltu	a6,t0,8000a87c <etharp_find_entry+0x94>
8000a934:	00080293          	mv	t0,a6
8000a938:	00078893          	mv	a7,a5
8000a93c:	f41ff06f          	j	8000a87c <etharp_find_entry+0x94>
8000a940:	00078713          	mv	a4,a5
8000a944:	f39ff06f          	j	8000a87c <etharp_find_entry+0x94>
8000a948:	00088493          	mv	s1,a7
8000a94c:	f75ff06f          	j	8000a8c0 <etharp_find_entry+0xd8>

8000a950 <etharp_raw>:
8000a950:	fc010113          	addi	sp,sp,-64
8000a954:	03312623          	sw	s3,44(sp)
8000a958:	03412423          	sw	s4,40(sp)
8000a95c:	03512223          	sw	s5,36(sp)
8000a960:	00050993          	mv	s3,a0
8000a964:	00058a13          	mv	s4,a1
8000a968:	00060a93          	mv	s5,a2
8000a96c:	01c00593          	li	a1,28
8000a970:	28000613          	li	a2,640
8000a974:	01000513          	li	a0,16
8000a978:	02912a23          	sw	s1,52(sp)
8000a97c:	03612023          	sw	s6,32(sp)
8000a980:	01712e23          	sw	s7,28(sp)
8000a984:	01812c23          	sw	s8,24(sp)
8000a988:	01912a23          	sw	s9,20(sp)
8000a98c:	01112623          	sw	a7,12(sp)
8000a990:	02112e23          	sw	ra,60(sp)
8000a994:	02812c23          	sw	s0,56(sp)
8000a998:	03212823          	sw	s2,48(sp)
8000a99c:	00068c93          	mv	s9,a3
8000a9a0:	00070b93          	mv	s7,a4
8000a9a4:	00078c13          	mv	s8,a5
8000a9a8:	00080b13          	mv	s6,a6
8000a9ac:	cd0fc0ef          	jal	ra,80006e7c <pbuf_alloc>
8000a9b0:	9f418493          	addi	s1,gp,-1548 # 80003194 <lwip_stats>
8000a9b4:	00c12883          	lw	a7,12(sp)
8000a9b8:	04051463          	bnez	a0,8000aa00 <etharp_raw+0xb0>
8000a9bc:	0484a783          	lw	a5,72(s1)
8000a9c0:	fff00513          	li	a0,-1
8000a9c4:	00178793          	addi	a5,a5,1
8000a9c8:	04f4a423          	sw	a5,72(s1)
8000a9cc:	03c12083          	lw	ra,60(sp)
8000a9d0:	03812403          	lw	s0,56(sp)
8000a9d4:	03412483          	lw	s1,52(sp)
8000a9d8:	03012903          	lw	s2,48(sp)
8000a9dc:	02c12983          	lw	s3,44(sp)
8000a9e0:	02812a03          	lw	s4,40(sp)
8000a9e4:	02412a83          	lw	s5,36(sp)
8000a9e8:	02012b03          	lw	s6,32(sp)
8000a9ec:	01c12b83          	lw	s7,28(sp)
8000a9f0:	01812c03          	lw	s8,24(sp)
8000a9f4:	01412c83          	lw	s9,20(sp)
8000a9f8:	04010113          	addi	sp,sp,64
8000a9fc:	00008067          	ret
8000aa00:	00452403          	lw	s0,4(a0)
8000aa04:	00050913          	mv	s2,a0
8000aa08:	00088513          	mv	a0,a7
8000aa0c:	978fb0ef          	jal	ra,80005b84 <lwip_htons>
8000aa10:	00a40323          	sb	a0,6(s0)
8000aa14:	00855513          	srli	a0,a0,0x8
8000aa18:	00a403a3          	sb	a0,7(s0)
8000aa1c:	00600613          	li	a2,6
8000aa20:	000c8593          	mv	a1,s9
8000aa24:	00840513          	addi	a0,s0,8
8000aa28:	414030ef          	jal	ra,8000de3c <memcpy>
8000aa2c:	00600613          	li	a2,6
8000aa30:	000c0593          	mv	a1,s8
8000aa34:	01240513          	addi	a0,s0,18
8000aa38:	404030ef          	jal	ra,8000de3c <memcpy>
8000aa3c:	00400613          	li	a2,4
8000aa40:	000b8593          	mv	a1,s7
8000aa44:	00e40513          	addi	a0,s0,14
8000aa48:	3f4030ef          	jal	ra,8000de3c <memcpy>
8000aa4c:	00400613          	li	a2,4
8000aa50:	000b0593          	mv	a1,s6
8000aa54:	01840513          	addi	a0,s0,24
8000aa58:	3e4030ef          	jal	ra,8000de3c <memcpy>
8000aa5c:	00100793          	li	a5,1
8000aa60:	00f400a3          	sb	a5,1(s0)
8000aa64:	00800793          	li	a5,8
8000aa68:	00f40123          	sb	a5,2(s0)
8000aa6c:	00600793          	li	a5,6
8000aa70:	00f40223          	sb	a5,4(s0)
8000aa74:	00001737          	lui	a4,0x1
8000aa78:	00400793          	li	a5,4
8000aa7c:	00f402a3          	sb	a5,5(s0)
8000aa80:	80670713          	addi	a4,a4,-2042 # 806 <_stack_size+0x6>
8000aa84:	000a8693          	mv	a3,s5
8000aa88:	000a0613          	mv	a2,s4
8000aa8c:	00090593          	mv	a1,s2
8000aa90:	00040023          	sb	zero,0(s0)
8000aa94:	000401a3          	sb	zero,3(s0)
8000aa98:	00098513          	mv	a0,s3
8000aa9c:	695010ef          	jal	ra,8000c930 <ethernet_output>
8000aaa0:	0304a783          	lw	a5,48(s1)
8000aaa4:	00090513          	mv	a0,s2
8000aaa8:	00178793          	addi	a5,a5,1
8000aaac:	02f4a823          	sw	a5,48(s1)
8000aab0:	af8fc0ef          	jal	ra,80006da8 <pbuf_free>
8000aab4:	00000513          	li	a0,0
8000aab8:	f15ff06f          	j	8000a9cc <etharp_raw+0x7c>

8000aabc <etharp_cleanup_netif>:
8000aabc:	fe010113          	addi	sp,sp,-32
8000aac0:	00812c23          	sw	s0,24(sp)
8000aac4:	00912a23          	sw	s1,20(sp)
8000aac8:	01212823          	sw	s2,16(sp)
8000aacc:	01312623          	sw	s3,12(sp)
8000aad0:	00112e23          	sw	ra,28(sp)
8000aad4:	00050993          	mv	s3,a0
8000aad8:	b3418413          	addi	s0,gp,-1228 # 800032d4 <arp_table>
8000aadc:	00000493          	li	s1,0
8000aae0:	00a00913          	li	s2,10
8000aae4:	01444783          	lbu	a5,20(s0)
8000aae8:	00078a63          	beqz	a5,8000aafc <etharp_cleanup_netif+0x40>
8000aaec:	00842783          	lw	a5,8(s0)
8000aaf0:	01379663          	bne	a5,s3,8000aafc <etharp_cleanup_netif+0x40>
8000aaf4:	00048513          	mv	a0,s1
8000aaf8:	c65ff0ef          	jal	ra,8000a75c <etharp_free_entry>
8000aafc:	00148493          	addi	s1,s1,1
8000ab00:	01840413          	addi	s0,s0,24
8000ab04:	ff2490e3          	bne	s1,s2,8000aae4 <etharp_cleanup_netif+0x28>
8000ab08:	01c12083          	lw	ra,28(sp)
8000ab0c:	01812403          	lw	s0,24(sp)
8000ab10:	01412483          	lw	s1,20(sp)
8000ab14:	01012903          	lw	s2,16(sp)
8000ab18:	00c12983          	lw	s3,12(sp)
8000ab1c:	02010113          	addi	sp,sp,32
8000ab20:	00008067          	ret

8000ab24 <etharp_find_addr>:
8000ab24:	fe010113          	addi	sp,sp,-32
8000ab28:	00058793          	mv	a5,a1
8000ab2c:	00812c23          	sw	s0,24(sp)
8000ab30:	00200593          	li	a1,2
8000ab34:	00060413          	mv	s0,a2
8000ab38:	00050613          	mv	a2,a0
8000ab3c:	00078513          	mv	a0,a5
8000ab40:	00112e23          	sw	ra,28(sp)
8000ab44:	00d12623          	sw	a3,12(sp)
8000ab48:	ca1ff0ef          	jal	ra,8000a7e8 <etharp_find_entry>
8000ab4c:	04054863          	bltz	a0,8000ab9c <etharp_find_addr+0x78>
8000ab50:	00151793          	slli	a5,a0,0x1
8000ab54:	00a787b3          	add	a5,a5,a0
8000ab58:	b3418713          	addi	a4,gp,-1228 # 800032d4 <arp_table>
8000ab5c:	00379793          	slli	a5,a5,0x3
8000ab60:	00f70633          	add	a2,a4,a5
8000ab64:	01464583          	lbu	a1,20(a2)
8000ab68:	00100613          	li	a2,1
8000ab6c:	02b67863          	bgeu	a2,a1,8000ab9c <etharp_find_addr+0x78>
8000ab70:	00c78613          	addi	a2,a5,12
8000ab74:	00c12683          	lw	a3,12(sp)
8000ab78:	00c70633          	add	a2,a4,a2
8000ab7c:	00478793          	addi	a5,a5,4
8000ab80:	00c42023          	sw	a2,0(s0)
8000ab84:	00f707b3          	add	a5,a4,a5
8000ab88:	00f6a023          	sw	a5,0(a3)
8000ab8c:	01c12083          	lw	ra,28(sp)
8000ab90:	01812403          	lw	s0,24(sp)
8000ab94:	02010113          	addi	sp,sp,32
8000ab98:	00008067          	ret
8000ab9c:	fff00513          	li	a0,-1
8000aba0:	fedff06f          	j	8000ab8c <etharp_find_addr+0x68>

8000aba4 <etharp_get_entry>:
8000aba4:	00900793          	li	a5,9
8000aba8:	04a7e863          	bltu	a5,a0,8000abf8 <etharp_get_entry+0x54>
8000abac:	00151793          	slli	a5,a0,0x1
8000abb0:	00a787b3          	add	a5,a5,a0
8000abb4:	b3418713          	addi	a4,gp,-1228 # 800032d4 <arp_table>
8000abb8:	00379793          	slli	a5,a5,0x3
8000abbc:	00f70833          	add	a6,a4,a5
8000abc0:	01484303          	lbu	t1,20(a6)
8000abc4:	00100893          	li	a7,1
8000abc8:	00000513          	li	a0,0
8000abcc:	0268f863          	bgeu	a7,t1,8000abfc <etharp_get_entry+0x58>
8000abd0:	00478513          	addi	a0,a5,4
8000abd4:	00a70533          	add	a0,a4,a0
8000abd8:	00a5a023          	sw	a0,0(a1)
8000abdc:	00882583          	lw	a1,8(a6)
8000abe0:	00c78793          	addi	a5,a5,12
8000abe4:	00f707b3          	add	a5,a4,a5
8000abe8:	00b62023          	sw	a1,0(a2)
8000abec:	00f6a023          	sw	a5,0(a3)
8000abf0:	00100513          	li	a0,1
8000abf4:	00008067          	ret
8000abf8:	00000513          	li	a0,0
8000abfc:	00008067          	ret

8000ac00 <etharp_input>:
8000ac00:	22058863          	beqz	a1,8000ae30 <etharp_input+0x230>
8000ac04:	fc010113          	addi	sp,sp,-64
8000ac08:	02812c23          	sw	s0,56(sp)
8000ac0c:	03212823          	sw	s2,48(sp)
8000ac10:	03312623          	sw	s3,44(sp)
8000ac14:	02112e23          	sw	ra,60(sp)
8000ac18:	02912a23          	sw	s1,52(sp)
8000ac1c:	03412423          	sw	s4,40(sp)
8000ac20:	03512223          	sw	s5,36(sp)
8000ac24:	03612023          	sw	s6,32(sp)
8000ac28:	01712e23          	sw	s7,28(sp)
8000ac2c:	00452483          	lw	s1,4(a0)
8000ac30:	00058413          	mv	s0,a1
8000ac34:	0014c783          	lbu	a5,1(s1)
8000ac38:	0004c703          	lbu	a4,0(s1)
8000ac3c:	00050993          	mv	s3,a0
8000ac40:	00879793          	slli	a5,a5,0x8
8000ac44:	00e7e7b3          	or	a5,a5,a4
8000ac48:	10000713          	li	a4,256
8000ac4c:	9f418913          	addi	s2,gp,-1548 # 80003194 <lwip_stats>
8000ac50:	02e79a63          	bne	a5,a4,8000ac84 <etharp_input+0x84>
8000ac54:	0044c703          	lbu	a4,4(s1)
8000ac58:	00600793          	li	a5,6
8000ac5c:	02f71463          	bne	a4,a5,8000ac84 <etharp_input+0x84>
8000ac60:	0054c703          	lbu	a4,5(s1)
8000ac64:	00400793          	li	a5,4
8000ac68:	00f71e63          	bne	a4,a5,8000ac84 <etharp_input+0x84>
8000ac6c:	0034c783          	lbu	a5,3(s1)
8000ac70:	0024c703          	lbu	a4,2(s1)
8000ac74:	00879793          	slli	a5,a5,0x8
8000ac78:	00e7e7b3          	or	a5,a5,a4
8000ac7c:	00800713          	li	a4,8
8000ac80:	04e78863          	beq	a5,a4,8000acd0 <etharp_input+0xd0>
8000ac84:	05092783          	lw	a5,80(s2)
8000ac88:	00178793          	addi	a5,a5,1
8000ac8c:	04f92823          	sw	a5,80(s2)
8000ac90:	03c92783          	lw	a5,60(s2)
8000ac94:	00178793          	addi	a5,a5,1
8000ac98:	02f92e23          	sw	a5,60(s2)
8000ac9c:	00098513          	mv	a0,s3
8000aca0:	908fc0ef          	jal	ra,80006da8 <pbuf_free>
8000aca4:	03c12083          	lw	ra,60(sp)
8000aca8:	03812403          	lw	s0,56(sp)
8000acac:	03412483          	lw	s1,52(sp)
8000acb0:	03012903          	lw	s2,48(sp)
8000acb4:	02c12983          	lw	s3,44(sp)
8000acb8:	02812a03          	lw	s4,40(sp)
8000acbc:	02412a83          	lw	s5,36(sp)
8000acc0:	02012b03          	lw	s6,32(sp)
8000acc4:	01c12b83          	lw	s7,28(sp)
8000acc8:	04010113          	addi	sp,sp,64
8000accc:	00008067          	ret
8000acd0:	03492783          	lw	a5,52(s2)
8000acd4:	00400613          	li	a2,4
8000acd8:	00e48593          	addi	a1,s1,14
8000acdc:	00178793          	addi	a5,a5,1
8000ace0:	00810513          	addi	a0,sp,8
8000ace4:	02f92a23          	sw	a5,52(s2)
8000ace8:	154030ef          	jal	ra,8000de3c <memcpy>
8000acec:	00400613          	li	a2,4
8000acf0:	01848593          	addi	a1,s1,24
8000acf4:	00c10513          	addi	a0,sp,12
8000acf8:	144030ef          	jal	ra,8000de3c <memcpy>
8000acfc:	00442783          	lw	a5,4(s0)
8000ad00:	00848a13          	addi	s4,s1,8
8000ad04:	00078663          	beqz	a5,8000ad10 <etharp_input+0x110>
8000ad08:	00c12703          	lw	a4,12(sp)
8000ad0c:	0ce78e63          	beq	a5,a4,8000ade8 <etharp_input+0x1e8>
8000ad10:	00000a93          	li	s5,0
8000ad14:	00200b13          	li	s6,2
8000ad18:	00812503          	lw	a0,8(sp)
8000ad1c:	08050e63          	beqz	a0,8000adb8 <etharp_input+0x1b8>
8000ad20:	00040593          	mv	a1,s0
8000ad24:	630010ef          	jal	ra,8000c354 <ip4_addr_isbroadcast_u32>
8000ad28:	08051863          	bnez	a0,8000adb8 <etharp_input+0x1b8>
8000ad2c:	00812783          	lw	a5,8(sp)
8000ad30:	0e000713          	li	a4,224
8000ad34:	0f07f793          	andi	a5,a5,240
8000ad38:	08e78063          	beq	a5,a4,8000adb8 <etharp_input+0x1b8>
8000ad3c:	00040613          	mv	a2,s0
8000ad40:	000b0593          	mv	a1,s6
8000ad44:	00810513          	addi	a0,sp,8
8000ad48:	aa1ff0ef          	jal	ra,8000a7e8 <etharp_find_entry>
8000ad4c:	06054663          	bltz	a0,8000adb8 <etharp_input+0x1b8>
8000ad50:	00151793          	slli	a5,a0,0x1
8000ad54:	00a787b3          	add	a5,a5,a0
8000ad58:	b3418713          	addi	a4,gp,-1228 # 800032d4 <arp_table>
8000ad5c:	00379793          	slli	a5,a5,0x3
8000ad60:	00f70b33          	add	s6,a4,a5
8000ad64:	00200693          	li	a3,2
8000ad68:	00c78793          	addi	a5,a5,12
8000ad6c:	00db0a23          	sb	a3,20(s6)
8000ad70:	008b2423          	sw	s0,8(s6)
8000ad74:	00600613          	li	a2,6
8000ad78:	000a0593          	mv	a1,s4
8000ad7c:	00f70533          	add	a0,a4,a5
8000ad80:	0bc030ef          	jal	ra,8000de3c <memcpy>
8000ad84:	000b2b83          	lw	s7,0(s6)
8000ad88:	000b1923          	sh	zero,18(s6)
8000ad8c:	020b8663          	beqz	s7,8000adb8 <etharp_input+0x1b8>
8000ad90:	00001737          	lui	a4,0x1
8000ad94:	000b2023          	sw	zero,0(s6)
8000ad98:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000ad9c:	000a0693          	mv	a3,s4
8000ada0:	02e40613          	addi	a2,s0,46
8000ada4:	000b8593          	mv	a1,s7
8000ada8:	00040513          	mv	a0,s0
8000adac:	385010ef          	jal	ra,8000c930 <ethernet_output>
8000adb0:	000b8513          	mv	a0,s7
8000adb4:	ff5fb0ef          	jal	ra,80006da8 <pbuf_free>
8000adb8:	0074c783          	lbu	a5,7(s1)
8000adbc:	0064c703          	lbu	a4,6(s1)
8000adc0:	00879793          	slli	a5,a5,0x8
8000adc4:	00e7e7b3          	or	a5,a5,a4
8000adc8:	10000713          	li	a4,256
8000adcc:	02e78463          	beq	a5,a4,8000adf4 <etharp_input+0x1f4>
8000add0:	20000713          	li	a4,512
8000add4:	04e78663          	beq	a5,a4,8000ae20 <etharp_input+0x220>
8000add8:	05892783          	lw	a5,88(s2)
8000addc:	00178793          	addi	a5,a5,1
8000ade0:	04f92c23          	sw	a5,88(s2)
8000ade4:	eb9ff06f          	j	8000ac9c <etharp_input+0x9c>
8000ade8:	00100a93          	li	s5,1
8000adec:	00100b13          	li	s6,1
8000adf0:	f29ff06f          	j	8000ad18 <etharp_input+0x118>
8000adf4:	ea0a84e3          	beqz	s5,8000ac9c <etharp_input+0x9c>
8000adf8:	02e40693          	addi	a3,s0,46
8000adfc:	00200893          	li	a7,2
8000ae00:	00810813          	addi	a6,sp,8
8000ae04:	000a0793          	mv	a5,s4
8000ae08:	00440713          	addi	a4,s0,4
8000ae0c:	000a0613          	mv	a2,s4
8000ae10:	00068593          	mv	a1,a3
8000ae14:	00040513          	mv	a0,s0
8000ae18:	b39ff0ef          	jal	ra,8000a950 <etharp_raw>
8000ae1c:	e81ff06f          	j	8000ac9c <etharp_input+0x9c>
8000ae20:	00810593          	addi	a1,sp,8
8000ae24:	00040513          	mv	a0,s0
8000ae28:	fd5fe0ef          	jal	ra,80009dfc <dhcp_arp_reply>
8000ae2c:	e71ff06f          	j	8000ac9c <etharp_input+0x9c>
8000ae30:	00008067          	ret

8000ae34 <etharp_request>:
8000ae34:	02e50693          	addi	a3,a0,46
8000ae38:	00058813          	mv	a6,a1
8000ae3c:	00100893          	li	a7,1
8000ae40:	84c18793          	addi	a5,gp,-1972 # 80002fec <ethzero>
8000ae44:	00450713          	addi	a4,a0,4
8000ae48:	85418613          	addi	a2,gp,-1964 # 80002ff4 <ethbroadcast>
8000ae4c:	00068593          	mv	a1,a3
8000ae50:	b01ff06f          	j	8000a950 <etharp_raw>

8000ae54 <etharp_tmr>:
8000ae54:	fd010113          	addi	sp,sp,-48
8000ae58:	02812423          	sw	s0,40(sp)
8000ae5c:	02912223          	sw	s1,36(sp)
8000ae60:	03212023          	sw	s2,32(sp)
8000ae64:	01312e23          	sw	s3,28(sp)
8000ae68:	01412c23          	sw	s4,24(sp)
8000ae6c:	01512a23          	sw	s5,20(sp)
8000ae70:	01612823          	sw	s6,16(sp)
8000ae74:	01712623          	sw	s7,12(sp)
8000ae78:	02112623          	sw	ra,44(sp)
8000ae7c:	b3418413          	addi	s0,gp,-1228 # 800032d4 <arp_table>
8000ae80:	00000493          	li	s1,0
8000ae84:	12b00a13          	li	s4,299
8000ae88:	00100a93          	li	s5,1
8000ae8c:	00300b13          	li	s6,3
8000ae90:	00400913          	li	s2,4
8000ae94:	00200b93          	li	s7,2
8000ae98:	00a00993          	li	s3,10
8000ae9c:	01444703          	lbu	a4,20(s0)
8000aea0:	02070663          	beqz	a4,8000aecc <etharp_tmr+0x78>
8000aea4:	01245783          	lhu	a5,18(s0)
8000aea8:	00178793          	addi	a5,a5,1
8000aeac:	01079793          	slli	a5,a5,0x10
8000aeb0:	0107d793          	srli	a5,a5,0x10
8000aeb4:	00f41923          	sh	a5,18(s0)
8000aeb8:	00fa6663          	bltu	s4,a5,8000aec4 <etharp_tmr+0x70>
8000aebc:	05571463          	bne	a4,s5,8000af04 <etharp_tmr+0xb0>
8000aec0:	04f97e63          	bgeu	s2,a5,8000af1c <etharp_tmr+0xc8>
8000aec4:	00048513          	mv	a0,s1
8000aec8:	895ff0ef          	jal	ra,8000a75c <etharp_free_entry>
8000aecc:	00148493          	addi	s1,s1,1
8000aed0:	01840413          	addi	s0,s0,24
8000aed4:	fd3494e3          	bne	s1,s3,8000ae9c <etharp_tmr+0x48>
8000aed8:	02c12083          	lw	ra,44(sp)
8000aedc:	02812403          	lw	s0,40(sp)
8000aee0:	02412483          	lw	s1,36(sp)
8000aee4:	02012903          	lw	s2,32(sp)
8000aee8:	01c12983          	lw	s3,28(sp)
8000aeec:	01812a03          	lw	s4,24(sp)
8000aef0:	01412a83          	lw	s5,20(sp)
8000aef4:	01012b03          	lw	s6,16(sp)
8000aef8:	00c12b83          	lw	s7,12(sp)
8000aefc:	03010113          	addi	sp,sp,48
8000af00:	00008067          	ret
8000af04:	01671663          	bne	a4,s6,8000af10 <etharp_tmr+0xbc>
8000af08:	01240a23          	sb	s2,20(s0)
8000af0c:	fc1ff06f          	j	8000aecc <etharp_tmr+0x78>
8000af10:	fb271ee3          	bne	a4,s2,8000aecc <etharp_tmr+0x78>
8000af14:	01740a23          	sb	s7,20(s0)
8000af18:	fb5ff06f          	j	8000aecc <etharp_tmr+0x78>
8000af1c:	00842503          	lw	a0,8(s0)
8000af20:	00440593          	addi	a1,s0,4
8000af24:	f11ff0ef          	jal	ra,8000ae34 <etharp_request>
8000af28:	fa5ff06f          	j	8000aecc <etharp_tmr+0x78>

8000af2c <etharp_output_to_arp_index>:
8000af2c:	fe010113          	addi	sp,sp,-32
8000af30:	01412423          	sw	s4,8(sp)
8000af34:	00058a13          	mv	s4,a1
8000af38:	00161593          	slli	a1,a2,0x1
8000af3c:	00c58633          	add	a2,a1,a2
8000af40:	00361613          	slli	a2,a2,0x3
8000af44:	b3418593          	addi	a1,gp,-1228 # 800032d4 <arp_table>
8000af48:	00812c23          	sw	s0,24(sp)
8000af4c:	00912a23          	sw	s1,20(sp)
8000af50:	01212823          	sw	s2,16(sp)
8000af54:	01312623          	sw	s3,12(sp)
8000af58:	00112e23          	sw	ra,28(sp)
8000af5c:	00c584b3          	add	s1,a1,a2
8000af60:	0144c703          	lbu	a4,20(s1)
8000af64:	00c60413          	addi	s0,a2,12
8000af68:	00200793          	li	a5,2
8000af6c:	00050913          	mv	s2,a0
8000af70:	00858433          	add	s0,a1,s0
8000af74:	02e50993          	addi	s3,a0,46
8000af78:	02f71463          	bne	a4,a5,8000afa0 <etharp_output_to_arp_index+0x74>
8000af7c:	0124d783          	lhu	a5,18(s1)
8000af80:	11c00713          	li	a4,284
8000af84:	04f77a63          	bgeu	a4,a5,8000afd8 <etharp_output_to_arp_index+0xac>
8000af88:	00460613          	addi	a2,a2,4
8000af8c:	00c585b3          	add	a1,a1,a2
8000af90:	ea5ff0ef          	jal	ra,8000ae34 <etharp_request>
8000af94:	00051663          	bnez	a0,8000afa0 <etharp_output_to_arp_index+0x74>
8000af98:	00300793          	li	a5,3
8000af9c:	00f48a23          	sb	a5,20(s1)
8000afa0:	00040693          	mv	a3,s0
8000afa4:	01812403          	lw	s0,24(sp)
8000afa8:	01c12083          	lw	ra,28(sp)
8000afac:	01412483          	lw	s1,20(sp)
8000afb0:	00098613          	mv	a2,s3
8000afb4:	000a0593          	mv	a1,s4
8000afb8:	00c12983          	lw	s3,12(sp)
8000afbc:	00812a03          	lw	s4,8(sp)
8000afc0:	00090513          	mv	a0,s2
8000afc4:	01012903          	lw	s2,16(sp)
8000afc8:	00001737          	lui	a4,0x1
8000afcc:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000afd0:	02010113          	addi	sp,sp,32
8000afd4:	15d0106f          	j	8000c930 <ethernet_output>
8000afd8:	10d00713          	li	a4,269
8000afdc:	fcf772e3          	bgeu	a4,a5,8000afa0 <etharp_output_to_arp_index+0x74>
8000afe0:	00460613          	addi	a2,a2,4
8000afe4:	00c58833          	add	a6,a1,a2
8000afe8:	00100893          	li	a7,1
8000afec:	84c18793          	addi	a5,gp,-1972 # 80002fec <ethzero>
8000aff0:	00450713          	addi	a4,a0,4
8000aff4:	00098693          	mv	a3,s3
8000aff8:	00040613          	mv	a2,s0
8000affc:	00098593          	mv	a1,s3
8000b000:	951ff0ef          	jal	ra,8000a950 <etharp_raw>
8000b004:	f91ff06f          	j	8000af94 <etharp_output_to_arp_index+0x68>

8000b008 <etharp_query>:
8000b008:	fe010113          	addi	sp,sp,-32
8000b00c:	01512223          	sw	s5,4(sp)
8000b010:	00058a93          	mv	s5,a1
8000b014:	00912a23          	sw	s1,20(sp)
8000b018:	00050593          	mv	a1,a0
8000b01c:	00050493          	mv	s1,a0
8000b020:	000aa503          	lw	a0,0(s5)
8000b024:	01312623          	sw	s3,12(sp)
8000b028:	00112e23          	sw	ra,28(sp)
8000b02c:	00812c23          	sw	s0,24(sp)
8000b030:	01212823          	sw	s2,16(sp)
8000b034:	01412423          	sw	s4,8(sp)
8000b038:	00060993          	mv	s3,a2
8000b03c:	318010ef          	jal	ra,8000c354 <ip4_addr_isbroadcast_u32>
8000b040:	16051a63          	bnez	a0,8000b1b4 <etharp_query+0x1ac>
8000b044:	000aa783          	lw	a5,0(s5)
8000b048:	0e000713          	li	a4,224
8000b04c:	0f07f693          	andi	a3,a5,240
8000b050:	16e68263          	beq	a3,a4,8000b1b4 <etharp_query+0x1ac>
8000b054:	16078063          	beqz	a5,8000b1b4 <etharp_query+0x1ac>
8000b058:	00048613          	mv	a2,s1
8000b05c:	00100593          	li	a1,1
8000b060:	000a8513          	mv	a0,s5
8000b064:	f84ff0ef          	jal	ra,8000a7e8 <etharp_find_entry>
8000b068:	02055e63          	bgez	a0,8000b0a4 <etharp_query+0x9c>
8000b06c:	00098a63          	beqz	s3,8000b080 <etharp_query+0x78>
8000b070:	9f418793          	addi	a5,gp,-1548 # 80003194 <lwip_stats>
8000b074:	0487a703          	lw	a4,72(a5)
8000b078:	00170713          	addi	a4,a4,1
8000b07c:	04e7a423          	sw	a4,72(a5)
8000b080:	01c12083          	lw	ra,28(sp)
8000b084:	01812403          	lw	s0,24(sp)
8000b088:	01412483          	lw	s1,20(sp)
8000b08c:	01012903          	lw	s2,16(sp)
8000b090:	00c12983          	lw	s3,12(sp)
8000b094:	00812a03          	lw	s4,8(sp)
8000b098:	00412a83          	lw	s5,4(sp)
8000b09c:	02010113          	addi	sp,sp,32
8000b0a0:	00008067          	ret
8000b0a4:	0ff57413          	andi	s0,a0,255
8000b0a8:	00141a13          	slli	s4,s0,0x1
8000b0ac:	008a0733          	add	a4,s4,s0
8000b0b0:	b3418793          	addi	a5,gp,-1228 # 800032d4 <arp_table>
8000b0b4:	00371713          	slli	a4,a4,0x3
8000b0b8:	00e787b3          	add	a5,a5,a4
8000b0bc:	0147c703          	lbu	a4,20(a5)
8000b0c0:	b3418913          	addi	s2,gp,-1228 # 800032d4 <arp_table>
8000b0c4:	08070663          	beqz	a4,8000b150 <etharp_query+0x148>
8000b0c8:	fff00513          	li	a0,-1
8000b0cc:	00099a63          	bnez	s3,8000b0e0 <etharp_query+0xd8>
8000b0d0:	000a8593          	mv	a1,s5
8000b0d4:	00048513          	mv	a0,s1
8000b0d8:	d5dff0ef          	jal	ra,8000ae34 <etharp_request>
8000b0dc:	fa0982e3          	beqz	s3,8000b080 <etharp_query+0x78>
8000b0e0:	008a07b3          	add	a5,s4,s0
8000b0e4:	00379793          	slli	a5,a5,0x3
8000b0e8:	00f907b3          	add	a5,s2,a5
8000b0ec:	0147c703          	lbu	a4,20(a5)
8000b0f0:	00100793          	li	a5,1
8000b0f4:	06e7f663          	bgeu	a5,a4,8000b160 <etharp_query+0x158>
8000b0f8:	00048863          	beqz	s1,8000b108 <etharp_query+0x100>
8000b0fc:	03c4a783          	lw	a5,60(s1)
8000b100:	00078463          	beqz	a5,8000b108 <etharp_query+0x100>
8000b104:	00878023          	sb	s0,0(a5)
8000b108:	008a06b3          	add	a3,s4,s0
8000b10c:	00369693          	slli	a3,a3,0x3
8000b110:	01812403          	lw	s0,24(sp)
8000b114:	00c68693          	addi	a3,a3,12
8000b118:	01c12083          	lw	ra,28(sp)
8000b11c:	00812a03          	lw	s4,8(sp)
8000b120:	00412a83          	lw	s5,4(sp)
8000b124:	00d906b3          	add	a3,s2,a3
8000b128:	02e48613          	addi	a2,s1,46
8000b12c:	01012903          	lw	s2,16(sp)
8000b130:	00098593          	mv	a1,s3
8000b134:	00048513          	mv	a0,s1
8000b138:	00c12983          	lw	s3,12(sp)
8000b13c:	01412483          	lw	s1,20(sp)
8000b140:	00001737          	lui	a4,0x1
8000b144:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b148:	02010113          	addi	sp,sp,32
8000b14c:	7e40106f          	j	8000c930 <ethernet_output>
8000b150:	00100713          	li	a4,1
8000b154:	00e78a23          	sb	a4,20(a5)
8000b158:	0097a423          	sw	s1,8(a5)
8000b15c:	f75ff06f          	j	8000b0d0 <etharp_query+0xc8>
8000b160:	f2f710e3          	bne	a4,a5,8000b080 <etharp_query+0x78>
8000b164:	00098793          	mv	a5,s3
8000b168:	00c7c703          	lbu	a4,12(a5)
8000b16c:	04077713          	andi	a4,a4,64
8000b170:	04071663          	bnez	a4,8000b1bc <etharp_query+0x1b4>
8000b174:	0007a783          	lw	a5,0(a5)
8000b178:	fe0798e3          	bnez	a5,8000b168 <etharp_query+0x160>
8000b17c:	00098513          	mv	a0,s3
8000b180:	810fc0ef          	jal	ra,80007190 <pbuf_ref>
8000b184:	008a07b3          	add	a5,s4,s0
8000b188:	00379793          	slli	a5,a5,0x3
8000b18c:	00f907b3          	add	a5,s2,a5
8000b190:	0007a503          	lw	a0,0(a5)
8000b194:	00050463          	beqz	a0,8000b19c <etharp_query+0x194>
8000b198:	c11fb0ef          	jal	ra,80006da8 <pbuf_free>
8000b19c:	008a0433          	add	s0,s4,s0
8000b1a0:	00341413          	slli	s0,s0,0x3
8000b1a4:	00890433          	add	s0,s2,s0
8000b1a8:	01342023          	sw	s3,0(s0)
8000b1ac:	00000513          	li	a0,0
8000b1b0:	ed1ff06f          	j	8000b080 <etharp_query+0x78>
8000b1b4:	ff000513          	li	a0,-16
8000b1b8:	ec9ff06f          	j	8000b080 <etharp_query+0x78>
8000b1bc:	00098613          	mv	a2,s3
8000b1c0:	28000593          	li	a1,640
8000b1c4:	01000513          	li	a0,16
8000b1c8:	c78fc0ef          	jal	ra,80007640 <pbuf_clone>
8000b1cc:	00050993          	mv	s3,a0
8000b1d0:	fa051ae3          	bnez	a0,8000b184 <etharp_query+0x17c>
8000b1d4:	9f418793          	addi	a5,gp,-1548 # 80003194 <lwip_stats>
8000b1d8:	0487a703          	lw	a4,72(a5)
8000b1dc:	fff00513          	li	a0,-1
8000b1e0:	00170713          	addi	a4,a4,1
8000b1e4:	04e7a423          	sw	a4,72(a5)
8000b1e8:	e99ff06f          	j	8000b080 <etharp_query+0x78>

8000b1ec <etharp_output>:
8000b1ec:	fe010113          	addi	sp,sp,-32
8000b1f0:	00812c23          	sw	s0,24(sp)
8000b1f4:	00912a23          	sw	s1,20(sp)
8000b1f8:	01212823          	sw	s2,16(sp)
8000b1fc:	00112e23          	sw	ra,28(sp)
8000b200:	00050413          	mv	s0,a0
8000b204:	00058913          	mv	s2,a1
8000b208:	00050593          	mv	a1,a0
8000b20c:	00062503          	lw	a0,0(a2)
8000b210:	00060493          	mv	s1,a2
8000b214:	140010ef          	jal	ra,8000c354 <ip4_addr_isbroadcast_u32>
8000b218:	16051863          	bnez	a0,8000b388 <etharp_output+0x19c>
8000b21c:	0004a783          	lw	a5,0(s1)
8000b220:	0e000713          	li	a4,224
8000b224:	0f07f613          	andi	a2,a5,240
8000b228:	04e61863          	bne	a2,a4,8000b278 <etharp_output+0x8c>
8000b22c:	00100793          	li	a5,1
8000b230:	00f11423          	sh	a5,8(sp)
8000b234:	05e00793          	li	a5,94
8000b238:	00f10523          	sb	a5,10(sp)
8000b23c:	0014c783          	lbu	a5,1(s1)
8000b240:	00810693          	addi	a3,sp,8
8000b244:	07f7f793          	andi	a5,a5,127
8000b248:	00f105a3          	sb	a5,11(sp)
8000b24c:	0024c783          	lbu	a5,2(s1)
8000b250:	00f10623          	sb	a5,12(sp)
8000b254:	0034c783          	lbu	a5,3(s1)
8000b258:	00f106a3          	sb	a5,13(sp)
8000b25c:	00001737          	lui	a4,0x1
8000b260:	80070713          	addi	a4,a4,-2048 # 800 <_stack_size>
8000b264:	02e40613          	addi	a2,s0,46
8000b268:	00090593          	mv	a1,s2
8000b26c:	00040513          	mv	a0,s0
8000b270:	6c0010ef          	jal	ra,8000c930 <ethernet_output>
8000b274:	0a40006f          	j	8000b318 <etharp_output+0x12c>
8000b278:	00442703          	lw	a4,4(s0)
8000b27c:	00842603          	lw	a2,8(s0)
8000b280:	00050693          	mv	a3,a0
8000b284:	00e7c733          	xor	a4,a5,a4
8000b288:	00c77733          	and	a4,a4,a2
8000b28c:	02070463          	beqz	a4,8000b2b4 <etharp_output+0xc8>
8000b290:	01079793          	slli	a5,a5,0x10
8000b294:	00010737          	lui	a4,0x10
8000b298:	0107d793          	srli	a5,a5,0x10
8000b29c:	ea970713          	addi	a4,a4,-343 # fea9 <_stack_size+0xf6a9>
8000b2a0:	00e78a63          	beq	a5,a4,8000b2b4 <etharp_output+0xc8>
8000b2a4:	00c42783          	lw	a5,12(s0)
8000b2a8:	ffc00513          	li	a0,-4
8000b2ac:	06078663          	beqz	a5,8000b318 <etharp_output+0x12c>
8000b2b0:	00c40493          	addi	s1,s0,12
8000b2b4:	03c42583          	lw	a1,60(s0)
8000b2b8:	b3418793          	addi	a5,gp,-1228 # 800032d4 <arp_table>
8000b2bc:	06058a63          	beqz	a1,8000b330 <etharp_output+0x144>
8000b2c0:	0005c603          	lbu	a2,0(a1)
8000b2c4:	00900713          	li	a4,9
8000b2c8:	06c76463          	bltu	a4,a2,8000b330 <etharp_output+0x144>
8000b2cc:	00161713          	slli	a4,a2,0x1
8000b2d0:	00c70733          	add	a4,a4,a2
8000b2d4:	00371713          	slli	a4,a4,0x3
8000b2d8:	00e78733          	add	a4,a5,a4
8000b2dc:	01474803          	lbu	a6,20(a4)
8000b2e0:	00100513          	li	a0,1
8000b2e4:	05057663          	bgeu	a0,a6,8000b330 <etharp_output+0x144>
8000b2e8:	00872503          	lw	a0,8(a4)
8000b2ec:	04851263          	bne	a0,s0,8000b330 <etharp_output+0x144>
8000b2f0:	0004a503          	lw	a0,0(s1)
8000b2f4:	00472703          	lw	a4,4(a4)
8000b2f8:	02e51c63          	bne	a0,a4,8000b330 <etharp_output+0x144>
8000b2fc:	9f418793          	addi	a5,gp,-1548 # 80003194 <lwip_stats>
8000b300:	05c7a703          	lw	a4,92(a5)
8000b304:	00170713          	addi	a4,a4,1
8000b308:	04e7ae23          	sw	a4,92(a5)
8000b30c:	00090593          	mv	a1,s2
8000b310:	00040513          	mv	a0,s0
8000b314:	c19ff0ef          	jal	ra,8000af2c <etharp_output_to_arp_index>
8000b318:	01c12083          	lw	ra,28(sp)
8000b31c:	01812403          	lw	s0,24(sp)
8000b320:	01412483          	lw	s1,20(sp)
8000b324:	01012903          	lw	s2,16(sp)
8000b328:	02010113          	addi	sp,sp,32
8000b32c:	00008067          	ret
8000b330:	00100613          	li	a2,1
8000b334:	00a00713          	li	a4,10
8000b338:	0147c503          	lbu	a0,20(a5)
8000b33c:	02a67463          	bgeu	a2,a0,8000b364 <etharp_output+0x178>
8000b340:	0087a503          	lw	a0,8(a5)
8000b344:	02851063          	bne	a0,s0,8000b364 <etharp_output+0x178>
8000b348:	0004a803          	lw	a6,0(s1)
8000b34c:	0047a503          	lw	a0,4(a5)
8000b350:	00a81a63          	bne	a6,a0,8000b364 <etharp_output+0x178>
8000b354:	00058463          	beqz	a1,8000b35c <etharp_output+0x170>
8000b358:	00d58023          	sb	a3,0(a1)
8000b35c:	00068613          	mv	a2,a3
8000b360:	fadff06f          	j	8000b30c <etharp_output+0x120>
8000b364:	00168693          	addi	a3,a3,1
8000b368:	0ff6f693          	andi	a3,a3,255
8000b36c:	01878793          	addi	a5,a5,24
8000b370:	fce694e3          	bne	a3,a4,8000b338 <etharp_output+0x14c>
8000b374:	00090613          	mv	a2,s2
8000b378:	00048593          	mv	a1,s1
8000b37c:	00040513          	mv	a0,s0
8000b380:	c89ff0ef          	jal	ra,8000b008 <etharp_query>
8000b384:	f95ff06f          	j	8000b318 <etharp_output+0x12c>
8000b388:	85418693          	addi	a3,gp,-1964 # 80002ff4 <ethbroadcast>
8000b38c:	ed1ff06f          	j	8000b25c <etharp_output+0x70>

8000b390 <icmp_input>:
8000b390:	fd010113          	addi	sp,sp,-48
8000b394:	02912223          	sw	s1,36(sp)
8000b398:	02812423          	sw	s0,40(sp)
8000b39c:	01712623          	sw	s7,12(sp)
8000b3a0:	02112623          	sw	ra,44(sp)
8000b3a4:	03212023          	sw	s2,32(sp)
8000b3a8:	01312e23          	sw	s3,28(sp)
8000b3ac:	01412c23          	sw	s4,24(sp)
8000b3b0:	01512a23          	sw	s5,20(sp)
8000b3b4:	01612823          	sw	s6,16(sp)
8000b3b8:	01812423          	sw	s8,8(sp)
8000b3bc:	9f418793          	addi	a5,gp,-1548 # 80003194 <lwip_stats>
8000b3c0:	0c47a703          	lw	a4,196(a5)
8000b3c4:	00050413          	mv	s0,a0
8000b3c8:	00170713          	addi	a4,a4,1
8000b3cc:	0ce7a223          	sw	a4,196(a5)
8000b3d0:	9dc18713          	addi	a4,gp,-1572 # 8000317c <ip_data>
8000b3d4:	00872c03          	lw	s8,8(a4)
8000b3d8:	01300713          	li	a4,19
8000b3dc:	9f418493          	addi	s1,gp,-1548 # 80003194 <lwip_stats>
8000b3e0:	000c4a83          	lbu	s5,0(s8)
8000b3e4:	00fafa93          	andi	s5,s5,15
8000b3e8:	002a9a93          	slli	s5,s5,0x2
8000b3ec:	2b577863          	bgeu	a4,s5,8000b69c <icmp_input+0x30c>
8000b3f0:	00a55683          	lhu	a3,10(a0)
8000b3f4:	00300713          	li	a4,3
8000b3f8:	2ad77263          	bgeu	a4,a3,8000b69c <icmp_input+0x30c>
8000b3fc:	00452703          	lw	a4,4(a0)
8000b400:	00074703          	lbu	a4,0(a4)
8000b404:	22070663          	beqz	a4,8000b630 <icmp_input+0x2a0>
8000b408:	00800693          	li	a3,8
8000b40c:	26d71a63          	bne	a4,a3,8000b680 <icmp_input+0x2f0>
8000b410:	9dc18b93          	addi	s7,gp,-1572 # 8000317c <ip_data>
8000b414:	014ba503          	lw	a0,20(s7)
8000b418:	0e000793          	li	a5,224
8000b41c:	00058993          	mv	s3,a1
8000b420:	0f057713          	andi	a4,a0,240
8000b424:	00458913          	addi	s2,a1,4
8000b428:	00f70463          	beq	a4,a5,8000b430 <icmp_input+0xa0>
8000b42c:	9f018913          	addi	s2,gp,-1552 # 80003190 <ip_data+0x14>
8000b430:	000ba583          	lw	a1,0(s7)
8000b434:	721000ef          	jal	ra,8000c354 <ip4_addr_isbroadcast_u32>
8000b438:	00050463          	beqz	a0,8000b440 <icmp_input+0xb0>
8000b43c:	00498913          	addi	s2,s3,4
8000b440:	00845703          	lhu	a4,8(s0)
8000b444:	00700793          	li	a5,7
8000b448:	24e7fa63          	bgeu	a5,a4,8000b69c <icmp_input+0x30c>
8000b44c:	00040513          	mv	a0,s0
8000b450:	d4dfa0ef          	jal	ra,8000619c <inet_chksum_pbuf>
8000b454:	04050463          	beqz	a0,8000b49c <icmp_input+0x10c>
8000b458:	00040513          	mv	a0,s0
8000b45c:	94dfb0ef          	jal	ra,80006da8 <pbuf_free>
8000b460:	0d04a783          	lw	a5,208(s1)
8000b464:	00178793          	addi	a5,a5,1
8000b468:	0cf4a823          	sw	a5,208(s1)
8000b46c:	02c12083          	lw	ra,44(sp)
8000b470:	02812403          	lw	s0,40(sp)
8000b474:	02412483          	lw	s1,36(sp)
8000b478:	02012903          	lw	s2,32(sp)
8000b47c:	01c12983          	lw	s3,28(sp)
8000b480:	01812a03          	lw	s4,24(sp)
8000b484:	01412a83          	lw	s5,20(sp)
8000b488:	01012b03          	lw	s6,16(sp)
8000b48c:	00c12b83          	lw	s7,12(sp)
8000b490:	00812c03          	lw	s8,8(sp)
8000b494:	03010113          	addi	sp,sp,48
8000b498:	00008067          	ret
8000b49c:	010a8b13          	addi	s6,s5,16
8000b4a0:	010a9a13          	slli	s4,s5,0x10
8000b4a4:	000b0593          	mv	a1,s6
8000b4a8:	00040513          	mv	a0,s0
8000b4ac:	010a5a13          	srli	s4,s4,0x10
8000b4b0:	861fb0ef          	jal	ra,80006d10 <pbuf_add_header>
8000b4b4:	1a050863          	beqz	a0,8000b664 <icmp_input+0x2d4>
8000b4b8:	00845783          	lhu	a5,8(s0)
8000b4bc:	014785b3          	add	a1,a5,s4
8000b4c0:	01059593          	slli	a1,a1,0x10
8000b4c4:	0105d593          	srli	a1,a1,0x10
8000b4c8:	02f5e463          	bltu	a1,a5,8000b4f0 <icmp_input+0x160>
8000b4cc:	28000613          	li	a2,640
8000b4d0:	01000513          	li	a0,16
8000b4d4:	9a9fb0ef          	jal	ra,80006e7c <pbuf_alloc>
8000b4d8:	00050b13          	mv	s6,a0
8000b4dc:	00050a63          	beqz	a0,8000b4f0 <icmp_input+0x160>
8000b4e0:	00a55703          	lhu	a4,10(a0)
8000b4e4:	008a8793          	addi	a5,s5,8
8000b4e8:	02f77063          	bgeu	a4,a5,8000b508 <icmp_input+0x178>
8000b4ec:	8bdfb0ef          	jal	ra,80006da8 <pbuf_free>
8000b4f0:	00040513          	mv	a0,s0
8000b4f4:	8b5fb0ef          	jal	ra,80006da8 <pbuf_free>
8000b4f8:	0e84a783          	lw	a5,232(s1)
8000b4fc:	00178793          	addi	a5,a5,1
8000b500:	0ef4a423          	sw	a5,232(s1)
8000b504:	f69ff06f          	j	8000b46c <icmp_input+0xdc>
8000b508:	00452503          	lw	a0,4(a0)
8000b50c:	000c0593          	mv	a1,s8
8000b510:	000a8613          	mv	a2,s5
8000b514:	129020ef          	jal	ra,8000de3c <memcpy>
8000b518:	000a8593          	mv	a1,s5
8000b51c:	000b0513          	mv	a0,s6
8000b520:	801fb0ef          	jal	ra,80006d20 <pbuf_remove_header>
8000b524:	00050663          	beqz	a0,8000b530 <icmp_input+0x1a0>
8000b528:	000b0513          	mv	a0,s6
8000b52c:	fc1ff06f          	j	8000b4ec <icmp_input+0x15c>
8000b530:	00040593          	mv	a1,s0
8000b534:	000b0513          	mv	a0,s6
8000b538:	d45fb0ef          	jal	ra,8000727c <pbuf_copy>
8000b53c:	fe0516e3          	bnez	a0,8000b528 <icmp_input+0x198>
8000b540:	00040513          	mv	a0,s0
8000b544:	865fb0ef          	jal	ra,80006da8 <pbuf_free>
8000b548:	000b0413          	mv	s0,s6
8000b54c:	000a8593          	mv	a1,s5
8000b550:	00040513          	mv	a0,s0
8000b554:	00442b03          	lw	s6,4(s0)
8000b558:	fb8fb0ef          	jal	ra,80006d10 <pbuf_add_header>
8000b55c:	0c051a63          	bnez	a0,8000b630 <icmp_input+0x2a0>
8000b560:	00092783          	lw	a5,0(s2)
8000b564:	00442a83          	lw	s5,4(s0)
8000b568:	0087d713          	srli	a4,a5,0x8
8000b56c:	00fa8623          	sb	a5,12(s5)
8000b570:	00ea86a3          	sb	a4,13(s5)
8000b574:	0107d713          	srli	a4,a5,0x10
8000b578:	0187d793          	srli	a5,a5,0x18
8000b57c:	00ea8723          	sb	a4,14(s5)
8000b580:	00fa87a3          	sb	a5,15(s5)
8000b584:	010ba783          	lw	a5,16(s7)
8000b588:	0087d713          	srli	a4,a5,0x8
8000b58c:	00fa8823          	sb	a5,16(s5)
8000b590:	00ea88a3          	sb	a4,17(s5)
8000b594:	0107d713          	srli	a4,a5,0x10
8000b598:	0187d793          	srli	a5,a5,0x18
8000b59c:	00ea8923          	sb	a4,18(s5)
8000b5a0:	00fa89a3          	sb	a5,19(s5)
8000b5a4:	003b4783          	lbu	a5,3(s6)
8000b5a8:	002b4703          	lbu	a4,2(s6)
8000b5ac:	000b0023          	sb	zero,0(s6)
8000b5b0:	00879793          	slli	a5,a5,0x8
8000b5b4:	00e7e7b3          	or	a5,a5,a4
8000b5b8:	00010737          	lui	a4,0x10
8000b5bc:	ff770713          	addi	a4,a4,-9 # fff7 <_stack_size+0xf7f7>
8000b5c0:	0af77c63          	bgeu	a4,a5,8000b678 <icmp_input+0x2e8>
8000b5c4:	00978793          	addi	a5,a5,9
8000b5c8:	01079793          	slli	a5,a5,0x10
8000b5cc:	0107d793          	srli	a5,a5,0x10
8000b5d0:	00fb0123          	sb	a5,2(s6)
8000b5d4:	0087d793          	srli	a5,a5,0x8
8000b5d8:	00fb01a3          	sb	a5,3(s6)
8000b5dc:	fff00793          	li	a5,-1
8000b5e0:	00fa8423          	sb	a5,8(s5)
8000b5e4:	000a0593          	mv	a1,s4
8000b5e8:	000a8523          	sb	zero,10(s5)
8000b5ec:	000a85a3          	sb	zero,11(s5)
8000b5f0:	000a8513          	mv	a0,s5
8000b5f4:	b85fa0ef          	jal	ra,80006178 <inet_chksum>
8000b5f8:	00aa8523          	sb	a0,10(s5)
8000b5fc:	00855513          	srli	a0,a0,0x8
8000b600:	00aa85a3          	sb	a0,11(s5)
8000b604:	0c04a783          	lw	a5,192(s1)
8000b608:	00098813          	mv	a6,s3
8000b60c:	00000713          	li	a4,0
8000b610:	00178793          	addi	a5,a5,1
8000b614:	0cf4a023          	sw	a5,192(s1)
8000b618:	0ff00693          	li	a3,255
8000b61c:	00100793          	li	a5,1
8000b620:	00000613          	li	a2,0
8000b624:	00090593          	mv	a1,s2
8000b628:	00040513          	mv	a0,s0
8000b62c:	3fd000ef          	jal	ra,8000c228 <ip4_output_if>
8000b630:	00040513          	mv	a0,s0
8000b634:	02812403          	lw	s0,40(sp)
8000b638:	02c12083          	lw	ra,44(sp)
8000b63c:	02412483          	lw	s1,36(sp)
8000b640:	02012903          	lw	s2,32(sp)
8000b644:	01c12983          	lw	s3,28(sp)
8000b648:	01812a03          	lw	s4,24(sp)
8000b64c:	01412a83          	lw	s5,20(sp)
8000b650:	01012b03          	lw	s6,16(sp)
8000b654:	00c12b83          	lw	s7,12(sp)
8000b658:	00812c03          	lw	s8,8(sp)
8000b65c:	03010113          	addi	sp,sp,48
8000b660:	f48fb06f          	j	80006da8 <pbuf_free>
8000b664:	000b0593          	mv	a1,s6
8000b668:	00040513          	mv	a0,s0
8000b66c:	eb4fb0ef          	jal	ra,80006d20 <pbuf_remove_header>
8000b670:	ec050ee3          	beqz	a0,8000b54c <icmp_input+0x1bc>
8000b674:	e7dff06f          	j	8000b4f0 <icmp_input+0x160>
8000b678:	00878793          	addi	a5,a5,8
8000b67c:	f4dff06f          	j	8000b5c8 <icmp_input+0x238>
8000b680:	0e07a703          	lw	a4,224(a5)
8000b684:	00170713          	addi	a4,a4,1
8000b688:	0ee7a023          	sw	a4,224(a5)
8000b68c:	0cc7a703          	lw	a4,204(a5)
8000b690:	00170713          	addi	a4,a4,1
8000b694:	0ce7a623          	sw	a4,204(a5)
8000b698:	f99ff06f          	j	8000b630 <icmp_input+0x2a0>
8000b69c:	00040513          	mv	a0,s0
8000b6a0:	f08fb0ef          	jal	ra,80006da8 <pbuf_free>
8000b6a4:	0d44a783          	lw	a5,212(s1)
8000b6a8:	00178793          	addi	a5,a5,1
8000b6ac:	0cf4aa23          	sw	a5,212(s1)
8000b6b0:	dbdff06f          	j	8000b46c <icmp_input+0xdc>

8000b6b4 <icmp_dest_unreach>:
8000b6b4:	fc010113          	addi	sp,sp,-64
8000b6b8:	03312623          	sw	s3,44(sp)
8000b6bc:	03412423          	sw	s4,40(sp)
8000b6c0:	00050993          	mv	s3,a0
8000b6c4:	00058a13          	mv	s4,a1
8000b6c8:	28000613          	li	a2,640
8000b6cc:	02400593          	li	a1,36
8000b6d0:	02400513          	li	a0,36
8000b6d4:	02112e23          	sw	ra,60(sp)
8000b6d8:	02812c23          	sw	s0,56(sp)
8000b6dc:	02912a23          	sw	s1,52(sp)
8000b6e0:	03212823          	sw	s2,48(sp)
8000b6e4:	f98fb0ef          	jal	ra,80006e7c <pbuf_alloc>
8000b6e8:	0c050a63          	beqz	a0,8000b7bc <icmp_dest_unreach+0x108>
8000b6ec:	00452403          	lw	s0,4(a0)
8000b6f0:	00300793          	li	a5,3
8000b6f4:	0049a903          	lw	s2,4(s3)
8000b6f8:	00f40023          	sb	a5,0(s0)
8000b6fc:	014400a3          	sb	s4,1(s0)
8000b700:	00040223          	sb	zero,4(s0)
8000b704:	000402a3          	sb	zero,5(s0)
8000b708:	00040323          	sb	zero,6(s0)
8000b70c:	000403a3          	sb	zero,7(s0)
8000b710:	00050493          	mv	s1,a0
8000b714:	00452503          	lw	a0,4(a0)
8000b718:	0049a583          	lw	a1,4(s3)
8000b71c:	01c00613          	li	a2,28
8000b720:	00850513          	addi	a0,a0,8
8000b724:	718020ef          	jal	ra,8000de3c <memcpy>
8000b728:	00d94703          	lbu	a4,13(s2)
8000b72c:	00c94783          	lbu	a5,12(s2)
8000b730:	01c10513          	addi	a0,sp,28
8000b734:	00871713          	slli	a4,a4,0x8
8000b738:	00f76733          	or	a4,a4,a5
8000b73c:	00e94783          	lbu	a5,14(s2)
8000b740:	01079793          	slli	a5,a5,0x10
8000b744:	00e7e733          	or	a4,a5,a4
8000b748:	00f94783          	lbu	a5,15(s2)
8000b74c:	01879793          	slli	a5,a5,0x18
8000b750:	00e7e7b3          	or	a5,a5,a4
8000b754:	00f12e23          	sw	a5,28(sp)
8000b758:	438000ef          	jal	ra,8000bb90 <ip4_route>
8000b75c:	00a12623          	sw	a0,12(sp)
8000b760:	04050a63          	beqz	a0,8000b7b4 <icmp_dest_unreach+0x100>
8000b764:	00040123          	sb	zero,2(s0)
8000b768:	000401a3          	sb	zero,3(s0)
8000b76c:	00a4d583          	lhu	a1,10(s1)
8000b770:	00040513          	mv	a0,s0
8000b774:	a05fa0ef          	jal	ra,80006178 <inet_chksum>
8000b778:	00a40123          	sb	a0,2(s0)
8000b77c:	00855513          	srli	a0,a0,0x8
8000b780:	00a401a3          	sb	a0,3(s0)
8000b784:	9f418793          	addi	a5,gp,-1548 # 80003194 <lwip_stats>
8000b788:	0c07a703          	lw	a4,192(a5)
8000b78c:	00c12803          	lw	a6,12(sp)
8000b790:	0ff00693          	li	a3,255
8000b794:	00170713          	addi	a4,a4,1
8000b798:	0ce7a023          	sw	a4,192(a5)
8000b79c:	01c10613          	addi	a2,sp,28
8000b7a0:	00100793          	li	a5,1
8000b7a4:	00000713          	li	a4,0
8000b7a8:	00000593          	li	a1,0
8000b7ac:	00048513          	mv	a0,s1
8000b7b0:	279000ef          	jal	ra,8000c228 <ip4_output_if>
8000b7b4:	00048513          	mv	a0,s1
8000b7b8:	df0fb0ef          	jal	ra,80006da8 <pbuf_free>
8000b7bc:	03c12083          	lw	ra,60(sp)
8000b7c0:	03812403          	lw	s0,56(sp)
8000b7c4:	03412483          	lw	s1,52(sp)
8000b7c8:	03012903          	lw	s2,48(sp)
8000b7cc:	02c12983          	lw	s3,44(sp)
8000b7d0:	02812a03          	lw	s4,40(sp)
8000b7d4:	04010113          	addi	sp,sp,64
8000b7d8:	00008067          	ret

8000b7dc <ipfrag_free_pbuf_custom>:
8000b7dc:	00050593          	mv	a1,a0
8000b7e0:	01452503          	lw	a0,20(a0)
8000b7e4:	02050463          	beqz	a0,8000b80c <ipfrag_free_pbuf_custom+0x30>
8000b7e8:	fe010113          	addi	sp,sp,-32
8000b7ec:	00112e23          	sw	ra,28(sp)
8000b7f0:	00b12623          	sw	a1,12(sp)
8000b7f4:	db4fb0ef          	jal	ra,80006da8 <pbuf_free>
8000b7f8:	00c12583          	lw	a1,12(sp)
8000b7fc:	01c12083          	lw	ra,28(sp)
8000b800:	00200513          	li	a0,2
8000b804:	02010113          	addi	sp,sp,32
8000b808:	cedfa06f          	j	800064f4 <memp_free>
8000b80c:	00200513          	li	a0,2
8000b810:	ff9ff06f          	j	8000b808 <ipfrag_free_pbuf_custom+0x2c>

8000b814 <ip4_frag>:
8000b814:	fa010113          	addi	sp,sp,-96
8000b818:	04112e23          	sw	ra,92(sp)
8000b81c:	04812c23          	sw	s0,88(sp)
8000b820:	04912a23          	sw	s1,84(sp)
8000b824:	05212823          	sw	s2,80(sp)
8000b828:	05312623          	sw	s3,76(sp)
8000b82c:	05412423          	sw	s4,72(sp)
8000b830:	05512223          	sw	s5,68(sp)
8000b834:	05612023          	sw	s6,64(sp)
8000b838:	03712e23          	sw	s7,60(sp)
8000b83c:	03812c23          	sw	s8,56(sp)
8000b840:	03912a23          	sw	s9,52(sp)
8000b844:	03a12823          	sw	s10,48(sp)
8000b848:	03b12623          	sw	s11,44(sp)
8000b84c:	02c5d783          	lhu	a5,44(a1)
8000b850:	00452c03          	lw	s8,4(a0)
8000b854:	00c12623          	sw	a2,12(sp)
8000b858:	fec78713          	addi	a4,a5,-20
8000b85c:	41f75793          	srai	a5,a4,0x1f
8000b860:	0077f793          	andi	a5,a5,7
8000b864:	00e787b3          	add	a5,a5,a4
8000b868:	4037d793          	srai	a5,a5,0x3
8000b86c:	01079793          	slli	a5,a5,0x10
8000b870:	0107d793          	srli	a5,a5,0x10
8000b874:	00f12223          	sw	a5,4(sp)
8000b878:	000c4783          	lbu	a5,0(s8)
8000b87c:	01400713          	li	a4,20
8000b880:	00f7f793          	andi	a5,a5,15
8000b884:	00279793          	slli	a5,a5,0x2
8000b888:	2ae79663          	bne	a5,a4,8000bb34 <ip4_frag+0x320>
8000b88c:	00a55703          	lhu	a4,10(a0)
8000b890:	01300793          	li	a5,19
8000b894:	00050413          	mv	s0,a0
8000b898:	ffa00513          	li	a0,-6
8000b89c:	06e7fc63          	bgeu	a5,a4,8000b914 <ip4_frag+0x100>
8000b8a0:	007c4783          	lbu	a5,7(s8)
8000b8a4:	006c4503          	lbu	a0,6(s8)
8000b8a8:	00058c93          	mv	s9,a1
8000b8ac:	00879793          	slli	a5,a5,0x8
8000b8b0:	00a7e533          	or	a0,a5,a0
8000b8b4:	ad0fa0ef          	jal	ra,80005b84 <lwip_htons>
8000b8b8:	000027b7          	lui	a5,0x2
8000b8bc:	00f577b3          	and	a5,a0,a5
8000b8c0:	00f12423          	sw	a5,8(sp)
8000b8c4:	00412783          	lw	a5,4(sp)
8000b8c8:	00845483          	lhu	s1,8(s0)
8000b8cc:	01351b93          	slli	s7,a0,0x13
8000b8d0:	00379793          	slli	a5,a5,0x3
8000b8d4:	01079793          	slli	a5,a5,0x10
8000b8d8:	0107d793          	srli	a5,a5,0x10
8000b8dc:	fec48493          	addi	s1,s1,-20
8000b8e0:	00f12023          	sw	a5,0(sp)
8000b8e4:	00f11923          	sh	a5,18(sp)
8000b8e8:	8000b7b7          	lui	a5,0x8000b
8000b8ec:	01049493          	slli	s1,s1,0x10
8000b8f0:	7dc78793          	addi	a5,a5,2012 # 8000b7dc <_heap_end+0xffff97dc>
8000b8f4:	013bdb93          	srli	s7,s7,0x13
8000b8f8:	0104d493          	srli	s1,s1,0x10
8000b8fc:	01400a13          	li	s4,20
8000b900:	00000913          	li	s2,0
8000b904:	00f12a23          	sw	a5,20(sp)
8000b908:	9f418d13          	addi	s10,gp,-1548 # 80003194 <lwip_stats>
8000b90c:	04049263          	bnez	s1,8000b950 <ip4_frag+0x13c>
8000b910:	00000513          	li	a0,0
8000b914:	05c12083          	lw	ra,92(sp)
8000b918:	05812403          	lw	s0,88(sp)
8000b91c:	05412483          	lw	s1,84(sp)
8000b920:	05012903          	lw	s2,80(sp)
8000b924:	04c12983          	lw	s3,76(sp)
8000b928:	04812a03          	lw	s4,72(sp)
8000b92c:	04412a83          	lw	s5,68(sp)
8000b930:	04012b03          	lw	s6,64(sp)
8000b934:	03c12b83          	lw	s7,60(sp)
8000b938:	03812c03          	lw	s8,56(sp)
8000b93c:	03412c83          	lw	s9,52(sp)
8000b940:	03012d03          	lw	s10,48(sp)
8000b944:	02c12d83          	lw	s11,44(sp)
8000b948:	06010113          	addi	sp,sp,96
8000b94c:	00008067          	ret
8000b950:	00012783          	lw	a5,0(sp)
8000b954:	01215a83          	lhu	s5,18(sp)
8000b958:	00f4f463          	bgeu	s1,a5,8000b960 <ip4_frag+0x14c>
8000b95c:	00048a93          	mv	s5,s1
8000b960:	28000613          	li	a2,640
8000b964:	01400593          	li	a1,20
8000b968:	01000513          	li	a0,16
8000b96c:	010a9a93          	slli	s5,s5,0x10
8000b970:	d0cfb0ef          	jal	ra,80006e7c <pbuf_alloc>
8000b974:	010ada93          	srli	s5,s5,0x10
8000b978:	00050b13          	mv	s6,a0
8000b97c:	06050a63          	beqz	a0,8000b9f0 <ip4_frag+0x1dc>
8000b980:	00452503          	lw	a0,4(a0)
8000b984:	01400613          	li	a2,20
8000b988:	000c0593          	mv	a1,s8
8000b98c:	4b0020ef          	jal	ra,8000de3c <memcpy>
8000b990:	004b2983          	lw	s3,4(s6)
8000b994:	000a8d93          	mv	s11,s5
8000b998:	0c0d8c63          	beqz	s11,8000ba70 <ip4_frag+0x25c>
8000b99c:	00a45783          	lhu	a5,10(s0)
8000b9a0:	414787b3          	sub	a5,a5,s4
8000b9a4:	00078913          	mv	s2,a5
8000b9a8:	01079793          	slli	a5,a5,0x10
8000b9ac:	0107d793          	srli	a5,a5,0x10
8000b9b0:	00fdf463          	bgeu	s11,a5,8000b9b8 <ip4_frag+0x1a4>
8000b9b4:	000d8913          	mv	s2,s11
8000b9b8:	01091913          	slli	s2,s2,0x10
8000b9bc:	01095913          	srli	s2,s2,0x10
8000b9c0:	00091863          	bnez	s2,8000b9d0 <ip4_frag+0x1bc>
8000b9c4:	00042403          	lw	s0,0(s0)
8000b9c8:	00000a13          	li	s4,0
8000b9cc:	fcdff06f          	j	8000b998 <ip4_frag+0x184>
8000b9d0:	800037b7          	lui	a5,0x80003
8000b9d4:	2bd00613          	li	a2,701
8000b9d8:	c5078593          	addi	a1,a5,-944 # 80002c50 <_heap_end+0xffff0c50>
8000b9dc:	00200513          	li	a0,2
8000b9e0:	addfa0ef          	jal	ra,800064bc <memp_malloc_fn>
8000b9e4:	00051a63          	bnez	a0,8000b9f8 <ip4_frag+0x1e4>
8000b9e8:	000b0513          	mv	a0,s6
8000b9ec:	bbcfb0ef          	jal	ra,80006da8 <pbuf_free>
8000b9f0:	fff00513          	li	a0,-1
8000b9f4:	f21ff06f          	j	8000b914 <ip4_frag+0x100>
8000b9f8:	00442703          	lw	a4,4(s0)
8000b9fc:	00050693          	mv	a3,a0
8000ba00:	00a12c23          	sw	a0,24(sp)
8000ba04:	00090793          	mv	a5,s2
8000ba08:	01470733          	add	a4,a4,s4
8000ba0c:	04100613          	li	a2,65
8000ba10:	00090593          	mv	a1,s2
8000ba14:	00000513          	li	a0,0
8000ba18:	aa4fb0ef          	jal	ra,80006cbc <pbuf_alloced_custom>
8000ba1c:	01812883          	lw	a7,24(sp)
8000ba20:	00051a63          	bnez	a0,8000ba34 <ip4_frag+0x220>
8000ba24:	00088593          	mv	a1,a7
8000ba28:	00200513          	li	a0,2
8000ba2c:	ac9fa0ef          	jal	ra,800064f4 <memp_free>
8000ba30:	fb9ff06f          	j	8000b9e8 <ip4_frag+0x1d4>
8000ba34:	00a12c23          	sw	a0,24(sp)
8000ba38:	00040513          	mv	a0,s0
8000ba3c:	01112e23          	sw	a7,28(sp)
8000ba40:	f50fb0ef          	jal	ra,80007190 <pbuf_ref>
8000ba44:	01c12883          	lw	a7,28(sp)
8000ba48:	01412783          	lw	a5,20(sp)
8000ba4c:	01812583          	lw	a1,24(sp)
8000ba50:	0088aa23          	sw	s0,20(a7)
8000ba54:	00f8a823          	sw	a5,16(a7)
8000ba58:	000b0513          	mv	a0,s6
8000ba5c:	f6cfb0ef          	jal	ra,800071c8 <pbuf_cat>
8000ba60:	412d8833          	sub	a6,s11,s2
8000ba64:	01081d93          	slli	s11,a6,0x10
8000ba68:	010ddd93          	srli	s11,s11,0x10
8000ba6c:	f40d9ce3          	bnez	s11,8000b9c4 <ip4_frag+0x1b0>
8000ba70:	02ccd783          	lhu	a5,44(s9)
8000ba74:	01490a33          	add	s4,s2,s4
8000ba78:	010a1a13          	slli	s4,s4,0x10
8000ba7c:	013b9513          	slli	a0,s7,0x13
8000ba80:	fed78793          	addi	a5,a5,-19
8000ba84:	010a5a13          	srli	s4,s4,0x10
8000ba88:	01355513          	srli	a0,a0,0x13
8000ba8c:	00f4d663          	bge	s1,a5,8000ba98 <ip4_frag+0x284>
8000ba90:	00812783          	lw	a5,8(sp)
8000ba94:	00078663          	beqz	a5,8000baa0 <ip4_frag+0x28c>
8000ba98:	000027b7          	lui	a5,0x2
8000ba9c:	00f56533          	or	a0,a0,a5
8000baa0:	8e4fa0ef          	jal	ra,80005b84 <lwip_htons>
8000baa4:	00a98323          	sb	a0,6(s3)
8000baa8:	00855513          	srli	a0,a0,0x8
8000baac:	00a983a3          	sb	a0,7(s3)
8000bab0:	014a8513          	addi	a0,s5,20
8000bab4:	01051513          	slli	a0,a0,0x10
8000bab8:	01055513          	srli	a0,a0,0x10
8000babc:	8c8fa0ef          	jal	ra,80005b84 <lwip_htons>
8000bac0:	00a98123          	sb	a0,2(s3)
8000bac4:	00855513          	srli	a0,a0,0x8
8000bac8:	00a981a3          	sb	a0,3(s3)
8000bacc:	01400593          	li	a1,20
8000bad0:	00098523          	sb	zero,10(s3)
8000bad4:	000985a3          	sb	zero,11(s3)
8000bad8:	00098513          	mv	a0,s3
8000badc:	e9cfa0ef          	jal	ra,80006178 <inet_chksum>
8000bae0:	00a98523          	sb	a0,10(s3)
8000bae4:	00855513          	srli	a0,a0,0x8
8000bae8:	00a985a3          	sb	a0,11(s3)
8000baec:	014ca783          	lw	a5,20(s9)
8000baf0:	00c12603          	lw	a2,12(sp)
8000baf4:	000b0593          	mv	a1,s6
8000baf8:	000c8513          	mv	a0,s9
8000bafc:	000780e7          	jalr	a5 # 2000 <_stack_size+0x1800>
8000bb00:	060d2783          	lw	a5,96(s10)
8000bb04:	000b0513          	mv	a0,s6
8000bb08:	415484b3          	sub	s1,s1,s5
8000bb0c:	00178793          	addi	a5,a5,1
8000bb10:	06fd2023          	sw	a5,96(s10)
8000bb14:	a94fb0ef          	jal	ra,80006da8 <pbuf_free>
8000bb18:	00412783          	lw	a5,4(sp)
8000bb1c:	01049493          	slli	s1,s1,0x10
8000bb20:	0104d493          	srli	s1,s1,0x10
8000bb24:	00fb8bb3          	add	s7,s7,a5
8000bb28:	010b9b93          	slli	s7,s7,0x10
8000bb2c:	010bdb93          	srli	s7,s7,0x10
8000bb30:	dddff06f          	j	8000b90c <ip4_frag+0xf8>
8000bb34:	ffa00513          	li	a0,-6
8000bb38:	dddff06f          	j	8000b914 <ip4_frag+0x100>

8000bb3c <ip4_input_accept>:
8000bb3c:	03554783          	lbu	a5,53(a0)
8000bb40:	0017f793          	andi	a5,a5,1
8000bb44:	04078063          	beqz	a5,8000bb84 <ip4_input_accept+0x48>
8000bb48:	00452703          	lw	a4,4(a0)
8000bb4c:	00050593          	mv	a1,a0
8000bb50:	00000513          	li	a0,0
8000bb54:	02070c63          	beqz	a4,8000bb8c <ip4_input_accept+0x50>
8000bb58:	9f01a783          	lw	a5,-1552(gp) # 80003190 <ip_data+0x14>
8000bb5c:	00100513          	li	a0,1
8000bb60:	02f70663          	beq	a4,a5,8000bb8c <ip4_input_accept+0x50>
8000bb64:	ff010113          	addi	sp,sp,-16
8000bb68:	00078513          	mv	a0,a5
8000bb6c:	00112623          	sw	ra,12(sp)
8000bb70:	7e4000ef          	jal	ra,8000c354 <ip4_addr_isbroadcast_u32>
8000bb74:	00c12083          	lw	ra,12(sp)
8000bb78:	00a03533          	snez	a0,a0
8000bb7c:	01010113          	addi	sp,sp,16
8000bb80:	00008067          	ret
8000bb84:	00000513          	li	a0,0
8000bb88:	00008067          	ret
8000bb8c:	00008067          	ret

8000bb90 <ip4_route>:
8000bb90:	8cc1a783          	lw	a5,-1844(gp) # 8000306c <netif_list>
8000bb94:	04079463          	bnez	a5,8000bbdc <ip4_route+0x4c>
8000bb98:	8c81a703          	lw	a4,-1848(gp) # 80003068 <netif_default>
8000bb9c:	02070463          	beqz	a4,8000bbc4 <ip4_route+0x34>
8000bba0:	03574683          	lbu	a3,53(a4)
8000bba4:	00500613          	li	a2,5
8000bba8:	0056f693          	andi	a3,a3,5
8000bbac:	00c69c63          	bne	a3,a2,8000bbc4 <ip4_route+0x34>
8000bbb0:	00472683          	lw	a3,4(a4)
8000bbb4:	00068863          	beqz	a3,8000bbc4 <ip4_route+0x34>
8000bbb8:	00054603          	lbu	a2,0(a0)
8000bbbc:	07f00693          	li	a3,127
8000bbc0:	06d61463          	bne	a2,a3,8000bc28 <ip4_route+0x98>
8000bbc4:	9f418713          	addi	a4,gp,-1548 # 80003194 <lwip_stats>
8000bbc8:	0ac72683          	lw	a3,172(a4)
8000bbcc:	00168693          	addi	a3,a3,1
8000bbd0:	0ad72623          	sw	a3,172(a4)
8000bbd4:	00078513          	mv	a0,a5
8000bbd8:	00008067          	ret
8000bbdc:	0357c683          	lbu	a3,53(a5)
8000bbe0:	0016f713          	andi	a4,a3,1
8000bbe4:	02070e63          	beqz	a4,8000bc20 <ip4_route+0x90>
8000bbe8:	0026d713          	srli	a4,a3,0x2
8000bbec:	00177713          	andi	a4,a4,1
8000bbf0:	02070863          	beqz	a4,8000bc20 <ip4_route+0x90>
8000bbf4:	0047a703          	lw	a4,4(a5)
8000bbf8:	02070463          	beqz	a4,8000bc20 <ip4_route+0x90>
8000bbfc:	00052603          	lw	a2,0(a0)
8000bc00:	0087a583          	lw	a1,8(a5)
8000bc04:	00c74733          	xor	a4,a4,a2
8000bc08:	00b77733          	and	a4,a4,a1
8000bc0c:	fc0704e3          	beqz	a4,8000bbd4 <ip4_route+0x44>
8000bc10:	0026f693          	andi	a3,a3,2
8000bc14:	00069663          	bnez	a3,8000bc20 <ip4_route+0x90>
8000bc18:	00c7a703          	lw	a4,12(a5)
8000bc1c:	fae60ce3          	beq	a2,a4,8000bbd4 <ip4_route+0x44>
8000bc20:	0007a783          	lw	a5,0(a5)
8000bc24:	f71ff06f          	j	8000bb94 <ip4_route+0x4>
8000bc28:	00070793          	mv	a5,a4
8000bc2c:	fa9ff06f          	j	8000bbd4 <ip4_route+0x44>

8000bc30 <ip4_input>:
8000bc30:	fd010113          	addi	sp,sp,-48
8000bc34:	02812423          	sw	s0,40(sp)
8000bc38:	03212023          	sw	s2,32(sp)
8000bc3c:	02112623          	sw	ra,44(sp)
8000bc40:	02912223          	sw	s1,36(sp)
8000bc44:	01312e23          	sw	s3,28(sp)
8000bc48:	01412c23          	sw	s4,24(sp)
8000bc4c:	01512a23          	sw	s5,20(sp)
8000bc50:	01612823          	sw	s6,16(sp)
8000bc54:	01712623          	sw	s7,12(sp)
8000bc58:	01812423          	sw	s8,8(sp)
8000bc5c:	9f418913          	addi	s2,gp,-1548 # 80003194 <lwip_stats>
8000bc60:	09492783          	lw	a5,148(s2)
8000bc64:	00178793          	addi	a5,a5,1
8000bc68:	08f92a23          	sw	a5,148(s2)
8000bc6c:	00452483          	lw	s1,4(a0)
8000bc70:	00400793          	li	a5,4
8000bc74:	0004cb03          	lbu	s6,0(s1)
8000bc78:	004b5713          	srli	a4,s6,0x4
8000bc7c:	04f70a63          	beq	a4,a5,8000bcd0 <ip4_input+0xa0>
8000bc80:	928fb0ef          	jal	ra,80006da8 <pbuf_free>
8000bc84:	0b892783          	lw	a5,184(s2)
8000bc88:	00178793          	addi	a5,a5,1
8000bc8c:	0af92c23          	sw	a5,184(s2)
8000bc90:	09c92783          	lw	a5,156(s2)
8000bc94:	00178793          	addi	a5,a5,1
8000bc98:	08f92e23          	sw	a5,156(s2)
8000bc9c:	02c12083          	lw	ra,44(sp)
8000bca0:	02812403          	lw	s0,40(sp)
8000bca4:	02412483          	lw	s1,36(sp)
8000bca8:	02012903          	lw	s2,32(sp)
8000bcac:	01c12983          	lw	s3,28(sp)
8000bcb0:	01812a03          	lw	s4,24(sp)
8000bcb4:	01412a83          	lw	s5,20(sp)
8000bcb8:	01012b03          	lw	s6,16(sp)
8000bcbc:	00c12b83          	lw	s7,12(sp)
8000bcc0:	00812c03          	lw	s8,8(sp)
8000bcc4:	00000513          	li	a0,0
8000bcc8:	03010113          	addi	sp,sp,48
8000bccc:	00008067          	ret
8000bcd0:	0034c783          	lbu	a5,3(s1)
8000bcd4:	00050993          	mv	s3,a0
8000bcd8:	0024c503          	lbu	a0,2(s1)
8000bcdc:	00879793          	slli	a5,a5,0x8
8000bce0:	00058a93          	mv	s5,a1
8000bce4:	00a7e533          	or	a0,a5,a0
8000bce8:	e9df90ef          	jal	ra,80005b84 <lwip_htons>
8000bcec:	00fb7b13          	andi	s6,s6,15
8000bcf0:	0089d783          	lhu	a5,8(s3)
8000bcf4:	002b1b13          	slli	s6,s6,0x2
8000bcf8:	010b1913          	slli	s2,s6,0x10
8000bcfc:	9f418413          	addi	s0,gp,-1548 # 80003194 <lwip_stats>
8000bd00:	01095913          	srli	s2,s2,0x10
8000bd04:	00050a13          	mv	s4,a0
8000bd08:	00f57863          	bgeu	a0,a5,8000bd18 <ip4_input+0xe8>
8000bd0c:	00050593          	mv	a1,a0
8000bd10:	00098513          	mv	a0,s3
8000bd14:	b38fb0ef          	jal	ra,8000704c <pbuf_realloc>
8000bd18:	00a9d783          	lhu	a5,10(s3)
8000bd1c:	0127ea63          	bltu	a5,s2,8000bd30 <ip4_input+0x100>
8000bd20:	0089d783          	lhu	a5,8(s3)
8000bd24:	0147e663          	bltu	a5,s4,8000bd30 <ip4_input+0x100>
8000bd28:	01300793          	li	a5,19
8000bd2c:	0327e463          	bltu	a5,s2,8000bd54 <ip4_input+0x124>
8000bd30:	00098513          	mv	a0,s3
8000bd34:	874fb0ef          	jal	ra,80006da8 <pbuf_free>
8000bd38:	0a442783          	lw	a5,164(s0)
8000bd3c:	00178793          	addi	a5,a5,1
8000bd40:	0af42223          	sw	a5,164(s0)
8000bd44:	09c42783          	lw	a5,156(s0)
8000bd48:	00178793          	addi	a5,a5,1
8000bd4c:	08f42e23          	sw	a5,156(s0)
8000bd50:	f4dff06f          	j	8000bc9c <ip4_input+0x6c>
8000bd54:	00090593          	mv	a1,s2
8000bd58:	00048513          	mv	a0,s1
8000bd5c:	c1cfa0ef          	jal	ra,80006178 <inet_chksum>
8000bd60:	00050e63          	beqz	a0,8000bd7c <ip4_input+0x14c>
8000bd64:	00098513          	mv	a0,s3
8000bd68:	840fb0ef          	jal	ra,80006da8 <pbuf_free>
8000bd6c:	0a042783          	lw	a5,160(s0)
8000bd70:	00178793          	addi	a5,a5,1
8000bd74:	0af42023          	sw	a5,160(s0)
8000bd78:	fcdff06f          	j	8000bd44 <ip4_input+0x114>
8000bd7c:	0114c703          	lbu	a4,17(s1)
8000bd80:	0104c783          	lbu	a5,16(s1)
8000bd84:	00871713          	slli	a4,a4,0x8
8000bd88:	00f76733          	or	a4,a4,a5
8000bd8c:	0124c783          	lbu	a5,18(s1)
8000bd90:	9dc18613          	addi	a2,gp,-1572 # 8000317c <ip_data>
8000bd94:	9dc18913          	addi	s2,gp,-1572 # 8000317c <ip_data>
8000bd98:	01079793          	slli	a5,a5,0x10
8000bd9c:	00e7e733          	or	a4,a5,a4
8000bda0:	0134c783          	lbu	a5,19(s1)
8000bda4:	01879793          	slli	a5,a5,0x18
8000bda8:	00e7e7b3          	or	a5,a5,a4
8000bdac:	00f62a23          	sw	a5,20(a2)
8000bdb0:	00d4c683          	lbu	a3,13(s1)
8000bdb4:	00c4c703          	lbu	a4,12(s1)
8000bdb8:	0f07f793          	andi	a5,a5,240
8000bdbc:	00869693          	slli	a3,a3,0x8
8000bdc0:	00e6e6b3          	or	a3,a3,a4
8000bdc4:	00e4c703          	lbu	a4,14(s1)
8000bdc8:	01071713          	slli	a4,a4,0x10
8000bdcc:	00d766b3          	or	a3,a4,a3
8000bdd0:	00f4c703          	lbu	a4,15(s1)
8000bdd4:	01871713          	slli	a4,a4,0x18
8000bdd8:	00d76733          	or	a4,a4,a3
8000bddc:	00e62823          	sw	a4,16(a2)
8000bde0:	0e000713          	li	a4,224
8000bde4:	06e79063          	bne	a5,a4,8000be44 <ip4_input+0x214>
8000bde8:	035ac783          	lbu	a5,53(s5)
8000bdec:	0017f793          	andi	a5,a5,1
8000bdf0:	00079c63          	bnez	a5,8000be08 <ip4_input+0x1d8>
8000bdf4:	0094c703          	lbu	a4,9(s1)
8000bdf8:	01100793          	li	a5,17
8000bdfc:	08f70663          	beq	a4,a5,8000be88 <ip4_input+0x258>
8000be00:	00000a13          	li	s4,0
8000be04:	0100006f          	j	8000be14 <ip4_input+0x1e4>
8000be08:	004aa783          	lw	a5,4(s5)
8000be0c:	fe0784e3          	beqz	a5,8000bdf4 <ip4_input+0x1c4>
8000be10:	000a8a13          	mv	s4,s5
8000be14:	01092503          	lw	a0,16(s2)
8000be18:	08050a63          	beqz	a0,8000beac <ip4_input+0x27c>
8000be1c:	000a8593          	mv	a1,s5
8000be20:	534000ef          	jal	ra,8000c354 <ip4_addr_isbroadcast_u32>
8000be24:	00051a63          	bnez	a0,8000be38 <ip4_input+0x208>
8000be28:	01092783          	lw	a5,16(s2)
8000be2c:	0e000713          	li	a4,224
8000be30:	0f07f793          	andi	a5,a5,240
8000be34:	06e79c63          	bne	a5,a4,8000beac <ip4_input+0x27c>
8000be38:	00098513          	mv	a0,s3
8000be3c:	f6dfa0ef          	jal	ra,80006da8 <pbuf_free>
8000be40:	f05ff06f          	j	8000bd44 <ip4_input+0x114>
8000be44:	000a8513          	mv	a0,s5
8000be48:	cf5ff0ef          	jal	ra,8000bb3c <ip4_input_accept>
8000be4c:	02051a63          	bnez	a0,8000be80 <ip4_input+0x250>
8000be50:	01494703          	lbu	a4,20(s2)
8000be54:	07f00793          	li	a5,127
8000be58:	f8f70ee3          	beq	a4,a5,8000bdf4 <ip4_input+0x1c4>
8000be5c:	8cc1aa03          	lw	s4,-1844(gp) # 8000306c <netif_list>
8000be60:	f80a0ae3          	beqz	s4,8000bdf4 <ip4_input+0x1c4>
8000be64:	015a1663          	bne	s4,s5,8000be70 <ip4_input+0x240>
8000be68:	000a2a03          	lw	s4,0(s4)
8000be6c:	ff5ff06f          	j	8000be60 <ip4_input+0x230>
8000be70:	000a0513          	mv	a0,s4
8000be74:	cc9ff0ef          	jal	ra,8000bb3c <ip4_input_accept>
8000be78:	fe0508e3          	beqz	a0,8000be68 <ip4_input+0x238>
8000be7c:	f99ff06f          	j	8000be14 <ip4_input+0x1e4>
8000be80:	f80a98e3          	bnez	s5,8000be10 <ip4_input+0x1e0>
8000be84:	f71ff06f          	j	8000bdf4 <ip4_input+0x1c4>
8000be88:	01648733          	add	a4,s1,s6
8000be8c:	00374783          	lbu	a5,3(a4)
8000be90:	00274683          	lbu	a3,2(a4)
8000be94:	00004737          	lui	a4,0x4
8000be98:	00879793          	slli	a5,a5,0x8
8000be9c:	00d7e7b3          	or	a5,a5,a3
8000bea0:	40070713          	addi	a4,a4,1024 # 4400 <_stack_size+0x3c00>
8000bea4:	f4e79ee3          	bne	a5,a4,8000be00 <ip4_input+0x1d0>
8000bea8:	000a8a13          	mv	s4,s5
8000beac:	000a1e63          	bnez	s4,8000bec8 <ip4_input+0x298>
8000beb0:	09c42783          	lw	a5,156(s0)
8000beb4:	00098513          	mv	a0,s3
8000beb8:	00178793          	addi	a5,a5,1
8000bebc:	08f42e23          	sw	a5,156(s0)
8000bec0:	ee9fa0ef          	jal	ra,80006da8 <pbuf_free>
8000bec4:	dd9ff06f          	j	8000bc9c <ip4_input+0x6c>
8000bec8:	0064c783          	lbu	a5,6(s1)
8000becc:	0074c703          	lbu	a4,7(s1)
8000bed0:	03f7f793          	andi	a5,a5,63
8000bed4:	00871713          	slli	a4,a4,0x8
8000bed8:	00e7e7b3          	or	a5,a5,a4
8000bedc:	00078e63          	beqz	a5,8000bef8 <ip4_input+0x2c8>
8000bee0:	00098513          	mv	a0,s3
8000bee4:	ec5fa0ef          	jal	ra,80006da8 <pbuf_free>
8000bee8:	0b442783          	lw	a5,180(s0)
8000beec:	00178793          	addi	a5,a5,1
8000bef0:	0af42a23          	sw	a5,180(s0)
8000bef4:	e51ff06f          	j	8000bd44 <ip4_input+0x114>
8000bef8:	01492023          	sw	s4,0(s2)
8000befc:	01592223          	sw	s5,4(s2)
8000bf00:	00992423          	sw	s1,8(s2)
8000bf04:	0004c783          	lbu	a5,0(s1)
8000bf08:	000a8593          	mv	a1,s5
8000bf0c:	00098513          	mv	a0,s3
8000bf10:	00f7f793          	andi	a5,a5,15
8000bf14:	00279793          	slli	a5,a5,0x2
8000bf18:	00f91623          	sh	a5,12(s2)
8000bf1c:	00100c13          	li	s8,1
8000bf20:	a7dfb0ef          	jal	ra,8000799c <raw_input>
8000bf24:	00050b93          	mv	s7,a0
8000bf28:	03850663          	beq	a0,s8,8000bf54 <ip4_input+0x324>
8000bf2c:	000b0593          	mv	a1,s6
8000bf30:	00098513          	mv	a0,s3
8000bf34:	dedfa0ef          	jal	ra,80006d20 <pbuf_remove_header>
8000bf38:	0094c783          	lbu	a5,9(s1)
8000bf3c:	03878a63          	beq	a5,s8,8000bf70 <ip4_input+0x340>
8000bf40:	01100713          	li	a4,17
8000bf44:	02e79e63          	bne	a5,a4,8000bf80 <ip4_input+0x350>
8000bf48:	000a8593          	mv	a1,s5
8000bf4c:	00098513          	mv	a0,s3
8000bf50:	a40fc0ef          	jal	ra,80008190 <udp_input>
8000bf54:	00092023          	sw	zero,0(s2)
8000bf58:	00092223          	sw	zero,4(s2)
8000bf5c:	00092423          	sw	zero,8(s2)
8000bf60:	00091623          	sh	zero,12(s2)
8000bf64:	00092823          	sw	zero,16(s2)
8000bf68:	00092a23          	sw	zero,20(s2)
8000bf6c:	d31ff06f          	j	8000bc9c <ip4_input+0x6c>
8000bf70:	000a8593          	mv	a1,s5
8000bf74:	00098513          	mv	a0,s3
8000bf78:	c18ff0ef          	jal	ra,8000b390 <icmp_input>
8000bf7c:	fd9ff06f          	j	8000bf54 <ip4_input+0x324>
8000bf80:	00200793          	li	a5,2
8000bf84:	04fb8a63          	beq	s7,a5,8000bfd8 <ip4_input+0x3a8>
8000bf88:	01492503          	lw	a0,20(s2)
8000bf8c:	000a0593          	mv	a1,s4
8000bf90:	3c4000ef          	jal	ra,8000c354 <ip4_addr_isbroadcast_u32>
8000bf94:	02051663          	bnez	a0,8000bfc0 <ip4_input+0x390>
8000bf98:	01492783          	lw	a5,20(s2)
8000bf9c:	0e000713          	li	a4,224
8000bfa0:	0f07f793          	andi	a5,a5,240
8000bfa4:	00e78e63          	beq	a5,a4,8000bfc0 <ip4_input+0x390>
8000bfa8:	000b0593          	mv	a1,s6
8000bfac:	00098513          	mv	a0,s3
8000bfb0:	de5fa0ef          	jal	ra,80006d94 <pbuf_header_force>
8000bfb4:	00200593          	li	a1,2
8000bfb8:	00098513          	mv	a0,s3
8000bfbc:	ef8ff0ef          	jal	ra,8000b6b4 <icmp_dest_unreach>
8000bfc0:	0b042783          	lw	a5,176(s0)
8000bfc4:	00178793          	addi	a5,a5,1
8000bfc8:	0af42823          	sw	a5,176(s0)
8000bfcc:	09c42783          	lw	a5,156(s0)
8000bfd0:	00178793          	addi	a5,a5,1
8000bfd4:	08f42e23          	sw	a5,156(s0)
8000bfd8:	00098513          	mv	a0,s3
8000bfdc:	dcdfa0ef          	jal	ra,80006da8 <pbuf_free>
8000bfe0:	f75ff06f          	j	8000bf54 <ip4_input+0x324>

8000bfe4 <ip4_output_if_src>:
8000bfe4:	fc010113          	addi	sp,sp,-64
8000bfe8:	03212823          	sw	s2,48(sp)
8000bfec:	03412423          	sw	s4,40(sp)
8000bff0:	03512223          	sw	s5,36(sp)
8000bff4:	02112e23          	sw	ra,60(sp)
8000bff8:	02812c23          	sw	s0,56(sp)
8000bffc:	02912a23          	sw	s1,52(sp)
8000c000:	03312623          	sw	s3,44(sp)
8000c004:	03612023          	sw	s6,32(sp)
8000c008:	00d12623          	sw	a3,12(sp)
8000c00c:	00f12423          	sw	a5,8(sp)
8000c010:	00c12223          	sw	a2,4(sp)
8000c014:	00050913          	mv	s2,a0
8000c018:	00080a13          	mv	s4,a6
8000c01c:	9f418a93          	addi	s5,gp,-1548 # 80003194 <lwip_stats>
8000c020:	1a060863          	beqz	a2,8000c1d0 <ip4_output_if_src+0x1ec>
8000c024:	00058993          	mv	s3,a1
8000c028:	01400593          	li	a1,20
8000c02c:	00070493          	mv	s1,a4
8000c030:	ce1fa0ef          	jal	ra,80006d10 <pbuf_add_header>
8000c034:	00412603          	lw	a2,4(sp)
8000c038:	00812783          	lw	a5,8(sp)
8000c03c:	00c12683          	lw	a3,12(sp)
8000c040:	02050e63          	beqz	a0,8000c07c <ip4_output_if_src+0x98>
8000c044:	0b8aa783          	lw	a5,184(s5)
8000c048:	ffe00513          	li	a0,-2
8000c04c:	00178793          	addi	a5,a5,1
8000c050:	0afaac23          	sw	a5,184(s5)
8000c054:	03c12083          	lw	ra,60(sp)
8000c058:	03812403          	lw	s0,56(sp)
8000c05c:	03412483          	lw	s1,52(sp)
8000c060:	03012903          	lw	s2,48(sp)
8000c064:	02c12983          	lw	s3,44(sp)
8000c068:	02812a03          	lw	s4,40(sp)
8000c06c:	02412a83          	lw	s5,36(sp)
8000c070:	02012b03          	lw	s6,32(sp)
8000c074:	04010113          	addi	sp,sp,64
8000c078:	00008067          	ret
8000c07c:	00492403          	lw	s0,4(s2)
8000c080:	00c12223          	sw	a2,4(sp)
8000c084:	00d40423          	sb	a3,8(s0)
8000c088:	00f404a3          	sb	a5,9(s0)
8000c08c:	00869693          	slli	a3,a3,0x8
8000c090:	00f6e7b3          	or	a5,a3,a5
8000c094:	00062683          	lw	a3,0(a2)
8000c098:	009400a3          	sb	s1,1(s0)
8000c09c:	00849493          	slli	s1,s1,0x8
8000c0a0:	0086d593          	srli	a1,a3,0x8
8000c0a4:	00d40823          	sb	a3,16(s0)
8000c0a8:	00b408a3          	sb	a1,17(s0)
8000c0ac:	0186d513          	srli	a0,a3,0x18
8000c0b0:	0106d593          	srli	a1,a3,0x10
8000c0b4:	01069693          	slli	a3,a3,0x10
8000c0b8:	0106d693          	srli	a3,a3,0x10
8000c0bc:	00b686b3          	add	a3,a3,a1
8000c0c0:	00a409a3          	sb	a0,19(s0)
8000c0c4:	0454e493          	ori	s1,s1,69
8000c0c8:	04500513          	li	a0,69
8000c0cc:	00b40923          	sb	a1,18(s0)
8000c0d0:	00a40023          	sb	a0,0(s0)
8000c0d4:	00d484b3          	add	s1,s1,a3
8000c0d8:	00879693          	slli	a3,a5,0x8
8000c0dc:	4087d793          	srai	a5,a5,0x8
8000c0e0:	00f6e7b3          	or	a5,a3,a5
8000c0e4:	00895503          	lhu	a0,8(s2)
8000c0e8:	01079793          	slli	a5,a5,0x10
8000c0ec:	0107d793          	srli	a5,a5,0x10
8000c0f0:	00f484b3          	add	s1,s1,a5
8000c0f4:	a91f90ef          	jal	ra,80005b84 <lwip_htons>
8000c0f8:	00855793          	srli	a5,a0,0x8
8000c0fc:	00a40123          	sb	a0,2(s0)
8000c100:	009504b3          	add	s1,a0,s1
8000c104:	8f01d503          	lhu	a0,-1808(gp) # 80003090 <ip_id>
8000c108:	00f401a3          	sb	a5,3(s0)
8000c10c:	00040323          	sb	zero,6(s0)
8000c110:	000403a3          	sb	zero,7(s0)
8000c114:	a71f90ef          	jal	ra,80005b84 <lwip_htons>
8000c118:	00855793          	srli	a5,a0,0x8
8000c11c:	00f402a3          	sb	a5,5(s0)
8000c120:	8f01d783          	lhu	a5,-1808(gp) # 80003090 <ip_id>
8000c124:	00a40223          	sb	a0,4(s0)
8000c128:	00412603          	lw	a2,4(sp)
8000c12c:	00178793          	addi	a5,a5,1
8000c130:	8ef19823          	sh	a5,-1808(gp) # 80003090 <ip_id>
8000c134:	00950533          	add	a0,a0,s1
8000c138:	08099863          	bnez	s3,8000c1c8 <ip4_output_if_src+0x1e4>
8000c13c:	8481a703          	lw	a4,-1976(gp) # 80002fe8 <ip_addr_any>
8000c140:	01875693          	srli	a3,a4,0x18
8000c144:	00d407a3          	sb	a3,15(s0)
8000c148:	000106b7          	lui	a3,0x10
8000c14c:	00875793          	srli	a5,a4,0x8
8000c150:	fff68693          	addi	a3,a3,-1 # ffff <_stack_size+0xf7ff>
8000c154:	00e40623          	sb	a4,12(s0)
8000c158:	00f406a3          	sb	a5,13(s0)
8000c15c:	01075793          	srli	a5,a4,0x10
8000c160:	00d77733          	and	a4,a4,a3
8000c164:	00a70733          	add	a4,a4,a0
8000c168:	00e78733          	add	a4,a5,a4
8000c16c:	00f40723          	sb	a5,14(s0)
8000c170:	01075793          	srli	a5,a4,0x10
8000c174:	00d77733          	and	a4,a4,a3
8000c178:	00e78733          	add	a4,a5,a4
8000c17c:	01075793          	srli	a5,a4,0x10
8000c180:	00e787b3          	add	a5,a5,a4
8000c184:	fff7c793          	not	a5,a5
8000c188:	01079793          	slli	a5,a5,0x10
8000c18c:	0107d793          	srli	a5,a5,0x10
8000c190:	00f40523          	sb	a5,10(s0)
8000c194:	0087d793          	srli	a5,a5,0x8
8000c198:	00f405a3          	sb	a5,11(s0)
8000c19c:	090aa783          	lw	a5,144(s5)
8000c1a0:	00178793          	addi	a5,a5,1
8000c1a4:	08faa823          	sw	a5,144(s5)
8000c1a8:	02ca5783          	lhu	a5,44(s4)
8000c1ac:	06078463          	beqz	a5,8000c214 <ip4_output_if_src+0x230>
8000c1b0:	00895703          	lhu	a4,8(s2)
8000c1b4:	06e7f063          	bgeu	a5,a4,8000c214 <ip4_output_if_src+0x230>
8000c1b8:	000a0593          	mv	a1,s4
8000c1bc:	00090513          	mv	a0,s2
8000c1c0:	e54ff0ef          	jal	ra,8000b814 <ip4_frag>
8000c1c4:	e91ff06f          	j	8000c054 <ip4_output_if_src+0x70>
8000c1c8:	0009a703          	lw	a4,0(s3)
8000c1cc:	f75ff06f          	j	8000c140 <ip4_output_if_src+0x15c>
8000c1d0:	00a55703          	lhu	a4,10(a0)
8000c1d4:	01300793          	li	a5,19
8000c1d8:	e6e7f6e3          	bgeu	a5,a4,8000c044 <ip4_output_if_src+0x60>
8000c1dc:	00452683          	lw	a3,4(a0)
8000c1e0:	01c10613          	addi	a2,sp,28
8000c1e4:	0116c703          	lbu	a4,17(a3)
8000c1e8:	0106c783          	lbu	a5,16(a3)
8000c1ec:	00871713          	slli	a4,a4,0x8
8000c1f0:	00f76733          	or	a4,a4,a5
8000c1f4:	0126c783          	lbu	a5,18(a3)
8000c1f8:	01079793          	slli	a5,a5,0x10
8000c1fc:	00e7e733          	or	a4,a5,a4
8000c200:	0136c783          	lbu	a5,19(a3)
8000c204:	01879793          	slli	a5,a5,0x18
8000c208:	00e7e7b3          	or	a5,a5,a4
8000c20c:	00f12e23          	sw	a5,28(sp)
8000c210:	f8dff06f          	j	8000c19c <ip4_output_if_src+0x1b8>
8000c214:	014a2783          	lw	a5,20(s4)
8000c218:	00090593          	mv	a1,s2
8000c21c:	000a0513          	mv	a0,s4
8000c220:	000780e7          	jalr	a5
8000c224:	e31ff06f          	j	8000c054 <ip4_output_if_src+0x70>

8000c228 <ip4_output_if>:
8000c228:	00060a63          	beqz	a2,8000c23c <ip4_output_if+0x14>
8000c22c:	00058663          	beqz	a1,8000c238 <ip4_output_if+0x10>
8000c230:	0005a883          	lw	a7,0(a1)
8000c234:	00089463          	bnez	a7,8000c23c <ip4_output_if+0x14>
8000c238:	00480593          	addi	a1,a6,4
8000c23c:	da9ff06f          	j	8000bfe4 <ip4_output_if_src>

8000c240 <ip4_output>:
8000c240:	fd010113          	addi	sp,sp,-48
8000c244:	02812423          	sw	s0,40(sp)
8000c248:	00050413          	mv	s0,a0
8000c24c:	00060513          	mv	a0,a2
8000c250:	00b12e23          	sw	a1,28(sp)
8000c254:	00d12c23          	sw	a3,24(sp)
8000c258:	00e12a23          	sw	a4,20(sp)
8000c25c:	00f12823          	sw	a5,16(sp)
8000c260:	00c12623          	sw	a2,12(sp)
8000c264:	02112623          	sw	ra,44(sp)
8000c268:	929ff0ef          	jal	ra,8000bb90 <ip4_route>
8000c26c:	00c12603          	lw	a2,12(sp)
8000c270:	01012783          	lw	a5,16(sp)
8000c274:	01412703          	lw	a4,20(sp)
8000c278:	01812683          	lw	a3,24(sp)
8000c27c:	01c12583          	lw	a1,28(sp)
8000c280:	00050e63          	beqz	a0,8000c29c <ip4_output+0x5c>
8000c284:	00050813          	mv	a6,a0
8000c288:	00040513          	mv	a0,s0
8000c28c:	02812403          	lw	s0,40(sp)
8000c290:	02c12083          	lw	ra,44(sp)
8000c294:	03010113          	addi	sp,sp,48
8000c298:	f91ff06f          	j	8000c228 <ip4_output_if>
8000c29c:	9f418793          	addi	a5,gp,-1548 # 80003194 <lwip_stats>
8000c2a0:	0ac7a703          	lw	a4,172(a5)
8000c2a4:	ffc00513          	li	a0,-4
8000c2a8:	00170713          	addi	a4,a4,1
8000c2ac:	0ae7a623          	sw	a4,172(a5)
8000c2b0:	02c12083          	lw	ra,44(sp)
8000c2b4:	02812403          	lw	s0,40(sp)
8000c2b8:	03010113          	addi	sp,sp,48
8000c2bc:	00008067          	ret

8000c2c0 <ip4_output_hinted>:
8000c2c0:	fd010113          	addi	sp,sp,-48
8000c2c4:	02912223          	sw	s1,36(sp)
8000c2c8:	00050493          	mv	s1,a0
8000c2cc:	00060513          	mv	a0,a2
8000c2d0:	00b12e23          	sw	a1,28(sp)
8000c2d4:	00d12c23          	sw	a3,24(sp)
8000c2d8:	00e12a23          	sw	a4,20(sp)
8000c2dc:	00f12823          	sw	a5,16(sp)
8000c2e0:	01012623          	sw	a6,12(sp)
8000c2e4:	00c12423          	sw	a2,8(sp)
8000c2e8:	02112623          	sw	ra,44(sp)
8000c2ec:	02812423          	sw	s0,40(sp)
8000c2f0:	8a1ff0ef          	jal	ra,8000bb90 <ip4_route>
8000c2f4:	00812603          	lw	a2,8(sp)
8000c2f8:	00c12803          	lw	a6,12(sp)
8000c2fc:	01012783          	lw	a5,16(sp)
8000c300:	01412703          	lw	a4,20(sp)
8000c304:	01812683          	lw	a3,24(sp)
8000c308:	01c12583          	lw	a1,28(sp)
8000c30c:	02051663          	bnez	a0,8000c338 <ip4_output_hinted+0x78>
8000c310:	9f418793          	addi	a5,gp,-1548 # 80003194 <lwip_stats>
8000c314:	0ac7a703          	lw	a4,172(a5)
8000c318:	ffc00513          	li	a0,-4
8000c31c:	00170713          	addi	a4,a4,1
8000c320:	0ae7a623          	sw	a4,172(a5)
8000c324:	02c12083          	lw	ra,44(sp)
8000c328:	02812403          	lw	s0,40(sp)
8000c32c:	02412483          	lw	s1,36(sp)
8000c330:	03010113          	addi	sp,sp,48
8000c334:	00008067          	ret
8000c338:	03052e23          	sw	a6,60(a0)
8000c33c:	00050413          	mv	s0,a0
8000c340:	00050813          	mv	a6,a0
8000c344:	00048513          	mv	a0,s1
8000c348:	ee1ff0ef          	jal	ra,8000c228 <ip4_output_if>
8000c34c:	02042e23          	sw	zero,60(s0)
8000c350:	fd5ff06f          	j	8000c324 <ip4_output_hinted+0x64>

8000c354 <ip4_addr_isbroadcast_u32>:
8000c354:	fff50693          	addi	a3,a0,-1
8000c358:	ffd00793          	li	a5,-3
8000c35c:	00050713          	mv	a4,a0
8000c360:	04d7e063          	bltu	a5,a3,8000c3a0 <ip4_addr_isbroadcast_u32+0x4c>
8000c364:	0355c783          	lbu	a5,53(a1)
8000c368:	0027f513          	andi	a0,a5,2
8000c36c:	02050c63          	beqz	a0,8000c3a4 <ip4_addr_isbroadcast_u32+0x50>
8000c370:	0045a783          	lw	a5,4(a1)
8000c374:	00000513          	li	a0,0
8000c378:	02e78663          	beq	a5,a4,8000c3a4 <ip4_addr_isbroadcast_u32+0x50>
8000c37c:	0085a683          	lw	a3,8(a1)
8000c380:	00e7c7b3          	xor	a5,a5,a4
8000c384:	00d7f7b3          	and	a5,a5,a3
8000c388:	00079e63          	bnez	a5,8000c3a4 <ip4_addr_isbroadcast_u32+0x50>
8000c38c:	fff6c693          	not	a3,a3
8000c390:	00e6f533          	and	a0,a3,a4
8000c394:	40d50533          	sub	a0,a0,a3
8000c398:	00153513          	seqz	a0,a0
8000c39c:	00008067          	ret
8000c3a0:	00100513          	li	a0,1
8000c3a4:	00008067          	ret

8000c3a8 <ip4_addr_netmask_valid>:
8000c3a8:	ff010113          	addi	sp,sp,-16
8000c3ac:	00112623          	sw	ra,12(sp)
8000c3b0:	fecf90ef          	jal	ra,80005b9c <lwip_htonl>
8000c3b4:	02000713          	li	a4,32
8000c3b8:	800007b7          	lui	a5,0x80000
8000c3bc:	00f576b3          	and	a3,a0,a5
8000c3c0:	02068663          	beqz	a3,8000c3ec <ip4_addr_netmask_valid+0x44>
8000c3c4:	fff70713          	addi	a4,a4,-1
8000c3c8:	0017d793          	srli	a5,a5,0x1
8000c3cc:	fe0718e3          	bnez	a4,8000c3bc <ip4_addr_netmask_valid+0x14>
8000c3d0:	00100513          	li	a0,1
8000c3d4:	00c12083          	lw	ra,12(sp)
8000c3d8:	01010113          	addi	sp,sp,16
8000c3dc:	00008067          	ret
8000c3e0:	00a7f733          	and	a4,a5,a0
8000c3e4:	00071863          	bnez	a4,8000c3f4 <ip4_addr_netmask_valid+0x4c>
8000c3e8:	0017d793          	srli	a5,a5,0x1
8000c3ec:	fe079ae3          	bnez	a5,8000c3e0 <ip4_addr_netmask_valid+0x38>
8000c3f0:	fe1ff06f          	j	8000c3d0 <ip4_addr_netmask_valid+0x28>
8000c3f4:	00000513          	li	a0,0
8000c3f8:	fddff06f          	j	8000c3d4 <ip4_addr_netmask_valid+0x2c>

8000c3fc <ip4addr_aton>:
8000c3fc:	fb010113          	addi	sp,sp,-80
8000c400:	04812423          	sw	s0,72(sp)
8000c404:	05212023          	sw	s2,64(sp)
8000c408:	03312e23          	sw	s3,60(sp)
8000c40c:	03512a23          	sw	s5,52(sp)
8000c410:	03712623          	sw	s7,44(sp)
8000c414:	03812423          	sw	s8,40(sp)
8000c418:	03912223          	sw	s9,36(sp)
8000c41c:	03a12023          	sw	s10,32(sp)
8000c420:	01b12e23          	sw	s11,28(sp)
8000c424:	04112623          	sw	ra,76(sp)
8000c428:	04912223          	sw	s1,68(sp)
8000c42c:	03412c23          	sw	s4,56(sp)
8000c430:	03612823          	sw	s6,48(sp)
8000c434:	00054483          	lbu	s1,0(a0)
8000c438:	00010913          	mv	s2,sp
8000c43c:	80003ab7          	lui	s5,0x80003
8000c440:	00058993          	mv	s3,a1
8000c444:	00090b93          	mv	s7,s2
8000c448:	c71a8a93          	addi	s5,s5,-911 # 80002c71 <_heap_end+0xffff0c71>
8000c44c:	03000413          	li	s0,48
8000c450:	05800c13          	li	s8,88
8000c454:	01000c93          	li	s9,16
8000c458:	00200d13          	li	s10,2
8000c45c:	02e00d93          	li	s11,46
8000c460:	00c10713          	addi	a4,sp,12
8000c464:	015487b3          	add	a5,s1,s5
8000c468:	0007c783          	lbu	a5,0(a5) # 80000000 <_heap_end+0xfffee000>
8000c46c:	0047f793          	andi	a5,a5,4
8000c470:	1c078a63          	beqz	a5,8000c644 <ip4addr_aton+0x248>
8000c474:	00a00b13          	li	s6,10
8000c478:	00849c63          	bne	s1,s0,8000c490 <ip4addr_aton+0x94>
8000c47c:	00154483          	lbu	s1,1(a0)
8000c480:	0df4f793          	andi	a5,s1,223
8000c484:	05878463          	beq	a5,s8,8000c4cc <ip4addr_aton+0xd0>
8000c488:	00150513          	addi	a0,a0,1
8000c48c:	00800b13          	li	s6,8
8000c490:	00050a13          	mv	s4,a0
8000c494:	00000513          	li	a0,0
8000c498:	009a87b3          	add	a5,s5,s1
8000c49c:	0007c783          	lbu	a5,0(a5)
8000c4a0:	0047f693          	andi	a3,a5,4
8000c4a4:	02068c63          	beqz	a3,8000c4dc <ip4addr_aton+0xe0>
8000c4a8:	00050593          	mv	a1,a0
8000c4ac:	000b0513          	mv	a0,s6
8000c4b0:	441000ef          	jal	ra,8000d0f0 <__mulsi3>
8000c4b4:	00950533          	add	a0,a0,s1
8000c4b8:	001a4483          	lbu	s1,1(s4)
8000c4bc:	fd050513          	addi	a0,a0,-48
8000c4c0:	00c10713          	addi	a4,sp,12
8000c4c4:	001a0a13          	addi	s4,s4,1
8000c4c8:	fd1ff06f          	j	8000c498 <ip4addr_aton+0x9c>
8000c4cc:	00254483          	lbu	s1,2(a0)
8000c4d0:	01000b13          	li	s6,16
8000c4d4:	00250513          	addi	a0,a0,2
8000c4d8:	fb9ff06f          	j	8000c490 <ip4addr_aton+0x94>
8000c4dc:	039b1a63          	bne	s6,s9,8000c510 <ip4addr_aton+0x114>
8000c4e0:	0447f693          	andi	a3,a5,68
8000c4e4:	02068663          	beqz	a3,8000c510 <ip4addr_aton+0x114>
8000c4e8:	0037f793          	andi	a5,a5,3
8000c4ec:	00451513          	slli	a0,a0,0x4
8000c4f0:	00a48493          	addi	s1,s1,10
8000c4f4:	06100593          	li	a1,97
8000c4f8:	01a78463          	beq	a5,s10,8000c500 <ip4addr_aton+0x104>
8000c4fc:	04100593          	li	a1,65
8000c500:	40b484b3          	sub	s1,s1,a1
8000c504:	00a4e533          	or	a0,s1,a0
8000c508:	001a4483          	lbu	s1,1(s4)
8000c50c:	fb9ff06f          	j	8000c4c4 <ip4addr_aton+0xc8>
8000c510:	01b49e63          	bne	s1,s11,8000c52c <ip4addr_aton+0x130>
8000c514:	12e90863          	beq	s2,a4,8000c644 <ip4addr_aton+0x248>
8000c518:	00490913          	addi	s2,s2,4
8000c51c:	fea92e23          	sw	a0,-4(s2)
8000c520:	001a4483          	lbu	s1,1(s4)
8000c524:	001a0513          	addi	a0,s4,1
8000c528:	f3dff06f          	j	8000c464 <ip4addr_aton+0x68>
8000c52c:	00048863          	beqz	s1,8000c53c <ip4addr_aton+0x140>
8000c530:	0087f793          	andi	a5,a5,8
8000c534:	00000413          	li	s0,0
8000c538:	02078863          	beqz	a5,8000c568 <ip4addr_aton+0x16c>
8000c53c:	41790433          	sub	s0,s2,s7
8000c540:	40245413          	srai	s0,s0,0x2
8000c544:	00140413          	addi	s0,s0,1
8000c548:	00200793          	li	a5,2
8000c54c:	0af40263          	beq	s0,a5,8000c5f0 <ip4addr_aton+0x1f4>
8000c550:	0487cc63          	blt	a5,s0,8000c5a8 <ip4addr_aton+0x1ac>
8000c554:	00040a63          	beqz	s0,8000c568 <ip4addr_aton+0x16c>
8000c558:	00100413          	li	s0,1
8000c55c:	00098663          	beqz	s3,8000c568 <ip4addr_aton+0x16c>
8000c560:	e3cf90ef          	jal	ra,80005b9c <lwip_htonl>
8000c564:	00a9a023          	sw	a0,0(s3)
8000c568:	00040513          	mv	a0,s0
8000c56c:	04c12083          	lw	ra,76(sp)
8000c570:	04812403          	lw	s0,72(sp)
8000c574:	04412483          	lw	s1,68(sp)
8000c578:	04012903          	lw	s2,64(sp)
8000c57c:	03c12983          	lw	s3,60(sp)
8000c580:	03812a03          	lw	s4,56(sp)
8000c584:	03412a83          	lw	s5,52(sp)
8000c588:	03012b03          	lw	s6,48(sp)
8000c58c:	02c12b83          	lw	s7,44(sp)
8000c590:	02812c03          	lw	s8,40(sp)
8000c594:	02412c83          	lw	s9,36(sp)
8000c598:	02012d03          	lw	s10,32(sp)
8000c59c:	01c12d83          	lw	s11,28(sp)
8000c5a0:	05010113          	addi	sp,sp,80
8000c5a4:	00008067          	ret
8000c5a8:	00300793          	li	a5,3
8000c5ac:	06f40463          	beq	s0,a5,8000c614 <ip4addr_aton+0x218>
8000c5b0:	00400793          	li	a5,4
8000c5b4:	faf412e3          	bne	s0,a5,8000c558 <ip4addr_aton+0x15c>
8000c5b8:	0ff00613          	li	a2,255
8000c5bc:	00000413          	li	s0,0
8000c5c0:	faa664e3          	bltu	a2,a0,8000c568 <ip4addr_aton+0x16c>
8000c5c4:	00012783          	lw	a5,0(sp)
8000c5c8:	faf660e3          	bltu	a2,a5,8000c568 <ip4addr_aton+0x16c>
8000c5cc:	00412683          	lw	a3,4(sp)
8000c5d0:	f8d66ce3          	bltu	a2,a3,8000c568 <ip4addr_aton+0x16c>
8000c5d4:	00812703          	lw	a4,8(sp)
8000c5d8:	f8e668e3          	bltu	a2,a4,8000c568 <ip4addr_aton+0x16c>
8000c5dc:	01879793          	slli	a5,a5,0x18
8000c5e0:	01069693          	slli	a3,a3,0x10
8000c5e4:	00d7e7b3          	or	a5,a5,a3
8000c5e8:	00871713          	slli	a4,a4,0x8
8000c5ec:	0500006f          	j	8000c63c <ip4addr_aton+0x240>
8000c5f0:	010007b7          	lui	a5,0x1000
8000c5f4:	00000413          	li	s0,0
8000c5f8:	f6f578e3          	bgeu	a0,a5,8000c568 <ip4addr_aton+0x16c>
8000c5fc:	00012783          	lw	a5,0(sp)
8000c600:	0ff00713          	li	a4,255
8000c604:	f6f762e3          	bltu	a4,a5,8000c568 <ip4addr_aton+0x16c>
8000c608:	01879793          	slli	a5,a5,0x18
8000c60c:	00f56533          	or	a0,a0,a5
8000c610:	f49ff06f          	j	8000c558 <ip4addr_aton+0x15c>
8000c614:	000107b7          	lui	a5,0x10
8000c618:	00000413          	li	s0,0
8000c61c:	f4f576e3          	bgeu	a0,a5,8000c568 <ip4addr_aton+0x16c>
8000c620:	00012783          	lw	a5,0(sp)
8000c624:	0ff00693          	li	a3,255
8000c628:	f4f6e0e3          	bltu	a3,a5,8000c568 <ip4addr_aton+0x16c>
8000c62c:	00412703          	lw	a4,4(sp)
8000c630:	f2e6ece3          	bltu	a3,a4,8000c568 <ip4addr_aton+0x16c>
8000c634:	01879793          	slli	a5,a5,0x18
8000c638:	01071713          	slli	a4,a4,0x10
8000c63c:	00e7e7b3          	or	a5,a5,a4
8000c640:	fcdff06f          	j	8000c60c <ip4addr_aton+0x210>
8000c644:	00000413          	li	s0,0
8000c648:	f21ff06f          	j	8000c568 <ip4addr_aton+0x16c>

8000c64c <ipaddr_addr>:
8000c64c:	fe010113          	addi	sp,sp,-32
8000c650:	00c10593          	addi	a1,sp,12
8000c654:	00112e23          	sw	ra,28(sp)
8000c658:	da5ff0ef          	jal	ra,8000c3fc <ip4addr_aton>
8000c65c:	00050a63          	beqz	a0,8000c670 <ipaddr_addr+0x24>
8000c660:	00c12503          	lw	a0,12(sp)
8000c664:	01c12083          	lw	ra,28(sp)
8000c668:	02010113          	addi	sp,sp,32
8000c66c:	00008067          	ret
8000c670:	fff00513          	li	a0,-1
8000c674:	ff1ff06f          	j	8000c664 <ipaddr_addr+0x18>

8000c678 <ip4addr_ntoa_r>:
8000c678:	fb010113          	addi	sp,sp,-80
8000c67c:	04912223          	sw	s1,68(sp)
8000c680:	05212023          	sw	s2,64(sp)
8000c684:	03312e23          	sw	s3,60(sp)
8000c688:	03612823          	sw	s6,48(sp)
8000c68c:	03812423          	sw	s8,40(sp)
8000c690:	03912223          	sw	s9,36(sp)
8000c694:	03a12023          	sw	s10,32(sp)
8000c698:	04112623          	sw	ra,76(sp)
8000c69c:	04812423          	sw	s0,72(sp)
8000c6a0:	03412c23          	sw	s4,56(sp)
8000c6a4:	03512a23          	sw	s5,52(sp)
8000c6a8:	03712623          	sw	s7,44(sp)
8000c6ac:	00052783          	lw	a5,0(a0)
8000c6b0:	00058493          	mv	s1,a1
8000c6b4:	00058b13          	mv	s6,a1
8000c6b8:	00f12e23          	sw	a5,28(sp)
8000c6bc:	00000993          	li	s3,0
8000c6c0:	01c10913          	addi	s2,sp,28
8000c6c4:	00900c93          	li	s9,9
8000c6c8:	0ff00d13          	li	s10,255
8000c6cc:	02e00c13          	li	s8,46
8000c6d0:	00094a03          	lbu	s4,0(s2)
8000c6d4:	00000413          	li	s0,0
8000c6d8:	00a00593          	li	a1,10
8000c6dc:	000a0513          	mv	a0,s4
8000c6e0:	00c12623          	sw	a2,12(sp)
8000c6e4:	239000ef          	jal	ra,8000d11c <__udivsi3>
8000c6e8:	0ff57b93          	andi	s7,a0,255
8000c6ec:	00a00593          	li	a1,10
8000c6f0:	000a0513          	mv	a0,s4
8000c6f4:	271000ef          	jal	ra,8000d164 <__umodsi3>
8000c6f8:	02010793          	addi	a5,sp,32
8000c6fc:	03050513          	addi	a0,a0,48
8000c700:	008787b3          	add	a5,a5,s0
8000c704:	00140a93          	addi	s5,s0,1
8000c708:	fea78c23          	sb	a0,-8(a5) # fff8 <_stack_size+0xf7f8>
8000c70c:	0ffafa93          	andi	s5,s5,255
8000c710:	00c12603          	lw	a2,12(sp)
8000c714:	074ce863          	bltu	s9,s4,8000c784 <ip4addr_ntoa_r+0x10c>
8000c718:	01790023          	sb	s7,0(s2)
8000c71c:	00098713          	mv	a4,s3
8000c720:	000b0793          	mv	a5,s6
8000c724:	00198993          	addi	s3,s3,1
8000c728:	07a41463          	bne	s0,s10,8000c790 <ip4addr_ntoa_r+0x118>
8000c72c:	08c75863          	bge	a4,a2,8000c7bc <ip4addr_ntoa_r+0x144>
8000c730:	01878023          	sb	s8,0(a5)
8000c734:	00190913          	addi	s2,s2,1
8000c738:	02010713          	addi	a4,sp,32
8000c73c:	00178b13          	addi	s6,a5,1
8000c740:	f8e918e3          	bne	s2,a4,8000c6d0 <ip4addr_ntoa_r+0x58>
8000c744:	00078023          	sb	zero,0(a5)
8000c748:	00048513          	mv	a0,s1
8000c74c:	04c12083          	lw	ra,76(sp)
8000c750:	04812403          	lw	s0,72(sp)
8000c754:	04412483          	lw	s1,68(sp)
8000c758:	04012903          	lw	s2,64(sp)
8000c75c:	03c12983          	lw	s3,60(sp)
8000c760:	03812a03          	lw	s4,56(sp)
8000c764:	03412a83          	lw	s5,52(sp)
8000c768:	03012b03          	lw	s6,48(sp)
8000c76c:	02c12b83          	lw	s7,44(sp)
8000c770:	02812c03          	lw	s8,40(sp)
8000c774:	02412c83          	lw	s9,36(sp)
8000c778:	02012d03          	lw	s10,32(sp)
8000c77c:	05010113          	addi	sp,sp,80
8000c780:	00008067          	ret
8000c784:	000b8a13          	mv	s4,s7
8000c788:	000a8413          	mv	s0,s5
8000c78c:	f4dff06f          	j	8000c6d8 <ip4addr_ntoa_r+0x60>
8000c790:	fff40693          	addi	a3,s0,-1
8000c794:	0ff6f693          	andi	a3,a3,255
8000c798:	02c75263          	bge	a4,a2,8000c7bc <ip4addr_ntoa_r+0x144>
8000c79c:	02010713          	addi	a4,sp,32
8000c7a0:	00870433          	add	s0,a4,s0
8000c7a4:	ff844703          	lbu	a4,-8(s0)
8000c7a8:	00178793          	addi	a5,a5,1
8000c7ac:	00068413          	mv	s0,a3
8000c7b0:	fee78fa3          	sb	a4,-1(a5)
8000c7b4:	00098713          	mv	a4,s3
8000c7b8:	f6dff06f          	j	8000c724 <ip4addr_ntoa_r+0xac>
8000c7bc:	00000513          	li	a0,0
8000c7c0:	f8dff06f          	j	8000c74c <ip4addr_ntoa_r+0xd4>

8000c7c4 <ip4addr_ntoa>:
8000c7c4:	01000613          	li	a2,16
8000c7c8:	c2418593          	addi	a1,gp,-988 # 800033c4 <str.4106>
8000c7cc:	eadff06f          	j	8000c678 <ip4addr_ntoa_r>

8000c7d0 <ethernet_input>:
8000c7d0:	ff010113          	addi	sp,sp,-16
8000c7d4:	00812423          	sw	s0,8(sp)
8000c7d8:	00112623          	sw	ra,12(sp)
8000c7dc:	00912223          	sw	s1,4(sp)
8000c7e0:	01212023          	sw	s2,0(sp)
8000c7e4:	00a55703          	lhu	a4,10(a0)
8000c7e8:	01000793          	li	a5,16
8000c7ec:	00050413          	mv	s0,a0
8000c7f0:	00e7ec63          	bltu	a5,a4,8000c808 <ethernet_input+0x38>
8000c7f4:	9f418793          	addi	a5,gp,-1548 # 80003194 <lwip_stats>
8000c7f8:	0507a703          	lw	a4,80(a5)
8000c7fc:	00170713          	addi	a4,a4,1
8000c800:	04e7a823          	sw	a4,80(a5)
8000c804:	0a00006f          	j	8000c8a4 <ethernet_input+0xd4>
8000c808:	00f54783          	lbu	a5,15(a0)
8000c80c:	00058913          	mv	s2,a1
8000c810:	00079863          	bnez	a5,8000c820 <ethernet_input+0x50>
8000c814:	0385c783          	lbu	a5,56(a1)
8000c818:	00178793          	addi	a5,a5,1
8000c81c:	00f507a3          	sb	a5,15(a0)
8000c820:	00442503          	lw	a0,4(s0)
8000c824:	00f54483          	lbu	s1,15(a0)
8000c828:	00e54783          	lbu	a5,14(a0)
8000c82c:	00849493          	slli	s1,s1,0x8
8000c830:	00f4e4b3          	or	s1,s1,a5
8000c834:	00254783          	lbu	a5,2(a0)
8000c838:	0017f713          	andi	a4,a5,1
8000c83c:	02070663          	beqz	a4,8000c868 <ethernet_input+0x98>
8000c840:	00100713          	li	a4,1
8000c844:	06e79c63          	bne	a5,a4,8000c8bc <ethernet_input+0xec>
8000c848:	00354783          	lbu	a5,3(a0)
8000c84c:	00079e63          	bnez	a5,8000c868 <ethernet_input+0x98>
8000c850:	00454703          	lbu	a4,4(a0)
8000c854:	05e00793          	li	a5,94
8000c858:	00f71863          	bne	a4,a5,8000c868 <ethernet_input+0x98>
8000c85c:	00d44783          	lbu	a5,13(s0)
8000c860:	0107e793          	ori	a5,a5,16
8000c864:	00f406a3          	sb	a5,13(s0)
8000c868:	00800793          	li	a5,8
8000c86c:	06f48863          	beq	s1,a5,8000c8dc <ethernet_input+0x10c>
8000c870:	60800793          	li	a5,1544
8000c874:	f8f490e3          	bne	s1,a5,8000c7f4 <ethernet_input+0x24>
8000c878:	03594783          	lbu	a5,53(s2)
8000c87c:	0087f793          	andi	a5,a5,8
8000c880:	02078863          	beqz	a5,8000c8b0 <ethernet_input+0xe0>
8000c884:	01000593          	li	a1,16
8000c888:	00040513          	mv	a0,s0
8000c88c:	c94fa0ef          	jal	ra,80006d20 <pbuf_remove_header>
8000c890:	08050863          	beqz	a0,8000c920 <ethernet_input+0x150>
8000c894:	9f418793          	addi	a5,gp,-1548 # 80003194 <lwip_stats>
8000c898:	0447a703          	lw	a4,68(a5)
8000c89c:	00170713          	addi	a4,a4,1
8000c8a0:	04e7a223          	sw	a4,68(a5)
8000c8a4:	03c7a703          	lw	a4,60(a5)
8000c8a8:	00170713          	addi	a4,a4,1
8000c8ac:	02e7ae23          	sw	a4,60(a5)
8000c8b0:	00040513          	mv	a0,s0
8000c8b4:	cf4fa0ef          	jal	ra,80006da8 <pbuf_free>
8000c8b8:	04c0006f          	j	8000c904 <ethernet_input+0x134>
8000c8bc:	00600613          	li	a2,6
8000c8c0:	85418593          	addi	a1,gp,-1964 # 80002ff4 <ethbroadcast>
8000c8c4:	00250513          	addi	a0,a0,2
8000c8c8:	544010ef          	jal	ra,8000de0c <memcmp>
8000c8cc:	f8051ee3          	bnez	a0,8000c868 <ethernet_input+0x98>
8000c8d0:	00d44783          	lbu	a5,13(s0)
8000c8d4:	0087e793          	ori	a5,a5,8
8000c8d8:	f8dff06f          	j	8000c864 <ethernet_input+0x94>
8000c8dc:	03594783          	lbu	a5,53(s2)
8000c8e0:	0087f793          	andi	a5,a5,8
8000c8e4:	fc0786e3          	beqz	a5,8000c8b0 <ethernet_input+0xe0>
8000c8e8:	01000593          	li	a1,16
8000c8ec:	00040513          	mv	a0,s0
8000c8f0:	c30fa0ef          	jal	ra,80006d20 <pbuf_remove_header>
8000c8f4:	fa051ee3          	bnez	a0,8000c8b0 <ethernet_input+0xe0>
8000c8f8:	00090593          	mv	a1,s2
8000c8fc:	00040513          	mv	a0,s0
8000c900:	b30ff0ef          	jal	ra,8000bc30 <ip4_input>
8000c904:	00c12083          	lw	ra,12(sp)
8000c908:	00812403          	lw	s0,8(sp)
8000c90c:	00412483          	lw	s1,4(sp)
8000c910:	00012903          	lw	s2,0(sp)
8000c914:	00000513          	li	a0,0
8000c918:	01010113          	addi	sp,sp,16
8000c91c:	00008067          	ret
8000c920:	00090593          	mv	a1,s2
8000c924:	00040513          	mv	a0,s0
8000c928:	ad8fe0ef          	jal	ra,8000ac00 <etharp_input>
8000c92c:	fd9ff06f          	j	8000c904 <ethernet_input+0x134>

8000c930 <ethernet_output>:
8000c930:	fd010113          	addi	sp,sp,-48
8000c934:	01312e23          	sw	s3,28(sp)
8000c938:	00050993          	mv	s3,a0
8000c93c:	00070513          	mv	a0,a4
8000c940:	00d12623          	sw	a3,12(sp)
8000c944:	02112623          	sw	ra,44(sp)
8000c948:	02912223          	sw	s1,36(sp)
8000c94c:	03212023          	sw	s2,32(sp)
8000c950:	01412c23          	sw	s4,24(sp)
8000c954:	00058913          	mv	s2,a1
8000c958:	00060a13          	mv	s4,a2
8000c95c:	02812423          	sw	s0,40(sp)
8000c960:	a24f90ef          	jal	ra,80005b84 <lwip_htons>
8000c964:	00050493          	mv	s1,a0
8000c968:	01000593          	li	a1,16
8000c96c:	00090513          	mv	a0,s2
8000c970:	ba0fa0ef          	jal	ra,80006d10 <pbuf_add_header>
8000c974:	00c12683          	lw	a3,12(sp)
8000c978:	06051063          	bnez	a0,8000c9d8 <ethernet_output+0xa8>
8000c97c:	00492403          	lw	s0,4(s2)
8000c980:	00068593          	mv	a1,a3
8000c984:	00600613          	li	a2,6
8000c988:	00940723          	sb	s1,14(s0)
8000c98c:	0084d493          	srli	s1,s1,0x8
8000c990:	009407a3          	sb	s1,15(s0)
8000c994:	00240513          	addi	a0,s0,2
8000c998:	4a4010ef          	jal	ra,8000de3c <memcpy>
8000c99c:	000a0593          	mv	a1,s4
8000c9a0:	00840513          	addi	a0,s0,8
8000c9a4:	00600613          	li	a2,6
8000c9a8:	494010ef          	jal	ra,8000de3c <memcpy>
8000c9ac:	02812403          	lw	s0,40(sp)
8000c9b0:	0189a303          	lw	t1,24(s3)
8000c9b4:	02c12083          	lw	ra,44(sp)
8000c9b8:	02412483          	lw	s1,36(sp)
8000c9bc:	01812a03          	lw	s4,24(sp)
8000c9c0:	00090593          	mv	a1,s2
8000c9c4:	00098513          	mv	a0,s3
8000c9c8:	02012903          	lw	s2,32(sp)
8000c9cc:	01c12983          	lw	s3,28(sp)
8000c9d0:	03010113          	addi	sp,sp,48
8000c9d4:	00030067          	jr	t1
8000c9d8:	9f418793          	addi	a5,gp,-1548 # 80003194 <lwip_stats>
8000c9dc:	0147a703          	lw	a4,20(a5)
8000c9e0:	ffe00513          	li	a0,-2
8000c9e4:	00170713          	addi	a4,a4,1
8000c9e8:	00e7aa23          	sw	a4,20(a5)
8000c9ec:	02c12083          	lw	ra,44(sp)
8000c9f0:	02812403          	lw	s0,40(sp)
8000c9f4:	02412483          	lw	s1,36(sp)
8000c9f8:	02012903          	lw	s2,32(sp)
8000c9fc:	01c12983          	lw	s3,28(sp)
8000ca00:	01812a03          	lw	s4,24(sp)
8000ca04:	03010113          	addi	sp,sp,48
8000ca08:	00008067          	ret

8000ca0c <memset>:
8000ca0c:	00f00313          	li	t1,15
8000ca10:	00050713          	mv	a4,a0
8000ca14:	02c37e63          	bgeu	t1,a2,8000ca50 <memset+0x44>
8000ca18:	00f77793          	andi	a5,a4,15
8000ca1c:	0a079063          	bnez	a5,8000cabc <memset+0xb0>
8000ca20:	08059263          	bnez	a1,8000caa4 <memset+0x98>
8000ca24:	ff067693          	andi	a3,a2,-16
8000ca28:	00f67613          	andi	a2,a2,15
8000ca2c:	00e686b3          	add	a3,a3,a4
8000ca30:	00b72023          	sw	a1,0(a4)
8000ca34:	00b72223          	sw	a1,4(a4)
8000ca38:	00b72423          	sw	a1,8(a4)
8000ca3c:	00b72623          	sw	a1,12(a4)
8000ca40:	01070713          	addi	a4,a4,16
8000ca44:	fed766e3          	bltu	a4,a3,8000ca30 <memset+0x24>
8000ca48:	00061463          	bnez	a2,8000ca50 <memset+0x44>
8000ca4c:	00008067          	ret
8000ca50:	40c306b3          	sub	a3,t1,a2
8000ca54:	00269693          	slli	a3,a3,0x2
8000ca58:	00000297          	auipc	t0,0x0
8000ca5c:	005686b3          	add	a3,a3,t0
8000ca60:	00c68067          	jr	12(a3)
8000ca64:	00b70723          	sb	a1,14(a4)
8000ca68:	00b706a3          	sb	a1,13(a4)
8000ca6c:	00b70623          	sb	a1,12(a4)
8000ca70:	00b705a3          	sb	a1,11(a4)
8000ca74:	00b70523          	sb	a1,10(a4)
8000ca78:	00b704a3          	sb	a1,9(a4)
8000ca7c:	00b70423          	sb	a1,8(a4)
8000ca80:	00b703a3          	sb	a1,7(a4)
8000ca84:	00b70323          	sb	a1,6(a4)
8000ca88:	00b702a3          	sb	a1,5(a4)
8000ca8c:	00b70223          	sb	a1,4(a4)
8000ca90:	00b701a3          	sb	a1,3(a4)
8000ca94:	00b70123          	sb	a1,2(a4)
8000ca98:	00b700a3          	sb	a1,1(a4)
8000ca9c:	00b70023          	sb	a1,0(a4)
8000caa0:	00008067          	ret
8000caa4:	0ff5f593          	andi	a1,a1,255
8000caa8:	00859693          	slli	a3,a1,0x8
8000caac:	00d5e5b3          	or	a1,a1,a3
8000cab0:	01059693          	slli	a3,a1,0x10
8000cab4:	00d5e5b3          	or	a1,a1,a3
8000cab8:	f6dff06f          	j	8000ca24 <memset+0x18>
8000cabc:	00279693          	slli	a3,a5,0x2
8000cac0:	00000297          	auipc	t0,0x0
8000cac4:	005686b3          	add	a3,a3,t0
8000cac8:	00008293          	mv	t0,ra
8000cacc:	fa0680e7          	jalr	-96(a3)
8000cad0:	00028093          	mv	ra,t0
8000cad4:	ff078793          	addi	a5,a5,-16
8000cad8:	40f70733          	sub	a4,a4,a5
8000cadc:	00f60633          	add	a2,a2,a5
8000cae0:	f6c378e3          	bgeu	t1,a2,8000ca50 <memset+0x44>
8000cae4:	f3dff06f          	j	8000ca20 <memset+0x14>

8000cae8 <__bswapsi2>:
8000cae8:	01851713          	slli	a4,a0,0x18
8000caec:	01855793          	srli	a5,a0,0x18
8000caf0:	000106b7          	lui	a3,0x10
8000caf4:	00e7e7b3          	or	a5,a5,a4
8000caf8:	f0068693          	addi	a3,a3,-256 # ff00 <_stack_size+0xf700>
8000cafc:	40855713          	srai	a4,a0,0x8
8000cb00:	00d77733          	and	a4,a4,a3
8000cb04:	00e7e7b3          	or	a5,a5,a4
8000cb08:	00851513          	slli	a0,a0,0x8
8000cb0c:	00ff0737          	lui	a4,0xff0
8000cb10:	00e57533          	and	a0,a0,a4
8000cb14:	00a7e533          	or	a0,a5,a0
8000cb18:	00008067          	ret

8000cb1c <__udivdi3>:
8000cb1c:	fd010113          	addi	sp,sp,-48
8000cb20:	02912223          	sw	s1,36(sp)
8000cb24:	01612823          	sw	s6,16(sp)
8000cb28:	02112623          	sw	ra,44(sp)
8000cb2c:	02812423          	sw	s0,40(sp)
8000cb30:	03212023          	sw	s2,32(sp)
8000cb34:	01312e23          	sw	s3,28(sp)
8000cb38:	01412c23          	sw	s4,24(sp)
8000cb3c:	01512a23          	sw	s5,20(sp)
8000cb40:	01712623          	sw	s7,12(sp)
8000cb44:	01812423          	sw	s8,8(sp)
8000cb48:	01912223          	sw	s9,4(sp)
8000cb4c:	00050b13          	mv	s6,a0
8000cb50:	00058493          	mv	s1,a1
8000cb54:	38069c63          	bnez	a3,8000ceec <__udivdi3+0x3d0>
8000cb58:	00060413          	mv	s0,a2
8000cb5c:	00050993          	mv	s3,a0
8000cb60:	ffff6917          	auipc	s2,0xffff6
8000cb64:	2b090913          	addi	s2,s2,688 # 80002e10 <__clz_tab>
8000cb68:	12c5f863          	bgeu	a1,a2,8000cc98 <__udivdi3+0x17c>
8000cb6c:	000107b7          	lui	a5,0x10
8000cb70:	00058a93          	mv	s5,a1
8000cb74:	10f67863          	bgeu	a2,a5,8000cc84 <__udivdi3+0x168>
8000cb78:	0ff00693          	li	a3,255
8000cb7c:	00c6b6b3          	sltu	a3,a3,a2
8000cb80:	00369693          	slli	a3,a3,0x3
8000cb84:	00d657b3          	srl	a5,a2,a3
8000cb88:	00f90933          	add	s2,s2,a5
8000cb8c:	00094703          	lbu	a4,0(s2)
8000cb90:	00d706b3          	add	a3,a4,a3
8000cb94:	02000713          	li	a4,32
8000cb98:	40d70733          	sub	a4,a4,a3
8000cb9c:	00070c63          	beqz	a4,8000cbb4 <__udivdi3+0x98>
8000cba0:	00e494b3          	sll	s1,s1,a4
8000cba4:	00db56b3          	srl	a3,s6,a3
8000cba8:	00e61433          	sll	s0,a2,a4
8000cbac:	0096eab3          	or	s5,a3,s1
8000cbb0:	00eb19b3          	sll	s3,s6,a4
8000cbb4:	01045b13          	srli	s6,s0,0x10
8000cbb8:	000b0593          	mv	a1,s6
8000cbbc:	000a8513          	mv	a0,s5
8000cbc0:	5a4000ef          	jal	ra,8000d164 <__umodsi3>
8000cbc4:	00050913          	mv	s2,a0
8000cbc8:	000b0593          	mv	a1,s6
8000cbcc:	01041b93          	slli	s7,s0,0x10
8000cbd0:	000a8513          	mv	a0,s5
8000cbd4:	548000ef          	jal	ra,8000d11c <__udivsi3>
8000cbd8:	010bdb93          	srli	s7,s7,0x10
8000cbdc:	00050493          	mv	s1,a0
8000cbe0:	00050593          	mv	a1,a0
8000cbe4:	000b8513          	mv	a0,s7
8000cbe8:	508000ef          	jal	ra,8000d0f0 <__mulsi3>
8000cbec:	01091913          	slli	s2,s2,0x10
8000cbf0:	0109d713          	srli	a4,s3,0x10
8000cbf4:	00e96733          	or	a4,s2,a4
8000cbf8:	00048a13          	mv	s4,s1
8000cbfc:	00a77e63          	bgeu	a4,a0,8000cc18 <__udivdi3+0xfc>
8000cc00:	00870733          	add	a4,a4,s0
8000cc04:	fff48a13          	addi	s4,s1,-1
8000cc08:	00876863          	bltu	a4,s0,8000cc18 <__udivdi3+0xfc>
8000cc0c:	00a77663          	bgeu	a4,a0,8000cc18 <__udivdi3+0xfc>
8000cc10:	ffe48a13          	addi	s4,s1,-2
8000cc14:	00870733          	add	a4,a4,s0
8000cc18:	40a704b3          	sub	s1,a4,a0
8000cc1c:	000b0593          	mv	a1,s6
8000cc20:	00048513          	mv	a0,s1
8000cc24:	540000ef          	jal	ra,8000d164 <__umodsi3>
8000cc28:	00050913          	mv	s2,a0
8000cc2c:	000b0593          	mv	a1,s6
8000cc30:	00048513          	mv	a0,s1
8000cc34:	4e8000ef          	jal	ra,8000d11c <__udivsi3>
8000cc38:	01099993          	slli	s3,s3,0x10
8000cc3c:	00050493          	mv	s1,a0
8000cc40:	00050593          	mv	a1,a0
8000cc44:	01091913          	slli	s2,s2,0x10
8000cc48:	000b8513          	mv	a0,s7
8000cc4c:	0109d993          	srli	s3,s3,0x10
8000cc50:	4a0000ef          	jal	ra,8000d0f0 <__mulsi3>
8000cc54:	013969b3          	or	s3,s2,s3
8000cc58:	00048613          	mv	a2,s1
8000cc5c:	00a9fc63          	bgeu	s3,a0,8000cc74 <__udivdi3+0x158>
8000cc60:	013409b3          	add	s3,s0,s3
8000cc64:	fff48613          	addi	a2,s1,-1
8000cc68:	0089e663          	bltu	s3,s0,8000cc74 <__udivdi3+0x158>
8000cc6c:	00a9f463          	bgeu	s3,a0,8000cc74 <__udivdi3+0x158>
8000cc70:	ffe48613          	addi	a2,s1,-2
8000cc74:	010a1793          	slli	a5,s4,0x10
8000cc78:	00c7e7b3          	or	a5,a5,a2
8000cc7c:	00000a13          	li	s4,0
8000cc80:	1300006f          	j	8000cdb0 <__udivdi3+0x294>
8000cc84:	010007b7          	lui	a5,0x1000
8000cc88:	01000693          	li	a3,16
8000cc8c:	eef66ce3          	bltu	a2,a5,8000cb84 <__udivdi3+0x68>
8000cc90:	01800693          	li	a3,24
8000cc94:	ef1ff06f          	j	8000cb84 <__udivdi3+0x68>
8000cc98:	00068a13          	mv	s4,a3
8000cc9c:	00061a63          	bnez	a2,8000ccb0 <__udivdi3+0x194>
8000cca0:	00000593          	li	a1,0
8000cca4:	00100513          	li	a0,1
8000cca8:	474000ef          	jal	ra,8000d11c <__udivsi3>
8000ccac:	00050413          	mv	s0,a0
8000ccb0:	000107b7          	lui	a5,0x10
8000ccb4:	12f47c63          	bgeu	s0,a5,8000cdec <__udivdi3+0x2d0>
8000ccb8:	0ff00793          	li	a5,255
8000ccbc:	0087f463          	bgeu	a5,s0,8000ccc4 <__udivdi3+0x1a8>
8000ccc0:	00800a13          	li	s4,8
8000ccc4:	014457b3          	srl	a5,s0,s4
8000ccc8:	00f90933          	add	s2,s2,a5
8000cccc:	00094683          	lbu	a3,0(s2)
8000ccd0:	02000613          	li	a2,32
8000ccd4:	014686b3          	add	a3,a3,s4
8000ccd8:	40d60633          	sub	a2,a2,a3
8000ccdc:	12061263          	bnez	a2,8000ce00 <__udivdi3+0x2e4>
8000cce0:	408484b3          	sub	s1,s1,s0
8000cce4:	00100a13          	li	s4,1
8000cce8:	01045b13          	srli	s6,s0,0x10
8000ccec:	000b0593          	mv	a1,s6
8000ccf0:	00048513          	mv	a0,s1
8000ccf4:	470000ef          	jal	ra,8000d164 <__umodsi3>
8000ccf8:	00050913          	mv	s2,a0
8000ccfc:	000b0593          	mv	a1,s6
8000cd00:	00048513          	mv	a0,s1
8000cd04:	01041b93          	slli	s7,s0,0x10
8000cd08:	414000ef          	jal	ra,8000d11c <__udivsi3>
8000cd0c:	010bdb93          	srli	s7,s7,0x10
8000cd10:	00050493          	mv	s1,a0
8000cd14:	00050593          	mv	a1,a0
8000cd18:	000b8513          	mv	a0,s7
8000cd1c:	3d4000ef          	jal	ra,8000d0f0 <__mulsi3>
8000cd20:	01091913          	slli	s2,s2,0x10
8000cd24:	0109d713          	srli	a4,s3,0x10
8000cd28:	00e96733          	or	a4,s2,a4
8000cd2c:	00048a93          	mv	s5,s1
8000cd30:	00a77e63          	bgeu	a4,a0,8000cd4c <__udivdi3+0x230>
8000cd34:	00870733          	add	a4,a4,s0
8000cd38:	fff48a93          	addi	s5,s1,-1
8000cd3c:	00876863          	bltu	a4,s0,8000cd4c <__udivdi3+0x230>
8000cd40:	00a77663          	bgeu	a4,a0,8000cd4c <__udivdi3+0x230>
8000cd44:	ffe48a93          	addi	s5,s1,-2
8000cd48:	00870733          	add	a4,a4,s0
8000cd4c:	40a704b3          	sub	s1,a4,a0
8000cd50:	000b0593          	mv	a1,s6
8000cd54:	00048513          	mv	a0,s1
8000cd58:	40c000ef          	jal	ra,8000d164 <__umodsi3>
8000cd5c:	00050913          	mv	s2,a0
8000cd60:	000b0593          	mv	a1,s6
8000cd64:	00048513          	mv	a0,s1
8000cd68:	3b4000ef          	jal	ra,8000d11c <__udivsi3>
8000cd6c:	01099993          	slli	s3,s3,0x10
8000cd70:	00050493          	mv	s1,a0
8000cd74:	00050593          	mv	a1,a0
8000cd78:	01091913          	slli	s2,s2,0x10
8000cd7c:	000b8513          	mv	a0,s7
8000cd80:	0109d993          	srli	s3,s3,0x10
8000cd84:	36c000ef          	jal	ra,8000d0f0 <__mulsi3>
8000cd88:	013969b3          	or	s3,s2,s3
8000cd8c:	00048613          	mv	a2,s1
8000cd90:	00a9fc63          	bgeu	s3,a0,8000cda8 <__udivdi3+0x28c>
8000cd94:	013409b3          	add	s3,s0,s3
8000cd98:	fff48613          	addi	a2,s1,-1
8000cd9c:	0089e663          	bltu	s3,s0,8000cda8 <__udivdi3+0x28c>
8000cda0:	00a9f463          	bgeu	s3,a0,8000cda8 <__udivdi3+0x28c>
8000cda4:	ffe48613          	addi	a2,s1,-2
8000cda8:	010a9793          	slli	a5,s5,0x10
8000cdac:	00c7e7b3          	or	a5,a5,a2
8000cdb0:	00078513          	mv	a0,a5
8000cdb4:	000a0593          	mv	a1,s4
8000cdb8:	02c12083          	lw	ra,44(sp)
8000cdbc:	02812403          	lw	s0,40(sp)
8000cdc0:	02412483          	lw	s1,36(sp)
8000cdc4:	02012903          	lw	s2,32(sp)
8000cdc8:	01c12983          	lw	s3,28(sp)
8000cdcc:	01812a03          	lw	s4,24(sp)
8000cdd0:	01412a83          	lw	s5,20(sp)
8000cdd4:	01012b03          	lw	s6,16(sp)
8000cdd8:	00c12b83          	lw	s7,12(sp)
8000cddc:	00812c03          	lw	s8,8(sp)
8000cde0:	00412c83          	lw	s9,4(sp)
8000cde4:	03010113          	addi	sp,sp,48
8000cde8:	00008067          	ret
8000cdec:	010007b7          	lui	a5,0x1000
8000cdf0:	01000a13          	li	s4,16
8000cdf4:	ecf468e3          	bltu	s0,a5,8000ccc4 <__udivdi3+0x1a8>
8000cdf8:	01800a13          	li	s4,24
8000cdfc:	ec9ff06f          	j	8000ccc4 <__udivdi3+0x1a8>
8000ce00:	00c41433          	sll	s0,s0,a2
8000ce04:	00d4da33          	srl	s4,s1,a3
8000ce08:	00cb19b3          	sll	s3,s6,a2
8000ce0c:	00db56b3          	srl	a3,s6,a3
8000ce10:	01045b13          	srli	s6,s0,0x10
8000ce14:	00c494b3          	sll	s1,s1,a2
8000ce18:	000b0593          	mv	a1,s6
8000ce1c:	000a0513          	mv	a0,s4
8000ce20:	0096eab3          	or	s5,a3,s1
8000ce24:	340000ef          	jal	ra,8000d164 <__umodsi3>
8000ce28:	00050913          	mv	s2,a0
8000ce2c:	000b0593          	mv	a1,s6
8000ce30:	000a0513          	mv	a0,s4
8000ce34:	01041b93          	slli	s7,s0,0x10
8000ce38:	2e4000ef          	jal	ra,8000d11c <__udivsi3>
8000ce3c:	010bdb93          	srli	s7,s7,0x10
8000ce40:	00050493          	mv	s1,a0
8000ce44:	00050593          	mv	a1,a0
8000ce48:	000b8513          	mv	a0,s7
8000ce4c:	2a4000ef          	jal	ra,8000d0f0 <__mulsi3>
8000ce50:	01091913          	slli	s2,s2,0x10
8000ce54:	010ad713          	srli	a4,s5,0x10
8000ce58:	00e96733          	or	a4,s2,a4
8000ce5c:	00048a13          	mv	s4,s1
8000ce60:	00a77e63          	bgeu	a4,a0,8000ce7c <__udivdi3+0x360>
8000ce64:	00870733          	add	a4,a4,s0
8000ce68:	fff48a13          	addi	s4,s1,-1
8000ce6c:	00876863          	bltu	a4,s0,8000ce7c <__udivdi3+0x360>
8000ce70:	00a77663          	bgeu	a4,a0,8000ce7c <__udivdi3+0x360>
8000ce74:	ffe48a13          	addi	s4,s1,-2
8000ce78:	00870733          	add	a4,a4,s0
8000ce7c:	40a704b3          	sub	s1,a4,a0
8000ce80:	000b0593          	mv	a1,s6
8000ce84:	00048513          	mv	a0,s1
8000ce88:	2dc000ef          	jal	ra,8000d164 <__umodsi3>
8000ce8c:	00050913          	mv	s2,a0
8000ce90:	000b0593          	mv	a1,s6
8000ce94:	00048513          	mv	a0,s1
8000ce98:	284000ef          	jal	ra,8000d11c <__udivsi3>
8000ce9c:	00050493          	mv	s1,a0
8000cea0:	00050593          	mv	a1,a0
8000cea4:	000b8513          	mv	a0,s7
8000cea8:	248000ef          	jal	ra,8000d0f0 <__mulsi3>
8000ceac:	010a9693          	slli	a3,s5,0x10
8000ceb0:	01091913          	slli	s2,s2,0x10
8000ceb4:	0106d693          	srli	a3,a3,0x10
8000ceb8:	00d967b3          	or	a5,s2,a3
8000cebc:	00048713          	mv	a4,s1
8000cec0:	00a7fe63          	bgeu	a5,a0,8000cedc <__udivdi3+0x3c0>
8000cec4:	008787b3          	add	a5,a5,s0
8000cec8:	fff48713          	addi	a4,s1,-1
8000cecc:	0087e863          	bltu	a5,s0,8000cedc <__udivdi3+0x3c0>
8000ced0:	00a7f663          	bgeu	a5,a0,8000cedc <__udivdi3+0x3c0>
8000ced4:	ffe48713          	addi	a4,s1,-2
8000ced8:	008787b3          	add	a5,a5,s0
8000cedc:	010a1a13          	slli	s4,s4,0x10
8000cee0:	40a784b3          	sub	s1,a5,a0
8000cee4:	00ea6a33          	or	s4,s4,a4
8000cee8:	e01ff06f          	j	8000cce8 <__udivdi3+0x1cc>
8000ceec:	1ed5ec63          	bltu	a1,a3,8000d0e4 <__udivdi3+0x5c8>
8000cef0:	000107b7          	lui	a5,0x10
8000cef4:	04f6f463          	bgeu	a3,a5,8000cf3c <__udivdi3+0x420>
8000cef8:	0ff00593          	li	a1,255
8000cefc:	00d5b533          	sltu	a0,a1,a3
8000cf00:	00351513          	slli	a0,a0,0x3
8000cf04:	00a6d733          	srl	a4,a3,a0
8000cf08:	ffff6797          	auipc	a5,0xffff6
8000cf0c:	f0878793          	addi	a5,a5,-248 # 80002e10 <__clz_tab>
8000cf10:	00e787b3          	add	a5,a5,a4
8000cf14:	0007c583          	lbu	a1,0(a5)
8000cf18:	02000a13          	li	s4,32
8000cf1c:	00a585b3          	add	a1,a1,a0
8000cf20:	40ba0a33          	sub	s4,s4,a1
8000cf24:	020a1663          	bnez	s4,8000cf50 <__udivdi3+0x434>
8000cf28:	00100793          	li	a5,1
8000cf2c:	e896e2e3          	bltu	a3,s1,8000cdb0 <__udivdi3+0x294>
8000cf30:	00cb3633          	sltu	a2,s6,a2
8000cf34:	00164793          	xori	a5,a2,1
8000cf38:	e79ff06f          	j	8000cdb0 <__udivdi3+0x294>
8000cf3c:	010007b7          	lui	a5,0x1000
8000cf40:	01000513          	li	a0,16
8000cf44:	fcf6e0e3          	bltu	a3,a5,8000cf04 <__udivdi3+0x3e8>
8000cf48:	01800513          	li	a0,24
8000cf4c:	fb9ff06f          	j	8000cf04 <__udivdi3+0x3e8>
8000cf50:	00b65ab3          	srl	s5,a2,a1
8000cf54:	014696b3          	sll	a3,a3,s4
8000cf58:	00daeab3          	or	s5,s5,a3
8000cf5c:	00b4d933          	srl	s2,s1,a1
8000cf60:	014497b3          	sll	a5,s1,s4
8000cf64:	00bb55b3          	srl	a1,s6,a1
8000cf68:	010adb93          	srli	s7,s5,0x10
8000cf6c:	00f5e4b3          	or	s1,a1,a5
8000cf70:	00090513          	mv	a0,s2
8000cf74:	000b8593          	mv	a1,s7
8000cf78:	014619b3          	sll	s3,a2,s4
8000cf7c:	1e8000ef          	jal	ra,8000d164 <__umodsi3>
8000cf80:	00050413          	mv	s0,a0
8000cf84:	000b8593          	mv	a1,s7
8000cf88:	00090513          	mv	a0,s2
8000cf8c:	010a9c13          	slli	s8,s5,0x10
8000cf90:	18c000ef          	jal	ra,8000d11c <__udivsi3>
8000cf94:	010c5c13          	srli	s8,s8,0x10
8000cf98:	00050913          	mv	s2,a0
8000cf9c:	00050593          	mv	a1,a0
8000cfa0:	000c0513          	mv	a0,s8
8000cfa4:	14c000ef          	jal	ra,8000d0f0 <__mulsi3>
8000cfa8:	01041413          	slli	s0,s0,0x10
8000cfac:	0104d713          	srli	a4,s1,0x10
8000cfb0:	00e46733          	or	a4,s0,a4
8000cfb4:	00090c93          	mv	s9,s2
8000cfb8:	00a77e63          	bgeu	a4,a0,8000cfd4 <__udivdi3+0x4b8>
8000cfbc:	01570733          	add	a4,a4,s5
8000cfc0:	fff90c93          	addi	s9,s2,-1
8000cfc4:	01576863          	bltu	a4,s5,8000cfd4 <__udivdi3+0x4b8>
8000cfc8:	00a77663          	bgeu	a4,a0,8000cfd4 <__udivdi3+0x4b8>
8000cfcc:	ffe90c93          	addi	s9,s2,-2
8000cfd0:	01570733          	add	a4,a4,s5
8000cfd4:	40a70933          	sub	s2,a4,a0
8000cfd8:	000b8593          	mv	a1,s7
8000cfdc:	00090513          	mv	a0,s2
8000cfe0:	184000ef          	jal	ra,8000d164 <__umodsi3>
8000cfe4:	00050413          	mv	s0,a0
8000cfe8:	000b8593          	mv	a1,s7
8000cfec:	00090513          	mv	a0,s2
8000cff0:	12c000ef          	jal	ra,8000d11c <__udivsi3>
8000cff4:	00050913          	mv	s2,a0
8000cff8:	00050593          	mv	a1,a0
8000cffc:	000c0513          	mv	a0,s8
8000d000:	0f0000ef          	jal	ra,8000d0f0 <__mulsi3>
8000d004:	01049793          	slli	a5,s1,0x10
8000d008:	01041413          	slli	s0,s0,0x10
8000d00c:	0107d793          	srli	a5,a5,0x10
8000d010:	00f46733          	or	a4,s0,a5
8000d014:	00090613          	mv	a2,s2
8000d018:	00a77e63          	bgeu	a4,a0,8000d034 <__udivdi3+0x518>
8000d01c:	01570733          	add	a4,a4,s5
8000d020:	fff90613          	addi	a2,s2,-1
8000d024:	01576863          	bltu	a4,s5,8000d034 <__udivdi3+0x518>
8000d028:	00a77663          	bgeu	a4,a0,8000d034 <__udivdi3+0x518>
8000d02c:	ffe90613          	addi	a2,s2,-2
8000d030:	01570733          	add	a4,a4,s5
8000d034:	010c9793          	slli	a5,s9,0x10
8000d038:	00010e37          	lui	t3,0x10
8000d03c:	00c7e7b3          	or	a5,a5,a2
8000d040:	fffe0813          	addi	a6,t3,-1 # ffff <_stack_size+0xf7ff>
8000d044:	0107f333          	and	t1,a5,a6
8000d048:	0109f833          	and	a6,s3,a6
8000d04c:	40a70733          	sub	a4,a4,a0
8000d050:	0107de93          	srli	t4,a5,0x10
8000d054:	0109d993          	srli	s3,s3,0x10
8000d058:	00030513          	mv	a0,t1
8000d05c:	00080593          	mv	a1,a6
8000d060:	090000ef          	jal	ra,8000d0f0 <__mulsi3>
8000d064:	00050893          	mv	a7,a0
8000d068:	00098593          	mv	a1,s3
8000d06c:	00030513          	mv	a0,t1
8000d070:	080000ef          	jal	ra,8000d0f0 <__mulsi3>
8000d074:	00050313          	mv	t1,a0
8000d078:	00080593          	mv	a1,a6
8000d07c:	000e8513          	mv	a0,t4
8000d080:	070000ef          	jal	ra,8000d0f0 <__mulsi3>
8000d084:	00050813          	mv	a6,a0
8000d088:	00098593          	mv	a1,s3
8000d08c:	000e8513          	mv	a0,t4
8000d090:	060000ef          	jal	ra,8000d0f0 <__mulsi3>
8000d094:	0108d693          	srli	a3,a7,0x10
8000d098:	01030333          	add	t1,t1,a6
8000d09c:	006686b3          	add	a3,a3,t1
8000d0a0:	0106f463          	bgeu	a3,a6,8000d0a8 <__udivdi3+0x58c>
8000d0a4:	01c50533          	add	a0,a0,t3
8000d0a8:	0106d613          	srli	a2,a3,0x10
8000d0ac:	00a60533          	add	a0,a2,a0
8000d0b0:	02a76663          	bltu	a4,a0,8000d0dc <__udivdi3+0x5c0>
8000d0b4:	bca714e3          	bne	a4,a0,8000cc7c <__udivdi3+0x160>
8000d0b8:	00010737          	lui	a4,0x10
8000d0bc:	fff70713          	addi	a4,a4,-1 # ffff <_stack_size+0xf7ff>
8000d0c0:	00e6f6b3          	and	a3,a3,a4
8000d0c4:	01069693          	slli	a3,a3,0x10
8000d0c8:	00e8f8b3          	and	a7,a7,a4
8000d0cc:	014b1633          	sll	a2,s6,s4
8000d0d0:	011686b3          	add	a3,a3,a7
8000d0d4:	00000a13          	li	s4,0
8000d0d8:	ccd67ce3          	bgeu	a2,a3,8000cdb0 <__udivdi3+0x294>
8000d0dc:	fff78793          	addi	a5,a5,-1 # ffffff <_stack_size+0xfff7ff>
8000d0e0:	b9dff06f          	j	8000cc7c <__udivdi3+0x160>
8000d0e4:	00000a13          	li	s4,0
8000d0e8:	00000793          	li	a5,0
8000d0ec:	cc5ff06f          	j	8000cdb0 <__udivdi3+0x294>

8000d0f0 <__mulsi3>:
8000d0f0:	00050613          	mv	a2,a0
8000d0f4:	00000513          	li	a0,0
8000d0f8:	0015f693          	andi	a3,a1,1
8000d0fc:	00068463          	beqz	a3,8000d104 <__mulsi3+0x14>
8000d100:	00c50533          	add	a0,a0,a2
8000d104:	0015d593          	srli	a1,a1,0x1
8000d108:	00161613          	slli	a2,a2,0x1
8000d10c:	fe0596e3          	bnez	a1,8000d0f8 <__mulsi3+0x8>
8000d110:	00008067          	ret

8000d114 <__divsi3>:
8000d114:	06054063          	bltz	a0,8000d174 <__umodsi3+0x10>
8000d118:	0605c663          	bltz	a1,8000d184 <__umodsi3+0x20>

8000d11c <__udivsi3>:
8000d11c:	00058613          	mv	a2,a1
8000d120:	00050593          	mv	a1,a0
8000d124:	fff00513          	li	a0,-1
8000d128:	02060c63          	beqz	a2,8000d160 <__udivsi3+0x44>
8000d12c:	00100693          	li	a3,1
8000d130:	00b67a63          	bgeu	a2,a1,8000d144 <__udivsi3+0x28>
8000d134:	00c05863          	blez	a2,8000d144 <__udivsi3+0x28>
8000d138:	00161613          	slli	a2,a2,0x1
8000d13c:	00169693          	slli	a3,a3,0x1
8000d140:	feb66ae3          	bltu	a2,a1,8000d134 <__udivsi3+0x18>
8000d144:	00000513          	li	a0,0
8000d148:	00c5e663          	bltu	a1,a2,8000d154 <__udivsi3+0x38>
8000d14c:	40c585b3          	sub	a1,a1,a2
8000d150:	00d56533          	or	a0,a0,a3
8000d154:	0016d693          	srli	a3,a3,0x1
8000d158:	00165613          	srli	a2,a2,0x1
8000d15c:	fe0696e3          	bnez	a3,8000d148 <__udivsi3+0x2c>
8000d160:	00008067          	ret

8000d164 <__umodsi3>:
8000d164:	00008293          	mv	t0,ra
8000d168:	fb5ff0ef          	jal	ra,8000d11c <__udivsi3>
8000d16c:	00058513          	mv	a0,a1
8000d170:	00028067          	jr	t0 # 8000cac0 <memset+0xb4>
8000d174:	40a00533          	neg	a0,a0
8000d178:	0005d863          	bgez	a1,8000d188 <__umodsi3+0x24>
8000d17c:	40b005b3          	neg	a1,a1
8000d180:	f9dff06f          	j	8000d11c <__udivsi3>
8000d184:	40b005b3          	neg	a1,a1
8000d188:	00008293          	mv	t0,ra
8000d18c:	f91ff0ef          	jal	ra,8000d11c <__udivsi3>
8000d190:	40a00533          	neg	a0,a0
8000d194:	00028067          	jr	t0

8000d198 <__modsi3>:
8000d198:	00008293          	mv	t0,ra
8000d19c:	0005ca63          	bltz	a1,8000d1b0 <__modsi3+0x18>
8000d1a0:	00054c63          	bltz	a0,8000d1b8 <__modsi3+0x20>
8000d1a4:	f79ff0ef          	jal	ra,8000d11c <__udivsi3>
8000d1a8:	00058513          	mv	a0,a1
8000d1ac:	00028067          	jr	t0
8000d1b0:	40b005b3          	neg	a1,a1
8000d1b4:	fe0558e3          	bgez	a0,8000d1a4 <__modsi3+0xc>
8000d1b8:	40a00533          	neg	a0,a0
8000d1bc:	f61ff0ef          	jal	ra,8000d11c <__udivsi3>
8000d1c0:	40b00533          	neg	a0,a1
8000d1c4:	00028067          	jr	t0

Disassembly of section .text.startup:

8000d1c8 <main>:
8000d1c8:	eb010113          	addi	sp,sp,-336
8000d1cc:	14112623          	sw	ra,332(sp)
8000d1d0:	14812423          	sw	s0,328(sp)
8000d1d4:	14912223          	sw	s1,324(sp)
8000d1d8:	15212023          	sw	s2,320(sp)
8000d1dc:	13312e23          	sw	s3,316(sp)
8000d1e0:	13412c23          	sw	s4,312(sp)
8000d1e4:	13512a23          	sw	s5,308(sp)
8000d1e8:	13612823          	sw	s6,304(sp)
8000d1ec:	13712623          	sw	s7,300(sp)
8000d1f0:	13812423          	sw	s8,296(sp)
8000d1f4:	30047073          	csrci	mstatus,8
8000d1f8:	f78f80ef          	jal	ra,80005970 <init_sbrk>
8000d1fc:	8701a783          	lw	a5,-1936(gp) # 80003010 <deadbeef>
8000d200:	1a078663          	beqz	a5,8000d3ac <main+0x1e4>
8000d204:	80002537          	lui	a0,0x80002
8000d208:	f3450513          	addi	a0,a0,-204 # 80001f34 <_heap_end+0xfffeff34>
8000d20c:	fbcf80ef          	jal	ra,800059c8 <print_uart0>
8000d210:	8f5f80ef          	jal	ra,80005b04 <hard_reboot>
8000d214:	8c01a583          	lw	a1,-1856(gp) # 80003060 <sbrk_heap_end>
8000d218:	02010513          	addi	a0,sp,32
8000d21c:	80002437          	lui	s0,0x80002
8000d220:	af0f60ef          	jal	ra,80003510 <to_hex>
8000d224:	80002537          	lui	a0,0x80002
8000d228:	f5c50513          	addi	a0,a0,-164 # 80001f5c <_heap_end+0xfffeff5c>
8000d22c:	f9cf80ef          	jal	ra,800059c8 <print_uart0>
8000d230:	02010513          	addi	a0,sp,32
8000d234:	f94f80ef          	jal	ra,800059c8 <print_uart0>
8000d238:	77040513          	addi	a0,s0,1904 # 80002770 <_heap_end+0xffff0770>
8000d23c:	f8cf80ef          	jal	ra,800059c8 <print_uart0>
8000d240:	80002537          	lui	a0,0x80002
8000d244:	00800593          	li	a1,8
8000d248:	f6c50513          	addi	a0,a0,-148 # 80001f6c <_heap_end+0xfffeff6c>
8000d24c:	030010ef          	jal	ra,8000e27c <iprintf>
8000d250:	f00004b7          	lui	s1,0xf0000
8000d254:	0044a783          	lw	a5,4(s1) # f0000004 <_heap_end+0x6ffee004>
8000d258:	80002537          	lui	a0,0x80002
8000d25c:	00050513          	mv	a0,a0
8000d260:	0027e793          	ori	a5,a5,2
8000d264:	00f4a223          	sw	a5,4(s1)
8000d268:	014010ef          	jal	ra,8000e27c <iprintf>
8000d26c:	f00547b7          	lui	a5,0xf0054
8000d270:	0007a023          	sw	zero,0(a5) # f0054000 <_heap_end+0x70042000>
8000d274:	0044a783          	lw	a5,4(s1)
8000d278:	03f00713          	li	a4,63
8000d27c:	01900613          	li	a2,25
8000d280:	ff77f793          	andi	a5,a5,-9
8000d284:	00f4a223          	sw	a5,4(s1)
8000d288:	f00607b7          	lui	a5,0xf0060
8000d28c:	00e7a623          	sw	a4,12(a5) # f006000c <_heap_end+0x7004e00c>
8000d290:	0007a223          	sw	zero,4(a5)
8000d294:	fff00713          	li	a4,-1
8000d298:	00e7a023          	sw	a4,0(a5)
8000d29c:	f0010737          	lui	a4,0xf0010
8000d2a0:	00472783          	lw	a5,4(a4) # f0010004 <_heap_end+0x6fffe004>
8000d2a4:	00100693          	li	a3,1
8000d2a8:	f0090537          	lui	a0,0xf0090
8000d2ac:	0027e793          	ori	a5,a5,2
8000d2b0:	00f72223          	sw	a5,4(a4)
8000d2b4:	f0011737          	lui	a4,0xf0011
8000d2b8:	00472783          	lw	a5,4(a4) # f0011004 <_heap_end+0x6ffff004>
8000d2bc:	0027e793          	ori	a5,a5,2
8000d2c0:	00f72223          	sw	a5,4(a4)
8000d2c4:	f00207b7          	lui	a5,0xf0020
8000d2c8:	0007a023          	sw	zero,0(a5) # f0020000 <_heap_end+0x7000e000>
8000d2cc:	00c7a223          	sw	a2,4(a5)
8000d2d0:	0007a423          	sw	zero,8(a5)
8000d2d4:	00018737          	lui	a4,0x18
8000d2d8:	0007a623          	sw	zero,12(a5)
8000d2dc:	6a070713          	addi	a4,a4,1696 # 186a0 <_stack_size+0x17ea0>
8000d2e0:	00e7a823          	sw	a4,16(a5)
8000d2e4:	00d7a023          	sw	a3,0(a5)
8000d2e8:	f00217b7          	lui	a5,0xf0021
8000d2ec:	0007a023          	sw	zero,0(a5) # f0021000 <_heap_end+0x7000f000>
8000d2f0:	00c7a223          	sw	a2,4(a5)
8000d2f4:	0007a423          	sw	zero,8(a5)
8000d2f8:	0000c737          	lui	a4,0xc
8000d2fc:	0007a623          	sw	zero,12(a5)
8000d300:	35070713          	addi	a4,a4,848 # c350 <_stack_size+0xbb50>
8000d304:	00e7a823          	sw	a4,16(a5)
8000d308:	00d7a023          	sw	a3,0(a5)
8000d30c:	df8f80ef          	jal	ra,80005904 <i2c_init>
8000d310:	30046073          	csrsi	mstatus,8
8000d314:	0007a937          	lui	s2,0x7a
8000d318:	00a00493          	li	s1,10
8000d31c:	00200b93          	li	s7,2
8000d320:	000a8993          	mv	s3,s5
8000d324:	f0000c37          	lui	s8,0xf0000
8000d328:	f0010a37          	lui	s4,0xf0010
8000d32c:	02e00b13          	li	s6,46
8000d330:	12090913          	addi	s2,s2,288 # 7a120 <_stack_size+0x79920>
8000d334:	87c1a783          	lw	a5,-1924(gp) # 8000301c <uart_config_reset_counter>
8000d338:	02fbe863          	bltu	s7,a5,8000d368 <main+0x1a0>
8000d33c:	000c2783          	lw	a5,0(s8) # f0000000 <_heap_end+0x6ffee000>
8000d340:	0207d463          	bgez	a5,8000d368 <main+0x1a0>
8000d344:	004a2783          	lw	a5,4(s4) # f0010004 <_heap_end+0x6fffe004>
8000d348:	0107d793          	srli	a5,a5,0x10
8000d34c:	0ff7f793          	andi	a5,a5,255
8000d350:	fe078ae3          	beqz	a5,8000d344 <main+0x17c>
8000d354:	016a2023          	sw	s6,0(s4)
8000d358:	00090513          	mv	a0,s2
8000d35c:	fff48493          	addi	s1,s1,-1
8000d360:	e38f80ef          	jal	ra,80005998 <delay_us>
8000d364:	fc0498e3          	bnez	s1,8000d334 <main+0x16c>
8000d368:	77040513          	addi	a0,s0,1904
8000d36c:	711000ef          	jal	ra,8000e27c <iprintf>
8000d370:	800034b7          	lui	s1,0x80003
8000d374:	02000613          	li	a2,32
8000d378:	f1048593          	addi	a1,s1,-240 # 80002f10 <_heap_end+0xffff0f10>
8000d37c:	97c18513          	addi	a0,gp,-1668 # 8000311c <active_config>
8000d380:	2bd000ef          	jal	ra,8000de3c <memcpy>
8000d384:	87c1a703          	lw	a4,-1924(gp) # 8000301c <uart_config_reset_counter>
8000d388:	00200793          	li	a5,2
8000d38c:	02e7f863          	bgeu	a5,a4,8000d3bc <main+0x1f4>
8000d390:	800025b7          	lui	a1,0x80002
8000d394:	8601ae23          	sw	zero,-1924(gp) # 8000301c <uart_config_reset_counter>
8000d398:	01458593          	addi	a1,a1,20 # 80002014 <_heap_end+0xffff0014>
8000d39c:	80002537          	lui	a0,0x80002
8000d3a0:	02450513          	addi	a0,a0,36 # 80002024 <_heap_end+0xffff0024>
8000d3a4:	6d9000ef          	jal	ra,8000e27c <iprintf>
8000d3a8:	0500006f          	j	8000d3f8 <main+0x230>
8000d3ac:	deadc7b7          	lui	a5,0xdeadc
8000d3b0:	eef78793          	addi	a5,a5,-273 # deadbeef <_heap_end+0x5eac9eef>
8000d3b4:	86f1a823          	sw	a5,-1936(gp) # 80003010 <deadbeef>
8000d3b8:	e5dff06f          	j	8000d214 <main+0x4c>
8000d3bc:	f00007b7          	lui	a5,0xf0000
8000d3c0:	0007a783          	lw	a5,0(a5) # f0000000 <_heap_end+0x6ffee000>
8000d3c4:	0007c863          	bltz	a5,8000d3d4 <main+0x20c>
8000d3c8:	800025b7          	lui	a1,0x80002
8000d3cc:	04858593          	addi	a1,a1,72 # 80002048 <_heap_end+0xffff0048>
8000d3d0:	fcdff06f          	j	8000d39c <main+0x1d4>
8000d3d4:	f0090537          	lui	a0,0xf0090
8000d3d8:	ce1f60ef          	jal	ra,800040b8 <eeprom_probe>
8000d3dc:	2c051a63          	bnez	a0,8000d6b0 <main+0x4e8>
8000d3e0:	97c18513          	addi	a0,gp,-1668 # 8000311c <active_config>
8000d3e4:	e6cf60ef          	jal	ra,80003a50 <config_load>
8000d3e8:	2a051663          	bnez	a0,8000d694 <main+0x4cc>
8000d3ec:	80002537          	lui	a0,0x80002
8000d3f0:	05450513          	addi	a0,a0,84 # 80002054 <_heap_end+0xffff0054>
8000d3f4:	689000ef          	jal	ra,8000e27c <iprintf>
8000d3f8:	30047073          	csrci	mstatus,8
8000d3fc:	97c18413          	addi	s0,gp,-1668 # 8000311c <active_config>
8000d400:	01344503          	lbu	a0,19(s0)
8000d404:	d21f70ef          	jal	ra,80005124 <hub_init>
8000d408:	8bdf70ef          	jal	ra,80004cc4 <mac_lwip_init>
8000d40c:	a28f80ef          	jal	ra,80005634 <modbus_udp_init>
8000d410:	bf0f60ef          	jal	ra,80003800 <modbus_rtu_init>
8000d414:	80002537          	lui	a0,0x80002
8000d418:	09850513          	addi	a0,a0,152 # 80002098 <_heap_end+0xffff0098>
8000d41c:	661000ef          	jal	ra,8000e27c <iprintf>
8000d420:	f0000737          	lui	a4,0xf0000
8000d424:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
8000d428:	ff87f793          	andi	a5,a5,-8
8000d42c:	00f72223          	sw	a5,4(a4)
8000d430:	30046073          	csrsi	mstatus,8
8000d434:	800004b7          	lui	s1,0x80000
8000d438:	800026b7          	lui	a3,0x80002
8000d43c:	13448793          	addi	a5,s1,308 # 80000134 <_heap_end+0xfffee134>
8000d440:	00800893          	li	a7,8
8000d444:	00600813          	li	a6,6
8000d448:	00500713          	li	a4,5
8000d44c:	0b068693          	addi	a3,a3,176 # 800020b0 <_heap_end+0xffff00b0>
8000d450:	03f00613          	li	a2,63
8000d454:	00000593          	li	a1,0
8000d458:	00600513          	li	a0,6
8000d45c:	8f4f80ef          	jal	ra,80005550 <hub_print>
8000d460:	01444603          	lbu	a2,20(s0)
8000d464:	800025b7          	lui	a1,0x80002
8000d468:	0b858593          	addi	a1,a1,184 # 800020b8 <_heap_end+0xffff00b8>
8000d46c:	00010513          	mv	a0,sp
8000d470:	094010ef          	jal	ra,8000e504 <siprintf>
8000d474:	13448793          	addi	a5,s1,308
8000d478:	00050713          	mv	a4,a0
8000d47c:	00800893          	li	a7,8
8000d480:	00600813          	li	a6,6
8000d484:	00010693          	mv	a3,sp
8000d488:	03f00613          	li	a2,63
8000d48c:	00800593          	li	a1,8
8000d490:	00000513          	li	a0,0
8000d494:	8bcf80ef          	jal	ra,80005550 <hub_print>
8000d498:	001e8937          	lui	s2,0x1e8
8000d49c:	48090513          	addi	a0,s2,1152 # 1e8480 <_stack_size+0x1e7c80>
8000d4a0:	8dcf60ef          	jal	ra,8000357c <process_and_wait>
8000d4a4:	800026b7          	lui	a3,0x80002
8000d4a8:	13448793          	addi	a5,s1,308
8000d4ac:	00800893          	li	a7,8
8000d4b0:	00600813          	li	a6,6
8000d4b4:	00500713          	li	a4,5
8000d4b8:	0bc68693          	addi	a3,a3,188 # 800020bc <_heap_end+0xffff00bc>
8000d4bc:	03f00613          	li	a2,63
8000d4c0:	00000593          	li	a1,0
8000d4c4:	00600513          	li	a0,6
8000d4c8:	888f80ef          	jal	ra,80005550 <hub_print>
8000d4cc:	99c18413          	addi	s0,gp,-1636 # 8000313c <default_netif>
8000d4d0:	00444603          	lbu	a2,4(s0)
8000d4d4:	800029b7          	lui	s3,0x80002
8000d4d8:	0c498593          	addi	a1,s3,196 # 800020c4 <_heap_end+0xffff00c4>
8000d4dc:	00010513          	mv	a0,sp
8000d4e0:	024010ef          	jal	ra,8000e504 <siprintf>
8000d4e4:	13448793          	addi	a5,s1,308
8000d4e8:	00050713          	mv	a4,a0
8000d4ec:	00800893          	li	a7,8
8000d4f0:	00600813          	li	a6,6
8000d4f4:	00010693          	mv	a3,sp
8000d4f8:	03f00613          	li	a2,63
8000d4fc:	00800593          	li	a1,8
8000d500:	00000513          	li	a0,0
8000d504:	84cf80ef          	jal	ra,80005550 <hub_print>
8000d508:	48090513          	addi	a0,s2,1152
8000d50c:	870f60ef          	jal	ra,8000357c <process_and_wait>
8000d510:	00544603          	lbu	a2,5(s0)
8000d514:	0c498593          	addi	a1,s3,196
8000d518:	00010513          	mv	a0,sp
8000d51c:	7e9000ef          	jal	ra,8000e504 <siprintf>
8000d520:	13448793          	addi	a5,s1,308
8000d524:	00050713          	mv	a4,a0
8000d528:	00800893          	li	a7,8
8000d52c:	00600813          	li	a6,6
8000d530:	00010693          	mv	a3,sp
8000d534:	03f00613          	li	a2,63
8000d538:	00800593          	li	a1,8
8000d53c:	00000513          	li	a0,0
8000d540:	810f80ef          	jal	ra,80005550 <hub_print>
8000d544:	48090513          	addi	a0,s2,1152
8000d548:	834f60ef          	jal	ra,8000357c <process_and_wait>
8000d54c:	00644603          	lbu	a2,6(s0)
8000d550:	0c498593          	addi	a1,s3,196
8000d554:	00010513          	mv	a0,sp
8000d558:	7ad000ef          	jal	ra,8000e504 <siprintf>
8000d55c:	13448793          	addi	a5,s1,308
8000d560:	00050713          	mv	a4,a0
8000d564:	00800893          	li	a7,8
8000d568:	00600813          	li	a6,6
8000d56c:	00010693          	mv	a3,sp
8000d570:	03f00613          	li	a2,63
8000d574:	00800593          	li	a1,8
8000d578:	00000513          	li	a0,0
8000d57c:	fd5f70ef          	jal	ra,80005550 <hub_print>
8000d580:	48090513          	addi	a0,s2,1152
8000d584:	ff9f50ef          	jal	ra,8000357c <process_and_wait>
8000d588:	00744603          	lbu	a2,7(s0)
8000d58c:	0c498593          	addi	a1,s3,196
8000d590:	00010513          	mv	a0,sp
8000d594:	771000ef          	jal	ra,8000e504 <siprintf>
8000d598:	13448793          	addi	a5,s1,308
8000d59c:	00050713          	mv	a4,a0
8000d5a0:	00800893          	li	a7,8
8000d5a4:	00600813          	li	a6,6
8000d5a8:	00010693          	mv	a3,sp
8000d5ac:	03f00613          	li	a2,63
8000d5b0:	00800593          	li	a1,8
8000d5b4:	00000513          	li	a0,0
8000d5b8:	f99f70ef          	jal	ra,80005550 <hub_print>
8000d5bc:	48090513          	addi	a0,s2,1152
8000d5c0:	fbdf50ef          	jal	ra,8000357c <process_and_wait>
8000d5c4:	8b81a603          	lw	a2,-1864(gp) # 80003058 <hub_frame_size>
8000d5c8:	00000593          	li	a1,0
8000d5cc:	f0050537          	lui	a0,0xf0050
8000d5d0:	0007a4b7          	lui	s1,0x7a
8000d5d4:	c38ff0ef          	jal	ra,8000ca0c <memset>
8000d5d8:	12048493          	addi	s1,s1,288 # 7a120 <_stack_size+0x79920>
8000d5dc:	80002ab7          	lui	s5,0x80002
8000d5e0:	80002b37          	lui	s6,0x80002
8000d5e4:	f0000937          	lui	s2,0xf0000
8000d5e8:	00492783          	lw	a5,4(s2) # f0000004 <_heap_end+0x6ffee004>
8000d5ec:	00048513          	mv	a0,s1
8000d5f0:	0017e793          	ori	a5,a5,1
8000d5f4:	00f92223          	sw	a5,4(s2)
8000d5f8:	f85f50ef          	jal	ra,8000357c <process_and_wait>
8000d5fc:	00492783          	lw	a5,4(s2)
8000d600:	00048513          	mv	a0,s1
8000d604:	ffe7f793          	andi	a5,a5,-2
8000d608:	00f92223          	sw	a5,4(s2)
8000d60c:	f71f50ef          	jal	ra,8000357c <process_and_wait>
8000d610:	30047073          	csrci	mstatus,8
8000d614:	f00547b7          	lui	a5,0xf0054
8000d618:	0007a583          	lw	a1,0(a5) # f0054000 <_heap_end+0x70042000>
8000d61c:	8b81a603          	lw	a2,-1864(gp) # 80003058 <hub_frame_size>
8000d620:	88c1a683          	lw	a3,-1908(gp) # 8000302c <reg_irq_counter>
8000d624:	8881a703          	lw	a4,-1912(gp) # 80003028 <reg_sys_counter>
8000d628:	8841a783          	lw	a5,-1916(gp) # 80003024 <reg_scratch>
8000d62c:	07f5f593          	andi	a1,a1,127
8000d630:	0cca8513          	addi	a0,s5,204 # 800020cc <_heap_end+0xffff00cc>
8000d634:	449000ef          	jal	ra,8000e27c <iprintf>
8000d638:	f00607b7          	lui	a5,0xf0060
8000d63c:	0007a583          	lw	a1,0(a5) # f0060000 <_heap_end+0x7004e000>
8000d640:	0047a603          	lw	a2,4(a5)
8000d644:	00c7a683          	lw	a3,12(a5)
8000d648:	0087a703          	lw	a4,8(a5)
8000d64c:	0107a783          	lw	a5,16(a5)
8000d650:	138b0513          	addi	a0,s6,312 # 80002138 <_heap_end+0xffff0138>
8000d654:	429000ef          	jal	ra,8000e27c <iprintf>
8000d658:	a89f70ef          	jal	ra,800050e0 <mac_print_stats>
8000d65c:	30046073          	csrsi	mstatus,8
8000d660:	8881a783          	lw	a5,-1912(gp) # 80003028 <reg_sys_counter>
8000d664:	00178793          	addi	a5,a5,1
8000d668:	88f1a423          	sw	a5,-1912(gp) # 80003028 <reg_sys_counter>
8000d66c:	8801a783          	lw	a5,-1920(gp) # 80003020 <reg_config_write>
8000d670:	00078863          	beqz	a5,8000d680 <main+0x4b8>
8000d674:	8801a783          	lw	a5,-1920(gp) # 80003020 <reg_config_write>
8000d678:	fff78793          	addi	a5,a5,-1
8000d67c:	88f1a023          	sw	a5,-1920(gp) # 80003020 <reg_config_write>
8000d680:	f0000737          	lui	a4,0xf0000
8000d684:	00472783          	lw	a5,4(a4) # f0000004 <_heap_end+0x6ffee004>
8000d688:	ffd7f793          	andi	a5,a5,-3
8000d68c:	00f72223          	sw	a5,4(a4)
8000d690:	f55ff06f          	j	8000d5e4 <main+0x41c>
8000d694:	f1048593          	addi	a1,s1,-240
8000d698:	02000613          	li	a2,32
8000d69c:	97c18513          	addi	a0,gp,-1668 # 8000311c <active_config>
8000d6a0:	79c000ef          	jal	ra,8000de3c <memcpy>
8000d6a4:	800025b7          	lui	a1,0x80002
8000d6a8:	07058593          	addi	a1,a1,112 # 80002070 <_heap_end+0xffff0070>
8000d6ac:	cf1ff06f          	j	8000d39c <main+0x1d4>
8000d6b0:	800025b7          	lui	a1,0x80002
8000d6b4:	08458593          	addi	a1,a1,132 # 80002084 <_heap_end+0xffff0084>
8000d6b8:	ce5ff06f          	j	8000d39c <main+0x1d4>

Disassembly of section .text.atoi:

8000d6bc <atoi>:
8000d6bc:	00a00613          	li	a2,10
8000d6c0:	00000593          	li	a1,0
8000d6c4:	2700106f          	j	8000e934 <strtol>

Disassembly of section .text._atoi_r:

8000d6c8 <_atoi_r>:
8000d6c8:	00a00693          	li	a3,10
8000d6cc:	00000613          	li	a2,0
8000d6d0:	2480106f          	j	8000e918 <_strtol_r>

Disassembly of section .text.calloc:

8000d6d4 <calloc>:
8000d6d4:	80c18793          	addi	a5,gp,-2036 # 80002fac <_impure_ptr>
8000d6d8:	00058613          	mv	a2,a1
8000d6dc:	00050593          	mv	a1,a0
8000d6e0:	0007a503          	lw	a0,0(a5)
8000d6e4:	08d0006f          	j	8000df70 <_calloc_r>

Disassembly of section .text.__sflush_r:

8000d6e8 <__sflush_r>:
8000d6e8:	00c5d783          	lhu	a5,12(a1)
8000d6ec:	fe010113          	addi	sp,sp,-32
8000d6f0:	00812c23          	sw	s0,24(sp)
8000d6f4:	00912a23          	sw	s1,20(sp)
8000d6f8:	00112e23          	sw	ra,28(sp)
8000d6fc:	01212823          	sw	s2,16(sp)
8000d700:	01312623          	sw	s3,12(sp)
8000d704:	0087f713          	andi	a4,a5,8
8000d708:	00050493          	mv	s1,a0
8000d70c:	00058413          	mv	s0,a1
8000d710:	14071e63          	bnez	a4,8000d86c <__sflush_r+0x184>
8000d714:	0045a703          	lw	a4,4(a1)
8000d718:	00e04a63          	bgtz	a4,8000d72c <__sflush_r+0x44>
8000d71c:	0405a703          	lw	a4,64(a1)
8000d720:	00e04663          	bgtz	a4,8000d72c <__sflush_r+0x44>
8000d724:	00000513          	li	a0,0
8000d728:	11c0006f          	j	8000d844 <__sflush_r+0x15c>
8000d72c:	02c42703          	lw	a4,44(s0)
8000d730:	fe070ae3          	beqz	a4,8000d724 <__sflush_r+0x3c>
8000d734:	0004a903          	lw	s2,0(s1)
8000d738:	01379693          	slli	a3,a5,0x13
8000d73c:	0004a023          	sw	zero,0(s1)
8000d740:	0a06de63          	bgez	a3,8000d7fc <__sflush_r+0x114>
8000d744:	05442503          	lw	a0,84(s0)
8000d748:	00c45783          	lhu	a5,12(s0)
8000d74c:	0047f793          	andi	a5,a5,4
8000d750:	00078e63          	beqz	a5,8000d76c <__sflush_r+0x84>
8000d754:	00442783          	lw	a5,4(s0)
8000d758:	40f50533          	sub	a0,a0,a5
8000d75c:	03442783          	lw	a5,52(s0)
8000d760:	00078663          	beqz	a5,8000d76c <__sflush_r+0x84>
8000d764:	04042783          	lw	a5,64(s0)
8000d768:	40f50533          	sub	a0,a0,a5
8000d76c:	02c42783          	lw	a5,44(s0)
8000d770:	02042583          	lw	a1,32(s0)
8000d774:	00050613          	mv	a2,a0
8000d778:	00000693          	li	a3,0
8000d77c:	00048513          	mv	a0,s1
8000d780:	000780e7          	jalr	a5
8000d784:	fff00793          	li	a5,-1
8000d788:	00c45703          	lhu	a4,12(s0)
8000d78c:	02f51263          	bne	a0,a5,8000d7b0 <__sflush_r+0xc8>
8000d790:	0004a683          	lw	a3,0(s1)
8000d794:	01d00793          	li	a5,29
8000d798:	0cd7e463          	bltu	a5,a3,8000d860 <__sflush_r+0x178>
8000d79c:	204007b7          	lui	a5,0x20400
8000d7a0:	00178793          	addi	a5,a5,1 # 20400001 <_stack_size+0x203ff801>
8000d7a4:	00d7d7b3          	srl	a5,a5,a3
8000d7a8:	0017f793          	andi	a5,a5,1
8000d7ac:	0a078a63          	beqz	a5,8000d860 <__sflush_r+0x178>
8000d7b0:	01042783          	lw	a5,16(s0)
8000d7b4:	00042223          	sw	zero,4(s0)
8000d7b8:	00f42023          	sw	a5,0(s0)
8000d7bc:	01371793          	slli	a5,a4,0x13
8000d7c0:	0007dc63          	bgez	a5,8000d7d8 <__sflush_r+0xf0>
8000d7c4:	fff00793          	li	a5,-1
8000d7c8:	00f51663          	bne	a0,a5,8000d7d4 <__sflush_r+0xec>
8000d7cc:	0004a783          	lw	a5,0(s1)
8000d7d0:	00079463          	bnez	a5,8000d7d8 <__sflush_r+0xf0>
8000d7d4:	04a42a23          	sw	a0,84(s0)
8000d7d8:	03442583          	lw	a1,52(s0)
8000d7dc:	0124a023          	sw	s2,0(s1)
8000d7e0:	f40582e3          	beqz	a1,8000d724 <__sflush_r+0x3c>
8000d7e4:	04440793          	addi	a5,s0,68
8000d7e8:	00f58663          	beq	a1,a5,8000d7f4 <__sflush_r+0x10c>
8000d7ec:	00048513          	mv	a0,s1
8000d7f0:	7d4000ef          	jal	ra,8000dfc4 <_free_r>
8000d7f4:	02042a23          	sw	zero,52(s0)
8000d7f8:	f2dff06f          	j	8000d724 <__sflush_r+0x3c>
8000d7fc:	02042583          	lw	a1,32(s0)
8000d800:	00100693          	li	a3,1
8000d804:	00000613          	li	a2,0
8000d808:	00048513          	mv	a0,s1
8000d80c:	000700e7          	jalr	a4
8000d810:	fff00793          	li	a5,-1
8000d814:	f2f51ae3          	bne	a0,a5,8000d748 <__sflush_r+0x60>
8000d818:	0004a783          	lw	a5,0(s1)
8000d81c:	f20786e3          	beqz	a5,8000d748 <__sflush_r+0x60>
8000d820:	01d00713          	li	a4,29
8000d824:	00e78663          	beq	a5,a4,8000d830 <__sflush_r+0x148>
8000d828:	01600713          	li	a4,22
8000d82c:	00e79663          	bne	a5,a4,8000d838 <__sflush_r+0x150>
8000d830:	0124a023          	sw	s2,0(s1)
8000d834:	ef1ff06f          	j	8000d724 <__sflush_r+0x3c>
8000d838:	00c45783          	lhu	a5,12(s0)
8000d83c:	0407e793          	ori	a5,a5,64
8000d840:	00f41623          	sh	a5,12(s0)
8000d844:	01c12083          	lw	ra,28(sp)
8000d848:	01812403          	lw	s0,24(sp)
8000d84c:	01412483          	lw	s1,20(sp)
8000d850:	01012903          	lw	s2,16(sp)
8000d854:	00c12983          	lw	s3,12(sp)
8000d858:	02010113          	addi	sp,sp,32
8000d85c:	00008067          	ret
8000d860:	04076713          	ori	a4,a4,64
8000d864:	00e41623          	sh	a4,12(s0)
8000d868:	fddff06f          	j	8000d844 <__sflush_r+0x15c>
8000d86c:	0105a983          	lw	s3,16(a1)
8000d870:	ea098ae3          	beqz	s3,8000d724 <__sflush_r+0x3c>
8000d874:	0005a903          	lw	s2,0(a1)
8000d878:	0037f793          	andi	a5,a5,3
8000d87c:	0135a023          	sw	s3,0(a1)
8000d880:	41390933          	sub	s2,s2,s3
8000d884:	00000713          	li	a4,0
8000d888:	00079463          	bnez	a5,8000d890 <__sflush_r+0x1a8>
8000d88c:	0145a703          	lw	a4,20(a1)
8000d890:	00e42423          	sw	a4,8(s0)
8000d894:	e92058e3          	blez	s2,8000d724 <__sflush_r+0x3c>
8000d898:	02842783          	lw	a5,40(s0)
8000d89c:	02042583          	lw	a1,32(s0)
8000d8a0:	00090693          	mv	a3,s2
8000d8a4:	00098613          	mv	a2,s3
8000d8a8:	00048513          	mv	a0,s1
8000d8ac:	000780e7          	jalr	a5
8000d8b0:	00a04c63          	bgtz	a0,8000d8c8 <__sflush_r+0x1e0>
8000d8b4:	00c45783          	lhu	a5,12(s0)
8000d8b8:	fff00513          	li	a0,-1
8000d8bc:	0407e793          	ori	a5,a5,64
8000d8c0:	00f41623          	sh	a5,12(s0)
8000d8c4:	f81ff06f          	j	8000d844 <__sflush_r+0x15c>
8000d8c8:	00a989b3          	add	s3,s3,a0
8000d8cc:	40a90933          	sub	s2,s2,a0
8000d8d0:	fc5ff06f          	j	8000d894 <__sflush_r+0x1ac>

Disassembly of section .text._fflush_r:

8000d8d4 <_fflush_r>:
8000d8d4:	0105a783          	lw	a5,16(a1)
8000d8d8:	08078a63          	beqz	a5,8000d96c <_fflush_r+0x98>
8000d8dc:	fe010113          	addi	sp,sp,-32
8000d8e0:	00812c23          	sw	s0,24(sp)
8000d8e4:	00112e23          	sw	ra,28(sp)
8000d8e8:	00050413          	mv	s0,a0
8000d8ec:	00050c63          	beqz	a0,8000d904 <_fflush_r+0x30>
8000d8f0:	01852783          	lw	a5,24(a0) # f0050018 <_heap_end+0x7003e018>
8000d8f4:	00079863          	bnez	a5,8000d904 <_fflush_r+0x30>
8000d8f8:	00b12623          	sw	a1,12(sp)
8000d8fc:	1c8000ef          	jal	ra,8000dac4 <__sinit>
8000d900:	00c12583          	lw	a1,12(sp)
8000d904:	ffff5797          	auipc	a5,0xffff5
8000d908:	49078793          	addi	a5,a5,1168 # 80002d94 <__sf_fake_stdin>
8000d90c:	02f59263          	bne	a1,a5,8000d930 <_fflush_r+0x5c>
8000d910:	00442583          	lw	a1,4(s0)
8000d914:	00c59783          	lh	a5,12(a1)
8000d918:	04078063          	beqz	a5,8000d958 <_fflush_r+0x84>
8000d91c:	00040513          	mv	a0,s0
8000d920:	01812403          	lw	s0,24(sp)
8000d924:	01c12083          	lw	ra,28(sp)
8000d928:	02010113          	addi	sp,sp,32
8000d92c:	dbdff06f          	j	8000d6e8 <__sflush_r>
8000d930:	ffff5797          	auipc	a5,0xffff5
8000d934:	48478793          	addi	a5,a5,1156 # 80002db4 <__sf_fake_stdout>
8000d938:	00f59663          	bne	a1,a5,8000d944 <_fflush_r+0x70>
8000d93c:	00842583          	lw	a1,8(s0)
8000d940:	fd5ff06f          	j	8000d914 <_fflush_r+0x40>
8000d944:	ffff5797          	auipc	a5,0xffff5
8000d948:	43078793          	addi	a5,a5,1072 # 80002d74 <__sf_fake_stderr>
8000d94c:	fcf594e3          	bne	a1,a5,8000d914 <_fflush_r+0x40>
8000d950:	00c42583          	lw	a1,12(s0)
8000d954:	fc1ff06f          	j	8000d914 <_fflush_r+0x40>
8000d958:	01c12083          	lw	ra,28(sp)
8000d95c:	01812403          	lw	s0,24(sp)
8000d960:	00000513          	li	a0,0
8000d964:	02010113          	addi	sp,sp,32
8000d968:	00008067          	ret
8000d96c:	00000513          	li	a0,0
8000d970:	00008067          	ret

Disassembly of section .text.fflush:

8000d974 <fflush>:
8000d974:	00050593          	mv	a1,a0
8000d978:	00051c63          	bnez	a0,8000d990 <fflush+0x1c>
8000d97c:	c3818793          	addi	a5,gp,-968 # 800033d8 <_bss_end>
8000d980:	0007a503          	lw	a0,0(a5)
8000d984:	00000597          	auipc	a1,0x0
8000d988:	f5058593          	addi	a1,a1,-176 # 8000d8d4 <_fflush_r>
8000d98c:	3ac0006f          	j	8000dd38 <_fwalk_reent>
8000d990:	80c18793          	addi	a5,gp,-2036 # 80002fac <_impure_ptr>
8000d994:	0007a503          	lw	a0,0(a5)
8000d998:	f3dff06f          	j	8000d8d4 <_fflush_r>

Disassembly of section .text.__fp_lock:

8000d99c <__fp_lock>:
8000d99c:	00000513          	li	a0,0
8000d9a0:	00008067          	ret

Disassembly of section .text.std:

8000d9a4 <std>:
8000d9a4:	ff010113          	addi	sp,sp,-16
8000d9a8:	00812423          	sw	s0,8(sp)
8000d9ac:	00112623          	sw	ra,12(sp)
8000d9b0:	00050413          	mv	s0,a0
8000d9b4:	00b51623          	sh	a1,12(a0)
8000d9b8:	00c51723          	sh	a2,14(a0)
8000d9bc:	00052023          	sw	zero,0(a0)
8000d9c0:	00052223          	sw	zero,4(a0)
8000d9c4:	00052423          	sw	zero,8(a0)
8000d9c8:	06052223          	sw	zero,100(a0)
8000d9cc:	00052823          	sw	zero,16(a0)
8000d9d0:	00052a23          	sw	zero,20(a0)
8000d9d4:	00052c23          	sw	zero,24(a0)
8000d9d8:	00800613          	li	a2,8
8000d9dc:	00000593          	li	a1,0
8000d9e0:	05c50513          	addi	a0,a0,92
8000d9e4:	828ff0ef          	jal	ra,8000ca0c <memset>
8000d9e8:	00001797          	auipc	a5,0x1
8000d9ec:	b9078793          	addi	a5,a5,-1136 # 8000e578 <__sread>
8000d9f0:	02f42223          	sw	a5,36(s0)
8000d9f4:	00001797          	auipc	a5,0x1
8000d9f8:	bdc78793          	addi	a5,a5,-1060 # 8000e5d0 <__swrite>
8000d9fc:	02f42423          	sw	a5,40(s0)
8000da00:	00001797          	auipc	a5,0x1
8000da04:	c5478793          	addi	a5,a5,-940 # 8000e654 <__sseek>
8000da08:	02f42623          	sw	a5,44(s0)
8000da0c:	00001797          	auipc	a5,0x1
8000da10:	ca078793          	addi	a5,a5,-864 # 8000e6ac <__sclose>
8000da14:	02842023          	sw	s0,32(s0)
8000da18:	02f42823          	sw	a5,48(s0)
8000da1c:	00c12083          	lw	ra,12(sp)
8000da20:	00812403          	lw	s0,8(sp)
8000da24:	01010113          	addi	sp,sp,16
8000da28:	00008067          	ret

Disassembly of section .text._cleanup_r:

8000da2c <_cleanup_r>:
8000da2c:	00000597          	auipc	a1,0x0
8000da30:	ea858593          	addi	a1,a1,-344 # 8000d8d4 <_fflush_r>
8000da34:	3040006f          	j	8000dd38 <_fwalk_reent>

Disassembly of section .text.__fp_unlock:

8000da38 <__fp_unlock>:
8000da38:	00000513          	li	a0,0
8000da3c:	00008067          	ret

Disassembly of section .text.__sfmoreglue:

8000da40 <__sfmoreglue>:
8000da40:	ff010113          	addi	sp,sp,-16
8000da44:	fff58613          	addi	a2,a1,-1
8000da48:	00812423          	sw	s0,8(sp)
8000da4c:	00161413          	slli	s0,a2,0x1
8000da50:	00c40433          	add	s0,s0,a2
8000da54:	00241413          	slli	s0,s0,0x2
8000da58:	00c40433          	add	s0,s0,a2
8000da5c:	00341413          	slli	s0,s0,0x3
8000da60:	01212023          	sw	s2,0(sp)
8000da64:	00058913          	mv	s2,a1
8000da68:	07440593          	addi	a1,s0,116
8000da6c:	00912223          	sw	s1,4(sp)
8000da70:	00112623          	sw	ra,12(sp)
8000da74:	654000ef          	jal	ra,8000e0c8 <_malloc_r>
8000da78:	00050493          	mv	s1,a0
8000da7c:	02050063          	beqz	a0,8000da9c <__sfmoreglue+0x5c>
8000da80:	00052023          	sw	zero,0(a0)
8000da84:	01252223          	sw	s2,4(a0)
8000da88:	00c50513          	addi	a0,a0,12
8000da8c:	00a4a423          	sw	a0,8(s1)
8000da90:	06840613          	addi	a2,s0,104
8000da94:	00000593          	li	a1,0
8000da98:	f75fe0ef          	jal	ra,8000ca0c <memset>
8000da9c:	00c12083          	lw	ra,12(sp)
8000daa0:	00812403          	lw	s0,8(sp)
8000daa4:	00048513          	mv	a0,s1
8000daa8:	00012903          	lw	s2,0(sp)
8000daac:	00412483          	lw	s1,4(sp)
8000dab0:	01010113          	addi	sp,sp,16
8000dab4:	00008067          	ret

Disassembly of section .text._cleanup:

8000dab8 <_cleanup>:
8000dab8:	c3818793          	addi	a5,gp,-968 # 800033d8 <_bss_end>
8000dabc:	0007a503          	lw	a0,0(a5)
8000dac0:	f6dff06f          	j	8000da2c <_cleanup_r>

Disassembly of section .text.__sinit:

8000dac4 <__sinit>:
8000dac4:	01852783          	lw	a5,24(a0)
8000dac8:	0a079463          	bnez	a5,8000db70 <__sinit+0xac>
8000dacc:	ff010113          	addi	sp,sp,-16
8000dad0:	00112623          	sw	ra,12(sp)
8000dad4:	00812423          	sw	s0,8(sp)
8000dad8:	00000797          	auipc	a5,0x0
8000dadc:	f5478793          	addi	a5,a5,-172 # 8000da2c <_cleanup_r>
8000dae0:	02f52423          	sw	a5,40(a0)
8000dae4:	c3818793          	addi	a5,gp,-968 # 800033d8 <_bss_end>
8000dae8:	0007a783          	lw	a5,0(a5)
8000daec:	04052423          	sw	zero,72(a0)
8000daf0:	04052623          	sw	zero,76(a0)
8000daf4:	04052823          	sw	zero,80(a0)
8000daf8:	00f51663          	bne	a0,a5,8000db04 <__sinit+0x40>
8000dafc:	00100793          	li	a5,1
8000db00:	00f52c23          	sw	a5,24(a0)
8000db04:	00050413          	mv	s0,a0
8000db08:	06c000ef          	jal	ra,8000db74 <__sfp>
8000db0c:	00a42223          	sw	a0,4(s0)
8000db10:	00040513          	mv	a0,s0
8000db14:	060000ef          	jal	ra,8000db74 <__sfp>
8000db18:	00a42423          	sw	a0,8(s0)
8000db1c:	00040513          	mv	a0,s0
8000db20:	054000ef          	jal	ra,8000db74 <__sfp>
8000db24:	00a42623          	sw	a0,12(s0)
8000db28:	00442503          	lw	a0,4(s0)
8000db2c:	00000613          	li	a2,0
8000db30:	00400593          	li	a1,4
8000db34:	e71ff0ef          	jal	ra,8000d9a4 <std>
8000db38:	00842503          	lw	a0,8(s0)
8000db3c:	00100613          	li	a2,1
8000db40:	00900593          	li	a1,9
8000db44:	e61ff0ef          	jal	ra,8000d9a4 <std>
8000db48:	00c42503          	lw	a0,12(s0)
8000db4c:	00200613          	li	a2,2
8000db50:	01200593          	li	a1,18
8000db54:	e51ff0ef          	jal	ra,8000d9a4 <std>
8000db58:	00100793          	li	a5,1
8000db5c:	00f42c23          	sw	a5,24(s0)
8000db60:	00c12083          	lw	ra,12(sp)
8000db64:	00812403          	lw	s0,8(sp)
8000db68:	01010113          	addi	sp,sp,16
8000db6c:	00008067          	ret
8000db70:	00008067          	ret

Disassembly of section .text.__sfp:

8000db74 <__sfp>:
8000db74:	ff010113          	addi	sp,sp,-16
8000db78:	c3818793          	addi	a5,gp,-968 # 800033d8 <_bss_end>
8000db7c:	00912223          	sw	s1,4(sp)
8000db80:	0007a483          	lw	s1,0(a5)
8000db84:	01212023          	sw	s2,0(sp)
8000db88:	00112623          	sw	ra,12(sp)
8000db8c:	0184a783          	lw	a5,24(s1)
8000db90:	00812423          	sw	s0,8(sp)
8000db94:	00050913          	mv	s2,a0
8000db98:	00079663          	bnez	a5,8000dba4 <__sfp+0x30>
8000db9c:	00048513          	mv	a0,s1
8000dba0:	f25ff0ef          	jal	ra,8000dac4 <__sinit>
8000dba4:	04848493          	addi	s1,s1,72
8000dba8:	0084a403          	lw	s0,8(s1)
8000dbac:	0044a783          	lw	a5,4(s1)
8000dbb0:	fff78793          	addi	a5,a5,-1
8000dbb4:	0007da63          	bgez	a5,8000dbc8 <__sfp+0x54>
8000dbb8:	0004a783          	lw	a5,0(s1)
8000dbbc:	08078063          	beqz	a5,8000dc3c <__sfp+0xc8>
8000dbc0:	0004a483          	lw	s1,0(s1)
8000dbc4:	fe5ff06f          	j	8000dba8 <__sfp+0x34>
8000dbc8:	00c41703          	lh	a4,12(s0)
8000dbcc:	06071463          	bnez	a4,8000dc34 <__sfp+0xc0>
8000dbd0:	ffff07b7          	lui	a5,0xffff0
8000dbd4:	00178793          	addi	a5,a5,1 # ffff0001 <_heap_end+0x7ffde001>
8000dbd8:	06042223          	sw	zero,100(s0)
8000dbdc:	00042023          	sw	zero,0(s0)
8000dbe0:	00042223          	sw	zero,4(s0)
8000dbe4:	00042423          	sw	zero,8(s0)
8000dbe8:	00f42623          	sw	a5,12(s0)
8000dbec:	00042823          	sw	zero,16(s0)
8000dbf0:	00042a23          	sw	zero,20(s0)
8000dbf4:	00042c23          	sw	zero,24(s0)
8000dbf8:	00800613          	li	a2,8
8000dbfc:	00000593          	li	a1,0
8000dc00:	05c40513          	addi	a0,s0,92
8000dc04:	e09fe0ef          	jal	ra,8000ca0c <memset>
8000dc08:	02042a23          	sw	zero,52(s0)
8000dc0c:	02042c23          	sw	zero,56(s0)
8000dc10:	04042423          	sw	zero,72(s0)
8000dc14:	04042623          	sw	zero,76(s0)
8000dc18:	00040513          	mv	a0,s0
8000dc1c:	00c12083          	lw	ra,12(sp)
8000dc20:	00812403          	lw	s0,8(sp)
8000dc24:	00412483          	lw	s1,4(sp)
8000dc28:	00012903          	lw	s2,0(sp)
8000dc2c:	01010113          	addi	sp,sp,16
8000dc30:	00008067          	ret
8000dc34:	06840413          	addi	s0,s0,104
8000dc38:	f79ff06f          	j	8000dbb0 <__sfp+0x3c>
8000dc3c:	00400593          	li	a1,4
8000dc40:	00090513          	mv	a0,s2
8000dc44:	dfdff0ef          	jal	ra,8000da40 <__sfmoreglue>
8000dc48:	00a4a023          	sw	a0,0(s1)
8000dc4c:	00050413          	mv	s0,a0
8000dc50:	f60518e3          	bnez	a0,8000dbc0 <__sfp+0x4c>
8000dc54:	00c00793          	li	a5,12
8000dc58:	00f92023          	sw	a5,0(s2)
8000dc5c:	fbdff06f          	j	8000dc18 <__sfp+0xa4>

Disassembly of section .text.__sfp_lock_acquire:

8000dc60 <__sfp_lock_acquire>:
8000dc60:	00008067          	ret

Disassembly of section .text.__sfp_lock_release:

8000dc64 <__sfp_lock_release>:
8000dc64:	00008067          	ret

Disassembly of section .text.__sinit_lock_acquire:

8000dc68 <__sinit_lock_acquire>:
8000dc68:	00008067          	ret

Disassembly of section .text.__sinit_lock_release:

8000dc6c <__sinit_lock_release>:
8000dc6c:	00008067          	ret

Disassembly of section .text.__fp_lock_all:

8000dc70 <__fp_lock_all>:
8000dc70:	80c18793          	addi	a5,gp,-2036 # 80002fac <_impure_ptr>
8000dc74:	0007a503          	lw	a0,0(a5)
8000dc78:	00000597          	auipc	a1,0x0
8000dc7c:	d2458593          	addi	a1,a1,-732 # 8000d99c <__fp_lock>
8000dc80:	0180006f          	j	8000dc98 <_fwalk>

Disassembly of section .text.__fp_unlock_all:

8000dc84 <__fp_unlock_all>:
8000dc84:	80c18793          	addi	a5,gp,-2036 # 80002fac <_impure_ptr>
8000dc88:	0007a503          	lw	a0,0(a5)
8000dc8c:	00000597          	auipc	a1,0x0
8000dc90:	dac58593          	addi	a1,a1,-596 # 8000da38 <__fp_unlock>
8000dc94:	0040006f          	j	8000dc98 <_fwalk>

Disassembly of section .text._fwalk:

8000dc98 <_fwalk>:
8000dc98:	fd010113          	addi	sp,sp,-48
8000dc9c:	02812423          	sw	s0,40(sp)
8000dca0:	03212023          	sw	s2,32(sp)
8000dca4:	01412c23          	sw	s4,24(sp)
8000dca8:	01512a23          	sw	s5,20(sp)
8000dcac:	02112623          	sw	ra,44(sp)
8000dcb0:	02912223          	sw	s1,36(sp)
8000dcb4:	01312e23          	sw	s3,28(sp)
8000dcb8:	04850413          	addi	s0,a0,72
8000dcbc:	00000913          	li	s2,0
8000dcc0:	00100a13          	li	s4,1
8000dcc4:	fff00a93          	li	s5,-1
8000dcc8:	02041663          	bnez	s0,8000dcf4 <_fwalk+0x5c>
8000dccc:	02c12083          	lw	ra,44(sp)
8000dcd0:	02812403          	lw	s0,40(sp)
8000dcd4:	00090513          	mv	a0,s2
8000dcd8:	02412483          	lw	s1,36(sp)
8000dcdc:	02012903          	lw	s2,32(sp)
8000dce0:	01c12983          	lw	s3,28(sp)
8000dce4:	01812a03          	lw	s4,24(sp)
8000dce8:	01412a83          	lw	s5,20(sp)
8000dcec:	03010113          	addi	sp,sp,48
8000dcf0:	00008067          	ret
8000dcf4:	00842483          	lw	s1,8(s0)
8000dcf8:	00442983          	lw	s3,4(s0)
8000dcfc:	fff98993          	addi	s3,s3,-1
8000dd00:	0009d663          	bgez	s3,8000dd0c <_fwalk+0x74>
8000dd04:	00042403          	lw	s0,0(s0)
8000dd08:	fc1ff06f          	j	8000dcc8 <_fwalk+0x30>
8000dd0c:	00c4d783          	lhu	a5,12(s1)
8000dd10:	02fa7063          	bgeu	s4,a5,8000dd30 <_fwalk+0x98>
8000dd14:	00e49783          	lh	a5,14(s1)
8000dd18:	01578c63          	beq	a5,s5,8000dd30 <_fwalk+0x98>
8000dd1c:	00048513          	mv	a0,s1
8000dd20:	00b12623          	sw	a1,12(sp)
8000dd24:	000580e7          	jalr	a1
8000dd28:	00c12583          	lw	a1,12(sp)
8000dd2c:	00a96933          	or	s2,s2,a0
8000dd30:	06848493          	addi	s1,s1,104
8000dd34:	fc9ff06f          	j	8000dcfc <_fwalk+0x64>

Disassembly of section .text._fwalk_reent:

8000dd38 <_fwalk_reent>:
8000dd38:	fd010113          	addi	sp,sp,-48
8000dd3c:	02812423          	sw	s0,40(sp)
8000dd40:	03212023          	sw	s2,32(sp)
8000dd44:	01412c23          	sw	s4,24(sp)
8000dd48:	01512a23          	sw	s5,20(sp)
8000dd4c:	01612823          	sw	s6,16(sp)
8000dd50:	01712623          	sw	s7,12(sp)
8000dd54:	02112623          	sw	ra,44(sp)
8000dd58:	02912223          	sw	s1,36(sp)
8000dd5c:	01312e23          	sw	s3,28(sp)
8000dd60:	00050a13          	mv	s4,a0
8000dd64:	00058a93          	mv	s5,a1
8000dd68:	04850413          	addi	s0,a0,72
8000dd6c:	00000913          	li	s2,0
8000dd70:	00100b13          	li	s6,1
8000dd74:	fff00b93          	li	s7,-1
8000dd78:	02041a63          	bnez	s0,8000ddac <_fwalk_reent+0x74>
8000dd7c:	02c12083          	lw	ra,44(sp)
8000dd80:	02812403          	lw	s0,40(sp)
8000dd84:	00090513          	mv	a0,s2
8000dd88:	02412483          	lw	s1,36(sp)
8000dd8c:	02012903          	lw	s2,32(sp)
8000dd90:	01c12983          	lw	s3,28(sp)
8000dd94:	01812a03          	lw	s4,24(sp)
8000dd98:	01412a83          	lw	s5,20(sp)
8000dd9c:	01012b03          	lw	s6,16(sp)
8000dda0:	00c12b83          	lw	s7,12(sp)
8000dda4:	03010113          	addi	sp,sp,48
8000dda8:	00008067          	ret
8000ddac:	00842483          	lw	s1,8(s0)
8000ddb0:	00442983          	lw	s3,4(s0)
8000ddb4:	fff98993          	addi	s3,s3,-1
8000ddb8:	0009d663          	bgez	s3,8000ddc4 <_fwalk_reent+0x8c>
8000ddbc:	00042403          	lw	s0,0(s0)
8000ddc0:	fb9ff06f          	j	8000dd78 <_fwalk_reent+0x40>
8000ddc4:	00c4d783          	lhu	a5,12(s1)
8000ddc8:	00fb7e63          	bgeu	s6,a5,8000dde4 <_fwalk_reent+0xac>
8000ddcc:	00e49783          	lh	a5,14(s1)
8000ddd0:	01778a63          	beq	a5,s7,8000dde4 <_fwalk_reent+0xac>
8000ddd4:	00048593          	mv	a1,s1
8000ddd8:	000a0513          	mv	a0,s4
8000dddc:	000a80e7          	jalr	s5
8000dde0:	00a96933          	or	s2,s2,a0
8000dde4:	06848493          	addi	s1,s1,104
8000dde8:	fcdff06f          	j	8000ddb4 <_fwalk_reent+0x7c>

Disassembly of section .text.malloc:

8000ddec <malloc>:
8000ddec:	80c18793          	addi	a5,gp,-2036 # 80002fac <_impure_ptr>
8000ddf0:	00050593          	mv	a1,a0
8000ddf4:	0007a503          	lw	a0,0(a5)
8000ddf8:	2d00006f          	j	8000e0c8 <_malloc_r>

Disassembly of section .text.free:

8000ddfc <free>:
8000ddfc:	80c18793          	addi	a5,gp,-2036 # 80002fac <_impure_ptr>
8000de00:	00050593          	mv	a1,a0
8000de04:	0007a503          	lw	a0,0(a5)
8000de08:	1bc0006f          	j	8000dfc4 <_free_r>

Disassembly of section .text.memcmp:

8000de0c <memcmp>:
8000de0c:	00000713          	li	a4,0
8000de10:	00e61663          	bne	a2,a4,8000de1c <memcmp+0x10>
8000de14:	00000513          	li	a0,0
8000de18:	00008067          	ret
8000de1c:	00e507b3          	add	a5,a0,a4
8000de20:	00170713          	addi	a4,a4,1
8000de24:	00e586b3          	add	a3,a1,a4
8000de28:	0007c783          	lbu	a5,0(a5)
8000de2c:	fff6c683          	lbu	a3,-1(a3)
8000de30:	fed780e3          	beq	a5,a3,8000de10 <memcmp+0x4>
8000de34:	40d78533          	sub	a0,a5,a3
8000de38:	00008067          	ret

Disassembly of section .text.memcpy:

8000de3c <memcpy>:
8000de3c:	00a5c7b3          	xor	a5,a1,a0
8000de40:	0037f793          	andi	a5,a5,3
8000de44:	00c50733          	add	a4,a0,a2
8000de48:	00079663          	bnez	a5,8000de54 <memcpy+0x18>
8000de4c:	00300793          	li	a5,3
8000de50:	02c7e263          	bltu	a5,a2,8000de74 <memcpy+0x38>
8000de54:	00050793          	mv	a5,a0
8000de58:	0ae57c63          	bgeu	a0,a4,8000df10 <memcpy+0xd4>
8000de5c:	0005c683          	lbu	a3,0(a1)
8000de60:	00178793          	addi	a5,a5,1
8000de64:	00158593          	addi	a1,a1,1
8000de68:	fed78fa3          	sb	a3,-1(a5)
8000de6c:	fee7e8e3          	bltu	a5,a4,8000de5c <memcpy+0x20>
8000de70:	00008067          	ret
8000de74:	00357693          	andi	a3,a0,3
8000de78:	00050793          	mv	a5,a0
8000de7c:	00068e63          	beqz	a3,8000de98 <memcpy+0x5c>
8000de80:	0005c683          	lbu	a3,0(a1)
8000de84:	00178793          	addi	a5,a5,1
8000de88:	00158593          	addi	a1,a1,1
8000de8c:	fed78fa3          	sb	a3,-1(a5)
8000de90:	0037f693          	andi	a3,a5,3
8000de94:	fe9ff06f          	j	8000de7c <memcpy+0x40>
8000de98:	ffc77693          	andi	a3,a4,-4
8000de9c:	fe068613          	addi	a2,a3,-32
8000dea0:	06c7f463          	bgeu	a5,a2,8000df08 <memcpy+0xcc>
8000dea4:	0005a383          	lw	t2,0(a1)
8000dea8:	0045a283          	lw	t0,4(a1)
8000deac:	0085af83          	lw	t6,8(a1)
8000deb0:	00c5af03          	lw	t5,12(a1)
8000deb4:	0105ae83          	lw	t4,16(a1)
8000deb8:	0145ae03          	lw	t3,20(a1)
8000debc:	0185a303          	lw	t1,24(a1)
8000dec0:	01c5a883          	lw	a7,28(a1)
8000dec4:	02458593          	addi	a1,a1,36
8000dec8:	0077a023          	sw	t2,0(a5)
8000decc:	ffc5a803          	lw	a6,-4(a1)
8000ded0:	0057a223          	sw	t0,4(a5)
8000ded4:	01f7a423          	sw	t6,8(a5)
8000ded8:	01e7a623          	sw	t5,12(a5)
8000dedc:	01d7a823          	sw	t4,16(a5)
8000dee0:	01c7aa23          	sw	t3,20(a5)
8000dee4:	0067ac23          	sw	t1,24(a5)
8000dee8:	0117ae23          	sw	a7,28(a5)
8000deec:	02478793          	addi	a5,a5,36
8000def0:	ff07ae23          	sw	a6,-4(a5)
8000def4:	fadff06f          	j	8000dea0 <memcpy+0x64>
8000def8:	0005a603          	lw	a2,0(a1)
8000defc:	00478793          	addi	a5,a5,4
8000df00:	00458593          	addi	a1,a1,4
8000df04:	fec7ae23          	sw	a2,-4(a5)
8000df08:	fed7e8e3          	bltu	a5,a3,8000def8 <memcpy+0xbc>
8000df0c:	f4e7e8e3          	bltu	a5,a4,8000de5c <memcpy+0x20>
8000df10:	00008067          	ret

Disassembly of section .text.memmove:

8000df14 <memmove>:
8000df14:	04a5fa63          	bgeu	a1,a0,8000df68 <memmove+0x54>
8000df18:	00c586b3          	add	a3,a1,a2
8000df1c:	04d57663          	bgeu	a0,a3,8000df68 <memmove+0x54>
8000df20:	fff64593          	not	a1,a2
8000df24:	00000793          	li	a5,0
8000df28:	fff78793          	addi	a5,a5,-1
8000df2c:	00f59463          	bne	a1,a5,8000df34 <memmove+0x20>
8000df30:	00008067          	ret
8000df34:	00f68733          	add	a4,a3,a5
8000df38:	00074803          	lbu	a6,0(a4)
8000df3c:	00c78733          	add	a4,a5,a2
8000df40:	00e50733          	add	a4,a0,a4
8000df44:	01070023          	sb	a6,0(a4)
8000df48:	fe1ff06f          	j	8000df28 <memmove+0x14>
8000df4c:	00f58733          	add	a4,a1,a5
8000df50:	00074683          	lbu	a3,0(a4)
8000df54:	00f50733          	add	a4,a0,a5
8000df58:	00178793          	addi	a5,a5,1
8000df5c:	00d70023          	sb	a3,0(a4)
8000df60:	fef616e3          	bne	a2,a5,8000df4c <memmove+0x38>
8000df64:	00008067          	ret
8000df68:	00000793          	li	a5,0
8000df6c:	ff5ff06f          	j	8000df60 <memmove+0x4c>

Disassembly of section .text._calloc_r:

8000df70 <_calloc_r>:
8000df70:	fe010113          	addi	sp,sp,-32
8000df74:	00812c23          	sw	s0,24(sp)
8000df78:	00050413          	mv	s0,a0
8000df7c:	00058513          	mv	a0,a1
8000df80:	00060593          	mv	a1,a2
8000df84:	00112e23          	sw	ra,28(sp)
8000df88:	968ff0ef          	jal	ra,8000d0f0 <__mulsi3>
8000df8c:	00050593          	mv	a1,a0
8000df90:	00a12623          	sw	a0,12(sp)
8000df94:	00040513          	mv	a0,s0
8000df98:	130000ef          	jal	ra,8000e0c8 <_malloc_r>
8000df9c:	00050413          	mv	s0,a0
8000dfa0:	00050863          	beqz	a0,8000dfb0 <_calloc_r+0x40>
8000dfa4:	00c12603          	lw	a2,12(sp)
8000dfa8:	00000593          	li	a1,0
8000dfac:	a61fe0ef          	jal	ra,8000ca0c <memset>
8000dfb0:	00040513          	mv	a0,s0
8000dfb4:	01c12083          	lw	ra,28(sp)
8000dfb8:	01812403          	lw	s0,24(sp)
8000dfbc:	02010113          	addi	sp,sp,32
8000dfc0:	00008067          	ret

Disassembly of section .text._free_r:

8000dfc4 <_free_r>:
8000dfc4:	10058063          	beqz	a1,8000e0c4 <_free_r+0x100>
8000dfc8:	ffc5a783          	lw	a5,-4(a1)
8000dfcc:	ff010113          	addi	sp,sp,-16
8000dfd0:	00812423          	sw	s0,8(sp)
8000dfd4:	00112623          	sw	ra,12(sp)
8000dfd8:	00912223          	sw	s1,4(sp)
8000dfdc:	ffc58413          	addi	s0,a1,-4
8000dfe0:	0007d463          	bgez	a5,8000dfe8 <_free_r+0x24>
8000dfe4:	00f40433          	add	s0,s0,a5
8000dfe8:	00050493          	mv	s1,a0
8000dfec:	97df70ef          	jal	ra,80005968 <__malloc_lock>
8000dff0:	8f418793          	addi	a5,gp,-1804 # 80003094 <__malloc_free_list>
8000dff4:	0007a783          	lw	a5,0(a5)
8000dff8:	02079263          	bnez	a5,8000e01c <_free_r+0x58>
8000dffc:	00042223          	sw	zero,4(s0)
8000e000:	8e81aa23          	sw	s0,-1804(gp) # 80003094 <__malloc_free_list>
8000e004:	00812403          	lw	s0,8(sp)
8000e008:	00c12083          	lw	ra,12(sp)
8000e00c:	00048513          	mv	a0,s1
8000e010:	00412483          	lw	s1,4(sp)
8000e014:	01010113          	addi	sp,sp,16
8000e018:	955f706f          	j	8000596c <__malloc_unlock>
8000e01c:	02f47663          	bgeu	s0,a5,8000e048 <_free_r+0x84>
8000e020:	00042683          	lw	a3,0(s0)
8000e024:	00d40733          	add	a4,s0,a3
8000e028:	00e79a63          	bne	a5,a4,8000e03c <_free_r+0x78>
8000e02c:	0007a703          	lw	a4,0(a5)
8000e030:	0047a783          	lw	a5,4(a5)
8000e034:	00d70733          	add	a4,a4,a3
8000e038:	00e42023          	sw	a4,0(s0)
8000e03c:	00f42223          	sw	a5,4(s0)
8000e040:	fc1ff06f          	j	8000e000 <_free_r+0x3c>
8000e044:	00070793          	mv	a5,a4
8000e048:	0047a703          	lw	a4,4(a5)
8000e04c:	00070463          	beqz	a4,8000e054 <_free_r+0x90>
8000e050:	fee47ae3          	bgeu	s0,a4,8000e044 <_free_r+0x80>
8000e054:	0007a683          	lw	a3,0(a5)
8000e058:	00d78633          	add	a2,a5,a3
8000e05c:	02861863          	bne	a2,s0,8000e08c <_free_r+0xc8>
8000e060:	00042603          	lw	a2,0(s0)
8000e064:	00c686b3          	add	a3,a3,a2
8000e068:	00d7a023          	sw	a3,0(a5)
8000e06c:	00d78633          	add	a2,a5,a3
8000e070:	f8c71ae3          	bne	a4,a2,8000e004 <_free_r+0x40>
8000e074:	00072603          	lw	a2,0(a4)
8000e078:	00472703          	lw	a4,4(a4)
8000e07c:	00d606b3          	add	a3,a2,a3
8000e080:	00d7a023          	sw	a3,0(a5)
8000e084:	00e7a223          	sw	a4,4(a5)
8000e088:	f7dff06f          	j	8000e004 <_free_r+0x40>
8000e08c:	00c47863          	bgeu	s0,a2,8000e09c <_free_r+0xd8>
8000e090:	00c00793          	li	a5,12
8000e094:	00f4a023          	sw	a5,0(s1)
8000e098:	f6dff06f          	j	8000e004 <_free_r+0x40>
8000e09c:	00042603          	lw	a2,0(s0)
8000e0a0:	00c406b3          	add	a3,s0,a2
8000e0a4:	00d71a63          	bne	a4,a3,8000e0b8 <_free_r+0xf4>
8000e0a8:	00072683          	lw	a3,0(a4)
8000e0ac:	00472703          	lw	a4,4(a4)
8000e0b0:	00c686b3          	add	a3,a3,a2
8000e0b4:	00d42023          	sw	a3,0(s0)
8000e0b8:	00e42223          	sw	a4,4(s0)
8000e0bc:	0087a223          	sw	s0,4(a5)
8000e0c0:	f45ff06f          	j	8000e004 <_free_r+0x40>
8000e0c4:	00008067          	ret

Disassembly of section .text._malloc_r:

8000e0c8 <_malloc_r>:
8000e0c8:	fe010113          	addi	sp,sp,-32
8000e0cc:	00912a23          	sw	s1,20(sp)
8000e0d0:	00358493          	addi	s1,a1,3
8000e0d4:	ffc4f493          	andi	s1,s1,-4
8000e0d8:	00112e23          	sw	ra,28(sp)
8000e0dc:	00812c23          	sw	s0,24(sp)
8000e0e0:	01212823          	sw	s2,16(sp)
8000e0e4:	01312623          	sw	s3,12(sp)
8000e0e8:	00848493          	addi	s1,s1,8
8000e0ec:	00c00793          	li	a5,12
8000e0f0:	06f4f463          	bgeu	s1,a5,8000e158 <_malloc_r+0x90>
8000e0f4:	00c00493          	li	s1,12
8000e0f8:	06b4e263          	bltu	s1,a1,8000e15c <_malloc_r+0x94>
8000e0fc:	00050913          	mv	s2,a0
8000e100:	869f70ef          	jal	ra,80005968 <__malloc_lock>
8000e104:	8f418793          	addi	a5,gp,-1804 # 80003094 <__malloc_free_list>
8000e108:	0007a703          	lw	a4,0(a5)
8000e10c:	00070413          	mv	s0,a4
8000e110:	06041a63          	bnez	s0,8000e184 <_malloc_r+0xbc>
8000e114:	8f818793          	addi	a5,gp,-1800 # 80003098 <__malloc_sbrk_start>
8000e118:	0007a783          	lw	a5,0(a5)
8000e11c:	00079a63          	bnez	a5,8000e130 <_malloc_r+0x68>
8000e120:	00000593          	li	a1,0
8000e124:	00090513          	mv	a0,s2
8000e128:	1cc000ef          	jal	ra,8000e2f4 <_sbrk_r>
8000e12c:	8ea1ac23          	sw	a0,-1800(gp) # 80003098 <__malloc_sbrk_start>
8000e130:	00048593          	mv	a1,s1
8000e134:	00090513          	mv	a0,s2
8000e138:	1bc000ef          	jal	ra,8000e2f4 <_sbrk_r>
8000e13c:	fff00993          	li	s3,-1
8000e140:	0b351a63          	bne	a0,s3,8000e1f4 <_malloc_r+0x12c>
8000e144:	00c00793          	li	a5,12
8000e148:	00f92023          	sw	a5,0(s2)
8000e14c:	00090513          	mv	a0,s2
8000e150:	81df70ef          	jal	ra,8000596c <__malloc_unlock>
8000e154:	0100006f          	j	8000e164 <_malloc_r+0x9c>
8000e158:	fa04d0e3          	bgez	s1,8000e0f8 <_malloc_r+0x30>
8000e15c:	00c00793          	li	a5,12
8000e160:	00f52023          	sw	a5,0(a0)
8000e164:	00000513          	li	a0,0
8000e168:	01c12083          	lw	ra,28(sp)
8000e16c:	01812403          	lw	s0,24(sp)
8000e170:	01412483          	lw	s1,20(sp)
8000e174:	01012903          	lw	s2,16(sp)
8000e178:	00c12983          	lw	s3,12(sp)
8000e17c:	02010113          	addi	sp,sp,32
8000e180:	00008067          	ret
8000e184:	00042783          	lw	a5,0(s0)
8000e188:	409787b3          	sub	a5,a5,s1
8000e18c:	0407ce63          	bltz	a5,8000e1e8 <_malloc_r+0x120>
8000e190:	00b00693          	li	a3,11
8000e194:	00f6fa63          	bgeu	a3,a5,8000e1a8 <_malloc_r+0xe0>
8000e198:	00f42023          	sw	a5,0(s0)
8000e19c:	00f40433          	add	s0,s0,a5
8000e1a0:	00942023          	sw	s1,0(s0)
8000e1a4:	0100006f          	j	8000e1b4 <_malloc_r+0xec>
8000e1a8:	00442783          	lw	a5,4(s0)
8000e1ac:	02871a63          	bne	a4,s0,8000e1e0 <_malloc_r+0x118>
8000e1b0:	8ef1aa23          	sw	a5,-1804(gp) # 80003094 <__malloc_free_list>
8000e1b4:	00090513          	mv	a0,s2
8000e1b8:	fb4f70ef          	jal	ra,8000596c <__malloc_unlock>
8000e1bc:	00b40513          	addi	a0,s0,11
8000e1c0:	00440793          	addi	a5,s0,4
8000e1c4:	ff857513          	andi	a0,a0,-8
8000e1c8:	40f50733          	sub	a4,a0,a5
8000e1cc:	f8070ee3          	beqz	a4,8000e168 <_malloc_r+0xa0>
8000e1d0:	00e40433          	add	s0,s0,a4
8000e1d4:	40a787b3          	sub	a5,a5,a0
8000e1d8:	00f42023          	sw	a5,0(s0)
8000e1dc:	f8dff06f          	j	8000e168 <_malloc_r+0xa0>
8000e1e0:	00f72223          	sw	a5,4(a4)
8000e1e4:	fd1ff06f          	j	8000e1b4 <_malloc_r+0xec>
8000e1e8:	00040713          	mv	a4,s0
8000e1ec:	00442403          	lw	s0,4(s0)
8000e1f0:	f21ff06f          	j	8000e110 <_malloc_r+0x48>
8000e1f4:	00350413          	addi	s0,a0,3
8000e1f8:	ffc47413          	andi	s0,s0,-4
8000e1fc:	fa8502e3          	beq	a0,s0,8000e1a0 <_malloc_r+0xd8>
8000e200:	40a405b3          	sub	a1,s0,a0
8000e204:	00090513          	mv	a0,s2
8000e208:	0ec000ef          	jal	ra,8000e2f4 <_sbrk_r>
8000e20c:	f9351ae3          	bne	a0,s3,8000e1a0 <_malloc_r+0xd8>
8000e210:	f35ff06f          	j	8000e144 <_malloc_r+0x7c>

Disassembly of section .text._printf_r:

8000e214 <_iprintf_r>:
8000e214:	fb010113          	addi	sp,sp,-80
8000e218:	02812423          	sw	s0,40(sp)
8000e21c:	02112623          	sw	ra,44(sp)
8000e220:	02c12c23          	sw	a2,56(sp)
8000e224:	02d12e23          	sw	a3,60(sp)
8000e228:	04e12023          	sw	a4,64(sp)
8000e22c:	04f12223          	sw	a5,68(sp)
8000e230:	05012423          	sw	a6,72(sp)
8000e234:	05112623          	sw	a7,76(sp)
8000e238:	00050413          	mv	s0,a0
8000e23c:	00050c63          	beqz	a0,8000e254 <_iprintf_r+0x40>
8000e240:	01852783          	lw	a5,24(a0)
8000e244:	00079863          	bnez	a5,8000e254 <_iprintf_r+0x40>
8000e248:	00b12623          	sw	a1,12(sp)
8000e24c:	879ff0ef          	jal	ra,8000dac4 <__sinit>
8000e250:	00c12583          	lw	a1,12(sp)
8000e254:	00058613          	mv	a2,a1
8000e258:	00842583          	lw	a1,8(s0)
8000e25c:	03810693          	addi	a3,sp,56
8000e260:	00040513          	mv	a0,s0
8000e264:	00d12e23          	sw	a3,28(sp)
8000e268:	50c010ef          	jal	ra,8000f774 <_vfiprintf_r>
8000e26c:	02c12083          	lw	ra,44(sp)
8000e270:	02812403          	lw	s0,40(sp)
8000e274:	05010113          	addi	sp,sp,80
8000e278:	00008067          	ret

Disassembly of section .text.printf:

8000e27c <iprintf>:
8000e27c:	fc010113          	addi	sp,sp,-64
8000e280:	02f12a23          	sw	a5,52(sp)
8000e284:	02b12223          	sw	a1,36(sp)
8000e288:	02c12423          	sw	a2,40(sp)
8000e28c:	02d12623          	sw	a3,44(sp)
8000e290:	02e12823          	sw	a4,48(sp)
8000e294:	03012c23          	sw	a6,56(sp)
8000e298:	03112e23          	sw	a7,60(sp)
8000e29c:	80c18793          	addi	a5,gp,-2036 # 80002fac <_impure_ptr>
8000e2a0:	00812c23          	sw	s0,24(sp)
8000e2a4:	0007a403          	lw	s0,0(a5)
8000e2a8:	00912a23          	sw	s1,20(sp)
8000e2ac:	00112e23          	sw	ra,28(sp)
8000e2b0:	00050493          	mv	s1,a0
8000e2b4:	00040a63          	beqz	s0,8000e2c8 <iprintf+0x4c>
8000e2b8:	01842783          	lw	a5,24(s0)
8000e2bc:	00079663          	bnez	a5,8000e2c8 <iprintf+0x4c>
8000e2c0:	00040513          	mv	a0,s0
8000e2c4:	801ff0ef          	jal	ra,8000dac4 <__sinit>
8000e2c8:	00842583          	lw	a1,8(s0)
8000e2cc:	02410693          	addi	a3,sp,36
8000e2d0:	00048613          	mv	a2,s1
8000e2d4:	00040513          	mv	a0,s0
8000e2d8:	00d12623          	sw	a3,12(sp)
8000e2dc:	498010ef          	jal	ra,8000f774 <_vfiprintf_r>
8000e2e0:	01c12083          	lw	ra,28(sp)
8000e2e4:	01812403          	lw	s0,24(sp)
8000e2e8:	01412483          	lw	s1,20(sp)
8000e2ec:	04010113          	addi	sp,sp,64
8000e2f0:	00008067          	ret

Disassembly of section .text._sbrk_r:

8000e2f4 <_sbrk_r>:
8000e2f4:	ff010113          	addi	sp,sp,-16
8000e2f8:	00812423          	sw	s0,8(sp)
8000e2fc:	00050413          	mv	s0,a0
8000e300:	00058513          	mv	a0,a1
8000e304:	c201aa23          	sw	zero,-972(gp) # 800033d4 <errno>
8000e308:	00112623          	sw	ra,12(sp)
8000e30c:	ee8f70ef          	jal	ra,800059f4 <_sbrk>
8000e310:	fff00793          	li	a5,-1
8000e314:	00f51a63          	bne	a0,a5,8000e328 <_sbrk_r+0x34>
8000e318:	c3418793          	addi	a5,gp,-972 # 800033d4 <errno>
8000e31c:	0007a783          	lw	a5,0(a5)
8000e320:	00078463          	beqz	a5,8000e328 <_sbrk_r+0x34>
8000e324:	00f42023          	sw	a5,0(s0)
8000e328:	00c12083          	lw	ra,12(sp)
8000e32c:	00812403          	lw	s0,8(sp)
8000e330:	01010113          	addi	sp,sp,16
8000e334:	00008067          	ret

Disassembly of section .text._snprintf_r:

8000e338 <_sniprintf_r>:
8000e338:	f7010113          	addi	sp,sp,-144
8000e33c:	06112e23          	sw	ra,124(sp)
8000e340:	06812c23          	sw	s0,120(sp)
8000e344:	06912a23          	sw	s1,116(sp)
8000e348:	07212823          	sw	s2,112(sp)
8000e34c:	08e12023          	sw	a4,128(sp)
8000e350:	08f12223          	sw	a5,132(sp)
8000e354:	09012423          	sw	a6,136(sp)
8000e358:	09112623          	sw	a7,140(sp)
8000e35c:	02065463          	bgez	a2,8000e384 <_sniprintf_r+0x4c>
8000e360:	08b00793          	li	a5,139
8000e364:	00f52023          	sw	a5,0(a0)
8000e368:	fff00513          	li	a0,-1
8000e36c:	07c12083          	lw	ra,124(sp)
8000e370:	07812403          	lw	s0,120(sp)
8000e374:	07412483          	lw	s1,116(sp)
8000e378:	07012903          	lw	s2,112(sp)
8000e37c:	09010113          	addi	sp,sp,144
8000e380:	00008067          	ret
8000e384:	20800793          	li	a5,520
8000e388:	00f11a23          	sh	a5,20(sp)
8000e38c:	00b12423          	sw	a1,8(sp)
8000e390:	00b12c23          	sw	a1,24(sp)
8000e394:	00060413          	mv	s0,a2
8000e398:	00000793          	li	a5,0
8000e39c:	00060463          	beqz	a2,8000e3a4 <_sniprintf_r+0x6c>
8000e3a0:	fff60793          	addi	a5,a2,-1
8000e3a4:	fff00913          	li	s2,-1
8000e3a8:	00068613          	mv	a2,a3
8000e3ac:	00810593          	addi	a1,sp,8
8000e3b0:	08010693          	addi	a3,sp,128
8000e3b4:	00050493          	mv	s1,a0
8000e3b8:	00f12823          	sw	a5,16(sp)
8000e3bc:	00f12e23          	sw	a5,28(sp)
8000e3c0:	01211b23          	sh	s2,22(sp)
8000e3c4:	00d12223          	sw	a3,4(sp)
8000e3c8:	189000ef          	jal	ra,8000ed50 <_svfiprintf_r>
8000e3cc:	01255663          	bge	a0,s2,8000e3d8 <_sniprintf_r+0xa0>
8000e3d0:	08b00793          	li	a5,139
8000e3d4:	00f4a023          	sw	a5,0(s1)
8000e3d8:	f8040ae3          	beqz	s0,8000e36c <_sniprintf_r+0x34>
8000e3dc:	00812783          	lw	a5,8(sp)
8000e3e0:	00078023          	sb	zero,0(a5)
8000e3e4:	f89ff06f          	j	8000e36c <_sniprintf_r+0x34>

Disassembly of section .text.snprintf:

8000e3e8 <sniprintf>:
8000e3e8:	f6010113          	addi	sp,sp,-160
8000e3ec:	08f12a23          	sw	a5,148(sp)
8000e3f0:	06912a23          	sw	s1,116(sp)
8000e3f4:	08d12623          	sw	a3,140(sp)
8000e3f8:	08e12823          	sw	a4,144(sp)
8000e3fc:	09012c23          	sw	a6,152(sp)
8000e400:	09112e23          	sw	a7,156(sp)
8000e404:	80c18793          	addi	a5,gp,-2036 # 80002fac <_impure_ptr>
8000e408:	06112e23          	sw	ra,124(sp)
8000e40c:	06812c23          	sw	s0,120(sp)
8000e410:	07212823          	sw	s2,112(sp)
8000e414:	0007a483          	lw	s1,0(a5)
8000e418:	0205d463          	bgez	a1,8000e440 <sniprintf+0x58>
8000e41c:	08b00793          	li	a5,139
8000e420:	00f4a023          	sw	a5,0(s1)
8000e424:	fff00513          	li	a0,-1
8000e428:	07c12083          	lw	ra,124(sp)
8000e42c:	07812403          	lw	s0,120(sp)
8000e430:	07412483          	lw	s1,116(sp)
8000e434:	07012903          	lw	s2,112(sp)
8000e438:	0a010113          	addi	sp,sp,160
8000e43c:	00008067          	ret
8000e440:	20800793          	li	a5,520
8000e444:	00f11a23          	sh	a5,20(sp)
8000e448:	00a12423          	sw	a0,8(sp)
8000e44c:	00a12c23          	sw	a0,24(sp)
8000e450:	00000793          	li	a5,0
8000e454:	00058463          	beqz	a1,8000e45c <sniprintf+0x74>
8000e458:	fff58793          	addi	a5,a1,-1
8000e45c:	fff00913          	li	s2,-1
8000e460:	00058413          	mv	s0,a1
8000e464:	08c10693          	addi	a3,sp,140
8000e468:	00810593          	addi	a1,sp,8
8000e46c:	00048513          	mv	a0,s1
8000e470:	00f12823          	sw	a5,16(sp)
8000e474:	00f12e23          	sw	a5,28(sp)
8000e478:	01211b23          	sh	s2,22(sp)
8000e47c:	00d12223          	sw	a3,4(sp)
8000e480:	0d1000ef          	jal	ra,8000ed50 <_svfiprintf_r>
8000e484:	01255663          	bge	a0,s2,8000e490 <sniprintf+0xa8>
8000e488:	08b00793          	li	a5,139
8000e48c:	00f4a023          	sw	a5,0(s1)
8000e490:	f8040ce3          	beqz	s0,8000e428 <sniprintf+0x40>
8000e494:	00812783          	lw	a5,8(sp)
8000e498:	00078023          	sb	zero,0(a5)
8000e49c:	f8dff06f          	j	8000e428 <sniprintf+0x40>

Disassembly of section .text._sprintf_r:

8000e4a0 <_siprintf_r>:
8000e4a0:	f6010113          	addi	sp,sp,-160
8000e4a4:	08f12a23          	sw	a5,148(sp)
8000e4a8:	800007b7          	lui	a5,0x80000
8000e4ac:	fff7c793          	not	a5,a5
8000e4b0:	00f12e23          	sw	a5,28(sp)
8000e4b4:	00f12823          	sw	a5,16(sp)
8000e4b8:	ffff07b7          	lui	a5,0xffff0
8000e4bc:	08d12623          	sw	a3,140(sp)
8000e4c0:	00b12423          	sw	a1,8(sp)
8000e4c4:	00b12c23          	sw	a1,24(sp)
8000e4c8:	20878793          	addi	a5,a5,520 # ffff0208 <_heap_end+0x7ffde208>
8000e4cc:	08c10693          	addi	a3,sp,140
8000e4d0:	00810593          	addi	a1,sp,8
8000e4d4:	06112e23          	sw	ra,124(sp)
8000e4d8:	00f12a23          	sw	a5,20(sp)
8000e4dc:	08e12823          	sw	a4,144(sp)
8000e4e0:	09012c23          	sw	a6,152(sp)
8000e4e4:	09112e23          	sw	a7,156(sp)
8000e4e8:	00d12223          	sw	a3,4(sp)
8000e4ec:	065000ef          	jal	ra,8000ed50 <_svfiprintf_r>
8000e4f0:	00812783          	lw	a5,8(sp)
8000e4f4:	00078023          	sb	zero,0(a5)
8000e4f8:	07c12083          	lw	ra,124(sp)
8000e4fc:	0a010113          	addi	sp,sp,160
8000e500:	00008067          	ret

Disassembly of section .text.sprintf:

8000e504 <siprintf>:
8000e504:	f6010113          	addi	sp,sp,-160
8000e508:	08f12a23          	sw	a5,148(sp)
8000e50c:	800007b7          	lui	a5,0x80000
8000e510:	fff7c793          	not	a5,a5
8000e514:	00f12e23          	sw	a5,28(sp)
8000e518:	00f12823          	sw	a5,16(sp)
8000e51c:	ffff07b7          	lui	a5,0xffff0
8000e520:	20878793          	addi	a5,a5,520 # ffff0208 <_heap_end+0x7ffde208>
8000e524:	08c12423          	sw	a2,136(sp)
8000e528:	08d12623          	sw	a3,140(sp)
8000e52c:	08e12823          	sw	a4,144(sp)
8000e530:	09012c23          	sw	a6,152(sp)
8000e534:	09112e23          	sw	a7,156(sp)
8000e538:	00f12a23          	sw	a5,20(sp)
8000e53c:	80c18793          	addi	a5,gp,-2036 # 80002fac <_impure_ptr>
8000e540:	00a12423          	sw	a0,8(sp)
8000e544:	00a12c23          	sw	a0,24(sp)
8000e548:	0007a503          	lw	a0,0(a5)
8000e54c:	08810693          	addi	a3,sp,136
8000e550:	00058613          	mv	a2,a1
8000e554:	00810593          	addi	a1,sp,8
8000e558:	06112e23          	sw	ra,124(sp)
8000e55c:	00d12223          	sw	a3,4(sp)
8000e560:	7f0000ef          	jal	ra,8000ed50 <_svfiprintf_r>
8000e564:	00812783          	lw	a5,8(sp)
8000e568:	00078023          	sb	zero,0(a5)
8000e56c:	07c12083          	lw	ra,124(sp)
8000e570:	0a010113          	addi	sp,sp,160
8000e574:	00008067          	ret

Disassembly of section .text.__sread:

8000e578 <__sread>:
8000e578:	ff010113          	addi	sp,sp,-16
8000e57c:	00812423          	sw	s0,8(sp)
8000e580:	00058413          	mv	s0,a1
8000e584:	00e59583          	lh	a1,14(a1)
8000e588:	00112623          	sw	ra,12(sp)
8000e58c:	5d4010ef          	jal	ra,8000fb60 <_read_r>
8000e590:	02054063          	bltz	a0,8000e5b0 <__sread+0x38>
8000e594:	05442783          	lw	a5,84(s0)
8000e598:	00a787b3          	add	a5,a5,a0
8000e59c:	04f42a23          	sw	a5,84(s0)
8000e5a0:	00c12083          	lw	ra,12(sp)
8000e5a4:	00812403          	lw	s0,8(sp)
8000e5a8:	01010113          	addi	sp,sp,16
8000e5ac:	00008067          	ret
8000e5b0:	00c45783          	lhu	a5,12(s0)
8000e5b4:	fffff737          	lui	a4,0xfffff
8000e5b8:	fff70713          	addi	a4,a4,-1 # ffffefff <_heap_end+0x7ffecfff>
8000e5bc:	00e7f7b3          	and	a5,a5,a4
8000e5c0:	00f41623          	sh	a5,12(s0)
8000e5c4:	fddff06f          	j	8000e5a0 <__sread+0x28>

Disassembly of section .text.__seofread:

8000e5c8 <__seofread>:
8000e5c8:	00000513          	li	a0,0
8000e5cc:	00008067          	ret

Disassembly of section .text.__swrite:

8000e5d0 <__swrite>:
8000e5d0:	00c5d783          	lhu	a5,12(a1)
8000e5d4:	fe010113          	addi	sp,sp,-32
8000e5d8:	00812c23          	sw	s0,24(sp)
8000e5dc:	00912a23          	sw	s1,20(sp)
8000e5e0:	01212823          	sw	s2,16(sp)
8000e5e4:	01312623          	sw	s3,12(sp)
8000e5e8:	00112e23          	sw	ra,28(sp)
8000e5ec:	1007f793          	andi	a5,a5,256
8000e5f0:	00050493          	mv	s1,a0
8000e5f4:	00058413          	mv	s0,a1
8000e5f8:	00060913          	mv	s2,a2
8000e5fc:	00068993          	mv	s3,a3
8000e600:	00078a63          	beqz	a5,8000e614 <__swrite+0x44>
8000e604:	00e59583          	lh	a1,14(a1)
8000e608:	00200693          	li	a3,2
8000e60c:	00000613          	li	a2,0
8000e610:	3cc000ef          	jal	ra,8000e9dc <_lseek_r>
8000e614:	00c45783          	lhu	a5,12(s0)
8000e618:	fffff737          	lui	a4,0xfffff
8000e61c:	fff70713          	addi	a4,a4,-1 # ffffefff <_heap_end+0x7ffecfff>
8000e620:	00e7f7b3          	and	a5,a5,a4
8000e624:	00f41623          	sh	a5,12(s0)
8000e628:	00e41583          	lh	a1,14(s0)
8000e62c:	01812403          	lw	s0,24(sp)
8000e630:	01c12083          	lw	ra,28(sp)
8000e634:	00098693          	mv	a3,s3
8000e638:	00090613          	mv	a2,s2
8000e63c:	00c12983          	lw	s3,12(sp)
8000e640:	01012903          	lw	s2,16(sp)
8000e644:	00048513          	mv	a0,s1
8000e648:	01412483          	lw	s1,20(sp)
8000e64c:	02010113          	addi	sp,sp,32
8000e650:	2fc0006f          	j	8000e94c <_write_r>

Disassembly of section .text.__sseek:

8000e654 <__sseek>:
8000e654:	ff010113          	addi	sp,sp,-16
8000e658:	00812423          	sw	s0,8(sp)
8000e65c:	00058413          	mv	s0,a1
8000e660:	00e59583          	lh	a1,14(a1)
8000e664:	00112623          	sw	ra,12(sp)
8000e668:	374000ef          	jal	ra,8000e9dc <_lseek_r>
8000e66c:	fff00793          	li	a5,-1
8000e670:	00c45703          	lhu	a4,12(s0)
8000e674:	02f51263          	bne	a0,a5,8000e698 <__sseek+0x44>
8000e678:	fffff7b7          	lui	a5,0xfffff
8000e67c:	fff78793          	addi	a5,a5,-1 # ffffefff <_heap_end+0x7ffecfff>
8000e680:	00e7f7b3          	and	a5,a5,a4
8000e684:	00f41623          	sh	a5,12(s0)
8000e688:	00c12083          	lw	ra,12(sp)
8000e68c:	00812403          	lw	s0,8(sp)
8000e690:	01010113          	addi	sp,sp,16
8000e694:	00008067          	ret
8000e698:	000017b7          	lui	a5,0x1
8000e69c:	00f767b3          	or	a5,a4,a5
8000e6a0:	00f41623          	sh	a5,12(s0)
8000e6a4:	04a42a23          	sw	a0,84(s0)
8000e6a8:	fe1ff06f          	j	8000e688 <__sseek+0x34>

Disassembly of section .text.__sclose:

8000e6ac <__sclose>:
8000e6ac:	00e59583          	lh	a1,14(a1)
8000e6b0:	2e80006f          	j	8000e998 <_close_r>

Disassembly of section .text.strlen:

8000e6b4 <strlen>:
8000e6b4:	00050793          	mv	a5,a0
8000e6b8:	00178793          	addi	a5,a5,1 # 1001 <_stack_size+0x801>
8000e6bc:	fff7c703          	lbu	a4,-1(a5)
8000e6c0:	fe071ce3          	bnez	a4,8000e6b8 <strlen+0x4>
8000e6c4:	40a78533          	sub	a0,a5,a0
8000e6c8:	fff50513          	addi	a0,a0,-1
8000e6cc:	00008067          	ret

Disassembly of section .text.strncmp:

8000e6d0 <strncmp>:
8000e6d0:	02060a63          	beqz	a2,8000e704 <strncmp+0x34>
8000e6d4:	fff60613          	addi	a2,a2,-1
8000e6d8:	00000713          	li	a4,0
8000e6dc:	00e507b3          	add	a5,a0,a4
8000e6e0:	00e586b3          	add	a3,a1,a4
8000e6e4:	0007c783          	lbu	a5,0(a5)
8000e6e8:	0006c683          	lbu	a3,0(a3)
8000e6ec:	00d79863          	bne	a5,a3,8000e6fc <strncmp+0x2c>
8000e6f0:	00c70663          	beq	a4,a2,8000e6fc <strncmp+0x2c>
8000e6f4:	00170713          	addi	a4,a4,1
8000e6f8:	fe0792e3          	bnez	a5,8000e6dc <strncmp+0xc>
8000e6fc:	40d78533          	sub	a0,a5,a3
8000e700:	00008067          	ret
8000e704:	00000513          	li	a0,0
8000e708:	00008067          	ret

Disassembly of section .text._strtol_l.isra.0:

8000e70c <_strtol_l.isra.0>:
8000e70c:	fc010113          	addi	sp,sp,-64
8000e710:	03212823          	sw	s2,48(sp)
8000e714:	03512223          	sw	s5,36(sp)
8000e718:	03612023          	sw	s6,32(sp)
8000e71c:	01812c23          	sw	s8,24(sp)
8000e720:	00068913          	mv	s2,a3
8000e724:	02112e23          	sw	ra,60(sp)
8000e728:	02812c23          	sw	s0,56(sp)
8000e72c:	02912a23          	sw	s1,52(sp)
8000e730:	03312623          	sw	s3,44(sp)
8000e734:	03412423          	sw	s4,40(sp)
8000e738:	01712e23          	sw	s7,28(sp)
8000e73c:	01912a23          	sw	s9,20(sp)
8000e740:	01a12823          	sw	s10,16(sp)
8000e744:	01b12623          	sw	s11,12(sp)
8000e748:	00050a93          	mv	s5,a0
8000e74c:	00058b13          	mv	s6,a1
8000e750:	00060c13          	mv	s8,a2
8000e754:	00058793          	mv	a5,a1
8000e758:	ffff4697          	auipc	a3,0xffff4
8000e75c:	51968693          	addi	a3,a3,1305 # 80002c71 <_ctype_+0x1>
8000e760:	00178493          	addi	s1,a5,1
8000e764:	fff4c403          	lbu	s0,-1(s1)
8000e768:	00d40733          	add	a4,s0,a3
8000e76c:	00074703          	lbu	a4,0(a4)
8000e770:	00877713          	andi	a4,a4,8
8000e774:	0c071863          	bnez	a4,8000e844 <_strtol_l.isra.0+0x138>
8000e778:	02d00713          	li	a4,45
8000e77c:	0ce41863          	bne	s0,a4,8000e84c <_strtol_l.isra.0+0x140>
8000e780:	0004c403          	lbu	s0,0(s1)
8000e784:	00100a13          	li	s4,1
8000e788:	00278493          	addi	s1,a5,2
8000e78c:	16090e63          	beqz	s2,8000e908 <_strtol_l.isra.0+0x1fc>
8000e790:	01000793          	li	a5,16
8000e794:	02f91463          	bne	s2,a5,8000e7bc <_strtol_l.isra.0+0xb0>
8000e798:	03000793          	li	a5,48
8000e79c:	02f41063          	bne	s0,a5,8000e7bc <_strtol_l.isra.0+0xb0>
8000e7a0:	0004c783          	lbu	a5,0(s1)
8000e7a4:	05800713          	li	a4,88
8000e7a8:	0df7f793          	andi	a5,a5,223
8000e7ac:	14e79663          	bne	a5,a4,8000e8f8 <_strtol_l.isra.0+0x1ec>
8000e7b0:	0014c403          	lbu	s0,1(s1)
8000e7b4:	01000913          	li	s2,16
8000e7b8:	00248493          	addi	s1,s1,2
8000e7bc:	800009b7          	lui	s3,0x80000
8000e7c0:	000a1463          	bnez	s4,8000e7c8 <_strtol_l.isra.0+0xbc>
8000e7c4:	fff9c993          	not	s3,s3
8000e7c8:	00090593          	mv	a1,s2
8000e7cc:	00098513          	mv	a0,s3
8000e7d0:	995fe0ef          	jal	ra,8000d164 <__umodsi3>
8000e7d4:	00050b93          	mv	s7,a0
8000e7d8:	00090593          	mv	a1,s2
8000e7dc:	00098513          	mv	a0,s3
8000e7e0:	93dfe0ef          	jal	ra,8000d11c <__udivsi3>
8000e7e4:	00050c93          	mv	s9,a0
8000e7e8:	00000713          	li	a4,0
8000e7ec:	00000513          	li	a0,0
8000e7f0:	00900d93          	li	s11,9
8000e7f4:	01900d13          	li	s10,25
8000e7f8:	fff00693          	li	a3,-1
8000e7fc:	fd040793          	addi	a5,s0,-48
8000e800:	06fde463          	bltu	s11,a5,8000e868 <_strtol_l.isra.0+0x15c>
8000e804:	00078413          	mv	s0,a5
8000e808:	09245063          	bge	s0,s2,8000e888 <_strtol_l.isra.0+0x17c>
8000e80c:	02d70663          	beq	a4,a3,8000e838 <_strtol_l.isra.0+0x12c>
8000e810:	fff00713          	li	a4,-1
8000e814:	02ace263          	bltu	s9,a0,8000e838 <_strtol_l.isra.0+0x12c>
8000e818:	00ac9463          	bne	s9,a0,8000e820 <_strtol_l.isra.0+0x114>
8000e81c:	008bce63          	blt	s7,s0,8000e838 <_strtol_l.isra.0+0x12c>
8000e820:	00050593          	mv	a1,a0
8000e824:	00090513          	mv	a0,s2
8000e828:	8c9fe0ef          	jal	ra,8000d0f0 <__mulsi3>
8000e82c:	00a40533          	add	a0,s0,a0
8000e830:	00100713          	li	a4,1
8000e834:	fff00693          	li	a3,-1
8000e838:	00148493          	addi	s1,s1,1
8000e83c:	fff4c403          	lbu	s0,-1(s1)
8000e840:	fbdff06f          	j	8000e7fc <_strtol_l.isra.0+0xf0>
8000e844:	00048793          	mv	a5,s1
8000e848:	f19ff06f          	j	8000e760 <_strtol_l.isra.0+0x54>
8000e84c:	02b00713          	li	a4,43
8000e850:	00e40663          	beq	s0,a4,8000e85c <_strtol_l.isra.0+0x150>
8000e854:	00000a13          	li	s4,0
8000e858:	f35ff06f          	j	8000e78c <_strtol_l.isra.0+0x80>
8000e85c:	0004c403          	lbu	s0,0(s1)
8000e860:	00278493          	addi	s1,a5,2
8000e864:	ff1ff06f          	j	8000e854 <_strtol_l.isra.0+0x148>
8000e868:	fbf40793          	addi	a5,s0,-65
8000e86c:	00fd6663          	bltu	s10,a5,8000e878 <_strtol_l.isra.0+0x16c>
8000e870:	fc940413          	addi	s0,s0,-55
8000e874:	f95ff06f          	j	8000e808 <_strtol_l.isra.0+0xfc>
8000e878:	f9f40793          	addi	a5,s0,-97
8000e87c:	00fd6663          	bltu	s10,a5,8000e888 <_strtol_l.isra.0+0x17c>
8000e880:	fa940413          	addi	s0,s0,-87
8000e884:	f85ff06f          	j	8000e808 <_strtol_l.isra.0+0xfc>
8000e888:	fff00793          	li	a5,-1
8000e88c:	04f71863          	bne	a4,a5,8000e8dc <_strtol_l.isra.0+0x1d0>
8000e890:	02200793          	li	a5,34
8000e894:	00faa023          	sw	a5,0(s5)
8000e898:	00098513          	mv	a0,s3
8000e89c:	040c1863          	bnez	s8,8000e8ec <_strtol_l.isra.0+0x1e0>
8000e8a0:	03c12083          	lw	ra,60(sp)
8000e8a4:	03812403          	lw	s0,56(sp)
8000e8a8:	03412483          	lw	s1,52(sp)
8000e8ac:	03012903          	lw	s2,48(sp)
8000e8b0:	02c12983          	lw	s3,44(sp)
8000e8b4:	02812a03          	lw	s4,40(sp)
8000e8b8:	02412a83          	lw	s5,36(sp)
8000e8bc:	02012b03          	lw	s6,32(sp)
8000e8c0:	01c12b83          	lw	s7,28(sp)
8000e8c4:	01812c03          	lw	s8,24(sp)
8000e8c8:	01412c83          	lw	s9,20(sp)
8000e8cc:	01012d03          	lw	s10,16(sp)
8000e8d0:	00c12d83          	lw	s11,12(sp)
8000e8d4:	04010113          	addi	sp,sp,64
8000e8d8:	00008067          	ret
8000e8dc:	000a0463          	beqz	s4,8000e8e4 <_strtol_l.isra.0+0x1d8>
8000e8e0:	40a00533          	neg	a0,a0
8000e8e4:	fa0c0ee3          	beqz	s8,8000e8a0 <_strtol_l.isra.0+0x194>
8000e8e8:	00070463          	beqz	a4,8000e8f0 <_strtol_l.isra.0+0x1e4>
8000e8ec:	fff48b13          	addi	s6,s1,-1
8000e8f0:	016c2023          	sw	s6,0(s8)
8000e8f4:	fadff06f          	j	8000e8a0 <_strtol_l.isra.0+0x194>
8000e8f8:	03000413          	li	s0,48
8000e8fc:	ec0910e3          	bnez	s2,8000e7bc <_strtol_l.isra.0+0xb0>
8000e900:	00800913          	li	s2,8
8000e904:	eb9ff06f          	j	8000e7bc <_strtol_l.isra.0+0xb0>
8000e908:	03000793          	li	a5,48
8000e90c:	e8f40ae3          	beq	s0,a5,8000e7a0 <_strtol_l.isra.0+0x94>
8000e910:	00a00913          	li	s2,10
8000e914:	ea9ff06f          	j	8000e7bc <_strtol_l.isra.0+0xb0>

Disassembly of section .text._strtol_r:

8000e918 <_strtol_r>:
8000e918:	df5ff06f          	j	8000e70c <_strtol_l.isra.0>

Disassembly of section .text.strtol_l:

8000e91c <strtol_l>:
8000e91c:	80c18793          	addi	a5,gp,-2036 # 80002fac <_impure_ptr>
8000e920:	00060693          	mv	a3,a2
8000e924:	00058613          	mv	a2,a1
8000e928:	00050593          	mv	a1,a0
8000e92c:	0007a503          	lw	a0,0(a5)
8000e930:	dddff06f          	j	8000e70c <_strtol_l.isra.0>

Disassembly of section .text.strtol:

8000e934 <strtol>:
8000e934:	80c18793          	addi	a5,gp,-2036 # 80002fac <_impure_ptr>
8000e938:	00060693          	mv	a3,a2
8000e93c:	00058613          	mv	a2,a1
8000e940:	00050593          	mv	a1,a0
8000e944:	0007a503          	lw	a0,0(a5)
8000e948:	dc5ff06f          	j	8000e70c <_strtol_l.isra.0>

Disassembly of section .text._write_r:

8000e94c <_write_r>:
8000e94c:	ff010113          	addi	sp,sp,-16
8000e950:	00812423          	sw	s0,8(sp)
8000e954:	00050413          	mv	s0,a0
8000e958:	00058513          	mv	a0,a1
8000e95c:	00060593          	mv	a1,a2
8000e960:	00068613          	mv	a2,a3
8000e964:	c201aa23          	sw	zero,-972(gp) # 800033d4 <errno>
8000e968:	00112623          	sw	ra,12(sp)
8000e96c:	928f70ef          	jal	ra,80005a94 <_write>
8000e970:	fff00793          	li	a5,-1
8000e974:	00f51a63          	bne	a0,a5,8000e988 <_write_r+0x3c>
8000e978:	c3418793          	addi	a5,gp,-972 # 800033d4 <errno>
8000e97c:	0007a783          	lw	a5,0(a5)
8000e980:	00078463          	beqz	a5,8000e988 <_write_r+0x3c>
8000e984:	00f42023          	sw	a5,0(s0)
8000e988:	00c12083          	lw	ra,12(sp)
8000e98c:	00812403          	lw	s0,8(sp)
8000e990:	01010113          	addi	sp,sp,16
8000e994:	00008067          	ret

Disassembly of section .text._close_r:

8000e998 <_close_r>:
8000e998:	ff010113          	addi	sp,sp,-16
8000e99c:	00812423          	sw	s0,8(sp)
8000e9a0:	00050413          	mv	s0,a0
8000e9a4:	00058513          	mv	a0,a1
8000e9a8:	c201aa23          	sw	zero,-972(gp) # 800033d4 <errno>
8000e9ac:	00112623          	sw	ra,12(sp)
8000e9b0:	920f70ef          	jal	ra,80005ad0 <_close>
8000e9b4:	fff00793          	li	a5,-1
8000e9b8:	00f51a63          	bne	a0,a5,8000e9cc <_close_r+0x34>
8000e9bc:	c3418793          	addi	a5,gp,-972 # 800033d4 <errno>
8000e9c0:	0007a783          	lw	a5,0(a5)
8000e9c4:	00078463          	beqz	a5,8000e9cc <_close_r+0x34>
8000e9c8:	00f42023          	sw	a5,0(s0)
8000e9cc:	00c12083          	lw	ra,12(sp)
8000e9d0:	00812403          	lw	s0,8(sp)
8000e9d4:	01010113          	addi	sp,sp,16
8000e9d8:	00008067          	ret

Disassembly of section .text._lseek_r:

8000e9dc <_lseek_r>:
8000e9dc:	ff010113          	addi	sp,sp,-16
8000e9e0:	00812423          	sw	s0,8(sp)
8000e9e4:	00050413          	mv	s0,a0
8000e9e8:	00058513          	mv	a0,a1
8000e9ec:	00060593          	mv	a1,a2
8000e9f0:	00068613          	mv	a2,a3
8000e9f4:	c201aa23          	sw	zero,-972(gp) # 800033d4 <errno>
8000e9f8:	00112623          	sw	ra,12(sp)
8000e9fc:	8dcf70ef          	jal	ra,80005ad8 <_lseek>
8000ea00:	fff00793          	li	a5,-1
8000ea04:	00f51a63          	bne	a0,a5,8000ea18 <_lseek_r+0x3c>
8000ea08:	c3418793          	addi	a5,gp,-972 # 800033d4 <errno>
8000ea0c:	0007a783          	lw	a5,0(a5)
8000ea10:	00078463          	beqz	a5,8000ea18 <_lseek_r+0x3c>
8000ea14:	00f42023          	sw	a5,0(s0)
8000ea18:	00c12083          	lw	ra,12(sp)
8000ea1c:	00812403          	lw	s0,8(sp)
8000ea20:	01010113          	addi	sp,sp,16
8000ea24:	00008067          	ret

Disassembly of section .text.__ssputs_r:

8000ea28 <__ssputs_r>:
8000ea28:	fe010113          	addi	sp,sp,-32
8000ea2c:	01212823          	sw	s2,16(sp)
8000ea30:	0085a903          	lw	s2,8(a1)
8000ea34:	00812c23          	sw	s0,24(sp)
8000ea38:	01412423          	sw	s4,8(sp)
8000ea3c:	01612023          	sw	s6,0(sp)
8000ea40:	00112e23          	sw	ra,28(sp)
8000ea44:	00912a23          	sw	s1,20(sp)
8000ea48:	01312623          	sw	s3,12(sp)
8000ea4c:	01512223          	sw	s5,4(sp)
8000ea50:	00058413          	mv	s0,a1
8000ea54:	00060b13          	mv	s6,a2
8000ea58:	00068a13          	mv	s4,a3
8000ea5c:	0f26e063          	bltu	a3,s2,8000eb3c <__ssputs_r+0x114>
8000ea60:	00c5d783          	lhu	a5,12(a1)
8000ea64:	4807f713          	andi	a4,a5,1152
8000ea68:	0c070863          	beqz	a4,8000eb38 <__ssputs_r+0x110>
8000ea6c:	00042483          	lw	s1,0(s0)
8000ea70:	01442703          	lw	a4,20(s0)
8000ea74:	0105a583          	lw	a1,16(a1)
8000ea78:	00050a93          	mv	s5,a0
8000ea7c:	40b489b3          	sub	s3,s1,a1
8000ea80:	00171493          	slli	s1,a4,0x1
8000ea84:	00e48733          	add	a4,s1,a4
8000ea88:	01f75493          	srli	s1,a4,0x1f
8000ea8c:	00e484b3          	add	s1,s1,a4
8000ea90:	00168713          	addi	a4,a3,1
8000ea94:	4014d493          	srai	s1,s1,0x1
8000ea98:	01370733          	add	a4,a4,s3
8000ea9c:	00e4f463          	bgeu	s1,a4,8000eaa4 <__ssputs_r+0x7c>
8000eaa0:	00070493          	mv	s1,a4
8000eaa4:	4007f793          	andi	a5,a5,1024
8000eaa8:	0c078463          	beqz	a5,8000eb70 <__ssputs_r+0x148>
8000eaac:	00048593          	mv	a1,s1
8000eab0:	000a8513          	mv	a0,s5
8000eab4:	e14ff0ef          	jal	ra,8000e0c8 <_malloc_r>
8000eab8:	00050913          	mv	s2,a0
8000eabc:	04051263          	bnez	a0,8000eb00 <__ssputs_r+0xd8>
8000eac0:	00c00793          	li	a5,12
8000eac4:	00faa023          	sw	a5,0(s5)
8000eac8:	00c45783          	lhu	a5,12(s0)
8000eacc:	fff00513          	li	a0,-1
8000ead0:	0407e793          	ori	a5,a5,64
8000ead4:	00f41623          	sh	a5,12(s0)
8000ead8:	01c12083          	lw	ra,28(sp)
8000eadc:	01812403          	lw	s0,24(sp)
8000eae0:	01412483          	lw	s1,20(sp)
8000eae4:	01012903          	lw	s2,16(sp)
8000eae8:	00c12983          	lw	s3,12(sp)
8000eaec:	00812a03          	lw	s4,8(sp)
8000eaf0:	00412a83          	lw	s5,4(sp)
8000eaf4:	00012b03          	lw	s6,0(sp)
8000eaf8:	02010113          	addi	sp,sp,32
8000eafc:	00008067          	ret
8000eb00:	01042583          	lw	a1,16(s0)
8000eb04:	00098613          	mv	a2,s3
8000eb08:	b34ff0ef          	jal	ra,8000de3c <memcpy>
8000eb0c:	00c45783          	lhu	a5,12(s0)
8000eb10:	b7f7f793          	andi	a5,a5,-1153
8000eb14:	0807e793          	ori	a5,a5,128
8000eb18:	00f41623          	sh	a5,12(s0)
8000eb1c:	01242823          	sw	s2,16(s0)
8000eb20:	00942a23          	sw	s1,20(s0)
8000eb24:	01390933          	add	s2,s2,s3
8000eb28:	413484b3          	sub	s1,s1,s3
8000eb2c:	01242023          	sw	s2,0(s0)
8000eb30:	00942423          	sw	s1,8(s0)
8000eb34:	000a0913          	mv	s2,s4
8000eb38:	012a7463          	bgeu	s4,s2,8000eb40 <__ssputs_r+0x118>
8000eb3c:	000a0913          	mv	s2,s4
8000eb40:	00042503          	lw	a0,0(s0)
8000eb44:	00090613          	mv	a2,s2
8000eb48:	000b0593          	mv	a1,s6
8000eb4c:	bc8ff0ef          	jal	ra,8000df14 <memmove>
8000eb50:	00842783          	lw	a5,8(s0)
8000eb54:	00000513          	li	a0,0
8000eb58:	412787b3          	sub	a5,a5,s2
8000eb5c:	00f42423          	sw	a5,8(s0)
8000eb60:	00042783          	lw	a5,0(s0)
8000eb64:	01278933          	add	s2,a5,s2
8000eb68:	01242023          	sw	s2,0(s0)
8000eb6c:	f6dff06f          	j	8000ead8 <__ssputs_r+0xb0>
8000eb70:	00048613          	mv	a2,s1
8000eb74:	000a8513          	mv	a0,s5
8000eb78:	2a9010ef          	jal	ra,80010620 <_realloc_r>
8000eb7c:	00050913          	mv	s2,a0
8000eb80:	f8051ee3          	bnez	a0,8000eb1c <__ssputs_r+0xf4>
8000eb84:	01042583          	lw	a1,16(s0)
8000eb88:	000a8513          	mv	a0,s5
8000eb8c:	c38ff0ef          	jal	ra,8000dfc4 <_free_r>
8000eb90:	f31ff06f          	j	8000eac0 <__ssputs_r+0x98>

Disassembly of section .text.__ssprint_r:

8000eb94 <__ssprint_r>:
8000eb94:	00862783          	lw	a5,8(a2)
8000eb98:	fd010113          	addi	sp,sp,-48
8000eb9c:	01312e23          	sw	s3,28(sp)
8000eba0:	02112623          	sw	ra,44(sp)
8000eba4:	02812423          	sw	s0,40(sp)
8000eba8:	02912223          	sw	s1,36(sp)
8000ebac:	03212023          	sw	s2,32(sp)
8000ebb0:	01412c23          	sw	s4,24(sp)
8000ebb4:	01512a23          	sw	s5,20(sp)
8000ebb8:	01612823          	sw	s6,16(sp)
8000ebbc:	01712623          	sw	s7,12(sp)
8000ebc0:	01812423          	sw	s8,8(sp)
8000ebc4:	00060993          	mv	s3,a2
8000ebc8:	12078663          	beqz	a5,8000ecf4 <__ssprint_r+0x160>
8000ebcc:	00062b03          	lw	s6,0(a2)
8000ebd0:	00050a93          	mv	s5,a0
8000ebd4:	00058413          	mv	s0,a1
8000ebd8:	00000b93          	li	s7,0
8000ebdc:	00000913          	li	s2,0
8000ebe0:	08090663          	beqz	s2,8000ec6c <__ssprint_r+0xd8>
8000ebe4:	00842a03          	lw	s4,8(s0)
8000ebe8:	0d496663          	bltu	s2,s4,8000ecb4 <__ssprint_r+0x120>
8000ebec:	00c45783          	lhu	a5,12(s0)
8000ebf0:	4807f713          	andi	a4,a5,1152
8000ebf4:	0c070063          	beqz	a4,8000ecb4 <__ssprint_r+0x120>
8000ebf8:	00042483          	lw	s1,0(s0)
8000ebfc:	01442703          	lw	a4,20(s0)
8000ec00:	01042583          	lw	a1,16(s0)
8000ec04:	40b48c33          	sub	s8,s1,a1
8000ec08:	00171493          	slli	s1,a4,0x1
8000ec0c:	00e48733          	add	a4,s1,a4
8000ec10:	01f75493          	srli	s1,a4,0x1f
8000ec14:	00e484b3          	add	s1,s1,a4
8000ec18:	001c0713          	addi	a4,s8,1
8000ec1c:	4014d493          	srai	s1,s1,0x1
8000ec20:	01270733          	add	a4,a4,s2
8000ec24:	00e4f463          	bgeu	s1,a4,8000ec2c <__ssprint_r+0x98>
8000ec28:	00070493          	mv	s1,a4
8000ec2c:	4007f793          	andi	a5,a5,1024
8000ec30:	0e078e63          	beqz	a5,8000ed2c <__ssprint_r+0x198>
8000ec34:	00048593          	mv	a1,s1
8000ec38:	000a8513          	mv	a0,s5
8000ec3c:	c8cff0ef          	jal	ra,8000e0c8 <_malloc_r>
8000ec40:	00050a13          	mv	s4,a0
8000ec44:	02051c63          	bnez	a0,8000ec7c <__ssprint_r+0xe8>
8000ec48:	00c00793          	li	a5,12
8000ec4c:	00faa023          	sw	a5,0(s5)
8000ec50:	00c45783          	lhu	a5,12(s0)
8000ec54:	fff00513          	li	a0,-1
8000ec58:	0407e793          	ori	a5,a5,64
8000ec5c:	00f41623          	sh	a5,12(s0)
8000ec60:	0009a423          	sw	zero,8(s3) # 80000008 <_heap_end+0xfffee008>
8000ec64:	0009a223          	sw	zero,4(s3)
8000ec68:	0940006f          	j	8000ecfc <__ssprint_r+0x168>
8000ec6c:	000b2b83          	lw	s7,0(s6)
8000ec70:	004b2903          	lw	s2,4(s6)
8000ec74:	008b0b13          	addi	s6,s6,8
8000ec78:	f69ff06f          	j	8000ebe0 <__ssprint_r+0x4c>
8000ec7c:	01042583          	lw	a1,16(s0)
8000ec80:	000c0613          	mv	a2,s8
8000ec84:	9b8ff0ef          	jal	ra,8000de3c <memcpy>
8000ec88:	00c45783          	lhu	a5,12(s0)
8000ec8c:	b7f7f793          	andi	a5,a5,-1153
8000ec90:	0807e793          	ori	a5,a5,128
8000ec94:	00f41623          	sh	a5,12(s0)
8000ec98:	01442823          	sw	s4,16(s0)
8000ec9c:	00942a23          	sw	s1,20(s0)
8000eca0:	018a0a33          	add	s4,s4,s8
8000eca4:	418484b3          	sub	s1,s1,s8
8000eca8:	01442023          	sw	s4,0(s0)
8000ecac:	00942423          	sw	s1,8(s0)
8000ecb0:	00090a13          	mv	s4,s2
8000ecb4:	01497463          	bgeu	s2,s4,8000ecbc <__ssprint_r+0x128>
8000ecb8:	00090a13          	mv	s4,s2
8000ecbc:	00042503          	lw	a0,0(s0)
8000ecc0:	000a0613          	mv	a2,s4
8000ecc4:	000b8593          	mv	a1,s7
8000ecc8:	a4cff0ef          	jal	ra,8000df14 <memmove>
8000eccc:	00842783          	lw	a5,8(s0)
8000ecd0:	414787b3          	sub	a5,a5,s4
8000ecd4:	00f42423          	sw	a5,8(s0)
8000ecd8:	00042783          	lw	a5,0(s0)
8000ecdc:	01478a33          	add	s4,a5,s4
8000ece0:	0089a783          	lw	a5,8(s3)
8000ece4:	01442023          	sw	s4,0(s0)
8000ece8:	41278933          	sub	s2,a5,s2
8000ecec:	0129a423          	sw	s2,8(s3)
8000ecf0:	f6091ee3          	bnez	s2,8000ec6c <__ssprint_r+0xd8>
8000ecf4:	0009a223          	sw	zero,4(s3)
8000ecf8:	00000513          	li	a0,0
8000ecfc:	02c12083          	lw	ra,44(sp)
8000ed00:	02812403          	lw	s0,40(sp)
8000ed04:	02412483          	lw	s1,36(sp)
8000ed08:	02012903          	lw	s2,32(sp)
8000ed0c:	01c12983          	lw	s3,28(sp)
8000ed10:	01812a03          	lw	s4,24(sp)
8000ed14:	01412a83          	lw	s5,20(sp)
8000ed18:	01012b03          	lw	s6,16(sp)
8000ed1c:	00c12b83          	lw	s7,12(sp)
8000ed20:	00812c03          	lw	s8,8(sp)
8000ed24:	03010113          	addi	sp,sp,48
8000ed28:	00008067          	ret
8000ed2c:	00048613          	mv	a2,s1
8000ed30:	000a8513          	mv	a0,s5
8000ed34:	0ed010ef          	jal	ra,80010620 <_realloc_r>
8000ed38:	00050a13          	mv	s4,a0
8000ed3c:	f4051ee3          	bnez	a0,8000ec98 <__ssprint_r+0x104>
8000ed40:	01042583          	lw	a1,16(s0)
8000ed44:	000a8513          	mv	a0,s5
8000ed48:	a7cff0ef          	jal	ra,8000dfc4 <_free_r>
8000ed4c:	efdff06f          	j	8000ec48 <__ssprint_r+0xb4>

Disassembly of section .text._svfprintf_r:

8000ed50 <_svfiprintf_r>:
8000ed50:	00c5d783          	lhu	a5,12(a1)
8000ed54:	f5010113          	addi	sp,sp,-176
8000ed58:	0a912223          	sw	s1,164(sp)
8000ed5c:	0b212023          	sw	s2,160(sp)
8000ed60:	09312e23          	sw	s3,156(sp)
8000ed64:	0a112623          	sw	ra,172(sp)
8000ed68:	0a812423          	sw	s0,168(sp)
8000ed6c:	09412c23          	sw	s4,152(sp)
8000ed70:	09512a23          	sw	s5,148(sp)
8000ed74:	09612823          	sw	s6,144(sp)
8000ed78:	09712623          	sw	s7,140(sp)
8000ed7c:	09812423          	sw	s8,136(sp)
8000ed80:	09912223          	sw	s9,132(sp)
8000ed84:	0807f793          	andi	a5,a5,128
8000ed88:	00050993          	mv	s3,a0
8000ed8c:	00058913          	mv	s2,a1
8000ed90:	00060493          	mv	s1,a2
8000ed94:	06078863          	beqz	a5,8000ee04 <_svfiprintf_r+0xb4>
8000ed98:	0105a783          	lw	a5,16(a1)
8000ed9c:	06079463          	bnez	a5,8000ee04 <_svfiprintf_r+0xb4>
8000eda0:	04000593          	li	a1,64
8000eda4:	00d12623          	sw	a3,12(sp)
8000eda8:	b20ff0ef          	jal	ra,8000e0c8 <_malloc_r>
8000edac:	00a92023          	sw	a0,0(s2)
8000edb0:	00a92823          	sw	a0,16(s2)
8000edb4:	00c12683          	lw	a3,12(sp)
8000edb8:	04051263          	bnez	a0,8000edfc <_svfiprintf_r+0xac>
8000edbc:	00c00793          	li	a5,12
8000edc0:	00f9a023          	sw	a5,0(s3)
8000edc4:	fff00513          	li	a0,-1
8000edc8:	0ac12083          	lw	ra,172(sp)
8000edcc:	0a812403          	lw	s0,168(sp)
8000edd0:	0a412483          	lw	s1,164(sp)
8000edd4:	0a012903          	lw	s2,160(sp)
8000edd8:	09c12983          	lw	s3,156(sp)
8000eddc:	09812a03          	lw	s4,152(sp)
8000ede0:	09412a83          	lw	s5,148(sp)
8000ede4:	09012b03          	lw	s6,144(sp)
8000ede8:	08c12b83          	lw	s7,140(sp)
8000edec:	08812c03          	lw	s8,136(sp)
8000edf0:	08412c83          	lw	s9,132(sp)
8000edf4:	0b010113          	addi	sp,sp,176
8000edf8:	00008067          	ret
8000edfc:	04000793          	li	a5,64
8000ee00:	00f92a23          	sw	a5,20(s2)
8000ee04:	02000793          	li	a5,32
8000ee08:	02f10ca3          	sb	a5,57(sp)
8000ee0c:	03000793          	li	a5,48
8000ee10:	02012a23          	sw	zero,52(sp)
8000ee14:	02f10d23          	sb	a5,58(sp)
8000ee18:	00d12e23          	sw	a3,28(sp)
8000ee1c:	02500b13          	li	s6,37
8000ee20:	ffff4a97          	auipc	s5,0xffff4
8000ee24:	fb4a8a93          	addi	s5,s5,-76 # 80002dd4 <__sf_fake_stdout+0x20>
8000ee28:	00100b93          	li	s7,1
8000ee2c:	7fff1c17          	auipc	s8,0x7fff1
8000ee30:	1d4c0c13          	addi	s8,s8,468 # 0 <_heap_end+0x7ffee000>
8000ee34:	00048413          	mv	s0,s1
8000ee38:	00044783          	lbu	a5,0(s0)
8000ee3c:	00078463          	beqz	a5,8000ee44 <_svfiprintf_r+0xf4>
8000ee40:	0d679663          	bne	a5,s6,8000ef0c <_svfiprintf_r+0x1bc>
8000ee44:	40940cb3          	sub	s9,s0,s1
8000ee48:	020c8663          	beqz	s9,8000ee74 <_svfiprintf_r+0x124>
8000ee4c:	000c8693          	mv	a3,s9
8000ee50:	00048613          	mv	a2,s1
8000ee54:	00090593          	mv	a1,s2
8000ee58:	00098513          	mv	a0,s3
8000ee5c:	bcdff0ef          	jal	ra,8000ea28 <__ssputs_r>
8000ee60:	fff00793          	li	a5,-1
8000ee64:	24f50e63          	beq	a0,a5,8000f0c0 <_svfiprintf_r+0x370>
8000ee68:	03412683          	lw	a3,52(sp)
8000ee6c:	019686b3          	add	a3,a3,s9
8000ee70:	02d12a23          	sw	a3,52(sp)
8000ee74:	00044783          	lbu	a5,0(s0)
8000ee78:	24078463          	beqz	a5,8000f0c0 <_svfiprintf_r+0x370>
8000ee7c:	fff00793          	li	a5,-1
8000ee80:	00140493          	addi	s1,s0,1
8000ee84:	02012023          	sw	zero,32(sp)
8000ee88:	02012623          	sw	zero,44(sp)
8000ee8c:	02f12223          	sw	a5,36(sp)
8000ee90:	02012423          	sw	zero,40(sp)
8000ee94:	060101a3          	sb	zero,99(sp)
8000ee98:	06012c23          	sw	zero,120(sp)
8000ee9c:	0004c583          	lbu	a1,0(s1)
8000eea0:	00500613          	li	a2,5
8000eea4:	000a8513          	mv	a0,s5
8000eea8:	754010ef          	jal	ra,800105fc <memchr>
8000eeac:	00148413          	addi	s0,s1,1
8000eeb0:	02012783          	lw	a5,32(sp)
8000eeb4:	06051063          	bnez	a0,8000ef14 <_svfiprintf_r+0x1c4>
8000eeb8:	0107f713          	andi	a4,a5,16
8000eebc:	00070663          	beqz	a4,8000eec8 <_svfiprintf_r+0x178>
8000eec0:	02000713          	li	a4,32
8000eec4:	06e101a3          	sb	a4,99(sp)
8000eec8:	0087f713          	andi	a4,a5,8
8000eecc:	00070663          	beqz	a4,8000eed8 <_svfiprintf_r+0x188>
8000eed0:	02b00713          	li	a4,43
8000eed4:	06e101a3          	sb	a4,99(sp)
8000eed8:	0004c683          	lbu	a3,0(s1)
8000eedc:	02a00713          	li	a4,42
8000eee0:	04e68663          	beq	a3,a4,8000ef2c <_svfiprintf_r+0x1dc>
8000eee4:	02c12703          	lw	a4,44(sp)
8000eee8:	00048413          	mv	s0,s1
8000eeec:	00000793          	li	a5,0
8000eef0:	00900613          	li	a2,9
8000eef4:	00044683          	lbu	a3,0(s0)
8000eef8:	00140593          	addi	a1,s0,1
8000eefc:	fd068693          	addi	a3,a3,-48
8000ef00:	10d67a63          	bgeu	a2,a3,8000f014 <_svfiprintf_r+0x2c4>
8000ef04:	02079e63          	bnez	a5,8000ef40 <_svfiprintf_r+0x1f0>
8000ef08:	0500006f          	j	8000ef58 <_svfiprintf_r+0x208>
8000ef0c:	00140413          	addi	s0,s0,1
8000ef10:	f29ff06f          	j	8000ee38 <_svfiprintf_r+0xe8>
8000ef14:	41550533          	sub	a0,a0,s5
8000ef18:	00ab9533          	sll	a0,s7,a0
8000ef1c:	00a7e7b3          	or	a5,a5,a0
8000ef20:	02f12023          	sw	a5,32(sp)
8000ef24:	00040493          	mv	s1,s0
8000ef28:	f75ff06f          	j	8000ee9c <_svfiprintf_r+0x14c>
8000ef2c:	01c12703          	lw	a4,28(sp)
8000ef30:	00470693          	addi	a3,a4,4
8000ef34:	00072703          	lw	a4,0(a4)
8000ef38:	00d12e23          	sw	a3,28(sp)
8000ef3c:	00074663          	bltz	a4,8000ef48 <_svfiprintf_r+0x1f8>
8000ef40:	02e12623          	sw	a4,44(sp)
8000ef44:	0140006f          	j	8000ef58 <_svfiprintf_r+0x208>
8000ef48:	40e00733          	neg	a4,a4
8000ef4c:	0027e793          	ori	a5,a5,2
8000ef50:	02e12623          	sw	a4,44(sp)
8000ef54:	02f12023          	sw	a5,32(sp)
8000ef58:	00044703          	lbu	a4,0(s0)
8000ef5c:	02e00793          	li	a5,46
8000ef60:	02f71663          	bne	a4,a5,8000ef8c <_svfiprintf_r+0x23c>
8000ef64:	00144703          	lbu	a4,1(s0)
8000ef68:	02a00793          	li	a5,42
8000ef6c:	0cf71663          	bne	a4,a5,8000f038 <_svfiprintf_r+0x2e8>
8000ef70:	01c12783          	lw	a5,28(sp)
8000ef74:	00240413          	addi	s0,s0,2
8000ef78:	00478713          	addi	a4,a5,4
8000ef7c:	0007a783          	lw	a5,0(a5)
8000ef80:	00e12e23          	sw	a4,28(sp)
8000ef84:	0a07c663          	bltz	a5,8000f030 <_svfiprintf_r+0x2e0>
8000ef88:	02f12223          	sw	a5,36(sp)
8000ef8c:	00044583          	lbu	a1,0(s0)
8000ef90:	00300613          	li	a2,3
8000ef94:	ffff4517          	auipc	a0,0xffff4
8000ef98:	e4850513          	addi	a0,a0,-440 # 80002ddc <__sf_fake_stdout+0x28>
8000ef9c:	660010ef          	jal	ra,800105fc <memchr>
8000efa0:	02050463          	beqz	a0,8000efc8 <_svfiprintf_r+0x278>
8000efa4:	ffff4797          	auipc	a5,0xffff4
8000efa8:	e3878793          	addi	a5,a5,-456 # 80002ddc <__sf_fake_stdout+0x28>
8000efac:	40f50533          	sub	a0,a0,a5
8000efb0:	04000793          	li	a5,64
8000efb4:	00a797b3          	sll	a5,a5,a0
8000efb8:	02012503          	lw	a0,32(sp)
8000efbc:	00140413          	addi	s0,s0,1
8000efc0:	00f56533          	or	a0,a0,a5
8000efc4:	02a12023          	sw	a0,32(sp)
8000efc8:	00044583          	lbu	a1,0(s0)
8000efcc:	00600613          	li	a2,6
8000efd0:	ffff4517          	auipc	a0,0xffff4
8000efd4:	e1050513          	addi	a0,a0,-496 # 80002de0 <__sf_fake_stdout+0x2c>
8000efd8:	00140493          	addi	s1,s0,1
8000efdc:	02b10c23          	sb	a1,56(sp)
8000efe0:	61c010ef          	jal	ra,800105fc <memchr>
8000efe4:	0e050a63          	beqz	a0,8000f0d8 <_svfiprintf_r+0x388>
8000efe8:	0a0c1663          	bnez	s8,8000f094 <_svfiprintf_r+0x344>
8000efec:	02012703          	lw	a4,32(sp)
8000eff0:	01c12783          	lw	a5,28(sp)
8000eff4:	10077713          	andi	a4,a4,256
8000eff8:	08070663          	beqz	a4,8000f084 <_svfiprintf_r+0x334>
8000effc:	00478793          	addi	a5,a5,4
8000f000:	00f12e23          	sw	a5,28(sp)
8000f004:	03412783          	lw	a5,52(sp)
8000f008:	014787b3          	add	a5,a5,s4
8000f00c:	02f12a23          	sw	a5,52(sp)
8000f010:	e25ff06f          	j	8000ee34 <_svfiprintf_r+0xe4>
8000f014:	00271793          	slli	a5,a4,0x2
8000f018:	00e787b3          	add	a5,a5,a4
8000f01c:	00179793          	slli	a5,a5,0x1
8000f020:	00d78733          	add	a4,a5,a3
8000f024:	00058413          	mv	s0,a1
8000f028:	00100793          	li	a5,1
8000f02c:	ec9ff06f          	j	8000eef4 <_svfiprintf_r+0x1a4>
8000f030:	fff00793          	li	a5,-1
8000f034:	f55ff06f          	j	8000ef88 <_svfiprintf_r+0x238>
8000f038:	00140413          	addi	s0,s0,1
8000f03c:	02012223          	sw	zero,36(sp)
8000f040:	00000793          	li	a5,0
8000f044:	00000713          	li	a4,0
8000f048:	00900613          	li	a2,9
8000f04c:	00044683          	lbu	a3,0(s0)
8000f050:	00140593          	addi	a1,s0,1
8000f054:	fd068693          	addi	a3,a3,-48
8000f058:	00d67863          	bgeu	a2,a3,8000f068 <_svfiprintf_r+0x318>
8000f05c:	f20788e3          	beqz	a5,8000ef8c <_svfiprintf_r+0x23c>
8000f060:	02e12223          	sw	a4,36(sp)
8000f064:	f29ff06f          	j	8000ef8c <_svfiprintf_r+0x23c>
8000f068:	00271793          	slli	a5,a4,0x2
8000f06c:	00e787b3          	add	a5,a5,a4
8000f070:	00179793          	slli	a5,a5,0x1
8000f074:	00d78733          	add	a4,a5,a3
8000f078:	00058413          	mv	s0,a1
8000f07c:	00100793          	li	a5,1
8000f080:	fcdff06f          	j	8000f04c <_svfiprintf_r+0x2fc>
8000f084:	00778793          	addi	a5,a5,7
8000f088:	ff87f793          	andi	a5,a5,-8
8000f08c:	00878793          	addi	a5,a5,8
8000f090:	f71ff06f          	j	8000f000 <_svfiprintf_r+0x2b0>
8000f094:	01c10713          	addi	a4,sp,28
8000f098:	00000697          	auipc	a3,0x0
8000f09c:	99068693          	addi	a3,a3,-1648 # 8000ea28 <__ssputs_r>
8000f0a0:	00090613          	mv	a2,s2
8000f0a4:	02010593          	addi	a1,sp,32
8000f0a8:	00098513          	mv	a0,s3
8000f0ac:	00000097          	auipc	ra,0x0
8000f0b0:	000000e7          	jalr	zero # 0 <_heap_size>
8000f0b4:	fff00793          	li	a5,-1
8000f0b8:	00050a13          	mv	s4,a0
8000f0bc:	f4f514e3          	bne	a0,a5,8000f004 <_svfiprintf_r+0x2b4>
8000f0c0:	00c95783          	lhu	a5,12(s2)
8000f0c4:	fff00513          	li	a0,-1
8000f0c8:	0407f793          	andi	a5,a5,64
8000f0cc:	ce079ee3          	bnez	a5,8000edc8 <_svfiprintf_r+0x78>
8000f0d0:	03412503          	lw	a0,52(sp)
8000f0d4:	cf5ff06f          	j	8000edc8 <_svfiprintf_r+0x78>
8000f0d8:	01c10713          	addi	a4,sp,28
8000f0dc:	00000697          	auipc	a3,0x0
8000f0e0:	94c68693          	addi	a3,a3,-1716 # 8000ea28 <__ssputs_r>
8000f0e4:	00090613          	mv	a2,s2
8000f0e8:	02010593          	addi	a1,sp,32
8000f0ec:	00098513          	mv	a0,s3
8000f0f0:	1b8000ef          	jal	ra,8000f2a8 <_printf_i>
8000f0f4:	fc1ff06f          	j	8000f0b4 <_svfiprintf_r+0x364>

Disassembly of section .text._printf_common:

8000f0f8 <_printf_common>:
8000f0f8:	fd010113          	addi	sp,sp,-48
8000f0fc:	01512a23          	sw	s5,20(sp)
8000f100:	0105a783          	lw	a5,16(a1)
8000f104:	00070a93          	mv	s5,a4
8000f108:	0085a703          	lw	a4,8(a1)
8000f10c:	02812423          	sw	s0,40(sp)
8000f110:	02912223          	sw	s1,36(sp)
8000f114:	01312e23          	sw	s3,28(sp)
8000f118:	01412c23          	sw	s4,24(sp)
8000f11c:	02112623          	sw	ra,44(sp)
8000f120:	03212023          	sw	s2,32(sp)
8000f124:	01612823          	sw	s6,16(sp)
8000f128:	01712623          	sw	s7,12(sp)
8000f12c:	00050993          	mv	s3,a0
8000f130:	00058413          	mv	s0,a1
8000f134:	00060493          	mv	s1,a2
8000f138:	00068a13          	mv	s4,a3
8000f13c:	00e7d463          	bge	a5,a4,8000f144 <_printf_common+0x4c>
8000f140:	00070793          	mv	a5,a4
8000f144:	00f4a023          	sw	a5,0(s1)
8000f148:	04344703          	lbu	a4,67(s0)
8000f14c:	00070663          	beqz	a4,8000f158 <_printf_common+0x60>
8000f150:	00178793          	addi	a5,a5,1
8000f154:	00f4a023          	sw	a5,0(s1)
8000f158:	00042783          	lw	a5,0(s0)
8000f15c:	0207f793          	andi	a5,a5,32
8000f160:	00078863          	beqz	a5,8000f170 <_printf_common+0x78>
8000f164:	0004a783          	lw	a5,0(s1)
8000f168:	00278793          	addi	a5,a5,2
8000f16c:	00f4a023          	sw	a5,0(s1)
8000f170:	00042903          	lw	s2,0(s0)
8000f174:	00697913          	andi	s2,s2,6
8000f178:	00091e63          	bnez	s2,8000f194 <_printf_common+0x9c>
8000f17c:	01940b13          	addi	s6,s0,25
8000f180:	fff00b93          	li	s7,-1
8000f184:	00c42783          	lw	a5,12(s0)
8000f188:	0004a703          	lw	a4,0(s1)
8000f18c:	40e787b3          	sub	a5,a5,a4
8000f190:	08f94263          	blt	s2,a5,8000f214 <_printf_common+0x11c>
8000f194:	00042783          	lw	a5,0(s0)
8000f198:	04344683          	lbu	a3,67(s0)
8000f19c:	0207f793          	andi	a5,a5,32
8000f1a0:	00d036b3          	snez	a3,a3
8000f1a4:	0c079063          	bnez	a5,8000f264 <_printf_common+0x16c>
8000f1a8:	04340613          	addi	a2,s0,67
8000f1ac:	000a0593          	mv	a1,s4
8000f1b0:	00098513          	mv	a0,s3
8000f1b4:	000a80e7          	jalr	s5
8000f1b8:	fff00793          	li	a5,-1
8000f1bc:	06f50863          	beq	a0,a5,8000f22c <_printf_common+0x134>
8000f1c0:	00042783          	lw	a5,0(s0)
8000f1c4:	00400613          	li	a2,4
8000f1c8:	0004a703          	lw	a4,0(s1)
8000f1cc:	0067f793          	andi	a5,a5,6
8000f1d0:	00c42683          	lw	a3,12(s0)
8000f1d4:	00000493          	li	s1,0
8000f1d8:	00c79863          	bne	a5,a2,8000f1e8 <_printf_common+0xf0>
8000f1dc:	40e684b3          	sub	s1,a3,a4
8000f1e0:	0004d463          	bgez	s1,8000f1e8 <_printf_common+0xf0>
8000f1e4:	00000493          	li	s1,0
8000f1e8:	00842783          	lw	a5,8(s0)
8000f1ec:	01042703          	lw	a4,16(s0)
8000f1f0:	00f75663          	bge	a4,a5,8000f1fc <_printf_common+0x104>
8000f1f4:	40e787b3          	sub	a5,a5,a4
8000f1f8:	00f484b3          	add	s1,s1,a5
8000f1fc:	00000913          	li	s2,0
8000f200:	01a40413          	addi	s0,s0,26
8000f204:	fff00b13          	li	s6,-1
8000f208:	09249063          	bne	s1,s2,8000f288 <_printf_common+0x190>
8000f20c:	00000513          	li	a0,0
8000f210:	0200006f          	j	8000f230 <_printf_common+0x138>
8000f214:	00100693          	li	a3,1
8000f218:	000b0613          	mv	a2,s6
8000f21c:	000a0593          	mv	a1,s4
8000f220:	00098513          	mv	a0,s3
8000f224:	000a80e7          	jalr	s5
8000f228:	03751a63          	bne	a0,s7,8000f25c <_printf_common+0x164>
8000f22c:	fff00513          	li	a0,-1
8000f230:	02c12083          	lw	ra,44(sp)
8000f234:	02812403          	lw	s0,40(sp)
8000f238:	02412483          	lw	s1,36(sp)
8000f23c:	02012903          	lw	s2,32(sp)
8000f240:	01c12983          	lw	s3,28(sp)
8000f244:	01812a03          	lw	s4,24(sp)
8000f248:	01412a83          	lw	s5,20(sp)
8000f24c:	01012b03          	lw	s6,16(sp)
8000f250:	00c12b83          	lw	s7,12(sp)
8000f254:	03010113          	addi	sp,sp,48
8000f258:	00008067          	ret
8000f25c:	00190913          	addi	s2,s2,1
8000f260:	f25ff06f          	j	8000f184 <_printf_common+0x8c>
8000f264:	00d40733          	add	a4,s0,a3
8000f268:	03000613          	li	a2,48
8000f26c:	04c701a3          	sb	a2,67(a4)
8000f270:	04544703          	lbu	a4,69(s0)
8000f274:	00168793          	addi	a5,a3,1
8000f278:	00f407b3          	add	a5,s0,a5
8000f27c:	00268693          	addi	a3,a3,2
8000f280:	04e781a3          	sb	a4,67(a5)
8000f284:	f25ff06f          	j	8000f1a8 <_printf_common+0xb0>
8000f288:	00100693          	li	a3,1
8000f28c:	00040613          	mv	a2,s0
8000f290:	000a0593          	mv	a1,s4
8000f294:	00098513          	mv	a0,s3
8000f298:	000a80e7          	jalr	s5
8000f29c:	f96508e3          	beq	a0,s6,8000f22c <_printf_common+0x134>
8000f2a0:	00190913          	addi	s2,s2,1
8000f2a4:	f65ff06f          	j	8000f208 <_printf_common+0x110>

Disassembly of section .text._printf_i:

8000f2a8 <_printf_i>:
8000f2a8:	fc010113          	addi	sp,sp,-64
8000f2ac:	02812c23          	sw	s0,56(sp)
8000f2b0:	03312623          	sw	s3,44(sp)
8000f2b4:	03512223          	sw	s5,36(sp)
8000f2b8:	03612023          	sw	s6,32(sp)
8000f2bc:	01712e23          	sw	s7,28(sp)
8000f2c0:	02112e23          	sw	ra,60(sp)
8000f2c4:	02912a23          	sw	s1,52(sp)
8000f2c8:	03212823          	sw	s2,48(sp)
8000f2cc:	03412423          	sw	s4,40(sp)
8000f2d0:	01812c23          	sw	s8,24(sp)
8000f2d4:	0185c783          	lbu	a5,24(a1)
8000f2d8:	00068b93          	mv	s7,a3
8000f2dc:	06e00693          	li	a3,110
8000f2e0:	00050a93          	mv	s5,a0
8000f2e4:	00058413          	mv	s0,a1
8000f2e8:	00060b13          	mv	s6,a2
8000f2ec:	04358993          	addi	s3,a1,67
8000f2f0:	28d78c63          	beq	a5,a3,8000f588 <_printf_i+0x2e0>
8000f2f4:	06f6e863          	bltu	a3,a5,8000f364 <_printf_i+0xbc>
8000f2f8:	06300693          	li	a3,99
8000f2fc:	0ad78c63          	beq	a5,a3,8000f3b4 <_printf_i+0x10c>
8000f300:	00f6ec63          	bltu	a3,a5,8000f318 <_printf_i+0x70>
8000f304:	2c078063          	beqz	a5,8000f5c4 <_printf_i+0x31c>
8000f308:	05800693          	li	a3,88
8000f30c:	12d78863          	beq	a5,a3,8000f43c <_printf_i+0x194>
8000f310:	04240c13          	addi	s8,s0,66
8000f314:	0b40006f          	j	8000f3c8 <_printf_i+0x120>
8000f318:	06400693          	li	a3,100
8000f31c:	00d78663          	beq	a5,a3,8000f328 <_printf_i+0x80>
8000f320:	06900693          	li	a3,105
8000f324:	fed796e3          	bne	a5,a3,8000f310 <_printf_i+0x68>
8000f328:	00042783          	lw	a5,0(s0)
8000f32c:	00072603          	lw	a2,0(a4)
8000f330:	0807f593          	andi	a1,a5,128
8000f334:	00460693          	addi	a3,a2,4
8000f338:	08058e63          	beqz	a1,8000f3d4 <_printf_i+0x12c>
8000f33c:	00062483          	lw	s1,0(a2)
8000f340:	00d72023          	sw	a3,0(a4)
8000f344:	0004d863          	bgez	s1,8000f354 <_printf_i+0xac>
8000f348:	02d00793          	li	a5,45
8000f34c:	409004b3          	neg	s1,s1
8000f350:	04f401a3          	sb	a5,67(s0)
8000f354:	ffff4a17          	auipc	s4,0xffff4
8000f358:	a94a0a13          	addi	s4,s4,-1388 # 80002de8 <__sf_fake_stdout+0x34>
8000f35c:	00a00913          	li	s2,10
8000f360:	12c0006f          	j	8000f48c <_printf_i+0x1e4>
8000f364:	07300693          	li	a3,115
8000f368:	26d78463          	beq	a5,a3,8000f5d0 <_printf_i+0x328>
8000f36c:	02f6e263          	bltu	a3,a5,8000f390 <_printf_i+0xe8>
8000f370:	06f00693          	li	a3,111
8000f374:	06d78e63          	beq	a5,a3,8000f3f0 <_printf_i+0x148>
8000f378:	07000693          	li	a3,112
8000f37c:	f8d79ae3          	bne	a5,a3,8000f310 <_printf_i+0x68>
8000f380:	0005a783          	lw	a5,0(a1)
8000f384:	0207e793          	ori	a5,a5,32
8000f388:	00f5a023          	sw	a5,0(a1)
8000f38c:	0140006f          	j	8000f3a0 <_printf_i+0xf8>
8000f390:	07500693          	li	a3,117
8000f394:	04d78e63          	beq	a5,a3,8000f3f0 <_printf_i+0x148>
8000f398:	07800693          	li	a3,120
8000f39c:	f6d79ae3          	bne	a5,a3,8000f310 <_printf_i+0x68>
8000f3a0:	07800793          	li	a5,120
8000f3a4:	04f402a3          	sb	a5,69(s0)
8000f3a8:	ffff4a17          	auipc	s4,0xffff4
8000f3ac:	a54a0a13          	addi	s4,s4,-1452 # 80002dfc <__sf_fake_stdout+0x48>
8000f3b0:	0980006f          	j	8000f448 <_printf_i+0x1a0>
8000f3b4:	00072783          	lw	a5,0(a4)
8000f3b8:	04258c13          	addi	s8,a1,66
8000f3bc:	00478693          	addi	a3,a5,4
8000f3c0:	0007a783          	lw	a5,0(a5)
8000f3c4:	00d72023          	sw	a3,0(a4)
8000f3c8:	04f40123          	sb	a5,66(s0)
8000f3cc:	00100793          	li	a5,1
8000f3d0:	2300006f          	j	8000f600 <_printf_i+0x358>
8000f3d4:	00062483          	lw	s1,0(a2)
8000f3d8:	0407f793          	andi	a5,a5,64
8000f3dc:	00d72023          	sw	a3,0(a4)
8000f3e0:	f60782e3          	beqz	a5,8000f344 <_printf_i+0x9c>
8000f3e4:	01049493          	slli	s1,s1,0x10
8000f3e8:	4104d493          	srai	s1,s1,0x10
8000f3ec:	f59ff06f          	j	8000f344 <_printf_i+0x9c>
8000f3f0:	00042603          	lw	a2,0(s0)
8000f3f4:	00072683          	lw	a3,0(a4)
8000f3f8:	08067513          	andi	a0,a2,128
8000f3fc:	00468593          	addi	a1,a3,4
8000f400:	00050863          	beqz	a0,8000f410 <_printf_i+0x168>
8000f404:	00b72023          	sw	a1,0(a4)
8000f408:	0006a483          	lw	s1,0(a3)
8000f40c:	0140006f          	j	8000f420 <_printf_i+0x178>
8000f410:	04067613          	andi	a2,a2,64
8000f414:	00b72023          	sw	a1,0(a4)
8000f418:	fe0608e3          	beqz	a2,8000f408 <_printf_i+0x160>
8000f41c:	0006d483          	lhu	s1,0(a3)
8000f420:	06f00713          	li	a4,111
8000f424:	ffff4a17          	auipc	s4,0xffff4
8000f428:	9c4a0a13          	addi	s4,s4,-1596 # 80002de8 <__sf_fake_stdout+0x34>
8000f42c:	00a00913          	li	s2,10
8000f430:	04e79c63          	bne	a5,a4,8000f488 <_printf_i+0x1e0>
8000f434:	00800913          	li	s2,8
8000f438:	0500006f          	j	8000f488 <_printf_i+0x1e0>
8000f43c:	04f582a3          	sb	a5,69(a1)
8000f440:	ffff4a17          	auipc	s4,0xffff4
8000f444:	9a8a0a13          	addi	s4,s4,-1624 # 80002de8 <__sf_fake_stdout+0x34>
8000f448:	00042783          	lw	a5,0(s0)
8000f44c:	00072683          	lw	a3,0(a4)
8000f450:	0807f613          	andi	a2,a5,128
8000f454:	0006a483          	lw	s1,0(a3)
8000f458:	00468693          	addi	a3,a3,4
8000f45c:	10060663          	beqz	a2,8000f568 <_printf_i+0x2c0>
8000f460:	00d72023          	sw	a3,0(a4)
8000f464:	0017f713          	andi	a4,a5,1
8000f468:	00070663          	beqz	a4,8000f474 <_printf_i+0x1cc>
8000f46c:	0207e793          	ori	a5,a5,32
8000f470:	00f42023          	sw	a5,0(s0)
8000f474:	01000913          	li	s2,16
8000f478:	00049863          	bnez	s1,8000f488 <_printf_i+0x1e0>
8000f47c:	00042783          	lw	a5,0(s0)
8000f480:	fdf7f793          	andi	a5,a5,-33
8000f484:	00f42023          	sw	a5,0(s0)
8000f488:	040401a3          	sb	zero,67(s0)
8000f48c:	00442783          	lw	a5,4(s0)
8000f490:	00f42423          	sw	a5,8(s0)
8000f494:	0007c863          	bltz	a5,8000f4a4 <_printf_i+0x1fc>
8000f498:	00042703          	lw	a4,0(s0)
8000f49c:	ffb77713          	andi	a4,a4,-5
8000f4a0:	00e42023          	sw	a4,0(s0)
8000f4a4:	00049663          	bnez	s1,8000f4b0 <_printf_i+0x208>
8000f4a8:	00098c13          	mv	s8,s3
8000f4ac:	02078a63          	beqz	a5,8000f4e0 <_printf_i+0x238>
8000f4b0:	00098c13          	mv	s8,s3
8000f4b4:	00090593          	mv	a1,s2
8000f4b8:	00048513          	mv	a0,s1
8000f4bc:	ca9fd0ef          	jal	ra,8000d164 <__umodsi3>
8000f4c0:	00aa0533          	add	a0,s4,a0
8000f4c4:	00054783          	lbu	a5,0(a0)
8000f4c8:	fffc0c13          	addi	s8,s8,-1
8000f4cc:	00090593          	mv	a1,s2
8000f4d0:	00fc0023          	sb	a5,0(s8)
8000f4d4:	00048513          	mv	a0,s1
8000f4d8:	c45fd0ef          	jal	ra,8000d11c <__udivsi3>
8000f4dc:	0b24f263          	bgeu	s1,s2,8000f580 <_printf_i+0x2d8>
8000f4e0:	00800793          	li	a5,8
8000f4e4:	02f91463          	bne	s2,a5,8000f50c <_printf_i+0x264>
8000f4e8:	00042783          	lw	a5,0(s0)
8000f4ec:	0017f793          	andi	a5,a5,1
8000f4f0:	00078e63          	beqz	a5,8000f50c <_printf_i+0x264>
8000f4f4:	00442703          	lw	a4,4(s0)
8000f4f8:	01042783          	lw	a5,16(s0)
8000f4fc:	00e7c863          	blt	a5,a4,8000f50c <_printf_i+0x264>
8000f500:	03000793          	li	a5,48
8000f504:	fefc0fa3          	sb	a5,-1(s8)
8000f508:	fffc0c13          	addi	s8,s8,-1
8000f50c:	418989b3          	sub	s3,s3,s8
8000f510:	01342823          	sw	s3,16(s0)
8000f514:	000b8713          	mv	a4,s7
8000f518:	000b0693          	mv	a3,s6
8000f51c:	00c10613          	addi	a2,sp,12
8000f520:	00040593          	mv	a1,s0
8000f524:	000a8513          	mv	a0,s5
8000f528:	bd1ff0ef          	jal	ra,8000f0f8 <_printf_common>
8000f52c:	fff00493          	li	s1,-1
8000f530:	0c951e63          	bne	a0,s1,8000f60c <_printf_i+0x364>
8000f534:	fff00513          	li	a0,-1
8000f538:	03c12083          	lw	ra,60(sp)
8000f53c:	03812403          	lw	s0,56(sp)
8000f540:	03412483          	lw	s1,52(sp)
8000f544:	03012903          	lw	s2,48(sp)
8000f548:	02c12983          	lw	s3,44(sp)
8000f54c:	02812a03          	lw	s4,40(sp)
8000f550:	02412a83          	lw	s5,36(sp)
8000f554:	02012b03          	lw	s6,32(sp)
8000f558:	01c12b83          	lw	s7,28(sp)
8000f55c:	01812c03          	lw	s8,24(sp)
8000f560:	04010113          	addi	sp,sp,64
8000f564:	00008067          	ret
8000f568:	0407f613          	andi	a2,a5,64
8000f56c:	00d72023          	sw	a3,0(a4)
8000f570:	ee060ae3          	beqz	a2,8000f464 <_printf_i+0x1bc>
8000f574:	01049493          	slli	s1,s1,0x10
8000f578:	0104d493          	srli	s1,s1,0x10
8000f57c:	ee9ff06f          	j	8000f464 <_printf_i+0x1bc>
8000f580:	00050493          	mv	s1,a0
8000f584:	f31ff06f          	j	8000f4b4 <_printf_i+0x20c>
8000f588:	0005a683          	lw	a3,0(a1)
8000f58c:	00072783          	lw	a5,0(a4)
8000f590:	0145a603          	lw	a2,20(a1)
8000f594:	0806f513          	andi	a0,a3,128
8000f598:	00478593          	addi	a1,a5,4
8000f59c:	00050a63          	beqz	a0,8000f5b0 <_printf_i+0x308>
8000f5a0:	00b72023          	sw	a1,0(a4)
8000f5a4:	0007a783          	lw	a5,0(a5)
8000f5a8:	00c7a023          	sw	a2,0(a5)
8000f5ac:	0180006f          	j	8000f5c4 <_printf_i+0x31c>
8000f5b0:	00b72023          	sw	a1,0(a4)
8000f5b4:	0406f693          	andi	a3,a3,64
8000f5b8:	0007a783          	lw	a5,0(a5)
8000f5bc:	fe0686e3          	beqz	a3,8000f5a8 <_printf_i+0x300>
8000f5c0:	00c79023          	sh	a2,0(a5)
8000f5c4:	00042823          	sw	zero,16(s0)
8000f5c8:	00098c13          	mv	s8,s3
8000f5cc:	f49ff06f          	j	8000f514 <_printf_i+0x26c>
8000f5d0:	00072783          	lw	a5,0(a4)
8000f5d4:	0045a603          	lw	a2,4(a1)
8000f5d8:	00000593          	li	a1,0
8000f5dc:	00478693          	addi	a3,a5,4
8000f5e0:	00d72023          	sw	a3,0(a4)
8000f5e4:	0007ac03          	lw	s8,0(a5)
8000f5e8:	000c0513          	mv	a0,s8
8000f5ec:	010010ef          	jal	ra,800105fc <memchr>
8000f5f0:	00050663          	beqz	a0,8000f5fc <_printf_i+0x354>
8000f5f4:	41850533          	sub	a0,a0,s8
8000f5f8:	00a42223          	sw	a0,4(s0)
8000f5fc:	00442783          	lw	a5,4(s0)
8000f600:	00f42823          	sw	a5,16(s0)
8000f604:	040401a3          	sb	zero,67(s0)
8000f608:	f0dff06f          	j	8000f514 <_printf_i+0x26c>
8000f60c:	01042683          	lw	a3,16(s0)
8000f610:	000c0613          	mv	a2,s8
8000f614:	000b0593          	mv	a1,s6
8000f618:	000a8513          	mv	a0,s5
8000f61c:	000b80e7          	jalr	s7
8000f620:	f0950ae3          	beq	a0,s1,8000f534 <_printf_i+0x28c>
8000f624:	00042783          	lw	a5,0(s0)
8000f628:	0027f793          	andi	a5,a5,2
8000f62c:	04079463          	bnez	a5,8000f674 <_printf_i+0x3cc>
8000f630:	00c12783          	lw	a5,12(sp)
8000f634:	00c42503          	lw	a0,12(s0)
8000f638:	f0f550e3          	bge	a0,a5,8000f538 <_printf_i+0x290>
8000f63c:	00078513          	mv	a0,a5
8000f640:	ef9ff06f          	j	8000f538 <_printf_i+0x290>
8000f644:	00100693          	li	a3,1
8000f648:	00090613          	mv	a2,s2
8000f64c:	000b0593          	mv	a1,s6
8000f650:	000a8513          	mv	a0,s5
8000f654:	000b80e7          	jalr	s7
8000f658:	ed350ee3          	beq	a0,s3,8000f534 <_printf_i+0x28c>
8000f65c:	00148493          	addi	s1,s1,1
8000f660:	00c42783          	lw	a5,12(s0)
8000f664:	00c12703          	lw	a4,12(sp)
8000f668:	40e787b3          	sub	a5,a5,a4
8000f66c:	fcf4cce3          	blt	s1,a5,8000f644 <_printf_i+0x39c>
8000f670:	fc1ff06f          	j	8000f630 <_printf_i+0x388>
8000f674:	00000493          	li	s1,0
8000f678:	01940913          	addi	s2,s0,25
8000f67c:	fff00993          	li	s3,-1
8000f680:	fe1ff06f          	j	8000f660 <_printf_i+0x3b8>

Disassembly of section .text.__sfputc_r:

8000f684 <__sfputc_r>:
8000f684:	00862783          	lw	a5,8(a2)
8000f688:	fff78793          	addi	a5,a5,-1
8000f68c:	00f62423          	sw	a5,8(a2)
8000f690:	0007dc63          	bgez	a5,8000f6a8 <__sfputc_r+0x24>
8000f694:	01862703          	lw	a4,24(a2)
8000f698:	00e7c663          	blt	a5,a4,8000f6a4 <__sfputc_r+0x20>
8000f69c:	00a00793          	li	a5,10
8000f6a0:	00f59463          	bne	a1,a5,8000f6a8 <__sfputc_r+0x24>
8000f6a4:	6b40006f          	j	8000fd58 <__swbuf_r>
8000f6a8:	00062783          	lw	a5,0(a2)
8000f6ac:	00058513          	mv	a0,a1
8000f6b0:	00178713          	addi	a4,a5,1
8000f6b4:	00e62023          	sw	a4,0(a2)
8000f6b8:	00b78023          	sb	a1,0(a5)
8000f6bc:	00008067          	ret

Disassembly of section .text.__sfputs_r:

8000f6c0 <__sfputs_r>:
8000f6c0:	fe010113          	addi	sp,sp,-32
8000f6c4:	00812c23          	sw	s0,24(sp)
8000f6c8:	00912a23          	sw	s1,20(sp)
8000f6cc:	01212823          	sw	s2,16(sp)
8000f6d0:	01312623          	sw	s3,12(sp)
8000f6d4:	01412423          	sw	s4,8(sp)
8000f6d8:	00112e23          	sw	ra,28(sp)
8000f6dc:	00050913          	mv	s2,a0
8000f6e0:	00058993          	mv	s3,a1
8000f6e4:	00060413          	mv	s0,a2
8000f6e8:	00d604b3          	add	s1,a2,a3
8000f6ec:	fff00a13          	li	s4,-1
8000f6f0:	00941663          	bne	s0,s1,8000f6fc <__sfputs_r+0x3c>
8000f6f4:	00000513          	li	a0,0
8000f6f8:	01c0006f          	j	8000f714 <__sfputs_r+0x54>
8000f6fc:	00044583          	lbu	a1,0(s0)
8000f700:	00098613          	mv	a2,s3
8000f704:	00090513          	mv	a0,s2
8000f708:	f7dff0ef          	jal	ra,8000f684 <__sfputc_r>
8000f70c:	00140413          	addi	s0,s0,1
8000f710:	ff4510e3          	bne	a0,s4,8000f6f0 <__sfputs_r+0x30>
8000f714:	01c12083          	lw	ra,28(sp)
8000f718:	01812403          	lw	s0,24(sp)
8000f71c:	01412483          	lw	s1,20(sp)
8000f720:	01012903          	lw	s2,16(sp)
8000f724:	00c12983          	lw	s3,12(sp)
8000f728:	00812a03          	lw	s4,8(sp)
8000f72c:	02010113          	addi	sp,sp,32
8000f730:	00008067          	ret

Disassembly of section .text.__sprint_r:

8000f734 <__sprint_r>:
8000f734:	00862703          	lw	a4,8(a2)
8000f738:	ff010113          	addi	sp,sp,-16
8000f73c:	00812423          	sw	s0,8(sp)
8000f740:	00112623          	sw	ra,12(sp)
8000f744:	00060413          	mv	s0,a2
8000f748:	00071e63          	bnez	a4,8000f764 <__sprint_r+0x30>
8000f74c:	00062223          	sw	zero,4(a2)
8000f750:	00000513          	li	a0,0
8000f754:	00c12083          	lw	ra,12(sp)
8000f758:	00812403          	lw	s0,8(sp)
8000f75c:	01010113          	addi	sp,sp,16
8000f760:	00008067          	ret
8000f764:	0bd000ef          	jal	ra,80010020 <__sfvwrite_r>
8000f768:	00042423          	sw	zero,8(s0)
8000f76c:	00042223          	sw	zero,4(s0)
8000f770:	fe5ff06f          	j	8000f754 <__sprint_r+0x20>

Disassembly of section .text._vfprintf_r:

8000f774 <_vfiprintf_r>:
8000f774:	f6010113          	addi	sp,sp,-160
8000f778:	08812c23          	sw	s0,152(sp)
8000f77c:	08912a23          	sw	s1,148(sp)
8000f780:	09212823          	sw	s2,144(sp)
8000f784:	09312623          	sw	s3,140(sp)
8000f788:	08112e23          	sw	ra,156(sp)
8000f78c:	09412423          	sw	s4,136(sp)
8000f790:	09512223          	sw	s5,132(sp)
8000f794:	09612023          	sw	s6,128(sp)
8000f798:	07712e23          	sw	s7,124(sp)
8000f79c:	07812c23          	sw	s8,120(sp)
8000f7a0:	07912a23          	sw	s9,116(sp)
8000f7a4:	00050993          	mv	s3,a0
8000f7a8:	00058493          	mv	s1,a1
8000f7ac:	00060913          	mv	s2,a2
8000f7b0:	00068413          	mv	s0,a3
8000f7b4:	00050863          	beqz	a0,8000f7c4 <_vfiprintf_r+0x50>
8000f7b8:	01852783          	lw	a5,24(a0)
8000f7bc:	00079463          	bnez	a5,8000f7c4 <_vfiprintf_r+0x50>
8000f7c0:	b04fe0ef          	jal	ra,8000dac4 <__sinit>
8000f7c4:	ffff3797          	auipc	a5,0xffff3
8000f7c8:	5d078793          	addi	a5,a5,1488 # 80002d94 <__sf_fake_stdin>
8000f7cc:	12f49263          	bne	s1,a5,8000f8f0 <_vfiprintf_r+0x17c>
8000f7d0:	0049a483          	lw	s1,4(s3)
8000f7d4:	00c4d783          	lhu	a5,12(s1)
8000f7d8:	0087f793          	andi	a5,a5,8
8000f7dc:	12078e63          	beqz	a5,8000f918 <_vfiprintf_r+0x1a4>
8000f7e0:	0104a783          	lw	a5,16(s1)
8000f7e4:	12078a63          	beqz	a5,8000f918 <_vfiprintf_r+0x1a4>
8000f7e8:	02000793          	li	a5,32
8000f7ec:	02f104a3          	sb	a5,41(sp)
8000f7f0:	03000793          	li	a5,48
8000f7f4:	02012223          	sw	zero,36(sp)
8000f7f8:	02f10523          	sb	a5,42(sp)
8000f7fc:	00812623          	sw	s0,12(sp)
8000f800:	02500b13          	li	s6,37
8000f804:	ffff3a97          	auipc	s5,0xffff3
8000f808:	5d0a8a93          	addi	s5,s5,1488 # 80002dd4 <__sf_fake_stdout+0x20>
8000f80c:	00100b93          	li	s7,1
8000f810:	7fff0c17          	auipc	s8,0x7fff0
8000f814:	7f0c0c13          	addi	s8,s8,2032 # 0 <_heap_end+0x7ffee000>
8000f818:	00090413          	mv	s0,s2
8000f81c:	00044783          	lbu	a5,0(s0)
8000f820:	00078463          	beqz	a5,8000f828 <_vfiprintf_r+0xb4>
8000f824:	13679e63          	bne	a5,s6,8000f960 <_vfiprintf_r+0x1ec>
8000f828:	41240cb3          	sub	s9,s0,s2
8000f82c:	020c8663          	beqz	s9,8000f858 <_vfiprintf_r+0xe4>
8000f830:	000c8693          	mv	a3,s9
8000f834:	00090613          	mv	a2,s2
8000f838:	00048593          	mv	a1,s1
8000f83c:	00098513          	mv	a0,s3
8000f840:	e81ff0ef          	jal	ra,8000f6c0 <__sfputs_r>
8000f844:	fff00793          	li	a5,-1
8000f848:	2cf50663          	beq	a0,a5,8000fb14 <_vfiprintf_r+0x3a0>
8000f84c:	02412683          	lw	a3,36(sp)
8000f850:	019686b3          	add	a3,a3,s9
8000f854:	02d12223          	sw	a3,36(sp)
8000f858:	00044783          	lbu	a5,0(s0)
8000f85c:	2a078c63          	beqz	a5,8000fb14 <_vfiprintf_r+0x3a0>
8000f860:	fff00793          	li	a5,-1
8000f864:	00140913          	addi	s2,s0,1
8000f868:	00012823          	sw	zero,16(sp)
8000f86c:	00012e23          	sw	zero,28(sp)
8000f870:	00f12a23          	sw	a5,20(sp)
8000f874:	00012c23          	sw	zero,24(sp)
8000f878:	040109a3          	sb	zero,83(sp)
8000f87c:	06012423          	sw	zero,104(sp)
8000f880:	00094583          	lbu	a1,0(s2)
8000f884:	00500613          	li	a2,5
8000f888:	000a8513          	mv	a0,s5
8000f88c:	571000ef          	jal	ra,800105fc <memchr>
8000f890:	00190413          	addi	s0,s2,1
8000f894:	01012783          	lw	a5,16(sp)
8000f898:	0c051863          	bnez	a0,8000f968 <_vfiprintf_r+0x1f4>
8000f89c:	0107f713          	andi	a4,a5,16
8000f8a0:	00070663          	beqz	a4,8000f8ac <_vfiprintf_r+0x138>
8000f8a4:	02000713          	li	a4,32
8000f8a8:	04e109a3          	sb	a4,83(sp)
8000f8ac:	0087f713          	andi	a4,a5,8
8000f8b0:	00070663          	beqz	a4,8000f8bc <_vfiprintf_r+0x148>
8000f8b4:	02b00713          	li	a4,43
8000f8b8:	04e109a3          	sb	a4,83(sp)
8000f8bc:	00094683          	lbu	a3,0(s2)
8000f8c0:	02a00713          	li	a4,42
8000f8c4:	0ae68e63          	beq	a3,a4,8000f980 <_vfiprintf_r+0x20c>
8000f8c8:	01c12703          	lw	a4,28(sp)
8000f8cc:	00090413          	mv	s0,s2
8000f8d0:	00000793          	li	a5,0
8000f8d4:	00900613          	li	a2,9
8000f8d8:	00044683          	lbu	a3,0(s0)
8000f8dc:	00140593          	addi	a1,s0,1
8000f8e0:	fd068693          	addi	a3,a3,-48
8000f8e4:	18d67263          	bgeu	a2,a3,8000fa68 <_vfiprintf_r+0x2f4>
8000f8e8:	0a079663          	bnez	a5,8000f994 <_vfiprintf_r+0x220>
8000f8ec:	0c00006f          	j	8000f9ac <_vfiprintf_r+0x238>
8000f8f0:	ffff3797          	auipc	a5,0xffff3
8000f8f4:	4c478793          	addi	a5,a5,1220 # 80002db4 <__sf_fake_stdout>
8000f8f8:	00f49663          	bne	s1,a5,8000f904 <_vfiprintf_r+0x190>
8000f8fc:	0089a483          	lw	s1,8(s3)
8000f900:	ed5ff06f          	j	8000f7d4 <_vfiprintf_r+0x60>
8000f904:	ffff3797          	auipc	a5,0xffff3
8000f908:	47078793          	addi	a5,a5,1136 # 80002d74 <__sf_fake_stderr>
8000f90c:	ecf494e3          	bne	s1,a5,8000f7d4 <_vfiprintf_r+0x60>
8000f910:	00c9a483          	lw	s1,12(s3)
8000f914:	ec1ff06f          	j	8000f7d4 <_vfiprintf_r+0x60>
8000f918:	00048593          	mv	a1,s1
8000f91c:	00098513          	mv	a0,s3
8000f920:	584000ef          	jal	ra,8000fea4 <__swsetup_r>
8000f924:	ec0502e3          	beqz	a0,8000f7e8 <_vfiprintf_r+0x74>
8000f928:	fff00513          	li	a0,-1
8000f92c:	09c12083          	lw	ra,156(sp)
8000f930:	09812403          	lw	s0,152(sp)
8000f934:	09412483          	lw	s1,148(sp)
8000f938:	09012903          	lw	s2,144(sp)
8000f93c:	08c12983          	lw	s3,140(sp)
8000f940:	08812a03          	lw	s4,136(sp)
8000f944:	08412a83          	lw	s5,132(sp)
8000f948:	08012b03          	lw	s6,128(sp)
8000f94c:	07c12b83          	lw	s7,124(sp)
8000f950:	07812c03          	lw	s8,120(sp)
8000f954:	07412c83          	lw	s9,116(sp)
8000f958:	0a010113          	addi	sp,sp,160
8000f95c:	00008067          	ret
8000f960:	00140413          	addi	s0,s0,1
8000f964:	eb9ff06f          	j	8000f81c <_vfiprintf_r+0xa8>
8000f968:	41550533          	sub	a0,a0,s5
8000f96c:	00ab9533          	sll	a0,s7,a0
8000f970:	00a7e7b3          	or	a5,a5,a0
8000f974:	00f12823          	sw	a5,16(sp)
8000f978:	00040913          	mv	s2,s0
8000f97c:	f05ff06f          	j	8000f880 <_vfiprintf_r+0x10c>
8000f980:	00c12703          	lw	a4,12(sp)
8000f984:	00470693          	addi	a3,a4,4
8000f988:	00072703          	lw	a4,0(a4)
8000f98c:	00d12623          	sw	a3,12(sp)
8000f990:	00074663          	bltz	a4,8000f99c <_vfiprintf_r+0x228>
8000f994:	00e12e23          	sw	a4,28(sp)
8000f998:	0140006f          	j	8000f9ac <_vfiprintf_r+0x238>
8000f99c:	40e00733          	neg	a4,a4
8000f9a0:	0027e793          	ori	a5,a5,2
8000f9a4:	00e12e23          	sw	a4,28(sp)
8000f9a8:	00f12823          	sw	a5,16(sp)
8000f9ac:	00044703          	lbu	a4,0(s0)
8000f9b0:	02e00793          	li	a5,46
8000f9b4:	02f71663          	bne	a4,a5,8000f9e0 <_vfiprintf_r+0x26c>
8000f9b8:	00144703          	lbu	a4,1(s0)
8000f9bc:	02a00793          	li	a5,42
8000f9c0:	0cf71663          	bne	a4,a5,8000fa8c <_vfiprintf_r+0x318>
8000f9c4:	00c12783          	lw	a5,12(sp)
8000f9c8:	00240413          	addi	s0,s0,2
8000f9cc:	00478713          	addi	a4,a5,4
8000f9d0:	0007a783          	lw	a5,0(a5)
8000f9d4:	00e12623          	sw	a4,12(sp)
8000f9d8:	0a07c663          	bltz	a5,8000fa84 <_vfiprintf_r+0x310>
8000f9dc:	00f12a23          	sw	a5,20(sp)
8000f9e0:	00044583          	lbu	a1,0(s0)
8000f9e4:	00300613          	li	a2,3
8000f9e8:	ffff3517          	auipc	a0,0xffff3
8000f9ec:	3f450513          	addi	a0,a0,1012 # 80002ddc <__sf_fake_stdout+0x28>
8000f9f0:	40d000ef          	jal	ra,800105fc <memchr>
8000f9f4:	02050463          	beqz	a0,8000fa1c <_vfiprintf_r+0x2a8>
8000f9f8:	ffff3797          	auipc	a5,0xffff3
8000f9fc:	3e478793          	addi	a5,a5,996 # 80002ddc <__sf_fake_stdout+0x28>
8000fa00:	40f50533          	sub	a0,a0,a5
8000fa04:	04000793          	li	a5,64
8000fa08:	00a797b3          	sll	a5,a5,a0
8000fa0c:	01012503          	lw	a0,16(sp)
8000fa10:	00140413          	addi	s0,s0,1
8000fa14:	00f56533          	or	a0,a0,a5
8000fa18:	00a12823          	sw	a0,16(sp)
8000fa1c:	00044583          	lbu	a1,0(s0)
8000fa20:	00600613          	li	a2,6
8000fa24:	ffff3517          	auipc	a0,0xffff3
8000fa28:	3bc50513          	addi	a0,a0,956 # 80002de0 <__sf_fake_stdout+0x2c>
8000fa2c:	00140913          	addi	s2,s0,1
8000fa30:	02b10423          	sb	a1,40(sp)
8000fa34:	3c9000ef          	jal	ra,800105fc <memchr>
8000fa38:	0e050863          	beqz	a0,8000fb28 <_vfiprintf_r+0x3b4>
8000fa3c:	0a0c1663          	bnez	s8,8000fae8 <_vfiprintf_r+0x374>
8000fa40:	01012703          	lw	a4,16(sp)
8000fa44:	00c12783          	lw	a5,12(sp)
8000fa48:	10077713          	andi	a4,a4,256
8000fa4c:	08070663          	beqz	a4,8000fad8 <_vfiprintf_r+0x364>
8000fa50:	00478793          	addi	a5,a5,4
8000fa54:	00f12623          	sw	a5,12(sp)
8000fa58:	02412783          	lw	a5,36(sp)
8000fa5c:	014787b3          	add	a5,a5,s4
8000fa60:	02f12223          	sw	a5,36(sp)
8000fa64:	db5ff06f          	j	8000f818 <_vfiprintf_r+0xa4>
8000fa68:	00271793          	slli	a5,a4,0x2
8000fa6c:	00e787b3          	add	a5,a5,a4
8000fa70:	00179793          	slli	a5,a5,0x1
8000fa74:	00d78733          	add	a4,a5,a3
8000fa78:	00058413          	mv	s0,a1
8000fa7c:	00100793          	li	a5,1
8000fa80:	e59ff06f          	j	8000f8d8 <_vfiprintf_r+0x164>
8000fa84:	fff00793          	li	a5,-1
8000fa88:	f55ff06f          	j	8000f9dc <_vfiprintf_r+0x268>
8000fa8c:	00140413          	addi	s0,s0,1
8000fa90:	00012a23          	sw	zero,20(sp)
8000fa94:	00000793          	li	a5,0
8000fa98:	00000713          	li	a4,0
8000fa9c:	00900613          	li	a2,9
8000faa0:	00044683          	lbu	a3,0(s0)
8000faa4:	00140593          	addi	a1,s0,1
8000faa8:	fd068693          	addi	a3,a3,-48
8000faac:	00d67863          	bgeu	a2,a3,8000fabc <_vfiprintf_r+0x348>
8000fab0:	f20788e3          	beqz	a5,8000f9e0 <_vfiprintf_r+0x26c>
8000fab4:	00e12a23          	sw	a4,20(sp)
8000fab8:	f29ff06f          	j	8000f9e0 <_vfiprintf_r+0x26c>
8000fabc:	00271793          	slli	a5,a4,0x2
8000fac0:	00e787b3          	add	a5,a5,a4
8000fac4:	00179793          	slli	a5,a5,0x1
8000fac8:	00d78733          	add	a4,a5,a3
8000facc:	00058413          	mv	s0,a1
8000fad0:	00100793          	li	a5,1
8000fad4:	fcdff06f          	j	8000faa0 <_vfiprintf_r+0x32c>
8000fad8:	00778793          	addi	a5,a5,7
8000fadc:	ff87f793          	andi	a5,a5,-8
8000fae0:	00878793          	addi	a5,a5,8
8000fae4:	f71ff06f          	j	8000fa54 <_vfiprintf_r+0x2e0>
8000fae8:	00c10713          	addi	a4,sp,12
8000faec:	00000697          	auipc	a3,0x0
8000faf0:	bd468693          	addi	a3,a3,-1068 # 8000f6c0 <__sfputs_r>
8000faf4:	00048613          	mv	a2,s1
8000faf8:	01010593          	addi	a1,sp,16
8000fafc:	00098513          	mv	a0,s3
8000fb00:	00000097          	auipc	ra,0x0
8000fb04:	000000e7          	jalr	zero # 0 <_heap_size>
8000fb08:	fff00793          	li	a5,-1
8000fb0c:	00050a13          	mv	s4,a0
8000fb10:	f4f514e3          	bne	a0,a5,8000fa58 <_vfiprintf_r+0x2e4>
8000fb14:	00c4d783          	lhu	a5,12(s1)
8000fb18:	0407f793          	andi	a5,a5,64
8000fb1c:	e00796e3          	bnez	a5,8000f928 <_vfiprintf_r+0x1b4>
8000fb20:	02412503          	lw	a0,36(sp)
8000fb24:	e09ff06f          	j	8000f92c <_vfiprintf_r+0x1b8>
8000fb28:	00c10713          	addi	a4,sp,12
8000fb2c:	00000697          	auipc	a3,0x0
8000fb30:	b9468693          	addi	a3,a3,-1132 # 8000f6c0 <__sfputs_r>
8000fb34:	00048613          	mv	a2,s1
8000fb38:	01010593          	addi	a1,sp,16
8000fb3c:	00098513          	mv	a0,s3
8000fb40:	f68ff0ef          	jal	ra,8000f2a8 <_printf_i>
8000fb44:	fc5ff06f          	j	8000fb08 <_vfiprintf_r+0x394>

Disassembly of section .text.vfprintf:

8000fb48 <vfiprintf>:
8000fb48:	80c18793          	addi	a5,gp,-2036 # 80002fac <_impure_ptr>
8000fb4c:	00060693          	mv	a3,a2
8000fb50:	00058613          	mv	a2,a1
8000fb54:	00050593          	mv	a1,a0
8000fb58:	0007a503          	lw	a0,0(a5)
8000fb5c:	c19ff06f          	j	8000f774 <_vfiprintf_r>

Disassembly of section .text._read_r:

8000fb60 <_read_r>:
8000fb60:	ff010113          	addi	sp,sp,-16
8000fb64:	00812423          	sw	s0,8(sp)
8000fb68:	00050413          	mv	s0,a0
8000fb6c:	00058513          	mv	a0,a1
8000fb70:	00060593          	mv	a1,a2
8000fb74:	00068613          	mv	a2,a3
8000fb78:	c201aa23          	sw	zero,-972(gp) # 800033d4 <errno>
8000fb7c:	00112623          	sw	ra,12(sp)
8000fb80:	f49f50ef          	jal	ra,80005ac8 <_read>
8000fb84:	fff00793          	li	a5,-1
8000fb88:	00f51a63          	bne	a0,a5,8000fb9c <_read_r+0x3c>
8000fb8c:	c3418793          	addi	a5,gp,-972 # 800033d4 <errno>
8000fb90:	0007a783          	lw	a5,0(a5)
8000fb94:	00078463          	beqz	a5,8000fb9c <_read_r+0x3c>
8000fb98:	00f42023          	sw	a5,0(s0)
8000fb9c:	00c12083          	lw	ra,12(sp)
8000fba0:	00812403          	lw	s0,8(sp)
8000fba4:	01010113          	addi	sp,sp,16
8000fba8:	00008067          	ret

Disassembly of section .text.cleanup_glue:

8000fbac <cleanup_glue>:
8000fbac:	ff010113          	addi	sp,sp,-16
8000fbb0:	00812423          	sw	s0,8(sp)
8000fbb4:	00058413          	mv	s0,a1
8000fbb8:	0005a583          	lw	a1,0(a1)
8000fbbc:	00912223          	sw	s1,4(sp)
8000fbc0:	00112623          	sw	ra,12(sp)
8000fbc4:	00050493          	mv	s1,a0
8000fbc8:	00058463          	beqz	a1,8000fbd0 <cleanup_glue+0x24>
8000fbcc:	fe1ff0ef          	jal	ra,8000fbac <cleanup_glue>
8000fbd0:	00040593          	mv	a1,s0
8000fbd4:	00812403          	lw	s0,8(sp)
8000fbd8:	00c12083          	lw	ra,12(sp)
8000fbdc:	00048513          	mv	a0,s1
8000fbe0:	00412483          	lw	s1,4(sp)
8000fbe4:	01010113          	addi	sp,sp,16
8000fbe8:	bdcfe06f          	j	8000dfc4 <_free_r>

Disassembly of section .text._reclaim_reent:

8000fbec <_reclaim_reent>:
8000fbec:	80c18793          	addi	a5,gp,-2036 # 80002fac <_impure_ptr>
8000fbf0:	0007a783          	lw	a5,0(a5)
8000fbf4:	16a78063          	beq	a5,a0,8000fd54 <_reclaim_reent+0x168>
8000fbf8:	02452783          	lw	a5,36(a0)
8000fbfc:	fe010113          	addi	sp,sp,-32
8000fc00:	00812c23          	sw	s0,24(sp)
8000fc04:	00112e23          	sw	ra,28(sp)
8000fc08:	00912a23          	sw	s1,20(sp)
8000fc0c:	01212823          	sw	s2,16(sp)
8000fc10:	01312623          	sw	s3,12(sp)
8000fc14:	00050413          	mv	s0,a0
8000fc18:	02078463          	beqz	a5,8000fc40 <_reclaim_reent+0x54>
8000fc1c:	00c7a783          	lw	a5,12(a5)
8000fc20:	00000493          	li	s1,0
8000fc24:	08000913          	li	s2,128
8000fc28:	0e079263          	bnez	a5,8000fd0c <_reclaim_reent+0x120>
8000fc2c:	02442783          	lw	a5,36(s0)
8000fc30:	0007a583          	lw	a1,0(a5)
8000fc34:	00058663          	beqz	a1,8000fc40 <_reclaim_reent+0x54>
8000fc38:	00040513          	mv	a0,s0
8000fc3c:	b88fe0ef          	jal	ra,8000dfc4 <_free_r>
8000fc40:	01442583          	lw	a1,20(s0)
8000fc44:	00058663          	beqz	a1,8000fc50 <_reclaim_reent+0x64>
8000fc48:	00040513          	mv	a0,s0
8000fc4c:	b78fe0ef          	jal	ra,8000dfc4 <_free_r>
8000fc50:	02442583          	lw	a1,36(s0)
8000fc54:	00058663          	beqz	a1,8000fc60 <_reclaim_reent+0x74>
8000fc58:	00040513          	mv	a0,s0
8000fc5c:	b68fe0ef          	jal	ra,8000dfc4 <_free_r>
8000fc60:	03842583          	lw	a1,56(s0)
8000fc64:	00058663          	beqz	a1,8000fc70 <_reclaim_reent+0x84>
8000fc68:	00040513          	mv	a0,s0
8000fc6c:	b58fe0ef          	jal	ra,8000dfc4 <_free_r>
8000fc70:	03c42583          	lw	a1,60(s0)
8000fc74:	00058663          	beqz	a1,8000fc80 <_reclaim_reent+0x94>
8000fc78:	00040513          	mv	a0,s0
8000fc7c:	b48fe0ef          	jal	ra,8000dfc4 <_free_r>
8000fc80:	04042583          	lw	a1,64(s0)
8000fc84:	00058663          	beqz	a1,8000fc90 <_reclaim_reent+0xa4>
8000fc88:	00040513          	mv	a0,s0
8000fc8c:	b38fe0ef          	jal	ra,8000dfc4 <_free_r>
8000fc90:	05c42583          	lw	a1,92(s0)
8000fc94:	00058663          	beqz	a1,8000fca0 <_reclaim_reent+0xb4>
8000fc98:	00040513          	mv	a0,s0
8000fc9c:	b28fe0ef          	jal	ra,8000dfc4 <_free_r>
8000fca0:	05842583          	lw	a1,88(s0)
8000fca4:	00058663          	beqz	a1,8000fcb0 <_reclaim_reent+0xc4>
8000fca8:	00040513          	mv	a0,s0
8000fcac:	b18fe0ef          	jal	ra,8000dfc4 <_free_r>
8000fcb0:	03442583          	lw	a1,52(s0)
8000fcb4:	00058663          	beqz	a1,8000fcc0 <_reclaim_reent+0xd4>
8000fcb8:	00040513          	mv	a0,s0
8000fcbc:	b08fe0ef          	jal	ra,8000dfc4 <_free_r>
8000fcc0:	01842783          	lw	a5,24(s0)
8000fcc4:	06078a63          	beqz	a5,8000fd38 <_reclaim_reent+0x14c>
8000fcc8:	02842783          	lw	a5,40(s0)
8000fccc:	00040513          	mv	a0,s0
8000fcd0:	000780e7          	jalr	a5
8000fcd4:	04842583          	lw	a1,72(s0)
8000fcd8:	06058063          	beqz	a1,8000fd38 <_reclaim_reent+0x14c>
8000fcdc:	00040513          	mv	a0,s0
8000fce0:	01812403          	lw	s0,24(sp)
8000fce4:	01c12083          	lw	ra,28(sp)
8000fce8:	01412483          	lw	s1,20(sp)
8000fcec:	01012903          	lw	s2,16(sp)
8000fcf0:	00c12983          	lw	s3,12(sp)
8000fcf4:	02010113          	addi	sp,sp,32
8000fcf8:	eb5ff06f          	j	8000fbac <cleanup_glue>
8000fcfc:	009585b3          	add	a1,a1,s1
8000fd00:	0005a583          	lw	a1,0(a1)
8000fd04:	02059063          	bnez	a1,8000fd24 <_reclaim_reent+0x138>
8000fd08:	00448493          	addi	s1,s1,4
8000fd0c:	02442783          	lw	a5,36(s0)
8000fd10:	00c7a583          	lw	a1,12(a5)
8000fd14:	ff2494e3          	bne	s1,s2,8000fcfc <_reclaim_reent+0x110>
8000fd18:	00040513          	mv	a0,s0
8000fd1c:	aa8fe0ef          	jal	ra,8000dfc4 <_free_r>
8000fd20:	f0dff06f          	j	8000fc2c <_reclaim_reent+0x40>
8000fd24:	0005a983          	lw	s3,0(a1)
8000fd28:	00040513          	mv	a0,s0
8000fd2c:	a98fe0ef          	jal	ra,8000dfc4 <_free_r>
8000fd30:	00098593          	mv	a1,s3
8000fd34:	fd1ff06f          	j	8000fd04 <_reclaim_reent+0x118>
8000fd38:	01c12083          	lw	ra,28(sp)
8000fd3c:	01812403          	lw	s0,24(sp)
8000fd40:	01412483          	lw	s1,20(sp)
8000fd44:	01012903          	lw	s2,16(sp)
8000fd48:	00c12983          	lw	s3,12(sp)
8000fd4c:	02010113          	addi	sp,sp,32
8000fd50:	00008067          	ret
8000fd54:	00008067          	ret

Disassembly of section .text.__swbuf_r:

8000fd58 <__swbuf_r>:
8000fd58:	fe010113          	addi	sp,sp,-32
8000fd5c:	00812c23          	sw	s0,24(sp)
8000fd60:	00912a23          	sw	s1,20(sp)
8000fd64:	01212823          	sw	s2,16(sp)
8000fd68:	00112e23          	sw	ra,28(sp)
8000fd6c:	01312623          	sw	s3,12(sp)
8000fd70:	00050493          	mv	s1,a0
8000fd74:	00058913          	mv	s2,a1
8000fd78:	00060413          	mv	s0,a2
8000fd7c:	00050863          	beqz	a0,8000fd8c <__swbuf_r+0x34>
8000fd80:	01852783          	lw	a5,24(a0)
8000fd84:	00079463          	bnez	a5,8000fd8c <__swbuf_r+0x34>
8000fd88:	d3dfd0ef          	jal	ra,8000dac4 <__sinit>
8000fd8c:	ffff3797          	auipc	a5,0xffff3
8000fd90:	00878793          	addi	a5,a5,8 # 80002d94 <__sf_fake_stdin>
8000fd94:	0af41e63          	bne	s0,a5,8000fe50 <__swbuf_r+0xf8>
8000fd98:	0044a403          	lw	s0,4(s1)
8000fd9c:	01842783          	lw	a5,24(s0)
8000fda0:	00f42423          	sw	a5,8(s0)
8000fda4:	00c45783          	lhu	a5,12(s0)
8000fda8:	0087f793          	andi	a5,a5,8
8000fdac:	0c078663          	beqz	a5,8000fe78 <__swbuf_r+0x120>
8000fdb0:	01042783          	lw	a5,16(s0)
8000fdb4:	0c078263          	beqz	a5,8000fe78 <__swbuf_r+0x120>
8000fdb8:	01042783          	lw	a5,16(s0)
8000fdbc:	00042503          	lw	a0,0(s0)
8000fdc0:	0ff97993          	andi	s3,s2,255
8000fdc4:	0ff97913          	andi	s2,s2,255
8000fdc8:	40f50533          	sub	a0,a0,a5
8000fdcc:	01442783          	lw	a5,20(s0)
8000fdd0:	00f54a63          	blt	a0,a5,8000fde4 <__swbuf_r+0x8c>
8000fdd4:	00040593          	mv	a1,s0
8000fdd8:	00048513          	mv	a0,s1
8000fddc:	af9fd0ef          	jal	ra,8000d8d4 <_fflush_r>
8000fde0:	0a051463          	bnez	a0,8000fe88 <__swbuf_r+0x130>
8000fde4:	00842783          	lw	a5,8(s0)
8000fde8:	00150513          	addi	a0,a0,1
8000fdec:	fff78793          	addi	a5,a5,-1
8000fdf0:	00f42423          	sw	a5,8(s0)
8000fdf4:	00042783          	lw	a5,0(s0)
8000fdf8:	00178713          	addi	a4,a5,1
8000fdfc:	00e42023          	sw	a4,0(s0)
8000fe00:	01378023          	sb	s3,0(a5)
8000fe04:	01442783          	lw	a5,20(s0)
8000fe08:	00a78c63          	beq	a5,a0,8000fe20 <__swbuf_r+0xc8>
8000fe0c:	00c45783          	lhu	a5,12(s0)
8000fe10:	0017f793          	andi	a5,a5,1
8000fe14:	00078e63          	beqz	a5,8000fe30 <__swbuf_r+0xd8>
8000fe18:	00a00793          	li	a5,10
8000fe1c:	00f91a63          	bne	s2,a5,8000fe30 <__swbuf_r+0xd8>
8000fe20:	00040593          	mv	a1,s0
8000fe24:	00048513          	mv	a0,s1
8000fe28:	aadfd0ef          	jal	ra,8000d8d4 <_fflush_r>
8000fe2c:	04051e63          	bnez	a0,8000fe88 <__swbuf_r+0x130>
8000fe30:	01c12083          	lw	ra,28(sp)
8000fe34:	01812403          	lw	s0,24(sp)
8000fe38:	00090513          	mv	a0,s2
8000fe3c:	01412483          	lw	s1,20(sp)
8000fe40:	01012903          	lw	s2,16(sp)
8000fe44:	00c12983          	lw	s3,12(sp)
8000fe48:	02010113          	addi	sp,sp,32
8000fe4c:	00008067          	ret
8000fe50:	ffff3797          	auipc	a5,0xffff3
8000fe54:	f6478793          	addi	a5,a5,-156 # 80002db4 <__sf_fake_stdout>
8000fe58:	00f41663          	bne	s0,a5,8000fe64 <__swbuf_r+0x10c>
8000fe5c:	0084a403          	lw	s0,8(s1)
8000fe60:	f3dff06f          	j	8000fd9c <__swbuf_r+0x44>
8000fe64:	ffff3797          	auipc	a5,0xffff3
8000fe68:	f1078793          	addi	a5,a5,-240 # 80002d74 <__sf_fake_stderr>
8000fe6c:	f2f418e3          	bne	s0,a5,8000fd9c <__swbuf_r+0x44>
8000fe70:	00c4a403          	lw	s0,12(s1)
8000fe74:	f29ff06f          	j	8000fd9c <__swbuf_r+0x44>
8000fe78:	00040593          	mv	a1,s0
8000fe7c:	00048513          	mv	a0,s1
8000fe80:	024000ef          	jal	ra,8000fea4 <__swsetup_r>
8000fe84:	f2050ae3          	beqz	a0,8000fdb8 <__swbuf_r+0x60>
8000fe88:	fff00913          	li	s2,-1
8000fe8c:	fa5ff06f          	j	8000fe30 <__swbuf_r+0xd8>

Disassembly of section .text.__swbuf:

8000fe90 <__swbuf>:
8000fe90:	80c18793          	addi	a5,gp,-2036 # 80002fac <_impure_ptr>
8000fe94:	00058613          	mv	a2,a1
8000fe98:	00050593          	mv	a1,a0
8000fe9c:	0007a503          	lw	a0,0(a5)
8000fea0:	eb9ff06f          	j	8000fd58 <__swbuf_r>

Disassembly of section .text.__swsetup_r:

8000fea4 <__swsetup_r>:
8000fea4:	ff010113          	addi	sp,sp,-16
8000fea8:	80c18793          	addi	a5,gp,-2036 # 80002fac <_impure_ptr>
8000feac:	00912223          	sw	s1,4(sp)
8000feb0:	0007a483          	lw	s1,0(a5)
8000feb4:	00812423          	sw	s0,8(sp)
8000feb8:	01212023          	sw	s2,0(sp)
8000febc:	00112623          	sw	ra,12(sp)
8000fec0:	00050913          	mv	s2,a0
8000fec4:	00058413          	mv	s0,a1
8000fec8:	00048a63          	beqz	s1,8000fedc <__swsetup_r+0x38>
8000fecc:	0184a783          	lw	a5,24(s1)
8000fed0:	00079663          	bnez	a5,8000fedc <__swsetup_r+0x38>
8000fed4:	00048513          	mv	a0,s1
8000fed8:	bedfd0ef          	jal	ra,8000dac4 <__sinit>
8000fedc:	ffff3797          	auipc	a5,0xffff3
8000fee0:	eb878793          	addi	a5,a5,-328 # 80002d94 <__sf_fake_stdin>
8000fee4:	04f41863          	bne	s0,a5,8000ff34 <__swsetup_r+0x90>
8000fee8:	0044a403          	lw	s0,4(s1)
8000feec:	00c41703          	lh	a4,12(s0)
8000fef0:	01071793          	slli	a5,a4,0x10
8000fef4:	0107d793          	srli	a5,a5,0x10
8000fef8:	0087f693          	andi	a3,a5,8
8000fefc:	0a069463          	bnez	a3,8000ffa4 <__swsetup_r+0x100>
8000ff00:	0107f693          	andi	a3,a5,16
8000ff04:	04069c63          	bnez	a3,8000ff5c <__swsetup_r+0xb8>
8000ff08:	00900793          	li	a5,9
8000ff0c:	00f92023          	sw	a5,0(s2)
8000ff10:	04076713          	ori	a4,a4,64
8000ff14:	00e41623          	sh	a4,12(s0)
8000ff18:	fff00513          	li	a0,-1
8000ff1c:	00c12083          	lw	ra,12(sp)
8000ff20:	00812403          	lw	s0,8(sp)
8000ff24:	00412483          	lw	s1,4(sp)
8000ff28:	00012903          	lw	s2,0(sp)
8000ff2c:	01010113          	addi	sp,sp,16
8000ff30:	00008067          	ret
8000ff34:	ffff3797          	auipc	a5,0xffff3
8000ff38:	e8078793          	addi	a5,a5,-384 # 80002db4 <__sf_fake_stdout>
8000ff3c:	00f41663          	bne	s0,a5,8000ff48 <__swsetup_r+0xa4>
8000ff40:	0084a403          	lw	s0,8(s1)
8000ff44:	fa9ff06f          	j	8000feec <__swsetup_r+0x48>
8000ff48:	ffff3797          	auipc	a5,0xffff3
8000ff4c:	e2c78793          	addi	a5,a5,-468 # 80002d74 <__sf_fake_stderr>
8000ff50:	f8f41ee3          	bne	s0,a5,8000feec <__swsetup_r+0x48>
8000ff54:	00c4a403          	lw	s0,12(s1)
8000ff58:	f95ff06f          	j	8000feec <__swsetup_r+0x48>
8000ff5c:	0047f793          	andi	a5,a5,4
8000ff60:	02078c63          	beqz	a5,8000ff98 <__swsetup_r+0xf4>
8000ff64:	03442583          	lw	a1,52(s0)
8000ff68:	00058c63          	beqz	a1,8000ff80 <__swsetup_r+0xdc>
8000ff6c:	04440793          	addi	a5,s0,68
8000ff70:	00f58663          	beq	a1,a5,8000ff7c <__swsetup_r+0xd8>
8000ff74:	00090513          	mv	a0,s2
8000ff78:	84cfe0ef          	jal	ra,8000dfc4 <_free_r>
8000ff7c:	02042a23          	sw	zero,52(s0)
8000ff80:	00c45783          	lhu	a5,12(s0)
8000ff84:	00042223          	sw	zero,4(s0)
8000ff88:	fdb7f793          	andi	a5,a5,-37
8000ff8c:	00f41623          	sh	a5,12(s0)
8000ff90:	01042783          	lw	a5,16(s0)
8000ff94:	00f42023          	sw	a5,0(s0)
8000ff98:	00c45783          	lhu	a5,12(s0)
8000ff9c:	0087e793          	ori	a5,a5,8
8000ffa0:	00f41623          	sh	a5,12(s0)
8000ffa4:	01042783          	lw	a5,16(s0)
8000ffa8:	02079063          	bnez	a5,8000ffc8 <__swsetup_r+0x124>
8000ffac:	00c45783          	lhu	a5,12(s0)
8000ffb0:	20000713          	li	a4,512
8000ffb4:	2807f793          	andi	a5,a5,640
8000ffb8:	00e78863          	beq	a5,a4,8000ffc8 <__swsetup_r+0x124>
8000ffbc:	00040593          	mv	a1,s0
8000ffc0:	00090513          	mv	a0,s2
8000ffc4:	548000ef          	jal	ra,8001050c <__smakebuf_r>
8000ffc8:	00c45783          	lhu	a5,12(s0)
8000ffcc:	0017f713          	andi	a4,a5,1
8000ffd0:	02070c63          	beqz	a4,80010008 <__swsetup_r+0x164>
8000ffd4:	01442783          	lw	a5,20(s0)
8000ffd8:	00042423          	sw	zero,8(s0)
8000ffdc:	40f007b3          	neg	a5,a5
8000ffe0:	00f42c23          	sw	a5,24(s0)
8000ffe4:	01042783          	lw	a5,16(s0)
8000ffe8:	00000513          	li	a0,0
8000ffec:	f20798e3          	bnez	a5,8000ff1c <__swsetup_r+0x78>
8000fff0:	00c41783          	lh	a5,12(s0)
8000fff4:	0807f713          	andi	a4,a5,128
8000fff8:	f20702e3          	beqz	a4,8000ff1c <__swsetup_r+0x78>
8000fffc:	0407e793          	ori	a5,a5,64
80010000:	00f41623          	sh	a5,12(s0)
80010004:	f15ff06f          	j	8000ff18 <__swsetup_r+0x74>
80010008:	0027f793          	andi	a5,a5,2
8001000c:	00000713          	li	a4,0
80010010:	00079463          	bnez	a5,80010018 <__swsetup_r+0x174>
80010014:	01442703          	lw	a4,20(s0)
80010018:	00e42423          	sw	a4,8(s0)
8001001c:	fc9ff06f          	j	8000ffe4 <__swsetup_r+0x140>

Disassembly of section .text.__sfvwrite_r:

80010020 <__sfvwrite_r>:
80010020:	00862783          	lw	a5,8(a2)
80010024:	00079863          	bnez	a5,80010034 <__sfvwrite_r+0x14>
80010028:	00000793          	li	a5,0
8001002c:	00078513          	mv	a0,a5
80010030:	00008067          	ret
80010034:	00c5d783          	lhu	a5,12(a1)
80010038:	fc010113          	addi	sp,sp,-64
8001003c:	02812c23          	sw	s0,56(sp)
80010040:	03212823          	sw	s2,48(sp)
80010044:	03612023          	sw	s6,32(sp)
80010048:	02112e23          	sw	ra,60(sp)
8001004c:	02912a23          	sw	s1,52(sp)
80010050:	03312623          	sw	s3,44(sp)
80010054:	03412423          	sw	s4,40(sp)
80010058:	03512223          	sw	s5,36(sp)
8001005c:	01712e23          	sw	s7,28(sp)
80010060:	01812c23          	sw	s8,24(sp)
80010064:	01912a23          	sw	s9,20(sp)
80010068:	01a12823          	sw	s10,16(sp)
8001006c:	01b12623          	sw	s11,12(sp)
80010070:	0087f793          	andi	a5,a5,8
80010074:	00060b13          	mv	s6,a2
80010078:	00058413          	mv	s0,a1
8001007c:	00050913          	mv	s2,a0
80010080:	0e078263          	beqz	a5,80010164 <__sfvwrite_r+0x144>
80010084:	0105a783          	lw	a5,16(a1)
80010088:	0c078e63          	beqz	a5,80010164 <__sfvwrite_r+0x144>
8001008c:	00c45783          	lhu	a5,12(s0)
80010090:	000b2a03          	lw	s4,0(s6)
80010094:	0027f713          	andi	a4,a5,2
80010098:	16071a63          	bnez	a4,8001020c <__sfvwrite_r+0x1ec>
8001009c:	0017f793          	andi	a5,a5,1
800100a0:	00000b93          	li	s7,0
800100a4:	20078a63          	beqz	a5,800102b8 <__sfvwrite_r+0x298>
800100a8:	00000513          	li	a0,0
800100ac:	00000a93          	li	s5,0
800100b0:	00000993          	li	s3,0
800100b4:	36098463          	beqz	s3,8001041c <__sfvwrite_r+0x3fc>
800100b8:	02051263          	bnez	a0,800100dc <__sfvwrite_r+0xbc>
800100bc:	00098613          	mv	a2,s3
800100c0:	00a00593          	li	a1,10
800100c4:	000a8513          	mv	a0,s5
800100c8:	534000ef          	jal	ra,800105fc <memchr>
800100cc:	00198b93          	addi	s7,s3,1
800100d0:	00050663          	beqz	a0,800100dc <__sfvwrite_r+0xbc>
800100d4:	00150513          	addi	a0,a0,1
800100d8:	41550bb3          	sub	s7,a0,s5
800100dc:	000b8c13          	mv	s8,s7
800100e0:	0179f463          	bgeu	s3,s7,800100e8 <__sfvwrite_r+0xc8>
800100e4:	00098c13          	mv	s8,s3
800100e8:	00042503          	lw	a0,0(s0)
800100ec:	01042783          	lw	a5,16(s0)
800100f0:	01442683          	lw	a3,20(s0)
800100f4:	32a7fe63          	bgeu	a5,a0,80010430 <__sfvwrite_r+0x410>
800100f8:	00842483          	lw	s1,8(s0)
800100fc:	009684b3          	add	s1,a3,s1
80010100:	3384d863          	bge	s1,s8,80010430 <__sfvwrite_r+0x410>
80010104:	000a8593          	mv	a1,s5
80010108:	00048613          	mv	a2,s1
8001010c:	e09fd0ef          	jal	ra,8000df14 <memmove>
80010110:	00042783          	lw	a5,0(s0)
80010114:	00040593          	mv	a1,s0
80010118:	00090513          	mv	a0,s2
8001011c:	009787b3          	add	a5,a5,s1
80010120:	00f42023          	sw	a5,0(s0)
80010124:	fb0fd0ef          	jal	ra,8000d8d4 <_fflush_r>
80010128:	16051e63          	bnez	a0,800102a4 <__sfvwrite_r+0x284>
8001012c:	409b8bb3          	sub	s7,s7,s1
80010130:	00100513          	li	a0,1
80010134:	000b9a63          	bnez	s7,80010148 <__sfvwrite_r+0x128>
80010138:	00040593          	mv	a1,s0
8001013c:	00090513          	mv	a0,s2
80010140:	f94fd0ef          	jal	ra,8000d8d4 <_fflush_r>
80010144:	16051063          	bnez	a0,800102a4 <__sfvwrite_r+0x284>
80010148:	008b2783          	lw	a5,8(s6)
8001014c:	009a8ab3          	add	s5,s5,s1
80010150:	409989b3          	sub	s3,s3,s1
80010154:	409784b3          	sub	s1,a5,s1
80010158:	009b2423          	sw	s1,8(s6)
8001015c:	f4049ce3          	bnez	s1,800100b4 <__sfvwrite_r+0x94>
80010160:	0680006f          	j	800101c8 <__sfvwrite_r+0x1a8>
80010164:	00040593          	mv	a1,s0
80010168:	00090513          	mv	a0,s2
8001016c:	d39ff0ef          	jal	ra,8000fea4 <__swsetup_r>
80010170:	fff00793          	li	a5,-1
80010174:	f0050ce3          	beqz	a0,8001008c <__sfvwrite_r+0x6c>
80010178:	0540006f          	j	800101cc <__sfvwrite_r+0x1ac>
8001017c:	000a2983          	lw	s3,0(s4)
80010180:	004a2483          	lw	s1,4(s4)
80010184:	008a0a13          	addi	s4,s4,8
80010188:	fe048ae3          	beqz	s1,8001017c <__sfvwrite_r+0x15c>
8001018c:	00048693          	mv	a3,s1
80010190:	009af463          	bgeu	s5,s1,80010198 <__sfvwrite_r+0x178>
80010194:	000a8693          	mv	a3,s5
80010198:	02842783          	lw	a5,40(s0)
8001019c:	02042583          	lw	a1,32(s0)
800101a0:	00098613          	mv	a2,s3
800101a4:	00090513          	mv	a0,s2
800101a8:	000780e7          	jalr	a5
800101ac:	0ea05c63          	blez	a0,800102a4 <__sfvwrite_r+0x284>
800101b0:	008b2783          	lw	a5,8(s6)
800101b4:	00a989b3          	add	s3,s3,a0
800101b8:	40a484b3          	sub	s1,s1,a0
800101bc:	40a78533          	sub	a0,a5,a0
800101c0:	00ab2423          	sw	a0,8(s6)
800101c4:	fc0512e3          	bnez	a0,80010188 <__sfvwrite_r+0x168>
800101c8:	00000793          	li	a5,0
800101cc:	03c12083          	lw	ra,60(sp)
800101d0:	03812403          	lw	s0,56(sp)
800101d4:	03412483          	lw	s1,52(sp)
800101d8:	03012903          	lw	s2,48(sp)
800101dc:	02c12983          	lw	s3,44(sp)
800101e0:	02812a03          	lw	s4,40(sp)
800101e4:	02412a83          	lw	s5,36(sp)
800101e8:	02012b03          	lw	s6,32(sp)
800101ec:	01c12b83          	lw	s7,28(sp)
800101f0:	01812c03          	lw	s8,24(sp)
800101f4:	01412c83          	lw	s9,20(sp)
800101f8:	01012d03          	lw	s10,16(sp)
800101fc:	00c12d83          	lw	s11,12(sp)
80010200:	00078513          	mv	a0,a5
80010204:	04010113          	addi	sp,sp,64
80010208:	00008067          	ret
8001020c:	80000ab7          	lui	s5,0x80000
80010210:	00000993          	li	s3,0
80010214:	00000493          	li	s1,0
80010218:	c00aca93          	xori	s5,s5,-1024
8001021c:	f6dff06f          	j	80010188 <__sfvwrite_r+0x168>
80010220:	000a2b83          	lw	s7,0(s4)
80010224:	004a2483          	lw	s1,4(s4)
80010228:	008a0a13          	addi	s4,s4,8
8001022c:	fe048ae3          	beqz	s1,80010220 <__sfvwrite_r+0x200>
80010230:	00c45783          	lhu	a5,12(s0)
80010234:	00842d83          	lw	s11,8(s0)
80010238:	00042503          	lw	a0,0(s0)
8001023c:	2007f713          	andi	a4,a5,512
80010240:	14070263          	beqz	a4,80010384 <__sfvwrite_r+0x364>
80010244:	0db4e063          	bltu	s1,s11,80010304 <__sfvwrite_r+0x2e4>
80010248:	4807f713          	andi	a4,a5,1152
8001024c:	0a070c63          	beqz	a4,80010304 <__sfvwrite_r+0x2e4>
80010250:	01442703          	lw	a4,20(s0)
80010254:	01042583          	lw	a1,16(s0)
80010258:	00171a93          	slli	s5,a4,0x1
8001025c:	00ea8733          	add	a4,s5,a4
80010260:	01f75a93          	srli	s5,a4,0x1f
80010264:	40b50d33          	sub	s10,a0,a1
80010268:	00ea8ab3          	add	s5,s5,a4
8001026c:	001d0713          	addi	a4,s10,1
80010270:	401ada93          	srai	s5,s5,0x1
80010274:	00970733          	add	a4,a4,s1
80010278:	00eaf463          	bgeu	s5,a4,80010280 <__sfvwrite_r+0x260>
8001027c:	00070a93          	mv	s5,a4
80010280:	4007f793          	andi	a5,a5,1024
80010284:	0c078863          	beqz	a5,80010354 <__sfvwrite_r+0x334>
80010288:	000a8593          	mv	a1,s5
8001028c:	00090513          	mv	a0,s2
80010290:	e39fd0ef          	jal	ra,8000e0c8 <_malloc_r>
80010294:	00050993          	mv	s3,a0
80010298:	02051a63          	bnez	a0,800102cc <__sfvwrite_r+0x2ac>
8001029c:	00c00793          	li	a5,12
800102a0:	00f92023          	sw	a5,0(s2)
800102a4:	00c45783          	lhu	a5,12(s0)
800102a8:	0407e793          	ori	a5,a5,64
800102ac:	00f41623          	sh	a5,12(s0)
800102b0:	fff00793          	li	a5,-1
800102b4:	f19ff06f          	j	800101cc <__sfvwrite_r+0x1ac>
800102b8:	80000c37          	lui	s8,0x80000
800102bc:	ffec4c93          	xori	s9,s8,-2
800102c0:	00000493          	li	s1,0
800102c4:	fffc4c13          	not	s8,s8
800102c8:	f65ff06f          	j	8001022c <__sfvwrite_r+0x20c>
800102cc:	01042583          	lw	a1,16(s0)
800102d0:	000d0613          	mv	a2,s10
800102d4:	b69fd0ef          	jal	ra,8000de3c <memcpy>
800102d8:	00c45783          	lhu	a5,12(s0)
800102dc:	b7f7f793          	andi	a5,a5,-1153
800102e0:	0807e793          	ori	a5,a5,128
800102e4:	00f41623          	sh	a5,12(s0)
800102e8:	01342823          	sw	s3,16(s0)
800102ec:	01542a23          	sw	s5,20(s0)
800102f0:	01a989b3          	add	s3,s3,s10
800102f4:	41aa8ab3          	sub	s5,s5,s10
800102f8:	01342023          	sw	s3,0(s0)
800102fc:	00048d93          	mv	s11,s1
80010300:	01542423          	sw	s5,8(s0)
80010304:	00048993          	mv	s3,s1
80010308:	01b4f463          	bgeu	s1,s11,80010310 <__sfvwrite_r+0x2f0>
8001030c:	00048d93          	mv	s11,s1
80010310:	00042503          	lw	a0,0(s0)
80010314:	000d8613          	mv	a2,s11
80010318:	000b8593          	mv	a1,s7
8001031c:	bf9fd0ef          	jal	ra,8000df14 <memmove>
80010320:	00842783          	lw	a5,8(s0)
80010324:	41b787b3          	sub	a5,a5,s11
80010328:	00f42423          	sw	a5,8(s0)
8001032c:	00042783          	lw	a5,0(s0)
80010330:	01b78db3          	add	s11,a5,s11
80010334:	01b42023          	sw	s11,0(s0)
80010338:	008b2783          	lw	a5,8(s6)
8001033c:	013b8bb3          	add	s7,s7,s3
80010340:	413484b3          	sub	s1,s1,s3
80010344:	413789b3          	sub	s3,a5,s3
80010348:	013b2423          	sw	s3,8(s6)
8001034c:	ee0990e3          	bnez	s3,8001022c <__sfvwrite_r+0x20c>
80010350:	e79ff06f          	j	800101c8 <__sfvwrite_r+0x1a8>
80010354:	000a8613          	mv	a2,s5
80010358:	00090513          	mv	a0,s2
8001035c:	2c4000ef          	jal	ra,80010620 <_realloc_r>
80010360:	00050993          	mv	s3,a0
80010364:	f80512e3          	bnez	a0,800102e8 <__sfvwrite_r+0x2c8>
80010368:	01042583          	lw	a1,16(s0)
8001036c:	00090513          	mv	a0,s2
80010370:	c55fd0ef          	jal	ra,8000dfc4 <_free_r>
80010374:	00c45783          	lhu	a5,12(s0)
80010378:	f7f7f793          	andi	a5,a5,-129
8001037c:	00f41623          	sh	a5,12(s0)
80010380:	f1dff06f          	j	8001029c <__sfvwrite_r+0x27c>
80010384:	01042783          	lw	a5,16(s0)
80010388:	00a7e663          	bltu	a5,a0,80010394 <__sfvwrite_r+0x374>
8001038c:	01442983          	lw	s3,20(s0)
80010390:	0534f663          	bgeu	s1,s3,800103dc <__sfvwrite_r+0x3bc>
80010394:	000d8993          	mv	s3,s11
80010398:	01b4f463          	bgeu	s1,s11,800103a0 <__sfvwrite_r+0x380>
8001039c:	00048993          	mv	s3,s1
800103a0:	00098613          	mv	a2,s3
800103a4:	000b8593          	mv	a1,s7
800103a8:	b6dfd0ef          	jal	ra,8000df14 <memmove>
800103ac:	00842783          	lw	a5,8(s0)
800103b0:	00042703          	lw	a4,0(s0)
800103b4:	413787b3          	sub	a5,a5,s3
800103b8:	01370733          	add	a4,a4,s3
800103bc:	00f42423          	sw	a5,8(s0)
800103c0:	00e42023          	sw	a4,0(s0)
800103c4:	f6079ae3          	bnez	a5,80010338 <__sfvwrite_r+0x318>
800103c8:	00040593          	mv	a1,s0
800103cc:	00090513          	mv	a0,s2
800103d0:	d04fd0ef          	jal	ra,8000d8d4 <_fflush_r>
800103d4:	f60502e3          	beqz	a0,80010338 <__sfvwrite_r+0x318>
800103d8:	ecdff06f          	j	800102a4 <__sfvwrite_r+0x284>
800103dc:	00048513          	mv	a0,s1
800103e0:	009cf463          	bgeu	s9,s1,800103e8 <__sfvwrite_r+0x3c8>
800103e4:	000c0513          	mv	a0,s8
800103e8:	00098593          	mv	a1,s3
800103ec:	d29fc0ef          	jal	ra,8000d114 <__divsi3>
800103f0:	00098593          	mv	a1,s3
800103f4:	cfdfc0ef          	jal	ra,8000d0f0 <__mulsi3>
800103f8:	02842783          	lw	a5,40(s0)
800103fc:	02042583          	lw	a1,32(s0)
80010400:	00050693          	mv	a3,a0
80010404:	000b8613          	mv	a2,s7
80010408:	00090513          	mv	a0,s2
8001040c:	000780e7          	jalr	a5
80010410:	00050993          	mv	s3,a0
80010414:	f2a042e3          	bgtz	a0,80010338 <__sfvwrite_r+0x318>
80010418:	e8dff06f          	j	800102a4 <__sfvwrite_r+0x284>
8001041c:	000a2a83          	lw	s5,0(s4)
80010420:	004a2983          	lw	s3,4(s4)
80010424:	00000513          	li	a0,0
80010428:	008a0a13          	addi	s4,s4,8
8001042c:	c89ff06f          	j	800100b4 <__sfvwrite_r+0x94>
80010430:	02dc4263          	blt	s8,a3,80010454 <__sfvwrite_r+0x434>
80010434:	02842783          	lw	a5,40(s0)
80010438:	02042583          	lw	a1,32(s0)
8001043c:	000a8613          	mv	a2,s5
80010440:	00090513          	mv	a0,s2
80010444:	000780e7          	jalr	a5
80010448:	00050493          	mv	s1,a0
8001044c:	cea040e3          	bgtz	a0,8001012c <__sfvwrite_r+0x10c>
80010450:	e55ff06f          	j	800102a4 <__sfvwrite_r+0x284>
80010454:	000c0613          	mv	a2,s8
80010458:	000a8593          	mv	a1,s5
8001045c:	ab9fd0ef          	jal	ra,8000df14 <memmove>
80010460:	00842783          	lw	a5,8(s0)
80010464:	000c0493          	mv	s1,s8
80010468:	418787b3          	sub	a5,a5,s8
8001046c:	00f42423          	sw	a5,8(s0)
80010470:	00042783          	lw	a5,0(s0)
80010474:	018787b3          	add	a5,a5,s8
80010478:	00f42023          	sw	a5,0(s0)
8001047c:	cb1ff06f          	j	8001012c <__sfvwrite_r+0x10c>

Disassembly of section .text.__swhatbuf_r:

80010480 <__swhatbuf_r>:
80010480:	f8010113          	addi	sp,sp,-128
80010484:	06912a23          	sw	s1,116(sp)
80010488:	00058493          	mv	s1,a1
8001048c:	00e59583          	lh	a1,14(a1)
80010490:	06812c23          	sw	s0,120(sp)
80010494:	06112e23          	sw	ra,124(sp)
80010498:	00060413          	mv	s0,a2
8001049c:	0005de63          	bgez	a1,800104b8 <__swhatbuf_r+0x38>
800104a0:	00c4d783          	lhu	a5,12(s1)
800104a4:	0006a023          	sw	zero,0(a3)
800104a8:	0807f793          	andi	a5,a5,128
800104ac:	04079063          	bnez	a5,800104ec <__swhatbuf_r+0x6c>
800104b0:	40000793          	li	a5,1024
800104b4:	03c0006f          	j	800104f0 <__swhatbuf_r+0x70>
800104b8:	01810613          	addi	a2,sp,24
800104bc:	00d12623          	sw	a3,12(sp)
800104c0:	1f8000ef          	jal	ra,800106b8 <_fstat_r>
800104c4:	00c12683          	lw	a3,12(sp)
800104c8:	fc054ce3          	bltz	a0,800104a0 <__swhatbuf_r+0x20>
800104cc:	01c12703          	lw	a4,28(sp)
800104d0:	0000f7b7          	lui	a5,0xf
800104d4:	00e7f7b3          	and	a5,a5,a4
800104d8:	ffffe737          	lui	a4,0xffffe
800104dc:	00e787b3          	add	a5,a5,a4
800104e0:	0017b793          	seqz	a5,a5
800104e4:	00f6a023          	sw	a5,0(a3)
800104e8:	fc9ff06f          	j	800104b0 <__swhatbuf_r+0x30>
800104ec:	04000793          	li	a5,64
800104f0:	00f42023          	sw	a5,0(s0)
800104f4:	07c12083          	lw	ra,124(sp)
800104f8:	07812403          	lw	s0,120(sp)
800104fc:	07412483          	lw	s1,116(sp)
80010500:	00000513          	li	a0,0
80010504:	08010113          	addi	sp,sp,128
80010508:	00008067          	ret

Disassembly of section .text.__smakebuf_r:

8001050c <__smakebuf_r>:
8001050c:	00c5d783          	lhu	a5,12(a1)
80010510:	fe010113          	addi	sp,sp,-32
80010514:	00812c23          	sw	s0,24(sp)
80010518:	00112e23          	sw	ra,28(sp)
8001051c:	00912a23          	sw	s1,20(sp)
80010520:	01212823          	sw	s2,16(sp)
80010524:	0027f793          	andi	a5,a5,2
80010528:	00058413          	mv	s0,a1
8001052c:	02078863          	beqz	a5,8001055c <__smakebuf_r+0x50>
80010530:	04740793          	addi	a5,s0,71
80010534:	00f42023          	sw	a5,0(s0)
80010538:	00f42823          	sw	a5,16(s0)
8001053c:	00100793          	li	a5,1
80010540:	00f42a23          	sw	a5,20(s0)
80010544:	01c12083          	lw	ra,28(sp)
80010548:	01812403          	lw	s0,24(sp)
8001054c:	01412483          	lw	s1,20(sp)
80010550:	01012903          	lw	s2,16(sp)
80010554:	02010113          	addi	sp,sp,32
80010558:	00008067          	ret
8001055c:	00c10693          	addi	a3,sp,12
80010560:	00810613          	addi	a2,sp,8
80010564:	00050493          	mv	s1,a0
80010568:	f19ff0ef          	jal	ra,80010480 <__swhatbuf_r>
8001056c:	00812583          	lw	a1,8(sp)
80010570:	00050913          	mv	s2,a0
80010574:	00048513          	mv	a0,s1
80010578:	b51fd0ef          	jal	ra,8000e0c8 <_malloc_r>
8001057c:	02051063          	bnez	a0,8001059c <__smakebuf_r+0x90>
80010580:	00c41783          	lh	a5,12(s0)
80010584:	2007f713          	andi	a4,a5,512
80010588:	fa071ee3          	bnez	a4,80010544 <__smakebuf_r+0x38>
8001058c:	ffc7f793          	andi	a5,a5,-4
80010590:	0027e793          	ori	a5,a5,2
80010594:	00f41623          	sh	a5,12(s0)
80010598:	f99ff06f          	j	80010530 <__smakebuf_r+0x24>
8001059c:	ffffd797          	auipc	a5,0xffffd
800105a0:	49078793          	addi	a5,a5,1168 # 8000da2c <_cleanup_r>
800105a4:	02f4a423          	sw	a5,40(s1)
800105a8:	00c45783          	lhu	a5,12(s0)
800105ac:	00a42023          	sw	a0,0(s0)
800105b0:	00a42823          	sw	a0,16(s0)
800105b4:	0807e793          	ori	a5,a5,128
800105b8:	00f41623          	sh	a5,12(s0)
800105bc:	00812783          	lw	a5,8(sp)
800105c0:	00f42a23          	sw	a5,20(s0)
800105c4:	00c12783          	lw	a5,12(sp)
800105c8:	02078263          	beqz	a5,800105ec <__smakebuf_r+0xe0>
800105cc:	00e41583          	lh	a1,14(s0)
800105d0:	00048513          	mv	a0,s1
800105d4:	12c000ef          	jal	ra,80010700 <_isatty_r>
800105d8:	00050a63          	beqz	a0,800105ec <__smakebuf_r+0xe0>
800105dc:	00c45783          	lhu	a5,12(s0)
800105e0:	ffc7f793          	andi	a5,a5,-4
800105e4:	0017e793          	ori	a5,a5,1
800105e8:	00f41623          	sh	a5,12(s0)
800105ec:	00c45783          	lhu	a5,12(s0)
800105f0:	00f96933          	or	s2,s2,a5
800105f4:	01241623          	sh	s2,12(s0)
800105f8:	f4dff06f          	j	80010544 <__smakebuf_r+0x38>

Disassembly of section .text.memchr:

800105fc <memchr>:
800105fc:	0ff5f593          	andi	a1,a1,255
80010600:	00c50633          	add	a2,a0,a2
80010604:	00c51663          	bne	a0,a2,80010610 <memchr+0x14>
80010608:	00000513          	li	a0,0
8001060c:	00008067          	ret
80010610:	00054783          	lbu	a5,0(a0)
80010614:	feb78ce3          	beq	a5,a1,8001060c <memchr+0x10>
80010618:	00150513          	addi	a0,a0,1
8001061c:	fe9ff06f          	j	80010604 <memchr+0x8>

Disassembly of section .text._realloc_r:

80010620 <_realloc_r>:
80010620:	00059663          	bnez	a1,8001062c <_realloc_r+0xc>
80010624:	00060593          	mv	a1,a2
80010628:	aa1fd06f          	j	8000e0c8 <_malloc_r>
8001062c:	fe010113          	addi	sp,sp,-32
80010630:	00812c23          	sw	s0,24(sp)
80010634:	00112e23          	sw	ra,28(sp)
80010638:	00912a23          	sw	s1,20(sp)
8001063c:	01212823          	sw	s2,16(sp)
80010640:	01312623          	sw	s3,12(sp)
80010644:	00060413          	mv	s0,a2
80010648:	02061663          	bnez	a2,80010674 <_realloc_r+0x54>
8001064c:	979fd0ef          	jal	ra,8000dfc4 <_free_r>
80010650:	00000913          	li	s2,0
80010654:	01c12083          	lw	ra,28(sp)
80010658:	01812403          	lw	s0,24(sp)
8001065c:	00090513          	mv	a0,s2
80010660:	01412483          	lw	s1,20(sp)
80010664:	01012903          	lw	s2,16(sp)
80010668:	00c12983          	lw	s3,12(sp)
8001066c:	02010113          	addi	sp,sp,32
80010670:	00008067          	ret
80010674:	00058493          	mv	s1,a1
80010678:	00050993          	mv	s3,a0
8001067c:	0c8000ef          	jal	ra,80010744 <_malloc_usable_size_r>
80010680:	00048913          	mv	s2,s1
80010684:	fc8578e3          	bgeu	a0,s0,80010654 <_realloc_r+0x34>
80010688:	00040593          	mv	a1,s0
8001068c:	00098513          	mv	a0,s3
80010690:	a39fd0ef          	jal	ra,8000e0c8 <_malloc_r>
80010694:	00050913          	mv	s2,a0
80010698:	fa050ee3          	beqz	a0,80010654 <_realloc_r+0x34>
8001069c:	00048593          	mv	a1,s1
800106a0:	00040613          	mv	a2,s0
800106a4:	f98fd0ef          	jal	ra,8000de3c <memcpy>
800106a8:	00048593          	mv	a1,s1
800106ac:	00098513          	mv	a0,s3
800106b0:	915fd0ef          	jal	ra,8000dfc4 <_free_r>
800106b4:	fa1ff06f          	j	80010654 <_realloc_r+0x34>

Disassembly of section .text._fstat_r:

800106b8 <_fstat_r>:
800106b8:	ff010113          	addi	sp,sp,-16
800106bc:	00812423          	sw	s0,8(sp)
800106c0:	00050413          	mv	s0,a0
800106c4:	00058513          	mv	a0,a1
800106c8:	00060593          	mv	a1,a2
800106cc:	c201aa23          	sw	zero,-972(gp) # 800033d4 <errno>
800106d0:	00112623          	sw	ra,12(sp)
800106d4:	c14f50ef          	jal	ra,80005ae8 <_fstat>
800106d8:	fff00793          	li	a5,-1
800106dc:	00f51a63          	bne	a0,a5,800106f0 <_fstat_r+0x38>
800106e0:	c3418793          	addi	a5,gp,-972 # 800033d4 <errno>
800106e4:	0007a783          	lw	a5,0(a5)
800106e8:	00078463          	beqz	a5,800106f0 <_fstat_r+0x38>
800106ec:	00f42023          	sw	a5,0(s0)
800106f0:	00c12083          	lw	ra,12(sp)
800106f4:	00812403          	lw	s0,8(sp)
800106f8:	01010113          	addi	sp,sp,16
800106fc:	00008067          	ret

Disassembly of section .text._isatty_r:

80010700 <_isatty_r>:
80010700:	ff010113          	addi	sp,sp,-16
80010704:	00812423          	sw	s0,8(sp)
80010708:	00050413          	mv	s0,a0
8001070c:	00058513          	mv	a0,a1
80010710:	c201aa23          	sw	zero,-972(gp) # 800033d4 <errno>
80010714:	00112623          	sw	ra,12(sp)
80010718:	bc8f50ef          	jal	ra,80005ae0 <_isatty>
8001071c:	fff00793          	li	a5,-1
80010720:	00f51a63          	bne	a0,a5,80010734 <_isatty_r+0x34>
80010724:	c3418793          	addi	a5,gp,-972 # 800033d4 <errno>
80010728:	0007a783          	lw	a5,0(a5)
8001072c:	00078463          	beqz	a5,80010734 <_isatty_r+0x34>
80010730:	00f42023          	sw	a5,0(s0)
80010734:	00c12083          	lw	ra,12(sp)
80010738:	00812403          	lw	s0,8(sp)
8001073c:	01010113          	addi	sp,sp,16
80010740:	00008067          	ret

Disassembly of section .text._malloc_usable_size_r:

80010744 <_malloc_usable_size_r>:
80010744:	ffc5a783          	lw	a5,-4(a1)
80010748:	ffc78513          	addi	a0,a5,-4
8001074c:	0007d863          	bgez	a5,8001075c <_malloc_usable_size_r+0x18>
80010750:	00a585b3          	add	a1,a1,a0
80010754:	0005a783          	lw	a5,0(a1)
80010758:	00f50533          	add	a0,a0,a5
8001075c:	00008067          	ret
