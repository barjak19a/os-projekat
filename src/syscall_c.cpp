//
// Created by os on 8/20/23.
//

#include "../h/syscall_c.hpp"
#include "../lib/console.h"

void callOperation(uint64 operationCode){
    __asm__ volatile ("mv a0, %0" : : "r" (operationCode));
    __asm__ volatile ("ecall");
}

uint64 ret(){
    uint64 volatile ret_val;
    __asm__ volatile ("mv %0, a0":"=r"(ret_val));
    return  ret_val;
}

void* mem_alloc(size_t size){
    __asm__ volatile("mv a1, %0": : "r"(size));
    callOperation(1);
    return (void*)ret();
}

int mem_free(void* adr){
    __asm__ volatile("mv a1, %0": : "r"(adr));
    callOperation(2);
    return (int)ret();
}

