package com.ogpis.expando.entity.base;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.expando.entity.ExpandoTable;

@MappedSuperclass
public class ExpandoColumnEntity extends BaseEntity {

	/**
	 * 对应扩展表的ID
	 */
	@ManyToOne
	@JoinColumn(name = "table_id")
	private ExpandoTable table;
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

	public ExpandoTable getTable() {
		return table;
	}

	public void setTable(ExpandoTable table) {
		this.table = table;
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
