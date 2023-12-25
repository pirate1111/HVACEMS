package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.dto.OnoffRecordVO;

public interface OnoffRecordService {

	Map<String, Object> getOnoffYn() throws SQLException;
	
	void insertOnoffRecord(List<OnoffRecordVO> onoffRecordList) throws Exception;
	
}
