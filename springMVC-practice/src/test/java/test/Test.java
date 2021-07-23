package test;

public class Test {
/* 
    public static void main(String[] argv) {
        String plainText = hash("687190424", "7070933796");

        System.out.print(plainText);
    }

    private static String hash(String subscriberAccount, String serialNumber) {
        int length1 = subscriberAccount.length();
        int length2 = serialNumber.length();
        String rawString = subscriberAccount + length1 + length2 + serialNumber;
        return cryptWithMD5(rawString);
    }

    private static String cryptWithMD5(String pwdStr) {
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("MD5");
            md.reset();
            byte[] passBytes = pwdStr.getBytes();

            byte[] digest = md.digest(passBytes);

            BASE64Encoder encoder = new BASE64Encoder();
            return encoder.encode(digest);
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    */
}
