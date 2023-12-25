package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.SearchListCommand;
import com.spring.dao.EnergyconsumeDAO;
import com.spring.dto.EnergyconsumeVO;

public class EnergyconsumeServiceImpl implements EnergyconsumeService {

	private EnergyconsumeDAO energyconsumeDAO;

	public void setEnergyconsumeDAO(EnergyconsumeDAO energyconsumeDAO) {
		this.energyconsumeDAO = energyconsumeDAO;
	}

	@Override
	public Map<String, Object> getEnergyconsumeVOList(SearchListCommand command) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<EnergyconsumeVO> energyconsumeList = energyconsumeDAO.selectEnergyconsume(command);
	    List<SearchListCommand> consumemonth = energyconsumeDAO.getMonthlyConsumption(command);

		// 전체 개수
		int totalCount = energyconsumeDAO.selectSearchEnergyconsumeListCount(command);

		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCommand(command);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("energyconsumeList", energyconsumeList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("consumemonth", consumemonth);

		return dataMap;

	}


	

	@Override
    public Map<String,Object> getMonthlyConsumption(SearchListCommand command) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
	      List<SearchListCommand> consumemonth = energyconsumeDAO.getMonthlyConsumption(command);
	      
	   // 전체 개수
			int totalCount = energyconsumeDAO.selectSearchEnergyconsumeListCount(command);

			// PageMaker 생성.
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCommand(command);
			pageMaker.setTotalCount(totalCount);

			dataMap.put("consumemonth", consumemonth);
			dataMap.put("pageMaker", pageMaker);

			return dataMap;
    }

	@Override
	public Map<String, Object> getYearConsumption(SearchListCommand command) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
	      List<SearchListCommand> consumeyear = energyconsumeDAO.getYearConsumption(command);
	      
	   // 전체 개수
			int totalCount = energyconsumeDAO.selectSearchEnergyconsumeListCount(command);

			// PageMaker 생성.
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCommand(command);
			pageMaker.setTotalCount(totalCount);

			dataMap.put("consumeyear", consumeyear);
			dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	
	

	
}
