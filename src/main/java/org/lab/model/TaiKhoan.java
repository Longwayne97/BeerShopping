package org.lab.model;


import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "KhachHang")
public class TaiKhoan implements Serializable {
    @Id
    @NotEmpty(message = "Vui lòng nhập tên tài khoản")
    @Length(max = 20,message = "Tên tài khoản không quá 16 kí tự")
    @Column(name = "tenTK")
    private String tenTK;

    @NotEmpty(message = "Vui lòng nhập password")
    @Column(name="passTK")
    private String passTK;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name="ngaySinhTK")
    Date ngaySinhTK;

    @NotEmpty(message = "Vui lòng nhập họ tên")
    @Column(name="hotenTK")
    private String hotenTK;

    @NotNull(message = "Vui lòng chọn giới tính")
    @Column(name="gioiTinhTK")
    private boolean gioiTinhTK;

    @Email(message = "Email không đúng định dạng")
    @NotEmpty(message = "Vui lòng nhập email")
    @Column(name = "emailTK")
    private String emailTK;

    @NotEmpty(message = "Vui lòng nhập số điện thoại")
    @Length(max=10,message = "Số điện thoại không quá 10 số")
    @Column(name = "sdtTK")
    private String sdtTK;

    @NotEmpty(message = "Vui lòng nhập địa chỉ")
    @Length(max=255,message = "Địa chỉ không quá 255 kí tự")
    @Column(name = "diachiTK")
    private String diachiTK;

    @OneToMany(mappedBy = "tk",fetch = FetchType.EAGER)
    List<DonHang> listDonHang;

    @Column(name = "hinhTK")
    private String hinhTK;

    @Column(name = "RoleKhachHang")
    private boolean RoleKhachHang = false;


}
