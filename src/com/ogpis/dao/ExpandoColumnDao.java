package com.ogpis.dao;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.entity.ExpandoColumn;

public interface ExpandoColumnDao extends BaseDao<ExpandoColumn, String> {

	public ExpandoColumn findByT_N(String tableId, String columnName);

}
