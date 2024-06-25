/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.cookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author nhutm
 */
public class CookieService {
     public Cookie getCookieByName(HttpServletRequest request, String cookieName){
        Cookie[] arrCookies = request.getCookies();
        if(arrCookies != null){
            for(Cookie cookie : arrCookies){
                if(cookie.getName().equals(cookieName)){
                    return cookie;
                }
            }
        }
        return null;
    }
}
