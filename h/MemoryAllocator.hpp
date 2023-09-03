#ifndef MEMORY_ALLOCATOR_HPP
#define MEMORY_ALLOCATOR_HPP

#include "../lib/hw.h"


struct memblock {
    size_t size;
    memblock* prev;
    memblock* next;
};

class MemoryAllocator {
public:

    static void* mem_alloc(size_t allocSize);
    static int mem_free(void* ptr);
    static void initialize();


private:

    static memblock* freeHead;
    static memblock* allocatedHead;

};
#endif // MEMORY_ALLOCATOR_HPP