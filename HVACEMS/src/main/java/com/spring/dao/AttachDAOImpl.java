package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.AttachVO;

public class AttachDAOImpl implements AttachDAO{

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<AttachVO> selectAttachesByCheckNum(int checkNum) throws SQLException {
		List<AttachVO> attachList=sqlSession.selectList("Attach-Mapper.selectAttacheByCheckNum",checkNum);
		return attachList;
	}

	@Override
	public AttachVO selectAttachByAttachNum(int attachNum) throws SQLException {
		AttachVO attach=sqlSession.selectOne("Attach-Mapper.selectAttachByAttachNum",attachNum);
		return attach;
	}

	@Override
	public void insertAttach(AttachVO attach) throws SQLException {
		sqlSession.update("Attach-Mapper.insertAttach",attach);
	}

	@Override
	public void deleteAttach(int attachNum) throws SQLException {
		sqlSession.update("Attach-Mapper.deleteAttach",attachNum);		
	}

	@Override
	public void deleteAllAttach(int checkNum) throws SQLException {
		sqlSession.update("Attach-Mapper.deleteAllAttach",checkNum);		
	}
}