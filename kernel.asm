
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00004117          	auipc	sp,0x4
    80000004:	35013103          	ld	sp,848(sp) # 80004350 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	518010ef          	jal	ra,80001534 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_Z12checkNullptrPv>:
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"

void checkNullptr(void* p) {
    static int x = 0;
    if(p == nullptr) {
    80001000:	00050e63          	beqz	a0,8000101c <_Z12checkNullptrPv+0x1c>
        __putc('?');
        __putc('0' + x);
    }
    x++;
    80001004:	00003717          	auipc	a4,0x3
    80001008:	39c70713          	addi	a4,a4,924 # 800043a0 <_ZZ12checkNullptrPvE1x>
    8000100c:	00072783          	lw	a5,0(a4)
    80001010:	0017879b          	addiw	a5,a5,1
    80001014:	00f72023          	sw	a5,0(a4)
    80001018:	00008067          	ret
void checkNullptr(void* p) {
    8000101c:	ff010113          	addi	sp,sp,-16
    80001020:	00113423          	sd	ra,8(sp)
    80001024:	00813023          	sd	s0,0(sp)
    80001028:	01010413          	addi	s0,sp,16
        __putc('?');
    8000102c:	03f00513          	li	a0,63
    80001030:	00002097          	auipc	ra,0x2
    80001034:	5cc080e7          	jalr	1484(ra) # 800035fc <__putc>
        __putc('0' + x);
    80001038:	00003517          	auipc	a0,0x3
    8000103c:	36852503          	lw	a0,872(a0) # 800043a0 <_ZZ12checkNullptrPvE1x>
    80001040:	0305051b          	addiw	a0,a0,48
    80001044:	0ff57513          	andi	a0,a0,255
    80001048:	00002097          	auipc	ra,0x2
    8000104c:	5b4080e7          	jalr	1460(ra) # 800035fc <__putc>
    x++;
    80001050:	00003717          	auipc	a4,0x3
    80001054:	35070713          	addi	a4,a4,848 # 800043a0 <_ZZ12checkNullptrPvE1x>
    80001058:	00072783          	lw	a5,0(a4)
    8000105c:	0017879b          	addiw	a5,a5,1
    80001060:	00f72023          	sw	a5,0(a4)
}
    80001064:	00813083          	ld	ra,8(sp)
    80001068:	00013403          	ld	s0,0(sp)
    8000106c:	01010113          	addi	sp,sp,16
    80001070:	00008067          	ret

0000000080001074 <_Z11checkStatusi>:

void checkStatus(int status) {
    static int y = 0;
    if(status) {
    80001074:	00051e63          	bnez	a0,80001090 <_Z11checkStatusi+0x1c>
        __putc('0' + y);
        __putc('?');
    }
    y++;
    80001078:	00003717          	auipc	a4,0x3
    8000107c:	32870713          	addi	a4,a4,808 # 800043a0 <_ZZ12checkNullptrPvE1x>
    80001080:	00472783          	lw	a5,4(a4)
    80001084:	0017879b          	addiw	a5,a5,1
    80001088:	00f72223          	sw	a5,4(a4)
    8000108c:	00008067          	ret
void checkStatus(int status) {
    80001090:	ff010113          	addi	sp,sp,-16
    80001094:	00113423          	sd	ra,8(sp)
    80001098:	00813023          	sd	s0,0(sp)
    8000109c:	01010413          	addi	s0,sp,16
        __putc('0' + y);
    800010a0:	00003517          	auipc	a0,0x3
    800010a4:	30452503          	lw	a0,772(a0) # 800043a4 <_ZZ11checkStatusiE1y>
    800010a8:	0305051b          	addiw	a0,a0,48
    800010ac:	0ff57513          	andi	a0,a0,255
    800010b0:	00002097          	auipc	ra,0x2
    800010b4:	54c080e7          	jalr	1356(ra) # 800035fc <__putc>
        __putc('?');
    800010b8:	03f00513          	li	a0,63
    800010bc:	00002097          	auipc	ra,0x2
    800010c0:	540080e7          	jalr	1344(ra) # 800035fc <__putc>
    y++;
    800010c4:	00003717          	auipc	a4,0x3
    800010c8:	2dc70713          	addi	a4,a4,732 # 800043a0 <_ZZ12checkNullptrPvE1x>
    800010cc:	00472783          	lw	a5,4(a4)
    800010d0:	0017879b          	addiw	a5,a5,1
    800010d4:	00f72223          	sw	a5,4(a4)
}
    800010d8:	00813083          	ld	ra,8(sp)
    800010dc:	00013403          	ld	s0,0(sp)
    800010e0:	01010113          	addi	sp,sp,16
    800010e4:	00008067          	ret

00000000800010e8 <main>:

int main() {
    800010e8:	fd010113          	addi	sp,sp,-48
    800010ec:	02113423          	sd	ra,40(sp)
    800010f0:	02813023          	sd	s0,32(sp)
    800010f4:	00913c23          	sd	s1,24(sp)
    800010f8:	01213823          	sd	s2,16(sp)
    800010fc:	01313423          	sd	s3,8(sp)
    80001100:	03010413          	addi	s0,sp,48
    int velicinaZaglavlja = sizeof(size_t); // meni je ovoliko
    MemoryAllocator::initialize();
    80001104:	00000097          	auipc	ra,0x0
    80001108:	100080e7          	jalr	256(ra) # 80001204 <_ZN15MemoryAllocator10initializeEv>
    int *p1 = (int*)MemoryAllocator::mem_alloc(15*sizeof(int)); // trebalo bi da predje jedan blok od 64
    8000110c:	03c00513          	li	a0,60
    80001110:	00000097          	auipc	ra,0x0
    80001114:	13c080e7          	jalr	316(ra) # 8000124c <_ZN15MemoryAllocator9mem_allocEm>
    80001118:	00050993          	mv	s3,a0
    checkNullptr(p1);
    8000111c:	00000097          	auipc	ra,0x0
    80001120:	ee4080e7          	jalr	-284(ra) # 80001000 <_Z12checkNullptrPv>
    int *p2 = (int*)MemoryAllocator::mem_alloc(30*sizeof(int));
    80001124:	07800513          	li	a0,120
    80001128:	00000097          	auipc	ra,0x0
    8000112c:	124080e7          	jalr	292(ra) # 8000124c <_ZN15MemoryAllocator9mem_allocEm>
    80001130:	00050493          	mv	s1,a0
    checkNullptr(p2);
    80001134:	00000097          	auipc	ra,0x0
    80001138:	ecc080e7          	jalr	-308(ra) # 80001000 <_Z12checkNullptrPv>

    int *p3 = (int*)MemoryAllocator::mem_alloc(30*sizeof(int));
    8000113c:	07800513          	li	a0,120
    80001140:	00000097          	auipc	ra,0x0
    80001144:	10c080e7          	jalr	268(ra) # 8000124c <_ZN15MemoryAllocator9mem_allocEm>
    80001148:	00050913          	mv	s2,a0
    checkNullptr(p3);
    8000114c:	00000097          	auipc	ra,0x0
    80001150:	eb4080e7          	jalr	-332(ra) # 80001000 <_Z12checkNullptrPv>

    checkStatus(MemoryAllocator::mem_free(p1));
    80001154:	00098513          	mv	a0,s3
    80001158:	00000097          	auipc	ra,0x0
    8000115c:	254080e7          	jalr	596(ra) # 800013ac <_ZN15MemoryAllocator8mem_freeEPv>
    80001160:	00000097          	auipc	ra,0x0
    80001164:	f14080e7          	jalr	-236(ra) # 80001074 <_Z11checkStatusi>
    checkStatus(MemoryAllocator::mem_free(p3));
    80001168:	00090513          	mv	a0,s2
    8000116c:	00000097          	auipc	ra,0x0
    80001170:	240080e7          	jalr	576(ra) # 800013ac <_ZN15MemoryAllocator8mem_freeEPv>
    80001174:	00000097          	auipc	ra,0x0
    80001178:	f00080e7          	jalr	-256(ra) # 80001074 <_Z11checkStatusi>
    checkStatus(MemoryAllocator::mem_free(p2)); // p2 treba da se spoji sa p1 i p3
    8000117c:	00048513          	mv	a0,s1
    80001180:	00000097          	auipc	ra,0x0
    80001184:	22c080e7          	jalr	556(ra) # 800013ac <_ZN15MemoryAllocator8mem_freeEPv>
    80001188:	00000097          	auipc	ra,0x0
    8000118c:	eec080e7          	jalr	-276(ra) # 80001074 <_Z11checkStatusi>

    const size_t maxMemorija = (((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - velicinaZaglavlja)/MEM_BLOCK_SIZE - 1)*MEM_BLOCK_SIZE ;
    80001190:	00003797          	auipc	a5,0x3
    80001194:	1c87b783          	ld	a5,456(a5) # 80004358 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001198:	0007b503          	ld	a0,0(a5)
    8000119c:	00003797          	auipc	a5,0x3
    800011a0:	1ac7b783          	ld	a5,428(a5) # 80004348 <_GLOBAL_OFFSET_TABLE_+0x8>
    800011a4:	0007b783          	ld	a5,0(a5)
    800011a8:	40f50533          	sub	a0,a0,a5
    800011ac:	ff850513          	addi	a0,a0,-8
    800011b0:	00655513          	srli	a0,a0,0x6
    800011b4:	fff50513          	addi	a0,a0,-1
    int *celaMemorija = (int*)MemoryAllocator::mem_alloc(maxMemorija);
    800011b8:	00651513          	slli	a0,a0,0x6
    800011bc:	00000097          	auipc	ra,0x0
    800011c0:	090080e7          	jalr	144(ra) # 8000124c <_ZN15MemoryAllocator9mem_allocEm>
    800011c4:	00050493          	mv	s1,a0
    checkNullptr(celaMemorija);
    800011c8:	00000097          	auipc	ra,0x0
    800011cc:	e38080e7          	jalr	-456(ra) # 80001000 <_Z12checkNullptrPv>

    checkStatus(MemoryAllocator::mem_free(celaMemorija));
    800011d0:	00048513          	mv	a0,s1
    800011d4:	00000097          	auipc	ra,0x0
    800011d8:	1d8080e7          	jalr	472(ra) # 800013ac <_ZN15MemoryAllocator8mem_freeEPv>
    800011dc:	00000097          	auipc	ra,0x0
    800011e0:	e98080e7          	jalr	-360(ra) # 80001074 <_Z11checkStatusi>


    return 0;
    800011e4:	00000513          	li	a0,0
    800011e8:	02813083          	ld	ra,40(sp)
    800011ec:	02013403          	ld	s0,32(sp)
    800011f0:	01813483          	ld	s1,24(sp)
    800011f4:	01013903          	ld	s2,16(sp)
    800011f8:	00813983          	ld	s3,8(sp)
    800011fc:	03010113          	addi	sp,sp,48
    80001200:	00008067          	ret

0000000080001204 <_ZN15MemoryAllocator10initializeEv>:
#include "../h/MemoryAllocator.hpp"

memblock* MemoryAllocator::freeHead = nullptr;
memblock* MemoryAllocator::allocatedHead = nullptr;

void MemoryAllocator::initialize(){
    80001204:	ff010113          	addi	sp,sp,-16
    80001208:	00813423          	sd	s0,8(sp)
    8000120c:	01010413          	addi	s0,sp,16
    freeHead = (memblock*) HEAP_START_ADDR;
    80001210:	00003797          	auipc	a5,0x3
    80001214:	1387b783          	ld	a5,312(a5) # 80004348 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001218:	0007b783          	ld	a5,0(a5)
    8000121c:	00003717          	auipc	a4,0x3
    80001220:	18f73623          	sd	a5,396(a4) # 800043a8 <_ZN15MemoryAllocator8freeHeadE>
    freeHead->prev = freeHead->next = nullptr;
    80001224:	0007b823          	sd	zero,16(a5)
    80001228:	0007b423          	sd	zero,8(a5)
    freeHead->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR);
    8000122c:	00003717          	auipc	a4,0x3
    80001230:	12c73703          	ld	a4,300(a4) # 80004358 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001234:	00073703          	ld	a4,0(a4)
    80001238:	40f70733          	sub	a4,a4,a5
    8000123c:	00e7b023          	sd	a4,0(a5)
}
    80001240:	00813403          	ld	s0,8(sp)
    80001244:	01010113          	addi	sp,sp,16
    80001248:	00008067          	ret

000000008000124c <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t allocSize) {
    8000124c:	ff010113          	addi	sp,sp,-16
    80001250:	00813423          	sd	s0,8(sp)
    80001254:	01010413          	addi	s0,sp,16
    memblock* currentBlock = freeHead;
    80001258:	00003617          	auipc	a2,0x3
    8000125c:	15063603          	ld	a2,336(a2) # 800043a8 <_ZN15MemoryAllocator8freeHeadE>
    int inserted = 0;

    if (allocSize <= MEM_BLOCK_SIZE){
    80001260:	04000793          	li	a5,64
    80001264:	02a7f663          	bgeu	a5,a0,80001290 <_ZN15MemoryAllocator9mem_allocEm+0x44>
        allocSize = MEM_BLOCK_SIZE;
    } else {
        allocSize = (allocSize / MEM_BLOCK_SIZE + 1) * MEM_BLOCK_SIZE;
    80001268:	00655693          	srli	a3,a0,0x6
    8000126c:	00168693          	addi	a3,a3,1
    80001270:	00669693          	slli	a3,a3,0x6
        allocSize = MEM_BLOCK_SIZE;
    80001274:	00060513          	mv	a0,a2
    }

    while (currentBlock) {
    80001278:	06050a63          	beqz	a0,800012ec <_ZN15MemoryAllocator9mem_allocEm+0xa0>
        if (currentBlock->size >= allocSize + sizeof(memblock)) {
    8000127c:	00053703          	ld	a4,0(a0)
    80001280:	01868793          	addi	a5,a3,24
    80001284:	00f77a63          	bgeu	a4,a5,80001298 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
                    freeHead = currentBlock->next;
                }
                break;
            }
        }
        currentBlock = currentBlock->next;
    80001288:	01053503          	ld	a0,16(a0)
    while (currentBlock) {
    8000128c:	fedff06f          	j	80001278 <_ZN15MemoryAllocator9mem_allocEm+0x2c>
        allocSize = MEM_BLOCK_SIZE;
    80001290:	04000693          	li	a3,64
    80001294:	fe1ff06f          	j	80001274 <_ZN15MemoryAllocator9mem_allocEm+0x28>
            if(currentBlock->size > allocSize + sizeof(memblock)) {
    80001298:	08e7fa63          	bgeu	a5,a4,8000132c <_ZN15MemoryAllocator9mem_allocEm+0xe0>
                memblock *blockRemainder = (memblock *) ((char *) currentBlock + sizeof(memblock) + allocSize);
    8000129c:	00f507b3          	add	a5,a0,a5
                blockRemainder->prev = blockRemainder->next = nullptr;
    800012a0:	0007b823          	sd	zero,16(a5)
    800012a4:	0007b423          	sd	zero,8(a5)
                blockRemainder->size = currentBlock->size - allocSize - sizeof (memblock);
    800012a8:	00053703          	ld	a4,0(a0)
    800012ac:	40d706b3          	sub	a3,a4,a3
    800012b0:	fe868693          	addi	a3,a3,-24
    800012b4:	00d7b023          	sd	a3,0(a5)
                if(currentBlock->prev){
    800012b8:	00853703          	ld	a4,8(a0)
    800012bc:	00070863          	beqz	a4,800012cc <_ZN15MemoryAllocator9mem_allocEm+0x80>
                    currentBlock->prev->next = blockRemainder;
    800012c0:	00f73823          	sd	a5,16(a4)
                    blockRemainder->prev = currentBlock->prev;
    800012c4:	00853703          	ld	a4,8(a0)
    800012c8:	00e7b423          	sd	a4,8(a5)
                if(currentBlock->next){
    800012cc:	01053703          	ld	a4,16(a0)
    800012d0:	00070863          	beqz	a4,800012e0 <_ZN15MemoryAllocator9mem_allocEm+0x94>
                    currentBlock->next->prev = blockRemainder;
    800012d4:	00f73423          	sd	a5,8(a4)
                    blockRemainder->next = currentBlock->next;
    800012d8:	01053703          	ld	a4,16(a0)
    800012dc:	00e7b823          	sd	a4,16(a5)
                if(currentBlock == freeHead) {
    800012e0:	00003717          	auipc	a4,0x3
    800012e4:	0c873703          	ld	a4,200(a4) # 800043a8 <_ZN15MemoryAllocator8freeHeadE>
    800012e8:	02a70c63          	beq	a4,a0,80001320 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    }
    memblock* currentAllocatedBlock = nullptr;
    if(currentBlock != nullptr) {
    800012ec:	02050463          	beqz	a0,80001314 <_ZN15MemoryAllocator9mem_allocEm+0xc8>
        if (allocatedHead == nullptr) {
    800012f0:	00003797          	auipc	a5,0x3
    800012f4:	0c07b783          	ld	a5,192(a5) # 800043b0 <_ZN15MemoryAllocator13allocatedHeadE>
    800012f8:	06078463          	beqz	a5,80001360 <_ZN15MemoryAllocator9mem_allocEm+0x114>
            allocatedHead = currentBlock;
            allocatedHead->next = allocatedHead->prev = nullptr;
        } else if (currentBlock < allocatedHead) {
    800012fc:	06f57c63          	bgeu	a0,a5,80001374 <_ZN15MemoryAllocator9mem_allocEm+0x128>

            currentBlock->next = allocatedHead;
    80001300:	00f53823          	sd	a5,16(a0)
            currentBlock->prev = nullptr;
    80001304:	00053423          	sd	zero,8(a0)
            allocatedHead = currentBlock;
    80001308:	00003797          	auipc	a5,0x3
    8000130c:	0aa7b423          	sd	a0,168(a5) # 800043b0 <_ZN15MemoryAllocator13allocatedHeadE>
                currentAllocatedBlock->next = currentBlock;
            }
        }


        if ((void *) ((char *) currentBlock + sizeof(memblock)) != nullptr) {
    80001310:	01850513          	addi	a0,a0,24
    // svakom bloku nadji mesto
    // 1. scenario blok je na pocetku
    // 2. scenario blok je u sredini
    // 3. scenario blok je na kraju

}
    80001314:	00813403          	ld	s0,8(sp)
    80001318:	01010113          	addi	sp,sp,16
    8000131c:	00008067          	ret
                    freeHead = blockRemainder;
    80001320:	00003717          	auipc	a4,0x3
    80001324:	08f73423          	sd	a5,136(a4) # 800043a8 <_ZN15MemoryAllocator8freeHeadE>
    80001328:	fc5ff06f          	j	800012ec <_ZN15MemoryAllocator9mem_allocEm+0xa0>
                if(currentBlock->prev){
    8000132c:	00853783          	ld	a5,8(a0)
    80001330:	00078663          	beqz	a5,8000133c <_ZN15MemoryAllocator9mem_allocEm+0xf0>
                    currentBlock->prev->next = currentBlock->next;
    80001334:	01053703          	ld	a4,16(a0)
    80001338:	00e7b823          	sd	a4,16(a5)
                if(currentBlock->next){
    8000133c:	01053783          	ld	a5,16(a0)
    80001340:	00078663          	beqz	a5,8000134c <_ZN15MemoryAllocator9mem_allocEm+0x100>
                    currentBlock->next->prev = currentBlock->prev;
    80001344:	00853703          	ld	a4,8(a0)
    80001348:	00e7b423          	sd	a4,8(a5)
                if(currentBlock == freeHead){
    8000134c:	fac510e3          	bne	a0,a2,800012ec <_ZN15MemoryAllocator9mem_allocEm+0xa0>
                    freeHead = currentBlock->next;
    80001350:	01053783          	ld	a5,16(a0)
    80001354:	00003717          	auipc	a4,0x3
    80001358:	04f73a23          	sd	a5,84(a4) # 800043a8 <_ZN15MemoryAllocator8freeHeadE>
    8000135c:	f91ff06f          	j	800012ec <_ZN15MemoryAllocator9mem_allocEm+0xa0>
            allocatedHead = currentBlock;
    80001360:	00003797          	auipc	a5,0x3
    80001364:	04a7b823          	sd	a0,80(a5) # 800043b0 <_ZN15MemoryAllocator13allocatedHeadE>
            allocatedHead->next = allocatedHead->prev = nullptr;
    80001368:	00053423          	sd	zero,8(a0)
    8000136c:	00053823          	sd	zero,16(a0)
    80001370:	fa1ff06f          	j	80001310 <_ZN15MemoryAllocator9mem_allocEm+0xc4>
            while (currentAllocatedBlock->next) {
    80001374:	00078713          	mv	a4,a5
    80001378:	0107b783          	ld	a5,16(a5)
    8000137c:	02078063          	beqz	a5,8000139c <_ZN15MemoryAllocator9mem_allocEm+0x150>
                if (currentBlock < currentAllocatedBlock) {
    80001380:	fee57ae3          	bgeu	a0,a4,80001374 <_ZN15MemoryAllocator9mem_allocEm+0x128>
                    currentBlock->next = currentAllocatedBlock;
    80001384:	00e53823          	sd	a4,16(a0)
                    currentBlock->prev = currentAllocatedBlock->prev;
    80001388:	00873783          	ld	a5,8(a4)
    8000138c:	00f53423          	sd	a5,8(a0)
                    currentAllocatedBlock->prev->next = currentBlock;
    80001390:	00a7b823          	sd	a0,16(a5)
                    currentAllocatedBlock->prev = currentBlock;
    80001394:	00a73423          	sd	a0,8(a4)
            if (inserted == 0) {
    80001398:	f79ff06f          	j	80001310 <_ZN15MemoryAllocator9mem_allocEm+0xc4>
                currentBlock->prev = currentAllocatedBlock;
    8000139c:	00e53423          	sd	a4,8(a0)
                currentBlock->next = nullptr;
    800013a0:	00053823          	sd	zero,16(a0)
                currentAllocatedBlock->next = currentBlock;
    800013a4:	00a73823          	sd	a0,16(a4)
    800013a8:	f69ff06f          	j	80001310 <_ZN15MemoryAllocator9mem_allocEm+0xc4>

00000000800013ac <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void* ptr) {
    800013ac:	ff010113          	addi	sp,sp,-16
    800013b0:	00813423          	sd	s0,8(sp)
    800013b4:	01010413          	addi	s0,sp,16
    //dolazi mi pokazivac na adresu pocetka bloka, treba da izvucem taj blok iz liste
    //pa onda da prevezem prev i next ako ima
    if (ptr == nullptr){
    800013b8:	14050e63          	beqz	a0,80001514 <_ZN15MemoryAllocator8mem_freeEPv+0x168>
        return -1;
    }

    memblock* currentBlock = (memblock *) ((char *) (ptr) - sizeof(memblock));
    800013bc:	fe850613          	addi	a2,a0,-24

    if (allocatedHead == nullptr){
    800013c0:	00003797          	auipc	a5,0x3
    800013c4:	ff07b783          	ld	a5,-16(a5) # 800043b0 <_ZN15MemoryAllocator13allocatedHeadE>
    800013c8:	14078a63          	beqz	a5,8000151c <_ZN15MemoryAllocator8mem_freeEPv+0x170>
        return -1;
    }

    if(allocatedHead == currentBlock){
    800013cc:	0ac78063          	beq	a5,a2,8000146c <_ZN15MemoryAllocator8mem_freeEPv+0xc0>
        allocatedHead = currentBlock->next;
    }
    if(currentBlock->prev){
    800013d0:	ff053783          	ld	a5,-16(a0)
    800013d4:	00078663          	beqz	a5,800013e0 <_ZN15MemoryAllocator8mem_freeEPv+0x34>
        currentBlock->prev->next = currentBlock->next;
    800013d8:	ff853703          	ld	a4,-8(a0)
    800013dc:	00e7b823          	sd	a4,16(a5)
    }
    if(currentBlock->next){
    800013e0:	ff853783          	ld	a5,-8(a0)
    800013e4:	00078663          	beqz	a5,800013f0 <_ZN15MemoryAllocator8mem_freeEPv+0x44>
        currentBlock->next->prev = currentBlock->prev;
    800013e8:	ff053703          	ld	a4,-16(a0)
    800013ec:	00e7b423          	sd	a4,8(a5)
    //ubaci blok u niz free
    //probaj na pocetak
    //probaj u sredinu
    //probaj na kraj

    if(freeHead == nullptr){
    800013f0:	00003797          	auipc	a5,0x3
    800013f4:	fb87b783          	ld	a5,-72(a5) # 800043a8 <_ZN15MemoryAllocator8freeHeadE>
    800013f8:	08078263          	beqz	a5,8000147c <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
        freeHead->next = freeHead->prev = nullptr;
        freeHead = currentBlock;
    } else
    if(currentBlock < freeHead){
    800013fc:	08f67a63          	bgeu	a2,a5,80001490 <_ZN15MemoryAllocator8mem_freeEPv+0xe4>
        freeHead->prev = currentBlock;
    80001400:	00c7b423          	sd	a2,8(a5)
        currentBlock->next = freeHead;
    80001404:	fef53c23          	sd	a5,-8(a0)
        freeHead = currentBlock;
    80001408:	00003797          	auipc	a5,0x3
    8000140c:	fac7b023          	sd	a2,-96(a5) # 800043a8 <_ZN15MemoryAllocator8freeHeadE>
        freeHead->prev = nullptr;
    80001410:	00063423          	sd	zero,8(a2)
        }
    }

    // probaj da spojis oslobodjeni blok sa delovima oko sebe da ne bi doslo do fragmentacije

    if(currentBlock->prev){
    80001414:	ff053703          	ld	a4,-16(a0)
    80001418:	02070063          	beqz	a4,80001438 <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
        memblock* curr = currentBlock->prev;
        if((char*)(curr + curr->size + sizeof(memblock)) == (char*)currentBlock){
    8000141c:	00073683          	ld	a3,0(a4)
    80001420:	00169793          	slli	a5,a3,0x1
    80001424:	00d787b3          	add	a5,a5,a3
    80001428:	00379793          	slli	a5,a5,0x3
    8000142c:	24078793          	addi	a5,a5,576
    80001430:	00f707b3          	add	a5,a4,a5
    80001434:	08c78c63          	beq	a5,a2,800014cc <_ZN15MemoryAllocator8mem_freeEPv+0x120>
                currentBlock->next->prev = curr;
            }
        }
    }

    if (currentBlock->next){
    80001438:	ff853703          	ld	a4,-8(a0)
    8000143c:	0e070463          	beqz	a4,80001524 <_ZN15MemoryAllocator8mem_freeEPv+0x178>
        memblock* curr = currentBlock->next;
        if((char*)(currentBlock + currentBlock->size + sizeof(memblock)) == (char*)curr){
    80001440:	fe853683          	ld	a3,-24(a0)
    80001444:	00169793          	slli	a5,a3,0x1
    80001448:	00d787b3          	add	a5,a5,a3
    8000144c:	00379793          	slli	a5,a5,0x3
    80001450:	24078793          	addi	a5,a5,576
    80001454:	00f607b3          	add	a5,a2,a5
    80001458:	08f70a63          	beq	a4,a5,800014ec <_ZN15MemoryAllocator8mem_freeEPv+0x140>
                currentBlock->next = curr->next;
            }
        }
    }

    return 0;
    8000145c:	00000513          	li	a0,0

}
    80001460:	00813403          	ld	s0,8(sp)
    80001464:	01010113          	addi	sp,sp,16
    80001468:	00008067          	ret
        allocatedHead = currentBlock->next;
    8000146c:	ff853783          	ld	a5,-8(a0)
    80001470:	00003717          	auipc	a4,0x3
    80001474:	f4f73023          	sd	a5,-192(a4) # 800043b0 <_ZN15MemoryAllocator13allocatedHeadE>
    80001478:	f59ff06f          	j	800013d0 <_ZN15MemoryAllocator8mem_freeEPv+0x24>
        freeHead->next = freeHead->prev = nullptr;
    8000147c:	0007b423          	sd	zero,8(a5)
    80001480:	0007b823          	sd	zero,16(a5)
        freeHead = currentBlock;
    80001484:	00003797          	auipc	a5,0x3
    80001488:	f2c7b223          	sd	a2,-220(a5) # 800043a8 <_ZN15MemoryAllocator8freeHeadE>
    8000148c:	f89ff06f          	j	80001414 <_ZN15MemoryAllocator8mem_freeEPv+0x68>
        while (curr->next && curr->next < currentBlock){
    80001490:	00078713          	mv	a4,a5
    80001494:	0107b783          	ld	a5,16(a5)
    80001498:	00078463          	beqz	a5,800014a0 <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
    8000149c:	fec7eae3          	bltu	a5,a2,80001490 <_ZN15MemoryAllocator8mem_freeEPv+0xe4>
        if(curr->next == nullptr){
    800014a0:	02078063          	beqz	a5,800014c0 <_ZN15MemoryAllocator8mem_freeEPv+0x114>
            currentBlock->prev = curr;
    800014a4:	fee53823          	sd	a4,-16(a0)
            curr->next->prev = currentBlock;
    800014a8:	01073783          	ld	a5,16(a4)
    800014ac:	00c7b423          	sd	a2,8(a5)
            currentBlock->next = curr->next;
    800014b0:	01073783          	ld	a5,16(a4)
    800014b4:	fef53c23          	sd	a5,-8(a0)
            curr->next = currentBlock;
    800014b8:	00c73823          	sd	a2,16(a4)
    800014bc:	f59ff06f          	j	80001414 <_ZN15MemoryAllocator8mem_freeEPv+0x68>
            curr->next = currentBlock;
    800014c0:	00c73823          	sd	a2,16(a4)
            currentBlock->prev = curr;
    800014c4:	fee53823          	sd	a4,-16(a0)
    800014c8:	f4dff06f          	j	80001414 <_ZN15MemoryAllocator8mem_freeEPv+0x68>
            curr->size = curr->size + currentBlock->size;
    800014cc:	fe853783          	ld	a5,-24(a0)
    800014d0:	00f686b3          	add	a3,a3,a5
    800014d4:	00d73023          	sd	a3,0(a4)
            if(currentBlock->next) {
    800014d8:	ff853783          	ld	a5,-8(a0)
    800014dc:	f4078ee3          	beqz	a5,80001438 <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
                curr->next = currentBlock->next;
    800014e0:	00f73823          	sd	a5,16(a4)
                currentBlock->next->prev = curr;
    800014e4:	00e7b423          	sd	a4,8(a5)
    800014e8:	f51ff06f          	j	80001438 <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
            currentBlock->size = currentBlock->size + curr ->size;
    800014ec:	00073783          	ld	a5,0(a4)
    800014f0:	00f686b3          	add	a3,a3,a5
    800014f4:	fed53423          	sd	a3,-24(a0)
            if(curr->next) {
    800014f8:	01073783          	ld	a5,16(a4)
    800014fc:	02078863          	beqz	a5,8000152c <_ZN15MemoryAllocator8mem_freeEPv+0x180>
                curr->next->prev = currentBlock;
    80001500:	00c7b423          	sd	a2,8(a5)
                currentBlock->next = curr->next;
    80001504:	01073783          	ld	a5,16(a4)
    80001508:	fef53c23          	sd	a5,-8(a0)
    return 0;
    8000150c:	00000513          	li	a0,0
    80001510:	f51ff06f          	j	80001460 <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
        return -1;
    80001514:	fff00513          	li	a0,-1
    80001518:	f49ff06f          	j	80001460 <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
        return -1;
    8000151c:	fff00513          	li	a0,-1
    80001520:	f41ff06f          	j	80001460 <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
    return 0;
    80001524:	00000513          	li	a0,0
    80001528:	f39ff06f          	j	80001460 <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
    8000152c:	00000513          	li	a0,0
    80001530:	f31ff06f          	j	80001460 <_ZN15MemoryAllocator8mem_freeEPv+0xb4>

0000000080001534 <start>:
    80001534:	ff010113          	addi	sp,sp,-16
    80001538:	00813423          	sd	s0,8(sp)
    8000153c:	01010413          	addi	s0,sp,16
    80001540:	300027f3          	csrr	a5,mstatus
    80001544:	ffffe737          	lui	a4,0xffffe
    80001548:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff91ef>
    8000154c:	00e7f7b3          	and	a5,a5,a4
    80001550:	00001737          	lui	a4,0x1
    80001554:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001558:	00e7e7b3          	or	a5,a5,a4
    8000155c:	30079073          	csrw	mstatus,a5
    80001560:	00000797          	auipc	a5,0x0
    80001564:	16078793          	addi	a5,a5,352 # 800016c0 <system_main>
    80001568:	34179073          	csrw	mepc,a5
    8000156c:	00000793          	li	a5,0
    80001570:	18079073          	csrw	satp,a5
    80001574:	000107b7          	lui	a5,0x10
    80001578:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000157c:	30279073          	csrw	medeleg,a5
    80001580:	30379073          	csrw	mideleg,a5
    80001584:	104027f3          	csrr	a5,sie
    80001588:	2227e793          	ori	a5,a5,546
    8000158c:	10479073          	csrw	sie,a5
    80001590:	fff00793          	li	a5,-1
    80001594:	00a7d793          	srli	a5,a5,0xa
    80001598:	3b079073          	csrw	pmpaddr0,a5
    8000159c:	00f00793          	li	a5,15
    800015a0:	3a079073          	csrw	pmpcfg0,a5
    800015a4:	f14027f3          	csrr	a5,mhartid
    800015a8:	0200c737          	lui	a4,0x200c
    800015ac:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800015b0:	0007869b          	sext.w	a3,a5
    800015b4:	00269713          	slli	a4,a3,0x2
    800015b8:	000f4637          	lui	a2,0xf4
    800015bc:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800015c0:	00d70733          	add	a4,a4,a3
    800015c4:	0037979b          	slliw	a5,a5,0x3
    800015c8:	020046b7          	lui	a3,0x2004
    800015cc:	00d787b3          	add	a5,a5,a3
    800015d0:	00c585b3          	add	a1,a1,a2
    800015d4:	00371693          	slli	a3,a4,0x3
    800015d8:	00003717          	auipc	a4,0x3
    800015dc:	de870713          	addi	a4,a4,-536 # 800043c0 <timer_scratch>
    800015e0:	00b7b023          	sd	a1,0(a5)
    800015e4:	00d70733          	add	a4,a4,a3
    800015e8:	00f73c23          	sd	a5,24(a4)
    800015ec:	02c73023          	sd	a2,32(a4)
    800015f0:	34071073          	csrw	mscratch,a4
    800015f4:	00000797          	auipc	a5,0x0
    800015f8:	6ec78793          	addi	a5,a5,1772 # 80001ce0 <timervec>
    800015fc:	30579073          	csrw	mtvec,a5
    80001600:	300027f3          	csrr	a5,mstatus
    80001604:	0087e793          	ori	a5,a5,8
    80001608:	30079073          	csrw	mstatus,a5
    8000160c:	304027f3          	csrr	a5,mie
    80001610:	0807e793          	ori	a5,a5,128
    80001614:	30479073          	csrw	mie,a5
    80001618:	f14027f3          	csrr	a5,mhartid
    8000161c:	0007879b          	sext.w	a5,a5
    80001620:	00078213          	mv	tp,a5
    80001624:	30200073          	mret
    80001628:	00813403          	ld	s0,8(sp)
    8000162c:	01010113          	addi	sp,sp,16
    80001630:	00008067          	ret

0000000080001634 <timerinit>:
    80001634:	ff010113          	addi	sp,sp,-16
    80001638:	00813423          	sd	s0,8(sp)
    8000163c:	01010413          	addi	s0,sp,16
    80001640:	f14027f3          	csrr	a5,mhartid
    80001644:	0200c737          	lui	a4,0x200c
    80001648:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000164c:	0007869b          	sext.w	a3,a5
    80001650:	00269713          	slli	a4,a3,0x2
    80001654:	000f4637          	lui	a2,0xf4
    80001658:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000165c:	00d70733          	add	a4,a4,a3
    80001660:	0037979b          	slliw	a5,a5,0x3
    80001664:	020046b7          	lui	a3,0x2004
    80001668:	00d787b3          	add	a5,a5,a3
    8000166c:	00c585b3          	add	a1,a1,a2
    80001670:	00371693          	slli	a3,a4,0x3
    80001674:	00003717          	auipc	a4,0x3
    80001678:	d4c70713          	addi	a4,a4,-692 # 800043c0 <timer_scratch>
    8000167c:	00b7b023          	sd	a1,0(a5)
    80001680:	00d70733          	add	a4,a4,a3
    80001684:	00f73c23          	sd	a5,24(a4)
    80001688:	02c73023          	sd	a2,32(a4)
    8000168c:	34071073          	csrw	mscratch,a4
    80001690:	00000797          	auipc	a5,0x0
    80001694:	65078793          	addi	a5,a5,1616 # 80001ce0 <timervec>
    80001698:	30579073          	csrw	mtvec,a5
    8000169c:	300027f3          	csrr	a5,mstatus
    800016a0:	0087e793          	ori	a5,a5,8
    800016a4:	30079073          	csrw	mstatus,a5
    800016a8:	304027f3          	csrr	a5,mie
    800016ac:	0807e793          	ori	a5,a5,128
    800016b0:	30479073          	csrw	mie,a5
    800016b4:	00813403          	ld	s0,8(sp)
    800016b8:	01010113          	addi	sp,sp,16
    800016bc:	00008067          	ret

00000000800016c0 <system_main>:
    800016c0:	fe010113          	addi	sp,sp,-32
    800016c4:	00813823          	sd	s0,16(sp)
    800016c8:	00913423          	sd	s1,8(sp)
    800016cc:	00113c23          	sd	ra,24(sp)
    800016d0:	02010413          	addi	s0,sp,32
    800016d4:	00000097          	auipc	ra,0x0
    800016d8:	0c4080e7          	jalr	196(ra) # 80001798 <cpuid>
    800016dc:	00003497          	auipc	s1,0x3
    800016e0:	c9448493          	addi	s1,s1,-876 # 80004370 <started>
    800016e4:	02050263          	beqz	a0,80001708 <system_main+0x48>
    800016e8:	0004a783          	lw	a5,0(s1)
    800016ec:	0007879b          	sext.w	a5,a5
    800016f0:	fe078ce3          	beqz	a5,800016e8 <system_main+0x28>
    800016f4:	0ff0000f          	fence
    800016f8:	00003517          	auipc	a0,0x3
    800016fc:	95850513          	addi	a0,a0,-1704 # 80004050 <CONSOLE_STATUS+0x40>
    80001700:	00001097          	auipc	ra,0x1
    80001704:	a7c080e7          	jalr	-1412(ra) # 8000217c <panic>
    80001708:	00001097          	auipc	ra,0x1
    8000170c:	9d0080e7          	jalr	-1584(ra) # 800020d8 <consoleinit>
    80001710:	00001097          	auipc	ra,0x1
    80001714:	15c080e7          	jalr	348(ra) # 8000286c <printfinit>
    80001718:	00003517          	auipc	a0,0x3
    8000171c:	a1850513          	addi	a0,a0,-1512 # 80004130 <CONSOLE_STATUS+0x120>
    80001720:	00001097          	auipc	ra,0x1
    80001724:	ab8080e7          	jalr	-1352(ra) # 800021d8 <__printf>
    80001728:	00003517          	auipc	a0,0x3
    8000172c:	8f850513          	addi	a0,a0,-1800 # 80004020 <CONSOLE_STATUS+0x10>
    80001730:	00001097          	auipc	ra,0x1
    80001734:	aa8080e7          	jalr	-1368(ra) # 800021d8 <__printf>
    80001738:	00003517          	auipc	a0,0x3
    8000173c:	9f850513          	addi	a0,a0,-1544 # 80004130 <CONSOLE_STATUS+0x120>
    80001740:	00001097          	auipc	ra,0x1
    80001744:	a98080e7          	jalr	-1384(ra) # 800021d8 <__printf>
    80001748:	00001097          	auipc	ra,0x1
    8000174c:	4b0080e7          	jalr	1200(ra) # 80002bf8 <kinit>
    80001750:	00000097          	auipc	ra,0x0
    80001754:	148080e7          	jalr	328(ra) # 80001898 <trapinit>
    80001758:	00000097          	auipc	ra,0x0
    8000175c:	16c080e7          	jalr	364(ra) # 800018c4 <trapinithart>
    80001760:	00000097          	auipc	ra,0x0
    80001764:	5c0080e7          	jalr	1472(ra) # 80001d20 <plicinit>
    80001768:	00000097          	auipc	ra,0x0
    8000176c:	5e0080e7          	jalr	1504(ra) # 80001d48 <plicinithart>
    80001770:	00000097          	auipc	ra,0x0
    80001774:	078080e7          	jalr	120(ra) # 800017e8 <userinit>
    80001778:	0ff0000f          	fence
    8000177c:	00100793          	li	a5,1
    80001780:	00003517          	auipc	a0,0x3
    80001784:	8b850513          	addi	a0,a0,-1864 # 80004038 <CONSOLE_STATUS+0x28>
    80001788:	00f4a023          	sw	a5,0(s1)
    8000178c:	00001097          	auipc	ra,0x1
    80001790:	a4c080e7          	jalr	-1460(ra) # 800021d8 <__printf>
    80001794:	0000006f          	j	80001794 <system_main+0xd4>

0000000080001798 <cpuid>:
    80001798:	ff010113          	addi	sp,sp,-16
    8000179c:	00813423          	sd	s0,8(sp)
    800017a0:	01010413          	addi	s0,sp,16
    800017a4:	00020513          	mv	a0,tp
    800017a8:	00813403          	ld	s0,8(sp)
    800017ac:	0005051b          	sext.w	a0,a0
    800017b0:	01010113          	addi	sp,sp,16
    800017b4:	00008067          	ret

00000000800017b8 <mycpu>:
    800017b8:	ff010113          	addi	sp,sp,-16
    800017bc:	00813423          	sd	s0,8(sp)
    800017c0:	01010413          	addi	s0,sp,16
    800017c4:	00020793          	mv	a5,tp
    800017c8:	00813403          	ld	s0,8(sp)
    800017cc:	0007879b          	sext.w	a5,a5
    800017d0:	00779793          	slli	a5,a5,0x7
    800017d4:	00004517          	auipc	a0,0x4
    800017d8:	c1c50513          	addi	a0,a0,-996 # 800053f0 <cpus>
    800017dc:	00f50533          	add	a0,a0,a5
    800017e0:	01010113          	addi	sp,sp,16
    800017e4:	00008067          	ret

00000000800017e8 <userinit>:
    800017e8:	ff010113          	addi	sp,sp,-16
    800017ec:	00813423          	sd	s0,8(sp)
    800017f0:	01010413          	addi	s0,sp,16
    800017f4:	00813403          	ld	s0,8(sp)
    800017f8:	01010113          	addi	sp,sp,16
    800017fc:	00000317          	auipc	t1,0x0
    80001800:	8ec30067          	jr	-1812(t1) # 800010e8 <main>

0000000080001804 <either_copyout>:
    80001804:	ff010113          	addi	sp,sp,-16
    80001808:	00813023          	sd	s0,0(sp)
    8000180c:	00113423          	sd	ra,8(sp)
    80001810:	01010413          	addi	s0,sp,16
    80001814:	02051663          	bnez	a0,80001840 <either_copyout+0x3c>
    80001818:	00058513          	mv	a0,a1
    8000181c:	00060593          	mv	a1,a2
    80001820:	0006861b          	sext.w	a2,a3
    80001824:	00002097          	auipc	ra,0x2
    80001828:	c60080e7          	jalr	-928(ra) # 80003484 <__memmove>
    8000182c:	00813083          	ld	ra,8(sp)
    80001830:	00013403          	ld	s0,0(sp)
    80001834:	00000513          	li	a0,0
    80001838:	01010113          	addi	sp,sp,16
    8000183c:	00008067          	ret
    80001840:	00003517          	auipc	a0,0x3
    80001844:	83850513          	addi	a0,a0,-1992 # 80004078 <CONSOLE_STATUS+0x68>
    80001848:	00001097          	auipc	ra,0x1
    8000184c:	934080e7          	jalr	-1740(ra) # 8000217c <panic>

0000000080001850 <either_copyin>:
    80001850:	ff010113          	addi	sp,sp,-16
    80001854:	00813023          	sd	s0,0(sp)
    80001858:	00113423          	sd	ra,8(sp)
    8000185c:	01010413          	addi	s0,sp,16
    80001860:	02059463          	bnez	a1,80001888 <either_copyin+0x38>
    80001864:	00060593          	mv	a1,a2
    80001868:	0006861b          	sext.w	a2,a3
    8000186c:	00002097          	auipc	ra,0x2
    80001870:	c18080e7          	jalr	-1000(ra) # 80003484 <__memmove>
    80001874:	00813083          	ld	ra,8(sp)
    80001878:	00013403          	ld	s0,0(sp)
    8000187c:	00000513          	li	a0,0
    80001880:	01010113          	addi	sp,sp,16
    80001884:	00008067          	ret
    80001888:	00003517          	auipc	a0,0x3
    8000188c:	81850513          	addi	a0,a0,-2024 # 800040a0 <CONSOLE_STATUS+0x90>
    80001890:	00001097          	auipc	ra,0x1
    80001894:	8ec080e7          	jalr	-1812(ra) # 8000217c <panic>

0000000080001898 <trapinit>:
    80001898:	ff010113          	addi	sp,sp,-16
    8000189c:	00813423          	sd	s0,8(sp)
    800018a0:	01010413          	addi	s0,sp,16
    800018a4:	00813403          	ld	s0,8(sp)
    800018a8:	00003597          	auipc	a1,0x3
    800018ac:	82058593          	addi	a1,a1,-2016 # 800040c8 <CONSOLE_STATUS+0xb8>
    800018b0:	00004517          	auipc	a0,0x4
    800018b4:	bc050513          	addi	a0,a0,-1088 # 80005470 <tickslock>
    800018b8:	01010113          	addi	sp,sp,16
    800018bc:	00001317          	auipc	t1,0x1
    800018c0:	5cc30067          	jr	1484(t1) # 80002e88 <initlock>

00000000800018c4 <trapinithart>:
    800018c4:	ff010113          	addi	sp,sp,-16
    800018c8:	00813423          	sd	s0,8(sp)
    800018cc:	01010413          	addi	s0,sp,16
    800018d0:	00000797          	auipc	a5,0x0
    800018d4:	30078793          	addi	a5,a5,768 # 80001bd0 <kernelvec>
    800018d8:	10579073          	csrw	stvec,a5
    800018dc:	00813403          	ld	s0,8(sp)
    800018e0:	01010113          	addi	sp,sp,16
    800018e4:	00008067          	ret

00000000800018e8 <usertrap>:
    800018e8:	ff010113          	addi	sp,sp,-16
    800018ec:	00813423          	sd	s0,8(sp)
    800018f0:	01010413          	addi	s0,sp,16
    800018f4:	00813403          	ld	s0,8(sp)
    800018f8:	01010113          	addi	sp,sp,16
    800018fc:	00008067          	ret

0000000080001900 <usertrapret>:
    80001900:	ff010113          	addi	sp,sp,-16
    80001904:	00813423          	sd	s0,8(sp)
    80001908:	01010413          	addi	s0,sp,16
    8000190c:	00813403          	ld	s0,8(sp)
    80001910:	01010113          	addi	sp,sp,16
    80001914:	00008067          	ret

0000000080001918 <kerneltrap>:
    80001918:	fe010113          	addi	sp,sp,-32
    8000191c:	00813823          	sd	s0,16(sp)
    80001920:	00113c23          	sd	ra,24(sp)
    80001924:	00913423          	sd	s1,8(sp)
    80001928:	02010413          	addi	s0,sp,32
    8000192c:	142025f3          	csrr	a1,scause
    80001930:	100027f3          	csrr	a5,sstatus
    80001934:	0027f793          	andi	a5,a5,2
    80001938:	10079c63          	bnez	a5,80001a50 <kerneltrap+0x138>
    8000193c:	142027f3          	csrr	a5,scause
    80001940:	0207ce63          	bltz	a5,8000197c <kerneltrap+0x64>
    80001944:	00002517          	auipc	a0,0x2
    80001948:	7cc50513          	addi	a0,a0,1996 # 80004110 <CONSOLE_STATUS+0x100>
    8000194c:	00001097          	auipc	ra,0x1
    80001950:	88c080e7          	jalr	-1908(ra) # 800021d8 <__printf>
    80001954:	141025f3          	csrr	a1,sepc
    80001958:	14302673          	csrr	a2,stval
    8000195c:	00002517          	auipc	a0,0x2
    80001960:	7c450513          	addi	a0,a0,1988 # 80004120 <CONSOLE_STATUS+0x110>
    80001964:	00001097          	auipc	ra,0x1
    80001968:	874080e7          	jalr	-1932(ra) # 800021d8 <__printf>
    8000196c:	00002517          	auipc	a0,0x2
    80001970:	7cc50513          	addi	a0,a0,1996 # 80004138 <CONSOLE_STATUS+0x128>
    80001974:	00001097          	auipc	ra,0x1
    80001978:	808080e7          	jalr	-2040(ra) # 8000217c <panic>
    8000197c:	0ff7f713          	andi	a4,a5,255
    80001980:	00900693          	li	a3,9
    80001984:	04d70063          	beq	a4,a3,800019c4 <kerneltrap+0xac>
    80001988:	fff00713          	li	a4,-1
    8000198c:	03f71713          	slli	a4,a4,0x3f
    80001990:	00170713          	addi	a4,a4,1
    80001994:	fae798e3          	bne	a5,a4,80001944 <kerneltrap+0x2c>
    80001998:	00000097          	auipc	ra,0x0
    8000199c:	e00080e7          	jalr	-512(ra) # 80001798 <cpuid>
    800019a0:	06050663          	beqz	a0,80001a0c <kerneltrap+0xf4>
    800019a4:	144027f3          	csrr	a5,sip
    800019a8:	ffd7f793          	andi	a5,a5,-3
    800019ac:	14479073          	csrw	sip,a5
    800019b0:	01813083          	ld	ra,24(sp)
    800019b4:	01013403          	ld	s0,16(sp)
    800019b8:	00813483          	ld	s1,8(sp)
    800019bc:	02010113          	addi	sp,sp,32
    800019c0:	00008067          	ret
    800019c4:	00000097          	auipc	ra,0x0
    800019c8:	3d0080e7          	jalr	976(ra) # 80001d94 <plic_claim>
    800019cc:	00a00793          	li	a5,10
    800019d0:	00050493          	mv	s1,a0
    800019d4:	06f50863          	beq	a0,a5,80001a44 <kerneltrap+0x12c>
    800019d8:	fc050ce3          	beqz	a0,800019b0 <kerneltrap+0x98>
    800019dc:	00050593          	mv	a1,a0
    800019e0:	00002517          	auipc	a0,0x2
    800019e4:	71050513          	addi	a0,a0,1808 # 800040f0 <CONSOLE_STATUS+0xe0>
    800019e8:	00000097          	auipc	ra,0x0
    800019ec:	7f0080e7          	jalr	2032(ra) # 800021d8 <__printf>
    800019f0:	01013403          	ld	s0,16(sp)
    800019f4:	01813083          	ld	ra,24(sp)
    800019f8:	00048513          	mv	a0,s1
    800019fc:	00813483          	ld	s1,8(sp)
    80001a00:	02010113          	addi	sp,sp,32
    80001a04:	00000317          	auipc	t1,0x0
    80001a08:	3c830067          	jr	968(t1) # 80001dcc <plic_complete>
    80001a0c:	00004517          	auipc	a0,0x4
    80001a10:	a6450513          	addi	a0,a0,-1436 # 80005470 <tickslock>
    80001a14:	00001097          	auipc	ra,0x1
    80001a18:	498080e7          	jalr	1176(ra) # 80002eac <acquire>
    80001a1c:	00003717          	auipc	a4,0x3
    80001a20:	95870713          	addi	a4,a4,-1704 # 80004374 <ticks>
    80001a24:	00072783          	lw	a5,0(a4)
    80001a28:	00004517          	auipc	a0,0x4
    80001a2c:	a4850513          	addi	a0,a0,-1464 # 80005470 <tickslock>
    80001a30:	0017879b          	addiw	a5,a5,1
    80001a34:	00f72023          	sw	a5,0(a4)
    80001a38:	00001097          	auipc	ra,0x1
    80001a3c:	540080e7          	jalr	1344(ra) # 80002f78 <release>
    80001a40:	f65ff06f          	j	800019a4 <kerneltrap+0x8c>
    80001a44:	00001097          	auipc	ra,0x1
    80001a48:	09c080e7          	jalr	156(ra) # 80002ae0 <uartintr>
    80001a4c:	fa5ff06f          	j	800019f0 <kerneltrap+0xd8>
    80001a50:	00002517          	auipc	a0,0x2
    80001a54:	68050513          	addi	a0,a0,1664 # 800040d0 <CONSOLE_STATUS+0xc0>
    80001a58:	00000097          	auipc	ra,0x0
    80001a5c:	724080e7          	jalr	1828(ra) # 8000217c <panic>

0000000080001a60 <clockintr>:
    80001a60:	fe010113          	addi	sp,sp,-32
    80001a64:	00813823          	sd	s0,16(sp)
    80001a68:	00913423          	sd	s1,8(sp)
    80001a6c:	00113c23          	sd	ra,24(sp)
    80001a70:	02010413          	addi	s0,sp,32
    80001a74:	00004497          	auipc	s1,0x4
    80001a78:	9fc48493          	addi	s1,s1,-1540 # 80005470 <tickslock>
    80001a7c:	00048513          	mv	a0,s1
    80001a80:	00001097          	auipc	ra,0x1
    80001a84:	42c080e7          	jalr	1068(ra) # 80002eac <acquire>
    80001a88:	00003717          	auipc	a4,0x3
    80001a8c:	8ec70713          	addi	a4,a4,-1812 # 80004374 <ticks>
    80001a90:	00072783          	lw	a5,0(a4)
    80001a94:	01013403          	ld	s0,16(sp)
    80001a98:	01813083          	ld	ra,24(sp)
    80001a9c:	00048513          	mv	a0,s1
    80001aa0:	0017879b          	addiw	a5,a5,1
    80001aa4:	00813483          	ld	s1,8(sp)
    80001aa8:	00f72023          	sw	a5,0(a4)
    80001aac:	02010113          	addi	sp,sp,32
    80001ab0:	00001317          	auipc	t1,0x1
    80001ab4:	4c830067          	jr	1224(t1) # 80002f78 <release>

0000000080001ab8 <devintr>:
    80001ab8:	142027f3          	csrr	a5,scause
    80001abc:	00000513          	li	a0,0
    80001ac0:	0007c463          	bltz	a5,80001ac8 <devintr+0x10>
    80001ac4:	00008067          	ret
    80001ac8:	fe010113          	addi	sp,sp,-32
    80001acc:	00813823          	sd	s0,16(sp)
    80001ad0:	00113c23          	sd	ra,24(sp)
    80001ad4:	00913423          	sd	s1,8(sp)
    80001ad8:	02010413          	addi	s0,sp,32
    80001adc:	0ff7f713          	andi	a4,a5,255
    80001ae0:	00900693          	li	a3,9
    80001ae4:	04d70c63          	beq	a4,a3,80001b3c <devintr+0x84>
    80001ae8:	fff00713          	li	a4,-1
    80001aec:	03f71713          	slli	a4,a4,0x3f
    80001af0:	00170713          	addi	a4,a4,1
    80001af4:	00e78c63          	beq	a5,a4,80001b0c <devintr+0x54>
    80001af8:	01813083          	ld	ra,24(sp)
    80001afc:	01013403          	ld	s0,16(sp)
    80001b00:	00813483          	ld	s1,8(sp)
    80001b04:	02010113          	addi	sp,sp,32
    80001b08:	00008067          	ret
    80001b0c:	00000097          	auipc	ra,0x0
    80001b10:	c8c080e7          	jalr	-884(ra) # 80001798 <cpuid>
    80001b14:	06050663          	beqz	a0,80001b80 <devintr+0xc8>
    80001b18:	144027f3          	csrr	a5,sip
    80001b1c:	ffd7f793          	andi	a5,a5,-3
    80001b20:	14479073          	csrw	sip,a5
    80001b24:	01813083          	ld	ra,24(sp)
    80001b28:	01013403          	ld	s0,16(sp)
    80001b2c:	00813483          	ld	s1,8(sp)
    80001b30:	00200513          	li	a0,2
    80001b34:	02010113          	addi	sp,sp,32
    80001b38:	00008067          	ret
    80001b3c:	00000097          	auipc	ra,0x0
    80001b40:	258080e7          	jalr	600(ra) # 80001d94 <plic_claim>
    80001b44:	00a00793          	li	a5,10
    80001b48:	00050493          	mv	s1,a0
    80001b4c:	06f50663          	beq	a0,a5,80001bb8 <devintr+0x100>
    80001b50:	00100513          	li	a0,1
    80001b54:	fa0482e3          	beqz	s1,80001af8 <devintr+0x40>
    80001b58:	00048593          	mv	a1,s1
    80001b5c:	00002517          	auipc	a0,0x2
    80001b60:	59450513          	addi	a0,a0,1428 # 800040f0 <CONSOLE_STATUS+0xe0>
    80001b64:	00000097          	auipc	ra,0x0
    80001b68:	674080e7          	jalr	1652(ra) # 800021d8 <__printf>
    80001b6c:	00048513          	mv	a0,s1
    80001b70:	00000097          	auipc	ra,0x0
    80001b74:	25c080e7          	jalr	604(ra) # 80001dcc <plic_complete>
    80001b78:	00100513          	li	a0,1
    80001b7c:	f7dff06f          	j	80001af8 <devintr+0x40>
    80001b80:	00004517          	auipc	a0,0x4
    80001b84:	8f050513          	addi	a0,a0,-1808 # 80005470 <tickslock>
    80001b88:	00001097          	auipc	ra,0x1
    80001b8c:	324080e7          	jalr	804(ra) # 80002eac <acquire>
    80001b90:	00002717          	auipc	a4,0x2
    80001b94:	7e470713          	addi	a4,a4,2020 # 80004374 <ticks>
    80001b98:	00072783          	lw	a5,0(a4)
    80001b9c:	00004517          	auipc	a0,0x4
    80001ba0:	8d450513          	addi	a0,a0,-1836 # 80005470 <tickslock>
    80001ba4:	0017879b          	addiw	a5,a5,1
    80001ba8:	00f72023          	sw	a5,0(a4)
    80001bac:	00001097          	auipc	ra,0x1
    80001bb0:	3cc080e7          	jalr	972(ra) # 80002f78 <release>
    80001bb4:	f65ff06f          	j	80001b18 <devintr+0x60>
    80001bb8:	00001097          	auipc	ra,0x1
    80001bbc:	f28080e7          	jalr	-216(ra) # 80002ae0 <uartintr>
    80001bc0:	fadff06f          	j	80001b6c <devintr+0xb4>
	...

0000000080001bd0 <kernelvec>:
    80001bd0:	f0010113          	addi	sp,sp,-256
    80001bd4:	00113023          	sd	ra,0(sp)
    80001bd8:	00213423          	sd	sp,8(sp)
    80001bdc:	00313823          	sd	gp,16(sp)
    80001be0:	00413c23          	sd	tp,24(sp)
    80001be4:	02513023          	sd	t0,32(sp)
    80001be8:	02613423          	sd	t1,40(sp)
    80001bec:	02713823          	sd	t2,48(sp)
    80001bf0:	02813c23          	sd	s0,56(sp)
    80001bf4:	04913023          	sd	s1,64(sp)
    80001bf8:	04a13423          	sd	a0,72(sp)
    80001bfc:	04b13823          	sd	a1,80(sp)
    80001c00:	04c13c23          	sd	a2,88(sp)
    80001c04:	06d13023          	sd	a3,96(sp)
    80001c08:	06e13423          	sd	a4,104(sp)
    80001c0c:	06f13823          	sd	a5,112(sp)
    80001c10:	07013c23          	sd	a6,120(sp)
    80001c14:	09113023          	sd	a7,128(sp)
    80001c18:	09213423          	sd	s2,136(sp)
    80001c1c:	09313823          	sd	s3,144(sp)
    80001c20:	09413c23          	sd	s4,152(sp)
    80001c24:	0b513023          	sd	s5,160(sp)
    80001c28:	0b613423          	sd	s6,168(sp)
    80001c2c:	0b713823          	sd	s7,176(sp)
    80001c30:	0b813c23          	sd	s8,184(sp)
    80001c34:	0d913023          	sd	s9,192(sp)
    80001c38:	0da13423          	sd	s10,200(sp)
    80001c3c:	0db13823          	sd	s11,208(sp)
    80001c40:	0dc13c23          	sd	t3,216(sp)
    80001c44:	0fd13023          	sd	t4,224(sp)
    80001c48:	0fe13423          	sd	t5,232(sp)
    80001c4c:	0ff13823          	sd	t6,240(sp)
    80001c50:	cc9ff0ef          	jal	ra,80001918 <kerneltrap>
    80001c54:	00013083          	ld	ra,0(sp)
    80001c58:	00813103          	ld	sp,8(sp)
    80001c5c:	01013183          	ld	gp,16(sp)
    80001c60:	02013283          	ld	t0,32(sp)
    80001c64:	02813303          	ld	t1,40(sp)
    80001c68:	03013383          	ld	t2,48(sp)
    80001c6c:	03813403          	ld	s0,56(sp)
    80001c70:	04013483          	ld	s1,64(sp)
    80001c74:	04813503          	ld	a0,72(sp)
    80001c78:	05013583          	ld	a1,80(sp)
    80001c7c:	05813603          	ld	a2,88(sp)
    80001c80:	06013683          	ld	a3,96(sp)
    80001c84:	06813703          	ld	a4,104(sp)
    80001c88:	07013783          	ld	a5,112(sp)
    80001c8c:	07813803          	ld	a6,120(sp)
    80001c90:	08013883          	ld	a7,128(sp)
    80001c94:	08813903          	ld	s2,136(sp)
    80001c98:	09013983          	ld	s3,144(sp)
    80001c9c:	09813a03          	ld	s4,152(sp)
    80001ca0:	0a013a83          	ld	s5,160(sp)
    80001ca4:	0a813b03          	ld	s6,168(sp)
    80001ca8:	0b013b83          	ld	s7,176(sp)
    80001cac:	0b813c03          	ld	s8,184(sp)
    80001cb0:	0c013c83          	ld	s9,192(sp)
    80001cb4:	0c813d03          	ld	s10,200(sp)
    80001cb8:	0d013d83          	ld	s11,208(sp)
    80001cbc:	0d813e03          	ld	t3,216(sp)
    80001cc0:	0e013e83          	ld	t4,224(sp)
    80001cc4:	0e813f03          	ld	t5,232(sp)
    80001cc8:	0f013f83          	ld	t6,240(sp)
    80001ccc:	10010113          	addi	sp,sp,256
    80001cd0:	10200073          	sret
    80001cd4:	00000013          	nop
    80001cd8:	00000013          	nop
    80001cdc:	00000013          	nop

0000000080001ce0 <timervec>:
    80001ce0:	34051573          	csrrw	a0,mscratch,a0
    80001ce4:	00b53023          	sd	a1,0(a0)
    80001ce8:	00c53423          	sd	a2,8(a0)
    80001cec:	00d53823          	sd	a3,16(a0)
    80001cf0:	01853583          	ld	a1,24(a0)
    80001cf4:	02053603          	ld	a2,32(a0)
    80001cf8:	0005b683          	ld	a3,0(a1)
    80001cfc:	00c686b3          	add	a3,a3,a2
    80001d00:	00d5b023          	sd	a3,0(a1)
    80001d04:	00200593          	li	a1,2
    80001d08:	14459073          	csrw	sip,a1
    80001d0c:	01053683          	ld	a3,16(a0)
    80001d10:	00853603          	ld	a2,8(a0)
    80001d14:	00053583          	ld	a1,0(a0)
    80001d18:	34051573          	csrrw	a0,mscratch,a0
    80001d1c:	30200073          	mret

0000000080001d20 <plicinit>:
    80001d20:	ff010113          	addi	sp,sp,-16
    80001d24:	00813423          	sd	s0,8(sp)
    80001d28:	01010413          	addi	s0,sp,16
    80001d2c:	00813403          	ld	s0,8(sp)
    80001d30:	0c0007b7          	lui	a5,0xc000
    80001d34:	00100713          	li	a4,1
    80001d38:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80001d3c:	00e7a223          	sw	a4,4(a5)
    80001d40:	01010113          	addi	sp,sp,16
    80001d44:	00008067          	ret

0000000080001d48 <plicinithart>:
    80001d48:	ff010113          	addi	sp,sp,-16
    80001d4c:	00813023          	sd	s0,0(sp)
    80001d50:	00113423          	sd	ra,8(sp)
    80001d54:	01010413          	addi	s0,sp,16
    80001d58:	00000097          	auipc	ra,0x0
    80001d5c:	a40080e7          	jalr	-1472(ra) # 80001798 <cpuid>
    80001d60:	0085171b          	slliw	a4,a0,0x8
    80001d64:	0c0027b7          	lui	a5,0xc002
    80001d68:	00e787b3          	add	a5,a5,a4
    80001d6c:	40200713          	li	a4,1026
    80001d70:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80001d74:	00813083          	ld	ra,8(sp)
    80001d78:	00013403          	ld	s0,0(sp)
    80001d7c:	00d5151b          	slliw	a0,a0,0xd
    80001d80:	0c2017b7          	lui	a5,0xc201
    80001d84:	00a78533          	add	a0,a5,a0
    80001d88:	00052023          	sw	zero,0(a0)
    80001d8c:	01010113          	addi	sp,sp,16
    80001d90:	00008067          	ret

0000000080001d94 <plic_claim>:
    80001d94:	ff010113          	addi	sp,sp,-16
    80001d98:	00813023          	sd	s0,0(sp)
    80001d9c:	00113423          	sd	ra,8(sp)
    80001da0:	01010413          	addi	s0,sp,16
    80001da4:	00000097          	auipc	ra,0x0
    80001da8:	9f4080e7          	jalr	-1548(ra) # 80001798 <cpuid>
    80001dac:	00813083          	ld	ra,8(sp)
    80001db0:	00013403          	ld	s0,0(sp)
    80001db4:	00d5151b          	slliw	a0,a0,0xd
    80001db8:	0c2017b7          	lui	a5,0xc201
    80001dbc:	00a78533          	add	a0,a5,a0
    80001dc0:	00452503          	lw	a0,4(a0)
    80001dc4:	01010113          	addi	sp,sp,16
    80001dc8:	00008067          	ret

0000000080001dcc <plic_complete>:
    80001dcc:	fe010113          	addi	sp,sp,-32
    80001dd0:	00813823          	sd	s0,16(sp)
    80001dd4:	00913423          	sd	s1,8(sp)
    80001dd8:	00113c23          	sd	ra,24(sp)
    80001ddc:	02010413          	addi	s0,sp,32
    80001de0:	00050493          	mv	s1,a0
    80001de4:	00000097          	auipc	ra,0x0
    80001de8:	9b4080e7          	jalr	-1612(ra) # 80001798 <cpuid>
    80001dec:	01813083          	ld	ra,24(sp)
    80001df0:	01013403          	ld	s0,16(sp)
    80001df4:	00d5179b          	slliw	a5,a0,0xd
    80001df8:	0c201737          	lui	a4,0xc201
    80001dfc:	00f707b3          	add	a5,a4,a5
    80001e00:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80001e04:	00813483          	ld	s1,8(sp)
    80001e08:	02010113          	addi	sp,sp,32
    80001e0c:	00008067          	ret

0000000080001e10 <consolewrite>:
    80001e10:	fb010113          	addi	sp,sp,-80
    80001e14:	04813023          	sd	s0,64(sp)
    80001e18:	04113423          	sd	ra,72(sp)
    80001e1c:	02913c23          	sd	s1,56(sp)
    80001e20:	03213823          	sd	s2,48(sp)
    80001e24:	03313423          	sd	s3,40(sp)
    80001e28:	03413023          	sd	s4,32(sp)
    80001e2c:	01513c23          	sd	s5,24(sp)
    80001e30:	05010413          	addi	s0,sp,80
    80001e34:	06c05c63          	blez	a2,80001eac <consolewrite+0x9c>
    80001e38:	00060993          	mv	s3,a2
    80001e3c:	00050a13          	mv	s4,a0
    80001e40:	00058493          	mv	s1,a1
    80001e44:	00000913          	li	s2,0
    80001e48:	fff00a93          	li	s5,-1
    80001e4c:	01c0006f          	j	80001e68 <consolewrite+0x58>
    80001e50:	fbf44503          	lbu	a0,-65(s0)
    80001e54:	0019091b          	addiw	s2,s2,1
    80001e58:	00148493          	addi	s1,s1,1
    80001e5c:	00001097          	auipc	ra,0x1
    80001e60:	a9c080e7          	jalr	-1380(ra) # 800028f8 <uartputc>
    80001e64:	03298063          	beq	s3,s2,80001e84 <consolewrite+0x74>
    80001e68:	00048613          	mv	a2,s1
    80001e6c:	00100693          	li	a3,1
    80001e70:	000a0593          	mv	a1,s4
    80001e74:	fbf40513          	addi	a0,s0,-65
    80001e78:	00000097          	auipc	ra,0x0
    80001e7c:	9d8080e7          	jalr	-1576(ra) # 80001850 <either_copyin>
    80001e80:	fd5518e3          	bne	a0,s5,80001e50 <consolewrite+0x40>
    80001e84:	04813083          	ld	ra,72(sp)
    80001e88:	04013403          	ld	s0,64(sp)
    80001e8c:	03813483          	ld	s1,56(sp)
    80001e90:	02813983          	ld	s3,40(sp)
    80001e94:	02013a03          	ld	s4,32(sp)
    80001e98:	01813a83          	ld	s5,24(sp)
    80001e9c:	00090513          	mv	a0,s2
    80001ea0:	03013903          	ld	s2,48(sp)
    80001ea4:	05010113          	addi	sp,sp,80
    80001ea8:	00008067          	ret
    80001eac:	00000913          	li	s2,0
    80001eb0:	fd5ff06f          	j	80001e84 <consolewrite+0x74>

0000000080001eb4 <consoleread>:
    80001eb4:	f9010113          	addi	sp,sp,-112
    80001eb8:	06813023          	sd	s0,96(sp)
    80001ebc:	04913c23          	sd	s1,88(sp)
    80001ec0:	05213823          	sd	s2,80(sp)
    80001ec4:	05313423          	sd	s3,72(sp)
    80001ec8:	05413023          	sd	s4,64(sp)
    80001ecc:	03513c23          	sd	s5,56(sp)
    80001ed0:	03613823          	sd	s6,48(sp)
    80001ed4:	03713423          	sd	s7,40(sp)
    80001ed8:	03813023          	sd	s8,32(sp)
    80001edc:	06113423          	sd	ra,104(sp)
    80001ee0:	01913c23          	sd	s9,24(sp)
    80001ee4:	07010413          	addi	s0,sp,112
    80001ee8:	00060b93          	mv	s7,a2
    80001eec:	00050913          	mv	s2,a0
    80001ef0:	00058c13          	mv	s8,a1
    80001ef4:	00060b1b          	sext.w	s6,a2
    80001ef8:	00003497          	auipc	s1,0x3
    80001efc:	59048493          	addi	s1,s1,1424 # 80005488 <cons>
    80001f00:	00400993          	li	s3,4
    80001f04:	fff00a13          	li	s4,-1
    80001f08:	00a00a93          	li	s5,10
    80001f0c:	05705e63          	blez	s7,80001f68 <consoleread+0xb4>
    80001f10:	09c4a703          	lw	a4,156(s1)
    80001f14:	0984a783          	lw	a5,152(s1)
    80001f18:	0007071b          	sext.w	a4,a4
    80001f1c:	08e78463          	beq	a5,a4,80001fa4 <consoleread+0xf0>
    80001f20:	07f7f713          	andi	a4,a5,127
    80001f24:	00e48733          	add	a4,s1,a4
    80001f28:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80001f2c:	0017869b          	addiw	a3,a5,1
    80001f30:	08d4ac23          	sw	a3,152(s1)
    80001f34:	00070c9b          	sext.w	s9,a4
    80001f38:	0b370663          	beq	a4,s3,80001fe4 <consoleread+0x130>
    80001f3c:	00100693          	li	a3,1
    80001f40:	f9f40613          	addi	a2,s0,-97
    80001f44:	000c0593          	mv	a1,s8
    80001f48:	00090513          	mv	a0,s2
    80001f4c:	f8e40fa3          	sb	a4,-97(s0)
    80001f50:	00000097          	auipc	ra,0x0
    80001f54:	8b4080e7          	jalr	-1868(ra) # 80001804 <either_copyout>
    80001f58:	01450863          	beq	a0,s4,80001f68 <consoleread+0xb4>
    80001f5c:	001c0c13          	addi	s8,s8,1
    80001f60:	fffb8b9b          	addiw	s7,s7,-1
    80001f64:	fb5c94e3          	bne	s9,s5,80001f0c <consoleread+0x58>
    80001f68:	000b851b          	sext.w	a0,s7
    80001f6c:	06813083          	ld	ra,104(sp)
    80001f70:	06013403          	ld	s0,96(sp)
    80001f74:	05813483          	ld	s1,88(sp)
    80001f78:	05013903          	ld	s2,80(sp)
    80001f7c:	04813983          	ld	s3,72(sp)
    80001f80:	04013a03          	ld	s4,64(sp)
    80001f84:	03813a83          	ld	s5,56(sp)
    80001f88:	02813b83          	ld	s7,40(sp)
    80001f8c:	02013c03          	ld	s8,32(sp)
    80001f90:	01813c83          	ld	s9,24(sp)
    80001f94:	40ab053b          	subw	a0,s6,a0
    80001f98:	03013b03          	ld	s6,48(sp)
    80001f9c:	07010113          	addi	sp,sp,112
    80001fa0:	00008067          	ret
    80001fa4:	00001097          	auipc	ra,0x1
    80001fa8:	1d8080e7          	jalr	472(ra) # 8000317c <push_on>
    80001fac:	0984a703          	lw	a4,152(s1)
    80001fb0:	09c4a783          	lw	a5,156(s1)
    80001fb4:	0007879b          	sext.w	a5,a5
    80001fb8:	fef70ce3          	beq	a4,a5,80001fb0 <consoleread+0xfc>
    80001fbc:	00001097          	auipc	ra,0x1
    80001fc0:	234080e7          	jalr	564(ra) # 800031f0 <pop_on>
    80001fc4:	0984a783          	lw	a5,152(s1)
    80001fc8:	07f7f713          	andi	a4,a5,127
    80001fcc:	00e48733          	add	a4,s1,a4
    80001fd0:	01874703          	lbu	a4,24(a4)
    80001fd4:	0017869b          	addiw	a3,a5,1
    80001fd8:	08d4ac23          	sw	a3,152(s1)
    80001fdc:	00070c9b          	sext.w	s9,a4
    80001fe0:	f5371ee3          	bne	a4,s3,80001f3c <consoleread+0x88>
    80001fe4:	000b851b          	sext.w	a0,s7
    80001fe8:	f96bf2e3          	bgeu	s7,s6,80001f6c <consoleread+0xb8>
    80001fec:	08f4ac23          	sw	a5,152(s1)
    80001ff0:	f7dff06f          	j	80001f6c <consoleread+0xb8>

0000000080001ff4 <consputc>:
    80001ff4:	10000793          	li	a5,256
    80001ff8:	00f50663          	beq	a0,a5,80002004 <consputc+0x10>
    80001ffc:	00001317          	auipc	t1,0x1
    80002000:	9f430067          	jr	-1548(t1) # 800029f0 <uartputc_sync>
    80002004:	ff010113          	addi	sp,sp,-16
    80002008:	00113423          	sd	ra,8(sp)
    8000200c:	00813023          	sd	s0,0(sp)
    80002010:	01010413          	addi	s0,sp,16
    80002014:	00800513          	li	a0,8
    80002018:	00001097          	auipc	ra,0x1
    8000201c:	9d8080e7          	jalr	-1576(ra) # 800029f0 <uartputc_sync>
    80002020:	02000513          	li	a0,32
    80002024:	00001097          	auipc	ra,0x1
    80002028:	9cc080e7          	jalr	-1588(ra) # 800029f0 <uartputc_sync>
    8000202c:	00013403          	ld	s0,0(sp)
    80002030:	00813083          	ld	ra,8(sp)
    80002034:	00800513          	li	a0,8
    80002038:	01010113          	addi	sp,sp,16
    8000203c:	00001317          	auipc	t1,0x1
    80002040:	9b430067          	jr	-1612(t1) # 800029f0 <uartputc_sync>

0000000080002044 <consoleintr>:
    80002044:	fe010113          	addi	sp,sp,-32
    80002048:	00813823          	sd	s0,16(sp)
    8000204c:	00913423          	sd	s1,8(sp)
    80002050:	01213023          	sd	s2,0(sp)
    80002054:	00113c23          	sd	ra,24(sp)
    80002058:	02010413          	addi	s0,sp,32
    8000205c:	00003917          	auipc	s2,0x3
    80002060:	42c90913          	addi	s2,s2,1068 # 80005488 <cons>
    80002064:	00050493          	mv	s1,a0
    80002068:	00090513          	mv	a0,s2
    8000206c:	00001097          	auipc	ra,0x1
    80002070:	e40080e7          	jalr	-448(ra) # 80002eac <acquire>
    80002074:	02048c63          	beqz	s1,800020ac <consoleintr+0x68>
    80002078:	0a092783          	lw	a5,160(s2)
    8000207c:	09892703          	lw	a4,152(s2)
    80002080:	07f00693          	li	a3,127
    80002084:	40e7873b          	subw	a4,a5,a4
    80002088:	02e6e263          	bltu	a3,a4,800020ac <consoleintr+0x68>
    8000208c:	00d00713          	li	a4,13
    80002090:	04e48063          	beq	s1,a4,800020d0 <consoleintr+0x8c>
    80002094:	07f7f713          	andi	a4,a5,127
    80002098:	00e90733          	add	a4,s2,a4
    8000209c:	0017879b          	addiw	a5,a5,1
    800020a0:	0af92023          	sw	a5,160(s2)
    800020a4:	00970c23          	sb	s1,24(a4)
    800020a8:	08f92e23          	sw	a5,156(s2)
    800020ac:	01013403          	ld	s0,16(sp)
    800020b0:	01813083          	ld	ra,24(sp)
    800020b4:	00813483          	ld	s1,8(sp)
    800020b8:	00013903          	ld	s2,0(sp)
    800020bc:	00003517          	auipc	a0,0x3
    800020c0:	3cc50513          	addi	a0,a0,972 # 80005488 <cons>
    800020c4:	02010113          	addi	sp,sp,32
    800020c8:	00001317          	auipc	t1,0x1
    800020cc:	eb030067          	jr	-336(t1) # 80002f78 <release>
    800020d0:	00a00493          	li	s1,10
    800020d4:	fc1ff06f          	j	80002094 <consoleintr+0x50>

00000000800020d8 <consoleinit>:
    800020d8:	fe010113          	addi	sp,sp,-32
    800020dc:	00113c23          	sd	ra,24(sp)
    800020e0:	00813823          	sd	s0,16(sp)
    800020e4:	00913423          	sd	s1,8(sp)
    800020e8:	02010413          	addi	s0,sp,32
    800020ec:	00003497          	auipc	s1,0x3
    800020f0:	39c48493          	addi	s1,s1,924 # 80005488 <cons>
    800020f4:	00048513          	mv	a0,s1
    800020f8:	00002597          	auipc	a1,0x2
    800020fc:	05058593          	addi	a1,a1,80 # 80004148 <CONSOLE_STATUS+0x138>
    80002100:	00001097          	auipc	ra,0x1
    80002104:	d88080e7          	jalr	-632(ra) # 80002e88 <initlock>
    80002108:	00000097          	auipc	ra,0x0
    8000210c:	7ac080e7          	jalr	1964(ra) # 800028b4 <uartinit>
    80002110:	01813083          	ld	ra,24(sp)
    80002114:	01013403          	ld	s0,16(sp)
    80002118:	00000797          	auipc	a5,0x0
    8000211c:	d9c78793          	addi	a5,a5,-612 # 80001eb4 <consoleread>
    80002120:	0af4bc23          	sd	a5,184(s1)
    80002124:	00000797          	auipc	a5,0x0
    80002128:	cec78793          	addi	a5,a5,-788 # 80001e10 <consolewrite>
    8000212c:	0cf4b023          	sd	a5,192(s1)
    80002130:	00813483          	ld	s1,8(sp)
    80002134:	02010113          	addi	sp,sp,32
    80002138:	00008067          	ret

000000008000213c <console_read>:
    8000213c:	ff010113          	addi	sp,sp,-16
    80002140:	00813423          	sd	s0,8(sp)
    80002144:	01010413          	addi	s0,sp,16
    80002148:	00813403          	ld	s0,8(sp)
    8000214c:	00003317          	auipc	t1,0x3
    80002150:	3f433303          	ld	t1,1012(t1) # 80005540 <devsw+0x10>
    80002154:	01010113          	addi	sp,sp,16
    80002158:	00030067          	jr	t1

000000008000215c <console_write>:
    8000215c:	ff010113          	addi	sp,sp,-16
    80002160:	00813423          	sd	s0,8(sp)
    80002164:	01010413          	addi	s0,sp,16
    80002168:	00813403          	ld	s0,8(sp)
    8000216c:	00003317          	auipc	t1,0x3
    80002170:	3dc33303          	ld	t1,988(t1) # 80005548 <devsw+0x18>
    80002174:	01010113          	addi	sp,sp,16
    80002178:	00030067          	jr	t1

000000008000217c <panic>:
    8000217c:	fe010113          	addi	sp,sp,-32
    80002180:	00113c23          	sd	ra,24(sp)
    80002184:	00813823          	sd	s0,16(sp)
    80002188:	00913423          	sd	s1,8(sp)
    8000218c:	02010413          	addi	s0,sp,32
    80002190:	00050493          	mv	s1,a0
    80002194:	00002517          	auipc	a0,0x2
    80002198:	fbc50513          	addi	a0,a0,-68 # 80004150 <CONSOLE_STATUS+0x140>
    8000219c:	00003797          	auipc	a5,0x3
    800021a0:	4407a623          	sw	zero,1100(a5) # 800055e8 <pr+0x18>
    800021a4:	00000097          	auipc	ra,0x0
    800021a8:	034080e7          	jalr	52(ra) # 800021d8 <__printf>
    800021ac:	00048513          	mv	a0,s1
    800021b0:	00000097          	auipc	ra,0x0
    800021b4:	028080e7          	jalr	40(ra) # 800021d8 <__printf>
    800021b8:	00002517          	auipc	a0,0x2
    800021bc:	f7850513          	addi	a0,a0,-136 # 80004130 <CONSOLE_STATUS+0x120>
    800021c0:	00000097          	auipc	ra,0x0
    800021c4:	018080e7          	jalr	24(ra) # 800021d8 <__printf>
    800021c8:	00100793          	li	a5,1
    800021cc:	00002717          	auipc	a4,0x2
    800021d0:	1af72623          	sw	a5,428(a4) # 80004378 <panicked>
    800021d4:	0000006f          	j	800021d4 <panic+0x58>

00000000800021d8 <__printf>:
    800021d8:	f3010113          	addi	sp,sp,-208
    800021dc:	08813023          	sd	s0,128(sp)
    800021e0:	07313423          	sd	s3,104(sp)
    800021e4:	09010413          	addi	s0,sp,144
    800021e8:	05813023          	sd	s8,64(sp)
    800021ec:	08113423          	sd	ra,136(sp)
    800021f0:	06913c23          	sd	s1,120(sp)
    800021f4:	07213823          	sd	s2,112(sp)
    800021f8:	07413023          	sd	s4,96(sp)
    800021fc:	05513c23          	sd	s5,88(sp)
    80002200:	05613823          	sd	s6,80(sp)
    80002204:	05713423          	sd	s7,72(sp)
    80002208:	03913c23          	sd	s9,56(sp)
    8000220c:	03a13823          	sd	s10,48(sp)
    80002210:	03b13423          	sd	s11,40(sp)
    80002214:	00003317          	auipc	t1,0x3
    80002218:	3bc30313          	addi	t1,t1,956 # 800055d0 <pr>
    8000221c:	01832c03          	lw	s8,24(t1)
    80002220:	00b43423          	sd	a1,8(s0)
    80002224:	00c43823          	sd	a2,16(s0)
    80002228:	00d43c23          	sd	a3,24(s0)
    8000222c:	02e43023          	sd	a4,32(s0)
    80002230:	02f43423          	sd	a5,40(s0)
    80002234:	03043823          	sd	a6,48(s0)
    80002238:	03143c23          	sd	a7,56(s0)
    8000223c:	00050993          	mv	s3,a0
    80002240:	4a0c1663          	bnez	s8,800026ec <__printf+0x514>
    80002244:	60098c63          	beqz	s3,8000285c <__printf+0x684>
    80002248:	0009c503          	lbu	a0,0(s3)
    8000224c:	00840793          	addi	a5,s0,8
    80002250:	f6f43c23          	sd	a5,-136(s0)
    80002254:	00000493          	li	s1,0
    80002258:	22050063          	beqz	a0,80002478 <__printf+0x2a0>
    8000225c:	00002a37          	lui	s4,0x2
    80002260:	00018ab7          	lui	s5,0x18
    80002264:	000f4b37          	lui	s6,0xf4
    80002268:	00989bb7          	lui	s7,0x989
    8000226c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002270:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002274:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002278:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000227c:	00148c9b          	addiw	s9,s1,1
    80002280:	02500793          	li	a5,37
    80002284:	01998933          	add	s2,s3,s9
    80002288:	38f51263          	bne	a0,a5,8000260c <__printf+0x434>
    8000228c:	00094783          	lbu	a5,0(s2)
    80002290:	00078c9b          	sext.w	s9,a5
    80002294:	1e078263          	beqz	a5,80002478 <__printf+0x2a0>
    80002298:	0024849b          	addiw	s1,s1,2
    8000229c:	07000713          	li	a4,112
    800022a0:	00998933          	add	s2,s3,s1
    800022a4:	38e78a63          	beq	a5,a4,80002638 <__printf+0x460>
    800022a8:	20f76863          	bltu	a4,a5,800024b8 <__printf+0x2e0>
    800022ac:	42a78863          	beq	a5,a0,800026dc <__printf+0x504>
    800022b0:	06400713          	li	a4,100
    800022b4:	40e79663          	bne	a5,a4,800026c0 <__printf+0x4e8>
    800022b8:	f7843783          	ld	a5,-136(s0)
    800022bc:	0007a603          	lw	a2,0(a5)
    800022c0:	00878793          	addi	a5,a5,8
    800022c4:	f6f43c23          	sd	a5,-136(s0)
    800022c8:	42064a63          	bltz	a2,800026fc <__printf+0x524>
    800022cc:	00a00713          	li	a4,10
    800022d0:	02e677bb          	remuw	a5,a2,a4
    800022d4:	00002d97          	auipc	s11,0x2
    800022d8:	ea4d8d93          	addi	s11,s11,-348 # 80004178 <digits>
    800022dc:	00900593          	li	a1,9
    800022e0:	0006051b          	sext.w	a0,a2
    800022e4:	00000c93          	li	s9,0
    800022e8:	02079793          	slli	a5,a5,0x20
    800022ec:	0207d793          	srli	a5,a5,0x20
    800022f0:	00fd87b3          	add	a5,s11,a5
    800022f4:	0007c783          	lbu	a5,0(a5)
    800022f8:	02e656bb          	divuw	a3,a2,a4
    800022fc:	f8f40023          	sb	a5,-128(s0)
    80002300:	14c5d863          	bge	a1,a2,80002450 <__printf+0x278>
    80002304:	06300593          	li	a1,99
    80002308:	00100c93          	li	s9,1
    8000230c:	02e6f7bb          	remuw	a5,a3,a4
    80002310:	02079793          	slli	a5,a5,0x20
    80002314:	0207d793          	srli	a5,a5,0x20
    80002318:	00fd87b3          	add	a5,s11,a5
    8000231c:	0007c783          	lbu	a5,0(a5)
    80002320:	02e6d73b          	divuw	a4,a3,a4
    80002324:	f8f400a3          	sb	a5,-127(s0)
    80002328:	12a5f463          	bgeu	a1,a0,80002450 <__printf+0x278>
    8000232c:	00a00693          	li	a3,10
    80002330:	00900593          	li	a1,9
    80002334:	02d777bb          	remuw	a5,a4,a3
    80002338:	02079793          	slli	a5,a5,0x20
    8000233c:	0207d793          	srli	a5,a5,0x20
    80002340:	00fd87b3          	add	a5,s11,a5
    80002344:	0007c503          	lbu	a0,0(a5)
    80002348:	02d757bb          	divuw	a5,a4,a3
    8000234c:	f8a40123          	sb	a0,-126(s0)
    80002350:	48e5f263          	bgeu	a1,a4,800027d4 <__printf+0x5fc>
    80002354:	06300513          	li	a0,99
    80002358:	02d7f5bb          	remuw	a1,a5,a3
    8000235c:	02059593          	slli	a1,a1,0x20
    80002360:	0205d593          	srli	a1,a1,0x20
    80002364:	00bd85b3          	add	a1,s11,a1
    80002368:	0005c583          	lbu	a1,0(a1)
    8000236c:	02d7d7bb          	divuw	a5,a5,a3
    80002370:	f8b401a3          	sb	a1,-125(s0)
    80002374:	48e57263          	bgeu	a0,a4,800027f8 <__printf+0x620>
    80002378:	3e700513          	li	a0,999
    8000237c:	02d7f5bb          	remuw	a1,a5,a3
    80002380:	02059593          	slli	a1,a1,0x20
    80002384:	0205d593          	srli	a1,a1,0x20
    80002388:	00bd85b3          	add	a1,s11,a1
    8000238c:	0005c583          	lbu	a1,0(a1)
    80002390:	02d7d7bb          	divuw	a5,a5,a3
    80002394:	f8b40223          	sb	a1,-124(s0)
    80002398:	46e57663          	bgeu	a0,a4,80002804 <__printf+0x62c>
    8000239c:	02d7f5bb          	remuw	a1,a5,a3
    800023a0:	02059593          	slli	a1,a1,0x20
    800023a4:	0205d593          	srli	a1,a1,0x20
    800023a8:	00bd85b3          	add	a1,s11,a1
    800023ac:	0005c583          	lbu	a1,0(a1)
    800023b0:	02d7d7bb          	divuw	a5,a5,a3
    800023b4:	f8b402a3          	sb	a1,-123(s0)
    800023b8:	46ea7863          	bgeu	s4,a4,80002828 <__printf+0x650>
    800023bc:	02d7f5bb          	remuw	a1,a5,a3
    800023c0:	02059593          	slli	a1,a1,0x20
    800023c4:	0205d593          	srli	a1,a1,0x20
    800023c8:	00bd85b3          	add	a1,s11,a1
    800023cc:	0005c583          	lbu	a1,0(a1)
    800023d0:	02d7d7bb          	divuw	a5,a5,a3
    800023d4:	f8b40323          	sb	a1,-122(s0)
    800023d8:	3eeaf863          	bgeu	s5,a4,800027c8 <__printf+0x5f0>
    800023dc:	02d7f5bb          	remuw	a1,a5,a3
    800023e0:	02059593          	slli	a1,a1,0x20
    800023e4:	0205d593          	srli	a1,a1,0x20
    800023e8:	00bd85b3          	add	a1,s11,a1
    800023ec:	0005c583          	lbu	a1,0(a1)
    800023f0:	02d7d7bb          	divuw	a5,a5,a3
    800023f4:	f8b403a3          	sb	a1,-121(s0)
    800023f8:	42eb7e63          	bgeu	s6,a4,80002834 <__printf+0x65c>
    800023fc:	02d7f5bb          	remuw	a1,a5,a3
    80002400:	02059593          	slli	a1,a1,0x20
    80002404:	0205d593          	srli	a1,a1,0x20
    80002408:	00bd85b3          	add	a1,s11,a1
    8000240c:	0005c583          	lbu	a1,0(a1)
    80002410:	02d7d7bb          	divuw	a5,a5,a3
    80002414:	f8b40423          	sb	a1,-120(s0)
    80002418:	42ebfc63          	bgeu	s7,a4,80002850 <__printf+0x678>
    8000241c:	02079793          	slli	a5,a5,0x20
    80002420:	0207d793          	srli	a5,a5,0x20
    80002424:	00fd8db3          	add	s11,s11,a5
    80002428:	000dc703          	lbu	a4,0(s11)
    8000242c:	00a00793          	li	a5,10
    80002430:	00900c93          	li	s9,9
    80002434:	f8e404a3          	sb	a4,-119(s0)
    80002438:	00065c63          	bgez	a2,80002450 <__printf+0x278>
    8000243c:	f9040713          	addi	a4,s0,-112
    80002440:	00f70733          	add	a4,a4,a5
    80002444:	02d00693          	li	a3,45
    80002448:	fed70823          	sb	a3,-16(a4)
    8000244c:	00078c93          	mv	s9,a5
    80002450:	f8040793          	addi	a5,s0,-128
    80002454:	01978cb3          	add	s9,a5,s9
    80002458:	f7f40d13          	addi	s10,s0,-129
    8000245c:	000cc503          	lbu	a0,0(s9)
    80002460:	fffc8c93          	addi	s9,s9,-1
    80002464:	00000097          	auipc	ra,0x0
    80002468:	b90080e7          	jalr	-1136(ra) # 80001ff4 <consputc>
    8000246c:	ffac98e3          	bne	s9,s10,8000245c <__printf+0x284>
    80002470:	00094503          	lbu	a0,0(s2)
    80002474:	e00514e3          	bnez	a0,8000227c <__printf+0xa4>
    80002478:	1a0c1663          	bnez	s8,80002624 <__printf+0x44c>
    8000247c:	08813083          	ld	ra,136(sp)
    80002480:	08013403          	ld	s0,128(sp)
    80002484:	07813483          	ld	s1,120(sp)
    80002488:	07013903          	ld	s2,112(sp)
    8000248c:	06813983          	ld	s3,104(sp)
    80002490:	06013a03          	ld	s4,96(sp)
    80002494:	05813a83          	ld	s5,88(sp)
    80002498:	05013b03          	ld	s6,80(sp)
    8000249c:	04813b83          	ld	s7,72(sp)
    800024a0:	04013c03          	ld	s8,64(sp)
    800024a4:	03813c83          	ld	s9,56(sp)
    800024a8:	03013d03          	ld	s10,48(sp)
    800024ac:	02813d83          	ld	s11,40(sp)
    800024b0:	0d010113          	addi	sp,sp,208
    800024b4:	00008067          	ret
    800024b8:	07300713          	li	a4,115
    800024bc:	1ce78a63          	beq	a5,a4,80002690 <__printf+0x4b8>
    800024c0:	07800713          	li	a4,120
    800024c4:	1ee79e63          	bne	a5,a4,800026c0 <__printf+0x4e8>
    800024c8:	f7843783          	ld	a5,-136(s0)
    800024cc:	0007a703          	lw	a4,0(a5)
    800024d0:	00878793          	addi	a5,a5,8
    800024d4:	f6f43c23          	sd	a5,-136(s0)
    800024d8:	28074263          	bltz	a4,8000275c <__printf+0x584>
    800024dc:	00002d97          	auipc	s11,0x2
    800024e0:	c9cd8d93          	addi	s11,s11,-868 # 80004178 <digits>
    800024e4:	00f77793          	andi	a5,a4,15
    800024e8:	00fd87b3          	add	a5,s11,a5
    800024ec:	0007c683          	lbu	a3,0(a5)
    800024f0:	00f00613          	li	a2,15
    800024f4:	0007079b          	sext.w	a5,a4
    800024f8:	f8d40023          	sb	a3,-128(s0)
    800024fc:	0047559b          	srliw	a1,a4,0x4
    80002500:	0047569b          	srliw	a3,a4,0x4
    80002504:	00000c93          	li	s9,0
    80002508:	0ee65063          	bge	a2,a4,800025e8 <__printf+0x410>
    8000250c:	00f6f693          	andi	a3,a3,15
    80002510:	00dd86b3          	add	a3,s11,a3
    80002514:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002518:	0087d79b          	srliw	a5,a5,0x8
    8000251c:	00100c93          	li	s9,1
    80002520:	f8d400a3          	sb	a3,-127(s0)
    80002524:	0cb67263          	bgeu	a2,a1,800025e8 <__printf+0x410>
    80002528:	00f7f693          	andi	a3,a5,15
    8000252c:	00dd86b3          	add	a3,s11,a3
    80002530:	0006c583          	lbu	a1,0(a3)
    80002534:	00f00613          	li	a2,15
    80002538:	0047d69b          	srliw	a3,a5,0x4
    8000253c:	f8b40123          	sb	a1,-126(s0)
    80002540:	0047d593          	srli	a1,a5,0x4
    80002544:	28f67e63          	bgeu	a2,a5,800027e0 <__printf+0x608>
    80002548:	00f6f693          	andi	a3,a3,15
    8000254c:	00dd86b3          	add	a3,s11,a3
    80002550:	0006c503          	lbu	a0,0(a3)
    80002554:	0087d813          	srli	a6,a5,0x8
    80002558:	0087d69b          	srliw	a3,a5,0x8
    8000255c:	f8a401a3          	sb	a0,-125(s0)
    80002560:	28b67663          	bgeu	a2,a1,800027ec <__printf+0x614>
    80002564:	00f6f693          	andi	a3,a3,15
    80002568:	00dd86b3          	add	a3,s11,a3
    8000256c:	0006c583          	lbu	a1,0(a3)
    80002570:	00c7d513          	srli	a0,a5,0xc
    80002574:	00c7d69b          	srliw	a3,a5,0xc
    80002578:	f8b40223          	sb	a1,-124(s0)
    8000257c:	29067a63          	bgeu	a2,a6,80002810 <__printf+0x638>
    80002580:	00f6f693          	andi	a3,a3,15
    80002584:	00dd86b3          	add	a3,s11,a3
    80002588:	0006c583          	lbu	a1,0(a3)
    8000258c:	0107d813          	srli	a6,a5,0x10
    80002590:	0107d69b          	srliw	a3,a5,0x10
    80002594:	f8b402a3          	sb	a1,-123(s0)
    80002598:	28a67263          	bgeu	a2,a0,8000281c <__printf+0x644>
    8000259c:	00f6f693          	andi	a3,a3,15
    800025a0:	00dd86b3          	add	a3,s11,a3
    800025a4:	0006c683          	lbu	a3,0(a3)
    800025a8:	0147d79b          	srliw	a5,a5,0x14
    800025ac:	f8d40323          	sb	a3,-122(s0)
    800025b0:	21067663          	bgeu	a2,a6,800027bc <__printf+0x5e4>
    800025b4:	02079793          	slli	a5,a5,0x20
    800025b8:	0207d793          	srli	a5,a5,0x20
    800025bc:	00fd8db3          	add	s11,s11,a5
    800025c0:	000dc683          	lbu	a3,0(s11)
    800025c4:	00800793          	li	a5,8
    800025c8:	00700c93          	li	s9,7
    800025cc:	f8d403a3          	sb	a3,-121(s0)
    800025d0:	00075c63          	bgez	a4,800025e8 <__printf+0x410>
    800025d4:	f9040713          	addi	a4,s0,-112
    800025d8:	00f70733          	add	a4,a4,a5
    800025dc:	02d00693          	li	a3,45
    800025e0:	fed70823          	sb	a3,-16(a4)
    800025e4:	00078c93          	mv	s9,a5
    800025e8:	f8040793          	addi	a5,s0,-128
    800025ec:	01978cb3          	add	s9,a5,s9
    800025f0:	f7f40d13          	addi	s10,s0,-129
    800025f4:	000cc503          	lbu	a0,0(s9)
    800025f8:	fffc8c93          	addi	s9,s9,-1
    800025fc:	00000097          	auipc	ra,0x0
    80002600:	9f8080e7          	jalr	-1544(ra) # 80001ff4 <consputc>
    80002604:	ff9d18e3          	bne	s10,s9,800025f4 <__printf+0x41c>
    80002608:	0100006f          	j	80002618 <__printf+0x440>
    8000260c:	00000097          	auipc	ra,0x0
    80002610:	9e8080e7          	jalr	-1560(ra) # 80001ff4 <consputc>
    80002614:	000c8493          	mv	s1,s9
    80002618:	00094503          	lbu	a0,0(s2)
    8000261c:	c60510e3          	bnez	a0,8000227c <__printf+0xa4>
    80002620:	e40c0ee3          	beqz	s8,8000247c <__printf+0x2a4>
    80002624:	00003517          	auipc	a0,0x3
    80002628:	fac50513          	addi	a0,a0,-84 # 800055d0 <pr>
    8000262c:	00001097          	auipc	ra,0x1
    80002630:	94c080e7          	jalr	-1716(ra) # 80002f78 <release>
    80002634:	e49ff06f          	j	8000247c <__printf+0x2a4>
    80002638:	f7843783          	ld	a5,-136(s0)
    8000263c:	03000513          	li	a0,48
    80002640:	01000d13          	li	s10,16
    80002644:	00878713          	addi	a4,a5,8
    80002648:	0007bc83          	ld	s9,0(a5)
    8000264c:	f6e43c23          	sd	a4,-136(s0)
    80002650:	00000097          	auipc	ra,0x0
    80002654:	9a4080e7          	jalr	-1628(ra) # 80001ff4 <consputc>
    80002658:	07800513          	li	a0,120
    8000265c:	00000097          	auipc	ra,0x0
    80002660:	998080e7          	jalr	-1640(ra) # 80001ff4 <consputc>
    80002664:	00002d97          	auipc	s11,0x2
    80002668:	b14d8d93          	addi	s11,s11,-1260 # 80004178 <digits>
    8000266c:	03ccd793          	srli	a5,s9,0x3c
    80002670:	00fd87b3          	add	a5,s11,a5
    80002674:	0007c503          	lbu	a0,0(a5)
    80002678:	fffd0d1b          	addiw	s10,s10,-1
    8000267c:	004c9c93          	slli	s9,s9,0x4
    80002680:	00000097          	auipc	ra,0x0
    80002684:	974080e7          	jalr	-1676(ra) # 80001ff4 <consputc>
    80002688:	fe0d12e3          	bnez	s10,8000266c <__printf+0x494>
    8000268c:	f8dff06f          	j	80002618 <__printf+0x440>
    80002690:	f7843783          	ld	a5,-136(s0)
    80002694:	0007bc83          	ld	s9,0(a5)
    80002698:	00878793          	addi	a5,a5,8
    8000269c:	f6f43c23          	sd	a5,-136(s0)
    800026a0:	000c9a63          	bnez	s9,800026b4 <__printf+0x4dc>
    800026a4:	1080006f          	j	800027ac <__printf+0x5d4>
    800026a8:	001c8c93          	addi	s9,s9,1
    800026ac:	00000097          	auipc	ra,0x0
    800026b0:	948080e7          	jalr	-1720(ra) # 80001ff4 <consputc>
    800026b4:	000cc503          	lbu	a0,0(s9)
    800026b8:	fe0518e3          	bnez	a0,800026a8 <__printf+0x4d0>
    800026bc:	f5dff06f          	j	80002618 <__printf+0x440>
    800026c0:	02500513          	li	a0,37
    800026c4:	00000097          	auipc	ra,0x0
    800026c8:	930080e7          	jalr	-1744(ra) # 80001ff4 <consputc>
    800026cc:	000c8513          	mv	a0,s9
    800026d0:	00000097          	auipc	ra,0x0
    800026d4:	924080e7          	jalr	-1756(ra) # 80001ff4 <consputc>
    800026d8:	f41ff06f          	j	80002618 <__printf+0x440>
    800026dc:	02500513          	li	a0,37
    800026e0:	00000097          	auipc	ra,0x0
    800026e4:	914080e7          	jalr	-1772(ra) # 80001ff4 <consputc>
    800026e8:	f31ff06f          	j	80002618 <__printf+0x440>
    800026ec:	00030513          	mv	a0,t1
    800026f0:	00000097          	auipc	ra,0x0
    800026f4:	7bc080e7          	jalr	1980(ra) # 80002eac <acquire>
    800026f8:	b4dff06f          	j	80002244 <__printf+0x6c>
    800026fc:	40c0053b          	negw	a0,a2
    80002700:	00a00713          	li	a4,10
    80002704:	02e576bb          	remuw	a3,a0,a4
    80002708:	00002d97          	auipc	s11,0x2
    8000270c:	a70d8d93          	addi	s11,s11,-1424 # 80004178 <digits>
    80002710:	ff700593          	li	a1,-9
    80002714:	02069693          	slli	a3,a3,0x20
    80002718:	0206d693          	srli	a3,a3,0x20
    8000271c:	00dd86b3          	add	a3,s11,a3
    80002720:	0006c683          	lbu	a3,0(a3)
    80002724:	02e557bb          	divuw	a5,a0,a4
    80002728:	f8d40023          	sb	a3,-128(s0)
    8000272c:	10b65e63          	bge	a2,a1,80002848 <__printf+0x670>
    80002730:	06300593          	li	a1,99
    80002734:	02e7f6bb          	remuw	a3,a5,a4
    80002738:	02069693          	slli	a3,a3,0x20
    8000273c:	0206d693          	srli	a3,a3,0x20
    80002740:	00dd86b3          	add	a3,s11,a3
    80002744:	0006c683          	lbu	a3,0(a3)
    80002748:	02e7d73b          	divuw	a4,a5,a4
    8000274c:	00200793          	li	a5,2
    80002750:	f8d400a3          	sb	a3,-127(s0)
    80002754:	bca5ece3          	bltu	a1,a0,8000232c <__printf+0x154>
    80002758:	ce5ff06f          	j	8000243c <__printf+0x264>
    8000275c:	40e007bb          	negw	a5,a4
    80002760:	00002d97          	auipc	s11,0x2
    80002764:	a18d8d93          	addi	s11,s11,-1512 # 80004178 <digits>
    80002768:	00f7f693          	andi	a3,a5,15
    8000276c:	00dd86b3          	add	a3,s11,a3
    80002770:	0006c583          	lbu	a1,0(a3)
    80002774:	ff100613          	li	a2,-15
    80002778:	0047d69b          	srliw	a3,a5,0x4
    8000277c:	f8b40023          	sb	a1,-128(s0)
    80002780:	0047d59b          	srliw	a1,a5,0x4
    80002784:	0ac75e63          	bge	a4,a2,80002840 <__printf+0x668>
    80002788:	00f6f693          	andi	a3,a3,15
    8000278c:	00dd86b3          	add	a3,s11,a3
    80002790:	0006c603          	lbu	a2,0(a3)
    80002794:	00f00693          	li	a3,15
    80002798:	0087d79b          	srliw	a5,a5,0x8
    8000279c:	f8c400a3          	sb	a2,-127(s0)
    800027a0:	d8b6e4e3          	bltu	a3,a1,80002528 <__printf+0x350>
    800027a4:	00200793          	li	a5,2
    800027a8:	e2dff06f          	j	800025d4 <__printf+0x3fc>
    800027ac:	00002c97          	auipc	s9,0x2
    800027b0:	9acc8c93          	addi	s9,s9,-1620 # 80004158 <CONSOLE_STATUS+0x148>
    800027b4:	02800513          	li	a0,40
    800027b8:	ef1ff06f          	j	800026a8 <__printf+0x4d0>
    800027bc:	00700793          	li	a5,7
    800027c0:	00600c93          	li	s9,6
    800027c4:	e0dff06f          	j	800025d0 <__printf+0x3f8>
    800027c8:	00700793          	li	a5,7
    800027cc:	00600c93          	li	s9,6
    800027d0:	c69ff06f          	j	80002438 <__printf+0x260>
    800027d4:	00300793          	li	a5,3
    800027d8:	00200c93          	li	s9,2
    800027dc:	c5dff06f          	j	80002438 <__printf+0x260>
    800027e0:	00300793          	li	a5,3
    800027e4:	00200c93          	li	s9,2
    800027e8:	de9ff06f          	j	800025d0 <__printf+0x3f8>
    800027ec:	00400793          	li	a5,4
    800027f0:	00300c93          	li	s9,3
    800027f4:	dddff06f          	j	800025d0 <__printf+0x3f8>
    800027f8:	00400793          	li	a5,4
    800027fc:	00300c93          	li	s9,3
    80002800:	c39ff06f          	j	80002438 <__printf+0x260>
    80002804:	00500793          	li	a5,5
    80002808:	00400c93          	li	s9,4
    8000280c:	c2dff06f          	j	80002438 <__printf+0x260>
    80002810:	00500793          	li	a5,5
    80002814:	00400c93          	li	s9,4
    80002818:	db9ff06f          	j	800025d0 <__printf+0x3f8>
    8000281c:	00600793          	li	a5,6
    80002820:	00500c93          	li	s9,5
    80002824:	dadff06f          	j	800025d0 <__printf+0x3f8>
    80002828:	00600793          	li	a5,6
    8000282c:	00500c93          	li	s9,5
    80002830:	c09ff06f          	j	80002438 <__printf+0x260>
    80002834:	00800793          	li	a5,8
    80002838:	00700c93          	li	s9,7
    8000283c:	bfdff06f          	j	80002438 <__printf+0x260>
    80002840:	00100793          	li	a5,1
    80002844:	d91ff06f          	j	800025d4 <__printf+0x3fc>
    80002848:	00100793          	li	a5,1
    8000284c:	bf1ff06f          	j	8000243c <__printf+0x264>
    80002850:	00900793          	li	a5,9
    80002854:	00800c93          	li	s9,8
    80002858:	be1ff06f          	j	80002438 <__printf+0x260>
    8000285c:	00002517          	auipc	a0,0x2
    80002860:	90450513          	addi	a0,a0,-1788 # 80004160 <CONSOLE_STATUS+0x150>
    80002864:	00000097          	auipc	ra,0x0
    80002868:	918080e7          	jalr	-1768(ra) # 8000217c <panic>

000000008000286c <printfinit>:
    8000286c:	fe010113          	addi	sp,sp,-32
    80002870:	00813823          	sd	s0,16(sp)
    80002874:	00913423          	sd	s1,8(sp)
    80002878:	00113c23          	sd	ra,24(sp)
    8000287c:	02010413          	addi	s0,sp,32
    80002880:	00003497          	auipc	s1,0x3
    80002884:	d5048493          	addi	s1,s1,-688 # 800055d0 <pr>
    80002888:	00048513          	mv	a0,s1
    8000288c:	00002597          	auipc	a1,0x2
    80002890:	8e458593          	addi	a1,a1,-1820 # 80004170 <CONSOLE_STATUS+0x160>
    80002894:	00000097          	auipc	ra,0x0
    80002898:	5f4080e7          	jalr	1524(ra) # 80002e88 <initlock>
    8000289c:	01813083          	ld	ra,24(sp)
    800028a0:	01013403          	ld	s0,16(sp)
    800028a4:	0004ac23          	sw	zero,24(s1)
    800028a8:	00813483          	ld	s1,8(sp)
    800028ac:	02010113          	addi	sp,sp,32
    800028b0:	00008067          	ret

00000000800028b4 <uartinit>:
    800028b4:	ff010113          	addi	sp,sp,-16
    800028b8:	00813423          	sd	s0,8(sp)
    800028bc:	01010413          	addi	s0,sp,16
    800028c0:	100007b7          	lui	a5,0x10000
    800028c4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800028c8:	f8000713          	li	a4,-128
    800028cc:	00e781a3          	sb	a4,3(a5)
    800028d0:	00300713          	li	a4,3
    800028d4:	00e78023          	sb	a4,0(a5)
    800028d8:	000780a3          	sb	zero,1(a5)
    800028dc:	00e781a3          	sb	a4,3(a5)
    800028e0:	00700693          	li	a3,7
    800028e4:	00d78123          	sb	a3,2(a5)
    800028e8:	00e780a3          	sb	a4,1(a5)
    800028ec:	00813403          	ld	s0,8(sp)
    800028f0:	01010113          	addi	sp,sp,16
    800028f4:	00008067          	ret

00000000800028f8 <uartputc>:
    800028f8:	00002797          	auipc	a5,0x2
    800028fc:	a807a783          	lw	a5,-1408(a5) # 80004378 <panicked>
    80002900:	00078463          	beqz	a5,80002908 <uartputc+0x10>
    80002904:	0000006f          	j	80002904 <uartputc+0xc>
    80002908:	fd010113          	addi	sp,sp,-48
    8000290c:	02813023          	sd	s0,32(sp)
    80002910:	00913c23          	sd	s1,24(sp)
    80002914:	01213823          	sd	s2,16(sp)
    80002918:	01313423          	sd	s3,8(sp)
    8000291c:	02113423          	sd	ra,40(sp)
    80002920:	03010413          	addi	s0,sp,48
    80002924:	00002917          	auipc	s2,0x2
    80002928:	a5c90913          	addi	s2,s2,-1444 # 80004380 <uart_tx_r>
    8000292c:	00093783          	ld	a5,0(s2)
    80002930:	00002497          	auipc	s1,0x2
    80002934:	a5848493          	addi	s1,s1,-1448 # 80004388 <uart_tx_w>
    80002938:	0004b703          	ld	a4,0(s1)
    8000293c:	02078693          	addi	a3,a5,32
    80002940:	00050993          	mv	s3,a0
    80002944:	02e69c63          	bne	a3,a4,8000297c <uartputc+0x84>
    80002948:	00001097          	auipc	ra,0x1
    8000294c:	834080e7          	jalr	-1996(ra) # 8000317c <push_on>
    80002950:	00093783          	ld	a5,0(s2)
    80002954:	0004b703          	ld	a4,0(s1)
    80002958:	02078793          	addi	a5,a5,32
    8000295c:	00e79463          	bne	a5,a4,80002964 <uartputc+0x6c>
    80002960:	0000006f          	j	80002960 <uartputc+0x68>
    80002964:	00001097          	auipc	ra,0x1
    80002968:	88c080e7          	jalr	-1908(ra) # 800031f0 <pop_on>
    8000296c:	00093783          	ld	a5,0(s2)
    80002970:	0004b703          	ld	a4,0(s1)
    80002974:	02078693          	addi	a3,a5,32
    80002978:	fce688e3          	beq	a3,a4,80002948 <uartputc+0x50>
    8000297c:	01f77693          	andi	a3,a4,31
    80002980:	00003597          	auipc	a1,0x3
    80002984:	c7058593          	addi	a1,a1,-912 # 800055f0 <uart_tx_buf>
    80002988:	00d586b3          	add	a3,a1,a3
    8000298c:	00170713          	addi	a4,a4,1
    80002990:	01368023          	sb	s3,0(a3)
    80002994:	00e4b023          	sd	a4,0(s1)
    80002998:	10000637          	lui	a2,0x10000
    8000299c:	02f71063          	bne	a4,a5,800029bc <uartputc+0xc4>
    800029a0:	0340006f          	j	800029d4 <uartputc+0xdc>
    800029a4:	00074703          	lbu	a4,0(a4)
    800029a8:	00f93023          	sd	a5,0(s2)
    800029ac:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800029b0:	00093783          	ld	a5,0(s2)
    800029b4:	0004b703          	ld	a4,0(s1)
    800029b8:	00f70e63          	beq	a4,a5,800029d4 <uartputc+0xdc>
    800029bc:	00564683          	lbu	a3,5(a2)
    800029c0:	01f7f713          	andi	a4,a5,31
    800029c4:	00e58733          	add	a4,a1,a4
    800029c8:	0206f693          	andi	a3,a3,32
    800029cc:	00178793          	addi	a5,a5,1
    800029d0:	fc069ae3          	bnez	a3,800029a4 <uartputc+0xac>
    800029d4:	02813083          	ld	ra,40(sp)
    800029d8:	02013403          	ld	s0,32(sp)
    800029dc:	01813483          	ld	s1,24(sp)
    800029e0:	01013903          	ld	s2,16(sp)
    800029e4:	00813983          	ld	s3,8(sp)
    800029e8:	03010113          	addi	sp,sp,48
    800029ec:	00008067          	ret

00000000800029f0 <uartputc_sync>:
    800029f0:	ff010113          	addi	sp,sp,-16
    800029f4:	00813423          	sd	s0,8(sp)
    800029f8:	01010413          	addi	s0,sp,16
    800029fc:	00002717          	auipc	a4,0x2
    80002a00:	97c72703          	lw	a4,-1668(a4) # 80004378 <panicked>
    80002a04:	02071663          	bnez	a4,80002a30 <uartputc_sync+0x40>
    80002a08:	00050793          	mv	a5,a0
    80002a0c:	100006b7          	lui	a3,0x10000
    80002a10:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80002a14:	02077713          	andi	a4,a4,32
    80002a18:	fe070ce3          	beqz	a4,80002a10 <uartputc_sync+0x20>
    80002a1c:	0ff7f793          	andi	a5,a5,255
    80002a20:	00f68023          	sb	a5,0(a3)
    80002a24:	00813403          	ld	s0,8(sp)
    80002a28:	01010113          	addi	sp,sp,16
    80002a2c:	00008067          	ret
    80002a30:	0000006f          	j	80002a30 <uartputc_sync+0x40>

0000000080002a34 <uartstart>:
    80002a34:	ff010113          	addi	sp,sp,-16
    80002a38:	00813423          	sd	s0,8(sp)
    80002a3c:	01010413          	addi	s0,sp,16
    80002a40:	00002617          	auipc	a2,0x2
    80002a44:	94060613          	addi	a2,a2,-1728 # 80004380 <uart_tx_r>
    80002a48:	00002517          	auipc	a0,0x2
    80002a4c:	94050513          	addi	a0,a0,-1728 # 80004388 <uart_tx_w>
    80002a50:	00063783          	ld	a5,0(a2)
    80002a54:	00053703          	ld	a4,0(a0)
    80002a58:	04f70263          	beq	a4,a5,80002a9c <uartstart+0x68>
    80002a5c:	100005b7          	lui	a1,0x10000
    80002a60:	00003817          	auipc	a6,0x3
    80002a64:	b9080813          	addi	a6,a6,-1136 # 800055f0 <uart_tx_buf>
    80002a68:	01c0006f          	j	80002a84 <uartstart+0x50>
    80002a6c:	0006c703          	lbu	a4,0(a3)
    80002a70:	00f63023          	sd	a5,0(a2)
    80002a74:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002a78:	00063783          	ld	a5,0(a2)
    80002a7c:	00053703          	ld	a4,0(a0)
    80002a80:	00f70e63          	beq	a4,a5,80002a9c <uartstart+0x68>
    80002a84:	01f7f713          	andi	a4,a5,31
    80002a88:	00e806b3          	add	a3,a6,a4
    80002a8c:	0055c703          	lbu	a4,5(a1)
    80002a90:	00178793          	addi	a5,a5,1
    80002a94:	02077713          	andi	a4,a4,32
    80002a98:	fc071ae3          	bnez	a4,80002a6c <uartstart+0x38>
    80002a9c:	00813403          	ld	s0,8(sp)
    80002aa0:	01010113          	addi	sp,sp,16
    80002aa4:	00008067          	ret

0000000080002aa8 <uartgetc>:
    80002aa8:	ff010113          	addi	sp,sp,-16
    80002aac:	00813423          	sd	s0,8(sp)
    80002ab0:	01010413          	addi	s0,sp,16
    80002ab4:	10000737          	lui	a4,0x10000
    80002ab8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80002abc:	0017f793          	andi	a5,a5,1
    80002ac0:	00078c63          	beqz	a5,80002ad8 <uartgetc+0x30>
    80002ac4:	00074503          	lbu	a0,0(a4)
    80002ac8:	0ff57513          	andi	a0,a0,255
    80002acc:	00813403          	ld	s0,8(sp)
    80002ad0:	01010113          	addi	sp,sp,16
    80002ad4:	00008067          	ret
    80002ad8:	fff00513          	li	a0,-1
    80002adc:	ff1ff06f          	j	80002acc <uartgetc+0x24>

0000000080002ae0 <uartintr>:
    80002ae0:	100007b7          	lui	a5,0x10000
    80002ae4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80002ae8:	0017f793          	andi	a5,a5,1
    80002aec:	0a078463          	beqz	a5,80002b94 <uartintr+0xb4>
    80002af0:	fe010113          	addi	sp,sp,-32
    80002af4:	00813823          	sd	s0,16(sp)
    80002af8:	00913423          	sd	s1,8(sp)
    80002afc:	00113c23          	sd	ra,24(sp)
    80002b00:	02010413          	addi	s0,sp,32
    80002b04:	100004b7          	lui	s1,0x10000
    80002b08:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80002b0c:	0ff57513          	andi	a0,a0,255
    80002b10:	fffff097          	auipc	ra,0xfffff
    80002b14:	534080e7          	jalr	1332(ra) # 80002044 <consoleintr>
    80002b18:	0054c783          	lbu	a5,5(s1)
    80002b1c:	0017f793          	andi	a5,a5,1
    80002b20:	fe0794e3          	bnez	a5,80002b08 <uartintr+0x28>
    80002b24:	00002617          	auipc	a2,0x2
    80002b28:	85c60613          	addi	a2,a2,-1956 # 80004380 <uart_tx_r>
    80002b2c:	00002517          	auipc	a0,0x2
    80002b30:	85c50513          	addi	a0,a0,-1956 # 80004388 <uart_tx_w>
    80002b34:	00063783          	ld	a5,0(a2)
    80002b38:	00053703          	ld	a4,0(a0)
    80002b3c:	04f70263          	beq	a4,a5,80002b80 <uartintr+0xa0>
    80002b40:	100005b7          	lui	a1,0x10000
    80002b44:	00003817          	auipc	a6,0x3
    80002b48:	aac80813          	addi	a6,a6,-1364 # 800055f0 <uart_tx_buf>
    80002b4c:	01c0006f          	j	80002b68 <uartintr+0x88>
    80002b50:	0006c703          	lbu	a4,0(a3)
    80002b54:	00f63023          	sd	a5,0(a2)
    80002b58:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002b5c:	00063783          	ld	a5,0(a2)
    80002b60:	00053703          	ld	a4,0(a0)
    80002b64:	00f70e63          	beq	a4,a5,80002b80 <uartintr+0xa0>
    80002b68:	01f7f713          	andi	a4,a5,31
    80002b6c:	00e806b3          	add	a3,a6,a4
    80002b70:	0055c703          	lbu	a4,5(a1)
    80002b74:	00178793          	addi	a5,a5,1
    80002b78:	02077713          	andi	a4,a4,32
    80002b7c:	fc071ae3          	bnez	a4,80002b50 <uartintr+0x70>
    80002b80:	01813083          	ld	ra,24(sp)
    80002b84:	01013403          	ld	s0,16(sp)
    80002b88:	00813483          	ld	s1,8(sp)
    80002b8c:	02010113          	addi	sp,sp,32
    80002b90:	00008067          	ret
    80002b94:	00001617          	auipc	a2,0x1
    80002b98:	7ec60613          	addi	a2,a2,2028 # 80004380 <uart_tx_r>
    80002b9c:	00001517          	auipc	a0,0x1
    80002ba0:	7ec50513          	addi	a0,a0,2028 # 80004388 <uart_tx_w>
    80002ba4:	00063783          	ld	a5,0(a2)
    80002ba8:	00053703          	ld	a4,0(a0)
    80002bac:	04f70263          	beq	a4,a5,80002bf0 <uartintr+0x110>
    80002bb0:	100005b7          	lui	a1,0x10000
    80002bb4:	00003817          	auipc	a6,0x3
    80002bb8:	a3c80813          	addi	a6,a6,-1476 # 800055f0 <uart_tx_buf>
    80002bbc:	01c0006f          	j	80002bd8 <uartintr+0xf8>
    80002bc0:	0006c703          	lbu	a4,0(a3)
    80002bc4:	00f63023          	sd	a5,0(a2)
    80002bc8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002bcc:	00063783          	ld	a5,0(a2)
    80002bd0:	00053703          	ld	a4,0(a0)
    80002bd4:	02f70063          	beq	a4,a5,80002bf4 <uartintr+0x114>
    80002bd8:	01f7f713          	andi	a4,a5,31
    80002bdc:	00e806b3          	add	a3,a6,a4
    80002be0:	0055c703          	lbu	a4,5(a1)
    80002be4:	00178793          	addi	a5,a5,1
    80002be8:	02077713          	andi	a4,a4,32
    80002bec:	fc071ae3          	bnez	a4,80002bc0 <uartintr+0xe0>
    80002bf0:	00008067          	ret
    80002bf4:	00008067          	ret

0000000080002bf8 <kinit>:
    80002bf8:	fc010113          	addi	sp,sp,-64
    80002bfc:	02913423          	sd	s1,40(sp)
    80002c00:	fffff7b7          	lui	a5,0xfffff
    80002c04:	00004497          	auipc	s1,0x4
    80002c08:	a0b48493          	addi	s1,s1,-1525 # 8000660f <end+0xfff>
    80002c0c:	02813823          	sd	s0,48(sp)
    80002c10:	01313c23          	sd	s3,24(sp)
    80002c14:	00f4f4b3          	and	s1,s1,a5
    80002c18:	02113c23          	sd	ra,56(sp)
    80002c1c:	03213023          	sd	s2,32(sp)
    80002c20:	01413823          	sd	s4,16(sp)
    80002c24:	01513423          	sd	s5,8(sp)
    80002c28:	04010413          	addi	s0,sp,64
    80002c2c:	000017b7          	lui	a5,0x1
    80002c30:	01100993          	li	s3,17
    80002c34:	00f487b3          	add	a5,s1,a5
    80002c38:	01b99993          	slli	s3,s3,0x1b
    80002c3c:	06f9e063          	bltu	s3,a5,80002c9c <kinit+0xa4>
    80002c40:	00003a97          	auipc	s5,0x3
    80002c44:	9d0a8a93          	addi	s5,s5,-1584 # 80005610 <end>
    80002c48:	0754ec63          	bltu	s1,s5,80002cc0 <kinit+0xc8>
    80002c4c:	0734fa63          	bgeu	s1,s3,80002cc0 <kinit+0xc8>
    80002c50:	00088a37          	lui	s4,0x88
    80002c54:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80002c58:	00001917          	auipc	s2,0x1
    80002c5c:	73890913          	addi	s2,s2,1848 # 80004390 <kmem>
    80002c60:	00ca1a13          	slli	s4,s4,0xc
    80002c64:	0140006f          	j	80002c78 <kinit+0x80>
    80002c68:	000017b7          	lui	a5,0x1
    80002c6c:	00f484b3          	add	s1,s1,a5
    80002c70:	0554e863          	bltu	s1,s5,80002cc0 <kinit+0xc8>
    80002c74:	0534f663          	bgeu	s1,s3,80002cc0 <kinit+0xc8>
    80002c78:	00001637          	lui	a2,0x1
    80002c7c:	00100593          	li	a1,1
    80002c80:	00048513          	mv	a0,s1
    80002c84:	00000097          	auipc	ra,0x0
    80002c88:	5e4080e7          	jalr	1508(ra) # 80003268 <__memset>
    80002c8c:	00093783          	ld	a5,0(s2)
    80002c90:	00f4b023          	sd	a5,0(s1)
    80002c94:	00993023          	sd	s1,0(s2)
    80002c98:	fd4498e3          	bne	s1,s4,80002c68 <kinit+0x70>
    80002c9c:	03813083          	ld	ra,56(sp)
    80002ca0:	03013403          	ld	s0,48(sp)
    80002ca4:	02813483          	ld	s1,40(sp)
    80002ca8:	02013903          	ld	s2,32(sp)
    80002cac:	01813983          	ld	s3,24(sp)
    80002cb0:	01013a03          	ld	s4,16(sp)
    80002cb4:	00813a83          	ld	s5,8(sp)
    80002cb8:	04010113          	addi	sp,sp,64
    80002cbc:	00008067          	ret
    80002cc0:	00001517          	auipc	a0,0x1
    80002cc4:	4d050513          	addi	a0,a0,1232 # 80004190 <digits+0x18>
    80002cc8:	fffff097          	auipc	ra,0xfffff
    80002ccc:	4b4080e7          	jalr	1204(ra) # 8000217c <panic>

0000000080002cd0 <freerange>:
    80002cd0:	fc010113          	addi	sp,sp,-64
    80002cd4:	000017b7          	lui	a5,0x1
    80002cd8:	02913423          	sd	s1,40(sp)
    80002cdc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80002ce0:	009504b3          	add	s1,a0,s1
    80002ce4:	fffff537          	lui	a0,0xfffff
    80002ce8:	02813823          	sd	s0,48(sp)
    80002cec:	02113c23          	sd	ra,56(sp)
    80002cf0:	03213023          	sd	s2,32(sp)
    80002cf4:	01313c23          	sd	s3,24(sp)
    80002cf8:	01413823          	sd	s4,16(sp)
    80002cfc:	01513423          	sd	s5,8(sp)
    80002d00:	01613023          	sd	s6,0(sp)
    80002d04:	04010413          	addi	s0,sp,64
    80002d08:	00a4f4b3          	and	s1,s1,a0
    80002d0c:	00f487b3          	add	a5,s1,a5
    80002d10:	06f5e463          	bltu	a1,a5,80002d78 <freerange+0xa8>
    80002d14:	00003a97          	auipc	s5,0x3
    80002d18:	8fca8a93          	addi	s5,s5,-1796 # 80005610 <end>
    80002d1c:	0954e263          	bltu	s1,s5,80002da0 <freerange+0xd0>
    80002d20:	01100993          	li	s3,17
    80002d24:	01b99993          	slli	s3,s3,0x1b
    80002d28:	0734fc63          	bgeu	s1,s3,80002da0 <freerange+0xd0>
    80002d2c:	00058a13          	mv	s4,a1
    80002d30:	00001917          	auipc	s2,0x1
    80002d34:	66090913          	addi	s2,s2,1632 # 80004390 <kmem>
    80002d38:	00002b37          	lui	s6,0x2
    80002d3c:	0140006f          	j	80002d50 <freerange+0x80>
    80002d40:	000017b7          	lui	a5,0x1
    80002d44:	00f484b3          	add	s1,s1,a5
    80002d48:	0554ec63          	bltu	s1,s5,80002da0 <freerange+0xd0>
    80002d4c:	0534fa63          	bgeu	s1,s3,80002da0 <freerange+0xd0>
    80002d50:	00001637          	lui	a2,0x1
    80002d54:	00100593          	li	a1,1
    80002d58:	00048513          	mv	a0,s1
    80002d5c:	00000097          	auipc	ra,0x0
    80002d60:	50c080e7          	jalr	1292(ra) # 80003268 <__memset>
    80002d64:	00093703          	ld	a4,0(s2)
    80002d68:	016487b3          	add	a5,s1,s6
    80002d6c:	00e4b023          	sd	a4,0(s1)
    80002d70:	00993023          	sd	s1,0(s2)
    80002d74:	fcfa76e3          	bgeu	s4,a5,80002d40 <freerange+0x70>
    80002d78:	03813083          	ld	ra,56(sp)
    80002d7c:	03013403          	ld	s0,48(sp)
    80002d80:	02813483          	ld	s1,40(sp)
    80002d84:	02013903          	ld	s2,32(sp)
    80002d88:	01813983          	ld	s3,24(sp)
    80002d8c:	01013a03          	ld	s4,16(sp)
    80002d90:	00813a83          	ld	s5,8(sp)
    80002d94:	00013b03          	ld	s6,0(sp)
    80002d98:	04010113          	addi	sp,sp,64
    80002d9c:	00008067          	ret
    80002da0:	00001517          	auipc	a0,0x1
    80002da4:	3f050513          	addi	a0,a0,1008 # 80004190 <digits+0x18>
    80002da8:	fffff097          	auipc	ra,0xfffff
    80002dac:	3d4080e7          	jalr	980(ra) # 8000217c <panic>

0000000080002db0 <kfree>:
    80002db0:	fe010113          	addi	sp,sp,-32
    80002db4:	00813823          	sd	s0,16(sp)
    80002db8:	00113c23          	sd	ra,24(sp)
    80002dbc:	00913423          	sd	s1,8(sp)
    80002dc0:	02010413          	addi	s0,sp,32
    80002dc4:	03451793          	slli	a5,a0,0x34
    80002dc8:	04079c63          	bnez	a5,80002e20 <kfree+0x70>
    80002dcc:	00003797          	auipc	a5,0x3
    80002dd0:	84478793          	addi	a5,a5,-1980 # 80005610 <end>
    80002dd4:	00050493          	mv	s1,a0
    80002dd8:	04f56463          	bltu	a0,a5,80002e20 <kfree+0x70>
    80002ddc:	01100793          	li	a5,17
    80002de0:	01b79793          	slli	a5,a5,0x1b
    80002de4:	02f57e63          	bgeu	a0,a5,80002e20 <kfree+0x70>
    80002de8:	00001637          	lui	a2,0x1
    80002dec:	00100593          	li	a1,1
    80002df0:	00000097          	auipc	ra,0x0
    80002df4:	478080e7          	jalr	1144(ra) # 80003268 <__memset>
    80002df8:	00001797          	auipc	a5,0x1
    80002dfc:	59878793          	addi	a5,a5,1432 # 80004390 <kmem>
    80002e00:	0007b703          	ld	a4,0(a5)
    80002e04:	01813083          	ld	ra,24(sp)
    80002e08:	01013403          	ld	s0,16(sp)
    80002e0c:	00e4b023          	sd	a4,0(s1)
    80002e10:	0097b023          	sd	s1,0(a5)
    80002e14:	00813483          	ld	s1,8(sp)
    80002e18:	02010113          	addi	sp,sp,32
    80002e1c:	00008067          	ret
    80002e20:	00001517          	auipc	a0,0x1
    80002e24:	37050513          	addi	a0,a0,880 # 80004190 <digits+0x18>
    80002e28:	fffff097          	auipc	ra,0xfffff
    80002e2c:	354080e7          	jalr	852(ra) # 8000217c <panic>

0000000080002e30 <kalloc>:
    80002e30:	fe010113          	addi	sp,sp,-32
    80002e34:	00813823          	sd	s0,16(sp)
    80002e38:	00913423          	sd	s1,8(sp)
    80002e3c:	00113c23          	sd	ra,24(sp)
    80002e40:	02010413          	addi	s0,sp,32
    80002e44:	00001797          	auipc	a5,0x1
    80002e48:	54c78793          	addi	a5,a5,1356 # 80004390 <kmem>
    80002e4c:	0007b483          	ld	s1,0(a5)
    80002e50:	02048063          	beqz	s1,80002e70 <kalloc+0x40>
    80002e54:	0004b703          	ld	a4,0(s1)
    80002e58:	00001637          	lui	a2,0x1
    80002e5c:	00500593          	li	a1,5
    80002e60:	00048513          	mv	a0,s1
    80002e64:	00e7b023          	sd	a4,0(a5)
    80002e68:	00000097          	auipc	ra,0x0
    80002e6c:	400080e7          	jalr	1024(ra) # 80003268 <__memset>
    80002e70:	01813083          	ld	ra,24(sp)
    80002e74:	01013403          	ld	s0,16(sp)
    80002e78:	00048513          	mv	a0,s1
    80002e7c:	00813483          	ld	s1,8(sp)
    80002e80:	02010113          	addi	sp,sp,32
    80002e84:	00008067          	ret

0000000080002e88 <initlock>:
    80002e88:	ff010113          	addi	sp,sp,-16
    80002e8c:	00813423          	sd	s0,8(sp)
    80002e90:	01010413          	addi	s0,sp,16
    80002e94:	00813403          	ld	s0,8(sp)
    80002e98:	00b53423          	sd	a1,8(a0)
    80002e9c:	00052023          	sw	zero,0(a0)
    80002ea0:	00053823          	sd	zero,16(a0)
    80002ea4:	01010113          	addi	sp,sp,16
    80002ea8:	00008067          	ret

0000000080002eac <acquire>:
    80002eac:	fe010113          	addi	sp,sp,-32
    80002eb0:	00813823          	sd	s0,16(sp)
    80002eb4:	00913423          	sd	s1,8(sp)
    80002eb8:	00113c23          	sd	ra,24(sp)
    80002ebc:	01213023          	sd	s2,0(sp)
    80002ec0:	02010413          	addi	s0,sp,32
    80002ec4:	00050493          	mv	s1,a0
    80002ec8:	10002973          	csrr	s2,sstatus
    80002ecc:	100027f3          	csrr	a5,sstatus
    80002ed0:	ffd7f793          	andi	a5,a5,-3
    80002ed4:	10079073          	csrw	sstatus,a5
    80002ed8:	fffff097          	auipc	ra,0xfffff
    80002edc:	8e0080e7          	jalr	-1824(ra) # 800017b8 <mycpu>
    80002ee0:	07852783          	lw	a5,120(a0)
    80002ee4:	06078e63          	beqz	a5,80002f60 <acquire+0xb4>
    80002ee8:	fffff097          	auipc	ra,0xfffff
    80002eec:	8d0080e7          	jalr	-1840(ra) # 800017b8 <mycpu>
    80002ef0:	07852783          	lw	a5,120(a0)
    80002ef4:	0004a703          	lw	a4,0(s1)
    80002ef8:	0017879b          	addiw	a5,a5,1
    80002efc:	06f52c23          	sw	a5,120(a0)
    80002f00:	04071063          	bnez	a4,80002f40 <acquire+0x94>
    80002f04:	00100713          	li	a4,1
    80002f08:	00070793          	mv	a5,a4
    80002f0c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80002f10:	0007879b          	sext.w	a5,a5
    80002f14:	fe079ae3          	bnez	a5,80002f08 <acquire+0x5c>
    80002f18:	0ff0000f          	fence
    80002f1c:	fffff097          	auipc	ra,0xfffff
    80002f20:	89c080e7          	jalr	-1892(ra) # 800017b8 <mycpu>
    80002f24:	01813083          	ld	ra,24(sp)
    80002f28:	01013403          	ld	s0,16(sp)
    80002f2c:	00a4b823          	sd	a0,16(s1)
    80002f30:	00013903          	ld	s2,0(sp)
    80002f34:	00813483          	ld	s1,8(sp)
    80002f38:	02010113          	addi	sp,sp,32
    80002f3c:	00008067          	ret
    80002f40:	0104b903          	ld	s2,16(s1)
    80002f44:	fffff097          	auipc	ra,0xfffff
    80002f48:	874080e7          	jalr	-1932(ra) # 800017b8 <mycpu>
    80002f4c:	faa91ce3          	bne	s2,a0,80002f04 <acquire+0x58>
    80002f50:	00001517          	auipc	a0,0x1
    80002f54:	24850513          	addi	a0,a0,584 # 80004198 <digits+0x20>
    80002f58:	fffff097          	auipc	ra,0xfffff
    80002f5c:	224080e7          	jalr	548(ra) # 8000217c <panic>
    80002f60:	00195913          	srli	s2,s2,0x1
    80002f64:	fffff097          	auipc	ra,0xfffff
    80002f68:	854080e7          	jalr	-1964(ra) # 800017b8 <mycpu>
    80002f6c:	00197913          	andi	s2,s2,1
    80002f70:	07252e23          	sw	s2,124(a0)
    80002f74:	f75ff06f          	j	80002ee8 <acquire+0x3c>

0000000080002f78 <release>:
    80002f78:	fe010113          	addi	sp,sp,-32
    80002f7c:	00813823          	sd	s0,16(sp)
    80002f80:	00113c23          	sd	ra,24(sp)
    80002f84:	00913423          	sd	s1,8(sp)
    80002f88:	01213023          	sd	s2,0(sp)
    80002f8c:	02010413          	addi	s0,sp,32
    80002f90:	00052783          	lw	a5,0(a0)
    80002f94:	00079a63          	bnez	a5,80002fa8 <release+0x30>
    80002f98:	00001517          	auipc	a0,0x1
    80002f9c:	20850513          	addi	a0,a0,520 # 800041a0 <digits+0x28>
    80002fa0:	fffff097          	auipc	ra,0xfffff
    80002fa4:	1dc080e7          	jalr	476(ra) # 8000217c <panic>
    80002fa8:	01053903          	ld	s2,16(a0)
    80002fac:	00050493          	mv	s1,a0
    80002fb0:	fffff097          	auipc	ra,0xfffff
    80002fb4:	808080e7          	jalr	-2040(ra) # 800017b8 <mycpu>
    80002fb8:	fea910e3          	bne	s2,a0,80002f98 <release+0x20>
    80002fbc:	0004b823          	sd	zero,16(s1)
    80002fc0:	0ff0000f          	fence
    80002fc4:	0f50000f          	fence	iorw,ow
    80002fc8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80002fcc:	ffffe097          	auipc	ra,0xffffe
    80002fd0:	7ec080e7          	jalr	2028(ra) # 800017b8 <mycpu>
    80002fd4:	100027f3          	csrr	a5,sstatus
    80002fd8:	0027f793          	andi	a5,a5,2
    80002fdc:	04079a63          	bnez	a5,80003030 <release+0xb8>
    80002fe0:	07852783          	lw	a5,120(a0)
    80002fe4:	02f05e63          	blez	a5,80003020 <release+0xa8>
    80002fe8:	fff7871b          	addiw	a4,a5,-1
    80002fec:	06e52c23          	sw	a4,120(a0)
    80002ff0:	00071c63          	bnez	a4,80003008 <release+0x90>
    80002ff4:	07c52783          	lw	a5,124(a0)
    80002ff8:	00078863          	beqz	a5,80003008 <release+0x90>
    80002ffc:	100027f3          	csrr	a5,sstatus
    80003000:	0027e793          	ori	a5,a5,2
    80003004:	10079073          	csrw	sstatus,a5
    80003008:	01813083          	ld	ra,24(sp)
    8000300c:	01013403          	ld	s0,16(sp)
    80003010:	00813483          	ld	s1,8(sp)
    80003014:	00013903          	ld	s2,0(sp)
    80003018:	02010113          	addi	sp,sp,32
    8000301c:	00008067          	ret
    80003020:	00001517          	auipc	a0,0x1
    80003024:	1a050513          	addi	a0,a0,416 # 800041c0 <digits+0x48>
    80003028:	fffff097          	auipc	ra,0xfffff
    8000302c:	154080e7          	jalr	340(ra) # 8000217c <panic>
    80003030:	00001517          	auipc	a0,0x1
    80003034:	17850513          	addi	a0,a0,376 # 800041a8 <digits+0x30>
    80003038:	fffff097          	auipc	ra,0xfffff
    8000303c:	144080e7          	jalr	324(ra) # 8000217c <panic>

0000000080003040 <holding>:
    80003040:	00052783          	lw	a5,0(a0)
    80003044:	00079663          	bnez	a5,80003050 <holding+0x10>
    80003048:	00000513          	li	a0,0
    8000304c:	00008067          	ret
    80003050:	fe010113          	addi	sp,sp,-32
    80003054:	00813823          	sd	s0,16(sp)
    80003058:	00913423          	sd	s1,8(sp)
    8000305c:	00113c23          	sd	ra,24(sp)
    80003060:	02010413          	addi	s0,sp,32
    80003064:	01053483          	ld	s1,16(a0)
    80003068:	ffffe097          	auipc	ra,0xffffe
    8000306c:	750080e7          	jalr	1872(ra) # 800017b8 <mycpu>
    80003070:	01813083          	ld	ra,24(sp)
    80003074:	01013403          	ld	s0,16(sp)
    80003078:	40a48533          	sub	a0,s1,a0
    8000307c:	00153513          	seqz	a0,a0
    80003080:	00813483          	ld	s1,8(sp)
    80003084:	02010113          	addi	sp,sp,32
    80003088:	00008067          	ret

000000008000308c <push_off>:
    8000308c:	fe010113          	addi	sp,sp,-32
    80003090:	00813823          	sd	s0,16(sp)
    80003094:	00113c23          	sd	ra,24(sp)
    80003098:	00913423          	sd	s1,8(sp)
    8000309c:	02010413          	addi	s0,sp,32
    800030a0:	100024f3          	csrr	s1,sstatus
    800030a4:	100027f3          	csrr	a5,sstatus
    800030a8:	ffd7f793          	andi	a5,a5,-3
    800030ac:	10079073          	csrw	sstatus,a5
    800030b0:	ffffe097          	auipc	ra,0xffffe
    800030b4:	708080e7          	jalr	1800(ra) # 800017b8 <mycpu>
    800030b8:	07852783          	lw	a5,120(a0)
    800030bc:	02078663          	beqz	a5,800030e8 <push_off+0x5c>
    800030c0:	ffffe097          	auipc	ra,0xffffe
    800030c4:	6f8080e7          	jalr	1784(ra) # 800017b8 <mycpu>
    800030c8:	07852783          	lw	a5,120(a0)
    800030cc:	01813083          	ld	ra,24(sp)
    800030d0:	01013403          	ld	s0,16(sp)
    800030d4:	0017879b          	addiw	a5,a5,1
    800030d8:	06f52c23          	sw	a5,120(a0)
    800030dc:	00813483          	ld	s1,8(sp)
    800030e0:	02010113          	addi	sp,sp,32
    800030e4:	00008067          	ret
    800030e8:	0014d493          	srli	s1,s1,0x1
    800030ec:	ffffe097          	auipc	ra,0xffffe
    800030f0:	6cc080e7          	jalr	1740(ra) # 800017b8 <mycpu>
    800030f4:	0014f493          	andi	s1,s1,1
    800030f8:	06952e23          	sw	s1,124(a0)
    800030fc:	fc5ff06f          	j	800030c0 <push_off+0x34>

0000000080003100 <pop_off>:
    80003100:	ff010113          	addi	sp,sp,-16
    80003104:	00813023          	sd	s0,0(sp)
    80003108:	00113423          	sd	ra,8(sp)
    8000310c:	01010413          	addi	s0,sp,16
    80003110:	ffffe097          	auipc	ra,0xffffe
    80003114:	6a8080e7          	jalr	1704(ra) # 800017b8 <mycpu>
    80003118:	100027f3          	csrr	a5,sstatus
    8000311c:	0027f793          	andi	a5,a5,2
    80003120:	04079663          	bnez	a5,8000316c <pop_off+0x6c>
    80003124:	07852783          	lw	a5,120(a0)
    80003128:	02f05a63          	blez	a5,8000315c <pop_off+0x5c>
    8000312c:	fff7871b          	addiw	a4,a5,-1
    80003130:	06e52c23          	sw	a4,120(a0)
    80003134:	00071c63          	bnez	a4,8000314c <pop_off+0x4c>
    80003138:	07c52783          	lw	a5,124(a0)
    8000313c:	00078863          	beqz	a5,8000314c <pop_off+0x4c>
    80003140:	100027f3          	csrr	a5,sstatus
    80003144:	0027e793          	ori	a5,a5,2
    80003148:	10079073          	csrw	sstatus,a5
    8000314c:	00813083          	ld	ra,8(sp)
    80003150:	00013403          	ld	s0,0(sp)
    80003154:	01010113          	addi	sp,sp,16
    80003158:	00008067          	ret
    8000315c:	00001517          	auipc	a0,0x1
    80003160:	06450513          	addi	a0,a0,100 # 800041c0 <digits+0x48>
    80003164:	fffff097          	auipc	ra,0xfffff
    80003168:	018080e7          	jalr	24(ra) # 8000217c <panic>
    8000316c:	00001517          	auipc	a0,0x1
    80003170:	03c50513          	addi	a0,a0,60 # 800041a8 <digits+0x30>
    80003174:	fffff097          	auipc	ra,0xfffff
    80003178:	008080e7          	jalr	8(ra) # 8000217c <panic>

000000008000317c <push_on>:
    8000317c:	fe010113          	addi	sp,sp,-32
    80003180:	00813823          	sd	s0,16(sp)
    80003184:	00113c23          	sd	ra,24(sp)
    80003188:	00913423          	sd	s1,8(sp)
    8000318c:	02010413          	addi	s0,sp,32
    80003190:	100024f3          	csrr	s1,sstatus
    80003194:	100027f3          	csrr	a5,sstatus
    80003198:	0027e793          	ori	a5,a5,2
    8000319c:	10079073          	csrw	sstatus,a5
    800031a0:	ffffe097          	auipc	ra,0xffffe
    800031a4:	618080e7          	jalr	1560(ra) # 800017b8 <mycpu>
    800031a8:	07852783          	lw	a5,120(a0)
    800031ac:	02078663          	beqz	a5,800031d8 <push_on+0x5c>
    800031b0:	ffffe097          	auipc	ra,0xffffe
    800031b4:	608080e7          	jalr	1544(ra) # 800017b8 <mycpu>
    800031b8:	07852783          	lw	a5,120(a0)
    800031bc:	01813083          	ld	ra,24(sp)
    800031c0:	01013403          	ld	s0,16(sp)
    800031c4:	0017879b          	addiw	a5,a5,1
    800031c8:	06f52c23          	sw	a5,120(a0)
    800031cc:	00813483          	ld	s1,8(sp)
    800031d0:	02010113          	addi	sp,sp,32
    800031d4:	00008067          	ret
    800031d8:	0014d493          	srli	s1,s1,0x1
    800031dc:	ffffe097          	auipc	ra,0xffffe
    800031e0:	5dc080e7          	jalr	1500(ra) # 800017b8 <mycpu>
    800031e4:	0014f493          	andi	s1,s1,1
    800031e8:	06952e23          	sw	s1,124(a0)
    800031ec:	fc5ff06f          	j	800031b0 <push_on+0x34>

00000000800031f0 <pop_on>:
    800031f0:	ff010113          	addi	sp,sp,-16
    800031f4:	00813023          	sd	s0,0(sp)
    800031f8:	00113423          	sd	ra,8(sp)
    800031fc:	01010413          	addi	s0,sp,16
    80003200:	ffffe097          	auipc	ra,0xffffe
    80003204:	5b8080e7          	jalr	1464(ra) # 800017b8 <mycpu>
    80003208:	100027f3          	csrr	a5,sstatus
    8000320c:	0027f793          	andi	a5,a5,2
    80003210:	04078463          	beqz	a5,80003258 <pop_on+0x68>
    80003214:	07852783          	lw	a5,120(a0)
    80003218:	02f05863          	blez	a5,80003248 <pop_on+0x58>
    8000321c:	fff7879b          	addiw	a5,a5,-1
    80003220:	06f52c23          	sw	a5,120(a0)
    80003224:	07853783          	ld	a5,120(a0)
    80003228:	00079863          	bnez	a5,80003238 <pop_on+0x48>
    8000322c:	100027f3          	csrr	a5,sstatus
    80003230:	ffd7f793          	andi	a5,a5,-3
    80003234:	10079073          	csrw	sstatus,a5
    80003238:	00813083          	ld	ra,8(sp)
    8000323c:	00013403          	ld	s0,0(sp)
    80003240:	01010113          	addi	sp,sp,16
    80003244:	00008067          	ret
    80003248:	00001517          	auipc	a0,0x1
    8000324c:	fa050513          	addi	a0,a0,-96 # 800041e8 <digits+0x70>
    80003250:	fffff097          	auipc	ra,0xfffff
    80003254:	f2c080e7          	jalr	-212(ra) # 8000217c <panic>
    80003258:	00001517          	auipc	a0,0x1
    8000325c:	f7050513          	addi	a0,a0,-144 # 800041c8 <digits+0x50>
    80003260:	fffff097          	auipc	ra,0xfffff
    80003264:	f1c080e7          	jalr	-228(ra) # 8000217c <panic>

0000000080003268 <__memset>:
    80003268:	ff010113          	addi	sp,sp,-16
    8000326c:	00813423          	sd	s0,8(sp)
    80003270:	01010413          	addi	s0,sp,16
    80003274:	1a060e63          	beqz	a2,80003430 <__memset+0x1c8>
    80003278:	40a007b3          	neg	a5,a0
    8000327c:	0077f793          	andi	a5,a5,7
    80003280:	00778693          	addi	a3,a5,7
    80003284:	00b00813          	li	a6,11
    80003288:	0ff5f593          	andi	a1,a1,255
    8000328c:	fff6071b          	addiw	a4,a2,-1
    80003290:	1b06e663          	bltu	a3,a6,8000343c <__memset+0x1d4>
    80003294:	1cd76463          	bltu	a4,a3,8000345c <__memset+0x1f4>
    80003298:	1a078e63          	beqz	a5,80003454 <__memset+0x1ec>
    8000329c:	00b50023          	sb	a1,0(a0)
    800032a0:	00100713          	li	a4,1
    800032a4:	1ae78463          	beq	a5,a4,8000344c <__memset+0x1e4>
    800032a8:	00b500a3          	sb	a1,1(a0)
    800032ac:	00200713          	li	a4,2
    800032b0:	1ae78a63          	beq	a5,a4,80003464 <__memset+0x1fc>
    800032b4:	00b50123          	sb	a1,2(a0)
    800032b8:	00300713          	li	a4,3
    800032bc:	18e78463          	beq	a5,a4,80003444 <__memset+0x1dc>
    800032c0:	00b501a3          	sb	a1,3(a0)
    800032c4:	00400713          	li	a4,4
    800032c8:	1ae78263          	beq	a5,a4,8000346c <__memset+0x204>
    800032cc:	00b50223          	sb	a1,4(a0)
    800032d0:	00500713          	li	a4,5
    800032d4:	1ae78063          	beq	a5,a4,80003474 <__memset+0x20c>
    800032d8:	00b502a3          	sb	a1,5(a0)
    800032dc:	00700713          	li	a4,7
    800032e0:	18e79e63          	bne	a5,a4,8000347c <__memset+0x214>
    800032e4:	00b50323          	sb	a1,6(a0)
    800032e8:	00700e93          	li	t4,7
    800032ec:	00859713          	slli	a4,a1,0x8
    800032f0:	00e5e733          	or	a4,a1,a4
    800032f4:	01059e13          	slli	t3,a1,0x10
    800032f8:	01c76e33          	or	t3,a4,t3
    800032fc:	01859313          	slli	t1,a1,0x18
    80003300:	006e6333          	or	t1,t3,t1
    80003304:	02059893          	slli	a7,a1,0x20
    80003308:	40f60e3b          	subw	t3,a2,a5
    8000330c:	011368b3          	or	a7,t1,a7
    80003310:	02859813          	slli	a6,a1,0x28
    80003314:	0108e833          	or	a6,a7,a6
    80003318:	03059693          	slli	a3,a1,0x30
    8000331c:	003e589b          	srliw	a7,t3,0x3
    80003320:	00d866b3          	or	a3,a6,a3
    80003324:	03859713          	slli	a4,a1,0x38
    80003328:	00389813          	slli	a6,a7,0x3
    8000332c:	00f507b3          	add	a5,a0,a5
    80003330:	00e6e733          	or	a4,a3,a4
    80003334:	000e089b          	sext.w	a7,t3
    80003338:	00f806b3          	add	a3,a6,a5
    8000333c:	00e7b023          	sd	a4,0(a5)
    80003340:	00878793          	addi	a5,a5,8
    80003344:	fed79ce3          	bne	a5,a3,8000333c <__memset+0xd4>
    80003348:	ff8e7793          	andi	a5,t3,-8
    8000334c:	0007871b          	sext.w	a4,a5
    80003350:	01d787bb          	addw	a5,a5,t4
    80003354:	0ce88e63          	beq	a7,a4,80003430 <__memset+0x1c8>
    80003358:	00f50733          	add	a4,a0,a5
    8000335c:	00b70023          	sb	a1,0(a4)
    80003360:	0017871b          	addiw	a4,a5,1
    80003364:	0cc77663          	bgeu	a4,a2,80003430 <__memset+0x1c8>
    80003368:	00e50733          	add	a4,a0,a4
    8000336c:	00b70023          	sb	a1,0(a4)
    80003370:	0027871b          	addiw	a4,a5,2
    80003374:	0ac77e63          	bgeu	a4,a2,80003430 <__memset+0x1c8>
    80003378:	00e50733          	add	a4,a0,a4
    8000337c:	00b70023          	sb	a1,0(a4)
    80003380:	0037871b          	addiw	a4,a5,3
    80003384:	0ac77663          	bgeu	a4,a2,80003430 <__memset+0x1c8>
    80003388:	00e50733          	add	a4,a0,a4
    8000338c:	00b70023          	sb	a1,0(a4)
    80003390:	0047871b          	addiw	a4,a5,4
    80003394:	08c77e63          	bgeu	a4,a2,80003430 <__memset+0x1c8>
    80003398:	00e50733          	add	a4,a0,a4
    8000339c:	00b70023          	sb	a1,0(a4)
    800033a0:	0057871b          	addiw	a4,a5,5
    800033a4:	08c77663          	bgeu	a4,a2,80003430 <__memset+0x1c8>
    800033a8:	00e50733          	add	a4,a0,a4
    800033ac:	00b70023          	sb	a1,0(a4)
    800033b0:	0067871b          	addiw	a4,a5,6
    800033b4:	06c77e63          	bgeu	a4,a2,80003430 <__memset+0x1c8>
    800033b8:	00e50733          	add	a4,a0,a4
    800033bc:	00b70023          	sb	a1,0(a4)
    800033c0:	0077871b          	addiw	a4,a5,7
    800033c4:	06c77663          	bgeu	a4,a2,80003430 <__memset+0x1c8>
    800033c8:	00e50733          	add	a4,a0,a4
    800033cc:	00b70023          	sb	a1,0(a4)
    800033d0:	0087871b          	addiw	a4,a5,8
    800033d4:	04c77e63          	bgeu	a4,a2,80003430 <__memset+0x1c8>
    800033d8:	00e50733          	add	a4,a0,a4
    800033dc:	00b70023          	sb	a1,0(a4)
    800033e0:	0097871b          	addiw	a4,a5,9
    800033e4:	04c77663          	bgeu	a4,a2,80003430 <__memset+0x1c8>
    800033e8:	00e50733          	add	a4,a0,a4
    800033ec:	00b70023          	sb	a1,0(a4)
    800033f0:	00a7871b          	addiw	a4,a5,10
    800033f4:	02c77e63          	bgeu	a4,a2,80003430 <__memset+0x1c8>
    800033f8:	00e50733          	add	a4,a0,a4
    800033fc:	00b70023          	sb	a1,0(a4)
    80003400:	00b7871b          	addiw	a4,a5,11
    80003404:	02c77663          	bgeu	a4,a2,80003430 <__memset+0x1c8>
    80003408:	00e50733          	add	a4,a0,a4
    8000340c:	00b70023          	sb	a1,0(a4)
    80003410:	00c7871b          	addiw	a4,a5,12
    80003414:	00c77e63          	bgeu	a4,a2,80003430 <__memset+0x1c8>
    80003418:	00e50733          	add	a4,a0,a4
    8000341c:	00b70023          	sb	a1,0(a4)
    80003420:	00d7879b          	addiw	a5,a5,13
    80003424:	00c7f663          	bgeu	a5,a2,80003430 <__memset+0x1c8>
    80003428:	00f507b3          	add	a5,a0,a5
    8000342c:	00b78023          	sb	a1,0(a5)
    80003430:	00813403          	ld	s0,8(sp)
    80003434:	01010113          	addi	sp,sp,16
    80003438:	00008067          	ret
    8000343c:	00b00693          	li	a3,11
    80003440:	e55ff06f          	j	80003294 <__memset+0x2c>
    80003444:	00300e93          	li	t4,3
    80003448:	ea5ff06f          	j	800032ec <__memset+0x84>
    8000344c:	00100e93          	li	t4,1
    80003450:	e9dff06f          	j	800032ec <__memset+0x84>
    80003454:	00000e93          	li	t4,0
    80003458:	e95ff06f          	j	800032ec <__memset+0x84>
    8000345c:	00000793          	li	a5,0
    80003460:	ef9ff06f          	j	80003358 <__memset+0xf0>
    80003464:	00200e93          	li	t4,2
    80003468:	e85ff06f          	j	800032ec <__memset+0x84>
    8000346c:	00400e93          	li	t4,4
    80003470:	e7dff06f          	j	800032ec <__memset+0x84>
    80003474:	00500e93          	li	t4,5
    80003478:	e75ff06f          	j	800032ec <__memset+0x84>
    8000347c:	00600e93          	li	t4,6
    80003480:	e6dff06f          	j	800032ec <__memset+0x84>

0000000080003484 <__memmove>:
    80003484:	ff010113          	addi	sp,sp,-16
    80003488:	00813423          	sd	s0,8(sp)
    8000348c:	01010413          	addi	s0,sp,16
    80003490:	0e060863          	beqz	a2,80003580 <__memmove+0xfc>
    80003494:	fff6069b          	addiw	a3,a2,-1
    80003498:	0006881b          	sext.w	a6,a3
    8000349c:	0ea5e863          	bltu	a1,a0,8000358c <__memmove+0x108>
    800034a0:	00758713          	addi	a4,a1,7
    800034a4:	00a5e7b3          	or	a5,a1,a0
    800034a8:	40a70733          	sub	a4,a4,a0
    800034ac:	0077f793          	andi	a5,a5,7
    800034b0:	00f73713          	sltiu	a4,a4,15
    800034b4:	00174713          	xori	a4,a4,1
    800034b8:	0017b793          	seqz	a5,a5
    800034bc:	00e7f7b3          	and	a5,a5,a4
    800034c0:	10078863          	beqz	a5,800035d0 <__memmove+0x14c>
    800034c4:	00900793          	li	a5,9
    800034c8:	1107f463          	bgeu	a5,a6,800035d0 <__memmove+0x14c>
    800034cc:	0036581b          	srliw	a6,a2,0x3
    800034d0:	fff8081b          	addiw	a6,a6,-1
    800034d4:	02081813          	slli	a6,a6,0x20
    800034d8:	01d85893          	srli	a7,a6,0x1d
    800034dc:	00858813          	addi	a6,a1,8
    800034e0:	00058793          	mv	a5,a1
    800034e4:	00050713          	mv	a4,a0
    800034e8:	01088833          	add	a6,a7,a6
    800034ec:	0007b883          	ld	a7,0(a5)
    800034f0:	00878793          	addi	a5,a5,8
    800034f4:	00870713          	addi	a4,a4,8
    800034f8:	ff173c23          	sd	a7,-8(a4)
    800034fc:	ff0798e3          	bne	a5,a6,800034ec <__memmove+0x68>
    80003500:	ff867713          	andi	a4,a2,-8
    80003504:	02071793          	slli	a5,a4,0x20
    80003508:	0207d793          	srli	a5,a5,0x20
    8000350c:	00f585b3          	add	a1,a1,a5
    80003510:	40e686bb          	subw	a3,a3,a4
    80003514:	00f507b3          	add	a5,a0,a5
    80003518:	06e60463          	beq	a2,a4,80003580 <__memmove+0xfc>
    8000351c:	0005c703          	lbu	a4,0(a1)
    80003520:	00e78023          	sb	a4,0(a5)
    80003524:	04068e63          	beqz	a3,80003580 <__memmove+0xfc>
    80003528:	0015c603          	lbu	a2,1(a1)
    8000352c:	00100713          	li	a4,1
    80003530:	00c780a3          	sb	a2,1(a5)
    80003534:	04e68663          	beq	a3,a4,80003580 <__memmove+0xfc>
    80003538:	0025c603          	lbu	a2,2(a1)
    8000353c:	00200713          	li	a4,2
    80003540:	00c78123          	sb	a2,2(a5)
    80003544:	02e68e63          	beq	a3,a4,80003580 <__memmove+0xfc>
    80003548:	0035c603          	lbu	a2,3(a1)
    8000354c:	00300713          	li	a4,3
    80003550:	00c781a3          	sb	a2,3(a5)
    80003554:	02e68663          	beq	a3,a4,80003580 <__memmove+0xfc>
    80003558:	0045c603          	lbu	a2,4(a1)
    8000355c:	00400713          	li	a4,4
    80003560:	00c78223          	sb	a2,4(a5)
    80003564:	00e68e63          	beq	a3,a4,80003580 <__memmove+0xfc>
    80003568:	0055c603          	lbu	a2,5(a1)
    8000356c:	00500713          	li	a4,5
    80003570:	00c782a3          	sb	a2,5(a5)
    80003574:	00e68663          	beq	a3,a4,80003580 <__memmove+0xfc>
    80003578:	0065c703          	lbu	a4,6(a1)
    8000357c:	00e78323          	sb	a4,6(a5)
    80003580:	00813403          	ld	s0,8(sp)
    80003584:	01010113          	addi	sp,sp,16
    80003588:	00008067          	ret
    8000358c:	02061713          	slli	a4,a2,0x20
    80003590:	02075713          	srli	a4,a4,0x20
    80003594:	00e587b3          	add	a5,a1,a4
    80003598:	f0f574e3          	bgeu	a0,a5,800034a0 <__memmove+0x1c>
    8000359c:	02069613          	slli	a2,a3,0x20
    800035a0:	02065613          	srli	a2,a2,0x20
    800035a4:	fff64613          	not	a2,a2
    800035a8:	00e50733          	add	a4,a0,a4
    800035ac:	00c78633          	add	a2,a5,a2
    800035b0:	fff7c683          	lbu	a3,-1(a5)
    800035b4:	fff78793          	addi	a5,a5,-1
    800035b8:	fff70713          	addi	a4,a4,-1
    800035bc:	00d70023          	sb	a3,0(a4)
    800035c0:	fec798e3          	bne	a5,a2,800035b0 <__memmove+0x12c>
    800035c4:	00813403          	ld	s0,8(sp)
    800035c8:	01010113          	addi	sp,sp,16
    800035cc:	00008067          	ret
    800035d0:	02069713          	slli	a4,a3,0x20
    800035d4:	02075713          	srli	a4,a4,0x20
    800035d8:	00170713          	addi	a4,a4,1
    800035dc:	00e50733          	add	a4,a0,a4
    800035e0:	00050793          	mv	a5,a0
    800035e4:	0005c683          	lbu	a3,0(a1)
    800035e8:	00178793          	addi	a5,a5,1
    800035ec:	00158593          	addi	a1,a1,1
    800035f0:	fed78fa3          	sb	a3,-1(a5)
    800035f4:	fee798e3          	bne	a5,a4,800035e4 <__memmove+0x160>
    800035f8:	f89ff06f          	j	80003580 <__memmove+0xfc>

00000000800035fc <__putc>:
    800035fc:	fe010113          	addi	sp,sp,-32
    80003600:	00813823          	sd	s0,16(sp)
    80003604:	00113c23          	sd	ra,24(sp)
    80003608:	02010413          	addi	s0,sp,32
    8000360c:	00050793          	mv	a5,a0
    80003610:	fef40593          	addi	a1,s0,-17
    80003614:	00100613          	li	a2,1
    80003618:	00000513          	li	a0,0
    8000361c:	fef407a3          	sb	a5,-17(s0)
    80003620:	fffff097          	auipc	ra,0xfffff
    80003624:	b3c080e7          	jalr	-1220(ra) # 8000215c <console_write>
    80003628:	01813083          	ld	ra,24(sp)
    8000362c:	01013403          	ld	s0,16(sp)
    80003630:	02010113          	addi	sp,sp,32
    80003634:	00008067          	ret

0000000080003638 <__getc>:
    80003638:	fe010113          	addi	sp,sp,-32
    8000363c:	00813823          	sd	s0,16(sp)
    80003640:	00113c23          	sd	ra,24(sp)
    80003644:	02010413          	addi	s0,sp,32
    80003648:	fe840593          	addi	a1,s0,-24
    8000364c:	00100613          	li	a2,1
    80003650:	00000513          	li	a0,0
    80003654:	fffff097          	auipc	ra,0xfffff
    80003658:	ae8080e7          	jalr	-1304(ra) # 8000213c <console_read>
    8000365c:	fe844503          	lbu	a0,-24(s0)
    80003660:	01813083          	ld	ra,24(sp)
    80003664:	01013403          	ld	s0,16(sp)
    80003668:	02010113          	addi	sp,sp,32
    8000366c:	00008067          	ret

0000000080003670 <console_handler>:
    80003670:	fe010113          	addi	sp,sp,-32
    80003674:	00813823          	sd	s0,16(sp)
    80003678:	00113c23          	sd	ra,24(sp)
    8000367c:	00913423          	sd	s1,8(sp)
    80003680:	02010413          	addi	s0,sp,32
    80003684:	14202773          	csrr	a4,scause
    80003688:	100027f3          	csrr	a5,sstatus
    8000368c:	0027f793          	andi	a5,a5,2
    80003690:	06079e63          	bnez	a5,8000370c <console_handler+0x9c>
    80003694:	00074c63          	bltz	a4,800036ac <console_handler+0x3c>
    80003698:	01813083          	ld	ra,24(sp)
    8000369c:	01013403          	ld	s0,16(sp)
    800036a0:	00813483          	ld	s1,8(sp)
    800036a4:	02010113          	addi	sp,sp,32
    800036a8:	00008067          	ret
    800036ac:	0ff77713          	andi	a4,a4,255
    800036b0:	00900793          	li	a5,9
    800036b4:	fef712e3          	bne	a4,a5,80003698 <console_handler+0x28>
    800036b8:	ffffe097          	auipc	ra,0xffffe
    800036bc:	6dc080e7          	jalr	1756(ra) # 80001d94 <plic_claim>
    800036c0:	00a00793          	li	a5,10
    800036c4:	00050493          	mv	s1,a0
    800036c8:	02f50c63          	beq	a0,a5,80003700 <console_handler+0x90>
    800036cc:	fc0506e3          	beqz	a0,80003698 <console_handler+0x28>
    800036d0:	00050593          	mv	a1,a0
    800036d4:	00001517          	auipc	a0,0x1
    800036d8:	a1c50513          	addi	a0,a0,-1508 # 800040f0 <CONSOLE_STATUS+0xe0>
    800036dc:	fffff097          	auipc	ra,0xfffff
    800036e0:	afc080e7          	jalr	-1284(ra) # 800021d8 <__printf>
    800036e4:	01013403          	ld	s0,16(sp)
    800036e8:	01813083          	ld	ra,24(sp)
    800036ec:	00048513          	mv	a0,s1
    800036f0:	00813483          	ld	s1,8(sp)
    800036f4:	02010113          	addi	sp,sp,32
    800036f8:	ffffe317          	auipc	t1,0xffffe
    800036fc:	6d430067          	jr	1748(t1) # 80001dcc <plic_complete>
    80003700:	fffff097          	auipc	ra,0xfffff
    80003704:	3e0080e7          	jalr	992(ra) # 80002ae0 <uartintr>
    80003708:	fddff06f          	j	800036e4 <console_handler+0x74>
    8000370c:	00001517          	auipc	a0,0x1
    80003710:	ae450513          	addi	a0,a0,-1308 # 800041f0 <digits+0x78>
    80003714:	fffff097          	auipc	ra,0xfffff
    80003718:	a68080e7          	jalr	-1432(ra) # 8000217c <panic>
	...
