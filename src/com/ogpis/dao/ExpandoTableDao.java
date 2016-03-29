package com.ogpis.dao;

import java.util.List;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.entity.ExpandoTable;

public interface ExpandoTableDao extends BaseDao<ExpandoTable, String> {

	public List<ExpandoTable> findByClassName(String className);

	public ExpandoTable findByT_C(String tableName,
			String className);
}
