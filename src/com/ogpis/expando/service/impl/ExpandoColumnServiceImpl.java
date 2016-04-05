package com.ogpis.expando.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.expando.dao.ExpandoColumnDao;
import com.ogpis.expando.entity.ExpandoColumn;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.service.ExpandoColumnService;
import com.ogpis.expando.service.ExpandoTableService;

@Service
public class ExpandoColumnServiceImpl extends
		BaseServiceImpl<ExpandoColumn, String> implements ExpandoColumnService {

	@Override
	public ExpandoColumn addColumn(ExpandoTable table, String name,
			String type, String defalutData) {
		return getExpandoColumnDao().addColumn(table, name, type, defalutData);
	}

	@Override
	public List<ExpandoColumn> getColumns(String tableId) {
		return getExpandoColumnDao().findByTableId(tableId);
	}

	@Override
	public ExpandoColumn getColumn(String tableId, String columnName) {
		return getExpandoColumnDao().findByT_N(tableId, columnName);
	}

	@Override
	public List<ExpandoColumn> getDefaultTableColumns(String className) {
		ExpandoTable table = expandoTableService.getDefaultTable(className);
		return getExpandoColumnDao().findByTableId(table.getId());
	}

	@Resource
	private ExpandoTableService expandoTableService;

	@Autowired
	protected void setExpandoColumnDao(ExpandoColumnDao expandoColumnDao) {
		setBaseDao(expandoColumnDao);
	}

	protected ExpandoColumnDao getExpandoColumnDao() {
		return (ExpandoColumnDao) this.baseDao;
	}

}
