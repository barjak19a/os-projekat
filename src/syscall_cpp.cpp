//
// Created by os on 9/4/23.
//

#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.hpp"
#include "../h/_thread.hpp"
#include "../h/MemoryAllocator.hpp"

void *operator new(size_t n){
    return mem_alloc(n);
}

void operator delete(void *p) {
    mem_free(p);
}
