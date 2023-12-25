package com.spring.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.SearchListCommand;
import com.spring.dto.Co2VO;
import com.spring.dto.CostChangeVO;
import com.spring.dto.EnergycostVO;
import com.spring.service.CostService;
import com.spring.service.EnergyconsumeService;

@Controller
@RequestMapping("/energycost")
public class CostController {

	@Autowired
	private CostService costService;
	
	@Autowired
	private EnergyconsumeService energyconsumeService;
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mnv, SearchListCommand command) throws Exception{
		String url = "/energycost/main";
		
		EnergycostVO dataMap = costService.getLastYearCost();
		CostChangeVO dataMap1 = costService.getCostChange();
		int co2Payoff = costService.getCo2Price();
		
		int todayCost=0, todayCo2=0;
		
		todayCost = costService.getTodayCost();
		todayCo2 = costService.getTodayCo2();
		
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("dataMap1", dataMap1);
		mnv.addObject("co2Payoff", co2Payoff);
		mnv.addObject("todayCost", todayCost);
		mnv.addObject("todayCo2", todayCo2);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@PostMapping("/modify")
	public String changePrice (CostChangeVO costChange) throws Exception{
		String url = "redirect:/energycost/main.do";
		
		//CostChangeVO costChange = new CostChangeVO();
		//if (modifyForm != null) {
//		costChange.setContractedPower(Integer.parseInt(modifyForm[0]));
//		costChange.setBaseFee(Integer.parseInt(modifyForm[1]));
//		costChange.setTax(Double.parseDouble(modifyForm[2]));
//		costChange.setFund(Double.parseDouble(modifyForm[3]));
//		}
		costService.updateCostChange(costChange);
		
		return url;
	}
	
	
	@GetMapping("/searchmonth")
	public ModelAndView searchmonth(ModelAndView mnv, SearchListCommand command) throws Exception{
		String url = "/energycost/list_month";
		
		Map<String, Object> dataMap = costService.getEnergycostVOList(command);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/searchyear")
	public ModelAndView searchyear(ModelAndView mnv, SearchListCommand command) throws Exception{
		String url = "/energycost/list_year";
		
		Map<String, Object> dataMap = costService.getCostYearList(command);
		Map<String, Object> dataMap1 = costService.getCo2VOList(command);
		
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("dataMap1", dataMap1);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/analysis")
	public ModelAndView analysismonth(ModelAndView mnv, SearchListCommand command) throws Exception{
		String url = "/energycost/analysis_month";
		
		Map<String, Object> dataMap = costService.getEnergycostVOList(command);
		Map<String, Object> dataMap1 = costService.getCo2VOList(command);
		Map<String, Object> dataMap2 = energyconsumeService.getEnergyconsumeVOList(command);
		
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("dataMap1", dataMap1);
		mnv.addObject("dataMap2", dataMap2);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/analysisyear")
	public ModelAndView analysisyear(ModelAndView mnv, SearchListCommand command) throws Exception{
		String url = "/energycost/analysis_year";
		
		Map<String, Object> dataMap = costService.getCostYearList(command);
		Map<String, Object> dataMap1 = costService.getCo2VOList(command);
		
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("dataMap1", dataMap1);
		mnv.setViewName(url);
		
		return mnv;
	}
	
}
