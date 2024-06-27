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

    //_thread(Body, void*args, void*stack_space);

    State getState() { return state; }

    void setState(State state) { this->state = state; }

    void thread_join();

    int getId();

    static _thread *running;

    static void thread_dispatch();

    static void thread_exit();

    static int thread_create(_thread **handle, Body body, void *args, void *stackSpace);

    static void thread_wrapper();

    static void contextSwitch(Context *current, Context *next);

    static void SetMaximumThreads(int num_of_threads = 5);

    static _sem* max_threads;

    void add_child(_thread *child) {
        children[pointer++] = child;
    }

    static void joinAll();


private:
    _thread(Body body, void *args, void *stackSpace);
    static int idCounter;

    Body body;
    Context context;
    uint64 *stack;
    uint64 timeSlice;
    void *args;
    State state;
    _sem *joinSem;
    int id;
    _thread* children[1000];
    int pointer = 0;
};

#endif
