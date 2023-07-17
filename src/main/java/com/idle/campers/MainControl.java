package com.idle.campers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.board.dao.BoardVO;
import com.idle.campers.board.service.BoardService;
import com.idle.campers.board.service.BoardServiceImpl;
import com.idle.campers.business.service.BusinessService;
import com.idle.campers.business.service.BusinessVO;
import com.idle.campers.business.serviceImpl.BusinessServiceImpl;
import com.idle.campers.common.Control;

public class MainControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		BoardService svc = new BoardServiceImpl();
		List<BoardVO> list = svc.MainPageboardList();
		List<BoardVO> informList = svc.topInfoList();
		
		BusinessService bsvc = new BusinessServiceImpl();
		List<BusinessVO> campList = bsvc.bestCampList();
		
		req.setAttribute("list", list);
		req.setAttribute("informList", informList);
		req.setAttribute("campList", campList);
		
		return "main/main";
	}

}
