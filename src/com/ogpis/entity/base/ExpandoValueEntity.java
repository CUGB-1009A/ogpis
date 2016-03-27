package com.ogpis.entity.base;

import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;

@MappedSuperclass
public class ExpandoValueEntity extends BaseEntity {

	/**
	 * 对应扩展表ID
	 */
	private String tableId;
	/**
	 * 对应扩展列ID
	 */
	private String columnId;
	/**
	 * 对应扩展行ID
	 */
	private String rowId;
	/**
	 * 扩展的类的ID
	 */
	private String classNameId;
	/**
	 * 扩展的类的实例的唯一标示
	 */
	private String classPK;
	/**
	 * 扩展的数据
	 */
	private String data;

	public String getTableId() {
		return tableId;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	public String getColumnId() {
		return columnId;
	}

	public void setColumnId(String columnId) {
		this.columnId = columnId;
	}

	public String getRowId() {
		return rowId;
	}

	public void setRowId(String rowId) {
		this.rowId = rowId;
	}

	public String getClassNameId() {
		return classNameId;
	}

	public void setClassNameId(String classNameId) {
		this.classNameId = classNameId;
	}

	public String getClassPK() {
		return classPK;
	}

	public void setClassPK(String classPK) {
		this.classPK = classPK;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

}
