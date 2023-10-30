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
	public BusinessVO selectCamp(int campId, String campOwner, String campAddr) {
		return map.selectCamp(campId, campOwner, campAddr);
	}
	public List<BusinessVO> campSelectList(String id) {
		return map.campSelectList(id);
	}
	public List<BusinessVO> campListAll(){
		return map.campListAll();
	} //모든 캠프 리스트 일반사용자 예약 용도
	
	@Override
	public int likeCampCheck(int campId, String userId) {
		return map.likeCampCheck(campId, userId);
	}
	@Override
	public int likeCampUpdate(int campId, String userId) {
		return map.likeCampUpdate(campId, userId);
	}
	@Override
	public int likeCampDelete(int campId, String userId) {
		return map.likeCampDelete(campId, userId);
	}
	@Override
	public int likeCampCount(int campId) {
		return map.campLikeCount(campId);
	}
	@Override
	public boolean addCamp(BusinessVO vo) {
		return map.addCamp(vo) == 1;
	}
	@Override
	public boolean updateCamp(BusinessVO vo) {
		return map.updateCamp(vo) == 1;
	}
	
	@Override
	public int deleteCamp(String id) {
		return map.deleteCamp(id);
	}

	@Override
	public List<BusinessVO> bestCampList() {
		return map.bestCampList();
	}	// 메인에 노출시킬 캠핑장 순위 리스트
	
	@Override
	public int myLikeCnt(String userId){
		return map.myLikeCnt(userId);
	}
	@Override
	public List<BusinessVO> campList() {
		// TODO Auto-generated method stub
		return map.ListCamp();
	}
}
