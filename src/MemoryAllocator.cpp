//
// Created by os on 8/14/23.
//

#include "../h/MemoryAllocator.hpp"

memblock* MemoryAllocator::freeHead = nullptr;
memblock* MemoryAllocator::allocatedHead = nullptr;

void MemoryAllocator::initialize(){
    freeHead = (memblock*) HEAP_START_ADDR;
    freeHead->prev = freeHead->next = nullptr;
    freeHead->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR);
}

void* MemoryAllocator::mem_alloc(size_t allocSize) {
    memblock* currentBlock = freeHead;
    int inserted = 0;

    if (allocSize <= MEM_BLOCK_SIZE){
        allocSize = MEM_BLOCK_SIZE;
    } else {
        allocSize = (allocSize / MEM_BLOCK_SIZE + 1) * MEM_BLOCK_SIZE;
    }

    while (currentBlock) {
        if (currentBlock->size >= allocSize + sizeof(memblock)) {
            //nasli blok
            if(currentBlock->size > allocSize + sizeof(memblock)) {
                //izracunaj ostatak bloka
                memblock *blockRemainder = (memblock *) ((char *) currentBlock + sizeof(memblock) + allocSize);
                blockRemainder->prev = blockRemainder->next = nullptr;
                blockRemainder->size = currentBlock->size - allocSize - sizeof (memblock);

                //uvezi ostatak bloka
                if(currentBlock->prev){
                    currentBlock->prev->next = blockRemainder;
                    blockRemainder->prev = currentBlock->prev;
                }
                if(currentBlock->next){
                    currentBlock->next->prev = blockRemainder;
                    blockRemainder->next = currentBlock->next;
                }
                if(currentBlock == freeHead) {
                    freeHead = blockRemainder;
                }
                break;
            } else {
                if(currentBlock->prev){
                    currentBlock->prev->next = currentBlock->next;
                }
                if(currentBlock->next){
                    currentBlock->next->prev = currentBlock->prev;
                }
                if(currentBlock == freeHead){
                    freeHead = currentBlock->next;
                }
                break;
            }
        }
        currentBlock = currentBlock->next;
    }
    memblock* currentAllocatedBlock = nullptr;
    if(currentBlock != nullptr) {
        if (allocatedHead == nullptr) {
            allocatedHead = currentBlock;
            allocatedHead->next = allocatedHead->prev = nullptr;
        } else if (currentBlock < allocatedHead) {

            currentBlock->next = allocatedHead;
            currentBlock->prev = nullptr;
            allocatedHead = currentBlock;
        } else {
            currentAllocatedBlock = allocatedHead;
            while (currentAllocatedBlock->next) {
                if (currentBlock < currentAllocatedBlock) {
                    currentBlock->next = currentAllocatedBlock;
                    currentBlock->prev = currentAllocatedBlock->prev;
                    currentAllocatedBlock->prev->next = currentBlock;
                    currentAllocatedBlock->prev = currentBlock;
                    inserted = 1;
                    break;
                }
                currentAllocatedBlock = currentAllocatedBlock->next;
            }

            if (inserted == 0) {
                currentBlock->prev = currentAllocatedBlock;
                currentBlock->next = nullptr;
                currentAllocatedBlock->next = currentBlock;
            }
        }


        //if ((void *) ((char *) currentBlock + sizeof(memblock)) != nullptr) {
            return (void *) ((char *) currentBlock + sizeof(memblock));
//        } else {
//            return nullptr;
//        }
    }

    return nullptr;

    //uvezi u allocated
    // svakom bloku nadji mesto
    // 1. scenario blok je na pocetku
    // 2. scenario blok je u sredini
    // 3. scenario blok je na kraju

}

int MemoryAllocator::mem_free(void* ptr) {
    //dolazi mi pokazivac na adresu pocetka bloka, treba da izvucem taj blok iz liste
    //pa onda da prevezem prev i next ako ima
    if (ptr == nullptr){
        return -1;
    }

    memblock* currentBlock = (memblock *) ((char *) (ptr) - sizeof(memblock));

    if (allocatedHead == nullptr){
        return -1;
    }

    if(allocatedHead == currentBlock){
        allocatedHead = currentBlock->next;
    }
    if(currentBlock->prev){
        currentBlock->prev->next = currentBlock->next;
    }
    if(currentBlock->next){
        currentBlock->next->prev = currentBlock->prev;
    }
    //ubaci blok u niz free
    //probaj na pocetak
    //probaj u sredinu
    //probaj na kraj

    if(freeHead == nullptr){
        freeHead->next = freeHead->prev = nullptr;
        freeHead = currentBlock;
    } else
    if(currentBlock < freeHead){
        freeHead->prev = currentBlock;
        currentBlock->next = freeHead;
        freeHead = currentBlock;
        freeHead->prev = nullptr;
    }else {
        memblock* curr = freeHead;

        while (curr->next && curr->next < currentBlock){
            curr = curr->next;
        }
        if(curr->next == nullptr){
            //dosao do kraja liste
            curr->next = currentBlock;
            currentBlock->prev = curr;
        }else {
            //nasao mu mesto u sred liste
            currentBlock->prev = curr;
            curr->next->prev = currentBlock;
            currentBlock->next = curr->next;
            curr->next = currentBlock;
        }
    }

    // probaj da spojis oslobodjeni blok sa delovima oko sebe da ne bi doslo do fragmentacije

    if(currentBlock->prev){
        memblock* curr = currentBlock->prev;
        if((char*)(curr + curr->size + sizeof(memblock)) == (char*)currentBlock){
            //spajam ga sa prethodnim
            curr->size = curr->size + currentBlock->size;
            if(currentBlock->next) {
                curr->next = currentBlock->next;
                currentBlock->next->prev = curr;
            }
        }
    }

    if (currentBlock->next){
        memblock* curr = currentBlock->next;
        if((char*)(currentBlock + currentBlock->size + sizeof(memblock)) == (char*)curr){
            //spajam ga sa sledecim
            currentBlock->size = currentBlock->size + curr ->size;
            if(curr->next) {
                curr->next->prev = currentBlock;
                currentBlock->next = curr->next;
            }
        }
    }

    return 0;

}


