package com.idle.campers.member.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.idle.campers.common.Control;
import com.idle.campers.member.service.MemberService;
import com.idle.campers.member.service.MemberServiceImpl;
import com.idle.campers.member.service.MemberVO;

public class LoginControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// 준위
		// 로그인 기능 (login form에서 -> submit 실행시)
		String userId = req.getParameter("userId");
		String userPw = req.getParameter("userPw");
		MemberService service = new MemberServiceImpl();
		MemberVO vo = service.selectMember(userId, userPw);
		
		HttpSession session = req.getSession();
		if( vo == null) {	//로그인실패
			String message = "아이디 또는 비밀번호가 일치하지 않습니다.";
			session.setAttribute("message", message);
			return "member/loginForm";
		} else {
			session.setAttribute("id", vo.getUserId());
			session.setAttribute("name", vo.getUserName());
			session.setAttribute("auth", vo.getUserAuth());	
			session.setAttribute("logUser", vo);	
		}
		

		return "main.do";
	}
	
}
