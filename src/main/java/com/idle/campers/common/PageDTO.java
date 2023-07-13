package com.idle.campers.common;

import lombok.Data;

@Data
public class PageDTO {
	private int startPage, endPage;
	private boolean prev, next;
	private int total;
	private int currPage;

	public PageDTO(int currPage, int total) {
		this.currPage = currPage;
		this.total = total;

		this.endPage = (int) Math.ceil((double) currPage / 10) * 10;
		this.startPage = this.endPage - 9;

		int realEnd = (int) (Math.ceil((double) total / 10));
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
			
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		
	}
}
