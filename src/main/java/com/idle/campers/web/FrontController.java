package com.idle.campers.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.idle.campers.MainControl;
import com.idle.campers.common.Control;
import com.idle.campers.member.control.FindMemberId;
import com.idle.campers.member.control.MypageForm;
import com.idle.campers.member.control.ResetMemberPassword;
import com.idle.campers.member.control.LoginForm;
import com.idle.campers.member.control.LogoutControl;
import com.idle.campers.member.control.MemberJoin;
import com.idle.campers.member.control.LoginControl;

@WebServlet("*.do")
public class FrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    private Map<String, Control> map = new HashMap<>();
	public FrontController() {
        super();
    }
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		map.put("/main.do", new MainControl());
		
		//은주
		map.put("/mypage.do", new MypageForm());
		
		//준위
		map.put("/loginForm.do", new LoginForm());
		map.put("/loginControl.do", new LoginControl());
		map.put("/logout.do", new LogoutControl());
		map.put("/memberJoin.do", new MemberJoin());
		map.put("/findMemberId.do", new FindMemberId());
		map.put("/resetMemberPassword.do", new ResetMemberPassword());
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String page = uri.substring(contextPath.length());
		
		Control control = map.get(page);
		String viewPage = control.exec(req, resp);
		if(!viewPage.endsWith(".do")) {
			if(viewPage.startsWith("Ajax:")) {
				resp.setContentType("text/html; charset=UTF-8");
				resp.getWriter().append(viewPage.substring(5));
				return;
			}
			viewPage += ".tiles";
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, resp);
		}else {
			resp.sendRedirect(viewPage);
		}
	}
}
