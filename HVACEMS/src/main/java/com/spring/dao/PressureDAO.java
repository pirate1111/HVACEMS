package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchListCommand;
import com.spring.dto.PressureVO;

public interface PressureDAO {

	List<PressureVO> selectPressure(SearchListCommand command) throws SQLException;
	
	List<PressureVO> selectPressureGraph(SearchListCommand command) throws SQLException;
 	
	int selectSearchPressureListCount(SearchListCommand command) throws SQLException;
	
	void insertPressure(PressureVO pressure) throws SQLException;
	
	int selectPressureSeqNext() throws SQLException;
}
