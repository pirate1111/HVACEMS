package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchListCommand;
import com.spring.dto.HumidVO;

public interface HumidDAO {

	List<HumidVO> selectHumid(SearchListCommand command) throws SQLException;
	
	List<HumidVO> selectHumidGraph(SearchListCommand command) throws SQLException;
 	
	int selectSearchHumidListCount(SearchListCommand command) throws SQLException;
	
	void insertHumid(HumidVO humid) throws SQLException;
	
	int selectHumidSeqNext() throws SQLException;
	
}
