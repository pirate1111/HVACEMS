package com.spring.dto;

public class ThermometerVO {
	String thermometerNum;
	float thermometerSet;
	float thermometerErrorRange;
	String sectionNum;
	
	public String getThermometerNum() {
		return thermometerNum;
	}
	public void setThermometerNum(String thermometerNum) {
		this.thermometerNum = thermometerNum;
	}
	public float getThermometerSet() {
		return thermometerSet;
	}
	public void setThermometerSet(float thermometerSet) {
		this.thermometerSet = thermometerSet;
	}
	public float getThermometerErrorRange() {
		return thermometerErrorRange;
	}
	public void setThermometerErrorRange(float thermometerErrorRange) {
		this.thermometerErrorRange = thermometerErrorRange;
	}
	public String getSectionNum() {
		return sectionNum;
	}
	public void setSectionNum(String sectionNum) {
		this.sectionNum = sectionNum;
	}
	
}
