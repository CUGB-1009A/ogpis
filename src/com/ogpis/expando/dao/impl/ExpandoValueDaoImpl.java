package com.ogpis.expando.dao.impl;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.expando.dao.ExpandoRowDao;
import com.ogpis.expando.dao.ExpandoValueDao;
import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.entity.ExpandoColumn;
import com.ogpis.expando.entity.ExpandoRow;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.entity.ExpandoValue;

@Repository
public class ExpandoValueDaoImpl extends BaseDaoImpl<ExpandoValue, String>
		implements ExpandoValueDao {

	@Override
	protected Class<ExpandoValue> getEntityClass() {
		// TODO Auto-generated method stub
		return ExpandoValue.class;
	}

	@Autowired
	private ExpandoRowDao expandoRowDao;

	@Override
	public ExpandoValue addValue(ClassName className, ExpandoTable table,
			ExpandoColumn column, String classPK, String data) {

		ExpandoRow row = expandoRowDao.findByT_C(table.getName(), classPK);
		if (row == null) {
			row = new ExpandoRow();
			row.setTable(table);
			row.setClassPK(classPK);
			expandoRowDao.save(row);
		}

		ExpandoValue value = this.findByC_R(column, row);
		if (value == null) {
			value = new ExpandoValue();
			value.setClassName(className);
			value.setTable(table);
			value.setColumn(column);
			value.setRow(row);
			value.setClassPK(classPK);
			this.save(value);
		}
		value.setData(data);
		value.setModifiedTime(new Timestamp(System.currentTimeMillis()));
		this.update(value);
		return value;

	}

	@Override
	public ExpandoValue findByC_R(ExpandoColumn column, ExpandoRow row) {
		String hql = "from ExpandoValue where column.id=? and row.id=?";
		return (ExpandoValue) this.findUnique(hql, column.getId(), row.getId());
	}

}
