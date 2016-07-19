package com.sivitsky.ddr.service;

import com.sparkpost.Client;
import com.sparkpost.exception.SparkPostException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class MailService implements IMailService {

    private MailSender mailSender;

    public void setMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void sendMail(String from, String to, String subject, String msg) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(to);
        message.setSubject(subject);
        message.setText(msg);
        mailSender.send(message);
    }

    public void sendMailWithSparkPost(String from, String to, String subject, String msg, String head) throws SparkPostException {
        String API_KEY = "0b04efb4cf55eaf3ee8b343dfb13e0662b0e774b";
        Client client = new Client(API_KEY);
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(to);
        message.setSubject(subject);
        message.setText(msg);
        client.sendMessage(from, to,
                subject,
                msg,
                "<b>The HTML part of the email</b>");
    }
}
