package com.spring.dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchListCommand;
import com.spring.dto.TemperatureVO;

public class TemperatureDAOImpl implements TemperatureDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<TemperatureVO> selectTemperature(SearchListCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<TemperatureVO> temperatureList = session.selectList("Temperature-Mapper.selectTemperature", command, rowBounds);
		
		return temperatureList;
	}

	@Override
	public List<TemperatureVO> selectTemperatureGraph(SearchListCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<TemperatureVO> temperatureList = session.selectList("Temperature-Mapper.selectTemperatureGraph", command, rowBounds);
		
		return temperatureList;
	}
	
	@Override
	public int selectSearchTemperatureListCount(SearchListCommand command) throws SQLException {
		int count = session.selectOne("Temperature-Mapper.selectSearchTemperatureListCount",command);
		
		return count;
	}
	
	@Override
	public void insertTemperature(TemperatureVO temperature) throws SQLException {
		session.update("Temperature-Mapper.insertTemperature",temperature);
	}
	
	@Override
	public int selectTemperatureSeqNext() throws SQLException {
		int seqTemperature = session.selectOne("Temperature-Mapper.selectTemperatureSeqNext");
		
		return seqTemperature;
	}
}
