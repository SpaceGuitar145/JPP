#ifndef DHSETUP_H
#define DHSETUP_H

#include <random>
#include <vector>
#include <cmath>

std::vector<long> calculatePrimeDivisors(long n) {
    std::vector<long> primeDivisors;
    while (n % 2 == 0) {
        primeDivisors.push_back(2);
        n /= 2;
    }
    for (long i = 3; i <= std::sqrt(n); i += 2) {
        while (n % i == 0) {
            primeDivisors.push_back(i);
            n /= i;
        }
    }
    if (n > 2) {
        primeDivisors.push_back(n);
    }
    return primeDivisors;
}

template<typename T>
class DHSetup {
private:
    T generator;

public:
    DHSetup();
    T getGenerator() const;
    T power(T base, unsigned long exp) const;
};

template<typename T>
DHSetup<T>::DHSetup() {
    std::random_device rd;
    std::mt19937 gen(rd());
    auto primeDivisors = calculatePrimeDivisors(T::getCharacteristic() - 1);

    bool isValidGenerator = false;

    while (!isValidGenerator) {
        std::uniform_int_distribution<long> dis(2, T::getCharacteristic() - 2);
        T candidate(dis(gen));

        isValidGenerator = true;
        for (const auto& prime : primeDivisors) {
            if (power(candidate, (T::getCharacteristic() - 1) / prime).getValue() == 1) {
                isValidGenerator = false;
                break;
            }
        }
        if (isValidGenerator) {
            generator = candidate;
        }
    }
}

template<typename T>
T DHSetup<T>::getGenerator() const {
    return generator;
}

template<typename T>
T DHSetup<T>::power(T base, unsigned long exp) const {
    T result(1);
    base = T(base.getValue());
    while (exp > 0) {
        if (exp % 2 == 1) {
            result = (result * base);
        }
        base = (base * base);
        exp /= 2;
    }
    return result;
}

#endif
