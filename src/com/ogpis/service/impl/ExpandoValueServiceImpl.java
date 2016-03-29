package com.ogpis.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.dao.ExpandoValueDao;
import com.ogpis.entity.ClassName;
import com.ogpis.entity.ExpandoColumn;
import com.ogpis.entity.ExpandoRow;
import com.ogpis.entity.ExpandoTable;
import com.ogpis.entity.ExpandoValue;
import com.ogpis.service.ExpandoValueService;

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
