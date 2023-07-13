package com.idle.campers.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ReplyMapper {
	public List<ReplyVO> replyList(@Param("brdId") long brdId);
	
	public ReplyVO replyOne(int replyId);
	
	public int insertReply(ReplyVO vo);
	public int updateReply(ReplyVO vo);
	public int deleteReply(int replyId);
	
}
