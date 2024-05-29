#include "../lib/hw.h"
#include "../h/syscall_c.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"
#include "../h/_thread.hpp"

void userMain();

void userMainWrapper(void*) {
    userMain();
}

int main() {
    MemoryAllocator::initialize();
    riscv::w_stvec((uint64) &riscv::supervisorTrap);
    thread_t _main;
    thread_create(&_main, nullptr, nullptr);
    thread_t userMainHandle;
    thread_create(&userMainHandle, userMainWrapper, nullptr);
    thread_join(userMainHandle);
    return 0;
}