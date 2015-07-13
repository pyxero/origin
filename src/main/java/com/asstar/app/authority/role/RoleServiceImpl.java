package com.asstar.app.authority.role;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asstar.app.common.jpa.JpaServiceImpl;

@Service
public class RoleServiceImpl extends JpaServiceImpl<Role, Long>implements RoleService {
	@Autowired
	public void setJpaDao(RoleDao roleDao) {
		this.jpaDao = roleDao;
	}
}
