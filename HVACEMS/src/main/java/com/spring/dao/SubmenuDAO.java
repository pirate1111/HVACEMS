package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.SubmenuVO;

public interface SubmenuDAO {

	List<SubmenuVO> selectSubMenu(String menuCode) throws SQLException;
}
