package com.ogpis.entity.base;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.entity.ExpandoTable;

@MappedSuperclass
public class ExpandoRowEntity extends BaseEntity {

	/**
	 * 对应扩展表的ID
	 */
	@ManyToOne
	@JoinColumn(name = "table_id")
	private ExpandoTable table;
	/**
	 * 扩展的数据的唯一标示
	 */
	private String classPK;

	public ExpandoTable getTable() {
		return table;
	}

	public void setTable(ExpandoTable table) {
		this.table = table;
	}

	public String getClassPK() {
		return classPK;
	}

	public void setClassPK(String classPK) {
		this.classPK = classPK;
	}

}
