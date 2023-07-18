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
	private String campInfo;
	private int campLike;
	private String campImage;
	private String campName;
	private int campRoomcnt;
}
