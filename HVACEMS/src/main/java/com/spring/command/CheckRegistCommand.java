package com.spring.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.CheckVO;

public class CheckRegistCommand {
	
	private String writer;						// 점검자
	private int checkcheckNum;					// 점검유형
	private List<String> item_a;				// 체크박스 a구역 체크데이터
	private List<String> item_b;				// 체크박스 b구역 체크데이터
	private List<String> item_c;				// 체크박스 c구역 체크데이터
	private List<String> item_d;				// 체크박스 d구역 체크데이터
	private List<String> item_e;				// 체크박스 e구역 체크데이터
	private List<String> item_f;				// 체크박스 f구역 체크데이터
	private List<String> item_g;				// 체크박스 g구역 체크데이터
	private List<String> item_h;				// 체크박스 h구역 체크데이터
	private List<String> item_i;				// 체크박스 i구역 체크데이터
	private List<String> item_j;				// 체크박스 j구역 체크데이터
	private List<MultipartFile> UploadFile;		// 첨부파일

	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getCheckcheckNum() {
		return checkcheckNum;
	}
	public void setCheckcheckNum(int checkcheckNum) {
		this.checkcheckNum = checkcheckNum;
	}
	public List<String> getItem_a() {
		return item_a;
	}
	public void setItem_a(List<String> item_a) {
		this.item_a = item_a;
	}
	public List<String> getItem_b() {
		return item_b;
	}
	public void setItem_b(List<String> item_b) {
		this.item_b = item_b;
	}
	public List<String> getItem_c() {
		return item_c;
	}
	public void setItem_c(List<String> item_c) {
		this.item_c = item_c;
	}
	public List<String> getItem_d() {
		return item_d;
	}
	public void setItem_d(List<String> item_d) {
		this.item_d = item_d;
	}
	public List<String> getItem_e() {
		return item_e;
	}
	public void setItem_e(List<String> item_e) {
		this.item_e = item_e;
	}
	public List<String> getItem_f() {
		return item_f;
	}
	public void setItem_f(List<String> item_f) {
		this.item_f = item_f;
	}
	public List<String> getItem_g() {
		return item_g;
	}
	public void setItem_g(List<String> item_g) {
		this.item_g = item_g;
	}
	public List<String> getItem_h() {
		return item_h;
	}
	public void setItem_h(List<String> item_h) {
		this.item_h = item_h;
	}
	public List<String> getItem_i() {
		return item_i;
	}
	public void setItem_i(List<String> item_i) {
		this.item_i = item_i;
	}
	public List<String> getItem_j() {
		return item_j;
	}
	public void setItem_j(List<String> item_j) {
		this.item_j = item_j;
	}
	public List<MultipartFile> getUploadFile() {
		return UploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		UploadFile = uploadFile;
	}
	public CheckVO toCheckVO() {
		CheckVO check = new CheckVO();
		String checkValue="";
		
		checkValue=calcValue(item_a,checkValue)+","+
		calcValue(item_b,checkValue)+","+
		calcValue(item_c,checkValue)+","+
		calcValue(item_d,checkValue)+","+
		calcValue(item_e,checkValue)+","+
		calcValue(item_f,checkValue)+","+
		calcValue(item_g,checkValue)+","+
		calcValue(item_h,checkValue)+","+
		calcValue(item_i,checkValue)+","+
		calcValue(item_j,checkValue);

		check.setAdminId(this.writer);
		check.setCheckBox(checkValue);
		check.setCheckcheckNum(this.checkcheckNum);
		
		return check;
	}
	private String calcValue(List<String> item, String checkValue) {
		if(item !=null)
			for(int i=0;i<item.size();i++) {
				if(i != item.size()-1) {
					checkValue+=item.get(i)+",";
				}else {
					checkValue+=item.get(i);
				}
			}
	return checkValue;
	}	
}