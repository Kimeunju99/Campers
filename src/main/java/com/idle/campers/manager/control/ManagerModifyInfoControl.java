package com.idle.campers.manager.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.accuse.dao.AccuseVO;
import com.idle.campers.accuse.service.AccuseService;
import com.idle.campers.accuse.service.AccuseServiceImpl;
import com.idle.campers.common.Control;
import com.idle.campers.manager.service.ManagerService;
import com.idle.campers.manager.service.ManagerVO;
import com.idle.campers.manager.serviceImpl.ManagerServiceImpl;

public class ManagerModifyInfoControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp)  {
		
		String userId = req.getParameter("userId");
		String userEmail = req.getParameter("userEmail");
		String userName = req.getParameter("userName");
		String userTel = req.getParameter("userTel");
		String userAddr = req.getParameter("userAddr");
		String accuse = req.getParameter("accuse");
		
		String result = req.getParameter("result");
		
		System.out.println(userId + "/ "+ userEmail);
		
		ManagerVO vo = new ManagerVO();
		vo.setUserId(userId);
		vo.setUserEmail(userEmail);
		vo.setUserName(userName);
		vo.setUserTel(userTel);
		vo.setUserAddr(userAddr);
		vo.setUserActivation(accuse);
		
		AccuseVO vo1 = new AccuseVO();
		vo1.setAccuseUserId(userId);
		vo1.setAccuseResult(result);
		AccuseService svc = new AccuseServiceImpl();
		svc.UpdateAccuse(vo1);
		
		ManagerService service = new ManagerServiceImpl();
		
		
		
		if(service.updateMember(vo)) {
		return "managerSelectList.do";
	} else {
		return "managerInfoControl.do";
		
		}

	}
}