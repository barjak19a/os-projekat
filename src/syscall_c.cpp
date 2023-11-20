#include "../h/syscall_c.hpp"

void insert_and_ecall(uint64 br){

    __asm__ volatile ("mv a0, %0" : : "r" (br));
    __asm__ volatile ("ecall");
}

void* mem_alloc(size_t size){

    size_t argument1;
    __asm__ volatile("mv %0, a0" : "=r" (argument1));

    __asm__ volatile("mv a1, %0" : : "r" (argument1));

    insert_and_ecall(1);

    void* ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));

    return ret;

}

int mem_free(void* addr){

    size_t argument1;
    __asm__ volatile("mv %0, a0" : "=r" (argument1));

    __asm__ volatile("mv a1, %0" : : "r" ((void*) argument1));

    insert_and_ecall(2);

    return 1;
}

int thread_create (thread_t* handle, void(*start_routine)(void*), void* arg){

    size_t argument1;
    size_t argument2;
    size_t argument3;
    __asm__ volatile("mv %0, a0" : "=r" (argument1));
    __asm__ volatile("mv %0, a1" : "=r" (argument2));
    __asm__ volatile("mv %0, a2" : "=r" (argument3));

    __asm__ volatile("mv a1, %0" : : "r" ((thread_t*)argument1));
    __asm__ volatile("mv a2, %0" : : "r" ((_thread::Body)argument2));
    __asm__ volatile("mv a3, %0" : : "r" ((void*)argument3));

    insert_and_ecall(11);

    return 1;
}

int thread_exit (){
    insert_and_ecall(12);
    return 1;
}

void thread_dispatch (){
    insert_and_ecall(13);
}

int sem_open (sem_t* handle, unsigned init){

    size_t argument1;
    size_t argument2;

    __asm__ volatile("mv %0, a0" : "=r" (argument1));
    __asm__ volatile("mv %0, a1" : "=r" (argument2));

    __asm__ volatile("mv a1, %0" : : "r" ((sem_t*)argument1));
    __asm__ volatile("mv a2, %0" : : "r" (argument2));

    insert_and_ecall(21);

    return 1;

}

int sem_close (sem_t handle){

    size_t argument1;

    __asm__ volatile("mv %0, a0" : "=r" (argument1));

    __asm__ volatile("mv a1, %0" : : "r" ((sem_t)argument1));

    insert_and_ecall(22);

    return 1;
}

int sem_wait (sem_t id){

    size_t argument1;

    __asm__ volatile("mv %0, a0" : "=r" (argument1));

    __asm__ volatile("mv a1, %0" : : "r" ((sem_t)argument1));

    insert_and_ecall(23);
    return 1;
}

int sem_signal (sem_t id){

    size_t argument1;

    __asm__ volatile("mv %0, a0" : "=r" (argument1));
    __asm__ volatile("mv a1, %0" : : "r" ((sem_t)argument1));

    insert_and_ecall(24);

    return 1;
}

char getc (){

    insert_and_ecall(41);

    char ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));

    return ret;
}

void putc (char){

    size_t argument1;

    __asm__ volatile("mv %0, a0" : "=r" (argument1));
    __asm__ volatile("mv a1, %0" : : "r" ((char)argument1));

    insert_and_ecall(42);

 }
