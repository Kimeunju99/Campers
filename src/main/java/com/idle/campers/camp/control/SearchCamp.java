package com.idle.campers.camp.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;

public class SearchCamp implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {	
		req.setAttribute("locationSido", req.getParameter("locationSido"));
		req.setAttribute("keyWord", req.getParameter("keyWord"));
		req.setAttribute("campName", req.getParameter("campName"));
		req.setAttribute("getMain", req.getParameter("getMain"));
		return "camp/searchCamp";
	}
}