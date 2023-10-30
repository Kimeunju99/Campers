package com.idle.campers.reply.dao;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyVO {
	private int replyId;
	private int brdId;
	private String reply;
	private String replyer;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date replyDate;
	private String replyModify;
	
	private int accuseId; //신고번호
	private int accuseReply; //신고 댓글(번호)
	private String accuseReport; //신고자 id
	private String accuseContent; //신고사유
	private int accuseState; //신고처리상태(0:접수 1:완료)
	private String accuseResult; //신고처리내용
	private String accuseUserId; //신고당한 유저 id
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public int getBrdId() {
		return brdId;
	}
	public void setBrdId(int brdId) {
		this.brdId = brdId;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public String getReplyModify() {
		return replyModify;
	}
	public void setReplyModify(String replyModify) {
		this.replyModify = replyModify;
	}
	public int getAccuseId() {
		return accuseId;
	}
	public void setAccuseId(int accuseId) {
		this.accuseId = accuseId;
	}
	public int getAccuseReply() {
		return accuseReply;
	}
	public void setAccuseReply(int accuseReply) {
		this.accuseReply = accuseReply;
	}
	public String getAccuseReport() {
		return accuseReport;
	}
	public void setAccuseReport(String accuseReport) {
		this.accuseReport = accuseReport;
	}
	public String getAccuseContent() {
		return accuseContent;
	}
	public void setAccuseContent(String accuseContent) {
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
	public String getAccuseUserId() {
		return accuseUserId;
	}
	public void setAccuseUserId(String accuseUserId) {
		this.accuseUserId = accuseUserId;
	}
	
}


