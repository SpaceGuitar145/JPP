using System;

public class User<T> where T : IFieldElement<long>, new()
{
    private DHSetup<T> dhSetup;
    private T secret;
    private T? key;
    private T publicKey;

    public User(DHSetup<T> setup)
    {
        this.dhSetup = setup;
        Random random = new Random();
        this.secret = GenerateNonZeroElement(random) ?? throw new InvalidOperationException("Failed to generate a non-zero element");
        this.publicKey = dhSetup.Power(dhSetup.GetGenerator(), secret.ToLong());
    }

    private T GenerateNonZeroElement(Random random)
    {
        T element;
        do
        {
            element = (T)Activator.CreateInstance(typeof(T), random.Next(1, 100))!;
        } while (element.Value == 0);
        return element;
    }

    public T GetPublicKey()
    {
        return this.publicKey;
    }

    public void SetKey(T otherPublicKey)
    {
        this.key = dhSetup.Power(otherPublicKey, secret.ToLong());
    }

    public T Encrypt(T message, User<T> otherUser)
    {
        if (this.key == null)
        {
            FetchKeys(otherUser);
        }
        return (T)message.Multiply(this.key!);
    }

    public T Decrypt(T ciphertext)
    {
        if (this.key == null) throw new InvalidOperationException("Key not set.");
        return (T)ciphertext.Divide(this.key);
    }

    public void FetchKeys(User<T> otherUser)
    {
        this.SetKey(otherUser.GetPublicKey());
        otherUser.SetKey(this.GetPublicKey());
    }
}
