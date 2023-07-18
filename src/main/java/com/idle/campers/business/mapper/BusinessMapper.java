package com.idle.campers.business.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.idle.campers.business.service.BusinessVO;

public interface BusinessMapper {

	public int addCamp(BusinessVO vo);
	
	public List<BusinessVO> campSelectList(String id);
	public List<BusinessVO> campListAll(); //모든 캠프 리스트 일반사용자 예약 용도
	public BusinessVO selectCamp(@Param("campId")int campId,@Param("campOwner") String campOwner,@Param("campAddr") String campAddr);
	
	public int likeCampCheck(@Param("campId")int campId, @Param("userId")String userId); 
	public int likeCampUpdate(@Param("campId")int campId, @Param("userId")String userId);
	public int likeCampDelete(@Param("campId")int campId, @Param("userId")String userId);
	public int campLikeCount(@Param("campId")int campId);
	
	public int deleteCamp(String campName);	
	public int updateCamp(BusinessVO vo);

	public int myLikeCnt(String userId);

	public List<BusinessVO> bestCampList();	// 메인에 노출시킬 캠핑장 리스트 순위

	public List<BusinessVO> ListCamp();
}
