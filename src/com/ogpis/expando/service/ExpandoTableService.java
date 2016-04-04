package com.ogpis.expando.service;

import java.util.List;

import com.ogpis.base.service.BaseService;
import com.ogpis.expando.entity.ExpandoTable;

public interface ExpandoTableService extends BaseService<ExpandoTable, String> {

	/**
	 * 添加扩展表
	 * @param className 类名
	 * @param tableName 扩展表名
	 * @return
	 */
	public ExpandoTable addTable(String className, String tableName);
	
	/**
	 * 获得默认扩展表， 如果没有默认扩展表，则新建一个
	 * @param className 类名
	 * @return
	 */
	public ExpandoTable getDefaultTable(String className);
	
	/**
	 * 获得扩展表
	 * @param className 类名
	 * @param tableName 扩展表名
	 * @return
	 */
	public ExpandoTable getTable(String tableName, String className);
	
	/**
	 * 获得某类对应的扩展表集合
	 * @param className 类名
	 * @return
	 */
	public List<ExpandoTable> getTables(String className);

}
