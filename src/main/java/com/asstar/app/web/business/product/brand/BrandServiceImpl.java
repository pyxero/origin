package com.asstar.app.web.business.product.brand;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.asstar.app.common.jpa.JpaServiceImpl;
import com.asstar.app.common.jpa.SQLRepository;

@Service
public class BrandServiceImpl extends JpaServiceImpl<Brand, Long> implements BrandService {

	@Autowired
	public void setJpaDao(BrandDao brandDao) {
		this.jpaDao = brandDao;
	}

	@Override
	public Page<Object[]> queryPage() {
		// TODO Auto-generated method stub
		// Criteria<Brand> c = new Criteria<Brand>();
		// c.add(Restrictions.like("no", brand.getNo()));
		SQLRepository s = new SQLRepository();
		return s.search();
	}

}
