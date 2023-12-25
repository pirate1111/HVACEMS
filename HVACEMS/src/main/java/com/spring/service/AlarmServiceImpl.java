package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageCommand;
import com.spring.dao.AlarmDAO;
import com.spring.dao.BreakDAO;
import com.spring.dto.AlarmVO;
import com.spring.dto.BreakVO;

public class AlarmServiceImpl implements AlarmService {

	private AlarmDAO alarmDAO;
	public void setAlarmDAO(AlarmDAO alarmDAO) {
		this.alarmDAO = alarmDAO;
	}
	
	private BreakDAO breakDAO;
	public void setBreakDAO(BreakDAO breakDAO) {
		this.breakDAO = breakDAO;
	}

	private void addBreakNum(AlarmVO alarm) throws SQLException {
		if (alarm == null) return;
		int breakRecordNum = breakDAO.selectTypeByBreakNum(alarm.getBreakRecordNum());
		alarm.setBreakNum(breakRecordNum);
	}
	
	private void addHvacNum(AlarmVO alarm) throws SQLException {
		if (alarm == null) return;
		String hvacNum = breakDAO.selectHvacBreakNum(alarm.getBreakRecordNum());
		alarm.setHvacNum(hvacNum);
	}
	
	private void addBreakName(AlarmVO alarm) throws SQLException {
		if (alarm == null) return;
		String breakName = breakDAO.selectNameByNum(alarm.getBreakNum());
		alarm.setBreakName(breakName);
	}
	

	@Override
	public Map<String, Object> getAlarmLog(PageCommand command) throws SQLException {
		List<AlarmVO> alarmList = alarmDAO.selectAlarmLog(command);
		
		int totalCount = alarmDAO.selectAlarmLogCount(command);		
		command.setTotalCount(totalCount);
		
		if (alarmList != null) {
			for (AlarmVO alarm : alarmList) {
				addBreakNum(alarm);
				addHvacNum(alarm);
				addBreakName(alarm);
			}
		}
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("alarmList", alarmList);
		dataMap.put("pageCommand", command);
		
		return dataMap;
	}

	@Override
	public int getAlarmCount() throws SQLException {
		int count = alarmDAO.selectAlarmReadCount();
		return count;
	}

	@Override
	public List<AlarmVO> getUncheckedList() throws SQLException {
		List<AlarmVO> alarmList = alarmDAO.selectAlarmCheckList();
		
		if (alarmList != null) {
			for (AlarmVO alarm : alarmList) {
				addBreakNum(alarm);
				addHvacNum(alarm);
				addBreakName(alarm);
			}
		}
		
		return alarmList;
	}

	@Override
	public List<AlarmVO> getNotReadList() throws SQLException {
		List<AlarmVO> alarmList = alarmDAO.selectAlarmReadList();
		
		if (alarmList != null) {
			for (AlarmVO alarm : alarmList) {
				addBreakNum(alarm);
				addHvacNum(alarm);
				addBreakName(alarm);
			}
		}
		
		return alarmList;
	}

	@Override
	public void checkAlarm(String alarmNum) throws SQLException {
		alarmDAO.updateCheck(alarmNum);
	}

	@Override
	public void insertAlarmList() throws SQLException {
		List<BreakVO> breakList = breakDAO.selectBreakRecord();
		for (BreakVO record : breakList) {
			if (alarmDAO.selectAlarmByBreakNum(record.getBreakRecordNum()) == null) {
				AlarmVO alarm = new AlarmVO();
				alarm.setAlarmNum(record.getBreakRecordNum());
				alarm.setAlarmContent(breakDAO.selectNameByNum(record.getBreakNum()));
				alarm.setBreakRecordNum(record.getBreakRecordNum());
				alarmDAO.insertAlarm(alarm);
			}
		}
		
	}

	@Override
	public void checkAllAlarm() throws SQLException {
		alarmDAO.updateCheckAll();
	}

	@Override
	public void readAlarm(String alarmNum) throws SQLException {
		alarmDAO.updateRead(alarmNum);
	}

}
