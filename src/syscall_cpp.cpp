#include "../h/syscall_cpp.hpp"

void* operator new(size_t n){
    return mem_alloc(n);
}

void operator delete(void *p) {
    mem_free(p);
}

Thread::Thread() {
    thread_create(&myHandle, nullptr, nullptr);
    myHandle->myThread = this;
}

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create(&myHandle, body, arg);
    myHandle->myThread = this;
}

Thread::~Thread() {
    delete myHandle;
}

int Thread::start() {
    Scheduler::put(myHandle);
    return 1;
}

void Thread::dispatch() {
    thread_dispatch();
}
