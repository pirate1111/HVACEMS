package com.spring.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class HvacelecVO {

	int hvacelecdataNum;
	Date hvacelecDate;
	int hvacelecData;
	String hvacelecSection;
	
	String date;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getHvacelecSection() {
		return hvacelecSection;
	}
	public void setHvacelecSection(String hvacelecSection) {
		this.hvacelecSection = hvacelecSection;
	}
	public int getHvacelecdataNum() {
		return hvacelecdataNum;
	}
	public void setHvacelecdataNum(int hvacelecdataNum) {
		this.hvacelecdataNum = hvacelecdataNum;
	}
	public Date getHvacelecDate() {
		return hvacelecDate;
	}
	public void setHvacelecDate(Date hvacelecDate) {
		this.hvacelecDate = hvacelecDate;
	}
	public int getHvacelecData() {
		return hvacelecData;
	}
	public void setHvacelecData(int hvacelecData) {
		this.hvacelecData = hvacelecData;
	}
	
	
}
