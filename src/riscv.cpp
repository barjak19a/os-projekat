#include "../lib/console.h"
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/_thread.hpp"
#include "../h/_sem.hpp"
#include "../test/printing.hpp"

enum Scause {
    ECALL_U = 0x0000000000000008UL,
    ECALL_S = 0x0000000000000009UL,
    TIMER = 0x8000000000000001UL,
    CONSOLE = 0x8000000000000009UL,
    ILLEGAL_INSTRUCTION = 0x0000000000000002UL
};

void riscv::popSppSpie() {
    riscv::mc_sstatus(riscv::SSTATUS_SPP);
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}

void riscv::handleSupervisorTrap() {
    size_t volatile argument0, argument1, argument2, argument3, argument4;
    __asm__ volatile("mv %0, a0" : "=r" (argument0));
    __asm__ volatile("mv %0, a1" : "=r" (argument1));
    __asm__ volatile("mv %0, a2" : "=r" (argument2));
    __asm__ volatile("mv %0, a3" : "=r" (argument3));
    __asm__ volatile("mv %0, a4" : "=r" (argument4));
    uint64 scause = r_scause();
    uint64 sepc = r_sepc(); //cita pc
    uint64 sstatus = r_sstatus(); //cita control and status registar
    if (scause == ECALL_U || scause == ECALL_S) {
        sepc += 4;
        switch (argument0) {
            case MEM_ALLOC:
                MemoryAllocator::mem_alloc(argument1);
                break;
            case MEM_FREE:
                MemoryAllocator::mem_free((void *) argument1);
                break;
            case THREAD_CREATE:
                _thread::thread_create((_thread **) argument1, (_thread::Body) argument2, (void *) argument3,
                                       (void *) argument4);
                break;
            case THREAD_EXIT:
                _thread::thread_exit();
                break;
            case THREAD_DISPATCH:
                _thread::thread_dispatch();
                break;
            case THREAD_JOIN:
                ((_thread *) argument1)->thread_join();
            case SEM_OPEN:
                _sem::sem_open((_sem **) argument1, static_cast<int>(argument2));
                break;
            case SEM_CLOSE:
                _sem::sem_close((_sem *) argument1);
                break;
            case SEM_WAIT:
                ((_sem *) argument1)->wait();
                break;
            case SEM_SIGNAL:
                ((_sem *) argument1)->signal();
                break;
            case SEM_TRYWAIT:
                ((_sem *) argument1)->trywait();
                break;
            case GETC:
                __getc();
                break;
            case PUTC:
                __putc((char) argument1);
                break;
        }
    } else if (scause == TIMER) {
        mc_sip(SIP_SSIE);
    } else if (scause == CONSOLE) {
        console_handler();
    } else if (scause == ILLEGAL_INSTRUCTION) {
        printString("Illegal instruction: sepc = ");
        printInt(sepc, 16);
        putc('\n');
        for (int i = 0; i < 500000000; i++);
    }
    w_sstatus(sstatus);
    w_sepc(sepc);
}