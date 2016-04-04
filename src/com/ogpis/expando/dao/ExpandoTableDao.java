package com.ogpis.expando.dao;

import java.util.List;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.entity.ExpandoTable;

public interface ExpandoTableDao extends BaseDao<ExpandoTable, String> {

	/**
	 * 添加扩展表
	 * @param className 对应的CalssName
	 * @param tableName 表名
	 * @return
	 */
	public ExpandoTable addTable(ClassName className, String tableName);
	
	/**
	 * 根据类名和表名查找扩展表
	 * @param className 类名
	 * @param tableName	表名
	 * @return
	 */
	public ExpandoTable findByC_T(String className, String tableName);
	
	/**
	 * 根据类名查找扩展表的集合
	 * @param className 类名
	 * @return
	 */
	public List<ExpandoTable> findByClassName(String className);

	
	
}
