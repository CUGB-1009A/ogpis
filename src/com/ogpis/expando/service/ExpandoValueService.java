package com.ogpis.expando.service;

import java.util.List;
import java.util.Map;

import com.ogpis.base.service.BaseService;
import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.entity.ExpandoColumn;
import com.ogpis.expando.entity.ExpandoRow;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.entity.ExpandoValue;

public interface ExpandoValueService extends BaseService<ExpandoValue, String> {

	/**
	 * 添加扩展值
	 * 
	 * @param className
	 *            对应类
	 * @param table
	 *            对应扩展表
	 * @param column
	 *            对应扩展列
	 * @param classPK
	 *            对应数据的唯一标示
	 * @param data
	 *            值
	 * @return
	 */
	public ExpandoValue addValue(ClassName className, ExpandoTable table,
			ExpandoColumn column, String classPK, String data);

	/**
	 * 获得扩展值
	 * 
	 * @param tableId
	 *            对应扩展表ID
	 * @param columnId
	 *            对应扩展列ID
	 * @param classPK
	 *            对应数据的唯一标示
	 * @return
	 */
	public ExpandoValue getValue(String tableId, String columnId, String classPK);

	/**
	 * 根据扩展表ID和对应数据的唯一标示查找扩展值集合
	 * 
	 * @param tableId
	 *            对应扩展表ID
	 * @param classPK
	 *            对应数据的唯一标示
	 * @return
	 */
	public List<ExpandoValue> getRowValues(String tableId, String classPK);

	public void addValues(ClassName className, ExpandoTable table,
			List<ExpandoColumn> columns, String classPK,
			Map<String, String> data);

}
