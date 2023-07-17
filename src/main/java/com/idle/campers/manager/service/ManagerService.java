package com.idle.campers.manager.service;

import java.util.List;

public interface ManagerService {
	public List<ManagerVO> selectMemberList();
	
	public boolean updateMember(ManagerVO vo);
	
	public int deleteMember(String id);

	public List<ManagerVO> selectMemberList(String key, String val);

	public ManagerVO infoMember(String userId);
	
}
