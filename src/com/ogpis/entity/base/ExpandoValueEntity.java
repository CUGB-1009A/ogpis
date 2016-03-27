package com.ogpis.entity.base;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.entity.ClassName;
import com.ogpis.entity.ExpandoColumn;
import com.ogpis.entity.ExpandoRow;
import com.ogpis.entity.ExpandoTable;

@MappedSuperclass
public class ExpandoValueEntity extends BaseEntity {

	/**
	 * 对应扩展表
	 */
	@ManyToOne
	@JoinColumn(name = "table_id")
	private ExpandoTable table;
	/**
	 * 对应扩展列
	 */
	@ManyToOne
	@JoinColumn(name = "column_id")
	private ExpandoColumn column;
	/**
	 * 对应扩展行
	 */
	@ManyToOne
	@JoinColumn(name = "row_id")
	private ExpandoRow row;
	/**
	 * 扩展的类的ID
	 */
	@ManyToOne
	@JoinColumn(name = "classname_id")
	private ClassName className;
	/**
	 * 扩展的类的实例的唯一标示
	 */
	private String classPK;
	/**
	 * 扩展的数据
	 */
	private String data;

	public ExpandoTable getTable() {
		return table;
	}

	public void setTable(ExpandoTable table) {
		this.table = table;
	}

	public ExpandoColumn getColumn() {
		return column;
	}

	public void setColumn(ExpandoColumn column) {
		this.column = column;
	}

	public ExpandoRow getRow() {
		return row;
	}

	public void setRow(ExpandoRow row) {
		this.row = row;
	}

	public ClassName getClassName() {
		return className;
	}

	public void setClassName(ClassName className) {
		this.className = className;
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
