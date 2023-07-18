package com.idle.campers.business.service;

import java.util.List;


public interface BusinessService {
	public boolean addCamp(BusinessVO vo);
	
	public BusinessVO infoCamp(String campName);
	public BusinessVO selectCamp(int campId);
	
	public List<BusinessVO> campSelectList(String id);
	public List<BusinessVO> campListAll(); //모든 캠프 리스트 일반사용자 예약 용도
	
	public int deleteCamp(String campName);
	
	public boolean updateCamp(BusinessVO vo);
	
	public List<BusinessVO> bestCampList();
	//mypage
	public int myLikeCnt(String userId);
}
