package com.idle.campers.member.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;

public class ResetMemberPassword implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// 유저 정보 확인(name, id, email)
		String userName = req.getParameter("userName");
		String userEmail = req.getParameter("userEmail");
		String userId = req.getParameter("memberId");
		
		
		
		// 비밀번호 재설정 이메일 발송
		
		
		return null;
	}

}
