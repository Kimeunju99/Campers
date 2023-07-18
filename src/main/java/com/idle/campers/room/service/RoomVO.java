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
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getRoomCampid() {
		return roomCampid;
	}
	public void setRoomCampid(String roomCampid) {
		this.roomCampid = roomCampid;
	}
	public String getRoomManager() {
		return roomManager;
	}
	public void setRoomManager(String roomManager) {
		this.roomManager = roomManager;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getRoomWeekday() {
		return roomWeekday;
	}
	public void setRoomWeekday(int roomWeekday) {
		this.roomWeekday = roomWeekday;
	}
	public int getRoomWeekend() {
		return roomWeekend;
	}
	public void setRoomWeekend(int roomWeekend) {
		this.roomWeekend = roomWeekend;
	}
	public int getRoomPersonnel() {
		return roomPersonnel;
	}
	public void setRoomPersonnel(int roomPersonnel) {
		this.roomPersonnel = roomPersonnel;
	}
	
	
}
