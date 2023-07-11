package com.idle.campers.member.control;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;

public class MailCertification implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userEmail = req.getParameter("userEmail");
		String msg = "Ajax:";
		
		// 랜덤 문자열 생성
		String mailStr = "";
		for(int i=0; i<6; i++ ) {
			int r = (int) Math.floor(Math.random() * 10 );
			mailStr += r;
		}
		
		// 인증번호 이메일 발송
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 587);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		prop.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
		
		Session session = Session.getInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new  PasswordAuthentication("asdsadg002@gmail.com","isuirzukaikmwgxp");
			}
		});
		
		String receiver = userEmail;
		String title = "Campers 회원가입 인증 메일";
		String content = "인증번호: " + mailStr;
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress("asdsadg002@gmail.com", "Campers", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setContent(content, "text/html; charset=utf-8");
			
			Transport.send(message);

			msg += mailStr;

		} catch (UnsupportedEncodingException | MessagingException e) {
			e.printStackTrace();
		}
		return msg;
	}

}
