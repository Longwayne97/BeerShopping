package org.lab.dao;

import jakarta.transaction.Transactional;
import org.lab.model.TaiKhoan;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TaiKhoanDAO extends JpaRepository<TaiKhoan,String> {
    @Modifying
    @Transactional
    @Query("UPDATE TaiKhoan u SET u.passTK = :passTK WHERE u.tenTK = :tenTK")
    void ChangePass(@Param("passTK") String newPass,@Param("tenTK") String tenTK);

    @Query("SELECT u FROM TaiKhoan u WHERE u.tenTK LIKE ?1")
    Page<TaiKhoan> findByKeyWordTK (String keyword,Pageable pageable);

    @Query("SELECT u FROM TaiKhoan u WHERE u.emailTK =:email")
    public TaiKhoan findByEmail(@Param("email") String email);


}
