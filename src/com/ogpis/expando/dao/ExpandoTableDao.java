package com.ogpis.expando.dao;

import java.util.List;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.expando.entity.ExpandoTable;

public interface ExpandoTableDao extends BaseDao<ExpandoTable, String> {

	public List<ExpandoTable> findByClassName(String className);

	public ExpandoTable findByT_C(String tableName,
			String className);
}
