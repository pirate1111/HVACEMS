package com.spring.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.SearchListCommand;
import com.spring.dao.ClasssDAO;
import com.spring.dao.HumidDAO;
import com.spring.dao.HvacelecDAO;
import com.spring.dao.PressureDAO;
import com.spring.dao.TemperatureDAO;
import com.spring.dao.WeatherDAO;
import com.spring.dto.ClasssVO;
import com.spring.dto.HumidVO;
import com.spring.dto.HvacelecVO;
import com.spring.dto.PressureVO;
import com.spring.dto.TemperatureVO;
import com.spring.dto.WeatherVO;

public class CleandataServiceImpl implements CleandataService{
	
	private TemperatureDAO temperatureDAO;
	public void setTemperatureDAO(TemperatureDAO temperatureDAO) {
		this.temperatureDAO = temperatureDAO;
	}
	
	private HumidDAO humidDAO;
	public void setHumidDAO(HumidDAO humidDAO) {
		this.humidDAO = humidDAO;
	}
	
	private PressureDAO pressureDAO;
	public void setPressureDAO(PressureDAO pressureDAO) {
		this.pressureDAO = pressureDAO;
	}
	
	private ClasssDAO classsDAO;
	public void setClasssDAO(ClasssDAO classsDAO) {
		this.classsDAO = classsDAO;
	}
	
	private HvacelecDAO hvacelecDAO;
	public void setHvacelecDAO(HvacelecDAO hvacelecDAO) {
		this.hvacelecDAO = hvacelecDAO;
	}
	
	private WeatherDAO weatherDAO;
	public void setWeatherDAO(WeatherDAO weatherDAO) {
		this.weatherDAO = weatherDAO;
	}

	
	@Override
	public Map<String, Object> getTemperature(SearchListCommand command) throws SQLException {
		List<TemperatureVO> temperatureList = temperatureDAO.selectTemperature(command);
		
		int totalCount = temperatureDAO.selectSearchTemperatureListCount(command);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCommand(command);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("temperatureList", temperatureList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public List<TemperatureVO> getTemperatureGraph(SearchListCommand command) throws SQLException {
		List<TemperatureVO> temperatureList = temperatureDAO.selectTemperatureGraph(command);
		
		for(TemperatureVO temp : temperatureList) {
			Date date = temp.getTemperatureDate();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String tempDate = format.format(date);
			temp.setDate(tempDate);
		}
		
		return temperatureList;
	}

	@Override
	public Map<String, Object> getHumid(SearchListCommand command) throws SQLException {
		List<HumidVO> humidList = humidDAO.selectHumid(command);
		
		int totalCount = humidDAO.selectSearchHumidListCount(command);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCommand(command);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("humidList", humidList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public List<HumidVO> getHumidGraph(SearchListCommand command) throws SQLException {
		List<HumidVO> humidList = humidDAO.selectHumidGraph(command);
		
		for(HumidVO humid : humidList) {
			Date date = humid.getHumidDate();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String humidDate = format.format(date);
			humid.setDate(humidDate);
		}
		
		return humidList;
	}

	@Override
	public Map<String, Object> getPressure(SearchListCommand command) throws SQLException {
		List<PressureVO> pressureList = pressureDAO.selectPressure(command);
		
		int totalCount = pressureDAO.selectSearchPressureListCount(command);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCommand(command);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("pressureList", pressureList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public List<PressureVO> getPressureGraph(SearchListCommand command) throws SQLException {
		List<PressureVO> pressureList = pressureDAO.selectPressureGraph(command);
		
		for(PressureVO press : pressureList) {
			Date date = press.getPressureDate();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String pressDate = format.format(date);
			press.setDate(pressDate);
		}
		
		return pressureList;
	}

	@Override
	public Map<String, Object> getClasss(SearchListCommand command) throws SQLException {
		List<ClasssVO> classsList = classsDAO.selectClasss(command);
		
		int totalCount = classsDAO.selectSearchClasssListCount(command);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCommand(command);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("classsList", classsList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public List<ClasssVO> getClasssGraph(SearchListCommand command) throws SQLException {
		List<ClasssVO> classsList = classsDAO.selectClasssGraph(command);
		
		for(ClasssVO classs : classsList) {
			Date date = classs.getclasssDate();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String classsDate = format.format(date);
			classs.setDate(classsDate);
		}
		
		return classsList;
	}

	@Override
	public Map<String, Object> getHvacelec(SearchListCommand command) throws SQLException {
		List<HvacelecVO> hvacelecList = hvacelecDAO.selectHvacelec(command);
		
		int totalCount = hvacelecDAO.selectSearchHvacelecListCount(command);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCommand(command);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("hvacelecList", hvacelecList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public List<HvacelecVO> getHvacelecGraph(SearchListCommand command) throws SQLException {
		List<HvacelecVO> hvacelecList = hvacelecDAO.selectHvacelecGraph(command);
		
		for(HvacelecVO hvacelec : hvacelecList) {
			Date date = hvacelec.getHvacelecDate();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String hvacelecDate = format.format(date);
			hvacelec.setDate(hvacelecDate);
		}
		
		return hvacelecList;
	}
	
	public List<WeatherVO> getWeather()throws SQLException{
		List<WeatherVO> weatherList = weatherDAO.selectWeather();
		
		return weatherList;
	}


	@Override
	public List<WeatherVO> getWeatherGraph(SearchListCommand command) throws SQLException {
		List<WeatherVO> weatherList = weatherDAO.selectWeatherGraph(command);
		
		for(WeatherVO weather : weatherList) {
			Date date = weather.getWeatherDate();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String weatherDate = format.format(date);
			weather.setDate(weatherDate);
		}
		
		return weatherList;
	}
}
