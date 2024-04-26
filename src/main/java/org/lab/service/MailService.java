package org.lab.service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.lab.dao.MailDAO;
import org.lab.model.MailInfomation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
public class MailService implements MailDAO {

    @Autowired
    JavaMailSender sender;

    List<MailInfomation> listMail = new ArrayList<>();

    @Override
    public void send(MailInfomation mail) throws MessagingException {
        MimeMessage message = sender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");

        helper.setFrom(mail.getFrom());
        helper.setTo(mail.getTo());
        helper.setText(mail.getBody(),true);
        helper.setSubject(mail.getSubject());
        helper.setReplyTo(mail.getFrom());

        String[] cc = mail.getCc();
        if(cc!=null && cc.length>0){
            helper.setCc(cc);
        }

        String[] bcc = mail.getBcc();
        if(bcc!=null && bcc.length>0){
            helper.setCc(bcc);
        }

        String[] attach = mail.getAttach();
        if(attach!=null && attach.length>0){
            for(String path : attach){
                File file = new File(path);
                helper.addAttachment(file.getName(),file);
            }
        }

        sender.send(message);


    }
    @Override
    public void send(String to, String subject, String body) throws MessagingException {
        this.send(new MailInfomation(to,subject,body));
    }

    @Override
    public void queue(MailInfomation mail) throws MessagingException {
        listMail.add(mail);
    }

    @Override
    public void queue(String to, String subject, String body) throws MessagingException {
        queue(new MailInfomation(to,subject,body));
    }

    @Scheduled(fixedDelay = 1000)
    public  void run(){
        while (!listMail.isEmpty()){
            MailInfomation mail = listMail.remove(0);
            try{
                this.send(mail);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }


}
