package com.idle.campers.accuse.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.accuse.dao.AccuseVO;
import com.idle.campers.accuse.service.AccuseService;
import com.idle.campers.accuse.service.AccuseServiceImpl;
import com.idle.campers.common.Control;

public class AccuseListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		
		//String page = req.getParameter("page");
		//page = page == null ? "1" : page;
		//int curPage = Integer.parseInt(page);
		
		AccuseVO vo = new AccuseVO();
		AccuseService service = new AccuseServiceImpl();
		List<AccuseVO> list = service.ListAccuse();
		System.out.println(list);
		req.setAttribute("list", list);
		
		return "accuse/accuseList";
	}

}
