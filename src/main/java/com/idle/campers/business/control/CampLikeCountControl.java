package com.idle.campers.business.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.idle.campers.business.service.BusinessService;
import com.idle.campers.business.serviceImpl.BusinessServiceImpl;
import com.idle.campers.common.Control;

public class CampLikeCountControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		int cmpId = Integer.parseInt(req.getParameter("campId"));
		
		BusinessService service = new BusinessServiceImpl();
		int count = service.likeCampCount(cmpId);
		
		req.setAttribute("count", count);
		Gson gson = new GsonBuilder().create();
		return "Ajax:"+gson.toJson(count);
	}

}
