package com.ogpis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.dao.ExpandoColumnDao;
import com.ogpis.dao.ExpandoTableDao;
import com.ogpis.entity.ExpandoTable;
import com.ogpis.service.ExpandoTableService;

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
	public ExpandoTable findByTableName_ClassName(String tableName,
			String className) {
		// TODO Auto-generated method stub
		return getExpandoTableDao().findByTableName_ClassName(tableName,
				className);
	}
}
