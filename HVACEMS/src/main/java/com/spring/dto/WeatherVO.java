package com.spring.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class WeatherVO {

	String weatherdataNum;
	Date weatherDate;
	int weatherTemperature;
	int weatherPressure;
	int weatherHumidity;
	String consumeNum;
	
	String date;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getWeatherdataNum() {
		return weatherdataNum;
	}
	public void setWeatherdataNum(String weatherdataNum) {
		this.weatherdataNum = weatherdataNum;
	}
	public Date getWeatherDate() {
		return weatherDate;
	}
	public void setWeatherDate(Date weatherDate) {
		this.weatherDate = weatherDate;
	}
	public int getWeatherTemperature() {
		return weatherTemperature;
	}
	public void setWeatherTemperature(int weatherTemperature) {
		this.weatherTemperature = weatherTemperature;
	}
	public int getWeatherPressure() {
		return weatherPressure;
	}
	public void setWeatherPressure(int weatherPressure) {
		this.weatherPressure = weatherPressure;
	}
	public int getWeatherHumidity() {
		return weatherHumidity;
	}
	public void setWeatherHumidity(int weatherHumidity) {
		this.weatherHumidity = weatherHumidity;
	}
	public String getConsumeNum() {
		return consumeNum;
	}
	public void setConsumeNum(String consumeNum) {
		this.consumeNum = consumeNum;
	}
	
}
