#include "../lib/hw.h"
#include "../lib/console.h"
#include "../h/syscall_c.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"

void testMethod(void *arg)
{
    int k = 0;
    k++;
}

int main() {
    MemoryAllocator::initialize();
    riscv::w_stvec((uint64)&riscv::supervisorTrap);
    //riscv::ms_sstatus(riscv::SSTATUS_SIE);

    // upisuje 45 i poziva syscall 45 - getPid()
    __asm__ volatile ("mv a0, %0" : : "r" (45));
    __asm__ volatile ("ecall");

    thread_t *handle = nullptr;
    thread_create(handle, testMethod, nullptr);

    return 0;
}