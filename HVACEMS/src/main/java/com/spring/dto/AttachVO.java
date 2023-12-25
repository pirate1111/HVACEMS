package com.spring.dto;

import java.util.Date;

public class AttachVO {

	private int attachNum; 				 // 첨부파일 번호
	private String attachFileUrl;		 // 첨부파일 경로
	private String attachFileName;  	 // 첨부파일명
	private String attachFileType;	 	 // 첨부파일형식
	private Date attachDate;	    	 // 첨부파일 등록일
	private int checkNum;				 // 점검리스트 번호
	private String adminId;	             // 점검자
	
	public int getAttachNum() {
		return attachNum;
	}
	public void setAttachNum(int attachNum) {
		this.attachNum = attachNum;
	}
	public String getAttachFileUrl() {
		return attachFileUrl;
	}
	public void setAttachFileUrl(String attachFileUrl) {
		this.attachFileUrl = attachFileUrl;
	}
	public String getAttachFileName() {
		return attachFileName;
	}
	public void setAttachFileName(String attachFileName) {
		this.attachFileName = attachFileName;
	}
	public String getAttachFileType() {
		return attachFileType;
	}
	public void setAttachFileType(String attachFileType) {
		this.attachFileType = attachFileType;
	}
	public Date getAttachDate() {
		return attachDate;
	}
	public void setAttachDate(Date attachDate) {
		this.attachDate = attachDate;
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
}