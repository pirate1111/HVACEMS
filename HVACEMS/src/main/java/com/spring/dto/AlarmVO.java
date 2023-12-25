package com.spring.dto;

import java.util.Date;

public class AlarmVO {

	String alarmNum;
	int alarmRead;
	Date alarmDate;
	int alarmCheck;
	String adminId;
	String alarmContent;
	String breakRecordNum;
	
	String hvacNum;
	int breakNum;
	String breakName;
	
	
	public String getBreakName() {
		return breakName;
	}
	public void setBreakName(String breakName) {
		this.breakName = breakName;
	}
	public String getHvacNum() {
		return hvacNum;
	}
	public void setHvacNum(String hvacNum) {
		this.hvacNum = hvacNum;
	}
	public String getAlarmNum() {
		return alarmNum;
	}
	public void setAlarmNum(String alarmNum) {
		this.alarmNum = alarmNum;
	}
	public int getAlarmRead() {
		return alarmRead;
	}
	public void setAlarmRead(int alarmRead) {
		this.alarmRead = alarmRead;
	}
	public Date getAlarmDate() {
		return alarmDate;
	}
	public void setAlarmDate(Date alarmDate) {
		this.alarmDate = alarmDate;
	}
	public int getAlarmCheck() {
		return alarmCheck;
	}
	public void setAlarmCheck(int alarmCheck) {
		this.alarmCheck = alarmCheck;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAlarmContent() {
		return alarmContent;
	}
	public void setAlarmContent(String alarmContent) {
		this.alarmContent = alarmContent;
	}
	public String getBreakRecordNum() {
		return breakRecordNum;
	}
	public void setBreakRecordNum(String breakRecordNum) {
		this.breakRecordNum = breakRecordNum;
	}
	public int getBreakNum() {
		return breakNum;
	}
	public void setBreakNum(int breakNum) {
		this.breakNum = breakNum;
	}
	
	
}
