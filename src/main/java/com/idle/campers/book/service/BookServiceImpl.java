package com.idle.campers.book.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.idle.campers.book.mapper.BookMapper;
import com.idle.campers.common.DataSource;

public class BookServiceImpl implements BookService {
	SqlSession session = DataSource.getInstance().openSession(true);
	BookMapper mapper = session.getMapper(BookMapper.class);

	@Override
	public List<BookVO> managerBookList(String manager) {
		return mapper.managerBookList(manager);
	}

	@Override
	public List<BookVO> clientBookList(String client, String state) {
		return mapper.clientBookList(client, state);
	}


	@Override
	public BookVO bookSelectVo(BookVO vo) {
		return mapper.bookSelectVo(vo);
	}
	
	@Override
	public BookVO bookSelectId(String id) {
		return mapper.bookSelectId(id);
	}


	@Override
	public boolean stateUpdate(BookVO vo) {
		return mapper.stateUpdate(vo) == 1;
	}


	@Override
	public boolean clientBookadd(BookVO vo) {
		return mapper.clientBookadd(vo) == 1;
	}

	@Override
	public int stateCount(BookVO vo) {
		return mapper.stateCount(vo);
	}


}
