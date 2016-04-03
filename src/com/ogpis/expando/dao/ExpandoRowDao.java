package com.ogpis.expando.dao;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.expando.entity.ExpandoRow;

public interface ExpandoRowDao extends BaseDao<ExpandoRow, String> {

	public ExpandoRow findByT_C(String tableName, String classPK);

}
