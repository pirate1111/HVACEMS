package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.SearchListCommand;
import com.spring.dto.EnergyconsumeVO;

public interface EnergyconsumeService {

	Map<String,Object> getEnergyconsumeVOList(SearchListCommand command)throws SQLException;

	Map<String,Object> getMonthlyConsumption(SearchListCommand command) throws SQLException;

	Map<String,Object> getYearConsumption(SearchListCommand command) throws SQLException;

}
