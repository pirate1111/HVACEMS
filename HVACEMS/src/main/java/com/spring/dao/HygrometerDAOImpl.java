package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.HygrometerVO;
import com.spring.dto.ThermometerVO;

public class HygrometerDAOImpl implements HygrometerDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<HygrometerVO> selectHygrometerSet() throws SQLException {
		List<HygrometerVO> hygrometerList = session.selectList("Hygrometer-Mapper.selectHygrometerSet");
		
		return hygrometerList;
	}

	@Override
	public void updateHygrometerSetBySectionNum(List<HygrometerVO> hygrometerList) throws SQLException {
		for(HygrometerVO hygrometer : hygrometerList) {
			session.update("Hygrometer-Mapper.updateHygrometerSetBySectionNum", hygrometer);			
		}
	}

	@Override
	public void updateHygrometerErrorRange(int hygrometerErrorRange) throws SQLException {
		session.update("Hygrometer-Mapper.updateHygrometerErrorRange", hygrometerErrorRange);
	}

}
