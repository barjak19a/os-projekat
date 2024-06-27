#include "../h/_thread.hpp"
#include "../h/riscv.hpp"
#include "../h/_sem.hpp"
#include "../h/scheduler.hpp"

_thread *_thread::running = nullptr;
int _thread::idCounter = 0;
_sem* _thread::max_threads = nullptr;

int _thread::thread_create(_thread **handle, _thread::Body body, void *args, void *stackSpace) {
    *handle = new _thread(body, args, stackSpace);
    _sem::sem_open(&(*handle)->joinSem, 0);
    if (body != nullptr) {
        _thread::running->add_child(*handle);
        Scheduler::put(*handle);
    } else {
        _thread::running = *handle;
    }
    return 0;
}


void _thread::thread_dispatch() {
    if (Scheduler::empty()) return;
    _thread *current = running;
    if (current->state == RUNNABLE) {
        Scheduler::put(current);
    } else if (current->state == TERMINATED) {
        mem_free(current->stack);
    }
    running = Scheduler::get();
    if (riscv::setjump()) {
        _thread::contextSwitch(&current->context, &running->context);
        riscv::longjump();
    }
}

void _thread::thread_wrapper() {
    _thread::max_threads->wait();
    riscv::popSppSpie();
    running->body(running->args);
    ::thread_exit();
}

void _thread::thread_exit() {
    _thread::max_threads->signal();
    _sem::sem_close(running->joinSem);
    running->state = TERMINATED;
    _thread::thread_dispatch();
}

void _thread::thread_join() {
    if (state != TERMINATED) {
        joinSem->wait();
    }
}

_thread::_thread(_thread::Body body, void *args, void *stackSpace) {
    this->id = idCounter++;
    this->body = body;
    this->args = args;
    if (body != nullptr) {
        this->stack = (uint64 *) stackSpace;
        this->context.ra = (uint64) &thread_wrapper;
        this->context.sp = (uint64) &stack[DEFAULT_STACK_SIZE - 16];
    }
    this->state = RUNNABLE;
    this->timeSlice = DEFAULT_TIME_SLICE;

}

int _thread::getId() {
    return this->id;
}

void _thread::SetMaximumThreads(int num_of_threads) {
    sem_open(&_thread::max_threads, num_of_threads);
}

void _thread::joinAll() {
    for (int i = 0; i < _thread::running->pointer; i++) {
        _thread::running->children[i]->thread_join();
    }
}
