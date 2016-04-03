package com.ogpis.expando.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.expando.dao.ExpandoColumnDao;
import com.ogpis.expando.dao.ExpandoTableDao;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.service.ExpandoTableService;

@Service
public class ExpandoTableServiceImpl extends
		BaseServiceImpl<ExpandoTable, String> implements ExpandoTableService {

	@Autowired
	protected void setExpandoTableDao(ExpandoTableDao expandoTableDao) {
		setBaseDao(expandoTableDao);
	}

	protected ExpandoTableDao getExpandoTableDao() {
		return (ExpandoTableDao) this.baseDao;
	}

	@Override
	public List<ExpandoTable> findByClassName(String className) {
		// TODO Auto-generated method stub
		return getExpandoTableDao().findByClassName(className);
	}

	@Override
	public ExpandoTable findByT_C(String tableName,
			String className) {
		// TODO Auto-generated method stub
		return getExpandoTableDao().findByT_C(tableName,
				className);
	}
}
