//
// Created by os on 9/3/23.
//

#ifndef PROJECT_BASE_V1_1__THREAD_HPP
#define PROJECT_BASE_V1_1__THREAD_HPP

#include "../lib/hw.h"
#include "MemoryAllocator.hpp"
#include "../h/scheduler.hpp"
#include "../h/syscall_c.hpp"

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

    static void dispatch();
    static int exit();
    static _thread* thread_create(Body body, void *args);
    static void thread_wrapper();
    static void contextSwitch(Context *current, Context *next);

    ~_thread() { delete[] stack; }

private:

    friend class riscv;

    _thread(Body body, void *args) {
        this->body = body;
        this->args = args;
        this->stack = new uint64[DEFAULT_STACK_SIZE];
        this->state = 1;
        this->context = { (uint64) &thread_wrapper, (uint64) &(this->stack[DEFAULT_STACK_SIZE]) };
        this->timeSlice = DEFAULT_TIME_SLICE;
    }



    Body body;
    Context context;
    uint64* stack;
    uint64 timeSlice;
    void *args;
    uint64 state;
    //1- CREATED, 2- READY, 3- BLOCKED, 4- FINISHED
};

#endif //PROJECT_BASE_V1_1__THREAD_HPP
