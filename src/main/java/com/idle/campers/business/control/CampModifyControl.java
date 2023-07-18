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

public class CampModifyControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String savePath = req.getServletContext().getRealPath("/images");
		int maxSize = 2048 * 2048 * 10;
		String enc = "UTF-8";

		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(req, savePath, maxSize, enc, new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

			String campName = multi.getParameter("campName");
			String campInfo = multi.getParameter("campInfo");
			String campAddr = multi.getParameter("campAddr");
			String campImage = multi.getFilesystemName("campImg");
			String campRoomcnt = multi.getParameter("campRoomcnt");
			String campOwner = multi.getParameter("campOwner");

			String roomId = multi.getParameter("roomId");
			String roomName = multi.getParameter("roomName");
			String roomWeekday = multi.getParameter("roomWeekday");
			String roomWeekend = multi.getParameter("roomWeekend");
			String roomPersonnel = multi.getParameter("roomPersonnel");

			BusinessVO vo = new BusinessVO();
			vo.setCampName(campName);
			vo.setCampInfo(campInfo);
			vo.setCampAddr(campAddr);
			vo.setCampImage(campImage);
			vo.setCampRoomcnt(Integer.parseInt(campRoomcnt));
			vo.setCampOwner(campOwner);
			BusinessService svc = new BusinessServiceImpl();

			RoomVO rvo = new RoomVO();
			rvo.setRoomId(Integer.parseInt(roomId));
			rvo.setRoomName(roomName);
			rvo.setRoomWeekday(Integer.parseInt(roomWeekday));
			rvo.setRoomWeekend(Integer.parseInt(roomWeekend));
			rvo.setRoomPersonnel(Integer.parseInt(roomPersonnel));
			RoomService service = new RoomServiceImpl();
			service.updateRoom(rvo);
			
			String str = null;

			if (svc.updateCamp(vo)) {
				str = "campSelectList.do";
			} else {
				str = "campInfoFormControl.do";
			}
			return str;
		}
}
