package com.idle.campers.board.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.idle.campers.board.service.BoardService;
import com.idle.campers.board.service.BoardServiceImpl;
import com.idle.campers.common.Control;

public class BoardLikeCountControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		
		int brdId = Integer.parseInt(req.getParameter("bid"));
		
		BoardService service = new BoardServiceImpl();
		int count = service.likeBoardCount(brdId);
		
		req.setAttribute("count", count);
		Gson gson = new GsonBuilder().create();
		return "Ajax:"+gson.toJson(count);
	}

}
