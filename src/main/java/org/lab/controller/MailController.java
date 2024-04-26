package org.lab.controller;

import jakarta.servlet.ServletContext;
import org.lab.model.MailInfomation;
import org.lab.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;

@Controller
public class MailController {

    @Autowired
    MailService mailService;

    @Autowired
    ServletContext context;


    @RequestMapping("/mail")
    public String mail(@ModelAttribute("mailInfo")MailInfomation mailInfo){
        return "mail";
    }

    @RequestMapping("/mail/send")
    public String mail_Send(Model model, @Validated @ModelAttribute("mailInfo") MailInfomation mailInfo, BindingResult result,
                            @RequestParam("files")MultipartFile[] files){
        if(!result.hasErrors()){
            if(!Arrays.asList(files).get(0).getOriginalFilename().equals("")){
                String[] attachments = new String[files.length];
                int attachSize = -1;
                for(MultipartFile file : files){
                    String fileName = StringUtils.cleanPath(file.getOriginalFilename());
                    attachSize++;
                    try{
                        Path path = Paths.get(context.getRealPath("/upload/"+fileName));
                        Files.copy(file.getInputStream(),path, StandardCopyOption.REPLACE_EXISTING);
                        attachments[attachSize] = context.getRealPath("/upload/"+fileName);
                    }catch (IOException e){
                        e.printStackTrace();
                    }
                }
                mailInfo.setAttach(attachments);
            }
            try{
                mailService.queue(mailInfo);
                model.addAttribute("success","Email sẽ được gửi trong giây lát");
            }catch(Exception e){
                e.printStackTrace();
                model.addAttribute("error","Không gủi đươc email");
            }
        }
        return "mail";
    }

}
