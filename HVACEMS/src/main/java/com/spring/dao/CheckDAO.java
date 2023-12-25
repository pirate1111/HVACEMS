package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.CheckSearchListCommand;
import com.spring.dto.CheckVO;

public interface CheckDAO {
	
	List<CheckVO> selectSearchCheck(CheckSearchListCommand checkCommand) throws SQLException;

	int selectSearchCheckCount(CheckSearchListCommand checkCommand) throws SQLException;

	CheckVO selectCheckByCheckNum(int checkNum) throws SQLException;

	void insertCheck(CheckVO check) throws SQLException;

	void updateCheck(CheckVO check) throws SQLException;

	void deleteCheck(int checkNum) throws SQLException;
	
	void increaseCheckCnt(int checkNum) throws SQLException;

	int selectCheckSeqNext() throws SQLException;
}
