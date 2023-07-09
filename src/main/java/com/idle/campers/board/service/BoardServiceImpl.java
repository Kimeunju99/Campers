package com.idle.campers.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.idle.campers.board.dao.BoardMapper;
import com.idle.campers.board.dao.BoardVO;
import com.idle.campers.common.DataSource;

public class BoardServiceImpl implements BoardService {

	SqlSession session = DataSource.getInstance().openSession(true);
	BoardMapper mapper = session.getMapper(BoardMapper.class);

	@Override
	public List<BoardVO> boardList() {
		return mapper.boardList();
	}

	@Override
	public List<BoardVO> boardList(String key, String type) {
		return mapper.boardList(key, type);
	}

}
