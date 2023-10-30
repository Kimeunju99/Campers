package com.idle.campers.member.control;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.idle.campers.accuse.dao.AccuseVO;
import com.idle.campers.accuse.service.AccuseService;
import com.idle.campers.accuse.service.AccuseServiceImpl;
import com.idle.campers.common.Control;
import com.idle.campers.manager.service.ManagerService;
import com.idle.campers.manager.service.ManagerVO;
import com.idle.campers.manager.serviceImpl.ManagerServiceImpl;
import com.idle.campers.member.service.MemberService;
import com.idle.campers.member.service.MemberServiceImpl;
import com.idle.campers.member.service.MemberVO;

public class LoginControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// 준위
		// 로그인 기능 (login form에서 -> submit 실행시)
		String userId = req.getParameter("userId");
		String userPw = req.getParameter("userPw");
		MemberService service = new MemberServiceImpl();
		MemberVO vo = service.selectMember(userId, userPw);
		
		HttpSession session = req.getSession();
		if( vo == null) {	//로그인실패
			String message = "아이디 또는 비밀번호가 일치하지 않습니다.";
			session.setAttribute("message", message);
			return "member/loginForm";
		} else if(vo.getUserState().equals("false")){
			String message = "탈퇴한 회원입니다.";
			session.setAttribute("message", message);
			return "member/loginForm";
		} else if(vo.getUserActivation().equals("정지")){
			String message = "정지된 회원입니다.";
			session.setAttribute("message", message);
			return "member/loginForm";
		}else {
			session.setAttribute("id", vo.getUserId());
			session.setAttribute("name", vo.getUserName());
			session.setAttribute("auth", vo.getUserAuth());	
			session.setAttribute("logUser", vo);	
		}
		//손석연 비활성화 활성화 시키기
		if(vo.getUserActivation().equals("비활성화")) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy/MM/dd");
			
			AccuseService accuseService = new AccuseServiceImpl();
			AccuseVO accuseVO = accuseService.clearDay(vo.getUserId());
			
			LocalDate accusedDate = LocalDate.now();
			
			Date clearDate = accuseVO.getAccuseCleardate();
			
			String DateClear = simpleDateFormat.format(clearDate);
			String sysDate = accusedDate.format(DateTimeFormatter.ofPattern("yy/MM/dd"));
			
			System.out.println(sysDate + "/" + DateClear);
			ManagerVO managerVo = new ManagerVO();
			ManagerService managerService = new ManagerServiceImpl();
			managerService.updateMember(managerVo);
		
			int comparisonResult =sysDate.compareTo(DateClear);
		if (comparisonResult < 0) {
			//DateClear가 systDate보다 이전
				String result = "비활성화";
				managerVo.setUserId(userId);
				managerVo.setUserActivation(result);
				managerService.updateMember(managerVo);	
			} else if (comparisonResult > 0) {
			//DateClear가 systDate보다 이후
				String result = "활성화";
				managerVo.setUserId(userId);
				managerVo.setUserActivation(result);
				managerService.updateMember(managerVo); 
			} 
		}


return "main.do";
	}
	
}
