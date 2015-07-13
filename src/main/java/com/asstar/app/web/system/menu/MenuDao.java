package com.asstar.app.web.system.menu;

import org.springframework.stereotype.Repository;

import com.asstar.app.common.jpa.JpaDao;

@Repository
public interface MenuDao extends JpaDao<Menu, Long> {

}
