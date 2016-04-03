package com.ogpis.expando.dao;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.expando.entity.ClassName;

public interface ClassNameDao extends BaseDao<ClassName, String> {

	public ClassName findByClassName(String className);

	public ClassName add(Class clazz);

}
