package com.spring.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.command.SearchListCommand;
import com.spring.dto.Co2VO;
import com.spring.dto.CostChangeVO;
import com.spring.dto.EnergycostVO;

public interface CostService {

	// �뿉�꼫吏�鍮꾩슜	
	Map<String,Object> getEnergycostVOList(SearchListCommand command)throws SQLException;
	
	int getTodayCost() throws SQLException;
	
	// 萸먯엫?
	void regist(EnergycostVO energycost)throws SQLException;
	
	void updateCostChange(CostChangeVO costChange)throws SQLException;
	
	CostChangeVO getCostChange()throws SQLException;
	
	EnergycostVO getLastYearCost()throws SQLException;
	
	// �깂�냼諛곗텧�웾
	Map<String,Object> getCo2VOList(SearchListCommand command)throws SQLException;
	
	int getTodayCo2() throws SQLException;
		
	// 占쎈쾻嚥∽옙
	void registCo2()throws SQLException;

	//�뿰蹂� 議고쉶
	Map<String, Object> getCostYearList(SearchListCommand command) throws SQLException;
	
	int getCo2Price() throws SQLException;
	
}
