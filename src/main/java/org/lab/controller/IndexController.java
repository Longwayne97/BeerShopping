package org.lab.controller;

import org.lab.dao.SanPhamBiaDAO;
import org.lab.model.SanPhamBia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class IndexController {

    @Autowired
    SanPhamBiaDAO dao;

    @RequestMapping(value="/index",method = RequestMethod.GET)
    public String index(Model model, @RequestParam("p")Optional<Integer> p){
        Pageable pageable = PageRequest.of(p.orElse(0),6);
        Page<SanPhamBia> page = dao.findAll(pageable);

        model.addAttribute("page",page);

        int indexPage = dao.findAll().size()/6;
        List<Integer> getIn = new ArrayList<>();
        for(int i=0;i<=indexPage;i++){
            getIn.add(i);
        }

        model.addAttribute("index",getIn);

        return "index";
    }

    @ModelAttribute("listsanpham")
    public List<SanPhamBia> getList(){
        List<SanPhamBia> list = dao.findAll();
        return list;
    }
}
