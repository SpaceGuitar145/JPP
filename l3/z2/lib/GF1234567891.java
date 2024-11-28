package lib;

import java.util.Objects;

public class GF1234567891 implements Field<GF1234567891> {
    protected long value;
    private static final long CHARACTERISTIC = 1234567891;

    public GF1234567891() {
        this.value = 0;
    }

    public GF1234567891(long val) {
        this.value = ((val % CHARACTERISTIC) + CHARACTERISTIC) % CHARACTERISTIC;
    }

    public GF1234567891(GF1234567891 other) {
        this.value = other.value;
    }

    private static long mod(long x)
    {
        return ((x % CHARACTERISTIC) + CHARACTERISTIC) % CHARACTERISTIC;
    }

    @Override
    public long getCharacteristic() {
        return CHARACTERISTIC;
    }

    @Override
    public long getValue() {
        return value;
    }

    private static long multiplicativeInverse(long a) {
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

    @Override
    public GF1234567891 add(GF1234567891 rhs) {
        return new GF1234567891(mod(value + rhs.value));
    }

    @Override
    public GF1234567891 subtract(GF1234567891 rhs) {
        return new GF1234567891(mod(value - rhs.value));
    }

    @Override
    public GF1234567891 multiply(GF1234567891 rhs) {
        return new GF1234567891(mod(value * rhs.value));
    }

    @Override
    public GF1234567891 divide(GF1234567891 rhs) {
        if (rhs.value == 0) {
            throw new ArithmeticException("Division by zero is not defined.");
        }
        return multiply(new GF1234567891(multiplicativeInverse(rhs.value)));
    }

    @Override
    public GF1234567891 multiplicativeInverse() {
        return new GF1234567891(multiplicativeInverse(value));
    }

    @Override
    public GF1234567891 createInstance(long value) {
        return new GF1234567891(value);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GF1234567891 that = (GF1234567891) o;
        return value == that.value;
    }

    @Override
    public int hashCode() {
        return Objects.hash(value);
    }

    @Override
    public String toString() {
        return String.valueOf(value);
    }
}
