package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.dto.BarometerVO;

public interface BarometerService {
	
	Map<String, Object> getBarometerSet() throws SQLException;
	void updateBarometerSetBySectionNum(List<BarometerVO> barometerList)throws Exception;
	void updateBarometerErrorRange(float barometerErrorRange) throws Exception;

}
