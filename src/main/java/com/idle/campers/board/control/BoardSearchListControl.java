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
import com.idle.campers.common.PageDTO;

public class BoardSearchListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		BoardService svc = new BoardServiceImpl();
		List<BoardVO> list = new ArrayList<>();
		ObjectMapper mapper = new ObjectMapper();

		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		String type = req.getParameter("type");
		
		BoardVO vo = new BoardVO();

		vo.setBrdType(type);

		int totalCnt = svc.totalCnt(type);
		PageDTO dto = new PageDTO(Integer.parseInt(page), totalCnt);

		String sch = req.getParameter("sch");
		String keyword = req.getParameter("keyword");
		System.out.println(sch);
		System.out.println(keyword);

		list = svc.boardList(Integer.parseInt(page), sch, keyword, type);
		req.setAttribute("page", dto);

		String str = "Ajax:";

		try {
			str += mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return str;
	}

}
