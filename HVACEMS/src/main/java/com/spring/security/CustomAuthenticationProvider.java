package com.spring.security;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;

import com.spring.dto.AdminVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundIdException;
import com.spring.service.AdminService;

public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	private AdminService adminSerivce;
	public void setAdminService(AdminService adminSerivce) {
		this.adminSerivce = adminSerivce;
	}
	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		String id = (String) auth.getPrincipal();
		String pwd = (String) auth.getCredentials();
		
		try {
			adminSerivce.login(id, pwd);
			
			AdminVO admin = adminSerivce.getAdmin(id);
			
			UserDetails authUser = new User(admin);
			boolean invalidCheck = authUser.isAccountNonExpired()
					&& authUser.isAccountNonLocked()
					&& authUser.isCredentialsNonExpired()
					&& authUser.isEnabled();
			if (invalidCheck) {
				UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(authUser.getUsername(), authUser.getPassword(), authUser.getAuthorities());
				result.setDetails(authUser);
				return result;
			}
			else {
				throw new BadCredentialsException("유효하지 않은 계정입니다.");
			}
			
		} catch (NotFoundIdException | InvalidPasswordException e) {
			throw new BadCredentialsException(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			throw new AuthenticationServiceException("서버 장애로 서비스가 불가합니다.");
		}
		
	}

	@Override
	public boolean supports(Class<?> auth) {
		return auth.equals(UsernamePasswordAuthenticationToken.class);
	}

}
