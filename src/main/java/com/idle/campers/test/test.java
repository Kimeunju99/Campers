package com.idle.campers.test;

import java.util.List;

import com.idle.campers.board.dao.BoardVO;
import com.idle.campers.board.service.BoardService;
import com.idle.campers.board.service.BoardServiceImpl;

public class test {
	public static void main(String[] args) {
		BoardService svc = new BoardServiceImpl();
		List<BoardVO> list = svc.MainPageboardList();
		
		for(BoardVO vo : list) {
			System.out.println(vo);
		}
	}
}
