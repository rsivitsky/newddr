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
        String API_KEY = "7bf604c2cd06a15d5620543a5fc59147c3c9d9cd";
        Client client = new Client(API_KEY);
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(to);
        message.setSubject(subject);
        message.setText(msg);
        client.sendMessage("sandbox@sparkpostbox.com", "to@sparkpost.com",
                "The subject of the message",
                "The text part of the email",
                "<b>The HTML part of the email</b>");

    }

}
