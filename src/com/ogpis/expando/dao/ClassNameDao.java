package com.ogpis.expando.dao;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.expando.entity.ClassName;

public interface ClassNameDao extends BaseDao<ClassName, String> {
	/**
	 * 添加ClassName
	 * 
	 * @param className 类名
	 * @return
	 */
	public ClassName addClassName(String className);
	
	/**
	 * 根据类名查找ClassName对象
	 * @param className 类名
	 * @return
	 */
	public ClassName findByClassName(String className);
}
