package com.ogpis.service;

import com.ogpis.base.service.BaseService;
import com.ogpis.entity.ExpandoColumn;

public interface ExpandoColumnService  extends BaseService<ExpandoColumn, String>{

	public ExpandoColumn findByT_N(String tableId, String columnName);
}
