using System;

public class GF1234567891 : IFieldElement<long>
{
    private long value;
    private static readonly long CHARACTERISTIC = 1234577;

    public long Value => value;

    public GF1234567891()
    {
        this.value = 1;
    }

    public GF1234567891(long value)
    {
        this.value = Mod(value);
    }

    private static long Mod(long x)
    {
        return ((x % CHARACTERISTIC) + CHARACTERISTIC) % CHARACTERISTIC;
    }

    private static long MultiplicativeInverse(long a)
    {
        long t = 0, newT = 1;
        long r = CHARACTERISTIC, newR = a;
        while (newR != 0)
        {
            long quotient = r / newR;
            long tempT = t - quotient * newT;
            t = newT;
            newT = tempT;
            long tempR = r - quotient * newR;
            r = newR;
            newR = tempR;
        }
        if (r > 1) throw new ArithmeticException("Inverse does not exist.");
        if (t < 0) t += CHARACTERISTIC;
        return t;
    }

    public IFieldElement<long> Add(IFieldElement<long> rhs)
    {
        return new GF1234567891(Mod(this.value + rhs.Value));
    }

    public IFieldElement<long> Subtract(IFieldElement<long> rhs)
    {
        return new GF1234567891(Mod(this.value - rhs.Value));
    }

    public IFieldElement<long> Multiply(IFieldElement<long> rhs)
    {
        return new GF1234567891(Mod(this.value * rhs.Value));
    }

    public IFieldElement<long> Divide(IFieldElement<long> rhs)
    {
        if (rhs.Value == 0)
            throw new ArithmeticException("Division by zero element.");
        return new GF1234567891(Mod(this.value * MultiplicativeInverse(rhs.Value)));
    }

    public override string ToString()
    {
        return value.ToString();
    }

    public long ToLong()
    {
        return value;
    }

    public long GetCharacteristic()
    {
        return CHARACTERISTIC;
    }
}
