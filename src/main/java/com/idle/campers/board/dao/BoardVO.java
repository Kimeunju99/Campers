package com.idle.campers.board.dao;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int brdId;
	private String brdWriter;
	private String brdTitle;
	private String brdType;
	private String brdContent;
	private String brdImage;
	private Date brdDate;
	private int brdLike;
	private String brdAddr;
	private int brdRead;
	private int brdInquiry;
}
