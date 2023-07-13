package com.idle.campers.book.control;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.book.service.BookService;
import com.idle.campers.book.service.BookServiceImpl;
import com.idle.campers.book.service.BookVO;
import com.idle.campers.common.Control;

public class BookStateUpdateControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		BookVO book = new BookVO();
		book.setBookId(Integer.parseInt(req.getParameter("book")));
		book.setBookState(req.getParameter("state"));
		BookService service = new BookServiceImpl();
		String result ="Ajax:";
		if(service.stateUpdate(book)) {
			if(book.getBookState().equals("cancle")){
				result += "예약을 취소했습니다.";				
			}else if(book.getBookState().equals("approval")){
				result += "예약을 승인했습니다.";
			}
		}
		return result;
	}

}
