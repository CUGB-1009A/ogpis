package com.ogpis.expando.service;

import java.util.List;

import com.ogpis.base.service.BaseService;
import com.ogpis.expando.entity.ExpandoColumn;
import com.ogpis.expando.entity.ExpandoTable;

public interface ExpandoColumnService extends
		BaseService<ExpandoColumn, String> {

	/**
	 * 添加扩展列
	 * @param table 扩展表
	 * @param name 列名
	 * @param type 列字段类型
	 * @param defalutData 默认值
	 * @return
	 */
	public ExpandoColumn addColumn(ExpandoTable table, String name,
			String type, String defalutData);
	
	/**
	 * 根据扩展表ID查找扩展列集合
	 * @param tableId 扩展表ID
	 * @return
	 */
	public List<ExpandoColumn> getColumns(String tableId);
	
	/**
	 * 查找扩展列
	 * @param tableId 扩展表ID
	 * @param columnName 列名
	 * @return
	 */
	public ExpandoColumn getColumn(String tableId, String columnName);

	

	
}
