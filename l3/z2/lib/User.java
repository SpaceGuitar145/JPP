package lib;

import java.util.Random;

public class User<T extends Field<T>> {
    private T publicKey;
    private T secretKey;
    private T sharedSecret;
    private DHSetup<T> setup;
    private boolean keySet = false;
    private final T instance;

    public User(DHSetup<T> dhSetup, Class<T> type) {
        this.setup = dhSetup;
        try {
            this.instance = type.getDeclaredConstructor().newInstance();
        } catch (Exception e) {
            throw new RuntimeException("Error creating instance of " + type.getName(), e);
        }
        
        Random rd = new Random();
        long secretValue = 1 + rd.nextInt(100);
        this.secretKey = instance.createInstance(secretValue);
        this.publicKey = setup.power(dhSetup.getGenerator(), secretKey.getValue());
    }

    public T getPublicKey() {
        return publicKey;
    }

    public void setKey(T a) {
        sharedSecret = setup.power(a, secretKey.getValue());
        keySet = true;
    }

    public void fetchKeys(User<T> otherUser) {
        otherUser.setKey(this.publicKey);
        this.setKey(otherUser.getPublicKey());
    }

    public T encrypt(T m, User<T> otherUser) {
        if (!keySet) {
            fetchKeys(otherUser);
        }
        return instance.createInstance(m.multiply(sharedSecret).getValue());
    }

    public T decrypt(T c) {
        if (!keySet) throw new RuntimeException("Decryption key has not been set.");
        T inverse = instance.createInstance(sharedSecret.multiplicativeInverse().getValue());
        return instance.createInstance(c.multiply(inverse).getValue());
    }
}
