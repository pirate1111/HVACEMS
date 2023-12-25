package com.spring.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.dao.ThermometerDAO;
import com.spring.dto.ThermometerVO;

public class ThermometerServiceImpl implements ThermometerService{

	private ThermometerDAO thermometerDAO;
	public void setThermometerDAO(ThermometerDAO thermometerDAO) {
		this.thermometerDAO = thermometerDAO;
	}
	
	@Override
	public Map<String, Object> getThermometerSet() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<ThermometerVO> thermometerList = thermometerDAO.selectThermometerSet();
		
		dataMap.put("thermometerList", thermometerList);
		
		return dataMap;
	}

	@Override
	public void updateThermometerSetBySectionNum(List<ThermometerVO> thermometerList) throws Exception {

		thermometerDAO.updateThermometerSetBySectionNum(thermometerList);
	
	}

	@Override
	public void updateThermometerErrorRange(float thermometerErrorRange) throws Exception {
		thermometerDAO.updateThermometerErrorRange(thermometerErrorRange);
	}

}
