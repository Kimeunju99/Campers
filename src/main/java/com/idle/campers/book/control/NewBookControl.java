package com.idle.campers.book.control;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.idle.campers.book.service.BookService;
import com.idle.campers.book.service.BookServiceImpl;
import com.idle.campers.book.service.BookVO;
import com.idle.campers.business.service.BusinessService;
import com.idle.campers.business.service.BusinessVO;
import com.idle.campers.business.serviceImpl.BusinessServiceImpl;
import com.idle.campers.common.Control;

public class NewBookControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		BookService service = new BookServiceImpl();
		BookVO book = new BookVO();
		book.setBookCampId(Integer.parseInt(req.getParameter("campId")));
		book.setBookRoomId(Integer.parseInt(req.getParameter("roomId")));

		//매니저 아이디 받아오기
		BusinessService busSV = new BusinessServiceImpl();
		BusinessVO business = busSV.selectCamp(Integer.parseInt(req.getParameter("campId")));
		book.setBookManager(business.getCampOwner());
		
		book.setBookClient((String)session.getAttribute("id"));
		book.setBookPersonnel(Integer.parseInt(req.getParameter("personnel")));
		book.setBookCost(Integer.parseInt(req.getParameter("cost")));
		
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
		Date sDate =null, eDate=null;
		try {
			sDate = (Date) sdf.parse(req.getParameter("startDate"));
			eDate = (Date) sdf.parse(req.getParameter("endDate"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		book.setBookStartDate(sDate);
		book.setBookEndDate(eDate);
		
		if(service.clientBookadd(book))
			return "Ajax:true";
		else
			return "Ajax:false";
		
	}

}
