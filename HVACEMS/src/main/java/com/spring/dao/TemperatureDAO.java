package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchListCommand;
import com.spring.dto.TemperatureVO;

public interface TemperatureDAO {

	List<TemperatureVO> selectTemperature(SearchListCommand command) throws SQLException;
	
	List<TemperatureVO> selectTemperatureGraph(SearchListCommand command) throws SQLException;
 	
	int selectSearchTemperatureListCount(SearchListCommand command) throws SQLException;
	
	void insertTemperature(TemperatureVO temperature) throws SQLException;
	
	int selectTemperatureSeqNext() throws SQLException;
}
