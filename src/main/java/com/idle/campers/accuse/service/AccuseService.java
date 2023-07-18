package com.idle.campers.accuse.service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import com.idle.campers.accuse.dao.AccuseVO;

public interface AccuseService {
		
	public List<AccuseVO> ListAccuse();
	
	public AccuseVO SelectOneAccuse(String accuseUserId);
	
	public boolean InsertAccuse(AccuseVO vo);
	
	public boolean UpdateAccuse(AccuseVO vo);
	
	public boolean DeleteAccuse(String accuseUserId);
	
	public int totalCnt(String type);
	
	public AccuseVO clearDay(String accuseUserId);
}
