package com.ogpis.expando.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.expando.dao.ExpandoColumnDao;
import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.entity.ExpandoColumn;
import com.ogpis.expando.entity.ExpandoTable;

@Repository
public class ExpandoColumnDaoImpl extends BaseDaoImpl<ExpandoColumn, String>
		implements ExpandoColumnDao {

	@Override
	protected Class<ExpandoColumn> getEntityClass() {
		// TODO Auto-generated method stub
		return ExpandoColumn.class;
	}
	
	@Override
	public ExpandoColumn findByT_N(String tableId, String columnName) {
		String hql = " from ExpandoColumn where table.id=? and name=?";
		return (ExpandoColumn) this.findUnique(hql, tableId, columnName);
	}
}
