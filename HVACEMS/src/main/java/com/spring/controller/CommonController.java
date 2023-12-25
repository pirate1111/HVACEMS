package com.spring.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dto.AdminVO;
import com.spring.dto.AlarmVO;
import com.spring.dto.ClasssVO;
import com.spring.dto.EnergyconsumeVO;
import com.spring.dto.HumidVO;
import com.spring.dto.MenuVO;
import com.spring.dto.PressureVO;
import com.spring.dto.TemperatureVO;
import com.spring.scheduler.CleanroomInnerDataScheduler;
import com.spring.service.AdminService;
import com.spring.service.AlarmService;
import com.spring.service.EnergyconsumeService;
import com.spring.service.MenuService;

@Controller
public class CommonController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private AlarmService alarmService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private EnergyconsumeService energyconsumeService;
	
	@Autowired
	private CleanroomInnerDataScheduler cleanroomInnerDataScheduler;
	
	@GetMapping("/main")
	public String main() throws Exception{
		String url = "/desiboard/list";
		
		return url;
	}
	
	@GetMapping("/home")
	public ModelAndView home(@RequestParam(defaultValue = "M000000") String menuCode, HttpSession session, ModelAndView mnv) throws Exception{
		String url="/common/indexPage";
		
		Map<String, Object> dataMap = menuService.getMainMenuList();
		MenuVO menu = menuService.getMenuByMenuCode(menuCode);
		
		int alarmCount = alarmService.getAlarmCount();
		List<AlarmVO> checkList = alarmService.getUncheckedList();
		List<AlarmVO> readList = alarmService.getNotReadList();
		
		String adminId = (String)session.getAttribute("loginUser");
		AdminVO admin = adminService.getAdmin(adminId);
		
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("menu", menu);
		
		mnv.addObject("alarmCount", alarmCount);
		mnv.addObject("checkList", checkList);
		mnv.addObject("readList", readList);
		
		mnv.addObject("loginUser", admin);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/api/alarm/banner")
	@ResponseBody
	public ResponseEntity<List<AlarmVO>> alarmBanner() throws Exception{
		ResponseEntity<List<AlarmVO>> result = null;
		
		alarmService.insertAlarmList();
		List<AlarmVO> readList = alarmService.getNotReadList();
		
		result = new ResponseEntity<List<AlarmVO>>(readList, HttpStatus.OK);
		
		return result;
	}
	
	@GetMapping("/api/alarm/bell")
	@ResponseBody
	public ResponseEntity<List<AlarmVO>> alarmBell() throws Exception{
		ResponseEntity<List<AlarmVO>> result = null;
		
		alarmService.insertAlarmList();
		List<AlarmVO> checkList = alarmService.getUncheckedList();
		
		result = new ResponseEntity<List<AlarmVO>>(checkList, HttpStatus.OK);
		
		return result;
	}
	
	@GetMapping("/subMenu")
	@ResponseBody
	public List<MenuVO> subMenuToJSON(String menuCode) throws Exception{
		List<MenuVO> menuList = menuService.getSubMenuList(menuCode);
		
		return menuList;
	}
	
	@GetMapping("/common/loginForm")
	public String loginForm(@ModelAttribute("retUrl") String retUrl, String error, HttpServletResponse response, Model model) {
		String url="/common/loginForm";
		
		if(error!=null && error.equals("-1")) {
			response.setStatus(302);
			model.addAttribute("message","로그인은 필수입니다.");
		}
		
		return url;
	}
	
	@GetMapping("/common/loginTimeOut")
	public String loginTimeOut(Model model) throws Exception {
		String url = "/common/sessionOut";
		model.addAttribute("message", "세션이 만료되었습니다.\\n다시 로그인 하세요.");
		return url;
	}
	
	@GetMapping("/tempRealtime")
	@ResponseBody
	public List<TemperatureVO> tempRealTimeToJSON() throws Exception{
		List<TemperatureVO> temperatureList = cleanroomInnerDataScheduler.realTimeTemperature();
		return temperatureList;
	}
	
	@GetMapping("/humidRealtime")
	@ResponseBody
	public List<HumidVO> humidRealTimeToJSON() throws Exception{
		List<HumidVO> humidList = cleanroomInnerDataScheduler.realTimeHumid();
		return humidList;
	}
	
	@GetMapping("/pressRealtime")
	@ResponseBody
	public List<PressureVO> pressRealTimeToJSON() throws Exception{
		List<PressureVO> pressureList = cleanroomInnerDataScheduler.realTimePressure();
		return pressureList;
	}
	
	@GetMapping("/classsRealtime")
	@ResponseBody
	public List<ClasssVO> classsRealTimeToJSON() throws Exception{
		List<ClasssVO> classsList = cleanroomInnerDataScheduler.realTimeClasss();
		return classsList;
	}
	
	@GetMapping("/hvacRealtime")
	@ResponseBody
	public List<EnergyconsumeVO> hvacRealTimeToJSON() throws Exception{
		List<EnergyconsumeVO> energyconsumeList = cleanroomInnerDataScheduler.dashboardRealTime();
		
		return energyconsumeList;
	}
	
}
