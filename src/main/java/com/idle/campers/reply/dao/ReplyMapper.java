package com.idle.campers.reply.dao;

import java.util.List;

public interface ReplyMapper {
	public List<ReplyVO> replyList();
	
	public ReplyVO replyOne(int replyId);
	
	public int insertReply(ReplyVO vo);
	public int updateReply(ReplyVO vo);
	public int deleteReply(int replyId);
	
}