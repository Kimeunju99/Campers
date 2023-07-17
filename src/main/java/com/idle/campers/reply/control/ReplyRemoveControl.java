package com.idle.campers.reply.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.idle.campers.common.Control;
import com.idle.campers.reply.dao.ReplyVO;
import com.idle.campers.reply.service.ReplyService;
import com.idle.campers.reply.service.ReplyServiceImpl;

public class ReplyRemoveControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		ReplyService svc = new ReplyServiceImpl();

		String rid = req.getParameter("rid");

		boolean result = svc.deleteReply(Integer.parseInt(rid));

		String str = "Ajax:";
		
		if(result) {
			str += "1";
		}else {
			str += "0";
		}
		
		return str;
	}

}
