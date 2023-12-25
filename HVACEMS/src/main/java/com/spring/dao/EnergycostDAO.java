package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchListCommand;
import com.spring.dto.EnergycostVO;

public interface EnergycostDAO {

	List<EnergycostVO> selectEnergycost(SearchListCommand command) throws SQLException;
	
	int selectSearchEnergycostListCount(SearchListCommand command) throws SQLException;

	List<SearchListCommand> selectByYear(SearchListCommand command) throws SQLException;
	
	EnergycostVO selectLastYearCost() throws SQLException;
	
	//int selectSearchEnergycostYearSum(SearchListCommand command) throws SQLException;
	void insertEnergycost(EnergycostVO enerygcost) throws Exception;
	
	int selectEnergycostSeqNext() throws Exception;
	
}
