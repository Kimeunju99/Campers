package com.idle.campers.board.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.idle.campers.board.service.BoardService;
import com.idle.campers.board.service.BoardServiceImpl;
import com.idle.campers.common.Control;

public class BoardLikeControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("id");
		String brdNo = req.getParameter("bid");
		
		int brdId = Integer.parseInt(brdNo);
		
		BoardService service = new BoardServiceImpl();
		int result = service.likeBoardCheck(brdId, userId);
		String isTrue ="";
		if( userId == null) {
			isTrue = "false";
		}else {
			isTrue = "true";
			if(result == 0) {
				service.likeBoardUpdate(brdId, userId);
			} else {
				service.likeBoardDelete(brdId, userId);
			}			
		}
		
		return "Ajax:" + isTrue;
	}

}
