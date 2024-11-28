using System;

class Program
{
    static void Main()
    {
        DHSetup<GF1234567891> dhSetup = new DHSetup<GF1234567891>();
        User<GF1234567891> user1 = new User<GF1234567891>(dhSetup);
        User<GF1234567891> user2 = new User<GF1234567891>(dhSetup);

        GF1234567891 message = new GF1234567891(1234777764);
        GF1234567891 encryptedMessage = user1.Encrypt(message, user2);
        GF1234567891 decryptedMessage = user2.Decrypt(encryptedMessage);

        Console.WriteLine("Original message: " + message);
        Console.WriteLine("Encrypted message: " + encryptedMessage);
        Console.WriteLine("Decrypted message: " + decryptedMessage);
    }
}
