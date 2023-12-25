package com.spring.dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchListCommand;
import com.spring.dto.PressureVO;

public class PressureDAOImpl implements PressureDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<PressureVO> selectPressure(SearchListCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<PressureVO> pressureList = session.selectList("Pressure-Mapper.selectPressure", command, rowBounds);
		
		return pressureList;
	}

	@Override
	public List<PressureVO> selectPressureGraph(SearchListCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<PressureVO> pressureList = session.selectList("Pressure-Mapper.selectPressureGraph", command, rowBounds);
		
		return pressureList;
	}
	
	@Override
	public int selectSearchPressureListCount(SearchListCommand command) throws SQLException {
		int count = session.selectOne("Pressure-Mapper.selectSearchPressureListCount",command);
		
		return count;
	}
	
	@Override
	public void insertPressure(PressureVO pressure) throws SQLException {
		session.update("Pressure-Mapper.insertPressure",pressure);
	}

	@Override
	public int selectPressureSeqNext() throws SQLException {
		int seqPressure = session.selectOne("Pressure-Mapper.selectPressureSeqNext");
		
		return seqPressure;
	}

}
