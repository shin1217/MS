package com.bit.ms.user.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class UserMailSendService {

	@Autowired
	private JavaMailSender mailSender;
	
   public void mailSendWithUserKey(String email) {
         
      MimeMessage mail = mailSender.createMimeMessage();
         
      String htmlStr = "<h2>안녕하세요 MS :p 입니다!</h2><br><br>"
                    + "인증번호를 "
                    + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
         
      try {
         mail.setSubject("[본인인증] MS :p 회원가입 인증메일입니다", "utf-8");
         mail.setText(htmlStr, "utf-8", "html");
         mail.addRecipient(RecipientType.TO, new InternetAddress(email));
         mailSender.send(mail);
      } catch (MessagingException e) {
         e.printStackTrace();
      }
   }
}
