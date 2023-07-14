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

public class BoardEditControl implements Control {

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
		String brdNo = multi.getParameter("bid");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String brdtype = multi.getParameter("type");
		String brdImage = multi.getFilesystemName("img");
				
		BoardVO vo = new BoardVO();
		vo.setBrdId(Integer.parseInt(brdNo));
		vo.setBrdTitle(title);
		vo.setBrdContent(content);
		vo.setBrdType(brdtype);
		vo.setBrdImage(brdImage);
		
		BoardService boardService = new BoardServiceImpl();
		boardService.editBoard(vo);
		
		return "boardList.do";
	}

}
