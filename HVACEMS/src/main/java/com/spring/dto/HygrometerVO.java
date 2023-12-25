package com.spring.dto;

public class HygrometerVO {
	String hygrometerNum;
	int hygrometerSet;
	int hygrometerErrorRange;
	String sectionNum;
	
	public String getHygrometerNum() {
		return hygrometerNum;
	}
	public void setHygrometerNum(String hygrometerNum) {
		this.hygrometerNum = hygrometerNum;
	}
	public int getHygrometerSet() {
		return hygrometerSet;
	}
	public void setHygrometerSet(int hygrometerSet) {
		this.hygrometerSet = hygrometerSet;
	}
	public int getHygrometerErrorRange() {
		return hygrometerErrorRange;
	}
	public void setHygrometerErrorRange(int hygrometerErrorRange) {
		this.hygrometerErrorRange = hygrometerErrorRange;
	}
	public String getSectionNum() {
		return sectionNum;
	}
	public void setSectionNum(String sectionNum) {
		this.sectionNum = sectionNum;
	}
	
}
