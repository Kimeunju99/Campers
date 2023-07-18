package com.idle.campers.accuse.service;

import java.util.List;

import com.idle.campers.accuse.dao.AccuseVO;

public interface AccuseService {
		
	public List<AccuseVO> ListAccuse();
	
	public AccuseVO SelectOneAccuse(String accuseUserId);
	
	public boolean InsertAccuse(AccuseVO vo);
	
	public boolean UpdateAccuse(AccuseVO vo);
	
	public boolean DeleteAccuse(String accuseUserId);
	
	public int totalCnt(String type);
}
