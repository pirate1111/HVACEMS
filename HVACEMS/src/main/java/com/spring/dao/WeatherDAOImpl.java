package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchListCommand;
import com.spring.dto.WeatherVO;

public class WeatherDAOImpl implements WeatherDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<WeatherVO> selectWeather() throws SQLException {
		List<WeatherVO> weatherList = session.selectList("Weather-Mapper.selectWeather");
		
		return weatherList;
	}

	@Override
	public List<WeatherVO> selectWeatherGraph(SearchListCommand command) throws SQLException {
		List<WeatherVO> weatherList = session.selectList("Weather-Mapper.selectWeatherGraph");
		
		return weatherList;
	}
	
	

}
