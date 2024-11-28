package lib;

public interface Field<T> {
    T add(T rhs);
    T subtract(T rhs);
    T multiply(T rhs);
    T divide(T rhs);
    T multiplicativeInverse();
    long getValue();
    long getCharacteristic();
    T createInstance(long value);
}
