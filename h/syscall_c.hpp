//
// Created by os on 8/20/23.
//

#ifndef PROJECT_BASE_V1_1_SYSCALL_C_H
#define PROJECT_BASE_V1_1_SYSCALL_C_H
#include "../lib/hw.h"

class _thread;
typedef _thread* thread_t;

void * mem_alloc (size_t size);
int mem_free (void* adr);
void putc(char c);
char getc();
int thread_create(thread_t*, void(*)(void*), void*);
void thread_dispatch();
void thread_join(thread_t);

#endif //PROJECT_BASE_V1_1_SYSCALL_C_H
