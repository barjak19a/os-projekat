#include "../h/riscv.hpp"
#include "../h/_thread.hpp"
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"

void Riscv::popSppSpie() {
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}

void Riscv::handleSupervisorTrap() {

    uint64 scause = r_scause();

    if(scause == 0x0000000000000008UL || scause == 0x0000000000000009UL){
        // prekopirano od mickovog koda sa laba jedino ovako hoce da radi
        size_t argument0;
        size_t argument1;
        size_t argument2;

        __asm__ volatile("mv %0, a0" : "=r" (argument0));
        __asm__ volatile("mv %0, a1" : "=r" (argument1));
        __asm__ volatile("mv %0, a2" : "=r" (argument2));

        uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();

        switch (argument0) {
            case 0: {
                _thread::timeSliceCounter = 0;
                _thread::dispatch();
                break;
            }
            case 1:{
                __asm__ volatile("mv a0, %0" : : "r" ((void*)MemoryAllocator::mem_alloc(argument1)));
                break;
            }
            case 2: {
                MemoryAllocator::mem_free((void*)argument1);
                break;
            }
            case 11:{
                thread_t* handler = (thread_t*) argument1;

                *handler = _thread::createThread((_thread::Body) argument2);
                break;
            }
            case 12: {
                _thread::finishThread();
                break;
            }
            case 13: {
                _thread::dispatch();
                break;
            }
            case 21:{
                // createSem
                break;
            }
            case 22:{
                // freeSem
                break;
            }
            case 23:{
                //wait
                break;
            }
            case 24:{
                //signal
                break;
            }
            case 41:{
                char ret;
                ret = __getc();

                __asm__ volatile("mv a0, %0" : : "r" (ret));
                break;
            }
            case 42:{
                char c;

                __asm__ volatile("mv %0, a1" : "=r" (c));

                __putc(c);
                break;
            }
            case 45: {
                __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(1UL << 8));
            }
        }
        w_sstatus(sstatus); w_sepc(sepc);
    }
    else if (scause == 0x8000000000000001UL) {
        mc_sip(SIP_SSIP);
    } else if (scause == 0x8000000000000009UL) {
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    } else {
        // unexpected trap cause
    }
}