package com.idle.campers.book.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.business.service.BusinessService;
import com.idle.campers.business.service.BusinessVO;
import com.idle.campers.business.serviceImpl.BusinessServiceImpl;
import com.idle.campers.common.Control;

public class NewBookForm implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		BusinessService service = new BusinessServiceImpl();
		BusinessVO camp = service.selectCamp(Integer.parseInt(req.getParameter("cid")));
		req.setAttribute("camp", camp);
		return "book/newBook";
	}

}
