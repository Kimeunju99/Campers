package com.idle.campers.book.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.idle.campers.book.service.BookService;
import com.idle.campers.book.service.BookServiceImpl;
import com.idle.campers.book.service.BookVO;
import com.idle.campers.common.Control;
import com.idle.campers.member.service.MemberVO;

public class BookListControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		MemberVO logUser = (MemberVO)session.getAttribute("logUser"); //로그인 정보
		BookService service = new BookServiceImpl();
		ObjectMapper objectMapper = new ObjectMapper();
		List<BookVO> list =  service.bookList(logUser.getUserId(), logUser.getUserAuth(), null); //권한에 따른 예약 리스트
		
		String json ="";
		try {
			json = objectMapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return "Ajax:" + json;
	}

}
