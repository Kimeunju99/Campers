package com.idle.campers.reply.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.idle.campers.common.DataSource;
import com.idle.campers.reply.dao.ReplyMapper;
import com.idle.campers.reply.dao.ReplyVO;

public class ReplyServiceImpl implements ReplyService {

	SqlSession session = DataSource.getInstance().openSession(true);
	ReplyMapper mapper = session.getMapper(ReplyMapper.class);
	
	
	@Override
	public List<ReplyVO> replyList() {
		return mapper.replyList();
	}

	@Override
	public ReplyVO replyOne(int replyId) {
		return mapper.replyOne(replyId);
	}

	@Override
	public boolean insertReply(ReplyVO vo) {
		return mapper.insertReply(vo) == 1;
	}

	@Override
	public boolean updateReply(ReplyVO vo) {
		return mapper.updateReply(vo) == 1;
	}

	@Override
	public boolean deleteReply(int replyId) {
		return mapper.deleteReply(replyId) == 1;
	}
	
	@Override
	public int myReplyCnt(String id) {
		return mapper.myReplyCnt(id);
	}
}
