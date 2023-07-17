package com.idle.campers.manager.control;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;
import com.idle.campers.manager.service.ManagerService;
import com.idle.campers.manager.service.ManagerVO;
import com.idle.campers.manager.serviceImpl.ManagerServiceImpl;

public class ManagerSelectListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		ManagerService managerService = new ManagerServiceImpl();
		List<ManagerVO> managerList = new ArrayList<>();
		
		managerList = managerService.selectMemberList();
		req.setAttribute("list", managerList);
		
		
		return "Manager/managerList";
	}

}
