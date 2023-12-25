package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.DustmeterVO;
import com.spring.dto.ThermometerVO;

public class DustmeterDAOImpl implements DustmeterDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<DustmeterVO> selectDustmeterSet() throws SQLException {
		List<DustmeterVO>  dustmeterList = session.selectList("Dustmeter-Mapper.selectDustmeterSet");
		
		return dustmeterList;
	}

	@Override
	public void updateDustmeterSetBySectionNum(List<DustmeterVO> dustmeterList) throws SQLException {
		for(DustmeterVO dustmeter : dustmeterList) {
			session.update("Dustmeter-Mapper.updateDustmeterSetBySectionNum", dustmeter);			
		}
	}

	@Override
	public void updateDustmeterErrorRange(int dustmeterErrorRange) throws SQLException {
		session.update("Dustmeter-Mapper.updateDustmeterErrorRange", dustmeterErrorRange);
	}
	
}
