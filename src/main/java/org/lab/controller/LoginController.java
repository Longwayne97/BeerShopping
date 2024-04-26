package org.lab.controller;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.lab.dao.TaiKhoanDAO;
import org.lab.model.TaiKhoan;
import org.lab.service.CookieUtils;
import org.lab.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Random;

@Controller
public class LoginController {
    @Autowired
    CookieUtils cookieUtils;

    @Autowired
    TaiKhoanDAO dao;

    @Autowired
    HttpSession session;

    @Autowired
    HttpServletRequest req;

    @Autowired
    MailService mailService;

    int OTP;




    @RequestMapping(value="/login",method = RequestMethod.GET)
    public String login(@ModelAttribute("taikhoan") TaiKhoan taiKhoan,Model model){
        session.removeAttribute("logInTK");
        model.addAttribute("tenTK",cookieUtils.get("tenTK"));
        model.addAttribute("passTK",cookieUtils.get("passTK"));
        return "login";
    }

    @PostMapping("/login/on")
    public String login_on(@ModelAttribute("taikhoan") TaiKhoan taiKhoan, @RequestParam("tenTK") String user,
                           @RequestParam("passTK") String pass,Model model){
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        try {
            taiKhoan = dao.findById(user).get();
            boolean check = Boolean.parseBoolean(req.getParameter("check"));
            if (!check) {
                cookieUtils.create("tenTK", user, 1);
                cookieUtils.create("passTK", pass, 1);
                model.addAttribute("tenTK", cookieUtils.get("tenTK"));
                model.addAttribute("passTK", cookieUtils.get("passTK"));
            } else {
                cookieUtils.remove("tenTK");
                cookieUtils.remove("passTK");
            }
            if (user.equals(taiKhoan.getTenTK()) && passwordEncoder.matches(pass,taiKhoan.getPassTK())) {
                session.setAttribute("logInTK", taiKhoan);
                return "redirect:/index";
            } else {
                model.addAttribute("error", "Đăng nhập không thành công");
                return "login";
            }
        }catch (Exception e){
            model.addAttribute("error", "Đăng nhập không thành công");
            return "login";
        }

    }

    @RequestMapping("/forgot-password")
    public String forgotPassView(){
        return "forgotpassword";
    }


    @RequestMapping("/forgot-password/change")
    public String forgotPass(@RequestParam("email") String email, Model model, RedirectAttributes ra) throws MessagingException {
        Random ran = new Random();
        TaiKhoan tk = dao.findByEmail(email);
        if(tk != null){
            int otpvalue = ran.nextInt(900000);
            mailService.send(
                    tk.getEmailTK(),
                    "Lấy lại mật khẩu",
                    "OTP là : " +otpvalue
            );
            OTP = otpvalue;
            session.setAttribute("otp",OTP);
            ra.addFlashAttribute("success","OTP được gửi trong email");
            System.out.println(OTP);
            return "redirect:/verify/"+tk.getTenTK();
        }else{
            model.addAttribute("error","Email chưa được đăng kí");
        }
        return "forgotpassword";
    }

    @RequestMapping("/verify/{account}")
    private String get_OTP(@PathVariable String account){
        TaiKhoan tk = dao.findById(account).get();
        return "verify";
    }

    @RequestMapping("/verify/{account}/success")
    private String OTP_success(@PathVariable String account,@RequestParam("otp") String otpvalue,RedirectAttributes ra){
        TaiKhoan tk = dao.findById(account).get();
        if(otpvalue.equals(String.valueOf(OTP))){
            return "redirect:/resetpassword/"+tk.getTenTK();
        }else{
            ra.addFlashAttribute("error","Sai OTP");
            return "redirect:/verify/"+tk.getTenTK();
        }

    }

    @RequestMapping("/resetpassword/{account}")
    private String password_reset(@PathVariable String account){
        TaiKhoan tk = dao.findById(account).get();
        return "resetpassword";
    }

    @RequestMapping("/resetpassword/{account}/success")
    private String password_resetsuccess(@PathVariable String account,@RequestParam("newPass") String newPass,
                                         @RequestParam("confirmPass") String confirmPass,Model model, RedirectAttributes ra){
        TaiKhoan tk = dao.findById(account).get();
        if(confirmPass.equals(newPass)){
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String encrypt = passwordEncoder.encode(confirmPass);
            tk.setPassTK(encrypt);
            dao.save(tk);
            ra.addFlashAttribute("success","Lấy lại mật khẩu thành công");
            return "redirect:/login";
        }else{
            model.addAttribute("error","Xác nhận mật khẩu không chính xác");
            return "resetpassword";
        }

    }



}
