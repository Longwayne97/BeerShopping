package org.lab.service;

import org.lab.dao.SanPhamBiaDAO;
import org.lab.model.SanPhamBia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import java.util.HashMap;
import java.util.Map;

@SessionScope
@Service
public class CartServiceImp implements CartService {

    HashMap<Integer,SanPhamBia> map = new HashMap<>();

    @Autowired
    SanPhamBiaDAO sanPhamBiaDAO;

    @Override
    public void add(Integer id) {
        SanPhamBia sp = sanPhamBiaDAO.findById(id).get().cartQty(1);
        if(!map.containsKey(id)){
           map.put(sp.getIdSanPham(),sp);
        }else if(sp!=null){
            int oldQty = map.get(id).getSoLuongSanPham();
            map.get(id).setSoLuongSanPham(oldQty+1);
        }


    }

    @Override
    public void remove(Integer id) {
        SanPhamBia sp = map.get(id);
        sanPhamBiaDAO.findById(id).get().cartQty(0-sp.getSoLuongSanPham());
        map.remove(id);
    }

    @Override
    public void update(Integer id, int qty) {
        SanPhamBia sp = map.get(id);
        SanPhamBia sanPhamBia = sanPhamBiaDAO.findById(id).get().cartQty(qty - sp.getSoLuongSanPham());
        if (qty > 0) {
            if (sanPhamBia != null) {
                sp.setSoLuongSanPham(qty);
            }
        } else {
            map.remove(id);
        }
    }

    @Override
    public void clear() {
        for(Integer id : map.keySet()){
            SanPhamBia sp = map.get(id);
            sanPhamBiaDAO.findById(id).get().cartQty(0-sp.getSoLuongSanPham());
        }
        map.clear();
    }

    @Override
    public Map<Integer, SanPhamBia> getItem() {
        return map;
    }

    @Override
    public int getCount() {
        return map.values().stream()
                .mapToInt(sp -> sp.getSoLuongSanPham())
                .sum();
    }

    @Override
    public double getAmount() {
        return map.values().stream()
                .mapToDouble(sp -> sp.getGiaSanPham()*sp.getSoLuongSanPham())
                .sum();
    }
}
