package com.ogpis.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.dao.ExpandoTableDao;
import com.ogpis.entity.ExpandoTable;

@Repository
public class ExpandoTableDaoImpl extends BaseDaoImpl<ExpandoTable, String>
		implements ExpandoTableDao {

	@Override
	protected Class<ExpandoTable> getEntityClass() {
		return ExpandoTable.class;
	}

	@Override
	public List<ExpandoTable> findByClassName(String className) {
		String hql = "from ExpandoTable where className.className=?";
		List<String> params = new ArrayList<String>();
		params.add(className);
		return this.queryByHql(hql, params);
	}

	@Override
	public ExpandoTable findByT_C(String tableName,
			String className) {
		String hql = "from ExpandoTable where name=? and className.className=?";
		return (ExpandoTable) this.findUnique(hql, tableName, className);
	}
}
