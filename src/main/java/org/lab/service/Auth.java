package org.lab.service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.lab.model.TaiKhoan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import java.io.IOException;

@Service
public class Auth implements HandlerInterceptor {

    @Autowired
    SessionService sessionService;

    @Override
    public boolean preHandle (HttpServletRequest req, HttpServletResponse resp, Object handler) throws IOException {

        String uri = req.getRequestURI();
        TaiKhoan tk = sessionService.get("logInTK");

        String error = "";
        if(tk==null){
            error = "loginerror";
            resp.sendRedirect("/login?error="+error);
            return false;
        }else if(tk == null && uri.contains("/info/")){
            error = "loginerror";
            resp.sendRedirect("/login?error="+error);
            return false;
        }else if(tk!=null&&!tk.isRoleKhachHang()&& uri.contains("/admin/")){
            error = "accesdenied";
            resp.sendRedirect("/index?error="+error);
            return false;
        }
        return true;

    }



}
