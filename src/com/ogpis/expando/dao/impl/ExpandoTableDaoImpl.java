package com.ogpis.expando.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.expando.dao.ClassNameDao;
import com.ogpis.expando.dao.ExpandoTableDao;
import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.entity.ExpandoTable;

@Repository
public class ExpandoTableDaoImpl extends BaseDaoImpl<ExpandoTable, String>
		implements ExpandoTableDao {

	@Resource
	private ClassNameDao classNameDao;

	@Override
	protected Class<ExpandoTable> getEntityClass() {
		return ExpandoTable.class;
	}

	@Override
	public ExpandoTable addTable(ClassName className, String tableName) {
		ExpandoTable table = new ExpandoTable();
		table.setClassName(className);
		table.setName(tableName);
		this.save(table);
		return table;
	}

	@Override
	public List<ExpandoTable> findByClassName(String className) {
		String hql = "from ExpandoTable where className.className=?";
		List<String> params = new ArrayList<String>();
		params.add(className);
		return this.queryByHql(hql, params);
	}

	@Override
	public ExpandoTable findByC_T(String className, String tableName) {
		String hql = "from ExpandoTable where className.className=? and name=? ";
		ExpandoTable expandoTable = (ExpandoTable) this.findUnique(hql,
				className, tableName);
		if (expandoTable == null) {
			// 抛出异常
		}
		return expandoTable;
	}
}
