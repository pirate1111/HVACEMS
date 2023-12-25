package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.dto.HygrometerVO;

public interface HygrometerService {

	Map<String, Object> getHygrometerSet() throws SQLException;
	void updateHygrometerSetBySectionNum(List<HygrometerVO> hygrometerList)throws Exception;
	void updateHygrometerErrorRange(int hygrometerErrorRange) throws Exception;

}
