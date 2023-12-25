package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.dao.MenuDAO;
import com.spring.dao.SubmenuDAO;
import com.spring.dto.MenuVO;
import com.spring.dto.SubmenuVO;

public class MenuServiceImpl implements MenuService{

   private MenuDAO menuDAO;
   public void setMenuDAO(MenuDAO menuDAO) {
      this.menuDAO = menuDAO;
   }
   private SubmenuDAO submenuDAO;
   public void setSubmenuDAO(SubmenuDAO submenuDAO) {
	   this.submenuDAO = submenuDAO;
   }
   
   private void addSubmenuList(MenuVO menu) throws SQLException{
	   if(menu == null)
		   return;
	   
	   String menuCode = menu.getMenuCode();
	   List<SubmenuVO> submenuList = submenuDAO.selectSubMenu(menuCode);
	   
	   menu.setSubmenuList(submenuList);
   }
   
   @Override
   public Map<String, Object> getMainMenuList() throws SQLException {
	   
      List<MenuVO> menuList = menuDAO.selectMainMenu();
      
      if(menuList != null)
    	  for(MenuVO menu : menuList)
    		  addSubmenuList(menu);
      
      Map<String, Object> dataMap = new HashMap<String, Object>();
      dataMap.put("menuList", menuList);
      
      return dataMap;
   }

   @Override
   public List<MenuVO> getSubMenuList(String menuCode) throws SQLException {
      List<MenuVO> menuList = menuDAO.selectSubMenu(menuCode);
      return menuList;
   }

   @Override
   public MenuVO getMenuByMenuCode(String menuCode) throws SQLException {
      MenuVO menu = menuDAO.selectMenuByMenuCode(menuCode);
      return menu;
   }

   @Override
   public MenuVO getMenuByMenuName(String menuName) throws SQLException {
      MenuVO menu = menuDAO.selectMenuByMenuName(menuName);
      return menu;
   }

}