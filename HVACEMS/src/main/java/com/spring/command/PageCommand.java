package com.spring.command;

public class PageCommand {

	private int totalCount; 
	private int startPage = 1;
	private int endPage = 1;
	private int realEndPage;
	private boolean prev;
	private boolean next;

	private int displayPageNum = 10;
	
	private int page = 1;
	private int perPageNum = 10;
	private int startRowNum = 0;
	
	private void calcData() {
		endPage = (int) (Math.ceil(this.getPage() / (double) displayPageNum)* displayPageNum);
		startPage = (endPage - displayPageNum) + 1;

		realEndPage = (int) (Math.ceil(totalCount / (double) this.getPerPageNum()));

		if (startPage < 0) {
			startPage = 1;
		}
		if (endPage > realEndPage) {
			endPage = realEndPage;
		}

		prev = startPage == 1 ? false : true;
		next = endPage < realEndPage ? true : false;
	}

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
		setStartRowNum();
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
		setStartRowNum();
	}
	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum() {
		this.startRowNum = (this.page-1)* this.perPageNum;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getRealEndPage() {
		return realEndPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	
}
