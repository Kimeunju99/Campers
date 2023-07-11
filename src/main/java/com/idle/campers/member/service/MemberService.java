package com.idle.campers.member.service;

import org.apache.ibatis.annotations.Param;

public interface MemberService {
	public MemberVO selectMember(String id, String pw); //멤버 한 명 셀렉트
	public MemberVO findMember(String name, String email, String id);	//아이디 비밀번호 찾기용
	public boolean insertMember(MemberVO vo);	//회원가입
	public boolean updateMember(MemberVO vo);
	
}
