package com.idle.campers.board.control;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.board.dao.BoardVO;
import com.idle.campers.board.service.BoardService;
import com.idle.campers.board.service.BoardServiceImpl;
import com.idle.campers.common.Control;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardAddControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		
		String savePath = req.getServletContext().getRealPath("/images");
		int maxSize = 1024 * 1024 * 10;
		String enc = "UTF-8";
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(req, savePath, maxSize, enc, new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
		String brdWriter = multi.getParameter("writer");
		String brdTitle = multi.getParameter("title");
		String brdType = multi.getParameter("type");
		String brdContent = multi.getParameter("content");
		String brdImage = multi.getFilesystemName("img");
		String brdInquiry = multi.getParameter("inquiry");
		
		BoardVO vo  = new BoardVO();
		vo.setBrdWriter(brdWriter);
		vo.setBrdTitle(brdTitle);
		vo.setBrdType(brdType);
		vo.setBrdContent(brdContent);
		vo.setBrdImage(brdImage);
		
		
		req.setAttribute("brd", vo);
		
		BoardService service = new BoardServiceImpl();
		if(service.addBoard(vo)) {
			return "boardList.do"; 
					
		} else {
			return "boardAdd.do";
		}
				
	}

}
