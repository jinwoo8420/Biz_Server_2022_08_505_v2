package com.callor.todo.service.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.callor.todo.persistance.UserDao;

/*
 * 프로젝트가 시작 될 때 자동으로 실행 할 method, bean 정의
 */

@Service
public class BeanService {

	@Autowired
	private UserDao userDao;

	@Bean
	public void create_table() {
		userDao.create_user_table();
		userDao.create_auth_table();
	}

	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
