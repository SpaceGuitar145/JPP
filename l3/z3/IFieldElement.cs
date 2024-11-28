public interface IFieldElement<T>
{
    T Value { get; }
    IFieldElement<T> Add(IFieldElement<T> rhs);
    IFieldElement<T> Subtract(IFieldElement<T> rhs);
    IFieldElement<T> Multiply(IFieldElement<T> rhs);
    IFieldElement<T> Divide(IFieldElement<T> rhs);
    long GetCharacteristic();
    long ToLong();
}
