using System;
using System.Collections.Generic;

public class DHSetup<T> where T : IFieldElement<long>, new()
{
    private T generator;

    public DHSetup()
    {
        Random random = new Random();
        this.generator = GenerateValidGenerator(random) ?? throw new InvalidOperationException("Failed to generate a valid generator");
    }

    private T GenerateValidGenerator(Random random)
    {
        T element;
        List<long> primeDivisors = CalculatePrimeDivisors(new T().GetCharacteristic() - 1);

        while (true)
        {
            long candidateValue = 2 + random.Next((int)(new T().GetCharacteristic() - 2));
            element = (T)Activator.CreateInstance(typeof(T), candidateValue)!;

            bool isValidGenerator = true;
            foreach (long prime in primeDivisors)
            {
                T powerResult = Power(element, (new T().GetCharacteristic() - 1) / prime);
                if (powerResult.Value == 1)
                {
                    isValidGenerator = false;
                    break;
                }
            }

            if (isValidGenerator)
            {
                return element;
            }
        }
    }

    private List<long> CalculatePrimeDivisors(long n)
    {
        List<long> primeDivisors = new List<long>();
        while (n % 2 == 0)
        {
            primeDivisors.Add(2);
            n /= 2;
        }
        for (long i = 3; i <= Math.Sqrt(n); i += 2)
        {
            while (n % i == 0)
            {
                primeDivisors.Add(i);
                n /= i;
            }
        }
        if (n > 2)
        {
            primeDivisors.Add(n);
        }
        return primeDivisors;
    }

    public T GetGenerator()
    {
        return generator;
    }

    public T Power(T a, long b)
    {
        T result = new T();
        T baseValue = a;
        while (b > 0)
        {
            if (b % 2 == 1) result = (T)result.Multiply(baseValue);
            baseValue = (T)baseValue.Multiply(baseValue);
            b /= 2;
        }
        return result;
    }
}
