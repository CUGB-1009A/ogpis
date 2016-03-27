package com.ogpis.entity.base;

import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;

@MappedSuperclass
public class ExpandoRowEntity extends BaseEntity {

	/**
	 * 对应扩展表的ID
	 */
	private String tableId;
	/**
	 * 扩展的数据的唯一标示
	 */
	private String classPK;

	public String getTableId() {
		return tableId;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	public String getClassPK() {
		return classPK;
	}

	public void setClassPK(String classPK) {
		this.classPK = classPK;
	}

}
