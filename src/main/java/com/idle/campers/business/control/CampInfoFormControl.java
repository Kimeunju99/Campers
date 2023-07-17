package com.idle.campers.business.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.business.service.BusinessService;
import com.idle.campers.business.service.BusinessVO;
import com.idle.campers.business.serviceImpl.BusinessServiceImpl;
import com.idle.campers.common.Control;
import com.idle.campers.room.service.RoomService;
import com.idle.campers.room.service.RoomVO;
import com.idle.campers.room.serviceImpl.RoomServiceImpl;

public class CampInfoFormControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String name = req.getParameter("name");
		BusinessService svc = new BusinessServiceImpl();
		BusinessVO vo = svc.infoCamp(name);
		
		String id = req.getParameter("rid");
		System.out.println(id);
		RoomService service = new RoomServiceImpl();
		RoomVO rvo = service.infoRoom(Integer.parseInt(id));
		
		req.setAttribute("name", vo);
		req.setAttribute("rid", rvo);
		
		return "business/infoCamp";
	}

}
