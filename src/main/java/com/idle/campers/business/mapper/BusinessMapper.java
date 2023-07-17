package com.idle.campers.business.mapper;

import java.util.List;

import com.idle.campers.business.service.BusinessVO;

public interface BusinessMapper {

	public int addCamp(BusinessVO vo);
	
	public List<BusinessVO> campSelectList(String id);
	
	public BusinessVO infoCamp(String campName);
	
	public int deleteCamp(String campName);
	
	public int updateCamp(BusinessVO vo);


	public BusinessVO selectCamp(int campId);

	
	

}
