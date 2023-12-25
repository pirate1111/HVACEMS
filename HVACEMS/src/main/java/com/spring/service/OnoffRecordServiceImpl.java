package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.dao.OnoffRecordDAO;
import com.spring.dto.OnoffRecordVO;

public class OnoffRecordServiceImpl implements OnoffRecordService{

	private OnoffRecordDAO onoffRecordDAO;
	public void setOnoffRecordDAO(OnoffRecordDAO onoffRecordDAO) {
		this.onoffRecordDAO = onoffRecordDAO;
	}
	
	@Override
	public Map<String, Object> getOnoffYn() throws SQLException {
		Map<String, Object> dataMap=new HashMap<String, Object>();
		List<OnoffRecordVO> onoffRecordListA = onoffRecordDAO.selectOnoffYnA();
		List<OnoffRecordVO> onoffRecordListB = onoffRecordDAO.selectOnoffYnB();
		List<OnoffRecordVO> onoffRecordListC = onoffRecordDAO.selectOnoffYnC();
		List<OnoffRecordVO> onoffRecordListD = onoffRecordDAO.selectOnoffYnD();
		List<OnoffRecordVO> onoffRecordListE = onoffRecordDAO.selectOnoffYnE();
		List<OnoffRecordVO> onoffRecordListF = onoffRecordDAO.selectOnoffYnF();
		List<OnoffRecordVO> onoffRecordListG = onoffRecordDAO.selectOnoffYnG();
		List<OnoffRecordVO> onoffRecordListH = onoffRecordDAO.selectOnoffYnH();
		List<OnoffRecordVO> onoffRecordListI = onoffRecordDAO.selectOnoffYnI();
		List<OnoffRecordVO> onoffRecordListJ = onoffRecordDAO.selectOnoffYnJ();


		dataMap.put("onoffRecordListA", onoffRecordListA);
		dataMap.put("onoffRecordListB", onoffRecordListB);
		dataMap.put("onoffRecordListC", onoffRecordListC);
		dataMap.put("onoffRecordListD", onoffRecordListD);
		dataMap.put("onoffRecordListE", onoffRecordListE);
		dataMap.put("onoffRecordListF", onoffRecordListF);
		dataMap.put("onoffRecordListG", onoffRecordListG);
		dataMap.put("onoffRecordListH", onoffRecordListH);
		dataMap.put("onoffRecordListI", onoffRecordListI);
		dataMap.put("onoffRecordListJ", onoffRecordListJ);


		return dataMap;
	}

	@Override
	public void insertOnoffRecord(List<OnoffRecordVO> onoffRecordList) throws Exception {
		
		
		if(onoffRecordList !=null && !onoffRecordList.isEmpty())
			for(OnoffRecordVO record : onoffRecordList) {
				int OnoffRecordNum = onoffRecordDAO.selectOnoffSeqNext();
				record.setOnoffRecordNum(OnoffRecordNum);				
			}
		
		
		onoffRecordDAO.insertOnoffRecord(onoffRecordList);
	}

}
