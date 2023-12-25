package com.spring.dto;

import java.util.List;

public class MenuVO {
	
	String menuCode;
	String menuName;
	String menuUrl;
	String jText;
	String upCode;
	String menuIcon;
	int menuLevel;
	
	private List<SubmenuVO> submenuList;
	
	public List<SubmenuVO> getSubmenuList(){
		return submenuList;
	}
	public void setSubmenuList(List<SubmenuVO> submenuList) {
		this.submenuList = submenuList;
	}
	
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getjText() {
		return jText;
	}
	public void setjText(String jText) {
		this.jText = jText;
	}
	public String getUpCode() {
		return upCode;
	}
	public void setUpCode(String upCode) {
		this.upCode = upCode;
	}
	public String getMenuIcon() {
		return menuIcon;
	}
	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}
	public int getMenuLevel() {
		return menuLevel;
	}
	public void setMenuLevel(int menuLevel) {
		this.menuLevel = menuLevel;
	}


}
