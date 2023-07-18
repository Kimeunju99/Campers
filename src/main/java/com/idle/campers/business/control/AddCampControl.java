package com.idle.campers.business.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.business.service.BusinessService;
import com.idle.campers.business.service.BusinessVO;
import com.idle.campers.business.serviceImpl.BusinessServiceImpl;
import com.idle.campers.common.Control;
import com.idle.campers.room.service.RoomService;
import com.idle.campers.room.service.RoomVO;
import com.idle.campers.room.serviceImpl.RoomServiceImpl;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AddCampControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String savePath = req.getServletContext().getRealPath("/images");
		int maxSize = 2048 * 2048 * 10;
		String enc = "UTF-8";	
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(req, savePath, maxSize, enc, new DefaultFileRenamePolicy() );
		} catch (IOException e) {	e.printStackTrace();	}

		BusinessService campSV = new BusinessServiceImpl();
		RoomService roomSV = new RoomServiceImpl();
		
		// 캠핑장 등록 정보
		String name = multi.getParameter("cname");
		String owner = multi.getParameter("cowner");
		String addr = multi.getParameter("caddr");
		String info = multi.getParameter("cinfo");
		String img = multi.getFilesystemName("img");
		int cnt = Integer.parseInt(multi.getParameter("ccnt"));
		
		BusinessVO vo = new BusinessVO();
		vo.setCampName(name);
		vo.setCampOwner(owner);
		vo.setCampAddr(addr);
		vo.setCampInfo(info);
		vo.setCampImage(img);
		vo.setCampRoomcnt(cnt);
		
		String str = null;
		
		if(campSV.addCamp(vo)) {
			BusinessVO camp = campSV.selectCamp(-1, owner, addr);
			//룸 정보
			for(int i=0;i<cnt; i++) {
				RoomVO rvo = new RoomVO();
				rvo.setRoomId(Integer.parseInt(multi.getParameter(("roomNo"+i))));
				rvo.setRoomCampid(camp.getCampId());
				rvo.setRoomManager(owner);
				rvo.setRoomName(multi.getParameter(("roomName"+i)));
				rvo.setRoomWeekday(Integer.parseInt(multi.getParameter(("roomWeekday"+i))));
				rvo.setRoomWeekend(Integer.parseInt(multi.getParameter(("roomWeekend"+i))));
				rvo.setRoomPersonnel(Integer.parseInt(multi.getParameter(("roomPersonnel"+i))));
				roomSV.addRoom(rvo);
			}
			System.out.println("방 정보 저장 완료");
			str = "true";
		} else {
			str = "false";
		}
		
		return "Ajax:" + str;
	}

}
