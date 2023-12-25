package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.HygrometerVO;
import com.spring.dto.ThermometerVO;

public interface HygrometerDAO {

	List<HygrometerVO> selectHygrometerSet() throws SQLException;
	void updateHygrometerSetBySectionNum(List<HygrometerVO> hygrometerList) throws SQLException;
	void updateHygrometerErrorRange(int hygrometerErrorRange) throws SQLException;

}
