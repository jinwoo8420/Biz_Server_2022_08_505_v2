package com.callor.todo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.callor.todo.model.AuthorityVO;
import com.callor.todo.model.UserVO;
import com.callor.todo.persistance.UserDao;
import com.callor.todo.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Autowired
	private PasswordEncoder passEncoder;

	/*
	 * BeanService 클래스로 이동
	 */
//	@Bean
//	public void create_table() {
//		userDao.create_user_table();
//		userDao.create_auth_table();
//	}

	@Override
	public void create_user_table() {

	}

	@Override
	public void create_auth_table() {

	}

	@Override
	public List<AuthorityVO> select_auths(String username) {
		return null;
	}

	@Override
	public List<UserVO> selectAll() {
		return null;
	}

	@Override
	public UserVO findById(String id) {
		return null;
	}

	/*
	 * 회원가입
	 * 
	 * 1. 최초로 회원가입하는 사용자는 ADMIN, USER 권한부여
	 * 2. 이후에 가입된 사용자에게는 USER 권한만 부여
	 * 3. 최초로 회원가입된 사용자의 enabled 칼럼을 true로 지정
	 * 4. 이후에 가입된 사용자의 enabled 칼럼을 false로 지정하여 인증 후 사용 가능하도록 하는 기능 추가
	 */

	@Transactional
	@Override
	public int insert(UserVO vo) {
		List<UserVO> userList = userDao.selectAll();
		List<AuthorityVO> authList = new ArrayList<>();

		// 최초 가입
		if (userList == null || userList.size() < 1) {
			authList.add(AuthorityVO.builder().username(vo.getUsername()).authority("ROLE_ADMIN").build());

			authList.add(AuthorityVO.builder().username(vo.getUsername()).authority("ROLE_USER").build());

			vo.setEnabled(true);
		} else {
			authList.add(AuthorityVO.builder().username(vo.getUsername()).authority("ROLE_USER").build());

			vo.setEnabled(false);
		}

		/* 
		 * 비밀번호 암호화
		 * 
		 * 1. vo에 담긴 비밀번호를 get
		 * 2. passEncoder의 encode() method를 사용하여 암호화
		 * 3. 다시 vo의 password에 set
		 */
		String encPassword = passEncoder.encode(vo.getPassword());
		vo.setPassword(encPassword);

		int ret = userDao.role_insert(authList);
		ret += userDao.insert(vo);

		return ret;
	}

	@Override
	public int update(UserVO vo) {
		return 0;
	}

	@Override
	public int delete(String id) {
		return 0;
	}

	@Override
	public int role_insert(List<AuthorityVO> auths) {
		return 0;
	}

}