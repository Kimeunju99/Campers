package com.idle.campers.member.service;

import lombok.Data;

@Data
public class MemberVO {
	private String userId;
	private String userEmail;
	private String userPw;
	private String userName;
	private String userTel;
	private String userAuth; // admin | general | business
	private String userAddr;
}
