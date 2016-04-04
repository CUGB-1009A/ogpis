package com.ogpis.expando.dao.impl;

import java.util.ArrayList;
import java.util.List;

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
		return ExpandoColumn.class;
	}

	@Override
	public ExpandoColumn addColumn(ExpandoTable table, String name,
			String type, String defalutData) {
		ExpandoColumn column = new ExpandoColumn();
		column.setTable(table);
		column.setName(name);
		column.setType(type);
		column.setDefalutData(defalutData);
		this.save(column);
		return column;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ExpandoColumn> findByTableId(String tableId) {
		String hql = " from ExpandoColumn where table.id=?";
		List<String> params = new ArrayList<String>();
		params.add(tableId);
		return this.queryByHql(hql, params);
	}

	@Override
	public ExpandoColumn findByT_N(String tableId, String columnName) {
		String hql = " from ExpandoColumn where table.id=? and name=?";
		return (ExpandoColumn) this.findUnique(hql, tableId, columnName);
	}

}
