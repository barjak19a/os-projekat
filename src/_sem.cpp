#include "../h/_sem.hpp"
#include "../h/scheduler.hpp"

int _sem::sem_open(sem_t *handle, int init) {
    sem_t sem = (sem_t) mem_alloc(sizeof(_sem));
    sem->count = init;
    sem->front = 0;
    sem->back = 0;
    *handle = sem;
    return 0;
}

int _sem::wait() {
    count--;
    if (count < 0) {
        waiting[back] = _thread::running;
        back = (back + 1) % DEFAULT_SIZE;
        _thread::running->setState(_thread::BLOCKED);
        _thread::thread_dispatch();
    }
    return 0;
}

int _sem::signal() {
    count++;
    if (count <= 0) {
        _thread *thread = waiting[front];
        front = (front + 1) % DEFAULT_SIZE;
        thread->setState(_thread::RUNNABLE);
        Scheduler::put(thread);
    }
    return 0;
}

int _sem::trywait() {
    if (count <= 0) {
        return 1;
    } else {
        count--;
        return 0;
    }
}

int _sem::sem_close(sem_t handle) {
    while(handle->front != handle->back) {
        _thread *thread = handle->waiting[handle->front];
        handle->front = (handle->front + 1) % DEFAULT_SIZE;
        thread->setState(_thread::RUNNABLE);
        Scheduler::put(thread);
    }
    mem_free(handle);
    return 0;
}

