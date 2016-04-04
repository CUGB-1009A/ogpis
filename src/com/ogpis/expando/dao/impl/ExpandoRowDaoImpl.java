package com.ogpis.expando.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.expando.dao.ExpandoRowDao;
import com.ogpis.expando.entity.ExpandoRow;
import com.ogpis.expando.entity.ExpandoTable;

@Repository
public class ExpandoRowDaoImpl extends BaseDaoImpl<ExpandoRow, String>
		implements ExpandoRowDao {

	@Override
	public ExpandoRow addRow(ExpandoTable table, String classPK) {
		ExpandoRow row = new ExpandoRow();
		row.setTable(table);
		row.setClassPK(classPK);
		this.save(row);
		return row;
	}

	@Override
	public ExpandoRow findByT_C(String tableId, String classPK) {
		String hql = "from ExpandoRow where table.id=? and classPK=?";
		return (ExpandoRow) this.findUnique(hql, tableId, classPK);
	}

	@Override
	public List<ExpandoRow> findByTableId(String tableId) {
		String hql = " from ExpandoRow where table.id=?";
		List<String> params = new ArrayList<String>();
		params.add(tableId);
		return this.queryByHql(hql, params);
	}

	@Override
	protected Class<ExpandoRow> getEntityClass() {
		// TODO Auto-generated method stub
		return ExpandoRow.class;
	}
}
