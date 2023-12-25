package com.spring.exception;

public class NotFoundIdException extends Exception {

	public NotFoundIdException() {
		super("존재하지 않는 아이디입니다.");
	}
}
