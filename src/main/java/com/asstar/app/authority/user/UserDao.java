package com.asstar.app.authority.user;

import org.springframework.stereotype.Repository;

import com.asstar.app.common.jpa.JpaDao;

@Repository
public interface UserDao extends JpaDao<User, Long> {

}
