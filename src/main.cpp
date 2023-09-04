#include "../lib/hw.h"
#include "../lib/console.h"
#include "../h/syscall_c.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"



int main() {
    MemoryAllocator::initialize();
    riscv::w_stvec((uint64)&riscv::supervisorTrap);
    //riscv::ms_sstatus(riscv::SSTATUS_SIE);

    __asm__ volatile ("mv a0, %0" : : "r" (45));
    __asm__ volatile ("ecall");

    void* mojBlok = mem_alloc(1024);
    for(int i =0; i< 1999; i++){

    }
    mem_free(mojBlok);
    __putc('k');
    __putc('\n');

    return 0;
}