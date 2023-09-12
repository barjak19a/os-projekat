//
// Created by os on 9/3/23.
//

#include "../h/_thread.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"

_thread* _thread::running = nullptr;

void* operator new[](size_t n) {
    return MemoryAllocator::mem_alloc(n);
}

void operator delete[](void *p)  {
    MemoryAllocator::mem_free(p);
}

_thread *_thread::thread_create(_thread::Body body, void *args, void *stackSpace) {
    __putc('1');
    return new _thread(body, args, stackSpace);
}
void _thread::thread_dispatch() {
    __putc('t');
    _thread *current = running;
    if(current && current->state == 2){
        __putc('y');
        Scheduler::put(current);
    }
    __putc('u');
    running = Scheduler::get();
    __putc('i');
    _thread::contextSwitch(&current->context, &running->context);
    __putc('o');
}

void _thread::thread_wrapper() {
    riscv::popSppSpie();
    running->state = 2;
    running->body(running->args);
    running->state = 4;
}

int _thread::thread_exit() {
   running->state = 4;
   thread_dispatch();
   return 0;
}

