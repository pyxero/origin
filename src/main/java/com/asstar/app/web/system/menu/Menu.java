package com.asstar.app.web.system.menu;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.asstar.app.common.jpa.JpaEntity;
import com.asstar.app.web.system.dict.Dict;

@Entity(name = "s_menu")
public class Menu extends JpaEntity {

	@Column
	public String name;
	@OneToOne
	@JoinColumn(name = "dict_id")
	public Dict dict;
	@OneToOne
	@JoinColumn(name = "menu_id")
	public Menu menu;
	@Column
	public String url;
	@Column
	public Integer sort;
	@Column
	public Boolean display;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Dict getDict() {
		return dict;
	}

	public void setDict(Dict dict) {
		this.dict = dict;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Boolean getDisplay() {
		return display;
	}

	public void setDisplay(Boolean display) {
		this.display = display;
	}

}
