package com.spring.dao;

import java.sql.SQLException;

import com.spring.dto.CostChangeVO;

public interface CostChangeDAO {

	void updateCostChange(CostChangeVO costChange) throws SQLException;
	
	CostChangeVO selectCostChange() throws SQLException;
	
}
