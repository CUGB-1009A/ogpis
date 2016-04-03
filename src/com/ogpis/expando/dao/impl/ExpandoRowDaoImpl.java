package com.ogpis.expando.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.expando.dao.ExpandoRowDao;
import com.ogpis.expando.entity.ExpandoRow;
import com.ogpis.expando.entity.ExpandoTable;

@Repository
public class ExpandoRowDaoImpl extends BaseDaoImpl<ExpandoRow, String>
		implements ExpandoRowDao {

	@Override
	protected Class<ExpandoRow> getEntityClass() {
		// TODO Auto-generated method stub
		return ExpandoRow.class;
	}

	@Override
	public ExpandoRow findByT_C(String tableName, String classPK) {
		String hql = "from ExpandoRow where table.name=? and classPK=?";
		return (ExpandoRow) this.findUnique(hql, tableName, classPK);
	}
}
