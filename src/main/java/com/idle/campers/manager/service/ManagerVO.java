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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserAuth() {
		return userAuth;
	}
	public void setUserAuth(String userAuth) {
		this.userAuth = userAuth;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserActivation() {
		return userActivation;
	}
	public void setUserActivation(String userActivation) {
		this.userActivation = userActivation;
	}
	public int getAccuseState() {
		return accuseState;
	}
	public void setAccuseState(int accuseState) {
		this.accuseState = accuseState;
	}
	
	
}
