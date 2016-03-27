package com.ogpis.entity.base;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.entity.ClassName;

@MappedSuperclass
public class ExpandoTableEntity extends BaseEntity {

	/**
	 * 对应类的ID
	 */
	@ManyToOne
	@JoinColumn(name="classname_id")
	private ClassName className;
	/**
	 * 扩展表的名称
	 */
	private String name;

	public ClassName getClassName() {
		return className;
	}

	public void setClassName(ClassName className) {
		this.className = className;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
