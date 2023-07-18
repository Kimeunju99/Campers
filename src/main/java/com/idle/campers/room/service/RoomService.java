package com.idle.campers.room.service;

import java.util.List;

public interface RoomService {
	public List<RoomVO> roomList(int campId);
	public RoomVO infoRoom(int campId,int roomId);
	
	public boolean addRoom(RoomVO vo); 
		
	public int deleteRoom(RoomVO vo);
	
}
