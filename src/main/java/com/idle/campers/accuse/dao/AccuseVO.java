package com.idle.campers.accuse.dao;

import java.sql.Date;

import lombok.Data;

@Data
public class AccuseVO {
	
	private int accuseId;
	
	private int accuseBrd;
	
	private int reply;
	
	private String accuseTitle;
	
	private Date accuseDate;
	
	private String accuseReport;
	
	private String accuseContent;
	
	private int accuseState;
	
	private String accuseResult;
	
	private Date accuseRdate;
	
	private String accuseUserId;
	
	private int userAccuse;
	
}
