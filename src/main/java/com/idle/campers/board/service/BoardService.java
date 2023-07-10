package com.idle.campers.board.service;

import java.util.List;

import com.idle.campers.board.dao.BoardVO;

public interface BoardService {
	public List<BoardVO> boardList();

	public List<BoardVO> boardList(String key, String type);
	
	public BoardVO selectBoard(long id);
	
	public boolean addBoard(BoardVO vo);
	
	public boolean editBoard(BoardVO vo);
	
	public boolean deleteBoard(String id);
	
	public int inquiryBoard(long id);
	
	public int likeBoard(long id);
	
	public List<BoardVO> starBoard(long id);
}
