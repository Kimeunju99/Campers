package com.idle.campers.board.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.board.dao.BoardVO;
import com.idle.campers.board.service.BoardService;
import com.idle.campers.board.service.BoardServiceImpl;
import com.idle.campers.common.Control;

public class BoardDeleteControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		
		String brdId = req.getParameter("bno");
		BoardService boardService = new BoardServiceImpl();
		boardService.deleteBoard(Integer.parseInt(brdId));
		
		return "board/boardList";
	}

}
