//
// Created by os on 8/20/23.
//

#ifndef PROJECT_BASE_V1_1_SYSCALL_C_H
#define PROJECT_BASE_V1_1_SYSCALL_C_H

#include "../lib/hw.h"

enum Syscalls {
    MEM_ALLOC = 0x1,
    MEM_FREE = 0x2,
    THREAD_CREATE = 0x11,
    THREAD_EXIT = 0x12,
    THREAD_DISPATCH = 0x13,
    THREAD_JOIN = 0x14,
    SEM_OPEN = 0x21,
    SEM_CLOSE = 0x22,
    SEM_WAIT = 0x23,
    SEM_SIGNAL = 0x24,
    SEM_TRYWAIT = 0x26,
    GETC = 0x41,
    PUTC = 0x42
};

class _thread;

typedef _thread *thread_t;

void *mem_alloc(size_t size);

int mem_free(void *adr);

void putc(char c);

char getc();

int thread_create(thread_t *, void(*)(void *), void *);

void thread_dispatch();

void thread_exit();

void thread_join(thread_t id);

class _sem;

typedef _sem *sem_t;

int sem_open(sem_t *handle, unsigned init);

int sem_close(sem_t id);

int sem_wait (sem_t id);

int sem_signal (sem_t id);

int sem_trywait(sem_t id);

int time_sleep(time_t time);

#endif //PROJECT_BASE_V1_1_SYSCALL_C_H
