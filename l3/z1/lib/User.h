#ifndef USER_H
#define USER_H

#include <iostream>
#include <random>
#include "DHSetup.h"

template<typename T>
class User {
private:
    T publicKey;
    T secretKey;
    T sharedSecret;
    DHSetup<T>& setup;
    bool keySet = false;

public:
    User(DHSetup<T>& dhSetup);
    T getPublicKey() const;
    void setKey(T a);
    void fetchKeys(User<T>& otherUser);
    T encrypt(T m, User<T>& otherUser);
    T decrypt(T c);
};

template<typename T>
User<T>::User(DHSetup<T>& dhSetup) : setup(dhSetup) {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<long> dis(1, 100); 
    secretKey = T(dis(gen));
    publicKey = setup.power(setup.getGenerator(), secretKey.getValue());
}

template<typename T>
T User<T>::getPublicKey() const {
    return publicKey;
}

template<typename T>
void User<T>::setKey(T a) {
    sharedSecret = setup.power(a, secretKey.getValue());
    keySet = true;
}

template<typename T>
void User<T>::fetchKeys(User<T>& otherUser) {
    otherUser.setKey(this->publicKey);
    this->setKey(otherUser.getPublicKey());
}

template<typename T>
T User<T>::encrypt(T m, User<T>& otherUser) {
    if (!keySet) {
        fetchKeys(otherUser);
    }
    return (m * sharedSecret);
}

template<typename T>
T User<T>::decrypt(T c) {
    if (!keySet) throw std::runtime_error("Decryption key has not been set.");
    T inverse = T::multiplicativeInverse(sharedSecret);
    return (c * inverse);
}

#endif // USER_H
