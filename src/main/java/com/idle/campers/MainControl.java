package com.idle.campers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;

public class MainControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		return "main/main";
	}

}
