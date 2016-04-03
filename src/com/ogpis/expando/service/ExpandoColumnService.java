package com.ogpis.expando.service;

import com.ogpis.base.service.BaseService;
import com.ogpis.expando.entity.ExpandoColumn;

public interface ExpandoColumnService  extends BaseService<ExpandoColumn, String>{

	public ExpandoColumn findByT_N(String tableId, String columnName);
}
