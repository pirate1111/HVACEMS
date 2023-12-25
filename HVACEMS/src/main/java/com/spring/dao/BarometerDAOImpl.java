package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.BarometerVO;
import com.spring.dto.ThermometerVO;

public class BarometerDAOImpl implements BarometerDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<BarometerVO> selectBarometerSet() throws SQLException {
		List<BarometerVO> barometerList = session.selectList("Barometer-Mapper.selectBarometerSet");

		return barometerList;
	}

	@Override
	public void updateBarometerSetBySectionNum(List<BarometerVO> barometerList) throws SQLException {
		for(BarometerVO barometer : barometerList) {
			session.update("Barometer-Mapper.updateBarometerSetBySectionNum", barometer);			
		}
	}

	@Override
	public void updateBarometerErrorRange(float barometerErrorRange) throws SQLException {
		session.update("Barometer-Mapper.updateBarometerErrorRange", barometerErrorRange);
	}
}
