package com.ogpis.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.dao.ExpandoColumnDao;
import com.ogpis.entity.ExpandoColumn;

@Repository
public class ExpandoColumnDaoImpl extends BaseDaoImpl<ExpandoColumn, String>
		implements ExpandoColumnDao {

	@Override
	protected Class<ExpandoColumn> getEntityClass() {
		// TODO Auto-generated method stub
		return ExpandoColumn.class;
	}
}
