package com.asstar.app.common.jpa;

import java.io.Serializable;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface JpaDao<M, ID extends Serializable> extends JpaRepository<M, ID>, JpaSpecificationExecutor<M> {

	public M findByNo(String no);

	Page<M> findAll(Specification<M> specification, Pageable pageable);
}
