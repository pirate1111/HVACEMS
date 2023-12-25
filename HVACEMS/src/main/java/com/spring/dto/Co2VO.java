package com.spring.dto;

import java.util.Date;

public class Co2VO {

	String co2Num;
	int co2Account;
	int co2Target;
	Date co2Date;
	String consumeNum;
	int co2Price;
	
	float growthRateCo2;
	float averageCo2;
	int sumCo2;
	int maxCo2;
	int minCo2;
	
	public String getCo2Num() {
		return co2Num;
	}
	public void setCo2Num(String co2Num) {
		this.co2Num = co2Num;
	}
	public int getCo2Account() {
		return co2Account;
	}
	public void setCo2Account(int co2Account) {
		this.co2Account = co2Account;
	}
	public int getCo2Target() {
		return co2Target;
	}
	public void setCo2Target(int co2Target) {
		this.co2Target = co2Target;
	}
	public Date getCo2Date() {
		return co2Date;
	}
	public void setCo2Date(Date co2Date) {
		this.co2Date = co2Date;
	}
	public String getConsumeNum() {
		return consumeNum;
	}
	public void setConsumeNum(String consumeNum) {
		this.consumeNum = consumeNum;
	}
	
	public float getGrowthRateCo2() {
		return growthRateCo2;
	}
	public void setGrowthRateCo2(float growthRateCo2) {
		this.growthRateCo2 = growthRateCo2;
	}
	public float getAverageCo2() {
		return averageCo2;
	}
	public void setAverageCo2(float averageCo2) {
		this.averageCo2 = averageCo2;
	}
	public int getSumCo2() {
		return sumCo2;
	}
	public void setSumCo2(int sumCo2) {
		this.sumCo2 = sumCo2;
	}
	public int getMaxCo2() {
		return maxCo2;
	}
	public void setMaxCo2(int maxCo2) {
		this.maxCo2 = maxCo2;
	}
	public int getMinCo2() {
		return minCo2;
	}
	public void setMinCo2(int minCo2) {
		this.minCo2 = minCo2;
	}
	public int getCo2Price() {
		return co2Price;
	}
	public void setCo2Price(int co2Price) {
		this.co2Price = co2Price;
	}
	
}
