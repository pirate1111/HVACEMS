package com.spring.dto;

import java.util.Date;


public class BreakrecordVO {
	
	String breakrecordNum;
	String HvacNum;
	Date breakDate;
	int breakNum;
	
	public String getBreakrecordNum() {
		return breakrecordNum;
	}
	public void setBreakrecordNum(String breakrecordNum) {
		this.breakrecordNum = breakrecordNum;
	}
	public String getHvacNum() {
		return HvacNum;
	}
	public void setHvacNum(String hvacNum) {
		HvacNum = hvacNum;
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
