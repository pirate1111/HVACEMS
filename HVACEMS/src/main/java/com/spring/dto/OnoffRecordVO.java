package com.spring.dto;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class OnoffRecordVO {

	private int onoffRecordNum;
	private Map<String, Integer> onoff = new HashMap<String, Integer>();
	private Date onoffRecordDate;
	private int onoffYn;
	private String hvacNum;
	
	public int getOnoffYn() {
		return onoffYn;
	}
	public void setOnoffYn(int onoffYn) {
		this.onoffYn = onoffYn;
	}
	public String getHvacNum() {
		return hvacNum;
	}
	public void setHvacNum(String hvacNum) {
		this.hvacNum = hvacNum;
	}
	public int getOnoffRecordNum() {
		return onoffRecordNum;
	}
	public void setOnoffRecordNum(int onoffRecordNum) {
		this.onoffRecordNum = onoffRecordNum;
	}
	public Date getOnoffRecordDate() {
		return onoffRecordDate;
	}
	public void setOnoffRecordDate(Date onoffRecordDate) {
		this.onoffRecordDate = onoffRecordDate;
	}
	public Map<String, Integer> getOnoff() {
		return onoff;
	}
	public void setOnoff(Map<String, Integer> onoff) {
		this.onoff = onoff;
	}
	
	
}
