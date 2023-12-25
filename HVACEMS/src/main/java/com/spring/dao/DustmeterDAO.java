package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.DustmeterVO;
import com.spring.dto.ThermometerVO;

public interface DustmeterDAO {

	List<DustmeterVO> selectDustmeterSet() throws SQLException;
	void updateDustmeterSetBySectionNum(List<DustmeterVO> dustmeterList) throws SQLException;
	void updateDustmeterErrorRange(int dustmeterErrorRange) throws SQLException;

}
