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

_thread *_thread::thread_create(_thread::Body body, void *args) {
    return new _thread(body, args);
}
void _thread::thread_dispatch() {
    _thread *current = running;
    if(current->state == 2){
        Scheduler::put(current);
    }
    running = Scheduler::get();
    _thread::contextSwitch(&current->context, &running->context);
}

void _thread::thread_wrapper() {
    riscv::popSppSpie();
    running->body(running->args);
    running->state = 4;
}

int _thread::thread_exit() {
   running->state = 4;
   thread_dispatch();
   return 0;
}

void _thread::thread_join(thread_t handle) {

}
