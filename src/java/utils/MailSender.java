/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package utils;

import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

/**
 *
 * @author User
 */
public class MailSender {
    private String host;
    private String from;
    private String to;
    private String msg;
    private String subject;
    
    public MailSender(String host, String from, String to, String msg,String subject){
        this.host=host;
        this.from=from;
        this.to=to;
        this.msg=msg;
        this.subject=subject;
        try {   
            Transport.send(this.createMessageObj());
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
    
    private MimeMessage createMessageObj(){
        String smtpHostServer = "smtp.gmail.com";
        final String username = "xxxx";
        final String password = "xxx";
        Properties props = System.getProperties();
 
        props.put("mail.smtp.host", smtpHostServer);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", "587");
        
        Session session = Session.getInstance(props,
          new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
          });
        MimeMessage message = new MimeMessage(session);       
        try {
            message.setFrom(this.from);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(this.to));
            message.setSubject(this.subject);
            message.setText(this.msg);
            System.out.println("Pomyslnie wyslano wiadomosc email do skrzynki!");
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
        return message;
    }
    
}
