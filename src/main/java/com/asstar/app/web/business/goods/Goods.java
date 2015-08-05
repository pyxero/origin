package com.asstar.app.web.business.goods;

import javax.persistence.Entity;

import com.asstar.app.common.jpa.JpaEntity;

@Entity(name = "b_goods")
public class Goods extends JpaEntity {

	public String name;
	public String info;
	public String img;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}
