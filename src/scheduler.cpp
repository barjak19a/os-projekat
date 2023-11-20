//
// Created by os on 8/18/23.
//
#include "../h/scheduler.hpp"

List<_thread>Scheduler::readyCoroutineQueue;

_thread *Scheduler::get() {
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(_thread *tcb) {
    readyCoroutineQueue.addLast(tcb);
}