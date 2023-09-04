//
// Created by os on 8/20/23.
//

#include "../h/riscv.hpp"
#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/_thread.hpp"

void riscv::popSppSpie() {
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}

void riscv::handleSupervisorTrap() {
    uint64 scause = r_scause();

    if (scause == 0x0000000000000008UL || scause == 0x0000000000000009UL) {
        size_t argument0;
        size_t argument1;
        size_t argument2;

        __asm__ volatile("mv %0, a0" : "=r" (argument0));
        __asm__ volatile("mv %0, a1" : "=r" (argument1));
        __asm__ volatile("mv %0, a2" : "=r" (argument2));

        uint64 sepc = r_sepc(); //cita pc
        w_sepc(sepc + 4); //uvecava pc za 4

        //uint64 sstatus = r_sstatus(); cita control and status registar
        if (argument0 == 1){
            void* allocated = MemoryAllocator::mem_alloc(argument1);
            __asm__ volatile ("mv a0, %0" : : "r" (allocated));
        }
        else if(argument0 == 2){
            MemoryAllocator::mem_free((void*)argument1);
        }
    } else if(scause == 0x8000000000000001UL){
        //SSI
        mc_sip(SIP_SSIE);
        //ne znam sta radi, SIP_SSIE je vrednost (1<<1), kod boza je ova vrednost SIP_SSIP ista
    }
}