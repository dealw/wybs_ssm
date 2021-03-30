package com.wy.DateUtil;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncoderUtils {
    private static BCryptPasswordEncoder bCryptPasswordEncoder=new BCryptPasswordEncoder();
    public static String passwordEncoder(String pass){
        return bCryptPasswordEncoder.encode(pass);
    }
    public static boolean isok(String pass,String encodepass){
        return bCryptPasswordEncoder.matches(pass,encodepass);
    }
    public static void main(String[] args) {
        System.out.println(passwordEncoder("123"));
//        System.out.println(isok("123","$2a$10$kmMUJEc52z.CfB3tmwRIvuPNCLo/0W79qoMuyTzZCVRM/1yY6xBVG"));
    }
}
