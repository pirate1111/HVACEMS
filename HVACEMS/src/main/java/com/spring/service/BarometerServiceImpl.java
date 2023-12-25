package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.dao.BarometerDAO;
import com.spring.dto.BarometerVO;
import com.spring.dto.ThermometerVO;

public class BarometerServiceImpl implements BarometerService{

	private BarometerDAO barometerDAO;
	public void setBarometerDAO(BarometerDAO barometerDAO) {
		this.barometerDAO = barometerDAO;
	}
	
	@Override
	public Map<String, Object> getBarometerSet() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<BarometerVO> barometerList = barometerDAO.selectBarometerSet();
		
		dataMap.put("barometerList", barometerList);
		
		return dataMap;
	}

	@Override
	public void updateBarometerSetBySectionNum(List<BarometerVO> barometerList) throws Exception {

		barometerDAO.updateBarometerSetBySectionNum(barometerList);
		
	}

	@Override
	public void updateBarometerErrorRange(float barometerErrorRange) throws Exception {
		barometerDAO.updateBarometerErrorRange(barometerErrorRange);
	}

}
