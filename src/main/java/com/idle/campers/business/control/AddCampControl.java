package com.idle.campers.business.control;

import java.io.IOException;

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
		// TODO Auto-generated method stub
		String savePath = req.getServletContext().getRealPath("/images");
		int maxSize = 2048 * 2048 * 10;
		String enc = "UTF-8";
		
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(req, savePath, maxSize, enc, new DefaultFileRenamePolicy() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 캠핑장 등록 정보
		String name = multi.getParameter("cname");
		String owner = multi.getParameter("cowner");
		String addr = multi.getParameter("caddr");
		String location = multi.getParameter("clocation");
		String info = multi.getParameter("cinfo");
		String img = multi.getFilesystemName("img");
		String cnt = multi.getParameter("ccnt");
		//룸 정보
		String rid = multi.getParameter("rid");
		String rname = multi.getParameter("rname");
		String rweekday = multi.getParameter("rweekday");
		String rweekend = multi.getParameter("rweekend");
		String rpersonnel = multi.getParameter("rpersonnel");
		
		RoomVO rvo = new RoomVO();
		rvo.setRoomId(Integer.parseInt(rid));
		rvo.setRoomName(rname);
		rvo.setRoomWeekday(Integer.parseInt(rweekday));
		rvo.setRoomWeekend(Integer.parseInt(rweekend));
		rvo.setRoomPersonnel(Integer.parseInt(rpersonnel));
		
		BusinessVO vo = new BusinessVO();
		vo.setCampName(name);
		vo.setCampOwner(owner);
		vo.setCampAddr(addr);
		vo.setCampLocation(location);
		vo.setCampInfo(info);
		vo.setCampImg(img);
		vo.setCampRoomcnt(Integer.parseInt(cnt));
		
		String str = null;
		
		BusinessService service = new BusinessServiceImpl();
		RoomService roomService = new RoomServiceImpl();
		roomService.addRoom(rvo);
		
		if(service.addCamp(vo)) {
			req.setAttribute("message", "등록이 완료되었습니다.");
			str = "business/message";
		} else {
			str = "campAddForm.do";
		}
		
		return str;
	}

}
