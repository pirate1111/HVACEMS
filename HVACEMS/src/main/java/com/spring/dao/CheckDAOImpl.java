package com.spring.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.CheckSearchListCommand;
import com.spring.dto.CheckVO;

public class CheckDAOImpl implements CheckDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<CheckVO> selectSearchCheck(CheckSearchListCommand command) throws SQLException {
		int offSet = command.getStartRowNum();
		int limit = command.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offSet,limit);

		Map<String, Object> dataParam = new HashMap<String, Object>();		
		dataParam.put("searchType", command.getSearchType());
		dataParam.put("startTargetDate",command.getstartTargetDate());
		dataParam.put("endTargetDate",command.getEndTargetDate());

		List<CheckVO> check = session.selectList("Check-Mapper.selectCheckList", dataParam, rowBounds);
		return check;
	}

	@Override
	public int selectSearchCheckCount(CheckSearchListCommand command) throws SQLException {
		int count = session.selectOne("Check-Mapper.selectCheckListCount",command);
		return count;
	}

	@Override
	public CheckVO selectCheckByCheckNum(int checkNum) throws SQLException {
		CheckVO CheckList = session.selectOne("Check-Mapper.selectCheckByCheckNum",checkNum);
		return CheckList;
	}

	@Override
	public void insertCheck(CheckVO check) throws SQLException {
		session.insert("Check-Mapper.insertCheck", check);
	}

	@Override
	public void updateCheck(CheckVO check) throws SQLException {
		session.update("Check-Mapper.updateCheck", check);
	}

	@Override
	public void deleteCheck(int checkNum) throws SQLException {
		session.delete("Check-Mapper.deleteCheck", checkNum);
	}
	
	@Override
	public void increaseCheckCnt(int checkNum) throws SQLException {
		session.update("Check-Mapper.increaseCheckCnt", checkNum);
	}

	@Override
	public int selectCheckSeqNext() throws SQLException {
		int CheckList_Seq = session.selectOne("Check-Mapper.selectCheckSeqNext");
		return CheckList_Seq;
	}

}