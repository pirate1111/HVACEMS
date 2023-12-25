package com.spring.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.SearchListCommand;
import com.spring.dto.ClasssVO;
import com.spring.dto.HumidVO;
import com.spring.dto.HvacelecVO;
import com.spring.dto.PressureVO;
import com.spring.dto.TemperatureVO;
import com.spring.dto.WeatherVO;
import com.spring.service.CleandataService;

@Controller
@RequestMapping("/cleandata")
public class CleandataController {
	
	@Autowired
	private CleandataService cleandataService;
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mnv) throws Exception{
		String url = "/cleandata/main";
		
		List<WeatherVO> weatherList = cleandataService.getWeather();
		
		mnv.addObject("weatherList", weatherList);
		mnv.addObject("url", url);
		
		return mnv;
	}
	
	@GetMapping("/temp")
	public ModelAndView innerDataTemp(SearchListCommand command, ModelAndView mnv) throws Exception{
		String url = "/cleandata/innerdataTemp";
		
		Map<String, Object> dataMap = cleandataService.getTemperature(command);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/tempGraph")
	@ResponseBody
	public List<TemperatureVO> tempGraphToJSON(SearchListCommand command)throws Exception{
		List<TemperatureVO> temperatureList = cleandataService.getTemperatureGraph(command);
		
		return temperatureList;
	}
	
	@GetMapping("/tempList")
	public ModelAndView innerDataTempList(SearchListCommand command, ModelAndView mnv) throws Exception{
		String url = "/cleandata/innerdataTempList";
		
		Map<String, Object> dataMap = cleandataService.getTemperature(command);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/humid")
	public ModelAndView innerDataHumid(SearchListCommand command, ModelAndView mnv) throws Exception{
		String url = "/cleandata/innerdataHumid";
		
		Map<String, Object> dataMap = cleandataService.getHumid(command);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/humidGraph")
	@ResponseBody
	public List<HumidVO> humidGraphToJSON(SearchListCommand command)throws Exception{
		List<HumidVO> humidList = cleandataService.getHumidGraph(command);
		
		return humidList;
	}
	
	@GetMapping("/humidList")
	public ModelAndView innerdataHumidList(SearchListCommand command, ModelAndView mnv) throws Exception{
		String url = "/cleandata/innerdataHumidList";
		
		Map<String, Object> dataMap = cleandataService.getHumid(command);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/press")
	public ModelAndView innerDataPress(ModelAndView mnv, SearchListCommand command) throws Exception{
		String url = "/cleandata/innerdataPress";
		
		Map<String, Object> dataMap = cleandataService.getPressure(command);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/pressGraph")
	@ResponseBody
	public List<PressureVO> pressureGraphToJSON(SearchListCommand command)throws Exception{
		List<PressureVO> pressureList = cleandataService.getPressureGraph(command);
		
		return pressureList;
	}
	
	@GetMapping("/pressList")
	public ModelAndView innerDataPressList(ModelAndView mnv, SearchListCommand command) throws Exception{
		String url = "/cleandata/innerdataPressList";
		
		Map<String, Object> dataMap = cleandataService.getPressure(command);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/classs")
	public ModelAndView innerDataClasss(ModelAndView mnv, SearchListCommand command) throws Exception{
		String url = "/cleandata/innerdataClasss";
		
		Map<String, Object> dataMap = cleandataService.getClasss(command);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/classsGraph")
	@ResponseBody
	public List<ClasssVO> classsGraphToJSON(SearchListCommand command)throws Exception{
		List<ClasssVO> classsList = cleandataService.getClasssGraph(command);
		
		return classsList;
	}
	
	@GetMapping("/classsList")
	public ModelAndView innerDataClasssList(ModelAndView mnv, SearchListCommand command) throws Exception{
		String url = "/cleandata/innerdataClasssList";
		
		Map<String, Object> dataMap = cleandataService.getClasss(command);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}

	@GetMapping("/hvacelec")
	public ModelAndView innerDataHvacelec(ModelAndView mnv, SearchListCommand command) throws Exception{
		String url = "/cleandata/innerdataHvacelec";
		
		Map<String, Object> dataMap = cleandataService.getHvacelec(command);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/hvacelecGraph")
	@ResponseBody
	public List<HvacelecVO> HvacelecGraphToJSON(SearchListCommand command)throws Exception{
		List<HvacelecVO> hvacelecList = cleandataService.getHvacelecGraph(command);
		
		return hvacelecList;
	}
	
	@GetMapping("/hvacelecList")
	public ModelAndView innerDataHvacelecList(ModelAndView mnv, SearchListCommand command) throws Exception{
		String url = "/cleandata/innerdataHvacelecList";
		
		Map<String, Object> dataMap = cleandataService.getHvacelec(command);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/weatherGraph")
	@ResponseBody
	public List<WeatherVO> WeatherGraphToJSON(SearchListCommand command)throws Exception{
		List<WeatherVO> weatherList = cleandataService.getWeatherGraph(command);
		
		return weatherList;
	}
	
}
