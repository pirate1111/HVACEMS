package com.spring.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.command.CheckSearchListCommand;
import com.spring.dto.AttachVO;
import com.spring.dto.CheckVO;

public interface CheckService {

	// 목록조회
	Map<String, Object> getSearchCheck(CheckSearchListCommand command) throws SQLException;
	
	// 글읽기(조회수증가)
	CheckVO read(int checkNum) throws SQLException;
	
	// 글 조회
	CheckVO getCheck(int checkNum) throws SQLException;
	
	// 글 작성
	void registCheck(CheckVO check) throws SQLException;
	
	// 글 수정
	void modifyCheck(CheckVO check) throws SQLException;
	
	// 글 삭제
	void removeCheck(int checkNum) throws SQLException;

	//첨부파일 조회
	AttachVO getAttachByAttachNum(int attachNum) throws SQLException;

	//파일정보 삭제
	void removeAttachByAttachNum(int attachNum) throws SQLException;
}
