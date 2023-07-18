package com.idle.campers.book.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.business.service.BusinessService;
import com.idle.campers.business.service.BusinessVO;
import com.idle.campers.business.serviceImpl.BusinessServiceImpl;
import com.idle.campers.common.Control;
import com.idle.campers.room.service.RoomService;
import com.idle.campers.room.service.RoomVO;
import com.idle.campers.room.serviceImpl.RoomServiceImpl;

public class NewBookForm implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		BusinessService busSV = new BusinessServiceImpl();
		RoomService rooSV = new RoomServiceImpl();
		BusinessVO camp = busSV.selectCamp(Integer.parseInt(req.getParameter("cid")),null,null);
		RoomVO room = rooSV.infoRoom(Integer.parseInt(req.getParameter("cid")), Integer.parseInt(req.getParameter("rid")));
		req.setAttribute("camp", camp);
		req.setAttribute("room", room);
		return "book/newBook";
	}

}
