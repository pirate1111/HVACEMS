package com.spring.dto;


import java.util.Date;


public class EnergyconsumeVO {

	int consumeNum;
	float consumeEnergy;
	int consumeOperation;
	String hvacNum;
	Date consumeDate;
	int heater;
	int cooler;
	int dehumidifier;
	

	public int getHeater() {
		return heater;
	}
	public void setHeater(int heater) {
		this.heater = heater;
	}
	public int getCooler() {
		return cooler;
	}
	public void setCooler(int cooler) {
		this.cooler = cooler;
	}
	public int getDehumidifier() {
		return dehumidifier;
	}
	public void setDehumidifier(int dehumidifier) {
		this.dehumidifier = dehumidifier;
	}
	public int getConsumeNum() {
		return consumeNum;
	}
	public void setConsumeNum(int consumeNum) {
		this.consumeNum = consumeNum;
	}
	public float getConsumeEnergy() {
		return consumeEnergy;
	}
	public void setConsumeEnergy(float consumeEnergy) {
		this.consumeEnergy = consumeEnergy;
	}
	public int getConsumeOperation() {
		return consumeOperation;
	}
	public void setConsumeOperation(int consumeOperation) {
		this.consumeOperation = consumeOperation;
	}
	public String getHvacNum() {
		return hvacNum;
	}
	public void setHvacNum(String hvacNum) {
		this.hvacNum = hvacNum;
	}
	public Date getConsumeDate() {
		return consumeDate;
	}
	public void setConsumeDate(Date consumeDate) {
		this.consumeDate = consumeDate;
	}
	
	
}
