package com.idle.campers.member.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;

public class loginForm implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// 준위
		return "member/loginForm";
	}

}
