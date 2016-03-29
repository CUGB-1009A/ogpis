package com.ogpis.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.dao.ExpandoRowDao;
import com.ogpis.entity.ExpandoRow;
import com.ogpis.service.ExpandoRowService;

@Service
public class ExpandoRowServiceImpl extends BaseServiceImpl<ExpandoRow, String>
		implements ExpandoRowService {

	@Autowired
	protected void setExpandoRowDao(ExpandoRowDao expandoRowDao) {
		setBaseDao(expandoRowDao);
	}

	protected ExpandoRowDao getExpandoRowDao() {
		return (ExpandoRowDao) this.baseDao;
	}
	
}
