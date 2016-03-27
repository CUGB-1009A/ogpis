package com.ogpis.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.dao.ExpandoColumnDao;
import com.ogpis.entity.ExpandoColumn;
import com.ogpis.service.ExpandoColumnService;

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
}
