package com.spring.command;

import java.util.Date;

public class SearchListCommand {
	private int page = 1;
	private int perPageNum = 11;
	private String keyword = "";
	private String searchType = "";
	private String sectionType = "";
	private String fromDate = "";
	private String toDate = "";
	
	private int startRowNum = 0;
	
	private int yearCount;
	private String year;
	private String month;
	private int totalEnergy;
	private Date energycostDate;
	private long totalYear;
	private String section;
	
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public Date getEnergycostDate() {
		return energycostDate;
	}
	public void setEnergycostDate(Date energycostDate) {
		this.energycostDate = energycostDate;
	}
	public long getTotalYear() {
		return totalYear;
	}
	public void setTotalYear(long totalYear) {
		this.totalYear = totalYear;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getTotalEnergy() {
		return totalEnergy;
	}
	public void setTotalEnergy(int totalEnergy) {
		this.totalEnergy = totalEnergy;
	}
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
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
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSectionType() {
		return sectionType;
	}
	public void setSectionType(String sectionType) {
		this.sectionType = sectionType;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum() {
		this.startRowNum = (this.page-1)* this.perPageNum;
	}
	public int getYearCount() {
		return yearCount;
	}
	public void setYearCount(int yearCount) {
		this.yearCount = yearCount;
	}

}
