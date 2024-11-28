import lib.DHSetup;
import lib.GF1234567891;
import lib.User;

public class Main {
    public static void main(String[] args) {
        DHSetup<GF1234567891> setup = new DHSetup<>(GF1234567891.class);

        User<GF1234567891> user1 = new User<>(setup, GF1234567891.class);
        User<GF1234567891> user2 = new User<>(setup, GF1234567891.class);

        GF1234567891 message = new GF1234567891(1234567890);
        GF1234567891 encryptedMessage = user1.encrypt(message, user2);
        GF1234567891 decryptedMessage = user2.decrypt(encryptedMessage);

        System.out.println("Original message: " + message);
        System.out.println("Encrypted message: " + encryptedMessage);
        System.out.println("Decrypted message: " + decryptedMessage);
    }
}
