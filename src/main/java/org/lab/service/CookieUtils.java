package org.lab.service;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CookieUtils {

    @Autowired
    HttpServletRequest req;

    @Autowired
    HttpServletResponse resp;

    public Cookie create(String name,String value, int days){
        Cookie cookie = new Cookie(name,value);
        cookie.setMaxAge(days*60*60);
        cookie.setPath("/");
        resp.addCookie(cookie);
        return cookie;
    }

    public String get(String name){
        Cookie[] cookies = req.getCookies();
        if(cookies!=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals(name)){
                    return cookie.getValue();
                }
            }
        }return null;
    }

    public Cookie remove(String name){
        Cookie[] cookies = req.getCookies();
        if(cookies!=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals(name)){
                    cookie.setMaxAge(0);
                    return cookie;
                }
            }
        }return null;
    }
}
