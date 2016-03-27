package com.ogpis.dao;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.entity.ClassName;

public interface ClassNameDao extends BaseDao<ClassName, String> {

	public ClassName findByClassName(String className);

}
