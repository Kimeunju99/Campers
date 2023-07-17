package com.idle.campers.business.service;

import java.util.List;


public interface BusinessService {
	public boolean addCamp(BusinessVO vo);
	
	public BusinessVO infoCamp(String campName);
	public BusinessVO selectCamp(int campId);
	
	public List<BusinessVO> campSelectList(String id);
	
	public int deleteCamp(String campName);
	
	public boolean updateCamp(BusinessVO vo);
	
	//mypage
	public int myLikeCnt(String userId);
}
