package com.idle.campers.business.service;

import java.util.List;


public interface BusinessService {	
	public BusinessVO selectCamp(int campId, String campOwner, String campAddr);//단건 조회
	public List<BusinessVO> campSelectList(String id);
	public List<BusinessVO> campListAll(); //모든 캠프 리스트 일반사용자 예약 용도
	public List<BusinessVO> bestCampList();
	
	public int likeCampCheck(int campId, String userId);
	public int likeCampUpdate(int campId, String userId);
	public int likeCampDelete(int campId, String userId);
	public int likeCampCount(int campId);
	public boolean addCamp(BusinessVO vo);
	public boolean updateCamp(BusinessVO vo);
	public int deleteCamp(String id);
	
	//mypage
	public int myLikeCnt(String userId);
}
