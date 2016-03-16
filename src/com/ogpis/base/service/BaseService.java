package com.ogpis.base.service;

import java.io.Serializable;
import java.util.List;

import com.ogpis.entity.User;

/**
 * Service基类，定义Service的基本方法
 * @author Danny
 *
 * @param <T>
 * @param <ID>
 */
public interface BaseService<T, ID extends Serializable> {
	
	/**
	 * 添加实体
	 * @param entity 实体
	 * @return
	 */
	public ID add(T entity);

	/**
	 * 删除实体
	 * @param id 要删除的实体ID
	 */
	public void delete(ID id);

	/**
	 * 根据ID查找实体
	 * @param id
	 * @return
	 */
	public T findById(ID id);
	
	/**
	 * 更新实体
	 * @param entity 要更新的实体
	 */
	public void update(T entity);

}
