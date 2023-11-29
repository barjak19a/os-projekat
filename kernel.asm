
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	99013103          	ld	sp,-1648(sp) # 80005990 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	0d4020ef          	jal	ra,800020f0 <start>

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
    800010a4:	275000ef          	jal	ra,80001b18 <_ZN5riscv20handleSupervisorTrapEv>

    sd a0, 10*8(sp)
    800010a8:	04a13823          	sd	a0,80(sp)
    # x0 ozicen na nulu
    # x1 cuvamo u  okviru same strukture konteksta
    # x2 cuvamo u okvritu same strukture konteksta
    .irp index 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index *8(sp)
    .endr
    800010ac:	00013003          	ld	zero,0(sp)
    800010b0:	00813083          	ld	ra,8(sp)
    800010b4:	01013103          	ld	sp,16(sp)
    800010b8:	01813183          	ld	gp,24(sp)
    800010bc:	02013203          	ld	tp,32(sp)
    800010c0:	02813283          	ld	t0,40(sp)
    800010c4:	03013303          	ld	t1,48(sp)
    800010c8:	03813383          	ld	t2,56(sp)
    800010cc:	04013403          	ld	s0,64(sp)
    800010d0:	04813483          	ld	s1,72(sp)
    800010d4:	05813583          	ld	a1,88(sp)
    800010d8:	06013603          	ld	a2,96(sp)
    800010dc:	06813683          	ld	a3,104(sp)
    800010e0:	07013703          	ld	a4,112(sp)
    800010e4:	07813783          	ld	a5,120(sp)
    800010e8:	08013803          	ld	a6,128(sp)
    800010ec:	08813883          	ld	a7,136(sp)
    800010f0:	09013903          	ld	s2,144(sp)
    800010f4:	09813983          	ld	s3,152(sp)
    800010f8:	0a013a03          	ld	s4,160(sp)
    800010fc:	0a813a83          	ld	s5,168(sp)
    80001100:	0b013b03          	ld	s6,176(sp)
    80001104:	0b813b83          	ld	s7,184(sp)
    80001108:	0c013c03          	ld	s8,192(sp)
    8000110c:	0c813c83          	ld	s9,200(sp)
    80001110:	0d013d03          	ld	s10,208(sp)
    80001114:	0d813d83          	ld	s11,216(sp)
    80001118:	0e013e03          	ld	t3,224(sp)
    8000111c:	0e813e83          	ld	t4,232(sp)
    80001120:	0f013f03          	ld	t5,240(sp)
    80001124:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001128:	10010113          	addi	sp,sp,256


    8000112c:	10200073          	sret

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

#include "../h/syscall_c.hpp"
#include "../lib/console.h"
#include "../h/_thread.hpp"

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

0000000080001164 <_Z9mem_allocm>:
//    uint64 volatile ret_val;
//    __asm__ volatile ("mv %0, a0":"=r"(ret_val));
//    return  ret_val;
//}

void* mem_alloc(size_t size){
    80001164:	ff010113          	addi	sp,sp,-16
    80001168:	00113423          	sd	ra,8(sp)
    8000116c:	00813023          	sd	s0,0(sp)
    80001170:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0": : "r"(size));
    80001174:	00050593          	mv	a1,a0
    callOperation(0x1);
    80001178:	00100513          	li	a0,1
    8000117c:	00000097          	auipc	ra,0x0
    80001180:	fc8080e7          	jalr	-56(ra) # 80001144 <_Z13callOperationm>
//    return (void*)ret();
    void* ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80001184:	00050513          	mv	a0,a0

    return ret;
}
    80001188:	00813083          	ld	ra,8(sp)
    8000118c:	00013403          	ld	s0,0(sp)
    80001190:	01010113          	addi	sp,sp,16
    80001194:	00008067          	ret

0000000080001198 <_Z8mem_freePv>:

int mem_free(void* adr){
    80001198:	ff010113          	addi	sp,sp,-16
    8000119c:	00113423          	sd	ra,8(sp)
    800011a0:	00813023          	sd	s0,0(sp)
    800011a4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0": : "r"(adr));
    800011a8:	00050593          	mv	a1,a0
    callOperation(0x2);
    800011ac:	00200513          	li	a0,2
    800011b0:	00000097          	auipc	ra,0x0
    800011b4:	f94080e7          	jalr	-108(ra) # 80001144 <_Z13callOperationm>
    return 1;
}
    800011b8:	00100513          	li	a0,1
    800011bc:	00813083          	ld	ra,8(sp)
    800011c0:	00013403          	ld	s0,0(sp)
    800011c4:	01010113          	addi	sp,sp,16
    800011c8:	00008067          	ret

00000000800011cc <_Z4getcv>:

char getc(){
    800011cc:	fe010113          	addi	sp,sp,-32
    800011d0:	00113c23          	sd	ra,24(sp)
    800011d4:	00813823          	sd	s0,16(sp)
    800011d8:	02010413          	addi	s0,sp,32
    callOperation(0x41);
    800011dc:	04100513          	li	a0,65
    800011e0:	00000097          	auipc	ra,0x0
    800011e4:	f64080e7          	jalr	-156(ra) # 80001144 <_Z13callOperationm>
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    800011e8:	00050793          	mv	a5,a0
    800011ec:	fef43423          	sd	a5,-24(s0)
    return (char)ret;
    800011f0:	fe843503          	ld	a0,-24(s0)
}
    800011f4:	0ff57513          	andi	a0,a0,255
    800011f8:	01813083          	ld	ra,24(sp)
    800011fc:	01013403          	ld	s0,16(sp)
    80001200:	02010113          	addi	sp,sp,32
    80001204:	00008067          	ret

0000000080001208 <_Z4putcc>:

void putc(char c){
    80001208:	ff010113          	addi	sp,sp,-16
    8000120c:	00113423          	sd	ra,8(sp)
    80001210:	00813023          	sd	s0,0(sp)
    80001214:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0": : "r"(c));
    80001218:	00050593          	mv	a1,a0
    callOperation(0x42);
    8000121c:	04200513          	li	a0,66
    80001220:	00000097          	auipc	ra,0x0
    80001224:	f24080e7          	jalr	-220(ra) # 80001144 <_Z13callOperationm>
}
    80001228:	00813083          	ld	ra,8(sp)
    8000122c:	00013403          	ld	s0,0(sp)
    80001230:	01010113          	addi	sp,sp,16
    80001234:	00008067          	ret

0000000080001238 <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    80001238:	ff010113          	addi	sp,sp,-16
    8000123c:	00113423          	sd	ra,8(sp)
    80001240:	00813023          	sd	s0,0(sp)
    80001244:	01010413          	addi	s0,sp,16
    size_t argument1;
    size_t argument2;
    size_t argument3;
    void* stackSpace = mem_alloc(DEFAULT_STACK_SIZE);
    80001248:	00001537          	lui	a0,0x1
    8000124c:	00000097          	auipc	ra,0x0
    80001250:	f18080e7          	jalr	-232(ra) # 80001164 <_Z9mem_allocm>
    __asm__ volatile("mv %0, a0" : "=r" (argument1));
    80001254:	00050693          	mv	a3,a0
    __asm__ volatile("mv %0, a1" : "=r" (argument2));
    80001258:	00058713          	mv	a4,a1
    __asm__ volatile("mv %0, a2" : "=r" (argument3));
    8000125c:	00060793          	mv	a5,a2

    __asm__ volatile("mv a1, %0" : : "r" ((thread_t*)argument1));
    80001260:	00068593          	mv	a1,a3
    __asm__ volatile("mv a2, %0" : : "r" ((_thread::Body)argument2));
    80001264:	00070613          	mv	a2,a4
    __asm__ volatile("mv t0, %0" : : "r" ((void*)argument3));
    80001268:	00078293          	mv	t0,a5
    __asm__ volatile("mv t1, %0" : : "r" (stackSpace));
    8000126c:	00050313          	mv	t1,a0

    /*__asm__ volatile ("mv a1, %0": : "r"(&handle));
    __asm__ volatile ("mv a2, %0": : "r"(start_routine));
    __asm__ volatile ("mv a3, %0": : "r"(arg));*/
    callOperation(0x11);
    80001270:	01100513          	li	a0,17
    80001274:	00000097          	auipc	ra,0x0
    80001278:	ed0080e7          	jalr	-304(ra) # 80001144 <_Z13callOperationm>
    return 1;
}
    8000127c:	00100513          	li	a0,1
    80001280:	00813083          	ld	ra,8(sp)
    80001284:	00013403          	ld	s0,0(sp)
    80001288:	01010113          	addi	sp,sp,16
    8000128c:	00008067          	ret

0000000080001290 <_Z15thread_dispatchv>:

void thread_dispatch(){
    80001290:	ff010113          	addi	sp,sp,-16
    80001294:	00113423          	sd	ra,8(sp)
    80001298:	00813023          	sd	s0,0(sp)
    8000129c:	01010413          	addi	s0,sp,16
    callOperation(0x13);
    800012a0:	01300513          	li	a0,19
    800012a4:	00000097          	auipc	ra,0x0
    800012a8:	ea0080e7          	jalr	-352(ra) # 80001144 <_Z13callOperationm>
}
    800012ac:	00813083          	ld	ra,8(sp)
    800012b0:	00013403          	ld	s0,0(sp)
    800012b4:	01010113          	addi	sp,sp,16
    800012b8:	00008067          	ret

00000000800012bc <_Z11thread_exitv>:
int thread_exit(){
    800012bc:	ff010113          	addi	sp,sp,-16
    800012c0:	00113423          	sd	ra,8(sp)
    800012c4:	00813023          	sd	s0,0(sp)
    800012c8:	01010413          	addi	s0,sp,16
    callOperation(0x12);
    800012cc:	01200513          	li	a0,18
    800012d0:	00000097          	auipc	ra,0x0
    800012d4:	e74080e7          	jalr	-396(ra) # 80001144 <_Z13callOperationm>
    return 1;
}
    800012d8:	00100513          	li	a0,1
    800012dc:	00813083          	ld	ra,8(sp)
    800012e0:	00013403          	ld	s0,0(sp)
    800012e4:	01010113          	addi	sp,sp,16
    800012e8:	00008067          	ret

00000000800012ec <_Z11thread_joinP7_thread>:
void thread_join(thread_t handle){
    800012ec:	ff010113          	addi	sp,sp,-16
    800012f0:	00113423          	sd	ra,8(sp)
    800012f4:	00813023          	sd	s0,0(sp)
    800012f8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(handle));
    800012fc:	00050593          	mv	a1,a0
    callOperation(0x14);
    80001300:	01400513          	li	a0,20
    80001304:	00000097          	auipc	ra,0x0
    80001308:	e40080e7          	jalr	-448(ra) # 80001144 <_Z13callOperationm>
}
    8000130c:	00813083          	ld	ra,8(sp)
    80001310:	00013403          	ld	s0,0(sp)
    80001314:	01010113          	addi	sp,sp,16
    80001318:	00008067          	ret

000000008000131c <_ZN7_thread14thread_wrapperEv>:
    }
    running = Scheduler::get();
    _thread::contextSwitch(&current->context, &running->context);
}

void _thread::thread_wrapper() {
    8000131c:	ff010113          	addi	sp,sp,-16
    80001320:	00113423          	sd	ra,8(sp)
    80001324:	00813023          	sd	s0,0(sp)
    80001328:	01010413          	addi	s0,sp,16
    riscv::popSppSpie();
    8000132c:	00000097          	auipc	ra,0x0
    80001330:	7cc080e7          	jalr	1996(ra) # 80001af8 <_ZN5riscv10popSppSpieEv>
    running->state = 2;
    80001334:	00004797          	auipc	a5,0x4
    80001338:	6bc7b783          	ld	a5,1724(a5) # 800059f0 <_ZN7_thread7runningE>
    8000133c:	00200713          	li	a4,2
    80001340:	02e7bc23          	sd	a4,56(a5)
    if (running->body)
    80001344:	0087b703          	ld	a4,8(a5)
    80001348:	02070663          	beqz	a4,80001374 <_ZN7_thread14thread_wrapperEv+0x58>
    {
        running->body(running->args);
    8000134c:	0307b503          	ld	a0,48(a5)
    80001350:	000700e7          	jalr	a4
    }
    else
    {
        running->myThread->run();
    }
    running->state = 4;
    80001354:	00004797          	auipc	a5,0x4
    80001358:	69c7b783          	ld	a5,1692(a5) # 800059f0 <_ZN7_thread7runningE>
    8000135c:	00400713          	li	a4,4
    80001360:	02e7bc23          	sd	a4,56(a5)
}
    80001364:	00813083          	ld	ra,8(sp)
    80001368:	00013403          	ld	s0,0(sp)
    8000136c:	01010113          	addi	sp,sp,16
    80001370:	00008067          	ret
        running->myThread->run();
    80001374:	0007b503          	ld	a0,0(a5)
    80001378:	00053783          	ld	a5,0(a0) # 1000 <_entry-0x7ffff000>
    8000137c:	0107b783          	ld	a5,16(a5)
    80001380:	000780e7          	jalr	a5
    80001384:	fd1ff06f          	j	80001354 <_ZN7_thread14thread_wrapperEv+0x38>

0000000080001388 <_Znam>:
void* operator new[](size_t n) {
    80001388:	ff010113          	addi	sp,sp,-16
    8000138c:	00113423          	sd	ra,8(sp)
    80001390:	00813023          	sd	s0,0(sp)
    80001394:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(n);
    80001398:	00001097          	auipc	ra,0x1
    8000139c:	a70080e7          	jalr	-1424(ra) # 80001e08 <_ZN15MemoryAllocator9mem_allocEm>
}
    800013a0:	00813083          	ld	ra,8(sp)
    800013a4:	00013403          	ld	s0,0(sp)
    800013a8:	01010113          	addi	sp,sp,16
    800013ac:	00008067          	ret

00000000800013b0 <_ZdaPv>:
void operator delete[](void *p)  {
    800013b0:	ff010113          	addi	sp,sp,-16
    800013b4:	00113423          	sd	ra,8(sp)
    800013b8:	00813023          	sd	s0,0(sp)
    800013bc:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(p);
    800013c0:	00001097          	auipc	ra,0x1
    800013c4:	ba8080e7          	jalr	-1112(ra) # 80001f68 <_ZN15MemoryAllocator8mem_freeEPv>
}
    800013c8:	00813083          	ld	ra,8(sp)
    800013cc:	00013403          	ld	s0,0(sp)
    800013d0:	01010113          	addi	sp,sp,16
    800013d4:	00008067          	ret

00000000800013d8 <_ZN7_thread13thread_createEPFvPvES0_S0_>:
_thread *_thread::thread_create(_thread::Body body, void *args, void *stackSpace) {
    800013d8:	fd010113          	addi	sp,sp,-48
    800013dc:	02113423          	sd	ra,40(sp)
    800013e0:	02813023          	sd	s0,32(sp)
    800013e4:	00913c23          	sd	s1,24(sp)
    800013e8:	01213823          	sd	s2,16(sp)
    800013ec:	01313423          	sd	s3,8(sp)
    800013f0:	01413023          	sd	s4,0(sp)
    800013f4:	03010413          	addi	s0,sp,48
    800013f8:	00050913          	mv	s2,a0
    800013fc:	00058993          	mv	s3,a1
    80001400:	00060a13          	mv	s4,a2
    __putc('1');
    80001404:	03100513          	li	a0,49
    80001408:	00003097          	auipc	ra,0x3
    8000140c:	da4080e7          	jalr	-604(ra) # 800041ac <__putc>
    return new _thread(body, args, stackSpace);
    80001410:	04000513          	li	a0,64
    80001414:	00000097          	auipc	ra,0x0
    80001418:	4e8080e7          	jalr	1256(ra) # 800018fc <_Znwm>
    8000141c:	00050493          	mv	s1,a0
private:

    friend class riscv;

    _thread(Body body, void *args, void *stackSpace) {
        this->body = body;
    80001420:	01253423          	sd	s2,8(a0)
        this->args = args;
    80001424:	03353823          	sd	s3,48(a0)
        if(body != nullptr) {
    80001428:	00090c63          	beqz	s2,80001440 <_ZN7_thread13thread_createEPFvPvES0_S0_+0x68>
            this->stack = (uint64*) stackSpace;
    8000142c:	03453023          	sd	s4,32(a0)
            __putc('a');
    80001430:	06100513          	li	a0,97
    80001434:	00003097          	auipc	ra,0x3
    80001438:	d78080e7          	jalr	-648(ra) # 800041ac <__putc>
    8000143c:	0140006f          	j	80001450 <_ZN7_thread13thread_createEPFvPvES0_S0_+0x78>
        }
        else {
            this->stack = nullptr;
    80001440:	02053023          	sd	zero,32(a0)
            __putc('b');
    80001444:	06200513          	li	a0,98
    80001448:	00003097          	auipc	ra,0x3
    8000144c:	d64080e7          	jalr	-668(ra) # 800041ac <__putc>
        }
        this->state = 2;
    80001450:	00200793          	li	a5,2
    80001454:	02f4bc23          	sd	a5,56(s1)

        uint64 ra = 0;
        if(body != nullptr)
    80001458:	04090063          	beqz	s2,80001498 <_ZN7_thread13thread_createEPFvPvES0_S0_+0xc0>
            ra = (uint64) &thread_wrapper;
    8000145c:	00000717          	auipc	a4,0x0
    80001460:	ec070713          	addi	a4,a4,-320 # 8000131c <_ZN7_thread14thread_wrapperEv>
        uint64 sp = 0;
        if(stack != nullptr)
    80001464:	0204b783          	ld	a5,32(s1)
    80001468:	02078c63          	beqz	a5,800014a0 <_ZN7_thread13thread_createEPFvPvES0_S0_+0xc8>
            sp = (uint64) &stack[DEFAULT_STACK_SIZE];
    8000146c:	000086b7          	lui	a3,0x8
    80001470:	00d787b3          	add	a5,a5,a3
        this->context = { ra, sp };
    80001474:	00e4b823          	sd	a4,16(s1)
    80001478:	00f4bc23          	sd	a5,24(s1)
        this->timeSlice = DEFAULT_TIME_SLICE;
    8000147c:	00200793          	li	a5,2
    80001480:	02f4b423          	sd	a5,40(s1)
        if (body != nullptr) { Scheduler::put(this); }
    80001484:	04090063          	beqz	s2,800014c4 <_ZN7_thread13thread_createEPFvPvES0_S0_+0xec>
    80001488:	00048513          	mv	a0,s1
    8000148c:	00001097          	auipc	ra,0x1
    80001490:	894080e7          	jalr	-1900(ra) # 80001d20 <_ZN9Scheduler3putEP7_thread>
    80001494:	0300006f          	j	800014c4 <_ZN7_thread13thread_createEPFvPvES0_S0_+0xec>
        uint64 ra = 0;
    80001498:	00000713          	li	a4,0
    8000149c:	fc9ff06f          	j	80001464 <_ZN7_thread13thread_createEPFvPvES0_S0_+0x8c>
        uint64 sp = 0;
    800014a0:	00000793          	li	a5,0
    800014a4:	fd1ff06f          	j	80001474 <_ZN7_thread13thread_createEPFvPvES0_S0_+0x9c>
    800014a8:	00050913          	mv	s2,a0
    800014ac:	00048513          	mv	a0,s1
    800014b0:	00000097          	auipc	ra,0x0
    800014b4:	474080e7          	jalr	1140(ra) # 80001924 <_ZdlPv>
    800014b8:	00090513          	mv	a0,s2
    800014bc:	00005097          	auipc	ra,0x5
    800014c0:	62c080e7          	jalr	1580(ra) # 80006ae8 <_Unwind_Resume>
}
    800014c4:	00048513          	mv	a0,s1
    800014c8:	02813083          	ld	ra,40(sp)
    800014cc:	02013403          	ld	s0,32(sp)
    800014d0:	01813483          	ld	s1,24(sp)
    800014d4:	01013903          	ld	s2,16(sp)
    800014d8:	00813983          	ld	s3,8(sp)
    800014dc:	00013a03          	ld	s4,0(sp)
    800014e0:	03010113          	addi	sp,sp,48
    800014e4:	00008067          	ret

00000000800014e8 <_ZN7_thread15thread_dispatchEv>:
void _thread::thread_dispatch() {
    800014e8:	fe010113          	addi	sp,sp,-32
    800014ec:	00113c23          	sd	ra,24(sp)
    800014f0:	00813823          	sd	s0,16(sp)
    800014f4:	00913423          	sd	s1,8(sp)
    800014f8:	02010413          	addi	s0,sp,32
    _thread *current = running;
    800014fc:	00004497          	auipc	s1,0x4
    80001500:	4f44b483          	ld	s1,1268(s1) # 800059f0 <_ZN7_thread7runningE>
    if(current && current->state == 2){
    80001504:	00048863          	beqz	s1,80001514 <_ZN7_thread15thread_dispatchEv+0x2c>
    80001508:	0384b703          	ld	a4,56(s1)
    8000150c:	00200793          	li	a5,2
    80001510:	02f70c63          	beq	a4,a5,80001548 <_ZN7_thread15thread_dispatchEv+0x60>
    running = Scheduler::get();
    80001514:	00000097          	auipc	ra,0x0
    80001518:	7a4080e7          	jalr	1956(ra) # 80001cb8 <_ZN9Scheduler3getEv>
    8000151c:	00004797          	auipc	a5,0x4
    80001520:	4ca7ba23          	sd	a0,1236(a5) # 800059f0 <_ZN7_thread7runningE>
    _thread::contextSwitch(&current->context, &running->context);
    80001524:	01050593          	addi	a1,a0,16
    80001528:	01048513          	addi	a0,s1,16
    8000152c:	00000097          	auipc	ra,0x0
    80001530:	c04080e7          	jalr	-1020(ra) # 80001130 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>
}
    80001534:	01813083          	ld	ra,24(sp)
    80001538:	01013403          	ld	s0,16(sp)
    8000153c:	00813483          	ld	s1,8(sp)
    80001540:	02010113          	addi	sp,sp,32
    80001544:	00008067          	ret
        Scheduler::put(current);
    80001548:	00048513          	mv	a0,s1
    8000154c:	00000097          	auipc	ra,0x0
    80001550:	7d4080e7          	jalr	2004(ra) # 80001d20 <_ZN9Scheduler3putEP7_thread>
    80001554:	fc1ff06f          	j	80001514 <_ZN7_thread15thread_dispatchEv+0x2c>

0000000080001558 <_ZN7_thread11thread_exitEv>:

int _thread::thread_exit() {
    80001558:	ff010113          	addi	sp,sp,-16
    8000155c:	00113423          	sd	ra,8(sp)
    80001560:	00813023          	sd	s0,0(sp)
    80001564:	01010413          	addi	s0,sp,16
   running->state = 4;
    80001568:	00004797          	auipc	a5,0x4
    8000156c:	4887b783          	ld	a5,1160(a5) # 800059f0 <_ZN7_thread7runningE>
    80001570:	00400713          	li	a4,4
    80001574:	02e7bc23          	sd	a4,56(a5)
   thread_dispatch();
    80001578:	00000097          	auipc	ra,0x0
    8000157c:	f70080e7          	jalr	-144(ra) # 800014e8 <_ZN7_thread15thread_dispatchEv>
   return 0;
}
    80001580:	00000513          	li	a0,0
    80001584:	00813083          	ld	ra,8(sp)
    80001588:	00013403          	ld	s0,0(sp)
    8000158c:	01010113          	addi	sp,sp,16
    80001590:	00008067          	ret

0000000080001594 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80001594:	fe010113          	addi	sp,sp,-32
    80001598:	00113c23          	sd	ra,24(sp)
    8000159c:	00813823          	sd	s0,16(sp)
    800015a0:	00913423          	sd	s1,8(sp)
    800015a4:	02010413          	addi	s0,sp,32
    800015a8:	00050493          	mv	s1,a0
    LOCK();
    800015ac:	00100613          	li	a2,1
    800015b0:	00000593          	li	a1,0
    800015b4:	00004517          	auipc	a0,0x4
    800015b8:	44450513          	addi	a0,a0,1092 # 800059f8 <lockPrint>
    800015bc:	00000097          	auipc	ra,0x0
    800015c0:	a44080e7          	jalr	-1468(ra) # 80001000 <copy_and_swap>
    800015c4:	fe0514e3          	bnez	a0,800015ac <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800015c8:	0004c503          	lbu	a0,0(s1)
    800015cc:	00050a63          	beqz	a0,800015e0 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    800015d0:	00000097          	auipc	ra,0x0
    800015d4:	c38080e7          	jalr	-968(ra) # 80001208 <_Z4putcc>
        string++;
    800015d8:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800015dc:	fedff06f          	j	800015c8 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    800015e0:	00000613          	li	a2,0
    800015e4:	00100593          	li	a1,1
    800015e8:	00004517          	auipc	a0,0x4
    800015ec:	41050513          	addi	a0,a0,1040 # 800059f8 <lockPrint>
    800015f0:	00000097          	auipc	ra,0x0
    800015f4:	a10080e7          	jalr	-1520(ra) # 80001000 <copy_and_swap>
    800015f8:	fe0514e3          	bnez	a0,800015e0 <_Z11printStringPKc+0x4c>
}
    800015fc:	01813083          	ld	ra,24(sp)
    80001600:	01013403          	ld	s0,16(sp)
    80001604:	00813483          	ld	s1,8(sp)
    80001608:	02010113          	addi	sp,sp,32
    8000160c:	00008067          	ret

0000000080001610 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80001610:	fd010113          	addi	sp,sp,-48
    80001614:	02113423          	sd	ra,40(sp)
    80001618:	02813023          	sd	s0,32(sp)
    8000161c:	00913c23          	sd	s1,24(sp)
    80001620:	01213823          	sd	s2,16(sp)
    80001624:	01313423          	sd	s3,8(sp)
    80001628:	01413023          	sd	s4,0(sp)
    8000162c:	03010413          	addi	s0,sp,48
    80001630:	00050993          	mv	s3,a0
    80001634:	00058a13          	mv	s4,a1
    LOCK();
    80001638:	00100613          	li	a2,1
    8000163c:	00000593          	li	a1,0
    80001640:	00004517          	auipc	a0,0x4
    80001644:	3b850513          	addi	a0,a0,952 # 800059f8 <lockPrint>
    80001648:	00000097          	auipc	ra,0x0
    8000164c:	9b8080e7          	jalr	-1608(ra) # 80001000 <copy_and_swap>
    80001650:	fe0514e3          	bnez	a0,80001638 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80001654:	00000913          	li	s2,0
    80001658:	00090493          	mv	s1,s2
    8000165c:	0019091b          	addiw	s2,s2,1
    80001660:	03495a63          	bge	s2,s4,80001694 <_Z9getStringPci+0x84>
        cc = getc();
    80001664:	00000097          	auipc	ra,0x0
    80001668:	b68080e7          	jalr	-1176(ra) # 800011cc <_Z4getcv>
        if(cc < 1)
    8000166c:	02050463          	beqz	a0,80001694 <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    80001670:	009984b3          	add	s1,s3,s1
    80001674:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80001678:	00a00793          	li	a5,10
    8000167c:	00f50a63          	beq	a0,a5,80001690 <_Z9getStringPci+0x80>
    80001680:	00d00793          	li	a5,13
    80001684:	fcf51ae3          	bne	a0,a5,80001658 <_Z9getStringPci+0x48>
        buf[i++] = c;
    80001688:	00090493          	mv	s1,s2
    8000168c:	0080006f          	j	80001694 <_Z9getStringPci+0x84>
    80001690:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80001694:	009984b3          	add	s1,s3,s1
    80001698:	00048023          	sb	zero,0(s1)

    UNLOCK();
    8000169c:	00000613          	li	a2,0
    800016a0:	00100593          	li	a1,1
    800016a4:	00004517          	auipc	a0,0x4
    800016a8:	35450513          	addi	a0,a0,852 # 800059f8 <lockPrint>
    800016ac:	00000097          	auipc	ra,0x0
    800016b0:	954080e7          	jalr	-1708(ra) # 80001000 <copy_and_swap>
    800016b4:	fe0514e3          	bnez	a0,8000169c <_Z9getStringPci+0x8c>
    return buf;
}
    800016b8:	00098513          	mv	a0,s3
    800016bc:	02813083          	ld	ra,40(sp)
    800016c0:	02013403          	ld	s0,32(sp)
    800016c4:	01813483          	ld	s1,24(sp)
    800016c8:	01013903          	ld	s2,16(sp)
    800016cc:	00813983          	ld	s3,8(sp)
    800016d0:	00013a03          	ld	s4,0(sp)
    800016d4:	03010113          	addi	sp,sp,48
    800016d8:	00008067          	ret

00000000800016dc <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800016dc:	ff010113          	addi	sp,sp,-16
    800016e0:	00813423          	sd	s0,8(sp)
    800016e4:	01010413          	addi	s0,sp,16
    800016e8:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800016ec:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800016f0:	0006c603          	lbu	a2,0(a3) # 8000 <_entry-0x7fff8000>
    800016f4:	fd06071b          	addiw	a4,a2,-48
    800016f8:	0ff77713          	andi	a4,a4,255
    800016fc:	00900793          	li	a5,9
    80001700:	02e7e063          	bltu	a5,a4,80001720 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80001704:	0025179b          	slliw	a5,a0,0x2
    80001708:	00a787bb          	addw	a5,a5,a0
    8000170c:	0017979b          	slliw	a5,a5,0x1
    80001710:	00168693          	addi	a3,a3,1
    80001714:	00c787bb          	addw	a5,a5,a2
    80001718:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    8000171c:	fd5ff06f          	j	800016f0 <_Z11stringToIntPKc+0x14>
    return n;
}
    80001720:	00813403          	ld	s0,8(sp)
    80001724:	01010113          	addi	sp,sp,16
    80001728:	00008067          	ret

000000008000172c <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    8000172c:	fc010113          	addi	sp,sp,-64
    80001730:	02113c23          	sd	ra,56(sp)
    80001734:	02813823          	sd	s0,48(sp)
    80001738:	02913423          	sd	s1,40(sp)
    8000173c:	03213023          	sd	s2,32(sp)
    80001740:	01313c23          	sd	s3,24(sp)
    80001744:	04010413          	addi	s0,sp,64
    80001748:	00050493          	mv	s1,a0
    8000174c:	00058913          	mv	s2,a1
    80001750:	00060993          	mv	s3,a2
    LOCK();
    80001754:	00100613          	li	a2,1
    80001758:	00000593          	li	a1,0
    8000175c:	00004517          	auipc	a0,0x4
    80001760:	29c50513          	addi	a0,a0,668 # 800059f8 <lockPrint>
    80001764:	00000097          	auipc	ra,0x0
    80001768:	89c080e7          	jalr	-1892(ra) # 80001000 <copy_and_swap>
    8000176c:	fe0514e3          	bnez	a0,80001754 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80001770:	00098463          	beqz	s3,80001778 <_Z8printIntiii+0x4c>
    80001774:	0804c463          	bltz	s1,800017fc <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80001778:	0004851b          	sext.w	a0,s1
    neg = 0;
    8000177c:	00000593          	li	a1,0
    }

    i = 0;
    80001780:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80001784:	0009079b          	sext.w	a5,s2
    80001788:	0325773b          	remuw	a4,a0,s2
    8000178c:	00048613          	mv	a2,s1
    80001790:	0014849b          	addiw	s1,s1,1
    80001794:	02071693          	slli	a3,a4,0x20
    80001798:	0206d693          	srli	a3,a3,0x20
    8000179c:	00004717          	auipc	a4,0x4
    800017a0:	19c70713          	addi	a4,a4,412 # 80005938 <digits>
    800017a4:	00d70733          	add	a4,a4,a3
    800017a8:	00074683          	lbu	a3,0(a4)
    800017ac:	fd040713          	addi	a4,s0,-48
    800017b0:	00c70733          	add	a4,a4,a2
    800017b4:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800017b8:	0005071b          	sext.w	a4,a0
    800017bc:	0325553b          	divuw	a0,a0,s2
    800017c0:	fcf772e3          	bgeu	a4,a5,80001784 <_Z8printIntiii+0x58>
    if(neg)
    800017c4:	00058c63          	beqz	a1,800017dc <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    800017c8:	fd040793          	addi	a5,s0,-48
    800017cc:	009784b3          	add	s1,a5,s1
    800017d0:	02d00793          	li	a5,45
    800017d4:	fef48823          	sb	a5,-16(s1)
    800017d8:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800017dc:	fff4849b          	addiw	s1,s1,-1
    800017e0:	0204c463          	bltz	s1,80001808 <_Z8printIntiii+0xdc>
        putc(buf[i]);
    800017e4:	fd040793          	addi	a5,s0,-48
    800017e8:	009787b3          	add	a5,a5,s1
    800017ec:	ff07c503          	lbu	a0,-16(a5)
    800017f0:	00000097          	auipc	ra,0x0
    800017f4:	a18080e7          	jalr	-1512(ra) # 80001208 <_Z4putcc>
    800017f8:	fe5ff06f          	j	800017dc <_Z8printIntiii+0xb0>
        x = -xx;
    800017fc:	4090053b          	negw	a0,s1
        neg = 1;
    80001800:	00100593          	li	a1,1
        x = -xx;
    80001804:	f7dff06f          	j	80001780 <_Z8printIntiii+0x54>

    UNLOCK();
    80001808:	00000613          	li	a2,0
    8000180c:	00100593          	li	a1,1
    80001810:	00004517          	auipc	a0,0x4
    80001814:	1e850513          	addi	a0,a0,488 # 800059f8 <lockPrint>
    80001818:	fffff097          	auipc	ra,0xfffff
    8000181c:	7e8080e7          	jalr	2024(ra) # 80001000 <copy_and_swap>
    80001820:	fe0514e3          	bnez	a0,80001808 <_Z8printIntiii+0xdc>
    80001824:	03813083          	ld	ra,56(sp)
    80001828:	03013403          	ld	s0,48(sp)
    8000182c:	02813483          	ld	s1,40(sp)
    80001830:	02013903          	ld	s2,32(sp)
    80001834:	01813983          	ld	s3,24(sp)
    80001838:	04010113          	addi	sp,sp,64
    8000183c:	00008067          	ret

0000000080001840 <_Z10testMethodPv>:
#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"
#include "../h/_thread.hpp"

void testMethod(void *arg)
{
    80001840:	ff010113          	addi	sp,sp,-16
    80001844:	00113423          	sd	ra,8(sp)
    80001848:	00813023          	sd	s0,0(sp)
    8000184c:	01010413          	addi	s0,sp,16
    int k = 0;
    k++;
    __putc('t');
    80001850:	07400513          	li	a0,116
    80001854:	00003097          	auipc	ra,0x3
    80001858:	958080e7          	jalr	-1704(ra) # 800041ac <__putc>
}
    8000185c:	00813083          	ld	ra,8(sp)
    80001860:	00013403          	ld	s0,0(sp)
    80001864:	01010113          	addi	sp,sp,16
    80001868:	00008067          	ret

000000008000186c <main>:
 * drugi alokator nije popravio
 * drugi riscv nije popravio
 * drugi thread nije popravio
 * problem je sto se posle thread create ne resetuje sepc kako treba i sstatus kako treba
 * */
int main() {
    8000186c:	fe010113          	addi	sp,sp,-32
    80001870:	00113c23          	sd	ra,24(sp)
    80001874:	00813823          	sd	s0,16(sp)
    80001878:	02010413          	addi	s0,sp,32
    MemoryAllocator::initialize();
    8000187c:	00000097          	auipc	ra,0x0
    80001880:	544080e7          	jalr	1348(ra) # 80001dc0 <_ZN15MemoryAllocator10initializeEv>
    riscv::w_stvec((uint64)&riscv::supervisorTrap);
    80001884:	00004797          	auipc	a5,0x4
    80001888:	1147b783          	ld	a5,276(a5) # 80005998 <_GLOBAL_OFFSET_TABLE_+0x20>
    return stvec;
}

inline void riscv::w_stvec(uint64 stvec)
{
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    8000188c:	10579073          	csrw	stvec,a5

    _thread::running = _thread::thread_create(nullptr, nullptr, nullptr);
    80001890:	00000613          	li	a2,0
    80001894:	00000593          	li	a1,0
    80001898:	00000513          	li	a0,0
    8000189c:	00000097          	auipc	ra,0x0
    800018a0:	b3c080e7          	jalr	-1220(ra) # 800013d8 <_ZN7_thread13thread_createEPFvPvES0_S0_>
    800018a4:	00004797          	auipc	a5,0x4
    800018a8:	0e47b783          	ld	a5,228(a5) # 80005988 <_GLOBAL_OFFSET_TABLE_+0x10>
    800018ac:	00a7b023          	sd	a0,0(a5)
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void riscv::ms_sstatus(uint64 mask)
{
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800018b0:	00200793          	li	a5,2
    800018b4:	1007a073          	csrs	sstatus,a5

    // ovako je nama ne znamo zasto riscv::ms_sstatus(riscv::SSTATUS_SPIE | riscv::SSTATUS_SPP);
    // ovako je lab ne razumemo zasto
    riscv::ms_sstatus(riscv::SSTATUS_SIE);
    // upisuje 45 i poziva syscall 45 - getPid()
    __asm__ volatile ("mv a0, %0" : : "r" (45));
    800018b8:	02d00793          	li	a5,45
    800018bc:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800018c0:	00000073          	ecall
    
    thread_t handle = nullptr;
    800018c4:	fe043423          	sd	zero,-24(s0)
    thread_create(&handle, testMethod, nullptr);
    800018c8:	00000613          	li	a2,0
    800018cc:	00000597          	auipc	a1,0x0
    800018d0:	f7458593          	addi	a1,a1,-140 # 80001840 <_Z10testMethodPv>
    800018d4:	fe840513          	addi	a0,s0,-24
    800018d8:	00000097          	auipc	ra,0x0
    800018dc:	960080e7          	jalr	-1696(ra) # 80001238 <_Z13thread_createPP7_threadPFvPvES2_>
    //__asm__ volatile ("csrw sepc, %0" : : "r" (0));
    //__asm__ volatile ("csrw sstatus, %0" : : "r" (0x120));
    thread_dispatch();
    800018e0:	00000097          	auipc	ra,0x0
    800018e4:	9b0080e7          	jalr	-1616(ra) # 80001290 <_Z15thread_dispatchv>
    return 0;
    800018e8:	00000513          	li	a0,0
    800018ec:	01813083          	ld	ra,24(sp)
    800018f0:	01013403          	ld	s0,16(sp)
    800018f4:	02010113          	addi	sp,sp,32
    800018f8:	00008067          	ret

00000000800018fc <_Znwm>:
#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.hpp"
#include "../h/_thread.hpp"
#include "../h/MemoryAllocator.hpp"

void *operator new(size_t n){
    800018fc:	ff010113          	addi	sp,sp,-16
    80001900:	00113423          	sd	ra,8(sp)
    80001904:	00813023          	sd	s0,0(sp)
    80001908:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    8000190c:	00000097          	auipc	ra,0x0
    80001910:	858080e7          	jalr	-1960(ra) # 80001164 <_Z9mem_allocm>
}
    80001914:	00813083          	ld	ra,8(sp)
    80001918:	00013403          	ld	s0,0(sp)
    8000191c:	01010113          	addi	sp,sp,16
    80001920:	00008067          	ret

0000000080001924 <_ZdlPv>:

void operator delete(void *p) {
    80001924:	ff010113          	addi	sp,sp,-16
    80001928:	00113423          	sd	ra,8(sp)
    8000192c:	00813023          	sd	s0,0(sp)
    80001930:	01010413          	addi	s0,sp,16
    mem_free(p);
    80001934:	00000097          	auipc	ra,0x0
    80001938:	864080e7          	jalr	-1948(ra) # 80001198 <_Z8mem_freePv>
}
    8000193c:	00813083          	ld	ra,8(sp)
    80001940:	00013403          	ld	s0,0(sp)
    80001944:	01010113          	addi	sp,sp,16
    80001948:	00008067          	ret

000000008000194c <_ZN6ThreadD1Ev>:

Thread::~Thread() {
    8000194c:	fe010113          	addi	sp,sp,-32
    80001950:	00113c23          	sd	ra,24(sp)
    80001954:	00813823          	sd	s0,16(sp)
    80001958:	00913423          	sd	s1,8(sp)
    8000195c:	02010413          	addi	s0,sp,32
    80001960:	00004797          	auipc	a5,0x4
    80001964:	00078793          	mv	a5,a5
    80001968:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    8000196c:	00853483          	ld	s1,8(a0)
    80001970:	02048063          	beqz	s1,80001990 <_ZN6ThreadD1Ev+0x44>
    ~_thread() { delete[] stack; }
    80001974:	0204b503          	ld	a0,32(s1)
    80001978:	00050663          	beqz	a0,80001984 <_ZN6ThreadD1Ev+0x38>
    8000197c:	00000097          	auipc	ra,0x0
    80001980:	a34080e7          	jalr	-1484(ra) # 800013b0 <_ZdaPv>
    80001984:	00048513          	mv	a0,s1
    80001988:	00000097          	auipc	ra,0x0
    8000198c:	f9c080e7          	jalr	-100(ra) # 80001924 <_ZdlPv>
}
    80001990:	01813083          	ld	ra,24(sp)
    80001994:	01013403          	ld	s0,16(sp)
    80001998:	00813483          	ld	s1,8(sp)
    8000199c:	02010113          	addi	sp,sp,32
    800019a0:	00008067          	ret

00000000800019a4 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800019a4:	fe010113          	addi	sp,sp,-32
    800019a8:	00113c23          	sd	ra,24(sp)
    800019ac:	00813823          	sd	s0,16(sp)
    800019b0:	00913423          	sd	s1,8(sp)
    800019b4:	02010413          	addi	s0,sp,32
    800019b8:	00050493          	mv	s1,a0
}
    800019bc:	00000097          	auipc	ra,0x0
    800019c0:	f90080e7          	jalr	-112(ra) # 8000194c <_ZN6ThreadD1Ev>
    800019c4:	00048513          	mv	a0,s1
    800019c8:	00000097          	auipc	ra,0x0
    800019cc:	f5c080e7          	jalr	-164(ra) # 80001924 <_ZdlPv>
    800019d0:	01813083          	ld	ra,24(sp)
    800019d4:	01013403          	ld	s0,16(sp)
    800019d8:	00813483          	ld	s1,8(sp)
    800019dc:	02010113          	addi	sp,sp,32
    800019e0:	00008067          	ret

00000000800019e4 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    800019e4:	ff010113          	addi	sp,sp,-16
    800019e8:	00113423          	sd	ra,8(sp)
    800019ec:	00813023          	sd	s0,0(sp)
    800019f0:	01010413          	addi	s0,sp,16
    thread_dispatch();
    800019f4:	00000097          	auipc	ra,0x0
    800019f8:	89c080e7          	jalr	-1892(ra) # 80001290 <_Z15thread_dispatchv>
}
    800019fc:	00813083          	ld	ra,8(sp)
    80001a00:	00013403          	ld	s0,0(sp)
    80001a04:	01010113          	addi	sp,sp,16
    80001a08:	00008067          	ret

0000000080001a0c <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80001a0c:	ff010113          	addi	sp,sp,-16
    80001a10:	00113423          	sd	ra,8(sp)
    80001a14:	00813023          	sd	s0,0(sp)
    80001a18:	01010413          	addi	s0,sp,16
    80001a1c:	00004797          	auipc	a5,0x4
    80001a20:	f4478793          	addi	a5,a5,-188 # 80005960 <_ZTV6Thread+0x10>
    80001a24:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, body, arg);
    80001a28:	00850513          	addi	a0,a0,8
    80001a2c:	00000097          	auipc	ra,0x0
    80001a30:	80c080e7          	jalr	-2036(ra) # 80001238 <_Z13thread_createPP7_threadPFvPvES2_>
}
    80001a34:	00813083          	ld	ra,8(sp)
    80001a38:	00013403          	ld	s0,0(sp)
    80001a3c:	01010113          	addi	sp,sp,16
    80001a40:	00008067          	ret

0000000080001a44 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80001a44:	ff010113          	addi	sp,sp,-16
    80001a48:	00113423          	sd	ra,8(sp)
    80001a4c:	00813023          	sd	s0,0(sp)
    80001a50:	01010413          	addi	s0,sp,16
    80001a54:	00004797          	auipc	a5,0x4
    80001a58:	f0c78793          	addi	a5,a5,-244 # 80005960 <_ZTV6Thread+0x10>
    80001a5c:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, nullptr, nullptr);
    80001a60:	00000613          	li	a2,0
    80001a64:	00000593          	li	a1,0
    80001a68:	00850513          	addi	a0,a0,8
    80001a6c:	fffff097          	auipc	ra,0xfffff
    80001a70:	7cc080e7          	jalr	1996(ra) # 80001238 <_Z13thread_createPP7_threadPFvPvES2_>
}
    80001a74:	00813083          	ld	ra,8(sp)
    80001a78:	00013403          	ld	s0,0(sp)
    80001a7c:	01010113          	addi	sp,sp,16
    80001a80:	00008067          	ret

0000000080001a84 <_ZN6Thread4joinEv>:

void Thread::join() {
    80001a84:	ff010113          	addi	sp,sp,-16
    80001a88:	00113423          	sd	ra,8(sp)
    80001a8c:	00813023          	sd	s0,0(sp)
    80001a90:	01010413          	addi	s0,sp,16
    thread_join(this->myHandle);
    80001a94:	00853503          	ld	a0,8(a0)
    80001a98:	00000097          	auipc	ra,0x0
    80001a9c:	854080e7          	jalr	-1964(ra) # 800012ec <_Z11thread_joinP7_thread>
}
    80001aa0:	00813083          	ld	ra,8(sp)
    80001aa4:	00013403          	ld	s0,0(sp)
    80001aa8:	01010113          	addi	sp,sp,16
    80001aac:	00008067          	ret

0000000080001ab0 <_ZN6Thread5startEv>:
int Thread::start() {
    80001ab0:	ff010113          	addi	sp,sp,-16
    80001ab4:	00113423          	sd	ra,8(sp)
    80001ab8:	00813023          	sd	s0,0(sp)
    80001abc:	01010413          	addi	s0,sp,16
    Scheduler::put(myHandle);
    80001ac0:	00853503          	ld	a0,8(a0)
    80001ac4:	00000097          	auipc	ra,0x0
    80001ac8:	25c080e7          	jalr	604(ra) # 80001d20 <_ZN9Scheduler3putEP7_thread>
    return 1;
}
    80001acc:	00100513          	li	a0,1
    80001ad0:	00813083          	ld	ra,8(sp)
    80001ad4:	00013403          	ld	s0,0(sp)
    80001ad8:	01010113          	addi	sp,sp,16
    80001adc:	00008067          	ret

0000000080001ae0 <_ZN6Thread3runEv>:
    void join();
    static void dispatch ();
    //static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {}
    80001ae0:	ff010113          	addi	sp,sp,-16
    80001ae4:	00813423          	sd	s0,8(sp)
    80001ae8:	01010413          	addi	s0,sp,16
    80001aec:	00813403          	ld	s0,8(sp)
    80001af0:	01010113          	addi	sp,sp,16
    80001af4:	00008067          	ret

0000000080001af8 <_ZN5riscv10popSppSpieEv>:
#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/_thread.hpp"

void riscv::popSppSpie() {
    80001af8:	ff010113          	addi	sp,sp,-16
    80001afc:	00813423          	sd	s0,8(sp)
    80001b00:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80001b04:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001b08:	10200073          	sret
}
    80001b0c:	00813403          	ld	s0,8(sp)
    80001b10:	01010113          	addi	sp,sp,16
    80001b14:	00008067          	ret

0000000080001b18 <_ZN5riscv20handleSupervisorTrapEv>:

void riscv::handleSupervisorTrap() {
    80001b18:	fb010113          	addi	sp,sp,-80
    80001b1c:	04113423          	sd	ra,72(sp)
    80001b20:	04813023          	sd	s0,64(sp)
    80001b24:	02913c23          	sd	s1,56(sp)
    80001b28:	03213823          	sd	s2,48(sp)
    80001b2c:	03313423          	sd	s3,40(sp)
    80001b30:	05010413          	addi	s0,sp,80
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80001b34:	142027f3          	csrr	a5,scause
    80001b38:	faf43c23          	sd	a5,-72(s0)
    return scause;
    80001b3c:	fb843703          	ld	a4,-72(s0)
    uint64 scause = r_scause();

    if (scause == 0x0000000000000008UL || scause == 0x0000000000000009UL) {
    80001b40:	ff870693          	addi	a3,a4,-8
    80001b44:	00100793          	li	a5,1
    80001b48:	02d7f863          	bgeu	a5,a3,80001b78 <_ZN5riscv20handleSupervisorTrapEv+0x60>
            while(handle->state != 4){
                _thread::thread_dispatch();
            }
        }
        w_sstatus(sstatus); w_sepc(sepc+4);
    } else if(scause == 0x8000000000000001UL){
    80001b4c:	fff00793          	li	a5,-1
    80001b50:	03f79793          	slli	a5,a5,0x3f
    80001b54:	00178793          	addi	a5,a5,1
    80001b58:	10f70a63          	beq	a4,a5,80001c6c <_ZN5riscv20handleSupervisorTrapEv+0x154>
        //SSI
        mc_sip(SIP_SSIE);
        //ne znam sta radi, SIP_SSIE je vrednost (1<<1), kod boza je ova vrednost SIP_SSIP ista
    } else if (scause == 0x8000000000000009UL) {
    80001b5c:	fff00793          	li	a5,-1
    80001b60:	03f79793          	slli	a5,a5,0x3f
    80001b64:	00978793          	addi	a5,a5,9
    80001b68:	06f71c63          	bne	a4,a5,80001be0 <_ZN5riscv20handleSupervisorTrapEv+0xc8>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    80001b6c:	00002097          	auipc	ra,0x2
    80001b70:	6b4080e7          	jalr	1716(ra) # 80004220 <console_handler>
    }
    80001b74:	06c0006f          	j	80001be0 <_ZN5riscv20handleSupervisorTrapEv+0xc8>
        __asm__ volatile("mv %0, a0" : "=r" (argument0));
    80001b78:	00050793          	mv	a5,a0
        __asm__ volatile("mv %0, a1" : "=r" (argument1));
    80001b7c:	00058913          	mv	s2,a1
        __asm__ volatile("mv %0, a2" : "=r" (argument2));
    80001b80:	00060513          	mv	a0,a2
        __asm__ volatile("mv %0, t0" : "=r" (argument3));
    80001b84:	00028593          	mv	a1,t0
        __asm__ volatile("mv %0, t1" : "=r" (argument4));
    80001b88:	00030613          	mv	a2,t1
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001b8c:	14102773          	csrr	a4,sepc
    80001b90:	fce43423          	sd	a4,-56(s0)
    return sepc;
    80001b94:	fc843483          	ld	s1,-56(s0)
}

inline uint64 riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001b98:	10002773          	csrr	a4,sstatus
    80001b9c:	fce43023          	sd	a4,-64(s0)
    return sstatus;
    80001ba0:	fc043983          	ld	s3,-64(s0)
        if (argument0 == 0x1){//mem_alloc
    80001ba4:	00100713          	li	a4,1
    80001ba8:	04e78a63          	beq	a5,a4,80001bfc <_ZN5riscv20handleSupervisorTrapEv+0xe4>
        else if(argument0 == 0x2){//mem_free
    80001bac:	00200713          	li	a4,2
    80001bb0:	06e78063          	beq	a5,a4,80001c10 <_ZN5riscv20handleSupervisorTrapEv+0xf8>
        else if (argument0 == 0x11){//create thread
    80001bb4:	01100713          	li	a4,17
    80001bb8:	06e78463          	beq	a5,a4,80001c20 <_ZN5riscv20handleSupervisorTrapEv+0x108>
        else if (argument0 == 0x12){//exit
    80001bbc:	01200713          	li	a4,18
    80001bc0:	06e78e63          	beq	a5,a4,80001c3c <_ZN5riscv20handleSupervisorTrapEv+0x124>
        else if (argument0 == 0x13){//dispatch
    80001bc4:	01300713          	li	a4,19
    80001bc8:	08e78063          	beq	a5,a4,80001c48 <_ZN5riscv20handleSupervisorTrapEv+0x130>
        else if (argument0 == 0x14){//join
    80001bcc:	01400713          	li	a4,20
    80001bd0:	08e78263          	beq	a5,a4,80001c54 <_ZN5riscv20handleSupervisorTrapEv+0x13c>
}

inline void riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001bd4:	10099073          	csrw	sstatus,s3
        w_sstatus(sstatus); w_sepc(sepc+4);
    80001bd8:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001bdc:	14149073          	csrw	sepc,s1
    80001be0:	04813083          	ld	ra,72(sp)
    80001be4:	04013403          	ld	s0,64(sp)
    80001be8:	03813483          	ld	s1,56(sp)
    80001bec:	03013903          	ld	s2,48(sp)
    80001bf0:	02813983          	ld	s3,40(sp)
    80001bf4:	05010113          	addi	sp,sp,80
    80001bf8:	00008067          	ret
            void* allocated = MemoryAllocator::mem_alloc(argument1);
    80001bfc:	00090513          	mv	a0,s2
    80001c00:	00000097          	auipc	ra,0x0
    80001c04:	208080e7          	jalr	520(ra) # 80001e08 <_ZN15MemoryAllocator9mem_allocEm>
            __asm__ volatile ("mv a0, %0" : : "r" (allocated));
    80001c08:	00050513          	mv	a0,a0
    80001c0c:	fc9ff06f          	j	80001bd4 <_ZN5riscv20handleSupervisorTrapEv+0xbc>
            MemoryAllocator::mem_free((void*)argument1);
    80001c10:	00090513          	mv	a0,s2
    80001c14:	00000097          	auipc	ra,0x0
    80001c18:	354080e7          	jalr	852(ra) # 80001f68 <_ZN15MemoryAllocator8mem_freeEPv>
    80001c1c:	fb9ff06f          	j	80001bd4 <_ZN5riscv20handleSupervisorTrapEv+0xbc>
            *handle = _thread::thread_create((_thread::Body)argument2, (void*)argument3, (void*)argument4);
    80001c20:	fffff097          	auipc	ra,0xfffff
    80001c24:	7b8080e7          	jalr	1976(ra) # 800013d8 <_ZN7_thread13thread_createEPFvPvES0_S0_>
    80001c28:	00a93023          	sd	a0,0(s2)
            __putc('x');
    80001c2c:	07800513          	li	a0,120
    80001c30:	00002097          	auipc	ra,0x2
    80001c34:	57c080e7          	jalr	1404(ra) # 800041ac <__putc>
    80001c38:	f9dff06f          	j	80001bd4 <_ZN5riscv20handleSupervisorTrapEv+0xbc>
            _thread::thread_exit();
    80001c3c:	00000097          	auipc	ra,0x0
    80001c40:	91c080e7          	jalr	-1764(ra) # 80001558 <_ZN7_thread11thread_exitEv>
    80001c44:	f91ff06f          	j	80001bd4 <_ZN5riscv20handleSupervisorTrapEv+0xbc>
            _thread::thread_dispatch();
    80001c48:	00000097          	auipc	ra,0x0
    80001c4c:	8a0080e7          	jalr	-1888(ra) # 800014e8 <_ZN7_thread15thread_dispatchEv>
    80001c50:	f85ff06f          	j	80001bd4 <_ZN5riscv20handleSupervisorTrapEv+0xbc>
            while(handle->state != 4){
    80001c54:	03893703          	ld	a4,56(s2)
    80001c58:	00400793          	li	a5,4
    80001c5c:	f6f70ce3          	beq	a4,a5,80001bd4 <_ZN5riscv20handleSupervisorTrapEv+0xbc>
                _thread::thread_dispatch();
    80001c60:	00000097          	auipc	ra,0x0
    80001c64:	888080e7          	jalr	-1912(ra) # 800014e8 <_ZN7_thread15thread_dispatchEv>
            while(handle->state != 4){
    80001c68:	fedff06f          	j	80001c54 <_ZN5riscv20handleSupervisorTrapEv+0x13c>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80001c6c:	00200793          	li	a5,2
    80001c70:	1447b073          	csrc	sip,a5
}
    80001c74:	f6dff06f          	j	80001be0 <_ZN5riscv20handleSupervisorTrapEv+0xc8>

0000000080001c78 <_Z41__static_initialization_and_destruction_0ii>:
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(_thread *tcb) {
    readyCoroutineQueue.addLast(tcb);
    80001c78:	ff010113          	addi	sp,sp,-16
    80001c7c:	00813423          	sd	s0,8(sp)
    80001c80:	01010413          	addi	s0,sp,16
    80001c84:	00100793          	li	a5,1
    80001c88:	00f50863          	beq	a0,a5,80001c98 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001c8c:	00813403          	ld	s0,8(sp)
    80001c90:	01010113          	addi	sp,sp,16
    80001c94:	00008067          	ret
    80001c98:	000107b7          	lui	a5,0x10
    80001c9c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001ca0:	fef596e3          	bne	a1,a5,80001c8c <_Z41__static_initialization_and_destruction_0ii+0x14>
        Elem(T *data, Elem *next) : data(data), next(next){}
    };

    Elem *head, *tail;
public:
    List() : head(0), tail(0) {}
    80001ca4:	00004797          	auipc	a5,0x4
    80001ca8:	d5c78793          	addi	a5,a5,-676 # 80005a00 <_ZN9Scheduler19readyCoroutineQueueE>
    80001cac:	0007b023          	sd	zero,0(a5)
    80001cb0:	0007b423          	sd	zero,8(a5)
    80001cb4:	fd9ff06f          	j	80001c8c <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001cb8 <_ZN9Scheduler3getEv>:
_thread *Scheduler::get() {
    80001cb8:	fe010113          	addi	sp,sp,-32
    80001cbc:	00113c23          	sd	ra,24(sp)
    80001cc0:	00813823          	sd	s0,16(sp)
    80001cc4:	00913423          	sd	s1,8(sp)
    80001cc8:	02010413          	addi	s0,sp,32
        }else{
            head = tail = elem;
        }
    }
    T *removeFirst(){
        if(!head){ return 0; }
    80001ccc:	00004517          	auipc	a0,0x4
    80001cd0:	d3453503          	ld	a0,-716(a0) # 80005a00 <_ZN9Scheduler19readyCoroutineQueueE>
    80001cd4:	04050263          	beqz	a0,80001d18 <_ZN9Scheduler3getEv+0x60>

        Elem *elem = head;
        head = head->next;
    80001cd8:	00853783          	ld	a5,8(a0)
    80001cdc:	00004717          	auipc	a4,0x4
    80001ce0:	d2f73223          	sd	a5,-732(a4) # 80005a00 <_ZN9Scheduler19readyCoroutineQueueE>
        if(!head){ tail = 0; }
    80001ce4:	02078463          	beqz	a5,80001d0c <_ZN9Scheduler3getEv+0x54>

        T *ret = elem->data;
    80001ce8:	00053483          	ld	s1,0(a0)
        delete elem;
    80001cec:	00000097          	auipc	ra,0x0
    80001cf0:	c38080e7          	jalr	-968(ra) # 80001924 <_ZdlPv>
}
    80001cf4:	00048513          	mv	a0,s1
    80001cf8:	01813083          	ld	ra,24(sp)
    80001cfc:	01013403          	ld	s0,16(sp)
    80001d00:	00813483          	ld	s1,8(sp)
    80001d04:	02010113          	addi	sp,sp,32
    80001d08:	00008067          	ret
        if(!head){ tail = 0; }
    80001d0c:	00004797          	auipc	a5,0x4
    80001d10:	ce07be23          	sd	zero,-772(a5) # 80005a08 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001d14:	fd5ff06f          	j	80001ce8 <_ZN9Scheduler3getEv+0x30>
        if(!head){ return 0; }
    80001d18:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFirst();
    80001d1c:	fd9ff06f          	j	80001cf4 <_ZN9Scheduler3getEv+0x3c>

0000000080001d20 <_ZN9Scheduler3putEP7_thread>:
void Scheduler::put(_thread *tcb) {
    80001d20:	fe010113          	addi	sp,sp,-32
    80001d24:	00113c23          	sd	ra,24(sp)
    80001d28:	00813823          	sd	s0,16(sp)
    80001d2c:	00913423          	sd	s1,8(sp)
    80001d30:	02010413          	addi	s0,sp,32
    80001d34:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80001d38:	01000513          	li	a0,16
    80001d3c:	00000097          	auipc	ra,0x0
    80001d40:	bc0080e7          	jalr	-1088(ra) # 800018fc <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next){}
    80001d44:	00953023          	sd	s1,0(a0)
    80001d48:	00053423          	sd	zero,8(a0)
        if(tail){
    80001d4c:	00004797          	auipc	a5,0x4
    80001d50:	cbc7b783          	ld	a5,-836(a5) # 80005a08 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001d54:	02078263          	beqz	a5,80001d78 <_ZN9Scheduler3putEP7_thread+0x58>
            tail->next = elem;
    80001d58:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001d5c:	00004797          	auipc	a5,0x4
    80001d60:	caa7b623          	sd	a0,-852(a5) # 80005a08 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001d64:	01813083          	ld	ra,24(sp)
    80001d68:	01013403          	ld	s0,16(sp)
    80001d6c:	00813483          	ld	s1,8(sp)
    80001d70:	02010113          	addi	sp,sp,32
    80001d74:	00008067          	ret
            head = tail = elem;
    80001d78:	00004797          	auipc	a5,0x4
    80001d7c:	c8878793          	addi	a5,a5,-888 # 80005a00 <_ZN9Scheduler19readyCoroutineQueueE>
    80001d80:	00a7b423          	sd	a0,8(a5)
    80001d84:	00a7b023          	sd	a0,0(a5)
    80001d88:	fddff06f          	j	80001d64 <_ZN9Scheduler3putEP7_thread+0x44>

0000000080001d8c <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    80001d8c:	ff010113          	addi	sp,sp,-16
    80001d90:	00113423          	sd	ra,8(sp)
    80001d94:	00813023          	sd	s0,0(sp)
    80001d98:	01010413          	addi	s0,sp,16
    80001d9c:	000105b7          	lui	a1,0x10
    80001da0:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001da4:	00100513          	li	a0,1
    80001da8:	00000097          	auipc	ra,0x0
    80001dac:	ed0080e7          	jalr	-304(ra) # 80001c78 <_Z41__static_initialization_and_destruction_0ii>
    80001db0:	00813083          	ld	ra,8(sp)
    80001db4:	00013403          	ld	s0,0(sp)
    80001db8:	01010113          	addi	sp,sp,16
    80001dbc:	00008067          	ret

0000000080001dc0 <_ZN15MemoryAllocator10initializeEv>:
#include "../h/MemoryAllocator.hpp"

memblock* MemoryAllocator::freeHead = nullptr;
memblock* MemoryAllocator::allocatedHead = nullptr;

void MemoryAllocator::initialize(){
    80001dc0:	ff010113          	addi	sp,sp,-16
    80001dc4:	00813423          	sd	s0,8(sp)
    80001dc8:	01010413          	addi	s0,sp,16
    freeHead = (memblock*) HEAP_START_ADDR;
    80001dcc:	00004797          	auipc	a5,0x4
    80001dd0:	bb47b783          	ld	a5,-1100(a5) # 80005980 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001dd4:	0007b783          	ld	a5,0(a5)
    80001dd8:	00004717          	auipc	a4,0x4
    80001ddc:	c2f73c23          	sd	a5,-968(a4) # 80005a10 <_ZN15MemoryAllocator8freeHeadE>
    freeHead->prev = freeHead->next = nullptr;
    80001de0:	0007b823          	sd	zero,16(a5)
    80001de4:	0007b423          	sd	zero,8(a5)
    freeHead->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR);
    80001de8:	00004717          	auipc	a4,0x4
    80001dec:	bb873703          	ld	a4,-1096(a4) # 800059a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001df0:	00073703          	ld	a4,0(a4)
    80001df4:	40f70733          	sub	a4,a4,a5
    80001df8:	00e7b023          	sd	a4,0(a5)
}
    80001dfc:	00813403          	ld	s0,8(sp)
    80001e00:	01010113          	addi	sp,sp,16
    80001e04:	00008067          	ret

0000000080001e08 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t allocSize) {
    80001e08:	ff010113          	addi	sp,sp,-16
    80001e0c:	00813423          	sd	s0,8(sp)
    80001e10:	01010413          	addi	s0,sp,16
    memblock* currentBlock = freeHead;
    80001e14:	00004617          	auipc	a2,0x4
    80001e18:	bfc63603          	ld	a2,-1028(a2) # 80005a10 <_ZN15MemoryAllocator8freeHeadE>
    int inserted = 0;

    if (allocSize <= MEM_BLOCK_SIZE){
    80001e1c:	04000793          	li	a5,64
    80001e20:	02a7f663          	bgeu	a5,a0,80001e4c <_ZN15MemoryAllocator9mem_allocEm+0x44>
        allocSize = MEM_BLOCK_SIZE;
    } else {
        allocSize = (allocSize / MEM_BLOCK_SIZE + 1) * MEM_BLOCK_SIZE;
    80001e24:	00655693          	srli	a3,a0,0x6
    80001e28:	00168693          	addi	a3,a3,1
    80001e2c:	00669693          	slli	a3,a3,0x6
        allocSize = MEM_BLOCK_SIZE;
    80001e30:	00060513          	mv	a0,a2
    }

    while (currentBlock) {
    80001e34:	06050a63          	beqz	a0,80001ea8 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
        if (currentBlock->size >= allocSize + sizeof(memblock)) {
    80001e38:	00053703          	ld	a4,0(a0)
    80001e3c:	01868793          	addi	a5,a3,24
    80001e40:	00f77a63          	bgeu	a4,a5,80001e54 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
                    freeHead = currentBlock->next;
                }
                break;
            }
        }
        currentBlock = currentBlock->next;
    80001e44:	01053503          	ld	a0,16(a0)
    while (currentBlock) {
    80001e48:	fedff06f          	j	80001e34 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
        allocSize = MEM_BLOCK_SIZE;
    80001e4c:	04000693          	li	a3,64
    80001e50:	fe1ff06f          	j	80001e30 <_ZN15MemoryAllocator9mem_allocEm+0x28>
            if(currentBlock->size > allocSize + sizeof(memblock)) {
    80001e54:	08e7fa63          	bgeu	a5,a4,80001ee8 <_ZN15MemoryAllocator9mem_allocEm+0xe0>
                memblock *blockRemainder = (memblock *) ((char *) currentBlock + sizeof(memblock) + allocSize);
    80001e58:	00f507b3          	add	a5,a0,a5
                blockRemainder->prev = blockRemainder->next = nullptr;
    80001e5c:	0007b823          	sd	zero,16(a5)
    80001e60:	0007b423          	sd	zero,8(a5)
                blockRemainder->size = currentBlock->size - allocSize - sizeof (memblock);
    80001e64:	00053703          	ld	a4,0(a0)
    80001e68:	40d706b3          	sub	a3,a4,a3
    80001e6c:	fe868693          	addi	a3,a3,-24
    80001e70:	00d7b023          	sd	a3,0(a5)
                if(currentBlock->prev){
    80001e74:	00853703          	ld	a4,8(a0)
    80001e78:	00070863          	beqz	a4,80001e88 <_ZN15MemoryAllocator9mem_allocEm+0x80>
                    currentBlock->prev->next = blockRemainder;
    80001e7c:	00f73823          	sd	a5,16(a4)
                    blockRemainder->prev = currentBlock->prev;
    80001e80:	00853703          	ld	a4,8(a0)
    80001e84:	00e7b423          	sd	a4,8(a5)
                if(currentBlock->next){
    80001e88:	01053703          	ld	a4,16(a0)
    80001e8c:	00070863          	beqz	a4,80001e9c <_ZN15MemoryAllocator9mem_allocEm+0x94>
                    currentBlock->next->prev = blockRemainder;
    80001e90:	00f73423          	sd	a5,8(a4)
                    blockRemainder->next = currentBlock->next;
    80001e94:	01053703          	ld	a4,16(a0)
    80001e98:	00e7b823          	sd	a4,16(a5)
                if(currentBlock == freeHead) {
    80001e9c:	00004717          	auipc	a4,0x4
    80001ea0:	b7473703          	ld	a4,-1164(a4) # 80005a10 <_ZN15MemoryAllocator8freeHeadE>
    80001ea4:	02a70c63          	beq	a4,a0,80001edc <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    }
    memblock* currentAllocatedBlock = nullptr;
    if(currentBlock != nullptr) {
    80001ea8:	02050463          	beqz	a0,80001ed0 <_ZN15MemoryAllocator9mem_allocEm+0xc8>
        if (allocatedHead == nullptr) {
    80001eac:	00004797          	auipc	a5,0x4
    80001eb0:	b6c7b783          	ld	a5,-1172(a5) # 80005a18 <_ZN15MemoryAllocator13allocatedHeadE>
    80001eb4:	06078463          	beqz	a5,80001f1c <_ZN15MemoryAllocator9mem_allocEm+0x114>
            allocatedHead = currentBlock;
            allocatedHead->next = allocatedHead->prev = nullptr;
        } else if (currentBlock < allocatedHead) {
    80001eb8:	06f57c63          	bgeu	a0,a5,80001f30 <_ZN15MemoryAllocator9mem_allocEm+0x128>

            currentBlock->next = allocatedHead;
    80001ebc:	00f53823          	sd	a5,16(a0)
            currentBlock->prev = nullptr;
    80001ec0:	00053423          	sd	zero,8(a0)
            allocatedHead = currentBlock;
    80001ec4:	00004797          	auipc	a5,0x4
    80001ec8:	b4a7ba23          	sd	a0,-1196(a5) # 80005a18 <_ZN15MemoryAllocator13allocatedHeadE>
            }
        }


        //if ((void *) ((char *) currentBlock + sizeof(memblock)) != nullptr) {
            return (void *) ((char *) currentBlock + sizeof(memblock));
    80001ecc:	01850513          	addi	a0,a0,24
    // svakom bloku nadji mesto
    // 1. scenario blok je na pocetku
    // 2. scenario blok je u sredini
    // 3. scenario blok je na kraju

}
    80001ed0:	00813403          	ld	s0,8(sp)
    80001ed4:	01010113          	addi	sp,sp,16
    80001ed8:	00008067          	ret
                    freeHead = blockRemainder;
    80001edc:	00004717          	auipc	a4,0x4
    80001ee0:	b2f73a23          	sd	a5,-1228(a4) # 80005a10 <_ZN15MemoryAllocator8freeHeadE>
    80001ee4:	fc5ff06f          	j	80001ea8 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
                if(currentBlock->prev){
    80001ee8:	00853783          	ld	a5,8(a0)
    80001eec:	00078663          	beqz	a5,80001ef8 <_ZN15MemoryAllocator9mem_allocEm+0xf0>
                    currentBlock->prev->next = currentBlock->next;
    80001ef0:	01053703          	ld	a4,16(a0)
    80001ef4:	00e7b823          	sd	a4,16(a5)
                if(currentBlock->next){
    80001ef8:	01053783          	ld	a5,16(a0)
    80001efc:	00078663          	beqz	a5,80001f08 <_ZN15MemoryAllocator9mem_allocEm+0x100>
                    currentBlock->next->prev = currentBlock->prev;
    80001f00:	00853703          	ld	a4,8(a0)
    80001f04:	00e7b423          	sd	a4,8(a5)
                if(currentBlock == freeHead){
    80001f08:	fac510e3          	bne	a0,a2,80001ea8 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
                    freeHead = currentBlock->next;
    80001f0c:	01053783          	ld	a5,16(a0)
    80001f10:	00004717          	auipc	a4,0x4
    80001f14:	b0f73023          	sd	a5,-1280(a4) # 80005a10 <_ZN15MemoryAllocator8freeHeadE>
    80001f18:	f91ff06f          	j	80001ea8 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
            allocatedHead = currentBlock;
    80001f1c:	00004797          	auipc	a5,0x4
    80001f20:	aea7be23          	sd	a0,-1284(a5) # 80005a18 <_ZN15MemoryAllocator13allocatedHeadE>
            allocatedHead->next = allocatedHead->prev = nullptr;
    80001f24:	00053423          	sd	zero,8(a0)
    80001f28:	00053823          	sd	zero,16(a0)
    80001f2c:	fa1ff06f          	j	80001ecc <_ZN15MemoryAllocator9mem_allocEm+0xc4>
            while (currentAllocatedBlock->next) {
    80001f30:	00078713          	mv	a4,a5
    80001f34:	0107b783          	ld	a5,16(a5)
    80001f38:	02078063          	beqz	a5,80001f58 <_ZN15MemoryAllocator9mem_allocEm+0x150>
                if (currentBlock < currentAllocatedBlock) {
    80001f3c:	fee57ae3          	bgeu	a0,a4,80001f30 <_ZN15MemoryAllocator9mem_allocEm+0x128>
                    currentBlock->next = currentAllocatedBlock;
    80001f40:	00e53823          	sd	a4,16(a0)
                    currentBlock->prev = currentAllocatedBlock->prev;
    80001f44:	00873783          	ld	a5,8(a4)
    80001f48:	00f53423          	sd	a5,8(a0)
                    currentAllocatedBlock->prev->next = currentBlock;
    80001f4c:	00a7b823          	sd	a0,16(a5)
                    currentAllocatedBlock->prev = currentBlock;
    80001f50:	00a73423          	sd	a0,8(a4)
            if (inserted == 0) {
    80001f54:	f79ff06f          	j	80001ecc <_ZN15MemoryAllocator9mem_allocEm+0xc4>
                currentBlock->prev = currentAllocatedBlock;
    80001f58:	00e53423          	sd	a4,8(a0)
                currentBlock->next = nullptr;
    80001f5c:	00053823          	sd	zero,16(a0)
                currentAllocatedBlock->next = currentBlock;
    80001f60:	00a73823          	sd	a0,16(a4)
    80001f64:	f69ff06f          	j	80001ecc <_ZN15MemoryAllocator9mem_allocEm+0xc4>

0000000080001f68 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void* ptr) {
    80001f68:	ff010113          	addi	sp,sp,-16
    80001f6c:	00813423          	sd	s0,8(sp)
    80001f70:	01010413          	addi	s0,sp,16
    //dolazi mi pokazivac na adresu pocetka bloka, treba da izvucem taj blok iz liste
    //pa onda da prevezem prev i next ako ima
    if (ptr == nullptr){
    80001f74:	14050e63          	beqz	a0,800020d0 <_ZN15MemoryAllocator8mem_freeEPv+0x168>
        return -1;
    }

    memblock* currentBlock = (memblock *) ((char *) (ptr) - sizeof(memblock));
    80001f78:	fe850613          	addi	a2,a0,-24

    if (allocatedHead == nullptr){
    80001f7c:	00004797          	auipc	a5,0x4
    80001f80:	a9c7b783          	ld	a5,-1380(a5) # 80005a18 <_ZN15MemoryAllocator13allocatedHeadE>
    80001f84:	14078a63          	beqz	a5,800020d8 <_ZN15MemoryAllocator8mem_freeEPv+0x170>
        return -1;
    }

    if(allocatedHead == currentBlock){
    80001f88:	0ac78063          	beq	a5,a2,80002028 <_ZN15MemoryAllocator8mem_freeEPv+0xc0>
        allocatedHead = currentBlock->next;
    }
    if(currentBlock->prev){
    80001f8c:	ff053783          	ld	a5,-16(a0)
    80001f90:	00078663          	beqz	a5,80001f9c <_ZN15MemoryAllocator8mem_freeEPv+0x34>
        currentBlock->prev->next = currentBlock->next;
    80001f94:	ff853703          	ld	a4,-8(a0)
    80001f98:	00e7b823          	sd	a4,16(a5)
    }
    if(currentBlock->next){
    80001f9c:	ff853783          	ld	a5,-8(a0)
    80001fa0:	00078663          	beqz	a5,80001fac <_ZN15MemoryAllocator8mem_freeEPv+0x44>
        currentBlock->next->prev = currentBlock->prev;
    80001fa4:	ff053703          	ld	a4,-16(a0)
    80001fa8:	00e7b423          	sd	a4,8(a5)
    //ubaci blok u niz free
    //probaj na pocetak
    //probaj u sredinu
    //probaj na kraj

    if(freeHead == nullptr){
    80001fac:	00004797          	auipc	a5,0x4
    80001fb0:	a647b783          	ld	a5,-1436(a5) # 80005a10 <_ZN15MemoryAllocator8freeHeadE>
    80001fb4:	08078263          	beqz	a5,80002038 <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
        freeHead->next = freeHead->prev = nullptr;
        freeHead = currentBlock;
    } else
    if(currentBlock < freeHead){
    80001fb8:	08f67a63          	bgeu	a2,a5,8000204c <_ZN15MemoryAllocator8mem_freeEPv+0xe4>
        freeHead->prev = currentBlock;
    80001fbc:	00c7b423          	sd	a2,8(a5)
        currentBlock->next = freeHead;
    80001fc0:	fef53c23          	sd	a5,-8(a0)
        freeHead = currentBlock;
    80001fc4:	00004797          	auipc	a5,0x4
    80001fc8:	a4c7b623          	sd	a2,-1460(a5) # 80005a10 <_ZN15MemoryAllocator8freeHeadE>
        freeHead->prev = nullptr;
    80001fcc:	00063423          	sd	zero,8(a2)
        }
    }

    // probaj da spojis oslobodjeni blok sa delovima oko sebe da ne bi doslo do fragmentacije

    if(currentBlock->prev){
    80001fd0:	ff053703          	ld	a4,-16(a0)
    80001fd4:	02070063          	beqz	a4,80001ff4 <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
        memblock* curr = currentBlock->prev;
        if((char*)(curr + curr->size + sizeof(memblock)) == (char*)currentBlock){
    80001fd8:	00073683          	ld	a3,0(a4)
    80001fdc:	00169793          	slli	a5,a3,0x1
    80001fe0:	00d787b3          	add	a5,a5,a3
    80001fe4:	00379793          	slli	a5,a5,0x3
    80001fe8:	24078793          	addi	a5,a5,576
    80001fec:	00f707b3          	add	a5,a4,a5
    80001ff0:	08c78c63          	beq	a5,a2,80002088 <_ZN15MemoryAllocator8mem_freeEPv+0x120>
                currentBlock->next->prev = curr;
            }
        }
    }

    if (currentBlock->next){
    80001ff4:	ff853703          	ld	a4,-8(a0)
    80001ff8:	0e070463          	beqz	a4,800020e0 <_ZN15MemoryAllocator8mem_freeEPv+0x178>
        memblock* curr = currentBlock->next;
        if((char*)(currentBlock + currentBlock->size + sizeof(memblock)) == (char*)curr){
    80001ffc:	fe853683          	ld	a3,-24(a0)
    80002000:	00169793          	slli	a5,a3,0x1
    80002004:	00d787b3          	add	a5,a5,a3
    80002008:	00379793          	slli	a5,a5,0x3
    8000200c:	24078793          	addi	a5,a5,576
    80002010:	00f607b3          	add	a5,a2,a5
    80002014:	08f70a63          	beq	a4,a5,800020a8 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
                currentBlock->next = curr->next;
            }
        }
    }

    return 0;
    80002018:	00000513          	li	a0,0

}
    8000201c:	00813403          	ld	s0,8(sp)
    80002020:	01010113          	addi	sp,sp,16
    80002024:	00008067          	ret
        allocatedHead = currentBlock->next;
    80002028:	ff853783          	ld	a5,-8(a0)
    8000202c:	00004717          	auipc	a4,0x4
    80002030:	9ef73623          	sd	a5,-1556(a4) # 80005a18 <_ZN15MemoryAllocator13allocatedHeadE>
    80002034:	f59ff06f          	j	80001f8c <_ZN15MemoryAllocator8mem_freeEPv+0x24>
        freeHead->next = freeHead->prev = nullptr;
    80002038:	0007b423          	sd	zero,8(a5)
    8000203c:	0007b823          	sd	zero,16(a5)
        freeHead = currentBlock;
    80002040:	00004797          	auipc	a5,0x4
    80002044:	9cc7b823          	sd	a2,-1584(a5) # 80005a10 <_ZN15MemoryAllocator8freeHeadE>
    80002048:	f89ff06f          	j	80001fd0 <_ZN15MemoryAllocator8mem_freeEPv+0x68>
        while (curr->next && curr->next < currentBlock){
    8000204c:	00078713          	mv	a4,a5
    80002050:	0107b783          	ld	a5,16(a5)
    80002054:	00078463          	beqz	a5,8000205c <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
    80002058:	fec7eae3          	bltu	a5,a2,8000204c <_ZN15MemoryAllocator8mem_freeEPv+0xe4>
        if(curr->next == nullptr){
    8000205c:	02078063          	beqz	a5,8000207c <_ZN15MemoryAllocator8mem_freeEPv+0x114>
            currentBlock->prev = curr;
    80002060:	fee53823          	sd	a4,-16(a0)
            curr->next->prev = currentBlock;
    80002064:	01073783          	ld	a5,16(a4)
    80002068:	00c7b423          	sd	a2,8(a5)
            currentBlock->next = curr->next;
    8000206c:	01073783          	ld	a5,16(a4)
    80002070:	fef53c23          	sd	a5,-8(a0)
            curr->next = currentBlock;
    80002074:	00c73823          	sd	a2,16(a4)
    80002078:	f59ff06f          	j	80001fd0 <_ZN15MemoryAllocator8mem_freeEPv+0x68>
            curr->next = currentBlock;
    8000207c:	00c73823          	sd	a2,16(a4)
            currentBlock->prev = curr;
    80002080:	fee53823          	sd	a4,-16(a0)
    80002084:	f4dff06f          	j	80001fd0 <_ZN15MemoryAllocator8mem_freeEPv+0x68>
            curr->size = curr->size + currentBlock->size;
    80002088:	fe853783          	ld	a5,-24(a0)
    8000208c:	00f686b3          	add	a3,a3,a5
    80002090:	00d73023          	sd	a3,0(a4)
            if(currentBlock->next) {
    80002094:	ff853783          	ld	a5,-8(a0)
    80002098:	f4078ee3          	beqz	a5,80001ff4 <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
                curr->next = currentBlock->next;
    8000209c:	00f73823          	sd	a5,16(a4)
                currentBlock->next->prev = curr;
    800020a0:	00e7b423          	sd	a4,8(a5)
    800020a4:	f51ff06f          	j	80001ff4 <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
            currentBlock->size = currentBlock->size + curr ->size;
    800020a8:	00073783          	ld	a5,0(a4)
    800020ac:	00f686b3          	add	a3,a3,a5
    800020b0:	fed53423          	sd	a3,-24(a0)
            if(curr->next) {
    800020b4:	01073783          	ld	a5,16(a4)
    800020b8:	02078863          	beqz	a5,800020e8 <_ZN15MemoryAllocator8mem_freeEPv+0x180>
                curr->next->prev = currentBlock;
    800020bc:	00c7b423          	sd	a2,8(a5)
                currentBlock->next = curr->next;
    800020c0:	01073783          	ld	a5,16(a4)
    800020c4:	fef53c23          	sd	a5,-8(a0)
    return 0;
    800020c8:	00000513          	li	a0,0
    800020cc:	f51ff06f          	j	8000201c <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
        return -1;
    800020d0:	fff00513          	li	a0,-1
    800020d4:	f49ff06f          	j	8000201c <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
        return -1;
    800020d8:	fff00513          	li	a0,-1
    800020dc:	f41ff06f          	j	8000201c <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
    return 0;
    800020e0:	00000513          	li	a0,0
    800020e4:	f39ff06f          	j	8000201c <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
    800020e8:	00000513          	li	a0,0
    800020ec:	f31ff06f          	j	8000201c <_ZN15MemoryAllocator8mem_freeEPv+0xb4>

00000000800020f0 <start>:
    800020f0:	ff010113          	addi	sp,sp,-16
    800020f4:	00813423          	sd	s0,8(sp)
    800020f8:	01010413          	addi	s0,sp,16
    800020fc:	300027f3          	csrr	a5,mstatus
    80002100:	ffffe737          	lui	a4,0xffffe
    80002104:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7b7f>
    80002108:	00e7f7b3          	and	a5,a5,a4
    8000210c:	00001737          	lui	a4,0x1
    80002110:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002114:	00e7e7b3          	or	a5,a5,a4
    80002118:	30079073          	csrw	mstatus,a5
    8000211c:	00000797          	auipc	a5,0x0
    80002120:	16078793          	addi	a5,a5,352 # 8000227c <system_main>
    80002124:	34179073          	csrw	mepc,a5
    80002128:	00000793          	li	a5,0
    8000212c:	18079073          	csrw	satp,a5
    80002130:	000107b7          	lui	a5,0x10
    80002134:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002138:	30279073          	csrw	medeleg,a5
    8000213c:	30379073          	csrw	mideleg,a5
    80002140:	104027f3          	csrr	a5,sie
    80002144:	2227e793          	ori	a5,a5,546
    80002148:	10479073          	csrw	sie,a5
    8000214c:	fff00793          	li	a5,-1
    80002150:	00a7d793          	srli	a5,a5,0xa
    80002154:	3b079073          	csrw	pmpaddr0,a5
    80002158:	00f00793          	li	a5,15
    8000215c:	3a079073          	csrw	pmpcfg0,a5
    80002160:	f14027f3          	csrr	a5,mhartid
    80002164:	0200c737          	lui	a4,0x200c
    80002168:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000216c:	0007869b          	sext.w	a3,a5
    80002170:	00269713          	slli	a4,a3,0x2
    80002174:	000f4637          	lui	a2,0xf4
    80002178:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000217c:	00d70733          	add	a4,a4,a3
    80002180:	0037979b          	slliw	a5,a5,0x3
    80002184:	020046b7          	lui	a3,0x2004
    80002188:	00d787b3          	add	a5,a5,a3
    8000218c:	00c585b3          	add	a1,a1,a2
    80002190:	00371693          	slli	a3,a4,0x3
    80002194:	00004717          	auipc	a4,0x4
    80002198:	88c70713          	addi	a4,a4,-1908 # 80005a20 <timer_scratch>
    8000219c:	00b7b023          	sd	a1,0(a5)
    800021a0:	00d70733          	add	a4,a4,a3
    800021a4:	00f73c23          	sd	a5,24(a4)
    800021a8:	02c73023          	sd	a2,32(a4)
    800021ac:	34071073          	csrw	mscratch,a4
    800021b0:	00000797          	auipc	a5,0x0
    800021b4:	6e078793          	addi	a5,a5,1760 # 80002890 <timervec>
    800021b8:	30579073          	csrw	mtvec,a5
    800021bc:	300027f3          	csrr	a5,mstatus
    800021c0:	0087e793          	ori	a5,a5,8
    800021c4:	30079073          	csrw	mstatus,a5
    800021c8:	304027f3          	csrr	a5,mie
    800021cc:	0807e793          	ori	a5,a5,128
    800021d0:	30479073          	csrw	mie,a5
    800021d4:	f14027f3          	csrr	a5,mhartid
    800021d8:	0007879b          	sext.w	a5,a5
    800021dc:	00078213          	mv	tp,a5
    800021e0:	30200073          	mret
    800021e4:	00813403          	ld	s0,8(sp)
    800021e8:	01010113          	addi	sp,sp,16
    800021ec:	00008067          	ret

00000000800021f0 <timerinit>:
    800021f0:	ff010113          	addi	sp,sp,-16
    800021f4:	00813423          	sd	s0,8(sp)
    800021f8:	01010413          	addi	s0,sp,16
    800021fc:	f14027f3          	csrr	a5,mhartid
    80002200:	0200c737          	lui	a4,0x200c
    80002204:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002208:	0007869b          	sext.w	a3,a5
    8000220c:	00269713          	slli	a4,a3,0x2
    80002210:	000f4637          	lui	a2,0xf4
    80002214:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002218:	00d70733          	add	a4,a4,a3
    8000221c:	0037979b          	slliw	a5,a5,0x3
    80002220:	020046b7          	lui	a3,0x2004
    80002224:	00d787b3          	add	a5,a5,a3
    80002228:	00c585b3          	add	a1,a1,a2
    8000222c:	00371693          	slli	a3,a4,0x3
    80002230:	00003717          	auipc	a4,0x3
    80002234:	7f070713          	addi	a4,a4,2032 # 80005a20 <timer_scratch>
    80002238:	00b7b023          	sd	a1,0(a5)
    8000223c:	00d70733          	add	a4,a4,a3
    80002240:	00f73c23          	sd	a5,24(a4)
    80002244:	02c73023          	sd	a2,32(a4)
    80002248:	34071073          	csrw	mscratch,a4
    8000224c:	00000797          	auipc	a5,0x0
    80002250:	64478793          	addi	a5,a5,1604 # 80002890 <timervec>
    80002254:	30579073          	csrw	mtvec,a5
    80002258:	300027f3          	csrr	a5,mstatus
    8000225c:	0087e793          	ori	a5,a5,8
    80002260:	30079073          	csrw	mstatus,a5
    80002264:	304027f3          	csrr	a5,mie
    80002268:	0807e793          	ori	a5,a5,128
    8000226c:	30479073          	csrw	mie,a5
    80002270:	00813403          	ld	s0,8(sp)
    80002274:	01010113          	addi	sp,sp,16
    80002278:	00008067          	ret

000000008000227c <system_main>:
    8000227c:	fe010113          	addi	sp,sp,-32
    80002280:	00813823          	sd	s0,16(sp)
    80002284:	00913423          	sd	s1,8(sp)
    80002288:	00113c23          	sd	ra,24(sp)
    8000228c:	02010413          	addi	s0,sp,32
    80002290:	00000097          	auipc	ra,0x0
    80002294:	0c4080e7          	jalr	196(ra) # 80002354 <cpuid>
    80002298:	00003497          	auipc	s1,0x3
    8000229c:	72848493          	addi	s1,s1,1832 # 800059c0 <started>
    800022a0:	02050263          	beqz	a0,800022c4 <system_main+0x48>
    800022a4:	0004a783          	lw	a5,0(s1)
    800022a8:	0007879b          	sext.w	a5,a5
    800022ac:	fe078ce3          	beqz	a5,800022a4 <system_main+0x28>
    800022b0:	0ff0000f          	fence
    800022b4:	00003517          	auipc	a0,0x3
    800022b8:	d9c50513          	addi	a0,a0,-612 # 80005050 <CONSOLE_STATUS+0x40>
    800022bc:	00001097          	auipc	ra,0x1
    800022c0:	a70080e7          	jalr	-1424(ra) # 80002d2c <panic>
    800022c4:	00001097          	auipc	ra,0x1
    800022c8:	9c4080e7          	jalr	-1596(ra) # 80002c88 <consoleinit>
    800022cc:	00001097          	auipc	ra,0x1
    800022d0:	150080e7          	jalr	336(ra) # 8000341c <printfinit>
    800022d4:	00003517          	auipc	a0,0x3
    800022d8:	e5c50513          	addi	a0,a0,-420 # 80005130 <CONSOLE_STATUS+0x120>
    800022dc:	00001097          	auipc	ra,0x1
    800022e0:	aac080e7          	jalr	-1364(ra) # 80002d88 <__printf>
    800022e4:	00003517          	auipc	a0,0x3
    800022e8:	d3c50513          	addi	a0,a0,-708 # 80005020 <CONSOLE_STATUS+0x10>
    800022ec:	00001097          	auipc	ra,0x1
    800022f0:	a9c080e7          	jalr	-1380(ra) # 80002d88 <__printf>
    800022f4:	00003517          	auipc	a0,0x3
    800022f8:	e3c50513          	addi	a0,a0,-452 # 80005130 <CONSOLE_STATUS+0x120>
    800022fc:	00001097          	auipc	ra,0x1
    80002300:	a8c080e7          	jalr	-1396(ra) # 80002d88 <__printf>
    80002304:	00001097          	auipc	ra,0x1
    80002308:	4a4080e7          	jalr	1188(ra) # 800037a8 <kinit>
    8000230c:	00000097          	auipc	ra,0x0
    80002310:	148080e7          	jalr	328(ra) # 80002454 <trapinit>
    80002314:	00000097          	auipc	ra,0x0
    80002318:	16c080e7          	jalr	364(ra) # 80002480 <trapinithart>
    8000231c:	00000097          	auipc	ra,0x0
    80002320:	5b4080e7          	jalr	1460(ra) # 800028d0 <plicinit>
    80002324:	00000097          	auipc	ra,0x0
    80002328:	5d4080e7          	jalr	1492(ra) # 800028f8 <plicinithart>
    8000232c:	00000097          	auipc	ra,0x0
    80002330:	078080e7          	jalr	120(ra) # 800023a4 <userinit>
    80002334:	0ff0000f          	fence
    80002338:	00100793          	li	a5,1
    8000233c:	00003517          	auipc	a0,0x3
    80002340:	cfc50513          	addi	a0,a0,-772 # 80005038 <CONSOLE_STATUS+0x28>
    80002344:	00f4a023          	sw	a5,0(s1)
    80002348:	00001097          	auipc	ra,0x1
    8000234c:	a40080e7          	jalr	-1472(ra) # 80002d88 <__printf>
    80002350:	0000006f          	j	80002350 <system_main+0xd4>

0000000080002354 <cpuid>:
    80002354:	ff010113          	addi	sp,sp,-16
    80002358:	00813423          	sd	s0,8(sp)
    8000235c:	01010413          	addi	s0,sp,16
    80002360:	00020513          	mv	a0,tp
    80002364:	00813403          	ld	s0,8(sp)
    80002368:	0005051b          	sext.w	a0,a0
    8000236c:	01010113          	addi	sp,sp,16
    80002370:	00008067          	ret

0000000080002374 <mycpu>:
    80002374:	ff010113          	addi	sp,sp,-16
    80002378:	00813423          	sd	s0,8(sp)
    8000237c:	01010413          	addi	s0,sp,16
    80002380:	00020793          	mv	a5,tp
    80002384:	00813403          	ld	s0,8(sp)
    80002388:	0007879b          	sext.w	a5,a5
    8000238c:	00779793          	slli	a5,a5,0x7
    80002390:	00004517          	auipc	a0,0x4
    80002394:	6c050513          	addi	a0,a0,1728 # 80006a50 <cpus>
    80002398:	00f50533          	add	a0,a0,a5
    8000239c:	01010113          	addi	sp,sp,16
    800023a0:	00008067          	ret

00000000800023a4 <userinit>:
    800023a4:	ff010113          	addi	sp,sp,-16
    800023a8:	00813423          	sd	s0,8(sp)
    800023ac:	01010413          	addi	s0,sp,16
    800023b0:	00813403          	ld	s0,8(sp)
    800023b4:	01010113          	addi	sp,sp,16
    800023b8:	fffff317          	auipc	t1,0xfffff
    800023bc:	4b430067          	jr	1204(t1) # 8000186c <main>

00000000800023c0 <either_copyout>:
    800023c0:	ff010113          	addi	sp,sp,-16
    800023c4:	00813023          	sd	s0,0(sp)
    800023c8:	00113423          	sd	ra,8(sp)
    800023cc:	01010413          	addi	s0,sp,16
    800023d0:	02051663          	bnez	a0,800023fc <either_copyout+0x3c>
    800023d4:	00058513          	mv	a0,a1
    800023d8:	00060593          	mv	a1,a2
    800023dc:	0006861b          	sext.w	a2,a3
    800023e0:	00002097          	auipc	ra,0x2
    800023e4:	c54080e7          	jalr	-940(ra) # 80004034 <__memmove>
    800023e8:	00813083          	ld	ra,8(sp)
    800023ec:	00013403          	ld	s0,0(sp)
    800023f0:	00000513          	li	a0,0
    800023f4:	01010113          	addi	sp,sp,16
    800023f8:	00008067          	ret
    800023fc:	00003517          	auipc	a0,0x3
    80002400:	c7c50513          	addi	a0,a0,-900 # 80005078 <CONSOLE_STATUS+0x68>
    80002404:	00001097          	auipc	ra,0x1
    80002408:	928080e7          	jalr	-1752(ra) # 80002d2c <panic>

000000008000240c <either_copyin>:
    8000240c:	ff010113          	addi	sp,sp,-16
    80002410:	00813023          	sd	s0,0(sp)
    80002414:	00113423          	sd	ra,8(sp)
    80002418:	01010413          	addi	s0,sp,16
    8000241c:	02059463          	bnez	a1,80002444 <either_copyin+0x38>
    80002420:	00060593          	mv	a1,a2
    80002424:	0006861b          	sext.w	a2,a3
    80002428:	00002097          	auipc	ra,0x2
    8000242c:	c0c080e7          	jalr	-1012(ra) # 80004034 <__memmove>
    80002430:	00813083          	ld	ra,8(sp)
    80002434:	00013403          	ld	s0,0(sp)
    80002438:	00000513          	li	a0,0
    8000243c:	01010113          	addi	sp,sp,16
    80002440:	00008067          	ret
    80002444:	00003517          	auipc	a0,0x3
    80002448:	c5c50513          	addi	a0,a0,-932 # 800050a0 <CONSOLE_STATUS+0x90>
    8000244c:	00001097          	auipc	ra,0x1
    80002450:	8e0080e7          	jalr	-1824(ra) # 80002d2c <panic>

0000000080002454 <trapinit>:
    80002454:	ff010113          	addi	sp,sp,-16
    80002458:	00813423          	sd	s0,8(sp)
    8000245c:	01010413          	addi	s0,sp,16
    80002460:	00813403          	ld	s0,8(sp)
    80002464:	00003597          	auipc	a1,0x3
    80002468:	c6458593          	addi	a1,a1,-924 # 800050c8 <CONSOLE_STATUS+0xb8>
    8000246c:	00004517          	auipc	a0,0x4
    80002470:	66450513          	addi	a0,a0,1636 # 80006ad0 <tickslock>
    80002474:	01010113          	addi	sp,sp,16
    80002478:	00001317          	auipc	t1,0x1
    8000247c:	5c030067          	jr	1472(t1) # 80003a38 <initlock>

0000000080002480 <trapinithart>:
    80002480:	ff010113          	addi	sp,sp,-16
    80002484:	00813423          	sd	s0,8(sp)
    80002488:	01010413          	addi	s0,sp,16
    8000248c:	00000797          	auipc	a5,0x0
    80002490:	2f478793          	addi	a5,a5,756 # 80002780 <kernelvec>
    80002494:	10579073          	csrw	stvec,a5
    80002498:	00813403          	ld	s0,8(sp)
    8000249c:	01010113          	addi	sp,sp,16
    800024a0:	00008067          	ret

00000000800024a4 <usertrap>:
    800024a4:	ff010113          	addi	sp,sp,-16
    800024a8:	00813423          	sd	s0,8(sp)
    800024ac:	01010413          	addi	s0,sp,16
    800024b0:	00813403          	ld	s0,8(sp)
    800024b4:	01010113          	addi	sp,sp,16
    800024b8:	00008067          	ret

00000000800024bc <usertrapret>:
    800024bc:	ff010113          	addi	sp,sp,-16
    800024c0:	00813423          	sd	s0,8(sp)
    800024c4:	01010413          	addi	s0,sp,16
    800024c8:	00813403          	ld	s0,8(sp)
    800024cc:	01010113          	addi	sp,sp,16
    800024d0:	00008067          	ret

00000000800024d4 <kerneltrap>:
    800024d4:	fe010113          	addi	sp,sp,-32
    800024d8:	00813823          	sd	s0,16(sp)
    800024dc:	00113c23          	sd	ra,24(sp)
    800024e0:	00913423          	sd	s1,8(sp)
    800024e4:	02010413          	addi	s0,sp,32
    800024e8:	142025f3          	csrr	a1,scause
    800024ec:	100027f3          	csrr	a5,sstatus
    800024f0:	0027f793          	andi	a5,a5,2
    800024f4:	10079c63          	bnez	a5,8000260c <kerneltrap+0x138>
    800024f8:	142027f3          	csrr	a5,scause
    800024fc:	0207ce63          	bltz	a5,80002538 <kerneltrap+0x64>
    80002500:	00003517          	auipc	a0,0x3
    80002504:	c1050513          	addi	a0,a0,-1008 # 80005110 <CONSOLE_STATUS+0x100>
    80002508:	00001097          	auipc	ra,0x1
    8000250c:	880080e7          	jalr	-1920(ra) # 80002d88 <__printf>
    80002510:	141025f3          	csrr	a1,sepc
    80002514:	14302673          	csrr	a2,stval
    80002518:	00003517          	auipc	a0,0x3
    8000251c:	c0850513          	addi	a0,a0,-1016 # 80005120 <CONSOLE_STATUS+0x110>
    80002520:	00001097          	auipc	ra,0x1
    80002524:	868080e7          	jalr	-1944(ra) # 80002d88 <__printf>
    80002528:	00003517          	auipc	a0,0x3
    8000252c:	c1050513          	addi	a0,a0,-1008 # 80005138 <CONSOLE_STATUS+0x128>
    80002530:	00000097          	auipc	ra,0x0
    80002534:	7fc080e7          	jalr	2044(ra) # 80002d2c <panic>
    80002538:	0ff7f713          	andi	a4,a5,255
    8000253c:	00900693          	li	a3,9
    80002540:	04d70063          	beq	a4,a3,80002580 <kerneltrap+0xac>
    80002544:	fff00713          	li	a4,-1
    80002548:	03f71713          	slli	a4,a4,0x3f
    8000254c:	00170713          	addi	a4,a4,1
    80002550:	fae798e3          	bne	a5,a4,80002500 <kerneltrap+0x2c>
    80002554:	00000097          	auipc	ra,0x0
    80002558:	e00080e7          	jalr	-512(ra) # 80002354 <cpuid>
    8000255c:	06050663          	beqz	a0,800025c8 <kerneltrap+0xf4>
    80002560:	144027f3          	csrr	a5,sip
    80002564:	ffd7f793          	andi	a5,a5,-3
    80002568:	14479073          	csrw	sip,a5
    8000256c:	01813083          	ld	ra,24(sp)
    80002570:	01013403          	ld	s0,16(sp)
    80002574:	00813483          	ld	s1,8(sp)
    80002578:	02010113          	addi	sp,sp,32
    8000257c:	00008067          	ret
    80002580:	00000097          	auipc	ra,0x0
    80002584:	3c4080e7          	jalr	964(ra) # 80002944 <plic_claim>
    80002588:	00a00793          	li	a5,10
    8000258c:	00050493          	mv	s1,a0
    80002590:	06f50863          	beq	a0,a5,80002600 <kerneltrap+0x12c>
    80002594:	fc050ce3          	beqz	a0,8000256c <kerneltrap+0x98>
    80002598:	00050593          	mv	a1,a0
    8000259c:	00003517          	auipc	a0,0x3
    800025a0:	b5450513          	addi	a0,a0,-1196 # 800050f0 <CONSOLE_STATUS+0xe0>
    800025a4:	00000097          	auipc	ra,0x0
    800025a8:	7e4080e7          	jalr	2020(ra) # 80002d88 <__printf>
    800025ac:	01013403          	ld	s0,16(sp)
    800025b0:	01813083          	ld	ra,24(sp)
    800025b4:	00048513          	mv	a0,s1
    800025b8:	00813483          	ld	s1,8(sp)
    800025bc:	02010113          	addi	sp,sp,32
    800025c0:	00000317          	auipc	t1,0x0
    800025c4:	3bc30067          	jr	956(t1) # 8000297c <plic_complete>
    800025c8:	00004517          	auipc	a0,0x4
    800025cc:	50850513          	addi	a0,a0,1288 # 80006ad0 <tickslock>
    800025d0:	00001097          	auipc	ra,0x1
    800025d4:	48c080e7          	jalr	1164(ra) # 80003a5c <acquire>
    800025d8:	00003717          	auipc	a4,0x3
    800025dc:	3ec70713          	addi	a4,a4,1004 # 800059c4 <ticks>
    800025e0:	00072783          	lw	a5,0(a4)
    800025e4:	00004517          	auipc	a0,0x4
    800025e8:	4ec50513          	addi	a0,a0,1260 # 80006ad0 <tickslock>
    800025ec:	0017879b          	addiw	a5,a5,1
    800025f0:	00f72023          	sw	a5,0(a4)
    800025f4:	00001097          	auipc	ra,0x1
    800025f8:	534080e7          	jalr	1332(ra) # 80003b28 <release>
    800025fc:	f65ff06f          	j	80002560 <kerneltrap+0x8c>
    80002600:	00001097          	auipc	ra,0x1
    80002604:	090080e7          	jalr	144(ra) # 80003690 <uartintr>
    80002608:	fa5ff06f          	j	800025ac <kerneltrap+0xd8>
    8000260c:	00003517          	auipc	a0,0x3
    80002610:	ac450513          	addi	a0,a0,-1340 # 800050d0 <CONSOLE_STATUS+0xc0>
    80002614:	00000097          	auipc	ra,0x0
    80002618:	718080e7          	jalr	1816(ra) # 80002d2c <panic>

000000008000261c <clockintr>:
    8000261c:	fe010113          	addi	sp,sp,-32
    80002620:	00813823          	sd	s0,16(sp)
    80002624:	00913423          	sd	s1,8(sp)
    80002628:	00113c23          	sd	ra,24(sp)
    8000262c:	02010413          	addi	s0,sp,32
    80002630:	00004497          	auipc	s1,0x4
    80002634:	4a048493          	addi	s1,s1,1184 # 80006ad0 <tickslock>
    80002638:	00048513          	mv	a0,s1
    8000263c:	00001097          	auipc	ra,0x1
    80002640:	420080e7          	jalr	1056(ra) # 80003a5c <acquire>
    80002644:	00003717          	auipc	a4,0x3
    80002648:	38070713          	addi	a4,a4,896 # 800059c4 <ticks>
    8000264c:	00072783          	lw	a5,0(a4)
    80002650:	01013403          	ld	s0,16(sp)
    80002654:	01813083          	ld	ra,24(sp)
    80002658:	00048513          	mv	a0,s1
    8000265c:	0017879b          	addiw	a5,a5,1
    80002660:	00813483          	ld	s1,8(sp)
    80002664:	00f72023          	sw	a5,0(a4)
    80002668:	02010113          	addi	sp,sp,32
    8000266c:	00001317          	auipc	t1,0x1
    80002670:	4bc30067          	jr	1212(t1) # 80003b28 <release>

0000000080002674 <devintr>:
    80002674:	142027f3          	csrr	a5,scause
    80002678:	00000513          	li	a0,0
    8000267c:	0007c463          	bltz	a5,80002684 <devintr+0x10>
    80002680:	00008067          	ret
    80002684:	fe010113          	addi	sp,sp,-32
    80002688:	00813823          	sd	s0,16(sp)
    8000268c:	00113c23          	sd	ra,24(sp)
    80002690:	00913423          	sd	s1,8(sp)
    80002694:	02010413          	addi	s0,sp,32
    80002698:	0ff7f713          	andi	a4,a5,255
    8000269c:	00900693          	li	a3,9
    800026a0:	04d70c63          	beq	a4,a3,800026f8 <devintr+0x84>
    800026a4:	fff00713          	li	a4,-1
    800026a8:	03f71713          	slli	a4,a4,0x3f
    800026ac:	00170713          	addi	a4,a4,1
    800026b0:	00e78c63          	beq	a5,a4,800026c8 <devintr+0x54>
    800026b4:	01813083          	ld	ra,24(sp)
    800026b8:	01013403          	ld	s0,16(sp)
    800026bc:	00813483          	ld	s1,8(sp)
    800026c0:	02010113          	addi	sp,sp,32
    800026c4:	00008067          	ret
    800026c8:	00000097          	auipc	ra,0x0
    800026cc:	c8c080e7          	jalr	-884(ra) # 80002354 <cpuid>
    800026d0:	06050663          	beqz	a0,8000273c <devintr+0xc8>
    800026d4:	144027f3          	csrr	a5,sip
    800026d8:	ffd7f793          	andi	a5,a5,-3
    800026dc:	14479073          	csrw	sip,a5
    800026e0:	01813083          	ld	ra,24(sp)
    800026e4:	01013403          	ld	s0,16(sp)
    800026e8:	00813483          	ld	s1,8(sp)
    800026ec:	00200513          	li	a0,2
    800026f0:	02010113          	addi	sp,sp,32
    800026f4:	00008067          	ret
    800026f8:	00000097          	auipc	ra,0x0
    800026fc:	24c080e7          	jalr	588(ra) # 80002944 <plic_claim>
    80002700:	00a00793          	li	a5,10
    80002704:	00050493          	mv	s1,a0
    80002708:	06f50663          	beq	a0,a5,80002774 <devintr+0x100>
    8000270c:	00100513          	li	a0,1
    80002710:	fa0482e3          	beqz	s1,800026b4 <devintr+0x40>
    80002714:	00048593          	mv	a1,s1
    80002718:	00003517          	auipc	a0,0x3
    8000271c:	9d850513          	addi	a0,a0,-1576 # 800050f0 <CONSOLE_STATUS+0xe0>
    80002720:	00000097          	auipc	ra,0x0
    80002724:	668080e7          	jalr	1640(ra) # 80002d88 <__printf>
    80002728:	00048513          	mv	a0,s1
    8000272c:	00000097          	auipc	ra,0x0
    80002730:	250080e7          	jalr	592(ra) # 8000297c <plic_complete>
    80002734:	00100513          	li	a0,1
    80002738:	f7dff06f          	j	800026b4 <devintr+0x40>
    8000273c:	00004517          	auipc	a0,0x4
    80002740:	39450513          	addi	a0,a0,916 # 80006ad0 <tickslock>
    80002744:	00001097          	auipc	ra,0x1
    80002748:	318080e7          	jalr	792(ra) # 80003a5c <acquire>
    8000274c:	00003717          	auipc	a4,0x3
    80002750:	27870713          	addi	a4,a4,632 # 800059c4 <ticks>
    80002754:	00072783          	lw	a5,0(a4)
    80002758:	00004517          	auipc	a0,0x4
    8000275c:	37850513          	addi	a0,a0,888 # 80006ad0 <tickslock>
    80002760:	0017879b          	addiw	a5,a5,1
    80002764:	00f72023          	sw	a5,0(a4)
    80002768:	00001097          	auipc	ra,0x1
    8000276c:	3c0080e7          	jalr	960(ra) # 80003b28 <release>
    80002770:	f65ff06f          	j	800026d4 <devintr+0x60>
    80002774:	00001097          	auipc	ra,0x1
    80002778:	f1c080e7          	jalr	-228(ra) # 80003690 <uartintr>
    8000277c:	fadff06f          	j	80002728 <devintr+0xb4>

0000000080002780 <kernelvec>:
    80002780:	f0010113          	addi	sp,sp,-256
    80002784:	00113023          	sd	ra,0(sp)
    80002788:	00213423          	sd	sp,8(sp)
    8000278c:	00313823          	sd	gp,16(sp)
    80002790:	00413c23          	sd	tp,24(sp)
    80002794:	02513023          	sd	t0,32(sp)
    80002798:	02613423          	sd	t1,40(sp)
    8000279c:	02713823          	sd	t2,48(sp)
    800027a0:	02813c23          	sd	s0,56(sp)
    800027a4:	04913023          	sd	s1,64(sp)
    800027a8:	04a13423          	sd	a0,72(sp)
    800027ac:	04b13823          	sd	a1,80(sp)
    800027b0:	04c13c23          	sd	a2,88(sp)
    800027b4:	06d13023          	sd	a3,96(sp)
    800027b8:	06e13423          	sd	a4,104(sp)
    800027bc:	06f13823          	sd	a5,112(sp)
    800027c0:	07013c23          	sd	a6,120(sp)
    800027c4:	09113023          	sd	a7,128(sp)
    800027c8:	09213423          	sd	s2,136(sp)
    800027cc:	09313823          	sd	s3,144(sp)
    800027d0:	09413c23          	sd	s4,152(sp)
    800027d4:	0b513023          	sd	s5,160(sp)
    800027d8:	0b613423          	sd	s6,168(sp)
    800027dc:	0b713823          	sd	s7,176(sp)
    800027e0:	0b813c23          	sd	s8,184(sp)
    800027e4:	0d913023          	sd	s9,192(sp)
    800027e8:	0da13423          	sd	s10,200(sp)
    800027ec:	0db13823          	sd	s11,208(sp)
    800027f0:	0dc13c23          	sd	t3,216(sp)
    800027f4:	0fd13023          	sd	t4,224(sp)
    800027f8:	0fe13423          	sd	t5,232(sp)
    800027fc:	0ff13823          	sd	t6,240(sp)
    80002800:	cd5ff0ef          	jal	ra,800024d4 <kerneltrap>
    80002804:	00013083          	ld	ra,0(sp)
    80002808:	00813103          	ld	sp,8(sp)
    8000280c:	01013183          	ld	gp,16(sp)
    80002810:	02013283          	ld	t0,32(sp)
    80002814:	02813303          	ld	t1,40(sp)
    80002818:	03013383          	ld	t2,48(sp)
    8000281c:	03813403          	ld	s0,56(sp)
    80002820:	04013483          	ld	s1,64(sp)
    80002824:	04813503          	ld	a0,72(sp)
    80002828:	05013583          	ld	a1,80(sp)
    8000282c:	05813603          	ld	a2,88(sp)
    80002830:	06013683          	ld	a3,96(sp)
    80002834:	06813703          	ld	a4,104(sp)
    80002838:	07013783          	ld	a5,112(sp)
    8000283c:	07813803          	ld	a6,120(sp)
    80002840:	08013883          	ld	a7,128(sp)
    80002844:	08813903          	ld	s2,136(sp)
    80002848:	09013983          	ld	s3,144(sp)
    8000284c:	09813a03          	ld	s4,152(sp)
    80002850:	0a013a83          	ld	s5,160(sp)
    80002854:	0a813b03          	ld	s6,168(sp)
    80002858:	0b013b83          	ld	s7,176(sp)
    8000285c:	0b813c03          	ld	s8,184(sp)
    80002860:	0c013c83          	ld	s9,192(sp)
    80002864:	0c813d03          	ld	s10,200(sp)
    80002868:	0d013d83          	ld	s11,208(sp)
    8000286c:	0d813e03          	ld	t3,216(sp)
    80002870:	0e013e83          	ld	t4,224(sp)
    80002874:	0e813f03          	ld	t5,232(sp)
    80002878:	0f013f83          	ld	t6,240(sp)
    8000287c:	10010113          	addi	sp,sp,256
    80002880:	10200073          	sret
    80002884:	00000013          	nop
    80002888:	00000013          	nop
    8000288c:	00000013          	nop

0000000080002890 <timervec>:
    80002890:	34051573          	csrrw	a0,mscratch,a0
    80002894:	00b53023          	sd	a1,0(a0)
    80002898:	00c53423          	sd	a2,8(a0)
    8000289c:	00d53823          	sd	a3,16(a0)
    800028a0:	01853583          	ld	a1,24(a0)
    800028a4:	02053603          	ld	a2,32(a0)
    800028a8:	0005b683          	ld	a3,0(a1)
    800028ac:	00c686b3          	add	a3,a3,a2
    800028b0:	00d5b023          	sd	a3,0(a1)
    800028b4:	00200593          	li	a1,2
    800028b8:	14459073          	csrw	sip,a1
    800028bc:	01053683          	ld	a3,16(a0)
    800028c0:	00853603          	ld	a2,8(a0)
    800028c4:	00053583          	ld	a1,0(a0)
    800028c8:	34051573          	csrrw	a0,mscratch,a0
    800028cc:	30200073          	mret

00000000800028d0 <plicinit>:
    800028d0:	ff010113          	addi	sp,sp,-16
    800028d4:	00813423          	sd	s0,8(sp)
    800028d8:	01010413          	addi	s0,sp,16
    800028dc:	00813403          	ld	s0,8(sp)
    800028e0:	0c0007b7          	lui	a5,0xc000
    800028e4:	00100713          	li	a4,1
    800028e8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800028ec:	00e7a223          	sw	a4,4(a5)
    800028f0:	01010113          	addi	sp,sp,16
    800028f4:	00008067          	ret

00000000800028f8 <plicinithart>:
    800028f8:	ff010113          	addi	sp,sp,-16
    800028fc:	00813023          	sd	s0,0(sp)
    80002900:	00113423          	sd	ra,8(sp)
    80002904:	01010413          	addi	s0,sp,16
    80002908:	00000097          	auipc	ra,0x0
    8000290c:	a4c080e7          	jalr	-1460(ra) # 80002354 <cpuid>
    80002910:	0085171b          	slliw	a4,a0,0x8
    80002914:	0c0027b7          	lui	a5,0xc002
    80002918:	00e787b3          	add	a5,a5,a4
    8000291c:	40200713          	li	a4,1026
    80002920:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002924:	00813083          	ld	ra,8(sp)
    80002928:	00013403          	ld	s0,0(sp)
    8000292c:	00d5151b          	slliw	a0,a0,0xd
    80002930:	0c2017b7          	lui	a5,0xc201
    80002934:	00a78533          	add	a0,a5,a0
    80002938:	00052023          	sw	zero,0(a0)
    8000293c:	01010113          	addi	sp,sp,16
    80002940:	00008067          	ret

0000000080002944 <plic_claim>:
    80002944:	ff010113          	addi	sp,sp,-16
    80002948:	00813023          	sd	s0,0(sp)
    8000294c:	00113423          	sd	ra,8(sp)
    80002950:	01010413          	addi	s0,sp,16
    80002954:	00000097          	auipc	ra,0x0
    80002958:	a00080e7          	jalr	-1536(ra) # 80002354 <cpuid>
    8000295c:	00813083          	ld	ra,8(sp)
    80002960:	00013403          	ld	s0,0(sp)
    80002964:	00d5151b          	slliw	a0,a0,0xd
    80002968:	0c2017b7          	lui	a5,0xc201
    8000296c:	00a78533          	add	a0,a5,a0
    80002970:	00452503          	lw	a0,4(a0)
    80002974:	01010113          	addi	sp,sp,16
    80002978:	00008067          	ret

000000008000297c <plic_complete>:
    8000297c:	fe010113          	addi	sp,sp,-32
    80002980:	00813823          	sd	s0,16(sp)
    80002984:	00913423          	sd	s1,8(sp)
    80002988:	00113c23          	sd	ra,24(sp)
    8000298c:	02010413          	addi	s0,sp,32
    80002990:	00050493          	mv	s1,a0
    80002994:	00000097          	auipc	ra,0x0
    80002998:	9c0080e7          	jalr	-1600(ra) # 80002354 <cpuid>
    8000299c:	01813083          	ld	ra,24(sp)
    800029a0:	01013403          	ld	s0,16(sp)
    800029a4:	00d5179b          	slliw	a5,a0,0xd
    800029a8:	0c201737          	lui	a4,0xc201
    800029ac:	00f707b3          	add	a5,a4,a5
    800029b0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800029b4:	00813483          	ld	s1,8(sp)
    800029b8:	02010113          	addi	sp,sp,32
    800029bc:	00008067          	ret

00000000800029c0 <consolewrite>:
    800029c0:	fb010113          	addi	sp,sp,-80
    800029c4:	04813023          	sd	s0,64(sp)
    800029c8:	04113423          	sd	ra,72(sp)
    800029cc:	02913c23          	sd	s1,56(sp)
    800029d0:	03213823          	sd	s2,48(sp)
    800029d4:	03313423          	sd	s3,40(sp)
    800029d8:	03413023          	sd	s4,32(sp)
    800029dc:	01513c23          	sd	s5,24(sp)
    800029e0:	05010413          	addi	s0,sp,80
    800029e4:	06c05c63          	blez	a2,80002a5c <consolewrite+0x9c>
    800029e8:	00060993          	mv	s3,a2
    800029ec:	00050a13          	mv	s4,a0
    800029f0:	00058493          	mv	s1,a1
    800029f4:	00000913          	li	s2,0
    800029f8:	fff00a93          	li	s5,-1
    800029fc:	01c0006f          	j	80002a18 <consolewrite+0x58>
    80002a00:	fbf44503          	lbu	a0,-65(s0)
    80002a04:	0019091b          	addiw	s2,s2,1
    80002a08:	00148493          	addi	s1,s1,1
    80002a0c:	00001097          	auipc	ra,0x1
    80002a10:	a9c080e7          	jalr	-1380(ra) # 800034a8 <uartputc>
    80002a14:	03298063          	beq	s3,s2,80002a34 <consolewrite+0x74>
    80002a18:	00048613          	mv	a2,s1
    80002a1c:	00100693          	li	a3,1
    80002a20:	000a0593          	mv	a1,s4
    80002a24:	fbf40513          	addi	a0,s0,-65
    80002a28:	00000097          	auipc	ra,0x0
    80002a2c:	9e4080e7          	jalr	-1564(ra) # 8000240c <either_copyin>
    80002a30:	fd5518e3          	bne	a0,s5,80002a00 <consolewrite+0x40>
    80002a34:	04813083          	ld	ra,72(sp)
    80002a38:	04013403          	ld	s0,64(sp)
    80002a3c:	03813483          	ld	s1,56(sp)
    80002a40:	02813983          	ld	s3,40(sp)
    80002a44:	02013a03          	ld	s4,32(sp)
    80002a48:	01813a83          	ld	s5,24(sp)
    80002a4c:	00090513          	mv	a0,s2
    80002a50:	03013903          	ld	s2,48(sp)
    80002a54:	05010113          	addi	sp,sp,80
    80002a58:	00008067          	ret
    80002a5c:	00000913          	li	s2,0
    80002a60:	fd5ff06f          	j	80002a34 <consolewrite+0x74>

0000000080002a64 <consoleread>:
    80002a64:	f9010113          	addi	sp,sp,-112
    80002a68:	06813023          	sd	s0,96(sp)
    80002a6c:	04913c23          	sd	s1,88(sp)
    80002a70:	05213823          	sd	s2,80(sp)
    80002a74:	05313423          	sd	s3,72(sp)
    80002a78:	05413023          	sd	s4,64(sp)
    80002a7c:	03513c23          	sd	s5,56(sp)
    80002a80:	03613823          	sd	s6,48(sp)
    80002a84:	03713423          	sd	s7,40(sp)
    80002a88:	03813023          	sd	s8,32(sp)
    80002a8c:	06113423          	sd	ra,104(sp)
    80002a90:	01913c23          	sd	s9,24(sp)
    80002a94:	07010413          	addi	s0,sp,112
    80002a98:	00060b93          	mv	s7,a2
    80002a9c:	00050913          	mv	s2,a0
    80002aa0:	00058c13          	mv	s8,a1
    80002aa4:	00060b1b          	sext.w	s6,a2
    80002aa8:	00004497          	auipc	s1,0x4
    80002aac:	05048493          	addi	s1,s1,80 # 80006af8 <cons>
    80002ab0:	00400993          	li	s3,4
    80002ab4:	fff00a13          	li	s4,-1
    80002ab8:	00a00a93          	li	s5,10
    80002abc:	05705e63          	blez	s7,80002b18 <consoleread+0xb4>
    80002ac0:	09c4a703          	lw	a4,156(s1)
    80002ac4:	0984a783          	lw	a5,152(s1)
    80002ac8:	0007071b          	sext.w	a4,a4
    80002acc:	08e78463          	beq	a5,a4,80002b54 <consoleread+0xf0>
    80002ad0:	07f7f713          	andi	a4,a5,127
    80002ad4:	00e48733          	add	a4,s1,a4
    80002ad8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80002adc:	0017869b          	addiw	a3,a5,1
    80002ae0:	08d4ac23          	sw	a3,152(s1)
    80002ae4:	00070c9b          	sext.w	s9,a4
    80002ae8:	0b370663          	beq	a4,s3,80002b94 <consoleread+0x130>
    80002aec:	00100693          	li	a3,1
    80002af0:	f9f40613          	addi	a2,s0,-97
    80002af4:	000c0593          	mv	a1,s8
    80002af8:	00090513          	mv	a0,s2
    80002afc:	f8e40fa3          	sb	a4,-97(s0)
    80002b00:	00000097          	auipc	ra,0x0
    80002b04:	8c0080e7          	jalr	-1856(ra) # 800023c0 <either_copyout>
    80002b08:	01450863          	beq	a0,s4,80002b18 <consoleread+0xb4>
    80002b0c:	001c0c13          	addi	s8,s8,1
    80002b10:	fffb8b9b          	addiw	s7,s7,-1
    80002b14:	fb5c94e3          	bne	s9,s5,80002abc <consoleread+0x58>
    80002b18:	000b851b          	sext.w	a0,s7
    80002b1c:	06813083          	ld	ra,104(sp)
    80002b20:	06013403          	ld	s0,96(sp)
    80002b24:	05813483          	ld	s1,88(sp)
    80002b28:	05013903          	ld	s2,80(sp)
    80002b2c:	04813983          	ld	s3,72(sp)
    80002b30:	04013a03          	ld	s4,64(sp)
    80002b34:	03813a83          	ld	s5,56(sp)
    80002b38:	02813b83          	ld	s7,40(sp)
    80002b3c:	02013c03          	ld	s8,32(sp)
    80002b40:	01813c83          	ld	s9,24(sp)
    80002b44:	40ab053b          	subw	a0,s6,a0
    80002b48:	03013b03          	ld	s6,48(sp)
    80002b4c:	07010113          	addi	sp,sp,112
    80002b50:	00008067          	ret
    80002b54:	00001097          	auipc	ra,0x1
    80002b58:	1d8080e7          	jalr	472(ra) # 80003d2c <push_on>
    80002b5c:	0984a703          	lw	a4,152(s1)
    80002b60:	09c4a783          	lw	a5,156(s1)
    80002b64:	0007879b          	sext.w	a5,a5
    80002b68:	fef70ce3          	beq	a4,a5,80002b60 <consoleread+0xfc>
    80002b6c:	00001097          	auipc	ra,0x1
    80002b70:	234080e7          	jalr	564(ra) # 80003da0 <pop_on>
    80002b74:	0984a783          	lw	a5,152(s1)
    80002b78:	07f7f713          	andi	a4,a5,127
    80002b7c:	00e48733          	add	a4,s1,a4
    80002b80:	01874703          	lbu	a4,24(a4)
    80002b84:	0017869b          	addiw	a3,a5,1
    80002b88:	08d4ac23          	sw	a3,152(s1)
    80002b8c:	00070c9b          	sext.w	s9,a4
    80002b90:	f5371ee3          	bne	a4,s3,80002aec <consoleread+0x88>
    80002b94:	000b851b          	sext.w	a0,s7
    80002b98:	f96bf2e3          	bgeu	s7,s6,80002b1c <consoleread+0xb8>
    80002b9c:	08f4ac23          	sw	a5,152(s1)
    80002ba0:	f7dff06f          	j	80002b1c <consoleread+0xb8>

0000000080002ba4 <consputc>:
    80002ba4:	10000793          	li	a5,256
    80002ba8:	00f50663          	beq	a0,a5,80002bb4 <consputc+0x10>
    80002bac:	00001317          	auipc	t1,0x1
    80002bb0:	9f430067          	jr	-1548(t1) # 800035a0 <uartputc_sync>
    80002bb4:	ff010113          	addi	sp,sp,-16
    80002bb8:	00113423          	sd	ra,8(sp)
    80002bbc:	00813023          	sd	s0,0(sp)
    80002bc0:	01010413          	addi	s0,sp,16
    80002bc4:	00800513          	li	a0,8
    80002bc8:	00001097          	auipc	ra,0x1
    80002bcc:	9d8080e7          	jalr	-1576(ra) # 800035a0 <uartputc_sync>
    80002bd0:	02000513          	li	a0,32
    80002bd4:	00001097          	auipc	ra,0x1
    80002bd8:	9cc080e7          	jalr	-1588(ra) # 800035a0 <uartputc_sync>
    80002bdc:	00013403          	ld	s0,0(sp)
    80002be0:	00813083          	ld	ra,8(sp)
    80002be4:	00800513          	li	a0,8
    80002be8:	01010113          	addi	sp,sp,16
    80002bec:	00001317          	auipc	t1,0x1
    80002bf0:	9b430067          	jr	-1612(t1) # 800035a0 <uartputc_sync>

0000000080002bf4 <consoleintr>:
    80002bf4:	fe010113          	addi	sp,sp,-32
    80002bf8:	00813823          	sd	s0,16(sp)
    80002bfc:	00913423          	sd	s1,8(sp)
    80002c00:	01213023          	sd	s2,0(sp)
    80002c04:	00113c23          	sd	ra,24(sp)
    80002c08:	02010413          	addi	s0,sp,32
    80002c0c:	00004917          	auipc	s2,0x4
    80002c10:	eec90913          	addi	s2,s2,-276 # 80006af8 <cons>
    80002c14:	00050493          	mv	s1,a0
    80002c18:	00090513          	mv	a0,s2
    80002c1c:	00001097          	auipc	ra,0x1
    80002c20:	e40080e7          	jalr	-448(ra) # 80003a5c <acquire>
    80002c24:	02048c63          	beqz	s1,80002c5c <consoleintr+0x68>
    80002c28:	0a092783          	lw	a5,160(s2)
    80002c2c:	09892703          	lw	a4,152(s2)
    80002c30:	07f00693          	li	a3,127
    80002c34:	40e7873b          	subw	a4,a5,a4
    80002c38:	02e6e263          	bltu	a3,a4,80002c5c <consoleintr+0x68>
    80002c3c:	00d00713          	li	a4,13
    80002c40:	04e48063          	beq	s1,a4,80002c80 <consoleintr+0x8c>
    80002c44:	07f7f713          	andi	a4,a5,127
    80002c48:	00e90733          	add	a4,s2,a4
    80002c4c:	0017879b          	addiw	a5,a5,1
    80002c50:	0af92023          	sw	a5,160(s2)
    80002c54:	00970c23          	sb	s1,24(a4)
    80002c58:	08f92e23          	sw	a5,156(s2)
    80002c5c:	01013403          	ld	s0,16(sp)
    80002c60:	01813083          	ld	ra,24(sp)
    80002c64:	00813483          	ld	s1,8(sp)
    80002c68:	00013903          	ld	s2,0(sp)
    80002c6c:	00004517          	auipc	a0,0x4
    80002c70:	e8c50513          	addi	a0,a0,-372 # 80006af8 <cons>
    80002c74:	02010113          	addi	sp,sp,32
    80002c78:	00001317          	auipc	t1,0x1
    80002c7c:	eb030067          	jr	-336(t1) # 80003b28 <release>
    80002c80:	00a00493          	li	s1,10
    80002c84:	fc1ff06f          	j	80002c44 <consoleintr+0x50>

0000000080002c88 <consoleinit>:
    80002c88:	fe010113          	addi	sp,sp,-32
    80002c8c:	00113c23          	sd	ra,24(sp)
    80002c90:	00813823          	sd	s0,16(sp)
    80002c94:	00913423          	sd	s1,8(sp)
    80002c98:	02010413          	addi	s0,sp,32
    80002c9c:	00004497          	auipc	s1,0x4
    80002ca0:	e5c48493          	addi	s1,s1,-420 # 80006af8 <cons>
    80002ca4:	00048513          	mv	a0,s1
    80002ca8:	00002597          	auipc	a1,0x2
    80002cac:	4a058593          	addi	a1,a1,1184 # 80005148 <CONSOLE_STATUS+0x138>
    80002cb0:	00001097          	auipc	ra,0x1
    80002cb4:	d88080e7          	jalr	-632(ra) # 80003a38 <initlock>
    80002cb8:	00000097          	auipc	ra,0x0
    80002cbc:	7ac080e7          	jalr	1964(ra) # 80003464 <uartinit>
    80002cc0:	01813083          	ld	ra,24(sp)
    80002cc4:	01013403          	ld	s0,16(sp)
    80002cc8:	00000797          	auipc	a5,0x0
    80002ccc:	d9c78793          	addi	a5,a5,-612 # 80002a64 <consoleread>
    80002cd0:	0af4bc23          	sd	a5,184(s1)
    80002cd4:	00000797          	auipc	a5,0x0
    80002cd8:	cec78793          	addi	a5,a5,-788 # 800029c0 <consolewrite>
    80002cdc:	0cf4b023          	sd	a5,192(s1)
    80002ce0:	00813483          	ld	s1,8(sp)
    80002ce4:	02010113          	addi	sp,sp,32
    80002ce8:	00008067          	ret

0000000080002cec <console_read>:
    80002cec:	ff010113          	addi	sp,sp,-16
    80002cf0:	00813423          	sd	s0,8(sp)
    80002cf4:	01010413          	addi	s0,sp,16
    80002cf8:	00813403          	ld	s0,8(sp)
    80002cfc:	00004317          	auipc	t1,0x4
    80002d00:	eb433303          	ld	t1,-332(t1) # 80006bb0 <devsw+0x10>
    80002d04:	01010113          	addi	sp,sp,16
    80002d08:	00030067          	jr	t1

0000000080002d0c <console_write>:
    80002d0c:	ff010113          	addi	sp,sp,-16
    80002d10:	00813423          	sd	s0,8(sp)
    80002d14:	01010413          	addi	s0,sp,16
    80002d18:	00813403          	ld	s0,8(sp)
    80002d1c:	00004317          	auipc	t1,0x4
    80002d20:	e9c33303          	ld	t1,-356(t1) # 80006bb8 <devsw+0x18>
    80002d24:	01010113          	addi	sp,sp,16
    80002d28:	00030067          	jr	t1

0000000080002d2c <panic>:
    80002d2c:	fe010113          	addi	sp,sp,-32
    80002d30:	00113c23          	sd	ra,24(sp)
    80002d34:	00813823          	sd	s0,16(sp)
    80002d38:	00913423          	sd	s1,8(sp)
    80002d3c:	02010413          	addi	s0,sp,32
    80002d40:	00050493          	mv	s1,a0
    80002d44:	00002517          	auipc	a0,0x2
    80002d48:	40c50513          	addi	a0,a0,1036 # 80005150 <CONSOLE_STATUS+0x140>
    80002d4c:	00004797          	auipc	a5,0x4
    80002d50:	f007a623          	sw	zero,-244(a5) # 80006c58 <pr+0x18>
    80002d54:	00000097          	auipc	ra,0x0
    80002d58:	034080e7          	jalr	52(ra) # 80002d88 <__printf>
    80002d5c:	00048513          	mv	a0,s1
    80002d60:	00000097          	auipc	ra,0x0
    80002d64:	028080e7          	jalr	40(ra) # 80002d88 <__printf>
    80002d68:	00002517          	auipc	a0,0x2
    80002d6c:	3c850513          	addi	a0,a0,968 # 80005130 <CONSOLE_STATUS+0x120>
    80002d70:	00000097          	auipc	ra,0x0
    80002d74:	018080e7          	jalr	24(ra) # 80002d88 <__printf>
    80002d78:	00100793          	li	a5,1
    80002d7c:	00003717          	auipc	a4,0x3
    80002d80:	c4f72623          	sw	a5,-948(a4) # 800059c8 <panicked>
    80002d84:	0000006f          	j	80002d84 <panic+0x58>

0000000080002d88 <__printf>:
    80002d88:	f3010113          	addi	sp,sp,-208
    80002d8c:	08813023          	sd	s0,128(sp)
    80002d90:	07313423          	sd	s3,104(sp)
    80002d94:	09010413          	addi	s0,sp,144
    80002d98:	05813023          	sd	s8,64(sp)
    80002d9c:	08113423          	sd	ra,136(sp)
    80002da0:	06913c23          	sd	s1,120(sp)
    80002da4:	07213823          	sd	s2,112(sp)
    80002da8:	07413023          	sd	s4,96(sp)
    80002dac:	05513c23          	sd	s5,88(sp)
    80002db0:	05613823          	sd	s6,80(sp)
    80002db4:	05713423          	sd	s7,72(sp)
    80002db8:	03913c23          	sd	s9,56(sp)
    80002dbc:	03a13823          	sd	s10,48(sp)
    80002dc0:	03b13423          	sd	s11,40(sp)
    80002dc4:	00004317          	auipc	t1,0x4
    80002dc8:	e7c30313          	addi	t1,t1,-388 # 80006c40 <pr>
    80002dcc:	01832c03          	lw	s8,24(t1)
    80002dd0:	00b43423          	sd	a1,8(s0)
    80002dd4:	00c43823          	sd	a2,16(s0)
    80002dd8:	00d43c23          	sd	a3,24(s0)
    80002ddc:	02e43023          	sd	a4,32(s0)
    80002de0:	02f43423          	sd	a5,40(s0)
    80002de4:	03043823          	sd	a6,48(s0)
    80002de8:	03143c23          	sd	a7,56(s0)
    80002dec:	00050993          	mv	s3,a0
    80002df0:	4a0c1663          	bnez	s8,8000329c <__printf+0x514>
    80002df4:	60098c63          	beqz	s3,8000340c <__printf+0x684>
    80002df8:	0009c503          	lbu	a0,0(s3)
    80002dfc:	00840793          	addi	a5,s0,8
    80002e00:	f6f43c23          	sd	a5,-136(s0)
    80002e04:	00000493          	li	s1,0
    80002e08:	22050063          	beqz	a0,80003028 <__printf+0x2a0>
    80002e0c:	00002a37          	lui	s4,0x2
    80002e10:	00018ab7          	lui	s5,0x18
    80002e14:	000f4b37          	lui	s6,0xf4
    80002e18:	00989bb7          	lui	s7,0x989
    80002e1c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002e20:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002e24:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002e28:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002e2c:	00148c9b          	addiw	s9,s1,1
    80002e30:	02500793          	li	a5,37
    80002e34:	01998933          	add	s2,s3,s9
    80002e38:	38f51263          	bne	a0,a5,800031bc <__printf+0x434>
    80002e3c:	00094783          	lbu	a5,0(s2)
    80002e40:	00078c9b          	sext.w	s9,a5
    80002e44:	1e078263          	beqz	a5,80003028 <__printf+0x2a0>
    80002e48:	0024849b          	addiw	s1,s1,2
    80002e4c:	07000713          	li	a4,112
    80002e50:	00998933          	add	s2,s3,s1
    80002e54:	38e78a63          	beq	a5,a4,800031e8 <__printf+0x460>
    80002e58:	20f76863          	bltu	a4,a5,80003068 <__printf+0x2e0>
    80002e5c:	42a78863          	beq	a5,a0,8000328c <__printf+0x504>
    80002e60:	06400713          	li	a4,100
    80002e64:	40e79663          	bne	a5,a4,80003270 <__printf+0x4e8>
    80002e68:	f7843783          	ld	a5,-136(s0)
    80002e6c:	0007a603          	lw	a2,0(a5)
    80002e70:	00878793          	addi	a5,a5,8
    80002e74:	f6f43c23          	sd	a5,-136(s0)
    80002e78:	42064a63          	bltz	a2,800032ac <__printf+0x524>
    80002e7c:	00a00713          	li	a4,10
    80002e80:	02e677bb          	remuw	a5,a2,a4
    80002e84:	00002d97          	auipc	s11,0x2
    80002e88:	2f4d8d93          	addi	s11,s11,756 # 80005178 <digits>
    80002e8c:	00900593          	li	a1,9
    80002e90:	0006051b          	sext.w	a0,a2
    80002e94:	00000c93          	li	s9,0
    80002e98:	02079793          	slli	a5,a5,0x20
    80002e9c:	0207d793          	srli	a5,a5,0x20
    80002ea0:	00fd87b3          	add	a5,s11,a5
    80002ea4:	0007c783          	lbu	a5,0(a5)
    80002ea8:	02e656bb          	divuw	a3,a2,a4
    80002eac:	f8f40023          	sb	a5,-128(s0)
    80002eb0:	14c5d863          	bge	a1,a2,80003000 <__printf+0x278>
    80002eb4:	06300593          	li	a1,99
    80002eb8:	00100c93          	li	s9,1
    80002ebc:	02e6f7bb          	remuw	a5,a3,a4
    80002ec0:	02079793          	slli	a5,a5,0x20
    80002ec4:	0207d793          	srli	a5,a5,0x20
    80002ec8:	00fd87b3          	add	a5,s11,a5
    80002ecc:	0007c783          	lbu	a5,0(a5)
    80002ed0:	02e6d73b          	divuw	a4,a3,a4
    80002ed4:	f8f400a3          	sb	a5,-127(s0)
    80002ed8:	12a5f463          	bgeu	a1,a0,80003000 <__printf+0x278>
    80002edc:	00a00693          	li	a3,10
    80002ee0:	00900593          	li	a1,9
    80002ee4:	02d777bb          	remuw	a5,a4,a3
    80002ee8:	02079793          	slli	a5,a5,0x20
    80002eec:	0207d793          	srli	a5,a5,0x20
    80002ef0:	00fd87b3          	add	a5,s11,a5
    80002ef4:	0007c503          	lbu	a0,0(a5)
    80002ef8:	02d757bb          	divuw	a5,a4,a3
    80002efc:	f8a40123          	sb	a0,-126(s0)
    80002f00:	48e5f263          	bgeu	a1,a4,80003384 <__printf+0x5fc>
    80002f04:	06300513          	li	a0,99
    80002f08:	02d7f5bb          	remuw	a1,a5,a3
    80002f0c:	02059593          	slli	a1,a1,0x20
    80002f10:	0205d593          	srli	a1,a1,0x20
    80002f14:	00bd85b3          	add	a1,s11,a1
    80002f18:	0005c583          	lbu	a1,0(a1)
    80002f1c:	02d7d7bb          	divuw	a5,a5,a3
    80002f20:	f8b401a3          	sb	a1,-125(s0)
    80002f24:	48e57263          	bgeu	a0,a4,800033a8 <__printf+0x620>
    80002f28:	3e700513          	li	a0,999
    80002f2c:	02d7f5bb          	remuw	a1,a5,a3
    80002f30:	02059593          	slli	a1,a1,0x20
    80002f34:	0205d593          	srli	a1,a1,0x20
    80002f38:	00bd85b3          	add	a1,s11,a1
    80002f3c:	0005c583          	lbu	a1,0(a1)
    80002f40:	02d7d7bb          	divuw	a5,a5,a3
    80002f44:	f8b40223          	sb	a1,-124(s0)
    80002f48:	46e57663          	bgeu	a0,a4,800033b4 <__printf+0x62c>
    80002f4c:	02d7f5bb          	remuw	a1,a5,a3
    80002f50:	02059593          	slli	a1,a1,0x20
    80002f54:	0205d593          	srli	a1,a1,0x20
    80002f58:	00bd85b3          	add	a1,s11,a1
    80002f5c:	0005c583          	lbu	a1,0(a1)
    80002f60:	02d7d7bb          	divuw	a5,a5,a3
    80002f64:	f8b402a3          	sb	a1,-123(s0)
    80002f68:	46ea7863          	bgeu	s4,a4,800033d8 <__printf+0x650>
    80002f6c:	02d7f5bb          	remuw	a1,a5,a3
    80002f70:	02059593          	slli	a1,a1,0x20
    80002f74:	0205d593          	srli	a1,a1,0x20
    80002f78:	00bd85b3          	add	a1,s11,a1
    80002f7c:	0005c583          	lbu	a1,0(a1)
    80002f80:	02d7d7bb          	divuw	a5,a5,a3
    80002f84:	f8b40323          	sb	a1,-122(s0)
    80002f88:	3eeaf863          	bgeu	s5,a4,80003378 <__printf+0x5f0>
    80002f8c:	02d7f5bb          	remuw	a1,a5,a3
    80002f90:	02059593          	slli	a1,a1,0x20
    80002f94:	0205d593          	srli	a1,a1,0x20
    80002f98:	00bd85b3          	add	a1,s11,a1
    80002f9c:	0005c583          	lbu	a1,0(a1)
    80002fa0:	02d7d7bb          	divuw	a5,a5,a3
    80002fa4:	f8b403a3          	sb	a1,-121(s0)
    80002fa8:	42eb7e63          	bgeu	s6,a4,800033e4 <__printf+0x65c>
    80002fac:	02d7f5bb          	remuw	a1,a5,a3
    80002fb0:	02059593          	slli	a1,a1,0x20
    80002fb4:	0205d593          	srli	a1,a1,0x20
    80002fb8:	00bd85b3          	add	a1,s11,a1
    80002fbc:	0005c583          	lbu	a1,0(a1)
    80002fc0:	02d7d7bb          	divuw	a5,a5,a3
    80002fc4:	f8b40423          	sb	a1,-120(s0)
    80002fc8:	42ebfc63          	bgeu	s7,a4,80003400 <__printf+0x678>
    80002fcc:	02079793          	slli	a5,a5,0x20
    80002fd0:	0207d793          	srli	a5,a5,0x20
    80002fd4:	00fd8db3          	add	s11,s11,a5
    80002fd8:	000dc703          	lbu	a4,0(s11)
    80002fdc:	00a00793          	li	a5,10
    80002fe0:	00900c93          	li	s9,9
    80002fe4:	f8e404a3          	sb	a4,-119(s0)
    80002fe8:	00065c63          	bgez	a2,80003000 <__printf+0x278>
    80002fec:	f9040713          	addi	a4,s0,-112
    80002ff0:	00f70733          	add	a4,a4,a5
    80002ff4:	02d00693          	li	a3,45
    80002ff8:	fed70823          	sb	a3,-16(a4)
    80002ffc:	00078c93          	mv	s9,a5
    80003000:	f8040793          	addi	a5,s0,-128
    80003004:	01978cb3          	add	s9,a5,s9
    80003008:	f7f40d13          	addi	s10,s0,-129
    8000300c:	000cc503          	lbu	a0,0(s9)
    80003010:	fffc8c93          	addi	s9,s9,-1
    80003014:	00000097          	auipc	ra,0x0
    80003018:	b90080e7          	jalr	-1136(ra) # 80002ba4 <consputc>
    8000301c:	ffac98e3          	bne	s9,s10,8000300c <__printf+0x284>
    80003020:	00094503          	lbu	a0,0(s2)
    80003024:	e00514e3          	bnez	a0,80002e2c <__printf+0xa4>
    80003028:	1a0c1663          	bnez	s8,800031d4 <__printf+0x44c>
    8000302c:	08813083          	ld	ra,136(sp)
    80003030:	08013403          	ld	s0,128(sp)
    80003034:	07813483          	ld	s1,120(sp)
    80003038:	07013903          	ld	s2,112(sp)
    8000303c:	06813983          	ld	s3,104(sp)
    80003040:	06013a03          	ld	s4,96(sp)
    80003044:	05813a83          	ld	s5,88(sp)
    80003048:	05013b03          	ld	s6,80(sp)
    8000304c:	04813b83          	ld	s7,72(sp)
    80003050:	04013c03          	ld	s8,64(sp)
    80003054:	03813c83          	ld	s9,56(sp)
    80003058:	03013d03          	ld	s10,48(sp)
    8000305c:	02813d83          	ld	s11,40(sp)
    80003060:	0d010113          	addi	sp,sp,208
    80003064:	00008067          	ret
    80003068:	07300713          	li	a4,115
    8000306c:	1ce78a63          	beq	a5,a4,80003240 <__printf+0x4b8>
    80003070:	07800713          	li	a4,120
    80003074:	1ee79e63          	bne	a5,a4,80003270 <__printf+0x4e8>
    80003078:	f7843783          	ld	a5,-136(s0)
    8000307c:	0007a703          	lw	a4,0(a5)
    80003080:	00878793          	addi	a5,a5,8
    80003084:	f6f43c23          	sd	a5,-136(s0)
    80003088:	28074263          	bltz	a4,8000330c <__printf+0x584>
    8000308c:	00002d97          	auipc	s11,0x2
    80003090:	0ecd8d93          	addi	s11,s11,236 # 80005178 <digits>
    80003094:	00f77793          	andi	a5,a4,15
    80003098:	00fd87b3          	add	a5,s11,a5
    8000309c:	0007c683          	lbu	a3,0(a5)
    800030a0:	00f00613          	li	a2,15
    800030a4:	0007079b          	sext.w	a5,a4
    800030a8:	f8d40023          	sb	a3,-128(s0)
    800030ac:	0047559b          	srliw	a1,a4,0x4
    800030b0:	0047569b          	srliw	a3,a4,0x4
    800030b4:	00000c93          	li	s9,0
    800030b8:	0ee65063          	bge	a2,a4,80003198 <__printf+0x410>
    800030bc:	00f6f693          	andi	a3,a3,15
    800030c0:	00dd86b3          	add	a3,s11,a3
    800030c4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800030c8:	0087d79b          	srliw	a5,a5,0x8
    800030cc:	00100c93          	li	s9,1
    800030d0:	f8d400a3          	sb	a3,-127(s0)
    800030d4:	0cb67263          	bgeu	a2,a1,80003198 <__printf+0x410>
    800030d8:	00f7f693          	andi	a3,a5,15
    800030dc:	00dd86b3          	add	a3,s11,a3
    800030e0:	0006c583          	lbu	a1,0(a3)
    800030e4:	00f00613          	li	a2,15
    800030e8:	0047d69b          	srliw	a3,a5,0x4
    800030ec:	f8b40123          	sb	a1,-126(s0)
    800030f0:	0047d593          	srli	a1,a5,0x4
    800030f4:	28f67e63          	bgeu	a2,a5,80003390 <__printf+0x608>
    800030f8:	00f6f693          	andi	a3,a3,15
    800030fc:	00dd86b3          	add	a3,s11,a3
    80003100:	0006c503          	lbu	a0,0(a3)
    80003104:	0087d813          	srli	a6,a5,0x8
    80003108:	0087d69b          	srliw	a3,a5,0x8
    8000310c:	f8a401a3          	sb	a0,-125(s0)
    80003110:	28b67663          	bgeu	a2,a1,8000339c <__printf+0x614>
    80003114:	00f6f693          	andi	a3,a3,15
    80003118:	00dd86b3          	add	a3,s11,a3
    8000311c:	0006c583          	lbu	a1,0(a3)
    80003120:	00c7d513          	srli	a0,a5,0xc
    80003124:	00c7d69b          	srliw	a3,a5,0xc
    80003128:	f8b40223          	sb	a1,-124(s0)
    8000312c:	29067a63          	bgeu	a2,a6,800033c0 <__printf+0x638>
    80003130:	00f6f693          	andi	a3,a3,15
    80003134:	00dd86b3          	add	a3,s11,a3
    80003138:	0006c583          	lbu	a1,0(a3)
    8000313c:	0107d813          	srli	a6,a5,0x10
    80003140:	0107d69b          	srliw	a3,a5,0x10
    80003144:	f8b402a3          	sb	a1,-123(s0)
    80003148:	28a67263          	bgeu	a2,a0,800033cc <__printf+0x644>
    8000314c:	00f6f693          	andi	a3,a3,15
    80003150:	00dd86b3          	add	a3,s11,a3
    80003154:	0006c683          	lbu	a3,0(a3)
    80003158:	0147d79b          	srliw	a5,a5,0x14
    8000315c:	f8d40323          	sb	a3,-122(s0)
    80003160:	21067663          	bgeu	a2,a6,8000336c <__printf+0x5e4>
    80003164:	02079793          	slli	a5,a5,0x20
    80003168:	0207d793          	srli	a5,a5,0x20
    8000316c:	00fd8db3          	add	s11,s11,a5
    80003170:	000dc683          	lbu	a3,0(s11)
    80003174:	00800793          	li	a5,8
    80003178:	00700c93          	li	s9,7
    8000317c:	f8d403a3          	sb	a3,-121(s0)
    80003180:	00075c63          	bgez	a4,80003198 <__printf+0x410>
    80003184:	f9040713          	addi	a4,s0,-112
    80003188:	00f70733          	add	a4,a4,a5
    8000318c:	02d00693          	li	a3,45
    80003190:	fed70823          	sb	a3,-16(a4)
    80003194:	00078c93          	mv	s9,a5
    80003198:	f8040793          	addi	a5,s0,-128
    8000319c:	01978cb3          	add	s9,a5,s9
    800031a0:	f7f40d13          	addi	s10,s0,-129
    800031a4:	000cc503          	lbu	a0,0(s9)
    800031a8:	fffc8c93          	addi	s9,s9,-1
    800031ac:	00000097          	auipc	ra,0x0
    800031b0:	9f8080e7          	jalr	-1544(ra) # 80002ba4 <consputc>
    800031b4:	ff9d18e3          	bne	s10,s9,800031a4 <__printf+0x41c>
    800031b8:	0100006f          	j	800031c8 <__printf+0x440>
    800031bc:	00000097          	auipc	ra,0x0
    800031c0:	9e8080e7          	jalr	-1560(ra) # 80002ba4 <consputc>
    800031c4:	000c8493          	mv	s1,s9
    800031c8:	00094503          	lbu	a0,0(s2)
    800031cc:	c60510e3          	bnez	a0,80002e2c <__printf+0xa4>
    800031d0:	e40c0ee3          	beqz	s8,8000302c <__printf+0x2a4>
    800031d4:	00004517          	auipc	a0,0x4
    800031d8:	a6c50513          	addi	a0,a0,-1428 # 80006c40 <pr>
    800031dc:	00001097          	auipc	ra,0x1
    800031e0:	94c080e7          	jalr	-1716(ra) # 80003b28 <release>
    800031e4:	e49ff06f          	j	8000302c <__printf+0x2a4>
    800031e8:	f7843783          	ld	a5,-136(s0)
    800031ec:	03000513          	li	a0,48
    800031f0:	01000d13          	li	s10,16
    800031f4:	00878713          	addi	a4,a5,8
    800031f8:	0007bc83          	ld	s9,0(a5)
    800031fc:	f6e43c23          	sd	a4,-136(s0)
    80003200:	00000097          	auipc	ra,0x0
    80003204:	9a4080e7          	jalr	-1628(ra) # 80002ba4 <consputc>
    80003208:	07800513          	li	a0,120
    8000320c:	00000097          	auipc	ra,0x0
    80003210:	998080e7          	jalr	-1640(ra) # 80002ba4 <consputc>
    80003214:	00002d97          	auipc	s11,0x2
    80003218:	f64d8d93          	addi	s11,s11,-156 # 80005178 <digits>
    8000321c:	03ccd793          	srli	a5,s9,0x3c
    80003220:	00fd87b3          	add	a5,s11,a5
    80003224:	0007c503          	lbu	a0,0(a5)
    80003228:	fffd0d1b          	addiw	s10,s10,-1
    8000322c:	004c9c93          	slli	s9,s9,0x4
    80003230:	00000097          	auipc	ra,0x0
    80003234:	974080e7          	jalr	-1676(ra) # 80002ba4 <consputc>
    80003238:	fe0d12e3          	bnez	s10,8000321c <__printf+0x494>
    8000323c:	f8dff06f          	j	800031c8 <__printf+0x440>
    80003240:	f7843783          	ld	a5,-136(s0)
    80003244:	0007bc83          	ld	s9,0(a5)
    80003248:	00878793          	addi	a5,a5,8
    8000324c:	f6f43c23          	sd	a5,-136(s0)
    80003250:	000c9a63          	bnez	s9,80003264 <__printf+0x4dc>
    80003254:	1080006f          	j	8000335c <__printf+0x5d4>
    80003258:	001c8c93          	addi	s9,s9,1
    8000325c:	00000097          	auipc	ra,0x0
    80003260:	948080e7          	jalr	-1720(ra) # 80002ba4 <consputc>
    80003264:	000cc503          	lbu	a0,0(s9)
    80003268:	fe0518e3          	bnez	a0,80003258 <__printf+0x4d0>
    8000326c:	f5dff06f          	j	800031c8 <__printf+0x440>
    80003270:	02500513          	li	a0,37
    80003274:	00000097          	auipc	ra,0x0
    80003278:	930080e7          	jalr	-1744(ra) # 80002ba4 <consputc>
    8000327c:	000c8513          	mv	a0,s9
    80003280:	00000097          	auipc	ra,0x0
    80003284:	924080e7          	jalr	-1756(ra) # 80002ba4 <consputc>
    80003288:	f41ff06f          	j	800031c8 <__printf+0x440>
    8000328c:	02500513          	li	a0,37
    80003290:	00000097          	auipc	ra,0x0
    80003294:	914080e7          	jalr	-1772(ra) # 80002ba4 <consputc>
    80003298:	f31ff06f          	j	800031c8 <__printf+0x440>
    8000329c:	00030513          	mv	a0,t1
    800032a0:	00000097          	auipc	ra,0x0
    800032a4:	7bc080e7          	jalr	1980(ra) # 80003a5c <acquire>
    800032a8:	b4dff06f          	j	80002df4 <__printf+0x6c>
    800032ac:	40c0053b          	negw	a0,a2
    800032b0:	00a00713          	li	a4,10
    800032b4:	02e576bb          	remuw	a3,a0,a4
    800032b8:	00002d97          	auipc	s11,0x2
    800032bc:	ec0d8d93          	addi	s11,s11,-320 # 80005178 <digits>
    800032c0:	ff700593          	li	a1,-9
    800032c4:	02069693          	slli	a3,a3,0x20
    800032c8:	0206d693          	srli	a3,a3,0x20
    800032cc:	00dd86b3          	add	a3,s11,a3
    800032d0:	0006c683          	lbu	a3,0(a3)
    800032d4:	02e557bb          	divuw	a5,a0,a4
    800032d8:	f8d40023          	sb	a3,-128(s0)
    800032dc:	10b65e63          	bge	a2,a1,800033f8 <__printf+0x670>
    800032e0:	06300593          	li	a1,99
    800032e4:	02e7f6bb          	remuw	a3,a5,a4
    800032e8:	02069693          	slli	a3,a3,0x20
    800032ec:	0206d693          	srli	a3,a3,0x20
    800032f0:	00dd86b3          	add	a3,s11,a3
    800032f4:	0006c683          	lbu	a3,0(a3)
    800032f8:	02e7d73b          	divuw	a4,a5,a4
    800032fc:	00200793          	li	a5,2
    80003300:	f8d400a3          	sb	a3,-127(s0)
    80003304:	bca5ece3          	bltu	a1,a0,80002edc <__printf+0x154>
    80003308:	ce5ff06f          	j	80002fec <__printf+0x264>
    8000330c:	40e007bb          	negw	a5,a4
    80003310:	00002d97          	auipc	s11,0x2
    80003314:	e68d8d93          	addi	s11,s11,-408 # 80005178 <digits>
    80003318:	00f7f693          	andi	a3,a5,15
    8000331c:	00dd86b3          	add	a3,s11,a3
    80003320:	0006c583          	lbu	a1,0(a3)
    80003324:	ff100613          	li	a2,-15
    80003328:	0047d69b          	srliw	a3,a5,0x4
    8000332c:	f8b40023          	sb	a1,-128(s0)
    80003330:	0047d59b          	srliw	a1,a5,0x4
    80003334:	0ac75e63          	bge	a4,a2,800033f0 <__printf+0x668>
    80003338:	00f6f693          	andi	a3,a3,15
    8000333c:	00dd86b3          	add	a3,s11,a3
    80003340:	0006c603          	lbu	a2,0(a3)
    80003344:	00f00693          	li	a3,15
    80003348:	0087d79b          	srliw	a5,a5,0x8
    8000334c:	f8c400a3          	sb	a2,-127(s0)
    80003350:	d8b6e4e3          	bltu	a3,a1,800030d8 <__printf+0x350>
    80003354:	00200793          	li	a5,2
    80003358:	e2dff06f          	j	80003184 <__printf+0x3fc>
    8000335c:	00002c97          	auipc	s9,0x2
    80003360:	dfcc8c93          	addi	s9,s9,-516 # 80005158 <CONSOLE_STATUS+0x148>
    80003364:	02800513          	li	a0,40
    80003368:	ef1ff06f          	j	80003258 <__printf+0x4d0>
    8000336c:	00700793          	li	a5,7
    80003370:	00600c93          	li	s9,6
    80003374:	e0dff06f          	j	80003180 <__printf+0x3f8>
    80003378:	00700793          	li	a5,7
    8000337c:	00600c93          	li	s9,6
    80003380:	c69ff06f          	j	80002fe8 <__printf+0x260>
    80003384:	00300793          	li	a5,3
    80003388:	00200c93          	li	s9,2
    8000338c:	c5dff06f          	j	80002fe8 <__printf+0x260>
    80003390:	00300793          	li	a5,3
    80003394:	00200c93          	li	s9,2
    80003398:	de9ff06f          	j	80003180 <__printf+0x3f8>
    8000339c:	00400793          	li	a5,4
    800033a0:	00300c93          	li	s9,3
    800033a4:	dddff06f          	j	80003180 <__printf+0x3f8>
    800033a8:	00400793          	li	a5,4
    800033ac:	00300c93          	li	s9,3
    800033b0:	c39ff06f          	j	80002fe8 <__printf+0x260>
    800033b4:	00500793          	li	a5,5
    800033b8:	00400c93          	li	s9,4
    800033bc:	c2dff06f          	j	80002fe8 <__printf+0x260>
    800033c0:	00500793          	li	a5,5
    800033c4:	00400c93          	li	s9,4
    800033c8:	db9ff06f          	j	80003180 <__printf+0x3f8>
    800033cc:	00600793          	li	a5,6
    800033d0:	00500c93          	li	s9,5
    800033d4:	dadff06f          	j	80003180 <__printf+0x3f8>
    800033d8:	00600793          	li	a5,6
    800033dc:	00500c93          	li	s9,5
    800033e0:	c09ff06f          	j	80002fe8 <__printf+0x260>
    800033e4:	00800793          	li	a5,8
    800033e8:	00700c93          	li	s9,7
    800033ec:	bfdff06f          	j	80002fe8 <__printf+0x260>
    800033f0:	00100793          	li	a5,1
    800033f4:	d91ff06f          	j	80003184 <__printf+0x3fc>
    800033f8:	00100793          	li	a5,1
    800033fc:	bf1ff06f          	j	80002fec <__printf+0x264>
    80003400:	00900793          	li	a5,9
    80003404:	00800c93          	li	s9,8
    80003408:	be1ff06f          	j	80002fe8 <__printf+0x260>
    8000340c:	00002517          	auipc	a0,0x2
    80003410:	d5450513          	addi	a0,a0,-684 # 80005160 <CONSOLE_STATUS+0x150>
    80003414:	00000097          	auipc	ra,0x0
    80003418:	918080e7          	jalr	-1768(ra) # 80002d2c <panic>

000000008000341c <printfinit>:
    8000341c:	fe010113          	addi	sp,sp,-32
    80003420:	00813823          	sd	s0,16(sp)
    80003424:	00913423          	sd	s1,8(sp)
    80003428:	00113c23          	sd	ra,24(sp)
    8000342c:	02010413          	addi	s0,sp,32
    80003430:	00004497          	auipc	s1,0x4
    80003434:	81048493          	addi	s1,s1,-2032 # 80006c40 <pr>
    80003438:	00048513          	mv	a0,s1
    8000343c:	00002597          	auipc	a1,0x2
    80003440:	d3458593          	addi	a1,a1,-716 # 80005170 <CONSOLE_STATUS+0x160>
    80003444:	00000097          	auipc	ra,0x0
    80003448:	5f4080e7          	jalr	1524(ra) # 80003a38 <initlock>
    8000344c:	01813083          	ld	ra,24(sp)
    80003450:	01013403          	ld	s0,16(sp)
    80003454:	0004ac23          	sw	zero,24(s1)
    80003458:	00813483          	ld	s1,8(sp)
    8000345c:	02010113          	addi	sp,sp,32
    80003460:	00008067          	ret

0000000080003464 <uartinit>:
    80003464:	ff010113          	addi	sp,sp,-16
    80003468:	00813423          	sd	s0,8(sp)
    8000346c:	01010413          	addi	s0,sp,16
    80003470:	100007b7          	lui	a5,0x10000
    80003474:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003478:	f8000713          	li	a4,-128
    8000347c:	00e781a3          	sb	a4,3(a5)
    80003480:	00300713          	li	a4,3
    80003484:	00e78023          	sb	a4,0(a5)
    80003488:	000780a3          	sb	zero,1(a5)
    8000348c:	00e781a3          	sb	a4,3(a5)
    80003490:	00700693          	li	a3,7
    80003494:	00d78123          	sb	a3,2(a5)
    80003498:	00e780a3          	sb	a4,1(a5)
    8000349c:	00813403          	ld	s0,8(sp)
    800034a0:	01010113          	addi	sp,sp,16
    800034a4:	00008067          	ret

00000000800034a8 <uartputc>:
    800034a8:	00002797          	auipc	a5,0x2
    800034ac:	5207a783          	lw	a5,1312(a5) # 800059c8 <panicked>
    800034b0:	00078463          	beqz	a5,800034b8 <uartputc+0x10>
    800034b4:	0000006f          	j	800034b4 <uartputc+0xc>
    800034b8:	fd010113          	addi	sp,sp,-48
    800034bc:	02813023          	sd	s0,32(sp)
    800034c0:	00913c23          	sd	s1,24(sp)
    800034c4:	01213823          	sd	s2,16(sp)
    800034c8:	01313423          	sd	s3,8(sp)
    800034cc:	02113423          	sd	ra,40(sp)
    800034d0:	03010413          	addi	s0,sp,48
    800034d4:	00002917          	auipc	s2,0x2
    800034d8:	4fc90913          	addi	s2,s2,1276 # 800059d0 <uart_tx_r>
    800034dc:	00093783          	ld	a5,0(s2)
    800034e0:	00002497          	auipc	s1,0x2
    800034e4:	4f848493          	addi	s1,s1,1272 # 800059d8 <uart_tx_w>
    800034e8:	0004b703          	ld	a4,0(s1)
    800034ec:	02078693          	addi	a3,a5,32
    800034f0:	00050993          	mv	s3,a0
    800034f4:	02e69c63          	bne	a3,a4,8000352c <uartputc+0x84>
    800034f8:	00001097          	auipc	ra,0x1
    800034fc:	834080e7          	jalr	-1996(ra) # 80003d2c <push_on>
    80003500:	00093783          	ld	a5,0(s2)
    80003504:	0004b703          	ld	a4,0(s1)
    80003508:	02078793          	addi	a5,a5,32
    8000350c:	00e79463          	bne	a5,a4,80003514 <uartputc+0x6c>
    80003510:	0000006f          	j	80003510 <uartputc+0x68>
    80003514:	00001097          	auipc	ra,0x1
    80003518:	88c080e7          	jalr	-1908(ra) # 80003da0 <pop_on>
    8000351c:	00093783          	ld	a5,0(s2)
    80003520:	0004b703          	ld	a4,0(s1)
    80003524:	02078693          	addi	a3,a5,32
    80003528:	fce688e3          	beq	a3,a4,800034f8 <uartputc+0x50>
    8000352c:	01f77693          	andi	a3,a4,31
    80003530:	00003597          	auipc	a1,0x3
    80003534:	73058593          	addi	a1,a1,1840 # 80006c60 <uart_tx_buf>
    80003538:	00d586b3          	add	a3,a1,a3
    8000353c:	00170713          	addi	a4,a4,1
    80003540:	01368023          	sb	s3,0(a3)
    80003544:	00e4b023          	sd	a4,0(s1)
    80003548:	10000637          	lui	a2,0x10000
    8000354c:	02f71063          	bne	a4,a5,8000356c <uartputc+0xc4>
    80003550:	0340006f          	j	80003584 <uartputc+0xdc>
    80003554:	00074703          	lbu	a4,0(a4)
    80003558:	00f93023          	sd	a5,0(s2)
    8000355c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003560:	00093783          	ld	a5,0(s2)
    80003564:	0004b703          	ld	a4,0(s1)
    80003568:	00f70e63          	beq	a4,a5,80003584 <uartputc+0xdc>
    8000356c:	00564683          	lbu	a3,5(a2)
    80003570:	01f7f713          	andi	a4,a5,31
    80003574:	00e58733          	add	a4,a1,a4
    80003578:	0206f693          	andi	a3,a3,32
    8000357c:	00178793          	addi	a5,a5,1
    80003580:	fc069ae3          	bnez	a3,80003554 <uartputc+0xac>
    80003584:	02813083          	ld	ra,40(sp)
    80003588:	02013403          	ld	s0,32(sp)
    8000358c:	01813483          	ld	s1,24(sp)
    80003590:	01013903          	ld	s2,16(sp)
    80003594:	00813983          	ld	s3,8(sp)
    80003598:	03010113          	addi	sp,sp,48
    8000359c:	00008067          	ret

00000000800035a0 <uartputc_sync>:
    800035a0:	ff010113          	addi	sp,sp,-16
    800035a4:	00813423          	sd	s0,8(sp)
    800035a8:	01010413          	addi	s0,sp,16
    800035ac:	00002717          	auipc	a4,0x2
    800035b0:	41c72703          	lw	a4,1052(a4) # 800059c8 <panicked>
    800035b4:	02071663          	bnez	a4,800035e0 <uartputc_sync+0x40>
    800035b8:	00050793          	mv	a5,a0
    800035bc:	100006b7          	lui	a3,0x10000
    800035c0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800035c4:	02077713          	andi	a4,a4,32
    800035c8:	fe070ce3          	beqz	a4,800035c0 <uartputc_sync+0x20>
    800035cc:	0ff7f793          	andi	a5,a5,255
    800035d0:	00f68023          	sb	a5,0(a3)
    800035d4:	00813403          	ld	s0,8(sp)
    800035d8:	01010113          	addi	sp,sp,16
    800035dc:	00008067          	ret
    800035e0:	0000006f          	j	800035e0 <uartputc_sync+0x40>

00000000800035e4 <uartstart>:
    800035e4:	ff010113          	addi	sp,sp,-16
    800035e8:	00813423          	sd	s0,8(sp)
    800035ec:	01010413          	addi	s0,sp,16
    800035f0:	00002617          	auipc	a2,0x2
    800035f4:	3e060613          	addi	a2,a2,992 # 800059d0 <uart_tx_r>
    800035f8:	00002517          	auipc	a0,0x2
    800035fc:	3e050513          	addi	a0,a0,992 # 800059d8 <uart_tx_w>
    80003600:	00063783          	ld	a5,0(a2)
    80003604:	00053703          	ld	a4,0(a0)
    80003608:	04f70263          	beq	a4,a5,8000364c <uartstart+0x68>
    8000360c:	100005b7          	lui	a1,0x10000
    80003610:	00003817          	auipc	a6,0x3
    80003614:	65080813          	addi	a6,a6,1616 # 80006c60 <uart_tx_buf>
    80003618:	01c0006f          	j	80003634 <uartstart+0x50>
    8000361c:	0006c703          	lbu	a4,0(a3)
    80003620:	00f63023          	sd	a5,0(a2)
    80003624:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003628:	00063783          	ld	a5,0(a2)
    8000362c:	00053703          	ld	a4,0(a0)
    80003630:	00f70e63          	beq	a4,a5,8000364c <uartstart+0x68>
    80003634:	01f7f713          	andi	a4,a5,31
    80003638:	00e806b3          	add	a3,a6,a4
    8000363c:	0055c703          	lbu	a4,5(a1)
    80003640:	00178793          	addi	a5,a5,1
    80003644:	02077713          	andi	a4,a4,32
    80003648:	fc071ae3          	bnez	a4,8000361c <uartstart+0x38>
    8000364c:	00813403          	ld	s0,8(sp)
    80003650:	01010113          	addi	sp,sp,16
    80003654:	00008067          	ret

0000000080003658 <uartgetc>:
    80003658:	ff010113          	addi	sp,sp,-16
    8000365c:	00813423          	sd	s0,8(sp)
    80003660:	01010413          	addi	s0,sp,16
    80003664:	10000737          	lui	a4,0x10000
    80003668:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000366c:	0017f793          	andi	a5,a5,1
    80003670:	00078c63          	beqz	a5,80003688 <uartgetc+0x30>
    80003674:	00074503          	lbu	a0,0(a4)
    80003678:	0ff57513          	andi	a0,a0,255
    8000367c:	00813403          	ld	s0,8(sp)
    80003680:	01010113          	addi	sp,sp,16
    80003684:	00008067          	ret
    80003688:	fff00513          	li	a0,-1
    8000368c:	ff1ff06f          	j	8000367c <uartgetc+0x24>

0000000080003690 <uartintr>:
    80003690:	100007b7          	lui	a5,0x10000
    80003694:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003698:	0017f793          	andi	a5,a5,1
    8000369c:	0a078463          	beqz	a5,80003744 <uartintr+0xb4>
    800036a0:	fe010113          	addi	sp,sp,-32
    800036a4:	00813823          	sd	s0,16(sp)
    800036a8:	00913423          	sd	s1,8(sp)
    800036ac:	00113c23          	sd	ra,24(sp)
    800036b0:	02010413          	addi	s0,sp,32
    800036b4:	100004b7          	lui	s1,0x10000
    800036b8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800036bc:	0ff57513          	andi	a0,a0,255
    800036c0:	fffff097          	auipc	ra,0xfffff
    800036c4:	534080e7          	jalr	1332(ra) # 80002bf4 <consoleintr>
    800036c8:	0054c783          	lbu	a5,5(s1)
    800036cc:	0017f793          	andi	a5,a5,1
    800036d0:	fe0794e3          	bnez	a5,800036b8 <uartintr+0x28>
    800036d4:	00002617          	auipc	a2,0x2
    800036d8:	2fc60613          	addi	a2,a2,764 # 800059d0 <uart_tx_r>
    800036dc:	00002517          	auipc	a0,0x2
    800036e0:	2fc50513          	addi	a0,a0,764 # 800059d8 <uart_tx_w>
    800036e4:	00063783          	ld	a5,0(a2)
    800036e8:	00053703          	ld	a4,0(a0)
    800036ec:	04f70263          	beq	a4,a5,80003730 <uartintr+0xa0>
    800036f0:	100005b7          	lui	a1,0x10000
    800036f4:	00003817          	auipc	a6,0x3
    800036f8:	56c80813          	addi	a6,a6,1388 # 80006c60 <uart_tx_buf>
    800036fc:	01c0006f          	j	80003718 <uartintr+0x88>
    80003700:	0006c703          	lbu	a4,0(a3)
    80003704:	00f63023          	sd	a5,0(a2)
    80003708:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000370c:	00063783          	ld	a5,0(a2)
    80003710:	00053703          	ld	a4,0(a0)
    80003714:	00f70e63          	beq	a4,a5,80003730 <uartintr+0xa0>
    80003718:	01f7f713          	andi	a4,a5,31
    8000371c:	00e806b3          	add	a3,a6,a4
    80003720:	0055c703          	lbu	a4,5(a1)
    80003724:	00178793          	addi	a5,a5,1
    80003728:	02077713          	andi	a4,a4,32
    8000372c:	fc071ae3          	bnez	a4,80003700 <uartintr+0x70>
    80003730:	01813083          	ld	ra,24(sp)
    80003734:	01013403          	ld	s0,16(sp)
    80003738:	00813483          	ld	s1,8(sp)
    8000373c:	02010113          	addi	sp,sp,32
    80003740:	00008067          	ret
    80003744:	00002617          	auipc	a2,0x2
    80003748:	28c60613          	addi	a2,a2,652 # 800059d0 <uart_tx_r>
    8000374c:	00002517          	auipc	a0,0x2
    80003750:	28c50513          	addi	a0,a0,652 # 800059d8 <uart_tx_w>
    80003754:	00063783          	ld	a5,0(a2)
    80003758:	00053703          	ld	a4,0(a0)
    8000375c:	04f70263          	beq	a4,a5,800037a0 <uartintr+0x110>
    80003760:	100005b7          	lui	a1,0x10000
    80003764:	00003817          	auipc	a6,0x3
    80003768:	4fc80813          	addi	a6,a6,1276 # 80006c60 <uart_tx_buf>
    8000376c:	01c0006f          	j	80003788 <uartintr+0xf8>
    80003770:	0006c703          	lbu	a4,0(a3)
    80003774:	00f63023          	sd	a5,0(a2)
    80003778:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000377c:	00063783          	ld	a5,0(a2)
    80003780:	00053703          	ld	a4,0(a0)
    80003784:	02f70063          	beq	a4,a5,800037a4 <uartintr+0x114>
    80003788:	01f7f713          	andi	a4,a5,31
    8000378c:	00e806b3          	add	a3,a6,a4
    80003790:	0055c703          	lbu	a4,5(a1)
    80003794:	00178793          	addi	a5,a5,1
    80003798:	02077713          	andi	a4,a4,32
    8000379c:	fc071ae3          	bnez	a4,80003770 <uartintr+0xe0>
    800037a0:	00008067          	ret
    800037a4:	00008067          	ret

00000000800037a8 <kinit>:
    800037a8:	fc010113          	addi	sp,sp,-64
    800037ac:	02913423          	sd	s1,40(sp)
    800037b0:	fffff7b7          	lui	a5,0xfffff
    800037b4:	00004497          	auipc	s1,0x4
    800037b8:	4cb48493          	addi	s1,s1,1227 # 80007c7f <end+0xfff>
    800037bc:	02813823          	sd	s0,48(sp)
    800037c0:	01313c23          	sd	s3,24(sp)
    800037c4:	00f4f4b3          	and	s1,s1,a5
    800037c8:	02113c23          	sd	ra,56(sp)
    800037cc:	03213023          	sd	s2,32(sp)
    800037d0:	01413823          	sd	s4,16(sp)
    800037d4:	01513423          	sd	s5,8(sp)
    800037d8:	04010413          	addi	s0,sp,64
    800037dc:	000017b7          	lui	a5,0x1
    800037e0:	01100993          	li	s3,17
    800037e4:	00f487b3          	add	a5,s1,a5
    800037e8:	01b99993          	slli	s3,s3,0x1b
    800037ec:	06f9e063          	bltu	s3,a5,8000384c <kinit+0xa4>
    800037f0:	00003a97          	auipc	s5,0x3
    800037f4:	490a8a93          	addi	s5,s5,1168 # 80006c80 <end>
    800037f8:	0754ec63          	bltu	s1,s5,80003870 <kinit+0xc8>
    800037fc:	0734fa63          	bgeu	s1,s3,80003870 <kinit+0xc8>
    80003800:	00088a37          	lui	s4,0x88
    80003804:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003808:	00002917          	auipc	s2,0x2
    8000380c:	1d890913          	addi	s2,s2,472 # 800059e0 <kmem>
    80003810:	00ca1a13          	slli	s4,s4,0xc
    80003814:	0140006f          	j	80003828 <kinit+0x80>
    80003818:	000017b7          	lui	a5,0x1
    8000381c:	00f484b3          	add	s1,s1,a5
    80003820:	0554e863          	bltu	s1,s5,80003870 <kinit+0xc8>
    80003824:	0534f663          	bgeu	s1,s3,80003870 <kinit+0xc8>
    80003828:	00001637          	lui	a2,0x1
    8000382c:	00100593          	li	a1,1
    80003830:	00048513          	mv	a0,s1
    80003834:	00000097          	auipc	ra,0x0
    80003838:	5e4080e7          	jalr	1508(ra) # 80003e18 <__memset>
    8000383c:	00093783          	ld	a5,0(s2)
    80003840:	00f4b023          	sd	a5,0(s1)
    80003844:	00993023          	sd	s1,0(s2)
    80003848:	fd4498e3          	bne	s1,s4,80003818 <kinit+0x70>
    8000384c:	03813083          	ld	ra,56(sp)
    80003850:	03013403          	ld	s0,48(sp)
    80003854:	02813483          	ld	s1,40(sp)
    80003858:	02013903          	ld	s2,32(sp)
    8000385c:	01813983          	ld	s3,24(sp)
    80003860:	01013a03          	ld	s4,16(sp)
    80003864:	00813a83          	ld	s5,8(sp)
    80003868:	04010113          	addi	sp,sp,64
    8000386c:	00008067          	ret
    80003870:	00002517          	auipc	a0,0x2
    80003874:	92050513          	addi	a0,a0,-1760 # 80005190 <digits+0x18>
    80003878:	fffff097          	auipc	ra,0xfffff
    8000387c:	4b4080e7          	jalr	1204(ra) # 80002d2c <panic>

0000000080003880 <freerange>:
    80003880:	fc010113          	addi	sp,sp,-64
    80003884:	000017b7          	lui	a5,0x1
    80003888:	02913423          	sd	s1,40(sp)
    8000388c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003890:	009504b3          	add	s1,a0,s1
    80003894:	fffff537          	lui	a0,0xfffff
    80003898:	02813823          	sd	s0,48(sp)
    8000389c:	02113c23          	sd	ra,56(sp)
    800038a0:	03213023          	sd	s2,32(sp)
    800038a4:	01313c23          	sd	s3,24(sp)
    800038a8:	01413823          	sd	s4,16(sp)
    800038ac:	01513423          	sd	s5,8(sp)
    800038b0:	01613023          	sd	s6,0(sp)
    800038b4:	04010413          	addi	s0,sp,64
    800038b8:	00a4f4b3          	and	s1,s1,a0
    800038bc:	00f487b3          	add	a5,s1,a5
    800038c0:	06f5e463          	bltu	a1,a5,80003928 <freerange+0xa8>
    800038c4:	00003a97          	auipc	s5,0x3
    800038c8:	3bca8a93          	addi	s5,s5,956 # 80006c80 <end>
    800038cc:	0954e263          	bltu	s1,s5,80003950 <freerange+0xd0>
    800038d0:	01100993          	li	s3,17
    800038d4:	01b99993          	slli	s3,s3,0x1b
    800038d8:	0734fc63          	bgeu	s1,s3,80003950 <freerange+0xd0>
    800038dc:	00058a13          	mv	s4,a1
    800038e0:	00002917          	auipc	s2,0x2
    800038e4:	10090913          	addi	s2,s2,256 # 800059e0 <kmem>
    800038e8:	00002b37          	lui	s6,0x2
    800038ec:	0140006f          	j	80003900 <freerange+0x80>
    800038f0:	000017b7          	lui	a5,0x1
    800038f4:	00f484b3          	add	s1,s1,a5
    800038f8:	0554ec63          	bltu	s1,s5,80003950 <freerange+0xd0>
    800038fc:	0534fa63          	bgeu	s1,s3,80003950 <freerange+0xd0>
    80003900:	00001637          	lui	a2,0x1
    80003904:	00100593          	li	a1,1
    80003908:	00048513          	mv	a0,s1
    8000390c:	00000097          	auipc	ra,0x0
    80003910:	50c080e7          	jalr	1292(ra) # 80003e18 <__memset>
    80003914:	00093703          	ld	a4,0(s2)
    80003918:	016487b3          	add	a5,s1,s6
    8000391c:	00e4b023          	sd	a4,0(s1)
    80003920:	00993023          	sd	s1,0(s2)
    80003924:	fcfa76e3          	bgeu	s4,a5,800038f0 <freerange+0x70>
    80003928:	03813083          	ld	ra,56(sp)
    8000392c:	03013403          	ld	s0,48(sp)
    80003930:	02813483          	ld	s1,40(sp)
    80003934:	02013903          	ld	s2,32(sp)
    80003938:	01813983          	ld	s3,24(sp)
    8000393c:	01013a03          	ld	s4,16(sp)
    80003940:	00813a83          	ld	s5,8(sp)
    80003944:	00013b03          	ld	s6,0(sp)
    80003948:	04010113          	addi	sp,sp,64
    8000394c:	00008067          	ret
    80003950:	00002517          	auipc	a0,0x2
    80003954:	84050513          	addi	a0,a0,-1984 # 80005190 <digits+0x18>
    80003958:	fffff097          	auipc	ra,0xfffff
    8000395c:	3d4080e7          	jalr	980(ra) # 80002d2c <panic>

0000000080003960 <kfree>:
    80003960:	fe010113          	addi	sp,sp,-32
    80003964:	00813823          	sd	s0,16(sp)
    80003968:	00113c23          	sd	ra,24(sp)
    8000396c:	00913423          	sd	s1,8(sp)
    80003970:	02010413          	addi	s0,sp,32
    80003974:	03451793          	slli	a5,a0,0x34
    80003978:	04079c63          	bnez	a5,800039d0 <kfree+0x70>
    8000397c:	00003797          	auipc	a5,0x3
    80003980:	30478793          	addi	a5,a5,772 # 80006c80 <end>
    80003984:	00050493          	mv	s1,a0
    80003988:	04f56463          	bltu	a0,a5,800039d0 <kfree+0x70>
    8000398c:	01100793          	li	a5,17
    80003990:	01b79793          	slli	a5,a5,0x1b
    80003994:	02f57e63          	bgeu	a0,a5,800039d0 <kfree+0x70>
    80003998:	00001637          	lui	a2,0x1
    8000399c:	00100593          	li	a1,1
    800039a0:	00000097          	auipc	ra,0x0
    800039a4:	478080e7          	jalr	1144(ra) # 80003e18 <__memset>
    800039a8:	00002797          	auipc	a5,0x2
    800039ac:	03878793          	addi	a5,a5,56 # 800059e0 <kmem>
    800039b0:	0007b703          	ld	a4,0(a5)
    800039b4:	01813083          	ld	ra,24(sp)
    800039b8:	01013403          	ld	s0,16(sp)
    800039bc:	00e4b023          	sd	a4,0(s1)
    800039c0:	0097b023          	sd	s1,0(a5)
    800039c4:	00813483          	ld	s1,8(sp)
    800039c8:	02010113          	addi	sp,sp,32
    800039cc:	00008067          	ret
    800039d0:	00001517          	auipc	a0,0x1
    800039d4:	7c050513          	addi	a0,a0,1984 # 80005190 <digits+0x18>
    800039d8:	fffff097          	auipc	ra,0xfffff
    800039dc:	354080e7          	jalr	852(ra) # 80002d2c <panic>

00000000800039e0 <kalloc>:
    800039e0:	fe010113          	addi	sp,sp,-32
    800039e4:	00813823          	sd	s0,16(sp)
    800039e8:	00913423          	sd	s1,8(sp)
    800039ec:	00113c23          	sd	ra,24(sp)
    800039f0:	02010413          	addi	s0,sp,32
    800039f4:	00002797          	auipc	a5,0x2
    800039f8:	fec78793          	addi	a5,a5,-20 # 800059e0 <kmem>
    800039fc:	0007b483          	ld	s1,0(a5)
    80003a00:	02048063          	beqz	s1,80003a20 <kalloc+0x40>
    80003a04:	0004b703          	ld	a4,0(s1)
    80003a08:	00001637          	lui	a2,0x1
    80003a0c:	00500593          	li	a1,5
    80003a10:	00048513          	mv	a0,s1
    80003a14:	00e7b023          	sd	a4,0(a5)
    80003a18:	00000097          	auipc	ra,0x0
    80003a1c:	400080e7          	jalr	1024(ra) # 80003e18 <__memset>
    80003a20:	01813083          	ld	ra,24(sp)
    80003a24:	01013403          	ld	s0,16(sp)
    80003a28:	00048513          	mv	a0,s1
    80003a2c:	00813483          	ld	s1,8(sp)
    80003a30:	02010113          	addi	sp,sp,32
    80003a34:	00008067          	ret

0000000080003a38 <initlock>:
    80003a38:	ff010113          	addi	sp,sp,-16
    80003a3c:	00813423          	sd	s0,8(sp)
    80003a40:	01010413          	addi	s0,sp,16
    80003a44:	00813403          	ld	s0,8(sp)
    80003a48:	00b53423          	sd	a1,8(a0)
    80003a4c:	00052023          	sw	zero,0(a0)
    80003a50:	00053823          	sd	zero,16(a0)
    80003a54:	01010113          	addi	sp,sp,16
    80003a58:	00008067          	ret

0000000080003a5c <acquire>:
    80003a5c:	fe010113          	addi	sp,sp,-32
    80003a60:	00813823          	sd	s0,16(sp)
    80003a64:	00913423          	sd	s1,8(sp)
    80003a68:	00113c23          	sd	ra,24(sp)
    80003a6c:	01213023          	sd	s2,0(sp)
    80003a70:	02010413          	addi	s0,sp,32
    80003a74:	00050493          	mv	s1,a0
    80003a78:	10002973          	csrr	s2,sstatus
    80003a7c:	100027f3          	csrr	a5,sstatus
    80003a80:	ffd7f793          	andi	a5,a5,-3
    80003a84:	10079073          	csrw	sstatus,a5
    80003a88:	fffff097          	auipc	ra,0xfffff
    80003a8c:	8ec080e7          	jalr	-1812(ra) # 80002374 <mycpu>
    80003a90:	07852783          	lw	a5,120(a0)
    80003a94:	06078e63          	beqz	a5,80003b10 <acquire+0xb4>
    80003a98:	fffff097          	auipc	ra,0xfffff
    80003a9c:	8dc080e7          	jalr	-1828(ra) # 80002374 <mycpu>
    80003aa0:	07852783          	lw	a5,120(a0)
    80003aa4:	0004a703          	lw	a4,0(s1)
    80003aa8:	0017879b          	addiw	a5,a5,1
    80003aac:	06f52c23          	sw	a5,120(a0)
    80003ab0:	04071063          	bnez	a4,80003af0 <acquire+0x94>
    80003ab4:	00100713          	li	a4,1
    80003ab8:	00070793          	mv	a5,a4
    80003abc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003ac0:	0007879b          	sext.w	a5,a5
    80003ac4:	fe079ae3          	bnez	a5,80003ab8 <acquire+0x5c>
    80003ac8:	0ff0000f          	fence
    80003acc:	fffff097          	auipc	ra,0xfffff
    80003ad0:	8a8080e7          	jalr	-1880(ra) # 80002374 <mycpu>
    80003ad4:	01813083          	ld	ra,24(sp)
    80003ad8:	01013403          	ld	s0,16(sp)
    80003adc:	00a4b823          	sd	a0,16(s1)
    80003ae0:	00013903          	ld	s2,0(sp)
    80003ae4:	00813483          	ld	s1,8(sp)
    80003ae8:	02010113          	addi	sp,sp,32
    80003aec:	00008067          	ret
    80003af0:	0104b903          	ld	s2,16(s1)
    80003af4:	fffff097          	auipc	ra,0xfffff
    80003af8:	880080e7          	jalr	-1920(ra) # 80002374 <mycpu>
    80003afc:	faa91ce3          	bne	s2,a0,80003ab4 <acquire+0x58>
    80003b00:	00001517          	auipc	a0,0x1
    80003b04:	69850513          	addi	a0,a0,1688 # 80005198 <digits+0x20>
    80003b08:	fffff097          	auipc	ra,0xfffff
    80003b0c:	224080e7          	jalr	548(ra) # 80002d2c <panic>
    80003b10:	00195913          	srli	s2,s2,0x1
    80003b14:	fffff097          	auipc	ra,0xfffff
    80003b18:	860080e7          	jalr	-1952(ra) # 80002374 <mycpu>
    80003b1c:	00197913          	andi	s2,s2,1
    80003b20:	07252e23          	sw	s2,124(a0)
    80003b24:	f75ff06f          	j	80003a98 <acquire+0x3c>

0000000080003b28 <release>:
    80003b28:	fe010113          	addi	sp,sp,-32
    80003b2c:	00813823          	sd	s0,16(sp)
    80003b30:	00113c23          	sd	ra,24(sp)
    80003b34:	00913423          	sd	s1,8(sp)
    80003b38:	01213023          	sd	s2,0(sp)
    80003b3c:	02010413          	addi	s0,sp,32
    80003b40:	00052783          	lw	a5,0(a0)
    80003b44:	00079a63          	bnez	a5,80003b58 <release+0x30>
    80003b48:	00001517          	auipc	a0,0x1
    80003b4c:	65850513          	addi	a0,a0,1624 # 800051a0 <digits+0x28>
    80003b50:	fffff097          	auipc	ra,0xfffff
    80003b54:	1dc080e7          	jalr	476(ra) # 80002d2c <panic>
    80003b58:	01053903          	ld	s2,16(a0)
    80003b5c:	00050493          	mv	s1,a0
    80003b60:	fffff097          	auipc	ra,0xfffff
    80003b64:	814080e7          	jalr	-2028(ra) # 80002374 <mycpu>
    80003b68:	fea910e3          	bne	s2,a0,80003b48 <release+0x20>
    80003b6c:	0004b823          	sd	zero,16(s1)
    80003b70:	0ff0000f          	fence
    80003b74:	0f50000f          	fence	iorw,ow
    80003b78:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003b7c:	ffffe097          	auipc	ra,0xffffe
    80003b80:	7f8080e7          	jalr	2040(ra) # 80002374 <mycpu>
    80003b84:	100027f3          	csrr	a5,sstatus
    80003b88:	0027f793          	andi	a5,a5,2
    80003b8c:	04079a63          	bnez	a5,80003be0 <release+0xb8>
    80003b90:	07852783          	lw	a5,120(a0)
    80003b94:	02f05e63          	blez	a5,80003bd0 <release+0xa8>
    80003b98:	fff7871b          	addiw	a4,a5,-1
    80003b9c:	06e52c23          	sw	a4,120(a0)
    80003ba0:	00071c63          	bnez	a4,80003bb8 <release+0x90>
    80003ba4:	07c52783          	lw	a5,124(a0)
    80003ba8:	00078863          	beqz	a5,80003bb8 <release+0x90>
    80003bac:	100027f3          	csrr	a5,sstatus
    80003bb0:	0027e793          	ori	a5,a5,2
    80003bb4:	10079073          	csrw	sstatus,a5
    80003bb8:	01813083          	ld	ra,24(sp)
    80003bbc:	01013403          	ld	s0,16(sp)
    80003bc0:	00813483          	ld	s1,8(sp)
    80003bc4:	00013903          	ld	s2,0(sp)
    80003bc8:	02010113          	addi	sp,sp,32
    80003bcc:	00008067          	ret
    80003bd0:	00001517          	auipc	a0,0x1
    80003bd4:	5f050513          	addi	a0,a0,1520 # 800051c0 <digits+0x48>
    80003bd8:	fffff097          	auipc	ra,0xfffff
    80003bdc:	154080e7          	jalr	340(ra) # 80002d2c <panic>
    80003be0:	00001517          	auipc	a0,0x1
    80003be4:	5c850513          	addi	a0,a0,1480 # 800051a8 <digits+0x30>
    80003be8:	fffff097          	auipc	ra,0xfffff
    80003bec:	144080e7          	jalr	324(ra) # 80002d2c <panic>

0000000080003bf0 <holding>:
    80003bf0:	00052783          	lw	a5,0(a0)
    80003bf4:	00079663          	bnez	a5,80003c00 <holding+0x10>
    80003bf8:	00000513          	li	a0,0
    80003bfc:	00008067          	ret
    80003c00:	fe010113          	addi	sp,sp,-32
    80003c04:	00813823          	sd	s0,16(sp)
    80003c08:	00913423          	sd	s1,8(sp)
    80003c0c:	00113c23          	sd	ra,24(sp)
    80003c10:	02010413          	addi	s0,sp,32
    80003c14:	01053483          	ld	s1,16(a0)
    80003c18:	ffffe097          	auipc	ra,0xffffe
    80003c1c:	75c080e7          	jalr	1884(ra) # 80002374 <mycpu>
    80003c20:	01813083          	ld	ra,24(sp)
    80003c24:	01013403          	ld	s0,16(sp)
    80003c28:	40a48533          	sub	a0,s1,a0
    80003c2c:	00153513          	seqz	a0,a0
    80003c30:	00813483          	ld	s1,8(sp)
    80003c34:	02010113          	addi	sp,sp,32
    80003c38:	00008067          	ret

0000000080003c3c <push_off>:
    80003c3c:	fe010113          	addi	sp,sp,-32
    80003c40:	00813823          	sd	s0,16(sp)
    80003c44:	00113c23          	sd	ra,24(sp)
    80003c48:	00913423          	sd	s1,8(sp)
    80003c4c:	02010413          	addi	s0,sp,32
    80003c50:	100024f3          	csrr	s1,sstatus
    80003c54:	100027f3          	csrr	a5,sstatus
    80003c58:	ffd7f793          	andi	a5,a5,-3
    80003c5c:	10079073          	csrw	sstatus,a5
    80003c60:	ffffe097          	auipc	ra,0xffffe
    80003c64:	714080e7          	jalr	1812(ra) # 80002374 <mycpu>
    80003c68:	07852783          	lw	a5,120(a0)
    80003c6c:	02078663          	beqz	a5,80003c98 <push_off+0x5c>
    80003c70:	ffffe097          	auipc	ra,0xffffe
    80003c74:	704080e7          	jalr	1796(ra) # 80002374 <mycpu>
    80003c78:	07852783          	lw	a5,120(a0)
    80003c7c:	01813083          	ld	ra,24(sp)
    80003c80:	01013403          	ld	s0,16(sp)
    80003c84:	0017879b          	addiw	a5,a5,1
    80003c88:	06f52c23          	sw	a5,120(a0)
    80003c8c:	00813483          	ld	s1,8(sp)
    80003c90:	02010113          	addi	sp,sp,32
    80003c94:	00008067          	ret
    80003c98:	0014d493          	srli	s1,s1,0x1
    80003c9c:	ffffe097          	auipc	ra,0xffffe
    80003ca0:	6d8080e7          	jalr	1752(ra) # 80002374 <mycpu>
    80003ca4:	0014f493          	andi	s1,s1,1
    80003ca8:	06952e23          	sw	s1,124(a0)
    80003cac:	fc5ff06f          	j	80003c70 <push_off+0x34>

0000000080003cb0 <pop_off>:
    80003cb0:	ff010113          	addi	sp,sp,-16
    80003cb4:	00813023          	sd	s0,0(sp)
    80003cb8:	00113423          	sd	ra,8(sp)
    80003cbc:	01010413          	addi	s0,sp,16
    80003cc0:	ffffe097          	auipc	ra,0xffffe
    80003cc4:	6b4080e7          	jalr	1716(ra) # 80002374 <mycpu>
    80003cc8:	100027f3          	csrr	a5,sstatus
    80003ccc:	0027f793          	andi	a5,a5,2
    80003cd0:	04079663          	bnez	a5,80003d1c <pop_off+0x6c>
    80003cd4:	07852783          	lw	a5,120(a0)
    80003cd8:	02f05a63          	blez	a5,80003d0c <pop_off+0x5c>
    80003cdc:	fff7871b          	addiw	a4,a5,-1
    80003ce0:	06e52c23          	sw	a4,120(a0)
    80003ce4:	00071c63          	bnez	a4,80003cfc <pop_off+0x4c>
    80003ce8:	07c52783          	lw	a5,124(a0)
    80003cec:	00078863          	beqz	a5,80003cfc <pop_off+0x4c>
    80003cf0:	100027f3          	csrr	a5,sstatus
    80003cf4:	0027e793          	ori	a5,a5,2
    80003cf8:	10079073          	csrw	sstatus,a5
    80003cfc:	00813083          	ld	ra,8(sp)
    80003d00:	00013403          	ld	s0,0(sp)
    80003d04:	01010113          	addi	sp,sp,16
    80003d08:	00008067          	ret
    80003d0c:	00001517          	auipc	a0,0x1
    80003d10:	4b450513          	addi	a0,a0,1204 # 800051c0 <digits+0x48>
    80003d14:	fffff097          	auipc	ra,0xfffff
    80003d18:	018080e7          	jalr	24(ra) # 80002d2c <panic>
    80003d1c:	00001517          	auipc	a0,0x1
    80003d20:	48c50513          	addi	a0,a0,1164 # 800051a8 <digits+0x30>
    80003d24:	fffff097          	auipc	ra,0xfffff
    80003d28:	008080e7          	jalr	8(ra) # 80002d2c <panic>

0000000080003d2c <push_on>:
    80003d2c:	fe010113          	addi	sp,sp,-32
    80003d30:	00813823          	sd	s0,16(sp)
    80003d34:	00113c23          	sd	ra,24(sp)
    80003d38:	00913423          	sd	s1,8(sp)
    80003d3c:	02010413          	addi	s0,sp,32
    80003d40:	100024f3          	csrr	s1,sstatus
    80003d44:	100027f3          	csrr	a5,sstatus
    80003d48:	0027e793          	ori	a5,a5,2
    80003d4c:	10079073          	csrw	sstatus,a5
    80003d50:	ffffe097          	auipc	ra,0xffffe
    80003d54:	624080e7          	jalr	1572(ra) # 80002374 <mycpu>
    80003d58:	07852783          	lw	a5,120(a0)
    80003d5c:	02078663          	beqz	a5,80003d88 <push_on+0x5c>
    80003d60:	ffffe097          	auipc	ra,0xffffe
    80003d64:	614080e7          	jalr	1556(ra) # 80002374 <mycpu>
    80003d68:	07852783          	lw	a5,120(a0)
    80003d6c:	01813083          	ld	ra,24(sp)
    80003d70:	01013403          	ld	s0,16(sp)
    80003d74:	0017879b          	addiw	a5,a5,1
    80003d78:	06f52c23          	sw	a5,120(a0)
    80003d7c:	00813483          	ld	s1,8(sp)
    80003d80:	02010113          	addi	sp,sp,32
    80003d84:	00008067          	ret
    80003d88:	0014d493          	srli	s1,s1,0x1
    80003d8c:	ffffe097          	auipc	ra,0xffffe
    80003d90:	5e8080e7          	jalr	1512(ra) # 80002374 <mycpu>
    80003d94:	0014f493          	andi	s1,s1,1
    80003d98:	06952e23          	sw	s1,124(a0)
    80003d9c:	fc5ff06f          	j	80003d60 <push_on+0x34>

0000000080003da0 <pop_on>:
    80003da0:	ff010113          	addi	sp,sp,-16
    80003da4:	00813023          	sd	s0,0(sp)
    80003da8:	00113423          	sd	ra,8(sp)
    80003dac:	01010413          	addi	s0,sp,16
    80003db0:	ffffe097          	auipc	ra,0xffffe
    80003db4:	5c4080e7          	jalr	1476(ra) # 80002374 <mycpu>
    80003db8:	100027f3          	csrr	a5,sstatus
    80003dbc:	0027f793          	andi	a5,a5,2
    80003dc0:	04078463          	beqz	a5,80003e08 <pop_on+0x68>
    80003dc4:	07852783          	lw	a5,120(a0)
    80003dc8:	02f05863          	blez	a5,80003df8 <pop_on+0x58>
    80003dcc:	fff7879b          	addiw	a5,a5,-1
    80003dd0:	06f52c23          	sw	a5,120(a0)
    80003dd4:	07853783          	ld	a5,120(a0)
    80003dd8:	00079863          	bnez	a5,80003de8 <pop_on+0x48>
    80003ddc:	100027f3          	csrr	a5,sstatus
    80003de0:	ffd7f793          	andi	a5,a5,-3
    80003de4:	10079073          	csrw	sstatus,a5
    80003de8:	00813083          	ld	ra,8(sp)
    80003dec:	00013403          	ld	s0,0(sp)
    80003df0:	01010113          	addi	sp,sp,16
    80003df4:	00008067          	ret
    80003df8:	00001517          	auipc	a0,0x1
    80003dfc:	3f050513          	addi	a0,a0,1008 # 800051e8 <digits+0x70>
    80003e00:	fffff097          	auipc	ra,0xfffff
    80003e04:	f2c080e7          	jalr	-212(ra) # 80002d2c <panic>
    80003e08:	00001517          	auipc	a0,0x1
    80003e0c:	3c050513          	addi	a0,a0,960 # 800051c8 <digits+0x50>
    80003e10:	fffff097          	auipc	ra,0xfffff
    80003e14:	f1c080e7          	jalr	-228(ra) # 80002d2c <panic>

0000000080003e18 <__memset>:
    80003e18:	ff010113          	addi	sp,sp,-16
    80003e1c:	00813423          	sd	s0,8(sp)
    80003e20:	01010413          	addi	s0,sp,16
    80003e24:	1a060e63          	beqz	a2,80003fe0 <__memset+0x1c8>
    80003e28:	40a007b3          	neg	a5,a0
    80003e2c:	0077f793          	andi	a5,a5,7
    80003e30:	00778693          	addi	a3,a5,7
    80003e34:	00b00813          	li	a6,11
    80003e38:	0ff5f593          	andi	a1,a1,255
    80003e3c:	fff6071b          	addiw	a4,a2,-1
    80003e40:	1b06e663          	bltu	a3,a6,80003fec <__memset+0x1d4>
    80003e44:	1cd76463          	bltu	a4,a3,8000400c <__memset+0x1f4>
    80003e48:	1a078e63          	beqz	a5,80004004 <__memset+0x1ec>
    80003e4c:	00b50023          	sb	a1,0(a0)
    80003e50:	00100713          	li	a4,1
    80003e54:	1ae78463          	beq	a5,a4,80003ffc <__memset+0x1e4>
    80003e58:	00b500a3          	sb	a1,1(a0)
    80003e5c:	00200713          	li	a4,2
    80003e60:	1ae78a63          	beq	a5,a4,80004014 <__memset+0x1fc>
    80003e64:	00b50123          	sb	a1,2(a0)
    80003e68:	00300713          	li	a4,3
    80003e6c:	18e78463          	beq	a5,a4,80003ff4 <__memset+0x1dc>
    80003e70:	00b501a3          	sb	a1,3(a0)
    80003e74:	00400713          	li	a4,4
    80003e78:	1ae78263          	beq	a5,a4,8000401c <__memset+0x204>
    80003e7c:	00b50223          	sb	a1,4(a0)
    80003e80:	00500713          	li	a4,5
    80003e84:	1ae78063          	beq	a5,a4,80004024 <__memset+0x20c>
    80003e88:	00b502a3          	sb	a1,5(a0)
    80003e8c:	00700713          	li	a4,7
    80003e90:	18e79e63          	bne	a5,a4,8000402c <__memset+0x214>
    80003e94:	00b50323          	sb	a1,6(a0)
    80003e98:	00700e93          	li	t4,7
    80003e9c:	00859713          	slli	a4,a1,0x8
    80003ea0:	00e5e733          	or	a4,a1,a4
    80003ea4:	01059e13          	slli	t3,a1,0x10
    80003ea8:	01c76e33          	or	t3,a4,t3
    80003eac:	01859313          	slli	t1,a1,0x18
    80003eb0:	006e6333          	or	t1,t3,t1
    80003eb4:	02059893          	slli	a7,a1,0x20
    80003eb8:	40f60e3b          	subw	t3,a2,a5
    80003ebc:	011368b3          	or	a7,t1,a7
    80003ec0:	02859813          	slli	a6,a1,0x28
    80003ec4:	0108e833          	or	a6,a7,a6
    80003ec8:	03059693          	slli	a3,a1,0x30
    80003ecc:	003e589b          	srliw	a7,t3,0x3
    80003ed0:	00d866b3          	or	a3,a6,a3
    80003ed4:	03859713          	slli	a4,a1,0x38
    80003ed8:	00389813          	slli	a6,a7,0x3
    80003edc:	00f507b3          	add	a5,a0,a5
    80003ee0:	00e6e733          	or	a4,a3,a4
    80003ee4:	000e089b          	sext.w	a7,t3
    80003ee8:	00f806b3          	add	a3,a6,a5
    80003eec:	00e7b023          	sd	a4,0(a5)
    80003ef0:	00878793          	addi	a5,a5,8
    80003ef4:	fed79ce3          	bne	a5,a3,80003eec <__memset+0xd4>
    80003ef8:	ff8e7793          	andi	a5,t3,-8
    80003efc:	0007871b          	sext.w	a4,a5
    80003f00:	01d787bb          	addw	a5,a5,t4
    80003f04:	0ce88e63          	beq	a7,a4,80003fe0 <__memset+0x1c8>
    80003f08:	00f50733          	add	a4,a0,a5
    80003f0c:	00b70023          	sb	a1,0(a4)
    80003f10:	0017871b          	addiw	a4,a5,1
    80003f14:	0cc77663          	bgeu	a4,a2,80003fe0 <__memset+0x1c8>
    80003f18:	00e50733          	add	a4,a0,a4
    80003f1c:	00b70023          	sb	a1,0(a4)
    80003f20:	0027871b          	addiw	a4,a5,2
    80003f24:	0ac77e63          	bgeu	a4,a2,80003fe0 <__memset+0x1c8>
    80003f28:	00e50733          	add	a4,a0,a4
    80003f2c:	00b70023          	sb	a1,0(a4)
    80003f30:	0037871b          	addiw	a4,a5,3
    80003f34:	0ac77663          	bgeu	a4,a2,80003fe0 <__memset+0x1c8>
    80003f38:	00e50733          	add	a4,a0,a4
    80003f3c:	00b70023          	sb	a1,0(a4)
    80003f40:	0047871b          	addiw	a4,a5,4
    80003f44:	08c77e63          	bgeu	a4,a2,80003fe0 <__memset+0x1c8>
    80003f48:	00e50733          	add	a4,a0,a4
    80003f4c:	00b70023          	sb	a1,0(a4)
    80003f50:	0057871b          	addiw	a4,a5,5
    80003f54:	08c77663          	bgeu	a4,a2,80003fe0 <__memset+0x1c8>
    80003f58:	00e50733          	add	a4,a0,a4
    80003f5c:	00b70023          	sb	a1,0(a4)
    80003f60:	0067871b          	addiw	a4,a5,6
    80003f64:	06c77e63          	bgeu	a4,a2,80003fe0 <__memset+0x1c8>
    80003f68:	00e50733          	add	a4,a0,a4
    80003f6c:	00b70023          	sb	a1,0(a4)
    80003f70:	0077871b          	addiw	a4,a5,7
    80003f74:	06c77663          	bgeu	a4,a2,80003fe0 <__memset+0x1c8>
    80003f78:	00e50733          	add	a4,a0,a4
    80003f7c:	00b70023          	sb	a1,0(a4)
    80003f80:	0087871b          	addiw	a4,a5,8
    80003f84:	04c77e63          	bgeu	a4,a2,80003fe0 <__memset+0x1c8>
    80003f88:	00e50733          	add	a4,a0,a4
    80003f8c:	00b70023          	sb	a1,0(a4)
    80003f90:	0097871b          	addiw	a4,a5,9
    80003f94:	04c77663          	bgeu	a4,a2,80003fe0 <__memset+0x1c8>
    80003f98:	00e50733          	add	a4,a0,a4
    80003f9c:	00b70023          	sb	a1,0(a4)
    80003fa0:	00a7871b          	addiw	a4,a5,10
    80003fa4:	02c77e63          	bgeu	a4,a2,80003fe0 <__memset+0x1c8>
    80003fa8:	00e50733          	add	a4,a0,a4
    80003fac:	00b70023          	sb	a1,0(a4)
    80003fb0:	00b7871b          	addiw	a4,a5,11
    80003fb4:	02c77663          	bgeu	a4,a2,80003fe0 <__memset+0x1c8>
    80003fb8:	00e50733          	add	a4,a0,a4
    80003fbc:	00b70023          	sb	a1,0(a4)
    80003fc0:	00c7871b          	addiw	a4,a5,12
    80003fc4:	00c77e63          	bgeu	a4,a2,80003fe0 <__memset+0x1c8>
    80003fc8:	00e50733          	add	a4,a0,a4
    80003fcc:	00b70023          	sb	a1,0(a4)
    80003fd0:	00d7879b          	addiw	a5,a5,13
    80003fd4:	00c7f663          	bgeu	a5,a2,80003fe0 <__memset+0x1c8>
    80003fd8:	00f507b3          	add	a5,a0,a5
    80003fdc:	00b78023          	sb	a1,0(a5)
    80003fe0:	00813403          	ld	s0,8(sp)
    80003fe4:	01010113          	addi	sp,sp,16
    80003fe8:	00008067          	ret
    80003fec:	00b00693          	li	a3,11
    80003ff0:	e55ff06f          	j	80003e44 <__memset+0x2c>
    80003ff4:	00300e93          	li	t4,3
    80003ff8:	ea5ff06f          	j	80003e9c <__memset+0x84>
    80003ffc:	00100e93          	li	t4,1
    80004000:	e9dff06f          	j	80003e9c <__memset+0x84>
    80004004:	00000e93          	li	t4,0
    80004008:	e95ff06f          	j	80003e9c <__memset+0x84>
    8000400c:	00000793          	li	a5,0
    80004010:	ef9ff06f          	j	80003f08 <__memset+0xf0>
    80004014:	00200e93          	li	t4,2
    80004018:	e85ff06f          	j	80003e9c <__memset+0x84>
    8000401c:	00400e93          	li	t4,4
    80004020:	e7dff06f          	j	80003e9c <__memset+0x84>
    80004024:	00500e93          	li	t4,5
    80004028:	e75ff06f          	j	80003e9c <__memset+0x84>
    8000402c:	00600e93          	li	t4,6
    80004030:	e6dff06f          	j	80003e9c <__memset+0x84>

0000000080004034 <__memmove>:
    80004034:	ff010113          	addi	sp,sp,-16
    80004038:	00813423          	sd	s0,8(sp)
    8000403c:	01010413          	addi	s0,sp,16
    80004040:	0e060863          	beqz	a2,80004130 <__memmove+0xfc>
    80004044:	fff6069b          	addiw	a3,a2,-1
    80004048:	0006881b          	sext.w	a6,a3
    8000404c:	0ea5e863          	bltu	a1,a0,8000413c <__memmove+0x108>
    80004050:	00758713          	addi	a4,a1,7
    80004054:	00a5e7b3          	or	a5,a1,a0
    80004058:	40a70733          	sub	a4,a4,a0
    8000405c:	0077f793          	andi	a5,a5,7
    80004060:	00f73713          	sltiu	a4,a4,15
    80004064:	00174713          	xori	a4,a4,1
    80004068:	0017b793          	seqz	a5,a5
    8000406c:	00e7f7b3          	and	a5,a5,a4
    80004070:	10078863          	beqz	a5,80004180 <__memmove+0x14c>
    80004074:	00900793          	li	a5,9
    80004078:	1107f463          	bgeu	a5,a6,80004180 <__memmove+0x14c>
    8000407c:	0036581b          	srliw	a6,a2,0x3
    80004080:	fff8081b          	addiw	a6,a6,-1
    80004084:	02081813          	slli	a6,a6,0x20
    80004088:	01d85893          	srli	a7,a6,0x1d
    8000408c:	00858813          	addi	a6,a1,8
    80004090:	00058793          	mv	a5,a1
    80004094:	00050713          	mv	a4,a0
    80004098:	01088833          	add	a6,a7,a6
    8000409c:	0007b883          	ld	a7,0(a5)
    800040a0:	00878793          	addi	a5,a5,8
    800040a4:	00870713          	addi	a4,a4,8
    800040a8:	ff173c23          	sd	a7,-8(a4)
    800040ac:	ff0798e3          	bne	a5,a6,8000409c <__memmove+0x68>
    800040b0:	ff867713          	andi	a4,a2,-8
    800040b4:	02071793          	slli	a5,a4,0x20
    800040b8:	0207d793          	srli	a5,a5,0x20
    800040bc:	00f585b3          	add	a1,a1,a5
    800040c0:	40e686bb          	subw	a3,a3,a4
    800040c4:	00f507b3          	add	a5,a0,a5
    800040c8:	06e60463          	beq	a2,a4,80004130 <__memmove+0xfc>
    800040cc:	0005c703          	lbu	a4,0(a1)
    800040d0:	00e78023          	sb	a4,0(a5)
    800040d4:	04068e63          	beqz	a3,80004130 <__memmove+0xfc>
    800040d8:	0015c603          	lbu	a2,1(a1)
    800040dc:	00100713          	li	a4,1
    800040e0:	00c780a3          	sb	a2,1(a5)
    800040e4:	04e68663          	beq	a3,a4,80004130 <__memmove+0xfc>
    800040e8:	0025c603          	lbu	a2,2(a1)
    800040ec:	00200713          	li	a4,2
    800040f0:	00c78123          	sb	a2,2(a5)
    800040f4:	02e68e63          	beq	a3,a4,80004130 <__memmove+0xfc>
    800040f8:	0035c603          	lbu	a2,3(a1)
    800040fc:	00300713          	li	a4,3
    80004100:	00c781a3          	sb	a2,3(a5)
    80004104:	02e68663          	beq	a3,a4,80004130 <__memmove+0xfc>
    80004108:	0045c603          	lbu	a2,4(a1)
    8000410c:	00400713          	li	a4,4
    80004110:	00c78223          	sb	a2,4(a5)
    80004114:	00e68e63          	beq	a3,a4,80004130 <__memmove+0xfc>
    80004118:	0055c603          	lbu	a2,5(a1)
    8000411c:	00500713          	li	a4,5
    80004120:	00c782a3          	sb	a2,5(a5)
    80004124:	00e68663          	beq	a3,a4,80004130 <__memmove+0xfc>
    80004128:	0065c703          	lbu	a4,6(a1)
    8000412c:	00e78323          	sb	a4,6(a5)
    80004130:	00813403          	ld	s0,8(sp)
    80004134:	01010113          	addi	sp,sp,16
    80004138:	00008067          	ret
    8000413c:	02061713          	slli	a4,a2,0x20
    80004140:	02075713          	srli	a4,a4,0x20
    80004144:	00e587b3          	add	a5,a1,a4
    80004148:	f0f574e3          	bgeu	a0,a5,80004050 <__memmove+0x1c>
    8000414c:	02069613          	slli	a2,a3,0x20
    80004150:	02065613          	srli	a2,a2,0x20
    80004154:	fff64613          	not	a2,a2
    80004158:	00e50733          	add	a4,a0,a4
    8000415c:	00c78633          	add	a2,a5,a2
    80004160:	fff7c683          	lbu	a3,-1(a5)
    80004164:	fff78793          	addi	a5,a5,-1
    80004168:	fff70713          	addi	a4,a4,-1
    8000416c:	00d70023          	sb	a3,0(a4)
    80004170:	fec798e3          	bne	a5,a2,80004160 <__memmove+0x12c>
    80004174:	00813403          	ld	s0,8(sp)
    80004178:	01010113          	addi	sp,sp,16
    8000417c:	00008067          	ret
    80004180:	02069713          	slli	a4,a3,0x20
    80004184:	02075713          	srli	a4,a4,0x20
    80004188:	00170713          	addi	a4,a4,1
    8000418c:	00e50733          	add	a4,a0,a4
    80004190:	00050793          	mv	a5,a0
    80004194:	0005c683          	lbu	a3,0(a1)
    80004198:	00178793          	addi	a5,a5,1
    8000419c:	00158593          	addi	a1,a1,1
    800041a0:	fed78fa3          	sb	a3,-1(a5)
    800041a4:	fee798e3          	bne	a5,a4,80004194 <__memmove+0x160>
    800041a8:	f89ff06f          	j	80004130 <__memmove+0xfc>

00000000800041ac <__putc>:
    800041ac:	fe010113          	addi	sp,sp,-32
    800041b0:	00813823          	sd	s0,16(sp)
    800041b4:	00113c23          	sd	ra,24(sp)
    800041b8:	02010413          	addi	s0,sp,32
    800041bc:	00050793          	mv	a5,a0
    800041c0:	fef40593          	addi	a1,s0,-17
    800041c4:	00100613          	li	a2,1
    800041c8:	00000513          	li	a0,0
    800041cc:	fef407a3          	sb	a5,-17(s0)
    800041d0:	fffff097          	auipc	ra,0xfffff
    800041d4:	b3c080e7          	jalr	-1220(ra) # 80002d0c <console_write>
    800041d8:	01813083          	ld	ra,24(sp)
    800041dc:	01013403          	ld	s0,16(sp)
    800041e0:	02010113          	addi	sp,sp,32
    800041e4:	00008067          	ret

00000000800041e8 <__getc>:
    800041e8:	fe010113          	addi	sp,sp,-32
    800041ec:	00813823          	sd	s0,16(sp)
    800041f0:	00113c23          	sd	ra,24(sp)
    800041f4:	02010413          	addi	s0,sp,32
    800041f8:	fe840593          	addi	a1,s0,-24
    800041fc:	00100613          	li	a2,1
    80004200:	00000513          	li	a0,0
    80004204:	fffff097          	auipc	ra,0xfffff
    80004208:	ae8080e7          	jalr	-1304(ra) # 80002cec <console_read>
    8000420c:	fe844503          	lbu	a0,-24(s0)
    80004210:	01813083          	ld	ra,24(sp)
    80004214:	01013403          	ld	s0,16(sp)
    80004218:	02010113          	addi	sp,sp,32
    8000421c:	00008067          	ret

0000000080004220 <console_handler>:
    80004220:	fe010113          	addi	sp,sp,-32
    80004224:	00813823          	sd	s0,16(sp)
    80004228:	00113c23          	sd	ra,24(sp)
    8000422c:	00913423          	sd	s1,8(sp)
    80004230:	02010413          	addi	s0,sp,32
    80004234:	14202773          	csrr	a4,scause
    80004238:	100027f3          	csrr	a5,sstatus
    8000423c:	0027f793          	andi	a5,a5,2
    80004240:	06079e63          	bnez	a5,800042bc <console_handler+0x9c>
    80004244:	00074c63          	bltz	a4,8000425c <console_handler+0x3c>
    80004248:	01813083          	ld	ra,24(sp)
    8000424c:	01013403          	ld	s0,16(sp)
    80004250:	00813483          	ld	s1,8(sp)
    80004254:	02010113          	addi	sp,sp,32
    80004258:	00008067          	ret
    8000425c:	0ff77713          	andi	a4,a4,255
    80004260:	00900793          	li	a5,9
    80004264:	fef712e3          	bne	a4,a5,80004248 <console_handler+0x28>
    80004268:	ffffe097          	auipc	ra,0xffffe
    8000426c:	6dc080e7          	jalr	1756(ra) # 80002944 <plic_claim>
    80004270:	00a00793          	li	a5,10
    80004274:	00050493          	mv	s1,a0
    80004278:	02f50c63          	beq	a0,a5,800042b0 <console_handler+0x90>
    8000427c:	fc0506e3          	beqz	a0,80004248 <console_handler+0x28>
    80004280:	00050593          	mv	a1,a0
    80004284:	00001517          	auipc	a0,0x1
    80004288:	e6c50513          	addi	a0,a0,-404 # 800050f0 <CONSOLE_STATUS+0xe0>
    8000428c:	fffff097          	auipc	ra,0xfffff
    80004290:	afc080e7          	jalr	-1284(ra) # 80002d88 <__printf>
    80004294:	01013403          	ld	s0,16(sp)
    80004298:	01813083          	ld	ra,24(sp)
    8000429c:	00048513          	mv	a0,s1
    800042a0:	00813483          	ld	s1,8(sp)
    800042a4:	02010113          	addi	sp,sp,32
    800042a8:	ffffe317          	auipc	t1,0xffffe
    800042ac:	6d430067          	jr	1748(t1) # 8000297c <plic_complete>
    800042b0:	fffff097          	auipc	ra,0xfffff
    800042b4:	3e0080e7          	jalr	992(ra) # 80003690 <uartintr>
    800042b8:	fddff06f          	j	80004294 <console_handler+0x74>
    800042bc:	00001517          	auipc	a0,0x1
    800042c0:	f3450513          	addi	a0,a0,-204 # 800051f0 <digits+0x78>
    800042c4:	fffff097          	auipc	ra,0xfffff
    800042c8:	a68080e7          	jalr	-1432(ra) # 80002d2c <panic>
	...
