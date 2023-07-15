package com.idle.campers.member.mapper;

import org.apache.ibatis.annotations.Param;

import com.idle.campers.member.service.MemberVO;

public interface MemberMapper {
	public MemberVO selectMember(@Param("userId")String id, @Param("userPw")String pw); //로그인한 유저정보를 받아오는 용도 (& 관리자가 유저정보 확인할 때도)
	public MemberVO findMember(@Param("userName")String name, @Param("userEmail")String email, @Param("userId")String id);	//아이디 비밀번호 찾기용
	public int insertMember(MemberVO vo);
	public int updateMember(MemberVO vo);
}