package com.idle.campers.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.idle.campers.manager.service.ManagerVO;


public interface ManagerMapper {
	public List<ManagerVO> selectMemberList();
	public List<ManagerVO> selectMemberList(@Param("key") String key, @Param("val") String val);  //R
	
	
	public int updateMember(ManagerVO vo);
	
	public int deleteMember(String id);
	
	public ManagerVO infoMember(String userId);
	
}
