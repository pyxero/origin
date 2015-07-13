package com.asstar.app.common.jpa;

import java.io.Serializable;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;

import com.asstar.app.common.page.PageEntity;
import com.asstar.app.common.util.SqlUtil;

public abstract class JpaServiceImpl<M, ID extends Serializable> implements JpaService<M> {

	public JpaDao<M, Long> jpaDao;

	public Page<M> page(final M m, PageEntity pEntity, final Object... joins) {

		// 查询条件
		Specification<M> specification = new Specification<M>() {
			public Predicate toPredicate(Root<M> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				query.where(SqlUtil.where(root, query, cb, m, joins));
				return null;
			}
		};
		// 分页
		Pageable pageable = new PageRequest(pEntity.getStart(),
				pEntity.getCount() == 0 ? Integer.valueOf(20) : pEntity.getCount(),
				new Sort(Direction.DESC, new String[] { "id" }));

		try {
			Page<M> page = jpaDao.findAll(specification, pageable);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	};

	public List<M> findAll() {
		return jpaDao.findAll();
	}

	public M findById(Long id) {
		try {
			return jpaDao.findOne(id);
		} catch (Exception e) {
			return null;
		}
	}

	public M findByNo(String no) {
		try {
			return jpaDao.findByNo(no);
		} catch (Exception e) {
			return null;
		}
	}

	public void save(M m) {
		jpaDao.save(m);
	}

	public void delete(M m) {
		jpaDao.delete(m);
	}

}
