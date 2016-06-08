package com.sivitsky.ddr.service;

import org.springframework.mail.MailSender;

public interface IMailService {
    void setMailSender(MailSender mailSender);

    void sendMail(String from, String to, String subject, String msg);
}
