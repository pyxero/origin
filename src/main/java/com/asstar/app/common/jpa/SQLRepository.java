package com.asstar.app.common.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

public class SQLRepository {
	@PersistenceContext
	private EntityManager em;

	public Page<Object[]> search() {
		String hql = "select ＊ from Brand";//where 1=1 and o.uuid=:uuid
		Query q = em.createQuery(hql);
		//q.setParameter("uuid", "");
		q.setFirstResult(0);
		q.setMaxResults(10);
		Page<Object[]> page = new PageImpl<Object[]>(q.getResultList(), new PageRequest(0, 1), 3);
		return page;
	}
}
