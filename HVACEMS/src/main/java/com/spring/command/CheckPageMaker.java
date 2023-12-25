package com.spring.command;

public class CheckPageMaker {

	private int totalCount; // 전체 행의 개수
	private int startPage = 1; // 시작 페이지 번호
	private int endPage = 1; // 마지막 페이지 번호
	private int realEndPage; // 끝 페이지 번호
	private boolean prev; // 이전페이지 버튼 유무
	private boolean next; // 다음페이지 버튼 유무

	private int displayPageNum = 20; // 한 페이지에 보여줄 페이지번호 개수
	
	CheckSearchListCommand command = new CheckSearchListCommand();

	// starPage,endPage, prev, next 설정. by totalCount
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
	public CheckSearchListCommand getCommand() {
		return command;
	}
	public void setCommand(CheckSearchListCommand command) {
		this.command = command;
	}
	
}