package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.MenuVO;

public interface MenuDAO {

   List<MenuVO> selectMainMenu() throws SQLException;

   List<MenuVO> selectSubMenu(String menuCode) throws SQLException;

   MenuVO selectMenuByMenuCode(String menuCode) throws SQLException;

   MenuVO selectMenuByMenuName(String menuName) throws SQLException;
}