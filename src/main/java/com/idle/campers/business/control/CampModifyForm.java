package com.idle.campers.business.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;

public class CampModifyForm implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		return "business/modifyCamp";
	}

}
