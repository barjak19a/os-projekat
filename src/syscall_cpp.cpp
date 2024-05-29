#include "../lib/hw.h"
#include "../h/syscall_c.hpp"
#include "../h/syscall_cpp.hpp"
#include "../h/_thread.hpp"
#include "../h/_sem.hpp"

void *operator new(size_t size) {
    return mem_alloc(size);
}

void operator delete(void *pointer) {
    mem_free(pointer);
}

Thread::Thread(void (*body)(void *), void *arg) {
    this->body = body;
    this->arg = arg;
}

Thread::~Thread() {
    mem_free(myHandle);
}

int Thread::start() {
    if (this->body) {
        thread_create(&myHandle, this->body, this->arg);
    } else {
        thread_create(&myHandle, run_wrapper, this);
    }
    return 0;
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t) {
    return 0;
}

Thread::Thread() {
    this->body = nullptr;
    this->arg = nullptr;
}

void Thread::run_wrapper(void *caller) {
    Thread *thread = reinterpret_cast<Thread *>(caller);
    thread->run();
}

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

int Semaphore::timedWait(time_t) {
    return 0;
}

int Semaphore::tryWait() {
    return sem_trywait(myHandle);
}

void PeriodicThread::terminate() {

}

PeriodicThread::PeriodicThread(time_t period) {
    this->period = period;
}

char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}
