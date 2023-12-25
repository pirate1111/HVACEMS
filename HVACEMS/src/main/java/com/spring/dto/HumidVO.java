package com.spring.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class HumidVO {
	
	int humidNum;
	String hygrometerNum;
	Date humidDate;
	int humid;
	
	String date;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getHumidNum() {
		return humidNum;
	}
	public void setHumidNum(int humidNum) {
		this.humidNum = humidNum;
	}
	public String getHygrometerNum() {
		return hygrometerNum;
	}
	public void setHygrometerNum(String hygrometerNum) {
		this.hygrometerNum = hygrometerNum;
	}
	public Date getHumidDate() {
		return humidDate;
	}
	public void setHumidDate(Date humidDate) {
		this.humidDate = humidDate;
	}
	public int getHumid() {
		return humid;
	}
	public void setHumid(int humid) {
		this.humid = humid;
	}
	
	
}
