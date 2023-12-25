package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.PageCommand;
import com.spring.dto.AlarmVO;

public interface AlarmService {

	Map<String, Object> getAlarmLog(PageCommand command) throws SQLException;
	int getAlarmCount() throws SQLException;
	List<AlarmVO> getUncheckedList() throws SQLException;
	List<AlarmVO> getNotReadList() throws SQLException;
	
	void checkAlarm(String alarmNum) throws SQLException;
	void checkAllAlarm() throws SQLException;
	void readAlarm(String alarmNum) throws SQLException;
	
	void insertAlarmList() throws SQLException;
	
}
