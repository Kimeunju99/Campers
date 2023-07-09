package com.idle.campers.reply.dao;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private int replyId;
	private int brdId;
	private String reply;
	private String replyer;
	private Date replyDate;
}


