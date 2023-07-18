package com.idle.campers.business.control;

import java.util.List;

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
		String cid = req.getParameter("cid");
		BusinessService svc = new BusinessServiceImpl();
		BusinessVO vo = svc.selectCamp(Integer.parseInt(cid), null, null);
		RoomService service = new RoomServiceImpl();
		List<RoomVO> rvo = service.roomList(Integer.parseInt(cid));
		System.out.println(cid);
		req.setAttribute("cid", vo); //캠핌장 정보
		req.setAttribute("rid", rvo);//룸 정보
		
		return "business/infoCamp";
	}

}
