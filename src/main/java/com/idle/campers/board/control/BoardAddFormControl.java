package com.idle.campers.board.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.business.service.BusinessService;
import com.idle.campers.business.service.BusinessVO;
import com.idle.campers.business.serviceImpl.BusinessServiceImpl;
import com.idle.campers.common.Control;

public class BoardAddFormControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		
		BusinessService businessService = new BusinessServiceImpl();
		List<BusinessVO> list = businessService.campList();
		req.setAttribute("business", list);
		System.out.println(list);
		return "board/boardAdd";
	}

}
