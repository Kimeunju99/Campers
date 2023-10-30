package com.idle.campers.accuse.service;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.idle.campers.accuse.dao.AccuseMapper;
import com.idle.campers.accuse.dao.AccuseVO;
import com.idle.campers.common.DataSource;

public class AccuseServiceImpl implements AccuseService {
		
	SqlSession session = DataSource.getInstance().openSession(true);
	AccuseMapper mapper = session.getMapper(AccuseMapper.class);
	
	@Override
	public List<AccuseVO> ListAccuse() {
		return mapper.AccuseList();
	}
	
	@Override
	public AccuseVO SelectOneAccuse(String accuseUserId) {
		return mapper.AccuseSelectOne(accuseUserId);
	}
	
	@Override
	public boolean InsertAccuse(AccuseVO vo) {
		return mapper.AccuseInsert(vo) == 1;
	}
	
	@Override
	public boolean UpdateAccuse(AccuseVO vo) {
		return mapper.AccuseUpdate(vo) == 1;
	}
	
	@Override
	public boolean DeleteAccuse(String accuseUserId) {
		return mapper.AccuseDelete(accuseUserId) == 1;
	}

	@Override
	public int totalCnt(String type) {
		return 0;
	}

	@Override
	public AccuseVO clearDay(String accuseUserId) {
		// TODO 자동 생성된 메소드 스텁
		return mapper.dayClear(accuseUserId);
	}
	
	
	
	
}
