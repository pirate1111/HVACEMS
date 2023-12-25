package com.spring.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.PageCommand;
import com.spring.service.AlarmService;

@Controller
@RequestMapping("/monitor")
public class AlarmController {

	@Autowired
	private AlarmService alarmService;
	
	@GetMapping("/alarm")
	public ModelAndView main(PageCommand command, ModelAndView mnv) throws Exception{
		String url = "/alarm/alarm_log";
		
		
		Map<String, Object> dataMap = alarmService.getAlarmLog(command);
		
		mnv.addObject("dataMap", dataMap);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@PostMapping("/alarm/read")
	public String read(@RequestParam("alarmNum")String alarmNum) throws Exception{
		String url = "/alarm/alarm_read";
		alarmService.readAlarm(alarmNum);
		return url;
	}
	
	@PostMapping("/alarm/checks")
	public String checks() throws Exception{
		String url = "/alarm/alarm_check";
		alarmService.checkAllAlarm();
		return url;
	}
	
	@PostMapping("/alarm/check")
	public String check(@RequestParam("alarmNum")String alarmNum) throws Exception{
		String url = "/alarm/alarm_check";
		alarmService.checkAlarm(alarmNum);
		return url;
	}


}
