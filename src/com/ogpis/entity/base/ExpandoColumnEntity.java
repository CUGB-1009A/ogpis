package com.ogpis.entity.base;

import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;

@MappedSuperclass
public class ExpandoColumnEntity extends BaseEntity {

	/**
	 * 对应扩展表的ID
	 */
	private String tableId;
	/**
	 * 扩展列的名称
	 */
	private String name;
	/**
	 * 字段类型
	 */
	private String type;
	/**
	 * 默认值
	 */
	private String defalutData;

	public String getTableId() {
		return tableId;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDefalutData() {
		return defalutData;
	}

	public void setDefalutData(String defalutData) {
		this.defalutData = defalutData;
	}

}
