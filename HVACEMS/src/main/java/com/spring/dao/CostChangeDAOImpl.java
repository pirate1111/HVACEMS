package com.spring.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.CostChangeVO;

public class CostChangeDAOImpl implements CostChangeDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void updateCostChange(CostChangeVO costChange) throws SQLException {
		session.update("CostChange-Mapper.updateCostChange",costChange);
	}

	@Override
	public CostChangeVO selectCostChange() throws SQLException {
		CostChangeVO costChange = session.selectOne("CostChange-Mapper.selectCostChange");
		
		return costChange;
	}

}
