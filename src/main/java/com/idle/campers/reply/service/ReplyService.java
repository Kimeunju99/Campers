package com.idle.campers.reply.service;

import java.util.List;

import com.idle.campers.reply.dao.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> replyList(int brdId);
	public ReplyVO replyOne(int replyId);
	
	public boolean insertReply(ReplyVO vo);
	public boolean updateReply(ReplyVO vo);
	public boolean deleteReply(int replyId);
	
	public int totalCnt();
	public int myReplyCnt(String id);
	
}
