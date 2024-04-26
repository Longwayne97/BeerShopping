package org.lab.model;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class MailInfomation {
    @NotBlank(message = "Chưa nhập mail from")
    String from;
    @NotBlank(message = "Chưa nhập mail to")
    String to;
    String[] cc;
    String[] bcc;
    @NotBlank(message = "Chưa nhập tiêu đề")
    String subject;
    @NotBlank(message = "Chưa nhập miêu tả")
    String body;
    String[] attach;

    public MailInfomation(String to, String subject,String body){
        this.from = "longnhpps27325@fpt.edu.vn";
        this.to = to;
        this.body = body;
        this.subject = subject;
    }

}
