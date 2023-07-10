package com.idle.campers.member.service;

public interface MemberService {
	public MemberVO selectMember(String id, String pw); //멤버 한 명 셀렉트
	public boolean insertMember(MemberVO vo);	//회원가입
	
}
