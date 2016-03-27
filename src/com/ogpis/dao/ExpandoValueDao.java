package com.ogpis.dao;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.entity.ClassName;
import com.ogpis.entity.ExpandoColumn;
import com.ogpis.entity.ExpandoRow;
import com.ogpis.entity.ExpandoTable;
import com.ogpis.entity.ExpandoValue;

public interface ExpandoValueDao extends BaseDao<ExpandoValue, String> {

	public ExpandoValue findByC_R(ExpandoColumn column, ExpandoRow row);

	public ExpandoValue addValue(ClassName className, ExpandoTable table,
			ExpandoColumn column, String classPK, String data);

}
