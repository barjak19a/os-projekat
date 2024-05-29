#include "../h/scheduler.hpp"

List<_thread> Scheduler::threads;

_thread *Scheduler::get() {
    return threads.get();
}

void Scheduler::put(_thread *tcb) {
    threads.put(tcb);
}