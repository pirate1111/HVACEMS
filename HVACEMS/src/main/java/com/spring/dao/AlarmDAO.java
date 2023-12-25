package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageCommand;
import com.spring.dto.AlarmVO;

public interface AlarmDAO {

	List<AlarmVO> selectAlarmLog(PageCommand command) throws SQLException;
	int selectAlarmLogCount(PageCommand command) throws SQLException;
	
	int selectAlarmReadCount() throws SQLException;
	List<AlarmVO> selectAlarmCheckList() throws SQLException;
	List<AlarmVO> selectAlarmReadList() throws SQLException;
	
	void updateCheck(String alarmNum) throws SQLException;
	void updateCheckAll() throws SQLException;
	void updateRead(String alarmNum) throws SQLException;
	
	AlarmVO selectAlarmByBreakNum(String breakNum) throws SQLException;
	void insertAlarm(AlarmVO alarm) throws SQLException;
}
