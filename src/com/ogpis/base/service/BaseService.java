package com.ogpis.base.service;

import java.io.Serializable;
import java.util.List;

import com.ogpis.entity.User;

public interface BaseService<T, ID extends Serializable> {
	public ID add(T entity);

	public void delete(ID id);

	public T findById(ID id);
	
	public void update(T entity);

}
