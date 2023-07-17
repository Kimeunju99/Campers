package com.idle.campers.reply.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.idle.campers.common.Control;
import com.idle.campers.common.PageDTO;
import com.idle.campers.reply.dao.ReplyVO;
import com.idle.campers.reply.service.ReplyService;
import com.idle.campers.reply.service.ReplyServiceImpl;

public class ReplyListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		ReplyService svc = new ReplyServiceImpl();
		Map<String, Object> map = new HashMap<>();
		
		ObjectMapper mapper = new ObjectMapper();

		String bid = req.getParameter("bid");
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		List<ReplyVO> list = svc.replyList(Integer.parseInt(bid));
		
		int totalCnt = svc.totalCnt();
		PageDTO dto = new PageDTO(Integer.parseInt(page), totalCnt);
		
		map.put("list", list);
		map.put("page", dto);
		
		String str = "Ajax:";
		
		try {
			str += mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return str;
	}

}
