package com.idle.campers.manager.control;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.idle.campers.common.Control;
import com.idle.campers.manager.service.ManagerService;
import com.idle.campers.manager.service.ManagerVO;
import com.idle.campers.manager.serviceImpl.ManagerServiceImpl;

public class AjaxManagerSearchListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		ManagerService managerService = new ManagerServiceImpl();
		List<ManagerVO> managerList = new ArrayList<>();
		ObjectMapper mapper = new ObjectMapper();
		
		String key = req.getParameter("key");
		String val = req.getParameter("val");
		System.out.println(key);
		System.out.println(val);
		
		managerList = managerService.selectMemberList(key, val);
		
		String str = "Ajax:";
		try {
			str += mapper.writeValueAsString(managerList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return str;
	}

}
