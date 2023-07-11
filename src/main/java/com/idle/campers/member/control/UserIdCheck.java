package com.idle.campers.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;
import com.idle.campers.member.service.MemberService;
import com.idle.campers.member.service.MemberServiceImpl;
import com.idle.campers.member.service.MemberVO;

public class UserIdCheck implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp){
		String result = "Ajax:";
		String id = req.getParameter("userId");
		MemberService service = new MemberServiceImpl();

		MemberVO vo = service.selectMember(id, null);
		if(vo != null) {
			result += "success";
		} else {
			result += "fail";
		}
		
		return result;
	}

}
