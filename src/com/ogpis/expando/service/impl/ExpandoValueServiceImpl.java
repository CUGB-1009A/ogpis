package com.ogpis.expando.service.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.expando.dao.ExpandoRowDao;
import com.ogpis.expando.dao.ExpandoValueDao;
import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.entity.ExpandoColumn;
import com.ogpis.expando.entity.ExpandoRow;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.entity.ExpandoValue;
import com.ogpis.expando.service.ExpandoValueService;

@Transactional
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

	@Transactional(readOnly = false)
	@Override
	public void addValues(ClassName className, ExpandoTable table,
			List<ExpandoColumn> columns, String classPK,
			Map<String, String> data) {

		ExpandoRow row = expandoRowDao.findByT_C(table.getId(), classPK);
		if (row == null) {
			row = new ExpandoRow();
			row.setTable(table);
			row.setClassPK(classPK);
			expandoRowDao.save(row);
		}

		for (ExpandoColumn column : columns) {
			ExpandoValue value = this.getExpandoValueDao().findByT_C_C(
					table.getId(), column.getId(), classPK);
			if (value == null) {
				value = new ExpandoValue();
				value.setClassName(className);
				value.setTable(table);
				value.setColumn(column);
				value.setRow(row);
				value.setClassPK(classPK);
				this.getExpandoValueDao().save(value);
			}
			value.setData(data.get(column.getName()));
			value.setModifiedTime(new Timestamp(System.currentTimeMillis()));
			this.getExpandoValueDao().update(value);
		}
	}

	@Resource
	private ExpandoRowDao expandoRowDao;

	@Override
	public ExpandoValue getValue(String tableId, String columnId, String classPK) {
		return getExpandoValueDao().findByT_C_C(tableId, columnId, classPK);
	}

	@Override
	public List<ExpandoValue> getRowValues(String tableId, String classPK) {
		return getExpandoValueDao().findByT_CPK(tableId, classPK);
	}
}
