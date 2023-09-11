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

int main() {
    MemoryAllocator::initialize();
    riscv::w_stvec((uint64)&riscv::supervisorTrap);
    //riscv::ms_sstatus(riscv::SSTATUS_SIE);

    _thread::running = _thread::thread_create(nullptr, nullptr);
    // upisuje 45 i poziva syscall 45 - getPid()
    __asm__ volatile ("mv a0, %0" : : "r" (45));
    __asm__ volatile ("ecall");

    //thread_t *handle = nullptr;
    //thread_create(handle, testMethod, nullptr);
    //thread_dispatch();
    return 0;
}