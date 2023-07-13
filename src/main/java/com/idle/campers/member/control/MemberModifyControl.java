package com.idle.campers.member.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.idle.campers.common.Control;
import com.idle.campers.member.service.MemberService;
import com.idle.campers.member.service.MemberServiceImpl;
import com.idle.campers.member.service.MemberVO;

public class MemberModifyControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session =  req.getSession();
		String id = (String)session.getAttribute("id");
		MemberService service = new MemberServiceImpl();
		MemberVO vo = service.selectMember(id, null);
		
		String name = req.getParameter("userName");
		String tel = req.getParameter("userTel");
		String email = req.getParameter("userEmail");
		String addr = req.getParameter("userAddr");
		
		String pw = req.getParameter("userPw");
		String nPw = req.getParameter("userNewPw1");
		
		String result = "";
		if(vo.getUserPw().equals(pw)) {
			vo.setUserName(name);
			vo.setUserTel(tel);
			vo.setUserEmail(email);
			vo.setUserAddr(addr);	
			vo.setUserPw(pw);
			if(!nPw.equals("")) {//비밀번호 변경
				System.out.println(nPw);
				vo.setUserPw(nPw);
			}
			System.out.println(vo.toString());
			if(service.updateMember(vo)) {
				result = "내 정보 업데이트에 성공했습니다.";
				session.setAttribute("logUser", vo); //세션정보 업데이트
			}else {
				result = "내 정보 업데이트에 실패했습니다.";
			}
		}else {
			result = "비밀번호를 확인해주세요.";
		}
		
		return "Ajax:"+result;
	}

}
