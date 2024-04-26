package org.lab.controller;

import jakarta.servlet.http.HttpSession;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.hibernate.mapping.TableOwner;
import org.lab.dao.DonHangDAO;
import org.lab.dao.TaiKhoanDAO;
import org.lab.model.DonHang;
import org.lab.model.TaiKhoan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class InfoController {

    @Autowired
    TaiKhoanDAO dao;

    @Autowired
    DonHangDAO donHangDAO ;

    @Autowired
    HttpSession session;

    @GetMapping("/info")
    public String info(@ModelAttribute("tk")TaiKhoan taiKhoan,Model model){
        taiKhoan = (TaiKhoan) session.getAttribute("logInTK");
        List<DonHang> listDH = donHangDAO.getListDH(taiKhoan.getTenTK());
        System.out.println(listDH);
        model.addAttribute("listDH",listDH);
        return "info";
    }

    @GetMapping("/info/update/{id}")
    public String info_find(Model model,@PathVariable("id")String id){
        TaiKhoan tk = dao.findById(id).get();
        model.addAttribute("tk",tk);
        return "changeinfo";
    }

    @GetMapping("/info/updatepassword")
    public String info_pass(Model model){
        return "changepassword";
    }

    @PostMapping("/info/updatepassword/success")
    public String info_pass_update(Model model,@RequestParam("oldPass") String oldPass,
                                   @RequestParam("newPass") String newPass,@RequestParam("checkPass") String checkPass){

        TaiKhoan tk = (TaiKhoan) session.getAttribute("logInTK");
        System.out.println(tk.getPassTK());

        if(!oldPass.equals(tk.getPassTK())||!newPass.equals(checkPass)){
            model.addAttribute("error","Sai mật khẩu cũ hoặc xác nhận mật khẩu");
            return "changepassword";
        }else{
            dao.ChangePass(newPass,tk.getTenTK());
            model.addAttribute("success","Đổi mật khẩu thành công");
            return "info";
        }

    }

    @PostMapping("/info/update")
    public String info_update(@ModelAttribute("tk") TaiKhoan tk,Model model){
        try {
            dao.save(tk);
            model.addAttribute("success", "Đổi mật khẩu thành công");
            session.setAttribute("logInTK", tk);
            return "redirect:/info";
        }catch (Exception e){
            model.addAttribute("error","Vui lòng nhập vào ô");
            e.printStackTrace();
            return "changeinfo";
        }
    }

    @PostMapping("/info/delete/{id}")
    public String info_delete(@PathVariable("id") String id){
        session.removeAttribute("logInTK");
        dao.deleteById(id);
        return "login";
    }

    @ModelAttribute("gioiTinhUpdate")
    public Map<Boolean,String> getGT(){
        Map<Boolean,String> map =new HashMap<>();
        map.put(true,"Nam");
        map.put(false,"Nữ");
        return map;
    }
}
