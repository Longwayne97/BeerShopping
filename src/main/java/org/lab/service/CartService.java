package org.lab.service;

import org.lab.model.SanPhamBia;

import java.util.Map;

public interface CartService {

    void add(Integer id);

    void remove(Integer id);

    void update(Integer id, int qty);

    void clear();

    Map<Integer,SanPhamBia> getItem();

    int getCount();

    double getAmount();


}
