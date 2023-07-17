package com.idle.campers.manager.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.common.Control;
import com.idle.campers.manager.service.ManagerService;
import com.idle.campers.manager.service.ManagerVO;
import com.idle.campers.manager.serviceImpl.ManagerServiceImpl;

public class ManagerModifyFormControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp)  {
		// TODO Auto-generated method stub
		
		//아이디 조회 후 수정화면으로 정보 지정.
		String uid = req.getParameter("uid");
		ManagerService service = new ManagerServiceImpl();
		ManagerVO vo = service.infoMember(uid);
				
		// 요청 정보에 값을 지정.
		req.setAttribute("user", vo);
		System.out.println(vo);
//		req.getRequestDispatcher("WEB-INF/view/Manager/managerModify.jsp").forward(req, resp);
				
		return "Manager/managerInfo";
	}

}
