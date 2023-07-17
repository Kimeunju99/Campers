package com.idle.campers.room.mapper;

import com.idle.campers.room.service.RoomVO;

public interface RoomMapper {
	public int addRoom(RoomVO vo);
	
	public RoomVO infoRoom(int RoomId);
	
	public int deleteRoom(int RoomId);
	
}
