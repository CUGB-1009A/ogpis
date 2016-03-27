package com.ogpis.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
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

}
