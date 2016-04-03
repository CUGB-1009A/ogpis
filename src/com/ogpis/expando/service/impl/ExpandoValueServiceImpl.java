package com.ogpis.expando.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.expando.dao.ExpandoValueDao;
import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.entity.ExpandoColumn;
import com.ogpis.expando.entity.ExpandoRow;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.entity.ExpandoValue;
import com.ogpis.expando.service.ExpandoValueService;

@Service
public class ExpandoValueServiceImpl extends
		BaseServiceImpl<ExpandoValue, String> implements ExpandoValueService {

	@Autowired
	protected void setExpandoValueDao(ExpandoValueDao ExpandoValueDao) {
		setBaseDao(ExpandoValueDao);
	}

	protected ExpandoValueDao getExpandoValueDao() {
		return (ExpandoValueDao) this.baseDao;
	}

	@Override
	public ExpandoValue findByC_R(ExpandoColumn column, ExpandoRow row) {
		return getExpandoValueDao().findByC_R(column, row);
	}

	@Override
	public ExpandoValue addValue(ClassName className, ExpandoTable table,
			ExpandoColumn column, String classPK, String data) {
		// TODO Auto-generated method stub
		return getExpandoValueDao().addValue(className, table, column, classPK,
				data);
	}
}
