package com.idle.campers.accuse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface AccuseMapper {
	
	public List<AccuseVO> AccuseList ();
	
	public AccuseVO AccuseSelectOne(String accuseUserId);
	
	public int AccuseInsert(AccuseVO vo);
	
	public int AccuseUpdate(AccuseVO vo);
	
	public int AccuseDelete(String accuseUserId);
}
