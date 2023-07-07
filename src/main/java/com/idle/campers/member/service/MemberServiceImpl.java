package com.idle.campers.member.service;

import org.apache.ibatis.session.SqlSession;

import com.idle.campers.common.DataSource;
import com.idle.campers.member.mapper.MemberMapper;


public class MemberServiceImpl implements MemberService {
	private SqlSession session = DataSource.getInstance().openSession(true);
	private MemberMapper mapper = session.getMapper(MemberMapper.class);
	
	@Override
	public MemberVO selectMember(String id) {
		return mapper.selectMember(id);
	}

}