package com.asstar.app.authority.role;

import org.springframework.stereotype.Repository;

import com.asstar.app.common.jpa.JpaDao;

@Repository
public interface RoleDao extends JpaDao<Role, Long> {

}
