package com.idle.campers.business.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.idle.campers.business.service.BusinessService;
import com.idle.campers.business.service.BusinessVO;
import com.idle.campers.business.serviceImpl.BusinessServiceImpl;
import com.idle.campers.common.Control;
import com.idle.campers.member.service.MemberVO;

public class MyCampList implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		MemberVO loguser = (MemberVO)session.getAttribute("logUser");
		BusinessService service = new BusinessServiceImpl();
		List<BusinessVO> campList = service.campSelectList(loguser.getUserId()); 
		System.out.println(campList);
		req.setAttribute("campList", campList);
		
		return "business/myCampList";
	}

}
