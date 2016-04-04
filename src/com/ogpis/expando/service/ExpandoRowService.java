package com.ogpis.expando.service;

import java.util.List;

import com.ogpis.base.service.BaseService;
import com.ogpis.expando.entity.ExpandoRow;
import com.ogpis.expando.entity.ExpandoTable;

public interface ExpandoRowService extends BaseService<ExpandoRow, String> {

	/**
	 * 添加扩展行
	 * @param table 扩展表对象
	 * @param classPK 对应的数据的唯一标示
	 * @return
	 */
	public ExpandoRow addRow(ExpandoTable table, String classPK);
	
	/**
	 * 查找扩展行
	 * @param tableId 扩展表ID
	 * @param classPK 对应的数据的唯一标示
	 * @return
	 */
	public ExpandoRow getRow(String tableName, String classPK);

	/**
	 * 查找扩展行集合
	 * @param tableId 扩展表ID
	 * @return
	 */
	public List<ExpandoRow> getRows(String tableId);
}
