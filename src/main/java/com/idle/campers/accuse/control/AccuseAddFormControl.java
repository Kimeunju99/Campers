package com.idle.campers.accuse.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.accuse.dao.AccuseVO;
import com.idle.campers.accuse.service.AccuseService;
import com.idle.campers.accuse.service.AccuseServiceImpl;
import com.idle.campers.common.Control;

public class AccuseAddFormControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		
		String writer = req.getParameter("wri");
		String reportId = req.getParameter("rid");
		String title = req.getParameter("title");
		int brdId = Integer.parseInt(req.getParameter("bid"));
		String accuseContent = req.getParameter("content");
		
		AccuseVO vo = new AccuseVO();
		vo.setAccuseUserId(writer);
		vo.setAccuseReport(reportId);
		vo.setAccuseTitle(title);
		vo.setAccuseBrd(brdId);
		vo.setAccuseContent(accuseContent);
		
		String isTrue = "";
		
		AccuseService service = new AccuseServiceImpl();
		if(service.InsertAccuse(vo)) {
			isTrue = "true";
		} else {
			isTrue = "false";
		}
		return "Ajax:"+isTrue;
	}

}
