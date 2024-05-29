#ifndef PROJECT_BASE_V1_1_SCHEDULER_HPP
#define PROJECT_BASE_V1_1_SCHEDULER_HPP
#include "list.hpp"

class _thread;

class Scheduler{
private:
    static List<_thread> threads;
public:
    static _thread *get();

    static void put(_thread *ccb);

    static bool empty() {
        return threads.empty();
    }
};
#endif //PROJECT_BASE_V1_1_SCHEDULER_HPP
