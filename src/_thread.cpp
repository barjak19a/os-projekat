//
// Created by os on 9/3/23.
//

#include "../h/_thread.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"

void* operator new[](size_t n) {
    return MemoryAllocator::mem_alloc(n);
}

void operator delete[](void *p)  {
    MemoryAllocator::mem_free(p);
}


/*
void _thread::operator delete[](void *p) noexcept {
    MemoryAllocator::mem_free(p);
}

void *_thread::operator new[](size_t n) {
    return MemoryAllocator::mem_alloc(n);
}
 */