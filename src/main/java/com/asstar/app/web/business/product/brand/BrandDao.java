package com.asstar.app.web.business.product.brand;

import org.springframework.stereotype.Repository;

import com.asstar.app.common.jpa.JpaDao;

@Repository
public interface BrandDao extends JpaDao<Brand, Long> {

}
