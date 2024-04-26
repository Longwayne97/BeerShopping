package org.lab.controller;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import org.lab.dao.DonHangDAO;
import org.lab.model.ChiTietDonHang;
import org.lab.model.DonHang;
import org.lab.model.TaiKhoan;
import org.lab.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class DonHangController {

    @Autowired
    DonHangDAO donHangDAO;

    @Autowired
    SessionService session;


    @RequestMapping("/admin/hoadon")
    public String danhsach_donhang(Model model, @RequestParam("p") Optional<Integer> p){
        Pageable pageable = PageRequest.of(p.orElse(0), 6);
        Page<DonHang> page = donHangDAO.findAll(pageable);

        int indexPage = donHangDAO.findAll().size()/6;
        List<Integer> getIn = new ArrayList<>();
        for(int i=0;i<=indexPage;i++){
            getIn.add(i);
        }

        model.addAttribute("index",getIn);
        model.addAttribute("page",page);
        return "listhoadon";
    }

    @RequestMapping("/admin/hoadon/pageSort1")
    public String page_sort1(Model model, @RequestParam("p")Optional<Integer> p){
        Pageable pageable = PageRequest.of(p.orElse(0), 6, Sort.by("hotenTK").ascending());
        Page<DonHang> page = donHangDAO.findAll(pageable);

        int indexPage = donHangDAO.findAll().size()/6;
        List<Integer> getIn = new ArrayList<>();
        for(int i=0;i<=indexPage;i++){
            getIn.add(i);
        }

        model.addAttribute("index",getIn);
        model.addAttribute("page",page);
        return "listhoadon";
    }
    @RequestMapping("/admin/hoadon/pageSort2")
    public String page_sort2(Model model, @RequestParam("p")Optional<Integer> p){
        Pageable pageable = PageRequest.of(p.orElse(0), 6,Sort.by("idDonHang").ascending());
        Page<DonHang> page = donHangDAO.findAll(pageable);

        int indexPage = donHangDAO.findAll().size()/6;
        List<Integer> getIn = new ArrayList<>();
        for(int i=0;i<=indexPage;i++){
            getIn.add(i);
        }

        model.addAttribute("index",getIn);
        model.addAttribute("page",page);
        return "listhoadon";
    }

    @RequestMapping("/admin/hoadon/pageSearch")
    public String page_Search(Model model, @RequestParam("p")Optional<Integer> p,@RequestParam("id") Optional<String> id){
        Pageable pageable = PageRequest.of(p.orElse(0), 6);

        String keyword = id.orElse(session.get("id"));
        session.set("id",keyword);

        Page<DonHang> page = donHangDAO.donHangList("%"+keyword+"%",pageable);


        int indexPage = (int) (page.getTotalElements()/6);
        List<Integer> getIn = new ArrayList<>();
        for(int i=0;i<=indexPage;i++){
            getIn.add(i);
        }

        model.addAttribute("index",getIn);
        model.addAttribute("page",page);
        return "listhoadon";
    }

    @RequestMapping("/admin/hoadon/detail/{id}")
    public String hoadon_detail(@PathVariable("id") int id,Model model){
        DonHang donHang = donHangDAO.findById(id).get();
        List<ChiTietDonHang> listChiTiet = donHang.getChiTietDonHangList();
        model.addAttribute("donhang",donHang);
        model.addAttribute("listchitiet",listChiTiet);
        return "checkbillinformation";
    }
    @RequestMapping("/info/hoadon/detail/{id}")
    public String hoadon_detailUser(@PathVariable("id") int id,Model model){
        DonHang donHang = donHangDAO.findById(id).get();
        List<ChiTietDonHang> listChiTiet = donHang.getChiTietDonHangList();
        model.addAttribute("donhang",donHang);
        model.addAttribute("listchitiet",listChiTiet);
        return "checkbillinformation";
    }

}
