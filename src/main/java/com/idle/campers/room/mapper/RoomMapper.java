package com.idle.campers.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.idle.campers.room.service.RoomVO;

public interface RoomMapper {
	public List<RoomVO> roomList(@Param("campId")int campId);
	public RoomVO selectRoom(@Param("campId")int campId, @Param("roomId")int roomId);
	
	public int addRoom(RoomVO vo);
	public int deleteRoom(RoomVO vo);
	
	public RoomVO infoRoom(int campId);
	
	public int deleteRoom(int RoomId);
	
	public List<RoomVO> roomSelectList();
	
	public int updateRoom(RoomVO vo);
}
