package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.SubmenuVO;

public class SubmenuDAOImpl implements SubmenuDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<SubmenuVO> selectSubMenu(String menuCode) throws SQLException {
		List<SubmenuVO> submenuList = session.selectList("Menu-Mapper.selectSubMenu", menuCode);
		
		return submenuList;
	}

}
