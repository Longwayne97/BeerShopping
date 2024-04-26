package org.lab.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.lab.dao.NoiSanXuatBiaDAO;
import org.lab.dao.SanPhamBiaDAO;
import org.lab.model.NoiSanXuatBia;
import org.lab.model.SanPhamBia;
import org.lab.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.util.*;

@Controller
public class ProductController {
    @Autowired
    NoiSanXuatBiaDAO noiSanXuatDAO;

    @Autowired
    SanPhamBiaDAO spBiaDAO;

    @Autowired
    ServletContext app;

    @Autowired
    HttpServletRequest req;

    @Autowired
    SessionService session;

    @RequestMapping(value="/product",method = RequestMethod.GET)
    public String product(@ModelAttribute("sanpham") SanPhamBia sp,
                          @RequestParam("p")Optional<Integer> p,
                          Model model){

        session.remove("ten");
        session.remove("country");
        session.remove("pricemax");
        session.remove("pricemin");

        Pageable pageable = PageRequest.of(p.orElse(0),6);
        Page<SanPhamBia> page = spBiaDAO.findAll(pageable);

        model.addAttribute("page",page);

        int indexPage = spBiaDAO.findAll().size()/6;
        List<Integer> getIn = new ArrayList<>();
        for(int i=0;i<=indexPage;i++){
            getIn.add(i);
        }

        model.addAttribute("index",getIn);

        return "product";
    }

    @RequestMapping("/product/search")
    public String product_Search(Model model, @ModelAttribute("sanpham") SanPhamBia sp,
                              @RequestParam("p") Optional<Integer> p,
                              @RequestParam("ten") Optional<String> ten){
        Pageable pageable = PageRequest.of(p.orElse(0), 6);

        String keyword = ten.orElse(session.get("ten"));
        session.set("ten",keyword);

        Page<SanPhamBia> page = spBiaDAO.findBySPName("%"+keyword+"%",pageable);

        model.addAttribute("page",page);
        int indexPage = (int) (page.getTotalElements()/6);
        List<Integer> getIn = new ArrayList<>();
        for(int i=0;i<=indexPage;i++){
            getIn.add(i);
        }

        model.addAttribute("index",getIn);
        return "product";
    }

    @RequestMapping("/product/searchCountry")
    public String product_SearchCountry(Model model, @ModelAttribute("sanpham") SanPhamBia sp,
                                 @RequestParam("p") Optional<Integer> p,
                                 @RequestParam("country") Optional<String> country){
        Pageable pageable = PageRequest.of(p.orElse(0), 6);

        String quocgia = country.orElse(session.get("country"));
        System.out.println(quocgia);
        session.set("country",quocgia);

        Page<SanPhamBia> page = spBiaDAO.findByCountry(quocgia,pageable);

        model.addAttribute("page",page);
        int indexPage = (int) (page.getTotalElements()/6);
        List<Integer> getIn = new ArrayList<>();
        for(int i=0;i<=indexPage;i++){
            getIn.add(i);
        }

        model.addAttribute("index",getIn);
        return "product";
    }

    @RequestMapping("/product/searchPrice")
    public String product_SearchPrice(Model model, @ModelAttribute("sanpham") SanPhamBia sp,
                                        @RequestParam("p") Optional<Integer> p,
                                        @RequestParam("min") Optional<Double> minPrice,
                                      @RequestParam("max") Optional<Double> maxPrice){

        Pageable pageable = PageRequest.of(p.orElse(0), 6, Sort.by("giaSanPham").ascending());

        Double minP = minPrice.orElse(session.get("min"));
        Double maxP = maxPrice.orElse(session.get("max"));
        System.out.println(minP);
        session.set("pricemin",minP);
        session.set("pricemax",maxP);

        Page<SanPhamBia> page = spBiaDAO.findByPrice(minP,maxP,pageable);


        model.addAttribute("page",page);
        int indexPage = (int) (page.getTotalElements()/6);
        List<Integer> getIn = new ArrayList<>();
        for(int i=0;i<=indexPage;i++){
            getIn.add(i);
        }

        model.addAttribute("index",getIn);
        return "product";
    }

    @GetMapping(value="/product/admin/productManage")
    public String productManage(Model model,
                                @ModelAttribute("sanpham") SanPhamBia sp,
                                @RequestParam("p")Optional<Integer> p){
        session.remove("ten");
        Pageable pageable = PageRequest.of(p.orElse(0),6);
        Page<SanPhamBia> page = spBiaDAO.findAll(pageable);

        model.addAttribute("page",page);

        int indexPage = spBiaDAO.findAll().size()/6;
        List<Integer> getIn = new ArrayList<>();
        for(int i=0;i<=indexPage;i++){
            getIn.add(i);
        }

        model.addAttribute("index",getIn);

        return "productManage";
    }

    @GetMapping(value = "/product/admin/productManage/update/{id}")
    public String editID (@PathVariable int id, Model model, RedirectAttributes ra){
        SanPhamBia sp = spBiaDAO.findById(id).get();
        ra.addAttribute("sanpham",sp);
        return "redirect:/product/admin/productManage";
    }

    @PostMapping( "/product/admin/productManage/add")
    public String productManage_add(@ModelAttribute("sanpham") @Valid SanPhamBia sp, BindingResult result,
                                    @RequestParam("upload-photo")MultipartFile file , Model model) {
        if(result.hasErrors()){
            return "productManage";
        }else {
            try {
                String uploadDir = "/imgProduct/";
                String realPathtoUpload = req.getServletContext().getRealPath(uploadDir);
                String orgName = file.getOriginalFilename();
                String filepath = realPathtoUpload + orgName;

                File dest = new File(filepath);
                file.transferTo(dest);

                sp.setHinhSanPham(orgName);
                spBiaDAO.save(sp);

            }catch (Exception e){

                e.printStackTrace();
                model.addAttribute("error","Chưa upload file");

                return "productManage";
            }

            return "redirect:/product/admin/productManage";
        }
    }

    @PostMapping( "/product/admin/productManage/update")
    public String productManage_update(@ModelAttribute("sanpham") @Valid SanPhamBia sp, BindingResult result,
                                    @RequestParam("upload-photo")MultipartFile file , Model model) {
        if(result.hasErrors()){
            return "productManage";
        }else {
            try {
                String uploadDir = "/imgProduct/";
                String realPathtoUpload = req.getServletContext().getRealPath(uploadDir);
                String orgName = file.getOriginalFilename();
                String filepath = realPathtoUpload + orgName;

                File dest = new File(filepath);
                file.transferTo(dest);

                sp.setHinhSanPham(orgName);
                spBiaDAO.save(sp);

            }catch (Exception e){

                e.printStackTrace();
                model.addAttribute("error","Chưa upload file");

                return "productManage";
            }

            return "redirect:/product/admin/productManage";
        }
    }

    @PostMapping("/product/admin/productManage/delete/{id}")
    public String  productManage_delete(@ModelAttribute("sanpham") @Valid SanPhamBia sp, BindingResult result,@PathVariable int id){
        spBiaDAO.deleteById(id);
        return "redirect:/product/productManage";
    }

    @RequestMapping("/product/admin/productManage/search")
    public String page_Search(Model model, @ModelAttribute("sanpham") SanPhamBia sp,
                              @RequestParam("p") Optional<Integer> p,
                              @RequestParam("ten") Optional<String> ten){
        Pageable pageable = PageRequest.of(p.orElse(0), 6);

        String keyword = ten.orElse(session.get("ten"));
        session.set("ten",keyword);

        Page<SanPhamBia> page = spBiaDAO.findBySPName("%"+keyword+"%",pageable);

        model.addAttribute("page",page);
        int indexPage = (int) (page.getTotalElements()/6);
        List<Integer> getIn = new ArrayList<>();
        for(int i=0;i<=indexPage;i++){
            getIn.add(i);
        }

        model.addAttribute("index",getIn);
        return "productManage";
    }

    @RequestMapping("/product/product-detail/{id}")
    public String product_detail(@PathVariable int id,Model model){
        SanPhamBia sp = spBiaDAO.findById(id).get();
        model.addAttribute("sp",sp);
        return "productdetail";
    }

    @ModelAttribute("listnuocSX")
    public List<NoiSanXuatBia> getQuocGia(){
        return  noiSanXuatDAO.findAll();
    }

    @ModelAttribute("listSP")
    public List<SanPhamBia> getListSP(){
        return  spBiaDAO.findAll();
    }

    @ModelAttribute("nongDoCon")
    public Map<String,String> getND(){
        Map<String,String> map = new HashMap<>();
        map.put("4.0%","4.0%");
        map.put("4.3%","4.3%");
        map.put("4.5%","4.5%");
        map.put("4.6%","4.6%");
        map.put("5.0%","5.0%");
        return map;
    }




}
