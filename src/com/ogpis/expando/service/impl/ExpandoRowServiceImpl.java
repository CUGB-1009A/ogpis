package com.ogpis.expando.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.expando.dao.ExpandoRowDao;
import com.ogpis.expando.entity.ExpandoRow;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.service.ExpandoRowService;

@Service
public class ExpandoRowServiceImpl extends BaseServiceImpl<ExpandoRow, String>
		implements ExpandoRowService {

	@Autowired
	protected void setExpandoRowDao(ExpandoRowDao expandoRowDao) {
		setBaseDao(expandoRowDao);
	}

	protected ExpandoRowDao getExpandoRowDao() {
		return (ExpandoRowDao) this.baseDao;
	}

	@Override
	public ExpandoRow getRow(String tableId, String classPK) {
		return getExpandoRowDao().findByT_C(tableId, classPK);
	}

	@Override
	public List<ExpandoRow> getRows(String tableId) {
		return getExpandoRowDao().findByTableId(tableId);
	}

	@Override
	public ExpandoRow addRow(ExpandoTable table, String classPK) {
		return getExpandoRowDao().addRow(table, classPK);
	}
}
