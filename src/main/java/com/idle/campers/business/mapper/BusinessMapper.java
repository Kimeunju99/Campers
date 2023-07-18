package com.idle.campers.business.mapper;

import java.util.List;

import com.idle.campers.business.service.BusinessVO;

public interface BusinessMapper {

	public int addCamp(BusinessVO vo);
	
	public List<BusinessVO> campSelectList(String id); //소유자로 검색
	public List<BusinessVO> campListAll(); //모든 캠프 리스트 일반사용자 예약 용도
	
	public BusinessVO infoCamp(String campName);
	public int deleteCamp(String campName);
	
	public int updateCamp(BusinessVO vo);

	public BusinessVO selectCamp(int campId);

	public int myLikeCnt(String userId);

	public List<BusinessVO> bestCampList();	// 메인에 노출시킬 캠핑장 리스트 순위

}
