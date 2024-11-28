class GF1234577:
    CHARACTERISTIC = 1234577

    def __init__(self, value=0):
        self.value = self.mod(value)

    @staticmethod
    def mod(x):
        return (x % GF1234577.CHARACTERISTIC + GF1234577.CHARACTERISTIC) % GF1234577.CHARACTERISTIC

    @staticmethod
    def multiplicative_inverse(a):
        x0, x1 = 0, 1
        b = GF1234577.CHARACTERISTIC
        while b != 0:
            q = a // b
            a, b = b, a % b
            x0, x1 = x1 - q * x0, x0
        if a != 1:
            raise ValueError("Inverse does not exist.")
        return GF1234577.mod(x1)

    def __add__(self, other):
        return GF1234577(self.mod(self.value + other.value))

    def __sub__(self, other):
        return GF1234577(self.mod(self.value - other.value))

    def __mul__(self, other):
        return GF1234577(self.mod(self.value * other.value))

    def __truediv__(self, other):
        if other.value == 0:
            raise ZeroDivisionError("Division by zero is not defined.")
        return self * GF1234577(self.multiplicative_inverse(other.value))

    def __iadd__(self, other):
        self.value = self.mod(self.value + other.value)
        return self

    def __isub__(self, other):
        self.value = self.mod(self.value - other.value)
        return self

    def __imul__(self, other):
        self.value = self.mod(self.value * other.value)
        return self

    def __idiv__(self, other):
        return self.__itruediv__(other)

    def __itruediv__(self, other):
        self.value = (self / other).value
        return self

    def __eq__(self, other):
        return self.value == other.value

    def __ne__(self, other):
        return not self.__eq__(other)

    def __lt__(self, other):
        return self.value < other.value

    def __le__(self, other):
        return self.value <= other.value

    def __gt__(self, other):
        return self.value > other.value

    def __ge__(self, other):
        return self.value >= other.value

    def __repr__(self):
        return str(self.value)

def main():
    a = GF1234577(10)
    b = GF1234577(20)
    print("a + b =", a + b)
    print("a - b =", a - b)
    print("a * b =", a * b)
    print("a / b =", a / b)
    print("a == b =", a == b)
    print("a != b =", a != b)
    print("a < b =", a < b)
    print("a <= b =", a <= b)
    print("a > b =", a > b)
    print("a >= b =", a >= b)
    c = GF1234577(5)
    d = GF1234577(0)
    print("c / d =", c / d)

if __name__ == "__main__":
    main()
