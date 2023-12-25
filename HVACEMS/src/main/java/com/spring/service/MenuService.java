package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.dto.MenuVO;

public interface MenuService {

   Map<String, Object> getMainMenuList()throws SQLException;
   
   List<MenuVO> getSubMenuList(String menuCode)throws SQLException;
   
   MenuVO getMenuByMenuCode(String menuCode)throws SQLException;
   
   MenuVO getMenuByMenuName(String menuName)throws SQLException;
}