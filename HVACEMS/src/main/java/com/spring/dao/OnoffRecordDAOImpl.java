package com.spring.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.OnoffRecordVO;

public class OnoffRecordDAOImpl implements OnoffRecordDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<OnoffRecordVO> selectOnoffYnA() throws SQLException {
		List<OnoffRecordVO> onoffRecordList = session.selectList("OnoffRecord-Mapper.selectOnoffYnA");
		return onoffRecordList;
	}

	@Override
	public List<OnoffRecordVO> selectOnoffYnB() throws SQLException {
		List<OnoffRecordVO> onoffRecordList = session.selectList("OnoffRecord-Mapper.selectOnoffYnB");
		return onoffRecordList;
	}

	@Override
	public List<OnoffRecordVO> selectOnoffYnC() throws SQLException {
		List<OnoffRecordVO> onoffRecordList = session.selectList("OnoffRecord-Mapper.selectOnoffYnC");
		return onoffRecordList;
	}

	@Override
	public List<OnoffRecordVO> selectOnoffYnD() throws SQLException {
		List<OnoffRecordVO> onoffRecordList = session.selectList("OnoffRecord-Mapper.selectOnoffYnD");
		return onoffRecordList;
	}

	@Override
	public List<OnoffRecordVO> selectOnoffYnE() throws SQLException {
		List<OnoffRecordVO> onoffRecordList = session.selectList("OnoffRecord-Mapper.selectOnoffYnE");
		return onoffRecordList;
	}

	@Override
	public List<OnoffRecordVO> selectOnoffYnF() throws SQLException {
		List<OnoffRecordVO> onoffRecordList = session.selectList("OnoffRecord-Mapper.selectOnoffYnF");
		return onoffRecordList;
	}

	@Override
	public List<OnoffRecordVO> selectOnoffYnG() throws SQLException {
		List<OnoffRecordVO> onoffRecordList = session.selectList("OnoffRecord-Mapper.selectOnoffYnG");
		return onoffRecordList;
	}

	@Override
	public List<OnoffRecordVO> selectOnoffYnH() throws SQLException {
		List<OnoffRecordVO> onoffRecordList = session.selectList("OnoffRecord-Mapper.selectOnoffYnH");
		return onoffRecordList;
	}

	@Override
	public List<OnoffRecordVO> selectOnoffYnI() throws SQLException {
		List<OnoffRecordVO> onoffRecordList = session.selectList("OnoffRecord-Mapper.selectOnoffYnI");
		return onoffRecordList;
	}

	@Override
	public List<OnoffRecordVO> selectOnoffYnJ() throws SQLException {
		List<OnoffRecordVO> onoffRecordList = session.selectList("OnoffRecord-Mapper.selectOnoffYnJ");
		return onoffRecordList;
	}

	@Override
	public void insertOnoffRecord(List<OnoffRecordVO> onoffRecordList) throws SQLException {
		
		for(OnoffRecordVO onoffRecord : onoffRecordList) {
			session.insert("OnoffRecord-Mapper.insertOnoff", onoffRecord);
		}
//		Map<String, Integer> dataMap = onoffRecord.getOnoff();
//		
//		Set<String> keys = dataMap.keySet();
//		
//		for(String key: keys) {
//			Map<String,Object> data = new HashMap<String,Object>();
//			data.put("hvacNum",key);
//			data.put("onoffYn",dataMap.get(key));
//			session.insert("OnoffRecord-Mapper.insertOnoff", data);
//		}
	}

	@Override
	public int selectOnoffSeqNext() throws SQLException {
		int seqOnoffRecord = session.selectOne("OnoffRecord-Mapper.selectOnoffSeqNext");		
		
		return seqOnoffRecord;
	}
}

