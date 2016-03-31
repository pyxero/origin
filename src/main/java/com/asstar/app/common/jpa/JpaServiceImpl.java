package com.asstar.app.common.jpa;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;

import com.asstar.app.common.entity.PageEntity;
import com.asstar.app.common.util.SqlUtil;

public abstract class JpaServiceImpl<M, ID extends Serializable> implements JpaService<M> {

	public JpaDao<M, Long> jpaDao;

//	public Page<M> page(final M m, PageEntity pEntity, final Object... joins) {
//
//		Specification<M> specification = new Specification<M>() {
//			public Predicate toPredicate(Root<M> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
//				query.where(SqlUtil.where(root, query, cb, m, joins));
//				
//				List<Predicate> predicates = new ArrayList<Predicate>();
////				predicates.add(cb.like("", "%"+"" + "%"));
////				predicates.add(cb.equal("",""));
//				
//				String table = "";
//				table = table.replaceFirst(table.substring(0, 1), table.substring(0, 1)
//						.toLowerCase());
//
//				Join<?, ?> join = root.join(table, JoinType.LEFT);
//				predicates.add(cb.like(
//						join.get("","%" + "" + "%"));
//				predicates.add(cb.equal(join.get("",
//						""));
//				
//				return predicates.toArray(new Predicate[predicates.size()]);
//			}
//		};
//		
//		Pageable pageable = new PageRequest(pEntity.getStart(),
//				pEntity.getCount() == 0 ? Integer.valueOf(20) : pEntity.getCount(),
//				new Sort(Direction.DESC, new String[] { "id" }));
//
//		try {
//			Page<M> page = jpaDao.findAll(specification, pageable);
//			return page;
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//	};

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

	public M save(M m) {
		try {
			return jpaDao.save(m);
		} catch (Exception e) {
			return null;
		}
	}

	public boolean delete(M m) {
		try {
			jpaDao.delete(m);
			return true;
		} catch (Exception e) {
			return true;
		}
	}

}
