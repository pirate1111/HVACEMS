package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.dao.HygrometerDAO;
import com.spring.dto.HygrometerVO;
import com.spring.dto.ThermometerVO;

public class HygrometerServiceImpl implements HygrometerService{

	private HygrometerDAO hygrometerDAO;
	public void setHygrometerDAO(HygrometerDAO hygrometerDAO) {
		this.hygrometerDAO = hygrometerDAO;
	}
	
	@Override
	public Map<String, Object> getHygrometerSet() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<HygrometerVO> hygrometerList = hygrometerDAO.selectHygrometerSet();
		
		dataMap.put("hygrometerList", hygrometerList);
		
		return dataMap;
	}

	@Override
	public void updateHygrometerSetBySectionNum(List<HygrometerVO> hygrometerList) throws Exception {

		hygrometerDAO.updateHygrometerSetBySectionNum(hygrometerList);
		
	}

	@Override
	public void updateHygrometerErrorRange(int hygrometerErrorRange) throws Exception {
		hygrometerDAO.updateHygrometerErrorRange(hygrometerErrorRange);
	}
}
