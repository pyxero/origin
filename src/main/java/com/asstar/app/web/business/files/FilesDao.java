package com.asstar.app.web.business.files;

import org.springframework.stereotype.Repository;

import com.asstar.app.common.jpa.JpaDao;

@Repository
public interface FilesDao extends JpaDao<Files, Long> {

}
