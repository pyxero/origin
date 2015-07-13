package com.asstar.app.authority.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asstar.app.common.jpa.JpaServiceImpl;

@Service
public class UserServiceImpl extends JpaServiceImpl<User, Long>implements UserService {

	@Autowired
	public void setJpaDao(UserDao userDao) {
		this.jpaDao = userDao;
	}
}
