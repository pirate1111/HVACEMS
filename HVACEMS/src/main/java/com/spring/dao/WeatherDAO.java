package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchListCommand;
import com.spring.dto.WeatherVO;

public interface WeatherDAO {
	
	List<WeatherVO> selectWeather() throws SQLException;
	
	List<WeatherVO> selectWeatherGraph(SearchListCommand command) throws SQLException;

}
