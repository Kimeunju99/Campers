package com.idle.campers.book.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.book.service.BookService;
import com.idle.campers.book.service.BookServiceImpl;
import com.idle.campers.book.service.BookVO;
import com.idle.campers.common.Control;

public class SelectBookForm implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		BookService service = new BookServiceImpl();
		String bookid = req.getParameter("book");
		BookVO book = service.bookSelectId(bookid);
		req.setAttribute("book", book);
		
		//TODO: 업체명, 업체 번호, 예약자번호
		
		
		System.out.println(book.toString());
		return "book/bookForm";
	}

}
