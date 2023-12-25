package com.spring.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.OnoffRecordDAO;
import com.spring.dto.BarometerVO;
import com.spring.dto.ClasssVO;
import com.spring.dto.DustmeterVO;
import com.spring.dto.HumidVO;
import com.spring.dto.HvacdataVO;
import com.spring.dto.HygrometerVO;
import com.spring.dto.OnoffRecordVO;
import com.spring.dto.PressureVO;
import com.spring.dto.TemperatureVO;
import com.spring.dto.ThermometerVO;
import com.spring.scheduler.CleanroomInnerDataScheduler;
import com.spring.scheduler.HvacModuleDataScheduler;
import com.spring.service.BarometerService;
import com.spring.service.DustmeterService;
import com.spring.service.HygrometerService;
import com.spring.service.OnoffRecordService;
import com.spring.service.ThermometerService;

@Controller
@RequestMapping("/monitor")
public class CleanroomController {

	@Autowired
	private ThermometerService thermometerService;
	@Autowired
	private HygrometerService hygrometerService;
	@Autowired
	private BarometerService barometerService;
	@Autowired
	private DustmeterService dustmeterService;
	@Autowired
	private OnoffRecordService onoffRecordService;
	@Autowired
	private OnoffRecordDAO onoffrecord;
	@Autowired
	private CleanroomInnerDataScheduler cleanroomInnerDataScheduler;
	@Autowired
	private HvacModuleDataScheduler hvacModuleDataScheduler;
	
	@GetMapping("/main")
	public ModelAndView cleanroom(ModelAndView mnv) throws Exception{
		String url="/cleanroom/allPlotPlan";
		
		Map<String, Object> dataMap = thermometerService.getThermometerSet();
		dataMap.putAll(hygrometerService.getHygrometerSet());
		dataMap.putAll(barometerService.getBarometerSet());
		dataMap.putAll(dustmeterService.getDustmeterSet());
		dataMap.putAll(onoffRecordService.getOnoffYn());
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/temp")
	public ModelAndView cleanroomtemp(ModelAndView mnv) throws Exception{
		String url = "/cleanroom/tPlotPlan";
		
		Map<String, Object> dataMap = thermometerService.getThermometerSet();
		dataMap.putAll(hygrometerService.getHygrometerSet());
		dataMap.putAll(barometerService.getBarometerSet());
		dataMap.putAll(dustmeterService.getDustmeterSet());
		dataMap.putAll(onoffRecordService.getOnoffYn());
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/tempRealtime")
	@ResponseBody
	public List<TemperatureVO> tempRealTimeToJSON() throws Exception{
		List<TemperatureVO> temperatureList = cleanroomInnerDataScheduler.realTimeTemperature();
		return temperatureList;
	}

	@GetMapping("/hum")
	public ModelAndView cleanroomhum(ModelAndView mnv) throws Exception{
		String url = "/cleanroom/hPlotPlan";
		
		Map<String, Object> dataMap = hygrometerService.getHygrometerSet();
		dataMap.putAll(thermometerService.getThermometerSet());
		dataMap.putAll(barometerService.getBarometerSet());
		dataMap.putAll(dustmeterService.getDustmeterSet());
		dataMap.putAll(onoffRecordService.getOnoffYn());
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/humidRealtime")
	@ResponseBody
	public List<HumidVO> humidRealTimeToJSON() throws Exception{
		List<HumidVO> humidList = cleanroomInnerDataScheduler.realTimeHumid();
		return humidList;
	}
	
	@GetMapping("/pres")
	public ModelAndView cleanroompres(ModelAndView mnv) throws Exception{
		String url = "/cleanroom/pPlotPlan";
		
		Map<String, Object> dataMap = barometerService.getBarometerSet();
		dataMap.putAll(hygrometerService.getHygrometerSet());
		dataMap.putAll(thermometerService.getThermometerSet());
		dataMap.putAll(dustmeterService.getDustmeterSet());
		dataMap.putAll(onoffRecordService.getOnoffYn());
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/pressRealtime")
	@ResponseBody
	public List<PressureVO> pressRealTimeToJSON() throws Exception{
		List<PressureVO> pressureList = cleanroomInnerDataScheduler.realTimePressure();
		return pressureList;
	}
	
	@GetMapping("/clean")
	public ModelAndView cleanroomclean(ModelAndView mnv) throws Exception{
		String url = "/cleanroom/cPlotPlan";
		
		Map<String, Object> dataMap = dustmeterService.getDustmeterSet();
		dataMap.putAll(hygrometerService.getHygrometerSet());
		dataMap.putAll(barometerService.getBarometerSet());
		dataMap.putAll(thermometerService.getThermometerSet());
		dataMap.putAll(onoffRecordService.getOnoffYn());
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/classsRealtime")
	@ResponseBody
	public List<ClasssVO> classsRealTimeToJSON() throws Exception{
		List<ClasssVO> classsList = cleanroomInnerDataScheduler.realTimeClasss();
		return classsList;
	}
	
	@PostMapping("/insert")
	public String updateOnoff(String[] onoffCheck) throws Exception{
		String url="/cleanroom/update_success";
		
		List<OnoffRecordVO> onoffRecordList = new ArrayList<OnoffRecordVO>();
		
		for(String onoff: onoffCheck) {
			if(!onoff.isEmpty()) {      
				String[] data = onoff.split(":");
				String hvacNum = data[1];
				int onoffYn = Integer.parseInt(data[0]);
				
				OnoffRecordVO onoffRecord = new OnoffRecordVO();
				
				onoffRecord.setHvacNum(hvacNum);
				onoffRecord.setOnoffYn(onoffYn);			
				onoffRecordList.add(onoffRecord);
			}
		}

		onoffRecordService.insertOnoffRecord(onoffRecordList);
		
		return url;
	}
	
	@PostMapping("/tupdate")
	public String updateTempSet(String[] thermometerSetChange) throws Exception{
		String url="redirect:/monitor/temp.do";
		
		List<ThermometerVO> thermometerList = new ArrayList<ThermometerVO>();
		
		for(String thermo : thermometerSetChange) {
			String[] data = thermo.split(":");
			int thermometerSet = Integer.parseInt(data[0]);
			String sectionNum = data[1];
			
			ThermometerVO thermometer = new ThermometerVO();
			
			thermometer.setThermometerSet(thermometerSet);
			thermometer.setSectionNum(sectionNum);
			thermometerList.add(thermometer);
		}
		thermometerService.updateThermometerSetBySectionNum(thermometerList);
		
		return url;
	}
	
	@PostMapping("/hupdate")
	public String updatehumidSet(String[] hygrometerSetChange) throws Exception{
		String url="redirect:/monitor/hum.do";
		
		List<HygrometerVO> hygrometerList = new ArrayList<HygrometerVO>();
		
		for(String hygro : hygrometerSetChange) {
			String[] data = hygro.split(":");
			int hygrometerSet = Integer.parseInt(data[0]);
			String sectionNum = data[1];
			
			HygrometerVO hygrometer = new HygrometerVO();
			
			hygrometer.setHygrometerSet(hygrometerSet);
			hygrometer.setSectionNum(sectionNum);
			hygrometerList.add(hygrometer);
		}
		hygrometerService.updateHygrometerSetBySectionNum(hygrometerList);
		
		return url;
	}
	
	@PostMapping("/bupdate")
	public String updatebaroSet(String[] barometerSetChange) throws Exception{
		String url="redirect:/monitor/pres.do";
		
		List<BarometerVO> barometerList = new ArrayList<BarometerVO>();
		
		for(String baro : barometerSetChange) {
			String[] data = baro.split(":");
			int barometerSet = Integer.parseInt(data[0]);
			String sectionNum = data[1];
			
			BarometerVO barometer = new BarometerVO();
			
			barometer.setBarometerSet(barometerSet);
			barometer.setSectionNum(sectionNum);
			barometerList.add(barometer);
		}
		barometerService.updateBarometerSetBySectionNum(barometerList);
		
		return url;
	}
	
	@PostMapping("/dupdate")
	public String updatecleanSet(String[] dustmeterSetChange) throws Exception{
		String url="redirect:/monitor/clean.do";
		
		List<DustmeterVO> dustmeterList = new ArrayList<DustmeterVO	>();
		
		for(String clean : dustmeterSetChange) {
			String[] data = clean.split(":");
			int dustmeterSet = Integer.parseInt(data[0]);
			String sectionNum = data[1];
			
			DustmeterVO dustmeter = new DustmeterVO();
			
			dustmeter.setDustmeterSet(dustmeterSet);
			dustmeter.setSectionNum(sectionNum);
			dustmeterList.add(dustmeter);
		}
		dustmeterService.updateDustmeterSetBySectionNum(dustmeterList);
		
		return url;
	}
	
	@PostMapping("/aerror")
	public String updateErrorRange(String[] errorRangeChange) throws Exception{
		String url="redirect:/monitor/main.do";
		
		int thermometerErrorRange = Integer.parseInt(errorRangeChange[0]);
		int hygrometerErrorRange = Integer.parseInt(errorRangeChange[1]);
		int barometerErrorRange = Integer.parseInt(errorRangeChange[2]);
		int dustmeterErrorRange = Integer.parseInt(errorRangeChange[3]);
		
		thermometerService.updateThermometerErrorRange(thermometerErrorRange);
		hygrometerService.updateHygrometerErrorRange(hygrometerErrorRange);
		barometerService.updateBarometerErrorRange(barometerErrorRange);
		dustmeterService.updateDustmeterErrorRange(dustmeterErrorRange);
		
		return url;
	}
	
	@PostMapping("/terror")
	public String updatetErrorRange(String[] TerrorRangeChange) throws Exception{
		String url="redirect:/monitor/temp.do";
		
		int thermometerErrorRange = Integer.parseInt(TerrorRangeChange[0]);
		int hygrometerErrorRange = Integer.parseInt(TerrorRangeChange[1]);
		int barometerErrorRange = Integer.parseInt(TerrorRangeChange[2]);
		int dustmeterErrorRange = Integer.parseInt(TerrorRangeChange[3]);
		
		thermometerService.updateThermometerErrorRange(thermometerErrorRange);
		hygrometerService.updateHygrometerErrorRange(hygrometerErrorRange);
		barometerService.updateBarometerErrorRange(barometerErrorRange);
		dustmeterService.updateDustmeterErrorRange(dustmeterErrorRange);
		
		return url;
	}
	
	@PostMapping("/herror")
	public String updatehErrorRange(String[] HerrorRangeChange) throws Exception{
		String url="redirect:/monitor/hum.do";
		
		int thermometerErrorRange = Integer.parseInt(HerrorRangeChange[0]);
		int hygrometerErrorRange = Integer.parseInt(HerrorRangeChange[1]);
		int barometerErrorRange = Integer.parseInt(HerrorRangeChange[2]);
		int dustmeterErrorRange = Integer.parseInt(HerrorRangeChange[3]);
		
		thermometerService.updateThermometerErrorRange(thermometerErrorRange);
		hygrometerService.updateHygrometerErrorRange(hygrometerErrorRange);
		barometerService.updateBarometerErrorRange(barometerErrorRange);
		dustmeterService.updateDustmeterErrorRange(dustmeterErrorRange);
		
		return url;
	}
	
	@PostMapping("/berror")
	public String updatebErrorRange(String[] BerrorRangeChange) throws Exception{
		String url="redirect:/monitor/pres.do";
		
		int thermometerErrorRange = Integer.parseInt(BerrorRangeChange[0]);
		int hygrometerErrorRange = Integer.parseInt(BerrorRangeChange[1]);
		int barometerErrorRange = Integer.parseInt(BerrorRangeChange[2]);
		int dustmeterErrorRange = Integer.parseInt(BerrorRangeChange[3]);
		
		thermometerService.updateThermometerErrorRange(thermometerErrorRange);
		hygrometerService.updateHygrometerErrorRange(hygrometerErrorRange);
		barometerService.updateBarometerErrorRange(barometerErrorRange);
		dustmeterService.updateDustmeterErrorRange(dustmeterErrorRange);
		
		return url;
	}
	
	@PostMapping("/derror")
	public String updatedErrorRange(String[] DerrorRangeChange) throws Exception{
		String url="redirect:/monitor/clean.do";
		
		int thermometerErrorRange = Integer.parseInt(DerrorRangeChange[0]);
		int hygrometerErrorRange = Integer.parseInt(DerrorRangeChange[1]);
		int barometerErrorRange = Integer.parseInt(DerrorRangeChange[2]);
		int dustmeterErrorRange = Integer.parseInt(DerrorRangeChange[3]);
		
		thermometerService.updateThermometerErrorRange(thermometerErrorRange);
		hygrometerService.updateHygrometerErrorRange(hygrometerErrorRange);
		barometerService.updateBarometerErrorRange(barometerErrorRange);
		dustmeterService.updateDustmeterErrorRange(dustmeterErrorRange);
		
		return url;
	}
	
	@GetMapping("/realTimeHvac")
	@ResponseBody
	public List<HvacdataVO> hvacRealTimeToJSON() throws Exception{
		List<HvacdataVO> hvacdataList = hvacModuleDataScheduler.realTimeHvac();
		
		return hvacdataList;
	}
	
}
