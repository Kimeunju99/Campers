package com.idle.campers.member.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.idle.campers.board.dao.BoardVO;
import com.idle.campers.board.service.BoardService;
import com.idle.campers.board.service.BoardServiceImpl;
import com.idle.campers.book.service.BookService;
import com.idle.campers.book.service.BookServiceImpl;
import com.idle.campers.book.service.BookVO;
import com.idle.campers.common.Control;
import com.idle.campers.member.service.MemberService;
import com.idle.campers.member.service.MemberServiceImpl;
import com.idle.campers.member.service.MemberVO;

public class MypageForm implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		
		//로그인 유저 정보 세팅
		MemberService memberSv = new MemberServiceImpl();
		MemberVO memVo = (MemberVO)session.getAttribute("logUser");
		req.setAttribute("logUser", memVo);

		//예약 -- 대기+승인 예약 개수, 목록
		bookProcess(memVo, req, resp);
		//게시글 -- 개수, 목록
		boardProcess(memVo, req, resp);
		
		
		if(memVo.getUserAuth().equals("business")) {//사업자일 경우
			//캠프 관리
		}
		
		//if(memVo.getUserAuth().equals("")) {//관리자일 경우		
		//유저, 게시글 관리
		//}
		
		//System.out.println(memVo.getUserPw());	
		return "member/mypage";
	}

	public void bookProcess(MemberVO memVo, HttpServletRequest req, HttpServletResponse resp) {
		BookService bookSv = new BookServiceImpl();
		BookVO bookVo = new BookVO();
		bookVo.setBookState("wait");
		
		bookVo.setBookManager(memVo.getUserId());
		List<BookVO> bookList = bookSv.bookList(memVo.getUserId(), memVo.getUserAuth(), null);
		
		int waitCtn = bookSv.stateCount(bookVo); //대기 수
		bookVo.setBookState("approval");
		int apprCtn = bookSv.stateCount(bookVo); //승인 수
		req.setAttribute("waitCtn", waitCtn);
		req.setAttribute("apprCtn", apprCtn);
		req.setAttribute("bookList", bookList);
	}

	public void boardProcess(MemberVO memVo, HttpServletRequest req, HttpServletResponse resp) {
		BoardService service = new BoardServiceImpl();
		BoardVO board = new BoardVO();
		//List<BoardVO> boardList = service. 내 게시글 리스트
		int boardCnt = service.myBoardCnt(memVo.getUserId());
		req.setAttribute("boardCnt", boardCnt);
	}
	
}
