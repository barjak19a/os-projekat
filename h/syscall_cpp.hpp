#ifndef PROJEKATOS_SYSCALL_CPP_HPP
#define PROJEKATOS_SYSCALL_CPP_HPP

#include "../lib/hw.h"
#include "../h/syscall_c.hpp"

void* operator new(size_t);
void  operator delete(void*);

class _thread;
typedef _thread* thread_t;

class _sem;
typedef _sem* sem_t;

class Thread {
public:
    Thread(void (*body)(void*), void* arg);
    virtual ~Thread();
    static void dispatch();
    int start();
    static int sleep(time_t);
protected:
    Thread();
    virtual void run() {}
private:
    friend class _thread;
    thread_t myHandle;
};
class Semaphore {
public:
    Semaphore(unsigned init = 1);

    virtual ~Semaphore();
    int signal();
    int wait();
private:
    sem_t myHandle;
};

class PeriodicThread : public Thread {
protected:
    PeriodicThread(time_t period);
    virtual void periodicActivation() {}
};
class Console {
public:
    static char getc();
    static void putc(char);
};

#endif //PROJEKATOS_SYSCALL_CPP_HPP
