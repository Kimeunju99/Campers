package com.idle.campers.board.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.board.dao.BoardVO;
import com.idle.campers.board.service.BoardService;
import com.idle.campers.board.service.BoardServiceImpl;
import com.idle.campers.common.Control;

public class BoardListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		BoardService svc = new BoardServiceImpl();
		List<BoardVO> list = svc.boardList();
		List<BoardVO> infoList = svc.topInfoList();

		req.setAttribute("board", list);
		req.setAttribute("info", infoList);
		
		return "board/boardList";
	}

}
