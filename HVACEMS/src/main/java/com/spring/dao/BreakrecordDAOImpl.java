package com.spring.dao;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.BreakrecordVO;

public class BreakrecordDAOImpl implements BreakrecordDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public void insertBreakrecord(BreakrecordVO breakrecord) throws Exception {
		session.update("Breakrecord-Mapper.insertBreakrecord", breakrecord);
	}

}
