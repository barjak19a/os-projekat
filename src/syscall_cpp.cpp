//
// Created by os on 9/4/23.
//

#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.hpp"
#include "../h/_thread.hpp"
#include "../h/MemoryAllocator.hpp"

void *operator new(size_t n){
    return mem_alloc(n);
}

void operator delete(void *p) {
    mem_free(p);
}

Thread::~Thread() {
    delete myHandle;
}
void Thread::dispatch() {
    thread_dispatch();
}
Thread::Thread(void (*body)(void *), void *arg) {
    thread_create(&myHandle, body, arg);
}
Thread::Thread() {
    thread_create(&myHandle, nullptr, nullptr);
}

void Thread::join() {
    thread_join(this->myHandle);
}
int Thread::start() {
    Scheduler::put(myHandle);
    return 1;
}

