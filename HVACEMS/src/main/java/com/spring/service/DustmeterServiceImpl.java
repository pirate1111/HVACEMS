package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.dao.DustmeterDAO;
import com.spring.dto.DustmeterVO;
import com.spring.dto.ThermometerVO;

public class DustmeterServiceImpl implements DustmeterService{

	private DustmeterDAO dustmeterDAO;
	public void setDustmeterDAO(DustmeterDAO dustmeterDAO) {
		this.dustmeterDAO = dustmeterDAO;
	}
	
	@Override
	public Map<String, Object> getDustmeterSet() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<DustmeterVO> dustmeterList = dustmeterDAO.selectDustmeterSet();
		
		dataMap.put("dustmeterList", dustmeterList);
		
		return dataMap;
	}

	@Override
	public void updateDustmeterSetBySectionNum(List<DustmeterVO> dustmeterList) throws Exception {

		dustmeterDAO.updateDustmeterSetBySectionNum(dustmeterList);
		
	}

	@Override
	public void updateDustmeterErrorRange(int dustmeterErrorRange) throws Exception {
		dustmeterDAO.updateDustmeterErrorRange(dustmeterErrorRange);
	}
	
}
