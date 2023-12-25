package com.spring.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PressureVO {

	int pressureNum;
	String barometerNum;
	Date pressureDate;
	float pressure;
	
	String date;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPressureNum() {
		return pressureNum;
	}
	public void setPressureNum(int pressureNum) {
		this.pressureNum = pressureNum;
	}
	public String getBarometerNum() {
		return barometerNum;
	}
	public void setBarometerNum(String barometerNum) {
		this.barometerNum = barometerNum;
	}
	public Date getPressureDate() {
		return pressureDate;
	}
	public void setPressureDate(Date pressureDate) {
		this.pressureDate = pressureDate;
	}
	public float getPressure() {
		return pressure;
	}
	public void setPressure(float pressure) {
		this.pressure = pressure;
	}
	
	
}
