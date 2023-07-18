package com.idle.campers.business.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.business.service.BusinessService;
import com.idle.campers.business.service.BusinessVO;
import com.idle.campers.business.serviceImpl.BusinessServiceImpl;
import com.idle.campers.common.Control;

public class CampSelectListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		BusinessService svc = new BusinessServiceImpl();
		List<BusinessVO> CampList = svc.campListAll();
		req.setAttribute("list", CampList);

		return "business/listCamp";
	}

}
