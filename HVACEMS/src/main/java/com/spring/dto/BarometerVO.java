package com.spring.dto;

public class BarometerVO {
	String barometerNum;
	float barometerSet;
	float barometerErrorRange;
	String sectionNum;
	
	public String getBarometerNum() {
		return barometerNum;
	}
	public void setBarometerNum(String barometerNum) {
		this.barometerNum = barometerNum;
	}
	public float getBarometerSet() {
		return barometerSet;
	}
	public void setBarometerSet(float barometerSet) {
		this.barometerSet = barometerSet;
	}
	public float getBarometerErrorRange() {
		return barometerErrorRange;
	}
	public void setBarometerErrorRange(float barometerErrorRange) {
		this.barometerErrorRange = barometerErrorRange;
	}
	public String getSectionNum() {
		return sectionNum;
	}
	public void setSectionNum(String sectionNum) {
		this.sectionNum = sectionNum;
	}
	
}
