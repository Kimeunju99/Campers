package com.idle.campers.room.mapper;

import java.util.List;

import com.idle.campers.room.service.RoomVO;

public interface RoomMapper {
	public int addRoom(RoomVO vo);
	
	public RoomVO infoRoom(int campId);
	
	public int deleteRoom(int RoomId);
	
	public List<RoomVO> roomSelectList();
	
	public int updateRoom(RoomVO vo);
}
