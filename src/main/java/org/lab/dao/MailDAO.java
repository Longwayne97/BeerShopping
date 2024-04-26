package org.lab.dao;

import jakarta.mail.MessagingException;
import org.lab.model.MailInfomation;

public interface MailDAO {

    void send(MailInfomation mail) throws MessagingException;

    void send(String to,String subject,String body) throws  MessagingException;

    void queue(MailInfomation mail) throws  MessagingException;

    void queue(String to,String subject,String body) throws  MessagingException;


}
