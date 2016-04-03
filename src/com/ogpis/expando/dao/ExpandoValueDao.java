package com.ogpis.expando.dao;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.entity.ExpandoColumn;
import com.ogpis.expando.entity.ExpandoRow;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.entity.ExpandoValue;

public interface ExpandoValueDao extends BaseDao<ExpandoValue, String> {

	public ExpandoValue findByC_R(ExpandoColumn column, ExpandoRow row);

	public ExpandoValue addValue(ClassName className, ExpandoTable table,
			ExpandoColumn column, String classPK, String data);

}
