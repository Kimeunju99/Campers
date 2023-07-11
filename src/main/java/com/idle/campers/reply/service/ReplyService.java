package com.idle.campers.reply.service;

import java.util.List;

import com.idle.campers.reply.dao.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> replyList();
	public ReplyVO replyOne(int replyId);
	
	public boolean insertReply(ReplyVO vo);
	public boolean updateReply(ReplyVO vo);
	public boolean deleteReply(int replyId);
	
	
}
