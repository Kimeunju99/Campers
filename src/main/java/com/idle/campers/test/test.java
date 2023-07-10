package com.idle.campers.test;

import com.idle.campers.member.service.MemberService;
import com.idle.campers.member.service.MemberServiceImpl;
import com.idle.campers.member.service.MemberVO;

public class test {
	public static void main(String[] args) {
		MemberService svc = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		
		vo.setUserName("구십오");
		vo.setUserAuth("general");
		vo.setUserEmail("asdasd@gsdgs.com");
		vo.setUserId("user95");
		vo.setUserPw("1111");
		vo.setUserTel("010-2222-3333");
		
		if(svc.insertMember(vo)) {
			System.out.println("성공===============");
		}
		
		
	}
}
