package com.ogpis.expando.dao;

import java.util.List;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.expando.entity.ExpandoRow;
import com.ogpis.expando.entity.ExpandoTable;

public interface ExpandoRowDao extends BaseDao<ExpandoRow, String> {

	/**
	 * 添加扩展行
	 * @param table 扩展表对象
	 * @param classPK 对应的数据的唯一标示
	 * @return
	 */
	public ExpandoRow addRow(ExpandoTable table, String classPK);
	
	/**
	 * 根据扩展表ID查找扩展行集合
	 * @param tableId 扩展表ID
	 * @return
	 */
	public List<ExpandoRow> findByTableId(String tableId);

	/**
	 * 根据扩展表ID和对应的数据的唯一标示查找扩展行
	 * @param tableId 扩展表ID
	 * @param classPK 对应的数据的唯一标示
	 * @return
	 */
	public ExpandoRow findByT_C(String tableId, String classPK);
}
