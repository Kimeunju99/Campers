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
import com.idle.campers.accuse.control.AccuseAddFormControl;
import com.idle.campers.accuse.control.AccuseListControl;
import com.idle.campers.board.control.BoardAddControl;
import com.idle.campers.board.control.BoardAddFormControl;
import com.idle.campers.board.control.BoardDeleteControl;
import com.idle.campers.board.control.BoardEditControl;
import com.idle.campers.board.control.BoardEditFormControl;
import com.idle.campers.board.control.BoardInfoControl;
import com.idle.campers.board.control.BoardLikeControl;
import com.idle.campers.board.control.BoardLikeCountControl;
import com.idle.campers.board.control.BoardListControl;
import com.idle.campers.board.control.BoardSearchListControl;
import com.idle.campers.book.control.BookList;
import com.idle.campers.book.control.BookListControl;
import com.idle.campers.book.control.BookStateUpdateControl;
import com.idle.campers.book.control.NewBookControl;
import com.idle.campers.book.control.NewBookForm;
import com.idle.campers.book.control.SelectBookForm;
import com.idle.campers.business.control.AddCampControl;
import com.idle.campers.business.control.CampAddFormControl;
import com.idle.campers.business.control.CampDeleteListControl;
import com.idle.campers.business.control.CampInfoFormControl;
import com.idle.campers.business.control.CampModifyControl;
import com.idle.campers.business.control.CampSelectListControl;
import com.idle.campers.camp.control.SearchCamp;
import com.idle.campers.common.Control;
import com.idle.campers.manager.control.AjaxManagerSearchListControl;
import com.idle.campers.manager.control.ManagerDeleteControl;
import com.idle.campers.manager.control.ManagerInfoControl;
import com.idle.campers.manager.control.ManagerModifyFormControl;
import com.idle.campers.manager.control.ManagerModifyInfoControl;
import com.idle.campers.manager.control.ManagerSelectListControl;
import com.idle.campers.member.control.FindMemberId;
import com.idle.campers.member.control.JoinOutControl;
import com.idle.campers.member.control.LoginControl;
import com.idle.campers.member.control.LoginForm;
import com.idle.campers.member.control.LogoutControl;
import com.idle.campers.member.control.MailCertification;
import com.idle.campers.member.control.MemberJoin;
import com.idle.campers.member.control.MemberJoinControl;
import com.idle.campers.member.control.MemberJoinType;
import com.idle.campers.member.control.MemberModifyControl;
import com.idle.campers.member.control.MypageForm;
import com.idle.campers.member.control.ResetMemberPassword;
import com.idle.campers.member.control.UserIdCheck;
import com.idle.campers.reply.control.ReplyAddControl;
import com.idle.campers.reply.control.ReplyControl;
import com.idle.campers.reply.control.ReplyListControl;
import com.idle.campers.reply.control.ReplyModifyControl;
import com.idle.campers.reply.control.ReplyRemoveControl;



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

		// 손석연 - 게시물
		map.put("/boardAdd.do", new BoardAddControl());
		map.put("/boardAddForm.do", new BoardAddFormControl());
		map.put("/boardDelete.do", new BoardDeleteControl());
		map.put("/boardEdit.do", new BoardEditControl());
		map.put("/boardEditForm.do", new BoardEditFormControl());
		map.put("/boardInfo.do", new BoardInfoControl());
		map.put("/boardLike.do", new BoardLikeControl());
		map.put("/boardLikeCount.do", new BoardLikeCountControl());
		
		// 손석연 - user 신고 기능
		map.put("/accuseAddForm.do", new AccuseAddFormControl());
		map.put("/accuseList.do", new AccuseListControl());
		
		
		//은주
		map.put("/mypage.do", new MypageForm()); //마이페이지 form
		map.put("/joinOut.do", new JoinOutControl()); //마이페이지 회원탈퇴
		map.put("/memberModify.do", new MemberModifyControl()); //마이페이지 회원 정보수정
		map.put("/selectBook.do", new SelectBookForm()); //예약 상세보기 form
		map.put("/bookStateUpdate.do", new BookStateUpdateControl()); //예약 상세보기 -> 예약상태 수정
		map.put("/bookList.do", new BookList()); //예약 리스트 form
		map.put("/bookListControl.do", new BookListControl()); //예약 리스트 기본 control
		map.put("/newBook.do", new NewBookForm()); //예약 추가 form
		map.put("/newBookControl.do", new NewBookControl()); //예약 추가 form

		
		//준위
		map.put("/loginForm.do", new LoginForm());	//로그인폼 jsp
		map.put("/loginControl.do", new LoginControl()); 
		map.put("/findMemberId.do", new FindMemberId());	//id찾기
		map.put("/resetMemberPassword.do", new ResetMemberPassword());	//비밀번호 초기화
		map.put("/logout.do", new LogoutControl());	//로그아웃
		map.put("/memberJoinType.do", new MemberJoinType());	//회원가입-유저타입 선택 페이지
		map.put("/memberJoin.do", new MemberJoin());	//회원가입form
		map.put("/memberJoinControl.do", new MemberJoinControl());
		map.put("/userIdCheck.do", new UserIdCheck());	//id체크
		map.put("/mailCertification.do", new MailCertification());	//메일발송
		map.put("/searchCamp.do", new SearchCamp());	//캠핑장 검색

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
		
		//강민호
		map.put("/managerSelectList.do", new ManagerSelectListControl());
		map.put("/ajaxManagerSearchList.do", new AjaxManagerSearchListControl());
		map.put("/managerModifyInfo.do", new ManagerModifyInfoControl());
		map.put("/managerModifyForm.do", new ManagerModifyFormControl());
		map.put("/managerInfoControl.do", new ManagerInfoControl());
		map.put("/managerDelete.do", new ManagerDeleteControl());
		
		map.put("/addCamp.do", new AddCampControl());
		map.put("/campAddForm.do", new CampAddFormControl());
		map.put("/campSelectList.do", new CampSelectListControl());
		map.put("/campInfoFormControl.do", new CampInfoFormControl());
		map.put("/campDeleteList.do", new CampDeleteListControl());
		map.put("/campModify.do", new CampModifyControl());
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String page = uri.substring(contextPath.length());
		
		Control control = map.get(page);
		String viewPage = control.exec(req, resp);
		System.out.println(viewPage);
		if(!viewPage.endsWith(".do")) {
			if(viewPage.startsWith("Ajax:")) {
				resp.setContentType("text/html; charset=UTF-8");
				resp.getWriter().append(viewPage.substring(5));
				return;
			}
			
			if(viewPage.contains(".do?")) {
				resp.sendRedirect(viewPage);
			}else {
				viewPage += ".tiles";
				RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
				dispatcher.forward(req, resp);
			}
		}else {
			resp.sendRedirect(viewPage);
		}
	}
}
