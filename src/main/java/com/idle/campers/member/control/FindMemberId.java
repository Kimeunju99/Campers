package com.idle.campers.member.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.idle.campers.common.Control;
import com.idle.campers.member.service.MemberService;
import com.idle.campers.member.service.MemberServiceImpl;
import com.idle.campers.member.service.MemberVO;

public class FindMemberId implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String userName = req.getParameter("userName");
		String userEmail = req.getParameter("userEmail");
		
		MemberService service = new MemberServiceImpl();
		MemberVO vo = service.findMember(userName, userEmail, null);
		
		Gson gson = new Gson();
		String str = "Ajax:";
		str += gson.toJson(vo);
		
		System.out.println(str);
		return str;
	}

}
