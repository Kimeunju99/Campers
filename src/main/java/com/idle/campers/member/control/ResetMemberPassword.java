package com.idle.campers.member.control;

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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;
import com.idle.campers.member.service.MemberService;
import com.idle.campers.member.service.MemberServiceImpl;
import com.idle.campers.member.service.MemberVO;

public class ResetMemberPassword implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		MemberService service = new MemberServiceImpl();
		
		// 유저 정보 확인(name, id, email)
		String userName = req.getParameter("userName");
		String userEmail = req.getParameter("userEmail");
		String userId = req.getParameter("userId");
		String msg = "Ajax:fail";
		
		MemberVO vo = service.findMember(userName, userEmail, userId);
		if(vo == null) {	// 일치하는 유저의 정보가 없음
			return null;
		}
		
		// 랜덤 문자열 생성
		String resetPw = "";
		for(int i=0; i<10; i++ ) {
			String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
			int r = (int) Math.floor(Math.random() * str.length() );
			char charAt = str.charAt(r);
			resetPw += charAt;
		}
		System.out.println("임시비밀번호: " + resetPw);
		
		// 비밀번호 재설정 이메일 발송
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
		
		String receiver = vo.getUserEmail();
		String title = "Campers 회원님, 임시 비밀번호가 발급되었습니다.";
		String content = vo.getUserName() + "님의 임시 비밀번호는 " + resetPw + "입니다.";
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress("asdsadg002@gmail.com", "Campers", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setContent(content, "text/html; charset=utf-8");
			
			Transport.send(message);
			
			System.out.println("발송완료");
			vo.setUserPw(resetPw);

			if(service.updateMember(vo) == true) {
				System.out.println("데이터 업데이트 완료");				
				msg = "Ajax:success";
			}
		} catch (UnsupportedEncodingException | MessagingException e) {
			e.printStackTrace();
		}

		return msg;
	}

}
