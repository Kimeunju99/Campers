package com.idle.campers.business.control;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.idle.campers.business.service.BusinessService;
import com.idle.campers.business.service.BusinessVO;
import com.idle.campers.business.serviceImpl.BusinessServiceImpl;
import com.idle.campers.common.Control;
import com.idle.campers.room.service.RoomService;
import com.idle.campers.room.service.RoomVO;
import com.idle.campers.room.serviceImpl.RoomServiceImpl;

public class CampSelectListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("id");
		
		BusinessService svc = new BusinessServiceImpl();
		List<BusinessVO> CampList = new ArrayList<>();
		
		CampList = svc.campSelectList(userId);
		req.setAttribute("list", CampList);
		
		
		RoomService service = new RoomServiceImpl();
		List<RoomVO> RoomList = new ArrayList<>();
		
		RoomList = service.roomSelectList();
		req.setAttribute("rlist", RoomList);
		
		
		return "business/listCamp";
	}

}
