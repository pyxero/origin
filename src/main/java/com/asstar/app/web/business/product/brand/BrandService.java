package com.asstar.app.web.business.product.brand;

import org.springframework.data.domain.Page;

import com.asstar.app.common.jpa.JpaService;

public interface BrandService extends JpaService<Brand> {

	public Page<Object[]> queryPage();

}
