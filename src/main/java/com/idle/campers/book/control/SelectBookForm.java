package com.idle.campers.book.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.book.service.BookService;
import com.idle.campers.book.service.BookServiceImpl;
import com.idle.campers.book.service.BookVO;
import com.idle.campers.common.Control;
import com.idle.campers.member.service.MemberService;
import com.idle.campers.member.service.MemberServiceImpl;
import com.idle.campers.member.service.MemberVO;

public class SelectBookForm implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		BookService bookSV = new BookServiceImpl();
		MemberService memberSV = new MemberServiceImpl();
		String bookid = req.getParameter("book");
		BookVO book = bookSV.bookSelectId(bookid);
		req.setAttribute("book", book);
		MemberVO client = memberSV.selectMember(book.getBookClient(), null);
		MemberVO manager = memberSV.selectMember(book.getBookManager(), null);
		
		//TODO: 업체명, 업체 번호, 예약자번호
		req.setAttribute("manager", manager);
		req.setAttribute("client", client);
		
		System.out.println(book.toString());
		return "book/bookForm";
	}

}
