package com.spring.command;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CheckSearchListCommand {
	private int page = 1;
	private int perPageNum = 20;
	private int startRowNum = 0;
	private Date startTargetDate = new Date();
	private Date endTargetDate = new Date();
	private String searchType = "";
	
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
	public Date getstartTargetDate() {
		return startTargetDate;
	}
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public void setstartTargetDate(Date startTargetDate) {
		this.startTargetDate = startTargetDate;
	}
	public Date getEndTargetDate() {
		return endTargetDate;
	}
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public void setEndTargetDate(Date endTargetDate) {
		this.endTargetDate = endTargetDate;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
}