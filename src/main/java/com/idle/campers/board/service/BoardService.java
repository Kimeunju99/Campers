package com.idle.campers.board.service;

import java.util.List;

import com.idle.campers.board.dao.BoardVO;

public interface BoardService {

	public List<BoardVO> boardList(int page, String sch, String keyword, String type);
	
	public BoardVO selectBoard(int id);
	
	public boolean addBoard(BoardVO vo);
	
	public boolean editBoard(BoardVO vo);
	
	public boolean deleteBoard(int id);
	
	public int inquiryBoard(long id);
	
	public int likeBoard(long id);
	
	public List<BoardVO> starBoard(long id);
	
	public List<BoardVO> topInfoList();
	
	public int totalCnt(String type);
	public int myBoardCnt(String id); //내 게시글 카운트
}
