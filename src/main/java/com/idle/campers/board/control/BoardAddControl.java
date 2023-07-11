package com.idle.campers.board.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.board.dao.BoardVO;
import com.idle.campers.board.service.BoardService;
import com.idle.campers.board.service.BoardServiceImpl;
import com.idle.campers.common.Control;

public class BoardAddControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
	
		
		String brdWriter = req.getParameter("writer");
		String brdTitle = req.getParameter("title");
		String brdType = req.getParameter("type");
		String brdContent = req.getParameter("content");
		String brdImage = req.getParameter("image");
		String brdInquiry = req.getParameter("inquiry");
	
		
		
		BoardVO vo  = new BoardVO();
		vo.setBrdWriter(brdWriter);
		vo.setBrdTitle(brdTitle);
		vo.setBrdType(brdType);
		vo.setBrdContent(brdContent);
		vo.setBrdImage(brdImage);
		
		
		req.setAttribute("brd", vo);
		
		
		BoardService service = new BoardServiceImpl();
		if(service.addBoard(vo)) {
			return "board/boardInfo";
		} else {
			return "board/boardAdd";
		}
				
	}

}
