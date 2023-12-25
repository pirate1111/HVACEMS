package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchListCommand;
import com.spring.dto.Co2VO;

public interface Co2DAO {

	List<Co2VO> selectSearchCo2List(SearchListCommand command) throws SQLException;
	
	int selectSearchCo2ListCount(SearchListCommand command) throws SQLException;
	
	Co2VO selectCo2Price() throws SQLException;
	
	void insertCo2(Co2VO co2) throws SQLException;
	
}
