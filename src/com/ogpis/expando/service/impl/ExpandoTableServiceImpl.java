package com.ogpis.expando.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.expando.dao.ExpandoColumnDao;
import com.ogpis.expando.dao.ExpandoTableDao;
import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.service.ClassNameService;
import com.ogpis.expando.service.ExpandoTableService;
import com.ogpis.plan.entity.NationalPlanData;

@Service
public class ExpandoTableServiceImpl extends
		BaseServiceImpl<ExpandoTable, String> implements ExpandoTableService {

	/**
	 * 添加默认扩展表
	 * @param className 类名
	 * @return
	 */
	protected ExpandoTable addDefaultTable(String className) {
		ClassName cn = classNameService.findByClassName(className);
		return getExpandoTableDao().addTable(cn,
				ExpandoTable.DEFAULT_TABLE_NAME);
	}

	@Override
	public ExpandoTable addTable(String className, String tableName) {
		ClassName cn = classNameService.findByClassName(className);
		return getExpandoTableDao().addTable(cn, tableName);
	}

	@Override
	public List<ExpandoTable> getTables(String className) {
		return getExpandoTableDao().findByClassName(className);
	}

	@Override
	public ExpandoTable getTable(String className, String tableName) {
		return getExpandoTableDao().findByC_T(className, tableName);
	}

	@Override
	public ExpandoTable getDefaultTable(String className) {
		ExpandoTable table = getExpandoTableDao().findByC_T(className,
				ExpandoTable.DEFAULT_TABLE_NAME);
		// 如果没有默认扩展表，则新建一个
		if (table == null) {
			table = this.addDefaultTable(className);
		}
		return table;
	}

	@Resource
	private ClassNameService classNameService;

	@Autowired
	protected void setExpandoTableDao(ExpandoTableDao expandoTableDao) {
		setBaseDao(expandoTableDao);
	}

	protected ExpandoTableDao getExpandoTableDao() {
		return (ExpandoTableDao) this.baseDao;
	}

}
