package com.ogpis.expando.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.expando.dao.ExpandoColumnDao;
import com.ogpis.expando.entity.ExpandoColumn;
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
	public ExpandoColumn findByT_N(String tableId, String columnName) {
		// TODO Auto-generated method stub
		return getExpandoColumnDao().findByT_N(tableId, columnName);
	}
}
