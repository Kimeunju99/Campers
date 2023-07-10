package com.idle.campers.board.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.board.dao.BoardVO;
import com.idle.campers.board.service.BoardService;
import com.idle.campers.board.service.BoardServiceImpl;
import com.idle.campers.common.Control;

public class BoardEditControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String brdtype = req.getParameter("brdtype");
		
		BoardVO vo = new BoardVO();
		vo.setBrdTitle(title);
		vo.setBrdContent(content);
		vo.setBrdType(brdtype);
		
		BoardService boardService = new BoardServiceImpl();
		boardService.editBoard(vo);
		
		return "bord/boardList";
	}

}
