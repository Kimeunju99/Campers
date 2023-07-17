package com.idle.campers.manager.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.idle.campers.common.DataSource;
import com.idle.campers.manager.mapper.ManagerMapper;
import com.idle.campers.manager.service.ManagerService;
import com.idle.campers.manager.service.ManagerVO;

public class ManagerServiceImpl implements ManagerService{
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true); //auto커밋하라고 true
	private ManagerMapper map = sqlSession.getMapper(ManagerMapper.class);
	
	@Override
	public List<ManagerVO> selectMemberList() {
		// TODO Auto-generated method stub
		return map.selectMemberList();
	}

	@Override
	public boolean updateMember(ManagerVO vo) {
		return map.updateMember(vo) == 1;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return map.deleteMember(userId);
	}

	@Override
	public List<ManagerVO> selectMemberList(String key, String val) {
		// TODO Auto-generated method stub
		return map.selectMemberList(key, val);
	}

	@Override
	public ManagerVO infoMember(String userId) {
		return map.infoMember(userId);
	}
	
}
