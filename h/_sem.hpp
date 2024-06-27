#ifndef PROJECT_BASE_V1_1__SEM_HPP
#define PROJECT_BASE_V1_1__SEM_HPP

#include "../h/_thread.hpp"

class _sem {
public:
    _sem(int init) {
        count = init;
    }

    static int sem_open(sem_t *handle, int init);

    static int sem_close(sem_t handle);

    int wait();

    int signal();

    int trywait();

private:
    static int constexpr DEFAULT_SIZE = 500;
    int count;
    thread_t waiting[DEFAULT_SIZE];
    int front;
    int back;
};


#endif //OS_LEVI__SEM_HPP
