package Entidades;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class StringMD
{

    static public String MD2 = "MD2";
    static public String MD5  = "MD5";
    static public String SHA1  = "SHA-1";
    static public String SHA256  = "SHA-256";
    static public String SHA384  = "SHA-384";
    static public String SHA512  = "SHA-512";

    static private String toHexadecimal(byte[] digest)
    {
        String hash = "";
        for (byte aux : digest)
        {
            int b = aux & 0xff;
            if (Integer.toHexString(b).length() == 1)
            {
                hash += "0";
            }
            hash += Integer.toHexString(b);
        }
        return hash;
    }

    static public String getCadenaEncriptada(String message, String algorithm)
    {
        byte[] digest = null;
        byte[] buffer = message.getBytes();
        try
        {
            MessageDigest messageDigest = MessageDigest.getInstance(algorithm);
            messageDigest.reset();
            messageDigest.update(buffer);
            digest = messageDigest.digest();
        }
        catch (NoSuchAlgorithmException ex)
        {
            System.out.println("Error en la eleccion del Algoritmo");
        }
        return toHexadecimal(digest);
    }
}
