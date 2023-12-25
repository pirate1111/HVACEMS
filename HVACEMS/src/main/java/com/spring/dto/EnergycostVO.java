package com.spring.dto;

import java.util.Date;

public class EnergycostVO {

	int costNum;
	long energyCost;
	Date energycostDate;
	int consumeNum;

	int sum;
	long year;
	long lastYear;
	
	int month;
	int todayEnergycost;
	int totalEnergy;
	
	public int getCostNum() {
		return costNum;
	}
	public void setCostNum(int costNum) {
		this.costNum = costNum;
	}
	public long getEnergyCost() {
		return energyCost;
	}
	public void setEnergyCost(long energyCost) {
		this.energyCost = energyCost;
	}
	public Date getEnergycostDate() {
		return energycostDate;
	}
	public void setEnergycostDate(Date energycostDate) {
		this.energycostDate = energycostDate;
	}
	public int getConsumeNum() {
		return consumeNum;
	}
	public void setConsumeNum(int consumeNum) {
		this.consumeNum = consumeNum;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public long getYear() {
		return year;
	}
	public void setYear(long year) {
		this.year = year;
	}
	public long getLastYear() {
		return lastYear;
	}
	public void setLastYear(long lastYear) {
		this.lastYear = lastYear;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getTodayEnergycost() {
		return todayEnergycost;
	}
	public void setTodayEnergycost(int todayEnergycost) {
		this.todayEnergycost = todayEnergycost;
	}
	public int getTotalEnergy() {
		return totalEnergy;
	}
	public void setTotalEnergy(int totalEnergy) {
		this.totalEnergy = totalEnergy;
	}
}
