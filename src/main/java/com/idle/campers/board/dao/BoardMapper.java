package com.idle.campers.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BoardMapper {
	public List<BoardVO> boardList();
	
	public List<BoardVO> boardList(@Param("sch") String key, @Param("keyword") String keyword);
	
	public List<BoardVO> topInfoList();
	
	public BoardVO boardSelect(int id);
	
	public int boardAdd(BoardVO vo);
	
	public int boardEdit(BoardVO vo);
	
	public int boardDelete(int id);
	
	public int boardInquiry(long id);
	
	public int boardLike(long id);
	
	public List<BoardVO> boardStar();
}
