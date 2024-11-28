package lib;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class DHSetup<T extends Field<T>> {
    private T generator;
    private final long characteristic;
    private final T instance;

    public DHSetup(Class<T> type) {
        try {
            this.instance = type.getDeclaredConstructor().newInstance();
            this.characteristic = instance.getCharacteristic();
        } catch (Exception e) {
            throw new RuntimeException("Error creating instance of " + type.getName(), e);
        }

        Random rd = new Random();
        List<Long> primeDivisors = calculatePrimeDivisors(characteristic - 1);

        boolean isValidGenerator = false;
        while (!isValidGenerator) {
            long candidateValue = 2 + rd.nextInt((int) (characteristic - 2));
            T candidate = instance.createInstance(candidateValue);

            isValidGenerator = true;
            for (long prime : primeDivisors) {
                T powerResult = power(candidate, (characteristic - 1) / prime);
                if (powerResult.getValue() == 1) {
                    isValidGenerator = false;
                    break;
                }
            }
            if (isValidGenerator) {
                generator = candidate;
            }
        }
    }

    public T getGenerator() {
        return generator;
    }

    public T power(T base, long exp) {
        T result = instance.createInstance(1);
        base = instance.createInstance(base.getValue());
        while (exp > 0) {
            if (exp % 2 == 1) {
                result = result.multiply(base);
            }
            base = base.multiply(base);
            exp /= 2;
        }
        return result;
    }

    private List<Long> calculatePrimeDivisors(long n) {
        List<Long> primeDivisors = new ArrayList<>();
        while (n % 2 == 0) {
            primeDivisors.add(2L);
            n /= 2;
        }
        for (long i = 3; i <= Math.sqrt(n); i += 2) {
            while (n % i == 0) {
                primeDivisors.add(i);
                n /= i;
            }
        }
        if (n > 2) {
            primeDivisors.add(n);
        }
        return primeDivisors;
    }
}
