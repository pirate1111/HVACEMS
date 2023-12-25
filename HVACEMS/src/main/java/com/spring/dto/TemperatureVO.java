package com.spring.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TemperatureVO {
	
	int temperatureNum;
	String thermometerNum;
	Date temperatureDate;
	float temperature;
	
	String date;

	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getTemperatureNum() {
		return temperatureNum;
	}
	public void setTemperatureNum(int temperatureNum) {
		this.temperatureNum = temperatureNum;
	}
	public String getThermometerNum() {
		return thermometerNum;
	}
	public void setThermometerNum(String thermometerNum) {
		this.thermometerNum = thermometerNum;
	}
	public Date getTemperatureDate() {
		return temperatureDate;
	}
	public void setTemperatureDate(Date temperatureDate) {
		this.temperatureDate = temperatureDate;
	}
	public float getTemperature() {
		return temperature;
	}
	public void setTemperature(float temperature) {
		this.temperature = temperature;
	}
	
}
