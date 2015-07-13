package com.asstar.app.common.jpa;

import java.util.List;

import org.springframework.data.domain.Page;

import com.asstar.app.common.page.PageEntity;

public interface JpaService<M> {

	public Page<M> page(M m, PageEntity pEntity, Object... objets);

	public List<M> findAll();

	public M findById(Long id);

	public M findByNo(String no);

	public void save(M m);

	public void delete(M m);

}
