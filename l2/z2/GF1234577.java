public class GF1234577 {
    private long value;
    private static final long CHARACTERISTIC = 1234577;

    public GF1234577(long value) {
        this.value = mod(value);
    }

    private static long mod(long x) {
        return ((x % CHARACTERISTIC) + CHARACTERISTIC) % CHARACTERISTIC;
    }

    private static long multiplicativeInverse(long a) {
        long x0 = 0, x1 = 1, temp;
        long b = CHARACTERISTIC;

        while (b != 0) {
            long q = a / b;
            long r = a % b;
            a = b;
            b = r;

            temp = x0;
            x0 = x1 - q * x0;
            x1 = temp;
        }

        if (a != 1) {
            throw new ArithmeticException("Inverse does not exist.");
        } else {
            return mod(x1);
        }
    }

    public GF1234577 add(GF1234577 rhs) {
        return new GF1234577(mod(this.value + rhs.value));
    }

    public GF1234577 subtract(GF1234577 rhs) {
        return new GF1234577(mod(this.value - rhs.value));
    }

    public GF1234577 multiply(GF1234577 rhs) {
        return new GF1234577(mod(this.value * rhs.value));
    }

    public GF1234577 divide(GF1234577 rhs) {
        if (rhs.value == 0) {
            throw new ArithmeticException("Division by zero is not defined.");
        }
        long inverse = multiplicativeInverse(rhs.value);
        return this.multiply(new GF1234577(inverse));
    }

    public boolean equals(GF1234577 rhs) {
        return this.value == rhs.value;
    }

    public boolean notEquals(GF1234577 rhs) {
        return this.value != rhs.value;
    }

    public boolean lessThan(GF1234577 rhs) {
        return this.value < rhs.value;
    }

    public boolean lessThanOrEqualTo(GF1234577 rhs) {
        return this.value <= rhs.value;
    }

    public boolean greaterThan(GF1234577 rhs) {
        return this.value > rhs.value;
    }

    public boolean greaterThanOrEqualTo(GF1234577 rhs) {
        return this.value >= rhs.value;
    }

    @Override
    public String toString() {
        return Long.toString(value);
    }

    public static void main(String[] args) {
        GF1234577 a = new GF1234577(10);
        GF1234577 b = new GF1234577(20);
        System.out.println("a + b = " + a.add(b).toString());
        System.out.println("a - b = " + a.subtract(b).toString());
        System.out.println("a * b = " + a.multiply(b).toString());
        System.out.println("a / b = " + a.divide(b).toString());
        System.out.println("a == b = " + a.equals(b));
        System.out.println("a != b = " + a.notEquals(b));
        System.out.println("a < b = " + a.lessThan(b));
        System.out.println("a <= b = " + a.lessThanOrEqualTo(b));
        System.out.println("a > b = " + a.greaterThan(b));
        System.out.println("a >= b = " + a.greaterThanOrEqualTo(b));
        GF1234577 c = new GF1234577(5);
        GF1234577 d = new GF1234577(0);
        System.out.println("c / d = " + c.divide(d).toString());
    }
}
