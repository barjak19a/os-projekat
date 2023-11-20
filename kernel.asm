
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00004117          	auipc	sp,0x4
    80000004:	1d813103          	ld	sp,472(sp) # 800041d8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	7fd000ef          	jal	ra,80001018 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <main>:
//
// Created by os on 11/20/23.
//

void main (){
    80001000:	ff010113          	addi	sp,sp,-16
    80001004:	00813423          	sd	s0,8(sp)
    80001008:	01010413          	addi	s0,sp,16

    8000100c:	00813403          	ld	s0,8(sp)
    80001010:	01010113          	addi	sp,sp,16
    80001014:	00008067          	ret

0000000080001018 <start>:
    80001018:	ff010113          	addi	sp,sp,-16
    8000101c:	00813423          	sd	s0,8(sp)
    80001020:	01010413          	addi	s0,sp,16
    80001024:	300027f3          	csrr	a5,mstatus
    80001028:	ffffe737          	lui	a4,0xffffe
    8000102c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff938f>
    80001030:	00e7f7b3          	and	a5,a5,a4
    80001034:	00001737          	lui	a4,0x1
    80001038:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    8000103c:	00e7e7b3          	or	a5,a5,a4
    80001040:	30079073          	csrw	mstatus,a5
    80001044:	00000797          	auipc	a5,0x0
    80001048:	16078793          	addi	a5,a5,352 # 800011a4 <system_main>
    8000104c:	34179073          	csrw	mepc,a5
    80001050:	00000793          	li	a5,0
    80001054:	18079073          	csrw	satp,a5
    80001058:	000107b7          	lui	a5,0x10
    8000105c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001060:	30279073          	csrw	medeleg,a5
    80001064:	30379073          	csrw	mideleg,a5
    80001068:	104027f3          	csrr	a5,sie
    8000106c:	2227e793          	ori	a5,a5,546
    80001070:	10479073          	csrw	sie,a5
    80001074:	fff00793          	li	a5,-1
    80001078:	00a7d793          	srli	a5,a5,0xa
    8000107c:	3b079073          	csrw	pmpaddr0,a5
    80001080:	00f00793          	li	a5,15
    80001084:	3a079073          	csrw	pmpcfg0,a5
    80001088:	f14027f3          	csrr	a5,mhartid
    8000108c:	0200c737          	lui	a4,0x200c
    80001090:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001094:	0007869b          	sext.w	a3,a5
    80001098:	00269713          	slli	a4,a3,0x2
    8000109c:	000f4637          	lui	a2,0xf4
    800010a0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800010a4:	00d70733          	add	a4,a4,a3
    800010a8:	0037979b          	slliw	a5,a5,0x3
    800010ac:	020046b7          	lui	a3,0x2004
    800010b0:	00d787b3          	add	a5,a5,a3
    800010b4:	00c585b3          	add	a1,a1,a2
    800010b8:	00371693          	slli	a3,a4,0x3
    800010bc:	00003717          	auipc	a4,0x3
    800010c0:	16470713          	addi	a4,a4,356 # 80004220 <timer_scratch>
    800010c4:	00b7b023          	sd	a1,0(a5)
    800010c8:	00d70733          	add	a4,a4,a3
    800010cc:	00f73c23          	sd	a5,24(a4)
    800010d0:	02c73023          	sd	a2,32(a4)
    800010d4:	34071073          	csrw	mscratch,a4
    800010d8:	00000797          	auipc	a5,0x0
    800010dc:	6e878793          	addi	a5,a5,1768 # 800017c0 <timervec>
    800010e0:	30579073          	csrw	mtvec,a5
    800010e4:	300027f3          	csrr	a5,mstatus
    800010e8:	0087e793          	ori	a5,a5,8
    800010ec:	30079073          	csrw	mstatus,a5
    800010f0:	304027f3          	csrr	a5,mie
    800010f4:	0807e793          	ori	a5,a5,128
    800010f8:	30479073          	csrw	mie,a5
    800010fc:	f14027f3          	csrr	a5,mhartid
    80001100:	0007879b          	sext.w	a5,a5
    80001104:	00078213          	mv	tp,a5
    80001108:	30200073          	mret
    8000110c:	00813403          	ld	s0,8(sp)
    80001110:	01010113          	addi	sp,sp,16
    80001114:	00008067          	ret

0000000080001118 <timerinit>:
    80001118:	ff010113          	addi	sp,sp,-16
    8000111c:	00813423          	sd	s0,8(sp)
    80001120:	01010413          	addi	s0,sp,16
    80001124:	f14027f3          	csrr	a5,mhartid
    80001128:	0200c737          	lui	a4,0x200c
    8000112c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001130:	0007869b          	sext.w	a3,a5
    80001134:	00269713          	slli	a4,a3,0x2
    80001138:	000f4637          	lui	a2,0xf4
    8000113c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001140:	00d70733          	add	a4,a4,a3
    80001144:	0037979b          	slliw	a5,a5,0x3
    80001148:	020046b7          	lui	a3,0x2004
    8000114c:	00d787b3          	add	a5,a5,a3
    80001150:	00c585b3          	add	a1,a1,a2
    80001154:	00371693          	slli	a3,a4,0x3
    80001158:	00003717          	auipc	a4,0x3
    8000115c:	0c870713          	addi	a4,a4,200 # 80004220 <timer_scratch>
    80001160:	00b7b023          	sd	a1,0(a5)
    80001164:	00d70733          	add	a4,a4,a3
    80001168:	00f73c23          	sd	a5,24(a4)
    8000116c:	02c73023          	sd	a2,32(a4)
    80001170:	34071073          	csrw	mscratch,a4
    80001174:	00000797          	auipc	a5,0x0
    80001178:	64c78793          	addi	a5,a5,1612 # 800017c0 <timervec>
    8000117c:	30579073          	csrw	mtvec,a5
    80001180:	300027f3          	csrr	a5,mstatus
    80001184:	0087e793          	ori	a5,a5,8
    80001188:	30079073          	csrw	mstatus,a5
    8000118c:	304027f3          	csrr	a5,mie
    80001190:	0807e793          	ori	a5,a5,128
    80001194:	30479073          	csrw	mie,a5
    80001198:	00813403          	ld	s0,8(sp)
    8000119c:	01010113          	addi	sp,sp,16
    800011a0:	00008067          	ret

00000000800011a4 <system_main>:
    800011a4:	fe010113          	addi	sp,sp,-32
    800011a8:	00813823          	sd	s0,16(sp)
    800011ac:	00913423          	sd	s1,8(sp)
    800011b0:	00113c23          	sd	ra,24(sp)
    800011b4:	02010413          	addi	s0,sp,32
    800011b8:	00000097          	auipc	ra,0x0
    800011bc:	0c4080e7          	jalr	196(ra) # 8000127c <cpuid>
    800011c0:	00003497          	auipc	s1,0x3
    800011c4:	03048493          	addi	s1,s1,48 # 800041f0 <started>
    800011c8:	02050263          	beqz	a0,800011ec <system_main+0x48>
    800011cc:	0004a783          	lw	a5,0(s1)
    800011d0:	0007879b          	sext.w	a5,a5
    800011d4:	fe078ce3          	beqz	a5,800011cc <system_main+0x28>
    800011d8:	0ff0000f          	fence
    800011dc:	00003517          	auipc	a0,0x3
    800011e0:	e5450513          	addi	a0,a0,-428 # 80004030 <__memmove+0x10cc>
    800011e4:	00001097          	auipc	ra,0x1
    800011e8:	a78080e7          	jalr	-1416(ra) # 80001c5c <panic>
    800011ec:	00001097          	auipc	ra,0x1
    800011f0:	9cc080e7          	jalr	-1588(ra) # 80001bb8 <consoleinit>
    800011f4:	00001097          	auipc	ra,0x1
    800011f8:	158080e7          	jalr	344(ra) # 8000234c <printfinit>
    800011fc:	00003517          	auipc	a0,0x3
    80001200:	f1450513          	addi	a0,a0,-236 # 80004110 <__memmove+0x11ac>
    80001204:	00001097          	auipc	ra,0x1
    80001208:	ab4080e7          	jalr	-1356(ra) # 80001cb8 <__printf>
    8000120c:	00003517          	auipc	a0,0x3
    80001210:	df450513          	addi	a0,a0,-524 # 80004000 <__memmove+0x109c>
    80001214:	00001097          	auipc	ra,0x1
    80001218:	aa4080e7          	jalr	-1372(ra) # 80001cb8 <__printf>
    8000121c:	00003517          	auipc	a0,0x3
    80001220:	ef450513          	addi	a0,a0,-268 # 80004110 <__memmove+0x11ac>
    80001224:	00001097          	auipc	ra,0x1
    80001228:	a94080e7          	jalr	-1388(ra) # 80001cb8 <__printf>
    8000122c:	00001097          	auipc	ra,0x1
    80001230:	4ac080e7          	jalr	1196(ra) # 800026d8 <kinit>
    80001234:	00000097          	auipc	ra,0x0
    80001238:	148080e7          	jalr	328(ra) # 8000137c <trapinit>
    8000123c:	00000097          	auipc	ra,0x0
    80001240:	16c080e7          	jalr	364(ra) # 800013a8 <trapinithart>
    80001244:	00000097          	auipc	ra,0x0
    80001248:	5bc080e7          	jalr	1468(ra) # 80001800 <plicinit>
    8000124c:	00000097          	auipc	ra,0x0
    80001250:	5dc080e7          	jalr	1500(ra) # 80001828 <plicinithart>
    80001254:	00000097          	auipc	ra,0x0
    80001258:	078080e7          	jalr	120(ra) # 800012cc <userinit>
    8000125c:	0ff0000f          	fence
    80001260:	00100793          	li	a5,1
    80001264:	00003517          	auipc	a0,0x3
    80001268:	db450513          	addi	a0,a0,-588 # 80004018 <__memmove+0x10b4>
    8000126c:	00f4a023          	sw	a5,0(s1)
    80001270:	00001097          	auipc	ra,0x1
    80001274:	a48080e7          	jalr	-1464(ra) # 80001cb8 <__printf>
    80001278:	0000006f          	j	80001278 <system_main+0xd4>

000000008000127c <cpuid>:
    8000127c:	ff010113          	addi	sp,sp,-16
    80001280:	00813423          	sd	s0,8(sp)
    80001284:	01010413          	addi	s0,sp,16
    80001288:	00020513          	mv	a0,tp
    8000128c:	00813403          	ld	s0,8(sp)
    80001290:	0005051b          	sext.w	a0,a0
    80001294:	01010113          	addi	sp,sp,16
    80001298:	00008067          	ret

000000008000129c <mycpu>:
    8000129c:	ff010113          	addi	sp,sp,-16
    800012a0:	00813423          	sd	s0,8(sp)
    800012a4:	01010413          	addi	s0,sp,16
    800012a8:	00020793          	mv	a5,tp
    800012ac:	00813403          	ld	s0,8(sp)
    800012b0:	0007879b          	sext.w	a5,a5
    800012b4:	00779793          	slli	a5,a5,0x7
    800012b8:	00004517          	auipc	a0,0x4
    800012bc:	f9850513          	addi	a0,a0,-104 # 80005250 <cpus>
    800012c0:	00f50533          	add	a0,a0,a5
    800012c4:	01010113          	addi	sp,sp,16
    800012c8:	00008067          	ret

00000000800012cc <userinit>:
    800012cc:	ff010113          	addi	sp,sp,-16
    800012d0:	00813423          	sd	s0,8(sp)
    800012d4:	01010413          	addi	s0,sp,16
    800012d8:	00813403          	ld	s0,8(sp)
    800012dc:	01010113          	addi	sp,sp,16
    800012e0:	00000317          	auipc	t1,0x0
    800012e4:	d2030067          	jr	-736(t1) # 80001000 <main>

00000000800012e8 <either_copyout>:
    800012e8:	ff010113          	addi	sp,sp,-16
    800012ec:	00813023          	sd	s0,0(sp)
    800012f0:	00113423          	sd	ra,8(sp)
    800012f4:	01010413          	addi	s0,sp,16
    800012f8:	02051663          	bnez	a0,80001324 <either_copyout+0x3c>
    800012fc:	00058513          	mv	a0,a1
    80001300:	00060593          	mv	a1,a2
    80001304:	0006861b          	sext.w	a2,a3
    80001308:	00002097          	auipc	ra,0x2
    8000130c:	c5c080e7          	jalr	-932(ra) # 80002f64 <__memmove>
    80001310:	00813083          	ld	ra,8(sp)
    80001314:	00013403          	ld	s0,0(sp)
    80001318:	00000513          	li	a0,0
    8000131c:	01010113          	addi	sp,sp,16
    80001320:	00008067          	ret
    80001324:	00003517          	auipc	a0,0x3
    80001328:	d3450513          	addi	a0,a0,-716 # 80004058 <__memmove+0x10f4>
    8000132c:	00001097          	auipc	ra,0x1
    80001330:	930080e7          	jalr	-1744(ra) # 80001c5c <panic>

0000000080001334 <either_copyin>:
    80001334:	ff010113          	addi	sp,sp,-16
    80001338:	00813023          	sd	s0,0(sp)
    8000133c:	00113423          	sd	ra,8(sp)
    80001340:	01010413          	addi	s0,sp,16
    80001344:	02059463          	bnez	a1,8000136c <either_copyin+0x38>
    80001348:	00060593          	mv	a1,a2
    8000134c:	0006861b          	sext.w	a2,a3
    80001350:	00002097          	auipc	ra,0x2
    80001354:	c14080e7          	jalr	-1004(ra) # 80002f64 <__memmove>
    80001358:	00813083          	ld	ra,8(sp)
    8000135c:	00013403          	ld	s0,0(sp)
    80001360:	00000513          	li	a0,0
    80001364:	01010113          	addi	sp,sp,16
    80001368:	00008067          	ret
    8000136c:	00003517          	auipc	a0,0x3
    80001370:	d1450513          	addi	a0,a0,-748 # 80004080 <__memmove+0x111c>
    80001374:	00001097          	auipc	ra,0x1
    80001378:	8e8080e7          	jalr	-1816(ra) # 80001c5c <panic>

000000008000137c <trapinit>:
    8000137c:	ff010113          	addi	sp,sp,-16
    80001380:	00813423          	sd	s0,8(sp)
    80001384:	01010413          	addi	s0,sp,16
    80001388:	00813403          	ld	s0,8(sp)
    8000138c:	00003597          	auipc	a1,0x3
    80001390:	d1c58593          	addi	a1,a1,-740 # 800040a8 <__memmove+0x1144>
    80001394:	00004517          	auipc	a0,0x4
    80001398:	f3c50513          	addi	a0,a0,-196 # 800052d0 <tickslock>
    8000139c:	01010113          	addi	sp,sp,16
    800013a0:	00001317          	auipc	t1,0x1
    800013a4:	5c830067          	jr	1480(t1) # 80002968 <initlock>

00000000800013a8 <trapinithart>:
    800013a8:	ff010113          	addi	sp,sp,-16
    800013ac:	00813423          	sd	s0,8(sp)
    800013b0:	01010413          	addi	s0,sp,16
    800013b4:	00000797          	auipc	a5,0x0
    800013b8:	2fc78793          	addi	a5,a5,764 # 800016b0 <kernelvec>
    800013bc:	10579073          	csrw	stvec,a5
    800013c0:	00813403          	ld	s0,8(sp)
    800013c4:	01010113          	addi	sp,sp,16
    800013c8:	00008067          	ret

00000000800013cc <usertrap>:
    800013cc:	ff010113          	addi	sp,sp,-16
    800013d0:	00813423          	sd	s0,8(sp)
    800013d4:	01010413          	addi	s0,sp,16
    800013d8:	00813403          	ld	s0,8(sp)
    800013dc:	01010113          	addi	sp,sp,16
    800013e0:	00008067          	ret

00000000800013e4 <usertrapret>:
    800013e4:	ff010113          	addi	sp,sp,-16
    800013e8:	00813423          	sd	s0,8(sp)
    800013ec:	01010413          	addi	s0,sp,16
    800013f0:	00813403          	ld	s0,8(sp)
    800013f4:	01010113          	addi	sp,sp,16
    800013f8:	00008067          	ret

00000000800013fc <kerneltrap>:
    800013fc:	fe010113          	addi	sp,sp,-32
    80001400:	00813823          	sd	s0,16(sp)
    80001404:	00113c23          	sd	ra,24(sp)
    80001408:	00913423          	sd	s1,8(sp)
    8000140c:	02010413          	addi	s0,sp,32
    80001410:	142025f3          	csrr	a1,scause
    80001414:	100027f3          	csrr	a5,sstatus
    80001418:	0027f793          	andi	a5,a5,2
    8000141c:	10079c63          	bnez	a5,80001534 <kerneltrap+0x138>
    80001420:	142027f3          	csrr	a5,scause
    80001424:	0207ce63          	bltz	a5,80001460 <kerneltrap+0x64>
    80001428:	00003517          	auipc	a0,0x3
    8000142c:	cc850513          	addi	a0,a0,-824 # 800040f0 <__memmove+0x118c>
    80001430:	00001097          	auipc	ra,0x1
    80001434:	888080e7          	jalr	-1912(ra) # 80001cb8 <__printf>
    80001438:	141025f3          	csrr	a1,sepc
    8000143c:	14302673          	csrr	a2,stval
    80001440:	00003517          	auipc	a0,0x3
    80001444:	cc050513          	addi	a0,a0,-832 # 80004100 <__memmove+0x119c>
    80001448:	00001097          	auipc	ra,0x1
    8000144c:	870080e7          	jalr	-1936(ra) # 80001cb8 <__printf>
    80001450:	00003517          	auipc	a0,0x3
    80001454:	cc850513          	addi	a0,a0,-824 # 80004118 <__memmove+0x11b4>
    80001458:	00001097          	auipc	ra,0x1
    8000145c:	804080e7          	jalr	-2044(ra) # 80001c5c <panic>
    80001460:	0ff7f713          	andi	a4,a5,255
    80001464:	00900693          	li	a3,9
    80001468:	04d70063          	beq	a4,a3,800014a8 <kerneltrap+0xac>
    8000146c:	fff00713          	li	a4,-1
    80001470:	03f71713          	slli	a4,a4,0x3f
    80001474:	00170713          	addi	a4,a4,1
    80001478:	fae798e3          	bne	a5,a4,80001428 <kerneltrap+0x2c>
    8000147c:	00000097          	auipc	ra,0x0
    80001480:	e00080e7          	jalr	-512(ra) # 8000127c <cpuid>
    80001484:	06050663          	beqz	a0,800014f0 <kerneltrap+0xf4>
    80001488:	144027f3          	csrr	a5,sip
    8000148c:	ffd7f793          	andi	a5,a5,-3
    80001490:	14479073          	csrw	sip,a5
    80001494:	01813083          	ld	ra,24(sp)
    80001498:	01013403          	ld	s0,16(sp)
    8000149c:	00813483          	ld	s1,8(sp)
    800014a0:	02010113          	addi	sp,sp,32
    800014a4:	00008067          	ret
    800014a8:	00000097          	auipc	ra,0x0
    800014ac:	3cc080e7          	jalr	972(ra) # 80001874 <plic_claim>
    800014b0:	00a00793          	li	a5,10
    800014b4:	00050493          	mv	s1,a0
    800014b8:	06f50863          	beq	a0,a5,80001528 <kerneltrap+0x12c>
    800014bc:	fc050ce3          	beqz	a0,80001494 <kerneltrap+0x98>
    800014c0:	00050593          	mv	a1,a0
    800014c4:	00003517          	auipc	a0,0x3
    800014c8:	c0c50513          	addi	a0,a0,-1012 # 800040d0 <__memmove+0x116c>
    800014cc:	00000097          	auipc	ra,0x0
    800014d0:	7ec080e7          	jalr	2028(ra) # 80001cb8 <__printf>
    800014d4:	01013403          	ld	s0,16(sp)
    800014d8:	01813083          	ld	ra,24(sp)
    800014dc:	00048513          	mv	a0,s1
    800014e0:	00813483          	ld	s1,8(sp)
    800014e4:	02010113          	addi	sp,sp,32
    800014e8:	00000317          	auipc	t1,0x0
    800014ec:	3c430067          	jr	964(t1) # 800018ac <plic_complete>
    800014f0:	00004517          	auipc	a0,0x4
    800014f4:	de050513          	addi	a0,a0,-544 # 800052d0 <tickslock>
    800014f8:	00001097          	auipc	ra,0x1
    800014fc:	494080e7          	jalr	1172(ra) # 8000298c <acquire>
    80001500:	00003717          	auipc	a4,0x3
    80001504:	cf470713          	addi	a4,a4,-780 # 800041f4 <ticks>
    80001508:	00072783          	lw	a5,0(a4)
    8000150c:	00004517          	auipc	a0,0x4
    80001510:	dc450513          	addi	a0,a0,-572 # 800052d0 <tickslock>
    80001514:	0017879b          	addiw	a5,a5,1
    80001518:	00f72023          	sw	a5,0(a4)
    8000151c:	00001097          	auipc	ra,0x1
    80001520:	53c080e7          	jalr	1340(ra) # 80002a58 <release>
    80001524:	f65ff06f          	j	80001488 <kerneltrap+0x8c>
    80001528:	00001097          	auipc	ra,0x1
    8000152c:	098080e7          	jalr	152(ra) # 800025c0 <uartintr>
    80001530:	fa5ff06f          	j	800014d4 <kerneltrap+0xd8>
    80001534:	00003517          	auipc	a0,0x3
    80001538:	b7c50513          	addi	a0,a0,-1156 # 800040b0 <__memmove+0x114c>
    8000153c:	00000097          	auipc	ra,0x0
    80001540:	720080e7          	jalr	1824(ra) # 80001c5c <panic>

0000000080001544 <clockintr>:
    80001544:	fe010113          	addi	sp,sp,-32
    80001548:	00813823          	sd	s0,16(sp)
    8000154c:	00913423          	sd	s1,8(sp)
    80001550:	00113c23          	sd	ra,24(sp)
    80001554:	02010413          	addi	s0,sp,32
    80001558:	00004497          	auipc	s1,0x4
    8000155c:	d7848493          	addi	s1,s1,-648 # 800052d0 <tickslock>
    80001560:	00048513          	mv	a0,s1
    80001564:	00001097          	auipc	ra,0x1
    80001568:	428080e7          	jalr	1064(ra) # 8000298c <acquire>
    8000156c:	00003717          	auipc	a4,0x3
    80001570:	c8870713          	addi	a4,a4,-888 # 800041f4 <ticks>
    80001574:	00072783          	lw	a5,0(a4)
    80001578:	01013403          	ld	s0,16(sp)
    8000157c:	01813083          	ld	ra,24(sp)
    80001580:	00048513          	mv	a0,s1
    80001584:	0017879b          	addiw	a5,a5,1
    80001588:	00813483          	ld	s1,8(sp)
    8000158c:	00f72023          	sw	a5,0(a4)
    80001590:	02010113          	addi	sp,sp,32
    80001594:	00001317          	auipc	t1,0x1
    80001598:	4c430067          	jr	1220(t1) # 80002a58 <release>

000000008000159c <devintr>:
    8000159c:	142027f3          	csrr	a5,scause
    800015a0:	00000513          	li	a0,0
    800015a4:	0007c463          	bltz	a5,800015ac <devintr+0x10>
    800015a8:	00008067          	ret
    800015ac:	fe010113          	addi	sp,sp,-32
    800015b0:	00813823          	sd	s0,16(sp)
    800015b4:	00113c23          	sd	ra,24(sp)
    800015b8:	00913423          	sd	s1,8(sp)
    800015bc:	02010413          	addi	s0,sp,32
    800015c0:	0ff7f713          	andi	a4,a5,255
    800015c4:	00900693          	li	a3,9
    800015c8:	04d70c63          	beq	a4,a3,80001620 <devintr+0x84>
    800015cc:	fff00713          	li	a4,-1
    800015d0:	03f71713          	slli	a4,a4,0x3f
    800015d4:	00170713          	addi	a4,a4,1
    800015d8:	00e78c63          	beq	a5,a4,800015f0 <devintr+0x54>
    800015dc:	01813083          	ld	ra,24(sp)
    800015e0:	01013403          	ld	s0,16(sp)
    800015e4:	00813483          	ld	s1,8(sp)
    800015e8:	02010113          	addi	sp,sp,32
    800015ec:	00008067          	ret
    800015f0:	00000097          	auipc	ra,0x0
    800015f4:	c8c080e7          	jalr	-884(ra) # 8000127c <cpuid>
    800015f8:	06050663          	beqz	a0,80001664 <devintr+0xc8>
    800015fc:	144027f3          	csrr	a5,sip
    80001600:	ffd7f793          	andi	a5,a5,-3
    80001604:	14479073          	csrw	sip,a5
    80001608:	01813083          	ld	ra,24(sp)
    8000160c:	01013403          	ld	s0,16(sp)
    80001610:	00813483          	ld	s1,8(sp)
    80001614:	00200513          	li	a0,2
    80001618:	02010113          	addi	sp,sp,32
    8000161c:	00008067          	ret
    80001620:	00000097          	auipc	ra,0x0
    80001624:	254080e7          	jalr	596(ra) # 80001874 <plic_claim>
    80001628:	00a00793          	li	a5,10
    8000162c:	00050493          	mv	s1,a0
    80001630:	06f50663          	beq	a0,a5,8000169c <devintr+0x100>
    80001634:	00100513          	li	a0,1
    80001638:	fa0482e3          	beqz	s1,800015dc <devintr+0x40>
    8000163c:	00048593          	mv	a1,s1
    80001640:	00003517          	auipc	a0,0x3
    80001644:	a9050513          	addi	a0,a0,-1392 # 800040d0 <__memmove+0x116c>
    80001648:	00000097          	auipc	ra,0x0
    8000164c:	670080e7          	jalr	1648(ra) # 80001cb8 <__printf>
    80001650:	00048513          	mv	a0,s1
    80001654:	00000097          	auipc	ra,0x0
    80001658:	258080e7          	jalr	600(ra) # 800018ac <plic_complete>
    8000165c:	00100513          	li	a0,1
    80001660:	f7dff06f          	j	800015dc <devintr+0x40>
    80001664:	00004517          	auipc	a0,0x4
    80001668:	c6c50513          	addi	a0,a0,-916 # 800052d0 <tickslock>
    8000166c:	00001097          	auipc	ra,0x1
    80001670:	320080e7          	jalr	800(ra) # 8000298c <acquire>
    80001674:	00003717          	auipc	a4,0x3
    80001678:	b8070713          	addi	a4,a4,-1152 # 800041f4 <ticks>
    8000167c:	00072783          	lw	a5,0(a4)
    80001680:	00004517          	auipc	a0,0x4
    80001684:	c5050513          	addi	a0,a0,-944 # 800052d0 <tickslock>
    80001688:	0017879b          	addiw	a5,a5,1
    8000168c:	00f72023          	sw	a5,0(a4)
    80001690:	00001097          	auipc	ra,0x1
    80001694:	3c8080e7          	jalr	968(ra) # 80002a58 <release>
    80001698:	f65ff06f          	j	800015fc <devintr+0x60>
    8000169c:	00001097          	auipc	ra,0x1
    800016a0:	f24080e7          	jalr	-220(ra) # 800025c0 <uartintr>
    800016a4:	fadff06f          	j	80001650 <devintr+0xb4>
	...

00000000800016b0 <kernelvec>:
    800016b0:	f0010113          	addi	sp,sp,-256
    800016b4:	00113023          	sd	ra,0(sp)
    800016b8:	00213423          	sd	sp,8(sp)
    800016bc:	00313823          	sd	gp,16(sp)
    800016c0:	00413c23          	sd	tp,24(sp)
    800016c4:	02513023          	sd	t0,32(sp)
    800016c8:	02613423          	sd	t1,40(sp)
    800016cc:	02713823          	sd	t2,48(sp)
    800016d0:	02813c23          	sd	s0,56(sp)
    800016d4:	04913023          	sd	s1,64(sp)
    800016d8:	04a13423          	sd	a0,72(sp)
    800016dc:	04b13823          	sd	a1,80(sp)
    800016e0:	04c13c23          	sd	a2,88(sp)
    800016e4:	06d13023          	sd	a3,96(sp)
    800016e8:	06e13423          	sd	a4,104(sp)
    800016ec:	06f13823          	sd	a5,112(sp)
    800016f0:	07013c23          	sd	a6,120(sp)
    800016f4:	09113023          	sd	a7,128(sp)
    800016f8:	09213423          	sd	s2,136(sp)
    800016fc:	09313823          	sd	s3,144(sp)
    80001700:	09413c23          	sd	s4,152(sp)
    80001704:	0b513023          	sd	s5,160(sp)
    80001708:	0b613423          	sd	s6,168(sp)
    8000170c:	0b713823          	sd	s7,176(sp)
    80001710:	0b813c23          	sd	s8,184(sp)
    80001714:	0d913023          	sd	s9,192(sp)
    80001718:	0da13423          	sd	s10,200(sp)
    8000171c:	0db13823          	sd	s11,208(sp)
    80001720:	0dc13c23          	sd	t3,216(sp)
    80001724:	0fd13023          	sd	t4,224(sp)
    80001728:	0fe13423          	sd	t5,232(sp)
    8000172c:	0ff13823          	sd	t6,240(sp)
    80001730:	ccdff0ef          	jal	ra,800013fc <kerneltrap>
    80001734:	00013083          	ld	ra,0(sp)
    80001738:	00813103          	ld	sp,8(sp)
    8000173c:	01013183          	ld	gp,16(sp)
    80001740:	02013283          	ld	t0,32(sp)
    80001744:	02813303          	ld	t1,40(sp)
    80001748:	03013383          	ld	t2,48(sp)
    8000174c:	03813403          	ld	s0,56(sp)
    80001750:	04013483          	ld	s1,64(sp)
    80001754:	04813503          	ld	a0,72(sp)
    80001758:	05013583          	ld	a1,80(sp)
    8000175c:	05813603          	ld	a2,88(sp)
    80001760:	06013683          	ld	a3,96(sp)
    80001764:	06813703          	ld	a4,104(sp)
    80001768:	07013783          	ld	a5,112(sp)
    8000176c:	07813803          	ld	a6,120(sp)
    80001770:	08013883          	ld	a7,128(sp)
    80001774:	08813903          	ld	s2,136(sp)
    80001778:	09013983          	ld	s3,144(sp)
    8000177c:	09813a03          	ld	s4,152(sp)
    80001780:	0a013a83          	ld	s5,160(sp)
    80001784:	0a813b03          	ld	s6,168(sp)
    80001788:	0b013b83          	ld	s7,176(sp)
    8000178c:	0b813c03          	ld	s8,184(sp)
    80001790:	0c013c83          	ld	s9,192(sp)
    80001794:	0c813d03          	ld	s10,200(sp)
    80001798:	0d013d83          	ld	s11,208(sp)
    8000179c:	0d813e03          	ld	t3,216(sp)
    800017a0:	0e013e83          	ld	t4,224(sp)
    800017a4:	0e813f03          	ld	t5,232(sp)
    800017a8:	0f013f83          	ld	t6,240(sp)
    800017ac:	10010113          	addi	sp,sp,256
    800017b0:	10200073          	sret
    800017b4:	00000013          	nop
    800017b8:	00000013          	nop
    800017bc:	00000013          	nop

00000000800017c0 <timervec>:
    800017c0:	34051573          	csrrw	a0,mscratch,a0
    800017c4:	00b53023          	sd	a1,0(a0)
    800017c8:	00c53423          	sd	a2,8(a0)
    800017cc:	00d53823          	sd	a3,16(a0)
    800017d0:	01853583          	ld	a1,24(a0)
    800017d4:	02053603          	ld	a2,32(a0)
    800017d8:	0005b683          	ld	a3,0(a1)
    800017dc:	00c686b3          	add	a3,a3,a2
    800017e0:	00d5b023          	sd	a3,0(a1)
    800017e4:	00200593          	li	a1,2
    800017e8:	14459073          	csrw	sip,a1
    800017ec:	01053683          	ld	a3,16(a0)
    800017f0:	00853603          	ld	a2,8(a0)
    800017f4:	00053583          	ld	a1,0(a0)
    800017f8:	34051573          	csrrw	a0,mscratch,a0
    800017fc:	30200073          	mret

0000000080001800 <plicinit>:
    80001800:	ff010113          	addi	sp,sp,-16
    80001804:	00813423          	sd	s0,8(sp)
    80001808:	01010413          	addi	s0,sp,16
    8000180c:	00813403          	ld	s0,8(sp)
    80001810:	0c0007b7          	lui	a5,0xc000
    80001814:	00100713          	li	a4,1
    80001818:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000181c:	00e7a223          	sw	a4,4(a5)
    80001820:	01010113          	addi	sp,sp,16
    80001824:	00008067          	ret

0000000080001828 <plicinithart>:
    80001828:	ff010113          	addi	sp,sp,-16
    8000182c:	00813023          	sd	s0,0(sp)
    80001830:	00113423          	sd	ra,8(sp)
    80001834:	01010413          	addi	s0,sp,16
    80001838:	00000097          	auipc	ra,0x0
    8000183c:	a44080e7          	jalr	-1468(ra) # 8000127c <cpuid>
    80001840:	0085171b          	slliw	a4,a0,0x8
    80001844:	0c0027b7          	lui	a5,0xc002
    80001848:	00e787b3          	add	a5,a5,a4
    8000184c:	40200713          	li	a4,1026
    80001850:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80001854:	00813083          	ld	ra,8(sp)
    80001858:	00013403          	ld	s0,0(sp)
    8000185c:	00d5151b          	slliw	a0,a0,0xd
    80001860:	0c2017b7          	lui	a5,0xc201
    80001864:	00a78533          	add	a0,a5,a0
    80001868:	00052023          	sw	zero,0(a0)
    8000186c:	01010113          	addi	sp,sp,16
    80001870:	00008067          	ret

0000000080001874 <plic_claim>:
    80001874:	ff010113          	addi	sp,sp,-16
    80001878:	00813023          	sd	s0,0(sp)
    8000187c:	00113423          	sd	ra,8(sp)
    80001880:	01010413          	addi	s0,sp,16
    80001884:	00000097          	auipc	ra,0x0
    80001888:	9f8080e7          	jalr	-1544(ra) # 8000127c <cpuid>
    8000188c:	00813083          	ld	ra,8(sp)
    80001890:	00013403          	ld	s0,0(sp)
    80001894:	00d5151b          	slliw	a0,a0,0xd
    80001898:	0c2017b7          	lui	a5,0xc201
    8000189c:	00a78533          	add	a0,a5,a0
    800018a0:	00452503          	lw	a0,4(a0)
    800018a4:	01010113          	addi	sp,sp,16
    800018a8:	00008067          	ret

00000000800018ac <plic_complete>:
    800018ac:	fe010113          	addi	sp,sp,-32
    800018b0:	00813823          	sd	s0,16(sp)
    800018b4:	00913423          	sd	s1,8(sp)
    800018b8:	00113c23          	sd	ra,24(sp)
    800018bc:	02010413          	addi	s0,sp,32
    800018c0:	00050493          	mv	s1,a0
    800018c4:	00000097          	auipc	ra,0x0
    800018c8:	9b8080e7          	jalr	-1608(ra) # 8000127c <cpuid>
    800018cc:	01813083          	ld	ra,24(sp)
    800018d0:	01013403          	ld	s0,16(sp)
    800018d4:	00d5179b          	slliw	a5,a0,0xd
    800018d8:	0c201737          	lui	a4,0xc201
    800018dc:	00f707b3          	add	a5,a4,a5
    800018e0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800018e4:	00813483          	ld	s1,8(sp)
    800018e8:	02010113          	addi	sp,sp,32
    800018ec:	00008067          	ret

00000000800018f0 <consolewrite>:
    800018f0:	fb010113          	addi	sp,sp,-80
    800018f4:	04813023          	sd	s0,64(sp)
    800018f8:	04113423          	sd	ra,72(sp)
    800018fc:	02913c23          	sd	s1,56(sp)
    80001900:	03213823          	sd	s2,48(sp)
    80001904:	03313423          	sd	s3,40(sp)
    80001908:	03413023          	sd	s4,32(sp)
    8000190c:	01513c23          	sd	s5,24(sp)
    80001910:	05010413          	addi	s0,sp,80
    80001914:	06c05c63          	blez	a2,8000198c <consolewrite+0x9c>
    80001918:	00060993          	mv	s3,a2
    8000191c:	00050a13          	mv	s4,a0
    80001920:	00058493          	mv	s1,a1
    80001924:	00000913          	li	s2,0
    80001928:	fff00a93          	li	s5,-1
    8000192c:	01c0006f          	j	80001948 <consolewrite+0x58>
    80001930:	fbf44503          	lbu	a0,-65(s0)
    80001934:	0019091b          	addiw	s2,s2,1
    80001938:	00148493          	addi	s1,s1,1
    8000193c:	00001097          	auipc	ra,0x1
    80001940:	a9c080e7          	jalr	-1380(ra) # 800023d8 <uartputc>
    80001944:	03298063          	beq	s3,s2,80001964 <consolewrite+0x74>
    80001948:	00048613          	mv	a2,s1
    8000194c:	00100693          	li	a3,1
    80001950:	000a0593          	mv	a1,s4
    80001954:	fbf40513          	addi	a0,s0,-65
    80001958:	00000097          	auipc	ra,0x0
    8000195c:	9dc080e7          	jalr	-1572(ra) # 80001334 <either_copyin>
    80001960:	fd5518e3          	bne	a0,s5,80001930 <consolewrite+0x40>
    80001964:	04813083          	ld	ra,72(sp)
    80001968:	04013403          	ld	s0,64(sp)
    8000196c:	03813483          	ld	s1,56(sp)
    80001970:	02813983          	ld	s3,40(sp)
    80001974:	02013a03          	ld	s4,32(sp)
    80001978:	01813a83          	ld	s5,24(sp)
    8000197c:	00090513          	mv	a0,s2
    80001980:	03013903          	ld	s2,48(sp)
    80001984:	05010113          	addi	sp,sp,80
    80001988:	00008067          	ret
    8000198c:	00000913          	li	s2,0
    80001990:	fd5ff06f          	j	80001964 <consolewrite+0x74>

0000000080001994 <consoleread>:
    80001994:	f9010113          	addi	sp,sp,-112
    80001998:	06813023          	sd	s0,96(sp)
    8000199c:	04913c23          	sd	s1,88(sp)
    800019a0:	05213823          	sd	s2,80(sp)
    800019a4:	05313423          	sd	s3,72(sp)
    800019a8:	05413023          	sd	s4,64(sp)
    800019ac:	03513c23          	sd	s5,56(sp)
    800019b0:	03613823          	sd	s6,48(sp)
    800019b4:	03713423          	sd	s7,40(sp)
    800019b8:	03813023          	sd	s8,32(sp)
    800019bc:	06113423          	sd	ra,104(sp)
    800019c0:	01913c23          	sd	s9,24(sp)
    800019c4:	07010413          	addi	s0,sp,112
    800019c8:	00060b93          	mv	s7,a2
    800019cc:	00050913          	mv	s2,a0
    800019d0:	00058c13          	mv	s8,a1
    800019d4:	00060b1b          	sext.w	s6,a2
    800019d8:	00004497          	auipc	s1,0x4
    800019dc:	91048493          	addi	s1,s1,-1776 # 800052e8 <cons>
    800019e0:	00400993          	li	s3,4
    800019e4:	fff00a13          	li	s4,-1
    800019e8:	00a00a93          	li	s5,10
    800019ec:	05705e63          	blez	s7,80001a48 <consoleread+0xb4>
    800019f0:	09c4a703          	lw	a4,156(s1)
    800019f4:	0984a783          	lw	a5,152(s1)
    800019f8:	0007071b          	sext.w	a4,a4
    800019fc:	08e78463          	beq	a5,a4,80001a84 <consoleread+0xf0>
    80001a00:	07f7f713          	andi	a4,a5,127
    80001a04:	00e48733          	add	a4,s1,a4
    80001a08:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80001a0c:	0017869b          	addiw	a3,a5,1
    80001a10:	08d4ac23          	sw	a3,152(s1)
    80001a14:	00070c9b          	sext.w	s9,a4
    80001a18:	0b370663          	beq	a4,s3,80001ac4 <consoleread+0x130>
    80001a1c:	00100693          	li	a3,1
    80001a20:	f9f40613          	addi	a2,s0,-97
    80001a24:	000c0593          	mv	a1,s8
    80001a28:	00090513          	mv	a0,s2
    80001a2c:	f8e40fa3          	sb	a4,-97(s0)
    80001a30:	00000097          	auipc	ra,0x0
    80001a34:	8b8080e7          	jalr	-1864(ra) # 800012e8 <either_copyout>
    80001a38:	01450863          	beq	a0,s4,80001a48 <consoleread+0xb4>
    80001a3c:	001c0c13          	addi	s8,s8,1
    80001a40:	fffb8b9b          	addiw	s7,s7,-1
    80001a44:	fb5c94e3          	bne	s9,s5,800019ec <consoleread+0x58>
    80001a48:	000b851b          	sext.w	a0,s7
    80001a4c:	06813083          	ld	ra,104(sp)
    80001a50:	06013403          	ld	s0,96(sp)
    80001a54:	05813483          	ld	s1,88(sp)
    80001a58:	05013903          	ld	s2,80(sp)
    80001a5c:	04813983          	ld	s3,72(sp)
    80001a60:	04013a03          	ld	s4,64(sp)
    80001a64:	03813a83          	ld	s5,56(sp)
    80001a68:	02813b83          	ld	s7,40(sp)
    80001a6c:	02013c03          	ld	s8,32(sp)
    80001a70:	01813c83          	ld	s9,24(sp)
    80001a74:	40ab053b          	subw	a0,s6,a0
    80001a78:	03013b03          	ld	s6,48(sp)
    80001a7c:	07010113          	addi	sp,sp,112
    80001a80:	00008067          	ret
    80001a84:	00001097          	auipc	ra,0x1
    80001a88:	1d8080e7          	jalr	472(ra) # 80002c5c <push_on>
    80001a8c:	0984a703          	lw	a4,152(s1)
    80001a90:	09c4a783          	lw	a5,156(s1)
    80001a94:	0007879b          	sext.w	a5,a5
    80001a98:	fef70ce3          	beq	a4,a5,80001a90 <consoleread+0xfc>
    80001a9c:	00001097          	auipc	ra,0x1
    80001aa0:	234080e7          	jalr	564(ra) # 80002cd0 <pop_on>
    80001aa4:	0984a783          	lw	a5,152(s1)
    80001aa8:	07f7f713          	andi	a4,a5,127
    80001aac:	00e48733          	add	a4,s1,a4
    80001ab0:	01874703          	lbu	a4,24(a4)
    80001ab4:	0017869b          	addiw	a3,a5,1
    80001ab8:	08d4ac23          	sw	a3,152(s1)
    80001abc:	00070c9b          	sext.w	s9,a4
    80001ac0:	f5371ee3          	bne	a4,s3,80001a1c <consoleread+0x88>
    80001ac4:	000b851b          	sext.w	a0,s7
    80001ac8:	f96bf2e3          	bgeu	s7,s6,80001a4c <consoleread+0xb8>
    80001acc:	08f4ac23          	sw	a5,152(s1)
    80001ad0:	f7dff06f          	j	80001a4c <consoleread+0xb8>

0000000080001ad4 <consputc>:
    80001ad4:	10000793          	li	a5,256
    80001ad8:	00f50663          	beq	a0,a5,80001ae4 <consputc+0x10>
    80001adc:	00001317          	auipc	t1,0x1
    80001ae0:	9f430067          	jr	-1548(t1) # 800024d0 <uartputc_sync>
    80001ae4:	ff010113          	addi	sp,sp,-16
    80001ae8:	00113423          	sd	ra,8(sp)
    80001aec:	00813023          	sd	s0,0(sp)
    80001af0:	01010413          	addi	s0,sp,16
    80001af4:	00800513          	li	a0,8
    80001af8:	00001097          	auipc	ra,0x1
    80001afc:	9d8080e7          	jalr	-1576(ra) # 800024d0 <uartputc_sync>
    80001b00:	02000513          	li	a0,32
    80001b04:	00001097          	auipc	ra,0x1
    80001b08:	9cc080e7          	jalr	-1588(ra) # 800024d0 <uartputc_sync>
    80001b0c:	00013403          	ld	s0,0(sp)
    80001b10:	00813083          	ld	ra,8(sp)
    80001b14:	00800513          	li	a0,8
    80001b18:	01010113          	addi	sp,sp,16
    80001b1c:	00001317          	auipc	t1,0x1
    80001b20:	9b430067          	jr	-1612(t1) # 800024d0 <uartputc_sync>

0000000080001b24 <consoleintr>:
    80001b24:	fe010113          	addi	sp,sp,-32
    80001b28:	00813823          	sd	s0,16(sp)
    80001b2c:	00913423          	sd	s1,8(sp)
    80001b30:	01213023          	sd	s2,0(sp)
    80001b34:	00113c23          	sd	ra,24(sp)
    80001b38:	02010413          	addi	s0,sp,32
    80001b3c:	00003917          	auipc	s2,0x3
    80001b40:	7ac90913          	addi	s2,s2,1964 # 800052e8 <cons>
    80001b44:	00050493          	mv	s1,a0
    80001b48:	00090513          	mv	a0,s2
    80001b4c:	00001097          	auipc	ra,0x1
    80001b50:	e40080e7          	jalr	-448(ra) # 8000298c <acquire>
    80001b54:	02048c63          	beqz	s1,80001b8c <consoleintr+0x68>
    80001b58:	0a092783          	lw	a5,160(s2)
    80001b5c:	09892703          	lw	a4,152(s2)
    80001b60:	07f00693          	li	a3,127
    80001b64:	40e7873b          	subw	a4,a5,a4
    80001b68:	02e6e263          	bltu	a3,a4,80001b8c <consoleintr+0x68>
    80001b6c:	00d00713          	li	a4,13
    80001b70:	04e48063          	beq	s1,a4,80001bb0 <consoleintr+0x8c>
    80001b74:	07f7f713          	andi	a4,a5,127
    80001b78:	00e90733          	add	a4,s2,a4
    80001b7c:	0017879b          	addiw	a5,a5,1
    80001b80:	0af92023          	sw	a5,160(s2)
    80001b84:	00970c23          	sb	s1,24(a4)
    80001b88:	08f92e23          	sw	a5,156(s2)
    80001b8c:	01013403          	ld	s0,16(sp)
    80001b90:	01813083          	ld	ra,24(sp)
    80001b94:	00813483          	ld	s1,8(sp)
    80001b98:	00013903          	ld	s2,0(sp)
    80001b9c:	00003517          	auipc	a0,0x3
    80001ba0:	74c50513          	addi	a0,a0,1868 # 800052e8 <cons>
    80001ba4:	02010113          	addi	sp,sp,32
    80001ba8:	00001317          	auipc	t1,0x1
    80001bac:	eb030067          	jr	-336(t1) # 80002a58 <release>
    80001bb0:	00a00493          	li	s1,10
    80001bb4:	fc1ff06f          	j	80001b74 <consoleintr+0x50>

0000000080001bb8 <consoleinit>:
    80001bb8:	fe010113          	addi	sp,sp,-32
    80001bbc:	00113c23          	sd	ra,24(sp)
    80001bc0:	00813823          	sd	s0,16(sp)
    80001bc4:	00913423          	sd	s1,8(sp)
    80001bc8:	02010413          	addi	s0,sp,32
    80001bcc:	00003497          	auipc	s1,0x3
    80001bd0:	71c48493          	addi	s1,s1,1820 # 800052e8 <cons>
    80001bd4:	00048513          	mv	a0,s1
    80001bd8:	00002597          	auipc	a1,0x2
    80001bdc:	55058593          	addi	a1,a1,1360 # 80004128 <__memmove+0x11c4>
    80001be0:	00001097          	auipc	ra,0x1
    80001be4:	d88080e7          	jalr	-632(ra) # 80002968 <initlock>
    80001be8:	00000097          	auipc	ra,0x0
    80001bec:	7ac080e7          	jalr	1964(ra) # 80002394 <uartinit>
    80001bf0:	01813083          	ld	ra,24(sp)
    80001bf4:	01013403          	ld	s0,16(sp)
    80001bf8:	00000797          	auipc	a5,0x0
    80001bfc:	d9c78793          	addi	a5,a5,-612 # 80001994 <consoleread>
    80001c00:	0af4bc23          	sd	a5,184(s1)
    80001c04:	00000797          	auipc	a5,0x0
    80001c08:	cec78793          	addi	a5,a5,-788 # 800018f0 <consolewrite>
    80001c0c:	0cf4b023          	sd	a5,192(s1)
    80001c10:	00813483          	ld	s1,8(sp)
    80001c14:	02010113          	addi	sp,sp,32
    80001c18:	00008067          	ret

0000000080001c1c <console_read>:
    80001c1c:	ff010113          	addi	sp,sp,-16
    80001c20:	00813423          	sd	s0,8(sp)
    80001c24:	01010413          	addi	s0,sp,16
    80001c28:	00813403          	ld	s0,8(sp)
    80001c2c:	00003317          	auipc	t1,0x3
    80001c30:	77433303          	ld	t1,1908(t1) # 800053a0 <devsw+0x10>
    80001c34:	01010113          	addi	sp,sp,16
    80001c38:	00030067          	jr	t1

0000000080001c3c <console_write>:
    80001c3c:	ff010113          	addi	sp,sp,-16
    80001c40:	00813423          	sd	s0,8(sp)
    80001c44:	01010413          	addi	s0,sp,16
    80001c48:	00813403          	ld	s0,8(sp)
    80001c4c:	00003317          	auipc	t1,0x3
    80001c50:	75c33303          	ld	t1,1884(t1) # 800053a8 <devsw+0x18>
    80001c54:	01010113          	addi	sp,sp,16
    80001c58:	00030067          	jr	t1

0000000080001c5c <panic>:
    80001c5c:	fe010113          	addi	sp,sp,-32
    80001c60:	00113c23          	sd	ra,24(sp)
    80001c64:	00813823          	sd	s0,16(sp)
    80001c68:	00913423          	sd	s1,8(sp)
    80001c6c:	02010413          	addi	s0,sp,32
    80001c70:	00050493          	mv	s1,a0
    80001c74:	00002517          	auipc	a0,0x2
    80001c78:	4bc50513          	addi	a0,a0,1212 # 80004130 <__memmove+0x11cc>
    80001c7c:	00003797          	auipc	a5,0x3
    80001c80:	7c07a623          	sw	zero,1996(a5) # 80005448 <pr+0x18>
    80001c84:	00000097          	auipc	ra,0x0
    80001c88:	034080e7          	jalr	52(ra) # 80001cb8 <__printf>
    80001c8c:	00048513          	mv	a0,s1
    80001c90:	00000097          	auipc	ra,0x0
    80001c94:	028080e7          	jalr	40(ra) # 80001cb8 <__printf>
    80001c98:	00002517          	auipc	a0,0x2
    80001c9c:	47850513          	addi	a0,a0,1144 # 80004110 <__memmove+0x11ac>
    80001ca0:	00000097          	auipc	ra,0x0
    80001ca4:	018080e7          	jalr	24(ra) # 80001cb8 <__printf>
    80001ca8:	00100793          	li	a5,1
    80001cac:	00002717          	auipc	a4,0x2
    80001cb0:	54f72623          	sw	a5,1356(a4) # 800041f8 <panicked>
    80001cb4:	0000006f          	j	80001cb4 <panic+0x58>

0000000080001cb8 <__printf>:
    80001cb8:	f3010113          	addi	sp,sp,-208
    80001cbc:	08813023          	sd	s0,128(sp)
    80001cc0:	07313423          	sd	s3,104(sp)
    80001cc4:	09010413          	addi	s0,sp,144
    80001cc8:	05813023          	sd	s8,64(sp)
    80001ccc:	08113423          	sd	ra,136(sp)
    80001cd0:	06913c23          	sd	s1,120(sp)
    80001cd4:	07213823          	sd	s2,112(sp)
    80001cd8:	07413023          	sd	s4,96(sp)
    80001cdc:	05513c23          	sd	s5,88(sp)
    80001ce0:	05613823          	sd	s6,80(sp)
    80001ce4:	05713423          	sd	s7,72(sp)
    80001ce8:	03913c23          	sd	s9,56(sp)
    80001cec:	03a13823          	sd	s10,48(sp)
    80001cf0:	03b13423          	sd	s11,40(sp)
    80001cf4:	00003317          	auipc	t1,0x3
    80001cf8:	73c30313          	addi	t1,t1,1852 # 80005430 <pr>
    80001cfc:	01832c03          	lw	s8,24(t1)
    80001d00:	00b43423          	sd	a1,8(s0)
    80001d04:	00c43823          	sd	a2,16(s0)
    80001d08:	00d43c23          	sd	a3,24(s0)
    80001d0c:	02e43023          	sd	a4,32(s0)
    80001d10:	02f43423          	sd	a5,40(s0)
    80001d14:	03043823          	sd	a6,48(s0)
    80001d18:	03143c23          	sd	a7,56(s0)
    80001d1c:	00050993          	mv	s3,a0
    80001d20:	4a0c1663          	bnez	s8,800021cc <__printf+0x514>
    80001d24:	60098c63          	beqz	s3,8000233c <__printf+0x684>
    80001d28:	0009c503          	lbu	a0,0(s3)
    80001d2c:	00840793          	addi	a5,s0,8
    80001d30:	f6f43c23          	sd	a5,-136(s0)
    80001d34:	00000493          	li	s1,0
    80001d38:	22050063          	beqz	a0,80001f58 <__printf+0x2a0>
    80001d3c:	00002a37          	lui	s4,0x2
    80001d40:	00018ab7          	lui	s5,0x18
    80001d44:	000f4b37          	lui	s6,0xf4
    80001d48:	00989bb7          	lui	s7,0x989
    80001d4c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80001d50:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80001d54:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80001d58:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80001d5c:	00148c9b          	addiw	s9,s1,1
    80001d60:	02500793          	li	a5,37
    80001d64:	01998933          	add	s2,s3,s9
    80001d68:	38f51263          	bne	a0,a5,800020ec <__printf+0x434>
    80001d6c:	00094783          	lbu	a5,0(s2)
    80001d70:	00078c9b          	sext.w	s9,a5
    80001d74:	1e078263          	beqz	a5,80001f58 <__printf+0x2a0>
    80001d78:	0024849b          	addiw	s1,s1,2
    80001d7c:	07000713          	li	a4,112
    80001d80:	00998933          	add	s2,s3,s1
    80001d84:	38e78a63          	beq	a5,a4,80002118 <__printf+0x460>
    80001d88:	20f76863          	bltu	a4,a5,80001f98 <__printf+0x2e0>
    80001d8c:	42a78863          	beq	a5,a0,800021bc <__printf+0x504>
    80001d90:	06400713          	li	a4,100
    80001d94:	40e79663          	bne	a5,a4,800021a0 <__printf+0x4e8>
    80001d98:	f7843783          	ld	a5,-136(s0)
    80001d9c:	0007a603          	lw	a2,0(a5)
    80001da0:	00878793          	addi	a5,a5,8
    80001da4:	f6f43c23          	sd	a5,-136(s0)
    80001da8:	42064a63          	bltz	a2,800021dc <__printf+0x524>
    80001dac:	00a00713          	li	a4,10
    80001db0:	02e677bb          	remuw	a5,a2,a4
    80001db4:	00002d97          	auipc	s11,0x2
    80001db8:	3a4d8d93          	addi	s11,s11,932 # 80004158 <digits>
    80001dbc:	00900593          	li	a1,9
    80001dc0:	0006051b          	sext.w	a0,a2
    80001dc4:	00000c93          	li	s9,0
    80001dc8:	02079793          	slli	a5,a5,0x20
    80001dcc:	0207d793          	srli	a5,a5,0x20
    80001dd0:	00fd87b3          	add	a5,s11,a5
    80001dd4:	0007c783          	lbu	a5,0(a5)
    80001dd8:	02e656bb          	divuw	a3,a2,a4
    80001ddc:	f8f40023          	sb	a5,-128(s0)
    80001de0:	14c5d863          	bge	a1,a2,80001f30 <__printf+0x278>
    80001de4:	06300593          	li	a1,99
    80001de8:	00100c93          	li	s9,1
    80001dec:	02e6f7bb          	remuw	a5,a3,a4
    80001df0:	02079793          	slli	a5,a5,0x20
    80001df4:	0207d793          	srli	a5,a5,0x20
    80001df8:	00fd87b3          	add	a5,s11,a5
    80001dfc:	0007c783          	lbu	a5,0(a5)
    80001e00:	02e6d73b          	divuw	a4,a3,a4
    80001e04:	f8f400a3          	sb	a5,-127(s0)
    80001e08:	12a5f463          	bgeu	a1,a0,80001f30 <__printf+0x278>
    80001e0c:	00a00693          	li	a3,10
    80001e10:	00900593          	li	a1,9
    80001e14:	02d777bb          	remuw	a5,a4,a3
    80001e18:	02079793          	slli	a5,a5,0x20
    80001e1c:	0207d793          	srli	a5,a5,0x20
    80001e20:	00fd87b3          	add	a5,s11,a5
    80001e24:	0007c503          	lbu	a0,0(a5)
    80001e28:	02d757bb          	divuw	a5,a4,a3
    80001e2c:	f8a40123          	sb	a0,-126(s0)
    80001e30:	48e5f263          	bgeu	a1,a4,800022b4 <__printf+0x5fc>
    80001e34:	06300513          	li	a0,99
    80001e38:	02d7f5bb          	remuw	a1,a5,a3
    80001e3c:	02059593          	slli	a1,a1,0x20
    80001e40:	0205d593          	srli	a1,a1,0x20
    80001e44:	00bd85b3          	add	a1,s11,a1
    80001e48:	0005c583          	lbu	a1,0(a1)
    80001e4c:	02d7d7bb          	divuw	a5,a5,a3
    80001e50:	f8b401a3          	sb	a1,-125(s0)
    80001e54:	48e57263          	bgeu	a0,a4,800022d8 <__printf+0x620>
    80001e58:	3e700513          	li	a0,999
    80001e5c:	02d7f5bb          	remuw	a1,a5,a3
    80001e60:	02059593          	slli	a1,a1,0x20
    80001e64:	0205d593          	srli	a1,a1,0x20
    80001e68:	00bd85b3          	add	a1,s11,a1
    80001e6c:	0005c583          	lbu	a1,0(a1)
    80001e70:	02d7d7bb          	divuw	a5,a5,a3
    80001e74:	f8b40223          	sb	a1,-124(s0)
    80001e78:	46e57663          	bgeu	a0,a4,800022e4 <__printf+0x62c>
    80001e7c:	02d7f5bb          	remuw	a1,a5,a3
    80001e80:	02059593          	slli	a1,a1,0x20
    80001e84:	0205d593          	srli	a1,a1,0x20
    80001e88:	00bd85b3          	add	a1,s11,a1
    80001e8c:	0005c583          	lbu	a1,0(a1)
    80001e90:	02d7d7bb          	divuw	a5,a5,a3
    80001e94:	f8b402a3          	sb	a1,-123(s0)
    80001e98:	46ea7863          	bgeu	s4,a4,80002308 <__printf+0x650>
    80001e9c:	02d7f5bb          	remuw	a1,a5,a3
    80001ea0:	02059593          	slli	a1,a1,0x20
    80001ea4:	0205d593          	srli	a1,a1,0x20
    80001ea8:	00bd85b3          	add	a1,s11,a1
    80001eac:	0005c583          	lbu	a1,0(a1)
    80001eb0:	02d7d7bb          	divuw	a5,a5,a3
    80001eb4:	f8b40323          	sb	a1,-122(s0)
    80001eb8:	3eeaf863          	bgeu	s5,a4,800022a8 <__printf+0x5f0>
    80001ebc:	02d7f5bb          	remuw	a1,a5,a3
    80001ec0:	02059593          	slli	a1,a1,0x20
    80001ec4:	0205d593          	srli	a1,a1,0x20
    80001ec8:	00bd85b3          	add	a1,s11,a1
    80001ecc:	0005c583          	lbu	a1,0(a1)
    80001ed0:	02d7d7bb          	divuw	a5,a5,a3
    80001ed4:	f8b403a3          	sb	a1,-121(s0)
    80001ed8:	42eb7e63          	bgeu	s6,a4,80002314 <__printf+0x65c>
    80001edc:	02d7f5bb          	remuw	a1,a5,a3
    80001ee0:	02059593          	slli	a1,a1,0x20
    80001ee4:	0205d593          	srli	a1,a1,0x20
    80001ee8:	00bd85b3          	add	a1,s11,a1
    80001eec:	0005c583          	lbu	a1,0(a1)
    80001ef0:	02d7d7bb          	divuw	a5,a5,a3
    80001ef4:	f8b40423          	sb	a1,-120(s0)
    80001ef8:	42ebfc63          	bgeu	s7,a4,80002330 <__printf+0x678>
    80001efc:	02079793          	slli	a5,a5,0x20
    80001f00:	0207d793          	srli	a5,a5,0x20
    80001f04:	00fd8db3          	add	s11,s11,a5
    80001f08:	000dc703          	lbu	a4,0(s11)
    80001f0c:	00a00793          	li	a5,10
    80001f10:	00900c93          	li	s9,9
    80001f14:	f8e404a3          	sb	a4,-119(s0)
    80001f18:	00065c63          	bgez	a2,80001f30 <__printf+0x278>
    80001f1c:	f9040713          	addi	a4,s0,-112
    80001f20:	00f70733          	add	a4,a4,a5
    80001f24:	02d00693          	li	a3,45
    80001f28:	fed70823          	sb	a3,-16(a4)
    80001f2c:	00078c93          	mv	s9,a5
    80001f30:	f8040793          	addi	a5,s0,-128
    80001f34:	01978cb3          	add	s9,a5,s9
    80001f38:	f7f40d13          	addi	s10,s0,-129
    80001f3c:	000cc503          	lbu	a0,0(s9)
    80001f40:	fffc8c93          	addi	s9,s9,-1
    80001f44:	00000097          	auipc	ra,0x0
    80001f48:	b90080e7          	jalr	-1136(ra) # 80001ad4 <consputc>
    80001f4c:	ffac98e3          	bne	s9,s10,80001f3c <__printf+0x284>
    80001f50:	00094503          	lbu	a0,0(s2)
    80001f54:	e00514e3          	bnez	a0,80001d5c <__printf+0xa4>
    80001f58:	1a0c1663          	bnez	s8,80002104 <__printf+0x44c>
    80001f5c:	08813083          	ld	ra,136(sp)
    80001f60:	08013403          	ld	s0,128(sp)
    80001f64:	07813483          	ld	s1,120(sp)
    80001f68:	07013903          	ld	s2,112(sp)
    80001f6c:	06813983          	ld	s3,104(sp)
    80001f70:	06013a03          	ld	s4,96(sp)
    80001f74:	05813a83          	ld	s5,88(sp)
    80001f78:	05013b03          	ld	s6,80(sp)
    80001f7c:	04813b83          	ld	s7,72(sp)
    80001f80:	04013c03          	ld	s8,64(sp)
    80001f84:	03813c83          	ld	s9,56(sp)
    80001f88:	03013d03          	ld	s10,48(sp)
    80001f8c:	02813d83          	ld	s11,40(sp)
    80001f90:	0d010113          	addi	sp,sp,208
    80001f94:	00008067          	ret
    80001f98:	07300713          	li	a4,115
    80001f9c:	1ce78a63          	beq	a5,a4,80002170 <__printf+0x4b8>
    80001fa0:	07800713          	li	a4,120
    80001fa4:	1ee79e63          	bne	a5,a4,800021a0 <__printf+0x4e8>
    80001fa8:	f7843783          	ld	a5,-136(s0)
    80001fac:	0007a703          	lw	a4,0(a5)
    80001fb0:	00878793          	addi	a5,a5,8
    80001fb4:	f6f43c23          	sd	a5,-136(s0)
    80001fb8:	28074263          	bltz	a4,8000223c <__printf+0x584>
    80001fbc:	00002d97          	auipc	s11,0x2
    80001fc0:	19cd8d93          	addi	s11,s11,412 # 80004158 <digits>
    80001fc4:	00f77793          	andi	a5,a4,15
    80001fc8:	00fd87b3          	add	a5,s11,a5
    80001fcc:	0007c683          	lbu	a3,0(a5)
    80001fd0:	00f00613          	li	a2,15
    80001fd4:	0007079b          	sext.w	a5,a4
    80001fd8:	f8d40023          	sb	a3,-128(s0)
    80001fdc:	0047559b          	srliw	a1,a4,0x4
    80001fe0:	0047569b          	srliw	a3,a4,0x4
    80001fe4:	00000c93          	li	s9,0
    80001fe8:	0ee65063          	bge	a2,a4,800020c8 <__printf+0x410>
    80001fec:	00f6f693          	andi	a3,a3,15
    80001ff0:	00dd86b3          	add	a3,s11,a3
    80001ff4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80001ff8:	0087d79b          	srliw	a5,a5,0x8
    80001ffc:	00100c93          	li	s9,1
    80002000:	f8d400a3          	sb	a3,-127(s0)
    80002004:	0cb67263          	bgeu	a2,a1,800020c8 <__printf+0x410>
    80002008:	00f7f693          	andi	a3,a5,15
    8000200c:	00dd86b3          	add	a3,s11,a3
    80002010:	0006c583          	lbu	a1,0(a3)
    80002014:	00f00613          	li	a2,15
    80002018:	0047d69b          	srliw	a3,a5,0x4
    8000201c:	f8b40123          	sb	a1,-126(s0)
    80002020:	0047d593          	srli	a1,a5,0x4
    80002024:	28f67e63          	bgeu	a2,a5,800022c0 <__printf+0x608>
    80002028:	00f6f693          	andi	a3,a3,15
    8000202c:	00dd86b3          	add	a3,s11,a3
    80002030:	0006c503          	lbu	a0,0(a3)
    80002034:	0087d813          	srli	a6,a5,0x8
    80002038:	0087d69b          	srliw	a3,a5,0x8
    8000203c:	f8a401a3          	sb	a0,-125(s0)
    80002040:	28b67663          	bgeu	a2,a1,800022cc <__printf+0x614>
    80002044:	00f6f693          	andi	a3,a3,15
    80002048:	00dd86b3          	add	a3,s11,a3
    8000204c:	0006c583          	lbu	a1,0(a3)
    80002050:	00c7d513          	srli	a0,a5,0xc
    80002054:	00c7d69b          	srliw	a3,a5,0xc
    80002058:	f8b40223          	sb	a1,-124(s0)
    8000205c:	29067a63          	bgeu	a2,a6,800022f0 <__printf+0x638>
    80002060:	00f6f693          	andi	a3,a3,15
    80002064:	00dd86b3          	add	a3,s11,a3
    80002068:	0006c583          	lbu	a1,0(a3)
    8000206c:	0107d813          	srli	a6,a5,0x10
    80002070:	0107d69b          	srliw	a3,a5,0x10
    80002074:	f8b402a3          	sb	a1,-123(s0)
    80002078:	28a67263          	bgeu	a2,a0,800022fc <__printf+0x644>
    8000207c:	00f6f693          	andi	a3,a3,15
    80002080:	00dd86b3          	add	a3,s11,a3
    80002084:	0006c683          	lbu	a3,0(a3)
    80002088:	0147d79b          	srliw	a5,a5,0x14
    8000208c:	f8d40323          	sb	a3,-122(s0)
    80002090:	21067663          	bgeu	a2,a6,8000229c <__printf+0x5e4>
    80002094:	02079793          	slli	a5,a5,0x20
    80002098:	0207d793          	srli	a5,a5,0x20
    8000209c:	00fd8db3          	add	s11,s11,a5
    800020a0:	000dc683          	lbu	a3,0(s11)
    800020a4:	00800793          	li	a5,8
    800020a8:	00700c93          	li	s9,7
    800020ac:	f8d403a3          	sb	a3,-121(s0)
    800020b0:	00075c63          	bgez	a4,800020c8 <__printf+0x410>
    800020b4:	f9040713          	addi	a4,s0,-112
    800020b8:	00f70733          	add	a4,a4,a5
    800020bc:	02d00693          	li	a3,45
    800020c0:	fed70823          	sb	a3,-16(a4)
    800020c4:	00078c93          	mv	s9,a5
    800020c8:	f8040793          	addi	a5,s0,-128
    800020cc:	01978cb3          	add	s9,a5,s9
    800020d0:	f7f40d13          	addi	s10,s0,-129
    800020d4:	000cc503          	lbu	a0,0(s9)
    800020d8:	fffc8c93          	addi	s9,s9,-1
    800020dc:	00000097          	auipc	ra,0x0
    800020e0:	9f8080e7          	jalr	-1544(ra) # 80001ad4 <consputc>
    800020e4:	ff9d18e3          	bne	s10,s9,800020d4 <__printf+0x41c>
    800020e8:	0100006f          	j	800020f8 <__printf+0x440>
    800020ec:	00000097          	auipc	ra,0x0
    800020f0:	9e8080e7          	jalr	-1560(ra) # 80001ad4 <consputc>
    800020f4:	000c8493          	mv	s1,s9
    800020f8:	00094503          	lbu	a0,0(s2)
    800020fc:	c60510e3          	bnez	a0,80001d5c <__printf+0xa4>
    80002100:	e40c0ee3          	beqz	s8,80001f5c <__printf+0x2a4>
    80002104:	00003517          	auipc	a0,0x3
    80002108:	32c50513          	addi	a0,a0,812 # 80005430 <pr>
    8000210c:	00001097          	auipc	ra,0x1
    80002110:	94c080e7          	jalr	-1716(ra) # 80002a58 <release>
    80002114:	e49ff06f          	j	80001f5c <__printf+0x2a4>
    80002118:	f7843783          	ld	a5,-136(s0)
    8000211c:	03000513          	li	a0,48
    80002120:	01000d13          	li	s10,16
    80002124:	00878713          	addi	a4,a5,8
    80002128:	0007bc83          	ld	s9,0(a5)
    8000212c:	f6e43c23          	sd	a4,-136(s0)
    80002130:	00000097          	auipc	ra,0x0
    80002134:	9a4080e7          	jalr	-1628(ra) # 80001ad4 <consputc>
    80002138:	07800513          	li	a0,120
    8000213c:	00000097          	auipc	ra,0x0
    80002140:	998080e7          	jalr	-1640(ra) # 80001ad4 <consputc>
    80002144:	00002d97          	auipc	s11,0x2
    80002148:	014d8d93          	addi	s11,s11,20 # 80004158 <digits>
    8000214c:	03ccd793          	srli	a5,s9,0x3c
    80002150:	00fd87b3          	add	a5,s11,a5
    80002154:	0007c503          	lbu	a0,0(a5)
    80002158:	fffd0d1b          	addiw	s10,s10,-1
    8000215c:	004c9c93          	slli	s9,s9,0x4
    80002160:	00000097          	auipc	ra,0x0
    80002164:	974080e7          	jalr	-1676(ra) # 80001ad4 <consputc>
    80002168:	fe0d12e3          	bnez	s10,8000214c <__printf+0x494>
    8000216c:	f8dff06f          	j	800020f8 <__printf+0x440>
    80002170:	f7843783          	ld	a5,-136(s0)
    80002174:	0007bc83          	ld	s9,0(a5)
    80002178:	00878793          	addi	a5,a5,8
    8000217c:	f6f43c23          	sd	a5,-136(s0)
    80002180:	000c9a63          	bnez	s9,80002194 <__printf+0x4dc>
    80002184:	1080006f          	j	8000228c <__printf+0x5d4>
    80002188:	001c8c93          	addi	s9,s9,1
    8000218c:	00000097          	auipc	ra,0x0
    80002190:	948080e7          	jalr	-1720(ra) # 80001ad4 <consputc>
    80002194:	000cc503          	lbu	a0,0(s9)
    80002198:	fe0518e3          	bnez	a0,80002188 <__printf+0x4d0>
    8000219c:	f5dff06f          	j	800020f8 <__printf+0x440>
    800021a0:	02500513          	li	a0,37
    800021a4:	00000097          	auipc	ra,0x0
    800021a8:	930080e7          	jalr	-1744(ra) # 80001ad4 <consputc>
    800021ac:	000c8513          	mv	a0,s9
    800021b0:	00000097          	auipc	ra,0x0
    800021b4:	924080e7          	jalr	-1756(ra) # 80001ad4 <consputc>
    800021b8:	f41ff06f          	j	800020f8 <__printf+0x440>
    800021bc:	02500513          	li	a0,37
    800021c0:	00000097          	auipc	ra,0x0
    800021c4:	914080e7          	jalr	-1772(ra) # 80001ad4 <consputc>
    800021c8:	f31ff06f          	j	800020f8 <__printf+0x440>
    800021cc:	00030513          	mv	a0,t1
    800021d0:	00000097          	auipc	ra,0x0
    800021d4:	7bc080e7          	jalr	1980(ra) # 8000298c <acquire>
    800021d8:	b4dff06f          	j	80001d24 <__printf+0x6c>
    800021dc:	40c0053b          	negw	a0,a2
    800021e0:	00a00713          	li	a4,10
    800021e4:	02e576bb          	remuw	a3,a0,a4
    800021e8:	00002d97          	auipc	s11,0x2
    800021ec:	f70d8d93          	addi	s11,s11,-144 # 80004158 <digits>
    800021f0:	ff700593          	li	a1,-9
    800021f4:	02069693          	slli	a3,a3,0x20
    800021f8:	0206d693          	srli	a3,a3,0x20
    800021fc:	00dd86b3          	add	a3,s11,a3
    80002200:	0006c683          	lbu	a3,0(a3)
    80002204:	02e557bb          	divuw	a5,a0,a4
    80002208:	f8d40023          	sb	a3,-128(s0)
    8000220c:	10b65e63          	bge	a2,a1,80002328 <__printf+0x670>
    80002210:	06300593          	li	a1,99
    80002214:	02e7f6bb          	remuw	a3,a5,a4
    80002218:	02069693          	slli	a3,a3,0x20
    8000221c:	0206d693          	srli	a3,a3,0x20
    80002220:	00dd86b3          	add	a3,s11,a3
    80002224:	0006c683          	lbu	a3,0(a3)
    80002228:	02e7d73b          	divuw	a4,a5,a4
    8000222c:	00200793          	li	a5,2
    80002230:	f8d400a3          	sb	a3,-127(s0)
    80002234:	bca5ece3          	bltu	a1,a0,80001e0c <__printf+0x154>
    80002238:	ce5ff06f          	j	80001f1c <__printf+0x264>
    8000223c:	40e007bb          	negw	a5,a4
    80002240:	00002d97          	auipc	s11,0x2
    80002244:	f18d8d93          	addi	s11,s11,-232 # 80004158 <digits>
    80002248:	00f7f693          	andi	a3,a5,15
    8000224c:	00dd86b3          	add	a3,s11,a3
    80002250:	0006c583          	lbu	a1,0(a3)
    80002254:	ff100613          	li	a2,-15
    80002258:	0047d69b          	srliw	a3,a5,0x4
    8000225c:	f8b40023          	sb	a1,-128(s0)
    80002260:	0047d59b          	srliw	a1,a5,0x4
    80002264:	0ac75e63          	bge	a4,a2,80002320 <__printf+0x668>
    80002268:	00f6f693          	andi	a3,a3,15
    8000226c:	00dd86b3          	add	a3,s11,a3
    80002270:	0006c603          	lbu	a2,0(a3)
    80002274:	00f00693          	li	a3,15
    80002278:	0087d79b          	srliw	a5,a5,0x8
    8000227c:	f8c400a3          	sb	a2,-127(s0)
    80002280:	d8b6e4e3          	bltu	a3,a1,80002008 <__printf+0x350>
    80002284:	00200793          	li	a5,2
    80002288:	e2dff06f          	j	800020b4 <__printf+0x3fc>
    8000228c:	00002c97          	auipc	s9,0x2
    80002290:	eacc8c93          	addi	s9,s9,-340 # 80004138 <__memmove+0x11d4>
    80002294:	02800513          	li	a0,40
    80002298:	ef1ff06f          	j	80002188 <__printf+0x4d0>
    8000229c:	00700793          	li	a5,7
    800022a0:	00600c93          	li	s9,6
    800022a4:	e0dff06f          	j	800020b0 <__printf+0x3f8>
    800022a8:	00700793          	li	a5,7
    800022ac:	00600c93          	li	s9,6
    800022b0:	c69ff06f          	j	80001f18 <__printf+0x260>
    800022b4:	00300793          	li	a5,3
    800022b8:	00200c93          	li	s9,2
    800022bc:	c5dff06f          	j	80001f18 <__printf+0x260>
    800022c0:	00300793          	li	a5,3
    800022c4:	00200c93          	li	s9,2
    800022c8:	de9ff06f          	j	800020b0 <__printf+0x3f8>
    800022cc:	00400793          	li	a5,4
    800022d0:	00300c93          	li	s9,3
    800022d4:	dddff06f          	j	800020b0 <__printf+0x3f8>
    800022d8:	00400793          	li	a5,4
    800022dc:	00300c93          	li	s9,3
    800022e0:	c39ff06f          	j	80001f18 <__printf+0x260>
    800022e4:	00500793          	li	a5,5
    800022e8:	00400c93          	li	s9,4
    800022ec:	c2dff06f          	j	80001f18 <__printf+0x260>
    800022f0:	00500793          	li	a5,5
    800022f4:	00400c93          	li	s9,4
    800022f8:	db9ff06f          	j	800020b0 <__printf+0x3f8>
    800022fc:	00600793          	li	a5,6
    80002300:	00500c93          	li	s9,5
    80002304:	dadff06f          	j	800020b0 <__printf+0x3f8>
    80002308:	00600793          	li	a5,6
    8000230c:	00500c93          	li	s9,5
    80002310:	c09ff06f          	j	80001f18 <__printf+0x260>
    80002314:	00800793          	li	a5,8
    80002318:	00700c93          	li	s9,7
    8000231c:	bfdff06f          	j	80001f18 <__printf+0x260>
    80002320:	00100793          	li	a5,1
    80002324:	d91ff06f          	j	800020b4 <__printf+0x3fc>
    80002328:	00100793          	li	a5,1
    8000232c:	bf1ff06f          	j	80001f1c <__printf+0x264>
    80002330:	00900793          	li	a5,9
    80002334:	00800c93          	li	s9,8
    80002338:	be1ff06f          	j	80001f18 <__printf+0x260>
    8000233c:	00002517          	auipc	a0,0x2
    80002340:	e0450513          	addi	a0,a0,-508 # 80004140 <__memmove+0x11dc>
    80002344:	00000097          	auipc	ra,0x0
    80002348:	918080e7          	jalr	-1768(ra) # 80001c5c <panic>

000000008000234c <printfinit>:
    8000234c:	fe010113          	addi	sp,sp,-32
    80002350:	00813823          	sd	s0,16(sp)
    80002354:	00913423          	sd	s1,8(sp)
    80002358:	00113c23          	sd	ra,24(sp)
    8000235c:	02010413          	addi	s0,sp,32
    80002360:	00003497          	auipc	s1,0x3
    80002364:	0d048493          	addi	s1,s1,208 # 80005430 <pr>
    80002368:	00048513          	mv	a0,s1
    8000236c:	00002597          	auipc	a1,0x2
    80002370:	de458593          	addi	a1,a1,-540 # 80004150 <__memmove+0x11ec>
    80002374:	00000097          	auipc	ra,0x0
    80002378:	5f4080e7          	jalr	1524(ra) # 80002968 <initlock>
    8000237c:	01813083          	ld	ra,24(sp)
    80002380:	01013403          	ld	s0,16(sp)
    80002384:	0004ac23          	sw	zero,24(s1)
    80002388:	00813483          	ld	s1,8(sp)
    8000238c:	02010113          	addi	sp,sp,32
    80002390:	00008067          	ret

0000000080002394 <uartinit>:
    80002394:	ff010113          	addi	sp,sp,-16
    80002398:	00813423          	sd	s0,8(sp)
    8000239c:	01010413          	addi	s0,sp,16
    800023a0:	100007b7          	lui	a5,0x10000
    800023a4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800023a8:	f8000713          	li	a4,-128
    800023ac:	00e781a3          	sb	a4,3(a5)
    800023b0:	00300713          	li	a4,3
    800023b4:	00e78023          	sb	a4,0(a5)
    800023b8:	000780a3          	sb	zero,1(a5)
    800023bc:	00e781a3          	sb	a4,3(a5)
    800023c0:	00700693          	li	a3,7
    800023c4:	00d78123          	sb	a3,2(a5)
    800023c8:	00e780a3          	sb	a4,1(a5)
    800023cc:	00813403          	ld	s0,8(sp)
    800023d0:	01010113          	addi	sp,sp,16
    800023d4:	00008067          	ret

00000000800023d8 <uartputc>:
    800023d8:	00002797          	auipc	a5,0x2
    800023dc:	e207a783          	lw	a5,-480(a5) # 800041f8 <panicked>
    800023e0:	00078463          	beqz	a5,800023e8 <uartputc+0x10>
    800023e4:	0000006f          	j	800023e4 <uartputc+0xc>
    800023e8:	fd010113          	addi	sp,sp,-48
    800023ec:	02813023          	sd	s0,32(sp)
    800023f0:	00913c23          	sd	s1,24(sp)
    800023f4:	01213823          	sd	s2,16(sp)
    800023f8:	01313423          	sd	s3,8(sp)
    800023fc:	02113423          	sd	ra,40(sp)
    80002400:	03010413          	addi	s0,sp,48
    80002404:	00002917          	auipc	s2,0x2
    80002408:	dfc90913          	addi	s2,s2,-516 # 80004200 <uart_tx_r>
    8000240c:	00093783          	ld	a5,0(s2)
    80002410:	00002497          	auipc	s1,0x2
    80002414:	df848493          	addi	s1,s1,-520 # 80004208 <uart_tx_w>
    80002418:	0004b703          	ld	a4,0(s1)
    8000241c:	02078693          	addi	a3,a5,32
    80002420:	00050993          	mv	s3,a0
    80002424:	02e69c63          	bne	a3,a4,8000245c <uartputc+0x84>
    80002428:	00001097          	auipc	ra,0x1
    8000242c:	834080e7          	jalr	-1996(ra) # 80002c5c <push_on>
    80002430:	00093783          	ld	a5,0(s2)
    80002434:	0004b703          	ld	a4,0(s1)
    80002438:	02078793          	addi	a5,a5,32
    8000243c:	00e79463          	bne	a5,a4,80002444 <uartputc+0x6c>
    80002440:	0000006f          	j	80002440 <uartputc+0x68>
    80002444:	00001097          	auipc	ra,0x1
    80002448:	88c080e7          	jalr	-1908(ra) # 80002cd0 <pop_on>
    8000244c:	00093783          	ld	a5,0(s2)
    80002450:	0004b703          	ld	a4,0(s1)
    80002454:	02078693          	addi	a3,a5,32
    80002458:	fce688e3          	beq	a3,a4,80002428 <uartputc+0x50>
    8000245c:	01f77693          	andi	a3,a4,31
    80002460:	00003597          	auipc	a1,0x3
    80002464:	ff058593          	addi	a1,a1,-16 # 80005450 <uart_tx_buf>
    80002468:	00d586b3          	add	a3,a1,a3
    8000246c:	00170713          	addi	a4,a4,1
    80002470:	01368023          	sb	s3,0(a3)
    80002474:	00e4b023          	sd	a4,0(s1)
    80002478:	10000637          	lui	a2,0x10000
    8000247c:	02f71063          	bne	a4,a5,8000249c <uartputc+0xc4>
    80002480:	0340006f          	j	800024b4 <uartputc+0xdc>
    80002484:	00074703          	lbu	a4,0(a4)
    80002488:	00f93023          	sd	a5,0(s2)
    8000248c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80002490:	00093783          	ld	a5,0(s2)
    80002494:	0004b703          	ld	a4,0(s1)
    80002498:	00f70e63          	beq	a4,a5,800024b4 <uartputc+0xdc>
    8000249c:	00564683          	lbu	a3,5(a2)
    800024a0:	01f7f713          	andi	a4,a5,31
    800024a4:	00e58733          	add	a4,a1,a4
    800024a8:	0206f693          	andi	a3,a3,32
    800024ac:	00178793          	addi	a5,a5,1
    800024b0:	fc069ae3          	bnez	a3,80002484 <uartputc+0xac>
    800024b4:	02813083          	ld	ra,40(sp)
    800024b8:	02013403          	ld	s0,32(sp)
    800024bc:	01813483          	ld	s1,24(sp)
    800024c0:	01013903          	ld	s2,16(sp)
    800024c4:	00813983          	ld	s3,8(sp)
    800024c8:	03010113          	addi	sp,sp,48
    800024cc:	00008067          	ret

00000000800024d0 <uartputc_sync>:
    800024d0:	ff010113          	addi	sp,sp,-16
    800024d4:	00813423          	sd	s0,8(sp)
    800024d8:	01010413          	addi	s0,sp,16
    800024dc:	00002717          	auipc	a4,0x2
    800024e0:	d1c72703          	lw	a4,-740(a4) # 800041f8 <panicked>
    800024e4:	02071663          	bnez	a4,80002510 <uartputc_sync+0x40>
    800024e8:	00050793          	mv	a5,a0
    800024ec:	100006b7          	lui	a3,0x10000
    800024f0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800024f4:	02077713          	andi	a4,a4,32
    800024f8:	fe070ce3          	beqz	a4,800024f0 <uartputc_sync+0x20>
    800024fc:	0ff7f793          	andi	a5,a5,255
    80002500:	00f68023          	sb	a5,0(a3)
    80002504:	00813403          	ld	s0,8(sp)
    80002508:	01010113          	addi	sp,sp,16
    8000250c:	00008067          	ret
    80002510:	0000006f          	j	80002510 <uartputc_sync+0x40>

0000000080002514 <uartstart>:
    80002514:	ff010113          	addi	sp,sp,-16
    80002518:	00813423          	sd	s0,8(sp)
    8000251c:	01010413          	addi	s0,sp,16
    80002520:	00002617          	auipc	a2,0x2
    80002524:	ce060613          	addi	a2,a2,-800 # 80004200 <uart_tx_r>
    80002528:	00002517          	auipc	a0,0x2
    8000252c:	ce050513          	addi	a0,a0,-800 # 80004208 <uart_tx_w>
    80002530:	00063783          	ld	a5,0(a2)
    80002534:	00053703          	ld	a4,0(a0)
    80002538:	04f70263          	beq	a4,a5,8000257c <uartstart+0x68>
    8000253c:	100005b7          	lui	a1,0x10000
    80002540:	00003817          	auipc	a6,0x3
    80002544:	f1080813          	addi	a6,a6,-240 # 80005450 <uart_tx_buf>
    80002548:	01c0006f          	j	80002564 <uartstart+0x50>
    8000254c:	0006c703          	lbu	a4,0(a3)
    80002550:	00f63023          	sd	a5,0(a2)
    80002554:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002558:	00063783          	ld	a5,0(a2)
    8000255c:	00053703          	ld	a4,0(a0)
    80002560:	00f70e63          	beq	a4,a5,8000257c <uartstart+0x68>
    80002564:	01f7f713          	andi	a4,a5,31
    80002568:	00e806b3          	add	a3,a6,a4
    8000256c:	0055c703          	lbu	a4,5(a1)
    80002570:	00178793          	addi	a5,a5,1
    80002574:	02077713          	andi	a4,a4,32
    80002578:	fc071ae3          	bnez	a4,8000254c <uartstart+0x38>
    8000257c:	00813403          	ld	s0,8(sp)
    80002580:	01010113          	addi	sp,sp,16
    80002584:	00008067          	ret

0000000080002588 <uartgetc>:
    80002588:	ff010113          	addi	sp,sp,-16
    8000258c:	00813423          	sd	s0,8(sp)
    80002590:	01010413          	addi	s0,sp,16
    80002594:	10000737          	lui	a4,0x10000
    80002598:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000259c:	0017f793          	andi	a5,a5,1
    800025a0:	00078c63          	beqz	a5,800025b8 <uartgetc+0x30>
    800025a4:	00074503          	lbu	a0,0(a4)
    800025a8:	0ff57513          	andi	a0,a0,255
    800025ac:	00813403          	ld	s0,8(sp)
    800025b0:	01010113          	addi	sp,sp,16
    800025b4:	00008067          	ret
    800025b8:	fff00513          	li	a0,-1
    800025bc:	ff1ff06f          	j	800025ac <uartgetc+0x24>

00000000800025c0 <uartintr>:
    800025c0:	100007b7          	lui	a5,0x10000
    800025c4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800025c8:	0017f793          	andi	a5,a5,1
    800025cc:	0a078463          	beqz	a5,80002674 <uartintr+0xb4>
    800025d0:	fe010113          	addi	sp,sp,-32
    800025d4:	00813823          	sd	s0,16(sp)
    800025d8:	00913423          	sd	s1,8(sp)
    800025dc:	00113c23          	sd	ra,24(sp)
    800025e0:	02010413          	addi	s0,sp,32
    800025e4:	100004b7          	lui	s1,0x10000
    800025e8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800025ec:	0ff57513          	andi	a0,a0,255
    800025f0:	fffff097          	auipc	ra,0xfffff
    800025f4:	534080e7          	jalr	1332(ra) # 80001b24 <consoleintr>
    800025f8:	0054c783          	lbu	a5,5(s1)
    800025fc:	0017f793          	andi	a5,a5,1
    80002600:	fe0794e3          	bnez	a5,800025e8 <uartintr+0x28>
    80002604:	00002617          	auipc	a2,0x2
    80002608:	bfc60613          	addi	a2,a2,-1028 # 80004200 <uart_tx_r>
    8000260c:	00002517          	auipc	a0,0x2
    80002610:	bfc50513          	addi	a0,a0,-1028 # 80004208 <uart_tx_w>
    80002614:	00063783          	ld	a5,0(a2)
    80002618:	00053703          	ld	a4,0(a0)
    8000261c:	04f70263          	beq	a4,a5,80002660 <uartintr+0xa0>
    80002620:	100005b7          	lui	a1,0x10000
    80002624:	00003817          	auipc	a6,0x3
    80002628:	e2c80813          	addi	a6,a6,-468 # 80005450 <uart_tx_buf>
    8000262c:	01c0006f          	j	80002648 <uartintr+0x88>
    80002630:	0006c703          	lbu	a4,0(a3)
    80002634:	00f63023          	sd	a5,0(a2)
    80002638:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000263c:	00063783          	ld	a5,0(a2)
    80002640:	00053703          	ld	a4,0(a0)
    80002644:	00f70e63          	beq	a4,a5,80002660 <uartintr+0xa0>
    80002648:	01f7f713          	andi	a4,a5,31
    8000264c:	00e806b3          	add	a3,a6,a4
    80002650:	0055c703          	lbu	a4,5(a1)
    80002654:	00178793          	addi	a5,a5,1
    80002658:	02077713          	andi	a4,a4,32
    8000265c:	fc071ae3          	bnez	a4,80002630 <uartintr+0x70>
    80002660:	01813083          	ld	ra,24(sp)
    80002664:	01013403          	ld	s0,16(sp)
    80002668:	00813483          	ld	s1,8(sp)
    8000266c:	02010113          	addi	sp,sp,32
    80002670:	00008067          	ret
    80002674:	00002617          	auipc	a2,0x2
    80002678:	b8c60613          	addi	a2,a2,-1140 # 80004200 <uart_tx_r>
    8000267c:	00002517          	auipc	a0,0x2
    80002680:	b8c50513          	addi	a0,a0,-1140 # 80004208 <uart_tx_w>
    80002684:	00063783          	ld	a5,0(a2)
    80002688:	00053703          	ld	a4,0(a0)
    8000268c:	04f70263          	beq	a4,a5,800026d0 <uartintr+0x110>
    80002690:	100005b7          	lui	a1,0x10000
    80002694:	00003817          	auipc	a6,0x3
    80002698:	dbc80813          	addi	a6,a6,-580 # 80005450 <uart_tx_buf>
    8000269c:	01c0006f          	j	800026b8 <uartintr+0xf8>
    800026a0:	0006c703          	lbu	a4,0(a3)
    800026a4:	00f63023          	sd	a5,0(a2)
    800026a8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800026ac:	00063783          	ld	a5,0(a2)
    800026b0:	00053703          	ld	a4,0(a0)
    800026b4:	02f70063          	beq	a4,a5,800026d4 <uartintr+0x114>
    800026b8:	01f7f713          	andi	a4,a5,31
    800026bc:	00e806b3          	add	a3,a6,a4
    800026c0:	0055c703          	lbu	a4,5(a1)
    800026c4:	00178793          	addi	a5,a5,1
    800026c8:	02077713          	andi	a4,a4,32
    800026cc:	fc071ae3          	bnez	a4,800026a0 <uartintr+0xe0>
    800026d0:	00008067          	ret
    800026d4:	00008067          	ret

00000000800026d8 <kinit>:
    800026d8:	fc010113          	addi	sp,sp,-64
    800026dc:	02913423          	sd	s1,40(sp)
    800026e0:	fffff7b7          	lui	a5,0xfffff
    800026e4:	00004497          	auipc	s1,0x4
    800026e8:	d8b48493          	addi	s1,s1,-629 # 8000646f <end+0xfff>
    800026ec:	02813823          	sd	s0,48(sp)
    800026f0:	01313c23          	sd	s3,24(sp)
    800026f4:	00f4f4b3          	and	s1,s1,a5
    800026f8:	02113c23          	sd	ra,56(sp)
    800026fc:	03213023          	sd	s2,32(sp)
    80002700:	01413823          	sd	s4,16(sp)
    80002704:	01513423          	sd	s5,8(sp)
    80002708:	04010413          	addi	s0,sp,64
    8000270c:	000017b7          	lui	a5,0x1
    80002710:	01100993          	li	s3,17
    80002714:	00f487b3          	add	a5,s1,a5
    80002718:	01b99993          	slli	s3,s3,0x1b
    8000271c:	06f9e063          	bltu	s3,a5,8000277c <kinit+0xa4>
    80002720:	00003a97          	auipc	s5,0x3
    80002724:	d50a8a93          	addi	s5,s5,-688 # 80005470 <end>
    80002728:	0754ec63          	bltu	s1,s5,800027a0 <kinit+0xc8>
    8000272c:	0734fa63          	bgeu	s1,s3,800027a0 <kinit+0xc8>
    80002730:	00088a37          	lui	s4,0x88
    80002734:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80002738:	00002917          	auipc	s2,0x2
    8000273c:	ad890913          	addi	s2,s2,-1320 # 80004210 <kmem>
    80002740:	00ca1a13          	slli	s4,s4,0xc
    80002744:	0140006f          	j	80002758 <kinit+0x80>
    80002748:	000017b7          	lui	a5,0x1
    8000274c:	00f484b3          	add	s1,s1,a5
    80002750:	0554e863          	bltu	s1,s5,800027a0 <kinit+0xc8>
    80002754:	0534f663          	bgeu	s1,s3,800027a0 <kinit+0xc8>
    80002758:	00001637          	lui	a2,0x1
    8000275c:	00100593          	li	a1,1
    80002760:	00048513          	mv	a0,s1
    80002764:	00000097          	auipc	ra,0x0
    80002768:	5e4080e7          	jalr	1508(ra) # 80002d48 <__memset>
    8000276c:	00093783          	ld	a5,0(s2)
    80002770:	00f4b023          	sd	a5,0(s1)
    80002774:	00993023          	sd	s1,0(s2)
    80002778:	fd4498e3          	bne	s1,s4,80002748 <kinit+0x70>
    8000277c:	03813083          	ld	ra,56(sp)
    80002780:	03013403          	ld	s0,48(sp)
    80002784:	02813483          	ld	s1,40(sp)
    80002788:	02013903          	ld	s2,32(sp)
    8000278c:	01813983          	ld	s3,24(sp)
    80002790:	01013a03          	ld	s4,16(sp)
    80002794:	00813a83          	ld	s5,8(sp)
    80002798:	04010113          	addi	sp,sp,64
    8000279c:	00008067          	ret
    800027a0:	00002517          	auipc	a0,0x2
    800027a4:	9d050513          	addi	a0,a0,-1584 # 80004170 <digits+0x18>
    800027a8:	fffff097          	auipc	ra,0xfffff
    800027ac:	4b4080e7          	jalr	1204(ra) # 80001c5c <panic>

00000000800027b0 <freerange>:
    800027b0:	fc010113          	addi	sp,sp,-64
    800027b4:	000017b7          	lui	a5,0x1
    800027b8:	02913423          	sd	s1,40(sp)
    800027bc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800027c0:	009504b3          	add	s1,a0,s1
    800027c4:	fffff537          	lui	a0,0xfffff
    800027c8:	02813823          	sd	s0,48(sp)
    800027cc:	02113c23          	sd	ra,56(sp)
    800027d0:	03213023          	sd	s2,32(sp)
    800027d4:	01313c23          	sd	s3,24(sp)
    800027d8:	01413823          	sd	s4,16(sp)
    800027dc:	01513423          	sd	s5,8(sp)
    800027e0:	01613023          	sd	s6,0(sp)
    800027e4:	04010413          	addi	s0,sp,64
    800027e8:	00a4f4b3          	and	s1,s1,a0
    800027ec:	00f487b3          	add	a5,s1,a5
    800027f0:	06f5e463          	bltu	a1,a5,80002858 <freerange+0xa8>
    800027f4:	00003a97          	auipc	s5,0x3
    800027f8:	c7ca8a93          	addi	s5,s5,-900 # 80005470 <end>
    800027fc:	0954e263          	bltu	s1,s5,80002880 <freerange+0xd0>
    80002800:	01100993          	li	s3,17
    80002804:	01b99993          	slli	s3,s3,0x1b
    80002808:	0734fc63          	bgeu	s1,s3,80002880 <freerange+0xd0>
    8000280c:	00058a13          	mv	s4,a1
    80002810:	00002917          	auipc	s2,0x2
    80002814:	a0090913          	addi	s2,s2,-1536 # 80004210 <kmem>
    80002818:	00002b37          	lui	s6,0x2
    8000281c:	0140006f          	j	80002830 <freerange+0x80>
    80002820:	000017b7          	lui	a5,0x1
    80002824:	00f484b3          	add	s1,s1,a5
    80002828:	0554ec63          	bltu	s1,s5,80002880 <freerange+0xd0>
    8000282c:	0534fa63          	bgeu	s1,s3,80002880 <freerange+0xd0>
    80002830:	00001637          	lui	a2,0x1
    80002834:	00100593          	li	a1,1
    80002838:	00048513          	mv	a0,s1
    8000283c:	00000097          	auipc	ra,0x0
    80002840:	50c080e7          	jalr	1292(ra) # 80002d48 <__memset>
    80002844:	00093703          	ld	a4,0(s2)
    80002848:	016487b3          	add	a5,s1,s6
    8000284c:	00e4b023          	sd	a4,0(s1)
    80002850:	00993023          	sd	s1,0(s2)
    80002854:	fcfa76e3          	bgeu	s4,a5,80002820 <freerange+0x70>
    80002858:	03813083          	ld	ra,56(sp)
    8000285c:	03013403          	ld	s0,48(sp)
    80002860:	02813483          	ld	s1,40(sp)
    80002864:	02013903          	ld	s2,32(sp)
    80002868:	01813983          	ld	s3,24(sp)
    8000286c:	01013a03          	ld	s4,16(sp)
    80002870:	00813a83          	ld	s5,8(sp)
    80002874:	00013b03          	ld	s6,0(sp)
    80002878:	04010113          	addi	sp,sp,64
    8000287c:	00008067          	ret
    80002880:	00002517          	auipc	a0,0x2
    80002884:	8f050513          	addi	a0,a0,-1808 # 80004170 <digits+0x18>
    80002888:	fffff097          	auipc	ra,0xfffff
    8000288c:	3d4080e7          	jalr	980(ra) # 80001c5c <panic>

0000000080002890 <kfree>:
    80002890:	fe010113          	addi	sp,sp,-32
    80002894:	00813823          	sd	s0,16(sp)
    80002898:	00113c23          	sd	ra,24(sp)
    8000289c:	00913423          	sd	s1,8(sp)
    800028a0:	02010413          	addi	s0,sp,32
    800028a4:	03451793          	slli	a5,a0,0x34
    800028a8:	04079c63          	bnez	a5,80002900 <kfree+0x70>
    800028ac:	00003797          	auipc	a5,0x3
    800028b0:	bc478793          	addi	a5,a5,-1084 # 80005470 <end>
    800028b4:	00050493          	mv	s1,a0
    800028b8:	04f56463          	bltu	a0,a5,80002900 <kfree+0x70>
    800028bc:	01100793          	li	a5,17
    800028c0:	01b79793          	slli	a5,a5,0x1b
    800028c4:	02f57e63          	bgeu	a0,a5,80002900 <kfree+0x70>
    800028c8:	00001637          	lui	a2,0x1
    800028cc:	00100593          	li	a1,1
    800028d0:	00000097          	auipc	ra,0x0
    800028d4:	478080e7          	jalr	1144(ra) # 80002d48 <__memset>
    800028d8:	00002797          	auipc	a5,0x2
    800028dc:	93878793          	addi	a5,a5,-1736 # 80004210 <kmem>
    800028e0:	0007b703          	ld	a4,0(a5)
    800028e4:	01813083          	ld	ra,24(sp)
    800028e8:	01013403          	ld	s0,16(sp)
    800028ec:	00e4b023          	sd	a4,0(s1)
    800028f0:	0097b023          	sd	s1,0(a5)
    800028f4:	00813483          	ld	s1,8(sp)
    800028f8:	02010113          	addi	sp,sp,32
    800028fc:	00008067          	ret
    80002900:	00002517          	auipc	a0,0x2
    80002904:	87050513          	addi	a0,a0,-1936 # 80004170 <digits+0x18>
    80002908:	fffff097          	auipc	ra,0xfffff
    8000290c:	354080e7          	jalr	852(ra) # 80001c5c <panic>

0000000080002910 <kalloc>:
    80002910:	fe010113          	addi	sp,sp,-32
    80002914:	00813823          	sd	s0,16(sp)
    80002918:	00913423          	sd	s1,8(sp)
    8000291c:	00113c23          	sd	ra,24(sp)
    80002920:	02010413          	addi	s0,sp,32
    80002924:	00002797          	auipc	a5,0x2
    80002928:	8ec78793          	addi	a5,a5,-1812 # 80004210 <kmem>
    8000292c:	0007b483          	ld	s1,0(a5)
    80002930:	02048063          	beqz	s1,80002950 <kalloc+0x40>
    80002934:	0004b703          	ld	a4,0(s1)
    80002938:	00001637          	lui	a2,0x1
    8000293c:	00500593          	li	a1,5
    80002940:	00048513          	mv	a0,s1
    80002944:	00e7b023          	sd	a4,0(a5)
    80002948:	00000097          	auipc	ra,0x0
    8000294c:	400080e7          	jalr	1024(ra) # 80002d48 <__memset>
    80002950:	01813083          	ld	ra,24(sp)
    80002954:	01013403          	ld	s0,16(sp)
    80002958:	00048513          	mv	a0,s1
    8000295c:	00813483          	ld	s1,8(sp)
    80002960:	02010113          	addi	sp,sp,32
    80002964:	00008067          	ret

0000000080002968 <initlock>:
    80002968:	ff010113          	addi	sp,sp,-16
    8000296c:	00813423          	sd	s0,8(sp)
    80002970:	01010413          	addi	s0,sp,16
    80002974:	00813403          	ld	s0,8(sp)
    80002978:	00b53423          	sd	a1,8(a0)
    8000297c:	00052023          	sw	zero,0(a0)
    80002980:	00053823          	sd	zero,16(a0)
    80002984:	01010113          	addi	sp,sp,16
    80002988:	00008067          	ret

000000008000298c <acquire>:
    8000298c:	fe010113          	addi	sp,sp,-32
    80002990:	00813823          	sd	s0,16(sp)
    80002994:	00913423          	sd	s1,8(sp)
    80002998:	00113c23          	sd	ra,24(sp)
    8000299c:	01213023          	sd	s2,0(sp)
    800029a0:	02010413          	addi	s0,sp,32
    800029a4:	00050493          	mv	s1,a0
    800029a8:	10002973          	csrr	s2,sstatus
    800029ac:	100027f3          	csrr	a5,sstatus
    800029b0:	ffd7f793          	andi	a5,a5,-3
    800029b4:	10079073          	csrw	sstatus,a5
    800029b8:	fffff097          	auipc	ra,0xfffff
    800029bc:	8e4080e7          	jalr	-1820(ra) # 8000129c <mycpu>
    800029c0:	07852783          	lw	a5,120(a0)
    800029c4:	06078e63          	beqz	a5,80002a40 <acquire+0xb4>
    800029c8:	fffff097          	auipc	ra,0xfffff
    800029cc:	8d4080e7          	jalr	-1836(ra) # 8000129c <mycpu>
    800029d0:	07852783          	lw	a5,120(a0)
    800029d4:	0004a703          	lw	a4,0(s1)
    800029d8:	0017879b          	addiw	a5,a5,1
    800029dc:	06f52c23          	sw	a5,120(a0)
    800029e0:	04071063          	bnez	a4,80002a20 <acquire+0x94>
    800029e4:	00100713          	li	a4,1
    800029e8:	00070793          	mv	a5,a4
    800029ec:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800029f0:	0007879b          	sext.w	a5,a5
    800029f4:	fe079ae3          	bnez	a5,800029e8 <acquire+0x5c>
    800029f8:	0ff0000f          	fence
    800029fc:	fffff097          	auipc	ra,0xfffff
    80002a00:	8a0080e7          	jalr	-1888(ra) # 8000129c <mycpu>
    80002a04:	01813083          	ld	ra,24(sp)
    80002a08:	01013403          	ld	s0,16(sp)
    80002a0c:	00a4b823          	sd	a0,16(s1)
    80002a10:	00013903          	ld	s2,0(sp)
    80002a14:	00813483          	ld	s1,8(sp)
    80002a18:	02010113          	addi	sp,sp,32
    80002a1c:	00008067          	ret
    80002a20:	0104b903          	ld	s2,16(s1)
    80002a24:	fffff097          	auipc	ra,0xfffff
    80002a28:	878080e7          	jalr	-1928(ra) # 8000129c <mycpu>
    80002a2c:	faa91ce3          	bne	s2,a0,800029e4 <acquire+0x58>
    80002a30:	00001517          	auipc	a0,0x1
    80002a34:	74850513          	addi	a0,a0,1864 # 80004178 <digits+0x20>
    80002a38:	fffff097          	auipc	ra,0xfffff
    80002a3c:	224080e7          	jalr	548(ra) # 80001c5c <panic>
    80002a40:	00195913          	srli	s2,s2,0x1
    80002a44:	fffff097          	auipc	ra,0xfffff
    80002a48:	858080e7          	jalr	-1960(ra) # 8000129c <mycpu>
    80002a4c:	00197913          	andi	s2,s2,1
    80002a50:	07252e23          	sw	s2,124(a0)
    80002a54:	f75ff06f          	j	800029c8 <acquire+0x3c>

0000000080002a58 <release>:
    80002a58:	fe010113          	addi	sp,sp,-32
    80002a5c:	00813823          	sd	s0,16(sp)
    80002a60:	00113c23          	sd	ra,24(sp)
    80002a64:	00913423          	sd	s1,8(sp)
    80002a68:	01213023          	sd	s2,0(sp)
    80002a6c:	02010413          	addi	s0,sp,32
    80002a70:	00052783          	lw	a5,0(a0)
    80002a74:	00079a63          	bnez	a5,80002a88 <release+0x30>
    80002a78:	00001517          	auipc	a0,0x1
    80002a7c:	70850513          	addi	a0,a0,1800 # 80004180 <digits+0x28>
    80002a80:	fffff097          	auipc	ra,0xfffff
    80002a84:	1dc080e7          	jalr	476(ra) # 80001c5c <panic>
    80002a88:	01053903          	ld	s2,16(a0)
    80002a8c:	00050493          	mv	s1,a0
    80002a90:	fffff097          	auipc	ra,0xfffff
    80002a94:	80c080e7          	jalr	-2036(ra) # 8000129c <mycpu>
    80002a98:	fea910e3          	bne	s2,a0,80002a78 <release+0x20>
    80002a9c:	0004b823          	sd	zero,16(s1)
    80002aa0:	0ff0000f          	fence
    80002aa4:	0f50000f          	fence	iorw,ow
    80002aa8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80002aac:	ffffe097          	auipc	ra,0xffffe
    80002ab0:	7f0080e7          	jalr	2032(ra) # 8000129c <mycpu>
    80002ab4:	100027f3          	csrr	a5,sstatus
    80002ab8:	0027f793          	andi	a5,a5,2
    80002abc:	04079a63          	bnez	a5,80002b10 <release+0xb8>
    80002ac0:	07852783          	lw	a5,120(a0)
    80002ac4:	02f05e63          	blez	a5,80002b00 <release+0xa8>
    80002ac8:	fff7871b          	addiw	a4,a5,-1
    80002acc:	06e52c23          	sw	a4,120(a0)
    80002ad0:	00071c63          	bnez	a4,80002ae8 <release+0x90>
    80002ad4:	07c52783          	lw	a5,124(a0)
    80002ad8:	00078863          	beqz	a5,80002ae8 <release+0x90>
    80002adc:	100027f3          	csrr	a5,sstatus
    80002ae0:	0027e793          	ori	a5,a5,2
    80002ae4:	10079073          	csrw	sstatus,a5
    80002ae8:	01813083          	ld	ra,24(sp)
    80002aec:	01013403          	ld	s0,16(sp)
    80002af0:	00813483          	ld	s1,8(sp)
    80002af4:	00013903          	ld	s2,0(sp)
    80002af8:	02010113          	addi	sp,sp,32
    80002afc:	00008067          	ret
    80002b00:	00001517          	auipc	a0,0x1
    80002b04:	6a050513          	addi	a0,a0,1696 # 800041a0 <digits+0x48>
    80002b08:	fffff097          	auipc	ra,0xfffff
    80002b0c:	154080e7          	jalr	340(ra) # 80001c5c <panic>
    80002b10:	00001517          	auipc	a0,0x1
    80002b14:	67850513          	addi	a0,a0,1656 # 80004188 <digits+0x30>
    80002b18:	fffff097          	auipc	ra,0xfffff
    80002b1c:	144080e7          	jalr	324(ra) # 80001c5c <panic>

0000000080002b20 <holding>:
    80002b20:	00052783          	lw	a5,0(a0)
    80002b24:	00079663          	bnez	a5,80002b30 <holding+0x10>
    80002b28:	00000513          	li	a0,0
    80002b2c:	00008067          	ret
    80002b30:	fe010113          	addi	sp,sp,-32
    80002b34:	00813823          	sd	s0,16(sp)
    80002b38:	00913423          	sd	s1,8(sp)
    80002b3c:	00113c23          	sd	ra,24(sp)
    80002b40:	02010413          	addi	s0,sp,32
    80002b44:	01053483          	ld	s1,16(a0)
    80002b48:	ffffe097          	auipc	ra,0xffffe
    80002b4c:	754080e7          	jalr	1876(ra) # 8000129c <mycpu>
    80002b50:	01813083          	ld	ra,24(sp)
    80002b54:	01013403          	ld	s0,16(sp)
    80002b58:	40a48533          	sub	a0,s1,a0
    80002b5c:	00153513          	seqz	a0,a0
    80002b60:	00813483          	ld	s1,8(sp)
    80002b64:	02010113          	addi	sp,sp,32
    80002b68:	00008067          	ret

0000000080002b6c <push_off>:
    80002b6c:	fe010113          	addi	sp,sp,-32
    80002b70:	00813823          	sd	s0,16(sp)
    80002b74:	00113c23          	sd	ra,24(sp)
    80002b78:	00913423          	sd	s1,8(sp)
    80002b7c:	02010413          	addi	s0,sp,32
    80002b80:	100024f3          	csrr	s1,sstatus
    80002b84:	100027f3          	csrr	a5,sstatus
    80002b88:	ffd7f793          	andi	a5,a5,-3
    80002b8c:	10079073          	csrw	sstatus,a5
    80002b90:	ffffe097          	auipc	ra,0xffffe
    80002b94:	70c080e7          	jalr	1804(ra) # 8000129c <mycpu>
    80002b98:	07852783          	lw	a5,120(a0)
    80002b9c:	02078663          	beqz	a5,80002bc8 <push_off+0x5c>
    80002ba0:	ffffe097          	auipc	ra,0xffffe
    80002ba4:	6fc080e7          	jalr	1788(ra) # 8000129c <mycpu>
    80002ba8:	07852783          	lw	a5,120(a0)
    80002bac:	01813083          	ld	ra,24(sp)
    80002bb0:	01013403          	ld	s0,16(sp)
    80002bb4:	0017879b          	addiw	a5,a5,1
    80002bb8:	06f52c23          	sw	a5,120(a0)
    80002bbc:	00813483          	ld	s1,8(sp)
    80002bc0:	02010113          	addi	sp,sp,32
    80002bc4:	00008067          	ret
    80002bc8:	0014d493          	srli	s1,s1,0x1
    80002bcc:	ffffe097          	auipc	ra,0xffffe
    80002bd0:	6d0080e7          	jalr	1744(ra) # 8000129c <mycpu>
    80002bd4:	0014f493          	andi	s1,s1,1
    80002bd8:	06952e23          	sw	s1,124(a0)
    80002bdc:	fc5ff06f          	j	80002ba0 <push_off+0x34>

0000000080002be0 <pop_off>:
    80002be0:	ff010113          	addi	sp,sp,-16
    80002be4:	00813023          	sd	s0,0(sp)
    80002be8:	00113423          	sd	ra,8(sp)
    80002bec:	01010413          	addi	s0,sp,16
    80002bf0:	ffffe097          	auipc	ra,0xffffe
    80002bf4:	6ac080e7          	jalr	1708(ra) # 8000129c <mycpu>
    80002bf8:	100027f3          	csrr	a5,sstatus
    80002bfc:	0027f793          	andi	a5,a5,2
    80002c00:	04079663          	bnez	a5,80002c4c <pop_off+0x6c>
    80002c04:	07852783          	lw	a5,120(a0)
    80002c08:	02f05a63          	blez	a5,80002c3c <pop_off+0x5c>
    80002c0c:	fff7871b          	addiw	a4,a5,-1
    80002c10:	06e52c23          	sw	a4,120(a0)
    80002c14:	00071c63          	bnez	a4,80002c2c <pop_off+0x4c>
    80002c18:	07c52783          	lw	a5,124(a0)
    80002c1c:	00078863          	beqz	a5,80002c2c <pop_off+0x4c>
    80002c20:	100027f3          	csrr	a5,sstatus
    80002c24:	0027e793          	ori	a5,a5,2
    80002c28:	10079073          	csrw	sstatus,a5
    80002c2c:	00813083          	ld	ra,8(sp)
    80002c30:	00013403          	ld	s0,0(sp)
    80002c34:	01010113          	addi	sp,sp,16
    80002c38:	00008067          	ret
    80002c3c:	00001517          	auipc	a0,0x1
    80002c40:	56450513          	addi	a0,a0,1380 # 800041a0 <digits+0x48>
    80002c44:	fffff097          	auipc	ra,0xfffff
    80002c48:	018080e7          	jalr	24(ra) # 80001c5c <panic>
    80002c4c:	00001517          	auipc	a0,0x1
    80002c50:	53c50513          	addi	a0,a0,1340 # 80004188 <digits+0x30>
    80002c54:	fffff097          	auipc	ra,0xfffff
    80002c58:	008080e7          	jalr	8(ra) # 80001c5c <panic>

0000000080002c5c <push_on>:
    80002c5c:	fe010113          	addi	sp,sp,-32
    80002c60:	00813823          	sd	s0,16(sp)
    80002c64:	00113c23          	sd	ra,24(sp)
    80002c68:	00913423          	sd	s1,8(sp)
    80002c6c:	02010413          	addi	s0,sp,32
    80002c70:	100024f3          	csrr	s1,sstatus
    80002c74:	100027f3          	csrr	a5,sstatus
    80002c78:	0027e793          	ori	a5,a5,2
    80002c7c:	10079073          	csrw	sstatus,a5
    80002c80:	ffffe097          	auipc	ra,0xffffe
    80002c84:	61c080e7          	jalr	1564(ra) # 8000129c <mycpu>
    80002c88:	07852783          	lw	a5,120(a0)
    80002c8c:	02078663          	beqz	a5,80002cb8 <push_on+0x5c>
    80002c90:	ffffe097          	auipc	ra,0xffffe
    80002c94:	60c080e7          	jalr	1548(ra) # 8000129c <mycpu>
    80002c98:	07852783          	lw	a5,120(a0)
    80002c9c:	01813083          	ld	ra,24(sp)
    80002ca0:	01013403          	ld	s0,16(sp)
    80002ca4:	0017879b          	addiw	a5,a5,1
    80002ca8:	06f52c23          	sw	a5,120(a0)
    80002cac:	00813483          	ld	s1,8(sp)
    80002cb0:	02010113          	addi	sp,sp,32
    80002cb4:	00008067          	ret
    80002cb8:	0014d493          	srli	s1,s1,0x1
    80002cbc:	ffffe097          	auipc	ra,0xffffe
    80002cc0:	5e0080e7          	jalr	1504(ra) # 8000129c <mycpu>
    80002cc4:	0014f493          	andi	s1,s1,1
    80002cc8:	06952e23          	sw	s1,124(a0)
    80002ccc:	fc5ff06f          	j	80002c90 <push_on+0x34>

0000000080002cd0 <pop_on>:
    80002cd0:	ff010113          	addi	sp,sp,-16
    80002cd4:	00813023          	sd	s0,0(sp)
    80002cd8:	00113423          	sd	ra,8(sp)
    80002cdc:	01010413          	addi	s0,sp,16
    80002ce0:	ffffe097          	auipc	ra,0xffffe
    80002ce4:	5bc080e7          	jalr	1468(ra) # 8000129c <mycpu>
    80002ce8:	100027f3          	csrr	a5,sstatus
    80002cec:	0027f793          	andi	a5,a5,2
    80002cf0:	04078463          	beqz	a5,80002d38 <pop_on+0x68>
    80002cf4:	07852783          	lw	a5,120(a0)
    80002cf8:	02f05863          	blez	a5,80002d28 <pop_on+0x58>
    80002cfc:	fff7879b          	addiw	a5,a5,-1
    80002d00:	06f52c23          	sw	a5,120(a0)
    80002d04:	07853783          	ld	a5,120(a0)
    80002d08:	00079863          	bnez	a5,80002d18 <pop_on+0x48>
    80002d0c:	100027f3          	csrr	a5,sstatus
    80002d10:	ffd7f793          	andi	a5,a5,-3
    80002d14:	10079073          	csrw	sstatus,a5
    80002d18:	00813083          	ld	ra,8(sp)
    80002d1c:	00013403          	ld	s0,0(sp)
    80002d20:	01010113          	addi	sp,sp,16
    80002d24:	00008067          	ret
    80002d28:	00001517          	auipc	a0,0x1
    80002d2c:	4a050513          	addi	a0,a0,1184 # 800041c8 <digits+0x70>
    80002d30:	fffff097          	auipc	ra,0xfffff
    80002d34:	f2c080e7          	jalr	-212(ra) # 80001c5c <panic>
    80002d38:	00001517          	auipc	a0,0x1
    80002d3c:	47050513          	addi	a0,a0,1136 # 800041a8 <digits+0x50>
    80002d40:	fffff097          	auipc	ra,0xfffff
    80002d44:	f1c080e7          	jalr	-228(ra) # 80001c5c <panic>

0000000080002d48 <__memset>:
    80002d48:	ff010113          	addi	sp,sp,-16
    80002d4c:	00813423          	sd	s0,8(sp)
    80002d50:	01010413          	addi	s0,sp,16
    80002d54:	1a060e63          	beqz	a2,80002f10 <__memset+0x1c8>
    80002d58:	40a007b3          	neg	a5,a0
    80002d5c:	0077f793          	andi	a5,a5,7
    80002d60:	00778693          	addi	a3,a5,7
    80002d64:	00b00813          	li	a6,11
    80002d68:	0ff5f593          	andi	a1,a1,255
    80002d6c:	fff6071b          	addiw	a4,a2,-1
    80002d70:	1b06e663          	bltu	a3,a6,80002f1c <__memset+0x1d4>
    80002d74:	1cd76463          	bltu	a4,a3,80002f3c <__memset+0x1f4>
    80002d78:	1a078e63          	beqz	a5,80002f34 <__memset+0x1ec>
    80002d7c:	00b50023          	sb	a1,0(a0)
    80002d80:	00100713          	li	a4,1
    80002d84:	1ae78463          	beq	a5,a4,80002f2c <__memset+0x1e4>
    80002d88:	00b500a3          	sb	a1,1(a0)
    80002d8c:	00200713          	li	a4,2
    80002d90:	1ae78a63          	beq	a5,a4,80002f44 <__memset+0x1fc>
    80002d94:	00b50123          	sb	a1,2(a0)
    80002d98:	00300713          	li	a4,3
    80002d9c:	18e78463          	beq	a5,a4,80002f24 <__memset+0x1dc>
    80002da0:	00b501a3          	sb	a1,3(a0)
    80002da4:	00400713          	li	a4,4
    80002da8:	1ae78263          	beq	a5,a4,80002f4c <__memset+0x204>
    80002dac:	00b50223          	sb	a1,4(a0)
    80002db0:	00500713          	li	a4,5
    80002db4:	1ae78063          	beq	a5,a4,80002f54 <__memset+0x20c>
    80002db8:	00b502a3          	sb	a1,5(a0)
    80002dbc:	00700713          	li	a4,7
    80002dc0:	18e79e63          	bne	a5,a4,80002f5c <__memset+0x214>
    80002dc4:	00b50323          	sb	a1,6(a0)
    80002dc8:	00700e93          	li	t4,7
    80002dcc:	00859713          	slli	a4,a1,0x8
    80002dd0:	00e5e733          	or	a4,a1,a4
    80002dd4:	01059e13          	slli	t3,a1,0x10
    80002dd8:	01c76e33          	or	t3,a4,t3
    80002ddc:	01859313          	slli	t1,a1,0x18
    80002de0:	006e6333          	or	t1,t3,t1
    80002de4:	02059893          	slli	a7,a1,0x20
    80002de8:	40f60e3b          	subw	t3,a2,a5
    80002dec:	011368b3          	or	a7,t1,a7
    80002df0:	02859813          	slli	a6,a1,0x28
    80002df4:	0108e833          	or	a6,a7,a6
    80002df8:	03059693          	slli	a3,a1,0x30
    80002dfc:	003e589b          	srliw	a7,t3,0x3
    80002e00:	00d866b3          	or	a3,a6,a3
    80002e04:	03859713          	slli	a4,a1,0x38
    80002e08:	00389813          	slli	a6,a7,0x3
    80002e0c:	00f507b3          	add	a5,a0,a5
    80002e10:	00e6e733          	or	a4,a3,a4
    80002e14:	000e089b          	sext.w	a7,t3
    80002e18:	00f806b3          	add	a3,a6,a5
    80002e1c:	00e7b023          	sd	a4,0(a5)
    80002e20:	00878793          	addi	a5,a5,8
    80002e24:	fed79ce3          	bne	a5,a3,80002e1c <__memset+0xd4>
    80002e28:	ff8e7793          	andi	a5,t3,-8
    80002e2c:	0007871b          	sext.w	a4,a5
    80002e30:	01d787bb          	addw	a5,a5,t4
    80002e34:	0ce88e63          	beq	a7,a4,80002f10 <__memset+0x1c8>
    80002e38:	00f50733          	add	a4,a0,a5
    80002e3c:	00b70023          	sb	a1,0(a4)
    80002e40:	0017871b          	addiw	a4,a5,1
    80002e44:	0cc77663          	bgeu	a4,a2,80002f10 <__memset+0x1c8>
    80002e48:	00e50733          	add	a4,a0,a4
    80002e4c:	00b70023          	sb	a1,0(a4)
    80002e50:	0027871b          	addiw	a4,a5,2
    80002e54:	0ac77e63          	bgeu	a4,a2,80002f10 <__memset+0x1c8>
    80002e58:	00e50733          	add	a4,a0,a4
    80002e5c:	00b70023          	sb	a1,0(a4)
    80002e60:	0037871b          	addiw	a4,a5,3
    80002e64:	0ac77663          	bgeu	a4,a2,80002f10 <__memset+0x1c8>
    80002e68:	00e50733          	add	a4,a0,a4
    80002e6c:	00b70023          	sb	a1,0(a4)
    80002e70:	0047871b          	addiw	a4,a5,4
    80002e74:	08c77e63          	bgeu	a4,a2,80002f10 <__memset+0x1c8>
    80002e78:	00e50733          	add	a4,a0,a4
    80002e7c:	00b70023          	sb	a1,0(a4)
    80002e80:	0057871b          	addiw	a4,a5,5
    80002e84:	08c77663          	bgeu	a4,a2,80002f10 <__memset+0x1c8>
    80002e88:	00e50733          	add	a4,a0,a4
    80002e8c:	00b70023          	sb	a1,0(a4)
    80002e90:	0067871b          	addiw	a4,a5,6
    80002e94:	06c77e63          	bgeu	a4,a2,80002f10 <__memset+0x1c8>
    80002e98:	00e50733          	add	a4,a0,a4
    80002e9c:	00b70023          	sb	a1,0(a4)
    80002ea0:	0077871b          	addiw	a4,a5,7
    80002ea4:	06c77663          	bgeu	a4,a2,80002f10 <__memset+0x1c8>
    80002ea8:	00e50733          	add	a4,a0,a4
    80002eac:	00b70023          	sb	a1,0(a4)
    80002eb0:	0087871b          	addiw	a4,a5,8
    80002eb4:	04c77e63          	bgeu	a4,a2,80002f10 <__memset+0x1c8>
    80002eb8:	00e50733          	add	a4,a0,a4
    80002ebc:	00b70023          	sb	a1,0(a4)
    80002ec0:	0097871b          	addiw	a4,a5,9
    80002ec4:	04c77663          	bgeu	a4,a2,80002f10 <__memset+0x1c8>
    80002ec8:	00e50733          	add	a4,a0,a4
    80002ecc:	00b70023          	sb	a1,0(a4)
    80002ed0:	00a7871b          	addiw	a4,a5,10
    80002ed4:	02c77e63          	bgeu	a4,a2,80002f10 <__memset+0x1c8>
    80002ed8:	00e50733          	add	a4,a0,a4
    80002edc:	00b70023          	sb	a1,0(a4)
    80002ee0:	00b7871b          	addiw	a4,a5,11
    80002ee4:	02c77663          	bgeu	a4,a2,80002f10 <__memset+0x1c8>
    80002ee8:	00e50733          	add	a4,a0,a4
    80002eec:	00b70023          	sb	a1,0(a4)
    80002ef0:	00c7871b          	addiw	a4,a5,12
    80002ef4:	00c77e63          	bgeu	a4,a2,80002f10 <__memset+0x1c8>
    80002ef8:	00e50733          	add	a4,a0,a4
    80002efc:	00b70023          	sb	a1,0(a4)
    80002f00:	00d7879b          	addiw	a5,a5,13
    80002f04:	00c7f663          	bgeu	a5,a2,80002f10 <__memset+0x1c8>
    80002f08:	00f507b3          	add	a5,a0,a5
    80002f0c:	00b78023          	sb	a1,0(a5)
    80002f10:	00813403          	ld	s0,8(sp)
    80002f14:	01010113          	addi	sp,sp,16
    80002f18:	00008067          	ret
    80002f1c:	00b00693          	li	a3,11
    80002f20:	e55ff06f          	j	80002d74 <__memset+0x2c>
    80002f24:	00300e93          	li	t4,3
    80002f28:	ea5ff06f          	j	80002dcc <__memset+0x84>
    80002f2c:	00100e93          	li	t4,1
    80002f30:	e9dff06f          	j	80002dcc <__memset+0x84>
    80002f34:	00000e93          	li	t4,0
    80002f38:	e95ff06f          	j	80002dcc <__memset+0x84>
    80002f3c:	00000793          	li	a5,0
    80002f40:	ef9ff06f          	j	80002e38 <__memset+0xf0>
    80002f44:	00200e93          	li	t4,2
    80002f48:	e85ff06f          	j	80002dcc <__memset+0x84>
    80002f4c:	00400e93          	li	t4,4
    80002f50:	e7dff06f          	j	80002dcc <__memset+0x84>
    80002f54:	00500e93          	li	t4,5
    80002f58:	e75ff06f          	j	80002dcc <__memset+0x84>
    80002f5c:	00600e93          	li	t4,6
    80002f60:	e6dff06f          	j	80002dcc <__memset+0x84>

0000000080002f64 <__memmove>:
    80002f64:	ff010113          	addi	sp,sp,-16
    80002f68:	00813423          	sd	s0,8(sp)
    80002f6c:	01010413          	addi	s0,sp,16
    80002f70:	0e060863          	beqz	a2,80003060 <__memmove+0xfc>
    80002f74:	fff6069b          	addiw	a3,a2,-1
    80002f78:	0006881b          	sext.w	a6,a3
    80002f7c:	0ea5e863          	bltu	a1,a0,8000306c <__memmove+0x108>
    80002f80:	00758713          	addi	a4,a1,7
    80002f84:	00a5e7b3          	or	a5,a1,a0
    80002f88:	40a70733          	sub	a4,a4,a0
    80002f8c:	0077f793          	andi	a5,a5,7
    80002f90:	00f73713          	sltiu	a4,a4,15
    80002f94:	00174713          	xori	a4,a4,1
    80002f98:	0017b793          	seqz	a5,a5
    80002f9c:	00e7f7b3          	and	a5,a5,a4
    80002fa0:	10078863          	beqz	a5,800030b0 <__memmove+0x14c>
    80002fa4:	00900793          	li	a5,9
    80002fa8:	1107f463          	bgeu	a5,a6,800030b0 <__memmove+0x14c>
    80002fac:	0036581b          	srliw	a6,a2,0x3
    80002fb0:	fff8081b          	addiw	a6,a6,-1
    80002fb4:	02081813          	slli	a6,a6,0x20
    80002fb8:	01d85893          	srli	a7,a6,0x1d
    80002fbc:	00858813          	addi	a6,a1,8
    80002fc0:	00058793          	mv	a5,a1
    80002fc4:	00050713          	mv	a4,a0
    80002fc8:	01088833          	add	a6,a7,a6
    80002fcc:	0007b883          	ld	a7,0(a5)
    80002fd0:	00878793          	addi	a5,a5,8
    80002fd4:	00870713          	addi	a4,a4,8
    80002fd8:	ff173c23          	sd	a7,-8(a4)
    80002fdc:	ff0798e3          	bne	a5,a6,80002fcc <__memmove+0x68>
    80002fe0:	ff867713          	andi	a4,a2,-8
    80002fe4:	02071793          	slli	a5,a4,0x20
    80002fe8:	0207d793          	srli	a5,a5,0x20
    80002fec:	00f585b3          	add	a1,a1,a5
    80002ff0:	40e686bb          	subw	a3,a3,a4
    80002ff4:	00f507b3          	add	a5,a0,a5
    80002ff8:	06e60463          	beq	a2,a4,80003060 <__memmove+0xfc>
    80002ffc:	0005c703          	lbu	a4,0(a1)
    80003000:	00e78023          	sb	a4,0(a5)
    80003004:	04068e63          	beqz	a3,80003060 <__memmove+0xfc>
    80003008:	0015c603          	lbu	a2,1(a1)
    8000300c:	00100713          	li	a4,1
    80003010:	00c780a3          	sb	a2,1(a5)
    80003014:	04e68663          	beq	a3,a4,80003060 <__memmove+0xfc>
    80003018:	0025c603          	lbu	a2,2(a1)
    8000301c:	00200713          	li	a4,2
    80003020:	00c78123          	sb	a2,2(a5)
    80003024:	02e68e63          	beq	a3,a4,80003060 <__memmove+0xfc>
    80003028:	0035c603          	lbu	a2,3(a1)
    8000302c:	00300713          	li	a4,3
    80003030:	00c781a3          	sb	a2,3(a5)
    80003034:	02e68663          	beq	a3,a4,80003060 <__memmove+0xfc>
    80003038:	0045c603          	lbu	a2,4(a1)
    8000303c:	00400713          	li	a4,4
    80003040:	00c78223          	sb	a2,4(a5)
    80003044:	00e68e63          	beq	a3,a4,80003060 <__memmove+0xfc>
    80003048:	0055c603          	lbu	a2,5(a1)
    8000304c:	00500713          	li	a4,5
    80003050:	00c782a3          	sb	a2,5(a5)
    80003054:	00e68663          	beq	a3,a4,80003060 <__memmove+0xfc>
    80003058:	0065c703          	lbu	a4,6(a1)
    8000305c:	00e78323          	sb	a4,6(a5)
    80003060:	00813403          	ld	s0,8(sp)
    80003064:	01010113          	addi	sp,sp,16
    80003068:	00008067          	ret
    8000306c:	02061713          	slli	a4,a2,0x20
    80003070:	02075713          	srli	a4,a4,0x20
    80003074:	00e587b3          	add	a5,a1,a4
    80003078:	f0f574e3          	bgeu	a0,a5,80002f80 <__memmove+0x1c>
    8000307c:	02069613          	slli	a2,a3,0x20
    80003080:	02065613          	srli	a2,a2,0x20
    80003084:	fff64613          	not	a2,a2
    80003088:	00e50733          	add	a4,a0,a4
    8000308c:	00c78633          	add	a2,a5,a2
    80003090:	fff7c683          	lbu	a3,-1(a5)
    80003094:	fff78793          	addi	a5,a5,-1
    80003098:	fff70713          	addi	a4,a4,-1
    8000309c:	00d70023          	sb	a3,0(a4)
    800030a0:	fec798e3          	bne	a5,a2,80003090 <__memmove+0x12c>
    800030a4:	00813403          	ld	s0,8(sp)
    800030a8:	01010113          	addi	sp,sp,16
    800030ac:	00008067          	ret
    800030b0:	02069713          	slli	a4,a3,0x20
    800030b4:	02075713          	srli	a4,a4,0x20
    800030b8:	00170713          	addi	a4,a4,1
    800030bc:	00e50733          	add	a4,a0,a4
    800030c0:	00050793          	mv	a5,a0
    800030c4:	0005c683          	lbu	a3,0(a1)
    800030c8:	00178793          	addi	a5,a5,1
    800030cc:	00158593          	addi	a1,a1,1
    800030d0:	fed78fa3          	sb	a3,-1(a5)
    800030d4:	fee798e3          	bne	a5,a4,800030c4 <__memmove+0x160>
    800030d8:	f89ff06f          	j	80003060 <__memmove+0xfc>
	...
