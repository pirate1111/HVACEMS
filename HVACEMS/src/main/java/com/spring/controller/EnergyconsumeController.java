package com.spring.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.SearchListCommand;
import com.spring.service.EnergyconsumeService;

@Controller
@RequestMapping("/energyconsume")
public class EnergyconsumeController {

	   @Autowired
	    private EnergyconsumeService energyconsumeService;

	    @GetMapping("/main")
	    public ModelAndView main(ModelAndView mnv, SearchListCommand command) throws Exception {
	        String url = "/energyconsume/energyconsume_main";

	        Map<String, Object> dataMap = energyconsumeService.getEnergyconsumeVOList(command);

	        mnv.addObject("dataMap", dataMap);
	        mnv.setViewName(url);

	        return mnv;
	    }

	    @GetMapping("/search")
	    public ModelAndView search(ModelAndView mnv, SearchListCommand command) throws Exception {
	        String url = "/energyconsume/energyconsume_search";

	        Map<String, Object> dataMap = energyconsumeService.getMonthlyConsumption(command);
	        
	        mnv.addObject("dataMap", dataMap);
	        mnv.setViewName(url);

	        return mnv;
	    }

	    @GetMapping("/searchyear")
	    public ModelAndView searchyear(ModelAndView mnv, SearchListCommand command) throws Exception {
	        String url = "/energyconsume/energyconsume_search_year";

	        Map<String, Object> dataMap = energyconsumeService.getYearConsumption(command);

	        mnv.addObject("dataMap", dataMap);
	        mnv.setViewName(url);

	        return mnv;
	    }

	    @GetMapping("/analysis")
	    public ModelAndView analysis(ModelAndView mnv, SearchListCommand command) throws Exception {
	        String url = "/energyconsume/energyconsume_analysis";
	        Map<String, Object> dataMap = energyconsumeService.getMonthlyConsumption(command);

	        mnv.addObject("dataMap", dataMap);
	        mnv.setViewName(url);
	        return mnv;
	    }
	    
	    @GetMapping("/analysisyear")
	    public ModelAndView analysisyear(ModelAndView mnv, SearchListCommand command) throws Exception {
	        String url = "/energyconsume/energyconsume_analysis_year";

	        Map<String, Object> dataMap = energyconsumeService.getYearConsumption(command);

	        mnv.addObject("dataMap", dataMap);
	        mnv.setViewName(url);

	        return mnv;
	    }
	
	}