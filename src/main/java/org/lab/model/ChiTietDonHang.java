package org.lab.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "ChiTietDonHang")
public class ChiTietDonHang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idChiTiet")
    private int idChiTiet;

    @Column(name="SoLuongChiTiet")
    private int SoLuongChiTiet;

    @Column(name="ThanhTien")
    private Double ThanhTien;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "idDonHang")
    private DonHang donHang;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idSanPham")
    private SanPhamBia sp;


}
