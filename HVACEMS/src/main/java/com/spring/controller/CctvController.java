package com.spring.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/monitor")
public class CctvController {
	
	@GetMapping("/cctv")
	public String cctvList() throws Exception{
		String url = "/cctv/cctv_list";
		
		return url;
	}
	
	@RequestMapping("/cctv/detail")
	public String detail(String cctv, Model model)throws SQLException{
		String url="/cctv/detail";
		
		model.addAttribute("cctv",cctv);
		
		return url;
	}
}
