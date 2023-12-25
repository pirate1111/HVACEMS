package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.OnoffRecordVO;

public interface OnoffRecordDAO {

	List<OnoffRecordVO> selectOnoffYnA() throws SQLException;
	List<OnoffRecordVO> selectOnoffYnB() throws SQLException;
	List<OnoffRecordVO> selectOnoffYnC() throws SQLException;
	List<OnoffRecordVO> selectOnoffYnD() throws SQLException;
	List<OnoffRecordVO> selectOnoffYnE() throws SQLException;
	List<OnoffRecordVO> selectOnoffYnF() throws SQLException;
	List<OnoffRecordVO> selectOnoffYnG() throws SQLException;
	List<OnoffRecordVO> selectOnoffYnH() throws SQLException;
	List<OnoffRecordVO> selectOnoffYnI() throws SQLException;
	List<OnoffRecordVO> selectOnoffYnJ() throws SQLException;
	
	void insertOnoffRecord(List<OnoffRecordVO> onoffRecordList) throws SQLException;
	int selectOnoffSeqNext() throws SQLException;

}
