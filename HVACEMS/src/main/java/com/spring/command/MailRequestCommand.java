package com.spring.command;

import org.springframework.web.multipart.MultipartFile;

public class MailRequestCommand {
	
	private String sender;		// 메일 보내는 사람
	private String receiver;	// 메일 받는 사람
	private String content;		// 메일내용
	private String title;		// 메일제목
	private MultipartFile file;	// 첨부파일

	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
}