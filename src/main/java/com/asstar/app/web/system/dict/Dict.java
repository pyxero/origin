package com.asstar.app.web.system.dict;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.asstar.app.common.jpa.JpaEntity;

@Entity(name = "s_dict")
public class Dict extends JpaEntity {

	public Long segment;
	public String type;
	public String name;
	public String shortName;
	public Integer sort;
	public Boolean display;
	public Boolean edit;
	@OneToOne
	@JoinColumn(name = "dict_id")
	public Dict dict;

	public Long getSegment() {
		return segment;
	}

	public void setSegment(Long segment) {
		this.segment = segment;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
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

	public Boolean getEdit() {
		return edit;
	}

	public void setEdit(Boolean edit) {
		this.edit = edit;
	}

	public Dict getDict() {
		return dict;
	}

	public void setDict(Dict dict) {
		this.dict = dict;
	}

}
