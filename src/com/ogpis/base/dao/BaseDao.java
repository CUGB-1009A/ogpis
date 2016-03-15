package com.ogpis.base.dao;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T, ID extends Serializable> extends CommonDao {

	public T findById(ID id);

	public ID save(T entity);

	public void delete(T entity);

	public void delete(ID id);

	public void delete(Class<T> clazz, ID id);

	public void update(T entity);

	void saveEntities(List<T> entities);

	List<T> queryEntityByExample(T entity);

	List<T> queryEntityByExample(T entity, int start, int size);

}
