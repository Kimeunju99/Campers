package com.idle.campers.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BoardMapper {
	public List<BoardVO> boardList();
	
	public List<BoardVO> boardList(@Param("key") String key, @Param("type") String type);
	
	
}
