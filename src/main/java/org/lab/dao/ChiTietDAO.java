package org.lab.dao;

import org.lab.model.ChiTietDonHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ChiTietDAO extends JpaRepository<ChiTietDonHang,Integer> {

    @Query("SELECT p " +
            "FROM ChiTietDonHang p " +
            "JOIN SanPhamBia e on e.idSanPham = p.sp.idSanPham " +
            "JOIN DonHang h on h.idDonHang = p.donHang.idDonHang " +
            "WHERE h.idDonHang = :id")
    List<ChiTietDonHang> listChiTiet(int id);
}
