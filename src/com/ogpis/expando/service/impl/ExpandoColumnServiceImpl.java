package com.ogpis.expando.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.expando.dao.ExpandoColumnDao;
import com.ogpis.expando.entity.ExpandoColumn;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.service.ExpandoColumnService;

@Service
public class ExpandoColumnServiceImpl extends
		BaseServiceImpl<ExpandoColumn, String> implements ExpandoColumnService {

	@Autowired
	protected void setExpandoColumnDao(ExpandoColumnDao expandoColumnDao) {
		setBaseDao(expandoColumnDao);
	}

	protected ExpandoColumnDao getExpandoColumnDao() {
		return (ExpandoColumnDao) this.baseDao;
	}

	@Override
	public List<ExpandoColumn> getColumns(String tableId) {
		// TODO Auto-generated method stub
		return getExpandoColumnDao().findByTableId(tableId);
	}

	@Override
	public ExpandoColumn getColumn(String tableId, String columnName) {
		// TODO Auto-generated method stub
		return getExpandoColumnDao().findByT_N(tableId, columnName);
	}

	@Override
	public ExpandoColumn addColumn(ExpandoTable table, String name,
			String type, String defalutData) {
		return getExpandoColumnDao().addColumn(table, name, type, defalutData);
	}
}
