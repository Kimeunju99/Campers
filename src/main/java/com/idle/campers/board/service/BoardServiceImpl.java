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

	@Override
	public BoardVO selectBoard(long id) {
		return mapper.boardSelect(id);
	}
	

	@Override
	public boolean addBoard(BoardVO vo) {
		return mapper.boardAdd(vo) == 1;
	}

	@Override
	public boolean editBoard(BoardVO vo) {
		return mapper.boardEdit(vo) == 1;
	}

	@Override
	public boolean deleteBoard(String id) {
		return mapper.boardDelete(0) == 1;
	}

	@Override
	public int inquiryBoard(long id) {
		return 0;
	}

	@Override
	public int likeBoard(long id) {
		return 0;
	}

	@Override
	public List<BoardVO> starBoard(long id) {
		return null;
	}

	@Override
	public List<BoardVO> topInfoList() {
		return mapper.topInfoList();
	}
}
