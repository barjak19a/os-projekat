#include "../h/_thread.hpp"
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"


void* operator new[](size_t n) {
    return MemoryAllocator::mem_alloc(n);
}

void operator delete[](void *p)  {
    MemoryAllocator::mem_free(p);
}

_thread *_thread::running = nullptr;
uint64 _thread::timeSliceCounter = 0;

_thread *_thread::createThread(Body body) {
    return new _thread(body, TIME_SLICE);
}

void _thread::setState(int state) {
    _thread::state = state;
}

int _thread::getState() const {
    return state;
}

void _thread::dispatch() {
    _thread *old = running;
    if (old->getState() == _thread::READY) { Scheduler::put(old); }
    running = Scheduler::get();
    _thread::contextSwitch(&old->context, &running->context);
}

void _thread::threadWrapper() {
    Riscv::popSppSpie();

    if(running->body){
        running->body();
    }
    else{
        running->myThread->run();
    }

    finishThread();
}


void _thread::finishThread() {
    running->setState(_thread::FINISHED);
    thread_dispatch();
}