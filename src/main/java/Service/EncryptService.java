package Service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptService {
    private static EncryptService service;

    public static EncryptService getInstance() {
        if (service == null) service = new EncryptService();
        return service;
    }
    public String encryptMd5(String password) {
        String hash = "MaNdifksgkjsdngHagl0128379lkjs@.";
        password = hash + password;

        try {
            MessageDigest md = MessageDigest.getInstance("Md5");
            byte[] b = md.digest(password.getBytes());
            BigInteger bigInt = new BigInteger(1,b);
            return bigInt.toString(16);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        System.out.println(EncryptService.getInstance().encryptMd5("123456"));
    }
}
