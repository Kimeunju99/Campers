package com.idle.campers.room.service;


import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
public class RoomVO {
	private int roomId;
	private String roomCampid;
	private	String roomManager;
	private String roomName;
	private int roomWeekday;
	private int roomWeekend;
	private int roomPersonnel;
}
