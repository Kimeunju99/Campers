package com.idle.campers.business.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.idle.campers.business.service.BusinessService;
import com.idle.campers.business.serviceImpl.BusinessServiceImpl;
import com.idle.campers.common.Control;

public class CampLikeControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("id");
		String camp = req.getParameter("campId");
		int campId = Integer.parseInt(camp);
		
		BusinessService service = new BusinessServiceImpl();
		int result = service.likeCampCheck(campId, userId); //사용자가 좋아요를 눌렀나?
		String isTrue ="";
		if( userId == null) {
			isTrue = "false";
		}else {
			isTrue = "true";
			if(result == 0) {
				service.likeCampUpdate(campId, userId);
			} else {
				service.likeCampDelete(campId, userId);
			}			
		}
		
		return "Ajax:" + isTrue;
	}

}
