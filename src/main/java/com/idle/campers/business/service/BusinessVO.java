package com.idle.campers.business.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BusinessVO {
	private int campId;
	private String campOwner;
	private String campAddr;
	private String campLocation;
	private String campInfo;
	private int campLike;
	private String campImage;
	private String campName;
	private int campRoomcnt;
	public int getCampId() {
		return campId;
	}
	public void setCampId(int campId) {
		this.campId = campId;
	}
	public String getCampOwner() {
		return campOwner;
	}
	public void setCampOwner(String campOwner) {
		this.campOwner = campOwner;
	}
	public String getCampAddr() {
		return campAddr;
	}
	public void setCampAddr(String campAddr) {
		this.campAddr = campAddr;
	}
	public String getCampLocation() {
		return campLocation;
	}
	public void setCampLocation(String campLocation) {
		this.campLocation = campLocation;
	}
	public String getCampInfo() {
		return campInfo;
	}
	public void setCampInfo(String campInfo) {
		this.campInfo = campInfo;
	}
	public int getCampLike() {
		return campLike;
	}
	public void setCampLike(int campLike) {
		this.campLike = campLike;
	}
	public String getCampImage() {
		return campImage;
	}
	public void setCampImage(String campImage) {
		this.campImage = campImage;
	}
	public String getCampName() {
		return campName;
	}
	public void setCampName(String campName) {
		this.campName = campName;
	}
	public int getCampRoomcnt() {
		return campRoomcnt;
	}
	public void setCampRoomcnt(int campRoomcnt) {
		this.campRoomcnt = campRoomcnt;
	}
	
	
}
