package com.idle.campers.business.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.idle.campers.business.mapper.BusinessMapper;
import com.idle.campers.business.service.BusinessService;
import com.idle.campers.business.service.BusinessVO;
import com.idle.campers.common.DataSource;

public class BusinessServiceImpl implements BusinessService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true); //auto커밋하라고 true
	private BusinessMapper map = sqlSession.getMapper(BusinessMapper.class);
	
	@Override
	public boolean addCamp(BusinessVO vo) {
		return map.addCamp(vo) == 1;
	}

	@Override
	public BusinessVO infoCamp(String campName) {
		return map.infoCamp(campName);
	}

	@Override
	public List<BusinessVO> campSelectList() {
		return map.campSelectList();
	}

	@Override
	public int deleteCamp(String campName) {
		return map.deleteCamp(campName);
	}

	@Override
	public boolean updateCamp(BusinessVO vo) {
		return map.updateCamp(vo) == 1;
	}

	@Override
	public BusinessVO selectCamp(int campId) {
		return map.selectCamp(campId);
	}
	
	@Override
	public int myLikeCnt(String userId){
		return map.myLikeCnt(userId);
	}
	
}
