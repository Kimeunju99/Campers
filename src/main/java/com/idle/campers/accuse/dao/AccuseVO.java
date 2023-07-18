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

	public int getAccuseId() {
		return accuseId;
	}

	public void setAccuseId(int accuseId) {
		this.accuseId = accuseId;
	}

	public int getAccuseBrd() {
		return accuseBrd;
	}

	public void setAccuseBrd(int accuseBrd) {
		this.accuseBrd = accuseBrd;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}

	public Date getAccuseDate() {
		return accuseDate;
	}

	public void setAccuseDate(Date accuseDate) {
		this.accuseDate = accuseDate;
	}

	public String getAccuseReport() {
		return accuseReport;
	}

	public void setAccuseReport(String accuseReport) {
		this.accuseReport = accuseReport;
	}

	public int getAccuseContent() {
		return accuseContent;
	}

	public void setAccuseContent(int accuseContent) {
		this.accuseContent = accuseContent;
	}

	public int getAccuseState() {
		return accuseState;
	}

	public void setAccuseState(int accuseState) {
		this.accuseState = accuseState;
	}

	public String getAccuseResult() {
		return accuseResult;
	}

	public void setAccuseResult(String accuseResult) {
		this.accuseResult = accuseResult;
	}

	public Date getAccuseRdate() {
		return accuseRdate;
	}

	public void setAccuseRdate(Date accuseRdate) {
		this.accuseRdate = accuseRdate;
	}

	public String getAccuseUserId() {
		return accuseUserId;
	}

	public void setAccuseUserId(String accuseUserId) {
		this.accuseUserId = accuseUserId;
	}
	
	
	
	public String getAccuseTitle() {
		return accuseTitle;
	}

	public void setAccuseTitle(String accuseTitle) {
		this.accuseTitle = accuseTitle;
	}

	public int getUserAccuse() {
		return userAccuse;
	}

	public void setUserAccuse(int userAccuse) {
		this.userAccuse = userAccuse;
	}



	private int userAccuse;
	
}
