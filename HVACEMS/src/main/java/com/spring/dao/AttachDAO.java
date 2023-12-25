package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.AttachVO;

public interface AttachDAO {
	
	public List<AttachVO> selectAttachesByCheckNum(int checkNum)throws SQLException;
	
	public AttachVO selectAttachByAttachNum(int attachNum)throws SQLException;
	
	public void insertAttach(AttachVO attach) throws SQLException;

	public void deleteAttach(int attachNum) throws SQLException;

	public void deleteAllAttach(int checkNum)throws SQLException;
}