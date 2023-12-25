package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchListCommand;
import com.spring.dto.HumidVO;

public class HumidDAOImpl implements HumidDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<HumidVO> selectHumid(SearchListCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<HumidVO> humidList = session.selectList("Humid-Mapper.selectHumid", command, rowBounds);
		
		return humidList;
	}

	@Override
	public List<HumidVO> selectHumidGraph(SearchListCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<HumidVO> humidList = session.selectList("Humid-Mapper.selectHumidGraph", command, rowBounds);
		
		return humidList;
	}
	
	@Override
	public int selectSearchHumidListCount(SearchListCommand command) throws SQLException {
		int count = session.selectOne("Humid-Mapper.selectSearchHumidListCount",command);
		
		return count;
	}
	
	@Override
	public void insertHumid(HumidVO humid) throws SQLException {
		session.update("Humid-Mapper.insertHumid",humid);		
	}

	@Override
	public int selectHumidSeqNext() throws SQLException {
		int seqHumid = session.selectOne("Humid-Mapper.selectHumidSeqNext");
		
		return seqHumid;
	}

}
