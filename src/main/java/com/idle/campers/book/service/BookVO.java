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
	
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookClient() {
		return bookClient;
	}
	public void setBookClient(String bookClient) {
		this.bookClient = bookClient;
	}
	public String getBookManager() {
		return bookManager;
	}
	public void setBookManager(String bookManager) {
		this.bookManager = bookManager;
	}
	public Date getBookStartDate() {
		return bookStartDate;
	}
	public void setBookStartDate(Date bookStartDate) {
		this.bookStartDate = bookStartDate;
	}
	public Date getBookEndDate() {
		return bookEndDate;
	}
	public void setBookEndDate(Date bookEndDate) {
		this.bookEndDate = bookEndDate;
	}
	public String getBookState() {
		return bookState;
	}
	public void setBookState(String bookState) {
		this.bookState = bookState;
	}
	public int getBookRoomId() {
		return bookRoomId;
	}
	public void setBookRoomId(int bookRoomId) {
		this.bookRoomId = bookRoomId;
	}
	public int getBookPersonnel() {
		return bookPersonnel;
	}
	public void setBookPersonnel(int bookPersonnel) {
		this.bookPersonnel = bookPersonnel;
	}
	public int getBookCampId() {
		return bookCampId;
	}
	public void setBookCampId(int bookCampId) {
		this.bookCampId = bookCampId;
	}
	public int getBookCost() {
		return bookCost;
	}
	public void setBookCost(int bookCost) {
		this.bookCost = bookCost;
	}
	public Date getBookDate() {
		return bookDate;
	}
	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}
}
