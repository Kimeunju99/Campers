package com.idle.campers.member.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;

public class memberJoin implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		
		return "member/memberJoin";
	}

}
