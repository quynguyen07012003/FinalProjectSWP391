/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 */
public class MD5Encryptor {

    public static String usingMd5(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest msd = MessageDigest.getInstance("MD5");
        byte[] srcTxt = password.getBytes("UTF-8");
        byte[] encrTxt = msd.digest(srcTxt);
        
        // Convert encrypted bytes to a hexadecimal string
        BigInteger bInt = new BigInteger(1, encrTxt);
        String encrPass = bInt.toString(16);
        
        // Ensure the hex string is 32 characters long (MD5 hash is always 32 hex digits)
        while (encrPass.length() < 32) {
            encrPass = "0" + encrPass;  // pad with leading zeros
        }

        return encrPass;

    }
    
    public static void main(String[] args) {
        String password = "wT$1lM8Cth";
        try {
            String hash = usingMd5(password);
            System.out.println("MD5 hash: " + hash);
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
    
}
