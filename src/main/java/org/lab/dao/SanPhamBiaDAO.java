package org.lab.dao;

import org.lab.model.SanPhamBia;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface SanPhamBiaDAO extends JpaRepository<SanPhamBia,Integer> {

    @Query("SELECT p FROM SanPhamBia p WHERE p.tenSanPham LIKE ?1")
    Page<SanPhamBia> findBySPName(String keyword, Pageable pageable);

    @Query("SELECT p FROM SanPhamBia p WHERE p.nuocSX.idNSX =:nuocSX")
    Page<SanPhamBia> findByCountry( @Param("nuocSX") String nuocSX,Pageable pageable);

    @Query("SELECT p FROM SanPhamBia p WHERE p.giaSanPham BETWEEN ?1 AND ?2")
    Page<SanPhamBia> findByPrice(Double min , Double max,Pageable pageable);

    @Query("SELECT p FROM SanPhamBia p WHERE p.idSanPham =:id")
    SanPhamBia findByMaSP(int id);

}
