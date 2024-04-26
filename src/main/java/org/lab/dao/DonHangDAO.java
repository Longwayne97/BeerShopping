package org.lab.dao;

import org.lab.model.DonHang;
import org.lab.model.TaiKhoan;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DonHangDAO extends JpaRepository<DonHang,Integer> {


    @Query("SELECT p " +
            "FROM DonHang p " +
            "JOIN TaiKhoan e on e.tenTK = p.tk.tenTK " +
            "WHERE p.tk.hotenTK LIKE ?1")
    Page<DonHang> donHangList(String id,Pageable pageable);

    @Query("SELECT p FROM DonHang p WHERE p.tk.tenTK =:tenTK")
    List<DonHang> getListDH(String tenTK);







}
