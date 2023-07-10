package com.idle.campers.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BoardMapper {
	public List<BoardVO> boardList();
	
	public List<BoardVO> boardList(@Param("key") String key, @Param("type") String type);
	
	
	public BoardVO boardSelect(long id);
	
	public int boardAdd(BoardVO vo);
	
	public int boardEdit(BoardVO vo);
	
	public int boardDelete(long id);
	
	public int boardInquiry(long id);
	
	public int boardLike(long id);
	
	public List<BoardVO> boardStar();
}
