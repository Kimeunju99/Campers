package com.idle.campers.business.service;

import java.util.List;


public interface BusinessService {
	public boolean addCamp(BusinessVO vo);
	
	public BusinessVO infoCamp(String campName);
	
	public List<BusinessVO> campSelectList();
	
	public int deleteCamp(String campName);
	
	public boolean updateCamp(BusinessVO vo);
	
	//mypage
	public BusinessVO selectCamp(int campId);
	public int myLikeCnt(String userId);
}
