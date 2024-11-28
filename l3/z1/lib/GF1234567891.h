#ifndef GF1234567891_H
#define GF1234567891_H

#include <iostream>
#include <stdexcept>

class GF1234567891 {
private:
    long value;
    static const long CHARACTERISTIC = 1234567891;

    static long mod(long x);
    static long multiplicativeInverse(long a);

public:
    GF1234567891(long val = 0);
    GF1234567891(const GF1234567891 &other);
    GF1234567891 &operator=(const GF1234567891 &other);

    GF1234567891 operator+(const GF1234567891 &rhs) const;
    GF1234567891 operator-(const GF1234567891 &rhs) const;
    GF1234567891 operator*(const GF1234567891 &rhs) const;
    GF1234567891 operator/(const GF1234567891 &rhs) const;

    GF1234567891 &operator+=(const GF1234567891 &rhs);
    GF1234567891 &operator-=(const GF1234567891 &rhs);
    GF1234567891 &operator*=(const GF1234567891 &rhs);
    GF1234567891 &operator/=(const GF1234567891 &rhs);

    bool operator==(const GF1234567891 &rhs) const;
    bool operator!=(const GF1234567891 &rhs) const;
    bool operator<(const GF1234567891 &rhs) const;
    bool operator<=(const GF1234567891 &rhs) const;
    bool operator>(const GF1234567891 &rhs) const;
    bool operator>=(const GF1234567891 &rhs) const;

    friend std::ostream &operator<<(std::ostream &os, const GF1234567891 &obj);
    friend std::istream &operator>>(std::istream &is, GF1234567891 &obj);

    static long getCharacteristic();
    static GF1234567891 multiplicativeInverse(const GF1234567891& a);

    GF1234567891 operator%(long mod) const;
    long getValue() const;
};

inline long GF1234567891::mod(long x) {
    return ((x % CHARACTERISTIC) + CHARACTERISTIC) % CHARACTERISTIC;
}

inline long GF1234567891::multiplicativeInverse(long a) {
    long m0 = CHARACTERISTIC, t, q;
    long x0 = 0, x1 = 1;
    long mod = CHARACTERISTIC;
    if (mod == 1) return 0;
    while (a > 1) {
        q = a / mod;
        t = mod;
        mod = a % mod;
        a = t;
        t = x0;
        x0 = x1 - q * x0;
        x1 = t;
    }
    if (x1 < 0) x1 += m0;
    return x1;
}

inline GF1234567891::GF1234567891(long val) : value(mod(val)) {}

inline GF1234567891::GF1234567891(const GF1234567891 &other) : value(other.value) {}

inline GF1234567891 &GF1234567891::operator=(const GF1234567891 &other) {
    value = other.value;
    return *this;
}

inline GF1234567891 GF1234567891::operator+(const GF1234567891 &rhs) const {
    return GF1234567891(mod(value + rhs.value));
}

inline GF1234567891 GF1234567891::operator-(const GF1234567891 &rhs) const {
    return GF1234567891(mod(value - rhs.value));
}

inline GF1234567891 GF1234567891::operator*(const GF1234567891 &rhs) const {
    return GF1234567891(mod(value * rhs.value));
}

inline GF1234567891 GF1234567891::operator/(const GF1234567891 &rhs) const {
    if (rhs.value == 0) {
        throw std::runtime_error("Division by zero is not defined.");
    }
    return (*this) * GF1234567891(multiplicativeInverse(rhs.value));
}

inline GF1234567891 &GF1234567891::operator+=(const GF1234567891 &rhs) {
    value = mod(value + rhs.value);
    return *this;
}

inline GF1234567891 &GF1234567891::operator-=(const GF1234567891 &rhs) {
    value = mod(value - rhs.value);
    return *this;
}

inline GF1234567891 &GF1234567891::operator*=(const GF1234567891 &rhs) {
    value = mod(value * rhs.value);
    return *this;
}

inline GF1234567891 &GF1234567891::operator/=(const GF1234567891 &rhs) {
    (*this) = (*this) / rhs;
    return *this;
}

inline bool GF1234567891::operator==(const GF1234567891 &rhs) const {
    return value == rhs.value;
}

inline bool GF1234567891::operator!=(const GF1234567891 &rhs) const {
    return !(*this == rhs);
}

inline bool GF1234567891::operator<(const GF1234567891 &rhs) const {
    return value < rhs.value;
}

inline bool GF1234567891::operator<=(const GF1234567891 &rhs) const {
    return value <= rhs.value;
}

inline bool GF1234567891::operator>(const GF1234567891 &rhs) const {
    return value > rhs.value;
}

inline bool GF1234567891::operator>=(const GF1234567891 &rhs) const {
    return value >= rhs.value;
}

inline std::ostream &operator<<(std::ostream &os, const GF1234567891 &obj) {
    os << obj.value;
    return os;
}

inline std::istream &operator>>(std::istream &is, GF1234567891 &obj) {
    long input;
    is >> input;
    obj.value = GF1234567891::mod(input);
    return is;
}

inline long GF1234567891::getCharacteristic() {
    return CHARACTERISTIC;
}

inline GF1234567891 GF1234567891::multiplicativeInverse(const GF1234567891& a) {
    return GF1234567891(multiplicativeInverse(a.value));
}

inline GF1234567891 GF1234567891::operator%(long mod) const {
    return GF1234567891(value % mod);
}

inline long GF1234567891::getValue() const {
    return value;
}

#endif
