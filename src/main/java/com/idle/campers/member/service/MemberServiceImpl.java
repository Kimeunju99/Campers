package com.idle.campers.member.service;

import org.apache.ibatis.session.SqlSession;

import com.idle.campers.common.DataSource;
import com.idle.campers.member.mapper.MemberMapper;


public class MemberServiceImpl implements MemberService {
	private SqlSession session = DataSource.getInstance().openSession(true);
	private MemberMapper mapper = session.getMapper(MemberMapper.class);

	@Override
	public MemberVO selectMember(String id, String pw) {
		// TODO Auto-generated method stub
		return mapper.selectMember(id, pw);
	}

	@Override
	public boolean insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return mapper.insertMember(vo) == 1;
	}

	@Override
	public boolean updateMember(MemberVO vo) {
		return mapper.updateMember(vo) == 1;
	}

}
