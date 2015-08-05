package com.asstar.app.web.business.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asstar.app.common.jpa.JpaServiceImpl;

@Service
public class GoodsServiceImpl extends JpaServiceImpl<Goods, Long>implements GoodsService {

	@Autowired
	public void setJpaDao(GoodsDao goodsDao) {
		this.jpaDao = goodsDao;
	}

}
