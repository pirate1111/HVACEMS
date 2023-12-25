package com.spring.dto;

public class HvacdataVO {

	float cooler;
	float heater;
	float hvacTemperature;
	int hvacWind;
	int hvacHumid;
	int tempeController;
	int windController;
	int humidController;
	String section;
	
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public float getCooler() {
		return cooler;
	}
	public void setCooler(float cooler) {
		this.cooler = cooler;
	}
	public float getHeater() {
		return heater;
	}
	public void setHeater(float heater) {
		this.heater = heater;
	}
	public float getHvacTemperature() {
		return hvacTemperature;
	}
	public void setHvacTemperature(float hvacTemperature) {
		this.hvacTemperature = hvacTemperature;
	}
	public int getHvacWind() {
		return hvacWind;
	}
	public void setHvacWind(int hvacWind) {
		this.hvacWind = hvacWind;
	}
	public int getHvacHumid() {
		return hvacHumid;
	}
	public void setHvacHumid(int hvacHumid) {
		this.hvacHumid = hvacHumid;
	}
	public int getTempeController() {
		return tempeController;
	}
	public void setTempeController(int tempeController) {
		this.tempeController = tempeController;
	}
	public int getWindController() {
		return windController;
	}
	public void setWindController(int windController) {
		this.windController = windController;
	}
	public int getHumidController() {
		return humidController;
	}
	public void setHumidController(int humidController) {
		this.humidController = humidController;
	}
	
}
