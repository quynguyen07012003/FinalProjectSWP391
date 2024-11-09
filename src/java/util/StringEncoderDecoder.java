
package util;

import java.util.Base64;

public class StringEncoderDecoder {

    // Mã hóa chuỗi bằng Base64
    public static String encode(String input) {
        return Base64.getEncoder().encodeToString(input.getBytes());
    }

    // Giải mã chuỗi từ Base64 về chuỗi gốc
    public static String decode(String encodedString) {
        byte[] decodedBytes = Base64.getDecoder().decode(encodedString);
        return new String(decodedBytes);
    }
}