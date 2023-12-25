package com.spring.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ClasssVO {

	int classsNum;
	String dustmeterNum;
	Date classsDate;
	int classs;
	
	String date;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getclasssNum() {
		return classsNum;
	}
	public void setclasssNum(int classsNum) {
		this.classsNum = classsNum;
	}
	public String getDustmeterNum() {
		return dustmeterNum;
	}
	public void setDustmeterNum(String dustmeterNum) {
		this.dustmeterNum = dustmeterNum;
	}
	public Date getclasssDate() {
		return classsDate;
	}
	public void setclasssDate(Date classsDate) {
		this.classsDate = classsDate;
	}
	public int getclasss() {
		return classs;
	}
	public void setclasss(int classs) {
		this.classs = classs;
	}
	
	
}
