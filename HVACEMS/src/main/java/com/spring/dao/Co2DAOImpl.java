package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchListCommand;
import com.spring.dto.Co2VO;

public class Co2DAOImpl implements Co2DAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<Co2VO> selectSearchCo2List(SearchListCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();		
		RowBounds rowBounds = new RowBounds(offset,limit);		
		
		List<Co2VO> co2List = session.selectList("Co2-Mapper.selectSearchCo2List",command,rowBounds);
		
		return co2List;
	}
	
	@Override
	public int selectSearchCo2ListCount(SearchListCommand command) throws SQLException {
		int count = session.selectOne("Co2-Mapper.selectSearchCo2ListCount",command);
		return count;
	}
	
	@Override
	public Co2VO selectCo2Price() throws SQLException {
		Co2VO co2Payoff = session.selectOne("Co2-Mapper.selectCo2Price");
		return co2Payoff;
	}
	
	@Override
	public void insertCo2(Co2VO co2) throws SQLException {
		session.update("Co2-Mapper.insertCo2", co2);
	}

}
