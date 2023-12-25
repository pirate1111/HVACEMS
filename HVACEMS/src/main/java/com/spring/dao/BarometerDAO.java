package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.BarometerVO;

public interface BarometerDAO {

	List<BarometerVO> selectBarometerSet() throws SQLException;
	void updateBarometerSetBySectionNum(List<BarometerVO> barometerList) throws SQLException;
	void updateBarometerErrorRange(float barometerErrorRange) throws SQLException;

}
