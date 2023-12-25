package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.ThermometerVO;

public interface ThermometerDAO {

	List<ThermometerVO> selectThermometerSet() throws SQLException;
	void updateThermometerSetBySectionNum(List<ThermometerVO> thermometerList) throws SQLException;
	void updateThermometerErrorRange(float thermometerErrorRange) throws SQLException;
	
}
