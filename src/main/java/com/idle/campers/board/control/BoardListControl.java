package com.idle.campers.board.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.board.dao.BoardVO;
import com.idle.campers.board.service.BoardService;
import com.idle.campers.board.service.BoardServiceImpl;
import com.idle.campers.common.Control;
import com.idle.campers.common.PageDTO;

public class BoardListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		BoardService svc = new BoardServiceImpl();
		
		String page = req.getParameter("page");
		String type = req.getParameter("type");
		page = page == null ? "1" : page;
		BoardVO vo = new BoardVO();
		vo.setBrdType(type);
		
		int totalCnt = svc.totalCnt(type);
		PageDTO dto = new PageDTO(Integer.parseInt(page), totalCnt);
		String sch = req.getParameter("sch");
		String keyword = req.getParameter("keyword");
		
		List<BoardVO> list = svc.boardList(Integer.parseInt(page), sch, keyword, type);
		
		List<BoardVO> infoList = svc.topInfoList();

		req.setAttribute("board", list);
		req.setAttribute("info", infoList);
		req.setAttribute("page", dto);
		req.setAttribute("t", type);
		
		return "board/boardList";
	}

}
