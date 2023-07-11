package com.idle.campers.board.dao;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BoardVO {
	private int brdId;
	private String brdWriter;
	private String brdTitle;
	private String brdType;
	private String brdContent;
	private String brdImage;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date brdDate;
	private int brdLike;
	private String brdAddr;
	private int brdRead;
	private int brdInquiry;
	
}
