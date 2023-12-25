package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchListCommand;
import com.spring.dto.EnergyconsumeVO;
import com.spring.dto.EnergycostVO;

public interface EnergyconsumeDAO {
	
	List<EnergyconsumeVO> selectEnergyconsume(SearchListCommand command) throws SQLException;
	
	int selectSearchEnergyconsumeListCount(SearchListCommand command) throws SQLException;

	List<SearchListCommand> getMonthlyConsumption(SearchListCommand command) throws SQLException;
	
	List<Integer> getMonthlyConsumptionCount(SearchListCommand command)throws SQLException;

	List<SearchListCommand> getYearConsumption(SearchListCommand command) throws SQLException;
	
	int selectTodayEnergyconsume() throws SQLException;
	
	void insertConsumeEnergy(EnergyconsumeVO energyconsume) throws SQLException;
	
	int selectEnergyConsumeSeqNext() throws SQLException;
	
	int selectThisMonthEnergy() throws SQLException;
}
