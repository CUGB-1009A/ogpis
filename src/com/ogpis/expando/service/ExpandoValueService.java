package com.ogpis.expando.service;

import com.ogpis.base.service.BaseService;
import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.entity.ExpandoColumn;
import com.ogpis.expando.entity.ExpandoRow;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.entity.ExpandoValue;

public interface ExpandoValueService extends BaseService<ExpandoValue, String> {

	public ExpandoValue findByC_R(ExpandoColumn column, ExpandoRow row);

	public ExpandoValue addValue(ClassName className, ExpandoTable table,
			ExpandoColumn column, String classPK, String data);
}
