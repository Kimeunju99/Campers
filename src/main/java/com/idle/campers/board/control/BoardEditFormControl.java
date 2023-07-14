package com.idle.campers.board.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.board.dao.BoardVO;
import com.idle.campers.board.service.BoardService;
import com.idle.campers.board.service.BoardServiceImpl;
import com.idle.campers.common.Control;

public class BoardEditFormControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		
		String brdId = req.getParameter("bid");
		BoardService service = new BoardServiceImpl();
		BoardVO vo = service.selectBoard(Integer.parseInt(brdId));
		req.setAttribute("brd", vo);
	
		return "board/boardEdit";
	}

}
