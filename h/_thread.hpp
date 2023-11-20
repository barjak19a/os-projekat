#ifndef PROJEKATOS__THREAD_H
#define PROJEKATOS__THREAD_H


#include "../lib/hw.h"
#include "../h/scheduler.hpp"
#include "../h/syscall_cpp.hpp"

void * operator new[](size_t n);

void operator delete[](void *p);

class Thread;

class _thread {
        public:

        enum{READY=1, BLOCKED=2 ,FINISHED=3};

        ~_thread() { delete[] stack; }

        int getState() const;
        void setState(int state);

        static void finishThread();


        uint64 getTimeSlice() const { return timeSlice; }
        using Body = void (*)();
        static _thread *createThread(Body body);
        static _thread *running;

        private:
        _thread(Body body, uint64 timeSlice) : body(body),
        stack(new uint64[STACK_SIZE]),
        context({(uint64) &threadWrapper,
                 (uint64) &stack[STACK_SIZE]}),
                 timeSlice(timeSlice)
        {
        if (body != nullptr) { Scheduler::put(this); }
        myThread = nullptr;
        state = _thread::READY;
        }
        struct Context { uint64 ra; uint64 sp; };
        Body body;
        uint64 *stack;
        Context context;
        uint64 timeSlice;

        friend class Riscv;
        friend class Thread;
        
        Thread* myThread;
        int state;

        static void threadWrapper();
        static void contextSwitch(Context *oldContext, Context *runningContext);
        static void dispatch();

        static uint64 timeSliceCounter;

        static uint64 constexpr STACK_SIZE = 1024;
        static uint64 constexpr TIME_SLICE = 2;
};


#endif //PROJEKATOS__THREAD_H
