package com.idle.campers.accuse.dao;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor

public class AccuseVO {
	
	private int accuseId;
	
	private String accuseTitle;
	
	private int accuseBrd;
	
	private int reply;
	
	private Date accuseDate;
	
	private String accuseReport;
	
	private int accuseContent;
	
	private int accuseState;
	
	private String accuseResult;
	
	private Date accuseRdate;
	
	private String accuseUserId;
	
}
