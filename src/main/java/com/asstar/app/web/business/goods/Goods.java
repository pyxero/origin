package com.asstar.app.web.business.goods;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.asstar.app.common.jpa.JpaEntity;
import com.asstar.app.web.business.files.Files;
import com.asstar.app.web.system.dict.Dict;

@Entity(name = "b_goods")
public class Goods extends JpaEntity {

	public String name;
	public String info;
	public BigDecimal price;
	@OneToOne
	@JoinColumn(name = "show_id")
	public Files show;
	@OneToOne
	@JoinColumn(name = "type_id")
	public Dict dict;
	@OneToOne
	@JoinColumn(name = "active_id")
	public Files active;

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

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Files getShow() {
		return show;
	}

	public void setShow(Files show) {
		this.show = show;
	}

	public Dict getDict() {
		return dict;
	}

	public void setDict(Dict dict) {
		this.dict = dict;
	}

	public Files getActive() {
		return active;
	}

	public void setActive(Files active) {
		this.active = active;
	}

}
