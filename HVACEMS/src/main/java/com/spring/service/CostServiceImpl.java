package com.spring.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.SearchListCommand;
import com.spring.dao.Co2DAO;
import com.spring.dao.CostChangeDAO;
import com.spring.dao.EnergyconsumeDAO;
import com.spring.dao.EnergycostDAO;
import com.spring.dto.Co2VO;
import com.spring.dto.CostChangeVO;
import com.spring.dto.EnergycostVO;

public class CostServiceImpl implements CostService {
	
	private EnergycostDAO energycostDAO;

	public void setEnergycostDAO(EnergycostDAO energycostDAO) {
		this.energycostDAO = energycostDAO;
	}

	private Co2DAO co2DAO;

	public void setCo2DAO(Co2DAO co2DAO) {
		this.co2DAO = co2DAO;
	}
	
	private CostChangeDAO costChangeDAO;
	public void setCostChangeDAO(CostChangeDAO costChangeDAO) {
		this.costChangeDAO = costChangeDAO;
	}

	private EnergyconsumeDAO energyconsumeDAO;

	public void setEnergyconsumeDAO(EnergyconsumeDAO energyconsumeDAO) {
		this.energyconsumeDAO = energyconsumeDAO;
	}
	
	//int initialCost=energycostDAO.selectOldEnergycost();

	@Override
	public Map<String, Object> getEnergycostVOList(SearchListCommand command) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<EnergycostVO> energycostList = energycostDAO.selectEnergycost(command);
		
		List<EnergycostVO> reversedCostList = new ArrayList<>(energycostList);
		Collections.reverse(reversedCostList);
		
		int totalCount = energycostDAO.selectSearchEnergycostListCount(command);
		
		
		// PageMaker 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCommand(command);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("energycostList", energycostList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("reversedCostList", reversedCostList);
		return dataMap;
	}

	@Override
	public void regist(EnergycostVO energycost) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateCostChange(CostChangeVO costChange) throws SQLException {
		costChangeDAO.updateCostChange(costChange);
	}
	
	@Override
	public Map<String, Object> getCostYearList(SearchListCommand command) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<SearchListCommand> energycostYearList = energycostDAO.selectByYear(command);
		
		List<SearchListCommand> reversedCostYearList = new ArrayList<>(energycostYearList);
		Collections.reverse(reversedCostYearList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCommand(command);
		pageMaker.setTotalCount(command.getYearCount());
		
		dataMap.put("energycostYearList", energycostYearList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("reversedCostYearList", reversedCostYearList);
		return dataMap;
		
	}
	
	@Override
	public Map<String, Object> getCo2VOList(SearchListCommand command) throws SQLException {
		Map<String, Object> dataMap1 = new HashMap<String, Object>();

		List<Co2VO> co2List = co2DAO.selectSearchCo2List(command);
		
		List<Co2VO> reversedCo2List = new ArrayList<>(co2List);
		Collections.reverse(reversedCo2List);
		
		// 占쎌읈筌ｏ옙 揶쏆뮇�땾
		int totalCount = co2DAO.selectSearchCo2ListCount(command);

		// PageMaker 占쎄문占쎄쉐.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCommand(command);
		pageMaker.setTotalCount(totalCount);

		dataMap1.put("co2List", co2List);
		dataMap1.put("pageMaker", pageMaker);
		dataMap1.put("reversedCo2List", reversedCo2List);

		return dataMap1;
	}

	@Override
	public void registCo2() throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public int getTodayCost() throws SQLException {
		
		int todayEnergy = energyconsumeDAO.selectThisMonthEnergy();
		
		CostChangeVO costChange = new CostChangeVO();
		int todayCost = 0;
		
		if(costChange !=null) {
			costChange = costChangeDAO.selectCostChange();
		double baseFee = todayEnergy*costChange.getBaseFee();
		double tax = costChange.getTax();
		double fund = costChange.getFund();
		
		tax = baseFee * tax;
		fund = baseFee * fund;
		
		baseFee = baseFee + tax + fund;
		
		todayCost = (int)(baseFee + tax + fund);
		}
		return todayCost;
	}
	
	@Override
	public int getTodayCo2() throws SQLException {
		int todayEnergy = energyconsumeDAO.selectThisMonthEnergy();
		
		int todayCo2 = (int) (todayEnergy * 0.125);
		
		return todayCo2;
	}

	@Override
	public EnergycostVO getLastYearCost() throws SQLException {
		EnergycostVO lastYear = energycostDAO.selectLastYearCost();
		return lastYear;
	}

	@Override
	public CostChangeVO getCostChange() throws SQLException {
		CostChangeVO costChange = costChangeDAO.selectCostChange();
		return costChange;
	}

	@Override
	public int getCo2Price() throws SQLException {
		Co2VO co2 = co2DAO.selectCo2Price();
		
		int co2Target = co2.getCo2Target();
		int co2Account = co2.getCo2Account();
		int co2Price = co2.getCo2Price();
		
		int co2Payoff = (co2Target - co2Account) * co2Price;
		
		return co2Payoff;
	}

}
