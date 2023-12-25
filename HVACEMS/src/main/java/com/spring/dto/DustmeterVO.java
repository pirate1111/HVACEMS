package com.spring.dto;

public class DustmeterVO {

	String dustmeterNum;
	int dustmeterSet;
	int dustmeterErrorRange;
	String sectionNum;
	
	public String getDustmeterNum() {
		return dustmeterNum;
	}
	public void setDustmeterNum(String dustmeterNum) {
		this.dustmeterNum = dustmeterNum;
	}
	public int getDustmeterSet() {
		return dustmeterSet;
	}
	public void setDustmeterSet(int dustmeterSet) {
		this.dustmeterSet = dustmeterSet;
	}
	public int getDustmeterErrorRange() {
		return dustmeterErrorRange;
	}
	public void setDustmeterErrorRange(int dustmeterErrorRange) {
		this.dustmeterErrorRange = dustmeterErrorRange;
	}
	public String getSectionNum() {
		return sectionNum;
	}
	public void setSectionNum(String sectionNum) {
		this.sectionNum = sectionNum;
	}
	
}
