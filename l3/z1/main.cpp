#include <iostream>
#include "lib/GF1234567891.h"
#include "lib/DHSetup.h"
#include "lib/User.h"

int main() {
    DHSetup<GF1234567891> setup;

    User<GF1234567891> user1(setup);
    User<GF1234567891> user2(setup);

    GF1234567891 message(1234567);
    GF1234567891 encryptedMessage = user1.encrypt(message, user2);
    GF1234567891 decryptedMessage = user2.decrypt(encryptedMessage);

    std::cout << "Original message: " << message << std::endl;
    std::cout << "Encrypted message: " << encryptedMessage << std::endl;
    std::cout << "Decrypted message: " << decryptedMessage << std::endl;

    return 0;
}
