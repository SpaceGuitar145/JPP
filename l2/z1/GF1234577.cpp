#include <iostream>
#include <stdexcept>

class GF1234577
{
private:
    long value;
    static const long CHARACTERISTIC = 1234577;

    static long mod(long x)
    {
        return ((x % CHARACTERISTIC) + CHARACTERISTIC) % CHARACTERISTIC;
    }

    static long multiplicativeInverse(long a)
    {
        long x0 = 0, x1 = 1, temp;
        long b = CHARACTERISTIC;

        while (b != 0)
        {
            long q = a / b;
            long r = a % b;

            a = b;
            b = r;

            temp = x0;
            x0 = x1 - q * x0;
            x1 = temp;
        }

        if (a != 1)
        {
            throw std::runtime_error("Inverse does not exist.");
        }

        return mod(x1);
    }

public:
    GF1234577(long val = 0) : value(mod(val)) {}

    GF1234577(const GF1234577 &other) : value(other.value) {}

    GF1234577 &operator=(const GF1234577 &other)
    {
        value = other.value;
        return *this;
    }

    GF1234577 operator+(const GF1234577 &rhs) const
    {
        return GF1234577(mod(value + rhs.value));
    }

    GF1234577 operator-(const GF1234577 &rhs) const
    {
        return GF1234577(mod(value - rhs.value));
    }

    GF1234577 operator*(const GF1234577 &rhs) const
    {
        return GF1234577(mod(value * rhs.value));
    }

    GF1234577 operator/(const GF1234577 &rhs) const
    {
        if (rhs.value == 0)
        {
            throw std::runtime_error("Division by zero is not defined.");
        }
        return (*this) * GF1234577(multiplicativeInverse(rhs.value));
    }

    GF1234577 &operator+=(const GF1234577 &rhs)
    {
        value = mod(value + rhs.value);
        return *this;
    }

    GF1234577 &operator-=(const GF1234577 &rhs)
    {
        value = mod(value - rhs.value);
        return *this;
    }

    GF1234577 &operator*=(const GF1234577 &rhs)
    {
        value = mod(value * rhs.value);
        return *this;
    }

    GF1234577 &operator/=(const GF1234577 &rhs)
    {
        (*this) = (*this) / rhs;
        return *this;
    }

    bool operator==(const GF1234577 &rhs) const
    {
        return value == rhs.value;
    }

    bool operator!=(const GF1234577 &rhs) const
    {
        return !(*this == rhs);
    }

    bool operator<(const GF1234577 &rhs) const
    {
        return value < rhs.value;
    }

    bool operator<=(const GF1234577 &rhs) const
    {
        return value <= rhs.value;
    }

    bool operator>(const GF1234577 &rhs) const
    {
        return value > rhs.value;
    }

    bool operator>=(const GF1234577 &rhs) const
    {
        return value >= rhs.value;
    }

    friend std::ostream &operator<<(std::ostream &os, const GF1234577 &obj)
    {
        os << obj.value;
        return os;
    }
};

int main()
{
    GF1234577 a(10), b(20);
    std::cout << "a + b = " << (a + b) << std::endl;
    std::cout << "a - b = " << (a - b) << std::endl;
    std::cout << "a * b = " << (a * b) << std::endl;
    std::cout << "a / b = " << (a / b) << std::endl;
    std::cout << "a == b = " << (a == b) << std::endl;
    std::cout << "a != b = " << (a != b) << std::endl;
    std::cout << "a < b = " << (a < b) << std::endl;
    std::cout << "a <= b = " << (a <= b) << std::endl;
    std::cout << "a > b = " << (a > b) << std::endl;
    std::cout << "a >= b = " << (a >= b) << std::endl;
    GF1234577 c(5), d(0);
    std::cout << "c / d = " << (c / d) << std::endl;

    return 0;
}