package com.idle.campers.member.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.idle.campers.common.Control;
import com.idle.campers.member.service.MemberService;
import com.idle.campers.member.service.MemberServiceImpl;
import com.idle.campers.member.service.MemberVO;

public class MypageForm implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		MemberService service = new MemberServiceImpl();
		MemberVO vo = service.selectMember((String)session.getAttribute("id"), null);
		req.setAttribute("logUser", vo);
		
		System.out.println(vo.getUserPw());
		
		return "member/mypage";
	}

}
