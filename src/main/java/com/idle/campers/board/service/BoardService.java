package com.idle.campers.board.service;

import java.util.List;

import com.idle.campers.board.dao.BoardVO;

public interface BoardService {

	public List<BoardVO> boardList(int page, String sch, String keyword, String type);
	
	public BoardVO selectBoard(int id);
	
	public boolean addBoard(BoardVO vo);
	
	public boolean editBoard(BoardVO vo);
	
	public boolean deleteBoard(int id);
	
	public int likeBoard(long id); // 좋아요 개수 (boardVO 영역)
	
	public void likeBoardUpdate(int bid, String id); // LIKE - 추가
	
	public void likeBoardDelete(int bid, String id); // LIKE - 제거
	
	public int likeBoardCount(int boardId); // LIKE - 개수
	
	public int likeBoardCheck(int bid, String id); // LIKE 중복 게시물 확인
	
	public List<BoardVO> topInfoList();
	
	public int totalCnt(String type);
	
	public int myBoardCnt(String id); //내 게시글 카운트
	
	public List<BoardVO> myBoardList(String id);
	
	public List<BoardVO> MainPageboardList();
}
