#include "../lib/hw.h"
#include "../h/syscall_c.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"
#include "../h/_thread.hpp"
#include "../h/syscall_cpp.hpp"
#include "../test/printing.hpp"


void userMain();

class Resource {
public:
    Resource(int value) {
        this->value = value;
        sem = new Semaphore(0);
    }

    void take_resources(int take) {
        while (take > value) {
            waiting_threads ++;
            sem->wait();
            waiting_threads --;
        }
        value -= take;
    }

    void give_back(int give) {
        value += give;
        for (int i = 0; i < waiting_threads; i++) {
            sem->signal();
            thread_dispatch();
        }
    }

private:
    int value;
    Semaphore *sem;
    int waiting_threads = 0;
};


class TestThread : public Thread {
public:
    TestThread(char name, Semaphore *mutex) : Thread() {
        this->name = name;
        this->mutex = mutex;
    }

    void run() override {
        for (int i = 0; i < 5; i++) {
            mutex->wait();
            printString("Hello, I am thread ");
            putc(name);
            printString(" Thread::id = ");
            printInt(get_thread_id(), 10);
            putc('\n');
            mutex->signal();
            for (int j = 0; j < 10000000; j++);
        }
        for (long i = 0; i < get_thread_id() * 100; i++)
            finished = true;
    }

    bool finished = false;
private:
    char name;
    Semaphore *mutex;
};


class ResourceThread : public Thread {
    public:
    ResourceThread(char name, Resource *resource) : Thread() {
        this->name = name;
        this->resource = resource;
    }

    void run() override {
        int id = get_thread_id();
        for (int i = 0; i < 5; i++) {
            resource->take_resources(2);
            printString("Hello, I am thread ");
            putc(name);
            printString(" Thread::id = ");
            printInt( id,10);
            putc('\n');
            for (int j = 0; j < 100000000; j++);
            resource->give_back(2);
            for (int j = 0; j < 100000000; j++);
        }
        finished = true;
    }
    bool finished = false;
private:
    char name;
    Resource *resource;
};

void userMainWrapper(void *) {
    userMain();
}

int main() {
    MemoryAllocator::initialize();
    riscv::w_stvec((uint64) &riscv::supervisorTrap);
    thread_t _main;
    thread_create(&_main, nullptr, nullptr);
    thread_t userMainHandle;
    _thread::SetMaximumThreads(1000);
    thread_create(&userMainHandle, userMainWrapper, nullptr);
    thread_join(userMainHandle);
    return 0;
}