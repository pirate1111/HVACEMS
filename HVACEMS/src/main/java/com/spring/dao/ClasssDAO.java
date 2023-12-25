package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchListCommand;
import com.spring.dto.ClasssVO;

public interface ClasssDAO {

	List<ClasssVO> selectClasss(SearchListCommand command) throws SQLException;
	
	List<ClasssVO> selectClasssGraph(SearchListCommand command) throws SQLException;
 	
	int selectSearchClasssListCount(SearchListCommand command) throws SQLException;
	
	void insertClasss(ClasssVO classs) throws SQLException;
	
	int selectClasssSeqNext() throws SQLException;
}
