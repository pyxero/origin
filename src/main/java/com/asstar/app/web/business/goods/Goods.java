package com.asstar.app.web.business.goods;

import javax.persistence.Entity;
import javax.persistence.OneToOne;

import com.asstar.app.common.jpa.JpaEntity;
import com.asstar.app.web.business.files.Files;

@Entity(name = "b_goods")
public class Goods extends JpaEntity {

	public String name;
	public String info;
	@OneToOne
	public Files img;

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

	public Files getImg() {
		return img;
	}

	public void setImg(Files img) {
		this.img = img;
	}

}
