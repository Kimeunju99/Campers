package com.idle.campers.book.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;

public class NewBookForm implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		return "book/newBook";
	}

}
