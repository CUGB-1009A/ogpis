package com.ogpis.service;

import java.util.List;

import com.ogpis.base.service.BaseService;
import com.ogpis.entity.ExpandoTable;

public interface ExpandoTableService  extends BaseService<ExpandoTable, String> {
	public List<ExpandoTable> findByClassName(String className);
	
	public ExpandoTable findByT_C(String tableName,
			String className);
}
