package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchListCommand;
import com.spring.dto.HvacelecVO;

public class HvacelecDAOImpl implements HvacelecDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<HvacelecVO> selectHvacelec(SearchListCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<HvacelecVO> hvacelecList = session.selectList("Hvacelec-Mapper.selectHvacelec", command, rowBounds);
		
		return hvacelecList;
	}

	@Override
	public List<HvacelecVO> selectHvacelecGraph(SearchListCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<HvacelecVO> hvacelecList = session.selectList("Hvacelec-Mapper.selectHvacelecGraph", command, rowBounds);
		
		return hvacelecList;
	}
	
	@Override
	public int selectSearchHvacelecListCount(SearchListCommand command) throws SQLException {
		int count = session.selectOne("Hvacelec-Mapper.selectSearchHvacelecListCount",command);
		
		return count;
	}

	@Override
	public void insertHvacelec(HvacelecVO hvacelec) throws SQLException {
		session.update("Hvacelec-Mapper.insertHvacelec", hvacelec);
	}

	@Override
	public int selectHvacelecSeqNext() throws SQLException {
		int seqHvacelec = session.selectOne("Hvacelec-Mapper.selectHvacelecSeqNext"); 
		return seqHvacelec;
	}

}
