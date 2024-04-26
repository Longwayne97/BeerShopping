package org.lab.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="NoiSanXuat")
public class NoiSanXuatBia implements Serializable {

    @Id
    @Column(name = "idNSX")
    private String idNSX;

    @Column(name = "tenNSX")
    private String tenNSX;


    @OneToMany(mappedBy = "nuocSX")
    List<SanPhamBia> sanXuatSP;


}
