package com.spring.dto;

import java.util.Date;

public class CostChangeVO {

	int baseFee;			//전력량요금
	Date costChangeDate;	//날짜
	int contractedPower;	//계약전력
	double tax;				//부가세
	double fund;			//기후환경요금
	int budget;				//예산
	
	int lightLoad;			//寃쎈��븯
	int mediumLoad;			//以묎컙遺��븯
	int maximumLoad;		//理쒕�遺��븯
	int summer;				//�뿬由�(�븯�젅湲�)
	int inter;				//遊�,媛��쓣(媛꾩젅湲�)
	int winter;				//寃⑥슱(�룞�젅湲�)
	
	public int getBaseFee() {
		return baseFee;
	}
	public void setBaseFee(int baseFee) {
		this.baseFee = baseFee;
	}
	public Date getCostChangeDate() {
		return costChangeDate;
	}
	public void setCostChangeDate(Date costChangeDate) {
		this.costChangeDate = costChangeDate;
	}
	public int getContractedPower() {
		return contractedPower;
	}
	public void setContractedPower(int contractedPower) {
		this.contractedPower = contractedPower;
	}
	public double getTax() {
		return tax;
	}
	public void setTax(double tax) {
		this.tax = tax;
	}
	public double getFund() {
		return fund;
	}
	public void setFund(double fund) {
		this.fund = fund;
	}
	public int getLightLoad() {
		return lightLoad;
	}
	public void setLightLoad(int lightLoad) {
		this.lightLoad = lightLoad;
	}
	public int getMediumLoad() {
		return mediumLoad;
	}
	public void setMediumLoad(int mediumLoad) {
		this.mediumLoad = mediumLoad;
	}
	public int getMaximumLoad() {
		return maximumLoad;
	}
	public void setMaximumLoad(int maximumLoad) {
		this.maximumLoad = maximumLoad;
	}
	public int getSummer() {
		return summer;
	}
	public void setSummer(int summer) {
		this.summer = summer;
	}
	public int getInter() {
		return inter;
	}
	public void setInter(int inter) {
		this.inter = inter;
	}
	public int getWinter() {
		return winter;
	}
	public void setWinter(int winter) {
		this.winter = winter;
	}
}
