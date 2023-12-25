package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.MenuVO;

public class MenuDAOImpl implements MenuDAO {
   
   private SqlSession session;
   public void setSqlSession(SqlSession session) {
      this.session = session;
   }
   
   @Override
   public List<MenuVO> selectMainMenu() throws SQLException {
      List<MenuVO> menuList = session.selectList("Menu-Mapper.selectMainMenu");
      return menuList;
   }

   @Override
   public List<MenuVO> selectSubMenu(String menuCode) throws SQLException {
      List<MenuVO> menuList = session.selectList("Menu-Mapper.selectSubMenu",menuCode);
      return menuList;
   }

   @Override
   public MenuVO selectMenuByMenuCode(String menuCode) throws SQLException {
      MenuVO menu = session.selectOne("Menu-Mapper.selectMenuByMenuCode",menuCode);
      return menu;
   }
   
   @Override
   public MenuVO selectMenuByMenuName(String menuName) throws SQLException {
      MenuVO menu = session.selectOne("Menu-Mapper.selectMenuByMenuName",menuName);
      return menu;
   }
}