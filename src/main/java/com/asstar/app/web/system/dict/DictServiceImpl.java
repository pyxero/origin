package com.asstar.app.web.system.dict;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asstar.app.common.jpa.JpaServiceImpl;

@Service
public class DictServiceImpl extends JpaServiceImpl<Dict, Long>implements DictService {
	@Autowired
	public void setJpaDao(DictDao dictDao) {
		this.jpaDao = dictDao;
	}
}
