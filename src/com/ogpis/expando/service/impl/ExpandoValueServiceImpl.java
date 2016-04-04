package com.ogpis.expando.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.expando.dao.ExpandoValueDao;
import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.entity.ExpandoColumn;
import com.ogpis.expando.entity.ExpandoRow;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.entity.ExpandoValue;
import com.ogpis.expando.service.ClassNameService;
import com.ogpis.expando.service.ExpandoColumnService;
import com.ogpis.expando.service.ExpandoRowService;
import com.ogpis.expando.service.ExpandoTableService;
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
	public ExpandoValue addValue(ClassName className, ExpandoTable table,
			ExpandoColumn column, String classPK, String data) {

		return getExpandoValueDao().addValue(className, table, column, classPK,
				data);
	}

	@Override
	public ExpandoValue getValue(String tableId, String columnId, String classPK) {
		return getExpandoValueDao().findByT_C_C(tableId, columnId, classPK);
	}

	@Override
	public List<ExpandoValue> getRowValues(String tableId, String classPK) {
		return getExpandoValueDao().findByT_CPK(tableId, classPK);
	}
}
