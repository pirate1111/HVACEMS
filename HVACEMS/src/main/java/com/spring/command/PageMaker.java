package com.spring.command;

public class PageMaker {

	private int totalCount; 
	private int startPage = 1;
	private int endPage = 1;
	private int realEndPage;
	private boolean prev;
	private boolean next;

	private int displayPageNum = 10;
	
	SearchListCommand command = new SearchListCommand();

	private void calcData() {
		endPage = (int) (Math.ceil(command.getPage() / (double) displayPageNum)* displayPageNum);
		startPage = (endPage - displayPageNum) + 1;

		realEndPage = (int) (Math.ceil(totalCount / (double) command.getPerPageNum()));

		if (startPage < 0) {
			startPage = 1;
		}
		if (endPage > realEndPage) {
			endPage = realEndPage;
		}

		prev = startPage == 1 ? false : true;
		next = endPage < realEndPage ? true : false;
	}

	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public void setCommand(SearchListCommand command) {
		this.command = command;
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

	public SearchListCommand getCommand() {
		return command;
	}

	
}
