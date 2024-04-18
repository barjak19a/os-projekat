//
// Created by os on 8/20/23.
//

#include "../h/syscall_c.hpp"
#include "../lib/console.h"
#include "../h/_thread.hpp"

void callOperation(uint64 operationCode){
    __asm__ volatile ("mv a0, %0" : : "r" (operationCode));
    __asm__ volatile ("ecall");
}

//uint64 ret(){
//    uint64 volatile ret_val;
//    __asm__ volatile ("mv %0, a0":"=r"(ret_val));
//    return  ret_val;
//}

void* mem_alloc(size_t size){
    __asm__ volatile("mv a1, %0": : "r"(size));
    callOperation(0x1);
//    return (void*)ret();
    void* ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));

    return ret;
}

int mem_free(void* adr){
    __asm__ volatile("mv a1, %0": : "r"(adr));
    callOperation(0x2);
    return 1;
}

char getc(){
    callOperation(0x41);
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (char)ret;
}

void putc(char c){
    __asm__ volatile("mv a1,%0": : "r"(c));
    callOperation(0x42);
}

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    size_t argument1;
    size_t argument2;
    size_t argument3;

    __asm__ volatile("mv %0, a0" : "=r" (argument1));
    __asm__ volatile("mv %0, a1" : "=r" (argument2));
    __asm__ volatile("mv %0, a2" : "=r" (argument3));
    void* stackSpace = mem_alloc(DEFAULT_STACK_SIZE);
    __asm__ volatile("mv a1, %0" : : "r" ((thread_t*)argument1));
    __asm__ volatile("mv a2, %0" : : "r" ((_thread::Body)argument2));
    __asm__ volatile("mv t0, %0" : : "r" ((void*)argument3));
    __asm__ volatile("mv t1, %0" : : "r" (stackSpace));

    /*__asm__ volatile ("mv a1, %0": : "r"(&handle));
    __asm__ volatile ("mv a2, %0": : "r"(start_routine));
    __asm__ volatile ("mv a3, %0": : "r"(arg));*/
    callOperation(0x11);
    return 1;
}

void thread_dispatch(){
    callOperation(0x13);
}

int thread_exit(){
    callOperation(0x12);
    return 1;
}

void thread_join(thread_t handle){
    __asm__ volatile("mv a1, %0" : : "r"(handle));
    callOperation(0x14);
}


