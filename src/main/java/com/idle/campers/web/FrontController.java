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
import com.idle.campers.board.control.BoardAddControl;
import com.idle.campers.board.control.BoardAddFormControl;
import com.idle.campers.board.control.BoardDeleteControl;
import com.idle.campers.board.control.BoardEditControl;
import com.idle.campers.board.control.BoardEditFormControl;
import com.idle.campers.board.control.BoardInfoControl;
import com.idle.campers.board.control.BoardListControl;
import com.idle.campers.book.control.BookList;
import com.idle.campers.book.control.BookStateUpdateControl;
import com.idle.campers.board.control.BoardSearchListControl;
import com.idle.campers.book.control.NewBookForm;
import com.idle.campers.book.control.SelectBookForm;
import com.idle.campers.common.Control;
import com.idle.campers.member.control.FindMemberId;

import com.idle.campers.member.control.MypageForm;

import com.idle.campers.member.control.ResetMemberPassword;
import com.idle.campers.member.control.UserIdCheck;
import com.idle.campers.member.control.MemberJoinType;

import com.idle.campers.member.control.LoginControl;

import com.idle.campers.member.control.LoginForm;
import com.idle.campers.member.control.LogoutControl;
import com.idle.campers.member.control.MailCertification;
import com.idle.campers.member.control.MemberJoin;

import com.idle.campers.member.control.LoginControl;


import com.idle.campers.member.control.MemberModifyControl;
import com.idle.campers.member.control.MypageForm;
import com.idle.campers.member.control.ResetMemberPassword;
import com.idle.campers.reply.control.ReplyAddControl;
import com.idle.campers.reply.control.ReplyListControl;
import com.idle.campers.reply.control.ReplyModifyControl;
import com.idle.campers.reply.control.ReplyRemoveControl;
import com.idle.campers.reply.control.ReplyControl;



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

		// 손석연
		map.put("/boardAdd.do", new BoardAddControl());
		map.put("/boardAddForm.do", new BoardAddFormControl());
		map.put("/boardDelete.do", new BoardDeleteControl());
		map.put("/boardEdit.do", new BoardEditControl());
		map.put("/boardEditForm.do", new BoardEditFormControl());
		map.put("/boardEditForm.do", new BoardEditFormControl());
		map.put("/boardInfo.do", new BoardInfoControl());
		
		//은주
		map.put("/mypage.do", new MypageForm());
		map.put("/memberModify.do", new MemberModifyControl());
		map.put("/selectBook.do", new SelectBookForm());
		map.put("/bookList.do", new BookList());
		map.put("/bookStateUpdate.do", new BookStateUpdateControl());
		map.put("/newBook.do", new NewBookForm());
		
		//준위
		map.put("/loginForm.do", new LoginForm());
		map.put("/loginControl.do", new LoginControl());
		map.put("/logout.do", new LogoutControl());
		map.put("/memberJoin.do", new MemberJoin());
		map.put("/findMemberId.do", new FindMemberId());
		map.put("/resetMemberPassword.do", new ResetMemberPassword());
		map.put("/memberJoinType.do", new MemberJoinType());
		map.put("/userIdCheck.do", new UserIdCheck());
		map.put("/mailCertification.do", new MailCertification());
		
		//김시인 (23.07.07 - 게시글 리스트)
		map.put("/boardList.do", new BoardListControl()); //일반 게시글 리스트
		map.put("/boardSearchList.do", new BoardSearchListControl()); //게시글 검색
		//
		map.put("/replyList.do", new ReplyListControl()); //댓글리스트
		map.put("/getReply.do", new ReplyControl()); 
		map.put("/replyAdd.do", new ReplyAddControl());
		map.put("/replyModify.do", new ReplyModifyControl());
		map.put("/replyRemove.do", new ReplyRemoveControl());
		
		map.put("/boardSearchList.do", new BoardSearchListControl()); //게시글 검색
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
