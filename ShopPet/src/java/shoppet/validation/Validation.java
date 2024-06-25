/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.validation;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
/**
 *
 * @author nhutm
 */
public class Validation {
    public static String encoded(String str){
        Base64.Encoder base64Encoder = Base64.getEncoder();
        String encodedString = base64Encoder.encodeToString(str.getBytes());
        return encodedString;
    }
    public static String decoded(String str){
        Base64.Decoder base64Decoder = Base64.getDecoder();
        String decodedString = new String(base64Decoder.decode(str.getBytes()));
        return decodedString;
    }
    public static String getCodeVerify(){
        Random random = new Random();
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 8; i++) {
            int index = random.nextInt(characters.length());
            sb.append(characters.charAt(index));
        }
        return sb.toString();
    }
    public static List<String> sortCategory(HashSet<String> categoryList){ 
         List<String> resultList = new ArrayList<>(categoryList);
         Collections.sort(resultList);
         return resultList;
    }
    public static boolean validateSearch(String search){    
        boolean result = false;
        if(search.matches("^[a-zA-Z0-9\\s]+$")) result = true;
        return result;
    }
}
