package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.ThermometerVO;

public class ThermometerDAOImpl implements ThermometerDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ThermometerVO> selectThermometerSet() throws SQLException {
		List<ThermometerVO> thermometerList = session.selectList("Thermometer-Mapper.selectThermometerSet");
		
		return thermometerList;
	}

	@Override
	public void updateThermometerSetBySectionNum(List<ThermometerVO> thermometerList) throws SQLException {
		for(ThermometerVO thermometer : thermometerList) {
			session.update("Thermometer-Mapper.updateThermometerSetBySectionNum", thermometer);			
		}
	}

	@Override
	public void updateThermometerErrorRange(float thermometerErrorRange) throws SQLException {
		session.update("Thermometer-Mapper.updateThermometerErrorRange", thermometerErrorRange);
	}
	
}
