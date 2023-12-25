package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.dto.DustmeterVO;

public interface DustmeterService {

	Map<String, Object> getDustmeterSet() throws SQLException;
	void updateDustmeterSetBySectionNum(List<DustmeterVO> dustmeterList)throws Exception;
	void updateDustmeterErrorRange(int dustmeterErrorRange) throws Exception;

}
