package com.idle.campers.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.idle.campers.book.service.BookVO;

public interface BookMapper {
	public List<BookVO> managerBookList(@Param("bookManager")String manager);//예약조회 select(업체)
	public List<BookVO> clientBookList(@Param("bookClient")String client, @Param("bookState")String state);//예약조회 select(사용자)
	public BookVO bookSelectVo(BookVO vo);//예약 상세보기 select(업체/사용자)
	public BookVO bookSelectId(@Param("bookId")String id);//예약 상세보기 select(업체/사용자)
	
	public int stateUpdate(BookVO vo);//예약 승인/거절:update(업체) 취소:update(사용자)
	
	public int clientBookadd(BookVO vo);//예약하기 insert(사용자)
	
	public int stateCount(BookVO vo); //대기/승인/만료취소 건수
}
