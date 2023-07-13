package com.idle.campers.book.service;

import java.sql.Date;

import lombok.Data;

@Data
public class BookVO {
	private int bookId;
	private String bookClient;
	private String bookManager;
	private Date bookStartDate;
	private Date bookEndDate;
	private String bookState;
	private int bookRoomId;
	private int bookPersonnel;
	private int bookCampId;
	private int bookCost;
	private Date bookDate;
}
