package com.idle.campers.board.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.idle.campers.board.dao.BoardVO;
import com.idle.campers.board.service.BoardService;
import com.idle.campers.board.service.BoardServiceImpl;
import com.idle.campers.common.Control;
import com.idle.campers.member.service.MemberVO;

public class MyBoardList implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("logUser");
		BoardService service = new BoardServiceImpl();
		List<BoardVO> boardList = service.myBoardList(vo.getUserId());
		
		req.setAttribute("boardList", boardList);
		
		return "board/myBoardList";
	}

}
