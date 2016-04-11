package com.ogpis.expando.dao.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.base.entity.BaseEntity;
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

		ExpandoValue value = this.findByT_C_C(table.getId(), column.getId(),
				classPK);
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
	public ExpandoValue findByT_C_C(String tableId, String columnId,
			String classPK) {
		String hql = "from ExpandoValue where table.id=? and column.id=? and classPK=?";
		return (ExpandoValue) this.findUnique(hql, tableId, columnId, classPK);
	}

	@Override
	public List<ExpandoValue> findByT_CPK(String tableId, String classPK) {
		String hql = "from ExpandoValue where table.id=? and classPK=?";

		List<String> params = new ArrayList<String>();
		params.add(tableId);
		params.add(classPK);
		return this.queryByHql(hql, params);
	}

}
