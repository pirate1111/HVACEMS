package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.dto.ThermometerVO;

public interface ThermometerService {
	
	Map<String, Object> getThermometerSet() throws SQLException;
	void updateThermometerSetBySectionNum(List<ThermometerVO> thermometerList)throws Exception;
	void updateThermometerErrorRange(float thermometerErrorRange) throws Exception;
}
