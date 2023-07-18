package com.idle.campers.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.idle.campers.board.dao.BoardMapper;
import com.idle.campers.board.dao.BoardVO;
import com.idle.campers.common.DataSource;

public class BoardServiceImpl implements BoardService {

	SqlSession session = DataSource.getInstance().openSession(true);
	BoardMapper mapper = session.getMapper(BoardMapper.class);


	@Override
	public List<BoardVO> boardList(int page, String sch, String keyword, String type) {
		return mapper.boardList(page, sch, keyword, type);
	}

	@Override
	public BoardVO selectBoard(int id) {
		BoardVO vo = mapper.boardSelect(id);
		mapper.boardInquiry(id);
		return vo;
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
	public boolean deleteBoard(int id) {
		return mapper.boardDelete(id) == 1;
	}

	@Override
	public int likeBoard(long id) {
		return 0;
	}
	
	@Override
	public List<BoardVO> topInfoList() {
		return mapper.topInfoList();
	}

	// 좋아요 기능
	
	@Override
	public int likeBoardCheck(int bid, String id) {
		int result = mapper.likecheck(bid, id);
		return result;
	}
	
	@Override
	public void likeBoardUpdate(int bid, String id) {
		mapper.boarLikeUpdate(bid, id);
		
	}

	@Override
	public void likeBoardDelete(int bid, String id) {
		mapper.boarLikeDelete(bid, id);
	}

	
	@Override
	public int likeBoardCount(int boardId) {
		
		int count = mapper.boardLikeCount(boardId);
		
		return count;
	}
	
	// mypage 정보
	@Override
	public int totalCnt(String type) {
		return mapper.getTotalCnt(type);
	}

	
	public int myBoardCnt(String id) {
		return mapper.myBoardCnt(id);
	}

	// mypage 정보
	@Override
	public List<BoardVO> myBoardList(String id) {
		return mapper.myBoardList(id);
	}

	@Override
	public List<BoardVO> MainPageboardList() {
		return mapper.MainPageboardList();
	}
	
	@Override
	public BoardVO boardLatest(String writer) {

		return mapper.latestBoard(writer);
	}
}
