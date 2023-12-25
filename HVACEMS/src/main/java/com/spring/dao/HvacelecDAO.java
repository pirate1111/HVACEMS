package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchListCommand;
import com.spring.dto.HvacelecVO;

public interface HvacelecDAO {

	List<HvacelecVO> selectHvacelec(SearchListCommand command) throws SQLException;
	
	List<HvacelecVO> selectHvacelecGraph(SearchListCommand command) throws SQLException;
 	
	int selectSearchHvacelecListCount(SearchListCommand command) throws SQLException;
	
	void insertHvacelec(HvacelecVO hvacelec) throws SQLException;
	
	int selectHvacelecSeqNext() throws SQLException;
}

