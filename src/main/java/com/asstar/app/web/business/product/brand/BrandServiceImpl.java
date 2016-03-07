package com.asstar.app.web.business.product.brand;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asstar.app.common.jpa.JpaServiceImpl;

@Service
public class BrandServiceImpl extends JpaServiceImpl<Brand, Long> implements BrandService {

	@Autowired
	public void setJpaDao(BrandDao brandDao) {
		this.jpaDao = brandDao;
	}

}
