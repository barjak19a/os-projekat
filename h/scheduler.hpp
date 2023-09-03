//
// Created by os on 8/18/23.
//

#ifndef PROJECT_BASE_V1_1_SCHEDULER_HPP
#define PROJECT_BASE_V1_1_SCHEDULER_HPP
#include "list.hpp"

class _thread;

class Scheduler{
private:
    static List<_thread> readyCoroutineQueue;
public:
    static _thread *get();

    static void put(_thread *ccb);
};
#endif //PROJECT_BASE_V1_1_SCHEDULER_HPP
