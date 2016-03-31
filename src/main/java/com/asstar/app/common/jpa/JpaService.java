package com.asstar.app.common.jpa;

import java.util.List;

import org.springframework.data.domain.Page;

import com.asstar.app.common.entity.PageEntity;

public interface JpaService<M> {

//	public Page<M> page(M m, PageEntity pEntity, Object... objets);

	public List<M> findAll();

	public M findById(Long id);

	public M findByNo(String no);

	public M save(M m);

	public boolean delete(M m);

}
