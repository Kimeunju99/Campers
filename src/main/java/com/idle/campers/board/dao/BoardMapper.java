package com.idle.campers.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BoardMapper {
	//public List<BoardVO> boardList();
	
	public List<BoardVO> boardList(@Param("page") int page, @Param("sch") String key, @Param("keyword") String keyword, @Param("type") String type);
	
	public List<BoardVO> topInfoList();
	
	public BoardVO boardSelect(int id);
	
	public int boardAdd(BoardVO vo);
	
	public int boardEdit(BoardVO vo);
	
	public int boardDelete(int id);
	
	public int boardInquiry(long id);
	
	public int boardLike(long id);
	
	public int likecheck(@Param("bid")int bid, @Param("id")String id);
	
	public int boarLikeUpdate(@Param("bid")int bid, @Param("id")String id);
	
	public int boarLikeDelete(@Param("bid")int bid, @Param("id")String id);
	
	public int boardLikeCount(@Param("bid")int bid); // LIKE - 개수

	public List<BoardVO> boardStar();
	
	public int getTotalCnt(@Param("type") String type);
	
	public int myBoardCnt(@Param("id")String id);
	
	public List<BoardVO> myBoardList(@Param("id")String id);
	
	public List<BoardVO> MainPageboardList();	//메인페이지 출력용
	
	public BoardVO latestBoard(String writer);



}
