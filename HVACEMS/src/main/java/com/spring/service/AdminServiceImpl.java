package com.spring.service;

import java.sql.SQLException;

import com.spring.dao.AdminDAO;
import com.spring.dto.AdminVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundIdException;

public class AdminServiceImpl implements AdminService {

	private AdminDAO adminDAO;
	
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}
	
	@Override
	public void login(String id, String pwd) throws NotFoundIdException, InvalidPasswordException, SQLException {
		AdminVO admin = adminDAO.selectAdminById(id);
		if (admin == null) throw new NotFoundIdException();
		if (!pwd.equals(admin.getAdminPwd())) throw new InvalidPasswordException();
	}

	@Override
	public AdminVO getAdmin(String id) throws SQLException {
		AdminVO admin = adminDAO.selectAdminById(id);
		return admin;
	}

}
