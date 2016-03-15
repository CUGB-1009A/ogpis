package com.ogpis.base.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ogpis.base.dao.CommonDao;
import com.ogpis.base.exception.DAOException;

public abstract class CommonDaoImpl extends HibernateDaoSupport implements
		CommonDao {

	/**
	 * 用于记录日志
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private void setMyHibernateTemplate(HibernateTemplate hibernateTemplate) {
		super.setHibernateTemplate(hibernateTemplate);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List queryByHql(final String hql, final List params) {
		try {
			if (params != null) {
				return this.getHibernateTemplate().find(hql, params.toArray());
			} else {
				return this.getHibernateTemplate().find(hql);
			}
		} catch (Exception e) {
			logger.error("查询数据失败," + e);
			throw new DAOException("查询数据失败," + e.getMessage());
		}
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List queryByHql(final String hql, final List params,
			final int start, final int size) {
		try {
			return (List) this.getHibernateTemplate().executeFind(
					new HibernateCallback() {
						@Override
						public Object doInHibernate(Session session)
								throws HibernateException, SQLException {
							Query query = session.createQuery(hql);
							query.setFirstResult(start);
							query.setMaxResults(size);
							if (params != null) {
								for (int i = 0; i < params.size(); i++) {
									query.setParameter(i, params.get(i));
								}
							}
							return query.list();
						}
					});
		} catch (Exception e) {
			logger.error("查询数据失败," + e);
			throw new DAOException("查询数据失败," + e.getMessage());
		}
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List queryBySql(String sql) {
		try {
			if (sql != null) {
				return this.getHibernateTemplate().getSessionFactory()
						.getCurrentSession().createSQLQuery(sql).list();
			} else {
				return null;
			}
		} catch (Exception e) {
			logger.error("查询数据失败," + e);
			throw new DAOException("查询数据失败," + e.getMessage());
		}
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List queryBySql(final String sql, final List params,
			final Class clazz, final Integer start, final Integer size) {
		try {
			// this.hibernateTemplate.
			return (List) this.getHibernateTemplate().executeFind(
					new HibernateCallback() {
						@Override
						public Object doInHibernate(Session session)
								throws HibernateException, SQLException {
							SQLQuery query = session.createSQLQuery(sql);
							if (clazz != null) {
								query.addEntity(clazz);
							}
							if (start != null && size != null) {
								query.setFirstResult(start);
								query.setMaxResults(size);
							}
							if (params != null) {
								for (int i = 0; i < params.size(); i++) {
									query.setParameter(i, params.get(i));
								}
							}
							return query.list();
						}
					});
		} catch (Exception e) {
			logger.error("查询数据失败," + e);
			e.printStackTrace();
			throw new DAOException("查询数据失败," + e.getMessage());
		}
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List queryBySql(final String sql, final List params,
			final int start, final int size) {
		return queryBySql(sql, params, null, start, size);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List queryBySql(final String sql, final List params) {
		return queryBySql(sql, params, null, null, null);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List queryBySql(final String sql, final List params,
			final Class clazz) {
		return queryBySql(sql, params, clazz, null, null);
	}

	@Override
	public int executeHql(String hql, Object[] params) {
		try {
			return this.getHibernateTemplate().bulkUpdate(hql, params);
		} catch (Exception e) {
			logger.error("执行HQL语句失败," + e);
			throw new DAOException("执行HQL语句失败," + e.getMessage());
		}
	}

}
