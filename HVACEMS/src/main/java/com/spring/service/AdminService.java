package com.spring.service;

import java.sql.SQLException;

import com.spring.dto.AdminVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundIdException;

public interface AdminService {

	void login(String id, String pwd) throws NotFoundIdException, InvalidPasswordException, SQLException;
	AdminVO getAdmin(String id) throws SQLException;
}
