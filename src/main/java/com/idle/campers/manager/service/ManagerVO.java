package com.idle.campers.manager.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ManagerVO {
	private String userId;
	private String userEmail;
	private String userPw;
	private String userName;
	private String userTel;
	private String userAuth;
	private String userAddr;
	private String userActivation; // 게시글 신고 계정 상태
	private int accuseState; // 신고 처리 상황
}
