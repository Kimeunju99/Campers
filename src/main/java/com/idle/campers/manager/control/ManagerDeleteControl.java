package com.idle.campers.manager.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;
import com.idle.campers.manager.service.ManagerService;
import com.idle.campers.manager.serviceImpl.ManagerServiceImpl;

public class ManagerDeleteControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp)  {
		
		String id = req.getParameter("id");
		System.out.println(id);
		ManagerService service = new ManagerServiceImpl();
		service.deleteMember(id);
		
		return "managerSelectList.do";
	}

}
