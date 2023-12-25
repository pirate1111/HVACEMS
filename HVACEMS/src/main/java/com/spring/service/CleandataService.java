package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.SearchListCommand;
import com.spring.dto.ClasssVO;
import com.spring.dto.HumidVO;
import com.spring.dto.HvacelecVO;
import com.spring.dto.PressureVO;
import com.spring.dto.TemperatureVO;
import com.spring.dto.WeatherVO;

public interface CleandataService {

	Map<String, Object> getTemperature(SearchListCommand command)throws SQLException;
	List<TemperatureVO> getTemperatureGraph(SearchListCommand command)throws SQLException;
	
	Map<String, Object> getHumid(SearchListCommand command)throws SQLException;
	List<HumidVO> getHumidGraph(SearchListCommand command) throws SQLException;
	
	Map<String, Object> getPressure(SearchListCommand command)throws SQLException;
	List<PressureVO> getPressureGraph(SearchListCommand command)throws SQLException;
	
	Map<String, Object> getClasss(SearchListCommand command)throws SQLException;
	List<ClasssVO> getClasssGraph(SearchListCommand command)throws SQLException;
	
	Map<String, Object> getHvacelec(SearchListCommand command)throws SQLException;
	List<HvacelecVO> getHvacelecGraph(SearchListCommand command)throws SQLException;
	
	List<WeatherVO> getWeather()throws SQLException;
	List<WeatherVO> getWeatherGraph(SearchListCommand command)throws SQLException;
	
}

