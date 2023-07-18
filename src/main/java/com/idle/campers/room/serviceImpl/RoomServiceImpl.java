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

	public List<RoomVO> roomList(int campId){
		return map.roomList(campId);
	}
	
	@Override
	public boolean addRoom(RoomVO vo) {
		return map.addRoom(vo) == 1;
	}

	@Override
	public RoomVO infoRoom(int campId, int roomId) {
		return map.selectRoom(campId, roomId);
	}

	@Override
	public int deleteRoom(RoomVO vo) {
		return map.deleteRoom(vo);
	}

	@Override
	public List<RoomVO> roomSelectList() {
		return map.roomSelectList();
	}

	@Override
	public int updateRoom(RoomVO vo) {
		return map.updateRoom(vo);
	}

	@Override
	public RoomVO infoRoom(int campId) {
		return null;
	}

	@Override
	public int deleteRoom(int roomId) {
		return 0;
	}
	
}
