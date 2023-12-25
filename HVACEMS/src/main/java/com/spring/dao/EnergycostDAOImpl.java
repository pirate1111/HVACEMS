package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchListCommand;
import com.spring.dto.EnergycostVO;

public class EnergycostDAOImpl implements EnergycostDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<EnergycostVO> selectEnergycost(SearchListCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();		
		RowBounds rowBounds  =new RowBounds(offset,limit);
		
		List<EnergycostVO> energycostList = session.selectList("Energycost-Mapper.selectEnergycost",command,rowBounds);
		
		return energycostList;

	}
	
	@Override
	public int selectSearchEnergycostListCount(SearchListCommand command) throws SQLException {
		int count=session.selectOne("Energycost-Mapper.selectSearchEnergycostListCount",command);
		return count;
	}

	@Override
	public List<SearchListCommand> selectByYear(SearchListCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();		
		RowBounds rowBounds  =new RowBounds(offset,limit);
		
		List<SearchListCommand> energycostYearList = session.selectList("Energycost-Mapper.selectByYear",command,rowBounds);
		int yearCount = energycostYearList.size();
		command.setYearCount(yearCount);
		
		return energycostYearList;
	}

	@Override
	public EnergycostVO selectLastYearCost() throws SQLException {
		EnergycostVO lastYear=session.selectOne("Energycost-Mapper.selectLastYearCost");
		return lastYear;
	}

	@Override
	public void insertEnergycost(EnergycostVO energycost) throws Exception {
		session.update("Energycost-Mapper.insertEnergycost", energycost);
	}

	@Override
	public int selectEnergycostSeqNext() throws Exception {
		int seqEnergycost = session.selectOne("Energycost-Mapper.selectEnergycostSeqNext");
		return seqEnergycost;
	}
	
}
