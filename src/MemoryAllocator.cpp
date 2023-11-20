#include "../h/MemoryAllocator.hpp"

memBlock* MemoryAllocator::freeBlocks = nullptr;
memBlock* MemoryAllocator::allocBlocks = nullptr;

void MemoryAllocator::tryToJoin(memBlock* cur){

    if(!cur) return;

    if(cur->next &&  (char*)cur + cur->size + sizeof(memBlock) == (char*)(cur->next)){
        cur->size += cur->next->size;
        cur->next = cur->next->next;
        if(cur->next) cur->next->prev = cur;
    }
}

void MemoryAllocator::mem_init() {
    freeBlocks = (memBlock*)HEAP_START_ADDR;
    freeBlocks->size = ((size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR);
    freeBlocks->prev = nullptr;
    freeBlocks->next = nullptr;
}

void* MemoryAllocator::mem_alloc(size_t sz){

    size_t block_size;

    block_size = (sz <= MEM_BLOCK_SIZE) ? MEM_BLOCK_SIZE : (sz / MEM_BLOCK_SIZE + 1) * MEM_BLOCK_SIZE;

    memBlock* curr = freeBlocks;

    while(curr != nullptr && curr->size < block_size) curr = curr->next;

    if(curr){

        if (freeBlocks == curr) {
            freeBlocks = curr->next;
        }

        if (curr->prev != nullptr) {
            curr->prev->next = curr->next;
        }

        if (curr->next != nullptr) {
            curr->next->prev = curr->prev;
        }

        if (curr->size > block_size + sizeof(memBlock)) {

                memBlock *remainBlock = (memBlock *) ((char *) (curr) + sizeof(memBlock) + block_size);
                remainBlock->size = curr->size - block_size - sizeof(memBlock);
                remainBlock->next = remainBlock->prev = nullptr;

                if (freeBlocks == nullptr) {
                    freeBlocks = remainBlock;
                    remainBlock->prev = nullptr;
                    remainBlock->next = nullptr;
                } else if (remainBlock < freeBlocks) {
                    remainBlock->prev = nullptr;
                    remainBlock->next = freeBlocks;
                    freeBlocks->prev = remainBlock;
                    freeBlocks = remainBlock;
                } else {
                    memBlock* current = freeBlocks;
                    while (current->next != nullptr && current->next < remainBlock) {
                        current = current->next;
                    }
                    remainBlock->prev = current;
                    remainBlock->next = current->next;
                    if (current->next != nullptr) {
                        current->next->prev = remainBlock;
                    }
                    current->next = remainBlock;
                }

            curr->size = block_size + sizeof(memBlock);
        }

        if (allocBlocks == nullptr) {
            allocBlocks = curr;
            curr->prev = nullptr;
            curr->next = nullptr;
        } else if (curr < allocBlocks) {
            curr->prev = nullptr;
            curr->next = allocBlocks;
            allocBlocks->prev = curr;
            allocBlocks = curr;
        } else {
            memBlock* current = allocBlocks;
            while (current->next != nullptr && current->next < curr) {
                current = current->next;
            }
            curr->prev = current;
            curr->next = current->next;
            if (current->next != nullptr) {
                current->next->prev = curr;
            }
            current->next = curr;
        }

        return (void *) ((char *) curr + sizeof(memBlock));

    }

    return nullptr;

};

int MemoryAllocator::mem_free(void* addr){

    if (!addr)return -1;

    memBlock *new_block = (memBlock *) ((char *) (addr) - sizeof(memBlock));


    if (allocBlocks == nullptr || new_block == nullptr) {
        return 0;
    }

    if (allocBlocks == new_block) {
        allocBlocks = new_block->next;
    }

    if (new_block->prev != nullptr) {
        new_block->prev->next = new_block->next;
    }

    if (new_block->next != nullptr) {
        new_block->next->prev = new_block->prev;
    }

    if (freeBlocks == nullptr) {
        freeBlocks = new_block;
        new_block->prev = nullptr;
        new_block->next = nullptr;
    } else if (new_block < freeBlocks) {
        new_block->prev = nullptr;
        new_block->next = freeBlocks;
        freeBlocks->prev = new_block;
        freeBlocks = new_block;
    } else {
        memBlock* current = freeBlocks;
        while (current->next != nullptr && current->next < new_block) {
            current = current->next;
        }
        new_block->prev = current;
        new_block->next = current->next;
        if (current->next != nullptr) {
            current->next->prev = new_block;
        }
        current->next = new_block;
    }

    tryToJoin(new_block->prev);
    tryToJoin(new_block);

    return 0;
};