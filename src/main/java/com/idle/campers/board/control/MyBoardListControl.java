package com.idle.campers.board.control;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.idle.campers.board.dao.BoardVO;
import com.idle.campers.board.service.BoardService;
import com.idle.campers.board.service.BoardServiceImpl;
import com.idle.campers.common.Control;

public class MyBoardListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		BoardService svc = new BoardServiceImpl();
		String writer = req.getParameter("writer");
		BoardVO vo = new BoardVO();
		ObjectMapper mapper = new ObjectMapper();
		
		vo.setBrdWriter(writer);
		
		List<BoardVO> list = new ArrayList<>();
		
		list = svc.myBoardList(writer);
		
		String str = "Ajax:";
		
		try {
			str += mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return str;
	}

}
