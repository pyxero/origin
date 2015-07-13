package com.asstar.app.web.system.menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asstar.app.common.jpa.JpaServiceImpl;

@Service
public class MenuServiceImpl extends JpaServiceImpl<Menu, Long>implements MenuService {
	@Autowired
	public void setJpaDao(MenuDao menuDao) {
		this.jpaDao = menuDao;
	}
}
