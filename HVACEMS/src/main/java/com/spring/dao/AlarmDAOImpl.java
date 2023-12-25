package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.PageCommand;
import com.spring.dto.AlarmVO;

public class AlarmDAOImpl implements AlarmDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<AlarmVO> selectAlarmLog(PageCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<AlarmVO> alarmList = session.selectList("Alarm-Mapper.selectAlarmLog",command,rowBounds);
		
		return alarmList;
	}

	@Override
	public int selectAlarmLogCount(PageCommand command) throws SQLException {
		int count = session.selectOne("Alarm-Mapper.selectAlarmLogCount",command);
				
		return count;
	}
	
	@Override
	public int selectAlarmReadCount() throws SQLException {
		int count = session.selectOne("Alarm-Mapper.selectAlarmReadCount");
		return count;
	}

	@Override
	public List<AlarmVO> selectAlarmCheckList() throws SQLException {
		List<AlarmVO> alarmList = session.selectList("Alarm-Mapper.selectAlarmCheckList");
		return alarmList;
	}

	@Override
	public List<AlarmVO> selectAlarmReadList() throws SQLException {
		List<AlarmVO> alarmList = session.selectList("Alarm-Mapper.selectAlarmReadList");
		return alarmList;
	}

	@Override
	public void updateCheck(String alarmNum) throws SQLException {
		session.update("Alarm-Mapper.updateCheck", alarmNum);
	}

	@Override
	public AlarmVO selectAlarmByBreakNum(String breakNum) throws SQLException {
		AlarmVO alarm = session.selectOne("Alarm-Mapper.selectAlarmByBreakNum", breakNum);
		return alarm;
	}

	@Override
	public void insertAlarm(AlarmVO alarm) throws SQLException {
		session.insert("Alarm-Mapper.insertAlarm", alarm);
	}

	@Override
	public void updateCheckAll() throws SQLException {
		session.update("Alarm-Mapper.updateCheckAll");
	}

	@Override
	public void updateRead(String alarmNum) throws SQLException {
		session.update("Alarm-Mapper.updateRead", alarmNum);
	}

}
