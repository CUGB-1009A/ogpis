package com.ogpis.base.dao;

import java.util.List;

public interface CommonDao {

	/**
	 * 使用hql进行查询
	 * 
	 * @param hql
	 *            hql语句
	 * @param params
	 *            参数
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List queryByHql(String hql, List params);

	/**
	 * 使用hql进行查询
	 * 
	 * @param hql
	 *            hql语句
	 * @param params
	 *            参数
	 * @param start
	 *            开始的数据位置
	 * @param size
	 *            页容量
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List queryByHql(String hql, List params, int start, int size);

	/**
	 * 使用sql进行查询
	 * 
	 * @param sql
	 *            sql语句
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List queryBySql(String sql);

	/**
	 * 使用sql进行查询
	 * 
	 * @param sql
	 *            sql语句
	 * @param params
	 *            参数
	 * @param clazz
	 *            要查询的类
	 * @param start
	 *            开始的数据位置
	 * @param size
	 *            页容量
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List queryBySql(String sql, List params, Class clazz, Integer start,
			Integer size);

	/**
	 * 使用sql进行查询
	 * 
	 * @param sql
	 *            sql语句
	 * @param params
	 *            参数
	 * @param start
	 *            开始的数据位置
	 * @param size
	 *            页容量
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List queryBySql(String sql, List params, int start, int size);

	/**
	 * 使用sql进行查询
	 * 
	 * @param sql
	 *            sql语句
	 * @param params
	 *            参数
	 * @param clazz
	 *            要查询的类
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List queryBySql(String sql, List params, Class clazz);

	/**
	 * 使用sql进行查询
	 * 
	 * @param sql
	 *            sql语句
	 * @param params
	 *            参数
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List queryBySql(String sql, List params);

	/**
	 * 执行hql
	 * 
	 * @param hql
	 *            hql语句
	 * @param params
	 *            参数
	 * @return
	 */
	public int executeHql(String hql, Object[] params);

}
