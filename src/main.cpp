#include "../lib/hw.h"
#include "../lib/console.h"
#include "../h/syscall_c.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"
#include "../h/_thread.hpp"

void testMethod(void *arg)
{
    int k = 0;
    k++;
    __putc('t');
}

/*
 * puca dispatch popSppSpie u thread wrapperu
 * drugi alokator nije popravio
 * drugi riscv nije popravio
 * drugi thread nije popravio
 * problem je sto se posle thread create ne resetuje sepc kako treba i sstatus kako treba
 * */
int main() {
    MemoryAllocator::initialize();
    riscv::w_stvec((uint64)&riscv::supervisorTrap);

    _thread::running = _thread::thread_create(nullptr, nullptr, nullptr);

    // ovako je nama ne znamo zasto riscv::ms_sstatus(riscv::SSTATUS_SPIE | riscv::SSTATUS_SPP);
    // ovako je lab ne razumemo zasto
    riscv::ms_sstatus(riscv::SSTATUS_SIE);
    // upisuje 45 i poziva syscall 45 - getPid()
    __asm__ volatile ("mv a0, %0" : : "r" (45));
    __asm__ volatile ("ecall");
    
    thread_t handle = nullptr;
    thread_create(&handle, testMethod, nullptr);
    //__asm__ volatile ("csrw sepc, %0" : : "r" (0));
    //__asm__ volatile ("csrw sstatus, %0" : : "r" (0x120));
    thread_dispatch();
    return 0;
}