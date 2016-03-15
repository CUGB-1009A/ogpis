package com.ogpis.base.dao.impl;

import java.io.Serializable;
import java.util.List;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.base.exception.DAOException;

public abstract class BaseDaoImpl<T, ID extends Serializable> extends
		CommonDaoImpl  implements BaseDao<T, ID>{

	@SuppressWarnings("unchecked")
	@Override
	public ID save(T entity) {
		return (ID) super.getHibernateTemplate().save(entity);
	}
	@Override
	public void saveEntities(List<T> entities) {
		if (entities == null) {
			throw new DAOException("请指定要添加的数据。");
		}
		try {
			for(T entity :entities){
				super.getHibernateTemplate().save(entity);
			}
			//this.hibernateTemplate.flush();
		} catch (Exception e) {
			logger.error("添加数据失败," + e);
			throw new DAOException("添加数据失败," + e.getMessage());
		}
	}

	@Override
	public void delete(T entity) {
		try {
			this.getHibernateTemplate().delete(entity);
		} catch (Exception e) {
			super.logger.error("删除数据失败," + e);
			throw new DAOException("删除数据失败," + e.getMessage());
		}
	}

	@Override
	public void delete(ID id) {
		delete(getEntityClass(), id);
	}

	@Override
	public void delete(Class<T> clazz, ID id) {
		try {
			Object o = this.getHibernateTemplate().get(clazz, id);
			this.getHibernateTemplate().delete(o);
		} catch (Exception e) {
			super.logger.error("删除数据失败," + e);
			throw new DAOException("删除数据失败," + e.getMessage());
		}
	}

	@Override
	public void update(T entity) {
		try {
			this.getHibernateTemplate().update(entity);
		} catch (Exception e) {
			super.logger.error("更新数据失败," + e);
			throw new DAOException("更新数据失败," + e.getMessage());
		}
	}
	
	@Override
	public T findById(ID id) {
		try {
			return this.getHibernateTemplate().get(getEntityClass(), id);
		} catch (Exception e) {
			super.logger.error("获取数据失败," + e);
			throw new DAOException("获取数据失败," + e.getMessage());
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> queryEntityByExample(T entity) {
		try {
			return (List<T>) this.getHibernateTemplate().findByExample(entity);
		} catch (Exception e) {
			logger.error("获取多条数据失败," + e);
			throw new DAOException("获取多条数据失败," + e.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> queryEntityByExample(T entity, int start, int size) {
		try {
			return (List<T>) this.getHibernateTemplate().findByExample(entity,
					start, size);
		} catch (Exception e) {
			logger.error("获取多条数据失败," + e);
			throw new DAOException("获取多条数据失败," + e.getMessage());
		}
	}
	
	
	
	/**
	 * 获得Dao对于的实体类
	 * 
	 * @return
	 */
	abstract protected Class<T> getEntityClass();
}
