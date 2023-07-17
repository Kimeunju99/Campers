package com.idle.campers.manager.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;
import com.idle.campers.manager.service.ManagerService;
import com.idle.campers.manager.service.ManagerVO;
import com.idle.campers.manager.serviceImpl.ManagerServiceImpl;

public class ManagerModifyInfoControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp)  {
		
		String userId = req.getParameter("userId");
		String userEmail = req.getParameter("userEmail");
		String userName = req.getParameter("userName");
		String userTel = req.getParameter("userTel");
		String userAddr = req.getParameter("userAddr");
		
		System.out.println(userId + "/ "+ userEmail);
		
		ManagerVO vo = new ManagerVO();
		vo.setUserId(userId);
		vo.setUserEmail(userEmail);
		vo.setUserName(userName);
		vo.setUserTel(userTel);
		vo.setUserAddr(userAddr);
		ManagerService service = new ManagerServiceImpl();
		
		if(service.updateMember(vo)) {
		return "managerSelectList.do";
	} else {
		return "managerInfoControl.do";
		
		}

	}
}