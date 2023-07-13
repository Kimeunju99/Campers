package com.idle.campers.reply.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;
import com.idle.campers.reply.dao.ReplyVO;
import com.idle.campers.reply.service.ReplyService;
import com.idle.campers.reply.service.ReplyServiceImpl;

public class ReplyRemoveControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		ReplyService svc = new ReplyServiceImpl();

		String rno = req.getParameter("rno");

		svc.deleteReply(Integer.parseInt(rno));

		return null;
	}

}
