package com.idle.campers.book.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BookService {
	public List<BookVO> bookList(String userId, String userAuth, String state);
	
	public BookVO bookSelectVo(BookVO vo);//예약 상세보기 select(업체/사용자)
	public BookVO bookSelectId(String id);
	public boolean stateUpdate(BookVO vo);//예약승인/거절 update(업체) //예약취소 update(사용자)
	public boolean clientBookadd(BookVO vo);//예약하기 insert(사용자)
	public int stateCount(BookVO vo); //대기/승인/만료취소 건수
	
}
