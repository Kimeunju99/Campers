package com.idle.campers.room.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.idle.campers.common.DataSource;
import com.idle.campers.room.mapper.RoomMapper;
import com.idle.campers.room.service.RoomService;
import com.idle.campers.room.service.RoomVO;

public class RoomServiceImpl implements RoomService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true); //auto커밋하라고 true
	private RoomMapper map = sqlSession.getMapper(RoomMapper.class);
	
	@Override
	public boolean addRoom(RoomVO vo) {
		// TODO Auto-generated method stub
		return map.addRoom(vo) == 1;
	}

	@Override
	public RoomVO infoRoom(int campId) {
		// TODO Auto-generated method stub
		return map.infoRoom(campId);
	}

	@Override
	public int deleteRoom(int roomId) {
		// TODO Auto-generated method stub
		return map.deleteRoom(roomId);
	}

	@Override
	public List<RoomVO> roomSelectList() {
		// TODO Auto-generated method stub
		return map.roomSelectList();
	}

	
	
}
