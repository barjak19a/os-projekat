
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00004117          	auipc	sp,0x4
    80000004:	65813103          	ld	sp,1624(sp) # 80004658 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	355010ef          	jal	ra,80001b70 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001000:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001004:	00b29a63          	bne	t0,a1,80001018 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001008:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    8000100c:	fe029ae3          	bnez	t0,80001000 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001010:	00000513          	li	a0,0
    jr ra                  # Return.
    80001014:	00008067          	ret

0000000080001018 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001018:	00100513          	li	a0,1
    8000101c:	00008067          	ret

0000000080001020 <_ZN5riscv14supervisorTrapEv>:

.align 4
.global _ZN5riscv14supervisorTrapEv
.type _ZN5riscv14supervisorTrapEv, @function
_ZN5riscv14supervisorTrapEv:
    addi sp, sp, -256
    80001020:	f0010113          	addi	sp,sp,-256
    # x0 ozicen na nulu
    # x1 cuvamo u  okviru same strukture konteksta
    # x2 cuvamo u okvritu same strukture konteksta
    .irp index 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index *8(sp)
    .endr
    80001024:	00013023          	sd	zero,0(sp)
    80001028:	00113423          	sd	ra,8(sp)
    8000102c:	00213823          	sd	sp,16(sp)
    80001030:	00313c23          	sd	gp,24(sp)
    80001034:	02413023          	sd	tp,32(sp)
    80001038:	02513423          	sd	t0,40(sp)
    8000103c:	02613823          	sd	t1,48(sp)
    80001040:	02713c23          	sd	t2,56(sp)
    80001044:	04813023          	sd	s0,64(sp)
    80001048:	04913423          	sd	s1,72(sp)
    8000104c:	04a13823          	sd	a0,80(sp)
    80001050:	04b13c23          	sd	a1,88(sp)
    80001054:	06c13023          	sd	a2,96(sp)
    80001058:	06d13423          	sd	a3,104(sp)
    8000105c:	06e13823          	sd	a4,112(sp)
    80001060:	06f13c23          	sd	a5,120(sp)
    80001064:	09013023          	sd	a6,128(sp)
    80001068:	09113423          	sd	a7,136(sp)
    8000106c:	09213823          	sd	s2,144(sp)
    80001070:	09313c23          	sd	s3,152(sp)
    80001074:	0b413023          	sd	s4,160(sp)
    80001078:	0b513423          	sd	s5,168(sp)
    8000107c:	0b613823          	sd	s6,176(sp)
    80001080:	0b713c23          	sd	s7,184(sp)
    80001084:	0d813023          	sd	s8,192(sp)
    80001088:	0d913423          	sd	s9,200(sp)
    8000108c:	0da13823          	sd	s10,208(sp)
    80001090:	0db13c23          	sd	s11,216(sp)
    80001094:	0fc13023          	sd	t3,224(sp)
    80001098:	0fd13423          	sd	t4,232(sp)
    8000109c:	0fe13823          	sd	t5,240(sp)
    800010a0:	0ff13c23          	sd	t6,248(sp)

        call _ZN5riscv20handleSupervisorTrapEv
    800010a4:	5b4000ef          	jal	ra,80001658 <_ZN5riscv20handleSupervisorTrapEv>
    # x0 ozicen na nulu
    # x1 cuvamo u  okviru same strukture konteksta
    # x2 cuvamo u okvritu same strukture konteksta
    .irp index 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index *8(sp)
    .endr
    800010a8:	00013003          	ld	zero,0(sp)
    800010ac:	00813083          	ld	ra,8(sp)
    800010b0:	01013103          	ld	sp,16(sp)
    800010b4:	01813183          	ld	gp,24(sp)
    800010b8:	02013203          	ld	tp,32(sp)
    800010bc:	02813283          	ld	t0,40(sp)
    800010c0:	03013303          	ld	t1,48(sp)
    800010c4:	03813383          	ld	t2,56(sp)
    800010c8:	04013403          	ld	s0,64(sp)
    800010cc:	04813483          	ld	s1,72(sp)
    800010d0:	05813583          	ld	a1,88(sp)
    800010d4:	06013603          	ld	a2,96(sp)
    800010d8:	06813683          	ld	a3,104(sp)
    800010dc:	07013703          	ld	a4,112(sp)
    800010e0:	07813783          	ld	a5,120(sp)
    800010e4:	08013803          	ld	a6,128(sp)
    800010e8:	08813883          	ld	a7,136(sp)
    800010ec:	09013903          	ld	s2,144(sp)
    800010f0:	09813983          	ld	s3,152(sp)
    800010f4:	0a013a03          	ld	s4,160(sp)
    800010f8:	0a813a83          	ld	s5,168(sp)
    800010fc:	0b013b03          	ld	s6,176(sp)
    80001100:	0b813b83          	ld	s7,184(sp)
    80001104:	0c013c03          	ld	s8,192(sp)
    80001108:	0c813c83          	ld	s9,200(sp)
    8000110c:	0d013d03          	ld	s10,208(sp)
    80001110:	0d813d83          	ld	s11,216(sp)
    80001114:	0e013e03          	ld	t3,224(sp)
    80001118:	0e813e83          	ld	t4,232(sp)
    8000111c:	0f013f03          	ld	t5,240(sp)
    80001120:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001124:	10010113          	addi	sp,sp,256


    80001128:	10200073          	sret
    8000112c:	0000                	unimp
	...

0000000080001130 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>:
.global _ZN7_thread13contextSwitchEPNS_7ContextES1_
.type _ZN7_thread13contextSwitchEPNS_7ContextES1_, @function
_ZN7_thread13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001130:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001134:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001138:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000113c:	0085b103          	ld	sp,8(a1)

    80001140:	00008067          	ret

0000000080001144 <_Z13callOperationm>:
//

#include "../h/syscall_c.hpp"
#include "../lib/console.h"

void callOperation(uint64 operationCode){
    80001144:	ff010113          	addi	sp,sp,-16
    80001148:	00813423          	sd	s0,8(sp)
    8000114c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a0, %0" : : "r" (operationCode));
    80001150:	00050513          	mv	a0,a0
    __asm__ volatile ("ecall");
    80001154:	00000073          	ecall
}
    80001158:	00813403          	ld	s0,8(sp)
    8000115c:	01010113          	addi	sp,sp,16
    80001160:	00008067          	ret

0000000080001164 <_Z3retv>:

uint64 ret(){
    80001164:	fe010113          	addi	sp,sp,-32
    80001168:	00813c23          	sd	s0,24(sp)
    8000116c:	02010413          	addi	s0,sp,32
    uint64 volatile ret_val;
    __asm__ volatile ("mv %0, a0":"=r"(ret_val));
    80001170:	00050793          	mv	a5,a0
    80001174:	fef43423          	sd	a5,-24(s0)
    return  ret_val;
    80001178:	fe843503          	ld	a0,-24(s0)
}
    8000117c:	01813403          	ld	s0,24(sp)
    80001180:	02010113          	addi	sp,sp,32
    80001184:	00008067          	ret

0000000080001188 <_Z9mem_allocm>:

void* mem_alloc(size_t size){
    80001188:	ff010113          	addi	sp,sp,-16
    8000118c:	00113423          	sd	ra,8(sp)
    80001190:	00813023          	sd	s0,0(sp)
    80001194:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0": : "r"(size));
    80001198:	00050593          	mv	a1,a0
    callOperation(1);
    8000119c:	00100513          	li	a0,1
    800011a0:	00000097          	auipc	ra,0x0
    800011a4:	fa4080e7          	jalr	-92(ra) # 80001144 <_Z13callOperationm>
    return (void*)ret();
    800011a8:	00000097          	auipc	ra,0x0
    800011ac:	fbc080e7          	jalr	-68(ra) # 80001164 <_Z3retv>
}
    800011b0:	00813083          	ld	ra,8(sp)
    800011b4:	00013403          	ld	s0,0(sp)
    800011b8:	01010113          	addi	sp,sp,16
    800011bc:	00008067          	ret

00000000800011c0 <_Z8mem_freePv>:

int mem_free(void* adr){
    800011c0:	ff010113          	addi	sp,sp,-16
    800011c4:	00113423          	sd	ra,8(sp)
    800011c8:	00813023          	sd	s0,0(sp)
    800011cc:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0": : "r"(adr));
    800011d0:	00050593          	mv	a1,a0
    callOperation(2);
    800011d4:	00200513          	li	a0,2
    800011d8:	00000097          	auipc	ra,0x0
    800011dc:	f6c080e7          	jalr	-148(ra) # 80001144 <_Z13callOperationm>
    return (int)ret();
    800011e0:	00000097          	auipc	ra,0x0
    800011e4:	f84080e7          	jalr	-124(ra) # 80001164 <_Z3retv>
}
    800011e8:	0005051b          	sext.w	a0,a0
    800011ec:	00813083          	ld	ra,8(sp)
    800011f0:	00013403          	ld	s0,0(sp)
    800011f4:	01010113          	addi	sp,sp,16
    800011f8:	00008067          	ret

00000000800011fc <_Z4getcv>:

char getc(){
    800011fc:	fe010113          	addi	sp,sp,-32
    80001200:	00113c23          	sd	ra,24(sp)
    80001204:	00813823          	sd	s0,16(sp)
    80001208:	02010413          	addi	s0,sp,32
    callOperation(41);
    8000120c:	02900513          	li	a0,41
    80001210:	00000097          	auipc	ra,0x0
    80001214:	f34080e7          	jalr	-204(ra) # 80001144 <_Z13callOperationm>
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80001218:	00050793          	mv	a5,a0
    8000121c:	fef43423          	sd	a5,-24(s0)
    return (char)ret;
    80001220:	fe843503          	ld	a0,-24(s0)
}
    80001224:	0ff57513          	andi	a0,a0,255
    80001228:	01813083          	ld	ra,24(sp)
    8000122c:	01013403          	ld	s0,16(sp)
    80001230:	02010113          	addi	sp,sp,32
    80001234:	00008067          	ret

0000000080001238 <_Z4putcc>:

void putc(char c){
    80001238:	ff010113          	addi	sp,sp,-16
    8000123c:	00113423          	sd	ra,8(sp)
    80001240:	00813023          	sd	s0,0(sp)
    80001244:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0": : "r"(c));
    80001248:	00050593          	mv	a1,a0
    callOperation(42);
    8000124c:	02a00513          	li	a0,42
    80001250:	00000097          	auipc	ra,0x0
    80001254:	ef4080e7          	jalr	-268(ra) # 80001144 <_Z13callOperationm>
}
    80001258:	00813083          	ld	ra,8(sp)
    8000125c:	00013403          	ld	s0,0(sp)
    80001260:	01010113          	addi	sp,sp,16
    80001264:	00008067          	ret

0000000080001268 <_Znam>:

#include "../h/_thread.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"

void* operator new[](size_t n) {
    80001268:	ff010113          	addi	sp,sp,-16
    8000126c:	00113423          	sd	ra,8(sp)
    80001270:	00813023          	sd	s0,0(sp)
    80001274:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(n);
    80001278:	00000097          	auipc	ra,0x0
    8000127c:	610080e7          	jalr	1552(ra) # 80001888 <_ZN15MemoryAllocator9mem_allocEm>
}
    80001280:	00813083          	ld	ra,8(sp)
    80001284:	00013403          	ld	s0,0(sp)
    80001288:	01010113          	addi	sp,sp,16
    8000128c:	00008067          	ret

0000000080001290 <_ZdaPv>:

void operator delete[](void *p)  {
    80001290:	ff010113          	addi	sp,sp,-16
    80001294:	00113423          	sd	ra,8(sp)
    80001298:	00813023          	sd	s0,0(sp)
    8000129c:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(p);
    800012a0:	00000097          	auipc	ra,0x0
    800012a4:	748080e7          	jalr	1864(ra) # 800019e8 <_ZN15MemoryAllocator8mem_freeEPv>
}
    800012a8:	00813083          	ld	ra,8(sp)
    800012ac:	00013403          	ld	s0,0(sp)
    800012b0:	01010113          	addi	sp,sp,16
    800012b4:	00008067          	ret

00000000800012b8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800012b8:	fe010113          	addi	sp,sp,-32
    800012bc:	00113c23          	sd	ra,24(sp)
    800012c0:	00813823          	sd	s0,16(sp)
    800012c4:	00913423          	sd	s1,8(sp)
    800012c8:	02010413          	addi	s0,sp,32
    800012cc:	00050493          	mv	s1,a0
    LOCK();
    800012d0:	00100613          	li	a2,1
    800012d4:	00000593          	li	a1,0
    800012d8:	00003517          	auipc	a0,0x3
    800012dc:	3e850513          	addi	a0,a0,1000 # 800046c0 <lockPrint>
    800012e0:	00000097          	auipc	ra,0x0
    800012e4:	d20080e7          	jalr	-736(ra) # 80001000 <copy_and_swap>
    800012e8:	fe0514e3          	bnez	a0,800012d0 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800012ec:	0004c503          	lbu	a0,0(s1)
    800012f0:	00050a63          	beqz	a0,80001304 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    800012f4:	00000097          	auipc	ra,0x0
    800012f8:	f44080e7          	jalr	-188(ra) # 80001238 <_Z4putcc>
        string++;
    800012fc:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80001300:	fedff06f          	j	800012ec <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80001304:	00000613          	li	a2,0
    80001308:	00100593          	li	a1,1
    8000130c:	00003517          	auipc	a0,0x3
    80001310:	3b450513          	addi	a0,a0,948 # 800046c0 <lockPrint>
    80001314:	00000097          	auipc	ra,0x0
    80001318:	cec080e7          	jalr	-788(ra) # 80001000 <copy_and_swap>
    8000131c:	fe0514e3          	bnez	a0,80001304 <_Z11printStringPKc+0x4c>
}
    80001320:	01813083          	ld	ra,24(sp)
    80001324:	01013403          	ld	s0,16(sp)
    80001328:	00813483          	ld	s1,8(sp)
    8000132c:	02010113          	addi	sp,sp,32
    80001330:	00008067          	ret

0000000080001334 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80001334:	fd010113          	addi	sp,sp,-48
    80001338:	02113423          	sd	ra,40(sp)
    8000133c:	02813023          	sd	s0,32(sp)
    80001340:	00913c23          	sd	s1,24(sp)
    80001344:	01213823          	sd	s2,16(sp)
    80001348:	01313423          	sd	s3,8(sp)
    8000134c:	01413023          	sd	s4,0(sp)
    80001350:	03010413          	addi	s0,sp,48
    80001354:	00050993          	mv	s3,a0
    80001358:	00058a13          	mv	s4,a1
    LOCK();
    8000135c:	00100613          	li	a2,1
    80001360:	00000593          	li	a1,0
    80001364:	00003517          	auipc	a0,0x3
    80001368:	35c50513          	addi	a0,a0,860 # 800046c0 <lockPrint>
    8000136c:	00000097          	auipc	ra,0x0
    80001370:	c94080e7          	jalr	-876(ra) # 80001000 <copy_and_swap>
    80001374:	fe0514e3          	bnez	a0,8000135c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80001378:	00000913          	li	s2,0
    8000137c:	00090493          	mv	s1,s2
    80001380:	0019091b          	addiw	s2,s2,1
    80001384:	03495a63          	bge	s2,s4,800013b8 <_Z9getStringPci+0x84>
        cc = getc();
    80001388:	00000097          	auipc	ra,0x0
    8000138c:	e74080e7          	jalr	-396(ra) # 800011fc <_Z4getcv>
        if(cc < 1)
    80001390:	02050463          	beqz	a0,800013b8 <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    80001394:	009984b3          	add	s1,s3,s1
    80001398:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    8000139c:	00a00793          	li	a5,10
    800013a0:	00f50a63          	beq	a0,a5,800013b4 <_Z9getStringPci+0x80>
    800013a4:	00d00793          	li	a5,13
    800013a8:	fcf51ae3          	bne	a0,a5,8000137c <_Z9getStringPci+0x48>
        buf[i++] = c;
    800013ac:	00090493          	mv	s1,s2
    800013b0:	0080006f          	j	800013b8 <_Z9getStringPci+0x84>
    800013b4:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800013b8:	009984b3          	add	s1,s3,s1
    800013bc:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800013c0:	00000613          	li	a2,0
    800013c4:	00100593          	li	a1,1
    800013c8:	00003517          	auipc	a0,0x3
    800013cc:	2f850513          	addi	a0,a0,760 # 800046c0 <lockPrint>
    800013d0:	00000097          	auipc	ra,0x0
    800013d4:	c30080e7          	jalr	-976(ra) # 80001000 <copy_and_swap>
    800013d8:	fe0514e3          	bnez	a0,800013c0 <_Z9getStringPci+0x8c>
    return buf;
}
    800013dc:	00098513          	mv	a0,s3
    800013e0:	02813083          	ld	ra,40(sp)
    800013e4:	02013403          	ld	s0,32(sp)
    800013e8:	01813483          	ld	s1,24(sp)
    800013ec:	01013903          	ld	s2,16(sp)
    800013f0:	00813983          	ld	s3,8(sp)
    800013f4:	00013a03          	ld	s4,0(sp)
    800013f8:	03010113          	addi	sp,sp,48
    800013fc:	00008067          	ret

0000000080001400 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80001400:	ff010113          	addi	sp,sp,-16
    80001404:	00813423          	sd	s0,8(sp)
    80001408:	01010413          	addi	s0,sp,16
    8000140c:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80001410:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80001414:	0006c603          	lbu	a2,0(a3)
    80001418:	fd06071b          	addiw	a4,a2,-48
    8000141c:	0ff77713          	andi	a4,a4,255
    80001420:	00900793          	li	a5,9
    80001424:	02e7e063          	bltu	a5,a4,80001444 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80001428:	0025179b          	slliw	a5,a0,0x2
    8000142c:	00a787bb          	addw	a5,a5,a0
    80001430:	0017979b          	slliw	a5,a5,0x1
    80001434:	00168693          	addi	a3,a3,1
    80001438:	00c787bb          	addw	a5,a5,a2
    8000143c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80001440:	fd5ff06f          	j	80001414 <_Z11stringToIntPKc+0x14>
    return n;
}
    80001444:	00813403          	ld	s0,8(sp)
    80001448:	01010113          	addi	sp,sp,16
    8000144c:	00008067          	ret

0000000080001450 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80001450:	fc010113          	addi	sp,sp,-64
    80001454:	02113c23          	sd	ra,56(sp)
    80001458:	02813823          	sd	s0,48(sp)
    8000145c:	02913423          	sd	s1,40(sp)
    80001460:	03213023          	sd	s2,32(sp)
    80001464:	01313c23          	sd	s3,24(sp)
    80001468:	04010413          	addi	s0,sp,64
    8000146c:	00050493          	mv	s1,a0
    80001470:	00058913          	mv	s2,a1
    80001474:	00060993          	mv	s3,a2
    LOCK();
    80001478:	00100613          	li	a2,1
    8000147c:	00000593          	li	a1,0
    80001480:	00003517          	auipc	a0,0x3
    80001484:	24050513          	addi	a0,a0,576 # 800046c0 <lockPrint>
    80001488:	00000097          	auipc	ra,0x0
    8000148c:	b78080e7          	jalr	-1160(ra) # 80001000 <copy_and_swap>
    80001490:	fe0514e3          	bnez	a0,80001478 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80001494:	00098463          	beqz	s3,8000149c <_Z8printIntiii+0x4c>
    80001498:	0804c463          	bltz	s1,80001520 <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    8000149c:	0004851b          	sext.w	a0,s1
    neg = 0;
    800014a0:	00000593          	li	a1,0
    }

    i = 0;
    800014a4:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800014a8:	0009079b          	sext.w	a5,s2
    800014ac:	0325773b          	remuw	a4,a0,s2
    800014b0:	00048613          	mv	a2,s1
    800014b4:	0014849b          	addiw	s1,s1,1
    800014b8:	02071693          	slli	a3,a4,0x20
    800014bc:	0206d693          	srli	a3,a3,0x20
    800014c0:	00003717          	auipc	a4,0x3
    800014c4:	17070713          	addi	a4,a4,368 # 80004630 <digits>
    800014c8:	00d70733          	add	a4,a4,a3
    800014cc:	00074683          	lbu	a3,0(a4)
    800014d0:	fd040713          	addi	a4,s0,-48
    800014d4:	00c70733          	add	a4,a4,a2
    800014d8:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800014dc:	0005071b          	sext.w	a4,a0
    800014e0:	0325553b          	divuw	a0,a0,s2
    800014e4:	fcf772e3          	bgeu	a4,a5,800014a8 <_Z8printIntiii+0x58>
    if(neg)
    800014e8:	00058c63          	beqz	a1,80001500 <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    800014ec:	fd040793          	addi	a5,s0,-48
    800014f0:	009784b3          	add	s1,a5,s1
    800014f4:	02d00793          	li	a5,45
    800014f8:	fef48823          	sb	a5,-16(s1)
    800014fc:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80001500:	fff4849b          	addiw	s1,s1,-1
    80001504:	0204c463          	bltz	s1,8000152c <_Z8printIntiii+0xdc>
        putc(buf[i]);
    80001508:	fd040793          	addi	a5,s0,-48
    8000150c:	009787b3          	add	a5,a5,s1
    80001510:	ff07c503          	lbu	a0,-16(a5)
    80001514:	00000097          	auipc	ra,0x0
    80001518:	d24080e7          	jalr	-732(ra) # 80001238 <_Z4putcc>
    8000151c:	fe5ff06f          	j	80001500 <_Z8printIntiii+0xb0>
        x = -xx;
    80001520:	4090053b          	negw	a0,s1
        neg = 1;
    80001524:	00100593          	li	a1,1
        x = -xx;
    80001528:	f7dff06f          	j	800014a4 <_Z8printIntiii+0x54>

    UNLOCK();
    8000152c:	00000613          	li	a2,0
    80001530:	00100593          	li	a1,1
    80001534:	00003517          	auipc	a0,0x3
    80001538:	18c50513          	addi	a0,a0,396 # 800046c0 <lockPrint>
    8000153c:	00000097          	auipc	ra,0x0
    80001540:	ac4080e7          	jalr	-1340(ra) # 80001000 <copy_and_swap>
    80001544:	fe0514e3          	bnez	a0,8000152c <_Z8printIntiii+0xdc>
    80001548:	03813083          	ld	ra,56(sp)
    8000154c:	03013403          	ld	s0,48(sp)
    80001550:	02813483          	ld	s1,40(sp)
    80001554:	02013903          	ld	s2,32(sp)
    80001558:	01813983          	ld	s3,24(sp)
    8000155c:	04010113          	addi	sp,sp,64
    80001560:	00008067          	ret

0000000080001564 <main>:
#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"



int main() {
    80001564:	ff010113          	addi	sp,sp,-16
    80001568:	00113423          	sd	ra,8(sp)
    8000156c:	00813023          	sd	s0,0(sp)
    80001570:	01010413          	addi	s0,sp,16
    MemoryAllocator::initialize();
    80001574:	00000097          	auipc	ra,0x0
    80001578:	2cc080e7          	jalr	716(ra) # 80001840 <_ZN15MemoryAllocator10initializeEv>
    riscv::w_stvec((uint64)&riscv::supervisorTrap);
    8000157c:	00003797          	auipc	a5,0x3
    80001580:	0e47b783          	ld	a5,228(a5) # 80004660 <_GLOBAL_OFFSET_TABLE_+0x18>
    return stvec;
}

inline void riscv::w_stvec(uint64 stvec)
{
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001584:	10579073          	csrw	stvec,a5
    //riscv::ms_sstatus(riscv::SSTATUS_SIE);

    __asm__ volatile ("mv a0, %0" : : "r" (45));
    80001588:	02d00793          	li	a5,45
    8000158c:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001590:	00000073          	ecall

    void* mojBlok = mem_alloc(1024);
    80001594:	40000513          	li	a0,1024
    80001598:	00000097          	auipc	ra,0x0
    8000159c:	bf0080e7          	jalr	-1040(ra) # 80001188 <_Z9mem_allocm>
    for(int i =0; i< 1999; i++){
    800015a0:	00000793          	li	a5,0
    800015a4:	7ce00713          	li	a4,1998
    800015a8:	00f74663          	blt	a4,a5,800015b4 <main+0x50>
    800015ac:	0017879b          	addiw	a5,a5,1
    800015b0:	ff5ff06f          	j	800015a4 <main+0x40>

    }
    mem_free(mojBlok);
    800015b4:	00000097          	auipc	ra,0x0
    800015b8:	c0c080e7          	jalr	-1012(ra) # 800011c0 <_Z8mem_freePv>
    __putc('k');
    800015bc:	06b00513          	li	a0,107
    800015c0:	00002097          	auipc	ra,0x2
    800015c4:	66c080e7          	jalr	1644(ra) # 80003c2c <__putc>
    __putc('\n');
    800015c8:	00a00513          	li	a0,10
    800015cc:	00002097          	auipc	ra,0x2
    800015d0:	660080e7          	jalr	1632(ra) # 80003c2c <__putc>

    return 0;
    800015d4:	00000513          	li	a0,0
    800015d8:	00813083          	ld	ra,8(sp)
    800015dc:	00013403          	ld	s0,0(sp)
    800015e0:	01010113          	addi	sp,sp,16
    800015e4:	00008067          	ret

00000000800015e8 <_Znwm>:
#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.hpp"
#include "../h/_thread.hpp"
#include "../h/MemoryAllocator.hpp"

void *operator new(size_t n){
    800015e8:	ff010113          	addi	sp,sp,-16
    800015ec:	00113423          	sd	ra,8(sp)
    800015f0:	00813023          	sd	s0,0(sp)
    800015f4:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    800015f8:	00000097          	auipc	ra,0x0
    800015fc:	b90080e7          	jalr	-1136(ra) # 80001188 <_Z9mem_allocm>
}
    80001600:	00813083          	ld	ra,8(sp)
    80001604:	00013403          	ld	s0,0(sp)
    80001608:	01010113          	addi	sp,sp,16
    8000160c:	00008067          	ret

0000000080001610 <_ZdlPv>:

void operator delete(void *p) {
    80001610:	ff010113          	addi	sp,sp,-16
    80001614:	00113423          	sd	ra,8(sp)
    80001618:	00813023          	sd	s0,0(sp)
    8000161c:	01010413          	addi	s0,sp,16
    mem_free(p);
    80001620:	00000097          	auipc	ra,0x0
    80001624:	ba0080e7          	jalr	-1120(ra) # 800011c0 <_Z8mem_freePv>
    80001628:	00813083          	ld	ra,8(sp)
    8000162c:	00013403          	ld	s0,0(sp)
    80001630:	01010113          	addi	sp,sp,16
    80001634:	00008067          	ret

0000000080001638 <_ZN5riscv10popSppSpieEv>:
#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/_thread.hpp"

void riscv::popSppSpie() {
    80001638:	ff010113          	addi	sp,sp,-16
    8000163c:	00813423          	sd	s0,8(sp)
    80001640:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80001644:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001648:	10200073          	sret
}
    8000164c:	00813403          	ld	s0,8(sp)
    80001650:	01010113          	addi	sp,sp,16
    80001654:	00008067          	ret

0000000080001658 <_ZN5riscv20handleSupervisorTrapEv>:

void riscv::handleSupervisorTrap() {
    80001658:	fe010113          	addi	sp,sp,-32
    8000165c:	00113c23          	sd	ra,24(sp)
    80001660:	00813823          	sd	s0,16(sp)
    80001664:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80001668:	142027f3          	csrr	a5,scause
    8000166c:	fef43023          	sd	a5,-32(s0)
    return scause;
    80001670:	fe043703          	ld	a4,-32(s0)
    uint64 scause = r_scause();

    if (scause == 0x0000000000000008UL || scause == 0x0000000000000009UL) {
    80001674:	ff870693          	addi	a3,a4,-8
    80001678:	00100793          	li	a5,1
    8000167c:	02d7f263          	bgeu	a5,a3,800016a0 <_ZN5riscv20handleSupervisorTrapEv+0x48>
            __asm__ volatile ("mv a0, %0" : : "r" (allocated));
        }
        else if(argument0 == 2){
            MemoryAllocator::mem_free((void*)argument1);
        }
    } else if(scause == 0x8000000000000001UL){
    80001680:	fff00793          	li	a5,-1
    80001684:	03f79793          	slli	a5,a5,0x3f
    80001688:	00178793          	addi	a5,a5,1
    8000168c:	06f70063          	beq	a4,a5,800016ec <_ZN5riscv20handleSupervisorTrapEv+0x94>
        //SSI
        mc_sip(SIP_SSIE);
        //ne znam sta radi, SIP_SSIE je vrednost (1<<1), kod boza je ova vrednost SIP_SSIP ista
    }
    80001690:	01813083          	ld	ra,24(sp)
    80001694:	01013403          	ld	s0,16(sp)
    80001698:	02010113          	addi	sp,sp,32
    8000169c:	00008067          	ret
        __asm__ volatile("mv %0, a0" : "=r" (argument0));
    800016a0:	00050713          	mv	a4,a0
        __asm__ volatile("mv %0, a1" : "=r" (argument1));
    800016a4:	00058513          	mv	a0,a1
        __asm__ volatile("mv %0, a2" : "=r" (argument2));
    800016a8:	00060793          	mv	a5,a2
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800016ac:	141027f3          	csrr	a5,sepc
    800016b0:	fef43423          	sd	a5,-24(s0)
    return sepc;
    800016b4:	fe843783          	ld	a5,-24(s0)
        w_sepc(sepc + 4); //uvecava pc za 4
    800016b8:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800016bc:	14179073          	csrw	sepc,a5
        if (argument0 == 1){
    800016c0:	00100793          	li	a5,1
    800016c4:	00f70c63          	beq	a4,a5,800016dc <_ZN5riscv20handleSupervisorTrapEv+0x84>
        else if(argument0 == 2){
    800016c8:	00200793          	li	a5,2
    800016cc:	fcf712e3          	bne	a4,a5,80001690 <_ZN5riscv20handleSupervisorTrapEv+0x38>
            MemoryAllocator::mem_free((void*)argument1);
    800016d0:	00000097          	auipc	ra,0x0
    800016d4:	318080e7          	jalr	792(ra) # 800019e8 <_ZN15MemoryAllocator8mem_freeEPv>
    800016d8:	fb9ff06f          	j	80001690 <_ZN5riscv20handleSupervisorTrapEv+0x38>
            void* allocated = MemoryAllocator::mem_alloc(argument1);
    800016dc:	00000097          	auipc	ra,0x0
    800016e0:	1ac080e7          	jalr	428(ra) # 80001888 <_ZN15MemoryAllocator9mem_allocEm>
            __asm__ volatile ("mv a0, %0" : : "r" (allocated));
    800016e4:	00050513          	mv	a0,a0
    800016e8:	fa9ff06f          	j	80001690 <_ZN5riscv20handleSupervisorTrapEv+0x38>
    __asm__ volatile ("csrs sip, %[mask]" : : [mask] "r"(mask));
}

inline void riscv::mc_sip(uint64 mask)
{
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    800016ec:	00200793          	li	a5,2
    800016f0:	1447b073          	csrc	sip,a5
    800016f4:	f9dff06f          	j	80001690 <_ZN5riscv20handleSupervisorTrapEv+0x38>

00000000800016f8 <_Z41__static_initialization_and_destruction_0ii>:
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(_thread *tcb) {
    readyCoroutineQueue.addLast(tcb);
    800016f8:	ff010113          	addi	sp,sp,-16
    800016fc:	00813423          	sd	s0,8(sp)
    80001700:	01010413          	addi	s0,sp,16
    80001704:	00100793          	li	a5,1
    80001708:	00f50863          	beq	a0,a5,80001718 <_Z41__static_initialization_and_destruction_0ii+0x20>
    8000170c:	00813403          	ld	s0,8(sp)
    80001710:	01010113          	addi	sp,sp,16
    80001714:	00008067          	ret
    80001718:	000107b7          	lui	a5,0x10
    8000171c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001720:	fef596e3          	bne	a1,a5,8000170c <_Z41__static_initialization_and_destruction_0ii+0x14>
        Elem(T *data, Elem *next) : data(data), next(next){}
    };

    Elem *head, *tail;
public:
    List() : head(0), tail(0) {}
    80001724:	00003797          	auipc	a5,0x3
    80001728:	fa478793          	addi	a5,a5,-92 # 800046c8 <_ZN9Scheduler19readyCoroutineQueueE>
    8000172c:	0007b023          	sd	zero,0(a5)
    80001730:	0007b423          	sd	zero,8(a5)
    80001734:	fd9ff06f          	j	8000170c <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001738 <_ZN9Scheduler3getEv>:
_thread *Scheduler::get() {
    80001738:	fe010113          	addi	sp,sp,-32
    8000173c:	00113c23          	sd	ra,24(sp)
    80001740:	00813823          	sd	s0,16(sp)
    80001744:	00913423          	sd	s1,8(sp)
    80001748:	02010413          	addi	s0,sp,32
        }else{
            head = tail = elem;
        }
    }
    T *removeFirst(){
        if(!head){ return 0; }
    8000174c:	00003517          	auipc	a0,0x3
    80001750:	f7c53503          	ld	a0,-132(a0) # 800046c8 <_ZN9Scheduler19readyCoroutineQueueE>
    80001754:	04050263          	beqz	a0,80001798 <_ZN9Scheduler3getEv+0x60>

        Elem *elem = head;
        head = head->next;
    80001758:	00853783          	ld	a5,8(a0)
    8000175c:	00003717          	auipc	a4,0x3
    80001760:	f6f73623          	sd	a5,-148(a4) # 800046c8 <_ZN9Scheduler19readyCoroutineQueueE>
        if(!head){ tail = 0; }
    80001764:	02078463          	beqz	a5,8000178c <_ZN9Scheduler3getEv+0x54>

        T *ret = elem->data;
    80001768:	00053483          	ld	s1,0(a0)
        delete elem;
    8000176c:	00000097          	auipc	ra,0x0
    80001770:	ea4080e7          	jalr	-348(ra) # 80001610 <_ZdlPv>
}
    80001774:	00048513          	mv	a0,s1
    80001778:	01813083          	ld	ra,24(sp)
    8000177c:	01013403          	ld	s0,16(sp)
    80001780:	00813483          	ld	s1,8(sp)
    80001784:	02010113          	addi	sp,sp,32
    80001788:	00008067          	ret
        if(!head){ tail = 0; }
    8000178c:	00003797          	auipc	a5,0x3
    80001790:	f407b223          	sd	zero,-188(a5) # 800046d0 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001794:	fd5ff06f          	j	80001768 <_ZN9Scheduler3getEv+0x30>
        if(!head){ return 0; }
    80001798:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFirst();
    8000179c:	fd9ff06f          	j	80001774 <_ZN9Scheduler3getEv+0x3c>

00000000800017a0 <_ZN9Scheduler3putEP7_thread>:
void Scheduler::put(_thread *tcb) {
    800017a0:	fe010113          	addi	sp,sp,-32
    800017a4:	00113c23          	sd	ra,24(sp)
    800017a8:	00813823          	sd	s0,16(sp)
    800017ac:	00913423          	sd	s1,8(sp)
    800017b0:	02010413          	addi	s0,sp,32
    800017b4:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    800017b8:	01000513          	li	a0,16
    800017bc:	00000097          	auipc	ra,0x0
    800017c0:	e2c080e7          	jalr	-468(ra) # 800015e8 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next){}
    800017c4:	00953023          	sd	s1,0(a0)
    800017c8:	00053423          	sd	zero,8(a0)
        if(tail){
    800017cc:	00003797          	auipc	a5,0x3
    800017d0:	f047b783          	ld	a5,-252(a5) # 800046d0 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    800017d4:	02078263          	beqz	a5,800017f8 <_ZN9Scheduler3putEP7_thread+0x58>
            tail->next = elem;
    800017d8:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    800017dc:	00003797          	auipc	a5,0x3
    800017e0:	eea7ba23          	sd	a0,-268(a5) # 800046d0 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    800017e4:	01813083          	ld	ra,24(sp)
    800017e8:	01013403          	ld	s0,16(sp)
    800017ec:	00813483          	ld	s1,8(sp)
    800017f0:	02010113          	addi	sp,sp,32
    800017f4:	00008067          	ret
            head = tail = elem;
    800017f8:	00003797          	auipc	a5,0x3
    800017fc:	ed078793          	addi	a5,a5,-304 # 800046c8 <_ZN9Scheduler19readyCoroutineQueueE>
    80001800:	00a7b423          	sd	a0,8(a5)
    80001804:	00a7b023          	sd	a0,0(a5)
    80001808:	fddff06f          	j	800017e4 <_ZN9Scheduler3putEP7_thread+0x44>

000000008000180c <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    8000180c:	ff010113          	addi	sp,sp,-16
    80001810:	00113423          	sd	ra,8(sp)
    80001814:	00813023          	sd	s0,0(sp)
    80001818:	01010413          	addi	s0,sp,16
    8000181c:	000105b7          	lui	a1,0x10
    80001820:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001824:	00100513          	li	a0,1
    80001828:	00000097          	auipc	ra,0x0
    8000182c:	ed0080e7          	jalr	-304(ra) # 800016f8 <_Z41__static_initialization_and_destruction_0ii>
    80001830:	00813083          	ld	ra,8(sp)
    80001834:	00013403          	ld	s0,0(sp)
    80001838:	01010113          	addi	sp,sp,16
    8000183c:	00008067          	ret

0000000080001840 <_ZN15MemoryAllocator10initializeEv>:
#include "../h/MemoryAllocator.hpp"

memblock* MemoryAllocator::freeHead = nullptr;
memblock* MemoryAllocator::allocatedHead = nullptr;

void MemoryAllocator::initialize(){
    80001840:	ff010113          	addi	sp,sp,-16
    80001844:	00813423          	sd	s0,8(sp)
    80001848:	01010413          	addi	s0,sp,16
    freeHead = (memblock*) HEAP_START_ADDR;
    8000184c:	00003797          	auipc	a5,0x3
    80001850:	e047b783          	ld	a5,-508(a5) # 80004650 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001854:	0007b783          	ld	a5,0(a5)
    80001858:	00003717          	auipc	a4,0x3
    8000185c:	e8f73023          	sd	a5,-384(a4) # 800046d8 <_ZN15MemoryAllocator8freeHeadE>
    freeHead->prev = freeHead->next = nullptr;
    80001860:	0007b823          	sd	zero,16(a5)
    80001864:	0007b423          	sd	zero,8(a5)
    freeHead->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR);
    80001868:	00003717          	auipc	a4,0x3
    8000186c:	e0073703          	ld	a4,-512(a4) # 80004668 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001870:	00073703          	ld	a4,0(a4)
    80001874:	40f70733          	sub	a4,a4,a5
    80001878:	00e7b023          	sd	a4,0(a5)
}
    8000187c:	00813403          	ld	s0,8(sp)
    80001880:	01010113          	addi	sp,sp,16
    80001884:	00008067          	ret

0000000080001888 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t allocSize) {
    80001888:	ff010113          	addi	sp,sp,-16
    8000188c:	00813423          	sd	s0,8(sp)
    80001890:	01010413          	addi	s0,sp,16
    memblock* currentBlock = freeHead;
    80001894:	00003617          	auipc	a2,0x3
    80001898:	e4463603          	ld	a2,-444(a2) # 800046d8 <_ZN15MemoryAllocator8freeHeadE>
    int inserted = 0;

    if (allocSize <= MEM_BLOCK_SIZE){
    8000189c:	04000793          	li	a5,64
    800018a0:	02a7f663          	bgeu	a5,a0,800018cc <_ZN15MemoryAllocator9mem_allocEm+0x44>
        allocSize = MEM_BLOCK_SIZE;
    } else {
        allocSize = (allocSize / MEM_BLOCK_SIZE + 1) * MEM_BLOCK_SIZE;
    800018a4:	00655693          	srli	a3,a0,0x6
    800018a8:	00168693          	addi	a3,a3,1
    800018ac:	00669693          	slli	a3,a3,0x6
        allocSize = MEM_BLOCK_SIZE;
    800018b0:	00060513          	mv	a0,a2
    }

    while (currentBlock) {
    800018b4:	06050a63          	beqz	a0,80001928 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
        if (currentBlock->size >= allocSize + sizeof(memblock)) {
    800018b8:	00053703          	ld	a4,0(a0)
    800018bc:	01868793          	addi	a5,a3,24
    800018c0:	00f77a63          	bgeu	a4,a5,800018d4 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
                    freeHead = currentBlock->next;
                }
                break;
            }
        }
        currentBlock = currentBlock->next;
    800018c4:	01053503          	ld	a0,16(a0)
    while (currentBlock) {
    800018c8:	fedff06f          	j	800018b4 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
        allocSize = MEM_BLOCK_SIZE;
    800018cc:	04000693          	li	a3,64
    800018d0:	fe1ff06f          	j	800018b0 <_ZN15MemoryAllocator9mem_allocEm+0x28>
            if(currentBlock->size > allocSize + sizeof(memblock)) {
    800018d4:	08e7fa63          	bgeu	a5,a4,80001968 <_ZN15MemoryAllocator9mem_allocEm+0xe0>
                memblock *blockRemainder = (memblock *) ((char *) currentBlock + sizeof(memblock) + allocSize);
    800018d8:	00f507b3          	add	a5,a0,a5
                blockRemainder->prev = blockRemainder->next = nullptr;
    800018dc:	0007b823          	sd	zero,16(a5)
    800018e0:	0007b423          	sd	zero,8(a5)
                blockRemainder->size = currentBlock->size - allocSize - sizeof (memblock);
    800018e4:	00053703          	ld	a4,0(a0)
    800018e8:	40d706b3          	sub	a3,a4,a3
    800018ec:	fe868693          	addi	a3,a3,-24
    800018f0:	00d7b023          	sd	a3,0(a5)
                if(currentBlock->prev){
    800018f4:	00853703          	ld	a4,8(a0)
    800018f8:	00070863          	beqz	a4,80001908 <_ZN15MemoryAllocator9mem_allocEm+0x80>
                    currentBlock->prev->next = blockRemainder;
    800018fc:	00f73823          	sd	a5,16(a4)
                    blockRemainder->prev = currentBlock->prev;
    80001900:	00853703          	ld	a4,8(a0)
    80001904:	00e7b423          	sd	a4,8(a5)
                if(currentBlock->next){
    80001908:	01053703          	ld	a4,16(a0)
    8000190c:	00070863          	beqz	a4,8000191c <_ZN15MemoryAllocator9mem_allocEm+0x94>
                    currentBlock->next->prev = blockRemainder;
    80001910:	00f73423          	sd	a5,8(a4)
                    blockRemainder->next = currentBlock->next;
    80001914:	01053703          	ld	a4,16(a0)
    80001918:	00e7b823          	sd	a4,16(a5)
                if(currentBlock == freeHead) {
    8000191c:	00003717          	auipc	a4,0x3
    80001920:	dbc73703          	ld	a4,-580(a4) # 800046d8 <_ZN15MemoryAllocator8freeHeadE>
    80001924:	02a70c63          	beq	a4,a0,8000195c <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    }
    memblock* currentAllocatedBlock = nullptr;
    if(currentBlock != nullptr) {
    80001928:	02050463          	beqz	a0,80001950 <_ZN15MemoryAllocator9mem_allocEm+0xc8>
        if (allocatedHead == nullptr) {
    8000192c:	00003797          	auipc	a5,0x3
    80001930:	db47b783          	ld	a5,-588(a5) # 800046e0 <_ZN15MemoryAllocator13allocatedHeadE>
    80001934:	06078463          	beqz	a5,8000199c <_ZN15MemoryAllocator9mem_allocEm+0x114>
            allocatedHead = currentBlock;
            allocatedHead->next = allocatedHead->prev = nullptr;
        } else if (currentBlock < allocatedHead) {
    80001938:	06f57c63          	bgeu	a0,a5,800019b0 <_ZN15MemoryAllocator9mem_allocEm+0x128>

            currentBlock->next = allocatedHead;
    8000193c:	00f53823          	sd	a5,16(a0)
            currentBlock->prev = nullptr;
    80001940:	00053423          	sd	zero,8(a0)
            allocatedHead = currentBlock;
    80001944:	00003797          	auipc	a5,0x3
    80001948:	d8a7be23          	sd	a0,-612(a5) # 800046e0 <_ZN15MemoryAllocator13allocatedHeadE>
                currentAllocatedBlock->next = currentBlock;
            }
        }


        if ((void *) ((char *) currentBlock + sizeof(memblock)) != nullptr) {
    8000194c:	01850513          	addi	a0,a0,24
    // svakom bloku nadji mesto
    // 1. scenario blok je na pocetku
    // 2. scenario blok je u sredini
    // 3. scenario blok je na kraju

}
    80001950:	00813403          	ld	s0,8(sp)
    80001954:	01010113          	addi	sp,sp,16
    80001958:	00008067          	ret
                    freeHead = blockRemainder;
    8000195c:	00003717          	auipc	a4,0x3
    80001960:	d6f73e23          	sd	a5,-644(a4) # 800046d8 <_ZN15MemoryAllocator8freeHeadE>
    80001964:	fc5ff06f          	j	80001928 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
                if(currentBlock->prev){
    80001968:	00853783          	ld	a5,8(a0)
    8000196c:	00078663          	beqz	a5,80001978 <_ZN15MemoryAllocator9mem_allocEm+0xf0>
                    currentBlock->prev->next = currentBlock->next;
    80001970:	01053703          	ld	a4,16(a0)
    80001974:	00e7b823          	sd	a4,16(a5)
                if(currentBlock->next){
    80001978:	01053783          	ld	a5,16(a0)
    8000197c:	00078663          	beqz	a5,80001988 <_ZN15MemoryAllocator9mem_allocEm+0x100>
                    currentBlock->next->prev = currentBlock->prev;
    80001980:	00853703          	ld	a4,8(a0)
    80001984:	00e7b423          	sd	a4,8(a5)
                if(currentBlock == freeHead){
    80001988:	fac510e3          	bne	a0,a2,80001928 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
                    freeHead = currentBlock->next;
    8000198c:	01053783          	ld	a5,16(a0)
    80001990:	00003717          	auipc	a4,0x3
    80001994:	d4f73423          	sd	a5,-696(a4) # 800046d8 <_ZN15MemoryAllocator8freeHeadE>
    80001998:	f91ff06f          	j	80001928 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
            allocatedHead = currentBlock;
    8000199c:	00003797          	auipc	a5,0x3
    800019a0:	d4a7b223          	sd	a0,-700(a5) # 800046e0 <_ZN15MemoryAllocator13allocatedHeadE>
            allocatedHead->next = allocatedHead->prev = nullptr;
    800019a4:	00053423          	sd	zero,8(a0)
    800019a8:	00053823          	sd	zero,16(a0)
    800019ac:	fa1ff06f          	j	8000194c <_ZN15MemoryAllocator9mem_allocEm+0xc4>
            while (currentAllocatedBlock->next) {
    800019b0:	00078713          	mv	a4,a5
    800019b4:	0107b783          	ld	a5,16(a5)
    800019b8:	02078063          	beqz	a5,800019d8 <_ZN15MemoryAllocator9mem_allocEm+0x150>
                if (currentBlock < currentAllocatedBlock) {
    800019bc:	fee57ae3          	bgeu	a0,a4,800019b0 <_ZN15MemoryAllocator9mem_allocEm+0x128>
                    currentBlock->next = currentAllocatedBlock;
    800019c0:	00e53823          	sd	a4,16(a0)
                    currentBlock->prev = currentAllocatedBlock->prev;
    800019c4:	00873783          	ld	a5,8(a4)
    800019c8:	00f53423          	sd	a5,8(a0)
                    currentAllocatedBlock->prev->next = currentBlock;
    800019cc:	00a7b823          	sd	a0,16(a5)
                    currentAllocatedBlock->prev = currentBlock;
    800019d0:	00a73423          	sd	a0,8(a4)
            if (inserted == 0) {
    800019d4:	f79ff06f          	j	8000194c <_ZN15MemoryAllocator9mem_allocEm+0xc4>
                currentBlock->prev = currentAllocatedBlock;
    800019d8:	00e53423          	sd	a4,8(a0)
                currentBlock->next = nullptr;
    800019dc:	00053823          	sd	zero,16(a0)
                currentAllocatedBlock->next = currentBlock;
    800019e0:	00a73823          	sd	a0,16(a4)
    800019e4:	f69ff06f          	j	8000194c <_ZN15MemoryAllocator9mem_allocEm+0xc4>

00000000800019e8 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void* ptr) {
    800019e8:	ff010113          	addi	sp,sp,-16
    800019ec:	00813423          	sd	s0,8(sp)
    800019f0:	01010413          	addi	s0,sp,16
    //dolazi mi pokazivac na adresu pocetka bloka, treba da izvucem taj blok iz liste
    //pa onda da prevezem prev i next ako ima
    if (ptr == nullptr){
    800019f4:	14050e63          	beqz	a0,80001b50 <_ZN15MemoryAllocator8mem_freeEPv+0x168>
        return -1;
    }

    memblock* currentBlock = (memblock *) ((char *) (ptr) - sizeof(memblock));
    800019f8:	fe850613          	addi	a2,a0,-24

    if (allocatedHead == nullptr){
    800019fc:	00003797          	auipc	a5,0x3
    80001a00:	ce47b783          	ld	a5,-796(a5) # 800046e0 <_ZN15MemoryAllocator13allocatedHeadE>
    80001a04:	14078a63          	beqz	a5,80001b58 <_ZN15MemoryAllocator8mem_freeEPv+0x170>
        return -1;
    }

    if(allocatedHead == currentBlock){
    80001a08:	0ac78063          	beq	a5,a2,80001aa8 <_ZN15MemoryAllocator8mem_freeEPv+0xc0>
        allocatedHead = currentBlock->next;
    }
    if(currentBlock->prev){
    80001a0c:	ff053783          	ld	a5,-16(a0)
    80001a10:	00078663          	beqz	a5,80001a1c <_ZN15MemoryAllocator8mem_freeEPv+0x34>
        currentBlock->prev->next = currentBlock->next;
    80001a14:	ff853703          	ld	a4,-8(a0)
    80001a18:	00e7b823          	sd	a4,16(a5)
    }
    if(currentBlock->next){
    80001a1c:	ff853783          	ld	a5,-8(a0)
    80001a20:	00078663          	beqz	a5,80001a2c <_ZN15MemoryAllocator8mem_freeEPv+0x44>
        currentBlock->next->prev = currentBlock->prev;
    80001a24:	ff053703          	ld	a4,-16(a0)
    80001a28:	00e7b423          	sd	a4,8(a5)
    //ubaci blok u niz free
    //probaj na pocetak
    //probaj u sredinu
    //probaj na kraj

    if(freeHead == nullptr){
    80001a2c:	00003797          	auipc	a5,0x3
    80001a30:	cac7b783          	ld	a5,-852(a5) # 800046d8 <_ZN15MemoryAllocator8freeHeadE>
    80001a34:	08078263          	beqz	a5,80001ab8 <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
        freeHead->next = freeHead->prev = nullptr;
        freeHead = currentBlock;
    } else
    if(currentBlock < freeHead){
    80001a38:	08f67a63          	bgeu	a2,a5,80001acc <_ZN15MemoryAllocator8mem_freeEPv+0xe4>
        freeHead->prev = currentBlock;
    80001a3c:	00c7b423          	sd	a2,8(a5)
        currentBlock->next = freeHead;
    80001a40:	fef53c23          	sd	a5,-8(a0)
        freeHead = currentBlock;
    80001a44:	00003797          	auipc	a5,0x3
    80001a48:	c8c7ba23          	sd	a2,-876(a5) # 800046d8 <_ZN15MemoryAllocator8freeHeadE>
        freeHead->prev = nullptr;
    80001a4c:	00063423          	sd	zero,8(a2)
        }
    }

    // probaj da spojis oslobodjeni blok sa delovima oko sebe da ne bi doslo do fragmentacije

    if(currentBlock->prev){
    80001a50:	ff053703          	ld	a4,-16(a0)
    80001a54:	02070063          	beqz	a4,80001a74 <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
        memblock* curr = currentBlock->prev;
        if((char*)(curr + curr->size + sizeof(memblock)) == (char*)currentBlock){
    80001a58:	00073683          	ld	a3,0(a4)
    80001a5c:	00169793          	slli	a5,a3,0x1
    80001a60:	00d787b3          	add	a5,a5,a3
    80001a64:	00379793          	slli	a5,a5,0x3
    80001a68:	24078793          	addi	a5,a5,576
    80001a6c:	00f707b3          	add	a5,a4,a5
    80001a70:	08c78c63          	beq	a5,a2,80001b08 <_ZN15MemoryAllocator8mem_freeEPv+0x120>
                currentBlock->next->prev = curr;
            }
        }
    }

    if (currentBlock->next){
    80001a74:	ff853703          	ld	a4,-8(a0)
    80001a78:	0e070463          	beqz	a4,80001b60 <_ZN15MemoryAllocator8mem_freeEPv+0x178>
        memblock* curr = currentBlock->next;
        if((char*)(currentBlock + currentBlock->size + sizeof(memblock)) == (char*)curr){
    80001a7c:	fe853683          	ld	a3,-24(a0)
    80001a80:	00169793          	slli	a5,a3,0x1
    80001a84:	00d787b3          	add	a5,a5,a3
    80001a88:	00379793          	slli	a5,a5,0x3
    80001a8c:	24078793          	addi	a5,a5,576
    80001a90:	00f607b3          	add	a5,a2,a5
    80001a94:	08f70a63          	beq	a4,a5,80001b28 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
                currentBlock->next = curr->next;
            }
        }
    }

    return 0;
    80001a98:	00000513          	li	a0,0

}
    80001a9c:	00813403          	ld	s0,8(sp)
    80001aa0:	01010113          	addi	sp,sp,16
    80001aa4:	00008067          	ret
        allocatedHead = currentBlock->next;
    80001aa8:	ff853783          	ld	a5,-8(a0)
    80001aac:	00003717          	auipc	a4,0x3
    80001ab0:	c2f73a23          	sd	a5,-972(a4) # 800046e0 <_ZN15MemoryAllocator13allocatedHeadE>
    80001ab4:	f59ff06f          	j	80001a0c <_ZN15MemoryAllocator8mem_freeEPv+0x24>
        freeHead->next = freeHead->prev = nullptr;
    80001ab8:	0007b423          	sd	zero,8(a5)
    80001abc:	0007b823          	sd	zero,16(a5)
        freeHead = currentBlock;
    80001ac0:	00003797          	auipc	a5,0x3
    80001ac4:	c0c7bc23          	sd	a2,-1000(a5) # 800046d8 <_ZN15MemoryAllocator8freeHeadE>
    80001ac8:	f89ff06f          	j	80001a50 <_ZN15MemoryAllocator8mem_freeEPv+0x68>
        while (curr->next && curr->next < currentBlock){
    80001acc:	00078713          	mv	a4,a5
    80001ad0:	0107b783          	ld	a5,16(a5)
    80001ad4:	00078463          	beqz	a5,80001adc <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
    80001ad8:	fec7eae3          	bltu	a5,a2,80001acc <_ZN15MemoryAllocator8mem_freeEPv+0xe4>
        if(curr->next == nullptr){
    80001adc:	02078063          	beqz	a5,80001afc <_ZN15MemoryAllocator8mem_freeEPv+0x114>
            currentBlock->prev = curr;
    80001ae0:	fee53823          	sd	a4,-16(a0)
            curr->next->prev = currentBlock;
    80001ae4:	01073783          	ld	a5,16(a4)
    80001ae8:	00c7b423          	sd	a2,8(a5)
            currentBlock->next = curr->next;
    80001aec:	01073783          	ld	a5,16(a4)
    80001af0:	fef53c23          	sd	a5,-8(a0)
            curr->next = currentBlock;
    80001af4:	00c73823          	sd	a2,16(a4)
    80001af8:	f59ff06f          	j	80001a50 <_ZN15MemoryAllocator8mem_freeEPv+0x68>
            curr->next = currentBlock;
    80001afc:	00c73823          	sd	a2,16(a4)
            currentBlock->prev = curr;
    80001b00:	fee53823          	sd	a4,-16(a0)
    80001b04:	f4dff06f          	j	80001a50 <_ZN15MemoryAllocator8mem_freeEPv+0x68>
            curr->size = curr->size + currentBlock->size;
    80001b08:	fe853783          	ld	a5,-24(a0)
    80001b0c:	00f686b3          	add	a3,a3,a5
    80001b10:	00d73023          	sd	a3,0(a4)
            if(currentBlock->next) {
    80001b14:	ff853783          	ld	a5,-8(a0)
    80001b18:	f4078ee3          	beqz	a5,80001a74 <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
                curr->next = currentBlock->next;
    80001b1c:	00f73823          	sd	a5,16(a4)
                currentBlock->next->prev = curr;
    80001b20:	00e7b423          	sd	a4,8(a5)
    80001b24:	f51ff06f          	j	80001a74 <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
            currentBlock->size = currentBlock->size + curr ->size;
    80001b28:	00073783          	ld	a5,0(a4)
    80001b2c:	00f686b3          	add	a3,a3,a5
    80001b30:	fed53423          	sd	a3,-24(a0)
            if(curr->next) {
    80001b34:	01073783          	ld	a5,16(a4)
    80001b38:	02078863          	beqz	a5,80001b68 <_ZN15MemoryAllocator8mem_freeEPv+0x180>
                curr->next->prev = currentBlock;
    80001b3c:	00c7b423          	sd	a2,8(a5)
                currentBlock->next = curr->next;
    80001b40:	01073783          	ld	a5,16(a4)
    80001b44:	fef53c23          	sd	a5,-8(a0)
    return 0;
    80001b48:	00000513          	li	a0,0
    80001b4c:	f51ff06f          	j	80001a9c <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
        return -1;
    80001b50:	fff00513          	li	a0,-1
    80001b54:	f49ff06f          	j	80001a9c <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
        return -1;
    80001b58:	fff00513          	li	a0,-1
    80001b5c:	f41ff06f          	j	80001a9c <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
    return 0;
    80001b60:	00000513          	li	a0,0
    80001b64:	f39ff06f          	j	80001a9c <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
    80001b68:	00000513          	li	a0,0
    80001b6c:	f31ff06f          	j	80001a9c <_ZN15MemoryAllocator8mem_freeEPv+0xb4>

0000000080001b70 <start>:
    80001b70:	ff010113          	addi	sp,sp,-16
    80001b74:	00813423          	sd	s0,8(sp)
    80001b78:	01010413          	addi	s0,sp,16
    80001b7c:	300027f3          	csrr	a5,mstatus
    80001b80:	ffffe737          	lui	a4,0xffffe
    80001b84:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff8ebf>
    80001b88:	00e7f7b3          	and	a5,a5,a4
    80001b8c:	00001737          	lui	a4,0x1
    80001b90:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001b94:	00e7e7b3          	or	a5,a5,a4
    80001b98:	30079073          	csrw	mstatus,a5
    80001b9c:	00000797          	auipc	a5,0x0
    80001ba0:	16078793          	addi	a5,a5,352 # 80001cfc <system_main>
    80001ba4:	34179073          	csrw	mepc,a5
    80001ba8:	00000793          	li	a5,0
    80001bac:	18079073          	csrw	satp,a5
    80001bb0:	000107b7          	lui	a5,0x10
    80001bb4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001bb8:	30279073          	csrw	medeleg,a5
    80001bbc:	30379073          	csrw	mideleg,a5
    80001bc0:	104027f3          	csrr	a5,sie
    80001bc4:	2227e793          	ori	a5,a5,546
    80001bc8:	10479073          	csrw	sie,a5
    80001bcc:	fff00793          	li	a5,-1
    80001bd0:	00a7d793          	srli	a5,a5,0xa
    80001bd4:	3b079073          	csrw	pmpaddr0,a5
    80001bd8:	00f00793          	li	a5,15
    80001bdc:	3a079073          	csrw	pmpcfg0,a5
    80001be0:	f14027f3          	csrr	a5,mhartid
    80001be4:	0200c737          	lui	a4,0x200c
    80001be8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001bec:	0007869b          	sext.w	a3,a5
    80001bf0:	00269713          	slli	a4,a3,0x2
    80001bf4:	000f4637          	lui	a2,0xf4
    80001bf8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001bfc:	00d70733          	add	a4,a4,a3
    80001c00:	0037979b          	slliw	a5,a5,0x3
    80001c04:	020046b7          	lui	a3,0x2004
    80001c08:	00d787b3          	add	a5,a5,a3
    80001c0c:	00c585b3          	add	a1,a1,a2
    80001c10:	00371693          	slli	a3,a4,0x3
    80001c14:	00003717          	auipc	a4,0x3
    80001c18:	adc70713          	addi	a4,a4,-1316 # 800046f0 <timer_scratch>
    80001c1c:	00b7b023          	sd	a1,0(a5)
    80001c20:	00d70733          	add	a4,a4,a3
    80001c24:	00f73c23          	sd	a5,24(a4)
    80001c28:	02c73023          	sd	a2,32(a4)
    80001c2c:	34071073          	csrw	mscratch,a4
    80001c30:	00000797          	auipc	a5,0x0
    80001c34:	6e078793          	addi	a5,a5,1760 # 80002310 <timervec>
    80001c38:	30579073          	csrw	mtvec,a5
    80001c3c:	300027f3          	csrr	a5,mstatus
    80001c40:	0087e793          	ori	a5,a5,8
    80001c44:	30079073          	csrw	mstatus,a5
    80001c48:	304027f3          	csrr	a5,mie
    80001c4c:	0807e793          	ori	a5,a5,128
    80001c50:	30479073          	csrw	mie,a5
    80001c54:	f14027f3          	csrr	a5,mhartid
    80001c58:	0007879b          	sext.w	a5,a5
    80001c5c:	00078213          	mv	tp,a5
    80001c60:	30200073          	mret
    80001c64:	00813403          	ld	s0,8(sp)
    80001c68:	01010113          	addi	sp,sp,16
    80001c6c:	00008067          	ret

0000000080001c70 <timerinit>:
    80001c70:	ff010113          	addi	sp,sp,-16
    80001c74:	00813423          	sd	s0,8(sp)
    80001c78:	01010413          	addi	s0,sp,16
    80001c7c:	f14027f3          	csrr	a5,mhartid
    80001c80:	0200c737          	lui	a4,0x200c
    80001c84:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001c88:	0007869b          	sext.w	a3,a5
    80001c8c:	00269713          	slli	a4,a3,0x2
    80001c90:	000f4637          	lui	a2,0xf4
    80001c94:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001c98:	00d70733          	add	a4,a4,a3
    80001c9c:	0037979b          	slliw	a5,a5,0x3
    80001ca0:	020046b7          	lui	a3,0x2004
    80001ca4:	00d787b3          	add	a5,a5,a3
    80001ca8:	00c585b3          	add	a1,a1,a2
    80001cac:	00371693          	slli	a3,a4,0x3
    80001cb0:	00003717          	auipc	a4,0x3
    80001cb4:	a4070713          	addi	a4,a4,-1472 # 800046f0 <timer_scratch>
    80001cb8:	00b7b023          	sd	a1,0(a5)
    80001cbc:	00d70733          	add	a4,a4,a3
    80001cc0:	00f73c23          	sd	a5,24(a4)
    80001cc4:	02c73023          	sd	a2,32(a4)
    80001cc8:	34071073          	csrw	mscratch,a4
    80001ccc:	00000797          	auipc	a5,0x0
    80001cd0:	64478793          	addi	a5,a5,1604 # 80002310 <timervec>
    80001cd4:	30579073          	csrw	mtvec,a5
    80001cd8:	300027f3          	csrr	a5,mstatus
    80001cdc:	0087e793          	ori	a5,a5,8
    80001ce0:	30079073          	csrw	mstatus,a5
    80001ce4:	304027f3          	csrr	a5,mie
    80001ce8:	0807e793          	ori	a5,a5,128
    80001cec:	30479073          	csrw	mie,a5
    80001cf0:	00813403          	ld	s0,8(sp)
    80001cf4:	01010113          	addi	sp,sp,16
    80001cf8:	00008067          	ret

0000000080001cfc <system_main>:
    80001cfc:	fe010113          	addi	sp,sp,-32
    80001d00:	00813823          	sd	s0,16(sp)
    80001d04:	00913423          	sd	s1,8(sp)
    80001d08:	00113c23          	sd	ra,24(sp)
    80001d0c:	02010413          	addi	s0,sp,32
    80001d10:	00000097          	auipc	ra,0x0
    80001d14:	0c4080e7          	jalr	196(ra) # 80001dd4 <cpuid>
    80001d18:	00003497          	auipc	s1,0x3
    80001d1c:	97848493          	addi	s1,s1,-1672 # 80004690 <started>
    80001d20:	02050263          	beqz	a0,80001d44 <system_main+0x48>
    80001d24:	0004a783          	lw	a5,0(s1)
    80001d28:	0007879b          	sext.w	a5,a5
    80001d2c:	fe078ce3          	beqz	a5,80001d24 <system_main+0x28>
    80001d30:	0ff0000f          	fence
    80001d34:	00002517          	auipc	a0,0x2
    80001d38:	31c50513          	addi	a0,a0,796 # 80004050 <CONSOLE_STATUS+0x40>
    80001d3c:	00001097          	auipc	ra,0x1
    80001d40:	a70080e7          	jalr	-1424(ra) # 800027ac <panic>
    80001d44:	00001097          	auipc	ra,0x1
    80001d48:	9c4080e7          	jalr	-1596(ra) # 80002708 <consoleinit>
    80001d4c:	00001097          	auipc	ra,0x1
    80001d50:	150080e7          	jalr	336(ra) # 80002e9c <printfinit>
    80001d54:	00002517          	auipc	a0,0x2
    80001d58:	3dc50513          	addi	a0,a0,988 # 80004130 <CONSOLE_STATUS+0x120>
    80001d5c:	00001097          	auipc	ra,0x1
    80001d60:	aac080e7          	jalr	-1364(ra) # 80002808 <__printf>
    80001d64:	00002517          	auipc	a0,0x2
    80001d68:	2bc50513          	addi	a0,a0,700 # 80004020 <CONSOLE_STATUS+0x10>
    80001d6c:	00001097          	auipc	ra,0x1
    80001d70:	a9c080e7          	jalr	-1380(ra) # 80002808 <__printf>
    80001d74:	00002517          	auipc	a0,0x2
    80001d78:	3bc50513          	addi	a0,a0,956 # 80004130 <CONSOLE_STATUS+0x120>
    80001d7c:	00001097          	auipc	ra,0x1
    80001d80:	a8c080e7          	jalr	-1396(ra) # 80002808 <__printf>
    80001d84:	00001097          	auipc	ra,0x1
    80001d88:	4a4080e7          	jalr	1188(ra) # 80003228 <kinit>
    80001d8c:	00000097          	auipc	ra,0x0
    80001d90:	148080e7          	jalr	328(ra) # 80001ed4 <trapinit>
    80001d94:	00000097          	auipc	ra,0x0
    80001d98:	16c080e7          	jalr	364(ra) # 80001f00 <trapinithart>
    80001d9c:	00000097          	auipc	ra,0x0
    80001da0:	5b4080e7          	jalr	1460(ra) # 80002350 <plicinit>
    80001da4:	00000097          	auipc	ra,0x0
    80001da8:	5d4080e7          	jalr	1492(ra) # 80002378 <plicinithart>
    80001dac:	00000097          	auipc	ra,0x0
    80001db0:	078080e7          	jalr	120(ra) # 80001e24 <userinit>
    80001db4:	0ff0000f          	fence
    80001db8:	00100793          	li	a5,1
    80001dbc:	00002517          	auipc	a0,0x2
    80001dc0:	27c50513          	addi	a0,a0,636 # 80004038 <CONSOLE_STATUS+0x28>
    80001dc4:	00f4a023          	sw	a5,0(s1)
    80001dc8:	00001097          	auipc	ra,0x1
    80001dcc:	a40080e7          	jalr	-1472(ra) # 80002808 <__printf>
    80001dd0:	0000006f          	j	80001dd0 <system_main+0xd4>

0000000080001dd4 <cpuid>:
    80001dd4:	ff010113          	addi	sp,sp,-16
    80001dd8:	00813423          	sd	s0,8(sp)
    80001ddc:	01010413          	addi	s0,sp,16
    80001de0:	00020513          	mv	a0,tp
    80001de4:	00813403          	ld	s0,8(sp)
    80001de8:	0005051b          	sext.w	a0,a0
    80001dec:	01010113          	addi	sp,sp,16
    80001df0:	00008067          	ret

0000000080001df4 <mycpu>:
    80001df4:	ff010113          	addi	sp,sp,-16
    80001df8:	00813423          	sd	s0,8(sp)
    80001dfc:	01010413          	addi	s0,sp,16
    80001e00:	00020793          	mv	a5,tp
    80001e04:	00813403          	ld	s0,8(sp)
    80001e08:	0007879b          	sext.w	a5,a5
    80001e0c:	00779793          	slli	a5,a5,0x7
    80001e10:	00004517          	auipc	a0,0x4
    80001e14:	91050513          	addi	a0,a0,-1776 # 80005720 <cpus>
    80001e18:	00f50533          	add	a0,a0,a5
    80001e1c:	01010113          	addi	sp,sp,16
    80001e20:	00008067          	ret

0000000080001e24 <userinit>:
    80001e24:	ff010113          	addi	sp,sp,-16
    80001e28:	00813423          	sd	s0,8(sp)
    80001e2c:	01010413          	addi	s0,sp,16
    80001e30:	00813403          	ld	s0,8(sp)
    80001e34:	01010113          	addi	sp,sp,16
    80001e38:	fffff317          	auipc	t1,0xfffff
    80001e3c:	72c30067          	jr	1836(t1) # 80001564 <main>

0000000080001e40 <either_copyout>:
    80001e40:	ff010113          	addi	sp,sp,-16
    80001e44:	00813023          	sd	s0,0(sp)
    80001e48:	00113423          	sd	ra,8(sp)
    80001e4c:	01010413          	addi	s0,sp,16
    80001e50:	02051663          	bnez	a0,80001e7c <either_copyout+0x3c>
    80001e54:	00058513          	mv	a0,a1
    80001e58:	00060593          	mv	a1,a2
    80001e5c:	0006861b          	sext.w	a2,a3
    80001e60:	00002097          	auipc	ra,0x2
    80001e64:	c54080e7          	jalr	-940(ra) # 80003ab4 <__memmove>
    80001e68:	00813083          	ld	ra,8(sp)
    80001e6c:	00013403          	ld	s0,0(sp)
    80001e70:	00000513          	li	a0,0
    80001e74:	01010113          	addi	sp,sp,16
    80001e78:	00008067          	ret
    80001e7c:	00002517          	auipc	a0,0x2
    80001e80:	1fc50513          	addi	a0,a0,508 # 80004078 <CONSOLE_STATUS+0x68>
    80001e84:	00001097          	auipc	ra,0x1
    80001e88:	928080e7          	jalr	-1752(ra) # 800027ac <panic>

0000000080001e8c <either_copyin>:
    80001e8c:	ff010113          	addi	sp,sp,-16
    80001e90:	00813023          	sd	s0,0(sp)
    80001e94:	00113423          	sd	ra,8(sp)
    80001e98:	01010413          	addi	s0,sp,16
    80001e9c:	02059463          	bnez	a1,80001ec4 <either_copyin+0x38>
    80001ea0:	00060593          	mv	a1,a2
    80001ea4:	0006861b          	sext.w	a2,a3
    80001ea8:	00002097          	auipc	ra,0x2
    80001eac:	c0c080e7          	jalr	-1012(ra) # 80003ab4 <__memmove>
    80001eb0:	00813083          	ld	ra,8(sp)
    80001eb4:	00013403          	ld	s0,0(sp)
    80001eb8:	00000513          	li	a0,0
    80001ebc:	01010113          	addi	sp,sp,16
    80001ec0:	00008067          	ret
    80001ec4:	00002517          	auipc	a0,0x2
    80001ec8:	1dc50513          	addi	a0,a0,476 # 800040a0 <CONSOLE_STATUS+0x90>
    80001ecc:	00001097          	auipc	ra,0x1
    80001ed0:	8e0080e7          	jalr	-1824(ra) # 800027ac <panic>

0000000080001ed4 <trapinit>:
    80001ed4:	ff010113          	addi	sp,sp,-16
    80001ed8:	00813423          	sd	s0,8(sp)
    80001edc:	01010413          	addi	s0,sp,16
    80001ee0:	00813403          	ld	s0,8(sp)
    80001ee4:	00002597          	auipc	a1,0x2
    80001ee8:	1e458593          	addi	a1,a1,484 # 800040c8 <CONSOLE_STATUS+0xb8>
    80001eec:	00004517          	auipc	a0,0x4
    80001ef0:	8b450513          	addi	a0,a0,-1868 # 800057a0 <tickslock>
    80001ef4:	01010113          	addi	sp,sp,16
    80001ef8:	00001317          	auipc	t1,0x1
    80001efc:	5c030067          	jr	1472(t1) # 800034b8 <initlock>

0000000080001f00 <trapinithart>:
    80001f00:	ff010113          	addi	sp,sp,-16
    80001f04:	00813423          	sd	s0,8(sp)
    80001f08:	01010413          	addi	s0,sp,16
    80001f0c:	00000797          	auipc	a5,0x0
    80001f10:	2f478793          	addi	a5,a5,756 # 80002200 <kernelvec>
    80001f14:	10579073          	csrw	stvec,a5
    80001f18:	00813403          	ld	s0,8(sp)
    80001f1c:	01010113          	addi	sp,sp,16
    80001f20:	00008067          	ret

0000000080001f24 <usertrap>:
    80001f24:	ff010113          	addi	sp,sp,-16
    80001f28:	00813423          	sd	s0,8(sp)
    80001f2c:	01010413          	addi	s0,sp,16
    80001f30:	00813403          	ld	s0,8(sp)
    80001f34:	01010113          	addi	sp,sp,16
    80001f38:	00008067          	ret

0000000080001f3c <usertrapret>:
    80001f3c:	ff010113          	addi	sp,sp,-16
    80001f40:	00813423          	sd	s0,8(sp)
    80001f44:	01010413          	addi	s0,sp,16
    80001f48:	00813403          	ld	s0,8(sp)
    80001f4c:	01010113          	addi	sp,sp,16
    80001f50:	00008067          	ret

0000000080001f54 <kerneltrap>:
    80001f54:	fe010113          	addi	sp,sp,-32
    80001f58:	00813823          	sd	s0,16(sp)
    80001f5c:	00113c23          	sd	ra,24(sp)
    80001f60:	00913423          	sd	s1,8(sp)
    80001f64:	02010413          	addi	s0,sp,32
    80001f68:	142025f3          	csrr	a1,scause
    80001f6c:	100027f3          	csrr	a5,sstatus
    80001f70:	0027f793          	andi	a5,a5,2
    80001f74:	10079c63          	bnez	a5,8000208c <kerneltrap+0x138>
    80001f78:	142027f3          	csrr	a5,scause
    80001f7c:	0207ce63          	bltz	a5,80001fb8 <kerneltrap+0x64>
    80001f80:	00002517          	auipc	a0,0x2
    80001f84:	19050513          	addi	a0,a0,400 # 80004110 <CONSOLE_STATUS+0x100>
    80001f88:	00001097          	auipc	ra,0x1
    80001f8c:	880080e7          	jalr	-1920(ra) # 80002808 <__printf>
    80001f90:	141025f3          	csrr	a1,sepc
    80001f94:	14302673          	csrr	a2,stval
    80001f98:	00002517          	auipc	a0,0x2
    80001f9c:	18850513          	addi	a0,a0,392 # 80004120 <CONSOLE_STATUS+0x110>
    80001fa0:	00001097          	auipc	ra,0x1
    80001fa4:	868080e7          	jalr	-1944(ra) # 80002808 <__printf>
    80001fa8:	00002517          	auipc	a0,0x2
    80001fac:	19050513          	addi	a0,a0,400 # 80004138 <CONSOLE_STATUS+0x128>
    80001fb0:	00000097          	auipc	ra,0x0
    80001fb4:	7fc080e7          	jalr	2044(ra) # 800027ac <panic>
    80001fb8:	0ff7f713          	andi	a4,a5,255
    80001fbc:	00900693          	li	a3,9
    80001fc0:	04d70063          	beq	a4,a3,80002000 <kerneltrap+0xac>
    80001fc4:	fff00713          	li	a4,-1
    80001fc8:	03f71713          	slli	a4,a4,0x3f
    80001fcc:	00170713          	addi	a4,a4,1
    80001fd0:	fae798e3          	bne	a5,a4,80001f80 <kerneltrap+0x2c>
    80001fd4:	00000097          	auipc	ra,0x0
    80001fd8:	e00080e7          	jalr	-512(ra) # 80001dd4 <cpuid>
    80001fdc:	06050663          	beqz	a0,80002048 <kerneltrap+0xf4>
    80001fe0:	144027f3          	csrr	a5,sip
    80001fe4:	ffd7f793          	andi	a5,a5,-3
    80001fe8:	14479073          	csrw	sip,a5
    80001fec:	01813083          	ld	ra,24(sp)
    80001ff0:	01013403          	ld	s0,16(sp)
    80001ff4:	00813483          	ld	s1,8(sp)
    80001ff8:	02010113          	addi	sp,sp,32
    80001ffc:	00008067          	ret
    80002000:	00000097          	auipc	ra,0x0
    80002004:	3c4080e7          	jalr	964(ra) # 800023c4 <plic_claim>
    80002008:	00a00793          	li	a5,10
    8000200c:	00050493          	mv	s1,a0
    80002010:	06f50863          	beq	a0,a5,80002080 <kerneltrap+0x12c>
    80002014:	fc050ce3          	beqz	a0,80001fec <kerneltrap+0x98>
    80002018:	00050593          	mv	a1,a0
    8000201c:	00002517          	auipc	a0,0x2
    80002020:	0d450513          	addi	a0,a0,212 # 800040f0 <CONSOLE_STATUS+0xe0>
    80002024:	00000097          	auipc	ra,0x0
    80002028:	7e4080e7          	jalr	2020(ra) # 80002808 <__printf>
    8000202c:	01013403          	ld	s0,16(sp)
    80002030:	01813083          	ld	ra,24(sp)
    80002034:	00048513          	mv	a0,s1
    80002038:	00813483          	ld	s1,8(sp)
    8000203c:	02010113          	addi	sp,sp,32
    80002040:	00000317          	auipc	t1,0x0
    80002044:	3bc30067          	jr	956(t1) # 800023fc <plic_complete>
    80002048:	00003517          	auipc	a0,0x3
    8000204c:	75850513          	addi	a0,a0,1880 # 800057a0 <tickslock>
    80002050:	00001097          	auipc	ra,0x1
    80002054:	48c080e7          	jalr	1164(ra) # 800034dc <acquire>
    80002058:	00002717          	auipc	a4,0x2
    8000205c:	63c70713          	addi	a4,a4,1596 # 80004694 <ticks>
    80002060:	00072783          	lw	a5,0(a4)
    80002064:	00003517          	auipc	a0,0x3
    80002068:	73c50513          	addi	a0,a0,1852 # 800057a0 <tickslock>
    8000206c:	0017879b          	addiw	a5,a5,1
    80002070:	00f72023          	sw	a5,0(a4)
    80002074:	00001097          	auipc	ra,0x1
    80002078:	534080e7          	jalr	1332(ra) # 800035a8 <release>
    8000207c:	f65ff06f          	j	80001fe0 <kerneltrap+0x8c>
    80002080:	00001097          	auipc	ra,0x1
    80002084:	090080e7          	jalr	144(ra) # 80003110 <uartintr>
    80002088:	fa5ff06f          	j	8000202c <kerneltrap+0xd8>
    8000208c:	00002517          	auipc	a0,0x2
    80002090:	04450513          	addi	a0,a0,68 # 800040d0 <CONSOLE_STATUS+0xc0>
    80002094:	00000097          	auipc	ra,0x0
    80002098:	718080e7          	jalr	1816(ra) # 800027ac <panic>

000000008000209c <clockintr>:
    8000209c:	fe010113          	addi	sp,sp,-32
    800020a0:	00813823          	sd	s0,16(sp)
    800020a4:	00913423          	sd	s1,8(sp)
    800020a8:	00113c23          	sd	ra,24(sp)
    800020ac:	02010413          	addi	s0,sp,32
    800020b0:	00003497          	auipc	s1,0x3
    800020b4:	6f048493          	addi	s1,s1,1776 # 800057a0 <tickslock>
    800020b8:	00048513          	mv	a0,s1
    800020bc:	00001097          	auipc	ra,0x1
    800020c0:	420080e7          	jalr	1056(ra) # 800034dc <acquire>
    800020c4:	00002717          	auipc	a4,0x2
    800020c8:	5d070713          	addi	a4,a4,1488 # 80004694 <ticks>
    800020cc:	00072783          	lw	a5,0(a4)
    800020d0:	01013403          	ld	s0,16(sp)
    800020d4:	01813083          	ld	ra,24(sp)
    800020d8:	00048513          	mv	a0,s1
    800020dc:	0017879b          	addiw	a5,a5,1
    800020e0:	00813483          	ld	s1,8(sp)
    800020e4:	00f72023          	sw	a5,0(a4)
    800020e8:	02010113          	addi	sp,sp,32
    800020ec:	00001317          	auipc	t1,0x1
    800020f0:	4bc30067          	jr	1212(t1) # 800035a8 <release>

00000000800020f4 <devintr>:
    800020f4:	142027f3          	csrr	a5,scause
    800020f8:	00000513          	li	a0,0
    800020fc:	0007c463          	bltz	a5,80002104 <devintr+0x10>
    80002100:	00008067          	ret
    80002104:	fe010113          	addi	sp,sp,-32
    80002108:	00813823          	sd	s0,16(sp)
    8000210c:	00113c23          	sd	ra,24(sp)
    80002110:	00913423          	sd	s1,8(sp)
    80002114:	02010413          	addi	s0,sp,32
    80002118:	0ff7f713          	andi	a4,a5,255
    8000211c:	00900693          	li	a3,9
    80002120:	04d70c63          	beq	a4,a3,80002178 <devintr+0x84>
    80002124:	fff00713          	li	a4,-1
    80002128:	03f71713          	slli	a4,a4,0x3f
    8000212c:	00170713          	addi	a4,a4,1
    80002130:	00e78c63          	beq	a5,a4,80002148 <devintr+0x54>
    80002134:	01813083          	ld	ra,24(sp)
    80002138:	01013403          	ld	s0,16(sp)
    8000213c:	00813483          	ld	s1,8(sp)
    80002140:	02010113          	addi	sp,sp,32
    80002144:	00008067          	ret
    80002148:	00000097          	auipc	ra,0x0
    8000214c:	c8c080e7          	jalr	-884(ra) # 80001dd4 <cpuid>
    80002150:	06050663          	beqz	a0,800021bc <devintr+0xc8>
    80002154:	144027f3          	csrr	a5,sip
    80002158:	ffd7f793          	andi	a5,a5,-3
    8000215c:	14479073          	csrw	sip,a5
    80002160:	01813083          	ld	ra,24(sp)
    80002164:	01013403          	ld	s0,16(sp)
    80002168:	00813483          	ld	s1,8(sp)
    8000216c:	00200513          	li	a0,2
    80002170:	02010113          	addi	sp,sp,32
    80002174:	00008067          	ret
    80002178:	00000097          	auipc	ra,0x0
    8000217c:	24c080e7          	jalr	588(ra) # 800023c4 <plic_claim>
    80002180:	00a00793          	li	a5,10
    80002184:	00050493          	mv	s1,a0
    80002188:	06f50663          	beq	a0,a5,800021f4 <devintr+0x100>
    8000218c:	00100513          	li	a0,1
    80002190:	fa0482e3          	beqz	s1,80002134 <devintr+0x40>
    80002194:	00048593          	mv	a1,s1
    80002198:	00002517          	auipc	a0,0x2
    8000219c:	f5850513          	addi	a0,a0,-168 # 800040f0 <CONSOLE_STATUS+0xe0>
    800021a0:	00000097          	auipc	ra,0x0
    800021a4:	668080e7          	jalr	1640(ra) # 80002808 <__printf>
    800021a8:	00048513          	mv	a0,s1
    800021ac:	00000097          	auipc	ra,0x0
    800021b0:	250080e7          	jalr	592(ra) # 800023fc <plic_complete>
    800021b4:	00100513          	li	a0,1
    800021b8:	f7dff06f          	j	80002134 <devintr+0x40>
    800021bc:	00003517          	auipc	a0,0x3
    800021c0:	5e450513          	addi	a0,a0,1508 # 800057a0 <tickslock>
    800021c4:	00001097          	auipc	ra,0x1
    800021c8:	318080e7          	jalr	792(ra) # 800034dc <acquire>
    800021cc:	00002717          	auipc	a4,0x2
    800021d0:	4c870713          	addi	a4,a4,1224 # 80004694 <ticks>
    800021d4:	00072783          	lw	a5,0(a4)
    800021d8:	00003517          	auipc	a0,0x3
    800021dc:	5c850513          	addi	a0,a0,1480 # 800057a0 <tickslock>
    800021e0:	0017879b          	addiw	a5,a5,1
    800021e4:	00f72023          	sw	a5,0(a4)
    800021e8:	00001097          	auipc	ra,0x1
    800021ec:	3c0080e7          	jalr	960(ra) # 800035a8 <release>
    800021f0:	f65ff06f          	j	80002154 <devintr+0x60>
    800021f4:	00001097          	auipc	ra,0x1
    800021f8:	f1c080e7          	jalr	-228(ra) # 80003110 <uartintr>
    800021fc:	fadff06f          	j	800021a8 <devintr+0xb4>

0000000080002200 <kernelvec>:
    80002200:	f0010113          	addi	sp,sp,-256
    80002204:	00113023          	sd	ra,0(sp)
    80002208:	00213423          	sd	sp,8(sp)
    8000220c:	00313823          	sd	gp,16(sp)
    80002210:	00413c23          	sd	tp,24(sp)
    80002214:	02513023          	sd	t0,32(sp)
    80002218:	02613423          	sd	t1,40(sp)
    8000221c:	02713823          	sd	t2,48(sp)
    80002220:	02813c23          	sd	s0,56(sp)
    80002224:	04913023          	sd	s1,64(sp)
    80002228:	04a13423          	sd	a0,72(sp)
    8000222c:	04b13823          	sd	a1,80(sp)
    80002230:	04c13c23          	sd	a2,88(sp)
    80002234:	06d13023          	sd	a3,96(sp)
    80002238:	06e13423          	sd	a4,104(sp)
    8000223c:	06f13823          	sd	a5,112(sp)
    80002240:	07013c23          	sd	a6,120(sp)
    80002244:	09113023          	sd	a7,128(sp)
    80002248:	09213423          	sd	s2,136(sp)
    8000224c:	09313823          	sd	s3,144(sp)
    80002250:	09413c23          	sd	s4,152(sp)
    80002254:	0b513023          	sd	s5,160(sp)
    80002258:	0b613423          	sd	s6,168(sp)
    8000225c:	0b713823          	sd	s7,176(sp)
    80002260:	0b813c23          	sd	s8,184(sp)
    80002264:	0d913023          	sd	s9,192(sp)
    80002268:	0da13423          	sd	s10,200(sp)
    8000226c:	0db13823          	sd	s11,208(sp)
    80002270:	0dc13c23          	sd	t3,216(sp)
    80002274:	0fd13023          	sd	t4,224(sp)
    80002278:	0fe13423          	sd	t5,232(sp)
    8000227c:	0ff13823          	sd	t6,240(sp)
    80002280:	cd5ff0ef          	jal	ra,80001f54 <kerneltrap>
    80002284:	00013083          	ld	ra,0(sp)
    80002288:	00813103          	ld	sp,8(sp)
    8000228c:	01013183          	ld	gp,16(sp)
    80002290:	02013283          	ld	t0,32(sp)
    80002294:	02813303          	ld	t1,40(sp)
    80002298:	03013383          	ld	t2,48(sp)
    8000229c:	03813403          	ld	s0,56(sp)
    800022a0:	04013483          	ld	s1,64(sp)
    800022a4:	04813503          	ld	a0,72(sp)
    800022a8:	05013583          	ld	a1,80(sp)
    800022ac:	05813603          	ld	a2,88(sp)
    800022b0:	06013683          	ld	a3,96(sp)
    800022b4:	06813703          	ld	a4,104(sp)
    800022b8:	07013783          	ld	a5,112(sp)
    800022bc:	07813803          	ld	a6,120(sp)
    800022c0:	08013883          	ld	a7,128(sp)
    800022c4:	08813903          	ld	s2,136(sp)
    800022c8:	09013983          	ld	s3,144(sp)
    800022cc:	09813a03          	ld	s4,152(sp)
    800022d0:	0a013a83          	ld	s5,160(sp)
    800022d4:	0a813b03          	ld	s6,168(sp)
    800022d8:	0b013b83          	ld	s7,176(sp)
    800022dc:	0b813c03          	ld	s8,184(sp)
    800022e0:	0c013c83          	ld	s9,192(sp)
    800022e4:	0c813d03          	ld	s10,200(sp)
    800022e8:	0d013d83          	ld	s11,208(sp)
    800022ec:	0d813e03          	ld	t3,216(sp)
    800022f0:	0e013e83          	ld	t4,224(sp)
    800022f4:	0e813f03          	ld	t5,232(sp)
    800022f8:	0f013f83          	ld	t6,240(sp)
    800022fc:	10010113          	addi	sp,sp,256
    80002300:	10200073          	sret
    80002304:	00000013          	nop
    80002308:	00000013          	nop
    8000230c:	00000013          	nop

0000000080002310 <timervec>:
    80002310:	34051573          	csrrw	a0,mscratch,a0
    80002314:	00b53023          	sd	a1,0(a0)
    80002318:	00c53423          	sd	a2,8(a0)
    8000231c:	00d53823          	sd	a3,16(a0)
    80002320:	01853583          	ld	a1,24(a0)
    80002324:	02053603          	ld	a2,32(a0)
    80002328:	0005b683          	ld	a3,0(a1)
    8000232c:	00c686b3          	add	a3,a3,a2
    80002330:	00d5b023          	sd	a3,0(a1)
    80002334:	00200593          	li	a1,2
    80002338:	14459073          	csrw	sip,a1
    8000233c:	01053683          	ld	a3,16(a0)
    80002340:	00853603          	ld	a2,8(a0)
    80002344:	00053583          	ld	a1,0(a0)
    80002348:	34051573          	csrrw	a0,mscratch,a0
    8000234c:	30200073          	mret

0000000080002350 <plicinit>:
    80002350:	ff010113          	addi	sp,sp,-16
    80002354:	00813423          	sd	s0,8(sp)
    80002358:	01010413          	addi	s0,sp,16
    8000235c:	00813403          	ld	s0,8(sp)
    80002360:	0c0007b7          	lui	a5,0xc000
    80002364:	00100713          	li	a4,1
    80002368:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000236c:	00e7a223          	sw	a4,4(a5)
    80002370:	01010113          	addi	sp,sp,16
    80002374:	00008067          	ret

0000000080002378 <plicinithart>:
    80002378:	ff010113          	addi	sp,sp,-16
    8000237c:	00813023          	sd	s0,0(sp)
    80002380:	00113423          	sd	ra,8(sp)
    80002384:	01010413          	addi	s0,sp,16
    80002388:	00000097          	auipc	ra,0x0
    8000238c:	a4c080e7          	jalr	-1460(ra) # 80001dd4 <cpuid>
    80002390:	0085171b          	slliw	a4,a0,0x8
    80002394:	0c0027b7          	lui	a5,0xc002
    80002398:	00e787b3          	add	a5,a5,a4
    8000239c:	40200713          	li	a4,1026
    800023a0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800023a4:	00813083          	ld	ra,8(sp)
    800023a8:	00013403          	ld	s0,0(sp)
    800023ac:	00d5151b          	slliw	a0,a0,0xd
    800023b0:	0c2017b7          	lui	a5,0xc201
    800023b4:	00a78533          	add	a0,a5,a0
    800023b8:	00052023          	sw	zero,0(a0)
    800023bc:	01010113          	addi	sp,sp,16
    800023c0:	00008067          	ret

00000000800023c4 <plic_claim>:
    800023c4:	ff010113          	addi	sp,sp,-16
    800023c8:	00813023          	sd	s0,0(sp)
    800023cc:	00113423          	sd	ra,8(sp)
    800023d0:	01010413          	addi	s0,sp,16
    800023d4:	00000097          	auipc	ra,0x0
    800023d8:	a00080e7          	jalr	-1536(ra) # 80001dd4 <cpuid>
    800023dc:	00813083          	ld	ra,8(sp)
    800023e0:	00013403          	ld	s0,0(sp)
    800023e4:	00d5151b          	slliw	a0,a0,0xd
    800023e8:	0c2017b7          	lui	a5,0xc201
    800023ec:	00a78533          	add	a0,a5,a0
    800023f0:	00452503          	lw	a0,4(a0)
    800023f4:	01010113          	addi	sp,sp,16
    800023f8:	00008067          	ret

00000000800023fc <plic_complete>:
    800023fc:	fe010113          	addi	sp,sp,-32
    80002400:	00813823          	sd	s0,16(sp)
    80002404:	00913423          	sd	s1,8(sp)
    80002408:	00113c23          	sd	ra,24(sp)
    8000240c:	02010413          	addi	s0,sp,32
    80002410:	00050493          	mv	s1,a0
    80002414:	00000097          	auipc	ra,0x0
    80002418:	9c0080e7          	jalr	-1600(ra) # 80001dd4 <cpuid>
    8000241c:	01813083          	ld	ra,24(sp)
    80002420:	01013403          	ld	s0,16(sp)
    80002424:	00d5179b          	slliw	a5,a0,0xd
    80002428:	0c201737          	lui	a4,0xc201
    8000242c:	00f707b3          	add	a5,a4,a5
    80002430:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002434:	00813483          	ld	s1,8(sp)
    80002438:	02010113          	addi	sp,sp,32
    8000243c:	00008067          	ret

0000000080002440 <consolewrite>:
    80002440:	fb010113          	addi	sp,sp,-80
    80002444:	04813023          	sd	s0,64(sp)
    80002448:	04113423          	sd	ra,72(sp)
    8000244c:	02913c23          	sd	s1,56(sp)
    80002450:	03213823          	sd	s2,48(sp)
    80002454:	03313423          	sd	s3,40(sp)
    80002458:	03413023          	sd	s4,32(sp)
    8000245c:	01513c23          	sd	s5,24(sp)
    80002460:	05010413          	addi	s0,sp,80
    80002464:	06c05c63          	blez	a2,800024dc <consolewrite+0x9c>
    80002468:	00060993          	mv	s3,a2
    8000246c:	00050a13          	mv	s4,a0
    80002470:	00058493          	mv	s1,a1
    80002474:	00000913          	li	s2,0
    80002478:	fff00a93          	li	s5,-1
    8000247c:	01c0006f          	j	80002498 <consolewrite+0x58>
    80002480:	fbf44503          	lbu	a0,-65(s0)
    80002484:	0019091b          	addiw	s2,s2,1
    80002488:	00148493          	addi	s1,s1,1
    8000248c:	00001097          	auipc	ra,0x1
    80002490:	a9c080e7          	jalr	-1380(ra) # 80002f28 <uartputc>
    80002494:	03298063          	beq	s3,s2,800024b4 <consolewrite+0x74>
    80002498:	00048613          	mv	a2,s1
    8000249c:	00100693          	li	a3,1
    800024a0:	000a0593          	mv	a1,s4
    800024a4:	fbf40513          	addi	a0,s0,-65
    800024a8:	00000097          	auipc	ra,0x0
    800024ac:	9e4080e7          	jalr	-1564(ra) # 80001e8c <either_copyin>
    800024b0:	fd5518e3          	bne	a0,s5,80002480 <consolewrite+0x40>
    800024b4:	04813083          	ld	ra,72(sp)
    800024b8:	04013403          	ld	s0,64(sp)
    800024bc:	03813483          	ld	s1,56(sp)
    800024c0:	02813983          	ld	s3,40(sp)
    800024c4:	02013a03          	ld	s4,32(sp)
    800024c8:	01813a83          	ld	s5,24(sp)
    800024cc:	00090513          	mv	a0,s2
    800024d0:	03013903          	ld	s2,48(sp)
    800024d4:	05010113          	addi	sp,sp,80
    800024d8:	00008067          	ret
    800024dc:	00000913          	li	s2,0
    800024e0:	fd5ff06f          	j	800024b4 <consolewrite+0x74>

00000000800024e4 <consoleread>:
    800024e4:	f9010113          	addi	sp,sp,-112
    800024e8:	06813023          	sd	s0,96(sp)
    800024ec:	04913c23          	sd	s1,88(sp)
    800024f0:	05213823          	sd	s2,80(sp)
    800024f4:	05313423          	sd	s3,72(sp)
    800024f8:	05413023          	sd	s4,64(sp)
    800024fc:	03513c23          	sd	s5,56(sp)
    80002500:	03613823          	sd	s6,48(sp)
    80002504:	03713423          	sd	s7,40(sp)
    80002508:	03813023          	sd	s8,32(sp)
    8000250c:	06113423          	sd	ra,104(sp)
    80002510:	01913c23          	sd	s9,24(sp)
    80002514:	07010413          	addi	s0,sp,112
    80002518:	00060b93          	mv	s7,a2
    8000251c:	00050913          	mv	s2,a0
    80002520:	00058c13          	mv	s8,a1
    80002524:	00060b1b          	sext.w	s6,a2
    80002528:	00003497          	auipc	s1,0x3
    8000252c:	29048493          	addi	s1,s1,656 # 800057b8 <cons>
    80002530:	00400993          	li	s3,4
    80002534:	fff00a13          	li	s4,-1
    80002538:	00a00a93          	li	s5,10
    8000253c:	05705e63          	blez	s7,80002598 <consoleread+0xb4>
    80002540:	09c4a703          	lw	a4,156(s1)
    80002544:	0984a783          	lw	a5,152(s1)
    80002548:	0007071b          	sext.w	a4,a4
    8000254c:	08e78463          	beq	a5,a4,800025d4 <consoleread+0xf0>
    80002550:	07f7f713          	andi	a4,a5,127
    80002554:	00e48733          	add	a4,s1,a4
    80002558:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000255c:	0017869b          	addiw	a3,a5,1
    80002560:	08d4ac23          	sw	a3,152(s1)
    80002564:	00070c9b          	sext.w	s9,a4
    80002568:	0b370663          	beq	a4,s3,80002614 <consoleread+0x130>
    8000256c:	00100693          	li	a3,1
    80002570:	f9f40613          	addi	a2,s0,-97
    80002574:	000c0593          	mv	a1,s8
    80002578:	00090513          	mv	a0,s2
    8000257c:	f8e40fa3          	sb	a4,-97(s0)
    80002580:	00000097          	auipc	ra,0x0
    80002584:	8c0080e7          	jalr	-1856(ra) # 80001e40 <either_copyout>
    80002588:	01450863          	beq	a0,s4,80002598 <consoleread+0xb4>
    8000258c:	001c0c13          	addi	s8,s8,1
    80002590:	fffb8b9b          	addiw	s7,s7,-1
    80002594:	fb5c94e3          	bne	s9,s5,8000253c <consoleread+0x58>
    80002598:	000b851b          	sext.w	a0,s7
    8000259c:	06813083          	ld	ra,104(sp)
    800025a0:	06013403          	ld	s0,96(sp)
    800025a4:	05813483          	ld	s1,88(sp)
    800025a8:	05013903          	ld	s2,80(sp)
    800025ac:	04813983          	ld	s3,72(sp)
    800025b0:	04013a03          	ld	s4,64(sp)
    800025b4:	03813a83          	ld	s5,56(sp)
    800025b8:	02813b83          	ld	s7,40(sp)
    800025bc:	02013c03          	ld	s8,32(sp)
    800025c0:	01813c83          	ld	s9,24(sp)
    800025c4:	40ab053b          	subw	a0,s6,a0
    800025c8:	03013b03          	ld	s6,48(sp)
    800025cc:	07010113          	addi	sp,sp,112
    800025d0:	00008067          	ret
    800025d4:	00001097          	auipc	ra,0x1
    800025d8:	1d8080e7          	jalr	472(ra) # 800037ac <push_on>
    800025dc:	0984a703          	lw	a4,152(s1)
    800025e0:	09c4a783          	lw	a5,156(s1)
    800025e4:	0007879b          	sext.w	a5,a5
    800025e8:	fef70ce3          	beq	a4,a5,800025e0 <consoleread+0xfc>
    800025ec:	00001097          	auipc	ra,0x1
    800025f0:	234080e7          	jalr	564(ra) # 80003820 <pop_on>
    800025f4:	0984a783          	lw	a5,152(s1)
    800025f8:	07f7f713          	andi	a4,a5,127
    800025fc:	00e48733          	add	a4,s1,a4
    80002600:	01874703          	lbu	a4,24(a4)
    80002604:	0017869b          	addiw	a3,a5,1
    80002608:	08d4ac23          	sw	a3,152(s1)
    8000260c:	00070c9b          	sext.w	s9,a4
    80002610:	f5371ee3          	bne	a4,s3,8000256c <consoleread+0x88>
    80002614:	000b851b          	sext.w	a0,s7
    80002618:	f96bf2e3          	bgeu	s7,s6,8000259c <consoleread+0xb8>
    8000261c:	08f4ac23          	sw	a5,152(s1)
    80002620:	f7dff06f          	j	8000259c <consoleread+0xb8>

0000000080002624 <consputc>:
    80002624:	10000793          	li	a5,256
    80002628:	00f50663          	beq	a0,a5,80002634 <consputc+0x10>
    8000262c:	00001317          	auipc	t1,0x1
    80002630:	9f430067          	jr	-1548(t1) # 80003020 <uartputc_sync>
    80002634:	ff010113          	addi	sp,sp,-16
    80002638:	00113423          	sd	ra,8(sp)
    8000263c:	00813023          	sd	s0,0(sp)
    80002640:	01010413          	addi	s0,sp,16
    80002644:	00800513          	li	a0,8
    80002648:	00001097          	auipc	ra,0x1
    8000264c:	9d8080e7          	jalr	-1576(ra) # 80003020 <uartputc_sync>
    80002650:	02000513          	li	a0,32
    80002654:	00001097          	auipc	ra,0x1
    80002658:	9cc080e7          	jalr	-1588(ra) # 80003020 <uartputc_sync>
    8000265c:	00013403          	ld	s0,0(sp)
    80002660:	00813083          	ld	ra,8(sp)
    80002664:	00800513          	li	a0,8
    80002668:	01010113          	addi	sp,sp,16
    8000266c:	00001317          	auipc	t1,0x1
    80002670:	9b430067          	jr	-1612(t1) # 80003020 <uartputc_sync>

0000000080002674 <consoleintr>:
    80002674:	fe010113          	addi	sp,sp,-32
    80002678:	00813823          	sd	s0,16(sp)
    8000267c:	00913423          	sd	s1,8(sp)
    80002680:	01213023          	sd	s2,0(sp)
    80002684:	00113c23          	sd	ra,24(sp)
    80002688:	02010413          	addi	s0,sp,32
    8000268c:	00003917          	auipc	s2,0x3
    80002690:	12c90913          	addi	s2,s2,300 # 800057b8 <cons>
    80002694:	00050493          	mv	s1,a0
    80002698:	00090513          	mv	a0,s2
    8000269c:	00001097          	auipc	ra,0x1
    800026a0:	e40080e7          	jalr	-448(ra) # 800034dc <acquire>
    800026a4:	02048c63          	beqz	s1,800026dc <consoleintr+0x68>
    800026a8:	0a092783          	lw	a5,160(s2)
    800026ac:	09892703          	lw	a4,152(s2)
    800026b0:	07f00693          	li	a3,127
    800026b4:	40e7873b          	subw	a4,a5,a4
    800026b8:	02e6e263          	bltu	a3,a4,800026dc <consoleintr+0x68>
    800026bc:	00d00713          	li	a4,13
    800026c0:	04e48063          	beq	s1,a4,80002700 <consoleintr+0x8c>
    800026c4:	07f7f713          	andi	a4,a5,127
    800026c8:	00e90733          	add	a4,s2,a4
    800026cc:	0017879b          	addiw	a5,a5,1
    800026d0:	0af92023          	sw	a5,160(s2)
    800026d4:	00970c23          	sb	s1,24(a4)
    800026d8:	08f92e23          	sw	a5,156(s2)
    800026dc:	01013403          	ld	s0,16(sp)
    800026e0:	01813083          	ld	ra,24(sp)
    800026e4:	00813483          	ld	s1,8(sp)
    800026e8:	00013903          	ld	s2,0(sp)
    800026ec:	00003517          	auipc	a0,0x3
    800026f0:	0cc50513          	addi	a0,a0,204 # 800057b8 <cons>
    800026f4:	02010113          	addi	sp,sp,32
    800026f8:	00001317          	auipc	t1,0x1
    800026fc:	eb030067          	jr	-336(t1) # 800035a8 <release>
    80002700:	00a00493          	li	s1,10
    80002704:	fc1ff06f          	j	800026c4 <consoleintr+0x50>

0000000080002708 <consoleinit>:
    80002708:	fe010113          	addi	sp,sp,-32
    8000270c:	00113c23          	sd	ra,24(sp)
    80002710:	00813823          	sd	s0,16(sp)
    80002714:	00913423          	sd	s1,8(sp)
    80002718:	02010413          	addi	s0,sp,32
    8000271c:	00003497          	auipc	s1,0x3
    80002720:	09c48493          	addi	s1,s1,156 # 800057b8 <cons>
    80002724:	00048513          	mv	a0,s1
    80002728:	00002597          	auipc	a1,0x2
    8000272c:	a2058593          	addi	a1,a1,-1504 # 80004148 <CONSOLE_STATUS+0x138>
    80002730:	00001097          	auipc	ra,0x1
    80002734:	d88080e7          	jalr	-632(ra) # 800034b8 <initlock>
    80002738:	00000097          	auipc	ra,0x0
    8000273c:	7ac080e7          	jalr	1964(ra) # 80002ee4 <uartinit>
    80002740:	01813083          	ld	ra,24(sp)
    80002744:	01013403          	ld	s0,16(sp)
    80002748:	00000797          	auipc	a5,0x0
    8000274c:	d9c78793          	addi	a5,a5,-612 # 800024e4 <consoleread>
    80002750:	0af4bc23          	sd	a5,184(s1)
    80002754:	00000797          	auipc	a5,0x0
    80002758:	cec78793          	addi	a5,a5,-788 # 80002440 <consolewrite>
    8000275c:	0cf4b023          	sd	a5,192(s1)
    80002760:	00813483          	ld	s1,8(sp)
    80002764:	02010113          	addi	sp,sp,32
    80002768:	00008067          	ret

000000008000276c <console_read>:
    8000276c:	ff010113          	addi	sp,sp,-16
    80002770:	00813423          	sd	s0,8(sp)
    80002774:	01010413          	addi	s0,sp,16
    80002778:	00813403          	ld	s0,8(sp)
    8000277c:	00003317          	auipc	t1,0x3
    80002780:	0f433303          	ld	t1,244(t1) # 80005870 <devsw+0x10>
    80002784:	01010113          	addi	sp,sp,16
    80002788:	00030067          	jr	t1

000000008000278c <console_write>:
    8000278c:	ff010113          	addi	sp,sp,-16
    80002790:	00813423          	sd	s0,8(sp)
    80002794:	01010413          	addi	s0,sp,16
    80002798:	00813403          	ld	s0,8(sp)
    8000279c:	00003317          	auipc	t1,0x3
    800027a0:	0dc33303          	ld	t1,220(t1) # 80005878 <devsw+0x18>
    800027a4:	01010113          	addi	sp,sp,16
    800027a8:	00030067          	jr	t1

00000000800027ac <panic>:
    800027ac:	fe010113          	addi	sp,sp,-32
    800027b0:	00113c23          	sd	ra,24(sp)
    800027b4:	00813823          	sd	s0,16(sp)
    800027b8:	00913423          	sd	s1,8(sp)
    800027bc:	02010413          	addi	s0,sp,32
    800027c0:	00050493          	mv	s1,a0
    800027c4:	00002517          	auipc	a0,0x2
    800027c8:	98c50513          	addi	a0,a0,-1652 # 80004150 <CONSOLE_STATUS+0x140>
    800027cc:	00003797          	auipc	a5,0x3
    800027d0:	1407a623          	sw	zero,332(a5) # 80005918 <pr+0x18>
    800027d4:	00000097          	auipc	ra,0x0
    800027d8:	034080e7          	jalr	52(ra) # 80002808 <__printf>
    800027dc:	00048513          	mv	a0,s1
    800027e0:	00000097          	auipc	ra,0x0
    800027e4:	028080e7          	jalr	40(ra) # 80002808 <__printf>
    800027e8:	00002517          	auipc	a0,0x2
    800027ec:	94850513          	addi	a0,a0,-1720 # 80004130 <CONSOLE_STATUS+0x120>
    800027f0:	00000097          	auipc	ra,0x0
    800027f4:	018080e7          	jalr	24(ra) # 80002808 <__printf>
    800027f8:	00100793          	li	a5,1
    800027fc:	00002717          	auipc	a4,0x2
    80002800:	e8f72e23          	sw	a5,-356(a4) # 80004698 <panicked>
    80002804:	0000006f          	j	80002804 <panic+0x58>

0000000080002808 <__printf>:
    80002808:	f3010113          	addi	sp,sp,-208
    8000280c:	08813023          	sd	s0,128(sp)
    80002810:	07313423          	sd	s3,104(sp)
    80002814:	09010413          	addi	s0,sp,144
    80002818:	05813023          	sd	s8,64(sp)
    8000281c:	08113423          	sd	ra,136(sp)
    80002820:	06913c23          	sd	s1,120(sp)
    80002824:	07213823          	sd	s2,112(sp)
    80002828:	07413023          	sd	s4,96(sp)
    8000282c:	05513c23          	sd	s5,88(sp)
    80002830:	05613823          	sd	s6,80(sp)
    80002834:	05713423          	sd	s7,72(sp)
    80002838:	03913c23          	sd	s9,56(sp)
    8000283c:	03a13823          	sd	s10,48(sp)
    80002840:	03b13423          	sd	s11,40(sp)
    80002844:	00003317          	auipc	t1,0x3
    80002848:	0bc30313          	addi	t1,t1,188 # 80005900 <pr>
    8000284c:	01832c03          	lw	s8,24(t1)
    80002850:	00b43423          	sd	a1,8(s0)
    80002854:	00c43823          	sd	a2,16(s0)
    80002858:	00d43c23          	sd	a3,24(s0)
    8000285c:	02e43023          	sd	a4,32(s0)
    80002860:	02f43423          	sd	a5,40(s0)
    80002864:	03043823          	sd	a6,48(s0)
    80002868:	03143c23          	sd	a7,56(s0)
    8000286c:	00050993          	mv	s3,a0
    80002870:	4a0c1663          	bnez	s8,80002d1c <__printf+0x514>
    80002874:	60098c63          	beqz	s3,80002e8c <__printf+0x684>
    80002878:	0009c503          	lbu	a0,0(s3)
    8000287c:	00840793          	addi	a5,s0,8
    80002880:	f6f43c23          	sd	a5,-136(s0)
    80002884:	00000493          	li	s1,0
    80002888:	22050063          	beqz	a0,80002aa8 <__printf+0x2a0>
    8000288c:	00002a37          	lui	s4,0x2
    80002890:	00018ab7          	lui	s5,0x18
    80002894:	000f4b37          	lui	s6,0xf4
    80002898:	00989bb7          	lui	s7,0x989
    8000289c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800028a0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800028a4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800028a8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800028ac:	00148c9b          	addiw	s9,s1,1
    800028b0:	02500793          	li	a5,37
    800028b4:	01998933          	add	s2,s3,s9
    800028b8:	38f51263          	bne	a0,a5,80002c3c <__printf+0x434>
    800028bc:	00094783          	lbu	a5,0(s2)
    800028c0:	00078c9b          	sext.w	s9,a5
    800028c4:	1e078263          	beqz	a5,80002aa8 <__printf+0x2a0>
    800028c8:	0024849b          	addiw	s1,s1,2
    800028cc:	07000713          	li	a4,112
    800028d0:	00998933          	add	s2,s3,s1
    800028d4:	38e78a63          	beq	a5,a4,80002c68 <__printf+0x460>
    800028d8:	20f76863          	bltu	a4,a5,80002ae8 <__printf+0x2e0>
    800028dc:	42a78863          	beq	a5,a0,80002d0c <__printf+0x504>
    800028e0:	06400713          	li	a4,100
    800028e4:	40e79663          	bne	a5,a4,80002cf0 <__printf+0x4e8>
    800028e8:	f7843783          	ld	a5,-136(s0)
    800028ec:	0007a603          	lw	a2,0(a5)
    800028f0:	00878793          	addi	a5,a5,8
    800028f4:	f6f43c23          	sd	a5,-136(s0)
    800028f8:	42064a63          	bltz	a2,80002d2c <__printf+0x524>
    800028fc:	00a00713          	li	a4,10
    80002900:	02e677bb          	remuw	a5,a2,a4
    80002904:	00002d97          	auipc	s11,0x2
    80002908:	874d8d93          	addi	s11,s11,-1932 # 80004178 <digits>
    8000290c:	00900593          	li	a1,9
    80002910:	0006051b          	sext.w	a0,a2
    80002914:	00000c93          	li	s9,0
    80002918:	02079793          	slli	a5,a5,0x20
    8000291c:	0207d793          	srli	a5,a5,0x20
    80002920:	00fd87b3          	add	a5,s11,a5
    80002924:	0007c783          	lbu	a5,0(a5)
    80002928:	02e656bb          	divuw	a3,a2,a4
    8000292c:	f8f40023          	sb	a5,-128(s0)
    80002930:	14c5d863          	bge	a1,a2,80002a80 <__printf+0x278>
    80002934:	06300593          	li	a1,99
    80002938:	00100c93          	li	s9,1
    8000293c:	02e6f7bb          	remuw	a5,a3,a4
    80002940:	02079793          	slli	a5,a5,0x20
    80002944:	0207d793          	srli	a5,a5,0x20
    80002948:	00fd87b3          	add	a5,s11,a5
    8000294c:	0007c783          	lbu	a5,0(a5)
    80002950:	02e6d73b          	divuw	a4,a3,a4
    80002954:	f8f400a3          	sb	a5,-127(s0)
    80002958:	12a5f463          	bgeu	a1,a0,80002a80 <__printf+0x278>
    8000295c:	00a00693          	li	a3,10
    80002960:	00900593          	li	a1,9
    80002964:	02d777bb          	remuw	a5,a4,a3
    80002968:	02079793          	slli	a5,a5,0x20
    8000296c:	0207d793          	srli	a5,a5,0x20
    80002970:	00fd87b3          	add	a5,s11,a5
    80002974:	0007c503          	lbu	a0,0(a5)
    80002978:	02d757bb          	divuw	a5,a4,a3
    8000297c:	f8a40123          	sb	a0,-126(s0)
    80002980:	48e5f263          	bgeu	a1,a4,80002e04 <__printf+0x5fc>
    80002984:	06300513          	li	a0,99
    80002988:	02d7f5bb          	remuw	a1,a5,a3
    8000298c:	02059593          	slli	a1,a1,0x20
    80002990:	0205d593          	srli	a1,a1,0x20
    80002994:	00bd85b3          	add	a1,s11,a1
    80002998:	0005c583          	lbu	a1,0(a1)
    8000299c:	02d7d7bb          	divuw	a5,a5,a3
    800029a0:	f8b401a3          	sb	a1,-125(s0)
    800029a4:	48e57263          	bgeu	a0,a4,80002e28 <__printf+0x620>
    800029a8:	3e700513          	li	a0,999
    800029ac:	02d7f5bb          	remuw	a1,a5,a3
    800029b0:	02059593          	slli	a1,a1,0x20
    800029b4:	0205d593          	srli	a1,a1,0x20
    800029b8:	00bd85b3          	add	a1,s11,a1
    800029bc:	0005c583          	lbu	a1,0(a1)
    800029c0:	02d7d7bb          	divuw	a5,a5,a3
    800029c4:	f8b40223          	sb	a1,-124(s0)
    800029c8:	46e57663          	bgeu	a0,a4,80002e34 <__printf+0x62c>
    800029cc:	02d7f5bb          	remuw	a1,a5,a3
    800029d0:	02059593          	slli	a1,a1,0x20
    800029d4:	0205d593          	srli	a1,a1,0x20
    800029d8:	00bd85b3          	add	a1,s11,a1
    800029dc:	0005c583          	lbu	a1,0(a1)
    800029e0:	02d7d7bb          	divuw	a5,a5,a3
    800029e4:	f8b402a3          	sb	a1,-123(s0)
    800029e8:	46ea7863          	bgeu	s4,a4,80002e58 <__printf+0x650>
    800029ec:	02d7f5bb          	remuw	a1,a5,a3
    800029f0:	02059593          	slli	a1,a1,0x20
    800029f4:	0205d593          	srli	a1,a1,0x20
    800029f8:	00bd85b3          	add	a1,s11,a1
    800029fc:	0005c583          	lbu	a1,0(a1)
    80002a00:	02d7d7bb          	divuw	a5,a5,a3
    80002a04:	f8b40323          	sb	a1,-122(s0)
    80002a08:	3eeaf863          	bgeu	s5,a4,80002df8 <__printf+0x5f0>
    80002a0c:	02d7f5bb          	remuw	a1,a5,a3
    80002a10:	02059593          	slli	a1,a1,0x20
    80002a14:	0205d593          	srli	a1,a1,0x20
    80002a18:	00bd85b3          	add	a1,s11,a1
    80002a1c:	0005c583          	lbu	a1,0(a1)
    80002a20:	02d7d7bb          	divuw	a5,a5,a3
    80002a24:	f8b403a3          	sb	a1,-121(s0)
    80002a28:	42eb7e63          	bgeu	s6,a4,80002e64 <__printf+0x65c>
    80002a2c:	02d7f5bb          	remuw	a1,a5,a3
    80002a30:	02059593          	slli	a1,a1,0x20
    80002a34:	0205d593          	srli	a1,a1,0x20
    80002a38:	00bd85b3          	add	a1,s11,a1
    80002a3c:	0005c583          	lbu	a1,0(a1)
    80002a40:	02d7d7bb          	divuw	a5,a5,a3
    80002a44:	f8b40423          	sb	a1,-120(s0)
    80002a48:	42ebfc63          	bgeu	s7,a4,80002e80 <__printf+0x678>
    80002a4c:	02079793          	slli	a5,a5,0x20
    80002a50:	0207d793          	srli	a5,a5,0x20
    80002a54:	00fd8db3          	add	s11,s11,a5
    80002a58:	000dc703          	lbu	a4,0(s11)
    80002a5c:	00a00793          	li	a5,10
    80002a60:	00900c93          	li	s9,9
    80002a64:	f8e404a3          	sb	a4,-119(s0)
    80002a68:	00065c63          	bgez	a2,80002a80 <__printf+0x278>
    80002a6c:	f9040713          	addi	a4,s0,-112
    80002a70:	00f70733          	add	a4,a4,a5
    80002a74:	02d00693          	li	a3,45
    80002a78:	fed70823          	sb	a3,-16(a4)
    80002a7c:	00078c93          	mv	s9,a5
    80002a80:	f8040793          	addi	a5,s0,-128
    80002a84:	01978cb3          	add	s9,a5,s9
    80002a88:	f7f40d13          	addi	s10,s0,-129
    80002a8c:	000cc503          	lbu	a0,0(s9)
    80002a90:	fffc8c93          	addi	s9,s9,-1
    80002a94:	00000097          	auipc	ra,0x0
    80002a98:	b90080e7          	jalr	-1136(ra) # 80002624 <consputc>
    80002a9c:	ffac98e3          	bne	s9,s10,80002a8c <__printf+0x284>
    80002aa0:	00094503          	lbu	a0,0(s2)
    80002aa4:	e00514e3          	bnez	a0,800028ac <__printf+0xa4>
    80002aa8:	1a0c1663          	bnez	s8,80002c54 <__printf+0x44c>
    80002aac:	08813083          	ld	ra,136(sp)
    80002ab0:	08013403          	ld	s0,128(sp)
    80002ab4:	07813483          	ld	s1,120(sp)
    80002ab8:	07013903          	ld	s2,112(sp)
    80002abc:	06813983          	ld	s3,104(sp)
    80002ac0:	06013a03          	ld	s4,96(sp)
    80002ac4:	05813a83          	ld	s5,88(sp)
    80002ac8:	05013b03          	ld	s6,80(sp)
    80002acc:	04813b83          	ld	s7,72(sp)
    80002ad0:	04013c03          	ld	s8,64(sp)
    80002ad4:	03813c83          	ld	s9,56(sp)
    80002ad8:	03013d03          	ld	s10,48(sp)
    80002adc:	02813d83          	ld	s11,40(sp)
    80002ae0:	0d010113          	addi	sp,sp,208
    80002ae4:	00008067          	ret
    80002ae8:	07300713          	li	a4,115
    80002aec:	1ce78a63          	beq	a5,a4,80002cc0 <__printf+0x4b8>
    80002af0:	07800713          	li	a4,120
    80002af4:	1ee79e63          	bne	a5,a4,80002cf0 <__printf+0x4e8>
    80002af8:	f7843783          	ld	a5,-136(s0)
    80002afc:	0007a703          	lw	a4,0(a5)
    80002b00:	00878793          	addi	a5,a5,8
    80002b04:	f6f43c23          	sd	a5,-136(s0)
    80002b08:	28074263          	bltz	a4,80002d8c <__printf+0x584>
    80002b0c:	00001d97          	auipc	s11,0x1
    80002b10:	66cd8d93          	addi	s11,s11,1644 # 80004178 <digits>
    80002b14:	00f77793          	andi	a5,a4,15
    80002b18:	00fd87b3          	add	a5,s11,a5
    80002b1c:	0007c683          	lbu	a3,0(a5)
    80002b20:	00f00613          	li	a2,15
    80002b24:	0007079b          	sext.w	a5,a4
    80002b28:	f8d40023          	sb	a3,-128(s0)
    80002b2c:	0047559b          	srliw	a1,a4,0x4
    80002b30:	0047569b          	srliw	a3,a4,0x4
    80002b34:	00000c93          	li	s9,0
    80002b38:	0ee65063          	bge	a2,a4,80002c18 <__printf+0x410>
    80002b3c:	00f6f693          	andi	a3,a3,15
    80002b40:	00dd86b3          	add	a3,s11,a3
    80002b44:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002b48:	0087d79b          	srliw	a5,a5,0x8
    80002b4c:	00100c93          	li	s9,1
    80002b50:	f8d400a3          	sb	a3,-127(s0)
    80002b54:	0cb67263          	bgeu	a2,a1,80002c18 <__printf+0x410>
    80002b58:	00f7f693          	andi	a3,a5,15
    80002b5c:	00dd86b3          	add	a3,s11,a3
    80002b60:	0006c583          	lbu	a1,0(a3)
    80002b64:	00f00613          	li	a2,15
    80002b68:	0047d69b          	srliw	a3,a5,0x4
    80002b6c:	f8b40123          	sb	a1,-126(s0)
    80002b70:	0047d593          	srli	a1,a5,0x4
    80002b74:	28f67e63          	bgeu	a2,a5,80002e10 <__printf+0x608>
    80002b78:	00f6f693          	andi	a3,a3,15
    80002b7c:	00dd86b3          	add	a3,s11,a3
    80002b80:	0006c503          	lbu	a0,0(a3)
    80002b84:	0087d813          	srli	a6,a5,0x8
    80002b88:	0087d69b          	srliw	a3,a5,0x8
    80002b8c:	f8a401a3          	sb	a0,-125(s0)
    80002b90:	28b67663          	bgeu	a2,a1,80002e1c <__printf+0x614>
    80002b94:	00f6f693          	andi	a3,a3,15
    80002b98:	00dd86b3          	add	a3,s11,a3
    80002b9c:	0006c583          	lbu	a1,0(a3)
    80002ba0:	00c7d513          	srli	a0,a5,0xc
    80002ba4:	00c7d69b          	srliw	a3,a5,0xc
    80002ba8:	f8b40223          	sb	a1,-124(s0)
    80002bac:	29067a63          	bgeu	a2,a6,80002e40 <__printf+0x638>
    80002bb0:	00f6f693          	andi	a3,a3,15
    80002bb4:	00dd86b3          	add	a3,s11,a3
    80002bb8:	0006c583          	lbu	a1,0(a3)
    80002bbc:	0107d813          	srli	a6,a5,0x10
    80002bc0:	0107d69b          	srliw	a3,a5,0x10
    80002bc4:	f8b402a3          	sb	a1,-123(s0)
    80002bc8:	28a67263          	bgeu	a2,a0,80002e4c <__printf+0x644>
    80002bcc:	00f6f693          	andi	a3,a3,15
    80002bd0:	00dd86b3          	add	a3,s11,a3
    80002bd4:	0006c683          	lbu	a3,0(a3)
    80002bd8:	0147d79b          	srliw	a5,a5,0x14
    80002bdc:	f8d40323          	sb	a3,-122(s0)
    80002be0:	21067663          	bgeu	a2,a6,80002dec <__printf+0x5e4>
    80002be4:	02079793          	slli	a5,a5,0x20
    80002be8:	0207d793          	srli	a5,a5,0x20
    80002bec:	00fd8db3          	add	s11,s11,a5
    80002bf0:	000dc683          	lbu	a3,0(s11)
    80002bf4:	00800793          	li	a5,8
    80002bf8:	00700c93          	li	s9,7
    80002bfc:	f8d403a3          	sb	a3,-121(s0)
    80002c00:	00075c63          	bgez	a4,80002c18 <__printf+0x410>
    80002c04:	f9040713          	addi	a4,s0,-112
    80002c08:	00f70733          	add	a4,a4,a5
    80002c0c:	02d00693          	li	a3,45
    80002c10:	fed70823          	sb	a3,-16(a4)
    80002c14:	00078c93          	mv	s9,a5
    80002c18:	f8040793          	addi	a5,s0,-128
    80002c1c:	01978cb3          	add	s9,a5,s9
    80002c20:	f7f40d13          	addi	s10,s0,-129
    80002c24:	000cc503          	lbu	a0,0(s9)
    80002c28:	fffc8c93          	addi	s9,s9,-1
    80002c2c:	00000097          	auipc	ra,0x0
    80002c30:	9f8080e7          	jalr	-1544(ra) # 80002624 <consputc>
    80002c34:	ff9d18e3          	bne	s10,s9,80002c24 <__printf+0x41c>
    80002c38:	0100006f          	j	80002c48 <__printf+0x440>
    80002c3c:	00000097          	auipc	ra,0x0
    80002c40:	9e8080e7          	jalr	-1560(ra) # 80002624 <consputc>
    80002c44:	000c8493          	mv	s1,s9
    80002c48:	00094503          	lbu	a0,0(s2)
    80002c4c:	c60510e3          	bnez	a0,800028ac <__printf+0xa4>
    80002c50:	e40c0ee3          	beqz	s8,80002aac <__printf+0x2a4>
    80002c54:	00003517          	auipc	a0,0x3
    80002c58:	cac50513          	addi	a0,a0,-852 # 80005900 <pr>
    80002c5c:	00001097          	auipc	ra,0x1
    80002c60:	94c080e7          	jalr	-1716(ra) # 800035a8 <release>
    80002c64:	e49ff06f          	j	80002aac <__printf+0x2a4>
    80002c68:	f7843783          	ld	a5,-136(s0)
    80002c6c:	03000513          	li	a0,48
    80002c70:	01000d13          	li	s10,16
    80002c74:	00878713          	addi	a4,a5,8
    80002c78:	0007bc83          	ld	s9,0(a5)
    80002c7c:	f6e43c23          	sd	a4,-136(s0)
    80002c80:	00000097          	auipc	ra,0x0
    80002c84:	9a4080e7          	jalr	-1628(ra) # 80002624 <consputc>
    80002c88:	07800513          	li	a0,120
    80002c8c:	00000097          	auipc	ra,0x0
    80002c90:	998080e7          	jalr	-1640(ra) # 80002624 <consputc>
    80002c94:	00001d97          	auipc	s11,0x1
    80002c98:	4e4d8d93          	addi	s11,s11,1252 # 80004178 <digits>
    80002c9c:	03ccd793          	srli	a5,s9,0x3c
    80002ca0:	00fd87b3          	add	a5,s11,a5
    80002ca4:	0007c503          	lbu	a0,0(a5)
    80002ca8:	fffd0d1b          	addiw	s10,s10,-1
    80002cac:	004c9c93          	slli	s9,s9,0x4
    80002cb0:	00000097          	auipc	ra,0x0
    80002cb4:	974080e7          	jalr	-1676(ra) # 80002624 <consputc>
    80002cb8:	fe0d12e3          	bnez	s10,80002c9c <__printf+0x494>
    80002cbc:	f8dff06f          	j	80002c48 <__printf+0x440>
    80002cc0:	f7843783          	ld	a5,-136(s0)
    80002cc4:	0007bc83          	ld	s9,0(a5)
    80002cc8:	00878793          	addi	a5,a5,8
    80002ccc:	f6f43c23          	sd	a5,-136(s0)
    80002cd0:	000c9a63          	bnez	s9,80002ce4 <__printf+0x4dc>
    80002cd4:	1080006f          	j	80002ddc <__printf+0x5d4>
    80002cd8:	001c8c93          	addi	s9,s9,1
    80002cdc:	00000097          	auipc	ra,0x0
    80002ce0:	948080e7          	jalr	-1720(ra) # 80002624 <consputc>
    80002ce4:	000cc503          	lbu	a0,0(s9)
    80002ce8:	fe0518e3          	bnez	a0,80002cd8 <__printf+0x4d0>
    80002cec:	f5dff06f          	j	80002c48 <__printf+0x440>
    80002cf0:	02500513          	li	a0,37
    80002cf4:	00000097          	auipc	ra,0x0
    80002cf8:	930080e7          	jalr	-1744(ra) # 80002624 <consputc>
    80002cfc:	000c8513          	mv	a0,s9
    80002d00:	00000097          	auipc	ra,0x0
    80002d04:	924080e7          	jalr	-1756(ra) # 80002624 <consputc>
    80002d08:	f41ff06f          	j	80002c48 <__printf+0x440>
    80002d0c:	02500513          	li	a0,37
    80002d10:	00000097          	auipc	ra,0x0
    80002d14:	914080e7          	jalr	-1772(ra) # 80002624 <consputc>
    80002d18:	f31ff06f          	j	80002c48 <__printf+0x440>
    80002d1c:	00030513          	mv	a0,t1
    80002d20:	00000097          	auipc	ra,0x0
    80002d24:	7bc080e7          	jalr	1980(ra) # 800034dc <acquire>
    80002d28:	b4dff06f          	j	80002874 <__printf+0x6c>
    80002d2c:	40c0053b          	negw	a0,a2
    80002d30:	00a00713          	li	a4,10
    80002d34:	02e576bb          	remuw	a3,a0,a4
    80002d38:	00001d97          	auipc	s11,0x1
    80002d3c:	440d8d93          	addi	s11,s11,1088 # 80004178 <digits>
    80002d40:	ff700593          	li	a1,-9
    80002d44:	02069693          	slli	a3,a3,0x20
    80002d48:	0206d693          	srli	a3,a3,0x20
    80002d4c:	00dd86b3          	add	a3,s11,a3
    80002d50:	0006c683          	lbu	a3,0(a3)
    80002d54:	02e557bb          	divuw	a5,a0,a4
    80002d58:	f8d40023          	sb	a3,-128(s0)
    80002d5c:	10b65e63          	bge	a2,a1,80002e78 <__printf+0x670>
    80002d60:	06300593          	li	a1,99
    80002d64:	02e7f6bb          	remuw	a3,a5,a4
    80002d68:	02069693          	slli	a3,a3,0x20
    80002d6c:	0206d693          	srli	a3,a3,0x20
    80002d70:	00dd86b3          	add	a3,s11,a3
    80002d74:	0006c683          	lbu	a3,0(a3)
    80002d78:	02e7d73b          	divuw	a4,a5,a4
    80002d7c:	00200793          	li	a5,2
    80002d80:	f8d400a3          	sb	a3,-127(s0)
    80002d84:	bca5ece3          	bltu	a1,a0,8000295c <__printf+0x154>
    80002d88:	ce5ff06f          	j	80002a6c <__printf+0x264>
    80002d8c:	40e007bb          	negw	a5,a4
    80002d90:	00001d97          	auipc	s11,0x1
    80002d94:	3e8d8d93          	addi	s11,s11,1000 # 80004178 <digits>
    80002d98:	00f7f693          	andi	a3,a5,15
    80002d9c:	00dd86b3          	add	a3,s11,a3
    80002da0:	0006c583          	lbu	a1,0(a3)
    80002da4:	ff100613          	li	a2,-15
    80002da8:	0047d69b          	srliw	a3,a5,0x4
    80002dac:	f8b40023          	sb	a1,-128(s0)
    80002db0:	0047d59b          	srliw	a1,a5,0x4
    80002db4:	0ac75e63          	bge	a4,a2,80002e70 <__printf+0x668>
    80002db8:	00f6f693          	andi	a3,a3,15
    80002dbc:	00dd86b3          	add	a3,s11,a3
    80002dc0:	0006c603          	lbu	a2,0(a3)
    80002dc4:	00f00693          	li	a3,15
    80002dc8:	0087d79b          	srliw	a5,a5,0x8
    80002dcc:	f8c400a3          	sb	a2,-127(s0)
    80002dd0:	d8b6e4e3          	bltu	a3,a1,80002b58 <__printf+0x350>
    80002dd4:	00200793          	li	a5,2
    80002dd8:	e2dff06f          	j	80002c04 <__printf+0x3fc>
    80002ddc:	00001c97          	auipc	s9,0x1
    80002de0:	37cc8c93          	addi	s9,s9,892 # 80004158 <CONSOLE_STATUS+0x148>
    80002de4:	02800513          	li	a0,40
    80002de8:	ef1ff06f          	j	80002cd8 <__printf+0x4d0>
    80002dec:	00700793          	li	a5,7
    80002df0:	00600c93          	li	s9,6
    80002df4:	e0dff06f          	j	80002c00 <__printf+0x3f8>
    80002df8:	00700793          	li	a5,7
    80002dfc:	00600c93          	li	s9,6
    80002e00:	c69ff06f          	j	80002a68 <__printf+0x260>
    80002e04:	00300793          	li	a5,3
    80002e08:	00200c93          	li	s9,2
    80002e0c:	c5dff06f          	j	80002a68 <__printf+0x260>
    80002e10:	00300793          	li	a5,3
    80002e14:	00200c93          	li	s9,2
    80002e18:	de9ff06f          	j	80002c00 <__printf+0x3f8>
    80002e1c:	00400793          	li	a5,4
    80002e20:	00300c93          	li	s9,3
    80002e24:	dddff06f          	j	80002c00 <__printf+0x3f8>
    80002e28:	00400793          	li	a5,4
    80002e2c:	00300c93          	li	s9,3
    80002e30:	c39ff06f          	j	80002a68 <__printf+0x260>
    80002e34:	00500793          	li	a5,5
    80002e38:	00400c93          	li	s9,4
    80002e3c:	c2dff06f          	j	80002a68 <__printf+0x260>
    80002e40:	00500793          	li	a5,5
    80002e44:	00400c93          	li	s9,4
    80002e48:	db9ff06f          	j	80002c00 <__printf+0x3f8>
    80002e4c:	00600793          	li	a5,6
    80002e50:	00500c93          	li	s9,5
    80002e54:	dadff06f          	j	80002c00 <__printf+0x3f8>
    80002e58:	00600793          	li	a5,6
    80002e5c:	00500c93          	li	s9,5
    80002e60:	c09ff06f          	j	80002a68 <__printf+0x260>
    80002e64:	00800793          	li	a5,8
    80002e68:	00700c93          	li	s9,7
    80002e6c:	bfdff06f          	j	80002a68 <__printf+0x260>
    80002e70:	00100793          	li	a5,1
    80002e74:	d91ff06f          	j	80002c04 <__printf+0x3fc>
    80002e78:	00100793          	li	a5,1
    80002e7c:	bf1ff06f          	j	80002a6c <__printf+0x264>
    80002e80:	00900793          	li	a5,9
    80002e84:	00800c93          	li	s9,8
    80002e88:	be1ff06f          	j	80002a68 <__printf+0x260>
    80002e8c:	00001517          	auipc	a0,0x1
    80002e90:	2d450513          	addi	a0,a0,724 # 80004160 <CONSOLE_STATUS+0x150>
    80002e94:	00000097          	auipc	ra,0x0
    80002e98:	918080e7          	jalr	-1768(ra) # 800027ac <panic>

0000000080002e9c <printfinit>:
    80002e9c:	fe010113          	addi	sp,sp,-32
    80002ea0:	00813823          	sd	s0,16(sp)
    80002ea4:	00913423          	sd	s1,8(sp)
    80002ea8:	00113c23          	sd	ra,24(sp)
    80002eac:	02010413          	addi	s0,sp,32
    80002eb0:	00003497          	auipc	s1,0x3
    80002eb4:	a5048493          	addi	s1,s1,-1456 # 80005900 <pr>
    80002eb8:	00048513          	mv	a0,s1
    80002ebc:	00001597          	auipc	a1,0x1
    80002ec0:	2b458593          	addi	a1,a1,692 # 80004170 <CONSOLE_STATUS+0x160>
    80002ec4:	00000097          	auipc	ra,0x0
    80002ec8:	5f4080e7          	jalr	1524(ra) # 800034b8 <initlock>
    80002ecc:	01813083          	ld	ra,24(sp)
    80002ed0:	01013403          	ld	s0,16(sp)
    80002ed4:	0004ac23          	sw	zero,24(s1)
    80002ed8:	00813483          	ld	s1,8(sp)
    80002edc:	02010113          	addi	sp,sp,32
    80002ee0:	00008067          	ret

0000000080002ee4 <uartinit>:
    80002ee4:	ff010113          	addi	sp,sp,-16
    80002ee8:	00813423          	sd	s0,8(sp)
    80002eec:	01010413          	addi	s0,sp,16
    80002ef0:	100007b7          	lui	a5,0x10000
    80002ef4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80002ef8:	f8000713          	li	a4,-128
    80002efc:	00e781a3          	sb	a4,3(a5)
    80002f00:	00300713          	li	a4,3
    80002f04:	00e78023          	sb	a4,0(a5)
    80002f08:	000780a3          	sb	zero,1(a5)
    80002f0c:	00e781a3          	sb	a4,3(a5)
    80002f10:	00700693          	li	a3,7
    80002f14:	00d78123          	sb	a3,2(a5)
    80002f18:	00e780a3          	sb	a4,1(a5)
    80002f1c:	00813403          	ld	s0,8(sp)
    80002f20:	01010113          	addi	sp,sp,16
    80002f24:	00008067          	ret

0000000080002f28 <uartputc>:
    80002f28:	00001797          	auipc	a5,0x1
    80002f2c:	7707a783          	lw	a5,1904(a5) # 80004698 <panicked>
    80002f30:	00078463          	beqz	a5,80002f38 <uartputc+0x10>
    80002f34:	0000006f          	j	80002f34 <uartputc+0xc>
    80002f38:	fd010113          	addi	sp,sp,-48
    80002f3c:	02813023          	sd	s0,32(sp)
    80002f40:	00913c23          	sd	s1,24(sp)
    80002f44:	01213823          	sd	s2,16(sp)
    80002f48:	01313423          	sd	s3,8(sp)
    80002f4c:	02113423          	sd	ra,40(sp)
    80002f50:	03010413          	addi	s0,sp,48
    80002f54:	00001917          	auipc	s2,0x1
    80002f58:	74c90913          	addi	s2,s2,1868 # 800046a0 <uart_tx_r>
    80002f5c:	00093783          	ld	a5,0(s2)
    80002f60:	00001497          	auipc	s1,0x1
    80002f64:	74848493          	addi	s1,s1,1864 # 800046a8 <uart_tx_w>
    80002f68:	0004b703          	ld	a4,0(s1)
    80002f6c:	02078693          	addi	a3,a5,32
    80002f70:	00050993          	mv	s3,a0
    80002f74:	02e69c63          	bne	a3,a4,80002fac <uartputc+0x84>
    80002f78:	00001097          	auipc	ra,0x1
    80002f7c:	834080e7          	jalr	-1996(ra) # 800037ac <push_on>
    80002f80:	00093783          	ld	a5,0(s2)
    80002f84:	0004b703          	ld	a4,0(s1)
    80002f88:	02078793          	addi	a5,a5,32
    80002f8c:	00e79463          	bne	a5,a4,80002f94 <uartputc+0x6c>
    80002f90:	0000006f          	j	80002f90 <uartputc+0x68>
    80002f94:	00001097          	auipc	ra,0x1
    80002f98:	88c080e7          	jalr	-1908(ra) # 80003820 <pop_on>
    80002f9c:	00093783          	ld	a5,0(s2)
    80002fa0:	0004b703          	ld	a4,0(s1)
    80002fa4:	02078693          	addi	a3,a5,32
    80002fa8:	fce688e3          	beq	a3,a4,80002f78 <uartputc+0x50>
    80002fac:	01f77693          	andi	a3,a4,31
    80002fb0:	00003597          	auipc	a1,0x3
    80002fb4:	97058593          	addi	a1,a1,-1680 # 80005920 <uart_tx_buf>
    80002fb8:	00d586b3          	add	a3,a1,a3
    80002fbc:	00170713          	addi	a4,a4,1
    80002fc0:	01368023          	sb	s3,0(a3)
    80002fc4:	00e4b023          	sd	a4,0(s1)
    80002fc8:	10000637          	lui	a2,0x10000
    80002fcc:	02f71063          	bne	a4,a5,80002fec <uartputc+0xc4>
    80002fd0:	0340006f          	j	80003004 <uartputc+0xdc>
    80002fd4:	00074703          	lbu	a4,0(a4)
    80002fd8:	00f93023          	sd	a5,0(s2)
    80002fdc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80002fe0:	00093783          	ld	a5,0(s2)
    80002fe4:	0004b703          	ld	a4,0(s1)
    80002fe8:	00f70e63          	beq	a4,a5,80003004 <uartputc+0xdc>
    80002fec:	00564683          	lbu	a3,5(a2)
    80002ff0:	01f7f713          	andi	a4,a5,31
    80002ff4:	00e58733          	add	a4,a1,a4
    80002ff8:	0206f693          	andi	a3,a3,32
    80002ffc:	00178793          	addi	a5,a5,1
    80003000:	fc069ae3          	bnez	a3,80002fd4 <uartputc+0xac>
    80003004:	02813083          	ld	ra,40(sp)
    80003008:	02013403          	ld	s0,32(sp)
    8000300c:	01813483          	ld	s1,24(sp)
    80003010:	01013903          	ld	s2,16(sp)
    80003014:	00813983          	ld	s3,8(sp)
    80003018:	03010113          	addi	sp,sp,48
    8000301c:	00008067          	ret

0000000080003020 <uartputc_sync>:
    80003020:	ff010113          	addi	sp,sp,-16
    80003024:	00813423          	sd	s0,8(sp)
    80003028:	01010413          	addi	s0,sp,16
    8000302c:	00001717          	auipc	a4,0x1
    80003030:	66c72703          	lw	a4,1644(a4) # 80004698 <panicked>
    80003034:	02071663          	bnez	a4,80003060 <uartputc_sync+0x40>
    80003038:	00050793          	mv	a5,a0
    8000303c:	100006b7          	lui	a3,0x10000
    80003040:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003044:	02077713          	andi	a4,a4,32
    80003048:	fe070ce3          	beqz	a4,80003040 <uartputc_sync+0x20>
    8000304c:	0ff7f793          	andi	a5,a5,255
    80003050:	00f68023          	sb	a5,0(a3)
    80003054:	00813403          	ld	s0,8(sp)
    80003058:	01010113          	addi	sp,sp,16
    8000305c:	00008067          	ret
    80003060:	0000006f          	j	80003060 <uartputc_sync+0x40>

0000000080003064 <uartstart>:
    80003064:	ff010113          	addi	sp,sp,-16
    80003068:	00813423          	sd	s0,8(sp)
    8000306c:	01010413          	addi	s0,sp,16
    80003070:	00001617          	auipc	a2,0x1
    80003074:	63060613          	addi	a2,a2,1584 # 800046a0 <uart_tx_r>
    80003078:	00001517          	auipc	a0,0x1
    8000307c:	63050513          	addi	a0,a0,1584 # 800046a8 <uart_tx_w>
    80003080:	00063783          	ld	a5,0(a2)
    80003084:	00053703          	ld	a4,0(a0)
    80003088:	04f70263          	beq	a4,a5,800030cc <uartstart+0x68>
    8000308c:	100005b7          	lui	a1,0x10000
    80003090:	00003817          	auipc	a6,0x3
    80003094:	89080813          	addi	a6,a6,-1904 # 80005920 <uart_tx_buf>
    80003098:	01c0006f          	j	800030b4 <uartstart+0x50>
    8000309c:	0006c703          	lbu	a4,0(a3)
    800030a0:	00f63023          	sd	a5,0(a2)
    800030a4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800030a8:	00063783          	ld	a5,0(a2)
    800030ac:	00053703          	ld	a4,0(a0)
    800030b0:	00f70e63          	beq	a4,a5,800030cc <uartstart+0x68>
    800030b4:	01f7f713          	andi	a4,a5,31
    800030b8:	00e806b3          	add	a3,a6,a4
    800030bc:	0055c703          	lbu	a4,5(a1)
    800030c0:	00178793          	addi	a5,a5,1
    800030c4:	02077713          	andi	a4,a4,32
    800030c8:	fc071ae3          	bnez	a4,8000309c <uartstart+0x38>
    800030cc:	00813403          	ld	s0,8(sp)
    800030d0:	01010113          	addi	sp,sp,16
    800030d4:	00008067          	ret

00000000800030d8 <uartgetc>:
    800030d8:	ff010113          	addi	sp,sp,-16
    800030dc:	00813423          	sd	s0,8(sp)
    800030e0:	01010413          	addi	s0,sp,16
    800030e4:	10000737          	lui	a4,0x10000
    800030e8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800030ec:	0017f793          	andi	a5,a5,1
    800030f0:	00078c63          	beqz	a5,80003108 <uartgetc+0x30>
    800030f4:	00074503          	lbu	a0,0(a4)
    800030f8:	0ff57513          	andi	a0,a0,255
    800030fc:	00813403          	ld	s0,8(sp)
    80003100:	01010113          	addi	sp,sp,16
    80003104:	00008067          	ret
    80003108:	fff00513          	li	a0,-1
    8000310c:	ff1ff06f          	j	800030fc <uartgetc+0x24>

0000000080003110 <uartintr>:
    80003110:	100007b7          	lui	a5,0x10000
    80003114:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003118:	0017f793          	andi	a5,a5,1
    8000311c:	0a078463          	beqz	a5,800031c4 <uartintr+0xb4>
    80003120:	fe010113          	addi	sp,sp,-32
    80003124:	00813823          	sd	s0,16(sp)
    80003128:	00913423          	sd	s1,8(sp)
    8000312c:	00113c23          	sd	ra,24(sp)
    80003130:	02010413          	addi	s0,sp,32
    80003134:	100004b7          	lui	s1,0x10000
    80003138:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000313c:	0ff57513          	andi	a0,a0,255
    80003140:	fffff097          	auipc	ra,0xfffff
    80003144:	534080e7          	jalr	1332(ra) # 80002674 <consoleintr>
    80003148:	0054c783          	lbu	a5,5(s1)
    8000314c:	0017f793          	andi	a5,a5,1
    80003150:	fe0794e3          	bnez	a5,80003138 <uartintr+0x28>
    80003154:	00001617          	auipc	a2,0x1
    80003158:	54c60613          	addi	a2,a2,1356 # 800046a0 <uart_tx_r>
    8000315c:	00001517          	auipc	a0,0x1
    80003160:	54c50513          	addi	a0,a0,1356 # 800046a8 <uart_tx_w>
    80003164:	00063783          	ld	a5,0(a2)
    80003168:	00053703          	ld	a4,0(a0)
    8000316c:	04f70263          	beq	a4,a5,800031b0 <uartintr+0xa0>
    80003170:	100005b7          	lui	a1,0x10000
    80003174:	00002817          	auipc	a6,0x2
    80003178:	7ac80813          	addi	a6,a6,1964 # 80005920 <uart_tx_buf>
    8000317c:	01c0006f          	j	80003198 <uartintr+0x88>
    80003180:	0006c703          	lbu	a4,0(a3)
    80003184:	00f63023          	sd	a5,0(a2)
    80003188:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000318c:	00063783          	ld	a5,0(a2)
    80003190:	00053703          	ld	a4,0(a0)
    80003194:	00f70e63          	beq	a4,a5,800031b0 <uartintr+0xa0>
    80003198:	01f7f713          	andi	a4,a5,31
    8000319c:	00e806b3          	add	a3,a6,a4
    800031a0:	0055c703          	lbu	a4,5(a1)
    800031a4:	00178793          	addi	a5,a5,1
    800031a8:	02077713          	andi	a4,a4,32
    800031ac:	fc071ae3          	bnez	a4,80003180 <uartintr+0x70>
    800031b0:	01813083          	ld	ra,24(sp)
    800031b4:	01013403          	ld	s0,16(sp)
    800031b8:	00813483          	ld	s1,8(sp)
    800031bc:	02010113          	addi	sp,sp,32
    800031c0:	00008067          	ret
    800031c4:	00001617          	auipc	a2,0x1
    800031c8:	4dc60613          	addi	a2,a2,1244 # 800046a0 <uart_tx_r>
    800031cc:	00001517          	auipc	a0,0x1
    800031d0:	4dc50513          	addi	a0,a0,1244 # 800046a8 <uart_tx_w>
    800031d4:	00063783          	ld	a5,0(a2)
    800031d8:	00053703          	ld	a4,0(a0)
    800031dc:	04f70263          	beq	a4,a5,80003220 <uartintr+0x110>
    800031e0:	100005b7          	lui	a1,0x10000
    800031e4:	00002817          	auipc	a6,0x2
    800031e8:	73c80813          	addi	a6,a6,1852 # 80005920 <uart_tx_buf>
    800031ec:	01c0006f          	j	80003208 <uartintr+0xf8>
    800031f0:	0006c703          	lbu	a4,0(a3)
    800031f4:	00f63023          	sd	a5,0(a2)
    800031f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800031fc:	00063783          	ld	a5,0(a2)
    80003200:	00053703          	ld	a4,0(a0)
    80003204:	02f70063          	beq	a4,a5,80003224 <uartintr+0x114>
    80003208:	01f7f713          	andi	a4,a5,31
    8000320c:	00e806b3          	add	a3,a6,a4
    80003210:	0055c703          	lbu	a4,5(a1)
    80003214:	00178793          	addi	a5,a5,1
    80003218:	02077713          	andi	a4,a4,32
    8000321c:	fc071ae3          	bnez	a4,800031f0 <uartintr+0xe0>
    80003220:	00008067          	ret
    80003224:	00008067          	ret

0000000080003228 <kinit>:
    80003228:	fc010113          	addi	sp,sp,-64
    8000322c:	02913423          	sd	s1,40(sp)
    80003230:	fffff7b7          	lui	a5,0xfffff
    80003234:	00003497          	auipc	s1,0x3
    80003238:	70b48493          	addi	s1,s1,1803 # 8000693f <end+0xfff>
    8000323c:	02813823          	sd	s0,48(sp)
    80003240:	01313c23          	sd	s3,24(sp)
    80003244:	00f4f4b3          	and	s1,s1,a5
    80003248:	02113c23          	sd	ra,56(sp)
    8000324c:	03213023          	sd	s2,32(sp)
    80003250:	01413823          	sd	s4,16(sp)
    80003254:	01513423          	sd	s5,8(sp)
    80003258:	04010413          	addi	s0,sp,64
    8000325c:	000017b7          	lui	a5,0x1
    80003260:	01100993          	li	s3,17
    80003264:	00f487b3          	add	a5,s1,a5
    80003268:	01b99993          	slli	s3,s3,0x1b
    8000326c:	06f9e063          	bltu	s3,a5,800032cc <kinit+0xa4>
    80003270:	00002a97          	auipc	s5,0x2
    80003274:	6d0a8a93          	addi	s5,s5,1744 # 80005940 <end>
    80003278:	0754ec63          	bltu	s1,s5,800032f0 <kinit+0xc8>
    8000327c:	0734fa63          	bgeu	s1,s3,800032f0 <kinit+0xc8>
    80003280:	00088a37          	lui	s4,0x88
    80003284:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003288:	00001917          	auipc	s2,0x1
    8000328c:	42890913          	addi	s2,s2,1064 # 800046b0 <kmem>
    80003290:	00ca1a13          	slli	s4,s4,0xc
    80003294:	0140006f          	j	800032a8 <kinit+0x80>
    80003298:	000017b7          	lui	a5,0x1
    8000329c:	00f484b3          	add	s1,s1,a5
    800032a0:	0554e863          	bltu	s1,s5,800032f0 <kinit+0xc8>
    800032a4:	0534f663          	bgeu	s1,s3,800032f0 <kinit+0xc8>
    800032a8:	00001637          	lui	a2,0x1
    800032ac:	00100593          	li	a1,1
    800032b0:	00048513          	mv	a0,s1
    800032b4:	00000097          	auipc	ra,0x0
    800032b8:	5e4080e7          	jalr	1508(ra) # 80003898 <__memset>
    800032bc:	00093783          	ld	a5,0(s2)
    800032c0:	00f4b023          	sd	a5,0(s1)
    800032c4:	00993023          	sd	s1,0(s2)
    800032c8:	fd4498e3          	bne	s1,s4,80003298 <kinit+0x70>
    800032cc:	03813083          	ld	ra,56(sp)
    800032d0:	03013403          	ld	s0,48(sp)
    800032d4:	02813483          	ld	s1,40(sp)
    800032d8:	02013903          	ld	s2,32(sp)
    800032dc:	01813983          	ld	s3,24(sp)
    800032e0:	01013a03          	ld	s4,16(sp)
    800032e4:	00813a83          	ld	s5,8(sp)
    800032e8:	04010113          	addi	sp,sp,64
    800032ec:	00008067          	ret
    800032f0:	00001517          	auipc	a0,0x1
    800032f4:	ea050513          	addi	a0,a0,-352 # 80004190 <digits+0x18>
    800032f8:	fffff097          	auipc	ra,0xfffff
    800032fc:	4b4080e7          	jalr	1204(ra) # 800027ac <panic>

0000000080003300 <freerange>:
    80003300:	fc010113          	addi	sp,sp,-64
    80003304:	000017b7          	lui	a5,0x1
    80003308:	02913423          	sd	s1,40(sp)
    8000330c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003310:	009504b3          	add	s1,a0,s1
    80003314:	fffff537          	lui	a0,0xfffff
    80003318:	02813823          	sd	s0,48(sp)
    8000331c:	02113c23          	sd	ra,56(sp)
    80003320:	03213023          	sd	s2,32(sp)
    80003324:	01313c23          	sd	s3,24(sp)
    80003328:	01413823          	sd	s4,16(sp)
    8000332c:	01513423          	sd	s5,8(sp)
    80003330:	01613023          	sd	s6,0(sp)
    80003334:	04010413          	addi	s0,sp,64
    80003338:	00a4f4b3          	and	s1,s1,a0
    8000333c:	00f487b3          	add	a5,s1,a5
    80003340:	06f5e463          	bltu	a1,a5,800033a8 <freerange+0xa8>
    80003344:	00002a97          	auipc	s5,0x2
    80003348:	5fca8a93          	addi	s5,s5,1532 # 80005940 <end>
    8000334c:	0954e263          	bltu	s1,s5,800033d0 <freerange+0xd0>
    80003350:	01100993          	li	s3,17
    80003354:	01b99993          	slli	s3,s3,0x1b
    80003358:	0734fc63          	bgeu	s1,s3,800033d0 <freerange+0xd0>
    8000335c:	00058a13          	mv	s4,a1
    80003360:	00001917          	auipc	s2,0x1
    80003364:	35090913          	addi	s2,s2,848 # 800046b0 <kmem>
    80003368:	00002b37          	lui	s6,0x2
    8000336c:	0140006f          	j	80003380 <freerange+0x80>
    80003370:	000017b7          	lui	a5,0x1
    80003374:	00f484b3          	add	s1,s1,a5
    80003378:	0554ec63          	bltu	s1,s5,800033d0 <freerange+0xd0>
    8000337c:	0534fa63          	bgeu	s1,s3,800033d0 <freerange+0xd0>
    80003380:	00001637          	lui	a2,0x1
    80003384:	00100593          	li	a1,1
    80003388:	00048513          	mv	a0,s1
    8000338c:	00000097          	auipc	ra,0x0
    80003390:	50c080e7          	jalr	1292(ra) # 80003898 <__memset>
    80003394:	00093703          	ld	a4,0(s2)
    80003398:	016487b3          	add	a5,s1,s6
    8000339c:	00e4b023          	sd	a4,0(s1)
    800033a0:	00993023          	sd	s1,0(s2)
    800033a4:	fcfa76e3          	bgeu	s4,a5,80003370 <freerange+0x70>
    800033a8:	03813083          	ld	ra,56(sp)
    800033ac:	03013403          	ld	s0,48(sp)
    800033b0:	02813483          	ld	s1,40(sp)
    800033b4:	02013903          	ld	s2,32(sp)
    800033b8:	01813983          	ld	s3,24(sp)
    800033bc:	01013a03          	ld	s4,16(sp)
    800033c0:	00813a83          	ld	s5,8(sp)
    800033c4:	00013b03          	ld	s6,0(sp)
    800033c8:	04010113          	addi	sp,sp,64
    800033cc:	00008067          	ret
    800033d0:	00001517          	auipc	a0,0x1
    800033d4:	dc050513          	addi	a0,a0,-576 # 80004190 <digits+0x18>
    800033d8:	fffff097          	auipc	ra,0xfffff
    800033dc:	3d4080e7          	jalr	980(ra) # 800027ac <panic>

00000000800033e0 <kfree>:
    800033e0:	fe010113          	addi	sp,sp,-32
    800033e4:	00813823          	sd	s0,16(sp)
    800033e8:	00113c23          	sd	ra,24(sp)
    800033ec:	00913423          	sd	s1,8(sp)
    800033f0:	02010413          	addi	s0,sp,32
    800033f4:	03451793          	slli	a5,a0,0x34
    800033f8:	04079c63          	bnez	a5,80003450 <kfree+0x70>
    800033fc:	00002797          	auipc	a5,0x2
    80003400:	54478793          	addi	a5,a5,1348 # 80005940 <end>
    80003404:	00050493          	mv	s1,a0
    80003408:	04f56463          	bltu	a0,a5,80003450 <kfree+0x70>
    8000340c:	01100793          	li	a5,17
    80003410:	01b79793          	slli	a5,a5,0x1b
    80003414:	02f57e63          	bgeu	a0,a5,80003450 <kfree+0x70>
    80003418:	00001637          	lui	a2,0x1
    8000341c:	00100593          	li	a1,1
    80003420:	00000097          	auipc	ra,0x0
    80003424:	478080e7          	jalr	1144(ra) # 80003898 <__memset>
    80003428:	00001797          	auipc	a5,0x1
    8000342c:	28878793          	addi	a5,a5,648 # 800046b0 <kmem>
    80003430:	0007b703          	ld	a4,0(a5)
    80003434:	01813083          	ld	ra,24(sp)
    80003438:	01013403          	ld	s0,16(sp)
    8000343c:	00e4b023          	sd	a4,0(s1)
    80003440:	0097b023          	sd	s1,0(a5)
    80003444:	00813483          	ld	s1,8(sp)
    80003448:	02010113          	addi	sp,sp,32
    8000344c:	00008067          	ret
    80003450:	00001517          	auipc	a0,0x1
    80003454:	d4050513          	addi	a0,a0,-704 # 80004190 <digits+0x18>
    80003458:	fffff097          	auipc	ra,0xfffff
    8000345c:	354080e7          	jalr	852(ra) # 800027ac <panic>

0000000080003460 <kalloc>:
    80003460:	fe010113          	addi	sp,sp,-32
    80003464:	00813823          	sd	s0,16(sp)
    80003468:	00913423          	sd	s1,8(sp)
    8000346c:	00113c23          	sd	ra,24(sp)
    80003470:	02010413          	addi	s0,sp,32
    80003474:	00001797          	auipc	a5,0x1
    80003478:	23c78793          	addi	a5,a5,572 # 800046b0 <kmem>
    8000347c:	0007b483          	ld	s1,0(a5)
    80003480:	02048063          	beqz	s1,800034a0 <kalloc+0x40>
    80003484:	0004b703          	ld	a4,0(s1)
    80003488:	00001637          	lui	a2,0x1
    8000348c:	00500593          	li	a1,5
    80003490:	00048513          	mv	a0,s1
    80003494:	00e7b023          	sd	a4,0(a5)
    80003498:	00000097          	auipc	ra,0x0
    8000349c:	400080e7          	jalr	1024(ra) # 80003898 <__memset>
    800034a0:	01813083          	ld	ra,24(sp)
    800034a4:	01013403          	ld	s0,16(sp)
    800034a8:	00048513          	mv	a0,s1
    800034ac:	00813483          	ld	s1,8(sp)
    800034b0:	02010113          	addi	sp,sp,32
    800034b4:	00008067          	ret

00000000800034b8 <initlock>:
    800034b8:	ff010113          	addi	sp,sp,-16
    800034bc:	00813423          	sd	s0,8(sp)
    800034c0:	01010413          	addi	s0,sp,16
    800034c4:	00813403          	ld	s0,8(sp)
    800034c8:	00b53423          	sd	a1,8(a0)
    800034cc:	00052023          	sw	zero,0(a0)
    800034d0:	00053823          	sd	zero,16(a0)
    800034d4:	01010113          	addi	sp,sp,16
    800034d8:	00008067          	ret

00000000800034dc <acquire>:
    800034dc:	fe010113          	addi	sp,sp,-32
    800034e0:	00813823          	sd	s0,16(sp)
    800034e4:	00913423          	sd	s1,8(sp)
    800034e8:	00113c23          	sd	ra,24(sp)
    800034ec:	01213023          	sd	s2,0(sp)
    800034f0:	02010413          	addi	s0,sp,32
    800034f4:	00050493          	mv	s1,a0
    800034f8:	10002973          	csrr	s2,sstatus
    800034fc:	100027f3          	csrr	a5,sstatus
    80003500:	ffd7f793          	andi	a5,a5,-3
    80003504:	10079073          	csrw	sstatus,a5
    80003508:	fffff097          	auipc	ra,0xfffff
    8000350c:	8ec080e7          	jalr	-1812(ra) # 80001df4 <mycpu>
    80003510:	07852783          	lw	a5,120(a0)
    80003514:	06078e63          	beqz	a5,80003590 <acquire+0xb4>
    80003518:	fffff097          	auipc	ra,0xfffff
    8000351c:	8dc080e7          	jalr	-1828(ra) # 80001df4 <mycpu>
    80003520:	07852783          	lw	a5,120(a0)
    80003524:	0004a703          	lw	a4,0(s1)
    80003528:	0017879b          	addiw	a5,a5,1
    8000352c:	06f52c23          	sw	a5,120(a0)
    80003530:	04071063          	bnez	a4,80003570 <acquire+0x94>
    80003534:	00100713          	li	a4,1
    80003538:	00070793          	mv	a5,a4
    8000353c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003540:	0007879b          	sext.w	a5,a5
    80003544:	fe079ae3          	bnez	a5,80003538 <acquire+0x5c>
    80003548:	0ff0000f          	fence
    8000354c:	fffff097          	auipc	ra,0xfffff
    80003550:	8a8080e7          	jalr	-1880(ra) # 80001df4 <mycpu>
    80003554:	01813083          	ld	ra,24(sp)
    80003558:	01013403          	ld	s0,16(sp)
    8000355c:	00a4b823          	sd	a0,16(s1)
    80003560:	00013903          	ld	s2,0(sp)
    80003564:	00813483          	ld	s1,8(sp)
    80003568:	02010113          	addi	sp,sp,32
    8000356c:	00008067          	ret
    80003570:	0104b903          	ld	s2,16(s1)
    80003574:	fffff097          	auipc	ra,0xfffff
    80003578:	880080e7          	jalr	-1920(ra) # 80001df4 <mycpu>
    8000357c:	faa91ce3          	bne	s2,a0,80003534 <acquire+0x58>
    80003580:	00001517          	auipc	a0,0x1
    80003584:	c1850513          	addi	a0,a0,-1000 # 80004198 <digits+0x20>
    80003588:	fffff097          	auipc	ra,0xfffff
    8000358c:	224080e7          	jalr	548(ra) # 800027ac <panic>
    80003590:	00195913          	srli	s2,s2,0x1
    80003594:	fffff097          	auipc	ra,0xfffff
    80003598:	860080e7          	jalr	-1952(ra) # 80001df4 <mycpu>
    8000359c:	00197913          	andi	s2,s2,1
    800035a0:	07252e23          	sw	s2,124(a0)
    800035a4:	f75ff06f          	j	80003518 <acquire+0x3c>

00000000800035a8 <release>:
    800035a8:	fe010113          	addi	sp,sp,-32
    800035ac:	00813823          	sd	s0,16(sp)
    800035b0:	00113c23          	sd	ra,24(sp)
    800035b4:	00913423          	sd	s1,8(sp)
    800035b8:	01213023          	sd	s2,0(sp)
    800035bc:	02010413          	addi	s0,sp,32
    800035c0:	00052783          	lw	a5,0(a0)
    800035c4:	00079a63          	bnez	a5,800035d8 <release+0x30>
    800035c8:	00001517          	auipc	a0,0x1
    800035cc:	bd850513          	addi	a0,a0,-1064 # 800041a0 <digits+0x28>
    800035d0:	fffff097          	auipc	ra,0xfffff
    800035d4:	1dc080e7          	jalr	476(ra) # 800027ac <panic>
    800035d8:	01053903          	ld	s2,16(a0)
    800035dc:	00050493          	mv	s1,a0
    800035e0:	fffff097          	auipc	ra,0xfffff
    800035e4:	814080e7          	jalr	-2028(ra) # 80001df4 <mycpu>
    800035e8:	fea910e3          	bne	s2,a0,800035c8 <release+0x20>
    800035ec:	0004b823          	sd	zero,16(s1)
    800035f0:	0ff0000f          	fence
    800035f4:	0f50000f          	fence	iorw,ow
    800035f8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800035fc:	ffffe097          	auipc	ra,0xffffe
    80003600:	7f8080e7          	jalr	2040(ra) # 80001df4 <mycpu>
    80003604:	100027f3          	csrr	a5,sstatus
    80003608:	0027f793          	andi	a5,a5,2
    8000360c:	04079a63          	bnez	a5,80003660 <release+0xb8>
    80003610:	07852783          	lw	a5,120(a0)
    80003614:	02f05e63          	blez	a5,80003650 <release+0xa8>
    80003618:	fff7871b          	addiw	a4,a5,-1
    8000361c:	06e52c23          	sw	a4,120(a0)
    80003620:	00071c63          	bnez	a4,80003638 <release+0x90>
    80003624:	07c52783          	lw	a5,124(a0)
    80003628:	00078863          	beqz	a5,80003638 <release+0x90>
    8000362c:	100027f3          	csrr	a5,sstatus
    80003630:	0027e793          	ori	a5,a5,2
    80003634:	10079073          	csrw	sstatus,a5
    80003638:	01813083          	ld	ra,24(sp)
    8000363c:	01013403          	ld	s0,16(sp)
    80003640:	00813483          	ld	s1,8(sp)
    80003644:	00013903          	ld	s2,0(sp)
    80003648:	02010113          	addi	sp,sp,32
    8000364c:	00008067          	ret
    80003650:	00001517          	auipc	a0,0x1
    80003654:	b7050513          	addi	a0,a0,-1168 # 800041c0 <digits+0x48>
    80003658:	fffff097          	auipc	ra,0xfffff
    8000365c:	154080e7          	jalr	340(ra) # 800027ac <panic>
    80003660:	00001517          	auipc	a0,0x1
    80003664:	b4850513          	addi	a0,a0,-1208 # 800041a8 <digits+0x30>
    80003668:	fffff097          	auipc	ra,0xfffff
    8000366c:	144080e7          	jalr	324(ra) # 800027ac <panic>

0000000080003670 <holding>:
    80003670:	00052783          	lw	a5,0(a0)
    80003674:	00079663          	bnez	a5,80003680 <holding+0x10>
    80003678:	00000513          	li	a0,0
    8000367c:	00008067          	ret
    80003680:	fe010113          	addi	sp,sp,-32
    80003684:	00813823          	sd	s0,16(sp)
    80003688:	00913423          	sd	s1,8(sp)
    8000368c:	00113c23          	sd	ra,24(sp)
    80003690:	02010413          	addi	s0,sp,32
    80003694:	01053483          	ld	s1,16(a0)
    80003698:	ffffe097          	auipc	ra,0xffffe
    8000369c:	75c080e7          	jalr	1884(ra) # 80001df4 <mycpu>
    800036a0:	01813083          	ld	ra,24(sp)
    800036a4:	01013403          	ld	s0,16(sp)
    800036a8:	40a48533          	sub	a0,s1,a0
    800036ac:	00153513          	seqz	a0,a0
    800036b0:	00813483          	ld	s1,8(sp)
    800036b4:	02010113          	addi	sp,sp,32
    800036b8:	00008067          	ret

00000000800036bc <push_off>:
    800036bc:	fe010113          	addi	sp,sp,-32
    800036c0:	00813823          	sd	s0,16(sp)
    800036c4:	00113c23          	sd	ra,24(sp)
    800036c8:	00913423          	sd	s1,8(sp)
    800036cc:	02010413          	addi	s0,sp,32
    800036d0:	100024f3          	csrr	s1,sstatus
    800036d4:	100027f3          	csrr	a5,sstatus
    800036d8:	ffd7f793          	andi	a5,a5,-3
    800036dc:	10079073          	csrw	sstatus,a5
    800036e0:	ffffe097          	auipc	ra,0xffffe
    800036e4:	714080e7          	jalr	1812(ra) # 80001df4 <mycpu>
    800036e8:	07852783          	lw	a5,120(a0)
    800036ec:	02078663          	beqz	a5,80003718 <push_off+0x5c>
    800036f0:	ffffe097          	auipc	ra,0xffffe
    800036f4:	704080e7          	jalr	1796(ra) # 80001df4 <mycpu>
    800036f8:	07852783          	lw	a5,120(a0)
    800036fc:	01813083          	ld	ra,24(sp)
    80003700:	01013403          	ld	s0,16(sp)
    80003704:	0017879b          	addiw	a5,a5,1
    80003708:	06f52c23          	sw	a5,120(a0)
    8000370c:	00813483          	ld	s1,8(sp)
    80003710:	02010113          	addi	sp,sp,32
    80003714:	00008067          	ret
    80003718:	0014d493          	srli	s1,s1,0x1
    8000371c:	ffffe097          	auipc	ra,0xffffe
    80003720:	6d8080e7          	jalr	1752(ra) # 80001df4 <mycpu>
    80003724:	0014f493          	andi	s1,s1,1
    80003728:	06952e23          	sw	s1,124(a0)
    8000372c:	fc5ff06f          	j	800036f0 <push_off+0x34>

0000000080003730 <pop_off>:
    80003730:	ff010113          	addi	sp,sp,-16
    80003734:	00813023          	sd	s0,0(sp)
    80003738:	00113423          	sd	ra,8(sp)
    8000373c:	01010413          	addi	s0,sp,16
    80003740:	ffffe097          	auipc	ra,0xffffe
    80003744:	6b4080e7          	jalr	1716(ra) # 80001df4 <mycpu>
    80003748:	100027f3          	csrr	a5,sstatus
    8000374c:	0027f793          	andi	a5,a5,2
    80003750:	04079663          	bnez	a5,8000379c <pop_off+0x6c>
    80003754:	07852783          	lw	a5,120(a0)
    80003758:	02f05a63          	blez	a5,8000378c <pop_off+0x5c>
    8000375c:	fff7871b          	addiw	a4,a5,-1
    80003760:	06e52c23          	sw	a4,120(a0)
    80003764:	00071c63          	bnez	a4,8000377c <pop_off+0x4c>
    80003768:	07c52783          	lw	a5,124(a0)
    8000376c:	00078863          	beqz	a5,8000377c <pop_off+0x4c>
    80003770:	100027f3          	csrr	a5,sstatus
    80003774:	0027e793          	ori	a5,a5,2
    80003778:	10079073          	csrw	sstatus,a5
    8000377c:	00813083          	ld	ra,8(sp)
    80003780:	00013403          	ld	s0,0(sp)
    80003784:	01010113          	addi	sp,sp,16
    80003788:	00008067          	ret
    8000378c:	00001517          	auipc	a0,0x1
    80003790:	a3450513          	addi	a0,a0,-1484 # 800041c0 <digits+0x48>
    80003794:	fffff097          	auipc	ra,0xfffff
    80003798:	018080e7          	jalr	24(ra) # 800027ac <panic>
    8000379c:	00001517          	auipc	a0,0x1
    800037a0:	a0c50513          	addi	a0,a0,-1524 # 800041a8 <digits+0x30>
    800037a4:	fffff097          	auipc	ra,0xfffff
    800037a8:	008080e7          	jalr	8(ra) # 800027ac <panic>

00000000800037ac <push_on>:
    800037ac:	fe010113          	addi	sp,sp,-32
    800037b0:	00813823          	sd	s0,16(sp)
    800037b4:	00113c23          	sd	ra,24(sp)
    800037b8:	00913423          	sd	s1,8(sp)
    800037bc:	02010413          	addi	s0,sp,32
    800037c0:	100024f3          	csrr	s1,sstatus
    800037c4:	100027f3          	csrr	a5,sstatus
    800037c8:	0027e793          	ori	a5,a5,2
    800037cc:	10079073          	csrw	sstatus,a5
    800037d0:	ffffe097          	auipc	ra,0xffffe
    800037d4:	624080e7          	jalr	1572(ra) # 80001df4 <mycpu>
    800037d8:	07852783          	lw	a5,120(a0)
    800037dc:	02078663          	beqz	a5,80003808 <push_on+0x5c>
    800037e0:	ffffe097          	auipc	ra,0xffffe
    800037e4:	614080e7          	jalr	1556(ra) # 80001df4 <mycpu>
    800037e8:	07852783          	lw	a5,120(a0)
    800037ec:	01813083          	ld	ra,24(sp)
    800037f0:	01013403          	ld	s0,16(sp)
    800037f4:	0017879b          	addiw	a5,a5,1
    800037f8:	06f52c23          	sw	a5,120(a0)
    800037fc:	00813483          	ld	s1,8(sp)
    80003800:	02010113          	addi	sp,sp,32
    80003804:	00008067          	ret
    80003808:	0014d493          	srli	s1,s1,0x1
    8000380c:	ffffe097          	auipc	ra,0xffffe
    80003810:	5e8080e7          	jalr	1512(ra) # 80001df4 <mycpu>
    80003814:	0014f493          	andi	s1,s1,1
    80003818:	06952e23          	sw	s1,124(a0)
    8000381c:	fc5ff06f          	j	800037e0 <push_on+0x34>

0000000080003820 <pop_on>:
    80003820:	ff010113          	addi	sp,sp,-16
    80003824:	00813023          	sd	s0,0(sp)
    80003828:	00113423          	sd	ra,8(sp)
    8000382c:	01010413          	addi	s0,sp,16
    80003830:	ffffe097          	auipc	ra,0xffffe
    80003834:	5c4080e7          	jalr	1476(ra) # 80001df4 <mycpu>
    80003838:	100027f3          	csrr	a5,sstatus
    8000383c:	0027f793          	andi	a5,a5,2
    80003840:	04078463          	beqz	a5,80003888 <pop_on+0x68>
    80003844:	07852783          	lw	a5,120(a0)
    80003848:	02f05863          	blez	a5,80003878 <pop_on+0x58>
    8000384c:	fff7879b          	addiw	a5,a5,-1
    80003850:	06f52c23          	sw	a5,120(a0)
    80003854:	07853783          	ld	a5,120(a0)
    80003858:	00079863          	bnez	a5,80003868 <pop_on+0x48>
    8000385c:	100027f3          	csrr	a5,sstatus
    80003860:	ffd7f793          	andi	a5,a5,-3
    80003864:	10079073          	csrw	sstatus,a5
    80003868:	00813083          	ld	ra,8(sp)
    8000386c:	00013403          	ld	s0,0(sp)
    80003870:	01010113          	addi	sp,sp,16
    80003874:	00008067          	ret
    80003878:	00001517          	auipc	a0,0x1
    8000387c:	97050513          	addi	a0,a0,-1680 # 800041e8 <digits+0x70>
    80003880:	fffff097          	auipc	ra,0xfffff
    80003884:	f2c080e7          	jalr	-212(ra) # 800027ac <panic>
    80003888:	00001517          	auipc	a0,0x1
    8000388c:	94050513          	addi	a0,a0,-1728 # 800041c8 <digits+0x50>
    80003890:	fffff097          	auipc	ra,0xfffff
    80003894:	f1c080e7          	jalr	-228(ra) # 800027ac <panic>

0000000080003898 <__memset>:
    80003898:	ff010113          	addi	sp,sp,-16
    8000389c:	00813423          	sd	s0,8(sp)
    800038a0:	01010413          	addi	s0,sp,16
    800038a4:	1a060e63          	beqz	a2,80003a60 <__memset+0x1c8>
    800038a8:	40a007b3          	neg	a5,a0
    800038ac:	0077f793          	andi	a5,a5,7
    800038b0:	00778693          	addi	a3,a5,7
    800038b4:	00b00813          	li	a6,11
    800038b8:	0ff5f593          	andi	a1,a1,255
    800038bc:	fff6071b          	addiw	a4,a2,-1
    800038c0:	1b06e663          	bltu	a3,a6,80003a6c <__memset+0x1d4>
    800038c4:	1cd76463          	bltu	a4,a3,80003a8c <__memset+0x1f4>
    800038c8:	1a078e63          	beqz	a5,80003a84 <__memset+0x1ec>
    800038cc:	00b50023          	sb	a1,0(a0)
    800038d0:	00100713          	li	a4,1
    800038d4:	1ae78463          	beq	a5,a4,80003a7c <__memset+0x1e4>
    800038d8:	00b500a3          	sb	a1,1(a0)
    800038dc:	00200713          	li	a4,2
    800038e0:	1ae78a63          	beq	a5,a4,80003a94 <__memset+0x1fc>
    800038e4:	00b50123          	sb	a1,2(a0)
    800038e8:	00300713          	li	a4,3
    800038ec:	18e78463          	beq	a5,a4,80003a74 <__memset+0x1dc>
    800038f0:	00b501a3          	sb	a1,3(a0)
    800038f4:	00400713          	li	a4,4
    800038f8:	1ae78263          	beq	a5,a4,80003a9c <__memset+0x204>
    800038fc:	00b50223          	sb	a1,4(a0)
    80003900:	00500713          	li	a4,5
    80003904:	1ae78063          	beq	a5,a4,80003aa4 <__memset+0x20c>
    80003908:	00b502a3          	sb	a1,5(a0)
    8000390c:	00700713          	li	a4,7
    80003910:	18e79e63          	bne	a5,a4,80003aac <__memset+0x214>
    80003914:	00b50323          	sb	a1,6(a0)
    80003918:	00700e93          	li	t4,7
    8000391c:	00859713          	slli	a4,a1,0x8
    80003920:	00e5e733          	or	a4,a1,a4
    80003924:	01059e13          	slli	t3,a1,0x10
    80003928:	01c76e33          	or	t3,a4,t3
    8000392c:	01859313          	slli	t1,a1,0x18
    80003930:	006e6333          	or	t1,t3,t1
    80003934:	02059893          	slli	a7,a1,0x20
    80003938:	40f60e3b          	subw	t3,a2,a5
    8000393c:	011368b3          	or	a7,t1,a7
    80003940:	02859813          	slli	a6,a1,0x28
    80003944:	0108e833          	or	a6,a7,a6
    80003948:	03059693          	slli	a3,a1,0x30
    8000394c:	003e589b          	srliw	a7,t3,0x3
    80003950:	00d866b3          	or	a3,a6,a3
    80003954:	03859713          	slli	a4,a1,0x38
    80003958:	00389813          	slli	a6,a7,0x3
    8000395c:	00f507b3          	add	a5,a0,a5
    80003960:	00e6e733          	or	a4,a3,a4
    80003964:	000e089b          	sext.w	a7,t3
    80003968:	00f806b3          	add	a3,a6,a5
    8000396c:	00e7b023          	sd	a4,0(a5)
    80003970:	00878793          	addi	a5,a5,8
    80003974:	fed79ce3          	bne	a5,a3,8000396c <__memset+0xd4>
    80003978:	ff8e7793          	andi	a5,t3,-8
    8000397c:	0007871b          	sext.w	a4,a5
    80003980:	01d787bb          	addw	a5,a5,t4
    80003984:	0ce88e63          	beq	a7,a4,80003a60 <__memset+0x1c8>
    80003988:	00f50733          	add	a4,a0,a5
    8000398c:	00b70023          	sb	a1,0(a4)
    80003990:	0017871b          	addiw	a4,a5,1
    80003994:	0cc77663          	bgeu	a4,a2,80003a60 <__memset+0x1c8>
    80003998:	00e50733          	add	a4,a0,a4
    8000399c:	00b70023          	sb	a1,0(a4)
    800039a0:	0027871b          	addiw	a4,a5,2
    800039a4:	0ac77e63          	bgeu	a4,a2,80003a60 <__memset+0x1c8>
    800039a8:	00e50733          	add	a4,a0,a4
    800039ac:	00b70023          	sb	a1,0(a4)
    800039b0:	0037871b          	addiw	a4,a5,3
    800039b4:	0ac77663          	bgeu	a4,a2,80003a60 <__memset+0x1c8>
    800039b8:	00e50733          	add	a4,a0,a4
    800039bc:	00b70023          	sb	a1,0(a4)
    800039c0:	0047871b          	addiw	a4,a5,4
    800039c4:	08c77e63          	bgeu	a4,a2,80003a60 <__memset+0x1c8>
    800039c8:	00e50733          	add	a4,a0,a4
    800039cc:	00b70023          	sb	a1,0(a4)
    800039d0:	0057871b          	addiw	a4,a5,5
    800039d4:	08c77663          	bgeu	a4,a2,80003a60 <__memset+0x1c8>
    800039d8:	00e50733          	add	a4,a0,a4
    800039dc:	00b70023          	sb	a1,0(a4)
    800039e0:	0067871b          	addiw	a4,a5,6
    800039e4:	06c77e63          	bgeu	a4,a2,80003a60 <__memset+0x1c8>
    800039e8:	00e50733          	add	a4,a0,a4
    800039ec:	00b70023          	sb	a1,0(a4)
    800039f0:	0077871b          	addiw	a4,a5,7
    800039f4:	06c77663          	bgeu	a4,a2,80003a60 <__memset+0x1c8>
    800039f8:	00e50733          	add	a4,a0,a4
    800039fc:	00b70023          	sb	a1,0(a4)
    80003a00:	0087871b          	addiw	a4,a5,8
    80003a04:	04c77e63          	bgeu	a4,a2,80003a60 <__memset+0x1c8>
    80003a08:	00e50733          	add	a4,a0,a4
    80003a0c:	00b70023          	sb	a1,0(a4)
    80003a10:	0097871b          	addiw	a4,a5,9
    80003a14:	04c77663          	bgeu	a4,a2,80003a60 <__memset+0x1c8>
    80003a18:	00e50733          	add	a4,a0,a4
    80003a1c:	00b70023          	sb	a1,0(a4)
    80003a20:	00a7871b          	addiw	a4,a5,10
    80003a24:	02c77e63          	bgeu	a4,a2,80003a60 <__memset+0x1c8>
    80003a28:	00e50733          	add	a4,a0,a4
    80003a2c:	00b70023          	sb	a1,0(a4)
    80003a30:	00b7871b          	addiw	a4,a5,11
    80003a34:	02c77663          	bgeu	a4,a2,80003a60 <__memset+0x1c8>
    80003a38:	00e50733          	add	a4,a0,a4
    80003a3c:	00b70023          	sb	a1,0(a4)
    80003a40:	00c7871b          	addiw	a4,a5,12
    80003a44:	00c77e63          	bgeu	a4,a2,80003a60 <__memset+0x1c8>
    80003a48:	00e50733          	add	a4,a0,a4
    80003a4c:	00b70023          	sb	a1,0(a4)
    80003a50:	00d7879b          	addiw	a5,a5,13
    80003a54:	00c7f663          	bgeu	a5,a2,80003a60 <__memset+0x1c8>
    80003a58:	00f507b3          	add	a5,a0,a5
    80003a5c:	00b78023          	sb	a1,0(a5)
    80003a60:	00813403          	ld	s0,8(sp)
    80003a64:	01010113          	addi	sp,sp,16
    80003a68:	00008067          	ret
    80003a6c:	00b00693          	li	a3,11
    80003a70:	e55ff06f          	j	800038c4 <__memset+0x2c>
    80003a74:	00300e93          	li	t4,3
    80003a78:	ea5ff06f          	j	8000391c <__memset+0x84>
    80003a7c:	00100e93          	li	t4,1
    80003a80:	e9dff06f          	j	8000391c <__memset+0x84>
    80003a84:	00000e93          	li	t4,0
    80003a88:	e95ff06f          	j	8000391c <__memset+0x84>
    80003a8c:	00000793          	li	a5,0
    80003a90:	ef9ff06f          	j	80003988 <__memset+0xf0>
    80003a94:	00200e93          	li	t4,2
    80003a98:	e85ff06f          	j	8000391c <__memset+0x84>
    80003a9c:	00400e93          	li	t4,4
    80003aa0:	e7dff06f          	j	8000391c <__memset+0x84>
    80003aa4:	00500e93          	li	t4,5
    80003aa8:	e75ff06f          	j	8000391c <__memset+0x84>
    80003aac:	00600e93          	li	t4,6
    80003ab0:	e6dff06f          	j	8000391c <__memset+0x84>

0000000080003ab4 <__memmove>:
    80003ab4:	ff010113          	addi	sp,sp,-16
    80003ab8:	00813423          	sd	s0,8(sp)
    80003abc:	01010413          	addi	s0,sp,16
    80003ac0:	0e060863          	beqz	a2,80003bb0 <__memmove+0xfc>
    80003ac4:	fff6069b          	addiw	a3,a2,-1
    80003ac8:	0006881b          	sext.w	a6,a3
    80003acc:	0ea5e863          	bltu	a1,a0,80003bbc <__memmove+0x108>
    80003ad0:	00758713          	addi	a4,a1,7
    80003ad4:	00a5e7b3          	or	a5,a1,a0
    80003ad8:	40a70733          	sub	a4,a4,a0
    80003adc:	0077f793          	andi	a5,a5,7
    80003ae0:	00f73713          	sltiu	a4,a4,15
    80003ae4:	00174713          	xori	a4,a4,1
    80003ae8:	0017b793          	seqz	a5,a5
    80003aec:	00e7f7b3          	and	a5,a5,a4
    80003af0:	10078863          	beqz	a5,80003c00 <__memmove+0x14c>
    80003af4:	00900793          	li	a5,9
    80003af8:	1107f463          	bgeu	a5,a6,80003c00 <__memmove+0x14c>
    80003afc:	0036581b          	srliw	a6,a2,0x3
    80003b00:	fff8081b          	addiw	a6,a6,-1
    80003b04:	02081813          	slli	a6,a6,0x20
    80003b08:	01d85893          	srli	a7,a6,0x1d
    80003b0c:	00858813          	addi	a6,a1,8
    80003b10:	00058793          	mv	a5,a1
    80003b14:	00050713          	mv	a4,a0
    80003b18:	01088833          	add	a6,a7,a6
    80003b1c:	0007b883          	ld	a7,0(a5)
    80003b20:	00878793          	addi	a5,a5,8
    80003b24:	00870713          	addi	a4,a4,8
    80003b28:	ff173c23          	sd	a7,-8(a4)
    80003b2c:	ff0798e3          	bne	a5,a6,80003b1c <__memmove+0x68>
    80003b30:	ff867713          	andi	a4,a2,-8
    80003b34:	02071793          	slli	a5,a4,0x20
    80003b38:	0207d793          	srli	a5,a5,0x20
    80003b3c:	00f585b3          	add	a1,a1,a5
    80003b40:	40e686bb          	subw	a3,a3,a4
    80003b44:	00f507b3          	add	a5,a0,a5
    80003b48:	06e60463          	beq	a2,a4,80003bb0 <__memmove+0xfc>
    80003b4c:	0005c703          	lbu	a4,0(a1)
    80003b50:	00e78023          	sb	a4,0(a5)
    80003b54:	04068e63          	beqz	a3,80003bb0 <__memmove+0xfc>
    80003b58:	0015c603          	lbu	a2,1(a1)
    80003b5c:	00100713          	li	a4,1
    80003b60:	00c780a3          	sb	a2,1(a5)
    80003b64:	04e68663          	beq	a3,a4,80003bb0 <__memmove+0xfc>
    80003b68:	0025c603          	lbu	a2,2(a1)
    80003b6c:	00200713          	li	a4,2
    80003b70:	00c78123          	sb	a2,2(a5)
    80003b74:	02e68e63          	beq	a3,a4,80003bb0 <__memmove+0xfc>
    80003b78:	0035c603          	lbu	a2,3(a1)
    80003b7c:	00300713          	li	a4,3
    80003b80:	00c781a3          	sb	a2,3(a5)
    80003b84:	02e68663          	beq	a3,a4,80003bb0 <__memmove+0xfc>
    80003b88:	0045c603          	lbu	a2,4(a1)
    80003b8c:	00400713          	li	a4,4
    80003b90:	00c78223          	sb	a2,4(a5)
    80003b94:	00e68e63          	beq	a3,a4,80003bb0 <__memmove+0xfc>
    80003b98:	0055c603          	lbu	a2,5(a1)
    80003b9c:	00500713          	li	a4,5
    80003ba0:	00c782a3          	sb	a2,5(a5)
    80003ba4:	00e68663          	beq	a3,a4,80003bb0 <__memmove+0xfc>
    80003ba8:	0065c703          	lbu	a4,6(a1)
    80003bac:	00e78323          	sb	a4,6(a5)
    80003bb0:	00813403          	ld	s0,8(sp)
    80003bb4:	01010113          	addi	sp,sp,16
    80003bb8:	00008067          	ret
    80003bbc:	02061713          	slli	a4,a2,0x20
    80003bc0:	02075713          	srli	a4,a4,0x20
    80003bc4:	00e587b3          	add	a5,a1,a4
    80003bc8:	f0f574e3          	bgeu	a0,a5,80003ad0 <__memmove+0x1c>
    80003bcc:	02069613          	slli	a2,a3,0x20
    80003bd0:	02065613          	srli	a2,a2,0x20
    80003bd4:	fff64613          	not	a2,a2
    80003bd8:	00e50733          	add	a4,a0,a4
    80003bdc:	00c78633          	add	a2,a5,a2
    80003be0:	fff7c683          	lbu	a3,-1(a5)
    80003be4:	fff78793          	addi	a5,a5,-1
    80003be8:	fff70713          	addi	a4,a4,-1
    80003bec:	00d70023          	sb	a3,0(a4)
    80003bf0:	fec798e3          	bne	a5,a2,80003be0 <__memmove+0x12c>
    80003bf4:	00813403          	ld	s0,8(sp)
    80003bf8:	01010113          	addi	sp,sp,16
    80003bfc:	00008067          	ret
    80003c00:	02069713          	slli	a4,a3,0x20
    80003c04:	02075713          	srli	a4,a4,0x20
    80003c08:	00170713          	addi	a4,a4,1
    80003c0c:	00e50733          	add	a4,a0,a4
    80003c10:	00050793          	mv	a5,a0
    80003c14:	0005c683          	lbu	a3,0(a1)
    80003c18:	00178793          	addi	a5,a5,1
    80003c1c:	00158593          	addi	a1,a1,1
    80003c20:	fed78fa3          	sb	a3,-1(a5)
    80003c24:	fee798e3          	bne	a5,a4,80003c14 <__memmove+0x160>
    80003c28:	f89ff06f          	j	80003bb0 <__memmove+0xfc>

0000000080003c2c <__putc>:
    80003c2c:	fe010113          	addi	sp,sp,-32
    80003c30:	00813823          	sd	s0,16(sp)
    80003c34:	00113c23          	sd	ra,24(sp)
    80003c38:	02010413          	addi	s0,sp,32
    80003c3c:	00050793          	mv	a5,a0
    80003c40:	fef40593          	addi	a1,s0,-17
    80003c44:	00100613          	li	a2,1
    80003c48:	00000513          	li	a0,0
    80003c4c:	fef407a3          	sb	a5,-17(s0)
    80003c50:	fffff097          	auipc	ra,0xfffff
    80003c54:	b3c080e7          	jalr	-1220(ra) # 8000278c <console_write>
    80003c58:	01813083          	ld	ra,24(sp)
    80003c5c:	01013403          	ld	s0,16(sp)
    80003c60:	02010113          	addi	sp,sp,32
    80003c64:	00008067          	ret

0000000080003c68 <__getc>:
    80003c68:	fe010113          	addi	sp,sp,-32
    80003c6c:	00813823          	sd	s0,16(sp)
    80003c70:	00113c23          	sd	ra,24(sp)
    80003c74:	02010413          	addi	s0,sp,32
    80003c78:	fe840593          	addi	a1,s0,-24
    80003c7c:	00100613          	li	a2,1
    80003c80:	00000513          	li	a0,0
    80003c84:	fffff097          	auipc	ra,0xfffff
    80003c88:	ae8080e7          	jalr	-1304(ra) # 8000276c <console_read>
    80003c8c:	fe844503          	lbu	a0,-24(s0)
    80003c90:	01813083          	ld	ra,24(sp)
    80003c94:	01013403          	ld	s0,16(sp)
    80003c98:	02010113          	addi	sp,sp,32
    80003c9c:	00008067          	ret

0000000080003ca0 <console_handler>:
    80003ca0:	fe010113          	addi	sp,sp,-32
    80003ca4:	00813823          	sd	s0,16(sp)
    80003ca8:	00113c23          	sd	ra,24(sp)
    80003cac:	00913423          	sd	s1,8(sp)
    80003cb0:	02010413          	addi	s0,sp,32
    80003cb4:	14202773          	csrr	a4,scause
    80003cb8:	100027f3          	csrr	a5,sstatus
    80003cbc:	0027f793          	andi	a5,a5,2
    80003cc0:	06079e63          	bnez	a5,80003d3c <console_handler+0x9c>
    80003cc4:	00074c63          	bltz	a4,80003cdc <console_handler+0x3c>
    80003cc8:	01813083          	ld	ra,24(sp)
    80003ccc:	01013403          	ld	s0,16(sp)
    80003cd0:	00813483          	ld	s1,8(sp)
    80003cd4:	02010113          	addi	sp,sp,32
    80003cd8:	00008067          	ret
    80003cdc:	0ff77713          	andi	a4,a4,255
    80003ce0:	00900793          	li	a5,9
    80003ce4:	fef712e3          	bne	a4,a5,80003cc8 <console_handler+0x28>
    80003ce8:	ffffe097          	auipc	ra,0xffffe
    80003cec:	6dc080e7          	jalr	1756(ra) # 800023c4 <plic_claim>
    80003cf0:	00a00793          	li	a5,10
    80003cf4:	00050493          	mv	s1,a0
    80003cf8:	02f50c63          	beq	a0,a5,80003d30 <console_handler+0x90>
    80003cfc:	fc0506e3          	beqz	a0,80003cc8 <console_handler+0x28>
    80003d00:	00050593          	mv	a1,a0
    80003d04:	00000517          	auipc	a0,0x0
    80003d08:	3ec50513          	addi	a0,a0,1004 # 800040f0 <CONSOLE_STATUS+0xe0>
    80003d0c:	fffff097          	auipc	ra,0xfffff
    80003d10:	afc080e7          	jalr	-1284(ra) # 80002808 <__printf>
    80003d14:	01013403          	ld	s0,16(sp)
    80003d18:	01813083          	ld	ra,24(sp)
    80003d1c:	00048513          	mv	a0,s1
    80003d20:	00813483          	ld	s1,8(sp)
    80003d24:	02010113          	addi	sp,sp,32
    80003d28:	ffffe317          	auipc	t1,0xffffe
    80003d2c:	6d430067          	jr	1748(t1) # 800023fc <plic_complete>
    80003d30:	fffff097          	auipc	ra,0xfffff
    80003d34:	3e0080e7          	jalr	992(ra) # 80003110 <uartintr>
    80003d38:	fddff06f          	j	80003d14 <console_handler+0x74>
    80003d3c:	00000517          	auipc	a0,0x0
    80003d40:	4b450513          	addi	a0,a0,1204 # 800041f0 <digits+0x78>
    80003d44:	fffff097          	auipc	ra,0xfffff
    80003d48:	a68080e7          	jalr	-1432(ra) # 800027ac <panic>
	...
