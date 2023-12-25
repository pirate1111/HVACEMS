package com.spring.scheduler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.spring.dao.BreakrecordDAO;
import com.spring.dao.TemperatureDAO;
import com.spring.dto.BreakrecordVO;
import com.spring.dto.HvacdataVO;

public class HvacModuleDataScheduler {
	
	private BreakrecordDAO breakrecordDAO;
	public void setBreakrecordDAO(BreakrecordDAO breakrecordDAO) {
		this.breakrecordDAO = breakrecordDAO;
	}
	
	private static final Logger logger = LoggerFactory.getLogger(CleanroomInnerDataScheduler.class);
	private static float hvacTemperature;
	private static int hvacWind;
	private static int hvacHumid;
	private static int tempController;
	private static int windController;
	private static int humidController;
	
	public void breakModule() throws Exception{
		resetData();
        String [] section = {"A","B","C","D","E","F","G","H","I","J"};
        int []breakYn = new int[10];
        
        List<BreakrecordVO> breakrecordList = new ArrayList<BreakrecordVO>();
        
	    for(int i = 0; i < section.length; i++) {
	    	resetData();
	    	try {
	    		String pythonScript = "/Users/sun/miniconda3/envs/mire/bin/python";  // Python 실행 파일 경로
	    		String pythonScriptPath = "/Users/sun/Downloads/sts3/python/breakmodule.py";  // 파이썬 스크립트 경로
	    		
	    		BreakrecordVO breakrecord = new BreakrecordVO();
	    		String hvacT = Float.toString(hvacTemperature);
	    		String hvacW = Integer.toString(hvacWind);
	    		String hvacH = Integer.toString(hvacHumid);
	    		String tempC = Integer.toString(tempController);
	    		String windC = Integer.toString(windController);
	    		String humidC = Integer.toString(humidController);
	    		
	    		ProcessBuilder processBuilder = new ProcessBuilder(pythonScript, pythonScriptPath, hvacT, hvacW, hvacH, tempC, windC, humidC);
	    		Process process = processBuilder.start();
	    		
	    		InputStream inputStream = process.getInputStream();
	    		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
	    		
	    		// 표준 오류 출력을 캡처하는 스트림 추가
	    		InputStream errorStream = process.getErrorStream();
	    		BufferedReader errorReader = new BufferedReader(new InputStreamReader(errorStream));
	    		
	    		String line;
	    		int breakYnres = 2;
	    		
	    		while ((line = reader.readLine()) != null) {
	    			if (line.startsWith("breakYn:")) {
	    				breakYnres = Integer.parseInt(line.substring("breakYn:".length()).trim());
	    			} 
	    		}
	    		//이후 필요한
	    		System.out.println("자바");
//		                System.out.println(line);
	    		System.out.println(breakYnres);
	    		// 표준 오류 출력 출력
	    		breakYn[i] = breakYnres;

	    		
	    		if(breakYn[i] == 1) {
	    			LocalDate now = LocalDate.now();
	    			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
	    			String today = now.format(formatter);
	    			int count = getUpdateRecordCount(now);
	    			String recordCount = String.format("%03d", count);
	    			
	    			breakrecord.setBreakrecordNum(today + recordCount);
	    			breakrecord.setHvacNum(section[i]);
	    			breakrecord.setBreakNum(1);
	    			
	    			System.out.println(breakrecord.getBreakrecordNum());
	    			System.out.println(breakrecord.getHvacNum());
	    			System.out.println(breakrecord.getBreakNum());
	    			
	    			breakrecordDAO.insertBreakrecord(breakrecord);
	    			
	    		}
	    		System.out.println("hu");
	    		while ((line = errorReader.readLine()) != null) {
	    			System.err.println(line); // 표준 오류를 출력
	    		}
	    		
	    		int exitCode = process.waitFor();
	    		System.out.println("파이썬 스크립트 종료 코드: " + exitCode);
	    		
	    		
    		}catch (IOException | InterruptedException e) {
    		e.printStackTrace();
    		}
		}
	}
	
    private LocalDate lastRecordDate = null;
    private int recordCount = 0;
    
    public int getUpdateRecordCount(LocalDate recordDate) throws Exception{
    	
    	if(lastRecordDate == null || recordDate.isAfter(lastRecordDate)) {
    		lastRecordDate = recordDate;
    		recordCount = 1;
    	}else {
    		recordCount++;
    	}
    	
    	return recordCount;
    }
    
	public List<HvacdataVO> realTimeHvac() throws Exception{
		resetData();
//		System.out.println("--------------");
//		System.out.println(tempController);
//		System.out.println(windController);
//		System.out.println(humidController);
		String [] section = {"A","B","C","D","E","F","G","H","I","J"};
		List<HvacdataVO> hvacdataList = new ArrayList<HvacdataVO>();
		
		for(int i = 0; i < section.length; i++) {
			resetData();
			HvacdataVO hvacdata = new HvacdataVO();
			
			hvacdata.setHvacTemperature(hvacTemperature);
			hvacdata.setHvacWind(hvacWind);
			hvacdata.setSection(section[i]);
			
			hvacdataList.add(hvacdata);
		}
		
		return hvacdataList;
	}
	
	static void resetData() {
		Random tempRandom = new Random();
		Random windRandom = new Random();
		Random humidRandom = new Random();
		
		int temphvacTemperature = (int)((23 + tempRandom.nextGaussian() * 2) * 10);
		hvacTemperature = (float)temphvacTemperature / 10;
		hvacWind = (int)(115 + windRandom.nextGaussian() * 2);
		hvacHumid = (int)(45 + humidRandom.nextGaussian() * 2);
		
		tempController = (int) (Math.random() + 0.1);
		windController = (int) (Math.random() + 0.1);
		humidController = (int) (Math.random() + 0.1);
		
	}

}
