package com.asstar.app.web.system.dict;

import org.springframework.stereotype.Repository;

import com.asstar.app.common.jpa.JpaDao;

@Repository
public interface DictDao extends JpaDao<Dict, Long> {

}
