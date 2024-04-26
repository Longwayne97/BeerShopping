package org.lab.controller;

import org.lab.dao.TaiKhoanDAO;
import org.lab.model.TaiKhoan;
import org.lab.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class ListCustomerController {
    @Autowired
    TaiKhoanDAO dao;

    @Autowired
    SessionService session;


    @RequestMapping("/admin/listCustomer/page")
    public String page(Model model, @RequestParam("p")Optional<Integer> p){
        Pageable pageable = PageRequest.of(p.orElse(0), 6);
        Page<TaiKhoan> page = dao.findAll(pageable);

        int indexPage = dao.findAll().size()/6;
        List<Integer> getIn = new ArrayList<>();
        for(int i=0;i<=indexPage;i++){
            getIn.add(i);
        }

        model.addAttribute("index",getIn);
        model.addAttribute("page",page);
        return "listCustomer";
    }

    @RequestMapping("/admin/listCustomer/pageSort1")
    public String page_sort1(Model model, @RequestParam("p")Optional<Integer> p){
        Pageable pageable = PageRequest.of(p.orElse(0), 6,Sort.by("hotenTK").ascending());
        Page<TaiKhoan> page = dao.findAll(pageable);

        int indexPage = dao.findAll().size()/6;
        List<Integer> getIn = new ArrayList<>();
        for(int i=0;i<=indexPage;i++){
            getIn.add(i);
        }

        model.addAttribute("index",getIn);
        model.addAttribute("page",page);
        return "listCustomer";
    }
    @RequestMapping("/admin/listCustomer/pageSort2")
    public String page_sort2(Model model, @RequestParam("p")Optional<Integer> p){
        Pageable pageable = PageRequest.of(p.orElse(0), 6,Sort.by("emailTK").ascending());
        Page<TaiKhoan> page = dao.findAll(pageable);

        int indexPage = dao.findAll().size()/6;
        List<Integer> getIn = new ArrayList<>();
        for(int i=0;i<=indexPage;i++){
            getIn.add(i);
        }

        model.addAttribute("index",getIn);
        model.addAttribute("page",page);
        return "listCustomer";
    }

    @RequestMapping("/admin/listCustomer/pageSearch")
    public String page_Search(Model model, @RequestParam("p")Optional<Integer> p,@RequestParam("id") Optional<String> id){
        Pageable pageable = PageRequest.of(p.orElse(0), 6);

        String keyword = id.orElse(session.get("id"));
        session.set("id",keyword);

        Page<TaiKhoan> page = dao.findByKeyWordTK("%"+keyword+"%",pageable);

        
        int indexPage = (int) (page.getTotalElements()/6);
        List<Integer> getIn = new ArrayList<>();
        for(int i=0;i<=indexPage;i++){
            getIn.add(i);
        }

        model.addAttribute("index",getIn);
        model.addAttribute("page",page);
        return "listCustomer";
    }



}
