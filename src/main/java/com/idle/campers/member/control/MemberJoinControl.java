package com.idle.campers.member.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;
import com.idle.campers.member.service.MemberService;
import com.idle.campers.member.service.MemberServiceImpl;
import com.idle.campers.member.service.MemberVO;

public class MemberJoinControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String userId = req.getParameter("userId");
		String userEmail = req.getParameter("userEmail") + "@" + req.getParameter("userEmail");
		String userPw = req.getParameter("userPw");
		String userName = req.getParameter("userName");
		String userTel = req.getParameter("userTel1") + "-" + req.getParameter("userTel2") + "-" + req.getParameter("userTel3");
		String userAuth = req.getParameter("userAuth");
		String userAddr = req.getParameter("userAddr") + " " + req.getParameter("userAddr2") + req.getParameter("userAddr3");
		
		MemberVO vo = new MemberVO();
		vo.setUserId(userId);
		vo.setUserEmail(userEmail);
		vo.setUserPw(userPw);
		vo.setUserName(userName);
		vo.setUserTel(userTel);
		vo.setUserAuth(userAuth);
		vo.setUserAddr(userAddr);
		
		MemberService service = new MemberServiceImpl();
		if ( service.insertMember(vo)) {
			return "main/main";
		} else {
			return "member/memberJoinType";
		}
		
	}

}
