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
	private String userState; //true | false
	private String userActivation; // 게시글 신고 계정 상태
	private int accuseState; // 신고 처리 상황
}
