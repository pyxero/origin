package com.asstar.app.web.business.product.brand;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.asstar.app.common.jpa.JpaEntity;

@Entity(name = "b_brand")
public class Brand extends JpaEntity {

	public String name;
	public String logo;
	public String descript;
	public Integer sort;

}
