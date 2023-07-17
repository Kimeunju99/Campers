package com.idle.campers.accuse.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;

public class AccuseAddFormControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		
		String writer = req.getParameter("wri");
		String reportId = req.getParameter("rid");
		String title = req.getParameter("title");
		int brdId = Integer.parseInt(req.getParameter("bno"));
		
		req.setAttribute("writer", writer);
		req.setAttribute("reportId", reportId);
		req.setAttribute("brdId", brdId);
		req.setAttribute("title", title);
		
		return "accuse/accuseAdd";
	}

}
