package com.asstar.app.authority.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.asstar.app.common.jpa.JpaServiceImpl;

@Service
public class UserServiceImpl extends JpaServiceImpl<User, Long>implements UserService {

	@Autowired
	private Environment env;

	@Autowired
	public void setJpaDao(UserDao userDao) {
		this.jpaDao = userDao;
	}

	public User save(User user) {
		try {
			if (user.getId() == null) {
				user.setPassword(env.getProperty("default.password"));
			} else {
				user.setPassword(jpaDao.findOne(user.getId()).getPassword());
			}
			return jpaDao.save(user);
		} catch (Exception e) {
			return null;
		}
	}
}
