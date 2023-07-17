package com.idle.campers.board.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.idle.campers.board.dao.BoardVO;
import com.idle.campers.board.service.BoardService;
import com.idle.campers.board.service.BoardServiceImpl;
import com.idle.campers.common.Control;

public class BoardInfoControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		String bno = req.getParameter("bid");
		BoardService boardService = new BoardServiceImpl();
		BoardVO vo= boardService.selectBoard(Integer.parseInt(bno));
		
		req.setAttribute("board", vo);
		
		return "board/boardInfo";
	}

}
