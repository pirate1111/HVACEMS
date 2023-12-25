package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.BreakVO;

public interface BreakDAO {

	List<BreakVO> selectBreakRecord() throws SQLException;
	
	int selectTypeByBreakNum(String breakRecordNum) throws SQLException;
	String selectHvacBreakNum(String breakRecordNum) throws SQLException;
	String selectNameByNum(int breakNum) throws SQLException;
	
}
