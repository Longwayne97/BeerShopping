package org.lab.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.lab.dao.TaiKhoanDAO;
import org.lab.model.TaiKhoan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

@Controller
public class SignInController {
    @Autowired
    TaiKhoanDAO dao;

    @Autowired
    HttpServletRequest req;





    @RequestMapping(value = "/signup",method = RequestMethod.GET)
    public String signin(@ModelAttribute("taikhoan") TaiKhoan tk){
        return "signup";
    }

    @RequestMapping(value = "/signup/add",method = RequestMethod.POST)
    public String add(@Valid @ModelAttribute("taikhoan") TaiKhoan tk, BindingResult result, Model model,
                      @RequestParam("xacNhanMK") String xacNhan,@RequestParam("upload-photo") MultipartFile file) {
        String gt;
        if (result.hasErrors()) {
            return "signup";
        } else if (!xacNhan.equals(tk.getPassTK())) {
            model.addAttribute("error2","Xác nhận mật khẩu sai");
            return "signup";
        }
        try {
            String uploadDir = "/imgAvarta/";
            String realPathtoUpload = req.getServletContext().getRealPath(uploadDir);
            String orgName = file.getOriginalFilename();
            String filepath = realPathtoUpload + orgName;

            File dest = new File(filepath);
            file.transferTo(dest);
            tk.setHinhTK(orgName);

            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String encrypt = passwordEncoder.encode(tk.getPassTK());
            tk.setPassTK(encrypt);

            dao.save(tk);

        }catch (Exception e){

            e.printStackTrace();
            model.addAttribute("error","Chưa upload avarta");
            model.addAttribute("error1","Đăng kí thất bại");
            return "signup";
        }

            model.addAttribute("success","Đăng kí thành công");
            return "login";

    }
    @ModelAttribute("gioiTinh")
    public Map<Boolean,String> getGT(){
        Map<Boolean,String> map =new HashMap<>();
        map.put(true,"Nam");
        map.put(false,"Nữ");
        return map;
    }
    @InitBinder
    public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locale) {
        final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", locale);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }


}
