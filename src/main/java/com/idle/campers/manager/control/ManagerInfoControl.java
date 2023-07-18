package com.idle.campers.manager.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;
import com.idle.campers.manager.service.ManagerService;
import com.idle.campers.manager.service.ManagerVO;
import com.idle.campers.manager.serviceImpl.ManagerServiceImpl;

public class ManagerInfoControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp)  {
		// TODO Auto-generated method stub
		
		String id = req.getParameter("id");
		ManagerService svc = new ManagerServiceImpl();
		ManagerVO vo = svc.infoMember(id);
		
		req.setAttribute("user", vo);
		
		
		return "Manager/managerInfo";
	}

}
