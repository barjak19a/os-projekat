#include "../h/printing.hpp"
#include "../h/riscv.hpp"
#include "../h/UserMain.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../lib/console.h"

void testMethod(void *arg)
{
    int k = 0;
    k++;
    __putc('t');
}


int main() {

    MemoryAllocator::mem_init();

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);

    _thread::running = _thread::createThread(nullptr);

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    __asm__ volatile ("mv a0, %0" : : "r" (45));
    __asm__ volatile ("ecall");

    //userMain();

    thread_t handle = nullptr;
    thread_create(&handle, testMethod, nullptr);
    //__asm__ volatile ("csrw sepc, %0" : : "r" (0));
    //__asm__ volatile ("csrw sstatus, %0" : : "r" (0x120));
    thread_dispatch();

    printString("Finished\n");
    return 0;
}