package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchListCommand;
import com.spring.dto.ClasssVO;

public class ClasssDAOImpl implements ClasssDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ClasssVO> selectClasss(SearchListCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<ClasssVO> classsList = session.selectList("Classs-Mapper.selectClasss", command, rowBounds);
		
		return classsList;
	}

	@Override
	public List<ClasssVO> selectClasssGraph(SearchListCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<ClasssVO> classsList = session.selectList("Classs-Mapper.selectClasssGraph", command, rowBounds);
		
		return classsList;
	}
	
	@Override
	public int selectSearchClasssListCount(SearchListCommand command) throws SQLException {
		int count = session.selectOne("Classs-Mapper.selectSearchClasssListCount",command);
		
		return count;
	}
	
	@Override
	public void insertClasss(ClasssVO classs) throws SQLException {
		session.update("Classs-Mapper.insertClasss", classs);
		
	}

	@Override
	public int selectClasssSeqNext() throws SQLException {
		int seqClasss = session.selectOne("Classs-Mapper.selectClasssSeqNext");
		
		return seqClasss;
	}

}
