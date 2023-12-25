package com.spring.scheduler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.spring.dao.ClasssDAO;
import com.spring.dao.CostChangeDAO;
import com.spring.dao.EnergyconsumeDAO;
import com.spring.dao.EnergycostDAO;
import com.spring.dao.HumidDAO;
import com.spring.dao.HvacelecDAO;
import com.spring.dao.PressureDAO;
import com.spring.dao.TemperatureDAO;
import com.spring.dto.ClasssVO;
import com.spring.dto.CostChangeVO;
import com.spring.dto.EnergyconsumeVO;
import com.spring.dto.EnergycostVO;
import com.spring.dto.HumidVO;
import com.spring.dto.HvacelecVO;
import com.spring.dto.PressureVO;
import com.spring.dto.TemperatureVO;

public class CleanroomInnerDataScheduler {
	
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
	
	private EnergyconsumeDAO energyconsumeDAO;
	public void setEnergyconsumeDAO(EnergyconsumeDAO energyconsumeDAO) {
		this.energyconsumeDAO = energyconsumeDAO;
	}
	
	private HvacelecDAO hvacelecDAO;
	public void setHvacelecDAO(HvacelecDAO hvacelecDAO) {
		this.hvacelecDAO = hvacelecDAO;
	}
	
	private EnergycostDAO energycostDAO;
	public void setEnergycostDAO(EnergycostDAO energycostDAO) {
		this.energycostDAO = energycostDAO;
	}
	
	private CostChangeDAO costchangeDAO;
	public void setCostChangeDAO(CostChangeDAO costchangeDAO) {
		this.costchangeDAO = costchangeDAO;
	}
	

	private static final Logger logger = LoggerFactory.getLogger(CleanroomInnerDataScheduler.class);
	private static float temperature;
	private static int humid;
	private static float pressure;
	private static int classs;
	private static int elec;
	private static int hvac;
	private static int cooler;
	private static int heater;
	private static int dehumid;
   
    public List<TemperatureVO> realTimeTemperature() throws Exception {
        resetData();
        float tsum = 0;
        List<TemperatureVO> temperatureList = new ArrayList<TemperatureVO>();
        for(int i = 0; i < 10; i++){
        	TemperatureVO t = new TemperatureVO();
        	temperatureList.add(t);
        }
        
    	for(TemperatureVO temp : temperatureList) {
    		resetData();
    		float temptemp = temperature;
    		temp.setTemperature(temptemp);
    		
    		tsum = temperature + tsum;
    	}
        float avg = tsum / temperatureList.size();
        TemperatureVO at = new TemperatureVO();
        at.setTemperature(avg);
        at.setThermometerNum("A00");
        at.setDate("1");
        temperatureList.add(at);
        
        return temperatureList;
    }
    
    public List<HumidVO> realTimeHumid() throws Exception {
        resetData();
        int hsum = 0;
        List<HumidVO> humidList = new ArrayList<HumidVO>();
        for(int i = 0; i < 10; i++){
        	HumidVO h = new HumidVO();
        	humidList.add(h);
        }
        
    	for(HumidVO hum : humidList) {
    		resetData();
    		int temphumid = humid;
    		hum.setHumid(temphumid);
    		
    		hsum = humid + hsum;
    	}
    	int avg = hsum / humidList.size();
    	HumidVO at = new HumidVO();
        at.setHumid(avg);
        at.setHygrometerNum("A00");
        at.setDate("1");
        humidList.add(at);
    	
        return humidList;
    }
    
    public List<PressureVO> realTimePressure() throws Exception {
        resetData();
        float psum = 0;
        List<PressureVO> pressureList = new ArrayList<PressureVO>();
        for(int i = 0; i < 10; i++){
        	PressureVO h = new PressureVO();
        	pressureList.add(h);
        }
        
    	for(PressureVO press : pressureList) {
    		resetData();
    		float temppress = pressure;
    		press.setPressure(temppress);
    		
    		psum = pressure + psum;
    	}
    	float avg = psum / pressureList.size();
    	PressureVO at = new PressureVO();
        at.setPressure(avg);
        at.setBarometerNum("A00");
        at.setDate("1");
        pressureList.add(at);
    	
        return pressureList;
    }
    
    public List<ClasssVO> realTimeClasss() throws Exception {
        resetData();
        int csum = 0;
        List<ClasssVO> classsList = new ArrayList<ClasssVO>();
        for(int i = 0; i < 10; i++){
        	ClasssVO h = new ClasssVO();
        	classsList.add(h);
        }
        
    	for(ClasssVO cla : classsList) {
    		resetData();
    		int tempcla = classs;
    		cla.setclasss(tempcla);
    		
    		csum = classs + csum;
    	}
    	int avg = csum / classsList.size();
    	ClasssVO at = new ClasssVO();
        at.setclasss(avg);
        at.setDustmeterNum("A00");
        classsList.add(at);
    	
        return classsList;
    }
    
    public void insertCleanroomInnerData() throws Exception {
    	resetData();
        TemperatureVO temperatureVO = new TemperatureVO();
        HumidVO humidVO = new HumidVO();
        PressureVO pressureVO = new PressureVO();
        ClasssVO classsVO = new ClasssVO();
        String [] section = {"A01","B01","C01","D01","E01","F01","G01","H01","I01","J01"};
        float tsum = 0;
        int hsum = 0;
        float psum = 0;
        int csum = 0;
        
        for(int i = 0; i < section.length; i++) {
        	resetData();
//        	System.out.println(i +"踰  :" + temperature);
        	int temperatureNum = temperatureDAO.selectTemperatureSeqNext();
        	temperatureVO.setTemperatureNum(temperatureNum);
			temperatureVO.setThermometerNum(section[i]);
			temperatureVO.setTemperature(temperature);
			temperatureDAO.insertTemperature(temperatureVO);
			
			tsum = temperature + tsum;
			if (i == section.length-1) {
				float avg = (tsum) / 10;
				temperatureNum = temperatureDAO.selectTemperatureSeqNext();
				temperatureVO.setTemperatureNum(temperatureNum);
				temperatureVO.setThermometerNum("A00");
				temperatureVO.setTemperature(avg);
				temperatureDAO.insertTemperature(temperatureVO);
			}
        }
        
        for(int i = 0; i < section.length; i++) {
        	resetData();
        	int humidNum = humidDAO.selectHumidSeqNext();
        	humidVO.setHumidNum(humidNum);
        	humidVO.setHygrometerNum(section[i]);
        	humidVO.setHumid(humid);
			humidDAO.insertHumid(humidVO);
			
			hsum = humid + hsum;
			if (i == section.length-1) {
				int avg = (hsum) / 10;
				humidNum = humidDAO.selectHumidSeqNext();
	        	humidVO.setHumidNum(humidNum);
	        	humidVO.setHygrometerNum("A00");
	        	humidVO.setHumid(avg);
				humidDAO.insertHumid(humidVO);
			}
        }
        
        for(int i = 0; i < section.length; i++) {
        	resetData();
        	int pressureNum = pressureDAO.selectPressureSeqNext();
        	pressureVO.setPressureNum(pressureNum);
			pressureVO.setBarometerNum(section[i]);
			pressureVO.setPressure(pressure);
			pressureDAO.insertPressure(pressureVO);
			
			psum = pressure + psum;
			if (i == section.length-1) {
				float avg = (psum) / 10;
				pressureNum = pressureDAO.selectPressureSeqNext();
				pressureVO.setPressureNum(pressureNum);
				pressureVO.setBarometerNum("A00");
				pressureVO.setPressure(avg);
				pressureDAO.insertPressure(pressureVO);
			}
        }
        
        for(int i = 0; i < section.length; i++) {
        	resetData();
        	int classsNum = classsDAO.selectClasssSeqNext();
        	classsVO.setclasssNum(classsNum);
			classsVO.setDustmeterNum(section[i]);
			classsVO.setclasss(classs);
			classsDAO.insertClasss(classsVO);
			
			csum = classs + csum;
			if (i == section.length-1) {
				int avg = (csum) / 10;
				classsNum = classsDAO.selectClasssSeqNext();
	        	classsVO.setclasssNum(classsNum);
				classsVO.setDustmeterNum("A00");
				classsVO.setclasss(avg);
				classsDAO.insertClasss(classsVO);
			}
        }
    }

	 public void elecConsuptionChanger() throws Exception {
        resetData();
        String [] section = {"A","B","C","D","E","F","G","H","I","J"};
        float elecSum = 0;
	    int []hvac = new int[10];
		int []cooler = new int[10];
		int []heater = new int[10];
		int []dehumid = new int[10];
	
	    for(int i = 0; i < section.length; i++) {
	    	resetData();
	    	try {
	    		String pythonScript = "/Users/sun/miniconda3/envs/mire/bin/python"; // Python 실행 파일 경로
	    		String pythonScriptPath = "/Users/sun/Downloads/sts3/python/elecchangemodule.py";  // 파이썬 스크립트 경로
	    		
	    		HvacelecVO hvacelec = new HvacelecVO();
	    		EnergyconsumeVO energyconsume = new EnergyconsumeVO();
	    		String te = Float.toString(temperature);
	    		String hu = Integer.toString(humid);
	    		String pr = Float.toString(pressure);
	    		String cl = Integer.toString(classs);
	    		ProcessBuilder processBuilder = new ProcessBuilder(pythonScript, pythonScriptPath, te, hu, pr, cl);
	    		Process process = processBuilder.start();
	    		
	    		InputStream inputStream = process.getInputStream();
	    		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
	    		
	    		// 표준 오류 출력을 캡처하는 스트림 추가
	    		InputStream errorStream = process.getErrorStream();
	    		BufferedReader errorReader = new BufferedReader(new InputStreamReader(errorStream));
	    		
	    		String line;
	    		float temp = 0; 
	    		float hum = 0;
	    		float press = 0;
	    		float cla = 0;
	    		float energy = 0;
	    		String onoff = "";
	    		
	    		while ((line = reader.readLine()) != null) {
	    			if (line.startsWith("Temperature:")) {
	    				temp = Float.parseFloat(line.substring("Temperature:".length()).trim());
	    			} else if (line.startsWith("Humidity:")) {
	    				hum = Float.parseFloat(line.substring("Humidity:".length()).trim());
	    			} else if (line.startsWith("Pressure:")) {
	    				press = Float.parseFloat(line.substring("Pressure:".length()).trim());
	    			} else if (line.startsWith("Dust:")) {
	    				cla = Float.parseFloat(line.substring("Dust:".length()).trim());
	    			} else if (line.startsWith("parsedConsumeEnergy:")) {
	    				energy = Float.parseFloat(line.substring("parsedConsumeEnergy:".length()).trim());
	    			} else if (line.startsWith("predictions:")) {
	    				onoff = line.substring("predictions:".length()).trim();
	    				
	    			}
	    			// 이후 필요한
	//	                System.out.println("자바");
	//	                System.out.println(line);
	//	                System.out.println(energy);
	//	                System.out.println(onoff);
	    		}
	    		hvac[i] = Integer.parseInt(onoff.substring(2,3));
	    		cooler[i] = Integer.parseInt(onoff.substring(4,5));
	    		heater[i] = Integer.parseInt(onoff.substring(6,7));
	    		dehumid[i] = Integer.parseInt(onoff.substring(8,9));
	    		
	    		int consumeNum = energyconsumeDAO.selectEnergyConsumeSeqNext();
	    		energyconsume.setConsumeNum(consumeNum);
	    		energyconsume.setConsumeEnergy(energy);
	    		energyconsume.setConsumeOperation(hvac[i]);
	    		energyconsume.setHvacNum(section[i]);
	    		energyconsume.setHeater(heater[i]);
	    		energyconsume.setCooler(cooler[i]);
	    		energyconsume.setDehumidifier(dehumid[i]);
	    		
	    		energyconsumeDAO.insertConsumeEnergy(energyconsume);
	    		System.out.println("consume complete");
	    		
	    		int hvacelecNum = hvacelecDAO.selectHvacelecSeqNext();
	    		hvacelec.setHvacelecData((int)energy);
	    		hvacelec.setHvacelecSection(section[i]+"01");
	    		hvacelec.setHvacelecdataNum(hvacelecNum);
	    		
	    		hvacelecDAO.insertHvacelec(hvacelec);
	    		System.out.println("hvacelec complete");
	    		
	    		elecSum = energy + elecSum;
	    		System.out.println(i);
	    		if(i == (section.length - 1)) {
	    			EnergycostVO energycost = new EnergycostVO();
	    			CostChangeVO costchange = costchangeDAO.selectCostChange();
	    			int allNum = energyconsumeDAO.selectEnergyConsumeSeqNext();
	    			energyconsume.setConsumeNum(allNum);
		    		energyconsume.setConsumeEnergy(elecSum);
		    		energyconsume.setHvacNum("ALL");
		    		energyconsumeDAO.insertConsumeEnergy(energyconsume);
		    		System.out.println("ALL complete");
		    		
		    		int allHvacNum = hvacelecDAO.selectHvacelecSeqNext();
		    		elecSum = elecSum / 10 ;
		    		hvacelec.setHvacelecData((int)elecSum);
		    		hvacelec.setHvacelecSection("A00");
		    		hvacelec.setHvacelecdataNum(allHvacNum);
		    		hvacelecDAO.insertHvacelec(hvacelec);
		    		System.out.println("ALL complete");
		    		
		    		int basefee = costchange.getBaseFee();
		    		double tax = costchange.getTax();
		    		double fund = costchange.getFund();
		    		
		    		basefee = (int)elecSum * basefee;
		    		tax = basefee * tax;
		    		fund = basefee * fund;
		    		basefee = basefee + (int)tax + (int)fund;
		    		
		    		int costNum = energycostDAO.selectEnergycostSeqNext();
		    		energycost.setCostNum(costNum);
		    		energycost.setEnergyCost(basefee);
		    		energycostDAO.insertEnergycost(energycost);
		    		System.out.println("cost complete");
		    		
	    		}
	    		// 표준 오류 출력 출력
	    		while ((line = errorReader.readLine()) != null) {
	    			System.err.println(line); // 표준 오류를 출력
	    		}
	    		
	    		int exitCode = process.waitFor();
	    		System.out.println("파이썬 스크립트 종료 코드: " + exitCode);
	    	} catch (IOException | InterruptedException e) {
	    		e.printStackTrace();
	    	}
	    }
	    
	}
	 
//	 public List<EnergyconsumeVO> dashBoardHvac() throws Exception {
//	        resetData();
//	        String [] section = {"A","B","C","D","E","F","G","H","I","J"};
//		    int hvac = 10;
//			int cooler = 10;
//			int heater = 10;
//			int dehumid = 10;
//			
//			List<EnergyconsumeVO> energyconsumeList = new ArrayList<EnergyconsumeVO>();
//			
//	    	resetData();
//	    	try {
//	    		String pythonScript = "/Users/sun/miniconda3/envs/mire/bin/python";  // Python 실행 파일 경로
//	    		String pythonScriptPath = "/Users/sun/Downloads/sts3/python/elecchangemodule.py";  // 파이썬 스크립트 경로
//	    		
//	    		EnergyconsumeVO energyconsume = new EnergyconsumeVO();
//	    		String te = Float.toString(temperature);
//	    		String hu = Integer.toString(humid);
//	    		String pr = Float.toString(pressure);
//	    		String cl = Integer.toString(classs);
//	    		ProcessBuilder processBuilder = new ProcessBuilder(pythonScript, pythonScriptPath, te, hu, pr, cl);
//	    		Process process = processBuilder.start();
//	    		
//	    		InputStream inputStream = process.getInputStream();
//	    		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
//	    		// 표준 오류 출력을 캡처하는 스트림 추가
//	    		InputStream errorStream = process.getErrorStream();
//	    		BufferedReader errorReader = new BufferedReader(new InputStreamReader(errorStream));
//	    		
//	    		String line;
//	    		float energy = 0;
//	    		String onoff = "";
//	    		int conEnergy = 0;
//	    		
//	    		while ((line = reader.readLine()) != null) {
//	    			if (line.startsWith("parsedConsumeEnergy:")) {
//	    				energy = Float.parseFloat(line.substring("parsedConsumeEnergy:".length()).trim());
//	    			} else if (line.startsWith("predictions:")) {
//	    				onoff = line.substring("predictions:".length()).trim();
//	    			}
//	    			// 이후 필요한
//	    		}
//	    		System.out.println("자바");
//	    		//	                System.out.println(line);
//	    		System.out.println(energy);
//	    		System.out.println(onoff);
//	    		conEnergy = (int)energy;
//	    		hvac = Integer.parseInt(onoff.substring(2,3));
//	    		cooler = Integer.parseInt(onoff.substring(4,5));
//	    		heater = Integer.parseInt(onoff.substring(6,7));
//	    		dehumid = Integer.parseInt(onoff.substring(8,9));
//	    		
//	    		energyconsume.setConsumeOperation(hvac);
//	    		energyconsume.setCooler(cooler);
//	    		energyconsume.setHeater(heater);
//	    		energyconsume.setDehumidifier(dehumid);
//	    		energyconsume.setConsumeEnergy(conEnergy);
//	    		energyconsume.setHvacNum("ALL");
//	    		
//	    		energyconsumeList.add(energyconsume);
//	    		
//	    		System.out.println(energyconsume.getConsumeOperation());
//	    		System.out.println(energyconsume.getHeater());
//	    		System.out.println(energyconsume.getCooler());
//	    		System.out.println(energyconsume.getDehumidifier());
//	    		System.out.println(energyconsume.getConsumeEnergy());
//	    		
//	    		// 표준 오류 출력 출력
//	    		while ((line = errorReader.readLine()) != null) {
//	    			System.err.println(line); // 표준 오류를 출력
//	    		}
//	    		
//	    		int exitCode = process.waitFor();
//	    		System.out.println("파이썬 스크립트 종료 코드: " + exitCode);
//	    		
//	    	} catch (IOException | InterruptedException e) {
//	    		e.printStackTrace();
//	    		System.out.println("hasibal");
//	    		return Collections.emptyList();
//	    	}
//		    System.out.println(energyconsumeList);
//		    return energyconsumeList;
//		} 
	public List<EnergyconsumeVO> dashboardRealTime() throws Exception{
		resetData();
		List<EnergyconsumeVO> energyconsumeList = new ArrayList<EnergyconsumeVO>();
		
		for(int i = 0; i < 10; i++) {
			EnergyconsumeVO energyconsume = new EnergyconsumeVO();
			energyconsume.setConsumeEnergy(elec);
			energyconsume.setConsumeOperation(hvac);
			energyconsume.setCooler(cooler);
			energyconsume.setHeater(heater);
			energyconsume.setDehumidifier(dehumid);
			energyconsume.setHvacNum("ALL");
			
			energyconsumeList.add(energyconsume);
		}
		
		return energyconsumeList;
	}
	 
    
    static void resetData() {
        Random tRandom = new Random();
        Random hRandom = new Random();
        Random pRandom = new Random();
        Random cRandom = new Random();
        Random eRandom = new Random();

        int temptemperature = (int)((23 + tRandom.nextGaussian() * 1) * 10);
        temperature = (float) temptemperature / 10;
        humid = (int)(45 + hRandom.nextGaussian() * 2);
        int temppressure = (int)((1000 + pRandom.nextGaussian() * 2) * 10);
        pressure = (float) temppressure / 10;
        classs = (int)(70 + cRandom.nextGaussian() * 3);
        elec = (int)(530 + eRandom.nextGaussian() * 3);
        
        hvac = (int) (Math.random() + 0.1);
		cooler = (int) (Math.random() + 0.1);
		heater = (int) (Math.random() + 0.1);
		dehumid = (int) (Math.random() + 0.1);
        
    }
    
}
    
