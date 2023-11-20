#ifndef PROJEKATOS_MEMORYALLOCATOR_HPP
#define PROJEKATOS_MEMORYALLOCATOR_HPP

#include "../lib/mem.h"

struct memBlock{
    size_t size;
    memBlock* prev;
    memBlock* next;
};

class MemoryAllocator {

public:
    static void tryToJoin(memBlock*);
    static void mem_init();
    static void* mem_alloc (size_t);
    static int mem_free (void*);


private:
    static memBlock * freeBlocks;
    static memBlock * allocBlocks;
};


#endif //PROJEKATOS_MEMORYALLOCATOR_HPP
