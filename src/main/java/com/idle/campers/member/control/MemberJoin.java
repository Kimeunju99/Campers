package com.idle.campers.member.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;

public class MemberJoin implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String userAuth = req.getParameter("userAuth");
		System.out.println(userAuth);
		req.setAttribute("userAuth", userAuth);
		return "member/memberJoin";
	}

}
