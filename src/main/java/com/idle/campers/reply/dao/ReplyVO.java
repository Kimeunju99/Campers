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
	
}


