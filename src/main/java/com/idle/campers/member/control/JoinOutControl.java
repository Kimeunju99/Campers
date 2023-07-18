package com.idle.campers.member.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.common.util.concurrent.ForwardingService;
import com.idle.campers.common.Control;
import com.idle.campers.member.service.MemberService;
import com.idle.campers.member.service.MemberServiceImpl;
import com.idle.campers.member.service.MemberVO;

public class JoinOutControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO)session.getAttribute("logUser");
		MemberService service = new MemberServiceImpl();
		
		String result = "";
		if(service.joinout(member)) {
			session.invalidate();
			result = "true";
		};
		
		return "Ajax:" + result;
	}

}
