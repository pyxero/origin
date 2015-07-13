package com.asstar.app.authority.role;

import java.io.Serializable;

import javax.persistence.Entity;

import com.asstar.app.common.jpa.JpaEntity;

@Entity(name = "s_role")
public class Role extends JpaEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
