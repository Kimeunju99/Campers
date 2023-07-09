package com.idle.campers.board.service;

import java.util.List;

import com.idle.campers.board.dao.BoardVO;

public interface BoardService {
	public List<BoardVO> boardList();

	public List<BoardVO> boardList(String key, String type);
}
