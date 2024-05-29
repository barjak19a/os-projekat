#include "../h/syscall_c.hpp"


void ecall(uint64 code, uint64 argument1 = 0, uint64 argument2 = 0, uint64 argument3 = 0, uint64 argument4 = 0) {
    __asm__ volatile ("ecall");
}

void *mem_alloc(uint64 size) {
    ecall(MEM_ALLOC, size);
    void *ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));

    return ret;
}

int mem_free(void *adr) {
    ecall(MEM_FREE, (uint64) adr);
    return 1;
}

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    void* stack = 0;
    if (start_routine != nullptr) {
        stack = mem_alloc(DEFAULT_STACK_SIZE);
    }
    ecall(THREAD_CREATE, (uint64) handle, (uint64) start_routine, (uint64) arg, (uint64) stack);
    return 1;
}

void thread_exit() {
    ecall(THREAD_EXIT);
}

void thread_dispatch() {
    ecall(THREAD_DISPATCH);
}

void thread_join(thread_t id) {
    ecall(THREAD_JOIN, (uint64) id);
}

int sem_open(sem_t *handle, unsigned init) {
    ecall(SEM_OPEN, (uint64) handle, (uint64) init);
    return 1;
}

int sem_close(sem_t handle) {
    ecall(SEM_CLOSE, (uint64) handle);
    return 1;
}

int sem_wait(sem_t handle) {
    ecall(SEM_WAIT, (uint64) handle);
    return 1;
}

int sem_signal(sem_t handle) {
    ecall(SEM_SIGNAL, (uint64) handle);
    return 1;
}

int sem_trywait(sem_t handle) {
    ecall(SEM_TRYWAIT, (uint64) handle);
    return 1;
}

int time_sleep(time_t time) {
    return 0;
}

char getc() {
    ecall(GETC);
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (char) ret;
}

void putc(char c) {
    ecall(PUTC, (uint64) c);
}