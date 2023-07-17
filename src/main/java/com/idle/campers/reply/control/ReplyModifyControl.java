package com.idle.campers.reply.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.idle.campers.common.Control;
import com.idle.campers.reply.dao.ReplyVO;
import com.idle.campers.reply.service.ReplyService;
import com.idle.campers.reply.service.ReplyServiceImpl;

public class ReplyModifyControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		ReplyService svc = new ReplyServiceImpl();

		ReplyVO vo = new ReplyVO();
		
		ObjectMapper mapper = new ObjectMapper();

		String rid = req.getParameter("rid");
		String reply = req.getParameter("modiReply");

		vo.setReply(reply);
		vo.setBrdId(Integer.parseInt(rid));

		if(svc.updateReply(vo)) {
			vo = svc.replyOne(Integer.parseInt(rid));
		}
		
		String str = "Ajax:";
		
		try {
			str += mapper.writeValueAsString(vo);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return str;
	}

}
