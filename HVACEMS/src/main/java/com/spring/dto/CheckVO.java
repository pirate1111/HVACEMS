package com.spring.dto;

import java.util.Date;
import java.util.List;

public class CheckVO {

	private int checkNum;							// 점검번호
	private String adminId;							// 점검자
	private String checkBox;						// 체크박스요약코드
	private Date checkDate;							// 점검날짜
	private Date checkUpdateDate;					// 수정날짜
	private String checkClass;						// 점검유형
	private int checkcheckNum;						// 점검유형번호
	private int checkCnt;							// 점검조회수
	private List<AttachVO> attachList;				// 첨부파일 리스트 가져오기

	public String getCheckBox() {
		return checkBox;
	}
	public void setCheckBox(String checkBox) {
		this.checkBox = checkBox;
	}
	public int getCheckNum() {
		return checkNum;
	}
	public void setCheckNum(int checkNum) {
		this.checkNum = checkNum;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public Date getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}
	public Date getCheckUpdateDate() {
		return checkUpdateDate;
	}
	public void setCheckUpdateDate(Date checkUpdateDate) {
		this.checkUpdateDate = checkUpdateDate;
	}
	public String getCheckClass() {
		return checkClass;
	}
	public void setCheckClass(String checkClass) {
		this.checkClass = checkClass;
	}
	public int getCheckcheckNum() {
		return checkcheckNum;
	}
	public void setCheckcheckNum(int checkcheckNum) {
		this.checkcheckNum = checkcheckNum;
	}
	public int getCheckCnt() {
		return checkCnt;
	}
	public void setCheckCnt(int checkCnt) {
		this.checkCnt = checkCnt;
	}
	public List<AttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
}