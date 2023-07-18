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
}


