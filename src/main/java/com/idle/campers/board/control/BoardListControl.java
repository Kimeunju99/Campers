package com.idle.campers.board.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.board.service.BoardService;
import com.idle.campers.board.service.BoardServiceImpl;
import com.idle.campers.common.Control;

public class BoardListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		BoardService svc = new BoardServiceImpl();
		
		
		return null;
	}

}
