package com.spring.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.AdminVO;

public class AdminDAOImpl implements AdminDAO {
	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public AdminVO selectAdminById(String adminId) throws SQLException {
		AdminVO admin = sqlSession.selectOne("Admin-Mapper.selectAdminById", adminId);
		return admin;
	}

}
