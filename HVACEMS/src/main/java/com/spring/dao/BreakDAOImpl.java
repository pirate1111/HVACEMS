package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.BreakVO;

public class BreakDAOImpl implements BreakDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<BreakVO> selectBreakRecord() throws SQLException {
		List<BreakVO> breakList = session.selectList("Break-Mapper.selectBreakRecord");
		return breakList;
	}
	
	@Override
	public int selectTypeByBreakNum(String breakRecordNum) throws SQLException {
		int breakNum = session.selectOne("Break-Mapper.selectTypeByBreakNum", breakRecordNum);
		return breakNum;
	}

	@Override
	public String selectHvacBreakNum(String breakRecordNum) throws SQLException {
		String hvacNum = session.selectOne("Break-Mapper.selectHvacBreakNum", breakRecordNum);
		return hvacNum;
	}

	@Override
	public String selectNameByNum(int breakNum) throws SQLException {
		String hvacNum = session.selectOne("Break-Mapper.selectNameByNum", breakNum);
		return hvacNum;
	}

}
