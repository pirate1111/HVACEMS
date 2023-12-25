package com.spring.dto;

import java.util.Date;

public class BreakVO {

	String breakRecordNum;
	String hvacNum;
	Date breakDate;
	int breakNum;
	
	public String getBreakRecordNum() {
		return breakRecordNum;
	}
	public void setBreakRecordNum(String breakRecordNum) {
		this.breakRecordNum = breakRecordNum;
	}
	public String getHvacNum() {
		return hvacNum;
	}
	public void setHvacNum(String hvacNum) {
		this.hvacNum = hvacNum;
	}
	public Date getBreakDate() {
		return breakDate;
	}
	public void setBreakDate(Date breakDate) {
		this.breakDate = breakDate;
	}
	public int getBreakNum() {
		return breakNum;
	}
	public void setBreakNum(int breakNum) {
		this.breakNum = breakNum;
	}
	
}
