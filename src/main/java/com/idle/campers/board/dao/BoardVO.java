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
	public int getBrdId() {
		return brdId;
	}
	public void setBrdId(int brdId) {
		this.brdId = brdId;
	}
	public String getBrdWriter() {
		return brdWriter;
	}
	public void setBrdWriter(String brdWriter) {
		this.brdWriter = brdWriter;
	}
	public String getBrdTitle() {
		return brdTitle;
	}
	public void setBrdTitle(String brdTitle) {
		this.brdTitle = brdTitle;
	}
	public String getBrdType() {
		return brdType;
	}
	public void setBrdType(String brdType) {
		this.brdType = brdType;
	}
	public String getBrdContent() {
		return brdContent;
	}
	public void setBrdContent(String brdContent) {
		this.brdContent = brdContent;
	}
	public String getBrdImage() {
		return brdImage;
	}
	public void setBrdImage(String brdImage) {
		this.brdImage = brdImage;
	}
	public Date getBrdDate() {
		return brdDate;
	}
	public void setBrdDate(Date brdDate) {
		this.brdDate = brdDate;
	}
	public int getBrdLike() {
		return brdLike;
	}
	public void setBrdLike(int brdLike) {
		this.brdLike = brdLike;
	}
	public String getBrdAddr() {
		return brdAddr;
	}
	public void setBrdAddr(String brdAddr) {
		this.brdAddr = brdAddr;
	}
	public int getBrdRead() {
		return brdRead;
	}
	public void setBrdRead(int brdRead) {
		this.brdRead = brdRead;
	}
	public int getBrdInquiry() {
		return brdInquiry;
	}
	public void setBrdInquiry(int brdInquiry) {
		this.brdInquiry = brdInquiry;
	}
	
	
	
}
