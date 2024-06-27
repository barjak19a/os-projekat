#ifndef PROJEC_thread_BASE_V1_1_LIS_thread_HPP
#define PROJEC_thread_BASE_V1_1_LIS_thread_HPP

class _thread;

template<typename T>
class List {
private:
    static int constexpr DEFAULT_SIZE = 1000;
    int front;
    int back;
    T* elements[DEFAULT_SIZE];
public:
    T* get() {
        if (front == back) return nullptr;
        T* ret = elements[front];
        front = (front + 1) % DEFAULT_SIZE;
        return ret;
    }
    void put(T* t) {
        elements[back] = t;
        back = (back + 1) % DEFAULT_SIZE;
    }
    bool empty() {
        return front == back;
    }
};

#endif //PROJEC_thread_BASE_V1_1_LIS_thread_HPP
