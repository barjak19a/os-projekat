//
// Created by os on 9/3/23.
//

#ifndef PROJECT_BASE_V1_1__THREAD_HPP
#define PROJECT_BASE_V1_1__THREAD_HPP

#include "../lib/hw.h"
#include "MemoryAllocator.hpp"
#include "../h/scheduler.hpp"
#include "../h/syscall_c.hpp"
#include "../lib/console.h"

void * operator new[](size_t n);

void operator delete[](void *p);

class _thread {
public:
    struct Context {
        uint64 ra;
        uint64 sp;
    };
    using Body = void (*)(void*);

    static _thread *mainThread;
    static _thread *running;

    static void thread_dispatch();
    static int thread_exit();
    static _thread* thread_create(Body body, void *args, void *stackSpace);
    static void thread_wrapper();
    static void thread_join(thread_t handle);
    static void contextSwitch(Context *current, Context *next);

    ~_thread() { delete[] stack; }

private:

    friend class riscv;

    _thread(Body body, void *args, void *stackSpace) {
        this->body = body;
        this->args = args;
        if(body != nullptr) {
            this->stack = (uint64*) stackSpace;
            __putc('a');
        }
        else {
            this->stack = nullptr;
            __putc('b');
        }
        this->state = 2;

        uint64 ra = 0;
        if(body != nullptr)
            ra = (uint64) &thread_wrapper;
        uint64 sp = 0;
        if(stack != nullptr)
            sp = (uint64) &stack[DEFAULT_STACK_SIZE];
        this->context = { ra, sp };
        this->timeSlice = DEFAULT_TIME_SLICE;
        if (body != nullptr) { Scheduler::put(this); }
    }



    Body body;
    Context context;
    uint64* stack;
    uint64 timeSlice;
    void *args;
    uint64 state;
    //1- NEW, 2- READY, 3- BLOCKED, 4- FINISHED
};

#endif //PROJECT_BASE_V1_1__THREAD_HPP
