package com.asstar.app.web.business.files;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asstar.app.common.jpa.JpaServiceImpl;

@Service
public class FilesServiceImpl extends JpaServiceImpl<Files, Long>implements FilesService {

	@Autowired
	public void setJpaDao(FilesDao filesDao) {
		this.jpaDao = filesDao;
	}

}
