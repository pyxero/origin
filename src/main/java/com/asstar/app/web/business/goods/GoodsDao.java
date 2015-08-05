package com.asstar.app.web.business.goods;

import org.springframework.stereotype.Repository;

import com.asstar.app.common.jpa.JpaDao;

@Repository
public interface GoodsDao extends JpaDao<Goods, Long> {

}
