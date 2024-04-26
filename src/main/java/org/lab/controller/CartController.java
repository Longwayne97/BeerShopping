package org.lab.controller;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.lab.dao.ChiTietDAO;
import org.lab.dao.DonHangDAO;
import org.lab.dao.SanPhamBiaDAO;
import org.lab.dao.TaiKhoanDAO;
import org.lab.model.*;
import org.lab.service.CartServiceImp;
import org.lab.service.ParamService;
import org.lab.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Controller
@Transactional
public class CartController {

    @Autowired
    HttpSession session;
    @Autowired
    CartServiceImp cartServiceImp;

    @Autowired
    ParamService paramService;

    @Autowired
    DonHangDAO daoDonHang;

    @Autowired
    ChiTietDAO daoChiTiet;

    @Autowired
    TaiKhoanDAO daoTK;

    @Autowired
    SanPhamBiaDAO daoSP;




    @RequestMapping("/cart")
    public String cart_view(Model model){
        model.addAttribute("cart",cartServiceImp.getItem());
        model.addAttribute("tongtien",cartServiceImp.getAmount());
        return "cart";
    }
    @SessionScope
    @RequestMapping("/cart/add/{idSP}")
    public String cart_add(@PathVariable("idSP") int idSP){
        cartServiceImp.add(idSP);
        return "redirect:/cart";
    }
    @SessionScope
    @RequestMapping("/cart/remove/{idSP}")
    public String cart_remove(@PathVariable("idSP") int idSP){
        cartServiceImp.remove(idSP);
        return "redirect:/cart";

    }
    @SessionScope
    @RequestMapping("/cart/update")
    public String cart_update(){
        Integer idsp = paramService.getInt("idsp",0);
        int qty = paramService.getInt("qty",0);
        cartServiceImp.update(idsp,qty);
        return "redirect:/cart";

    }
    @SessionScope
    @RequestMapping("/cart/clear")
    public String cart_clear(){
        cartServiceImp.clear();

        return "redirect:/cart";
    }

    @RequestMapping("/cart/{idTK}/checkout")
    public String cart_checkout(RedirectAttributes ra, Model model,@PathVariable("idTK") String idTK ) throws ParseException {
        if(cartServiceImp.getCount() == 0){
            ra.addFlashAttribute("error","Giỏ hàng trống");
            return "redirect:/cart";
        }else{
            TaiKhoan tk = daoTK.findById(idTK).get();
            DonHang donHang = new DonHang();
            donHang.setTk(tk);
            donHang.setTongTienDonHang(cartServiceImp.getAmount());
            donHang.setNgayDatHang(new Date());

            String date = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss a").format(new Date());
            model.addAttribute("date",date);


            for(Integer id : cartServiceImp.getItem().keySet()){
                SanPhamBia sp = cartServiceImp.getItem().get(id);
                ChiTietDonHang chitiet = new ChiTietDonHang();
                chitiet.setSp(sp);
                chitiet.setSoLuongChiTiet(sp.getSoLuongSanPham());
                chitiet.setThanhTien(sp.getGiaSanPham()*sp.getSoLuongSanPham());
                chitiet.setDonHang(donHang);
                daoChiTiet.saveAndFlush(chitiet);
            }
            cartServiceImp.getItem().clear();
            daoDonHang.save(donHang);


            List<ChiTietDonHang> chiTietALL = daoChiTiet.listChiTiet(donHang.getIdDonHang());
            model.addAttribute("chitiet",chiTietALL);
            model.addAttribute("donhang",donHang);
            return "checkbill";
        }
    }

    @InitBinder
    public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locale) {
        final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", locale);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }


}
