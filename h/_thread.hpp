#ifndef PROJECT_BASE_V1_1__THREAD_HPP
#define PROJECT_BASE_V1_1__THREAD_HPP

#include "../lib/hw.h"
#include "../h/syscall_c.hpp"

class _thread {
public:
    enum State {
        RUNNABLE,
        BLOCKED,
        TERMINATED
    };
    struct Context {
        uint64 ra;
        uint64 sp;
    };
    using Body = void (*)(void *);

    State getState() { return state; }

    void setState(State state) { this->state = state; }

    void thread_join();

    static _thread *running;

    static void thread_dispatch();

    static void thread_exit();

    static int thread_create(_thread **handle, Body body, void *args, void *stackSpace);

    static void thread_wrapper();

    static void contextSwitch(Context *current, Context *next);

private:
    _thread(Body body, void *args, void *stackSpace);

    Body body;
    Context context;
    uint64 *stack;
    uint64 timeSlice;
    void *args;
    State state;
    _sem *joinSem;
};

#endif
