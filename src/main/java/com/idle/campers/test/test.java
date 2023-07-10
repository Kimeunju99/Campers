package com.idle.campers.test;

import com.idle.campers.member.service.MemberService;
import com.idle.campers.member.service.MemberServiceImpl;
import com.idle.campers.member.service.MemberVO;

public class test {
	public static void main(String[] args) {
		MemberService svc = new MemberServiceImpl();
		MemberVO vo = svc.findMember("user01", "aaaa@gmail.com", null);
		
		System.out.println(vo);
		
		
		
	}
}
