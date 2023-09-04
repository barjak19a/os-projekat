//
// Created by os on 8/20/23.
//

#ifndef PROJECT_BASE_V1_1_SYSCALL_C_H
#define PROJECT_BASE_V1_1_SYSCALL_C_H
#include "../lib/hw.h"

void * mem_alloc (size_t size);
int mem_free (void* adr);
void putc(char c);
char getc();


#endif //PROJECT_BASE_V1_1_SYSCALL_C_H
