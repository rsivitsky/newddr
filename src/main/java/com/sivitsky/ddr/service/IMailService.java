package com.sivitsky.ddr.service;

import com.sparkpost.exception.SparkPostException;
import org.springframework.mail.MailSender;

public interface IMailService {
    void setMailSender(MailSender mailSender);

    void sendMail(String from, String to, String subject, String msg);

    void sendMailWithSparkPost(String from, String to, String subject, String msg, String head) throws SparkPostException;
}
