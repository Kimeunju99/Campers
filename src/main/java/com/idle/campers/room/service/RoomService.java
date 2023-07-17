package com.idle.campers.room.service;

public interface RoomService {
	public boolean addRoom(RoomVO vo); 
	
	public RoomVO infoRoom(int roomId);
	
	public int deleteRoom(int roomId);
}
