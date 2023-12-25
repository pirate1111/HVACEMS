package com.spring.dao;

import java.sql.SQLException;

import com.spring.dto.AdminVO;

public interface AdminDAO {

	AdminVO selectAdminById(String adminId) throws SQLException;
	
}
