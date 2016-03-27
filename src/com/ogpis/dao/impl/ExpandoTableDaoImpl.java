package com.ogpis.dao.impl;

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
}
