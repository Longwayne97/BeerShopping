package org.lab.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="SanPham")
public class SanPhamBia implements Cloneable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idSanPham")
    private int idSanPham;

    @NotEmpty(message = "Chưa nhập tên sản phẩm")
    @Column(name= "tenSanPham")
    private String tenSanPham;


    @Min(value = 0,message = "Nhập số không được dưới 0")
    @Column(name= "giaSanPham")
    @NotNull(message = "Chưa nhập giá sản phẩm")
    private Double giaSanPham;

    @Column(name = "nongDoSanPham")
    private String nongDoSanPham;

    @Column(name= "hinhSanPham")
    private String hinhSanPham;


    @Column(name= "soLuongSanPham")
    @NotNull(message = "Chưa nhập số lượng sản phẩm")
    @Min(value = 0,message = "Nhập số không được dưới 0")
    private int soLuongSanPham;

    @Column(name= "mieuTaSanPham")
    private String mieuTaSanPham;

    @OneToMany(mappedBy = "sp", fetch = FetchType.EAGER)
    List<ChiTietDonHang> chiTietDonHangList;

    @ManyToOne
    @JoinColumn(name = "idNSX")
    NoiSanXuatBia nuocSX;


    public SanPhamBia cartQty (int qty){
        SanPhamBia sp = null;
        if(qty <= this.soLuongSanPham){
            try {
                sp = (SanPhamBia) this.clone();
                sp.setSoLuongSanPham(qty);
                this.soLuongSanPham -= qty;
            } catch (CloneNotSupportedException e) {
                throw new RuntimeException(e);
            }
        }
        return sp;
    }
    public String getTinhTrang(){
        if(this.getSoLuongSanPham()==0){
            return "Hết hàng";
        }else{
            return "Còn hàng";
        }
    }



}
